<%
    /**
     * @Class Name        : hra1700.jsp
     * @Description       : 개인별 연말정산 결과조회 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.08.24
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.08.24   	표주완		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 개인별 연말정산 결과조회</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>

    <title>Calculator</title>
    <link rel="stylesheet" href="/resource/css/ma_custom.css">
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btnCancel" name="btnCancel" uitype="normal" text="계산취소"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnCalculation('CANCEL')" style="float: right;"
                ></sbux-button>
                <sbux-button
                        id="btnCalculation" name="btnCalculation" uitype="normal" text="세액계산"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnCalculation('AUTO')" style="float: right;"
                ></sbux-button>
            </div>
        </div>

        <div class="box-search-ma">
            <!--[pp] 검색 -->
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <table id="dataArea1" class="table table-bordered tbl_fixed table-search-ma">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 8%">
                    <col style="width: 7%">
                    <col style="width: 1%">
                    <col style="width: 7%">
                    <col style="width: 2%">

                    <col style="width: 8%">
                    <col style="width: 7%">
                    <col style="width: 1%">
                    <col style="width: 7%">
                    <col style="width: 2%">

                    <col style="width: 8%">
                    <col style="width: 7%">
                    <col style="width: 1%">
                    <col style="width: 7%">
                    <col style="width: 2%">

                    <col style="width: 8%">
                    <col style="width: 7%">
                    <col style="width: 1%">
                    <col style="width: 7%">
                    <col style="width: 2%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg_search">정산연도</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_YE_TX_YYYY"
                                name="SRCH_YE_TX_YYYY"
                                uitype="popup"
                                datepicker-mode="year"
                                date-format="yyyy"
                                class="table-datepicker-ma inpt_data_reqed"
                                required>
                            <%--onchange="fn_payDate"--%>
                        </sbux-datepicker>
                    </td>
                    <td colspan="3" style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">정산구분</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left"
                                    class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button"
                                    id="SRCH_YE_TX_TYPE" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_YE_TX_TYPE"
                                 style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">사업장</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle"
                                    type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_SITE_CODE"
                                 style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">급여영역</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_PAY_AREA_TYPE"
                                uitype="single"
                                jsondata-ref="jsonPayAreaType"
                                unselected-text="선택"
                                class="form-control input-sm"
                        <%--onchange="fn_payType"--%>>
                        </sbux-select>
                    </td>
                    <td style="border-right: hidden;"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">부서</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="SRCH_DEPT_CODE"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                        <sbux-input
                        <%-- uitype="hidden"--%>
                                uitype="text"
                                id="SRCH_DEPT_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td <%--colspan="2"--%> class="td_input">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup1"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg_search">사원</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="SRCH_EMP_CODE"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                        <sbux-input
                        <%-- uitype="hidden"--%>
                                uitype="text"
                                id="SRCH_EMP_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td class="td_input">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup2"
                        ></sbux-button>
                    </td>
                    <td colspan="5" style="border-right: hidden;"></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="row">
            <div class="col-sm-3">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>사원리스트</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwInfo" style="height:800px; width:100%;"></div>
                </div>
            </div>

            <div class="col-sm-9">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>사원정보</span></li>
                    </ul>
                </div>

                <div>
                    <table id="dataArea2" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:2%">

                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:2%">

                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">사업장</th>
                            <td class="td_input">
                                <sbux-select
                                        id="SITE_CODE"
                                        uitype="single"
                                        jsondata-ref="jsonSiteCode"
                                        unselected-text="선택"
                                        class="form-control input-sm"
                                        readonly>
                                </sbux-select>
                            </td>
                            <td colspan="6" style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">부서</th>
                            <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                                <sbux-input
                                        uitype="text"
                                        id="DEPT_CODE"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="DEPT_NAME"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td <%--colspan="2"--%> class="td_input" data-group="DEPT">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup1"
                                        readonly
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">사원</th>
                            <td class="td_input" style="border-right: hidden;" data-group="EMP">
                                <sbux-input
                                        uitype="text"
                                        id="EMP_CODE"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="EMP">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="EMP_NAME"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="EMP">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup2"
                                        readonly
                                ></sbux-button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">급여반영여부</th>
                            <td class="td_input">
                                <sbux-select
                                        id="PAY_APPLY_YN"
                                        uitype="single"
                                        jsondata-ref="jsonPayApplyYn"
                                        unselected-text="선택"
                                        class="form-control input-sm"
                                        readonly>
                                </sbux-select>
                            </td>
                            <td colspan="2" style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">급여반영월</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="PAY_APPLY_MM"
                                        name="PAY_APPLY_MM"
                                        uitype="popup"
                                        datepicker-mode="month"
                                        date-format="yyyy-mm"
                                        class="form-control input-sm input-sm-ast"
                                        readonly>
                                    <%--onchange="fn_payDate"--%>
                                </sbux-datepicker>
                            </td>
                            <td colspan="2" style="border-right: hidden;"></td>
                        </tr>
                    </table>
                </div>

                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>연말정산내역</span>
                        </li>
                    </ul>
                </div>
                <sbux-tabs id="tabJson" name="tabJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false">
                </sbux-tabs>
                <div class="tab-content">
                    <div id="tabInfo1" >
                        <div>
                            <div id="sb-area-gvwIncome" style="height:600px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="tabInfo2" >
                        <div>
                            <table id="dataArea6" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:10%">

                                    <col style="width:7%">

                                    <col style="width:3%">
                                    <col style="width:3%">
                                    <col style="width:3%">

                                    <col style="width:2%">
                                    <col style="width:4%">
                                    <col style="width:2%">

                                    <col style="width:6%">

                                    <col style="width:15%">

                                </colgroup>
                                <tr>
                                    <th colspan="8" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소득총액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PAY_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="8" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">비과세총액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TXFREE_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="8" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">총급여액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="8" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">근로소득공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="8" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">근로소득금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기본공제</th>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">본인</th>
                                    <td colspan="3" style="border-right: hidden;"></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PERSONAL_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">배우자</th>
                                    <td colspan="3" style="border-right: hidden;"></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WIFE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">부양가족</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SUPPORT_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SUPPORT_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">추가공제</th>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">경로우대</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SENIOR_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SENIOR_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장애인</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">부녀자</th>
                                    <td colspan="3" style="border-right: hidden;"></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WOMAN_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">부녀자</th>
                                    <td colspan="3" style="border-right: hidden;"></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WOMAN_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">한부모</th>
                                    <td colspan="3" style="border-right: hidden;"></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SINGLE_PARENT_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">연금보험료공제</th>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">국민연금보험료</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공적연금
                                        보험료공제</th>
                                    <th colspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공무원연금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="OFFICIAL_PENS_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">군인연금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="MILITARY_PENS_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사립학교 교직원연금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SCHOOL_PENS_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">별정우체국연금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="POST_PENS_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>

                                <tr>
                                    <th rowspan="17" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">특별공제</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <th colspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">국민건강보험(노양장기요양보험 포함)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HEALTH_INSURE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고용보험료</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMP_INSURE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOTAL_INSURE_DED_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="12" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택자금</th>
                                    <th rowspan="2" colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택임차차입금 원리금상환액</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">대출기관</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HSRENT_PRIN_DED_ORG_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">거주자</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HSRENT_PRIN_DED_PERS_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="9" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장기주택 저당차입금
                                        이자상환액</th>
                                    <th rowspan="3" colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2011년 이전 차입분</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">15년 미만</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">15년~29년</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">30년 이상</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT3" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2012년 이후 차입분
                                        (15년 이상)</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고정금리ㆍ비거치 상환대출</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT4" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기타대출</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT5" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2015년 이후
                                        차입분</th>
                                    <th rowspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">15년 이상</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고정금리And비거치상환대출</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT6" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고정금리Or비거치상환대출</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT7" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">그 밖의 대출</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT8" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">10년~15년</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고정금리Or비거치상환대출</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT9" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOTAL_HOUSE_DED_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기부금(이월분)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOTAL_DONATION_DED_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">특별공제 계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SPEC_DED_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="8" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">차감소득금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DED_INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>

                                <tr>
                                    <th rowspan="15" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">그 밖의 소득공제</th>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">개인연금저축(2000년 이전 가입)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PRIV_PENS_SV_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소기업ㆍ소상공인 공제부금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SM_COM_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택마련저축  소득공제</th>
                                    <th colspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">청약저축</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_SUBS_SV_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택청약종합저축</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_TOT_SV_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">근로자주택마련저축</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_EMP_SV_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOTAL_HOUSE_SAVING_DED_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">투자조합 출자 등</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INVEST_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">신용카드 등 사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CD_USE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">우리사주조합 출연금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMP_STOCK_GIVE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">우리사주조합 기부금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMP_STOCK_DON_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고용유지 중소기업 근로자 소득공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SALARY_DECREASE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">목돈 안드는 전세 이자상환액 소득공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LEASE_INT_RDM_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장기집합 투자증권 저축</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LONG_INVEST_STOCK_SAVE_DED_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">청년형 장기집합 투자증권 저축</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LT_COL_INV_SV_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">그 밖의 소득공제 계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ETC_DED_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="8" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소득공제 종합한도 초과액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ETC_DED_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="8" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">종합소득과세표준</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_INC_TX_STD_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="8" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">산출세액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CALCULATE_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">산출세액</th>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소득세법</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_TX_LAW_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">조세특례제한법(53-1제외)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TX_SPEC_LAW_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">조세특례제한법(제30조)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TX_SPEC_LAW_30_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">조세조약</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TX_TREATY_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액감면 계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TX_RED_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="42" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제</th>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">근로소득</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">자녀</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상자녀</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHILD_TX_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHILD_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">출생ㆍ입양</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHILDBIRTH_TX_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHILDBIRTH_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="8" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">연금계좌</th>
                                    <th rowspan="2" colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">과학기술인공제</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SCNT_PENS_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SCNT_PENS_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">근로자퇴직급여보장법에 따른 퇴직연금</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_PENS_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_PENS_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">연금저축</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_SV_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_SV_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">ISA 만기시 연급계좌 납입액</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ISA_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ISA_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="26" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">특별세액공제</th>
                                    <th rowspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <th rowspan="2" colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보장성</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INSURE_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INSURE_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장애인전용 보장성</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_INSURE_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_INSURE_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">의료비</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="MED_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="MED_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">교육비</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EDU_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EDU_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="16" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기부금</th>
                                    <th rowspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;"> 정치자금  기부금</th>
                                    <th rowspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">10만원 이하</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_POL_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_POL_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">10만원 초과</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_POL_EXCS_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_POL_EXCS_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고향사랑 기부금</th>
                                    <th rowspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">10만원 이하</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_HLE_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_HLE_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">10만원 초과</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_HLE_EXCS_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_HLE_EXCS_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">우리사주조합기부금</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_EMP_STOCK_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_EMP_STOCK_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">법정기부금</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_LGL_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_LGL_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지정기부금(종교단체외)</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_DSIN_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_DSIN_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지정기부금(종교단체)</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_DSIN_REL_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_DSIN_REL_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SPEC_TX_DED_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">표준세액공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="STD_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납세조합공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TX_UNION_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택자금차입금이자세액공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HSRENT_INT_RDM_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="7" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">외국납부</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="FOREI_PAY_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">월세액</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제대상금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_MM_RENT_DED_TGT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_MM_RENT_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <%--/********************정산명세 이전버전************************/--%>
                    <%--<div id="tabInfo3" >
                        <div>
                            <table id="dataArea3" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:7%">

                                    <col style="width:10%">

                                    <col style="width:2%">
                                    <col style="width:3%">
                                    <col style="width:2%">

                                    <col style="width:7%">

                                    <col style="width:15%">

                                </colgroup>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소득총액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PAY_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">비과세총액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TXFREE_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">총급여액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">근로소득공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">근로소득금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기본공제</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">본인</th>
                                    <td colspan="3" style="border-right: hidden;"></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PERSONAL_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">배우자</th>
                                    <td colspan="3" style="border-right: hidden;"></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WIFE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">부양가족</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SUPPORT_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SUPPORT_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">추가공제</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">경로우대</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SENIOR_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SENIOR_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장애인</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">부녀자</th>
                                    <td colspan="3" style="border-right: hidden;"></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WOMAN_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">6세 이하</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BRING_CHILD_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BRING_CHILD_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">출생ㆍ입양</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHILDBIRTH_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHILDBIRTH_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">한부모</th>
                                    <td colspan="3" style="border-right: hidden;"></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SINGLE_PARENT_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">다자녀추가공제</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="MANY_CHILD_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="MANY_CHILD_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                            </table>
                            <table id="dataArea4" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:7%">

                                    <col style="width:4%">

                                    <col style="width:3%">
                                    <col style="width:3%">
                                    <col style="width:7%">

                                    <col style="width:7%">

                                    <col style="width:15%">

                                </colgroup>
                                <tr>
                                    <th rowspan="8" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">연금보험료공제</th>
                                    <th rowspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공적연금보험료</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">국민연금보험료</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <td rowspan="8" style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공무원연금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="OFFICIAL_PENS_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">군인연금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="MILITARY_PENS_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사립학교 교직원연금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SCHOOL_PENS_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">별정우체국연금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="POST_PENS_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">연금계좌</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">과학기술인공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SCNT_PENS_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">근로자퇴직급여보장법</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_PENS_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">연금저축계좌</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_SV_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="27" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">특별공제</th>
                                    <th rowspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">국민건강보험(노양장기요양보험 포함)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HEALTH_INSURE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <td rowspan="27" style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고용보험</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMP_INSURE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">일반보장성보험</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="GENERAL_INSURE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장애인전용보장성보험</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_INSURE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOTAL_INSURE_DED_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">의료비</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장애인 의료비</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_MED_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기타 의료비</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ETC_MED_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOTAL_MED_DED_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">교육비</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장애인 교육비</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HANDICAP_EDU_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기타 교육비</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ETC_EDU_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOTAL_EDU_DED_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="9" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택자금</th>
                                    <th rowspan="2" colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택임차차입금</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">대출기관차입</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HSRENT_PRIN_DED_ORG_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">거주자차입</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HSRENT_PRIN_DED_PERS_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">월세액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_MM_RENT_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장기주택 저당차입금</th>
                                    <th rowspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2011년 이전 차입분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">15년 미만</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">15년~29년</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">30년 이상</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT3" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2012년 이후 차입분(15년 이상)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고정금리ㆍ비거치 상환대출</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT4" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기타대출</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_DEAMT5" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOTAL_HOUSE_DED_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기부금</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">정치자금기부금(세액공제분 제외)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_POL_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">법정기부금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_LGL_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">우리사주조합 기부금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_EMP_STOCK_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지정기부금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_DSIN_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOTAL_DONATION_DED_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">특별공제 계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SPEC_DED_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">표준공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="STD_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="12" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">그 밖의 소득공제</th>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">개인연금저축(2000년 이전 가입)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PRIV_PENS_SV_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택마련저축</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">청약저축</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_SUBS_SV_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">근로자주택마련저축</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_EMP_SV_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택청약종합저축</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_TOT_SV_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOTAL_HOUSE_SAVING_DED_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">신용카드 등 사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CD_USE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기타 공제</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소기업ㆍ소상공인 공제부금 소득공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SM_COM_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">투자조합 출자공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INVEST_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">우리사주출연금 소득공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMP_STOCK_GIVE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고용유지 중소기업 근로자 소득공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SALARY_DECREASE_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">목돈 안드는 전세 이자상환액 소득공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LEASE_INT_RDM_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">그 밖의 소득공제 계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ETC_DED_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">특별공제 종합한도 초과액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SPEC_DED_TOT_OVER_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">종합소득과세표준</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_INC_TX_STD_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">산출세액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CALCULATE_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="11" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액감면 및 세액공제</th>
                                    <th rowspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액감면</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소득세법</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_TX_LAW_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">조세특례제한법</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TX_SPEC_LAW_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">조세특례제한법(제30조)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TX_SPEC_LAW_30_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">조세조약</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TX_TREATY_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">감면세액 계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TX_RED_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제</th>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">근로소득세액공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납세조합공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TX_UNION_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택자금차입금이자세액공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HSRENT_INT_RDM_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기부정치자금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_POL_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">외국납부</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="FOREI_PAY_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">세액공제 계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TX_DED_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                            </table>
                            <table id="dataArea5" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">

                                    <col style="width:6%">

                                    <col style="width:6%">

                                    <col style="width:6%">

                                    <col style="width:7%">

                                    <col style="width:15%">

                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;"></th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소득세</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지방소득세</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">농어촌특별세</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">합계</th>
                                    <td rowspan="4" style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">결정세액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CALC_INC_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CALC_LOCAL_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CALC_SPEC_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CALC_TX_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기납부세액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="NOW_INC_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="NOW_LOCAL_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="NOW_SPEC_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="NOW_TX_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">차감징수세액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LOCAL_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SPEC_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TX_TOT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" &lt;%&ndash;mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"&ndash;%&gt;
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</section>
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title=""
                body-html-id="body-modal-compopup1" header-is-close-button="false"
                footer-is-close-button="false"></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>

</body>
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------


    //grid 초기화
    var gvwInfoGrid; 			// 그리드를 담기위한 객체 선언
    var jsonInfoList = []; 	// 그리드의 참조 데이터 주소 선언
    var gvwIncomeGrid;
    var jsonIncomeList = [];


    var jsonYeTxType = []; //출력구분 ( L_HRA029 )SRCH_YE_TX_TYPE
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )SRCH_PAY_AREA_TYPE
    var jsonSiteCode = []; //사업장 ( L_ORG001 )SRCH_SITE_CODE
    var jsonPayApplyYn = []; //급여반영여부 ( L_HRM003 )PAY_APPLY_YN

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['gvwInfoGrid','SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['PAY_APPLY_YN','gvwInfoGrid'], jsonPayApplyYn, 'L_HRM003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),


            //사업장
            gfnma_multiSelectInit({
                target			: ['#SRCH_SITE_CODE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_ORG001'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SITE_CODE'
                ,colLabel		: 'SITE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SITE_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

            //정산구분
            gfnma_multiSelectInit({
                target			: ['#SRCH_YE_TX_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRA029'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),


        ]);
    }

    var fn_compopup1 = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: ["", 				searchText,		""]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function() {

        var searchText = gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 = "_EMP_CODE_";
        var replaceText1 = "_EMP_NAME_";
        var replaceText2 = "_DEPT_CODE_";
        var replaceText3 = "_DEPT_NAME_";
        var replaceText4 = "_EMP_STATE_";
        var strWhereClause = "AND x.EMP_CODE LIKE '%" + replaceText0 + "%' AND x.DEPT_NAME LIKE '%" + replaceText1 + "%' AND x.DEPT_CODE LIKE '%"+replaceText2
            + "%' AND x.DEPT_NAME LIKE '%" + replaceText3 +  "%' AND x.EMP_STATE LIKE '%"+replaceText4+"%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_HRI001'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions:    ["부서코드"    , "부서명"     , "사원코드"    ,"사원명"     ,"재직상태"]
            , searchInputFields: ["DEPT_CODE"  , "DEPT_NAME", "EMP_CODE"   ,"EMP_NAME"  ,"EMP_STATE"]
            , searchInputValues: [""           , ""         ,""             ,searchText         ,""]
            , height: '400px'
            , tableHeader:       ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames:  ["EMP_CODE"  , "EMP_NAME"  , "DEPT_NAME"   ,"SITE_NAME"  ,"EMP_STATE_NAME"]
            , tableColumnWidths: ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
            },
        });

    }

    var tabJsonData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "소득명세"  , "targetid" : "tabInfo1" ,     "targetvalue" : "소득명세"},
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "정산명세"  , "targetid" : "tabInfo2" ,     "targetvalue" : "정산명세"},
        /*{ "id" : "2", "pid" : "-1", "order" : "3", "text" : "정산명세",     "targetid" : "tabInfo3" ,     "targetvalue" : "정산명세"} = 정산명세 이전버전*/
    ];

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        fn_createGrid();
        fn_createIncomeGrid();

        let openDate = gfn_dateToYear(new Date());
        SBUxMethod.set('SRCH_YE_TX_YYYY', openDate);

    }



   /* function cfn_save() {

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            fn_save();

        }
    }*/

    function cfn_search() {

        fn_search('LIST');


    }

    /* function cfn_add(){

     }
     function cfn_del(){
     }*/

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }

    //사원 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwInfo';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption : ["사업장"], ref : 'SITE_CODE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode',  label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '200px', style: 'text-align:left', hidden : true},
            {caption: ["부서명"], ref: 'DEPT_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption : ["급여반영여부"], ref : 'PAY_APPLY_YN', width : '130px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayApplyYn',  label : 'label', value : 'value'}, hidden : true
            },
            {caption: ['급여반영월'], ref: 'PAY_APPLY_MM', 	width:'200px',	type:'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true, hidden : true}

        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        gvwInfoGrid.bind('click', 'fn_view');
    }

    //소득명세 리스트
    function fn_createIncomeGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwIncome';
        SBGridProperties.id = 'gvwIncomeGrid';
        SBGridProperties.jsonref = 'jsonIncomeList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [1],
                sum : [1,2,3,4,5,6,7]
            },
            datasorting	: true,
            usedecimal : false
        };
        SBGridProperties.columns = [
            {caption: ["회사명"], ref: 'COMP_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["급여"], ref: 'PAY_AMT', type: 'output', width: '230px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["상여"], ref: 'BONUS_AMT', type: 'output', width: '230px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["인정상여"], ref: 'ADD_BONUS_AMT', type: 'output', width: '230px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["주식매수선택권 행사이익"], ref: 'STOCK_PROFIT_AMT', type: 'output', width: '230px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["우리사주조합인출금"], ref: 'EMP_STOCK_AMT', type: 'output', width: '230px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["임원 퇴직소득금액 한도초과액"], ref: 'EXEC_RET_LIM_OVER', type: 'output', width: '230px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["합계"], ref: 'TOTAL_AMT', type: 'output', width: '230px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left', disabled: true}//스타일상 빈값
        ];

        gvwIncomeGrid = _SBGrid.create(SBGridProperties);
        /*   gvwInfoGrid.bind('click', 'fn_view');*/
    }

    /**
     * 목록 조회
     */
    const fn_search = async function (strWorkType) {

        let stremp_code = '';

        let SITE_CODE           = gfnma_multiSelectGet('#SRCH_SITE_CODE'); //사업장
        let YE_TX_TYPE          = gfnma_multiSelectGet('#SRCH_YE_TX_TYPE'); //정산구분
        let YE_TX_YYYY          = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도
        let PAY_AREA_TYPE       = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let DEPT_CODE           = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE            = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원
        let EMP_STATE           = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE")); //재직구분

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

          /*  ,V_P_YE_TX_YYYY     : YE_TX_YYYY
            ,V_P_YEAR_END_TX_TYPE : YE_TX_TYPE
            ,V_P_SITE_CODE      : SITE_CODE
            ,V_P_DEPT_CODE      : DEPT_CODE
            ,V_P_EMP_CODE       : EMP_CODE
            ,V_P_EMP_STATE      : EMP_STATE
            ,V_P_EMP_CODE_LIST  : stremp_code
            ,V_P_PAY_AREA_TYPE  : PAY_AREA_TYPE*/

            ,V_P_YE_TX_YYYY       : YE_TX_YYYY
            ,V_P_YEAR_END_TX_TYPE : YE_TX_TYPE
            ,V_P_SITE_CODE        : SITE_CODE
            ,V_P_DEPT_CODE        : DEPT_CODE
            ,V_P_EMP_CODE         : EMP_CODE
            ,V_P_PAY_AREA_TYPE    : PAY_AREA_TYPE


            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1700List.do", {
            getType				: 'json',
            workType			: strWorkType,
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {


                /** @type {number} **/
                let totalRecordCount = 0;

                jsonInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        EMP_CODE 			 : gfn_nvl(item.EMP_CODE)
                        ,EMP_NAME 			 : gfn_nvl(item.EMP_NAME)
                        ,SITE_CODE 			 : gfn_nvl(item.SITE_CODE)
                        ,DEPT_CODE 			 : gfn_nvl(item.DEPT_CODE)
                        ,DEPT_NAME 			 : gfn_nvl(item.DEPT_NAME)
                        ,PAY_APPLY_YN        : gfn_nvl(item.PAY_APPLY_YN)
                        ,PAY_APPLY_MM        : gfn_nvl(item.PAY_APPLY_MM)

                    }
                    jsonInfoList.push(msg);
                    totalRecordCount ++;
                });

                gvwInfoGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if(jsonInfoList.length > 0) {
                    gvwInfoGrid.clickRow(1);
                }

               // fn_view();

            } else {
                alert(data.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    //상세정보 보기
    async function fn_view() {
        let nRow = gvwInfoGrid.getRow();
        let nCol = gvwInfoGrid.getCol();

        if (nCol == -1) {
            return;
        }
        if (nRow < 1) {
            return;
        }

        let rowData = gvwInfoGrid.getRowData(nRow);

        if (!_.isEmpty(rowData)) {

            let SITE_CODE           = gfnma_multiSelectGet('#SRCH_SITE_CODE'); //사업장
            let YE_TX_TYPE          = gfnma_multiSelectGet('#SRCH_YE_TX_TYPE'); //정산구분
            let YE_TX_YYYY          = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도
            let PAY_AREA_TYPE       = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
            let DEPT_CODE           = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
            let EMP_CODE            = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원
            let EMP_STATE           = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE")); //재직구분

            if (!YE_TX_YYYY) {
                gfn_comAlert("W0002", "정산연도");
                return;
            }
            if (!YE_TX_TYPE) {
                gfn_comAlert("W0002", "정산구분");
                return;
            }

            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                ,V_P_LANG_ID: ''
                ,V_P_COMP_CODE: gv_ma_selectedCorpCd
                ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

                ,V_P_YE_TX_YYYY       : YE_TX_YYYY
                ,V_P_YEAR_END_TX_TYPE : YE_TX_TYPE
                ,V_P_SITE_CODE        : SITE_CODE
                ,V_P_DEPT_CODE        : DEPT_CODE
                ,V_P_EMP_CODE         : EMP_CODE
                ,V_P_PAY_AREA_TYPE    : PAY_AREA_TYPE


                ,V_P_FORM_ID: p_formId
                ,V_P_MENU_ID: p_menuId
                ,V_P_PROC_ID: ''
                ,V_P_USERID: ''
                ,V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1700List.do", {
                getType				: 'json',
                workType			: 'RESULT',
                cv_count			: '3',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    //-- 소득명세
                    jsonIncomeList.length = 0;
                    data.cv_2.forEach((item, index) => {
                        const msg = {
                            COMP_NAME 			                : gfn_nvl(item.COMP_NAME)
                            ,PAY_AMT 			                : gfn_nvl(item.PAY_AMT)
                            ,BONUS_AMT 			                : gfn_nvl(item.BONUS_AMT)
                            ,ADD_BONUS_AMT 			            : gfn_nvl(item.ADD_BONUS_AMT)
                            ,STOCK_PROFIT_AMT 			        : gfn_nvl(item.STOCK_PROFIT_AMT)
                            ,EMP_STOCK_AMT 			            : gfn_nvl(item.EMP_STOCK_AMT)
                            ,EXEC_RET_LIM_OVER 			        : gfn_nvl(item.EXEC_RET_LIM_OVER)
                            ,TOTAL_AMT 			                : gfn_nvl(item.TOTAL_AMT)

                        }
                        jsonIncomeList.push(msg);

                    });

                    gvwIncomeGrid.rebuild();

                    // -- 정산명세
                    data.cv_3.forEach((item, index) => {
                        SBUxMethod.set("PAY_TOT_AMT", 		gfn_nvl(item.PAY_TOT_AMT));
                        SBUxMethod.set("TXFREE_TOT_AMT",    gfn_nvl(item.TXFREE_TOT_AMT));
                        SBUxMethod.set("INC_TOT_AMT", 		gfn_nvl(item.INC_TOT_AMT));
                        SBUxMethod.set("INC_DEAMT", 		gfn_nvl(item.INC_DEAMT));
                        SBUxMethod.set("INC_AMT", 		    gfn_nvl(item.INC_AMT));

                        //-- 기본공제
                        SBUxMethod.set("PERSONAL_DEAMT", 		gfn_nvl(item.PERSONAL_DEAMT));
                        SBUxMethod.set("WIFE_DEAMT", 		    gfn_nvl(item.WIFE_DEAMT));
                        SBUxMethod.set("SUPPORT_DED_COUNT", 	gfn_nvl(item.SUPPORT_DED_COUNT));
                        SBUxMethod.set("SUPPORT_DEAMT", 		gfn_nvl(item.SUPPORT_DEAMT));

                        // -- 추가공제
                        SBUxMethod.set("SENIOR_DED_COUNT", 		    gfn_nvl(item.SENIOR_DED_COUNT));
                        SBUxMethod.set("SENIOR_DEAMT", 		        gfn_nvl(item.SENIOR_DEAMT));
                        SBUxMethod.set("HDCP_DED_COUNT", 		    gfn_nvl(item.HDCP_DED_COUNT));
                        SBUxMethod.set("HDCP_DEAMT", 		        gfn_nvl(item.HDCP_DEAMT));
                        SBUxMethod.set("WOMAN_DEAMT", 		        gfn_nvl(item.WOMAN_DEAMT));
                        SBUxMethod.set("BRING_CHILD_DED_COUNT", 	gfn_nvl(item.BRING_CHILD_DED_COUNT));
                        SBUxMethod.set("BRING_CHILD_DEAMT", 		gfn_nvl(item.BRING_CHILD_DEAMT));
                        SBUxMethod.set("CHILDBIRTH_DED_COUNT", 		gfn_nvl(item.CHILDBIRTH_DED_COUNT));
                        SBUxMethod.set("CHILDBIRTH_DEAMT", 		    gfn_nvl(item.CHILDBIRTH_DEAMT));
                        SBUxMethod.set("SINGLE_PARENT_DEAMT", 		gfn_nvl(item.SINGLE_PARENT_DEAMT));

                        //-- 다자녀추가공제
                        SBUxMethod.set("MANY_CHILD_DED_COUNT", 	gfn_nvl(item.MANY_CHILD_DED_COUNT));
                        SBUxMethod.set("MANY_CHILD_DEAMT", 		gfn_nvl(item.MANY_CHILD_DEAMT));

                        //-- 연금보험료공제
                        SBUxMethod.set("PENS_DEAMT", 		    gfn_nvl(item.PENS_DEAMT));
                        SBUxMethod.set("OFFICIAL_PENS_DEAMT", 	gfn_nvl(item.OFFICIAL_PENS_DEAMT));
                        SBUxMethod.set("MILITARY_PENS_DEAMT", 	gfn_nvl(item.MILITARY_PENS_DEAMT));
                        SBUxMethod.set("SCHOOL_PENS_DEAMT", 	gfn_nvl(item.SCHOOL_PENS_DEAMT));
                        SBUxMethod.set("POST_PENS_DEAMT", 		gfn_nvl(item.POST_PENS_DEAMT));
                        SBUxMethod.set("SCNT_PENS_DEAMT", 		gfn_nvl(item.SCNT_PENS_DEAMT));
                        SBUxMethod.set("RET_PENS_DEAMT", 		gfn_nvl(item.RET_PENS_DEAMT));
                        SBUxMethod.set("PENS_SV_DEAMT", 		gfn_nvl(item.PENS_SV_DEAMT));

                        //-- 특별공제
                        //-- 보험료
                        SBUxMethod.set("HEALTH_INSURE_DEAMT", 		gfn_nvl(item.HEALTH_INSURE_DEAMT));
                        SBUxMethod.set("EMP_INSURE_DEAMT", 		    gfn_nvl(item.EMP_INSURE_DEAMT));
                        SBUxMethod.set("GENERAL_INSURE_DEAMT", 		gfn_nvl(item.GENERAL_INSURE_DEAMT));
                        SBUxMethod.set("HDCP_INSURE_DEAMT", 		gfn_nvl(item.HDCP_INSURE_DEAMT));
                        SBUxMethod.set("TOTAL_INSURE_DED_AMT", 		gfn_nvl(item.TOTAL_INSURE_DED_AMT));

                        //-- 의료비
                        SBUxMethod.set("HDCP_MED_DEAMT", 		gfn_nvl(item.HDCP_MED_DEAMT));
                        SBUxMethod.set("ETC_MED_DEAMT", 		gfn_nvl(item.ETC_MED_DEAMT));
                        SBUxMethod.set("TOTAL_MED_DED_AMT", 	gfn_nvl(item.TOTAL_MED_DED_AMT));

                        //-- 교육비
                        SBUxMethod.set("HDCP_EDU_DEAMT", 		gfn_nvl(item.HDCP_EDU_DEAMT));
                        SBUxMethod.set("ETC_EDU_DEAMT", 		gfn_nvl(item.ETC_EDU_DEAMT));
                        SBUxMethod.set("TOTAL_EDU_DED_AMT", 	gfn_nvl(item.TOTAL_EDU_DED_AMT));

                        //-- 주택자금
                        SBUxMethod.set("HSRENT_PRIN_DED_ORG_AMT", 	gfn_nvl(item.HSRENT_PRIN_DED_ORG_AMT));
                        SBUxMethod.set("HSRENT_PRIN_DED_PERS_AMT", 	gfn_nvl(item.HSRENT_PRIN_DED_PERS_AMT));
                        SBUxMethod.set("HS_MM_RENT_DEAMT", 		    gfn_nvl(item.HS_MM_RENT_DEAMT));
                        SBUxMethod.set("HS_INT_DEAMT1", 		    gfn_nvl(item.HS_INT_DEAMT1));
                        SBUxMethod.set("HS_INT_DEAMT2", 		    gfn_nvl(item.HS_INT_DEAMT2));
                        SBUxMethod.set("HS_INT_DEAMT3", 		    gfn_nvl(item.HS_INT_DEAMT3));
                        SBUxMethod.set("HS_INT_DEAMT4", 		    gfn_nvl(item.HS_INT_DEAMT4));
                        SBUxMethod.set("HS_INT_DEAMT5", 		    gfn_nvl(item.HS_INT_DEAMT5));
                        SBUxMethod.set("HS_INT_DEAMT6", 		    gfn_nvl(item.HS_INT_DEAMT6));
                        SBUxMethod.set("HS_INT_DEAMT7", 		    gfn_nvl(item.HS_INT_DEAMT7));
                        SBUxMethod.set("HS_INT_DEAMT8", 		    gfn_nvl(item.HS_INT_DEAMT8));
                        SBUxMethod.set("HS_INT_DEAMT9", 		    gfn_nvl(item.HS_INT_DEAMT9));
                        SBUxMethod.set("TOTAL_HOUSE_DED_AMT", 		gfn_nvl(item.TOTAL_HOUSE_DED_AMT));

                        //-- 기부금
                        SBUxMethod.set("DON_POL_DEAMT", 		    gfn_nvl(item.DON_POL_DEAMT));
                        SBUxMethod.set("DON_LGL_DEAMT", 		    gfn_nvl(item.DON_LGL_DEAMT));
                        SBUxMethod.set("DON_EMP_STOCK_DEAMT", 		gfn_nvl(item.DON_EMP_STOCK_DEAMT));
                        SBUxMethod.set("DON_DSIN_DEAMT", 		    gfn_nvl(item.DON_DSIN_DEAMT));
                        SBUxMethod.set("TOTAL_DONATION_DED_AMT", 	gfn_nvl(item.TOTAL_DONATION_DED_AMT));

                        //-- 특별공제 계
                        SBUxMethod.set("SPEC_DED_TOT_AMT", 		    gfn_nvl(item.SPEC_DED_TOT_AMT));

                        //-- 표준공제
                        SBUxMethod.set("STD_DEAMT", 		        gfn_nvl(item.STD_DEAMT));

                        //-- 차감소득금액
                        SBUxMethod.set("DED_INC_AMT", 		        gfn_nvl(item.DED_INC_AMT));

                        //-- 그밖의 소득공제
                        SBUxMethod.set("PRIV_PENS_SV_DEAMT", 		        gfn_nvl(item.PRIV_PENS_SV_DEAMT));
                        SBUxMethod.set("HS_SUBS_SV_DEAMT", 		            gfn_nvl(item.HS_SUBS_SV_DEAMT));
                        SBUxMethod.set("HS_EMP_SV_DEAMT", 		            gfn_nvl(item.HS_EMP_SV_DEAMT));
                        SBUxMethod.set("HS_TOT_SV_DEAMT", 		            gfn_nvl(item.HS_TOT_SV_DEAMT));
                        SBUxMethod.set("TOTAL_HOUSE_SAVING_DED_AMT", 	    gfn_nvl(item.TOTAL_HOUSE_SAVING_DED_AMT));
                        SBUxMethod.set("CD_USE_DEAMT", 		                gfn_nvl(item.CD_USE_DEAMT));
                        SBUxMethod.set("SM_COM_DEAMT", 		                gfn_nvl(item.SM_COM_DEAMT));
                        SBUxMethod.set("INVEST_DEAMT", 		                gfn_nvl(item.INVEST_DEAMT));
                        SBUxMethod.set("EMP_STOCK_GIVE_DEAMT", 		        gfn_nvl(item.EMP_STOCK_GIVE_DEAMT));
                        SBUxMethod.set("SALARY_DECREASE_DEAMT", 		    gfn_nvl(item.SALARY_DECREASE_DEAMT));
                        SBUxMethod.set("LEASE_INT_RDM_DEAMT", 		        gfn_nvl(item.LEASE_INT_RDM_DEAMT));
                        SBUxMethod.set("LONG_INVEST_STOCK_SAVE_DED_AMT", 	gfn_nvl(item.LONG_INVEST_STOCK_SAVE_DED_AMT));
                        SBUxMethod.set("LT_COL_INV_SV_DEAMT", 		        gfn_nvl(item.LT_COL_INV_SV_DEAMT));
                        SBUxMethod.set("ETC_DED_TOT_AMT", 		            gfn_nvl(item.ETC_DED_TOT_AMT));

                        //-- 특별공제 종합한도 초과액
                        SBUxMethod.set("SPEC_DED_TOT_OVER_AMT", 	gfn_nvl(item.SPEC_DED_TOT_OVER_AMT));

                        //-- 종합소득과세표준
                        SBUxMethod.set("TOT_INC_TX_STD_AMT", 		gfn_nvl(item.TOT_INC_TX_STD_AMT));

                        //-- 산출세액
                        SBUxMethod.set("CALCULATE_TX_AMT", 		    gfn_nvl(item.CALCULATE_TX_AMT));

                        //-- 세액감면 및 세액공제
                        SBUxMethod.set("INC_TX_LAW_DEAMT", 		    gfn_nvl(item.INC_TX_LAW_DEAMT));
                        SBUxMethod.set("TX_SPEC_LAW_DEAMT", 		gfn_nvl(item.TX_SPEC_LAW_DEAMT));
                        SBUxMethod.set("TX_SPEC_LAW_30_DEAMT", 		gfn_nvl(item.TX_SPEC_LAW_30_DEAMT));
                        SBUxMethod.set("TX_TREATY_DEAMT", 		    gfn_nvl(item.TX_TREATY_DEAMT));
                        SBUxMethod.set("TX_RED_TOT_AMT", 		    gfn_nvl(item.TX_RED_TOT_AMT));
                        SBUxMethod.set("INC_TX_DEAMT", 		        gfn_nvl(item.INC_TX_DEAMT));
                        SBUxMethod.set("CHILD_TX_DED_COUNT", 		gfn_nvl(item.CHILD_TX_DED_COUNT));
                        SBUxMethod.set("CHILD_TX_DEAMT", 		    gfn_nvl(item.CHILD_TX_DEAMT));
                        SBUxMethod.set("BRING_CHILD_TX_DED_COUNT", 	gfn_nvl(item.BRING_CHILD_TX_DED_COUNT));
                        SBUxMethod.set("BRING_CHILD_TX_DEAMT", 		gfn_nvl(item.BRING_CHILD_TX_DEAMT));
                        SBUxMethod.set("CHILDBIRTH_TX_DED_COUNT", 	gfn_nvl(item.CHILDBIRTH_TX_DED_COUNT));
                        SBUxMethod.set("CHILDBIRTH_TX_DEAMT", 		gfn_nvl(item.CHILDBIRTH_TX_DEAMT));
                        SBUxMethod.set("SCNT_PENS_DED_TGT_AMT", 	gfn_nvl(item.SCNT_PENS_DED_TGT_AMT));
                        SBUxMethod.set("SCNT_PENS_TX_DEAMT", 		gfn_nvl(item.SCNT_PENS_TX_DEAMT));
                        SBUxMethod.set("RET_PENS_DED_TGT_AMT", 		gfn_nvl(item.RET_PENS_DED_TGT_AMT));
                        SBUxMethod.set("RET_PENS_TX_DEAMT", 		gfn_nvl(item.RET_PENS_TX_DEAMT));
                        SBUxMethod.set("PENS_SV_DED_TGT_AMT", 		gfn_nvl(item.PENS_SV_DED_TGT_AMT));
                        SBUxMethod.set("PENS_SV_TX_DEAMT", 		    gfn_nvl(item.PENS_SV_TX_DEAMT));
                        SBUxMethod.set("PENS_ISA_TX_DEAMT", 		gfn_nvl(item.PENS_ISA_TX_DEAMT));
                        SBUxMethod.set("PENS_ISA_DED_TGT_AMT", 		gfn_nvl(item.PENS_ISA_DED_TGT_AMT));
                        SBUxMethod.set("INSURE_DED_TGT_AMT", 		gfn_nvl(item.INSURE_DED_TGT_AMT));
                        SBUxMethod.set("INSURE_TX_DEAMT", 		    gfn_nvl(item.INSURE_TX_DEAMT));
                        SBUxMethod.set("HDCP_INSURE_DED_TGT_AMT", 	gfn_nvl(item.HDCP_INSURE_DED_TGT_AMT));
                        SBUxMethod.set("HDCP_INSURE_TX_DEAMT", 		gfn_nvl(item.HDCP_INSURE_TX_DEAMT));
                        SBUxMethod.set("MED_DED_TGT_AMT", 		    gfn_nvl(item.MED_DED_TGT_AMT));
                        SBUxMethod.set("MED_TX_DEAMT", 		        gfn_nvl(item.MED_TX_DEAMT));
                        SBUxMethod.set("EDU_DED_TGT_AMT", 		    gfn_nvl(item.EDU_DED_TGT_AMT));
                        SBUxMethod.set("EDU_TX_DEAMT", 		        gfn_nvl(item.EDU_TX_DEAMT));
                        SBUxMethod.set("DON_POL_DED_TGT_AMT", 		gfn_nvl(item.DON_POL_DED_TGT_AMT));
                        SBUxMethod.set("DON_POL_TX_DEAMT", 		    gfn_nvl(item.DON_POL_TX_DEAMT));
                        SBUxMethod.set("DON_POL_EXCS_DED_TGT_AMT", 	gfn_nvl(item.DON_POL_EXCS_DED_TGT_AMT));
                        SBUxMethod.set("DON_POL_EXCS_TX_DEAMT", 	gfn_nvl(item.DON_POL_EXCS_TX_DEAMT));

                        //--2023년 귀속
                        SBUxMethod.set("DON_HLE_DED_TGT_AMT", 		gfn_nvl(item.DON_HLE_DED_TGT_AMT));
                        SBUxMethod.set("DON_HLE_TX_DEAMT", 		    gfn_nvl(item.DON_HLE_TX_DEAMT));
                        SBUxMethod.set("DON_HLE_EXCS_DED_TGT_AMT", 	gfn_nvl(item.DON_HLE_EXCS_DED_TGT_AMT));
                        SBUxMethod.set("DON_HLE_EXCS_TX_DEAMT", 	gfn_nvl(item.DON_HLE_EXCS_TX_DEAMT));

                        SBUxMethod.set("DON_LGL_DED_TGT_AMT", 		gfn_nvl(item.DON_LGL_DED_TGT_AMT));
                        SBUxMethod.set("DON_LGL_TX_DEAMT", 		    gfn_nvl(item.DON_LGL_TX_DEAMT));
                        SBUxMethod.set("DON_EMP_STOCK_DED_TGT_AMT", gfn_nvl(item.DON_EMP_STOCK_DED_TGT_AMT));
                        SBUxMethod.set("DON_EMP_STOCK_TX_DEAMT", 	gfn_nvl(item.DON_EMP_STOCK_TX_DEAMT));
                        SBUxMethod.set("DON_DSIN_DED_TGT_AMT", 		gfn_nvl(item.DON_DSIN_DED_TGT_AMT));
                        SBUxMethod.set("DON_DSIN_TX_DEAMT", 		gfn_nvl(item.DON_DSIN_TX_DEAMT));
                        SBUxMethod.set("DON_DSIN_REL_DED_TGT_AMT", 	gfn_nvl(item.DON_DSIN_REL_DED_TGT_AMT));
                        SBUxMethod.set("DON_DSIN_REL_TX_DEAMT", 	gfn_nvl(item.DON_DSIN_REL_TX_DEAMT));
                        SBUxMethod.set("SPEC_TX_DED_TOT_AMT", 		gfn_nvl(item.SPEC_TX_DED_TOT_AMT));
                        SBUxMethod.set("STD_TX_DEAMT", 		        gfn_nvl(item.STD_TX_DEAMT));
                        SBUxMethod.set("TX_UNION_DEAMT", 		    gfn_nvl(item.TX_UNION_DEAMT));
                        SBUxMethod.set("HSRENT_INT_RDM_DEAMT", 		gfn_nvl(item.HSRENT_INT_RDM_DEAMT));

                        SBUxMethod.set("FOREI_PAY_TX_DEAMT", 		gfn_nvl(item.FOREI_PAY_TX_DEAMT));
                        SBUxMethod.set("HS_MM_RENT_DED_TGT_AMT", 	gfn_nvl(item.HS_MM_RENT_DED_TGT_AMT));
                        SBUxMethod.set("HS_MM_RENT_TX_DEAMT", 		gfn_nvl(item.HS_MM_RENT_TX_DEAMT));
                        SBUxMethod.set("TX_DED_TOT_AMT", 		    gfn_nvl(item.TX_DED_TOT_AMT));
                        SBUxMethod.set("CALC_INC_TX_AMT", 		    gfn_nvl(item.CALC_INC_TX_AMT));
                        SBUxMethod.set("CALC_LOCAL_TX_AMT", 		gfn_nvl(item.CALC_LOCAL_TX_AMT));
                        SBUxMethod.set("CALC_SPEC_TX_AMT", 		    gfn_nvl(item.CALC_SPEC_TX_AMT));
                        SBUxMethod.set("CALC_TX_TOT_AMT", 		    gfn_nvl(item.CALC_TX_TOT_AMT));
                        SBUxMethod.set("NOW_INC_TX_AMT", 		    gfn_nvl(item.NOW_INC_TX_AMT));
                        SBUxMethod.set("NOW_LOCAL_TX_AMT", 		    gfn_nvl(item.NOW_LOCAL_TX_AMT));
                        SBUxMethod.set("NOW_SPEC_TX_AMT", 		    gfn_nvl(item.NOW_SPEC_TX_AMT));
                        SBUxMethod.set("NOW_TX_TOT_AMT", 		    gfn_nvl(item.NOW_TX_TOT_AMT));

                        //-- 전 근무지 값이 감안된 값임
                        SBUxMethod.set("INC_TX_AMT", 		gfn_nvl(item.INC_TX_AMT));
                        SBUxMethod.set("LOCAL_TX_AMT", 		gfn_nvl(item.LOCAL_TX_AMT));
                        SBUxMethod.set("SPEC_TX_AMT", 		gfn_nvl(item.SPEC_TX_AMT));
                        SBUxMethod.set("TX_TOT_AMT", 		gfn_nvl(item.TX_TOT_AMT));

                    });

                } else {
                    alert(data.resultMessage);
                }

            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }

        }
    }

    //세액계산, 세액계산 취소
    const fn_btnCalculation = async function (type) {

        let stremp_code  = '';
        let strcalc_date = '';


        let YE_TX_TYPE = gfnma_multiSelectGet('#SRCH_YE_TX_TYPE'); //정산구분
        let YE_TX_YYYY = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedCorpCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_YE_TX_YYYY        : YE_TX_YYYY
            , V_P_YEAR_END_TX_TYPE  : YE_TX_TYPE
            , V_P_EMP_CODE          : stremp_code
            , V_P_CALC_DAT          : strcalc_date

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''

        }

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1700S1.do", {
            getType: 'json',
            workType: type,
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (_.isEqual(data.v_errorCode, 'MSG0001') || _.isEqual(data.v_errorCode, 'MSG0002')) {
                    fn_search('LIST');
                } else {
                    alert(data.resultMessage);
                }

            } else {
                alert(data.resultMessage);
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }


    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>

