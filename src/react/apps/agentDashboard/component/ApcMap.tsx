import React, { useState, useEffect, useMemo } from 'react';
// react-leaflet 및 leaflet import 유지
import { MapContainer, TileLayer, GeoJSON, Marker, Popup } from 'react-leaflet';
import L from 'leaflet';
// CSS import 유지
import 'leaflet/dist/leaflet.css';

// --- Leaflet 아이콘 설정 ---
// 이미지 파일을 직접 import하는 대신, Leaflet CSS가 기본 아이콘 경로를
// 참조하도록 하여 아이콘 문제가 발생하지 않도록 합니다.
// 관련 import 구문 제거
// import iconRetinaUrl from 'leaflet/dist/images/marker-icon-2x.png';
// import iconUrl from 'leaflet/dist/images/marker-icon.png';
// import shadowUrl from 'leaflet/dist/images/marker-shadow.png';

// 아이콘 경로를 수동으로 재설정하는 코드 제거
// delete L.Icon.Default.prototype._getIconUrl;
// L.Icon.Default.mergeOptions({
//     iconRetinaUrl: iconRetinaUrl, // 변수가 제거되었으므로 에러 발생
//     iconUrl: iconUrl,           // 변수가 제거되었으므로 에러 발생
//     shadowUrl: shadowUrl,         // 변수가 제거되었으므로 에러 발생
// });
// --- 아이콘 설정 끝 ---


// --- 가상 데이터 로딩 및 처리 ---
const dummyCsvData = `record_date,apc_name,item_name,receiving_kg,sorting_kg,shipping_kg,location,lat,lng
2025-10-01,신미네유통,상추,3677,3387,3136,전라남도 나주시,35.011,126.711
2025-10-01,해도지영농,브로콜리,2982,2692,2035,경상북도 상주시,36.417,128.167
2025-09-15,신미네유통,상추,4100,3800,3500,전라남도 나주시,35.011,126.711
2025-09-15,상주원예영농,딸기,1500,1350,1200,경상북도 상주시,36.417,128.167
2025-08-20,거산 여주,브로콜리,2000,1800,1700,경기도 여주시,37.294,127.636
2025-08-20,영흥농산,배추,3500,3300,3000,강원도 평창군,37.370,128.391
2025-10-28,신미네유통,상추,3800,3500,3200,전라남도 나주시,35.011,126.711
2025-10-28,해도지영농,브로콜리,3100,2800,2500,경상북도 상주시,36.417,128.167
2025-10-28,제주낭,감귤,5500,5200,4800,제주특별자치도 서귀포시,33.254,126.564
`;

const parseCSVWithLocation = (csvText) => {
    // ... (이전과 동일) ...
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
            } else if (['lat', 'lng'].includes(header)) {
                entry[header] = parseFloat(value) || null;
            } else {
                entry[header] = value;
            }
        });
        entry.dateObj = new Date(entry.record_date);
        entry.province = entry.location?.split(' ')[0] || '기타';
        return entry;
    });
};

// --- 대한민국 시도 GeoJSON (간단한 임시 데이터) ---
// 실제 앱에서는 파일 로드 또는 API 호출로 가져와야 합니다.
const southKoreaGeoJson = {
    type: "FeatureCollection",
    features: [
        // 임시 데이터, 실제 GeoJSON 데이터 필요
        { type: "Feature", properties: { name: "서울특별시" }, geometry: { type: "Polygon", coordinates: [[[126.7, 37.4], [127.1, 37.4], [127.1, 37.7], [126.7, 37.7], [126.7, 37.4]]] } },
        { type: "Feature", properties: { name: "경기도" }, geometry: { type: "Polygon", coordinates: [[[126.5, 37.0], [127.5, 37.0], [127.5, 38.0], [126.5, 38.0], [126.5, 37.0]]] } },
        { type: "Feature", properties: { name: "전라남도" }, geometry: { type: "Polygon", coordinates: [[[126.0, 34.5], [127.0, 34.5], [127.0, 35.5], [126.0, 35.5], [126.0, 34.5]]] } },
        // ... 다른 시도 임시 데이터 ...
    ]
};


// --- 유틸리티 함수 ---
const formatNumber = (num) => num ? num.toLocaleString('ko-KR') : '0';
const getColorByValue = (value, max) => {
    // ... (이전과 동일) ...
    if (!value || max === 0) return '#edf2f7';
    const ratio = value / max;
    if (ratio > 0.8) return '#3182ce'; if (ratio > 0.6) return '#4299e1'; if (ratio > 0.4) return '#63b3ed'; if (ratio > 0.2) return '#90cdf4'; return '#bee3f8';
};

// --- 메인 컴포넌트 ---
const ApcMap = () => {
    const [apcData, setApcData] = useState([]);
    const [loading, setLoading] = useState(true);

    // 1. 데이터 로딩 (컴포넌트 마운트 시)
    useEffect(() => {
        // 실제 구현: fetch('/api/alldata')...
        setTimeout(() => {
            const parsed = parseCSVWithLocation(dummyCsvData);
            setApcData(parsed);
            setLoading(false);
        }, 500);
    }, []); // 마운트 시 한 번만 실행

    // 2. 지역별 실적 집계 (useMemo, 이전과 동일)
    const regionalData = useMemo(() => {
        // ... (이전과 동일) ...
        if (loading || apcData.length === 0) return { byProvince: {}, maxReceiving: 0, markers: [] };
        const byProvince = apcData.reduce((acc, d) => {
            if (!acc[d.province]) {
                acc[d.province] = { name: d.province, totalReceiving: 0, count: 0 };
            }
            acc[d.province].totalReceiving += d.receiving_kg;
            acc[d.province].count += 1;
            return acc;
        }, {});
        const maxReceiving = Math.max(0, ...Object.values(byProvince).map(p => p.totalReceiving)); // 0 이상 보장
        const markers = apcData
            .filter(d => d.lat && d.lng)
            .filter((d, index, self) => index === self.findIndex(t => t.apc_name === d.apc_name))
            .map(d => ({
                position: [d.lat, d.lng],
                popupContent: `${d.apc_name} (${d.location})`
            }));
        return { byProvince, maxReceiving, markers };
    }, [apcData, loading]);

    // 3. GeoJSON 스타일 함수 (이전과 동일)
    const geoJsonStyle = (feature) => {
        const provinceName = feature.properties.name;
        const data = regionalData.byProvince[provinceName];
        const value = data ? data.totalReceiving : 0;
        const color = getColorByValue(value, regionalData.maxReceiving);
        return {
            fillColor: color,
            weight: 1,
            opacity: 1,
            color: 'white',
            dashArray: '3',
            fillOpacity: 0.7
        };
    };

    // 4. 마우스 오버 효과 함수 (이전과 동일)
    const highlightFeature = (e) => {
        const layer = e.target;
        layer.setStyle({ weight: 2, color: '#666', dashArray: '', fillOpacity: 0.9 });
        layer.bringToFront();
    };
    const resetHighlight = (e) => {
        e.target.setStyle(geoJsonStyle(e.target.feature));
    };

    // 5. 각 지역 이벤트 함수 (이전과 동일)
    const onEachFeature = (feature, layer) => {
        layer.on({
            mouseover: highlightFeature,
            mouseout: resetHighlight,
            click: (e) => {
                const provinceName = feature.properties.name;
                const data = regionalData.byProvince[provinceName];
                const popupContent = `
                    <strong>${provinceName}</strong><br/>
                    총 입고량: ${formatNumber(data?.totalReceiving || 0)} kg<br/>
                    APC 개수: ${data?.count || 0} 개소
                 `;
                L.popup()
                    .setLatLng(e.latlng)
                    .setContent(popupContent)
                    .openOn(e.target._map);
            }
        });
        const provinceName = feature.properties.name;
        layer.bindTooltip(provinceName, { sticky: true });
    };


    // 로딩 처리
    if (loading) { // 데이터 로딩 중
        return <div className="p-6 text-center">지역별 분석 데이터를 불러오는 중입니다...</div>;
    }

    // 지도 초기 위치 및 줌 레벨
    const mapPosition = [36.0, 127.5];
    const mapZoom = 7;

    return (
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 font-pretendard">
            {/* 지도 영역 */}
            <div className="lg:col-span-2 bg-white p-4 rounded-xl shadow h-[600px]">
                <h3 className="text-lg font-semibold text-gray-700 mb-4">지역별 총 입고량 분포</h3>
                {/* MapContainer는 항상 렌더링 */}
                <MapContainer center={mapPosition} zoom={mapZoom} style={{ height: 'calc(100% - 60px)', width: '100%', borderRadius: '8px' }}>
                    <TileLayer
                        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                    />
                    {/* GeoJSON 데이터가 있을 때만 렌더링 */}
                    {southKoreaGeoJson && southKoreaGeoJson.features && (
                        <GeoJSON
                            key={JSON.stringify(regionalData.byProvince)} // 데이터 변경 시 GeoJSON 다시 렌더링
                            data={southKoreaGeoJson}
                            style={geoJsonStyle}
                            onEachFeature={onEachFeature}
                        />
                    )}
                    {regionalData.markers.map((marker, index) => (
                        <Marker key={index} position={marker.position}>
                            <Popup>{marker.popupContent}</Popup>
                        </Marker>
                    ))}
                </MapContainer>
                {/* 범례 */}
                <div className="mt-2 flex items-center justify-end space-x-2 text-xs">
                    <span className="font-semibold">입고량(kg):</span>
                    <span className="w-4 h-4 inline-block bg-[#bee3f8]"></span><span>낮음</span> {/* Tailwind 클래스 직접 적용 */}
                    <span className="w-4 h-4 inline-block bg-[#63b3ed]"></span>
                    <span className="w-4 h-4 inline-block bg-[#3182ce]"></span><span>높음</span>
                </div>
            </div>

            {/* 지역별 실적 표 (이전과 동일) */}
            <div className="bg-white p-6 rounded-xl shadow h-[600px] overflow-y-auto">
                <h3 className="text-lg font-semibold text-gray-700 mb-4">지역별 실적 요약</h3>
                <table className="w-full text-sm text-left">
                    <thead className="bg-gray-50 sticky top-0">
                    <tr>
                        <th className="p-3 font-semibold">지역</th>
                        <th className="p-3 font-semibold text-right">총 입고량 (kg)</th>
                        <th className="p-3 font-semibold text-right">APC 수</th>
                    </tr>
                    </thead>
                    <tbody>
                    {Object.values(regionalData.byProvince)
                        .sort((a, b) => b.totalReceiving - a.totalReceiving)
                        .map(data => (
                            <tr key={data.name} className="border-b hover:bg-gray-50">
                                <td className="p-3 font-medium text-gray-800">{data.name}</td>
                                <td className="p-3 text-gray-600 text-right">{formatNumber(data.totalReceiving)}</td>
                                <td className="p-3 text-gray-600 text-right">{data.count}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

// **중요:** 이 컴포넌트를 사용하기 전에 프로젝트에 라이브러리를 설치해야 합니다:
// npm install leaflet react-leaflet
// npm install -D @types/leaflet  (TypeScript 사용 시)

export default ApcMap;

