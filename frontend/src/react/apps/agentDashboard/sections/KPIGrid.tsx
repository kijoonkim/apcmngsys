import React from 'react';
type KPI = { label: string; value: string; delta?: string; tone?: 'ok' | 'warn' | 'bad' | 'info' };
const sample: KPI[] = [
  { label: '평균기온(℃)', value: '26.1', delta: '+0.4', tone: 'ok' },
  { label: '강수량(mm)', value: '5.2', delta: '-1.1', tone: 'info' },
  { label: '일사량', value: '18.4', delta: '+0.6', tone: 'ok' },
  { label: '병해충 리포트', value: '7건', delta: '+2', tone: 'warn' },
  { label: '관측지점', value: '124', tone: 'info' },
  { label: '알림 처리', value: '92%', delta: '+3%', tone: 'ok' },
];
export function KPIGrid() {
  return (
    <div className="kpi-grid">
      {sample.map((k, i) => (
        <div key={i} className={`kpi ${k.tone ?? ''}`}>
          <div className="kpi-label">{k.label}</div>
          <div className="kpi-value">{k.value}</div>
          {k.delta && <div className="kpi-delta">{k.delta}</div>}
        </div>
      ))}
    </div>
  );
}
