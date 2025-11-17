export class HttpError extends Error {
  constructor(
    public status: number,
    public body?: any,
  ) {
    super(`HTTP ${status}`);
  }
}

const defaultHeaders = () => {
  const h: Record<string, string> = { 'Content-Type': 'application/json' };
  const csrf = (document.querySelector('meta[name="csrf-token"]') as HTMLMetaElement)?.content;
  if (csrf) h['X-CSRF-TOKEN'] = csrf;
  return h;
};

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
