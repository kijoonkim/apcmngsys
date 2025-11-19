// contexts/GridContext.tsx
import React, { createContext, useContext, useState, useCallback, ReactNode } from 'react';

type AppMode = 'view' | 'split' | 'shipment';

export interface ProducerRow {
  id: string;
  producer: { name: string; code: string } | null;
  // 등급별 수량 등 추가 데이터
}

interface GridContextType {
  // 상태
  rows: ProducerRow[];
  currentMode: AppMode;
  isModalOpen: boolean;
  selectedRowIndex: number | null;

  // 상태 변경 함수
  setRows: (rows: ProducerRow[] | ((prev: ProducerRow[]) => ProducerRow[])) => void;
  updateRow: (index: number, row: Partial<ProducerRow>) => void;
  setCurrentMode: (mode: AppMode) => void;
  openModal: (rowIndex: number) => void;
  closeModal: () => void;
}

const GridContext = createContext<GridContextType | undefined>(undefined);

const INITIAL_ROWS = Array.from({ length: 25 }, (_, i) => ({
  id: `row-${i}`,
  producer: null,
}));

export const GridProvider: React.FC<{ children: ReactNode }> = ({ children }) => {
  const [rows, setRows] = useState<ProducerRow[]>(INITIAL_ROWS);
  const [currentMode, setCurrentMode] = useState<AppMode>('view');
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [selectedRowIndex, setSelectedRowIndex] = useState<number | null>(null);

  // 특정 행만 업데이트
  const updateRow = useCallback((index: number, rowData: Partial<ProducerRow>) => {
    setRows((prev) => {
      const newRows = [...prev];
      newRows[index] = { ...newRows[index], ...rowData };
      return newRows;
    });
  }, []);

  // 모달 열기
  const openModal = useCallback((rowIndex: number) => {
    setSelectedRowIndex(rowIndex);
    setIsModalOpen(true);
  }, []);

  // 모달 닫기
  const closeModal = useCallback(() => {
    setIsModalOpen(false);
    setSelectedRowIndex(null);
  }, []);

  return (
    <GridContext.Provider
      value={{
        rows,
        currentMode,
        isModalOpen,
        selectedRowIndex,
        setRows,
        updateRow,
        setCurrentMode,
        openModal,
        closeModal,
      }}
    >
      {children}
    </GridContext.Provider>
  );
};

export const useGrid = () => {
  const context = useContext(GridContext);
  if (!context) {
    throw new Error('useGrid must be used within GridProvider');
  }
  return context;
};

// 편의 Hook
export const useGridMode = () => {
  const { currentMode, setCurrentMode } = useGrid();
  return { currentMode, setCurrentMode };
};

export const useGridRows = () => {
  const { rows, setRows, updateRow } = useGrid();
  return { rows, setRows, updateRow };
};
