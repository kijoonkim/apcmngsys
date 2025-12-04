/**
 * 재고 병합 모달
 * - 여러 Lot을 하나로 병합
 * - Context 연동
 */

import React from 'react';
import { useInventoryActions } from '../contexts/InventoryContext';
import { Lot } from '../contexts/InventoryContext';

interface MergeModalProps {
  lots: Lot[];
  cellKey: string;
  onClose: () => void;
}

const MergeModal: React.FC<MergeModalProps> = ({ lots, cellKey, onClose }) => {
  const { mergeLots } = useInventoryActions();
  
  // lots가 없거나 빈 배열이면 렌더링 안 함
  if (!lots || lots.length === 0) return null;
  
  const totalQty = lots.reduce((sum, lot) => sum + lot.qty, 0);

  const handleMerge = () => {
    mergeLots(cellKey, lots);
    onClose();
  };

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
      <div className="bg-white p-6 rounded-lg shadow-xl max-w-md w-full">
        <h3 className="text-xl font-bold mb-4">🔗 재고 병합</h3>
        
        <p className="text-sm text-gray-600 mb-4">
          아래 재고들을 하나로 병합합니다.
        </p>

        {/* 병합할 Lot 목록 */}
        <div className="border border-gray-300 rounded-md p-3 space-y-2 mb-4 max-h-60 overflow-y-auto">
          {lots.map((lot, idx) => (
            <div
              key={lot.id}
              className="flex items-center justify-between bg-gray-50 p-2 rounded"
            >
              <span className="text-sm">
                Lot {idx + 1}: <strong>{lot.qty}</strong>개
              </span>
              <span className="text-xs text-gray-500">{lot.id}</span>
            </div>
          ))}
        </div>

        {/* 병합 후 수량 */}
        <p className="text-sm font-semibold text-green-600 mb-6">
          병합 후 총 수량: <strong className="text-lg">{totalQty}</strong>개
        </p>

        {/* 버튼 */}
        <div className="flex space-x-2">
          <button
            onClick={onClose}
            className="flex-1 px-4 py-2 bg-gray-300 text-gray-700 rounded-md hover:bg-gray-400"
          >
            취소
          </button>
          <button
            onClick={handleMerge}
            className="flex-1 px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700"
          >
            ✅ 병합 확인
          </button>
        </div>
      </div>
    </div>
  );
};

export default MergeModal;
