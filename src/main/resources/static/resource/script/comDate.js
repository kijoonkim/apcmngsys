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
const gfn_monthValidation = function(_el,_month = 3){
	let targetId;
	let originId = _el.id;

	function checkRange(_id){
		const regex = /to|from/i;
		return regex.test(_id);
	}
	function changeMonths(_date, _months, _flag) {
		let year = parseInt(_date.substring(0, 4), 10);
		let month = parseInt(_date.substring(4, 6), 10) - 1;
		let day = parseInt(_date.substring(6, 8), 10);
		let result = new Date(year, month, day);

		console.log(result,"또?");
		try {
			if (_flag) {
				result.setMonth(result.getMonth() + _months);
				result = gfn_dateToYmd(result);
				console.log(result,"true");
				SBUxMethod.set(targetId,result);
				SBUxMethod.setDatepickerMaxDate(targetId,result);
				SBUxMethod.refresh(targetId);
			} else {
				result.setMonth(result.getMonth() - _months);
				result = gfn_dateToYmd(result);
				console.log(result,"false");
				SBUxMethod.set(targetId,result);
				SBUxMethod.setDatepickerMinDate(targetId,result);
				SBUxMethod.refresh(targetId);
			}
		}catch (e){
			console.log(e.toString());
		}
	}

	function setTargetid(_id) {
		let checkFrom = _id.endsWith("From");
		let checkTo = _id.endsWith("To");

		if (checkFrom || checkTo) {
			if (checkTo) {
				return _id.slice(0, _id.lastIndexOf("To")) + "From";
			} else if (checkFrom) {
				return _id.slice(0, _id.lastIndexOf("From")) + "To";
			}
		} else {
			return _id;
		}
	}

	if(checkRange(originId)){
		targetId = setTargetid(originId);

		let targetValue = SBUxMethod.get(targetId);
		let addMinus = false;

		if(!gfn_isEmpty(targetValue)){
			addMinus = targetId.includes("To");
			changeMonths(targetValue,_month,addMinus);
		}
	}else{
		return;
	}
}












