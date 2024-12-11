<%
    /**
     * @Class Name : clclnCrtrMng.jsp
     * @Description : 정산기준관리 화면
     * @author SI개발부
     * @since 2024.08.31
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.08.31   	신정철			최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별실적등록 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btn-reset"
                        name="btn-reset"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="초기화"
                        onclick="fn_reset"
                ></sbux-button>
                <sbux-button
                        id="btn-search"
                        name="btn-search"
                        uitype="normal"
                        class="btn btn-sm btn-outline-dark"
                        onclick="fn_search"
                        text="조회"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <!--[APC] START -->
            <%@ include file="../../../frame/inc/apcSelect.jsp" %>
            <!--[APC] END -->
            <table class="table table-bordered tbl_fixed" style="margin-bottom: 10px;">
                <colgroup>
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 3%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 6%">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row" class="th_bg"><span class="data_required" ></span>창고구분</th>
						<td colspan="2" class="td_input" style="border-right: hidden;border-top: hidden">
							<sbux-select
								id="srch-slt-warehouseSeCd"
								name="srch-slt-warehouseSeCd"
								uitype="single"
								jsondata-ref="jsonComWarehouse"
								unselected-text="선택"
								class="form-control input-sm"
							></sbux-select>
						</td>
						<td></td>
						<th scope="row" class="th_bg"><span class="data_required" ></span>구분</th>
						<td colspan="4" class="td_input" style="border-right: hidden;border-top: hidden">
							<sbux-select
								id="srch-slt-gubun"
								name="srch-slt-gubun"
								uitype="single"
								jsondata-ref="jsonComGubun"
								unselected-text="선택"
								onchange="fn_gubunChange(srch-slt-gubun)"
							></sbux-select>
						</td>
                    </tr>
                </tbody>
            </table>
            <div class="row">
				<div class="col-sm-8">
					<div>
						<div id="sb-area-warehouse" style="height:600px;"></div>
					</div>
				</div>
				<div class="col-sm-4">
					<div  class ="row">
							<table class="table table-bordered tbl_fixed">
								<colgroup>
									<col style="width: 20%">
									<col style="width: 20%">
									<col style="width: 30%">
								</colgroup>
								<thead>
									<tr>
										<th colspan="2" scope="row" class="th_bg" style="background-color: #bdd7ee;font-weight: bold">창고</th>
										<td class="th_bg" style="font-weight: bold">
											<sbux-label id="dtl-lbl-warehouseSeCd" name="dtl-lbl-warehouseSeCd" uitype="normal" text=""></sbux-label>
										</td>
									</tr>
									<tr>
										<th colspan="2" scope="row" class="th_bg" style="background-color: #bdd7ee;font-weight: bold">위치</th>
										<td class="th_bg" style="font-weight: bold">
											<sbux-label id="dtl-lbl-strgLoctn" name="dtl-lbl-strgLoctn" uitype="normal" text=""></sbux-label>
										</td>
									</tr>
									<tr>
										<th colspan="2" scope="row" class="th_bg" style="background-color: #bdd7ee;font-weight: bold">총수량</th>
										<td class="td_input">
											<sbux-label id="dtl-lbl-totalSum" name="dtl-lbl-totalSum" uitype="normal" text=""></sbux-label>
										</td>
									</tr>
									<tr>
										<th rowspan="3" scope="row" class="th_bg">1단</th>
										<th scope="row" class="th_bg">수량</th>
										<td class="td_input">
											<sbux-label id="dtl-lbl-rowFirstQntt" name="dtl-lbl-rowFirstQntt" uitype="normal" text="123"></sbux-label>
										</td>
									</tr>
									<tr>
										<th scope="row" class="th_bg">입고일자</th>
										<td class="td_input">
											<sbux-label id="dtl-lbl-rowFirstWghYmd" name="dtl-lbl-rowFirstWrhsYmd" uitype="normal" text=""
												mask = "{ 'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
											></sbux-label>
										</td>
									</tr>
									<tr>
										<th scope="row" class="th_bg">생산자</th>
										<td class="td_input">
											<sbux-label id="dtl-lbl-rowFirstPrdcr" name="dtl-lbl-rowFirstPrdcr" uitype="normal" text=""></sbux-label>
										</td>
									</tr>
									<tr>
										<th rowspan="3" scope="row" class="th_bg">2단</th>
										<th scope="row" class="th_bg">수량</th>
										<td class="td_input">
											<sbux-label id="dtl-lbl-rowSecondQntt" name="dtl-lbl-rowSecondQntt" uitype="normal" text=""></sbux-label>
										</td>
									</tr>
									<tr>
										<th scope="row" class="th_bg">입고일자</th>
										<td class="td_input">
											<sbux-label id="dtl-lbl-rowSecondWghYmd" name="dtl-lbl-rowSecondWrhsYmd" uitype="normal" text=""
												mask = "{ 'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
											></sbux-label>
										</td>
									</tr>
									<tr>
										<th scope="row" class="th_bg">생산자</th>
										<td class="td_input">
											<sbux-label id="dtl-lbl-rowSecondPrdcr" name="dtl-lbl-rowSecondPrdcr" uitype="normal" text=""></sbux-label>
										</td>
									</tr>
									<tr>
										<th rowspan="3" scope="row" class="th_bg">3단</th>
										<th scope="row" class="th_bg">수량</th>
										<td class="td_input">
											<sbux-label id="dtl-lbl-rowThirdQntt" name="dtl-lbl-rowThirdQntt" uitype="normal" text=""></sbux-label>
										</td>
									</tr>
									<tr>
										<th scope="row" class="th_bg">입고일자</th>
										<td class="td_input">
											<sbux-label id="dtl-lbl-rowThirdWghYmd" name="dtl-lbl-rowThirdWrhsYmd" uitype="normal" text=""
												mask = "{ 'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
											></sbux-label>
										</td>
									</tr>
									<tr>
										<th scope="row" class="th_bg">생산자</th>
										<td class="td_input">
											<sbux-label id="dtl-lbl-rowThirdPrdcr" name="dtl-lbl-rowThirdPrdcr" uitype="normal" text=""></sbux-label>
										</td>
									</tr>
								</thead>
							</table>
						</div>

				</div>
			</div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">


	var jsonComWarehouse 	= []; // 창고
	var jsonComGubun = [
		{"text" : "수량합", "value" : "1"},
		{"text" : "생산자", "value" : "2"},
		{"text" : "입고일", "value" : "3"},
	];

	let rows = ['aa', 'bb', 'cc', 'dd', 'ee', 'ff'];
	let rowText = ["First", "Second", "Third"];

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    const fn_init = async function() {

    	// 검색 SB select
		let rst = await Promise.all([
		 	gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 		'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
		]);

        fn_createGrid();
    }

    var jsonWarehouse = [];
    var grdWarehouse;

    const fn_createGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-warehouse';
        SBGridProperties.id = 'grdWarehouse';
        SBGridProperties.jsonref = 'jsonWarehouse';
        SBGridProperties.fixedrowheight = '10';
        SBGridProperties.rowheight = '8';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.mergecells = 'bycol';
        SBGridProperties.columns = [
        	{caption : '',			ref : "strgLoctnCol",	width : '4%',		style : 'text-align:center; font-size:10px',	type : 'input'},
            {caption : ['A','A'],	ref : "aaQntt",		width : '8%',		style : 'text-align:center; font-size:10px',	type : 'input', merge:false},
            {caption : ['A','A'],	ref : "aaSum",		width : '8%',		style : 'text-align:center; font-size:10px',	type : 'input', },
            {caption : ['A','A'],	ref : "aaWrhsYmd",	width : '8%',		style : 'text-align:center; font-size:10px',	hidden : true, type : 'input', merge:false, format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ['A','A'],	ref : "aaPrdcrNm",	width : '8%',		style : 'text-align:center; font-size:10px',	hidden : true, type : 'input', merge:false, format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ['B','B'],	ref : "bbQntt",		width : '8%',		style : 'text-align:center; font-size:10px',	type : 'input', merge:false},
            {caption : ['B','B'],	ref : "bbSum",		width : '8%',		style : 'text-align:center; font-size:10px',	type : 'input', format : {type:'number', rule:'#,###'}},
            {caption : ['B','B'],	ref : "bbWrhsYmd",	width : '8%',		style : 'text-align:center; font-size:10px',	hidden : true, type : 'input', merge:false, format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ['B','B'],	ref : "bbPrdcrNm",	width : '8%',		style : 'text-align:center; font-size:10px',	hidden : true, type : 'input', merge:false},
            {caption : ['C','C'],	ref : "ccQntt",		width : '8%',		style : 'text-align:center; font-size:10px',	type : 'input', merge:false},
            {caption : ['C','C'],	ref : "ccSum",		width : '8%',		style : 'text-align:center; font-size:10px',	type : 'input', format : {type:'number', rule:'#,### '}},
            {caption : ['C','C'],	ref : "ccWrhsYmd",	width : '8%',		style : 'text-align:center; font-size:10px',	hidden : true, type : 'input', merge:false, format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ['C','C'],	ref : "ccPrdcrNm",	width : '8%',		style : 'text-align:center; font-size:10px',	hidden : true, type : 'input', merge:false},
            {caption : ['D','D'],	ref : "ddQntt",		width : '8%',		style : 'text-align:center; font-size:10px',	type : 'input', merge:false},
            {caption : ['D','D'],	ref : "ddSum",		width : '8%',		style : 'text-align:center; font-size:10px',	type : 'input', format : {type:'number', rule:'#,###'}},
            {caption : ['D','D'],	ref : "ddWrhsYmd",	width : '8%',		style : 'text-align:center; font-size:10px',	hidden : true, type : 'input', merge:false, format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ['D','D'],	ref : "ddPrdcrNm",	width : '8%',		style : 'text-align:center; font-size:10px',	hidden : true, type : 'input', merge:false},
            {caption : ['E','E'],	ref : "eeQntt",		width : '8%',		style : 'text-align:center; font-size:10px',	type : 'input', merge:false},
            {caption : ['E','E'],	ref : "eeSum",		width : '8%',		style : 'text-align:center; font-size:10px',	type : 'input', format : {type:'number', rule:'#,###'}},
            {caption : ['E','E'],	ref : "eeWrhsYmd",	width : '8%',		style : 'text-align:center; font-size:10px',	hidden : true, type : 'input', merge:false, format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ['E','E'],	ref : "eePrdcrNm",	width : '8%',		style : 'text-align:center; font-size:10px',	hidden : true, type : 'input', merge:false},
            {caption : ['F','F'],	ref : "ffQntt",		width : '8%',		style : 'text-align:center; font-size:10px',	type : 'input', merge:false},
            {caption : ['F','F'],	ref : "ffSum",		width : '8%',		style : 'text-align:center; font-size:10px',	type : 'input', format : {type:'number', rule:'#,###'}},
            {caption : ['F','F'],	ref : "ffWrhsYmd",	width : '8%',		style : 'text-align:center; font-size:10px',	hidden : true, type : 'input', merge:false, format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ['F','F'],	ref : "ffPrdcrNm",	width : '8%',		style : 'text-align:center; font-size:10px',	hidden : true, type : 'input', merge:false},
        ]
        grdWarehouse = _SBGrid.create(SBGridProperties);
        grdWarehouse.bind('click', 'fn_view');
    }

    const fn_view = function () {

    	let nRow = grdWarehouse.getRow();
    	let nCol = grdWarehouse.getCol();

    	if (nRow > 1) {
    		let rowData = grdWarehouse.getRowData(nRow);
        	let strgLoctnCol = rowData.strgLoctnCol;
        	let strgLoctnRow = grdWarehouse.getRefOfCol(nCol);

        	let selectRow = strgLoctnRow.substr(0,2);

        	let gridAllData = grdWarehouse.getGridDataAll();

        	let totalSum = 0;

    		let j = 0;


        	for (var i=2; i<=gridAllData.length+1; i++) {

        		let grdRowData = grdWarehouse.getRowData(i);

        		let grdStrgLoctnCol = grdRowData.strgLoctnCol;

        		if (strgLoctnCol == grdStrgLoctnCol) {
        			let qnttKey = "dtl-lbl-row" + rowText[j] + "Qntt";
        			let ymdKey = "dtl-lbl-row" + rowText[j] + "WrhsYmd";
        			let prdcrey = "dtl-lbl-row" + rowText[j] + "Prdcr";
        			let rowQnttKey = selectRow + "Qntt"
        			let rowYmdKey = selectRow + "WrhsYmd"
        			let rowPrdcrNmKey = selectRow + "PrdcrNm"

        			totalSum += parseInt(fn_zero(grdRowData[rowQnttKey], "integer"))

        			SBUxMethod.set(qnttKey, fn_zero(grdRowData[rowQnttKey]));
        			SBUxMethod.set(ymdKey, fn_zero(grdRowData[rowYmdKey]));
        			SBUxMethod.set(prdcrey, fn_zero(grdRowData[rowPrdcrNmKey]));
        			j++;
        		}
        	}

        	SBUxMethod.set("dtl-lbl-warehouseSeCd", SBUxMethod.getText("srch-slt-warehouseSeCd"))
        	SBUxMethod.set("dtl-lbl-strgLoctn", selectRow.substr(0,1).toUpperCase() + "열 " + strgLoctnCol + "행")
        	SBUxMethod.set("dtl-lbl-totalSum", fn_zero(totalSum))
    	}

    }

    const fn_zero = function (val, type) {

    	if (type == "integer") {

    		if (!gfn_isEmpty(val)) {
    			return val;
    		} else {
    			return 0;
    		}

    	} else {

	    	if (!gfn_isEmpty(val)) {
	    		if (val == "0" || val == 0) {
	    			return "";
	    		} else {
		    		return val;
	    		}
	    	} else {
	    		return "";
	    	}
    	}
    }

    const fn_reset = function (allYn = true) {

    	if (allYn) {
    		SBUxMethod.set("srch-slt-warehouseSeCd", "");
    		SBUxMethod.set("srch-slt-gubun", "");

    		jsonWarehouse.length = 0;
    		grdWarehouse.rebuild();

    	}

    	for (var i=0; i <= rowText.length; i++) {
    		let qnttKey = "dtl-lbl-row" + rowText[i] + "Qntt";
			let ymdKey = "dtl-lbl-row" + rowText[i] + "WrhsYmd";
			let prdcrey = "dtl-lbl-row" + rowText[i] + "Prdcr";

			SBUxMethod.set(qnttKey, "");
			SBUxMethod.set(ymdKey, "");
			SBUxMethod.set(prdcrey, "");
    	}

    	SBUxMethod.set("dtl-lbl-warehouseSeCd", "");
    	SBUxMethod.set("dtl-lbl-strgLoctn", "");
    	SBUxMethod.set("dtl-lbl-totalSum", "");




    }

    const fn_search = async function () {
  		let warehouseSeCd 	= SBUxMethod.get("srch-slt-warehouseSeCd");		// 창고
  		let gubun 			= SBUxMethod.get("srch-slt-gubun");				// 구분

  		if(gfn_isEmpty(warehouseSeCd)){
			gfn_comAlert("W0001", "창고");			//	W0001	{0}을/를 선택하세요.
			return;
		}

  		if(gfn_isEmpty(gubun)){
			gfn_comAlert("W0001", "구분");			//	W0001	{0}을/를 선택하세요.
			return;
		}


		const postJsonPromise = gfn_postJSON("/am/fclt/selectWarehouseCurSiList.do", {
			apcCd			: gv_selectedApcCd
		  , warehouseSeCd	: warehouseSeCd
  		});

  		try {

	        const data = await postJsonPromise;

	        if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }

      		jsonWarehouse.length = 0;

      		for (var i=1; i<12; i++) {
				let strgLoctnCol = "";

				if (i<10) {
					strgLoctnCol = "0" + i;
				} else {
					strgLoctnCol = i;
				}

				let pushFlag = false;

      			for (var j=1; j<=3; j++) {

      				let strgLoctnRow =  ("0" + j);

      				data.resultList.forEach((item, index) => {

          				if (strgLoctnCol == item.strgLoctnCol && strgLoctnRow == item.strgLoctnRow) {
        					jsonWarehouse.push({
          							apcCd 			: gv_selectedApcCd
            					  , strgLoctnCol 	: item.strgLoctnCol
            					  , strgLoctnRow 	: item.strgLoctnRow
            					  , aaPrdcrNm 		: item.aaPrdcrNm
            					  , aaWrhsYmd 		: item.aaWrhsYmd
            					  , aaQntt 			: fn_zero(item.aaQntt)
            					  , aaSum 			: fn_zero(item.aaSum)
            					  , bbPrdcrNm 		: item.bbPrdcrNm
            					  , bbWrhsYmd 		: item.bbWrhsYmd
            					  , bbQntt 			: fn_zero(item.bbQntt)
            					  , bbSum 			: fn_zero(item.bbSum)
            					  , ccPrdcrNm 		: item.ccPrdcrNm
            					  , ccWrhsYmd 		: item.ccWrhsYmd
            					  , ccQntt 			: fn_zero(item.ccQntt)
            					  , ccSum 			: fn_zero(item.ccSum)
            					  , ddPrdcrNm 		: item.ddPrdcrNm
            					  , ddWrhsYmd 		: item.ddWrhsYmd
            					  , ddQntt 			: fn_zero(item.ddQntt)
            					  , ddSum 			: fn_zero(item.ddSum)
            					  , eePrdcrNm 		: item.eePrdcrNm
            					  , eeWrhsYmd 		: item.eeWrhsYmd
            					  , eeQntt 			: fn_zero(item.eeQntt)
            					  , eeSum 			: fn_zero(item.eeSum)
            					  , ffPrdcrNm 		: item.ffPrdcrNm
            					  , ffWrhsYmd 		: item.ffWrhsYmd
            					  , ffQntt 			: fn_zero(item.ffQntt)
            					  , ffSum 			: fn_zero(item.ffSum)
            					});
        					pushFlag = true;
        					return;
          				}
          			});

      				if (!pushFlag) {

      					jsonWarehouse.push({
      						apcCd 			: gv_selectedApcCd
      					  , strgLoctnCol 	: strgLoctnCol
      					  , strgLoctnRow 	: strgLoctnRow
      					  , aaPrdcrNm 		: ""
      					  , aaWrhsYmd 		: ""
      					  , aaQntt 			: ""
      					  , aaSum 			: ""
      					  , bbPrdcrNm 		: ""
      					  , bbWrhsYmd 		: ""
      					  , bbQntt 			: ""
      					  , bbSum 			: ""
      					  , ccPrdcrNm 		: ""
      					  , ccWrhsYmd 		: ""
      					  , ccQntt 			: ""
      					  , ccSum 			: ""
      					  , ddPrdcrNm 		: ""
      					  , ddWrhsYmd 		: ""
      					  , ddQntt 			: ""
      					  , ddSum 			: ""
      					  , eePrdcrNm 		: ""
      					  , eeWrhsYmd 		: ""
      					  , eeQntt 			: ""
      					  , eeSum 			: ""
      					  , ffPrdcrNm 		: ""
      					  , ffWrhsYmd 		: ""
      					  , ffQntt 			: ""
      					  , ffSum 			: ""
      					})
						pushFlag = false;
      				}
      			}
      		}



          	grdWarehouse.rebuild();

          	fn_gubunChange(gubun);

          	fn_reset(false)

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}

    }
    function formatDateWithDay(date) {
        const month = date.getMonth() + 1;
        const day = date.getDate();

        const daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
        const dayOfWeek = daysOfWeek[date.getDay()];

        return `${'${month}/${day} ${dayOfWeek}'}`
    }

    const fn_gubunChange = function (gubun) {


    	if (gubun == "1") {

    		for (var i=0; i<rows.length; i++) {

    			let wrhsYmdKey = rows[i] + "WrhsYmd";
    			let prdcrNmKey = rows[i] + "PrdcrNm";
    			let sumKey = rows[i] + "Sum";

    			let wrhsYmdCol = grdWarehouse.getColRef(wrhsYmdKey)
    			let prdcrNmCol = grdWarehouse.getColRef(prdcrNmKey)
    			let sumCol = grdWarehouse.getColRef(sumKey)

	    		grdWarehouse.setColHidden(wrhsYmdCol, true, true);
	    		grdWarehouse.setColHidden(prdcrNmCol, true, true);
	    		grdWarehouse.setColHidden(sumCol, false, true);
    		}
    	}
    	if (gubun == "2") {

    		for (var i=0; i<rows.length; i++) {

    			let wrhsYmdKey = rows[i] + "WrhsYmd";
    			let prdcrNmKey = rows[i] + "PrdcrNm";
    			let sumKey = rows[i] + "Sum";

    			let wrhsYmdCol = grdWarehouse.getColRef(wrhsYmdKey)
    			let prdcrNmCol = grdWarehouse.getColRef(prdcrNmKey)
    			let sumCol = grdWarehouse.getColRef(sumKey)

	    		grdWarehouse.setColHidden(wrhsYmdCol, true, true);
	    		grdWarehouse.setColHidden(prdcrNmCol, false, true);
	    		grdWarehouse.setColHidden(sumCol, true, true);

    		}

    	}
    	if (gubun == "3") {

    		for (var i=0; i<rows.length; i++) {

    			let wrhsYmdKey = rows[i] + "WrhsYmd";
    			let prdcrNmKey = rows[i] + "PrdcrNm";
    			let sumKey = rows[i] + "Sum";

    			let wrhsYmdCol = grdWarehouse.getColRef(wrhsYmdKey)
    			let prdcrNmCol = grdWarehouse.getColRef(prdcrNmKey)
    			let sumCol = grdWarehouse.getColRef(sumKey)

	    		grdWarehouse.setColHidden(wrhsYmdCol, false, true);
	    		grdWarehouse.setColHidden(prdcrNmCol, true, true);
	    		grdWarehouse.setColHidden(sumCol, true, true);

    		}

    	}

    }

    function getDateRange(date) {
        const result = [];
        const startDate = new Date(date);

        for (let i = -3; i <= 3; i++) {
            const currentDate = new Date(startDate);
            currentDate.setDate(startDate.getDate() + i);
            result.push(formatDateWithDay(currentDate));
            result.push(formatDateWithDay(currentDate));
        }

        return result;
    }
    const fn_onchangeYmd = function(){
        const givenDate = '2024-10-15'; // 주어진 날짜
        const dateRange = getDateRange(givenDate);
        dateRange.push("재고");
        dateRange.unshift("구분");
        console.log(dateRange,"날짜 포맷팅한거 받은거");
        console.log(grdReport.getCaption('array'));

        let prevCaptions = grdReport.getCaption('array')[1];
        let caption = prevCaptions.map((item,index) => [dateRange[index],item]);

        console.log(caption,"포맷끝");
        /** 근본적인 해결이 아님
         * rebuild 하면 원복 단순 조회 페이지니깐 json data바인딩 후에 caption만 바꾸는걸로 **/
        grdReport.setCaption(caption);
        // grdReport.setCaption([newCaptions,newArray]);
        // grdReport.rebuild();
    }



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>