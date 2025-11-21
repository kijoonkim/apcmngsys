// src/pages/userDashboard/hooks/useChartData.ts
import { useMemo } from 'react';
import type { ItemData, SummaryData } from '../types/dashboard';

interface ChartData {
  warehouse: ItemData[];
  sorting: ItemData[];
  shipment: ItemData[];
  cards: {
    warehouse: number;
    sorting: number;
    shipment: number;
  };
}

export const useChartData = (
  itemData: ItemData[] | undefined,
  summaryData: SummaryData[] | undefined,
): ChartData => {
  return useMemo(() => {
    const warehouse = itemData?.filter((d) => d.RSLT_TYPE === '01') || [];
    const sorting = itemData?.filter((d) => d.RSLT_TYPE === '02') || [];
    const shipment = itemData?.filter((d) => d.RSLT_TYPE === '03') || [];

    const cards = {
      warehouse: summaryData?.find((d) => d.RSLT_TYPE === '01')?.WGHT || 0,
      sorting: summaryData?.find((d) => d.RSLT_TYPE === '02')?.WGHT || 0,
      shipment: summaryData?.find((d) => d.RSLT_TYPE === '03')?.WGHT || 0,
    };

    return { warehouse, sorting, shipment, cards };
  }, [itemData, summaryData]);
};
