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
					<!-- 전문품목 매입·매출 (출자출하조직 미보유) -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
				<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
				</c:if>
				<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
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
									class="form-control input-sm"
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
									class="form-control input-sm"
									autocomplete="off"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input">

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
									id="srch-input-crno"
									name="srch-input-crno"
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

	});

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_initSBSelect();
		fn_fcltMngCreateGrid01();
		<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
		fn_fcltMngCreateGrid();
		await fn_search();
		</c:if>
		<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00'}">
		await fn_dtlSearch();
		</c:if>

		//fn_fcltMngCreateGrid02();
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
			gfn_setComCdSBSelect('srch-input-sgg', 			jsonComSgg, 	'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			//gfn_setComCdSBSelect('srch-input-uoCd', 		jsonComUoCd, 	'UO_CD'), //통합조직코드
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 	'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분
			//gfn_setComCdSBSelect('dtl-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분

			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComCtpv, 	'CMPTN_INST_CTPV'), //시도
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComSgg, 		'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonGrdComCorpSeCd, 	'CORP_SE_CD'), //법인구분

		]);
		console.log("============fn_initSBSelect=====1=======");
	}


	var jsonPrdcrOgnCurntMng = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng';
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
	        {caption: ["진행단계"], 		ref: 'aa',   	type:'output',  width:'153px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'rmrk',   	type:'output',  width:'200px',    style:'text-align:center'}
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
	                sum : [3,4]
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
	                4 : "#,###",
	                5 : "#,###"
	            }

	        };
	        SBGridProperties.columns = [
	            {caption : ['전문품목명','전문품목명'],
	            	ref : "col0",   width : '100px',        style : 'text-align:center',     type : 'output'},
	            {caption : ['판매위임(매입)금액(천원)','구분'],
	            	ref : "col1",   width : '150px',        style : 'text-align:center',     type : 'output'},
	            {caption : ['판매위임(매입)금액(천원)','매입처'],
	            	ref : "col2",   width : '150px',        style : 'text-align:center',     type : 'output'},
	            {caption : ['판매위임(매입)금액(천원)','금액'],
	            	ref : "col3",   width : '100px',        style : 'text-align:right',      type : 'input',   format : { type:'number' , rule:'#,##0.00' }, merge:false},
	            {caption : ['출하(매출)금액<br>(천원)','출하(매출)금액<br>(천원)'],
	            	ref : "col4",   width : '100px',        style : 'text-align:right',      type : 'input',   format : { type:'number' , rule:'#,##0.00' }, merge:false},
	            {caption : ['비고','비고'],
	            	ref : "col5",   width : '150px',        style : 'text-align:right',      type : 'input',   format : { type:'number' , rule:'#,##0.00' }, merge:false}
	        ];

	    grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
	    //grdPrdcrOgnCurntMng01.bind('click','gridClick01');
	    grdPrdcrOgnCurntMng01.bind('afteredit','fn_AfterEdit01');
	}
	*/
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
	    SBGridProperties.extendlastcol = 'scroll';
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

	            {caption : ['판매위임(매입)금액(천원)','금액'], calc : 'fn_calcSlsCnsgnPrchsAmt',
	            	ref : "slsCnsgnPrchsAmt",   width : '100px',        style : 'text-align:right',      type : 'input',   format : { type:'number' , rule:'#,###' }, merge:false},
	            {caption : ['판매(매출)금액\n(천원)','판매(매출)금액<br>(천원)'], calc : 'fn_calcSlsCnsgnSlsAmt',
	            	ref : "slsCnsgnSlsAmt",   width : '100px',        style : 'text-align:right',      type : 'input',   format : { type:'number' , rule:'#,###' }, merge:false},
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
		        {caption: ["상세내역"], 	ref: 'isoBrno',   		hidden : true},
		        {caption: ["상세내역"], 	ref: 'typeSeNo',   		hidden : true},
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
		//console.log("fn_calcSlsCnsgnPrchsAmt");
		//console.log(nRow);
		let rowData = objGrid.getRowData(Number(nRow));
		let grdData = objGrid.getGridDataAll();
		let itemCd = rowData.itemCd;
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
		}else if(rowData.typeSeNo == '8'){
			let sumVal = 0;
			for (var i = 2; i < grdData.length + 1; i++) {
				let rowData01 = objGrid.getRowData(i);
				if(rowData01.itemCd == itemCd){
					if(rowData01.typeSeNo == '5' || rowData01.typeSeNo == '7'){
						if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt)){
							sumVal += Number(rowData01.slsCnsgnPrchsAmt);
						}
					}
				}
			}
			return sumVal;
		}else{
			return rowData.slsCnsgnPrchsAmt;
		}

	    return '';
	}
	//판매(매출)금액(천원) 소계 합계
	function fn_calcSlsCnsgnSlsAmt(objGrid, nRow, nCol) {
		//console.log("fn_calcSlsCnsgnPrchsAmt");
		//console.log(nRow);
		let rowData = objGrid.getRowData(Number(nRow));
		let grdData = objGrid.getGridDataAll();
		let itemCd = rowData.itemCd;
		if(rowData.typeSeNo == '6'){
			let sumVal = 0;
			for (var i = 2; i < grdData.length + 1; i++) {
				let rowData01 = objGrid.getRowData(i);
				if(rowData01.typeSeNo == '5' && rowData01.itemCd == itemCd){
					if(!gfn_isEmpty(rowData01.slsCnsgnSlsAmt)){
						sumVal += Number(rowData01.slsCnsgnSlsAmt);
					}
				}
			}
			return sumVal;
		}else if(rowData.typeSeNo == '8'){
			let sumVal = 0;
			for (var i = 2; i < grdData.length + 1; i++) {
				let rowData01 = objGrid.getRowData(i);
				if(rowData01.itemCd == itemCd){
					if(rowData01.typeSeNo == '5' || rowData01.typeSeNo == '7'){
						if(!gfn_isEmpty(rowData01.slsCnsgnSlsAmt)){
							sumVal += Number(rowData01.slsCnsgnSlsAmt);
						}
					}
				}
			}
			return sumVal;
		}else{
			return rowData.slsCnsgnSlsAmt;
		}

	    return '';
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
		let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
		let ctpv = SBUxMethod.get("srch-input-ctpv");//

		let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
		let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

		let brno = SBUxMethod.get("srch-input-brno");//
		let corpNm = SBUxMethod.get("srch-input-corpNm");//

    	let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
    		cmptnInst : cmptnInst
    		,ctpv : ctpv

    		,corpSeCd : corpSeCd
    		,corpDtlSeCd : corpDtlSeCd

    		,brno : brno
    		,corpNm : corpNm
    		//,yr : yr

    		,apoSe : '1'

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
			});

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
		//jsonPrdcrOgnCurntMng01.length= 0;
		//grdPrdcrOgnCurntMng01.rebuild();
		//jsonPrdcrOgnCurntMng02.length= 0;
		//grdPrdcrOgnCurntMng02.rebuild();
	}

	//판매위임[매입] 및 출하[매출] 실적 그리드 조회
	const fn_dtlGridSearch = async function(){
		let brno = SBUxMethod.get("dtl-input-brno");//
		let yr = SBUxMethod.get("dtl-input-yr");//

    	let postJsonPromise = gfn_postJSON("/pd/pcom/selectPrdcrCrclOgnSpItmPurSalNMngList.do", {
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
		let gridData01 = grdPrdcrOgnCurntMng01.getGridDataAll();
		for(var i=2; i <= gridData01.length+1; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);
			let slsCnsgnPrchsAmt = grdPrdcrOgnCurntMng01.getColRef("slsCnsgnPrchsAmt");//판매위임 금액 인덱스
			let slsCnsgnSlsAmt = grdPrdcrOgnCurntMng01.getColRef("slsCnsgnSlsAmt");//판매 매출 금액 인덱스
			//let uoSpmtAmt = grdPrdcrOgnCurntMng01.getColRef("uoSpmtAmt");//통합조직 출하 금액
			//let uoOtherSpmtAmt = grdPrdcrOgnCurntMng01.getColRef("uoOtherSpmtAmt");//통합조직 이외 출하 금액
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
					grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnSlsAmt, i, slsCnsgnSlsAmt, true);
				}
				// 배경 속성 추가
				grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, slsCnsgnPrchsAmt, i, slsCnsgnPrchsAmt, 'lightblue');
				//grdPrdcrOgnCurntMng01.setCellStyle('background-color', i, uoSpmtAmt, i, uoSpmtAmt, 'lightgreen');
			}
			//생산자조직 소계
			if(rowData01.typeSeNo == '6'){
				//disabled 처리
				grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnPrchsAmt, i, slsCnsgnSlsAmt, true);
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
				grdPrdcrOgnCurntMng01.setCellDisabled(i, slsCnsgnPrchsAmt, i, rmrk, true);
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

		//그리드의 해드가 두줄이상인경우 for문 시작과 끝을 늘린만큼 늘려야함
		for(var i=2; i<=gridData01.length + 1; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);
			let rowSts01 = grdPrdcrOgnCurntMng01.getRowStatus(i);
			//let delYn = rowData01.delYn;

			//매입 값이 있을경우 매출 값을 입력 필수
			if(rowData01.typeSeNo == '5'){
				if(!gfn_isEmpty(rowData01.slsCnsgnPrchsAmt) &&  Number(rowData01.slsCnsgnPrchsAmt) != 0){
					if(gfn_isEmpty(rowData01.slsCnsgnSlsAmt)){
						alert('매입 값이 있을경우 매출 금액 입력이 필수 입니다.');
						grdPrdcrOgnCurntMng01.selectRow(i);
						return false;
					}
				}
				if(!gfn_isEmpty(rowData01.slsCnsgnSlsAmt) &&  Number(rowData01.slsCnsgnSlsAmt) != 0){
					if(gfn_isEmpty(rowData01.slsCnsgnPrchsAmt)){
						alert('매출 값이 있을경우 매입 금액 입력이 필수 입니다.');
						grdPrdcrOgnCurntMng01.selectRow(i);
						return false;
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

			let postJsonPromise = gfn_postJSON("/pd/pcom/multiSavePrdcrCrclOgnSpItmPurSalNMngList.do", saveList);
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

</script>
</html>