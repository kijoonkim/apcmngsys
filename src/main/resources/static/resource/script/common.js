'use strict'
/**
 *
 */

/**
 * js constant
 */

/** URL
 * 품목, 품종, 규격, 등급
 * APC 품목, 품종, 규격, 등급
 * 거래처
 * 상품
 * 팔레트/박스
 * 생산자
 * 입고차량
 */

const URL_COM_CDS 			= "/co/cd/comCdDtls";		// 공통코드

const URL_MST_ITEMS 		= "/am/cmns/cmnsItems";		//	품목 마스터
const URL_MST_VRTYS 		= "/am/cmns/cmnsVrtys";		//	품종 마스터
const URL_MST_SPCFCTS 		= "/am/cmns/cmnsSpcfcts";	//	규격 마스터
const URL_MST_GRDS 			= "/am/cmns/cmnsGrds";		//	등급 마스터

const URL_APC_ITEMS 		= "/am/cmns/apcItems";		//	APC 품목
const URL_APC_VRTYS 		= "/am/cmns/apcVrtys";		//	APC 품종
const URL_APC_SPCFCTS 		= "/am/cmns/apcSpcfcts";	//	APC 규격
const URL_APC_GRDS 			= "/am/cmns/apcGrds";		//	APC 등급

const URL_CNPT_INFO			= "/am/cmns/cnptInfos";		//	거래처
const URL_GDS_INFO			= "/am/cmns/gdsInfos";		//	상품
const URL_PLT_BX_INFO		= "/am/cmns/pltBxInfos";	//	팔레트/박스
const URL_PRDCR_INFO		= "/am/cmns/prdcrInfos";	//	생산자
const URL_WRHS_VHCL			= "/am/cmns/wrhsVhcls";		//	입고차량
const URL_TRSPRT_CO_INFO	= "/am/spmt/spmtTrsprts";	//	운송사
const URL_TRSPRT_CST_INFO	= "/am/cmns/trsprtCsts";	//	운송지역
const URL_SPMT_PCKG_UINT	= "/am/cmns/spmtPckgUnits";	//	출하포장단위
/** END URL
 */

/**
 * @type {string}
 * @description blank string
 */
const STR_BLANK = "";

/**
 * @type {object}
 * @description default header
 */
const postHeaders = {
    "Content-Type": "application/json"
}

/**
 * global variable
 */
/**
 * @type {string}
 */
let gv_selectedApcCd = null;
let gv_selectedApcNm = null;

const gv_loadingOptions = {modelNm : "main-loading"};


/**
 * @description
 */


/**
 * global function
 */

/**
 * @name gfn_setSysPrgrmId
 * @description set post header programId
 * @function
 * @param {string} sysPrgrmId
 */
const gfn_setSysPrgrmId = function(sysPrgrmId) {
    postHeaders.sysPrgrmId = sysPrgrmId
}


/**
 * @name gfn_postJSON
 * @description async post by json
 * @function
 * @param {string} _url
 * @param {object} _param
 * @param {[string]} _sysPrgrmId
 * @param {[boolean]} _hideProgress
 * @returns {any}
 */
async function gfn_postJSON(_url, _param, _sysPrgrmId, _hideProgress) {

	const showProgress = !_hideProgress;
    const header = {
        "Content-Type": "application/json",
        "sysPrgrmId": postHeaders.sysPrgrmId
    }

    if (_sysPrgrmId) {
        header.sysPrgrmId = _sysPrgrmId;
    }

    try {

		let startTime = new Date();
		if (showProgress && typeof SBUxMethod === 'function') {
			SBUxMethod.openProgress(gv_loadingOptions);
		}

        const response = await fetch(
            _url, {
                method: "POST",
                headers: header,
                body: JSON.stringify(_param),
            }
        );

		const result = await response.json();

		if (showProgress && typeof SBUxMethod === 'function') {
			const endTime = new Date();
			if (endTime.getTime() > startTime + 500) {
				SBUxMethod.closeProgress(gv_loadingOptions);
			} else {
				setTimeout(function() {
			  		SBUxMethod.closeProgress(gv_loadingOptions);
				}, 500);
			}
		}

		return result;

	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}

		if (showProgress && typeof SBUxMethod === 'function') {
			SBUxMethod.closeProgress(gv_loadingOptions);
		}
		console.error("failed", e);
		console.error("failed", e.message);
	}
}


/**
 * @name gfn_getComCdDtls
 * @description 공통코드 상세 리스트 가져오기
 * @function
 * @param {string} _cdId	- 공통코드
 * @param {string} _apcCd	- APC코드
 * @returns {any[]}
 */
async function gfn_getComCdDtls (_cdId, _apcCd = "0000") {
	const postJsonPromise = gfn_postJSON(URL_COM_CDS, {cdId: _cdId, apcCd: _apcCd}, null, true);
	const data = await postJsonPromise;
	return data.resultList;
}

/**
 * @name gfn_setComCdSBSelect
 * @description sbux-select 데이터 설정
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {string} _cdId
 * @param {string} _apcCd
 * @returns {void}
 */
async function gfn_setComCdSBSelect(_targetIds, _jsondataRef, _cdId, _apcCd) {

	if (gfn_isEmpty(_cdId)) {
		return;
	}

	const postJsonPromise = gfn_postJSON(URL_COM_CDS, {cdId: _cdId, apcCd: _apcCd}, null, true);
	const data = await postJsonPromise;

	try {
		_jsondataRef.length = 0;
		data.resultList.forEach((item) => {
			const cdVl = {
				text: item.cdVlNm,
				label: item.cdVlNm,
				value: item.cdVl
			}
			_jsondataRef.push(cdVl);
		});

		if (Array.isArray(_targetIds)) {
			_targetIds.forEach((_targetId) => {
				SBUxMethod.refresh(_targetId);
			});
		} else {
			SBUxMethod.refresh(_targetIds);
		}

	} catch (e) {

	}
}

/**
 * @name gfn_setComCdGridSelect
 * @description sbgrid-select 데이터 설정
 * @function
 * @param {string} _gridId
 * @param {any[]} _jsondataRef
 * @param {string} _cdId
 * @param {string} _apcCd
 * @returns {void}
 */
async function gfn_setComCdGridSelect(_gridId, _jsondataRef, _cdId, _apcCd) {

	if (gfn_isEmpty(_cdId)) {
		return;
	}

	const postJsonPromise = gfn_postJSON(URL_COM_CDS, {cdId: _cdId, apcCd: _apcCd}, null, true);
	const data = await postJsonPromise;

	try {
		_jsondataRef.length = 0;
		data.resultList.forEach((item) => {
			const cdVl = {
				label: item.cdVlNm,
				value: item.cdVl
			}
			_jsondataRef.push(cdVl);
		});
		SBUxMethod.refresh(_gridId);
	} catch (e) {
	}
}


/**
 * @name gfn_setSBSelectJson
 * @description set SBUX-select options by jsonData
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {any[]} _sourceJson
 */
const gfn_setSBSelectJson = function (_targetIds, _jsondataRef, _sourceJson) {

	if (gfn_isEmpty(_targetIds)) {
		return;
	}

	try {
		_jsondataRef.length = 0;
		_sourceJson.forEach((item) => {

			const tempItem = {
				text: item.cmnsNm,
				label: item.cmnsNm,
				value: item.cmnsCd,
				mastervalue  : item.mastervalue
			}
			/*
			item.text = item.cmnsNm;
			item.label = item.cmnsNm;
			item.value = item.cmnsCd;
			item.mastervalue = item.mastervalue;
			 */
			_jsondataRef.push(tempItem);
		});

		if (Array.isArray(_targetIds)) {
			_targetIds.forEach((_targetId) => {
				SBUxMethod.refresh(_targetId);
			});
		} else {
			SBUxMethod.refresh(_targetIds);
		}
	} catch (e) {
	}
}

/**
 * @name gfn_getMstItem
 * @description  품목 마스터 목록 가져오기
 * @function
 * @returns {any[]}
 */
async function gfn_getMstItem () {
	const postJsonPromise = gfn_postJSON(URL_MST_ITEMS, {delYn: "N"}, null, true);
	const data = await postJsonPromise;
	return data.resultList;
}

/**
 * @name gfn_setMstItemSBSelect
 * @description set SBUX-select options from 품목 마스터
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 */
const gfn_setMstItemSBSelect = async function (_targetIds, _jsondataRef) {
	const postJsonPromise = gfn_postJSON(URL_MST_ITEMS, {delYn: "N"}, null, true);
	const data = await postJsonPromise;

	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd = item.itemCd;
			item.cmnsNm = item.itemNm;
			sourceJson.push(item);
		});

	gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
}

/**
 * @name gfn_getMstVrty
 * @description  품종 마스터 목록 가져오기
 * @function
 * @param {string} _itemCd	품목코드
 * @returns {any[]}
 */
async function gfn_getMstVrty (_itemCd) {
	const postJsonPromise = gfn_postJSON(URL_MST_VRTYS, {itemCd: _itemCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;
	return data.resultList;
}

/**
 * @name gfn_setMstVrtySBSelect
 * @description set SBUX-select options from 품종 마스터
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {string} _itemCd	품목코드
 */
const gfn_setMstVrtySBSelect = async function (_targetIds, _jsondataRef, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_MST_VRTYS, {itemCd: _itemCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;

	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd = item.vrtyCd;
			item.cmnsNm = item.vrtyNm;
			sourceJson.push(item);
		});

	gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
}

/**
 * @name gfn_getMstSpcfcts
 * @description  규격 마스터 목록 가져오기
 * @function
 * @param {string} _itemCd	품목코드
 * @returns {any[]}
 */
async function gfn_getMstSpcfcts (_itemCd) {
	const postJsonPromise = gfn_postJSON(URL_MST_SPCFCTS, {itemCd: _itemCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;
	return data.resultList;
}

/**
 * @name gfn_setMstSpcfctsSBSelect
 * @description set SBUX-select options from 규격 마스터
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {string} _itemCd	품목코드
 */
const gfn_setMstSpcfctsSBSelect = async function (_targetIds, _jsondataRef, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_MST_SPCFCTS, {itemCd: _itemCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;

	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd = item.spcfctCd;
			item.cmnsNm = item.spcfctNm;
			sourceJson.push(item);
		});

	gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
}

/**
 * @name gfn_getMstGrds
 * @description  등급 마스터 목록 가져오기
 * @function
 * @param {string} _itemCd	품목코드
 * @returns {any[]}
 */
async function gfn_getMstGrds (_itemCd) {
	const postJsonPromise = gfn_postJSON(URL_MST_GRDS, {itemCd: _itemCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;
	return data.resultList;
}

/**
 * @name gfn_setMstGrdsSBSelect
 * @description set SBUX-select options from 등급 마스터
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {string} _itemCd	품목코드
 */
const gfn_setMstGrdsSBSelect = async function (_targetIds, _jsondataRef, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_MST_GRDS, {itemCd: _itemCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;

	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd = item.grdCd;
			item.cmnsNm = item.grdNm;
			sourceJson.push(item);
		});

	gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
}



/**
 * @name gfn_getApcItem
 * @description  APC 품목 목록 가져오기
 * @function
 * @param {string} _apcCd	- APC코드
 * @returns {any[]}
 */
async function gfn_getApcItem (_apcCd) {
	const postJsonPromise = gfn_postJSON(URL_APC_ITEMS, {apcCd: _apcCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;
	return data.resultList;
}

/**
 * @name gfn_setApcItemSBSelect
 * @description set SBUX-select options from APC 품목
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {string} _apcCd
 */
const gfn_setApcItemSBSelect = async function (_targetIds, _jsondataRef, _apcCd) {
	const postJsonPromise = gfn_postJSON(URL_APC_ITEMS, {apcCd: _apcCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;

	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd = item.itemCd;
			item.cmnsNm = item.itemNm;
			sourceJson.push(item);
		});

	gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
}

/**
 * @name gfn_getApcVrty
 * @description  APC 품종 목록 가져오기
 * @function
 * @param {string} _apcCd	APC코드
 * @param {string} _itemCd	품목코드
 * @returns {any[]}
 */
async function gfn_getApcVrty (_apcCd, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_APC_VRTYS, {apcCd: _apcCd, itemCd: _itemCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;
	return data.resultList;
}

/**
 * @name gfn_setApcVrtySBSelect
 * @description set SBUX-select options from APC 품종
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {string} _apcCd	APC코드
 * @param {string} _itemCd	품목코드
 */
const gfn_setApcVrtySBSelect = async function (_targetIds, _jsondataRef, _apcCd, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_APC_VRTYS, {apcCd: _apcCd, itemCd: _itemCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;

	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd 		= item.vrtyCd;
			item.cmnsNm 		= item.vrtyNm;
			item.mastervalue 	= item.itemCd;
			sourceJson.push(item);
		});

	gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
}


/**
 * @name gfn_getApcSpcfcts
 * @description  APC 규격 목록 가져오기
 * @function
 * @param {string} _apcCd	APC코드
 * @param {string} _itemCd	품목코드
 * @returns {any[]}
 */
async function gfn_getApcSpcfcts (_apcCd, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_APC_SPCFCTS, {apcCd: _apcCd, itemCd: _itemCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;
	return data.resultList;
}

/**
 * @name gfn_setApcSpcfctsSBSelect
 * @description set SBUX-select options from APC 규격
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {string} _apcCd	APC코드
 * @param {string} _itemCd	품목코드
 */
const gfn_setApcSpcfctsSBSelect = async function (_targetIds, _jsondataRef, _apcCd, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_APC_SPCFCTS, {apcCd: _apcCd, itemCd: _itemCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;

	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd 		= item.spcfctCd;
			item.cmnsNm		 	= item.spcfctNm;
			item.mastervalue 	= item.itemCd;
			sourceJson.push(item);
		});

	gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
}

/**
 * @name gfn_getApcGrds
 * @description  APC 등급 목록 가져오기
 * @function
 * @param {string} _apcCd	APC코드
 * @param {string} _itemCd	품목코드
 * @returns {any[]}
 */
async function gfn_getApcGrds (_apcCd, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_APC_GRDS, {apcCd: _apcCd, itemCd: _itemCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;
	return data.resultList;
}

/**
 * @name gfn_setApcGrdsSBSelect
 * @description set SBUX-select options from APC 등급
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {string} _apcCd	APC코드
 * @param {string} _itemCd	품목코드
 */
const gfn_setApcGrdsSBSelect = async function (_targetIds, _jsondataRef, _apcCd, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_APC_GRDS, {apcCd: _apcCd, itemCd: _itemCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;

	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd 		= item.grdCd;
			item.cmnsNm 		= item.grdNm;
			item.mastervalue 	= item.itemCd
			sourceJson.push(item);
		});

	gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
}

/** 팔레트/박스 */
/**
 * @name gfn_getPltBxs
 * @description  APC별 팔레트/박스 목록 가져오기
 * @function
 * @param {string} _apcCd		APC코드
 * @param {string} _pltBxSeCd	팔레트/박스 구분코드
 * @returns {any[]}
 */
async function gfn_getPltBxs (_apcCd, _pltBxSeCd) {
	const postJsonPromise = gfn_postJSON(URL_PLT_BX_INFO, {apcCd: _apcCd, pltBxSeCd: _pltBxSeCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;
	return data.resultList;
}

/**
 * @name gfn_setPltBxSBSelect
 * @description set SBUX-select options from APC별 팔레트/박스
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {string} _apcCd	APC코드
 * @param {string} _pltBxSeCd	팔레트/박스 구분코드
 */
const gfn_setPltBxSBSelect = async function (_targetIds, _jsondataRef, _apcCd, _pltBxSeCd) {
	const postJsonPromise = gfn_postJSON(URL_PLT_BX_INFO, {apcCd: _apcCd, pltBxSeCd: _pltBxSeCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;

	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd = item.pltBxCd;
			item.cmnsNm = item.pltBxNm;
			sourceJson.push(item);
		});

	gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
}

/**
 * @name gfn_setTrsprtRgnSBSelect
 * @description set SBUX-select options from APC별 운송지역
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {string} _apcCd	APC코드
 */
const gfn_setTrsprtRgnSBSelect = async function (_targetIds, _jsondataRef, _apcCd) {
	const postJsonPromise = gfn_postJSON(URL_TRSPRT_CST_INFO, {apcCd: _apcCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;

	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd = item.trsprtRgnCd;
			item.cmnsNm = item.trsprtRgnNm;
			sourceJson.push(item);
		});

	gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
}

/** 운송사 */
/**
 * @name gfn_setTrsprtsSBSelect
 * @description set SBUX-select options from APC별 운송사
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {string} _apcCd	APC코드
 */
const gfn_setTrsprtsSBSelect = async function (_targetIds, _jsondataRef, _apcCd) {
	const postJsonPromise = gfn_postJSON(URL_TRSPRT_CO_INFO, {apcCd: _apcCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;

	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd = item.trsprtCoCd;
			item.cmnsNm = item.trsprtCoNm;
			sourceJson.push(item);
		});

	gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
}
/** 출하포장단위 */
/**
 * @name gfn_setSpmtPckgUnitSBSelect
 * @description set SBUX-select options from APC별 출하포장단위
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {string} _apcCd	APC코드
 * @param {string} _itemCd	품목코드
 * @param {string} _vrtyCd	품종코드
 */
const gfn_setSpmtPckgUnitSBSelect = async function (_targetIds, _jsondataRef, _apcCd, _itemCd, _vrtyCd) {
	const postJsonPromise = gfn_postJSON(URL_SPMT_PCKG_UINT, {apcCd : _apcCd, itemCd : _itemCd, vrtyCd : _vrtyCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;

	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd 		= item.spmtPckgUnitCd;
			item.cmnsNm 		= item.spmtPckgUnitNm;
			item.mastervalue 	= item.itemCd;
			sourceJson.push(item);
		});
	gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
}
/** 생산자정보 */
/**
 * @name gfn_getPrdcrs
 * @description  APC별 생산자 목록 가져오기
 * @function
 * @param {string} _apcCd		APC코드
 * @returns {any[]}
 */
const gfn_getPrdcrs = async function(_apcCd) {
	const postJsonPromise = gfn_postJSON(URL_PRDCR_INFO, {apcCd: _apcCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;
	const sourceJson = [];
	data.resultList.forEach((item) => {
			sourceJson.push({
				prdcrCd: item.prdcrCd,
				prdcrNm: item.prdcrNm,
				prdcrFrstNm: item.prdcrFrstNm,
				rprsVrtyCd: item.rprsItemCd,
				rprsVrtyCd: item.rprsVrtyCd,
				wrhsSeCd: item.wrhsSeCd,
				gdsSeCd: item.gdsSeCd,
				trsprtSeCd: item.trsprtSeCd,
				vhclno: item.vhclno,
				name:item.prdcrNm,
				value:item.prdcrCd
			});
		});
	return sourceJson;
}

/** 초성검색 */
/**
 * @name gfn_getFrst
 * @description  APC별 생산자 목록 가져오기
 * @function
 * @param {string} _prdcrNm		생산자이름
 * @param {any[]} _jsondata
 * @param {any[]} _jsondataRef
 * @returns {any[]}
 */
const gfn_getFrst = function(_prdcrNm, _jsondata, _jsondataRef ) {

	var arr = [];
	// object 에 초성필드 추가 {name:"홍길동", diassembled:"ㅎㄱㄷ"}
    _jsondata.forEach(function (item) {
        var dis = Hangul.disassemble(item.name, true);
        var cho = dis.reduce(function (prev, elem) {
            elem = elem[0] ? elem[0] : elem;
            return prev + elem;
        }, "");
        item.diassembled = cho;
    });

    var result = Hangul.disassemble(_prdcrNm).join("");  // ㄺ=>ㄹㄱ

 	// 문자열 검색 || 초성검색
    _jsondata.filter(function (item) {
        return item.name.includes(_prdcrNm) || item.diassembled.includes(result);
    }).forEach(function (item) { // 검색결과 ul 아래에 li 로 추가
    	var pushDate = {'name': item.name, 'value': item.value}
    	arr.push(pushDate);
    });
    _jsondataRef = arr;
	return _jsondataRef;
}

/**
 * @name gfn_setFrst
 * @description  초성필드 생성
 * @function
 * @param {any[]} _jsonSource
 * @returns {any[]}
 */
const gfn_setFrst = function(_jsonSource) {

	var _jsonTarget = [];
	// object 에 초성필드 추가 {name:"홍길동", diassembled:"ㅎㄱㄷ"}
    _jsonSource.forEach(function (item) {
        var dis = Hangul.disassemble(item.name, true);
        var cho = dis.reduce(function (prev, elem) {
            elem = elem[0] ? elem[0] : elem;
            return prev + elem;
        }, "");
        item.diassembled = cho;
		_jsonTarget.push(item);
    });
	return _jsonTarget;
}

/**
 * @name gfn_filterFrst
 * @description  생산자 목록 초성검색
 * @function
 * @param {string} _prdcrNm		생산자이름
 * @param {any[]} _jsonSource
 * @returns {any[]}
 */
const gfn_filterFrst = function(_prdcrNm, _jsonSource) {

	var _jsonTarget = [];
    var result = Hangul.disassemble(_prdcrNm).join("");  // ㄺ=>ㄹㄱ

 	// 문자열 검색 || 초성검색
    _jsonSource.filter(function (item) {
        return item.name.includes(_prdcrNm) || item.diassembled.includes(result);
    }).forEach(function (item) { // 검색결과 ul 아래에 li 로 추가
    	_jsonTarget.push({
			'name': item.name,
			'value': item.value
		});
    });

	return _jsonTarget;
}

/**
 * @name gfn_setPrdcrSBSelect
 * @description set SBUX-select options from APC별 생산자
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 * @param {string} _apcCd	APC코드
 */
const gfn_setPrdcrSBSelect = async function (_targetIds, _jsondataRef, _apcCd, _pltBxSeCd) {
	const postJsonPromise = gfn_postJSON(URL_PRDCR_INFO, {apcCd: _apcCd, delYn: "N"}, null, true);
	const data = await postJsonPromise;

	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd = item.pltBxCd;
			item.cmnsNm = item.pltBxNm;
			sourceJson.push(item);
		});

	gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
}




/**
 * utility
 */

/**
 * @name gfn_isEmpty
 * @description 빈값 체크 함수
 * @function
 * @param {any} obj
 * @return {boolean}
 */
const gfn_isEmpty = function (obj) {

    if (typeof obj == "boolean") {
        return obj;
    } else if (typeof obj == "string") {
        obj = obj.trim();
    }

    if (obj == undefined) {
        return true;
    } else if (obj == "undefined") {
        return true;
    } else if (obj == null) {
        return true;
    } else if (obj == "null") {
    	return true;
    } else if (obj == "") {
        if (typeof obj == "string" || typeof obj == "object") {
            return true;
        } else {
            return false;
        }
    } else if ("x" + obj == "xNaN") {
        return true;
    } else if (obj.length == 0) {
        return true;
    } else {
        return false;
    }
}

/**
 * @name gfn_nvl
 * @description String NVL 처리
 * @function
 * @param {string} str
 * @param {string} defaultStr
 * @return {string}
 */
const gfn_nvl = function (str, defaultStr) {

	if (gfn_isEmpty(defaultStr)) {
		defaultStr = '';
	}

    if(typeof str == "undefined" || str == undefined || str == "undefined" || str == null || str == 'null' || str == "" ) {
        str = defaultStr;
    }

    return gfn_isEmpty(str) ? defaultStr : str;
}


/**
 * @name gfn_getCookie
 * @description 주어진 이름의 쿠키를 반환
 * @description 조건에 맞는 쿠키가 없다면 undefined 를 반환
 * @function
 * @param {string} _name
 * @returns {string}
 */
const gfn_getCookie = function (_name) {

	let matches = document.cookie.match(new RegExp(
		"(?:^|; )" + _name.replace(/([\.$?*|{}\(\)\[]\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
	));

	return matches ? decodeURIComponent(matches[1]) : undefined;
}

/**
 * @name gfn_setCookie
 * @description set cookie
 * @function
 * @param {string} _name
 * @param {any} _value
 * @param {[any]} _options
 * @returns {void}
 */
const gfn_setCookie = function (_name, _value, _options = {}) {
	_options = {
		path: '/',
		// 필요한 경우, 옵션 기본값을 설정할 수도 있습니다.
		..._options
	};

	if (_options.expires instanceof Date) {
		_options.expires = _options.expires.toUTCString();
	}

	let updatedCookie = encodeURIComponent(_name) + "=" + encodeURIComponent(_value);
	for ( let optionKey in _options ) {
		updatedCookie += "; " + optionKey;
		let optionValue = _options[optionKey];
		if (optionValue !== true) {
			updatedCookie += "=" + optionValue;
		}
	}

	document.cookie = updatedCookie;
}

/**
 * @name gv_comMsgList
 * @description 공통메시지코드 정보 global variable
 */
const gv_comMsgList = [];

/**
 * @name gfn_getComMsgList
 * @description get 공통메시지
 * @function
 */
const gfn_getComMsgList = async function() {

	const comMsgPromise = gfn_postJSON("/co/msg/comMsgs", {delYn: "N"}, null, true);
	const data = await comMsgPromise;

    try {
    	gv_comMsgList.length = 0;
    	data.resultList.forEach((item) => {
			const msg = {
				msgKey: item.msgKey,
				msgCn: item.msgCn,
				rmrk: item.rmrk,
				msgKnd: item.msgKnd,
				msgKndNm: item.msgKndNm
			}
			gv_comMsgList.push(msg);
		});
	} catch (e) {
	}
}

/**
 * @name gfn_getComMsg
 * @description 공통메시지 호출
 * @function
 * @param {string} _msgKey
 * @param {string[]} _arguments
 * @returns {string}
 */
const gfn_getComMsg = function (_msgKey, ..._arguments) {

	let msgCn = gv_comMsgList.find((msg) => {
		return msg.msgKey == _msgKey;
	}).msgCn;

	if (gfn_isEmpty(msgCn)) {
		return _msgKey;
	}

	let args = Array.prototype.slice.call(arguments, 1);

	let paramList = [];
	args.forEach((item, index) => {
		if (!gfn_isEmpty(item)) {
			if (item.indexOf('||') < 0) {
				paramList.push(item);
			} else {
				let arr = item.split('||');
					arr.forEach((itm, idx) => {
					paramList.push(itm);
				});
			}
		} else {
			paramList.push(item);
		}
	});

	msgCn = msgCn.replace("\\\\", "\\");

	let msg = msgCn.replace(/{(\d+)}/g, function(match, number) {
			return typeof paramList[number] != 'undefined' ? paramList[number] : match;
		});

	// sample
	// var foo = gfn_getComMsg("I0002", "출근", "일찍");

	return msg;
}

/**
 * @name gfn_comAlert
 * @description 공통 alert
 * @function
 * @param {string} _msgKey
 * @param {string[]} _arguments
 */
const gfn_comAlert = function (_msgKey, ..._arguments) {
	let msg = gfn_getComMsg(_msgKey, _arguments);
	alert(msg);
	// return alert(gfn_getComMsg(_msgKey, _arguments));
}

/**
 * @name gfn_comConfirm
 * @description 공통 confirm
 * @function
 * @param {string} _msgKey
 * @param {string[]} _arguments
 * @returns {boolean}
 */
const gfn_comConfirm = function (_msgKey, ..._arguments) {
	return confirm(gfn_getComMsg(_msgKey, _arguments));
}


/** MODAL */
/**
 * @name gfn_closeModal
 * @description close SBModal
 * @function
 * @param {string} _modalId 	modal id
 * @param {function} _callback 	callback function
 * @param {any} _arg			argument
 */
const gfn_closeModal = function (_modalId, _callbackFnc, _arg){

	SBUxMethod.closeModal(_modalId);

	if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
		if (gfn_isEmpty(_arg)) {
			_callbackFnc();
		} else {
			_callbackFnc(_arg);
		}
	}
}

/**
 * @name gfn_getJsonFilter
 * @description 해당 조건의 json filter 적용
 * @function
 * @param {any} data
 * @param {string} key
 * @param {any} values
 * @returns
 */
const gfn_getJsonFilter = function(data, key, values) {

	if (gfn_isEmpty(data)) {
		return data;
	}

	const filteredData = data.filter((obj) => {

			if (Array.isArray(values)) {
				return values.some((val) => {
					return obj[key] === val;
				});
			} else {
				return obj[key] === values;
			}
		});

	return filteredData;
}

/**
 * @name gfn_cloneJson
 * @description JSON 객체 복사
 * @function
 * @param {any} obj
 * @returns
 */
const gfn_cloneJson = obj => JSON.parse(JSON.stringify(obj));

/**
 * 실행부
 */

	/**
	 * 공통메시지 가져오기 (페이지 로드 시)
	 */
	gfn_getComMsgList();