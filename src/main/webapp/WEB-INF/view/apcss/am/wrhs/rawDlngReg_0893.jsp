<%
    /**
     * @Class Name : rawDlngReg_0893.jsp
     * @Description : 원물거래명세등록(오름파밍) 화면
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
    <title>title : 원물거래명세등록(오름파밍)</title>
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
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물거래명세등록(오름파밍) -->
                </div>

                <div style="margin-left: auto;">
                    <sbux-button
                        id="btnSdlngCrtrPop"
                        name="btnSdlngCrtrPop"
                        class="btn btn-sm btn-primary btn-mbl"
                        uitype="modal"
                        target-id="modal-sdlngCrtrPop"
                        text="육묘기준관리"
                        onclick="fn_sdlngCrtrPop"
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
                    <sbux-button
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="조회"
                        onclick="fn_search"
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

                            <th scope="row" class="th_bg" id="cmnYmdTh">예상정식일자</th>
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
                                    onchange=""
                                ></sbux-select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg" id="sdlngTh">육묘구역열</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-sdlngZone"
                                    name="srch-slt-sdlngZone"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonComSdlngZone"
                                    onchange="fn_onChangeSrchSdlngZone(this)"
                                ></sbux-select>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-sdlngRow"
                                    name="srch-slt-sdlngRow"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonComSdlngRow"
                                    onchange="fn_onChangeSrchSdlngRow(this)"
                                ></sbux-select>
                            </td>
                            <td style="border-right: hidden;"></td>

                            <th scope="row" class="th_bg" id="cltvtnTh">재배구역열</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-cltvtnZone"
                                    name="srch-slt-cltvtnZone"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonComCltvtnZone"
                                    onchange="fn_onChangeSrchCltvtnZone(this)"
                                ></sbux-select>
                            </td>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-cltvtnRow"
                                    name="srch-slt-cltvtnRow"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonComCltvtnRow"
                                    onchange="fn_onChangeSrchCltvtnRow(this)"
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
                                <sbux-input
                                    id="srch-inp-cnptCd"
                                    name="srch-inp-cnptCd"
                                    uitype="hidden"
                                ></sbux-input>
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
                        <div id="sdlngTab">
                            <div id="sb-area-sdlng" style="height: 470px;"></div>
                        </div>
                        <div id="cltvtnTab">
                            <div id="sb-area-cltvtn" style="height: 470px;"></div>
                        </div>
                        <div id="wghTab">
                            <div id="sb-area-wgh" style="height: 470px;"></div>
                        </div>
                        <div id="spmtTab">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="ad_tbl_top" style="width: 98%;">
                                        <ul class="ad_tbl_count">
                                            <li>
                                                <span style="color: black;">재고정보</span>
                                            </li>
                                        </ul>
                                    </div>
                                    <div>
                                        <div id="sb-area-gdsInvntr" style="width: 100%; height: 440px;"></div>
                                    </div>
                                </div>
                                <div class="col-sm-9">
                                    <div>
                                        <div class="ad_tbl_top">
                                            <ul class="ad_tbl_count">
                                                <li>
                                                    <span style="color: black;">출고정보</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div>
                                            <div id="sb-area-spmt" style="height: 440px;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 육묘기준 관리 Modal -->
    <div>
        <sbux-modal
            id="modal-sdlngCrtrPop"
            name="modal-sdlngCrtrPop"
            uitype="middle"
            header-title="육묘기준 등록"
            body-html-id="body-modal-sdlngCrtrPop"
            header-is-close-button="false"
            footer-is-close-button="false"
            style="width: 800px;"
        ></sbux-modal>
    </div>
    <div id="body-modal-sdlngCrtrPop">
        <jsp:include page="../../am/popup/sdlngCrtrPopup.jsp"></jsp:include>
    </div>

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
    var gridSdlng;    // 육묘장 그리드
    var gridCltvtn;    // 재배장 그리드
    var gridWgh;    // 계량 그리드
    var gridGdsInvntr;    // 상품 재고 그리드
    var gridSpmt;    // 출고 그리드

    let newReg = 0;    // 신규등록 처리

    var jsonCnpt = [];    // 거래처 내역
    var jsonSdlng = [];    // 육묘장 내역
    var jsonCltvtn = [];    // 재배장 내역
    var jsonSpmtPckgUnitCd = [];    // 출하포장단위 그리드    spmtPckgUnitCd    선택
    var jsonWgh = [];    // 계량 내역
    var jsonGdsInvntr = [];    // 상품 재고 내역
    var jsonSpmt = [];    // 출고 내역
    var jsonComVrty = [];    // 품종 검색 조건    vrtyCd    선택
    var jsonGridVrty = [];    // 품종 그리드    vrtyCd    선택
    var jsonGridCnpt = [];    // 거래처 그리드    cnpt    선택
    var jsonComSdlngZone = [];    // 육묘장 구역 검색 조건    sdlngZone    선택
    var jsonComCltvtnZone = [];    // 재배장 구역 검색 조건    cltvtnZone    선택
    var jsonComSdlngRow = [];    // 육묘장 열 검색 조건    sdlngRow    선택
    var jsonComCltvtnRow = [];    // 재배장 열 검색 조건    cltvtnRow    선택
    var jsonGridSdlngZone = [];    // 육묘장 구역 그리드    sdlngZone    선택
    var jsonGridCltvtnZone = [];    // 재배장 구역 그리드    cltvtnZone    선택
    var jsonGridSdlngRow = [];    // 육묘장 열 그리드    sdlngRow    선택
    var jsonGridCltvtnRow = [];    // 재배장 열 그리드    cltvtnRow    선택
    var tabJsonData = [
        { "id": "0", "pid": "-1", "order": "1", "text": "육묘장", "targetid": "sdlngTab", "targetvalue": "육묘장" },
        { "id": "1", "pid": "-1", "order": "2", "text": "재배장", "targetid": "cltvtnTab", "targetvalue": "재배장" },
        { "id": "2", "pid": "-1", "order": "3", "text": "계량", "targetid": "wghTab", "targetvalue": "계량" },
        { "id": "3", "pid": "-1", "order": "4", "text": "출고", "targetid": "spmtTab", "targetvalue": "출고" }
    ];

    window.addEventListener("DOMContentLoaded", function() {
        fn_init();
    });

    /**
     * @name fn_init
     * @description 초기 화면 설정
     */
    const fn_init = async function() {
        SBUxMethod.set("srch-dtp-sdngYmdFrom", gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("srch-dtp-sdngYmdTo", gfn_dateToYmd(new Date()));

        fn_createSdlng();    // 육묘장 그리드 생성
        fn_createCltvtn();    // 재배장 그리드 생성
        fn_createWgh();    // 계량 그리드 생성
        fn_createGdsInvntr();    // 상품 재고 그리드 생성
        fn_createSpmt();    // 출고 그리드 생성

        fn_initSBSelect();
        fn_search();
    }

    /**
     * @name fn_initSBSelect
     * @description 초기 데이터 조회
     */
    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            gfn_setSdlngCrtrSBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd),    // 품종
            gfn_setSpmtPckgUnitSBSelect('gridWgh', jsonSpmtPckgUnitCd, gv_selectedApcCd),    // 출하포장단위 그리드
            gfn_setSdlngCrtrSBSelect('gridSdlng', jsonGridVrty, gv_selectedApcCd),    // 품종 그리드
            gfn_setCpntRgnSBSelect('gridSdlng', jsonGridCnpt, gv_selectedApcCd),    // 거래처 그리드
            gfn_setSdlngFcltZoneSBSelect('srch-slt-sdlngZone', jsonComSdlngZone, gv_selectedApcCd, '01'),    // 육묘장 구역
            gfn_setSdlngFcltZoneSBSelect('srch-slt-cltvtnZone', jsonComCltvtnZone, gv_selectedApcCd, '02'),    // 재배장 구역
            gfn_setSdlngFcltRowSBSelect('srch-slt-sdlngRow', jsonComSdlngRow, gv_selectedApcCd, '01'),    // 육묘장 열
            gfn_setSdlngFcltRowSBSelect('srch-slt-cltvtnRow', jsonComCltvtnRow, gv_selectedApcCd, '02'),    // 재배장 열
            gfn_setSdlngFcltZoneSBSelect('gridSdlng', jsonGridSdlngZone, gv_selectedApcCd, '01'),    // 육묘장 구역 그리드
            gfn_setSdlngFcltZoneSBSelect('gridCltvtn', jsonGridCltvtnZone, gv_selectedApcCd, '02'),    // 재배장 구역 그리드
            gfn_setSdlngFcltRowSBSelect('gridSdlng', jsonGridSdlngRow, gv_selectedApcCd, '01'),    // 육묘장 열 그리드
            gfn_setSdlngFcltRowSBSelect('gridCltvtn', jsonGridCltvtnRow, gv_selectedApcCd, '02'),    // 재배장 열 그리드
        ]);

        gridSdlng.refresh({ "combo": true });
        gridCltvtn.refresh({ "combo": true });
        gridWgh.refresh({ "combo": true });
        gridSpmt.refresh({ "combo": true });

        fn_selectTab();
    }

    /**
     * @name fn_createSdlng
     * @description 육묘장 그리드 생성
     */
    function fn_createSdlng() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-sdlng';
        SBGridProperties.id = 'gridSdlng';
        SBGridProperties.jsonref = 'jsonSdlng';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.explorerbar = 'move';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.allowcopy = true;
        SBGridProperties.mergecells = 'byrestriccol';
        SBGridProperties.contextmenu = true;    // 우클릭 메뉴 호출 여부
        SBGridProperties.contextmenulist = objMenuListSdlng;    // 우클릭 메뉴 리스트
        SBGridProperties.columns = [
            { caption: ["육묘번호", "육묘번호"], ref: 'sdlngNo', hidden: true },
            { caption: ["", ""], ref: 'checkedYn', type: 'checkbox',  width: '50px', style: 'text-align: center; background: #FFF8DC;', userattr: {colNm: "checkedYn"}, typeinfo: {checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 0}} },
            { caption: ["품종", "품종"], ref: 'vrtyCd', type: 'combo', width: '90px', style: 'text-align: center; background: #FFF8DC;', sortable: false, typeinfo: {ref: 'jsonGridVrty', label: 'label', value: 'value', itemcount: 10} },
            { caption: ["파종일자", "파종일자"], ref: 'sdngYmd', type: 'datepicker', width: '100px', style: 'text-align: center; background: #FFF8DC;', typeinfo: {dateformat: 'yyyy-mm-dd'}, format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'YYYYMMDD'}, disabled: false },
            { caption: ["육묘기준일", "육묘기준일"], ref: 'sdlngCrtrYmd', type: 'input', width: '100px', style: 'text-align: center; background: #FFF8DC;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["예상정식일", "예상정식일"], ref: 'expctPlntngYmd', type: 'output', width: '100px', style: 'text-align: center;', format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'} },
            { caption: ["육묘장", "판"], ref: 'sdlngTray', type: 'input', width: '60px', style: 'text-align: center; background: #FFF8DC;', typeinfo: {mask: {alias: 'numeric'}, maxlength: 4}, format: {type: 'number', rule: '#,###'} },
            { caption: ["육묘장", "구"], ref: 'sdlngCell', type: 'input', width: '60px', style: 'text-align: center; background: #FFF8DC;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###.###'} },
            { caption: ["육묘장", "주수"], ref: 'sdlngPlanting', type: 'output', width: '60px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}, maxlength: 10}, format: {type: 'number', rule: '#,###'} },
            { caption: ["육묘장", "구역"], ref: 'sdlngZone', type: 'combo', width: '80px', style: 'text-align: center; background: #FFF8DC;', sortable: false, typeinfo: {ref: 'jsonGridSdlngZone', label: 'label', value: 'value', itemcount: 10} },
            { caption: ["육묘장", "열"], ref: 'sdlngRow', type: 'combo', width: '80px', style: 'text-align: center; background: #FFF8DC;', sortable: false, typeinfo: {ref: 'jsonGridSdlngRow', label: 'label', value: 'value', itemcount: 10, filtering: {usemode: true, uppercol: 'sdlngZone', attrname: 'fcltZoneSeCd'}} },
            { caption: ["정식일자", "정식일자"], ref: 'plntngYmd', type: 'output', width: '100px', style: 'text-align: center;', format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}, merge: false },
            { caption: ["수확일자", "수확일자"], ref: 'hrvstYmd', type: 'output', width: '100px', style: 'text-align: center;', format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}, merge: false },
            { caption: ["육묘장 비고", "육묘장 비고"], ref: 'sdlngRmrk', type: 'input', width: '200px', style: 'text-align: left; background: #FFF8DC;', typeinfo: {maxlength: 1000} }
        ];

        gridSdlng = _SBGrid.create(SBGridProperties);
        gridSdlng.bind('valuechanged', 'fn_gridSdlngValueChanged');
        gridSdlng.rebuild();
    }

    /**
     * @name fn_createCltvtn
     * @description 재배장 그리드 생성
     */
    function fn_createCltvtn() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-cltvtn';
        SBGridProperties.id = 'gridCltvtn';
        SBGridProperties.jsonref = 'jsonCltvtn';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.explorerbar = 'move';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.allowcopy = true;
        SBGridProperties.mergecells = 'byrestriccol';
        SBGridProperties.contextmenu = true;    // 우클릭 메뉴 호출 여부
        SBGridProperties.contextmenulist = objMenuListCltvtn;    // 우클릭 메뉴 리스트
        SBGridProperties.columns = [
            { caption: ["육묘번호", "육묘번호"], ref: 'sdlngNo', hidden: true },
            { caption: ["품종", "품종"], ref: 'vrtyCd', type: 'combo', width: '90px', style: 'text-align: center;', typeinfo: {ref: 'jsonGridVrty', displayui: false, itemcount: 10, label: 'label', value: 'value'}, disabled: true },
            { caption: ["파종일자", "파종일자"], ref: 'sdngYmd', type: 'output', width: '100px', style: 'text-align: center;', typeinfo: {dateformat: 'yyyy-mm-dd'}, format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'YYYYMMDD'} },
            { caption: ["예상정식일", "예상정식일"], ref: 'expctPlntngYmd', type: 'output', width: '100px', style: 'text-align: center;', typeinfo: {dateformat: 'yyyy-mm-dd'}, format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'YYYYMMDD'} },
            { caption: ["육묘장", "판"], ref: 'sdlngTray', type: 'output', width: '60px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}, maxlength: 1}, format: {type: 'number', rule: '#,###'} },
            { caption: ["육묘장", "구"], ref: 'sdlngCell', type: 'output', width: '60px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}, maxlength: 1}, format: {type: 'number', rule: '#,###'} },
            { caption: ["육묘장", "주수"], ref: 'sdlngPlanting', type: 'output', width: '60px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}, maxlength: 1}, format: {type: 'number', rule: '#,###'} },
            { caption: ["육묘장", "구역"], ref: 'sdlngZone', type: 'combo', width: '80px', style: 'text-align: center;', sortable: false, typeinfo: {ref: 'jsonGridSdlngZone', label: 'label', value: 'value', itemcount: 10}, disabled: true },
            { caption: ["육묘장", "열"], ref: 'sdlngRow', type: 'combo', width: '80px', style: 'text-align: center;', sortable: false, typeinfo: {ref: 'jsonGridSdlngRow', label: 'label', value: 'value', itemcount: 10, filtering: {usemode: true, uppercol: 'sdlngZone', attrname: 'fcltZoneSeCd'}}, disabled: true },
            { caption: ["육묘장", "비고"], ref: 'sdlngRmrk', type: 'output', width: '200px', style: 'text-align: left;' },
            {
                caption: ["처리", "처리"], ref: 'delYn', type: 'button', width: '50px', style: 'text-align: center', merge: false, sortable: false,
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if(gfn_isEmpty(strValue)) {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_cltvtnAddRow(" + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_cltvtnDelRow(" + nRow + ")'>삭제</button>";
                    }
                }
            },
            { caption: ["정식일자", "정식일자"], ref: 'plntngYmd', type: 'datepicker', width: '100px', style: 'text-align: center; background: #FFF8DC;', typeinfo: {dateformat: 'yyyy-mm-dd'}, format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'YYYYMMDD'}, disabled: false, merge: false, sortable: false },
            { caption: ["재배장", "구역"], ref: 'cltvtnZone', type: 'combo', width: '80px', style: 'text-align: center; background: #FFF8DC;', sortable: false, typeinfo: {ref: 'jsonGridCltvtnZone', label: 'label', value: 'value', itemcount: 10} },
            { caption: ["재배장", "열"], ref: 'cltvtnRow', type: 'combo', width: '80px', style: 'text-align: center; background: #FFF8DC;', sortable: false, typeinfo: {ref: 'jsonGridCltvtnRow', label: 'label', value: 'value', itemcount: 10, filtering: {usemode: true, uppercol: 'cltvtnZone', attrname: 'fcltZoneSeCd'}} },
            { caption: ["재배장", "주수"], ref: 'cltvtnPlanting', type: 'input', width: '60px', style: 'text-align: center; background: #FFF8DC;', typeinfo: {mask: {alias: 'numeric'}, maxlength: 10}, format: {type: 'number', rule: '#,###'}, merge: false },
            { caption: ["재배장", "베드기준"], ref: 'cltvtnBedType', type: 'input', width: '80px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}, maxlength: 10}, format: {type: 'number', rule: '#,###'}, merge: false },
            { caption: ["재배장", "정식률(%)"], ref: 'cltvtnRate', type: 'output', width: '80px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###.#'}, merge: false },
            { caption: ["수확일자", "수확일자"], ref: 'hrvstYmd', type: 'output', width: '100px', style: 'text-align: center;', typeinfo: {dateformat: 'yyyy-mm-dd'}, format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'YYYYMMDD'}, merge: false },
            { caption: ["재배장 비고", "재배장 비고"], ref: 'cltvtnRmrk', type: 'input', width: '200px', style: 'text-align: left; background: #FFF8DC;', typeinfo: {maxlength: 1000}, merge: false },
            { caption: ["정식번호", "정식번호"], ref: 'plntngNo', hidden: true }
        ];

        gridCltvtn = _SBGrid.create(SBGridProperties);
        gridCltvtn.bind('valuechanged', 'fn_gridCltvtnValueChanged');
        gridCltvtn.rebuild();
    }

    /**
     * @name fn_createWgh
     * @description 계량 그리드 생성
     */
    function fn_createWgh() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-wgh';
        SBGridProperties.id = 'gridWgh';
        SBGridProperties.jsonref = 'jsonWgh';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.mergecells = 'byrestriccol';
        SBGridProperties.contextmenu = true;    // 우클릭 메뉴 호출 여부
        SBGridProperties.contextmenulist = objMenuListWgh;    // 우클릭 메뉴 리스트
        SBGridProperties.columns = [
            { caption: ["재배정식번호", "재배정식번호"], ref: 'cltvtnPlntngNo', hidden: true },
            { caption: ["품종", "품종"], ref: 'vrtyCd', type: 'combo', width: '10%', style: 'text-align: center;', typeinfo: {ref: 'jsonGridVrty', displayui: false, itemcount: 10, label: 'label', value: 'value'}, disabled: true },
            { caption: ["구역", "구역"], ref: 'cltvtnZone', type: 'combo', width: '5%', style: 'text-align: center;', sortable: false, typeinfo: {ref: 'jsonGridCltvtnZone', label: 'label', value: 'value', itemcount: 10}, disabled: true },
            { caption: ["열", "열"], ref: 'cltvtnRow', type: 'combo', width: '5%', style: 'text-align: center;', sortable: false, typeinfo: {ref: 'jsonGridCltvtnRow', label: 'label', value: 'value', itemcount: 10, filtering: {usemode: true, uppercol: 'cltvtnZone', attrname: 'fcltZoneSeCd'}}, disabled: true },
            { caption: ["주수", "주수"], ref: 'cltvtnPlanting', type: 'output', width: '5%', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}, maxlength: 1}, format: {type: 'number', rule: '#,###'} },
            {
                caption: ["처리", "처리"], ref: 'delYn', type: 'button', width: '4%', style: 'text-align: center', merge: false, sortable: false,
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if(gfn_isEmpty(strValue)) {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_wghAddRow(" + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_wghDelRow(" + nRow + ")'>삭제</button>";
                    }
                }
            },
            { caption: ["계량일자", "계량일자"], ref: 'wghYmd', type: 'datepicker', width: '7%', style: 'text-align: center; background: #FFF8DC;', typeinfo: {dateformat: 'yyyy-mm-dd'}, format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'YYYYMMDD'}, disabled: false, merge: false, sortable: false },
            { caption: ["계량", "계량 값"], ref: 'wghVl', type: 'input', width: '5%', style: 'text-align: center; background: #FFF8DC;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###.0'} },
            { caption: ["계량", "실 무게"], ref: 'wghWght', type: 'output', width: '5%', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###.0'} },
            { caption: ["포장", "출하포장단위"], ref: 'spmtPckgUnitCd', type: 'combo', width: '10%', style: 'text-align: center; background: #FFF8DC;', typeinfo: {ref: 'jsonSpmtPckgUnitCd', displayui: false, itemcount: 10, label: 'label', value: 'value'} },
            { caption: ["포장", "개수"], ref: 'pckgQntt', type: 'input', width: '5%', style: 'text-align: center; background: #FFF8DC;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["포장", "중량"], ref: 'pckgWght', type: 'input', width: '5%', style: 'text-align: center; background: #FFF8DC;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###.0'} },
            { caption: ["포장", "합계"], ref: 'pckgSum', type: 'output', width: '5%', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###.0'} },
            { caption: ["포기당 (g)", "포장"], ref: 'pogiPckg', type: 'output', width: '5%', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###.0'} },
            { caption: ["포기당 (g)", "실측"], ref: 'pogiWght', type: 'output', width: '5%', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###.0'} },
            { caption: ["포기당 (g)", "LOSS"], ref: 'pogiLoss', type: 'output', width: '5%', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###.0'} },
            { caption: ["파종일자", "파종일자"], ref: 'sdngYmd', type: 'output', width: '7%', style: 'text-align: center;', typeinfo: {dateformat: 'yyyy-mm-dd'}, format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'YYYYMMDD'} },
            { caption: ["정식일자", "정식일자"], ref: 'plntngYmd', type: 'output', width: '7%', style: 'text-align: center;', typeinfo: {dateformat: 'yyyy-mm-dd'}, format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'YYYYMMDD'} },
            { caption: ["계량정식번호", "계량정식번호"], ref: 'wghPlntngNo', hidden: true },
            { caption: ["계량순번", "계량순번"], ref: 'wghSeq', hidden: true }
        ];

        gridWgh = _SBGrid.create(SBGridProperties);
        gridWgh.bind('valuechanged', 'fn_gridWghValueChanged');
        gridWgh.rebuild();
    }

    /**
     * @name fn_createSpmt
     * @description 상품 재고 그리드 생성
     */
    function fn_createGdsInvntr() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gdsInvntr';
        SBGridProperties.id = 'gridGdsInvntr';
        SBGridProperties.jsonref = 'jsonGdsInvntr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.explorerbar = 'move';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.allowcopy = true;
        SBGridProperties.columns = [
            { caption: ["품종", "품종"], ref: 'vrtyCd', type: 'combo', width: '120px', style: 'text-align: center;', typeinfo: {ref: 'jsonGridVrty', displayui: false, itemcount: 10, label: 'label', value: 'value'}, disabled: true },
            { caption: ["재고 (박스)", "재고 (박스)"], ref: 'invntrBx', type: 'output', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["양 (Kg)", "양 (Kg)"], ref: 'amount', type: 'output', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} }
        ];

        gridGdsInvntr = _SBGrid.create(SBGridProperties);
        gridGdsInvntr.rebuild();
    }

    /**
     * @name fn_createSpmt
     * @description 출고 그리드 생성
     */
    function fn_createSpmt() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-spmt';
        SBGridProperties.id = 'gridSpmt';
        SBGridProperties.jsonref = 'jsonSpmt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.explorerbar = 'move';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.allowcopy = true;
        SBGridProperties.contextmenu = true;    // 우클릭 메뉴 호출 여부
        SBGridProperties.contextmenulist = objMenuListSpmt;    // 우클릭 메뉴 리스트
        SBGridProperties.columns = [
            { caption: ["포장번호", "포장번호"], ref: 'pckgno', hidden: true },
            { caption: ["출고번호", "출고번호"], ref: 'spmtno', hidden: true },
            { caption: ["", ""], ref: 'checkedYn', type: 'checkbox',  width: '50px', style: 'text-align: center; background:#FFF8DC;', userattr: {colNm: "checkedYn"}, typeinfo: {checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 0}} },
            { caption: ["출고일자", "출고일자"], ref: 'spmtYmd', type: 'datepicker', width: '100px', style: 'text-align: center; background:#FFF8DC;', typeinfo: {dateformat: 'yyyy-mm-dd'}, format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'YYYYMMDD'}, disabled: false },
            { caption: ["품종", "품종"], ref: 'vrtyCd', type: 'combo', width: '120px', style: 'text-align: center; background:#FFF8DC;', typeinfo: {ref: 'jsonGridVrty', displayui: false, itemcount: 10, label: 'label', value: 'value'} },
            { caption: ["거래처", "거래처"], ref: 'cnpt', type: 'combo', width: '120px', style: 'text-align: center; background:#FFF8DC;', typeinfo: {ref: 'jsonGridCnpt', displayui: false, itemcount: 10, label: 'label', value: 'value'} },
            { caption: ["상품명", "상품명"], ref: 'spmtPckgUnitCd', type: 'combo', width: '120px', style: 'text-align: center; background: #FFF8DC;', typeinfo: {ref: 'jsonSpmtPckgUnitCd', displayui: false, itemcount: 10, label: 'label', value: 'value'} },
            { caption: ["박스 (개)", "박스 (개)"], ref: 'bxQntt', type: 'input', width: '100px', style: 'text-align: center; background:#FFF8DC;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["중량 (Kg)", "중량 (Kg)"], ref: 'wght', type: 'input', width: '100px', style: 'text-align: center; background:#FFF8DC;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ["비고", "비고"], ref: 'rmrk', type: 'input', width: '200px', style: 'text-align: left; background:#FFF8DC;' }
        ];

        gridSpmt = _SBGrid.create(SBGridProperties);
        gridSpmt.bind('valuechanged', 'fn_gridSpmtValueChanged');
        gridSpmt.rebuild();
    }

    /**
     * @name fn_selectTab
     * @description 탭 변경 시 event
     */
    function fn_selectTab() {
        let tab = SBUxMethod.get("idxTab_norm");

        if(tab === 'sdlngTab') {
            SBUxMethod.show('btnDelete');

            cmnYmdTh.textContent = '예상정식일자';

            sdlngTh.textContent = '육묘구역열';
            SBUxMethod.show('srch-slt-sdlngZone');
            SBUxMethod.show('srch-slt-sdlngRow');

            cltvtnTh.textContent = '';
            SBUxMethod.hide('srch-slt-cltvtnZone');
            SBUxMethod.hide('srch-slt-cltvtnRow');

            cnptTh.textContent = '';
            SBUxMethod.hide('srch-inp-cnptNm');
            SBUxMethod.hide('btn-srch-cnpt');

            SBUxMethod.show('btnNewReg');
        } else if(tab === 'cltvtnTab') {
            SBUxMethod.hide('btnDelete');

            cmnYmdTh.textContent = '정식일자';

            sdlngTh.textContent = '육묘구역열';
            SBUxMethod.show('srch-slt-sdlngZone');
            SBUxMethod.show('srch-slt-sdlngRow');

            cltvtnTh.textContent = '재배구역열';
            SBUxMethod.show('srch-slt-cltvtnZone');
            SBUxMethod.show('srch-slt-cltvtnRow');

            cnptTh.textContent = '';
            SBUxMethod.hide('srch-inp-cnptNm');
            SBUxMethod.hide('btn-srch-cnpt');

            SBUxMethod.hide('btnNewReg');
        } else if(tab === 'wghTab') {
            SBUxMethod.hide('btnDelete');

            cmnYmdTh.textContent = '계량일자';

            sdlngTh.textContent = '';
            SBUxMethod.hide('srch-slt-sdlngZone');
            SBUxMethod.hide('srch-slt-sdlngRow');

            cltvtnTh.textContent = '재배구역열';
            SBUxMethod.show('srch-slt-cltvtnZone');
            SBUxMethod.show('srch-slt-cltvtnRow');

            cnptTh.textContent = '';
            SBUxMethod.hide('srch-inp-cnptNm');
            SBUxMethod.hide('btn-srch-cnpt');

            SBUxMethod.hide('btnNewReg');
        } else if(tab === 'spmtTab') {
            SBUxMethod.show('btnDelete');
            cmnYmdTh.textContent = '출고일자';

            sdlngTh.textContent = '';
            SBUxMethod.hide('srch-slt-sdlngZone');
            SBUxMethod.hide('srch-slt-sdlngRow');

            cltvtnTh.textContent = '';
            SBUxMethod.hide('srch-slt-cltvtnZone');
            SBUxMethod.hide('srch-slt-cltvtnRow');

            cnptTh.textContent = '거래처';
            SBUxMethod.show('srch-inp-cnptNm');
            SBUxMethod.show('btn-srch-cnpt');

            SBUxMethod.show('btnNewReg');
        }
    }

    /**
     * @name fn_dtpChange
     * @description 일자 변경 시 event
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
     * @name fn_onChangeSrchSdlngZone
     * @description 육묘구역 변경 시 event
     */
    const fn_onChangeSrchSdlngZone = async function(obj) {
        let sdlngZone = obj.value;

        let result = await Promise.all([
            gfn_setSdlngFcltRowSBSelect('srch-slt-sdlngRow', jsonComSdlngRow, gv_selectedApcCd, '01', sdlngZone)
        ]);
    }

    /**
     * @name fn_onChangeSrchSdlngRow
     * @description 육묘열 변경 시 event
     */
    const fn_onChangeSrchSdlngRow = async function(obj) {
        let sdlngRow = obj.value;
        const sdlngZone = sdlngRow.substring(2, 4);

        const prvSdlngZone = SBUxMethod.get("srch-slt-sdlngZone");
        if(!gfn_isEmpty(sdlngRow)) {
            if(sdlngZone != prvSdlngZone) {
                SBUxMethod.set("srch-slt-sdlngZone", sdlngZone);
                await fn_onChangeSrchSdlngZone({value: sdlngZone});
                SBUxMethod.set("srch-slt-sdlngRow", sdlngRow);
            } else{
                SBUxMethod.set("srch-slt-sdlngZone", sdlngZone);
                await fn_onChangeSrchSdlngZone({value: sdlngZone});
                SBUxMethod.set("srch-slt-sdlngRow", sdlngRow);
            }
        }
    }

    /**
     * @name fn_onChangeSrchCltvtnZone
     * @description 재배구역 변경 시 event
     */
    const fn_onChangeSrchCltvtnZone = async function(obj) {
        let cltvtnZone = obj.value;

        let result = await Promise.all([
            gfn_setSdlngFcltRowSBSelect('srch-slt-cltvtnRow', jsonComCltvtnRow, gv_selectedApcCd, '02', cltvtnZone)
        ]);
    }

    /**
     * @name fn_onChangeSrchCltvtnRow
     * @description 재배열 변경 시 event
     */
    const fn_onChangeSrchCltvtnRow = async function(obj) {
        let cltvtnRow = obj.value;
        const cltvtnZone = cltvtnRow.substring(2, 4);

        const prvCltvtnZone = SBUxMethod.get("srch-slt-cltvtnZone");
        if(!gfn_isEmpty(cltvtnRow)) {
            if(cltvtnZone != prvCltvtnZone) {
                SBUxMethod.set("srch-slt-cltvtnZone", cltvtnZone);
                await fn_onChangeSrchCltvtnZone({value: cltvtnZone});
                SBUxMethod.set("srch-slt-cltvtnRow", cltvtnRow);
            } else {
                SBUxMethod.set("srch-slt-cltvtnZone", cltvtnZone);
                await fn_onChangeSrchCltvtnZone({value: cltvtnZone});
                SBUxMethod.set("srch-slt-cltvtnRow", cltvtnRow);
            }
        }
    }

    /**
     * @name fn_choiceCnpt
     * @description 거래처 찾기 버튼 클릭 시 event
     */
    const fn_choiceCnpt = function() {
        popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnptNm"), fn_setCnpt);
    }

    /**
     * @name fn_sdlngCrtrPop
     * @description 육묘기준관리 찾기 버튼 클릭 시 event
     */
    const fn_sdlngCrtrPop = function() {
        sdlngCrtrPop.callbackChoiceFnc = fn_sdlngCrtrPopCallBack;
        sdlngCrtrPop.init(gv_selectedApcCd, gv_selectedApcNm, fn_sdlngCrtrPopCallBack);
    }

    /**
     * @name fn_search
     * @description 조회 버튼 클릭 시 event
     */
    const fn_search = async function() {
        let sdngYmdFrom = SBUxMethod.get("srch-dtp-sdngYmdFrom");
        let sdngYmdTo = SBUxMethod.get("srch-dtp-sdngYmdTo");
        let cmnYmdFrom = SBUxMethod.get("srch-dtp-cmnYmdFrom");
        let cmnYmdTo = SBUxMethod.get("srch-dtp-cmnYmdTo");
        let sdlngCd = SBUxMethod.get('srch-slt-vrtyCd');
        let sdlngZone = SBUxMethod.get('srch-slt-sdlngZone');
        let sdlngRow = SBUxMethod.get('srch-slt-sdlngRow');
        let cltvtnZone = SBUxMethod.get('srch-slt-cltvtnZone');
        let cltvtnRow = SBUxMethod.get('srch-slt-cltvtnRow');
        let cnptCd = SBUxMethod.get('srch-inp-cnptCd');

        newReg = 0;

        if(gfn_isEmpty(sdngYmdFrom) || gfn_isEmpty(sdngYmdTo)) {
            gfn_comAlert("W0001", "파종일자");    // W0002    {0}을/를 선택하세요.
            return;
        }

        fn_searchSdlngList(sdngYmdFrom, sdngYmdTo, cmnYmdFrom, cmnYmdTo, sdlngCd, sdlngZone, sdlngRow);
        fn_searchCltvtnList(sdngYmdFrom, sdngYmdTo, cmnYmdFrom, cmnYmdTo, sdlngCd, sdlngZone, sdlngRow, cltvtnZone, cltvtnRow);
        fn_searchWghList(sdngYmdFrom, sdngYmdTo, cmnYmdFrom, cmnYmdTo, sdlngCd, cltvtnZone, cltvtnRow);
        fn_searchGdsInvntrList();
        fn_searchSpmtList(cmnYmdFrom, cmnYmdTo, sdlngCd, cnptCd);
    }

    /**
     * @name fn_save
     * @description 저장 버튼 클릭 시 event
     */
    const fn_save = async function() {
        newReg = 0;

        let tab = SBUxMethod.get("idxTab_norm");
        if(tab === 'sdlngTab') {
            fn_saveSdlngList();
        } else if(tab === 'cltvtnTab') {
            fn_saveCltvtnList();
        } else if(tab === 'wghTab') {
            fn_saveWghList();
        } else if(tab === 'spmtTab') {
            fn_saveSpmtList();
        }
    }

    /**
     * @name fn_delete
     * @description 삭제 버튼 클릭 시 event
     */
    const fn_delete = async function() {
        newReg = 0;
        let tab = SBUxMethod.get("idxTab_norm");
        if(tab === 'sdlngTab') {
            fn_deleteSdlngList();
        } else if(tab === 'spmtTab') {
            fn_deleteSpmtList();
        }
    }

    /**
     * @name fn_newReg
     * @description 신규등록 버튼 클릭 시 event
     */
    const fn_newReg = async function() {
        let tab = SBUxMethod.get("idxTab_norm");
        if(tab === 'sdlngTab') {
            jsonSdlng.push({
                checkedYn: 'Y',
                sdlngNo: newReg++,
                sdngYmd: gfn_dateToYmd(new Date())
            });

            gridSdlng.refresh();
        } else if(tab === 'spmtTab') {
            jsonSpmt.push({
                checkedYn: 'Y',
                spmtYmd: gfn_dateToYmd(new Date())
            });

            gridSpmt.refresh();
        }
    }

    /**
     * @name fn_cltvtnAddRow
     * @description 재배장 추가 버튼 클릭 시 event
     */
    const fn_cltvtnAddRow = async function(nRow, nCol) {
        const originalRowData = jsonCltvtn[nRow - 2];
        const newRowData = { ...originalRowData };
        newRowData.plntngNo = null;
        newRowData.delYn = null;
        newRowData.plntngYmd = null;
        newRowData.cltvtnBedType = null;
        newRowData.cltvtnRate = null;
        newRowData.cltvtnPlanting = null;
        newRowData.cltvtnZone = null;
        newRowData.cltvtnRow = null;
        newRowData.cltvtnRmrk = null;

        jsonCltvtn.splice(nRow - 2, 0, newRowData);
        gridCltvtn.setCellData(nRow, nCol, "N", true);
        gridCltvtn.rebuild();
        gridCltvtn.setCellDisabled(nRow, 8, nRow, gridCltvtn.getCols() - 1, false);
        gridCltvtn.setCellDisabled(nRow + 1, 8, nRow + 1, gridCltvtn.getCols() - 1, true);
    }

    /**
     * @name fn_cltvtnDelRow
     * @description 재배장 삭제 버튼 클릭 시 event
     */
    const fn_cltvtnDelRow = async function(nRow) {
        const rowData = gridCltvtn.getRowData(nRow);

        const param = {
            apcCd: gv_selectedApcCd,
            plntngNo: rowData.plntngNo
        }

        const postJsonPromiseWgh = gfn_postJSON("/am/wrhs/selectWgh.do", param);
        const dataWgh = await postJsonPromiseWgh;

        if(dataWgh.resultList.length > 0) {
            gfn_comAlert("E0000", "계량 정보가 있는 재배장입니다.");    // E0000    {0}
            return;
        }

        if(!gfn_isEmpty(rowData.plntngNo)) {
            if(!gfn_comConfirm("Q0001", "삭제")) {    // Q0001    {0} 하시겠습니까?
                return;
            }

            const postJsonPromise = gfn_postJSON("/am/wrhs/deleteCltvtnList.do", {
                apcCd: gv_selectedApcCd,
                plntngNo: rowData.plntngNo,
                sdlngNo: rowData.sdlngNo
            });
            const data = await postJsonPromise;

            try {
                if(_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");    // I0001    처리 되었습니다.
                    fn_search();
                } else {
                    gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
                }
            } catch(e) {
                if(!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
            }
        } else {
            gridCltvtn.deleteRow(nRow);
        }
    }

    /**
     * @name fn_wghAddRow
     * @description 계량 추가 버튼 클릭 시 event
     */
    const fn_wghAddRow = async function(nRow, nCol) {
        const originalRowData = jsonWgh[nRow - 2];
        const newRowData = { ...originalRowData };
        newRowData.wghPlntngNo = null;
        newRowData.delYn = null;
        newRowData.wghYmd = null;
        newRowData.wghVl = null;
        newRowData.wghWght = null;
        newRowData.pckgQntt = null;
        newRowData.pckgWght = null;
        newRowData.pckgSum = null;
        newRowData.pogiPckg = null;
        newRowData.pogiWght = null;
        newRowData.pogiLoss = null;

        jsonWgh.splice(nRow - 2, 0, newRowData);
        gridWgh.setCellData(nRow, nCol, "N", true);
        gridWgh.rebuild();
        gridWgh.setCellDisabled(nRow, 4, nRow, gridWgh.getCols() - 1, false);
        gridWgh.setCellDisabled(nRow + 1, 4, nRow + 1, gridWgh.getCols() - 1, true);
    }

    /**
     * @name fn_wghDelRow
     * @description 계량 삭제 버튼 클릭 시 event
     */
    const fn_wghDelRow = async function(nRow) {
        const rowData = gridWgh.getRowData(nRow);

        if(!gfn_isEmpty(rowData.wghPlntngNo)) {
            if(!gfn_comConfirm("Q0001", "삭제")) {    // Q0001    {0} 하시겠습니까?
                return;
            }

            const postJsonPromise = gfn_postJSON("/am/wrhs/deleteWghList.do", {
                apcCd: gv_selectedApcCd,
                plntngNo: rowData.wghPlntngNo,
                wghSeq: Number(rowData.wghSeq)
            });
            const data = await postJsonPromise;

            try {
                if(_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");    // I0001    처리 되었습니다.
                    fn_search();
                } else {
                    gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
                }
            } catch(e) {
                if(!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
            }
        } else {
            gridWgh.deleteRow(nRow);
        }
    }

    /**
     * @name fn_searchSdlngList
     * @description 육모장 목록 조회
     */
    const fn_searchSdlngList = async function(sdngYmdFrom, sdngYmdTo, expctPlntngYmdFrom, expctPlntngYmdTo, sdlngCd, sdlngZone, sdlngRow) {
        const param = {
            apcCd: gv_selectedApcCd,
            sdngYmdFrom: sdngYmdFrom,
            sdngYmdTo: sdngYmdTo,
            plntngExpctYmdFrom: expctPlntngYmdFrom,
            plntngExpctYmdTo: expctPlntngYmdTo,
            sdlngCd: sdlngCd,
            sdlngZone: sdlngZone,
            fcltZoneId: sdlngRow
        }

        jsonSdlng.length = 0;

        try {
            const postJsonPromise = gfn_postJSON("/am/wrhs/selectSdlngList.do", param, null, false);
            const data = await postJsonPromise;

            data.resultList.forEach((item, index) => {
                const plantingDate = new Date(item.plntngExpctYmd.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));
                const seedingDate = new Date(item.sdngYmd.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));

                const sdlngCrtrYmd = (plantingDate.getTime() - seedingDate.getTime()) / (1000 * 60 * 60 * 24);

                const sdlngVO = {
                    sdlngNo: item.sdlngNo,
                    vrtyCd: item.sdlngCd,
                    sdngYmd: item.sdngYmd,
                    plntngYmd: item.plntngYmd,
                    hrvstYmd: item.hrvstYmd,
                    sdlngCrtrYmd: sdlngCrtrYmd,
                    expctPlntngYmd: item.plntngExpctYmd,
                    sdlngTray: item.bxQntt,
                    sdlngCell: item.unitQntt,
                    sdlngZone: item.fcltZoneId.slice(2, 4),
                    sdlngPlanting: item.plntngQntt,
                    sdlngRow: item.fcltZoneId,
                    sdlngRmrk: item.rmrk
                }

                jsonSdlng.push(sdlngVO);
            });

            gridSdlng.rebuild();
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }
    }

    /**
     * @name fn_saveSdlngList
     * @description 육모장 목록 저장
     */
    const fn_saveSdlngList = async function() {
        let checkBoxCol = gridSdlng.getColRef('checkedYn');
        let checkedRowData = gridSdlng.getCheckedRowData(checkBoxCol);

        if(checkedRowData.length == 0) {
            gfn_comAlert("W0001", "대상");    // W0001    {0}을/를 선택하세요.
            return;
        }

        let sdlngList = [];

        for(let i = 0; i < checkedRowData.length; i++) {
            let rowData = JSON.parse(JSON.stringify(checkedRowData[i].data));

            if(gfn_isEmpty(rowData.vrtyCd)) {
                gfn_comAlert("W0002", "품종");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.sdngYmd)) {
                gfn_comAlert("W0002", "파종일자");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.sdlngCrtrYmd)) {
                gfn_comAlert("W0002", "육묘기준일");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.sdlngTray)) {
                gfn_comAlert("W0002", "육묘장 판");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.sdlngCell)) {
                gfn_comAlert("W0002", "육묘장 구");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.sdlngZone)) {
                gfn_comAlert("W0002", "육묘장 구역");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.sdlngRow)) {
                gfn_comAlert("W0002", "육묘장 열");    // W0002    {0}을/를 입력하세요.
                return;
            }

            let param = {
                apcCd: gv_selectedApcCd,
                sdlngNo: rowData.sdlngNo,
                sdlngCd: rowData.vrtyCd,
                sdngYmd: rowData.sdngYmd,
                plntngExpctYmd: rowData.expctPlntngYmd,
                bxQntt: Number(rowData.sdlngTray),
                unitQntt: Number(rowData.sdlngCell),
                sdngQntt: Number(rowData.sdlngPlanting),
                invntrQntt: Number(jsonGridSdlngZone.find(zone => zone.fcltZoneSeCd === rowData.sdlngZone).crtrNv),
                plntngQntt: Number(rowData.sdlngPlanting),
                fcltZoneId: rowData.sdlngRow,
                rmrk: rowData.sdlngRmrk
            }

            if(!String(rowData.sdlngNo).includes("S")) {
                param.rowSts = "I";
            } else {
                param.rowSts = "U";
            }

            sdlngList.push(param);
        }

        if(!gfn_comConfirm("Q0001", "저장")) {    // Q0001    {0} 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/am/wrhs/multiSdlngList.do", sdlngList);
        const data = await postJsonPromise;

        try {
            if(_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");    // I0001    처리 되었습니다.
                fn_search();
            } else {
                gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
            }
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
        }
    }

    /**
     * @name fn_deleteSdlngList
     * @description 육모장 목록 삭제
     */
    const fn_deleteSdlngList = async function() {
        let checkBoxCol = gridSdlng.getColRef('checkedYn');
        let checkedRowData = gridSdlng.getCheckedRowData(checkBoxCol);
        let checkedRows = gridSdlng.getCheckedRows(checkBoxCol);

        if(checkedRowData.length == 0) {
            gfn_comAlert("W0001", "대상");    // W0001    {0}을/를 선택하세요.
            return;
        }

        const sdlngList = [];

        for(let i = 0; i < checkedRowData.length; i++) {
            let sdlngVO = JSON.parse(JSON.stringify(checkedRowData[i].data));

            if(!gfn_isEmpty(sdlngVO.sdlngNo) && sdlngVO.sdlngNo.length == 12) {
                sdlngList.push({
                    apcCd: gv_selectedApcCd,
                    sdlngNo: sdlngVO.sdlngNo,
                    sdngYmd: sdlngVO.sdngYmd
                });
            }
        }

        checkedRows.reverse();

        if(sdlngList.length > 0) {
            const param = {
                apcCd: sdlngList[0].apcCd,
                sdlngNo: sdlngList[0].sdlngNo
            }

            const postJsonPromiseCltvtn = gfn_postJSON("/am/wrhs/selectCltvtn.do", param);
            const dataCltvtn = await postJsonPromiseCltvtn;

            if(dataCltvtn.resultList.length > 0) {
                gfn_comAlert("E0000", "재배장 정보가 있는 육묘장입니다.");    // E0000    {0}
                return;
            }
            if(!gfn_comConfirm("Q0001", "삭제")) {    // Q0001    {0} 하시겠습니까?
                return;
            }

            const postJsonPromise = gfn_postJSON("/am/wrhs/deleteSdlngList.do", sdlngList);
            const data = await postJsonPromise;

            try {
                if(_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");    // I0001    처리 되었습니다.
                    fn_search();
                } else {
                    gfn_comAlert(data.resultCode, data.resultMessage);    // E0001    오류가 발생하였습니다.
                }
            } catch(e) {
                if(!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
            }
        } else {
            for(let j = 0; j < checkedRows.length; j++) {
                gridSdlng.deleteRow(checkedRows[j]);
            }

            gridSdlng.rebuild();
        }
    }

    /**
     * @name fn_gridSdlngValueChanged
     * @description 육묘장 데이터 입력 시 event
     */
    const fn_gridSdlngValueChanged = async function(event, col, ref) {
        let nRow = gridSdlng.getRow();
        let rowData = gridSdlng.getRowData(nRow);
        const colData = gridSdlng.getCellData(nRow, ref);
        let allData = gridSdlng.getGridDataAll();

        const sameSdlngNoRows = allData.filter(row => row.sdlngNo === rowData.sdlngNo);

        if(ref === 13) {
            for(const row of sameSdlngNoRows) {
                const rowIndex = gridSdlng.getGridDataAll().findIndex(d => d === row);
                gridSdlng.setCellData(rowIndex + 2, ref, colData);
            }
        } else {
            for(let i = 0; i < sameSdlngNoRows.length; i++) {
                gridSdlng.setCellData(nRow + i, ref, colData);

                if(ref == 2 && !gfn_isEmpty(rowData.vrtyCd)) {
                    const selectedVrty = jsonGridVrty.find(item => item.value === rowData.vrtyCd);
                    if(selectedVrty) {
                        gridSdlng.setCellData(nRow + i, 4, selectedVrty.sdlngDayCnt);
                        rowData = gridSdlng.getRowData(nRow);
                    }
                }

                if(!gfn_isEmpty(rowData.sdngYmd) && !gfn_isEmpty(rowData.sdlngCrtrYmd)) {
                    const year = rowData.sdngYmd.substring(0, 4);
                    const month = rowData.sdngYmd.substring(4, 6) - 1;
                    const day = parseInt(rowData.sdlngCrtrYmd, 10) + parseInt(rowData.sdngYmd.substring(6, 8));

                    const resultYear = new Date(year, month, day).getFullYear();
                    const resultMonth = (new Date(year, month, day).getMonth() + 1).toString().padStart(2, '0');
                    const resultDay = new Date(year, month, day).getDate().toString().padStart(2, '0');

                    gridSdlng.setCellData(nRow + i, 5, resultYear + resultMonth + resultDay);
                }

                if(!gfn_isEmpty(rowData.sdlngTray) && !gfn_isEmpty(rowData.sdlngCell)) {
                    gridSdlng.setCellData(nRow + i, 8, rowData.sdlngTray * rowData.sdlngCell);
                }
            }
        }
    }

    /**
     * @name fn_searchCltvtnList
     * @description 재배장 목록 조회
     */
    const fn_searchCltvtnList = async function(sdngYmdFrom, sdngYmdTo, plntngYmdFrom, plntngYmdTo, sdlngCd, sdlngZone, sdlngRow, cltvtnZone, cltvtnRow) {
        const param = {
            apcCd: gv_selectedApcCd,
            sdngYmdFrom: sdngYmdFrom,
            sdngYmdTo: sdngYmdTo,
            plntngYmdFrom: plntngYmdFrom,
            plntngYmdTo: plntngYmdTo,
            sdlngCd: sdlngCd,
            sdlngZone: sdlngZone,
            sdlngFcltZoneId: sdlngRow,
            cltvtnZone: cltvtnZone,
            cltvtnFcltZoneId: cltvtnRow
        }

        jsonCltvtn.length = 0;

        let rst = await Promise.all([
            gfn_setSdlngFcltZoneSBSelect('gridCltvtn', jsonGridCltvtnZone, gv_selectedApcCd, '02'),
            gfn_setSdlngFcltRowSBSelect('gridCltvtn', jsonGridCltvtnRow, gv_selectedApcCd, '02')
        ]);

        try {
            const postJsonPromise = gfn_postJSON("/am/wrhs/selectCltvtnList.do", param, null, false);
            const data = await postJsonPromise;

            data.resultList.forEach((item, index) => {
                let cltvtnBedType;
                let cltvtnPlanting;
                let cltvtnRate;
                if(gfn_isEmpty(item.cltvtnFcltZoneId) || gfn_isEmpty(item.cltvtnPlntngQntt)) {
                    cltvtnBedType = null;
                    cltvtnPlanting = null;
                    cltvtnRate = null;
                } else {
                    cltvtnBedType = jsonGridCltvtnZone.find(zone => zone.fcltZoneSeCd === item.cltvtnFcltZoneId.slice(2, 4)).crtrNv;
                    cltvtnPlanting = fn_zero(item.cltvtnPlntngQntt);
                    cltvtnRate = (cltvtnPlanting / cltvtnBedType * 100) == 'Infinity' ? 0 : cltvtnPlanting / cltvtnBedType * 100;
                }

                const cltvtnVO = {
                    sdlngNo: item.sdlngNo,
                    plntngNo: item.plntngNo,
                    vrtyCd: item.sdlngCd,
                    sdngYmd: item.sdngYmd,
                    expctPlntngYmd: item.plntngExpctYmd,
                    sdlngTray: item.bxQntt,
                    sdlngCell: item.unitQntt,
                    sdlngPlanting: item.sdlngPlntngQntt,
                    sdlngZone: item.sdlngFcltZoneId.slice(2, 4),
                    sdlngRow: item.sdlngFcltZoneId,
                    delYn: item.delYn,
                    plntngYmd: item.plntngYmd,
                    cltvtnBedType: cltvtnBedType,
                    cltvtnRate: cltvtnRate,
                    cltvtnPlanting: cltvtnPlanting,
                    cltvtnZone: gfn_isEmpty(item.cltvtnFcltZoneId) ? null : item.cltvtnFcltZoneId.slice(2, 4),
                    cltvtnRow: item.cltvtnFcltZoneId,
                    sdlngRmrk: item.sdlngRmrk,
                    cltvtnRmrk: item.cltvtnRmrk,
                    hrvstYmd: item.hrvstYmd
                }

                jsonCltvtn.push(cltvtnVO);

                const nextItem = data.resultList[index + 1];

                if(!gfn_isEmpty(item.plntngNo) && (gfn_isEmpty(nextItem) || item.sdlngNo !== nextItem.sdlngNo)) {
                    jsonCltvtn.push({
                        sdlngNo: item.sdlngNo,
                        plntngNo: null,
                        vrtyCd: item.sdlngCd,
                        sdngYmd: item.sdngYmd,
                        expctPlntngYmd: item.plntngExpctYmd,
                        sdlngTray: item.bxQntt,
                        sdlngCell: item.unitQntt,
                        sdlngPlanting: item.sdlngPlntngQntt,
                        sdlngZone: item.sdlngFcltZoneId.slice(2, 4),
                        sdlngRow: item.sdlngFcltZoneId,
                        delYn: null,
                        plntngYmd: null,
                        cltvtnBedType: null,
                        cltvtnRate: null,
                        cltvtnPlanting: null,
                        cltvtnZone: null,
                        cltvtnRow: null,
                        sdlngRmrk: item.sdlngRmrk,
                        cltvtnRmrk: null,
                        hrvstYmd: item.hrvstYmd
                    });
                }
            });

            jsonCltvtn = jsonCltvtn.filter(item => item.delYn === null || item.delYn === "N");

            gridCltvtn.rebuild();

            for(let i = 0; i < jsonCltvtn.length; i++) {
                if(gfn_isEmpty(jsonCltvtn[i].delYn)) {
                    gridCltvtn.setCellDisabled(i + 2, 10, i + 2, gridCltvtn.getCols() - 1, true);
                }
            }
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }
    }

    /**
     * @name fn_saveCltvtnList
     * @description 재배장 목록 저장
     */
    const fn_saveCltvtnList = async function() {
        if(jsonCltvtn.length == 0) {
            gfn_comAlert("W0005", "대상");    // W0005    {0}이/가 없습니다.
            return;
        }

        let allData = gridCltvtn.getGridDataAll();

        let cltvtnList = [];

        for(let i = 1; i <= allData.length; i++) {
            const rowData = gridCltvtn.getRowData(i + 1);
            const rowSts = gridCltvtn.getRowStatus(i + 1);

            if(rowData.delYn !== "N") {
                continue;
            }

            if(gfn_isEmpty(rowData.plntngYmd)) {
                gfn_comAlert("W0002", "정식일자");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.cltvtnBedType)) {
                gfn_comAlert("W0002", "재배장 베드기준");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.cltvtnPlanting)) {
                gfn_comAlert("W0002", "재배장 주수");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.cltvtnZone)) {
                gfn_comAlert("W0002", "재배장 구역");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.cltvtnRow)) {
                gfn_comAlert("W0002", "재배장 열");    // W0002    {0}을/를 입력하세요.
                return;
            }

            let param = {
                apcCd: gv_selectedApcCd,
                crtrNv: Number(rowData.cltvtnBedType),
                plntngNo: rowData.plntngNo,
                sdlngNo: rowData.sdlngNo,
                plntngYmd: rowData.plntngYmd,
                fcltZoneId: rowData.cltvtnRow,
                fcltType: rowData.cltvtnRow.slice(0, 2),
                fcltCrtrType: 'ZNSC',
                fcltCrtrCd: rowData.cltvtnRow.slice(2, 4),
                plntngQntt: Number(rowData.cltvtnPlanting),
                hrvstYmd: rowData.hrvstYmd,
                rmrk: rowData.cltvtnRmrk
            }

            if(gfn_isEmpty(rowData.plntngNo)) {
                param.rowSts = "I";
            } else {
                param.rowSts = "U";
            }

            cltvtnList.push(param);
        }

        if(!gfn_comConfirm("Q0001", "저장")) {    // Q0001    {0} 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/am/wrhs/multiCltvtnList.do", cltvtnList);
        const data = await postJsonPromise;

        try {
            if(_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");    // I0001    처리 되었습니다.
                fn_search();
            } else {
                gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
            }
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
        }
    }

    /**
     * @name fn_gridCltvtnValueChanged
     * @description 재배장 데이터 입력 시 event
     */
    const fn_gridCltvtnValueChanged = async function(event, col, ref) {
        let nRow = gridCltvtn.getRow();
        let rowData = gridCltvtn.getRowData(nRow);
        const colData = gridCltvtn.getCellData(nRow, ref);
        let allData = gridCltvtn.getGridDataAll();

        if(ref == 13 && !gfn_isEmpty(rowData.cltvtnRow)) {
            const selectedCltvtnZone = jsonGridCltvtnZone.find(zone => zone.fcltZoneSeCd === rowData.cltvtnRow.slice(2, 4));
            if(selectedCltvtnZone) {
                gridCltvtn.setCellData(nRow, 15, selectedCltvtnZone.crtrNv);
                rowData = gridCltvtn.getRowData(nRow);
            }
        }

        if(!gfn_isEmpty(rowData.cltvtnBedType) && !gfn_isEmpty(rowData.cltvtnPlanting)) {
            gridCltvtn.setCellData(nRow, 16, (rowData.cltvtnPlanting / rowData.cltvtnBedType * 100) == 'Infinity' ? 0 : rowData.cltvtnPlanting / rowData.cltvtnBedType * 100);
            rowData = gridCltvtn.getRowData(nRow);
        }
    }

    /**
     * @name fn_searchWghList
     * @description 계량 목록 조회
     */
    const fn_searchWghList = async function(sdngYmdFrom, sdngYmdTo, wghYmdFrom, wghYmdTo, sdlngCd, cltvtnZone, cltvtnRow) {
        const param = {
            apcCd: gv_selectedApcCd,
            sdngYmdFrom: sdngYmdFrom,
            sdngYmdTo: sdngYmdTo,
            wghYmdFrom: wghYmdFrom,
            wghYmdTo: wghYmdTo,
            sdlngCd: sdlngCd,
            cltvtnZone: cltvtnZone,
            cltvtnFcltZoneId: cltvtnRow
        }

        jsonWgh.length = 0;

        let rst = await Promise.all([
            gfn_setSpmtPckgUnitSBSelect('gridWgh', jsonSpmtPckgUnitCd, gv_selectedApcCd)
        ]);

        try {
            const postJsonPromise = gfn_postJSON("/am/wrhs/selectWghList.do", param, null, false);
            const data = await postJsonPromise;

            data.resultList.forEach((item, index) => {
                let pckgSum = item.pckgQntt * item.pckgWght;
                let pogiPckg = pckgSum / item.cltvtnPlntngQntt * 1000;
                let pogiWght = item.actlWght / item.cltvtnPlntngQntt * 1000;
                let pogiLoss = pogiPckg - pogiWght;

                const wghVO = {
                    cltvtnPlntngNo: item.cltvtnPlntngNo,
                    wghPlntngNo: item.wghPlntngNo,
                    wghSeq: item.wghSeq,
                    vrtyCd: item.sdlngCd,
                    cltvtnZone: item.cltvtnFcltZoneId.slice(2, 4),
                    cltvtnRow: item.cltvtnFcltZoneId,
                    cltvtnPlanting: item.cltvtnPlntngQntt,
                    delYn: item.delYn,
                    wghYmd: item.wghYmd,
                    wghVl: fn_zero(item.wghWght),
                    wghWght: fn_zero(item.actlWght),
                    spmtPckgUnitCd: item.spmtPckgUnitCd,
                    pckgQntt: fn_zero(item.pckgQntt),
                    pckgWght: fn_zero(item.pckgWght),
                    pckgSum: fn_zero(pckgSum),
                    pogiPckg: fn_zero(pogiPckg),
                    pogiWght: fn_zero(pogiWght),
                    pogiLoss: fn_zero(pogiLoss),
                    sdngYmd: item.sdngYmd,
                    plntngYmd: item.plntngYmd
                }

                jsonWgh.push(wghVO);

                const nextItem = data.resultList[index + 1];

                if(!gfn_isEmpty(item.wghPlntngNo) && (gfn_isEmpty(nextItem) || item.cltvtnPlntngNo !== nextItem.cltvtnPlntngNo)) {
                    jsonWgh.push({
                        cltvtnPlntngNo: item.cltvtnPlntngNo,
                        wghPlntngNo: null,
                        wghSeq: null,
                        vrtyCd: item.sdlngCd,
                        cltvtnZone: item.cltvtnFcltZoneId.slice(2, 4),
                        cltvtnRow: item.cltvtnFcltZoneId,
                        cltvtnPlanting: item.cltvtnPlntngQntt,
                        delYn: null,
                        wghYmd: null,
                        wghVl: null,
                        wghWght: null,
                        spmtPckgUnitCd: null,
                        pckgQntt: null,
                        pckgWght: null,
                        pckgSum: null,
                        pogiPckg: null,
                        pogiWght: null,
                        pogiLoss: null,
                        sdngYmd: item.sdngYmd,
                        plntngYmd: item.plntngYmd
                    });
                }
            });

            jsonWgh = jsonWgh.filter(item => item.delYn === null || item.delYn === "N");

            gridWgh.rebuild();

            for(let i = 0; i < jsonWgh.length; i++) {
                if(gfn_isEmpty(jsonWgh[i].delYn)) {
                    gridWgh.setCellDisabled(i + 2, 6, i + 2, gridWgh.getCols() - 1, true);
                }
            }
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }
    }

    /**
     * @name fn_saveWghList
     * @description 계량 목록 저장
     */
    const fn_saveWghList = async function() {
        if(jsonWgh.length == 0) {
            gfn_comAlert("W0005", "대상");    // W0005    {0}이/가 없습니다.
            return;
        }

        let allData = gridWgh.getGridDataAll();

        let wghList = [];

        for(let i = 1; i <= allData.length; i++) {
            const rowData = gridWgh.getRowData(i + 1);
            const rowSts = gridWgh.getRowStatus(i + 1);

            if(rowData.delYn !== "N") {
                continue;
            }

            if(gfn_isEmpty(rowData.wghYmd)) {
                gfn_comAlert("W0002", "계량일자");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.wghVl)) {
                gfn_comAlert("W0002", "계량 값");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.spmtPckgUnitCd)) {
                gfn_comAlert("W0002", "출하포장단위");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.pckgQntt)) {
                gfn_comAlert("W0002", "포장 개수");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.pckgWght)) {
                gfn_comAlert("W0002", "포장 중량");    // W0002    {0}을/를 입력하세요.
                return;
            }

            const selectedVrty = jsonGridVrty.find(item => item.value === rowData.vrtyCd);

            let param = {
                apcCd: gv_selectedApcCd,
                plntngNo: rowData.cltvtnPlntngNo,
                wghSeq: Number(rowData.wghSeq),
                wghYmd: rowData.wghYmd,
                wghWght: Number(rowData.wghVl),
                actlWght: Number(rowData.wghWght),
                spmtPckgUnitCd: rowData.spmtPckgUnitCd,
                pckgQntt: Number(rowData.pckgQntt),
                pckgWght: Number(rowData.pckgWght),
                itemCd: selectedVrty.itemCd,
                vrtyCd: selectedVrty.vrtyCd
            }

            if(gfn_isEmpty(rowData.wghPlntngNo)) {
                param.rowSts = "I";
            } else {
                param.rowSts = "U";
            }

            wghList.push(param);
        }

        if(!gfn_comConfirm("Q0001", "저장")) {    // Q0001    {0} 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/am/wrhs/multiWghList.do", wghList);
        const data = await postJsonPromise;

        try {
            if(_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");    // I0001    처리 되었습니다.
                fn_search();
            } else {
                gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
            }
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
        }
    }

    /**
     * @name fn_gridWghValueChanged
     * @description 계량 데이터 입력 시 event
     */
    const fn_gridWghValueChanged = async function(event, col, ref) {
        let nRow = gridWgh.getRow();
        let rowData = gridWgh.getRowData(nRow);
        const colData = gridWgh.getCellData(nRow, ref);
        let allData = gridWgh.getGridDataAll();

        if(ref == 9 && !gfn_isEmpty(rowData.spmtPckgUnitCd)) {
            const selectedSpmtPckgUnit = jsonSpmtPckgUnitCd.find(item => item.value === rowData.spmtPckgUnitCd);
            if(selectedSpmtPckgUnit) {
                gridWgh.setCellData(nRow, 11, selectedSpmtPckgUnit.spcfctWght);
                rowData = gridWgh.getRowData(nRow);
            }
        }

        if(!gfn_isEmpty(rowData.pckgQntt) && !gfn_isEmpty(rowData.pckgWght)) {
            gridWgh.setCellData(nRow, 12, rowData.pckgQntt * rowData.pckgWght);
            rowData = gridWgh.getRowData(nRow);
            gridWgh.setCellData(nRow, 13, rowData.pckgSum / rowData.cltvtnPlanting * 1000);
            rowData = gridWgh.getRowData(nRow);
        }

        if(!gfn_isEmpty(rowData.wghVl)) {
            gridWgh.setCellData(nRow, 8, rowData.wghVl);
            rowData = gridWgh.getRowData(nRow);

            if(!gfn_isEmpty(rowData.wghWght)) {
                gridWgh.setCellData(nRow, 14, rowData.wghWght / rowData.cltvtnPlanting * 1000);
                rowData = gridWgh.getRowData(nRow);
                gridWgh.setCellData(nRow, 15, rowData.pogiPckg - rowData.pogiWght);
            }
        }
    }

    /**
     * @name fn_searchGdsInvntrList
     * @description 재고 목록 조회
     */
    const fn_searchGdsInvntrList = async function() {
        jsonGdsInvntr.length = 0;

        let rst = await Promise.all([
            gfn_setSdlngCrtrSBSelect('gridSdlng', jsonGridVrty, gv_selectedApcCd)
        ]);

        jsonGridVrty.forEach(function(item) {
            if(item.totalPckgQntt <= 0) return;

            const gdsInvntrVO = {
                vrtyCd: item.sdlngCd,
                invntrBx: item.totalPckgQntt,
                amount: item.totalPckgWght
            }

            jsonGdsInvntr.push(gdsInvntrVO);
        });

        gridGdsInvntr.rebuild();
    }

    /**
     * @name fn_searchSpmtList
     * @description 출고 목록 조회
     */
    const fn_searchSpmtList = async function(spmtYmdFrom, spmtYmdTo, sdlngCd, cnptCd) {
        const selectedVrty = jsonGridVrty.find(item => item.value === sdlngCd);

        const param = {
            apcCd: gv_selectedApcCd,
            spmtYmdFrom: spmtYmdFrom,
            spmtYmdTo: spmtYmdTo,
            vrtyCd: gfn_isEmpty(selectedVrty) ? '' : selectedVrty.vrtyCd,
            cnptCd: cnptCd
        }

        jsonSpmt.length = 0;

        try {
            const postJsonPromise = gfn_postJSON("/am/wrhs/selectSpmtList.do", param, null, false);
            const data = await postJsonPromise;

            data.resultList.forEach((item, index) => {
                const selectedVrty = jsonGridVrty.find(data => data.vrtyCd === item.vrtyCd);

                const spmtVO = {
                    pckgno: item.pckgno,
                    spmtno: item.spmtno,
                    spmtYmd: item.spmtYmd,
                    vrtyCd: selectedVrty.sdlngCd,
                    cnpt: item.cnptCd,
                    spmtPckgUnitCd: item.spmtPckgUnitCd,
                    bxQntt: item.spmtQntt,
                    wght: item.spmtWght,
                    rmrk: item.rmrk
                }

                jsonSpmt.push(spmtVO);
            });

            gridSpmt.rebuild();
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }
    }

    /**
     * @name fn_saveSpmtList
     * @description 출고 목록 저장
     */
    const fn_saveSpmtList = async function() {
        let checkBoxCol = gridSpmt.getColRef('checkedYn');
        let checkedRowData = gridSpmt.getCheckedRowData(checkBoxCol);

        if(checkedRowData.length == 0) {
            gfn_comAlert("W0001", "대상");    // W0001    {0}을/를 선택하세요.
            return;
        }

        let spmtList = [];

        for(let i = 0; i < checkedRowData.length; i++) {
            let rowData = JSON.parse(JSON.stringify(checkedRowData[i].data));

            if(gfn_isEmpty(rowData.spmtYmd)) {
                gfn_comAlert("W0002", "출고일자");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.vrtyCd)) {
                gfn_comAlert("W0002", "품종");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.cnpt)) {
                gfn_comAlert("W0002", "거래처");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.bxQntt) || rowData.bxQntt <= 0) {
                gfn_comAlert("W0002", "박스(개)");    // W0002    {0}을/를 입력하세요.
                return;
            }

            if(gfn_isEmpty(rowData.wght) || rowData.wght <= 0) {
                gfn_comAlert("W0002", "중량(Kg)");    // W0002    {0}을/를 입력하세요.
                return;
            }

            let param = {
                apcCd: gv_selectedApcCd,
                pckgno: rowData.pckgno,
                spmtno: rowData.spmtno,
                spmtYmd: rowData.spmtYmd,
                vrtyCd: jsonGridVrty.find(item => item.value === rowData.vrtyCd).vrtyCd,
                itemCd: jsonGridVrty.find(item => item.value === rowData.vrtyCd).itemCd,
                cnptCd: rowData.cnpt,
                spmtPckgUnitCd: rowData.spmtPckgUnitCd,
                spmtQntt: Number(rowData.bxQntt),
                spmtWght: Number(rowData.wght),
                rmrk: rowData.rmrk
            }

            if(gfn_isEmpty(rowData.spmtno)) {
                param.rowSts = "I";
            } else {
                param.rowSts = "U";
            }

            spmtList.push(param);
        }

        if(!gfn_comConfirm("Q0001", "저장")) {    // Q0001    {0} 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/am/wrhs/multiSpmtList.do", spmtList);
        const data = await postJsonPromise;

        try {
            if(_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");    // I0001    처리 되었습니다.
                fn_search();
            } else {
                gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
            }
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
        }
    }

    /**
     * @name fn_deleteSpmtList
     * @description 출고 목록 삭제
     */
    const fn_deleteSpmtList = async function() {
        let checkBoxCol = gridSpmt.getColRef('checkedYn');
        let checkedRowData = gridSpmt.getCheckedRowData(checkBoxCol);
        let checkedRows = gridSpmt.getCheckedRows(checkBoxCol);

        if(checkedRowData.length == 0) {
            gfn_comAlert("W0001", "대상");    // W0001    {0}을/를 선택하세요.
            return;
        }

        const spmtList = [];

        for(let i = 0; i < checkedRowData.length; i++) {
            let sdlngVO = JSON.parse(JSON.stringify(checkedRowData[i].data));

            if(!gfn_isEmpty(sdlngVO.spmtno)) {
                spmtList.push({
                    apcCd: gv_selectedApcCd,
                    spmtno: sdlngVO.spmtno,
                    pckgno: sdlngVO.pckgno
                });
            }
        }

        checkedRows.reverse();

        if(spmtList.length > 0) {
            if(!gfn_comConfirm("Q0001", "삭제")) {    // Q0001    {0} 하시겠습니까?
                return;
            }

            const postJsonPromise = gfn_postJSON("/am/wrhs/deleteSpmtList.do", spmtList);
            const data = await postJsonPromise;

            try {
                if(_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");    // I0001    처리 되었습니다.
                    fn_search();
                } else {
                    gfn_comAlert(data.resultCode, data.resultMessage);    // E0001    오류가 발생하였습니다.
                }
            } catch(e) {
                if(!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");    // E0001    오류가 발생하였습니다.
            }
        } else {
            for(let j = 0; j < checkedRows.length; j++) {
                gridSpmt.deleteRow(checkedRows[j]);
            }

            gridSpmt.rebuild();
        }
    }

    /**
     * @name fn_gridSpmtValueChanged
     * @description 출고 데이터 입력 시 event
     */
    const fn_gridSpmtValueChanged = async function(event, col, ref) {
        let nRow = gridSpmt.getRow();
        let rowData = gridSpmt.getRowData(nRow);
        const colData = gridSpmt.getCellData(nRow, ref);
        let allData = gridSpmt.getGridDataAll();

        const selectedSpmtPckgUnit = jsonSpmtPckgUnitCd.find(item => item.value === rowData.spmtPckgUnitCd);
        const selectedVrty = jsonGridVrty.find(item => item.value === rowData.vrtyCd);

        if(ref == 6 && !gfn_isEmpty(rowData.spmtPckgUnitCd)) {
            if(selectedSpmtPckgUnit) {
                gridSpmt.setCellData(nRow, 8, selectedSpmtPckgUnit.spcfctWght);
                rowData = gridSpmt.getRowData(nRow);
            }
        }

        if(ref == 7 && !gfn_isEmpty(rowData.spmtPckgUnitCd)) {
            if(selectedSpmtPckgUnit) {
                gridSpmt.setCellData(nRow, 8, selectedSpmtPckgUnit.spcfctWght * rowData.bxQntt);
                rowData = gridSpmt.getRowData(nRow);

                const totalBxQntt = jsonSpmt
                    .filter(item => item.vrtyCd === rowData.vrtyCd)
                    .reduce((sum, item) => {
                        const bxQntt = Number(item.bxQntt);
                        return sum + bxQntt;
                    }, 0);

                if(selectedVrty.totalQntt < totalBxQntt) {
                    gfn_comAlert("W0008", "재고(박스)", "박스(개)");    // W0008    {0} 보다 {1}이/가 큽니다.

                    gridSpmt.setCellData(nRow, 7, 0);
                    gridSpmt.setCellData(nRow, 8, 0);
                    rowData = gridSpmt.getRowData(nRow);
                }
            }
        }
    }

    /**
     * @name fn_setCnpt
     * @description 거래처 set
     */
    const fn_setCnpt = function(cnpt) {
        if(!gfn_isEmpty(cnpt)) {
            SBUxMethod.set("srch-inp-cnptCd", cnpt.cnptCd);
            SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
        }
    }

    /**
     * @name fn_sdlngCrtrPopCallBack
     * @description 육묘기준 callback
     */
    const fn_sdlngCrtrPopCallBack = function() {
        fn_initSBSelect();
    }

    /**
     * @name fn_zero
     * @description val 처리 event
     */
    const fn_zero = function(val) {
        if(gfn_isEmpty(val)) {
            return "";
        } else {
            if(val == 0) {
                return "";
            } else {
                return parseFloat(val);
            }
        }
    }

    /**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListSdlng = {
        "excelDwnld": {
            "name": "엑셀 다운로드",    // 컨텍스트메뉴에 표시될 이름
            "accesskey": "e",    // 단축키
            "callback": fn_excelDwnldSdlng,    // 콜백함수명
        }
    }

    /**
     * @name fn_excelDwnldSdlng
     * @description 육묘장 정보 엑셀 다운로드
     */
    function fn_excelDwnldSdlng() {
        gridSdlng.exportLocalExcel("육묘장 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    /**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListCltvtn = {
        "excelDwnld": {
            "name": "엑셀 다운로드",    // 컨텍스트메뉴에 표시될 이름
            "accesskey": "e",    // 단축키
            "callback": fn_excelDwnldCltvtn,    // 콜백함수명
        }
    }

    /**
     * @name fn_excelDwnldCltvtn
     * @description 재배장 정보 엑셀 다운로드
     */
    function fn_excelDwnldCltvtn() {
        gridCltvtn.exportLocalExcel("재배장 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    /**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListWgh = {
        "excelDwnld": {
            "name": "엑셀 다운로드",    // 컨텍스트메뉴에 표시될 이름
            "accesskey": "e",    // 단축키
            "callback": fn_excelDwnldWgh,    // 콜백함수명
        }
    }

    /**
     * @name fn_excelDwnldWgh
     * @description 계량 정보 엑셀 다운로드
     */
    function fn_excelDwnldWgh() {
        gridWgh.exportLocalExcel("계량 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    /**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListSpmt = {
        "excelDwnld": {
            "name": "엑셀 다운로드",    // 컨텍스트메뉴에 표시될 이름
            "accesskey": "e",    // 단축키
            "callback": fn_excelDwnldSpmt,    // 콜백함수명
        }
    }

    /**
     * @name fn_excelDwnldSpmt
     * @description 출고 정보 엑셀 다운로드
     */
    function fn_excelDwnldSpmt() {
        gridSpmt.exportLocalExcel("출고 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>