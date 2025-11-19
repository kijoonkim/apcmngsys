/**
 * @description 날짜 관련 공통함수 (TypeScript 변환)
 */

/**
 * @name gfn_dateToYmd
 * @description Date 객체를 YYYYMMDD 형식의 문자열로 변환
 * @param {Date} date - 변환할 Date 객체
 * @param {string} [delimiter=""] - 구분자 (예: "-")
 * @param {boolean} [format=false] - '년월일' 형식 사용 여부
 * @returns {string} YYYYMMDD 또는 "YYYY년 MM월 DD일" 형식의 문자열
 */
export const gfn_dateToYmd = (
  date: Date,
  delimiter: string = '',
  format: boolean = false,
): string => {
  const year = date.getFullYear();
  const month = (date.getMonth() + 1).toString().padStart(2, '0');
  const day = date.getDate().toString().padStart(2, '0');

  let strYmd = '';
  if (format) {
    strYmd += year + '년 ';
    strYmd += month + '월 ';
    strYmd += day + '일 ';
  } else {
    strYmd += year;
    strYmd += delimiter + month;
    strYmd += delimiter + day;
  }

  return strYmd;
};

/**
 * @name gfn_dateToHms
 * @description Date 객체를 HHMMSS 형식의 문자열로 변환
 * @param {Date} date
 * @param {string} [delimiter=""] - 구분자 (예: ":")
 * @returns {string} HHMMSS 형식의 문자열
 */
export const gfn_dateToHms = (date: Date, delimiter: string = ''): string => {
  const hours = date.getHours().toString().padStart(2, '0'); // 시
  const minutes = date.getMinutes().toString().padStart(2, '0'); // 분
  const seconds = date.getSeconds().toString().padStart(2, '0'); // 초

  let strHms = '';
  strHms += hours;
  strHms += delimiter + minutes;
  strHms += delimiter + seconds;

  return strHms;
};

/**
 * @name gfn_dateToYm
 * @description Date 객체를 YYYYMM 형식의 문자열로 변환
 * @param {Date} date
 * @param {string} [delimiter=""] - 구분자 (예: "-")
 * @returns {string} YYYYMM 형식의 문자열
 */
export const gfn_dateToYm = (date: Date, delimiter: string = ''): string => {
  const year = date.getFullYear();
  const month = (date.getMonth() + 1).toString().padStart(2, '0');

  let strYm = '';
  strYm += year;
  strYm += delimiter + month;

  return strYm;
};

/**
 * @name gfn_dateToYear
 * @description Date 객체에서 연도(YYYY)만 반환
 * @param {Date} date
 * @returns {number} YYYY (연도)
 */
export const gfn_dateToYear = (date: Date): number => {
  return date.getFullYear();
};

/**
 * @name gfn_dateFirstYmd
 * @description 해당 월의 첫 번째 날짜(1일)를 YYYYMMDD 형식으로 반환
 * @param {Date} date
 * @param {string} [delimiter=""] - 구분자 (예: "-")
 * @returns {string} YYYYMMDD 형식의 문자열
 */
export const gfn_dateFirstYmd = (date: Date, delimiter: string = ''): string => {
  const year = date.getFullYear();
  const month = date.getMonth();

  const firstDate = new Date(year, month, 1);
  return gfn_dateToYmd(firstDate, delimiter);
};

/**
 * @name gfn_dateLastYmd
 * @description 해당 월의 마지막 날짜를 YYYYMMDD 형식으로 반환
 * @param {Date} date
 * @param {string} [delimiter=""] - 구분자 (예: "-")
 * @returns {string} YYYYMMDD 형식의 문자열
 */
export const gfn_dateLastYmd = (date: Date, delimiter: string = ''): string => {
  const year = date.getFullYear();
  const month = date.getMonth();

  const lastDate = new Date(year, month + 1, 0);

  return gfn_dateToYmd(lastDate, delimiter);
};

/**
 * @name gfn_diffDate
 * @description 두 YYYYMMDD 날짜 문자열 간의 차이(ms)를 반환
 * @param {string} fromDate - YYYYMMDD 형식
 * @param {string} toDate - YYYYMMDD 형식
 * @returns {number} 두 날짜 간의 밀리초 차이
 */
export const gfn_diffDate = (fromDate: string, toDate: string): number => {
  const from = new Date(
    fromDate.substring(0, 4) + '-' + fromDate.substring(4, 2) + '-' + fromDate.substring(6, 2),
  );
  const to = new Date(
    toDate.substring(0, 4) + '-' + toDate.substring(4, 2) + '-' + toDate.substring(6, 2),
  );

  const diffDate = to.getTime() - from.getTime();

  return diffDate;
};

/**
 * @name gfn_addDate
 * @description YYYYMMDD 형식의 날짜에 특정 일(days)을 더한 날짜를 YYYYMMDD로 반환
 * @param {string} fromDate - YYYYMMDD 형식
 * @param {number} addDate - 더할 일수
 * @returns {string} YYYYMMDD 형식의 문자열
 */
export const gfn_addDate = (fromDate: string, addDate: number): string => {
  const from = new Date(
    fromDate.substring(0, 4) + '-' + fromDate.substring(4, 2) + '-' + fromDate.substring(6, 2),
  );

  from.setDate(from.getDate() + addDate);

  const year = from.getFullYear();
  const month = (from.getMonth() + 1).toString().padStart(2, '0');
  const day = from.getDate().toString().padStart(2, '0');
  const newDate = `${year}${month}${day}`;

  return newDate;
};

/**
 * @name gfn_addMonth
 * @description YYYYMM 형식의 날짜에 특정 월(months)을 더한 날짜를 YYYYMMDD로 반환
 * @param {string} fromYm - YYYYMM 형식
 * @param {number} addMonth - 더할 월수
 * @returns {string} YYYYMMDD 형식의 문자열
 */
export const gfn_addMonth = (fromYm: string, addMonth: number): string => {
  const from = new Date(fromYm.substring(0, 4) + '-' + fromYm.substring(4, 2) + '-01');

  from.setMonth(from.getMonth() + addMonth);

  const year = from.getFullYear();
  const month = (from.getMonth() + 1).toString().padStart(2, '0');
  const day = from.getDate().toString().padStart(2, '0');
  const newDate = `${year}${month}${day}`;

  return newDate;
};

/**
 * @name gfn_excelSerialDateToJSDate
 * @description 엑셀 시리얼 날짜를 Date 객체로 변환
 * @param {number} _excelSerialDate
 * @returns {Date}
 */
export const gfn_excelSerialDateToJSDate = (_excelSerialDate: number): Date => {
  const daysBeforeUnixEpoch = 70 * 365 + 19;
  const hour = 60 * 60 * 1000;

  return new Date(Math.round((_excelSerialDate - daysBeforeUnixEpoch) * 24 * hour) + 12 * hour);
};

// -----------------------------------------------------------------------------
// [경고] gfn_monthValidation 함수는 SBUxMethod.get 등 DOM/외부 라이브러리를
// 직접 조작하므로 React에서 사용할 수 없습니다.
// React에서는 이 기능을 useState와 props를 통해
// <DatePickerInput minDate={...} maxDate={...} /> 등으로 구현해야 합니다.
// -----------------------------------------------------------------------------

/**
 * @name gfn_dateToTime
 * @description Date 객체를 HH:MM:SS 형식의 문자열로 변환
 * @param {Date} date
 * @param {string} [delimiter=":"] - 구분자
 * @returns {string} HH:MM:SS 형식의 문자열
 */
export const gfn_dateToTime = (date: Date, delimiter: string = ':'): string => {
  const hours = date.getHours().toString().padStart(2, '0');
  const minutes = date.getMinutes().toString().padStart(2, '0');
  const seconds = date.getSeconds().toString().padStart(2, '0');

  let strTime = '';
  strTime += hours;
  strTime += delimiter + minutes;
  strTime += delimiter + seconds;

  return strTime;
};

/**
 * @name gfn_getDateTime
 * @description 현재 시간을 "YYYY-MM-DD HH:MM:SS" 형식의 문자열로 반환
 * @returns {string}
 */
export const gfn_getDateTime = (): string => {
  const date = new Date();
  const year = date.getFullYear();
  const month = (date.getMonth() + 1).toString().padStart(2, '0');
  const day = date.getDate().toString().padStart(2, '0');
  const hours = date.getHours().toString().padStart(2, '0');
  const minutes = date.getMinutes().toString().padStart(2, '0');
  const seconds = date.getSeconds().toString().padStart(2, '0');

  let strDateTime = '';
  strDateTime += year;
  strDateTime += '-' + month;
  strDateTime += '-' + day;
  strDateTime += ' ' + hours;
  strDateTime += ':' + minutes;
  strDateTime += ':' + seconds;

  return strDateTime;
};
