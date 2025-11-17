'use strict';


/**
 * 생산유통통합조직등록관리 마스터 목록 조회
 * @type {string}
 */
const URL_PRUO_REG_MST = "/pd/pcom/selectPruoRegMstList.do";

const URL_PRUO_PRGRS_STTS_CHK = "/pd/aom/selectPruoPrgrsApoDtl.do";

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

async function gfn_chkPruoPrgrsStts (_crtrYr, _apoCd, _prgrmId ) {

	let prgrsStts;

	try {
		const param = {crtrYr: _crtrYr, apoCd : _apoCd, prgrmId : _prgrmId };

		const postJsonPromise = gfn_postJSON(URL_PRUO_PRGRS_STTS_CHK, param);
		const data = await postJsonPromise;

		if (_.isEqual("S", data.resultStatus)) {
			const resultVO = data.resultMap;
			if (resultVO == null) {
				prgrsStts = "X";
			} else {
				const cmptnYn = resultVO.cmptnYn;
				const tmprStrgYn = resultVO.tmprStrgYn;

				if (_.isEqual(cmptnYn, "N") && _.isEqual(tmprStrgYn, "Y")) {
					prgrsStts = "T";
				} else if (_.isEqual(cmptnYn, "Y") && _.isEqual(tmprStrgYn, "N")) {
					prgrsStts = "D";
				}
			}
		} else {
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	} catch (e) {

		if (!(e instanceof Error)) {
			e = new Error(e);
			console.error("failed", e.message);
		}

	}

	return prgrsStts;
}










