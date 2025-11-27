<%@ page import="java.util.Map" %>
<%
    /**
     * @Class Name : sprtBizRsltInq.jsp
     * @Description : 지원사업현황 조회 화면
     * @author SI개발부
     * @since 2025.11.03
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2025.11.03   	김현중			최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 지원사업현황조회</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>

<style>
    .form-control{width:95%;}
</style>

<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;" >
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 지원사업내역 -->
                </div>
                <div style="margin-left: auto;">
                    <sbux-button
                            id="btnDwnld"
                            name="btnDwnld"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_dwnld"
                            text="서식받기"
                    ></sbux-button>
                    <sbux-button
                            id="btnUld"
                            name="btnUld"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_uld"
                            text="올리기"
                    ></sbux-button>
                    <sbux-button
                            id="btnReset"
                            name="btnReset"
                            uitype="normal"
                            class="btn btn-sm btn-primary"
                            onclick="fn_reset"
                            text="초기화"
                    ></sbux-button>
                    <sbux-button
                            id="btnSearch"
                            name="btnSearch"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_search"
                            text="조회"
                    ></sbux-button>
                </div>
            </div>

            <div class="box-body srch-keyup-area">
                <sbux-input id="dtl-inp-wghno" name="dtl-inp-wghno" uitype="hidden"></sbux-input>
                <sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
                <table class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 7%">
                        <col style="width: 6%">
                        <col style="width: 2%">
                        <col style="width: 5%">
                        <col style="width: 2%">

                        <col style="width: 7%">
                        <col style="width: 4%">
                        <col style="width: 2%">
                        <col style="width: 3%">
                        <col style="width: 3%">
                        <col style="width: 3%">

                        <col style="width: 7%">
                        <col style="width: 6%">
                        <col style="width: 3%">
                        <col style="width: 3%">
                        <col style="width: 3%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">사업구분</th>
                        <td colspan="4" class="td_input" style="border-right:hidden;" >
                            <sbux-select
                                    id="srch-slt-sprtBizNm"
                                    name="srch-slt-sprtBizNm"
                                    uitype="single"
                                    jsondata-ref="jsonBizSeCd"
                                    class="form-control input-sm"
                                    unselected-text="전체"
                                    wrap-style="width:95%;"
                                    onchange="fn_selectItem(event)"
                            ></sbux-select>
                        </td>
                        <th scope="row" class="th_bg">지원사업연도</th>
                        <td colspan="5" class="td_input"style="border-right: hidden;">
                            <sbux-spinner
                                    uitype="normal"
                                    id="srch-dtp-crtrYmd"
                                    name="srch-dtp-crtrYmd"
                                    placeholder="yyyy"
                                    step-value="1"
                                    number-max-value="9999"
                                    number-mix-value="0"
                                    wrap-style="width:95%;"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed"
                            ></sbux-spinner>
                        </td>
                        <th scope="row" class="th_bg">지원연도</th>
                        <td colspan="4" class="td_input"style="border-right: hidden;">
                            <sbux-spinner
                                    uitype="normal"
                                    id="srch-dtp-sprtYmd"
                                    name="srch-dtp-sprtYmd"
                                    placeholder="yyyy"
                                    step-value="1"
                                    number-max-value="9999"
                                    number-min-value="0"
                                    wrap-style="width:95%;"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed"
                            ></sbux-spinner>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">법인명</th>
                        <td colspan="4" class="td_input" style="border-right:hidden;">
                            <sbux-input
                                    id="srch-inp-bzmnConm"
                                    name="srch-inp-bzmnConm"
                                    uitype="text"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td colspan="11"></td>
<%--
                        <th scope="row" class="th_bg">법인번호</th>
                        <td colspan="5" class="td_input" style="border-right:hidden;">
                            <sbux-input
                                    id="srch-inp-crno"
                                    name="srch-inp-crno"
                                    uitype="text"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">사업자번호</th>
                        <td colspan="4" class="td_input" >
                            <sbux-input
                                    id="srch-inp-brno"
                                    name="srch-inp-brno"
                                    uitype="text"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
--%>

                    </tbody>
                </table>

                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>지원사업 목록</span>
                            <span style="font-size:12px">(조회건수 <span id="sprtBizTotal">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-grdSprtBiz" style="height:560px;"></div>
                </div>
            </div>
        </div>


        <!-- 엑셀 양식 -->
        <div class="exp-div-excel" style="display: none;width: 1000px;">
            <div id="sbexp-area-grdExpSprtBiz" style="height:1px; width: 100%;"></div>
            <div id="sbexp-area-grdExpSprtBizNm" style="height:1px; width: 100%;"></div>
        </div>

    </section>

    <!-- 엑셀 import 등록 Modal -->
    <div>
        <sbux-modal
                id="modal-imp"
                name="modal-imp"
                uitype="middle"
                header-title="재고등록(Excel)"
                body-html-id="body-modal-imp"
                footer-is-close-button="false"
                header-is-close-button="false"
                style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-imp">
        <jsp:include page="../../am/popup/importExcelPopup.jsp"></jsp:include>
    </div>

    <!-- 경영체 조회 팝업 -->
    <div>
        <sbux-modal
                id="modal-mngmstInfoId"
                name="modal-mngmstInfoId"
                uitype="middle"
                header-title="경영체번호 선택"
                body-html-id="body-modal-mngmstInfoId"
                footer-is-close-button="false"
                style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-mngmstInfoId">
        <jsp:include page="/WEB-INF/view/apcss/fm/popup/MngmstInfoIdPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">

    var reqColor              = '#FFF8DC';  // 필수값 색깔
    var errColor              = '#FF6060';  // 에러 색깔

    var grdSprtBiz;                         // 지원사업 목록 그리드
    var grdExpSprtBiz;		                // 산지지원사업내역 엑셀 그리드
    var grdExpSprtBizNm;                    // 지원사업명 엑셀 그리드

    var jsonSprtBiz           = [];         // 지원사업 목록 그리드 데이터
    var jsonBizSeCd           = [];         // 사업구분 콤보박스 데이터

    var jsonExpSprtBiz        = [];         // 엑셀 데이터
    var jsonExpSprtBizSeCd    = [];         //

    var setImpBrno            = [];         // 법인번호 데이터
    var setImpCrno            = [];         // 사업자번호 데이터
    var setImpSprtBizNm       = [];         // 지원사업명 데이터

    var sprtBizNmFilterData   = [];         // import 콤보박스 지원사업명 데이터 - 부모(code)
    var sprtBizYrFilterData   = [];         // import 콤보박스 지원사업연도 데이터 - 자식(code)

    var flag = true;
    var confirmFlag = true;

    const fn_initSBSelect = async function() {
        await Promise.all([
            fn_setSprtBizSeCdSelect('srch-slt-sprtBizNm', jsonBizSeCd)
        ]);
        fn_setYr();
        fn_setJsonBizSeCdYr();
    }


    window.addEventListener('DOMContentLoaded', function(e) {
        fn_createGrdSprtBiz();
        fn_initSBSelect();
    });


    // 사업구분 콤보박스 데이터 세팅
    const fn_setSprtBizSeCdSelect = async function (_targetIds, _jsondataRef, _apcCd) {

        const postJsonPromise = gfn_postJSON("/pd/sprt/selectSprtBizRsltInqSeCd.do", {}, null, true);
        const data = await postJsonPromise;

        const sourceJson = [];
        data.resultList.forEach((item) => {
            item.cmnsNm = item.sprtBizNm;
            item.cmnsCd = item.sprtBizCd;

            sourceJson.push(item);
        });

        gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
    }


    // 지원사업연도 데이터 세팅
    async function fn_setYr() {

        SBUxMethod.set('srch-dtp-crtrYmd', gfn_dateToYear(new Date()));
        SBUxMethod.set('srch-dtp-sprtYmd', gfn_dateToYear(new Date()));


        let maxDate = 0;
        let minDate = 9999;
        let cnt = jsonBizSeCd.length;

        for(let i = 0; i < cnt; i++) {
            if( jsonBizSeCd[i].sprtBizYrMax > maxDate ) {
                maxDate = jsonBizSeCd[i].sprtBizYrMax;
            }
            if( jsonBizSeCd[i].sprtBizYrMin < minDate ) {
                minDate = jsonBizSeCd[i].sprtBizYrMin;
            }
        }

        SBUxMethod.attr("srch-dtp-crtrYmd", "number-max-value", maxDate);
        SBUxMethod.attr("srch-dtp-crtrYmd", "number-min-value", minDate);

/*
        let setData = minDate + ',' + maxDate;

        SBUxMethod.set("srch-dtp-crtrYmd", setData);

        SBUxMethod.setDatepickerMinDate('srch-dtp-crtrYmd', minDate);
        SBUxMethod.setDatepickerMaxDate('srch-dtp-crtrYmd', maxDate);
*/

    }


    async function fn_setJsonBizSeCdYr() {

        let cnt = jsonBizSeCd.length;
        let yearList;

        // 최소, 최댓값 범위 안 연도 담기
        for(let i = 0; i < cnt; i++) {
            yearList = [];

            for(let j = jsonBizSeCd[i].sprtBizYrMin; j <= jsonBizSeCd[i].sprtBizYrMax; j++) {
                yearList.push(String(j));
            }
            jsonBizSeCd[i].sprtBizYr = yearList;
        }


        var bizNmDupCheck = {};
        var yrDupCheck = {};

        jsonBizSeCd.forEach((row) => {
            if(!bizNmDupCheck[row.sprtBizCd]){
                sprtBizNmFilterData.push({
                    label: row.sprtBizNm,
                    value: row.sprtBizNm
                });
                bizNmDupCheck[row.sprtBizCd] = true;
            }
            row.sprtBizYr.forEach((yr) => {
                var key = row.sprtBizNm + '_' + yr;
                if(yrDupCheck[key]) return;

                sprtBizYrFilterData.push({
                    label: yr,
                    value: yr,
                    code: row.sprtBizNm
                });
                yrDupCheck[key] = true;
            })
        });

    }

    // 사업구분 선택 시 지원사업연도 최소 최대값 세팅
    async function fn_selectItem(e) {


/*        const postJsonPromise = gfn_postJSON("/pd/sprt/selectSprtBizRsltInqSeCd.do", {}, null, true);
        const data = await postJsonPromise;*/

        let idx = e.target.selectedIndex;
        let cnt = jsonBizSeCd.length;
        let sysDate = gfn_dateToYear(new Date());

        if(idx != 0) {
            let strYr = jsonBizSeCd[idx-1].sprtBizYrMin;
            let endYr = jsonBizSeCd[idx-1].sprtBizYrMax;

            SBUxMethod.attr("srch-dtp-crtrYmd", "number-max-value", endYr);
            SBUxMethod.attr("srch-dtp-crtrYmd", "number-min-value", strYr);

            if(endYr < sysDate) {
                SBUxMethod.set("srch-dtp-crtrYmd", endYr);
            }else {
                SBUxMethod.set("srch-dtp-crtrYmd", sysDate);
            }
/*
            let setYr = strYr + ',' + endYr;

            SBUxMethod.set("srch-dtp-crtrYmd", setYr);

            SBUxMethod.setDatepickerMinDate('srch-dtp-crtrYmd', strYr);
            SBUxMethod.setDatepickerMaxDate('srch-dtp-crtrYmd', endYr);
*/

        }else {
            let maxDate = 0;
            let minDate = 9999;

            for(let i = 0; i < cnt; i++) {
                if( jsonBizSeCd[i].sprtBizYrMax > maxDate ) {
                    maxDate = jsonBizSeCd[i].sprtBizYrMax;
                }
                if( jsonBizSeCd[i].sprtBizYrMin < minDate ) {
                    minDate = jsonBizSeCd[i].sprtBizYrMin;
                }
            }

            SBUxMethod.attr("srch-dtp-crtrYmd", "number-max-value", maxDate);
            SBUxMethod.attr("srch-dtp-crtrYmd", "number-min-value", minDate);

            if(maxDate < sysDate) {
                SBUxMethod.set("srch-dtp-crtrYmd", maxDate);
            }else {
                SBUxMethod.set("srch-dtp-crtrYmd", sysDate);
            }

/*
            let setData = minDate + ',' + maxDate;

            SBUxMethod.set("srch-dtp-crtrYmd", setData);

            SBUxMethod.setDatepickerMinDate('srch-dtp-crtrYmd', minDate);
            SBUxMethod.setDatepickerMaxDate('srch-dtp-crtrYmd', maxDate);
*/
        }

    }

/*
    function bzmnConmClick(){
        SBUxMethod.openModal('modal-mngmstInfoId');
    }
*/



    const fn_reset = async function(){
        SBUxMethod.set('srch-slt-sprtBizNm', "");
        SBUxMethod.set("srch-dtp-crtrYmd", gfn_dateToYear(new Date()));
        SBUxMethod.set('srch-dtp-sprtYmd', gfn_dateToYear(new Date()));
        SBUxMethod.set('srch-inp-bzmnConm', "");
    }


    // 페이지 로드 시 그리드 생성
    function fn_createGrdSprtBiz() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSprtBiz';
        SBGridProperties.id = 'grdSprtBiz';
        SBGridProperties.jsonref = 'jsonSprtBiz';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.contextmenu = true;
        SBGridProperties.contextmenulist = objMenuList;
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.fixedrowheight = '37';
/*
        SBGridProperties.paging = {
            'type' : 'page',
            'count' : 5,
            'size' : 40,
            'sorttype' : 'page',
            'showgoalpageui' : true
        };
*/
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.columns = [
            {caption: ["지원사업<br/>연도"],	ref: 'sprtBizYr', type:'output',  width:'70px',  style:'text-align:center'},
            {caption: ["지원사업명"],	        ref: 'sprtBizNm', type:'output',  width:'200px', style:'text-align:left'},
            {caption: ["법인명"],	        ref: 'bzmnConm',  type:'output',  width:'240px', style:'text-align:left'},
            {caption: ["법인번호"],	        ref: 'crno',      type:'output',  width:'100px', style:'text-align:left'},
            {caption: ["사업자번호"],	        ref: 'brno',      type:'output',  width:'80px',  style:'text-align:left'},
            {caption: ["시도"],	            ref: 'stdgCtpvCd',type:'output',  width:'100px',  style:'text-align:center'},
            {caption: ["시군구"],	        ref: 'stdgSggCd', type:'output',  width:'110px',  style:'text-align:center'},
            {caption: ["선정<br/>연도"],	    ref: 'slctnYr',   type:'output',  width:'50px',  style:'text-align:center'},
            {caption: ["지원<br/>연도"],	    ref: 'sprtYr',    type:'output',  width:'50px',  style:'text-align:center'},
            {
                caption: ["배정금액<br/>(천원)"],
                ref: 'altmntAmt',
                type:'output',
                width:'70px',
                style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}},
                format : {
                    type:'number',
                    rule:'#,###  '
                }
            },
            {
                caption: ["자부담"],
                ref: 'onslfBrdnAmt',
                type:'output',
                width:'70px',
                style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}},
                format : {
                    type:'number',
                    rule:'#,###  '
                }
            },
            {
                caption: ["배정이자<br/>(%)"],
                ref: 'altmntInt',
                type:'output',
                width:'70px',
                style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}},
                format : {
                    type:'number',
                    rule:'#,###  '
                }
            },
            {caption: ["비고"],			ref: 'rmrk',     type:'output',  width:'275px',    style:'text-align:left'},
            {caption: ["품목"],		    ref: 'itemCd',	 type:'output',  width:'100px',     style:'text-align:center'},
            {caption: ["사업</br>유형"],	ref: 'bizType',	 type:'output',  width:'50px',     style:'text-align:center'},


        ];
        grdSprtBiz = _SBGrid.create(SBGridProperties);
        //grdSprtBiz.bind("afterpagechanged" , fn_pagingGrdSprtBiz);
    }


    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			    //컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld,			//콜백함수명
        }
    };

    function fn_excelDwnld() {
        const today = gfn_dateToYmd(new Date());
        grdSprtBiz.exportLocalExcel(
            "지원사업_"+today, {
                bSaveLabelData: true,
                bNullToBlank: true,
                bSaveSubtotalValue: true,
                bCaptionConvertBr: true,
                arrSaveConvertText: true
            });
    }
    // 페이징
/*
    const fn_pagingGrdSprtBiz = async function() {
        let recordCountPerPage = grdSprtBiz.getPageSize();
        let currentPageNo = grdSprtBiz.getSelectPageIndex();
        fn_setGrdSprtBiz(recordCountPerPage, currentPageNo);
    }
*/

    // 조회 버튼 클릭 시 실행
    const fn_search = async function() {

/*
        let crtrYmdFrom = SBUxMethod.get("srch-dtp-crtrYmd_from");   // 기준연도 시작일자
        let crtrYmdTo = SBUxMethod.get("srch-dtp-crtrYmd_to");       // 기준연도 종료일자
        let sprtYmdFrom = SBUxMethod.get("srch-dtp-sprtYmd_from");   // 지원연도 시작일자
        let sprtYmdTo = SBUxMethod.get("srch-dtp-sprtYmd_to");       // 지원연도 종료일자
*/
/*

        if (!gfn_isEmpty(crtrYmdFrom)) {
            if (gfn_isEmpty(crtrYmdTo)) {
                gfn_comAlert("W0001", "기준연도");		//	W0001	{0}을/를 선택하세요.
                return;
            }
        }
        if (!gfn_isEmpty(crtrYmdTo)) {
            if (gfn_isEmpty(crtrYmdFrom)) {
                gfn_comAlert("W0001", "기준연도");		//	W0001	{0}을/를 선택하세요.
                return;
            }
        }

        if (!gfn_isEmpty(sprtYmdFrom)) {
            if (gfn_isEmpty(sprtYmdTo)) {
                gfn_comAlert("W0001", "지원연도");		//	W0001	{0}을/를 선택하세요.
                return;
            }
        }
        if (!gfn_isEmpty(sprtYmdTo)) {
            if (gfn_isEmpty(sprtYmdFrom)) {
                gfn_comAlert("W0001", "지원연도");		//	W0001	{0}을/를 선택하세요.
                return;
            }
        }
*/

        grdSprtBiz.rebuild();
        let pageSize = grdSprtBiz.getPageSize();
        let pageNo = 1;

        jsonSprtBiz.length = 0;
        grdSprtBiz.clearStatus();
        fn_setGrdSprtBiz(pageSize, pageNo);
    }


    // 지원사업 목록 그리드 세팅
    const fn_setGrdSprtBiz = async function(pageSize, pageNo) {

        let sprtBizSe = SBUxMethod.get("srch-slt-sprtBizNm");       // 사업구분
        let crtrYmdFrom = SBUxMethod.get("srch-dtp-crtrYmd_from");  // 기준연도 시작일자
        let crtrYmdTo = SBUxMethod.get("srch-dtp-crtrYmd_to");      // 기준연도 종료일자
        let sprtYmdFrom = SBUxMethod.get("srch-dtp-sprtYmd_from");  // 지원연도 시작일자
        let sprtYmdTo = SBUxMethod.get("srch-dtp-sprtYmd_to");      // 지원연도 종료일자
        let bzmnConm = SBUxMethod.get("srch-inp-bzmnConm");         // 법인명
        let crno = SBUxMethod.get("srch-inp-crno");                 // 법인번호
        let brno = SBUxMethod.get("srch-inp-brno");                 // 사업자번호


        try{
            let totalRecordCount = 0;

            let postUrl = "/pd/sprt/selectSprtBizRsltInqList.do";
            let postJsonPromise = gfn_postJSON(postUrl, {
                 sprtBizSe           : sprtBizSe
               , crtrYmdFrom         : crtrYmdFrom
               , crtrYmdTo           : crtrYmdTo
               , sprtYmdFrom         : sprtYmdFrom
               , sprtYmdTo           : sprtYmdTo
               , bzmnConm            : bzmnConm
               , crno                : crno
               , brno                : brno

                 //페이징
/*
               , pagingYn            : 'Y'
               , currentPageNo       : pageNo
               , recordCountPerPage  : pageSize
*/
            });

            let data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }

            jsonSprtBiz.length = 0;
            data.resultList.forEach((item, index) => {
                const sprtBizVO = {
                    sprtBizYr       : item.sprtBizYr
                  , sprtBizNm       : item.sprtBizNm
                  , bzmnConm        : item.bzmnConm
                  , brno            : item.brno
                  , crno            : item.crno
                  , stdgCtpvCd      : item.stdgCtpvCd
                  , stdgSggCd       : item.stdgSggCd
                  , slctnYr         : item.slctnYr
                  , sprtYr          : item.sprtYr
                  , altmntAmt       : item.altmntAmt
                  , altmntInt       : item.altmntInt
                  , rmrk            : item.rmrk
                  , itemCd          : item.itemCd
                  , bizType         : item.bizType
                  , onslfBrdnAmt    : item.onslfBrdnAmt
                  , rowSeq          : item.rowSeq
                }
                jsonSprtBiz.push(sprtBizVO);

                if (index === 0) {
                    totalRecordCount = item.totalRecordCount;
                }
            });
            if (jsonSprtBiz.length > 0) {
                if(grdSprtBiz.getPageTotalCount() != totalRecordCount) {	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
                    grdSprtBiz.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
                    grdSprtBiz.rebuild();
                }else{
                    grdSprtBiz.refresh();
                }
            } else {
                grdSprtBiz.setPageTotalCount(totalRecordCount);
                grdSprtBiz.rebuild();
            }
            document.querySelector('#sprtBizTotal').innerText = totalRecordCount;

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }


    // 서식받기 시트 1번 그리드
    const fn_getExpGrdSheet = function() {
        const _columns = [];
        _columns.push(
            {caption: ["번호"], 	        ref: 'rowSeq',	  type:'output',  width:'100px',  style:'text-align:center'},
            {caption: ["법인명"], 	    ref: 'bzmnConm',  type:'output',  width:'100px',  style:'text-align:center; background-color:#FFF8DC;'},
            {caption: ["법인번호"],	    ref: 'crno',      type:'output',  width:'100px',  style:'text-align:left; background-color:#FFF8DC;'},
            {caption: ["사업자번호"],     ref: 'brno',	  type:'output',  width:'100px',  style:'text-align:center; background-color:#FFF8DC;'},
            {caption: ["선정연도"],	    ref: 'slctnYr',   type:'output',  width:'100px',  style:'text-align:center'},
            {caption: ["지원사업연도"],	ref: 'sprtYr',    type:'output',  width:'100px',  style:'text-align:center; background-color:#FFF8DC;'},
            {caption: ["지원사업명"],	    ref: 'sprtBizNm', type:'output',  width:'100px',  style:'text-align:left; background-color:#FFF8DC;'},
            {
                caption: ["배정금액(천원)"],
                ref: 'altmntAmt',
                type:'output',
                width:'100px',
                style:'text-align:right; background-color:#FFF8DC;',
                typeinfo : {mask : {alias : 'numeric'}},
                format : {
                    type:'number',
                    rule:'#,###  '
                }
            },
            {
                caption: ["자부담(천원)"],
                ref: 'onslfBrdnAmt',
                type:'output',
                width:'100px',
                style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}},
                format : {
                    type:'number',
                    rule:'#,###  '
                }
            },
            {
                caption: ["배정이자(%)"],
                ref: 'altmntInt',
                type:'output',
                width:'100px',
                style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}},
                format : {
                    type:'number',
                    rule:'#,###  '
                }
            },
            {caption: ["비고"],		ref: 'rmrk',     type:'output',  width:'100px',    style:'text-align:left'},
            {caption: ["품목"],		ref: 'itemCd',	 type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["사업유형"],	ref: 'bizType',	 type:'output',  width:'100px',    style:'text-align:center'},
        );
        return _columns;
    }


    // 서식받기 시트 2번 그리드
    const fn_getExpGrdSheet2 = function() {
        const _columns = [];
        _columns.push(
            {caption: ["코드"],      ref: 'sprtBizCd',	type:'output',  width:'100px',    style:'text-align:center'},
            {caption: ["지원사업명"],	ref: 'sprtBizNm',   type:'output',  width:'300px',    style:'text-align:left'},
        );
        return _columns;
    }


/*
    const fn_setSprtBizJson = async function() {
        jsonExpSprtBiz = gfn_cloneJson(jsonSprtBiz);
    }
*/

    const fn_setBizSeCdJson = async function() {
        jsonExpSprtBizSeCd = gfn_cloneJson(jsonBizSeCd);
    }


    //서식 다운로드
    const fn_dwnld = async function(){

        //await fn_setSprtBizJson();
        await fn_setBizSeCdJson();

        const expSheet = fn_getExpGrdSheet();
        const expSheet2 = fn_getExpGrdSheet2();
        const expObjList = [

            {
                sbGrid: grdExpSprtBiz,
                parentid: "sbexp-area-grdExpSprtBiz",
                id: "grdExpSprtBiz",
                jsonref: "jsonExpSprtBiz",
                columns: expSheet,
                sheetName: "산지지원사업내역",
                title: "",
                unit: ""
            }
          , {
                sbGrid: grdExpSprtBizNm,
                parentid: "sbexp-area-grdExpSprtBizNm",
                id: "grdExpSprtBizNm",
                jsonref: "jsonExpSprtBizSeCd",
                columns: expSheet2,
                sheetName: "지원사업명",
                title: "",
                unit: ""
            }

        ];

        await fn_createExpGrid(expObjList); // fn_createExpGrid함수에 expObjList를 담아서 보내주는 코드
        let fileName = "산지조직지원내역(샘플).xlsx"
        fn_exportExcelMulti(fileName, expObjList); // gfn_exportExcelMulti함수에 파일 이름, 오브젝트 리스트를 보내주는 코드
    }


    const fn_createExpGrid = function(_expObjList) {
        _expObjList.forEach((exp, idx) => {
            var SBGridProperties = {};
            SBGridProperties.parentid = exp.parentid;
            SBGridProperties.id = exp.id;
            SBGridProperties.jsonref = exp.jsonref;
            SBGridProperties.emptyrecords = '데이터가 없습니다.';
            SBGridProperties.selectmode = 'byrow';
            SBGridProperties.extendlastcol = 'none';
            SBGridProperties.columns = exp.columns;
            exp.sbGrid = _SBGrid.create(SBGridProperties);
            if(jsonExpSprtBiz.length == 0){
                exp.sbGrid.addRow(true);
            }
        });
    }


    const fn_exportExcelMulti = function(_fileName, _objList) {

        // 엑셀 정보를 담는 변수
        var objExcelInfo = {
            strFileName : _fileName,
            strAction : "/am/excel/saveMultiExcel",
            bIsStyle: true,
            bIsMerge: true,
            bUseFormat: false,
            bIncludeData: true,
            bUseCompress: false
        };

        var dataList = [];
        var sheetNameList = [];
        var titleList = [];
        var unitList = [];
        var arrAdditionalData = [];

        // 넘어온 오브젝트를 이용한 forEach문으로 타이틀리스트에 title을 넣고 unitList에 unit을 넣는 포이치문
        _objList.forEach((item, index) => {
            sheetNameList.push(item.sheetName);
            titleList.push(item.title);
            unitList.push(item.unit);

            if (index > 0) {
                var data = item.sbGrid.exportExcel(objExcelInfo, "return");
                dataList.push(data);
            }
        });

        arrAdditionalData.push(
            {"name": "arrSheetData", "value": JSON.stringify(dataList)},
            {"name": "arrSheetName", "value": JSON.stringify(sheetNameList)},
            {"name": "arrTitle", "value": JSON.stringify(titleList)},
            {"name": "arrUnit", "value": JSON.stringify(unitList)}
        );

        objExcelInfo.arrAdditionalData = arrAdditionalData;
        _objList[0].sbGrid.exportExcel(objExcelInfo);
    }


    // 엑셀 업로드 그리드 양식
    const fn_getImpGrdSprtBiz = function() {
        const _columns = [];
        _columns.push(
            {caption: ["번호"], 	    ref: 'rowSeq',	  type:'input',  width:'50px',  style:'text-align:center'},
            {caption: ["법인명"], 	ref: 'bzmnConm',  type:'input',  width:'255px', style:'text-align:left; background-color:#FFF8DC;'},
            {caption: ["법인번호"],	ref: 'crno',      type:'input',  width:'100px', style:'text-align:left; background-color:#FFF8DC;'},
            {caption: ["사업자번호"], ref: 'brno',	  type:'input',  width:'80px',  style:'text-align:center; background-color:#FFF8DC;'},
            {caption: ["선정연도"],	ref: 'slctnYr',   type:'input',  width:'50px',  style:'text-align:center'},
            {
                caption: ["지원사업연도"],
                ref: 'sprtBizYr',
                type:'combo',
                width:'80px',
                style:'text-align:center; background-color:#FFF8DC;',
                typeinfo: {
                    ref: 'sprtBizYrFilterData',
                    displayui: false,
                    itemcount: 10,
                    label: 'label',
                    value: 'value',
                    oneclickedit: true,
                    filtering: {
                        usemode: true,
                        uppercol: 'sprtBizNm',
                        attrname: 'code',
                        listall: false
                    }
                }
            },
            {
                caption: ["지원사업명"],
                ref: 'sprtBizNm',
                type:'combo',
                width:'200px',
                style:'text-align:left; background-color:#FFF8DC;',
                typeinfo: {
                    ref:'sprtBizNmFilterData',
                    displayui : false,
                    itemcount: 10,
                    label:'label',
                    value:'value',
                    oneclickedit: true
                }
            },
            {
                caption: ["배정금액(천원)"],
                ref: 'altmntAmt',
                type:'input',
                width:'100px',
                style:'text-align:right; background-color:#FFF8DC;',
                typeinfo : {mask : {alias : 'numeric'}},
                format : {
                    type:'number',
                    rule:'#,###  '
                }
            },
            {
                caption: ["자부담(천원)"],
                ref: 'onslfBrdnAmt',
                type:'input',
                width:'70px',
                style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}},
                format : {
                    type:'number',
                    rule:'#,###  '
                }
            },
            {
                caption: ["배정이자(%)"],
                ref: 'altmntInt',
                type:'input',
                width:'70px',
                style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}},
                format : {
                    type:'number',
                    rule:'#,###  '
                }
            },
            {caption: ["비고"],		    ref: 'rmrk',        type:'input',  width:'300px', style:'text-align:left'},
            {caption: ["품목"],		    ref: 'itemCd',	    type:'input',  width:'100px', style:'text-align:center'},
            {caption: ["사업유형"],	    ref: 'bizType',	    type:'input',  width:'50px',  style:'text-align:center'},
            //{caption: ["신규"],	    ref: 'sprtBizNew',  type:'output', width:'50px',  style:'text-align:center', skippaste:true}

            // hidden = true
            {caption: ["법인번호여부"],	ref: 'errCrno',     type:'output', width:'30px',  style:'text-align:center', skippaste:true, hidden:true},
            {caption: ["사업자번호여부"],	ref: 'errBrno',     type:'output', width:'30px',  style:'text-align:center', skippaste:true, hidden:true}
        );
        return _columns;
    }


    // 올리기 버튼 클릭 시 실행
    const fn_uld = async function() {

        let _headerTitle = "산지조직지원내역 등록";
        let _popTitle = "지원내역 Import";

        let _importFnc = fn_importSprtBiz;
        let _afterImportFnc = fn_setDataAfterImportSprtBiz;
        let _impValueChangedFnc = fn_grdImpValueChanged;
        let _callbackFnc = fn_setGrdData;

        SBUxMethod.setModalTitle('modal-imp', _headerTitle);

        popImp.init();

        const impColumns = fn_getImpGrdSprtBiz();

        var SBGridProperties = {};
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.extendlastcol = 'none';
        SBGridProperties.oneclickedit = true;
        SBGridProperties.columns = impColumns;
        popImp.importExcel(
            _popTitle,
            SBGridProperties,
            _importFnc,
            _afterImportFnc,
            _impValueChangedFnc,
            _callbackFnc
        );
    }


    // import Modal 저장 버튼 클릭 시 실행
    const fn_importSprtBiz = async function(_grdImp) {

        const saveList = [];

        const impList = _grdImp.getGridDataAll();


        if (impList.length == 0) {
            gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
        }

        // 유효성 검사
        for ( let iRow = 1; iRow <= impList.length; iRow++ ) {
            const rowData = _grdImp.getRowData(iRow);

            if (gfn_isEmpty(rowData.bzmnConm)) {
                gfn_comAlert("W0002", "법인명");		//	W0002	{0}을/를 입력하세요.
                let bzmnConmCol = _grdImp.getColRef('bzmnConm');
                _grdImp.moveScrollTop(iRow);
                _grdImp.selectCell(iRow, bzmnConmCol);
                return;
            }

            if (gfn_isEmpty(rowData.crno)) {
                gfn_comAlert("W0002", "법인번호");		//	W0002	{0}을/를 입력하세요.
                let crnoCol = _grdImp.getColRef('crno');
                _grdImp.moveScrollTop(iRow);
                _grdImp.selectCell(iRow, crnoCol);
                return;
            }

            if (gfn_isEmpty(rowData.brno)) {
                gfn_comAlert("W0002", "사업자번호");		//	W0002	{0}을/를 입력하세요.
                let brnoCol = _grdImp.getColRef('brno');
                _grdImp.moveScrollTop(iRow);
                _grdImp.selectCell(iRow, brnoCol);
                return;
            }

            if (gfn_isEmpty(rowData.sprtBizYr)) {
                gfn_comAlert("W0002", "지원사업연도");		//	W0002	{0}을/를 입력하세요.
                let sprtBizYrCol = _grdImp.getColRef('sprtBizYr');
                _grdImp.moveScrollTop(iRow);
                _grdImp.selectCell(iRow, sprtBizYrCol);
                return;
            }

            if (gfn_isEmpty(rowData.sprtBizNm)) {
                gfn_comAlert("W0002", "지원사업명");		//	W0002	{0}을/를 입력하세요.
                let sprtBizNmCol = _grdImp.getColRef('sprtBizNm');
                _grdImp.moveScrollTop(iRow);
                _grdImp.selectCell(iRow, sprtBizNmCol);
                return;
            }

            if (gfn_isEmpty(rowData.altmntAmt)) {
                gfn_comAlert("W0002", "배정금액");		//	W0002	{0}을/를 입력하세요.
                let altmntAmtCol = _grdImp.getColRef('altmntAmt');
                _grdImp.moveScrollTop(iRow);
                _grdImp.selectCell(iRow, altmntAmtCol);
                return;
            }

            if ( (rowData.errCrno == "Y" || rowData.errBrno == "Y") && confirmFlag) {
                if(gfn_comConfirm("Q0003", "등록된 법인번호, 사업자번호", "신규등록")) {   // Q0003  {0}이/가 없습니다. {1} 하시겠습니까?
                    confirmFlag = false;
                }else {
                    return;
                }
            }
            console.log("rowData", rowData);
            saveList.push(rowData);
        }

        if(saveList.length == 0) {
            gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
            return;
        }
        console.log("saveList : ", saveList);
        // insert Controller 호출

        let postUrl = "/pd/sprt/insertSprtBizRsltInqList.do";

        const postJsonPromise = gfn_postJSON(postUrl, saveList);
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                popImp.close();
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


    // import grid 데이터 세팅 후 실행
    const fn_setDataAfterImportSprtBiz = async function(_grdImp) {
        // 데이터 담은 후 컬럼 이동
        //_grdImp.moveColumn(13, 7);

        console.log("sprtBizNmFilterData", sprtBizNmFilterData);
        console.log("sprtBizYrFilterData", sprtBizYrFilterData);
        // 공통법인사업자 테이블 데이터
        const postJsonPromiseBrno = gfn_postJSON("/pd/sprt/selectComCorpBzmn.do", {}, null, true);
        const brnoData = await postJsonPromiseBrno;

        // 법인정보 테이블 데이터
        const postJsonPromiseCrno = gfn_postJSON("/pd/sprt/selectComCorp.do", {}, null, true);
        const crnoData = await postJsonPromiseCrno;

        const brnoList = brnoData.resultList;
        const crnoList = crnoData.resultList;
        const impList = _grdImp.getGridDataAll();

        const dbBrnoList = brnoList.map(row => String(row.brno).trim());
        const dbCrnoList = crnoList.map(row => String(row.crno).trim());
        //const dbSprtBizNm = jsonBizSeCd.map(row => String(row.sprtBizNm).trim());

        const dbBrnoSet = new Set(dbBrnoList);
        const dbCrnoSet = new Set(dbCrnoList);
        //const dbSprtBizNmSet = new Set(dbSprtBizNm);

        const onlyInImpBrno = impList.filter(row => !dbBrnoSet.has(String(row.brno).trim()));
        const onlyInImpCrno = impList.filter(row => !dbCrnoSet.has(String(row.crno).trim()));
        //const onlyInImpSprtBizNm = impList.filter(row => !dbSprtBizNmSet.has(String(row.sprtBizNm).trim()));

        // 법인정보 테이블에 법인번호가 없을 경우 ㅡ> 적색 표시
        if(onlyInImpCrno.length > 0) {

            for(let i = 0; onlyInImpCrno.length > i; i++){
                var nRow = Number(onlyInImpCrno[i].rowSeq);
                var nCol = _grdImp.getColRef("crno");

                _grdImp.setCellStyle('background-color', nRow, nCol, nRow, nCol, errColor);
                _grdImp.setCellData(nRow, 13, 'Y', true);
            }
        }

        // 공통법인사업자 테이블에 사업자등록번호가 없을 경우 ㅡ> 적색 표시
        if(onlyInImpBrno.length > 0) {

            for(let i = 0; onlyInImpBrno.length > i; i++){
                var nRow = Number(onlyInImpBrno[i].rowSeq);
                var nCol = _grdImp.getColRef("brno");

                _grdImp.setCellStyle('background-color', nRow, nCol, nRow, nCol, errColor);
                _grdImp.setCellData(nRow, 14, 'Y', true);
            }
        }

        // 지원사업명 신규 미등록 표시
/*        if(onlyInImpSprtBizNm.length > 0) {

            for(let i = 0; onlyInImpSprtBizNm.length > i; i++) {
                var nRow = Number(onlyInImpSprtBizNm[i].rowSeq);
                var nCol = _grdImp.getColRef("sprtBizNew");

                _grdImp.setCellData(nRow, nCol, "미등록", true);
            }
        }*/

    }


    // import grid 데이터 변경 시 실행
    const fn_grdImpValueChanged = async function(_grdImp) {

        var nRow = _grdImp.getRow();
        var nCol = _grdImp.getCol();

        if(flag){
            // 공통법인사업자 테이블 데이터
            const postJsonPromiseBrno = gfn_postJSON("/pd/sprt/selectComCorpBzmn.do", {}, null, true);
            const brnoData = await postJsonPromiseBrno;

            // 법인정보 테이블 데이터
            const postJsonPromiseCrno = gfn_postJSON("/pd/sprt/selectComCorp.do", {}, null, true);
            const crnoData = await postJsonPromiseCrno;

            const brnoList = brnoData.resultList;
            const crnoList = crnoData.resultList;

            const dbBrnoList = brnoList.map(row => String(row.brno).trim());
            const dbCrnoList = crnoList.map(row => String(row.crno).trim());
            //const dbSprtBizNmList = jsonBizSeCd.map(row => String(row.sprtBizNm).trim());

            const dbBrnoSet = new Set(dbBrnoList);
            const dbCrnoSet = new Set(dbCrnoList);
            //const dbSprtBizNmSet = new Set(dbSprtBizNmList);

            setImpBrno = dbBrnoSet;
            setImpCrno = dbCrnoSet;
            //setImpSprtBizNm = dbSprtBizNmSet;

            flag = false;
        }

        console.log("nRow", nRow);
        console.log("nCol", nCol);

        var ImpData = _grdImp.getCellData(nRow, nCol);

        var onlyInImpBrno = setImpBrno.has(ImpData);
        var onlyInImpCrno = setImpCrno.has(ImpData);
        //var onlyInImpSprtBizNm = setImpSprtBizNm.has(ImpData);

        // 법인번호 수정 시
        if(nCol == 2) {
            if(onlyInImpCrno) {
                _grdImp.setCellStyle('background-color', nRow, nCol, nRow, nCol, reqColor);
                _grdImp.setCellData(nRow, 13, '', true);
            }else {
                _grdImp.setCellStyle('background-color', nRow, nCol, nRow, nCol, errColor);
                _grdImp.setCellData(nRow, 13, 'Y', true);
            }
        }

        // 사업자번호 수정 시
        if(nCol == 3) {
            if(onlyInImpBrno) {
                _grdImp.setCellStyle('background-color', nRow, nCol, nRow, nCol, reqColor);
                _grdImp.setCellData(nRow, 14, '', true);
            }else {
                _grdImp.setCellStyle('background-color', nRow, nCol, nRow, nCol, errColor);
                _grdImp.setCellData(nRow, 14, 'Y', true);
            }
        }

        // 지원사업명 수정 시
/*        if(nCol == 6) {
            if(onlyInImpSprtBizNm) {
                _grdImp.setCellData(nRow, 7, "", true);
            }else {
                _grdImp.setCellData(nRow, 7, "미등록", true);
            }
        }*/

    }


    // import Modal 종료 버튼 클릭 시 실행
    const fn_setGrdData = async function(_grdImp){
    }






</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
