export interface ApcCenter {
  id: number;
  name: string;
  location: string;
  weather: string;
  pestAlert: string;
  lastUsed: string;
  mainItem: string;
  isPeakSeason: boolean;
  performance: {
    receiving: number;
    sorting: number;
    packing: number;
  };
  lat: number;
  lng: number;
}

// CSV 주소를 "시도 + 시군구" 형식으로 변환
function extractLocation(address: string): string {
  const parts = address.split(' ');
  return parts.slice(0, 2).join(' '); // 예: "경북 문경시"
}

// 더미 데이터 생성 헬퍼
function generateDummyData() {
  const weathers = ['맑음 ☀️', '구름 많음 ☁️', '흐림 🌥️', '비 🌧️'];
  const pestAlerts = ['양호', '주의', '경보'];
  const mainItems = ['브로콜리', '상추', '양파', '딸기', '호박', '콩', '배추', '무'];

  return {
    weather: weathers[Math.floor(Math.random() * weathers.length)],
    pestAlert: pestAlerts[Math.floor(Math.random() * pestAlerts.length)],
    lastUsed: `2025-10-${20 + Math.floor(Math.random() * 8)}`,
    mainItem: mainItems[Math.floor(Math.random() * mainItems.length)],
    isPeakSeason: Math.random() > 0.5,
    performance: {
      receiving: 70 + Math.floor(Math.random() * 30),
      sorting: 70 + Math.floor(Math.random() * 30),
      packing: 70 + Math.floor(Math.random() * 30),
    },
  };
}

export const apcCenters: ApcCenter[] = [
  {
    id: 1,
    name: '신미네유통',
    location: extractLocation('경북 문경시 영순면 영순공원길 29'),
    ...generateDummyData(),
    lat: 0, // 좌표 필요 시 추가
    lng: 0,
  },
  {
    id: 2,
    name: '해도저장소',
    location: extractLocation('경북 상주시 공검면 녹상주로 1127'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 3,
    name: '상주원예영농',
    location: extractLocation('경북 상주시 외남면'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 4,
    name: '로즈피아',
    location: extractLocation('전북 전주시 덕진구 도장길 109-80'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 5,
    name: '㈜동업법인거산',
    location: extractLocation('경기 여주시 북내면 신접2길 59-1'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 6,
    name: '한우리',
    location: extractLocation('경북 청송군 진보면 경동로 4296'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 7,
    name: '딸내유통',
    location: extractLocation('전남 신안군 암태읍 암태로 900-11'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 8,
    name: '부안마케팅',
    location: extractLocation('전북 부안군 동진면 농주1길 802'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 9,
    name: '상주참의원예농협',
    location: extractLocation('경북 성주군 성주읍 주산로 116'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 10,
    name: '월향농협',
    location: extractLocation('경북 성주군 월항면 월향로 358-10'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 11,
    name: '건국충북농협',
    location: extractLocation('충남 진천시 진천읍 향양로 30'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 12,
    name: '은성농협',
    location: extractLocation('전북 남원시 운봉읍 운봉산성길 64-11'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 13,
    name: '신선미세상',
    location: extractLocation('경기 남양주시 진건읍 독정로560번길 42'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 14,
    name: '지우',
    location: extractLocation('전북 익산시 춘포면 정병길 51-51'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 15,
    name: '버들농산',
    location: extractLocation('전남 영암군 신북면 연동로 21'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 16,
    name: '모두유통',
    location: extractLocation('충남 논산시 채운면 채운로36번길 35'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 17,
    name: '한들농산',
    location: extractLocation('전남 무안군 망운면 외산길 146'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 18,
    name: '삼 영농',
    location: extractLocation('경북 안동시 풍산읍 산업단지 4길 58-12'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 19,
    name: '청일유통',
    location: extractLocation('전남 함평군 손불면 죽암죽장길 34'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 20,
    name: '신흥클라봄',
    location: extractLocation('제주특별자치도 서귀포시 월라봄로 76-8'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 21,
    name: '서귀포도록청농',
    location: extractLocation('제주특별자치도 서귀포시 516로 575'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 22,
    name: '제주남',
    location: extractLocation('제주특별자치도 서귀포시 태평로 123-3'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 23,
    name: '상남감귤영농',
    location: extractLocation('제주특별자치도 서귀포시 일주동로 8270'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 24,
    name: '만언산농협',
    location: extractLocation('충남 금산군 추부면 서대산로 400-6'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 25,
    name: '오홈피망가든',
    location: extractLocation('경기도 이천시 부발읍 중부대로 1925번길 113'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 26,
    name: '찬사랑',
    location: extractLocation('충남 홍성시 장곡면 사계로 92-10'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 27,
    name: '논산배송출영농',
    location: extractLocation('충남 논산시 광석면 사계로 600'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 28,
    name: '논산수박 연구회',
    location: extractLocation('충남 논산시 광석면 사계로 801'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 29,
    name: '광일APC',
    location: extractLocation('경남 함안군 법수면 강주1길 19'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 30,
    name: '열매영농',
    location: extractLocation('경남 밀양시 상남면 성남로 1008-31'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 31,
    name: '월양농협',
    location: extractLocation('경남 함양군 병곡면 병곡로 535'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 32,
    name: '더드림 농업법인',
    location: extractLocation('경북 칠곡군 지천면 금호로 48'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 33,
    name: '미르영농',
    location: extractLocation('경남 남해군 삼동면 복천로 495-3, 2층'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 34,
    name: '남일영농',
    location: extractLocation('경남 남해군 설천면 설천로 212'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 35,
    name: '빗벌애(영)',
    location: extractLocation('경남 남해군 설천면 설천로 200-6'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 36,
    name: '대보상사',
    location: extractLocation('충남 논산시 채운면 우영아들로 331'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 37,
    name: '팜팜',
    location: extractLocation('충남 논산시 광석면 정마루로 24'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 38,
    name: '보성원예',
    location: extractLocation('전남 보성군 보성읍 평통로 1671'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 39,
    name: '청주융성생강농협법인',
    location: extractLocation('충북 청주시 흥덕구 청주역로 517-63'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 40,
    name: '옥양영농',
    location: extractLocation('전남 고흥군 도덕면 대경로 428-14'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 41,
    name: '현경유통',
    location: extractLocation('전남 무안군 현경면 정교로 478'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 42,
    name: '온남영농',
    location: extractLocation('전남 무안군 청계면 무안로 138-13'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 43,
    name: '평화영농 금사',
    location: extractLocation('전남 무안군 운남면 운남센터길 5'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 44,
    name: '평화영농 운남',
    location: extractLocation('전남 무안군 운남면 운남센터길 5'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 45,
    name: '하반도농협',
    location: extractLocation('강원특별자치도 춘천시 신북읍 오봉천로 5'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 46,
    name: '태안군농협',
    location: extractLocation('충남 태안군 태안읍 송암로 522'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 47,
    name: 'KKMC1',
    location: extractLocation('전남 해남군 화산면 송평로 59'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
  {
    id: 48,
    name: 'KKMC2',
    location: extractLocation('전북 익산시 함라면 시화로 654'),
    ...generateDummyData(),
    lat: 0,
    lng: 0,
  },
];
