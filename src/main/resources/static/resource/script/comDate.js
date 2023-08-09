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