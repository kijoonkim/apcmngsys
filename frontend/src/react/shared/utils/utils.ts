/**
 * React/TypeScript 공통 유틸리티 함수
 * 기존 common.js를 마이그레이션한 버전
 */

// ============================================
// Constants - API URLs
// ============================================

export const API_URLS = {
  // 공통코드
  COM_CDS: '/co/cd/comCdDtls',
  
  // 마스터
  MST_ITEMS: '/am/cmns/cmnsItems',
  MST_VRTYS: '/am/cmns/cmnsVrtys',
  MST_SPCFCTS: '/am/cmns/cmnsSpcfcts',
  MST_GRDS: '/am/cmns/stdGrds',
  
  // APC
  APC_ITEMS: '/am/cmns/apcItems',
  APC_VRTYS: '/am/cmns/apcVrtys',
  APC_SPCFCTS: '/am/cmns/apcSpcfcts',
  APC_GRDS: '/am/cmns/apcGrds',
  APC_GDS_GRDS: '/am/cmns/apcStdGrdDtls',
  APC_SEEDS: '/am/cmns/apcSeeds',
  
  // 기타
  CNPT_INFO: '/am/cmns/cnptInfos',
  GDS_INFO: '/am/cmns/gdsInfos',
  PLT_BX_INFO: '/am/cmns/pltBxInfos',
  PRDCR_INFO: '/am/cmns/prdcrInfos',
  WRHS_VHCL: '/am/cmns/wrhsVhcls',
  TRSPRT_CO_INFO: '/am/spmt/spmtTrsprts',
  TRSPRT_CST_INFO: '/am/cmns/trsprtCsts',
  SPMT_PCKG_UINT: '/am/cmns/spmtPckgUnits',
  APC_INFO: '/am/apc/apcInfos',
  CRTR_YR: '/am/fclt/crtrYr',
  APC_RPT_KNDS: '/co/cd/apcRptKnds',
} as const;

// ============================================
// Types
// ============================================

export interface ApiResponse<T = any> {
  resultStatus: 'S' | 'E' | 'F';
  resultCode: string;
  resultMessage: string;
  data?: T;
}

export interface ComMsg {
  msgKey: string;
  msgCn: string;
}

// ============================================
// Validation Utilities
// ============================================

/**
 * 빈 값 체크 (null, undefined, '', [], {})
 */
export const isEmpty = (value: any): boolean => {
  if (value === null || value === undefined) return true;
  if (typeof value === 'string') return value.trim() === '';
  if (Array.isArray(value)) return value.length === 0;
  if (typeof value === 'object') return Object.keys(value).length === 0;
  return false;
};

/**
 * 숫자 체크
 */
export const isNumber = (value: any): boolean => {
  return !isNaN(Number(value));
};

/**
 * 날짜 형식 체크 (YYYY-MM-DD)
 */
export const isDate = (dateStr: string): boolean => {
  const regex = /^\d{4}-\d{2}-\d{2}$/;
  if (!regex.test(dateStr)) return false;
  
  const date = new Date(dateStr);
  return date instanceof Date && !isNaN(date.getTime());
};

/**
 * 이메일 형식 체크
 */
export const isEmail = (email: string): boolean => {
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return regex.test(email);
};

// ============================================
// String Utilities
// ============================================

/**
 * 문자열 바이트 길이 계산 (한글 3byte)
 */
export const getByteLength = (str: string): number => {
  let b = 0;
  for (let i = 0; i < str.length; i++) {
    const c = str.charCodeAt(i);
    b += c >> 11 ? 3 : c >> 7 ? 2 : 1;
  }
  return b;
};

/**
 * camelCase -> SNAKE_CASE
 */
export const camelToSnakeUpper = (str: string): string => {
  return str.replace(/([a-z])([A-Z])/g, '$1_$2').toUpperCase();
};

/**
 * snake_case -> camelCase
 */
export const snakeToCamel = (str: string): string => {
  return str.toLowerCase().replace(/(_\w)/g, (match) => match[1].toUpperCase());
};

/**
 * 휴대폰 번호 포맷팅 (010-1234-5678)
 */
export const formatPhone = (phone: string): string => {
  const cleaned = phone.replace(/\D/g, '');
  const match = cleaned.match(/^(\d{3})(\d{4})(\d{4})$/);
  return match ? `${match[1]}-${match[2]}-${match[3]}` : phone;
};

/**
 * 사업자번호 포맷팅 (123-45-67890)
 */
export const formatBusinessNo = (no: string): string => {
  const cleaned = no.replace(/\D/g, '');
  const match = cleaned.match(/^(\d{3})(\d{2})(\d{5})$/);
  return match ? `${match[1]}-${match[2]}-${match[3]}` : no;
};

// ============================================
// Date Utilities
// ============================================

/**
 * 날짜를 YYYY-MM-DD 형식으로 포맷
 */
export const formatDate = (date: Date | string): string => {
  const d = typeof date === 'string' ? new Date(date) : date;
  const year = d.getFullYear();
  const month = String(d.getMonth() + 1).padStart(2, '0');
  const day = String(d.getDate()).padStart(2, '0');
  return `${year}-${month}-${day}`;
};

/**
 * 날짜를 YYYY-MM-DD HH:mm:ss 형식으로 포맷
 */
export const formatDateTime = (date: Date | string): string => {
  const d = typeof date === 'string' ? new Date(date) : date;
  const datePart = formatDate(d);
  const hours = String(d.getHours()).padStart(2, '0');
  const minutes = String(d.getMinutes()).padStart(2, '0');
  const seconds = String(d.getSeconds()).padStart(2, '0');
  return `${datePart} ${hours}:${minutes}:${seconds}`;
};

/**
 * 오늘 날짜 가져오기 (YYYY-MM-DD)
 */
export const getToday = (): string => {
  return formatDate(new Date());
};

/**
 * 날짜 차이 계산 (일 단위)
 */
export const getDateDiff = (date1: Date | string, date2: Date | string): number => {
  const d1 = typeof date1 === 'string' ? new Date(date1) : date1;
  const d2 = typeof date2 === 'string' ? new Date(date2) : date2;
  const diffTime = Math.abs(d2.getTime() - d1.getTime());
  return Math.ceil(diffTime / (1000 * 60 * 60 * 24));
};

// ============================================
// Number Utilities
// ============================================

/**
 * 숫자를 천단위 콤마 포맷
 */
export const formatNumber = (num: number | string): string => {
  const n = typeof num === 'string' ? parseFloat(num) : num;
  return n.toLocaleString('ko-KR');
};

/**
 * 숫자를 통화 형식으로 포맷 (원)
 */
export const formatCurrency = (num: number | string): string => {
  return `${formatNumber(num)}원`;
};

/**
 * 백분율 계산
 */
export const calcPercentage = (value: number, total: number, decimals = 2): number => {
  if (total === 0) return 0;
  return parseFloat(((value / total) * 100).toFixed(decimals));
};

// ============================================
// Array Utilities
// ============================================

/**
 * 배열 내 중복 제거
 */
export const unique = <T>(arr: T[]): T[] => {
  return Array.from(new Set(arr));
};

/**
 * 배열을 특정 크기로 청크 분할
 */
export const chunk = <T>(arr: T[], size: number): T[][] => {
  const result: T[][] = [];
  for (let i = 0; i < arr.length; i += size) {
    result.push(arr.slice(i, i + size));
  }
  return result;
};

/**
 * 배열 합계
 */
export const sum = (arr: number[]): number => {
  return arr.reduce((acc, val) => acc + val, 0);
};

/**
 * 배열 평균
 */
export const average = (arr: number[]): number => {
  if (arr.length === 0) return 0;
  return sum(arr) / arr.length;
};

// ============================================
// Object Utilities
// ============================================

/**
 * 깊은 복사
 */
export const deepClone = <T>(obj: T): T => {
  return JSON.parse(JSON.stringify(obj));
};

/**
 * Object를 Array로 변환
 */
export const objectToArray = <T>(obj: Record<string, T>): Array<Record<string, T>> => {
  return Object.entries(obj).map(([key, value]) => ({ [key]: value }));
};

/**
 * JSON 필터링
 */
export const filterJson = <T extends Record<string, any>>(
  data: T[],
  key: keyof T,
  values: T[keyof T] | T[keyof T][]
): T[] => {
  if (isEmpty(data)) return data;

  return data.filter((obj) => {
    if (Array.isArray(values)) {
      return values.some((val) => obj[key] === val);
    }
    return obj[key] === values;
  });
};

/**
 * 두 객체가 같은지 비교 (깊은 비교)
 */
export const isEqual = (obj1: any, obj2: any): boolean => {
  return JSON.stringify(obj1) === JSON.stringify(obj2);
};

// ============================================
// File Utilities
// ============================================

/**
 * 파일 확장자 추출
 */
export const getFileExtension = (filename: string): string => {
  return filename.slice(((filename.lastIndexOf('.') - 1) >>> 0) + 2);
};

/**
 * 파일 크기 포맷 (KB, MB, GB)
 */
export const formatFileSize = (bytes: number): string => {
  if (bytes === 0) return '0 Bytes';
  const k = 1024;
  const sizes = ['Bytes', 'KB', 'MB', 'GB'];
  const i = Math.floor(Math.log(bytes) / Math.log(k));
  return `${parseFloat((bytes / Math.pow(k, i)).toFixed(2))} ${sizes[i]}`;
};

/**
 * Base64를 Blob으로 변환
 */
export const base64ToBlob = (base64: string, contentType = ''): Blob => {
  const byteCharacters = atob(base64);
  const byteNumbers = new Array(byteCharacters.length);
  
  for (let i = 0; i < byteCharacters.length; i++) {
    byteNumbers[i] = byteCharacters.charCodeAt(i);
  }
  
  const byteArray = new Uint8Array(byteNumbers);
  return new Blob([byteArray], { type: contentType });
};

/**
 * 파일 다운로드
 */
export const downloadFile = (blob: Blob, filename: string): void => {
  const url = window.URL.createObjectURL(blob);
  const link = document.createElement('a');
  link.href = url;
  link.download = filename;
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
  window.URL.revokeObjectURL(url);
};

// ============================================
// Storage Utilities
// ============================================

/**
 * localStorage에 JSON 저장
 */
export const setLocalStorage = (key: string, value: any): void => {
  try {
    localStorage.setItem(key, JSON.stringify(value));
  } catch (error) {
    console.error('localStorage 저장 실패:', error);
  }
};

/**
 * localStorage에서 JSON 읽기
 */
export const getLocalStorage = <T>(key: string): T | null => {
  try {
    const item = localStorage.getItem(key);
    return item ? JSON.parse(item) : null;
  } catch (error) {
    console.error('localStorage 읽기 실패:', error);
    return null;
  }
};

/**
 * localStorage에서 삭제
 */
export const removeLocalStorage = (key: string): void => {
  try {
    localStorage.removeItem(key);
  } catch (error) {
    console.error('localStorage 삭제 실패:', error);
  }
};

// ============================================
// Debounce & Throttle
// ============================================

/**
 * 디바운스 (연속 호출 방지)
 */
export const debounce = <T extends (...args: any[]) => any>(
  func: T,
  wait: number
): ((...args: Parameters<T>) => void) => {
  let timeout: NodeJS.Timeout | null = null;
  
  return function executedFunction(...args: Parameters<T>) {
    const later = () => {
      timeout = null;
      func(...args);
    };
    
    if (timeout) clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
};

/**
 * 쓰로틀 (일정 시간마다 한 번만 실행)
 */
export const throttle = <T extends (...args: any[]) => any>(
  func: T,
  limit: number
): ((...args: Parameters<T>) => void) => {
  let inThrottle: boolean;
  
  return function executedFunction(...args: Parameters<T>) {
    if (!inThrottle) {
      func(...args);
      inThrottle = true;
      setTimeout(() => (inThrottle = false), limit);
    }
  };
};

// ============================================
// Random Utilities
// ============================================

/**
 * 랜덤 문자열 생성
 */
export const randomString = (length = 8): string => {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let result = '';
  for (let i = 0; i < length; i++) {
    result += chars.charAt(Math.floor(Math.random() * chars.length));
  }
  return result;
};

/**
 * UUID v4 생성
 */
export const generateUUID = (): string => {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) => {
    const r = (Math.random() * 16) | 0;
    const v = c === 'x' ? r : (r & 0x3) | 0x8;
    return v.toString(16);
  });
};

/**
 * 랜덤 숫자 생성 (min ~ max)
 */
export const randomNumber = (min: number, max: number): number => {
  return Math.floor(Math.random() * (max - min + 1)) + min;
};

// ============================================
// Browser Utilities
// ============================================

/**
 * 클립보드에 복사
 */
export const copyToClipboard = async (text: string): Promise<boolean> => {
  try {
    await navigator.clipboard.writeText(text);
    return true;
  } catch (error) {
    console.error('클립보드 복사 실패:', error);
    return false;
  }
};

/**
 * 페이지 스크롤을 최상단으로
 */
export const scrollToTop = (smooth = true): void => {
  window.scrollTo({
    top: 0,
    behavior: smooth ? 'smooth' : 'auto',
  });
};

/**
 * 특정 요소로 스크롤
 */
export const scrollToElement = (elementId: string, smooth = true): void => {
  const element = document.getElementById(elementId);
  if (element) {
    element.scrollIntoView({
      behavior: smooth ? 'smooth' : 'auto',
      block: 'start',
    });
  }
};

// ============================================
// Combo Validation (기존 함수 유지)
// ============================================

/**
 * 콤보박스 데이터에서 코드 존재 여부 확인
 */
export const comboValidation = (
  jsonData: Array<{ value: string; [key: string]: any }>,
  code: string
): boolean => {
  return jsonData.some((item) => item.value === code);
};
