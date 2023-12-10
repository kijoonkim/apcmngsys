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
					<!-- 생산출하실적 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveFmList"></sbux-button>
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
				<!-- 생산자 조직 리스트 -->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch01"></sbux-button>
					</div>
				</div>
				<table class="table table-bordered tbl_fixed">
					<caption>출하조직 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-crno" name="dtl-input-crno"></sbux-input>
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
							<td colspan="5" class="td_input"  style="border-left: hidden;">
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<!--[pp] 검색결과 상세보기-->
				<!-- 생산자조직 리스트 그리드 -->
				<div>
					<p>생산자조직 리스트</p>
				</div>
				<div class="ad_section_top">
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrdcrOgnCurntMng01" style="height:200px; width: 100%;"></div>
				</div>

				<br>
				<!-- 농가 리스트 -->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSearchFclt2" name="btnSearchFclt2" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch02"></sbux-button>
						<sbux-button id="btnSaveFclt2" name="btnSaveFclt2" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
					</div>
				</div>
				<table class="table table-bordered tbl_fixed">
					<caption>출하조직 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">생산자조직 명</th>
							<sbux-input uitype="hidden" id="dtl-input-apoCd01" name="dtl-input-apoCd01"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-apoSe01" name="dtl-input-apoSe01"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-brno01" name="dtl-input-brno01"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-crno01" name="dtl-input-crno01"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-prdcrOgnzSn" name="dtl-input-prdcrOgnzSn"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-prdcrOgnzCd" name="dtl-input-prdcrOgnzCd"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-sttgUpbrItemSe" name="dtl-input-sttgUpbrItemSe"></sbux-input>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-prdcrOgnzNm"
									name="dtl-input-prdcrOgnzNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							<th scope="row" class="th_bg th_border_right">품목</th>
							<sbux-input uitype="hidden" id="dtl-input-itemCd" name="dtl-input-itemCd"></sbux-input>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-itemNm"
									name="dtl-input-itemNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
								<!--
								<sbux-button id="srch-btn-gpcList" name="srch-btn-gpcList" uitype="modal" target-id="modal-gpcList" onclick="fn_choiceGpcList" text="품목찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								 -->
							</td>
							<th scope="row" class="th_bg th_border_right">취급유형</th>
							<td colspan="2" class="td_input">
								<sbux-select
									id="dtl-input-trmtType"
									name="dtl-input-trmtType"
									uitype="single"
									jsondata-ref="jsonComTrmtType"
									unselected-text="전체"
									class="form-control input-sm"
									readonly
								></sbux-select>
							</td>
							<td class="td_input"  style="border-left: hidden;">
						</tr>
					</tbody>
				</table>
				<br>
				<!--[pp] 검색결과 상세보기-->
				<!-- 농가 리스트 그리드 -->
				<div>
					<p>농가 리스트</p>
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
	//품목구분 전문/육성
	var jsonBb = [
		{'text': '전문품목','label': '전문품목', 'value': '1'},
		{'text': '육성품목','label': '육성품목', 'value': '2'}
	];

	var jsonComCmptnInst = [];//관할기관
	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군
	var jsonComCorpSeCd = [];//법인구분
	var jsonComCorpDtlSeCd = [];//법인형태
	var jsonComUoCd = [];//통합조직코드
	var jsonComAprv = [];//신청구분
	var jsonComAplyTrgtSe = [];//신청대상구분
	var jsonComTrmtType = [];//취급유형
	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		console.log("============fn_initSBSelect============");
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			gfn_setComCdSBSelect('srch-input-cmptnInst', 	jsonComCmptnInst, 	'CMPTNC_INST'), //관할기관
			gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 		'CMPTN_INST_CTPV'), //시도
			//gfn_setComCdSBSelect('srch-input-sgg', 			jsonComSgg, 	'CMPTN_INST_SIGUN'),//시군
			gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
			gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
			//gfn_setComCdSBSelect('srch-input-uoCd', 		jsonComUoCd, 	'UO_CD'), //통합조직코드
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 		'APRV_UPBR_SE_CD'), //신청구분
			gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분
			gfn_setComCdSBSelect('dtl-input-trmtType', 		jsonComTrmtType, 	'TRMT_TYPE'), //신청대상구분

		]);
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
	    //SBGridProperties.extendlastcol = 'scroll';
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
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
	    SBGridProperties.oneclickedit = false;//입력 활성화 true 1번클릭 false 더블클릭
	    SBGridProperties.columns = [
	    	{caption: ["순번"], 			ref: 'prdcrOgnzSn',   	type:'output',  width:'80px',    style:'text-align:center'},
	    	{caption: ["생산자조직 명"], 	ref: 'prdcrOgnzNm',   	type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["생산자조직 코드"], 	ref: 'prdcrOgnzCd',   	type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["품종"], 			ref: 'itemNm',   	type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["분류"], 			ref: 'ctgryNm',   	type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["취급유형"], 		ref: 'trmtType',   	type:'combo',  width:'150px',    style:'text-align:center', disabled:true
			    		,typeinfo : {ref:'jsonComTrmtType', label:'label', value:'value', displayui : false}},
			{caption: ["전문/육성 구분"], 	ref: 'sttgUpbrItemSe',   type:'combo',  width:'150px',    style:'text-align:center', disabled:true
				    	,typeinfo : {ref:'jsonBb', label:'label', value:'value', displayui : false}},
	        {caption: ["비고"], 			ref: 'rmrk',   		type:'output',  width:'220px',    style:'text-align:center'},
	        /*
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow01(\"ADD\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow01(\"DEL\" , \"grdPrdcrOgnCurntMng01\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	        */
	        {caption: ["상세내역"], 	ref: 'delYn',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'yr',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
	    	{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
	    	{caption: ["상세내역"], 	ref: 'ctgryCd',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'brno',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	    ];

	    grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);

	    grdPrdcrOgnCurntMng01.bind('click','fn_view01');
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
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
	    SBGridProperties.columns = [
	    	{caption: ["순번"], 			ref: 'cltvtnLandSn',   	type:'output',  width:'60px',    style:'text-align:center'},
	    	{caption: ["조직원명"], 		ref: 'flnm',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["재배지 주소"], 	ref: 'cltvtnLandAddr',   	type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["품목"], 			ref: 'itemNm',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["재배면적(㎡)"], 	ref: 'cltvtnArea',   	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["생산량(결과)(톤)"], ref: 'prdctnVlm',   	type:'input',  width:'140px',    style:'text-align:center'},
	        {caption: ["전속출하량(결과)(톤)"], ref: 'ecSpmtVlm',   	type:'input',  width:'140px',    style:'text-align:center'},
	        {caption: ["출하대금 지급액(천원)"], ref: 'spmtPrc',   	type:'input',  width:'140px',    style:'text-align:center'},
	        {caption: ["가입일"], 		ref: 'joinDay',  	type:'datepicker',  width:'110px',    style:'text-align:center', disabled:true
	        	,typeinfo : {locale : 'ko' , dateformat :'yymmdd'}, format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd' }},
	        {caption: ["탈퇴일"], 		ref: 'whdwlDay',  	type:'datepicker',  width:'110px',    style:'text-align:center', disabled:true
	        	,typeinfo : {locale : 'ko' , dateformat :'yymmdd'}, format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd' }},
	        {caption: ["비고"], 			ref: 'spmtRmrk',   	type:'input',  width:'220px',    style:'text-align:center'},
	        /*
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow02(\"ADD\" , \"grdPrdcrOgnCurntMng02\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow02(\"DEL\" , \"grdPrdcrOgnCurntMng02\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
	        */
	        {caption: ["상세내역"], 	ref: 'delYn',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'yr',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'prdcrOgnzSn',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'prdcrOgnzCd',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'prdcrOgnzNm',   	hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
	    	{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
	    	{caption: ["상세내역"], 	ref: 'trmtType',	hidden : true},
	        {caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'brno',		hidden : true},
	        {caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	    ];

	    grdPrdcrOgnCurntMng02 = _SBGrid.create(SBGridProperties);

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

	//생산자조직 리스트 조회
	async function fn_dtlGridSearch01() {

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		if(gfn_isEmpty(apoCd)){return;}


		let postJsonPromise01 = gfn_postJSON("/pd/pom/selectTbEvFrmhsApoList.do", {
			apoCd : apoCd
		});
        let data = await postJsonPromise01;
        try{
        	jsonPrdcrOgnCurntMng01.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
        		console.log(item);
				let itemVO = {
						apoCd: 	item.apoCd
						,apoSe: item.apoSe
						,brno: 	item.brno
						,crno: 	item.crno

						,delYn: item.delYn

						,yr:item.yr
						,sttgUpbrItemSe: item.sttgUpbrItemSe
						,ctgryCd: 		item.ctgryCd
						,ctgryNm: 		item.ctgryNm
						,itemCd: 		item.itemCd
						,itemNm: 		item.itemNm
						,trmtType: 		item.trmtType

						,prdcrOgnzSn: 	item.prdcrOgnzSn
						,prdcrOgnzCd: 	item.prdcrOgnzCd
						,prdcrOgnzNm: 	item.prdcrOgnzNm
						,rmrk: 			item.rmrk
				}

				jsonPrdcrOgnCurntMng01.push(itemVO);
			});

        	grdPrdcrOgnCurntMng01.rebuild();

        	//입력 그리드 인 경우 추가
        	//grdPrdcrOgnCurntMng01.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	//농가리스트 리스트 조회
	async function fn_dtlGridSearch02() {

		let apoCd = SBUxMethod.get('dtl-input-apoCd');
		if(gfn_isEmpty(apoCd)){return;}

		let prdcrOgnzSn = SBUxMethod.get('dtl-input-prdcrOgnzSn');
		//let itemCd = SBUxMethod.get('dtl-input-itemCd');
		//let trmtType = SBUxMethod.get('dtl-input-trmtType');

		let postJsonPromise02 = gfn_postJSON("/pd/pom/selectPrdcrOgnPrdShipRsltMngDtlList.do", {
			apoCd : apoCd
    		,prdcrOgnzSn : prdcrOgnzSn
		});
        let data = await postJsonPromise02;
        try{
        	jsonPrdcrOgnCurntMng02.length = 0;
        	console.log("data==="+data);
        	data.resultList.forEach((item, index) => {
				let PrdcrOgnCurntMngVO = {
						apoCd: 	item.apoCd
						,apoSe: item.apoSe
						,brno: 	item.brno
						,crno: 	item.crno

						,prdcrOgnzSn: 	item.prdcrOgnzSn
						,prdcrOgnzCd: 	item.prdcrOgnzCd
						,prdcrOgnzNm: 	item.prdcrOgnzNm
						,sttgUpbrItemSe: item.sttgUpbrItemSe
						,ctgryCd: 		item.ctgryCd
						,itemCd: 		item.itemCd
						,trmtType: 		item.trmtType
						,yr: 			item.yr
						,delYn: 			item.delYn

						,cltvtnLandSn: 		item.cltvtnLandSn
						,flnm: 				item.flnm
						,cltvtnLandAddr: 	item.cltvtnLandAddr

						,joinDay: 			item.joinDay
						,whdwlDay: 			item.whdwlDay
						,cltvtnArea: 		item.cltvtnArea

						,prdctnVlm: 		item.prdctnVlm
						,ecSpmtVlm: 		item.ecSpmtVlm
						,spmtPrc: 			item.spmtPrc
						,spmtRmrk: 			item.spmtRmrk
				}
				jsonPrdcrOgnCurntMng02.push(PrdcrOgnCurntMngVO);
			});

        	grdPrdcrOgnCurntMng02.rebuild();

        	//입력폼 추가를 위한 줄추가
        	//grdPrdcrOgnCurntMng02.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	//다중 세이브
	const fn_listSave = async function(){

		console.log("===============fn_saveFmList02=================");
		let gridData = grdPrdcrOgnCurntMng02.getGridDataAll();
		let saveList = [];


		//추후 문제가 생길 여지가 있어
		//test dtl 부분이 변경될떄 클리어폼 한번해 줄필요가 있슴
		let apoCd = SBUxMethod.get('dtl-input-apoCd01');
		let apoSe = SBUxMethod.get('dtl-input-apoSe01');
		let crno = SBUxMethod.get('dtl-input-crno01');
		let brno = SBUxMethod.get('dtl-input-brno01');
		let itemCd = SBUxMethod.get('dtl-input-itemCd');
		let trmtType = SBUxMethod.get('dtl-input-trmtType');
		let sttgUpbrItemSe = SBUxMethod.get('dtl-input-sttgUpbrItemSe');
		let prdcrOgnzSn = SBUxMethod.get('dtl-input-prdcrOgnzSn');
		let prdcrOgnzCd = SBUxMethod.get('dtl-input-prdcrOgnzCd');
		let prdcrOgnzNm = SBUxMethod.get('dtl-input-prdcrOgnzNm');
		let yr = SBUxMethod.get('dtl-input-yr');
		//let prdcrOgnzCd = SBUxMethod.get('dtl-input-prdcrOgnzCd');

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdPrdcrOgnCurntMng02.getRowData(i);
			let rowSts = grdPrdcrOgnCurntMng02.getRowStatus(i);
			let delYn = rowData.delYn;

			if(delYn == 'N'){

				if(gfn_isEmpty(rowData.apoCd)){
					//서브쿼리로 데이터 넣는 방식으로 변경해도 됨
					rowData.apoCd = apoCd;
					rowData.apoSe = apoSe;
					rowData.crno = crno;
					rowData.brno = brno;
					rowData.itemCd = itemCd;
					rowData.trmtType = trmtType;
					rowData.prdcrOgnzSn = prdcrOgnzSn;
					rowData.prdcrOgnzCd = prdcrOgnzCd;
					rowData.prdcrOgnzNm = prdcrOgnzNm;
					rowData.sttgUpbrItemSe = sttgUpbrItemSe;
					rowData.yr = '2023';//test
				}

				if (rowSts === 3){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 1){
					rowData.rowSts = "I";
					saveList.push(rowData);
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

			let postJsonPromise = gfn_postJSON("/pd/pom/multiSavePrdcrOgnPrdShipRsltMngList.do", saveList);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_dtlGridSearch02();
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
    }

	//생산자조직 리스트 그리드 상세
	const fn_view01 = async function(){
		console.log("******************fn_view01**********************************");

	    //데이터가 존재하는 그리드 범위 확인
		var nCol = grdPrdcrOgnCurntMng01.getCol();
	    if (nCol < 1) {
	        return;
	    }
	    var nRow = grdPrdcrOgnCurntMng01.getRow();
		if (nRow < 1) {
	        return;
		}
		if(nRow == null){
			nRow = 1;
		}

		let rowData = grdPrdcrOgnCurntMng01.getRowData(nRow);
		console.log(rowData.delYn);
		/*
		if(gfn_isEmpty(rowData.delYn)){
			return;
		}
		*/

		SBUxMethod.set('dtl-input-apoCd01',gfn_nvl(rowData.apoCd))//통합조직 코드
		SBUxMethod.set('dtl-input-apoSe01',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-input-crno01',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-input-brno01',gfn_nvl(rowData.brno))//사업자등록번호
		SBUxMethod.set('dtl-input-prdcrOgnzSn',gfn_nvl(rowData.prdcrOgnzSn))//생산자조직 순번
		SBUxMethod.set('dtl-input-prdcrOgnzNm',gfn_nvl(rowData.prdcrOgnzNm))//생산자조직 명
		SBUxMethod.set('dtl-input-prdcrOgnzCd',gfn_nvl(rowData.prdcrOgnzCd))//생산자조직 코드
		SBUxMethod.set('dtl-input-itemCd',gfn_nvl(rowData.itemCd))//품목 코드
		SBUxMethod.set('dtl-input-itemNm',gfn_nvl(rowData.itemNm))//품목명
		SBUxMethod.set('dtl-input-trmtType',gfn_nvl(rowData.trmtType))//취급유형
		SBUxMethod.set('dtl-input-sttgUpbrItemSe',gfn_nvl(rowData.sttgUpbrItemSe))//품목구분 전문/육성

		fn_clearForm();
    }
	//농가 리스트 그리드 초기화
	async function fn_clearForm() {
		jsonPrdcrOgnCurntMng02.length= 0;
		grdPrdcrOgnCurntMng02.rebuild();
	}



</script>
</html>
