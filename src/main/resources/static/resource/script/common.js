'use strict';
/**
 * 
 */

/** @type {string} */
const URL_COM_CDS = "/co/cd/comCdDtls";

/** @type {string} */
const STR_BLANK = "";

/**
 * async post by json
 * @param {string} _url
 * @param {*} _param
 * @returns {any}
 */
async function gfn_postJSON(_url, _param) {
	try {
		const response = await fetch(
			_url, {
				method: "POST",
				headers: {
						"Content-Type": "application/json"
					},
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
 * @param {string} _name
 * @param {any[]} _jsondataRef
 * @param {string} _cdId
 * @param {string} _apcCd
 * @returns {void}
 */
async function gfn_setComCdSelect(_name, _jsondataRef, _cdId, _apcCd) {
	
	if (gfn_isEmpty(_cdId)) {
		return;
	}
	
	const postJsonPromise = gfn_postJSON(URL_COM_CDS, {cdId: _cdId, apcCd: _apcCd});
	const data = await postJsonPromise;
	console.log("cdDtls", data);
	console.log("cdDtlList", JSON.stringify(data.resultList));
	
	try {
		_jsondataRef.length = 0;
		data.resultList.forEach((item) => {
			const cdVl = {
				text: item.cdVlNm,
				value: item.cdVl
			}
			_jsondataRef.push(cdVl);
		});
		SBUxMethod.refresh(_name);		
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

