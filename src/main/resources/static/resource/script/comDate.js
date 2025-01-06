'use strict';

/**
 * @description 날짜 관련 공통함수
 */

/**
 * @name
 * @description
 * @param {Date} date
 * @param {String} delimiter
 * @function
 * @returns
 */
const gfn_dateToYmd = function(date, delimiter = "") {

    let year  = date.getFullYear();
    let month = ('0' + (date.getMonth() + 1)).slice(-2);
    let day   = ('0' + date.getDate()).slice(-2);

	let strYmd = "";
	strYmd += year;
	strYmd += delimiter + month;
	strYmd += delimiter + day;

	return strYmd;
}

/**
 * @description 날짜 관련 공통함수
 */

/**
 * @name gfn_dateToHms
 * @description 시각형식
 * @param {Date} date
 * @param {String} delimiter
 * @function
 * @returns
 */
const gfn_dateToHms = function(date, delimiter = "") {
	let hours = ('0' + date.getHours()).slice(-2); // 시
	let minutes = ('0' + date.getMinutes()).slice(-2);  // 분
	let seconds = ('0' + date.getSeconds()).slice(-2);  // 초
	//let milliseconds = date.getMilliseconds(); // 밀리초

	let strHms = "";
	strHms += hours;
	strHms += delimiter + minutes;
	strHms += delimiter + seconds;
console.log(strHms);
	return strHms;
}


/**
 * @name gfn_dateToYm
 * @description
 * @param {Date} date
 * @param {String} delimiter
 * @function
 * @returns
 */
const gfn_dateToYm = function(date, delimiter = "") {

    let year  = date.getFullYear();
    let month = ('0' + (date.getMonth() + 1)).slice(-2);

	let strYm = "";
	strYm += year;
	strYm += delimiter + month;

	return strYm;
}

/**
 * @name gfn_dateToYear
 * @description
 * @param {Date} date
 * @param {String} delimiter
 * @function
 * @returns
 */
const gfn_dateToYear = function(date) {

    let year  = date.getFullYear();

	return year;
}


/**
 * @name gfn_dateFirstYmd
 * @description
 * @param {Date} date
 * @param {String} delimiter
 * @function
 * @returns
 */
const gfn_dateFirstYmd = function(date, delimiter = "") {

    let year  = date.getFullYear();
    let month = date.getMonth();

	let firstDate = new Date(year, month, 1);
	return gfn_dateToYmd(firstDate, delimiter);
}

/**
 * @name gfn_dateLastYmd
 * @description
 * @param {Date} date
 * @param {String} delimiter
 * @function
 * @returns
 */
const gfn_dateLastYmd = function(date, delimiter = "") {

    let year  = date.getFullYear();
    let month = date.getMonth();

	let lastDate = new Date(year, month + 1, 0);

	return gfn_dateToYmd(lastDate, delimiter);
}

/**
 * @name gfn_diffDate
 * @description
 * @param {Date} date
 * @param {String} ymdFrom
 * @param {String} ymdTo
 * @function
 * @returns
 */
const gfn_diffDate = function(fromDate, toDate) {

	const from = new Date(fromDate.substr(0,4) + "-" + fromDate.substr(4,2) + "-" + fromDate.substr(6,2));
	const to = new Date(toDate.substr(0,4) + "-" + toDate.substr(4,2) + "-" + toDate.substr(6,2));

	const diffDate = to.getTime() - from.getTime();

	return diffDate;
}

/**
 * @name gfn_addDate
 * @description
 * @param {Date} date
 * @param {String} ymdFrom
 * @param {String} ymdTo
 * @function
 * @returns
 */
const gfn_addDate = function(fromDate,addDate) {

	const from = new Date(fromDate.substr(0,4) + "-" + fromDate.substr(4,2) + "-" + fromDate.substr(6,2));

	from.setDate(from.getDate()+addDate);
	// 원하는 형식으로 날짜를 출력
	var year = from.getFullYear();
	var month = (from.getMonth() + 1).toString().padStart(2, '0');
	var day = from.getDate().toString().padStart(2, '0');
	var newDate = `${year}${month}${day}`;

	return newDate;
}

/**
 * @name gfn_addMonth
 * @description
 * @param {String} fromYm
 * @param {String} addMonth
 * @function
 * @returns
 */
const gfn_addMonth = function(fromYm,addMonth) {

	const from = new Date(fromYm.substr(0,4) + "-" + fromYm.substr(4,2) + "-01");

	from.setMonth(from.getMonth()+addMonth);
	// 원하는 형식으로 날짜를 출력
	var year = from.getFullYear();
	var month = (from.getMonth() + 1).toString().padStart(2, '0');
	var day = from.getDate().toString().padStart(2, '0');
	var newDate = `${year}${month}${day}`;

	return newDate;
}

/**
 * @name gfn_excelSerialDateToJSDate
 * @description
 * @function
 * @returns
 */
const gfn_excelSerialDateToJSDate = function (_excelSerialDate) {
	const daysBeforeUnixEpoch = 70 * 365 + 19;
	const hour = 60 * 60 * 1000;

	return new Date(Math.round((_excelSerialDate - daysBeforeUnixEpoch) * 24 * hour) + 12 * hour);
}

/**
 * @name gfn_setDatePickerRange
 * @description 검색 조건 datePicker n개월 제한
 * datePicker ID는 반드시 카멜케이스로 할것.
 * @function
 * @returns
 */
const gfn_monthValidation = function(_current,_target,_month = 3){
	let date = SBUxMethod.get(_current);
	let flag = _current.endsWith("To");
	changeMonths(date,_month,flag);

	function changeMonths(_date, _months, _flag) {
		let year = parseInt(_date.substring(0, 4), 10);
		let month = parseInt(_date.substring(4, 6), 10) - 1;
		let day = parseInt(_date.substring(6, 8), 10);
		let result = new Date(year, month, day);
		if(_flag){
			result.setMonth(result.getMonth() - _months);
			result = gfn_dateToYmd(result);
			SBUxMethod.setDatepickerMinDate(_target,result);
		}else{
			result.setMonth(result.getMonth() + _months);
			result = gfn_dateToYmd(result);
			SBUxMethod.setDatepickerMaxDate(_target,result);
		}
	}
}

/**
 * @name
 * @description
 * @param {Date} date
 * @param {String} delimiter
 * @function
 * @returns
 */
const gfn_dateToTime = function(date, delimiter = ":") {
	let hours = ('0' + date.getHours()).slice(-2);
	let minutes = ('0' + date.getMinutes()).slice(-2);
	let seconds = ('0' + date.getSeconds()).slice(-2);

	let strTime = "";
	strTime += hours;
	strTime += delimiter + minutes;
	strTime += delimiter + seconds;

	return strTime;
}

/**
 * @name
 * @description
 * @function
 * @returns
 */
const gfn_getDateTime = function() {
	let date = new Date();
	let year  = date.getFullYear();
	let month = ('0' + (date.getMonth() + 1)).slice(-2);
	let day   = ('0' + date.getDate()).slice(-2);
	let hours = ('0' + date.getHours()).slice(-2);
	let minutes = ('0' + date.getMinutes()).slice(-2);
	let seconds = ('0' + date.getSeconds()).slice(-2);

	let strDateTime = "";
	strDateTime += year;
	strDateTime += "-" + month;
	strDateTime += "-" + day;
	strDateTime += " " + hours;
	strDateTime += ":" + minutes;
	strDateTime += ":" + seconds;

	return strDateTime;
}








