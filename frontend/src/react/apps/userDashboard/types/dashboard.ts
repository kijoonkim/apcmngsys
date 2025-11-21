// src/pages/userDashboard/types/dashboard.ts
export interface DashboardState {
  selectedApc: string;
  baseDate: Date;
  viewMode: 'mm' | 'yy';
  trendType: '01' | '02' | '03';
}

export interface ItemData {
  RSLT_TYPE: '01' | '02' | '03';
  ITEM_NM: string;
  WGHT: number;
}

export interface SummaryData {
  RSLT_TYPE: '01' | '02' | '03';
  WGHT: number;
}

export interface TrendData {
  ITEM_NM: string;
  RSLT_TYPE: '01' | '02' | '03';
  W_0: number;
  W_1: number;
  W_2: number;
  W_3: number;
  W_4: number;
  W_5: number;
  W_6: number;
  W_7: number;
  W_8: number;
  W_9: number;
  W_10: number;
  W_11: number;
}

export interface APCInfo {
  corpNm: string;
  apcNm: string;
  bzstat: string;
  cls: string;
  apcRprsvNm: string;
  telno: string;
  fxno: string;
  addr: string;
  brno: string;
}

export interface DashboardDataResponse {
  resultStatus: string;
  resultCode: string;
  resultMessage: string;
  R_CUR_ITEM_MM: ItemData[];
  R_CUR_ITEM_YY: ItemData[];
  R_CUR_SMRY_MM: SummaryData[];
  R_CUR_SMRY_YY: SummaryData[];
  R_CUR_ITEM_TRC: TrendData[];
}

export interface APCCounts {
  prdcr: number;
  oprtr: number;
  user: number;
  cnpt: number;
}
