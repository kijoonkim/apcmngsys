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
					<div id="sb-area-grdPrdcrOgnCurntMng" style="height:200px; width: 100%;"></div>
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
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] 검색결과 상세보기-->
				<!-- 생산자조직 리스트 그리드 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶총괄표</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:350px; width: 100%;"></div>
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
		var year = now.getFullYear();
		SBUxMethod.set("srch-input-yr",year);//
	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '21'}">
		fn_fcltMngCreateGrid();
	</c:if>
		fn_fcltMngCreateGrid01();
		//fn_fcltMngCreateGrid02();

		await fn_initSBSelect();

	<c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '21'}">
		await fn_search();
	</c:if>
	<c:if test="${loginVO.userType ne '01' && loginVO.userType ne '00' && loginVO.userType ne '21'}">
		SBUxMethod.set("dtl-input-yr",year);//
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
	        //{caption: ["적합여부"], 		ref: 'stbltYn',   	type:'output',  width:'50px',    style:'text-align:center'},
	        //20240130 한개라도 적합한 경우 적합하게 표기, 적합품목 표기 추가 요청
	        {caption: ["진행단계"], 		ref: 'aa',   	type:'output',  width:'153px',    style:'text-align:center'},
	        {caption: ["비고"], 			ref: 'rmrk',   	type:'output',  width:'200px',    style:'text-align:center'}
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
		grdPrdcrOgnCurntMng01.exportLocalExcel("출자출하조직관리(매입.매출)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.fixedrowheight=45;
	    SBGridProperties.rowheight = 57;
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["출자출하조직명","출자출하조직명"], 					ref: 'corpNm',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["품목","품목"], 								ref: 'itemNm',   	type:'output',  width:'100px',    style:'text-align:center;'},
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
			{caption: ["적합여부","적합여부"], 						ref: 'stbltYn',   	type:'output',  width:'100px',    style:'text-align:center;'},
			{caption: ["탈락사유","탈락사유"], 		ref: 'stbltYnNm',   	type:'textarea',  width:'150px',    style:'padding-left:10px'
				,typeinfo : {textareanewline : true},disabled:true },
			{caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
	        {caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
	        {caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
	        //{caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
	        {caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'aprv',   			hidden : true},
	    ];

	    grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
	    /*
	    let rst = await Promise.all([
	    	fn_initSBSelectFclt(),
		    fn_searchFcltList()
		])
		*/
		//grdPrdcrOgnCurntMng.refresh({"combo":true});
	  	//클릭 이벤트 바인드
	    //grdPrdcrOgnCurntMng.bind('click','gridClick');


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
						,corpSeCd: item.corpSeCd
						,stbltYn: item.stbltYn
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
		let yr = SBUxMethod.get("dtl-input-yr");//

    	let postJsonPromise = gfn_postJSON("/pd/isom/selectInvShipOgnGenalTblMngIsoList.do", {
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
			});
        	fn_searchUoList();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	//총괄표 조회
	async function fn_dtlGridSearch() {

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		if(gfn_isEmpty(apoCd)){return;}
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let itemCd = SBUxMethod.get('dtl-input-itemCd');
		let ctgryCd = SBUxMethod.get('dtl-input-ctgryCd');
		let uoBrno = SBUxMethod.get('dtl-input-uoBrno');
		let brno = SBUxMethod.get('dtl-input-brno');
		let yr = SBUxMethod.get('dtl-input-yr');

		if(gfn_isEmpty(uoBrno)){
			alert("통합조직을 선택해 주세요");
			return;
		}

		let postJsonPromise01 = gfn_postJSON("/pd/isom/selectInvShipOgnGenalTblMngList.do", {
			apoCd : apoCd
    		,apoSe : apoSe
    		,itemCd : itemCd
    		,ctgryCd : ctgryCd
    		,uoBrno : uoBrno
    		,brno : brno
    		,yr : yr
		});
        let data = await postJsonPromise01;
        try{
        	jsonPrdcrOgnCurntMng01.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
        		let PrdcrOgnCurntMngVO01 = {
   						apoCd: 	item.apoCd
   						,apoSe: item.apoSe
   						,brno: 	item.brno
   						,crno: 	item.crno
   						,corpNm: item.corpNm
   						,delYn: item.delYn
   						,yr: item.yr

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

   						,stbltYn: 			item.stbltYn
   						,stbltYnNm: fn_calStbltYn(item)
   				};
       			jsonPrdcrOgnCurntMng01.push(PrdcrOgnCurntMngVO01);
			});

        	grdPrdcrOgnCurntMng01.rebuild();

        	let rowData = grdPrdcrOgnCurntMng01.getRowData(2);
			console.log(rowData);
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	//탈락적합 사유
	function fn_calStbltYn(item) {
		let stbltYnNmMng = [];
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
			if(item.chkBB != 'Y'){
				stbltYnNmMng.push('생산자조직 출하금액 중 통합조직 출하비율 미달');
			}
			if(item.chkBC != 'Y'){
				stbltYnNmMng.push('총취급액 중 통합조직 출하비율 미달');
			}
		}
		//console.log(stbltYnNmMng.join("\n"));
		return stbltYnNmMng.join("\n");
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
		SBUxMethod.set('dtl-input-yr',gfn_nvl(rowData.yr))//등록년도

		fn_searchUoList();
    }

	//총괄표 그리드 초기화
	async function fn_clearForm() {
		SBUxMethod.set('dtl-input-apoCd',null)//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',null)//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',null)//법인명
		SBUxMethod.set('dtl-input-crno',null)//법인등록번호
		SBUxMethod.set('dtl-input-brno',null)//사업자등록번호
		SBUxMethod.set('dtl-input-yr',null)//등록년도
		SBUxMethod.set('dtl-input-uoBrno',null)//선택한 통합조직
		SBUxMethod.set('dtl-input-selUoBrno',null)//상위 통합조직 리스트

		jsonPrdcrOgnCurntMng01.length= 0;
		grdPrdcrOgnCurntMng01.rebuild();
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