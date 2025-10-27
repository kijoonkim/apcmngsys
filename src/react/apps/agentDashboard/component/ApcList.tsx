import React, { useState, useEffect } from 'react';
import {
    BoxIcon,
    BugIcon,
    CalendarIcon,
    CloudDrizzleIcon,
    CloudIcon,
    GridIcon,
    LeafIcon,
    ListIcon,
    SunIcon
} from "lucide-react";

// --- (아이콘 컴포넌트들은 이전과 동일) ---
// SunIcon, CloudIcon, CloudDrizzleIcon, BugIcon, CalendarIcon, LeafIcon, BoxIcon, ListIcon, GridIcon

// --- (차트 컴포넌트들은 이전과 동일) ---
// DonutChart, LineChart, BarChart

// --- 성수기 판단을 위한 헬퍼 데이터 및 함수 ---
const peakSeasonData = {
    '배': [8, 9, 10], // 8월, 9월, 10월
    '사과': [9, 10, 11], // 9월, 10월, 11월
    '감귤': [11, 12, 1, 2], // 11월, 12월, 1월, 2월
    '배추': [10, 11, 12], // 10월, 11월, 12월
    '토마토': [6, 7, 8], // 6월, 7월, 8월
    '고추': [7, 8, 9], // 7월, 8월, 9월
    // 필요에 따라 품목 추가
};
const ListIcon = () => (
    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><line x1="8" x2="21" y1="6" y2="6"></line><line x1="8" x2="21" y1="12" y2="12"></line><line x1="8" x2="21" y1="18" y2="18"></line><line x1="3" x2="3.01" y1="6" y2="6"></line><line x1="3" x2="3.01" y1="12" y2="12"></line><line x1="3" x2="3.01" y1="18" y2="18"></line></svg>
);

const GridIcon = () => (
    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><rect width="7" height="7" x="3" y="3" rx="1"></rect><rect width="7" height="7" x="14" y="3" rx="1"></rect><rect width="7" height="7" x="14" y="14" rx="1"></rect><rect width="7" height="7" x="3" y="14" rx="1"></rect></svg>
);

/**
 * 현재 월을 기준으로 해당 품목이 성수기인지 확인합니다.
 * @param {string} itemName - 품목 이름.
 * @param {Date} currentDate - 현재 날짜 객체.
 * @returns {boolean} - 성수기이면 true, 아니면 false.
 */
const checkPeakSeason = (itemName, currentDate) => {
    const currentMonth = currentDate.getMonth() + 1; // getMonth()는 0부터 시작
    const seasons = peakSeasonData[itemName];
    return seasons ? seasons.includes(currentMonth) : false;
};

// --- 업데이트된 메인 컴포넌트들 ---

const APCCard = ({ apc }) => {
    const getWeatherIcon = (weather) => {
        if (!weather) return <CloudIcon />; // 날씨 데이터 로딩 전 처리
        if (weather.includes('맑음')) return <SunIcon />;
        if (weather.includes('비')) return <CloudDrizzleIcon />;
        return <CloudIcon />;
    };

    const pestAlertColor = apc.pestAlert === '경보' ? 'bg-red-100 text-red-800' : apc.pestAlert === '주의' ? 'bg-yellow-100 text-yellow-800' : 'bg-green-100 text-green-800';
    const peakSeasonColor = apc.isPeakSeason ? 'bg-emerald-100 text-emerald-800' : 'bg-slate-100 text-slate-800';

    return (
        <div className="bg-white rounded-xl shadow-md p-5 border border-gray-100 hover:shadow-lg hover:border-blue-300 transition-all duration-300">
            {/* 카드 헤더 */}
            <div className="flex justify-between items-start mb-4">
                <div>
                    <h3 className="font-bold text-xl text-slate-800">{apc.name}</h3>
                    <p className="text-sm text-slate-500">{apc.location}</p>
                </div>
                <div className="flex items-center space-x-2">
                    {/* 날씨 로딩 상태 또는 아이콘 표시 */}
                    {apc.weather === 'loading' ? (
                        <span className="text-xs text-gray-400">날씨 로딩중...</span>
                    ) : (
                        getWeatherIcon(apc.weather)
                    )}
                    <div className={`text-xs font-bold px-2 py-1 rounded-full ${pestAlertColor} flex items-center`}>
                        <BugIcon alertLevel={apc.pestAlert} />
                        <span className="ml-1">{apc.pestAlert}</span>
                    </div>
                </div>
            </div>

            {/* 주요 정보 */}
            <div className="grid grid-cols-2 gap-4 mb-4 text-sm">
                <div className="flex items-center space-x-2 text-slate-600">
                    <CalendarIcon />
                    <div>
                        <p className="font-semibold">최근 사용일</p>
                        <p>{apc.lastUsed}</p>
                    </div>
                </div>
                <div className="flex items-center space-x-2 text-slate-600">
                    <LeafIcon />
                    <div>
                        <p className="font-semibold">주력 품목</p>
                        <div className="flex items-center">
                            <p className="mr-2">{apc.mainItem}</p>
                            <span className={`text-xs font-bold px-2 py-0.5 rounded-full ${peakSeasonColor}`}>
                                {apc.isPeakSeason ? '성수기' : '비성수기'}
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            {/* 실적 */}
            <div>
                <h4 className="font-semibold text-slate-700 mb-2 flex items-center"><BoxIcon /><span className="ml-2">실적 현황</span></h4>
                <div className="space-y-2 text-sm">
                    {/* 실적 데이터가 없을 수 있는 경우 처리 */}
                    {apc.performance ? Object.entries(apc.performance).map(([key, value]) => (
                        <div key={key} className="flex items-center">
                            <span className="w-16 text-slate-600 capitalize">{key === 'receiving' ? '입고' : key === 'sorting' ? '선별' : '포장'}</span>
                            <div className="w-full bg-gray-200 rounded-full h-2.5">
                                <div className="bg-blue-500 h-2.5 rounded-full" style={{ width: `${value}%` }}></div>
                            </div>
                            <span className="ml-3 font-medium text-slate-700">{value}%</span>
                        </div>
                    )) : <p className="text-xs text-gray-500">실적 데이터 없음</p>}
                </div>
            </div>
        </div>
    );
};

const APCListItem = ({ apc }) => ( // 개별 apc 객체를 받도록 수정
    <tr className="border-b hover:bg-blue-50 transition-colors">
        <td className="p-4 font-semibold text-slate-800">{apc.name}</td>
        <td className="p-4 text-slate-600">{apc.location}</td>
        <td className="p-4 text-slate-600">{apc.lastUsed}</td>
        <td className="p-4 text-slate-600">{apc.mainItem}</td>
        <td className="p-4">
            <span className={`px-2 py-1 text-xs font-semibold rounded-full ${apc.pestAlert === '경보' ? 'bg-red-100 text-red-800' : apc.pestAlert === '주의' ? 'bg-yellow-100 text-yellow-800' : 'bg-green-100 text-green-800'}`}>
                {apc.pestAlert}
            </span>
        </td>
        {/* 실적 데이터가 없을 수 있는 경우 처리 */}
        <td className="p-4 text-slate-600">{apc.performance?.receiving ?? 'N/A'}%</td>
        <td className="p-4 text-slate-600">{apc.performance?.sorting ?? 'N/A'}%</td>
        <td className="p-4 text-slate-600">{apc.performance?.packing ?? 'N/A'}%</td>
    </tr>
);

// apcList, loading, error를 props로 받도록 수정
const APCListView = ({ apcList, loading, error }) => {
    const [viewType, setViewType] = useState('card'); // 'card' or 'list'

    if (loading) {
        return <div className="text-center p-10">데이터를 불러오는 중입니다... ⏳</div>;
    }

    if (error) {
        return <div className="text-center p-10 text-red-600">오류가 발생했습니다: {error} 😥</div>;
    }

    if (!apcList || apcList.length === 0) {
        return <div className="text-center p-10">표시할 APC 데이터가 없습니다.</div>;
    }

    return (
        <div>
            <div className="flex justify-end mb-4">
                <div className="flex items-center bg-slate-200 rounded-lg p-1">
                    <button onClick={() => setViewType('card')} className={`px-3 py-1 rounded-md text-sm font-semibold ${viewType === 'card' ? 'bg-white shadow' : 'text-slate-600'}`}><GridIcon /></button>
                    <button onClick={() => setViewType('list')} className={`px-3 py-1 rounded-md text-sm font-semibold ${viewType === 'list' ? 'bg-white shadow' : 'text-slate-600'}`}><ListIcon /></button>
                </div>
            </div>

            {viewType === 'card' ? (
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    {/* apcList prop 사용 */}
                    {apcList.map(apc => <APCCard key={apc.id} apc={apc} />)}
                </div>
            ) : (
                <div className="bg-white rounded-xl shadow-md overflow-hidden">
                    <table className="w-full text-left text-sm">
                        <thead className="bg-slate-50 border-b">
                        <tr>
                            <th className="p-4 font-semibold">APC명</th>
                            <th className="p-4 font-semibold">위치</th>
                            <th className="p-4 font-semibold">최근 사용일</th>
                            <th className="p-4 font-semibold">주력 품목</th>
                            <th className="p-4 font-semibold">병해충</th>
                            <th className="p-4 font-semibold">입고</th>
                            <th className="p-4 font-semibold">선별</th>
                            <th className="p-4 font-semibold">포장</th>
                        </tr>
                        </thead>
                        <tbody>
                        {/* apcList prop 사용 */}
                        {apcList.map(apc => <APCListItem key={apc.id} apc={apc} />)}
                        </tbody>
                    </table>
                </div>
            )}
        </div>
    );
};

// --- (KPIView는 이전과 동일, 자체 데이터를 가져오거나 props를 받는다고 가정) ---
const KPIView = () => (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <DonutChart value={76} label="전체 APC 가동률" />
        <LineChart />
        <BarChart />

        <div className="p-4 bg-white rounded-xl shadow-md md:col-span-2 lg:col-span-1">
            <h3 className="text-lg font-semibold text-slate-700 mb-4">출하량 순 APC 리스트</h3>
            <ul className="space-y-3">
                {[
                    {name: '상주 첨단 APC', value: '1,204톤'},
                    {name: '평창 고랭지 APC', value: '1,150톤'},
                    {name: '나주 스마트 APC', value: '980톤'},
                    {name: '김해 신선 APC', value: '950톤'},
                    {name: '제주 감귤 APC', value: '810톤'},
                ].map((item, index) => (
                    <li key={item.name} className="flex justify-between items-center text-sm p-2 rounded-md hover:bg-blue-50">
                        <span className="font-semibold text-slate-800"><span className="text-slate-500 mr-2">{index + 1}.</span>{item.name}</span>
                        <span className="font-bold text-blue-600">{item.value}</span>
                    </li>
                ))}
            </ul>
        </div>

        <div className="p-4 bg-white rounded-xl shadow-md">
            <h3 className="text-lg font-semibold text-slate-700 mb-4">지역별 APC 비율</h3>
            <div className="space-y-3">
                {[
                    {label: '경상권', value: 45, color: 'bg-blue-500'},
                    {label: '전라권', value: 25, color: 'bg-sky-500'},
                    {label: '충청권', value: 15, color: 'bg-teal-500'},
                    {label: '강원/수도권', value: 10, color: 'bg-indigo-500'},
                    {label: '제주', value: 5, color: 'bg-violet-500'},
                ].map(item => (
                    <div key={item.label} className="text-sm">
                        <div className="flex justify-between mb-1">
                            <span className="font-semibold text-slate-600">{item.label}</span>
                            <span className="font-semibold text-slate-600">{item.value}%</span>
                        </div>
                        <div className="w-full bg-gray-200 rounded-full h-2">
                            <div className={`${item.color} h-2 rounded-full`} style={{width: `${item.value}%`}}></div>
                        </div>
                    </div>
                ))}
            </div>
        </div>
    </div>
);


// --- 메인 App 컴포넌트 ---
export default function ApcList() {
    const [activeTab, setActiveTab] = useState('apcList');
    const [apcList, setApcList] = useState([]); // APC 목록 상태
    const [loading, setLoading] = useState(true); // 로딩 상태
    const [error, setError] = useState(null); // 에러 메시지 상태

    // --- API 호출 시뮬레이션 ---
    const fetchApcData = async () => {
        setLoading(true);
        setError(null);
        console.log("APC 데이터를 가져오는 중...");
        try {
            // 네트워크 지연 시뮬레이션
            await new Promise(resolve => setTimeout(resolve, 1500));

            // 실제 앱에서는 아래 코드로 대체:
            // const response = await fetch('/api/apcs'); // 백엔드 엔드포인트
            // if (!response.ok) throw new Error('네트워크 응답이 올바르지 않습니다');
            // let data = await response.json();

            // 백엔드에서 받은 데이터 시뮬레이션 (이전 더미 데이터 사용)
            let data = [ /* 원본 apcData 배열을 여기에 복사 */
                { id: 1, name: '나주 스마트 APC', location: '전라남도 나주시', pestAlert: '주의', lastUsed: '2025-10-20', mainItem: '배', performance: { receiving: 85, sorting: 92, packing: 88, }, weather: 'loading'}, // 날씨 초기 상태: 로딩중
                { id: 2, name: '상주 첨단 APC', location: '경상북도 상주시', pestAlert: '경보', lastUsed: '2025-10-19', mainItem: '사과', performance: { receiving: 95, sorting: 88, packing: 91, }, weather: 'loading'},
                { id: 3, name: '제주 감귤 APC', location: '제주특별자치도 서귀포시', pestAlert: '양호', lastUsed: '2025-10-20', mainItem: '감귤', performance: { receiving: 78, sorting: 85, packing: 80, }, weather: 'loading'},
                { id: 4, name: '평창 고랭지 APC', location: '강원도 평창군', pestAlert: '양호', lastUsed: '2025-10-18', mainItem: '배추', performance: { receiving: 91, sorting: 95, packing: 93, }, weather: 'loading'},
                { id: 5, name: '김해 신선 APC', location: '경상남도 김해시', pestAlert: '주의', lastUsed: '2025-10-19', mainItem: '토마토', performance: { receiving: 88, sorting: 89, packing: 90, }, weather: 'loading'},
                { id: 6, name: '안동 농산물 APC', location: '경상북도 안동시', pestAlert: '양호', lastUsed: '2025-10-17', mainItem: '고추', performance: { receiving: 82, sorting: 81, packing: 85, }, weather: 'loading'},
            ];

            // --- 성수기 정보 처리 ---
            const today = new Date();
            const processedData = data.map(apc => ({
                ...apc,
                isPeakSeason: checkPeakSeason(apc.mainItem, today),
                // 날씨는 별도로 가져옴
            }));

            setApcList(processedData);
            console.log("APC 데이터 로딩 및 처리 완료:", processedData);

        } catch (err) {
            console.error("APC 데이터 로딩 실패:", err);
            setError(err.message);
        } finally {
            setLoading(false);
        }
    };

    // --- 날씨 정보 가져오기 시뮬레이션 ---
    const fetchWeatherData = async (currentApcList) => {
        if (!currentApcList || currentApcList.length === 0) return;

        console.log("지역별 날씨 데이터를 가져오는 중...");
        // 실제 앱에서는 적절한 날씨 API 사용 및 API 키 보안 처리 필요
        // 예: 백엔드 '/api/weather?locations=Location1,Location2,...' 호출

        // 각 지역별 날씨를 지연 시간과 함께 가져오는 시뮬레이션
        const weatherPromises = currentApcList.map(async (apc) => {
            await new Promise(resolve => setTimeout(resolve, 500 + Math.random() * 1000)); // 무작위 지연
            // 지역명 기반의 간단한 날씨 시뮬레이션
            let weather = '흐림 🌥️';
            if (apc.location.includes('나주') || apc.location.includes('김해')) weather = '맑음 ☀️';
            else if (apc.location.includes('평창')) weather = '비 🌧️';
            else if (apc.location.includes('상주')) weather = '구름 많음 ☁️';
            return { id: apc.id, weather };
        });

        try {
            const weatherResults = await Promise.all(weatherPromises);
            console.log("날씨 데이터 로딩 완료:", weatherResults);

            // 가져온 날씨 정보로 apcList 상태 업데이트
            setApcList(prevList => {
                const weatherMap = new Map(weatherResults.map(item => [item.id, item.weather]));
                return prevList.map(apc => ({
                    ...apc,
                    weather: weatherMap.get(apc.id) || '정보 없음', // 날씨 업데이트 또는 기본값 설정
                }));
            });
            console.log("날씨 정보로 APC 목록 업데이트 완료.");

        } catch (err) {
            console.error("날씨 데이터 로딩 실패:", err);
            // 선택사항: 에러 상태를 설정하거나 날씨 상태를 '오류'로 업데이트
            setApcList(prevList => prevList.map(apc => ({ ...apc, weather: '오류' })));
        }
    };

    // 컴포넌트 마운트 시 APC 데이터 가져오기
    useEffect(() => {
        fetchApcData();
    }, []); // 빈 의존성 배열은 마운트 시 한 번만 실행됨

    // APC 목록이 로드된 후 날씨 데이터 가져오기
    useEffect(() => {
        // apcList가 채워졌고, 아직 날씨를 가져오지 않은 경우에만 실행
        if (apcList.length > 0 && apcList.some(apc => apc.weather === 'loading')) {
            fetchWeatherData(apcList);
        }
    }, [apcList]); // apcList가 변경될 때마다 이 효과 실행


    return (
        <div className="bg-slate-50 min-h-screen font-sans p-4 sm:p-6 lg:p-8">
            <div className="max-w-screen-xl mx-auto">
                {/* 헤더 */}
                <header className="mb-8">
                    <h1 className="text-3xl font-bold text-slate-800">📘 APC 정보지원시스템</h1>
                    <p className="text-slate-500 mt-1">전국 농수산물 유통 현황을 한눈에 파악하세요.</p>
                </header>

                {/* 탭 네비게이션 */}
                <div className="mb-6 border-b border-gray-200">
                    <nav className="flex space-x-4 -mb-px">
                        <button
                            onClick={() => setActiveTab('apcList')}
                            className={`py-3 px-1 text-base font-semibold transition-colors duration-200 ${activeTab === 'apcList' ? 'border-b-2 border-blue-500 text-blue-600' : 'text-gray-500 hover:text-blue-600'}`}
                        >
                            APC 목록
                        </button>
                        <button
                            onClick={() => setActiveTab('kpi')}
                            className={`py-3 px-1 text-base font-semibold transition-colors duration-200 ${activeTab === 'kpi' ? 'border-b-2 border-blue-500 text-blue-600' : 'text-gray-500 hover:text-blue-600'}`}
                        >
                            KPI 통계
                        </button>
                    </nav>
                </div>

                {/* 탭 컨텐츠 */}
                <main>
                    {/* 가져온 데이터, 로딩, 에러 상태를 APCListView로 전달 */}
                    {activeTab === 'apcList' ? (
                        <APCListView apcList={apcList} loading={loading} error={error} />
                    ) : (
                        <KPIView /> /* KPIView가 자체 데이터를 가져오거나 props를 받는다고 가정 */
                    )}
                </main>
            </div>
        </div>
    );
}