<%
    /**
     * @Class Name : wghCurInq.jsp
     * @Description : 계량현황조회 화면
     * @author SI개발부
     * @since 2024.11.25
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
    <title>title : 계량현황 조회</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 계량현황조회 -->
            </div>
            <%--            /** 상단 버튼 **/--%>
            <div style="margin-left: auto;">
<%--                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" class="btn btn-sm btn-outline-danger" text="신규" onclick="fn_create"></sbux-button>--%>
                    <sbux-button disabled="true" id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                    <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
<%--                <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>--%>
<%--                <sbux-button disabled="true" id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>--%>
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
                    <th scope="row" class="th_bg">기준유형</th>
                    <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
                        <sbux-select id="srch-slt-shpgotCrtrType"
                                     name="srch-slt-shpgotCrtrType"
                                     uitype="single"
                                     unselected-text="전체"
                                     class="form-control input-sm"
                                     style="width: 80%"
                                     jsondata-ref="jsonShpgotCrtrType">
                        </sbux-select>
                    </td>
                    <td colspan="9" style="border-top: hidden"></td>
                </tr>
                </tbody>
            </table>
            <div style="display: flex; flex-direction: row; gap: 10px; ">
                <div style="flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>반품기준 목록</span>
                            </li>
                        </ul>
                    </div>
                    <div id="sb-area-rtnCrtr" style="height: 400px"></div>
                </div>
                <div style="flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>반품기준 상세정보</span>
                            </li>
                        </ul>
                        <sbux-button disabled="true" id="btnSaveDtl" name="btnSaveDtl" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_saveDtl"></sbux-button>
                    </div>
                    <div id="sb-area-rtnCrtrDtl" style="height: 400px"></div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="application/javascript">
    /** grid 변수 셋팅 **/
    var jsonRtnCrtr = [];
    var jsonRtnCrtrDtl = [];

    let gridRtnCrtr;
    let gridRtnCrtrDtl;

    /** select val **/
    var jsonShpgotCrtrType = [];
    var jsonShpgotTrgtCd = [];
    var jsonShpgotAtrbCd = [];

    window.addEventListener("DOMContentLoaded",function(){
       fn_init();
    });
    const fn_init = async function(){
        await fn_create_rtnCrtr();
        await fn_create_rtnCrtrDtl();
        await fn_selectInit();
        await fn_search();
    }

    const fn_create_rtnCrtr = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-rtnCrtr';
        SBGridProperties.id = 'gridRtnCrtr';
        SBGridProperties.jsonref = 'jsonRtnCrtr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.clickeventarea = {fixed: false, empty: false};
        SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = [
            {caption: [""],	ref: 'fcltCd',		type:'output',  width:'7%', style: 'text-align:center;',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(objRowData.delYn)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
                    }
            }},
            {caption: ["기준유형코드"],ref: 'shpgotCrtrType',type:'combo',  width:'15%', style: 'text-align:center;',typeinfo : {ref:'jsonShpgotCrtrType', label:'label', value:'value', oneclickedit: true}},
            {caption: ["기준표시명"],ref: 'crtrIndctNm',type:'input',  width:'10%', style: 'text-align:center;'},
            {caption: ["기준코드"],ref: 'crtrCd',	type:'input',  width:'10%', style: 'text-align:center;'},
            {caption: ["반출대상코드"],ref: 'shpgotTrgtCd',type:'combo',  width:'15%', style: 'text-align:center;',typeinfo: {ref:'jsonShpgotTrgtCd', label:'label', value:'value',oneclickedit: true}},
            {caption: ["표시순서"],ref: 'indctSeq',	type:'input',  width:'10%', style: 'text-align:center;',typeinfo:{mask:{alias:'numeric'}}},
            {caption: ["사용여부"],ref: 'useYn',	type:'multiradio',  width:'15%', style: 'text-align:center;', typeinfo : {radiolabel : ['Y', 'N'], radiovalue : ['Y', 'N']}},
            {caption: ["기준 비고"],ref: 'rmrk', type:'input',  width:'18%', style: 'text-align:center;'},
        ]
        gridRtnCrtr = _SBGrid.create(SBGridProperties);
        gridRtnCrtr.bind("click","fn_searchDtl");
        gridRtnCrtr.bind("valuechanged","fn_changeCom");
        let nRow = gridRtnCrtr.getRows();
        gridRtnCrtr.addRow(true);
        gridRtnCrtr.setCellDisabled(nRow, 0, nRow, gridRtnCrtr.getCols() - 1, true);
    }
    const fn_create_rtnCrtrDtl = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-rtnCrtrDtl';
        SBGridProperties.id = 'gridRtnCrtrDtl';
        SBGridProperties.jsonref = 'jsonRtnCrtrDtl';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.columns = [
            {caption: [""],	ref: 'fcltCd',		type:'output',  width:'7%', style: 'text-align:center;',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(objRowData.delYn)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow2(" + nRow + ", " + nCol +  ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow2(" + nRow + ")'>삭제</button>";
                    }
                }},
            {caption: ["상세일련번호"],ref: 'dtlSn', type:'input',  width:'12%', style: 'text-align:center;',typeinfo:{mask:{alias:'numeric'}}},
            {caption: ["상세코드"],ref: 'dtlCd', type:'combo',  width:'12%', style: 'text-align:center;',typeinfo: {ref:'jsonShpgotAtrbCd', label:'label', value:'value',oneclickedit: true}},
            {caption: ["상세값"],	ref: 'dtlVl', type:'input',  width:'12%', style: 'text-align:center;',typeinfo:{mask:{alias:'numeric'}}},
            {caption: ["상세표시명"],	ref: 'dtlIndctNm', type:'input',  width:'12%', style: 'text-align:center;'},
            {caption: ["표시순서"],ref: 'indctSeq',	type:'input',  width:'12%', style: 'text-align:center;',typeinfo:{mask:{alias:'numeric'}}},
            {caption: ["사용여부"],ref: 'useYn',	type:'multiradio',  width:'12%', style: 'text-align:center;', typeinfo : {radiolabel : ['Y', 'N'], radiovalue : ['Y', 'N']}},
            {caption: ["상세 비고"],ref: 'rmrk', type:'input',  width:'21%', style: 'text-align:center;'},
        ]
        gridRtnCrtrDtl = _SBGrid.create(SBGridProperties);
        gridRtnCrtrDtl.bind("valuechanged","fn_changeCom2");
        /** 진입시 상세는 없음 상단 그리드 선택시 조회 **/
        // let nRow = gridRtnCrtrDtl.getRows();
        // gridRtnCrtrDtl.addRow(true);
        // gridRtnCrtrDtl.setCellDisabled(nRow, 0, nRow, gridRtnCrtrDtl.getCols() - 1, true);
    }
    const fn_selectInit = async function(){
        await gfn_setComCdSBSelect('srch-slt-shpgotCrtrType',jsonShpgotCrtrType,'SHPGOT_CRTR_TYPE');
        jsonShpgotTrgtCd = await gfn_getComCdDtls('SHPGOT_TRGT_CD');
        jsonShpgotTrgtCd = jsonShpgotTrgtCd.map(item => ({label: item.cdVlNm, value: item.cdVl}));

        jsonShpgotAtrbCd = await gfn_getComCdDtls('SHPGOT_ATRB_CD');
        jsonShpgotAtrbCd = jsonShpgotAtrbCd.map(item => ({label: item.cdVlNm, value: item.cdVl}));
    }

    /**
     * @name fn_addRow
     * @description 행추가
     * @param {number} nRow
     */
    const fn_addRow = async function(nRow, nCol) {
        const editableRow = gridRtnCrtr.getRowData(nRow, false);
        editableRow.delYn = "N";
        gridRtnCrtr.rebuild();
        gridRtnCrtr.addRow(true);
        nRow++;
        gridRtnCrtr.setCellDisabled(nRow, 0, nRow, gridRtnCrtr.getCols() - 1, true);
        /** 저장버튼 활성화 **/
        SBUxMethod.attr("btnSave","disabled","false");
    }
    /**
     * @name fn_addRow
     * @description 행추가
     * 하위 그리드 용 SB이슈
     * @param {number} nRow
     */
    const fn_addRow2 = async function(nRow, nCol) {
        const editableRow = gridRtnCrtrDtl.getRowData(nRow, false);
        editableRow.delYn = "N";
        /** 상단 식별 키값 셋팅 **/
        let uRow = gridRtnCrtr.getRow();
        let uRowData = gridRtnCrtr.getRowData(uRow);
        editableRow.shpgotCrtrType = uRowData.shpgotCrtrType;
        editableRow.crtrCd = uRowData.crtrCd;

        gridRtnCrtrDtl.rebuild();
        gridRtnCrtrDtl.addRow(true);
        nRow++;
        gridRtnCrtrDtl.setCellDisabled(nRow, 0, nRow, gridRtnCrtrDtl.getCols() - 1, true);
        /** 상세 저장 버튼 활성화 **/
        SBUxMethod.attr("btnSaveDtl","disabled","false");
    }
    const fn_delRow = async function(nRow){
        let rowData = gridRtnCrtr.getRowData(nRow);
        console.log(rowData);
        if(!gfn_isEmpty(rowData.apcCd)){
            if(!gfn_comConfirm("Q0001","등록된 목록입니다. 삭제")){
                return;
            }
        }else{
            gridRtnCrtr.deleteRow(nRow);
            return;
        }

        let deleteParam = {shpgotApcCrtrVO:rowData}

        const postJsonPromise = gfn_postJSON("/am/spmt/deleteShpgotApcCrtr.do",deleteParam);
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
        }
        gfn_comAlert("I0001");
        fn_search();
    }
    const fn_delRow2 = async function(nRow){
        let rowData = gridRtnCrtrDtl.getRowData(nRow);
        if(!gfn_isEmpty(rowData.apcCd)){
            if(!gfn_comConfirm("Q0001","등록된 목록입니다. 삭제")){
                return;
            }
        }else{
            gridRtnCrtrDtl.deleteRow(nRow);
            return;
        }
        console.log(rowData,"디테일 삭제");

        const postJsonPromise = gfn_postJSON("/am/spmt/deleteShpgotApcCrtrDtl.do",rowData);
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }
        gfn_comAlert("I0001");
        await fn_search();
    }

    const fn_save = async function(){
        let crtr = gridRtnCrtr.getGridDataAll(true).filter((item,idx) => {
            delete item.fcltCd;
            item.apcCd = gv_apcCd;
            item.indctSeq = idx;
            return item.delYn == 'N'
        });
        let requestData = {shpgotApcCrtrVoList:crtr}
        let postJsonPromise = gfn_postJSON("/am/spmt/insertShpgotApcCrtr.do",requestData);
        let data = await postJsonPromise;
        if(data.resultStatus === 'S'){
            gfn_comAlert("I0001");
        }
    }

    const fn_saveDtl = async function(){
        let crtrDtl = gridRtnCrtrDtl.getGridDataAll(true).filter((item,idx) => {
            item.apcCd = gv_apcCd;
            item.indctSeq = idx;
            return item.delYn == 'N'
        });
        if(crtrDtl.length <= 0){
            gfn_comAlert("");
        }
        let requestData = {shpgotApcCrtrDtlVoList:crtrDtl}

        let postJsonPromise = gfn_postJSON("/am/spmt/insertShpgotApcCrtr.do",requestData);
        let data = await postJsonPromise;
        if(data.resultStatus === 'S'){
            gfn_comAlert("I0001");
        }
    }

    const fn_search = async function(){
        jsonRtnCrtrDtl.length = 0;
        gridRtnCrtrDtl.rebuild();
        let shpgotCrtrType = SBUxMethod.get("srch-slt-shpgotCrtrType") || '';
        let postJsonPromise = gfn_postJSON("/am/spmt/selectShpgotApcCrtrList.do",{apcCd:gv_apcCd,shpgotCrtrType: shpgotCrtrType});
        let data = await postJsonPromise;
        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }
        if(data.resultList.length > 0){
            jsonRtnCrtr = data.resultList;
            gridRtnCrtr.rebuild();
            let nRow = gridRtnCrtr.getRows();
            gridRtnCrtr.addRow(true);
            gridRtnCrtr.setCellDisabled(nRow, 0, nRow, gridRtnCrtr.getCols() - 1, true);
        }
    }

    const fn_searchDtl = async function(){
        /** 목록 선택시 상세 조회 **/
        let nRow = gridRtnCrtr.getRow();
        let rowData = gridRtnCrtr.getRowData(nRow);
        let postJsonPromise = gfn_postJSON("/am/spmt/selectShpgotApcCrtrDtlList.do",rowData,'',true);
        let data = await postJsonPromise;
        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }else{
            /** reset **/
            jsonRtnCrtrDtl.length = 0;
            SBUxMethod.attr("btnSaveDtl","disabled","true");

            if(data.resultList.length > 0){
                jsonRtnCrtrDtl = data.resultList;
                gridRtnCrtrDtl.rebuild();
                let nRow = gridRtnCrtrDtl.getRows();
                gridRtnCrtrDtl.addRow(true);
                gridRtnCrtrDtl.setCellDisabled(nRow, 0, nRow, gridRtnCrtrDtl.getCols() - 1, true);
            }else{
                gridRtnCrtrDtl.rebuild();
                let nRow = gridRtnCrtrDtl.getRows();
                gridRtnCrtrDtl.addRow(true);
                gridRtnCrtrDtl.setCellDisabled(nRow, 0, nRow, gridRtnCrtrDtl.getCols() - 1, true);
            }
        }

    }
    const fn_changeCom = async function(){
        let nRow = gridRtnCrtr.getRow();
        let rowData = gridRtnCrtr.getRowData(nRow);
        let prevData = gridRtnCrtr.getPrevCellDataInfo();

        SBUxMethod.attr("btnSave","disabled","false");
    }
    const fn_changeCom2 = async function(){
        let nRow = gridRtnCrtrDtl.getRow();
        let rowData = gridRtnCrtrDtl.getRowData(nRow);
        let prevData = gridRtnCrtrDtl.getPrevCellDataInfo();

        SBUxMethod.attr("btnSaveDtl","disabled","false");
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>