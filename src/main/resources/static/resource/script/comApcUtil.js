'use strict';

/**
 * @description APC별 공통함수
 */


let gv_apcStng;

const gfn_getApcStng = async function(_apcCd) {
	
	try{
		const postJsonPromise = gfn_postJSON("/am/apc/selectApcEvrmntStng.do", {apcCd : _apcCd});
		let data = await postJsonPromise;
		if (_.isEqual("S", data.resultStatus)) {
			gv_apcStng = data.resultMap;
		} else {
			gv_apcStng = null;
		}
	} catch(e) {
		gv_apcStng = null;
	} finally {
		return gv_apcStng;
	}
}

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
	return Math.floor(_qntt);
}

