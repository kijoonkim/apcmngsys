import React, { useState, useMemo, useRef } from 'react';
import { AgGridReact } from 'ag-grid-react';
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-alpine.css';

/**
 * 셀 렌더러: Left/Right 2개 셀을 하나에 표시
 */
const DualCellRenderer = (props) => {
  const { data, colDef } = props;
  const line = colDef.field; // "01", "02", ...
  const grade = data.grade; // "A", "B", ...

  const leftKey = `${grade}${line}_left`;
  const rightKey = `${grade}${line}_right`;

  const leftData = data[leftKey] || {};
  const rightData = data[rightKey] || {};

  // 클릭 핸들러
  const handleClick = (side) => {
    const cellKey = side === 'left' ? leftKey : rightKey;
    if (props.onCellClick) {
      props.onCellClick(cellKey, side === 'left' ? leftData : rightData);
    }
  };

  // 셀 스타일 결정
  const getCellClass = (cellData) => {
    if (cellData.isFullyShipped) return 'bg-blue-100';
    if (cellData.hasInventory) return 'bg-white';
    return 'bg-gray-50';
  };

  return (
    <div className="flex h-full w-full divide-x divide-gray-300">
      {/* Left Cell */}
      <div
        onClick={() => handleClick('left')}
        className={`w-1/2 h-full p-1 text-xs cursor-pointer flex flex-col justify-center items-center ${getCellClass(leftData)} ${
          leftData.isSelected ? 'ring-2 ring-inset ring-black' : ''
        }`}
      >
        {leftData.hasInventory ? (
          <>
            <div className="font-bold text-[10px] truncate w-full text-center">
              {leftData.producers}
            </div>
            <div className="text-gray-600 text-[10px]">Q: {leftData.totalQty}</div>
          </>
        ) : (
          <div className="text-gray-300">...</div>
        )}
      </div>

      {/* Right Cell */}
      <div
        onClick={() => handleClick('right')}
        className={`w-1/2 h-full p-1 text-xs cursor-pointer flex flex-col justify-center items-center ${getCellClass(rightData)} ${
          rightData.isSelected ? 'ring-2 ring-inset ring-black' : ''
        }`}
      >
        {rightData.hasInventory ? (
          <>
            <div className="font-bold text-[10px] truncate w-full text-center">
              {rightData.producers}
            </div>
            <div className="text-gray-600 text-[10px]">Q: {rightData.totalQty}</div>
          </>
        ) : (
          <div className="text-gray-300">...</div>
        )}
      </div>
    </div>
  );
};

/**
 * AG Grid 재고 그리드 컴포넌트
 */
export default function InventoryAGGrid({
  inventory = {},
  shipments = {},
  selectedCells = new Set(),
  onCellClick,
}) {
  const gridRef = useRef(null);

  // 등급 (A-Z)
  const grades = Array.from({ length: 26 }, (_, i) => String.fromCharCode(65 + i));

  // 줄 (01-18)
  const lines = Array.from({ length: 18 }, (_, i) => (i + 1).toString().padStart(2, '0'));

  // 행 데이터 생성
  const rowData = useMemo(() => {
    return grades.map((grade) => {
      const row = { grade };

      lines.forEach((line) => {
        const leftKey = `${grade}${line}_left`;
        const rightKey = `${grade}${line}_right`;

        // Left 데이터
        const leftInv = inventory[leftKey] || [];
        const leftHasInventory = leftInv.length > 0;
        const leftTotalQty = leftHasInventory
          ? leftInv.reduce((sum, item) => sum + item.invntrQntt, 0)
          : 0;
        const leftProducers = leftHasInventory
          ? [...new Set(leftInv.map((i) => i.prdcrIdentno))].join(', ')
          : '';
        const leftIsFullyShipped =
          leftHasInventory &&
          leftInv.every((item) => {
            const key = `${leftKey}_${item.prdcrIdentno}`;
            return shipments[key] && shipments[key].spmtQntt >= item.invntrQntt;
          });

        // Right 데이터
        const rightInv = inventory[rightKey] || [];
        const rightHasInventory = rightInv.length > 0;
        const rightTotalQty = rightHasInventory
          ? rightInv.reduce((sum, item) => sum + item.invntrQntt, 0)
          : 0;
        const rightProducers = rightHasInventory
          ? [...new Set(rightInv.map((i) => i.prdcrIdentno))].join(', ')
          : '';
        const rightIsFullyShipped =
          rightHasInventory &&
          rightInv.every((item) => {
            const key = `${rightKey}_${item.prdcrIdentno}`;
            return shipments[key] && shipments[key].spmtQntt >= item.invntrQntt;
          });

        row[leftKey] = {
          hasInventory: leftHasInventory,
          totalQty: leftTotalQty,
          producers: leftProducers,
          isFullyShipped: leftIsFullyShipped,
          isSelected: selectedCells.has(leftKey),
        };

        row[rightKey] = {
          hasInventory: rightHasInventory,
          totalQty: rightTotalQty,
          producers: rightProducers,
          isFullyShipped: rightIsFullyShipped,
          isSelected: selectedCells.has(rightKey),
        };
      });

      return row;
    });
  }, [inventory, shipments, selectedCells, grades, lines]);

  // 컬럼 정의
  const columnDefs = useMemo(() => {
    return [
      {
        field: 'grade',
        headerName: '등급',
        width: 60,
        pinned: 'left', // 고정
        cellStyle: {
          fontWeight: 'bold',
          textAlign: 'center',
          backgroundColor: '#f9fafb',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
        },
      },
      ...lines.map((line) => ({
        field: line,
        headerName: line,
        width: 150,
        cellRenderer: DualCellRenderer,
        cellRendererParams: {
          onCellClick: onCellClick,
        },
        cellStyle: {
          padding: 0,
        },
      })),
    ];
  }, [lines, onCellClick]);

  // AG Grid 기본 옵션
  const defaultColDef = useMemo(
    () => ({
      sortable: false,
      filter: false,
      resizable: true,
    }),
    [],
  );

  return (
    <div className="ag-theme-alpine" style={{ height: '100%', width: '100%' }}>
      <AgGridReact
        ref={gridRef}
        rowData={rowData}
        columnDefs={columnDefs}
        defaultColDef={defaultColDef}
        headerHeight={40}
        rowHeight={60}
        suppressMovableColumns={true}
        suppressCellFocus={true}
      />
    </div>
  );
}
