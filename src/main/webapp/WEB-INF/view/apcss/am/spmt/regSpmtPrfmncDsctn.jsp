<%
 /**
  * @Class Name : regSpmtPrfmnc.jsp
  * @Description : 출하실적등록 화면
  * @author SI개발부
  * @since 2024.04.01
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.04.01   	김호			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 파프리카출하실적등록</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
  <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 파프리카출하실적등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnDelete"
						name="btnDelete"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_delete"
						text="삭제"
					></sbux-button>
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						text="저장"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_save"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						text="재고조회"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">
        		<!--[pp] 검색 -->
        		<!--[APC] START -->
          		<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>선별일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-inptYmdFrom"
									name="srch-dtp-inptYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-inptYmdFrom)"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-inptYmdTo"
									name="srch-dtp-inptYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-inptYmdTo)"
								></sbux-datepicker>
							</td>
							<td class="td_input"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>출하일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-spmtYmd"
									name="srch-dtp-spmtYmd"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-spmtYmdFrom)"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
							</td>
							<td class="td_input"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
					                uitype="single"
					                id="srch-slt-grd"
					                name="srch-slt-grd"
					                class="form-control input-sm input-sm-ast inpt_data_reqed"
					                unselected-text="선택"
					                jsondata-ref="jsonGrd"
					                onchange="fn_onChangeSrchGrd(this)"
				                ></sbux-select>
							</td>
							<td colspan="2" class="td_input"></td>
            			</tr>
					</tbody>
				</table>
		        <!--[pp] //검색 -->
		        <!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>선별재고 내역</span></li>
					</ul>
				</div>
				<div>
					<div id="sb-area-sortInvntr" style="height:137px; width:100%;"></div>
				</div>

				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>상품재고 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnAdd" name="btnAdd" uitype="normal" text="행추가" class="btn btn-xs btn-outline-danger" onclick="fn_addRow" disabled></sbux-button>&nbsp;
						<sbux-button id="btnDel" name="btnDel" uitype="normal" text="행삭제" class="btn btn-xs btn-outline-danger" onclick="fn_delRow" disabled></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-gdsInvntr" style="height:400px;"></div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonGrdCnptCd	= [];
	var grdSrotInvntr;
	var grdGdsInvntr;
 	var jsonGrd		= [
	    {'text' : 'A품', 'value' : 'A' },
	    {'text' : 'B품', 'value' : 'B' },
	    {'text' : 'C품', 'value' : 'C' },
  	];
  	var jsonGrdCnptCd = [];

	window.addEventListener('DOMContentLoaded', async function(e) {

	    SBUxMethod.set('srch-dtp-inptYmdFrom', gfn_dateToYmd(new Date()));
	    SBUxMethod.set('srch-dtp-inptYmdTo', gfn_dateToYmd(new Date()));
	    SBUxMethod.set('srch-dtp-spmtYmd', gfn_dateToYmd(new Date()));
	    fn_initSBSelect();

	})

	const fn_initSBSelect = async function() {
	    let rst = await Promise.all([
	      gfn_setCpntSBSelect('grdGdsInvntr',		jsonGrdCnptCd, 	gv_selectedApcCd),
	    ])

	    fn_createSmptPrfmncGrid();
  	}

	var jsonSortInvntr = []; 	// 선별재고내역 Json
	var jsonGdsInvntr = []; 	// 재고내역 Json
	const fn_createSmptPrfmncGrid = async function() {
        var SBGridPropertiesSortInvntr = {};
        SBGridPropertiesSortInvntr.parentid = 'sb-area-sortInvntr';
        SBGridPropertiesSortInvntr.id = 'grdSortInvntr';
        SBGridPropertiesSortInvntr.jsonref = 'jsonSortInvntr';
        SBGridPropertiesSortInvntr.emptyrecords = '데이터가 없습니다.';
        SBGridPropertiesSortInvntr.selectmode = 'free';
        //SBGridPropertiesSortInvntr.extendlastcol = 'scroll';
        SBGridPropertiesSortInvntr.scrollbubbling = false;
        SBGridPropertiesSortInvntr.oneclickedit = true;
        SBGridPropertiesSortInvntr.allowcopy = true;
        var comlumns = [];
        comlumns.push(
            {caption : ["구분", "구분"], ref: 'gubun', type: 'output',  width:'210px', style: 'text-align:center;'},
        )
        comlumns.push(
            {caption : ["빨강","2XL"], 	ref: 'redV1', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px;', disabled:true},
            {caption : ["빨강","XL"], 	ref: 'redV2', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px;',   disabled:true},
            {caption : ["빨강","L"], 	ref: 'redV3', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px;',   disabled:true},
            {caption : ["빨강","M"], 	ref: 'redV4', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px;',   disabled:true},
            {caption : ["빨강","S"], 	ref: 'redV5', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px;',   disabled:true},
            {caption : ["빨강","2S"], 	ref: 'redV6', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px;',   disabled:true},
            {caption : ["빨강","소계"], ref: 'redSbTot', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px;background-color:#ceebff;'
                        ,fixedstyle : 'background-color:#ceebff;', disabled:true},
            {caption : ["노랑","2XL"], 	ref: 'ylwV1', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px; ', disabled:true},
            {caption : ["노랑","XL"], 	ref: 'ylwV2', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px; ', disabled:true},
            {caption : ["노랑","L"], 	ref: 'ylwV3', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px; ', disabled:true},
            {caption : ["노랑","M"], 	ref: 'ylwV4', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px; ', disabled:true},
            {caption : ["노랑","S"], 	ref: 'ylwV5', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px; ', disabled:true},
            {caption : ["노랑","2S"], 	ref: 'ylwV6', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px; ', disabled:true},
            {caption : ["노랑","소계"], ref: 'ylwSbTot', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px;background-color:#ceebff'
                        ,fixedstyle : 'background-color:#ceebff;', disabled:true},
            {caption : ["주황","2XL"], 	ref: 'ornV1', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px; ', disabled:true},
            {caption : ["주황","XL"], 	ref: 'ornV2', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px; ', disabled:true},
            {caption : ["주황","L"], 	ref: 'ornV3', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px; ', disabled:true},
            {caption : ["주황","M"], 	ref: 'ornV4', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px; ', disabled:true},
            {caption : ["주황","S"], 	ref: 'ornV5', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px; ', disabled:true},
            {caption : ["주황","2S"], 	ref: 'ornV6', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px; ', disabled:true},
            {caption : ["주황","소계"], ref: 'ornSbTot', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px;background-color:#ceebff '
                        ,fixedstyle : 'background-color:#ceebff;', disabled:true},
            {caption : ["총합계","총합계"], ref: 'totSum', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', disabled:true},
            {caption : ["비고","비고"], ref: 'rmrk', type: 'output',  width:'50px', style: 'text-align:left;'},
        )

        SBGridPropertiesSortInvntr.columns = comlumns;

        grdSortInvntr = _SBGrid.create(SBGridPropertiesSortInvntr);

        var SBGridPropertiesGdsInvntr = {};
        SBGridPropertiesGdsInvntr.parentid = 'sb-area-gdsInvntr';
        SBGridPropertiesGdsInvntr.id = 'grdGdsInvntr';
        SBGridPropertiesGdsInvntr.jsonref = 'jsonGdsInvntr';
        SBGridPropertiesGdsInvntr.emptyrecords = '데이터가 없습니다.';
        SBGridPropertiesGdsInvntr.selectmode = 'free';
        //SBGridPropertiesGdsInvntr.extendlastcol = 'scroll';
        SBGridPropertiesGdsInvntr.scrollbubbling = false;
        SBGridPropertiesGdsInvntr.oneclickedit = true;
        SBGridPropertiesGdsInvntr.allowcopy = true;
        SBGridPropertiesGdsInvntr.total = {
        		  type 		: 'grand',
        		  position	: 'bottom',
        		  columns		: {
        		      standard : [1,2],
        		      sum : [3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24],
        		  },
        		  grandtotalrow : {
        		      titlecol 	: 2,
        		      titlevalue	: '합계',
        		      style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
        		      stylestartcol	: 1
        		  },
        		  datasorting	: true,
        		  usedecimal : false,
        		};
        SBGridPropertiesGdsInvntr.columns = [
			{caption : ["재고내역", "재고내역", "재고내역"], 		ref: 'checkBox', 	type: 'checkbox',  	width:'30px', 	style: 'text-align:center;',
				typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}},
			{caption : ["재고내역", "재고내역", "재고내역"], 	ref: 'spmtYmd', 	width: '80px', type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'},
				typeinfo : {gotoCurrentClick: true, clearbutton: true},  style:'text-align:center'},
			{caption : ["재고내역", "재고내역", "재고내역"], 	ref: 'cnptCd', 		type: 'combo',  	width:'100px', 	style: 'text-align:center;',
				typeinfo : {ref:'jsonGrdCnptCd', 	displayui : false,	itemcount: 10, label:'label', value:'value', unselect: {label : '선택', value: ''}}},
			{caption : ["빨강","2XL"," "], 	ref: 'red2Xl', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["빨강","XL",""], 	ref: 'redXl', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["빨강","L"," "], 	ref: 'redL', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["빨강","M",""], 	ref: 'redM', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["빨강","S"," "], 	ref: 'redS', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["빨강","2S",""], 	ref: 'redSs', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["빨강","소계"," "], ref: 'redTot', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px;background-color:#ceebff;'
			            , format : {type:'number', rule:'#,###',emptyvalue:'0'}, fixedstyle : 'background-color:#ceebff;', disabled:true},
			{caption : ["노랑","2XL",""], 	ref: 'ylw2Xl', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["노랑","XL"," "], 	ref: 'ylwXl', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["노랑","L",""], 	ref: 'ylwL', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["노랑","M"," "], 	ref: 'ylwM', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["노랑","S",""], 	ref: 'ylwS', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["노랑","2S"," "], 	ref: 'ylwSs', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["노랑","소계",""], ref: 'ylwTot', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px;background-color:#ceebff'
			            , format : {type:'number', rule:'#,###',emptyvalue:'0'},fixedstyle : 'background-color:#ceebff;', disabled:true},
			{caption : ["주황","2XL"," "], 	ref: 'orn2Xl', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["주황","XL",""], 	ref: 'ornXl', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["주황","L"," "], 	ref: 'ornL', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["주황","M",""], 	ref: 'ornM', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["주황","S"," "], 	ref: 'ornS', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["주황","2S",""], 	ref: 'ornSs', type: 'input',  width:'45px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["주황","소계"," "], ref: 'ornTot', type: 'output',  width:'45px', style: 'text-align:right; padding-right:5px;background-color:#ceebff '
			            , format : {type:'number', rule:'#,###',emptyvalue:'0'},fixedstyle : 'background-color:#ceebff;', disabled:true},
			{caption : ["총합계","총합계", ""], ref: 'tot', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}, disabled:true},
			{caption : ["송품장<br>발행", "송품장<br>발행", "송품장<br>발행"], 			ref: 'spmtno',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_docSpmt(" + nRow + ")'>발행</button>";
	        	}
	        }},
	        {caption : ["비고","비고", "비고"], ref: 'rmrk', type: 'output',  width:'50px', style: 'text-align:left;'},
        ];

        grdGdsInvntr = _SBGrid.create(SBGridPropertiesGdsInvntr);
        grdGdsInvntr.bind('valuechanged', 'fn_grdValueChanged');
        fn_gridColor();
    }

	const fn_gridColor = async function() {
		grdSortInvntr.setCellStyles(0,1,0,7,'background:#FF000030');
    	grdSortInvntr.setCellStyles(0,8,0,15,'background:#FFFC3330');
    	grdSortInvntr.setCellStyles(0,15,0,21,'background:#FFB53330');
    	grdGdsInvntr.setCellStyles(0,1,0,7,'background:#FF000030');
    	grdGdsInvntr.setCellStyles(0,8,0,15,'background:#FFFC3330');
    	grdGdsInvntr.setCellStyles(0,15,0,21,'background:#FFB53330');
    	grdGdsInvntr.setCellStyles(2,1,2,25,'text-align:right; padding-right:5px; font-weight:1200;');
    	grdGdsInvntr.setCellStyles(2,1,2,8,'background:#FFF8DC30;');
    	grdGdsInvntr.setCellStyles(2,10,2,15,'background:#FFF8DC30;');
    	grdGdsInvntr.setCellStyles(2,17,2,22,'background:#FFF8DC30;');

	}

	const fn_search = async function(){
	    let flag 		= true;
	    let grdFlag 	= true;
	    let sumFlag 	= true;
	    let grdGubun 	= SBUxMethod.get("srch-slt-grd");

	    if (gfn_isEmpty(grdGubun)) {
	        gfn_comAlert("W0001", "구분");				//	W0002	{0}을/를 선택하세요.
            return false;
      	}

	    flag = await fn_setGrdSrtInvntr();
	    if (flag){
	    	grdFlag = await fn_setGrdGdsInvntrList();
	    }
	    if (grdFlag) {
	    	await fn_setGrdGdsInvntr();
	    }
	    if (sumFlag) {
	    	await fn_reSum();
	    }

	    SBUxMethod.attr('btnAdd', 'disabled', 'false');
		SBUxMethod.attr('btnDel', 'disabled', 'false');
		fn_gridColor();
	}

	const fn_onChangeSrchGrd = async function (gubun) {

		jsonGdsInvntr.length = 0;
		jsonSortInvntr.length = 0;
		grdGdsInvntr.rebuild();
		grdSortInvntr.rebuild();

		SBUxMethod.attr('btnAdd', 'disabled', 'true');
		SBUxMethod.attr('btnDel', 'disabled', 'true');
		fn_gridColor();

	}


	const fn_setGrdSrtInvntr = async function(){
	    let grdGubun 		= SBUxMethod.get("srch-slt-grd");
	    let grdGubunText 	= SBUxMethod.getText("srch-slt-grd");
	    let inptYmdFrom 	= SBUxMethod.get("srch-dtp-inptYmdFrom");
	    let inptYmdTo 		= SBUxMethod.get("srch-dtp-inptYmdTo");
	    let itemCd 			= '1326';
	    let apcCd			= gv_selectedApcCd;

		if (gfn_isEmpty(grdGubun)) {
	        gfn_comAlert("W0001", "구분");				//	W0002	{0}을/를 선택하세요.
            return false;
      	}
    	const postJsonPromise = gfn_postJSON("/am/sort/selectSortDsctn.do", {
				apcCd			: apcCd
			,	itemCd			: itemCd
			,	grdGubun		: grdGubun
			, 	inptYmdFrom		: inptYmdFrom
			, 	inptYmdTo		: inptYmdTo
		});

        const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
              	jsonSortInvntr.length = 0;
                data.resultList.forEach((item, index) => {
                	const sortInvntr = {
	                    	gubun	: '선별내역'
	                  	, 	grd     : item.grd
	                  	,   redV1 	: fn_zero(item.red2Xl)
	                  	,   redV2 	: fn_zero(item.redXl)
	                  	,   redV3 	: fn_zero(item.redL)
	                  	,   redV4 	: fn_zero(item.redM)
	                  	,   redV5 	: fn_zero(item.redS)
	                  	,   redV6 	: fn_zero(item.redSs)
	                  	,   redSbTot : fn_zero(item.redTot)
	                  	,   ylwV1 	: fn_zero(item.ylw2Xl)
	                  	,   ylwV2 	: fn_zero(item.ylwXl)
	                  	,   ylwV3 	: fn_zero(item.ylwL)
	                  	,   ylwV4 	: fn_zero(item.ylwM)
	                  	,   ylwV5 	: fn_zero(item.ylwS)
	                  	,   ylwV6 	: fn_zero(item.ylwSs)
	                  	,   ylwSbTot : fn_zero(item.ylwTot)
	                  	,   ornV1 	: fn_zero(item.org2Xl)
	                  	,   ornV2 	: fn_zero(item.orgXl)
	                  	,   ornV3 	: fn_zero(item.orgL)
	                  	,   ornV4 	: fn_zero(item.orgM)
	                  	,   ornV5 	: fn_zero(item.orgS)
	                  	,   ornV6 	: fn_zero(item.orgSs)
	                  	,   ornSbTot : fn_zero(item.orgTot)
	                  	,   totSum   : fn_zero(item.tot)
	            	}
	          		jsonSortInvntr.push(sortInvntr);

	                const percentage = {
	                    	  gubun		: '(백분율)'
	                  	  ,	  grd     	: item.grd
		                  ,   redV1 	: fn_percentage(item.red2Xl, item.redTot)
		                  ,   redV2 	: fn_percentage(item.redXl, item.redTot)
		                  ,   redV3 	: fn_percentage(item.redL, item.redTot)
		                  ,   redV4 	: fn_percentage(item.redM, item.redTot)
		                  ,   redV5 	: fn_percentage(item.redS, item.redTot)
		                  ,   redV6 	: fn_percentage(item.redSs, item.redTot)
		                  ,   redSbTot : gfn_isEmpty(item.redTot) ? "" : 100 + '%'
		                  ,   ylwV1 	: fn_percentage(item.ylw2Xl, item.ylwTot)
		                  ,   ylwV2 	: fn_percentage(item.ylwXl, item.ylwTot)
		                  ,   ylwV3 	: fn_percentage(item.ylwL, item.ylwTot)
		                  ,   ylwV4 	: fn_percentage(item.ylwM, item.ylwTot)
		                  ,   ylwV5 	: fn_percentage(item.ylwS, item.ylwTot)
		                  ,   ylwV6 	: fn_percentage(item.ylwSs, item.ylwTot)
		                  ,   ylwSbTot : gfn_isEmpty(item.ylwTot) ? "" : 100 + '%'
		                  ,   ornV1 	: fn_percentage(item.org2Xl, item.orgTot)
		                  ,   ornV2 	: fn_percentage(item.orgXl, item.orgTot)
		                  ,   ornV3 	: fn_percentage(item.orgL, item.orgTot)
		                  ,   ornV4 	: fn_percentage(item.orgM, item.orgTot)
		                  ,   ornV5 	: fn_percentage(item.orgS, item.orgTot)
		                  ,   ornV6 	: fn_percentage(item.orgSs, item.orgTot)
		                  ,   ornSbTot : gfn_isEmpty(item.orgTot) ? "" : 100 + '%'
	                 	  ,   totSum   : ""
					}
					jsonSortInvntr.push(percentage);

	                console.log("item.ylw2Xl",item.ylw2Xl)
	                console.log("fn_percentage(item.ylw2Xl, item.ylwTot)",fn_percentage(item.ylw2Xl, item.ylwTot))
            	});
            	grdSortInvntr.rebuild();

            	grdSortInvntr.setCellData(0, 0, grdGubunText);

			} else {
				gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}

			console.error("failed", e.message);
    	}
		return true;
	}

	const fn_zero = function (value){

		if (gfn_isEmpty(value) || value == '0' || value == 0 || isNaN(value)){
			return "";
		} else {
			return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')
		}
	}

	const fn_percentage = function (child, parent) {

		if (parseInt(child) != 0) {
			const rtn = Math.round((parseFloat(child) / parseFloat(parent)) * 100)

			if (gfn_isEmpty(rtn)) {
				return "";
			} else {
				return rtn + '%';
			}
		} else {
			return "";
		}

	}

	const fn_setGrdGdsInvntrList = async function () {
		let grdGubun 		= SBUxMethod.get("srch-slt-grd");
	    let itemCd 			= "1326";
	    let apcCd			= gv_selectedApcCd;
	    let spmtYmd 		= SBUxMethod.get("srch-dtp-spmtYmd");

	    const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncDsctnList.do", {
	      	grdGubun 		: grdGubun
	      , itemCd 			: itemCd
	      , apcCd			: apcCd
	      , spmtYmd			: spmtYmd
		});

	    const data = await postJsonPromise;
        try {
	        if (_.isEqual("S", data.resultStatus)) {

	        	jsonGdsInvntr.length = 0;
	        	grdGdsInvntr.rebuild();
                data.resultList.forEach((item, index) => {
                	const gdsInvntr = {
                			  apcCd		: item.apcCd
        	        		, spmtYmd	: item.spmtYmd
        		        	, spmtno	: item.spmtno
        	        		, cnptCd	: item.cnptCd
        	        		, cnptNm	: item.cnptNm
        	        		, itemCd	: item.itemCd

        	        	    , red2Xl 	: item.red2Xl
        	        	    , redXl 	: item.redXl
        	        	    , redL 		: item.redL
        	        	    , redM 		: item.redM
        	        	    , redS 		: item.redS
        	        	    , redSs 	: item.redSs
        	        	    , redTot 	: item.redTot

        	        	    , ylw2Xl 	: item.ylw2Xl
        	        	    , ylwXl 	: item.ylwXl
        	        	    , ylwL 		: item.ylwL
        	        	    , ylwM 		: item.ylwM
        	        	    , ylwS 		: item.ylwS
        	        	    , ylwSs 	: item.ylwSs
        	        	    , ylwTot 	: item.ylwTot

        	        	    , org2Xl 	: item.org2Xl
        	        	    , orgXl 	: item.orgXl
        	        	    , orgL 		: item.orgL
        	        	    , orgM 		: item.orgM
        	        	    , orgS 		: item.orgS
        	        	    , orgSs 	: item.orgSs
        	        	    , orgTot  	: item.orgTot

        	        	    , tot   	: item.tot
                	}
                	jsonGdsInvntr.push(gdsInvntr);
	            });
				grdGdsInvntr.rebuild();

				grdGdsInvntr.setCellDisabled(0, 1, grdGdsInvntr.getRows() - 2, grdGdsInvntr.getCols() - 1, true);
			} else {
	            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    }catch (e) {

			if (!(e instanceof Error)) {
			  e = new Error(e);
			}
	      	console.error("failed", e.message);
	    }
	    return true;
	}


	const fn_setGrdGdsInvntr = async function(){

	    let grdGubun 		= SBUxMethod.get("srch-slt-grd");
	    let itemCd 			= "1326";
	    let apcCd			= gv_selectedApcCd;

	    let red2XlCol = grdGdsInvntr.getColRef("red2Xl");
	    let redXlCol = grdGdsInvntr.getColRef("redXl");
	    let redLCol = grdGdsInvntr.getColRef("redL");
	    let redMCol = grdGdsInvntr.getColRef("redM");
	    let redSCol = grdGdsInvntr.getColRef("redS");
	    let redSsCol = grdGdsInvntr.getColRef("redSs");
	    let redTotCol = grdGdsInvntr.getColRef("redTot");
	    let ylw2XlCol = grdGdsInvntr.getColRef("ylw2Xl");
	    let ylwXlCol = grdGdsInvntr.getColRef("ylwXl");
	    let ylwLCol = grdGdsInvntr.getColRef("ylwL");
	    let ylwMCol = grdGdsInvntr.getColRef("ylwM");
	    let ylwSCol = grdGdsInvntr.getColRef("ylwS");
	    let ylwSsCol = grdGdsInvntr.getColRef("ylwSs");
	    let ylwTotCol = grdGdsInvntr.getColRef("ylwTot");
	    let orn2XlCol = grdGdsInvntr.getColRef("orn2Xl");
	    let ornXlCol = grdGdsInvntr.getColRef("ornXl");
	    let ornLCol = grdGdsInvntr.getColRef("ornL");
	    let ornMCol = grdGdsInvntr.getColRef("ornM");
	    let ornSCol = grdGdsInvntr.getColRef("ornS");
	    let ornSsCol = grdGdsInvntr.getColRef("ornSs");
	    let ornTotCol = grdGdsInvntr.getColRef("ornTot");
	    let totCol = grdGdsInvntr.getColRef("tot");


		const postJsonPromise = gfn_postJSON("/am/invntr/selectGdsDsctn.do", {
		      	grdGubun 		: grdGubun
		      , itemCd 			: itemCd
		      , apcCd			: apcCd
		});

        const data = await postJsonPromise;
        try {
	        if (_.isEqual("S", data.resultStatus)) {
                data.resultList.forEach((item, index) => {

					grdGdsInvntr.setCellData(2, red2XlCol, fn_zero(item.red2Xl));
					grdGdsInvntr.setCellData(2, redXlCol, fn_zero(item.redXl));
					grdGdsInvntr.setCellData(2, redLCol, fn_zero(item.redL));
					grdGdsInvntr.setCellData(2, redMCol, fn_zero(item.redM));
					grdGdsInvntr.setCellData(2, redSCol, fn_zero(item.redS));
					grdGdsInvntr.setCellData(2, redSsCol, fn_zero(item.redSs));
					grdGdsInvntr.setCellData(2, redTotCol, fn_zero(item.redTot));
					grdGdsInvntr.setCellData(2, ylw2XlCol, fn_zero(item.ylw2Xl));
					grdGdsInvntr.setCellData(2, ylwXlCol, fn_zero(item.ylwXl));
					grdGdsInvntr.setCellData(2, ylwLCol, fn_zero(item.ylwL));
					grdGdsInvntr.setCellData(2, ylwMCol, fn_zero(item.ylwM));
					grdGdsInvntr.setCellData(2, ylwSCol, fn_zero(item.ylwS));
					grdGdsInvntr.setCellData(2, ylwSsCol, fn_zero(item.ylwSs));
					grdGdsInvntr.setCellData(2, ylwTotCol, fn_zero(item.ylwTot));
					grdGdsInvntr.setCellData(2, orn2XlCol, fn_zero(item.orn2Xl));
					grdGdsInvntr.setCellData(2, ornXlCol, fn_zero(item.ornXl));
					grdGdsInvntr.setCellData(2, ornLCol, fn_zero(item.ornL));
					grdGdsInvntr.setCellData(2, ornMCol, fn_zero(item.ornM));
					grdGdsInvntr.setCellData(2, ornSCol, fn_zero(item.ornS));
					grdGdsInvntr.setCellData(2, ornSsCol, fn_zero(item.ornSs));
					grdGdsInvntr.setCellData(2, ornTotCol, fn_zero(item.ornTot));
					grdGdsInvntr.setCellData(2, totCol, fn_zero(item.tot));
	            });


			} else {
	            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    } catch (e) {

			if (!(e instanceof Error)) {
			  e = new Error(e);
			}
	      	console.error("failed", e.message);
	    }
	    return true;
	}

  	const fn_grdValueChanged = function () {

		let nRow = grdGdsInvntr.getRow();
		let nCol = grdGdsInvntr.getCol();

		if (nCol > 2) {
			let ref = grdGdsInvntr.getRefOfCol(nCol);
			let gTotQntt = grdGdsInvntr.getCellData(2, nCol);

			let gTotQnttArray = gTotQntt.split(",");

			if (gTotQnttArray.length == 3) {

				let million = parseInt(gTotQnttArray[0]) * 1000000;
				let thousand = parseInt(gTotQnttArray[1]) * 1000;
				let hundred = parseInt(gTotQnttArray[2]);

				gTotQntt = million + thousand + hundred;
			}

			if (gTotQnttArray.length == 2) {
				let thousand = parseInt(gTotQnttArray[0]) * 1000;
				let hundred = parseInt(gTotQnttArray[1]);
				gTotQntt = thousand + hundred;
			}

			if (gTotQnttArray.length == 1) {
				let hundred = parseInt(gTotQnttArray[0]);
				gTotQntt = hundred;
			}

			let rowData = grdGdsInvntr.getRowData(nRow);
			let qntt = rowData[ref];
			let totQntt = 0;
			let spmtTotQntt = 0;
			let gridData = grdGdsInvntr.getGridDataAll();

			if (!gfn_isEmpty(gTotQntt)){

			    for (var i=3; i<gridData.length+2; i++ ){
			    	let rowData = grdGdsInvntr.getRowData(i);

			    	if (gfn_isEmpty(rowData.spmtno)) {
			    		if (!(rowData[ref] == "" || rowData[ref] == null || rowData[ref] == undefined || rowData[ref] == NaN)){
					        totQntt += parseInt(rowData[ref]);
					    }
			    	}
			    }

			    if (totQntt > gTotQntt) {
			    	grdGdsInvntr.setCellData(nRow, nCol, 0);
			    }

			    let color = ref.substring(0,3);

			    // 그리드 해당 컬럼 가로 계산(Row별)
			    fn_rowSum(nRow, color, qntt);

			    // 가로 컬러 총 합산
			    fn_rowTotSum(nRow);

			} else {
				grdGdsInvntr.setCellData(nRow, nCol, 0);
			}

			grdGdsInvntr.refresh();
		}
  	}

  	// 그리드 가로 합산 : 컬러별
  	const fn_rowSum = function(nRow, color, qntt) {
		let ref = color + "Tot";
		let totCol = grdGdsInvntr.getColRef(ref);
		let rowDataT = grdGdsInvntr.getRowData(nRow);
		let tot = rowDataT[ref];

		if (tot == "") {
			grdGdsInvntr.setCellData(nRow, totCol, parseInt(qntt));
		} else {

			let keyRef2Xl = color+"2Xl";
	     	let keyRefXl = color+"Xl";
	     	let keyRefL = color+"L";
	     	let keyRefM = color+"M";
	     	let keyRefS = color+"S";
	     	let keyRefSs = color+"Ss";

			let xxl = rowDataT[keyRef2Xl];
	     	let xl = rowDataT[keyRefXl];
	     	let l = rowDataT[keyRefL];
	     	let m = rowDataT[keyRefM];
	     	let s = rowDataT[keyRefS];
	     	let ss = rowDataT[keyRefSs];

	     	let tot = parseInt(gfn_nvl(xxl, 0))
	     			+ parseInt(gfn_nvl(xl, 0))
	     			+ parseInt(gfn_nvl(l, 0))
	     			+ parseInt(gfn_nvl(m, 0))
	     			+ parseInt(gfn_nvl(s, 0))
	     			+ parseInt(gfn_nvl(ss, 0));

	       	grdGdsInvntr.setCellData(nRow, totCol, tot);
		}

	}

  	// 그리드 컬러별 별 합산
	const fn_totSum = function(color) {

		let ref = color + "Tot";

		let totCol = grdGdsInvntr.getColRef(ref);
		let totQntt = 0;
		let gridData = grdGdsInvntr.getGridDataAll();

		for (var i=3; i<gridData.length+2; i++ ){
	    	let rowData = grdGdsInvntr.getRowData(i);
		    if (!(gfn_isEmpty(rowData[ref]))){
		        totQntt += parseInt(rowData[ref]);
		    }
	    }
		grdGdsInvntr.setCellData(3, totCol, totQntt);
	}

  	// 가로별 합산
	const fn_rowTotSum = function(nRow) {
		let totCol = grdGdsInvntr.getColRef("tot");
		let checkCol = grdGdsInvntr.getColRef("checkBox");
		let rowDataT = grdGdsInvntr.getRowData(nRow);

		let redTot = parseInt(gfn_nvl(rowDataT.redTot, 0));
		let ylwTot = parseInt(gfn_nvl(rowDataT.ylwTot, 0));
		let orgTot = parseInt(gfn_nvl(rowDataT.orgTot, 0));

		grdGdsInvntr.setCellData(nRow, totCol, redTot + ylwTot + orgTot);

		if (redTot + ylwTot + orgTot > 0) {
			grdGdsInvntr.setCellData(nRow, checkCol, 'Y');
		} else {
			grdGdsInvntr.setCellData(nRow, checkCol, 'N');
		}

	}
	// 총 합산
	const fn_sum = function() {

		let totCol = grdGdsInvntr.getColRef("tot");
		let checkCol = grdGdsInvntr.getColRef("checkBox");
		let gridData = grdGdsInvntr.getGridDataAll();
		let totQntt = 0;
		for (var i=3; i<gridData.length+2; i++ ){
	    	let rowData = grdGdsInvntr.getRowData(i);
	    	let spmtno	= rowData.spmtno;

	    	if (!gfn_isEmpty(rowData.tot)){
		        totQntt += parseInt(rowData.tot);
		        if (gfn_isEmpty(spmtno)) {
		        	grdGdsInvntr.setCellData(i, checkCol, 'Y');
		        }
		        if (rowData.tot == 0) {
			    	grdGdsInvntr.setCellData(i, checkCol, 'N');
		     	}
		    }
		}
		grdGdsInvntr.setCellData(3, totCol, totQntt);
	}

	// 행 추가
	const fn_addRow = function() {
		jsonGdsInvntr.push({
			spmtYmd : gfn_dateToYmd(new Date())
		})
		grdGdsInvntr.refresh();
	}

	// 행삭제
	const fn_delRow = async function() {
		let checkCol = grdGdsInvntr.getColRef("checkBox");
		let checkeds = grdGdsInvntr.getCheckedRows(checkCol);
		let reverseCheckeds = checkeds.reverse();

		if (checkeds.length == 0) {

			gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
    		return;
		}

		for (var i=0; i<checkeds.length; i++){

			let rowData = grdGdsInvntr.getRowData(reverseCheckeds[i]);

			if (gfn_isEmpty(rowData.spmtno)) {
				jsonGdsInvntr.splice(reverseCheckeds[i] - 3, 1);
				grdGdsInvntr.refresh();
			} else {
				gfn_comAlert("E0000", reverseCheckeds[i] - 2 + "행은 등록 된 실적 입니다. 삭제를 이용해 주세요.");			// E0000	{0}
				return;
			}
		}
	}

	const fn_reSumCol = async function () {

		let colors = ['red','ylw','orn'];
		let columns = ['2Xl', 'Xl','L','M','S','Ss','Tot'];

		let gridData = grdGdsInvntr.getGridDataAll();

		for (var i=0; i<colors.length; i++){

			var color = colors[i];

			for (var j=0; j<columns.length; j++) {

				let ref = color + columns[j];
				let refCol = grdGdsInvntr.getColRef(ref);
				let totQntt = 0;

				for (var k=3; k<gridData.length+2; k++ ){
			    	let rowData = grdGdsInvntr.getRowData(k);
			        totQntt += parseInt(gfn_nvl(rowData[ref], 0));
			    }
				grdGdsInvntr.setCellData(3, refCol, totQntt);
			}
		}
	}

	const fn_reSum = async function () {

		let rst = await Promise.all([
		    // 총 합산
		    //fn_reSumCol(),
		    //fn_sum(),
	    ])

	}

	const fn_save = async function () {

		let checkCol = grdGdsInvntr.getColRef("checkBox");
		let checkeds = grdGdsInvntr.getCheckedRows(checkCol, true);

		let grdGubun = SBUxMethod.get('srch-slt-grd');

		if (checkeds.length == 0) {
			gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
    		return;
		}

		let colors = ['red', 'ylw', 'orn'];
		let columns = ['2Xl', 'Xl','L','M','S','Ss'];
		let aGrds = ['01', '02', '03', '04', '05', '06'];
		let bGrds = ['07', '08', '09', '10', '11', '12'];
		let cGrds = ['13', '14', '15'];

		let grds = [];

		if (grdGubun == "A") {
			grds = aGrds;
		} else if (grdGubun == "B") {
			grds = bGrds;
		} else if (grdGubun == "C") {
			grds = cGrds;
		}

		let gridData = grdGdsInvntr.getGridDataAll();

		let insertList = [];

		for (var i=3; i<gridData.length+2; i++ ) {
	    	let rowData = grdGdsInvntr.getRowData(i);
	    	let spmtYmd = rowData.spmtYmd;
	    	let cnptCd	= rowData.cnptCd;
	    	let spmtno	= rowData.spmtno;

	    	if(gfn_isEmpty(spmtno)){

		    	if(gfn_isEmpty(spmtYmd)){
		    		gfn_comAlert("W0001", "출하일자");			//	W0001	{0}을/를 선택하세요.
		            return;
		    	}
		    	if(gfn_isEmpty(cnptCd)){
		    		gfn_comAlert("W0001", "거래처");			//	W0001	{0}을/를 선택하세요.
		            return;
		    	}

		    	let spmtPrfmncList = [];

		    	for (var j=0; j<colors.length; j++) {

		    		let color = colors[j];
		    		let vrtyCd = "";
		    		if (color == 'red') {
	    				vrtyCd = '0300';
	    			} else if (color == 'ylw') {
	    				vrtyCd = '0200';
	    			} else if (color == 'orn') {
	    				vrtyCd = '0400';
	    			}

		    		for (var k=0; k<columns.length; k++) {

		    			let ref = color + columns[k];
		    			let spmtQntt = rowData[ref];

		    			if (!gfn_isEmpty(spmtQntt) && spmtQntt > 0 ) {

			    			let spmtVO = {
			    				apcCd		: gv_selectedApcCd
			    			  ,	spmtYmd 	: rowData.spmtYmd
			    			  , itemCd 		: '1326'
			    			  , vrtyCd		: vrtyCd
			    			  , cnptCd		: rowData.cnptCd
			    			  , gdsGrd		: grds[k]
			    			  , spmtQntt	: spmtQntt
		    				}
			    			spmtPrfmncList.push(spmtVO);
		    			}
		    		}
		    	}

		    	if (spmtPrfmncList.length > 0) {
		    		insertList.push({"spmtPrfmncList" : spmtPrfmncList});
		    	}
	    	}

	    }

		if (insertList.length == 0) {
			gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
    		return;
		}

		if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/spmt/insertSpmtPrfmncDsctn.do", insertList);
	    	const data = await postJsonPromise;
	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	    			fn_search();
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
	        	}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}
	}

	const fn_delete = async function () {

		let checkCol = grdGdsInvntr.getColRef("checkBox");
		let checkeds = grdGdsInvntr.getCheckedRows(checkCol, true);
		let reverseCheckeds = checkeds.reverse();
		let deleteList = [];

		for (var i=0; i<checkeds.length; i++){

			let rowData = grdGdsInvntr.getRowData(reverseCheckeds[i]);

			if (!gfn_isEmpty(rowData.spmtno)) {
				deleteList.push(rowData)
			}
		}

		if (deleteList.length == 0) {

			gfn_comAlert("W0003", "삭제");			// W0003	{0}할 대상이 없습니다.
    		return;
		}

		if (gfn_comConfirm("Q0001", "삭제")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/spmt/deleteSpmtPrfmncList.do", deleteList);
	    	const data = await postJsonPromise;

	    	try {
	        	if (_.isEqual("S", data.resultStatus)) {
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.

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

		await fn_reSum();
	}

	/**
     * @name fn_docSpmt
     * @description 송품장 발행 버튼
     */
 	const fn_docSpmt = function(nRow) {

		const rowData = grdGdsInvntr.getRowData(nRow);
		const gubun = SBUxMethod.get('srch-slt-grd');
		const spmtno = rowData.spmtno;
		var spmtArr = {};
		if(gubun === "A"){
			spmtArr = {apcCd: gv_selectedApcCd, spmtno: spmtno, gdsgrd1:"01", gdsgrd2:"02", gdsgrd3:"03", gdsgrd4:"04", gdsgrd5:"05", gdsgrd6:"06"};
		}else if (gubun ==="B"){
			spmtArr = {apcCd: gv_selectedApcCd, spmtno: spmtno, gdsgrd1:"07", gdsgrd2:"08", gdsgrd3:"09", gdsgrd4:"10", gdsgrd5:"11", gdsgrd6:"12"};
		}else if (gubun ==="C"){
			spmtArr = {apcCd: gv_selectedApcCd, spmtno: spmtno, gdsgrd1:"13", gdsgrd2:"14", gdsgrd3:"15", gdsgrd4:"16", gdsgrd5:"17", gdsgrd6:"18"};
		}

 		gfn_popClipReport("송품장", "am/trsprtCmdtyDoc_0033.crf",spmtArr );
 	}

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
