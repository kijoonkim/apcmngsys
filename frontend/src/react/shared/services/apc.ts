import { getJSON, postJSON } from '../lib/http';

export type ApcItem = {
  APC_NM: string;
  APC_CD: string;
  NH: 'Y' | 'N';
  XCRD: string;
  YCRD: string;
  WGH_AGT_INSTL_YN?: 'Y' | 'N';
  SORT_AGT_INSTL_YN?: 'Y' | 'N';
  WRHS_ACTVTN_YN?: 'Y' | 'N';
  SORT_ACTVTN_YN?: 'Y' | 'N';
  SPMT_ACTVTN_YN?: 'Y' | 'N';
  INVNTR_ACTVTN_YN?: 'Y' | 'N';
  AGRC_ACTVTN_YN?: 'Y' | 'N';
  CLCLN_ACTVTN_YN?: 'Y' | 'N';
  DEL_YN?: 'Y' | 'N';
  WGH_LAST_USE_DT?: string;
  WRHS_LAST_USE_DT?: string;
  SORT_LAST_USE_DT?: string;
  PCKG_LAST_USE_DT?: string;
  SPMT_LAST_USE_DT?: string;
  ORDR_LAST_USE_DT?: string;
  CLCLN_LAST_USE_DT?: string;
  AGRC_LAST_USE_DT?: string;
  INVNTR_LAST_USE_DT?: string;
};

export type ApcStatusDto = {
  result: { resultLists: ApcItem[] };
};

export type OneYearStatsResult = {
  result: {
    SEARCH_YMD_FROM: string;
    SEARCH_YMD_TO: string;
    RESULTS: Array<{ RS_TYPE: 'WRHS' | 'SORT' | 'WGH'; [k: `C_${number}`]: number }>;
  };
};

export function latestDate(dates: (string | undefined | null)[]): string {
  const ds = dates.filter(Boolean) as string[];
  if (!ds.length) return '미사용';
  const max = ds.map((d) => new Date(d)).reduce((a, b) => (a > b ? a : b));
  return max.toISOString().slice(0, 10);
}

export async function getApcAgtStatus() {
  const dto = await getJSON<ApcStatusDto>('/co/user/getApcAgtStats.do');
  const apcLists = dto.result.resultLists.map((item) => {
    const kinds = [];
    if (item.WGH_AGT_INSTL_YN != null)
      kinds.push({ name: '계량', value: item.WGH_AGT_INSTL_YN === 'Y' ? 'active' : '' });
    if (item.SORT_AGT_INSTL_YN != null)
      kinds.push({ name: '선별', value: item.SORT_AGT_INSTL_YN === 'Y' ? 'active' : '' });

    return {
      name: item.APC_NM,
      value: item.APC_CD,
      nh: item.NH === 'Y',
      cx: item.XCRD,
      cy: item.YCRD,
      kinds,
      status: [
        { name: '입고', value: item.WRHS_ACTVTN_YN === 'Y' ? 'active' : '' },
        { name: '선별', value: item.SORT_ACTVTN_YN === 'Y' ? 'active' : '' },
        { name: '출고', value: item.SPMT_ACTVTN_YN === 'Y' ? 'active' : '' },
        { name: '재고', value: item.INVNTR_ACTVTN_YN === 'Y' ? 'active' : '' },
        { name: '영농', value: item.AGRC_ACTVTN_YN === 'Y' ? 'active' : '' },
        { name: '정산', value: item.CLCLN_ACTVTN_YN === 'Y' ? 'active' : '' },
      ],
      delYn: item.DEL_YN,
      rcntData: latestDate([
        item.WGH_LAST_USE_DT,
        item.WRHS_LAST_USE_DT,
        item.SORT_LAST_USE_DT,
        item.PCKG_LAST_USE_DT,
        item.SPMT_LAST_USE_DT,
        item.ORDR_LAST_USE_DT,
        item.CLCLN_LAST_USE_DT,
        item.AGRC_LAST_USE_DT,
        item.INVNTR_LAST_USE_DT,
      ]),
      useData: [
        { name: 'wgh', value: item.WGH_LAST_USE_DT || '미사용' },
        { name: 'wrhs', value: item.WRHS_LAST_USE_DT || '미사용' },
        { name: 'sort', value: item.SORT_LAST_USE_DT || '미사용' },
        { name: 'pckg', value: item.PCKG_LAST_USE_DT || '미사용' },
        { name: 'spmt', value: item.SPMT_LAST_USE_DT || '미사용' },
        { name: 'ordr', value: item.ORDR_LAST_USE_DT || '미사용' },
        { name: 'clcln', value: item.CLCLN_LAST_USE_DT || '미사용' },
        { name: 'agrc', value: item.AGRC_LAST_USE_DT || '미사용' },
        { name: 'invntr', value: item.INVNTR_LAST_USE_DT || '미사용' },
      ],
    };
  });

  // 요약치 계산은 여기서 리턴
  const fcltCount = apcLists.reduce((sum, i) => sum + i.kinds.length, 0);
  const oprtngFcltCount = apcLists.reduce(
    (sum, i) => sum + i.kinds.filter((k) => k.value === 'active').length,
    0,
  );
  const apcCount = apcLists.filter((i) => i.delYn === 'N').length;
  const oprtngRate = fcltCount ? Number(((oprtngFcltCount / fcltCount) * 100).toFixed(1)) : 0;

  return { apcLists, summary: { fcltCount, oprtngRate, apcCount } };
}

export async function getApcLinkList(apcCd: string) {
  const dto = await postJSON<{ resultList: any[] }>('/co/user/selectApcLinkTrsmMatSttsList.do', {
    apcCd,
  });
  return dto.resultList;
}

export async function getCountAllPrdcr() {
  const dto = await getJSON<{ result: number }>('/co/user/getCountAllPrdcr.do');
  return dto.result;
}

export async function getStatsForOneYearBySearchYmd() {
  const dto = await getJSON<OneYearStatsResult>('/co/user/getStatsForOneYearBySearchYmd.do');

  // 원래 jQuery 코드의 시계열 변환만 수행해서 반환
  const values: Array<{ y: string; wrhs?: number; sort?: number; wgh?: number }> = [];
  const fromY = +dto.result.SEARCH_YMD_FROM.slice(0, 4);
  const toY = +dto.result.SEARCH_YMD_TO.slice(0, 4);
  const fromM = +dto.result.SEARCH_YMD_FROM.slice(4, 6);
  const toM = +dto.result.SEARCH_YMD_TO.slice(4, 6);

  let year = fromY;
  for (let m = fromM; year < toY || m <= toM; m++) {
    if (m === 13) {
      m = 1;
      year++;
    }
    values.push({ y: `${year}-${String(m).padStart(2, '0')}` });
  }

  dto.result.RESULTS.forEach((row) => {
    values.forEach((v, idxFromEnd) => {
      const i = values.length - (idxFromEnd + 1);
      const key = `C_${idxFromEnd}` as const;
      const val = (row as any)[key];
      if (row.RS_TYPE === 'WRHS') v.wrhs = val;
      if (row.RS_TYPE === 'SORT') v.sort = val;
      if (row.RS_TYPE === 'WGH') v.wgh = val;
    });
  });

  // 차트 라이브러리는 React 컴포넌트에서 선택해서 사용
  return {
    seriesForApex: [
      { name: '입고', data: values.map((v) => ({ x: v.y, y: v.wrhs ?? 0 })) },
      { name: '선별', data: values.map((v) => ({ x: v.y, y: v.sort ?? 0 })) },
      { name: '계량', data: values.map((v) => ({ x: v.y, y: v.wgh ?? 0 })) },
    ],
    categories: values.map((v) => v.y),
    raw: values,
  };
}
