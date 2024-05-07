
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

<style type="text/css">
.ad_tbl_toplist>span {
	font-weight: bold;
	margin-right: 10px;
}
</style>

</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 파프리카선별집계표 -->
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
						<col style="width: 8%">

						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 4%">
						<col style="width: 3%">

						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 2%">
						<col style="width: 3%">

						<col style="width: 13%">
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
							<th class="ta_r th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrIdentno"
									name="srch-inp-prdcrIdentno"
									class="form-control input-sm"
									maxlength="2"
									autocomplete="off"
									onchange="fn_onChangeSrchPrdcrIdentno(this)"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchPrdcr"
									name="btnSrchPrdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td class="td_input">
								<sbux-checkbox
									id="srch-chk-dsctnYn"
									name="srch-chk-dsctnYn"
									uitype="normal"
									text="집계"
									true-value="Y"
									false-value="N"
								></sbux-checkbox>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="ad_tbl_top2 ad_tbl_top4">
				 	<div class="ad_tbl_toplist_datepk">
				 		<table class="table table-bordered tbl_fixed">
				 			<caption>검색 조건 설정</caption>
							<colgroup>
								<col style="width: 91px">
								<col style="width: 91px">
								<col style="width: auto">
								<col style="width: 800px">
								<col style="width: 75px">
								<col style="width: 75px">
							</colgroup>
							<tbody>
								<tr>
									<td class="td_input td_input_dtl" style="border-left:hidden"><sbux-button uitype="normal" id="srch-btn-dsctn" name="srch-btn-dsctn" class="btn btn-sm btn-outline-danger" text="선별내역집계" onclick="fn_searchDsctn()"></sbux-button></td>
									<td class="td_input td_input_dtl" style="border-left:hidden"><sbux-button uitype="normal" id="srch-btn-percent" name="srch-btn-percent" class="btn btn-sm btn-outline-danger" text="선별배율집계" onclick="fn_searchPercent()"></sbux-button></td>
									<td style="border-left:hidden"></td>
									<td style="border-left:hidden">
										<div class="ad_tbl_toplist ad_tbl_toplist_font">
											<span id="dtl-spn-sttsFigure" style="margin-left: 10px;font-size: 28px;">●</span>
											<span id="dtl-spn-trsmMatSttsNm" style="margin-right: 20px;">기기상태</span>
											<span>요청 :</span>
											<span id="dtl-spn-reqDt"></span>
											<span>완료 :</span>
											<span id="dtl-spn-cmptnDt"></span>
											<span id="dtl-spn-sttsNm" style="margin-right: 20px;">진행상태</span>
										</div>
									</td>
									<td class="td_input" style="border-right:hidden; border-left:hidden">
										<sbux-button
											id="btn-sortReq"
											name="btn-sortReq"
											uitype="normal"
											class="btn btn-sm btn-outline-danger"
											onclick="fn_sortReq"
											text="정보재수신"
										></sbux-button>
									</td>
									<td class="td_input" style="border-right:hidden; border-left:hidden">
										<sbux-button
											id="btn-sortReqCncl"
											name="btn-sortReqCncl"
											uitype="normal"
											class="btn btn-sm btn-outline-danger"
											onclick="fn_sortReqCncl"
											text="취소"
										></sbux-button>
									</td>
								</tr>
							</tbody>
				 		</table>
					</div>
				</div>

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-sortDsctnTot" style="height:544px;"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>
	<!-- 생산자 팝업 -->
	<div>
        <sbux-modal
        	id="modal-prdcr"
        	name="modal-prdcr"
        	uitype="middle"
        	header-title="생산자 선택"
        	body-html-id="body-modal-prdcr"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>

<script type="text/javascript">

	var jsonDataPrdcr 	= [];
	var jsonPrdcr		= [];
	var jsonPrdcrAutocomplete = [];

	let lv_interval = 3 * 60 * 1000;
	let percentYn = false;

	let timerId;

	const fn_clearBatch = () => {
		if (!gfn_isEmpty(timerId)) {
			clearInterval(timerId);
		}
	}

	let currApcLink;

    /**
     * @name fn_getApcLink
     * @description apc 연계상태 확인
     * @function
     */
	const fn_getApcLink = async function() {

		fn_clearBatch();

		try {
			const postJsonPromise = gfn_postJSON(
						"/am/apc/selectApcLinkStts.do",
						{apcCd: gv_selectedApcCd}
					);
	        const data = await postJsonPromise;

	        if (_.isEqual("S", data.resultStatus)) {

	        	if (_.isEqual("S", data.resultStatus)) {

		        	const apcLink = data.resultMap;
					fn_setApcLink(apcLink);

	        	} else {
	        		fn_setApcLink(false);
	        	}

        	} else {
        		fn_setApcLink(false);
        	}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		} finally {
			timerId = setInterval(() => {
				fn_getApcLink();
			}, lv_interval);
		}
    }

    /**
     * @name fn_setApcLink
     * @description apc 연계상태 정보 표시
     * @function
     */
	const fn_setApcLink = function(apcLink) {

		const sttsFigure = document.querySelector('#dtl-spn-sttsFigure');
		const trsmMatSttsNm = document.querySelector('#dtl-spn-trsmMatSttsNm');
		const reqDt = document.querySelector('#dtl-spn-reqDt');
		const cmptnDt = document.querySelector('#dtl-spn-cmptnDt');
		const sttsNm = document.querySelector('#dtl-spn-sttsNm');
		const emptyDt = "____-__-__ __:__:__";

    	if (gfn_isEmpty(apcLink)) {
    		sttsFigure.style.color = "#000000";
    		trsmMatSttsNm.innerText = "...";
    		trsmMatSttsNm.style.color = "#808080";

    		reqDt.innerText = emptyDt;
    		cmptnDt.innerText = emptyDt;
    		sttsNm.innerText = "확인중";
    		sttsNm.style.color = "#808080";

    		currApcLink = null;
    	} else {
    		sttsFigure.style.color = apcLink.trsmMatSttsColor;
    		trsmMatSttsNm.innerText = apcLink.trsmMatSttsNm;
    		trsmMatSttsNm.style.color = apcLink.trsmMatSttsColor;

    		reqDt.innerText = _.isEqual(apcLink.sortLinkStts, "P0") ? emptyDt : gfn_nvl(apcLink.sortReqDt, emptyDt);
    		cmptnDt.innerText = _.isEqual(apcLink.sortLinkStts, "P0") ? gfn_nvl(apcLink.sortPrcsCmptnDt, emptyDt) : emptyDt;
    		sttsNm.innerText = apcLink.sortSttsNm;
    		sttsNm.style.color = apcLink.sortSttsColor;

    		currApcLink = apcLink;
    	}
    }

    /**
     * @name fn_sortReq
     * @description 선별정보 연계요청
     * @function
     */
 	const fn_sortReq = async function() {

 		if (!gfn_comConfirm("Q0001", "정보재수신 요청")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
 		// validation check

		const param = {
			apcCd: gv_selectedApcCd,
			linkKnd: 'S',	// 선별
			linkStts: 'R0'	// 요청
		}

		try {
			const postJsonPromise = gfn_postJSON(
						"/am/apc/updateApcLinkStts.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;

	        if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		} finally {
			await fn_getApcLink();
		}
	}

    /**
     * @name fn_sortReqCncl
     * @description 선별정보 연계요청 취소
     * @function
     */
 	const fn_sortReqCncl = async function() {

 		// validation check
 		if (!gfn_comConfirm("Q0001", "정보재수신 요청취소")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

		const param = {
			apcCd: gv_selectedApcCd,
			linkKnd: 'S',	// 선별
			linkStts: 'R9'	// 요청
		}

		try {
			const postJsonPromise = gfn_postJSON(
						"/am/apc/updateApcLinkStts.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;

	        if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		} finally {
			await fn_getApcLink();
		}
	}


	var jsonComItem				= [];	// 품목 		itemCd			검색

	window.addEventListener('DOMContentLoaded', async function(e) {

		fn_init();
		fn_getPrdcrs();

	})

	const fn_init = async function() {

		SBUxMethod.set("dtl-inp-apcCd", gv_selectedApcNm);
		SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
		fn_createSortDsctnTot();
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd),
			fn_getApcLink(),
			fn_search(),
		]);

		$("#srch-btn-dsctn").css({"background-color":"#149FFF","color":"white"});
		$("#srch-btn-percent").css({"background-color":"white","color":"black"});

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
	    	{caption : [],	ref : 'checkedYn',		width : '40px',	style : 'text-align:center',	type : 'radio', 			typeinfo : {checkedvalue : 'yes', uncheckedvalue : 'false'},hidden:true},
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
	    							, format : {type:'number', rule:'#,###',emptyvalue:'0'}, fixedstyle : 'background-color:#ceebff;', disabled:true},
	    	{caption : ["노랑","2XL"], ref: 'ylwV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["노랑","XL"], ref: 'ylwV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["노랑","L"], ref: 'ylwV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["노랑","M"], ref: 'ylwV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["노랑","S"], ref: 'ylwV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["노랑","2S"], ref: 'ylwV6', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["노랑","소계"], ref: 'ylwSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff'
	    							, format : {type:'number', rule:'#,###',emptyvalue:'0'},fixedstyle : 'background-color:#ceebff;', disabled:true},
	    	{caption : ["주황","2XL"], ref: 'orngV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["주황","XL"], ref: 'orngV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["주황","L"], ref: 'orngV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["주황","M"], ref: 'orngV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["주황","S"], ref: 'orngV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["주황","2S"], ref: 'orngV6', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###', emptyvalue:'0'}, disabled:true},
	    	{caption : ["주황","소계"], ref: 'orngSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff '
	    							, format : {type:'number', rule:'#,###',emptyvalue:'0'},fixedstyle : 'background-color:#ceebff;', disabled:true},

	    	{caption : ["총합계","총합계"], ref: 'totSum', type: 'input',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}, disabled:true},
	    	{caption : ["비고","비고"], ref: 'rmrk', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', disabled:true, hidden:true},
	    	{caption: ["생산자코드"],	ref: 'prdcrCd',     		type:'input',  	hidden: true}

	    ];
	    grdSortDsctnTot = _SBGrid.create(SBGridProperties);
	    grdSortDsctnTot.bind('click', fnClick)

	}

	const fn_createSortDsctnTotPercent = function() {
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
	    SBGridProperties.columns = [
	    	{caption : [],	ref : 'checkedYn',		width : '40px',	style : 'text-align:center',	type : 'radio', 			typeinfo : {checkedvalue : 'yes', uncheckedvalue : 'false'},hidden:true},
	    	{caption : ["선별일자","선별일자"], ref: 'inptYmd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled:true  },
	    	{caption: ["등급","등급"],    		ref: 'grd',     	type: 'input', width:'50px', 	style: 'text-align:center', disabled:true},
	    	{caption : ["구분","구분"], ref: 'prdcrNm', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;', disabled:true},
	    	{caption : ["빨강","2XL"], ref: 'redV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["빨강","XL"], ref: 'redV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["빨강","L"], ref: 'redV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["빨강","M"], ref: 'redV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["빨강","S"], ref: 'redV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["빨강","2S"], ref: 'redV6', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["빨강","소계"], ref: 'redSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff;'
	    							, format : {type:'string', emptyvalue:''}, fixedstyle : 'background-color:#ceebff;', disabled:true},
	    	{caption : ["노랑","2XL"], ref: 'ylwV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["노랑","XL"], ref: 'ylwV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["노랑","L"], ref: 'ylwV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["노랑","M"], ref: 'ylwV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["노랑","S"], ref: 'ylwV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["노랑","2S"], ref: 'ylwV6', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["노랑","소계"], ref: 'ylwSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff'
	    							, format : {type:'string', emptyvalue:''},fixedstyle : 'background-color:#ceebff;', disabled:true},
	    	{caption : ["주황","2XL"], ref: 'orngV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["주황","XL"], ref: 'orngV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["주황","L"], ref: 'orngV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["주황","M"], ref: 'orngV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["주황","S"], ref: 'orngV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["주황","2S"], ref: 'orngV6', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'string', emptyvalue:''}, disabled:true},
	    	{caption : ["주황","소계"], ref: 'orngSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff '
	    							, format : {type:'string', emptyvalue:''},fixedstyle : 'background-color:#ceebff;', disabled:true},

	    	{caption : ["총합계","총합계"], ref: 'totSum', type: 'input',  width:'150px', style: 'text-align:right; padding-right:5px; background-color:#95DCF8'
	    							, format : {type:'string'}, fixedstyle : 'background-color:#95DCF8;', disabled:true},
	    	{caption : ["비고","비고"], ref: 'rmrk', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', disabled:true, hidden:true},
	    	{caption: ["생산자코드"],	ref: 'prdcrCd',     		type:'input',  	hidden: true},
	    	{caption: ["css여부"],	ref: 'cssYn',     		type:'input',  	hidden: true}

	    ];
	    grdSortDsctnTot = _SBGrid.create(SBGridProperties);
	}

	function fnClick(){
		this.inputmode = 'none';
	}

	const fn_searchPercent = function () {
		fn_createSortDsctnTotPercent();

		percentYn = true;

		$("#srch-btn-percent").css({"background-color":"#149FFF","color":"white"});
		$("#srch-btn-dsctn").css({"background-color":"white","color":"black"});

		fn_search();
	}

	const fn_searchDsctn = function () {
		fn_createSortDsctnTot();

		percentYn = false;

		$("#srch-btn-dsctn").css({"background-color":"#149FFF","color":"white"});
		$("#srch-btn-percent").css({"background-color":"white","color":"black"});

		fn_search();
	}


	// 선별구분
	const fn_setSortDsctnTot = async function() {
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let dsctnYn = SBUxMethod.get("srch-chk-dsctnYn")['srch-chk-dsctnYn'];
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		const param = {
			apcCd: gv_selectedApcCd,
			inptYmdFrom: inptYmdFrom,
			inptYmdTo: inptYmdTo,
			itemCd: itemCd,
			prdcrCd: prdcrCd,
			dsctnYn: dsctnYn
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


	        grdSortDsctnTot.rebuild();
	        grdSortDsctnTot.setCellStyles(0,4,0,9,'background:#FF000030');
			grdSortDsctnTot.setCellStyles(0,10,0,16,'background:#FFFC3330');
			grdSortDsctnTot.setCellStyles(0,17,0,22,'background:#FFB53330');
			grdSortDsctnTot.setCellStyles(0,23,0,23,'background:#95DCF8');

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	// 선별구분
	const fn_setSortDsctnTotPercent = async function() {
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let dsctnYn = SBUxMethod.get("srch-chk-dsctnYn")['srch-chk-dsctnYn'];
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		const param = {
			apcCd: gv_selectedApcCd,
			inptYmdFrom: inptYmdFrom,
			inptYmdTo: inptYmdTo,
			itemCd: itemCd,
			prdcrCd : prdcrCd,
			dsctnYn: dsctnYn
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
	        let grdNm = "";
	        let grdRedSum = 0;
	        let grdYlwSum = 0;
	        let grdOrgSum = 0;
	        data.resultList.forEach((item, index) => {

				let idx = index;
				if ( idx == 0) {
					grdNm = item.grd;
					grdRedSum = item.grdRedSum;
					grdYlwSum = item.grdYlwSum;
					grdOrgSum = item.grdOrgSum;
				} else if (idx > 0) {
					if (grdNm != item.grd) {

						let grdSum = parseInt(grdRedSum) + parseInt(grdYlwSum) + parseInt(grdOrgSum);
	        			const sortDsctnTot = {
	    	        			grd     : grdNm
	    	        		,	prdcrNm : grdNm + "비율"

	    	        	    ,   redSbTot : fn_percentage(grdRedSum, item.redTotOver)
	    	        	    ,   ylwSbTot : fn_percentage(grdYlwSum, item.ylwTotOver)
	    	        	    ,   orngSbTot : fn_percentage(grdOrgSum, item.orgTotOver)
	    	        	    , 	totSum	: fn_percentage(grdSum, item.totOver)
	    	        	    , 	css	: "Y"
	    	        	}
	    	        	jsonSortDsctnTot.push(sortDsctnTot);
	        		}
					grdNm = item.grd;
					grdRedSum = item.grdRedSum;
					grdYlwSum = item.grdYlwSum;
					grdOrgSum = item.grdOrgSum;
				}

	        	const sortDsctn = {
	        			grd     : item.grd
	        		,	prdcrNm : item.prdcrNm
	        	    ,   prdcrCd : item.prdcrCd
	        	    ,   inptYmd : item.inptYmd
	        	    ,   redV1 : fn_percentageVal(item.red2XlP)
	        	    ,   redV2 : fn_percentageVal(item.redXlP)
	        	    ,   redV3 : fn_percentageVal(item.redLP)
	        	    ,   redV4 : fn_percentageVal(item.redMP)
	        	    ,   redV5 : fn_percentageVal(item.redSP)
	        	    ,   redV6 : fn_percentageVal(item.redSsP)
	        	    ,   redSbTot : fn_percentageVal(item.redTotP)
	        	    ,   ylwV1 : fn_percentageVal(item.ylw2XlP)
	        	    ,   ylwV2 : fn_percentageVal(item.ylwXlP)
	        	    ,   ylwV3 : fn_percentageVal(item.ylwLP)
	        	    ,   ylwV4 : fn_percentageVal(item.ylwMP)
	        	    ,   ylwV5 : fn_percentageVal(item.ylwSP)
	        	    ,   ylwV6 : fn_percentageVal(item.ylwSsP)
	        	    ,   ylwSbTot : fn_percentageVal(item.ylwTotP)
	        	    ,   orngV1 : fn_percentageVal(item.org2XlP)
	        	    ,   orngV2 : fn_percentageVal(item.orgXlP)
	        	    ,   orngV3 : fn_percentageVal(item.orgLP)
	        	    ,   orngV4 : fn_percentageVal(item.orgMP)
	        	    ,   orngV5 : fn_percentageVal(item.orgSP)
	        	    ,   orngV6 : fn_percentageVal(item.orgSsP)
	        	    ,   orngSbTot : fn_percentageVal(item.orgTotP)
	        	    , 	css	: "N"
	        	}
	        	jsonSortDsctnTot.push(sortDsctn);


	        	if (idx+1 == data.resultList.length) {

	        		let grdSum = parseInt(item.grdRedSum) + parseInt(item.grdYlwSum) + parseInt(item.grdOrgSum);

					const sortDsctnTot = {
    	        			grd     : item.grd
    	        		,	prdcrNm : item.grd + "비율"
    	        	    ,   redSbTot : fn_percentage(item.grdRedSum, item.redTotOver)
    	        	    ,   ylwSbTot : fn_percentage(item.grdYlwSum, item.ylwTotOver)
    	        	    ,   orngSbTot : fn_percentage(item.grdOrgSum, item.orgTotOver)
    	        	    , 	totSum	: fn_percentage(grdSum, item.totOver)
    	        	    , 	css	: "Y"
    	        	}

    	        	jsonSortDsctnTot.push(sortDsctnTot);

        			const sortDsctnTotT = {
        							prdcrNm    : "전체비율"
      							,   redV1 : fn_percentage(item.red2XlTot, item.redTotOver)
              	        	    ,   redV2 : fn_percentage(item.redXlTot, item.redTotOver)
              	        	    ,   redV3 : fn_percentage(item.redLTot, item.redTotOver)
              	        	    ,   redV4 : fn_percentage(item.redMTot, item.redTotOver)
              	        	    ,   redV5 : fn_percentage(item.redSTot, item.redTotOver)
              	        	    ,   redV6 : fn_percentage(item.redSsTot, item.redTotOver)
              	        	    ,   redSbTot : fn_percentage(item.redTotOver, item.totOver)
              	        	    ,   ylwV1 : fn_percentage(item.ylw2XlTot, item.ylwTotOver)
              	        	    ,   ylwV2 : fn_percentage(item.ylwXlTot, item.ylwTotOver)
              	        	    ,   ylwV3 : fn_percentage(item.ylwLTot, item.ylwTotOver)
              	        	    ,   ylwV4 : fn_percentage(item.ylwMTot, item.ylwTotOver)
              	        	    ,   ylwV5 : fn_percentage(item.ylwSTot, item.ylwTotOver)
              	        	    ,   ylwV6 : fn_percentage(item.ylwSsTot, item.ylwToOvert)
              	        	    ,   ylwSbTot : fn_percentage(item.ylwTotOver, item.totOver)
              	        	    ,   orngV1 : fn_percentage(item.org2XlTot, item.orgTotOver)
              	        	    ,   orngV2 : fn_percentage(item.orgXlTot, item.orgTotOver)
              	        	    ,   orngV3 : fn_percentage(item.orgLTot, item.orgTotOver)
              	        	    ,   orngV4 : fn_percentage(item.orgMTot, item.orgTotOver)
              	        	    ,   orngV5 : fn_percentage(item.orgSTot, item.orgTotOver)
              	        	    ,   orngV6 : fn_percentage(item.orgSsTot, item.orgTotOver)
              	        	    ,   orngSbTot : fn_percentage(item.orgTotOver, item.totOver)
        	        	    	, 	css	: "T"
        			}
        			jsonSortDsctnTot.push(sortDsctnTotT);
				}
	        });

	        grdSortDsctnTot.rebuild();
	        grdSortDsctnTot.setCellStyles(0,4,0,9,'background:#FF000030');
			grdSortDsctnTot.setCellStyles(0,10,0,16,'background:#FFFC3330');
			grdSortDsctnTot.setCellStyles(0,17,0,22,'background:#FFB53330');
			grdSortDsctnTot.setCellStyles(0,23,0,23,'background:#95DCF8');

			for (var i=0; i<jsonSortDsctnTot.length; i++) {

				let rowData = jsonSortDsctnTot[i];
				let css = rowData.css;
				if (!gfn_isEmpty(css) && css == "Y") {
					grdSortDsctnTot.setCellStyles(i+2, 3, i+2, 25, 'background:#ceebff');
					grdSortDsctnTot.setCellStyles(i+2, 10, i+2, 10, 'background:#E7EC20');
					grdSortDsctnTot.setCellStyles(i+2, 17, i+2, 17, 'background:#E7EC20');
					grdSortDsctnTot.setCellStyles(i+2, 24, i+2, 24, 'background:#E7EC20');
					grdSortDsctnTot.setCellStyles(i+2, 25, i+2, 25, 'background:#FFC000');
				}

				if (!gfn_isEmpty(css) && css == "T") {
					grdSortDsctnTot.setCellStyles(i+2, 1, i+2, 25, 'background:#ceebff');
					grdSortDsctnTot.setCellStyles(i+2, 10, i+2, 10, 'background:#FFC000');
					grdSortDsctnTot.setCellStyles(i+2, 17, i+2, 17, 'background:#FFC000');
					grdSortDsctnTot.setCellStyles(i+2, 24, i+2, 24, 'background:#FFC000');
					grdSortDsctnTot.setCellStyles(i+2, 25, i+2, 25, 'background:#95DCF8');
				}
			}


		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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

	const fn_percentageVal = function (val) {

		if (parseInt(val) != 0) {

			if (gfn_isEmpty(val)) {
				return "";
			} else {
				return val + '%';
			}
		} else {
			return "";
		}
	}

	const fn_search = async function () {

		if(percentYn) {
			fn_setSortDsctnTotPercent();
		} else {
			fn_setSortDsctnTot();
		}

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

 	/* Start */
	/**
	 * @name fn_getPrdcrs
	 * @description 생산자 리스트 호출
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr 		= await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr 		= gfn_setFrst(jsonPrdcr);
		jsonPrdcrDtl 	= await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcrDtl 	= gfn_setFrst(jsonPrdcrDtl);
	}

	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
 	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
	}

	/**
	 * @name fn_onInputPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onInputPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm.target.value) > 100){
			SBUxMethod.set("srch-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
	}

 	/**
 	 * @name fn_clearPrdcr
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.set("srch-inp-prdcrIdentno", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup 호출
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback 처리
	 */
	const fn_setPrdcr = async function(prdcr) {

		await fn_getPrdcrs();

		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

	const fn_onChangeSrchPrdcrIdentno = function(obj) {

		if (gfn_isEmpty(SBUxMethod.get("srch-inp-prdcrIdentno"))) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue

		let prdcrIdentno = parseInt(SBUxMethod.get("srch-inp-prdcrIdentno")) || 0;

		if (prdcrIdentno < 1) {
			return;
		}

		const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
		if (gfn_isEmpty(prdcrInfo)) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
		SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		fn_setPrdcrForm(prdcrInfo);

	}


</script>
</html>