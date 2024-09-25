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
  * @ 2024.08.20   	임준완			최초 생성
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
				typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}}},
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
		console.log("******************fn_setGrdFcltPrgrsInfoList**********************************");

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
				console.log(item);
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
		console.log("******************fn_save**********************************");

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
		console.log("******************fn_subInsert**********************************");
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
		console.log("insert result", data);
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

	// 전체 승인 반려
	const fn_allAprv = function(ynVal) {

	}

	// 선택 승인 반려 취소
	const fn_selAprv = function(ynVal) {
		<c:if test="${loginVO.userType eq '27'}">
		</c:if>
		<c:if test="${loginVO.userType eq '28'}">
		</c:if>
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

</script>
</html>