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
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set><h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
					<sbux-button id="btnSaveFrm" name="btnSaveFrm" uitype="normal" text="연계 등록" class="btn btn-sm btn-outline-danger" onclick="fn_saveFrmerno"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>

					<tbody>
						<tr>
							<th scope="row">농업인 번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-frmerno" name="srch-inp-frmerno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<th class="th_bg">경영체 등록번호</th>
							<td class="td_input" style="border-right:hidden;">
									<sbux-input id="srch-inp-mngmstRegno" name="srch-inp-mngmstRegno" uitype="text" class="form-control input-sm" placeholder="" ></sbux-input>
							</td>
							<td colspan="2" style="border-left: hidden;"></td>
						</tr>

					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶사용자 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdNonCompliantFarmerInfo" style="height:600px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>


</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();

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

	/**
	 * 조회 조건 select combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([

			//gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
			//gfn_setApcItemSBSelect('dtl-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),	// 품목
			//gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', 		jsonApcVrty, gv_selectedApcCd),	// 품종
			//gfn_setComCdSBSelect('dtl-rdo-gdsSeCd', 		jsonComGdsSeCd,	'GDS_SE_CD', gv_selectedApcCd), 		// 상품구분 등록
		]);

		//SBUxMethod.set("dtl-rdo-gdsSeCd", '1');
	}

	var grdNonCompliantFarmerInfo; // 그리드를 담기위한 객체 선언
	var jsonNonCompliantFarmerInfo = []; // 그리드의 참조 데이터 주소 선언

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_fcltMngCreateGrid();
	}

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdNonCompliantFarmerInfo';
		SBGridProperties.id = 'grdNonCompliantFarmerInfo';
		SBGridProperties.jsonref = 'jsonNonCompliantFarmerInfo';
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
			{caption: ["순번"], 			ref: 'sn',				type:'output',	 hidden : false },
			{caption: ["농업인 번호"], 		ref: 'frmerno',			type:'input',	 style:'text-align:center'},
			{caption: ["경영체 등록번호"], 	ref: 'bizYr',			type:'input',	 style:'text-align:center'},
			{caption: ["농지 일련번호"], 	ref: 'bizNm',			type:'input',	 style:'text-align:center'},
			{caption: ["법정동코드"], 		ref: 'vltnCn',			type:'input',	 style:'text-align:center'},
			{caption: ["농지 본번"], 		ref: 'sncnsBgngYr',		type:'input',	 style:'text-align:center'},
			{caption: ["공동 경작 여부"], 	ref: 'sncnsEndYr',		type:'input',	 style:'text-align:center'},
			{caption: ["농지 부번"], 		ref: 'rdmPrgrsCd',		type:'input',	 style:'text-align:center'},
			{caption: ["농지 주소"], 		ref: 'rdmTrgtPrncpl',	type:'input',	 style:'text-align:center'},
			{caption: ["경작 형태"], 		ref: 'rdmTrgtAmt',		type:'input',	 style:'text-align:center'},

			{caption: ["시스템최초입력일시"], 		ref: 'sysFrstInptDt',		type:'input',	 style:'text-align:center'},
			{caption: ["시스템최초입력사용자ID"], 	ref: 'sysFrstInptUserId',	type:'input',	 style:'text-align:center'},
			{caption: ["시스템최초입력프로그램ID"], 	ref: 'sysFrstInptPrgrmId',	type:'input',	 style:'text-align:center'},
			{caption: ["시스템최종변경일시"], 		ref: 'sysLastChgDt',		type:'input',	 style:'text-align:center'},
			{caption: ["시스템최종변경사용자ID"], 	ref: 'sysLastChgUserId',	type:'input',	 style:'text-align:center'},
			{caption: ["시스템최종변경프로그램ID"], 	ref: 'sysLastChgPrgrmId',	type:'input',	 style:'text-align:center'},
			{caption: ["처리"], 		ref: 'delYn', 	type:'button', width:'80px',	style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
				if(strValue== null || strValue == ""){
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdNonCompliantFarmerInfo\", " + nRow + ", " + nCol + ")'>추가</button>";
				}else{
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdNonCompliantFarmerInfo\", " + nRow + ")'>삭제</button>";
				}
			}}

		];
		grdNonCompliantFarmerInfo = _SBGrid.create(SBGridProperties);

		grdNonCompliantFarmerInfo.bind('beforepagechanged', 'fn_pagingBbsList');
		/*
		let rst = await Promise.all([
			fn_initSBSelectFclt(),
			fn_searchFcltList()
		])
		grdNonCompliantFarmerInfo.refresh({"combo":true});

		//클릭 이벤트 바인드
		grdNonCompliantFarmerInfo.bind('click','gridClick');
		*/

	}

	/**
	 * 목록 조회
	 */
	const fn_search = async function() {
		// set pagination
		let pageSize = grdNonCompliantFarmerInfo.getPageSize();
		let pageNo = 1;
		//fn_clearForm();
		fn_searchFcltList(pageSize, pageNo);
	}

	const fn_pagingBbsList = async function() {
		let recordCountPerPage = grdNonCompliantFarmerInfo.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdNonCompliantFarmerInfo.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		fn_searchFcltList(recordCountPerPage, currentPageNo);
	}

	/* Grid Row 조회 기능*/
	const fn_searchFcltList = async function(pageSize, pageNo){
		let frmerno = SBUxMethod.get("srch-inp-frmerno");//
		let mngmstRegno = SBUxMethod.get("srch-inp-mngmstRegno");//

		let postJsonPromise = gfn_postJSON("/fm/farm/selectNonCompliantFarmerInfoList.do", {
			frmerno : frmerno
			,mngmstRegno : mngmstRegno

			//페이징
			,pagingYn : 'Y'
			,currentPageNo : pageNo
			,recordCountPerPage : pageSize
		});
		let data = await postJsonPromise;
		try{
			jsonNonCompliantFarmerInfo.length = 0;
			let totalRecordCount = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let NonCompliantFarmerInfoVO = {
						frmerno 		: item.frmerno
						,bizYr 			: item.bizYr
						,bizNm 			: item.bizNm
						,vltnCn 		: item.vltnCn
						,sncnsBgngYr 	: item.sncnsBgngYr
						,sncnsEndYr 	: item.sncnsEndYr
						,rdmPrgrsCd 	: item.rdmPrgrsCd
						,rdmTrgtPrncpl 	: item.rdmTrgtPrncpl
						,rdmTrgtAmt 	: item.rdmTrgtAmt

						,sn 			: item.sn

						,sysFrstInptDt 			: item.sysFrstInptDt
						,sysFrstInptUserId 		: item.sysFrstInptUserId
						,sysFrstInptPrgrmId 	: item.sysFrstInptPrgrmId
						,sysLastChgDt 			: item.sysLastChgDt
						,sysLastChgUserId 		: item.sysLastChgUserId
						,sysLastChgPrgrmId 		: item.sysLastChgPrgrmId

						,delYn 				: item.delYn
				}
				jsonNonCompliantFarmerInfo.push(NonCompliantFarmerInfoVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonNonCompliantFarmerInfo.length > 0) {

				if(grdNonCompliantFarmerInfo.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdNonCompliantFarmerInfo.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdNonCompliantFarmerInfo.rebuild();
				}else{
					grdNonCompliantFarmerInfo.refresh()
				}
			} else {
				grdNonCompliantFarmerInfo.setPageTotalCount(totalRecordCount);
				grdNonCompliantFarmerInfo.rebuild();
			}
			document.querySelector('#listCount').innerText = totalRecordCount;

			//grdNonCompliantFarmerInfo.rebuild();

			//비어 있는 마지막 줄 추가용도?
			//grdNonCompliantFarmerInfo.addRow();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}



	/* Grid Row 저장 기능*/
	const fn_saveFmList = async function(){
		let gridData = grdNonCompliantFarmerInfo.getGridDataAll();
		let saveList = [];
		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdNonCompliantFarmerInfo.getRowData(i);
			let rowSts = grdNonCompliantFarmerInfo.getRowStatus(i);

			let frmerno = rowData.frmerno;
			let mngmstRegno = rowData.mngmstRegno;
			let delYn = rowData.delYn;
			console.log("================delYn================"+delYn);
			if(delYn == 'N'){

				if (gfn_isEmpty(frmerno)) {
					gfn_comAlert("W0002", "농업인 번호");		//	W0002	{0}을/를 입력하세요.
					return;
				}
				 console.log("rowData==========="+ rowData );
				 console.log("================gridClick================");
				if (rowSts === 3){
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

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/fm/farm/multiSaveNonCompliantFarmerInfoList.do", saveList);
			let data = await postJsonPromise;
			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
					fn_searchFcltList();
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
	}


	/* Grid Row 추가 및 삭제 기능*/
	function fn_procRow(gubun, grid, nRow, nCol) {
		if (gubun === "ADD") {
			if (grid === "grdNonCompliantFarmerInfo") {
				grdNonCompliantFarmerInfo.setCellData(nRow, nCol, "N", true);
				grdNonCompliantFarmerInfo.addRow(true);
			}
		}
		else if (gubun === "DEL") {
			if (grid === "grdNonCompliantFarmerInfo") {
				if(grdNonCompliantFarmerInfo.getRowStatus(nRow) == 0 || grdNonCompliantFarmerInfo.getRowStatus(nRow) == 2){
					var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
					if(confirm(delMsg)){
						var NonCompliantFarmerInfoVO = grdNonCompliantFarmerInfo.getRowData(nRow);
						fn_deleteRsrc(NonCompliantFarmerInfoVO);
						grdNonCompliantFarmerInfo.deleteRow(nRow);
					}
				}else{
					grdNonCompliantFarmerInfo.deleteRow(nRow);
				}
			}
		}
	}

	async function fn_deleteRsrc(NonCompliantFarmerInfoVO){
		let postJsonPromise = gfn_postJSON("/fm/farm/deleteNonCompliantFarmerInfo.do", NonCompliantFarmerInfoVO);
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



	let selGridRow;//선택한 행
	let selGridCol;//선택한 열

	//그리드 클릭이벤트
	function gridClick(){
		console.log("================gridClick================");
		//grdNonCompliantFarmerInfo 그리드 객체
		selGridRow = grdNonCompliantFarmerInfo.getRow();
		selGridCol = grdNonCompliantFarmerInfo.getCol();


		let delYnCol = grdNonCompliantFarmerInfo.getColRef('delYn');
		let delYnValue = grdNonCompliantFarmerInfo.getCellData(selGridRow,delYnCol);

		//임력할 데이터 인지 확인
		//추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
		//fn_procRow 의 ADD 확인
		if(delYnValue != 'N'){
			return;
		}
	}


	/* 농지 정보 연계 저장*/
	const fn_saveFrmerno = async function(){
		let frmerno = SBUxMethod.get("srch-inp-frmerno");

		let regMsg = "농지 정보를 연계 저장하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/fm/farm/insertNonCompliantFarmerInfo.do", {
				frmerno : frmerno
			});
			let data = await postJsonPromise;
			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
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
	}


</script>
</html>