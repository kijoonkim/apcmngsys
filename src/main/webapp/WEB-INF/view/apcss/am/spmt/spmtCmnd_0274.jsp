<%
    /**
     * @Class Name : spmtCmnd_0274.jsp
     * @Description : 출하지시관리(만인산) 화면
     * @author R&D사업본부
     * @since 2025.11.27
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ -----------	----------	---------------------------
     * @ 2025.11.27   	최지호		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 출하지시관리(만인산)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display: flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 출하지시관리(만인산) -->
                </div>

                <div style="margin-left: auto;">
                    <sbux-button
                        text="작업지시서"
                        id="btnJobCmndDoc"
                        name="btnJobCmndDoc"
                        class="btn btn-sm btn-primary"
                        uitype="normal"
                        onclick="fn_jobCmndDoc"
                    ></sbux-button>
                    <sbux-button
                        text="저장"
                        id="btnSave"
                        name="btnSave"
                        class="btn btn-sm btn-outline-danger"
                        uitype="normal"
                        onclick="fn_save"
                    ></sbux-button>
                    <sbux-button
                        text="조회"
                        id="btnSearch"
                        name="btnSearch"
                        class="btn btn-sm btn-outline-danger"
                        uitype="normal"
                        onclick="fn_search"
                    ></sbux-button>
                </div>
            </div>

            <div class="box-body">
                <%@ include file="../../../frame/inc/apcSelect.jsp" %>

                <table class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>

                    <colgroup>
                        <col style="width: 7%;">
                        <col style="width: 6%;">
                        <col style="width: 6%;">
                        <col style="width: 3%;">
                        <col style="width: 7%;">
                        <col style="width: 6%;">
                        <col style="width: 6%;">
                        <col style="width: 3%;">
                        <col style="width: 7%;">
                        <col style="width: 6%;">
                        <col style="width: 6%;">
                        <col style="width: 3%;">
                    </colgroup>

                    <tbody>
                        <tr>
                            <th scope="row" class="th_bg">지시일자</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                    id="srch-dtp-cmndYmdFrom"
                                    name="srch-dtp-cmndYmdFrom"
                                    class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                    date-format="yyyy-mm-dd"
                                    uitype="popup"
                                    onchange="fn_dtpChange(srch-dtp-cmndYmdFrom)"
                                ></sbux-datepicker>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                    id="srch-dtp-cmndYmdTo"
                                    name="srch-dtp-cmndYmdTo"
                                    class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                    date-format="yyyy-mm-dd"
                                    uitype="popup"
                                    onchange="fn_dtpChange(srch-dtp-cmndYmdTo)"
                                ></sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;"></td>

                            <th scope="row" class="th_bg">거래처</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-input
                                    id="srch-inp-cnptNm"
                                    name="srch-inp-cnptNm"
                                    class="form-control input-sm"
                                    uitype="text"
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-button
                                    text="찾기"
                                    id="btnSrchCnpt"
                                    name="btnSrchCnpt"
                                    class="btn btn-xs btn-outline-dark"
                                    uitype="modal"
                                    target-id="modal-cnpt"
                                    onclick="fn_modalCnpt"
                                ></sbux-button>
                            </td>

                            <th scope="row" class="th_bg">센터</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                    unselected-text="전체"
                                    id="srch-slt-cntrNm"
                                    name="srch-slt-cntrNm"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonComCntr"
                                    uitype="single"
                                ></sbux-select>
                            </td>
                            <td style="border-right: hidden;"></td>
                        </tr>
                    </tbody>
                </table>

                <div class="ad_tbl_top" style="padding-top: 15px;">
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gridSpmtCmnd" style="width: 100%; height: 544px;"></div>
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
    var gridSpmtCmnd;

    var jsonSpmtCmnd = [];
    var jsonComCntr = [];   // 검색조건    센터

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    /**
     * @name fn_init
     * @description 초기 화면 설정
     */
    const fn_init = async function() {
        SBUxMethod.set("srch-dtp-cmndYmdFrom", gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("srch-dtp-cmndYmdTo", gfn_dateToYmd(new Date()));

        let result = await Promise.all([
            fn_initSBSelect()
        ]);

        fn_createSpmtCmndGrid();
    }

    /**
     * @name fn_initSBSelect
     * @description 초기 데이터 조회
     */
    const fn_initSBSelect = async function() {
        let result = await Promise.all([
        ]);
    }

    /**
     * @name fn_createSpmtCmndGrid
     * @description 출하지시 그리드 생성
     */
    function fn_createSpmtCmndGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gridSpmtCmnd';
        SBGridProperties.id = 'gridSpmtCmnd';
        SBGridProperties.jsonref = 'jsonSpmtCmnd';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.allowcopy = true;
        SBGridProperties.columns = [
            { caption: [""], ref: 'checkedYn', type: 'checkbox',  width: '50px', style: 'text-align: center; background: #FFF8DC;', userattr: {colNm: "checkedYn"}, typeinfo: {checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 0}} },
            { caption: ['거래처'], ref: 'cnptNm', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ['센터'], ref: 'cntrNm', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ['상품명'], ref: 'gdsNm', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ['인증구분'], ref: 'certSeNm', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ['지시수량'], ref: 'cmndQntt', type: 'output', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ['들이'], ref: 'vlm', type: 'input', width: '100px', style: 'text-align: center; background: #FFF8DC;' },
            { caption: ['팔레트번호'], ref: 'pltno', type: 'input', width: '100px', style: 'text-align: center; background: #FFF8DC;' },
            { caption: ['실적수량'], ref: 'prfmncQntt', type: 'output', width: '100px', style: 'text-align: center;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ['비고'], ref: 'rmrk', type: 'input', width: '150px', style: 'text-align: center; background: #FFF8DC;', typeinfo: {maxlength: 1000} },
            { caption: ['출하지시번호'], ref: 'spmtCmndno', hidden: true }
        ];

        gridSpmtCmnd = _SBGrid.create(SBGridProperties);
        gridSpmtCmnd.rebuild();
    }

    /**
     * @name fn_jobCmndDoc
     * @description 작업지시서 발행
     */
    const fn_jobCmndDoc = async function() {
        const spmtCmndList = [];

        const allData = gridSpmtCmnd.getGridDataAll();
        allData.forEach((item) => {
            if(item.checkedYn === "Y") {
                spmtCmndList.push(item.spmtCmndno);
            }
        });

        if(spmtCmndList.length === 0) {
            gfn_comAlert("W0001", "발행대상");    // W0001    {0}을/를 선택하세요.
            return;
        }

        const spmtCmndno = spmtCmndList.join("','");
        gfn_popClipReport("만인산 출하지시서", "am/spmtCmndDoc_0274.crf", {
            apcCd: gv_selectedApcCd,
            spmtCmndno: spmtCmndno
        });
    }

    /**
     * @name fn_save
     * @description 저장 버튼 클릭 시 event
     */
    const fn_save = async function() {

    }

    /**
     * @name fn_search
     * @description 조회 버튼 클릭 시 event
     */
    const fn_search = async function() {
        let cmndYmdFrom = SBUxMethod.get("srch-dtp-cmndYmdFrom");
        let cmndYmdTo = SBUxMethod.get("srch-dtp-cmndYmdTo");
        let cnptNm = SBUxMethod.get("srch-inp-cnptNm");

        let param = {
            apcCd: gv_selectedApcCd,
            cmndYmdFrom: cmndYmdFrom,
            cmndYmdTo: cmndYmdTo,
            cnptNm: cnptNm
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtCmndList.do", param, null, false);
            const data = await postJsonPromise;

            jsonSpmtCmnd.length = 0;

            data.resultList.forEach((item, index) => {
                const spmtCmndVO = {
                    cnptNm: item.cnptNm,
                    cntrNm: "",
                    gdsNm: item.gdsNm,
                    certSeNm: "",
                    cmndQntt: item.cmndQntt,
                    vlm: "",
                    pltno: "",
                    prfmncQntt: "",
                    rmrk: item.rmrk,
                    spmtCmndno: item.spmtCmndno
                }

                jsonSpmtCmnd.push(spmtCmndVO);
            });

            gridSpmtCmnd.rebuild();
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }
    }

    /**
     * @name fn_modalCnpt
     * @description 거래처 찾기 버튼 클릭 시 event
     */
    const fn_modalCnpt = function() {
        popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnptNm"), fn_setCnpt);
    }

    /**
     * @name fn_setCnpt
     * @description 거래처 set
     */
    const fn_setCnpt = function(cnpt) {
        if(!gfn_isEmpty(cnpt)) {
            SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
        }
    }

    /**
     * @name fn_dtpChange
     * @description 일자 변경 시 event
     */
    const fn_dtpChange = function() {
        let cmndYmdFrom = SBUxMethod.get("srch-dtp-cmndYmdFrom");
        let cmndYmdTo = SBUxMethod.get("srch-dtp-cmndYmdTo");

        if(gfn_diffDate(cmndYmdFrom, cmndYmdTo) < 0) {
            gfn_comAlert("W0014", "시작일자", "종료일자");    // W0014    {0}이/가 {1} 보다 큽니다.

            SBUxMethod.set("srch-dtp-cmndYmdFrom", gfn_dateFirstYmd(new Date()));
            SBUxMethod.set("srch-dtp-cmndYmdTo", gfn_dateToYmd(new Date()));

            return;
        }
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>