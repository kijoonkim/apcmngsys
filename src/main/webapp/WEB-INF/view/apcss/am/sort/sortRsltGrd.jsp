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

    <style>
        .ad_tbl_toplist > span {
            font-weight: bold;
            margin-right: 10px;
        }
    </style>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
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

            <div class="box-body srch-keyup-area" style="display: flex; flex-direction: column;">
                <!--[APC] START -->
                <%@ include file="../../../frame/inc/apcSelect.jsp" %>
                <!--[APC] END -->
                <table class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 7%;">
                        <col style="width: 6%;">
                        <col style="width: 2%;">
                        <col style="width: 5%;">
                        <col style="width: 2%;">

                        <col style="width: 7%;">
                        <col style="width: 6%;">
                        <col style="width: 3%;">
                        <col style="width: 4%;">
                        <col style="width: 3%;">

                        <col style="width: 3%;">
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                        <col style="width: 3%;">
                        <col style="width: 3%;">

                        <col style="width: 3%;">
                    </colgroup>

                    <tbody>
                        <tr>
                            <th scope="row" class="th_bg">선별일자</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                    uitype="popup"
                                    id="srch-dtp-inptYmdFrom"
                                    name="srch-dtp-inptYmdFrom"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                    onchange="fn_dtpChange(srch-dtp-inptYmdFrom)"
                                ></sbux-datepicker>
                            </td>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                    uitype="popup"
                                    id="srch-dtp-inptYmdTo"
                                    name="srch-dtp-inptYmdTo"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                    onchange="fn_dtpChange(srch-dtp-inptYmdTo)"
                                ></sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;"></td>

                            <th scope="row" class="th_bg">선별기</th>
                            <td colspan="2" class="td_input" style="border-right: hidden; border-top: hidden;">
                                <sbux-select
                                    uitype="single"
                                    id="srch-slt-fcltCd"
                                    name="srch-slt-fcltCd"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonComFcltCd"
                                    unselected-text="전체"
                                ></sbux-select>
                            </td>
                            <td style="border-right: hidden;"></td>

                            <th colspan="2" scope="row" class="th_bg">당도</th>
                            <td colspan="2" class="td_input" style="border-right: hidden; border-top: hidden;">
                                <sbux-select
                                    uitype="single"
                                    id="srch-slt-brix"
                                    name="srch-slt-brix"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonApcBrix"
                                    unselected-text="전체"
                                ></sbux-select>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row" class="th_bg">생산자</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
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
                                    text="찾기"
                                    uitype="modal"
                                    target-id="modal-prdcr"
                                    onclick="fn_choicePrdcr"
                                ></sbux-button>
                            </td>

                            <th scope="row" class="th_bg">품목</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
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

                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-gridSortRsltList" style="padding-top: 20px; height: 500px;"></div>
                </div>
            </div>
        </div>
    </section>
    <%--<sbux-progress id="idxProg" name="progNm" uitype="loading" show-openlayer="true"></sbux-progress>--%>
    <!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal
            id="modal-prdcr"
            name="modal-prdcr"
            uitype="middle"
            header-title="생산자 선택"
            body-html-id="body-modal-prdcr"
            header-is-close-button="false"
            footer-is-close-button="false"
            style="width: 1000px;"
        ></sbux-modal>
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
            style="width: 800px;"
        ></sbux-modal>
    </div>
    <div id="body-modal-apcLinkPop">
        <jsp:include page="../../am/popup/apcLinkPopup.jsp"></jsp:include>
    </div>

    <!-- clip report direct print area  -->
    <div id="div-rpt-clipReportPrint" style="display: none;"></div>
    <div>
        <sbux-modal
            id="modal-regSort"
            name="modal-regSort"
            uitype="middle"
            header-title="참외 육안선별 등록"
            body-html-id="body-modal-regSort"
            header-is-close-button="false"
            footer-is-close-button="false"
            style="width: 1000px;"
        ></sbux-modal>
    </div>

    <div id="body-modal-regSort">
        <jsp:include page="../../am/popup/regSortBffa.jsp"></jsp:include>
    </div>
    <div id="luckysheet" style="position: fixed; height: 100%; width: 100%; z-index: 10000;"></div>
</body>
<script src="${ctx}/js/out/sheet.bundle.js"></script>
<script type="text/javascript">
    let lv_interval = 3 * 60 * 1000;
    let timerId;
    let currApcLink;

    var gridSortRsltList;    // 선별결과 그리드

    var jsonSortRsltList = [];    // 선별결과 내역
    var jsonSortGrdColumnData = [];    // 선별 등급 목록
    var jsonComFcltCd = [];    // 선별기 목록
    var jsonApcBrix = [];    // 당도 목록
    var jsonApcItem = [];    // 품목 목록
    var jsonPrdcr = [];    // 생산자 목록
    var jsonPrdcrAutocomplete = [];

    window.addEventListener('DOMContentLoaded', async function(e) {
        fn_init();
    });

    const fn_init = async function() {
        SBUxMethod.set("dtl-inp-apcCd", gv_selectedApcNm);
        SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));

        let rst = await Promise.all([
            gfn_setComCdSBSelect('srch-slt-fcltCd', jsonComFcltCd, 'SORT_FCLT_CD', gv_selectedApcCd),    // 선별기
            gfn_setComCdSBSelect('srch-slt-brix', jsonApcBrix, 'SORT_BRIX', gv_selectedApcCd),    // 당도
            gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),    // 품목
            fn_getApcLink()
        ]);

        fn_getPrdcrs();
        fn_search();
    }

    const fn_createSortRsltList = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gridSortRsltList';
        SBGridProperties.id = 'gridSortRsltList';
        SBGridProperties.jsonref = 'jsonSortRsltList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.mergecells = 'bycolrec';
        SBGridProperties.allowcopy = true;
        SBGridProperties.contextmenu = true;    // 우클릭 메뉴 호출 여부
        SBGridProperties.contextmenulist = objMenuList;    // 우클릭 메뉴 리스트
        SBGridProperties.clickeventarea = {fixed: false, empty: false};
        SBGridProperties.backcoloralternate = '#E0FFFF';
        SBGridProperties.columns = [
            { caption: ["선별기"], ref: 'sortFclt', type: 'output', width: '100px', style: 'text-align: center; padding-right: 5px;' },
            { caption: ["품종"], ref: 'vrtyNm', type: "output", width: '100px', style: 'text-align: center; padding-right: 5px;' },
            { caption: ["회원정보"], ref: 'mbrInfo', type: 'output', width: '100px', style: 'text-align: center; padding-right: 5px;' },
            { caption: ["등급"], ref: 'se', type: 'output', width: '50px', style: 'text-align: center;', merge: false },
            { caption: ["합계"], ref: 'sum', type: 'output', width: '100px', style: 'text-align: right; padding-right: 5px; background-color: #E0FFFF;', format: { type: 'number', rule: '#,##0', emptyvalue: '0' }, merge: false }
        ];

        let addSortRsltGrdCol = [];

        jsonSortGrdColumnData.forEach(function(item) {
            addSortRsltGrdCol.push({
                caption: [item.GRD_NM],
                ref: 'grd' + item.GRD_SN,
                type: 'output',
                width: '50px',
                style: 'text-align: right; padding-right: 5px;',
                format: {
                    type: 'number',
                    rule: '#,###',
                    emptyvalue: '0'
                },
                merge: false
            });
        });

        let originColumns = SBGridProperties.columns;
        originColumns.splice(4, 0, ...addSortRsltGrdCol);
        SBGridProperties.columns = originColumns;

        gridSortRsltList = _SBGrid.create(SBGridProperties);
        gridSortRsltList.rebuild();
    }

    /**
     * 선별결과 집계
     */
    const fn_setSortRsltTot = async function() {
        let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
        let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
        let brix = parseInt(SBUxMethod.get("srch-slt-brix"));
        let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
        let fcltCd = SBUxMethod.get("srch-slt-fcltCd");
        let itemCd = SBUxMethod.get("srch-slt-itemCd");

        const param = {
            apcCd: gv_selectedApcCd,
            prdcrCd: prdcrCd,
            brix: brix,
            inptYmdFrom: inptYmdFrom,
            inptYmdTo: inptYmdTo,
            fcltCd: fcltCd,
            itemCd: itemCd
        }

        const postJsonPromise = gfn_postJSON("/am/sort/selectSortRslt.do", param);
        const data = await postJsonPromise;

        try {
            if(!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }

            jsonSortRsltList.length = 0;

            data.resultList.forEach((item, index) => {
                const sortList = {
                    sortFclt: item.FCLT_NM,
                    vrtyNm: item.VRTY_NM,
                    mbrInfo: item.PRDCR_NM,
                    se: item.SE,
                    grd1: item.GRD_1,
                    grd2: item.GRD_2,
                    grd3: item.GRD_3,
                    grd4: item.GRD_4,
                    grd5: item.GRD_5,
                    grd6: item.GRD_6,
                    grd7: item.GRD_7,
                    grd8: item.GRD_8,
                    grd9: item.GRD_9,
                    grd10: item.GRD_10,
                    grd11: item.GRD_11,
                    grd12: item.GRD_12,
                    grd13: item.GRD_13,
                    grd14: item.GRD_14,
                    grd15: item.GRD_15,
                    grd16: item.GRD_16,
                    grd17: item.GRD_17,
                    grd18: item.GRD_18,
                    grd19: item.GRD_19,
                    grd20: item.GRD_20,
                    grd21: item.GRD_21,
                    grd22: item.GRD_22,
                    grd23: item.GRD_23,
                    grd24: item.GRD_24,
                    grd25: item.GRD_25,
                    grd26: item.GRD_26,
                    grd27: item.GRD_27,
                    grd28: item.GRD_28,
                    grd29: item.GRD_29,
                    grd30: item.GRD_30,
                    sum: item.SUM
                }

                jsonSortRsltList.push(sortList);
            });

            gridSortRsltList.refresh();
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }

            console.error("failed", e.message);
            gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
        }
    }

    /**
     * 선별 등급 컬럼
     */
    const fn_setSortGrdCol = async function() {
        let itemCd = SBUxMethod.get('srch-slt-itemCd');

        const param = {
            apcCd: gv_selectedApcCd,
            grdSeCd: '02',
            itemCd: itemCd
        }

        jsonSortGrdColumnData.length = 0;

        try {
            const postJsonPromise = gfn_postJSON("/am/sort/selectExhstDsctnCol.do", param, null, false);
            const data = await postJsonPromise;

            jsonSortGrdColumnData = data.resultList;
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }

            console.error("failed", e.message);
            // gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
        }
    }

    /**
     * 연계요청 버튼 클릭 시
     */
    const fn_popApcLink = function() {
        popApcLink.init({
            apcCd: gv_selectedApcCd,
            apcNm: gv_selectedApcNm,
            linkKnd: "S",
            kndList: ["S"]
        }, fn_popApcLinkCallBack);
    }

    const fn_popApcLinkCallBack = function() {}

    /**
     * 조회 버튼 클릭 시
     */
    const fn_search = async function() {
        await fn_setSortGrdCol();
        fn_createSortRsltList();
        fn_setSortRsltTot();
    }

    /**
     * 선별일자 변경 시
     */
    const fn_dtpChange = function() {
        let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
        let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
        var maxYmd = gfn_addDate(inptYmdFrom, 90);

        SBUxMethod.setDatepickerMaxDate('srch-dtp-inptYmdTo', maxYmd);

        if(gfn_diffDate(inptYmdFrom, inptYmdTo) < 0) {
            gfn_comAlert("W0014", "시작일자", "종료일자");    // W0014    {0}이/가 {1} 보다 큽니다.

            SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
            SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));

            return;
        }

        if(maxYmd < inptYmdTo) {
            SBUxMethod.set("srch-dtp-inptYmdTo", maxYmd);
        }
    }

    /**
     * @name fn_onInputPrdcrNm
     * @description 생산자명 입력 시 event : autocomplete
     */
    const fn_onInputPrdcrNm = function(prdcrNm) {
        fn_clearPrdcr();

        if(getByteLengthOfString(prdcrNm.target.value) > 100) {
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
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color: ''");
    }

    /**
     * @name fn_getPrdcrs
     * @description 생산자 자동완성 목록 가져오기
     */
    const fn_getPrdcrs = async function() {
        jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
        jsonPrdcr = gfn_setFrst(jsonPrdcr);
    }

    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
    }

    const fn_setPrdcr = function(prdcr) {
        if(!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color: aquamarine");    // skyblue
        }
    }
    
    /**
     * @name fn_onSelectPrdcrNm
     * @description 생산자 autocomplete 선택 callback
     */
    function fn_onSelectPrdcrNm(value, label, item) {
        // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
        if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1) {
            document.getElementById('btn-srch-prdcr').click();
        } else {
            SBUxMethod.set("srch-inp-prdcrCd", value);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color: aquamarine");	//skyblue
            let prdcr = _.find(jsonPrdcr, { prdcrCd: value });
            prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;
        }
    }

    /**
     * @name fn_getApcLink
     * @description APC 연계상태 확인
     * @function
     */
    const fn_getApcLink = async function() {
        fn_clearBatch();

        try {
            const postJsonPromise = gfn_postJSON("/am/apc/selectApcLinkStts.do", {
                apcCd: gv_selectedApcCd
            });
            const data = await postJsonPromise;

            if(_.isEqual("S", data.resultStatus)) {
                const apcLink = data.resultMap;
                fn_setApcLink(apcLink);
            } else {
                fn_setApcLink(false);
            }
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }

            console.error("failed", e.message);
        } finally {
            timerId = setInterval(() => {
                fn_getApcLink();
            }, lv_interval);
        }
    }

	const fn_clearBatch = () => {
		if(!gfn_isEmpty(timerId)) {
			clearInterval(timerId);
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

        if(gfn_isEmpty(apcLink)) {
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
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",    // 컨텍스트메뉴에 표시될 이름
            "accesskey": "e",    // 단축키
            "callback": fn_excelDwnld    // 콜백함수명
        }
    };

    /**
     * 엑셀 다운로드
     */
    function fn_excelDwnld() {
        gridSortRsltList.exportLocalExcel("선별결과목록", { bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true });
    }

    /**
     * @name getByteLengthOfString
     * @description 글자 byte 크기 계산
     */
    const getByteLengthOfString = function(s, b, i, c) {
        for(b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
        return b;
    }

    
    
    
    
	/** excel 함수 수식 **/
	let excelFx = [51,51,66,76,86,106,121,150,150];
    
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

	var jsonGrdColumnData = [];
	var jsonGrdDsctnColumnData = [];
    var jsonHghSwtColumnData = [];

    /** 육안선별 코드 변수 **/
    var BffaGrdType = [];

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

								/** 200줄 제한 **/
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
											/** 임시조치 TODO:: 미달 **/
											rmrkKeys.push('lak');
											rmrkKeys.push('sum');
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

												/** 선별 데이터 **/
												/** 선별 수량 배경색과 함수부분 **/
												if(setRow % 4 === 3){
													/** row background color **/
													for(let j = 3; j < 16; j++){
														luckysheet.setCellFormat(setRow, j, "bg", "#E6F4E8");
													}
													/** 각 라인 합계 data **/
													//TODO: 여기 함수 넣어야함.
													rmrkValues.forEach(function(i,idx){
														let setCol = Number(setStartCol + idx);
														let cal = excelFx[idx];
														let value = "=" + getCellRef(setRow - 3,setCol) + '/' + cal;

														if(!cal){
															/** 연산식이 없으면 SUM으로 대체 **/
															let sumTarget = Array.from({ length: 3 }, (_, i) => {
																return getCellRef(setRow - (i + 1), setCol);
															});
															/** 선별수량 함수 **/

															let cellFx = "=SUM(" + sumTarget.join('+') + ')';
															value = cellFx;
														}

														luckysheet.setCellValue(setRow,setCol,value || 0);
														/** 소수점 2자리 표현 **/
														luckysheet.setCellFormat(setRow, setCol, "numFmt", "0.00");
														luckysheet.setCellFormat(setRow, setCol, "ct", { t: "n", fa: "0.00" });

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
						// 수식: '=' 제거한 formula, 가능한 경우 result(숫자)도 같이 넣기
						const resultVal = toNumberIfNumeric(cell.v);
						excelCell.value = {
							formula: cell.f.startsWith('=') ? cell.f.slice(1) : cell.f,
							// result는 옵션이지만 넣으면 시각적으로 즉시 반영됨
							...(typeof resultVal === 'number' ? { result: resultVal } : {})
						};
						applyDecimalFmtIfNeeded(excelCell, resultVal);
					}else if(cell.ct?.t === 'd' && typeof cell.v === 'number'){
						const jsDate = new Date(cell.v); // timestamp → Date
						// excelCell.value = jsDate; // serial date로 변환
						excelCell.value = getExcelSerialDate(jsDate); // serial date로 변환
						excelCell.numFmt = cell.ct.fa || 'yyyy-mm-dd';
					}else if (cell.v != null) {
						const v = toNumberIfNumeric(cell.v);
						excelCell.value = v;
						applyDecimalFmtIfNeeded(excelCell, v);
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

	/** luckySheet -> excelJs style주입 **/
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

	/** merge cell 정렬 **/
	function applyAlignmentToMergeRange(ws, startRow, startCol, endRow, endCol, alignment) {
		for (let r = startRow; r <= endRow; r++) {
			for (let c = startCol; c <= endCol; c++) {
				ws.getCell(r, c).alignment = { ...alignment };
			}
		}
	}

	/** 숫자처럼 보이면 숫자로 변환 ("8.", "1,234.50", "1e-3" 등 커버) **/
	function toNumberIfNumeric(v) {
		if (typeof v === 'number') return v;
		if (typeof v !== 'string') return v;
		const n = Number(v.trim().replace(/,/g, ''));
		return Number.isNaN(n) ? v : n;
	}

	/** 값 기준으로 "소수부 존재?" 판단 **/
	function hasFractionValue(v) {
		const n = toNumberIfNumeric(v);
		return (typeof n === 'number') && Number.isFinite(n) && Math.abs(n % 1) > Number.EPSILON;
	}

	/** 필요할 때만 numFmt 적용 **/
	function applyDecimalFmtIfNeeded(excelCell, value) {
		if (hasFractionValue(value)) {
			excelCell.numFmt = '#,##0.##';      // 소수 있으면 2자리로
		} else {
			// 정수/숫자 아님 → 포맷 건드리지 않음 (General 유지)
			excelCell.numFmt = '#,##0';
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