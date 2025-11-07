import React from 'react';
export function PanelsRow() {
  return (
    <div className="panels-row">
      <div className="panel">
        <div className="panel-title">기후 정보</div>
        <div className="panel-body placeholder">지도/레이어</div>
      </div>
      <div className="panel">
        <div className="panel-title">병해충 경보</div>
        <div className="panel-body placeholder">경보 목록</div>
      </div>
      <div className="panel">
        <div className="panel-title">통계/추세</div>
        <div className="panel-body placeholder">라인/도넛</div>
      </div>
    </div>
  );
}
