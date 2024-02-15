
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
							<th colspan="2" scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
							<td colspan="2" class="td_input"style="border-right: hidden;">

								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wrhsYmdFrom"
									name="srch-dtp-wrhsYmdFrom"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)"
								></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wrhsYmdTo"
									name="srch-dtp-wrhsYmdTo"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wrhsYmdTo)"
								></sbux-datepicker>
							</td>

						</tr>
					</tbody>
				</table>

				<div class="row">

						<div class="ad_tbl_top" style="margin-bottom: 10px;">
							<ul class="ad_tbl_count" style="width: 100%">
								<li>
									<span style="font-size:12px">입고내역집계</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-wrhsDsctnTot" style="height:401px;"></div>

				</div>
			</div>

	</section>
</body>

<script type="text/javascript">

	var jsonComItem				= [];	// 품목 		itemCd			검색

	window.addEventListener('DOMContentLoaded', async function(e) {

		fn_init();

	})

	const fn_init = async function() {

		SBUxMethod.set("dtl-inp-apcCd", gv_selectedApcNm);
		SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
		fn_createWrhsDsctnTot();
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd),										// 품목
		]);
		fn_search();
	}




	//그리드 id, 그리드 json
	//입고내역집계
	var grdWrhsDsctnTot;

	//입고내역집계
	var jsonWrhsDsctnTot = [];


	const fn_createWrhsDsctnTot = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-wrhsDsctnTot';
	    SBGridProperties.id = 'grdWrhsDsctnTot';
	    SBGridProperties.jsonref = 'jsonWrhsDsctnTot';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'none';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
	    SBGridProperties.total = {
				type: 'grand',
				position: 'bottom',
				columns: {
				standard: [0],
				sum: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19],
			},
			grandtotalrow : {
				titlecol: 0,
				titlevalue: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				1: '#,###',
				2: '#,###',
				3: '#,###',
				4: '#,###',
			}
		};
	    SBGridProperties.columns = [
	    	{caption : ["구분","구분"], ref: 'prdcrNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["빨강","1차"], ref: 'redV1', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["빨강","2차"], ref: 'redV2', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["빨강","3차"], ref: 'redV3', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["빨강","4차"], ref: 'redV4', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["빨강","5차"], ref: 'redV5', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["빨강","소계"], ref: 'redSbTot', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff;', format : {type:'number', rule:'#,###'}, fixedstyle : 'background-color:#ceebff;'},

	    	{caption : ["노랑","1차"], ref: 'ylwV1', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["노랑","2차"], ref: 'ylwV2', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["노랑","3차"], ref: 'ylwV3', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["노랑","4차"], ref: 'ylwV4', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["노랑","5차"], ref: 'ylwV5', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["노랑","소계"], ref: 'ylwSbTot', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff', format : {type:'number', rule:'#,###'},fixedstyle : 'background-color:#ceebff;'},

	    	{caption : ["주황","1차"], ref: 'orngV1', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["주황","2차"], ref: 'orngV2', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["주황","3차"], ref: 'orngV3', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["주황","4차"], ref: 'orngV4', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["주황","5차"], ref: 'orngV5', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["주황","소계"], ref: 'orngSbTot', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff ', format : {type:'number', rule:'#,###'},fixedstyle : 'background-color:#ceebff;'},

	    	{caption : ["총합계","총합계"], ref: 'totSum', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["비고","비고"], ref: 'rmrk', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;'}

	    ];
	    grdWrhsDsctnTot = _SBGrid.create(SBGridProperties);


	}






	// 입고구분
	const fn_setWrhsDsctnTot = async function() {
		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		const param = {
			apcCd: gv_selectedApcCd,
			wrhsYmdFrom: wrhsYmdFrom,
			wrhsYmdTo: wrhsYmdTo,
			itemCd: itemCd
		}
		jsonWrhsDsctnTot.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/wrhs/selectDsctnTotList.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	const WrhsDsctnTot = {
	        			prdcrNm : item.prdcrNm
	        		,	redV1 : item.r1
	        		,	redV2 : item.r2
	        		,	redV3 : item.r3
	        		,	redV4 : item.r4
	        		,	redV5 : item.r5
	        		,	redSbTot : item.rt
	        		,	ylwV1 : item.y1
	        		,	ylwV2 : item.y2
	        		,	ylwV3 : item.y3
	        		,	ylwV4 : item.y4
	        		,	ylwV5 : item.y5
	        		,	ylwSbTot : item.yt
	        		,	orngV1 : item.o1
	        		,	orngV2 : item.o2
	        		,	orngV3 : item.o3
	        		,	orngV4 : item.o4
	        		,	orngV5 : item.o5
	        		,	orngSbTot : item.ot
	        		,	totSum : item.tot
	        	}
	        	jsonWrhsDsctnTot.push(WrhsDsctnTot);
	        });

	        grdWrhsDsctnTot.refresh();
	        grdWrhsDsctnTot.setCellStyles(0,1,0,6,'background:#FF0000');
			grdWrhsDsctnTot.setCellStyles(0,7,0,12,'background:#FFFC33');
			grdWrhsDsctnTot.setCellStyles(0,13,0,18,'background:#FFB533');

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	const fn_search = async function () {

		fn_setWrhsDsctnTot();

	}

	const fn_dtpChange = function(){
		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
		if(gfn_diffDate(wrhsYmdFrom, wrhsYmdTo) < 0){
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
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
    	 grdWrhsDsctnTot.exportLocalExcel("입고내역집계", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
     }

</script>
</html>