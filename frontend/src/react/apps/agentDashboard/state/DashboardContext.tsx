// state/DashboardContext.tsx
import { createContext, useContext, useState } from 'react';

type Ctx = { regionCode: string; setRegionCode: (v: string) => void };
const DashboardCtx = createContext<Ctx | null>(null);

export function DashboardProvider({ children }: { children: React.ReactNode }) {
  const [regionCode, setRegionCode] = useState('11B10101'); // 기본값
  return (
    <DashboardCtx.Provider value={{ regionCode, setRegionCode }}>{children}</DashboardCtx.Provider>
  );
}
export const useDashboard = () => {
  const ctx = useContext(DashboardCtx);
  if (!ctx) throw new Error('useDashboard must be used within DashboardProvider');
  return ctx;
};
