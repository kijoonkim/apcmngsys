<%
 /**
  * @Class Name : fcltPrgrsInfo.jsp
  * @Description : 전체 진척도 확인
  * @author SI개발부
  * @since 2024.09.03
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.08.20   	ljw			최초 생성
  * @see
  *
  */
%>
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
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
				<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
			</div>
			<div style="margin-left: auto;">
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' ||  loginVO.userType eq '02'}">
				<sbux-button id="btnRowDataAll" name="btnRowDataAll" uitype="normal" text="전체 로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect1"></sbux-button>
				<sbux-button id="btnRowData" name="btnRowData" uitype="normal" text="진척도 로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect"></sbux-button>
			</c:if>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-primary" onclick="fn_search"></sbux-button>
				<!--
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				-->
			</div>
		</div>
		<!-- apc리스트 -->
		<div class="box-body">
			<!--[pp] 검색 -->
			<table class="table table-bordered tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 7%">
					<col style="width: 6%">
					<col style="width: 2%">
					<col style="width: 5%">
					<col style="width: 2%">

					<col style="width: 7%">
					<col style="width: 4%">
					<col style="width: 2%">
					<col style="width: 3%">
					<col style="width: 3%">
					<col style="width: 3%">

					<col style="width: 7%">
					<col style="width: 6%">
					<col style="width: 3%">
					<col style="width: 3%">
					<col style="width: 3%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="th_bg">조사연도</th>
						<td colspan="2" class="td_input" style="border-right:hidden;">
							<sbux-spinner
									id="srch-inp-crtrYr"
									name="srch-inp-crtrYr"
									uitype="normal"
									step-value="1"
								></sbux-spinner>
						</td>
						<td colspan="2" style="border-right: hidden;">&nbsp;</td>
						<th scope="row" class="th_bg">시도</th>
						<td colspan="3" class="td_input" style="border-right:hidden;">
							<sbux-select
								id="srch-inp-ctpv"
								name="srch-inp-ctpv"
								uitype="single"
								jsondata-ref="jsonComCtpv"
								unselected-text="전체"
								class="form-control input-sm"
								onchange="fn_ctpvChange"
							></sbux-select>
						</td>
						<td colspan="2" class="td_input" style="border-right: hidden;">
						</td>
						<th scope="row" class="th_bg">시군구</th>
						<td colspan="2" class="td_input" style="border-right: hidden;">
							<sbux-select
								id="srch-inp-sgg"
								name="srch-inp-sgg"
								uitype="single"
								jsondata-ref="jsonComSgg"
								unselected-text="전체"
								class="form-control input-sm"
								filter-source-name="srch-inp-ctpv"
								jsondata-filter="mastervalue"
							></sbux-select>
						</td>
						<td colspan="" class="td_input" style="border-right: hidden;">
						</td>
					</tr>
					<tr>
						<th scope="row" class="th_bg">APC명</th>
						<td colspan="2" class="td_input" style="border-right:hidden;">
							<sbux-input
								uitype="text"
								id="srch-inp-apcNm"
								name="srch-inp-apcNm"
								class="form-control input-sm srch-keyup-area"
								autocomplete="off"
								onkeyenter="fn_selectEnterKey"
							></sbux-input>
						</td>
						<td colspan="2" style="border-right: hidden;">&nbsp;</td>
						<th scope="row" class="th_bg">품목명</th>
						<td colspan="3" class="td_input" style="border-right:hidden;">
							<sbux-input
								uitype="text"
								id="srch-inp-itemNm"
								name="srch-inp-itemNm"
								class="form-control input-sm srch-keyup-area"
								autocomplete="off"
								onkeyenter="fn_selectEnterKey"
							></sbux-input>
						</td>
						<td colspan="2" class="td_input" style="border-right: hidden;">
						</td>
						<th scope="row" class="th_bg">부류</th>
						<td colspan="2" class="td_input" style="border-right: hidden;">
							<sbux-select
								id="srch-inp-srchLclsfCd"
								name="srch-inp-srchLclsfCd"
								uitype="single"
								jsondata-ref="jsonComSrchLclsfCd"
								unselected-text="전체"
								class="form-control input-sm"
							></sbux-select>
						</td>
						<td colspan="" class="td_input" style="border-right: hidden;">
						</td>
					</tr>
				</tbody>
			</table>
			</div>
			<div style="display:flex; justify-content: flex-start; margin-top: 10px;" >
				<div>
				</div>
				<div style="margin-left: auto; padding-right: 15px;">
					<!--
					<sbux-button id="btnAllAprv" name="btnAllAprv" uitype="normal" text="전체 반려" class="btn btn-sm btn-outline-danger" onclick="fn_allAprv('Y')"></sbux-button>
					<sbux-button id="btnAllRjct1" name="btnAllRjct1" uitype="normal" text="전체 취소" class="btn btn-sm btn-outline-danger" onclick="fn_allAprv('N')"></sbux-button>
					<sbux-button id="btnAllRjct" name="btnAllRjct" uitype="normal" text="전체 승인" class="btn btn-sm btn-outline-danger" onclick="fn_allAprv('N')"></sbux-button>
					&nbsp;
					 -->
					<sbux-button id="btnPrgrsLastY" name="btnPrgrsLastY" uitype="normal" text="최종제출" class="btn btn-sm btn-outline-danger" onclick="fn_updatePrgrsLast('Y')"></sbux-button>
					<sbux-button id="btnPrgrsLastN" name="btnPrgrsLastN" uitype="normal" text="최종제출 해제" class="btn btn-sm btn-outline-danger" onclick="fn_updatePrgrsLast('N')"></sbux-button>

					<sbux-button id="btnSelCancel" name="btnSelCancel" uitype="normal" text="선택 승인취소" class="btn btn-sm btn-outline-danger" onclick="fn_selAprv('C')"></sbux-button>
					<sbux-button id="btnSelRjct" name="btnSelRjct" uitype="normal" text="선택 반려" class="btn btn-sm btn-outline-danger" onclick="fn_selAprv('N')"></sbux-button>
					<sbux-button id="btnSelAprv" name="btnSelAprv" uitype="normal" text="선택 승인" class="btn btn-sm btn-outline-danger" onclick="fn_selAprv('Y')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">▶검색리스트</span>
							<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
						</li>
					</ul>
				</div>
				<!-- SBGrid를 호출합니다. -->
				<div id="sb-area-grdFcltPrgrsInfo" style="height:450px; width: 100%;"></div>
			</div>
			<div id="sb-area-hiddenGrd" style="height:400px; width: 100%; display: none;"></div>
			<div id="sb-area-hiddenGrd1" style="height:400px; width: 100%; display: none;"></div>
		</div>
	</section>
	<!-- apc 선택 Modal -->
	<div>
		<sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:1000px"></sbux-modal>
	</div>
	<div id="body-modal-apcSelect">
		<jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/apcSelectPopup.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let date = new Date();
		let year  = date.getFullYear();
		SBUxMethod.set("srch-inp-crtrYr", year);//trgtYr -> crtrYr 변경
		/*
		if(gv_apcCd != 0000 || gv_apcCd != null || gv_apcCd != ""){
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};
		*/

		<c:if test="${loginVO.id eq 'admin'}">
		/*테스트*/
		let crtrYr = '2024';
		let apcCd = '0861';
		let apcNm = 'test';
		//SBUxMethod.set("srch-inp-crtrYr", crtrYr);
		//SBUxMethod.set("srch-inp-apcCd", apcCd);
		//SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		<c:if test="${loginVO.userType eq '27' || loginVO.userType eq '28'}">
		//지자체인경우 올해만 볼수 있게 수정
		SBUxMethod.attr('srch-inp-crtrYr', 'readonly', 'true')
		</c:if>

		fn_init();
	});

	function fn_selectEnterKey() {
		if(window.event.keyCode == 13) {
			fn_selectFcltPrgrsInfoList();
		}
	}

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_initSBSelect();
		await fn_fcltPrgrsInfoCreateGrid();
		await fn_selectFcltPrgrsInfoList();
	}

	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군구
	var jsonComSrchLclsfCd = [];	//조회용 부류
	//var jsonGrdComBizSprtCd = [];	//지원유형

	let test = [];

	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			gfn_setComCdSBSelect('srch-inp-ctpv', 	jsonComCtpv, 	'UNTY_CTPV'), 	//시도
			gfn_setComCdSBSelect('srch-inp-sgg', 	jsonComSgg, 	'UNTY_SGG'), 	//시군구
			gfn_setComCdSBSelect('srch-inp-srchLclsfCd', 	jsonComSrchLclsfCd, 	'SRCH_LCLSF_CD'), 	//조회용 부류
			//gfn_setComCdSBSelect('grdFcltPrgrsInfo', 	jsonGrdComBizSprtCd , 	'BIZ_SPRT_CD') 	//지원 유형
			//gfn_setComCdSBSelect('grdFcltPrgrsInfo', 	test , 	'BIZ_SPRT_CD') 	//지원 유형
		]);
	}


	var jsonFcltPrgrsInfo = []; // 그리드의 참조 데이터 주소 선언
	var grdFcltPrgrsInfo;


	const objMenuList01 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld01,			//콜백함수명
			}
		};


	function fn_excelDwnld01() {
		grdFcltPrgrsInfo.exportLocalExcel("시설설치보완", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* Grid 화면 그리기 기능*/
	//농가 리스트
	const fn_fcltPrgrsInfoCreateGrid = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdFcltPrgrsInfo';
		SBGridProperties.id = 'grdFcltPrgrsInfo';
		SBGridProperties.jsonref = 'jsonFcltPrgrsInfo';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
		//SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["체크박스"], 	ref: 'checked', 	width: '40px', type: 'checkbox', style:'text-align: center',
				typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N', ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}}},
			{caption: ["등록년도"],		ref: 'crtrYr',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["APC명"],		ref: 'apcNm',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["최종제출"],		ref: 'prgrsLast',	type:'output',  width:'60px',    style:'text-align:center'},
			{caption: ["1"],		ref: 'prgrs1',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["2"],		ref: 'prgrs2',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["3"],		ref: 'prgrs3',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["4"],		ref: 'prgrs4',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["5"],		ref: 'prgrs5',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["6"],		ref: 'prgrs6',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["7"],		ref: 'prgrs7',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["8"],		ref: 'prgrs8',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["9"],		ref: 'prgrs9',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["10"],		ref: 'prgrs10',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["11"],		ref: 'prgrs11',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["12"],		ref: 'prgrs12',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["13"],		ref: 'prgrs13',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["14"],		ref: 'prgrs14',		type:'output',  width:'40px',    style:'text-align:center'},

			{caption: ["지자체\n(시도)승인"],		ref: 'aprvCtpvStts',	type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["지자체\n(시군구)승인"],	ref: 'aprvSggStts',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["출력"],  ref : 'temp1',      width : '50px',   style : 'text-align:center',    type : 'button', typeinfo:{buttonvalue: '출력', callback: fn_report}},
			{caption: ["apcCd"],	ref: 'apcCd',	hidden : true},
			//{caption: ["행추가여부"],	ref: 'addYn',	hidden : true},
		];

		grdFcltPrgrsInfo = _SBGrid.create(SBGridProperties);

	}

	/**
     * 목록 조회
     */
	const fn_search = async function() {
		// set pagination
		let pageSize = grdFcltPrgrsInfo.getPageSize();
		let pageNo = 1;
		//입력폼 초기화
		//fn_clearForm();

		fn_selectFcltPrgrsInfoList(pageSize, pageNo);
	}

	/**
     * @param {number} pageSize
     * @param {number} pageNo
	*/
	const fn_selectFcltPrgrsInfoList = async function(pageSize, pageNo) {
		//console.log("******************fn_setGrdFcltPrgrsInfoList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let apcNm = SBUxMethod.get("srch-inp-apcNm");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");
		let ctpv = SBUxMethod.get("srch-inp-ctpv");
		let sgg = SBUxMethod.get("srch-inp-sgg");


		const postJsonPromise = gfn_postJSON("/fm/fclt/selectPrgrsList.do", {
			apcCd: apcCd,
			apcNm: apcNm,
			crtrYr: crtrYr,
			ctpv: ctpv,
			sgg: sgg,

			// pagination
			//pagingYn : 'Y',
			//currentPageNo : pageNo,
			//recordCountPerPage : pageSize
		});
		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			jsonFcltPrgrsInfo.length = 0;
			let totalRecordCount = data.resultList.length;
			data.resultList.forEach((item, index) => {
				//console.log(item);
				let itemVO = {
						apcCd			:item.apcCd
						,apcNm			:item.apcNm
						,crtrYr			:item.crtrYr
						,prgrs1			:fn_prgrsChnage(item.prgrs1)
						,prgrs2			:fn_prgrsChnage(item.prgrs2)
						,prgrs3			:fn_prgrsChnage(item.prgrs3)
						,prgrs4			:fn_prgrsChnage(item.prgrs4)
						,prgrs5			:fn_prgrsChnage(item.prgrs5)
						,prgrs6			:fn_prgrsChnage(item.prgrs6)
						,prgrs7			:fn_prgrsChnage(item.prgrs7)
						,prgrs8			:fn_prgrsChnage(item.prgrs8)
						,prgrs9			:fn_prgrsChnage(item.prgrs9)
						,prgrs10		:fn_prgrsChnage(item.prgrs10)
						,prgrs11		:fn_prgrsChnage(item.prgrs11)
						,prgrs12		:fn_prgrsChnage(item.prgrs12)
						,prgrs13		:fn_prgrsChnage(item.prgrs13)
						,prgrs14		:fn_prgrsChnage(item.prgrs14)
						,prgrsLast		:item.prgrsLast

						,aprvAtStts		:item.aprvAtStts	//승인상태 AT
						,aprvCtpvStts	:item.aprvCtpvStts	//승인상태 지자체(시도)
						,aprvSggStts	:item.aprvSggStts	//승인상태 지자체(시군구)

				}
				jsonFcltPrgrsInfo.push(itemVO);
			});



			if (jsonFcltPrgrsInfo.length > 0) {

				if(grdFcltPrgrsInfo.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdFcltPrgrsInfo.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdFcltPrgrsInfo.rebuild();
				}else{
					grdFcltPrgrsInfo.refresh()
				}
			} else {
				grdFcltPrgrsInfo.setPageTotalCount(totalRecordCount);
				grdFcltPrgrsInfo.rebuild();
			}
			document.querySelector('#listCount').innerText = totalRecordCount;

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			//console.error("failed", e.message);
		}
	}
	//진척도 기호 변환
	function fn_prgrsChnage(val) {
		if(val == 'Y'){
			return '○';
		}else if(val == 'T'){
			return '△';
		}else{
			return '';
		}
	}



	//등록
	const fn_save = async function() {
		//console.log("******************fn_save**********************************");

		let yearArr = document.querySelectorAll("input[data-year='0']");
		yearArr.forEach(e => {
			if(e.value != "" && e.value.length != 4){
				alert("사업연도는 네자리로 작성해주세요. 예) 2023");
				result++;
				return e.focus();
			}
		});
		//alert('준비중');
		fn_subInsert(confirm("등록 하시겠습니까?"));
	}


	//신규 등록
	const fn_subInsert = async function (isConfirmed){
		//console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

		let gridData = grdFcltPrgrsInfo.getGridDataAll();
		let saveList = [];

		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdFcltPrgrsInfo.getRowData(i);
			let rowSts = grdFcltPrgrsInfo.getRowStatus(i);

			rowData.prgrsYn = 'Y';//진척도 갱신 유무

			if (rowSts === 1){
				rowData.rowSts = "I";
				saveList.push(rowData);
			} else if (rowSts === 2){
				rowData.rowSts = "U";
				saveList.push(rowData);
			} else if (rowSts === 3){
				rowData.rowSts = "I";
				saveList.push(rowData);
			} else {
				continue;
			}
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltPrgrsInfoList.do", saveList);

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
				fn_search();
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
		}
		// 결과 확인 후 재조회
		//console.log("insert result", data);
	}


	// apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setApc = function(apc) {
		//console.log("======fn_setApc=======");
		//console.log(apc);
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
		//console.log("======fn_setApc====end===");
	}

	//시도 변경 이벤트
	const fn_ctpvChange = async function(){
		SBUxMethod.set("srch-inp-sgg", "");
	}

	// 선택 승인 반려 취소
	async function fn_selAprv(ynVal){

		const saveList = [];
		const allData = grdFcltPrgrsInfo.getGridDataAll();

		for ( let i=0; i< allData.length; i++) {
			const item = allData[i];
			if (item.checked === "Y") {
				saveList.push({
					crtrYr: 	item.crtrYr,
					apcCd: 		item.apcCd,
					aprvYn:		ynVal,
				});
			}
		}

		if (saveList.length == 0) {
			gfn_comAlert("W0001", "대상");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		let strVal = "";
		if(ynVal == "Y"){
			strVal = "승인";
		}else if(ynVal == "N"){
			strVal = "반려";
		}else if(ynVal == "C"){
			strVal = "취소";
		}
		if (!gfn_comConfirm("Q0001", strVal)) {
			return;
		}

		let postJsonPromise = gfn_postJSON("/fm/fclt/multiSaveAprv.do", saveList);

		let data = await postJsonPromise;

		try{
			//console.log(data);
			fn_search();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	// 선택 승인 반려 취소 , 최종제출 해제
	async function fn_updatePrgrsLast(ynVal){

		const saveList = [];
		const allData = grdFcltPrgrsInfo.getGridDataAll();
		for ( let i=0; i< allData.length; i++) {
			const item = allData[i];
			if (item.checked === "Y") {
				saveList.push({
					crtrYr: 	item.crtrYr,
					apcCd: 		item.apcCd,
					prgrsLast:	ynVal,
				});
			}
		}

		if (saveList.length == 0) {
			gfn_comAlert("W0001", "대상");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		let confirmStr = ""
		if(ynVal == "Y"){
			confirmStr = "최종제출"
		}else if(ynVal == "N"){
			confirmStr = "최종제출 해제"
		}else{
			return;
		}
		if (!gfn_comConfirm("Q0001", confirmStr)) {
			return;
		}

		let postJsonPromise = gfn_postJSON("/fm/fclt/multiSavePrgrsLast.do", saveList);

		let data = await postJsonPromise;

		try{
			//console.log(data);
			fn_search();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//출력 버튼 처리
	const fn_report = async function() {
		//let apcCd = SBUxMethod.get("dtl-inp-apcCd");
		//let crtrYr  =  SBUxMethod.get("dtl-inp-crtrYr");
		let nRow = grdFcltPrgrsInfo.getRow();
		let rowData = grdFcltPrgrsInfo.getRowData(nRow);

		let apcCd = rowData.apcCd;
		let crtrYr = rowData.crtrYr;
		//console.log(apcCd,crtrYr);

		if(apcCd == null || apcCd == "" || apcCd === undefined){
			return;
		}
		if(gfn_isEmpty(crtrYr)){
			return;
		}
		//comReport.js
		gfn_popClipReport("APC전수조사", "fm/fcltReport.crf", {
			apcCd 		: gfn_nvl(apcCd)
			, crtrYr 	: gfn_nvl(crtrYr)
		});
	}

	/* 로우데이터 요청 */

	var jsonHiddenGrd = []; // 그리드의 참조 데이터 주소 선언
	var hiddenGrd;

	/* Grid 화면 그리기 기능*/
	const fn_hiddenGrd = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-hiddenGrd';
		SBGridProperties.id = 'hiddenGrd';
		SBGridProperties.jsonref = 'jsonHiddenGrd';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["등록년도"],		ref: 'crtrYr',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["APC코드"],	ref: 'apcCd',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["APC명"],		ref: 'apcNm',		type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["APC행정구역코드(법정동코드)"],	ref: 'apcAdmCd',	type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시도명"],			ref: 'ctpvNm',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시군구명"],			ref: 'sggNm',		type:'output',  width:'80px',    style:'text-align:center'},

			{caption: ["최종제출"],		ref: 'prgrsLast',	type:'output',  width:'60px',    style:'text-align:center'},
			{caption: ["1"],		ref: 'prgrs1',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["2"],		ref: 'prgrs2',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["3"],		ref: 'prgrs3',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["4"],		ref: 'prgrs4',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["5"],		ref: 'prgrs5',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["6"],		ref: 'prgrs6',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["7"],		ref: 'prgrs7',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["8"],		ref: 'prgrs8',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["9"],		ref: 'prgrs9',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["10"],		ref: 'prgrs10',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["11"],		ref: 'prgrs11',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["12"],		ref: 'prgrs12',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["13"],		ref: 'prgrs13',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["14"],		ref: 'prgrs14',		type:'output',  width:'40px',    style:'text-align:center'},

			{caption: ["지자체(시도)승인"],		ref: 'aprvCtpvStts',	type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시도 승인일"],			ref: 'aprvCtpvDt',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["지자체(시군구)승인"],		ref: 'aprvSggStts',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시군구 승인일"],			ref: 'aprvSggDt',		type:'output',  width:'80px',    style:'text-align:center'},


			{caption: ["시도 담당자 명"],			ref: 'ctpvPicNm',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시도 담당자 회사전화번호"],		ref: 'ctpvCoTelno',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시도 담당자 휴대폰번호"],		ref: 'ctpvMblTelno',	type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시도 담당자 아이디"],			ref: 'aprvCtpvUserId',		type:'output',  width:'80px',    style:'text-align:center'},

			{caption: ["시군구 담당자 명"],			ref: 'sggPicNm',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시군구 담당자 회사전화번호"],		ref: 'sggCoTelno',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시군구 담당자 휴대폰번호"],		ref: 'sggMblTelno',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시군구 담당자 아이디"],			ref: 'aprvSggUserId',		type:'output',  width:'80px',    style:'text-align:center'},

		];

		hiddenGrd = _SBGrid.create(SBGridProperties);
	}

	const fn_hiddenGrdSelect = async function(){
		await fn_hiddenGrd();//그리드 생성

		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");
		let ctpv = SBUxMethod.get("srch-inp-ctpv");
		let sgg = SBUxMethod.get("srch-inp-sgg");
		if (gfn_isEmpty(crtrYr)) {
			let now = new Date();
			let year = now.getFullYear();
			crtrYr = year;
		}

		//userId로 지자체 시도 시군구 값 알아내서 처리
		let postJsonPromise = gfn_postJSON("/fm/fclt/selectPrgrsRawData.do", {
			crtrYr : crtrYr
			,ctpv : ctpv
			,sgg : sgg
		});

		let data = await postJsonPromise;
		try{
			jsonHiddenGrd.length = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO = {
						crtrYr			:item.crtrYr
						,apcCd			:item.apcCd
						,apcNm			:item.apcNm

						,prgrs1			:fn_prgrsChnage(item.prgrs1)
						,prgrs2			:fn_prgrsChnage(item.prgrs2)
						,prgrs3			:fn_prgrsChnage(item.prgrs3)
						,prgrs4			:fn_prgrsChnage(item.prgrs4)
						,prgrs5			:fn_prgrsChnage(item.prgrs5)
						,prgrs6			:fn_prgrsChnage(item.prgrs6)
						,prgrs7			:fn_prgrsChnage(item.prgrs7)
						,prgrs8			:fn_prgrsChnage(item.prgrs8)
						,prgrs9			:fn_prgrsChnage(item.prgrs9)
						,prgrs10		:fn_prgrsChnage(item.prgrs10)
						,prgrs11		:fn_prgrsChnage(item.prgrs11)
						,prgrs12		:fn_prgrsChnage(item.prgrs12)
						,prgrs13		:fn_prgrsChnage(item.prgrs13)
						,prgrs14		:fn_prgrsChnage(item.prgrs14)
						,prgrsLast		:item.prgrsLast

						,aprvAtStts		:item.aprvAtStts	//승인상태 AT
						,aprvCtpvStts	:item.aprvCtpvStts	//승인상태 지자체(시도)
						,aprvSggStts	:item.aprvSggStts	//승인상태 지자체(시군구)

						,apcAdmCd		:item.apcAdmCd		//APC도로명코드
						,ctpvNm			:item.ctpvNm		//시도명
						,sggNm			:item.sggNm			//시군구명

						,aprvCtpvDt		:item.aprvCtpvDt	//시도 승인일
						,aprvSggDt		:item.aprvSggDt		//시군구 승인일

						,ctpvPicNm		:item.ctpvPicNm		//시도 담당자 명
						,ctpvCoTelno	:item.ctpvCoTelno	//시도 담당자 회사전화번호
						,ctpvMblTelno	:item.ctpvMblTelno	//시도 담당자 휴대폰번호
						,aprvCtpvUserId	:item.aprvCtpvUserId	//시도 담당자 아이디

						,sggPicNm		:item.sggPicNm		//시군구 담당자 명
						,sggCoTelno		:item.sggCoTelno	//시군구 담당자 회사전화번호
						,sggMblTelno	:item.sggMblTelno	//시군구 담당자 휴대폰번호
						,aprvSggUserId	:item.aprvSggUserId		//시군구 담당자 아이디
				}
				jsonHiddenGrd.push(hiddenGrdVO);
			});

			await hiddenGrd.rebuild();

			await fn_excelDown();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//로우 데이터 엑셀 다운로드
	function fn_excelDown(){
		const currentDate = new Date();

		const year = currentDate.getFullYear().toString().padStart(4, '0');
		const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
		const day = currentDate.getDate().toString().padStart(2, '0');
		let formattedDate = year + month + day;

		let fileName = formattedDate + "_전체진척도관리_로우데이터";

		/*
		datagrid.exportData(param1, param2, param3, param4);
		param1(필수)[string]: 다운 받을 파일 형식
		param2(필수)[string]: 다운 받을 파일 제목
		param3[boolean]: 다운 받을 그리드 데이터 기준 (default:'false')
		→ true : csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 다운로드
		→ false : csv/xls/xlsx 형식의 데이터 다운로드를 jsonref 기준으로 다운로드
		param4[object]: 다운 받을 그리드 데이터 기준 (default:'false')
		→ arrRemoveCols(선택): csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 할 때 다운로드에서 제외할 열
		→ combolabel(선택) : csv/xls/xlsx combo/inputcombo 일 때 label 값으로 저장
		→ true : label 값으로 저장
		→ false : value 값으로 저장
		→ sheetName(선택) : xls/xlsx 형식의 데이터 다운로드시 시트명을 설정
		 */
		//console.log(hiddenGrd.exportData);
		hiddenGrd.exportData("xlsx" , fileName , true , true);
	}


	/* 로우데이터 요청 */

	var jsonHiddenGrd1 = []; // 그리드의 참조 데이터 주소 선언
	var hiddenGrd1;

	/* Grid 화면 그리기 기능*/
	const fn_hiddenGrd1 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-hiddenGrd1';
		SBGridProperties.id = 'hiddenGrd1';
		SBGridProperties.jsonref = 'jsonHiddenGrd1';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			/* 운영자개요 */
			{caption: ["등록년도"],		ref: 'crtrYr',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["APC코드"],	ref: 'apcCd',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["APC명"],		ref: 'apcNm',		type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["APC 사업자등록번호"],		ref: 'apcBrno',			type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["운영조직명"],			ref: 'operOgnzNm',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 대표자명"],		ref: 'rprsv',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 사업자등록번호"],	ref: 'operOgnzBrno',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 법인등록번호"],	ref: 'operOgnzCrno',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["주소"],		ref: 'loctn',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["주소상세"],		ref: 'loctnDtl',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["운영조직 행정구역코드(법정동 코드)"],	ref: 'operOgnzAdmCd',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 시도코드"],		ref: 'ctpvCd',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 시도명"],		ref: 'ctpvNm',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 시군구코드"],		ref: 'sigunCd',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 시군구명"],		ref: 'sigunNm',			type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["운영조직 우편번호"],		ref: 'operOgnzZip',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 건물본번"],		ref: 'operOgnzBmno',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 건물부번"],		ref: 'operOgnzSlno',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 도로명코드"],		ref: 'operOgnzRoadNmCd',		type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["APC 주소"],		ref: 'apcLoctn',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 주소상세"],		ref: 'apcLoctnDtl',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["APC 행정구역코드(법정동 코드)"],	ref: 'apcAdmCd',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 시도코드"],		ref: 'apcCtpvCd',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 시도명"],		ref: 'apcCtpvNm',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 시군구코드"],	ref: 'apcSigunCd',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 시군구명"],		ref: 'apcSigunNm',			type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["APC 우편번호"],		ref: 'apcZip',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 건물본번"],		ref: 'apcBmno',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 건물부번"],		ref: 'apcSlno',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 도로명코드"],	ref: 'apcRoadNmCd',		type:'output',  width:'200px',    style:'text-align:center'},

			//{caption: ["입력조직유형"],		ref: 'ognzType',		type:'output',  width:'200px',    style:'text-align:center'},
			//{caption: ["입력조직유형코드"],	ref: 'ognzTypeCd',		type:'output',  width:'200px',    style:'text-align:center'},
			/* 품목 리스트 */
			{caption: ["운영조직 품목코드1"],		ref: 'ognzItemCd1',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 품목명1"],		ref: 'ognzItemNm1',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 품목코드2"],		ref: 'ognzItemCd2',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 품목명2"],		ref: 'ognzItemNm2',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 품목코드3"],		ref: 'ognzItemCd3',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 품목명3"],		ref: 'ognzItemNm3',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 기타품목명"],		ref: 'ognzEtcItemNm',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["운영조직 기타품목 부류"],	ref: 'ognzEtcCtgryNm',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["APC 품목코드1"],		ref: 'apcItemCd1',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목명1"],			ref: 'apcItemNm1',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목코드2"],		ref: 'apcItemCd2',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목명2"],			ref: 'apcItemNm2',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목코드3"],		ref: 'apcItemCd3',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목명3"],			ref: 'apcItemNm3',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 기타품목명"],		ref: 'apcEtcItemNm',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 기타품목 부류"],		ref: 'apcEtcCtgryNm',	type:'output',  width:'200px',    style:'text-align:center'},

			/* 3.1 시설 장비 인력 현황 */
			{caption: ["총건축면적_면적"],		ref: 'cspTotArea',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["총건축면적_비고"],		ref: 'cspTotRmrk',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["집하선별포장장_면적"],		ref: 'cspCfppArea',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["집하선별포장장_비고"],		ref: 'cspCfppRmrk',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["세척․가공 등 처리_면적"],	ref: 'cspClnOprtngPrcsArea',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["세척․가공 등 처리_비고"],	ref: 'cspClnOprtngPrcsRmrk',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["비상품화시설_면적"],		ref: 'cspNgdsFcltArea',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["비상품화시설_비고"],		ref: 'cspNgdsFcltRmrk',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["폐기물 처리_면적"],		ref: 'cspDtpArea',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["폐기물 처리_비고"],		ref: 'cspDtpRmrk',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["예냉고_면적"],			ref: 'strgPlcPrcPlcArea',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["예냉고_비고"],			ref: 'strgPlcPrcPlcRmrk',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장_면적"],			ref: 'strgPlcLwtpStrgArea',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장_비고"],			ref: 'strgPlcLwtpStrgRmrk',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["CA저장고_면적"],		ref: 'strgPlcCaStrgPlcArea',type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["CA저장고_비고"],		ref: 'strgPlcCaStrgPlcRmrk',type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["큐어링_면적"],			ref: 'strgPlcCurnArea',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["큐어링_비고"],			ref: 'strgPlcCurnRmrk',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["일반저장_면적"],			ref: 'strgPlcGnrlStrgArea',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["일반저장_비고"],			ref: 'strgPlcGnrlStrgRmrk',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["기타사항_면적"],			ref: 'strgPlcEtcArea',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["기타사항_비고"],			ref: 'strgPlcEtcRmrk',		type:'output',  width:'200px',    style:'text-align:center'},

			/* 3.2 상품화설비현황 */
			{caption: ["품목1 보유여부"],		ref: 'sortMchnHoldYnFsd1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 규격"],			ref: 'sortMchnSpcfct1',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 제조사"],			ref: 'mkrNm1',				type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목1 당도기"],			ref: 'sortBrckMchn1',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 색택선별"],		ref: 'colorSort1',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 형상선별"],		ref: 'shapSort1',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 가공설비"],		ref: 'mnfcMchn1',			type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목2 보유여부"],		ref: 'sortMchnHoldYnFsd2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 규격"],			ref: 'sortMchnSpcfct2',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 제조사"],			ref: 'mkrNm2',				type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목2 당도기"],			ref: 'sortBrckMchn2',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 색택선별"],		ref: 'colorSort2',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 형상선별"],		ref: 'shapSort2',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 가공설비"],		ref: 'mnfcMchn2',			type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목3 보유여부"],		ref: 'sortMchnHoldYnFsd3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 규격"],			ref: 'sortMchnSpcfct3',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 제조사"],			ref: 'mkrNm3',				type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목3 당도기"],			ref: 'sortBrckMchn3',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 색택선별"],		ref: 'colorSort3',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 형상선별"],		ref: 'shapSort3',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 가공설비"],		ref: 'mnfcMchn3',			type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목4 보유여부"],		ref: 'sortMchnHoldYnFsd4',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 규격"],			ref: 'sortMchnSpcfct4',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 제조사"],			ref: 'mkrNm4',				type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목4 당도기"],			ref: 'sortBrckMchn4',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 색택선별"],		ref: 'colorSort4',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 형상선별"],		ref: 'shapSort4',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 가공설비"],		ref: 'mnfcMchn4',			type:'output',  width:'200px',    style:'text-align:center'},

			/* 3.3 선별기운영 */
			{caption: ["품목1 보유현황"],					ref: 'sortMchnHoldYnOasm1',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 1일(8시간) 최대 처리 능력(톤)"],	ref: 'sortPrcsAblt1',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 연간 처리 물량(톤)"],				ref: 'sortPrcsPrfmnc1',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 연간가동시간(시간)"],				ref: 'sortOprtngHr1',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 평균가동일수(일)(연간가동시간/4시간)"],	ref: 'sortAvgOprtngDcnt1',		type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목2 보유현황"],					ref: 'sortMchnHoldYnOasm2',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 1일(8시간) 최대 처리 능력(톤)"],	ref: 'sortPrcsAblt2',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 연간 처리 물량(톤)"],				ref: 'sortPrcsPrfmnc2',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 연간가동시간(시간)"],				ref: 'sortOprtngHr2',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 평균가동일수(일)(연간가동시간/4시간)"],	ref: 'sortAvgOprtngDcnt2',		type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목3 보유현황"],					ref: 'sortMchnHoldYnOasm3',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 1일(8시간) 최대 처리 능력(톤)"],	ref: 'sortPrcsAblt3',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 연간 처리 물량(톤)"],				ref: 'sortPrcsPrfmnc3',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 연간가동시간(시간)"],				ref: 'sortOprtngHr3',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 평균가동일수(일)(연간가동시간/4시간)"],	ref: 'sortAvgOprtngDcnt3',		type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목4 보유현황"],					ref: 'sortMchnHoldYnOasm4',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 1일(8시간) 최대 처리 능력(톤)"],	ref: 'sortPrcsAblt4',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 연간 처리 물량(톤)"],				ref: 'sortPrcsPrfmnc4',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 연간가동시간(시간)"],				ref: 'sortOprtngHr4',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 평균가동일수(일)(연간가동시간/4시간)"],	ref: 'sortAvgOprtngDcnt4',		type:'output',  width:'200px',    style:'text-align:center'},

			/* 3.4 선별기운영기간 */
			{caption: ["품목1 운영여부"],	ref: 'operYnSn1',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 1월"],		ref: 'operPeriodYn101',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 2월"],		ref: 'operPeriodYn102',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 3월"],		ref: 'operPeriodYn103',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 4월"],		ref: 'operPeriodYn104',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 5월"],		ref: 'operPeriodYn105',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 6월"],		ref: 'operPeriodYn106',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 7월"],		ref: 'operPeriodYn107',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 8월"],		ref: 'operPeriodYn108',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 9월"],		ref: 'operPeriodYn109',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 10월"],		ref: 'operPeriodYn110',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 11월"],		ref: 'operPeriodYn111',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 12월"],		ref: 'operPeriodYn112',		type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목2 운영여부"],	ref: 'operYnSn2',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 1월"],		ref: 'operPeriodYn201',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 2월"],		ref: 'operPeriodYn202',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 3월"],		ref: 'operPeriodYn203',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 4월"],		ref: 'operPeriodYn204',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 5월"],		ref: 'operPeriodYn205',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 6월"],		ref: 'operPeriodYn206',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 7월"],		ref: 'operPeriodYn207',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 8월"],		ref: 'operPeriodYn208',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 9월"],		ref: 'operPeriodYn209',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 10월"],		ref: 'operPeriodYn210',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 11월"],		ref: 'operPeriodYn211',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 12월"],		ref: 'operPeriodYn212',		type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목3 운영여부"],	ref: 'operYnSn3',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 1월"],		ref: 'operPeriodYn301',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 2월"],		ref: 'operPeriodYn302',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 3월"],		ref: 'operPeriodYn303',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 4월"],		ref: 'operPeriodYn304',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 5월"],		ref: 'operPeriodYn305',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 6월"],		ref: 'operPeriodYn306',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 7월"],		ref: 'operPeriodYn307',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 8월"],		ref: 'operPeriodYn308',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 9월"],		ref: 'operPeriodYn309',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 10월"],		ref: 'operPeriodYn310',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 11월"],		ref: 'operPeriodYn311',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 12월"],		ref: 'operPeriodYn312',		type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목4 운영여부"],	ref: 'operYnSn4',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 1월"],		ref: 'operPeriodYn401',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 2월"],		ref: 'operPeriodYn402',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 3월"],		ref: 'operPeriodYn403',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 4월"],		ref: 'operPeriodYn404',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 5월"],		ref: 'operPeriodYn405',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 6월"],		ref: 'operPeriodYn406',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 7월"],		ref: 'operPeriodYn407',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 8월"],		ref: 'operPeriodYn408',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 9월"],		ref: 'operPeriodYn409',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 10월"],		ref: 'operPeriodYn410',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 11월"],		ref: 'operPeriodYn411',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목4 12월"],		ref: 'operPeriodYn412',		type:'output',  width:'200px',    style:'text-align:center'},

			/* 3.5 저온저장고운영 - 상세 */
			{caption: ["저온저장고 보유여부"],					ref: 'lwtpStrgPlcHldYn',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 저장능력(톤)(최대저장)"],		ref: 'strgPlcStrgAblt',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 단기저장실적(톤)(단순출하대기)"],	ref: 'strgPlcStrmStrgAblt',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 장기저장실적(톤)(1개월이상)"],	ref: 'strgPlcLtrmStrgAblt',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 저장가동률(%)((단기+장기실적)/능력*100)"],		ref: 'strgPlcOprtngRt',		type:'output',  width:'200px',    style:'text-align:center'},

			/* 3.5 저온저장고운영 - 운영기간 */
			{caption: ["저온저장고 운영여부"],		ref: 'operYn',				type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 1월"],		ref: 'operPeriodYn1',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 2월"],		ref: 'operPeriodYn2',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 3월"],		ref: 'operPeriodYn3',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 4월"],		ref: 'operPeriodYn4',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 5월"],		ref: 'operPeriodYn5',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 6월"],		ref: 'operPeriodYn6',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 7월"],		ref: 'operPeriodYn7',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 8월"],		ref: 'operPeriodYn8',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 9월"],		ref: 'operPeriodYn9',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 10월"],		ref: 'operPeriodYn10',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 11월"],		ref: 'operPeriodYn11',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저온저장고 12월"],		ref: 'operPeriodYn12',		type:'output',  width:'200px',    style:'text-align:center'},

			/* 3.6 고용인력 */
			{caption: ["고용인력 내국인 사무실(명)"],	ref: 'hireRgllbrOfc',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["고용인력 내국인 현장(명)"],		ref: 'hireRgllbrSpt',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["고용인력 내국인 연간 임금총계(천원)"],		ref: 'hireTmprWgTotSum',type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["고용인력 내국인 평균임금(1인/1일)(천원)"],	ref: 'hireTmprAvgWg',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["고용인력 내국인 비수기(MIN)(명)"],	ref: 'hireTmprMin',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["고용인력 내국인 성수기(MAX)(명)"],	ref: 'hireTmprMax',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["고용인력 외국인 비수기(MIN)(명)"],	ref: 'hireFrgnrMin',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["고용인력 외국인 성수기(MAX)(명)"],	ref: 'hireFrgnrMax',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["고용인력 외국인 평균(명)"],			ref: 'hireFrgnrAvg',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["고용인력 외국인 주요업무내용"],	ref: 'hireFrgnrTaskCn',	type:'output',  width:'200px',    style:'text-align:center'},

			/* 4.1 스마트자동화현황 */
			{caption: ["품목1 입고	계근대"],			ref: 'wbg1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 입고	바코드 /QR 시스템"],	ref: 'wrhsBrQr1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 입고	키오스크·태블릿"],	ref: 'kskTblt1',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목1 선별	디팔렛타이저"],		ref: 'dptz1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 선별	자동덤핑기"],		ref: 'apm1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 선별	전자식 중량 선별기"],			ref: 'elctrnWghtSortMchn1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 선별	비파괴 당도 선별기"],			ref: 'ndstBrckSortMchn1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 선별	등급별 원물 자동 이송 장치"],	ref: 'grdRawMtrAtmtcTrnsfMchn1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 선별	전자식 대시보드(모니터)"],		ref: 'dshbrd1',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목1 포장	공박스(망․톤백 등) 자동 배출 장치"],	ref: 'emptBxAtmtcExhstMchn1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 포장	자동 박스(망․톤백 등) 포장기"],	ref: 'atmtcBxPckgMchn1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 포장	자동 소포장기"],				ref: 'atmtcSsMchn1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 포장	자동랩핑기"],				ref: 'atmtcWrapMchn1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 포장	자동 중량체크기(포장 시)"],		ref: 'atmtcWghtChckMchn1',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목1 출고	팔렛타이저(로봇팔 등)"],	ref: 'ptz1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 출고	바코드 /QR 시스템"],		ref: 'spmtBrQr1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 저장	온습도 자동제어기"],		ref: 'thAc1',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목1 규격	대"],	ref: 'spcfctCnt1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 규격	조"],	ref: 'spcfctGrp1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목1 규격	등급"],	ref: 'spcfctGrd1',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목2 입고	계근대"],			ref: 'wbg2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 입고	바코드 /QR 시스템"],	ref: 'wrhsBrQr2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 입고	키오스크·태블릿"],	ref: 'kskTblt2',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목2 선별	디팔렛타이저"],		ref: 'dptz2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 선별	자동덤핑기"],		ref: 'apm2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 선별	전자식 중량 선별기"],			ref: 'elctrnWghtSortMchn2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 선별	비파괴 당도 선별기"],			ref: 'ndstBrckSortMchn2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 선별	등급별 원물 자동 이송 장치"],	ref: 'grdRawMtrAtmtcTrnsfMchn2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 선별	전자식 대시보드(모니터)"],		ref: 'dshbrd2',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목2 포장	공박스(망․톤백 등) 자동 배출 장치"],	ref: 'emptBxAtmtcExhstMchn2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 포장	자동 박스(망․톤백 등) 포장기"],	ref: 'atmtcBxPckgMchn2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 포장	자동 소포장기"],				ref: 'atmtcSsMchn2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 포장	자동랩핑기"],				ref: 'atmtcWrapMchn2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 포장	자동 중량체크기(포장 시)"],		ref: 'atmtcWghtChckMchn2',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목2 출고	팔렛타이저(로봇팔 등)"],	ref: 'ptz2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 출고	바코드 /QR 시스템"],		ref: 'spmtBrQr2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 저장	온습도 자동제어기"],		ref: 'thAc2',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목2 규격	대"],	ref: 'spcfctCnt2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 규격	조"],	ref: 'spcfctGrp2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목2 규격	등급"],	ref: 'spcfctGrd2',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목3 입고	계근대"],			ref: 'wbg3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 입고	바코드 /QR 시스템"],	ref: 'wrhsBrQr3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 입고	키오스크·태블릿"],	ref: 'kskTblt3',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목3 선별	디팔렛타이저"],				ref: 'dptz3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 선별	자동덤핑기"],				ref: 'apm3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 선별	전자식 중량 선별기"],			ref: 'elctrnWghtSortMchn3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 선별	비파괴 당도 선별기"],			ref: 'ndstBrckSortMchn3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 선별	등급별 원물 자동 이송 장치"],	ref: 'grdRawMtrAtmtcTrnsfMchn3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 선별	전자식 대시보드(모니터)"],		ref: 'dshbrd3',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목3 포장	공박스(망․톤백 등) 자동 배출 장치"],	ref: 'emptBxAtmtcExhstMchn3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 포장	자동 박스(망․톤백 등) 포장기"],	ref: 'atmtcBxPckgMchn3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 포장	자동 소포장기"],				ref: 'atmtcSsMchn3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 포장	자동랩핑기"],				ref: 'atmtcWrapMchn3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 포장	자동 중량체크기(포장 시)"],		ref: 'atmtcWghtChckMchn3',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목3 출고	팔렛타이저(로봇팔 등)"],	ref: 'ptz3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 출고	바코드 /QR 시스템"],		ref: 'spmtBrQr3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 저장	온습도 자동제어기"],		ref: 'thAc3',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["품목3 규격	대"],	ref: 'spcfctCnt3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 규격	조"],	ref: 'spcfctGrp3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["품목3 규격	등급"],	ref: 'spcfctGrd3',	type:'output',  width:'200px',    style:'text-align:center'},

			/* 4.2 작업단계별 데이터 관리현황 */
			{caption: ["생산정보 관리방법"],				ref: 'prdctnInfoMngMthd',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["생산정보 데이터관리 항목(다수 선택)"],	ref: 'prdctnDtlList',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["입고정보 관리방법"],				ref: 'wrhsInfoMngMthd',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["입고정보 데이터관리 항목(다수 선택)"],	ref: 'wrhsDtlList',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["선별정보 관리방법"],				ref: 'sortInfoMngMthd',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["선별정보 데이터관리 항목(다수 선택)"],	ref: 'sortDtlList',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저장정보 관리방법"],				ref: 'strgInfoMngMthd',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["저장정보 데이터관리 항목(다수 선택)"],	ref: 'strgDtlList',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["포장정보 관리방법"],				ref: 'pckgInfoMngMthd',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["포장정보 데이터관리 항목(다수 선택)"],	ref: 'pckgDtlList',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["작업정보 관리방법"],				ref: 'jobInfoMngMthd',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["작업정보 데이터관리 항목(다수 선택)"],	ref: 'jobDtlList',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["출고정보 관리방법"],				ref: 'spmtInfoMngMthd',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["출고정보 데이터관리 항목(다수 선택)"],	ref: 'spmtDtlList',		type:'output',  width:'200px',    style:'text-align:center'},

			/* 4.3 통합관리시스템 활용현황 */
			{caption: ["통합관리시스템활용 활용여부"],	ref: 'umsYn',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["통합관리시스템활용 생산정보"],	ref: 'umsPrdctnInfo',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["통합관리시스템활용 계량정보"],	ref: 'umsWghInfo',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["통합관리시스템활용 입고정보"],	ref: 'umsWrhsInfo',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["통합관리시스템활용 생산정보"],	ref: 'umsSortInfo',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["통합관리시스템활용 저장정보"],	ref: 'umsStrgInfo',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["통합관리시스템활용 포장정보"],	ref: 'umsPckgInfo',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["통합관리시스템활용 출고정보"],	ref: 'umsSpmtInfo',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["통합관리시스템활용 정산정보"],	ref: 'umsClclnInfo',	type:'output',  width:'200px',    style:'text-align:center'},

			/* 5.1 유통조직 처리실적 */
			{caption: ["유통조직 품목1 총취급액(백만원)"],			ref: 'rtlOgnzTotTrmtAmt1',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목1 일반취급 소계(백만원)"],		ref: 'rtlOgnzGnrlSum1',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목1 일반취급 단순수탁(백만원)"],	ref: 'rtlOgnzGnrlSmplTrst1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목1 일반취급 단순매취(백만원)"],	ref: 'rtlOgnzGnrlSmplEmspap1',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["유통조직 품목1 조직화취급 소계(백만원)"],	ref: 'rtlOgnzOGnzSum1',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목1 조직화취급 공선수탁(백만원)"],	ref: 'rtlOgnzOgnzCprtnSortTrst1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목1 조직화취급 계약매취(백만원)"],	ref: 'rtlOgnzOgnzCtrtEmspap1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목1 취급 물량(톤)"],			ref: 'rtlOgnzTotTrmtVlm1',		type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["유통조직 품목2 총취급액(백만원)"],			ref: 'rtlOgnzTotTrmtAmt2',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목2 일반취급 소계(백만원)"],		ref: 'rtlOgnzGnrlSum2',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목2 일반취급 단순수탁(백만원)"],	ref: 'rtlOgnzGnrlSmplTrst2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목2 일반취급 단순매취(백만원)"],	ref: 'rtlOgnzGnrlSmplEmspap2',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["유통조직 품목2 조직화취급 소계(백만원)"],	ref: 'rtlOgnzOGnzSum2',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목2 조직화취급 공선수탁(백만원)"],	ref: 'rtlOgnzOgnzCprtnSortTrst2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목2 조직화취급 계약매취(백만원)"],	ref: 'rtlOgnzOgnzCtrtEmspap2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목2 취급 물량(톤)"],			ref: 'rtlOgnzTotTrmtVlm2',		type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["유통조직 품목3 총취급액(백만원)"],			ref: 'rtlOgnzTotTrmtAmt3',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목3 일반취급 소계(백만원)"],		ref: 'rtlOgnzGnrlSum3',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목3 일반취급 단순수탁(백만원)"],	ref: 'rtlOgnzGnrlSmplTrst3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목3 일반취급 단순매취(백만원)"],	ref: 'rtlOgnzGnrlSmplEmspap3',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["유통조직 품목3 조직화취급 소계(백만원)"],	ref: 'rtlOgnzOGnzSum3',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목3 조직화취급 공선수탁(백만원)"],	ref: 'rtlOgnzOgnzCprtnSortTrst3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목3 조직화취급 계약매취(백만원)"],	ref: 'rtlOgnzOgnzCtrtEmspap3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목3 취급 물량(톤)"],			ref: 'rtlOgnzTotTrmtVlm3',		type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["유통조직 품목4 총취급액(백만원)"],			ref: 'rtlOgnzTotTrmtAmt4',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목4 일반취급 소계(백만원)"],		ref: 'rtlOgnzGnrlSum4',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목4 일반취급 단순수탁(백만원)"],	ref: 'rtlOgnzGnrlSmplTrst4',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목4 일반취급 단순매취(백만원)"],	ref: 'rtlOgnzGnrlSmplEmspap4',	type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["유통조직 품목4 조직화취급 소계(백만원)"],	ref: 'rtlOgnzOGnzSum4',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목4 조직화취급 공선수탁(백만원)"],	ref: 'rtlOgnzOgnzCprtnSortTrst4',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목4 조직화취급 계약매취(백만원)"],	ref: 'rtlOgnzOgnzCtrtEmspap4',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["유통조직 품목4 취급 물량(톤)"],			ref: 'rtlOgnzTotTrmtVlm4',		type:'output',  width:'200px',    style:'text-align:center'},

			/* 5.2 APC 처리실적 */
			{caption: ["APC 품목1 APC 일반취급(단순 매취 등)(백만원)"],		ref: 'apcGnrlTrmtAmt1',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목1 APC 조직화취급 공선수탁(백만원)"],		ref: 'apcOgnzCprtnSortTrst1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목1 APC 조직화취급 계약매취(백만원)"],		ref: 'apcCtrtEmspap1',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목1 APC 취급액(A)(백만원)"],				ref: 'apcTrmtAmt1',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목1 APC 취급물량(톤)"],					ref: 'apcTrmtVlm1',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목1 APC 취급액 중 산지유통통합조직 출하액(B)(백만원)"],	ref: 'tmSpmtAmt1',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목1 전속출하 비율(B/A*100)(%)"],			ref: 'tmSpmtRt1',			type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["APC 품목2 APC 일반취급(단순 매취 등)(백만원)"],		ref: 'apcGnrlTrmtAmt2',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목2 APC 조직화취급 공선수탁(백만원)"],		ref: 'apcOgnzCprtnSortTrst2',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목2 APC 조직화취급 계약매취(백만원)"],		ref: 'apcCtrtEmspap2',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목2 APC 취급액(A(백만원)"],				ref: 'apcTrmtAmt2',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목2 APC 취급물량(톤)"],					ref: 'apcTrmtVlm2',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목2 APC 취급액 중 산지유통통합조직 출하액(B)(백만원)"],	ref: 'tmSpmtAmt2',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목2 전속출하 비율(B/A*100)(%)"],			ref: 'tmSpmtRt2',			type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["APC 품목3 APC 일반취급(단순 매취 등)(백만원)"],		ref: 'apcGnrlTrmtAmt3',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목3 APC 조직화취급 공선수탁(백만원)"],		ref: 'apcOgnzCprtnSortTrst3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목3 APC 조직화취급 계약매취(백만원)"],		ref: 'apcCtrtEmspap3',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목3 APC 취급액(A)(백만원)"],				ref: 'apcTrmtAmt3',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목3 APC 취급물량(톤)"],					ref: 'apcTrmtVlm3',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목3 APC 취급액 중 산지유통통합조직 출하액(B)(백만원)"],	ref: 'tmSpmtAmt3',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목3 전속출하 비율(B/A*100)(%)"],			ref: 'tmSpmtRt3',			type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["APC 품목4 APC 일반취급(단순 매취 등)(백만원)"],		ref: 'apcGnrlTrmtAmt4',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목4 APC 조직화취급 공선수탁(백만원)"],		ref: 'apcOgnzCprtnSortTrst4',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목4 APC 조직화취급 계약매취(백만원)"],		ref: 'apcCtrtEmspap4',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목4 APC 취급액(A)(백만원)"],				ref: 'apcTrmtAmt4',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목4 APC 취급물량(톤)"],					ref: 'apcTrmtVlm4',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목4 APC 취급액 중 산지유통통합조직 출하액(B)(백만원)"],	ref: 'tmSpmtAmt4',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["APC 품목4 전속출하 비율(B/A*100)(%)"],			ref: 'tmSpmtRt4',			type:'output',  width:'200px',    style:'text-align:center'},

			/* 5.3 APC 처리상품 주요판매처 */
			{caption: ["산지유통판매처 대형유통업체(백화점 포함)(백만원)"],	ref: 'apcNtslAmtLgszRtl',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["산지유통판매처 식자재업체(학교급식, 가공업체 포함)(백만원)"],	ref: 'apcNtslAmtFoodMtrl',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["산지유통판매처 도매시장(공판장 포함)(백만원)"],		ref: 'apcNtslAmtWhlslMrkt',			type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["산지유통판매처 aT온라인 도매시장(백만원)"],		ref: 'apcNtslAmtOnlnWhlslMrkt',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["산지유통판매처 소매업체 직판(백만원)"],			ref: 'apcNtslAmtBzenty',			type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["산지유통판매처 수출(백만원)"],			ref: 'apcNtslAmtExprt',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["산지유통판매처 홈쇼핑(TV매체)(백만원)"],	ref: 'apcNtslAmtHmsp',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["산지유통판매처 온라인(B2B)(백만원)"],		ref: 'apcNtslAmtOnlnB2b',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["산지유통판매처 온라인(B2C)(백만원)"],		ref: 'apcNtslAmtOnlnB2c',	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["산지유통판매처 기타(백만원)"],			ref: 'apcNtslAmtEtc',		type:'output',  width:'200px',    style:'text-align:center'},

			{caption: ["최종제출"],		ref: 'prgrsLast',	type:'output',  width:'60px',    style:'text-align:center'},
			{caption: ["1"],		ref: 'prgrs1',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["2"],		ref: 'prgrs2',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["3"],		ref: 'prgrs3',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["4"],		ref: 'prgrs4',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["5"],		ref: 'prgrs5',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["6"],		ref: 'prgrs6',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["7"],		ref: 'prgrs7',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["8"],		ref: 'prgrs8',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["9"],		ref: 'prgrs9',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["10"],		ref: 'prgrs10',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["11"],		ref: 'prgrs11',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["12"],		ref: 'prgrs12',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["13"],		ref: 'prgrs13',		type:'output',  width:'40px',    style:'text-align:center'},
			{caption: ["14"],		ref: 'prgrs14',		type:'output',  width:'40px',    style:'text-align:center'},

			{caption: ["지자체(시도)승인"],		ref: 'aprvCtpvStts',	type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시도 승인일"],			ref: 'aprvCtpvDt',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시도 승인한 아이디"],		ref: 'aprvCtpvUserId',	type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["지자체(시군구)승인"],		ref: 'aprvSggStts',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시군구 승인일"],			ref: 'aprvSggDt',		type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["시군구 승인한 아이디"],		ref: 'aprvSggUserId',	type:'output',  width:'80px',    style:'text-align:center'},

		];

		hiddenGrd1 = _SBGrid.create(SBGridProperties);
	}

	const fn_hiddenGrdSelect1 = async function(){
		await fn_hiddenGrd1();//그리드 생성

		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");
		//let ctpv = SBUxMethod.get("srch-inp-ctpv");
		//let sgg = SBUxMethod.get("srch-inp-sgg");
		if (gfn_isEmpty(crtrYr)) {
			let now = new Date();
			let year = now.getFullYear();
			crtrYr = year;
		}

		//userId로 지자체 시도 시군구 값 알아내서 처리
		let postJsonPromise = gfn_postJSON("/fm/fclt/selectAllRawData.do", {
			crtrYr : crtrYr
			//,ctpv : ctpv
			//,sgg : sgg
		});

		let data = await postJsonPromise;
		try{
			jsonHiddenGrd1.length = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO = {
						/* 운영자개요 */
						crtrYr			:item.crtrYr
						,apcCd			:item.apcCd
						,apcNm			:item.apcNm
						,apcBrno		:item.apcBrno
						,apcCrno		:item.apcCrno

						,operOgnzNm			:item.operOgnzNm
						,rprsv				:item.rprsv
						,operOgnzBrno		:item.operOgnzBrno
						,operOgnzCrno		:item.operOgnzCrno

						,loctn				:item.loctn
						,loctnDtl			:item.loctnDtl

						,operOgnzAdmCd		:item.operOgnzAdmCd
						,ctpvCd				:item.ctpvCd
						,ctpvNm				:item.ctpvNm
						,sigunCd			:item.sigunCd
						,sigunNm			:item.sigunNm

						,operOgnzZip		:item.operOgnzZip
						,operOgnzBmno		:item.operOgnzBmno
						,operOgnzSlno		:item.operOgnzSlno
						,operOgnzRoadNmCd	:item.operOgnzRoadNmCd

						,apcLoctn			:item.apcLoctn
						,apcLoctnDtl		:item.apcLoctnDtl

						,apcAdmCd			:item.apcAdmCd
						,apcCtpvCd			:item.apcCtpvCd
						,apcCtpvNm			:item.apcCtpvNm
						,apcSigunCd			:item.apcSigunCd
						,apcSigunNm			:item.apcSigunNm

						,apcZip				:item.apcZip
						,apcBmno			:item.apcBmno
						,apcSlno			:item.apcSlno
						,apcRoadNmCd		:item.apcRoadNmCd

						//,ognzType			:item.ognzType
						//,ognzTypeCd			:item.ognzTypeCd

						/* 품목 리스트 */
						,ognzItemCd1		:item.ognzItemCd1
						,ognzItemNm1		:item.ognzItemNm1
						,ognzItemCd2		:item.ognzItemCd2
						,ognzItemNm2		:item.ognzItemNm2
						,ognzItemCd3		:item.ognzItemCd3
						,ognzItemNm3		:item.ognzItemNm3
						,ognzEtcItemNm		:item.ognzEtcItemNm
						,ognzEtcCtgryNm		:item.ognzEtcCtgryNm

						,apcItemCd1			:item.apcItemCd1
						,apcItemNm1			:item.apcItemNm1
						,apcItemCd2			:item.apcItemCd2
						,apcItemNm2			:item.apcItemNm2
						,apcItemCd3			:item.apcItemCd3
						,apcItemNm3			:item.apcItemNm3
						,apcEtcItemNm		:item.apcEtcItemNm
						,apcEtcCtgryNm		:item.apcEtcCtgryNm

						/* 3.1 시설 장비 인력 현황 */
						,cspTotArea				:item.cspTotArea
						,cspTotRmrk				:item.cspTotRmrk
						,cspCfppArea			:item.cspCfppArea
						,cspCfppRmrk			:item.cspCfppRmrk
						,cspClnOprtngPrcsArea	:item.cspClnOprtngPrcsArea
						,cspClnOprtngPrcsRmrk	:item.cspClnOprtngPrcsRmrk
						,cspNgdsFcltArea		:item.cspNgdsFcltArea
						,cspNgdsFcltRmrk		:item.cspNgdsFcltRmrk
						,cspDtpArea				:item.cspDtpArea
						,cspDtpRmrk				:item.cspDtpRmrk
						,strgPlcPrcPlcArea		:item.strgPlcPrcPlcArea
						,strgPlcPrcPlcRmrk		:item.strgPlcPrcPlcRmrk
						,strgPlcLwtpStrgArea	:item.strgPlcLwtpStrgArea
						,strgPlcLwtpStrgRmrk	:item.strgPlcLwtpStrgRmrk
						,strgPlcCaStrgPlcArea	:item.strgPlcCaStrgPlcArea
						,strgPlcCaStrgPlcRmrk	:item.strgPlcCaStrgPlcRmrk
						,strgPlcCurnArea		:item.strgPlcCurnArea
						,strgPlcCurnRmrk		:item.strgPlcCurnRmrk
						,strgPlcGnrlStrgArea	:item.strgPlcGnrlStrgArea
						,strgPlcGnrlStrgRmrk	:item.strgPlcGnrlStrgRmrk
						,strgPlcEtcArea			:item.strgPlcEtcArea
						,strgPlcEtcRmrk			:item.strgPlcEtcRmrk

						/* 3.2 상품화설비현황 */
						,sortMchnHoldYnFsd1		:item.sortMchnHoldYnFsd1
						,sortMchnSpcfct1		:item.sortMchnSpcfct1
						,mkrNm1					:item.mkrNm1
						,sortBrckMchn1			:item.sortBrckMchn1
						,colorSort1				:item.colorSort1
						,shapSort1				:item.shapSort1
						,mnfcMchn1				:item.mnfcMchn1

						,sortMchnHoldYnFsd2		:item.sortMchnHoldYnFsd2
						,sortMchnSpcfct2		:item.sortMchnSpcfct2
						,mkrNm2					:item.mkrNm2
						,sortBrckMchn2			:item.sortBrckMchn2
						,colorSort2				:item.colorSort2
						,shapSort2				:item.shapSort2
						,mnfcMchn2				:item.mnfcMchn2

						,sortMchnHoldYnFsd3		:item.sortMchnHoldYnFsd3
						,sortMchnSpcfct3		:item.sortMchnSpcfct3
						,mkrNm3					:item.mkrNm3
						,sortBrckMchn3			:item.sortBrckMchn3
						,colorSort3				:item.colorSort3
						,shapSort3				:item.shapSort3
						,mnfcMchn3				:item.mnfcMchn3

						,sortMchnHoldYnFsd4		:item.sortMchnHoldYnFsd4
						,sortMchnSpcfct4		:item.sortMchnSpcfct4
						,mkrNm4					:item.mkrNm4
						,sortBrckMchn4			:item.sortBrckMchn4
						,colorSort4				:item.colorSort4
						,shapSort4				:item.shapSort4
						,mnfcMchn4				:item.mnfcMchn4

						/* 3.3 선별기운영 */
						,sortMchnHoldYnOasm1	:item.sortMchnHoldYnOasm1
						,sortPrcsAblt1			:item.sortPrcsAblt1
						,sortPrcsPrfmnc1		:item.sortPrcsPrfmnc1
						,sortOprtngHr1			:item.sortOprtngHr1
						,sortAvgOprtngDcnt1		:item.sortAvgOprtngDcnt1

						,sortMchnHoldYnOasm2	:item.sortMchnHoldYnOasm2
						,sortPrcsAblt2			:item.sortPrcsAblt2
						,sortPrcsPrfmnc2		:item.sortPrcsPrfmnc2
						,sortOprtngHr2			:item.sortOprtngHr2
						,sortAvgOprtngDcnt2		:item.sortAvgOprtngDcnt2

						,sortMchnHoldYnOasm3	:item.sortMchnHoldYnOasm3
						,sortPrcsAblt3			:item.sortPrcsAblt3
						,sortPrcsPrfmnc3		:item.sortPrcsPrfmnc3
						,sortOprtngHr3			:item.sortOprtngHr3
						,sortAvgOprtngDcnt3		:item.sortAvgOprtngDcnt3

						,sortMchnHoldYnOasm4	:item.sortMchnHoldYnOasm4
						,sortPrcsAblt4			:item.sortPrcsAblt4
						,sortPrcsPrfmnc4		:item.sortPrcsPrfmnc4
						,sortOprtngHr4			:item.sortOprtngHr4
						,sortAvgOprtngDcnt4		:item.sortAvgOprtngDcnt4

						/* 3.4 선별기운영기간 */
						,operYnSn1				:item.operYnSn1
						,operPeriodYn101		:item.operPeriodYn101
						,operPeriodYn102		:item.operPeriodYn102
						,operPeriodYn103		:item.operPeriodYn103
						,operPeriodYn104		:item.operPeriodYn104
						,operPeriodYn105		:item.operPeriodYn105
						,operPeriodYn106		:item.operPeriodYn106
						,operPeriodYn107		:item.operPeriodYn107
						,operPeriodYn108		:item.operPeriodYn108
						,operPeriodYn109		:item.operPeriodYn109
						,operPeriodYn110		:item.operPeriodYn110
						,operPeriodYn111		:item.operPeriodYn111
						,operPeriodYn112		:item.operPeriodYn112

						,operYnSn2				:item.operYnSn2
						,operPeriodYn201		:item.operPeriodYn201
						,operPeriodYn202		:item.operPeriodYn202
						,operPeriodYn203		:item.operPeriodYn203
						,operPeriodYn204		:item.operPeriodYn204
						,operPeriodYn205		:item.operPeriodYn205
						,operPeriodYn206		:item.operPeriodYn206
						,operPeriodYn207		:item.operPeriodYn207
						,operPeriodYn208		:item.operPeriodYn208
						,operPeriodYn209		:item.operPeriodYn209
						,operPeriodYn210		:item.operPeriodYn210
						,operPeriodYn211		:item.operPeriodYn211
						,operPeriodYn212		:item.operPeriodYn212

						,operYnSn3				:item.operYnSn3
						,operPeriodYn301		:item.operPeriodYn301
						,operPeriodYn302		:item.operPeriodYn302
						,operPeriodYn303		:item.operPeriodYn303
						,operPeriodYn304		:item.operPeriodYn304
						,operPeriodYn305		:item.operPeriodYn305
						,operPeriodYn306		:item.operPeriodYn306
						,operPeriodYn307		:item.operPeriodYn307
						,operPeriodYn308		:item.operPeriodYn308
						,operPeriodYn309		:item.operPeriodYn309
						,operPeriodYn310		:item.operPeriodYn310
						,operPeriodYn311		:item.operPeriodYn311
						,operPeriodYn312		:item.operPeriodYn312

						,operYnSn4				:item.operYnSn4
						,operPeriodYn401		:item.operPeriodYn401
						,operPeriodYn402		:item.operPeriodYn402
						,operPeriodYn403		:item.operPeriodYn403
						,operPeriodYn404		:item.operPeriodYn404
						,operPeriodYn405		:item.operPeriodYn405
						,operPeriodYn406		:item.operPeriodYn406
						,operPeriodYn407		:item.operPeriodYn407
						,operPeriodYn408		:item.operPeriodYn408
						,operPeriodYn409		:item.operPeriodYn409
						,operPeriodYn410		:item.operPeriodYn410
						,operPeriodYn411		:item.operPeriodYn411
						,operPeriodYn412		:item.operPeriodYn412

						/* 3.5 저온저장고운영 - 상세 */
						,lwtpStrgPlcHldYn		:item.lwtpStrgPlcHldYn
						,strgPlcStrgAblt		:item.strgPlcStrgAblt
						,strgPlcStrmStrgAblt	:item.strgPlcStrmStrgAblt
						,strgPlcLtrmStrgAblt	:item.strgPlcLtrmStrgAblt
						,strgPlcOprtngRt		:item.strgPlcOprtngRt

						/* 3.5 저온저장고운영 - 운영기간 */
						,operYn				:item.operYn
						,operPeriodYn1		:item.operPeriodYn1
						,operPeriodYn2		:item.operPeriodYn2
						,operPeriodYn3		:item.operPeriodYn3
						,operPeriodYn4		:item.operPeriodYn4
						,operPeriodYn5		:item.operPeriodYn5
						,operPeriodYn6		:item.operPeriodYn6
						,operPeriodYn7		:item.operPeriodYn7
						,operPeriodYn8		:item.operPeriodYn8
						,operPeriodYn9		:item.operPeriodYn9
						,operPeriodYn10		:item.operPeriodYn10
						,operPeriodYn11		:item.operPeriodYn11
						,operPeriodYn12		:item.operPeriodYn12

						/* 3.6 고용인력 */
						,hireRgllbrOfc		:item.hireRgllbrOfc
						,hireRgllbrSpt		:item.hireRgllbrSpt
						,hireTmprWgTotSum	:item.hireTmprWgTotSum
						,hireTmprAvgWg		:item.hireTmprAvgWg
						,hireTmprMin		:item.hireTmprMin
						,hireTmprMax		:item.hireTmprMax
						,hireFrgnrMin		:item.hireFrgnrMin
						,hireFrgnrMax		:item.hireFrgnrMax
						,hireFrgnrAvg		:item.hireFrgnrAvg
						,hireFrgnrTaskCn	:item.hireFrgnrTaskCn

						/* 4.1 스마트자동화현황 */
						,wbg1		:item.wbg1
						,wrhsBrQr1	:item.wrhsBrQr1
						,kskTblt1	:item.kskTblt1
						,dptz1		:item.dptz1
						,apm1		:item.apm1
						,elctrnWghtSortMchn1		:item.elctrnWghtSortMchn1
						,ndstBrckSortMchn1			:item.ndstBrckSortMchn1
						,grdRawMtrAtmtcTrnsfMchn1	:item.grdRawMtrAtmtcTrnsfMchn1
						,dshbrd1					:item.dshbrd1
						,emptBxAtmtcExhstMchn1		:item.emptBxAtmtcExhstMchn1
						,atmtcBxPckgMchn1			:item.atmtcBxPckgMchn1
						,atmtcSsMchn1			:item.atmtcSsMchn1
						,atmtcWrapMchn1			:item.atmtcWrapMchn1
						,atmtcWghtChckMchn1		:item.atmtcWghtChckMchn1
						,ptz1			:item.ptz1
						,spmtBrQr1		:item.spmtBrQr1
						,thAc1			:item.thAc1
						,spcfctCnt1		:item.spcfctCnt1
						,spcfctGrp1		:item.spcfctGrp1
						,spcfctGrd1		:item.spcfctGrd1

						,wbg2			:item.wbg2
						,wrhsBrQr2		:item.wrhsBrQr2
						,kskTblt2		:item.kskTblt2
						,dptz2			:item.dptz2
						,apm2			:item.apm2
						,elctrnWghtSortMchn2		:item.elctrnWghtSortMchn2
						,ndstBrckSortMchn2			:item.ndstBrckSortMchn2
						,grdRawMtrAtmtcTrnsfMchn2	:item.grdRawMtrAtmtcTrnsfMchn2
						,dshbrd2					:item.dshbrd2
						,emptBxAtmtcExhstMchn2		:item.emptBxAtmtcExhstMchn2
						,atmtcBxPckgMchn2	:item.atmtcBxPckgMchn2
						,atmtcSsMchn2		:item.atmtcSsMchn2
						,atmtcWrapMchn2		:item.atmtcWrapMchn2
						,atmtcWghtChckMchn2	:item.atmtcWghtChckMchn2
						,ptz2			:item.ptz2
						,spmtBrQr2		:item.spmtBrQr2
						,thAc2			:item.thAc2
						,spcfctCnt2		:item.spcfctCnt2
						,spcfctGrp2		:item.spcfctGrp2
						,spcfctGrd2		:item.spcfctGrd2

						,wbg3			:item.wbg3
						,wrhsBrQr3		:item.wrhsBrQr3
						,kskTblt3		:item.kskTblt3
						,dptz3			:item.dptz3
						,apm3			:item.apm3
						,elctrnWghtSortMchn3		:item.elctrnWghtSortMchn3
						,ndstBrckSortMchn3			:item.ndstBrckSortMchn3
						,grdRawMtrAtmtcTrnsfMchn3	:item.grdRawMtrAtmtcTrnsfMchn3
						,dshbrd3					:item.dshbrd3
						,emptBxAtmtcExhstMchn3		:item.emptBxAtmtcExhstMchn3
						,atmtcBxPckgMchn3	:item.atmtcBxPckgMchn3
						,atmtcSsMchn3		:item.atmtcSsMchn3
						,atmtcWrapMchn3		:item.atmtcWrapMchn3
						,atmtcWghtChckMchn3	:item.atmtcWghtChckMchn3
						,ptz3			:item.ptz3
						,spmtBrQr3		:item.spmtBrQr3
						,thAc3			:item.thAc3
						,spcfctCnt3		:item.spcfctCnt3
						,spcfctGrp3		:item.spcfctGrp3
						,spcfctGrd3		:item.spcfctGrd3

						/* 4.2 작업단계별 데이터 관리현황 */
						,prdctnInfoMngMthd		:item.prdctnInfoMngMthd
						,wrhsInfoMngMthd		:item.wrhsInfoMngMthd
						,sortInfoMngMthd		:item.sortInfoMngMthd
						,strgInfoMngMthd		:item.strgInfoMngMthd
						,pckgInfoMngMthd		:item.pckgInfoMngMthd
						,jobInfoMngMthd			:item.jobInfoMngMthd
						,spmtInfoMngMthd		:item.spmtInfoMngMthd

						,prdctnDtlList		:item.prdctnDtlList
						,wrhsDtlList		:item.wrhsDtlList
						,sortDtlList		:item.sortDtlList
						,strgDtlList		:item.strgDtlList
						,pckgDtlList		:item.pckgDtlList
						,jobDtlList			:item.jobDtlList
						,spmtDtlList		:item.spmtDtlList

							/* 4.3 통합관리시스템 활용현황 */
						,umsYn				:item.umsYn //활용 여부
						,umsPrdctnInfo		:item.umsPrdctnInfo
						,umsWghInfo			:item.umsWghInfo
						,umsWrhsInfo		:item.umsWrhsInfo
						,umsSortInfo		:item.umsSortInfo
						,umsStrgInfo		:item.umsStrgInfo
						,umsPckgInfo		:item.umsPckgInfo
						,umsSpmtInfo		:item.umsSpmtInfo
						,umsClclnInfo		:item.umsClclnInfo

							/* 5.1 유통조직 처리실적 */
						,rtlOgnzTotTrmtAmt1			:item.rtlOgnzTotTrmtAmt1
						,rtlOgnzGnrlSum1			:item.rtlOgnzGnrlSum1
						,rtlOgnzGnrlSmplTrst1		:item.rtlOgnzGnrlSmplTrst1
						,rtlOgnzGnrlSmplEmspap1		:item.rtlOgnzGnrlSmplEmspap1
						,rtlOgnzOGnzSum1			:item.rtlOgnzOGnzSum1
						,rtlOgnzOgnzCprtnSortTrst1	:item.rtlOgnzOgnzCprtnSortTrst1
						,rtlOgnzOgnzCtrtEmspap1		:item.rtlOgnzOgnzCtrtEmspap1
						,rtlOgnzTotTrmtVlm1			:item.rtlOgnzTotTrmtVlm1

						,rtlOgnzTotTrmtAmt2			:item.rtlOgnzTotTrmtAmt2
						,rtlOgnzGnrlSum2			:item.rtlOgnzGnrlSum2
						,rtlOgnzGnrlSmplTrst2		:item.rtlOgnzGnrlSmplTrst2
						,rtlOgnzGnrlSmplEmspap2		:item.rtlOgnzGnrlSmplEmspap2
						,rtlOgnzOGnzSum2			:item.rtlOgnzOGnzSum2
						,rtlOgnzOgnzCprtnSortTrst2	:item.rtlOgnzOgnzCprtnSortTrst2
						,rtlOgnzOgnzCtrtEmspap2		:item.rtlOgnzOgnzCtrtEmspap2
						,rtlOgnzTotTrmtVlm2			:item.rtlOgnzTotTrmtVlm2

						,rtlOgnzTotTrmtAmt3			:item.rtlOgnzTotTrmtAmt3
						,rtlOgnzGnrlSum3			:item.rtlOgnzGnrlSum3
						,rtlOgnzGnrlSmplTrst3		:item.rtlOgnzGnrlSmplTrst3
						,rtlOgnzGnrlSmplEmspap3		:item.rtlOgnzGnrlSmplEmspap3
						,rtlOgnzOGnzSum3			:item.rtlOgnzOGnzSum3
						,rtlOgnzOgnzCprtnSortTrst3	:item.rtlOgnzOgnzCprtnSortTrst3
						,rtlOgnzOgnzCtrtEmspap3		:item.rtlOgnzOgnzCtrtEmspap3
						,rtlOgnzTotTrmtVlm3			:item.rtlOgnzTotTrmtVlm3

						,rtlOgnzTotTrmtAmt4			:item.rtlOgnzTotTrmtAmt4
						,rtlOgnzGnrlSum4			:item.rtlOgnzGnrlSum4
						,rtlOgnzGnrlSmplTrst4		:item.rtlOgnzGnrlSmplTrst4
						,rtlOgnzGnrlSmplEmspap4		:item.rtlOgnzGnrlSmplEmspap4
						,rtlOgnzOGnzSum4			:item.rtlOgnzOGnzSum4
						,rtlOgnzOgnzCprtnSortTrst4	:item.rtlOgnzOgnzCprtnSortTrst4
						,rtlOgnzOgnzCtrtEmspap4		:item.rtlOgnzOgnzCtrtEmspap4
						,rtlOgnzTotTrmtVlm4			:item.rtlOgnzTotTrmtVlm4

							/* 5.2 APC 처리실적 */
						,apcGnrlTrmtAmt1		:item.apcGnrlTrmtAmt1
						,apcOgnzCprtnSortTrst1	:item.apcOgnzCprtnSortTrst1
						,apcCtrtEmspap1			:item.apcCtrtEmspap1
						,apcTrmtAmt1			:item.apcTrmtAmt1
						,apcTrmtVlm1			:item.apcTrmtVlm1
						,tmSpmtAmt1				:item.tmSpmtAmt1
						,tmSpmtRt1				:item.tmSpmtRt1

						,apcGnrlTrmtAmt2		:item.apcGnrlTrmtAmt2
						,apcOgnzCprtnSortTrst2	:item.apcOgnzCprtnSortTrst2
						,apcCtrtEmspap2			:item.apcCtrtEmspap2
						,apcTrmtAmt2			:item.apcTrmtAmt2
						,apcTrmtVlm2			:item.apcTrmtVlm2
						,tmSpmtAmt2				:item.tmSpmtAmt2
						,tmSpmtRt2				:item.tmSpmtRt2

						,apcGnrlTrmtAmt3		:item.apcGnrlTrmtAmt3
						,apcOgnzCprtnSortTrst3	:item.apcOgnzCprtnSortTrst3
						,apcCtrtEmspap3			:item.apcCtrtEmspap3
						,apcTrmtAmt3			:item.apcTrmtAmt3
						,apcTrmtVlm3			:item.apcTrmtVlm3
						,tmSpmtAmt3				:item.tmSpmtAmt3
						,tmSpmtRt3				:item.tmSpmtRt3

						,apcGnrlTrmtAmt4		:item.apcGnrlTrmtAmt4
						,apcOgnzCprtnSortTrst4	:item.apcOgnzCprtnSortTrst4
						,apcCtrtEmspap4			:item.apcCtrtEmspap4
						,apcTrmtAmt4			:item.apcTrmtAmt4
						,apcTrmtVlm4			:item.apcTrmtVlm4
						,tmSpmtAmt4				:item.tmSpmtAmt4
						,tmSpmtRt4				:item.tmSpmtRt4

						/* 5.3 APC 처리상품 주요판매처 */
						,apcNtslAmtLgszRtl			:item.apcNtslAmtLgszRtl
						,apcNtslAmtFoodMtrl			:item.apcNtslAmtFoodMtrl
						,apcNtslAmtWhlslMrkt		:item.apcNtslAmtWhlslMrkt
						,apcNtslAmtOnlnWhlslMrkt	:item.apcNtslAmtOnlnWhlslMrkt
						,apcNtslAmtBzenty			:item.apcNtslAmtBzenty
						,apcNtslAmtExprt			:item.apcNtslAmtExprt
						,apcNtslAmtHmsp				:item.apcNtslAmtHmsp
						,apcNtslAmtOnlnB2b			:item.apcNtslAmtOnlnB2b
						,apcNtslAmtOnlnB2c			:item.apcNtslAmtOnlnB2c
						,apcNtslAmtEtc				:item.apcNtslAmtEtc

						/* 전체 진척도 관리 */
						,prgrsLast	:item.prgrsLast
						,prgrs1		:item.prgrs1
						,prgrs2		:item.prgrs2
						,prgrs3		:item.prgrs3
						,prgrs4		:item.prgrs4
						,prgrs5		:item.prgrs5
						,prgrs6		:item.prgrs6
						,prgrs7		:item.prgrs7
						,prgrs8		:item.prgrs8
						,prgrs9		:item.prgrs9
						,prgrs10	:item.prgrs10
						,prgrs11	:item.prgrs11
						,prgrs12	:item.prgrs12
						,prgrs13	:item.prgrs13
						,prgrs14	:item.prgrs14

						,aprvCtpvStts		:item.aprvCtpvStts		//승인상태 지자체(시도)
						,aprvCtpvUserId		:item.aprvCtpvUserId	//승인자 아이디 지자체(시도)
						,aprvCtpvDt			:item.aprvCtpvDt		//승일일자 지자체(시도)

						,aprvSggStts		:item.aprvSggStts		//승인상태 지자체(시군구)
						,aprvSggUserId		:item.aprvSggUserId		//승인자 아이디 지자체(시군구)
						,aprvSggDt			:item.aprvSggDt			//승일일자 지자체(시군구)
				}
				jsonHiddenGrd1.push(hiddenGrdVO);
			});

			await hiddenGrd1.rebuild();

			await fn_excelDown1();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//로우 데이터 엑셀 다운로드
	function fn_excelDown1(){
		const currentDate = new Date();

		const year = currentDate.getFullYear().toString().padStart(4, '0');
		const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
		const day = currentDate.getDate().toString().padStart(2, '0');
		let formattedDate = year + month + day;

		let fileName = formattedDate + "_전체데이터_로우데이터";

		/*
		datagrid.exportData(param1, param2, param3, param4);
		param1(필수)[string]: 다운 받을 파일 형식
		param2(필수)[string]: 다운 받을 파일 제목
		param3[boolean]: 다운 받을 그리드 데이터 기준 (default:'false')
		→ true : csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 다운로드
		→ false : csv/xls/xlsx 형식의 데이터 다운로드를 jsonref 기준으로 다운로드
		param4[object]: 다운 받을 그리드 데이터 기준 (default:'false')
		→ arrRemoveCols(선택): csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 할 때 다운로드에서 제외할 열
		→ combolabel(선택) : csv/xls/xlsx combo/inputcombo 일 때 label 값으로 저장
		→ true : label 값으로 저장
		→ false : value 값으로 저장
		→ sheetName(선택) : xls/xlsx 형식의 데이터 다운로드시 시트명을 설정
		 */
		//console.log(hiddenGrd.exportData);
		hiddenGrd1.exportData("xlsx" , fileName , true , true);
	}

</script>
</html>