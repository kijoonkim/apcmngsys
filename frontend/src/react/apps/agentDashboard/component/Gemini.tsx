import React, { useState } from 'react';

// --- Mock Data (실제로는 API를 통해 받아올 데이터) ---

const apcData = [
  {
    id: 1,
    name: '나주 스마트 APC',
    location: '전라남도 나주시',
    weather: '맑음',
    pestAlert: '주의',
    lastUsed: '2025-10-20',
    mainItem: '배',
    isPeakSeason: true,
    performance: {
      receiving: 85,
      sorting: 92,
      packing: 88,
    },
  },
  {
    id: 2,
    name: '상주 첨단 APC',
    location: '경상북도 상주시',
    weather: '구름 많음',
    pestAlert: '경보',
    lastUsed: '2025-10-19',
    mainItem: '사과',
    isPeakSeason: true,
    performance: {
      receiving: 95,
      sorting: 88,
      packing: 91,
    },
  },
  {
    id: 3,
    name: '제주 감귤 APC',
    location: '제주특별자치도 서귀포시',
    weather: '흐림',
    pestAlert: '양호',
    lastUsed: '2025-10-20',
    mainItem: '감귤',
    isPeakSeason: false,
    performance: {
      receiving: 78,
      sorting: 85,
      packing: 80,
    },
  },
  {
    id: 4,
    name: '평창 고랭지 APC',
    location: '강원도 평창군',
    weather: '비',
    pestAlert: '양호',
    lastUsed: '2025-10-18',
    mainItem: '배추',
    isPeakSeason: true,
    performance: {
      receiving: 91,
      sorting: 95,
      packing: 93,
    },
  },
  {
    id: 5,
    name: '김해 신선 APC',
    location: '경상남도 김해시',
    weather: '맑음',
    pestAlert: '주의',
    lastUsed: '2025-10-19',
    mainItem: '토마토',
    isPeakSeason: false,
    performance: {
      receiving: 88,
      sorting: 89,
      packing: 90,
    },
  },
  {
    id: 6,
    name: '안동 농산물 APC',
    location: '경상북도 안동시',
    weather: '구름 많음',
    pestAlert: '양호',
    lastUsed: '2025-10-17',
    mainItem: '고추',
    isPeakSeason: false,
    performance: {
      receiving: 82,
      sorting: 81,
      packing: 85,
    },
  },
];

// --- Icon Components (SVG) ---

const SunIcon = () => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width="24"
    height="24"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    strokeWidth="2"
    strokeLinecap="round"
    strokeLinejoin="round"
    className="text-yellow-500"
  >
    <circle cx="12" cy="12" r="4"></circle>
    <path d="M12 2v2"></path>
    <path d="M12 20v2"></path>
    <path d="m4.93 4.93 1.41 1.41"></path>
    <path d="m17.66 17.66 1.41 1.41"></path>
    <path d="M2 12h2"></path>
    <path d="M20 12h2"></path>
    <path d="m6.34 17.66-1.41 1.41"></path>
    <path d="m19.07 4.93-1.41 1.41"></path>
  </svg>
);

const CloudIcon = () => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width="24"
    height="24"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    strokeWidth="2"
    strokeLinecap="round"
    strokeLinejoin="round"
    className="text-gray-500"
  >
    <path d="M17.5 19H9a7 7 0 1 1 6.71-9h1.79a4.5 4.5 0 1 1 0 9Z"></path>
  </svg>
);

const CloudDrizzleIcon = () => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width="24"
    height="24"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    strokeWidth="2"
    strokeLinecap="round"
    strokeLinejoin="round"
    className="text-blue-400"
  >
    <path d="M4 14.899A7 7 0 1 1 15.71 8h1.79a4.5 4.5 0 0 1 2.5 8.242"></path>
    <path d="M8 19v1"></path>
    <path d="M8 14v1"></path>
    <path d="M16 19v1"></path>
    <path d="M16 14v1"></path>
    <path d="M12 21v1"></path>
    <path d="M12 16v1"></path>
  </svg>
);

const BugIcon = ({ alertLevel }) => {
  const color =
    alertLevel === '경보'
      ? 'text-red-500'
      : alertLevel === '주의'
        ? 'text-yellow-500'
        : 'text-green-500';
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
      className={color}
    >
      <path d="M14 12a2 2 0 1 0-4 0"></path>
      <path d="M6.2 13.8a2.5 2.5 0 0 0 4.3 2.5"></path>
      <path d="M13.5 16.3a2.5 2.5 0 0 0 4.3-2.5"></path>
      <path d="M18 12h.01"></path>
      <path d="M6 12h.01"></path>
      <path d="M12 18v.01"></path>
      <path d="M12 6V6"></path>
      <path d="M7.5 18.5a4 4 0 1 0-5-5"></path>
      <path d="M16.5 3.5a4 4 0 1 0 5 5"></path>
    </svg>
  );
};

const CalendarIcon = () => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width="24"
    height="24"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    strokeWidth="2"
    strokeLinecap="round"
    strokeLinejoin="round"
    className="text-gray-500"
  >
    <path d="M8 2v4"></path>
    <path d="M16 2v4"></path>
    <rect width="18" height="18" x="3" y="4" rx="2"></rect>
    <path d="M3 10h18"></path>
  </svg>
);

const LeafIcon = () => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width="24"
    height="24"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    strokeWidth="2"
    strokeLinecap="round"
    strokeLinejoin="round"
    className="text-green-600"
  >
    <path d="M11 20A7 7 0 0 1 4 13V8a5 5 0 0 1 10 0v5a7 7 0 0 1-7 7m0 0v-5"></path>
  </svg>
);

const BoxIcon = () => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width="24"
    height="24"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    strokeWidth="2"
    strokeLinecap="round"
    strokeLinejoin="round"
    className="text-blue-500"
  >
    <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path>
    <path d="m3.29 7 8.71 5 8.71-5"></path>
    <path d="M12 22V12"></path>
  </svg>
);

const ListIcon = () => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width="20"
    height="20"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    strokeWidth="2"
    strokeLinecap="round"
    strokeLinejoin="round"
  >
    <line x1="8" x2="21" y1="6" y2="6"></line>
    <line x1="8" x2="21" y1="12" y2="12"></line>
    <line x1="8" x2="21" y1="18" y2="18"></line>
    <line x1="3" x2="3.01" y1="6" y2="6"></line>
    <line x1="3" x2="3.01" y1="12" y2="12"></line>
    <line x1="3" x2="3.01" y1="18" y2="18"></line>
  </svg>
);

const GridIcon = () => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width="20"
    height="20"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    strokeWidth="2"
    strokeLinecap="round"
    strokeLinejoin="round"
  >
    <rect width="7" height="7" x="3" y="3" rx="1"></rect>
    <rect width="7" height="7" x="14" y="3" rx="1"></rect>
    <rect width="7" height="7" x="14" y="14" rx="1"></rect>
    <rect width="7" height="7" x="3" y="14" rx="1"></rect>
  </svg>
);

// --- Chart Components (SVG-based Replicas) ---

const DonutChart = ({ value, label, colorClass = 'text-blue-500' }) => {
  const radius = 50;
  const circumference = 2 * Math.PI * radius;
  const offset = circumference - (value / 100) * circumference;

  return (
    <div className="flex flex-col items-center justify-center p-4 bg-white rounded-xl shadow-md h-full">
      <div className="relative w-32 h-32">
        <svg className="w-full h-full" viewBox="0 0 120 120">
          <circle
            className="text-gray-200"
            strokeWidth="12"
            stroke="currentColor"
            fill="transparent"
            r={radius}
            cx="60"
            cy="60"
          />
          <circle
            className={colorClass}
            strokeWidth="12"
            strokeDasharray={circumference}
            strokeDashoffset={offset}
            strokeLinecap="round"
            stroke="currentColor"
            fill="transparent"
            r={radius}
            cx="60"
            cy="60"
            transform="rotate(-90 60 60)"
          />
        </svg>
        <div className="absolute inset-0 flex flex-col items-center justify-center">
          <span className="text-2xl font-bold text-slate-800">{value}%</span>
        </div>
      </div>
      <p className="mt-3 text-lg font-semibold text-slate-700">{label}</p>
    </div>
  );
};

const LineChart = () => (
  <div className="p-4 bg-white rounded-xl shadow-md col-span-1 lg:col-span-2 h-full">
    <h3 className="text-lg font-semibold text-slate-700 mb-4">월별 데이터 수집량</h3>
    <div className="w-full h-64">
      <svg width="100%" height="100%" viewBox="0 0 500 200" preserveAspectRatio="none">
        {/* Grid lines */}
        {[1, 2, 3, 4].map((i) => (
          <line key={i} x1="30" y1={i * 40} x2="490" y2={i * 40} stroke="#e5e7eb" strokeWidth="1" />
        ))}
        <line x1="30" y1="0" x2="30" y2="160" stroke="#d1d5db" strokeWidth="1" />
        <line x1="30" y1="160" x2="490" y2="160" stroke="#d1d5db" strokeWidth="1" />

        {/* Line */}
        <polyline
          fill="none"
          stroke="#3b82f6"
          strokeWidth="2"
          points="50,130 120,90 190,110 260,60 330,80 400,50 470,70"
        />
        {/* Points */}
        {[
          [50, 130],
          [120, 90],
          [190, 110],
          [260, 60],
          [330, 80],
          [400, 50],
          [470, 70],
        ].map(([x, y], i) => (
          <circle key={i} cx={x} cy={y} r="3" fill="#3b82f6" />
        ))}

        {/* Labels */}
        {['4월', '5월', '6월', '7월', '8월', '9월', '10월'].map((month, i) => (
          <text
            key={month}
            x={50 + i * 70}
            y="180"
            fontSize="12"
            fill="#6b7280"
            textAnchor="middle"
          >
            {month}
          </text>
        ))}
        <text x="15" y="45" fontSize="12" fill="#6b7280" textAnchor="end">
          10k
        </text>
        <text x="15" y="85" fontSize="12" fill="#6b7280" textAnchor="end">
          5k
        </text>
        <text x="15" y="125" fontSize="12" fill="#6b7280" textAnchor="end">
          1k
        </text>
      </svg>
    </div>
  </div>
);

const BarChart = () => (
  <div className="p-4 bg-white rounded-xl shadow-md h-full">
    <h3 className="text-lg font-semibold text-slate-700 mb-4">품목별 입고량 (톤)</h3>
    <div className="space-y-3">
      {[
        { label: '배', value: 85, color: 'bg-blue-400' },
        { label: '사과', value: 95, color: 'bg-blue-400' },
        { label: '감귤', value: 78, color: 'bg-blue-400' },
        { label: '배추', value: 91, color: 'bg-blue-400' },
        { label: '토마토', value: 88, color: 'bg-blue-400' },
      ].map((item) => (
        <div key={item.label} className="flex items-center">
          <span className="w-16 text-sm text-slate-600">{item.label}</span>
          <div className="flex-1 bg-gray-200 rounded-full h-4">
            <div
              className={`${item.color} h-4 rounded-full`}
              style={{ width: `${item.value}%` }}
            ></div>
          </div>
          <span className="w-10 text-right text-sm font-medium text-slate-700">{item.value}</span>
        </div>
      ))}
    </div>
  </div>
);

// --- Main Components ---

const APCCard = ({ apc }) => {
  const getWeatherIcon = (weather) => {
    if (weather.includes('맑음')) return <SunIcon />;
    if (weather.includes('비')) return <CloudDrizzleIcon />;
    return <CloudIcon />;
  };

  const pestAlertColor =
    apc.pestAlert === '경보'
      ? 'bg-red-100 text-red-800'
      : apc.pestAlert === '주의'
        ? 'bg-yellow-100 text-yellow-800'
        : 'bg-green-100 text-green-800';
  const peakSeasonColor = apc.isPeakSeason
    ? 'bg-emerald-100 text-emerald-800'
    : 'bg-slate-100 text-slate-800';

  return (
    <div className="bg-white rounded-xl shadow-md p-5 border border-gray-100 hover:shadow-lg hover:border-blue-300 transition-all duration-300">
      {/* 카드 헤더 */}
      <div className="flex justify-between items-start mb-4">
        <div>
          <h3 className="font-bold text-xl text-slate-800">{apc.name}</h3>
          <p className="text-sm text-slate-500">{apc.location}</p>
        </div>
        <div className="flex items-center space-x-2">
          {getWeatherIcon(apc.weather)}
          <div
            className={`text-xs font-bold px-2 py-1 rounded-full ${pestAlertColor} flex items-center`}
          >
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
        <h4 className="font-semibold text-slate-700 mb-2 flex items-center">
          <BoxIcon />
          <span className="ml-2">실적 현황</span>
        </h4>
        <div className="space-y-2 text-sm">
          {Object.entries(apc.performance).map(([key, value]) => (
            <div key={key} className="flex items-center">
              <span className="w-16 text-slate-600 capitalize">
                {key === 'receiving' ? '입고' : key === 'sorting' ? '선별' : '포장'}
              </span>
              <div className="w-full bg-gray-200 rounded-full h-2.5">
                <div
                  className="bg-blue-500 h-2.5 rounded-full"
                  style={{ width: `${value}%` }}
                ></div>
              </div>
              <span className="ml-3 font-medium text-slate-700">{value}%</span>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

const APCListItem = ({ apc }) => (
  <tr className="border-b hover:bg-blue-50 transition-colors">
    <td className="p-4 font-semibold text-slate-800">{apc.name}</td>
    <td className="p-4 text-slate-600">{apc.location}</td>
    <td className="p-4 text-slate-600">{apc.lastUsed}</td>
    <td className="p-4 text-slate-600">{apc.mainItem}</td>
    <td className="p-4">
      <span
        className={`px-2 py-1 text-xs font-semibold rounded-full ${apc.pestAlert === '경보' ? 'bg-red-100 text-red-800' : apc.pestAlert === '주의' ? 'bg-yellow-100 text-yellow-800' : 'bg-green-100 text-green-800'}`}
      >
        {apc.pestAlert}
      </span>
    </td>
    <td className="p-4 text-slate-600">{apc.performance.receiving}%</td>
    <td className="p-4 text-slate-600">{apc.performance.sorting}%</td>
    <td className="p-4 text-slate-600">{apc.performance.packing}%</td>
  </tr>
);

const APCListView = () => {
  const [viewType, setViewType] = useState('card'); // 'card' or 'list'

  return (
    <div>
      <div className="flex justify-end mb-4">
        <div className="flex items-center bg-slate-200 rounded-lg p-1">
          <button
            onClick={() => setViewType('card')}
            className={`px-3 py-1 rounded-md text-sm font-semibold ${viewType === 'card' ? 'bg-white shadow' : 'text-slate-600'}`}
          >
            <GridIcon />
          </button>
          <button
            onClick={() => setViewType('list')}
            className={`px-3 py-1 rounded-md text-sm font-semibold ${viewType === 'list' ? 'bg-white shadow' : 'text-slate-600'}`}
          >
            <ListIcon />
          </button>
        </div>
      </div>

      {viewType === 'card' ? (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {apcData.map((apc) => (
            <APCCard key={apc.id} apc={apc} />
          ))}
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
              {apcData.map((apc) => (
                <APCListItem key={apc.id} apc={apc} />
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
};

const KPIView = () => (
  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <DonutChart value={76} label="전체 APC 가동률" />
    <LineChart />
    <BarChart />

    <div className="p-4 bg-white rounded-xl shadow-md md:col-span-2 lg:col-span-1">
      <h3 className="text-lg font-semibold text-slate-700 mb-4">출하량 순 APC 리스트</h3>
      <ul className="space-y-3">
        {[
          { name: '상주 첨단 APC', value: '1,204톤' },
          { name: '평창 고랭지 APC', value: '1,150톤' },
          { name: '나주 스마트 APC', value: '980톤' },
          { name: '김해 신선 APC', value: '950톤' },
          { name: '제주 감귤 APC', value: '810톤' },
        ].map((item, index) => (
          <li
            key={item.name}
            className="flex justify-between items-center text-sm p-2 rounded-md hover:bg-blue-50"
          >
            <span className="font-semibold text-slate-800">
              <span className="text-slate-500 mr-2">{index + 1}.</span>
              {item.name}
            </span>
            <span className="font-bold text-blue-600">{item.value}</span>
          </li>
        ))}
      </ul>
    </div>

    <div className="p-4 bg-white rounded-xl shadow-md">
      <h3 className="text-lg font-semibold text-slate-700 mb-4">지역별 APC 비율</h3>
      <div className="space-y-3">
        {[
          { label: '경상권', value: 45, color: 'bg-blue-500' },
          { label: '전라권', value: 25, color: 'bg-sky-500' },
          { label: '충청권', value: 15, color: 'bg-teal-500' },
          { label: '강원/수도권', value: 10, color: 'bg-indigo-500' },
          { label: '제주', value: 5, color: 'bg-violet-500' },
        ].map((item) => (
          <div key={item.label} className="text-sm">
            <div className="flex justify-between mb-1">
              <span className="font-semibold text-slate-600">{item.label}</span>
              <span className="font-semibold text-slate-600">{item.value}%</span>
            </div>
            <div className="w-full bg-gray-200 rounded-full h-2">
              <div
                className={`${item.color} h-2 rounded-full`}
                style={{ width: `${item.value}%` }}
              ></div>
            </div>
          </div>
        ))}
      </div>
    </div>
  </div>
);

export default function Gemini() {
  const [activeTab, setActiveTab] = useState('apcList');

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
              className={`py-3 px-1 text-base font-semibold transition-colors duration-200 ${
                activeTab === 'apcList'
                  ? 'border-b-2 border-blue-500 text-blue-600'
                  : 'text-gray-500 hover:text-blue-600'
              }`}
            >
              APC 목록
            </button>
            <button
              onClick={() => setActiveTab('kpi')}
              className={`py-3 px-1 text-base font-semibold transition-colors duration-200 ${
                activeTab === 'kpi'
                  ? 'border-b-2 border-blue-500 text-blue-600'
                  : 'text-gray-500 hover:text-blue-600'
              }`}
            >
              KPI 통계
            </button>
          </nav>
        </div>

        {/* 탭 컨텐츠 */}
        <main>{activeTab === 'apcList' ? <APCListView /> : <KPIView />}</main>
      </div>
    </div>
  );
}
