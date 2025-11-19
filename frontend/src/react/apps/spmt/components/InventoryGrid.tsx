/**
 * 재고 그리드 컴포넌트
 * - lotData에서 생산자 자동 추출
 * - 복원 시 기존 생산자 표시
 */

import React, { useState, useMemo, useEffect } from 'react';
import { useInventory } from '../contexts/InventoryContext';
import CellContainer from './CellContainer';
import { Autocomplete } from '@mantine/core';

const INITIAL_ROWS = 25; // 초기 행 개수

interface ProducerRow {
  id: string;
  producerCode: string | null;
}

const InventoryGrid: React.FC = () => {
  const { lotData, grades, producers } = useInventory();

  // producers를 Mantine Autocomplete 형식으로 변환
  const producerOptions = useMemo(() => {
    if (!producers || producers.length === 0) return [];

    if (typeof producers[0] === 'string') {
      return producers;
    }

    return producers.map((p: any) => {
      if (typeof p === 'object' && p !== null) {
        return {
          value: p.prdcrIdentno || p.code || p.id || String(p),
          label: p.prdcrNm || p.name || p.label || String(p),
        };
      }
      return String(p);
    });
  }, [producers]);

  // 25개 행 상태 관리
  const [rows, setRows] = useState<ProducerRow[]>(
    Array.from({ length: INITIAL_ROWS }, (_, i) => ({
      id: `row-${i}`,
      producerCode: null,
    })),
  );

  // ========== lotData에서 생산자 추출 (복원 시) ==========
  useEffect(() => {
    if (!lotData || Object.keys(lotData).length === 0) return;

    // lotData의 cellKey에서 생산자 코드 추출
    const producersInData = new Set<string>();
    Object.keys(lotData).forEach((cellKey) => {
      const [producerCode] = cellKey.split('_');
      if (producerCode) {
        producersInData.add(producerCode);
      }
    });

    if (producersInData.size === 0) return;

    // 추출된 생산자로 rows 업데이트
    const newRows = Array.from(producersInData).map((code, idx) => ({
      id: `row-${idx}`,
      producerCode: code,
    }));

    // 빈 행 추가 (최소 INITIAL_ROWS개)
    const remainingRows = INITIAL_ROWS - newRows.length;
    if (remainingRows > 0) {
      for (let i = 0; i < remainingRows; i++) {
        newRows.push({
          id: `row-${newRows.length}`,
          producerCode: null,
        });
      }
    }

    setRows(newRows);
    console.log('✅ lotData에서 생산자 복원:', Array.from(producersInData));
  }, [lotData]); // lotData 변경 시 실행

  // 생산자 선택 핸들러
  const handleProducerSelect = (rowIndex: number, value: string) => {
    setRows((prev) => {
      const newRows = [...prev];
      newRows[rowIndex] = { ...newRows[rowIndex], producerCode: value };
      return newRows;
    });
  };

  return (
    <div className="flex-1 shadow-lg border border-gray-300 rounded-lg overflow-auto bg-white">
      <div className="grid" style={{ gridTemplateColumns: `200px repeat(${grades.length}, auto)` }}>
        {/* Header */}
        <div className="sticky top-0 z-10 bg-gray-100 px-4 py-3 border-b-2 border-r border-gray-300 font-semibold text-gray-700">
          생산자
        </div>
        {grades.map((grade) => (
          <div
            key={grade.id || grade.grdCd}
            className="sticky top-0 z-10 bg-gray-100 px-4 py-3 border-b-2 border-r border-gray-300 font-semibold text-gray-700 text-center"
          >
            {grade.name || grade.grdNm}
          </div>
        ))}

        {/* Body */}
        {rows.map((row, rowIndex) => (
          <React.Fragment key={row.id}>
            {/* 생산자 선택 */}
            <div className="border-b border-r border-gray-200 sticky left-0 bg-white z-5 p-2">
              <Autocomplete
                data={producerOptions}
                value={row.producerCode || ''}
                onChange={(value) => handleProducerSelect(rowIndex, value)}
                placeholder="생산자 선택"
                limit={10}
                styles={{
                  input: {
                    border: 'none',
                    textAlign: 'center',
                    fontSize: '1rem',
                    fontWeight: 'bold',
                  },
                }}
              />
            </div>

            {/* 등급별 셀 */}
            {grades.map((grade) => {
              const gradeCode = grade.id || grade.grdCd;
              const cellKey = row.producerCode
                ? `${row.producerCode}_${gradeCode}`
                : `empty_${row.id}_${gradeCode}`;

              const lots = row.producerCode ? lotData[cellKey] || [] : [];

              return (
                <div key={gradeCode} className="p-0 border-b border-r border-gray-200">
                  <CellContainer
                    cellKey={cellKey}
                    lots={lots}
                    isProducerSelected={!!row.producerCode}
                  />
                </div>
              );
            })}
          </React.Fragment>
        ))}

        {/* Footer - 합계 */}
        <div className="sticky bottom-0 z-10 bg-gray-200 px-4 py-3 border-t-4 border-r border-gray-400 font-bold text-lg text-center">
          합계
        </div>
        {grades.map((grade) => {
          const gradeCode = grade.id || grade.grdCd;
          const total = Object.entries(lotData)
            .filter(([key]) => key.endsWith(`_${gradeCode}`))
            .reduce((sum, [, lots]) => sum + lots.reduce((s, lot) => s + lot.qty, 0), 0);

          return (
            <div
              key={gradeCode}
              className="sticky bottom-0 z-10 bg-gray-200 px-4 py-3 border-t-4 border-r border-gray-400 font-bold text-lg text-blue-700 text-center"
            >
              {total > 0 ? total : '-'}
            </div>
          );
        })}
      </div>
    </div>
  );
};

export default InventoryGrid;
