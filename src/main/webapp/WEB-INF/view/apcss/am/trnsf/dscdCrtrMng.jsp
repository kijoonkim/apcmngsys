<%
    /**
     * @Class Name : dscdCrtrMng.jsp
     * @Description : 폐기 기준 관리 화면
     * @author SI개발부
     * @since 2024.11.25
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.11.25   	손민성		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 폐기 기준 관리</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 폐기 기준 관리 -->
                </div>
                <%--/** 상단 버튼 **/--%>
                <div style="margin-left: auto;">
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
                <table class="table table-bordered tbl_fixed">
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
                            <th scope="row" class="th_bg">폐기유형</th>
                            <td class="td_input" colspan="3" style="border-right: hidden">
                                <sbux-select
                                    id="srch-slt-dscdCrtrType"
                                    name="srch-slt-dscdCrtrType"
                                    uitype="single"
                                    unselected-text="전체"
                                    class="form-control input-sm"
                                    style="width: 80%"
                                    jsondata-ref="jsonDscdCrtrType"
                                    jsondata-value="cdVl"
                                    jsondata-text="cdVlNm"
                                ></sbux-select>
                            </td>
                            <td colspan="9" style="border-top: hidden;"></td>
                        </tr>
                    </tbody>
                </table>
                <div style="display: flex; flex-direction: column; gap: 10px">
                    <div style="flex: 1">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>폐기기준 목록</span>
                                    <span style="font-size:12px">(조회건수 <span id="cnt-crtr">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div id="sb-area-grdDscdCrtr" style="height:300px;"></div>
                    </div>
                    <div style="flex: 1">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>폐기기준 상세정보</span>
                                    <span style="font-size:12px">(조회건수 <span id="cnt-crtrDtl">0</span>건)</span>
                                </li>
                            </ul>
                            <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
                                <sbux-button
                                    disabled="true"
                                    id="btnSaveDtl"
                                    name="btnSaveDtl"
                                    uitype="normal"
                                    class="btn btn-sm btn-outline-dark"
                                    onclick="fn_saveDtl"
                                    text="상세저장"
                                ></sbux-button>
                            </div>
                        </div>
                        <div id="sb-area-grdDscdCrtrDtl" style="height:208px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script type="application/javascript">
    var jsonDscdCrtrType = [];
    var jsonDscdAtrbCd = [];
    var jsonYn = [
        {cdVl: "Y", cdVlNm: "사용"},
        {cdVl: "N", cdVlNm: "미사용"},
    ];

    /** grid 변수 셋팅 **/
    var jsonDscdCrtr = [];
    var jsonDscdCrtrDtl = [];

    var grdDscdCrtr;
    var grdDscdCrtrDtl;

    window.addEventListener("DOMContentLoaded", function() {
        fn_init();
    });

    const fn_init = async function() {
        let result = await Promise.all([
            gfn_getComCdDtls('DSCD_CRTR_TYPE'),
            gfn_getComCdDtls('DSCD_ATRB_CD')
        ]);

        jsonDscdCrtrType = result[0];
        jsonDscdAtrbCd = result[1];
        SBUxMethod.refresh("srch-slt-dscdCrtrType");

        await fn_createGrid();
        await fn_createGridDtl();
        await fn_search();
    }

    const fn_createGrid = async function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdDscdCrtr';
        SBGridProperties.id = 'grdDscdCrtr';
        SBGridProperties.jsonref = 'jsonDscdCrtr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            {
                caption: ["처리"],
                ref: 'delYn',
                type: 'button',
                width: '60px',
                style: 'text-align: center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if(gfn_isEmpty(strValue)) {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
                    }
                }
            },
            {
                caption: ["기준유형코드"],
                ref: 'dscdCrtrType',
                width: '120px',
                style: 'text-align: center;',
            },
            {
                caption: ["기준유형명칭"],
                ref: 'dscdCrtrType',
                type: 'combo',
                width: '120px',
                style: 'text-align: center; background-color: #FFF8DC;',
                typeinfo: {
                    ref: 'jsonDscdCrtrType',
                    label: 'cdVlNm',
                    value: 'cdVl',
                    displayui: false
                }
            },
            {
                caption: ["기준코드"],
                ref: 'crtrCd',
                type: 'input',
                width: '120px',
                style: 'text-align: center; background-color: #FFF8DC;',
                typeinfo: {
                    maxlength: 4,
                    mask: {
                        alias: '*',
                        repeat: '*',
                        unmaskvalue: false
                    }
                },
                userattr: {
                    colNm: "crtrCd"
                }
            },
            {
                caption: ["기준표시명"],
                ref: 'crtrIndctNm',
                type: 'input',
                width: '140px',
                style: 'text-align: center; background-color: #FFF8DC;',
                userattr: {
                    colNm: "crtrIndctNm"
                }
            },
            {
                caption: ["기준 비고"],
                ref: 'crtrRmrk',
                type: 'input',
                width: '200px',
                style: 'text-align: left;',
                userattr: {
                    colNm: "crtrRmrk"
                }
            }
        ]

        grdDscdCrtr = _SBGrid.create(SBGridProperties);
        grdDscdCrtr.bind('click', "fn_searchDscdCrtrDtlInfo");
    }


    const fn_createGridDtl = async function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdDscdCrtrDtl';
        SBGridProperties.id = 'grdDscdCrtrDtl';
        SBGridProperties.jsonref = 'jsonDscdCrtrDtl';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            {
                caption: ["처리"],
                ref: 'fcltCd',
                type: 'button',
                width: '5%',
                style: 'text-align: center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if(gfn_isEmpty(objRowData.useYn)) {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRowDtl(" + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRowDtl(" + nRow + ")'>삭제</button>";
                    }
                }
            },
            {
                caption: ["상세순번"],
                ref: 'dtlSn',
                type: 'output',
                width: '10%',
                style: 'text-align: center;'
            },
            {
                caption: ["상세코드"],
                ref: 'dtlCd',
                type: 'combo',
                width: '10%',
                style: 'text-align: center',
                typeinfo: {
                    ref: 'jsonDscdAtrbCd',
                    label: 'cdVlNm',
                    value: 'cdVl'
                }
            },
            {
                caption: ["상세표시명"],
                ref: 'dtlIndctNm',
                type: 'input',
                width: '10%',
                style: 'text-align: center; background-color: #FFF8DC;',
                userattr: {
                    colNm: "dtlIndctNm"
                }
            },
            {
                caption: ["상세값"],
                ref: 'dtlVl',
                type: 'input',
                width: '10%',
                style: 'text-align:center;',
                userattr: {
                    colNm: "dtlVl"
                },
                typeinfo: {
                    mask: {
                        alias: '#',
                        repeat: '*',
                        unmaskvalue: true
                    },
                    maxlength: 6,
                    oneclickedit: true
                },
                format: {
                    type: 'number',
                    rule: '#,###.#'
                }
            },
            {
                caption: ["상세비고"],
                ref: 'dtlRmrk',
                type: 'input',
                width: '55%',
                style: 'text-align: left;',
            }
        ]
        grdDscdCrtrDtl = _SBGrid.create(SBGridProperties);
    }

    const fn_search = async function() {
        jsonDscdCrtrDtl.length = 0;
        grdDscdCrtrDtl.refresh();

        SBUxMethod.attr("btnSave", "disabled", "true");
        SBUxMethod.attr("btnSaveDtl", "disabled", "true");

        await fn_setGrdDscdCrtr();
    }

    /**
     * @name fn_setGrdDscdCrtr
     * @description 폐기기준 목록 조회
     * @function
     */
    const fn_setGrdDscdCrtr = async function() {
        jsonDscdCrtr.length = 0;

        const dscdCrtrType = SBUxMethod.get("srch-slt-dscdCrtrType");

        try {
            const postJsonPromise = gfn_postJSON("/am/dscd/selectDscdCrtrList.do", {
                apcCd: gv_selectedApcCd,
                dscdCrtrType: dscdCrtrType
            });

            const data = await postJsonPromise;

            if(_.isEqual("S", data.resultStatus)) {

                data.resultList.forEach((item, index) => {
                    item.delYn = "N";
                    item.chkVl = "Y";
                    jsonDscdCrtr.push(item);
                });

                let totalRecordCount = jsonDscdCrtr.length;
                document.querySelector('#cnt-crtr').innerText = totalRecordCount;
                grdDscdCrtr.rebuild();

                grdDscdCrtr.setCellDisabled(0, 0, grdDscdCrtr.getRows() -1, 2, true);
                grdDscdCrtr.setCellDisabled(0, 3, grdDscdCrtr.getRows() -1, grdDscdCrtr.getCols() -1, false);

                grdDscdCrtr.addRow();
                grdDscdCrtr.setCellDisabled(grdDscdCrtr.getRows() -1, 0, grdDscdCrtr.getRows() -1, grdDscdCrtr.getCols() -1, true);

            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
            }

        } catch (e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {
        await fn_insertCrtr();
    }

    /**
     * @name fn_insertCrtr
     * @description 저장 버튼
     */
    const fn_insertCrtr = async function() {
        const crtrList = [];

        const allData = grdDscdCrtr.getGridDataAll();

        for(var i = 1; i <= allData.length; i++) {
            const rowData = grdDscdCrtr.getRowData(i);
            const rowSts = grdDscdCrtr.getRowStatus(i);

            if(!_.isEqual("N", rowData.delYn) || rowSts === 0) {
                continue;
            }

            if(gfn_isEmpty(rowData.dscdCrtrType)) {
                gfn_comAlert("W0005", "폐기기준유형");    // W0005 {0}이/가 없습니다.
                return;
            }

            if(gfn_isEmpty(rowData.crtrCd)) {
                gfn_comAlert("W0005", "기준코드");       // W0005 {0}이/가 없습니다.
                return;
            }

            if(gfn_isEmpty(rowData.crtrIndctNm)) {
                gfn_comAlert("W0005", "기준표시명");     // W0005 {0}이/가 없습니다.
                return;
            }

            crtrList.push({
                dscdCrtrType: rowData.dscdCrtrType,
                crtrCd: rowData.crtrCd,
                crtrVl: rowData.crtrVl,
                crtrIndctNm: rowData.crtrIndctNm,
                indctSeq: rowData.indctSeq,
                crtrRmrk: rowData.crtrRmrk,
                useYn: rowData.useYn
            });
        }

        if(crtrList.length == 0) {
            gfn_comAlert("W0003", "저장");    // W0003 {0}할 대상이 없습니다.
            return;
        }

        if(!gfn_comConfirm("Q0001", "저장")) {    // Q0001 {0} 하시겠습니까?
            return;
        }

        const param = {
            apcCd: gv_selectedApcCd,
            dscdCrtrList: crtrList
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/dscd/insertDscdCrtr.do", param);
            const data = await postJsonPromise;

            if(_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");  // I0001 처리 되었습니다.
                fn_search();
            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);  // E0001 오류가 발생하였습니다.
            }

        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");  // E0001 오류가 발생하였습니다.
        }
    }

    /**
     * @name fn_deleteCrtr
     * @description 폐기기준 삭제
     */
    const fn_deleteCrtr = async function(_crtr) {
        const crtrList = [{
            dscdCrtrType: _crtr.dscdCrtrType,
            crtrCd: _crtr.crtrCd
        }];

        const param = {
            apcCd: gv_selectedApcCd,
            dscdCrtrList: crtrList
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/dscd/deleteDscdCrtr.do", param);
            const data = await postJsonPromise;

            if(_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");  // I0001 처리 되었습니다.
                fn_search();
            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);  // E0001 오류가 발생하였습니다.
            }

        } catch(e) {
            if(!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");  // E0001 오류가 발생하였습니다.
        }
    }

    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(nRow) {
        const editableRow = grdDscdCrtr.getRowData(nRow, false);    // call by reference(deep copy)
        editableRow.delYn = "N";
        editableRow.useYn = "Y";

        SBUxMethod.attr("btnSave", "disabled", "false");

        grdDscdCrtr.rebuild();
        grdDscdCrtr.setCellDisabled(nRow, 2, nRow, grdDscdCrtr.getCols() - 1, false);
        nRow++;
        grdDscdCrtr.addRow(true);
        grdDscdCrtr.setCellDisabled(nRow, 0, nRow, grdDscdCrtr.getCols() - 1, true);
    }

    /**
     * @name fn_delRow
     * @description 행삭제
     * @param {number} nRow
     */
    const fn_delRow = async function(_nRow) {
        const _crtr = grdDscdCrtr.getRowData(_nRow);

        if(_.isEqual("Y", _crtr["chkVl"])) {
            if(!gfn_comConfirm("Q0002", "등록기준", "삭제")) {    // Q0002 {0}이/가 있습니다. {1} 하시겠습니까?
                return;
            }
            await fn_deleteCrtr(_crtr);
        } else {
            grdDscdCrtr.deleteRow(_nRow);

            SBUxMethod.attr("btnSave", "disabled", "true");
        }
    }

    /**
     * @name fn_searchDscdCrtrDtlInfo
     * @description 폐기기준 목록 클릭 시, 폐기기준 상세정보 조회
     * @function
     */
    const fn_searchDscdCrtrDtlInfo = async function() {
        let nRow = grdDscdCrtr.getRow();
        let rowData = grdDscdCrtr.getRowData(nRow, true);
        if(rowData.dscdCrtrType == "") {
            return;
        }

        jsonDscdCrtrDtl.length = 0;
        grdDscdCrtrDtl.rebuild();

        const postJsonPromise = gfn_postJSON("/am/dscd/selectDscdCrtrDtlList.do", rowData);
        const data = await postJsonPromise;

        if(!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        if(data.resultList.length > 0) {
            let totalRecordCount = jsonDscdCrtrDtl.length;
            document.querySelector('#cnt-crtrDtl').innerText = totalRecordCount;

            jsonDscdCrtrDtl = data.resultList;
            grdDscdCrtrDtl.rebuild();
            nRow = grdDscdCrtrDtl.getRows();
            grdDscdCrtrDtl.addRow(true);
            grdDscdCrtrDtl.setCellDisabled(1, 0, nRow, grdDscdCrtrDtl.getCols() -1, true, true);
        } else {
            nRow = grdDscdCrtrDtl.getRows();
            grdDscdCrtrDtl.addRow(true);
            grdDscdCrtrDtl.setCellDisabled(nRow, 0, nRow, grdDscdCrtrDtl.getCols() -1, true, true);
        }
    }

    /**
     * @name fn_addRowDtl
     * @description 폐기기준 상세정보 행 추가
     * @param {number} nRow
     */
    const fn_addRowDtl = async function(nRow) {
        const tRow = grdDscdCrtr.getRow();
        let tData = grdDscdCrtr.getRowData(tRow, true);
        let mRow = nRow + 1;

        const editableRow = grdDscdCrtrDtl.getRowData(nRow, false);
        editableRow.dscdCrtrType = tData.dscdCrtrType;
        editableRow.crtrCd = tData.crtrCd;
        editableRow.crtrIndctNm = tData.crtrIndctNm;
        editableRow.delYn = "N";
        editableRow.useYn = "Y";

        grdDscdCrtrDtl.addRow(true);
        grdDscdCrtrDtl.setCellDisabled(mRow, 0, mRow, grdDscdCrtrDtl.getCols() - 1, true);
        grdDscdCrtrDtl.setCellDisabled(nRow, 0, nRow, grdDscdCrtrDtl.getCols() - 1, false);

        SBUxMethod.attr("btnSaveDtl", "disabled", "false");
    }

    /**
     * @name fn_delRowDtl
     * @description 폐기기준 상세정보 행 삭제
     * @param {number} nRow
     */
    const fn_delRowDtl = async function(nRow) {
        const delData = grdDscdCrtrDtl.getRowData(nRow);

        if(delData.hasOwnProperty("sysFrstInptDt")) {
            if(!gfn_comConfirm("Q0001", "등록된 폐기기준 상세정보입니다. 삭제")) {   // 등록된 폐기기준 상세정보입니다. 삭제하시겠습니까?
                return;
            }

            const postJsonPromise = gfn_postJSON("/am/dscd/deleteDscdCrtrDtl.do", delData);
            const data = await postJsonPromise;

            if(!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }

            gfn_comAlert("I0001");

            await fn_search();
        }else{
            grdDscdCrtrDtl.deleteRow(nRow);

            SBUxMethod.attr("btnSaveDtl", "disabled", "true");
        }
    }

    /**
     * @name fn_saveDtl
     * @description 폐기기준 상세정보 저장
     */
    const fn_saveDtl = async function() {
        let saveParam = grdDscdCrtrDtl.getGridDataAll().filter(item => item.useYn === 'Y').map((item, idx) => {
            delete item.fcltCd;
            item.apcCd = gv_selectedApcCd;
            item.dtlSn = idx + 1;
            item.indctSeq = idx + 1;
            item.dtlVl = parseInt(item.dtlVl);

            return item;
        });

        saveParam = saveParam.filter(item => !item.hasOwnProperty("sysFrstInptDt"));

        if(!gfn_comConfirm("Q0001", "저장")) {    // 저장 하시겠습니까?
            return;
        }

        const postJsonPromise = gfn_postJSON("/am/dscd/insertDscdCrtrDtl.do", saveParam);
        const data = await postJsonPromise;

        if(!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        gfn_comAlert("I0001");  // 처리되었습니다.

        await fn_search();
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
