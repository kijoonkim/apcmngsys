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
					<!-- 전문품목 매입·매출 (출자출하조직 미보유) -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>

					<c:if test="${loginVO.userType ne '02'}">
						<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
					</c:if>

					<sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report"></sbux-button>
				</c:if>
				<c:if test="${loginVO.apoSe eq '1' || loginVO.apoSe eq '2'}">
					<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
					<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
					<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
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
							<!--
							<th scope="row" class="th_bg"></th>
							<td colspan="3" class="td_input" style="border-right: hidden;">

							</td>
							<td class="td_input"></td>

							<th colspan="2" scope="row" class="th_bg">통합조직 사업자번호로 검색</th>
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
						<sbux-button id="btnOpenPopup" name="btnOpenPopup" uitype="normal" class="btn btn-sm btn-primary" text="과거실적 팝업" onclick="fn_openMaodal"></sbux-button>
						<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
						<c:if test="${loginVO.userType ne '02'}">
							<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
						</c:if>
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

				<!-- 통합조직 진척도 -->
				<c:if test="${loginVO.userType eq '21'}">
					<!--
					%@ include file="../prgrs/PrgrsUo.jsp" %>
					-->
				</c:if>

				<br>
				<!--[pp] 검색결과 상세보기-->
				<div class="ad_section_top">
					<div style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
						<p>o 생산자조직의 출하량, 출하대금 지급액이 통합조직의 생산자조직 취급유형별 매입실적으로 연계되며, 이에 상응하는 매출실적 작성 필요</p>
						<p>o 생산자조직 외 기타매입한 실적에 대해서는 별도 매입실적 및 매출실적(물량/금액) 입력 필요(불려오는 값 없음)</p>
						<p>o 매출액 : 통합조직 판매액 기준. 수수료, 판매마진 등을 반영하여 매출액 작성    * 자체공판장 취급액 미포함</p>
					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">판매위임[매입] 및 출하[매출] 실적</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
								 -->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:600px; width: 100%;"></div>
				</div>

			</div>
		</div>
	</section>
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
	});

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_setYear();//기본년도 세팅
		await fn_initSBSelect();
		fn_fcltMngCreateGrid01();
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		fn_fcltMngCreateGrid();
		await fn_search();
		</c:if>
		<c:if test="${loginVO.apoSe eq '1' || loginVO.apoSe eq '2'}">
		await fn_dtlSearch();
		</c:if>

		//fn_fcltMngCreateGrid02();
	}

	/* 기본 년도값 세팅 */
	const fn_setYear = async function() {
		let cdId = "SET_YEAR";
		//SET_YEAR 공통코드의 1첫번쨰 순서의 값 불러오기
		let postJsonPromise = gfn_postJSON("/pd/bsm/selectSetYear.do", {
			cdId : cdId
		});
		let data = await postJsonPromise;
		//현재 년도(세팅값이 없는경우 현재년도로)
		let now = new Date();
		let year = now.getFullYear();
		try{
			if(!gfn_isEmpty(data.setYear)){
				year = data.setYear;
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
		//기본년도 세팅
		SBUxMethod.set("srch-input-yr",year);
		SBUxMethod.set("dtl-input-yr",year);
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

	//적합품목 보유 여부
	var jsonComStbltHldYn = [
		{'text': 'Y','label': 'Y', 'value': 'Y'},
		{'text': 'N','label': 'N', 'value': 'N'}
	];
	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		//console.log("============fn_initSBSelect============");
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			gfn_setComCdSBSelect('srch-input-cmptnInst', 	jsonComCmptnInst, 	'CMPTNC_INST'), //관할기관
			gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 	'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('srch-input-sgg', 			jsonComSgg, 	'CMPTN_INST_SIGUN'),//시군
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

		]);
		//console.log("============fn_initSBSelect=====1=======");
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
			{caption: ["등록년도"], 	ref: 'yr',			type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["통합조직여부"], 	ref: 'aprv',		type:'combo',  width:'80px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComGrdAprv', label:'label', value:'value', displayui : false}},
			{caption: ["법인명"], 		ref: 'corpNm',		type:'output',  width:'250px',    style:'text-align:center'},
			{caption: ["사업자번호"], 	ref: 'brno',		type:'output',  width:'250px',    style:'text-align:center'},
			{caption: ["적합품목(전문품목)"], 		ref: 'stbltYnNmList1',   	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["적합품목(육성품목)"], 		ref: 'stbltYnNmList2',   	type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["법인구분"], 	ref: 'corpSeCd',	type:'combo',  width:'100px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComGrdCorpSeCd', label:'label', value:'value', displayui : false}},
			{caption: ["시도"], 		ref: 'ctpv',		type:'combo',  width:'160px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComGrdCtpv', label:'label', value:'value', displayui : false}},
			{caption: ["시군구"], 		ref: 'sgg',			type:'combo',  width:'160px',    style:'text-align:center', disabled:true
				,typeinfo : {ref:'jsonComGrdSgg', label:'label', value:'value', displayui : false}},
			{caption: ["진행단계"], 	ref: 'aa',			type:'output',  width:'153px',    style:'text-align:center'},
			{caption: ["비고"], 		ref: 'rmrk',		type:'output',  width:'200px',    style:'text-align:center'},
			{caption: ["상세내역"], 	ref: 'apoCd',		hidden : true},
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
		grdPrdcrOgnCurntMng01.exportLocalExcel("통합조직관리(전문품목 매입.매출-출자출하조직미보유)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}
	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid01 = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng01';
		SBGridProperties.id = 'grdPrdcrOgnCurntMng01';
		SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng01';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.mergecells = 'bycol';//동일한 열 병합처리
		SBGridProperties.datamergefalseskip = true;// merge false 된 열 병합 제외
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
				{caption : ['품목명','품목명'],
					ref : "itemNm",   width : '100px',			style : 'text-align:center',     type : 'output'},
				{caption : ['판매위임(매입)현황','구분'],
					ref : "seNm",   width : '150px',			style : 'text-align:center',     type : 'output'},
				{caption : ['판매위임(매입)현황','취급유형'],
					ref : "trmtTypeNm",   width : '80px',		style : 'text-align:center',     type : 'output' , merge:false},
				{caption : ['판매위임(매입)현황','매입처'],
					ref : "prchsNm",   width : '150px',			style : 'text-align:center',     type : 'output', merge:false},

				{caption : ['판매위임(매입)현황','물량(톤)']
					,ref : "slsCnsgnPrchsVlm",   width : '100px',	style : 'text-align:right',      type : 'input'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false},
				{caption : ['판매위임(매입)현황','금액(천원)']
					,ref : "slsCnsgnPrchsAmt",   width : '100px',        style : 'text-align:right',      type : 'input'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false},


				{caption : ['판매(매출)현황','물량(톤)']
					,ref : "slsCnsgnSlsVlm",   width : '100px',		style : 'text-align:right',      type : 'input'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false},
				{caption : ['판매(매출)현황','금액(천원)']
					,calc : "fn_slsCnsgnSlsAmtCalc"
					,ref : "slsCnsgnSlsAmt",   width : '100px',        style : 'text-align:right',      type : 'input'
					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false},
				{caption : ['비고','비고']
					,ref : "rmrk",   width : '150px',        style : 'text-align:right',      type : 'input', merge:false},

				{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
				{caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
				{caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
				{caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'prdcrOgnzSn',   	hidden : true},
				{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
				{caption: ["상세내역"], 	ref: 'isoBrno',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'typeSeNo',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
				{caption: ["상세내역"], 	ref: 'ognzStbltYn',		hidden : true},
			];

		grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
		//grdPrdcrOgnCurntMng01.bind('click','gridClick01');
		//grdPrdcrOgnCurntMng01.bind('afteredit','fn_AfterEdit01');
		grdPrdcrOgnCurntMng01.bind('valuechanged','fn_AfterEdit01');
	}

	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh01 = [
			'slsCnsgnPrchsAmt', 'slsCnsgnSlsAmt'
			,'slsCnsgnPrchsVlm', 'slsCnsgnSlsVlm'
		];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_AfterEdit01(e){
		let objGrid = e.data.target;
		let nCol = objGrid.getCol();
		let nRef = objGrid.getRefOfCol(nCol);
		if(columnsToRefresh01.includes(nRef)){
			objGrid.refresh();
		}
	}
	function fn_slsCnsgnSlsAmtCalc(objGrid , nRow , nCol) {
		let strVal = objGrid.getCellData(Number(nRow), Number(nCol));
		let rowData = objGrid.getRowData(Number(nRow));
		if(rowData.typeSeNo === '5' || rowData.typeSeNo === '7'){
			fn_totSum(objGrid , nRow);
		}
		return strVal;
	}

	//소계 함수
	function fn_totSum(objGrid, nRow) {
		let gridData01 = objGrid.getGridDataAll();
		if(gridData01.length == 0) return;

		//타겟 품목 확인
		let itemCdCol = objGrid.getColRef("itemCd");//품목코드
		let itemCdVal = objGrid.getCellData(Number(nRow), itemCdCol);

		// 취급 유형별 소계 추가 (조직 적합 여부 포함)
		let sumMap = {
			'Y': {
				'0': { slsCnsgnPrchsAmt: 0, slsCnsgnSlsAmt: 0, slsCnsgnPrchsVlm: 0, slsCnsgnSlsVlm: 0 },
				'1': { slsCnsgnPrchsAmt: 0, slsCnsgnSlsAmt: 0, slsCnsgnPrchsVlm: 0, slsCnsgnSlsVlm: 0 },
				'2': { slsCnsgnPrchsAmt: 0, slsCnsgnSlsAmt: 0, slsCnsgnPrchsVlm: 0, slsCnsgnSlsVlm: 0 },
				'3': { slsCnsgnPrchsAmt: 0, slsCnsgnSlsAmt: 0, slsCnsgnPrchsVlm: 0, slsCnsgnSlsVlm: 0 },
			},
			'N': {
				'0': { slsCnsgnPrchsAmt: 0, slsCnsgnSlsAmt: 0, slsCnsgnPrchsVlm: 0, slsCnsgnSlsVlm: 0 },
				'1': { slsCnsgnPrchsAmt: 0, slsCnsgnSlsAmt: 0, slsCnsgnPrchsVlm: 0, slsCnsgnSlsVlm: 0 },
				'2': { slsCnsgnPrchsAmt: 0, slsCnsgnSlsAmt: 0, slsCnsgnPrchsVlm: 0, slsCnsgnSlsVlm: 0 },
				'3': { slsCnsgnPrchsAmt: 0, slsCnsgnSlsAmt: 0, slsCnsgnPrchsVlm: 0, slsCnsgnSlsVlm: 0 },
			},
		};

		let targetRows = {
			'Y': { '0': null, '1': null, '2': null, '3': null },
			'N': { '0': null, '1': null, '2': null, '3': null },
		};
		const totSet = '0';
		//테이블 해더 row 수
		let captionRow = objGrid.getFixedRows();
		for (let i = captionRow; i < gridData01.length + captionRow; i++) {
			let rowData01 = objGrid.getRowData(i);
			// 조직 적합 여부 확인
			let ognzStbltYn = rowData01.ognzStbltYn || 'N'; // 기본값 'N'
			// 소계 계산
			if (rowData01.typeSeNo === '5' && rowData01.itemCd === itemCdVal) {
				let trmtType = rowData01.trmtType;
				if (sumMap[ognzStbltYn] && sumMap[ognzStbltYn][trmtType]) {
					//전속출하 합계
					sumMap[ognzStbltYn][totSet].slsCnsgnPrchsAmt	+= Number(rowData01.slsCnsgnPrchsAmt || 0);
					sumMap[ognzStbltYn][totSet].slsCnsgnSlsAmt		+= Number(rowData01.slsCnsgnSlsAmt || 0);
					sumMap[ognzStbltYn][totSet].slsCnsgnPrchsVlm	+= Number(rowData01.slsCnsgnPrchsVlm || 0);
					sumMap[ognzStbltYn][totSet].slsCnsgnSlsVlm		+= Number(rowData01.slsCnsgnSlsVlm || 0);
					//취급유형별 합계
					sumMap[ognzStbltYn][trmtType].slsCnsgnPrchsAmt	+= Number(rowData01.slsCnsgnPrchsAmt || 0);
					sumMap[ognzStbltYn][trmtType].slsCnsgnSlsAmt	+= Number(rowData01.slsCnsgnSlsAmt || 0);
					sumMap[ognzStbltYn][trmtType].slsCnsgnPrchsVlm	+= Number(rowData01.slsCnsgnPrchsVlm || 0);
					sumMap[ognzStbltYn][trmtType].slsCnsgnSlsVlm	+= Number(rowData01.slsCnsgnSlsVlm || 0);
				}
			}

			// 소계 위치 ROW 찾기
			if (rowData01.typeSeNo === '6' && rowData01.itemCd === itemCdVal) {
				let trmtType = rowData01.trmtType;
				if (targetRows[ognzStbltYn]) {
					targetRows[ognzStbltYn][trmtType] = i;
				}
			}
		}

		// 소계 데이터를 objGrid에 설정
		Object.keys(sumMap).forEach((stbltYn) => {
			Object.keys(sumMap[stbltYn]).forEach((key) => {
				if (targetRows[stbltYn][key] !== null) {
					let rowIndex = Number(targetRows[stbltYn][key]); // 행 번호를 숫자로 변환
					let rowSum = sumMap[stbltYn][key]; // 소계 데이터

					// 각 열 데이터 설정
					Object.keys(rowSum).forEach((column) => {
						objGrid.setCellData(rowIndex, objGrid.getColRef(column), rowSum[column]);
					});
				}
			});
		});
		fn_totalTotSum(objGrid, nRow);
	}

	//합계 함수
	function fn_totalTotSum(objGrid, nRow) {

		let gridData01 = objGrid.getGridDataAll();
		if(gridData01.length == 0) return;

		let itemCd = objGrid.getColRef("itemCd");//품목코드
		let itemCdVal = objGrid.getCellData(Number(nRow), itemCd);

		// 합계를 저장할 변수 초기화
		let totalSum = {
				slsCnsgnPrchsAmt: 0,
				slsCnsgnSlsAmt: 0,
				slsCnsgnPrchsVlm: 0,
				slsCnsgnSlsVlm: 0,
			};

		let targetRow = null; // 합계가 설정될 행 번호

		let captionRow = objGrid.getFixedRows();

		for (let i = captionRow; i < gridData01.length + captionRow; i++) {
			// 현재 행 데이터 가져오기
			let rowData01 = objGrid.getRowData(i);

			// itemCd가 일치하는 경우만 처리
			if (rowData01.itemCd === itemCdVal) {
				// typeSeNo에 따른 합계 계산
				if (rowData01.typeSeNo === '5' || rowData01.typeSeNo === '7') {
					totalSum.slsCnsgnPrchsAmt 	+= Number(rowData01.slsCnsgnPrchsAmt || 0);
					totalSum.slsCnsgnSlsAmt 	+= Number(rowData01.slsCnsgnSlsAmt || 0);
					totalSum.slsCnsgnPrchsVlm 	+= Number(rowData01.slsCnsgnPrchsVlm || 0);
					totalSum.slsCnsgnSlsVlm 	+= Number(rowData01.slsCnsgnSlsVlm || 0);
				}

				// 합계 위치 행 번호 저장
				if (rowData01.typeSeNo === '8') {
					targetRow = i;
				}
			}
		}

		// 합계 데이터를 objGrid에 설정
		if (targetRow !== null) {
			Object.keys(totalSum).forEach((key) => {
				objGrid.setCellData(targetRow, objGrid.getColRef(key), totalSum[key]);
			});
		}
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


	/* 출력물 */
	const fn_report = async function() {
		let yr = SBUxMethod.get("srch-input-yr");//
		//년도 검색값이 없는 경우 최신년도
		if(gfn_isEmpty(yr)){
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let uoBrno = SBUxMethod.get("srch-input-uoBrno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

		let apoSe = SBUxMethod.get("srch-input-apoSe");//
		let frmhsHldYn = SBUxMethod.get("srch-input-frmhsHldYn");//
		let aprv = SBUxMethod.get("srch-input-aprv");//

		//sbgrid 체크박스 값 사용
		let yrChk = SBUxMethod.get("srch-input-yrChk");//
		let keys = Object.getOwnPropertyNames(yrChk);
		let yrChkVal = null;
		for(let i=0; i<keys.length; i++){
			if(yrChk[keys[i]]){
				yrChkVal = yrChk[keys[i]];
			}
		}
		</c:if>

		<c:if test="${loginVO.apoSe eq '1'}">
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;
		</c:if>

		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		gfn_popClipReport("검색리스트", "pd/sptDoc5.crf", {
			brno			: gfn_nvl(brno)
			, yr			: gfn_nvl(yr)
			, frmhsHld 		: "Y"
			, cmptnInst 	: gfn_nvl(cmptnInst)
			,ctpv 			: gfn_nvl(ctpv)
			,corpSeCd 		: gfn_nvl(corpSeCd)
			,corpDtlSeCd 	: gfn_nvl(corpDtlSeCd)
			,corpNm 		: gfn_nvl(corpNm)
			,aprv 			: gfn_nvl(aprv)
			,apoSe 			: gfn_nvl(apoSe)
			,frmhsHldYn 	: gfn_nvl(frmhsHldYn)
			,yrChk 			: gfn_nvl(yrChkVal)
			,uoBrno 		: gfn_nvl(uoBrno)
		});
		</c:if>
		<c:if test="${loginVO.apoSe eq '1'}">
		gfn_popClipReport("검색리스트", "pd/sptDoc5.crf", {
			brno		: gfn_nvl(brno)
			, yr		: gfn_nvl(yr)
			, frmhsHld 	: "Y"
			, userType 	: "21"
		});
		</c:if>
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
						,sgg: item.sgg
						,aprv: item.aprv
						,corpNm: item.corpNm
						,crno: item.crno
						,brno: item.brno
						,yr: item.yr
						,corpSeCd: item.corpSeCd
						,stbltYnNm: item.stbltYnNm
						,stbltYnNmList: item.stbltYnNmList
						,stbltYnNmList1: item.stbltYnNmList1
						,stbltYnNmList2: item.stbltYnNmList2
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
		let yr = SBUxMethod.get('dtl-input-yr');
		if(gfn_isEmpty(brno)) return;

		let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
			brno : brno
			, yr : yr
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
				//신청하지 않는 경우 값이 없음
				//SBUxMethod.set('dtl-input-yr',gfn_nvl(item.yr))//

				console.log("prfmncCorpDdlnYn = " + item.prfmncCorpDdlnYn);
				//실적 법인체 마감 저장 버튼 제거
				if (item.prfmncCorpDdlnYn == 'Y') {
					//저장 버튼만 숨김처리
					$('#btnSaveFclt1').hide();
				}
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
		//console.log("******************fn_view**********************************");
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
		//console.log(rowData);
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
	}


	//총괄표 출력
	const fn_report2 = async function() {

		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

		let reqCorpNmT = $('#dtl-input-corpNm').val();
		let reqBrnoT = $('#dtl-input-brno').val();
		let reqCrnoT = $('#dtl-input-crno').val();
		gfn_popClipReport("판매위임 매입 및 출하 매출 실적", "pd/sptDoc6.crf", {
			brno 		: gfn_nvl(brno)
			, yr 		: gfn_nvl(yr)
			, corpnm	: gfn_nvl(reqCorpNmT)
			, buisNo	: gfn_nvl(reqBrnoT)
			, corpno	: gfn_nvl(reqCrnoT)
		});
	}


	//판매위임[매입] 및 출하[매출] 실적 그리드 조회
	const fn_dtlGridSearch = async function(){
		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

		let postJsonPromise = gfn_postJSON("/pd/pcom/selectPrdcrCrclOgnSpItmPurSalNMngListNew.do", {
			brno : brno
			, yr : yr
		});

		let data = await postJsonPromise ;
		try{
			jsonPrdcrOgnCurntMng01.length = 0;
			let totalRecordCount = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO = {
						yr:			item.yr
						,brno:		item.brno
						,uoBrno:	item.uoBrno
						,isoBrno:	item.isoBrno

						,typeSeNo:	item.typeSeNo
						,itemCd: 	item.itemCd
						,itemNm:	item.itemNm

						,prdcrOgnzSn:	item.prdcrOgnzSn
						,trmtType:		item.trmtType
						,ognzStbltYn:	item.ognzStbltYn

						,seNm:			item.seNm
						,seDtlNm:		item.seDtlNm
						,prchsNm:		item.prchsNm
						,prdcrOgnzNm:	item.prdcrOgnzNm

						,trmtTypeNm:		item.trmtTypeNm
						,sttgUpbrItemSe:	item.sttgUpbrItemSe

						,slsCnsgnPrchsAmt:	item.slsCnsgnPrchsAmt
						,slsCnsgnPrchsVlm:	item.slsCnsgnPrchsVlm
						,slsCnsgnSlsAmt:	item.slsCnsgnSlsAmt
						,slsCnsgnSlsVlm:	item.slsCnsgnSlsVlm

						,rmrk: item.rmrk

				}
				jsonPrdcrOgnCurntMng01.push(PrdcrOgnCurntMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
			grdPrdcrOgnCurntMng01.rebuild();
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
		let objGrid = grdPrdcrOgnCurntMng01;

		// 컬럼 레퍼런스 설정
		const columnRefs = {
				slsCnsgnPrchsAmt	: objGrid.getColRef("slsCnsgnPrchsAmt"),
				slsCnsgnSlsAmt		: objGrid.getColRef("slsCnsgnSlsAmt"),
				slsCnsgnPrchsVlm	: objGrid.getColRef("slsCnsgnPrchsVlm"),
				slsCnsgnSlsVlm		: objGrid.getColRef("slsCnsgnSlsVlm"),
				seNm				: objGrid.getColRef("seNm"),
				prchsNm				: objGrid.getColRef("prchsNm"),
				trmtTypeNm			: objGrid.getColRef("trmtTypeNm"),
				rmrk				: objGrid.getColRef("rmrk"),
			};

		const gridData01 = objGrid.getGridDataAll();
		// 행 데이터 처리
		let captionRow = objGrid.getFixedRows();
		for (let i = captionRow; i < gridData01.length + captionRow; i++) {
			const rowData01 = objGrid.getRowData(i);
			const typeSeNo = rowData01.typeSeNo;
			switch (typeSeNo) {
				case '5': // 생산자조직
					//disabled 처리
					//if (gfn_isEmpty(rowData01.prchsNm)) {
						//objGrid.setCellDisabled(i, columnRefs.slsCnsgnSlsVlm, i, columnRefs.slsCnsgnSlsAmt, true);
					//}
					objGrid.setCellDisabled(i, columnRefs.slsCnsgnPrchsVlm, i, columnRefs.slsCnsgnPrchsAmt, true);
					// 배경 속성 추가
					//objGrid.setCellStyle('background-color', i, columnRefs.slsCnsgnSlsVlm, i, columnRefs.slsCnsgnSlsAmt, 'lightgray');
					objGrid.setCellStyle('background-color', i, columnRefs.slsCnsgnPrchsVlm, i, columnRefs.slsCnsgnPrchsAmt, 'lightgreen');

					objGrid.setCellStyle('background-color', i, columnRefs.slsCnsgnPrchsVlm, i, columnRefs.slsCnsgnPrchsAmt, '#e1e1e1');
					//objGrid.setCellStyle('background-color', i, columnRefs.uoSpmtVlm, i, columnRefs.uoSpmtAmt, 'lightgreen');
					break;

				case '6': // 생산자조직 소계
					objGrid.setCellDisabled(i, columnRefs.slsCnsgnPrchsVlm, i, columnRefs.slsCnsgnSlsAmt, true);
					objGrid.setCellDisabled(i, columnRefs.rmrk, i, columnRefs.rmrk, true);
					objGrid.setMergeByFree(i, columnRefs.trmtTypeNm, i, columnRefs.prchsNm, true);
					if (rowData01.trmtType === '0') {
						objGrid.setCellStyle('background-color', i, columnRefs.trmtTypeNm, i, columnRefs.rmrk, 'lightgray');
					} else {
						// 기본 색상
						objGrid.setCellStyle('background-color', i, columnRefs.trmtTypeNm, i, columnRefs.rmrk, '#e1e1e1');
					}
					break;

				case '7': // 생산자조직 외
					// 현재 로직에서 비활성화 처리 생략 (추후 필요시 추가)
					break;

				case '8': // 합계
					objGrid.setCellDisabled(i, columnRefs.slsCnsgnPrchsVlm, i, columnRefs.rmrk, true);
					//objGrid.setCellDisabled(i, columnRefs.rmrk, i, columnRefs.rmrk, true);
					objGrid.setCellStyle('background-color', i, columnRefs.seNm, i, columnRefs.rmrk, 'lightgray');
					objGrid.setMergeByFree(i, columnRefs.seNm, i, columnRefs.prchsNm, true);
					break;

				default:
					// 기타 타입에 대한 처리 추가 가능
					break;
			}
		}
	}

	//실적 저장
	const fn_listSave = async function(){
		let objGrid = grdPrdcrOgnCurntMng01;
		let gridData01 = objGrid.getGridDataAll();
		let saveList = [];

		let brno = SBUxMethod.get('dtl-input-brno');

		//테이블 해더 row수
		let captionRow = objGrid.getFixedRows();
		for(var i = captionRow; i < gridData01.length + captionRow; i++ ){
			let rowData01 = objGrid.getRowData(i);
			let rowSts01 = objGrid.getRowStatus(i);

			//매입 값이 있을경우 매출 값을 입력 필수
			if(rowData01.typeSeNo == '5' && rowData01.trmtType !== '0'){
				if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt) &&  Number(rowData01.slsCnsgnPrchsAmt) != 0){
					if(gfn_isEmpty(rowData01.slsCnsgnSlsAmt) || Number(rowData01.slsCnsgnSlsAmt) == 0){
						alert('매입 값이 있을경우 매출 금액 입력이 필수 입니다.');
						objGrid.selectRow(i);
						return false;
					}
				}
				if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt) && Number(rowData01.slsCnsgnPrchsAmt) != 0
						&& (gfn_isEmpty(rowData01.slsCnsgnPrchsVlm) || Number(rowData01.slsCnsgnPrchsVlm) == 0)){
					alert('매출 금액이 있는 경우 매출 물량은 필수 입니다');
					objGrid.selectRow(i);
					return;
				}
			}

			if(rowData01.typeSeNo == '7'){
				if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt) &&  Number(rowData01.slsCnsgnPrchsAmt) != 0){
					if(gfn_isEmpty(rowData01.slsCnsgnSlsAmt) || Number(rowData01.slsCnsgnSlsAmt) == 0){
						alert('매입 값이 있을경우 매출 금액 입력이 필수 입니다.');
						objGrid.selectRow(i);
						return false;
					}
				}

				if(!gfn_isEmpty(rowData01.slsCnsgnSlsAmt) &&  Number(rowData01.slsCnsgnSlsAmt) != 0){
					if(gfn_isEmpty(rowData01.slsCnsgnPrchsAmt) || Number(rowData01.slsCnsgnPrchsAmt) == 0){
						alert('매출 값이 있을경우 매입 금액 입력이 필수 입니다.');
						objGrid.selectRow(i);
						return false;
					}
				}

				if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt) && Number(rowData01.slsCnsgnPrchsAmt) != 0
						&& (gfn_isEmpty(rowData01.slsCnsgnPrchsVlm) || Number(rowData01.slsCnsgnPrchsVlm) == 0)){
					alert('매출 금액이 있는 경우 매출 물량은 필수 입니다');
					objGrid.selectRow(i);
					return;
				}

				if(!gfn_isEmpty(rowData01.slsCnsgnSlsAmt) && Number(rowData01.slsCnsgnSlsAmt) != 0
						&& (gfn_isEmpty(rowData01.slsCnsgnSlsVlm) || Number(rowData01.slsCnsgnSlsVlm) == 0)){
					alert('매입 금액이 있는 경우 매입 물량은 필수 입니다');
					objGrid.selectRow(i);
					return;
				}
			}

			rowData01.apoSe = '1';
			rowData01.brno = brno;
			rowData01.uoBrno = brno;

			rowData01.rowSts = "I";
			saveList.push(rowData01);
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){
			let postJsonPromise = gfn_postJSON("/pd/pcom/multiSavePrdcrCrclOgnSpItmPurSalNMngListNew.do", saveList);
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

	/* 과거 실적 조회 팝업 추가 */

	//과거 조회 팝업
	const fn_openMaodal = function() {
		//사업자번호
		let brno = SBUxMethod.get("dtl-input-brno");

		if(gfn_isEmpty(brno)){return;}

		//popBizPlanPdfViewer.init(rowData , fn_setPdfViewer);
		//SBUxMethod.openModal('modal-bizPlanPdfViewer');

		var url = "/pd/hisPopup/UoSpItmPurSalNHisPopup.do"
		var title = "제출실적 보기";
		//SBUxMethod.popupWindow(url, title, '600px','500px');

		window.open(url, title, "width=1000px,height=900px");
	}

	//팝업 새창에서 변수 확인
	function fn_getData() {
		let data = [];
		data.brno = SBUxMethod.get("dtl-input-brno");
		data.corpNm = SBUxMethod.get("dtl-input-corpNm");
		return data;
	}

</script>
</html>