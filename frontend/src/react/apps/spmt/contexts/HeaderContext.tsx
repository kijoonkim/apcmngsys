// contexts/HeaderContext.tsx
import React, { createContext, useContext, useState, ReactNode } from 'react';

interface HeaderContextType {
  selectedDate: Date | null;
  setSelectedDate: (date: Date | null) => void;

  selectedWarehouse: string;
  setSelectedWarehouse: (warehouse: string) => void;
}

const HeaderContext = createContext<HeaderContextType | undefined>(undefined);

export const HeaderProvider: React.FC<{ children: ReactNode }> = ({ children }) => {
  const [selectedDate, setSelectedDate] = useState<Date | null>(new Date());
  const [selectedWarehouse, setSelectedWarehouse] = useState<string>('');

  return (
    <HeaderContext.Provider
      value={{
        selectedDate,
        setSelectedDate,
        selectedWarehouse,
        setSelectedWarehouse,
      }}
    >
      {children}
    </HeaderContext.Provider>
  );
};

export const useHeader = () => {
  const context = useContext(HeaderContext);
  if (!context) {
    throw new Error('useHeader must be used within HeaderProvider');
  }
  return context;
};
