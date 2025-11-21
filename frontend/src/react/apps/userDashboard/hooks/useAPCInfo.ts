// src/pages/userDashboard/hooks/useAPCInfo.ts
import { useState, useEffect } from 'react';
import { dashboardApi } from '../api/dashboardApi';
import type { APCInfo, APCCounts } from '../types/dashboard';

export const useAPCInfo = (apcCd: string) => {
  const [apcInfo, setApcInfo] = useState<APCInfo | null>(null);
  const [itemList, setItemList] = useState<string[]>([]);
  const [counts, setCounts] = useState<APCCounts>({
    prdcr: 0,
    oprtr: 0,
    user: 0,
    cnpt: 0,
  });
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    const fetchAll = async () => {
      if (!apcCd) return;

      setLoading(true);
      try {
        const [info, items, prdcr, oprtr, user, cnpt] = await Promise.all([
          dashboardApi.selectApcInfo(apcCd),
          dashboardApi.getItems(apcCd),
          dashboardApi.getPrdcrs(apcCd),
          dashboardApi.getOprtrList(apcCd),
          dashboardApi.getUserList(apcCd),
          dashboardApi.getCnptList(apcCd),
        ]);

        // corpNm을 apcNm으로 설정
        if (info) {
          info.corpNm = info.apcNm;
        }

        setApcInfo(info);
        setItemList(
          items
            ?.filter((item: any) => item.itemNm)
            .map((item: any) => item.itemNm)
            .slice(0, 5) || [],
        );
        setCounts({
          prdcr: prdcr?.length || 0,
          oprtr: oprtr?.length || 0,
          user: user?.length || 0,
          cnpt: cnpt?.length || 0,
        });
      } catch (err) {
        console.error('APC 정보 조회 실패:', err);
      } finally {
        setLoading(false);
      }
    };

    fetchAll();
  }, [apcCd]);

  return { apcInfo, itemList, counts, loading };
};
