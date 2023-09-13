'use strict';

/**
 * @description APC별 공통함수
 */



/**
 * @name gfn_apcEstmtWght
 * @description APC별 중량 어림
 * @param {float} _wght
 * @param {String} _apcCd
 * @param {String} _param {itemCd: "", type: ""}
 * @function
 * @returns
 */
const gfn_apcEstmtWght = function(_wght, _apcCd, _param) {

	// APC별 기준 가져오기
	return Math.floor(_wght);
}

/**
 * @name gfn_apcEstmtQntt
 * @description APC별 중량 어림
 * @param {float} _qntt
 * @param {String} _apcCd
 * @param {String} _param {itemCd: "", type: ""}
 * @function
 * @returns
 */
const gfn_apcEstmtQntt = function(_qntt, _apcCd, _param) {

	// APC별 기준 가져오기
	return Math.floor(_wght);
}

