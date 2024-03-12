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
	const postJsonPromise = gfn_postJSON(
								URL_APC_STD_GRDS,
								{
									apcCd: _apcCd, 
									grdSeCd: _grdSeCd, 
									itemCd: _itemCd, 
									delYn : "N"
								}, 
								null, 
								true
							);
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
	const postJsonPromise = gfn_postJSON(
								URL_APC_STD_GRD_DTLS, 
								{
									apcCd: _apcCd, 
									grdSeCd: _grdSeCd, 
									itemCd: _itemCd,
									delYn : "N"
								}, 
								null, 
								true
							);
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
	const postJsonPromise = gfn_postJSON(
								URL_APC_STD_GRD_JGMTS, 
								{
									apcCd: _apcCd, 
									grdSeCd: _grdSeCd, 
									itemCd: _itemCd, 
									delYn : "N"
								}, 
								null, 
								true
							);
	const data = await postJsonPromise;
	return data.resultList;
}

/** 등급 json */
var gjsonStdGrdObjKnd = [];
var gjsonStdGrdObjJgmt = [];
var gjsonStdGrdObjDtl = [];
var gjsonStdGrdObj_1 = [];
var gjsonStdGrdObj_2 = [];
var gjsonStdGrdObj_3 = [];
var gjsonStdGrdObj_4 = [];
var gjsonStdGrdObj_5 = [];


var gjsonExtGrdObjKnd = [];
var gjsonExtGrdObjJgmt = [];
var gjsonExtGrdObjDtl = [];
var gjsonExtGrdObj_1 = [];
var gjsonExtGrdObj_2 = [];
var gjsonExtGrdObj_3 = [];
var gjsonExtGrdObj_4 = [];
var gjsonExtGrdObj_5 = [];

const gStdGrdObj = {
		idList: ['1', '2', '3', '4', '5'],
		jsonPrefix: "gjsonStdGrdObj_",
		jsonExtPrefix: "gjsonExtGrdObj_",
		jgmtJsonId: "gjsonStdGrdObjJgmt",
		jgmtExtJsonId: "gjsonExtGrdObjJgmt",
		colPrfx: 'std__',
		colPrfxQntt: 'qntt__',
		colPrfxWght: 'wght__',
		colExtPrfx: 'ext__',
		param: {apcCd: null, grdSeCd: null, itemCd: null, vrtyCd: null},
		init: async function(_apcCd, _grdSeCd, _itemCd, _vrtyCd) {

			this.param.apcCd = _apcCd;
			this.param.grdSeCd = _grdSeCd;
			this.param.itemCd = _itemCd;
			this.param.vrtyCd = _vrtyCd;

			gjsonStdGrdObjKnd.length = 0;

			if (gfn_isEmpty(_itemCd)) {
				return;
			}

			let rslt = await Promise.all([
				gfn_getStdGrds(_apcCd, _grdSeCd, _itemCd),
				gfn_getStdGrdJgmts(_apcCd, _grdSeCd, _itemCd),
				gfn_getStdGrdDtls(_apcCd, _grdSeCd, _itemCd)
		 	]);

			const jsonTempKnds = rslt[0];
			gjsonStdGrdObjJgmt = rslt[1];
			gjsonStdGrdObjDtl = rslt[2];

            if (jsonTempKnds.length > 0) {
                jsonTempKnds.forEach((item, index) => {
					if (index >= 5) return false;

					const id = this.idList[index];
					const knd = {
							itemCd: item.itemCd,
							itemNm: item.itemNm,
							grdKnd: item.grdKnd,
							grdKndNm: item.grdKndNm,
							adtnRt: item.adtnRt,
							stdGrdType: item.stdGrdType,
							grdId: id,
							jsonId: this.jsonPrefix + id
						}

                    gjsonStdGrdObjKnd.push(knd);

                    let jsonObj = this.getGrdJson(id);
					jsonObj.length = 0;
					
					const dtls = gfn_getJsonFilter(gjsonStdGrdObjDtl, "grdKnd", item.grdKnd);
					dtls.forEach((dtl) => {
						if (_.isEqual("VR", item.stdGrdType) && !gfn_isEmpty(_vrtyCd)) {
							if (gfn_isEmpty(dtl.vrtyCd) || _.isEqual(_vrtyCd, dtl.vrtyCd)) {
								jsonObj.push(dtl);
							}
						} else {
							jsonObj.push(dtl);	
						}
					});
				});
			}
			
			
			// 선별등급의 경우 상품등급 추가 세팅
			if (_.isEqual(_grdSeCd, _GRD_SE_CD_SORT)) {
				
				gjsonExtGrdObjKnd.length = 0;
				gjsonExtGrdObjJgmt.length = 0;
				gjsonExtGrdObjDtl.length = 0;
				
				rslt = await Promise.all([
					gfn_getStdGrds(_apcCd, _GRD_SE_CD_GDS, _itemCd),
					gfn_getStdGrdJgmts(_apcCd, _GRD_SE_CD_GDS, _itemCd),
					gfn_getStdGrdDtls(_apcCd, _GRD_SE_CD_GDS, _itemCd)
			 	]);
				
				const _jsonKndTemp = rslt[0];
				gjsonExtGrdObjJgmt = rslt[1];
				gjsonExtGrdObjDtl = rslt[2];
				
				if (_jsonKndTemp.length > 0) {
					_jsonKndTemp.forEach((item, index) => {
						if (index >= 5) return false;
	
						const id = this.idList[index];
						const knd = {
								itemCd: item.itemCd,
								itemNm: item.itemNm,
								grdKnd: item.grdKnd,
								grdKndNm: item.grdKndNm,
								adtnRt: item.adtnRt,
								stdGrdType: item.stdGrdType,
								grdId: id,
								jsonId: this.jsonPrefix + id
							}
	
						gjsonExtGrdObjKnd.push(knd);
	
						let jsonObj = this.getExtJson(id);
						jsonObj.length = 0;
						
						const dtls = gfn_getJsonFilter(gjsonExtGrdObjDtl, "grdKnd", item.grdKnd);
						dtls.forEach((item) => {
							jsonObj.push(item);
						});
						
					});
				}
				//console.log(gjsonExtGrdObjKnd);
			}
		},
		getGrdJson: function(id) {
			switch (id) {
				case '1': return gjsonStdGrdObj_1;
				case '2': return gjsonStdGrdObj_2;
				case '3': return gjsonStdGrdObj_3;
				case '4': return gjsonStdGrdObj_4;
				case '5': return gjsonStdGrdObj_5;
				default: return null;
			}
		},
		getExtJson: function(id) {
			switch (id) {
				case '1': return gjsonExtGrdObj_1;
				case '2': return gjsonExtGrdObj_2;
				case '3': return gjsonExtGrdObj_3;
				case '4': return gjsonExtGrdObj_4;
				case '5': return gjsonExtGrdObj_5;
				default: return null;
			}
		},
		getJgmtGrdCd: function(_stdGrdInfo) {

			if (gfn_isEmpty(_stdGrdInfo)) {
				return null;
			}
			if (!Array.isArray(_stdGrdInfo)) {
				return null;
			}
			if (_stdGrdInfo.length === 0) {
				return null;
			}

			if (gjsonStdGrdObjJgmt.length == 0) {
				return _stdGrdInfo[0];
			}

			let jgmtGrdVl = 0;
			gjsonStdGrdObjKnd.forEach((item, index) => {
				const id = this.idList[index];
				let grdCd = _stdGrdInfo[index];
				let jsonObj = this.getGrdJson(id);

				let grdDtlInfo = _.find(jsonObj, {grdKnd: item.grdKnd, grdCd: grdCd});

				if (!gfn_isEmpty(grdDtlInfo)) {
					jgmtGrdVl += parseInt(grdDtlInfo.grdVl) || 0;
				}
			});

			let jgmtGrdCd = "";
			let jgmtGrdNm = "";

			gjsonStdGrdObjJgmt.forEach((item) => {

				let jgmtMinVl = parseInt(item.jgmtMinVl) || 0;
				let jgmtMaxVl = parseInt(item.jgmtMaxVl) || 9999999999;

				switch (item.jgmtType) {
					case _JGMT_TYPE_VAL:	// 값
						if (jgmtGrdVl === jgmtMinVl) {
							jgmtGrdCd = item.grdCd;
							jgmtGrdNm = item.grdNm;
						}
						return false;
					case _JGMT_TYPE_UEL:	// 이상 미만
						if (jgmtGrdVl >= jgmtMinVl && jgmtGrdVl < jgmtMaxVl) {
							jgmtGrdCd = item.grdCd;
							jgmtGrdNm = item.grdNm;
						}
						return false;
					case _JGMT_TYPE_ULE:	// 초과 이하
						if (jgmtGrdVl > jgmtMinVl && jgmtGrdVl <= jgmtMaxVl) {
							jgmtGrdCd = item.grdCd;
							jgmtGrdNm = item.grdNm;
						}
						return false;
					case _JGMT_TYPE_UELE:	// 이상 이하
						if (jgmtGrdVl >= jgmtMinVl && jgmtGrdVl <= jgmtMaxVl) {
							jgmtGrdCd = item.grdCd;
							jgmtGrdNm = item.grdNm;
						}
						return false;
					case _JGMT_TYPE_UL:		// 초과 미만
						if (jgmtGrdVl > jgmtMinVl && jgmtGrdVl < jgmtMaxVl) {
							jgmtGrdCd = item.grdCd;
							jgmtGrdNm = item.grdNm;
						}
						return false;
					default:
						break;
				}
			});

			return jgmtGrdCd;
		},
}
