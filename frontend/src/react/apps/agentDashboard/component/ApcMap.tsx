import React, { useState, useEffect, useRef } from 'react'; // --- 2. useRef 임포트 ---
// react-leaflet 및 leaflet import 유지
import { MapContainer, TileLayer, GeoJSON, Marker, Popup } from 'react-leaflet';
import L from 'leaflet';
// CSS import 유지
import 'leaflet/dist/leaflet.css';

// 한국 시도 경계 GeoJSON 데이터 import
import southKoreaGeoJson from '../../../assets/data/korea-provinces.json';

// --- 1. Leaflet 아이콘 설정 (필수) ---
// react-leaflet에서 기본 아이콘이 제대로 표시되도록 설정합니다.
// (ApcMap 컴포넌트 *외부에* 위치해야 합니다.)
import icon from 'leaflet/dist/images/marker-icon.png';
import iconShadow from 'leaflet/dist/images/marker-shadow.png';

let DefaultIcon = L.icon({
  iconUrl: icon,
  shadowUrl: iconShadow,
  iconAnchor: [12, 41], // 아이콘 앵커 위치
  popupAnchor: [1, -34], // 팝업 앵커 위치
  shadowSize: [41, 41], // 그림자 크기
});

L.Marker.prototype.options.icon = DefaultIcon;
// --- 아이콘 설정 끝 ---

// --- 가상 데이터 로딩 및 처리 ---
// ... (apcCoordCsvData 변수는 기존과 동일하게 유지) ...
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
`;

// --- CSV 파싱 함수 수정 ---
// (기존 코드와 동일, 문제 없음)
const parseCoordCSV = (csvText) => {
  const lines = csvText.trim().split('\n');
  if (lines.length < 2) return [];
  const headers = lines[0].split(',').map((h) => h.trim());
  console.log('CSV Headers:', headers);

  const latIndex = headers.indexOf('Latitude_Y');
  const lngIndex = headers.indexOf('Longitude_X');
  const nameIndex1 = headers.indexOf('SQL_APC_Name');
  const nameIndex2 = headers.indexOf('Excel_Best_Match');
  const addrIndex = headers.indexOf('Matched_Address');

  if (latIndex === -1 || lngIndex === -1) {
    console.error('CSV 파일에 필수 좌표 컬럼(Latitude_Y, Longitude_X)이 없습니다.');
    return [];
  }
  if (nameIndex1 === -1 && nameIndex2 === -1) {
    console.error('CSV 파일에 이름 컬럼(SQL_APC_Name 또는 Excel_Best_Match)이 없습니다.');
    return [];
  }

  const data = [];
  for (let i = 1; i < lines.length; i++) {
    const values =
      lines[i].match(/(".*?"|[^",]+)(?=\s*,|\s*$)/g)?.map((v) => v.replace(/^"|"$/g, '')) || [];

    if (values.length !== headers.length || values.join('').trim() === '') {
      if (values.join('').trim() !== '') {
        console.warn(`CSV ${i + 1}번째 줄 파싱 오류. 건너뛰니다:`, lines[i]);
      }
      continue;
    }

    const lat = parseFloat(values[latIndex]);
    const lng = parseFloat(values[lngIndex]);

    if (!isNaN(lat) && !isNaN(lng)) {
      let apcName = '';
      if (
        nameIndex2 !== -1 &&
        values[nameIndex2] &&
        values[nameIndex2].trim() &&
        values[nameIndex2].trim() !== '매칭 없음'
      ) {
        apcName = values[nameIndex2].trim();
      } else if (nameIndex1 !== -1 && values[nameIndex1]) {
        apcName = values[nameIndex1].trim();
      } else {
        apcName = `Unknown APC ${i}`;
      }

      const id = nameIndex1 !== -1 && values[nameIndex1] ? values[nameIndex1].trim() : `apc-${i}`;

      data.push({
        id: id,
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

// --- 유틸리티 함수 ---
// (기존 코드와 동일, 문제 없음)
const formatNumber = (num) => (num ? num.toLocaleString('ko-KR') : '0');
const getColorByValue = (value, max) => {
  if (!value || max === 0) return '#edf2f7';
  const ratio = value / max;
  if (ratio > 0.8) return '#3182ce';
  if (ratio > 0.6) return '#4299e1';
  if (ratio > 0.4) return '#63b3ed';
  if (ratio > 0.2) return '#90cdf4';
  return '#bee3f8';
};

// --- 4. (개선) 시/도 이름 정규화 맵 ---
// 기존 if/else 문을 대체할 객체 (관리가 더 쉬움)
const provinceNormalizationMap = {
  경기: '경기도',
  경기도: '경기도',
  강원: '강원도',
  강원도: '강원도',
  충북: '충청북도',
  충청북도: '충청북도',
  충남: '충청남도',
  충청남도: '충청남도',
  전북: '전라북도',
  전라북도: '전라북도',
  전남: '전라남도',
  전라남도: '전라남도',
  경북: '경상북도',
  경상북도: '경상북도',
  경남: '경상남도',
  경상남도: '경상남도',
  제주: '제주특별자치도',
  제주특별자치도: '제주특별자치도',
  서울: '서울특별시',
  서울특별시: '서울특별시',
  부산: '부산광역시',
  부산광역시: '부산광역시',
  대구: '대구광역시',
  대구광역시: '대구광역시',
  인천: '인천광역시',
  인천광역시: '인천광역시',
  광주: '광주광역시',
  광주광역시: '광주광역시',
  대전: '대전광역시',
  대전광역시: '대전광역시',
  울산: '울산광역시',
  울산광역시: '울산광역시',
  세종: '세종특별자치시',
  세종특별자치시: '세종특별자치시',
};

// --- 메인 컴포넌트 ---
const ApcMap = () => {
  // State
  const [apcMarkers, setApcMarkers] = useState([]);
  const [regionalAggData, setRegionalAggData] = useState({
    byProvince: {},
    maxReceiving: 0,
    provinceItems: {},
  });
  const [selectedProvince, setSelectedProvince] = useState(null);
  const [loading, setLoading] = useState(true);

  // --- 3. GeoJSON 레이어 저장을 위한 Ref ---
  const geoJsonLayersRef = useRef({});

  // 1. 데이터 로딩 (컴포넌트 마운트 시)
  useEffect(() => {
    // 실제 구현: fetch('/api/apc-coords-data')...
    setTimeout(() => {
      const parsedMarkers = parseCoordCSV(apcCoordCsvData);
      setApcMarkers(parsedMarkers);

      // --- 지역별 집계 로직 (개선됨) ---
      const byProvince = {};
      const provinceItems = {};

      parsedMarkers.forEach((d) => {
        // 주소에서 시도 추출 (첫 번째 단어)
        let provinceKey = d.address?.split(' ')[0] || '기타';

        // (개선) 정규화 맵을 사용하여 시도 이름 통일
        let province = provinceNormalizationMap[provinceKey] || '기타';

        if (!byProvince[province]) {
          byProvince[province] = { name: province, totalReceiving: 0, count: 0 };
          provinceItems[province] = [];
        }

        // ... (임시 실적 데이터 생성 로직은 기존과 동일) ...
        const receiving = Math.floor(Math.random() * 10000) + 1000;
        byProvince[province].totalReceiving += receiving;
        byProvince[province].count += 1;

        const items = [
          '사과',
          '배',
          '감귤',
          '딸기',
          '참외',
          '수박',
          '토마토',
          '오이',
          '호박',
          '배추',
        ];
        const randomItems = items
          .sort(() => 0.5 - Math.random())
          .slice(0, Math.floor(Math.random() * 3) + 2);
        randomItems.forEach((item) => {
          const existingItem = provinceItems[province].find((pi) => pi.item_name === item);
          const itemReceiving = Math.floor(Math.random() * 3000) + 500;
          const itemSorting = Math.floor(itemReceiving * (0.85 + Math.random() * 0.1));
          const itemShipping = Math.floor(itemSorting * (0.85 + Math.random() * 0.1));

          if (existingItem) {
            existingItem.receiving += itemReceiving;
            existingItem.sorting += itemSorting;
            existingItem.shipping += itemShipping;
          } else {
            provinceItems[province].push({
              item_name: item,
              receiving: itemReceiving,
              sorting: itemSorting,
              shipping: itemShipping,
            });
          }
        });
      });

      const maxReceiving = Math.max(0, ...Object.values(byProvince).map((p) => p.totalReceiving));
      setRegionalAggData({ byProvince, maxReceiving, provinceItems });

      console.log('데이터 로딩 완료:', {
        apcCount: parsedMarkers.length,
        provinces: Object.keys(byProvince).length,
      });

      setLoading(false);
    }, 500);
  }, []); // 마운트 시 한 번만 실행 (의존성 배열: [])

  // 2. GeoJSON 스타일 함수
  const geoJsonStyle = (feature) => {
    const provinceName = feature.properties.name;
    const data = regionalAggData.byProvince[provinceName];
    const value = data ? data.totalReceiving : 0;
    const color = getColorByValue(value, regionalAggData.maxReceiving);
    return {
      fillColor: color,
      weight: 2,
      opacity: 1,
      color: '#ffffff',
      dashArray: '',
      fillOpacity: 0.6,
    };
  };

  // 3. 마우스 오버 효과 함수
  const highlightFeature = (e) => {
    const layer = e.target;
    layer.setStyle({
      weight: 3,
      color: '#666',
      dashArray: '',
      fillOpacity: 0.8,
    });
    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
      layer.bringToFront();
    }
  };

  const resetHighlight = (e) => {
    const layer = e.target;
    if (layer.feature) {
      layer.setStyle(geoJsonStyle(layer.feature));
    }
  };

  // --- 5. (수정) onEachFeature ---
  // 각 지역 레이어에 이벤트 핸들러를 바인딩하고, Ref에 레이어를 저장합니다.
  const onEachFeature = (feature, layer) => {
    const provinceName = feature.properties.name;

    // (추가) Ref에 레이어 저장
    geoJsonLayersRef.current[provinceName] = layer;

    layer.on({
      mouseover: highlightFeature,
      mouseout: resetHighlight,
      click: (e) => {
        if (geoJsonLayersRef.current) {
          Object.values(geoJsonLayersRef.current).forEach((layerInstance) => {
            // layerInstance가 유효하고, isTooltipOpen 함수가 있으며, 툴팁이 열려있는지 확인
            if (
              layerInstance &&
              typeof layerInstance.isTooltipOpen === 'function' &&
              layerInstance.isTooltipOpen()
            ) {
              layerInstance.closeTooltip(); // 해당 레이어의 툴팁을 닫음
            }
          });
        }

        const data = regionalAggData.byProvince[provinceName];

        // 지역 선택 상태 업데이트
        setSelectedProvince(provinceName);

        const popupContent = `
                    <div style="font-family: 'Pretendard', sans-serif;">
                        <strong style="font-size: 14px;">${provinceName}</strong><br/>
                        <span style="font-size: 12px;">총 입고량(임시): ${formatNumber(data?.totalReceiving || 0)} kg</span><br/>
                        <span style="font-size: 12px;">APC 개수: ${data?.count || 0} 개소</span>
                    </div>
                 `;
        L.popup()
          .setLatLng(e.latlng) // 클릭 이벤트의 latlng 사용
          .setContent(popupContent)
          .openOn(e.target._map);
      },
    });

    if (layer.bindTooltip) {
      layer.bindTooltip(provinceName, {
        sticky: true,
        direction: 'center',
        className: 'province-tooltip',
      });
    }
  };

  // --- 6. (추가) 지역별 자동 클릭 (투어) 효과 ---
  useEffect(() => {
    // 로딩이 끝났고, 집계 데이터가 있을 때만 실행
    if (loading || Object.keys(regionalAggData.byProvince).length === 0) {
      return;
    }

    // 데이터가 있는 시/도 이름 목록
    const provincesToClick = Object.keys(regionalAggData.byProvince);
    let currentIndex = 0;

    // 3초 간격으로 실행
    const intervalId = setInterval(() => {
      // 목록 순환
      if (currentIndex >= provincesToClick.length) {
        currentIndex = 0;
      }

      const provinceName = provincesToClick[currentIndex];
      const layer = geoJsonLayersRef.current[provinceName];

      if (layer) {
        // 팝업을 띄울 위치 계산 (지역의 중앙)
        const center = layer.getBounds().getCenter();

        // 'click' 이벤트를 강제로 발생시킴
        // onEachFeature의 click 핸들러가 'e.latlng'과 'e.target'을 사용하므로,
        // 해당 속성을 가진 가짜 이벤트 객체를 전달합니다.
        layer.fire('click', {
          latlng: center,
          target: layer,
        });
      }

      currentIndex++;
    }, 3000); // 3초 간격 (조절 가능)

    // 컴포넌트가 언마운트되거나, 의존성이 변경되어 effect가 다시 실행될 때
    // 기존의 인터벌을 정리합니다. (메모리 누수 방지)
    return () => clearInterval(intervalId);

    // 이 effect는 loading 또는 regionalAggData가 변경될 때마다 다시 실행됩니다.
  }, [loading, regionalAggData]);

  // --- 렌더링 ---
  if (loading) {
    return <div className="p-6 text-center">지역별 분석 데이터를 불러오는 중입니다...</div>;
  }

  const mapPosition = [36.5, 127.5];
  const mapZoom = 7;

  return (
    <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 font-pretendard h-full">
      {/* 지도 영역 */}
      <div className="lg:col-span-2 row-span-3 bg-white p-4 rounded-xl shadow h-full">
        <h2 className="text-2xl font-bold text-gray-800 mb-6">지역별 분포 및 APC 위치</h2>
        <MapContainer
          center={mapPosition}
          zoom={mapZoom}
          style={{ height: 'calc(100% - 60px)', width: '100%', borderRadius: '8px' }}
          scrollWheelZoom={true}
        >
          <TileLayer
            attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          />
          {/* GeoJSON - key를 사용해 data 변경 시 리렌더링 강제 */}
          {southKoreaGeoJson && southKoreaGeoJson.features && (
            <GeoJSON
              key={JSON.stringify(regionalAggData.byProvince)}
              data={southKoreaGeoJson}
              style={geoJsonStyle}
              onEachFeature={onEachFeature}
            />
          )}
          {/* 마커 렌더링 */}
          {apcMarkers.map((marker) => (
            <Marker key={marker.id} position={[marker.lat, marker.lng]}>
              <Popup>
                <strong>{marker.apc_name}</strong>
                <br />
                {marker.address || '주소 정보 없음'}
              </Popup>
            </Marker>
          ))}
        </MapContainer>
        {/* 범례 */}
        <div className="mt-2 flex items-center justify-end space-x-2 text-xs">
          <span className="font-semibold">입고량(임시):</span>
          <span className="w-4 h-4 inline-block bg-[#bee3f8] border border-gray-300"></span>
          <span>낮음</span>
          <span className="w-4 h-4 inline-block bg-[#63b3ed] border border-gray-300"></span>
          <span className="w-4 h-4 inline-block bg-[#3182ce] border border-gray-300"></span>
          <span>높음</span>
        </div>
      </div>

      {/* 지역별 실적 표 */}
      <div className="bg-white p-6 rounded-xl shadow overflow-y-auto hide-scrollbar">
        <h3 className="text-lg font-semibold text-gray-700 mb-4 sticky top-[-24px] bg-white">
          지역별 요약 (APC 수)
        </h3>
        <table className="w-full text-sm text-left">
          <thead className="bg-gray-50">
            <tr>
              <th className="p-3 font-semibold">지역</th>
              <th className="p-3 font-semibold text-right">APC 수</th>
            </tr>
          </thead>
          <tbody>
            {Object.values(regionalAggData.byProvince)
              .sort((a, b) => b.count - a.count)
              .map((data) => (
                <tr
                  key={data.name}
                  className={`border-b hover:bg-gray-50 ${selectedProvince === data.name ? 'bg-blue-50' : ''}`}
                >
                  <td className="p-3 font-medium text-gray-800">{data.name}</td>
                  <td className="p-3 text-gray-600 text-right">{data.count}</td>
                </tr>
              ))}
          </tbody>
        </table>
      </div>

      {/* 품목별 요약 테이블 */}
      <div className="bg-white p-6 rounded-xl shadow overflow-y-auto hide-scrollbar ">
        <h3 className="text-lg font-semibold text-gray-700 mb-4 sticky top-[-24px] bg-white">
          {selectedProvince ? `${selectedProvince} - 품목별 실적` : '품목별 실적'}
        </h3>
        {selectedProvince && regionalAggData.provinceItems?.[selectedProvince] ? (
          <table className="w-full text-sm text-left">
            <thead className="bg-gray-50 sticky top-0">
              <tr>
                <th className="p-3 font-semibold">품목</th>
                <th className="p-3 font-semibold text-right">입고(kg)</th>
                <th className="p-3 font-semibold text-right">선별(kg)</th>
                <th className="p-3 font-semibold text-right">출하(kg)</th>
              </tr>
            </thead>
            <tbody>
              {regionalAggData.provinceItems[selectedProvince]
                .sort((a, b) => b.receiving - a.receiving)
                .map((item, idx) => (
                  <tr key={idx} className="border-b hover:bg-gray-50">
                    <td className="p-3 font-medium text-gray-800">{item.item_name}</td>
                    <td className="p-3 text-gray-600 text-right">{formatNumber(item.receiving)}</td>
                    <td className="p-3 text-gray-600 text-right">{formatNumber(item.sorting)}</td>
                    <td className="p-3 text-gray-600 text-right">{formatNumber(item.shipping)}</td>
                  </tr>
                ))}
            </tbody>
            <tfoot className="bg-gray-50 font-semibold sticky bottom-[-24px]">
              <tr className="border-t-2">
                <td className="p-3">합계</td>
                <td className="p-3 text-right">
                  {formatNumber(
                    regionalAggData.provinceItems[selectedProvince].reduce(
                      (sum, item) => sum + item.receiving,
                      0,
                    ),
                  )}
                </td>
                <td className="p-3 text-right">
                  {formatNumber(
                    regionalAggData.provinceItems[selectedProvince].reduce(
                      (sum, item) => sum + item.sorting,
                      0,
                    ),
                  )}
                </td>
                <td className="p-3 text-right">
                  {formatNumber(
                    regionalAggData.provinceItems[selectedProvince].reduce(
                      (sum, item) => sum + item.shipping,
                      0,
                    ),
                  )}
                </td>
              </tr>
            </tfoot>
          </table>
        ) : (
          <div className="text-center py-8 text-gray-500">
            <p className="mb-2">지도에서 지역을 선택하세요</p>
            <p className="text-xs">클릭하면 해당 지역의 품목별 실적을 확인할 수 있습니다</p>
          </div>
        )}
      </div>
    </div>
  );
};

export default ApcMap;
