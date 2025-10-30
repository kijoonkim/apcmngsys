import React, { useState, useEffect, useMemo } from 'react';
import {
    BarChart, Bar, LineChart, Line, PieChart, Pie, Cell,
    XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer,
    Area, AreaChart
} from 'recharts';

// CSV 데이터 (업로드한 더미 데이터의 일부)
const dummyDataCsv = `record_date,apc_name,item_name,receiving_kg,sorting_kg,shipping_kg
2025-01-01,신미네유통,상추,3677,3387,3136
2025-01-01,해도지영농,브로콜리,2982,2692,2035
2025-01-01,상주원예영농,딸기,768,668,585
2025-01-01,로즈피아,새우,3487,3483,3119
2025-01-01,거산 여주,브로콜리,1820,1689,1687
2025-01-01,한우리,오이,3424,3031,2679
2025-01-01,현대유통,멸치,617,613,465
2025-01-01,성주참외원예농협,감자,3837,3419,3318
2025-01-01,월항농협,호박,3296,2958,2702
2025-01-01,진주중부농협,깻잎,1343,1321,1089
2025-01-01,운봉농협,시금치,3322,3072,2380
2025-01-01,신선미세상,콩,3625,3454,2885
2025-01-01,샤인트리,상추,3874,3422,2573
2025-01-01,지우,양파,1643,1469,1134
2025-01-01,버들농산,호박,1010,928,806
2025-01-01,모두유통,굴비,3879,3443,3256
2025-01-01,영흥농산,배추,1761,1626,1305
2025-01-01,참 영농,인삼,1875,1785,1463
2025-01-01,광일영농,파프리카,3265,3261,2790
2025-01-01,함양농협,고구마,524,491,420
2025-01-01,미르영농,버섯,4185,3717,3149
2025-01-01,남일영농,양파,4933,4480,4368
2025-01-02,신미네유통,상추,2313,2302,2188
2025-01-02,해도지영농,브로콜리,1684,1581,1415
2025-01-02,상주원예영농,딸기,3652,3565,2773
2025-01-02,거산 여주,브로콜리,2683,2431,2003
2025-01-02,한우리,오이,3164,2840,2280
2025-01-02,월항농협,호박,3864,3738,3455
2025-01-02,진주중부농협,깻잎,3897,3448,3285
2025-01-02,운봉농협,시금치,4035,3904,3663
2025-01-02,신선미세상,콩,736,672,640
2025-01-02,샤인트리,상추,3686,3403,3007
2025-01-02,지우,양파,3376,3041,2563
2025-01-02,버들농산,호박,2724,2593,2358
2025-01-02,모두유통,굴비,3265,2887,2821
2025-01-02,영흥농산,배추,4089,3779,3710
2025-01-03,신미네유통,상추,3245,3012,2678
2025-01-03,해도지영농,브로콜리,2156,1987,1756
2025-01-03,상주원예영농,딸기,2987,2754,2345
2025-01-03,거산 여주,브로콜리,3456,3234,2987
2025-01-03,한우리,오이,2876,2654,2345
2025-01-03,월항농협,호박,3123,2987,2678
2025-01-04,신미네유통,상추,3567,3298,2987
2025-01-04,해도지영농,브로콜리,2789,2567,2234
2025-01-04,상주원예영농,딸기,3234,2987,2678
2025-01-04,거산 여주,브로콜리,2987,2765,2456
2025-01-04,한우리,오이,3456,3187,2876
2025-01-05,신미네유통,상추,3987,3678,3345
2025-01-05,해도지영농,브로콜리,3123,2876,2567
2025-01-05,상주원예영농,딸기,3567,3298,2987
2025-01-05,거산 여주,브로콜리,3234,2987,2678
2025-01-05,한우리,오이,3789,3456,3123`;

// CSV 파싱 함수
const parseCSV = (csvText: string) => {
    const lines = csvText.trim().split('\n');
    const headers = lines[0].split(',');

    return lines.slice(1).map(line => {
        const values = line.split(',');
        const obj: any = {};
        headers.forEach((header, index) => {
            obj[header.trim()] = values[index]?.trim();
        });
        return obj;
    });
};

// 유틸리티 함수
const formatNumber = (num: number) => num.toLocaleString('ko-KR');
const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    return `${date.getMonth() + 1}/${date.getDate()}`;
};

// 색상 팔레트
const COLORS = ['rgba(72,140,199,0.91)', '#55a679', '#e37e45', '#e065a3', '#805ad5', '#319795', '#d69e2e', '#e53e3e'];

const ApcItem = () => {
    const [rawData, setRawData] = useState([]);
    const [selectedItem, setSelectedItem] = useState<string | null>("브로콜리");
    const [loading, setLoading] = useState(true);
    const tableScrollRef = React.useRef<HTMLDivElement>(null);

    // 데이터 로딩
    useEffect(() => {
        setTimeout(() => {
            const parsed = parseCSV(dummyDataCsv);
            setRawData(parsed);
            setLoading(false);
        }, 300);
    }, []);

    useEffect(() => {
        const scrollContainer = tableScrollRef.current;
        if (!scrollContainer || loading) return;

        let scrollDirection = 1;
        let isScrolling = true;
        let pauseTimer: NodeJS.Timeout | null = null;

        const autoScroll = () => {
            if (!isScrolling || !scrollContainer || pauseTimer) return;

            const maxScroll = scrollContainer.scrollHeight - scrollContainer.clientHeight;
            const currentScroll = scrollContainer.scrollTop;
            const scrollSpeed = 1.5;

            if (scrollDirection === 1) {
                if (currentScroll >= maxScroll - 5) {
                    pauseTimer = setTimeout(() => {
                        scrollDirection = -1;
                        pauseTimer = null;
                    }, 2000);
                } else {
                    scrollContainer.scrollTop += scrollSpeed;
                }
            } else {
                if (currentScroll <= 5) {
                    pauseTimer = setTimeout(() => {
                        scrollDirection = 1;
                        pauseTimer = null;
                    }, 2000);
                } else {
                    scrollContainer.scrollTop -= scrollSpeed;
                }
            }
        };

        const intervalId = setInterval(autoScroll, 30);

        const handleMouseEnter = () => {
            isScrolling = false;
        };

        const handleMouseLeave = () => {
            isScrolling = true;
        };

        scrollContainer.addEventListener('mouseenter', handleMouseEnter);
        scrollContainer.addEventListener('mouseleave', handleMouseLeave);

        return () => {
            clearInterval(intervalId);
            if (pauseTimer) clearTimeout(pauseTimer);
            scrollContainer.removeEventListener('mouseenter', handleMouseEnter);
            scrollContainer.removeEventListener('mouseleave', handleMouseLeave);
        };
    }, [loading]);


    // 품목별 집계 데이터
    const itemSummary = useMemo(() => {
        const summary: any = {};

        rawData.forEach((row: any) => {
            const item = row.item_name;
            const receiving = parseFloat(row.receiving_kg) || 0;
            const sorting = parseFloat(row.sorting_kg) || 0;
            const shipping = parseFloat(row.shipping_kg) || 0;

            if (!summary[item]) {
                summary[item] = {
                    item_name: item,
                    total_receiving: 0,
                    total_sorting: 0,
                    total_shipping: 0,
                    count: 0,
                    loss_rate: 0,
                };
            }

            summary[item].total_receiving += receiving;
            summary[item].total_sorting += sorting;
            summary[item].total_shipping += shipping;
            summary[item].count += 1;
        });

        // 손실률 계산
        Object.values(summary).forEach((item: any) => {
            item.loss_rate = item.total_receiving > 0
                ? ((item.total_receiving - item.total_shipping) / item.total_receiving * 100).toFixed(1)
                : 0;
        });

        return Object.values(summary).sort((a: any, b: any) => b.total_receiving - a.total_receiving);
    }, [rawData]);

    // 일자별 추이 데이터 (선택된 품목)
    const dailyTrend = useMemo(() => {
        if (!selectedItem) return [];

        const trendMap: any = {};

        rawData
            .filter((row: any) => row.item_name === selectedItem)
            .forEach((row: any) => {
                const date = row.record_date;
                if (!trendMap[date]) {
                    trendMap[date] = {
                        date: formatDate(date),
                        receiving: 0,
                        sorting: 0,
                        shipping: 0,
                    };
                }

                trendMap[date].receiving += parseFloat(row.receiving_kg) || 0;
                trendMap[date].sorting += parseFloat(row.sorting_kg) || 0;
                trendMap[date].shipping += parseFloat(row.shipping_kg) || 0;
            });

        return Object.values(trendMap);
    }, [rawData, selectedItem]);

    // 상위 10개 품목 (파이차트용)
    const top10Items = useMemo(() => {
        return itemSummary.slice(0, 10).map((item: any) => ({
            name: item.item_name,
            value: item.total_receiving,
        }));
    }, [itemSummary]);

    // 품목별 손실률 (막대 차트용)
    const lossRateData = useMemo(() => {
        return itemSummary.slice(0, 10).map((item: any) => ({
            name: item.item_name,
            loss_rate: parseFloat(item.loss_rate),
        }));
    }, [itemSummary]);

    if (loading) {
        return <div className="p-6 text-center">품목별 데이터를 불러오는 중입니다...</div>;
    }

    return (
        <div className="p-6 bg-gray-50 min-h-screen font-pretendard">
            <h2 className="text-2xl font-bold text-gray-800 mb-6">품목별 상세 분석</h2>

            {/* 상단 요약 카드 */}
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
                <div className="bg-white p-4 rounded-lg shadow">
                    <div className="text-sm text-gray-500 mb-1">총 품목 수</div>
                    <div className="text-2xl font-bold text-blue-600">{itemSummary.length}개</div>
                </div>
                <div className="bg-white p-4 rounded-lg shadow">
                    <div className="text-sm text-gray-500 mb-1">총 입고량</div>
                    <div className="text-2xl font-bold text-green-600">
                        {formatNumber(itemSummary.reduce((sum: number, item: any) => sum + item.total_receiving, 0))}kg
                    </div>
                </div>
                <div className="bg-white p-4 rounded-lg shadow">
                    <div className="text-sm text-gray-500 mb-1">총 출하량</div>
                    <div className="text-2xl font-bold text-purple-600">
                        {formatNumber(itemSummary.reduce((sum: number, item: any) => sum + item.total_shipping, 0))}kg
                    </div>
                </div>
                <div className="bg-white p-4 rounded-lg shadow">
                    <div className="text-sm text-gray-500 mb-1">평균 손실률</div>
                    <div className="text-2xl font-bold text-orange-600">
                        {(itemSummary.reduce((sum: number, item: any) => sum + parseFloat(item.loss_rate), 0) / itemSummary.length).toFixed(1)}%
                    </div>
                </div>
            </div>

            {/* 차트 그리드 */}
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
                {/* 품목별 입고량 TOP 10 - 파이 차트 */}
                <div className="bg-white p-6 rounded-lg shadow">
                    <h3 className="text-lg font-semibold text-gray-700 mb-4">품목별 입고량 TOP 10</h3>
                    <ResponsiveContainer width="100%" height={300}>
                        <PieChart>
                            <Pie
                                data={top10Items}
                                cx="50%"
                                cy="50%"
                                labelLine={false}
                                label={({ name, percent }) => `${name} ${(percent * 100).toFixed(0)}%`}
                                outerRadius={100}
                                fill="#8884d8"
                                dataKey="value"
                            >
                                {top10Items.map((entry: any, index: number) => (
                                    <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                                ))}
                            </Pie>
                            <Tooltip formatter={(value: number) => formatNumber(value) + 'kg'} />
                        </PieChart>
                    </ResponsiveContainer>
                </div>

                {/* 품목별 손실률 - 막대 차트 */}
                <div className="bg-white p-6 rounded-lg shadow">
                    <h3 className="text-lg font-semibold text-gray-700 mb-4">품목별 손실률 TOP 10</h3>
                    <ResponsiveContainer width="100%" height={300}>
                        <BarChart data={lossRateData}>
                            <CartesianGrid strokeDasharray="3 3" />
                            <XAxis dataKey="name" angle={-45} textAnchor="end" height={80} />
                            <YAxis label={{ value: '손실률(%)', angle: -90, position: 'insideLeft' }} />
                            <Tooltip formatter={(value: number) => `${value}%`} />
                            <Bar dataKey="loss_rate" fill="#f56565" />
                        </BarChart>
                    </ResponsiveContainer>
                </div>
            </div>

            {/* 품목 선택 및 일자별 추이 */}
            <div className="bg-white p-6 rounded-lg shadow mb-6">
                <div className="flex items-center justify-between mb-4">
                    <h3 className="text-lg font-semibold text-gray-700">일자별 추이 분석</h3>
                    <select
                        className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                        value={selectedItem || ''}
                        onChange={(e) => setSelectedItem(e.target.value)}
                    >
                        <option value="">품목 선택</option>
                        {itemSummary.map((item: any) => (
                            <option key={item.item_name} value={item.item_name}>
                                {item.item_name}
                            </option>
                        ))}
                    </select>
                </div>

                {selectedItem ? (
                    <ResponsiveContainer width="100%" height={350}>
                        <AreaChart data={dailyTrend}>
                            <defs>
                                <linearGradient id="colorReceiving" x1="0" y1="0" x2="0" y2="1">
                                    <stop offset="5%" stopColor="#3182ce" stopOpacity={0.8}/>
                                    <stop offset="95%" stopColor="#3182ce" stopOpacity={0.1}/>
                                </linearGradient>
                                <linearGradient id="colorSorting" x1="0" y1="0" x2="0" y2="1">
                                    <stop offset="5%" stopColor="#38a169" stopOpacity={0.8}/>
                                    <stop offset="95%" stopColor="#38a169" stopOpacity={0.1}/>
                                </linearGradient>
                                <linearGradient id="colorShipping" x1="0" y1="0" x2="0" y2="1">
                                    <stop offset="5%" stopColor="#805ad5" stopOpacity={0.8}/>
                                    <stop offset="95%" stopColor="#805ad5" stopOpacity={0.1}/>
                                </linearGradient>
                            </defs>
                            <CartesianGrid strokeDasharray="3 3" />
                            <XAxis dataKey="date" />
                            <YAxis label={{ value: '중량(kg)', angle: -90, position: 'insideLeft' }} />
                            <Tooltip formatter={(value: number) => formatNumber(value) + 'kg'} />
                            <Legend />
                            <Area
                                type="monotone"
                                dataKey="receiving"
                                name="입고"
                                stroke="#3182ce"
                                fillOpacity={1}
                                fill="url(#colorReceiving)"
                            />
                            <Area
                                type="monotone"
                                dataKey="sorting"
                                name="선별"
                                stroke="#38a169"
                                fillOpacity={1}
                                fill="url(#colorSorting)"
                            />
                            <Area
                                type="monotone"
                                dataKey="shipping"
                                name="출하"
                                stroke="#805ad5"
                                fillOpacity={1}
                                fill="url(#colorShipping)"
                            />
                        </AreaChart>
                    </ResponsiveContainer>
                ) : (
                    <div className="h-[350px] flex items-center justify-center text-gray-400">
                        품목을 선택하면 일자별 추이를 확인할 수 있습니다
                    </div>
                )}
            </div>

            {/* 품목별 상세 테이블 */}
            <div className="bg-white p-6 rounded-lg shadow">
                <h3 className="text-lg font-semibold text-gray-700 mb-4">품목별 상세 현황</h3>
                <div className="overflow-x-auto">
                    <table className="w-full text-sm">
                        <thead className="bg-gray-50">
                        <tr>
                            <th className="px-4 py-3 text-left font-semibold">순위</th>
                            <th className="px-4 py-3 text-left font-semibold">품목명</th>
                            <th className="px-4 py-3 text-right font-semibold">총 입고(kg)</th>
                            <th className="px-4 py-3 text-right font-semibold">총 선별(kg)</th>
                            <th className="px-4 py-3 text-right font-semibold">총 출하(kg)</th>
                            <th className="px-4 py-3 text-right font-semibold">손실률(%)</th>
                            <th className="px-4 py-3 text-center font-semibold">처리 건수</th>
                        </tr>
                        </thead>
                        <tbody>
                        {itemSummary.map((item: any, index: number) => (
                            <tr
                                key={item.item_name}
                                className={`border-b hover:bg-gray-50 cursor-pointer ${selectedItem === item.item_name ? 'bg-blue-50' : ''}`}
                                onClick={() => setSelectedItem(item.item_name)}
                            >
                                <td className="px-4 py-3 text-gray-600">{index + 1}</td>
                                <td className="px-4 py-3 font-medium text-gray-800">{item.item_name}</td>
                                <td className="px-4 py-3 text-right text-blue-600 font-medium">
                                    {formatNumber(Math.round(item.total_receiving))}
                                </td>
                                <td className="px-4 py-3 text-right text-green-600">
                                    {formatNumber(Math.round(item.total_sorting))}
                                </td>
                                <td className="px-4 py-3 text-right text-purple-600">
                                    {formatNumber(Math.round(item.total_shipping))}
                                </td>
                                <td className="px-4 py-3 text-right">
                                        <span className={`font-medium ${parseFloat(item.loss_rate) > 15 ? 'text-red-600' : 'text-orange-600'}`}>
                                            {item.loss_rate}
                                        </span>
                                </td>
                                <td className="px-4 py-3 text-center text-gray-600">{item.count}</td>
                            </tr>
                        ))}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    );
};

export default ApcItem;