<%
/**
 * @Class Name : BrnoMng.jsp
 * @Description : 변경된 사업자번호 관리 화면
 * @author SI개발부
 * @since 2023.10.23
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2024.11.08 ljw			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 변경된 사업자번호 관리</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
					<!-- 변경된 사업자번호 관리 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
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
									id="srch-input-brno"
									name="srch-input-brno"
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
									id="srch-input-corpNm"
									name="srch-input-corpNm"
									class="form-control input-sm srch-keyup-area"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input">
						</tr>
					</tbody>
				</table>
				<br><br>

				<div class="row">
					<div class="col-sm-5">
						<div class="ad_tbl_top2">
							<ul class="ad_tbl_count">
								<li>
									<span>관리목록</span>
									<span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
								</li>
							</ul>
							<div class="ad_tbl_toplist">
								<sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" ></sbux-button>
								<sbux-button id="btn_save" name="btn_save" uitype="normal" text="선택 저장" class="btn btn-sm btn-outline-danger" onclick="fn_save" ></sbux-button>
							</div>
						</div>
						<div>
							<div id="sb-area-grdBrnoMng" style="height:613px; width:100%;"></div>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="ad_tbl_top2">
							<ul class="ad_tbl_count">
								<li>
									<span>상세정보</span>
									<span style="font-size:12px">(조회건수 <span id="listCount2">0</span>건)</span>
								</li>
							</ul>
							<div class="ad_tbl_toplist">
								<sbux-button id="btn_addDtl" name="btn_addDtl" uitype="normal" text="사업자번호 추가" class="btn btn-sm btn-outline-danger" onclick="fn_openMaodalSelect" ></sbux-button>
								<sbux-button id="btn_saveDtl" name="btn_saveDtl" uitype="normal" text="선택 저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveDtl" ></sbux-button>
							</div>
						</div>
						<div>
							<sbux-input id="dtl-inp-mngNo" name="dtl-inp-mngNo" uitype="hidden"></sbux-input>
							<div id="sb-area-grdDtlBrnoMng" style="height:613px; width:100%;"></div>
						</div>
					</div>
				</div>
			</div>
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
</body>
<!-- inline scripts related to this page -->
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
					fn_dtlSearch();
				}
				//key	Enter
				//keyCode
			});
		}
	})

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_createGridBrnoMng();
		await fn_createGridDtlBrnoMng();

		await fn_search();
	}

	//그리드 변수
	var jsonBrnoMng = []; // 그리드의 참조 데이터 주소 선언
	var grdBrnoMng;

	/* Grid 화면 그리기 기능*/
	const fn_createGridBrnoMng = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdBrnoMng';
		SBGridProperties.id = 'grdBrnoMng';
		SBGridProperties.jsonref = 'jsonBrnoMng';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		//SBGridProperties.oneclickedit = true;
		//SBGridProperties.explorerbar = 'sort';//정렬
		//SBGridProperties.rowheader="seq";
		SBGridProperties.rowheader="update";
		SBGridProperties.columns = [
			{caption: ["체크박스"], 	ref: 'checked', 	width: '30px', type: 'checkbox', style:'text-align: center',
				typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N', ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}}},
			{caption: ["관리번호"], 	ref: 'mngNo',		type:'output',  width:'50px',	style:'text-align:center'},
			{caption: ["법인명"], 		ref: 'corpNm',		type:'input',  width:'200px',	style:'text-align:center'},
			{caption: ["비고"], 		ref: 'rmrk',		type:'input',  width:'60px',	style:'text-align:center'},
			{caption: ["삭제"], 		ref: 'delbtn',		type:'button',  width:'60px',	style:'text-align:center', typeinfo : {buttonvalue: '삭제', callback: fn_delRow}},
		];
		grdBrnoMng = _SBGrid.create(SBGridProperties);

		//클릭 이벤트 바인드
		grdBrnoMng.bind('click','fn_view');
	}


	//그리드 변수
	var jsonDtlBrnoMng = []; // 그리드의 참조 데이터 주소 선언
	var grdDtlBrnoMng;


	/* Grid 화면 그리기 기능*/
	const fn_createGridDtlBrnoMng = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdDtlBrnoMng';
		SBGridProperties.id = 'grdDtlBrnoMng';
		SBGridProperties.jsonref = 'jsonDtlBrnoMng';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		//SBGridProperties.explorerbar = 'sort';//정렬
		//SBGridProperties.rowheader="seq";
		SBGridProperties.rowheader="update";
		SBGridProperties.columns = [
			{caption: ["체크박스"], 	ref: 'checked', 	width: '30px', type: 'checkbox', style:'text-align: center',
				typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N', ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}}},
			{caption: ["표시순서"], 	ref: 'indctSeq',	type:'input',  width:'50px',	style:'text-align:center'},
			{caption: ["법인명"], 		ref: 'corpNm',		type:'output',  width:'200px',	style:'text-align:center'},
			{caption: ["사업자번호"], 	ref: 'brno',		type:'output',  width:'90px',	style:'text-align:center'},
			{caption: ["법인등록번호"], 	ref: 'crno',		type:'output',  width:'100px',	style:'text-align:center'},
			{caption: ["비고"], 		ref: 'rmrk',		type:'input',  width:'100px',	style:'text-align:center'},
			{caption: ["폐업일"], 		ref: 'clsbizYmd',	type:'datepicker',  width:'100px',	style:'text-align:center', typeinfo : {dateformat :"yy-mm-dd", yearrange:100}},
			{caption: ["등록일"], 		ref: 'regDt',		type:'output',  width:'100px',	style:'text-align:center'},

			{caption: ["삭제"], 		ref: 'delbtn',		type:'button',  width:'60px',	style:'text-align:center', typeinfo : {buttonvalue: '삭제', callback: fn_delRow1}},

			{caption: ["관리번호"], 	ref: 'mngNo',	hidden : true},
		];
		grdDtlBrnoMng = _SBGrid.create(SBGridProperties);
	}


	/* 승인형 조직 조회*/
	const fn_search = async function(){

		let brno = SBUxMethod.get('srch-input-brno');
		let corpNm = SBUxMethod.get('srch-input-corpNm');

		let postJsonPromise = gfn_postJSON("/pd/bsm/selectBrnoMngList.do", {
			brno:brno
			,corpNm:corpNm
		});
		let data = await postJsonPromise;
		try{
			jsonBrnoMng.length = 0;
			let totalRecordCount = 0;
			data.resultList.forEach((item, index) => {
				let itemVO = {
						mngNo		: item.mngNo
						,corpNm		: item.corpNm
						,rmrk		: item.rmrk
				}
				jsonBrnoMng.push(itemVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonBrnoMng.length > 0) {
				if(grdBrnoMng.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdBrnoMng.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdBrnoMng.rebuild();
				}else{
					grdBrnoMng.refresh()
				}
			} else {
				grdBrnoMng.setPageTotalCount(totalRecordCount);
				grdBrnoMng.rebuild();
			}
			document.querySelector('#listCount1').innerText = totalRecordCount;

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/* 법인번호 관리 상세조회 */
	const fn_dtlSearch = async function(){

		let nRow = grdBrnoMng.getRow();
		let rowData = grdBrnoMng.getRowData(nRow);
		let mngNo = rowData.mngNo;

		if(gfn_isEmpty(mngNo)) return;

		let postJsonPromise = gfn_postJSON("/pd/bsm/selectDtlBrnoMngList.do", {
			mngNo : mngNo
		});
		let data = await postJsonPromise;
		try{
			jsonDtlBrnoMng.length = 0;
			let totalRecordCount = 0;
			data.resultList.forEach((item, index) => {
				let itemVO = {
						yr			: item.yr
						,brno		: item.brno
						,crno		: item.crno
						,corpNm		: item.corpNm
						,rmrk		: item.rmrk
						,indctSeq	: item.indctSeq
						,reqDt		: item.reqDt
						,clsbizYmd	: item.clsbizYmd
						,mngNo		: item.mngNo
				}
				jsonDtlBrnoMng.push(itemVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonDtlBrnoMng.length > 0) {
				if(grdDtlBrnoMng.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdDtlBrnoMng.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdDtlBrnoMng.rebuild();
				}else{
					grdDtlBrnoMng.refresh()
				}
			} else {
				grdDtlBrnoMng.setPageTotalCount(totalRecordCount);
				grdDtlBrnoMng.rebuild();
			}
			document.querySelector('#listCount2').innerText = totalRecordCount;

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//그리드 클릭시 상세보기 이벤트
	const fn_view = async function (){
		fn_clearForm();

		//데이터가 존재하는 그리드 범위 확인
		var nCol = grdBrnoMng.getCol();
		if (nCol < 1) {
			return;
		}
		var nRow = grdBrnoMng.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}

		//서치폼에서 클릭시 디테일폼에 데이터출력
		let rowData = grdBrnoMng.getRowData(nRow);

		SBUxMethod.set('dtl-inp-mngNo'	,gfn_nvl(rowData.mngNo))	//관리번호

		fn_dtlSearch();
	}

	const fn_clearForm = async function (){
		SBUxMethod.set('dtl-inp-mngNo'	,null)	//관리번호

		jsonDtlBrnoMng.length=0;
		grdDtlBrnoMng.rebuild();
	}

	/**
	 * 저장 버튼
	 */
	const fn_save = async function() {

		if(!confirm("저장 하시겠습니까?")){
			return
		}

		let gridData = grdBrnoMng.getGridDataAll();
		let saveList = [];

		//테이블 해더 row수
		let captionRow = grdBrnoMng.getFixedRows();
		for(var i = captionRow; i < gridData.length + captionRow; i++ ){
			let rowData = grdBrnoMng.getRowData(i);
			let rowSts = grdBrnoMng.getRowStatus(i);
			//console.log(rowData);
			//console.log(rowSts);
			if(rowData.checked == 'Y'){
				if(gfn_isEmpty(rowData.corpNm)){
					gfn_comAlert("W0002", "법인명");//W0002 : {0}을/를 입력하세요.
					return;
				}
				rowData.brno = "0";
				if (rowSts === 3 || rowSts === 1){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					saveList.push(rowData);
				} else {
					continue;
				}
			}
		}

		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let postJsonPromise = gfn_postJSON("/pd/bsm/multiSaveBrnoMngList.do", saveList);
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

	/**
	 * 저장 버튼
	 */
	const fn_saveDtl = async function() {

		//관리번호가 있어야만 가능함
		let mngNo = SBUxMethod.get("dtl-inp-mngNo");
		if(gfn_isEmpty(mngNo)) return;

		//필수값 체크
		if(fn_checkRequiredInput()){
			return;
		}

		// 변경 저장
		fn_subUpdateDtl(confirm("저장 하시겠습니까?"));
	}

	//필수값 확인
	function fn_checkRequiredInput(){
		//그리드 필수갑 확인
		//let gridData = grdDtlBrnoMng.getGridDataAll();

		return false;
	}

	//선택 저장
	const fn_subUpdateDtl = async function(isConfirmed){
		if (!isConfirmed) return;

		let gridData = grdDtlBrnoMng.getGridDataAll();
		let saveList = [];

		let mngNo = SBUxMethod.get("dtl-inp-mngNo");

		//테이블 해더 row수
		let captionRow = grdDtlBrnoMng.getFixedRows();
		for(var i = captionRow; i < gridData.length + captionRow; i++ ){
			let rowData = grdDtlBrnoMng.getRowData(i);
			let rowSts = grdDtlBrnoMng.getRowStatus(i);

			if(rowSts == '3' || rowSts == '1'){
				rowData.rowSts = 'I';
				saveList.push(rowData);
			}else if(rowSts == '2'){
				rowData.rowSts = 'U';
				saveList.push(rowData);
			}else{
				continue;
			}
		}

		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let postJsonPromise = gfn_postJSON("/pd/bsm/multiSaveBrnoMngList.do", saveList);
		let data = await postJsonPromise;
		try {
			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
				fn_view();//상세조회
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
		grdBrnoMng.addRow();
	}
	//상세 행추가
	const fn_addRowDtl = async function (){
		let mngNo = SBUxMethod.get("dtl-inp-mngNo");
		if(gfn_isEmpty(mngNo)) return;

		grdDtlBrnoMng.addRow();
	}

	const fn_delRow = async function (){
		let objGrid = grdBrnoMng;

		let nRow = objGrid.getRow();

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

	//선택행 삭제
	const fn_delRow1 = async function (){
		let mngNo = SBUxMethod.get("dtl-inp-mngNo");
		if(gfn_isEmpty(mngNo)) return;

		let objGrid = grdDtlBrnoMng;
		let nRow = objGrid.getRow();

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
		let postJsonPromise = gfn_postJSON("/pd/bsm/deleteBrnoMng.do", vo);
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
		//관리번호가 있을경우만
		let mngNo = SBUxMethod.get("dtl-inp-mngNo");
		if(gfn_isEmpty(mngNo)) return;

		popBrnoMng.init(fn_setGridBrnoMng);
		SBUxMethod.openModal('modal-brnoMng');
	}

	// 조직 선택 팝업 콜백 함수
	const fn_setGridBrnoMng = function(rowData) {
		if (!gfn_isEmpty(rowData)) {
			//그리드 객체
			let objGrid = grdDtlBrnoMng;

			let gridData = objGrid.getGridDataAll();
			for(var i=1; i<=gridData.length; i++ ){
				let gridRowData = objGrid.getRowData(i);
				if ($.trim(rowData.brno) === $.trim(gridRowData.brno)){
					gfn_comAlert("E0000", "동일한 사업자번호가 있습니다.");
					return false;
				}
			}

			let mngNo = SBUxMethod.get("dtl-inp-mngNo");

			objGrid.addRow(true , {
				mngNo	: mngNo
				,brno 	: rowData.brno
				,crno 	: rowData.crno
				,corpNm : rowData.corpNm
				,apoCd 	: rowData.apoCd
			});
		}
	}
</script>
</html>