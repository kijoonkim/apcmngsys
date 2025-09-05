<%
    /**
     * @Class Name : rawDlngReg_0893.jsp
     * @Description : 원물거래명세등록 화면
     * @author R&D사업본부
     * @since 2025.09.01
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일           수정자        수정내용
     * @ -----------    ---------    --------------------
     * @ 2025.09.01     최지호        최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 원물거래명세등록</title>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>

    <style></style>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display: flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물거래명세등록 -->
                </div>

                <div style="margin-left: auto;">
                    <sbux-button
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="조회"
                        onclick="fn_search"
                    ></sbux-button>
                    <sbux-button
                        id="btnSave"
                        name="btnSave"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="저장"
                        onclick="fn_save"
                    ></sbux-button>
                    <sbux-button
                        id="btnDelete"
                        name="btnDelete"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="삭제"
                        onclick="fn_delete"
                    ></sbux-button>
                </div>
            </div>

            <div class="box-body">
                <table class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 7%;">
                        <col style="width: 6%;">
                        <col style="width: 6%;">
                        <col style="width: 3%;">
                        <col style="width: 7%;">
                        <col style="width: 6%;">
                        <col style="width: 3%;">
                        <col style="width: 3%;">
                        <col style="width: 3%;">
                        <col style="width: 7%;">
                        <col style="width: 6%;">
                        <col style="width: 3%;">
                        <col style="width: 6%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="th_bg">APC명</th>
                            <td class="td_input" colspan="3" style="border-right: hidden;">
                                <%@ include file="../../../frame/inc/apcSelectComp.jsp" %>
                            </td>

                            <td colspan="9"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">파종일자</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                    uitype="popup"
                                    id="srch-dtp-sdngYmdFrom"
                                    name="srch-dtp-sdngYmdFrom"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                    onchange="fn_dtpChange(srch-dtp-sdngYmdFrom)"
                                ></sbux-datepicker>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                    uitype="popup"
                                    id="srch-dtp-sdngYmdTo"
                                    name="srch-dtp-sdngYmdTo"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                    onchange="fn_dtpChange(srch-dtp-sdngYmdTo)"
                                ></sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;"></td>

                            <th scope="row" class="th_bg" id="cmnYmdTh" style="color: red;">예상정식일자</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                    uitype="popup"
                                    id="srch-dtp-cmnYmdFrom"
                                    name="srch-dtp-cmnYmdFrom"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                    onchange="fn_dtpChange(srch-dtp-cmnYmdFrom)"
                                ></sbux-datepicker>
                            </td>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                    uitype="popup"
                                    id="srch-dtp-cmnYmdTo"
                                    name="srch-dtp-cmnYmdTo"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                    onchange="fn_dtpChange(srch-dtp-cmnYmdTo)"
                                ></sbux-datepicker>
                            </td>
                            <td class="td_input" style="border-right: hidden;">

                            <th scope="row" class="th_bg">품종</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-vrtyCd"
                                    name="srch-slt-vrtyCd"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonComVrty"
                                    onchange="fn_selectVrty"
                                ></sbux-select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg" id="nurseryTh">육묘구역열</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                    unselected-text=""
                                    uitype="single"
                                    id="srch-slt-nurseryZoneCol1"
                                    name="srch-slt-nurseryZoneCol1"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonNurseryZoneCol"
                                    onchange=""
                                ></sbux-select>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                    unselected-text=""
                                    uitype="single"
                                    id="srch-slt-nurseryZoneCol2"
                                    name="srch-slt-nurseryZoneCol2"
                                    class="form-control input-sm"
                                    jsondata-ref=""
                                    onchange=""
                                ></sbux-select>
                            </td>
                            <td style="border-right: hidden;"></td>

                            <th scope="row" class="th_bg" id="cltvtnTh">재배구역열</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                    unselected-text=""
                                    uitype="single"
                                    id="srch-slt-cltvtnZoneCol1"
                                    name="srch-slt-cltvtnZoneCol1"
                                    class="form-control input-sm"
                                    jsondata-ref=""
                                    onchange=""
                                ></sbux-select>
                            </td>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                    unselected-text=""
                                    uitype="single"
                                    id="srch-slt-cltvtnZoneCol2"
                                    name="srch-slt-cltvtnZoneCol2"
                                    class="form-control input-sm"
                                    jsondata-ref=""
                                    onchange=""
                                ></sbux-select>
                            </td>
                            <td style="border-right: hidden;"></td>

                            <th scope="row" class="th_bg" id="cnptTh">거래처</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-input
                                    id="srch-inp-cnptNm"
                                    name="srch-inp-cnptNm"
                                    uitype="text"
                                    class="form-control input-sm"
                                ></sbux-input>
                                <sbux-input id="srch-inp-cnptCd" name="srch-inp-cnptCd" uitype="hidden"></sbux-input>
                            </td>
                            <td class="td_input">
                                <sbux-button
                                    id="btn-srch-cnpt"
                                    name="btn-srch-cnpt"
                                    class="btn btn-xs btn-outline-dark"
                                    text="찾기"
                                    uitype="modal"
                                    target-id="modal-cnpt"
                                    onclick="fn_choiceCnpt"
                                ></sbux-button>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="table-responsive tbl_scroll_sm" style="flex: 1; margin-top: 2vh;">
                    <sbux-tabs
                        id="idxTab_norm"
                        name="idxTab_norm"
                        uitype="normal"
                        is-scrollable="false"
                        jsondata-ref="tabJsonData"
                        callback-after-select="fn_selectTab"
                    ></sbux-tabs>

                    <sbux-button
                        id="btnNewReg"
                        name="btnNewReg"
                        uitype="normal"
                        class="btn btn-sm btn-primary"
                        text="신규등록"
                        onclick="fn_newReg"
                        style="position: absolute; top: 0px; right: 0px;"
                    ></sbux-button>

                    <div class="tab-content" style="overflow: initial !important;">
                        <div id="nurseryTab">
                            <div id="sb-area-nursery" style="height: 470px;"></div>
                        </div>
                        <div id="cltvtnTab">
                            <div id="sb-area-cltvtn" style="height: 470px;"></div>
                        </div>
                        <div id="wghTab">
                            <div id="sb-area-wgh" style="height: 470px;"></div>
                        </div>
                        <div id="spmtTab">
                            <div id="sb-area-spmt" style="height: 470px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal
            id="modal-cnpt"
            name="modal-cnpt"
            uitype="middle"
            header-title="거래처 선택"
            body-html-id="body-modal-cnpt"
            footer-is-close-button="false"
            header-is-close-button="false"
            style="width: 1000px;"
        ></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
        <jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
    var grdNursery;    // 육묘장 그리드
    var grdCltvtn;    // 재배장 그리드
    var grdWgh;    // 계량 그리드
    var grdSpmt;    // 출고 그리드

    var jsonCnpt = [];    // 거래처 내역
    var jsonNursery = [];    // 육묘장 내역
    var jsonCltvtn = [];    // 재배장 내역
    var jsonWgh = [];    // 계량 내역
    var jsonSpmt = [];    // 출고 내역
    var jsonComVrty = [];    // 품종 검색 조건    vrtyCd    선택
    var jsonGrdVrty = [];    // 품종 그리드    vrtyCd    선택
    var jsonGrdCnpt = [];    // 거래처 그리드    cnpt    선택
    var tabJsonData = [
        { "id": "0", "pid": "-1", "order": "1", "text": "육묘장", "targetid": "nurseryTab", "targetvalue": "육묘장" },
        { "id": "1", "pid": "-1", "order": "2", "text": "재배장", "targetid": "cltvtnTab", "targetvalue": "재배장" },
        { "id": "2", "pid": "-1", "order": "3", "text": "계량", "targetid": "wghTab", "targetvalue": "계량" },
        { "id": "3", "pid": "-1", "order": "4", "text": "출고", "targetid": "spmtTab", "targetvalue": "출고" }
    ];

    window.addEventListener("DOMContentLoaded", function() {
        fn_init();
    });

    const fn_init = async function() {
        SBUxMethod.set("srch-dtp-sdngYmdFrom", gfn_dateToYmd(new Date()));
        SBUxMethod.set("srch-dtp-sdngYmdTo", gfn_dateToYmd(new Date()));
        SBUxMethod.set("srch-dtp-cmnYmdFrom", gfn_dateToYmd(new Date()));
        SBUxMethod.set("srch-dtp-cmnYmdTo", gfn_dateToYmd(new Date()));

        fn_createNursery();    // 육묘장 그리드 생성
        fn_createCltvtn();    // 재배장 그리드 생성
        fn_createWgh();    // 계량 그리드 생성
        fn_createSpmt();    // 출고 그리드 생성

        fn_initSBSelect();
        fn_selectTab();
    }

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd),    // 품종
            gfn_setApcVrtySBSelect('grdNursery', jsonGrdVrty, gv_selectedApcCd),    // 품종 그리드
            gfn_setCpntRgnSBSelect('grdNursery', jsonGrdCnpt, gv_selectedApcCd)    // 거래처 그리드
        ]);

        grdNursery.refresh({ "combo": true });
        grdSpmt.refresh({ "combo": true });
    }

    function fn_createNursery() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-nursery';
        SBGridProperties.id = 'grdNursery';
        SBGridProperties.jsonref = 'jsonNursery';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            { caption: ["", ""], ref: 'checkedYn', type: 'checkbox',  width: '50px', style: 'text-align: center;', userattr: {colNm: "checkedYn"}, typeinfo: {checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 0}} },
            { caption: ["품종", "품종"], ref: 'vrtyCd', type: 'combo', width: '90px', style: 'text-align: center;', typeinfo: {ref: 'jsonGrdVrty', displayui: false, itemcount: 10, label: 'label', value: 'value'} },
            { caption: ["파종일자", "파종일자"], ref: 'sdngYmd', type: 'inputdate', width: '100px', style: 'text-align: center;', typeinfo: {dateformat: 'yyyy-mm-dd'}, format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'YYYYMMDD'}, disabled: false },
            { caption: ["육묘기준일", "육묘기준일"], ref: 'sdlBrdStnDt', type: 'input', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["예상정식일", "예상정식일"], ref: 'antOfcDt', type: 'output', width: '100px', style: 'text-align: center;', format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'} },
            { caption: ["육묘장", "판"], ref: 'trayId', type: 'input', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["육묘장", "구"], ref: 'cellId', type: 'input', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["육묘장", "주수"], ref: 'plantCnt', type: 'output', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["육묘장", "구역"], ref: 'sectionId', type: 'input', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["육묘장", "열"], ref: 'rowId', type: 'input', width: '100px', style: 'text-align: center;' },
            { caption: ["정식일자", "정식일자"], ref: 'clclnYmd', type: 'output', width: '100px', style: 'text-align: center;', format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'} },
            { caption: ["수확일자", "수확일자"], ref: 'hrvstYmd', type: 'output', width: '100px', style: 'text-align: center;', format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'} },
            { caption: ["육묘장 비고", "육묘장 비고"], ref: 'nurseryRmrk', type: 'input', width: '200px', style: 'text-align: left;' }
        ];

        grdNursery = _SBGrid.create(SBGridProperties);
        grdNursery.rebuild();
    }

    function fn_createCltvtn() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-cltvtn';
        SBGridProperties.id = 'grdCltvtn';
        SBGridProperties.jsonref = 'jsonCltvtn';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            { caption: ["품종", "품종"], ref: 'vrtyCd', type: 'output', width: '90px', style: 'text-align: center;' },
            { caption: ["파종일자", "파종일자"], ref: 'sdngYmd', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["예상정식일", "예상정식일"], ref: 'antOfcYmd', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["육묘장", "판"], ref: 'trayId', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["육묘장", "구"], ref: 'cellId', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["육묘장", "주수"], ref: 'plantCnt', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["육묘장", "구역"], ref: 'sectionId', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["육묘장", "열"], ref: 'rowId', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["처리", "처리"], ref: 'delYn', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["재배장", "배드기준"], ref: 'bedType', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["재배장", "정식율"], ref: 'rate', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["재배장", "주수"], ref: 'cltvtn3', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["재배장", "구역"], ref: 'cltvtn4', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["재배장", "열"], ref: 'cltvtn5', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["육모장 비고", "육모장 비고"], ref: 'nurseryRmrk', type: 'output', width: '200px', style: 'text-align: center;' },
            { caption: ["재배장 비고", "재배장 비고"], ref: 'cltvtnRmrk', type: 'output', width: '200px', style: 'text-align: center;' },
            { caption: ["수확일자", "수확일자"], ref: 'hrvstYmd', type: 'output', width: '100px', style: 'text-align: left;' }
        ];

        grdCltvtn = _SBGrid.create(SBGridProperties);
        grdCltvtn.rebuild();
    }

    function fn_createWgh() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-wgh';
        SBGridProperties.id = 'grdWgh';
        SBGridProperties.jsonref = 'jsonWgh';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            { caption: ["품종", "품종"], ref: 'vrtyCd', type: 'output', width: '90px', style: 'text-align: center;' },
            { caption: ["구역", "구역"], ref: 'zone', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["열", "열"], ref: 'col', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["주수", "주수"], ref: 'numPlants', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["처리", "처리"], ref: 'delYn', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["계량일자", "계량일자"], ref: 'wghYmd', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["계량", "계량 값"], ref: 'wgh1', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["계량", "실 무게"], ref: 'wgh2', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["포장", "개수"], ref: 'pckg1', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["포장", "중량"], ref: 'pckg2', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["포장", "합계"], ref: 'pckg3', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ["포기당 (g)", "포장"], ref: 'pogi1', type: 'output', width: '100px', style: 'text-align: left;' },
            { caption: ["포기당 (g)", "실측"], ref: 'pogi2', type: 'output', width: '100px', style: 'text-align: left;' },
            { caption: ["포기당 (g)", "LOSS"], ref: 'pogi3', type: 'output', width: '100px', style: 'text-align: left;' },
            { caption: ["파종일자", "파종일자"], ref: 'sdngYmd', type: 'output', width: '100px', style: 'text-align: left;' },
            { caption: ["정식일자", "정식일자"], ref: 'clclnYmd', type: 'output', width: '100px', style: 'text-align: left;' }
        ];

        grdWgh = _SBGrid.create(SBGridProperties);
        grdWgh.rebuild();
    }

    function fn_createSpmt() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-spmt';
        SBGridProperties.id = 'grdSpmt';
        SBGridProperties.jsonref = 'jsonSpmt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            { caption: ["", ""], ref: 'checkedYn', type: 'checkbox',  width: '50px', style: 'text-align: center;', userattr: {colNm: "checkedYn"}, typeinfo: {checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 0}} },
            { caption: ["출고일자", "출고일자"], ref: 'smptYmd', type: 'inputdate', width: '100px', style: 'text-align: center;', typeinfo: {dateformat: 'yyyy-mm-dd'}, format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'YYYYMMDD'}, disabled: false },
            { caption: ["품종", "품종"], ref: 'vrtyCd', type: 'combo', width: '90px', style: 'text-align: center;', typeinfo: {ref: 'jsonGrdVrty', displayui: false, itemcount: 10, label: 'label', value: 'value'} },
            { caption: ["재고 (박스)", "재고 (박스)"], ref: 'invntr', type: 'output', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["거래처", "거래처"], ref: 'cnpt', type: 'combo', width: '100px', style: 'text-align: center;', typeinfo: {ref: 'jsonGrdCnpt', displayui: false, itemcount: 10, label: 'label', value: 'value'} },
            { caption: ["박스 (개)", "박스 (개)"], ref: 'bx', type: 'input', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["중량 (Kg)", "중량 (Kg)"], ref: 'wght', type: 'input', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["양 (Kg)", "양 (Kg)"], ref: 'amount', type: 'output', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["비고", "비고"], ref: 'rmrk', type: 'input', width: '200px', style: 'text-align: center;' }
        ];

        grdSpmt = _SBGrid.create(SBGridProperties);
        grdSpmt.rebuild();
    }

    /**
     * 탭 변경 시
     */
    function fn_selectTab() {
        let tab = SBUxMethod.get("idxTab_norm");

        if(tab === 'nurseryTab') {
            SBUxMethod.show('btnDelete');

            cmnYmdTh.textContent = '예상정식일자';

            nurseryTh.textContent = '육묘구역열';
            SBUxMethod.show('srch-slt-nurseryZoneCol1');
            SBUxMethod.show('srch-slt-nurseryZoneCol2');

            cltvtnTh.textContent = '';
            SBUxMethod.hide('srch-slt-cltvtnZoneCol1');
            SBUxMethod.hide('srch-slt-cltvtnZoneCol2');

            cnptTh.textContent = '';
            SBUxMethod.hide('srch-inp-cnptNm');
            SBUxMethod.hide('btn-srch-cnpt');

            SBUxMethod.show('btnNewReg');
        } else if(tab === 'cltvtnTab') {
            SBUxMethod.hide('btnDelete');

            cmnYmdTh.textContent = '정식일자';

            nurseryTh.textContent = '육묘구역열';
            SBUxMethod.show('srch-slt-nurseryZoneCol1');
            SBUxMethod.show('srch-slt-nurseryZoneCol2');

            cltvtnTh.textContent = '재배구역열';
            SBUxMethod.show('srch-slt-cltvtnZoneCol1');
            SBUxMethod.show('srch-slt-cltvtnZoneCol2');

            cnptTh.textContent = '';
            SBUxMethod.hide('srch-inp-cnptNm');
            SBUxMethod.hide('btn-srch-cnpt');

            SBUxMethod.hide('btnNewReg');
        } else if(tab === 'wghTab') {
            SBUxMethod.hide('btnDelete');

            cmnYmdTh.textContent = '계량일자';

            nurseryTh.textContent = '';
            SBUxMethod.hide('srch-slt-nurseryZoneCol1');
            SBUxMethod.hide('srch-slt-nurseryZoneCol2');

            cltvtnTh.textContent = '재배구역열';
            SBUxMethod.show('srch-slt-cltvtnZoneCol1');
            SBUxMethod.show('srch-slt-cltvtnZoneCol2');

            cnptTh.textContent = '';
            SBUxMethod.hide('srch-inp-cnptNm');
            SBUxMethod.hide('btn-srch-cnpt');

            SBUxMethod.hide('btnNewReg');
        } else if(tab === 'spmtTab') {
            SBUxMethod.show('btnDelete');
            cmnYmdTh.textContent = '출고일자';

            nurseryTh.textContent = '';
            SBUxMethod.hide('srch-slt-nurseryZoneCol1');
            SBUxMethod.hide('srch-slt-nurseryZoneCol2');

            cltvtnTh.textContent = '';
            SBUxMethod.hide('srch-slt-cltvtnZoneCol1');
            SBUxMethod.hide('srch-slt-cltvtnZoneCol2');

            cnptTh.textContent = '거래처';
            SBUxMethod.show('srch-inp-cnptNm');
            SBUxMethod.show('btn-srch-cnpt');

            SBUxMethod.show('btnNewReg');
        }
    }

    /**
     * 일자 변경 시
     */
    const fn_dtpChange = function() {
        let sdngYmdFrom = SBUxMethod.get("srch-dtp-sdngYmdFrom");
        let sdngYmdTo = SBUxMethod.get("srch-dtp-sdngYmdTo");
        let cmnYmdFrom = SBUxMethod.get("srch-dtp-cmnYmdFrom");
        let cmnYmdTo = SBUxMethod.get("srch-dtp-cmnYmdTo");

        if(gfn_diffDate(sdngYmdFrom, sdngYmdTo) < 0) {
            gfn_comAlert("W0014", "시작일자", "종료일자");    // W0014    {0}이/가 {1} 보다 큽니다.

            SBUxMethod.set("srch-dtp-sdngYmdFrom", gfn_dateFirstYmd(new Date()));
            SBUxMethod.set("srch-dtp-sdngYmdTo", gfn_dateToYmd(new Date()));

            return;
        } else if(gfn_diffDate(cmnYmdFrom, cmnYmdTo) < 0) {
            gfn_comAlert("W0014", "시작일자", "종료일자");    // W0014    {0}이/가 {1} 보다 큽니다.

            SBUxMethod.set("srch-dtp-cmnYmdFrom", gfn_dateFirstYmd(new Date()));
            SBUxMethod.set("srch-dtp-cmnYmdTo", gfn_dateToYmd(new Date()));

            return;
        }
    }

    /**
     * 조회 버튼 클릭 시
     */
    const fn_search = async function() {
        let sdngYmdFrom = SBUxMethod.get("srch-dtp-sdngYmdFrom");
        let sdngYmdTo = SBUxMethod.get("srch-dtp-sdngYmdTo");
        let cmnYmdFrom = SBUxMethod.get("srch-dtp-cmnYmdFrom");
        let cmnYmdTo = SBUxMethod.get("srch-dtp-cmnYmdTo");

        if(gfn_isEmpty(sdngYmdFrom) || gfn_isEmpty(sdngYmdTo)) {
            gfn_comAlert("W0001", "파종일자");    // W0002    {0}을/를 선택하세요.
            return;
        }

        if(gfn_isEmpty(cmnYmdFrom) || gfn_isEmpty(cmnYmdTo)) {
            gfn_comAlert("W0001", document.getElementById('cmnYmdTh').innerText);    // W0002    {0}을/를 선택하세요.
            return;
        }
    }

    /**
     * 저장 버튼 클릭 시
     */
    const fn_save = async function() {
        const rawList = [];

        let tab = SBUxMethod.get("idxTab_norm");
        if(tab === 'nurseryTab') {
            let allData = grdNursery.getGridDataAll();

            for(let i = 1; i <= allData.length; i++) {
                const rowData = grdNursery.getRowData(i + 1);
                const rowSts = grdNursery.getRowStatus(i + 1);

                if(gfn_isEmpty(rowData.vrtyCd)) {
                    gfn_comAlert("W0001", "품종");    // W0002    {0}을/를 선택하세요.
                    return;
                }

                if(gfn_isEmpty(rowData.sdngYmd)) {
                    gfn_comAlert("W0001", "파종일자");    // W0002    {0}을/를 선택하세요.
                    return;
                }

                if(gfn_isEmpty(rowData.sdlBrdStnDt)) {
                    gfn_comAlert("W0002", "육묘기준일");    // W0002    {0}을/를 입력하세요.
                    return;
                }

                const year = rowData.sdngYmd.substring(0, 4);
                const month = rowData.sdngYmd.substring(4, 6) - 1;
                const day = parseInt(rowData.sdlBrdStnDt, 10) + parseInt(rowData.sdngYmd.substring(6, 8));

                const resultYear = new Date(year, month, day).getFullYear();
                const resultMonth = (new Date(year, month, day).getMonth() + 1).toString().padStart(2, '0');
                const resultDay = new Date(year, month, day).getDate().toString().padStart(2, '0');

                rowData.antOfcDt = resultYear + resultMonth + resultDay;
                rawList.push(rowData);
            }
        } else if(tab === 'cltvtnTab') {
        } else if(tab === 'wghTab') {
        } else if(tab === 'spmtTab') {
            let allData = grdSpmt.getGridDataAll();

            for(let i = 1; i <= allData.length; i++) {
                const rowData = grdSpmt.getRowData(i + 1);
                const rowSts = grdSpmt.getRowStatus(i + 1);

                if(gfn_isEmpty(rowData.smptYmd)) {
                    gfn_comAlert("W0001", "출고일자");    // W0002    {0}을/를 선택하세요.
                    return;
                }

                if(gfn_isEmpty(rowData.vrtyCd)) {
                    gfn_comAlert("W0001", "품종");    // W0002    {0}을/를 선택하세요.
                    return;
                }

                if(gfn_isEmpty(rowData.cnpt)) {
                    gfn_comAlert("W0001", "거래처");    // W0002    {0}을/를 선택하세요.
                    return;
                }

                rawList.push(rowData);
            }
        }

        if(rawList.length == 0) {
            gfn_comAlert("W0003", "저장");    // W0003    {0}할 대상이 없습니다.
            return;
        }

        if(!gfn_comConfirm("Q0001", "저장")) {    // Q0001    {0} 하시겠습니까?
            return;
        }

        // const postJsonPromise = gfn_postJSON("/am/wrhs/insert", rawList);
        // const data = await postJsonPromise;
        //
        // try {
        //     if(_.isEqual("S", data.resultStatus)) {
        //         gfn_comAlert("I0001");    // I0001    처리 되었습니다.
        //         fn_search();
        //     } else {
        //         gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
        //     }
        // } catch(e) {
        //     if(!(e instanceof Error)) {
        //         e = new Error(e);
        //     }
        //
        //     console.error("failed", e.message);
        //     gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
        // }
    }

    /**
     * 삭제 버튼 클릭 시
     */
    const fn_delete = async function() {
        let tab = SBUxMethod.get("idxTab_norm");
        let allData;

        if(tab === 'nurseryTab') {
            allData = grdNursery.getGridDataAll();
        } else if(tab === 'spmtTab') {
            allData = grdSpmt.getGridDataAll();
        }

        let deleteIndex = [];

        for(let i = 0; i < allData.length; i++) {
            if(allData[i].checkedYn === "Y") {
                deleteIndex.push(i + 2);
            }
        }

        if(gfn_isEmpty(deleteIndex)) {
            gfn_comAlert("W0003", "삭제");    // W0003    {0}할 대상이 없습니다.
            return;
        }

        for(let i = deleteIndex.length - 1; i >= 0; i--) {
            if(tab === 'nurseryTab') {
                grdNursery.deleteRow(deleteIndex[i]);
            } else if(tab === 'spmtTab') {
                grdSpmt.deleteRow(deleteIndex[i]);
            }
        }
    }

    /**
     * 거래처 찾기 버튼 클릭 시
     */
    const fn_choiceCnpt = function() {
        popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnptNm"), fn_setCnpt);
    }

    /**
     * 거래처 set
     */
    const fn_setCnpt = function(cnpt) {
        if(!gfn_isEmpty(cnpt)) {
            SBUxMethod.set("srch-inp-cnptCd", cnpt.cnptCd);
            SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
        }
    }

    /**
     * 신규등록 버튼 클릭 시
     */
    const fn_newReg = async function() {
        let tab = SBUxMethod.get("idxTab_norm");

        if(tab === 'nurseryTab') {
            grdNursery.addRow(true);
            grdNursery.refresh();
        } else if(tab === 'spmtTab') {
            grdSpmt.addRow(true);
            grdSpmt.refresh();
        }
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>