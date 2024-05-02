/**
 * 
 */

/**
 * @name gfn_getComCdRptKnd
 * @description 공통코드 리포트 정보
 * @function
 * @param {string} _cdId	- 공통코드
 * @param {string} _apcCd	- APC코드
 * @returns {any[]}
 */
const gfnma_objectToString = function (obj) {
	var res = '';
	for(key in obj){
		res += obj[key] + ',';
	}
	res = res.slice(0, -1);
	return res;
}