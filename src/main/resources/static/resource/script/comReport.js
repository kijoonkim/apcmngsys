'use strict';

/**
 * @description 리포트 관련 공통함수
 */


let gv_reportDbName;
let gv_reportUrl;
let gv_reportType;
let gv_reportPath;

let gv_dvClipReportPrint = "div-rpt-clipReportPrint";


/**
 * @name gfn_viewClipReport
 * @description 리포트 뷰
 * @param {string} divId	표시할 div id
 * @param {string} fileName	clip report file name
 * @param {JSON} param
 * @param {string} modalId
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

const gfn_getReportKey = async function(fileName, param) {
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

	return oof.toString();
}

/**
 * @name gfn_pdfDwnlClipReport
 * @description 클립리포트 출력
 */
const gfn_pdfDwnlClipReport = async function(fileName, param, pdfName) {
	const reportKey = await gfn_getReportKey(fileName, param);
	const report = createOOFReport(
				gv_reportUrl,
				reportKey,
				document.getElementById(gv_dvClipReportPrint)
			);

	report.callSaveFileDownLoad(pdfName, 1, 1);
}


/**
 * @name gfn_printClipReport
 * @description 클립리포트 출력
 */
const gfn_printClipReport = async function(fileName, param) {
	const reportKey = await gfn_getReportKey(fileName, param);
	const report = createOOFReport(
				gv_reportUrl,
				reportKey,
				document.getElementById(gv_dvClipReportPrint)
			);
	report.printPDFDirect();
	//report.printHTMLDirect();
}

/**
 * @name gfn_drawClipReport
 * @description 클립리포트 View
 */
const gfn_drawClipReport = async function(divId, reportKey) {
	const report = createOOFReport(gv_reportUrl, reportKey, document.getElementById(divId));
	//report.callHTML5Print();
	//report.exeDirectPrint(false, "", "", 1, -1, 1, "");
	//report.printHTMLDirect();
	//report.printPDFDirect()();
	//printEXEDirect()
	report.setViewType(1);
	report.setIsPrintUse("html","pdf");
	report.setStyle("close_button", "display:none;");
	//report.setStrExePrintServerPath("http://133.186.212.16/ClipReport/Clip.jsp");
	report.view();
	//report.exeDirectPrint(false, "", "", 1, -1, 1, "");
	//report.exePrint(false, "", "", 1, -1, 1, "");
}



/**
 * @name gfn_popClipReport
 * @description 리포트를 팝업 혹은 새창으로 띄움
 */
const gfn_popClipReport = async function(title, fileName, param) {

	// const reportKey = await gfn_getReportKey(fileName, param);
	/*
	const url = "/report/openClipReport.do?"
			+ "reportKey="+ reportKey +"&title="+title;
*/

	let url = "/report/openClipReport.do?"
				+ "title="+ title +"&fileName="+ fileName;
	const windowTargetName = "popClipReport";
	const features = "width=1200, height=1000, toolbar=no directories=no, status=no";

	if (!gfn_isEmpty(param)) {
		const keys = Object.getOwnPropertyNames(param);
		keys.forEach((key) => {
			url += "&"+ key +"="+ param[key];
		});

		url += "&userNm=" + gv_userNm;
	}

	window.open(
			encodeURI(url, "UTF-8"),
			windowTargetName,
			features
		);

/*
	window.open(
		url,
		'popClipReport',
		'width=1200, height=800, toolbar=no directories=no, status=no'
		);
*/

/*
	const frm = document.createElement("form");
 	frm.setAttribute("charset", "UTF-8");
 	frm.setAttribute("method", "Post");  //Post 방식
 	frm.setAttribute("action", url); //요청 보낼 주소

	let elReportKey = document.createElement("input");
	elReportKey.setAttribute("type", "hidden");
	elReportKey.setAttribute("name", "reportKey");
	elReportKey.setAttribute("value", reportKey);
	frm.appendChild(elReportKey);

	let elTitle = document.createElement("input");
	elTitle.setAttribute("type", "hidden");
	elTitle.setAttribute("name", "reportKey");
	elTitle.setAttribute("value", title);

	frm.appendChild(elReportKey);

	window.open("" ,"popClipReport", "width=1200, height=800, toolbar=no directories=no, status=no");
	frm.submit();

	frm.remove();
*/
}



