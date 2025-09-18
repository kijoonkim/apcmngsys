import React, { useState } from 'react';
export function Sidebar() {
    const [collapsed, setCollapsed] = useState(false);
    return (
        <aside className={`dash-sidebar ${collapsed ? 'collapsed' : ''}`}>
            <div className="side-top">
                <button className="btn sm" onClick={()=>setCollapsed(v=>!v)}>{collapsed ? '▶' : '◀'}</button>
            </div>
            <nav>
                <ul>
                    <li className="active"><a href="#">대시보드</a></li>
                    <li><a href="#">기후</a></li>
                    <li><a href="#">병해충</a></li>
                    <li><a href="#">통계</a></li>
                    <li><a href="#">설정</a></li>
                </ul>
            </nav>
        </aside>
    );
}