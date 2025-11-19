/**
 * 상품발주관리 - 엑셀 업로드
 * 1. 한글 헤더 매칭
 * 2. 스네이크 케이스 → 카멜 케이스 변환
 * 3. 로딩 처리 추가
 */

import React, { useState, useRef, useEffect, useMemo } from 'react';
import { AgGridReact } from 'ag-grid-react';
import * as XLSX from 'xlsx';
import { DatesProvider, DatePickerInput } from '@mantine/dates';
import Swal from 'sweetalert2';
import '@mantine/core/styles.css';
import '@mantine/dates/styles.css';
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

        // 상품명 공통코드
        if (mrktComCd) {
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
      transformedRow['ordrSeq'] = idx;
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
  // 업로드 버튼 클릭
  // ========================================
  const handleUploadClick = () => {
    fileInputRef.current?.click();
  };

  // ========================================
  // 서버로 데이터 전송 - 로딩 추가
  // ========================================
  const handleSave = async () => {
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
      filter: true,
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
      `}</style>

      {/* ========== 로딩 오버레이 ========== */}
      {isLoading && (
        <div className="loading-overlay">
          <div className="loading-spinner"></div>
          <div className="loading-message">{loadingMessage}</div>
        </div>
      )}

      <div className="min-h-screen bg-white">
        {/* 숨겨진 파일 input */}
        <input
          ref={fileInputRef}
          type="file"
          accept=".xlsx,.xls"
          onChange={handleFileUpload}
          style={{ display: 'none' }}
        />

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
                </tr>
              </tbody>
            </table>
          </div>

          {/* 발주내역 헤더 + 버튼 */}
          <div className="section-header">
            <span className="section-title">발주내역</span>
            <div className="button-group">
              <button className="btn-upload" onClick={handleUploadClick}>
                업로드
              </button>
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
            <div className="ag-theme-quartz custom-ag-grid" style={{ height: 500, width: '100%' }}>
              <AgGridReact
                theme="legacy"
                rowData={rowData}
                columnDefs={columnDefs}
                defaultColDef={defaultColDef}
                tooltipShowDelay={0}
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
          </div>

          {/* 통계 정보 */}
          {rowData.length > 0 && (
            <div style={{ marginTop: '10px', fontSize: '13px', color: '#666' }}>
              총 <strong>{rowData.length}</strong>건
            </div>
          )}
        </div>
      </div>
    </>
  );
};

export default App;
