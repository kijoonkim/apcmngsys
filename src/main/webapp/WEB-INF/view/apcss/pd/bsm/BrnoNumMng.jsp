<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>title : SBUx2.6</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set><h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
					<!-- 채번 관리 화면 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="양식받기" class="btn btn-sm btn-outline-danger" onclick="fn_dwnld"></sbux-button>
					<sbux-button id="btnExcUpload" name="btnExcUpload" uitype="normal" text="엑셀 업로드" class="btn btn-sm btn-outline-danger" onclick="fn_upload"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 5%">

						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 5%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">사업자번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-brno"
									name="srch-inp-brno"
									class="form-control input-sm srch-keyup-area"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input">

							<th scope="row" class="th_bg">법인명</th>
							<td class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="srch-inp-corpNm"
									name="srch-inp-corpNm"
									class="form-control input-sm srch-keyup-area"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input">
						</tr>
					</tbody>
				</table>

				<!-- 승인형 조직 리스트 -->
				<div class="prfmncChck">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶채번관리 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
							</li>
						</ul>
						<div class="ad_tbl_toplist">
							<sbux-button id="btn_addDtl" name="btn_addDtl" uitype="normal" text="사업자번호 추가" class="btn btn-sm btn-outline-danger" onclick="fn_openMaodalSelect" ></sbux-button>
						</div>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdBrnoNumMng" style="height:350px; width: 100%; overflow-x: hidden"></div>
					<br>
				</div>
			</div>
		</div>
		<!-- 엑셀 업로드 양식 -->
		<div class="exp-div-excel" style="display: none;width: 1000px;">
			<div id="sbexp-area-grdExpUpload" style="height:1px; width: 100%;"></div>
		</div>
	</section>

	<!-- 사업자번호 조회 팝업 -->
	<div>
		<sbux-modal
			id="modal-brnoMng"
			name="modal-brnoMng"
			uitype="middle"
			header-title="사업자번호 선택"
			body-html-id="body-modal-brnoMng"
			footer-is-close-button="false"
			style="width:1000px"
		></sbux-modal>
	</div>
	<div id="body-modal-brnoMng">
		<jsp:include page="/WEB-INF/view/apcss/pd/popup/BrnoMngPopup.jsp"></jsp:include>
	</div>

	<!-- IMPORT 엑셀 등록 Modal -->
	<div>
		<sbux-modal
			id="modal-imp"
			name="modal-imp"
			uitype="middle"
			header-title="채번 엑셀 등록(Excel)"
			body-html-id="body-modal-imp"
			footer-is-close-button="false"
			header-is-close-button="false"
			style="width:1000px"
		></sbux-modal>
	</div>
	<div id="body-modal-imp">
		<jsp:include page="../../fm/popup/importExcelPopup.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
		/**
		 * 엔터시 검색 이벤트
		 */
		const elements = document.querySelectorAll(".srch-keyup-area");
		for (let i = 0; i < elements.length; i++) {
			const el = elements.item(i);
			el.addEventListener("keyup", (event) => {
				if (event.keyCode === 13 && !event.altKey && !event.ctrlKey && !event.shiftKey) {
					fn_search();
				}
				//key	Enter
				//keyCode
			});
		}
	})

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_createGridBrnoNumMng();

		await fn_search();
	}

	//그리드 변수
	var jsonBrnoNumMng = []; // 그리드의 참조 데이터 주소 선언
	var grdBrnoNumMng;

	/* Grid 화면 그리기 기능*/
	const fn_createGridBrnoNumMng = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdBrnoNumMng';
		SBGridProperties.id = 'grdBrnoNumMng';
		SBGridProperties.jsonref = 'jsonBrnoNumMng';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		//SBGridProperties.explorerbar = 'sort';//정렬
		//SBGridProperties.rowheader="seq";
		SBGridProperties.rowheader=["seq","update"];
		SBGridProperties.columns = [
			{caption: ["사업자번호"], 	ref: 'brno',	type:'input',  width:'10%',	style:'text-align:center'},
			{caption: ["법인명"], 		ref: 'corpNm',	type:'input',  width:'25%',	style:'text-align:center'},
			{caption: ["본번"], 		ref: 'mno',		type:'input',  width:'5%',	style:'text-align:center'},
			{caption: ["부번"], 		ref: 'sno',		type:'input',  width:'5%',	style:'text-align:center'},
			{caption: ["선정년도"], 	ref: 'slctnYr',	type:'input',  width:'5%',	style:'text-align:center'},
			{caption: ["비고"], 		ref: 'rmrk',	type:'input',  width:'40%',	style:'text-align:center'},
		];
		grdBrnoNumMng = _SBGrid.create(SBGridProperties);
	}

	/* 채번리스트 조회*/
	const fn_search = async function(){
		fn_clearForm();

		let brno = SBUxMethod.get('srch-inp-brno');
		let corpNm = SBUxMethod.get('srch-inp-corpNm');

		let postJsonPromise = gfn_postJSON("/pd/bsm/selectBrnoNumMngList.do", {
			brno : brno
			,corpNm : corpNm
		});
		let data = await postJsonPromise;
		try{
			jsonBrnoNumMng.length = 0;
			let totalRecordCount = 0;
			data.resultList.forEach((item, index) => {
				let itemVO = {
						brno		: item.brno
						,corpNm		: item.corpNm
						,mno		: item.mno
						,sno		: item.sno
						,slctnYr	: item.slctnYr
						,useYn		: item.useYn
						,rmrk		: item.rmrk
				}
				jsonBrnoNumMng.push(itemVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonBrnoNumMng.length > 0) {
				if(grdBrnoNumMng.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdBrnoNumMng.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdBrnoNumMng.rebuild();
				}else{
					grdBrnoNumMng.refresh()
				}
			} else {
				grdBrnoNumMng.setPageTotalCount(totalRecordCount);
				grdBrnoNumMng.rebuild();
			}
			document.querySelector('#listCount1').innerText = totalRecordCount;

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}


	const fn_clearForm = async function (){
		jsonBrnoNumMng.length=0;
		grdBrnoNumMng.rebuild();
	}

	/**
	 * 저장 버튼
	 */
	const fn_save = async function() {

		//필수값 체크
		if(fn_checkRequiredInput()){
			return;
		}

		// 변경 저장
		fn_subUpdate(confirm("저장 하시겠습니까?"));
	}

	//필수값 확인
	function fn_checkRequiredInput(){
		let objGrid = grdBrnoNumMng;
		//그리드 필수갑 확인
		let gridData = objGrid.getGridDataAll();

		//테이블 해더 row수
		let captionRow = objGrid.getFixedRows();
		for(var i = captionRow; i < gridData.length + captionRow; i++ ){
			let rowData = objGrid.getRowData(i);
			let rowSts = objGrid.getRowStatus(i);

			if(rowSts == '1' || rowSts == '2' || rowSts == '3'){
				//사업자번호
				if(gfn_isEmpty(rowData.brno)) {
					gfn_comAlert("W0002", "사업자번호");//W0002 : {0}을/를 입력하세요.
					return true;
				}
			}else{
				continue;
			}
		}

		return false;
	}

	//저장
	const fn_subUpdate = async function(isConfirmed){
		if (!isConfirmed) return;

		let gridData = grdBrnoNumMng.getGridDataAll();
		let saveList = [];

		//테이블 해더 row수
		let captionRow = grdBrnoNumMng.getFixedRows();
		for(var i = 1; i < gridData.length + captionRow; i++ ){
			let rowData = grdBrnoNumMng.getRowData(i);
			let rowSts = grdBrnoNumMng.getRowStatus(i);

			//console.log(rowData);

			if(rowSts == '3' || rowSts == '1'){
				rowData.rowSts = 'I';
				saveList.push(rowData);
			}else if(rowSts == '2'){
				rowData.rowSts = 'U';
				saveList.push(rowData);
			}else{
				continue;
			}

			saveList.push(rowData);
		}

		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let postJsonPromise = gfn_postJSON("/pd/bsm/multiSaveBrnoNumMngList.do", saveList);
		let data = await postJsonPromise;
		try {
			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
				fn_search();//조회
			} else {
				alert(data.resultMessage);
			}
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//행추가
	const fn_addRow = async function (){
		grdBrnoNumMng.addRow();
	}

	//선택행 삭제
	const fn_delRow = async function (){
		let objGrid = grdBrnoNumMng;

		if(objGrid.getRowStatus(nRow) == 0 || objGrid.getRowStatus(nRow) == 2){
			var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
			if(confirm(delMsg)){
				var vo = objGrid.getRowData(nRow);
				fn_deleteRsrc(vo);
				objGrid.deleteRow(nRow);
			}
		}else{
			objGrid.deleteRow(nRow);
		}
	}

	//선택행 데이터 삭제
	async function fn_deleteRsrc(vo){
		let postJsonPromise = gfn_postJSON("/pd/bsm/deleteBrnoNumMng.do",vo);
		let data = await postJsonPromise;

		try{
			if(data.result > 0){
				alert("삭제 되었습니다.");
			}else{
				alert("삭제 도중 오류가 발생 되었습니다.");
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//조직선택 팝업 오픈
	function fn_openMaodalSelect(){
		popBrnoMng.init(fn_setGridBrnoMng);
		SBUxMethod.openModal('modal-brnoMng');
	}

	// 조직 선택 팝업 콜백 함수
	const fn_setGridBrnoMng = function(rowData) {
		//console.log(rowData);
		//console.log(grdBrnoNumMng);
		//그리드 객체
		let objGrid = grdBrnoNumMng;

		if (!gfn_isEmpty(rowData)) {

			let gridData = objGrid.getGridDataAll();
			for(var i=1; i<=objGrid.length; i++ ){
				let gridRowData = objGrid.getRowData(i);
				if ($.trim(rowData.brno) === $.trim(gridRowData.brno)){
					gfn_comAlert("E0000", "동일한 사업자번호가 있습니다.");
					return false;
				}
			}
			objGrid.addRow(true , {
				brno 		: rowData.brno
				,corpNm 	: rowData.corpNm
				,mno 		: rowData.mno
				,sno 		: rowData.sno
				,slctnYr 	: rowData.slctnYr
			});

			objGrid.setRow(objGrid.getRows());
			objGrid.moveScrollTop(objGrid.getRows());
		}
	}

	/*	엑셀업로드	*/

	// 엑셀다운로드

	const fn_getExpColumns = function() {
		const _columns = [];
		_columns.push(
			{caption: ["사업자번호"], 	ref: 'brno',	type:'input',  width:'10%',	style:'text-align:center'},
			{caption: ["법인명"], 		ref: 'corpNm',	type:'input',  width:'25%',	style:'text-align:center'},
			{caption: ["본번"], 		ref: 'mno',		type:'input',  width:'5%',	style:'text-align:center'},
			{caption: ["부번"], 		ref: 'sno',		type:'input',  width:'5%',	style:'text-align:center'},
			{caption: ["선정년도"], 	ref: 'slctnYr',	type:'input',  width:'5%',	style:'text-align:center'},
			{caption: ["비고"], 		ref: 'rmrk',	type:'input',  width:'40%',	style:'text-align:center'},
		);

		return _columns;
	}

	/**
	 * @name fn_upload
	 * @description 올리기 버튼 클릭
	 */
	const fn_upload = async function() {

		popImp.init();

		const impColumns = fn_getExpColumns();
		//await fn_setSltJson();

		var SBGridProperties = {};
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = impColumns;
		SBGridProperties.rowheader="seq";
		popImp.importExcel(
				"농가리스트 Import",
				SBGridProperties,
				fn_importExcel,
				fn_setDataAfterImport,
				fn_grdImpValueChanged
			);
	}

	/**
	 * @name fn_importExcel
	 * @description 엑셀 업로드 저장
	 */
	const fn_importExcel = async function(_grdImp) {

		const saveList = [];

		let impData = _grdImp.getGridDataAll();

		//console.log(_grdImp);

		if (impData.length == 0) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
		}

		let iCol = 0;

		//테이블 해더에 따라 iRow 변경
		for ( let iRow = 1; iRow <= impData.length; iRow++ ) {
			const rowData = _grdImp.getRowData(iRow);

			// validation check
			if (gfn_isEmpty(rowData.brno)) {
				gfn_comAlert("W0002", "사업자번호");		//	W0002	{0}을/를 입력하세요.
				let brnoCol = _grdImp.getRefOfCol('brno');
				_grdImp.selectCell(iRow, brnoCol);
				_grdImp.moveScrollTop(iRow);
				return;
			}

			rowData.rowSts = "I";

			saveList.push(rowData);
		}

		if (saveList.length == 0) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
		}

		if (!gfn_comConfirm("Q0001", "저장")) {
			return;
		}

		let postUrl = "/pd/bsm/multiSaveBrnoNumMngList.do";

		const postJsonPromise = gfn_postJSON(postUrl, saveList);
		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001");	// I0001	처리 되었습니다.
				popImp.close();
				fn_search();
			} else {
				gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
			}
		} catch(e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	//콤보 세팅
	const fn_setSltJson = async function() {
		//const itemCd = SBUxMethod.get("srch-slt-itemCd");			// 품목
		// 첫 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// set exp/imp combo json
		//jsonExpSltItem 				= gfn_cloneJson(jsonApcItem);			// 엑셀 품목Json
		//jsonExpSltItem				= gfn_getJsonFilter(jsonExpSltItem, "itemCd", itemCd);
		//jsonExpSltPckgFclt 			= gfn_cloneJson(jsonComPckgFclt);			// 엑셀 포장기Json
	}


	/**
     * @name fn_grdImpValueChanged
     * @description import 변경 event 처리
     * @function
     */
	const fn_grdImpValueChanged = function(_grdImp) {
		//valuechanged 이벤트
		//console.log("fn_grdImpValueChanged");
		//console.log(_grdImp);
		var nRow = _grdImp.getRow();
		var nCol = _grdImp.getCol();
	}

	/**
	 * @name fn_setDataAfterImport
	 * @description afterimportexcel 이벤트
	 */
	const fn_setDataAfterImport = function(_grdImp) {
		//console.log("fn_setDataAfterImport");
		//console.log(_grdImp);
		let impData = _grdImp.getGridDataAll();

		const abnormalList = [];

		for ( let iRow = 1; iRow <= impData.length; iRow++ ) {

			const rowData = _grdImp.getRowData(iRow, false);	// deep copy
			if(typeof rowData == "undefined" || rowData == null || rowData == "" ){
				continue;
			}
			_grdImp.refresh({"combo":true, "focus":false});
		}
		_grdImp.refresh();

	}


	/*	엑셀 서식 받기	*/

	var grdExpUpload;			// 엑셀업로드 서식 그리드
	var jsonExpUpload 			= [];	// 엑셀업로드 서식 데이터

	//서식 다운로드
	const fn_dwnld = async function(){

		//await fn_setSltJson();
		//await fn_setExpJson();

		//그리드 데이터
		jsonExpUpload = jsonBrnoNumMng;

		const expColumns = fn_getExpColumns();
		const expObjList = [

			{
				sbGrid: grdExpUpload,
				parentid: "sbexp-area-grdExpUpload",
				id: "grdExpUpload",
				jsonref: "jsonExpUpload",
				columns: expColumns,
				sheetName: "채번리스트",
				title: "",
				unit: ""
			}

		];

		await fn_createExpGrid(expObjList); // fn_createExpGrid함수에 expObjList를 담아서 보내주는 코드

		let fileName = "채번리스트 엑셀 업로드(샘플).xlsx"
		fn_exportExcelMulti(fileName, expObjList); // gfn_exportExcelMulti함수에 파일 이름, 오브젝트 리스트를 보내주는 코드
	}

	const fn_createExpGrid = async function(_expObjList) {
		_expObjList.forEach((exp, idx) => {
			var SBGridProperties = {};
			SBGridProperties.parentid = exp.parentid;
			SBGridProperties.id = exp.id;
			SBGridProperties.jsonref = exp.jsonref;
			SBGridProperties.emptyrecords = '데이터가 없습니다.';
			SBGridProperties.selectmode = 'byrow';
			SBGridProperties.extendlastcol = 'none';
			SBGridProperties.columns = exp.columns;
			exp.sbGrid = _SBGrid.create(SBGridProperties);
			//console.log(exp.sbGrid);
			if(jsonExpUpload.length == 0){
				exp.sbGrid.addRow(true);
			}
		});
	}

	const fn_exportExcelMulti = function(_fileName, _objList) {

		// 엑셀 정보를 담는 변수
		var objExcelInfo = {
			strFileName : _fileName,
			strAction : "/am/excel/saveMultiExcel",
			bIsStyle: true,
			bIsMerge: true,
			bUseFormat: false,
			bIncludeData: true,
			bUseCompress: false
		};

		var dataList = [];
		var sheetNameList = [];
		var titleList = [];
		var unitList = [];
		var arrAdditionalData = [];

		// 넘어온 오브젝트를 이용한 forEach문으로 타이틀리스트에 title을 넣고 unitList에 unit을 넣는 포이치문
		_objList.forEach((item, index) => {
			sheetNameList.push(item.sheetName);
			titleList.push(item.title);
			unitList.push(item.unit);

			if (index > 0) {
				var data = item.sbGrid.exportExcel(objExcelInfo, "return");
				dataList.push(data);
			}
		});

		arrAdditionalData.push(
			{"name": "arrSheetData", "value": JSON.stringify(dataList)},
			{"name": "arrSheetName", "value": JSON.stringify(sheetNameList)},
			{"name": "arrTitle", "value": JSON.stringify(titleList)},
			{"name": "arrUnit", "value": JSON.stringify(unitList)}
		);

		objExcelInfo.arrAdditionalData = arrAdditionalData;
		_objList[0].sbGrid.exportExcel(objExcelInfo);
	}

</script>
</html>