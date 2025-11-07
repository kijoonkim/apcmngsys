import React from 'react';
export function Footer() {
  return (
    <footer className="dash-footer">
      <span>© {new Date().getFullYear()} APCSS</span>
      <span className="muted">샘플 레이아웃 · 데이터 연동 예정</span>
    </footer>
  );
}
