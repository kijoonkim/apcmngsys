/**
 * 상품발주관리 - 엑셀 업로드
 * 1. 한글 헤더 매칭
 * 2. 스네이크 케이스 → 카멜 케이스 변환
 * 3. 로딩 처리 추가
 */

import React, { useState, useRef, useEffect, useMemo } from 'react';
import { AgGridReact } from 'ag-grid-react';
import * as XLSX from 'xlsx';
import { parse as parseHTML } from 'node-html-parser';
import { DatesProvider, DatePickerInput } from '@mantine/dates';
import { MantineProvider, Tabs, Stack, Paper, Text, ActionIcon, Group, Badge } from '@mantine/core';
import { IconX, IconUpload, IconFile } from '@tabler/icons-react';
import { Dropzone } from '@mantine/dropzone';
import Swal from 'sweetalert2';
import '@mantine/core/styles.css';
import '@mantine/dates/styles.css';
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-alpine.css';
import { Autocomplete } from '@mantine/core';
// AG Grid v34+ 스타일
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-quartz.css';
import { gfn_getCnpts, gfn_getComCds } from '@/common/common';
import { Select } from '@mantine/core';
import { IconCalendar } from '@tabler/icons-react';
import 'dayjs/locale/ko';
import { gfn_dateToYmd, gfn_getDateTime } from '@/common/comDate';
import { gfn_postJSON } from '@shared/utils/http-enhanced';
import { postJSON } from '@lib/http';

interface OrderRecord {
  outordrno?: string; // OUTORDRNO
  mrktWrhsType?: string; // MRKT_WRHS_TYPE
  mrktWrhsTypeNm?: string; // MRKT_WRHS_TYPE_NM
  mrktGdsCd?: string; // MRKT_GDS_CD
  mrktGdsNm?: string; // MRKT_GDS_NM
  otptNm?: string; // OTPT_NM
  cntrNm?: string; // CNTR_NM
  wrhsYmd?: string; // WRHS_YMD
  outordrYmd?: string; // OUTORDR_YMD
  outordrQntt?: number; // OUTORDR_QNTT
  cfmtnQntt?: number; // CFMTN_QNTT
  wrhsQntt?: number; // WRHS_QNTT
  prchsTypeCd?: string; // PRCHS_TYPE_CD
  exmptnYn?: string; // EXMPTN_YN
  prdctnYr?: string; // PRDCTN_YR
  mnftrYmd?: string; // MNFTR_YMD
  pieceUntprc?: number; // PIECE_UNTPRC
  txamt?: number; // TXAMT
  outordrAmt?: number; // OUTORDR_AMT
  wrhsAmt?: number; // WRHS_AMT
  failMsg?: string; // 실패 메시지
}
const reverseHeaderMapping: Record<string, string> = {
  outordrno: '발주번호',
  mrktWrhsType: '발주유형',
  mrktWrhsTypeNm: '발주현황',
  mrktGdsCd: 'SKU ID',
  mrktGdsNm: 'SKU 이름',
  otptNm: 'SKU Barcode',
  cntrNm: '물류센터',
  wrhsYmd: '입고예정일',
  outordrYmd: '발주일',
  outordrQntt: '발주수량',
  cfmtnQntt: '확정수량',
  wrhsQntt: '입고수량',
  prchsTypeCd: '매입유형',
  exmptnYn: '면세여부',
  prdctnYr: '생산연도',
  mnftrYmd: '제조일자',
  pieceUntprc: '공급가',
  txamt: '부가세',
  outordrAmt: '총발주 매입금',
  wrhsAmt: '입고금액',
};

// ============================================================================
// 벤더 감지 관련 타입 및 상수
// ============================================================================
type Vendor = 'SHINSEGAE' | 'COUPANG' | 'LOTTE' | 'UNKNOWN';
type SubVendor =
  | 'NOBRAND'
  | 'EMART'
  | 'TRADERS'
  | 'EVERYDAY' // 신세계 계열
  | 'COUPANG' // 쿠팡
  | 'LOTTE_MART'
  | 'LOTTE_SUPER' // 롯데 계열
  | null;

interface VendorSignature {
  vendor: Vendor;
  keyHeaders: string[];
  headerCount: number;
}

const VENDOR_SIGNATURES: VendorSignature[] = [
  {
    vendor: 'SHINSEGAE',
    keyHeaders: ['발주일자', '업체코드', '센터입하일자', '센터코드'],
    headerCount: 27,
  },
  {
    vendor: 'COUPANG',
    keyHeaders: ['발주번호', '물류센터', '회송담당자', 'Xdock'],
    headerCount: 23,
  },
  {
    vendor: 'LOTTE',
    keyHeaders: ['센터명', '센터코드', '점포명', '점포코드', '전표번호'],
    headerCount: 17,
  },
];

// ============================================================================
// 벤더별 세부벤더 옵션
// ============================================================================
const SUB_VENDOR_OPTIONS: Record<Vendor, { value: SubVendor; label: string }[]> = {
  SHINSEGAE: [
    { value: 'NOBRAND', label: '노브랜드', initial: 'SSG' },
    { value: 'EMART', label: '이마트', initial: 'SSG' },
    { value: 'TRADERS', label: '트레이더스', initial: 'SSG' },
    { value: 'EVERYDAY', label: '에브리데이', initial: 'SSG' },
  ],
  COUPANG: [{ value: 'COUPANG', label: '쿠팡', initial: 'CPNG' }],
  LOTTE: [
    { value: 'LOTTE_MART', label: '롯데마트', initial: 'LT' },
    { value: 'LOTTE_SUPER', label: '롯데슈퍼', initial: 'LT' },
  ],
  UNKNOWN: [],
};

// 세부벤더 Badge 색상
const SUB_VENDOR_COLORS: Record<string, string> = {
  NOBRAND: 'yellow',
  EMART: 'blue',
  TRADERS: 'indigo',
  EVERYDAY: 'cyan',
  COUPANG: 'orange',
  LOTTE_MART: 'pink',
  LOTTE_SUPER: 'red',
};

// ============================================================================
// 롯데 한글 헤더 → 카멜케이스 매핑
// ============================================================================
const LOTTE_HEADER_MAPPING: Record<string, string> = {
  센터명: 'cntrNm',
  센터코드: 'cntrCd',
  점포명: 'storNm',
  점포코드: 'storCd',
  주문일: 'outordrYmd',
  전표번호: 'outordrno',
  센터입하일: 'cntrWrhsYmd',
  점입하일: 'storWrhsYmd',
  배송구분: 'dlvrType',
  상품코드: 'mrktGdsCd',
  판매코드: 'mrktNtslCd',
  상품명: 'mrktGdsNm',
  입수: 'pieceQntt',
  단위: 'outordrUnit',
  주문수: 'outordrQntt',
  단가: 'outordrUntprc',
  주문금액: 'outordrAmt',
};
const SSG_HEADER_MAPPING: Record<string, string> = {
  발주일자: 'outordrYmd',
  업체코드: 'coCd',
  업체명: 'coNm',
  점포코드: 'storCd',
  점포명: 'storNm',
  상품코드: 'mrktGdsCd',
  상품명: 'mrktGdsNm',
  발주원가: 'outordrUntprc',
  발주단위: 'ordrUnitQntt',
  LOT: 'bndlNo',
  수량: 'outordrQntt',
  발주금액: 'outordrAmt',
  문서번호: 'outordrno',
  바이어명: 'ordrr',
  센터입하일자: 'cntrWrhsYmd',
  센터코드: 'cntrCd',
  센터이름: 'cntrNm',
  점입점일자: 'storWrhsYmd',
  납품구분: 'dlvrType',
  '기타(점코드)': 'etcMttr',
  '기타(점포명)': 'etcDtlCn',
};
const COUPANG_HEADER_MAPPING: Record<string, string> = {
  발주번호: 'outordrno',
  물류센터: 'cntrNm',
  입고유형: 'mrktWrhsType',
  발주상태: 'sttsCdNm',
  상품번호: 'mrktGdsCd',
  상품바코드: 'otptNm',
  상품이름: 'mrktGdsNm',
  발주수량: 'outordrQntt',
  확정수량: 'cfmtnQntt',
  '유통(소비)기한': 'rtlTermYmd',
  제조일자: 'mnftrYmd',
  생산년도: 'prdctnYr',
  납품부족사유: 'etcRsn',
  회송담당자: 'addrseNm',
  회송담당자연락처: 'addrseTelno',
  회송지주소: 'addrseAddr',
  매입가: 'outordrUntprc',
  공급가: 'splyPrc',
  부가세: 'txamt',
  총발주: 'outordrAmt',
  매입금: 'prchsAmt',
  입고예정일: 'storWrhsYmd',
  발주등록일시: 'outordrYmd',
  Xdock: 'drctDlvrYn',
};

// 벤더별 헤더 매핑
const HEADER_MAPPING: Record<Vendor, Record<string, string>> = {
  LOTTE: LOTTE_HEADER_MAPPING,
  SHINSEGAE: SSG_HEADER_MAPPING,
  COUPANG: COUPANG_HEADER_MAPPING,
  UNKNOWN: {},
};

/**
 * 헤더 패턴으로 벤더 자동 감지
 */
const detectVendor = (headers: string[]): Vendor => {
  for (const signature of VENDOR_SIGNATURES) {
    // 1차: 헤더 개수 체크 (±2 허용)
    if (Math.abs(headers.length - signature.headerCount) > 2) continue;

    // 2차: 핵심 헤더 존재 여부 체크
    const matchCount = signature.keyHeaders.filter((keyHeader) =>
      headers.some((h) => h === keyHeader),
    ).length;

    // 핵심 헤더의 75% 이상 매칭되면 해당 벤더로 판정
    if (matchCount >= signature.keyHeaders.length * 0.75) {
      return signature.vendor;
    }
  }

  return 'UNKNOWN';
};

/**
 * HTML 엑셀 파싱 (롯데 계열)
 * - 상단 불필요 행 자동 제거
 * - colspan이 없는 첫 번째 행을 헤더로 인식
 */
const parseHTMLExcel = (htmlContent: string): { headers: string[]; data: any[][] } => {
  const root = parseHTML(htmlContent);
  const table = root.querySelector('table');

  if (!table) {
    throw new Error('테이블을 찾을 수 없습니다.');
  }

  const rows = table.querySelectorAll('tr');

  // 헤더 행 찾기: colspan이 없고 셀 개수가 많은 첫 번째 행
  let headerRowIndex = -1;
  for (let i = 0; i < rows.length; i++) {
    const cells = rows[i].querySelectorAll('td, th');
    const hasColspan = Array.from(cells).some(
      (cell) => cell.getAttribute('colspan') && cell.getAttribute('colspan') !== '1',
    );

    if (!hasColspan && cells.length >= 8) {
      headerRowIndex = i;
      break;
    }
  }

  if (headerRowIndex === -1) {
    throw new Error('헤더 행을 찾을 수 없습니다.');
  }

  // 헤더 추출
  const headerCells = rows[headerRowIndex].querySelectorAll('td, th');
  const headers = Array.from(headerCells).map((cell) => cell.text.trim());

  // 데이터 행 추출 (헤더 다음 행부터)
  const data: any[][] = [];
  for (let i = headerRowIndex + 1; i < rows.length; i++) {
    const cells = rows[i].querySelectorAll('td, th');
    const hasColspan = Array.from(cells).some(
      (cell) => cell.getAttribute('colspan') && cell.getAttribute('colspan') !== '1',
    );

    // colspan이 없고 헤더와 컬럼 수가 같은 행만 추출
    if (!hasColspan && cells.length === headers.length) {
      const rowData = Array.from(cells).map((cell) => cell.text.trim());
      data.push(rowData);
    }
  }

  return { headers, data };
};

/**
 * XLSX 파일 파싱 (자동 헤더 행 감지)
 */
const parseXLSXFile = (file: File): Promise<{ headers: string[]; data: any[][] }> => {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();

    reader.onload = (e) => {
      try {
        const data = new Uint8Array(e.target?.result as ArrayBuffer);
        const workbook = XLSX.read(data, { type: 'array' });
        const worksheet = workbook.Sheets[workbook.SheetNames[0]];
        const jsonData = XLSX.utils.sheet_to_json(worksheet, {
          header: 1,
          defval: '',
        }) as any[][];

        // 헤더 행 자동 감지 (비어있지 않은 셀이 5개 이상인 첫 행)
        let headerRowIndex = -1;
        for (let i = 0; i < Math.min(10, jsonData.length); i++) {
          const row = jsonData[i];
          const nonEmptyCells = row.filter(
            (cell) => cell !== undefined && cell !== null && cell !== '',
          );
          if (nonEmptyCells.length >= 5) {
            headerRowIndex = i;
            break;
          }
        }

        if (headerRowIndex === -1) {
          reject(new Error('헤더 행을 찾을 수 없습니다.'));
          return;
        }

        const headers = jsonData[headerRowIndex];
        const dataRows = jsonData
          .slice(headerRowIndex + 1)
          .filter((row) => row.some((cell) => cell !== undefined && cell !== null && cell !== ''));

        resolve({ headers, data: dataRows });
      } catch (error) {
        reject(error);
      }
    };

    reader.onerror = () => reject(new Error('파일 읽기 실패'));
    reader.readAsArrayBuffer(file);
  });
};

/**
 * HTML 파일 파싱 (래퍼)
 */
const parseHTMLFile = (file: File): Promise<{ headers: string[]; data: any[][] }> => {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();

    reader.onload = (e) => {
      try {
        const htmlContent = e.target?.result as string;
        const result = parseHTMLExcel(htmlContent);
        resolve(result);
      } catch (error) {
        reject(error);
      }
    };

    reader.onerror = () => reject(new Error('파일 읽기 실패'));
    reader.readAsText(file);
  });
};

/**
 * 엑셀 탭 인터페이스
 */
interface ExcelTab {
  id: string;
  fileName: string;
  vendor: Vendor;
  subVendor: SubVendor;
  lgszMrktCd: string | null; // 대형시장코드
  initial: string | null; // 벤더 이니셜 (SSG, CPNG, LT)
  data: any[];
  columns: any[];
  isSaved: boolean; // 저장 완료 여부
  failCount: number; // 실패 건수
}

/**
 * 주문 APC 상품 인터페이스
 */
interface OrdrApcGds {
  ordrApcCd: string;
  lgszMrktCd: string;
  mrktGdsCd: string;
  mrktGdsNm: string;
  useYn: string;
}

/**
 * 대형시장코드별로 그룹화된 상품 맵
 * key: lgszMrktCd (대형시장코드)
 * value: 해당 시장의 상품 배열
 */
type GdsByMarketMap = Map<string, OrdrApcGds[]>;

/**
 * 상품 Select 옵션
 */
interface GdsSelectOption {
  value: string; // mrktGdsCd
  label: string; // mrktGdsNm
}

const App: React.FC = ({ apcCd, apcNm, sysPrgrmId }) => {
  const [rowData, setRowData] = useState<OrderRecord[]>([]);
  const fileInputRef = useRef<HTMLInputElement>(null);

  // ========== 로딩 State 추가 ==========
  const [isLoading, setIsLoading] = useState(false);
  const [loadingMessage, setLoadingMessage] = useState('');

  /** 검색 조건 state **/
  // apcCd
  const [ordrApcCd, setOrdrApcCd] = useState(apcCd);
  // 발주번호
  const [outordrno, setOutordrno] = useState();
  // 발주일자
  const [outordrYmd, setOutordrYmd] = useState(gfn_dateToYmd(new Date()));
  // 입고예정일자
  const [wrhsYmd, setWrhsYmd] = useState();
  // 거래처
  const [cntrCd, setCntrCd] = useState<string | null>('');
  const [cntrCdList, setCntrCdList] = useState([]);
  // 상품명
  const [mrktGdsCd, setMrktGdsCd] = useState<string | null>('');
  const [mrktGdsCdList, setMrktGdsCdList] = useState([]);
  // 상품목록 원본
  const [allGdsList, setAllGdsList] = useState<OrdrApcGds[]>([]);
  // 상품목록 캐싱
  const gdsByMarketMap = useMemo<Map<string, OrdrApcGds[]>>(() => {
    const map = new Map();
    allGdsList.forEach((gds) => {
      if (gds.useYn !== 'Y') return;
      if (!map.has(gds.lgszMrktCd)) {
        map.set(gds.lgszMrktCd, []);
      }
      map.get(gds.lgszMrktCd)!.push(gds);
    });
    return map;
  }, [allGdsList]);
  // 시장물류센터 공통정보
  const [mrktLgstcsCntr, setMrktLgstcsCntr] = useState();

  //벤더사 상세 공통코드
  const [mrktComCdList, setMrktComCdList] = useState([]);
  const [lgszMrktCd, setLgszMrktCd] = useState();

  // Dropzone tabs
  const [tabs, setTabs] = useState<ExcelTab[]>([]);
  const [activeTab, setActiveTab] = useState<string | null>(null);
  const [showFailedOnly, setShowFailedOnly] = useState<Record<string, boolean>>({});
  const gridApisRef = useRef<Map<string, any>>(new Map());

  // mrktComCdList와 매핑된 세부벤더 옵션 (lgszMrktCd 포함)
  const subVendorOptionsWithCode = useMemo(() => {
    const result: Record<Vendor, { value: SubVendor; label: string; lgszMrktCd: string | null }[]> =
      {
        SHINSEGAE: [],
        COUPANG: [],
        LOTTE: [],
        UNKNOWN: [],
      };

    Object.entries(SUB_VENDOR_OPTIONS).forEach(([vendor, options]) => {
      result[vendor as Vendor] = options.map((opt) => {
        // mrktComCdList에서 label이 일치하는 항목 찾기
        const matched = mrktComCdList.find((item: any) => item.label === opt.label);
        return {
          ...opt,
          lgszMrktCd: matched?.value || null,
        };
      });
    });

    return result;
  }, [mrktComCdList]);

  // fn_init - 로딩 추가
  useEffect(() => {
    const fn_init = async () => {
      setIsLoading(true);
      setLoadingMessage('데이터를 불러오는 중...');

      try {
        const [cnpts, mrktComCd, mrktLgstcsCntr, mrktGdsCd] = await Promise.all([
          gfn_getCnpts(apcCd),
          gfn_getComCds('LGSZ_MRKT_CD'),
          postJSON('/am/ordr/selectMrktLgstcsCntrList.do', { apcCd }),
          postJSON('/am/ordr/selectMrktGdsCdList.do', { ordrApcCd }),
        ]);

        // 거래처
        if (cnpts) {
          setCntrCdList(
            cnpts.map((item) => {
              return { label: item.cnptNm, value: item.cnptCd };
            }),
          );
        }

        // 벤더사 상세 공통코드
        if (mrktComCd) {
          setMrktComCdList(mrktComCd.map((i) => ({ value: i.cdVl, label: i.cdVlNm })));
        }

        // 시장 물류센터 코드
        if (mrktLgstcsCntr) {
          setMrktLgstcsCntr(mrktLgstcsCntr.resultList);
        }

        // 상품명
        if (mrktGdsCd) {
          setAllGdsList(mrktGdsCd.resultList);
        }
      } catch (error) {
        console.error(error);
        Swal.fire('', '데이터 로딩 중 오류가 발생했습니다.', 'error');
      } finally {
        setIsLoading(false);
        setLoadingMessage('');
      }
    };
    fn_init();
  }, []);

  const handleLgszMrktChange = (lgszMrktCd: string) => {
    setCntrCd(lgszMrktCd);
    setMrktGdsCd('');

    const filterLgszMrktCd = mrktLgstcsCntr.filter((i) => {
      return i.cnptCd == lgszMrktCd;
    })[0];

    // Map에서 O(1)로 조회
    const filteredGds = gdsByMarketMap.get(filterLgszMrktCd.lgszMrktCd) || [];

    // Select 옵션으로 변환
    const options = filteredGds.map((gds) => ({
      value: gds.mrktGdsCd,
      label: gds.mrktGdsNm,
    }));

    setMrktGdsCdList(options);
  };

  // ========================================
  // 컬럼 정의 (field: 카멜케이스, headerName: 한글)
  // ========================================
  const columnDefs = [
    {
      field: 'outordrno',
      headerName: '발주번호',
      width: 100,
      editable: true,
    },
    {
      field: 'mrktWrhsType',
      headerName: '발주유형',
      width: 100,
      editable: true,
    },
    {
      field: 'mrktWrhsTypeNm',
      headerName: '발주현황',
      width: 100,
      editable: true,
    },
    {
      field: 'mrktGdsCd',
      headerName: 'SKU ID',
      width: 100,
      editable: true,
    },
    {
      field: 'mrktGdsNm',
      headerName: 'SKU 이름',
      width: 100,
      editable: true,
    },
    {
      field: 'otptNm',
      headerName: 'SKU Barcode',
      width: 100,
      editable: true,
    },
    {
      field: 'cntrNm',
      headerName: '물류센터',
      width: 100,
      editable: true,
    },
    {
      field: 'wrhsYmd',
      headerName: '입고예정일',
      width: 100,
      editable: true,
    },
    {
      field: 'outordrYmd',
      headerName: '발주일',
      width: 120,
      editable: true,
    },
    {
      field: 'outordrQntt',
      headerName: '발주수량',
      width: 100,
      type: 'numericColumn',
      editable: true,
      valueFormatter: (params) => {
        return params.value ? params.value.toLocaleString() : '';
      },
    },
    {
      field: 'cfmtnQntt',
      headerName: '확정수량',
      width: 100,
      type: 'numericColumn',
      editable: true,
      valueFormatter: (params) => {
        return params.value ? params.value.toLocaleString() : '';
      },
    },
    {
      field: 'wrhsQntt',
      headerName: '입고수량',
      width: 100,
      type: 'numericColumn',
      editable: true,
      valueFormatter: (params) => {
        return params.value ? params.value.toLocaleString() : '';
      },
    },
    {
      field: 'prchsTypeCd',
      headerName: '매입유형',
      width: 120,
      editable: true,
    },
    {
      field: 'exmptnYn',
      headerName: '면세여부',
      width: 100,
      editable: true,
    },
    {
      field: 'prdctnYr',
      headerName: '생산연도',
      width: 120,
      editable: true,
    },
    {
      field: 'mnftrYmd',
      headerName: '제조일자',
      width: 120,
      editable: true,
    },
    {
      field: 'pieceUntprc',
      headerName: '공급가',
      width: 100,
      type: 'numericColumn',
      editable: true,
      valueFormatter: (params) => {
        return params.value ? params.value.toLocaleString() : '';
      },
    },
    {
      field: 'txamt',
      headerName: '부가세',
      width: 100,
      type: 'numericColumn',
      editable: true,
      valueFormatter: (params) => {
        return params.value ? params.value.toLocaleString() : '';
      },
    },
    {
      field: 'outordrAmt',
      headerName: '총발주 매입금',
      width: 100,
      type: 'numericColumn',
      editable: true,
      valueFormatter: (params) => {
        return params.value ? params.value.toLocaleString() : '';
      },
    },
    {
      field: 'wrhsAmt',
      headerName: '입고금액',
      width: 100,
      type: 'numericColumn',
      editable: true,
      valueFormatter: (params) => {
        return params.value ? params.value.toLocaleString() : '';
      },
    },
  ];

  // ========================================
  // 한글 헤더 → 카멜케이스 field 매핑
  // ========================================
  const headerMapping: Record<string, string> = {
    발주번호: 'outordrno',
    발주유형: 'mrktWrhsType',
    발주현황: 'mrktWrhsTypeNm',
    'SKU ID': 'mrktGdsCd',
    'SKU 이름': 'mrktGdsNm',
    'SKU Barcode': 'otptNm',
    물류센터: 'cntrNm',
    입고예정일: 'wrhsYmd',
    발주일: 'outordrYmd',
    발주수량: 'outordrQntt',
    확정수량: 'cfmtnQntt',
    입고수량: 'wrhsQntt',
    매입유형: 'prchsTypeCd',
    면세여부: 'exmptnYn',
    생산연도: 'prdctnYr',
    제조일자: 'mnftrYmd',
    공급가: 'pieceUntprc',
    부가세: 'txamt',
    '총발주 매입금': 'outordrAmt',
    입고금액: 'wrhsAmt',
  };

  // ========================================
  // 스네이크 케이스 → 카멜 케이스 변환
  // ========================================
  const snakeToCamel = (str: string): string => {
    return str.toLowerCase().replace(/_([a-z])/g, (_, letter) => letter.toUpperCase());
  };

  // ========================================
  // 엑셀 데이터 변환
  // ========================================
  const excelDateToString = (value: any): string | undefined => {
    if (!value) return undefined;

    // 이미 문자열이면 그대로 반환
    if (typeof value === 'string') return value;

    // 숫자면 Excel 날짜로 변환
    if (typeof value === 'number') {
      const date = new Date((value - 25569) * 86400 * 1000);
      const year = date.getFullYear();
      const month = String(date.getMonth() + 1).padStart(2, '0');
      const day = String(date.getDate()).padStart(2, '0');
      return `${year}${month}${day}`;
    }

    return undefined;
  };
  const transformExcelData = (excelData: any[]): OrderRecord[] => {
    return excelData.map((row, idx) => {
      const transformedRow: any = {};

      Object.keys(row).forEach((excelKey) => {
        let value = row[excelKey];

        // 날짜 필드 처리
        const dateFields = [
          '입고예정일',
          '발주일',
          '제조일자',
          'wrhsYmd',
          'outordrYmd',
          'mnftrYmd',
          'WRHS_YMD',
          'OUTORDR_YMD',
          'MNFTR_YMD',
        ];
        if (dateFields.includes(excelKey)) {
          value = excelDateToString(value);
        }

        // 1. 한글 헤더가 있으면 매핑된 field명 사용
        if (headerMapping[excelKey]) {
          transformedRow[headerMapping[excelKey]] = value;
        }
        // 2. 스네이크 케이스면 카멜 케이스로 변환
        else if (excelKey.includes('_')) {
          const camelKey = snakeToCamel(excelKey);
          transformedRow[camelKey] = value;
        }
        // 3. 그대로 사용
        else {
          transformedRow[excelKey] = value;
        }
      });
      // 공통부분 추가
      transformedRow['ordrApcCd'] = ordrApcCd;
      return transformedRow as OrderRecord;
    });
  };
  // ========================================
  // 엑셀 업로드 핸들러
  // ========================================
  const handleFileUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;

    if (!files || files.length === 0) {
      return;
    }

    const file = files[0];

    const reader = new FileReader();

    reader.onload = (event) => {
      try {
        const data = event.target?.result;
        const workbook = XLSX.read(data, { type: 'binary' });

        // 첫 번째 시트 가져오기
        const sheetName = workbook.SheetNames[0];
        const worksheet = workbook.Sheets[sheetName];

        // JSON으로 변환 (헤더는 첫 번째 행)
        const jsonData = XLSX.utils.sheet_to_json(worksheet);

        // 데이터 변환 (한글 헤더 → 카멜케이스 field)
        const transformedData = transformExcelData(jsonData);

        setRowData(transformedData);

        // 파일 input 초기화
        if (fileInputRef.current) {
          fileInputRef.current.value = '';
        }
      } catch (error) {
        console.error('엑셀 파일 읽기 실패:', error);
        alert('엑셀 파일을 읽는 중 오류가 발생했습니다.');
      }
    };

    reader.readAsBinaryString(file);
  };

  // ========================================
  // 서버로 데이터 전송 - 로딩 추가
  // ========================================
  const handleSave = async () => {
    if (!activeTab) {
      Swal.fire('', '저장할 탭을 선택하세요.', 'warning');
      return;
    }

    const currentTab = tabs.find((t) => t.id === activeTab);
    console.log(currentTab);

    if (!currentTab) {
      Swal.fire('', '탭을 찾을 수 없습니다.', 'error');
      return;
    }

    // 세부벤더 선택 체크
    if (!currentTab.subVendor) {
      Swal.fire('', '세부 벤더를 선택해주세요.\n(탭을 다시 클릭하세요)', 'warning');
      return;
    }

    setIsLoading(true);
    setLoadingMessage('저장중...');

    const gridApi = gridApisRef.current.get(activeTab);
    if (!gridApi) {
      Swal.fire('', '그리드를 찾을 수 없습니다.', 'error');
      return;
    }

    // 전체 데이터 추출
    const mrktOrdrDtlVOList: any[] = [];
    gridApi.forEachNode((node) => {
      mrktOrdrDtlVOList.push(node.data);
    });

    if (mrktOrdrDtlVOList.length === 0) {
      Swal.fire('', '저장할 데이터가 없습니다.', 'warning');
      return;
    }

    const mrktOrdrVOList = Object.values(
      mrktOrdrDtlVOList.reduce(
        (acc, row) => {
          const key = row.outordrno;

          if (!acc[key]) {
            // 첫 등장 시 기본 구조 생성
            acc[key] = {
              ordrApcCd: row.ordrApcCd,
              wrhsYmd: row.outordrYmd,
              cntrNm: row.cntrNm,
              cntrCd: row.cntrCd,
              storNm: row.storNm,
              storCd: row.storCd,
              outordrYmd: row.outordrYmd,
              outordrno: row.outordrno,
              outordrAmt: 0,
              subVendor: currentTab.subVendor, // 세부벤더
              lgszMrktCd: currentTab.lgszMrktCd, // 대형시장코드
              dtlList: [],
              ordrPrcsCd: 'N',
            };
          }

          // outordrAmt 누적
          acc[key].outordrAmt += Number(row.outordrAmt) || 0;

          // 상세 데이터 추가 (dtlSeq = 현재 리스트 길이)
          acc[key].dtlList.push({
            ...row,
            wrhsYmd: row.outordrYmd,
            dtlSeq: acc[key].dtlList.length + 1, // 1부터 시작
          });

          return acc;
        },
        {} as Record<string, any>,
      ),
    );
    console.log(mrktOrdrVOList, '저장전');
    console.log(currentTab, 'tab');
    // setIsLoading(false);
    // setLoadingMessage('');
    // return;

    try {
      const r = await postJSON(
        `/am/ordr/insertSpMrktOrdrLtReg.do?initial=${currentTab.initial}`,
        mrktOrdrVOList,
      );

      if (r.resultStatus === 'S') {
        // 전체 성공
        setTabs((prev) =>
          prev.map((t) => (t.id === activeTab ? { ...t, isSaved: true, failCount: 0 } : t)),
        );

        // 모든 행에 saveYn = 'Y' 표시
        gridApi.forEachNode((node: any) => {
          node.setData({
            ...node.data,
            saveYn: 'Y',
            failMsg: '',
          });
        });
        gridApi.refreshCells();

        Swal.fire({
          icon: 'success',
          text: `${r.successCnt || mrktOrdrVOList.length}건 저장 완료!`,
          timer: 1500,
          showConfirmButton: false,
        });
      } else if (r.resultStatus === 'P') {
        // 일부 실패
        const failList = r.failList || [];

        setTabs((prev) =>
          prev.map((t) =>
            t.id === activeTab ? { ...t, isSaved: true, failCount: failList.length } : t,
          ),
        );

        // 각 행에 saveYn 표시
        gridApi.forEachNode((node: any) => {
          const failed = failList.find((f: any) => f.outordrno === node.data.outordrno);
          node.setData({
            ...node.data,
            saveYn: failed ? 'N' : 'Y',
            failMsg: failed?.failMsg || '',
          });
        });
        gridApi.refreshCells();

        Swal.fire({
          icon: 'warning',
          title: '일부 저장 실패',
          html: `✅ ${r.successCnt}건 성공<br/>❌ ${failList.length}건 실패`,
        });
      } else {
        // 전체 실패
        Swal.fire('', r.resultMsg || '저장 실패', 'error');
      }
    } catch (error) {
      console.error(error);
      Swal.fire('', '저장 중 오류가 발생했습니다.', 'error');
    } finally {
      setIsLoading(false);
      setLoadingMessage('');
    }
  };
  const handleSave_old = async () => {
    if (rowData.length === 0) {
      Swal.fire('', `저장할 데이터가없습니다.`, 'error');
      return;
    }

    setIsLoading(true);
    setLoadingMessage(`${rowData.length}건 저장 중...`);

    try {
      const r = await postJSON('/am/ordr/insertMrktGdsOrdrList.do', rowData, {
        headers: { sysPrgrmId },
      });

      if (r.resultStatus == 'S') {
        const successCnt = r.resultList.insertedCnt;
        const failList = r.resultList.insertFailList;

        if (failList.length === 0) {
          Swal.fire({
            icon: 'success',
            text: `${successCnt}건 저장완료`,
            width: '320px',
            showConfirmButton: false,
            timer: 1500,
          });
          setRowData([]);
        } else {
          Swal.fire({
            icon: 'warning',
            title: '저장 결과',
            html: `
              <div style="font-size: 14px;">
                ✅ ${successCnt}건 성공<br/>
                ❌ ${failList.length}건 실패
              </div>
            `,
            width: '350px',
            confirmButtonText: '확인',
          });
          setRowData(failList);
        }
      }
    } catch (error) {
      console.error(error);
      Swal.fire('', '저장 중 오류가 발생했습니다.', 'error');
    } finally {
      setIsLoading(false);
      setLoadingMessage('');
    }
  };

  const defaultColDef = useMemo<ColDef>(
    () => ({
      sortable: true,
      filter: false,
      resizable: true,
      tooltipValueGetter: (params) => {
        if (params.data?.failMsg) {
          return `⚠️ ${params.data.failMsg}`;
        }
        return null;
      },
    }),
    [],
  );

  // 실패 행 스타일
  const getRowStyle = (params: any) => {
    if (params.data?.saveYn === 'N') {
      return { backgroundColor: '#ffebee' }; // 연한 빨강
    }
    return undefined;
  };

  // 실패건 필터 토글
  const toggleFailedFilter = (tabId: string) => {
    setShowFailedOnly((prev) => ({
      ...prev,
      [tabId]: !prev[tabId],
    }));

    // 필터 변경 시 그리드 새로고침
    const gridApi = gridApisRef.current.get(tabId);
    if (gridApi) {
      gridApi.onFilterChanged();
    }
  };

  // ========================================
  // 조회 - 로딩 추가
  // ========================================
  const fn_search = async () => {
    setIsLoading(true);
    setLoadingMessage('조회 중...');

    try {
      const searchParam = {
        ordrApcCd: apcCd,
        wrhsYmd,
        outordrYmd,
        cntrCd,
        mrktGdsCd,
      };

      const r = await postJSON('/am/ordr/selectMrktGdsOrdrList.do', searchParam);

      if (r.resultStatus == 'S' && r.resultList.length > 0) {
        setRowData(r.resultList);
      } else {
        Swal.fire('', '조회결과가 없습니다.', 'error');
        setRowData([]);
      }
    } catch (error) {
      console.error(error);
      Swal.fire('', '조회 중 오류가 발생했습니다.', 'error');
    } finally {
      setIsLoading(false);
      setLoadingMessage('');
    }
  };
  // ========================================
  // DB 데이터를 엑셀 형식으로 변환
  // ========================================
  const transformDataForExcel = (data: any[]) => {
    return data.map((row) => {
      const excelRow: any = {};

      // reverseHeaderMapping에 있는 필드만 추출 (순서대로)
      Object.keys(reverseHeaderMapping).forEach((camelKey) => {
        const koreanHeader = reverseHeaderMapping[camelKey];
        excelRow[koreanHeader] = row[camelKey] ?? '';
      });

      return excelRow;
    });
  };
  // ========================================
  // 엑셀 다운로드 (한글 헤더로) - 로딩 추가
  // ========================================
  const autoSize = () => {
    if (activeTab) {
      const gridApi = gridApisRef.current.get(activeTab);
      if (gridApi) {
        gridApi.autoSizeAllColumns();
        console.log('컬럼 자동 조절 실행됨');
      } else {
        console.log('Grid API를 찾을 수 없음');
      }
    } else {
      console.log('활성 탭이 없음');
    }

    console.log(tabs);
  };
  const handleDownload = () => {
    if (rowData.length === 0) {
      Swal.fire('', '다운로드할 데이터가 없습니다.', 'warning');
      return;
    }

    setIsLoading(true);
    setLoadingMessage('엑셀 파일 생성 중...');

    // setTimeout으로 UI 업데이트 보장
    setTimeout(() => {
      try {
        // DB 데이터를 한글 헤더로 변환
        const excelData = transformDataForExcel(rowData);

        // 워크시트 생성
        const worksheet = XLSX.utils.json_to_sheet(excelData);

        // 워크북 생성
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, worksheet, '발주내역');

        // 파일명 생성 (날짜 포함)
        const today = new Date();
        const dateStr = `${today.getFullYear()}${String(today.getMonth() + 1).padStart(2, '0')}${String(today.getDate()).padStart(2, '0')}`;
        const fileName = `발주내역_${dateStr}.xlsx`;

        // 다운로드
        XLSX.writeFile(workbook, fileName);

        Swal.fire({
          icon: 'success',
          text: `${rowData.length}건 다운로드 완료`,
          timer: 1500,
          showConfirmButton: false,
        });
      } catch (error) {
        console.error('엑셀 다운로드 실패:', error);
        Swal.fire('', '다운로드 중 오류가 발생했습니다.', 'error');
      } finally {
        setIsLoading(false);
        setLoadingMessage('');
      }
    }, 100);
  };

  // ========================================
  // 엑셀 업로드 dropZone (벤더 자동 감지)
  // ========================================
  const handleFileDrop = async (files: File[]) => {
    setIsLoading(true);
    setLoadingMessage('파일 처리 중...');

    try {
      for (const file of files) {
        let headers: string[] = [];
        let rawData: any[][] = [];
        let vendor = 'UNKNOWN';

        // 파일 확장자 체크
        const fileName = file.name.toLowerCase();

        try {
          if (fileName.endsWith('.xls')) {
            // HTML 형식 (롯데 계열)
            const result = await parseHTMLFile(file);
            headers = result.headers;
            rawData = result.data;
            vendor = detectVendor(headers);
            console.log(`📄 ${file.name} - HTML 파싱 완료`);
          } else if (fileName.endsWith('.xlsx')) {
            // XLSX 형식 (신세계/쿠팡 등)
            const result = await parseXLSXFile(file);
            headers = result.headers;
            rawData = result.data;
            vendor = detectVendor(headers);
            console.log(`📄 ${file.name} - XLSX 파싱 완료`);
          } else {
            throw new Error('지원하지 않는 파일 형식입니다. (.xls, .xlsx만 가능)');
          }

          // ⛔ 롯데만 허용
          // if (vendor !== 'LOTTE') {
          //   Swal.fire(
          //     '',
          //     `${file.name}: 현재 롯데 발주서만 업로드 가능합니다.\n(감지된 벤더: ${vendor})`,
          //     'warning',
          //   );
          //   continue;
          // }

          // 컬럼 정의 생성 (카멜케이스 field + 한글 headerName)
          const headerMapping = HEADER_MAPPING[vendor] || {}; // 벤더에 맞는 매핑
          const columns = headers.map((header) => ({
            field: headerMapping[header] || header,
            headerName: header,
            editable: true,
            resizable: true,
          }));

          // 데이터를 카멜케이스 키 객체 배열로 변환
          const dataObjects = rawData.map((row, rowIdx) => {
            const obj: any = {};
            headers.forEach((header, idx) => {
              const camelKey = headerMapping[header] || header;
              let value = row[idx];

              // 날짜 필드 정규화 (2025.11.18 → 20251118)
              if (['outordrYmd', 'cntrWrhsYmd', 'storWrhsYmd'].includes(camelKey) && value) {
                value = String(value)
                  .replace(/[\.\-\s:]/g, '') // 점, 대시, 공백, 콜론 전부 제거
                  .substring(0, 8); // 앞 8자리만 (YYYYMMDD)
              }

              // 숫자 필드 정규화 (콤마 제거)
              if (
                [
                  'outordrQntt',
                  'outordrUntprc',
                  'outordrAmt',
                  'pieceQntt',
                  'splyPrc',
                  'txamt',
                  'cfmtnQntt',
                ].includes(camelKey) &&
                value
              ) {
                value = String(value).replace(/,/g, '');
                value = isNaN(Number(value)) ? value : Number(value);
              }

              // 전표번호 공백 제거 (&nbsp; 등)
              if (camelKey === 'outordrno' && value) {
                value = String(value)
                  .trim()
                  .replace(/\u00A0/g, '');
              }

              obj[camelKey] = value;
            });

            // 공통 필드 추가
            obj['ordrApcCd'] = ordrApcCd;

            return obj;
          });

          // 새 탭 추가
          const newTab: ExcelTab = {
            id: `tab-${Date.now()}-${Math.random()}`,
            fileName: file.name,
            vendor: vendor,
            subVendor: null,
            lgszMrktCd: null, // 세부벤더 선택 시 설정됨
            initial: null, // 세부벤더 선택 시 설정됨
            data: dataObjects,
            columns: columns,
            isSaved: false,
            failCount: 0,
          };

          setTabs((prev) => [...prev, newTab]);
          setActiveTab(newTab.id);

          console.log(`✅ ${file.name} 처리 완료`);
          console.log(`  - 벤더: ${vendor}`);
          console.log(`  - 헤더 수: ${headers.length}`);
          console.log(`  - 데이터 행 수: ${dataObjects.length}`);
        } catch (parseError) {
          console.error(`❌ ${file.name} 파싱 실패:`, parseError);
          Swal.fire(
            '',
            `${file.name} 처리 중 오류가 발생했습니다.\n${parseError.message}`,
            'error',
          );
        }
      }
    } finally {
      setIsLoading(false);
      setLoadingMessage('');
    }
  };
  const onGridReady = (params: GridReadyEvent, tabId: string) => {
    gridApisRef.current.set(tabId, params.api); // ← 여기서 저장!
  };

  const handleCloseTab = (tabId: string) => {
    setTabs((prev) => prev.filter((t) => t.id !== tabId));
    if (activeTab === tabId) {
      const remainingTabs = tabs.filter((t) => t.id !== tabId);
      setActiveTab(remainingTabs.length > 0 ? remainingTabs[0].id : null);
    }
  };

  // ============================================================================
  // 세부벤더 선택 함수
  // ============================================================================
  const handleSelectSubVendor = async (tabId: string) => {
    const tab = tabs.find((t) => t.id === tabId);
    if (!tab) return;

    const options = subVendorOptionsWithCode[tab.vendor]; // lgszMrktCd 포함된 옵션

    // 옵션이 없으면 (UNKNOWN) 스킵
    if (options.length === 0) {
      Swal.fire('', '알 수 없는 벤더입니다.', 'warning');
      return;
    }

    // 옵션이 1개면 자동 선택 (쿠팡)
    if (options.length === 1) {
      setTabs((prev) =>
        prev.map((t) =>
          t.id === tabId
            ? {
                ...t,
                subVendor: options[0].value,
                lgszMrktCd: options[0].lgszMrktCd,
                initial: options[0].initial,
              }
            : t,
        ),
      );
      Swal.fire({
        icon: 'success',
        text: `${options[0].label} 선택됨`,
        timer: 1000,
        showConfirmButton: false,
      });
      return;
    }

    // 옵션이 여러 개면 선택 모달
    const inputOptions: Record<string, string> = {};
    options.forEach((opt) => {
      inputOptions[opt.value as string] = opt.label;
    });

    const { value } = await Swal.fire({
      title: '세부 벤더 선택',
      input: 'select',
      inputOptions,
      inputPlaceholder: '벤더를 선택하세요',
      showCancelButton: true,
      confirmButtonText: '선택',
      cancelButtonText: '취소',
    });

    if (value) {
      // 선택된 옵션에서 lgszMrktCd 찾기
      const selectedOption = options.find((opt) => opt.value === value);

      setTabs((prev) =>
        prev.map((t) =>
          t.id === tabId
            ? {
                ...t,
                subVendor: value as SubVendor,
                lgszMrktCd: selectedOption?.lgszMrktCd || null,
                initial: selectedOption?.initial || null,
              }
            : t,
        ),
      );
    }
  };

  // 탭이 변경될 때도 autoSize 실행
  useEffect(() => {
    if (activeTab) {
      const timer = setTimeout(() => {
        // 현재 활성 탭의 그리드 찾아서 autoSize
        const gridElements = document.querySelectorAll('.ag-root-wrapper');
        gridElements.forEach((el: any) => {
          if (el.offsetParent !== null) {
            // 보이는 그리드만
            const gridApi = el.gridApi;
            if (gridApi) {
              gridApi.autoSizeAllColumns();
            }
          }
        });
      }, 150);
      return () => clearTimeout(timer);
    }
  }, [activeTab]);

  return (
    <>
      <style>{`
      .box-header {
        padding-right: 15px;
        font-size: 18px;
        color: #1c54a2;
        font-family: 'LeferiPoint', sans-serif;
        font-weight: 600;
        padding: 15px 15px 12px;
      }
      .box-title{
        padding-right: 15px;
        font-size: 18px;
        color: #1c54a2;
        font-family: 'LeferiPoint', sans-serif;
        font-weight: 600;
      }
      .box-body {
        padding: 10px 15px 15px;
      }
      .table {
        margin-bottom: 0;
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0;
      }
      .table-bordered {
        border: 1px solid #ddd;
      }
      .table-bordered th,
      .table-bordered td {
        border: 1px solid #ddd;
      }
      .td_input {
        padding: 6px 8px;
      }
         .table > tbody > tr > th {
        border: 1px solid #f4f4f4;
        padding: 8px;
        line-height: 1.42857143;
        background-color: #e8f1f9;
        text-align: right;
        border-color: #e8f1f9 !important;
        border-bottom: 1px solid #ffffff !important;
        word-wrap: break-word;
        font-size: 13px;
      }
      .btn-upload {
        color: #666;
        background: #fff;
        border: 1px solid #666;
        padding: 5px 9px;
        min-width: 66px;
        border-radius: 3px;
        font-size: 12px;
        cursor: pointer;
        transition: all 0.2s;
        font-weight: 500;
      }
      .btn-upload:hover {
        background-color: #2d5a9f;
      }
      .btn-save {
        background-color: #3c6dbc;
        color: white;
        border: none;
        padding: 6px 14px;
        border-radius: 3px;
        font-size: 12px;
        cursor: pointer;
        transition: all 0.2s;
      }
      .btn-save:hover {
        background-color: #2d5a9f;
      }
      .section-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      .section-title {
        margin-right: 3px;
        font-weight: 600;
        color: #3c6dbc;
        font-size: 15px;
      }
      .button-group {
        display: flex;
        gap: 5px;
      }
      
      /* AG Grid 헤더 강제 스타일 적용 */
      .custom-ag-grid .ag-header,
      .custom-ag-grid .ag-header-row,
      .custom-ag-grid .ag-header-cell {
        background-color: rgb(206, 235, 255, 0.25) !important
        color: rgb(0, 96, 179) !important;
      }
      .ag-header-cell-text{
        font-size: 12px;
        color: #0e3979;
      }

      /* 체크박스 아이콘 색상 */
      .custom-ag-grid .ag-icon-checkbox-checked,
      .custom-ag-grid .ag-icon-checkbox-unchecked,
      .custom-ag-grid .ag-icon-checkbox-indeterminate {
        color: rgb(0, 96, 179) !important;
      }
      .custom-ag-grid .ag-header-row.ag-header-row-column{
         background-color: rgb(206, 235, 255, 0.25) !important; 
      }
      .table > tbody > tr > td.td_input {
       padding: 3px !important;
      }
      
      /* ========== 로딩 오버레이 스타일 ========== */
      .loading-overlay {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        z-index: 9999;
      }
      
      .loading-spinner {
        width: 50px;
        height: 50px;
        border: 4px solid #f3f3f3;
        border-top: 4px solid #3c6dbc;
        border-radius: 50%;
        animation: spin 1s linear infinite;
      }
      
      @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
      }
      
      .loading-message {
        margin-top: 20px;
        color: white;
        font-size: 16px;
        font-weight: 500;
      }
      .custom-ag-grid .ag-root-wrapper {
        border-radius: 0 !important;
      }

      .custom-ag-grid .ag-root {
        border-radius: 0 !important;
      }
      `}</style>

      {/* ========== 로딩 오버레이 ========== */}
      {isLoading && (
        <div className="loading-overlay">
          <div className="loading-spinner"></div>
          <div className="loading-message">{loadingMessage}</div>
        </div>
      )}

      <div className="min-h-screen bg-white">
        {/* 헤더 */}
        <div
          className="box-header"
          style={{
            display: 'flex',
            justifyContent: 'flex-start',
            alignItems: 'center',
          }}
        >
          <h3 className="box-title">▶ 상품발주관리</h3>
          <button className="btn-upload" style={{ marginLeft: 'auto' }} onClick={fn_search}>
            조회
          </button>
        </div>

        <div className="box-body">
          {/* 조회 조건 */}
          <div className="py-3">
            <table className="table table-bordered tbl_fixed">
              <colgroup>
                <col style={{ width: '11%' }} />
                <col style={{ width: '20%' }} />
                <col style={{ width: '11%' }} />
                <col style={{ width: '20%' }} />
                <col style={{ width: '11%' }} />
                <col style={{ width: '20%' }} />
              </colgroup>
              <tbody>
                <tr>
                  <th scope="row" className="th_bg">
                    APC명
                  </th>
                  <td className="td_input">
                    <input
                      disabled={true}
                      style={{
                        border: '1px solid #bbc4d1',
                        height: '28px',
                        width: '100%',
                        padding: '4px 8px',
                        cursor: 'text',
                        backgroundColor: '#eee',
                        fontSize: '12px',
                      }}
                      value={apcNm}
                    />
                  </td>
                  <th scope="row" className="th_bg">
                    발주일자
                  </th>
                  <td className="td_input">
                    <DatesProvider settings={{ locale: 'ko', firstDayOfWeek: 0 }}>
                      <DatePickerInput
                        rightSection={<IconCalendar size={18} stroke={1.5} />}
                        styles={{
                          input: {
                            borderRadius: 0,
                            fontSize: '12px',
                            minHeight: '0',
                            height: '28px',
                          },
                          root: { borderRadius: 0 },
                        }}
                        valueFormat="YYYY년 MM월 DD일"
                        clearable
                        value={outordrYmd}
                        onChange={(date) => {
                          if (date) {
                            setOutordrYmd(date.replace(/-/g, ''));
                          } else {
                            setOutordrYmd('');
                          }
                        }}
                      />
                    </DatesProvider>
                  </td>
                  <th scope="row" className="th_bg">
                    입고예정일자
                  </th>
                  <td className="td_input">
                    <DatesProvider settings={{ locale: 'ko', firstDayOfWeek: 0 }}>
                      <DatePickerInput
                        rightSection={<IconCalendar size={18} stroke={1.5} />}
                        styles={{
                          input: {
                            borderRadius: 0,
                            fontSize: '12px',
                            minHeight: '0',
                            height: '28px',
                          },
                          root: { borderRadius: 0 },
                        }}
                        valueFormat="YYYY년 MM월 DD일"
                        clearable
                        value={wrhsYmd}
                        onChange={(date) => {
                          if (date) {
                            setWrhsYmd(date.replace(/-/g, ''));
                          } else {
                            setWrhsYmd('');
                          }
                        }}
                      />
                    </DatesProvider>
                  </td>
                </tr>
                <tr>
                  <th scope="row" className="th_bg">
                    거래처
                  </th>
                  <td className="td_input">
                    <Select
                      checkIconPosition="right"
                      placeholder="검색"
                      data={cntrCdList}
                      searchable
                      clearable
                      styles={{
                        input: {
                          borderRadius: 0,
                          fontSize: '12px',
                          minHeight: '0',
                          height: '28px',
                        },
                        dropdown: { borderRadius: '0' },
                      }}
                      value={cntrCd}
                      onChange={handleLgszMrktChange}
                    />
                  </td>
                  <th scope="row" className="th_bg">
                    상품명
                  </th>
                  <td className="td_input" style={{ borderRight: 'none' }}>
                    <Select
                      checkIconPosition="right"
                      placeholder="검색"
                      data={mrktGdsCdList}
                      searchable
                      clearable
                      styles={{
                        input: {
                          borderRadius: 0,
                          fontSize: '12px',
                          minHeight: '0',
                          height: '28px',
                        },
                        dropdown: { borderRadius: '0' },
                      }}
                      value={mrktGdsCd}
                      onChange={setMrktGdsCd}
                    />
                  </td>
                  <th scope="row" className="th_bg">
                    발주사
                  </th>
                  <td className="td_input" style={{ borderRight: 'none' }}>
                    <Select
                      checkIconPosition="right"
                      placeholder="검색"
                      data={mrktComCdList}
                      searchable
                      clearable
                      styles={{
                        input: {
                          borderRadius: 0,
                          fontSize: '12px',
                          minHeight: '0',
                          height: '28px',
                        },
                        dropdown: { borderRadius: '0' },
                      }}
                      value={lgszMrktCd}
                      onChange={setLgszMrktCd}
                    />
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

          {/* 발주내역 헤더 + 버튼 */}
          <div className="section-header">
            <span className="section-title">발주내역</span>

            <div className="button-group">
              {/*<button className="btn-upload" onClick={autoSize}>*/}
              {/*  사이즈조절*/}
              {/*</button>*/}
              <button className="btn-upload" onClick={handleDownload}>
                다운로드
              </button>
              <button className="btn-save" onClick={handleSave}>
                저장
              </button>
            </div>
          </div>
          {/* AG Grid */}
          <div className="py-3">
            {tabs.length > 0 && (
              <Paper withBorder style={{ flex: 1 }} radius="xs">
                <Tabs value={activeTab} onChange={setActiveTab}>
                  <Tabs.List>
                    {tabs.map((tab) => (
                      <Tabs.Tab
                        key={tab.id}
                        value={tab.id}
                        style={{ fontSize: '13px' }}
                        onClick={() => {
                          // 이미 활성화된 탭 클릭 시 세부벤더 선택
                          if (activeTab === tab.id) {
                            handleSelectSubVendor(tab.id);
                          }
                        }}
                        rightSection={
                          <Group gap={4}>
                            <Badge
                              size="xs"
                              color={
                                tab.subVendor
                                  ? SUB_VENDOR_COLORS[tab.subVendor] || 'gray'
                                  : tab.vendor === 'SHINSEGAE'
                                    ? 'blue'
                                    : tab.vendor === 'COUPANG'
                                      ? 'orange'
                                      : tab.vendor === 'LOTTE'
                                        ? 'red'
                                        : 'gray'
                              }
                              variant="light"
                            >
                              {tab.subVendor
                                ? SUB_VENDOR_OPTIONS[tab.vendor]?.find(
                                    (v) => v.value === tab.subVendor,
                                  )?.label
                                : tab.vendor}
                            </Badge>
                            {/* 저장 완료 체크 표시 */}
                            {tab.isSaved ? (
                              <Badge color="green" size="xs" variant="filled">
                                ✓
                              </Badge>
                            ) : (
                              <Badge color="gray" size="xs" variant="outline">
                                미저장
                              </Badge>
                            )}
                            <ActionIcon
                              component="div"
                              size="xs"
                              variant="subtle"
                              color="gray"
                              onClick={(e) => {
                                e.stopPropagation();
                                handleCloseTab(tab.id);
                              }}
                              style={{ cursor: 'pointer' }}
                            >
                              <IconX size={12} />
                            </ActionIcon>
                          </Group>
                        }
                      >
                        {tab.fileName}
                      </Tabs.Tab>
                    ))}
                  </Tabs.List>

                  {tabs.map((tab) => (
                    <Tabs.Panel key={tab.id} value={tab.id}>
                      {/* 실패건 필터 버튼 - 저장 후에만 표시 */}
                      {tab.isSaved && (
                        <Group style={{ margin: '5px', gap: '5px' }}>
                          <Badge
                            color={showFailedOnly[tab.id] ? 'red' : 'gray'}
                            variant={showFailedOnly[tab.id] ? 'filled' : 'outline'}
                            style={{ cursor: 'pointer' }}
                            onClick={() => toggleFailedFilter(tab.id)}
                          >
                            {showFailedOnly[tab.id] ? '실패건만 보기' : '전체 보기'}
                          </Badge>
                          {!showFailedOnly[tab.id] && (
                            <Badge
                              color="gray"
                              variant="outline"
                              style={{ cursor: 'pointer' }}
                              onClick={() => fn_sortCmnd(tab.id)}
                            >
                              선별지시등록
                            </Badge>
                          )}
                          {!showFailedOnly[tab.id] && (
                            <Badge
                              color="gray"
                              variant="outline"
                              style={{ cursor: 'pointer' }}
                              onClick={() => fn_sortCmnd(tab.id)}
                            >
                              포장지시등록
                            </Badge>
                          )}
                        </Group>
                      )}
                      <div
                        className="ag-theme-alpine"
                        style={{ height: 'calc(100vh - 450px)', width: '100%' }}
                      >
                        <AgGridReact
                          theme="legacy"
                          rowData={tab.data}
                          columnDefs={tab.columns}
                          defaultColDef={defaultColDef}
                          getRowStyle={getRowStyle}
                          onGridReady={(params) => onGridReady(params, tab.id)}
                          tooltipShowDelay={0}
                          // 실패건 필터
                          isExternalFilterPresent={() => showFailedOnly[tab.id] || false}
                          doesExternalFilterPass={(node) => node.data?.saveYn === 'N'}
                          // ✅ v34 최신 방식
                          rowSelection={{
                            mode: 'multiRow',
                            checkboxes: true,
                            headerCheckbox: true,
                            enableClickSelection: false,
                          }}
                          animateRows={true}
                          localeText={{
                            noRowsToShow: '엑셀 파일을 업로드하세요.',
                          }}
                          onCellValueChanged={(params) => {}}
                        />
                      </div>
                    </Tabs.Panel>
                  ))}
                </Tabs>
              </Paper>
            )}
            {/*<div*/}
            {/*  className="ag-theme-quartz custom-ag-grid"*/}
            {/*  style={{ height: 500, width: '100%', borderRadius: 0 }}*/}
            {/*>*/}
            {/*  <AgGridReact*/}
            {/*    theme="legacy"*/}
            {/*    rowData={rowData}*/}
            {/*    columnDefs={columnDefs}*/}
            {/*    defaultColDef={defaultColDef}*/}
            {/*    tooltipShowDelay={0}*/}
            {/*    // ✅ v34 최신 방식*/}
            {/*    rowSelection={{*/}
            {/*      mode: 'multiRow',*/}
            {/*      checkboxes: true,*/}
            {/*      headerCheckbox: true,*/}
            {/*      enableClickSelection: false,*/}
            {/*    }}*/}
            {/*    animateRows={true}*/}
            {/*    localeText={{*/}
            {/*      noRowsToShow: '엑셀 파일을 업로드하세요.',*/}
            {/*    }}*/}
            {/*    onCellValueChanged={(params) => {}}*/}
            {/*  />*/}
            {/*</div>*/}
          </div>

          {/* 통계 정보 */}
          {/*{rowData.length > 0 && (*/}
          {/*  <div style={{ marginTop: '10px', fontSize: '13px', color: '#666' }}>*/}
          {/*    총 <strong>{rowData.length}</strong>건*/}
          {/*  </div>*/}
          {/*)}*/}
        </div>
        <Dropzone
          onDrop={handleFileDrop}
          accept={[
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            'application/vnd.ms-excel',
          ]}
          maxSize={10 * 1024 ** 2}
          style={{ border: '1px solid #0001' }}
        >
          <Group justify="center" gap="md" style={{ minHeight: 150, pointerEvents: 'none' }}>
            <IconUpload size={40} stroke={1.5} />
            <div>
              <Text size="md" inline>
                엑셀 파일을 드래그하거나 클릭하여 업로드
              </Text>
              <Text size="sm" c="dimmed" inline mt={6}>
                여러 파일을 동시에 업로드할 수 있습니다.
              </Text>
            </div>
          </Group>
        </Dropzone>
      </div>
    </>
  );
};

export default App;
