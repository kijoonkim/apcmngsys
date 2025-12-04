// src/pages/userDashboard/hooks/useTrendData.ts
import { useMemo } from 'react';
import type { TrendData } from '../types/dashboard';

interface TrendChartData {
  chartData: Array<{ name: string; data: number[] }>;
  labels: string[];
}

export const useTrendData = (
  trendData: TrendData[] | undefined,
  trendType: '01' | '02' | '03',
  baseDate: Date,
): TrendChartData => {
  return useMemo(() => {
    if (!trendData || trendData.length === 0) {
      return { chartData: [], labels: [] };
    }

    // 품목별로 그룹화
    const grouped = trendData.reduce(
      (acc, item) => {
        if (!acc[item.ITEM_NM]) {
          acc[item.ITEM_NM] = [];
        }
        acc[item.ITEM_NM].push(item);
        return acc;
      },
      {} as Record<string, TrendData[]>,
    );

    // 차트 데이터 포맷
    const chartData = Object.entries(grouped).map(([itemNm, data]) => {
      const filtered = data.find((d) => d.RSLT_TYPE === trendType);

      if (!filtered) {
        return { name: itemNm, data: Array(12).fill(0) };
      }

      return {
        name: itemNm,
        data: [
          filtered.W_11,
          filtered.W_10,
          filtered.W_9,
          filtered.W_8,
          filtered.W_7,
          filtered.W_6,
          filtered.W_5,
          filtered.W_4,
          filtered.W_3,
          filtered.W_2,
          filtered.W_1,
          filtered.W_0,
        ],
      };
    });

    // X축 라벨 생성 (12개월)
    const month = baseDate.getMonth() + 1;
    const year = baseDate.getFullYear() % 100;

    const labels = Array.from({ length: 12 }, (_, i) => {
      const m = (month + i) % 12 || 12;
      const currentYear = m < month ? year + 1 : year;
      return m === 1 ? `'${currentYear}년 ${m}월` : `${m}월`;
    });

    return { chartData, labels };
  }, [trendData, trendType, baseDate]);
};
