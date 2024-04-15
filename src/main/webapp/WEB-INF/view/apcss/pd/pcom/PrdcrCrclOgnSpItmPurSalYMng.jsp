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
					<!-- 전문품목 매입·매출 (출자출하조직 보유) -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
					<sbux-button id="btnRowData" name="btnRowData" uitype="normal" text="로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect"></sbux-button>
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>

					<c:if test="${loginVO.userType ne '02'}">
						<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
					</c:if>

					<sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report"></sbux-button>
				</c:if>
				<c:if test="${loginVO.userType eq '21' || loginVO.userType eq '22'}">
					<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
					<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>

					 <sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="실적 출력" onclick="fn_report2"></sbux-button>
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

						<c:if test="${loginVO.userType ne '02'}">
							<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
						</c:if>

						<sbux-button id="btnReport2" name="btnReport2" uitype="normal" class="btn btn-sm btn-primary" text="실적 출력" onclick="fn_report2"></sbux-button>
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
				<br>
				<!--[pp] 검색결과 상세보기-->
				<div class="ad_section_top">
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
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:880px; width: 100%;"></div>
				</div>
			</div>
			<div id="sb-area-hiddenGrd" style="height:400px; width: 100%; display: none;"></div>
		</div>
	</section>
</body>
<script type="text/javascript">

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
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		await fn_fcltMngCreateGrid();
	</c:if>
		await fn_fcltMngCreateGrid01();
		//fn_fcltMngCreateGrid02();

		await fn_initSBSelect();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		await fn_search();
	</c:if>
	<c:if test="${loginVO.userType eq '21' || loginVO.userType eq '22'}">
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
	        {caption: ["진행단계"], 		ref: 'aa',   	type:'output',  width:'153px',    style:'text-align:center'},
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

	/* Grid 화면 그리기 기능*/
	/*
	const fn_fcltMngCreateGrid01 = async function() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng01';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng01';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng01';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    //SBGridProperties.rowheader = 'seq';
	    SBGridProperties.selectmode = 'byrow';
	    //SBGridProperties.selectmode = 'free';
	    SBGridProperties.mergecells = 'bycol';//열의 데이터가 일치하면 합쳐서 보여줌
	    //SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.total = {
	            type        : 'sub',
	            position    : 'bottom',
	            columns     : {
	                standard : [0,1],
	                sum : [4,5]
	            },
	            subtotalrow : {
	                0 : {
	                    titlecol    : 1,
	                    titlevalue  : '합계(백만원)',
	                    style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
	                    stylestartcol   : 1
	                },
	                1 : {
	                    titlecol    : 2,
	                    titlevalue  : '소계',
	                    style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
	                    stylestartcol   : 2
	                },
	                2 : {
	                    titlecol    : 3,
	                    titlevalue  : '소계',
	                    style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
	                    stylestartcol   : 3
	                }
	            },
	            totalformat : {
	                4 : "#,###",
	                5 : "#,###"
	            }

	        };
	        SBGridProperties.columns = [
	            {caption : ['전문품목명','전문품목명'],
	            	ref : "itemNm",   width : '100px',        style : 'text-align:center',     type : 'output'},
	            {caption : ['판매위임(매입)금액(천원)','구분'],
	            	ref : "uoSeNm",   width : '150px',        style : 'text-align:center',     type : 'output'},
	            {caption : ['판매위임(매입)금액(천원)','구분'],
		            ref : "seNm",   width : '150px',        style : 'text-align:center',     type : 'output'},

	            {caption : ['판매위임(매입)금액(천원)','매입처'],
	            	ref : "prdcrOgnzNm",   width : '150px',        style : 'text-align:center',     type : 'output'},
	            {caption : ['판매위임(매입)금액(천원)','금액'],
	            	ref : "uoSpmtAmt",   width : '100px',        style : 'text-align:right',      type : 'input',   format : { type:'number' , rule:'#,###' }, merge:false},

	            {caption : ['판매(매출)금액<br>(천원)','판매(매출)금액<br>(천원)'],
	            	ref : "uoOtherSpmtAmt",   width : '100px',        style : 'text-align:right',      type : 'input',   format : { type:'number' , rule:'#,###' }, merge:false},
	            {caption : ['비고','비고'],
	            	ref : "rmrk",   width : '150px',        style : 'text-align:right',      type : 'input'},

	            {caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
		        {caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
		        {caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
		        {caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
		        {caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
		        {caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
		        {caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
		        {caption: ["상세내역"], 	ref: 'prdcrOgnzSn',   	hidden : true},
		        {caption: ["상세내역"], 	ref: 'iso',   			hidden : true},
		        {caption: ["상세내역"], 	ref: 'prdcrOgnzCd',   	hidden : true},
		        {caption: ["상세내역"], 	ref: 'cltvtnLandSn',   	hidden : true},
		        {caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',   hidden : true},
	        ];

	    grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
	    //grdPrdcrOgnCurntMng01.bind('click','gridClick01');
	    grdPrdcrOgnCurntMng01.bind('afteredit','fn_AfterEdit01');
	}
	*/

	const objMenuList01 = {
	        "excelDwnld": {
	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
	            "accesskey": "e",					//단축키
	            "callback": fn_excelDwnld01,			//콜백함수명
	        }
	    };


	function fn_excelDwnld01() {
		grdPrdcrOgnCurntMng01.exportLocalExcel("통합조직관리(전문품목 매입.매출-출자출하조직보유)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
	    //SBGridProperties.whitespacemerge = true;//빈칸 자동병합
	    //SBGridProperties.mergecellsverticalalign = 'bottom';
	    SBGridProperties.columns = [
	            {caption : ['품목명','품목명'],
	            	ref : "itemNm",   width : '100px',        style : 'text-align:center',     type : 'output'},
	            {caption : ['판매위임(매입)금액(천원)','구분'],
	            	ref : "seNm",   width : '150px',        style : 'text-align:center',     type : 'output'},
	            {caption : ['판매위임(매입)금액(천원)','구분'],
		            ref : "seDtlNm",   width : '150px',        style : 'text-align:center',     type : 'output'},
		        //{caption : ['판매위임(매입)금액(천원)','품목구분'],
			        //ref : "sttgUpbrItemNm",   width : '80px',        style : 'text-align:center',     type : 'output' , merge:false},
			    {caption : ['판매위임(매입)금액(천원)','취급유형'],
					ref : "trmtTypeNm",   width : '80px',        style : 'text-align:center',     type : 'output' , merge:false},
	            {caption : ['판매위임(매입)금액(천원)','매입처'],
	            	ref : "prchsNm",   width : '150px',        style : 'text-align:center',     type : 'output', merge:false},

	            {caption : ['판매위임(매입)금액(천원)','금액'], calc : 'fn_calcSlsCnsgnPrchsAmt',
	            	ref : "slsCnsgnPrchsAmt",   width : '100px',        style : 'text-align:right',      type : 'input'
	            	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false },

	            {caption : ['판매(매출)금액<br>(천원)','판매(매출)금액<br>(천원)'], calc : 'fn_calcSlsCnsgnSlsAmt',
	            	ref : "slsCnsgnSlsAmt",   width : '100px',        style : 'text-align:right',      type : 'input'
	            	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false},
	            {caption : ['비고','비고'],
	            	ref : "rmrk",   width : '150px',        style : 'text-align:right',      type : 'input', merge:false},

	            {caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
		        {caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
		        {caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
		        {caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
		        {caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
		        {caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
		        {caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
		        {caption: ["상세내역"], 	ref: 'prdcrOgnzSn',   	hidden : true},
		        {caption: ["상세내역"], 	ref: 'prdcrOgnzCd',   	hidden : true},
		        {caption: ["상세내역"], 	ref: 'cltvtnLandSn',   	hidden : true},
		        {caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		        {caption: ["상세내역"], 	ref: 'typeSeNo',   		hidden : true},
		        {caption: ["상세내역"], 	ref: 'isoBrno',   		hidden : true},
		        {caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
	        ];

	    grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
	    //grdPrdcrOgnCurntMng01.bind('click','gridClick01');
	    grdPrdcrOgnCurntMng01.bind('afteredit','fn_AfterEdit01');
	}



	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh01 = [
		  'slsCnsgnPrchsAmt', 'slsCnsgnSlsAmt'
		];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_AfterEdit01(){
		let prevCol = grdPrdcrOgnCurntMng01.getPrevCol();
		let prevRef = grdPrdcrOgnCurntMng01.getRefOfCol(prevCol);
	    if(columnsToRefresh01.includes(prevRef)){
	    	grdPrdcrOgnCurntMng01.refresh();
	    }
	}

	//판매위임(매입)금액(천원) 소계 합계
	function fn_calcSlsCnsgnPrchsAmt(objGrid, nRow, nCol) {
		let rowData = objGrid.getRowData(Number(nRow));
		let grdData = objGrid.getGridDataAll();
		//console.log(nRow + " : " + rowData.slsCnsgnPrchsAmt);
		let itemCd = rowData.itemCd;
		if(rowData.typeSeNo == '2'){
			let sumVal = 0;
			for (var i = 2; i < grdData.length + 1; i++) {
				let rowData01 = objGrid.getRowData(i);
				//console.log(i + " : " + rowData01.slsCnsgnPrchsAmt);
				if(rowData01.typeSeNo == '1' && rowData01.itemCd == itemCd){
					if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt)){
						sumVal += Number(rowData01.slsCnsgnPrchsAmt);
					}
				}
			}
			return sumVal;
		}
		if(rowData.typeSeNo == '4'){
			let sumVal = 0;
			for (var i = 2; i < grdData.length + 1; i++) {
				let rowData01 = objGrid.getRowData(i);
				if(rowData01.itemCd == itemCd){
					if(rowData01.typeSeNo == '1' || rowData01.typeSeNo == '3'){
						if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt)){
							sumVal += Number(rowData01.slsCnsgnPrchsAmt);
						}
					}
				}
			}
			return sumVal;
		}

		if(rowData.typeSeNo == '6'){
			let sumVal = 0;
			for (var i = 2; i < grdData.length + 1; i++) {
				let rowData01 = objGrid.getRowData(i);
				if(rowData01.typeSeNo == '5' && rowData01.itemCd == itemCd){
					if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt)){
						sumVal += Number(rowData01.slsCnsgnPrchsAmt);
					}
				}
			}
			return sumVal;
		}
		if(rowData.typeSeNo == '8'){
			let sumVal = 0;
			for (var i = 2; i < grdData.length + 1; i++) {
				let rowData01 = objGrid.getRowData(i);
				if(rowData01.itemCd == itemCd){
					if(rowData01.typeSeNo == '1' || rowData01.typeSeNo == '3' || rowData01.typeSeNo == '5' || rowData01.typeSeNo == '7'){
						if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt)){
							sumVal += Number(rowData01.slsCnsgnPrchsAmt);
						}
					}
				}
			}
			return sumVal;
		}
		return rowData.slsCnsgnPrchsAmt;
	}

	//판매(매출)금액(천원) 소계 합계
	function fn_calcSlsCnsgnSlsAmt(objGrid, nRow, nCol) {
		let rowData = objGrid.getRowData(Number(nRow));
		let grdData = objGrid.getGridDataAll();
		let itemCd = rowData.itemCd;
		if(rowData.typeSeNo == '4'){
			let sumVal = 0;
			for (var i = 2; i < grdData.length + 1; i++) {
				let rowData01 = objGrid.getRowData(i);
				if(rowData01.itemCd == itemCd){
					if(rowData01.typeSeNo == '2' || rowData01.typeSeNo == '3'){
						if(!gfn_isEmpty(rowData01.slsCnsgnSlsAmt)){
							sumVal += Number(rowData01.slsCnsgnSlsAmt);
						}
					}
				}
			}
			return sumVal;
		}

		if(rowData.typeSeNo == '8'){
			let sumVal = 0;
			for (var i = 2; i < grdData.length + 1; i++) {
				let rowData01 = objGrid.getRowData(i);
				if(rowData01.itemCd == itemCd){
					if(rowData01.typeSeNo == '2' || rowData01.typeSeNo == '3' || rowData01.typeSeNo == '6' || rowData01.typeSeNo == '7'){
						if(!gfn_isEmpty(rowData01.slsCnsgnSlsAmt)){
							sumVal += Number(rowData01.slsCnsgnSlsAmt);
						}
					}
				}
			}
			return sumVal;
		}

		return rowData.slsCnsgnSlsAmt;
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

		<c:if test="${loginVO.userType eq '21'}">
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;
		</c:if>

		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
		gfn_popClipReport("검색리스트", "pd/sptDoc3.crf", {
			brno			: gfn_nvl(brno)
			, yr			: gfn_nvl(yr)
			, frmhsHld 		: "Y"
			, cmptnInst 	: gfn_nvl(cmptnInst)
			, ctpv 			: gfn_nvl(ctpv)
			, corpSeCd 		: gfn_nvl(corpSeCd)
			, corpDtlSeCd 	: gfn_nvl(corpDtlSeCd)
			, corpNm 		: gfn_nvl(corpNm)
			, aprv 			: gfn_nvl(aprv)
			, apoSe 		: gfn_nvl(apoSe)
			, frmhsHldYn 	: gfn_nvl(frmhsHldYn)
			, yrChk 		: gfn_nvl(yrChkVal)
			, uoBrno 		: gfn_nvl(uoBrno)
		});
		</c:if>
		<c:if test="${loginVO.userType eq '21'}">
		gfn_popClipReport("검색리스트", "pd/sptDoc3.crf", {
			brno		: gfn_nvl(brno)
			, yr		: gfn_nvl(yr)
			, frmhsHld 	: "Y"
			,userType 	: "21"
		});
		</c:if>
	}

	/* 출력물 */
	const fn_report2 = async function() {
		let brno = SBUxMethod.get("dtl-input-brno");//
		let crno = SBUxMethod.get("dtl-input-crno");//
		let yr = SBUxMethod.get("dtl-input-yr");//
		let corpNm = SBUxMethod.get("dtl-input-corpNm");//

		if(brno == null || brno == ""){
			alert("법인을 선택해주세요");
			return
		}

		gfn_popClipReport("판매위임[매입] 및 출하[매출] 실적", "pd/sptDoc4.crf", {
			brno			: gfn_nvl(brno)
			, yr			: gfn_nvl(yr)
			, corpNo		: gfn_nvl(crno)
			, corpNm		: gfn_nvl(corpNm)
			, buisNo		: gfn_nvl(brno)
		});
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
				SBUxMethod.set('dtl-input-yr',gfn_nvl(item.yr))//사업자등록번호

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
		//console.log(rowData);
		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno))//사업자등록번호
		SBUxMethod.set('dtl-input-yr',gfn_nvl(rowData.yr))//등록년도
		fn_clearForm();
    }
	//그리드 초기화
	async function fn_clearForm() {
		jsonPrdcrOgnCurntMng01.length= 0;
		grdPrdcrOgnCurntMng01.rebuild();
		//jsonPrdcrOgnCurntMng02.length= 0;
		//grdPrdcrOgnCurntMng02.rebuild();
	}

	//판매위임[매입] 및 출하[매출] 실적 그리드 조회
	const fn_dtlGridSearch = async function(){
		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

    	let postJsonPromise = gfn_postJSON("/pd/pcom/selectPrdcrCrclOgnSpItmPurSalYMngList.do", {
    		brno : brno
    		, yr : yr
		});

        let data = await postJsonPromise ;
        try{
        	jsonPrdcrOgnCurntMng01.length = 0;
        	let totalRecordCount = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
        		let PrdcrOgnCurntMngVO = {
						typeSeNo: item.typeSeNo
						,seNm: item.seNm
						,seDtlNm: item.seDtlNm
						,prchsNm: item.prchsNm

						,isoBrno: item.isoBrno
						,prdcrOgnzSn: item.prdcrOgnzSn
						,prdcrOgnzCd: item.prdcrOgnzCd
						,prdcrOgnzNm: item.prdcrOgnzNm
						,cltvtnLandSn: item.cltvtnLandSn
						,sttgUpbrItemSe: item.sttgUpbrItemSe
						//,sttgUpbrItemNm: item.sttgUpbrItemNm
						,itemCd: item.itemCd
						,itemNm: item.itemNm
						,yr: item.yr

						,slsCnsgnPrchsAmt: item.slsCnsgnPrchsAmt
						,slsCnsgnSlsAmt: item.slsCnsgnSlsAmt
						,rmrk: item.rmrk

						//,uoSpmtAmt: item.uoSpmtAmt
						//,uoOtherSpmtAmt: item.uoOtherSpmtAmt
						//,SpmtAmtTot: item.SpmtAmtTot

						//,apoCd: item.apoCd
						//,apoSe: item.apoSe
						//,brno: item.brno
						//,crno: item.crno
						,ctgryCd: '0'
						,trmtType: item.trmtType
						,trmtTypeNm: item.trmtTypeNm
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
		console.log("=========fn_gridCustom================");
		let gridData01 = grdPrdcrOgnCurntMng01.getGridDataAll();

		let seNm = grdPrdcrOgnCurntMng01.getColRef("seNm");//구분
		let seDtlNm = grdPrdcrOgnCurntMng01.getColRef("seDtlNm");//구분상세
		//let sttgUpbrItemNm = grdPrdcrOgnCurntMng01.getColRef("sttgUpbrItemNm");//품목구분
		let trmtTypeNm = grdPrdcrOgnCurntMng01.getColRef("trmtTypeNm");//취급유형
		let prchsNm = grdPrdcrOgnCurntMng01.getColRef("prchsNm");//매입처
		let slsCnsgnPrchsAmt = grdPrdcrOgnCurntMng01.getColRef("slsCnsgnPrchsAmt");//판매위임 매입 금액 인덱스
		let slsCnsgnSlsAmt = grdPrdcrOgnCurntMng01.getColRef("slsCnsgnSlsAmt");//판매위임 매출 금액 인덱스
		let rmrk = grdPrdcrOgnCurntMng01.getColRef("rmrk");//비고

		let arr1 =[];
		let arr2 =[];
		for(var i=2; i <= gridData01.length+1; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);
			//통합조직에 속한 출자출하조직
			if(rowData01.typeSeNo == '1'){
				//disabled 처리
				grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnPrchsAmt, i, slsCnsgnSlsAmt, true);
				//배경 속성 추가
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, slsCnsgnPrchsAmt, i, slsCnsgnPrchsAmt, 'lightgreen');
				//해당 타입 위치 저장
				let rowVal = {itmeCd : rowData01.itemCd, row : i};
				arr1.push(rowVal);
			}
			//통합조직에 속한 출자출하조직 소계
			if(rowData01.typeSeNo == '2'){
				//disabled 처리
				grdPrdcrOgnCurntMng01.setCellDisabled(i, trmtTypeNm, i, slsCnsgnPrchsAmt, true);
				grdPrdcrOgnCurntMng01.setCellDisabled(i, rmrk, i, rmrk, true);
				// 배경 속성 추가
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, trmtTypeNm, i, slsCnsgnPrchsAmt, 'lightgray');
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, rmrk, i, rmrk, 'lightgray');
				//셀단위 병합
				grdPrdcrOgnCurntMng01.setMergeByFree(i,trmtTypeNm,i,prchsNm,true);
			}
			//통합조직에 속한 출자출하조직 생산자조직 외
			if(rowData01.typeSeNo == '3'){
				//disabled 처리
				grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnPrchsAmt, i, slsCnsgnPrchsAmt, true);
				//grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnPrchsAmt, i, slsCnsgnPrchsAmt, true);
				// 배경 속성 추가
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, slsCnsgnPrchsAmt, i, slsCnsgnPrchsAmt, 'lightgray');
			}
			//통합조직에 속한 출자출하조직 생산자조직 외 소계
			if(rowData01.typeSeNo == '4'){
				//disabled 처리
				grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnPrchsAmt, i, rmrk, true);
				// 배경 속성 추가
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, seDtlNm, i, rmrk, 'lightgray');
				//셀단위 병합
				grdPrdcrOgnCurntMng01.setMergeByFree(i,seDtlNm,i,prchsNm,true);
			}

			//생산자조직
			if(rowData01.typeSeNo == '5'){
				//disabled 처리
				grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnPrchsAmt, i, slsCnsgnSlsAmt, true);
				// 배경 속성 추가
				//grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, slsCnsgnPrchsAmt, i, slsCnsgnPrchsAmt, 'lightblue');
				//grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, uoSpmtAmt, i, uoSpmtAmt, 'lightgreen');
				//해당 타입 위치 저장
				let rowVal = {itmeCd : rowData01.itemCd, row : i};
				arr2.push(rowVal);
			}
			//생산자조직 소계

			if(rowData01.typeSeNo == '6'){
				//disabled 처리
				grdPrdcrOgnCurntMng01.setCellDisabled(i, trmtTypeNm, i, slsCnsgnPrchsAmt, true);
				grdPrdcrOgnCurntMng01.setCellDisabled(i, rmrk, i, rmrk, true);
				// 배경 속성 추가
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, trmtTypeNm, i, slsCnsgnPrchsAmt, 'lightgray');
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, rmrk, i, rmrk, 'lightgray');
				//셀단위 병합
				grdPrdcrOgnCurntMng01.setMergeByFree(i,trmtTypeNm,i,prchsNm,true);
			}

			//기타매입 생산자조직 외
			if(rowData01.typeSeNo == '7'){
				//disabled 처리
				//grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnPrchsAmt, i, uoOtherSpmtAmt, true);
			}
			//합계
			if(rowData01.typeSeNo == '8'){
				//disabled 처리
				grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnPrchsAmt, i, rmrk, true);
				//배경 속성 추가
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, seNm, i, rmrk, 'lightgray');
				//셀단위 병합
				grdPrdcrOgnCurntMng01.setMergeByFree(i,seNm,i,prchsNm,true);
			}
		}
		//판매 위임 매입 금액 세로 셀단위 병합
		//console.log(arr1);
		//console.log(typeof arr1);
		//console.log(arr2);
		//console.log(typeof arr2);
		//grdPrdcrOgnCurntMng01.setMergeByFree([0],slsCnsgnSlsAmt,[typeSeOne.length-1],slsCnsgnSlsAmt,true);
		//grdPrdcrOgnCurntMng01.setMergeByFree([0],slsCnsgnSlsAmt,[typeSeFive.length-1],slsCnsgnSlsAmt,true);
	}

	//실적 저장
	const fn_listSave = async function(){

		let gridData01 = grdPrdcrOgnCurntMng01.getGridDataAll();
		let saveList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let crno = SBUxMethod.get('dtl-input-crno');
		let brno = SBUxMethod.get('dtl-input-brno');

		//그리드의 해드가 두줄이상인경우 for문 시작과 끝을 늘린만큼 늘려야함
		for(var i=2; i<=gridData01.length + 1; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);
			let rowSts01 = grdPrdcrOgnCurntMng01.getRowStatus(i);
			//let delYn = rowData01.delYn;

			//매입 값이 있을경우 매출 값을 입력 필수
			if(rowData01.typeSeNo == '2' || rowData01.typeSeNo == '6'){
				if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt) &&  Number(rowData01.slsCnsgnPrchsAmt) != 0){
					if(gfn_isEmpty(rowData01.slsCnsgnSlsAmt) || Number(rowData01.slsCnsgnSlsAmt) == 0){
						alert('매입 값이 있을경우 매출 금액 입력이 필수 입니다.');
						grdPrdcrOgnCurntMng01.selectRow(i);
						return false;
					}
				}
			}

			//매입 값이 있을경우 매출 값을 입력 필수
			if(rowData01.typeSeNo == '3' || rowData01.typeSeNo == '7' ){
				if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt)){
					if(Number(rowData01.slsCnsgnPrchsAmt) != 0){
						if(gfn_isEmpty(rowData01.slsCnsgnSlsAmt) || Number(rowData01.slsCnsgnSlsAmt) == 0){
							alert('매입 값이 있을경우 매출 금액 입력이 필수 입니다.');
							grdPrdcrOgnCurntMng01.selectRow(i);
							return false;
						}
					}
				}
				//매출값이
				if(!gfn_isEmpty(rowData01.slsCnsgnSlsAmt)){
					if(Number(rowData01.slsCnsgnSlsAmt) != 0){
						if(gfn_isEmpty(rowData01.slsCnsgnPrchsAmt) || Number(rowData01.slsCnsgnPrchsAmt) == 0){
							alert('매출 값이 있을경우 매입 금액 입력이 필수 입니다.');
							grdPrdcrOgnCurntMng01.selectRow(i);
							return false;
						}
					}
				}
			}



			rowData01.apoCd = apoCd;
			rowData01.apoSe = apoSe;
			rowData01.crno = crno;
			rowData01.brno = brno;

			rowData01.rowSts = "I";
			saveList.push(rowData01);

			/*
			if (rowSts01 === 3){
				rowData01.rowSts = "I";
				saveList.push(rowData01);
			} else if (rowSts01 === 2){
				rowData01.rowSts = "I";
				saveList.push(rowData01);
			} else if (rowSts01 === 1){
				rowData01.rowSts = "I";
				saveList.push(rowData01);
			} else {
				continue;
			}
			*/
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/pcom/multiSavePrdcrCrclOgnSpItmPurSalYMngList.do", saveList);
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
			{caption: ["신청년도"],				ref:'yr', 				type:'output', width:'70px',	style:'text-align:center'},
			{caption: ["사업자번호"],			ref:'brno', 			type:'output', width:'100px',	style:'text-align:center'},
			{caption: ["법인명"],				ref:'corpNm', 			type:'output', width:'100px',	style:'text-align:center'},
			{caption: ["통합조직 구분"],			ref:'aprv', 			type:'output', width:'70px',	style:'text-align:center'},
			{caption: ["구분"],				ref:'typeSeNo', 		type:'output', width:'90px',	style:'text-align:center'},
			{caption: ["구분명"],				ref:'typeSeNoNm', 		type:'output', width:'100px',	style:'text-align:center'},
			{caption: ["품목명"],				ref:'itemNm', 			type:'output', width:'100px',	style:'text-align:center'},
			{caption: ["분류명"],				ref:'ctgryNm', 			type:'output', width:'100px',	style:'text-align:center'},
			{caption: ["전문/육성 구분"],		ref:'sttgUpbrItemNm', 	type:'output', width:'120px',	style:'text-align:center'},
			{caption: ["취급유형"],				ref:'trmtTypeNm',		type:'output', width:'100px',	style:'text-align:center'},
			{caption: ["출자출하조직 사업자번호"],	ref:'isoBrno', 			type:'output', width:'120px',	style:'text-align:center'},
			{caption: ["출자출하조직 법인명	"],		ref:'isoCorpNm', 		type:'output', width:'120px',	style:'text-align:center'},
			{caption: ["생산자조직 번호"],		ref:'prdcrOgnzSn', 		type:'output', width:'140px',	style:'text-align:center'},
			{caption: ["생산자조직명"],			ref:'prdcrOgnzNm', 		type:'output', width:'120px',	style:'text-align:center'},
			{caption: ["판매위임 매입 금액"],		ref:'slsCnsgnPrchsAmt', type:'output', width:'120px',	style:'text-align:center'},
			{caption: ["판매 매출 금액"],		ref:'slsCnsgnSlsAmt', 	type:'output', width:'120px',	style:'text-align:center'},
			{caption: ["비고"],				ref:'rmrk', 			type:'output', width:'70px',	style:'text-align:center'},
			{caption: ["적합여부"],				ref:'stbltYn', 			type:'output', width:'90px',	style:'text-align:center'},
			{caption: ["선정여부"],				ref:'lastStbltYn', 		type:'output', width:'90px',	style:'text-align:center'},

			{caption: ["공동출하수탁 금액"],			ref:'trmtType1', 		type:'output', width:'90px',	style:'text-align:center'},
			{caption: ["공동선별수탁 금액"],			ref:'trmtType2', 		type:'output', width:'90px',	style:'text-align:center'},
			{caption: ["공동선별매취 금액"],			ref:'trmtType3', 		type:'output', width:'90px',	style:'text-align:center'},

			{caption: ["공동출하수탁 비율(%)"],		ref:'trmtTypeRt1', 		type:'output', width:'90px',	style:'text-align:center'},
			{caption: ["공동선별수탁 비율(%)"],		ref:'trmtTypeRt2', 		type:'output', width:'90px',	style:'text-align:center'},
			{caption: ["공동선별매취 비율(%)"],		ref:'trmtTypeRt3', 		type:'output', width:'90px',	style:'text-align:center'},
		];

		hiddenGrd = _SBGrid.create(SBGridProperties);

	}
	const fn_hiddenGrdSelect = async function(){
		await fn_hiddenGrd();
		let yr = SBUxMethod.get("srch-input-yr");
		if (gfn_isEmpty(yr)) {
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise = gfn_postJSON("/pd/pcom/selectPrdcrCrclOgnSpItmPurSalYMngRawDataList.do", {
		    yr : yr
			});

			let data = await postJsonPromise;
			try{
			jsonHiddenGrd.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO = {
					yr					: item.yr
					,brno				: item.brno
					,corpNm				: item.corpNm
					,aprv				: item.aprv
					,typeSeNo			: item.typeSeNo
					,typeSeNoNm			: item.typeSeNoNm
					,itemNm				: item.itemNm
					,ctgryNm			: item.ctgryNm
					,sttgUpbrItemNm		: item.sttgUpbrItemNm
					,trmtTypeNm			: item.trmtTypeNm
					,isoBrno			: item.isoBrno
					,isoCorpNm			: item.isoCorpNm
					,prdcrOgnzSn		: item.prdcrOgnzSn
					,prdcrOgnzNm		: item.prdcrOgnzNm
					,slsCnsgnPrchsAmt	: Number(item.slsCnsgnPrchsAmt)
					,slsCnsgnSlsAmt		: Number(item.slsCnsgnSlsAmt)
					,rmrk				: item.rmrk
					,stbltYn			: item.stbltYn
					,lastStbltYn		: item.lastStbltYn

					,trmtType1			: item.trmtType1
					,trmtType2			: item.trmtType2
					,trmtType3			: item.trmtType3
					,trmtTypeRt1		: item.trmtTypeRt1
					,trmtTypeRt2		: item.trmtTypeRt2
					,trmtTypeRt3		: item.trmtTypeRt3

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

		let fileName = formattedDate + "_전문품목매입매출_통합조직_로우데이터";

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

</script>
</html>