
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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

				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>

				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별결과표 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
                            id="btn-srch-apcLinkPop"
                            name="btn-srch-apcLinkPop"
                            class="btn-sm btn-outline-danger"
                            text="연계요청"
                            uitype="modal"
                            target-id="modal-apcLinkPop"
                            onclick="fn_popApcLink"
                       ></sbux-button>
                    <sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn-sm btn-outline-danger"
						onclick="fn_search"
						text="조회"
					></sbux-button>
				</div>
			</div>

			<div class="box-body srch-keyup-area" style="display: flex;flex-direction: column">
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

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 4%">
						<col style="width: 3%">
						<col style="width: 3%">

						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th colspan="1" scope="row" class="th_bg">선별일자</th>
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

							<th colspan="1" scope="row" class="th_bg">선별기</th>
							<td colspan="2" class="td_input" style="border-right: hidden;border-top: hidden">
								<sbux-select uitype="single" id="srch-slt-fcltCd" name="srch-slt-fcltCd" class="form-control input-sm" jsondata-ref="jsonComFcltCd" onchange="fn_selectSortFclt" unselected-text="전체" ></sbux-select>
							</td>
							<td colspan="8" style="border-top: hidden;"></td>
							</tr>
							<tr>
							<th colspan="1" scope="row" class="th_bg">생산자</th>
							<td colspan="2"  class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
									autocomplete-height="270px"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<th colspan = "1" scope="row" class="th_bg">품목</th>
							<td colspan = "2"class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonApcItem"
									onchange="fn_selectItem"
								></sbux-select>
							</td>
								<td colspan="8"></td>
						</tr>
					</tbody>
				</table>

                <div class="table-responsive tbl_scroll_sm" style="flex: 1 ;margin-top: 2vh">
                    <sbux-tabs
                        id="idxTab_norm"
                        name="idxTab_norm"
                        uitype="normal"
                        is-scrollable="false"
                        jsondata-ref="tabJsonData"
						callback-after-select="fn_selectTab"
                    ></sbux-tabs>
                    <div class="tab-content" style="overflow: initial !important;">
                        <div id="exhstDsctnTab">
                            <div id="sb-area-exhstDsctn" style="height: 470px;"></div>
                        </div>
                        <div id="grdDsctnTab">
                            <div id="sb-area-grdDsctn" style="height: 470px;"></div>
                            <sbux-button
                                id="btn-srch-type"
                                name="btn-srch-type"
								class="sbux-btn sbux-exist sbux-comp-root sbux-uuid-btn-srch-apcLinkPop btn-sm btn-outline-danger"
                                text="고당당도"
                                uitype="normal"
                                style="position: absolute; top: -31px; left: 208px;"
                                onclick="fn_toggleGridType"
                            ></sbux-button>
							<sbux-button
									id="btn-srch-typePrint"
									name="btn-srch-typePrint"
									class="sbux-btn sbux-exist sbux-comp-root sbux-uuid-btnCmndDocPckg btn-sm btn-primary"
									text="출력"
									uitype="normal"
									style="position: absolute; top: -31px; left: 275px;"
									onclick="fn_typePrint"
									disabled
							></sbux-button>
                        </div>
                        <div id="grdSortBffaTab">
                            <div id="sb-area-sortBffa" style="height: 470px;"></div>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</section>
<%--	<sbux-progress id="idxProg" name="progNm" uitype="loading" show-openlayer="true">--%>
<%--	</sbux-progress>--%>
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
    <div>
        <sbux-modal
            id="modal-apcLinkPop"
            name="modal-apcLinkPop"
            uitype="middle"
            header-title="선별연계수신"
            body-html-id="body-modal-apcLinkPop"
            header-is-close-button="false"
            footer-is-close-button="false"
            style="width:800px"
        ></sbux-modal>
    </div>
    <div id="body-modal-apcLinkPop">
        <jsp:include page="../../am/popup/apcLinkPopup.jsp"></jsp:include>
     </div>
	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>

	<div>
    	<sbux-modal id="modal-regSort" name="modal-regSort" uitype="middle" header-title="참외 육안선별 등록" body-html-id="body-modal-regSort" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
	</div>
	<div id="body-modal-regSort">
    	<jsp:include page="../../am/popup/regSortBffa.jsp"></jsp:include>
	</div>
	<div id="luckysheet" style="position: fixed;height: 100%;width: 100%; z-index: 10000;"></div>


</body>
<script src="${ctx}/js/out/sheet.bundle.js"></script>
<script type="text/javascript">

	let lv_interval = 3 * 60 * 1000;

	let timerId;

	const fn_clearBatch = () => {
		if (!gfn_isEmpty(timerId)) {
			clearInterval(timerId);
		}
	}

	let currApcLink;

    let gridToggle = false;
	/** 등급별 집계 select **/
	function fn_selectTab (){
		let tab = SBUxMethod.get("idxTab_norm");
		if(tab === 'grdDsctnTab'){
			SBUxMethod.hide('srch-dtp-inptYmdTo');
		}else{
			SBUxMethod.show('srch-dtp-inptYmdTo');
		}
	}

	/** excel 함수 수식 **/
	let excelFx = [51,51,66,76,86,106,121,150,150];

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

				const apcLink = data.resultMap;
				fn_setApcLink(apcLink);

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


	var jsonComFcltCd				= [];	// 선별기
	var jsonPrdcrAutocomplete = []; // 생산자
	var jsonApcItem			= [];	// 품목 	itemCd			검색

	window.addEventListener('DOMContentLoaded', async function(e) {
		//SBUxMethod.openModal('modal-apcLinkPop');
		fn_init();

	})

	const fn_init = async function() {

		SBUxMethod.set("dtl-inp-apcCd", gv_selectedApcNm);
		SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
		//fn_createExhstDsctn();
		//fn_createGrdDsctn();

		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-fcltCd',jsonComFcltCd, 'SORT_FCLT_CD', 	gv_selectedApcCd),	// 설비
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),								// 품목
			fn_getApcLink()
		]);
		fn_getPrdcrs();



		if(gv_selectedApcCd === "0203" || gv_selectedApcCd === "0582"){
			SBUxMethod.hideTab('idxTab_norm','grdSortBffaTab');
		}else if(gv_selectedApcCd === '0182'){
			SBUxMethod.hideTab('idxTab_norm','grdSortBffaTab');
			SBUxMethod.hideTab('idxTab_norm','grdDsctnTab');
		}

		fn_selectSortBffaType();
		fn_search();
		fn_bffaSearch();
	}


	//그리드 id, 그리드 json
	//배출구별 집계 내역
	var grdExhstDsctn;
	//등급별 집계 내역
	var grdGrdDsctn;
	//육안등급판정
	var grdSortBffa;

	//배출구별 집계 내역
	var jsonExhstDsctn = [];
	//등급별 집계 내역
	var jsonGrdDsctn= [];
    //고당당도 내역
    var jsonHghSwt = [];
	//육안등급판정내역
	var jsonSortBffa= [];

	var jsonExhstColumnData = [];
	var jsonGrdColumnData = [];
	var jsonGrdDsctnColumnData = [];
    var jsonHghSwtColumnData = [];
	var jsonSortBffa = [];
    var exhstDsctnColumns = [];
    var addSortRsltExhstCol = [];

    /** 육안선별 코드 변수 **/
    var BffaGrdType = [];

    var tabJsonData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "배출구별 집계", "targetid" : "exhstDsctnTab", "targetvalue" : "배출구별 집계" },
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "등급별 집계", "targetid" : "grdDsctnTab", "targetvalue" : "등급별 집계" },
		{ "id" : "3", "pid" : "-1", "order" : "3", "text" : "육안등급판정", "targetid" : "grdSortBffaTab", "targetvalue" : "육안등급판정" }
	];

    const fn_createExhstDsctn = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-exhstDsctn';
        SBGridProperties.id = 'grdExhstDsctn';
        SBGridProperties.jsonref = 'jsonExhstDsctn';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.mergecells = 'bycolrec';
        SBGridProperties.fixedrowheight = 50;
        SBGridProperties.allowcopy = true;
        SBGridProperties.contextmenu = true;  // 우클릭 메뉴 호출 여부
        SBGridProperties.contextmenulist = objMenuList1;  // 우클릭 메뉴 리스트
        SBGridProperties.clickeventarea = {fixed: false, empty: false};
        SBGridProperties.backcoloralternate = '#E0FFFF';
        SBGridProperties.columns = [
            {caption: ["선별기"], ref: 'sortFclt', type: 'input', width: '100px', style: 'text-align: center; padding-right: 5px;', disabled: true},
            {caption: ["품종"], ref: 'vrtyNm', type: "input", width: '100px', style: 'text-align: center; padding-right: 5px;', disabled: true},
            {caption: ["회원정보"], ref: 'sortInfo', type: 'input', width: '100px', style: 'text-align: center; padding-right: 5px;', disabled: true},
            {caption: ["등급"], ref: 'grd', type: 'input', width: '50px', style: 'text-align: center;', disabled: true},
            {caption: ["소계"], ref: 'sbTot', type: 'input', width: '100px', style: 'text-align: right; padding-right: 5px; background-color: #E0FFFF;', format: {type: 'number', rule: '#,##0', emptyvalue: '0'}, disabled: true},
            {caption: ["비고"], ref: 'rmrk', type: 'input', width: '50px', style: 'text-align: right; padding-right: 5px;', disabled: true},
            {caption: ["생산자코드"],	ref: 'prdcrCd', type: 'input', hidden: true},
            {caption: ["선별번호"], ref: 'sortNo', type: 'input', hidden: true}
        ];

        addSortRsltExhstCol = [];

        jsonExhstColumnData.forEach(function(item) {
            addSortRsltExhstCol.push({
                caption: [item.GRD_NM],
                ref: 'exhst' + item.GRD_SN,
                type: 'input',
                width: '50px',
                style: 'text-align: right; padding-right: 5px;',
                format: {
                    type: 'number',
                    rule: '#,###',
                    emptyvalue: '0'
                },
                merge: false,
                disabled: true
            });
        })

        let originColumns = SBGridProperties.columns;
        originColumns.splice(4, 0, ...addSortRsltExhstCol);
        SBGridProperties.columns = originColumns;

        grdExhstDsctn = _SBGrid.create(SBGridProperties);
        // grdExhstDsctn.bind('click', fnClick);
        grdExhstDsctn.rebuild();
    }

    const fn_createGrdDsctn = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdDsctn';
        SBGridProperties.id = 'grdGrdDsctn';
        SBGridProperties.jsonref = 'jsonGrdDsctn';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.mergecells = 'bycolrec';
        SBGridProperties.fixedrowheight = 50;
        SBGridProperties.allowcopy = true;
        SBGridProperties.contextmenu = true;  // 우클릭 메뉴 호출 여부
        SBGridProperties.contextmenulist = objMenuList2;  // 우클릭 메뉴 리스트
        SBGridProperties.backcoloralternate = '#E0FFFF';
        SBGridProperties.clickeventarea = {fixed: false, empty: false};
        SBGridProperties.columns = [
            {caption: ["선별기"], ref: 'sortFclt', type: 'input', width: '100px', style: 'text-align: center; padding-right: 5px;', disabled: true},
            {caption: ["품종"], ref: 'vrtyNm', type: "input", width: '100px', style: 'text-align: center; padding-right: 5px;', disabled: true},
            {caption: ["회원정보"], ref: 'sortInfo', type: 'input', width: '100px', style: 'text-align: center; padding-right: 5px;', disabled: true},
            {caption: ["등급"], ref: 'grd', type: 'input', width: '50px', style: 'text-align: center;', disabled: true},
            {caption: ["소계"], ref: 'sbTot', type: 'input', width: '100px', style: 'text-align: right; padding-right: 5px; background-color: #E0FFFF;', format: {type: 'number', rule: '#,###'}, fixedstyle: 'background-color: #E0FFFF;', merge: false, disabled: true},
            {caption: ["비고"], ref: 'rmrk', type: 'input',  width: '50px', style: 'text-align: right; padding-right: 5px;', disabled: true},
            {caption: ["생산자코드"],	ref: 'prdcrCd', type: 'input', hidden: true},
            {caption: ["선별번호"], ref: 'sortNo', type: 'input', hidden: true}
        ];

        let addSortRsltGrdCol = [];

		jsonGrdDsctnColumnData.forEach(function(item) {
            addSortRsltGrdCol.push({
                caption: [item.grdNm],
                ref: 'grd' + item.sn,
                type: 'input',
                width: '80px',
                style: 'text-align: right; padding-right: 5px;',
                merge: false,
                disabled: true,
				format:{type:'number',rule:'#.###'}
            });
        });

        let originColumns = SBGridProperties.columns;
        originColumns.splice(4, 0, ...addSortRsltGrdCol);
        SBGridProperties.columns = originColumns;
        grdGrdDsctn = _SBGrid.create(SBGridProperties);
        // grdGrdDsctn.bind('click', fnClick);
    }

    const fn_createHghSwt = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdDsctn';
        SBGridProperties.id = 'grdGrdDsctn';
        SBGridProperties.jsonref = 'jsonHghSwt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.mergecells = 'bycolrec';
        SBGridProperties.fixedrowheight = 50;
        SBGridProperties.allowcopy = true;
        SBGridProperties.contextmenu = true;
        SBGridProperties.contextmenulist = objMenuList2;
        SBGridProperties.backcoloralternate = '#E0FFFF';
        SBGridProperties.clickeventarea = {fixed: false, empty: false};
        SBGridProperties.columns = [
            {caption: ["농가명"], ref: 'prdcrNm', type: 'input', width: '100px', style: 'text-align: center;', disabled: true},
            {caption: ["품종"], ref: 'vrtyNm', type: "input", width: '100px', style: 'text-align: center;', disabled: true},
            {caption: ["계약"], ref: 'ctrt', type: 'input', width: '100px', style: 'text-align: center;', disabled: true},
            {caption: ["규격"], ref: 'spcfctNm', type: 'input', width: '100px', style: 'text-align: center;', merge: false, disabled: true},
            {caption: ["파렛트"], ref: 'plt', type: 'input', width: '100px', style: 'text-align: center;', merge: false, disabled: true},
            {caption: ["미달"], ref: 'lak', type: 'input', width: '100px', style: 'text-align: center;', merge: false, disabled: true},
            {caption: ["합계"], ref: 'sum', type: 'input', width: '100px', style: 'text-align: center;', merge: false, disabled: true}
        ];

        let addSortRsltGrdCol = [];
        let i = 1;

        const rmrkColumnData = new Set(jsonHghSwtColumnData.map(item => item.RMRK));

        rmrkColumnData.forEach(function(RMRK) {
            addSortRsltGrdCol.push({
                caption: [RMRK],
                ref: 'rmrk' + (i++),
                type: 'input',
                width: '80px',
                style: 'text-align: right; padding-right: 5px;',
                merge: false,
                disabled: true
            });
        });

        let originColumns = SBGridProperties.columns;
        originColumns.splice(5, 0, ...addSortRsltGrdCol);
        SBGridProperties.columns = originColumns;

        grdGrdDsctn = _SBGrid.create(SBGridProperties);
    }

    const fn_createSortBffa = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-sortBffa';
        SBGridProperties.id = 'grdSortBffa';
        SBGridProperties.jsonref = 'jsonSortBffa';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.extendlastcol = 'scroll';
        // SBGridProperties.mergecells = 'bycolrec';
        SBGridProperties.fixedrowheight = 50;
        SBGridProperties.allowcopy = true;
        SBGridProperties.contextmenu = true;  // 우클린 메뉴 호출 여부
        SBGridProperties.contextmenulist = objMenuList3;  // 우클릭 메뉴 리스트
        // SBGridProperties.backcoloralternate = '#E0FFFF';
        SBGridProperties.dblclickeventarea = {fixed: false, empty: false};
        SBGridProperties.columns = [
            {caption: ["선별일자"], ref: 'sortYmd', type: 'input', width: '100px', style: 'text-align: center; padding-right: 5px;', disabled: true},
            {caption: ["선별기"], ref: 'sortFclt', type: 'input', width: '100px', style: 'text-align: center; padding-right: 5px;', disabled: true},
            {caption: ["선별정보"], ref: 'prdcrNm', type: 'input', width: '100px', style: 'text-align: center; padding-right: 5px;', disabled: true},
            {caption: ["박스수량"], ref: 'wrhsQntt', type: 'input', width: '100px', style: 'text-align: center; padding-right: 5px;', disabled: true},
            {caption: ["입고중량"], ref: 'wrhsWght', type: 'input', width: '100px', style: 'text-align: center; padding-right: 5px;', disabled: true},
            {caption: ["열과"], ref: 'grdType1Wght', type: 'input', width: '100px', style: 'text-align: center; padding-right: 5px;', disabled: true},
            {caption: ["폐기"], ref: 'grdType2Wght', type: 'input', width: '100px', style: 'text-align: center; padding-right: 5px;', disabled: true},
            {caption: ["합계"], ref: 'sbTot', type: 'input', width: '100px', style: 'text-align: right; padding-right: 5px; background-color: #E0FFFF;', format: {type: 'number', rule: '#,###', emptyvalue: '0'}, fixedstyle: 'background-color: #E0FFFF;', merge: false, disabled: true},
            {caption: ["비고"], ref: 'rmrk', type: 'input', width: '50px', style: 'text-align: right; padding-right: 5px;', disabled: true},
            {caption: ["생산자코드"],	ref: 'prdcrCd', type: 'input', hidden: true},
            {caption: ["설비코드"], ref: 'fcltCd', type: 'input', hidden: true},
            {caption: ["선별번호"], ref: 'sortNo', type: 'input', hidden: true},
            {caption: ["grdType3Wght"],	ref: 'grdType3Wght', type: 'input', hidden: true},
            {caption: ["grdType4Wght"],	ref: 'grdType4Wght', type: 'input', hidden: true},
            {caption: ["grdType5Wght"],	ref: 'grdType5Wght', type: 'input', hidden: true},
            {caption: ["사전입고번호"], ref: 'bffaWrhsno', type: 'input', hidden: true},
            {caption: ["품목코드"], ref: 'itemCd', type: 'input', hidden: true},
            {caption: ["입고총중량"],	ref: 'wholWght', type: 'input', hidden: true}
        ];

        let addSortBffaCol = []

        jsonGrdColumnData.forEach(function(item) {
            addSortBffaCol.push({
                caption: [item.GRD_NM],
                ref: 'grd' + item.GRD_SN,
                type: 'input',
                width: '100px',
                style: 'text-align: right; padding-right: 5px;',
                format: {
                    type: 'number',
                    rule: '#,###',
                    emptyvalue: '0'
                },
                merge: false,
                disabled: true
            });
        })

        let originColumns = SBGridProperties.columns;
        originColumns.splice(7, 0, ...addSortBffaCol);
        SBGridProperties.columns = originColumns;
        grdSortBffa = _SBGrid.create(SBGridProperties);
        grdSortBffa.bind('dblclick', fn_reg_bffa);
    }

    /**
     * @name fn_toggleGridType
     * @description 고당당도 탭 클릭 event
     */
    const fn_toggleGridType = function() {
        if(gridToggle) {
            fn_createGrdDsctn();
			SBUxMethod.attr('btn-srch-typePrint', 'disabled', 'true');
            gridToggle = false;
        } else {
            fn_createHghSwt();
			SBUxMethod.attr('btn-srch-typePrint', 'disabled', 'false');
            gridToggle = true;
        }
    }

	const fnClick = function(){
		//fn_createGrid();
		//SBUxMethod.openModal('modal-regSort');
	}

    const fn_popApcLinkCallBack = function() {

    }

     const fn_popApcLink = function() {
         popApcLink.init(
                     {
                         apcCd: gv_selectedApcCd,
                         apcNm: gv_selectedApcNm,
                         linkKnd: "S",
                         kndList: ["S"]
                     },
                     fn_popApcLinkCallBack
                 );
     }

    function sumValues(obj1, obj2) {
        const result = {};
        for(const key in obj1) {
            if(obj1.hasOwnProperty(key)) {
                const val1 = obj1[key];
                const val2 = obj2[key] || 0;
                result[key] = val1 + val2
            }
        }
        return result;
    }

    // 배출구별 집계
    const fn_setExhstDsctnTot = async function() {
        let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
        let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
        let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
        let sortFclt = SBUxMethod.get("srch-slt-fcltCd");
        let itemCd = SBUxMethod.get("srch-slt-itemCd");

        const param = {
            apcCd: gv_selectedApcCd,
            prdcrCd: prdcrCd,
            inptYmdFrom: inptYmdFrom,
            inptYmdTo: inptYmdTo,
            sortFclt: sortFclt,
            itemCd: itemCd
        }

        jsonExhstDsctn.length = 0;

        let totalRecordCount = 0;

        try {
            let sumTot1 = {exhst1: 0, exhst2: 0, exhst3: 0, exhst4: 0, exhst5: 0, exhst6: 0, exhst7: 0, exhst8: 0, exhst9: 0, exhst10: 0, exhst11: 0, exhst12: 0, exhst13: 0, exhst14: 0, exhst15: 0, exhst16: 0, exhst17: 0, exhst18: 0, exhst19: 0, exhst20: 0, exhst21: 0, exhst22: 0, exhst23: 0};
            let sumTot2 = {exhst1: 0, exhst2: 0, exhst3: 0, exhst4: 0, exhst5: 0, exhst6: 0, exhst7: 0, exhst8: 0, exhst9: 0, exhst10: 0, exhst11: 0, exhst12: 0, exhst13: 0, exhst14: 0, exhst15: 0, exhst16: 0, exhst17: 0, exhst18: 0, exhst19: 0, exhst20: 0, exhst21: 0, exhst22: 0, exhst23: 0};

            const postJsonPromise = gfn_postJSON("/am/sort/selectExhstDsctn.do", param, null, false);
            const data = await postJsonPromise;
            data.resultList.forEach((item, index) => {
                const exhstDsctnQnttTot = {
                    sortFclt: item.FCLT_NM,
                    sortInfo: item.PRDCR_NM,
                    sbTot: item.SORT_QNTT,
                    vrtyNm: item.VRTY_NM,
                    grd: "수량",
                    exhst1: item.QNTT_1,
                    exhst2: item.QNTT_2,
                    exhst3: item.QNTT_3,
                    exhst4: item.QNTT_4,
                    exhst5: item.QNTT_5,
                    exhst6: item.QNTT_6,
                    exhst7: item.QNTT_7,
                    exhst8: item.QNTT_8,
                    exhst9: item.QNTT_9,
                    exhst10: item.QNTT_10,
                    exhst11: item.QNTT_11,
                    exhst12: item.QNTT_12,
                    exhst13: item.QNTT_13,
                    exhst14: item.QNTT_14,
                    exhst15: item.QNTT_15,
                    exhst16: item.QNTT_16,
                    exhst17: item.QNTT_17,
                    exhst18: item.QNTT_18,
                    exhst19: item.QNTT_19,
                    exhst20: item.QNTT_20,
                    exhst21: item.QNTT_21,
                    exhst22: item.QNTT_22,
                    exhst23: item.QNTT_23,
                    exhst24: item.QNTT_24,
                    exhst25: item.QNTT_25,
                    exhst26: item.QNTT_26,
                    exhst27: item.QNTT_27,
                    exhst28: item.QNTT_28,
                    exhst29: item.QNTT_29,
                    exhst30: item.QNTT_30
                };

                const exhstDsctnWghtTot = {
                    sortFclt: item.FCLT_NM,
                    sortInfo: item.INPT_YMD,
                    sbTot: item.SORT_WGHT,
                    vrtyNm: item.VRTY_NM,
                    grd: "중량",
                    exhst1: item.WGHT_1,
                    exhst2: item.WGHT_2,
                    exhst3: item.WGHT_3,
                    exhst4: item.WGHT_4,
                    exhst5: item.WGHT_5,
                    exhst6: item.WGHT_6,
                    exhst7: item.WGHT_7,
                    exhst8: item.WGHT_8,
                    exhst9: item.WGHT_9,
                    exhst10: item.WGHT_10,
                    exhst11: item.WGHT_11,
                    exhst12: item.WGHT_12,
                    exhst13: item.WGHT_13,
                    exhst14: item.WGHT_14,
                    exhst15: item.WGHT_15,
                    exhst16: item.WGHT_16,
                    exhst17: item.WGHT_17,
                    exhst18: item.WGHT_18,
                    exhst19: item.WGHT_19,
                    exhst20: item.WGHT_20,
                    exhst21: item.WGHT_21,
                    exhst22: item.WGHT_22,
                    exhst23: item.WGHT_23,
                    exhst24: item.WGHT_24,
                    exhst25: item.WGHT_25,
                    exhst26: item.WGHT_26,
                    exhst27: item.WGHT_27,
                    exhst28: item.WGHT_28,
                    exhst29: item.WGHT_29,
                    exhst30: item.WGHT_30
                }

                jsonExhstDsctn.push(exhstDsctnQnttTot);
                jsonExhstDsctn.push(exhstDsctnWghtTot);

                sumTot1 = sumValues(sumTot1, exhstDsctnQnttTot);
                sumTot2 = sumValues(sumTot2, exhstDsctnWghtTot);
            });

            sumTot1["sortFclt"] = "합계"; sumTot1["grd"] = "수량"; sumTot1["sortInfo"] = "합계"; sumTot1["vrtyNm"] = "합계";
            sumTot1["sbTot"] = sumTot1.exhst1 + sumTot1.exhst2 + sumTot1.exhst3 + sumTot1.exhst4 + sumTot1.exhst5 + sumTot1.exhst6 + sumTot1.exhst7 + sumTot1.exhst8 + sumTot1.exhst9 + sumTot1.exhst10 + sumTot1.exhst11 + sumTot1.exhst12 + sumTot1.exhst13 + sumTot1.exhst14 + sumTot1.exhst15 + sumTot1.exhst16 + sumTot1.exhst17 + sumTot1.exhst18 + sumTot1.exhst19 + sumTot1.exhst20 + sumTot1.exhst21 + sumTot1.exhst22 + sumTot1.exhst23 + sumTot1.exhst24 + sumTot1.exhst25 + sumTot1.exhst26 + sumTot1.exhst27 + sumTot1.exhst28 + sumTot1.exhst29 + sumTot1.exhst30;

            sumTot2["sortFclt"] = "합계"; sumTot2["grd"] = "중량"; sumTot2["sortInfo"] = "합계"; sumTot2["vrtyNm"] = "합계";
            sumTot2["sbTot"] = sumTot2.exhst1 + sumTot2.exhst2 + sumTot2.exhst3 + sumTot2.exhst4 + sumTot2.exhst5 + sumTot2.exhst6 + sumTot2.exhst7 + sumTot2.exhst8 + sumTot2.exhst9 + sumTot2.exhst10 + sumTot2.exhst11 + sumTot2.exhst12 + sumTot2.exhst13 + sumTot2.exhst14 + sumTot2.exhst15 + sumTot2.exhst16 + sumTot2.exhst17 + sumTot2.exhst18 + sumTot2.exhst19 + sumTot2.exhst20 + sumTot2.exhst21 + sumTot2.exhst22 + sumTot2.exhst23 + sumTot2.exhst24 + sumTot2.exhst25 + sumTot2.exhst26 + sumTot2.exhst27 + sumTot2.exhst28 + sumTot2.exhst29 + sumTot2.exhst30;

            jsonExhstDsctn.push(sumTot1);
            jsonExhstDsctn.push(sumTot2);
            // const allData = grdExhstDsctn.getGridDataAll();

            grdExhstDsctn.refresh();
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            // gfn_comAlert("E0001");  // E0001    오류가 발생하였습니다.
        }
    }

    // 등급별 집계
    const fn_setGrdDsctnTot = async function() {
        let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
        let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
        let itemCd = SBUxMethod.get("srch-slt-itemCd");
        let prdcrCd = SBUxMethod.get('srch-inp-prdcrCd');
		const param = {
			apcCd: gv_selectedApcCd,
			inptYmdFrom: inptYmdFrom,
			inptYmdTo: inptYmdTo,
			prdcrCd: prdcrCd,
			itemCd: itemCd
		}
		if(SBUxMethod.isHide("srch-dtp-inptYmdTo")){
			delete param.inptYmdFrom;
			delete param.inptYmdTo;
			param.inptYmd = inptYmdFrom;
		}


        jsonGrdDsctn.length = 0;

        let totalRecordCount = 0;

        try {
            let sumTot1 = {grd1: 0, grd2: 0, grd3: 0, grd4: 0, grd5: 0, grd6: 0, grd7: 0, grd8: 0, grd9: 0, grd10: 0, grd11: 0, grd12: 0, grd13: 0, grd14: 0, grd15: 0, grd16: 0, grd17: 0, grd18: 0, grd19: 0, grd20: 0, grd21: 0, grd22: 0, grd23: 0, grd24: 0, grd25: 0, grd26: 0, grd27: 0, grd28: 0, grd29: 0, grd30: 0};
            let sumTot2 = {grd1: 0, grd2: 0, grd3: 0, grd4: 0, grd5: 0, grd6: 0, grd7: 0, grd8: 0, grd9: 0, grd10: 0, grd11: 0, grd12: 0, grd13: 0, grd14: 0, grd15: 0, grd16: 0, grd17: 0, grd18: 0, grd19: 0, grd20: 0, grd21: 0, grd22: 0, grd23: 0, grd24: 0, grd25: 0, grd26: 0, grd27: 0, grd28: 0, grd29: 0, grd30: 0};

            const postJsonPromise = gfn_postJSON("/am/sort/selectGrdDsctn.do", param, null, false);
            const data = await postJsonPromise;
			console.log(data,"여기 등급별 집계 소수점 ");
            data.resultList.forEach((item, index) => {
                const orcDsctnTot = {
                    sortFclt: item.FCLT_NM,
                    sortInfo: item.PRDCR_NM,
                    sbTot: "",
                    vrtyNm: item.VRTY_NM,
                    grd: "과수",
                    grd1: item.RMRK_1,
                    grd2: item.RMRK_2,
                    grd3: item.RMRK_3,
                    grd4: item.RMRK_4,
                    grd5: item.RMRK_5,
                    grd6: item.RMRK_6,
                    grd7: item.RMRK_7,
                    grd8: item.RMRK_8,
                    grd9: item.RMRK_9,
                    grd10: item.RMRK_10,
                    grd11: item.RMRK_11,
                    grd12: item.RMRK_12,
                    grd13: item.RMRK_13,
                    grd14: item.RMRK_14,
                    grd15: item.RMRK_15,
                    grd16: item.RMRK_16,
                    grd17: item.RMRK_17,
                    grd18: item.RMRK_18,
                    grd19: item.RMRK_19,
                    grd20: item.RMRK_20,
                    grd21: item.RMRK_21,
                    grd22: item.RMRK_22,
                    grd23: item.RMRK_23,
                    grd24: item.RMRK_24,
                    grd25: item.RMRK_25,
                    grd26: item.RMRK_26,
                    grd27: item.RMRK_27,
                    grd28: item.RMRK_28,
                    grd29: item.RMRK_29,
                    grd30: item.RMRK_30
                };

                const grdDsctnQnttTot = {
                    sortFclt: item.FCLT_NM,
                    sortInfo: item.PRDCR_NM,
                    sbTot: item.SORT_QNTT,
                    vrtyNm: item.VRTY_NM,
                    grd: "수량",
                    grd1: item.QNTT_1,
                    grd2: item.QNTT_2,
                    grd3: item.QNTT_3,
                    grd4: item.QNTT_4,
                    grd5: item.QNTT_5,
                    grd6: item.QNTT_6,
                    grd7: item.QNTT_7,
                    grd8: item.QNTT_8,
                    grd9: item.QNTT_9,
                    grd10: item.QNTT_10,
                    grd11: item.QNTT_11,
                    grd12: item.QNTT_12,
                    grd13: item.QNTT_13,
                    grd14: item.QNTT_14,
                    grd15: item.QNTT_15,
                    grd16: item.QNTT_16,
                    grd17: item.QNTT_17,
                    grd18: item.QNTT_18,
                    grd19: item.QNTT_19,
                    grd20: item.QNTT_20,
                    grd21: item.QNTT_21,
                    grd22: item.QNTT_22,
                    grd23: item.QNTT_23,
                    grd24: item.QNTT_24,
                    grd25: item.QNTT_25,
                    grd26: item.QNTT_26,
                    grd27: item.QNTT_27,
                    grd28: item.QNTT_28,
                    grd29: item.QNTT_29,
                    grd30: item.QNTT_30
                };

                const grdDsctnWghtTot = {
                    sortFclt: item.FCLT_NM,
                    sortInfo: item.INPT_YMD,
                    sbTot: item.SORT_WGHT,
                    vrtyNm: item.VRTY_NM,
                    grd: "중량",
                    grd1: item.WGHT_1,
                    grd2: item.WGHT_2,
                    grd3: item.WGHT_3,
                    grd4: item.WGHT_4,
                    grd5: item.WGHT_5,
                    grd6: item.WGHT_6,
                    grd7: item.WGHT_7,
                    grd8: item.WGHT_8,
                    grd9: item.WGHT_9,
                    grd10: item.WGHT_10,
                    grd11: item.WGHT_11,
                    grd12: item.WGHT_12,
                    grd13: item.WGHT_13,
                    grd14: item.WGHT_14,
                    grd15: item.WGHT_15,
                    grd16: item.WGHT_16,
                    grd17: item.WGHT_17,
                    grd18: item.WGHT_18,
                    grd19: item.WGHT_19,
                    grd20: item.WGHT_20,
                    grd21: item.WGHT_21,
                    grd22: item.WGHT_22,
                    grd23: item.WGHT_23,
                    grd24: item.WGHT_24,
                    grd25: item.WGHT_25,
                    grd26: item.WGHT_26,
                    grd27: item.WGHT_27,
                    grd28: item.WGHT_28,
                    grd29: item.WGHT_29,
                    grd30: item.WGHT_30
                };

                jsonGrdDsctn.push(orcDsctnTot);
                jsonGrdDsctn.push(grdDsctnQnttTot);
                jsonGrdDsctn.push(grdDsctnWghtTot);

                sumTot1 = sumValues(sumTot1, grdDsctnQnttTot);
                sumTot2 = sumValues(sumTot2, grdDsctnWghtTot);
            });

            sumTot1["sortFclt"] = "합계"; sumTot1["grd"] = "수량"; sumTot1["sortInfo"] = "합계"; sumTot1["vrtyNm"] = "합계";
            sumTot1["sbTot"] = sumTot1.grd1 + sumTot1.grd2 + sumTot1.grd3 + sumTot1.grd4 + sumTot1.grd5 + sumTot1.grd6 + sumTot1.grd7 + sumTot1.grd8 + sumTot1.grd9 + sumTot1.grd10 + sumTot1.grd11 + sumTot1.grd12 + sumTot1.grd13 + sumTot1.grd14 + sumTot1.grd15 + sumTot1.grd16 + sumTot1.grd17 + sumTot1.grd18 + sumTot1.grd19 + sumTot1.grd20 + sumTot1.grd21 + sumTot1.grd22 + sumTot1.grd23 + sumTot1.grd24 + sumTot1.grd25 + sumTot1.grd26 + sumTot1.grd27 + sumTot1.grd28 + sumTot1.grd29 + sumTot1.grd30;

            sumTot2["sortFclt"] = "합계"; sumTot2["grd"] = "중량"; sumTot2["sortInfo"] = "합계"; sumTot2["vrtyNm"] = "합계";
            sumTot2["sbTot"] = sumTot2.grd1 + sumTot2.grd2 + sumTot2.grd3 + sumTot2.grd4 + sumTot2.grd5 + sumTot2.grd6 + sumTot2.grd7 + sumTot2.grd8 + sumTot2.grd9 + sumTot2.grd10 + sumTot2.grd11 + sumTot2.grd12 + sumTot2.grd13 + sumTot2.grd14 + sumTot2.grd15 + sumTot2.grd16 + sumTot2.grd17 + sumTot2.grd18 + sumTot2.grd19 + sumTot2.grd20 + sumTot2.grd21 + sumTot2.grd22 + sumTot2.grd23 + sumTot2.grd24 + sumTot2.grd25 + sumTot2.grd26 + sumTot2.grd27 + sumTot2.grd28 + sumTot2.grd29 + sumTot2.grd30;

            jsonGrdDsctn.push(sumTot1);
            jsonGrdDsctn.push(sumTot2);

            jsonGrdDsctn.forEach(row => {
                if(row.grd === "수량" || row.grd === "중량") {
                    for(let i = 1; i <= 30; i++) {
                        const key = 'grd' + i;
                        if(row[key] !== undefined && row[key] !== null) {
                            row[key] = (row[key]).toLocaleString('ko-KR');
                        }
                    }
                }
            });

            // const allData = grdGrdDsctn.getGridDataAll();

            grdGrdDsctn.refresh();
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            // gfn_comAlert("E0001");  // E0001    오류가 발생하였습니다.
        }
    }

    // 고당당도 집계
    const fn_setHghSwtTot = async function() {
        jsonHghSwt.length = 0;

        let sumTot1 = {rmrk1: 0, rmrk2: 0, rmrk3: 0, rmrk4: 0, rmrk5: 0, rmrk6: 0, rmrk7: 0, rmrk8: 0, rmrk9: 0, rmrk10: 0, rmrk11: 0, rmrk12: 0, rmrk13: 0, rmrk14: 0, rmrk15: 0};
        let sumTot2 = {rmrk1: 0, rmrk2: 0, rmrk3: 0, rmrk4: 0, rmrk5: 0, rmrk6: 0, rmrk7: 0, rmrk8: 0, rmrk9: 0, rmrk10: 0, rmrk11: 0, rmrk12: 0, rmrk13: 0, rmrk14: 0, rmrk15: 0};
        let sumTot3 = {rmrk1: 0, rmrk2: 0, rmrk3: 0, rmrk4: 0, rmrk5: 0, rmrk6: 0, rmrk7: 0, rmrk8: 0, rmrk9: 0, rmrk10: 0, rmrk11: 0, rmrk12: 0, rmrk13: 0, rmrk14: 0, rmrk15: 0};
        let sumTot4 = {rmrk1: 0, rmrk2: 0, rmrk3: 0, rmrk4: 0, rmrk5: 0, rmrk6: 0, rmrk7: 0, rmrk8: 0, rmrk9: 0, rmrk10: 0, rmrk11: 0, rmrk12: 0, rmrk13: 0, rmrk14: 0, rmrk15: 0};

        let mapHghSwt = new Map();

        jsonHghSwtColumnData.forEach(item => {
            const sortNo = item.SORTNO;

            if(!mapHghSwt.has(sortNo)) {
                mapHghSwt.set(sortNo, {
                    APC_CD: item.APC_CD,
                    FCLT_CD: item.FCLT_CD,
                    INPT_YMD: item.INPT_YMD,
                    ITEM_CD: item.ITEM_CD,
                    ITEM_NM: item.ITEM_NM,
                    PRDCR_CD: item.PRDCR_CD,
                    PRDCR_NM: item.PRDCR_NM,
                    SORTNO: item.SORTNO,
                    SPCFCT_CD: item.SPCFCT_CD,
                    VRTY_CD: item.VRTY_CD,
                    VRTY_NM: item.VRTY_NM,
                    QNTT: 0,
                    WGHT: 0
                });
            }

            const hghSwtList = mapHghSwt.get(sortNo);
            let count = 1;

            while(hghSwtList[`GRD_CD_` + count] !== undefined) {
                count++;
            }

            hghSwtList[`GRD_CD_` + count] = item.GRD_CD;
            hghSwtList[`RMRK_` + count] = item.RMRK;
            hghSwtList[`SORT_QNTT_` + count] = item.SORT_QNTT;
            hghSwtList[`SORT_WGHT_` + count] = item.SORT_WGHT;

            hghSwtList.QNTT += item.SORT_QNTT;
            hghSwtList.WGHT += item.SORT_WGHT;
        });

        let result = Array.from(mapHghSwt.values());

        result.forEach((item, index) => {
            const wrhsQnttTot = {
                prdcrNm: item.PRDCR_NM,
                vrtyNm: item.VRTY_NM,
                spcfctNm: "입고 수량",
                rmrk1: item.SORT_QNTT_1,
                rmrk2: item.SORT_QNTT_2,
                rmrk3: item.SORT_QNTT_3,
                rmrk4: item.SORT_QNTT_4,
                rmrk5: item.SORT_QNTT_5,
                rmrk6: item.SORT_QNTT_6,
                rmrk7: item.SORT_QNTT_7,
                rmrk8: item.SORT_QNTT_8,
                rmrk9: item.SORT_QNTT_9,
                rmrk10: item.SORT_QNTT_10,
                rmrk11: item.SORT_QNTT_11,
                rmrk12: item.SORT_QNTT_12,
                rmrk13: item.SORT_QNTT_13,
                rmrk14: item.SORT_QNTT_14,
                rmrk15: item.SORT_QNTT_15,
                sum: item.QNTT
            };

            const swtDstTot = {
                prdcrNm: item.PRDCR_NM,
                vrtyNm: item.VRTY_NM,
                spcfctNm: "당도 파괴",
                rmrk1: 0,
                rmrk2: 0,
                rmrk3: 0,
                rmrk4: 0,
                rmrk5: 0,
                rmrk6: 0,
                rmrk7: 0,
                rmrk8: 0,
                rmrk9: 0,
                rmrk10: 0,
                rmrk11: 0,
                rmrk12: 0,
                rmrk13: 0,
                rmrk14: 0,
                rmrk15: 0,
                sum: 0
            };

            const fxtrTot = {
                prdcrNm: item.PRDCR_NM,
                vrtyNm: item.VRTY_NM,
                spcfctNm: "비품",
                rmrk1: 0,
                rmrk2: 0,
                rmrk3: 0,
                rmrk4: 0,
                rmrk5: 0,
                rmrk6: 0,
                rmrk7: 0,
                rmrk8: 0,
                rmrk9: 0,
                rmrk10: 0,
                rmrk11: 0,
                rmrk12: 0,
                rmrk13: 0,
                rmrk14: 0,
                rmrk15: 0,
                sum: 0
            };

            const sortQnttTot = {
                prdcrNm: item.PRDCR_NM,
                vrtyNm: item.VRTY_NM,
                spcfctNm: "선별 수량",
                rmrk1: item.SORT_QNTT_1,
                rmrk2: item.SORT_QNTT_2,
                rmrk3: item.SORT_QNTT_3,
                rmrk4: item.SORT_QNTT_4,
                rmrk5: item.SORT_QNTT_5,
                rmrk6: item.SORT_QNTT_6,
                rmrk7: item.SORT_QNTT_7,
                rmrk8: item.SORT_QNTT_8,
                rmrk9: item.SORT_QNTT_9,
                rmrk10: item.SORT_QNTT_10,
                rmrk11: item.SORT_QNTT_11,
                rmrk12: item.SORT_QNTT_12,
                rmrk13: item.SORT_QNTT_13,
                rmrk14: item.SORT_QNTT_14,
                rmrk15: item.SORT_QNTT_15,
                sum: item.QNTT
            };

            jsonHghSwt.push(wrhsQnttTot);
            jsonHghSwt.push(swtDstTot);
            jsonHghSwt.push(fxtrTot);
            jsonHghSwt.push(sortQnttTot);

            sumTot1 = sumValues(sumTot1, wrhsQnttTot);
            sumTot2 = sumValues(sumTot2, swtDstTot);
            sumTot3 = sumValues(sumTot3, fxtrTot);
            sumTot4 = sumValues(sumTot4, sortQnttTot);
        });

        sumTot1["prdcrNm"] = "입고 선별 합계"; sumTot1["vrtyNm"] = "입고 선별 합계"; sumTot1["ctrt"] = "입고 선별 합계"; sumTot1["spcfctNm"] = "입고 수량";
        sumTot1["sum"] = sumTot1.rmrk1 + sumTot1.rmrk2 + sumTot1.rmrk3 + sumTot1.rmrk4 + sumTot1.rmrk5 + sumTot1.rmrk6 + sumTot1.rmrk7 + sumTot1.rmrk8 + sumTot1.rmrk9 + sumTot1.rmrk10 + sumTot1.rmrk11 + sumTot1.rmrk12 + sumTot1.rmrk13 + sumTot1.rmrk14 + sumTot1.rmrk15;

        sumTot2["prdcrNm"] = "입고 선별 합계"; sumTot2["vrtyNm"] = "입고 선별 합계"; sumTot2["ctrt"] = "입고 선별 합계"; sumTot2["spcfctNm"] = "당도 파괴";
        sumTot2["sum"] = sumTot2.rmrk1 + sumTot2.rmrk2 + sumTot2.rmrk3 + sumTot2.rmrk4 + sumTot2.rmrk5 + sumTot2.rmrk6 + sumTot2.rmrk7 + sumTot2.rmrk8 + sumTot2.rmrk9 + sumTot2.rmrk10 + sumTot2.rmrk11 + sumTot2.rmrk12 + sumTot2.rmrk13 + sumTot2.rmrk14 + sumTot2.rmrk15;

        sumTot3["prdcrNm"] = "입고 선별 합계"; sumTot3["vrtyNm"] = "입고 선별 합계"; sumTot3["ctrt"] = "입고 선별 합계"; sumTot3["spcfctNm"] = "비품";
        sumTot3["sum"] = sumTot3.rmrk1 + sumTot3.rmrk2 + sumTot3.rmrk3 + sumTot3.rmrk4 + sumTot3.rmrk5 + sumTot3.rmrk6 + sumTot3.rmrk7 + sumTot3.rmrk8 + sumTot3.rmrk9 + sumTot3.rmrk10 + sumTot3.rmrk11 + sumTot3.rmrk12 + sumTot3.rmrk13 + sumTot3.rmrk14 + sumTot3.rmrk15;

        sumTot4["prdcrNm"] = "입고 선별 합계"; sumTot4["vrtyNm"] = "입고 선별 합계"; sumTot4["ctrt"] = "입고 선별 합계"; sumTot4["spcfctNm"] = "선별 수량";
        sumTot4["sum"] = sumTot4.rmrk1 + sumTot4.rmrk2 + sumTot4.rmrk3 + sumTot4.rmrk4 + sumTot4.rmrk5 + sumTot4.rmrk6 + sumTot4.rmrk7 + sumTot4.rmrk8 + sumTot4.rmrk9 + sumTot4.rmrk10 + sumTot4.rmrk11 + sumTot4.rmrk12 + sumTot4.rmrk13 + sumTot4.rmrk14 + sumTot4.rmrk15;

        jsonHghSwt.push(sumTot1);
        jsonHghSwt.push(sumTot2);
        jsonHghSwt.push(sumTot3);
        jsonHghSwt.push(sumTot4);

        grdGrdDsctn.refresh();
    }

    // 육안판정등급 집계
    const fn_setSortBffaTot = async function() {
        let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
        let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
        let itemCd = SBUxMethod.get("srch-slt-itemCd");
        let prdcrCd = SBUxMethod.get('srch-inp-prdcrCd');

        const param = {
            apcCd: gv_selectedApcCd,
            wrhsYmdFrom: inptYmdFrom,
            wrhsYmdTo: inptYmdTo,
            itemCd: itemCd,
            prdcrCd: prdcrCd
        }

        jsonSortBffa.length = 0;

        let totalRecordCount = 0;

        try {
            const postJsonPromise = gfn_postJSON("/am/sort/selectBffaGrdTot.do", param, null, false);
            const data = await postJsonPromise;
            data.resultList.forEach((item, index) => {
                const grdSortBffaTot = {
                    sortYmd: item.WRHS_YMD,
                    sortFclt: item.FCLT_NM,
                    prdcrCd: item.PRDCR_CD,
                    prdcrNm: item.PRDCR_NM,
                    fcltCd: item.FCLT_CD,
                    itemCd: itemCd,
                    wrhsQntt: item.WRHS_QNTT,
                    wrhsWght: item.WRHS_WGHT,
                    wholWght: item.GRD_WGHT_TOT,
                    sbTot: item.GRD_WGHT_TOT - item.GRD_TYPE_WGHT_TOT,
                    bffaWrhsno: item.BFFA_WRHSNO,
                    grdType1Wght: item.GRD_TYPE_1_WGHT,
                    grdType2Wght: item.GRD_TYPE_2_WGHT,
                    grdType3Wght: item.GRD_TYPE_3_WGHT,
                    grdType4Wght: item.GRD_TYPE_4_WGHT,
                    grdType5Wght: item.GRD_TYPE_5_WGHT,
                    grd1: item.WGHT_1,
                    grd2: item.WGHT_2,
                    grd3: item.WGHT_3,
                    grd4: item.WGHT_4,
                    grd5: item.WGHT_5,
                    grd6: item.WGHT_6,
                    grd7: item.WGHT_7,
                    grd8: item.WGHT_8,
                    grd9: item.WGHT_9
                };

                jsonSortBffa.push(grdSortBffaTot);
            });

            grdSortBffa.refresh();
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            // gfn_comAlert("E0001");  // E0001    오류가 발생하였습니다.
        }
    }


	const fn_search = async function () {
        await fn_setExhstDsctnCol(); // 배출구별 집계 컬럼
        await fn_setGrdDsctnCol2(); // 등급별 집계 컬럼
        await fn_setHghSwtCol(); // 고당당도 집계 컬럼
        await fn_setGrdDsctnCol(); // 육안등급판정 컬럼
        fn_createSortBffa();
        gridToggle ? fn_createHghSwt() : fn_createGrdDsctn();
        fn_createExhstDsctn();
        fn_setExhstDsctnTot(); // 배출구 집계
        fnCloseProgress();
        fn_setGrdDsctnTot(); // 등급별 집계
        fnCloseProgress();
        fn_setHghSwtTot(); // 고당당도 집계
        fnCloseProgress();
        fn_setSortBffaTot(); // 육안등급판정 집계
        fnCloseProgress();
	}

	const fn_dtpChange = function(){
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		var maxYmd = gfn_addDate(inptYmdFrom,90);

		SBUxMethod.setDatepickerMaxDate('srch-dtp-inptYmdTo', maxYmd);
		if(gfn_diffDate(inptYmdFrom, inptYmdTo) < 0){
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
			return;
		}

		if (maxYmd < inptYmdTo) {
    		SBUxMethod.set("srch-dtp-inptYmdTo", maxYmd);
	    }
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList1 = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld1,			//콜백함수명
        }
    };
     const objMenuList2 = {
    	        "excelDwnld": {
    	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
    	            "accesskey": "e",					//단축키
    	            "callback": fn_excelDwnld2,			//콜백함수명
    	        }
    	    };
     const objMenuList3 = {
    	        "excelDwnld": {
    	            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
    	            "accesskey": "e",					//단축키
    	            "callback": fn_excelDwnld3,			//콜백함수명
    	        }
    	    };

     // 엑셀 다운로드
     function fn_excelDwnld1() {

    	 grdExhstDsctn.exportLocalExcel("배출구별집계", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
     }
  	// 엑셀 다운로드
     function fn_excelDwnld2() {

    	 grdGrdDsctn.exportLocalExcel("등급별집계", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
     }
  	// 엑셀 다운로드
     function fn_excelDwnld3() {

    	 grdSortBffa.exportLocalExcel("육안등급판정", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
  	 * @name fn_clearPrdcr
  	 * @description 생산자 폼 clear
  	 */
  	const fn_clearPrdcr = function() {
  		SBUxMethod.set("srch-inp-prdcrCd", "");
  		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
  	}

 	/**
 	 * @name fn_onSelectPrdcrNm
 	 * @description 생산자 autocomplete 선택 callback
 	 */
 	 function fn_onSelectPrdcrNm(value, label, item) {
 		// 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
 		if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
 			document.getElementById('btn-srch-prdcr').click();
 		} else{
 			SBUxMethod.set("srch-inp-prdcrCd", value);
 			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
 			let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
 			prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;
 			
 		}
 	}

     const fn_choicePrdcr = function() {
 		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
 	}

 	const fn_setPrdcr = function(prdcr) {
 		if (!gfn_isEmpty(prdcr)) {
 			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
 			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
 			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
 		}
 	}

	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
 	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
	}

    const fn_setExhstDsctnCol = async function() {
        let itemCd = SBUxMethod.get('srch-slt-itemCd');

        const param = {
            apcCd: gv_selectedApcCd,
            grdSeCd: '02',
            itemCd: itemCd
        }

        jsonExhstColumnData.length = 0;

        try {
            const postJsonPromise = gfn_postJSON("/am/sort/selectExhstDsctnCol.do", param, null, false);
            const data = await postJsonPromise;

            jsonExhstColumnData = data.resultList;
            // await fn_createExhstDsctn();
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            // gfn_comAlert("E0001");  // E0001    오류가 발생하였습니다.
        }
    }

    const fn_setGrdDsctnCol = async function() {
        let itemCd = SBUxMethod.get('srch-slt-itemCd');

        const param = {
            apcCd: gv_selectedApcCd,
            grdSeCd: '02',
            itemCd: itemCd
        }

        jsonGrdColumnData.length = 0;

        try {
            const postJsonPromise = gfn_postJSON("/am/sort/selectExhstDsctnCol.do", param, null, false);
            const data = await postJsonPromise;
            jsonGrdColumnData = data.resultList;
            // await fn_createGrdDsctn();
            // await fn_createBffaGrd();
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            // gfn_comAlert("E0001");  // E0001    오류가 발생하였습니다.
        }
    }

	const fn_setGrdDsctnCol2 = async function() {
		 let itemCd = SBUxMethod.get('srch-slt-itemCd');
		 jsonGrdDsctnColumnData.length = 0;
		 jsonGrdDsctnColumnData = await gfn_getApcGdsGrd(gv_selectedApcCd, itemCd, '02');
	}

    const fn_setHghSwtCol = async function() {
        let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
        let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
        let itemCd = SBUxMethod.get("srch-slt-itemCd");
        let prdcrCd = SBUxMethod.get('srch-inp-prdcrCd');

        const param = {
            apcCd: gv_selectedApcCd,
            inptYmdFrom: inptYmdFrom,
            inptYmdTo: inptYmdTo,
            prdcrCd: prdcrCd,
            itemCd: itemCd
        }
		if(SBUxMethod.isHide("srch-dtp-inptYmdTo")){
			delete param.inptYmdFrom;
			delete param.inptYmdTo;
			param.inptYmd = inptYmdFrom;
		}

        jsonHghSwtColumnData.length = 0;

        try {
            const postJsonPromise = gfn_postJSON("/am/sort/selectSortInvntrList.do", param, null, false);
            const data = await postJsonPromise;

            const keys = ['APC_CD','FCLT_CD','INPT_YMD','ITEM_CD','ITEM_NM','PRDCR_CD','PRDCR_NM','RMRK','SORTNO','SPCFCT_CD','VRTY_CD','VRTY_NM'];

            jsonHghSwtColumnData = data.resultList.reduce((acc, item) => {
                const list = { ...item, RMRK: item.RMRK.split('|').shift().slice(1).replace(/ /g, "") };
                const key = keys.map(k => list[k]).join('|');

                const exist = acc.find(el => keys.map(k => el[k]).join('|') === key);

                if(exist) {
                    exist.GRD_CD += "," + list.GRD_CD;
                    exist.SORT_QNTT += list.SORT_QNTT;
                    exist.SORT_WGHT += list.SORT_WGHT;
                } else {
                    acc.push({ ...list });
                }

                return acc;
            }, []);
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            // gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
        }
    }

 	/**
	 * @name fn_docSort
	 * @description 선별확인서 발행
	 */
	const fn_docSort = async function() {
		const sortnoSnList = [];
		const sortnoList = [];
		const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'ST_DOC');
		const allData = grdExhstDsctn.getGridDataAll();
		allData.forEach((item) => {
			if (item.checkedYn === "Y") {
				sortnoSnList.push(item.sortno + item.sortSn);
				sortnoList.push(item.sortno);
    		}
		});

 		if (sortnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const sortnoSn = sortnoSnList.join("','");
 		const sortno = sortnoList.join("','");
 		gfn_popClipReport("선별확인서", rptUrl, {apcCd: gv_selectedApcCd, sortnoSn: sortnoSn, sortno: sortno});
 		//gfn_popClipReport("선별확인서", "am/sortIdntyDoc.crf", {apcCd: gv_selectedApcCd, sortnoSn: sortnoSn, sortno: sortno});
 	}

    /** 육안선별 등록 팝업함수 **/
    const fn_reg_bffa = function(){
        let itemCd = SBUxMethod.get('srch-slt-itemCd');

        if(gfn_isEmpty(itemCd)){
            gfn_comAlert("W0005", "품목");
            return
        }
        let rowData = grdSortBffa.getRowData(grdSortBffa.getRow());


        //popBffa.init(gv_apcCd,gv_selectedApcNm,itemCd,BffaGrdType,fn_bffaSearch);

        popBffa.rsltChoice(rowData);

        SBUxMethod.openModal('modal-regSort');
    }

    /** 품목 선택시 육안선별 종류 SELECT **/
    const fn_selectSortBffaType = async function(){
        let itemCd = SBUxMethod.get("srch-slt-itemCd");

        if(!gfn_isEmpty(itemCd)){
            try{
               let postJsonPromise = gfn_postJSON('/am/cmns/apcBffaType',{
                    apcCd:gv_apcCd,
                    itemCd:itemCd
                });
                let data = await postJsonPromise;
                if (_.isEqual("S", data.resultStatus)) {
                	BffaGrdType = data.resultList;
                }
                //await fn_createGrid();
            }catch (e){
                console.log(e);
            }
        }
    }

    /** 육안선별 목록 조회 **/
    const fn_bffaSearch = async function(){
        jsonSortBffa.length = 0;

        let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
        let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
        let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
        let fcltCd = SBUxMethod.get("srch-slt-fcltCd");
        let itemCd = SBUxMethod.get("srch-slt-itemCd");

        let postJsonPromise = gfn_postJSON("/am/sort/selectSortBffa.do",
            {
                apcCd : gv_apcCd,
                inptYmdFrom : inptYmdFrom,
                inptYmdTo : inptYmdTo,
                prdcrCd : prdcrCd,
                fcltCd : fcltCd,
                itemCd : itemCd
            });
            const data  = await postJsonPromise;
            try{
                if(_.isEqual("S",data.resultStatus)){
                    data.resultList.forEach(function(item){
                        let bffaObj =
                            {
                        		 apcCd     : item.apcCd,
                                 bffaWrhsno: item.bffaWrhsno,
                                 wrhsYmd   : item.wrhsYmd,
                                 prdcrNm   : item.prdcrNm,
                                 prdcrCd   : item.prdcrCd,
                                 fcltNm    : item.fcltNm,
                                 fcltCd    : item.fcltCd,
                                 wrhsQntt  : item.wrhsQntt,
                                 wholWght  : item.wholWght,
                                 icptWght  : item.icptWght,
                                 grdType1Wght : item.grdType1Wght,
                                 grdType2Wght : item.grdType2Wght,
                                 grdType3Wght : item.grdType3Wght,
                                 wrhsWght  : item.wrhsWght,
                                 rmrk      : item.rmrk,
                                 itemCd    : item.itemCd
                            }
                        //BffaGrdType.push(bffaObj);
                    });
                }
            }catch (e){
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
				console.error("failed", e.message);
            }
    }

    function fnCloseProgress() {
		var options = {
			modelNm : 'main-loading'
		};
		SBUxMethod.closeProgress(options);
	};

	/** 고당당도 해당 템플릿으로 출력 **/
	const fn_typePrint = async function(){

		await fn_initLuckySheet();

	}

	const fn_initLuckySheet = async function(){
		SBUxMethod.openProgress(gv_loadingOptions);
		fetch('/doc/report2.xlsx')
				.then(res => res.blob())
				.then(blob => {
					// blob 을 File 객체로 래핑 (LuckyExcel.transformExcelToLucky은 File 인터페이스를 기대)
					const file = new File([blob], 'data.xlsx', {type: blob.type});

					LuckyExcel.transformExcelToLucky(
							file,
							(exportJson, luckysheetfile) => {
								if (exportJson && exportJson.sheets && Array.isArray(exportJson.sheets)) {
									exportJson.sheets.forEach(function(sheetData, index) {
										// 시트에 id가 없거나 유효하지 않으면 새로운 ID를 할당합니다.
										// 'sheet_0', 'sheet_1' 등으로 간단하게 할당합니다.
										if (!sheetData.id || typeof sheetData.id !== 'string') {
											sheetData.id = 'sheet_' + index + '_' + Date.now(); // 고유성을 위해 타임스탬프 추가
										}
									});
								}

								/** 50줄 제한 **/
								const maxRow = 200;
								exportJson.sheets = exportJson.sheets.map(sheet => {
									// celldata 줄이기
									if (sheet.celldata) {
										sheet.celldata = sheet.celldata.filter(cell => cell.r < maxRow);
									}

									// row 수 강제 고정
									sheet.row = maxRow;

									// config 안에 row 관련 옵션 줄이기
									if (sheet.config) {
										if (sheet.config.rowlen) {
											Object.keys(sheet.config.rowlen).forEach(k => {
												if (parseInt(k) >= maxRow) delete sheet.config.rowlen[k];
											});
										}
										if (sheet.config.customHeight) {
											Object.keys(sheet.config.customHeight).forEach(k => {
												if (parseInt(k) >= maxRow) delete sheet.config.customHeight[k];
											});
										}
										if (sheet.config.rowhidden) {
											Object.keys(sheet.config.rowhidden).forEach(k => {
												if (parseInt(k) >= maxRow) delete sheet.config.rowhidden[k];
											});
										}
									}

									return sheet;
								});

								luckysheet.create({
									container: 'luckysheet',
									data: exportJson.sheets,
									title: exportJson.info.name,
									userInfo: exportJson.info.creator,
									showinfobar: false,
									showtoolbar: false,
									showstatisticBar: false,
									hook: {
										// 워크북 전체(모든 시트)가 초기화된 직후에 호출됩니다
										workbookCreateAfter: function () {
											/** 문서일자 **/
											let date = SBUxMethod.get("srch-dtp-inptYmdFrom");
											const year = Number(date.slice(0, 4));
											const month = Number(date.slice(4, 6)) - 1; // JS의 월은 0부터 시작
											const day = Number(date.slice(6, 8));

											luckysheet.setCellValue(1, 0, {
												v: new Date(year, month, day).getTime(),
												m: `${'${year}'}년 ${'${month + 1}'}월 ${'${day}'}일`,
												ct: {
													t: 'd',
													fa: 'yyyy"년" mm"월" dd"일"',
													s: 'yyyy-mm-dd',
												}
											});
											/** caption 부분 **/
											let captions = grdGrdDsctn.getCaption().split('^');
											let headerRow = 3;
											/** 실제 데이터 영역 갯수 **/
											const regex = /\d[\d,\.]*\s*(kg)/i;
											let dataCol = captions.filter(i => regex.test(i)).length;
											captions.forEach(function(caption,idx){
												luckysheet.setCellValue(headerRow,idx,caption);
											});
											const rmrkKeys = Array.from({ length: dataCol }, (_, i) => `rmrk${'${i + 1}'}`);
											/** data 부분 **/
											let dataJson = grdGrdDsctn.getGridDataAll().slice(0,-4);
											let footJson = grdGrdDsctn.getGridDataAll().slice(-4);
											/** 중복삽입 방지 농가명 분리지점 판단 **/
											let switchFlag = false;
											let nowPrdcrNm = '';
											/** data 실제 구간 **/
											let setRow = 4;
											let setStartCol = 5;
											/** 본문 영역 반복 **/
											dataJson.forEach(function(data, idx){
												/** 농가명 변경시 **/
												if(data.prdcrNm !== nowPrdcrNm){
													switchFlag = true;
													nowPrdcrNm = data.prdcrNm;
												}
												/** merge cell 부분만 **/
												if(idx % 4 === 0){
													luckysheet.setCellValue(setRow,0,data.prdcrNm);
													luckysheet.setCellFormat(setRow,0,"ht",0);
													luckysheet.setCellFormat(setRow,0,"vt",0);

													luckysheet.setCellValue(setRow,1,data.vrtyNm);
													luckysheet.setCellFormat(setRow,1,"ht",0);
													luckysheet.setCellFormat(setRow,1,"vt",0);
													/** SUM **/
													luckysheet.setCellValue(setRow,15,data.sum || 0);
													luckysheet.setCellFormat(setRow,1,"ht",0);
													luckysheet.setCellFormat(setRow,1,"vt",0);
													mergeABCColumnsForGroup(setRow,false);
												}
												/** 실제 데이터 입고수량,당도 파괴, 비품 **/
												const rmrkValues = rmrkKeys.map(k => data[k] ?? 0);
												/** 규격 **/
												luckysheet.setCellValue(setRow,3,data.spcfctNm);

												/** 선별 데이터 **/ // 8,
												if(setRow % 4 === 3){
													/** row background color **/
													for(let j = 3; j < 16; j++){
														luckysheet.setCellFormat(setRow, j, "bg", "#E6F4E8");
													}
													/** 각 라인 합계 data **/
													//TODO: 여기 함수 넣어야함.
													rmrkValues.forEach(function(i,idx){
														let setCol = Number(setStartCol + idx);
														/** 선별수량 함수 **/
														let cal = excelFx[idx];
														let value = "=" + getCellRef(setRow - 3,setCol) + '/' + cal;
														luckysheet.setCellValue(setRow,setCol,value);

														luckysheet.setCellFormat(setRow, setCol, "fs", 10);
														luckysheet.setCellFormat(setRow, setCol, "bl", 1);
														luckysheet.setCellFormat(setRow, setCol, "ht", 0);
														luckysheet.setCellFormat(setRow, setCol, "vt", 0);
													});
												}else{
													rmrkValues.forEach(function(i,idx){
														let setCol = Number(setStartCol + idx);
														luckysheet.setCellValue(setRow,setCol,i);
														luckysheet.setCellFormat(setRow, setCol, "fs", 8);
														luckysheet.setCellFormat(setRow, setCol, "bl", 1);
														luckysheet.setCellFormat(setRow, setCol, "ht", 0);
														luckysheet.setCellFormat(setRow, setCol, "vt", 0);
													});
												}
												setRow++;
											});

											/** 마지막 합계 **/
											// luckysheet.setRangeFormat("bg","#DCE6F4",{range:["A13:P16"]});
											footJson.forEach(function(data,idx){
												/** 첫열 부분 **/
												if(idx === 0){
													luckysheet.setCellValue(setRow,0,data.prdcrNm);
													luckysheet.setCellFormat(setRow,0,"bg","#DCE6F4");
													luckysheet.setCellFormat(setRow,0,"ht",0);
													luckysheet.setCellFormat(setRow,0,"vt",0);
													mergeABCColumnsForGroup(setRow,true);
												}

												/** 규격 **/
												luckysheet.setCellValue(setRow,3,data.spcfctNm);
												/** 실제 데이터 입고수량,당도 파괴, 비품 **/
												const rmrkValues = rmrkKeys.map(k => data[k] ?? 0);
												rmrkValues.forEach(function(i,idx){
													let setCol = Number(setStartCol + idx);
													/** sum fx 생성 **/
													let sumTarget = Array.from({ length: Math.floor(setRow / 4) -1 }, (_, i) => {
														return getCellRef(setRow - (i + 1) * 4, setCol);
													});
													let cellFx = "=SUM(" + sumTarget.join('+') + ')';

													luckysheet.setCellValue(setRow,setCol,cellFx);
													luckysheet.setCellFormat(setRow, setCol, "fs", 10);
													luckysheet.setCellFormat(setRow, setCol, "bl", 1);
													luckysheet.setCellFormat(setRow, setCol, "ht", 0);
													luckysheet.setCellFormat(setRow, setCol, "vt", 0);
												});
												setRow++;
											});

											/** export Excel**/
											// fn_downloadExcelWithStyleAndFormula_XPop();

											fn_downloadExcelWithStyleAndFormula_ExcelJS().then(() => {
												SBUxMethod.closeProgress(gv_loadingOptions);
											});
										},
										sheetActivate: function (sheetIndex) {
											// const sheetId = luckysheet.getAllSheets()[sheetIndex].id;
										},
									},
								});
							},
							err => console.error(err)
					);
				});
	}

	/** export excel **/
	<%--async function fn_downloadExcelWithStyleAndFormula_XPop() {--%>
	<%--	/** luckysheets data **/--%>
	<%--	const initialSheets = luckysheet.getAllSheets();--%>
	<%--	if (!initialSheets || initialSheets.length === 0) {--%>
	<%--		alert("다운로드할 시트 데이터가 없습니다.");--%>
	<%--		return;--%>
	<%--	}--%>

	<%--	/** xlsxpop workbook init **/--%>
	<%--	const workbook = await XlsxPopulate.fromBlankAsync();--%>
	<%--	/** 로고 이미지 set **/--%>
	<%--	const imgBlob = await fetch("/static/doc/buan.png").then(res => res.blob());--%>
	<%--	const imgBuf = await imgBlob.arrayBuffer();--%>
	<%--	/** 현재 선택된시트 id **/--%>
	<%--	const currentActiveSheetId = luckysheet.getSheet().id;--%>
	<%--	/** luckySheet.borderStyle <==> xlsx **/--%>
	<%--	const styleMap = {--%>
	<%--		1: "thin", 2: "hair", 3: "dotted", 4: "dashed",--%>
	<%--		5: "dashDot", 6: "dashDotDot", 7: "double",--%>
	<%--		8: "medium", 9: "mediumDashed", 10: "mediumDashDot",--%>
	<%--		11: "mediumDashDotDot", 12: "slantDashDot", 13: "thick"--%>
	<%--	};--%>

	<%--	/** 정렬값 **/--%>
	<%--	const horizontalMap = ['center', 'left', 'right'];--%>
	<%--	const verticalMap = ['center', 'top', 'bottom'];--%>

	<%--	/** sheet 이동시 로드 대기 시간 **/--%>
	<%--	const waitForSheetData = async (sheetId, timeout = 5000) => {--%>
	<%--		const start = Date.now();--%>
	<%--		while (Date.now() - start < timeout) {--%>
	<%--			const sheet = luckysheet.getluckysheetfile().find(s => s.id === sheetId);--%>
	<%--			if (sheet && sheet.data && sheet.data.length > 0) return sheet;--%>
	<%--			await new Promise(r => setTimeout(r, 100));--%>
	<%--		}--%>
	<%--		return null;--%>
	<%--	};--%>

	<%--	/** 화면상 sheets 순회 **/--%>
	<%--	for (let sheetIndex = 0; sheetIndex < initialSheets.length; sheetIndex++) {--%>
	<%--		/** sheet data **/--%>
	<%--		const sheetInfo = initialSheets[sheetIndex];--%>
	<%--		/** sheet focus load **/--%>
	<%--		luckysheet.setSheetActive(sheetIndex);--%>
	<%--		/** sheet id로 active 성공 대기**/--%>
	<%--		const sheet = await waitForSheetData(sheetInfo.id);--%>
	<%--		if (!sheet) continue;--%>
	<%--		/** xlsxpop에 luckysheet 정보로 addSheet **/--%>
	<%--		const xSheet = sheetIndex === 0 ? workbook.sheet(0).name(sheetInfo.name) : workbook.addSheet(sheetInfo.name);--%>
	<%--		/** luckysheet.config에서 border 값 Map format **/--%>
	<%--		const borders = createBorderInfoMap(sheet.config.borderInfo || {});--%>
	<%--		/** luckysheet.config 병합정보 **/--%>
	<%--		const mergeMap = sheet.config?.merge || {};--%>

	<%--		/** luckysheet data 1. row >> 2. col 순회 **/--%>
	<%--		for (let r = 0; r < sheet.data.length; r++) {--%>
	<%--			const row = sheet.data[r];--%>
	<%--			if (!row) continue;--%>

	<%--			for (let c = 0; c < row.length; c++) {--%>
	<%--				const cell = row[c];--%>
	<%--				/** cell 생성 **/--%>
	<%--				const cellX = xSheet.cell(r + 1, c + 1);--%>
	<%--				if (!cell) continue;--%>

	<%--				/** 리치 텍스트 스타일 예외처리 **/--%>
	<%--				if (cell.v != null) {--%>
	<%--					cellX.value(cell.v);--%>
	<%--				} else if (cell?.ct?.t === 'inlineStr' && Array.isArray(cell?.ct?.s)) {--%>
	<%--					cellX.value(cell.ct.s.map(seg => seg.v).join(''));--%>
	<%--				}--%>

	<%--				/** cell 서식 지정 (백분율,일반,텍스트) **/--%>
	<%--				if (cell.f != null) cellX.formula(cell.f.startsWith('=') ? cell.f : '=' + cell.f);--%>

	<%--				/** cell style (font, align, background) **/--%>
	<%--				const style = {};--%>

	<%--				if (cell.bg && cell.bg !== '#FFFFFF') {--%>
	<%--					style.fill = {--%>
	<%--						type: "solid",--%>
	<%--						color: cell.bg.replace("#",""),--%>
	<%--					};--%>
	<%--				}--%>
	<%--				if (cell.ct?.fa) {--%>
	<%--					cellX.style("numberFormat", cell.ct.fa);--%>
	<%--				}--%>
	<%--				if (cell.fc) style.fontColor = cell.fc;--%>
	<%--				if (cell.fs) style.fontSize = cell.fs;--%>
	<%--				if (cell.bl === 1) style.bold = true;--%>

	<%--				if (cell.ht != null) style.horizontalAlignment = horizontalMap[cell.ht];--%>
	<%--				if (cell.vt != null) style.verticalAlignment = verticalMap[cell.vt];--%>
	<%--				if (cell.tb === 1 || cell.tb === 2) style.wrapText = true;--%>

	<%--				cellX.style(style);--%>

	<%--				/** border style **/--%>
	<%--				const borderCell = borders?.get(r)?.get(c);--%>
	<%--				if (borderCell?.value) {--%>
	<%--					const b = borderCell.value;--%>
	<%--					const borderObj = {};--%>
	<%--					if (b.t) borderObj.top = { style: styleMap[b.t.style], color: (b.t.color || '#000000').replace('#', '') };--%>
	<%--					if (b.b) borderObj.bottom = { style: styleMap[b.b.style], color: (b.b.color || '#000000').replace('#', '') };--%>
	<%--					if (b.l) borderObj.left = { style: styleMap[b.l.style], color: (b.l.color || '#000000').replace('#', '') };--%>
	<%--					if (b.r) borderObj.right = { style: styleMap[b.r.style], color: (b.r.color || '#000000').replace('#', '') };--%>
	<%--					cellX.style("border", borderObj);--%>
	<%--				}--%>
	<%--			}--%>
	<%--		}--%>

	<%--		// Merge 적용--%>
	<%--		for (const key in mergeMap) {--%>
	<%--			const m = mergeMap[key];--%>
	<%--			xSheet.range(m.r + 1, m.c + 1, m.r + m.rs, m.c + m.cs).merged(true);--%>
	<%--		}--%>

	<%--		// 행 높이 설정--%>
	<%--		if (sheet.config.rowlen) {--%>
	<%--			for (const r in sheet.config.rowlen) {--%>
	<%--				xSheet.row(Number(r) + 1).height(sheet.config.rowlen[r]);--%>
	<%--			}--%>
	<%--		}--%>

	<%--		// 열 너비 설정--%>
	<%--		if (sheet.config.columnlen) {--%>
	<%--			for (const c in sheet.config.columnlen) {--%>
	<%--				xSheet.column(Number(c) + 1).width(sheet.config.columnlen[c] / 7); // px → width 보정--%>
	<%--			}--%>
	<%--		}--%>
	<%--	}--%>

	<%--	const originalIdx = initialSheets.findIndex(s => s.id === currentActiveSheetId);--%>
	<%--	if (originalIdx !== -1) {--%>
	<%--		luckysheet.setSheetActive(originalIdx);--%>
	<%--		await new Promise(r => setTimeout(r, 50));--%>
	<%--	}--%>

	<%--	const blob = await workbook.outputAsync();--%>
	<%--	workbook.sheet(0).addImage({--%>
	<%--		image: imgBuf,--%>
	<%--		tl: { col: 1, row: 1 },--%>
	<%--		ext: { width: 372, height: 78 }--%>
	<%--	});--%>

	<%--	let date = SBUxMethod.get("srch-dtp-inptYmdFrom");--%>
	<%--	saveAs(blob, `선별결과표_${'${date}'}.xlsx`);--%>
	<%--}--%>
	<%--const toHex = (hex) => {--%>
	<%--	if (!hex) return null;  // 또는 undefined--%>
	<%--	if (hex.length === 4) {--%>
	<%--		hex = "#" + hex[1] + hex[1] + hex[2] + hex[2] + hex[3] + hex[3];--%>
	<%--	}--%>
	<%--	return hex.toUpperCase();--%>
	<%--};--%>
	<%--function createBorderInfoMap(borderInfoArray) {--%>
	<%--	const borderInfoMap = new Map();--%>
	<%--	if (!borderInfoArray||Object.keys(borderInfoArray).length === 0	) return;--%>

	<%--	for (const item of borderInfoArray) {--%>
	<%--		const row = item?.value?.row_index;--%>
	<%--		const col = item?.value?.col_index;--%>

	<%--		if (row == null || col == null) continue;--%>

	<%--		if (!borderInfoMap.has(row)) {--%>
	<%--			borderInfoMap.set(row, new Map());--%>
	<%--		}--%>

	<%--		borderInfoMap.get(row).set(col, item);--%>
	<%--	}--%>

	<%--	return borderInfoMap;--%>
	<%--}--%>

	/** excelJs 용 다운로드 **/
	async function fn_downloadExcelWithStyleAndFormula_ExcelJS() {
		const initialSheets = luckysheet.getAllSheets();
		if (!initialSheets || initialSheets.length === 0) {
			alert("다운로드할 시트 데이터가 없습니다.");
			return;
		}

		const workbook = new ExcelJS.Workbook();
		const currentActiveSheetId = luckysheet.getSheet().id;

		for (let sheetIndex = 0; sheetIndex < initialSheets.length; sheetIndex++) {
			const sheetInfo = initialSheets[sheetIndex];
			const data = sheetInfo.data || [];
			const config = sheetInfo.config || {};
			const ws = workbook.addWorksheet(sheetInfo.name);

			// Freeze panes: C열(3), 4행(4)
			ws.views = [{ state: 'frozen', xSplit: 3, ySplit: 4 }];

			for (let r = 0; r < data.length; r++) {
				const row = data[r];
				if (!row) continue;

				for (let c = 0; c < row.length; c++) {
					const cell = row[c];
					if (!cell) continue;

					const excelCell = ws.getCell(r + 1, c + 1);

					if (cell.f) {
						excelCell.value = { formula: cell.f.startsWith('=') ? cell.f.slice(1) : cell.f };
					}else if(cell.ct?.t === 'd' && typeof cell.v === 'number'){
						const jsDate = new Date(cell.v); // timestamp → Date
						// excelCell.value = jsDate; // serial date로 변환
						excelCell.value = getExcelSerialDate(jsDate); // serial date로 변환
						excelCell.numFmt = cell.ct.fa || 'yyyy-mm-dd';
					}else if (cell.v != null) {
						excelCell.value = cell.v;
					}

					applyCellStyle(cell, excelCell);
				}
			}

			if (config.merge) {
				for (const key in config.merge) {
					const m = config.merge[key];
					const startR = m.r + 1;
					const startC = m.c + 1;
					const endR = m.r + m.rs;
					const endC = m.c + m.cs;

					ws.mergeCells(startR, startC, endR, endC);

					const startCell = ws.getCell(startR, startC);
					if (startCell.alignment) {
						applyAlignmentToMergeRange(ws, startR, startC, endR, endC, startCell.alignment);
					}
				}
			}

			if (config.columnlen) {
				ws.columns = Array.from({ length: data[0]?.length || 10 }, (_, idx) => ({
					width: config.columnlen[idx] ? config.columnlen[idx] / 7 : 10
				}));
			}

			if (config.rowlen) {
				for (const r in config.rowlen) {
					ws.getRow(Number(r) + 1).height = config.rowlen[r] * 0.75;
				}
			}

			if (sheetIndex === 0) {
				try {
					const imageUrl = "/static/doc/buan.png";
					const imageBlob = await fetch(imageUrl).then(res => res.blob());
					const arrayBuffer = await imageBlob.arrayBuffer();

					const imageId = workbook.addImage({ buffer: arrayBuffer, extension: "png" });

					ws.addImage(imageId, {
						tl: { col: 5, row: 0 },
						ext: { width: 372, height: 78 }
					});
				} catch (e) {
					console.warn("이미지 삽입 실패:", e);
				}
			}
		}

		const originalIdx = initialSheets.findIndex(s => s.id === currentActiveSheetId);
		if (originalIdx !== -1) {
			workbook.views = [{ activeTab: originalIdx }];
		}

		const buffer = await workbook.xlsx.writeBuffer();
		const blob = new Blob([buffer], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });
		const date = SBUxMethod.get("srch-dtp-inptYmdFrom");
		saveAs(blob, `선별결과표_${'${date}'}.xlsx`);
	}

	function applyCellStyle(cell, excelCell) {
		if (!cell) return;

		const hAlign = ['center', 'left', 'right'][cell.ht ?? -1];
		const vAlign = ['middle', 'top', 'bottom'][cell.vt ?? -1];

		excelCell.alignment = {
			...(hAlign ? { horizontal: hAlign } : {}),
			...(vAlign ? { vertical: vAlign } : {}),
			...(cell.tb === 1 || cell.tb === 2 ? { wrapText: true } : {})
		};

		if (cell.bg && cell.bg !== "#FFFFFF") {
			excelCell.fill = {
				type: "pattern",
				pattern: "solid",
				fgColor: { argb: cell.bg.replace("#", "") }
			};
		}

		if (cell.fc) {
			excelCell.font = excelCell.font || {};
			excelCell.font.color = { argb: cell.fc.replace("#", "") };
		}

		if (cell.fs) {
			excelCell.font = excelCell.font || {};
			excelCell.font.size = cell.fs;
		}

		if (cell.bl === 1) {
			excelCell.font = excelCell.font || {};
			excelCell.font.bold = true;
		}
	}

	function applyAlignmentToMergeRange(ws, startRow, startCol, endRow, endCol, alignment) {
		for (let r = startRow; r <= endRow; r++) {
			for (let c = startCol; c <= endCol; c++) {
				ws.getCell(r, c).alignment = { ...alignment };
			}
		}
	}


	/** merge cell **/
	function mergeABCColumnsForGroup(baseRow, lastFlag = false) {
		const range = [{ row: [baseRow, baseRow + 3], column: [0, 2] }]; // A~C, baseRow~baseRow+3

		try {
			// 병합 전에 기존 병합 해제
			luckysheet.cancelRangeMerge({ range });

			// 병합 실행
			luckysheet.setRangeMerge(lastFlag ? 'all' : 'vertical', { range });
		} catch (e) {
			console.error('병합 실패:', e);
		}
	}
	/** 날짜 보정 **/
	function getExcelSerialDate(date) {
		const utc = Date.UTC(date.getFullYear(), date.getMonth(), date.getDate());
		const epoch = Date.UTC(1899, 11, 30);
		return (utc - epoch) / (1000 * 60 * 60 * 24);
	}
	/** row, col => excel Format **/
	function getCellRef(row, col) {
		const columnToLetter = (col) => {
			let letter = '';
			col++; // 0-based to 1-based
			while (col > 0) {
				let rem = (col - 1) % 26;
				letter = String.fromCharCode(65 + rem) + letter;
				col = Math.floor((col - 1) / 26);
			}
			return letter;
		};

		return columnToLetter(col) + (row + 1); // 행도 1부터 시작
	}



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>