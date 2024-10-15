<%
    /**
     * @Class Name        : hra1100.jsp
     * @Description       : 연말정산기준등록 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.07.23
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.23   	표주완		최초 생성
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
    <title>title : 연말정산기준등록</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>

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
                <sbux-button id="btnCopy" name="btnCopy" uitype="normal" text="전년도 자료복사" class="btn btn-sm btn-outline-danger"
                             onclick="fn_btnCopy"></sbux-button>
            </div>
        </div>

        <!--[pp] 검색 -->
        <!--[APC] START -->
        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        <table id="dataArea1" class="table table-bordered tbl_fixed">
            <caption>검색 조건 설정</caption>
            <colgroup>
                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 7%">
                <col style="width: 2%">

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
                <th scope="row" class="th_bg">정산연도</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-ye_tx_yyyy"
                            name="srch-ye_tx_yyyy"
                            uitype="popup"
                            datepicker-mode="year"
                            date-format="yyyy"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            style="width: 95%;"
                            required>
                        <%--onchange="fn_payDate"--%>
                    </sbux-datepicker>
                </td>
                <td colspan="9" style="border-right: hidden;"></td>
            </tr>
            </tbody>
        </table>

        <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
                <li><span>연말정산 기준등록</span></li>
            </ul>
        </div>

        <sbux-tabs id="tabJson" name="tabJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false">
        </sbux-tabs>
        <div class="tab-content">
            <div id="tabInfo1" >
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>근로소득공제</span>
                        </li>
                    </ul>
                    <sbux-button
                            id="btnDel"
                            name="btnDel"
                            uitype="normal"
                            text="행삭제"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_btnDel"
                            style="float: right;"
                    >
                    </sbux-button>
                    <sbux-button
                            id="btnAdd"
                            name="btnAdd"
                            uitype="normal"
                            text="행추가"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_btnAdd"
                            style="float: right;"
                    ></sbux-button>
                </div>
                <div>
                    <div id="sb-area-gvwDeduction" style="height:300px; width:100%;"></div>
                </div>

                <div class="row">
                    <div class="col-sm-3">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>기본공제</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div>
                                <table id="dataArea2" class="table table-bordered tbl_fixed">
                                    <colgroup>
                                        <col style="width:4%">
                                        <col style="width:6%">
                                        <col style="width:2%">
                                        <%-- <col style="width:2%">--%>

                                    </colgroup>
                                    <tr>
                                        <th scope="row" class="th_bg">본인기본공제  연</th>
                                        <td colspan="2" class="td_input" style="border-right:hidden;">
                                            <sbux-input id="PERSONAL_DED_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                        ></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">배우자공제  연</th>
                                        <td colspan="2" class="td_input" style="border-right:hidden;">
                                            <sbux-input id="WIFE_DED_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                        ></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">부양가족공제  1명당 연</th>
                                        <td colspan="2" class="td_input" style="border-right:hidden;">
                                            <sbux-input id="SUPPORT_DED_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                        ></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">외국인근로자 단일세율</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="FOREI_WORK_SINGLE_TX_RATE" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                                        ></sbux-input>
                                        </td>
                                        <td>
                                            <p>%</p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-9">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>추가공제</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea3" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:4%">
                                    <col style="width:6%">
                                    <col style="width:2%">
                                    <col style="width:10%">
                                    <%-- <col style="width:2%">--%>

                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">경로우대공제(만 70세 이상)  1명당 연</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SENIOR_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                    ></sbux-input>
                                    </td>
                                    <td colspan="2" style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">장애인공제  1명당 연</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                    ></sbux-input>
                                    </td>
                                    <td colspan="2" style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">부녀자공제  연</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WOMAN_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                    ></sbux-input>
                                    </td>
                                    <td colspan="2" style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">해당 과세기간 근로소득금액이</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WOMAN_INC_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                    ></sbux-input>
                                    </td>
                                    <td colspan="2" ><p>이하자</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">한부모공제  연</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SINGLE_PARENT_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                    ></sbux-input>
                                    </td>
                                    <td colspan="2" style="border-right: hidden;"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="tabInfo2" >
                <div class="row">
                    <div class="col-sm-5">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>주택자금공제</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div>
                                <table id="dataArea4" class="table table-bordered tbl_fixed">
                                    <colgroup>
                                        <col style="width:7%">
                                        <col style="width:6%">
                                        <col style="width:2%">
                                        <%-- <col style="width:2%">--%>

                                    </colgroup>
                                    <tr>
                                        <th scope="row" class="th_bg">주택임차차입금원리금상환액 거주자간 차입한 경우 해당 과세기간 총급여액이</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HSRENT_PRIN_PERS_INC_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                        ></sbux-input>
                                        </td>
                                        <td><p>이하자</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">주택임차차입금원리금상환액의</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HSRENT_PRIN_DER" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                                        ></sbux-input>
                                        </td>
                                        <td><p>%</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">주택임차차입금원리금상환액  연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HSRENT_PRIN_DED_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                        ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">주택임차차입금원리금상환액, 주택마련저축공제와 합하여  연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HS_SV_PRIN_RENT_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                        ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">장기주택 저당차입금 이자상환액 2011년 이전 차입분 15년미만  연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HSLOAN_10_15_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                        ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">장기주택 저당차입금 이자상환액 2011년 이전 차입분 15년-29년  연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HSLOAN_15_30_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                        ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">장기주택 저당차입금 이자상환액 2011년 이전 차입분 30년이상  연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HSLOAN_30_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                        ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">장기주택 저당차입금 이자상환액 2012년 이후 차입분 고정금리ㆍ비거치 상환대출  연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HSLOAN_FX_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                        ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">장기주택 저당차입금 이자상환액 2012년 이후 차입분 기타대출  연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HSLOAN_ETC_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                                        ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">(15년 이상) 장기주택 저당차입금 이자상환액 2015년 이후 차입분 70%이상을 고정금리 AND 비거치식 분할상환 방식 연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HSLOAN_FX_15_AND_LIM_2015" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">(15년이상) 장기주택 저당차입금 이자상환액 2015년 이후 차입분 70%이상을 고정금리 OR 비거치식  분할상환 방식 연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HSLOAN_FX_15_OR_LIM_2015" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">(15년이상) 일반적인 방법의 차입 연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HSLOAN_GENERAL_LIM_2015" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">(10년이상) 장기주택 저당차입금 이자상환액 2015년 이후 차입분 70%이상을 고정금리 OR 비거치식 분할 상환 방식 연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HSLOAN_FX_10_LIM_2015" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-7">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>추가공제</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea5" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:4%">
                                    <col style="width:6%">
                                    <col style="width:2%">
                                    <col style="width:10%">
                                    <%-- <col style="width:2%">--%>

                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">정치자금기부금/법정기부금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_LGL_R" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                                    ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">우리사주 조합기부금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_EMP_STOCK_R" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">종교단체 외 지정기부금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_OUT_OF_REL_R" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">종교단체 지정기부금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_REL_R" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">종교단체 지정기부금 비교</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_ASSIGN_COMPARE_R" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">특례기부금/공익법인기부신탁 기부금 (11.06.30.까지 지출분)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_SPEC_R" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>%</p></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="tabInfo3" >
                <div class="row">
                    <div class="col-sm-4">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>개인연금저축 소득공제</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div>
                                <table id="dataArea6" class="table table-bordered tbl_fixed">
                                    <colgroup>
                                        <col style="width:7%">
                                        <col style="width:6%">
                                        <col style="width:2%">
                                        <%-- <col style="width:2%">--%>

                                    </colgroup>
                                    <tr>
                                        <th scope="row" class="th_bg">2000.12.31. 이전에 가입한 개인연금저축 납입액의</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="PRIV_PENS_SV_R" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>%</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="PRIV_PENS_SV_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>소기업ㆍ소상공인 공제부금 소득공제</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div>
                                <table id="dataArea7" class="table table-bordered tbl_fixed">
                                    <colgroup>
                                        <col style="width:7%">
                                        <col style="width:6%">
                                        <col style="width:2%">
                                        <%-- <col style="width:2%">--%>

                                    </colgroup>
                                    <tr>
                                        <th scope="row" class="th_bg">4천만원 이하</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="SM_COM_DED_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm"  <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">4천만원~1억원</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="SMALL_COM_DED_LIMIT2" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">1억원 초과</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="SMALL_COM_DED_LIMIT3" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>주택마련저축 소득공제</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div>
                                <table id="dataArea8" class="table table-bordered tbl_fixed">
                                    <colgroup>
                                        <col style="width:3%">
                                        <col style="width:4%">
                                        <col style="width:6%">
                                        <col style="width:2%">
                                        <%-- <col style="width:2%">--%>

                                    </colgroup>
                                    <tr>
                                        <th colspan="2" scope="row" class="th_bg">주택마련저축 총급여한도</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HS_SV_INC_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm"  <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th colspan="2" scope="row" class="th_bg">근로자주택마련저축  월</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HS_EMP_SV_DED_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th rowspan="2" scope="row" class="th_bg">총급여 한도 이하</th>
                                        <th scope="row" class="th_bg">청약저축  연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HS_SUBS_SV_DED_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">주택청약종합저축  연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HS_TOT_SV_DED_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th rowspan="2" scope="row" class="th_bg">총급여 한도초과</th>
                                        <th scope="row" class="th_bg">청약저축  연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HS_SUBS_SV_DED_BEF_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">주택청약종합저축  연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HS_TOT_SV_DED_BEF_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th colspan="2" scope="row" class="th_bg">주택마련저축 불입금액의</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HS_SV_DER" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>%</p></td>
                                    </tr>
                                    <tr>
                                        <th colspan="2" scope="row" class="th_bg">주택마련저축 공제금액  연</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HS_SV_DED_LIM" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>투자조합출자 등 소득공제</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div>
                                <table id="dataArea9" class="table table-bordered tbl_fixed">
                                    <colgroup>
                                        <col style="width:7%">
                                        <col style="width:6%">
                                        <col style="width:2%">
                                        <%-- <col style="width:2%">--%>

                                    </colgroup>
                                    <tr>
                                        <th scope="row" class="th_bg">출자 또는 투자금액의</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="INVEST_R1" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>%</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">2014년분 : 5천만원 이하분</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="INVEST_R4" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>%</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">2014년분 : 5천만원 초과분</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="INVEST_R5" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>%</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">2015년분 : 5천만원 이하분</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="INVEST_R9" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>%</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">2015년분 : 5천만원 초과분</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="INVEST_R10" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>%</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">근로소득금액의</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="INVEST_R6" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">2013년 이전</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="INVEST_R7" uitype="text" placeholder=""
                                                        class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                            ></sbux-input>
                                        </td>
                                        <td><p>한도</p></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>신용카드 등 사용금액</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea10" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:2%">

                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:2%">

                                    <col style="width:2%">
                                    <col style="width:2%">
                                    <col style="width:1%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">총급여액의</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CD_DED_BASE_R" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="7"><p>% 를 초과하는 금액에 대해</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">신용카드(전통시장,대중교통제외)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CD_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="4"><p>%</p></td>
                                    <th scope="row" class="th_bg" style="display: none">전통시장 사용분</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="TDMK_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td style="display: none"><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">직불카드 등(전통시장,대중교통제외)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHKCD_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="4"><p>%</p></td>
                                    <th scope="row" class="th_bg" style="display: none">대중교통 1월~6월 이용분</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="PBTRN_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td style="display: none"><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">현금영수증(전통시장,대중교통제외)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CASH_RECEIPT_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="4"><p>%</p></td>
                                    <th scope="row" class="th_bg" style="display: none">대중교통 7월~12월 이용분</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="PBTRN_DER2" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td style="display: none"><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">전통시장 1~3월 사용분</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TDMK_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>%</p></td>
                                    <th scope="row" class="th_bg">전통시장 사용분 추가공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CD_MARKET_ADD_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>한도</p></td>
                                    <th scope="row" class="th_bg" style="display: none">총급여 7천만원 이하자 도서공연비 이용분</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="BOOK_PERF_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td style="border-right: hidden; display: none;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">전통시장 4~12월 사용분</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TDMK_DER2" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="7"><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">대중교통 이용분</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PBTRN_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>%</p></td>
                                    <th scope="row" class="th_bg">대중교통 이용분 추가공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CD_TRANSPORT_ADD_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="4"><p>한도</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">도서공연비등 1~3월 이용분</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BOOK_PERF_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>%</p></td>
                                    <th scope="row" class="th_bg">도서공연비 이용분 추가공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CD_BOOK_PERF_ADD_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="4"><p>한도</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">도서공연비등 4~12월 이용분</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BOOK_PERF_DER2" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="7"><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">총급여액 7천만원 이하는 연</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CD_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="7"><p>과</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">총급여액의</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CD_DED_COMPARE_R" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="7"><p>% 중 적은 금액 한도</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">총급여액 7천만원~1억2천만원</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CARD_DED_LIMIT2" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="7"><p>한도</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">총급여액 1억2천만원 초과</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CARD_DED_LIMIT3" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="7"><p>한도</p></td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>우리사주출연금 소득공제</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea11" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:2%">

                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:2%">

                                    <col style="width:2%">
                                    <col style="width:2%">
                                    <col style="width:1%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">출연금  연</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMP_STOCK_GIVE_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="7"><p>한도</p></td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>고용유지 중소기업 근로자 소득공제</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea12" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:2%">

                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:2%">

                                    <col style="width:2%">
                                    <col style="width:2%">
                                    <col style="width:1%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">임금감소액의</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SALARY_DECREASE_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>%</p></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SALARY_DECREASE_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="5"><p>한도</p></td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>목돈안드는 전세이자상환액 소득공제</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea13" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:2%">

                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:2%">

                                    <col style="width:2%">
                                    <col style="width:2%">
                                    <col style="width:1%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">이자상환액의</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LEASE_INT_RDM_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>%</p></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LEASE_INT_RDM_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="5"><p>한도</p></td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>장기집합투자증권저축 소득공제</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea14" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:5%">
                                    <col style="width:1%">
                                    <col style="width:4%">
                                    <col style="width:2%">

                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:2%">

                                    <col style="width:2%">
                                    <col style="width:2%">
                                    <col style="width:1%">
                                </colgroup>
                                <tr>
                                    <th colspan="2" scope="row" class="th_bg">해당 과세기간의 총급여액이</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LT_INV_ST_SV_INC_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="7"><p>이하자</p></td>
                                </tr>
                                <tr>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LT_INV_ST_SV_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>%</p></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LT_INV_ST_SV_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="7"><p>한도</p></td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>소득공제 종합한도 초과액</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea15" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:2%">

                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:2%">

                                    <col style="width:2%">
                                    <col style="width:2%">
                                    <col style="width:1%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">소득공제 종합한도 대상 공제금액의 합이</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_DED_TOT_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="7"><p>초과시 종합소득 과세표준에 합산</p></td>
                                </tr>
                                <tr style="display: none">
                                    <th scope="row" class="th_bg">개인이 직접 또는 개인투자조합을 통해 벤처기업에 투자하는 경우    2012년분</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INVEST_R2" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>%</p></td>
                                    <th scope="row" class="th_bg">2013년분</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INVEST_R3" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="4"><p>%</p></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="tabInfo4" >
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>근로소득세액공제</span></li>
                    </ul>
                </div>
                <div>
                    <table id="dataArea16" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:1%">
                            <col style="width:4%">
                            <col style="width:3%">
                            <col style="width:4%">
                            <col style="width:2%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">근로소득에 대한 산출세액이</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="INC_TX_DED_STD" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <td><p>이하 산출세액의</p></td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="INC_TX_DED_BELOW_R" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="3"><p>%</p></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border-right: hidden;"></td>
                            <td style="text-align:right"><p>초과</p></td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="INC_TX_DED_EXCS_AMT" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <td><p>+ 초과하는 금액의</p></td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="INC_TX_DED_EXCS_AMT_R" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td><p>%</p></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">근로소득 세액공제 한도    총급여액이</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_TOT_TX_DED_STD" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <td><p>이하자</p></td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_TOT_TX_DED_STD_LIM" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="4" style="border-right: hidden; display: none;"></td>
                        </tr>
                        <tr>
                            <td style="border-right: hidden"></td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_TOT_TX_DED_BELOW" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <td><p>이하자</p></td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_TOT_TX_DED_BELOW_LIM" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">감면율</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_TOT_TX_DED_BELOW_R" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td><p>%</p></td>
                        </tr>
                        <tr>
                            <td style="border-right: hidden;"></td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_TOT_TX_DED_BELOW2" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <td><p>이하자</p></td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_TOT_TX_DED_BELOW_LIM2" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="3" style="border-right: hidden; display: none;"></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border-right: hidden;"></td>
                            <td><p>초과자</p></td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_TOT_TX_DED_EXLMT" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">감면율</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_TOT_TX_DED_EXCS_R" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td><p>%</p></td>
                        </tr>
                    </table>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>자녀 세액공제</span>

                                </li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea17" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:1%">
                                </colgroup>
                                <tr>
                                    <td><p>공제인원이 2명 이하인 경우 1명당</p></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHILD_TX_DED_LIM1" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <td><p>공제인원이 3명 이상인 경우 1명당</p></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHILD_TX_DED_LIM2" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>6세이하 자녀(2018년귀속부터폐지)</span>

                                </li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea18" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:1%">
                                </colgroup>
                                <tr>
                                    <td><p>공제인원이 2명 이상인경우 2자녀부터 1명당</p></td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BRING_CHILD_TX_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>연금계좌 50세 이하 세액공제</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea19" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:1%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">연</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ACC_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>한도</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">납입한 금액중 공제대상금액의</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ACC_TX_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">연금계좌 해당 과세기간의 총급여액이</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ACC_DED_INC_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>이하자</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">총급여한도 이하자의 경우 공제대상금액의</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ACC_TX_DED_BELOW_R" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">퇴직연금 + 연금계좌  연 </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_PENS_ACC_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>한도</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">ISA 만기시 연급계좌 </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ISA_DED_LIMIT" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>한도</p></td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top" style="display: none">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>연금계좌 50세 이상 세액공제 적용기간 2022.12.31</span>
                                </li>
                            </ul>
                        </div>
                        <div style="display: none">
                            <table id="dataArea20" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:1%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">연</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ACC_50_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>한도</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">총급여 1억2천만원 초과자</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ACCOUNT_50_DED_LIMIT2" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>한도</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">납입한 금액중 공제대상금액의</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ACC_50_TX_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">연금계좌 해당 과세기간의 총급여액이</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ACC_50_DED_INC_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>이하자</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">총급여한도 이하자의 경우 공제대상금액의</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ACC_50_TX_DED_BELOW_R" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">퇴직연금 + 연금계좌  연(1억2천만원 초과)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_PENS_ACC_50_OVER_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>한도</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">퇴직연금 + 연금계좌  연(1억2천만원 이하)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_PENS_ACC_50_BELOW_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td><p>한도</p></td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="col-sm-8">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>보장성보험료 세액공제</span></li>
                            </ul>
                        </div>

                        <div>
                            <table id="dataArea21" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:1%">

                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">보장성보험  연</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="GENERAL_INSURE_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>한도</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">세액 공제율</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="GENERAL_INSURE_TX_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">장애인전용 보장성보험  연</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_INSURE_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>한도</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">세액 공제율</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_INSURE_TX_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>%</p></td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>의료비 세액공제</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea22" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:1%">

                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">총 급여액의</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="MED_EXP_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>% 를</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">초과한 금액에 대해</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="MED_EXP_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>한도</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">의료비공제대상금액의</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="MED_EXP_TX_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">난임시술비 세액공제율</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="MED_EXP_TAX_DED_RATE2" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>%</p></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">미숙아･선천성 이상아 세액공제율</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="MED_EXP_TAX_DED_RATE3" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>%</p></td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>교육비 세액공제</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea23" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:1%">

                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">취학전아동  1명당 연</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EDU_EXP_DED_LIM1" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2" rowspan="3" style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">초ㆍ중ㆍ고등학생  1당명 연</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EDU_EXP_DED_LIM2" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">대학생  1명당 연</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EDU_EXP_DED_LIM3" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">교육비공제대상금액의</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EDU_EXP_TX_DER" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2"><p>%</p></td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>출생ㆍ입양자녀</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea24" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:6%">
                                    <col style="width:4%">
                                    <col style="width:1%">

                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">출생ㆍ입양 첫째 공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHILDBIRTH_TX_DED_LIM" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2" rowspan="3" style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">출생ㆍ입양 둘째 공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHILDBIRTH_TAX_DED_LIMIT2" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">출생ㆍ입양 셋째 이상 공제</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHILDBIRTH_TAX_DED_LIMIT3" uitype="text" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="tabInfo5" >
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>출생ㆍ입양자녀</span></li>
                    </ul>
                </div>
                <div>
                    <table id="dataArea25" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:1%">

                            <col style="width:4%">
                            <col style="width:1%">

                            <col style="width:15%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">정치자금기부금</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="DON_POL_DED_LIM" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="4"><p>한도</p></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">기부금</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="DON_TX_DED_STD" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <td><p>한도</p></td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="DON_TX_DED_BELOW_R" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="2"><p>%</p></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-right: hidden;"></td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="DON_TX_DED_EXCS_R" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="2"><p>%</p></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">종교단체 외 지정기부금</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="DON_OUT_OF_REL_DER" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="4"><p>%</p></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">종교단체 지정기부금</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="DON_REL_DER" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="4"><p>%</p></td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>표준세액공제</span></li>
                    </ul>
                </div>
                <div>
                    <table id="dataArea26" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:1%">

                            <col style="width:4%">
                            <col style="width:1%">

                            <col style="width:15%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">특별소득공제, 특별세액공제, 월세세액공제를 신청하지 아니한 경우  연</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="STD_TX_DED_LIM" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="4" style="border-right: hidden;"></td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>납세조합공제</span></li>
                    </ul>
                </div>
                <div>
                    <table id="dataArea27" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:1%">

                            <col style="width:4%">
                            <col style="width:1%">

                            <col style="width:15%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">근로소득에 대한 종합소득산출세액의</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="TX_UNION_DER" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="4"><p>%</p></td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>주택차입금 이자상환액공제</span></li>
                    </ul>
                </div>
                <div>
                    <table id="dataArea28" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:1%">

                            <col style="width:4%">
                            <col style="width:1%">

                            <col style="width:15%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">주택차입금 이자상환액 (95.11.1.~97.12.31. 취득) 중</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="HSRENT_INT_DER" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="4"><p>%</p></td>
                        </tr>
                    </table>
                </div>

                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>월세 세액공제</span></li>
                    </ul>
                </div>
                <div>
                    <table id="dataArea29" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:1%">

                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:1%">

                            <col style="width:9%">
                        </colgroup>
                        <tr>
                            <th rowspan="2" scope="row" class="th_bg">월세액 해당 과세기간의 총급여액이</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="HS_MM_RENT_DED_INC_LIM" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <td><p>이하자</p></td>
                            <th rowspan="2" scope="row" class="th_bg">월세공제대상금액의</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="HS_MM_RENT_TX_DER" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="2"><p>%</p></td>
                        </tr>
                        <tr>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="HS_MM_RENT_DED_INC_LIM2" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <td><p>이하자</p></td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="HS_MM_RENT_TX_DER2" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="2"><p>%</p></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">연</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="HS_MM_RENT_TX_DED_LIM" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': '.' , 'isShortcutChar': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="4"><p>한도</p></td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>농어촌특별세</span></li>
                    </ul>
                </div>
                <div>
                    <table id="dataArea30" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:1%">

                            <col style="width:4%">
                            <col style="width:1%">

                            <col style="width:15%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">투자조합 출자공제의</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="INVEST_DED_SPEC_TX_R" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="4"><p>%</p></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">주택차입금 이자상환액공제의</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="HSRENT_INT_DED_SPEC_TX_R" uitype="text" placeholder=""
                                            class="form-control input-sm" <%--mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"--%>
                                ></sbux-input>
                            </td>
                            <td colspan="4"><p>%</p></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">


    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    var editType = "N";

    //grid 초기화
    var gvwDeductionGrid; 			// 그리드를 담기위한 객체 선언
    var jsonDeductionList = []; 	// 그리드의 참조 데이터 주소 선언



    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

        ]);
    }

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        let openDate = gfn_dateToYear(new Date());

        SBUxMethod.set('srch-ye_tx_yyyy', openDate);

        fn_createGrid();

    }

    // 신규
      function cfn_add() {
          editType = "N";
          fn_create();
      }
    // 저장
    function cfn_save() {

        if (_.isEqual(editType, 'N')){

            if (gfn_comConfirm("Q0001", "신규 등록")) {
                fn_save('N');


                let gridData = gvwDeductionGrid.getUpdateData(true, 'all');

                if (_.isEmpty(gridData) == false){

                    fn_saveS1(gridData);

                }


            }

        }else if (_.isEqual(editType, 'E')){

            // 수정 저장
            if (gfn_comConfirm("Q0001", "수정 저장")) {
                fn_save('U');

                let gridData = gvwDeductionGrid.getUpdateData(true, 'all');

                if (_.isEmpty(gridData) == false){

                    fn_saveS1(gridData);

                }
            }
        }

    }
    // 삭제
    /*function cfn_del() {
        fn_delete();
    }*/

    // 조회
    function cfn_search() {
        editType = "E";
        fn_search();
    }

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }

    var tabJsonData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "근로소득공제/기본공제/추가공제",     "targetid" : "tabInfo1" ,     "targetvalue" : "근로소득공제/기본공제/추가공제"},
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "특별소득공제",                    "targetid" : "tabInfo2" ,     "targetvalue" : "특별소득공제"},
        { "id" : "2", "pid" : "-1", "order" : "3", "text" : "그 밖의 소득공제",                "targetid" : "tabInfo3" ,     "targetvalue" : "그 밖의 소득공제"},
        { "id" : "3", "pid" : "-1", "order" : "4", "text" : "세액공제1",                      "targetid" : "tabInfo4" ,     "targetvalue" : "세액공제1"},
        { "id" : "4", "pid" : "-1", "order" : "5", "text" : "세액공제2",                      "targetid" : "tabInfo5" ,     "targetvalue" : "세액공제2"},
    ];

    //근로소득공제
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwDeduction';
        SBGridProperties.id = 'gvwDeductionGrid';
        SBGridProperties.jsonref = 'jsonDeductionList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["총 급여액 초과"], ref: 'INC_FROM_AMT', type: 'input', width: '170px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["총 급여액 이하"], ref: 'INC_TO_AMT', type: 'input', width: '170px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["기본공제금액"], ref: 'BASE_DEAMT', type: 'input', width: '170px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["추가공제비율"], ref: 'DER', type: 'input', width: '170px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###.00', emptyvalue:'0.0' }},
            {caption: ["공제한도"], ref: 'DEDUCTION_LIMIT_EAMT', type: 'input', width: '170px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '170px', style: 'text-align:left'},
        ];

        gvwDeductionGrid = _SBGrid.create(SBGridProperties);
        /*gvwDeductionGrid.bind('click', 'fn_view');*/
    }

    //신규 작성
    function fn_create() {

        for (let i = 2; i < 31; i++){
            let dataArea = '#dataArea' + i;
            /*console.log('---dataArea----',dataArea);*/
            gfnma_uxDataClear(dataArea);
        }

    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let YE_TX_YYYY = gfnma_nvl(SBUxMethod.get("srch-ye_tx_yyyy")); //정산년도

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산년도");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_YE_TX_YYYY   : YE_TX_YYYY

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1100List.do", {
            getType: 'json',
            workType: 'INFO',
            cv_count: '2',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /*/!** @type {number} **!/
                let totalRecordCount = 0;*/

                jsonDeductionList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        INC_FROM_AMT        : gfnma_nvl(item.INC_FROM_AMT),
                        INC_TO_AMT          : gfnma_nvl(item.INC_TO_AMT),
                        BASE_DEAMT          : gfnma_nvl(item.BASE_DEAMT),
                        DEDUCTION_LIMIT_EAMT: gfnma_nvl(item.DEDUCTION_LIMIT_EAMT),
                        DER                 : gfnma_nvl(item.DER),
                        MEMO                : gfnma_nvl(item.MEMO),
                        DEDUCTION_LIMIT_EAMT: gfnma_nvl(item.DEDUCTION_LIMIT_EAMT)
                    }
                    jsonDeductionList.push(msg);
                   /* totalRecordCount++;*/
                });

                gvwDeductionGrid.rebuild();
                /*document.querySelector('#listCount').innerText = totalRecordCount;*/

                if (jsonDeductionList.length > 0){
                    jsonDeductionList.forEach((item, index) => {
                        gvwDeductionGrid.setCellDisabled(index+1, 0, index+1, 0, true, false, true);
                    })
                }

                data.cv_2.forEach((item, index) => {

                    //- 기본공제
                    SBUxMethod.set("PERSONAL_DED_LIM", 		    gfnma_nvl(item.PERSONAL_DED_LIM));
                    SBUxMethod.set("WIFE_DED_LIM", 		        gfnma_nvl(item.WIFE_DED_LIM));
                    SBUxMethod.set("SUPPORT_DED_LIM", 		    gfnma_nvl(item.SUPPORT_DED_LIM));
                    SBUxMethod.set("FOREI_WORK_SINGLE_TX_RATE", gfnma_nvl(item.FOREI_WORK_SINGLE_TX_RATE));
                    //- 추가공제
                    SBUxMethod.set("SENIOR_DED_LIM", 		    gfnma_nvl(item.SENIOR_DED_LIM));
                    SBUxMethod.set("HDCP_DED_LIM", 		        gfnma_nvl(item.HDCP_DED_LIM));
                    SBUxMethod.set("WOMAN_DED_LIM", 		    gfnma_nvl(item.WOMAN_DED_LIM));
                    SBUxMethod.set("WOMAN_INC_LIM", 		    gfnma_nvl(item.WOMAN_INC_LIM));
                    SBUxMethod.set("SINGLE_PARENT_DED_LIM", 	gfnma_nvl(item.SINGLE_PARENT_DED_LIM));
                    //- 주택자금공제
                    SBUxMethod.set("HSRENT_PRIN_PERS_INC_LIM", 	gfnma_nvl(item.HSRENT_PRIN_PERS_INC_LIM));
                    SBUxMethod.set("HSRENT_PRIN_DER", 	        gfnma_nvl(item.HSRENT_PRIN_DER));
                    SBUxMethod.set("HSRENT_PRIN_DED_LIM", 	    gfnma_nvl(item.HSRENT_PRIN_DED_LIM));
                    SBUxMethod.set("HS_SV_PRIN_RENT_LIM", 	    gfnma_nvl(item.HS_SV_PRIN_RENT_LIM));
                    SBUxMethod.set("HSLOAN_10_15_LIM", 	        gfnma_nvl(item.HSLOAN_10_15_LIM));
                    SBUxMethod.set("HSLOAN_15_30_LIM", 	        gfnma_nvl(item.HSLOAN_15_30_LIM));
                    SBUxMethod.set("HSLOAN_30_LIM", 	        gfnma_nvl(item.HSLOAN_30_LIM));
                    SBUxMethod.set("HSLOAN_FX_LIM", 	        gfnma_nvl(item.HSLOAN_FX_LIM));
                    SBUxMethod.set("HSLOAN_ETC_LIM", 	        gfnma_nvl(item.HSLOAN_ETC_LIM));
                    SBUxMethod.set("HSLOAN_FX_15_AND_LIM_2015", gfnma_nvl(item.HSLOAN_FX_15_AND_LIM_2015));
                    SBUxMethod.set("HSLOAN_FX_15_OR_LIM_2015", 	gfnma_nvl(item.HSLOAN_FX_15_OR_LIM_2015));
                    SBUxMethod.set("HSLOAN_GENERAL_LIM_2015", 	gfnma_nvl(item.HSLOAN_GENERAL_LIM_2015));
                    SBUxMethod.set("HSLOAN_FX_10_LIM_2015", 	gfnma_nvl(item.HSLOAN_FX_10_LIM_2015));
                    //- 기부금공제
                    SBUxMethod.set("DON_LGL_R", 	            gfnma_nvl(item.DON_LGL_R));
                    SBUxMethod.set("DON_SPEC_R", 	            gfnma_nvl(item.DON_SPEC_R));
                    SBUxMethod.set("DON_EMP_STOCK_R", 	        gfnma_nvl(item.DON_EMP_STOCK_R));
                    SBUxMethod.set("DON_OUT_OF_REL_R", 	        gfnma_nvl(item.DON_OUT_OF_REL_R));
                    SBUxMethod.set("DON_REL_R", 	            gfnma_nvl(item.DON_REL_R));
                    SBUxMethod.set("DON_ASSIGN_COMPARE_R", 	    gfnma_nvl(item.DON_ASSIGN_COMPARE_R));
                    //-- 표준공제
                    //--A.STD_DED_LIM,      -- 20150113 삭제
                    //-- 개인연금저축공제
                    SBUxMethod.set("PRIV_PENS_SV_LIM", 	        gfnma_nvl(item.PRIV_PENS_SV_LIM));
                    SBUxMethod.set("PRIV_PENS_SV_R", 	        gfnma_nvl(item.PRIV_PENS_SV_R));
                    // -- 주택마련저축 납입액 소득공제
                    SBUxMethod.set("HS_SUBS_SV_DED_LIM", 	    gfnma_nvl(item.HS_SUBS_SV_DED_LIM));
                    SBUxMethod.set("HS_EMP_SV_DED_LIM", 	    gfnma_nvl(item.HS_EMP_SV_DED_LIM));
                    SBUxMethod.set("HS_TOT_SV_DED_LIM", 	    gfnma_nvl(item.HS_TOT_SV_DED_LIM));
                    SBUxMethod.set("HS_SUBS_SV_DED_BEF_LIM", 	gfnma_nvl(item.HS_SUBS_SV_DED_BEF_LIM));
                    SBUxMethod.set("HS_TOT_SV_DED_BEF_LIM", 	gfnma_nvl(item.HS_TOT_SV_DED_BEF_LIM));
                    SBUxMethod.set("HS_SV_INC_LIM", 	        gfnma_nvl(item.HS_SV_INC_LIM));
                    SBUxMethod.set("HS_SV_DER", 	            gfnma_nvl(item.HS_SV_DER));
                    SBUxMethod.set("HS_SV_DED_LIM", 	        gfnma_nvl(item.HS_SV_DED_LIM));
                    //- 신용카드 등 사용금액 소득공제
                    SBUxMethod.set("CD_DED_BASE_R", 	        gfnma_nvl(item.CD_DED_BASE_R));
                    SBUxMethod.set("CD_DER", 	                gfnma_nvl(item.CD_DER));
                    SBUxMethod.set("CHKCD_DER", 	            gfnma_nvl(item.CHKCD_DER));
                    SBUxMethod.set("CASH_RECEIPT_DER", 	        gfnma_nvl(item.CASH_RECEIPT_DER));
                    SBUxMethod.set("TDMK_DER", 	                gfnma_nvl(item.TDMK_DER));
                    SBUxMethod.set("TDMK_DER2", 	            gfnma_nvl(item.TDMK_DER2));
                    SBUxMethod.set("PBTRN_DER", 	            gfnma_nvl(item.PBTRN_DER));
                    SBUxMethod.set("PBTRN_DER2", 	            gfnma_nvl(item.PBTRN_DER2));
                    SBUxMethod.set("BOOK_PERF_DER", 	        gfnma_nvl(item.BOOK_PERF_DER));
                    SBUxMethod.set("BOOK_PERF_DER2", 	        gfnma_nvl(item.BOOK_PERF_DER2));
                    SBUxMethod.set("CD_DED_LIM", 	            gfnma_nvl(item.CD_DED_LIM));
                    SBUxMethod.set("CARD_DED_LIMIT2", 	        gfnma_nvl(item.CARD_DED_LIMIT2));
                    SBUxMethod.set("CARD_DED_LIMIT3", 	        gfnma_nvl(item.CARD_DED_LIMIT3));
                    SBUxMethod.set("CD_DED_COMPARE_R", 	        gfnma_nvl(item.CD_DED_COMPARE_R));
                    SBUxMethod.set("CD_MARKET_ADD_DED_LIM", 	gfnma_nvl(item.CD_MARKET_ADD_DED_LIM));
                    SBUxMethod.set("CD_TRANSPORT_ADD_DED_LIM", 	gfnma_nvl(item.CD_TRANSPORT_ADD_DED_LIM));
                    SBUxMethod.set("CD_BOOK_PERF_ADD_DED_LIM", 	gfnma_nvl(item.CD_BOOK_PERF_ADD_DED_LIM));
                    //-- 소기업, 소상공인 공제부금 소득공제
                    SBUxMethod.set("SM_COM_DED_LIM", 	        gfnma_nvl(item.SM_COM_DED_LIM));
                    SBUxMethod.set("SMALL_COM_DED_LIMIT2", 	    gfnma_nvl(item.SMALL_COM_DED_LIMIT2));
                    SBUxMethod.set("SMALL_COM_DED_LIMIT3", 	    gfnma_nvl(item.SMALL_COM_DED_LIMIT3));
                    //- 투자조합 출자공제
                    SBUxMethod.set("INVEST_R1", 	    gfnma_nvl(item.INVEST_R1));
                    SBUxMethod.set("INVEST_R2", 	    gfnma_nvl(item.INVEST_R2));
                    SBUxMethod.set("INVEST_R3", 	    gfnma_nvl(item.INVEST_R3));
                    SBUxMethod.set("INVEST_R4", 	    gfnma_nvl(item.INVEST_R4));
                    SBUxMethod.set("INVEST_R5", 	    gfnma_nvl(item.INVEST_R5));
                    SBUxMethod.set("INVEST_R6", 	    gfnma_nvl(item.INVEST_R6));
                    SBUxMethod.set("INVEST_R7", 	    gfnma_nvl(item.INVEST_R7));
                    SBUxMethod.set("INVEST_R8", 	    gfnma_nvl(item.INVEST_R8));
                    SBUxMethod.set("INVEST_R9", 	    gfnma_nvl(item.INVEST_R9));
                    SBUxMethod.set("INVEST_R10", 	    gfnma_nvl(item.INVEST_R10));
                    //- 우리사주출연금 소득공제
                    SBUxMethod.set("EMP_STOCK_GIVE_LIM", 	    gfnma_nvl(item.EMP_STOCK_GIVE_LIM));
                    //- 고용유지 중소기업 근로자 소득공제
                    SBUxMethod.set("SALARY_DECREASE_DER", 	    gfnma_nvl(item.SALARY_DECREASE_DER));
                    SBUxMethod.set("SALARY_DECREASE_DED_LIM", 	gfnma_nvl(item.SALARY_DECREASE_DED_LIM));
                    //- 목돈안드는 전세이자상환액 소득공제
                    SBUxMethod.set("LEASE_INT_RDM_DER", 	    gfnma_nvl(item.LEASE_INT_RDM_DER));
                    SBUxMethod.set("LEASE_INT_RDM_DED_LIM", 	gfnma_nvl(item.LEASE_INT_RDM_DED_LIM));
                    //- 장기집합투자증권저축
                    SBUxMethod.set("LT_INV_ST_SV_INC_LIM", 	    gfnma_nvl(item.LT_INV_ST_SV_INC_LIM));
                    SBUxMethod.set("LT_INV_ST_SV_DED_LIM", 	    gfnma_nvl(item.LT_INV_ST_SV_DED_LIM));

                    //-추가필드 설명 필요
                    SBUxMethod.set("LT_INV_ST_SV_DER", 	    gfnma_nvl(item.LT_INV_ST_SV_DER));

                    //-- 특별공제 종합한도 초과액
                    //--A.SPEC_DED_TOT_LIM,     -- 20150113 삭제
                    //-- 소득공제 종합한도 초과액
                    SBUxMethod.set("INC_DED_TOT_LIM", 	    gfnma_nvl(item.INC_DED_TOT_LIM));
                    // -- 근로소득세액공제
                    SBUxMethod.set("INC_TX_DED_STD", 	        gfnma_nvl(item.INC_TX_DED_STD));
                    SBUxMethod.set("INC_TX_DED_BELOW_R", 	    gfnma_nvl(item.INC_TX_DED_BELOW_R));
                    SBUxMethod.set("INC_TX_DED_EXCS_AMT", 	    gfnma_nvl(item.INC_TX_DED_EXCS_AMT));
                    SBUxMethod.set("INC_TX_DED_EXCS_AMT_R", 	gfnma_nvl(item.INC_TX_DED_EXCS_AMT_R));
                    SBUxMethod.set("PAY_TOT_TX_DED_STD", 	    gfnma_nvl(item.PAY_TOT_TX_DED_STD));
                    SBUxMethod.set("PAY_TOT_TX_DED_STD_LIM", 	gfnma_nvl(item.PAY_TOT_TX_DED_STD_LIM));
                    SBUxMethod.set("PAY_TOT_TX_DED_BELOW", 	    gfnma_nvl(item.PAY_TOT_TX_DED_BELOW));
                    SBUxMethod.set("PAY_TOT_TX_DED_BELOW_R", 	gfnma_nvl(item.PAY_TOT_TX_DED_BELOW_R));
                    SBUxMethod.set("PAY_TOT_TX_DED_BELOW_LIM", 	gfnma_nvl(item.PAY_TOT_TX_DED_BELOW_LIM));
                    SBUxMethod.set("PAY_TOT_TX_DED_EXCS_R", 	gfnma_nvl(item.PAY_TOT_TX_DED_EXCS_R));
                    SBUxMethod.set("PAY_TOT_TX_DED_EXLMT", 	    gfnma_nvl(item.PAY_TOT_TX_DED_EXLMT));
                    SBUxMethod.set("PAY_TOT_TX_DED_BELOW2", 	gfnma_nvl(item.PAY_TOT_TX_DED_BELOW2));
                    SBUxMethod.set("PAY_TOT_TX_DED_BELOW_LIM2", gfnma_nvl(item.PAY_TOT_TX_DED_BELOW_LIM2));
                    //-- 자녀세액공제
                    SBUxMethod.set("CHILD_TX_DED_LIM1", 	    gfnma_nvl(item.CHILD_TX_DED_LIM1));
                    SBUxMethod.set("CHILD_TX_DED_LIM2", 	    gfnma_nvl(item.CHILD_TX_DED_LIM2));
                    //-- 6세이하 자녀 세액공제
                    SBUxMethod.set("BRING_CHILD_TX_DED_LIM", 	gfnma_nvl(item.BRING_CHILD_TX_DED_LIM));
                    // -- 출산/입양자녀 세액공제
                    SBUxMethod.set("CHILDBIRTH_TX_DED_LIM", 	gfnma_nvl(item.CHILDBIRTH_TX_DED_LIM));
                    SBUxMethod.set("CHILDBIRTH_TAX_DED_LIMIT2", gfnma_nvl(item.CHILDBIRTH_TAX_DED_LIMIT2));
                    SBUxMethod.set("CHILDBIRTH_TAX_DED_LIMIT3", gfnma_nvl(item.CHILDBIRTH_TAX_DED_LIMIT3));
                    //- 연금계좌세액공제
                    SBUxMethod.set("PENS_ACC_DED_LIM", 	        gfnma_nvl(item.PENS_ACC_DED_LIM));
                    SBUxMethod.set("PENS_ACCOUNT_DED_LIMIT2", 	gfnma_nvl(item.PENS_ACCOUNT_DED_LIMIT2));
                    SBUxMethod.set("PENS_ACC_TX_DER", 	        gfnma_nvl(item.PENS_ACC_TX_DER));
                    SBUxMethod.set("PENS_ACC_DED_INC_LIM", 	    gfnma_nvl(item.PENS_ACC_DED_INC_LIM));
                    SBUxMethod.set("PENS_ACC_TX_DED_BELOW_R", 	gfnma_nvl(item.PENS_ACC_TX_DED_BELOW_R));
                    SBUxMethod.set("RET_PENS_ACC_LIM", 	        gfnma_nvl(item.RET_PENS_ACC_LIM));
                    SBUxMethod.set("PENS_ISA_DED_LIMIT", 	    gfnma_nvl(item.PENS_ISA_DED_LIMIT));
                    //- 보장성보험료세액공제
                    SBUxMethod.set("GENERAL_INSURE_DED_LIM", 	gfnma_nvl(item.GENERAL_INSURE_DED_LIM));
                    SBUxMethod.set("HDCP_INSURE_DED_LIM", 	    gfnma_nvl(item.HDCP_INSURE_DED_LIM));
                    SBUxMethod.set("GENERAL_INSURE_TX_DER", 	gfnma_nvl(item.GENERAL_INSURE_TX_DER));
                    SBUxMethod.set("HDCP_INSURE_TX_DER", 	    gfnma_nvl(item.HDCP_INSURE_TX_DER));
                    //- 의료비세액공제
                    SBUxMethod.set("MED_EXP_DER", 	            gfnma_nvl(item.MED_EXP_DER));
                    SBUxMethod.set("MED_EXP_DED_LIM", 	        gfnma_nvl(item.MED_EXP_DED_LIM));
                    SBUxMethod.set("MED_EXP_TAX_DED_RATE2", 	gfnma_nvl(item.MED_EXP_TAX_DED_RATE2));
                    SBUxMethod.set("MED_EXP_TAX_DED_RATE3", 	gfnma_nvl(item.MED_EXP_TAX_DED_RATE3));
                    SBUxMethod.set("MED_EXP_TX_DER", 	        gfnma_nvl(item.MED_EXP_TX_DER));
                    //- 교육비세액공제
                    SBUxMethod.set("EDU_EXP_DED_LIM1", 	        gfnma_nvl(item.EDU_EXP_DED_LIM1));
                    SBUxMethod.set("EDU_EXP_DED_LIM2", 	        gfnma_nvl(item.EDU_EXP_DED_LIM2));
                    SBUxMethod.set("EDU_EXP_DED_LIM3", 	        gfnma_nvl(item.EDU_EXP_DED_LIM3));
                    SBUxMethod.set("EDU_EXP_TX_DER", 	        gfnma_nvl(item.EDU_EXP_TX_DER));
                    //- 기부금세액공제
                    SBUxMethod.set("DON_POL_DED_LIM", 	        gfnma_nvl(item.DON_POL_DED_LIM));
                    //SBUxMethod.set("DON_POL_TX_DER", 	        gfnma_nvl(item.DON_POL_TX_DER));
                    //SBUxMethod.set("DON_LGL_DER", 	            gfnma_nvl(item.DON_LGL_DER));
                    SBUxMethod.set("DON_OUT_OF_REL_DER", 	    gfnma_nvl(item.DON_OUT_OF_REL_DER));
                    SBUxMethod.set("DON_REL_DER", 	            gfnma_nvl(item.DON_REL_DER));
                    SBUxMethod.set("DON_TX_DED_STD", 	        gfnma_nvl(item.DON_TX_DED_STD));
                    SBUxMethod.set("DON_TX_DED_BELOW_R", 	    gfnma_nvl(item.DON_TX_DED_BELOW_R));
                    SBUxMethod.set("DON_TX_DED_EXCS_R", 	    gfnma_nvl(item.DON_TX_DED_EXCS_R));
                    //- 표준세액공제
                    SBUxMethod.set("STD_TX_DED_LIM", 	        gfnma_nvl(item.STD_TX_DED_LIM));
                    //- 납세조합공제
                    SBUxMethod.set("TX_UNION_DER", 	            gfnma_nvl(item.TX_UNION_DER));
                    //- 주택차입금 이자상환액공제
                    SBUxMethod.set("HSRENT_INT_DER", 	        gfnma_nvl(item.HSRENT_INT_DER));
                    //- 월세세액공제
                    SBUxMethod.set("HS_MM_RENT_DED_INC_LIM", 	gfnma_nvl(item.HS_MM_RENT_DED_INC_LIM));
                    SBUxMethod.set("HS_MM_RENT_TX_DER", 	    gfnma_nvl(item.HS_MM_RENT_TX_DER));
                    SBUxMethod.set("HS_MM_RENT_DED_INC_LIM2", 	gfnma_nvl(item.HS_MM_RENT_DED_INC_LIM2));
                    SBUxMethod.set("HS_MM_RENT_TX_DER2", 	    gfnma_nvl(item.HS_MM_RENT_TX_DER2));
                    SBUxMethod.set("HS_MM_RENT_TX_DED_LIM", 	gfnma_nvl(item.HS_MM_RENT_TX_DED_LIM));
                    //- 농어촌특별세
                    SBUxMethod.set("HSRENT_INT_DED_SPEC_TX_R", 	gfnma_nvl(item.HSRENT_INT_DED_SPEC_TX_R));
                    SBUxMethod.set("INVEST_DED_SPEC_TX_R", 	    gfnma_nvl(item.INVEST_DED_SPEC_TX_R));
                    //--2020년 연말정산
                    //-- 연금계좌세액공제
                    SBUxMethod.set("PENS_ACC_50_DED_LIM", 	        gfnma_nvl(item.PENS_ACC_50_DED_LIM));
                    SBUxMethod.set("PENS_ACCOUNT_50_DED_LIMIT2", 	gfnma_nvl(item.PENS_ACCOUNT_50_DED_LIMIT2));
                    SBUxMethod.set("PENS_ACC_50_TX_DER", 	        gfnma_nvl(item.PENS_ACC_50_TX_DER));
                    SBUxMethod.set("RET_PENS_ACC_50_OVER_LIM", 	    gfnma_nvl(item.RET_PENS_ACC_50_OVER_LIM));
                    SBUxMethod.set("PENS_ACC_50_DED_INC_LIM", 	    gfnma_nvl(item.PENS_ACC_50_DED_INC_LIM));
                    SBUxMethod.set("PENS_ACC_50_TX_DED_BELOW_R", 	gfnma_nvl(item.PENS_ACC_50_TX_DED_BELOW_R));
                    SBUxMethod.set("RET_PENS_ACC_50_BELOW_LIM", 	gfnma_nvl(item.RET_PENS_ACC_50_BELOW_LIM));
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

    //근로소득 공제 리스트 저장
    const fn_saveS1 = async function (updatedData) {

        let listData = [];
        listData =  await getParamForm(updatedData);

        if (listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1100S1.do", {listData: listData});
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }/*else{
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        fn_search();
                    }*/

                } else {
                    alert(data.resultMessage);
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }
    }

    const getParamForm = async function (updatedData) {

        let YE_TX_YYYY = gfnma_nvl(SBUxMethod.get("srch-ye_tx_yyyy"));

        let returnData = [];

        updatedData.forEach((item, index) => {

            const param = {

                cv_count: '0',
                getType: 'json',
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN: ''
                    , V_P_LANG_ID: ''
                    , V_P_COMP_CODE: gv_ma_selectedApcCd
                    , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                    ,V_P_YE_TX_YYYY             : YE_TX_YYYY
                    ,V_P_INC_FROM_AMT           : item.data.INC_FROM_AMT
                    ,V_P_INC_TO_AMT             : item.data.INC_TO_AMT
                    ,V_P_BASE_DEAMT             : item.data.BASE_DEAMT
                    ,V_P_DEDUCTION_LIMIT_EAMT   : item.data.DEDUCTION_LIMIT_EAMT
                    ,V_P_DER                    : item.data.DER
                    ,V_P_MEMO                   : item.data.MEMO

                    , V_P_FORM_ID: p_formId
                    , V_P_MENU_ID: p_menuId
                    , V_P_PROC_ID: ''
                    , V_P_USERID: ''
                    , V_P_PC: ''

                })
            }

            returnData.push(param);

        });

        return returnData;
    }

    //저장
    const fn_save = async function (type) {

        let YE_TX_YYYY = gfnma_nvl(SBUxMethod.get("srch-ye_tx_yyyy"));
        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산년도");
            return;
        }

        let PERSONAL_DED_LIM = gfnma_nvl(SBUxMethod.get("PERSONAL_DED_LIM"));
        let WIFE_DED_LIM = gfnma_nvl(SBUxMethod.get("WIFE_DED_LIM"));
        let SUPPORT_DED_LIM = gfnma_nvl(SBUxMethod.get("SUPPORT_DED_LIM"));
        let FOREI_WORK_SINGLE_TX_RATE = gfnma_nvl(SBUxMethod.get("FOREI_WORK_SINGLE_TX_RATE"));
        let SENIOR_DED_LIM = gfnma_nvl(SBUxMethod.get("SENIOR_DED_LIM"));
        let HDCP_DED_LIM = gfnma_nvl(SBUxMethod.get("HDCP_DED_LIM"));
        let WOMAN_DED_LIM = gfnma_nvl(SBUxMethod.get("WOMAN_DED_LIM"));
        let WOMAN_INC_LIM = gfnma_nvl(SBUxMethod.get("WOMAN_INC_LIM"));
        let SINGLE_PARENT_DED_LIM = gfnma_nvl(SBUxMethod.get("SINGLE_PARENT_DED_LIM"));
        let HSRENT_PRIN_PERS_INC_LIM = gfnma_nvl(SBUxMethod.get("HSRENT_PRIN_PERS_INC_LIM"));
        let HSRENT_PRIN_DER = gfnma_nvl(SBUxMethod.get("HSRENT_PRIN_DER"));
        let HSRENT_PRIN_DED_LIM = gfnma_nvl(SBUxMethod.get("HSRENT_PRIN_DED_LIM"));
        let HS_SV_PRIN_RENT_LIM = gfnma_nvl(SBUxMethod.get("HS_SV_PRIN_RENT_LIM"));
        let HSLOAN_10_15_LIM = gfnma_nvl(SBUxMethod.get("HSLOAN_10_15_LIM"));
        let HSLOAN_15_30_LIM = gfnma_nvl(SBUxMethod.get("HSLOAN_15_30_LIM"));
        let HSLOAN_30_LIM = gfnma_nvl(SBUxMethod.get("HSLOAN_30_LIM"));
        let HSLOAN_FX_LIM = gfnma_nvl(SBUxMethod.get("HSLOAN_FX_LIM"));
        let HSLOAN_ETC_LIM = gfnma_nvl(SBUxMethod.get("HSLOAN_ETC_LIM"));
        let HSLOAN_FX_15_AND_LIM_2015 = gfnma_nvl(SBUxMethod.get("HSLOAN_FX_15_AND_LIM_2015"));
        let HSLOAN_FX_15_OR_LIM_2015 = gfnma_nvl(SBUxMethod.get("HSLOAN_FX_15_OR_LIM_2015"));
        let HSLOAN_GENERAL_LIM_2015 = gfnma_nvl(SBUxMethod.get("HSLOAN_GENERAL_LIM_2015"));
        let HSLOAN_FX_10_LIM_2015 = gfnma_nvl(SBUxMethod.get("HSLOAN_FX_10_LIM_2015"));
        let DON_LGL_R = gfnma_nvl(SBUxMethod.get("DON_LGL_R"));
        let DON_SPEC_R = gfnma_nvl(SBUxMethod.get("DON_SPEC_R"));
        let DON_EMP_STOCK_R = gfnma_nvl(SBUxMethod.get("DON_EMP_STOCK_R"));
        let DON_OUT_OF_REL_R = gfnma_nvl(SBUxMethod.get("DON_OUT_OF_REL_R"));
        let DON_REL_R = gfnma_nvl(SBUxMethod.get("DON_REL_R"));
        let DON_ASSIGN_COMPARE_R = gfnma_nvl(SBUxMethod.get("DON_ASSIGN_COMPARE_R"));
        let PRIV_PENS_SV_LIM = gfnma_nvl(SBUxMethod.get("PRIV_PENS_SV_LIM"));
        let PRIV_PENS_SV_R = gfnma_nvl(SBUxMethod.get("PRIV_PENS_SV_R"));
        let HS_SUBS_SV_DED_LIM = gfnma_nvl(SBUxMethod.get("HS_SUBS_SV_DED_LIM"));
        let HS_EMP_SV_DED_LIM = gfnma_nvl(SBUxMethod.get("HS_EMP_SV_DED_LIM"));
        let HS_TOT_SV_DED_LIM = gfnma_nvl(SBUxMethod.get("HS_TOT_SV_DED_LIM"));
        let HS_SV_DER = gfnma_nvl(SBUxMethod.get("HS_SV_DER"));
        let HS_SV_DED_LIM = gfnma_nvl(SBUxMethod.get("HS_SV_DED_LIM"));
        let CD_DED_BASE_R = gfnma_nvl(SBUxMethod.get("CD_DED_BASE_R"));
        let CD_DER = gfnma_nvl(SBUxMethod.get("CD_DER"));
        let CHKCD_DER = gfnma_nvl(SBUxMethod.get("CHKCD_DER"));
        let CASH_RECEIPT_DER = gfnma_nvl(SBUxMethod.get("CASH_RECEIPT_DER"));
        let TDMK_DER = gfnma_nvl(SBUxMethod.get("TDMK_DER"));
        let TDMK_DER2 = gfnma_nvl(SBUxMethod.get("TDMK_DER2"));
        let PBTRN_DER = gfnma_nvl(SBUxMethod.get("PBTRN_DER"));
        let PBTRN_DER2 = gfnma_nvl(SBUxMethod.get("PBTRN_DER2"));
        let BOOK_PERF_DER = gfnma_nvl(SBUxMethod.get("BOOK_PERF_DER"));
        let BOOK_PERF_DER2 = gfnma_nvl(SBUxMethod.get("BOOK_PERF_DER2"));
        let CD_DED_LIM = gfnma_nvl(SBUxMethod.get("CD_DED_LIM"));
        let CARD_DED_LIMIT2 = gfnma_nvl(SBUxMethod.get("CARD_DED_LIMIT2"));
        let CARD_DED_LIMIT3 = gfnma_nvl(SBUxMethod.get("CARD_DED_LIMIT3"));
        let CD_DED_COMPARE_R = gfnma_nvl(SBUxMethod.get("CD_DED_COMPARE_R"));
        let CD_MARKET_ADD_DED_LIM = gfnma_nvl(SBUxMethod.get("CD_MARKET_ADD_DED_LIM"));
        let CD_TRANSPORT_ADD_DED_LIM = gfnma_nvl(SBUxMethod.get("CD_TRANSPORT_ADD_DED_LIM"));
        let CD_BOOK_PERF_ADD_DED_LIM = gfnma_nvl(SBUxMethod.get("CD_BOOK_PERF_ADD_DED_LIM"));
        let SM_COM_DED_LIM = gfnma_nvl(SBUxMethod.get("SM_COM_DED_LIM"));
        let SMALL_COM_DED_LIMIT2 = gfnma_nvl(SBUxMethod.get("SMALL_COM_DED_LIMIT2"));
        let SMALL_COM_DED_LIMIT3 = gfnma_nvl(SBUxMethod.get("SMALL_COM_DED_LIMIT3"));
        let INVEST_R1 = gfnma_nvl(SBUxMethod.get("INVEST_R1"));
        let INVEST_R2 = gfnma_nvl(SBUxMethod.get("INVEST_R2"));
        let INVEST_R3 = gfnma_nvl(SBUxMethod.get("INVEST_R3"));
        let INVEST_R4 = gfnma_nvl(SBUxMethod.get("INVEST_R4"));
        let INVEST_R5 = gfnma_nvl(SBUxMethod.get("INVEST_R5"));
        let INVEST_R6 = gfnma_nvl(SBUxMethod.get("INVEST_R6"));
        let INVEST_R7 = gfnma_nvl(SBUxMethod.get("INVEST_R7"));
        let INVEST_R8 = gfnma_nvl(SBUxMethod.get("INVEST_R8"));
        let INVEST_R9 = gfnma_nvl(SBUxMethod.get("INVEST_R9"));
        let INVEST_R10 = gfnma_nvl(SBUxMethod.get("INVEST_R10"));
        let EMP_STOCK_GIVE_LIM = gfnma_nvl(SBUxMethod.get("EMP_STOCK_GIVE_LIM"));
        let SALARY_DECREASE_DER = gfnma_nvl(SBUxMethod.get("SALARY_DECREASE_DER"));
        let SALARY_DECREASE_DED_LIM = gfnma_nvl(SBUxMethod.get("SALARY_DECREASE_DED_LIM"));
        let LEASE_INT_RDM_DER = gfnma_nvl(SBUxMethod.get("LEASE_INT_RDM_DER"));
        let LEASE_INT_RDM_DED_LIM = gfnma_nvl(SBUxMethod.get("LEASE_INT_RDM_DED_LIM"));
        let LT_INV_ST_SV_INC_LIM = gfnma_nvl(SBUxMethod.get("LT_INV_ST_SV_INC_LIM"));
        let LT_INV_ST_SV_DER = gfnma_nvl(SBUxMethod.get("LT_INV_ST_SV_DER"));
        let LT_INV_ST_SV_DED_LIM = gfnma_nvl(SBUxMethod.get("LT_INV_ST_SV_DED_LIM"));
        let INC_DED_TOT_LIM = gfnma_nvl(SBUxMethod.get("INC_DED_TOT_LIM"));
        let INC_TX_DED_STD = gfnma_nvl(SBUxMethod.get("INC_TX_DED_STD"));
        let INC_TX_DED_BELOW_R = gfnma_nvl(SBUxMethod.get("INC_TX_DED_BELOW_R"));
        let INC_TX_DED_EXCS_AMT = gfnma_nvl(SBUxMethod.get("INC_TX_DED_EXCS_AMT"));
        let INC_TX_DED_EXCS_AMT_R = gfnma_nvl(SBUxMethod.get("INC_TX_DED_EXCS_AMT_R"));
        let PAY_TOT_TX_DED_STD = gfnma_nvl(SBUxMethod.get("PAY_TOT_TX_DED_STD"));
        let PAY_TOT_TX_DED_STD_LIM = gfnma_nvl(SBUxMethod.get("PAY_TOT_TX_DED_STD_LIM"));
        let PAY_TOT_TX_DED_BELOW = gfnma_nvl(SBUxMethod.get("PAY_TOT_TX_DED_BELOW"));
        let PAY_TOT_TX_DED_BELOW2 = gfnma_nvl(SBUxMethod.get("PAY_TOT_TX_DED_BELOW2"));
        let PAY_TOT_TX_DED_BELOW_R = gfnma_nvl(SBUxMethod.get("PAY_TOT_TX_DED_BELOW_R"));
        let PAY_TOT_TX_DED_BELOW_LIM = gfnma_nvl(SBUxMethod.get("PAY_TOT_TX_DED_BELOW_LIM"));
        let PAY_TOT_TX_DED_BELOW_LIM2 = gfnma_nvl(SBUxMethod.get("PAY_TOT_TX_DED_BELOW_LIM2"));
        let PAY_TOT_TX_DED_EXCS_R = gfnma_nvl(SBUxMethod.get("PAY_TOT_TX_DED_EXCS_R"));
        let PAY_TOT_TX_DED_EXLMT = gfnma_nvl(SBUxMethod.get("PAY_TOT_TX_DED_EXLMT"));
        let CHILD_TX_DED_LIM1 = gfnma_nvl(SBUxMethod.get("CHILD_TX_DED_LIM1"));
        let CHILD_TX_DED_LIM2 = gfnma_nvl(SBUxMethod.get("CHILD_TX_DED_LIM2"));
        let PENS_ACC_DED_LIM = gfnma_nvl(SBUxMethod.get("PENS_ACC_DED_LIM"));
        let PENS_ACCOUNT_DED_LIMIT2 = gfnma_nvl(SBUxMethod.get("PENS_ACCOUNT_DED_LIMIT2"));
        let PENS_ACC_TX_DER = gfnma_nvl(SBUxMethod.get("PENS_ACC_TX_DER"));
        let GENERAL_INSURE_DED_LIM = gfnma_nvl(SBUxMethod.get("GENERAL_INSURE_DED_LIM"));
        let HDCP_INSURE_DED_LIM = gfnma_nvl(SBUxMethod.get("HDCP_INSURE_DED_LIM"));
        let GENERAL_INSURE_TX_DER = gfnma_nvl(SBUxMethod.get("GENERAL_INSURE_TX_DER"));
        let MED_EXP_DER = gfnma_nvl(SBUxMethod.get("MED_EXP_DER"));
        let MED_EXP_DED_LIM = gfnma_nvl(SBUxMethod.get("MED_EXP_DED_LIM"));
        let MED_EXP_TX_DER = gfnma_nvl(SBUxMethod.get("MED_EXP_TX_DER"));
        let MED_EXP_TAX_DED_RATE2 = gfnma_nvl(SBUxMethod.get("MED_EXP_TAX_DED_RATE2"));
        let MED_EXP_TAX_DED_RATE3 = gfnma_nvl(SBUxMethod.get("MED_EXP_TAX_DED_RATE3"));
        let EDU_EXP_DED_LIM1 = gfnma_nvl(SBUxMethod.get("EDU_EXP_DED_LIM1"));
        let EDU_EXP_DED_LIM2 = gfnma_nvl(SBUxMethod.get("EDU_EXP_DED_LIM2"));
        let EDU_EXP_DED_LIM3 = gfnma_nvl(SBUxMethod.get("EDU_EXP_DED_LIM3"));
        let EDU_EXP_TX_DER = gfnma_nvl(SBUxMethod.get("EDU_EXP_TX_DER"));
        let DON_POL_DED_LIM = gfnma_nvl(SBUxMethod.get("DON_POL_DED_LIM"));
        let DON_OUT_OF_REL_DER = gfnma_nvl(SBUxMethod.get("DON_OUT_OF_REL_DER"));
        let DON_REL_DER = gfnma_nvl(SBUxMethod.get("DON_REL_DER"));
        let DON_TX_DED_STD = gfnma_nvl(SBUxMethod.get("DON_TX_DED_STD"));
        let DON_TX_DED_BELOW_R = gfnma_nvl(SBUxMethod.get("DON_TX_DED_BELOW_R"));
        let DON_TX_DED_EXCS_R = gfnma_nvl(SBUxMethod.get("DON_TX_DED_EXCS_R"));
        let STD_TX_DED_LIM = gfnma_nvl(SBUxMethod.get("STD_TX_DED_LIM"));
        let TX_UNION_DER = gfnma_nvl(SBUxMethod.get("TX_UNION_DER"));
        let HSRENT_INT_DER = gfnma_nvl(SBUxMethod.get("HSRENT_INT_DER"));
        let HS_MM_RENT_DED_INC_LIM = gfnma_nvl(SBUxMethod.get("HS_MM_RENT_DED_INC_LIM"));
        let HS_MM_RENT_TX_DER = gfnma_nvl(SBUxMethod.get("HS_MM_RENT_TX_DER"));
        let HS_MM_RENT_DED_INC_LIM2 = gfnma_nvl(SBUxMethod.get("HS_MM_RENT_DED_INC_LIM2"));
        let HS_MM_RENT_TX_DER2 = gfnma_nvl(SBUxMethod.get("HS_MM_RENT_TX_DER2"));
        let HS_MM_RENT_TX_DED_LIM = gfnma_nvl(SBUxMethod.get("HS_MM_RENT_TX_DED_LIM"));
        let HSRENT_INT_DED_SPEC_TX_R = gfnma_nvl(SBUxMethod.get("HSRENT_INT_DED_SPEC_TX_R"));
        let INVEST_DED_SPEC_TX_R = gfnma_nvl(SBUxMethod.get("INVEST_DED_SPEC_TX_R"));
        let BRING_CHILD_TX_DED_LIM = gfnma_nvl(SBUxMethod.get("BRING_CHILD_TX_DED_LIM"));
        let CHILDBIRTH_TX_DED_LIM = gfnma_nvl(SBUxMethod.get("CHILDBIRTH_TX_DED_LIM"));
        let CHILDBIRTH_TAX_DED_LIMIT2 = gfnma_nvl(SBUxMethod.get("CHILDBIRTH_TAX_DED_LIMIT2"));
        let CHILDBIRTH_TAX_DED_LIMIT3 = gfnma_nvl(SBUxMethod.get("CHILDBIRTH_TAX_DED_LIMIT3"));
        let PENS_ACC_DED_INC_LIM = gfnma_nvl(SBUxMethod.get("PENS_ACC_DED_INC_LIM"));
        let PENS_ACC_TX_DED_BELOW_R = gfnma_nvl(SBUxMethod.get("PENS_ACC_TX_DED_BELOW_R"));
        let HDCP_INSURE_TX_DER = gfnma_nvl(SBUxMethod.get("HDCP_INSURE_TX_DER"));
        let RET_PENS_ACC_LIM = gfnma_nvl(SBUxMethod.get("RET_PENS_ACC_LIM"));
        let PENS_ISA_DED_LIMIT = gfnma_nvl(SBUxMethod.get("PENS_ISA_DED_LIMIT"));
        let HS_SV_INC_LIM = gfnma_nvl(SBUxMethod.get("HS_SV_INC_LIM"));
        let HS_SUBS_SV_DED_BEF_LIM = gfnma_nvl(SBUxMethod.get("HS_SUBS_SV_DED_BEF_LIM"));
        let HS_TOT_SV_DED_BEF_LIM = gfnma_nvl(SBUxMethod.get("HS_TOT_SV_DED_BEF_LIM"));

        let PENS_ACC_50_DED_LIM = gfnma_nvl(SBUxMethod.get("PENS_ACC_50_DED_LIM"));
        let PENS_ACCOUNT_50_DED_LIMIT2 = gfnma_nvl(SBUxMethod.get("PENS_ACCOUNT_50_DED_LIMIT2"));
        let PENS_ACC_50_TX_DER = gfnma_nvl(SBUxMethod.get("PENS_ACC_50_TX_DER"));
        let RET_PENS_ACC_50_OVER_LIM = gfnma_nvl(SBUxMethod.get("RET_PENS_ACC_50_OVER_LIM"));
        let PENS_ACC_50_DED_INC_LIM = gfnma_nvl(SBUxMethod.get("PENS_ACC_50_DED_INC_LIM"));
        let PENS_ACC_50_TX_DED_BELOW_R = gfnma_nvl(SBUxMethod.get("PENS_ACC_50_TX_DED_BELOW_R"));
        let RET_PENS_ACC_50_BELOW_LIM = gfnma_nvl(SBUxMethod.get("RET_PENS_ACC_50_BELOW_LIM"));


        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_YE_TX_YYYY: YE_TX_YYYY
            , V_P_PERSONAL_DED_LIM: PERSONAL_DED_LIM
            , V_P_WIFE_DED_LIM: WIFE_DED_LIM
            , V_P_SUPPORT_DED_LIM: SUPPORT_DED_LIM
            , V_P_FOREI_WORK_SINGLE_TX_RATE: FOREI_WORK_SINGLE_TX_RATE
            , V_P_SENIOR_DED_LIM: SENIOR_DED_LIM
            , V_P_HDCP_DED_LIM: HDCP_DED_LIM
            , V_P_WOMAN_DED_LIM: WOMAN_DED_LIM
            , V_P_WOMAN_INC_LIM: WOMAN_INC_LIM
            , V_P_SINGLE_PARENT_DED_LIM: SINGLE_PARENT_DED_LIM
            , V_P_HSRENT_PRIN_PERS_INC_LIM: HSRENT_PRIN_PERS_INC_LIM
            , V_P_HSRENT_PRIN_DER: HSRENT_PRIN_DER
            , V_P_HSRENT_PRIN_DED_LIM: HSRENT_PRIN_DED_LIM
            , V_P_HS_SV_PRIN_RENT_LIM: HS_SV_PRIN_RENT_LIM
            , V_P_HSLOAN_10_15_LIM: HSLOAN_10_15_LIM
            , V_P_HSLOAN_15_30_LIM: HSLOAN_15_30_LIM
            , V_P_HSLOAN_30_LIM: HSLOAN_30_LIM
            , V_P_HSLOAN_FX_LIM: HSLOAN_FX_LIM
            , V_P_HSLOAN_ETC_LIM: HSLOAN_ETC_LIM
            , V_P_HSLOAN_FX_15_AND_LIM_2015: HSLOAN_FX_15_AND_LIM_2015
            , V_P_HSLOAN_FX_15_OR_LIM_2015: HSLOAN_FX_15_OR_LIM_2015
            , V_P_HSLOAN_GENERAL_LIM_2015: HSLOAN_GENERAL_LIM_2015
            , V_P_HSLOAN_FX_10_LIM_2015: HSLOAN_FX_10_LIM_2015
            , V_P_DON_LGL_R: DON_LGL_R
            , V_P_DON_SPEC_R: DON_SPEC_R
            , V_P_DON_EMP_STOCK_R: DON_EMP_STOCK_R
            , V_P_DON_OUT_OF_REL_R: DON_OUT_OF_REL_R
            , V_P_DON_REL_R: DON_REL_R
            , V_P_DON_ASSIGN_COMPARE_R: DON_ASSIGN_COMPARE_R
            , V_P_PRIV_PENS_SV_LIM: PRIV_PENS_SV_LIM
            , V_P_PRIV_PENS_SV_R: PRIV_PENS_SV_R
            , V_P_HS_SUBS_SV_DED_LIM: HS_SUBS_SV_DED_LIM
            , V_P_HS_EMP_SV_DED_LIM: HS_EMP_SV_DED_LIM
            , V_P_HS_TOT_SV_DED_LIM: HS_TOT_SV_DED_LIM
            , V_P_HS_SV_DER: HS_SV_DER
            , V_P_HS_SV_DED_LIM: HS_SV_DED_LIM
            , V_P_CD_DED_BASE_R: CD_DED_BASE_R
            , V_P_CD_DER: CD_DER
            , V_P_CHECK_CD_DER: CHKCD_DER
            , V_P_CASH_RECEIPT_DER: CASH_RECEIPT_DER
            , V_P_TDMK_DER: TDMK_DER
            , V_P_TDMK_DER2: TDMK_DER2
            , V_P_PBTRN_DER: PBTRN_DER
            , V_P_PBTRN_DER2: PBTRN_DER2
            , V_P_BOOK_PERF_DER: BOOK_PERF_DER
            , V_P_BOOK_PERF_DER2: BOOK_PERF_DER2
            , V_P_CD_DED_LIM: CD_DED_LIM
            , V_P_CARD_DED_LIMIT2: CARD_DED_LIMIT2
            , V_P_CARD_DED_LIMIT3: CARD_DED_LIMIT3
            , V_P_CD_DED_COMPARE_R: CD_DED_COMPARE_R
            , V_P_CD_MARKET_ADD_DED_LIM: CD_MARKET_ADD_DED_LIM
            , V_P_CD_TRANSPORT_ADD_DED_LIM: CD_TRANSPORT_ADD_DED_LIM
            , V_P_CD_BOOK_PERF_ADD_DED_LIM: CD_BOOK_PERF_ADD_DED_LIM
            , V_P_SM_COM_DED_LIM: SM_COM_DED_LIM
            , V_P_SMALL_COM_DED_LIMIT2: SMALL_COM_DED_LIMIT2
            , V_P_SMALL_COM_DED_LIMIT3: SMALL_COM_DED_LIMIT3
            , V_P_INVEST_R1: INVEST_R1
            , V_P_INVEST_R2: INVEST_R2
            , V_P_INVEST_R3: INVEST_R3
            , V_P_INVEST_R4: INVEST_R4
            , V_P_INVEST_R5: INVEST_R5
            , V_P_INVEST_R6: INVEST_R6
            , V_P_INVEST_R7: INVEST_R7
            , V_P_INVEST_R9: INVEST_R9
            , V_P_INVEST_R10: INVEST_R10
            , V_P_EMP_STOCK_GIVE_LIM: EMP_STOCK_GIVE_LIM
            , V_P_SALARY_DECREASE_DER: SALARY_DECREASE_DER
            , V_P_SALARY_DECREASE_DED_LIM: SALARY_DECREASE_DED_LIM
            , V_P_LEASE_INT_RDM_DER: LEASE_INT_RDM_DER
            , V_P_LEASE_INT_RDM_DED_LIM: LEASE_INT_RDM_DED_LIM
            , V_P_LT_INV_ST_SV_INC_LIM: LT_INV_ST_SV_INC_LIM
            , V_P_LT_INV_ST_SV_DER: LT_INV_ST_SV_DER
            , V_P_LT_INV_ST_SV_DED_LIM: LT_INV_ST_SV_DED_LIM
            , V_P_INC_DED_TOT_LIM: INC_DED_TOT_LIM
            , V_P_INC_TX_DED_STD: INC_TX_DED_STD
            , V_P_INC_TX_DED_BELOW_R: INC_TX_DED_BELOW_R
            , V_P_INC_TX_DED_EXCS_AMT: INC_TX_DED_EXCS_AMT
            , V_P_INC_TX_DED_EXCS_AMT_RATE: INC_TX_DED_EXCS_AMT_R
            , V_P_PAY_TOT_TX_DED_STD: PAY_TOT_TX_DED_STD
            , V_P_PAY_TOT_TX_DED_STD_LIMIT: PAY_TOT_TX_DED_STD_LIM
            , V_P_PAY_TOT_TX_DED_BELOW: PAY_TOT_TX_DED_BELOW
            , V_P_PAY_TOT_TX_DED_BELOW2: PAY_TOT_TX_DED_BELOW2
            , V_P_PAY_TOT_TX_DED_BELOW_RATE: PAY_TOT_TX_DED_BELOW_R
            , V_P_PAY_TOT_TX_DED_BELOW_LIMIT: PAY_TOT_TX_DED_BELOW_LIM
            , V_P_PAY_TOT_TX_DED_BELOW_LIM2: PAY_TOT_TX_DED_BELOW_LIM2
            , V_P_PAY_TOT_TX_DED_EXCS_R: PAY_TOT_TX_DED_EXCS_R
            , V_P_PAY_TOT_TX_DED_EXLMT: PAY_TOT_TX_DED_EXLMT
            , V_P_CHILD_TX_DED_LIM1: CHILD_TX_DED_LIM1
            , V_P_CHILD_TX_DED_LIM2: CHILD_TX_DED_LIM2
            , V_P_PENS_ACC_DED_LIM: PENS_ACC_DED_LIM
            , V_P_PENS_ACCOUNT_DED_LIMIT2: PENS_ACCOUNT_DED_LIMIT2
            , V_P_PENS_ACC_TX_DER: PENS_ACC_TX_DER
            , V_P_GENERAL_INSURE_DED_LIM: GENERAL_INSURE_DED_LIM
            , V_P_HDCP_INSURE_DED_LIM: HDCP_INSURE_DED_LIM
            , V_P_GENERAL_INSURE_TX_DER: GENERAL_INSURE_TX_DER
            , V_P_MED_EXP_DER: MED_EXP_DER
            , V_P_MED_EXP_DED_LIM: MED_EXP_DED_LIM
            , V_P_MED_EXP_TX_DER: MED_EXP_TX_DER
            , V_P_MED_EXP_TAX_DED_RATE2: MED_EXP_TAX_DED_RATE2
            , V_P_MED_EXP_TAX_DED_RATE3: MED_EXP_TAX_DED_RATE3
            , V_P_EDU_EXP_DED_LIM1: EDU_EXP_DED_LIM1
            , V_P_EDU_EXP_DED_LIM2: EDU_EXP_DED_LIM2
            , V_P_EDU_EXP_DED_LIM3: EDU_EXP_DED_LIM3
            , V_P_EDU_EXP_TX_DER: EDU_EXP_TX_DER
            , V_P_DON_POL_DED_LIM: DON_POL_DED_LIM
            , V_P_DON_POL_TX_DER: 0
            , V_P_DON_LGL_DER: 0
            , V_P_DON_OUT_OF_REL_DER: DON_OUT_OF_REL_DER
            , V_P_DON_REL_DER: DON_REL_DER
            , V_P_DON_TX_DED_STD: DON_TX_DED_STD
            , V_P_DON_TX_DED_BELOW_R: DON_TX_DED_BELOW_R
            , V_P_DON_TX_DED_EXCS_R: DON_TX_DED_EXCS_R
            , V_P_STD_TX_DED_LIM: STD_TX_DED_LIM
            , V_P_TX_UNION_DER: TX_UNION_DER
            , V_P_HSRENT_INT_DER: HSRENT_INT_DER
            , V_P_HS_MM_RENT_DED_INC_LIM: HS_MM_RENT_DED_INC_LIM
            , V_P_HS_MM_RENT_TX_DER: HS_MM_RENT_TX_DER
            , V_P_HS_MM_RENT_DED_INC_LIM2: HS_MM_RENT_DED_INC_LIM2
            , V_P_HS_MM_RENT_TX_DER2: HS_MM_RENT_TX_DER2
            , V_P_HS_MM_RENT_TX_DED_LIM: HS_MM_RENT_TX_DED_LIM
            , V_P_HSRENT_INT_DED_SPEC_TX_R: HSRENT_INT_DED_SPEC_TX_R
            , V_P_INVEST_DED_SPEC_TX_R: INVEST_DED_SPEC_TX_R
            , V_P_BRING_CHILD_TX_DED_LIM: BRING_CHILD_TX_DED_LIM
            , V_P_CHILDBIRTH_TX_DED_LIM: CHILDBIRTH_TX_DED_LIM
            , V_P_CHILDBIRTH_TAX_DED_LIMIT2: CHILDBIRTH_TAX_DED_LIMIT2
            , V_P_CHILDBIRTH_TAX_DED_LIMIT3: CHILDBIRTH_TAX_DED_LIMIT3
            , V_P_PENS_ACC_DED_INC_LIM: PENS_ACC_DED_INC_LIM
            , V_P_PENS_ACC_TX_DED_BELOW_R: PENS_ACC_TX_DED_BELOW_R
            , V_P_HDCP_INSURE_TX_DER: HDCP_INSURE_TX_DER
            , V_P_RET_PENS_ACC_LIM: RET_PENS_ACC_LIM
            , V_P_PENS_ISA_DED_LIMIT: PENS_ISA_DED_LIMIT
            , V_P_HS_SV_INC_LIM: HS_SV_INC_LIM
            , V_P_HS_SUBS_SV_DED_BEF_LIM: HS_SUBS_SV_DED_BEF_LIM
            , V_P_HS_TOT_SV_DED_BEF_LIM: HS_TOT_SV_DED_BEF_LIM

            //--2020년 연말정산
            , V_P_PENS_ACC_50_DED_LIM: PENS_ACC_50_DED_LIM
            , V_P_PENS_ACCOUNT_50_DED_LIMIT2: PENS_ACCOUNT_50_DED_LIMIT2
            , V_P_PENS_ACC_50_TX_DER: PENS_ACC_50_TX_DER
            , V_P_RET_PENS_ACC_50_OVER_LIM: RET_PENS_ACC_50_OVER_LIM
            , V_P_PENS_ACC_50_DED_INC_LIM: PENS_ACC_50_DED_INC_LIM
            , V_P_PENS_ACC_50_TX_DED_BELOW_R: PENS_ACC_50_TX_DED_BELOW_R
            , V_P_RET_PENS_ACC_50_BELOW_LIM: RET_PENS_ACC_50_BELOW_LIM

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1100.do", {
            getType: 'json',
            workType: type,
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
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

    // 행 추가
    const fn_btnAdd = function() {
        let rowVal = gvwDeductionGrid.getRow();

        const msg = {
            INC_FROM_AMT            : 0,
            INC_TO_AMT              : 0,
            BASE_DEAMT              : 0,
            DER                     : 0,
            DEDUCTION_LIMIT_EAMT    : 0,
            MEMO                    : '',


            status: 'i'
        }

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwDeductionGrid.addRow(true, msg);
        }else{
            gvwDeductionGrid.insertRow(rowVal, 'below', msg);
        }
    }

    // 행삭제
    const fn_btnDel = async function () {

        let rowVal = gvwDeductionGrid.getRow();

        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwDeductionGrid.deleteRow(rowVal);
        }

    }

    //전년도 자료복사 버튼 클릭
    const fn_btnCopy = async function () {

        fn_save('COPY')

    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>

