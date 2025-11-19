/**
 * 통합 재고 관리 Context
 * - 원물재고, 선별실적, 출하실적을 한 번에 관리
 * - 로컬스토리지 자동 저장
 * - 브라우저 종료 시 복구
 */

import React, { createContext, useContext, useState, useCallback, useEffect, useRef } from 'react';

// ============================================
// Types
// ============================================

export interface Lot {
  id: string; // 고유 ID
  qty: number; // 수량
  originalQty?: number; // 원본 수량 (분할 추적용)
  parentId?: string; // 분할된 경우 부모 ID
  shipmentId: string | null; // 출하처 ID
  groupId: string | null; // 출하 그룹 ID
  createdAt: number; // 생성 시간
  updatedAt: number; // 수정 시간
}

export interface CellData {
  [cellKey: string]: Lot[]; // "producerId_gradeId": [lot1, lot2, ...]
}

export interface Client {
  id: string;
  name: string;
  color: string;
  bgColor: string;
}

export type WorkMode = 'view' | 'split' | 'shipment';

export interface InventorySnapshot {
  timestamp: number;
  lotData: CellData;
  mode: WorkMode;
  currentClient: string | null;
  version: string; // 스냅샷 버전 (호환성 체크용)
}

// ============================================
// Context
// ============================================

interface InventoryContextType {
  // ========== 정적 데이터 ==========
  apcCd: string;
  producers: string[];
  grades: Array<{ id: string; name: string }>;
  clients: Record<string, Client>;

  // ========== 동적 데이터 (재고) ==========
  lotData: CellData;
  setLotData: React.Dispatch<React.SetStateAction<CellData>>;
  updateCell: (cellKey: string, lots: Lot[]) => void;

  // ========== 모드 관리 ==========
  mode: WorkMode;
  setMode: (mode: WorkMode) => void;

  // ========== 출하 관련 ==========
  currentClient: string | null;
  setCurrentClient: (clientId: string | null) => void;
  activeShipmentGrade: string | null;
  setActiveShipmentGrade: (gradeId: string | null) => void;
  pendingLotIds: Set<string>;
  togglePendingLot: (lotId: string) => void;
  clearPendingLots: () => void;

  // ========== 재고 분할/병합 ==========
  splitLot: (cellKey: string, lot: Lot, quantities: number[]) => void;
  mergeLots: (cellKey: string, lots: Lot[]) => void;

  // ========== 출하 등록 ==========
  saveShipment: () => { success: boolean; count: number; totalQty: number };

  // ========== 스냅샷 관리 ==========
  saveSnapshot: () => void;
  loadSnapshot: () => boolean;
  clearSnapshot: () => void;
  hasSnapshot: boolean;
  showRestoreDialog: boolean;
  lastSavedAt: number | null;

  // ========== 서버 저장 ==========
  saveToServer: () => Promise<boolean>;
  isLoading: boolean;
  isDirty: boolean; // 저장되지 않은 변경사항 있는지
}

const InventoryContext = createContext<InventoryContextType | undefined>(undefined);

// ============================================
// Constants
// ============================================

const STORAGE_KEY = 'inventory_snapshot';
const AUTOSAVE_INTERVAL = 10000; // 10초
const SNAPSHOT_VERSION = '1.0';

// ============================================
// Provider
// ============================================

interface InventoryProviderProps {
  children: React.ReactNode;
  apcCd: string;
  itemCd: string;
  vrtyCd: string;
  producers: string[];
  grades: Array<{ id: string; name: string }>;
  clients: Record<string, Client>;
  initialData?: CellData;
}

export const InventoryProvider: React.FC<InventoryProviderProps> = ({
  children,
  apcCd,
  itemCd,
  vrtyCd,
  producers,
  grades,
  clients,
  initialData = {},
}) => {
  // ========== 상태 ==========
  const [lotData, setLotData] = useState<CellData>(initialData);
  const [mode, setMode] = useState<WorkMode>('view');
  const [currentClient, setCurrentClient] = useState<string | null>(null);
  const [activeShipmentGrade, setActiveShipmentGrade] = useState<string | null>(null);
  const [pendingLotIds, setPendingLotIds] = useState<Set<string>>(new Set());
  const [hasSnapshot, setHasSnapshot] = useState(false);
  const [showRestoreDialog, setShowRestoreDialog] = useState(false); // 복원 컨펌 표시
  const [lastSavedAt, setLastSavedAt] = useState<number | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [isDirty, setIsDirty] = useState(false);

  const autosaveTimerRef = useRef<NodeJS.Timeout>();

  // ========== 초기화: 스냅샷 체크 (최초 1번만) ==========
  useEffect(() => {
    const snapshot = localStorage.getItem(STORAGE_KEY);
    if (snapshot) {
      setHasSnapshot(true);
      setShowRestoreDialog(true); // 컨펌 다이얼로그 표시
    }
  }, []);

  // ========== 자동 저장 ==========
  useEffect(() => {
    if (isDirty) {
      // 변경사항 있으면 10초 후 자동 저장
      autosaveTimerRef.current = setTimeout(() => {
        saveSnapshot();
      }, AUTOSAVE_INTERVAL);
    }

    return () => {
      if (autosaveTimerRef.current) {
        clearTimeout(autosaveTimerRef.current);
      }
    };
  }, [lotData, mode, currentClient, isDirty]);

  // ========== lotData 변경 감지 ==========
  const isInitialMount = useRef(true);

  useEffect(() => {
    // 첫 마운트는 무시
    if (isInitialMount.current) {
      isInitialMount.current = false;
      return;
    }

    // 실제 사용자 액션에 의한 변경만 dirty로 표시
    setIsDirty(true);
  }, [lotData]);

  // ========== 셀 업데이트 ==========
  const updateCell = useCallback((cellKey: string, lots: Lot[]) => {
    setLotData((prev) => ({
      ...prev,
      [cellKey]: lots.map((lot) => ({
        ...lot,
        updatedAt: Date.now(),
      })),
    }));
  }, []);

  // ========== 재고 분할 ==========
  const splitLot = useCallback(
    (cellKey: string, lot: Lot, quantities: number[]) => {
      const now = Date.now();
      const newLots = quantities.map((qty) => ({
        id: `${lot.id}-split-${Math.random().toString(36).substr(2, 9)}`,
        qty,
        originalQty: lot.qty,
        parentId: lot.id,
        shipmentId: null,
        groupId: null,
        createdAt: now,
        updatedAt: now,
      }));

      updateCell(cellKey, newLots);
    },
    [updateCell],
  );

  // ========== 재고 병합 ==========
  const mergeLots = useCallback(
    (cellKey: string, lots: Lot[]) => {
      const totalQty = lots.reduce((sum, lot) => sum + lot.qty, 0);
      const now = Date.now();

      const mergedLot: Lot = {
        id: `merged-${now}`,
        qty: totalQty,
        shipmentId: null,
        groupId: null,
        createdAt: now,
        updatedAt: now,
      };

      updateCell(cellKey, [mergedLot]);
    },
    [updateCell],
  );

  // ========== Pending Lot 토글 ==========
  const togglePendingLot = useCallback((lotId: string) => {
    setPendingLotIds((prev) => {
      const newSet = new Set(prev);
      if (newSet.has(lotId)) {
        newSet.delete(lotId);
      } else {
        newSet.add(lotId);
      }
      return newSet;
    });
  }, []);

  const clearPendingLots = useCallback(() => {
    setPendingLotIds(new Set());
  }, []);

  // ========== 출하 등록 ==========
  const saveShipment = useCallback(() => {
    if (pendingLotIds.size === 0 || !currentClient) {
      return { success: false, count: 0, totalQty: 0 };
    }

    const groupId = `G-${Date.now()}`;
    let count = 0;
    let totalQty = 0;

    const newLotData = { ...lotData };

    for (const cellKey in newLotData) {
      newLotData[cellKey] = newLotData[cellKey].map((lot) => {
        if (pendingLotIds.has(lot.id)) {
          count++;
          totalQty += lot.qty;
          return {
            ...lot,
            shipmentId: currentClient,
            groupId,
            updatedAt: Date.now(),
          };
        }
        return lot;
      });
    }

    setLotData(newLotData);
    clearPendingLots();
    setActiveShipmentGrade(null);

    return { success: true, count, totalQty };
  }, [pendingLotIds, currentClient, lotData, clearPendingLots]);

  // ========== 스냅샷 저장 ==========
  const saveSnapshot = useCallback(() => {
    const snapshot: InventorySnapshot = {
      timestamp: Date.now(),
      lotData,
      mode,
      currentClient,
      version: SNAPSHOT_VERSION,
    };

    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(snapshot));
      setLastSavedAt(snapshot.timestamp);
      setHasSnapshot(true);
      setIsDirty(false);
      console.log('✅ 스냅샷 저장 완료:', new Date(snapshot.timestamp).toLocaleTimeString());
    } catch (error) {
      console.error('❌ 스냅샷 저장 실패:', error);
    }
  }, [lotData, mode, currentClient]);

  // ========== 스냅샷 로드 ==========
  const loadSnapshot = useCallback(() => {
    try {
      const saved = localStorage.getItem(STORAGE_KEY);
      if (!saved) return false;

      const snapshot: InventorySnapshot = JSON.parse(saved);

      // 버전 체크
      if (snapshot.version !== SNAPSHOT_VERSION) {
        console.warn('⚠️ 스냅샷 버전이 다릅니다. 로드하지 않습니다.');
        return false;
      }

      // 데이터 복원
      setIsDirty(false); // ← 먼저 false로!
      setLotData(snapshot.lotData);
      setMode(snapshot.mode);
      setCurrentClient(snapshot.currentClient);
      setLastSavedAt(snapshot.timestamp);

      // 컨펌 다이얼로그만 닫기 (localStorage는 유지!)
      setShowRestoreDialog(false);
      // hasSnapshot은 true 유지 (자동 저장 계속)

      console.log('✅ 스냅샷 복원 완료:', new Date(snapshot.timestamp).toLocaleTimeString());
      return true;
    } catch (error) {
      console.error('❌ 스냅샷 로드 실패:', error);
      return false;
    }
  }, []);

  // ========== 스냅샷 삭제 ==========
  const clearSnapshot = useCallback(() => {
    localStorage.removeItem(STORAGE_KEY);
    setHasSnapshot(false);
    setShowRestoreDialog(false); // 컨펌 다이얼로그 닫기
    console.log('🗑️ 스냅샷 삭제 완료');
  }, []);

  // ========== 서버 저장 ==========
  const saveToServer = useCallback(async () => {
    setIsLoading(true);

    try {
      // 저장 데이터 포맷팅
      const saveData = {
        apcCd,
        itemCd,
        vrtyCd,
        regDt: new Date().toISOString().split('T')[0],
        lotData: Object.entries(lotData).flatMap(([cellKey, lots]) => {
          const [producerId, gradeId] = cellKey.split('_');
          return lots.map((lot) => ({
            producerId,
            gradeId,
            lotId: lot.id,
            qty: lot.qty,
            shipmentId: lot.shipmentId,
            groupId: lot.groupId,
          }));
        }),
      };

      // 서버 API 호출
      const response = await fetch('/api/inventory/save', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(saveData),
      });

      if (!response.ok) throw new Error('서버 저장 실패');

      // 성공 시 스냅샷 삭제
      localStorage.removeItem(STORAGE_KEY);
      setHasSnapshot(false);
      setShowRestoreDialog(false);
      setIsDirty(false);

      console.log('✅ 서버 저장 완료');
      return true;
    } catch (error) {
      console.error('❌ 서버 저장 실패:', error);
      return false;
    } finally {
      setIsLoading(false);
    }
  }, [apcCd, itemCd, vrtyCd, lotData]);

  // ========== Context Value ==========
  const value: InventoryContextType = {
    // 정적
    apcCd,
    producers,
    grades,
    clients,

    // 재고 데이터
    lotData,
    setLotData,
    updateCell,

    // 모드
    mode,
    setMode,

    // 출하
    currentClient,
    setCurrentClient,
    activeShipmentGrade,
    setActiveShipmentGrade,
    pendingLotIds,
    togglePendingLot,
    clearPendingLots,

    // 작업
    splitLot,
    mergeLots,
    saveShipment,

    // 스냅샷
    saveSnapshot,
    loadSnapshot,
    clearSnapshot,
    hasSnapshot,
    showRestoreDialog,
    lastSavedAt,

    // 서버
    saveToServer,
    isLoading,
    isDirty,
  };

  return <InventoryContext.Provider value={value}>{children}</InventoryContext.Provider>;
};

// ============================================
// Hooks
// ============================================

export const useInventory = () => {
  const context = useContext(InventoryContext);
  if (!context) {
    throw new Error('useInventory must be used within InventoryProvider');
  }
  return context;
};

// 개별 Hook들
export const useInventoryData = () => {
  const { lotData, updateCell } = useInventory();
  return { lotData, updateCell };
};

export const useInventoryMode = () => {
  const { mode, setMode } = useInventory();
  return { mode, setMode };
};

export const useShipment = () => {
  const {
    currentClient,
    setCurrentClient,
    activeShipmentGrade,
    setActiveShipmentGrade,
    pendingLotIds,
    togglePendingLot,
    clearPendingLots,
    saveShipment,
  } = useInventory();

  return {
    currentClient,
    setCurrentClient,
    activeShipmentGrade,
    setActiveShipmentGrade,
    pendingLotIds,
    togglePendingLot,
    clearPendingLots,
    saveShipment,
  };
};

export const useInventoryActions = () => {
  const { splitLot, mergeLots, saveToServer } = useInventory();
  return { splitLot, mergeLots, saveToServer };
};

export const useSnapshot = () => {
  const {
    saveSnapshot,
    loadSnapshot,
    clearSnapshot,
    hasSnapshot,
    showRestoreDialog,
    lastSavedAt,
    isDirty,
  } = useInventory();
  return {
    saveSnapshot,
    loadSnapshot,
    clearSnapshot,
    hasSnapshot,
    showRestoreDialog,
    lastSavedAt,
    isDirty,
  };
};
