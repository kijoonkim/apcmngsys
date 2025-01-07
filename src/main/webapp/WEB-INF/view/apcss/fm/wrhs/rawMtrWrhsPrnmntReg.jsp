<%
 /**
  * @Class Name : rawMtrWrhsPrnmntReg.jsp
  * @Description : 원물입고예정 등록 화면
  * @author SI개발부
  * @since 2024.12.23
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.12.23   	김호			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 원물입고예정 등록</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 입고실적조회 -->
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
						id="btnSave"
						name="btnSave"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_save"
						text="저장"
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
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<!--[pp] 검색 -->
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
							<th scope="row" class="th_bg">생산농가</th>
							<td colspan="2" class="td_input"  style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-prdcrCd"
									name="srch-slt-prdcrCd"
									class="form-control input-sm"
									jsondata-ref="jsonPrdcr"
								></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg">예정일자</th>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-prnmntYmdFrom"
									name="srch-dtp-prnmntYmdFrom"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-prnmntYmdFrom)"
								></sbux-datepicker>
							</td>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-prnmntYmdTo"
									name="srch-dtp-prnmntYmdTo"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-prnmntYmdTo)"
								></sbux-datepicker>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td colspan="" class="td_input" style="border-right: hidden;border-top: hidden">
								<sbux-select
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									uitype="single"
									jsondata-ref="jsonApcItem"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm input-sm-ast"
									jsondata-ref="jsonApcVrty"
									jsondata-value="itemVrtyCd"
									onchange="fn_onChangeSrchVrtyCd(this)"
								/>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
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
							<th scope="row" class="th_bg">품목/품종</th>
							<td colspan="" class="td_input" style="border-right: hidden;border-top: hidden">
								<sbux-select
									id="dtl-slt-itemCd"
									name="dtl-slt-itemCd"
									uitype="single"
									jsondata-ref="jsonApcDtlItem"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_onChangeDtlItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="dtl-slt-vrtyCd"
									name="dtl-slt-vrtyCd"
									class="form-control input-sm input-sm-ast"
									jsondata-ref="jsonApcDtlVrty"
									jsondata-value="itemVrtyCd"
									onchange="fn_onChangeDtlVrtyCd(this)"
								/>
							</td>
							<td></td>
							<th scope="row" class="th_bg">예정일시</th>
							<td colspan="2" class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="dtl-dtp-prnmntYmd"
									name="dtl-dtp-prnmntYmd"
									class="form-control pull-right input-sm input-sm-ast inpt_data_reqed"
									date-format="yyyy-mm-dd HH:MM"
									show-time-bar="true"
								></sbux-datepicker>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">수량/중량</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-prnmntQntt"
									name="dtl-inp-prnmntQntt"
									class="form-control input-sm"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-prnmntWght"
									name="dtl-inp-prnmntWght"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									maxlength="6"
									autocomplete="off"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								></sbux-input>
							</td>
							<td></td>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="3" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-rmrk"
									name="dtl-inp-rmrk"
									class="form-control input-sm"
								></sbux-input>
								<sbux-input id="dtl-inp-prnmntno" name="dtl-inp-prnmntno" uitype="hidden"></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>입고예정 내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-wrhs">0</span>건)</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdRawMtrWrhsprnmnt" style="height:486px;"></div>
				</div>
			</div>
		</div>
		<!-- clip report direct print area  -->
		<div id="div-rpt-clipReportPrint" style="display:none;"></div>
	</section>
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

}
async function cfn_search() {
	await fn_search();
}
	// 원물입고실적 조회 날짜 제한
	const lv_ymd_limit = 90;
	var jsonApcItem				= [];	// 품목 		itemCd		검색
	var jsonApcVrty				= [];	// 품종 		vrtyCd		검색
	var jsonApcDtlItem			= [];	// 품목 		itemCd		검색
	var jsonApcDtlVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComVrty				= [];
	var jsonPrdcr				= [];

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, 			gv_selectedApcCd),	// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, 			gv_selectedApcCd),	// 품종
			gfn_setApcItemSBSelect('dtl-slt-itemCd', 		jsonApcDtlItem, 		gv_selectedApcCd),	// 품목
		 	gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', 		jsonApcDtlVrty, 		gv_selectedApcCd),	// 품종
	 	]);

		var prdcrResultList = JSON.parse('${prdcrResultList}');

		console.log("prdcrResultList", prdcrResultList)

		prdcrResultList.forEach((item, index) => {
			const prdcr = {
					value 	: item.PRDCR_CD
				  , text	: item.PRDCR_NM
			}
			jsonPrdcr.push(prdcr);
		})
		SBUxMethod.refresh("srch-slt-prdcrCd");

		if (jsonPrdcr.length == 1) {
			SBUxMethod.set("srch-slt-prdcrCd", jsonPrdcr[0].value);
			SBUxMethod.attr("srch-slt-prdcrCd", "disabled", true);
		} else {
			SBUxMethod.attr("srch-slt-prdcrCd", "disabled", false);
		}
	}

	const fn_init = function() {
		fn_createGrid();
		SBUxMethod.set("srch-dtp-prnmntYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-prnmntYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("dtl-dtp-prnmntYmd", gfn_dateToYmd(new Date()));

		fn_initSBSelect();
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	const fn_dtpChange = function () {
		let prnmntYmdFrom = SBUxMethod.get("srch-dtp-prnmntYmdFrom");
		let prnmntYmdTo = SBUxMethod.get("srch-dtp-prnmntYmdTo");
		var maxYmd = gfn_addDate(prnmntYmdFrom, lv_ymd_limit);

		if(gfn_diffDate(prnmntYmdFrom, prnmntYmdTo) < 0){
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			var dt = gfn_addDate(prnmntYmdFrom, 30)
			SBUxMethod.set("srch-dtp-prnmntYmdFrom", prnmntYmdFrom);
			SBUxMethod.set("srch-dtp-prnmntYmdTo", dt);
			return;
		}

		if (maxYmd < prnmntYmdTo) {
    		SBUxMethod.set("srch-dtp-prnmntYmdTo", maxYmd);
	    }
	}


	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {

		let itemCd = obj.value;
		const itemInfo = _.find(jsonApcItem, {value: itemCd});

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd)			// 품종
		]);
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		let itemCd = "";
		const vrtyInfo = _.find(jsonApcVrty, {itemVrtyCd: vrtyCd});

		if (!gfn_isEmpty(vrtyCd)) {
			itemCd = vrtyInfo.mastervalue;
		} else {
			itemCd = SBUxMethod.get("srch-slt-itemCd");
		}

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
	}

	/**
	 * @name fn_onChangeDtlItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeDtlItemCd = async function(obj) {

		let itemCd = obj.value;
		const itemInfo = _.find(jsonApcItem, {value: itemCd});

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcDtlVrty, gv_selectedApcCd, itemCd)			// 품종
		]);
	}

	/**
	 * @name fn_onChangeDtlVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeDtlVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		let itemCd = "";
		const vrtyInfo = _.find(jsonApcVrty, {itemVrtyCd: vrtyCd});

		if (!gfn_isEmpty(vrtyCd)) {
			itemCd = vrtyInfo.mastervalue;
		} else {
			itemCd = SBUxMethod.get("dtl-slt-itemCd");
		}

		const prvItemCd = SBUxMethod.get("dtl-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("dtl-slt-itemCd", itemCd);
			await fn_onChangeDtlItemCd({value: itemCd});
			SBUxMethod.set("dtl-slt-vrtyCd", vrtyCd);
		}
	}


	var grdRawMtrWrhsprnmnt;	// 원물예정등록 내역 그리드
	var jsonRawMtrWrhsprnmnt = [];

	function fn_createGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRawMtrWrhsprnmnt';
	    SBGridProperties.id = 'grdRawMtrWrhsprnmnt';
	    SBGridProperties.jsonref = 'jsonRawMtrWrhsprnmnt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';			// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'none';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [
	    	{caption: ["APC명"],		ref: 'apcNm',      	type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["생산자"],		ref: 'prdcrNm',     type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["예정일자"],		ref: 'prnmntYmd',	type:'output',  width:'120px',    style:'text-align:center'
	        	, format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["예정시간"],		ref: 'prnmntHr',    type:'output',  width:'80px',    style:'text-align:center',
	        	format : {type:'date', rule:'HH:mm', origin : 'HHmm' }},
	        {caption: ["품목"],			ref: 'itemNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품종"],			ref: 'vrtyNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {
	        	caption: ["수량"],
	        	ref: 'prnmntQntt',
	        	type:'output',
	        	width:'100px',
	        	style:'text-align:right',
	        	typeinfo : {mask : {alias : 'numeric'}},
	        	format : {
	        		type:'number',
	        		rule:'#,###  '
	        	}
	        },
	        {
	        	caption: ["중량 (Kg)"],
	        	ref: 'prnmntWght',
	        	type:'output',
	        	width:'100px',
	        	style:'text-align:right',
	        	typeinfo : {mask : {alias : 'numeric'}},
	        	format : {
	        		type:'number',
	        		rule:'#,###  '
	        	}
	        },
	        {caption: ["비고"],			ref: 'rmrk',      	type:'output',  width:'300px',    style:'text-align:center'},
	        {caption: ["예정번호"],		ref: 'prnmntno',	type:'output',  hidden: true},
	    ];
	    grdRawMtrWrhsprnmnt = _SBGrid.create(SBGridProperties);
	    grdRawMtrWrhsprnmnt.bind("afterpagechanged" , fn_pagingRawMtrWrhsprnmnt);
	    grdRawMtrWrhsprnmnt.bind('click','fn_selectedRawMtrWrhsprnmnt');
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
        },
        "personalSave" : {
        	"name": "개인화 저장",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "s",					//단축키
            "callback": fn_personalSave,		//콜백함수명
        },
        "personalLoad" : {
        	"name": "개인화 호출",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "l",					//단축키
            "callback": fn_personalLoad,		//콜백함수명
        },
        "colHidden" : {
        	"name": "열 숨기기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "h",					//단축키
            "callback": fn_colHidden,			//콜백함수명
        },
        "colShow" : {
        	"name": "열 보이기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "w",					//단축키
            "callback": fn_colShow,				//콜백함수명
        }
    };

    // 엑셀 다운로드
    function fn_excelDwnld() {
    	grdRawMtrWrhs.exportLocalExcel(
    						"입고실적", {
    							bSaveLabelData: true,
    							bNullToBlank: true,
    							bSaveSubtotalValue: true,
    							bCaptionConvertBr: true,
    							arrSaveConvertText: true
    						});
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdRawMtrWrhs.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdRawMtrWrhs.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden(){
    	grdRawMtrWrhs.setColHidden(grdRawMtrWrhs.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow(){
    	for(let i = grdRawMtrWrhs.getFixedCols(); i < grdRawMtrWrhs.getCols()-1; i++) {
    		grdRawMtrWrhs.setColHidden(i, false);
    	}
   	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}

	const fn_onChangeApc = async function() {
		fn_initSBSelect();
	}

	const fn_reset = function () {
		SBUxMethod.set('dtl-slt-itemCd', "");
		SBUxMethod.set('dtl-slt-vrtyCd', "");
		SBUxMethod.set('dtl-dtp-prnmntYmd', gfn_dateToYmd(new Date()));
		SBUxMethod.set('dtl-inp-prnmntQntt', "");
		SBUxMethod.set('dtl-inp-prnmntWght', "");
		SBUxMethod.set('dtl-inp-rmrk', "");
		SBUxMethod.set('dtl-inp-prnmntno', "");
	}

	/**
     * @name fn_selectedRawMtrWrhsprnmnt
     * @description 그리드 선택
     */
	const fn_selectedRawMtrWrhsprnmnt = function () {

		let nRow = grdRawMtrWrhsprnmnt.getRow();

		if (nRow > 0) {

			let rowData = grdRawMtrWrhsprnmnt.getRowData(nRow);

			SBUxMethod.set('dtl-slt-itemCd', rowData.itemCd);
			SBUxMethod.set('srch-slt-itemCd', rowData.prdcrCd);
			SBUxMethod.set('dtl-slt-vrtyCd', rowData.itemCd + rowData.vrtyCd);
			SBUxMethod.set("dtl-dtp-prnmntYmd", rowData.prnmntYmd + rowData.prnmntHr);
			SBUxMethod.set('dtl-inp-prnmntQntt', rowData.prnmntQntt);
			SBUxMethod.set('dtl-inp-prnmntWght', rowData.prnmntWght);
			SBUxMethod.set('dtl-inp-rmrk', rowData.rmrk || "");
			SBUxMethod.set('dtl-inp-prnmntno', rowData.prnmntno);
		}

	}

	/**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function () {

		let apcCd 		= gv_selectedApcCd;
		let prdcrCd 	= SBUxMethod.get('srch-slt-prdcrCd');
		let itemCd 		= SBUxMethod.get('dtl-slt-itemCd');
		let vrtyCd 		= SBUxMethod.get('dtl-slt-vrtyCd');
		let prnmntYmdHr = SBUxMethod.get('dtl-dtp-prnmntYmd');
		let prnmntQntt 	= SBUxMethod.get('dtl-inp-prnmntQntt') || 0;
		let prnmntWght 	= SBUxMethod.get('dtl-inp-prnmntWght') || 0;
		let rmrk 		= SBUxMethod.get('dtl-inp-rmrk');
		let prnmntno 	= SBUxMethod.get('dtl-inp-prnmntno');

		if (gfn_isEmpty(prdcrCd)) {
  			gfn_comAlert("W0001", "생산자");		//	W0001	{0}을/를 선택하세요.
            return;
		}
		if (gfn_isEmpty(itemCd)) {
  			gfn_comAlert("W0001", "품목");			//	W0001	{0}을/를 선택하세요.
            return;
		}
		if (gfn_isEmpty(vrtyCd)) {
  			gfn_comAlert("W0001", "품종");			//	W0001	{0}을/를 선택하세요.
            return;
		}
		if (gfn_isEmpty(prnmntYmdHr)) {
  			gfn_comAlert("W0001", "예정일시");		//	W0001	{0}을/를 선택하세요.
            return;
		}
		if (prnmntQntt == 0) {
  			gfn_comAlert("W0002", "수량");			//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (prnmntWght == 0) {
  			gfn_comAlert("W0002", "중량");			//	W0002	{0}을/를 선택하세요.
            return;
		}

		let prnmntYmd 	= prnmntYmdHr.substr(0,8);
		let prnmntHr 	= prnmntYmdHr.substr(8,4);
		let rowSts 		= "";

		if (gfn_isEmpty(prnmntno)) {
			rowSts		= "I";
			prnmntno 	= null;
		} else {
			rowSts 		= "U"
		}

		let rawMtrWrhsprnmnt = {
				apcCd 			: apcCd
			  , prdcrCd 		: prdcrCd
			  , itemCd 			: itemCd
			  , vrtyCd 			: vrtyCd.substr(4,4)
			  , prnmntYmd 		: prnmntYmd
			  , prnmntHr 		: prnmntHr
			  , prnmntQntt 		: prnmntQntt
			  , prnmntWght 		: prnmntWght
			  , rmrk 			: rmrk
			  , prnmntno		: prnmntno
			  , rowSts			: rowSts
		}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

		const postJsonPromise = gfn_postJSON("/fm/wrhs/multiRawMtrWrhsPrnmnt.do", rawMtrWrhsprnmnt);

		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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
     * @name fn_search
     * @description 조회 버튼
     */
     const fn_del = async function () {

    	let prnmntno = SBUxMethod.get('dtl-inp-prnmntno');

    	if (gfn_isEmpty(prnmntno)) {
    		gfn_comAlert("W0001", "삭제할 대상");		//	W0001	{0}을/를 선택하세요.
            return;
    	} else {

    		rawMtrWrhsprnmnt = {
    				prnmntno 	: prnmntno
    			  , prdcrCd		: SBUxMethod.get('srch-slt-prdcrCd')
    			  , apcCd		: gv_selectedApcCd
    		}

    		if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
        		return;
        	}

    		const postJsonPromise = gfn_postJSON("/fm/wrhs/deleteRawMtrWrhsPrnmnt.do", rawMtrWrhsprnmnt);

    		const data = await postJsonPromise;
            try {
            	if (_.isEqual("S", data.resultStatus)) {
            		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
            		fn_search();
            	} else {
            		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            	}
            } catch (e) {
        		if (!(e instanceof Error)) {
        			e = new Error(e);
        		}
        		console.error("failed", e.message);
            	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }

    	}

    }


	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
		if (	gfn_isEmpty(SBUxMethod.get("srch-dtp-prnmntYmdFrom"))
				|| gfn_isEmpty(SBUxMethod.get("srch-dtp-prnmntYmdTo"))){
			gfn_comAlert("W0001", "예정일자");		//	W0002	{0}을/를 선택하세요.
		    return;
		}

		// set pagination
    	grdRawMtrWrhsprnmnt.rebuild();
    	let pageSize = grdRawMtrWrhsprnmnt.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonRawMtrWrhsprnmnt.length = 0;
    	await fn_setGrdRawMtrWrhsprnmnt(pageSize, pageNo);
	}


	const fn_setGrdRawMtrWrhsprnmnt = async function(pageSize, pageNo) {
		let prnmntYmdFrom = SBUxMethod.get("srch-dtp-prnmntYmdFrom");	// 입고예정시작일자
   		let prnmntYmdTo = SBUxMethod.get("srch-dtp-prnmntYmdTo");		// 입고예정종료일자

  		// optional
  		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");	// 생산자
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");

 	    try{
 	    	let postUrl = "/fm/wrhs/selectRawMtrWrhsPrnmntList.do";
 			const postJsonPromise = gfn_postJSON(postUrl, {
	 				apcCd			: gv_selectedApcCd
	 			  , prnmntYmdFrom	: prnmntYmdFrom
	 			  , prnmntYmdTo		: prnmntYmdTo
	 			  , prdcrCd			: prdcrCd
	 			  , vrtyCd			: vrtyCd
	 			  , itemCd			: itemCd
	 	  		});

 	        const data = await postJsonPromise;

 	    	if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }

			/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonRawMtrWrhsprnmnt.length = 0;
          	data.resultList.forEach((item, index) => {
          		const rawMtrWrhsprnmnt = {
  						rowSeq			: item.rowSeq
  					  , apcCd			: item.apcCd
  					  , apcNm			: item.apcNm
  					  , prnmntYmd		: item.prnmntYmd
  					  , prnmntHr		: item.prnmntHr
  					  , prdcrCd			: item.prdcrCd
  					  , prdcrNm			: item.prdcrNm
  					  , itemCd			: item.itemCd
  					  , itemNm			: item.itemNm
  					  , vrtyCd			: item.vrtyCd
  					  , vrtyNm			: item.vrtyNm
  					  , prnmntQntt		: item.prnmntQntt
  					  , prnmntWght		: item.prnmntWght
  					  , rmrk			: item.rmrk
  					  , prnmntno		: item.prnmntno
  				}
          		jsonRawMtrWrhsprnmnt.push(rawMtrWrhsprnmnt);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  					document.querySelector('#cnt-wrhs').innerText = totalRecordCount;
  				}
  			});

          	//grdRawMtrWrhs.rebuild();
			document.querySelector('#cnt-wrhs').innerText = jsonRawMtrWrhsprnmnt.length;
          	if (jsonRawMtrWrhsprnmnt.length > 0) {
          		if(grdRawMtrWrhsprnmnt.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdRawMtrWrhsprnmnt.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdRawMtrWrhsprnmnt.rebuild();
  				}else{
  					grdRawMtrWrhsprnmnt.refresh();
  				}
          	} else {
          		grdRawMtrWrhsprnmnt.setPageTotalCount(totalRecordCount);
          		grdRawMtrWrhsprnmnt.rebuild();
         	}

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
     	}
	}

	// 페이징
    async function fn_pagingRawMtrWrhsprnmnt(){
    	let recordCountPerPage = grdRawMtrWrhsprnmnt.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdRawMtrWrhsprnmnt.getSelectPageIndex();
    	fn_setGrdRawMtrWrhsprnmnt(recordCountPerPage, currentPageNo);
    }


	/** main 레이아웃을 통해서 전달하고자 하는 탭에 선택한 row 정보를 전달함. **/
	let cfn_reqTab = function(){
		let idx = grdRawMtrWrhs.getRow();
		let data = grdRawMtrWrhs.getRowData(idx);
		/** 전달하고자하는 TAB의 아이디를 객체 필드에 담아서 전달 **/
		data.target = 'AM_001_002'
		let json = JSON.stringify(data);
		/** main에 선언되어있는 fn **/
		window.parent.cfn_openTabSearch(json);
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>