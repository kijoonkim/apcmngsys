'use strict';

const URL_APC_SURVEY_CHECK 			= "/fm/fclt/insertCheckApcSurvey.do";		// APC전수조사 등록 가능 확인

/**
 * @name gfn_postJSON
 * @description async post by json
 * @function
 * @param {String} _crtrYr
 * @param {boolean} _needsAlert
 * @returns {any}
 */
async function gfn_apcSurveyInsertCheck (_crtrYr, _needsAlert) {

	let canInsert = false;

	try {
		const param = {crtrYr: _crtrYr};

		const postJsonPromise = gfn_postJSON(URL_APC_SURVEY_CHECK, param);
		const data = await postJsonPromise;

		if (_.isEqual("S", data.resultStatus)) {
			canInsert = true;
		} else {
			if (_needsAlert) {
				gfn_comAlert(data.resultCode, data.resultMessage);
			}
		}
	} catch (e) {

		if (!(e instanceof Error)) {
			e = new Error(e);
			console.error("failed", e.message);
		}
		if (_needsAlert) {
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	return canInsert;
}









