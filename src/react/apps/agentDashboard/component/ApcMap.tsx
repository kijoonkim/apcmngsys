import React, { useState, useEffect, useMemo } from 'react';
// react-leaflet 및 leaflet import 유지
import { MapContainer, TileLayer, GeoJSON, Marker, Popup } from 'react-leaflet';
import L from 'leaflet';
// CSS import 유지
import 'leaflet/dist/leaflet.css';

// --- Leaflet 아이콘 설정 ---
// Leaflet CSS가 기본 아이콘 경로를 참조하도록 합니다.
// --- 아이콘 설정 끝 ---


// --- 가상 데이터 로딩 및 처리 ---
// 실제 앱에서는 API를 통해 이 CSV 데이터를 받아오거나, 직접 포함시킵니다.
// 사용자가 제공한 CSV 파일 내용을 변수에 할당합니다.
// 좌표값이 없는 행은 제외했습니다.
const apcCoordCsvData = `SQL_APC_Name,Excel_Best_Match,Similarity_Score,Matched_Address,Latitude_Y,Longitude_X
신미네유통,신미네유통사업단(영),90,경북 문경시 영순면 영순공단길 29,36.55983904,128.2374222
해도지영농,해도지(영),80,경북 상주시 공검면 북상주로 1127,36.51965725,128.1636322
상주원예영농,상주원예(영),83,경북 상주시 경상대로 3219,36.43441798,128.1524178
로즈피아,농업법인(주)로즈피아,90,전북 전주시 덕진구 도강길 109-80,35.88612149,127.00861
거산 여주,㈜농업법인거산,80,경기 여주시 북내면 신접2길 59-1,37.32877251,127.6943874
한우리,한우리(영)(청송),90,경북 청송군 진보면 경동로 4296,36.52615163,129.0542257
현대유통,(유)현대유통농업법인,90,전남 신안군 압해읍 압해로 980-11,34.8055427,126.3150508
성주참외원예농협,성주참외원예농협,100,경북 성주군 성주읍 주산로 116,35.91722839,128.2863583
월항농협,월항농협,100,경북 성주군 월항면 월항로 358-10,35.98188203,128.3283838
진주중부농협,진주중부농협,100,경남 진주시 집현면 향양로 30,35.24446342,128.1256426
운봉농협,운봉농협,100,전북 남원시 운봉읍 운봉로 664-11,35.45330869,127.6033068
신선미세상,신선미세상(주),90,경기 남양주시 진접읍 금강로960번길 42,37.74088003,127.1952285
푸르본,푸르본(주),100,경북 예천군 풍양면 낙상1길 13,36.48911522,128.318353
샤인트리,농업회사법인샤인트리(주),90,경북 상주시 이안면 이안중앙길 59,36.56581896,128.1221773
지우,농업회사법인 지우,90,전북 익산시 춘포면 창평길 51-51,35.91008034,127.0371661
버들농산,버들농산산지유통센터,90,전남 영암군 신북면 연동길 21,34.86877174,126.6908581
모두유통,모두유통(주)농업법인,90,충남 논산시 채운면 채운로36번길 35,36.14150535,126.9248479
영흥농산,영흥농산(영),90,전남 무안군 망운면 서목장길 146,34.96081395,126.3262334
신효월라봉,신효월라봉(영)농산물산지유통센터,90,제주특별자치도 서귀포시 월라봉로 76-8,33.26258416,126.4952864
서귀포한라영농,서귀포한라영농법인,90,제주특별자치도 서귀포시 516로 575,33.30825969,126.5451999
제주낭,농업회사법인 제주낭 주식회사 APC,90,제주특별자치도 서귀포시 남원읍 태위로 123-3,33.27961228,126.7126131
산남감귤영농,산남감귤(영),86,제주 서귀포시 남원읍 남한로 159,33.28005398,126.7214041
만인산농협,만인산농협거점스마트APC,90,충남 금산군 추부면 서대산로 400-6,36.2162985,127.4646549
오름파밍가든,농업회사법인 주식회사 선진한마을 오름파밍가든,90,경기도 이천시 부발읍 중부대로 1925번길 113,37.25141249,127.502941
참사랑,농업법인참사랑친환경(주),90,충남 보령시 청라면 상중길 32-10,36.38747632,126.6775
논산배수출영농,논산배수출(영),86,충남 논산시 광석면 사계로 680,36.24904301,127.101944
논산수박 연구회,논산수박연구회(영),82,충남 논산시 광석면 사계로 801,36.2474961,127.1142203
광일영농,광일APC,75,경남 함안군 법수면 강주1길 19,35.30472042,128.331221
열매영농,열매(영),75,경남 밀양시 상남면 상남로 1008-31,35.4468641,128.7580517
함양농협,함양농협,100,경남 함양군 함양읍 고운로 153,35.52302423,127.7381221
더드림 농업법인,농업법인(주)더드림,90,경남 의령군 부림면 대한로 1718-20,35.43265561,128.3582136
미르영농,미르영농조합법인,100,경남 밀양시 하남읍 명례안길 16-1,35.42142252,128.6258908
남일영농,남일영농조합법인,100,경남 의령군 지정면 기강로 115-43,35.33446864,128.4348618
햇볕애영농,햇볕애영농조합법인,100,경남 밀양시 부북면 사포로 68,35.53974465,128.7303027
대보상사,농업회사법인 대보상사(주),100,경북 예천군 예천읍 충효로 407,36.63668853,128.4722513
팜팜,농업법인팜팜㈜,90,충남 논산시 광석면 장마루로 24,36.23075677,127.1030313
해들녘,해들녘영농조합법인,100,전남 함평군 손불면 함손로 914,35.12190895,126.4674712
`; // 좌표값이 있는 데이터만 포함

// --- CSV 파싱 함수 수정 ---
const parseCoordCSV = (csvText) => {
    const lines = csvText.trim().split('\n');
    if (lines.length < 2) return [];
    // CSV 헤더에서 공백 제거 및 확인
    const headers = lines[0].split(',').map(h => h.trim());
    console.log("CSV Headers:", headers); // 헤더 확인용 로그

    const latIndex = headers.indexOf('Latitude_Y');
    const lngIndex = headers.indexOf('Longitude_X');
    // 이름은 SQL_APC_Name 또는 Excel_Best_Match 중 유효한 것을 사용
    const nameIndex1 = headers.indexOf('SQL_APC_Name');
    const nameIndex2 = headers.indexOf('Excel_Best_Match');
    const addrIndex = headers.indexOf('Matched_Address');

    // 필수 좌표 컬럼 확인
    if (latIndex === -1 || lngIndex === -1) {
        console.error("CSV 파일에 필수 좌표 컬럼(Latitude_Y, Longitude_X)이 없습니다.");
        return [];
    }
    // 이름 컬럼 확인 (둘 중 하나는 있어야 함)
    if (nameIndex1 === -1 && nameIndex2 === -1) {
        console.error("CSV 파일에 이름 컬럼(SQL_APC_Name 또는 Excel_Best_Match)이 없습니다.");
        return [];
    }


    const data = [];
    for (let i = 1; i < lines.length; i++) {
        // 쉼표가 포함된 주소 등을 고려하여 좀 더 안전하게 파싱 (간단 버전)
        // 정규 표현식을 사용하여 쉼표로 분리하되, 따옴표 안의 쉼표는 무시 (개선된 파싱)
        const values = lines[i].match(/(".*?"|[^",]+)(?=\s*,|\s*$)/g)?.map(v => v.replace(/^"|"$/g, '')) || [];

        // 필드 개수가 부족하거나 많은 경우 건너뛰기 + 빈 줄 건너뛰기
        if (values.length !== headers.length || values.join('').trim() === '') {
            if(values.join('').trim() !== '') {
                console.warn(`CSV ${i+1}번째 줄 파싱 오류. 건너<0xEB><0x9A><0x9C>니다:`, lines[i]);
            }
            continue;
        }

        const lat = parseFloat(values[latIndex]);
        const lng = parseFloat(values[lngIndex]);

        // 위도, 경도 값이 유효한 경우에만 데이터 추가
        if (!isNaN(lat) && !isNaN(lng)) {
            // 이름 선택: Excel_Best_Match가 있으면 사용, 없으면 SQL_APC_Name 사용
            let apcName = '';
            if (nameIndex2 !== -1 && values[nameIndex2] && values[nameIndex2].trim() && values[nameIndex2].trim() !== '매칭 없음') { // '매칭 없음'도 제외
                apcName = values[nameIndex2].trim();
            } else if (nameIndex1 !== -1 && values[nameIndex1]) { // nameIndex1 존재 및 값 확인
                apcName = values[nameIndex1].trim();
            } else {
                apcName = `Unknown APC ${i}`; // 이름 없으면 임시 이름
            }


            // 고유 ID 생성 (여기서는 SQL_APC_Name 사용 시도, 없으면 index)
            const id = (nameIndex1 !== -1 && values[nameIndex1] ? values[nameIndex1].trim() : `apc-${i}`);

            data.push({
                id: id, // 고유 키로 사용될 ID
                apc_name: apcName,
                address: addrIndex !== -1 ? values[addrIndex].trim() : '',
                lat: lat,
                lng: lng,
            });
        }
    }
    console.log(`CSV 파싱 완료: ${data.length}개의 유효한 좌표 데이터 추출`);
    return data;
};


// --- 대한민국 시도 GeoJSON (간단한 임시 데이터) ---
const southKoreaGeoJson = {
    type: "FeatureCollection",
    features: [
        // 실제 GeoJSON 데이터 필요
        { type: "Feature", properties: { name: "서울특별시" }, geometry: { type: "Polygon", coordinates: [[[126.7, 37.4], [127.1, 37.4], [127.1, 37.7], [126.7, 37.7], [126.7, 37.4]]] } },
        { type: "Feature", properties: { name: "경기도" }, geometry: { type: "Polygon", coordinates: [[[126.5, 37.0], [127.5, 37.0], [127.5, 38.0], [126.5, 38.0], [126.5, 37.0]]] } },
        { type: "Feature", properties: { name: "전라남도" }, geometry: { type: "Polygon", coordinates: [[[126.0, 34.5], [127.0, 34.5], [127.0, 35.5], [126.0, 35.5], [126.0, 34.5]]] } },
        // ...
    ]
};

// --- 유틸리티 함수 ---
const formatNumber = (num) => num ? num.toLocaleString('ko-KR') : '0';
const getColorByValue = (value, max) => {
    if (!value || max === 0) return '#edf2f7';
    const ratio = value / max;
    if (ratio > 0.8) return '#3182ce'; if (ratio > 0.6) return '#4299e1'; if (ratio > 0.4) return '#63b3ed'; if (ratio > 0.2) return '#90cdf4'; return '#bee3f8';
};

// --- 메인 컴포넌트 ---
const ApcMap = () => {
    // APC 마커 데이터 상태 변경
    const [apcMarkers, setApcMarkers] = useState([]);
    // 지역별 집계 데이터 상태 추가 (GeoJSON용)
    const [regionalAggData, setRegionalAggData] = useState({ byProvince: {}, maxReceiving: 0 });
    const [loading, setLoading] = useState(true);

    // 1. 데이터 로딩 (컴포넌트 마운트 시)
    useEffect(() => {
        // 실제 구현: fetch('/api/apc-coords-data')...
        setTimeout(() => {
            const parsedMarkers = parseCoordCSV(apcCoordCsvData); // 좌표 CSV 파싱
            setApcMarkers(parsedMarkers); // 마커 데이터 상태 업데이트

            // --- 지역별 집계 로직 (실제 실적 데이터 필요) ---
            // 현재는 마커 데이터 기반 임시 집계
            const byProvince = parsedMarkers.reduce((acc, d) => {
                const province = d.address?.split(' ')[0] || d.apc_name.split(' ')[0] || '기타';
                if (!acc[province]) {
                    acc[province] = { name: province, totalReceiving: 0, count: 0 };
                }
                acc[province].totalReceiving += Math.random() * 10000;
                acc[province].count += 1;
                return acc;
            }, {});
            const maxReceiving = Math.max(0, ...Object.values(byProvince).map(p => p.totalReceiving));
            setRegionalAggData({ byProvince, maxReceiving });
            // --- 지역별 집계 로직 끝 ---

            setLoading(false);
        }, 500);
    }, []); // 마운트 시 한 번만 실행

    // 2. GeoJSON 스타일 함수 (regionalAggData 사용)
    const geoJsonStyle = (feature) => {
        const provinceName = feature.properties.name;
        const data = regionalAggData.byProvince[provinceName];
        const value = data ? data.totalReceiving : 0;
        const color = getColorByValue(value, regionalAggData.maxReceiving);
        return { fillColor: color, weight: 1, opacity: 1, color: 'white', dashArray: '3', fillOpacity: 0.7 };
    };
    // 3. 마우스 오버 효과 함수 (이전과 동일)
    const highlightFeature = (e) => {
        const layer = e.target;
        layer.setStyle({ weight: 2, color: '#666', dashArray: '', fillOpacity: 0.9 });
        if (layer.feature) { layer.bringToFront(); }
    };
    const resetHighlight = (e) => {
        if (e.target.feature) { e.target.setStyle(geoJsonStyle(e.target.feature)); }
    };
    // 4. 각 지역 이벤트 함수 (regionalAggData 사용)
    const onEachFeature = (feature, layer) => {
        layer.on({
            mouseover: highlightFeature,
            mouseout: resetHighlight,
            click: (e) => {
                const provinceName = feature.properties.name;
                const data = regionalAggData.byProvince[provinceName];
                const popupContent = `
                    <strong>${provinceName}</strong><br/>
                    총 입고량(임시): ${formatNumber(data?.totalReceiving || 0)} kg<br/>
                    APC 개수: ${data?.count || 0} 개소
                 `;
                if (typeof L !== 'undefined') {
                    L.popup().setLatLng(e.latlng).setContent(popupContent).openOn(e.target._map);
                }
            }
        });
        const provinceName = feature.properties.name;
        if (layer.bindTooltip) { layer.bindTooltip(provinceName, { sticky: true }); }
    };

    // 로딩 처리
    if (loading) { return <div className="p-6 text-center">지역별 분석 데이터를 불러오는 중입니다...</div>; }

    // 지도 초기 위치 및 줌 레벨
    const mapPosition = [36.0, 127.5];
    const mapZoom = 7;

    return (
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 font-pretendard h-full">
            {/* 지도 영역 */}
            <div className="lg:col-span-2 row-span-3 bg-white p-4 rounded-xl shadow h-full">
                <h3 className="text-lg font-semibold text-gray-700 mb-4">지역별 분포 및 APC 위치</h3>
                <MapContainer center={mapPosition} zoom={mapZoom} style={{ height: 'calc(100% - 60px)', width: '100%', borderRadius: '8px' }}>
                    <TileLayer
                        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                    />
                    {/* GeoJSON (옵션) */}
                    {southKoreaGeoJson && southKoreaGeoJson.features && (
                        <GeoJSON
                            key={JSON.stringify(regionalAggData.byProvince)}
                            data={southKoreaGeoJson}
                            style={geoJsonStyle}
                            onEachFeature={onEachFeature}
                        />
                    )}
                    {/* --- 마커 렌더링 (CSV 데이터 기반) --- */}
                    {apcMarkers.map((marker) => (
                        <Marker key={marker.id} position={[marker.lat, marker.lng]}>
                            <Popup>
                                <strong>{marker.apc_name}</strong><br/>
                                {marker.address || '주소 정보 없음'}
                            </Popup>
                        </Marker>
                    ))}
                    {/* --- 마커 렌더링 끝 --- */}
                </MapContainer>
                {/* 범례 */}
                <div className="mt-2 flex items-center justify-end space-x-2 text-xs">
                    <span className="font-semibold">입고량(임시):</span>
                    <span className="w-4 h-4 inline-block bg-[#bee3f8]"></span><span>낮음</span>
                    <span className="w-4 h-4 inline-block bg-[#63b3ed]"></span>
                    <span className="w-4 h-4 inline-block bg-[#3182ce]"></span><span>높음</span>
                </div>
            </div>

            {/* 지역별 실적 표 (regionalAggData 사용) */}
            <div className="bg-white p-6 rounded-xl shadow overflow-y-auto">
                <h3 className="text-lg font-semibold text-gray-700 mb-4">지역별 요약 (APC 수)</h3>
                <table className="w-full text-sm text-left">
                    <thead className="bg-gray-50 sticky top-[-24px]">
                    <tr>
                        <th className="p-3 font-semibold">지역</th>
                        <th className="p-3 font-semibold text-right">APC 수</th>
                    </tr>
                    </thead>
                    <tbody>
                    {Object.values(regionalAggData.byProvince)
                        .sort((a, b) => b.count - a.count)
                        .map(data => (
                            <tr key={data.name} className="border-b hover:bg-gray-50">
                                <td className="p-3 font-medium text-gray-800">{data.name}</td>
                                <td className="p-3 text-gray-600 text-right">{data.count}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>

            {/* 품목이랄까? */}
            <div className="bg-white p-6 rounded-xl shadow overflow-y-auto">
                <h3 className="text-lg font-semibold text-gray-700 mb-4">지역별 요약 (APC 수)</h3>
                <table className="w-full text-sm text-left">
                    <thead className="bg-gray-50 sticky top-0">
                    <tr>
                        <th className="p-3 font-semibold">지역</th>
                        <th className="p-3 font-semibold text-right">APC 수</th>
                    </tr>
                    </thead>
                    <tbody>
                    {Object.values(regionalAggData.byProvince)
                        .sort((a, b) => b.count - a.count)
                        .map(data => (
                            <tr key={data.name} className="border-b hover:bg-gray-50">
                                <td className="p-3 font-medium text-gray-800">{data.name}</td>
                                <td className="p-3 text-gray-600 text-right">{data.count}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default ApcMap;