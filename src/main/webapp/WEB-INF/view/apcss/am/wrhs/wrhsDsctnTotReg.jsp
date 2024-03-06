
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
						id="btnCmndDocDsctn"
						name="btnCmndDocDsctn"
						uitype="normal"
						class="btn btn-sm btn-primary"
						text="입고확인서"
					></sbux-button>
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
						class="btn btn-sm btn-outline-danger"
						onclick="fn_save"
						text="저장"
					></sbux-button>
                    <sbux-button
						id="btnReg"
						name="btnReg"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_reg"
						text="등록"
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
									<span style="font-size:12px">입고내역집계</span>
								</li>
							</ul>

						<div class="ad_tbl_top" style="margin-bottom: 10px; text-align:right">
							<sbux-button
								id="btnAddRow"
								name="btnAddRow"
								uitype="normal"
								class="btn btn-sm btn-outline-danger"
								onclick="fn_addRow"
								text="행추가"
							></sbux-button>
					    </div>
						<div id="sb-area-wrhsDsctnTot" style="height:544px;"></div>

				</div>
			</div>

	</section>
	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>
	<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>

<script type="text/javascript">

		var jsonComItem				= [];	// 품목 		itemCd			검색
		var jsonComVrty				= [];
		var jsonPrdcr				= [];
		var jsonPrdcrAutocomplete 	= [];

	window.addEventListener('DOMContentLoaded', async function(e) {

		fn_init();


	})
	document.getElementById("sb-area-wrhsDsctnTot").addEventListener('keypress',(e)=>{
		if(e.keyCode===13){
			e.preventDefault();
			document.querySelector('sb-area-wrhsDsctnTot').blur();
		}
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
	    SBGridProperties.columns = [
	    	{caption : [],	ref : 'checkedYn',		width : '40px',	style : 'text-align:center',	type : 'radio', 			typeinfo : {checkedvalue : 'yes', uncheckedvalue : 'false'}},
	    	{caption : ["입고일자","입고일자"], ref: 'wrhsYmd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	    	{caption : ["구분","구분"], ref: 'prdcrNm', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;'},
	    	{caption : ["빨강","1차"], ref: 'redV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["빨강","2차"], ref: 'redV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["빨강","3차"], ref: 'redV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["빨강","4차"], ref: 'redV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["빨강","5차"], ref: 'redV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["빨강","소계"], ref: 'redSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff;', format : {type:'number', rule:'#,###'}, fixedstyle : 'background-color:#ceebff;'},

	    	{caption : ["노랑","1차"], ref: 'ylwV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["노랑","2차"], ref: 'ylwV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["노랑","3차"], ref: 'ylwV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["노랑","4차"], ref: 'ylwV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["노랑","5차"], ref: 'ylwV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["노랑","소계"], ref: 'ylwSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff', format : {type:'number', rule:'#,###'},fixedstyle : 'background-color:#ceebff;'},

	    	{caption : ["주황","1차"], ref: 'orngV1', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["주황","2차"], ref: 'orngV2', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["주황","3차"], ref: 'orngV3', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["주황","4차"], ref: 'orngV4', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["주황","5차"], ref: 'orngV5', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; ', format : {type:'number', rule:'#,###'}},
	    	{caption : ["주황","소계"], ref: 'orngSbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#ceebff ', format : {type:'number', rule:'#,###'},fixedstyle : 'background-color:#ceebff;'},

	    	{caption : ["총합계","총합계"], ref: 'totSum', type: 'input',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
	    	{caption : ["비고","비고"], ref: 'rmrk', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;'},
	    	{caption: ["생산자코드"],	ref: 'prdcrCd',     		type:'input',  	hidden: true}


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
	        	    ,   prdcrCd : item.prdcrCd
	        	    ,   wrhsYmd : item.wrhsYmd
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
	        grdWrhsDsctnTot.setCellStyles(0,3,0,7,'background:#FF0000');
			grdWrhsDsctnTot.setCellStyles(0,8,0,13,'background:#FFFC33');
			grdWrhsDsctnTot.setCellStyles(0,14,0,19,'background:#FFB533');

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
	const fn_wrhsReq = async function() {

		const param = {
			apcCd: gv_selectedApcCd,
			linkKnd: 'W',
			wrhsReqYn: 'Y'
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

     /**
      * @name fn_docWrhsDsctnTot
      * @description 입고집계내역 발행 버튼
      */
 	const fn_docWrhsDsctnTot = function() {

 		const grdWrhsDsctnTotList = [];
 		const allData = grdWrhsDsctnTot.getGridDataAll();
 		allData.forEach((item, index) => {
 			if (item.checkedYn === "yes") {
 					grdWrhsDsctnTotList.push(
 						item.prdcrCd
 						, item.wrhsYmd
 					);
 				}

 		});
 		if (grdWrhsDsctnTotList.length === 0) {
 			gfn_comAlert("W0005", "선택대상");		//	W0005	{0}이/가 없습니다.
 			return;
 		}
 		const list = grdWrhsDsctnTotList.join("','");

 		gfn_popClipReport("입고확인서", "am/popWrhsDsctnTot.crf", {apcCd: gv_selectedApcCd, prdcrCd : grdWrhsDsctnTotList[0] , wrhsYmd : grdWrhsDsctnTotList[1]});
 	}
 	/**
     * @name fn_addRow
     * @description 행 추가 버튼
     */
 	const fn_addRow = function(){
 		let prdcrNm = SBUxMethod.get("srch-inp-prdcrNm");
 		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
 		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
 		grdWrhsDsctnTot.addRow(true,{'wrhsYmd':wrhsYmdFrom,'prdcrNm':prdcrNm,'prdcrCd':prdcrCd});
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

</script>
</html>