const BASE = import.meta.env.VITE_OPENAPI_BASE;
const KEY = import.meta.env.VITE_OPENAPI_KEY;

/** 공공API 호출 유틸: ?serviceKey=... & resultType=json & 기타 params */
export async function fetchOpenAPI<T>(path: string, params: Record<string, any> = {}): Promise<T> {
  if (!BASE || !KEY) throw new Error('OPEN API env가 비어있습니다');

  const u = new URL(path, BASE);
  // 공공API 표준 파라미터들 + 사용자 파라미터
  const merged = { serviceKey: KEY, resultType: 'json', ...params };
  Object.entries(merged).forEach(([k, v]) => {
    if (v != null && v !== '') u.searchParams.set(k, String(v));
  });

  const res = await fetch(u.toString()); // 프론트에서 직접 호출
  if (!res.ok) throw new Error(`${res.status} ${res.statusText}`);

  const ct = res.headers.get('content-type') || '';
  if (ct.includes('json')) return (await res.json()) as T;

  // 일부 API는 XML만 주기도 함 → 최소 파싱
  const text = await res.text();
  const doc = new DOMParser().parseFromString(text, 'application/xml');
  // 호출측에서 원하는 형태로 변환해야 하므로 그대로 any 반환
  // (도메인 레이어에서 안전하게 매핑)
  // @ts-expect-error – XML일 때는 호출부에서 매핑
  return text as T;
}
