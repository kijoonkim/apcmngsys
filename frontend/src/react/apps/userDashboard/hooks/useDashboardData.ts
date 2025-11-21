// src/pages/userDashboard/hooks/useDashboardData.ts
import { useState, useEffect, useCallback } from 'react';
import { dashboardApi } from '../api/dashboardApi';
import type { ItemData, SummaryData, TrendData } from '../types/dashboard';

interface DashboardData {
  itemMM: ItemData[];
  itemYY: ItemData[];
  summaryMM: SummaryData[];
  summaryYY: SummaryData[];
  trendData: TrendData[];
}
interface MenuHistoryData {
  menuId: string;
  menuNm: string;
}

export const useDashboardData = (apcCd: string, ymd: string) => {
  const [data, setData] = useState<DashboardData | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchData = useCallback(async () => {
    if (!apcCd || !ymd) return;

    setLoading(true);
    setError(null);

    try {
      const response = await dashboardApi.selectData(apcCd, ymd);

      if (response.resultStatus !== 'S') {
        throw new Error(response.resultMessage);
      }

      setData({
        itemMM: response.R_CUR_ITEM_MM || [],
        itemYY: response.R_CUR_ITEM_YY || [],
        summaryMM: response.R_CUR_SMRY_MM || [],
        summaryYY: response.R_CUR_SMRY_YY || [],
        trendData: response.R_CUR_ITEM_TRC || [],
      });
    } catch (err) {
      setError(err instanceof Error ? err.message : '데이터 조회 실패');
    } finally {
      setLoading(false);
    }
  }, [apcCd, ymd]);

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  return { data, loading, error, refetch: fetchData };
};
export const useMenuHistory = (userId: string) => {
  const [menuHistoryData, setMenuHistoryData] = useState<MenuHistoryData | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchMenuHistory = async () => {
      setLoading(true);
      try {
        const response = await dashboardApi.selectMenuHistroyData(userId);

        if (response.resultStatus !== 'S') {
          throw new Error(response.resultMessage);
        }

        setMenuHistoryData(
          response.resultList.map((i) => {
            return { menuId: i.menuId, menuNm: i.menuNm, prslDt: i.prslDt };
          }),
        );
      } catch (err) {
        console.error('메뉴 히스토리 에러:', err);
        setError(err instanceof Error ? err.message : '메뉴 히스토리 조회 실패');
      } finally {
        setLoading(false);
      }
    };

    if (userId) {
      fetchMenuHistory(); // 👈 그냥 호출만
    }
  }, []);

  return { menuHistoryData, loading, error };
};
