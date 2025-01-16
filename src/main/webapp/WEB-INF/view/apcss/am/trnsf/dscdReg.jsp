<%
    /**
     * @Class Name : wghCurInq.jsp
     * @Description : 반품 등록(상품)화면
     * @author SI개발부
     * @since 2024.12.19
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일        수정자        수정내용
     * @ ---------- ---------- ---------------------------
     * @ 2024.11.25     손민성       최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 반품 등록(상품)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 폐기 등록 -->
                </div>
                <%--/** 상단 버튼 **/--%>
                <div style="margin-left: auto;">
                    <sbux-button
                        id="btnCreate"
                        name="btnCreate"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="신규"
                        onclick="fn_create"
                    ></sbux-button>
                    <sbux-button
                        disabled="true"
                        id="btnSave"
                        name="btnSave"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="저장"
                        onclick="fn_save"
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
                <%@ include file="../../../frame/inc/apcSelect.jsp" %>
                <table id="searchTable" class="table table-bordered tbl_fixed">
                    <colgroup>
                        <col style="width: 7%">
                        <col style="width: 6%">
                        <col style="width: 6%">
                        <col style="width: 3%">
                        <col style="width: 7%">
                        <col style="width: 6%">
                        <col style="width: 3%">
                        <col style="width: 3%">
                        <col style="width: 3%">
                        <col style="width: 7%">
                        <col style="width: 6%">
                        <col style="width: 3%">
                        <col style="width: 6%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="th_bg">재고일자</th>
                            <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
                                <div style="display: flex;justify-content: center;align-items: center">
                                    <sbux-datepicker
                                        uitype="popup"
                                        id="srch-dtp-pckgYmdFrom"
                                        name="srch-dtp-pckgYmdFrom"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                        onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)"
                                    ></sbux-datepicker>
                                    <div style="width: 2vw;text-align: center">~</div>
                                    <sbux-datepicker
                                        uitype="popup"
                                        id="srch-dtp-pckgYmdTo"
                                        name="srch-dtp-pckgYmdTo"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                        onchange="fn_dtpChange(srch-dtp-wrhsYmdTo)"
                                    ></sbux-datepicker>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">품목/품종</th>
                            <td class="td_input" colspan="4" style="border-top: hidden;border-right: hidden">
                                <div style="display: flex; gap: 5px">
                                    <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-slt-itemCd"
                                        name="srch-slt-itemCd"
                                        class="form-control input-sm input-sm-ast"
                                        jsondata-ref="jsonApcItem"
                                        onchange="fn_onChangeSrchItemCd(this)"
                                    ></sbux-select>
                                    <sbux-select
                                        unselected-text="선택"
                                        uitype="single"
                                        id="srch-slt-vrtyCd"
                                        name="srch-slt-vrtyCd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        jsondata-ref="jsonApcVrty"
                                        jsondata-value="itemVrtyCd"
                                        onchange="fn_onChangeSrchVrtyCd(this)"
                                    ></sbux-select>
                                </div>
                            </td>
                            <td colspan="4" style="border-top: hidden"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">생산자</th>
                            <td class="td_input" colspan="3" style="border-right: hidden">
                                <div style="display: flex">
                                    <sbux-input
                                        id="srch-inp-prdcrCd"
                                        name="srch-inp-prdcrCd"
                                        uitype="hidden"
                                    ></sbux-input>
                                    <sbux-input
                                        uitype="text"
                                        id="srch-inp-prdcrNm"
                                        name="srch-inp-prdcrNm"
                                        class="form-control input-sm"
                                        wrap-style="margin-right: 10px"
                                        placeholder="초성검색 가능"
                                        autocomplete-ref="jsonPrdcrAutocomplete"
                                        autocomplete-text="name"
                                        autocomplete-height="270px"
                                        autocomplete-select-callback="fn_onSelectPrdcrNm"
                                        oninput="fn_onInputPrdcrNm(event)"
                                    ></sbux-input>
                                    <sbux-button
                                        id="btnSrchPrdcr"
                                        name="btnSrchPrdcr"
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기"
                                        uitype="modal"
                                        target-id="modal-prdcr"
                                        onclick="fn_choicePrdcr"
                                    ></sbux-button>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">창고구분</th>
                            <td class="td_input" colspan="4" style="border-right: hidden">
                                <sbux-select
                                    unselected-text="선택"
                                    uitype="single"
                                    id="srch-slt-warehouseSeCd"
                                    name="srch-slt-warehouseSeCd"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed"
                                    style="width: 80%"
                                    jsondata-ref="jsonApcWarehouse"
                                ></sbux-select>
                            </td>
                            <th scope="row" class="th_bg">조회구분</th>
                            <td class="td_input" colspan="3">
                                <sbux-select
                                    unselected-text="선택"
                                    uitype="single"
                                    id="srch-slt-inqType"
                                    name="srch-slt-inqType"
                                    style="width: 80%"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed"
                                    jsondata-ref="jsonComWarehouse">
                                </sbux-select>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div style="display: flex; flex-direction: column; gap: 10px">
                    <div style="flex: 1">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>재고 목록</span>
                                </li>
                            </ul>
                        </div>
                        <div id="sb-area-invntrList"></div>
                    </div>
                    <div style="flex: 1">
                        <div style="display: flex; justify-content: space-between;margin-bottom: 10px">
                            <span style="margin-right: 3px; font-weight: 600; color: #3c6dbc; align-content: end">폐기 등록 목록</span>
                            <div style="display: flex">
                                <div style="font-size: 13px; text-align: right; border-color: #e8f1f9;width: 150px; background-color: #e8f1f9; font-weight: 700;padding: 8px">폐기일자</div>
                                <div class="td_input">
                                    <sbux-datepicker
                                        uitype="popup"
                                        id="srch-dtp-dscdYmd"
                                        name="srch-dtp-dscdYmd"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                    ></sbux-datepicker>
                                </div>
                            </div>
                        </div>
                        <div id="sb-area-dscdRegList"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal
            id="modal-prdcr"
            name="modal-prdcr"
            uitype="middle"
            header-title="생산자 선택"
            body-html-id="body-modal-prdcr"
            header-is-close-button="false"
            footer-is-close-button="false"
            style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
        <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="application/javascript">
    /** grid 변수 셋팅 **/
    var jsonInvntrList = [];    // 재고 목록
    var jsonDscdRegList = [];   // 폐기 등록 목록

    var jsonDtlSn = []; //상세 코드

    var jsonApcItem      = [];	// 품목   itemCd          검색
    var jsonApcVrty      = [];	// 품종   vrtyCd          검색
    var jsonApcWarehouse = [];	// 창고   warehouseSeCd   검색

    let gridInvntrList;
    let gridDscdRegList;

    /** 생산자 관련 변수 **/
    var jsonDataPrdcr = [];
    var jsonPrdcr = [];
    var jsonPrdcrAutocomplete = [];
    var autoCompleteDataJson = [];

    window.addEventListener("DOMContentLoaded", function() {
        SBUxMethod.set("srch-dtp-pckgYmdTo", gfn_dateToYmd(new Date()));
        SBUxMethod.set("srch-dtp-pckgYmdFrom", gfn_dateToYmd(new Date()));
        SBUxMethod.set("srch-dtp-dscdYmd",gfn_dateToYmd(new Date()));

        fn_init();
    });

    const fn_init = async function() {
        let result = await Promise.all([
            // gfn_getComCdDtls('DSCD_ATRB_CD'),   //상세 코드
            gfn_postJSON("/am/dscd/selectDscdCrtrDtlList.do", {apcCd: gv_selectedApcCd}),
            gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_apcCd),	// 품목
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_apcCd),	// 품종
            gfn_setComCdSBSelect('srch-slt-warehouseSeCd', jsonApcWarehouse, 'WAREHOUSE_SE_CD', gv_apcCd)	// 창고
        ]);

        jsonDtlSn = [...result[0].resultList] || [];
        console.log("jsonDtlSn: ", jsonDtlSn);
        jsonDtlSn = jsonDtlSn.map(item => {
            return{
                ...item,
                label: item.dtlIndctNm,
                value: item.dtlVl
            }
        });

        await fn_create_rtnCrtr();
        await fn_create_rtnCrtrDtl();
        await fn_getPrdcrs();
    }

    const fn_create_rtnCrtr = async function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-invntrList';
        SBGridProperties.id = 'gridInvntrList';
        SBGridProperties.jsonref = 'jsonInvntrList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.columns = [
            // {caption: [""],	ref: 'fcltCd',		type:'output',  width:'5%', style: 'text-align:center;'},
            {
                caption: ["품목"],
                ref: 'itemNm',
                type: 'output',
                width: '14%',
                style: 'text-align: center;'
            },
            {
                caption: ["품종"],
                ref: 'vrtyNm',
                type: 'output',
                width: '14%',
                style: 'text-align: center;'
            },
            {
                caption: ["생산자"],
                ref: 'prdcrNm',
                type: 'output',
                width: '14%',
                style: 'text-align: center;'
            },
            {
                caption: ["재고번호"],
                ref: 'pckgno',
                type: 'output',
                width: '14%',
                style: 'text-align: center;'
            },
            {
                caption: ["재고정보"],
                ref: 'spmtPckgUnitNm',
                type: 'output',
                width: '14%',
                style: 'text-align: center;'
            },
            {
                caption: ["수량"],
                ref: 'invntrQntt',
                type: 'output',
                width: '15%',
                style: 'text-align: center;'
            },
            {
                caption: ["중량"],
                ref: 'invntrWght',
                type: 'output',
                width: '15%',
                style: 'text-align: center;'
            }
        ]
        gridInvntrList = _SBGrid.create(SBGridProperties);
        gridInvntrList.bind("click","fn_selectInvntr");
    }

    const fn_create_rtnCrtrDtl = async function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-dscdRegList';
        SBGridProperties.id = 'gridDscdRegList';
        SBGridProperties.jsonref = 'jsonDscdRegList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.allowpaste = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            {
                caption: [""],
                ref: 'fcltCd',
                type: 'button',
                width: '5%',
                style: 'text-align: center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if(gfn_isEmpty(objRowData.delYn)) {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRowDtl(" + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRowDtl(" + nRow + ")'>삭제</button>";
                    }
                }
            },
            {
                caption: ["품목"],
                ref: 'itemNm',
                type: 'output',
                width: '10%',
                style: 'text-align: center;'
            },
            {
                caption: ["품종"],
                ref: 'vrtyNm',
                type: 'output',
                width: '10%',
                style: 'text-align: center;'
            },
            {
                caption: ["생산자"],
                ref: 'prdcrNm',
                type: 'output',
                width: '10%',
                style: 'text-align: center;'
            },
            {
                caption: ["재고번호"],
                ref: 'invntrNo',
                type: 'output',
                width: '10%',
                style: 'text-align: center;'
            },
            {
                caption: ["수량"],
                ref: 'dscdQntt',
                type: 'input',
                width: '10%',
                style: 'text-align: center; background-color: #FFF8DC;'
            },
            {
                caption: ["중량"],
                ref: 'dscdWght',
                type: 'input',
                width: '10%',
                style: 'text-align: center; background-color: #FFF8DC;'
            },
            {
                caption: ["상세코드"],
                ref: 'dtlSn',
                type: 'combo',
                width: '10%',
                style: 'text-align: center; background-color: #FFF8DC;',
                typeinfo: {
                    ref: 'jsonDtlSn',
                    label: 'label',
                    value: 'value'
                }
            },
            {
                caption: ["폐기사유"],
                ref: 'dscdRsn',
                type: 'input',
                width: '25%',
                style: 'text-align: left; background-color: #FFF8DC;'
            }
        ]
        gridDscdRegList = _SBGrid.create(SBGridProperties);
    }

    /**
     * @name fn_search
     * @description 재고 목록 조회 event (clear)
     */
    const fn_search = async function() {
        jsonDscdRegList.length = 0;
        gridDscdRegList.rebuild();

        let srchParam = gfn_getTableElement("searchTable", "srch-", ["itemCd", "vrtyCd", "vhclno", "warehouseSeCd", "inqType", "prdcrNm", "prdcrCd"]);
        if(!srchParam) {
            return;
        }

        srchParam.vrtyCd = srchParam.vrtyCd?.substring(4);
        srchParam.apcCd = gv_apcCd;

        const postJsonPromise = gfn_postJSON("/am/invntr/selectGdsInvntrTotalList.do", srchParam);
        const data = await postJsonPromise;

        if(!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        if(data.resultList.length > 0) {
            jsonInvntrList = data.resultList;
            gridInvntrList.rebuild();
        }

        console.log(data);
    }

    /**
     * @name fn_selectInvntr
     * @description 재고 목록 클릭 시, 폐기 등록 목록 조회 event (clear)
     */
    const fn_selectInvntr = async function() {
        let nRow = gridInvntrList.getRow();
        let rowData = gridInvntrList.getRowData(nRow, true);
        console.log("rowData: ", rowData);

        /** reset **/
        jsonDscdRegList.length = 0;
        gridDscdRegList.rebuild();

        const postJsonPromise = gfn_postJSON("/am/dscd/selectDscdRegList.do", rowData);
        const data = await postJsonPromise;
        console.log("data: ", data);

        if(!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        if(data.resultList.length > 0) {
            jsonDscdRegList = data.resultList;
            gridDscdRegList.rebuild();
            nRow = gridDscdRegList.getRows();
            gridDscdRegList.addRow(true);
            gridDscdRegList.setCellDisabled(1, 0, nRow, gridDscdRegList.getCols() -1, true, true);
        } else {
            nRow = gridDscdRegList.getRows();
            gridDscdRegList.addRow(true);
            gridDscdRegList.setCellDisabled(nRow, 0, nRow, gridDscdRegList.getCols() -1, true, true);
        }
    }

    /**
     * @name fn_addRowDtl
     * @description 폐기 등록 목록 추가
     * @param {number} nRow
     */
    const fn_addRowDtl = async function(nRow) {
        let tRow = gridInvntrList.getRow();
        let tData = gridInvntrList.getRowData(tRow, true);
        let mRow = nRow + 1;

        const editableRow = gridDscdRegList.getRowData(nRow, false);
        editableRow.prdcrCd = tData.rprsPrdcrCd;
        editableRow.prdcrNm = tData.prdcrNm;
        editableRow.itemNm = tData.itemNm;
        editableRow.itemCd = tData.itemCd;
        editableRow.vrtyNm = tData.vrtyNm;
        editableRow.vrtyCd = tData.vrtyCd;
        editableRow.grdCd = tData.sortGrdCd;
        editableRow.gdsSeCd = tData.gdsSeCd;
        editableRow.warehouseSeCd = tData.warehouseSeCd;
        editableRow.invntrNo = tData.pckgno;
        editableRow.spcfctCd = tData.spcfctCd;
        editableRow.spmtPckgUnitCd = tData.spmtPckgUnitCd;
        editableRow.invntrSeCd = tData.spmtPckgUnitCd;
        // editableRow.dscdQntt = tData.invntrQntt;
        // editableRow.dscdWght = tData.invntrWght;
        editableRow.delYn = 'N';
        console.log("tData.rprsPrdcdCd: ", tData.rprsPrdcrCd);

        gridDscdRegList.addRow(true);
        gridDscdRegList.setCellDisabled(mRow, 0, mRow, gridDscdRegList.getCols() - 1, true);
        gridDscdRegList.setCellDisabled(nRow, 0, nRow, gridDscdRegList.getCols() - 1, false);

        SBUxMethod.attr("btnSave","disabled","false");
    }

    /**
     * @name fn_delRowDtl
     * @description 폐기 등록 목록 삭제
     * @param {number} nRow
     */
    const fn_delRowDtl = async function(nRow) {
        const delData = gridDscdRegList.getRowData(nRow);

        if(delData.hasOwnProperty("sysFrstInptDt")) {
            if(!gfn_comConfirm("Q0001","등록된 폐기 실적입니다. 삭제")) {   // 등록된 폐기 실적입니다. 삭제하시겠습니까?
                return;
            }
            console.log("delData: ", delData);
            const postJsonPromise = gfn_postJSON("/am/dscd/deleteDscdRegList.do", delData);
            const data = await postJsonPromise;
            console.log("data: ", data);

            if(!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }

            gfn_comAlert("I0001");

            await fn_search();
        }else{
            gridDscdRegList.deleteRow(nRow);
        }
    }

    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {
        let dscdYmd = SBUxMethod.get("srch-dtp-dscdYmd");
        let saveParam = gridDscdRegList.getGridDataAll().filter(item => item.delYn === 'N').map((item, idx) => {
            delete item.fcltCd;
            item.apcCd = gv_selectedApcCd;
            item.dscdYmd = dscdYmd;
            item.dscdSn = idx + 1;
            item.invntrSn = idx + 1;
            item.dtlSn = parseInt(item.dtlSn);

            return item;
        });

        saveParam = saveParam.filter(item => !item.hasOwnProperty("sysFrstInptDt"));
        console.log("saveParam: ", saveParam);

        if(!gfn_comConfirm("Q0001", "저장")) {    // 저장 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/am/dscd/insertDscdRegList.do", saveParam);
        const data = await postJsonPromise;
        console.log("data: ", data);
        if(!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        gfn_comAlert("I0001");

        await fn_search();
    }

    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 선택 변경 event
     */
    const fn_onChangeSrchItemCd = async function(obj) {
        let itemCd = obj.value;
        const itemInfo = _.find(jsonApcItem, {
            value: itemCd
        });

        let result = await Promise.all([
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd)
        ]);
    }

    /**
     * @name fn_onChangeSrchVrtyCd
     * @description 품종 선택 변경 event
     */
    const fn_onChangeSrchVrtyCd = async function(obj) {
        let vrtyCd = obj.value;

        if(gfn_isEmpty(vrtyCd)) {
            return;
        }

        const itemCd = vrtyCd.substring(0,4);
        SBUxMethod.set("srch-slt-itemCd", itemCd);
        await fn_onChangeSrchItemCd({
            value: itemCd
        });
        SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
    }

    /* 생산자 팝업 호출 필수 function  */
    /* Start */
    /**
     * @name fn_getPrdcrs
     * @description 생산자 리스트 호출
     */
    const fn_getPrdcrs = async function() {
        jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
        jsonPrdcr = gfn_setFrst(jsonPrdcr);
        console.log(jsonPrdcr);
    }

    /**
     * @name fn_choicePrdcr
     * @description 생산자 팝업 호출
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
    }

    /**
     * @name fn_setPrdcr
     * @description 생산자 선택 callback
     */
    const fn_setPrdcr = function(prdcr) {
        if(!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);		// callBack input
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);		// callBack input
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");

            fn_setPrdcrForm(prdcr);
        }
    }

    const fn_setPrdcrForm = async function(prdcr) {
        if(!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
            SBUxMethod.set("srch-inp-vrtyNm", prdcr.rprsVrtyNm);
            SBUxMethod.set("srch-inp-vrtyCd", prdcr.rprsVrtyCd);
            SBUxMethod.setValue('srch-slt-itemCd', prdcr.rprsItemCd);
            await gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, prdcr.rprsItemCd) // 규격
            if(checkSection == 1) {
                SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true');
            } else {
                SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false');
            }
        } else {
            if(!gfn_isEmpty(prdcr.rprsItemCd)) { // 대표품목
                const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
                if(prvItemCd != prdcr.rprsItemCd) {
                    SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
                    fn_selectItem();
                }
            }
        }

        if(!gfn_isEmpty(prdcr.wrhsSeCd)) { // 입고구분
            SBUxMethod.set("srch-slt-wrhsSeCd", prdcr.wrhsSeCd);
        }

        if(!gfn_isEmpty(prdcr.gdsSeCd)) { // 상품구분
            SBUxMethod.set("srch-slt-gdsSeCd", prdcr.gdsSeCd);
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

    /**
     * @name fn_onInputPrdcrNm
     * @description 생산자명 입력 시 event : autocomplete
     */
    const fn_onInputPrdcrNm = function(prdcrNm){
        console.log("생산자명: ", prdcrNm);
        fn_clearPrdcr();
        if(getByteLengthOfString(prdcrNm.target.value) > 100) {
            SBUxMethod.set("srch-inp-prdcrNm", "");
            return;
        }
        console.log("jsonPrdcr: ", jsonPrdcr);
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
     * @name fn_onSelectPrdcrNm
     * @description 생산자 autocomplete 선택 callback
     */
    function fn_onSelectPrdcrNm(value, label, item) {
        // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
        if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1) {
            document.getElementById('btnSrchPrdcr').click();
        } else {
            SBUxMethod.set("srch-inp-prdcrCd", value);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color: aquamarine"); // skyblue
            let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
            prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;

            fn_setPrdcrForm(prdcr);
        }
    }
    /* End */
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>