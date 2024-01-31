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
					<!-- 출자출하조직 관리 전문품목 매입·매출 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '21'}">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
				</c:if>
				<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00' && loginVO.userType ne '21'}">
					<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
					<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
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
						<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
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
							<!--
							<sbux-input uitype="hidden" id="dtl-input-uoBrno" name="dtl-input-uoBrno"></sbux-input>
							 -->
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
							<!--
							<td class="td_input"  style="border-left: hidden;">
							 -->
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
							<!--
							<td class="td_input"  style="border-left: hidden;">
							 -->
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
							<!--
							<td class="td_input"  style="border-left: hidden;">
							 -->
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
								<sbux-input
									uitype="text"
									id="dtl-input-uoBrno"
									name="dtl-input-uoBrno"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
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
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:600px; width: 100%;"></div>
				</div>

			</div>
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
		$("#dtl-input-uoBrno").hide();
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '21'}">
		fn_fcltMngCreateGrid();
		<c:if test="${loginVO.userType eq '21'}">
		$("#dtl-input-uoBrno").show();
		$("#dtl-input-selUoBrno").hide();
		</c:if>
	</c:if>
		fn_fcltMngCreateGrid01();
		//fn_fcltMngCreateGrid02();

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

	var jsonGrdCtpv = [];//시도
	var jsonGrdSgg = [];//시군
	var jsonGrdCorpSeCd = [];//법인구분
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

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdCtpv, 		'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdSgg, 		'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdCorpSeCd, 	'CORP_SE_CD'),//법인구분

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
	    		,typeinfo : {ref:'jsonGrdCorpSeCd', label:'label', value:'value', displayui : false}},
	    	{caption: ["시도"], 			ref: 'ctpv',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonGrdCtpv', label:'label', value:'value', displayui : false}},
	        {caption: ["시군구"], 		ref: 'sgg',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
		    	,typeinfo : {ref:'jsonGrdSgg', label:'label', value:'value', displayui : false}},
	        {caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'250px',    style:'text-align:center'},
	        {caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'250px',    style:'text-align:center'},
	        {caption: ["적합품목"], 		ref: 'stbltYnNm',   	type:'output',  width:'200px',    style:'text-align:center'},
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
	                sum : [3,4,5,6]
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
	                }
	            },
	            totalformat : {
	                3 : "#,###",
	                4 : "#,###",
	                5 : "#,###",
	                6 : "#,###"
	            }

	        };
	        SBGridProperties.columns = [
	            {caption : ['전문품목명','전문품목명','전문품목명'],
	            	ref : "itemNm",			width : '100px',	style : 'text-align:center',	type : 'output'},
	            {caption : ['판매위임(매입)금액(천원)','구분','구분'],
	            	ref : "seNm",   		width : '150px',	style : 'text-align:center',	type : 'output'},
	            {caption : ['판매위임(매입)금액(천원)','위임(매입)처','위임(매입)처'],
	            	ref : "prdcrOgnzNm",			width : '150px',	style : 'text-align:center',	type : 'output'},
	            {caption : ['판매위임(매입)금액(천원)','금액','금액'],
	            	ref : "slsCnsgnPrchsAmt",   width : '100px',	style : 'text-align:right',	type : 'input',   format : { type:'number' , rule:'#,###' }, merge:false},
	            {caption : ['출하(매출)금액(천원)','통합조직에<br>출하(판매)','통합조직에<br>출하(판매)'],
	            	ref : "uoSpmtAmt",		width : '100px',	style : 'text-align:right',		type : 'input',   format : { type:'number' , rule:'#,###' }, merge:false},
	            {caption : ['출하(매출)금액(천원)','통합조직 이외<br>출하(판매)','통합조직 이외<br>출하(판매)'],
	            	ref : "uoOtherSpmtAmt",	width : '100px',	style : 'text-align:right',		type : 'input',   format : { type:'number' , rule:'#,###' }, merge:false},
	            {caption : ['출하(매출)금액(천원)','합계','합계'],
	            	ref : "SpmtAmtTot",   	width : '100px',	style : 'text-align:right; background-color: #92b2c5',	type : 'output', calc : 'fn_calcSum' ,  format : { type:'number' , rule:'#,###' }, merge:false},
	            {caption : ['비고','비고','비고'],
	            	ref : "rmrk",   		width : '150px',	style : 'text-align:right',		type : 'input',   format : { type:'number' , rule:'#,###' }, merge:false},

	            {caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
	            {caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
	            {caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
	            {caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
	            {caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
	            {caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
	            {caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
	            {caption: ["상세내역"], 	ref: 'prdcrOgnzSn',   	hidden : true},
	            {caption: ["상세내역"], 	ref: 'isoBrno',   		hidden : true},
	            {caption: ["상세내역"], 	ref: 'cltvtnLandSn',   	hidden : true},
	            {caption: ["상세내역"], 	ref: 'prdcrOgnzCd',   	hidden : true},
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
		grdPrdcrOgnCurntMng01.exportLocalExcel("출자출하조직관리(전문품목 매입.매출)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
	    SBGridProperties.fixedrowheight=45;
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	            {caption : ['품목명','품목명'],
	            	ref : "itemNm",   width : '100px',        style : 'text-align:center',     type : 'output'},
	            {caption : ['판매위임(매입)금액(천원)','구분'],
	            	ref : "seNm",   width : '150px',        style : 'text-align:center',     type : 'output'},
	            //{caption : ['판매위임(매입)금액(천원)','구분'],
		            //ref : "seDtlNm",   width : '150px',        style : 'text-align:center',     type : 'output'},
		        //{caption : ['판매위임(매입)금액(천원)','품목구분'],
			        //ref : "sttgUpbrItemNm",   width : '80px',        style : 'text-align:center',     type : 'output' , merge:false},
			    {caption : ['판매위임(매입)금액(천원)','취급유형'],
					ref : "trmtTypeNm",   width : '80px',        style : 'text-align:center',     type : 'output' , merge:false},
	            {caption : ['판매위임(매입)금액(천원)','매입처'],
	            	ref : "prchsNm",   width : '150px',        style : 'text-align:center',     type : 'output', merge:false},
	            {caption : ['판매위임(매입)금액(천원)','금액'],
		            ref : "slsCnsgnPrchsAmt",   width : '100px',	style : 'text-align:right',	type : 'input',   format : { type:'number' , rule:'#,###' }, merge:false},
	            {caption : ['출하(매출)금액(천원)','통합조직에\n출하(판매)'],
		            ref : "uoSpmtAmt",		width : '100px',	style : 'text-align:right',		type : 'input',   format : { type:'number' , rule:'#,###' }, merge:false},
		        {caption : ['출하(매출)금액(천원)','통합조직 이외\n출하(판매)'],
		            ref : "uoOtherSpmtAmt",	width : '100px',	style : 'text-align:right',		type : 'input',   format : { type:'number' , rule:'#,###' }, merge:false},
		        {caption : ['출하(매출)금액(천원)','합계'],
		            ref : "SpmtAmtTot",   	width : '100px',	style : 'text-align:right; background-color: #92b2c5',	type : 'output', calc : 'fn_calcSum' ,  format : { type:'number' , rule:'#,###' }, merge:false},
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
			'slsCnsgnPrchsAmt','uoSpmtAmt','uoOtherSpmtAmt','SpmtAmtTot'
		];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_AfterEdit01(){
		let prevCol = grdPrdcrOgnCurntMng01.getPrevCol();
		let prevRef = grdPrdcrOgnCurntMng01.getRefOfCol(prevCol);
	    if(columnsToRefresh01.includes(prevRef)){
	    	grdPrdcrOgnCurntMng01.refresh();
	    }
	}

	//통합조직 출하 합계 함수
	function fn_calcSum(objGrid, nRow, nCol) {
		//console.log("==========fn_calcSum=======");
		var strSum
		var value01 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('uoSpmtAmt')));
		var value02 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('uoOtherSpmtAmt')));
		strSum = (value01 + value02).toString();
		fn_totSum(objGrid, nRow, nCol);
	    return strSum;
	}

	//통합조직 이외 출하 합계 함수
	function fn_totSum(objGrid, nRow, nCol) {
		//console.log("==========fn_uoSpmtAmtSum=======");

		let gridData01 = objGrid.getGridDataAll();
		if(gridData01.length == 0) return;

		let slsCnsgnPrchsAmt = objGrid.getColRef("slsCnsgnPrchsAmt");//판매 위임 매입
		let uoSpmtAmt = objGrid.getColRef("uoSpmtAmt");//통합 이외 출하
		let uoOtherSpmtAmt = objGrid.getColRef("uoOtherSpmtAmt");//통합 이외 출하
		let itemCd = objGrid.getColRef("itemCd");//품목코드
		let itemCdVal = objGrid.getCellData(Number(nRow), itemCd);

		let strSum1 = 0;
		let strSum2 = 0;
		let strSum3 = 0;
		let targetRow1;
		for(var i=2; i <= gridData01.length+1; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);

			if(rowData01.typeSeNo == '5' && rowData01.itemCd == itemCdVal){
				strSum1 += Number(rowData01.slsCnsgnPrchsAmt);
				strSum2 += Number(rowData01.uoSpmtAmt);
				strSum3 += Number(rowData01.uoOtherSpmtAmt);
			}
			//소계 위치 row
			if(rowData01.typeSeNo == '6' && rowData01.itemCd == itemCdVal){
				targetRow = i;
			}
		}
		objGrid.setCellData(Number(targetRow), slsCnsgnPrchsAmt , strSum1 );
		objGrid.setCellData(Number(targetRow), uoSpmtAmt , strSum2 );
		objGrid.setCellData(Number(targetRow), uoOtherSpmtAmt , strSum3 );
		fn_totalTotSum(objGrid, nRow, nCol);
	}

	//판매위임 매입 금액 합계 함수
	function fn_totalTotSum(objGrid, nRow, nCol) {
		//console.log("==========fn_totalTotSum=======");

		let gridData01 = objGrid.getGridDataAll();
		if(gridData01.length == 0) return;

		let slsCnsgnPrchsAmt = objGrid.getColRef("slsCnsgnPrchsAmt");//판매위임 매입 금액
		let uoSpmtAmt = objGrid.getColRef("uoSpmtAmt");//통합 출하
		let uoOtherSpmtAmt = objGrid.getColRef("uoOtherSpmtAmt");//통합 이외 출하
		let SpmtAmtTot = objGrid.getColRef("SpmtAmtTot");//출하 합계
		let slsCnsgnPrchsAmtVal = objGrid.getCellData(Number(nRow), slsCnsgnPrchsAmt);

		let itemCd = objGrid.getColRef("itemCd");//품목코드
		let itemCdVal = objGrid.getCellData(Number(nRow), itemCd);

		let strSum1 = 0;
		let strSum2 = 0;
		let strSum3 = 0;
		let strSum4 = 0;
		let targetRow;
		for(var i=2; i <= gridData01.length+1; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);
			if(rowData01.itemCd == itemCdVal){
				if(rowData01.typeSeNo == '6'){
					strSum1 += Number(rowData01.slsCnsgnPrchsAmt);
					strSum2 += Number(rowData01.uoSpmtAmt);
					strSum3 += Number(rowData01.uoOtherSpmtAmt);
					strSum4 += Number(rowData01.SpmtAmtTot);
				}
				if(rowData01.typeSeNo == '7'){
					strSum1 += Number(rowData01.slsCnsgnPrchsAmt);
					strSum2 += Number(rowData01.uoSpmtAmt);
					strSum3 += Number(rowData01.uoOtherSpmtAmt);
					strSum4 += Number(rowData01.SpmtAmtTot);
				}
				//합계 위치 row
				if(rowData01.typeSeNo == '8'){
					targetRow = i;
				}
			}
		}

		objGrid.setCellData(targetRow, slsCnsgnPrchsAmt , strSum1 );
		objGrid.setCellData(targetRow, uoSpmtAmt , strSum2 );
		objGrid.setCellData(targetRow, uoOtherSpmtAmt , strSum3 );
		objGrid.setCellData(targetRow, SpmtAmtTot , strSum4 );
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
		if(gfn_isEmpty(yr)){
			//추후 등록 년도 관련 수정 할시 변경
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
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
    		,yr : yr
    		,stbltYnNm:'Y'

    		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
    		,cmptnInst : cmptnInst
    		,ctpv : ctpv

    		,corpSeCd : corpSeCd
    		,corpDtlSeCd : corpDtlSeCd

    		,corpNm : corpNm

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
						,stbltYnNm: item.stbltYnNm
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
				SBUxMethod.set('dtl-input-yr',gfn_nvl(item.yr))//등록년도
			});
        	fn_searchUoList();
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
		fn_clearForm();

		let rowData = grdPrdcrOgnCurntMng.getRowData(nRow);
		//console.log(rowData);
		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno))//사업자등록번호
		SBUxMethod.set('dtl-input-yr',gfn_nvl(rowData.yr))//등록년도

		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		SBUxMethod.set('dtl-input-selUoBrno' , null);
		SBUxMethod.set('dtl-input-uoBrno' , null);
		fn_searchUoList();
		</c:if>
		<c:if test="${loginVO.userType eq '21'}">
		let brno = '${loginVO.brno}';
		console.log(brno);
		SBUxMethod.set('dtl-input-uoBrno' , brno);
		SBUxMethod.attr('dtl-input-selUoBrno','readonly',true);
		</c:if>
    }
	//그리드 초기화
	async function fn_clearForm() {
		jsonPrdcrOgnCurntMng01.length= 0;
		grdPrdcrOgnCurntMng01.rebuild();
		SBUxMethod.set('dtl-input-uoBrno' , null);
		SBUxMethod.set('dtl-input-selUoBrno' , null);
		//jsonPrdcrOgnCurntMng02.length= 0;
		//grdPrdcrOgnCurntMng02.rebuild();
	}

	//판매위임[매입] 및 출하[매출] 실적 그리드 조회
	const fn_dtlGridSearch = async function(){

		let brno = SBUxMethod.get("dtl-input-brno");//
		if(gfn_isEmpty(brno)) return;
		let uoBrnoVal = SBUxMethod.get('dtl-input-uoBrno');
		if(gfn_isEmpty(uoBrnoVal)){
			alert("통합조직을 선택해 주세요");
			return;
		}
		let yr = SBUxMethod.get("dtl-input-yr");//

    	let postJsonPromise = gfn_postJSON("/pd/isom/selectInvShipOgnSpeczItmPurSalMngList.do", {
    		brno : brno
    		,uoBrno : uoBrnoVal
    		,yr : yr
		});

        let data = await postJsonPromise ;
        try{
        	jsonPrdcrOgnCurntMng01.length = 0;
        	let totalRecordCount = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
        		let itemNm
        		if(item.sttgUpbrItemSe == '1'){
        			itemNm = item.itemNm + '(전문)';
        		}else if(item.sttgUpbrItemSe == '2'){
        			itemNm = item.itemNm + '(육성)';
        		}
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
						,rmrk: item.rmrk

						,uoSpmtAmt: item.uoSpmtAmt
						,uoOtherSpmtAmt: item.uoOtherSpmtAmt
						,SpmtAmtTot: item.SpmtAmtTot

						//,apoCd: item.apoCd
						//,apoSe: item.apoSe
						//,brno: item.brno
						//,crno: item.crno
						,ctgryCd: '0'
						,trmtType: item.trmtType
						,trmtTypeNm: item.trmtTypeNm

						,uoBrno : item.uoBrno
				}

				jsonPrdcrOgnCurntMng01.push(PrdcrOgnCurntMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
        	grdPrdcrOgnCurntMng01.rebuild();

        	//생산자조직 외 인경우 disabled 해제
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
		let gridData01 = grdPrdcrOgnCurntMng01.getGridDataAll();
		for(var i=2; i <= gridData01.length+1; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);
			let slsCnsgnPrchsAmt = grdPrdcrOgnCurntMng01.getColRef("slsCnsgnPrchsAmt");//판매위임 금액 인덱스
			let uoSpmtAmt = grdPrdcrOgnCurntMng01.getColRef("uoSpmtAmt");//통합조직 출하 금액
			let uoOtherSpmtAmt = grdPrdcrOgnCurntMng01.getColRef("uoOtherSpmtAmt");//통합조직 이외 출하 금액
			let seNm = grdPrdcrOgnCurntMng01.getColRef("seNm");//구분
			let prchsNm = grdPrdcrOgnCurntMng01.getColRef("prchsNm");//매입처
			//let sttgUpbrItemNm = grdPrdcrOgnCurntMng01.getColRef("sttgUpbrItemNm");//품목구분
			let trmtTypeNm = grdPrdcrOgnCurntMng01.getColRef("trmtTypeNm");//취급유형

			let rmrk = grdPrdcrOgnCurntMng01.getColRef("rmrk");//비고
			//uoOtherSpmtAmt uoSpmtAmt
			//grdPrdcrOgnCurntMng01.setCellStyle('background-color', nRow, nCol, nRow, nCol, 'lightgray');
			//생산자조직
			if(rowData01.typeSeNo == '5'){
				//disabled 처리
				grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnPrchsAmt, i, slsCnsgnPrchsAmt, true);
				if(gfn_isEmpty(rowData01.prchsNm)){
					grdPrdcrOgnCurntMng01.setCellDisabled(i, uoSpmtAmt, i, uoOtherSpmtAmt, true);
				}
				// 배경 속성 추가
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, slsCnsgnPrchsAmt, i, slsCnsgnPrchsAmt, 'lightblue');
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, uoSpmtAmt, i, uoSpmtAmt, 'lightgreen');
			}
			//생산자조직 소계
			if(rowData01.typeSeNo == '6'){
				//disabled 처리
				grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnPrchsAmt, i, uoOtherSpmtAmt, true);
				grdPrdcrOgnCurntMng01.setCellDisabled(i, rmrk, i, rmrk, true);
				// 배경 속성 추가
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, trmtTypeNm, i, rmrk, 'lightgray');
				grdPrdcrOgnCurntMng01.setMergeByFree(i,trmtTypeNm,i,prchsNm,true);
			}
			//생산자조직 외
			if(rowData01.typeSeNo == '7'){
				//disabled 처리
				//grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnPrchsAmt, i, uoOtherSpmtAmt, true);
			}
			//합계
			if(rowData01.typeSeNo == '8'){
				//disabled 처리
				grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnPrchsAmt, i, uoOtherSpmtAmt, true);
				grdPrdcrOgnCurntMng01.setCellDisabled(i, rmrk, i, rmrk, true);
				//배경 속성 추가
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, seNm, i, rmrk, 'lightgray');
				//셀단위 병합
				grdPrdcrOgnCurntMng01.setMergeByFree(i,seNm,i,prchsNm,true);
			}

		}
	}

	//실적 저장
	const fn_listSave = async function(){

		let gridData01 = grdPrdcrOgnCurntMng01.getGridDataAll();
		let saveList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let crno = SBUxMethod.get('dtl-input-crno');
		let brno = SBUxMethod.get('dtl-input-brno');
		let uoBrno = SBUxMethod.get('dtl-input-uoBrno');

		//그리드의 해드가 두줄이상인경우 for문 시작과 끝을 늘린만큼 늘려야함
		for(var i = 2; i <= gridData01.length +1; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);
			let rowSts01 = grdPrdcrOgnCurntMng01.getRowStatus(i);
			let delYn = rowData01.delYn;

			//매입or매출 값이 있을경우 매입 매출 값을 입력 필수
			//console.log("slsCnsgnPrchsAmt = "+rowData01.slsCnsgnPrchsAmt);
			//console.log("slsCnsgnPrchsAmt = "+rowData01.uoSpmtAmt);
			//console.log("slsCnsgnPrchsAmt = "+rowData01.uoOtherSpmtAmt);
			if(rowData01.typeSeNo == '5'){
				if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt) &&  Number(rowData01.slsCnsgnPrchsAmt) != 0){
					if(gfn_isEmpty(rowData01.uoSpmtAmt) && gfn_isEmpty(rowData01.uoOtherSpmtAmt)){
						alert('매입 값이 있을경우 매출 금액 입력이 필수 입니다.');
						grdPrdcrOgnCurntMng01.selectRow(i);
						return false;
					}
				}

				if((!gfn_isEmpty(rowData01.uoSpmtAmt) &&  Number(rowData01.uoSpmtAmt) != 0 )
						|| (!gfn_isEmpty(rowData01.uoOtherSpmtAmt) && Number(rowData01.uoOtherSpmtAmt) != 0)){
					if(gfn_isEmpty(rowData01.slsCnsgnPrchsAmt)){
						alert('매출 값이 있을경우 매입 금액 입력이 필수 입니다.');
						grdPrdcrOgnCurntMng01.selectRow(i);
		 	            return;
					}
				}
			}

			//'생산자조직 외' 인 경우
			//매입or매출 값이 있을경우 매입 매출 값을 입력 필수
			if(rowData01.typeSeNo == '7'){
				if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt) &&  Number(rowData01.slsCnsgnPrchsAmt) != 0){
					if(gfn_isEmpty(rowData01.uoSpmtAmt) && gfn_isEmpty(rowData01.uoOtherSpmtAmt)){
						alert('매입 값이 있을경우 매출 금액 입력이 필수 입니다.');
						grdPrdcrOgnCurntMng01.selectRow(i);
						return false;
					}
				}
				//매출 금액 둘중하나라도 존재하는 경우
				if((!gfn_isEmpty(rowData01.uoSpmtAmt) &&  Number(rowData01.uoSpmtAmt) != 0 )
						|| (!gfn_isEmpty(rowData01.uoOtherSpmtAmt) && Number(rowData01.uoOtherSpmtAmt) != 0)){
					//매입금액을 작성해야함
					if(gfn_isEmpty(rowData01.slsCnsgnPrchsAmt)){
						alert('매출 값이 있을경우 매입 금액 입력이 필수 입니다.');
						grdPrdcrOgnCurntMng01.selectRow(i);
		 	            return;
					}
				}
			}

			rowData01.apoCd = apoCd;
			rowData01.apoSe = apoSe;
			rowData01.crno = crno;
			rowData01.brno = brno;
			rowData01.prdcrOgnzCd = uoBrno;
			rowData01.uoBrno = uoBrno;

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
		//console.log(saveList);

		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/isom/multiSaveInvShipOgnSpeczItmPurSalMngList.do", saveList);
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
		//console.log(selCombo);
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