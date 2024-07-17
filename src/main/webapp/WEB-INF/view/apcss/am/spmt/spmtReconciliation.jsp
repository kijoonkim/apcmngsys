<%
    /**
     * @Class Name : sortPrfmnc.jsp
     * @Description : 대사처리 화면
     * @author SI개발부
     * @since 2024.06.18
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.06.18    손민성	   최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 선별실적조회</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 대사처리 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        text="조회"
                        class="btn btn-sm btn-outline-dark"
                        onclick="fn_search"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <!--[APC] START -->
            <%@ include file="../../../frame/inc/apcSelect.jsp" %>
            <!--[APC] END -->
            <!--[pp] 검색 -->
            <sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
            <!--[pp] 검색 -->
            <table class="table table-bordered tbl_fixed" style="border-top: hidden;margin-bottom: 5px">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg"><span class="data_required" ></span>선별일자</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="srch-dtp-inptYmd"
                                name="srch-dtp-inptYmd"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="form-control input-sm sbux-pik-group-ap input-sm-ast inpt_data_reqed"
                        ></sbux-datepicker>
                    </td>
                </tr>
                </tbody>
            </table>
            <!--[pp] //검색 -->
            <!--[pp] 검색결과 -->
            <div style="display: flex;">
                <div style="flex: 0 45%">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>선별 내역</span>
                                <span style="font-size:12px">(조회건수 <span id="cnt-sort">0</span>건)</span>
                            </li>
                        </ul>
                    </div>
                    <div id="sb-area-grdSortPrfmnc" style="height:544px;"></div>
                </div>
                <div style="flex: 0 10%;display: flex;justify-content: center;align-items: center;flex-direction: column">
                    <sbux-button id="btn_norm" name="btn_norm" uitype="normal" text="보정처리" wrap-style="margin-bottom:5px" onclick="fn_reconciliation">
                    </sbux-button>
<%--                    <sbux-button id="btn_norm1" name="btn_norm1" uitype="normal" text="되돌리기">--%>
<%--                    </sbux-button>--%>
                </div>
                <div style="flex: 0 45%">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>선출하 내역</span>
                                <span style="font-size:12px">(조회건수 <span id="cnt-spmt">0</span>건)</span>
                            </li>
                        </ul>
                    </div>
                    <div id="sb-area-spmtPrfmnc" style="height:544px;"></div>
                </div>
            </div>

            <!--[pp] //검색결과 -->
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    var grdSortPrfmnc; //선별실적
    var jsonSortPrfmnc = []; //선별실적JSON

    var grdSpmtPrfmnc; //출하실적
    var jsonSpmtPrfmnc = []; //출하실적JSON

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    const fn_init = async function() {

        let nowDate = new Date();
        let inptYmd = gfn_dateToYmd(nowDate);

        SBUxMethod.set("srch-dtp-inptYmd", inptYmd);

        /** GRID 생성 **/
        fn_createGridSortPrfmnc();
        fn_creategridSpmtPrfmnc();


    }
    /** 선별실적 그리드 생성 **/
    const fn_createGridSortPrfmnc = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSortPrfmnc';
        SBGridProperties.id = 'grdSortPrfmnc';
        SBGridProperties.jsonref = 'jsonSortPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["선별일자","선별일자"],		ref: 'pckgYmd',     		type:'output',  	width:'90px',	style:'text-align:center',format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["선별번호","선별번호"],		ref: 'pckgSortno', 				type:'output',stlye:'text-align:center'},
            {caption: ["순번","순번"],		ref: 'pckgSortSn', 				type:'output', width: '30px', style:'text-align:center'},
            {caption: ["선별","수량"],  			ref: 'pckgQntt', 			type:'output',  	width:'60px',   style:'text-align:right',format : {type:'number', rule:'#,###'}},
            {caption: ["선별","중량 (Kg)"],  		ref: 'pckgWght', 			type:'output',  	width:'80px',   style:'text-align:right',format : {type:'number', rule:'#,###'}},
            {caption: ["재고","수량"],  			ref: 'invntrQntt', 			type:'output',  	width:'60px',   style:'text-align:right',format : {type:'number', rule:'#,###'}},
            {caption: ["재고","중량 (Kg)"],  		ref: 'invntrWght', 			type:'output',  	width:'80px',   style:'text-align:right',format : {type:'number', rule:'#,###'}},
            {caption: ["품목","품목"],	    		ref: 'itemNm', 				type:'output',  	width:'80px',   style:'text-align:center'},
            {caption: ["품종","품종"],	    		ref: 'vrtyNm', 				type:'output',  	width:'80px',   style:'text-align:center'},
            {caption: ["규격","규격"],  			ref: 'spcfctNm',   			type:'output',  	width:'80px',   style:'text-align:center'},
            {caption: ["등급","등급"],  			ref: 'sortGrdNm', 				type:'output',  	width:'80px',   style:'text-align:center'},
            {caption: ["입고구분","입고구분"], 		ref: 'warehouseSeNm',    		type:'output',  	width:'60px',   style:'text-align:center'},
            {caption: ["상품구분","상품구분"],  		ref: 'gdsSeNm',       		type:'output',  	width:'60px',   style:'text-align:center'},
            {caption: ["저장창고","저장창고"], 		ref: 'warehouseSeNm', 		type:'output',  	width:'80px',	style:'text-align:center'},
        ];
        grdSortPrfmnc = _SBGrid.create(SBGridProperties);
    }

    /** 출하실적 그리드 생성 **/
    const fn_creategridSpmtPrfmnc = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-spmtPrfmnc';
        SBGridProperties.id = 'grdSpmtPrfmnc';
        SBGridProperties.jsonref = 'jsonSpmtPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['출하번호'], 		ref: 'spmtno', 		width: '120px',	type: 'output',	style:'text-align: center'},
            {caption: ['출하일자'], 		ref: 'spmtYmd',		width: '80px',	type: 'output',	style:'text-align: center',
                format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
            {caption: ['수량'], 				ref: 'spmtQntt', 	width: '60px',	type: 'output',	style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['중량 (Kg)'], 		ref: 'spmtWght', 	width: '80px',	type: 'output',	style:'text-align: right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['선별등급'],				ref: 'sortGrdNm',Width: '80px',	type: 'output',	style:'text-align: center'},
            {caption: ['품목'],				ref: 'itemNm', 		width: '80px',	type: 'output',	style:'text-align: center'},
            {caption: ['품종'],				ref: 'vrtyNm', 		width: '80px',	type: 'output',	style:'text-align: center'},
            {caption: ['규격'], 				ref: 'spcfctNm', 	width: '100px',	type: 'output',	style:'text-align: center'},
            {caption: ['등급'], 				ref: 'gdsGrdNm', 	width: '100px',	type: 'output',	style:'text-align: center'},
            {caption: ['상품명'], 			ref: 'spmtPckgUnitNm', 	width: '150px',	type: 'output',	style:'text-align: center'},
            {caption: ['비고'], 			ref: 'rmrk',		width: '250px',	type: 'output',	style:'text-align: center'}
        ];
            grdSpmtPrfmnc = _SBGrid.create(SBGridProperties);
    }
    /** 조회버튼 **/
    const fn_search = async function(){
        /** grid clear **/
        jsonSortPrfmnc.length = 0;
        let inptYmd = SBUxMethod.get("srch-dtp-inptYmd");
        const postJsonPromise = gfn_postJSON("/am/sort/selectSortPrfmncToGdsInvntrList.do", {
            apcCd: gv_selectedApcCd,
            inptYmd: inptYmd,
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonSortPrfmnc.length = 0;
                data.resultList.forEach(function (item) {
                    for (let key in item) {
                        if (item[key] == null) {
                            delete item[key];
                        }
                    }
                });
                data.resultList.forEach((item, index) => {
                    if(item.invntrQntt > 0){
                        jsonSortPrfmnc.push(item);
                    }
                });
                /** 선출하 목록 **/
                jsonSpmtPrfmnc.length = 0;
                data.anotherResultList.forEach(function (item) {
                    for (let key in item) {
                        if (item[key] == null) {
                            delete item[key];
                        }
                    }
                });
                data.anotherResultList.forEach(function(item){
                    const spmtPrfmnc = {
                        spmtno : item.spmtno,
                        spmtYmd : item.spmtYmd,
                        gdsCd : item.gdsCd,
                        gdsGrd : item.gdsGrd,
                        itemCd : item.itemCd,
                        vrtyCd : item.vrtyCd,
                        pckgSn : item.pckgSn,
                        pckgno : item.pckgno,
                        prdcrCd : item.prdcrCd,
                        spcfctCd : item.spcfctCd,
                        spmtPckgUnitCd : item.spmtPckgUnitCd,
                        spmtQntt : item.spmtQntt,
                        spmtSn : item.spmtSn + 1,
                        spmtWght : item.spmtWght,
                        itemNm : item.itemNm,
                        vrtyNm : item.vrtyNm,
                        spcfctNm : item.spcfctNm,
                        spmtPckgUnitNm : item.spmtPckgUnitNm,
                        rmrk : item.rmrk,
                        sortGrdNm : item.sortGrdNm,
                    }
                    jsonSpmtPrfmnc.push(spmtPrfmnc);
                });
                await grdSortPrfmnc.rebuild();
                await grdSpmtPrfmnc.rebuild();

                $("#cnt-sort").text(jsonSortPrfmnc.length);
                $("#cnt-spmt").text(jsonSpmtPrfmnc.length);
            }
        }catch (e){
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_reconciliation = async function(){
        let sortIdx = grdSortPrfmnc.getRow();
        let spmtIdx = grdSpmtPrfmnc.getRow();
        let sortData = grdSortPrfmnc.getRowData(sortIdx);
        let spmtData = grdSpmtPrfmnc.getRowData(spmtIdx);
        /** 선별 > [포장 skip] > 출하 FLOW
         * 선별 내역은 상품으로 처리가 되어있기때문에 출하실적에 담긴 상품정보와
         * 완벽히 일치해야 보정처리가 가능함.**/
        let fields = ["itemCd","vrtyCd","spmtPckgUnitCd","gdsGrd","spcfctCd"];
        let msgs = ["품목 ","품종 ","출하포장단위 ","등급 ","규격 "];

        let flag = fields.some(function(field,idx){
           if(sortData[field] != spmtData[field]){
               let msg = msgs[idx];
               gfn_comAlert("W0006","선별" + msg,"출하" + msg);
               return true;
           }
        });
        if(flag){
            return;
        }

        if(sortData.invntrQntt < spmtData.spmtQntt){
            gfn_comAlert("W0017","상품수량");
            return;
        }

        if(sortData.itemCd != spmtData.itemCd){
            gfn_comAlert("W0006","선별품목","출하품목");
            return;
        }
        let reconciliationData = {
            sortData : {apcCd: gv_apcCd, sortno : sortData.pckgSortno, sortSn : sortData.pckgSortSn},
            spmtData : {...spmtData,apcCd:gv_apcCd},
        };

        try{
            const postJsonPromise = gfn_postJSON("/am/spmt/reconciliationDaliySpmt.do",reconciliationData);
            let data = await postJsonPromise;
            if(data.resultStatus == "S"){
                gfn_comAlert("I0001");
                fn_search();
            }
        }catch (e){
            console.log(e);
        }
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>