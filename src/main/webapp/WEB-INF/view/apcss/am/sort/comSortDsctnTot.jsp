
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

							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-vrtyCd"
									name="srch-inp-vrtyCd"
									class="form-control input-sm"
									maxlength="33"
									show-clear-button="true"
									readonly
								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
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
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm input-sm-ast"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
   								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
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
	<input type="hidden" id="vrtyCd" name="vrtyCd">
	<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" header-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>
</body>

<script type="text/javascript">

	var jsonComItem				= [];	// 품목 		itemCd			검색
	var jsonComVrty				= [];
	var jsonPrdcr				= [];
    var jsonPrdcrAutocomplete 	= [];

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
				type: 'grand',
				position: 'bottom',
				columns: {
					standard: [4],
					sum: [5,6,7,8,9,10,11,12,13,14]
				},



			grandtotalrow: {
				titlecol: 4,
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
	    	{caption : ["품목","품목"], ref: 'itemNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["품종","품종"], ref: 'vrtyNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["구분","구분"], ref: 'prdcrNm', type: 'output',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["선별일자","선별일자"], ref: 'inptYmd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled:true  },
	    	{caption : ["1차","수량"], ref: 'sortQntt1', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["1차","중량"], ref: 'sortWght1', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["2차","수량"], ref: 'sortQntt2', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["2차","중량"], ref: 'sortWght2', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["3차","수량"], ref: 'sortQntt3', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["3차","중량"], ref: 'sortWght3', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["4차","수량"], ref: 'sortQntt4', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["4차","중량"], ref: 'sortWght4', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["5차","수량"], ref: 'sortQntt5', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["5차","중량"], ref: 'sortWght5', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["-"], ref: '-', type: 'output',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption: ["생산자코드"],	ref: 'rprsPrdcrCd',     		type:'input',  	hidden: true}


	    ];
	    grdSortDsctnTot = _SBGrid.create(SBGridProperties);
	    grdSortDsctnTot.bind('click', 'fnClick')


	}

	function fnClick(){
		this.inputmode = 'none';
	}




	// 선별구분
	const fn_setSortDsctnTot = async function() {

		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = vrtyCds.length > 0 ? vrtyCds.join(',') : "";


		const param = {
			apcCd: gv_selectedApcCd,
			inptYmdFrom: inptYmdFrom,
			inptYmdTo: inptYmdTo,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			rprsPrdcrCd : prdcrCd
		}

		jsonSortDsctnTot.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/sort/selectComDsctnTotList.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
	        data.resultList.forEach((item, index) => {
	        	const SortDsctnTot = {
	        			grd : item.grd
	        			,   prdcrNm : item.prdcrNm
		        	    ,   rprsPrdcrCd : item.rprsPrdcrCd
		        	    ,   itemNm  : item.itemNm
		        	    ,   vrtyNm  : item.vrtyNm
		        	    ,   inptYmd : item.inptYmd
		        		,	sortQntt1 : item.sortQntt1
		        		,	sortQntt2 : item.sortQntt2
		        		,	sortQntt3 : item.sortQntt3
		        		,	sortQntt4 : item.sortQntt4
		        		,	sortQntt5 : item.sortQntt5
		        		,	sortWght1 : item.sortWght1
		        		,	sortWght2 : item.sortWght2
		        		,	sortWght3 : item.sortWght3
		        		,	sortWght4 : item.sortWght4
		        		,	sortWght5 : item.sortWght5

	        	}
	        	jsonSortDsctnTot.push(SortDsctnTot);
	        });


	        const allData = grdSortDsctnTot.getGridDataAll();


	        grdSortDsctnTot.refresh();

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

 		gfn_popClipReport("선별확인서", "am/popSortDsctnTot.crf", {apcCd: gv_selectedApcCd, prdcrCd : grdSortDsctnTotList[0] , inptYmd : grdSortDsctnTotList[1]});
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
 	const fn_setPrdcrForm = async function(prdcr) {

		if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
			await gfn_setApcVrtySBSelect('srch-inp-vrtyCd', jsonComVrty, gv_selectedApcCd);
			SBUxMethod.set("srch-inp-vrtyCd", prdcr.rprsVrtyNm);
			SBUxMethod.setValue('srch-slt-itemCd', prdcr.rprsItemCd);
		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.setValue('srch-slt-itemCd', prdcr.rprsItemCd);
					fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
				}
			}
		}

		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}

	}

 	/*
	* @name fn_getPrdcrs
	* @description 생산자 자동완성 목록 가져오기
	*/
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
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
		fn_setPrdcrForm(prdcr);
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

			fn_setPrdcrForm(prdcr);
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

	 const fn_modalVrty = function() {
	    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
		}

	 var vrtyCds = [];

	    const fn_setVrty = function(vrty) {
			if (!gfn_isEmpty(vrty)) {
				vrtyCds = [];
				vrtyCds.push(vrty.vrtyCd);
				SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
				SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyNm);

			}
		}

	    const fn_setVrtys = function(vrtys) {
			if (!gfn_isEmpty(vrtys)) {
				var _vrtys = [];
				vrtyCds = [];
				var diff = false;
				for(var i=0;i<vrtys.length;i++){
					if (vrtys[0].itemCd != vrtys[i].itemCd) {
						diff = true;
					}
					_vrtys.push(vrtys[i].vrtyNm);
					vrtyCds.push(vrtys[i].vrtyCd);
				}
				if (diff) {
					SBUxMethod.set('srch-slt-itemCd', "");
				} else {
					SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
				}
				SBUxMethod.set('srch-inp-vrtyCd', _vrtys.join(','));
			}
		}

	    function fn_selectItem(){
			let itemCd = SBUxMethod.get("srch-slt-itemCd");
			if (gfn_isEmpty(itemCd)) {
				vrtyCds = [];
			}
			SBUxMethod.set("srch-inp-vrtyCd", "");

		}

</script>
</html>