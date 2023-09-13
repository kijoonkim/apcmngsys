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

	let lastDate = new Date(year, month, 0);

	return gfn_dateToYmd(lastDate, delimiter);
}
