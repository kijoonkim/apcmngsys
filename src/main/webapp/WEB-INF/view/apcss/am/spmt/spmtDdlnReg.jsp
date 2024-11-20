<%
 /**
  * @Class Name : spmtDdlnReg.jsp
  * @Description : 생산속보(지우)
  * @author SI개발부
  * @since 2024.11.15
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.11.15   	박승진			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 출고마감 등록(지우)</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
	<style>
		.displayFlex > .sbux-pik-wrap {
			display: flex;
			gap: 10px;
		}

		#dhtyJobTab, #jobCnTab, #mrktAnls, #invntrSttn1, #invntrSttn2, #wrhsSttn{
			padding:0px
		}
	</style>

</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 거래명세표 등록 -->
					<sbux-label id="lbl-wrhsno" name="lbl-wrhsno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">


					<sbux-button
						id="btnReset"
						name="btnReset"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_reset"
						text="초기화"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"

						text="조회"
					></sbux-button>
				</div>
			</div>
			<div class="box-body" style="padding-bottom: 0px;">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->

				<table id="rawMtrWrhsTable" class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">

						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>기준일자</th>
							<td colspan="24" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									uitype="range"
									id="srch-dtp-spmtYmd"
									name="srch-dtp-spmtYmd"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
							</td>
						</tr>


					</tbody>
				</table>
				<table class="table table-bordered tbl_fixed" style="border:hidden">
		 			<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: auto">
						<col style="width: 200px">
						<col style="width: 75px">
						<col style="width: 75px">
					</colgroup>
					<tbody>
						<tr>
							<td style="border-left:hidden"></td>
							<td style="border-left:hidden">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-spmtDdlnYmd"
									name="srch-dtp-spmtDdlnYmd"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
									>
								</sbux-datepicker>
							</td>
							<td style="border-left:hidden">
								<sbux-button
									id="btnDocCreate"
									name="btnDocCreate"
									uitype="normal"
									class="btn btn-sm btn-primary"
									onclick="fn_docCreate"
									text="속보생성"
								></sbux-button>
							</td>
							<td style="border-left:hidden">
								<sbux-button
									id="btnDocReport"
									name="btnDocReport"
									uitype="normal"
									class="btn btn-sm btn-primary"
									onclick="fn_docReport"
									text="속보발행"
								></sbux-button>
							</td>
						</tr>
					</tbody>
		 		</table>






				<!-- 엑셀 시트별 데이터 영역 -->
			</div>
				<sbux-tabs id="idxTab_norm" class="sbuxTabContent" name="idxTab_norm" uitype="webacc" is-scrollable="false" jsondata-ref="tabJsonData" >
				</sbux-tabs>
				<div class="tab-content" >
					<div id="dhtyJobTab">
						<div class="table-responsive tbl_scroll_sm" >
							<div id="sb-area-grdDhtyJob" style="height:350px;"></div>
						</div>
					</div>
					<div id="jobCnTab">
						<div class="table-responsive tbl_scroll_sm" >
							<div id="sb-area-grdJobCn" style="height:350px;"></div>
						</div>
					</div>
					<div id="mrktAnls">
						<div class="table-responsive tbl_scroll_sm" >
							<div id="sb-area-grdMrktAnls" style="height:350px;"></div>
						</div>
					</div>
					<div id="invntrSttn1">
						<div class="table-responsive tbl_scroll_sm" >
							<div id="sb-area-grdInvntrSttn1" style="height:350px;"></div>
						</div>
					</div>
					<div id="invntrSttn2">
						<div class="table-responsive tbl_scroll_sm" >
							<div id="sb-area-grdInvntrSttn2" style="height:350px;"></div>
						</div>
					</div>
					<div id="wrhsSttn">
						<div class="table-responsive tbl_scroll_sm" >
							<div id="sb-area-grdWrhsSttn" style="height:350px;"></div>
						</div>
					</div>


				</div>
		</div>


	</section>




	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>
</body>

<script type="text/javascript">

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {
		await fn_reset();
	}
	async function cfn_add() {

	}
	async function cfn_del() {
		await fn_delete();
	}
	async function cfn_save() {
		await fn_save();
	}
	async function cfn_search() {
		await fn_search();
	}




	/* SB Select */
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonApcGrd			= [];	// 등급 		grdCd		검색
	var jsonApcSpcfct		= [];	// 규격 		spcfcCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouse	검색
	var jsonApcBx			= [];	// 팔레트/박스 	검색

	var jsonComWrhsSeCd		= [];	// 입고구분		WRHS_SE_CD
	var jsonComGdsSeCd		= [];	// 상품구분		GDS_SE_CD
	var jsonComTrsprtSeCd	= [];	// 운송구분		TRSPRT_SE_CD

	/* 생산자 자동완성 */
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

    /*거래처 조회*/
    var jsonCnpt = [];

    /*거래처 조회*/
    var jsonGrd = [];

    /*박스 조회*/
    var jsonBx = [];
    /*팔레트 조회*/
    var jsonPlt = [];

    /* SBGrid */
	var grdDhtyJob;
	var grdJobCn;
	var grdMrktAnls;
	var grdInvntrSttn1;
	var grdInvntrSttn2;
	var grdWrhsSttn;
    /* SBGrid Data (JSON) */
	var jsonDhtyJob;
	var jsonJobCn;
	var jsonMrktAnls;
	var jsonInvntrSttn1;
	var jsonInvntrSttn2;
	var jsonWrhsSttn;

    let vhclData = {vhclno : null, drvrNm : null, bankNm : null, bankCd : null, actno : null, dpstrNm : null};

    var tabJsonData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "1. 당일작업단가", "targetid" : "dhtyJobTab", "targetvalue" : "등록" },
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "2. 작업내용", "targetid" : "jobCnTab", "targetvalue" : "등록내역" },
		{ "id" : "2", "pid" : "-1", "order" : "3", "text" : "3. 시황분석", "targetid" : "mrktAnls", "targetvalue" : "" },
		{ "id" : "3", "pid" : "-1", "order" : "4", "text" : "4. 재고현황1", "targetid" : "invntrSttn1", "targetvalue" : "" },
		{ "id" : "4", "pid" : "-1", "order" : "5", "text" : "4-1. 재고현황2", "targetid" : "invntrSttn2", "targetvalue" : "" },
		{ "id" : "5", "pid" : "-1", "order" : "6", "text" : "5. 입고현황", "targetid" : "wrhsSttn", "targetvalue" : "" },
	];

    /**
     * @name fn_initSBSelect
     * @description SBSelect JSON 불러오기
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let result = await Promise.all([
			 	gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			 	gfn_setPltBxSBSelect('srch-slt-bxKnd', 			jsonApcBx, gv_selectedApcCd, 'B'),	// 박스
			 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),		// 품목
			 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, '0532'),		// 품종
			 	gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, '0532', '1326'),	// 규격
			 	fn_selectCnptList('0532'),
			 	fn_setGrdGrd(),
			 	fn_callSelectPltList(jsonBx,"B"),
			 	fn_callSelectPltList(jsonPlt,"P")
			]);
		let today = gfn_dateToYmd(new Date());
		SBUxMethod.set("srch-dtp-spmtYmd", [today,today]);
		SBUxMethod.set("srch-dtp-spmtDdlnYmd", today);
	}



	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {



		let result = await Promise.all([
				fn_initSBSelect()
			]);
		fn_createGrid1();
		fn_createGrid2();
		fn_createGrid3();
		fn_createGrid4();
		fn_createGrid5();
		fn_createGrid6();

	}


	// only document
	window.addEventListener('DOMContentLoaded', async function(e) {
		let result = await Promise.all([
			fn_init()
		]);
	});



	/**
	 * @name fn_createGrid1
	 * @description 당일작업단가 그리드 생성
	 */
	const fn_createGrid1 = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdDhtyJob';
	    SBGridProperties.id = 'grdDhtyJob';
	    SBGridProperties.jsonref = 'jsonDhtyJob';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.explorerbar = 'sort';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.rowheader = 'seq';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리"],
        		ref: 'prcs',
        		type:'button',
        		width:'50px',
        		style: 'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if (gfn_isEmpty(strValue)){
	            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdDhtyJob," + nRow + ", " + nCol + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdDhtyJob," + nRow + ")'>삭제</button>";
					}
		    }},
		    {caption: ["출고일자"],		ref: 'spmtYmd',      type:'datepicker', typeinfo : {dateformat :'yyyy-mm-dd'},  width:'120px',    style:'text-align:center', sortable: false},
	        {caption: ["총작업인원"],		ref: 'jobNope',      type:'input',  width:'120px',    style:'text-align:center', sortable: false,
	        	dataType : 'number' ,format : {type:'number', rule:'#,###'}
	        },
	        {caption: ["총인건비(원)"],	ref: 'totLbrco',    type:'input',  width:'120px',    style:'text-align:center', sortable: false,
	        	format : {type:'number', rule:'#,###'}
	        },
	        {caption: ["당일 출고량(Kg)"],	ref: 'totSpmtWght',    type:'input',  width:'120px',    style:'text-align:center', sortable: false,
	        	format : {type:'number', rule:'#,###'}
	        },
	        {caption: ["Kg당 작업비용(원)"],	ref: 'unitWorkPrc',    type:'input',  width:'120px',    style:'text-align:center', sortable: false,
	        	format : {type:'number', rule:'#,###'}
	        },
	        {caption: ["인당 작업량(Kg)"],	ref: 'totSpmtWght',    type:'input',  width:'120px',    style:'text-align:center', sortable: false,
	        	format : {type:'number', rule:'#,###'}
	        },
	        {caption: ["ISSUE"],	ref: 'issue',    type:'input',  width:'120px',    style:'text-align:center', sortable: false}
	        ];

	    grdDhtyJob = _SBGrid.create(SBGridProperties);
	    //grdRawMtrWrhs.bind('valuechanged','fn_grdValueChanged');
	    grdDhtyJob.addRow();
	}

	/**
	 * @name fn_createGrid2
	 * @description 작업내용 그리드 생성
	 */
	const fn_createGrid2 = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdJobCn';
	    SBGridProperties.id = 'grdJobCn';
	    SBGridProperties.jsonref = 'jsonJobCn';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.explorerbar = 'sort';
		SBGridProperties.mergecells = 'none';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.rowheader = 'seq';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리"],
        		ref: 'prcs',
        		type:'button',
        		width:'50px',
        		style: 'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if (gfn_isEmpty(strValue)){
	            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdJobCn," + nRow + ", " + nCol + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdJobCn," + nRow + ")'>삭제</button>";
					}
		    }},
		    {caption: ["선별일자","선별일자"],		ref: 'sortYmd',      type:'datepicker', typeinfo : {dateformat :'yyyy-mm-dd'},  width:'120px',    style:'text-align:center', sortable: false},
	        {caption: ["선별수량(가구)","선별수량(가구)"],		ref: 'sortQntt',      type:'input',  width:'120px',    style:'text-align:center', sortable: false,
	        	dataType : 'number' ,format : {type:'number', rule:'#,###'}
	        },
	        {caption: ["선별량(Kg)","선별량(Kg)"],	ref: 'sortWght',    type:'input',  width:'120px',    style:'text-align:center', sortable: false,
	        	format : {type:'number', rule:'#,###'}
	        },
	        ];

	    jsonCnpt.forEach(item => {
	    	var col1 = {
	    	caption: [item.cnptNm,"검품출고"]
	    	, ref: 'igiSpmtQntt' + item.cnptCd
	    	, type:'input'
	    	, width:'80px'
	    	, style:'text-align:center'
	    	, sortable: false
	    	, dataType : 'number'
	    	, format : {type:'number', rule:'#,###'}
	    	}
		        	;
	    	var col2 = {
	    	caption: [item.cnptNm,"실출고"]
	    	, ref: 'realSpmtQntt' + item.cnptCd
	    	, type:'input'
	    	, width:'80px'
	    	, style:'text-align:center'
	    	, sortable: false
		    , dataType : 'number'
		    , format : {type:'number', rule:'#,###'}
	    	};
	    	SBGridProperties.columns.push(col1);
	    	SBGridProperties.columns.push(col2);
	    })
	    SBGridProperties.columns.push({
	    	caption: ["",""]
	    	, ref: "rmrk"
	    	, type:'output'
	    	, width:'50px'
	    	, style:'text-align:center'
	    	, sortable: false
		    , dataType : 'number'
		    , format : {type:'number', rule:'#,###'}
	    	});


	    grdJobCn = _SBGrid.create(SBGridProperties);
	    //grdRawMtrWrhs.bind('valuechanged','fn_grdValueChanged');
	    grdJobCn.addRow();
	}

	/**
	 * @name fn_createGrid3
	 * @description 시황분석 그리드 생성
	 */
	const fn_createGrid3 = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdMrktAnls';
	    SBGridProperties.id = 'grdMrktAnls';
	    SBGridProperties.jsonref = 'jsonMrktAnls';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.explorerbar = 'sort';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.rowheader = 'seq';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리"],
        		ref: 'prcs',
        		type:'button',
        		width:'50px',
        		style: 'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if (gfn_isEmpty(strValue)){
	            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdMrktAnls," + nRow + ", " + nCol + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdMrktAnls," + nRow + ")'>삭제</button>";
					}
		    }},
		    {caption: ["시황일자","시황일자"],		ref: 'mrktCndYmd',      type:'datepicker', typeinfo : {dateformat :'yyyy-mm-dd'},  width:'120px',    style:'text-align:center', sortable: false},
	        ];
	    	jsonCnpt.forEach(item => {
	    	var col1 = {
	    	caption: [item.cnptNm,"실 출고량"]
	    	, ref: 'realSpmtQntt' + item.cnptCd
	    	, type:'input'
	    	, width:'80px'
	    	, style:'text-align:center'
	    	, sortable: false
	    	, dataType : 'number'
	    	, format : {type:'number', rule:'#,###'}
	    	}
		        	;
	    	var col2 = {
	    	caption: [item.cnptNm,"판매금액"]
	    	, ref: 'ntslAmt' + item.cnptCd
	    	, type:'input'
	    	, width:'80px'
	    	, style:'text-align:center'
	    	, sortable: false
		    , dataType : 'number'
		    , format : {type:'number', rule:'#,###'}
	    	};

	    	SBGridProperties.columns.push(col1);
	    	SBGridProperties.columns.push(col2);
	    })
	      SBGridProperties.columns.push({
	    	caption: ["",""]
	    	, ref: "rmrk"
	    	, type:'output'
	    	, width:'50px'
	    	, style:'text-align:center'
	    	, sortable: false
		    , dataType : 'number'
		    , format : {type:'number', rule:'#,###'}
	    	});


	    grdMrktAnls = _SBGrid.create(SBGridProperties);
	    //grdRawMtrWrhs.bind('valuechanged','fn_grdValueChanged');
	    grdMrktAnls.addRow();
	}

	/**
	 * @name fn_createGrid4
	 * @description 재고현황1 그리드 생성
	 */
	const fn_createGrid4 = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdInvntrSttn1';
	    SBGridProperties.id = 'grdInvntrSttn1';
	    SBGridProperties.jsonref = 'jsonInvntrSttn1';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.explorerbar = 'sort';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.rowheader = 'seq';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리"],
        		ref: 'prcs',
        		type:'button',
        		width:'50px',
        		style: 'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if (gfn_isEmpty(strValue)){
	            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdInvntrSttn1," + nRow + ", " + nCol + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdInvntrSttn1," + nRow + ")'>삭제</button>";
					}
		    }},
		    {caption: ["재고일자","재고일자"],		ref: 'invntrYmd',      type:'datepicker', typeinfo : {dateformat :'yyyy-mm-dd'},  width:'120px',    style:'text-align:center', sortable: false},


	        ];

	    jsonGrd.forEach(item => {
	    	var col1 = {
	    	caption: [item.grdNm,"빨강"]
	    	, ref: 'red' + item.grdCd
	    	, type:'input'
	    	, width:'80px'
	    	, style:'text-align:center'
	    	, sortable: false
	    	, dataType : 'number'
	    	, format : {type:'number', rule:'#,###'}
	    	}
		        	;
	    	var col2 = {
   	    	caption: [item.grdNm,"노랑"]
   	    	, ref: 'ylw' + item.grdCd
   	    	, type:'input'
   	    	, width:'80px'
   	    	, style:'text-align:center'
   	    	, sortable: false
   	    	, dataType : 'number'
   	    	, format : {type:'number', rule:'#,###'}
   	    	}
	    	var col3 = {
    	    caption: [item.grdNm,"주황"]
    	    , ref: 'org' + item.grdCd
    	    , type:'input'
    	    , width:'80px'
    	    , style:'text-align:center'
    	    , sortable: false
    	    , dataType : 'number'
    	    , format : {type:'number', rule:'#,###'}
    	    }

	    	SBGridProperties.columns.push(col1);
	    	SBGridProperties.columns.push(col2);
	    	SBGridProperties.columns.push(col3);
	    });
	    var col1 = {
		    	caption: ["아이보리","아이보리"]
		    	, ref: 'ivory'
		    	, type:'input'
		    	, width:'80px'
		    	, style:'text-align:center'
		    	, sortable: false
		    	, dataType : 'number'
		    	, format : {type:'number', rule:'#,###'}
		    	}
	    var col2 = {
		    	caption: ["보라","보라"]
		    	, ref: 'purple'
		    	, type:'input'
		    	, width:'80px'
		    	, style:'text-align:center'
		    	, sortable: false
		    	, dataType : 'number'
		    	, format : {type:'number', rule:'#,###'}
		    	}
	    var col3 = {
		    	caption: ["녹색","녹색"]
		    	, ref: 'green'
		    	, type:'input'
		    	, width:'80px'
		    	, style:'text-align:center'
		    	, sortable: false
		    	, dataType : 'number'
		    	, format : {type:'number', rule:'#,###'}
		    	}
	    SBGridProperties.columns.push(col1);
	    SBGridProperties.columns.push(col2);
	    SBGridProperties.columns.push(col3);

	    jsonBx.forEach(item => {
	    	var col1 = {
	    	caption: [item.pltBxNm,item.pltBxNm]
	    	, ref: item.pltBxSeCd + item.pltBxCd
	    	, type:'output'
	    	, width:'80px'
	    	, style:'text-align:center'
	    	, sortable: false
	    	, dataType : 'number'
	    	, format : {type:'number', rule:'#,###'}
	    	};

	    	SBGridProperties.columns.push(col1);
	    })
	    jsonPlt.forEach(item => {
	    	var col1 = {
	    	caption: [item.pltBxNm,item.pltBxNm]
	    	, ref: item.pltBxSeCd + item.pltBxCd
	    	, type:'input'
	    	, width:'80px'
	    	, style:'text-align:center'
	    	, sortable: false
	    	, dataType : 'number'
	    	, format : {type:'number', rule:'#,###'}
	    	};

	    	SBGridProperties.columns.push(col1);
	    })
	    grdInvntrSttn1 = _SBGrid.create(SBGridProperties);
	    //grdRawMtrWrhs.bind('valuechanged','fn_grdValueChanged');
	    grdInvntrSttn1.addRow();
	}

	/**
	 * @name fn_createGrid5
	 * @description 재고현황2 그리드 생성
	 */
	const fn_createGrid5 = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdInvntrSttn2';
	    SBGridProperties.id = 'grdInvntrSttn2';
	    SBGridProperties.jsonref = 'jsonInvntrSttn2';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.explorerbar = 'sort';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.rowheader = 'seq';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리"],
        		ref: 'prcs',
        		type:'button',
        		width:'50px',
        		style: 'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if (gfn_isEmpty(strValue)){
	            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdInvntrSttn2," + nRow + ", " + nCol + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdInvntrSttn2," + nRow + ")'>삭제</button>";
					}
		    }},
		    {caption: ["재고일자","재고일자"],		ref: 'invntrYmd',      type:'datepicker', typeinfo : {dateformat :'yyyy-mm-dd'},  width:'120px',    style:'text-align:center', sortable: false},

	        ];
		var gdsSe = [
			{cd:"long",nm : "길쭉이"}
			,{cd:"mini",nm:"미니"}
			,{cd:"dangjo",nm:"당조고추"}
			,{cd:"purple",nm:"보라고추"}
			];
		var colorSe = [{cd:"red",nm:"빨강"},
			{cd:"ylw",nm:"노랑"},
			{cd:"org",nm:"주황"},
			{cd:"brw",nm:"갈색"},
			{cd:"gre",nm:"초록"},
			{cd:"pur",nm:"보라"}
			];

		gdsSe.forEach(item =>{
			colorSe.forEach(item2 =>{
				var col1 = {
				    	caption: [item.nm,item2.nm]
				    	, ref: item.cd + item2.cd
				    	, type:'input'
				    	, width:'80px'
				    	, style:'text-align:center'
				    	, sortable: false
				    	, dataType : 'number'
				    	, format : {type:'number', rule:'#,###'}
				    	};
				SBGridProperties.columns.push(col1);
			})
		})

	    grdInvntrSttn2 = _SBGrid.create(SBGridProperties);
	    //grdRawMtrWrhs.bind('valuechanged','fn_grdValueChanged');
	    grdInvntrSttn2.addRow();
	}

	/**
	 * @name fn_createGrid6
	 * @description 입고현황 그리드 생성
	 */
	const fn_createGrid6 = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWrhsSttn';
	    SBGridProperties.id = 'grdWrhsSttn';
	    SBGridProperties.jsonref = 'jsonWrhsSttn';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.explorerbar = 'sort';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.rowheader = 'seq';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리"],
        		ref: 'prcs',
        		type:'button',
        		width:'50px',
        		style: 'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if (gfn_isEmpty(strValue)){
	            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(grdWrhsSttn," + nRow + ", " + nCol + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(grdWrhsSttn," + nRow + ")'>삭제</button>";
					}
		    }},
		    {caption: ["재고일자","재고일자"],		ref: 'invntrYmd',      type:'datepicker', typeinfo : {dateformat :'yyyy-mm-dd'},  width:'120px',    style:'text-align:center', sortable: false},

	        ];
		var gdsSe = [
			{cd:"normal",nm : "일반"}
			,{cd:"long",nm : "길쭉이"}
			,{cd:"mini",nm:"미니"}
			,{cd:"dangjo",nm:"당조고추"}
			,{cd:"non",nm:"미착과"}
			];
		var colorSe = [{cd:"red",nm:"빨강"},
			{cd:"ylw",nm:"노랑"},
			{cd:"org",nm:"주황"},
			{cd:"brw",nm:"브라운"},
			{cd:"ivory",nm:"아이보리"},
			{cd:"gre",nm:"녹색"},
			{cd:"pur",nm:"보라"}
			];

		gdsSe.forEach(item =>{
			colorSe.forEach(item2 =>{
				var col1 = {
				    	caption: [item.nm,item2.nm]
				    	, ref: item.cd + item2.cd
				    	, type:'input'
				    	, width:'80px'
				    	, style:'text-align:center'
				    	, sortable: false
				    	, dataType : 'number'
				    	, format : {type:'number', rule:'#,###'}
				    	};
				SBGridProperties.columns.push(col1);
			})
		})

	    grdWrhsSttn = _SBGrid.create(SBGridProperties);
	    //grdRawMtrWrhs.bind('valuechanged','fn_grdValueChanged');
	    grdWrhsSttn.addRow();
	}





	function parseAndCheck(value) {
		  const parsed = parseInt(value, 10);
		  return isNaN(parsed) ? 0 : parsed;
	}




	/**
	 * common button action
	 */

	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
     const fn_reset = async function() {
    	 //grdRawMtrWrhs.destroy();
    	 //fn_createGrid();
	}

     const fn_search = async function() {
 		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmd");		// 입고시작일자

   		// optional
   		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");	// 생산자

   		if (gfn_isEmpty(prdcrCd)) {
    		gfn_comAlert("W0001", "생산자");		//	//	W0002	{0}을/를 입력하세요.
            return;
    	}

  	    try{
  	    	let postUrl = "/am/wrhs/selectRawMtrWrhsPrfmncList.do";
  			const postJsonPromise = gfn_postJSON(postUrl, {
 	 				apcCd: gv_selectedApcCd,
 	 				wrhsYmdFrom: wrhsYmdFrom,
 	 				wrhsYmdTo: wrhsYmdFrom,
 	 				//wrhsSeCd: wrhsSeCd,
 	 				//gdsSeCd: gdsSeCd,
 	 				//trsprtSeCd: trsprtSeCd,
 	 				//warehouseSeCd: warehouseSeCd,
 	 				prdcrCd: prdcrCd,
 	 				vrtyCd: '',
 	 				itemCd: '1326',
 	 				//vhclno: vhclno,
 	 				//invntrYn: invntrYn
 	 	          	// pagination
 	 	  	  		//pagingYn : 'Y',
 	 	  			//currentPageNo : pageNo,
 	 	   		  	//recordCountPerPage : pageSize
 	 	  		});

  	        const data = await postJsonPromise;


  	    	if (!_.isEqual("S", data.resultStatus)) {
 	        	gfn_comAlert(data.resultCode, data.resultMessage);
 	        	return;
 	        }

 			/** @type {number} **/
       		let totalRecordCount = 0;

       		jsonRegList.length = 0;
       		jsonRegListTemp = data.resultList;
       		jsonRegListTemp.forEach(item =>{
       			if(item.wrhsWght == 0 || item.bxQntt == 0){
       				return;
       			}
       			let spcfct = item.wrhsWght / item.bxQntt;
       			let spcfctCd = jsonApcSpcfct.find(data2 => data2.wght === spcfct );
       			item['spcfctCd'] = spcfctCd['spcfctCd'];
       		})



       		const result = Object.values(
       				data.resultList.reduce((acc, item) => {
       			    const { pltno, bxQntt, wrhsWght,apcCd,apcNm,wrhsYmd,prdcrCd,prdcrNm,wrhsno,wghno,itemCd,itemNm,vrtyCd,vrtyNm,inqYn,wrhsQntt,invntrQntt,invntrWght } = item;

       			    // acc에 pltno가 없으면 새로운 항목 추가, 있으면 bxQntt와 wrhsWght를 합산
       			    if (!acc[pltno]) {
       			      acc[pltno] = { pltno, bxQntt: 0, wrhsWght: 0, apcCd,apcNm,wrhsYmd,prdcrCd,prdcrNm,wrhsno,wghno,itemCd,itemNm,vrtyCd,vrtyNm,inqYn,wrhsQntt,invntrQntt,invntrWght };
       			    }

       			    acc[pltno].wrhsQntt += bxQntt;
       			    acc[pltno].wrhsWght += wrhsWght;

       			    return acc;
       			  }, {})
       			);


   			jsonRegList = result;
           	if (jsonRawMtrWrhs.length > 0) {
           		grdRegList.refresh();
           		grdRegList.setRow(1);
           		grdRawMtrWrhs.refresh()
           	} else {
           		grdRegList.rebuild();
          	}

         } catch (e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
         	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
      	}
 	}




    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {

		let prcsType = SBUxMethod.get("srch-inp-prcsType");
		let allData = grdRawMtrWrhs.getGridDataAll();



		allData.pop();
 		allData.forEach(item => {



 		})


    	// validation check
    	if (gfn_isEmpty(wrhsYmd)) {
    		gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 선택하세요.
            return;
    	}

    	if (gfn_isEmpty(prdcrCd)) {
    		gfn_comAlert("W0001", "생산자");		//	//	W0002	{0}을/를 입력하세요.
            return;
    	}

    	if (!gfn_comConfirm("Q0001", "저장")) {
    		return;
    	}



    	//let postUrl = gfn_isEmpty(wrhsno) ? "/am/wrhs/insertRawMtrWrhs.do" : "/am/wrhs/updateRawMtrWrhs.do";
    	let postUrl = "/am/wrhs/insertRawMtrWrhsListJiwoo.do";
    	const filteredList = allData.filter(item => item.wrhsQntt !== "" || item.wrhsQntt === "undefined");


     	const postJsonPromise = gfn_postJSON(postUrl, filteredList);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

	}











	/**
     * @name fn_prdctnDoc
     * @description 속보발행 버튼
     */
	const fn_docReport = async function() {
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");	// 생산자
		let spmtDdlnYmd= SBUxMethod.get("srch-dtp-spmtDdlnYmd")		// 입고시작일자

		const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'RTD_DOC');
		let obj = {apcCd: gv_selectedApcCd
				, yyyymmdd: spmtDdlnYmd
				, yyyymm : spmtDdlnYmd.substring(0,6)
				, yyyy : spmtDdlnYmd.substring(0,4)
				};

		gfn_popClipReport("생산일보", rptUrl, obj );
	}


	const fn_searchRow = async function(grd,nRow,nCol){
		let rowData = grd.getRowData(nRow);
		fn_dlngDoc(rowData.pltno);
	}

	const fn_deleteRow = async function(grd,nRow,nCol){
		let rowData = grd.getRowData(nRow);
		fn_delete(rowData.pltno)
	}









    const fn_addRow = async function(objGrid,nRow, nCol) {
    	const editableRow = objGrid.getRowData(nRow, false);	// call by reference(deep copy)
    	editableRow.prcs = "TEST";
    	objGrid.setCellDisabled(nRow, 0, nRow, objGrid.getCols() -1 , false);

    	objGrid.addRow(true);
    	objGrid.setCellDisabled(nRow+1, 0, nRow+1, objGrid.getCols() - 1, true);
    	//objGrid.rebuild();
    }
    const fn_delRow = async function(objGrid,nRow) {
    	objGrid.deleteRow(nRow);
    }

    // 거래처 조회
    const fn_selectCnptList = async function(apcCd){

    	let postJsonPromise = gfn_postJSON("/am/cmns/selectCnptList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
	    jsonCnpt.length = 0;
        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	data.resultList.forEach((item, index) => {
  					let cnpt = {
  						cnptCd			: item.cnptCd
  					  , cnptNm			: item.cnptNm
  					  , cnptType		: item.cnptType
  					  , brno			: item.brno
  					  , picNm			: item.picNm
  					  , telno			: item.telno
  					  , rmrk			: item.rmrk
  					  , delYn			: item.delYn
  					  , apcCd			: item.apcCd
  					  , eml				: item.eml
  					  , bzstat			: item.bzstat
  					  , cls				: item.cls
  					  , whlslMrktCorpCd	: item.whlslMrktCorpCd
  					  , picTelno 		: item.picTelno
  					  , addr 			: item.addr
  					  , fxno 			: item.fxno
  					  , dlngShapCd 		: item.dlngShapCd
  					  , dlngMthdCd 		: item.dlngMthdCd
  					  , extrnlLnkgCd 	: item.extrnlLnkgCd
					  , sn				: item.sn
					  , useYn 			: item.useYn
  					}
  					jsonCnpt.push(cnpt);
  				});
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

 	// 등급
	const fn_setGrdGrd = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N',
			grdSeCd : '02'
		}
		jsonGrd.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/cmns/selectStdGrdDtlList.do",
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonGrd.push(item);
	        });


		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	// 팔레트 목록 조회
	const fn_callSelectPltList = async function(target,type){

    	let postJsonPromise = gfn_postJSON("/am/cmns/selectPltBxList.do", {apcCd : gv_apcCd, pltBxSeCd : type});
        let data = await postJsonPromise;

        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	data.resultList.forEach((item, index) => {
  					let pltBxVO = {
  					    pltBxCd 		: item.pltBxCd
  					  , pltBxNm 		: item.pltBxNm
  					  , unitWght 		: item.unitWght
  					  , unitCd 			: item.unitCd
  					  , bssInvntrQntt 	: item.bssInvntrQntt
  					  , useYn 			: item.useYn
  					  , delYn 			: item.delYn
  					  , pltBxSeCd 		: item.pltBxSeCd
  					  , apcCd 			: item.apcCd
  					  , rmrk			: item.rmrk
					  , extrnlLnkgCd	: item.extrnlLnkgCd
  					}
  					target.push(Object.assign({}, pltBxVO));
  				});
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}






</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>