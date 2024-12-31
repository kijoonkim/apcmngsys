<%
    /**
     * @Class Name        : hra1200.jsp
     * @Description       : 연간소득내역집계 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.07.25
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.25   	표주완		최초 생성
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
    <title>title : 연간소득내역집계</title>
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
                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="집    계" class="btn btn-sm btn-outline-danger"
                             onclick="fn_btnCreate"></sbux-button>
                <sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="집계취소" class="btn btn-sm btn-outline-danger"
                             onclick="fn_btnDelete"></sbux-button>
                <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="집계확정" class="btn btn-sm btn-outline-danger"
                             onclick="fn_btnConfirm"></sbux-button>
                <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="확정취소" class="btn btn-sm btn-outline-danger"
                             onclick="fn_btnCancel"></sbux-button>
                <sbux-button id="btnReCreate" name="btnReCreate" uitype="normal" text="재집계" class="btn btn-sm btn-outline-danger"
                             onclick="fn_btnReCreate"></sbux-button>
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
                                style="width: 95%;"
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
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">부서</th>
                    <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                        <sbux-input
                                uitype="text"
                                id="SRCH_DEPT_CODE"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right: hidden;" data-group="DEPT">
                        <sbux-input
                        <%-- uitype="hidden"--%>
                                uitype="text"
                                id="SRCH_DEPT_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td <%--colspan="2"--%> class="td_input" data-group="DEPT">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup1"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg_search">사원</th>
                    <td class="td_input" style="border-right: hidden;" data-group="EMP">
                        <sbux-input
                                uitype="text"
                                id="SRCH_EMP_CODE"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right: hidden;" data-group="EMP">
                        <sbux-input
                        <%-- uitype="hidden"--%>
                                uitype="text"
                                id="SRCH_EMP_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td class="td_input" style="border-right: hidden;" data-group="EMP">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup2"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg_search">퇴사일</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_DATE_FR"
                                name="SRCH_DATE_FR"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="table-datepicker-ma"
                        ></sbux-datepicker>
                    </td>
                    <td>~</td>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_DATE_TO"
                                name="SRCH_DATE_TO"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="table-datepicker-ma">
                        </sbux-datepicker>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">퇴직년월</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_RETIRE_MONTH"
                                name="SRCH_RETIRE_MONTH"
                                uitype="popup"
                                datepicker-mode="month"
                                date-format="yyyy-mm"
                                class="table-datepicker-ma"
                                required>
                            <%--onchange="fn_payDate"--%>
                        </sbux-datepicker>
                    </td>
                    <td colspan="3" style="border-right: hidden;"></td>
                </tr>
                <tr>
                    <td class="td_input" style="border-right: hidden; display: none">
                        <sbux-checkbox
                                id="SRCH_UPDATE_YN"
                                name="SRCH_UPDATE_YN"
                                uitype="normal"
                                text="확정여부"
                                true-value="Y"
                                false-value="N"
                        ></sbux-checkbox>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="row">
            <div class="col-sm-4">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>사원정보</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwEmpList" style="height:800px; width:100%;"></div>
                </div>
            </div>


            <div class="col-sm-8">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>인적사항</span></li>
                    </ul>
                </div>
                <div>
                    <table id="dataArea2" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:4%">
                            <col style="width:4%">
                            <col style="width:4%">
                            <col style="width:2%">

                            <col style="width:4%">
                            <col style="width:5%">
                            <col style="width:2%">
                            <%-- <col style="width:2%">--%>

                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">정산연도</th>
                            <td class="td_input">
                                <sbux-datepicker
                                        id="YE_TX_YYYY"
                                        name="YE_TX_YYYY"
                                        uitype="popup"
                                        datepicker-mode="year"
                                        date-format="yyyy"
                                        class="table-datepicker-ma"
                                        style="width: 95%;"
                                        required>
                                    <%--onchange="fn_payDate"--%>
                                </sbux-datepicker>
                            </td>
                            <td colspan="2" style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">사업장</th>
                            <td class="td_input">
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
                            <th scope="row" class="th_bg">부서</th>
                            <td class="td_input" style="border-right: hidden;" data-group="DEPT2">
                                <sbux-input
                                        uitype="text"
                                        id="DEPT_CODE"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="DEPT2">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="DEPT_NAME"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="DEPT2" >
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup3"
                                        readonly
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">입사일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="ENTER_DATE"
                                        name="ENTER_DATE"
                                        uitype="popup"
                                        date-format="yyyy-mm-dd"
                                        class="table-datepicker-ma"
                                        readonly>
                                </sbux-datepicker>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">사원</th>
                            <td class="td_input" style="border-right: hidden;" data-group="EMP2">
                                <sbux-input
                                        uitype="text"
                                        id="EMP_CODE"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="EMP2">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="EMP_NAME"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="EMP2">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup4"
                                        readonly
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">퇴사일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="RETIRE_DATE"
                                        name="RETIRE_DATE"
                                        uitype="popup"
                                        date-format="yyyy-mm-dd"
                                        class="table-datepicker-ma"
                                        readonly>
                                </sbux-datepicker>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>원본내역</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea3" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:4%">
                                    <col style="width:4%">
                                    <%--<col style="width:2%">--%>
                                    <%-- <col style="width:2%">--%>
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">급여</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PAY_ORIG_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">상여</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BONUS_ORIG_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">인정상여</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ADD_BONUS_ORIG_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">기타소득1</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_EXTRA1_ORIG_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">기타소득2</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_EXTRA2_ORIG_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">우리사주 조합 인출금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMPLOYEE_STOCK_ORIG_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">주식매수 선택권 행사이익</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="STOCK_PROFIT_ORIG_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">국민연금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_ORIG_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">고용보험</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMPLOY_INSURE_ORIG_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">건강보험</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HEALTH_INSURE_ORIG_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">노인장기요양보험</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SENIOR_INSURE_ORIG_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">소 득 세</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_TX_ORIG_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">주 민 세</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LOCAL_TX_ORIG_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="col-sm-9">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>조정내역</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea4" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:4%">
                                    <col style="width:4%">
                                    <col style="width:7%">
                                    <col style="width:2%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">급    여</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PAY_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PAY_AMT_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">상    여</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BONUS_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BONUS_AMT_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">인정상여</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ADD_BONUS_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ADD_BONUS_AMT_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">기타소득1</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_EXTRA1_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_EXTRA1_AMT_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">기타소득2</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_EXTRA2_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_EXTRA2_AMT_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">우리사주 조합 인출금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMPLOYEE_STOCK_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMPLOYEE_STOCK_AMT_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">주식매수 선택권 행사이익</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="STOCK_PROFIT_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="STOCK_PROFIT_AMT_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">국민연금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PENS_AMT_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">고용보험</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMPLOY_INSURE_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EMPLOY_INSURE_AMT_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">건강보험</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HEALTH_INSURE_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="HEALTH_INSURE_AMT_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">노인장기요양보험</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SENIOR_INSURE_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SENIOR_INSURE_AMT_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">소 득 세</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_TX_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_TX_AMT_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">주 민 세</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LOCAL_TX_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LOCAL_TX_AMT_DESC" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>비과세내역</span>
                            <%--<span style="font-size:12px">(조회건수 <span id="listCount2">0</span>건)</span>--%>
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
                </div>
                <div>
                    <div id="sb-area-gvwTaxFreeAmt" style="height:200px; width:100%;"></div>
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
    var gvwEmpListGrid; 			// 그리드를 담기위한 객체 선언
    var jsonEmpList = []; 	    // 그리드의 참조 데이터 주소 선언
    var gvwTaxFreeAmtGrid;
    var jsonTaxFreeAmt = [];

    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )SRCH_PAY_AREA_TYPE
    var jsonSiteCode = []; //사업장 ( L_ORG001 )SITE_CODE
    var jsonSummaryStep = []; //상태 ( L_HRA046 )SUMMARY_STEP
    var jsonTxfreeCode = []; //비과세코드 ( P_HRB015 )TXFREE_CODE


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwEmpListGrid'], jsonSummaryStep, 'L_HRA046', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwTaxFreeAmtGrid'], jsonTxfreeCode, 'P_HRB015', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TAX_FREE_CODE', 'TAX_FREE_NAME', 'Y', ''),

            //지급구분
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

    var fn_compopup3 = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("DEPT_CODE"));

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
                SBUxMethod.set('DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup4 = function() {

        var searchText = gfn_nvl(SBUxMethod.get("EMP_CODE"));
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
                SBUxMethod.set('EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('EMP_CODE', data.EMP_CODE);
            },
        });

    }

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        let openDate = gfn_dateToYear(new Date());

        SBUxMethod.set('SRCH_YE_TX_YYYY', openDate);
        /*SBUxMethod.set('srch-pay_yyyymm_fr2', openDate);*/

        fn_createGrid();
        fn_createTaxFreeGrid();
    }

    // 신규
    /*  function cfn_add() {
          fn_create();
      }*/
    // 저장
    async function cfn_save() {

        if (await gfnma_gridValidateCheck() == false){
            return;
        }

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            let chk = true;

            chk = await fn_save('U');

            let updateData = gvwTaxFreeAmtGrid.getUpdateData(true, 'all');

            if (_.isEmpty(updateData) == false && chk == true){

                chk = await fn_saveS1(updateData);

            }

            if (chk){
                gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                fn_view();
            }

        }

    }
    // 삭제
    function cfn_del() {
        if (gfn_comConfirm("Q0001", "삭제")) {
            fn_save('D');
        }
    }

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
        SBGridProperties.parentid = 'sb-area-gvwEmpList';
        SBGridProperties.id = 'gvwEmpListGrid';
        SBGridProperties.jsonref = 'jsonEmpList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: [""], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '140px', style: 'text-align:left', hidden : true},
            {caption: ["부 서 명"], ref: 'DEPT_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ['퇴사일'], ref: 'RET_DAT', width:'140px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption : ["상태"], ref : 'SUMMARY_STEP', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSummaryStep',  label : 'label', value : 'value'}
            },
        ];

        gvwEmpListGrid = _SBGrid.create(SBGridProperties);
        gvwEmpListGrid.bind('click', 'fn_view');
        gvwEmpListGrid.bind('keyup', 'fn_keyup');
    }

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }


    //사원정보
    function fn_createTaxFreeGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwTaxFreeAmt';
        SBGridProperties.id = 'gvwTaxFreeAmtGrid';
        SBGridProperties.jsonref = 'jsonTaxFreeAmt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns =[
            {caption : ["비과세코드"], ref : 'TXFREE_CODE', width : '170px', style : 'text-align:center', type : 'combo', userattr : {required : true},
                typeinfo : {ref : 'jsonTxfreeCode',  label : 'label', value : 'value'}
            },
            {caption: ["비과세약칭"], ref: 'TAX_FREE_NAME', type: 'output', width: '170px', style: 'text-align:left'},
            {caption: ["급여금액"], ref: 'PAY_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["비과세금액"], ref: 'TXFREE_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["비과세설명"], ref: 'TAX_FREE_DESCR', type: 'output', width: '170px', style: 'text-align:left'},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값

        ];

        gvwTaxFreeAmtGrid = _SBGrid.create(SBGridProperties);

    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let YE_TX_YYYY 			= gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY"));//정산연도
        let YE_TX_TYPE			= gfnma_multiSelectGet('#SRCH_YE_TX_TYPE');//정산구분
        let PAY_AREA_TYPE 		= gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE"));//급여영역
        let DEPT_CODE 			= gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let DEPT_NAME 			= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));
        let EMP_CODE 			= gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));//사원
        let EMP_NAME 			= gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        let DATE_FR 			= gfn_nvl(SBUxMethod.get("SRCH_DATE_FR")); //퇴사일
        let DATE_TO 			= gfn_nvl(SBUxMethod.get("SRCH_DATE_TO"));
        let UPDATE_YN 			= gfn_nvl(SBUxMethod.get("SRCH_UPDATE_YN"));//확정여부
        let SITE_CODE 			= gfnma_multiSelectGet('#SRCH_SITE_CODE');//사 업 장
        let RETIRE_MONTH 		= gfn_nvl(SBUxMethod.get("SRCH_RETIRE_MONTH"));//퇴직년월	---하이드처리 되어있음

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedCorpCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_YE_TX_YYYY       : YE_TX_YYYY
            ,V_P_YEAR_END_TX_TYPE : YE_TX_TYPE
            ,V_P_SITE_CODE        : SITE_CODE
            ,V_P_RETIRE_MONTH     : RETIRE_MONTH
            ,V_P_DEPT_CODE        : DEPT_CODE
            ,V_P_EMP_CODE         : EMP_CODE
            ,V_P_RETIRE_DATE_FR   : DATE_FR
            ,V_P_RETIRE_DATE_TO   : DATE_TO
            ,V_P_PAY_AREA_TYPE    : PAY_AREA_TYPE

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1200List.do", {
            getType: 'json',
            workType: 'MASTER',
            cv_count: '3',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
               let totalRecordCount = 0;

                jsonEmpList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN          : gfn_nvl(item.CHK_YN),
                        EMP_CODE        : gfn_nvl(item.EMP_CODE),
                        EMP_NAME        : gfn_nvl(item.EMP_NAME),
                        EMP_FULL_NAME   : gfn_nvl(item.EMP_FULL_NAME),
                        SUMMARY_STEP    : gfn_nvl(item.SUMMARY_STEP),
                        DEPT_CODE       : gfn_nvl(item.DEPT_CODE),
                        DEPT_NAME       : gfn_nvl(item.DEPT_NAME),
                        RET_DAT         : gfn_nvl(item.RET_DAT),
                        SITE_CODE       : gfn_nvl(item.SITE_CODE),

                    }
                    jsonEmpList.push(msg);
                     totalRecordCount++;
                });

                gvwEmpListGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if(jsonEmpList.length > 0) {
                    gvwEmpListGrid.clickRow(1);
                }

                //fn_view();

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

        let YE_TX_YYYY 			= gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY"));//정산연도
        let YE_TX_TYPE			= gfnma_multiSelectGet('#SRCH_YE_TX_TYPE');//정산구분
        let PAY_AREA_TYPE 		= gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE"));//급여영역
        let DEPT_CODE 			= gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let DATE_FR 			= gfn_nvl(SBUxMethod.get("SRCH_DATE_FR")); //퇴사일
        let DATE_TO 			= gfn_nvl(SBUxMethod.get("SRCH_DATE_TO"));
        let SITE_CODE 			= gfnma_multiSelectGet('#SRCH_SITE_CODE');//사 업 장
        let RETIRE_MONTH 	    = gfn_nvl(SBUxMethod.get("SRCH_RETIRE_MONTH"));//퇴직년월	---하이드처리 되어있음

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }

        let nRow = gvwEmpListGrid.getRow();
        let nCol = gvwEmpListGrid.getCol();

        if (nCol == -1) {
            return;
        }
        if (nRow < 1) {
            return;
        }

        let rowData = gvwEmpListGrid.getRowData(nRow);

        if (!_.isEmpty(rowData)) {

            var paramObj = {
                V_P_DEBUG_MODE_YN: 'N'
                , V_P_LANG_ID: 'KOR'
                , V_P_COMP_CODE: gv_ma_selectedCorpCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                ,V_P_YE_TX_YYYY       : YE_TX_YYYY
                ,V_P_YEAR_END_TX_TYPE : YE_TX_TYPE
                ,V_P_SITE_CODE        : SITE_CODE
                ,V_P_RETIRE_MONTH     : RETIRE_MONTH
                ,V_P_DEPT_CODE        : DEPT_CODE
                ,V_P_EMP_CODE         : rowData.EMP_CODE
                ,V_P_RETIRE_DATE_FR   : DATE_FR
                ,V_P_RETIRE_DATE_TO   : DATE_TO
                ,V_P_PAY_AREA_TYPE    : PAY_AREA_TYPE

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: ''
                , V_P_PC: ''
            };


            const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1200List.do", {
                getType				: 'json',
                workType			: 'DETAIL',
                cv_count			: '3',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {


                    data.cv_2.forEach((item, index) => {

                        SBUxMethod.set("YE_TX_YYYY", 	         gfn_nvl(item.YE_TX_YYYY));
                        SBUxMethod.set("EMP_CODE", 	             gfn_nvl(item.EMP_CODE));
                        SBUxMethod.set("EMP_NAME", 	             gfn_nvl(item.EMP_NAME));
                        //SBUxMethod.set("EMP_FULL_NAME", 	gfn_nvl(item.EMP_FULL_NAME));
                        SBUxMethod.set("SITE_CODE", 	         gfn_nvl(item.SITE_CODE));
                        SBUxMethod.set("DEPT_CODE", 	         gfn_nvl(item.DEPT_CODE));
                        SBUxMethod.set("DEPT_NAME", 	         gfn_nvl(item.DEPT_NAME));
                        SBUxMethod.set("ENTER_DATE", 	         gfn_nvl(item.ENTER_DATE));
                        SBUxMethod.set("RETIRE_DATE", 	         gfn_nvl(item.RETIRE_DATE));
                        SBUxMethod.set("PAY_AMT", 	             gfn_nvl(item.PAY_AMT));
                        SBUxMethod.set("PAY_ORIG_AMT", 	         gfn_nvl(item.PAY_ORIG_AMT));
                        SBUxMethod.set("BONUS_AMT", 	         gfn_nvl(item.BONUS_AMT));
                        SBUxMethod.set("BONUS_ORIG_AMT", 	     gfn_nvl(item.BONUS_ORIG_AMT));
                        SBUxMethod.set("ADD_BONUS_AMT", 	     gfn_nvl(item.ADD_BONUS_AMT));
                        SBUxMethod.set("ADD_BONUS_ORIG_AMT", 	 gfn_nvl(item.ADD_BONUS_ORIG_AMT));
                        SBUxMethod.set("INC_EXTRA1_AMT", 	     gfn_nvl(item.INC_EXTRA1_AMT));
                        SBUxMethod.set("INC_EXTRA1_ORIG_AMT", 	 gfn_nvl(item.INC_EXTRA1_ORIG_AMT));
                        SBUxMethod.set("INC_EXTRA2_AMT", 	     gfn_nvl(item.INC_EXTRA2_AMT));
                        SBUxMethod.set("INC_EXTRA2_ORIG_AMT", 	 gfn_nvl(item.INC_EXTRA2_ORIG_AMT));
                        SBUxMethod.set("EMPLOYEE_STOCK_AMT", 	 gfn_nvl(item.EMPLOYEE_STOCK_AMT));
                        SBUxMethod.set("EMPLOYEE_STOCK_ORIG_AMT",gfn_nvl(item.EMPLOYEE_STOCK_ORIG_AMT));
                        SBUxMethod.set("STOCK_PROFIT_AMT", 	     gfn_nvl(item.STOCK_PROFIT_AMT));
                        SBUxMethod.set("STOCK_PROFIT_ORIG_AMT",  gfn_nvl(item.STOCK_PROFIT_ORIG_AMT));
                        SBUxMethod.set("PENS_AMT", 	             gfn_nvl(item.PENS_AMT));
                        SBUxMethod.set("PENS_ORIG_AMT", 	     gfn_nvl(item.PENS_ORIG_AMT));
                        SBUxMethod.set("EMPLOY_INSURE_AMT", 	 gfn_nvl(item.EMPLOY_INSURE_AMT));
                        SBUxMethod.set("EMPLOY_INSURE_ORIG_AMT", gfn_nvl(item.EMPLOY_INSURE_ORIG_AMT));
                        SBUxMethod.set("HEALTH_INSURE_AMT", 	 gfn_nvl(item.HEALTH_INSURE_AMT));
                        SBUxMethod.set("HEALTH_INSURE_ORIG_AMT", gfn_nvl(item.HEALTH_INSURE_ORIG_AMT));
                        //-- 2012-08-23  JIHOO  (*) 건강보험과 노인장기요양보험 분리
                        SBUxMethod.set("SENIOR_INSURE_AMT", 	 gfn_nvl(item.SENIOR_INSURE_AMT));
                        SBUxMethod.set("SENIOR_INSURE_ORIG_AMT", gfn_nvl(item.SENIOR_INSURE_ORIG_AMT));
                        SBUxMethod.set("INC_TX_AMT", 	         gfn_nvl(item.INC_TX_AMT));
                        SBUxMethod.set("INC_TX_ORIG_AMT", 	     gfn_nvl(item.INC_TX_ORIG_AMT));
                        SBUxMethod.set("LOCAL_TX_AMT", 	         gfn_nvl(item.LOCAL_TX_AMT));
                        SBUxMethod.set("LOCAL_TX_ORIG_AMT", 	 gfn_nvl(item.LOCAL_TX_ORIG_AMT));
                        SBUxMethod.set("PAY_AMT_DESC", 	         gfn_nvl(item.PAY_AMT_DESC));
                        SBUxMethod.set("BONUS_AMT_DESC", 	     gfn_nvl(item.BONUS_AMT_DESC));
                        SBUxMethod.set("ADD_BONUS_AMT_DESC", 	 gfn_nvl(item.ADD_BONUS_AMT_DESC));
                        SBUxMethod.set("INC_EXTRA1_AMT_DESC", 	 gfn_nvl(item.INC_EXTRA1_AMT_DESC));
                        SBUxMethod.set("INC_EXTRA1_AMT_DESC", 	 gfn_nvl(item.INC_EXTRA1_AMT_DESC));
                        SBUxMethod.set("INC_EXTRA2_AMT_DESC", 	 gfn_nvl(item.INC_EXTRA2_AMT_DESC));
                        SBUxMethod.set("EMPLOYEE_STOCK_AMT_DESC",gfn_nvl(item.EMPLOYEE_STOCK_AMT_DESC));
                        SBUxMethod.set("STOCK_PROFIT_AMT_DESC",  gfn_nvl(item.STOCK_PROFIT_AMT_DESC));
                        SBUxMethod.set("PENS_AMT_DESC", 	     gfn_nvl(item.PENS_AMT_DESC));
                        SBUxMethod.set("EMPLOY_INSURE_AMT_DESC", gfn_nvl(item.EMPLOY_INSURE_AMT_DESC));
                        SBUxMethod.set("HEALTH_INSURE_AMT_DESC", gfn_nvl(item.HEALTH_INSURE_AMT_DESC));
                        SBUxMethod.set("SENIOR_INSURE_AMT_DESC", gfn_nvl(item.SENIOR_INSURE_AMT_DESC));
                        SBUxMethod.set("INC_TX_AMT_DESC", 	     gfn_nvl(item.INC_TX_AMT_DESC));
                        SBUxMethod.set("LOCAL_TX_AMT_DESC", 	 gfn_nvl(item.LOCAL_TX_AMT_DESC));
                        SBUxMethod.set("PAY_SUM_AMT", 	         gfn_nvl(item.PAY_SUM_AMT));
                        SBUxMethod.set("INSURE_SUM_AMT", 	     gfn_nvl(item.INSURE_SUM_AMT));
                        SBUxMethod.set("INC_TX_SUM_AMT", 	     gfn_nvl(item.INC_TX_SUM_AMT));

                    });

                    /** @type {number} **/
                    //let totalRecordCount2 = 0;

                    jsonTaxFreeAmt.length = 0;
                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            TXFREE_CODE          : gfn_nvl(item.TXFREE_CODE),
                            TAX_FREE_NAME        : gfn_nvl(item.TAX_FREE_NAME),
                            PAY_AMT              : gfn_nvl(item.PAY_AMT),
                            TAX_FREE_HISTORY_AMT : gfn_nvl(item.TAX_FREE_HISTORY_AMT),
                            TXFREE_AMT           : gfn_nvl(item.TXFREE_AMT),
                            TAX_FREE_DESCR       : gfn_nvl(item.TAX_FREE_DESCR),


                        }
                        jsonTaxFreeAmt.push(msg);
                        //totalRecordCount2++;
                    });

                    gvwTaxFreeAmtGrid.rebuild();
                    //document.querySelector('#listCount2').innerText = totalRecordCount2;


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

    // 행추가
    const fn_addRow = async function () {
        let rowVal = gvwTaxFreeAmtGrid.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwTaxFreeAmtGrid.addRow(true);
        }else{
            gvwTaxFreeAmtGrid.insertRow(rowVal);
        }
    }

    // 행삭제
    const fn_delRow = async function () {
        let rowVal = gvwTaxFreeAmtGrid.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwTaxFreeAmtGrid.deleteRow(rowVal);
        }
    }


    //저장
    const fn_save = async function (type) {

        let YE_TX_YYYY 			= gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY"));//정산연도
        let YE_TX_TYPE			= gfnma_multiSelectGet('#SRCH_YE_TX_TYPE');//정산구분
        let UPDATE_YN 			= gfn_nvl(SBUxMethod.get("SRCH_UPDATE_YN"));//확정여부

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }

        let EMP_CODE 			    = gfn_nvl(SBUxMethod.get("EMP_CODE"));//사원
        let SITE_CODE 			    = gfn_nvl(SBUxMethod.get("SITE_CODE"));//사 업 장
        let DEPT_CODE 			    = gfn_nvl(SBUxMethod.get("DEPT_CODE"));//부서
        let PAY_AMT 			    = gfn_nvl(SBUxMethod.get("PAY_AMT"));//급    여
        let BONUS_AMT 			    = gfn_nvl(SBUxMethod.get("BONUS_AMT"));//상    여
        let ADD_BONUS_AMT 	        = gfn_nvl(SBUxMethod.get("ADD_BONUS_AMT"));//인정상여
        let INC_EXTRA1_AMT 	        = gfn_nvl(SBUxMethod.get("INC_EXTRA1_AMT"));//기타소득1
        let INC_EXTRA2_AMT 	        = gfn_nvl(SBUxMethod.get("INC_EXTRA2_AMT"));//기타소득2
        let EMPLOYEE_STOCK_AMT 	    = gfn_nvl(SBUxMethod.get("EMPLOYEE_STOCK_AMT"));//우리사주 조합 인출금
        let STOCK_PROFIT_AMT 	    = gfn_nvl(SBUxMethod.get("STOCK_PROFIT_AMT"));//주식매수 선택권 행사이익
        let PENS_AMT 			    = gfn_nvl(SBUxMethod.get("PENS_AMT"));//국민연금
        let EMPLOY_INSURE_AMT 	    = gfn_nvl(SBUxMethod.get("EMPLOY_INSURE_AMT"));//고용보험
        let HEALTH_INSURE_AMT 	    = gfn_nvl(SBUxMethod.get("HEALTH_INSURE_AMT"));//건강보험
        let SENIOR_INSURE_AMT 	    = gfn_nvl(SBUxMethod.get("SENIOR_INSURE_AMT"));//노인장기요양보험
        let INC_TX_AMT 			    = gfn_nvl(SBUxMethod.get("INC_TX_AMT"));//소 득 세
        let LOCAL_TX_AMT 		    = gfn_nvl(SBUxMethod.get("LOCAL_TX_AMT"));//주 민 세

        let PAY_AMT_DESC 			= gfn_nvl(SBUxMethod.get("PAY_AMT_DESC"));//
        let BONUS_AMT_DESC 			= gfn_nvl(SBUxMethod.get("BONUS_AMT_DESC"));//
        let ADD_BONUS_AMT_DESC 		= gfn_nvl(SBUxMethod.get("ADD_BONUS_AMT_DESC"));//
        let INC_EXTRA1_AMT_DESC 	= gfn_nvl(SBUxMethod.get("INC_EXTRA1_AMT_DESC"));//
        let INC_EXTRA2_AMT_DESC 	= gfn_nvl(SBUxMethod.get("INC_EXTRA2_AMT_DESC"));//
        let EMPLOYEE_STOCK_AMT_DESC = gfn_nvl(SBUxMethod.get("EMPLOYEE_STOCK_AMT_DESC"));//
        let STOCK_PROFIT_AMT_DESC 	= gfn_nvl(SBUxMethod.get("STOCK_PROFIT_AMT_DESC"));//
        let PENS_AMT_DESC 			= gfn_nvl(SBUxMethod.get("PENS_AMT_DESC"));//
        let EMPLOY_INSURE_AMT_DESC 	= gfn_nvl(SBUxMethod.get("EMPLOY_INSURE_AMT_DESC"));//
        let HEALTH_INSURE_AMT_DESC 	= gfn_nvl(SBUxMethod.get("HEALTH_INSURE_AMT_DESC"));//
        let SENIOR_INSURE_AMT_DESC 	= gfn_nvl(SBUxMethod.get("SENIOR_INSURE_AMT_DESC"));//
        let INC_TX_AMT_DESC 		= gfn_nvl(SBUxMethod.get("INC_TX_AMT_DESC"));//
        let LOCAL_TX_AMT_DESC 		= gfn_nvl(SBUxMethod.get("LOCAL_TX_AMT_DESC"));//


        var paramObj = {
            V_P_DEBUG_MODE_YN	    : ''
            ,V_P_LANG_ID		    : ''
            ,V_P_COMP_CODE		    : gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE	    : gv_ma_selectedClntCd

            ,V_P_CONFIRM_UPDATE_YN          : UPDATE_YN
            ,V_P_YE_TX_YYYY                 : YE_TX_YYYY
            ,V_P_YEAR_END_TX_TYPE           : YE_TX_TYPE
            ,V_P_EMP_CODE                   : EMP_CODE
            ,V_P_SITE_CODE                  : SITE_CODE
            ,V_P_DEPT_CODE                  : DEPT_CODE
            ,V_P_PAY_AMT                    : PAY_AMT
            ,V_P_BONUS_AMT                  : BONUS_AMT
            ,V_P_ADD_BONUS_AMT              : ADD_BONUS_AMT
            ,V_P_INC_EXTRA1_AMT             : INC_EXTRA1_AMT
            ,V_P_INC_EXTRA2_AMT             : INC_EXTRA2_AMT
            ,V_P_EMPLOYEE_STOCK_AMT         : EMPLOYEE_STOCK_AMT
            ,V_P_STOCK_PROFIT_AMT           : STOCK_PROFIT_AMT
            ,V_P_PENS_AMT                   : PENS_AMT
            ,V_P_EMPLOY_INSURE_AMT          : EMPLOY_INSURE_AMT
            ,V_P_HEALTH_INSURE_AMT          : HEALTH_INSURE_AMT
            ,V_P_SENIOR_INSURE_AMT          : SENIOR_INSURE_AMT
            ,V_P_INC_TX_AMT                 : INC_TX_AMT
            ,V_P_LOCAL_TX_AMT               : LOCAL_TX_AMT
            /* 20190102 ADD JHKIM */
            ,V_P_PAY_AMT_DESC               : PAY_AMT_DESC
            ,V_P_BONUS_AMT_DESC             : BONUS_AMT_DESC
            ,V_P_ADD_BONUS_AMT_DESC         : ADD_BONUS_AMT_DESC
            ,V_P_INC_EXTRA1_AMT_DESC        : INC_EXTRA1_AMT_DESC
            ,V_P_INC_EXTRA2_AMT_DESC        : INC_EXTRA2_AMT_DESC
            ,V_P_EMPLOYEE_STOCK_AMT_DESC    : EMPLOYEE_STOCK_AMT_DESC
            ,V_P_STOCK_PROFIT_AMT_DESC      : STOCK_PROFIT_AMT_DESC
            ,V_P_PENS_AMT_DESC              : PENS_AMT_DESC
            ,V_P_EMPLOY_INSURE_AMT_DESC     : EMPLOY_INSURE_AMT_DESC
            ,V_P_HEALTH_INSURE_AMT_DESC     : HEALTH_INSURE_AMT_DESC
            ,V_P_SENIOR_INSURE_AMT_DESC     : SENIOR_INSURE_AMT_DESC
            ,V_P_INC_TX_AMT_DESC            : INC_TX_AMT_DESC
            ,V_P_LOCAL_TX_AMT_DESC          : LOCAL_TX_AMT_DESC

            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''


        };
        const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1200.do", {
            getType: 'json',
            workType: type,
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    if (_.isEqual(data.v_errorCode, 'MSG0004') || _.isEqual(data.v_errorCode, 'MSG0002')){
                        return true;
                    }else {
                        alert(data.resultMessage);
                        return false;
                    }
                }
                return true;

            } else {
                alert(data.resultMessage);

                return false;
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
            const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1200S1.do", {listData: listData});
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    if (data.resultMessage) {
                        if (_.isEqual(data.v_errorCode, 'MSG0004') || _.isEqual(data.v_errorCode, 'MSG0002')){
                            return true;
                        }else {
                            alert(data.resultMessage);
                            return false;
                        }
                    }
                    return true;

                } else {
                    alert(data.resultMessage);

                    return false;
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

        let YE_TX_YYYY 			= gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY"));//정산연도
        let YE_TX_TYPE			= gfnma_multiSelectGet('#SRCH_YE_TX_TYPE');//정산구분
        let EMP_CODE 			= gfn_nvl(SBUxMethod.get("EMP_CODE"));//사원

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }

        let returnData = [];

        updatedData.forEach((item, index) => {

            const param = {

                cv_count: '0',
                getType: 'json',
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN: ''
                    , V_P_LANG_ID: ''
                    , V_P_COMP_CODE: gv_ma_selectedCorpCd
                    , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                    ,V_P_YE_TX_YYYY       : YE_TX_YYYY
                    ,V_P_YEAR_END_TX_TYPE : YE_TX_TYPE
                    ,V_P_EMP_CODE         : EMP_CODE
                    ,V_P_TXFREE_CODE      : gfnma_nvl2(item.data.TXFREE_CODE)
                    ,V_P_PAY_AMT          : gfnma_nvl2(item.data.PAY_AMT)
                    ,V_P_TXFREE_AMT       : gfnma_nvl2(item.data.TXFREE_AMT)

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

    /**
     * 집    계 //CREATE
     */
    const fn_btnCreate = async function () {

        fn_batForm('CREATE');
    }

    /**
     * 집계취소 //DELETE
     */
    const fn_btnDelete = async function () {

        if (gfn_comConfirm("Q0000", "집계취소시 기존에 집계된 데이터가 삭제됩니다. 취소하시겠습니까?")) {

            fn_batForm('DELETE');

        }

    }

    /**
     * 집계확정 //CONFIRM
     */
    const fn_btnConfirm = async function () {

        fn_batForm('CONFIRM');

    }

    /**
     * 확정취소 //CANCEL
     */
    const fn_btnCancel = async function () {

        fn_batForm('CANCEL');

    }

    /**
     * 재집계
     */
    const fn_btnReCreate = async function () {

        if (gfn_comConfirm("Q0000", "재집계취소시 기존에 집계된 데이터가 삭제됩니다. 재집계하시겠습니까?")) {

            fn_batForm('RECREATE');

        }
    }


    /**
     * P_HRA1200_BAT 프로시저 호출
     */
    const fn_batForm = async function (type) {

        let YE_TX_YYYY 			= gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY"));//정산연도
        let YE_TX_TYPE			= gfnma_multiSelectGet('#SRCH_YE_TX_TYPE');//정산구분

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }

        let empList = gvwEmpListGrid.getGridDataAll();

        /*if (_.isEmpty(empList)){
            gfn_comAlert("W0001", "사원");		//	W0001	{0}을/를 선택하세요.
            return;
        }*/

        let stremp_list = '';

        empList.forEach((item,index) =>{

            if (_.isEqual(item.CHK_YN, 'Y')){

                stremp_list += item.EMP_CODE + '|'

            }

        });

        if (stremp_list == ''){
            gfn_comConfirm("Q0000","사원을 선택해주세요. [HRA1200_003]");
            return false;
        }else{
            stremp_list = stremp_list.slice(0, -1);
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	    : ''
            ,V_P_LANG_ID		    : ''
            ,V_P_COMP_CODE		    : gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE	    : gv_ma_selectedClntCd

            ,V_P_YE_TX_YYYY         : YE_TX_YYYY
            ,V_P_YEAR_END_TX_TYPE   : YE_TX_TYPE

            //-- RETIRE:중도퇴사,  YEAREND:연말정산
            ,V_P_EMP_LIST           : stremp_list

            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''

        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1200BAT.do", {
            getType: 'json',
            workType: type ,
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                }else {
                    gfn_comAlert("I0001"); // I0001	처리 되었습니다.
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
