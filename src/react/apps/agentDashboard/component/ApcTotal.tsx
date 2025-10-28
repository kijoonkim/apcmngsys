import React, { useState, useEffect, useMemo, useRef } from 'react'; // useRef 추가
import {
    LineChart, Line, BarChart, Bar, PieChart, Pie, Cell, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, Treemap
} from 'recharts';
// lucide-react 아이콘 import (npm install lucide-react 필요)
import { Box, Wrench, Truck, Building2, ChevronDown } from 'lucide-react'; // ChevronDown 추가

// --- 가상 데이터 로딩 및 처리 (실제 구현 시 API 호출 등으로 대체) ---
const dummyCsvData = `record_date,apc_name,item_name,receiving_kg,sorting_kg,shipping_kg
2025-10-01,신미네유통,고구마,3677,3387,3136
2025-10-01,해도지영농,브로콜리,2982,2692,2035
2025-09-15,신미네유통,상추,4100,3800,3500
2025-09-15,상주원예영농,딸기,1500,1350,1200
2025-08-20,거산 여주,고구마,2000,1800,1700
2025-08-20,영흥농산,배추,3500,3300,3000
2025-10-28,신미네유통,상추,3800,3500,3200
2025-10-28,해도지영농,브로콜리,3100,2800,2500
2025-10-28,상주원예영농,딸기,900,800,700
2025-10-28,영흥농산,배추,4500,4200,3800
2025-10-27,만인산농협,마늘,2500,2400,2200
2025-10-27,산남감귤영농,감귤,4800,4500,4000
`;

const parseCSV = (csvText) => {
    const lines = csvText.trim().split('\n');
    if (lines.length < 2) return [];
    const headers = lines[0].split(',');
    return lines.slice(1).map(line => {
        const values = line.split(',');
        const entry = {};
        headers.forEach((header, index) => {
            const value = values[index];
            if (['receiving_kg', 'sorting_kg', 'shipping_kg'].includes(header)) {
                entry[header] = parseInt(value, 10) || 0;
            } else {
                entry[header] = value;
            }
        });
        entry.dateObj = new Date(entry.record_date);
        return entry;
    });
};

// --- 유틸리티 함수 ---
const formatNumber = (num) => num ? num.toLocaleString('ko-KR') : '0'; // null/undefined 처리 추가

// --- 부드러운 파스텔톤 색상 팔레트 ---
const PASTEL_COLORS = ['#818cf8', '#60a5fa', '#34d399', '#a78bfa', '#f472b6', '#fbbf24'];

// Treemap 커스텀 콘텐츠 렌더러
const CustomizedContent = (props) => {
    const { depth, x, y, width, height, index, name, value } = props;
    const color = PASTEL_COLORS[index % PASTEL_COLORS.length];
    if (width < 50 || height < 20) return null;
    return (
        <g>
            <rect x={x} y={y} width={width} height={height} style={{ fill: color, stroke: '#fff', strokeWidth: 2 / (depth + 1e-10), strokeOpacity: 1 / (depth + 1e-10) }} />
            <text x={x + width / 2} y={y + height / 2 + 7} textAnchor="middle" fill="#fff" fontSize={14} fontWeight="bold">{name}</text>
            <text x={x + width / 2} y={y + height / 2 + 24} textAnchor="middle" fill="#fff" fillOpacity={0.7} fontSize={12}>{formatNumber(value)}kg</text>
        </g>
    );
};


// --- 메인 대시보드 컴포넌트 ---
const ApcTotal = () => {
    const [allData, setAllData] = useState([]);
    const [filteredData, setFilteredData] = useState([]);
    const [selectedPeriod, setSelectedPeriod] = useState('last30days');
    const [loading, setLoading] = useState(true);
    const [isDropdownOpen, setIsDropdownOpen] = useState(false); // 드롭다운 상태 추가
    const dropdownRef = useRef(null); // 드롭다운 외부 클릭 감지용 Ref

    // 기간 옵션 정의
    const periodOptions = {
        'last30days': '최근 30일',
        'thisYear': '올해 누적',
        'allTime': '전체 기간'
    };

    // 1. 데이터 로딩 (이전과 동일)
    useEffect(() => {
        setTimeout(() => {
            const parsed = parseCSV(dummyCsvData);
            setAllData(parsed);
            setLoading(false);
        }, 1000);
    }, []);

    // 2. 기간 필터링 (이전과 동일)
    useEffect(() => {
        if (loading || allData.length === 0) return;
        const now = new Date(2025, 9, 28);
        let startDate;
        if (selectedPeriod === 'last30days') {
            startDate = new Date(now); startDate.setDate(now.getDate() - 30);
        } else if (selectedPeriod === 'thisYear') {
            startDate = new Date(now.getFullYear(), 0, 1);
        } else { startDate = new Date(2000, 0, 1); }
        const filtered = allData.filter(d => d.dateObj >= startDate && d.dateObj <= now);
        setFilteredData(filtered);
    }, [allData, selectedPeriod, loading]);

    // 3. KPI 및 차트 데이터 계산 (가동률 -> 활성 개소수 변경)
    const kpiData = useMemo(() => {
        // ... (계산 로직은 이전과 동일) ...
        if (filteredData.length === 0) return { totalReceiving: 0, totalSorting: 0, totalShipping: 0, activeApcCount: 0, totalApcCount: 55, topApcs: [], topItemsTreemap: [], monthlyTrends: [] };
        const totalReceiving = filteredData.reduce((sum, d) => sum + d.receiving_kg, 0);
        const totalSorting = filteredData.reduce((sum, d) => sum + d.sorting_kg, 0);
        const totalShipping = filteredData.reduce((sum, d) => sum + d.shipping_kg, 0);
        const operatingApcSet = new Set(filteredData.filter(d => d.receiving_kg > 0).map(d => d.apc_name));
        const activeApcCount = operatingApcSet.size;
        const totalApcCount = 55;
        const apcTotals = filteredData.reduce((acc, d) => { acc[d.apc_name] = (acc[d.apc_name] || 0) + d.shipping_kg; return acc; }, {});
        const topApcs = Object.entries(apcTotals).sort(([, a], [, b]) => b - a).slice(0, 5).map(([name, value]) => ({ name, value }));
        const itemTotals = filteredData.reduce((acc, d) => { acc[d.item_name] = (acc[d.item_name] || 0) + d.receiving_kg; return acc; }, {});
        const topItemsTreemap = Object.entries(itemTotals).sort(([, a], [, b]) => b - a).map(([name, value]) => ({ name, size: value }));
        const monthlyTotals = allData.reduce((acc, d) => {
            const month = d.record_date.substring(0, 7);
            if (!acc[month]) { acc[month] = { month, receiving: 0, sorting: 0, shipping: 0 }; }
            acc[month].receiving += d.receiving_kg; acc[month].sorting += d.sorting_kg; acc[month].shipping += d.shipping_kg;
            return acc;
        }, {});
        const monthlyTrends = Object.values(monthlyTotals).sort((a, b) => a.month.localeCompare(b.month));
        return { totalReceiving, totalSorting, totalShipping, activeApcCount, totalApcCount, topApcs, topItemsTreemap, monthlyTrends };
    }, [filteredData, allData]);

    // 드롭다운 외부 클릭 시 닫기
    useEffect(() => {
        function handleClickOutside(event) {
            if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
                setIsDropdownOpen(false);
            }
        }
        document.addEventListener("mousedown", handleClickOutside);
        return () => document.removeEventListener("mousedown", handleClickOutside);
    }, [dropdownRef]);

    if (loading) {
        // --- 로딩 스켈레톤 UI (간단 버전) ---
        return (
            <div className="p-6 font-sans animate-pulse">
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-6 mb-8 items-center">
                    {[...Array(4)].map((_, i) => <div key={i} className="h-28 bg-gray-300 rounded-xl"></div>)}
                    <div className="h-28 flex justify-end items-center">
                        <div className="w-32 h-10 bg-gray-300 rounded-lg"></div>
                    </div>
                </div>
                {/* ... (나머지 스켈레톤 UI) ... */}
                <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                    <div className="lg:col-span-2 h-80 bg-gray-300 rounded-xl"></div>
                    <div className="h-80 bg-gray-300 rounded-xl"></div>
                    <div className="lg:col-span-3 h-80 bg-gray-300 rounded-xl"></div>
                </div>
            </div>
        );
    }

    // --- KPI 카드 (아이콘 추가) ---
    const KpiCard = ({ title, value, unit, icon, colorClass, totalValue }) => (
        <div className={`bg-white p-5 rounded-xl shadow hover:shadow-lg transition-shadow duration-300 border-l-4 ${colorClass}`}>
            <div className="flex justify-between items-center mb-1">
                <h3 className="text-sm font-semibold text-gray-500 uppercase">{title}</h3>
                {React.cloneElement(icon, { size: 35, className: "text-gray-400" })}
            </div>
            <p className="text-3xl font-bold text-gray-800">
                {formatNumber(value)}
                {totalValue && <span className="text-lg font-normal text-gray-500"> / {formatNumber(totalValue)}</span>}
                {unit && <span className="text-lg font-normal text-gray-600 ml-1">{unit}</span>}
            </p>
        </div>
    );

    return (
        <>
            {/* Pretendard 웹 폰트 적용 (CDN) - 표준 <style> 태그 사용 */}
            <style>
                {`
                    @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css');
                    .font-pretendard {
                        font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui, Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', sans-serif;
                    }
                `}
            </style>

            <div className="bg-gradient-to-br from-blue-50 to-indigo-100 p-6 font-pretendard">

                {/* 1. 핵심 KPI 카드 + 기간 선택 드롭다운 버튼 */}
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-6 mb-8 items-stretch"> {/* items-center -> items-stretch */}
                    <KpiCard title="총 입고량" value={kpiData.totalReceiving} unit="kg" icon={<Box />} colorClass="border-indigo-500" />
                    <KpiCard title="총 선별량" value={kpiData.totalSorting} unit="kg" icon={<Wrench />} colorClass="border-blue-500" />
                    <KpiCard title="총 출하량" value={kpiData.totalShipping} unit="kg" icon={<Truck />} colorClass="border-green-500" />
                    <KpiCard title="활성 APC" value={kpiData.activeApcCount} totalValue={kpiData.totalApcCount} unit="개소" icon={<Building2 />} colorClass="border-purple-500" />

                    {/* 기간 선택 드롭다운 버튼 (5번째 그리드 아이템) */}
                    <div ref={dropdownRef} className="relative bg-white p-5 rounded-xl shadow hover:shadow-lg transition-shadow duration-300 flex flex-col justify-center items-center"> {/* flex-col 추가 */}
                        <h3 className="text-sm font-semibold text-gray-500 uppercase mb-2 w-full text-center">조회 기간</h3> {/* 제목 추가 */}
                        <button
                            onClick={() => setIsDropdownOpen(!isDropdownOpen)}
                            className="flex items-center justify-between w-full p-2 border border-gray-300 rounded-lg bg-white text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500"
                        >
                            <span>{periodOptions[selectedPeriod]}</span>
                            <ChevronDown size={16} className={`transition-transform ${isDropdownOpen ? 'rotate-180' : ''}`} />
                        </button>
                        {/* 드롭다운 메뉴 */}
                        {isDropdownOpen && (
                            <div className="absolute top-full right-0 mt-2 w-full bg-white rounded-lg shadow-xl border border-gray-200 z-10">
                                {Object.entries(periodOptions).map(([value, label]) => (
                                    <button
                                        key={value}
                                        onClick={() => {
                                            setSelectedPeriod(value);
                                            setIsDropdownOpen(false);
                                        }}
                                        className={`block w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-indigo-50 ${selectedPeriod === value ? 'font-semibold bg-indigo-100' : ''}`}
                                    >
                                        {label}
                                    </button>
                                ))}
                            </div>
                        )}
                    </div>
                </div>


                {/* 2. 차트 영역 - 차트 컨테이너에 h-80 적용 */}
                <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                    {/* 월별 처리량 추이 (라인) */}
                    <div className="lg:col-span-2 bg-white p-6 rounded-xl shadow hover:shadow-lg transition-shadow duration-300 h-80">
                        <h3 className="text-lg font-semibold text-gray-700 mb-4 flex-shrink-0">월별 처리량 추이 (kg)</h3>
                        <ResponsiveContainer width="100%" height="100%">
                            <LineChart data={kpiData.monthlyTrends} margin={{ top: 5, right: 30, left: 20, bottom: 25 }}>
                                <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                                <XAxis dataKey="month" stroke="#6b7280" />
                                <YAxis tickFormatter={formatNumber} stroke="#6b7280" />
                                <Tooltip contentStyle={{ backgroundColor: 'rgba(255, 255, 255, 0.8)', borderRadius: '8px', border: '1px solid #e5e7eb' }} itemStyle={{ color: '#374151' }} formatter={(value) => formatNumber(value)}/>
                                <Legend wrapperStyle={{ paddingTop: '20px' }}/>
                                <Line type="monotone" dataKey="receiving" name="입고량" stroke="#818cf8" strokeWidth={2} dot={{ r: 4 }} activeDot={{ r: 8 }} />
                                <Line type="monotone" dataKey="sorting" name="선별량" stroke="#60a5fa" strokeWidth={2} dot={{ r: 4 }} />
                                <Line type="monotone" dataKey="shipping" name="출하량" stroke="#34d399" strokeWidth={2} dot={{ r: 4 }} />
                            </LineChart>
                        </ResponsiveContainer>
                    </div>

                    {/* 실적 상위 APC (가로 막대) */}
                    <div className="bg-white p-6 rounded-xl shadow hover:shadow-lg transition-shadow duration-300 h-80">
                        <h3 className="text-lg font-semibold text-gray-700 mb-4 flex-shrink-0">실적 상위 APC (출하량 기준)</h3>
                        <ResponsiveContainer width="100%" height="100%">
                            <BarChart data={kpiData.topApcs} layout="vertical" margin={{ top: 5, right: 30, left: 10, bottom: 25 }}>
                                <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                                <XAxis type="number" tickFormatter={(tick) => `${formatNumber(tick/1000)}t`} stroke="#6b7280" />
                                <YAxis type="category" dataKey="name" width={100} stroke="#6b7280" style={{ fontSize: '12px' }} />
                                <Tooltip formatter={(value) => formatNumber(value) + ' kg'}/>
                                <Bar dataKey="value" name="출하량(kg)" radius={[0, 5, 5, 0]}> {kpiData.topApcs.map((entry, index) => (<Cell key={`cell-${index}`} fill={PASTEL_COLORS[index % PASTEL_COLORS.length]} />))} </Bar>
                            </BarChart>
                        </ResponsiveContainer>
                    </div>

                    {/* 주요 취급 품목 (Treemap) */}
                    <div className="lg:col-span-3 bg-white p-6 rounded-xl shadow hover:shadow-lg transition-shadow duration-300 h-80">
                        <h3 className="text-lg font-semibold text-gray-700 mb-4 flex-shrink-0">주요 취급 품목 (입고량 기준)</h3>
                        <ResponsiveContainer width="100%" height="80%" >
                            <Treemap data={kpiData.topItemsTreemap} dataKey="size" ratio={4 / 3} stroke="#fff" fill="#8884d8" isAnimationActive={false} content={<CustomizedContent />}>
                                <Tooltip formatter={(value, name) => [`${formatNumber(value)} kg`, name]}/>
                            </Treemap>
                        </ResponsiveContainer>
                    </div>
                </div>
            </div>
        </>
    );
};

export default ApcTotal;

