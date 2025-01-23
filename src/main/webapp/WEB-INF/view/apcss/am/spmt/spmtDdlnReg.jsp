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
	<title>title : 생산속보(지우)</title>
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
						id="btnSave"
						name="btnSave"
						uitype="normal"
						class="btn btn-sm btn-primary"
						onclick="fn_save"
						text="저장"
					></sbux-button>
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
						onclick="fn_search"
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
									onvalidate="fnDateValidate('srch-dtp-spmtYmd')"
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
							<td class="td_input" style="border-left:hidden">
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
				<sbux-tabs
					id="idxTab_norm"
					name="idxTab_norm"

					uitype="webacc"
					is-scrollable="false"
					jsondata-ref="tabJsonData"
					callback-before-select="fnBeforeSelectTab"
					style="height:450px" >
				</sbux-tabs>
				<div class="tab-content" >
					<div id="dhtyJobTab">
						<div class="table-responsive tbl_scroll_sm" >
							<div id="sb-area-grdDhtyJob" style="height:530px;"></div>
						</div>
					</div>
					<div id="jobCnTab">
						<div class="table-responsive tbl_scroll_sm"  >
							<div id="sb-area-grdJobCn" style="height:530px;"></div>
						</div>
					</div>
					<div id="mrktAnls">
						<div class="table-responsive tbl_scroll_sm" >
							<div id="sb-area-grdMrktAnls" style="height:530px;"></div>
						</div>
					</div>
					<div id="invntrSttn1">
						<div class="table-responsive tbl_scroll_sm" >
							<div id="sb-area-grdInvntrSttn1" style="height:530px;"></div>
						</div>
					</div>
					<div id="invntrSttn2">
						<div class="table-responsive tbl_scroll_sm" >
							<div id="sb-area-grdInvntrSttn2" style="height:530px;"></div>
						</div>
					</div>
					<div id="wrhsSttn">
						<div class="table-responsive tbl_scroll_sm" >
							<div id="sb-area-grdWrhsSttn" style="height:530px;"></div>
						</div>
					</div>


				</div>





				<!-- 엑셀 시트별 데이터 영역 -->
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
		//await fn_delete();
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
    /*상품 조회*/
    var jsonGds = [];
    var jsonFilterGds = [];
    /*일반 품종 필터링 조회*/
    var jsonFilterVrty = [];

    /*일반 품종제외 필터링 조회*/
    var jsonFilterVrty2 = [];

    /*일반 품종제외 필터링 조회*/
    var jsonFilterVrty3 = [];

    /* 다이스 */
    var jsonDiceSeCd;

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
			 	fn_callSelectPltList(jsonPlt,"P"),
			 	fn_setGrdGds()
			]);

		jsonDiceSeCd = await gfn_getComCdDtls('DICE_SE_CD', gv_apcCd)	// 창고
		let today = gfn_dateToYmd(new Date());
		SBUxMethod.set("srch-dtp-spmtYmd", [today,today]);
		SBUxMethod.set("srch-dtp-spmtDdlnYmd", today);

		jsonFilterVrty = jsonApcVrty.filter(item => item.vrtyNm.startsWith("일반"));

		const regex = /^(길쭉이|미니|당조고추|보라고추)/; // 검사할 시작 문자열을 정규식으로 표현
		jsonFilterVrty2 = jsonApcVrty.filter(item =>
		    regex.test(item.vrtyNm)
		);

		const regex2 = /^(일반|길쭉이|미니|당조고추|보라고추|미착과)/; // 검사할 시작 문자열을 정규식으로 표현
		jsonFilterVrty3 = jsonApcVrty.filter(item =>
			regex2.test(item.vrtyNm)
		);

		const regex3 = /^(시장|후레쉬|시장미니|길쭉이)/; // 검사할 시작 문자열을 정규식으로 표현
		jsonFilterGds = jsonGds.filter(item => regex3.test(item.spmtPckgUnitNm));

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
	    //SBGridProperties.rowheader = 'seq';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리"],
        		ref: 'delYn',
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
		    {caption: ["출고일자"],		ref: 'spmtYmd',      type:'datepicker', typeinfo : {dateformat :'yymmdd'},  width:'120px',    style:'text-align:center', sortable: false},
	        {caption: ["총작업인원"],		ref: 'jobNope',      type:'input',  width:'120px',    style:'text-align:center', sortable: false,
	        	dataType : 'number' ,format : {type:'number', rule:'#,###'}
	        },
	        {caption: ["총인건비(원)"],	ref: 'totLbrco',    type:'input',  width:'120px',    style:'text-align:center', sortable: false,
	        	format : {type:'number', rule:'#,###'}
	        },
	        {caption: ["당일 출고량(Kg)"],	ref: 'totSpmtWght',    type:'input',  width:'120px',    style:'text-align:center', sortable: false,
	        	format : {type:'number', rule:'#,###'}
	        },
	        {caption: ["Kg당 작업비용(원)"],	ref: 'unitWorkPrc',    type:'output',  width:'120px',    style:'text-align:center', sortable: false,
	        	format : {type:'number', rule:'#,###'}
	        },
	        {caption: ["인당 작업량(Kg)"],	ref: 'workSpmtWght',    type:'output',  width:'120px',    style:'text-align:center', sortable: false,
	        	format : {type:'number', rule:'#,###'}
	        },
	        {caption: ["ISSUE"],	ref: 'issue',    type:'input',  width:'120px',    style:'text-align:center', sortable: false}
	        ];

	    grdDhtyJob = _SBGrid.create(SBGridProperties);
	    grdDhtyJob.bind('valuechanged','fn_grdDhtyJobValueChanged');
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
	    //SBGridProperties.rowheader = 'seq';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리"],
        		ref: 'delYn',
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
		    {caption: ["선별일자","선별일자"],		ref: 'sortYmd',      type:'datepicker', typeinfo : {dateformat :'yymmdd'},  width:'120px',    style:'text-align:center', sortable: false},
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
	    	, ref: 'igiSpmtQntt' + "_" + item.cnptCd
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
	    	, ref: 'realSpmtQntt' +"_"+ item.cnptCd
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
	    //SBGridProperties.rowheader = 'seq';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리"],
        		ref: 'delYn',
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
		    {caption: ["시황일자","시황일자"],		ref: 'mrktCndYmd',      type:'datepicker', typeinfo : {dateformat :'yymmdd'},  width:'120px',    style:'text-align:center', sortable: false},
	        ];
	    	jsonCnpt.forEach(item => {
	    	var col1 = {
	    	caption: [item.cnptNm,"실 출고량"]
	    	, ref: 'realSpmtQntt' + "_" + item.cnptCd
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
	    	, ref: 'ntslAmt' + "_" + item.cnptCd
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
	    //SBGridProperties.rowheader = 'seq';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리"],
        		ref: 'delYn',
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
		    {caption: ["재고일자","재고일자"],		ref: 'invntrYmd',      type:'datepicker', typeinfo : {dateformat :'yymmdd'},  width:'120px',    style:'text-align:center', sortable: false},


	        ];
		let vrtyList = {};
	    jsonGrd.forEach(item => {
	    	jsonFilterVrty.forEach(item2 => {
				let splitVrtyNm = item2.vrtyNm.split("_")[1];
				if(splitVrtyNm === "아이보리" || splitVrtyNm === "보라" || splitVrtyNm === "녹색"){
					vrtyList[splitVrtyNm] = item2;
					return;
				}else{
					var col1 = {
			   		    	caption: [item.grdNm,splitVrtyNm]
			   		    	, ref: item2.vrtyCd + "_" + item.grdCd
			   		    	, type:'input'
			   		    	, width:'80px'
			   		    	, style:'text-align:center'
			   		    	, sortable: false
			   		    	, dataType : 'number'
			   		    	, format : {type:'number', rule:'#,###'}
		   		    	}
			    	SBGridProperties.columns.push(col1);
				}

	    	})
	    });
	    var col1 = {
		    	caption: ["아이보리","아이보리"]
		    	, ref: vrtyList["아이보리"].vrtyCd + '_00'
		    	, type:'input'
		    	, width:'80px'
		    	, style:'text-align:center'
		    	, sortable: false
		    	, dataType : 'number'
		    	, format : {type:'number', rule:'#,###'}
		    	}
	    var col2 = {
		    	caption: ["보라","보라"]
		    	, ref: vrtyList["보라"].vrtyCd + '_00'
		    	, type:'input'
		    	, width:'80px'
		    	, style:'text-align:center'
		    	, sortable: false
		    	, dataType : 'number'
		    	, format : {type:'number', rule:'#,###'}
		    	}
	    var col3 = {
		    	caption: ["녹색","녹색"]
		    	, ref: vrtyList["녹색"].vrtyCd + '_00'
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
	    	, ref: "B_"+ item.pltBxCd
	    	, type:'input'
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
	    	, ref: "P_"+ item.pltBxCd
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
	    //SBGridProperties.rowheader = 'seq';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리"],
        		ref: 'delYn',
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
		    {caption: ["재고일자","재고일자"],		ref: 'invntrYmd',      type:'datepicker', typeinfo : {dateformat :'yymmdd'},  width:'120px',    style:'text-align:center', sortable: false},

	        ];



		jsonFilterVrty2.forEach(item =>{
			var vrtySplit = item.text.split("_");
			var vrtyNm = vrtySplit[0];
			var colrNm = vrtySplit[1];
			if(colrNm === undefined){
				colrNm = vrtySplit[0];
			}

			var col1 = {
			    	caption: [vrtyNm,colrNm]
			    	, ref: "S_"+item.vrtyCd
			    	, type:'input'
			    	, width:'80px'
			    	, style:'text-align:center'
			    	, sortable: false
			    	, dataType : 'number'
			    	, format : {type:'number', rule:'#,###'}
			    	};
			SBGridProperties.columns.push(col1);
		})

		jsonFilterGds.forEach(item =>{
			var col1 = {
			    	caption: [item.spmtPckgUnitNm,item.spmtPckgUnitNm]
			    	, ref: "G_"+item.spmtPckgUnitCd
			    	, type:'input'
			    	, width:'80px'
			    	, style:'text-align:center'
			    	, sortable: false
			    	, dataType : 'number'
			    	, format : {type:'number', rule:'#,###'}
			    	};
			SBGridProperties.columns.push(col1);
		})
		// 다이스는 따로 공통코드로 관리되고 있지 않음 참고
		var diceSe = [
			{cd:"01", nm:"빨강"}
			,{cd:"02",nm:"노랑"}
			,{cd:"03",nm:"주황"}
			];
		jsonDiceSeCd.forEach(item =>{
			if(item.cdVlNm === "당일폐기가구"){
				SBGridProperties.columns.push(
						{
					    	caption: [item.cdVlNm,item.cdVlNm]
					    	, ref: "D_"+ item.cdVl
					    	, type:'input'
					    	, width:'80px'
					    	, style:'text-align:center'
					    	, sortable: false
					    	, dataType : 'number'
					    	, format : {type:'number', rule:'#,###'}
					    	}
				);


			}else{
				var col1 = {
				    	caption: ["다이스재고",item.cdVlNm]
				    	, ref: "D_"+item.cdVl
				    	, type:'input'
				    	, width:'80px'
				    	, style:'text-align:center'
				    	, sortable: false
				    	, dataType : 'number'
				    	, format : {type:'number', rule:'#,###'}
				    	};
				SBGridProperties.columns.push(col1);
			}

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
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{caption: ["처리","처리"],
        		ref: 'delYn',
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
		    {caption: ["재고일자","재고일자"],		ref: 'wrhsYmd',      type:'datepicker', typeinfo : {dateformat :'yymmdd'},  width:'120px',    style:'text-align:center', sortable: false},

	        ];
		/* var gdsSe = [
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
			]; */

		jsonFilterVrty3.forEach(item =>{
			var vrtySplit = item.text.split("_");
			var vrtyNm = vrtySplit[0];
			var colrNm = vrtySplit[1];
			if(colrNm === undefined){
				colrNm = vrtySplit[0];
			}
			var col1 = {
			    	caption: [vrtyNm,colrNm]
			    	, ref: item.vrtyCd
			    	, type:'input'
			    	, width:'80px'
			    	, style:'text-align:center'
			    	, sortable: false
			    	, dataType : 'number'
			    	, format : {type:'number', rule:'#,###'}
			    	};
			SBGridProperties.columns.push(col1);
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

    const fnDateValidate = function(modelNm){
    	const getValue = SBUxMethod.get(modelNm);
		if(!getValue) {
			return false;
		}
		if(getValue[0] === "" || getValue[0] === "undefined" || getValue[1] === "" || getValue[1] === "undefined") {
			return false;
		}
		return true;
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











    const fn_addRow = async function(objGrid,nRow, nCol) {
    	const editableRow = objGrid.getRowData(nRow, false);	// call by reference(deep copy)
    	editableRow.delYn = "insert";
    	objGrid.setCellDisabled(nRow, 0, nRow, objGrid.getCols() -1 , false);

    	objGrid.addRow(true);
    	objGrid.setCellDisabled(nRow+1, 0, nRow+1, objGrid.getCols() - 1, true);
    	//objGrid.rebuild();
    }
    const fn_delRow = async function(objGrid,nRow) {
    	let rowData = objGrid.getRowData(nRow);
    	let delYn = rowData.delYn ;
    	if(delYn === "N"){
    		fn_deleteUrl(objGrid,rowData)
    	}else{
    		objGrid.deleteRow(nRow);
    	}

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

	const fn_grdDhtyJobValueChanged = function(){
		let rowIdx = grdDhtyJob.getRow();
		let rowData = grdDhtyJob.getRowData(rowIdx);

		if (rowData.jobNope ==="" || rowData.totLbrco ==="" || rowData.totSpmtWght ===""){
			return;
		}
		let jobNope = parseInt(rowData.jobNope); //총작업인원
		let totLbrco = parseInt(rowData.totLbrco); //총인건비
		let totSpmtWght = parseInt(rowData.totSpmtWght); //당일출고량

		rowData.unitWorkPrc =  totLbrco / totSpmtWght;
		rowData.workSpmtWght = totSpmtWght / jobNope;

		grdDhtyJob.setRowData(rowIdx,rowData);

	}
	const fn_search = function(tab){

		if(tab === undefined){
			tab = SBUxMethod.get("idxTab_norm")
		}


		if(tab === "dhtyJobTab"){
			fn_grdDhtyJobSelect();
		}else if(tab === "jobCnTab" ){
			fn_grdJobCnSelect();
		}else if(tab === "mrktAnls" ){
			fn_grdMrktAnlsSelect();
		}else if(tab === "invntrSttn1" ){
			fn_grdInvntrSttn1Select();
		}else if(tab === "invntrSttn2" ){
			fn_grdInvntrSttn2Select();
		}else if(tab === "wrhsSttn" ){
			fn_grdWrhsSttnSelect();
		}

	}


	const fn_save = function(){
		let lastTab = SBUxMethod.get("idxTab_norm")

		if(lastTab === "dhtyJobTab"){
			fn_grdDhtyJobSave();
		}else if(lastTab === "jobCnTab" ){
			fn_grdJobCnSave();
		}else if(lastTab === "mrktAnls" ){
			fn_grdMrktAnlsSave();
		}else if(lastTab === "invntrSttn1" ){
			fn_grdInvntrSttn1Save();
		}else if(lastTab === "invntrSttn2" ){
			fn_grdInvntrSttn2Save();
		}else if(lastTab === "wrhsSttn" ){
			fn_grdWrhsSttnSave();
		}

	}

	const fn_deleteUrl = function(grd,rowData){
		let grdParentId = grd.getParentID()
		let postUrl = "";
		if(grdParentId === "sb-area-grdDhtyJob"){
			postUrl = "/am/spmt/deleteDhtyJobList.do";
		}else if(grdParentId === "sb-area-grdJobCn" ){
			postUrl = "/am/spmt/deleteJobCnList.do";
		}else if(grdParentId === "sb-area-grdMrktAnls" ){
			postUrl = "/am/spmt/deleteMrktAnlsList.do";
		}else if(grdParentId === "sb-area-grdInvntrSttn1" ){

			postUrl = "/am/spmt/deleteInvntrOne.do";
			/* let vrtyList =Array.from(
							  new Set(
									    Object.keys(rowData)
									      .filter(key => key.startsWith("99")) // 키가 99로 시작하는 것만 필터링
									      .map(key => key.split("_")[0]) // split("_") 후 첫 번째 값 추출
									  )); */
			rowData['vrtyCd'] = jsonFilterVrty.map(item => item.vrtyCd);


		}else if(grdParentId === "sb-area-grdInvntrSttn2" ){

			postUrl = "/am/spmt/deleteInvntrTwo.do";
			/* let vrtyList =Array.from(
							  new Set(
									    Object.keys(rowData)
									      .filter(key => key.startsWith("S")) // 키가 99로 시작하는 것만 필터링
									      .map(key => key.split("_")[1]) // split("_") 후 첫 번째 값 추출
									  )); */

			rowData['vrtyCd'] = jsonFilterVrty2.map(item => item.vrtyCd);

		}else if(grdParentId === "sb-area-grdWrhsSttn" ){
			postUrl = "/am/spmt/deleteWrhsSttnList.do";
		}
		if(postUrl !== ""){
			fn_rowDelete(rowData,postUrl);
			fn_search();
		}
	}


	// 당일작업단가 조회
	const fn_grdDhtyJobSelect = async function() {
		let spmtYmd = SBUxMethod.get("srch-dtp-spmtYmd");
		if(!fnDateValidate("srch-dtp-spmtYmd")){
			return;
		}
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N',
			spmtYmdFrom : spmtYmd[0] ,
			spmtYmdTo : spmtYmd[1] ,

		}
		jsonGrd.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/spmt/selectDhtyJobList.do",
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        var msg = convertArrayToCamelCase(data.resultList);
	        jsonDhtyJob = msg;

	        grdDhtyJob.rebuild();
	        grdDhtyJob.addRow();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	const fn_grdDhtyJobSave = async function(){
		let allData = grdDhtyJob.getGridDataAll();
		let saveData = [];
		allData.forEach(item => {
			if(item.delYn === "insert"){
				item['apcCd'] = gv_apcCd;
				item['delYn'] = 'N';
				item['spmtYmd'] = item.spmtYmd.replace(/-/g, "")
				item['gubun'] = 'insert';
				saveData.push(item);
			}else if(item.delYn === "N"){
				item['apcCd'] = gv_apcCd;
				item['delYn'] = 'N';
				item['spmtYmd'] = item.spmtYmd.replace(/-/g, "")
				item['gubun'] = "update";
				saveData.push(item);
			}

		})
		let postUrl = "/am/spmt/insertDhtyJob.do";


     	const postJsonPromise = gfn_postJSON(postUrl, saveData);
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

	// 작업내용 조회
	const fn_grdJobCnSelect = async function() {
		let spmtYmd = SBUxMethod.get("srch-dtp-spmtYmd");
		if(!fnDateValidate("srch-dtp-spmtYmd")){
			return;
		}
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N',
			sortYmdFrom : spmtYmd[0] ,
			sortYmdTo : spmtYmd[1] ,

		}
		jsonJobCn.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/spmt/selectJobCnList.do",
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        var msg = convertArrayToCamelCase(data.resultList);
	        //jsonJobCn = msg;

	        const result = msg.reduce((acc, row) => {
	            // 기존 그룹 찾기
	            let group = acc.find(g => g.sortYmd === row.sortYmd);

	            if (!group) {
	                group = { sortYmd: row.sortYmd, sortQntt : row.sortQntt, sortWght : row.sortWght,delYn : row.delYn, apcCd : row.apcCd };
	                acc.push(group);
	            }

	            // IGI_SPMT_QNTT_<CNPT_CD> 및 REAL_SPMT_QNTT_<CNPT_CD> 열 생성
	            group["igiSpmtQntt_" + row.cnptCd ] = row.igiSpmtQntt;
	            group["realSpmtQntt_" + row.cnptCd ] = row.realSpmtQntt;

	            return acc;
	        }, []);
	        jsonJobCn = result;

	        grdJobCn.rebuild();
	        grdJobCn.addRow();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}


	const fn_grdJobCnSave = async function(){
		let allData = grdJobCn.getGridDataAll();
		let saveData = [];
		allData.forEach(item => {
			let gubun = "";
			if(item.delYn === "insert"){
				gubun = 'insert';
			}else if(item.delYn === "N"){
				gubun = "update";
			}


			let baseObj = {
				sortYmd : item.sortYmd
				, sortQntt : item.sortQntt
				, sortWght : item.sortWght
				, apcCd : gv_apcCd
				, delYn : "N"
				, sortYmd : item.sortYmd.replace(/-/g, "")
				, gubun : gubun
				, igiSpmtQntt : null
				, realSpmtQntt : null
			}
			let cnptCd = "";

			Object.entries(item).forEach(([key, value]) => {

			    let splitKey = key.split("_");
			    if(splitKey[1] !== undefined){

			    	if(splitKey[0] === "igiSpmtQntt"){
			    		baseObj["igiSpmtQntt"]  = value;
			    	}else if(splitKey[0] === "realSpmtQntt"){
			    		baseObj["realSpmtQntt"]  = value;
			    	}

					if(splitKey[1] === cnptCd){
						let obj = {...baseObj};
			    		saveData.push(obj);
			    	}else{
			    		cnptCd = splitKey[1];
			    		baseObj["cnptCd"] = splitKey[1];
			    	}
			    }
			});



		})
		let postUrl = "/am/spmt/insertJobCn.do";


     	const postJsonPromise = gfn_postJSON(postUrl, saveData);
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

	// 시황분석 조회
	const fn_grdMrktAnlsSelect = async function() {
		let spmtYmd = SBUxMethod.get("srch-dtp-spmtYmd");
		if(!fnDateValidate("srch-dtp-spmtYmd")){
			return;
		}
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N',
			mrktCndYmdFrom : spmtYmd[0] ,
			mrktCndYmdTo : spmtYmd[1] ,

		}
		jsonJobCn.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/spmt/selectMrktAnlsList.do",
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        var msg = convertArrayToCamelCase(data.resultList);
	        //jsonJobCn = msg;

	        const result = msg.reduce((acc, row) => {
	            // 기존 그룹 찾기
	            let group = acc.find(g => g.mrktCndYmd === row.mrktCndYmd);

	            if (!group) {
	                group = { mrktCndYmd: row.mrktCndYmd, delYn : row.delYn, apcCd : row.apcCd };
	                acc.push(group);
	            }

	            // IGI_SPMT_QNTT_<CNPT_CD> 및 REAL_SPMT_QNTT_<CNPT_CD> 열 생성
	            group["realSpmtQntt_" + row.cnptCd ] = row.realSpmtQntt;
	            group["ntslAmt_" + row.cnptCd ] = row.ntslAmt;

	            return acc;
	        }, []);
	        jsonMrktAnls = result;

	        grdMrktAnls.rebuild();
	        grdMrktAnls.addRow();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	// 시황분석 저장
	const fn_grdMrktAnlsSave = async function(){
		let allData = grdMrktAnls.getGridDataAll();
		let saveData = [];
		allData.forEach(item => {

			if(item.mrktCndYmd === ""){
				return;
			}

			let gubun = "";
			if(item.delYn === "insert"){
				gubun = 'insert';
			}else if(item.delYn === "N"){
				gubun = "update";
			}

			let baseObj = {
				mrktCndYmd : item.mrktCndYmd.replace(/-/g, "")

				, apcCd : gv_apcCd
				, delYn : "N"
				, gubun : gubun
				, realSpmtQntt : null
				, ntslAmt : null
			}
			let cnptCd = "";

			Object.entries(item).forEach(([key, value]) => {

			    let splitKey = key.split("_");
			    if(splitKey[1] !== undefined){

			    	if(splitKey[0] === "realSpmtQntt"){
			    		baseObj["realSpmtQntt"]  = value;
			    	}else if(splitKey[0] === "ntslAmt"){
			    		baseObj["ntslAmt"]  = value;
			    	}

					if(splitKey[1] === cnptCd){
						let obj = {...baseObj};
			    		saveData.push(obj);
			    	}else{
			    		cnptCd = splitKey[1];
			    		baseObj["cnptCd"] = splitKey[1];
			    	}
			    }
			});



		})
		let postUrl = "/am/spmt/insertMrktAnls.do";


     	const postJsonPromise = gfn_postJSON(postUrl, saveData);
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

	// 재고현황 1 저장
	const fn_grdInvntrSttn1Save = async function(){
		let allData = grdInvntrSttn1.getGridDataAll();
		let saveData = [];
		allData.forEach(item => {

			if(item.invntrYmd === ""){
				return;
			}

			let gubun = "";
			if(item.delYn === "insert"){
				gubun = 'insert';
			}else if(item.delYn === "N"){
				gubun = "update";
			}
			// 재고현황 선별
			let baseObj1 = {
				invntrYmd : item.invntrYmd.replace(/-/g, "")
				, apcCd : gv_apcCd
				, delYn : "N"
				, gubun : gubun
				, itemCd : "1326"
				, vrtyCd : null
				, grdCd : null
				, qntt : null
				, sortBx : "sort"

			}
			// 재고현황 박스
			let baseObj2 = {
					invntrYmd : item.invntrYmd.replace(/-/g, "")
					, apcCd : gv_apcCd
					, delYn : "N"
					, gubun : gubun
					, bxPltSeCd : null
					, bxPltCd : null
					, qntt : null
					, wght : null
					, sortBx : "bx"
			}



			//splitKey[0] : gds,B,P
			//splitKey[1] : colrSeCd , bxCd
			//splitKey[2] : etcSeCd
			Object.entries(item).forEach(([key, value]) => {

			    let splitKey = key.split("_");
			    if(splitKey[1] !== undefined){
			    	if(splitKey[0] === "B" || splitKey[0] === "P"){
			    		let obj = {...baseObj2};
			    		obj['pltBxSeCd'] = splitKey[0];
			    		obj['pltBxCd'] = splitKey[1];
			    		obj['qntt'] = value;

			    		let cnvrsUnitWght = jsonApcBx.find(item => item.pltBxCd === splitKey[1]).cnvrsUnitWght;
			    		obj['wght'] = parseInt(value) * cnvrsUnitWght

			    		saveData.push(obj)
			    	}else{
			       		let obj = {...baseObj1};
			    		obj['vrtyCd'] = splitKey[0];
			    		obj['grdCd'] = splitKey[1];
			    		obj['qntt'] = value;
			    		saveData.push(obj)
			    	}
			    }
			});
		})
		let postUrl = "/am/spmt/insertInvntrSttnOne.do";


     	const postJsonPromise = gfn_postJSON(postUrl, saveData);
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

	// 재고현황1 조회
	const fn_grdInvntrSttn1Select = async function() {
		let spmtYmd = SBUxMethod.get("srch-dtp-spmtYmd");
		if(!fnDateValidate("srch-dtp-spmtYmd")){
			return;
		}
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N',
			itemCd : '1326',
			invntrYmdFrom : spmtYmd[0] ,
			invntrYmdTo : spmtYmd[1] ,
		}
		jsonJobCn.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/spmt/selectInvntrSttnOneList.do",
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        jsonInvntrSttn1 = convertArrayToCamelCase(data.resultList);
	        grdInvntrSttn1.rebuild();
	        grdInvntrSttn1.addRow();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	// 재고현황 2 저장
	const fn_grdInvntrSttn2Save = async function(){
		let allData = grdInvntrSttn2.getGridDataAll();
		let saveData = [];
		allData.forEach(item => {

			if(item.invntrYmd === ""){
				return;
			}

			let gubun = "";
			if(item.delYn === "insert"){
				gubun = 'insert';
			}else if(item.delYn === "N"){
				gubun = "update";
			}
			let invntrYmd = item.invntrYmd.replace(/-/g, "");
			// 재고현황2 선별
			let baseObj1 = {
				invntrYmd :invntrYmd
				, apcCd : gv_apcCd
				, delYn : "N"
				, gubun : gubun
				, itemCd : "1326"
				, vrtyCd : null
				, grdCd : '00'
				, qntt : null
				, seCd : "S"

			}
			// 재고현황2 상품
			let baseObj2 = {
				invntrYmd :invntrYmd
				, apcCd : gv_apcCd
				, delYn : "N"
				, gubun : gubun
				, itemCd : "1326"
				, gdsCd : null
				, seCd : "G"
			}

			// 재고현황2 다이스
			let baseObj3 = {
				invntrYmd :invntrYmd
				, apcCd : gv_apcCd
				, delYn : "N"
				, gubun : gubun
				, itemCd : "1326"
				, diceSeCd : null
				, qntt : null
				, seCd : "D"

			}

			Object.entries(item).forEach(([key, value]) => {

			    let splitKey = key.split("_");
			    if(splitKey[1] !== undefined){
			    	if(splitKey[0] === "S"){
			    		let obj = {...baseObj1};
			    		obj['vrtyCd'] = splitKey[1];
			    		obj['qntt'] = value;
			    		saveData.push(obj)
			    	}else if(splitKey[0] === "G"){
			    		let obj = {...baseObj2};
			    		obj['gdsCd'] = splitKey[1];
			    		obj['qntt'] = value;
			    		obj['wght'] = parseInt(value) * parseInt(jsonFilterGds.find(item => item.spmtPckgUnitCd === splitKey[1]).spcfctWght)
			    		saveData.push(obj)
			    	}else if(splitKey[0] === "D"){
			    		let obj = {...baseObj3};
			    		obj['diceSeCd'] = splitKey[1];
			    		obj['qntt'] = value;
			    		saveData.push(obj)
			    	}


			    }
			});
		})
		let postUrl = "/am/spmt/insertInvntrSttnTwo.do";


     	const postJsonPromise = gfn_postJSON(postUrl, saveData);
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

	// 재고현황2 조회
	const fn_grdInvntrSttn2Select = async function() {
		let spmtYmd = SBUxMethod.get("srch-dtp-spmtYmd");
		if(!fnDateValidate("srch-dtp-spmtYmd")){
			return;
		}
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N',
			itemCd : '1326',
			invntrYmdFrom : spmtYmd[0] ,
			invntrYmdTo : spmtYmd[1] ,
		}
		jsonJobCn.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/spmt/selectInvntrSttnTwoList.do",
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        jsonInvntrSttn2 = convertArrayToCamelCase(data.resultList);
	        //jsonInvntrSttn2 = data.resultList;
	        grdInvntrSttn2.rebuild();
	        grdInvntrSttn2.addRow();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}


	// 입고현황 저장
	const fn_grdWrhsSttnSave = async function(){
		let allData = grdWrhsSttn.getGridDataAll();
		let saveData = [];
		allData.forEach(item => {

			if(item.wrhsYmd === ""){
				return;
			}

			let gubun = "";
			if(item.delYn === "insert"){
				gubun = 'insert';
			}else if(item.delYn === "N"){
				gubun = "update";
			}
			// 재고현황 선별
			let baseObj1 = {
				wrhsYmd : item.wrhsYmd.replace(/-/g, "")
				, apcCd : gv_apcCd
				, delYn : "N"
				, gubun : gubun
				, itemCd : "1326"
				, vrtyCd : null
				, qntt : null

			}
			Object.entries(item).forEach(([key, value]) => {
				if(key === "delYn" || key === "invntrYmd" || key === "wrhsYmd"){

				}else{
					let obj = {...baseObj1};
					obj['vrtyCd'] = key;
		    		obj['qntt'] = value;
		    		saveData.push(obj)
				}
			});
		})
		let postUrl = "/am/spmt/insertWrhsSttn.do";


     	const postJsonPromise = gfn_postJSON(postUrl, saveData);
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

	// 입고현황 조회
	const fn_grdWrhsSttnSelect = async function() {
		let spmtYmd = SBUxMethod.get("srch-dtp-spmtYmd");
		if(!fnDateValidate("srch-dtp-spmtYmd")){
			return;
		}
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N',
			itemCd : '1326',
			wrhsYmdFrom : spmtYmd[0] ,
			wrhsYmdTo : spmtYmd[1] ,
		}
		jsonWrhsSttn.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/spmt/selectWrhsSttnList.do",
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        jsonWrhsSttn = convertArrayToCamelCase(data.resultList);
	        grdWrhsSttn.rebuild();
	        grdWrhsSttn.addRow();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	// 재고현황 1 저장
	const fn_rowDelete = async function(rowData,url){

     	const postJsonPromise = gfn_postJSON(url, rowData);
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

	// 상품
	const fn_setGrdGds = async function() {
		const param = {
			apcCd: gv_selectedApcCd,
			delYn: 'N'
		}
		jsonGds.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/cmns/selectSpmtPckgUnitList.do",
						param,
						null,
						true
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	jsonGds.push(item);
	        });


		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	/** camelCase FN **/
    function toCamelCase(snakeStr) {
        return snakeStr.toLowerCase().replace(/_([a-z])/g, (match, letter) => letter.toUpperCase());
    }

	function convertArrayToCamelCase(array) {
        return array.map(obj => {
            return Object.keys(obj).reduce((acc, key) => {
                const camelKey = toCamelCase(key);
                const check = key.split("_")[0];
                if(check === "P" || check === "B" || check === "G" || check === "S" || check === "D"){
                	acc[key] = obj[key];
                    return acc;
                }else{
                	acc[camelKey] = obj[key];
                    return acc;
                }
            }, {});
        });
    }
	function fnBeforeSelectTab(beforeId, selectId, selectJson){
		fn_search(selectId);
	}





</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>