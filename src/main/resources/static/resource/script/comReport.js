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


const gfn_getReportKeyByJson = async function(_fileName, _param, _conn) {
	
	const oof = new OOFDocument();
	// oof.addFile("crf.root", "%root%/crf/rawMtrLbl.crf");
	const cfl = oof.addFile(gv_reportType, gv_reportPath + _fileName);
	
	/*
		_conn = [
			{
				memo: "JSON1",
				name: "JSONDS1",
				rootPath: "{%dataset.json.root%}",
				data: {
					root: [
						
					]
				}
			},
			{
				memo: "JSON2",
				name: "JSONDS2",
				rootPath: "{%dataset.json.root%}",
				data: {
					root: [
						
					]
				}
			},
		]
	*/
	
	if (gfn_isEmpty(_conn)) {
		return;
	}
	
	if (_conn.length == 0) {
		return;
	}
	
	const prfxMemo = "JSON"; 
	const prfxName = "JSONDS"; 
	const defaultRoot = "{%dataset.json.root%}";
	
	_conn.forEach((item, index) => {
		
		const objIndex = index + 1;		
		const memoName = gfn_nvl(item.memo, prfxMemo + objIndex);
		const jsonName = gfn_nvl(item.name, prfxName + objIndex);
		const rootPath = gfn_nvl(item.rootPath, defaultRoot);

		const strData = gfn_nvl(JSON.stringify(item.data), "{}");		
		const memo = cfl.addConnectionMemo(memoName, strData);
		memo.addContentParamJSON(jsonName, "utf-8", rootPath);
	});
	
	/*
	// oof.addConnectionData("*", "tibero");
	// oof.addConnectionData("*", gv_reportDbName);
	const memo1 = cfl.addConnectionMemo("JSON1", jsonData1);
	console.log("memo1", memo1);	
	memo1.addContentParamJSON("JSONDS1", "utf-8", "{%dataset.json.root%}");
	const memo2 = cfl.addConnectionMemo("JSON2", jsonData2);
	memo2.addContentParamJSON("JSONDS2", "utf-8", "{%dataset.json.root%}");
	console.log("memo2", memo2);
	*/
	
	if (!gfn_isEmpty(_param)) {
		let keys = Object.getOwnPropertyNames(_param);
		keys.forEach((item) => {
			oof.addField(item, _param[item]);
			console.log(item, _param[item]);
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

	//리포트의 현재 페이지를 반환합니다.
	//var selectedPageCount   = report.callGetSlectedPageNumber();

	//리포트의 전체 페이지수를 반환합니다.
	//var totalPageCount   = report.callGetTotalPageCount();

		//report.setDefaultSavePDFOption();
	//report.callPDFPrint();
	//report.runPDFPrint()
	//report.printPDFDirect();
	report.callSaveFileDownLoad(pdfName, 3, 1/*, selectedPageCount , totalPageCount*/);
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
console.log("report", report);
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
 * @name gfn_drawClipReport
 * @description 클립리포트 View
 */
const gfn_drawClipReportPOST = async function(divId, reportKey,check) {
	const report = createOOFReport(gv_reportUrl, reportKey, document.getElementById(divId));
console.log("report", report);
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

	let url = "/report/openClipReport.do?title="+ title +"&fileName="+ fileName;
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
const gfn_popClipReportPost = async function(_title, _fileName, _param, _conn) {

	let url = "/report/openClipReport.do";
	const windowTargetName = "popClipReportPost";
	const features = "width=1200, height=1000, toolbar=no directories=no, status=no";

	if (!gfn_isEmpty(_param)) {
		_param.userNm = gv_userNm;
		_param.title = _title;
		_param.fileName = _fileName;
	}

	const param = JSON.stringify(_param);
	const conn = JSON.stringify(_conn);

	const nowDate   = new Date();
    const randomNo = Math.floor(Math.random() * 10000) + 1;
	const sid = windowTargetName + "_" + nowDate.getTime() + "_" + randomNo;

	const frm = document.createElement("form");

	const win = window.open(
			"",
			windowTargetName, 
			features
		);

	frm.name = sid;
	frm.id = sid;
	frm.action = url;
	frm.method = "POST";

	let elTitle = document.createElement("input");
	elTitle.setAttribute("type", "hidden");
	elTitle.setAttribute("name", "title");
	elTitle.setAttribute("value", _title);		
	frm.appendChild(elTitle);
	
	let elFileName = document.createElement("input");
	elFileName.setAttribute("type", "hidden");
	elFileName.setAttribute("name", "fileName");
	elFileName.setAttribute("value", _fileName);		
	frm.appendChild(elFileName);
	
	let elParam = document.createElement("input");
	elParam.setAttribute("type", "hidden");
	elParam.setAttribute("name", "param");
	elParam.setAttribute("value", param);
	frm.appendChild(elParam);
	
	let elConn = document.createElement("input");
	elConn.setAttribute("type", "hidden");
	elConn.setAttribute("name", "conn");
	elConn.setAttribute("value", conn);
	frm.appendChild(elConn);
	
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
	win.document.head.appendChild(frm);
	//document.body.appendChild(frm)

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





