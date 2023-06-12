'use strict';
/**
 * 
 */

/** @type {string} */
const URL_COM_CDS = "/co/cd/comCdDtls";

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

