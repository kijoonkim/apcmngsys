'use strict';

/**
 * @description APC별 등급관련 전역함수
 */

const URL_APC_STD_GRDS = "/am/cmns/apcStdGrds";				//	APC 표준등급
const URL_APC_STD_GRD_DTLS = "/am/cmns/apcStdGrdDtls";		//	APC 표준등급상세
const URL_APC_STD_GRD_JGMTS = "/am/cmns/apcStdGrdJgmts";	//	APC 판정등급

const _JGMT_TYPE_VAL = "VAL";	// 값
const _JGMT_TYPE_UEL = "UEL";	// 이상 미만
const _JGMT_TYPE_ULE = "ULE";	// 초과 이하
const _JGMT_TYPE_UELE = "UELE";	// 이상 이하
const _JGMT_TYPE_UL = "UL";		// 초과 미만

const _GRD_SE_CD_WRHS = "01";
const _GRD_SE_CD_SORT = "02";
const _GRD_SE_CD_GDS = "03";

/**
 * @name gfn_getStdGrds
 * @description APC별 등급종류
 * @param {String} _apcCd
 * @param {String} _grdSeCd
 * @param {String} _itemCd
 * @function
 * @returns
 */
const gfn_getStdGrds = async function(_apcCd, _grdSeCd, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_APC_STD_GRDS, {apcCd: _apcCd, grdSeCd: _grdSeCd, itemCd: _itemCd, delYn : "N"}, null, true);
	const data = await postJsonPromise;
	return data.resultList;
}

/**
 * @name gfn_getStdGrdDtls
 * @description APC별 등급종류
 * @param {String} _apcCd
 * @param {String} _grdSeCd
 * @param {String} _itemCd
 * @function
 * @returns
 */
const gfn_getStdGrdDtls = async function(_apcCd, _grdSeCd, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_APC_STD_GRD_DTLS, {apcCd: _apcCd, grdSeCd: _grdSeCd, itemCd: _itemCd, delYn : "N"}, null, true);
	const data = await postJsonPromise;
	return data.resultList;
}

/**
 * @name gfn_getStdGrdJgmts
 * @description APC별 등급종류
 * @param {String} _apcCd
 * @param {String} _grdSeCd
 * @param {String} _itemCd
 * @function
 * @returns
 */
const gfn_getStdGrdJgmts = async function(_apcCd, _grdSeCd, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_APC_STD_GRD_JGMTS, {apcCd: _apcCd, grdSeCd: _grdSeCd, itemCd: _itemCd, delYn : "N"}, null, true);
	const data = await postJsonPromise;
	return data.resultList;
}

