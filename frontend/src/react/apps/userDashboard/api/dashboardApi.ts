// src/pages/userDashboard/api/dashboardApi.ts
import { postJSON } from '@shared/lib/http';
import { gfn_getPrdcrs, gfn_getApcItems, getClients } from '@/common/common';
import type { DashboardDataResponse, APCInfo } from '../types/dashboard';

export const dashboardApi = {
  // 대시보드 데이터 조회
  selectData: async (apcCd: string, ymd: string): Promise<DashboardDataResponse> => {
    const params = {
      V_APC_CD: apcCd,
      V_YMD: ymd,
      V_RSLT_TYPE: 'ABC',
      R_CUR_SMRY_APC: '',
      R_CUR_SMRY_YY: '',
      R_CUR_SMRY_MM: '',
      R_CUR_ITEM_YY: '',
      R_CUR_ITEM_MM: '',
      R_CUR_ITEM_TRC: '',
      R_ERR_CD: '',
      R_ERR_MSG: '',
    };

    const response = await postJSON('/co/dashboard/selectData.do', params);
    return response;
  },

  // APC 환경설정 조회
  selectApcInfo: async (apcCd: string) => {
    const response = await postJSON('/am/apc/selectApcEvrmntStng.do', { apcCd });
    return response.resultVO as APCInfo;
  },

  // 품목 리스트
  getItems: async (apcCd: string) => {
    // 기존 gfn_getApcItem 함수 사용
    return await gfn_getApcItems(apcCd);
  },

  // 생산자 리스트
  getPrdcrs: async (apcCd: string) => {
    return await gfn_getPrdcrs(apcCd);
  },

  // 작업자 리스트
  getOprtrList: async (apcCd: string) => {
    const response = await postJSON('/am/oprtr/selectOprtrList.do', { apcCd });
    return response.resultList;
  },

  // 사용자 리스트
  getUserList: async (apcCd: string) => {
    const response = await postJSON('/co/authrt/selectComUserList.do', { apcCd });
    return response.resultList;
  },

  // 거래처 리스트
  getCnptList: async (apcCd: string) => {
    return await getClients(apcCd);
  },

  // 메뉴이력 리스트
  selectMenuHistroyData: async (userId: string) => {
    const response = await postJSON('/co/log/selectMenuHstryLimitList.do', { userId });
    return response;
  },
};
