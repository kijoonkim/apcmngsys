'use strict';


/**
 * 생산유통통합조직등록관리 마스터 목록 조회
 * @type {string}
 */
const URL_PRUO_REG_MST = "/pd/pcom/selectPruoRegMstList.do";

/**
 * @name gfn_getPruoRegMst
 * @description 생산유통통합조직등록관리 마스터 목록 가져오기
 * @function
 * @param {string} _crtrYr	- 기준연도
 * @returns {any[]}
 */
async function gfn_getPruoRegMst (_showOnlyInProgress = true) {

	const _showOnlyInPrgrsYn = _showOnlyInProgress ? "Y" : "N";
	let resultList = [];

	try {

		const postJsonPromise = gfn_postJSON(URL_PRUO_REG_MST, {showOnlyInPrgrsYn: _showOnlyInPrgrsYn}, null, true);
		const data = await postJsonPromise;

		if (_.isEqual("S", data['resultStatus'])) {
			resultList = data['resultList'];
		}

	} catch (e) {
		if (!(e instanceof Error)) {
			e = new Error(e);
		}
		console.error("failed", e);
		console.error("failed", e.message);
	}

	return resultList;
}










