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
					<!-- 출자출하조직 관리 매입·매출 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '21'}">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<!--
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
					 -->
				</c:if>
				<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00' && loginVO.userType ne '21'}">
					<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
					<!--
					<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
					 -->
				</c:if>
				</div>
			</div>
			<div class="box-body">
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 11%">
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
							<th scope="row" class="th_bg" >관할기관</th>
							<td colspan="3" class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="srch-input-cmptnInst"
									name="srch-input-cmptnInst"
									uitype="single"
									jsondata-ref="jsonComCmptnInst"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
							<th colspan="2" scope="row" class="th_bg" >시도</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="srch-input-ctpv"
									name="srch-input-ctpv"
									uitype="single"
									jsondata-ref="jsonComCtpv"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input">
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">법인구분</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-select
									id="srch-input-corpSeCd"
									name="srch-input-corpSeCd"
									uitype="single"
									jsondata-ref="jsonComCorpSeCd"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;" >
							</td>
							<th scope="row" class="th_bg">법인형태</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
									<sbux-select
									id="srch-input-corpDtlSeCd"
									name="srch-input-corpDtlSeCd"
									uitype="single"
									jsondata-ref="jsonComCorpDtlSeCd"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;" >
							</td>
							<th colspan="2" scope="row" class="th_bg">통합조직여부</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-aprv"
									name="srch-input-aprv"
									uitype="single"
									jsondata-ref="jsonComAprv"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input">
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">신청대상구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-aplyTrgtSe"
									name="srch-input-aplyTrgtSe"
									uitype="single"
									jsondata-ref="jsonComAplyTrgtSe"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input"  style="border-right: hidden;">
							</td>
							<th scope="row" class="th_bg">사업자번호</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
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
							</td>
							<th colspan="2" scope="row" class="th_bg">법인명</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="srch-input-corpNm"
									name="srch-input-corpNm"
									class="form-control input-sm srch-keyup-area"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input">

						</tr>

					</tbody>
				</table>
			</c:if>
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '21'}">
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<!-- 조직 리스트 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶검색리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng" style="height:350px; width: 100%;"></div>
				</div>
				<!--[pp] 검색결과 -->

				<br>

				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
						<!--
						<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
						 -->
					</div>
				</div>
			</c:if><!-- 관리자 권한인 경우 그리드 표기 -->
				<table class="table table-bordered tbl_fixed">
					<caption>출하조직 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-yr" name="dtl-input-yr"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-uoBrno" name="dtl-input-uoBrno"></sbux-input>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-corpNm"
									name="dtl-input-corpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">

							<th scope="row" class="th_bg th_border_right">사업자번호</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-brno"
									name="dtl-input-brno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">

							</td>
							<th scope="row" class="th_bg th_border_right">법인등록번호</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-crno"
									name="dtl-input-crno"
									class="form-control input-sm"
									mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							<!--
							<th scope="row" class="th_bg th_border_right">통합조직 선택</th>
							<td colspan="2" class="td_input">
								<sbux-select
									id="dtl-input-selUoBrno"
									name="dtl-input-selUoBrno"
									uitype="single"
									jsondata-ref="comUoBrno"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_changeSelUoBrno"
								></sbux-select>
							</td>
							 -->
						</tr>
					</tbody>
				</table>
				<br>
				<div>
					<span>전체 취급실적 작성(전문/육성 품목 포함 주요품목 작성, 취급액 비중이 낮은 품목은 기타품목으로 통합작성 후 비고란에 기타품목 명 기재</span>
				</div>
				<!--[pp] 검색결과 상세보기-->
				<div class="ad_section_top">
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">
							<sbux-button id="btnSaveFclt2" name="btnSaveFclt2" uitype="normal" text="매입저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave01"></sbux-button>
						</div>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">출자출하조직 총 매입현황</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
							<!--
							<li>
								<span style="font-size:12px">추가를 눌러 생성 후 작성해주세요</span>
							</li>
							 -->
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:200px; width: 100%;"></div>
				</div>
				<br>
				<!--[pp] 검색결과 상세보기-->
				<div class="ad_section_top">
					<div class="box-header" style="display:flex; justify-content: flex-start;" >
						<div style="margin-left: auto;">
							<sbux-button id="btnSaveFclt3" name="btnSaveFclt3" uitype="normal" text="매출저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave02"></sbux-button>
						</div>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">출자출하조직 총 매출현황</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
							<!--
							<li>
								<span style="font-size:12px">추가를 눌러 생성 후 작성해주세요</span>
							</li>
							 -->
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng02" style="height:300px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>
    <!-- 품목 팝업 -->
    <div>
        <sbux-modal
        	id="modal-gpcList"
        	name="modal-gpcList"
        	uitype="middle"
        	header-title="품목 선택"
        	body-html-id="body-modal-gpcList"
        	footer-is-close-button="false"
        	style="width:800px"
       	></sbux-modal>
    </div>
    <div id="body-modal-gpcList">
    	<jsp:include page="/WEB-INF/view/apcss/fm/popup/gpcSelectPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
//생산자조직 등록의 경우
//통합조직 직속 농가 출자출하조직 농가 두가지 경우가 있음
//첫리스트는 통합조직,출자출하조직 둘다 보여야함
//조직 선택후 품목 취급유형 선택후 다시 조회

	window.addEventListener('DOMContentLoaded', function(e) {
		var now = new Date();
		var year = now.getFullYear();
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
	});

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '21'}">
		fn_fcltMngCreateGrid();
	</c:if>
		fn_fcltMngCreateGrid01();
		fn_fcltMngCreateGrid02();

		await fn_initSBSelect();

	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '21'}">
		await fn_search();
	</c:if>
	<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00' && loginVO.userType ne '21'}">
		await fn_dtlSearch();
	</c:if>
	}

	var jsonComCmptnInst = [];//관할기관
	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군
	var jsonComCorpSeCd = [];//법인구분
	var jsonComCorpDtlSeCd = [];//법인형태
	var jsonComUoCd = [];//통합조직코드
	var jsonComAprv = [];//신청구분
	var jsonComAplyTrgtSe = [];//신청대상구분

	var jsonGrdComCtpv = [];//시도
	var jsonGrdComSgg = [];//시군
	var jsonGrdComCorpSeCd = [];//법인구분

	var jsonCtgryCd = [];//분류코드
	var jsonGrdCtgryCd_1 = [];//분류코드
	var jsonGrdCtgryCd_2 = [];//분류코드
	var jsonGrdSttgUpbrItemSe_1 = [];//취급코드
	var jsonGrdSttgUpbrItemSe_2 = [];//취급코드

	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		console.log("============fn_initSBSelect============");
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			gfn_setComCdSBSelect('srch-input-cmptnInst', 	jsonComCmptnInst, 	'CMPTNC_INST'), //관할기관
			gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 	'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 	'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComCtpv, 		'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComSgg, 		'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComCorpSeCd, 	'CORP_SE_CD'),//법인구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonGrdCtgryCd_1, 	'CTGRY_CD_1'), //분류코드
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng02', 	jsonGrdCtgryCd_2, 	'CTGRY_CD_1'), //분류코드
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonGrdSttgUpbrItemSe_1, 	'STTG_UPBR_ITEM_SE_1'), //취급코드
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng02', 	jsonGrdSttgUpbrItemSe_2, 	'STTG_UPBR_ITEM_SE_1'), //취급코드
		]);
	}

	var jsonPrdcrOgnCurntMng = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng

	const objMenuList = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnld,			//콜백함수명
	        }
	    };


	function fn_excelDwnld() {
		grdPrdcrOgnCurntMng.exportLocalExcel("출자출하조직관리(조직 리스트)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuList;	// 우클릭 메뉴 리스트
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
	    	{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
	    	{caption: ["등록년도"], 		ref: 'yr',   	type:'output',  width:'100px',    style:'text-align:center'},
	    	{caption: ["법인구분"], 		ref: 'corpSeCd',type:'combo',  width:'100px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonGrdComCorpSeCd', label:'label', value:'value', displayui : false}},
	    	{caption: ["시도"], 			ref: 'ctpv',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonGrdComCtpv', label:'label', value:'value', displayui : false}},
	        {caption: ["시군구"], 		ref: 'sgg',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
		    	,typeinfo : {ref:'jsonGrdComSgg', label:'label', value:'value', displayui : false}},
	        {caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'250px',    style:'text-align:center'},
	        {caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'250px',    style:'text-align:center'},
	        //{caption: ["적합여부"], 		ref: 'stbltYn',   	type:'output',  width:'50px',    style:'text-align:center'},
	        //{caption: ["진행단계"], 		ref: 'aa',   	type:'output',  width:'153px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'rmrk',   	type:'output',  width:'200px',    style:'text-align:center'},
	        {caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	    ];

	    grdPrdcrOgnCurntMng = _SBGrid.create(SBGridProperties);

	  	//클릭 이벤트 바인드
	   	grdPrdcrOgnCurntMng.bind('click','fn_view');
	   	grdPrdcrOgnCurntMng.bind('beforepagechanged', 'fn_pagingBbsList');

	}

	var jsonPrdcrOgnCurntMng01 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng01;

	const objMenuList01 = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnld01,			//콜백함수명
	        }
	    };


	function fn_excelDwnld01() {
		grdPrdcrOgnCurntMng01.exportLocalExcel("출자출하조직관리(총 매입현황)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid01 = async function() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng01';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng01';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng01';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
	    //SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리"], 		ref: 'delYn',   		type:'button', width:'40px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        if(objRowData.sttgUpbrItemCd == '3'){
	        			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ")'>삭제</button>";
			        }
	        	}
	        	return "";
	        }},
	        {caption: ["품목","품목"], 		ref: 'sttgUpbrItemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
	    	{caption: ["품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
	    	//{caption: ["품목분류","품목분류"], 	ref: 'ctgryNm',   	type:'combo',  width:'80px',    style:'text-align:center'},
	    	{caption: ["품목분류","품목분류"], 	ref: 'ctgryCd',   	type:'combo',  width:'80px',    style:'text-align:center'
	    		,typeinfo : {ref:'jsonGrdCtgryCd_1', label:'label', value:'value', displayui : true}},
	    	{caption: ["통합조직","통합조직명"], 		ref: 'corpNm',   	type:'output',  width:'200px',    style:'text-align:center'},
	    	{caption: ["통합조직","사업자번호"], 		ref: 'uoBrno',   	type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["공선수탁·공동수탁","물량(톤)"], ref: 'prchsTrstVlm',   	type:'input',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["공선수탁·공동수탁","금액(천원)"], ref: 'prchsTrstAmt',   	type:'input',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["공선매취","물량(톤)"], 	ref: 'prchsEmspapVlm',   type:'input',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["공선매취","금액(천원)"], 	ref: 'prchsEmspapAmt',   type:'input',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	    	{caption: ["기타","물량(톤)"], 		ref: 'etcVlm',   type:'input',  width:'90px',    style:'text-align:center'
		    	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		    {caption: ["기타","금액(천원)"], 		ref: 'etcAmt',   type:'input',  width:'100px',    style:'text-align:center'
		    	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["합계","물량(톤)"], 		ref: 'prchsTotVlm',   		type:'output',  width:'90px',    style:'text-align:center', calc : 'fn_prchsVlmSum'
		    	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["합계","금액(천원)"], 		ref: 'prchsTotAmt',   		type:'output',  width:'100px',    style:'text-align:center', calc : 'fn_prchsAmtSum'
		    	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

	        {caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
	        {caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
	        {caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
	    	{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
	    	//{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'brno',		hidden : true},
	        //{caption: ["상세내역"], 	ref: 'uoBrno',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	    ];

	    grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
	    grdPrdcrOgnCurntMng01.bind('click','gridClick01');
	    grdPrdcrOgnCurntMng01.bind('afteredit','fn_AfterEdit01');
	}

	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh01 = [
		  'prchsTrstVlm', 'prchsTrstAmt', 'prchsEmspapVlm', 'prchsEmspapAmt', 'etcVlm', 'etcAmt'
		];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_AfterEdit01(){
		let prevCol = grdPrdcrOgnCurntMng01.getPrevCol();
		let prevRef = grdPrdcrOgnCurntMng01.getRefOfCol(prevCol);
	    if(columnsToRefresh01.includes(prevRef)){
	    	grdPrdcrOgnCurntMng01.refresh();
	    }
	}

	//매입 합계 물량
	function fn_prchsVlmSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(rowData.prchsTrstVlm) + Number(rowData.prchsEmspapVlm) + Number(rowData.etcVlm);
		return sumVal;
	}

	//매입 합계 금액
	function fn_prchsAmtSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(rowData.prchsTrstAmt) + Number(rowData.prchsEmspapAmt) + Number(rowData.etcAmt);
		return sumVal;
	}

	var jsonPrdcrOgnCurntMng02 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng02;

	const objMenuList02 = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnld02,			//콜백함수명
	        }
	    };

	function fn_excelDwnld02() {
		grdPrdcrOgnCurntMng02.exportLocalExcel("출자출하조직관리(총 매출현황)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid02 = async function() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng02';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng02';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng02';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuList02;	// 우클릭 메뉴 리스트
	    SBGridProperties.frozencols=4;
	    //SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리","처리","처리"], 		ref: 'delYn',   type:'button', width:'40px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	    		if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\" , \"grdPrdcrOgnCurntMng02\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        if(objRowData.sttgUpbrItemCd == '3'){
			        	return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\" , \"grdPrdcrOgnCurntMng02\", " + nRow + ")'>삭제</button>";
			        }
	        	}
	    		return "";
	        }},
	        {caption: ["품목","품목","품목","품목"], 		ref: 'sttgUpbrItemNm',   	type:'output',  width:'55px',    style:'text-align:center'},
	    	{caption: ["품목","품목","품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
	    	//{caption: ["품목분류","품목분류","품목분류"], 	ref: 'ctgryNm',   	type:'combo',  width:'80px',    style:'text-align:center'},
	    	{caption: ["품목분류","품목분류","품목분류","품목분류"], 	ref: 'ctgryCd',   	type:'combo',  width:'80px',    style:'text-align:center'
				,typeinfo : {ref:'jsonGrdCtgryCd_2', label:'label', value:'value', displayui : true}},
			{caption: ["통합조직","통합조직","통합조직","통합조직명"], 		ref: 'corpNm',   	type:'output',  width:'200px',    style:'text-align:center'},
		    {caption: ["통합조직","통합조직","통합조직","사업자번호"], 		ref: 'uoBrno',   	type:'output',  width:'80px',    style:'text-align:center'},
			{caption: ["출자출하조직 취급실적","총취급실적","총취급실적","물량(톤)"]
				,ref: 'totTrmtPrfmncVlm',   	type:'input',  width:'90px',    style:'text-align:center'
				,calc : 'fn_totTrmtPrfmncVlm'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","총취급실적","총취급실적","금액(천원)"]
				,ref: 'totTrmtPrfmncAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,calc : 'fn_totTrmtPrfmncAmt'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

			{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체수출","물량(톤)"]
				,ref: 'ddcExprtVlm',   	type:'input',  width:'90px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체수출","금액(천원)"]
				,ref: 'ddcExprtAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체공판장","물량(톤)"]
				,ref: 'ddcVlm',   	type:'input',  width:'90px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체공판장","금액(천원)"]
				,ref: 'ddcAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","군납","물량(톤)"]
				,ref: 'ddcArmyDlvgdsVlm',   	type:'input',  width:'90px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","군납","금액(천원)"]
				,ref: 'ddcArmyDlvgdsAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","학교급식","물량(톤)"]
				,ref: 'ddcMlsrVlm',   	type:'input',  width:'90px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","학교급식","금액(천원)"]
				,ref: 'ddcMlsrAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","공제대상 소계","물량(톤)"]
				,ref: 'ddcTotVlm',   	type:'output',  width:'90px',    style:'text-align:center'
				, calc : 'fn_ddcTotVlm'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","취급액 공제 실적","공제대상 소계","금액(천원)"]
				,ref: 'ddcTotAmt',   	type:'output',  width:'100px',    style:'text-align:center'
				, calc : 'fn_ddcTotAmt'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},


			{caption: ["출자출하조직 취급실적","조정 취급실적","조정 취급실적","물량(톤)"]
				,ref: 'ajmtVlm',   	type:'input',  width:'90px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직 취급실적","조정 취급실적","조정 취급실적","금액(A)"]//전문품목 매입매출 화면의 매출 총합
				,ref: 'ajmtAmt',   	type:'output',  width:'100px',    style:'text-align:center;border-right-color: black !important;' , fixedstyle:'border-right-color: black !important;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},


			{caption: ["출자출하조직의 통합조직 출하실적","총 출하실적","총 출하실적","물량(톤)"]
				,ref: 'totSpmtPrfmncVlm',   	type:'input',  width:'90px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","총 출하실적","총 출하실적","금액(천원)"]//전문품목 매입매출 화면의 매입 총합
				,ref: 'totSpmtPrfmncAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","단순기표","단순기표","물량(톤)"]
				,ref: 'smplInptVlm',   	type:'input',  width:'90px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","단순기표","단순기표","금액(천원)"]
				,ref: 'smplInptAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","출하실적","출하실적","물량(톤)"]
				,ref: 'spmtPrfmncVlm',   	type:'output',  width:'90px',    style:'text-align:center'
				,calc: 'fn_spmtPrfmncVlm'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","출하실적","출하실적","금액(B)"]
				,ref: 'spmtPrfmncAmt',   	type:'output',  width:'100px',    style:'text-align:center'
				,calc: 'fn_spmtPrfmncAmt'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동선별수탁","물량(톤)"]
				,ref: 'slsCprtnSortTrstVlm',   	type:'input',  width:'90px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동선별수탁","금액(천원)"]
				,ref: 'slsCprtnSortTrstAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동선별매취","물량(톤)"]
				,ref: 'slsCprtnSortEmspapVlm',   	type:'input',  width:'90px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동선별매취","금액(천원)"]
				,ref: 'slsCprtnSortEmspapAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동출하수탁","물량(톤)"]
				,ref: 'slsCprtnTrstVlm',   	type:'input',  width:'90px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동출하수탁","금액(천원)"]
				,ref: 'slsCprtnTrstAmt',   	type:'input',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","합계","물량(톤)"]
				,ref: 'slsCprtnTotVlm',   	type:'output',  width:'90px',    style:'text-align:center'
				,calc: 'fn_slsCprtnTotVlm'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","합계","금액(천원)"]
				,ref: 'slsCprtnTotAmt',   	type:'output',  width:'100px',    style:'text-align:center'
				,calc: 'fn_slsCprtnTotAmt'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

			//{caption: ["출자출하조직\n출하율\n(B/A)","출자출하조직\n출하율\n(B/A)","출자출하조직\n출하율\n(B/A)","출자출하조직\n출하율\n(B/A)"]
				//,ref: 'spmtRtVlm',   	type:'output',  width:'90px',    style:'text-align:center'
				//,calc: 'fn_spmtRtVlm'
				//,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직\n출하율\n(B/A)","출자출하조직\n출하율\n(B/A)","출자출하조직\n출하율\n(B/A)","출자출하조직\n출하율\n(B/A)"]
				,ref: 'spmtRtAmt',   	type:'output',  width:'100px',    style:'text-align:center'
				,calc: 'fn_spmtRtAmt'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

	        {caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
	        {caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
	        {caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
	    	{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
	    	//{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'brno',		hidden : true},
	        //{caption: ["상세내역"], 	ref: 'uoBrno',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	    ];

	    grdPrdcrOgnCurntMng02 = _SBGrid.create(SBGridProperties);
	    grdPrdcrOgnCurntMng02.bind('click','gridClick02');
	    grdPrdcrOgnCurntMng02.bind('afteredit','fn_AfterEdit02');
	}

	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh02 = [
		  'slsEmspapVlm', 'slsTrstVlm', 'slsCprtnSortTrstVlm', 'slsCprtnTrstVlm', 'slsCprtnSortEmspapVlm',
		  'slsEmspapAmt', 'slsTrstAmt', 'slsCprtnSortTrstAmt', 'slsCprtnTrstAmt', 'slsCprtnSortEmspapAmt',
		  'slsSmplTrstVlm', 'slsSmplTrstAmt', 'slsSmplEmspapVlm', 'slsSmplEmspapAmt',
		  'ddcExprtVlm', 'ddcExprtAmt', 'ddcVlm', 'ddcAmt', 'ddcArmyDlvgdsVlm', 'ddcArmyDlvgdsAmt',
		  'ddcMlsrVlm', 'ddcMlsrAmt',
		  'spmtPrfmncVlm', 'spmtPrfmncAmt', 'smplInptVlm', 'smplInptAmt'
		];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_AfterEdit02(){
		let prevCol = grdPrdcrOgnCurntMng02.getPrevCol();
		let prevRef = grdPrdcrOgnCurntMng02.getRefOfCol(prevCol);
	    if(columnsToRefresh02.includes(prevRef)){
	    	grdPrdcrOgnCurntMng02.refresh();
	    }
	}

	function fn_totTrmtPrfmncVlm(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.sttgUpbrItemSe == '1' || rowData.sttgUpbrItemSe == '2'){
			sumVal = Number(rowData.ddcExprtVlm)
				+ Number(rowData.ddcVlm)
				+ Number(rowData.ddcArmyDlvgdsVlm)
				+ Number(rowData.ddcMlsrVlm)
				+ Number(rowData.ajmtVlm);
		}else if (rowData.sttgUpbrItemSe == '3'){
			sumVal = rowData.totTrmtPrfmncVlm;
		}
		return sumVal;
	}
	function fn_totTrmtPrfmncAmt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.sttgUpbrItemSe == '1' || rowData.sttgUpbrItemSe == '2'){
			sumVal = Number(rowData.ddcExprtAmt)
				+ Number(rowData.ddcAmt)
				+ Number(rowData.ddcArmyDlvgdsAmt)
				+ Number(rowData.ddcMlsrAmt)
				+ Number(rowData.ajmtAmt);
		}else if (rowData.sttgUpbrItemSe == '3'){
			sumVal = rowData.totTrmtPrfmncAmt;
		}
		return sumVal;
	}

	function fn_ddcTotVlm(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(rowData.ddcExprtVlm)
				+ Number(rowData.ddcVlm)
				+ Number(rowData.ddcArmyDlvgdsVlm)
				+ Number(rowData.ddcMlsrVlm);
		return sumVal;
	}
	function fn_ddcTotAmt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(rowData.ddcExprtAmt)
				+ Number(rowData.ddcAmt)
				+ Number(rowData.ddcArmyDlvgdsAmt)
				+ Number(rowData.ddcMlsrAmt);
		return sumVal;
	}
	//출하실적 물량
	function fn_spmtPrfmncVlm(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(rowData.totSpmtPrfmncVlm)
				- Number(rowData.smplInptVlm);
		return sumVal;
	}
	//출하실적 금액
	function fn_spmtPrfmncAmt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(rowData.totSpmtPrfmncAmt)
				- Number(rowData.smplInptAmt);
		return sumVal;
	}

	function fn_slsCprtnTotVlm(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(rowData.slsCprtnTrstVlm)
				+ Number(rowData.slsCprtnSortEmspapVlm)
				+ Number(rowData.slsCprtnSortTrstVlm);
		return sumVal;
	}

	function fn_slsCprtnTotAmt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(rowData.slsCprtnTrstAmt)
				+ Number(rowData.slsCprtnSortEmspapAmt)
				+ Number(rowData.slsCprtnSortTrstAmt);
		return sumVal;
	}
	//출자출하조직 출하율
	function fn_spmtRtVlm(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.ajmtVlm > 0 && rowData.spmtPrfmncVlm > 0){
			sumVal = Number(rowData.spmtPrfmncVlm) / Number(rowData.ajmtVlm) * 100
		}
		return sumVal;
	}
	//출자출하조직 출하율
	function fn_spmtRtAmt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		if(rowData.ajmtAmt > 0 && rowData.spmtPrfmncAmt > 0){
			sumVal = Number(rowData.spmtPrfmncAmt) / Number(rowData.ajmtAmt) * 100
		}
		return sumVal;
	}

	/**
     * 목록 조회
     */
    const fn_search = async function() {

    	// set pagination
    	let pageSize = grdPrdcrOgnCurntMng.getPageSize();
    	let pageNo = 1;

    	fn_setGrdFcltList(pageSize, pageNo);
    }

	const fn_pagingBbsList = async function() {
    	let recordCountPerPage = grdPrdcrOgnCurntMng.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdPrdcrOgnCurntMng.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	fn_setGrdFcltList(recordCountPerPage, currentPageNo);
    }

	/* Grid Row 조회 기능*/
	const fn_setGrdFcltList = async function(pageSize, pageNo){
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		let yr = SBUxMethod.get("srch-input-yr");//
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//
		</c:if>
		<c:if test="${loginVO.userType eq '21'}">
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;
		</c:if>

    	let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
    		brno : brno
    		,apoSe : '2'

    		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
    		,cmptnInst : cmptnInst
    		,ctpv : ctpv

    		,corpSeCd : corpSeCd
    		,corpDtlSeCd : corpDtlSeCd

    		,corpNm : corpNm
    		,yr : yr
    		</c:if>

    		<c:if test="${loginVO.userType eq '21'}">
			,userType : '21'
    		</c:if>


    		//페이징
    		,pagingYn : 'Y'
    		,currentPageNo : pageNo
     		,recordCountPerPage : pageSize
		});

        let data = await postJsonPromise ;
        try{
        	jsonPrdcrOgnCurntMng.length = 0;
        	let totalRecordCount = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO = {
						apoCd: item.apoCd
						,apoSe: item.apoSe
						,ctpv: item.ctpv
						,sgg: item.sgg
						,corpNm: item.corpNm
						,crno: item.crno
						,brno: item.brno
						,yr: item.yr
						,stbltYn: item.stbltYn
						,corpSeCd: item.corpSeCd
				}
				jsonPrdcrOgnCurntMng.push(PrdcrOgnCurntMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

        	if (jsonPrdcrOgnCurntMng.length > 0) {

        		if(grdPrdcrOgnCurntMng.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
        			grdPrdcrOgnCurntMng.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
        			grdPrdcrOgnCurntMng.rebuild();
				}else{
					grdPrdcrOgnCurntMng.refresh()
				}
        	} else {
        		grdPrdcrOgnCurntMng.setPageTotalCount(totalRecordCount);
        		grdPrdcrOgnCurntMng.rebuild();
        	}
        	document.querySelector('#listCount').innerText = totalRecordCount;

        	//grdPrdcrOgnCurntMng.rebuild();

        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	//사용자 화면 조회
	const fn_dtlSearch = async function(){
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;

    	let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
    		brno : brno
		});

        let data = await postJsonPromise ;
        try{
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-input-apoCd',gfn_nvl(item.apoCd))//통합조직 코드
				SBUxMethod.set('dtl-input-apoSe',gfn_nvl(item.apoSe))//통합조직 구분
				SBUxMethod.set('dtl-input-corpNm',gfn_nvl(item.corpNm))//법인명
				SBUxMethod.set('dtl-input-crno',gfn_nvl(item.crno))//법인등록번호
				SBUxMethod.set('dtl-input-brno',gfn_nvl(item.brno))//사업자등록번호
			});
        	//총매입매출은 전체 값이 다보여야 해서 통합조직을 고르지 않음
        	//fn_searchUoList();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}


	//매입 다중 세이브
	const fn_listSave01 = async function(){

		let gridData01 = grdPrdcrOgnCurntMng01.getGridDataAll();
		let saveList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let crno = SBUxMethod.get('dtl-input-crno');
		let brno = SBUxMethod.get('dtl-input-brno');

		//그리드의 해드가 두줄이상인경우 for문 시작과 끝을 늘린만큼 늘려야함
		for(var i=1+1; i<=gridData01.length + 1; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);
			let rowSts01 = grdPrdcrOgnCurntMng01.getRowStatus(i);
			let delYn = rowData01.delYn;

			if(delYn == 'N'){

				if(Number(rowData01.prchsTrstAmt) > 0){
					if(gfn_isEmpty(rowData01.prchsTrstVlm)){
						alert('공선수탁,공동수탁 금액이 존재하는 경우 물량 작성이 필요합니다');
						grdPrdcrOgnCurntMng01.selectRow(i);
						return false;
					}
				}

				if(Number(rowData01.prchsEmspapAmt) > 0){
					if(gfn_isEmpty(rowData01.prchsEmspapVlm)){
						alert('공선매취 금액이 존재하는 경우 물량 작성이 필요합니다');
						grdPrdcrOgnCurntMng01.selectRow(i);
						return false;
					}
				}

				if(Number(rowData01.etcAmt) > 0){
					if(gfn_isEmpty(rowData01.etcVlm)){
						alert('기타 금액이 존재하는 경우 물량 작성이 필요합니다');
						grdPrdcrOgnCurntMng01.selectRow(i);
						return false;
					}
				}

				rowData01.apoCd = apoCd;
				rowData01.apoSe = apoSe;
				rowData01.crno = crno;
				rowData01.brno = brno;

				rowData01.rowSts = "I";
				saveList.push(rowData01);
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/isom/multiSaveInvShipOgnPurSalMngList01.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_dtlGridSearch();
	        		//fn_searchFcltList();
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

	//매출 다중 세이브
	const fn_listSave02 = async function(){

		let gridData02 = grdPrdcrOgnCurntMng02.getGridDataAll();
		let saveList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let crno = SBUxMethod.get('dtl-input-crno');
		let brno = SBUxMethod.get('dtl-input-brno');
		let uoBrno = SBUxMethod.get('dtl-input-uoBrno');

		//그리드의 해드가 두줄이상인경우 for문 시작과 끝을 늘린만큼 늘려야함
		for(var i=1+3; i<=gridData02.length + 3; i++ ){
			let rowData02 = grdPrdcrOgnCurntMng02.getRowData(i);
			let rowSts02 = grdPrdcrOgnCurntMng02.getRowStatus(i);

			let delYn = rowData02.delYn;

			if(delYn == 'N'){
				rowData02.apoCd = apoCd;
				rowData02.apoSe = apoSe;
				rowData02.crno = crno;
				rowData02.brno = brno;
				rowData02.brno = brno;

				rowData02.rowSts = "I";
				saveList.push(rowData02);
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/isom/multiSaveInvShipOgnPurSalMngList02.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_dtlGridSearch();
	        		//fn_searchFcltList();
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
		console.log("==========fn_procRow=========");
        if (gubun === "ADD") {
            if (grid === "grdPrdcrOgnCurntMng01") {
            	grdPrdcrOgnCurntMng01.setCellData(nRow, grdPrdcrOgnCurntMng01.getColRef("delYn"), "N", true);
            	grdPrdcrOgnCurntMng01.setCellData(nRow, grdPrdcrOgnCurntMng01.getColRef("sttgUpbrItemNm"), "기타", true);
            	grdPrdcrOgnCurntMng01.setCellData(nRow, grdPrdcrOgnCurntMng01.getColRef("sttgUpbrItemSe"), "3", true);
            	grdPrdcrOgnCurntMng01.addRow(true);
            	fn_gridCustom();
            }

            if (grid === "grdPrdcrOgnCurntMng02") {
            	grdPrdcrOgnCurntMng02.setCellData(nRow, grdPrdcrOgnCurntMng02.getColRef("delYn"), "N", true);
            	grdPrdcrOgnCurntMng02.setCellData(nRow, grdPrdcrOgnCurntMng02.getColRef("sttgUpbrItemNm"), "기타", true);
            	grdPrdcrOgnCurntMng02.setCellData(nRow, grdPrdcrOgnCurntMng02.getColRef("sttgUpbrItemSe"), "3", true);
            	grdPrdcrOgnCurntMng02.addRow(true);
            	fn_gridCustom();
            }

        }
        else if (gubun === "DEL") {
            if (grid === "grdPrdcrOgnCurntMng01") {
            	if(grdPrdcrOgnCurntMng01.getRowStatus(nRow) == 0 || grdPrdcrOgnCurntMng01.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var rowVal = grdPrdcrOgnCurntMng01.getRowData(nRow);
            			fn_deleteRsrc(rowVal);
            			grdPrdcrOgnCurntMng01.deleteRow(nRow);
            			//grdPrdcrOgnCurntMng02.deleteRow(nRow+1);
            		}
            	}else{
            		grdPrdcrOgnCurntMng01.deleteRow(nRow);
            		//grdPrdcrOgnCurntMng02.deleteRow(nRow+1);
            	}
            }
            if (grid === "grdPrdcrOgnCurntMng02") {
            	if(grdPrdcrOgnCurntMng02.getRowStatus(nRow) == 0 || grdPrdcrOgnCurntMng02.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var rowVal = grdPrdcrOgnCurntMng02.getRowData(nRow);
            			fn_deleteRsrc(rowVal);
            			//grdPrdcrOgnCurntMng01.deleteRow(nRow-1);
            			grdPrdcrOgnCurntMng02.deleteRow(nRow);
            		}
            	}else{
            		//grdPrdcrOgnCurntMng01.deleteRow(nRow-1);
            		grdPrdcrOgnCurntMng02.deleteRow(nRow);
            	}
            }
        }
    }

	//리스트 삭제
	async function fn_deleteRsrc(vo){

		//if(true)return;
		let postJsonPromise = gfn_postJSON("/pd/isom/deleteInvShipOgnPurSalMng.do", vo);
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

	//통합조직 리스트 그리드 클릭시  이벤트
	const fn_view = async function(){
		console.log("******************fn_view**********************************");

	    //데이터가 존재하는 그리드 범위 확인
		var nCol = grdPrdcrOgnCurntMng.getCol();
	    if (nCol < 1) {
	        return;
	    }
	    var nRow = grdPrdcrOgnCurntMng.getRow();
		if (nRow < 1) {
	        return;
		}
		if(nRow == null){
			nRow = 1;
		}

		let rowData = grdPrdcrOgnCurntMng.getRowData(nRow);
		console.log(rowData);
		fn_clearForm();

		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno))//사업자등록번호

		//총매입매출은 전체 값이 다보여야 해서 통합조직을 고르지 않음
		//fn_searchUoList();
    }
	//매입 매출 그리드 초기화
	async function fn_clearForm() {
		SBUxMethod.set('dtl-input-apoCd',null)//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',null)//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',null)//법인명
		SBUxMethod.set('dtl-input-crno',null)//법인등록번호
		SBUxMethod.set('dtl-input-brno',null)//사업자등록번호
		SBUxMethod.set('dtl-input-uoBrno',null)//선택한 통합조직
		SBUxMethod.set('dtl-input-selUoBrno',null)//상위 통합조직 리스트

		jsonPrdcrOgnCurntMng01.length= 0;
		grdPrdcrOgnCurntMng01.rebuild();
		jsonPrdcrOgnCurntMng02.length= 0;
		grdPrdcrOgnCurntMng02.rebuild();
	}


	//통합조직 매입 매출 리스트 조회
	async function fn_dtlGridSearch() {
		//조회 대상 유무 확인
		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		if(gfn_isEmpty(apoCd)){return;}
		//let apoSe = SBUxMethod.get('dtl-input-apoSe');
		//let itemCd = SBUxMethod.get('dtl-input-itemCd');
		//let ctgryCd = SBUxMethod.get('dtl-input-ctgryCd');
		//총매입매출은 통합조직을 고르지 않고 전체 데이터를 보여줌
		//let uoBrno = SBUxMethod.get('dtl-input-uoBrno');
		let brno = SBUxMethod.get('dtl-input-brno');
		let yr = SBUxMethod.get('dtl-input-yr');
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise01 = gfn_postJSON("/pd/isom/selectInvShipOgnPurSalMngList.do", {
			brno : brno
    		//,uoBrno : uoBrno
    		,yr : yr
		});
        let data = await postJsonPromise01;
        try{
        	jsonPrdcrOgnCurntMng01.length = 0;
        	jsonPrdcrOgnCurntMng02.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
        		if(item.prchsSlsSe == '1'){
        			let PrdcrOgnCurntMngVO01 = {
    						apoCd: 	item.apoCd
    						,apoSe: item.apoSe
    						,brno: 	item.brno
    						,crno: 	item.crno
    						,delYn: item.delYn
    						,yr: item.yr
    						,uoBrno: item.uoBrno
    						,corpNm: item.corpNm

    						,sttgUpbrItemSe: item.sttgUpbrItemSe
    						,sttgUpbrItemNm: item.sttgUpbrItemNm

    						,ctgryCd: 		item.ctgryCd
    						,itemCd: 		item.itemCd
    						//,ctgryNm: 		item.ctgryNm
    						,itemNm: 		item.itemNm
    						,prchsSlsSe: 	item.prchsSlsSe

    						,prchsTrstVlm: 		item.prchsTrstVlm
    						,prchsTrstAmt: 		item.prchsTrstAmt
    						,prchsEmspapVlm: 	item.prchsEmspapVlm
    						,prchsEmspapAmt: 	item.prchsEmspapAmt

    						,prchsTotVlm: 		item.prchsTotVlm
    						,prchsTotAmt: 		item.prchsTotAmt
    						,etcVlm: 			item.etcVlm
    						,etcAmt: 			item.etcAmt
    				};
        			jsonPrdcrOgnCurntMng01.push(PrdcrOgnCurntMngVO01);
        		}else if(item.prchsSlsSe == '2'){
        			let PrdcrOgnCurntMngVO02 = {
    						apoCd: 	item.apoCd
    						,apoSe: item.apoSe
    						,brno: 	item.brno
    						,crno: 	item.crno
    						,delYn: item.delYn
    						,yr: item.yr
    						,uoBrno: item.uoBrno
    						,corpNm: item.corpNm

    						,sttgUpbrItemSe: item.sttgUpbrItemSe
    						,sttgUpbrItemNm: item.sttgUpbrItemNm

    						,ctgryCd: 		item.ctgryCd
    						,itemCd: 		item.itemCd
    						//,ctgryNm: 		item.ctgryNm
    						,itemNm: 		item.itemNm
    						,prchsSlsSe: 	item.prchsSlsSe

    						,slsCprtnSortTrstVlm: 		item.slsCprtnSortTrstVlm
    						,slsCprtnSortTrstAmt: 		item.slsCprtnSortTrstAmt
    						,slsCprtnTrstVlm: 		item.slsCprtnTrstVlm
    						,slsCprtnTrstAmt: 		item.slsCprtnTrstAmt
    						,slsCprtnSortEmspapVlm: 		item.slsCprtnSortEmspapVlm
    						,slsCprtnSortEmspapAmt: 		item.slsCprtnSortEmspapAmt

    						,slsSmplTrstVlm: 		item.slsSmplTrstVlm
    						,slsSmplTrstAmt: 		item.slsSmplTrstAmt
    						,slsSmplEmspapVlm: 		item.slsSmplEmspapVlm
    						,slsSmplEmspapAmt: 		item.slsSmplEmspapAmt

    						,slsEmspapVlm: 		item.slsEmspapVlm
    						,slsEmspapAmt: 		item.slsEmspapAmt
    						,slsTrstVlm: 		item.slsTrstVlm
    						,slsTrstAmt: 		item.slsTrstAmt

    						,ddcExprtVlm: 		item.ddcExprtVlm
    						,ddcExprtAmt: 		item.ddcExprtAmt
    						,ddcVlm: 		item.ddcVlm
    						,ddcAmt: 		item.ddcAmt
    						,ddcArmyDlvgdsVlm: 		item.ddcArmyDlvgdsVlm
    						,ddcArmyDlvgdsAmt: 		item.ddcArmyDlvgdsAmt
    						,ddcMlsrVlm: 		item.ddcMlsrVlm
    						,ddcMlsrAmt: 		item.ddcMlsrAmt

    						,spmtPrfmncVlm: 		item.spmtPrfmncVlm
    						,spmtPrfmncAmt: 		item.spmtPrfmncAmt
    						,smplInptVlm: 		item.smplInptVlm
    						,smplInptAmt: 		item.smplInptAmt

    						,ajmtVlm: 		item.ajmtVlm
    						,ajmtAmt: 		item.ajmtAmt

    						,slsTotVlm: 		item.slsTotVlm
    						,slsTotAmt: 		item.slsTotAmt

    						,totTrmtPrfmncVlm: 		item.totTrmtPrfmncVlm
    						,totTrmtPrfmncAmt: 		item.totTrmtPrfmncAmt
    						,totSpmtPrfmncVlm: 		item.totSpmtPrfmncVlm
    						,totSpmtPrfmncAmt: 		item.totSpmtPrfmncAmt
    				};
        			console.log(item.sttgUpbrItemNm);
					jsonPrdcrOgnCurntMng02.push(PrdcrOgnCurntMngVO02);
        		}
			});

        	grdPrdcrOgnCurntMng01.rebuild();
        	grdPrdcrOgnCurntMng02.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	grdPrdcrOgnCurntMng01.addRow();
        	grdPrdcrOgnCurntMng02.addRow();

        	fn_gridCustom();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	//그리드 커스텀 배경 및 disabled 처리
	const fn_gridCustom = async function(){
		console.log("=========fn_gridCustom================");

		let prchsTrstAmt = grdPrdcrOgnCurntMng01.getColRef("prchsTrstAmt");//
		let prchsEmspapAmt = grdPrdcrOgnCurntMng01.getColRef("prchsEmspapAmt");//
		let etcAmt = grdPrdcrOgnCurntMng01.getColRef("etcAmt");//
		let prchsTotVlm = grdPrdcrOgnCurntMng01.getColRef("prchsTotVlm");//
		let prchsTotAmt = grdPrdcrOgnCurntMng01.getColRef("prchsTotAmt");//
		let gridData01 = grdPrdcrOgnCurntMng01.getGridDataAll();
		for(var i=2; i <= gridData01.length+1; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);

			if(rowData01.sttgUpbrItemSe == '1' || rowData01.sttgUpbrItemSe == '2'){
				//disabled 처리
				grdPrdcrOgnCurntMng01.setCellDisabled(i, prchsTrstAmt, i, prchsTrstAmt, true);
				grdPrdcrOgnCurntMng01.setCellDisabled(i, prchsEmspapAmt, i, prchsEmspapAmt, true);
				grdPrdcrOgnCurntMng01.setCellDisabled(i, etcAmt, i, etcAmt, true);
				//배경 속성 추가
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, prchsTrstAmt, i, prchsTrstAmt, 'lightgray');
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, prchsEmspapAmt, i, prchsEmspapAmt, 'lightgray');
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, etcAmt, i, etcAmt, 'lightgray');
				//해당 타입 위치 저장
			}
			grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, prchsTotVlm, i, prchsTotAmt, 'lightgray');
		}

		let totTrmtPrfmncVlm = grdPrdcrOgnCurntMng02.getColRef("totTrmtPrfmncVlm");//총취급물량
		let totTrmtPrfmncAmt = grdPrdcrOgnCurntMng02.getColRef("totTrmtPrfmncAmt");//총취급실적
		let ddcExprtVlm = grdPrdcrOgnCurntMng02.getColRef("ddcExprtVlm");//자체수출 물량
		let ddcMlsrAmt = grdPrdcrOgnCurntMng02.getColRef("ddcMlsrAmt");//학교급식 금액
		let totSpmtPrfmncAmt = grdPrdcrOgnCurntMng02.getColRef("totSpmtPrfmncAmt");//총 취급실적
		let slsCprtnTrstAmt = grdPrdcrOgnCurntMng02.getColRef("slsCprtnTrstAmt");//
		let slsCprtnSortEmspapAmt = grdPrdcrOgnCurntMng02.getColRef("slsCprtnSortEmspapAmt");//
		let slsCprtnSortTrstAmt = grdPrdcrOgnCurntMng02.getColRef("slsCprtnSortTrstAmt");//
		let ddcTotVlm = grdPrdcrOgnCurntMng02.getColRef("ddcTotVlm");//
		let ddcTotAmt = grdPrdcrOgnCurntMng02.getColRef("ddcTotAmt");//
		let ajmtAmt = grdPrdcrOgnCurntMng02.getColRef("ajmtAmt");//
		let smplInptVlm = grdPrdcrOgnCurntMng02.getColRef("smplInptVlm");//
		let spmtRtAmt = grdPrdcrOgnCurntMng02.getColRef("spmtRtAmt");//
		let slsCprtnTotVlm = grdPrdcrOgnCurntMng02.getColRef("slsCprtnTotVlm");//


		let gridData02 = grdPrdcrOgnCurntMng02.getGridDataAll();
		for(var i=4; i <= gridData02.length+3; i++ ){
			let rowData02 = grdPrdcrOgnCurntMng02.getRowData(i);

			if(rowData02.sttgUpbrItemSe == '1' || rowData02.sttgUpbrItemSe == '2'){
				grdPrdcrOgnCurntMng02.setCellDisabled(i, totTrmtPrfmncVlm, i, totTrmtPrfmncAmt, true);
				grdPrdcrOgnCurntMng02.setCellDisabled(i, totSpmtPrfmncAmt, i, totSpmtPrfmncAmt, true);
				grdPrdcrOgnCurntMng02.setCellDisabled(i, slsCprtnTrstAmt, i, slsCprtnTrstAmt, true);
				grdPrdcrOgnCurntMng02.setCellDisabled(i, slsCprtnSortEmspapAmt, i, slsCprtnSortEmspapAmt, true);
				grdPrdcrOgnCurntMng02.setCellDisabled(i, slsCprtnSortTrstAmt, i, slsCprtnSortTrstAmt, true);
				grdPrdcrOgnCurntMng02.setCellDisabled(i, slsCprtnSortTrstAmt, i, slsCprtnSortTrstAmt, true);

				grdPrdcrOgnCurntMng02.setCellStyle('background-color', i, totTrmtPrfmncVlm, i, totTrmtPrfmncAmt, 'lightgray');
				grdPrdcrOgnCurntMng02.setCellStyle('background-color', i, totSpmtPrfmncAmt, i, totSpmtPrfmncAmt, 'lightgray');
				grdPrdcrOgnCurntMng02.setCellStyle('background-color', i, slsCprtnTrstAmt, i, slsCprtnTrstAmt, 'lightgray');
				grdPrdcrOgnCurntMng02.setCellStyle('background-color', i, slsCprtnSortEmspapAmt, i, slsCprtnSortEmspapAmt, 'lightgray');
				grdPrdcrOgnCurntMng02.setCellStyle('background-color', i, slsCprtnSortTrstAmt, i, slsCprtnSortTrstAmt, 'lightgray');
				grdPrdcrOgnCurntMng02.setCellStyle('background-color', i, slsCprtnTotVlm, i, spmtRtAmt, 'lightgray');
			}else{
				grdPrdcrOgnCurntMng02.setCellDisabled(i, ddcExprtVlm, i, ajmtAmt, true);
				grdPrdcrOgnCurntMng02.setCellDisabled(i, smplInptVlm, i, spmtRtAmt, true);
				grdPrdcrOgnCurntMng02.setCellStyle('background-color', i, ddcExprtVlm, i, ajmtAmt, 'lightgray');
				grdPrdcrOgnCurntMng02.setCellStyle('background-color', i, ddcExprtVlm, i, ddcMlsrAmt, 'lightgray');
				grdPrdcrOgnCurntMng02.setCellStyle('background-color', i, smplInptVlm, i, spmtRtAmt, 'lightgray');
			}
			grdPrdcrOgnCurntMng02.setCellStyle('background-color', i, ddcTotVlm, i, ddcTotAmt, 'lightgray');
			grdPrdcrOgnCurntMng02.setCellStyle('background-color', i, ajmtAmt, i, ajmtAmt, 'lightgray');
		}
	}

    function fn_GridPop(gubun, grid, nRow, nCol) {
    	console.log("================fn_GridPop================");
        if (gubun === "pop") {
            if (grid === "grdGpcList") {
            	//부른 선택된 그리드 셀의 값을 N 으로 변경
            	grdGpcList.setCellData(nRow, nCol, "N", true);
            }
        }
    }

	let selGridRow01;//선택한 행
	let selGridCol01;//선택한 열

    //그리드 클릭이벤트
    function gridClick01(){
		console.log("================gridClick01================");
		//grdGpcList 그리드 객체
        selGridRow01 = grdPrdcrOgnCurntMng01.getRow();
        selGridCol01 = grdPrdcrOgnCurntMng01.getCol();

        let delYnCol = grdPrdcrOgnCurntMng01.getColRef('delYn');
        let delYnValue = grdPrdcrOgnCurntMng01.getCellData(selGridRow01,delYnCol);

        //임력할 데이터 인지 확인
        //추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
        //fn_procRow 의 ADD 확인
        if(delYnValue != 'N'){
        	return;
        }

        //분류,품목,
        //let ctgryNmCol = grdPrdcrOgnCurntMng01.getColRef('ctgryNm');
        let itemNmCol = grdPrdcrOgnCurntMng01.getColRef('itemNm');

        if(selGridRow01 == '-1'){
			return;
        } else {
        	//선택한 데이터가 통합조직 일떄
        	//if (selGridCol01 == ctgryNmCol || selGridCol01 == itemNmCol){
        	if (selGridCol01 == itemNmCol){
        		//팝업창 오픈
        		//통합조직 팝업창 id : modal-gpcList
        		let brno = SBUxMethod.get('dtl-input-brno');
        		popGpcSelect.init(fn_setGridItem01);
        		//popYrGpcSelect.init(fn_setGridItem01);
        		SBUxMethod.openModal('modal-gpcList');
        	}
        }
    }


	// 그리드의 품목 선택 팝업 콜백 함수
	const fn_setGridItem01 = function(rowData) {
		console.log("================fn_setGridItem01================");
		console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow : 선택된 행 값		selGridCol : 선택된 열 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let selRef = grdPrdcrOgnCurntMng01.getRefOfCol(selGridCol01);

			let gridData = grdPrdcrOgnCurntMng01.getGridDataAll();
			for(var i=1+1; i<=gridData.length+1; i++ ){
				let uoData = grdPrdcrOgnCurntMng01.getRowData(i);
				if ($.trim(rowData.itemCd) == $.trim(uoData.itemCd)){
					gfn_comAlert("E0000", "동일한 품목이 있습니다.");
					return false;
				}
			}

			//그리드 값 세팅

			//grdPrdcrOgnCurntMng01.setCellData(selGridRow01,grdPrdcrOgnCurntMng01.getColRef("ctgryCd"),rowData.ctgryCd,true);
			//grdPrdcrOgnCurntMng01.setCellData(selGridRow01,grdPrdcrOgnCurntMng01.getColRef("ctgryNm"),rowData.ctgryNm,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow01,grdPrdcrOgnCurntMng01.getColRef("itemCd"),rowData.itemCd,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow01,grdPrdcrOgnCurntMng01.getColRef("itemNm"),rowData.itemNm,true);
			/*
			grdPrdcrOgnCurntMng02.setCellData(selGridRow01+1,grdPrdcrOgnCurntMng02.getColRef("ctgryCd"),rowData.ctgryCd,true);
			grdPrdcrOgnCurntMng02.setCellData(selGridRow01+1,grdPrdcrOgnCurntMng02.getColRef("ctgryNm"),rowData.ctgryNm,true);
			grdPrdcrOgnCurntMng02.setCellData(selGridRow01+1,grdPrdcrOgnCurntMng02.getColRef("itemCd"),rowData.itemCd,true);
			grdPrdcrOgnCurntMng02.setCellData(selGridRow01+1,grdPrdcrOgnCurntMng02.getColRef("itemNm"),rowData.itemNm,true);
			*/
			let grdStatus = grdPrdcrOgnCurntMng01.getRowStatus(selGridRow01);
		 	if(grdStatus != '1'){
		 		grdPrdcrOgnCurntMng01.setRowStatus(selGridRow01,'update');
		 	}
		}
	}

	let selGridRow02;//선택한 행
	let selGridCol02;//선택한 열

    //그리드 클릭이벤트
    function gridClick02(){
		console.log("================gridClick02================");
		//grdGpcList 그리드 객체
        selGridRow02 = grdPrdcrOgnCurntMng02.getRow();
        selGridCol02 = grdPrdcrOgnCurntMng02.getCol();


        let delYnCol = grdPrdcrOgnCurntMng02.getColRef('delYn');
        let delYnValue = grdPrdcrOgnCurntMng02.getCellData(selGridRow02,delYnCol);
        //임력할 데이터 인지 확인
        //추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
        //fn_procRow 의 ADD 확인
        if(delYnValue != 'N'){
        	return;
        }

        //분류,품목,
        //let ctgryNmCol = grdPrdcrOgnCurntMng02.getColRef('ctgryNm');
        let itemNmCol = grdPrdcrOgnCurntMng02.getColRef('itemNm');

        if(selGridRow02 == '-1'){
			return;
        } else {
        	//선택한 데이터가 통합조직 일떄
        	//if (selGridCol02 == ctgryNmCol || selGridCol02 == itemNmCol){
        	if (selGridCol02 == itemNmCol){
        		//팝업창 오픈
        		//통합조직 팝업창 id : modal-gpcList
        		let brno = SBUxMethod.get('dtl-input-brno');
        		popGpcSelect.init(fn_setGridItem02);
        		//popYrGpcSelect.init(fn_setGridItem02);
        		SBUxMethod.openModal('modal-gpcList');
        	}
        }
    }

	// 그리드의 품목 선택 팝업 콜백 함수
	const fn_setGridItem02 = function(rowData) {
		console.log("================fn_setGridItem02================");
		console.log(rowData);
		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow : 선택된 행 값		selGridCol : 선택된 열 값
			//getColRef(ref) ref의 인덱스 값 가져오기
			let selRef = grdPrdcrOgnCurntMng02.getRefOfCol(selGridCol02);

			//let colRefIdx1 = grdPrdcrOgnCurntMng02.getColRef("ctgryCd");//분류코드 인덱스
			//let colRefIdx2 = grdPrdcrOgnCurntMng02.getColRef("ctgryNm");//분류명 인덱스
			//let colRefIdx3 = grdPrdcrOgnCurntMng02.getColRef("itemCd");//품목코드 인덱스
			//let colRefIdx4 = grdPrdcrOgnCurntMng02.getColRef("itemNm");//품목명 인덱스
			let gridData = grdPrdcrOgnCurntMng02.getGridDataAll();
			for(var i=1+3; i<=gridData.length+3; i++ ){
				let uoData = grdPrdcrOgnCurntMng02.getRowData(i);
				if ($.trim(rowData.itemCd) == $.trim(uoData.itemCd)){
					gfn_comAlert("E0000", "동일한 품목이 있습니다.");
					return false;
				}
			}
			//그리드 값 세팅
			/*
			grdPrdcrOgnCurntMng01.setCellData(selGridRow02-1,grdPrdcrOgnCurntMng01.getColRef("ctgryCd"),rowData.ctgryCd,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow02-1,grdPrdcrOgnCurntMng01.getColRef("ctgryNm"),rowData.ctgryNm,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow02-1,grdPrdcrOgnCurntMng01.getColRef("itemCd"),rowData.itemCd,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow02-1,grdPrdcrOgnCurntMng01.getColRef("itemNm"),rowData.itemNm,true);
			*/
			//grdPrdcrOgnCurntMng02.setCellData(selGridRow02,grdPrdcrOgnCurntMng02.getColRef("ctgryCd"),rowData.ctgryCd,true);
			//grdPrdcrOgnCurntMng02.setCellData(selGridRow02,grdPrdcrOgnCurntMng02.getColRef("ctgryNm"),rowData.ctgryNm,true);
			grdPrdcrOgnCurntMng02.setCellData(selGridRow02,grdPrdcrOgnCurntMng02.getColRef("itemCd"),rowData.itemCd,true);
			grdPrdcrOgnCurntMng02.setCellData(selGridRow02,grdPrdcrOgnCurntMng02.getColRef("itemNm"),rowData.itemNm,true);

			let grdStatus = grdPrdcrOgnCurntMng02.getRowStatus(selGridRow02);
		 	if(grdStatus != '1'){
		 		grdPrdcrOgnCurntMng02.setRowStatus(selGridRow02,'update');
		 	}

		}
	}

	var comUoBrno = [];//통합조직 선택

	/* 출자출하조직이 속한 통합조직 리스트 조회 */
	const fn_searchUoList = async function(){
		//출자출하조직이 아닌경우
		<c:if test="${loginVO.userType ne '22'}">
		let brno = SBUxMethod.get('dtl-input-brno');
		</c:if>
		//출자출하조직인 경우
		<c:if test="${loginVO.userType eq '22'}">
		let brno = '${loginVO.brno}';
		</c:if>

    	let postJsonPromise = gfn_postJSON("/pd/bsm/selectUoList.do", {
			brno : brno
		});
        let data = await postJsonPromise;
        try{
        	comUoBrno = [];
        	data.resultList.forEach((item, index) => {
        		let uoListVO = {
						'text'		: item.uoCorpNm
						, 'label'	: item.uoCorpNm
						, 'value'	: item.uoBrno
						, 'uoApoCd' : item.uoApoCd

				}
        		comUoBrno.push(uoListVO);
			});
        	SBUxMethod.refresh('dtl-input-selUoBrno');
        	//console.log(comUoBrno);
        	if(comUoBrno.length == 1){

        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}


	//통합조직 콤보박스 선택시 값 변경
	//const fn_changeSelUoBrno = async function() {
	function fn_changeSelUoBrno(){
		let selVal = SBUxMethod.get('dtl-input-selUoBrno');
		let selCombo = _.find(comUoBrno, {value : selVal});
		console.log(selCombo);
		if( typeof selCombo == "undefined" || selCombo == null || selCombo == "" ){
			SBUxMethod.set('dtl-input-uoBrno' , null);
			//SBUxMethod.set('dtl-input-uoCd' , null);
		}else{
			SBUxMethod.set('dtl-input-uoBrno',selCombo.value);
			//SBUxMethod.set('dtl-input-uoCd',selCombo.uoApoCd);
		}
	}

</script>
</html>

