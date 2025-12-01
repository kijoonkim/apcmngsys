<%
    /**
     * @Class Name : sortCmnd_0274.jsp
     * @Description : 작업지시관리(만인산) 화면
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
    <title>title : 작업지시관리(만인산)</title>
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
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 작업지시관리(만인산) -->
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

                            <th scope="row" class="th_bg">작업라인</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                    unselected-text="전체"
                                    id="srch-slt-jobLine"
                                    name="srch-slt-jobLine"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonComJobLine"
                                    uitype="single"
                                ></sbux-select>
                            </td>
                            <td style="border-right: hidden;"></td>

                            <th scope="row" class="th_bg">품종</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                    unselected-text="전체"
                                    id="srch-slt-vrtyNm"
                                    name="srch-slt-vrtyNm"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonComVrty"
                                    uitype="single"
                                ></sbux-select>
                            </td>
                            <td style="border-right: hidden;"></td>
                        </tr>
                    </tbody>
                </table>

                <div class="ad_tbl_top" style="padding-top: 15px;">
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gridJobCmnd" style="width: 100%; height: 544px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script type="text/javascript">
    var gridJobCmnd;

    var jsonJobCmnd = [];
    var jsonComJobLine = [];    // 검색조건    작업라인
    var jsonComVrty = [];       // 검색조건    품종
    var jsonGridJobLine = [];   // 그리드　    작업라인

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

        fn_createJobCmndGrid();

        fn_search();
    }

    /**
     * @name fn_initSBSelect
     * @description 초기 데이터 조회
     */
    const fn_initSBSelect = async function() {
        let result = await Promise.all([
            gfn_setComCdSBSelect('srch-slt-jobLine', jsonComJobLine, 'SORT_FCLT_CD', gv_selectedApcCd),    // 작업라인
            gfn_setApcVrtySBSelect('srch-slt-vrtyNm', jsonComVrty, gv_selectedApcCd),    // 품종
            gfn_setComCdGridSelect('gridJobCmnd', jsonGridJobLine, 'SORT_FCLT_CD', gv_selectedApcCd)    // 작업라인
        ]);
    }

    /**
     * @name fn_createJobCmndGrid
     * @description 출하지시 그리드 생성
     */
    function fn_createJobCmndGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gridJobCmnd';
        SBGridProperties.id = 'gridJobCmnd';
        SBGridProperties.jsonref = 'jsonJobCmnd';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.allowcopy = true;
        SBGridProperties.columns = [
            {
                caption: ["<input type='checkbox' onchange='fn_checkAll(gridJobCmnd, this);'>"],
                ref: 'checkedYn',
                width: '50px',
                style: 'text-align: center;',
                type: 'checkbox',
                typeinfo: {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            { caption: ['지시번호'], ref: 'cmndno', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ['지시일자'], ref: 'cmndYmd', type: 'datepicker', width: '100px', style: 'text-align: center; background: #FFF8DC;', typeinfo: {dateformat: 'yyyy-mm-dd'}, format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'YYYYMMDD'} },
            { caption: ['작업라인'], ref: 'jobLine', type: 'combo', width: '100px', style: 'text-align: center; background: #FFF8DC;', sortable: false, typeinfo: {ref: 'jsonGridJobLine', label: 'label', value: 'value', itemcount: 10} },
            { caption: ['작업순번'], ref: 'jobSn', type: 'input', width: '100px', style: 'text-align: center; background: #FFF8DC;' },
            { caption: ['거래처'], ref: 'cnptNm', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ['상품명'], ref: 'gdsNm', type: 'output', width: '200px', style: 'text-align: center;' },
            { caption: ['원물품종'], ref: 'rawMtrVrtyNm', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ['단위'], ref: 'unit', type: 'output', width: '100px', style: 'text-align: center;' },
            { caption: ['지시수량'], ref: 'cmndQntt', type: 'input', width: '100px', style: 'text-align: center; background: #FFF8DC;', typeinfo: {mask: {alias: 'numeric'}}, format: {type: 'number', rule: '#,###'} },
            { caption: ['비고'], ref: 'rmrk', type: 'input', width: '100px', style: 'text-align: center; background: #FFF8DC;', typeinfo: {maxlength: 1000} }
        ];

        gridJobCmnd = _SBGrid.create(SBGridProperties);
        gridJobCmnd.rebuild();
    }

    /**
     * @name fn_jobCmndDoc
     * @description 작업지시서 발행
     */
    const fn_jobCmndDoc = async function() {
        const jobCmndList = [];

        const allData = gridJobCmnd.getGridDataAll();
        allData.forEach((item) => {
            if(item.checkedYn === "Y") {
                jobCmndList.push(item.cmndno);
            }
        });

        if(jobCmndList.length === 0) {
            gfn_comAlert("W0001", "발행대상");    // W0001    {0}을/를 선택하세요.
            return;
        }

        const sortCmndno = jobCmndList.join("','");
        gfn_popClipReport("만인산 작업지시서", "am/jobCmndDoc_0274.crf", {
            apcCd: gv_selectedApcCd,
            sortCmndno: sortCmndno
        });
    }

    /**
     * @name fn_save
     * @description 저장 버튼 클릭 시 event
     */
    const fn_save = async function() {
        const jobCmndList = [];

        let allData = gridJobCmnd.getGridDataAll();

        for(let i = 1; i <= allData.length; i++) {
            const rowData = gridJobCmnd.getRowData(i);
            const rowSts = gridJobCmnd.getRowStatus(i);

            if(rowSts === 3) {
                rowData.apcCd = gv_selectedApcCd;
                rowData.rowSts = "I";
                jobCmndList.push(rowData);
            } else if(rowSts === 2) {
                rowData.rowSts = "U";
                jobCmndList.push(rowData);
            } else {
                continue;
            }
        }

        if(jobCmndList.length == 0) {
            gfn_comAlert("W0003", "저장");    // W0003    {0}할 대상이 없습니다.
            return;
        }

        if(!gfn_comConfirm("Q0001", "저장")) {    // Q0001    {0} 하시겠습니까?
            return;
        }
    }

    /**
     * @name fn_search
     * @description 조회 버튼 클릭 시 event
     */
    const fn_search = async function() {
        let cmndYmdFrom = SBUxMethod.get("srch-dtp-cmndYmdFrom");
        let cmndYmdTo = SBUxMethod.get("srch-dtp-cmndYmdTo");
        let fcltCd = SBUxMethod.get("srch-slt-jobLine");
        let vrtyCd = SBUxMethod.get("srch-slt-vrtyNm");

        let param = {
            apcCd: gv_selectedApcCd,
            sortCmndFromYmd: cmndYmdFrom,
            sortCmndToYmd: cmndYmdTo,
            fcltCd: fcltCd,
            vrtyCd: vrtyCd
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/sort/selectSortCmndList.do", param, null, false);
            const data = await postJsonPromise;

            jsonJobCmnd.length = 0;

            data.resultList.forEach((item, index) => {
                const spmtCmndVO = {
                    cmndno: item.sortCmndno,
                    cmndYmd: item.sortCmndYmd,
                    jobLine: item.fcltCd,
                    jobSn: item.sortCmndSn,
                    cnptNm: item.lgszMrktNm,
                    gdsNm: item.mrktGdsNm,
                    rawMtrVrtyNm: item.vrtyNm,
                    unit: "",
                    cmndQntt: item.cmndQntt,
                    rmrk: item.rmrk
                }

                jsonJobCmnd.push(spmtCmndVO);
            });

            gridJobCmnd.rebuild();
        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
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

    /**
     * @name fn_checkAll
     * @description 그리드 체크박스 전체 선택
     */
    const fn_checkAll = function(grid, obj) {
        const checkedYn = obj.checked ? "Y" : "N";
        const getColRef = grid.getColRef("checkedYn");

        for(var i = 0; i < grid.getGridDataAll().length; i++) {
            grid.setCellData(i + 1, getColRef, checkedYn, true, false);
        }

        grid.refresh();
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>