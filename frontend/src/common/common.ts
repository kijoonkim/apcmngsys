/**
 * React Hook 기반 API 함수들
 * common.js의 gfn_getApcVrty 등을 React Hook으로 변환
 */

import { API_URLS, ApiResponse } from '@shared/utils/utils';
import { post, postSilent } from '@shared/utils/http-enhanced';

// ============================================
// Types
// ============================================

export interface ItemVrty {
  vrtyCd: string;
  itemCd: string;
  itemNm: string;
  vrtyNm: string;
}

export interface ApcItem {
  itemCd: string;
  itemNm: string;
  apcCd: string;
}

export interface ApcGrade {
  grdCd: string;
  grdNm: string;
  apcCd: string;
}

export interface Producer {
  prdcrCd: string;
  prdcrNm: string;
  apcCd: string;
}

export interface Client {
  cnptCd: string;
  cnptNm: string;
  apcCd: string;
}

export interface ComCode {
  cd: string;
  cdNm: string;
  grpCd: string;
}

// ============================================
// APC 관련 API
// ============================================

/**
 * APC 품목/품종 조회
 * @param apcCd APC 코드
 */
export const getApcVrty = async (apcCd: string): Promise<ItemVrty[]> => {
  try {
    const response = await post<ItemVrty[]>(API_URLS.APC_VRTYS, { apcCd });

    if (response.resultStatus === 'S' && response.data) {
      return response.data;
    }

    console.error('APC 품종 조회 실패:', response.resultMessage);
    return [];
  } catch (error) {
    console.error('APC 품종 조회 에러:', error);
    return [];
  }
};

/**
 * APC 품목 조회
 * @param apcCd APC 코드
 */
export const getApcItems = async (apcCd: string): Promise<ApcItem[]> => {
  try {
    const response = await post<ApcItem[]>(API_URLS.APC_ITEMS, { apcCd });

    if (response.resultStatus === 'S' && response.data) {
      return response.data;
    }

    return [];
  } catch (error) {
    console.error('APC 품목 조회 에러:', error);
    return [];
  }
};

/**
 * APC 등급 조회
 * @param apcCd APC 코드
 * @param itemCd 품목 코드 (선택)
 */
export const getApcGrades = async (apcCd: string, itemCd?: string): Promise<ApcGrade[]> => {
  try {
    const param: any = { apcCd };
    if (itemCd) param.itemCd = itemCd;

    const response = await post<ApcGrade[]>(API_URLS.APC_GRDS, param);

    if (response.resultStatus === 'S' && response.data) {
      return response.data;
    }

    return [];
  } catch (error) {
    console.error('APC 등급 조회 에러:', error);
    return [];
  }
};

/**
 * APC 생산자 조회
 * @param apcCd APC 코드
 */
export const getProducers = async (apcCd: string): Promise<Producer[]> => {
  try {
    const response = await post<Producer[]>(API_URLS.PRDCR_INFO, { apcCd });

    if (response.resultStatus === 'S' && response.resultList) {
      return response.resultList;
    }

    return [];
  } catch (error) {
    console.error('생산자 조회 에러:', error);
    return [];
  }
};

/**
 * 거래처 조회
 * @param apcCd APC 코드
 */
export const getClients = async (apcCd: string): Promise<Client[]> => {
  try {
    const response = await post<Client[]>(API_URLS.CNPT_INFO, { apcCd });

    if (response.resultStatus === 'S' && response.resultList) {
      return response.resultList;
    }

    return [];
  } catch (error) {
    console.error('거래처 조회 에러:', error);
    return [];
  }
};

// ============================================
// 공통코드 API
// ============================================

/**
 * 공통코드 조회
 * @param grpCd 그룹 코드
 */
export const getCommonCodes = async (cdId: string, apcCd: string = '0000'): Promise<ComCode[]> => {
  try {
    const payload = {
      cdId: cdId,
      apcCd: apcCd,
      delYn: 'N', // delYn: "N" 하드코딩
    };

    const response = await post<ComCode[]>(API_URLS.COM_CDS, payload);

    if (response.resultStatus === 'S' && response.resultList) {
      return response.resultList;
    }

    return [];
  } catch (error) {
    console.error('공통코드 조회 에러:', error);
    return [];
  }
};

// ============================================
// React Hook Wrappers
// ============================================

import { useState, useEffect } from 'react';

/**
 * APC 품종 조회 Hook
 */
export const useApcVrty = (apcCd: string) => {
  const [data, setData] = useState<ItemVrty[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    if (!apcCd) return;

    const fetchData = async () => {
      setLoading(true);
      setError(null);
      try {
        const result = await getApcVrty(apcCd);
        setData(result);
      } catch (err) {
        setError(err as Error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [apcCd]);

  return { data, loading, error };
};

/**
 * APC 품목 조회 Hook
 */
export const useApcItems = (apcCd: string) => {
  const [data, setData] = useState<ApcItem[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    if (!apcCd) return;

    const fetchData = async () => {
      setLoading(true);
      setError(null);
      try {
        const result = await getApcItems(apcCd);
        setData(result);
      } catch (err) {
        setError(err as Error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [apcCd]);

  return { data, loading, error };
};

/**
 * APC 등급 조회 Hook
 */
export const useApcGrades = (apcCd: string, itemCd?: string) => {
  const [data, setData] = useState<ApcGrade[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    if (!apcCd) return;

    const fetchData = async () => {
      setLoading(true);
      setError(null);
      try {
        const result = await getApcGrades(apcCd, itemCd);
        setData(result);
      } catch (err) {
        setError(err as Error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [apcCd, itemCd]);

  return { data, loading, error };
};

/**
 * 생산자 조회 Hook
 */
export const useProducers = (apcCd: string) => {
  const [data, setData] = useState<Producer[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    if (!apcCd) return;

    const fetchData = async () => {
      setLoading(true);
      setError(null);
      try {
        const result = await getProducers(apcCd);
        setData(result);
      } catch (err) {
        setError(err as Error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [apcCd]);

  return { data, loading, error };
};

/**
 * 거래처 조회 Hook
 */
export const useClients = (apcCd: string) => {
  const [data, setData] = useState<Client[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    if (!apcCd) return;

    const fetchData = async () => {
      setLoading(true);
      setError(null);
      try {
        const result = await getClients(apcCd);
        setData(result);
      } catch (err) {
        setError(err as Error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [apcCd]);

  return { data, loading, error };
};

/**
 * 공통코드 조회 Hook
 */
export const useCommonCodes = (grpCd: string) => {
  const [data, setData] = useState<ComCode[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    if (!grpCd) return;

    const fetchData = async () => {
      setLoading(true);
      setError(null);
      try {
        const result = await getCommonCodes(grpCd);
        setData(result);
      } catch (err) {
        setError(err as Error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [grpCd]);

  return { data, loading, error };
};

// ============================================
// Backward Compatibility (기존 함수명)
// ============================================

export const gfn_getApcVrty = getApcVrty;

export const gfn_getApcItems = getApcItems;

export const gfn_getApcGrades = getApcGrades;

export const gfn_getPrdcrs = getProducers;

export const gfn_getCnpts = getClients;

export const gfn_getComCds = getCommonCodes;
