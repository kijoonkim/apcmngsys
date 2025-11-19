/**
 * AG Grid 파일 업로드/다운로드 컴포넌트
 * - 엑셀 업로드 → AG Grid 표시
 * - AG Grid 데이터 → 엑셀 다운로드
 * - 독립적으로 사용 가능
 */

import React, { useState, useRef } from 'react';
import { AgGridReact } from 'ag-grid-react';
import { ColDef } from 'ag-grid-community';
import * as XLSX from 'xlsx';
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-alpine.css';

interface ExcelGridProps {
  // 옵션: 외부에서 컬럼 정의 주입 가능
  columns?: ColDef[];
  // 옵션: 초기 데이터
  initialData?: any[];
  // 옵션: 데이터 변경 콜백
  onDataChange?: (data: any[]) => void;
}

const ExcelGrid: React.FC<ExcelGridProps> = ({ columns, initialData = [], onDataChange }) => {
  const [rowData, setRowData] = useState<any[]>(initialData);
  const [columnDefs, setColumnDefs] = useState<ColDef[]>(columns || []);
  const fileInputRef = useRef<HTMLInputElement>(null);
  const gridRef = useRef<any>(null);

  // ========================================
  // 엑셀 업로드
  // ========================================
  const handleFileUpload = (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = (e) => {
      try {
        const data = new Uint8Array(e.target?.result as ArrayBuffer);
        const workbook = XLSX.read(data, { type: 'array' });
        const worksheet = workbook.Sheets[workbook.SheetNames[0]];

        // JSON으로 변환
        const jsonData: any[] = XLSX.utils.sheet_to_json(worksheet);

        if (jsonData.length === 0) {
          alert('데이터가 없습니다.');
          return;
        }

        // 컬럼이 정의되지 않았으면 자동 생성
        if (!columns || columns.length === 0) {
          const autoColumns: ColDef[] = Object.keys(jsonData[0]).map((key) => ({
            field: key,
            headerName: key,
            editable: true,
            sortable: true,
            filter: true,
            resizable: true,
          }));
          setColumnDefs(autoColumns);
        }

        setRowData(jsonData);
        onDataChange?.(jsonData);

        console.log('✅ 엑셀 업로드 완료:', jsonData.length, '건');
      } catch (error) {
        console.error('❌ 엑셀 읽기 실패:', error);
        alert('엑셀 파일을 읽는 중 오류가 발생했습니다.');
      } finally {
        // input 초기화
        if (fileInputRef.current) {
          fileInputRef.current.value = '';
        }
      }
    };

    reader.readAsArrayBuffer(file);
  };

  // ========================================
  // 엑셀 다운로드
  // ========================================
  const handleExcelDownload = () => {
    if (rowData.length === 0) {
      alert('다운로드할 데이터가 없습니다.');
      return;
    }

    // AG Grid에서 현재 데이터 가져오기
    const data = rowData.map((row) => {
      const newRow: any = {};
      columnDefs.forEach((col) => {
        if (col.field) {
          newRow[col.headerName || col.field] = row[col.field];
        }
      });
      return newRow;
    });

    // 워크시트 생성
    const ws = XLSX.utils.json_to_sheet(data);

    // 컬럼 너비 자동 조정
    const colWidths = columnDefs.map((col) => ({
      wch: Math.max((col.headerName || col.field || '').length, 15),
    }));
    ws['!cols'] = colWidths;

    // 워크북 생성
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');

    // 파일 저장
    const fileName = `export_${new Date().toISOString().split('T')[0]}.xlsx`;
    XLSX.writeFile(wb, fileName);

    console.log('✅ 엑셀 다운로드 완료:', fileName);
  };

  // ========================================
  // CSV 다운로드 (보너스!)
  // ========================================
  const handleCsvDownload = () => {
    if (rowData.length === 0) {
      alert('다운로드할 데이터가 없습니다.');
      return;
    }

    // 헤더
    const headers = columnDefs.map((col) => col.headerName || col.field).join(',');

    // 데이터
    const rows = rowData
      .map((row) =>
        columnDefs
          .map((col) => {
            if (!col.field) return '';
            const value = row[col.field];
            // CSV 이스케이프 처리
            if (typeof value === 'string' && (value.includes(',') || value.includes('"'))) {
              return `"${value.replace(/"/g, '""')}"`;
            }
            return value ?? '';
          })
          .join(','),
      )
      .join('\n');

    const csv = `${headers}\n${rows}`;

    // 다운로드
    const blob = new Blob(['\uFEFF' + csv], { type: 'text/csv;charset=utf-8;' }); // BOM 추가 (한글 깨짐 방지)
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = `export_${new Date().toISOString().split('T')[0]}.csv`;
    link.click();

    console.log('✅ CSV 다운로드 완료');
  };

  // ========================================
  // 행 추가
  // ========================================
  const handleAddRow = () => {
    const newRow: any = {};
    columnDefs.forEach((col) => {
      if (col.field) {
        newRow[col.field] = '';
      }
    });

    const newData = [...rowData, newRow];
    setRowData(newData);
    onDataChange?.(newData);
  };

  // ========================================
  // 선택 행 삭제
  // ========================================
  const handleDeleteSelected = () => {
    const selectedNodes = gridRef.current?.api?.getSelectedNodes();
    if (!selectedNodes || selectedNodes.length === 0) {
      alert('삭제할 행을 선택하세요.');
      return;
    }

    const selectedData = selectedNodes.map((node: any) => node.data);
    const newData = rowData.filter((row) => !selectedData.includes(row));

    setRowData(newData);
    onDataChange?.(newData);

    console.log('✅ 삭제 완료:', selectedNodes.length, '건');
  };

  // ========================================
  // 전체 삭제
  // ========================================
  const handleClearAll = () => {
    if (rowData.length === 0) return;

    if (window.confirm('모든 데이터를 삭제하시겠습니까?')) {
      setRowData([]);
      onDataChange?.([]);
    }
  };

  // ========================================
  // 셀 값 변경 핸들러
  // ========================================
  const onCellValueChanged = () => {
    // 데이터 변경 시 콜백 호출
    const allData: any[] = [];
    gridRef.current?.api?.forEachNode((node: any) => {
      allData.push(node.data);
    });
    onDataChange?.(allData);
  };

  return (
    <div className="w-full">
      {/* 컨트롤 버튼 */}
      <div className="flex justify-between items-center mb-4">
        <div className="flex space-x-2">
          {/* 업로드 */}
          <label className="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 cursor-pointer flex items-center space-x-2">
            <span>📤</span>
            <span>엑셀 업로드</span>
            <input
              ref={fileInputRef}
              type="file"
              accept=".xlsx,.xls"
              onChange={handleFileUpload}
              className="hidden"
            />
          </label>

          {/* 다운로드 */}
          <button
            onClick={handleExcelDownload}
            className="px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700 flex items-center space-x-2"
            disabled={rowData.length === 0}
          >
            <span>📥</span>
            <span>엑셀 다운로드</span>
          </button>

          {/* CSV 다운로드 */}
          <button
            onClick={handleCsvDownload}
            className="px-4 py-2 bg-teal-600 text-white rounded hover:bg-teal-700 flex items-center space-x-2"
            disabled={rowData.length === 0}
          >
            <span>📄</span>
            <span>CSV 다운로드</span>
          </button>
        </div>

        <div className="flex space-x-2">
          {/* 행 추가 */}
          <button
            onClick={handleAddRow}
            className="px-4 py-2 bg-indigo-600 text-white rounded hover:bg-indigo-700"
          >
            + 행 추가
          </button>

          {/* 선택 삭제 */}
          <button
            onClick={handleDeleteSelected}
            className="px-4 py-2 bg-yellow-600 text-white rounded hover:bg-yellow-700"
            disabled={rowData.length === 0}
          >
            선택 삭제
          </button>

          {/* 전체 삭제 */}
          <button
            onClick={handleClearAll}
            className="px-4 py-2 bg-red-600 text-white rounded hover:bg-red-700"
            disabled={rowData.length === 0}
          >
            전체 삭제
          </button>
        </div>
      </div>

      {/* 데이터 개수 표시 */}
      <div className="mb-2 text-sm text-gray-600">
        총 <span className="font-bold text-blue-600">{rowData.length}</span>건
      </div>

      {/* AG Grid */}
      <div className="ag-theme-alpine" style={{ height: 500, width: '100%' }}>
        <AgGridReact
          ref={gridRef}
          rowData={rowData}
          columnDefs={columnDefs}
          defaultColDef={{
            sortable: true,
            filter: true,
            resizable: true,
            editable: true,
          }}
          rowSelection="multiple"
          suppressRowClickSelection={true}
          animateRows={true}
          onCellValueChanged={onCellValueChanged}
          localeText={{
            noRowsToShow: '데이터가 없습니다. 엑셀 파일을 업로드하거나 행을 추가하세요.',
          }}
        />
      </div>
    </div>
  );
};

export default ExcelGrid;
