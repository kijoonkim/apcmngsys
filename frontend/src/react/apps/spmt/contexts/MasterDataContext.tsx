// contexts/MasterDataContext.tsx
import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { postJSON } from '@lib/http';
import { gfn_getCnpts, gfn_getComCds, gfn_getPrdcrs } from '@/common/common';

interface Grade {
  grdNm: string;
  grdCd: string;
}

interface Client {
  cnptCd: string;
  cnptNm: string;
  color: string;
}

interface Warehouse {
  cdVl: string;
  cdVlNm: string;
}

interface MasterDataContextType {
  // 정적 데이터
  apcCd: string;
  itemCd: string;
  grades: Grade[];
  producers: string[];
  clients: Client[];
  warehouses: Warehouse[];

  // 로딩 상태
  isLoading: boolean;
}

const MasterDataContext = createContext<MasterDataContextType | undefined>(undefined);

interface MasterDataProviderProps {
  children: ReactNode;
  apcCd: string;
  itemCd?: string;
}

export const MasterDataProvider: React.FC<MasterDataProviderProps> = ({
  children,
  apcCd,
  itemCd = '0901',
}) => {
  const [grades, setGrades] = useState<Grade[]>([]);
  const [producers, setProducers] = useState<string[]>([]);
  const [clients, setClients] = useState<Client[]>([]);
  const [warehouses, setWarehouses] = useState<Warehouse[]>([]);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const loadMasterData = async () => {
      setIsLoading(true);

      try {
        // 병렬로 모든 마스터 데이터 로드
        const [gradesRes, producersRes, clientsRes, warehousesRes] = await Promise.all([
          // 등급
          postJSON('/am/cmns/selectStdGrdDtlList.do', {
            apcCd,
            itemCd,
            grdSeCd: '02',
            grdKnd: '01',
          }),
          // 생산자
          gfn_getPrdcrs(apcCd),
          // 거래처
          gfn_getCnpts(apcCd),
          // 창고
          gfn_getComCds('WAREHOUSE_SE_CD', apcCd),
        ]);

        // 등급
        if (gradesRes?.resultList) {
          setGrades([...gradesRes.resultList, { grdCd: 'sum', grdNm: '총계' }]);
        }

        // 생산자
        if (producersRes) {
          setProducers(producersRes.map((r: any) => `${r.prdcrIdentno}-${r.prdcrNm}`));
        }

        // 거래처
        if (clientsRes?.resultList) {
          setClients(clientsRes.resultList);
        } else if (Array.isArray(clientsRes)) {
          setClients(clientsRes);
        }

        // 창고
        if (warehousesRes) {
          setWarehouses(warehousesRes);
        }
      } catch (error) {
        console.error('마스터 데이터 로드 실패:', error);
      } finally {
        setIsLoading(false);
      }
    };

    loadMasterData();
  }, [apcCd, itemCd]);

  return (
    <MasterDataContext.Provider
      value={{
        apcCd,
        itemCd,
        grades,
        producers,
        clients,
        warehouses,
        isLoading,
      }}
    >
      {children}
    </MasterDataContext.Provider>
  );
};

export const useMasterData = () => {
  const context = useContext(MasterDataContext);
  if (!context) {
    throw new Error('useMasterData must be used within MasterDataProvider');
  }
  return context;
};
