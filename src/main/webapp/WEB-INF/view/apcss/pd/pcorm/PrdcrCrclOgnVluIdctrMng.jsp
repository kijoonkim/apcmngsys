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
					<!-- 등록결과확인 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
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
							<!--
							<th scope="row" class="th_bg"></th>
							<td colspan="3" class="td_input" style="border-right: hidden;">

							</td>
							<td class="td_input"></td>

							<th colspan="2" scope="row" class="th_bg">출자출하조직 사업자번호로 검색</th>
							<td colspan="2" class="td_input" style="border-right:hidden;" >

							</td>
							<td colspan="2" class="td_input">
							 -->
							 <td colspan="11" class="td_input" style="border-right: hidden;border-bottom: hidden;">
						</tr>
					</tbody>
				</table>
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
								<span style="font-size:14px">▶통합조직</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:350px; width: 100%;"></div>
				</div>
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶출자출하조직</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng02" style="height:350px; width: 100%;"></div>
				</div>
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶생산자조직</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng03" style="height:350px; width: 100%;"></div>
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

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		var now = new Date();
		var year = now.getFullYear();//현재년도

	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		SBUxMethod.set("srch-input-yr",year);//
		await fn_fcltMngCreateGrid();
	</c:if>
		await fn_fcltMngCreateGrid01();
		await fn_fcltMngCreateGrid02();
		await fn_fcltMngCreateGrid03();

		await fn_initSBSelect();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		await fn_search();
	</c:if>
	<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
		SBUxMethod.set("dtl-input-yr",year);//
		//관리자만 사용 예정
		//await fn_dtlSearch();
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

	var jsonComGrdCtpv = [];//시도
	var jsonComGrdSgg = [];//시군
	var jsonComGrdCorpSeCd = [];//법인구분
	var jsonComGrdAprv = [];//신청구분

	var jsonComGrdAprv_1 = [];//통합조직 구분
	var jsonComGrdSttgUpbrItemSe_1 = [];//품목구분

	var jsonComGrdAprv_2 = [];//통합조직 구분
	var jsonComGrdSttgUpbrItemSe_2 = [];//품목구분

	//적합품목 보유 여부
	var jsonComStbltHldYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'N'}
	];
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
			//gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComSgg, 	'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			//gfn_setComCdSBSelect('srch-input-uoCd', 		jsonComUoCd, 	'UO_CD'), //통합조직코드
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 	'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분
			//gfn_setComCdSBSelect('dtl-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdCtpv, 	'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdSgg, 		'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdAprv, 	'APRV_UPBR_SE_CD'), //신청구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonComGrdAprv_1, 	'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonComGrdSttgUpbrItemSe_1, 	'STTG_UPBR_ITEM_SE'), //품목구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng02', 	jsonComGrdAprv_2, 	'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng02', 	jsonComGrdSttgUpbrItemSe_2, 	'STTG_UPBR_ITEM_SE'), //품목구분

		]);
		console.log("============fn_initSBSelect=====1=======");
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
			{caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
			{caption: ["등록년도"], 		ref: 'yr',   	type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["법인체마감"], 		ref: 'prfmncCorpDdlnYn',   	type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["통합조직여부"], 	ref: 'aprv',   type:'combo',  width:'80px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComGrdAprv', label:'label', value:'value', displayui : false}},
			{caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'250px',    style:'text-align:center'},
			{caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'250px',    style:'text-align:center'},
			{caption: ["적합품목"], 		ref: 'stbltYnNm',   	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["법인구분"], 		ref: 'corpSeCd',type:'combo',  width:'100px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComGrdCorpSeCd', label:'label', value:'value', displayui : false}},
			{caption: ["시도"], 			ref: 'ctpv',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComGrdCtpv', label:'label', value:'value', displayui : false}},
			{caption: ["시군구"], 		ref: 'sgg',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComGrdSgg', label:'label', value:'value', displayui : false}},
		//{caption: ["진행단계"], 		ref: 'aa',   	type:'output',  width:'153px',    style:'text-align:center'},
			{caption: ["비고"], 			ref: 'rmrk',   	type:'output',  width:'200px',    style:'text-align:center'}
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
		grdPrdcrOgnCurntMng01.exportLocalExcel("통합조직(총괄표)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
		//SBGridProperties.mergecells = 'bycol';//동일한 열 병합처리
		SBGridProperties.datamergefalseskip = true;// merge false 된 열 병합 제외
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheight = 57;
		//SBGridProperties.whitespacemerge = true;//빈칸 자동병합
		//SBGridProperties.mergecellsverticalalign = 'bottom';
		SBGridProperties.columns = [
				{caption: ["구분"], 	ref: 'sttgUpbrItemNm',   	type:'output',  width:'100px',    style:'text-align:center;'},
				{caption: ["통합조직\n구분"], 	ref: 'aprv',   	type:'combo',  width:'100px',    style:'text-align:center;', disabled:true
					,typeinfo : {ref:'jsonComGrdAprv_1', label:'label', value:'value', displayui : false}},
				{caption: ["품목"], 	ref: 'itemNm',   	type:'output',  width:'100px',    style:'text-align:center;'},
				{caption: ["부류"], 	ref: 'ctgryNm',   	type:'output',  width:'100px',    style:'text-align:center;'},
				{caption: ["구분"], 		ref: 'sttgUpbrItemSe',   	type:'combo',  width:'100px',    style:'text-align:center;', disabled:true
					,typeinfo : {ref:'jsonComGrdSttgUpbrItemSe_1', label:'label', value:'value', displayui : false}},
				{caption: ["통합조직 총\n취급액(천원)(A)"], 		ref: 'slsCnsgnSlsAmtTot',   	type:'output',  width:'100px',    style:'text-align:center;'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
				{caption: ["생산자조직\n전속출하액(천원)(B)"], 	ref: 'slsCnsgnSlsAmt',   	type:'output',  width:'120px',    style:'text-align:center;'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
				{caption: ["전속취급률(%)\n(B/A)"], 			ref: 'slsCnsgnSlsAmtRt',   		type:'output',  width:'100px',    style:'text-align:center;'
					,format: {type: 'string', rule: '@" %"'}},
				{caption: ["적합여부"], 	ref: 'orgStbltYn',   		type:'output',  width:'100px',    style:'text-align:center;'},
				{caption: ["탈락사유"], 		ref: 'stbltYnNm',   	type:'textarea',  width:'150px',    style:'padding-left:10px'
					,typeinfo : {textareanewline : true},disabled:true },
				{caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
				{caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
				{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
				{caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
				{caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'aprv',   			hidden : true},
				{caption: ["상세내역"], 	ref: 'stbltYn',   			hidden : true},
			];

	    grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
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
		grdPrdcrOgnCurntMng02.exportLocalExcel("출자출하조직 (총괄표)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheight = 72;
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption: ["출자출하조직명","출자출하조직명"], 					ref: 'corpNm',   	type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["통합조직\n구분","통합조직\n구분"], 	ref: 'aprv',   	type:'combo',  width:'55px',    style:'text-align:center;', disabled:true
				,typeinfo : {ref:'jsonComGrdAprv_2', label:'label', value:'value', displayui : false}},
			{caption: ["품목","품목명"], 								ref: 'itemNm',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["품목","구분"], 		ref: 'sttgUpbrItemSe',   	type:'combo',  width:'55px',    style:'text-align:center;', disabled:true
				,typeinfo : {ref:'jsonComGrdSttgUpbrItemSe_2', label:'label', value:'value', displayui : false}},
			{caption: ["통합조직 판매위임액","생산자조직\n출하(A)(천원)"], 	ref: 'uoSpmtAmt',   	type:'output',  width:'100px',    style:'text-align:center;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["통합조직 판매위임액","생산자조직 외\n출하(B)(천원)"], 	ref: 'uoSpmtAmtOther',   	type:'output',  width:'100px',    style:'text-align:center;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["자체판매액","생산자조직\n출하(C)(천원)"], 			ref: 'uoOtherSpmtAmt',   	type:'output',  width:'100px',    style:'text-align:center;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["자체판매액","생산자조직 외\n출하(D)(천원)"], 		ref: 'uoOtherSpmtAmtOther',   	type:'output',  width:'100px',    style:'text-align:center;'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["출자출하조직\n총 판매액\n(E=A+B+C+D)\n(천원)","출자출하조직\n총 판매액\n(E=A+B+C+D)\n(천원)"],typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}
				, ref: 'uoSpmtAmtTot',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["출자출하조직의\n통합조직 판매위임비율","생산자조직출하\n[A/(A+C)]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'uoSpmtAmtRt',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["출자출하조직의\n통합조직 판매위임비율","전체출하\n[(A+B)/E]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'uoSpmtAmtTotRt',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["적합여부","적합여부"], 	ref: 'orgStbltYn',   	type:'output',  width:'70px',    style:'text-align:center;'},
			{caption: ["탈락사유","탈락사유"], 	ref: 'stbltYnNm',   	type:'textarea',  width:'150px',    style:'padding-left:10px'
				,typeinfo : {textareanewline : true},disabled:true },
			{caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
			//{caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
			//{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
			{caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'stbltYn',   		hidden : true},
			// {caption: ["상세내역"], 	ref: 'aprv',   			hidden : true},
		];

		grdPrdcrOgnCurntMng02 = _SBGrid.create(SBGridProperties);
	}

	var jsonPrdcrOgnCurntMng03 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng03;

	const objMenuList03 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld03,			//콜백함수명
			}
		};


	function fn_excelDwnld03() {
		grdPrdcrOgnCurntMng03.exportLocalExcel("생산자조직 (총괄표)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* Grid 화면 그리기 기능*/
	//생산자조직 리스트
	const fn_fcltMngCreateGrid03 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng03';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng03';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng03';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList03;	// 우클릭 메뉴 리스트
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		SBGridProperties.oneclickedit = false;//입력 활성화 true 1번클릭 false 더블클릭
		SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheight = 57;
		//SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["구분"], 			ref: 'apoSeNm',   	type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["법인명"], 			ref: 'corpNm',   	type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["통합조직 법인명"], 	ref: 'uoCorpNm',   	type:'output',  width:'160px',    style:'text-align:center;'},
			{caption: ["생산자조직 명"], 	ref: 'prdcrOgnzNm',   	type:'output',  width:'180px',    style:'text-align:center'},
			{caption: ["품목"],			ref: 'itemNm',   	type:'output',  width:'150px',    style:'text-align:center'},
			{caption: ["분류"],			ref: 'ctgryNm',   	type:'output',  width:'70px',    style:'text-align:center'},
			{caption: ["취급유형"], 		ref: 'trmtTypeNm',   	type:'output',  width:'85px',    style:'text-align:center'},

			{caption: ["조직원수"], 					ref: 'cnt',   	type:'output',  width:'60px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			{caption: ["생산량\n(결과)(톤)[A]"], 	ref: 'prdctnVlmTot',   	type:'output',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["전속(약정)\n출하계약량(톤)[B]"], 	ref: 'ecSpmtPlanVlmTot',   	type:'output',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["전속(약정)출하량\n(결과)(톤)[C]"], 	ref: 'ecSpmtVlmTot',   	type:'output',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["출하대금\n지급액(천원)"], 		ref: 'spmtPrcTot',   	type:'output',  width:'100px',    style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
			//{caption: ["출하비율(%)"], 					ref: 'ecSpmtRate',   	type:'output',  width:'70px',    style:'text-align:center'
				//,typeinfo : {mask : {alias: 'decimal', digits : 2}}, format : {type:'number', rule:'#,###.##'}},
				// ,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###.##'}},
			{caption: ["출하비율(%)\n(승인형)[C/A]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'ecSpmtRateA',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["출하비율(%)\n(육성형)[C/B]"] ,format: {type: 'string', rule: '@" %"'}
				, ref: 'ecSpmtRateB',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["적합여부"], 		ref: 'orgStbltYn',   	type:'output',  width:'50px',    style:'text-align:center'},
			{caption: ["탈락사유"], 		ref: 'stbltYnNm',   	type:'textarea',  width:'150px',    style:'padding-left:10px'
				,typeinfo : {textareanewline : true},disabled:true },
			//{caption: ["비고"], 			ref: 'rmrk',   		type:'input',  width:'220px',    style:'text-align:center'},

			{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',			hidden : true},
			{caption: ["상세내역"], 	ref: 'uoBrno',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'prdcrOgnzSn',		hidden : true},
			{caption: ["상세내역"], 	ref: 'stbltYn',		hidden : true},
			{caption: ["상세내역"], 	ref: 'aprv',   			hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',	hidden : true},

		];

		grdPrdcrOgnCurntMng03 = _SBGrid.create(SBGridProperties);

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
	/*
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
	*/


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
		jsonPrdcrOgnCurntMng01.length= 0;
		grdPrdcrOgnCurntMng01.rebuild();
		jsonPrdcrOgnCurntMng02.length= 0;
		grdPrdcrOgnCurntMng02.rebuild();
		jsonPrdcrOgnCurntMng03.length= 0;
		grdPrdcrOgnCurntMng03.rebuild();
		SBUxMethod.set('dtl-input-apoCd',null)//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',null)//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',null)//법인명
		SBUxMethod.set('dtl-input-crno',null)//법인등록번호
		SBUxMethod.set('dtl-input-brno',null)//사업자등록번호
		SBUxMethod.set('dtl-input-yr',null)//등록년도
	}

	const fn_dtlGridSearch = async function(){
		fn_dtlGridSearchUo();
		fn_dtlGridSearchIso();
		fn_dtlGridSearchFrmhs();
	}

	//판매위임[매입] 및 출하[매출] 실적 그리드 조회
	const fn_dtlGridSearchUo = async function(){
		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectUoList.do", {
			brno : brno
			, yr : yr
		});


		let data = await postJsonPromise ;
		try{
			jsonPrdcrOgnCurntMng01.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO = {
						sttgUpbrItemSe: item.sttgUpbrItemSe
						,sttgUpbrItemNm: item.sttgUpbrItemNm
						,itemCd: item.itemCd
						,itemNm: item.itemNm
						,ctgryCd: item.ctgryCd
						,ctgryNm: item.ctgryNm
						,aprv: item.aprv

						,slsCnsgnSlsAmt: item.slsCnsgnSlsAmt
						,slsCnsgnSlsAmtTot: item.slsCnsgnSlsAmtTot
						,slsCnsgnSlsAmtRt: item.slsCnsgnSlsAmtRt

						,stbltYn: item.stbltYn//적합여부 기준 적용 결과
						,orgStbltYn: item.orgStbltYn//적합여부 현재 적용 값
						,stbltYnNm: fn_calUoStbltYn(item)
				}
				jsonPrdcrOgnCurntMng01.push(PrdcrOgnCurntMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});



			grdPrdcrOgnCurntMng01.rebuild();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//출자출하조직 총괄표 조회
	async function fn_dtlGridSearchIso() {

		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise02 = gfn_postJSON("/pd/pcorm/selectIsoList.do", {
			brno : brno
			, yr : yr
		});
		let data = await postJsonPromise02;
		try{
			jsonPrdcrOgnCurntMng02.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO02 = {
						apoCd: 	item.apoCd
						,apoSe: item.apoSe
						,brno: 	item.brno
						,crno: 	item.crno
						,corpNm: item.corpNm
						,delYn: item.delYn
						,yr: item.yr

						,aprv: item.aprv

						,sttgUpbrItemSe: item.sttgUpbrItemSe
						,sttgUpbrItemNm: item.sttgUpbrItemNm

						,itemCd: 		item.itemCd
						,itemNm: 		item.itemNm

						,ctgryCd: 		item.ctgryCd
						,ctgryNm: 		item.ctgryNm

						,uoSpmtAmt: 			item.uoSpmtAmt
						,uoSpmtAmtOther: 		item.uoSpmtAmtOther
						,uoOtherSpmtAmt: 		item.uoOtherSpmtAmt
						,uoOtherSpmtAmtOther: 	item.uoOtherSpmtAmtOther

						,uoSpmtAmtRt: 			item.uoSpmtAmtRt
						,uoSpmtAmtTotRt: 		item.uoSpmtAmtTotRt
						,uoSpmtAmtTot: 			item.uoSpmtAmtTot

						,stbltYn: item.stbltYn//적합여부 기준 적용 결과
						,orgStbltYn: item.orgStbltYn//적합여부 현재 적용 값
						,stbltYnNm: fn_calIsoStbltYn(item)
				};

				jsonPrdcrOgnCurntMng02.push(PrdcrOgnCurntMngVO02);
			});

			grdPrdcrOgnCurntMng02.rebuild();

			let rowData = grdPrdcrOgnCurntMng02.getRowData(2);
			console.log(rowData);
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//생산자조직 총괄표 조회
	async function fn_dtlGridSearchFrmhs() {
		let brno = SBUxMethod.get('dtl-input-brno');

		let yr = SBUxMethod.get('dtl-input-yr');
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise03 = gfn_postJSON("/pd/pcorm/selectFrmhsList.do", {
			brno : brno
			,yr : yr
		});
		let data = await postJsonPromise03;
		try{
			jsonPrdcrOgnCurntMng03.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let itemVO = {
						brno: 	item.brno
						,uoBrno: item.uoBrno
						,corpNm: item.corpNm
						,uoCorpNm: item.uoCorpNm
						,yr: item.yr
						,aprv: item.aprv//승인형 육성형
						//,aprvNm: item.aprvNm
						,trmtType: item.trmtType
						,trmtTypeNm: item.trmtTypeNm
						,ctgryCd: item.ctgryCd
						,ctgryNm: item.ctgryNm
						,itemCd: item.itemCd
						,itemNm: item.itemNm

						,prdcrOgnzSn: item.prdcrOgnzSn
						,prdcrOgnzNm: item.prdcrOgnzNm

						,ecSpmtPlanVlmTot: item.ecSpmtPlanVlmTot//전속(약정)출하계획량
						,ecSpmtVlmTot: item.ecSpmtVlmTot//전속(약정)출하량
						,ecSpmtRateA: parseFloat(item.ecSpmtRateA)//출하비율A
						,ecSpmtRateB: parseFloat(item.ecSpmtRateB)//출하비율B
						,spmtPrcTot: item.spmtPrcTot//출하대금지급액
						,prdctnVlmTot: 	item.prdctnVlmTot
						,cnt: item.cnt//조직원수
						,stbltYn: item.stbltYn//적합여부 기준 적용 결과
						,orgStbltYn: item.orgStbltYn//적합여부 현재 적용 값
						,stbltYnNm: fn_calFrmhsStbltYn(item)
				}
				jsonPrdcrOgnCurntMng03.push(itemVO);
			});

			grdPrdcrOgnCurntMng03.rebuild();

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//통합조직 탈락적합 사유
	function fn_calUoStbltYn(item) {
		console.log("fn_calUoStbltYn");
		let stbltYnNmMng = [];
		console.log(item);
		//강제로 변경한 경우가 존재 함
		if(!gfn_isEmpty(item.orgStbltYn)){
			if (item.orgStbltYn == 'Y') {
				return "";
			}
		}

		console.log(item);
		//예외 품목인 경우
		if(item.chkItemA == 'Y'){
			item.ctgryCd = '2'
		}
		//예외 품목인 경우
		if(item.chkItemB == 'Y'){
			item.ctgryCd = '3'
		}

		if(item.aprv == '1' && item.sttgUpbrItemSe == '1'){
			if(item.ctgryCd == '1'){
				if(item.chkAmtTotAA != 'Y'){
					console.log("item.chkAmtTotAA = "+item.chkAmtTotAA);
					stbltYnNmMng.push('총취급액 요건 미달');
				}
				if(item.chkAA == 'A'){
					if(item.chkRtAA != 'Y'){
						console.log("item.chkAA = "+item.chkAA);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkAA == 'B'){
					if(item.chkRtAB != 'Y'){
						console.log("item.chkRtAB = "+item.chkRtAB);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkAA == 'C'){
					if(item.chkRtAC != 'Y'){
						console.log("item.chkRtAC = "+item.chkRtAC);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}
			}else if(item.ctgryCd == '2'){
				if(item.chkAmtTotAB != 'Y'){
					console.log("item.chkAmtTotAB = "+item.chkAmtTotAB);
					stbltYnNmMng.push('총취급액 요건 미달');
				}
				if(item.chkAB == 'A'){
					if(item.chkRtAA != 'Y'){
						console.log("item.chkRtAA = "+item.chkRtAA);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkAB == 'B'){
					if(item.chkRtAB != 'Y'){
						console.log("item.chkRtAB = "+item.chkRtAB);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkAB == 'C'){
					if(item.chkRtAC != 'Y'){
						console.log("item.chkRtAC = "+item.chkRtAC);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}
			}else if(item.ctgryCd == '3'){
				if(item.chkAmtTotAC != 'Y'){
					console.log("item.chkAmtTotAC = "+item.chkAmtTotAC);
					stbltYnNmMng.push('총취급액 요건 미달');
				}
				if(item.chkAC == 'A'){
					if(item.chkRtAA != 'Y'){
						console.log("item.chkRtAA = "+item.chkRtAA);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkAC == 'B'){
					if(item.chkRtAB != 'Y'){
						console.log("item.chkRtAB = "+item.chkRtAB);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkAC == 'C'){
					if(item.chkRtAC != 'Y'){
						console.log("item.chkRtAC = "+item.chkRtAC);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}
			}
		}else if(item.aprv == '1' && item.sttgUpbrItemSe == '2'){
			if(item.ctgryCd == '1'){
				if(item.chkAmtTotBA != 'Y'){
					console.log("item.chkAmtTotBA = "+item.chkAmtTotBA);
					stbltYnNmMng.push('총취급액 요건 미달');
				}
				if(item.chkBA == 'A'){
					if(item.chkRtBA != 'Y'){
						console.log("item.chkRtBA = "+item.chkRtBA);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkBA == 'B'){
					if(item.chkRtBB != 'Y'){
						console.log("item.chkRtBB = "+item.chkRtBB);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkBA == 'C'){
					if(item.chkRtBC != 'Y'){
						console.log("item.chkRtBC = "+item.chkRtBC);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}
			}else if(item.ctgryCd == '2'){
				if(item.chkAmtTotBB != 'Y'){
					console.log("item.chkAmtTotBB = "+item.chkAmtTotBB);
					stbltYnNmMng.push('총취급액 요건 미달');
				}
				if(item.chkBB == 'A'){
					if(item.chkRtBA != 'Y'){
						console.log("item.chkRtBA = "+item.chkRtBA);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkBB == 'B'){
					if(item.chkRtBB != 'Y'){
						console.log("item.chkRtBB = "+item.chkRtBB);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkBB == 'C'){
					if(item.chkRtBC != 'Y'){
						console.log("item.chkRtBC = "+item.chkRtBC);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}
			}else if(item.ctgryCd == '3'){
				if(item.chkAmtTotAC != 'Y'){
					console.log("item.chkAmtTotAC = "+item.chkAmtTotAC);
					stbltYnNmMng.push('총취급액 요건 미달');
				}
				if(item.chkBC == 'A'){
					if(item.chkRtBA != 'Y'){
						console.log("item.chkRtBA = "+item.chkRtBA);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkBC == 'B'){
					if(item.chkRtBB != 'Y'){
						console.log("item.chkRtBB = "+item.chkRtBB);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}else if(item.chkBC == 'C'){
					if(item.chkRtBC != 'Y'){
						console.log("item.chkRtBC = "+item.chkRtBC);
						stbltYnNmMng.push('전속취급률 요건 미달');
					}
				}
			}
		}else if(item.aprv == '2'){
			if(item.ctgryCd == '1'){
				if(item.chkAmtTotCA != 'Y'){
					console.log("item.chkAmtTotCA = "+item.chkAmtTotCA);
					stbltYnNmMng.push('약정취급액 요건 미달');
				}
			}else if(item.ctgryCd == '2'){
				if(item.chkAmtTotCB != 'Y'){
					console.log("item.chkAmtTotCB = "+item.chkAmtTotCB);
					stbltYnNmMng.push('약정취급액 요건 미달');
				}
			}else if(item.ctgryCd == '3'){
				if(item.chkAmtTotCC != 'Y'){
					console.log("item.chkAmtTotCC = "+item.chkAmtTotCC);
					stbltYnNmMng.push('약정취급액 요건 미달');
				}
			}
			if(item.chkRtC != 'Y'){
				console.log("item.chkRtC = "+item.chkRtC);
				stbltYnNmMng.push('약정취급률 요건 미달');
			}
		}
		return stbltYnNmMng.join("\n");
	}

	//출자출하조직 탈락적합 사유
	function fn_calIsoStbltYn(item) {
		console.log("fn_calIsoStbltYn");
		let stbltYnNmMng = [];
		console.log(item);
		//강제로 변경한 경우가 존재 함
		if(!gfn_isEmpty(item.orgStbltYn)){
			if (item.orgStbltYn == 'Y') {
				return "";
			}
		}

		if(item.aprv == '1'){
			if(item.sttgUpbrItemSe == '1'){
				if(item.chkAA != 'Y'){
					stbltYnNmMng.push('통합조직 판매위임 금액 미달');
				}
				if(item.chkAB != 'Y'){
					stbltYnNmMng.push('생산자조직 출하금액 중 통합조직 출하비율 미달');
				}
				if(item.chkAC != 'Y'){
					stbltYnNmMng.push('총취급액 중 통합조직 출하비율 미달');
				}
			}
		}else if(item.aprv == '2'){
			if(item.chkBA != 'Y'){
				stbltYnNmMng.push('통합조직 판매위임 금액 미달');
			}
			/*
			if(item.chkBB != 'Y'){
				stbltYnNmMng.push('생산자조직 출하금액 중 통합조직 출하비율 미달\n(육성형-전문품목의 경우 약정출하물량은 전량 통합조직으로만 판매)');
			}
			*/
			if(item.chkBC != 'Y'){
				stbltYnNmMng.push('총취급액 중 통합조직 출하비율 미달');
			}
		}
		return stbltYnNmMng.join("\n");
	}

	function fn_calFrmhsStbltYn(item) {
		console.log("fn_calFrmhsStbltYn");
		let stbltYnNmMng = [];
		console.log(item);
		//강제로 변경한 경우가 존재 함
		if(!gfn_isEmpty(item.orgStbltYn)){
			if (item.orgStbltYn == 'Y') {
				return "";
			}
		}

		//aprv 1 승인 2 육성
		//trmtType 1 공동출하수탁  2 공동선별수탁  3 공동선별매취
		if(item.aprv == '1'){
			if(item.sttgUpbrItemSe == '1'){
				if(!(item.cnt >= 5)){
					stbltYnNmMng.push('조직원수 요건 미달');
				}
				if(!(item.spmtPrcTot >= 200000)){
					stbltYnNmMng.push('출하대금지급액 요건 미달');
				}
				if(!(item.ecSpmtRateA >= 80)){
					stbltYnNmMng.push('출하비율 요건 미달');
				}
			}
		}else if(item.aprv == '2'){
			if(item.trmtType == '1'){
				if(!(item.cnt >= 5)){
					stbltYnNmMng.push('조직원수 요건 미달');
				}
				if(!(item.spmtPrcTot >= 50000)){
					stbltYnNmMng.push('출하대금지급액 요건 미달');
				}
				if(!(item.ecSpmtRateB >= 80)){
					stbltYnNmMng.push('출하비율 요건 미달');
				}
			}
			if(item.trmtType == '2'){
				if(!(item.cnt >= 5)){
					stbltYnNmMng.push('조직원수 요건 미달');
				}
				if(!(item.spmtPrcTot >= 50000)){
					stbltYnNmMng.push('출하대금지급액 요건 미달');
				}
			}
			if(item.trmtType == '3'){
				if(!(item.spmtPrcTot >= 50000)){
					stbltYnNmMng.push('출하대금지급액 요건 미달');
				}
			}
		}
		return stbltYnNmMng.join("\n");
	}
</script>
</html>