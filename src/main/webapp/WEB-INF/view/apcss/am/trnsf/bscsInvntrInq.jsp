<%
    /**
     * @Class Name : bscsInvntrIng.jsp
     * @Description : 기초재고 조회 화면
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
    <title>title : 기초재고 조회</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 기초재고조회 -->
            </div>
            <%--            /** 상단 버튼 **/--%>
            <div style="margin-left: auto;">
                <%--                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" class="btn btn-sm btn-outline-danger" text="신규" onclick="fn_create"></sbux-button>--%>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
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
                    <th scope="row" class="th_bg">재고유형</th>
                    <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
                        <sbux-select id="srch-slt-invntrType"
                                     name="srch-slt-invntrType"
                                     uitype="single"
                                     unselected-text="전체"
                                     class="form-control input-sm"
                                     style="width: 80%"
                                     jsondata-ref="jsonInvntrType">
                        </sbux-select>
                    </td>
                    <th scope="row" class="th_bg">기초일자</th>
                    <td class="td_input" colspan="4" style="border-right: hidden;border-top: hidden">
                        <sbux-datepicker id="srch-slt-bssYmd"
                                         name="srch-slt-bssYmd"
                                         class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                         wrap-style="width:80%"
                                         uitype="popup">
                        </sbux-datepicker>
                    </td>
                    <td colspan="4"></td>
                </tr>
                </tbody>
            </table>
            <div style="display: flex; flex-direction: column; gap: 10px">
                <div style="flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>기초재고 목록</span>
                            </li>
                        </ul>
                    </div>
                    <div id="sb-area-bssInvntr" style="height: 500px"></div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="application/javascript">
    /** grid 변수 셋팅 **/
    //var jsonRtnCrtr = [];
    //let gridRtnCrtr;

    //재고유형
    var jsonInvntrType = [];
    //기초재고
    var grdBssInvntr;
    var jsonBssInvntr =[];

    //품목
    var jsonApcItem = [];
    //품종
    var jsonApcVrty = [];
    //창고
    var jsonWarehouse = [];


    window.addEventListener("DOMContentLoaded",function(){
        fn_init();
    });
    const fn_init = async function(){
        await fn_initSBSelect();
        await fn_create_rtnCrtr();
        await fn_search();
    }

    const fn_initSBSelect = async function(){
        await gfn_setComCdSBSelect('srch-slt-invntrType', jsonInvntrType, 'INVNTR_SE_CD');
        jsonWarehouse = await gfn_getComCdDtls('WAREHOUSE_SE_CD',gv_apcCd);
        jsonApcItem = await gfn_getApcItem(gv_apcCd);
        jsonApcVrty = await gfn_getApcVrty(gv_apcCd);
    }

    const fn_create_rtnCrtr = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-bssInvntr';
        SBGridProperties.id = 'grdBssInvntr';
        SBGridProperties.jsonref = 'jsonBssInvntr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.datamergefalseskip = true;
        SBGridProperties.columns = [
            {caption: [""],	ref: 'delYn',		type:'output',  width:'8%', style: 'text-align:center;',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    if (gfn_isEmpty(objRowData.delYn)){
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
                    } else {
                        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
                    }
                }},
            {caption: ["재고유형"],	ref: 'invntrSeCd',		type:'combo', typeinfo : {ref :'jsonInvntrType',label : 'label', value :'value',oneclickedit: true}, width:'11.5%', style: 'text-align:center;'},
            {caption: ["품목"],	    ref: 'itemCd',		    type:'combo', typeinfo : {ref :'jsonApcItem', label :'itemNm', value: 'itemCd',oneclickedit: true},width:'11.5%', style: 'text-align:center;'},
            /*{caption: ["품종"],	    ref: 'vrtyCd',		    type:'combo', typeinfo :{ref:'jsonApcVrty', label :'vrtyNm', value :'vrtyCd', filtering :{usemode:true, uppercol :'itemCd', attrname :'itemCd'},oneclickedit: true}, width:'11.5%', style: 'text-align:center;'},*/
            {caption: ["품종"],	    ref: 'itemVrtyCd',		    type:'combo',typeinfo :{ref:'jsonApcVrty', label :'vrtyNm', value :'itemVrtyCd', filtering :{usemode:true, uppercol :'itemCd', attrname :'itemCd'},oneclickedit: true}, width:'11.5%', style: 'text-align:center;'},
            {caption: ["창고구분"],	ref: 'warehouseSeCd',	type:'combo', typeinfo : {ref :'jsonWarehouse',label : 'cdVlNm', value :'cdVl',oneclickedit:true}, width:'11.5%', style: 'text-align:center;'},
            {caption: ["재고일자"],	ref: 'invntrYmd',		type:'datepicker', format :{type:'date',rule:'yyyy-mm-dd',origin:'yyyymmdd'},typeinfo :{oneclickedit: true},  width:'11.5%', style: 'text-align:center;'},
            {caption: ["재고순번"],	ref: 'invntrSn',		type:'input',  typeinfo : {mask : {alias :'numeric'}, oneclickedit: true},width:'11.5%', style: 'text-align:center;'},
            {caption: ["수량"],	    ref: 'bssQntt',		    type:'input',  typeinfo : {mask : {alias :'numeric'}, oneclickedit: true},format : {type:'number', rule:'#,###'},width:'11.5%', style: 'text-align:center;'},
            {caption: ["중량"],	    ref: 'bssWght',		    type:'input',  typeinfo : {mask : {alias :'numeric'}, oneclickedit: true},format : {type:'number', rule:'#,###'},width:'11.5%', style: 'text-align:center;'},
        ]
        grdBssInvntr = _SBGrid.create(SBGridProperties);
    }

    const fn_addRow = async function(nRow,nCol){
        const editTableRow = grdBssInvntr.getRowData(nRow, false);
        editTableRow.delYn = "N";
        editTableRow.gubun = "insert";
        grdBssInvntr.addRow(true);
        let mRow = nRow+1;
        grdBssInvntr.setCellDisabled(nRow,0,nRow,grdBssInvntr.getCols() -1 ,false);
        grdBssInvntr.setCellDisabled(mRow,0,mRow,grdBssInvntr.getCols() -1 ,true);//마지막행

    }

    const fn_search = async function(){
        let invntrType = SBUxMethod.get("srch-slt-invntrType");
        let invntrYmd = SBUxMethod.get("srch-slt-bssYmd");

        try{
            let postJsonPromise = gfn_postJSON("/am/trnsf/selectInvntrApcBss.do",{
                apcCd : gv_apcCd,
                invntrSeCd : invntrType,
                invntrYmd : invntrYmd
            });

            let data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            if(data.resultList.length > 0 ){
                jsonBssInvntr.length = 0;


                jsonBssInvntr = data.resultList;
                grdBssInvntr.rebuild();
                let rowLength = data.resultList.length;
                let nRow = grdBssInvntr.getRows();
                let nCol = grdBssInvntr.getCols();
                grdBssInvntr.addRow(true);
                grdBssInvntr.setCellDisabled(1, 0, rowLength, grdBssInvntr.getCols() -3 ,true);
                grdBssInvntr.setCellDisabled(nRow, 0, nRow, grdBssInvntr.getCols() -1 ,true);
            }else{
                jsonBssInvntr.length = 0;
                let nRow = grdBssInvntr.getRows();
                grdBssInvntr.addRow(true);
                grdBssInvntr.setCellDisabled(nRow, 0, nRow, grdBssInvntr.getCols() -1 ,true);
            }

        }catch (e) {
            console.log(e);
        }
    }

    const fn_save = async function(){
        let allData = grdBssInvntr.getGridDataAll();

        try{
            allData = allData.filter((item,index)=>{
                if(gfn_nvl(item.gubun) === ""){
                    item.gubun = "update";
                }
                //item.invntrYmd = item.invntrYmd.split('-').join('');
                item.apcCd = gv_apcCd;
                return item.delYn === 'N'
            });

            allData = allData.map(item => ({...item, vrtyCd : item.itemVrtyCd.substring(4,8)}))

            let postJsonPromise = gfn_postJSON("/am/trnsf/insertInvntrApcBss.do",allData);
            let data = await postJsonPromise;
            if(data.resultSattus == "S"){
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            await fn_search();
        }catch (e) {
            console.log(e);
        }
    }

    const fn_delRow = async function(nRow){
        let rowData = grdBssInvntr.getRowData(nRow);
        if(!gfn_isEmpty(rowData.apcCd)){
            if(!gfn_comConfirm("Q0001","등록된 목록입니다. 삭제")){
                return;
            }
        }else{
            grdBssInvntr.deleteRow(nRow);
            return;
        }

        console.log(rowData);
        let postJsonPromise = gfn_postJSON("/am/trnsf/deleteInvntrApcBss.do",rowData);
        let data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }
        gfn_comAlert("I0001");
        await fn_search();
    }


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>