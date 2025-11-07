import React, { useState, useMemo, useLayoutEffect, useRef } from 'react';

import GroupOverlay from '@apps/spmt/components/GroupOverlay';
import CellContainer from '@apps/spmt/components/CellContainer';

const PRODUCERS = ['541', '458', '327', '533', '485', '324', '601', '602'];
const GRADES = [
  { id: 'gasan', name: '가로적' },
  { id: 'jeoksang', name: '적특상' },
  { id: 'teuksang', name: '특상' },
  { id: 'sang', name: '상' },
  { id: 'geomteuk', name: '검특' },
  { id: 'cheongsang', name: '청상' },
  { id: 'geom', name: '검상' },
  { id: 'gam', name: '감' },
];

const CLIENTS = {
  C_YELLOW: {
    name: '(주)가락시장',
    color: 'border-yellow-400',
    bgColor: 'bg-yellow-50',
    borderStyle: 'border-4',
  },
  C_RED: {
    name: '청과물유통',
    color: 'border-red-400',
    bgColor: 'bg-red-50',
    borderStyle: 'border-4',
  },
  C_GREEN: {
    name: '하나로마트',
    color: 'border-green-400',
    bgColor: 'bg-green-50',
    borderStyle: 'border-4',
  },
};

const BASE_LOT_DATA = {
  '541_gasan': [{ id: 'L1', qty: 7, shipmentId: 'C_YELLOW', groupId: null }],
  '541_jeoksang': [{ id: 'L2', qty: 1, shipmentId: 'C_YELLOW', groupId: null }],
  '541_teuksang': [
    { id: 'L3', qty: 10, shipmentId: 'C_YELLOW', groupId: null },
    { id: 'L4', qty: 6, shipmentId: null, groupId: null },
  ],
  '541_sang': [{ id: 'L5', qty: 2, shipmentId: 'C_YELLOW', groupId: null }],
  '541_geomteuk': [{ id: 'L6', qty: 10, shipmentId: 'C_YELLOW', groupId: null }],
  '458_teuksang': [
    { id: 'L7', qty: 2, shipmentId: 'C_YELLOW', groupId: null },
    { id: 'L8', qty: 3, shipmentId: 'C_RED', groupId: null },
    { id: 'L9', qty: 1, shipmentId: null, groupId: null },
    { id: 'L10', qty: 4, shipmentId: null, groupId: null },
  ],
  '327_gasan': [{ id: 'L11', qty: 2, shipmentId: 'C_RED', groupId: null }],
  '327_jeoksang': [{ id: 'L12', qty: 3, shipmentId: 'C_RED', groupId: null }],
};

const createLot = (qty, shipmentId = null, groupId = null) => ({
  id: `L-${Math.random().toString(36).substring(2, 9)}`,
  qty,
  shipmentId,
  groupId,
});

const generateFullData = (baseData) => {
  const fullData = { ...baseData };
  PRODUCERS.forEach((producerId) => {
    GRADES.forEach((grade) => {
      const cellKey = `${producerId}_${grade.id}`;
      if (fullData[cellKey]) return;
      const rand = Math.random();
      if (rand < 0.3) fullData[cellKey] = [];
      else if (rand < 0.7) fullData[cellKey] = [createLot(Math.floor(Math.random() * 20) + 1)];
      else if (rand < 0.9)
        fullData[cellKey] = [
          createLot(Math.floor(Math.random() * 10) + 1),
          createLot(Math.floor(Math.random() * 10) + 1),
        ];
      else
        fullData[cellKey] = [
          createLot(Math.floor(Math.random() * 5) + 1),
          createLot(Math.floor(Math.random() * 5) + 1),
          createLot(Math.floor(Math.random() * 5) + 1),
          createLot(Math.floor(Math.random() * 5) + 1),
        ];
    });
  });
  return fullData;
};

const MergeModal = ({ isOpen, lots, onClose, onMerge }) => {
  if (!isOpen || !lots || lots.length === 0) return null;
  const totalQty = lots.reduce((sum, lot) => sum + lot.qty, 0);
  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
      <div className="bg-white p-6 rounded-lg shadow-xl max-w-md w-full">
        <h3 className="text-xl font-bold mb-4">재고 병합</h3>
        <p className="text-sm text-gray-600 mb-4">아래 재고들을 하나로 병합합니다.</p>
        <div className="border border-gray-300 rounded-md p-3 space-y-2 mb-4">
          {lots.map((lot, idx) => (
            <div key={lot.id} className="flex items-center justify-between bg-gray-50 p-2 rounded">
              <span className="text-sm">
                Lot {idx + 1}: <strong>{lot.qty}</strong>개
              </span>
            </div>
          ))}
        </div>
        <p className="text-sm font-semibold text-green-600 mb-4">
          병합 후 총 수량: <strong>{totalQty}</strong>개
        </p>
        <div className="flex space-x-2">
          <button
            onClick={onClose}
            className="flex-1 px-4 py-2 bg-gray-300 text-gray-700 rounded-md hover:bg-gray-400"
          >
            취소
          </button>
          <button
            onClick={onMerge}
            className="flex-1 px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700"
          >
            병합 확인
          </button>
        </div>
      </div>
    </div>
  );
};

export default function App() {
  const [lotData, setLotData] = useState(() => generateFullData(BASE_LOT_DATA));
  const [mode, setMode] = useState('view');
  const [currentClient, setCurrentClient] = useState(null);
  const [activeShipmentGrade, setActiveShipmentGrade] = useState(null);
  const [pendingLotIds, setPendingLotIds] = useState(new Set());
  const [splitModal, setSplitModal] = useState({ isOpen: false, lot: null, cellKey: null });
  const [mergeModal, setMergeModal] = useState({ isOpen: false, lots: [], cellKey: null });
  const tableContainerRef = useRef(null);

  const shipmentTotals = useMemo(() => {
    const totals = { C_YELLOW: 0, C_RED: 0, C_GREEN: 0 };
    for (const cellKey in lotData)
      (lotData[cellKey] || []).forEach((lot) => {
        if (lot.shipmentId && totals[lot.shipmentId] !== undefined)
          totals[lot.shipmentId] += lot.qty;
      });
    return totals;
  }, [lotData]);

  const columnTotals = useMemo(() => {
    const totals = {};
    GRADES.forEach((grade) => (totals[grade.id] = 0));
    for (const cellKey in lotData) {
      const gradeId = cellKey.split('_')[1];
      if (totals[gradeId] !== undefined)
        totals[gradeId] += (lotData[cellKey] || []).reduce((sum, lot) => sum + lot.qty, 0);
    }
    return totals;
  }, [lotData]);

  const handleChangeMode = (newMode) => {
    setMode(newMode);
    if (newMode !== 'shipment') {
      setCurrentClient(null);
      setActiveShipmentGrade(null);
      setPendingLotIds(new Set());
    }
  };
  const handleChangeClient = (clientId) => {
    setCurrentClient(clientId);
    setPendingLotIds(new Set());
    setActiveShipmentGrade(null);
  };

  const handleLotClick = (lot, cellKey) => {
    if (mode === 'view') return;
    if (mode === 'split') {
      const lotsInCell = lotData[cellKey] || [];
      if (lotsInCell.length === 1) setSplitModal({ isOpen: true, lot, cellKey });
      else setMergeModal({ isOpen: true, lots: lotsInCell, cellKey });
      return;
    }
    if (mode === 'shipment') {
      if (!currentClient) {
        alert('먼저 거래처를 선택하세요.');
        return;
      }
      const gradeId = cellKey.split('_')[1];
      if (!activeShipmentGrade) setActiveShipmentGrade(gradeId);
      else if (activeShipmentGrade !== gradeId) {
        alert(
          `현재 "${GRADES.find((g) => g.id === activeShipmentGrade)?.name}" 열에만 등록할 수 있습니다.`,
        );
        return;
      }
      if (lot.shipmentId) {
        alert('이미 출하 등록된 재고입니다.');
        return;
      }
      const newPending = new Set(pendingLotIds);
      if (newPending.has(lot.id)) newPending.delete(lot.id);
      else newPending.add(lot.id);
      setPendingLotIds(newPending);
    }
  };

  const handleEmptyCellClick = (cellKey) => {
    if (mode === 'split') alert('빈 셀은 분리/병합할 수 없습니다.');
  };

  const handleSaveShipment = () => {
    if (pendingLotIds.size === 0 || !currentClient) return;
    const groupId = `G-${Date.now()}`;
    const newLotData = { ...lotData };
    let selectedCount = 0,
      totalQty = 0;
    for (const cellKey in newLotData) {
      newLotData[cellKey] = newLotData[cellKey].map((lot) => {
        if (pendingLotIds.has(lot.id)) {
          selectedCount++;
          totalQty += lot.qty;
          return { ...lot, shipmentId: currentClient, groupId };
        }
        return lot;
      });
    }
    setLotData(newLotData);
    setPendingLotIds(new Set());
    setActiveShipmentGrade(null);
    alert(`출하 등록 완료! (${selectedCount}개 재고, 총 ${totalQty}개)`);
  };

  const handleSplitConfirm = (splitQtys) => {
    const { cellKey } = splitModal;
    setLotData((prev) => ({ ...prev, [cellKey]: splitQtys.map((qty) => createLot(qty)) }));
    setSplitModal({ isOpen: false, lot: null, cellKey: null });
  };

  const handleMergeConfirm = () => {
    const { lots, cellKey } = mergeModal;
    const totalQty = lots.reduce((sum, l) => sum + l.qty, 0);
    setLotData((prev) => ({
      ...prev,
      [cellKey]: [{ id: `L-merged-${Date.now()}`, qty: totalQty, shipmentId: null, groupId: null }],
    }));
    setMergeModal({ isOpen: false, lots: [], cellKey: null });
  };

  const getModeClass = (modeName) =>
    mode === modeName
      ? 'bg-blue-600 text-white'
      : 'bg-white text-gray-700 border border-gray-300 hover:bg-gray-100';
  const getClientClass = (clientId) => {
    const base = 'px-4 py-2 rounded-md font-medium text-sm';
    if (clientId === 'C_YELLOW') return `${base} bg-yellow-400 text-yellow-900`;
    if (clientId === 'C_RED') return `${base} bg-red-400 text-red-900`;
    if (clientId === 'C_GREEN') return `${base} bg-green-400 text-green-900`;
    return `${base} bg-gray-200 text-gray-800`;
  };

  return (
    <div className="p-8 bg-gray-100 min-h-screen flex flex-col">
      <style>{`@keyframes fadeIn { from { opacity: 0; transform: translateY(-5px); } to { opacity: 1; transform: translateY(0); } }`}</style>

      <header className="bg-white p-4 rounded-lg shadow-md mb-6">
        <div className="flex justify-between items-center">
          <h1 className="text-2xl font-bold">출하실적 그룹핑 (Grid + Overlay)</h1>
          <div className="flex space-x-2">
            <button
              onClick={() => handleChangeMode('view')}
              className={`px-4 py-2 rounded-md ${getModeClass('view')}`}
            >
              보기
            </button>
            <button
              onClick={() => handleChangeMode('split')}
              className={`px-4 py-2 rounded-md ${getModeClass('split')}`}
            >
              재고 분리/병합
            </button>
            <button
              onClick={() => handleChangeMode('shipment')}
              className={`px-4 py-2 rounded-md ${getModeClass('shipment')}`}
            >
              출하 등록
            </button>
          </div>
        </div>

        {mode === 'shipment' && (
          <div className="mt-4 p-3 bg-blue-50 rounded-md border border-blue-200">
            <h4 className="font-semibold text-gray-700 mb-2">1. 거래처(출하) 선택:</h4>
            <div className="flex items-center space-x-2">
              {['C_YELLOW', 'C_RED', 'C_GREEN'].map((clientId) => (
                <button
                  key={clientId}
                  onClick={() => handleChangeClient(clientId)}
                  className={`${getClientClass(clientId)} ${currentClient === clientId ? 'ring-2 ring-offset-2' : ''}`}
                >
                  {CLIENTS[clientId].name} (총 {shipmentTotals[clientId] || 0}개)
                </button>
              ))}
              <button
                onClick={handleSaveShipment}
                disabled={pendingLotIds.size === 0}
                className="ml-auto px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700 disabled:bg-gray-400"
              >
                출하 저장 ({pendingLotIds.size}개)
              </button>
            </div>
            <p className="text-sm text-gray-600 mt-2">
              2. 같은 등급(열)에서 여러 재고를 클릭하세요.{' '}
              {activeShipmentGrade && (
                <span className="font-bold text-blue-600">
                  (현재 '{GRADES.find((g) => g.id === activeShipmentGrade)?.name}' 열)
                </span>
              )}
            </p>
            <p className="text-xs text-purple-600 mt-1 font-semibold">
              💡 저장 시 보라색 테두리로 묶입니다. Hover하면 합계 표시!
            </p>
          </div>
        )}

        {mode === 'split' && (
          <div className="mt-4 p-3 bg-purple-50 rounded-md border border-purple-200">
            <p className="text-sm text-gray-600">
              분리할 재고(단일)를 클릭하면 분리 모달이, 이미 분리된 재고를 클릭하면 병합 모달이
              뜹니다.
            </p>
          </div>
        )}
      </header>

      <div
        className="flex-1 shadow-lg border border-gray-300 rounded-lg overflow-auto bg-white relative"
        ref={tableContainerRef}
      >
        <div
          className="grid"
          style={{ gridTemplateColumns: `100px repeat(${GRADES.length}, 160px)` }}
        >
          {/* Header */}
          <div className="sticky top-0 z-10 bg-gray-100 px-4 py-3 border-b-2 border-r border-gray-300 font-semibold text-gray-700">
            생산자
          </div>
          {GRADES.map((grade) => (
            <div
              key={grade.id}
              className="sticky top-0 z-10 bg-gray-100 px-4 py-3 border-b-2 border-r border-gray-300 font-semibold text-gray-700 text-center"
            >
              {grade.name}
            </div>
          ))}

          {/* Body */}
          {PRODUCERS.map((producerId) => (
            <React.Fragment key={producerId}>
              <div className="px-4 py-3 border-b border-r border-gray-200 font-bold text-lg text-center">
                {producerId}
              </div>
              {GRADES.map((grade) => {
                const cellKey = `${producerId}_${grade.id}`;
                return (
                  <div key={grade.id} className="p-0 border-b border-r border-gray-200">
                    <CellContainer
                      cellKey={cellKey}
                      lots={lotData[cellKey]}
                      clients={CLIENTS}
                      onLotClick={(lot) => handleLotClick(lot, cellKey)}
                      onEmptyCellClick={handleEmptyCellClick}
                      mode={mode}
                      activeShipmentGrade={activeShipmentGrade}
                      pendingLotIds={pendingLotIds}
                    />
                  </div>
                );
              })}
            </React.Fragment>
          ))}

          {/* Footer */}
          <div className="sticky bottom-0 z-10 bg-gray-200 px-4 py-3 border-t-4 border-r border-gray-400 font-bold text-lg text-center">
            합계
          </div>
          {GRADES.map((grade) => (
            <div
              key={grade.id}
              className="sticky bottom-0 z-10 bg-gray-200 px-4 py-3 border-t-4 border-r border-gray-400 font-bold text-lg text-blue-700 text-center"
            >
              {columnTotals[grade.id] > 0 ? columnTotals[grade.id] : '-'}
            </div>
          ))}
        </div>

        {/* 오버레이 */}
        {GRADES.map((grade) => (
          <GroupOverlay
            key={grade.id}
            gradeId={grade.id}
            lotData={lotData}
            containerRef={tableContainerRef}
          />
        ))}
      </div>

      <SplitModal
        isOpen={splitModal.isOpen}
        lot={splitModal.lot}
        onClose={() => setSplitModal({ isOpen: false, lot: null, cellKey: null })}
        onSplit={handleSplitConfirm}
      />
      <MergeModal
        isOpen={mergeModal.isOpen}
        lots={mergeModal.lots}
        onClose={() => setMergeModal({ isOpen: false, lots: [], cellKey: null })}
        onMerge={handleMergeConfirm}
      />
    </div>
  );
}
