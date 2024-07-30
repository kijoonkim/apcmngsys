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
                            jsondata-ref=""
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
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>세액감면</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea6" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:3%">
                                    <col style="width:5%">
                                    <col style="width:3%">
                                    <col style="width:3%">

                                    <col style="width:1%">
                                    <col style="width:2%">

                                    <col style="width:3%">

                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th rowspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">외국인 근로자</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">입국목적</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="FOREI_VISIT_PURP" uitype="single" jsondata-ref="jsonForeiVisitPurp"
                                                     unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기술도입계약 또는 근로제공일</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-datepicker id="TECH_INTRO_CONTRACT_DAT" name="srch-date_fr" uitype="popup" date-format="yyyymmdd"
                                                class="form-control input-sm input-sm-ast"></sbux-datepicker>
                                    </td>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">감면기간 만료일</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-datepicker id="TECH_INTRO_RED_END_DAT" name="srch-date_fr" uitype="popup" date-format="yyyymmdd"
                                                         class="form-control input-sm input-sm-ast"></sbux-datepicker>
                                    </td>
                                    <td rowspan="4" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">외국인 근로소득에 대한 감면</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">접수일</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-datepicker id="FOREI_INC_RED_RECV_DAT" name="srch-date_fr" uitype="popup" date-format="yyyymmdd"
                                                         class="form-control input-sm input-sm-ast"></sbux-datepicker>
                                    </td>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">제출일</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-datepicker id="FOREI_INC_RED_SUBMIT_DAT" name="srch-date_fr" uitype="popup" date-format="yyyymmdd"
                                                         class="form-control input-sm input-sm-ast"></sbux-datepicker>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">근로소득에 대한 조세조약 상 면제</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">접수일</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-datepicker id="TX_TREATY_RED_RECV_DAT" name="srch-date_fr" uitype="popup" date-format="yyyymmdd"
                                                         class="form-control input-sm input-sm-ast"></sbux-datepicker>
                                    </td>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">제출일</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-datepicker id="TX_TREATY_RED_SUBMIT_DAT" name="srch-date_fr" uitype="popup" date-format="yyyymmdd"
                                                         class="form-control input-sm input-sm-ast"></sbux-datepicker>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">중소기업 취업자 감면</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">접수일</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-datepicker id="EMP_YOUTH_ST_DAT" name="srch-date_fr" uitype="popup" date-format="yyyymmdd"
                                                         class="form-control input-sm input-sm-ast"></sbux-datepicker>
                                    </td>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">제출일</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-datepicker id="EMP_YOUTH_RED_END_DAT" name="srch-date_fr" uitype="popup" date-format="yyyymmdd"
                                                         class="form-control input-sm input-sm-ast"></sbux-datepicker>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="tabInfo5" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>세액공제1</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea7" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:3%">

                                    <col style="width:3%">

                                    <col style="width:4%">
                                    <col style="width:1%">
                                    <col style="width:2%">
                                    <col style="width:1%">

                                    <col style="width:1%">
                                    <col style="width:2%">

                                    <col style="width:1%">
                                    <col style="width:2%">

                                    <col style="width:3%">

                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th colspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공제종류</th>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">명세</th>
                                    <td rowspan="13" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th rowspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">연금계좌</th>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">과학기술인공제</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납입금액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SCNT_PENS_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">「근로자퇴직급여 보장법」에 따른 퇴직연금</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납입금액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_PENS_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">연금저축</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납입금액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_SV_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">ISA 만기시 연금계좌 추가납입</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납입금액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ISA_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="21" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">특별세액공제</th>
                                    <th rowspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보장성</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="GENERAL_INSURE_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장애인전용보장성</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">보험료</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_INSURE_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="8" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">의료비</th>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">본인</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PERSONAL_MED_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">65세 이상자</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SENIOR_MED_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장애인</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_MED_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">난임시술비</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INFTY_MED_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">그 밖의 공제대상자</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EXCP_MED_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">산후조리원</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="POSTPARTUM_CARE_CENTER_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">실손의료보험금</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">환급보험금</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LOSS_MEDICAL_INSURANCE_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LOSS_MED_INSUR_ME_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">미숙아ㆍ선천성 이상아 의료비</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PREEMIE_BABY_MED_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LOSS_MED_INSUR_EXEC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">교육비</th>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">소득자 본인</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공납금(대학원 포함)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PERSONAL_EDU_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td rowspan="13" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">취학전 아동</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <%--<p style="background-color: #FFB6C1; text-align: center;">( </p>--%>
                                        <sbux-input id="PRESCHOOL_EDU_TAX_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                       <%-- <p style="background-color: #FFB6C1; text-align: center;">) 명</p>--%>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">유치원ㆍ학원비 등</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PRESCHOOL_EDU_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">초ㆍ중ㆍ고등학교</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <%--<p style="background-color: #FFB6C1; text-align: center;">( </p>--%>
                                        <sbux-input id="SCHOOL_EDU_TAX_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                        <%-- <p style="background-color: #FFB6C1; text-align: center;">) 명</p>--%>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공납금</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SCHOOL_EDU_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">대학생(대학원 불포함)</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <%--<p style="background-color: #FFB6C1; text-align: center;">( </p>--%>
                                        <sbux-input id="UNIVERSITY_EDU_TAX_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                        <%-- <p style="background-color: #FFB6C1; text-align: center;">) 명</p>--%>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">공납금</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="UNIVERSITY_EDU_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">장애인</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">( </th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <%--<p style="background-color: #FFB6C1; text-align: center;">( </p>--%>
                                        <sbux-input id="HANDICAP_EDU_TAX_DED_COUNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                        <%-- <p style="background-color: #FFB6C1; text-align: center;">) 명</p>--%>
                                    </td>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">)명</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">특수교육비</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HDCP_EDU_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기부금</th>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">정치자금기부금</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기부금액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_POL_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">고향사랑기부금</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기부금액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_HLE_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">법정기부금</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기부금액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_LGL_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">우리사주조합 기부금</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기부금액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_EMP_STOCK_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지정기부금(종교단체외)</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기부금액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_OUT_OF_REL_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지정기부금(종교단체)</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">기부금액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DON_REL_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">주택자금차입금이자세액공제</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">이자상환액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HSRENT_INT_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">30%</th>
                                    <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th colspan="3" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">월세액 세액공제</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">지출액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HS_MM_RENT_TX_DEAMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">10%</th>
                                    <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="tabInfo6" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>세액공제</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea8" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:7%">
                                    <col style="width:3%">
                                    <col style="width:3%">
                                    <col style="width:0.5%">
                                    <col style="width:3%">
                                    <col style="width:3%">

                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th rowspan="5" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">외국납부세액</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">국외원천소득</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="FOREI_INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납세액(외화)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="FOREI_PAY_TX_FOREI_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td rowspan="4" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납세액(원화)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="FOREI_PAY_TX_WON_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납세국명</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="FOREI_PAY_TX_NATION_NAME" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">납부일</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-datepicker id="FOREI_PAY_TX_DAT" name="srch-date_fr" uitype="popup" date-format="yyyymmdd"
                                                         class="form-control input-sm input-sm-ast"></sbux-datepicker>
                                    </td>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">신청서제출일</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-datepicker id="FOREI_REQ_SUBMIT_DAT" name="srch-date_fr" uitype="popup" date-format="yyyymmdd"
                                                         class="form-control input-sm input-sm-ast"></sbux-datepicker>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">국외근무처</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="FOREI_COM_NAME" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">직책</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="FOREI_DUTY_NAME" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1; text-align: center;">근무기간</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="FOREI_WORK_ST_DAT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <p>~</p>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="FOREI_WORK_END_DAT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" <%--mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"--%>
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="tabInfo7" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>연금 저축 등 소득공제명세</span>
                                </li>
                            </ul>
                            <sbux-button
                                    id="btnDel1"
                                    name="btnDel2"
                                    uitype="normal"
                                    text="행삭제"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_delRow1"
                                    style="float: right;"
                            >
                            </sbux-button>
                            <sbux-button
                                    id="btnAdd1"
                                    name="btnAdd1"
                                    uitype="normal"
                                    text="행추가"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_addRow1"
                                    style="float: right;"
                            ></sbux-button>
                        </div>
                        <div>
                            <div id="sb-area-gvwPensionSaving" style="height:800px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="tabInfo8" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>월세액 등 소득공제명세</span>
                                </li>
                            </ul>
                            <sbux-button
                                    id="btnDel2"
                                    name="btnDel2"
                                    uitype="normal"
                                    text="행삭제"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_delRow2"
                                    style="float: right;"
                            >
                            </sbux-button>
                            <sbux-button
                                    id="btnAdd2"
                                    name="btnAdd2"
                                    uitype="normal"
                                    text="행추가"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_addRow2"
                                    style="float: right;"
                            ></sbux-button>
                        </div>
                        <div>
                            <div id="sb-area-gvwHouseMonthly" style="height:800px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="tabInfo9" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>의료비 지급명세서</span>
                                </li>
                            </ul>
                            <sbux-button
                                    id="btnDel3"
                                    name="btnDel3"
                                    uitype="normal"
                                    text="행삭제"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_delRow3"
                                    style="float: right;"
                            >
                            </sbux-button>
                            <sbux-button
                                    id="btnAdd3"
                                    name="btnAdd3"
                                    uitype="normal"
                                    text="행추가"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_addRow3"
                                    style="float: right;"
                            ></sbux-button>
                        </div>
                        <div>
                            <div id="sb-area-gvwMedExpense" style="height:800px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="tabInfo10" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>기부금 지급명세서</span>
                                </li>
                            </ul>
                            <sbux-button
                                    id="btnDel4"
                                    name="btnDel4"
                                    uitype="normal"
                                    text="행삭제"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_delRow4"
                                    style="float: right;"
                            >
                            </sbux-button>
                            <sbux-button
                                    id="btnAdd4"
                                    name="btnAdd4"
                                    uitype="normal"
                                    text="행추가"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_addRow4"
                                    style="float: right;"
                            ></sbux-button>
                        </div>
                        <div>
                            <div id="sb-area-gvwDonation" style="height:800px; width:100%;"></div>
                        </div>
                        <sbux-tabs id="tabJson1" name="tabJson1" uitype="normal" jsondata-ref="tabJsonData1" is-scrollable="false">
                        </sbux-tabs>
                        <div class="tab-content">
                            <div id="tabInfo111" >
                                <div>
                                    <div id="sb-area-gvwDonationAdjust" style="height:800px; width:100%;"></div>
                                </div>
                            </div>
                            <div id="tabInfo222" >
                                <div>
                                    <div id="sb-area-gvwDonationAdjust2" style="height:800px; width:100%;"></div>
                                </div>
                            </div>
                            <div id="tabInfo333" >
                                <div class="ad_tbl_top">
                                    <sbux-button
                                            id="btnDel6"
                                            name="btnDel6"
                                            uitype="normal"
                                            text="행삭제"
                                            class="btn btn-sm btn-outline-danger"
                                            onclick="fn_delRow6"
                                            style="float: right;"
                                    >
                                    </sbux-button>
                                    <sbux-button
                                            id="btnAdd6"
                                            name="btnAdd6"
                                            uitype="normal"
                                            text="행추가"
                                            class="btn btn-sm btn-outline-danger"
                                            onclick="fn_addRow6"
                                            style="float: right;"
                                    ></sbux-button>
                                </div>
                                <div>
                                    <div id="sb-area-gvwDonationAdjust3" style="height:800px; width:100%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tabInfo11" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>보험료 내역</span>
                                </li>
                            </ul>
                            <sbux-button
                                    id="btnDel5"
                                    name="btnDel5"
                                    uitype="normal"
                                    text="행삭제"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_delRow5"
                                    style="float: right;"
                            >
                            </sbux-button>
                            <sbux-button
                                    id="btnAdd5"
                                    name="btnAdd5"
                                    uitype="normal"
                                    text="행추가"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_addRow5"
                                    style="float: right;"
                            ></sbux-button>
                        </div>
                        <div>
                            <div id="sb-area-gvwInsure" style="height:800px; width:100%;"></div>
                        </div>
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
    var gvwSupportGrid;//인적공제 및 소득공제 명세 리스트
    var jsonSupportList = [];
    var gvwPensionSavingGrid;//인적공제 및 소득공제 명세 리스트
    var jsonPensionSavingList = [];
    var gvwHouseMonthlyGrid;//월세액 등 소득공제명세 리스트
    var jsonHouseMonthlyList = [];
    var gvwMedExpenseGrid;//의료비 지급명세서 리스트
    var jsonMedExpenseList = [];
    var gvwDonationGrid;//의료비 지급명세서 리스트
    var jsonDonationList = [];
    var gvwAdjustGrid;//기부금 조정명세(전년도이월) 리스트
    var jsonAdjustList = [];
    var gvwAdjust2Grid;//기부금 조정명세(당해이월) 리스트
    var jsonAdjust2List = [];
    var gvwAdjust3Grid;//전년도이월 기부금 관리 리스트
    var jsonAdjust3List = [];
    var gvwInsureGrid;//보험료 리스트
    var jsonInsureList = [];


    var jsonSiteCode = []; //사업장 ( L_ORG001 )srch-site_code, 	SITE_CODE
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )srch-pay_area_type
    var jsonLiveNationCode = []; //거주지국 ( L_COM015 )LIVE_NATION_CODE
    var jsonForeiVisitPurp = []; //입국목적 ( L_HRA050 )FOREI_VISIT_PURP
    var jsonPensDedType = []; //소득공제구분 ( L_HRA012 )PENS_DED_TYPE
    var jsonInvestmentType = []; //투자조합구분 ( L_HRA069 )INVESTMENT_TYPE
    var jsonHouseType = []; //주택임차주택유형 ( L_HRA064 )HS_MM_RENT_TYPE, HSRENT_RDM_LEASE_TYPE
    var jsonSocialNoReal = []; //대상자 ( L_HRA042 )MED_SOCIAL_NO_REAL, DONATION_SOCIAL_NO_REAL,INSURE_SOCIAL_NO_REAL
    var jsonMedCertificateCode = []; //의료증빙코드 ( L_HRA007 )MED_CERTIFICATE_CODE
    var jsonDonYeTxRel = []; //기부금 관계코드 ( L_HRA043 )DON_YE_TX_REL
    var jsonDonTypeNtsYn = []; //구분 ( L_HRA044 )DON_TYPE_NTS_YN
    var jsonDonType = []; //구분 ( L_HRA002 )DON_TYPE
    var jsonInsureType = []; //구분 ( L_HRA070 )insure_type
    var jsonFamilyYeTxRel = []; //가족 관계코드 ( L_HRA009 )FAMILY_YE_TX_REL
    var jsonFamilyYn = []; //가족 관계코드 ( L_COM014 )FAMILY_FOREI_YN
    var jsonFamilyHdcpType = []; //장애인 ( L_HRA051 )FAMILY_HDCP_TYPE
    var jsonEduExpType = []; //교육비구분 ( L_HRA004 )EDU_EXP_TYPE
    var jsonFamilyChildSeqType = []; //자녀순서 ( L_HRA067 )FAMILY_CHILD_SEQ_TYPE


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['gvwListGrid','SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['srch-pay_area_type'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwListGrid'], jsonLiveNationCode, 'L_COM015', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'NATION_CODE', 'NATION_NAME', 'Y', ''),
            gfnma_setComSelect(['FOREI_VISIT_PURP'], jsonForeiVisitPurp, 'L_HRA050', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwPensionSavingGrid'], jsonPensDedType, 'L_HRA012', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwPensionSavingGrid'], jsonInvestmentType, 'L_HRA069', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwHouseMonthlyGrid'], jsonHouseType, 'L_HRA064', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwMedExpenseGrid','gvwDonationGrid','gvwInsureGrid'], jsonSocialNoReal, 'L_HRA042', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwMedExpenseGrid'], jsonMedCertificateCode, 'L_HRA007', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwDonationGrid'], jsonDonYeTxRel, 'L_HRA043', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwDonationGrid'], jsonDonTypeNtsYn, 'L_HRA044', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwDonationGrid','gvwAdjustGrid', 'gvwAdjust2Grid', 'gvwAdjust3Grid'], jsonDonType, 'L_HRA002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwInsureGrid'], jsonInsureType, 'L_HRA070', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwSupportGrid'], jsonFamilyYeTxRel, 'L_HRA009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwSupportGrid'], jsonFamilyYn, 'L_COM014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwSupportGrid'], jsonFamilyHdcpType, 'L_HRA051', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwSupportGrid'], jsonEduExpType, 'L_HRA004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwSupportGrid'], jsonFamilyChildSeqType, 'L_HRA067', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

            //정산구분
            gfnma_multiSelectInit({
                target			: ['#srch-ye_tx_type']
                ,compCode		: gv_ma_selectedApcCd
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

    var tabJsonData1 = [
        { "id" : "0",  "pid" : "-1", "order" : "1", "text" : "기부금 조정명세(전년도이월)",         "targetid" : "tabInfo111" ,     "targetvalue" : "기부금 조정명세(전년도이월)"},
        { "id" : "1",  "pid" : "-1", "order" : "2", "text" : "기부금 조정명세(당해이월)",           "targetid" : "tabInfo222" ,     "targetvalue" : "기부금 조정명세(당해이월)"},
        { "id" : "2",  "pid" : "-1", "order" : "3", "text" : "전년도이월 기부금 관리",              "targetid" : "tabInfo333" ,     "targetvalue" : "전년도이월 기부금 관리"},
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
        fn_createSupportGrid();
        fn_createPensionSavingGrid();
        fn_createHouseMonthlyGrid();
        fn_createMedExpenseGrid();
        fn_createDonationGrid();
        fn_createAdjustGrid();
        fn_createAdjust2Grid();
        fn_createAdjust3Grid();
        fn_createInsureGrid();

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
            {caption: ['퇴사일'], ref: 'RETIRE_DATE', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["주민등록번호"], ref: 'SOCIAL_NO_REAL', type: 'output', width: '140px', style: 'text-align:left', hidden : true},
            {caption : ["사업장"], ref : 'SITE_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode', displayui : true, label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["근무기간"], ref: 'WORK_DATE', type: 'output', width: '140px', style: 'text-align:left', hidden : true},
            {caption: ["거주구분"], ref: 'LIVE_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                } , hidden : true
            },
            {caption : ["거주지국"], ref : 'LIVE_NATION_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonLiveNationCode', displayui : true, label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["세대주"], ref: 'FAMILY_OWNER_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }, hidden : true
            },
            {caption: ["인적사항 전년과 동일"], ref: 'BEF_YEAR_EQUAL_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }, hidden : true
            },
            {caption: ["외국인 단일세율"], ref: 'FOREI_TX_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }, hidden : true
            },
            {caption: ["등록완료"], ref: 'CLOSE_STATE', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["외국법인 파견근로자"], ref: 'FOREITX_DISPATCH_WRK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }, hidden : true
            },
            {caption: ["계산결과상태"], ref: 'RESULT_STATE', type: 'output', width: '140px', style: 'text-align:left', hidden : true},
            {caption: ["부서명"], ref: 'DEPT_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ['업로드시간'], ref: 'UPLOAD_TIME', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["업로드사용자"], ref: 'UPLOAD_USERID', type: 'output', width: '140px', style: 'text-align:left'},
        ];

        gvwListGrid = _SBGrid.create(SBGridProperties);
        gvwListGrid.bind('click', 'fn_view');
    }

    //인적공제 및 소득공제 명세 리스트
    function fn_createSupportGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwSupportFamily';
        SBGridProperties.id = 'gvwSupportGrid';
        SBGridProperties.jsonref = 'jsonSupportList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.frozencols = 4;
        SBGridProperties.columns = [
            {caption: ["가족성명"], ref: 'FAMILY_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["가족주민번호"], ref: 'FAMILY_SOCIAL_NO_REAL', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["가족주민번호"], ref: 'FAMILY_BIRTHDAY', type: 'output', width: '100px', style: 'text-align:left', hidden : true},
            {caption : ["가족 관계코드"], ref : 'FAMILY_YE_TX_REL', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonFamilyYeTxRel', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["외국인"], ref : 'FAMILY_FOREI_YN', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonFamilyYn', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["기본공제"], ref : 'FAMILY_BASIC_DED_YN', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonFamilyYn', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["경로우대"], ref : 'FAMILY_SENIOR_YN', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonFamilyYn', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["부녀자"], ref : 'FAMILY_WOMAN_YN', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonFamilyYn', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["한부모"], ref : 'FAMILY_SINGLE_PARENT_YN', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonFamilyYn', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["장애인"], ref : 'FAMILY_HDCP_TYPE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonFamilyHdcpType', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["7세이하"], ref : 'FAMILY_BRING_CHILD_YN', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonFamilyYn', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["출생ㆍ입양"], ref : 'FAMILY_CHILDBIRTH_YN', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonFamilyYn', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["의료비(국세청)"], ref: 'MED_EXP_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["의료비(기타)"], ref: 'MED_EXP_AMT_ETC', type: 'input', width: '140px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["일반보장성보험(국세청)"], ref: 'INSURANCE_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["일반보장성보험(기타)"], ref: 'INSURANCE_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["장애인전용보장성보험(국세청)"], ref: 'HDCP_INSURANCE_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["장애인전용보장성보험(기타)"], ref: 'HDCP_INSURANCE_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption : ["교육비구분"], ref : 'EDU_EXP_TYPE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonEduExpType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["교육비(국세청)"], ref: 'EDU_EXP_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["교육비(기타)"], ref: 'EDU_EXP_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["교육비구분(장애인)"], ref: 'EDU_HDCP_TYPE', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["교육비(장애인,국세청)"], ref: 'EDU_EXP_HDCP_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["교육비(장애인,기타)"], ref: 'EDU_EXP_HDCP_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["신용카드(국세청)"], ref: 'CD_USE_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["신용카드(기타)"], ref: 'CD_USE_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["신용카드(국세청)"], ref: 'CD_USE_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["신용카드(기타)"], ref: 'CD_USE_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["직불카드 등(국세청)"], ref: 'CHKCD_USE_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["직불카드 등(기타)"], ref: 'CHKCD_USE_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["현금영수증(국세청)"], ref: 'CASH_USE_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전통시장(국세청)"], ref: 'TDMK_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전통시장(기타)"], ref: 'TDMK_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전통시장(국세청)(1~3)"], ref: 'TDMK_AMT1_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전통시장(기타)(1~3)"], ref: 'TDMK_AMT1_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전통시장(국세청)(4~12)"], ref: 'TDMK_AMT2_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전통시장(기타)(4~12)"], ref: 'TDMK_AMT2_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["대중교통(국세청)"], ref: 'PBTRN_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["1~6월대중교통(국세청)"], ref: 'PBTRN_AMT_A_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["7~12월 대중교통(국세청)"], ref: 'PBTRN_AMT_B_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["대중교통(기타)"], ref: 'PBTRN_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["1~6월 대중교통(기타)"], ref: 'PBTRN_AMT_A_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["7~12월 대중교통(기타)"], ref: 'PBTRN_AMT_B_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["도서공연비(국세청)"], ref: 'BOOK_PERF_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["도서공연비(기타)"], ref: 'BOOK_PERF_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["1~3월 도서공연비(국세청)"], ref: 'BOOK_PERF_AMT1_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["1~3월 도서공연비(기타)"], ref: 'BOOK_PERF_AMT1_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["4~12월 도서공연비(국세청)"], ref: 'BOOK_PERF_AMT2_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["4~12월 도서공연비(기타)"], ref: 'BOOK_PERF_AMT2_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["카드도서공연비(국세청)"], ref: 'CD_BOOK_PERF_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["카드도서공연비(기타)"], ref: 'CD_BOOK_PERF_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["1~3월 카드도서공연비(국세청)"], ref: 'CD_BOOK_PERF_AMT1_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["1~3월 카드도서공연비(기타)"], ref: 'CD_BOOK_PERF_AMT1_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["4~12월 카드도서공연비(국세청)"], ref: 'CD_BOOK_PERF_AMT2_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["4~12월 카드도서공연비(기타)"], ref: 'CD_BOOK_PERF_AMT2_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["직불카드도서공연비(국세청)"], ref: 'CHKCD_BOOK_PERF_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["직불카드도서공연비(기타)"], ref: 'CHKCD_BOOK_PERF_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["1~3월 직불카드도서공연비(국세청)"], ref: 'CHKCD_BOOK_PERF_AMT1_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["1~3월 직불카드도서공연비(기타)"], ref: 'CHKCD_BOOK_PERF_AMT1_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["4~12월 직불카드도서공연비(국세청)"], ref: 'CHKCD_BOOK_PERF_AMT2_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["4~12월 직불카드도서공연비(기타)"], ref: 'CHKCD_BOOK_PERF_AMT2_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["현금영수증도서공연비(국세청)"], ref: 'CASH_BOOK_PERF_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["1~3월현금영수증도서공연비(국세청)"], ref: 'CASH_BOOK_PERF_AMT1_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["4~12월현금영수증도서공연비(국세청)"], ref: 'CASH_BOOK_PERF_AMT2_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전년도사용액(국세청)"], ref: 'CD_USE_PREV_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전년도사용액(기타)"], ref: 'CD_USE_PREV_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["당해사용액(국세청)"], ref: 'CD_USE_THIS_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["당해사용액(기타)"], ref: 'CD_USE_THIS_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전통시장전년(국세청)"], ref: 'TDMK_PREV_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전통시장전년(기타)"], ref: 'TDMK_PREV_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전통시장당해(국세청)"], ref: 'TDMK_THIS_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전통시장당해(기타)"], ref: 'TDMK_THIS_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["기부금(국세청)"], ref: 'DON_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["기부금(기타)"], ref: 'DON_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["난임시술비"], ref: 'MED_INFERTILITY_AMT', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["산후조리원비"], ref: 'POSTPARTUM_CARE_CENTER_AMT', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["실손의료보험금"], ref: 'LOSS_MEDICAL_INSURANCE_AMT', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["미숙아·선천성이상아에 대한 의료비"], ref: 'PREEMIE_BABY_AMT', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["교복구입비(국세청)"], ref: 'EDU_SCH_UNIFORM_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["교복구입비(기타)"], ref: 'EDU_SCH_UNIFORM_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["체험학습비(국세청)"], ref: 'EDU_EXP_TRAINING_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["체험학습비(기타)"], ref: 'EDU_EXP_TRAINING_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["수능/대학입학전형료(국세청)"], ref: 'EDU_EXP_SAT_PAY_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["수능/대학입학전형료(기타)"], ref: 'EDU_EXP_SAT_PAY_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption : ["자녀순서"], ref : 'FAMILY_CHILD_SEQ_TYPE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonFamilyChildSeqType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["65세ㆍ장애인<의료비(국세청)>"], ref: 'MED_SENIOR_HDCP_AMT_NTS', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["65세ㆍ장애인<의료비(기타)>"], ref: 'MED_SENIOR_HDCP_AMT_ETC', type: 'input', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption : ["65세 이상ㆍ장애인"], ref : 'FAMILY_65AGE_HDC_YN', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonFamilyYn', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["50세 이상"], ref : 'FAMILY_50AGE_YN', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonFamilyYn', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["장애인증명자료사업자번호"], ref: 'R101_BUSNID', type: 'output', width: '100px', style: 'text-align:left', hidden : true},
            {caption: ["장애인증명자료발급기관"], ref: 'R101_TRADE_NM', type: 'output', width: '100px', style: 'text-align:left', hidden : true},
            {caption: ["장애인증명자료장애내용"], ref: 'R101_PWD_CD', type: 'output', width: '100px', style: 'text-align:left', hidden : true},
            {caption: ["원천"], ref: 'DATA_SOURCE', type: 'output', width: '100px', style: 'text-align:left', hidden : true},

        ];

        gvwSupportGrid = _SBGrid.create(SBGridProperties);
        /*gvwSupportGrid.bind('click', 'fn_view');*/
    }

    //인적공제 및 소득공제 명세 리스트
    function fn_createPensionSavingGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwPensionSaving';
        SBGridProperties.id = 'gvwPensionSavingGrid';
        SBGridProperties.jsonref = 'jsonPensionSavingList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
            {caption : ["소득공제구분"], ref : 'PENS_DED_TYPE', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonPensDedType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금융기관코드"], ref: 'PENS_BANK_CODE', type: 'output', width: '140px', style: 'text-align:left', hidden : true},
            {caption: ["금융기관"], ref: 'PENSION_BANK_NAME', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["계좌번호(또는 증권번호)"], ref: 'PENSION_ACCOUNT_REAL', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  /*format : { type:'number' , rule:'#,###' }*/},
            {caption: ["불입금액"], ref: 'PENS_PAY_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["ISA계좌 만기전환 순납입금액"], ref: 'ISA_DDCT_BS_ASS_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["공제금액"], ref: 'PENS_DEAMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ['가입일자'], ref: 'PENS_JOIN_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['가입년도'], ref: 'INVESTMENT_YYYY', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy', origin:'yyyy'}},
            {caption: ["가입기간월수"], ref: 'PENS_CTR_TERM_MM_CNT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' ,  emptyvalue:'0'}},
            {caption : ["투자조합구분"], ref : 'INVESTMENT_TYPE', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonInvestmentType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["ISA계좌 만기전환 납입금액"], ref: 'ISA_ANN_TOT_AMT', type: 'output', width: '140px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["ISA계좌 만기전환 인출금액"], ref: 'ISA_TAX_YEAR_AMT', type: 'output', width: '140px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["gridColumnEx10"], ref: 'EXTRA_FIELD3', type: 'output', width: '140px', style: 'text-align:left', hidden : true},

        ];

        gvwPensionSavingGrid = _SBGrid.create(SBGridProperties);
        /*gvwPensionSavingGrid.bind('click', 'fn_view');*/
    }


    //월세액 등 소득공제명세 리스트
    function fn_createHouseMonthlyGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwHouseMonthly';
        SBGridProperties.id = 'gvwHouseMonthlyGrid';
        SBGridProperties.jsonref = 'jsonHouseMonthlyList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
            {caption: ["월세액 임대인 성명(상호)"], ref: 'HS_MM_LESSOR_NAME', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["월세액 임대인 주민등록번호(사업자번호)"], ref: 'HS_MM_LESSOR_SOCNO_REAL', type: 'input', width: '140px', style: 'text-align:left'},
            {caption : ["월세주택유형"], ref : 'HS_MM_RENT_TYPE', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonHouseType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["불입금액"], ref: 'PENS_PAY_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###.00', emptyvalue:'0.0' }},
            {caption: ["월세액 주소지"], ref: 'HS_MM_LEASE_ADDRESS', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ['월세액 임대차 시작일'], ref: 'HS_MM_ST_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['월세액 임대차 종료일'], ref: 'HS_MM_END_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["월세액"], ref: 'HS_MM_RENT_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["주택임차차입금 금전소비대차 대주 성명"], ref: 'HSRENT_RDM_LEN_NAME', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["주택임차차입금 금전소비대차 대주 주민등록번호"], ref: 'HSRENT_RDM_LEN_SOCNO_REAL', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ['주택임차차입금 금전소비대차 계약시작일'], ref: 'HSRENT_RDM_SPD_ST_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['주택임차차입금 금전소비대차 계약종료일'], ref: 'HSRENT_RDM_SPD_END_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["주택임차차입금 금전소비대차 이자율"], ref: 'HSRENT_RDM_INT_R', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["주택임차차입금 금전소비대차 원금"], ref: 'HSRENT_RDM_PRIN_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["주택임차차입금 금전소비대차 이자"], ref: 'HSRENT_RDM_INT_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["주택임차차입금 임대차 임대인 성명"], ref: 'HSRENT_RDM_LESSOR_NAME', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["주택임차차입금 임대차 임대인 주민등록번호"], ref: 'HSRENT_RDM_LESSOR_SOCNO_REAL', type: 'input', width: '140px', style: 'text-align:left'},
            {caption : ["주택임차주택유형"], ref : 'HSRENT_RDM_LEASE_TYPE', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonHouseType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["주택임차계약면적(㎡)"], ref: 'HSRENT_RDM_LEASE_AREA', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###.00', emptyvalue:'0.0' }},
            {caption: ["주택임차차입금 임대차 주소"], ref: 'HSRENT_RDM_LEASE_ADDRESS', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ['주택임차차입금 임대차 계약시작일'], ref: 'HSRENT_RDM_LEASE_ST_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['주택임차차입금 임대차 계약종료일'], ref: 'HSRENT_RDM_LEASE_END_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["주택임차차입금 임대차 전세보증금"], ref: 'HSRENT_RDM_LEASE_DEP_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},

        ];

        gvwHouseMonthlyGrid = _SBGrid.create(SBGridProperties);
        /*gvwPensionSavingGrid.bind('click', 'fn_view');*/
    }

    //의료비 지급명세서 리스트
    function fn_createMedExpenseGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwMedExpense';
        SBGridProperties.id = 'gvwMedExpenseGrid';
        SBGridProperties.jsonref = 'jsonMedExpenseList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
            {caption: ["주민등록번호"], ref: 'MED_SOCNO', type: 'input', width: '140px', style: 'text-align:left', hidden : true},
            {caption : ["대상자"], ref : 'MED_SOCIAL_NO_REAL', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonSocialNoReal', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["사업자등록번호"], ref: 'MED_COM_NUM', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["상호"], ref: 'MED_NAME', type: 'input', width: '140px', style: 'text-align:left'},
            {caption : ["의료증빙코드"], ref : 'MED_CERTIFICATE_CODE', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonMedCertificateCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["건수"], ref: 'MED_COUNT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#' ,  emptyvalue:'0'}},
            {caption: ["금액"], ref: 'MED_EXP_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["난임시술비 해당여부"], ref: 'MED_INFTY_TREATMENT_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["미숙아ㆍ선천성 이상아 해당여부"], ref: 'PREEMIE_BABY_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["안경구입비여부"], ref: 'EYEGLASS_PUR_COST_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["산후조리원여부"], ref: 'POSTPARTUM_CARE_CENTER_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["실손의료보험금"], ref: 'LOSS_MEDICAL_INSURANCE_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["증권번호"], ref: 'MED_ACC_NO', type: 'input', width: '140px', style: 'text-align:left', hidden : true},
            {caption: ["보험종류"], ref: 'MED_GOODS_NM', type: 'input', width: '140px', style: 'text-align:left', hidden : true},
            {caption: ["피보험자 주민등록번호"], ref: 'MED_INSU_RESID', type: 'input', width: '140px', style: 'text-align:left', hidden : true},
            {caption: ["피보험자 성명"], ref: 'MED_INSU_NM', type: 'input', width: '140px', style: 'text-align:left', hidden : true},

        ];

        gvwMedExpenseGrid = _SBGrid.create(SBGridProperties);
        /*gvwPensionSavingGrid.bind('click', 'fn_view');*/
    }

    //기부금 리스트
    function fn_createDonationGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwDonation';
        SBGridProperties.id = 'gvwDonationGrid';
        SBGridProperties.jsonref = 'jsonDonationList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
            {caption : ["기부자"], ref : 'DONATION_SOCIAL_NO_REAL', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonSocialNoReal', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["기부금 관계코드"], ref : 'DON_YE_TX_REL', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonDonYeTxRel', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["구분"], ref : 'DON_TYPE_NTS_YN', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonDonTypeNtsYn', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["기부유형"], ref : 'DON_TYPE', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonDonType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["사업자등록번호"], ref: 'DON_COM_NUM', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["상호"], ref: 'DON_NAME', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["건수"], ref: 'DON_COUNT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#' ,  emptyvalue:'0'}},
            {caption: ["공제대상기부금액"], ref: 'DED_TGT_DON_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["기부장려금 신청금액"], ref: 'DON_INCENTIVES_APPLY_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["금액"], ref: 'DON_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},

        ];

        gvwDonationGrid = _SBGrid.create(SBGridProperties);
        /*gvwPensionSavingGrid.bind('click', 'fn_view');*/
    }

    //기부금 조정명세(전년도이월) 리스트
    function fn_createAdjustGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwDonationAdjust';
        SBGridProperties.id = 'gvwAdjustGrid';
        SBGridProperties.jsonref = 'jsonAdjustList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
            {caption: ['기부연도'], ref: 'DON_YYYY', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy', origin:'yyyy'}},
            {caption : ["기부구분코드"], ref : 'DON_TYPE', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonDonType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'DON_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전년까지 공제된 금액"], ref: 'DON_ADJ_LAST_YEAR_DEAMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["공제대상금액"], ref: 'DON_ADJ_TGT_DEAMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["해당연도 공제금액"], ref: 'DON_ADJ_CURR_YEAR_DEAMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["소멸금액"], ref: 'DON_ADJ_DESTROY_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["이월금액"], ref: 'DON_ADJ_TRANSFER_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},

        ];

        gvwAdjustGrid = _SBGrid.create(SBGridProperties);
        /*gvwPensionSavingGrid.bind('click', 'fn_view');*/
    }

    //기부금 조정명세(당해이월) 리스트
    function fn_createAdjust2Grid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwDonationAdjust2';
        SBGridProperties.id = 'gvwAdjust2Grid';
        SBGridProperties.jsonref = 'jsonAdjust2List';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
            {caption: ['기부연도'], ref: 'DON_YYYY', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy', origin:'yyyy'}},
            {caption : ["기부구분코드"], ref : 'DON_TYPE', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonDonType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'DON_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전년까지 공제된 금액"], ref: 'DON_ADJ_LAST_YEAR_DEAMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["공제대상금액"], ref: 'DON_ADJ_TGT_DEAMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["해당연도 공제금액"], ref: 'DON_ADJ_CURR_YEAR_DEAMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["소멸금액"], ref: 'DON_ADJ_DESTROY_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["이월금액"], ref: 'DON_ADJ_TRANSFER_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},

        ];

        gvwAdjust2Grid = _SBGrid.create(SBGridProperties);
        /*gvwPensionSavingGrid.bind('click', 'fn_view');*/
    }


    //전년도이월 기부금 관리 리스트
    function fn_createAdjust3Grid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwDonationAdjust3';
        SBGridProperties.id = 'gvwAdjust3Grid';
        SBGridProperties.jsonref = 'jsonAdjust3List';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
            {caption: ['기부연도'], ref: 'DON_YYYY', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy', origin:'yyyy'}},
            {caption : ["기부구분코드"], ref : 'DON_TYPE', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonDonType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'DON_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["전년까지 공제된 금액"], ref: 'DON_ADJ_LAST_YEAR_DEAMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["공제대상금액"], ref: 'DON_ADJ_TGT_DEAMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["해당연도 공제금액"], ref: 'DON_ADJ_CURR_YEAR_DEAMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["소멸금액"], ref: 'DON_ADJ_DESTROY_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["이월금액"], ref: 'DON_ADJ_TRANSFER_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},

        ];

        gvwAdjust3Grid = _SBGrid.create(SBGridProperties);
        /*gvwPensionSavingGrid.bind('click', 'fn_view');*/
    }

    //보험료 리스트
    function fn_createInsureGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwInsure';
        SBGridProperties.id = 'gvwInsureGrid';
        SBGridProperties.jsonref = 'jsonInsureList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
            {caption: ["주민등록번호"], ref: 'INSURE_SOCNO', type: 'input', width: '140px', style: 'text-align:left', hidden : true},
            {caption : ["대상자"], ref : 'INSURE_SOCIAL_NO_REAL', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonSocialNoReal', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["사업자등록번호"], ref: 'INSURE_COM_NUM', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["상호"], ref: 'INSURE_NAME', type: 'input', width: '140px', style: 'text-align:left'},
            {caption : ["보험유형"], ref : 'INSURE_TYPE', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonInsureType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["보험번호"], ref: 'INSURE_NO', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["건수"], ref: 'INSURE_COUNT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#' ,  emptyvalue:'0'}},
            {caption: ["보험금액"], ref: 'INSURE_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
        ];

        gvwInsureGrid = _SBGrid.create(SBGridProperties);
        /*gvwPensionSavingGrid.bind('click', 'fn_view');*/
    }

    /**
     * 목록 조회
     */
    const fn_search = async function (workType) {

        let YE_TX_YYYY = gfnma_nvl(SBUxMethod.get("srch-ye_tx_yyyy")); //정산연도
        let YE_TX_TYPE = gfnma_multiSelectGet('#srch-ye_tx_type');//정산구분

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }

        let RET_DATE_FR = gfnma_nvl(SBUxMethod.get("srch-ret_date_fr")); //퇴사일
        let RET_DATE_TO = gfnma_nvl(SBUxMethod.get("srch-ret_date_to")); //퇴사일
        let SITE_CODE	= gfnma_multiSelectGet('#srch-site_code');//사업장
        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("srch-dept_code")); //부서
        let DEPT_NAME = gfnma_nvl(SBUxMethod.get("srch-dept_name")); //부서
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("srch-emp_code")); //사원
        let EMP_NAME = gfnma_nvl(SBUxMethod.get("srch-emp_name")); //사원


        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_YE_TX_YYYY       : YE_TX_YYYY
            ,V_P_YEAR_END_TX_TYPE : YE_TX_TYPE
            ,V_P_SITE_CODE        : SITE_CODE
            ,V_P_DEPT_CODE        : DEPT_CODE
            ,V_P_EMP_CODE         : EMP_CODE
            ,V_P_EMP_CODE_LIST    : ''
            ,V_P_RET_DAT_FR       : RET_DATE_FR
            ,V_P_RET_DAT_TO       : RET_DATE_TO
            ,V_P_PAY_AREA_TYPE    : PAY_AREA_TYPE

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        console.log('------paramObj-------',paramObj)

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1400List.do", {
            getType: 'json',
            workType: 'LIST',
            cv_count: '29',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('------data-------',data)
        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHECK_YN: gfnma_nvl(item.CHECK_YN),
                        EMP_CODE: gfnma_nvl(item.EMP_CODE),
                        EMP_NAME: gfnma_nvl(item.EMP_NAME),
                        EMP_FULL_NAME: gfnma_nvl(item.EMP_FULL_NAME),
                        RETIRE_DATE: gfnma_nvl(item.RETIRE_DATE),
                        SOCNO: gfnma_nvl(item.SOCNO),
                        SOCIAL_NO_REAL: gfnma_nvl(item.SOCIAL_NO_REAL),
                        SITE_CODE: gfnma_nvl(item.SITE_CODE),
                        WORK_DATE: gfnma_nvl(item.WORK_DATE),
                        LIVE_YN: gfnma_nvl(item.LIVE_YN),
                        LIVE_NATION_CODE: gfnma_nvl(item.LIVE_NATION_CODE),
                        FAMILY_OWNER_YN: gfnma_nvl(item.FAMILY_OWNER_YN),
                        BEF_YEAR_EQUAL_YN: gfnma_nvl(item.BEF_YEAR_EQUAL_YN),
                        FOREI_TX_YN: gfnma_nvl(item.FOREI_TX_YN),
                        FOREITX_DISPATCH_WRK_YN: gfnma_nvl(item.FOREITX_DISPATCH_WRK_YN),
                        CLOSE_STATE: gfnma_nvl(item.CLOSE_STATE),
                        DEPT_NAME: gfnma_nvl(item.DEPT_NAME),
                        UPLOAD_TIME: gfnma_nvl(item.UPLOAD_TIME),
                        UPLOAD_USERID: gfnma_nvl(item.UPLOAD_USERID),

                    }
                    jsonList.push(msg);
                    totalRecordCount ++;
                });

                gvwListGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                fn_view();

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

        let nRow = gvwListGrid.getRow();

        if (nRow < 1) {
            nRow = 1; //그리드 로우 첫번째값 셋팅
        }

        let rowData = gvwListGrid.getRowData(nRow);

        let YE_TX_YYYY = gfnma_nvl(SBUxMethod.get("srch-ye_tx_yyyy")); //정산연도
        let YE_TX_TYPE = gfnma_multiSelectGet('#srch-ye_tx_type');//정산구분

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }

        let RET_DATE_FR = gfnma_nvl(SBUxMethod.get("srch-ret_date_fr")); //퇴사일
        let RET_DATE_TO = gfnma_nvl(SBUxMethod.get("srch-ret_date_to")); //퇴사일
        let SITE_CODE	= gfnma_multiSelectGet('#srch-site_code');//사업장
        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("srch-dept_code")); //부서
       /* let EMP_CODE = gfnma_nvl(SBUxMethod.get("srch-emp_code")); //사원*/


        if (_.isEmpty(rowData) == false) {


            var paramObj = {
                V_P_DEBUG_MODE_YN: 'N'
                , V_P_LANG_ID: 'KOR'
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                , V_P_YE_TX_YYYY: YE_TX_YYYY
                , V_P_YEAR_END_TX_TYPE: YE_TX_TYPE
                , V_P_SITE_CODE: SITE_CODE
                , V_P_DEPT_CODE: DEPT_CODE
                , V_P_EMP_CODE: rowData.EMP_CODE
                , V_P_EMP_CODE_LIST: ''
                , V_P_RET_DAT_FR: RET_DATE_FR
                , V_P_RET_DAT_TO: RET_DATE_TO
                , V_P_PAY_AREA_TYPE: PAY_AREA_TYPE

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: ''
                , V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1400List.do", {
                getType: 'json',
                workType: 'LIST',
                cv_count: '29',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    jsonList.length = 0;
                    data.cv_1.forEach((item, index) => {
                        const msg = {
                            FAMILY_NAME: gfnma_nvl(item.FAMILY_NAME),
                            FAMILY_SOCNO: gfnma_nvl(item.FAMILY_SOCNO),
                            FAMILY_SOCIAL_NO_REAL: gfnma_nvl(item.FAMILY_SOCIAL_NO_REAL),
                            FAMILY_BIRTHDAY: gfnma_nvl(item.FAMILY_BIRTHDAY),
                            FAMILY_YE_TX_REL: gfnma_nvl(item.FAMILY_YE_TX_REL),
                            FAMILY_FOREI_YN: gfnma_nvl(item.FAMILY_FOREI_YN),
                            FAMILY_BASIC_DED_YN: gfnma_nvl(item.FAMILY_BASIC_DED_YN),
                            FAMILY_SENIOR_YN: gfnma_nvl(item.FAMILY_SENIOR_YN),
                            FAMILY_WOMAN_YN: gfnma_nvl(item.FAMILY_WOMAN_YN),
                            FAMILY_SINGLE_PARENT_YN: gfnma_nvl(item.FAMILY_SINGLE_PARENT_YN),
                            FAMILY_HDCP_TYPE: gfnma_nvl(item.FAMILY_HDCP_TYPE),
                            FAMILY_BRING_CHILD_YN: gfnma_nvl(item.FAMILY_BRING_CHILD_YN),
                            FAMILY_CHILDBIRTH_YN: gfnma_nvl(item.FAMILY_CHILDBIRTH_YN),
                            INSURANCE_AMT_NTS: gfnma_nvl(item.INSURANCE_AMT_NTS),
                            INSURANCE_AMT_ETC: gfnma_nvl(item.INSURANCE_AMT_ETC),
                            HDCP_INSURANCE_AMT_NTS: gfnma_nvl(item.HDCP_INSURANCE_AMT_NTS),
                            HDCP_INSURANCE_AMT_ETC: gfnma_nvl(item.HDCP_INSURANCE_AMT_ETC),
                            MED_EXP_AMT_NTS: gfnma_nvl(item.MED_EXP_AMT_NTS),
                            MED_EXP_AMT_ETC: gfnma_nvl(item.MED_EXP_AMT_ETC),
                            EDU_EXP_TYPE: gfnma_nvl(item.EDU_EXP_TYPE),
                            EDU_EXP_AMT_NTS: gfnma_nvl(item.EDU_EXP_AMT_NTS),
                            EDU_EXP_AMT_ETC: gfnma_nvl(item.EDU_EXP_AMT_ETC),
                            EDU_HDCP_TYPE: gfnma_nvl(item.EDU_HDCP_TYPE),
                            EDU_EXP_HDCP_AMT_NTS: gfnma_nvl(item.EDU_EXP_HDCP_AMT_NTS),
                            EDU_EXP_HDCP_AMT_ETC: gfnma_nvl(item.EDU_EXP_HDCP_AMT_ETC),
                            CD_USE_AMT_NTS: gfnma_nvl(item.CD_USE_AMT_NTS),
                            CD_USE_AMT_ETC: gfnma_nvl(item.CD_USE_AMT_ETC),
                            CHKCD_USE_AMT_NTS: gfnma_nvl(item.CHKCD_USE_AMT_NTS),
                            CHKCD_USE_AMT_ETC: gfnma_nvl(item.CHKCD_USE_AMT_ETC),
                            CASH_USE_AMT_NTS: gfnma_nvl(item.CASH_USE_AMT_NTS),
                            TDMK_AMT_NTS: gfnma_nvl(item.TDMK_AMT_NTS),
                            TDMK_AMT_ETC: gfnma_nvl(item.TDMK_AMT_ETC),
                            TDMK_AMT1_NTS: gfnma_nvl(item.TDMK_AMT1_NTS),
                            TDMK_AMT1_ETC: gfnma_nvl(item.TDMK_AMT1_ETC),
                            TDMK_AMT2_NTS: gfnma_nvl(item.TDMK_AMT2_NTS),
                            TDMK_AMT2_ETC: gfnma_nvl(item.TDMK_AMT2_ETC),
                            PBTRN_AMT_NTS: gfnma_nvl(item.PBTRN_AMT_NTS),
                            PBTRN_AMT_A_NTS: gfnma_nvl(item.PBTRN_AMT_A_NTS),
                            PBTRN_AMT_B_NTS: gfnma_nvl(item.PBTRN_AMT_B_NTS),
                            PBTRN_AMT_ETC: gfnma_nvl(item.PBTRN_AMT_ETC),
                            PBTRN_AMT_A_ETC: gfnma_nvl(item.PBTRN_AMT_A_ETC),
                            PBTRN_AMT_B_ETC: gfnma_nvl(item.PBTRN_AMT_B_ETC),
                            BOOK_PERF_AMT_NTS: gfnma_nvl(item.BOOK_PERF_AMT_NTS),
                            BOOK_PERF_AMT_ETC: gfnma_nvl(item.BOOK_PERF_AMT_ETC),
                            BOOK_PERF_AMT1_NTS: gfnma_nvl(item.BOOK_PERF_AMT1_NTS),
                            BOOK_PERF_AMT1_ETC: gfnma_nvl(item.BOOK_PERF_AMT1_ETC),
                            BOOK_PERF_AMT2_NTS: gfnma_nvl(item.BOOK_PERF_AMT2_NTS),
                            BOOK_PERF_AMT2_ETC: gfnma_nvl(item.BOOK_PERF_AMT2_ETC),
                            CD_BOOK_PERF_AMT_NTS: gfnma_nvl(item.CD_BOOK_PERF_AMT_NTS),
                            CD_BOOK_PERF_AMT_ETC: gfnma_nvl(item.CD_BOOK_PERF_AMT_ETC),
                            CD_BOOK_PERF_AMT1_NTS: gfnma_nvl(item.CD_BOOK_PERF_AMT1_NTS),
                            CD_BOOK_PERF_AMT1_ETC: gfnma_nvl(item.CD_BOOK_PERF_AMT1_ETC),
                            CD_BOOK_PERF_AMT2_NTS: gfnma_nvl(item.CD_BOOK_PERF_AMT2_NTS),
                            CD_BOOK_PERF_AMT2_ETC: gfnma_nvl(item.CD_BOOK_PERF_AMT2_ETC),
                            CHKCD_BOOK_PERF_AMT_NTS: gfnma_nvl(item.CHKCD_BOOK_PERF_AMT_NTS),
                            CHKCD_BOOK_PERF_AMT_ETC: gfnma_nvl(item.CHKCD_BOOK_PERF_AMT_ETC),
                            CHKCD_BOOK_PERF_AMT1_NTS: gfnma_nvl(item.CHKCD_BOOK_PERF_AMT1_NTS),
                            CHKCD_BOOK_PERF_AMT1_ETC: gfnma_nvl(item.CHKCD_BOOK_PERF_AMT1_ETC),
                            CHKCD_BOOK_PERF_AMT2_NTS: gfnma_nvl(item.CHKCD_BOOK_PERF_AMT2_NTS),
                            CHKCD_BOOK_PERF_AMT2_ETC: gfnma_nvl(item.CHKCD_BOOK_PERF_AMT2_ETC),
                            CASH_BOOK_PERF_AMT_NTS: gfnma_nvl(item.CASH_BOOK_PERF_AMT_NTS),
                            CASH_BOOK_PERF_AMT1_NTS: gfnma_nvl(item.CASH_BOOK_PERF_AMT1_NTS),
                            CASH_BOOK_PERF_AMT2_NTS: gfnma_nvl(item.CASH_BOOK_PERF_AMT2_NTS),
                            CD_USE_PREV_AMT_NTS: gfnma_nvl(item.CD_USE_PREV_AMT_NTS),
                            CD_USE_PREV_AMT_ETC: gfnma_nvl(item.CD_USE_PREV_AMT_ETC),
                            CD_USE_THIS_AMT_NTS: gfnma_nvl(item.CD_USE_THIS_AMT_NTS),
                            CD_USE_THIS_AMT_ETC: gfnma_nvl(item.CD_USE_THIS_AMT_ETC),
                            TDMK_PREV_AMT_NTS: gfnma_nvl(item.TDMK_PREV_AMT_NTS),
                            TDMK_PREV_AMT_ETC: gfnma_nvl(item.TDMK_PREV_AMT_ETC),
                            TDMK_THIS_AMT_NTS: gfnma_nvl(item.TDMK_THIS_AMT_NTS),
                            TDMK_THIS_AMT_ETC: gfnma_nvl(item.TDMK_THIS_AMT_ETC),
                            DON_AMT_NTS: gfnma_nvl(item.DON_AMT_NTS),
                            DON_AMT_ETC: gfnma_nvl(item.DON_AMT_ETC),
                            MED_INFERTILITY_AMT: gfnma_nvl(item.MED_INFERTILITY_AMT),
                            POSTPARTUM_CARE_CENTER_AMT: gfnma_nvl(item.POSTPARTUM_CARE_CENTER_AMT),
                            LOSS_MEDICAL_INSURANCE_AMT: gfnma_nvl(item.LOSS_MEDICAL_INSURANCE_AMT),
                            PREEMIE_BABY_AMT: gfnma_nvl(item.PREEMIE_BABY_AMT),
                            EDU_SCH_UNIFORM_AMT_NTS: gfnma_nvl(item.EDU_SCH_UNIFORM_AMT_NTS),
                            EDU_SCH_UNIFORM_AMT_ETC: gfnma_nvl(item.EDU_SCH_UNIFORM_AMT_ETC),
                            EDU_EXP_TRAINING_AMT_NTS: gfnma_nvl(item.EDU_EXP_TRAINING_AMT_NTS),
                            EDU_EXP_TRAINING_AMT_ETC: gfnma_nvl(item.EDU_EXP_TRAINING_AMT_ETC),
                            EDU_EXP_SAT_PAY_AMT_NTS: gfnma_nvl(item.EDU_EXP_SAT_PAY_AMT_NTS),
                            EDU_EXP_SAT_PAY_AMT_ETC: gfnma_nvl(item.EDU_EXP_SAT_PAY_AMT_ETC),
                            FAMILY_CHILD_SEQ_TYPE: gfnma_nvl(item.FAMILY_CHILD_SEQ_TYPE),
                            MED_SENIOR_HDCP_AMT_NTS: gfnma_nvl(item.MED_SENIOR_HDCP_AMT_NTS),
                            MED_SENIOR_HDCP_AMT_ETC: gfnma_nvl(item.MED_SENIOR_HDCP_AMT_ETC),
                            FAMILY_65AGE_HDC_YN: gfnma_nvl(item.FAMILY_65AGE_HDC_YN),
                            MED_SENIOR_HDCP_AMT_NTS: gfnma_nvl(item.MED_SENIOR_HDCP_AMT_NTS),
                            MED_SENIOR_HDCP_AMT_ETC: gfnma_nvl(item.MED_SENIOR_HDCP_AMT_ETC),
                            FAMILY_50AGE_YN: gfnma_nvl(item.FAMILY_50AGE_YN),
                            R101_BUSNID: gfnma_nvl(item.R101_BUSNID),
                            R101_TRADE_NM: gfnma_nvl(item.R101_TRADE_NM),
                            R101_PWD_CD: gfnma_nvl(item.R101_PWD_CD),
                            DATA_SOURCE: gfnma_nvl(item.DATA_SOURCE),

                        }
                        jsonList.push(msg);
                    });

                    gvwListGrid.rebuild();

                    data.cv_1.forEach((item, index) => {

                        //- 연금보험료
                        SBUxMethod.set("PENS_AMT", 	item.PENS_AMT );
                        SBUxMethod.set("OFFICIAL_PENS_AMT", 	item.OFFICIAL_PENS_AMT );
                        SBUxMethod.set("MILITARY_PENS_AMT", 	item.MILITARY_PENS_AMT );
                        SBUxMethod.set("SCHOOL_PENS_AMT", 	item.SCHOOL_PENS_AMT );
                        SBUxMethod.set("POST_PENS_AMT", 	item.POST_PENS_AMT );
                        //-- 보험료
                        SBUxMethod.set("HEALTH_INSURE_AMT", 	item.HEALTH_INSURE_AMT );
                        SBUxMethod.set("SENIOR_HEALTH_INSURE_AMT", 	item.SENIOR_HEALTH_INSURE_AMT );
                        SBUxMethod.set("EMP_INSURE_AMT", 	item.EMP_INSURE_AMT );
                        //- 주택자금
                        SBUxMethod.set("HSRENT_PRIN_ORG_AMT", 	item.HSRENT_PRIN_ORG_AMT );
                        SBUxMethod.set("HSRENT_PRIN_PERS_AMT", 	item.HSRENT_PRIN_PERS_AMT );
                        SBUxMethod.set("HS_MM_RENT_AMT", 	item.HS_MM_RENT_AMT );
                        SBUxMethod.set("HS_INT_AMT1", 	item.HS_INT_AMT1 );
                        SBUxMethod.set("HS_INT_AMT2", 	item.HS_INT_AMT2 );
                        SBUxMethod.set("HS_INT_AMT3", 	item.HS_INT_AMT3 );
                        SBUxMethod.set("HS_INT_AMT4", 	item.HS_INT_AMT4 );
                        SBUxMethod.set("HS_INT_AMT5", 	item.HS_INT_AMT5 );
                        //--주택자금 2015년 추가
                        SBUxMethod.set("HS_INT_AMT6", 	item.HS_INT_AMT6 );
                        SBUxMethod.set("HS_INT_AMT7", 	item.HS_INT_AMT7 );
                        SBUxMethod.set("HS_INT_AMT8", 	item.HS_INT_AMT8 );
                        SBUxMethod.set("HS_INT_AMT9", 	item.HS_INT_AMT9 );
                        //-- 그밖의 소득공제
                        SBUxMethod.set("PRIV_PENS_SV_AMT", 	item.PRIV_PENS_SV_AMT );
                        SBUxMethod.set("SM_COM_AMT", 	item.SM_COM_AMT );
                        SBUxMethod.set("SM_COM_AMT_DED_JOIN_DAT", 	item.SM_COM_AMT_DED_JOIN_DAT );
                        SBUxMethod.set("SM_COM_AMT_TGT_P_END_DAT", 	item.SM_COM_AMT_TGT_P_END_DAT );
                        SBUxMethod.set("SM_COM_RULE_YN", 	item.SM_COM_RULE_YN );
                        //-- 주택마련저축
                        SBUxMethod.set("HS_SUBS_SV_AMT", 	item.HS_SUBS_SV_AMT );
                        SBUxMethod.set("HS_EMP_SV_AMT", 	item.HS_EMP_SV_AMT );
                        SBUxMethod.set("HS_TOT_SV_AMT", 	item.HS_TOT_SV_AMT );
                        //- 투자조합 출자 등
                        SBUxMethod.set("INVEST_AMT1", 	item.INVEST_AMT1 );
                        SBUxMethod.set("INVEST_AMT2", 	item.INVEST_AMT2 );
                        SBUxMethod.set("INVEST_AMT3", 	item.INVEST_AMT3 );
                        SBUxMethod.set("INVEST_AMT4", 	item.INVEST_AMT4 );
                        SBUxMethod.set("INVEST_PREV2_AMT_1", 	item.INVEST_PREV2_AMT_1 );
                        SBUxMethod.set("INVEST_PREV2_AMT_2", 	item.INVEST_PREV2_AMT_2 );
                        SBUxMethod.set("INVEST_PREV2_AMT_3", 	item.INVEST_PREV2_AMT_3 );
                        SBUxMethod.set("INVEST_PREV_AMT_1", 	item.INVEST_PREV_AMT_1 );
                        SBUxMethod.set("INVEST_PREV_AMT_2", 	item.INVEST_PREV_AMT_2 );
                        SBUxMethod.set("INVEST_PREV_AMT_3", 	item.INVEST_PREV_AMT_3 );
                        SBUxMethod.set("INVEST_THIS_AMT_1", 	item.INVEST_THIS_AMT_1 );
                        SBUxMethod.set("INVEST_THIS_AMT_2", 	item.INVEST_THIS_AMT_2 );
                        SBUxMethod.set("INVEST_THIS_AMT_3", 	item.INVEST_THIS_AMT_3 );
                        //-- 신용카드 등 사용액
                        SBUxMethod.set("CD_USE_BEF_AMT", 	item.CD_USE_BEF_AMT );
                        SBUxMethod.set("CHKCD_USE_BEF_AMT", 	item.CHKCD_USE_BEF_AMT );
                        SBUxMethod.set("CASH_RECEIPT_BEF_AMT", 	item.CASH_RECEIPT_BEF_AMT );
                        SBUxMethod.set("TDMK_USE_BEF_AMT", 	item.TDMK_USE_BEF_AMT );
                        SBUxMethod.set("PBTRN_USE_BEF_AMT", 	item.PBTRN_USE_BEF_AMT );
                        //--2015년 추가
                        SBUxMethod.set("CD_USE_BEF_AMT2", 	item.CD_USE_BEF_AMT2 );
                        SBUxMethod.set("CHKCD_USE_BEF_AMT2", 	item.CHKCD_USE_BEF_AMT2 );
                        SBUxMethod.set("CASH_RECEIPT_BEF_AMT2", 	item.CASH_RECEIPT_BEF_AMT2 );
                        SBUxMethod.set("TDMK_USE_BEF_AMT2", 	item.TDMK_USE_BEF_AMT2 );
                        SBUxMethod.set("PBTRN_USE_BEF_AMT2", 	item.PBTRN_USE_BEF_AMT2 );
                        SBUxMethod.set("CD_USE_AMT", 	item.CD_USE_AMT );
                        SBUxMethod.set("CHKCD_USE_AMT", 	item.CHKCD_USE_AMT );
                        SBUxMethod.set("CASH_RECEIPT_AMT", 	item.CASH_RECEIPT_AMT );
                        SBUxMethod.set("TDMK_USE_AMT", 	item.TDMK_USE_AMT );
                        SBUxMethod.set("TDMK_USE_AMT1", 	item.TDMK_USE_AMT1 );
                        SBUxMethod.set("TDMK_USE_AMT2", 	item.TDMK_USE_AMT2 );
                        SBUxMethod.set("PBTRN_USE_AMT", 	item.PBTRN_USE_AMT );
                        SBUxMethod.set("PBTRN_USE_A_AMT", 	item.PBTRN_USE_A_AMT );
                        SBUxMethod.set("PBTRN_USE_B_AMT", 	item.PBTRN_USE_B_AMT );
                        SBUxMethod.set("BOOK_PERF_USE_AMT", 	item.BOOK_PERF_USE_AMT );
                        SBUxMethod.set("BOOK_PERF_USE_AMT1", 	item.BOOK_PERF_USE_AMT1 );
                        SBUxMethod.set("BOOK_PERF_USE_AMT2", 	item.BOOK_PERF_USE_AMT2 );
                        SBUxMethod.set("CD_BOOK_PERF_USE_AMT", 	item.CD_BOOK_PERF_USE_AMT );
                        SBUxMethod.set("CD_BOOK_PERF_USE_AMT1", 	item.CD_BOOK_PERF_USE_AMT1 );
                        SBUxMethod.set("CD_BOOK_PERF_USE_AMT2", 	item.CD_BOOK_PERF_USE_AMT2 );
                        SBUxMethod.set("CHKCD_BOOK_PERF_USE_AMT", 	item.CHKCD_BOOK_PERF_USE_AMT );
                        SBUxMethod.set("CHKCD_BOOK_PERF_USE_AMT1", 	item.CHKCD_BOOK_PERF_USE_AMT1 );
                        SBUxMethod.set("CHKCD_BOOK_PERF_USE_AMT2", 	item.CHKCD_BOOK_PERF_USE_AMT2 );
                        SBUxMethod.set("CASH_BOOK_PERF_USE_AMT", 	item.CASH_BOOK_PERF_USE_AMT );
                        SBUxMethod.set("CASH_BOOK_PERF_USE_AMT1", 	item.CASH_BOOK_PERF_USE_AMT1 );
                        SBUxMethod.set("CASH_BOOK_PERF_USE_AMT2", 	item.CASH_BOOK_PERF_USE_AMT2 );
                        SBUxMethod.set("CARD_PREV_YEAR_USE_AMT", 	item.CARD_PREV_YEAR_USE_AMT );
                        SBUxMethod.set("CARD_THIS_YEAR_USE_AMT", 	item.CARD_THIS_YEAR_USE_AMT );
                        SBUxMethod.set("TDMK_PREV_AMT", 	item.TDMK_PREV_AMT );
                        SBUxMethod.set("TDMK_THIS_AMT", 	item.TDMK_THIS_AMT );
                        SBUxMethod.set("PERSONAL_CD_USE_AMT", 	item.PERSONAL_CD_USE_AMT );
                        SBUxMethod.set("CD_USE_HALF_AMT", 	item.CD_USE_HALF_AMT );
                        SBUxMethod.set("CD_USE_HALF_AMT2", 	item.CD_USE_HALF_AMT2 );
                        SBUxMethod.set("CARD_BIZ_REL_AMT", 	item.CARD_BIZ_REL_AMT );
                        SBUxMethod.set("CHK_CD_BIZ_REL_AMT", 	item.CHK_CD_BIZ_REL_AMT );
                        SBUxMethod.set("EMP_STOCK_GIVE_AMT", 	item.EMP_STOCK_GIVE_AMT );
                        SBUxMethod.set("EMP_STOCK_DON_AMT", 	item.EMP_STOCK_DON_AMT );
                        SBUxMethod.set("SALARY_DECREASE_AMT", 	item.SALARY_DECREASE_AMT );
                        //SBUxMethod.set("LT_INV_ST_SAV_AMT", 	item.LEASE_INT-RDM_AMT );
                        SBUxMethod.set("LT_INV_ST_SAV_AMT", 	item.LT_INV_ST_SAV_AMT );
                        SBUxMethod.set("LT_COL_INV_SV_AMT", 	item.LT_COL_INV_SV_AMT );
                        // -- 세액감면
                        SBUxMethod.set("FOREI_VISIT_PURP", 	item.FOREI_VISIT_PURP );
                        SBUxMethod.set("TECH_INTRO_CONTRACT_DAT", 	item.TECH_INTRO_CONTRACT_DAT );
                        SBUxMethod.set("TECH_INTRO_RED_END_DAT", 	item.TECH_INTRO_RED_END_DAT );
                        SBUxMethod.set("FOREI_INC_RED_RECV_DAT", 	item.FOREI_INC_RED_RECV_DAT );
                        SBUxMethod.set("FOREI_INC_RED_SUBMIT_DAT", 	item.FOREI_INC_RED_SUBMIT_DAT );
                        SBUxMethod.set("TX_TREATY_RED_RECV_DAT", 	item.TX_TREATY_RED_RECV_DAT );
                        SBUxMethod.set("TX_TREATY_RED_SUBMIT_DAT", 	item.TX_TREATY_RED_SUBMIT_DAT );
                        SBUxMethod.set("EMP_YOUTH_ST_DAT", 	item.EMP_YOUTH_ST_DAT );
                        SBUxMethod.set("EMP_YOUTH_RED_END_DAT", 	item.EMP_YOUTH_RED_END_DAT );
                        //-- 세액공제
                        //-- 연금계좌
                        SBUxMethod.set("SCNT_PENS_TX_DEAMT", 	item.SCNT_PENS_TX_DEAMT );
                        SBUxMethod.set("RET_PENS_TX_DEAMT", 	item.RET_PENS_TX_DEAMT );
                        SBUxMethod.set("PENS_SV_TX_DEAMT", 	item.PENS_SV_TX_DEAMT );
                        //--2021년 ISA
                        SBUxMethod.set("PENS_ISA_TX_DEAMT", 	item.PENS_ISA_TX_DEAMT );
                        //-- 특별세액공제
                        SBUxMethod.set("GENERAL_INSURE_TX_DEAMT", 	item.GENERAL_INSURE_TX_DEAMT );
                        SBUxMethod.set("HDCP_INSURE_TX_DEAMT", 	item.HDCP_INSURE_TX_DEAMT );
                        SBUxMethod.set("PERSONAL_MED_TX_DEAMT", 	item.PERSONAL_MED_TX_DEAMT );
                        SBUxMethod.set("SENIOR_MED_TX_DEAMT", 	item.SENIOR_MED_TX_DEAMT );
                        SBUxMethod.set("HDCP_MED_TX_DEAMT", 	item.HDCP_MED_TX_DEAMT );
                        SBUxMethod.set("EXCP_MED_TX_DEAMT", 	item.EXCP_MED_TX_DEAMT );
                        SBUxMethod.set("INFTY_MED_TX_DEAMT", 	item.INFTY_MED_TX_DEAMT );
                        SBUxMethod.set("POSTPARTUM_CARE_CENTER_AMT", 	item.POSTPARTUM_CARE_CENTER_AMT );
                        SBUxMethod.set("LOSS_MEDICAL_INSURANCE_AMT", 	item.LOSS_MEDICAL_INSURANCE_AMT );
                        SBUxMethod.set("LOSS_MED_INSUR_EXEC_AMT", 	item.LOSS_MED_INSUR_EXEC_AMT );
                        SBUxMethod.set("LOSS_MED_INSUR_ME_AMT", 	item.LOSS_MED_INSUR_ME_AMT );
                        SBUxMethod.set("PERSONAL_EDU_TX_DEAMT", 	item.PERSONAL_EDU_TX_DEAMT );
                        SBUxMethod.set("PRESCHOOL_EDU_TAX_DED_COUNT", 	item.PRESCHOOL_EDU_TAX_DED_COUNT );
                        SBUxMethod.set("PRESCHOOL_EDU_TX_DEAMT", 	item.PRESCHOOL_EDU_TX_DEAMT );
                        SBUxMethod.set("SCHOOL_EDU_TAX_DED_COUNT", 	item.SCHOOL_EDU_TAX_DED_COUNT );
                        SBUxMethod.set("SCHOOL_EDU_TX_DEAMT", 	item.SCHOOL_EDU_TX_DEAMT );
                        SBUxMethod.set("UNIVERSITY_EDU_TAX_DED_COUNT", 	item.UNIVERSITY_EDU_TAX_DED_COUNT );
                        SBUxMethod.set("UNIVERSITY_EDU_TX_DEAMT", 	item.UNIVERSITY_EDU_TX_DEAMT );
                        SBUxMethod.set("HANDICAP_EDU_TAX_DED_COUNT", 	item.HANDICAP_EDU_TAX_DED_COUNT );
                        SBUxMethod.set("HDCP_EDU_TX_DEAMT", 	item.HDCP_EDU_TX_DEAMT );
                        SBUxMethod.set("DON_POL_TX_DEAMT", 	item.DON_POL_TX_DEAMT );
                        SBUxMethod.set("DON_LGL_TX_DEAMT", 	item.DON_LGL_TX_DEAMT );
                        SBUxMethod.set("DON_EMP_STOCK_TX_DEAMT", 	item.DON_EMP_STOCK_TX_DEAMT );
                        SBUxMethod.set("DON_OUT_OF_REL_TX_DEAMT", 	item.DON_OUT_OF_REL_TX_DEAMT );
                        SBUxMethod.set("DON_REL_TX_DEAMT", 	item.DON_REL_TX_DEAMT );
                        //-- 외국납부세액
                        SBUxMethod.set("FOREI_INC_AMT", 	item.FOREI_INC_AMT );
                        SBUxMethod.set("FOREI_PAY_TX_FOREI_AMT", 	item.FOREI_PAY_TX_FOREI_AMT );
                        SBUxMethod.set("FOREI_PAY_TX_WON_AMT", 	item.FOREI_PAY_TX_WON_AMT );
                        SBUxMethod.set("FOREI_PAY_TX_NATION_NAME", 	item.FOREI_PAY_TX_NATION_NAME );
                        SBUxMethod.set("FOREI_PAY_TX_DAT", 	item.FOREI_PAY_TX_DAT );
                        SBUxMethod.set("FOREI_REQ_SUBMIT_DAT", 	item.FOREI_REQ_SUBMIT_DAT );
                        SBUxMethod.set("FOREI_COM_NAME", 	item.FOREI_COM_NAME );
                        SBUxMethod.set("FOREI_DUTY_NAME", 	item.FOREI_DUTY_NAME );
                        SBUxMethod.set("FOREI_WORK_ST_DAT", 	item.FOREI_WORK_ST_DAT );
                        SBUxMethod.set("FOREI_WORK_END_DAT", 	item.FOREI_WORK_END_DAT );
                        SBUxMethod.set("HSRENT_INT_TX_DEAMT", 	item.HSRENT_INT_TX_DEAMT );
                        SBUxMethod.set("HS_MM_RENT_TX_DEAMT", 	item.HS_MM_RENT_TX_DEAMT );
                    });

                    //  -- 연금·저축 등 소득공제명세
                    jsonPensionSavingList.length = 0;
                    data.cv_4.forEach((item, index) => {
                        const msg = {
                            PENS_SEQ                : gfnma_nvl(item.PENS_SEQ),
                            PENS_DED_TYPE           : gfnma_nvl(item.PENS_DED_TYPE),
                            PENS_BANK_CODE          : gfnma_nvl(item.PENS_BANK_CODE),
                            PENSION_BANK_NAME       : gfnma_nvl(item.PENSION_BANK_NAME),
                            PENS_ACC                : gfnma_nvl(item.PENS_ACC),
                            PENSION_ACCOUNT_REAL    : gfnma_nvl(item.PENSION_ACCOUNT_REAL),
                            PENS_PAY_AMT            : gfnma_nvl(item.PENS_PAY_AMT),
                            PENS_DEAMT              : gfnma_nvl(item.PENS_DEAMT),
                            PENS_JOIN_DAT           : gfnma_nvl(item.PENS_JOIN_DAT),
                            INVESTMENT_YYYY         : gfnma_nvl(item.INVESTMENT_YYYY),
                            INVESTMENT_TYPE         : gfnma_nvl(item.INVESTMENT_TYPE),
                            ISA_ANN_TOT_AMT         : gfnma_nvl(item.ISA_ANN_TOT_AMT),
                            ISA_TAX_YEAR_AMT        : gfnma_nvl(item.ISA_TAX_YEAR_AMT),
                            ISA_DDCT_BS_ASS_AMT     : gfnma_nvl(item.ISA_DDCT_BS_ASS_AMT),
                            PENS_CTR_TERM_MM_CNT    : gfnma_nvl(item.PENS_CTR_TERM_MM_CNT),

                        }
                        jsonPensionSavingList.push(msg);

                    });

                    gvwPensionSavingGrid.rebuild();


                    // -- 월세액·거주자간 주택임차차입금 원리금 상환액 소득공제명세
                    jsonHouseMonthlyList.length = 0;
                    data.cv_5.forEach((item, index) => {
                        const msg = {
                            HS_MM_SEQ                       : gfnma_nvl(item.HS_MM_SEQ),
                            HS_MM_LESSOR_NAME               : gfnma_nvl(item.HS_MM_LESSOR_NAME),
                            HS_MM_LESSOR_SOCNO              : gfnma_nvl(item.HS_MM_LESSOR_SOCNO),
                            HS_MM_LESSOR_SOCNO_REAL         : gfnma_nvl(item.HS_MM_LESSOR_SOCNO_REAL),
                            HS_MM_RENT_TYPE                 : gfnma_nvl(item.HS_MM_RENT_TYPE),
                            HS_MM_RENT_AREA                 : gfnma_nvl(item.HS_MM_RENT_AREA),
                            HS_MM_LEASE_ADDRESS             : gfnma_nvl(item.HS_MM_LEASE_ADDRESS),
                            HS_MM_ST_DAT                    : gfnma_nvl(item.HS_MM_ST_DAT),
                            HS_MM_END_DAT                   : gfnma_nvl(item.HS_MM_END_DAT),
                            HS_MM_RENT_AMT                  : gfnma_nvl(item.HS_MM_RENT_AMT),
                            HSRENT_RDM_LEN_NAME             : gfnma_nvl(item.HSRENT_RDM_LEN_NAME),
                            HSRENT_RDM_LEN_SOCNO            : gfnma_nvl(item.HSRENT_RDM_LEN_SOCNO),
                            HSRENT_RDM_LEN_SOCNO_REAL       : gfnma_nvl(item.HSRENT_RDM_LEN_SOCNO_REAL),
                            HSRENT_RDM_SPD_ST_DAT           : gfnma_nvl(item.HSRENT_RDM_SPD_ST_DAT),
                            HSRENT_RDM_SPD_END_DAT          : gfnma_nvl(item.HSRENT_RDM_SPD_END_DAT),
                            HSRENT_RDM_INT_R                : gfnma_nvl(item.HSRENT_RDM_INT_R),
                            HSRENT_RDM_PRIN_AMT             : gfnma_nvl(item.HSRENT_RDM_PRIN_AMT),
                            HSRENT_RDM_INT_AMT              : gfnma_nvl(item.HSRENT_RDM_INT_AMT),
                            HSRENT_RDM_LESSOR_NAME          : gfnma_nvl(item.HSRENT_RDM_LESSOR_NAME),
                            HSRENT_RDM_LESSOR_SOCNO         : gfnma_nvl(item.HSRENT_RDM_LESSOR_SOCNO),
                            HSRENT_RDM_LESSOR_SOCNO_REAL    : gfnma_nvl(item.HSRENT_RDM_LESSOR_SOCNO_REAL),
                            HSRENT_RDM_LEASE_TYPE           : gfnma_nvl(item.HSRENT_RDM_LEASE_TYPE),
                            HSRENT_RDM_LEASE_AREA           : gfnma_nvl(item.HSRENT_RDM_LEASE_AREA),
                            HSRENT_RDM_LEASE_ADDRESS        : gfnma_nvl(item.HSRENT_RDM_LEASE_ADDRESS),
                            HSRENT_RDM_LEASE_ST_DAT         : gfnma_nvl(item.HSRENT_RDM_LEASE_ST_DAT),
                            HSRENT_RDM_LEASE_END_DAT        : gfnma_nvl(item.HSRENT_RDM_LEASE_END_DAT),
                            HSRENT_RDM_LEASE_DEP_AMT        : gfnma_nvl(item.HSRENT_RDM_LEASE_DEP_AMT),

                        }
                        jsonHouseMonthlyList.push(msg);

                    });

                    gvwHouseMonthlyGrid.rebuild();



                    //-- 의료비
                    jsonMedExpenseList.length = 0;
                    data.cv_6.forEach((item, index) => {
                        const msg = {
                            MED_SEQ                     : gfnma_nvl(item.MED_SEQ),
                            MED_SOCNO                   : gfnma_nvl(item.MED_SOCNO),
                            MED_SOCIAL_NO_REAL          : gfnma_nvl(item.MED_SOCIAL_NO_REAL),
                            MED_COM_NUM                 : gfnma_nvl(item.MED_COM_NUM),
                            MED_NAME                    : gfnma_nvl(item.MED_NAME),
                            MED_CERTIFICATE_CODE        : gfnma_nvl(item.MED_CERTIFICATE_CODE),
                            MED_COUNT                   : gfnma_nvl(item.MED_COUNT),
                            MED_EXP_AMT                 : gfnma_nvl(item.MED_EXP_AMT),
                            MED_INFTY_TREATMENT_YN      : gfnma_nvl(item.MED_INFTY_TREATMENT_YN),
                            EYEGLASS_PUR_COST_YN        : gfnma_nvl(item.EYEGLASS_PUR_COST_YN),
                            POSTPARTUM_CARE_CENTER_YN   : gfnma_nvl(item.POSTPARTUM_CARE_CENTER_YN),
                            LOSS_MEDICAL_INSURANCE_YN   : gfnma_nvl(item.LOSS_MEDICAL_INSURANCE_YN),
                            PREEMIE_BABY_YN             : gfnma_nvl(item.PREEMIE_BABY_YN),
                            //  --2020년 연말정산
                            MED_ACC_NO                  : gfnma_nvl(item.MED_ACC_NO),
                            MED_GOODS_NM                : gfnma_nvl(item.MED_GOODS_NM),
                            MED_INSU_RESID              : gfnma_nvl(item.MED_INSU_RESID),
                            MED_INSU_NM                 : gfnma_nvl(item.MED_INSU_NM),
                        }
                        jsonMedExpenseList.push(msg);

                    });

                    gvwMedExpenseGrid.rebuild();

                    //  -- 기부금
                    jsonDonationList.length = 0;
                    data.cv_7.forEach((item, index) => {
                        const msg = {
                            DON_SEQ                     : gfnma_nvl(item.DON_SEQ),
                            DON_SOCNO                   : gfnma_nvl(item.DON_SOCNO),
                            DONATION_SOCIAL_NO_REAL     : gfnma_nvl(item.DONATION_SOCIAL_NO_REAL),
                            DON_YE_TX_REL               : gfnma_nvl(item.DON_YE_TX_REL),
                            DON_TYPE_NTS_YN             : gfnma_nvl(item.DON_TYPE_NTS_YN),
                            DON_TYPE                    : gfnma_nvl(item.DON_TYPE),
                            DON_COM_NUM                 : gfnma_nvl(item.DON_COM_NUM),
                            DON_NAME                    : gfnma_nvl(item.DON_NAME),
                            DON_COUNT                   : gfnma_nvl(item.DON_COUNT),
                            DON_AMT                     : gfnma_nvl(item.DON_AMT),
                            DED_TGT_DON_AMT             : gfnma_nvl(item.DED_TGT_DON_AMT),
                            DON_INCENTIVES_APPLY_AMT    : gfnma_nvl(item.DON_INCENTIVES_APPLY_AMT),
                        }
                        jsonDonationList.push(msg);

                    });

                    gvwDonationGrid.rebuild();


                    // -- 기부금 이월(전년도이월)
                    jsonAdjustList.length = 0;
                    data.cv_8.forEach((item, index) => {
                        const msg = {
                            DON_YYYY                    : gfnma_nvl(item.DON_YYYY),
                            DON_TYPE                    : gfnma_nvl(item.DON_TYPE),
                            DON_AMT                     : gfnma_nvl(item.DON_AMT),
                            DON_ADJ_LAST_YEAR_DEAMT     : gfnma_nvl(item.DON_ADJ_LAST_YEAR_DEAMT),
                            DON_ADJ_TGT_DEAMT           : gfnma_nvl(item.DON_ADJ_TGT_DEAMT),
                            DON_ADJ_CURR_YEAR_DEAMT     : gfnma_nvl(item.DON_ADJ_CURR_YEAR_DEAMT),
                            DON_ADJ_DESTROY_AMT         : gfnma_nvl(item.DON_ADJ_DESTROY_AMT),
                            DON_ADJ_TRANSFER_AMT        : gfnma_nvl(item.DON_ADJ_TRANSFER_AMT),

                        }
                        jsonAdjustList.push(msg);

                    });

                    gvwAdjustGrid.rebuild();

                    // -- 기부금 이월(전년도이월)
                    jsonAdjust2List.length = 0;
                    data.cv_9.forEach((item, index) => {
                        const msg = {
                            DON_YYYY                    : gfnma_nvl(item.DON_YYYY),
                            DON_TYPE                    : gfnma_nvl(item.DON_TYPE),
                            DON_AMT                     : gfnma_nvl(item.DON_AMT),
                            DON_ADJ_LAST_YEAR_DEAMT     : gfnma_nvl(item.DON_ADJ_LAST_YEAR_DEAMT),
                            DON_ADJ_TGT_DEAMT           : gfnma_nvl(item.DON_ADJ_TGT_DEAMT),
                            DON_ADJ_CURR_YEAR_DEAMT     : gfnma_nvl(item.DON_ADJ_CURR_YEAR_DEAMT),
                            DON_ADJ_DESTROY_AMT         : gfnma_nvl(item.DON_ADJ_DESTROY_AMT),
                            DON_ADJ_TRANSFER_AMT        : gfnma_nvl(item.DON_ADJ_TRANSFER_AMT),

                        }
                        jsonAdjust2List.push(msg);

                    });

                    gvwAdjust2Grid.rebuild();


                    // -- 기부금 이월(전년도이월)
                    jsonInsureList.length = 0;
                    data.cv_10.forEach((item, index) => {
                        const msg = {
                            INSURE_SEQ              : gfnma_nvl(item.INSURE_SEQ),
                            INSURE_SOCNO            : gfnma_nvl(item.INSURE_SOCNO),
                            INSURE_SOCIAL_NO_REAL   : gfnma_nvl(item.INSURE_SOCIAL_NO_REAL),
                            INSURE_COM_NUM          : gfnma_nvl(item.INSURE_COM_NUM),
                            INSURE_NAME             : gfnma_nvl(item.INSURE_NAME),
                            INSURE_TYPE             : gfnma_nvl(item.INSURE_TYPE),
                            INSURE_NO               : gfnma_nvl(item.INSURE_NO),
                            INSURE_COUNT            : gfnma_nvl(item.INSURE_COUNT),
                            INSURE_AMT              : gfnma_nvl(item.INSURE_AMT),
                            AAAAAAAAAAAA            : gfnma_nvl(item.DON_YYYY),
                            AAAAAAAAAAAA            : gfnma_nvl(item.DON_YYYY),

                        }
                        jsonInsureList.push(msg);

                    });

                    gvwInsureGrid.rebuild();


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

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
