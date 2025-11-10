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

<body oncontextmenu="return false">
    <section class="content container-fluid">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;" >
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 지원사업내역 -->
                    <sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
                    </sbux-label>
                </div>
                <div style="margin-left: auto;">
                    <sbux-button
                            id="btnOrnz"
                            name="btnOrnz"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_intgOrnz"
                            text="통합조직"
                            disabled="false"
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
                        <th scope="row" class="th_bg" >사업구분</th>
                        <td colspan="4" class="td_input" style="border-right:hidden;" >
                            <sbux-select id="srch-slt-sprtBizNm" name="srch-slt-sprtBizNm" uitype="single" jsondata-ref="jsonBizSeCd" class="form-control input-sm" unselected-text="전체"></sbux-select>
                        </td>
                        <th scope="row" class="th_bg" >기준연도</th>
                        <td colspan="5" class="td_input"style="border-right: hidden;">
                            <sbux-datepicker
                                    datepicker-mode="year"
                                    uitype="range"
                                    id="srch-dtp-crtrYmd"
                                    name="srch-dtp-crtrYmd"
                                    date-format="yyyy"
                                    double-open="true"
                                    show-button-bar="false"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"
                            ></sbux-datepicker>
                        </td>
                        <th scope="row" class="th_bg">지원연도</th>
                        <td colspan="4" class="td_input"style="border-right: hidden;">
                            <sbux-datepicker
                                    datepicker-mode="year"
                                    uitype="range"
                                    id="srch-dtp-sprtYmd"
                                    name="srch-dtp-sprtYmd"
                                    date-format="yyyy"
                                    double-open="true"
                                    show-button-bar="false"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"
                            ></sbux-datepicker>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">법인명</th>
                        <td colspan="4" class="td_input" style="border-right:hidden;">
                            <sbux-input
                                    id="srch-inp-corpNm"
                                    name="srch-inp-corpNm"
                                    uitype="text"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
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

                    </tbody>
                </table>

                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>지원사업 목록</span>
                            <span style="font-size:12px">(조회건수 <span id="sprtBizCnt">0</span>건, 전체건수 <span id="sprtBizTotal">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-grdSprtBiz" style="height:560px;"></div>
                </div>
            </div>
        </div>

    </section>
</body>
<script type="text/javascript">

    var grdSprtBiz;         // 지원사업 목록 그리드
    var jsonSprtBiz = [];   // 지원사업 목록 그리드 데이터
    var jsonBizSeCd = [];   // 사업구분 콤보 박스 데이터

    const fn_initSBSelect = async function() {
        await Promise.all([
            fn_setSprtBizSeCdSelect('srch-slt-sprtBizNm', jsonBizSeCd)
        ]);
    }

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_createGrdSprtBiz();
        fn_initSBSelect();
    });

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


    function fn_createGrdSprtBiz() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSprtBiz';
        SBGridProperties.id = 'grdSprtBiz';
        SBGridProperties.jsonref = 'jsonSprtBiz';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.fixedrowheight = '37';
        SBGridProperties.paging = {
            'type' : 'page',
            'count' : 5,
            'size' : 40,
            'sorttype' : 'page',
            'showgoalpageui' : true
        };
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.columns = [
            {caption: ["기준<br/>연도"],	ref: 'sprtBizYr', type:'output',  width:'60px', style:'text-align:center'},
            {caption: ["지원사업명"],	    ref: 'sprtBizNm', type:'output',  width:'200px', style:'text-align:left'},
            {caption: ["법인명"],	    ref: 'bzmnConm',  type:'output',  width:'250px', style:'text-align:left'},
            {caption: ["법인번호"],	    ref: 'crno',      type:'output',  width:'110px',  style:'text-align:left'},
            {caption: ["사업자번호"],	    ref: 'brno',      type:'output',  width:'90px',  style:'text-align:left'},
            {caption: ["선정<br/>연도"],	ref: 'slctnYr',   type:'output',  width:'60px',  style:'text-align:center'},
            {caption: ["지원<br/>연도"],	ref: 'sprtYr',    type:'output',  width:'60px',  style:'text-align:center'},
            {
                caption: ["배정금액<br/>(천원)"],
                ref: 'altmntAmt',
                type:'output',
                width:'80px',
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
                width:'80px',
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
                width:'80px',
                style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}},
                format : {
                    type:'number',
                    rule:'#,###  '
                }
            },
            {caption: ["비고"],			ref: 'rmrk',     type:'output',  width:'350px',    style:'text-align:left'},

            {caption: ["품목"],		    ref: 'itemCd',	 type:'output',  witdth:'60px',     style:'text-align:center', hidden: true},
            {caption: ["사업</br>유형"],	ref: 'bizType',	 type:'output',  witdth:'60px',     style:'text-align:center', hidden: true},
        ];
        grdSprtBiz = _SBGrid.create(SBGridProperties);
        grdSprtBiz.bind("afterpagechanged" , fn_pagingGrdSprtBiz);
    }

    // 페이징
    const fn_pagingGrdSprtBiz = async function() {
        let recordCountPerPage = grdSprtBiz.getPageSize();
        let currentPageNo = grdSprtBiz.getSelectPageIndex();
        fn_setGrdSprtBiz(recordCountPerPage, currentPageNo);
    }

    const fn_search = async function() {

        let crtrYmdFrom = SBUxMethod.get("srch-dtp-crtrYmd_from");   // 기준연도 시작일자
        let crtrYmdTo = SBUxMethod.get("srch-dtp-crtrYmd_to");       // 기준연도 종료일자
        let sprtYmdFrom = SBUxMethod.get("srch-dtp-sprtYmd_from");   // 지원연도 시작일자
        let sprtYmdTo = SBUxMethod.get("srch-dtp-sprtYmd_to");       // 지원연도 종료일자

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

        grdSprtBiz.rebuild();
        let pageSize = grdSprtBiz.getPageSize();
        let pageNo = 1;

        jsonSprtBiz.length = 0;
        grdSprtBiz.clearStatus();
        fn_setGrdSprtBiz(pageSize, pageNo);
    }

    const fn_setGrdSprtBiz = async function(pageSize, pageNo) {

        let sprtBizSe = SBUxMethod.get("srch-slt-sprtBizNm");       // 사업구분
        let crtrYmdFrom = SBUxMethod.get("srch-dtp-crtrYmd_from");   // 기준연도 시작일자
        let crtrYmdTo = SBUxMethod.get("srch-dtp-crtrYmd_to");       // 기준연도 종료일자
        let sprtYmdFrom = SBUxMethod.get("srch-dtp-sprtYmd_from");   // 지원연도 시작일자
        let sprtYmdTo = SBUxMethod.get("srch-dtp-sprtYmd_to");       // 지원연도 종료일자
        let corpNm = SBUxMethod.get("srch-inp-corpNm");             // 법인명
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
               , corpNm              : corpNm
               , crno                : crno
               , brno                : brno

                 //페이징
               , pagingYn            : 'Y'
               , currentPageNo       : pageNo
               , recordCountPerPage  : pageSize
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
                  , slctnYr         : item.slctnYr
                  , sprtYr          : item.sprtYr
                  , altmntAmt       : item.altmntAmt
                  , altmntInt       : item.altmntInt
                  , rmrk            : item.rmrk
                  , itemCd          : item.itemCd
                  , bizType         : item.bizType
                  , onslfBrdnAmt    : item.onslfBrdnAmt
                }
                jsonSprtBiz.push(sprtBizVO);

                if (index === 0) {
                    totalRecordCount = item.totalRecordCount;
                }
            });
            document.querySelector('#sprtBizCnt').innerText = jsonSprtBiz.length;
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




</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
