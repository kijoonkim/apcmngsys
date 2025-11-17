// src/react/shared/services/mapAdapter.ts
export type MarkerInfo = { lat: number; lng: number; label?: string; highlight?: boolean };

export function buildMarkersFromApc(apcLists: any[]): MarkerInfo[] {
  return apcLists.map((i: any) => ({
    lat: parseFloat(i.cy),
    lng: parseFloat(i.cx),
    label: i.name,
    highlight: i.kinds.some((k: any) => k.value === 'active'),
  }));
}
