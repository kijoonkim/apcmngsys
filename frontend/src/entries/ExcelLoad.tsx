/**
 * JSP 통합용 엔트리 파일
 * - id="root"에 React 앱 마운트
 * - 빌드 후 JSP에 삽입
 */

import React from 'react';
import ReactDOM from 'react-dom/client';
import ExcelGrid from '@vanilla/ExcelGrid';
import { ColDef } from 'ag-grid-community';

// AG Grid CSS 임포트
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-alpine.css';

// Tailwind CSS (또는 기본 스타일)
import '@shared/styles/tailwind.css';
import '@mantine/core/styles.css';
import 'keen-slider/keen-slider.min.css';

// ========================================
// 컬럼 정의 (필요시 수정)
// ========================================
const columns: ColDef[] = [
  {
    field: 'apcCd',
    headerName: 'APC코드',
    width: 120,
    editable: true,
  },
  {
    field: 'apcNm',
    headerName: 'APC거래처',
    width: 150,
    editable: true,
  },
  {
    field: 'ordererCd',
    headerName: '발주업자코드',
    width: 120,
    editable: true,
  },
  {
    field: 'ordererNm',
    headerName: '발주업자',
    width: 150,
    editable: true,
  },
  {
    field: 'itemNm',
    headerName: '상품명',
    width: 200,
    editable: true,
  },
  {
    field: 'qty',
    headerName: '수량',
    width: 100,
    editable: true,
    type: 'numericColumn',
    valueFormatter: (params) => {
      return params.value ? `${params.value.toLocaleString()}` : '';
    },
  },
  {
    field: 'expectedDate',
    headerName: '입고예정일자',
    width: 130,
    editable: true,
  },
];

// ========================================
// 메인 앱 컴포넌트
// ========================================
const App: React.FC = () => {
  const handleDataChange = (data: any[]) => {
    console.log('📊 데이터 변경:', data.length, '건');

    // JSP로 데이터 전달 (window 객체 사용)
    if (window.onExcelDataChange) {
      window.onExcelDataChange(data);
    }
  };

  return (
    <div className="p-6 bg-white min-h-screen">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-800 mb-2">📊 엑셀 데이터 관리</h1>
        <p className="text-sm text-gray-600">엑셀 파일을 업로드하거나 직접 입력하세요</p>
      </div>

      <ExcelGrid columns={columns} onDataChange={handleDataChange} />
    </div>
  );
};

// ========================================
// React 앱 마운트
// ========================================
const rootElement = document.getElementById('root');

if (!rootElement) {
  console.error('❌ id="root" 요소를 찾을 수 없습니다!');
} else {
  const root = ReactDOM.createRoot(rootElement);
  root.render(
    <React.StrictMode>
      <App />
    </React.StrictMode>,
  );
  console.log('✅ React 앱이 마운트되었습니다!');
}

// ========================================
// JSP와 통신용 전역 함수
// ========================================
declare global {
  interface Window {
    // JSP → React: 데이터 가져오기
    getExcelData: () => any[];
    // React → JSP: 데이터 변경 알림
    onExcelDataChange?: (data: any[]) => void;
  }
}

// JSP에서 데이터 가져갈 수 있도록
window.getExcelData = () => {
  // TODO: 실제 데이터 반환 로직
  console.log('JSP에서 데이터 요청');
  return [];
};

export {};
