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
					<!-- 활성화자금 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
					<sbux-button id="btnOpenPopup" name="btnOpenPopup" uitype="normal" text="산출식 관리 팝업" class="btn btn-sm btn-outline-danger" onclick="fn_openMaodalComputWay"></sbux-button>
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</c:if>
				<c:if test="${loginVO.userType eq '21' || loginVO.userType eq '22'}">
					<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
				</c:if>
				</div>
			</div>
			<div class="box-body">
			<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
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
								<sbux-checkbox
									id="srch-input-yrChk"
									name="srch-input-yrChk"
									uitype="normal"
									text="해당년도 신청사용자만 보기"
									text-left-padding="5px"
									text-right-padding="25px"
									true-value="Y"
									false-value="N"
									checked
									></sbux-checkbox>
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
						<tr>
							<th scope="row" class="th_bg">적합품목 보유 여부</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-stbltHldYn"
									name="srch-input-stbltHldYn"
									uitype="single"
									jsondata-ref="jsonComStbltHldYn"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td class="td_input"></td>
							<th scope="row" class="th_bg">실적마감여부</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-input-prfmncCorpDdlnYn"
									name="srch-input-prfmncCorpDdlnYn"
									uitype="single"
									jsondata-ref="jsonComPrfmncCorpDdlnYn"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td class="td_input">
							</td>
							 <td colspan="6" class="td_input" style="border-right: hidden;border-bottom: hidden;">
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<!-- 조직 리스트 -->
				<div class="">
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
					</div>
				</div>
			</c:if><!-- 관리자 권한인 경우 그리드 표기 -->
				<table class="table table-bordered tbl_fixed">
					<caption>통합조직 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-yr" name="dtl-input-yr"></sbux-input>
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
						</tr>
					</tbody>
				</table>
				<br>
				<!--[pp] 검색결과 상세보기-->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶통합조직 선정여부</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng05" style="height:150px; width: 100%;"></div>
				</div>
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶출자출하조직 선정여부</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng06" style="height:300px; width: 100%;"></div>
				</div>
				<div class="ad_section_top">
					<div class="box-header" style="display:flex; justify-content: flex-start; width: 745px;" >
						<div style="margin-left: auto;">
							<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="평가지표 저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave01"></sbux-button>
						</div>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶평가지표</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:200px; width: 745px;"></div>
				</div>
				<div class="ad_section_top">
					<div class="box-header" style="display:flex; justify-content: flex-start; width: 1185px;" >
						<div style="margin-left: auto;">
							<sbux-button id="btnSaveFclt2" name="btnSaveFclt2" uitype="normal" text="가감점 저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave02"></sbux-button>
						</div>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶가감점</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng02" style="height:300px; width: 1185px;"></div>
				</div>
			</div>
			<div id="sb-area-hiddenGrd" style="height:400px; width: 100%; display: none;"></div>
		</div>
	</section>

	<!-- 산출식 관리 팝업 -->
	<div>
		<sbux-modal
			id="modal-computWay"
			name="modal-computWay"
			uitype="middle"
			header-title="산출식 관리"
			body-html-id="body-modal-computWay"
			footer-is-close-button="false"
			style="width:1000px"
	   	></sbux-modal>
	</div>
	<div id="body-modal-computWay">
		<jsp:include page="/WEB-INF/view/apcss/pd/popup/computWayPopup.jsp"></jsp:include>
	</div>

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

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		var now = new Date();
		var year = now.getFullYear();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		SBUxMethod.set("srch-input-yr",year);//
		await fn_fcltMngCreateGrid();
	</c:if>

		await fn_fcltMngCreateGrid01();
		await fn_fcltMngCreateGrid02();

		await fn_fcltMngCreateGrid05();
		await fn_fcltMngCreateGrid06();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		fn_search();
	</c:if>
		await fn_initSBSelect();


	}

	var jsonComCmptnInst = [];//관할기관
	var jsonComCtpv = [];//시도
	//var jsonComSgg = [];//시군
	var jsonComCorpSeCd = [];//법인구분
	var jsonComCorpDtlSeCd = [];//법인형태
	var jsonComUoCd = [];//통합조직코드
	var jsonComAprv = [];//신청구분
	var jsonComAplyTrgtSe = [];//신청대상구분

	var jsonComGrdCtpv = [];//시도
	//var jsonComGrdSgg = [];//시군
	var jsonComGrdCorpSeCd = [];//법인구분
	var jsonComGrdAprv = [];//신청구분

	var jsonGrdFundArtcl01 = [];//산출식 항목
	var jsonGrdFundArtcl02 = [];//산출식 항목

	//적합품목 보유 여부
	var jsonComStbltHldYn = [
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
			gfn_setComCdSBSelect('srch-input-cmptnInst', 	jsonComCmptnInst, 	'CMPTNC_INST'), //관할기관
			gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 	'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 	'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdCtpv, 	'CMPTN_INST_CTPV'), //시도
			//gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdSgg, 		'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdAprv, 	'APRV_UPBR_SE_CD'), //신청구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01',	jsonGrdFundArtcl01	,'FUND_ARTCL'), //산출식 항목
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng02',	jsonGrdFundArtcl02	,'FUND_ARTCL_1'), //산출식 항목

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
		grdPrdcrOgnCurntMng.exportLocalExcel("통합조직관리(조직 리스트)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
			{caption: ["seq"], 			ref: 'apoCd', 	hidden : true},
			{caption: ["등록년도"], 		ref: 'yr', 	type:'output',  width:'100px',	style:'text-align:center'},
			{caption: ["법인체마감"], 		ref: 'prfmncCorpDdlnYn', 	type:'output',  width:'100px',	style:'text-align:center'},
			{caption: ["통합조직여부"], 	ref: 'aprv',   type:'combo',  width:'80px',	style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComGrdAprv', label:'label', value:'value', displayui : false}},
			{caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'250px',	style:'text-align:center'},
			{caption: ["사업자번호"], 		ref: 'brno', 	type:'output',  width:'250px',	style:'text-align:center'},
			{caption: ["적합품목"], 		ref: 'stbltYnNm', 	type:'output',  width:'200px',	style:'text-align:center'},
			{caption: ["법인구분"], 		ref: 'corpSeCd',type:'combo',  width:'100px',	style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComGrdCorpSeCd', label:'label', value:'value', displayui : false}},
			{caption: ["시도"], 			ref: 'ctpv', 	type:'combo',  width:'160px',	style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComGrdCtpv', label:'label', value:'value', displayui : false}},
			//{caption: ["시군구"], 		ref: 'sgg', 	type:'combo',  width:'160px',	style:'text-align:center', disabled:true
				//,typeinfo : {ref:'jsonComGrdSgg', label:'label', value:'value', displayui : false}},
			//{caption: ["진행단계"], 		ref: 'aa', 	type:'output',  width:'153px',	style:'text-align:center'},
			{caption: ["비고"], 			ref: 'rmrk', 	type:'output',  width:'200px',	style:'text-align:center'}
		];

		grdPrdcrOgnCurntMng = _SBGrid.create(SBGridProperties);

		//클릭 이벤트 바인드
		grdPrdcrOgnCurntMng.bind('click','fn_view');
		grdPrdcrOgnCurntMng.bind('beforepagechanged', 'fn_pagingBbsList');
	}


	var jsonPrdcrOgnCurntMng01 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng01

	const objMenuList01 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld01,			//콜백함수명
			}
		};


	function fn_excelDwnld01() {
		grdPrdcrOgnCurntMng01.exportLocalExcel("활성화자금 평가지표", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}


	/* Grid 화면 그리기 기능*/
	//평가지표
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
		SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheight = 57;
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption: ["항목"],		ref: 'fundArtcl',		type:'combo',  width:'160px',	style:'text-align:center;'
				,typeinfo : {ref:'jsonGrdFundArtcl01', label:'label', value:'value', displayui : false}},
			//{caption: ["산출식"],		ref: 'computWayCd',		type:'output',  width:'400px',	style:'text-align:center;'},
			{caption: ["산출식"],		ref: 'computWayCd',		type:'combo',  width:'400px',	style:'text-align:center;'
				,typeinfo : {ref:'comComputWay01', label:'label', value:'value', displayui : false
								,filtering: { usemode: true, uppercol: 'fundArtcl', attrname: 'fundArtcl', listall: false}
							}
			},
			{caption: ["배점"], 		ref: 'alt',		type:'output',  width:'60px',	style:'text-align:center;'},
			{caption: ["산출결과"], 	ref: 'computWayRslt',		type:'output',  width:'60px',	style:'text-align:center;'},
			{caption: ["점수"], 		ref: 'scr',		type:'input',  width:'60px',	style:'text-align:center;'},

			{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'seq',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
		];

		grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
		grdPrdcrOgnCurntMng01.bind('valuechanged', fn_valueChanged01);
	}

	var jsonPrdcrOgnCurntMng02 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng02

	const objMenuList02 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld02,			//콜백함수명
			}
		};


	function fn_excelDwnld02() {
		grdPrdcrOgnCurntMng02.exportLocalExcel("활성화자금 평가지표", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}


	/* Grid 화면 그리기 기능*/
	//가감점
	const fn_fcltMngCreateGrid02 = async function() {
		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng02';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng02';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng02';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
		//SBGridProperties.extendlastcol = 'scroll';
		//SBGridProperties.fixedrowheight=45;
		//SBGridProperties.rowheight = 57;
		SBGridProperties.oneclickedit = true;
		SBGridProperties.rowheader = ['seq','update'];
		SBGridProperties.columns = [
			{caption: ["처리"], 				ref: 'delYn',   	type:'button', width:'60px',	style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
				if(strValue== null || strValue == ""){
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdPrdcrOgnCurntMng02\", " + nRow + ", " + nCol + ")'>추가</button>";
				}else{
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdPrdcrOgnCurntMng02\", " + nRow + ")'>삭제</button>";
				}
			}},
			{caption: ["항목"],		ref: 'fundArtcl',		type:'combo',  width:'160px',	style:'text-align:center;'
				,typeinfo : {ref:'jsonGrdFundArtcl02', label:'label', value:'value', displayui : false}},
			//{caption: ["산출식"],		ref: 'computWayCd',		type:'output',  width:'400px',	style:'text-align:center;'},
			{caption: ["산출식"],		ref: 'computWayCd',		type:'combo',  width:'400px',	style:'text-align:center;'
				,typeinfo : {ref:'comComputWay02', label:'label', value:'value', displayui : false
								,filtering: { usemode: true, uppercol: 'fundArtcl', attrname: 'fundArtcl', listall: false}
							}
			},
			{caption: ["배점"], 		ref: 'alt',		type:'output',  width:'60px',	style:'text-align:center;'},
			{caption: ["산출결과"], 	ref: 'computWayRslt',		type:'input',  width:'400px',	style:'text-align:center;'},
			{caption: ["점수"], 		ref: 'scr',		type:'input',  width:'60px',	style:'text-align:center;'},

			{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'seq',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
		];

		grdPrdcrOgnCurntMng02 = _SBGrid.create(SBGridProperties);
		grdPrdcrOgnCurntMng02.bind('valuechanged', fn_valueChanged02);
	}

	/*		선정여부		*/

	var jsonPrdcrOgnCurntMng05 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng05;

	const objMenuList05 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld05,			//콜백함수명
			}
		};


	function fn_excelDwnld05() {
		grdPrdcrOgnCurntMng07.exportLocalExcel("통합조직 선정여부", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* Grid 화면 그리기 기능*/
	//통합조직 선정여부
	const fn_fcltMngCreateGrid05 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng05';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng05';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng05';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
		//SBGridProperties.mergecells = 'bycol';//동일한 열 병합처리
		SBGridProperties.datamergefalseskip = true;// merge false 된 열 병합 제외
		//SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.fixedrowheight=45;
		//SBGridProperties.rowheight = 57;
		SBGridProperties.columns = [
				{caption: ["통합조직명"],	ref: 'corpNm',		type:'output',  width:'160px',    style:'text-align:center;'},
				{caption: ["사업자번호"],	ref: 'brno',		type:'output',  width:'80px',    style:'text-align:center;'},
				{caption: ["통합조직 선정여부"], 	ref: 'stbltYn',		type:'output',  width:'60px',    style:'text-align:center;'},
				{caption: ["적합품목"], 	ref: 'stbltItemList',	type:'output',  width:'160px',    style:'text-align:center;'},
				/**/{caption: ["탈락사유구분"], 	ref: 'aa',	type:'output',  width:'160px',    style:'text-align:center;'},
				/**/{caption: ["세부탈락사유"], 	ref: 'bb',	type:'output',  width:'160px',    style:'text-align:center;'},
				/**/{caption: ["패널티"], 		ref: 'cc',	type:'output',  width:'160px',    style:'text-align:center;'},
				{caption: ["자금신청액(천원)\n(출자출하조직 신청액 포함)"], 	ref: 'fundAplyAmtTot',	type:'output',  width:'160px',    style:'text-align:center;'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
				/**/{caption: ["자금신청액(천원)\n(탈락 출자출하조직 신청액은 제외)"], 	ref: 'dd',	type:'output',  width:'160px',    style:'text-align:center;'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
				{caption: ["금리"], 		ref: 'itrRt',			type:'output',  width:'80px',    style:'text-align:center;'
					,typeinfo : {mask : {alias: 'decimal', digits : 2}}, format : {type:'number', rule:'#,###.##'}},

				{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
				//{caption: ["상세내역"], 	ref: 'stbltItemList',   hidden : true},
			];

		grdPrdcrOgnCurntMng05 = _SBGrid.create(SBGridProperties);
	}


	var jsonPrdcrOgnCurntMng06 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng06

	const objMenuList06 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld05,			//콜백함수명
			}
		};


	function fn_excelDwnld06() {
		grdPrdcrOgnCurntMng06.exportLocalExcel("출자출하조직 선정여부 리스트", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}


	/* Grid 화면 그리기 기능*/
	//출자출하조직 선정여부 리스트
	const fn_fcltMngCreateGrid06 = async function() {
		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng06';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng06';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng06';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList05;	// 우클릭 메뉴 리스트
		//SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.fixedrowheight=45;
		//SBGridProperties.rowheight = 57;
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption: ["출자출하조직명"],	ref: 'corpNm',		type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["사업자번호"],	ref: 'brno',		type:'output',  width:'80px',    style:'text-align:center;'},
			{caption: ["적합여부"], 	ref: 'stbltYn',		type:'output',  width:'60px',    style:'text-align:center;'},
			{caption: ["적합품목"], 	ref: 'stbltItemList',	type:'output',  width:'160px',    style:'text-align:center;'},

			/**/
			{caption: ["탈락사유구분"], 	ref: 'aa',	type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["세부탈락사유"], 	ref: 'bb',	type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["패널티"], 		ref: 'cc',	type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["자금신청액(천원)"], 	ref: 'isoFundAplyAmt',	type:'output',  width:'160px',    style:'text-align:center;'},
			/**/

			{caption: ["금리"], 		ref: 'itrRt',			type:'output',  width:'80px',    style:'text-align:center;'
				,typeinfo : {mask : {alias: 'decimal', digits : 2}}, format : {type:'number', rule:'#,###.##'}},

			{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',   	hidden : true},
			{caption: ["상세내역"], 	ref: 'uoBrno',   	hidden : true},
		];

		grdPrdcrOgnCurntMng06 = _SBGrid.create(SBGridProperties);
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
		let recordCountPerPage = grdPrdcrOgnCurntMng.getPageSize(); 		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdPrdcrOgnCurntMng.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		fn_setGrdFcltList(recordCountPerPage, currentPageNo);
	}

	/* Grid Row 조회 기능*/
	const fn_setGrdFcltList = async function(pageSize, pageNo){
		let yr = SBUxMethod.get("srch-input-yr");//
		//년도 검색값이 없는 경우 최신년도
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

		//sbgrid 체크박스 값 사용
		let yrChk = SBUxMethod.get("srch-input-yrChk");//
		let keys = Object.getOwnPropertyNames(yrChk);
		let yrChkVal = null;
		for(let i=0; i<keys.length; i++){
			if(yrChk[keys[i]]){
				yrChkVal = yrChk[keys[i]];
			}
		}
		let stbltHldYn = SBUxMethod.get("srch-input-stbltHldYn");//
		let prfmncCorpDdlnYn = SBUxMethod.get("srch-input-prfmncCorpDdlnYn");//

		let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
			cmptnInst : cmptnInst
			,ctpv : ctpv

			,corpSeCd : corpSeCd
			,corpDtlSeCd : corpDtlSeCd

			,brno : brno
			,corpNm : corpNm
			,yr : yr

			,apoSe : '1'

			,stbltYnNm:'Y'
			,yrChk : yrChkVal
			,stbltHldYn : stbltHldYn //적합품목 보유 여부

			,prfmncCorpDdlnYn : prfmncCorpDdlnYn //실적 법인체 마감 여부

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
						,aprv: item.aprv
						,sgg: item.sgg
						,corpNm: item.corpNm
						,crno: item.crno
						,brno: item.brno
						,yr: item.yr
						,corpSeCd: item.corpSeCd
						,stbltYnNm: item.stbltYnNm
						,prfmncCorpDdlnYn: item.prfmncCorpDdlnYn
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
		let yr = SBUxMethod.get('dtl-input-yr');

		let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
			brno : brno
			,yr : yr
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
				//SBUxMethod.set('dtl-input-yr',gfn_nvl(item.yr))//사업자등록번호
			});
			fn_dtlGridSearch();
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

		fn_clearForm();

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
		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno))//사업자등록번호
		SBUxMethod.set('dtl-input-yr',gfn_nvl(rowData.yr))//등록년도
	}
	//그리드 초기화
	async function fn_clearForm() {
		//jsonPrdcrOgnCurntMng01.length= 0;
		//grdPrdcrOgnCurntMng01.rebuild();
		SBUxMethod.set('dtl-input-apoCd',null)//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',null)//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',null)//법인명
		SBUxMethod.set('dtl-input-crno',null)//법인등록번호
		SBUxMethod.set('dtl-input-brno',null)//사업자등록번호
		SBUxMethod.set('dtl-input-yr',null)//등록년도
	}
	const fn_dtlGridSearch = async function(){
		fn_searchComputWayList();		//산출식 콤보 조회
		await fn_dtlGridSearchActvtnFund1();	//평가지표
		await fn_dtlGridSearchActvtnFund2();	//가감점
		fn_dtlGridSearchUoTot();
		fn_dtlGridSearchIsoTot();
	}


	//평가지표 조회
	const fn_dtlGridSearchActvtnFund1 = async function(){
		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectScoreList1.do", {
			brno : brno
			, yr : yr
		});


		let data = await postJsonPromise ;
		try{
			jsonPrdcrOgnCurntMng01.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				console.log(item);
				let scr = item.scr;
				//점수값이 비었을 경우 기본 산출값으로
				if (gfn_isEmpty(scr)) {
					scr = item.computWayRslt;
				}

				let PrdcrOgnCurntMngVO = {
						yr: item.yr
						,seq: item.seq
						,brno: item.brno
						,fundArtcl: item.fundArtcl
						,computWayCd: item.computWayCd
						,computWayDtl: item.computWayDtl
						,computWayRslt: item.computWayRslt
						,alt: item.alt
						,scr: scr
					}
				jsonPrdcrOgnCurntMng01.push(PrdcrOgnCurntMngVO);
			});
			grdPrdcrOgnCurntMng01.rebuild();


		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//가감점 조회
	const fn_dtlGridSearchActvtnFund2 = async function(){
		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectScoreList2.do", {
			brno : brno
			, yr : yr
		});


		let data = await postJsonPromise ;
		try{
			jsonPrdcrOgnCurntMng02.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO = {
						yr: item.yr
						,seq: item.seq
						,brno: item.brno
						,fundArtcl: item.fundArtcl
						,computWayCd: item.computWayCd
						,computWayDtl: item.computWayDtl
						,computWayRslt: item.computWayRslt
						,alt: item.alt
						,scr: item.scr
					}
				jsonPrdcrOgnCurntMng02.push(PrdcrOgnCurntMngVO);
			});
			grdPrdcrOgnCurntMng02.rebuild();
			grdPrdcrOgnCurntMng02.addRow();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//통합조직 선정여부
	const fn_dtlGridSearchUoTot = async function(){
		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectUoTotList.do", {
			brno : brno
			, yr : yr
		});


		let data = await postJsonPromise ;
		try{
			jsonPrdcrOgnCurntMng05.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO = {
						brno			: item.brno
						,corpNm			: item.corpNm
						,yr				: item.yr
						,fundAplyAmtTot	: item.fundAplyAmtTot//자금신청액
						,stbltYn		: item.stbltYn//적합여부 기준 적용 결과
						,stbltItemList	: item.stbltItemList//적합픔목 리스트
						,itrRt			: item.itrRt //금리
				}
				jsonPrdcrOgnCurntMng05.push(PrdcrOgnCurntMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
			grdPrdcrOgnCurntMng05.rebuild();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//출자출하조직 선정여부 조회
	async function fn_dtlGridSearchIsoTot() {

		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise06 = gfn_postJSON("/pd/pcorm/selectIsoTotList.do", {
			brno : brno
			, yr : yr
		});
		let data = await postJsonPromise06;
		try{
			jsonPrdcrOgnCurntMng06.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let itemVO = {
					brno: 	item.brno
					,uoBrno: item.uoBrno
					,corpNm: item.corpNm
					,yr: item.yr
					,apoSe: item.yr
					,stbltYn: item.stbltYn//적합여부 기준 적용 결과
					,stbltItemList: item.stbltItemList//적합픔목 리스트
					,itrRt: item.itrRt //금리
				};
				jsonPrdcrOgnCurntMng06.push(itemVO);
			});
			grdPrdcrOgnCurntMng06.rebuild();
			//적합한 경우 통합조직 금리와 동일하게 하고 수정불가 처리
			fn_disable06();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//적합한 경우 통합조직 금리와 동일하게 하고 수정불가 처리
	async function fn_disable06() {
		let gridData = grdPrdcrOgnCurntMng06.getGridDataAll();
		for(var i=1; i <= gridData.length; i++ ){
			let rowData = grdPrdcrOgnCurntMng06.getRowData(i);
			let itrRt = grdPrdcrOgnCurntMng06.getColRef("itrRt");//금리

			if (rowData.stbltYn == 'Y') {
				grdPrdcrOgnCurntMng06.setCellDisabled(i, itrRt, i, itrRt, true);
			}else{
				grdPrdcrOgnCurntMng06.setCellDisabled(i, itrRt, i, itrRt, false);
			}
		}
	}

	/* Grid Row 추가 및 삭제 기능*/
	function fn_procRow(gubun, grid, nRow, nCol) {
		if (gubun === "ADD") {
			if (grid === "grdPrdcrOgnCurntMng02") {
				let yrColIdx = grdPrdcrOgnCurntMng02.getColRef("yr");//금리
				let yrVal = SBUxMethod.get('dtl-input-yr');
				let brnoColIdx = grdPrdcrOgnCurntMng02.getColRef("brno");//금리
				let brnoVal = SBUxMethod.get('dtl-input-brno');
				grdPrdcrOgnCurntMng02.setCellData(nRow, nCol, "N", true);
				grdPrdcrOgnCurntMng02.setCellData(nRow, yrColIdx, yrVal, true);
				grdPrdcrOgnCurntMng02.setCellData(nRow, brnoColIdx, brnoVal, true);
				grdPrdcrOgnCurntMng02.addRow(true);
			}
		}
		else if (gubun === "DEL") {
			if (grid === "grdPrdcrOgnCurntMng02") {
				if(grdPrdcrOgnCurntMng02.getRowStatus(nRow) == 0 || grdPrdcrOgnCurntMng02.getRowStatus(nRow) == 2){
					let delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
					if(confirm(delMsg)){
						let rowData = grdPrdcrOgnCurntMng02.getRowData(nRow);
						//fn_deleteRsrc(rowData);
						//grdPrdcrOgnCurntMng02.deleteRow(nRow);
					}
				}else{
					grdPrdcrOgnCurntMng02.deleteRow(nRow);
				}
			}
		}
	}
	//가감점 삭제 버튼
	async function fn_deleteRsrc(uoVO){
		let postJsonPromise = gfn_postJSON("/pd/pcorm/deleteScore.do", uoVO);
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

	//산출식 관리 팝업 버튼
	function fn_openMaodalComputWay(){
		console.log('fn_openMaodalComputWay');
		popComputWay.init();
		SBUxMethod.openModal('modal-computWay');
	}


	var comComputWay01 = [];//산출식 선택
	var comComputWay02 = [];//산출식 선택

	/* 산출식 리스트 조회 */
	const fn_searchComputWayList = async function(){
		let yr = SBUxMethod.get('dtl-input-yr');

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectComputWayList.do", {
			yr : yr
			,useYn : 'Y'
		});
		let data = await postJsonPromise;
		try{
			comComputWay01 = [];
			comComputWay02 = [];
			data.resultList.forEach((item, index) => {
				let itemVO = {
						'text'			: item.computWayDtl
						, 'label'		: item.computWayDtl
						, 'value'		: item.computWayCd
						, 'computWayCd'	: item.computWayCd
						, 'computWayDtl': item.computWayDtl
						, 'fundArtcl' 	: item.fundArtcl
						, 'alt' 		: item.alt
				}
				comComputWay01.push(itemVO);
				comComputWay02.push(itemVO);

			});
			//console.log(comComputWay);

			let computWayCdColIdx01 = grdPrdcrOgnCurntMng01.getColRef("computWayCd");//
			grdPrdcrOgnCurntMng01.setColumnComboData(computWayCdColIdx01, comComputWay01);//콤보 데이터 동적 변경

			let computWayCdColIdx02 = grdPrdcrOgnCurntMng02.getColRef("computWayCd");//
			grdPrdcrOgnCurntMng02.setColumnComboData(computWayCdColIdx02, comComputWay02);//콤보 데이터 동적 변경
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}
	//항목 값 변경 이벤트
	const fn_valueChanged01 = async function(){
		let datagrid = grdPrdcrOgnCurntMng01;
		let nRow = datagrid.getRow();
		let nCol = datagrid.getCol();

		let computWayCdIdx = datagrid.getColRef("computWayCd");
		let altIdx = datagrid.getColRef("alt");

		if (!gfn_isEmpty(nCol) && nCol == computWayCdIdx) {
			let selValue = datagrid.getCellData(nRow, nCol);
			let chkInfo = _.find(comComputWay01, {computWayCd: selValue});
			let altVal = chkInfo.alt;
			datagrid.setCellData(nRow, altIdx, altVal, true);
		}
	}
	//항목 값 변경 이벤트
	const fn_valueChanged02 = async function(){
		let datagrid = grdPrdcrOgnCurntMng02;
		let nRow = datagrid.getRow();
		let nCol = datagrid.getCol();

		let computWayCdIdx = datagrid.getColRef("computWayCd");
		let altIdx = datagrid.getColRef("alt");

		if (!gfn_isEmpty(nCol) && nCol == computWayCdIdx) {
			let selValue = datagrid.getCellData(nRow, nCol);
			let chkInfo = _.find(comComputWay02, {computWayCd: selValue});
			let altVal = chkInfo.alt;
			datagrid.setCellData(nRow, altIdx, altVal, true);
		}
	}

	//평가지표 리스트 저장
	const fn_listSave01 = async function(){

		let gridData = grdPrdcrOgnCurntMng01.getGridDataAll();
		let saveList = [];

		//그리드의 해드가 두줄이상인경우 for문 시작과 끝을 늘린만큼 늘려야함
		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdPrdcrOgnCurntMng01.getRowData(i);
			let rowSts = grdPrdcrOgnCurntMng01.getRowStatus(i);
			let delYn = rowData.delYn;

			if(gfn_isEmpty(rowData.computWayCd)){
				gfn_comAlert("W0001", "산출식");		//	W0001	{0}을/를 선택하세요.
				grdPrdcrOgnCurntMng01.selectRow(i);
				return false;
			}else{
				//seq 가 있으면 computWayCd 저장을 했을 것
				if(gfn_isEmpty(rowData.scr) && gfn_isEmpty(rowData.seq)){
					gfn_comAlert("W0002", "점수");		//	W0002	{0}을/를 입력하세요.
					grdPrdcrOgnCurntMng01.selectRow(i);
					return false;
				}
			}

			rowData.rowSts = "I";
			saveList.push(rowData);
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/pcorm/multiSaveActvtnFundList.do", saveList);
			let data = await postJsonPromise;
			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
					fn_dtlGridSearch();
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

	//가감점 리스트 저장
	const fn_listSave02 = async function(){

		let gridData = grdPrdcrOgnCurntMng02.getGridDataAll();
		let saveList = [];

		//그리드의 해드가 두줄이상인경우 for문 시작과 끝을 늘린만큼 늘려야함
		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdPrdcrOgnCurntMng02.getRowData(i);
			let rowSts = grdPrdcrOgnCurntMng02.getRowStatus(i);
			let delYn = rowData.delYn;
			if (delYn == 'N') {
				if(gfn_isEmpty(rowData.fundArtcl)){
					gfn_comAlert("W0001", "항목");		//	W0001	{0}을/를 선택하세요.
					grdPrdcrOgnCurntMng02.selectRow(i);
					return false;
				}
				if(gfn_isEmpty(rowData.computWayCd)){
					gfn_comAlert("W0001", "산출식");		//	W0001	{0}을/를 선택하세요.
					grdPrdcrOgnCurntMng02.selectRow(i);
					return false;
				}
				if(gfn_isEmpty(rowData.scr)){
					gfn_comAlert("W0002", "점수");		//	W0002	{0}을/를 입력하세요.
					grdPrdcrOgnCurntMng02.selectRow(i);
					return false;
				}

				rowData.rowSts = "I";
				saveList.push(rowData);
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/pcorm/multiSaveActvtnFundList.do", saveList);
			let data = await postJsonPromise;
			try {
				if (_.isEqual("S", data.resultStatus)) {
					gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
					fn_dtlGridSearch();
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