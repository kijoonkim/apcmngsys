
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
                    <sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
                    </sbux-label>
				</div>
				<div style="margin-left: auto;">


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

			<div class="box-body srch-keyup-area">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 2%">

						<col style="width: 5%">
						<col style="width: 4%">
						<col style="width: 3%">
						<col style="width: 4%">
						<col style="width: 3%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>

							<th scope="row" class="th_bg">품목</th>
							<td class="td_input">
								<sbux-select uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem" readonly></sbux-select>
							</td>
							<th colspan="2" scope="row" class="th_bg"><span class="data_required"></span>선별일자</th>
							<td colspan="2" class="td_input"style="border-right: hidden;">

								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-inptYmdFrom"
									name="srch-dtp-inptYmdFrom"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-inptYmdFrom)"
								></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-inptYmdTo"
									name="srch-dtp-inptYmdTo"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-inptYmdTo)"
								></sbux-datepicker>
							</td>

						</tr>
					</tbody>
				</table>

				<div class="ad_tbl_top2">

							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">선별내역집계</span>
								</li>
							</ul>
						<div class="ad_tbl_top" style="margin-bottom: 10px; text-align:right">
							<sbux-button
								id="btnSortReq"
								name="btnSortReq"
								uitype="normal"
								class="btn btn-sm btn-outline-danger"
								onclick="fn_sortReq"
								text="정보재수신"
							></sbux-button>
						</div>
						<div id="sb-area-sortDsctnTot" style="height:544px;"></div>

				</div>
			</div>

	</section>
	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>
</body>

<script type="text/javascript">

	var jsonComItem				= [];	// 품목 		itemCd			검색

	window.addEventListener('DOMContentLoaded', async function(e) {

		fn_init();

	})

	const fn_init = async function() {

		SBUxMethod.set("dtl-inp-apcCd", gv_selectedApcNm);
		SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
		fn_createSortDsctnTot();
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd),										// 품목
		]);
		fn_search();
	}




	//그리드 id, 그리드 json
	//선별내역집계
	var grdSortDsctnTot;

	//선별내역집계
	var jsonSortDsctnTot = [];


	const fn_createSortDsctnTot = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-sortDsctnTot';
	    SBGridProperties.id = 'grdSortDsctnTot';
	    SBGridProperties.jsonref = 'jsonSortDsctnTot';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
	    SBGridProperties.total = {
				type: 'subgrand',
				position: 'bottom',
				columns: {
					standard: [2],
					sum: [3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
				},
		  subtotalrow : {
		      2 : {
		          titlecol 	: 3,
		          titlevalue	: '@ 소계',
		          style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
		          stylestartcol	: 3
		      }

		  },
			grandtotalrow : {
				titlecol: 3,
				titlevalue: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				1: '#,###',
				// 2: '#,###',
				//3: '#,###',
				4: '#,###',
			}
		};
	    SBGridProperties.columns = [
	    	{caption : [],	ref : 'checkedYn',		width : '40px',	style : 'text-align:center',	type : 'radio', 			typeinfo : {checkedvalue : 'yes', uncheckedvalue : 'false'}},
	    	{caption : ["선별일자","선별일자"], ref: 'inptYmd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled:true  },
	    	{caption: ["등급","등급"],    		ref: 'grd',     	type: 'input', width:'50px', 	style: 'text-align:center', disabled:true},
	    	{caption : ["구분","구분"], ref: 'prdcrNm', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;', disabled:true},
	    	{caption : ["빨강","2XL"], ref: 'redV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["빨강","XL"], ref: 'redV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["빨강","L"], ref: 'redV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["빨강","M"], ref: 'redV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["빨강","S"], ref: 'redV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["빨강","2S"], ref: 'redV6', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["빨강","소계"], ref: 'redSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff;'
	    							, format : {type:'number', rule:'#,###'}, fixedstyle : 'background-color:#ceebff;', disabled:true},
	    	{caption : ["노랑","2XL"], ref: 'ylwV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["노랑","XL"], ref: 'ylwV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["노랑","L"], ref: 'ylwV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["노랑","M"], ref: 'ylwV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["노랑","S"], ref: 'ylwV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["노랑","2S"], ref: 'ylwV6', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["노랑","소계"], ref: 'ylwSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff'
	    							, format : {type:'number', rule:'#,###'},fixedstyle : 'background-color:#ceebff;', disabled:true},
	    	{caption : ["주황","2XL"], ref: 'orngV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["주황","XL"], ref: 'orngV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["주황","L"], ref: 'orngV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["주황","M"], ref: 'orngV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["주황","S"], ref: 'orngV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["주황","2S"], ref: 'orngV6', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["주황","소계"], ref: 'orngSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff '
	    							, format : {type:'number', rule:'#,###'},fixedstyle : 'background-color:#ceebff;', disabled:true},

	    	{caption : ["총합계","총합계"], ref: 'totSum', type: 'input',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}, disabled:true},
	    	{caption : ["비고","비고"], ref: 'rmrk', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', disabled:true},
	    	{caption: ["생산자코드"],	ref: 'prdcrCd',     		type:'input',  	hidden: true}


	    ];
	    grdSortDsctnTot = _SBGrid.create(SBGridProperties);
	    grdSortDsctnTot.bind('click', 'fnClick')


	}

	function fnClick(){
		this.inputmode = 'none';
	}




	// 선별구분
	const fn_setSortDsctnTot = async function() {
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		const param = {
			apcCd: gv_selectedApcCd,
			inptYmdFrom: inptYmdFrom,
			inptYmdTo: inptYmdTo,
			itemCd: itemCd
		}
		jsonSortDsctnTot.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/sort/selectDsctnTotList.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	const SortDsctnTot = {
	        			grd     : item.grd
	        		,	prdcrNm : item.prdcrNm
	        	    ,   prdcrCd : item.prdcrCd
	        	    ,   inptYmd : item.inptYmd
	        	    ,   redV1 : item.red2Xl
	        	    ,   redV2 : item.redXl
	        	    ,   redV3 : item.redL
	        	    ,   redV4 : item.redM
	        	    ,   redV5 : item.redS
	        	    ,   redV6 : item.redSs
	        	    ,   redSbTot : item.redTot
	        	    ,   ylwV1 : item.ylw2Xl
	        	    ,   ylwV2 : item.ylwXl
	        	    ,   ylwV3 : item.ylwL
	        	    ,   ylwV4 : item.ylwM
	        	    ,   ylwV5 : item.ylwS
	        	    ,   ylwV6 : item.ylwSs
	        	    ,   ylwSbTot : item.ylwTot
	        	    ,   orngV1 : item.org2Xl
	        	    ,   orngV2 : item.orgXl
	        	    ,   orngV3 : item.orgL
	        	    ,   orngV4 : item.orgM
	        	    ,   orngV5 : item.orgS
	        	    ,   orngV6 : item.orgSs
	        	    ,   orngSbTot : item.orgTot
	        	    ,   totSum   : item.tot


	        	}
	        	jsonSortDsctnTot.push(SortDsctnTot);
	        });


	        const allData = grdSortDsctnTot.getGridDataAll();


	        grdSortDsctnTot.refresh();
	        grdSortDsctnTot.setCellStyles(0,4,0,9,'background:#FF0000');
			grdSortDsctnTot.setCellStyles(0,10,0,16,'background:#FFFC33');
			grdSortDsctnTot.setCellStyles(0,17,0,22,'background:#FFB533');

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	const fn_search = async function () {

		fn_setSortDsctnTot();

	}

	const fn_dtpChange = function(){
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		if(gfn_diffDate(inptYmdFrom, inptYmdTo) < 0){
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld,			//콜백함수명
        }
    };

     // 엑셀 다운로드
     function fn_excelDwnld() {
    	 grdSortDsctnTot.exportLocalExcel("입고내역집계", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
     }

     /**
      * @name fn_docSortDsctnTot
      * @description 선별집계내역 발행 버튼
      */
 	const fn_docSortDsctnTot = function() {

 		const grdSortDsctnTotList = [];
 		const allData = grdSortDsctnTot.getGridDataAll();
 		allData.forEach((item, index) => {
 			if (item.checkedYn === "yes") {
 					grdSortDsctnTotList.push(
 						item.prdcrCd
 						, item.inptYmd
 					);
 				}

 		});
 		if (grdSortDsctnTotList.length === 0) {
 			gfn_comAlert("W0005", "선택대상");		//	W0005	{0}이/가 없습니다.
 			return;
 		}
 		const list = grdSortDsctnTotList.join("','");

 		gfn_popClipReport("입고확인서", "am/popSortDsctnTot.crf", {apcCd: gv_selectedApcCd, prdcrCd : grdSortDsctnTotList[0] , inptYmd : grdSortDsctnTotList[1]});
 	}

 	const fn_sortReq = async function() {

		const param = {
			apcCd: gv_selectedApcCd,
			linkKnd: 'S',
			sortReqYn: 'Y'
		}

		try {
			const postJsonPromise = gfn_postJSON(
						"/am/apc/updateApcLink.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

</script>
</html>