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
					<!-- 사업계획서 등록 관리 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 12%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">

						<col style="width: 11%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">

						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" >신청년도</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-spinner
									id="srch-input-yr"
									name="srch-input-yr"
									uitype="normal"
									step-value="1"
								></sbux-spinner>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg" >사업자번호</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="srch-input-brno"
									name="srch-input-brno"
									class="form-control input-sm srch-keyup-area"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							<td style="border-right: hidden;"></td>
							<th colspan="2" scope="row" class="th_bg" >법인명</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-corpNm"
									name="srch-input-corpNm"
									class="form-control input-sm srch-keyup-area"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="1" class="td_input">
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" >사업계획서/전환서<br>파일 유무</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="srch-input-bpChk"
									name="srch-input-bpChk"
									uitype="single"
									jsondata-ref="jsonComBpChk"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg" >서명포함 스캔본<br>파일 유무</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="srch-input-sChk"
									name="srch-input-sChk"
									uitype="single"
									jsondata-ref="jsonComSChk"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
							<td colspan="6" class="td_input">
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div style="">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶조직 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdBizPlanReqMng" style="height:350px; width: 100%;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	<!-- pdf샘플 팝업 -->
	<div>
		<sbux-modal
			id="modal-bizPlanPdfViewer"
			name="modal-bizPlanPdfViewer"
			uitype="middle"
			header-title="제출서류 보기"
			body-html-id="body-modal-pdfViewer"
			footer-is-close-button="false"
			style="width:1000px"
		></sbux-modal>
	</div>
	<div id="body-modal-pdfViewer">
		<jsp:include page="/WEB-INF/view/apcss/pd/popup/BizPlanPdfViewerPopup.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let now = new Date();
		let year = now.getFullYear();
		SBUxMethod.set("srch-input-yr",year);//

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

	//var jsonComCmptnInst = [];//관할기관

	//사업계획서/전환서 파일 유무
	var jsonComBpChk = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'N'}
	];
	//서명포함 스캔본 파일 유무
	var jsonComSChk = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'N'}
	];
	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			//gfn_setComCdSBSelect('srch-input-cmptnInst', 	jsonComCmptnInst, 	'CMPTNC_INST'), //관할기관
		]);
	}

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_bizPlanCreateGrid();
		await fn_initSBSelect();
		await fn_search();
	}

	//그리드 변수
	var jsonBizPlanReqMng = []; // 그리드의 참조 데이터 주소 선언
	var grdBizPlanReqMng;


	/* Grid 화면 그리기 기능*/
	const fn_bizPlanCreateGrid = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdBizPlanReqMng';
		SBGridProperties.id = 'grdBizPlanReqMng';
		SBGridProperties.jsonref = 'jsonBizPlanReqMng';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
			};

		SBGridProperties.columns = [
			{caption: ["등록년도","등록년도"], 		ref: 'yr',				type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["법인명","법인명"], 			ref: 'corpNm',			type:'output',  width:'150px',	style:'text-align:center'},
			{caption: ["사업자번호","사업자번호"], 		ref: 'brno',			type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["법인번호","법인번호"], 		ref: 'crno',			type:'output',  width:'96px',	style:'text-align:center'},
			{caption: ["최종업로드시간","최종업로드시간"], 	ref: 'lastUldDt',		type:'output',  width:'150px',	style:'text-align:center'},
			{caption: ["사업계획서/전환서","제출여부"], 	ref: 'bizPlanSbmsnYn',	type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["사업계획서/전환서","승인여부"], 	ref: 'bizPlanAprvYn',	type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["서명 포함 스캔본","제출여부"], 	ref: 'sgntrSbmsnYn',	type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["서명 포함 스캔본","승인여부"], 	ref: 'sgntrAprvYn',		type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["미리보기","미리보기"], 		ref: 'prvwBtn',			type:'button',  width:'80px',	style:'text-align:center'
				,typeinfo : {buttonvalue: '팝업 열기', callback: fn_openMaodalPdfViewer}
			},
			{caption: ["비고","비고"], 				ref: 'rmrk',			type:'output',  width:'150px',	style:'text-align:center'},
		];

		grdBizPlanReqMng = _SBGrid.create(SBGridProperties);
	  	//클릭 이벤트 바인드
		//grdBizPlanReqMng.bind('click','fn_view');
		grdBizPlanReqMng.bind('beforepagechanged', 'fn_pagingBbsList');
	}
	/**
	 * 목록 조회
	 */
	const fn_search = async function() {

		// set pagination
		let pageSize = grdBizPlanReqMng.getPageSize();
		let pageNo = 1;

		fn_setGrdFcltList(pageSize, pageNo);
	}

	const fn_pagingBbsList = async function() {
		let recordCountPerPage = grdBizPlanReqMng.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdBizPlanReqMng.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		fn_setGrdFcltList(recordCountPerPage, currentPageNo);
	}

	/* Grid Row 조회 기능*/
	const fn_setGrdFcltList = async function(pageSize, pageNo){

		fn_clearForm();

		let yr = SBUxMethod.get("srch-input-yr");//
		console.log(yr);

		let brno = SBUxMethod.get("srch-input-brno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

		//bpChk 사업계획서/전환서 파일 확인
		let bpChk = SBUxMethod.get("srch-input-bpChk");//

		//sChk 서명서 포함 스캔본 파일 확인
		let sChk = SBUxMethod.get("srch-input-sChk");//

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectBizPlanReqMngList.do", {
			brno : brno
			,corpNm : corpNm
			,yr : yr

			,bpChk : bpChk
			,sChk : sChk

			//페이징
			,pagingYn : 'Y'
			,currentPageNo : pageNo
	 		,recordCountPerPage : pageSize
		});
		let data = await postJsonPromise;
		try{
			jsonBizPlanReqMng.length = 0;
			let totalRecordCount = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let BizPlanReqMngVO = {
						yr		: item.yr
						,apoCd	: item.apoCd
						,apoSe	: item.apoSe
						,corpNm	: item.corpNm
						,brno	: item.brno
						,crno	: item.crno

						,lastUldDt		: item.lastUldDt
						,bizPlanSbmsnYn	: item.bizPlanSbmsnYn
						,bizPlanAprvYn	: item.bizPlanAprvYn
						,sgntrSbmsnYn	: item.sgntrSbmsnYn
						,sgntrAprvYn	: item.sgntrAprvYn

				}
				jsonBizPlanReqMng.push(BizPlanReqMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonBizPlanReqMng.length > 0) {

				if(grdBizPlanReqMng.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdBizPlanReqMng.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdBizPlanReqMng.rebuild();
				}else{
					grdBizPlanReqMng.refresh()
				}
			} else {
				grdBizPlanReqMng.setPageTotalCount(totalRecordCount);
				grdBizPlanReqMng.rebuild();
			}
			document.querySelector('#listCount').innerText = totalRecordCount;

			//grdBizPlanReqMng.rebuild();

			//조회후 포커스가 이상한곳으로 가있는 경우가 있어서 추가
			window.scrollTo(0, 0);
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//그리드 클릭시 상세보기 이벤트
	function fn_view() {
		//console.log("******************fn_view**********************************");

		fn_clearForm();

		//데이터가 존재하는 그리드 범위 확인
		var nCol = grdBizPlanReqMng.getCol();
		if (nCol < 1) {
			return;
		}
		var nRow = grdBizPlanReqMng.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}

		//서치폼에서 클릭시 디테일폼에 데이터출력
		let rowData = grdBizPlanReqMng.getRowData(nRow);

		//console.log(rowData);
		//SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//

	}
	function fn_clearForm(){
		//SBUxMethod.set('dtl-input-apoCd',null)//
	}


	function fn_create() {
		//console.log("******************fn_create**********************************");
		//SBUxMethod.set('dtl-input-untyYn',null)//
	}


	function fn_GridPop(gubun, grid, nRow, nCol) {
		if (gubun === "pop") {
			if (grid === "grdGpcList") {
				//부른 선택된 그리드 셀의 값을 N 으로 변경
				grdGpcList.setCellData(nRow, nCol, "N", true);
			}
		}
	}

	//pdf 팝업
	const fn_openMaodalPdfViewer = function() {
		let nRow = grdBizPlanReqMng.getRow();
		let rowData = grdBizPlanReqMng.getRowData(nRow);

		//사업자번호
		let brno = gfn_nvl(rowData.brno);
		//등록년도
		let yr = gfn_nvl(rowData.yr);

		console.log(brno,yr);

		if(gfn_isEmpty(brno)){return;}
		if(gfn_isEmpty(yr)){return;}

		popBizPlanPdfViewer.init(rowData , fn_setPdfViewer);
		SBUxMethod.openModal('modal-bizPlanPdfViewer');
	}

	//pdf 팝업 콜백함수
	const fn_setPdfViewer = function(rowData) {
		if (!gfn_isEmpty(rowData)) {
			//SBUxMethod.set("dtl-input-brno", rowData.brno);				//사업자등록번호
		}
	}

</script>
</html>