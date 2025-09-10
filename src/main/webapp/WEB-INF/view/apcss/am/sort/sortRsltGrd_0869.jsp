<%
    /**
     * @Class Name : sortRsltGrd_0869.jsp
     * @Description : 선별결과표 화면
     * @author R&D사업본부
     * @since 2025.09.10
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일           수정자        수정내용
     * @ -----------    ---------    --------------------
     * @ 2025.09.10     최지호        최초 생성
     * @see
     *
     */
%>
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
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별결과표(제주낭) -->
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
            { caption: ["등급"], ref: 'grd', type: 'output', width: '50px', style: 'text-align: center;', merge: false },
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
                    grd: item.SE,
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
        // fnCloseProgress();
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
        gridSortRsltList.exportLocalExcel("선별결과표", { bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true });
    }

    /**
     * @name getByteLengthOfString
     * @description 글자 byte 크기 계산
     */
    const getByteLengthOfString = function(s, b, i, c) {
        for(b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
        return b;
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>