/**
 * 상단 컨트롤 패널
 * - 모드 전환 (보기/분할/출하)
 * - 거래처 선택
 * - 출하 저장
 * - 서버 저장
 */

import React from 'react';
import {
  useInventory,
  useInventoryMode,
  useShipment,
  useSnapshot,
} from '../contexts/InventoryContext';

const ControlPanel: React.FC = () => {
  const { mode, setMode } = useInventoryMode();
  const { currentClient, setCurrentClient, activeShipmentGrade, pendingLotIds, saveShipment } =
    useShipment();
  const { clients, grades, lotData, saveToServer, isLoading, isDirty } = useInventory();
  const { saveSnapshot, lastSavedAt } = useSnapshot();
  const clientsArray = Object.values(clients);

  // 출하 저장 핸들러
  const handleSaveShipment = () => {
    const result = saveShipment();
    if (result.success) {
      alert(`✅ 출하 등록 완료!\n- ${result.count}개 재고\n- 총 ${result.totalQty}개`);
    } else {
      alert('❌ 출하 등록 실패: 거래처를 선택하고 재고를 선택하세요.');
    }
  };

  // 서버 저장 핸들러
  const handleSaveToServer = async () => {
    if (!isDirty) {
      alert('저장할 변경사항이 없습니다.');
      return;
    }

    if (!confirm('서버에 저장하시겠습니까?')) return;

    const success = await saveToServer();
    if (success) {
      alert('✅ 서버 저장 완료!');
    } else {
      alert('❌ 서버 저장 실패');
    }
  };

  // 수동 스냅샷 저장
  const handleManualSnapshot = () => {
    saveSnapshot();
    alert('✅ 스냅샷 저장 완료!');
  };

  // 모드별 스타일
  const getModeClass = (modeName: string) =>
    mode === modeName
      ? 'bg-blue-600 text-white'
      : 'bg-white text-gray-700 border border-gray-300 hover:bg-gray-100';

  // 거래처별 스타일
  const getClientClass = (clientId: string) => {
    const client = clients[clientId];
    const base = 'px-4 py-2 rounded-md font-medium';
    const active = currentClient === clientId ? 'ring-2 ring-offset-2 ring-blue-500' : '';
    return `${base} ${client.color} ${client.bgColor} ${active}`;
  };

  // 출하 합계
  const shipmentTotals = React.useMemo(() => {
    const totals: Record<string, number> = {};
    Object.keys(clients).forEach((id) => (totals[id] = 0));

    for (const cellKey in lotData) {
      lotData[cellKey].forEach((lot) => {
        if (lot.shipmentId && totals[lot.shipmentId] !== undefined) {
          totals[lot.shipmentId] += lot.qty;
        }
      });
    }
    return totals;
  }, [clients, lotData]);

  return (
    <header className="bg-white shadow-md">
      {/* 상단: 제목 + 모드 버튼 */}
      <div className="px-6 py-4 border-b border-gray-200">
        <div className="flex justify-between items-center">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">선별 실적 등록</h1>
            <p className="text-sm text-gray-500 mt-1">원물재고 → 선별실적 → 출하실적 일괄 관리</p>
          </div>

          <div className="flex items-center space-x-3">
            {/* 모드 전환 */}
            <button
              onClick={() => setMode('view')}
              className={`px-4 py-2 rounded-md font-medium ${getModeClass('view')}`}
            >
              📋 보기
            </button>
            <button
              onClick={() => setMode('split')}
              className={`px-4 py-2 rounded-md font-medium ${getModeClass('split')}`}
            >
              ✂️ 재고 분할/병합
            </button>
            <button
              onClick={() => setMode('shipment')}
              className={`px-4 py-2 rounded-md font-medium ${getModeClass('shipment')}`}
            >
              🚛 출하 등록
            </button>

            {/* 구분선 */}
            <div className="h-8 w-px bg-gray-300"></div>

            {/* 수동 저장 */}
            <button
              onClick={handleManualSnapshot}
              className="px-4 py-2 rounded-md bg-gray-100 text-gray-700 hover:bg-gray-200 font-medium"
              title="현재 상태 저장"
            >
              💾 임시저장
            </button>

            {/* 서버 저장 */}
            <button
              onClick={handleSaveToServer}
              disabled={isLoading || !isDirty}
              className={`px-4 py-2 rounded-md font-medium ${
                isDirty
                  ? 'bg-green-600 text-white hover:bg-green-700'
                  : 'bg-gray-300 text-gray-500 cursor-not-allowed'
              }`}
            >
              {isLoading ? '⏳ 저장 중...' : '✅ 서버 저장'}
            </button>
          </div>
        </div>
      </div>

      {/* 출하 모드 패널 */}
      {mode === 'shipment' && (
        <div className="px-6 py-4 bg-blue-50 border-b border-blue-200">
          <div className="flex items-center justify-between">
            <div className="flex-1">
              <h4 className="font-semibold text-gray-800 mb-2">1️⃣ 거래처(출하처) 선택:</h4>
              <div className="flex items-center space-x-3">
                {/* 배열 그대로 map */}
                {clientsArray.map((client) => (
                  <button
                    key={client.id}
                    onClick={() => setCurrentClient(client.id)}
                    className={getClientClass(client.id)}
                  >
                    {client.name}
                    <span className="ml-2 font-bold">({shipmentTotals[client.id] || 0}개)</span>
                  </button>
                ))}
              </div>
            </div>

            <button
              onClick={handleSaveShipment}
              disabled={pendingLotIds.size === 0}
              className="px-6 py-3 bg-green-600 text-white rounded-md hover:bg-green-700 disabled:bg-gray-400 font-medium"
            >
              출하 등록 ({pendingLotIds.size}개 선택)
            </button>
          </div>

          <div className="mt-3 space-y-1">
            <p className="text-sm text-gray-700">
              2️⃣ 같은 등급(열)에서 여러 재고를 클릭하세요.
              {activeShipmentGrade && (
                <span className="ml-2 font-bold text-blue-600">
                  (현재 '{grades.find((g) => g.grdCd === activeShipmentGrade)?.grdNm}' 열)
                </span>
              )}
            </p>
            <p className="text-xs text-purple-600 font-semibold">
              💡 저장 시 보라색 테두리로 묶입니다. 마우스 올리면 합계 표시!
            </p>
          </div>
        </div>
      )}

      {/* 분할 모드 패널 */}
      {mode === 'split' && (
        <div className="px-6 py-4 bg-purple-50 border-b border-purple-200">
          <p className="text-sm text-gray-700">
            <span className="font-semibold">✂️ 재고 분할:</span> 단일 재고 클릭 시 분할 모달
            <br />
            <span className="font-semibold">🔗 재고 병합:</span> 여러 재고가 있는 셀 클릭 시 병합
            모달
          </p>
        </div>
      )}
    </header>
  );
};

export default ControlPanel;
