'use strict';
/**
 *
 */

/**
 * js constant
 */

/** 
 * @description 공통코드 url
 * @type {string}
 */
const URL_COM_CDS = "/co/cd/comCdDtls";


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
 * @param {(string|string[])} _gridIdList
 * @param {any[]} _jsondataRef
 * @param {string} _cdId
 * @param {string} _apcCd
 * @returns {void}
 */
async function gfn_setComCdSBSelect(_gridIdList, _jsondataRef, _cdId, _apcCd) {

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
				value: item.cdVl
			}
			_jsondataRef.push(cdVl);
		});

		if (Array.isArray(_gridIdList)) {
			_gridIdList.forEach((_sbGridId) => {
				SBUxMethod.refresh(_sbGridId);
			});
		} else {
			SBUxMethod.refresh(_gridIdList);
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
		...options
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
	return alert(gfn_getComMsg(_msgKey, _arguments));
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



/**
 * 실행부
 */

	/**
	 * 공통메시지 가져오기 (페이지 로드 시)
	 */
	gfn_getComMsgList();

