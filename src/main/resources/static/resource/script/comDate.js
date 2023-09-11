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
 * @name
 * @description
 * @param {Date} date
 * @param {String} delimiter
 * @function
 * @returns
 */
const gfn_dateFirstYmd = function(date, delimiter = "") {

    let year  = date.getFullYear();
    let month = date.getMonth();

	let firstYmd = new Date(year, month, 1);
	let yearFirst = firstYmd.getFullYear();
	let monthFirst = ('0' + (firstYmd.getMonth() + 1)).slice(-2);
	let day   = ('0' + firstYmd.getDate()).slice(-2);

	let strYmd = "";
	strYmd += yearFirst;
	strYmd += delimiter + monthFirst;
	strYmd += delimiter + day;

	return strYmd;
}