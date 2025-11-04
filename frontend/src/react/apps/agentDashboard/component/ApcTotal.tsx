import React, { useState, useEffect, useMemo, useRef } from 'react';
import {
    LineChart, Line, BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, Treemap, Cell
} from 'recharts';
import { Box, Wrench, Truck, Building2, ChevronDown } from 'lucide-react';
import { dummyCsvData } from '@apps/agentDashboard/data/apcTotalData';

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

const formatNumber = (num) => num ? num.toLocaleString('ko-KR') : '0';
const PASTEL_COLORS = ['#818cf8', '#60a5fa', '#34d399', '#a78bfa', '#f472b6', '#fbbf24'];

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

const ApcTotal = () => {
    const [allData, setAllData] = useState([]);
    const [filteredData, setFilteredData] = useState([]);
    const [selectedPeriod, setSelectedPeriod] = useState('last30days');
    const [loading, setLoading] = useState(true);
    const [isDropdownOpen, setIsDropdownOpen] = useState(false);
    const dropdownRef = useRef(null);

    const periodOptions = {
        'last30days': '최근 30일',
        'thisYear': '올해 누적',
        // 'allTime': '전체 기간'
    };
    const rotatingValues = ["last30days", "thisYear"];

    useEffect(() => {
        // 2초마다 선택값 변경
        const intervalMs = 10000;

        let idx = 0;
        const id = setInterval(() => {
            idx = (idx + 1) % rotatingValues.length;
            setSelectedPeriod(rotatingValues[idx]);
        }, intervalMs);

        // 언마운트 시 interval 정리
        return () => clearInterval(id);
    }, []);


    useEffect(() => {
        setTimeout(() => {
            const parsed = parseCSV(dummyCsvData);
            setAllData(parsed);
            setLoading(false);
        }, 1000);
    }, []);

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

    const kpiData = useMemo(() => {
        if (filteredData.length === 0) return { totalReceiving: 0, totalSorting: 0, totalShipping: 0, activeApcCount: 0, topApcs: [], topItemsTreemap: [], monthlyTrends: [] };
        const totalReceiving = filteredData.reduce((sum, d) => sum + d.receiving_kg, 0);
        const totalSorting = filteredData.reduce((sum, d) => sum + d.sorting_kg, 0);
        const totalShipping = filteredData.reduce((sum, d) => sum + d.shipping_kg, 0);
        const operatingApcSet = new Set(filteredData.filter(d => d.receiving_kg > 0).map(d => d.apc_name));
        const activeApcCount = operatingApcSet.size;
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
        return { totalReceiving, totalSorting, totalShipping, activeApcCount, topApcs, topItemsTreemap, monthlyTrends };
    }, [filteredData, allData]);

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
        return (
            <div className="flex items-center justify-center h-full w-full">
                <div className="text-gray-500">데이터를 불러오는 중...</div>
            </div>
        );
    }

    const KpiCard = ({ title, value, unit, icon, colorClass, totalValue }) => (
        <div className={`bg-white p-3 rounded-xl shadow hover:shadow-lg transition-shadow duration-300 border-l-4 ${colorClass}`}>
            <div className="flex justify-between items-center mb-1">
                <h3 className="text-xs font-semibold text-gray-500 uppercase">{title}</h3>
                {React.cloneElement(icon, { size: 24, className: "text-gray-400" })}
            </div>
            <p className="text-xl font-bold text-gray-800">
                {formatNumber(value)}
                {totalValue && <span className="text-sm font-normal text-gray-500"> / {formatNumber(totalValue)}</span>}
                {unit && <span className="text-sm font-normal text-gray-600 ml-1">{unit}</span>}
            </p>
        </div>
    );

    return (
        <>
            <style>
                {`
                    @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css');
                    .font-pretendard {
                        font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui, Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif;
                    }
                `}
            </style>

            <div className="flex flex-col h-full w-full bg-gradient-to-br from-blue-50 to-indigo-100 p-0 font-pretendard overflow-hidden">
                {/* KPI 카드 영역 */}
                <div className="grid grid-cols-5 gap-3 mb-3 flex-shrink-0">
                    <KpiCard title="총 입고량" value={kpiData.totalReceiving} unit="kg" icon={<Box />} colorClass="border-indigo-500" />
                    <KpiCard title="총 선별량" value={kpiData.totalSorting} unit="kg" icon={<Wrench />} colorClass="border-blue-500" />
                    <KpiCard title="총 출하량" value={kpiData.totalShipping} unit="kg" icon={<Truck />} colorClass="border-green-500" />
                    <KpiCard title="활성 APC" value={kpiData.activeApcCount} unit={'개소'} icon={<Building2 />} colorClass="border-purple-500" />

                    <div ref={dropdownRef} className="relative bg-white p-3 rounded-xl shadow hover:shadow-lg transition-shadow duration-300 flex flex-col justify-center items-center">
                        <h3 className="text-xs font-semibold text-gray-500 uppercase mb-1 w-full text-center">조회 기간</h3>
                        <button
                            onClick={() => setIsDropdownOpen(!isDropdownOpen)}
                            className="flex items-center justify-between w-full p-2 border border-gray-300 rounded-lg bg-white text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 text-sm"
                        >
                            <span>{periodOptions[selectedPeriod]}</span>
                            <ChevronDown size={16} className={`transition-transform ${isDropdownOpen ? 'rotate-180' : ''}`} />
                        </button>
                        {isDropdownOpen && (
                            <div className="absolute top-full right-0 mt-2 w-full bg-white rounded-lg shadow-xl border border-gray-200 z-10">
                                {Object.entries(periodOptions).map(([value, label]) => (
                                    <button
                                        key={value}
                                        onClick={() => {
                                            setSelectedPeriod(value);
                                            setIsDropdownOpen(false);
                                        }}
                                        className={`block w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-indigo-50 first:rounded-t-lg last:rounded-b-lg ${selectedPeriod === value ? 'font-semibold bg-indigo-100' : ''}`}
                                    >
                                        {label}
                                    </button>
                                ))}
                            </div>
                        )}
                    </div>
                </div>

                {/* 차트 영역 */}
                <div className="grid grid-cols-3 gap-3 flex-1 min-h-0 overflow-hidden">
                    {/* 월별 처리량 추이 */}
                    <div className="col-span-2 bg-white p-3 rounded-xl shadow flex flex-col overflow-hidden">
                        <h3 className="text-sm font-semibold text-gray-700 mb-2 flex-shrink-0">월별 처리량 추이 (kg)</h3>
                        <div className="flex-1 min-h-0">
                            <ResponsiveContainer width="100%" height="100%">
                                <LineChart data={kpiData.monthlyTrends} margin={{ top: 5, right: 15, left: 5, bottom: 5 }}>
                                    <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                                    <XAxis dataKey="month" stroke="#6b7280" style={{ fontSize: '10px' }} />
                                    <YAxis tickFormatter={formatNumber} stroke="#6b7280" style={{ fontSize: '10px' }} width={50} />
                                    <Tooltip contentStyle={{ fontSize: '11px' }} formatter={(value) => formatNumber(value)}/>
                                    <Legend wrapperStyle={{ fontSize: '11px' }}/>
                                    <Line type="monotone" dataKey="receiving" name="입고량" stroke="#818cf8" strokeWidth={2} dot={{ r: 2 }} />
                                    <Line type="monotone" dataKey="sorting" name="선별량" stroke="#60a5fa" strokeWidth={2} dot={{ r: 2 }} />
                                    <Line type="monotone" dataKey="shipping" name="출하량" stroke="#34d399" strokeWidth={2} dot={{ r: 2 }} />
                                </LineChart>
                            </ResponsiveContainer>
                        </div>
                    </div>

                    {/* 실적 상위 APC */}
                    <div className="bg-white p-3 rounded-xl shadow flex flex-col overflow-hidden">
                        <h3 className="text-sm font-semibold text-gray-700 mb-2 flex-shrink-0">실적 상위 APC</h3>
                        <div className="flex-1 min-h-0">
                            <ResponsiveContainer width="100%" height="100%">
                                <BarChart data={kpiData.topApcs} layout="vertical" margin={{ top: 5, right: 15, left: 5, bottom: 5 }}>
                                    <CartesianGrid strokeDasharray="3 3" stroke="#e5e7eb" />
                                    <XAxis type="number" tickFormatter={(tick) => `${formatNumber(tick/1000)}t`} stroke="#6b7280" style={{ fontSize: '10px' }} />
                                    <YAxis type="category" dataKey="name" width={70} stroke="#6b7280" style={{ fontSize: '10px' }} />
                                    <Tooltip formatter={(value) => formatNumber(value) + ' kg'} contentStyle={{ fontSize: '11px' }}/>
                                    <Bar dataKey="value" name="출하량" radius={[0, 4, 4, 0]}>
                                        {kpiData.topApcs.map((entry, index) => (
                                            <Cell key={`cell-${index}`} fill={PASTEL_COLORS[index % PASTEL_COLORS.length]} />
                                        ))}
                                    </Bar>
                                </BarChart>
                            </ResponsiveContainer>
                        </div>
                    </div>

                    {/* 주요 취급 품목 */}
                    <div className="col-span-3 bg-white p-3 rounded-xl shadow flex flex-col overflow-hidden">
                        <h3 className="text-sm font-semibold text-gray-700 mb-2 flex-shrink-0">주요 취급 품목 (입고량 기준)</h3>
                        <div className="flex-1 min-h-0">
                            <ResponsiveContainer width="100%" height="100%">
                                <Treemap data={kpiData.topItemsTreemap} dataKey="size" ratio={4 / 3} stroke="#fff" isAnimationActive={false} content={<CustomizedContent />}>
                                    <Tooltip formatter={(value, name) => [`${formatNumber(value)} kg`, name]} contentStyle={{ fontSize: '11px' }}/>
                                </Treemap>
                            </ResponsiveContainer>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
};

export default ApcTotal;