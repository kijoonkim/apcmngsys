import React from 'react';
export function Header() {
  return (
    <header className="dash-header">
      <div className="brand">Agent Dashboard</div>
      <div className="header-actions">
        <button className="btn" onClick={() => location.reload()}>
          새로고침
        </button>
      </div>
    </header>
  );
}
