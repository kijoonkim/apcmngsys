/**
 * HTTP 통신 유틸리티 (기존 http.ts 확장 버전)
 * common.js의 gfn_postJSON, gfn_postFormData 등을 포함
 */

import { ApiResponse } from './utils';

// ============================================
// Error Class
// ============================================

export class HttpError extends Error {
  constructor(
    public status: number,
    public body?: any,
  ) {
    super(`HTTP ${status}`);
  }
}

// ============================================
// Header Utilities
// ============================================

const defaultHeaders = () => {
  const h: Record<string, string> = { 'Content-Type': 'application/json' };
  const csrf = (document.querySelector('meta[name="csrf-token"]') as HTMLMetaElement)?.content;
  if (csrf) h['X-CSRF-TOKEN'] = csrf;
  return h;
};

// sysPrgrmId를 관리하는 전역 변수
let globalSysPrgrmId: string | null = null;

/**
 * 시스템 프로그램 ID 설정
 */
export const setSysPrgrmId = (sysPrgrmId: string): void => {
  globalSysPrgrmId = sysPrgrmId;
};

/**
 * 현재 설정된 시스템 프로그램 ID 가져오기
 */
export const getSysPrgrmId = (): string | null => {
  return globalSysPrgrmId;
};

// ============================================
// Loading Progress (기존 SBUxMethod 대체)
// ============================================

let loadingCount = 0;

/**
 * 로딩 표시
 */
const showLoading = (): void => {
  loadingCount++;
  // 여기에 실제 로딩 UI 로직 추가
  // 예: document.getElementById('loading')?.classList.add('active')
};

/**
 * 로딩 숨김
 */
const hideLoading = (): void => {
  loadingCount = Math.max(0, loadingCount - 1);
  if (loadingCount === 0) {
    // 여기에 실제 로딩 UI 숨김 로직 추가
    // 예: document.getElementById('loading')?.classList.remove('active')
  }
};

/**
 * 로딩 표시 with 최소 시간 보장
 */
const manageLoading = async (showProgress: boolean, operation: () => Promise<any>) => {
  if (!showProgress) {
    return await operation();
  }

  const startTime = Date.now();
  showLoading();

  try {
    const result = await operation();
    const endTime = Date.now();
    const duration = endTime - startTime;

    // 최소 500ms 로딩 표시
    if (duration < 500) {
      await new Promise((resolve) => setTimeout(resolve, 500 - duration));
    }

    return result;
  } finally {
    hideLoading();
  }
};

// ============================================
// Session Error Handling
// ============================================

/**
 * 세션 만료 처리 (E0010 에러 코드)
 */
const handleSessionError = (result: ApiResponse): void => {
  if (result.resultStatus !== 'S' && result.resultCode === 'E0010') {
    // 세션 만료 시 메인 페이지로 리다이렉트
    if (typeof window !== 'undefined' && window.parent) {
      const redirect = (window.parent as any).lfn_redirect;
      if (typeof redirect === 'function') {
        redirect('/main.do');
      } else {
        window.location.href = '/main.do';
      }
    }
  }
};

// ============================================
// Basic HTTP Methods
// ============================================

/**
 * GET 요청 (JSON 응답)
 */
export async function getJSON<T>(url: string, init: RequestInit = {}): Promise<T> {
  const res = await fetch(url, {
    method: 'GET',
    headers: { ...defaultHeaders(), ...(init.headers || {}) },
    ...init,
    credentials: 'same-origin',
  });
  const body = await res.json().catch(() => undefined);
  if (!res.ok) throw new HttpError(res.status, body);
  return body as T;
}

/**
 * POST 요청 (JSON 응답)
 */
export async function postJSON<T>(url: string, data?: any, init: RequestInit = {}): Promise<T> {
  const res = await fetch(url, {
    method: 'POST',
    body: data ? JSON.stringify(data) : undefined,
    headers: { ...defaultHeaders(), ...(init.headers || {}) },
    ...init,
    credentials: 'same-origin',
  });
  const body = await res.json().catch(() => undefined);
  if (!res.ok) throw new HttpError(res.status, body);
  return body as T;
}

// ============================================
// Enhanced API Methods (common.js 호환)
// ============================================

interface PostOptions {
  sysPrgrmId?: string;
  hideProgress?: boolean;
}

/**
 * POST JSON 요청 (common.js gfn_postJSON 호환)
 * - 로딩 표시 지원
 * - 세션 만료 처리
 * - sysPrgrmId 헤더 자동 추가
 */
export async function postJSONWithLoading<T = any>(
  url: string,
  param?: any,
  options: PostOptions = {}
): Promise<ApiResponse<T>> {
  const { sysPrgrmId, hideProgress = false } = options;
  const showProgress = !hideProgress;

  const header: Record<string, string> = {
    'Content-Type': 'application/json',
  };

  // CSRF 토큰 추가
  const csrf = (document.querySelector('meta[name="csrf-token"]') as HTMLMetaElement)?.content;
  if (csrf) header['X-CSRF-TOKEN'] = csrf;

  // sysPrgrmId 추가 (파라미터 우선, 없으면 전역 값 사용)
  const finalSysPrgrmId = sysPrgrmId || globalSysPrgrmId;
  if (finalSysPrgrmId) {
    header.sysPrgrmId = finalSysPrgrmId;
  }

  const operation = async () => {
    try {
      const response = await fetch(url, {
        method: 'POST',
        headers: header,
        body: param ? JSON.stringify(param) : undefined,
        credentials: 'same-origin',
      });

      const result: ApiResponse<T> = await response.json();

      // 세션 만료 체크
      handleSessionError(result);

      return result;
    } catch (error) {
      console.error('API 요청 실패:', error);
      throw error;
    }
  };

  return manageLoading(showProgress, operation);
}

/**
 * POST FormData 요청 (common.js gfn_postFormData 호환)
 * - 파일 업로드용
 * - 로딩 표시 지원
 */
export async function postFormDataWithLoading<T = any>(
  url: string,
  formData: FormData,
  options: PostOptions = {}
): Promise<ApiResponse<T>> {
  const { sysPrgrmId, hideProgress = false } = options;
  const showProgress = !hideProgress;

  const header: Record<string, string> = {};

  // CSRF 토큰 추가
  const csrf = (document.querySelector('meta[name="csrf-token"]') as HTMLMetaElement)?.content;
  if (csrf) header['X-CSRF-TOKEN'] = csrf;

  // sysPrgrmId 추가
  const finalSysPrgrmId = sysPrgrmId || globalSysPrgrmId;
  if (finalSysPrgrmId) {
    header.sysPrgrmId = finalSysPrgrmId;
  }

  const operation = async () => {
    try {
      const response = await fetch(url, {
        method: 'POST',
        headers: header,
        body: formData,
        credentials: 'same-origin',
      });

      const result: ApiResponse<T> = await response.json();

      // 세션 만료 체크
      handleSessionError(result);

      return result;
    } catch (error) {
      console.error('FormData 요청 실패:', error);
      throw error;
    }
  };

  return manageLoading(showProgress, operation);
}

/**
 * POST 요청 (Blob 응답 - 파일 다운로드용)
 * common.js gfn_postJsonForDownload 호환
 */
export async function postJSONForDownload(
  url: string,
  param?: any,
  options: PostOptions = {}
): Promise<Blob> {
  const { sysPrgrmId, hideProgress = false } = options;
  const showProgress = !hideProgress;

  const header: Record<string, string> = {
    'Content-Type': 'application/json',
  };

  // CSRF 토큰 추가
  const csrf = (document.querySelector('meta[name="csrf-token"]') as HTMLMetaElement)?.content;
  if (csrf) header['X-CSRF-TOKEN'] = csrf;

  // sysPrgrmId 추가
  const finalSysPrgrmId = sysPrgrmId || globalSysPrgrmId;
  if (finalSysPrgrmId) {
    header.sysPrgrmId = finalSysPrgrmId;
  }

  const operation = async () => {
    try {
      const response = await fetch(url, {
        method: 'POST',
        headers: header,
        body: param ? JSON.stringify(param) : undefined,
        credentials: 'same-origin',
      });

      return await response.blob();
    } catch (error) {
      console.error('파일 다운로드 실패:', error);
      throw error;
    }
  };

  return manageLoading(showProgress, operation);
}

// ============================================
// Convenience Wrappers (간편 사용)
// ============================================

/**
 * 간편 POST (기본 로딩 표시)
 */
export const post = <T = any>(url: string, data?: any): Promise<ApiResponse<T>> => {
  return postJSONWithLoading<T>(url, data);
};

/**
 * 간편 POST (로딩 숨김)
 */
export const postSilent = <T = any>(url: string, data?: any): Promise<ApiResponse<T>> => {
  return postJSONWithLoading<T>(url, data, { hideProgress: true });
};

/**
 * FormData POST (기본 로딩 표시)
 */
export const postForm = <T = any>(url: string, formData: FormData): Promise<ApiResponse<T>> => {
  return postFormDataWithLoading<T>(url, formData);
};

/**
 * 파일 다운로드
 */
export const downloadFile = (url: string, data?: any): Promise<Blob> => {
  return postJSONForDownload(url, data);
};

// ============================================
// Export Aliases (기존 코드 호환성)
// ============================================

/**
 * @deprecated 대신 postJSONWithLoading 사용
 */
export const gfn_postJSON = postJSONWithLoading;

/**
 * @deprecated 대신 postFormDataWithLoading 사용
 */
export const gfn_postFormData = postFormDataWithLoading;

/**
 * @deprecated 대신 postJSONForDownload 사용
 */
export const gfn_postJsonForDownload = postJSONForDownload;

/**
 * @deprecated 대신 setSysPrgrmId 사용
 */
export const gfn_setSysPrgrmId = setSysPrgrmId;
