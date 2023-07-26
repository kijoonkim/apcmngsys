'use strict';
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

const URL_COM_CDS 		= "/co/cd/comCdDtls";		// 공통코드

const URL_MST_ITEMS 	= "/am/cmns/cmnsItems";		//	품목 마스터
const URL_MST_VRTYS 	= "/am/cmns/cmnsVrtys";		//	품종 마스터
const URL_MST_SPCFCTS 	= "/am/cmns/cmnsSpcfcts";	//	규격 마스터
const URL_MST_GRDS 		= "/am/cmns/cmnsGrds";		//	등급 마스터

const URL_APC_ITEMS 	= "/am/cmns/apcItems";		//	APC 품목
const URL_APC_VRTYS 	= "/am/cmns/apcVrtys";		//	APC 품종
const URL_APC_SPCFCTS 	= "/am/cmns/apcSpcfcts";	//	APC 규격
const URL_APC_GRDS 		= "/am/cmns/apcGrds";		//	APC 등급

const URL_CNPT_INFO		= "/am/cmns/cnptInfos";		//	거래처
const URL_GDS_INFO		= "/am/cmns/gdsInfos";		//	상품
const URL_PLT_BX_INFO	= "/am/cmns/pltBxInfos";	//	팔레트/박스
const TB_PRDCR_INFO		= "/am/cmns/prdcrInfos";	//	생산자
const URL_WRHS_VHCL		= "/am/cmns/wrhsVhcls";		//	입고차량
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
 * @param {[string]} sysPrgrmId
 * @returns {any}
 */
async function gfn_postJSON(_url, _param, sysPrgrmId) {
    
    const header = {
        "Content-Type": "application/json",
        "sysPrgrmId": postHeaders.sysPrgrmId
    }
    
    if (sysPrgrmId) {
        header.sysPrgrmId = sysPrgrmId;
    }
    
    try {
        const response = await fetch(
            _url, {
                method: "POST",
                headers: header,
                body: JSON.stringify(_param),
            }
        );

		const result = await response.json();
		console.log("success", result);
		return result;

	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
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
	const postJsonPromise = gfn_postJSON(URL_COM_CDS, {cdId: _cdId, apcCd: _apcCd});
	const data = await postJsonPromise;
	console.log("cdDtls", data);
	return JSON.stringify(data.resultList);
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

	const postJsonPromise = gfn_postJSON(URL_COM_CDS, {cdId: _cdId, apcCd: _apcCd});
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

	const postJsonPromise = gfn_postJSON(URL_COM_CDS, {cdId: _cdId, apcCd: _apcCd});
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
				value: item.cmnsCd
			}
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
	const postJsonPromise = gfn_postJSON(URL_MST_ITEMS, {delYn: "N"});
	const data = await postJsonPromise;
	return JSON.stringify(data.resultList);
}

/**
 * @name gfn_setMstItemSBSelect
 * @description set SBUX-select options from 품목 마스터
 * @function
 * @param {(string|string[])} _targetIds
 * @param {any[]} _jsondataRef
 */
const gfn_setMstItemSBSelect = async function (_targetIds, _jsondataRef) {
	const postJsonPromise = gfn_postJSON(URL_MST_ITEMS, {delYn: "N"});
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
	const postJsonPromise = gfn_postJSON(URL_MST_VRTYS, {itemCd: _itemCd, delYn: "N"});
	const data = await postJsonPromise;
	return JSON.stringify(data.resultList);
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
	const postJsonPromise = gfn_postJSON(URL_MST_VRTYS, {itemCd: _itemCd, delYn: "N"});
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
	const postJsonPromise = gfn_postJSON(URL_MST_SPCFCTS, {itemCd: _itemCd, delYn: "N"});
	const data = await postJsonPromise;
	return JSON.stringify(data.resultList);
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
	const postJsonPromise = gfn_postJSON(URL_MST_SPCFCTS, {itemCd: _itemCd, delYn: "N"});
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
	const postJsonPromise = gfn_postJSON(URL_MST_GRDS, {itemCd: _itemCd, delYn: "N"});
	const data = await postJsonPromise;
	return JSON.stringify(data.resultList);
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
	const postJsonPromise = gfn_postJSON(URL_MST_GRDS, {itemCd: _itemCd, delYn: "N"});
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
	const postJsonPromise = gfn_postJSON(URL_APC_ITEMS, {apcCd: _apcCd, delYn: "N"});
	const data = await postJsonPromise;
	return JSON.stringify(data.resultList);
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
	const postJsonPromise = gfn_postJSON(URL_APC_ITEMS, {apcCd: _apcCd, delYn: "N"});
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
	const postJsonPromise = gfn_postJSON(URL_APC_VRTYS, {apcCd: _apcCd, itemCd: _itemCd, delYn: "N"});
	const data = await postJsonPromise;
	return JSON.stringify(data.resultList);
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
	const postJsonPromise = gfn_postJSON(URL_APC_VRTYS, {apcCd: _apcCd, itemCd: _itemCd, delYn: "N"});
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
 * @name gfn_getApcSpcfcts
 * @description  APC 규격 목록 가져오기
 * @function
 * @param {string} _apcCd	APC코드
 * @param {string} _itemCd	품목코드
 * @returns {any[]}
 */
async function gfn_getApcSpcfcts (_apcCd, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_APC_SPCFCTS, {apcCd: _apcCd, itemCd: _itemCd, delYn: "N"});
	const data = await postJsonPromise;
	return JSON.stringify(data.resultList);
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
	const postJsonPromise = gfn_postJSON(URL_APC_SPCFCTS, {apcCd: _apcCd, itemCd: _itemCd, delYn: "N"});
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
 * @name gfn_getApcGrds
 * @description  APC 등급 목록 가져오기
 * @function
 * @param {string} _apcCd	APC코드
 * @param {string} _itemCd	품목코드
 * @returns {any[]}
 */
async function gfn_getApcGrds (_apcCd, _itemCd) {
	const postJsonPromise = gfn_postJSON(URL_APC_GRDS, {apcCd: _apcCd, itemCd: _itemCd, delYn: "N"});
	const data = await postJsonPromise;
	return JSON.stringify(data.resultList);
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
	const postJsonPromise = gfn_postJSON(URL_APC_GRDS, {apcCd: _apcCd, itemCd: _itemCd, delYn: "N"});
	const data = await postJsonPromise;
	
	const sourceJson = [];
	data.resultList.forEach((item) => {
			item.cmnsCd = item.grdCd;
			item.cmnsNm = item.grdNm;
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
	const postJsonPromise = gfn_postJSON(URL_PLT_BX_INFO, {apcCd: _apcCd, pltBxSeCd: _pltBxSeCd, delYn: "N"});
	const data = await postJsonPromise;
	return JSON.stringify(data.resultList);
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
	const postJsonPromise = gfn_postJSON(URL_PLT_BX_INFO, {apcCd: _apcCd, pltBxSeCd: _pltBxSeCd, delYn: "N"});
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

	console.log("name", _name);
	console.log("value", _value);
	console.log("options", _options);

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

	const comMsgPromise = gfn_postJSON("/co/msg/comMsgs", {delYn: "N"});
	const data = await comMsgPromise;

    try {
    	gv_comMsgList.length = 0;
    	data.resultList.forEach((item) => {
			console.log("msg", item.msgCn);
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
	msgCn = msgCn.replace("\\\\", "\\");
	console.log(msgCn);
	
	let msg = msgCn.replace(/{(\d+)}/g, function(match, number) {
			return typeof args[number] != 'undefined' ? args[number] : match;
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
	console.log(msg);
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
 * @name fn_closeModal
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
 * @param {any} value
 * @returns
 */
const gfn_getJsonFilter = function(data, key, value) {
	
	if (gfn_isEmpty(data)) {
		return data;
	}
	
	const filteredData = data.filter((obj) => {
				console.log("obj[key]", obj[key]);
				console.log("value", value);
				return obj[key] === value;
		});
		
	return filteredData;
}

/**
 * 실행부
 */

	/**
	 * 공통메시지 가져오기 (페이지 로드 시)
	 */
	gfn_getComMsgList();

