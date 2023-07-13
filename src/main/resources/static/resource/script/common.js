'use strict';
/**
 *
 */

/** @type {string} */
const URL_COM_CDS = "/co/cd/comCdDtls";

/** @type {string} */
const STR_BLANK = "";
const postHeaders = {
    "Content-Type": "application/json"
}

/**
 * set post header programId
 * @param {string} sysPrgrmId
 */
const gfn_setSysPrgrmId = function(sysPrgrmId) {
    postHeaders.sysPrgrmId = sysPrgrmId
}

/**
 * async post by json
 * @param {string} _url
 * @param {*} _param
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
 * 공통코드 상세 리스트 가져오기
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
 * sbux-select 데이터 설정
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
	console.log("cdDtls", data);

	try {
		_jsondataRef.length = 0;
		data.resultList.forEach((item) => {
			const cdVl = {
				label: item.cdVlNm,
				value: item.cdVl
			}
			_jsondataRef.push(cdVl);
		});
		SBUxMethod.refresh(_name);
	} catch (e) {

	}

}


/**
 * sbux-select 데이터 설정
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
			SBUxMethod.refresh(_gridId);
		}

	} catch (e) {

	}
}



/**
 *  빈값 체크 함수
 * @param {any} str
 * @return {boolean}
 */
const gfn_isEmpty = function (str) {

    if (typeof str == "boolean") {
        return str;
    } else if (typeof str == "string") {
        str = str.trim();
    }

    if (str == undefined) {
        return true;
    } else if (str == "undefined") {
        return true;
    } else if (str == null) {
        return true;
    } else if (str == "null") {
    	return true;
    } else if (str == "") {
        if (typeof str == "string" || typeof str == "object") {
            return true;
        } else {
            return false;
        }
    } else if ("x" + str == "xNaN") {
        return true;
    } else if (str.length == 0) {
        return true;
    } else {
        return false;
    }
}

/**
 * String NVL
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
 * 주어진 이름의 쿠키를 반환
 * 조건에 맞는 쿠키가 없다면 undefined 를 반환
 * @param {string} name
 * @returns {string}
 */
const gfn_getCookie = function (name) {
	let matches = document.cookie.match(new RegExp(
		"(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[]\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
	));
	return matches ? decodeURIComponent(matches[1]) : undefined;
}

/**
 * set cookie
 */
const gfn_setCookie = function (name, value, options = {}) {
	options = {
		path: '/',
		// 필요한 경우, 옵션 기본값을 설정할 수도 있습니다.
		...options
	};

	if (options.expires instanceof Date) {
		options.expires = options.expires.toUTCString();
	}

	console.log("name", name);
	console.log("value", value);
	console.log("options", options);

	let updatedCookie = encodeURIComponent(name) + "=" + encodeURIComponent(value);
	for ( let optionKey in options ) {
		updatedCookie += "; " + optionKey;
		let optionValue = options[optionKey];
		if (optionValue !== true) {
			updatedCookie += "=" + optionValue;
		}
	}

	document.cookie = updatedCookie;
	console.log(document.cookie);
}

const gv_comMsgList = [];

const gfn_getComMsgList = async function() {

	const comMsgPromise = gfn_postJSON("/co/msg/comMsgs", {delYn: "N"});
	const data = await comMsgPromise;

    try {
    	gv_comMsgList.length = 0;
    	data.resultList.forEach((item) => {
			const menu = {
				msgKey: item.msgKey,
				msgCn: item.msgCn,
				rmrk: item.rmrk,
				msgKnd: item.msgKnd,
				msgKndNm: item.msgKndNm
			}
			gv_comMsgList.push(menu);
		});

		console.log("gv_comMsgList", gv_comMsgList);

	} catch (e) {
	}
}

/**
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
 * 실행부
 */

	/**
	 * 공통메시지 가져오기 (페이지 로드 시)
	 */
	gfn_getComMsgList();

