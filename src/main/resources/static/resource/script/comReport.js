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

	//report.printHTMLDirect();
}

/**
 * @name gfn_DirectPrintClipReport
 * @description 클립리포트 View
 */
const gfn_DirectPrintClipReport = async function(fileName, param) {
	const reportKey = await gfn_getReportKey(fileName, param);
	const report = createOOFReport(
				gv_reportUrl,
				reportKey,
				document.getElementById(param.element)
			);
	report.setEndReportEvent(function(){
			report.printHTMLDirect();
		});
	report.view();

}

/**
 * @name gfn_drawClipReport
 * @description 클립리포트 View
 */
const gfn_drawClipReport = async function(divId, reportKey,check) {
	const report = createOOFReport(gv_reportUrl, reportKey, document.getElementById(divId));

	//printEXEDirect()
	report.setViewType(1);
	report.setIsPrintUse("html","pdf","exe");
	report.setStyle("close_button", "display:none;");
	report.setReportDirectPrintButton(true,1);


		//report.setCustomButtonInfo("report_menu_direct_print",
		//  function() {
		//		report.printHTMLDirect();
		//	}, false, "test");
	let query = window.location.href;
	let param = new URLSearchParams(query);
	if(param.get('mobileYn') === 'true'){
		report.setEndReportEvent(function(){
			report.printHTMLDirect();
		});
		report.view();

	}else{
		if(check.exePrintYn === "Y"){
			report.exeDirectPrint(false, "", "", 1, -1, 1, "");
		}else{
			report.view();
		}
	}




	//



	//report.exeDirectPrint(false, "", "", 1, -1, 1, "");
	//report.printPDFDirect()();
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


/**
 * @name gfn_popClipReportPost
 * @description 리포트를 팝업 혹은 새창으로 띄움
 */
const gfn_popClipReportPost = async function(title, fileName, param) {

	let url = "/report/openClipReport.do";
	const windowTargetName = "popClipReportPost";
	const features = "width=1200, height=1000, toolbar=no directories=no, status=no";

	if (!gfn_isEmpty(param)) {
		param.userNm = gv_userNm;
		param.title = title;
		param.fileName = fileName;
	}

	const args = JSON.stringify(param);

	console.log(args);
	
	const nowDate   = new Date();
    const randomNo = Math.floor(Math.random() * 10000) + 1;
	const sid = windowTargetName + "_" + nowDate.getTime() + "_" + randomNo;

	console.log(222);

	const frm = document.createElement("form");

	window.open(
			"",
			windowTargetName, 
			"width=1200, height=800, toolbar=no directories=no, status=no"
		);

	frm.name = sid;
	frm.id = sid;
	frm.action = url;
	frm.method = "POST";
	frm.target = windowTargetName;


	let elTitle = document.createElement("input");
	elTitle.setAttribute("type", "hidden");
	elTitle.setAttribute("name", "title");
	elTitle.setAttribute("value", title);		
	frm.appendChild(elTitle);
	
	let elFileName = document.createElement("input");
	elFileName.setAttribute("type", "hidden");
	elFileName.setAttribute("name", "fileName");
	elFileName.setAttribute("value", fileName);		
	frm.appendChild(elFileName);
	
	let elArgs = document.createElement("input");
	elArgs.setAttribute("type", "hidden");
	elArgs.setAttribute("name", "args");
	elArgs.setAttribute("value", args);
	frm.appendChild(elArgs);
	
/*	

	frm.onsubmit = function(){
		return false;
	};
	frm.setAttribute("id", sid);
	frm.setAttribute("name", sid);
 	frm.setAttribute("charset", "UTF-8");
 	frm.setAttribute("method", "POST");  //Post 방식
 	frm.setAttribute("action", url); //요청 보낼 주소
	frm.setAttribute("target", windowTargetName);

	const keys = Object.getOwnPropertyNames(param);
	keys.forEach((key) => {		
		let el = document.createElement("input");
		el.setAttribute("type", "hidden");
		el.setAttribute("name", key);
		el.setAttribute("value", param[key]);		
		frm.appendChild(el);
		
		// args
	});
*/
	console.log(frm);

	document.body.appendChild(frm)

	frm.submit();
	
	frm.remove();

}



/**
 * @name gfn_popClipReport
 * @description 클립 리포트 exe printTest Fn
 */
const gfn_exeDirectPrint = async function(fileName, param){
	const reportKey = await gfn_getReportKey(fileName, param);
	const report = createOOFReport(
		gv_reportUrl,
		reportKey,
		document.getElementById(param.element)
	);
	report.setIsPrintUse("html","pdf","exe");

	report.setEndReportEvent(function(){
		report.exeDirectPrint(false, "", "", 1, -1, 1, "");
	});
	report.view();
}





