<%
    /**
     * @Class Name : rawMtrWrhsRegMbl.jsp
     * @Description : 생산작업 간편등록화면(신선미세상)
     * @author SI개발부
     * @since 2024.10.30
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.10.30   	손민성	    최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>생산작업 간편등록(신선미세상)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>
        .inpt-mbl {
            height: 50px;
            font-size: 3vh;
            line-height: 1.5;
            color: #555;
        }
        .th-mbl {
            text-align: right;
            font-weight: bold;
            font-size: 28px;
        }
        .btn-mbl {
            height: 50px;
            font-size: 24px;
        }
        #latestInfo thead th{
            text-align: center;
            font-weight: bold;
            font-size: 18px;
            background-color: #e8f1f9;
        }
        #latestInfoBody > tr > td {
            -webkit-text-size-adjust: 100%;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
            color: #333;
            font-weight: 400;
            font-family: Notokr, Apple SD Gothic Neo, Arial, Tahoma, sans-serif;
            border-spacing: 0;
            border-collapse: collapse;
            box-sizing: border-box;
            margin: 0;
            font-size: 18px;
            text-align: center;
            word-wrap: break-word;
            border-color: #e8f1f9 !important;
            padding: 3px !important;
            line-height: 1.42857143;
            border: 1px solid #f4f4f4;
            vertical-align: middle;
            border-right: hidden;
        }
        #latestInfoBody > tr:hover{
            background-color : #FFF8DC;
            cursor: pointer;
        }
        #latestInfoBody > tr.active td{
            color:white;
            background-color :rgb(35,83,119);
        }
    </style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex;gap: 10px; flex-direction: column; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물입고등록 태블릿 -->
            </div>
            <div style="display: flex; justify-content: space-between">
                <div>
                    <sbux-button
                            id="btnReset"
                            name="btnReset"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger btn-mbl"
                            onclick="fn_reset"
                            text="초기화"
                    ></sbux-button>
                    <sbux-button
                            id="btnSave"
                            name="btnSave"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger btn-mbl"
                            onclick="fn_save"
                            text="저장"
                    ></sbux-button>
                    <sbux-button
                            id="btnClose"
                            name="btnClose"
                            uitype="normal"
                            text="종료"
                            class="btn btn-sm btn-outline-danger btn-mbl"
                            onclick="fn_close"
                    ></sbux-button>
                </div>
                <div>
                    <sbux-button
                            id="btnCmndDocPckg"
                            name="btnCmndDocPckg"
                            uitype="normal"
                            style="margin-left: auto"
                            class="btn btn-sm btn-primary btn-mbl"
                            onclick="fn_setJobHr"
                            text="작업시간 등록"
                    ></sbux-button>
                </div>
        </div>
        </div>
        <div class="box-body" style="display:flex; gap:15px;justify-content: flex-start;flex-direction: column">
            <table id="saveTable" class="table table-bordered tbl_fixed tbl_mbl">
                <colgroup>
                    <col style="width: 30%">
                    <col style="width: 70%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg th-mbl">
                        <span class="data_required" ></span>팔레트번호
                    </th>
                    <td class="td_input">
                        <div style="display: flex; gap: 10px">
                            <sbux-input
                                    id="dtl-inp-pltno"
                                    name="dtl-inp-pltno"
                                    uitype="text"
                                    wrap-style="flex-basis: 61%"
                                    class="input-sm-ast inpt_data_reqed inpt-mbl srch-pltno"
                                    autocomplete="off"
                                    onblur="fn_ipt_pltno"
                                    onclick="fn_ipt_init"
                            ></sbux-input>
                            <sbux-button
                                    id="dtl-btn-rawMtrInvntr"
                                    name="dtl-btn-rawMtrInvntr"
                                    class="btn btn-sm btn-outline-danger btn-mbl"
                                    text="조회"
                                    uitype="normal"
                                    onclick="fn_searchInvntr"
                            ></sbux-button>
                            <sbux-input
                                    id="dtl-inp-sortno"
                                    name="dtl-inp-sortno"
                                    uitype="text"
                                    wrap-style="display:none"
                            ></sbux-input>
                            <sbux-input
                                    id="dtl-inp-wrhsno"
                                    name="dtl-inp-wrhsno"
                                    uitype="text"
                                    wrap-style="display:none"
                            ></sbux-input>
                            <sbux-input
                                    id="sortSn"
                                    name="sortSn"
                                    uitype="text"
                                    wrap-style="display:none"
                            ></sbux-input>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">품목/품종/생산자</th>
                    <td class="td_input" >
                        <div style="display: flex;gap: 10px">
                            <sbux-input
                                    id="mergeItemNm"
                                    name="mergeItemNm"
                                    uitype="text"
                                    class="inpt-mbl"
                                    wrap-style="flex-basis: calc(60% + 10px)"
                                    readonly>
                            </sbux-input>
                            <sbux-input
                                    id="dtl-inp-itemNm"
                                    name="dtl-inp-itemNm"
                                    uitype="hidden"
                            ></sbux-input>
                            <sbux-input
                                    id="dtl-inp-vrtyNm"
                                    name="dtl-inp-vrtyNm"
                                    uitype="hidden"
                            ></sbux-input>
                            <sbux-input
                                    id="dtl-inp-prdcrNm"
                                    name="dtl-inp-prdcrNm"
                                    uitype="hidden"
                            ></sbux-input>
                            <sbux-input
                                    id="dtl-inp-itemCd"
                                    name="dtl-inp-itemCd"
                                    uitype="hidden"
                            ></sbux-input>
                            <sbux-input
                                    id="dtl-inp-vrtyCd"
                                    name="dtl-inp-vrtyCd"
                                    uitype="hidden"
                            ></sbux-input>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">규격/재고/<span style="color: red">투입</span></th>
                    <td class="td_input">
                        <div style="display: flex; gap: 10px">
                            <sbux-input
                                    id="mergeSpcfctNm"
                                    name="mergeSpcfctNm"
                                    uitype="text"
                                    wrap-style="flex-basis: 30%"
                                    class="inpt-mbl"
                                    placeholder=""
                                    readonly
                            ></sbux-input>
                            <sbux-input
                                    id="dtl-inp-qntt"
                                    name="dtl-inp-qntt"
                                    uitype="text"
                                    wrap-style="flex-basis: 30%"
                                    class="inpt-mbl inpt_data_reqed"
                                    onchange="fn_qnttChange(dtl-inp-qntt)"
                                    placeholder=""
                            ></sbux-input>
                            <sbux-input
                                    id="dtl-inp-rawMtrSpcfctNm"
                                    name="dtl-inp-rawMtrSpcfctNm"
                                    uitype="hidden"
                            ></sbux-input>
                            <sbux-input
                                    id="dtl-inp-invntrQntt"
                                    name="dtl-inp-invntrQntt"
                                    uitype="hidden"
                            ></sbux-input>
                            <sbux-input
                                    id="wght"
                                    name="wght"
                                    uitype="hidden">
                            </sbux-input>
                        </div>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">작업자</th>
                    <td class="td_input">
                        <div style="display: flex; gap: 10px">
                            <sbux-input
                                    id="dtl-inp-flnm"
                                    name="dtl-inp-flnm"
                                    uitype="text"
                                    wrap-style="flex-basis: calc(60% + 10px)"
                                    class="inpt-mbl"
                                    readonly
                            ></sbux-input>
                            <input readonly id="jobMsg" type="text" value="작업중" style="display: none; border:0; color: red;font-size: 28px">
                            <sbux-input
                                    id="dtl-inp-prdcrCd"
                                    name="dtl-inp-prdcrCd"
                                    uitype="hidden"
                            ></sbux-input>
                        </div>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl"><span class="data_required" ></span>작업일자/창고</th>
                    <td class="td_input">
                        <div style="display: flex; gap: 10px">
                            <sbux-datepicker
                                    id="dtl-dtp-inptYmd"
                                    name="dtl-dtp-inptYmd"
                                    uitype="popup"
                                    wrap-style="flex-basis: 30%"
                                    date-format="yyyy-mm-dd"
                                    class="sbux-pik-group-apc input-sm-ast inpt_data_reqed inpt-mbl"
                                    onchange="fn_dtpChange"
                                    style="width:100%;"
                            ></sbux-datepicker>
                            <sbux-select
                                    uitype="single"
                                    id="dtl-slt-warehouseSeCd"
                                    name="dtl-slt-warehouseSeCd"
                                    wrap-style="flex-basis: 30%"
                                    class="input-sm-ast inpt_data_reqed inpt-mbl"
                                    jsondata-ref="jsonComWarehouse">
                            </sbux-select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">상품규격/<span class="data_required"></span>수량</th>
                    <td class="td_input">
                        <div style="display: flex; gap: 10px">
                            <sbux-select
                                    uitype="single"
                                    id="dtl-slt-spcfctCd"
                                    name="dtl-slt-spcfctCd"
                                    wrap-style="flex-basis: 30%"
                                    class="input-sm-ast inpt_data_reqed inpt-mbl"
                                    jsondata-ref="jsonSpcfctCd"
                                    unselected-text="선택"
                                    jsondata-text="spcfctNm"
                                    jsondata-value="spcfctCd">
                            </sbux-select>
                            <sbux-input
                                    id="dtl-inp-sortQntt"
                                    name="dtl-inp-sortQntt"
                                    uitype="text"
                                    wrap-style="flex-basis: 30%"
                                    class="inpt-mbl"
                                    placeholder=""
                            ></sbux-input>
                            <sbux-button
                                    id="btnCmndDocPuckg"
                                    name="btnCmndDocPuckg"
                                    uitype="normal"
                                    class="btn btn-sm btn-outline-danger btn-mbl"
                                    onclick="fn_add"
                                    text="추가"
                            ></sbux-button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
                <table id="latestInfo" class="table table-bordered tbl_fixed tbl_mbl">
                    <colgroup>
                        <col style="width: 5%">
                        <col style="width: 10%">
                        <col style="width: 15%">
                        <col style="width: 10%">
                        <col style="width: 12%">
                        <col style="width: 12%">
                        <col style="width: 12%">
                        <col style="width: 12%">
                        <col style="width: 12%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>처리</th>
                        <th>생산자명</th>
                        <th>팔레트 번호</th>
                        <th>품목</th>
                        <th>투입규격</th>
                        <th>투입수량</th>
                        <th>선별일자</th>
                        <th>상품규격</th>
                        <th>상품수량</th>
                    </tr>
                    </thead>
                    <tbody id="latestInfoBody">

                    </tbody>
                </table>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    /* SB Select */
    var jsonComFclt = [];	// 설비 		SORT_FCLT_CD
    var jsonApcSpcfct = [];	// 규격 		spcfctCd
    var jsonComWarehouse = [];	// 창고			WAREHOUSE_SE_CD
    var jsonSpmtPckgUnit = [];	// 출하포장단위
    // jsonSpmtPckgUnit = await gfn_getSpmtPckgUnits(gv_selectedApcCd, itemCd, vrtyCd);
    var jsonSpmtPckgUnit = [];	// 출하포장단위

    var jsonOptnGrd = [];			//	옵션등급
    var jsonFxngGrd = [];			//	고정등급
    var indctArtclType = [];		//  표시목록 타입

    var jsonApcItem = []; 	// 품목select
    var jsonApcVrty = []; 	// 품종select

    var jsonGrdKnd = []; //상품규격

    var pltnoInfo = {};

    var jsonSave = [];
    var jsonRawMtrInvntr = [];
    var jsonSpcfctCd = [];
    /** 조회 JSON **/
    var jsonSearchList = [];


    window.addEventListener('DOMContentLoaded', function(e) {
        document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
            el.style.width = "50px";
            el.style.height = "50px";
        });
        document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
            el.style.fontsize = "24px";
        });
        SBUxMethod.set("dtl-dtp-inptYmd", gfn_dateToYmd(new Date()));
        fn_initSBSelect();
    });
    const fn_initSBSelect = async function () {
        // 검색 SB select
        let result = await Promise.all([
            gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
            gfn_setComCdSBSelect('dtl-slt-fcltCd', jsonComFclt, 'SORT_FCLT_CD', gv_selectedApcCd),		// 설비
        ]);
    }

    const fn_searchInvntr = async function () {
        jsonSave.length = 0;
        await SBUxMethod.set("dtl-inp-qntt","");
        await SBUxMethod.set("dtl-inp-sortQntt","");

        const pltno = SBUxMethod.get("dtl-inp-pltno");

        if (gfn_isEmpty(pltno)) {
            gfn_comAlert("W0005", "팔레트번호");		//	W0005	{0}이/가 없습니다.
            return;
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/invntr/selectRawMtrInvntr.do", {
                apcCd: gv_selectedApcCd,
                pltno: pltno,
                delYn: 'N',
            });

            const data = await postJsonPromise;
            if(data.resultStatus === 'S'){
                if(!gfn_isEmpty(data.resultMap)) {
                    /** 품목/품종/생산자 취합 **/
                    let mergeItemNm = data.resultMap.itemNm + " / " + data.resultMap.vrtyNm + " / " + data.resultMap.prdcrNm;
                    SBUxMethod.set("mergeItemNm", mergeItemNm);
                    /** 규격/재고 취합 **/
                    let mergeSpcfctNm = data.resultMap.spcfctNm + " / " + data.resultMap.invntrQntt + "개";
                    SBUxMethod.set("mergeSpcfctNm", mergeSpcfctNm);

                    SBUxMethod.set("dtl-inp-wrhsno", data.resultMap.wrhsno);
                    SBUxMethod.set("dtl-inp-invntrQntt", data.resultMap.invntrQntt);
                    SBUxMethod.set("dtl-inp-invntrWght", data.resultMap.invntrWght);
                    SBUxMethod.set("dtl-inp-itemNm", data.resultMap.itemNm);
                    SBUxMethod.set("dtl-inp-itemCd", data.resultMap.itemCd);
                    SBUxMethod.set("dtl-inp-vrtyNm", data.resultMap.vrtyNm);
                    SBUxMethod.set("dtl-inp-vrtyCd", data.resultMap.vrtyCd);
                    SBUxMethod.set("dtl-inp-prdcrCd", data.resultMap.prdcrCd);
                    SBUxMethod.set("dtl-inp-prdcrNm", data.resultMap.prdcrNm);
                    SBUxMethod.set("dtl-inp-rawMtrSpcfctNm", data.resultMap.spcfctNm);
                    if (data.resultMap.flnm) {
                        SBUxMethod.set("dtl-inp-flnm", data.resultMap.flnm);
                        $("#jobMsg").show()
                    } else {
                        SBUxMethod.set("dtl-inp-flnm", "");
                        $("#jobMsg").hide();
                    }
                    SBUxMethod.set("wght", data.resultMap.wght);
                    /** 상품규격 == 원물규격 **/
                    await gfn_setApcSpcfctsSBSelect('dtl-slt-spcfctCd', jsonSpcfctCd, gv_selectedApcCd, data.resultMap.itemCd);

                    await fn_setGrdSelect(data.resultMap.itemCd);
                    await fn_getSortno();
                    /** 하단 table 정보 조회 **/
                    await fn_selectSortPrfmnc();
                }else{
                    fn_reset();
                }
            }

        }catch (e) {
           console.error(e);
        }
    }
    const fn_getSortno = async function(){
        let inptYmd = SBUxMethod.get("dtl-dtp-inptYmd");
        if(gfn_isEmpty(jsonSearchList)){
            const postJsonPromise = gfn_postJSON("/am/sort/selectSortno.do", {
                apcCd: gv_selectedApcCd,
                inptYmd : inptYmd
            });
            const data = await postJsonPromise;
            SBUxMethod.set("dtl-inp-sortno",data.sortno);
        }else{
            SBUxMethod.set("dtl-inp-sortno",jsonSearchList[0].SORTNO);
        }

    }
    const fn_setGrdSelect = async function(_itemCd){
        /** 팔레트번호 조회 후 상품 규격 셋팅 **/
        let postJsonPromise = gfn_postJSON("/am/cmns/selectStdGrdDtlList.do", {apcCd : gv_selectedApcCd, itemCd : _itemCd, grdSeCd : '02', grdKnd : '01'});
        let data = await postJsonPromise;

        jsonGrdKnd = data.resultList;
        SBUxMethod.refresh('dtl-slt-spcfctCd');
    }

    const fn_setJobHr = async function(){
        let pltno = SBUxMethod.get("dtl-inp-pltno");
        if(gfn_isEmpty(pltno)){
            gfn_comAlert("W0005","팔레트번호");
            return;
        }
        /** 선별 순번 **/
        window.parent.cfn_openTabSearch(JSON.stringify({target:"AM_003_022",pltno:pltno}));
    }

    function fn_qnttChange(_value){
        let val = parseInt(_value);
        let invtrQntt = SBUxMethod.get("dtl-inp-invntrQntt");
        if(val > parseInt(invtrQntt)){
            gfn_comAlert("W0008","재고","투입");
            SBUxMethod.set("dtl-inp-qntt",invtrQntt);
        }
        let wght = SBUxMethod.get("wght");
        let wrhsno = SBUxMethod.get("dtl-inp-wrhsno");
        jsonRawMtrInvntr[0] = {inptQntt : val, inptWght : val * parseInt(wght), wrhsno : wrhsno};
    }

    const fn_add = async function(){
        let check = gfn_getTableElement("saveTable","dtl-",["warehouseSeCd","grdCd","flnm"]);
        if(!check){
            return;
        }
        let spcfctNm = SBUxMethod.getText("dtl-slt-spcfctCd");
        let spcfctCd = SBUxMethod.get("dtl-slt-spcfctCd");
        let wght = jsonSpcfctCd.filter((item) => item.spcfctCd === spcfctCd)[0].wght;

        check.apcCd = gv_selectedApcCd;
        check.spcfctNm = spcfctNm;
        check.sortWght = parseInt(check.sortQntt) * parseInt(wght);

        await fn_setSaveTable(check);
    }

    const fn_setSaveTable = async function(item){
            let el = `
           <tr onclick="selectLatestInfo(this)">
           <td>
                <input  type="button" value="삭제" onclick="fn_deleteRow(this, event)" class="btn-primary btn">
            </td>
            <td>
                ${'${item.prdcrNm}'}
            </td>
             <td>
                ${'${item.pltno}'}
            </td>
             <td>
                ${'${item.itemNm}'}${'${item.vrtyNm ? "/" + item.vrtyNm :""}'}
            </td>
             <td>
                ${'${item.rawMtrSpcfctNm ? item.rawMtrSpcfctNm : item.spcfctNm}'}
            </td>
             <td>
                ${'${item.inptQntt ? item.inptQntt : item.qntt}'}
            </td>
             <td>
                ${'${item.inptYmd}'}
            </td>
             <td>
                ${'${item.spcfctNm}'}
            </td>
             <td>
                ${'${item.sortQntt}'}
            </td>
           </tr>
           `;
            $("#latestInfoBody").append(el);
            jsonSave.push(item);
    }
    const fn_save = async function(){
        let wght = SBUxMethod.get("wght");
        let qntt = SBUxMethod.get("dtl-inp-qntt");
        let maxWght = parseInt(wght) * parseInt(qntt);
        let total = 0;
        /** 기존 실적중에 끝 순번 조회 **/
        let max = 0;
        jsonSearchList.forEach(function(item){
            if(max < item.SORT_SN){
                max = item.SORT_SN
            }
        });
        /** 중량기준 초과한도 **/
        jsonSave.forEach(function(item){
            /** wght Validation **/
            total += item.sortWght;
        });
        if(total > maxWght){
            gfn_comAlert("W0008","재고수량","등록수량");
            return;
        }

        jsonSave.forEach(function(item,idx){
           jsonSave[idx].sortSn = idx + max;
           jsonSave[idx].grdCd = "01";
           jsonSave[idx].gdsSeCd = "1"
           jsonSave[idx].wrhsSeCd = "1";
           /** 상품재고 까지 포장Y**/
           jsonSave[idx].autoPckgInptYn = 'Y';
           jsonSave[idx].fcltCd = "01";
           jsonSave[idx].gdsGrd = "01";
           jsonSave[idx].spmtPckgUnitCd = jsonSave[idx].spcfctCd;
           jsonSave[idx].stdGrdList = [{
               grdCd : "01",
               grdKnd : "01",
               grdSeCd : "01",
               itemCd : jsonSave[idx].itemCd
           }];
           jsonSave[idx].gdsStdGrdList = [{
               grdCd : "01",
               grdKnd : "01",
               grdSeCd : "01",
               itemCd : jsonSave[idx].itemCd
           }];
        });

        let sortYmd = SBUxMethod.get('dtl-dtp-inptYmd');
        let sortno = SBUxMethod.get('dtl-inp-sortno');

        /** 기존실적은 제외 **/
        jsonSave = jsonSave.filter(function(item){
            let flag
           jsonSearchList.forEach(function(iner){
               flag = iner.SORTNO === item.sortno && iner.SORT_SN === item.sortSn;
           });
            return !flag;
        });

        const sortMng = {
            apcCd: gv_selectedApcCd,
            sortYmd: sortYmd,
            sortno: sortno,
            rawMtrInvntrList: jsonRawMtrInvntr,
            sortPrfmncList: jsonSave
        }

        let postJsonPromise = gfn_postJSON("/am/sort/insertSortPrfmnc.do", sortMng);
        let data = await postJsonPromise;

        if(data.resultStatus ==='S'){
            gfn_comAlert("I0001");
            await SBUxMethod.set("dtl-inp-qntt","");
            await SBUxMethod.set("dtl-inp-sortQntt","");
            await fn_searchInvntr();
        }
    }
    const fn_reset = function(){
        jsonSave.length = 0;
        $("#latestInfoBody").empty();
        /** 작업시간 등록용 선벌순번 초기화 **/
        SBUxMethod.set("sortSn","");
        jsonGrdKnd.length = 0;
        SBUxMethod.refresh("dtl-slt-spcfctCd");

        let table = document.getElementById("saveTable");
        let elements = table.querySelectorAll('[id^="dtl-"]');
        elements = Array.from(elements);
        for(let element of elements){
            SBUxMethod.set(element.id,"");
        }
        document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
            el.style.width = "50px";
            el.style.height = "50px";
        });
        document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
            el.style.fontSize = "24px";
        });

        SBUxMethod.set("dtl-dtp-inptYmd", gfn_dateToYmd(new Date()));
        /** 작업자 수정 이후 초기화 목록 24.12.09**/
        $("#jobMsg").hide();
        /** 정보없는경우 취합 목록 reset **/
        SBUxMethod.set("mergeItemNm", '');
        SBUxMethod.set("mergeSpcfctNm", '');
    }
    const fn_selectSortPrfmnc = async function(){
        /** 하단 table 정보 조회 **/
        let pltno = SBUxMethod.get("dtl-inp-pltno");
        const postJsonPromise = gfn_postJSON("/am/sort/selectSortPrfmncToPltno.do", {
            apcCd: gv_selectedApcCd,
            pltno: pltno,
            delYn: 'N',
        });

        const data = await postJsonPromise;
        if(data.resultStatus === 'S'){
            $("#latestInfoBody").empty();

            if(data.resultList.length !== 0){
                jsonSearchList = [...data.resultList];
                data.resultList.forEach(function(item,idx){
                    let check = Object.keys(item).reduce((acc,key) => {
                        acc[gfn_snakeToCamel(key)] = item[key];
                        return acc;
                    },{});
                    fn_setSaveTable(check);
                });
                /** 선별번호 발번 취소 **/
                SBUxMethod.set("dtl-inp-sortno",data.resultList[0].SORTNO);
            }
        }

    }
    const selectLatestInfo = async function(element){
        $("#latestInfoBody").find('tr.active').removeClass('active');
        $(element).addClass("active");
        let sortSn = $(element).index() + 1;
        SBUxMethod.set("sortSn",sortSn);
    }
    /** 모바일 WEB 환경에서 숫자패드 노출 처리**/
    const fn_ipt_pltno = function () {
        value = SBUxMethod.get("dtl-inp-pltno");
        if (gfn_isEmpty(value)) return;

        if (value.length <= 3) {
            pltno = 'RT' + gfn_dateToYmd(new Date());

            //RT202411260002
            if (value < 10) {
                pltno = pltno + "000" + value;
            } else if (value < 100) {
                pltno = pltno + "00" + value;
            } else if(value < 1000){
                pltno = pltno + "0" + value;
            } else {
                pltno = pltno + value;
            }
            SBUxMethod.set('dtl-inp-pltno', pltno);
            // SBUxMethod.attr('dtl-inp-pltno', 'type', 'number');
        }
    }

    /**  팔레트번호 입력 간소화 처리 **/
    const fn_ipt_init = function () {
        value = SBUxMethod.get("dtl-inp-pltno");
        if (!gfn_isEmpty(value)) {
            let _date = gfn_dateToYmd(new Date());
            if (_date == value.substr(2, 8)) {
                SBUxMethod.set('dtl-inp-pltno', "")
            }
        }
        // SBUxMethod.attr('dtl-inp-pltno', 'type', 'number');
    }
    const fn_deleteRow = async function(_el,event){
        event.stopPropagation();
        var row = $(_el).closest('tr');
        let idx = row.index();
        let selectObj = {sortno : jsonSave[idx].sortno};
        if(jsonSave[idx].hasOwnProperty("sortSn")){
            if(!gfn_comConfirm("Q0001","저장된 선별실적입니다 삭제")){
                return;
            }
            const sortMng = {
                apcCd: gv_selectedApcCd,
                sortPrfmncList: selectObj
            }

            const postJsonPromise = gfn_postJSON("/am/sort/deleteSortPrfmnc.do", sortMng);
            const data = await postJsonPromise;

            if(date.resultStatus === 'S'){

            }
        }
        jsonSave.splice(idx,1);
        row.remove();
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
