<%
    /**
     * @Class Name : dscdCrtrMng.jsp
     * @Description : 폐기기준관리 화면
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
    <title>title : 폐기기준관리</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 폐기기준관리 -->
            </div>
            <%--            /** 상단 버튼 **/--%>
            <div style="margin-left: auto;">
                <sbux-button
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
                        >
                        </sbux-select>
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
                                    id="btn-saveDtl"
                                    name="btn-saveDtl"
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
    var jsonYn				= [
        {cdVl: "Y", cdVlNm: "사용"},
        {cdVl: "N", cdVlNm: "미사용"},
    ];

    /** grid 변수 셋팅 **/


    var jsonDscdCrtr = [];
    var jsonDscdCrtrDtl = [];

    var grdDscdCrtr;
    var grdDscdCrtrDtl;

    window.addEventListener("DOMContentLoaded", function(){
        fn_init();
    });

    const fn_init = async function(){

        let result = await Promise.all([
            gfn_getComCdDtls('DSCD_CRTR_TYPE'),
            gfn_getComCdDtls('DSCD_ATRB_CD'),
        ]);

        jsonDscdCrtrType = result[0];
        jsonDscdAtrbCd = result[1];
        SBUxMethod.refresh("srch-slt-dscdCrtrType");

        await fn_createGrid();
        await fn_createGridDtl();

        await fn_search();
    }

    const fn_createGrid = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdDscdCrtr';
        SBGridProperties.id = 'grdDscdCrtr';
        SBGridProperties.jsonref = 'jsonDscdCrtr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.explorerbar = 'sort';
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.frozencols = 2;
        SBGridProperties.oneclickedit = true;
        SBGridProperties.allowpaste = true;
        SBGridProperties.columns = [
            {
                caption: ["처리"],
                ref: 'delYn',
                type:'button',
                width:'60px',
                style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(strValue)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
                    }
                }
            },
            {
                caption: ["폐기기준유형"],
                ref: 'dscdCrtrType',
                type:'combo',
                width:'120px',
                style: 'text-align:center;background-color:#FFF8DC;',
                typeinfo: {
                    ref:'jsonDscdCrtrType ',
                    label:'cdVlNm',
                    value:'cdVl',
                    displayui : false
                }
            },
            {
                caption: ["기준코드"],
                ref: 'crtrCd',
                type: 'input',
                width:'120px',
                style: 'text-align:center;background-color:#FFF8DC;',
                typeinfo: {
                    maxlength : 4,
                    mask : {alias : '*', repeat : '*', unmaskvalue : false}
                },
                userattr: {colNm: "crtrCd"},
            },
            {
                caption: ["기준표시명"],
                ref: 'crtrIndctNm',
                type: 'input',
                width:'140px',
                style: 'text-align:center;background-color:#FFF8DC;',
                userattr: {colNm: "crtrIndctNm"},
            },
            {
                caption: ["기준값"],
                ref: 'crtrVl',
                type: 'input',
                width:'120px',
                style: 'text-align:center;',
                userattr: {colNm: "crtrVl"},
                typeinfo: {
                    mask : {alias : '#', repeat: '*', unmaskvalue : true},
                    maxlength: 6,
                    oneclickedit: true
                },
                format : {type:'number', rule:'#,###.#'}
            },
            {
                caption: ["표시순서"],
                ref: 'indctSeq',
                type: 'input',
                width:'80px',
                style: 'text-align:right;',
                userattr: {colNm: "indctSeq"},
                typeinfo: {
                    mask : {alias : '#', repeat: '*', unmaskvalue : true},
                    maxlength: 6,
                    oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
            },
            {
                caption: ["사용"],
                ref: 'useYn',
                type:'combo',
                width:'50px',
                style: 'text-align:center',
                typeinfo: {
                    ref:'jsonYn',
                    label:'cdVlNm',
                    value:'cdVl',
                    displayui : false
                }
            },
            {
                caption: ["기준비고사항"],
                ref: 'crtrRmrk',
                type: 'input',
                width:'200px',
                style: 'text-align:left;',
                userattr: {colNm: "crtrRmrk"},
            },
        ]

        grdDscdCrtr = _SBGrid.create(SBGridProperties);
        grdDscdCrtr.bind('rowchanged', fn_grdDscdCrtrRowChanged);

        const nRow = grdDscdCrtr.getRows();
        grdDscdCrtr.addRow(true);
        grdDscdCrtr.setCellDisabled(
            nRow,
            0,
            nRow,
            grdDscdCrtr.getCols() - 1,
            true
        );
    }


    const fn_createGridDtl = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdDscdCrtrDtl';
        SBGridProperties.id = 'grdDscdCrtrDtl';
        SBGridProperties.jsonref = 'jsonDscdCrtrDtl';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.oneclickedit = true;
        SBGridProperties.allowpaste = true;
        SBGridProperties.columns = [
            {
                caption: ["처리"],
                ref: 'delYn',
                type:'button',
                width:'60px',
                style: 'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(strValue)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRowDtl(" + nRow + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRowDtl(" + nRow + ")'>삭제</button>";
                    }
                }
            },
            {
                caption: ["폐기기준유형"],
                ref: 'dscdCrtrTypeNm',
                type:'output',
                style: 'text-align:center',
            },
            {
                caption: ["기준코드"],
                ref: 'crtrCd',
                type: 'output',
                width:'120px',
                style: 'text-align:center;',
                userattr: {colNm: "crtrCd"},
                hidden: true
            },
            {
                caption: ["기준표시명"],
                ref: 'crtrIndctNm',
                type: 'input',
                width:'140px',
                style: 'text-align:center;',
                userattr: {colNm: "crtrIndctNm"},
            },
            {
                caption: ["상세코드"],
                ref: 'dtlCd',
                type:'combo',
                width:'120px',
                style: 'text-align:center',
                typeinfo: {
                    ref:'jsonDscdAtrbCd',
                    label:'cdVlNm',
                    value:'cdVl',
                }
            },
            {
                caption: ["상세표시명"],
                ref: 'dtlIndctNm',
                type: 'input',
                width:'140px',
                style: 'text-align:center;background-color:#FFF8DC;',
                userattr: {colNm: "dtlIndctNm"},
            },
            {
                caption: ["상세값"],
                ref: 'dtlVl',
                type: 'input',
                width:'120px',
                style: 'text-align:center;',
                userattr: {colNm: "dtlVl"},
                typeinfo: {
                    mask : {alias : '#', repeat: '*', unmaskvalue : true},
                    maxlength: 6,
                    oneclickedit: true
                },
                format : {type:'number', rule:'#,###.#'}
            },
            {
                caption: ["표시순서"],
                ref: 'indctSeq',
                type: 'input',
                width:'80px',
                style: 'text-align:right;',
                userattr: {colNm: "indctSeq"},
                typeinfo: {
                    mask : {alias : '#', repeat: '*', unmaskvalue : true},
                    maxlength: 6,
                    oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
            },
            {
                caption: ["사용"],
                ref: 'useYn',
                type:'combo',
                width:'50px',
                style: 'text-align:center',
                typeinfo: {
                    ref:'jsonYn',
                    label:'cdVlNm',
                    value:'cdVl',
                    displayui : false
                }
            },
        ]
        grdDscdCrtrDtl = _SBGrid.create(SBGridProperties);
    }

    const fn_search = async function(){

        jsonDscdCrtrDtl.length = 0;
        grdDscdCrtrDtl.refresh();

        await fn_setGrdDscdCrtr();

    }

    const fn_setGrdDscdCrtr = async function() {

        jsonDscdCrtr.length = 0;

        const dscdCrtrType = SBUxMethod.get("srch-slt-dscdCrtrType");

        try {

            const postJsonPromise = gfn_postJSON("/am/dscd/selectDscdCrtrList.do", {
                apcCd: gv_selectedApcCd,
                dscdCrtrType: dscdCrtrType,
            });

            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {

                data.resultList.forEach((item, index) => {
                    item.delYn = "N";
                    item.chkVl = "Y";
                    jsonDscdCrtr.push(item);
                });

                let totalRecordCount = jsonDscdCrtr.length;
                document.querySelector('#cnt-crtr').innerText = totalRecordCount;
                grdDscdCrtr.rebuild();

                grdDscdCrtr.setCellDisabled(
                    0,
                    0,
                    grdDscdCrtr.getRows() -1,
                    2,
                    true
                );
                grdDscdCrtr.setCellDisabled(
                    0,
                    3,
                    grdDscdCrtr.getRows() -1,
                    grdDscdCrtr.getCols() -1,
                    false
                );

                grdDscdCrtr.addRow();
                grdDscdCrtr.setCellDisabled(
                    grdDscdCrtr.getRows() -1,
                    0,
                    grdDscdCrtr.getRows() -1,
                    grdDscdCrtr.getCols() -1,
                    true
                );

            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
                //gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    /**
     * @name fn_setGrdDscdCrtrDtl
     * @description 폐기기준 상세 목록 조회
     * @function
     */
    const fn_setGrdDscdCrtrDtl = async function(_crtr) {

        let needsNewRow = true;
        jsonDscdCrtrDtl.length = 0;

        try {

            const postJsonPromise = gfn_postJSON("/am/dscd/selectDscdCrtrDtlList.do", {
                apcCd: gv_selectedApcCd,
                dscdCrtrType: _crtr.dscdCrtrType,
                crtrCd: _crtr.crtrCd,
            });

            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {

                if (data.resultList.length > 0) {
                    needsNewRow = true;
                }

                data.resultList.forEach((item, index) => {
                    item.delYn = "N";
                    item.chkVl = "Y";
                    if (!gfn_isEmpty(item.dtlSn)) {
                        jsonDscdCrtrDtl.push(item);
                    }
                });

                let totalRecordCount = jsonDscdCrtrDtl.length;
                grdDscdCrtrDtl.rebuild();

                document.querySelector('#cnt-crtrDtl').innerText = totalRecordCount;

                grdDscdCrtrDtl.setCellDisabled(
                    0,
                    0,
                    grdDscdCrtrDtl.getRows() -1,
                    3,
                    true
                );
                grdDscdCrtrDtl.setCellDisabled(
                    0,
                    4,
                    grdDscdCrtrDtl.getRows() -1,
                    grdDscdCrtrDtl.getCols() -1,
                    false
                );

                if (needsNewRow) {
                    grdDscdCrtrDtl.addRow();
                    grdDscdCrtrDtl.setCellDisabled(
                        grdDscdCrtrDtl.getRows() -1,
                        0,
                        grdDscdCrtrDtl.getRows() -1,
                        grdDscdCrtrDtl.getCols() -1,
                        true
                    );
                }

            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
                //gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }

        } catch (e) {
            if (!(e instanceof Error)) {
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

        for ( var i=1; i<=allData.length; i++ ){
            const rowData = grdDscdCrtr.getRowData(i);
            const rowSts = grdDscdCrtr.getRowStatus(i);

            if (!_.isEqual("N", rowData.delYn) || rowSts === 0 ) {
                continue;
            }

            if (gfn_isEmpty(rowData.dscdCrtrType)) {
                gfn_comAlert("W0005", "폐기기준유형");		//	W0005	{0}이/가 없습니다.
                return;
            }

            if (gfn_isEmpty(rowData.crtrCd)) {
                gfn_comAlert("W0005", "기준코드");		//	W0005	{0}이/가 없습니다.
                return;
            }

            if (gfn_isEmpty(rowData.crtrIndctNm)) {
                gfn_comAlert("W0005", "기준표시명");		//	W0005	{0}이/가 없습니다.
                return;
            }

            crtrList.push({
                dscdCrtrType: rowData.dscdCrtrType,
                crtrCd: rowData.crtrCd,
                crtrVl: rowData.crtrVl,
                crtrIndctNm: rowData.crtrIndctNm,
                indctSeq: rowData.indctSeq,
                crtrRmrk: rowData.crtrRmrk,
                useYn: rowData.useYn,
            });
        }

        if (crtrList.length == 0) {
            gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
        }

        if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        const param = {
            apcCd: gv_selectedApcCd,
            dscdCrtrList: crtrList
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/dscd/insertDscdCrtr.do", param);
            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                fn_search();
            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
            }

        } catch(e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

    }


    /**
     * @name fn_deleteCrtr
     * @description 폐기기준 삭제
     */
    const fn_deleteCrtr = async function(_crtr) {

        const crtrList = [{
            dscdCrtrType: _crtr.dscdCrtrType,
            crtrCd: _crtr.crtrCd,
        }];

        const param = {
            apcCd: gv_selectedApcCd,
            dscdCrtrList: crtrList
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/dscd/deleteDscdCrtr.do", param);
            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                fn_search();
            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
            }

        } catch(e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

    }

    /**
     * @name fn_saveDtl
     * @description 상세기준 저장 버튼
     */
    const fn_saveDtl = async function() {
        await fn_insertCrtrDtl();
    }


    /**
     * @name fn_insertCrtrDtl
     * @description 상세기준 저장 버튼
     */
    const fn_insertCrtrDtl = async function() {

        const crtrDtlList = [];

        const allData = grdDscdCrtrDtl.getGridDataAll();

        const crtrRow = grdDscdCrtr.getRow();
        const crtrInfo = grdDscdCrtr.getRowData(crtrRow);

        for ( var i=1; i<=allData.length; i++ ){

            const rowData = grdDscdCrtrDtl.getRowData(i);
            const rowSts = grdDscdCrtrDtl.getRowStatus(i);

            if (!_.isEqual("N", rowData.delYn) || rowSts === 0 ) {
                continue;
            }

            if (gfn_isEmpty(rowData.dscdCrtrType)) {
                gfn_comAlert("W0005", "폐기기준유형");		//	W0005	{0}이/가 없습니다.
                return;
            }

            if (gfn_isEmpty(rowData.crtrCd)) {
                gfn_comAlert("W0005", "기준코드");		//	W0005	{0}이/가 없습니다.
                return;
            }

            if (gfn_isEmpty(rowData.dtlIndctNm)) {
                gfn_comAlert("W0005", "상세표시명");		//	W0005	{0}이/가 없습니다.
                return;
            }

            if (gfn_isEmpty(rowData.dtlCd)) {
                gfn_comAlert("W0005", "상세코드");		//	W0005	{0}이/가 없습니다.
                return;
            }

            crtrDtlList.push({
                dscdCrtrType: rowData.dscdCrtrType,
                crtrCd: rowData.crtrCd,
                dtlSn: rowData.dtlSn,
                dtlCd: rowData.dtlCd,
                dtlVl: rowData.dtlVl,
                dtlIndctNm: rowData.dtlIndctNm,
                indctSeq: rowData.indctSeq,
                useYn: rowData.useYn,
            });
        }

        if (crtrDtlList.length == 0) {
            gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
        }

        if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
            return;
        }

        const param = {
            apcCd: gv_selectedApcCd,
            dscdCrtrType: crtrInfo.dscdCrtrType,
            crtrCd: crtrInfo.crtrCd,
            dscdCrtrDtlList: crtrDtlList
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/dscd/insertDscdCrtrDtl.do", param);
            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.

                fn_setGrdDscdCrtrDtl(crtrInfo);

            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
            }
        } catch(e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    /**
     * @name fn_deleteCrtrDtl
     * @description 상세기준 삭제
     */
    const fn_deleteCrtrDtl = async function(_crtrDtl) {

        const crtrDtlList = [{
            dscdCrtrType: _crtrDtl.dscdCrtrType,
            crtrCd: _crtrDtl.crtrCd,
            dtlSn: _crtrDtl.dtlSn,
        }];

        if (crtrDtlList.length == 0) {
            gfn_comAlert("W0003", "삭제");		//	W0003	{0}할 대상이 없습니다.
            return;
        }

        const param = {
            apcCd: gv_selectedApcCd,
            dscdCrtrType: _crtrDtl.dscdCrtrType,
            crtrCd: _crtrDtl.crtrCd,
            dscdCrtrDtlList: crtrDtlList
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/dscd/deleteDscdCrtrDtl.do", param);
            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.

                const crtrRow = grdDscdCrtr.getRow();
                const crtrInfo = grdDscdCrtr.getRowData(crtrRow);

                fn_setGrdDscdCrtrDtl(crtrInfo);

            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
            }
        } catch(e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

    }


    const fn_grdDscdCrtrRowChanged = function() {

        const nRow = grdDscdCrtr.getRow();

        if (nRow < 1) {
            return;
        }

        const _crtr = grdDscdCrtr.getRowData(nRow);

        if (gfn_isEmpty(_crtr) || !_.isEqual("Y", _crtr["chkVl"])) {
            jsonDscdCrtrDtl.length = 0;
            grdDscdCrtrDtl.refresh();
            document.querySelector('#cnt-crtrDtl').innerText = 0;
            return;
        }

        fn_setGrdDscdCrtrDtl(_crtr);
    }

    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(nRow) {

        const editableRow = grdDscdCrtr.getRowData(nRow, false);	// call by reference(deep copy)
        editableRow.delYn = "N";
        editableRow.useYn = "Y";

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

        //const rowStatus = grdDscdCrtr.getRowStatus(_nRow);
        const _crtr = grdDscdCrtr.getRowData(_nRow);

        if (_.isEqual("Y", _crtr["chkVl"])) {
            if (!gfn_comConfirm("Q0002", "등록기준", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
                return;
            }
            await fn_deleteCrtr(_crtr);

        } else {
            grdDscdCrtr.deleteRow(_nRow);
        }
    }

    /**
     * @name fn_addRowDtl
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRowDtl = async function(nRow) {

        const crtrRow = grdDscdCrtr.getRow();

        if (crtrRow < 1) {
            gfn_comAlert("W0001", "폐기기준");		//	W0001	{0}을/를 선택하세요.
            return;
        }

        const _crtr = grdDscdCrtr.getRowData(crtrRow);

        if (gfn_isEmpty(_crtr) || !_.isEqual("Y", _crtr["chkVl"])) {
            gfn_comAlert("W0020", "미등록");		//	W0020	{0} 상태의 {1} 입니다.
            return;
        }

        const editableRow = grdDscdCrtrDtl.getRowData(nRow, false);	// call by reference(deep copy)

        editableRow.dscdCrtrType = _crtr.dscdCrtrType;
        editableRow.dscdCrtrTypeNm = _crtr.dscdCrtrTypeNm;
        editableRow.crtrCd = _crtr.crtrCd;
        editableRow.crtrIndctNm = _crtr.crtrIndctNm;
        editableRow.delYn = "N";
        editableRow.useYn = "Y";

        grdDscdCrtrDtl.rebuild();
        grdDscdCrtrDtl.setCellDisabled(nRow, 3, nRow, grdDscdCrtrDtl.getCols() - 1, false);

        nRow++;
        grdDscdCrtrDtl.addRow(true);
        grdDscdCrtrDtl.setCellDisabled(nRow, 0, nRow, grdDscdCrtrDtl.getCols() - 1, true);
    }

    /**
     * @name fn_delRowDtl
     * @description 행삭제
     * @param {number} nRow
     */
    const fn_delRowDtl = async function(_nRow) {

        const rowData = grdDscdCrtrDtl.getRowData(_nRow);
        if (_.isEqual("Y", rowData["chkVl"])) {
            if (!gfn_comConfirm("Q0002", "등록기준상세", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
                return;
            }

            await fn_deleteCrtrDtl(rowData);

        } else {
            grdDscdCrtrDtl.deleteRow(_nRow);
        }
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
