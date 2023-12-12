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
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 등록결과확인 -->
					<!-- 통합조직관리 매입·매출 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<!--
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
					 -->
				</div>
			</div>
			<div class="box-body">
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
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">검색리스트</span>
							<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
						</li>
					</ul>
				</div>
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng" style="height:350px; width: 100%;"></div>
				</div>
				<br>
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
						<!--
						<sbux-button id="btnSaveFclt1" name="btnSaveFclt1" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
						 -->
					</div>
				</div>
				<table class="table table-bordered tbl_fixed">
					<caption>출하조직 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe"></sbux-input>
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

				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div>
						<p>통합조직 총 매입현황</p>
					</div>
					<div style="margin-left: auto;">
						<sbux-button id="btnSaveFclt2" name="btnSaveFclt2" uitype="normal" text="매입저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave01"></sbux-button>
					</div>
				</div>
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:200px; width: 100%;"></div>
				</div>
				<br>
				<!--[pp] 검색결과 상세보기-->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div>
						<p>통합조직 총 매출현황</p>
					</div>
					<div style="margin-left: auto;">
						<sbux-button id="btnSaveFclt3" name="btnSaveFclt3" uitype="normal" text="매출저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave02"></sbux-button>
					</div>
				</div>
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng02" style="height:200px; width: 100%;"></div>
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
        	style="width:1000px"
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
		fn_init();
		fn_initSBSelect();
		fn_search();

		var now = new Date();
		var year = now.getFullYear();
		SBUxMethod.set("srch-input-yr",year);//

	});

	//출자출하조직 보유 여부
	var selectIsoHldYn = [
		{'text': 'Y','label': 'Y', 'value': '1'},
		{'text': 'N','label': 'N', 'value': '2'}
	];

	var jsonComCmptnInst = [];//관할기관
	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군
	var jsonComCorpSeCd = [];//법인구분
	var jsonComCorpDtlSeCd = [];//법인형태
	var jsonComUoCd = [];//통합조직코드
	var jsonComAprv = [];//신청구분
	var jsonComAplyTrgtSe = [];//신청대상구분
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
			//gfn_setComCdSBSelect('srch-input-sgg', 			jsonComSgg, 	'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			//gfn_setComCdSBSelect('srch-input-uoCd', 		jsonComUoCd, 	'UO_CD'), //통합조직코드
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 	'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분
			//gfn_setComCdSBSelect('dtl-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분

		]);
		console.log("============fn_initSBSelect=====1=======");
	}


	var jsonPrdcrOgnCurntMng = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_fcltMngCreateGrid();
		fn_fcltMngCreateGrid01();
		fn_fcltMngCreateGrid02();
	}

	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid = async function() {



		//SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

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
	    	{caption: ["법인구분"], 		ref: 'corpSeCd',type:'output',  width:'100px',    style:'text-align:center'},
	    	{caption: ["시도"], 			ref: 'ctpv',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
	    		,typeinfo : {ref:'jsonComCtpv', label:'label', value:'value', displayui : false}},
	        {caption: ["시군구"], 		ref: 'sgg',   	type:'combo',  width:'160px',    style:'text-align:center', disabled:true
		    	,typeinfo : {ref:'jsonComSgg', label:'label', value:'value', displayui : false}},
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
	const fn_fcltMngCreateGrid01 = async function() {

		//SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng01';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng01';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng01';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    //SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
	    	{caption: ["품목분류","품목분류"], 	ref: 'ctgryNm',   	type:'output',  width:'80px',    style:'text-align:center'},

	        {caption: ["수탁","물량"], 		ref: 'prchsTrstVlm',   	type:'input',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["수탁","금액"], 		ref: 'prchsTrstAmt',   	type:'input',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["매취","물량"], 		ref: 'prchsEmspapVlm',   type:'input',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["매취","금액"], 		ref: 'prchsEmspapAmt',   type:'input',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["합계","물량"], 		ref: 'prchsTotVlm',   		type:'output',  width:'90px',    style:'text-align:center', calc : 'fn_prchsVlmSum'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["합계","금액"], 		ref: 'prchsTotAmt',   		type:'output',  width:'100px',    style:'text-align:center', calc : 'fn_prchsAmtSum'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["처리","처리"], 		ref: 'delYn',   		type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	        {caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
	        {caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
	    	{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
	    	{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'brno',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	    ];

	    grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
	    grdPrdcrOgnCurntMng01.bind('click','gridClick01');
	    grdPrdcrOgnCurntMng01.bind('afteredit','fn_AfterEdit01');
	}

	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh01 = [
		  'prchsTrstVlm', 'prchsTrstAmt', 'prchsEmspapVlm', 'prchsEmspapAmt'
		];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_AfterEdit01(){
		let prevCol = grdPrdcrOgnCurntMng01.getPrevCol();
		let prevRef = grdPrdcrOgnCurntMng01.getRefOfCol(prevCol);
	    if(columnsToRefresh01.includes(prevRef)){
	    	grdPrdcrOgnCurntMng01.refresh();
	    }
	}

	var jsonPrdcrOgnCurntMng02 = []; // 그리드의 참조 데이터 주소 선언
	var grdPrdcrOgnCurntMng02;


	/* Grid 화면 그리기 기능*/
	const fn_fcltMngCreateGrid02 = async function() {

		//SBUxMethod.set("fclt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng02';
	    SBGridProperties.id = 'grdPrdcrOgnCurntMng02';
	    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng02';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    //SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
	    	{caption: ["품목분류","품목분류"], 	ref: 'ctgryNm',   	type:'output',  width:'80px',    style:'text-align:center'},

	    	{caption: ["공선수탁","공선수탁","물량"], 		ref: 'slsCprtnSortTrstVlm',   	type:'input',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["공선수탁","공선수탁","금액"], 		ref: 'slsCprtnSortTrstAmt',   	type:'output',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	    	{caption: ["공동수탁","공동수탁","물량"], 		ref: 'slsCprtnTrstVlm',   	type:'output',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["공동수탁","공동수탁","금액"], 		ref: 'slsCprtnTrstAmt',   	type:'output',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["공선매취","공선매취","물량"], 		ref: 'slsCprtnSortEmspapVlm',   	type:'output',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["공선매취","공선매취","금액"], 		ref: 'slsCprtnSortEmspapAmt',   	type:'output',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

	    	{caption: ["단순수탁","단순수탁","물량"], 		ref: 'slsSmplTrstVlm',   	type:'input',  width:'90px',    style:'text-align:center'
		    	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		    {caption: ["단순수탁","단순수탁","금액"], 		ref: 'slsSmplTrstAmt',		type:'input',  width:'100px',    style:'text-align:center'
		    	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		    {caption: ["단순매취","단순매취","물량"], 		ref: 'slsSmplEmspapVlm',	type:'input',  width:'90px',    style:'text-align:center'
		    	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		    {caption: ["단순매취","단순매취","금액"], 		ref: 'slsSmplEmspapAmt',	type:'input',  width:'100px',    style:'text-align:center'
		    	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

	        {caption: ["수탁","물량"], 		ref: 'slsEmspapVlm',   	type:'input',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["수탁","금액"], 		ref: 'slsEmspapAmt',   	type:'input',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["매취","물량"], 		ref: 'slsTrstVlm',   type:'input',  width:'90px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["매취","금액"], 		ref: 'slsTrstAmt',   type:'input',  width:'100px',    style:'text-align:center'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["합계","물량"], 		ref: 'slsTotVlm',   		type:'output',  width:'90px',    style:'text-align:center' , calc : 'fn_slsVlmSum'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["합계","금액"], 		ref: 'slsTotAmt',   		type:'output',  width:'100px',    style:'text-align:center', calc : 'fn_slsAmtSum'
	    		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
	        {caption: ["처리","처리"], 		ref: 'delYn',   		type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\" , \"grdPrdcrOgnCurntMng02\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\" , \"grdPrdcrOgnCurntMng02\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	        {caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
	        {caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
	    	{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
	    	{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'brno',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	    ];

	    grdPrdcrOgnCurntMng02 = _SBGrid.create(SBGridProperties);
	    grdPrdcrOgnCurntMng02.bind('click','gridClick02');
	    grdPrdcrOgnCurntMng02.bind('afteredit','fn_AfterEdit02');
	}
	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_AfterEdit02(){
	    if(grdPrdcrOgnCurntMng02.getPrevCol() == grdPrdcrOgnCurntMng02.getColRef('slsEmspapVlm')
	    		|| grdPrdcrOgnCurntMng02.getPrevCol() == grdPrdcrOgnCurntMng02.getColRef('slsTrstVlm')
	    		|| grdPrdcrOgnCurntMng02.getPrevCol() == grdPrdcrOgnCurntMng02.getColRef('slsCprtnSortTrstVlm')
	    		|| grdPrdcrOgnCurntMng02.getPrevCol() == grdPrdcrOgnCurntMng02.getColRef('slsCprtnTrstVlm')
	    		|| grdPrdcrOgnCurntMng02.getPrevCol() == grdPrdcrOgnCurntMng02.getColRef('slsCprtnSortEmspapVlm')
	    		|| grdPrdcrOgnCurntMng02.getPrevCol() == grdPrdcrOgnCurntMng02.getColRef('slsEmspapAmt')
	    		|| grdPrdcrOgnCurntMng02.getPrevCol() == grdPrdcrOgnCurntMng02.getColRef('slsTrstAmt')
	    		|| grdPrdcrOgnCurntMng02.getPrevCol() == grdPrdcrOgnCurntMng02.getColRef('slsCprtnSortTrstAmt')
	    		|| grdPrdcrOgnCurntMng02.getPrevCol() == grdPrdcrOgnCurntMng02.getColRef('slsCprtnTrstAmt')
	    		|| grdPrdcrOgnCurntMng02.getPrevCol() == grdPrdcrOgnCurntMng02.getColRef('slsCprtnSortEmspapAmt')
	    	){
	    	grdPrdcrOgnCurntMng02.refresh();
	    }
	}

	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh02 = [
		  'slsEmspapVlm', 'slsTrstVlm', 'slsCprtnSortTrstVlm', 'slsCprtnTrstVlm', 'slsCprtnSortEmspapVlm',
		  'slsEmspapAmt', 'slsTrstAmt', 'slsCprtnSortTrstAmt', 'slsCprtnTrstAmt', 'slsCprtnSortEmspapAmt',
		  'slsSmplTrstVlm', 'slsSmplTrstAmt', 'slsSmplEmspapVlm', 'slsSmplEmspapAmt'
		];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_AfterEdit02(){
		let prevCol = grdPrdcrOgnCurntMng02.getPrevCol();
		let prevRef = grdPrdcrOgnCurntMng02.getRefOfCol(prevCol);
	    if(columnsToRefresh02.includes(prevRef)){
	    	grdPrdcrOgnCurntMng02.refresh();
	    }
	}


	//그리드 매입 물량 합계 함수
	function fn_prchsVlmSum(objGrid, nRow, nCol) {
		var strSum
		var delYn = objGrid.getData(Number(nRow), objGrid.getColRef('delYn'));
		if(delYn == 'N'){
		    var value01 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('prchsTrstVlm')));
		    var value02 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('prchsEmspapVlm')));
		    strSum = (value01 + value02).toString();
		}
	    return strSum;
	}
	//그리드 매입 금액 합계 함수
	function fn_prchsAmtSum(objGrid, nRow, nCol) {
		var strSum;
		var delYn = objGrid.getData(Number(nRow), objGrid.getColRef('delYn'));
		if(delYn == 'N'){
		    var value01 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('prchsTrstAmt')));
		    var value02 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('prchsEmspapAmt')));
		    strSum = (value01 + value02).toString();
		}
	    return strSum;
	}
	//그리드 매출 물량 합계 함수
	function fn_slsVlmSum(objGrid, nRow, nCol) {
		var strSum;
		var delYn = objGrid.getData(Number(nRow), objGrid.getColRef('delYn'));
		if(delYn == 'N'){
		    var value01 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('slsEmspapVlm')));
		    var value02 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('slsTrstVlm')));

		    var value03 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('slsCprtnSortTrstVlm')));
		    var value04 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('slsCprtnTrstVlm')));
		    var value05 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('slsCprtnSortEmspapVlm')));
		    strSum = (value01 + value02 + value03 + value04 + value05).toString();
		}
	    return strSum;
	}
	//그리드 매출 금액 합계 함수
	function fn_slsAmtSum(objGrid, nRow, nCol) {
		var strSum;
		var delYn = objGrid.getData(Number(nRow), objGrid.getColRef('delYn'));
		if(delYn == 'N'){
		    var value01 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('slsEmspapAmt')));
		    var value02 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('slsTrstAmt')));

		    var value03 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('slsCprtnSortTrstAmt')));
		    var value04 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('slsCprtnTrstAmt')));
		    var value05 = Number(objGrid.getData(Number(nRow), objGrid.getColRef('slsCprtnSortEmspapAmt')));
		    strSum = (value01 + value02 + value03 + value04 + value05).toString();
		}
	    return strSum;
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
						,yr:'2023'
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

	//매입 다중 세이브
	const fn_listSave01 = async function(){

		let gridData01 = grdPrdcrOgnCurntMng01.getGridDataAll();
		let saveList = [];

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let crno = SBUxMethod.get('dtl-input-crno');
		let brno = SBUxMethod.get('dtl-input-brno');

		for(var i=1; i<=gridData01.length; i++ ){
			let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);
			let rowSts01 = grdPrdcrOgnCurntMng01.getRowStatus(i);

			let delYn = rowData01.delYn;
			if(delYn == 'N'){

				if(gfn_isEmpty(rowData01.apoCd)){
					rowData01.apoCd = apoCd;
					rowData01.apoSe = apoSe;
					rowData01.crno = crno;
					rowData01.brno = brno;
					rowData01.yr = '2023';
				}

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
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/isom/multiSavePrdcrCrclOgnPurSalMngList01.do", saveList);
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

		for(var i=1; i<=gridData02.length; i++ ){
			let rowData02 = grdPrdcrOgnCurntMng02.getRowData(i);
			let rowSts02 = grdPrdcrOgnCurntMng02.getRowStatus(i);
			let delYn = rowData02.delYn;

			if(delYn == 'N'){
				if(gfn_isEmpty(rowData02.apoCd)){
					rowData02.apoCd = apoCd;
					rowData02.apoSe = apoSe;
					rowData02.crno = crno;
					rowData02.brno = brno;
					rowData02.yr = '2023';
				}

				if (rowSts02 === 3){
					rowData02.rowSts = "I";
					saveList.push(rowData02);
				} else if (rowSts02 === 2){
					rowData02.rowSts = "I";
					saveList.push(rowData02);
				} else if (rowSts02 === 1){
					rowData02.rowSts = "I";
					saveList.push(rowData02);
				} else {
					continue;
				}
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/pd/isom/multiSavePrdcrCrclOgnPurSalMngList02.do", saveList);
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
            	//grdPrdcrOgnCurntMng01.setCellData(nRow, nCol, "N", true);
            	//console.log(nRow);
            	grdPrdcrOgnCurntMng01.setCellData(nRow, grdPrdcrOgnCurntMng01.getColRef("delYn"), "N", true);
            	//grdPrdcrOgnCurntMng02.setCellData(nRow, grdPrdcrOgnCurntMng02.getColRef("delYn"), "N", true);
            	grdPrdcrOgnCurntMng01.addRow(true);
            	//grdPrdcrOgnCurntMng02.addRow(true);
            }

            if (grid === "grdPrdcrOgnCurntMng02") {
            	//grdPrdcrOgnCurntMng01.setCellData(nRow, nCol, "N", true);
            	//console.log(nRow);
            	//grdPrdcrOgnCurntMng01.setCellData(nRow, grdPrdcrOgnCurntMng01.getColRef("delYn"), "N", true);
            	grdPrdcrOgnCurntMng02.setCellData(nRow, grdPrdcrOgnCurntMng02.getColRef("delYn"), "N", true);
            	//grdPrdcrOgnCurntMng01.addRow(true);
            	grdPrdcrOgnCurntMng02.addRow(true);
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
            			//grdPrdcrOgnCurntMng02.deleteRow(nRow);
            		}
            	}else{
            		grdPrdcrOgnCurntMng01.deleteRow(nRow);
            		//grdPrdcrOgnCurntMng02.deleteRow(nRow);
            	}
            }
            if (grid === "grdPrdcrOgnCurntMng02") {
            	if(grdPrdcrOgnCurntMng02.getRowStatus(nRow) == 0 || grdPrdcrOgnCurntMng02.getRowStatus(nRow) == 2){
            		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
            		if(confirm(delMsg)){
            			var rowVal = grdPrdcrOgnCurntMng02.getRowData(nRow);
            			fn_deleteRsrc(rowVal);
            			//grdPrdcrOgnCurntMng01.deleteRow(nRow);
            			grdPrdcrOgnCurntMng02.deleteRow(nRow);
            		}
            	}else{
            		//grdPrdcrOgnCurntMng01.deleteRow(nRow);
            		grdPrdcrOgnCurntMng02.deleteRow(nRow);
            	}
            }
        }
    }

	//품목 리스트 삭제
	async function fn_deleteRsrc(vo){

		if(true)return;

		let postJsonPromise = gfn_postJSON("/pd/pcom/deletePrdcrCrclOgnPurSalMng.do", vo);
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

		SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd))//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno))//사업자등록번호
		fn_clearForm();
    }
	//매입 매출 그리드 초기화
	async function fn_clearForm() {
		jsonPrdcrOgnCurntMng01.length= 0;
		grdPrdcrOgnCurntMng01.rebuild();
		jsonPrdcrOgnCurntMng02.length= 0;
		grdPrdcrOgnCurntMng02.rebuild();
	}


	//통합조직 매입 매출 리스트 조회
	async function fn_dtlGridSearch() {

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		if(gfn_isEmpty(apoCd)){return;}
		let apoSe = SBUxMethod.get('dtl-input-apoSe');
		let itemCd = SBUxMethod.get('dtl-input-itemCd');
		let ctgryCd = SBUxMethod.get('dtl-input-ctgryCd');

		let postJsonPromise01 = gfn_postJSON("/pd/pcom/selectPrdcrCrclOgnPurSalMngList.do", {
			apoCd : apoCd
    		,apoSe : apoSe
    		,itemCd : itemCd
    		,ctgryCd : ctgryCd
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

    						,ctgryCd: 		item.ctgryCd
    						,itemCd: 		item.itemCd
    						,ctgryNm: 		item.ctgryNm
    						,itemNm: 		item.itemNm
    						,prchsSlsSe: 	item.prchsSlsSe

    						,prchsTrstVlm: 		item.prchsTrstVlm
    						,prchsTrstAmt: 		item.prchsTrstAmt
    						,prchsEmspapVlm: 	item.prchsEmspapVlm
    						,prchsEmspapAmt: 	item.prchsEmspapAmt
    				};
        			jsonPrdcrOgnCurntMng01.push(PrdcrOgnCurntMngVO01);
        		}else if(item.prchsSlsSe == '2'){
    				let PrdcrOgnCurntMngVO02 = {
    						apoCd: 	item.apoCd
    						,apoSe: item.apoSe
    						,brno: 	item.brno
    						,crno: 	item.crno
    						,delYn: item.delYn

    						,ctgryCd: 		item.ctgryCd
    						,itemCd: 		item.itemCd
    						,ctgryNm: 		item.ctgryNm
    						,itemNm: 		item.itemNm
    						,prchsSlsSe: 		item.prchsSlsSe

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
    				};
    				jsonPrdcrOgnCurntMng02.push(PrdcrOgnCurntMngVO02);
        		}
			});

        	grdPrdcrOgnCurntMng01.rebuild();
        	grdPrdcrOgnCurntMng02.rebuild();

        	//비어 있는 마지막 줄 추가용도?
        	grdPrdcrOgnCurntMng01.addRow();
        	grdPrdcrOgnCurntMng02.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	//품목 팝업
	const fn_choiceGpcList = function() {
		popGpcSelect.init(fn_setGpcList);
	}
	//품목 팝업 콜백함수
	const fn_setGpcList = function(rowData) {
		if (!gfn_isEmpty(rowData)) {
			SBUxMethod.set("dtl-input-itemNm", rowData.itemNm);//
			SBUxMethod.set("dtl-input-itemCd", rowData.itemCd);//
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
        let ctgryNmCol = grdPrdcrOgnCurntMng01.getColRef('ctgryNm');
        let itemNmCol = grdPrdcrOgnCurntMng01.getColRef('itemNm');

        if(selGridRow01 == '-1'){
			return;
        } else {
        	//선택한 데이터가 통합조직 일떄
        	if (selGridCol01 == ctgryNmCol || selGridCol01 == itemNmCol){
        		//팝업창 오픈
        		//통합조직 팝업창 id : modal-gpcList
        		popGpcSelect.init(fn_setGridItem01);
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

			//let colRefIdx1 = grdPrdcrOgnCurntMng01.getColRef("ctgryCd");//분류코드 인덱스
			//let colRefIdx2 = grdPrdcrOgnCurntMng01.getColRef("ctgryNm");//분류명 인덱스
			//let colRefIdx3 = grdPrdcrOgnCurntMng01.getColRef("itemCd");//품목코드 인덱스
			//let colRefIdx4 = grdPrdcrOgnCurntMng01.getColRef("itemNm");//품목명 인덱스

			//그리드 값 세팅
			//grdPrdcrOgnCurntMng01.setCellData(selGridRow01,colRefIdx1,rowData.ctgryCd,true);
			//grdPrdcrOgnCurntMng01.setCellData(selGridRow01,colRefIdx2,rowData.ctgryNm,true);
			//grdPrdcrOgnCurntMng01.setCellData(selGridRow01,colRefIdx3,rowData.itemCd,true);
			//grdPrdcrOgnCurntMng01.setCellData(selGridRow01,colRefIdx4,rowData.itemNm,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow01,grdPrdcrOgnCurntMng01.getColRef("ctgryCd"),rowData.ctgryCd,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow01,grdPrdcrOgnCurntMng01.getColRef("ctgryNm"),rowData.ctgryNm,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow01,grdPrdcrOgnCurntMng01.getColRef("itemCd"),rowData.itemCd,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow01,grdPrdcrOgnCurntMng01.getColRef("itemNm"),rowData.itemNm,true);
			/*
			grdPrdcrOgnCurntMng02.setCellData(selGridRow01,grdPrdcrOgnCurntMng02.getColRef("ctgryCd"),rowData.ctgryCd,true);
			grdPrdcrOgnCurntMng02.setCellData(selGridRow01,grdPrdcrOgnCurntMng02.getColRef("ctgryNm"),rowData.ctgryNm,true);
			grdPrdcrOgnCurntMng02.setCellData(selGridRow01,grdPrdcrOgnCurntMng02.getColRef("itemCd"),rowData.itemCd,true);
			grdPrdcrOgnCurntMng02.setCellData(selGridRow01,grdPrdcrOgnCurntMng02.getColRef("itemNm"),rowData.itemNm,true);
			*/
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
        let ctgryNmCol = grdPrdcrOgnCurntMng02.getColRef('ctgryNm');
        let itemNmCol = grdPrdcrOgnCurntMng02.getColRef('itemNm');

        if(selGridRow02 == '-1'){
			return;
        } else {
        	//선택한 데이터가 통합조직 일떄
        	if (selGridCol02 == ctgryNmCol || selGridCol02 == itemNmCol){
        		//팝업창 오픈
        		//통합조직 팝업창 id : modal-gpcList
        		popGpcSelect.init(fn_setGridItem02);
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

			//그리드 값 세팅
			/*
			grdPrdcrOgnCurntMng01.setCellData(selGridRow02,grdPrdcrOgnCurntMng01.getColRef("ctgryCd"),rowData.ctgryCd,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow02,grdPrdcrOgnCurntMng01.getColRef("ctgryNm"),rowData.ctgryNm,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow02,grdPrdcrOgnCurntMng01.getColRef("itemCd"),rowData.itemCd,true);
			grdPrdcrOgnCurntMng01.setCellData(selGridRow02,grdPrdcrOgnCurntMng01.getColRef("itemNm"),rowData.itemNm,true);
			*/
			grdPrdcrOgnCurntMng02.setCellData(selGridRow02,grdPrdcrOgnCurntMng02.getColRef("ctgryCd"),rowData.ctgryCd,true);
			grdPrdcrOgnCurntMng02.setCellData(selGridRow02,grdPrdcrOgnCurntMng02.getColRef("ctgryNm"),rowData.ctgryNm,true);
			grdPrdcrOgnCurntMng02.setCellData(selGridRow02,grdPrdcrOgnCurntMng02.getColRef("itemCd"),rowData.itemCd,true);
			grdPrdcrOgnCurntMng02.setCellData(selGridRow02,grdPrdcrOgnCurntMng02.getColRef("itemNm"),rowData.itemNm,true);

		}
	}




</script>
</html>
