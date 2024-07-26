<%
    /**
     * @Class Name        : hrp1000.jsp
     * @Description       : 정산자료(개인) 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.07.31
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.31   	표주완		최초 생성
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
    <title>title : 정산자료(개인)</title>
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
                <sbux-button id="btnMonthlyPrint11" name="btnMonthlyPrint11" uitype="normal" text="인사정보일괄적용" class="btn btn-sm btn-outline-danger"
                             onclick="fn_btnMonthlyPrint11"></sbux-button>
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
                <col style="width: 6%">
                <col style="width: 3%">

                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 6%">
                <col style="width: 3%">

                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 1%">
                <col style="width: 6%">
                <col style="width: 2%">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row" class="th_bg">사업장</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="srch-site_code" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="srch-site_code" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="2" style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">급여영역</th>
                <td class="td_input">
                    <sbux-select
                            id="srch-pay_area_type"
                            uitype="single"
                            jsondata-ref="jsonPayAreaType"
                            unselected-text="선택"
                            class="form-control input-sm"
                    <%--onchange="fn_payType"--%>>
                    </sbux-select>
                </td>
                <td colspan="7" style="border-right: hidden;"></td>
            </tr>
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
                <td colspan="2" style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">정산구분</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="srch-ye_tx_type" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="srch-ye_tx_type" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="2" style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">퇴사일</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-ret_date_fr"
                            name="srch-ret_date_fr"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast"
                    >
                    </sbux-datepicker>
                </td>
                <td>~</td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-ret_date_to"
                            name="srch-ret_date_to"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast">
                    </sbux-datepicker>
                </td>
                <td style="border-right: hidden;"></td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">부서</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-input
                            uitype="text"
                            id="srch-dept_code"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td colspan="2" class="td_input" style="border-right: hidden;">
                    <sbux-input
                    <%-- uitype="hidden"--%>
                            uitype="text"
                            id="srch-dept_name"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td <%--colspan="2"--%> class="td_input" >
                    <sbux-button
                            class="btn btn-xs btn-outline-dark"
                            text="찾기" uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopup1"
                    ></sbux-button>
                </td>
                <th scope="row" class="th_bg">사원</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-input
                            uitype="text"
                            id="srch-emp_code"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td colspan="2" class="td_input" style="border-right: hidden;">
                    <sbux-input
                    <%-- uitype="hidden"--%>
                            uitype="text"
                            id="srch-emp_name"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td colspan="6" class="td_input" >
                    <sbux-button
                            class="btn btn-xs btn-outline-dark"
                            text="찾기" uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopup2"
                    ></sbux-button>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="row">
            <div class="col-sm-4">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>사원 리스트</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwList" style="height:800px; width:100%;"></div>
                </div>
            </div>


            <div class="col-sm-8">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>사원정보</span></li>
                    </ul>
                    <div style="margin-left: auto;">
                        <sbux-button id="btnMonthlyPrint" name="btnMonthlyPrint" uitype="normal" text="월세 명세서" class="btn btn-sm btn-outline-danger"
                                     onclick="fn_btnMonthlyPrint"></sbux-button>
                        <sbux-button id="btnPenPrint" name="btnPenPrint" uitype="normal" text="연금저축 명세서" class="btn btn-sm btn-outline-danger"
                                     onclick="fn_btnPenPrint"></sbux-button>
                        <sbux-button id="btnMedPrint" name="btnMedPrint" uitype="normal" text="의료비 지급명세서" class="btn btn-sm btn-outline-danger"
                                     onclick="fn_btnMedPrint"></sbux-button>
                        <sbux-button id="btnDonationPrint" name="btnDonationPrint" uitype="normal" text="기부금 지급명세서" class="btn btn-sm btn-outline-danger"
                                     onclick="fn_btnDonationPrint"></sbux-button>
                        <sbux-button id="btnAllDelete" name="btnAllDelete" uitype="normal" text="전체 삭제" class="btn btn-sm btn-outline-danger"
                                     onclick="fn_btnAllDelete"></sbux-button>
                        <sbux-button id="btnPaperless" name="btnPaperless" uitype="normal" text="종이없는 연말정산" class="btn btn-sm btn-outline-danger"
                                     onclick="fn_btnPaperless"></sbux-button>
                    </div>
                </div>
                <div>
                    <table id="dataArea2" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:4%">
                            <col style="width:3%">
                            <col style="width:4%">
                            <col style="width:3%">

                            <col style="width:4%">
                            <col style="width:3%">
                            <col style="width:4%">
                            <col style="width:3%">

                            <col style="width:4%">
                            <col style="width:3%">
                            <col style="width:4%">
                            <col style="width:3%">

                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">이름</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-input
                                        uitype="text"
                                        id="EMP_NAME"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">주민등록번호</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-input
                                        uitype="text"
                                        id="SOCIAL_NO_REAL"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">사업장</th>
                            <td colspan="2" class="td_input">
                                <sbux-select
                                        id="SITE_CODE"
                                        uitype="single"
                                        jsondata-ref="jsonSiteCode"
                                        unselected-text="선택"
                                        class="form-control input-sm"
                                        readonly
                                <%--onchange="fn_payType"--%>>
                                </sbux-select>
                            </td>
                            <td style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">근무기간</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-input
                                        uitype="text"
                                        id="WORK_DATE"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">거주구분</th>
                            <td colspan="3" class="td_input" style="border-right: hidden;">
                                <sbux-checkbox
                                        id="LIVE_YN"
                                        name="LIVE_YN"
                                        uitype="normal"
                                        text="거주구분"
                                        true-value="Y"
                                        false-value="N"
                                ></sbux-checkbox>
                            </td>
                            <th scope="row" class="th_bg">정산구분</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="LIVE_NATION_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="LIVE_NATION_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">세대주</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-checkbox
                                        id="FAMILY_OWNER_YN"
                                        name="FAMILY_OWNER_YN"
                                        uitype="normal"
                                        text=""
                                        true-value="Y"
                                        false-value="N"
                                ></sbux-checkbox>
                            </td>
                            <th scope="row" class="th_bg" style="display: none;">인적사항 전년과 동일</th>
                            <td class="td_input" style="border-right: hidden; display: none;">
                                <sbux-checkbox
                                        id="BEF_YEAR_EQUAL_YN"
                                        name="BEF_YEAR_EQUAL_YN"
                                        uitype="normal"
                                        text=""
                                        true-value="Y"
                                        false-value="N"
                                ></sbux-checkbox>
                            </td>
                            <th scope="row" class="th_bg" style="display: none;">외국인 단일세율</th>
                            <td class="td_input" style="border-right: hidden; display: none;">
                                <sbux-checkbox
                                        id="FOREI_TX_YN"
                                        name="FOREI_TX_YN"
                                        uitype="normal"
                                        text=""
                                        true-value="Y"
                                        false-value="N"
                                ></sbux-checkbox>
                            </td>
                            <th scope="row" class="th_bg" style="display: none;">외국법인 파견근로자</th>
                            <td class="td_input" style="border-right: hidden; display: none;">
                                <sbux-checkbox
                                        id="FOREITX_DISPATCH_WRK_YN"
                                        name="FOREITX_DISPATCH_WRK_YN"
                                        uitype="normal"
                                        text=""
                                        true-value="Y"
                                        false-value="N"
                                ></sbux-checkbox>
                            </td>
                            <th scope="row" class="th_bg" style="display: none;">종교관련 종사자</th>
                            <td class="td_input" style="border-right: hidden; display: none;">
                                <sbux-checkbox
                                        id="FOREITX_DISPATCH_WRK_YN1"
                                        name="FOREITX_DISPATCH_WRK_YN1"
                                        uitype="normal"
                                        text=""
                                        true-value="Y"
                                        false-value="N"
                                ></sbux-checkbox>
                            </td>
                            <th scope="row" class="th_bg">등록완료</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-checkbox
                                        id="CLOSE_STATE"
                                        name="CLOSE_STATE"
                                        uitype="normal"
                                        text="등록완료"
                                        true-value="Y"
                                        false-value="N"
                                ></sbux-checkbox>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>인적공제 및 소득공제 명세</span>
                        </li>
                    </ul>
                    <sbux-button
                            id="btnDel"
                            name="btnDel"
                            uitype="normal"
                            text="행삭제"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_delRow"
                            style="float: right;"
                    >
                    </sbux-button>
                    <sbux-button
                            id="btnAdd"
                            name="btnAdd"
                            uitype="normal"
                            text="행추가"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_addRow"
                            style="float: right;"
                    ></sbux-button>
                    <sbux-button
                            id="btnSupportFamilyImport"
                            name="btnSupportFamilyImport"
                            uitype="normal"
                            text="인사정보에서 가져오기"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_btnSupportFamilyImport"
                            style="float: right;"
                    ></sbux-button>
                    <sbux-button
                            id="btnSupportFamilyPreYear"
                            name="btnSupportFamilyPreYear"
                            uitype="normal"
                            text="전년도 자료 가져오기"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_btnSupportFamilyPreYear"
                            style="float: right;"
                    ></sbux-button>
                </div>
                <div>
                    <div id="sb-area-gvwSupportFamily" style="height:200px; width:100%;"></div>
                </div>

                <sbux-tabs id="tabJson" name="tabJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false">
                </sbux-tabs>
                <div class="tab-content">
                    <div id="tabInfo1" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>연금보험료공제</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea3" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:3%">
                                    <col style="width:7%">
                                    <col style="width:3%">
                                    <col style="width:3%">
                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">구분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출명세</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출구분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">금액</th>
                                    <td rowspan="6" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th rowspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">연금보험료</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">국민연금보험료</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공무원연금</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="OFFICIAL_PENS_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">군인연금</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="MILITARY_PENS_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사립학교 교직원연금</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SCHOOL_PENS_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">별정우체국연금</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="POST_PENS_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="tabInfo2" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>특별소득공제</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea4" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:3%">
                                    <col style="width:3%">
                                    <col style="width:2%">
                                    <col style="width:2%">
                                    <col style="width:4%">
                                    <col style="width:3%">
                                    <col style="width:3%">
                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">구분</th>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출명세</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출구분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">금액</th>
                                    <td rowspan="15" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">국민건강보험(노인장기요양보험 포함)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HEALTH_INSURE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">노인장기요양보험</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SENIOR_HEALTH_INSURE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고용보험</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMP_INSURE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="11" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택자금</th>
                                    <th rowspan="2" colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택자금</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">대출기관차입</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">원리금상환액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HSRENT_PRIN_ORG_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">거주자 차입</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">원리금상환액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HSRENT_PRIN_PERS_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="9" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장기주택저당차입금</th>
                                    <th rowspan="3" colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2011년 이전 차입분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">15년 미만</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">이자상환액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_AMT1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">15년~29년</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">이자상환액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_AMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">30년 이상</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">이자상환액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_AMT3" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2012년 이후 차입분(15년 이상)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고정금리ㆍ비거치 상환 대출</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">이자상환액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_AMT4" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기타 대출</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">이자상환액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_AMT5" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2015년 이후 차입분</th>
                                    <th rowspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">15년 이상</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고정금리이면서 비거치상환 대출</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">이자상환액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_AMT6" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고정금리이거나 비거치상환 대출</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">이자상환액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_AMT7" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기타대출</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">이자상환액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_AMT8" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">10~15년</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고정금리이거나 비거치상환 대출</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">이자상환액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_INT_AMT9" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="tabInfo3" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>그 밖에 소득공제</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea5" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:3%">

                                    <col style="width:2%">
                                    <col style="width:1%">
                                    <col style="width:3%">
                                    <col style="width:3%">

                                    <col style="width:3%">
                                    <col style="width:3%">

                                    <col style="width:3%">
                                    <col style="width:3%">
                                    <col style="width:2%">
                                    <col style="width:1%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">구분</th>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출명세</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출구분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">금액</th>
                                    <td rowspan="2" colspan="4" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">개인연금저축</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납입금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PRIV_PENS_SV_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소기업ㆍ소상공인 공제부금 가입일자/종료일자</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제가입일자</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker uitype="popup"
                                                id="SM_COM_AMT_DED_JOIN_DAT" name="SM_COM_AMT_DED_JOIN_DAT" date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                        />
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">대상기간종료일</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker uitype="popup"
                                                         id="SM_COM_AMT_TGT_P_END_DAT" name="SM_COM_AMT_TGT_P_END_DAT" date-format="yyyy-mm-dd"
                                                         class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                        />
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">①본인 신용카드(전통시장ㆍ대중교통사용분 제외)</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="CD_USE_BEF_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <td rowspan="17" colspan="2" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">개정규칙 적용 신청여부</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SM_COM_RULE_YN" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납입금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SM_COM_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">②본인 직불ㆍ선불카드(전통시장ㆍ대중교통사용분 제외)</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="CHKCD_USE_BEF_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택마련저축</th>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">청약저축</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납입금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_SUBS_SV_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">③본인 현금영수증(전통시장ㆍ대중교통사용분 제외)</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="CASH_RECEIPT_BEF_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">근로자주택마련저축</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납입금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_EMP_SV_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">④본인 전통시장사용분</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="TDMK_USE_BEF_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택청약종합저축</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납입금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_TOT_SV_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">⑤본인 대중교통이용분</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="PBTRN_USE_BEF_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="9" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">투자조합 출자 등</th>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2020년 출자ㆍ투자분(조합1)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">출자ㆍ투자금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INVEST_PREV2_AMT_1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">①본인 신용카드(전통시장ㆍ대중교통사용분 제외)</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="CD_USE_BEF_AMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2020년 출자ㆍ투자분(벤처)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">출자ㆍ투자금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INVEST_PREV2_AMT_2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">②본인 직불ㆍ선불카드(전통시장ㆍ대중교통사용분 제외)</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="CHKCD_USE_BEF_AMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2020년 출자ㆍ투자분(조합2)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">출자ㆍ투자금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INVEST_PREV2_AMT_3" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">③본인 현금영수증(전통시장ㆍ대중교통사용분 제외)</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="CASH_RECEIPT_BEF_AMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2021년 출자ㆍ투자분(조합1)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">출자ㆍ투자금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INVEST_PREV_AMT_1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">④본인 전통시장사용분</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="TDMK_USE_BEF_AMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2021년 출자ㆍ투자분(벤처)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">출자ㆍ투자금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INVEST_PREV_AMT_2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">⑤본인 대중교통이용분</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="PBTRN_USE_BEF_AMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2021년 출자ㆍ투자분(조합2)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">출자ㆍ투자금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INVEST_PREV_AMT_3" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">2013년 출자ㆍ투자분(조합 등)</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="INVEST_AMT1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2022년 출자ㆍ투자분(조합1)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">출자ㆍ투자금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INVEST_THIS_AMT_1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">2013년 출자ㆍ투자분(벤처 등)</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="INVEST_AMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2022년 출자ㆍ투자분(벤처)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">출자ㆍ투자금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INVEST_THIS_AMT_2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">2014년 출자ㆍ투자분(조합 등)</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="INVEST_AMT3" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">2022년 출자ㆍ투자분(조합2)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">출자ㆍ투자금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INVEST_THIS_AMT_3" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">2014년 출자ㆍ투자분(벤처 등)</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="INVEST_AMT4" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="12" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">신용카드 등 사용액</th>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">① 신용카드(전통시장ㆍ대중교통사용분 제외)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CD_USE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">목돈 안 드는 전세 이자상환액</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="LEASE_INTEREST_REDEEM_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">② 직불카드 등(전통시장·대중교통사용분 제외)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHKCD_USE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">우리사주조합 기부금</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="EMP_STOCK_DON_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">③ 현금영수증(전통시장ㆍ대중교통사용분 제외)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CASH_RECEIPT_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">본인 신용카드 등 사용액</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="PERSONAL_CD_USE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">④ 전통시장사용분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TDMK_USE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td rowspan="4" colspan="4" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">④-1 1월~3월 전통시장이용분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TDMK_USE_AMT1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">④-2 4월~12월 전통시장이용분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TDMK_USE_AMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">⑤ 대중교통이용분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PBTRN_USE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">⑥ 도서공연비이용분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BOOK_PERF_USE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CD_BOOK_PERF_USE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHKCD_BOOK_PERF_USE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CASH_BOOK_PERF_USE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td rowspan="3" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">⑥-1 1~3월 도서공연비이용분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BOOK_PERF_USE_AMT1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CD_BOOK_PERF_USE_AMT1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHKCD_BOOK_PERF_USE_AMT1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CASH_BOOK_PERF_USE_AMT1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">⑥-2 4~12월 도서공연비이용분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BOOK_PERF_USE_AMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CD_BOOK_PERF_USE_AMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHKCD_BOOK_PERF_USE_AMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CASH_BOOK_PERF_USE_AMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">신용카드 사업관련비용</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CARD_BIZ_REL_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">본인 추가공제율사용액(2016년 상반기)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center; display: none;">본인 추가공제율사용액(2016년 하반기 또는 2017년 상반기)</th>
                                    <td class="td_input" style="border-right:hidden; display: none;">
                                        <sbux-input id="CD_USE_HALF_AMT2" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">직불카드 사업관련비용</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">사용금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CHK_CD_BIZ_REL_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td rowspan="5" colspan="4" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">우리사주조합 출연금</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">출연금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMP_STOCK_GIVE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고용유지중소기업 근로자</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">임금삭감액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SALARY_DECREASE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장기집합투자증권저축</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납입금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LT_INV_ST_SAV_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">청년형 장기집합투자증권저축</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납입금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LT_COL_INV_SV_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="tabInfo4" >
                    </div>
                    <div id="tabInfo5" >
                    </div>
                    <div id="tabInfo6" >
                    </div>
                    <div id="tabInfo7" >
                    </div>
                    <div id="tabInfo8" >
                    </div>
                    <div id="tabInfo9" >
                    </div>
                    <div id="tabInfo10" >
                    </div>
                    <div id="tabInfo11" >
                    </div>
                </div>



            </div>
        </div>

    </div>
</section>
<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
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
    var gvwListGrid; 			// 그리드를 담기위한 객체 선언
    var jsonList = []; 	    // 그리드의 참조 데이터 주소 선언

    var jsonWorkCompanyType = []; //종전근무지구분 ( L_HRA031 )WORK_COMPANY_TYPE


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['srch-pay_area_type'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

            //사업장
            gfnma_multiSelectInit({
                target			: ['#srch-site_code']
                ,compCode		: gv_ma_selectedApcCd
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

        ]);
    }

    var fn_compopup1 = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("srch-dept_name"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
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
                console.log('callback data:', data);
                SBUxMethod.set('srch-dept_name', data.DEPT_NAME);
                SBUxMethod.set('srch-dept_code', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function() {

        var searchText = gfnma_nvl(SBUxMethod.get("srch-emp_name"));
        var replaceText0 = "_EMP_CODE_";
        var replaceText1 = "_EMP_NAME_";
        var replaceText2 = "_DEPT_CODE_";
        var replaceText3 = "_DEPT_NAME_";
        var replaceText4 = "_EMP_STATE_";
        var strWhereClause = "AND x.EMP_CODE LIKE '%" + replaceText0 + "%' AND x.DEPT_NAME LIKE '%" + replaceText1 + "%' AND x.DEPT_CODE LIKE '%"+replaceText2
            + "%' AND x.DEPT_NAME LIKE '%" + replaceText3 +  "%' AND x.EMP_STATE LIKE '%"+replaceText4+"%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
        compopup1({
            compCode: gv_ma_selectedApcCd
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
                console.log('callback data:', data);
                SBUxMethod.set('srch-emp_name', data.EMP_NAME);
                SBUxMethod.set('srch-emp_code', data.EMP_CODE);
            },
        });

    }

    var tabJsonData = [
        { "id" : "0",  "pid" : "-1", "order" : "1", "text" : "연금보험료공제",         "targetid" : "tabInfo1" ,     "targetvalue" : "연금보험료공제"},
        { "id" : "1",  "pid" : "-1", "order" : "2", "text" : "특별소득공제",           "targetid" : "tabInfo2" ,     "targetvalue" : "특별소득공제"},
        { "id" : "2",  "pid" : "-1", "order" : "3", "text" : "그 밖의 소득공제",        "targetid" : "tabInfo3" ,     "targetvalue" : "그 밖의 소득공제"},
        { "id" : "3",  "pid" : "-1", "order" : "4", "text" : "세금감면/세액공제",       "targetid" : "tabInfo4" ,     "targetvalue" : "세금감면/세액공제"},
        { "id" : "4",  "pid" : "-1", "order" : "5", "text" : "세액공제1",              "targetid" : "tabInfo5" ,     "targetvalue" : "세액공제1"},
        { "id" : "5",  "pid" : "-1", "order" : "6", "text" : "세액공제2",              "targetid" : "tabInfo6" ,     "targetvalue" : "세액공제2"},
        { "id" : "6",  "pid" : "-1", "order" : "7", "text" : "연금저축 등 소득공제명세",  "targetid" : "tabInfo7" ,     "targetvalue" : "연금저축 등 소득공제명세"},
        { "id" : "7",  "pid" : "-1", "order" : "8", "text" : "월세액 등 소득공제명세",    "targetid" : "tabInfo8" ,     "targetvalue" : "월세액 등 소득공제명세"},
        { "id" : "8",  "pid" : "-1", "order" : "9", "text" : "의료비 지급명세서",        "targetid" : "tabInfo9" ,     "targetvalue" : "의료비 지급명세서"},
        { "id" : "9",  "pid" : "-1", "order" : "10", "text" : "기부금 지급명세서",       "targetid" : "tabInfo10" ,     "targetvalue" : "기부금 지급명세서"},
        { "id" : "10", "pid" : "-1", "order" : "11", "text" : "보험료(국세청)",         "targetid" : "tabInfo11" ,     "targetvalue" : "보험료(국세청)"},
    ];

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        let openDate = gfn_dateToYear(new Date());

        SBUxMethod.set('srch-ye_tx_yyyy', openDate);
        /*SBUxMethod.set('srch-pay_yyyymm_fr2', openDate);*/

        fn_createGrid();
    }

    // 신규
    /*  function cfn_add() {
          fn_create();
      }*/
    // 저장
    function cfn_save() {
        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            let WorkComList = gvwWorkComGrid.getUpdateData(true, 'all');

            if (_.isEmpty(WorkComList) == false){

                fn_save(WorkComList);

            }

        }

    }
    // 삭제
    /*function cfn_del() {
        if (gfn_comConfirm("Q0001", "삭제")) {
            fn_save('D');
        }
    }*/

    // 조회
    function cfn_search() {
        fn_search();
    }

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }

    //사원정보
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwList';
        SBGridProperties.id = 'gvwListGrid';
        SBGridProperties.jsonref = 'jsonList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: [""], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption : ["사업장"], ref : 'SITE_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["부서코드"], ref : 'DEPT_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDeptCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["부서명"], ref : 'DEPT_NAME', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDeptName', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['입사일자'], ref: 'ENTER_DATE', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
        ];

        gvwListGrid = _SBGrid.create(SBGridProperties);
        gvwListGrid.bind('click', 'fn_view');
    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
