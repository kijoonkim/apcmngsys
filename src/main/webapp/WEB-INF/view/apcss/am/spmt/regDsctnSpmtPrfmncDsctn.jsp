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
          <sbux-button id="btnSearchGdsInvnrt" name="btnSearchGdsInvnrt" uitype="normal" text="재고조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
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
            <col style="width: 3%">
            <col style="width: 6%">
            <col style="width: 7%">
            <col style="width: 6%">
            <col style="width: 6%">
            <col style="width: 3%">
          </colgroup>
          <tbody>
            <tr>
              <th scope="row" class="th_bg"><span class="data_required"></span>출하일자</th>
              <td class="td_input" style="border-right: hidden;">
                <sbux-datepicker id="srch-dtp-spmtYmd" name="srch-dtp-spmtYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(srch-dtp-pckgYmdFrom)"></sbux-datepicker>
              </td>
              <td class="td_input" style="border-right: hidden;">
              </td>
              <td class="td_input"></td>

              <th scope="row" class="th_bg"><span class="data_required"></span>출하처</th>
              <td class="td_input" style="border-right: hidden;">
                <sbux-select
                  uitype="single"
                  id="srch-slt-cnptCd"
                  name="srch-slt-cnptCd"
                  class="form-control input-sm input-sm-ast"
                  unselected-text="선택"
                  jsondata-ref="jsonCnptCd"></sbux-select>
              </td>
              <td colspan="2" class="td_input"></td>

              <th scope="row" class="th_bg"><span class="data_required"></span>구분</th>
              <td class="td_input" style="border-right: hidden;">
                <sbux-select
                  uitype="single"
                  id="srch-slt-grd"
                  name="srch-slt-grd"
                  class="form-control input-sm input-sm-ast"
                  unselected-text="선택"
                  jsondata-ref="jsonGrd"
                  onchange="fn_onChangeSrchGrd(this)"
                ></sbux-select>
              </td>
              <td class="td_input" style="border-right: hidden;">
              </td>
              <td class="td_input"></td>
            </tr>
          </tbody>
        </table>
        <!--[pp] //검색 -->
        <!--[pp] 검색결과 -->

        <div class="ad_tbl_top">
          <ul class="ad_tbl_count">
            <li><span>상품재고 내역</span></li>
          </ul>
        </div>
          <div class="ad_tbl_toplist">
        </div>
        <div class="table-responsive tbl_scroll_sm">
          <div id="sb-area-sortInvntr" style="height:112px;"></div>
        </div>

        <br>

        <div class="table-responsive tbl_scroll_sm">
          <div id="sb-area-gdsInvntr" style="height:400px;"></div>
        </div>

      </div>
    </div>
  </section>

</body>
<script type="text/javascript">

	var jsonCnptCd		= [];
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

	    SBUxMethod.set('srch-dtp-spmtYmd', gfn_dateToYmd(new Date()));
	    fn_initSBSelect();

	})

	const fn_initSBSelect = async function() {
	    let rst = await Promise.all([
	      gfn_setCpntSBSelect('srch-slt-cnptCd',	jsonCnptCd, 	gv_selectedApcCd),
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
        SBGridPropertiesSortInvntr.extendlastcol = 'scroll';
        SBGridPropertiesSortInvntr.scrollbubbling = false;
        SBGridPropertiesSortInvntr.oneclickedit = true;
        SBGridPropertiesSortInvntr.allowcopy = true;
        SBGridPropertiesSortInvntr.mergecells = 'bycol';
        var comlumns = [];
        comlumns.push(
            {caption : ["구분", "구분"], ref: 'gubun', type: 'input',  width:'240px', style: 'text-align:center;', merge: true},
        )
        comlumns.push(
            {caption : ["빨강","2XL"], 	ref: 'redV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["빨강","XL"], 	ref: 'redV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["빨강","L"], 	ref: 'redV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["빨강","M"], 	ref: 'redV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["빨강","S"], 	ref: 'redV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["빨강","2S"], 	ref: 'redV6', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["빨강","소계"], ref: 'redSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff;'
                        , format : {type:'number', rule:'#,###',emptyvalue:'0'}, fixedstyle : 'background-color:#ceebff;', disabled:true},
            {caption : ["노랑","2XL"], 	ref: 'ylwV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["노랑","XL"], 	ref: 'ylwV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["노랑","L"], 	ref: 'ylwV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["노랑","M"], 	ref: 'ylwV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["노랑","S"], 	ref: 'ylwV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["노랑","2S"], 	ref: 'ylwV6', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["노랑","소계"], ref: 'ylwSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff'
                        , format : {type:'number', rule:'#,###',emptyvalue:'0'},fixedstyle : 'background-color:#ceebff;', disabled:true},
            {caption : ["주황","2XL"], 	ref: 'orngV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["주황","XL"], 	ref: 'orngV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["주황","L"], 	ref: 'orngV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["주황","M"], 	ref: 'orngV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["주황","S"], 	ref: 'orngV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["주황","2S"], 	ref: 'orngV6', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
            {caption : ["주황","소계"], ref: 'orngSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff '
                        , format : {type:'number', rule:'#,###',emptyvalue:'0'},fixedstyle : 'background-color:#ceebff;', disabled:true},
            {caption : ["총합계","총합계"], ref: 'totSum', type: 'input',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}, disabled:true},
        )

        SBGridPropertiesSortInvntr.columns = comlumns;

        grdSortInvntr = _SBGrid.create(SBGridPropertiesSortInvntr);

        var SBGridPropertiesGdsInvntr = {};
        SBGridPropertiesGdsInvntr.parentid = 'sb-area-gdsInvntr';
        SBGridPropertiesGdsInvntr.id = 'grdGdsInvntr';
        SBGridPropertiesGdsInvntr.jsonref = 'jsonGdsInvntr';
        SBGridPropertiesGdsInvntr.emptyrecords = '데이터가 없습니다.';
        SBGridPropertiesGdsInvntr.selectmode = 'free';
        SBGridPropertiesGdsInvntr.extendlastcol = 'scroll';
        SBGridPropertiesGdsInvntr.scrollbubbling = false;
        SBGridPropertiesGdsInvntr.oneclickedit = true;
        SBGridPropertiesGdsInvntr.allowcopy = true;
        SBGridPropertiesGdsInvntr.columns = [
			{caption : ["재고내역", "재고내역", "재고내역",""], 		ref: 'checkBox', 	type: 'checkbox',  	width:'40px', 	style: 'text-align:center;'},
			{caption : ["재고내역", "재고내역", "재고내역","일자"], 	ref: 'spmtYmd', 	type: 'output',  	width:'80px', 	style: 'text-align:center;'},
			{caption : ["재고내역", "재고내역", "재고내역","출하처"], 	ref: 'cnptCd', 		type: 'combo',  	width:'120px', 	style: 'text-align:center;',
			  typeinfo : {ref:'jsonGrdCnptCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption : ["빨강","2XL"," ",""], 	ref: 'red2Xl', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["빨강","XL",""," "], 	ref: 'redXl', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["빨강","L"," ",""], 	ref: 'redL', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["빨강","M",""," "], 	ref: 'redM', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["빨강","S"," ",""], 	ref: 'redS', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["빨강","2S",""," "], 	ref: 'redSs', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["빨강","소계"," ",""], ref: 'redTot', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff;'
			            , format : {type:'number', rule:'#,###',emptyvalue:'0'}, fixedstyle : 'background-color:#ceebff;', disabled:true},
			{caption : ["노랑","2XL",""," "], 	ref: 'ylw2Xl', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["노랑","XL"," ",""], 	ref: 'ylwXl', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["노랑","L",""," "], 	ref: 'ylwL', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["노랑","M"," ",""], 	ref: 'ylwM', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["노랑","S",""," "], 	ref: 'ylwS', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["노랑","2S"," ",""], 	ref: 'ylwSs', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["노랑","소계",""," "], ref: 'ylwTot', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff'
			            , format : {type:'number', rule:'#,###',emptyvalue:'0'},fixedstyle : 'background-color:#ceebff;', disabled:true},
			{caption : ["주황","2XL"," ",""], 	ref: 'orn2Xl', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["주황","XL",""," "], 	ref: 'ornXl', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["주황","L"," ",""], 	ref: 'ornL', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["주황","M",""," "], 	ref: 'ornM', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["주황","S"," ",""], 	ref: 'ornS', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["주황","2S",""," "], 	ref: 'ornSs', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption : ["주황","소계"," ",""], ref: 'ornTot', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff '
			            , format : {type:'number', rule:'#,###',emptyvalue:'0'},fixedstyle : 'background-color:#ceebff;', disabled:true},
			{caption : ["총합계","총합계", ""," "], ref: 'tot', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}, disabled:true},
        ];

        grdGdsInvntr = _SBGrid.create(SBGridPropertiesGdsInvntr);
        grdGdsInvntr.bind('valuechanged', 'fn_grdValueChanged');
        //grdGdsInvntr.bind('select','fn_setValue');
        //grdGdsInvntr.bind('deselect','fn_delValue');

    }


	const fn_search = async function(){
	    let flag = true;
	    flag = await fn_setGrdSrtInvntr();
	    if(flag){
	      await fn_setGrdGdsInvntr();
	    }
	}


	const fn_setGrdSrtInvntr = async function(){
	    let grdGubun 		= SBUxMethod.get("srch-slt-grd");
	    let grdGubunText 	= SBUxMethod.getText("srch-slt-grd");

		if (gfn_isEmpty(grdGubun)) {
	        gfn_comAlert("W0001", "구분");				//	W0002	{0}을/를 선택하세요.
            return false;
      	}
    	const postJsonPromise = gfn_postJSON("/am/sort/selectSortDsctn.do", {

			apcCd			: gv_selectedApcCd,
			itemCd		: '1326',
			grdGubun		: grdGubun,
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
	                  	,   orngV1 	: fn_zero(item.org2Xl)
	                  	,   orngV2 	: fn_zero(item.orgXl)
	                  	,   orngV3 	: fn_zero(item.orgL)
	                  	,   orngV4 	: fn_zero(item.orgM)
	                  	,   orngV5 	: fn_zero(item.orgS)
	                  	,   orngV6 	: fn_zero(item.orgSs)
	                  	,   orngSbTot : fn_zero(item.orgTot)
	                  	,   totSum   : fn_zero(item.tot)
	            	}
	          		jsonSortInvntr.push(sortInvntr);

	                const percentage = {
	                    	  gubun		: '(백분율)'
	                  	  ,	  grd     	: item.grd
		                  ,   redV1 	: fn_zero(Math.round((parseFloat(item.red2Xl) / parseFloat(item.redTot) ) * 100))
		                  ,   redV2 	: fn_zero(Math.round((parseFloat(item.redXl) / parseFloat(item.redTot) ) * 100))
		                  ,   redV3 	: fn_zero(Math.round((parseFloat(item.redL) / parseFloat(item.redTot) ) * 100))
		                  ,   redV4 	: fn_zero(Math.round((parseFloat(item.redM) / parseFloat(item.redTot) ) * 100))
		                  ,   redV5 	: fn_zero(Math.round((parseFloat(item.redS) / parseFloat(item.redTot) ) * 100))
		                  ,   redV6 	: fn_zero(Math.round((parseFloat(item.redSs) / parseFloat(item.redTot) ) * 100))
		                  ,   redSbTot : gfn_isEmpty(item.redTot) ? null : 100
		                  ,   ylwV1 	: fn_zero(Math.round((parseFloat(item.ylw2Xl) / parseFloat(item.ylwTot) ) * 100))
		                  ,   ylwV2 	: fn_zero(Math.round((parseFloat(item.ylwXl) / parseFloat(item.ylwTot) ) * 100))
		                  ,   ylwV3 	: fn_zero(Math.round((parseFloat(item.ylwL) / parseFloat(item.ylwTot) ) * 100))
		                  ,   ylwV4 	: fn_zero(Math.round((parseFloat(item.ylwM) / parseFloat(item.ylwTot) ) * 100))
		                  ,   ylwV5 	: fn_zero(Math.round((parseFloat(item.ylwS) / parseFloat(item.ylwTot) ) * 100))
		                  ,   ylwV6 	: fn_zero(Math.round((parseFloat(item.ylwSs) / parseFloat(item.ylwTot) ) * 100))
		                  ,   ylwSbTot : gfn_isEmpty(item.ylwTot) ? null : 100
		                  ,   orngV1 	: fn_zero(Math.round((parseFloat(item.org2Xl) / parseFloat(item.orgTot) ) * 100))
		                  ,   orngV2 	: fn_zero(Math.round((parseFloat(item.orgXl) / parseFloat(item.orgTot) ) * 100))
		                  ,   orngV3 	: fn_zero(Math.round((parseFloat(item.orgL) / parseFloat(item.orgTot) ) * 100))
		                  ,   orngV4 	: fn_zero(Math.round((parseFloat(item.orgM) / parseFloat(item.orgTot) ) * 100))
		                  ,   orngV5 	: fn_zero(Math.round((parseFloat(item.orgS) / parseFloat(item.orgTot) ) * 100))
		                  ,   orngV6 	: fn_zero(Math.round((parseFloat(item.orgSs) / parseFloat(item.orgTot) ) * 100))
		                  ,   orngSbTot : gfn_isEmpty(item.orgTot) ? null : 100
	                 	  ,   totSum   : ""
					}
					jsonSortInvntr.push(percentage);
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
			return null;
		} else {
			return value;
		}
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
	      	grdGubun 		: SBUxMethod.get("srch-slt-grd"),
	      	itemCd 			: "1326",
	      	apcCd			: gv_selectedApcCd,

		});

        const data = await postJsonPromise;
        try {
	        if (_.isEqual("S", data.resultStatus)) {
				jsonGdsInvntr.length = 0;
                data.resultList.forEach((item, index) => {

					grdGdsInvntr.setCellData(2, red2XlCol, item.red2Xl);
					grdGdsInvntr.setCellData(2, redXlCol, item.redXl);
					grdGdsInvntr.setCellData(2, redLCol, item.redL);
					grdGdsInvntr.setCellData(2, redMCol, item.redM);
					grdGdsInvntr.setCellData(2, redSCol, item.redS);
					grdGdsInvntr.setCellData(2, redSsCol, item.redSs);
					grdGdsInvntr.setCellData(2, redTotCol, item.redTot);
					grdGdsInvntr.setCellData(2, ylw2XlCol, item.ylw2Xl);
					grdGdsInvntr.setCellData(2, ylwXlCol, item.ylwXl);
					grdGdsInvntr.setCellData(2, ylwLCol, item.ylwL);
					grdGdsInvntr.setCellData(2, ylwMCol, item.ylwM);
					grdGdsInvntr.setCellData(2, ylwSCol, item.ylwS);
					grdGdsInvntr.setCellData(2, ylwSsCol, item.ylwSs);
					grdGdsInvntr.setCellData(2, ylwTotCol, item.ylwTot);
					grdGdsInvntr.setCellData(2, orn2XlCol, item.orn2Xl);
					grdGdsInvntr.setCellData(2, ornXlCol, item.ornXl);
					grdGdsInvntr.setCellData(2, ornLCol, item.ornL);
					grdGdsInvntr.setCellData(2, ornMCol, item.ornM);
					grdGdsInvntr.setCellData(2, ornSCol, item.ornS);
					grdGdsInvntr.setCellData(2, ornSsCol, item.ornSs);
					grdGdsInvntr.setCellData(2, ornTotCol, item.ornTot);
					grdGdsInvntr.setCellData(2, totCol, item.tot);
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

  	const fn_grdValueChanged = function () {

		var nRow = grdGdsInvntr.getRow();
		var nCol = grdGdsInvntr.getCol();

		if(nCol > 0) {
			var ref = grdGdsInvntr.getRefOfCol(nCol);
			var gTotQntt = grdGdsInvntr.getCellData(2, nCol);
			var cTotQntt = grdGdsInvntr.getCellData(3, nCol);

			let rowData = grdGdsInvntr.getRowData(nRow);
			let qntt = rowData[ref];
			let totQntt = 0;
			let gridData = grdGdsInvntr.getGridDataAll();

			if(!gfn_isEmpty(gTotQntt)){

			    for(var i=4; i<gridData.length+4; i++ ){
			    	let rowData = grdGdsInvntr.getRowData(i);
			    	if(!(rowData[ref] == "" || rowData[ref] == null || rowData[ref] == undefined || rowData[ref] == NaN)){
				        totQntt += parseInt(rowData[ref]);
				    }
			    }

			    let color = ref.substring(0,3);

			    if(gTotQntt >= totQntt) {

			      	grdGdsInvntr.setCellData(3, nCol, totQntt);

			    }else{
					grdGdsInvntr.setCellData(3, nCol, (totQntt-qntt));
					grdGdsInvntr.setCellData(nRow, nCol, 0);
			    }

			    // 그리드 해당 컬럼 가로 계산(Row별)
			    fn_rowSum(nRow, color, qntt);

			    // 그리드 해당 컬럼 토탈 전체 계산(Col 별)
			    fn_totSum(color);

			    // 가로 컬러 총 합산
			    fn_rowTotSum(nRow);

			    // 총 합산
			    fn_sum();
			}else {
				grdGdsInvntr.setCellData(nRow, nCol, 0);
			}
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

		for(var i=4; i<gridData.length+4; i++ ){
	    	let rowData = grdGdsInvntr.getRowData(i);
		    if(!(gfn_isEmpty(rowData[ref]))){
		        totQntt += parseInt(rowData[ref]);
		    }
	    }
		grdGdsInvntr.setCellData(3, totCol, totQntt);
	}

  	// 가로별 합산
	const fn_rowTotSum = function(nRow) {
		let totCol = grdGdsInvntr.getColRef("tot");
		let rowDataT = grdGdsInvntr.getRowData(nRow);

		let redTot = parseInt(gfn_nvl(rowDataT.redTot, 0));
		let ylwTot = parseInt(gfn_nvl(rowDataT.ylwTot, 0));
		let orgTot = parseInt(gfn_nvl(rowDataT.orgTot, 0));

		grdGdsInvntr.setCellData(nRow, totCol, redTot + ylwTot + orgTot);
	}
	// 총 합산
	const fn_sum = function() {
		let totCol = grdGdsInvntr.getColRef("tot");
		let gridData = grdGdsInvntr.getGridDataAll();
		let totQntt = 0;
		for(var i=4; i<gridData.length+4; i++ ){
	    	let rowData = grdGdsInvntr.getRowData(i);
	    	if(!gfn_isEmpty(rowData.tot)){
		        totQntt += parseInt(rowData.tot);
		    }
	    }
		grdGdsInvntr.setCellData(3, totCol, totQntt);
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
