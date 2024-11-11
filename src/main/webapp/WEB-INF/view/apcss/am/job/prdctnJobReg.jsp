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
                            id="btnSearch"
                            name="btnSearch"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger btn-mbl"
                            onclick="fn_search"
                            text="조회"
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
                    <th scope="row" class="th_bg th-mbl">품목/품종</th>
                    <td class="td_input" >
                        <div style="display: flex;gap: 10px">
                            <sbux-input
                                    id="dtl-inp-itemNm"
                                    name="dtl-inp-itemNm"
                                    uitype="text"
                                    class="inpt-mbl"
                                    wrap-style="flex-basis: 30%"
                                    unselected-text="선택"
                                    readonly
                            ></sbux-input>
                            <sbux-input
                                    id="dtl-inp-vrtyNm"
                                    name="dtl-inp-vrtyNm"
                                    uitype="text"
                                    class="inpt-mbl"
                                    wrap-style="flex-basis: 30%"
                                    unselected-text="선택"
                                    readonly
                            ></sbux-input>
                            <sbux-input
                                    id="dtl-inp-itemCd"
                                    name="dtl-inp-itemCd"
                                    uitype="text"
                                    wrap-style="flex-basis: 30%; display:none"
                            ></sbux-input>
                            <sbux-input
                                    id="dtl-inp-vrtyCd"
                                    name="dtl-inp-vrtyCd"
                                    uitype="text"
                                    wrap-style="flex-basis: 30%; display:none"
                            ></sbux-input>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">원물규격/<span style="color: red">재고수량</span>/<span style="color: red">투입수량</span></th>
                    <td class="td_input">
                        <div style="display: flex; gap: 10px">
                            <sbux-input
                                    id="dtl-inp-rawMtrSpcfctNm"
                                    name="dtl-inp-rawMtrSpcfctNm"
                                    uitype="text"
                                    wrap-style="flex-basis: 30%"
                                    class="inpt-mbl"
                                    placeholder=""
                                    readonly
                            ></sbux-input>
                        <sbux-input
                                id="dtl-inp-invntrQntt"
                                name="dtl-inp-invntrQntt"
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
                                    wrap-style="flex-basis: 15%"
                                    class="inpt-mbl inpt_data_reqed"
                                    onchange="fn_qnttChange(dtl-inp-qntt)"
                                    placeholder=""
                            ></sbux-input>
                        </div>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">생산자</th>
                    <td class="td_input">
                        <div style="display: flex; gap: 10px">
                            <sbux-input
                                    id="dtl-inp-prdcrNm"
                                    name="dtl-inp-prdcrNm"
                                    uitype="text"
                                    wrap-style="flex-basis: 30%"
                                    class="inpt-mbl"
                                    placeholder=""
                                    readonly
                            ></sbux-input>
                            <sbux-input
                                    id="dtl-inp-prdcrCd"
                                    name="dtl-inp-prdcrCd"
                                    uitype="text"
                                    wrap-style="flex-basis: 30%; display:none"
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
                                    jsondata-ref="jsonGrdKnd"
                                    unselected-text="선택"
                                    jsondata-text="grdNm"
                                    jsondata-value="grdCd">
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
                        <col style="width: 10%">
                        <col style="width: 15%">
                        <col style="width: 10%">
                        <col style="width: 13%">
                        <col style="width: 13%">
                        <col style="width: 13%">
                        <col style="width: 13%">
                        <col style="width: 13%">
                    </colgroup>
                    <thead>
                    <tr>
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

                await fn_setGrdSelect(data.resultMap.itemCd);
                await fn_getSortno();
                /** 하단 table 정보 조회 **/
                await fn_selectSortPrfmnc();
            }

        }catch (e) {
           console.error(e);
        }
    }
    const fn_getSortno = async function(){
        let inptYmd = SBUxMethod.get("dtl-dtp-inptYmd");
        const postJsonPromise = gfn_postJSON("/am/sort/selectSortno.do", {
            apcCd: gv_selectedApcCd,
            inptYmd : inptYmd
        });
        const data = await postJsonPromise;
        SBUxMethod.set("dtl-inp-sortno",data.sortno);
    }
    const fn_setGrdSelect = async function(_itemCd){
        /** 팔레트번호 조회 후 상품 규격 셋팅 **/
        let postJsonPromise = gfn_postJSON("/am/cmns/selectStdGrdDtlList.do", {apcCd : gv_selectedApcCd, itemCd : _itemCd, grdSeCd : '03', grdKnd : '01'});
        let data = await postJsonPromise;

        jsonGrdKnd = data.resultList;
        SBUxMethod.refresh('dtl-slt-spcfctCd');


    }

    const fn_search = async function(){

    }

    const fn_setJobHr = async function(){
        let pltno = SBUxMethod.get("dtl-inp-pltno");
        let sortno = SBUxMethod.get("dtl-inp-sortno");
        let sortSn = SBUxMethod.get("sortSn");
        if(gfn_isEmpty(pltno)){
            gfn_comAlert("W0005","팔레트번호");
            return;
        }
        if(gfn_isEmpty(sortSn)){
            gfn_comAlert("W0005","선택된 선별내역");
            return;
        }

        /** 선별 순번 **/

        window.parent.cfn_openTabSearch(JSON.stringify({target:"AM_003_022",pltno:pltno,sortno:sortno,sortSn:sortSn}));
    }

    function fn_qnttChange(_value){
        let val = parseInt(_value);
        let invtrQntt = SBUxMethod.get("dtl-inp-invntrQntt");
        if(val > parseInt(invtrQntt)){
            gfn_comAlert("W0008","재고","투입");
            SBUxMethod.set("dtl-inp-qntt",invtrQntt);
        }
    }

    const fn_add = async function(){
        let check = gfn_getTableElement("saveTable","dtl-",["warehouseSeCd","grdCd"]);
        if(!check){
            return;
        }
        let spcfctNm = SBUxMethod.getText("dtl-slt-spcfctCd");

        check.apcCd = gv_selectedApcCd;
        check.spcfctNm = spcfctNm;

        fn_setSaveTable(check);
    }

    const fn_setSaveTable = async function(item){
            let el = `
           <tr onclick="selectLatestInfo(this)">
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
                ${'${item.invntrQntt ? item.invntrQntt : item.sortQntt}'}
            </td>
             <td>
                ${'${item.inptYmd}'}
            </td>
             <td>
                ${'${item.grdNm ? item.grdNm : item.spcfctNm}'}
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

        jsonSave.forEach(function(item,idx){
            let spcfctCd = item.spcfctCd;
           jsonSave[idx].sortSn = idx;
           jsonSave[idx].grdCd = spcfctCd;
            let matchedItem = jsonGrdKnd.filter((item) => item.grdCd === spcfctCd)[0];
           jsonSave[idx].gdsSeCd =  matchedItem ? parseInt(matchedItem.grdSeCd) : null;
           jsonSave[idx].wrhsSeCd = "1";
        });
        let sortYmd = SBUxMethod.get('dtl-dtp-inptYmd');
        let sortno = SBUxMethod.get('dtl-inp-sortno');

        /** 재고 점프 *s*/
        jsonSave[0].prcsType = 'RR';

        const sortMng = {
            apcCd: gv_selectedApcCd,
            sortYmd: sortYmd,
            sortno: sortno,
            rawMtrInvntrList: jsonSave,
            sortPrfmncList: jsonSave
        }

        let postJsonPromise = gfn_postJSON("/am/sort/insertSortPrfmnc.do", sortMng);
        let data = await postJsonPromise;

        if(data.resultStatus ==='S'){
            fn_reset();
        }
    }
    const fn_reset = function(){
        jsonSave.length = 0;
        $("#latestInfoBody").empty();
        /** 작업시간 등록용 선벌순번 초기화 **/
        SBUxMethod.set("sortSn","");

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
    const fn_ipt_pltno = function(){
        SBUxMethod.set("sortSn","");
        $("#latestInfoBody").empty();
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
