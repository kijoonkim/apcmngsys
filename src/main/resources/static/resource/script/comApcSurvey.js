'use strict';

const URL_APC_SURVEY_CHECK 			= "/fm/fclt/insertCheckApcSurvey.do";		// APC전수조사 등록 가능 확인
const URL_APC_SURVEY_CRTR_YR = "/fm/fclt/selectApcCmsuCrtrYr.do"; 	// APC전수조사 기준연도 가져오기

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

/**
 * @name gfn_getApcSurveyCrtrYr
 * @description APC전수조사 조사연도
 * @function
 * @param {(string)} _targetIds
 * @param {any[]} _jsondataRef
 * @returns {any[]}
 */
async function gfn_getApcSurveyCrtrYr(_targetIds, _jsondataRef) {

	const postJsonPromise = gfn_postJSON(URL_APC_SURVEY_CRTR_YR);
	const data = await postJsonPromise;

	try {
		_jsondataRef.length = 0;
		if (_.isEqual("S", data.resultStatus)) {
			data.resultList.forEach((item) => {
				_jsondataRef.push({
					text : item.crtrYr,
					value : item.crtrYr
				});
			});
		}
		SBUxMethod.refresh(_targetIds);

	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
			console.error("failed", e.message);
		}
		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	}
}









