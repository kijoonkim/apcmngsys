'use strict';

/**
 * @description 리포트 관련 공통함수
 */


let gv_reportDbName;
let gv_reportUrl;
let gv_reportType;
let gv_reportPath;

/**
 * @name gfn_viewClipReport
 * @description 리포트 뷰
 * @param {string} divId	표시할 div id
 * @param {string} fileName	clip report file name
 * @param {JSON} param
 * @param [{string}] modalId
 * @function
 * @returns
 */
const gfn_viewClipReport = async function(divId, fileName, param, modalId) {

	const oof = new OOFDocument();
	// oof.addFile("crf.root", "%root%/crf/rawMtrLbl.crf");
	oof.addFile(gv_reportType, gv_reportPath + fileName);
	// oof.addConnectionData("*", "tibero");
	oof.addConnectionData("*", gv_reportDbName);

	if (!gfn_isEmpty(param)) {
		let keys = Object.getOwnPropertyNames(param);
		keys.forEach((item) => {
			oof.addField(item, param[item]);
			console.log(item, param[item]);
		});
	}

	const report = createOOFReport(gv_reportUrl, oof.toString(), document.getElementById(divId));

	if (!gfn_isEmpty(modalId)) {
		report.setCloseButtonCustomEvent(function() {
		//report.setCloseReportEvent(function() {
			gfn_closeModal(modalId);
		});
	}

	report.setViewType(1);
	report.view();
}
