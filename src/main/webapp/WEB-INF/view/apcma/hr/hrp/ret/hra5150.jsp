<%
    /**
     * @Class Name        : hra5150.jsp
     * @Description       : 중간/퇴직급여 계산 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.07.15
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.15   	표주완		최초 생성
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
    <title>title : 중간/퇴직급여 계산</title>
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
                <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnConfirm('CONFIRM')"></sbux-button>
                <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="확정취소"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnConfirm('CANCEL')"></sbux-button>
                <sbux-button id="btnCalculate" name="btnCalculate" uitype="normal" text="일괄계산"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnCalculate('CALCULATE')"></sbux-button>
                <sbux-button id="btnCancelCalc" name="btnCancelCalc" uitype="normal" text="계산취소"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnCalculate('CANCELCALC')"></sbux-button>
            </div>
        </div>

        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        <table id="dataArea1" class="table table-bordered tbl_fixed">
            <caption>검색 조건 설정</caption>
            <colgroup>
                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 1%">
                <col style="width: 6%">
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
                <th scope="row" class="th_bg">사업장</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="SRCH_SITE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">퇴직정산구분</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_RET_CALC_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu input_change" aria-labelledby="SRCH_RET_CALC_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="6" style="border-right: hidden;">&nbsp;</td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">정산종료일</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_RETIRE_CALC_DATE_FR"
                            name="SRCH_RETIRE_CALC_DATE_FR"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            required>
                        <%--onchange="fn_payDate"--%>
                    </sbux-datepicker>
                </td>
                <td>~</td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_RETIRE_CALC_DATE_TO"
                            name="SRCH_RETIRE_CALC_DATE_TO"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            required>
                        <%--onchange="fn_payDate"--%>
                    </sbux-datepicker>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">사번</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-input
                            uitype="text"
                            id="SRCH_EMP_CODE"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">이름</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-input
                            uitype="text"
                            id="SRCH_EMP_NAME"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">정산일</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_RET_CALC_DAT"
                            name="SRCH_RET_CALC_DAT"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            required>
                        <%--onchange="fn_payDate"--%>
                    </sbux-datepicker>
                </td>
                <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-checkbox
                            id="SRCH_CALCULATE_TAX_YN"
                            name="SRCH_CALCULATE_TAX_YN"
                            uitype="normal"
                            text="과세계산여부"
                            true-value="Y"
                            false-value="N"
                    ></sbux-checkbox>
                </td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-checkbox
                            id="SRCH_CALCULATE_PREV_YN"
                            name="SRCH_CALCULATE_PREV_YN"
                            uitype="normal"
                            text="중간지급 포함"
                            true-value="Y"
                            false-value="N"
                    ></sbux-checkbox>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="row">
            <div class="col-sm-2">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>사원리스트</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwMaster" style="height:1000px; width:100%;"></div>
                </div>
            </div>

            <div class="col-sm-10">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>정산 기본 정보</span></li>
                    </ul>
                </div>

                <div>
                    <table id="dataArea2" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:5%">
                           <%-- <col style="width:2%">--%>

                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:5%">
                            <%--<col style="width:2%">--%>

                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:5%">
                            <%--<col style="width:2%">--%>

                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:5%">
                            <%--<col style="width:2%">--%>

                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">퇴직정산구분</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="RET_CALC_TYPE1"
                                        name="RET_CALC_TYPE1"
                                        class="form-control input-sm inpt_data_reqed"
                                        jsondata-ref="jsonRetCalcType"
                                        readonly
                                />
                            </td>
                            <th scope="row" class="th_bg">사원</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input
                                        uitype="text"
                                        id="EMP_CODE"
                                        class="form-control input-sm"
                                        style="background-color: #FFFFFF !important;"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="EMP_NAME"
                                        class="form-control input-sm"
                                        style="background-color: #FFFFFF !important;"
                                        readonly
                                ></sbux-input>
                            </td>
                           <%-- <td style="border-right: hidden;">&nbsp;</td>--%>
                           <%-- <td  class="td_input" >
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup2"
                                ></sbux-button>
                            </td>--%>
                            <th scope="row" class="th_bg">입사일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="ENTER_DATE"
                                        name="ENTER_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                        style="background-color: #FFFFFF !important;"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                            <th scope="row" class="th_bg">피크시작일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="PEAK_START_DATE"
                                        name="PEAK_START_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                        onchange="fn_peakStartDate"
                                ></sbux-datepicker>
                            </td>
                        </tr>
                        <tr>

                            <th scope="row" class="th_bg">퇴사일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="RET_DAT"
                                        name="RET_DAT"
                                        class="input-sm"
                                        autocomplete="off"
                                        style="background-color: #FFFFFF !important;"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                            <th scope="row" class="th_bg">정산시작일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="CALC_ST_DAT"
                                        name="CALC_ST_DAT"
                                        class="input-sm"
                                        autocomplete="off"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                            <th scope="row" class="th_bg">정산종료일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="CALC_END_DAT"
                                        name="CALC_END_DAT"
                                        class="input-sm"
                                        autocomplete="off"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                            <th scope="row" class="th_bg">피크정산기간</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="PEAK_CALC_START_DATE"
                                        name="PEAK_CALC_START_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="PEAK_CALC_END_DATE"
                                        name="PEAK_CALC_END_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">확정급여형 퇴직연금제도 가입일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="RET_PENS_ST_DAT"
                                        name="RET_PENS_ST_DAT"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                            <td colspan="3" class="td_input" style="border-right: hidden;">
                                <sbux-checkbox
                                        id="EXEC_YN"
                                        name="EXEC_YN"
                                        uitype="normal"
                                        text="임원여부"
                                        true-value="Y"
                                        false-value="N"
                                        readonly
                                ></sbux-checkbox>
                            </td>
                            <th scope="row" class="th_bg">임원퇴직금(2011.12.31기준)</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                <sbux-input id="EXEC_RET_PAY_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                            readonly></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">피크급여기간</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="PEAK_PAY_START_DATE"
                                        name="PEAK_PAY_START_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="PEAK_PAY_END_DATE"
                                        name="PEAK_PAY_END_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">귀속연월 시작일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="JOB_ST_DAT"
                                        name="JOB_ST_DAT"
                                        class="input-sm"
                                        autocomplete="off"
                                        style="background-color: #FFFFFF !important;"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                            <th scope="row" class="th_bg">귀속연월 종료일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="JOB_END_DAT"
                                        name="JOB_END_DAT"
                                        class="input-sm"
                                        autocomplete="off"
                                        style="background-color: #FFFFFF !important;"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                            <th scope="row" class="th_bg">최근중도 정산일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="LAST_CALC_DAT"
                                        name="LAST_CALC_DAT"
                                        class="input-sm"
                                        autocomplete="off"
                                        style="background-color: #FFFFFF !important;"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                            <th scope="row" class="th_bg">피크상여기간</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="PEAK_BONUS_START_DATE"
                                        name="PEAK_BONUS_START_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="PEAK_BONUS_END_DATE"
                                        name="PEAK_BONUS_END_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">거주구분</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-checkbox
                                        id="LIVE_YN"
                                        name="LIVE_YN"
                                        uitype="normal"
                                        text="거주구분"
                                        true-value="Y"
                                        false-value="N"
                                ></sbux-checkbox>
                            </td>
                            <th scope="row" class="th_bg">거주지국</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="LIVE_NATION_CODE"
                                        name="LIVE_NATION_CODE"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonLiveNationCode"
                                />
                            </td>
                            <th scope="row" class="th_bg">퇴사사유</th>
                            <td class="td_input" style="border-right: hidden;">
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle " type="button" id="RET_REASON" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="RET_REASON" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td colspan="1" style="border-right: hidden;">&nbsp;</td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-checkbox
                                        id="TO_DC_YN"
                                        name="TO_DC_YN"
                                        uitype="normal"
                                        text="DC전환"
                                        true-value="Y"
                                        false-value="N"
                                ></sbux-checkbox>
                            </td>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-checkbox
                                        id="CALCULATE_TAX_YN"
                                        name="CALCULATE_TAX_YN"
                                        uitype="normal"
                                        text="과세 재계산"
                                        true-value="Y"
                                        false-value="N"
                                ></sbux-checkbox>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">정상정산기간</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="NORM_CALC_START_DATE"
                                        name="NORM_CALC_START_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="NORM_CALC_END_DATE"
                                        name="NORM_CALC_END_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                           <%-- <td style="border-right: hidden;">&nbsp;</td>--%>
                            <th scope="row" class="th_bg">정상급여기간</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="NORM_PAY_START_DATE"
                                        name="NORM_PAY_START_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="NORM_PAY_END_DATE"
                                        name="NORM_PAY_END_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                           <%-- <td style="border-right: hidden;">&nbsp;</td>--%>
                            <th scope="row" class="th_bg">정상상여기간</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="NORM_BONUS_START_DATE"
                                        name="NORM_BONUS_START_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="NORM_BONUS_END_DATE"
                                        name="NORM_BONUS_END_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                            <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                        </tr>
                    </table>
                </div>

                <sbux-tabs id="tabJson" name="tabJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false" onclick="fn_btnTab()">
                </sbux-tabs>

                <div class="tab-content">
                    <div id="tabInfo1" >
                        <div>
                            <table id="dataArea3" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:2%">

                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:2%">

                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:2%">

                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:2%">

                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:2%">

                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:2%">

                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:2%">

                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">평균급여</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_PAY_AMT" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    onchange="fn_calcRetireAmt()"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균상여</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_BONUS_AMT" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    onchange="fn_calcRetireAmt()"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">지급배수</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PAY_MULTIPLE_NUMBER" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">누적일수</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CUMULATIVE_DAY_CNT" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">근무일수</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WORKING_DAY_CNT" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>

                                    <th scope="row" class="th_bg">2012.12.31 이전 제외월수</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EXCP_MM_BEF_CNT" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">2013.1.1 이후  제외월수</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EXCP_MM_AFT_CNT" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">연차수당</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ANN_BENEFIT_AMT" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    onchange="fn_benAmtModi"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균연차수당</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_ANN_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균임금</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_RET_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm"
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">퇴직위로금 등</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_BONUS_ETC" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">적용일수</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WORKING_DAY_CNT2" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>

                                    <th scope="row" class="th_bg">2012.12.31 이전 가산월수</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ADD_MM_BEF_CNT" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">2013.1.1 이후  가산월수</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ADD_MM_AFT_CNT" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">평균급여(P)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_PAY_AMT_PEAK" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    onchange="fn_calcRetireAmt()"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균상여(P)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_BONUS_AMT_PEAK" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    onchange="fn_calcRetireAmt()"></sbux-input>
                                    </td>
                                    <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                                    <th scope="row" class="th_bg">근무일수(P)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WORKING_DAY_CNT_PEAK" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균급여(N)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_PAY_AMT_NORM" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    onchange="fn_calcRetireAmt()"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균상여(N)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_BONUS_AMT_NORM" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">근무일수(N)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WORKING_DAY_CNT_NORM" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">연차수당(P)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ANN_BENEFIT_AMT_PEAK" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    onchange="fn_calcRetireAmt()"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균연차수당(P)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_ANN_AMT_PEAK" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균임금(P)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_RET_AMT_PEAK" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">적용일수(P)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WORKING_DAY_CNT2_PEAK" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">연차수당(N)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ANN_BENEFIT_AMT_NORM" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    onchange="fn_calcRetireAmt()"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균연차수당(N)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_ANN_AMT_NORM" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균임금(N)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_RET_AMT_NORM" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">적용일수(N)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WORKING_DAY_CNT2_NORM" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">국민연금전환금</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INSURANCE_RETIRE_CHG" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">퇴직추계액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RETIRE_ESTIMATE_AMT" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BEF_3MM_DAY_CNT" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BEF_3MM_DAY_CNT_PEAK" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BEF_3MM_DAY_CNT_NORM" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="row">
                            <div class="col-sm-4">
                                <div class="ad_tbl_top">
                                    <ul class="ad_tbl_count">
                                        <li>
                                            <span>급여내역</span>
                                        </li>
                                    </ul>
                                    <sbux-button
                                            id="btnDel1"
                                            name="btnDel1"
                                            uitype="normal"
                                            text="행삭제"
                                            class="btn btn-sm btn-outline-danger"
                                            onclick="fn_btnDel1"
                                            style="float: right;"
                                    >
                                    </sbux-button>
                                    <sbux-button
                                            id="btnAdd1"
                                            name="btnAdd1"
                                            uitype="normal"
                                            text="행추가"
                                            class="btn btn-sm btn-outline-danger"
                                            onclick="fn_btnAdd1"
                                            style="float: right;"
                                    ></sbux-button>
                                </div>
                                <div>
                                    <div id="sb-area-gvwPay" style="height:200px; width:100%;"></div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="ad_tbl_top">
                                    <ul class="ad_tbl_count">
                                        <li>
                                            <span>상여내역</span>
                                        </li>
                                    </ul>
                                    <sbux-button
                                            id="btnDel2"
                                            name="btnDel2"
                                            uitype="normal"
                                            text="행삭제"
                                            class="btn btn-sm btn-outline-danger"
                                            onclick="fn_btnDel2"
                                            style="float: right;"
                                    >
                                    </sbux-button>
                                    <sbux-button
                                            id="btnAdd2"
                                            name="btnAdd2"
                                            uitype="normal"
                                            text="행추가"
                                            class="btn btn-sm btn-outline-danger"
                                            onclick="fn_btnAdd2"
                                            style="float: right;"
                                    ></sbux-button>
                                </div>
                                <div>
                                    <div id="sb-area-gvwBonus" style="height:200px; width:100%;"></div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="ad_tbl_top">
                                    <ul class="ad_tbl_count">
                                        <li>
                                            <span>임금 환산 년수</span>
                                        </li>
                                    </ul>
                                    <sbux-button
                                            id="btnDel3"
                                            name="btnDel3"
                                            uitype="normal"
                                            text="행삭제"
                                            class="btn btn-sm btn-outline-danger"
                                            onclick="fn_btnDel3"
                                            style="float: right;"
                                    >
                                    </sbux-button>
                                    <sbux-button
                                            id="btnAdd3"
                                            name="btnAdd3"
                                            uitype="normal"
                                            text="행추가"
                                            class="btn btn-sm btn-outline-danger"
                                            onclick="fn_btnAdd3"
                                            style="float: right;"
                                    ></sbux-button>
                                </div>
                                <div>
                                    <div id="sb-area-gvwChange" style="height:200px; width:100%;"></div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <table id="dataArea4" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:3%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th rowspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1">퇴직급여현황</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">근 무 처 구 분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">중간지급 등</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">최종분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">정산(합산)</th>
                                    <td rowspan="6" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">근무처명</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="PREV_COM_NAME"
                                                class="form-control input-sm"
                                                style="background-color: #FFFFFF !important;"
                                                readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="COMP_NAME"
                                                class="form-control input-sm"
                                                style="background-color: #FFFFFF !important;"
                                                readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="TEXTEDITEX2"
                                                class="form-control input-sm"
                                                readonly
                                        ></sbux-input>
                                    </td>
                                    <%--<td style="border-right: hidden;">&nbsp;</td>--%>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">사업자등록번호</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="PREV_COM_NUM"
                                                class="form-control input-sm"
                                                style="background-color: #FFFFFF !important;"
                                                readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="BIZ_REGNO"
                                                class="form-control input-sm"
                                                style="background-color: #FFFFFF !important;"
                                                readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="TEXTEDITEX4"
                                                class="form-control input-sm"
                                                readonly
                                        ></sbux-input>
                                    </td>
                                   <%-- <td style="border-right: hidden;">&nbsp;</td>--%>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">퇴직급여</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PREV_RET_INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_RET_INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                  <%--  <td style="border-right: hidden;">&nbsp;</td>--%>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">비과세 퇴직급여</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PREV_TXFREE_RET_INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TXFREE_RET_INC_AMT" uitype="text" <%--style="background-color: #FFFFFF !important;"--%> placeholder=""
                                                    class="form-control input-sm inpt_data_reqed" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_TXFREE_RET_INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm inpt_data_reqed" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">과세대상 퇴직급여</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PREV_TX_RET_INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TX_RET_INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_TX_RET_INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>

                    </div>
                    <div id="tabInfo2" >
                        <div>
                            <table id="dataArea5" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:4%">
                                    <col style="width:4%">
                                    <col style="width:4%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th rowspan="6" scope="row" class="th_bg" style="background-color: #FFB6C1">근속연수</th>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1">구분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">입사일</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">기산일</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">퇴사일</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">지급일</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">근속월수</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">제외월수</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">가산월수</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">중복월수</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">근속연수</th>
                                    <td rowspan="6" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1">중간지급 근속연수</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="PREV_ENTER_DAT" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="PREV_RET_INITIAL_DAT" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="PREV_RET_DAT" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="PREV_RET_PAY_DATE" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PREV_WORKING_MM_CNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PREV_EXCP_MM_CNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PREV_ADD_MM_CNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="textEditEx9" uitype="text" <%--style="background-color: #FFFFFF !important;"--%> placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PREV_WORKING_YEAR_CNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1">최종분 근속연수</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="ENTER_DAT" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="CALC_ST_DAT" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="RET_DAT" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="PAY_DATE1" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WORKING_MM_CNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EXCP_MM_CNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ADD_MM_CNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="textEditEx10" uitype="text" <%--style="background-color: #FFFFFF !important;"--%> placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WORKING_YEAR_CNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1">정산(합산) 근속연수</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="textEditEx1" class="form-control input-sm"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="TOT_CALC_ST_DAT" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="TOT_RET_DAT" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="textEditEx8" class="form-control input-sm"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_WORKING_MM_CNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_EXCP_MM_CNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_ADD_MM_CNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_OVERLAP_MM_CNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_WORKING_YEAR_CNT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2" scope="row" class="th_bg" style="background-color: #FFB6C1">안분</th>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">2012.12.31이전</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="textEditEx3" class="form-control input-sm"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="TOT_CALC_ST_DAT_BEF" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="TOT_RET_DAT_BEF" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="textEditEx7" class="form-control input-sm"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_WORKING_MM_CNT_BEF" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_EXCP_MM_CNT_BEF" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_ADD_MM_CNT_BEF" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="textEditEx12" uitype="text" <%--style="background-color: #FFFFFF !important;"--%> placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_WORKING_YEAR_CNT_BEF" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="background-color: #FFB6C1">2013.01.01이후</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="textEditEx5" class="form-control input-sm"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="TOT_CALC_ST_DAT_AFT" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="TOT_RET_DAT_AFT" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input uitype="text" id="textEditEx6" class="form-control input-sm"
                                                    readonly
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_WORKING_MM_CNT_AFT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_EXCP_MM_CNT_AFT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_ADD_MM_CNT_AFT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="textEditEx11" uitype="text" <%--style="background-color: #FFFFFF !important;"--%> placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_WORKING_YEAR_CNT_AFT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric'}"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <p>2016~2019년간 퇴직소득세액 계산방법</p>
                            <p>( ❈ 개정규정 및 종전 규정에 따른 산출세액에 퇴직연도별 비율을 적용하여 계산합니다.)</p>
                        </div>
                        <div>
                            <table id="dataArea6" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:4%">
                                    <col style="width:4%">
                                    <col style="width:4%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th rowspan="9" colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">개정
                                        규정에
                                        따른
                                        계산
                                        방법</th>
                                    <th rowspan="6" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">과세
                                        표준
                                        계산</th>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">계산내용</th>
                                    <th colspan="5" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">금액</th>
                                    <td rowspan="6" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">정산퇴직소득</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_RET_PAY_AMT1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">근속연수공제</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_WORKING_CNT_DEDUCT1" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">환산급여</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CONV_INC_AMT_2016" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">환산급여별공제</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CONV_INC_DEDUCT_2016" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">퇴직소득과세표준</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_PAY_TX_STD_AMT_2016" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="3" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">세액
                                        계산</th>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">계 산 내 용</th>
                                    <th colspan="5" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">금    액</th>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">환산산출세액</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CONV_CALC_TX_AMT_2016" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">산출세액</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CALC_TX_AMT_2016" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="12" colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">종전
                                        규정에
                                        따른
                                        계산
                                        방법</th>
                                    <th rowspan="5" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">과세
                                        표준
                                        계산</th>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">계 산 내 용</th>
                                    <th colspan="5" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">금    액</th>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">퇴직소득</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_RET_PAY_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">퇴직소득정률공제</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_RET_FX_R_DEDUCT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">근속연수공제</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_WORKING_CNT_DEDUCT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">퇴직소득과세표준</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_RET_PAY_TX_STD_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="7" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">세액
                                        계산</th>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">계 산 내 용</th>
                                    <th colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">2012.12.31 이전</th>
                                    <th colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">2013.1.1 이후</th>
                                    <th scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">합   계</th>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">과세표준안분</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_PAY_TX_STD_BEF" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_PAY_TX_STD_AFT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_RET_PAY_TX_STD" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">연평균과세표준</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ANN_AVG_TX_STD_AMT_BEF" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ANN_AVG_TX_STD_AMT_AFT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_ANN_AVG_TX_STD_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">환산과세표준</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="textEditEx19" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CONV_TX_STD_AMT_AFT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_CONV_TX_STD_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">환산산출세액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="textEditEx20" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CONV_CALC_TX_AMT_AFT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_CONV_CALC_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">연평균산출세액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ANN_AVG_CALC_TX_AMT_BEF" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="ANN_AVG_CALC_TX_AMT_AFT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_ANN_AVG_CALC_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">산출세액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CALC_TX_AMT_BEF" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CALC_TX_AMT_AFT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_CALC_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="4" colspan="3" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">퇴직소득
                                        세액계산</th>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">퇴직일이 속하는 과세연도</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                id="PAY_YYYY_RETIRE_DATE"
                                                name="PAY_YYYY_RETIRE_DATE"
                                                uitype="popup"
                                                datepicker-mode="year"
                                                date-format="yyyy"
                                                class="form-control input-sm input-sm-ast"
                                                style="background-color: #FFFFFF !important;"
                                                readonly>
                                        </sbux-datepicker>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">특례 적용 산출세액</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SPEC_CALC_TX_AMT_AMT_2016" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">기납부(또는 기과세이연) 세액</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_PREV_PAID_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="4" scope="row" class="th_bg" style="text-align:left; background-color: #FFB6C1">신고대상세액</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="tabInfo3" >
                        <div>
                            <table id="dataArea7" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:4%">
                                    <col style="width:4%">
                                    <col style="width:4%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th rowspan="3" colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">이연퇴직소득세액계산</th>
                                    <th rowspan="2" colspan="1" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">신고대상 세액</th>
                                    <th colspan="5" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">연금계좌 입금내역</th>
                                    <th rowspan="2" colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">퇴직급여</th>
                                    <th rowspan="2" colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">이연퇴직 소득세</th>
                                    <td rowspan="3" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">연금계좌취급자</th>
                                    <th scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">사업자등록번호</th>
                                    <th scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">계좌번호</th>
                                    <th scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">입금일</th>
                                    <th scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">계좌입금금액</th>
                                </tr>
                                <tr>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DEFER_INC_TX_AMT" uitype="text" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <div class="dropdown">
                                            <button style="width:100px;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="IRP_BANK_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="IRP_BANK_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="IRP_BIZ_REGNO" uitype="text" placeholder=""
                                                    class="form-control input-sm inpt_data_reqed"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="IRP_BANK_ACCOUNT_REAL" uitype="text" placeholder=""
                                                    class="form-control input-sm inpt_data_reqed"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="RET_PENS_END_DAT"
                                                name="RET_PENS_END_DAT"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                style="width:100%;"
                                        />
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_PENS_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm inpt_data_reqed" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    ></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DEFER_RET_INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DEFER_RET_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="4" colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">납부명세</th>
                                    <th colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">구    분</th>
                                    <th colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">소득세</th>
                                    <th colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">지방소득세</th>
                                    <th colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">농어촌특별세</th>
                                    <th colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">계</th>
                                    <td rowspan="4" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">신고대상세액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_RET_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LOCAL_RET_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SPEC_RET_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RET_TX_SUM" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">이연퇴직소득세</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_DEFER_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LOCAL_DEFER_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SPEC_DEFER_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DEFER_TX_SUM" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2" scope="row" class="th_bg" style="text-align:center; background-color: #FFB6C1">차감원천징수세액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INC_BALANCE_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="LOCAL_BALANCE_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SPEC_BALANCE_TX_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BALANCE_TX_SUM" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>지급내역</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea8" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:4%">
                                    <col style="width:5%">
                                    <col style="width:5%">

                                    <col style="width:4%">
                                    <col style="width:5%">
                                    <col style="width:2%">

                                    <col style="width:4%">
                                    <col style="width:5%">
                                    <col style="width:5%">
                                    <col style="width:3%">

                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">지급액계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="PAY_AMT_SUM" uitype="text" placeholder="" class="form-control input-sm"
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                        ></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;">&nbsp;</td>
                                    <th scope="row" class="th_bg">차이금액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DIFF_AMT" uitype="text" placeholder="" class="form-control input-sm"
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                        ></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;">&nbsp;</td>
                                    <th scope="row" class="th_bg">회사지급액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="REAL_PAY_AMT" uitype="text" placeholder="" class="form-control input-sm"
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">금융기관1</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <div class="dropdown">
                                            <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PENS_BANK_CODE1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="PENS_BANK_CODE1" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INSURER1_PAY_AMT" uitype="text" placeholder="" class="form-control input-sm"
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    onchange="fn_payAmt()"
                                        ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">국민연금전환금</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INSURANCE_RETIRE_CHG" uitype="text" placeholder="" class="form-control input-sm"
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                        ></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;">&nbsp;</td>
                                    <th scope="row" class="th_bg">회사납부액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="COM_PAY_AMT" uitype="text" placeholder="" class="form-control input-sm"
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    onchange="fn_payAmt()" required
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">금융기관2</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <div class="dropdown">
                                            <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PENS_BANK_CODE2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="PENS_BANK_CODE2" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INSURER2_PAY_AMT" uitype="text" placeholder="" class="form-control input-sm"
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    onchange="fn_payAmt()"
                                        ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">연금사지급</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="RETIRE_ESTIMATE_AMT" uitype="text" placeholder="" class="form-control input-sm"
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                        ></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;">&nbsp;</td>
                                    <th scope="row" class="th_bg">지급은행</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="BANK_CODE"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                        <%-- uitype="hidden"--%>
                                                uitype="text"
                                                id="BANK_NAME"
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
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">금융기관3</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <div class="dropdown">
                                            <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PENS_BANK_CODE3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="PENS_BANK_CODE3" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="INSURER3_PAY_AMT" uitype="text" placeholder="" class="form-control input-sm"
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    onchange="fn_payAmt()"
                                        ></sbux-input>
                                    </td>
                                    <td colspan="3" class="td_input" style="border-right:hidden;">
                                        <sbux-checkbox
                                                uitype="normal"
                                                id="COMP_TAX_PAY_YN"
                                                name="COMP_TAX_PAY_YN"
                                                uitype="normal"
                                                class="form-control input-sm check"
                                                text="세금회사부담"
                                                true-value="Y" false-value="N"
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">계좌번호</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BANK_ACCOUNT_REAL" uitype="text" placeholder="" class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">예금주</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BANK_DEPOR" uitype="text" placeholder="" class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>


                    </div>
                    <div id="tabInfo4" >
                        <div class="ad_tbl_top">
                            <sbux-button
                                    id="btnPaper"
                                    name="btnPaper"
                                    uitype="normal"
                                    text="전표조회"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnPaper"
                                    style="float: right;"
                            >
                            </sbux-button>
                            <sbux-button
                                    id="btnCancelPosting"
                                    name="btnCancelPosting"
                                    uitype="normal"
                                    text="반영 취소"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnCreatePosting('PAYROLLD')"
                                    style="float: right;"
                            ></sbux-button>
                            <sbux-button
                                    id="btnCreatePosting"
                                    name="btnCreatePosting"
                                    uitype="normal"
                                    text="회계 반영"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnCreatePosting('PAYROLLN')"
                                    style="float: right;"
                            ></sbux-button>
                            <sbux-button
                                    id="btnCancel2"
                                    name="btnCancel2"
                                    uitype="normal"
                                    text="전표처리 집계취소"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnPosting('CANCEL')"
                                    style="float: right;"
                            ></sbux-button>
                            <sbux-button
                                    id="btnPosting"
                                    name="btnPosting"
                                    uitype="normal"
                                    text="전표처리내역 집계"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnPosting('BATCH')"
                                    style="float: right;"
                            ></sbux-button>
                        </div>
                        <div>
                            <table id="dataArea9" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:4%">
                                    <col style="width:5%">
                                    <col style="width:2%">

                                    <col style="width:4%">
                                    <col style="width:5%">
                                    <col style="width:2%">

                                    <col style="width:4%">
                                    <col style="width:5%">
                                    <col style="width:2%">

                                    <col style="width:4%">
                                    <col style="width:5%">
                                    <col style="width:3%">

                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">귀속년월</th>
                                    <td class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="PAY_YYYYMM"
                                                name="PAY_YYYYMM"
                                                date-format="yyyy-mm"
                                                datepicker-mode="month"
                                                class="form-control pull-right input-sm-ast inpt_data_reqed input-sm">
                                        </sbux-datepicker>
                                    </td>
                                    <td style="border-right: hidden;">&nbsp;</td>
                                    <th scope="row" class="th_bg">퇴직정산구분</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <div class="dropdown">
                                            <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="RET_CALC_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="RET_CALC_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td style="border-right: hidden;">&nbsp;</td>
                                    <th scope="row" class="th_bg">퇴직일자</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="PAY_DATE"
                                                name="PAY_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                                onchange="fn_payDate()"
                                        >
                                        </sbux-datepicker>
                                    </td>
                                    <td style="border-right: hidden;">&nbsp;</td>
                                    <th scope="row" class="th_bg">진행상태</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-select
                                                unselected-text="전체"
                                                uitype="single"
                                                id="POSTING_STATUS"
                                                name="POSTING_STATUS"
                                                class="form-control input-sm"
                                                jsondata-ref="jsonPostingStatus"
                                        />
                                    </td>
                                    <td class="td_input" style="border-right:hidden; display: none">
                                        <sbux-input id="DOC_ID" uitype="text" placeholder="" class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">회계처리일자</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="POSTING_DATE"
                                                name="POSTING_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                        />
                                    </td>
                                    <td style="border-right: hidden;">&nbsp;</td>
                                    <th scope="row" class="th_bg">지급일</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="EXPECTED_PAY_DATE"
                                                name="EXPECTED_PAY_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                        />
                                    </td>
                                    <td style="border-right: hidden;">&nbsp;</td>
                                    <th scope="row" class="th_bg">거래처</th>
                                    <td colspan="2" class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="CS_CODE"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                        <%-- uitype="hidden"--%>
                                                uitype="text"
                                                id="CS_NAME"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td colspan="2" <%--colspan="2"--%> class="td_input" >
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="찾기" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_compopup2"
                                        ></sbux-button>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">전표번호</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input
                                        <%-- uitype="hidden"--%>
                                                uitype="text"
                                                id="DOC_NAME"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td style="border-right: hidden;">&nbsp;</td>
                                    <th scope="row" class="th_bg">메모</th>
                                    <td colspan="8" class="td_input">
                                        <sbux-textarea id="MEMO" <%--rows="3" --%>class="form-control input-sm" uitype="normal" style="width:100%"></sbux-textarea>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>퇴직급여 회계처리</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-gvwInfo" style="height:200px; width:100%;"></div>
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
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    var editType			= 'N';

    /*   var job_group = ''; //직군
       var avg_pay_type = ''; //평균급여산정기준*/
    var position_aa = '';
    var position_bb = '';
    var stravg_pay_type = '';//직군
    var strjob_group = '';//평균급여산정기준

    //grid 초기화
    var gvwMasterGrid; 			// 그리드를 담기위한 객체 선언
    var jsonMasterList = []; 	    // 그리드의 참조 데이터 주소 선언
    var gvwPayGrid;
    var jsonPayList = [];
    var gvwBonusGrid;
    var jsonBonusList = [];
    var gvwChangeGrid;
    var jsonChangeList = [];
    var gvwInfoGrid;
    var jsonInfoList = [];

    var jsonRetCalcType = []; //퇴직정산구분 ( L_HRA037 )RET_CALC_TYPE
    var jsonLiveNationCode = []; //거주지국 ( L_COM015_2 )LIVE_NATION_CODE
    var jsonPostingStatus = []; //
    // 태 ( L_HRP032 )POSTING_STATUS
    var jsonDeptName = []; //부서 ( P_ORG001 )DEPT_NAME
    var jsonEmp = []; //사원 ( P_HRI0001 )EMP_CODE, EMP_NAME
    //var jsonRetCalcType = []; //퇴직정산구분 ( L_HRA037 )RET_CALC_TYPE
    var jsonPayItemCode = []; //급여항목 ( L_HRP004 )PAY_ITEM_CODE
    var jsonPositionCode = []; //직위 ( L_HRI002_1 )POSITION_CODE
    var jsonCurrencyCode = []; //통화 ( L_COM001 )CURRENCY_CODE

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['RET_CALC_TYPE1','gvwMasterGrid'], jsonRetCalcType, 'L_HRA037', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['LIVE_NATION_CODE'], jsonLiveNationCode, 'L_COM015_2', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'NATION_CODE', 'NATION_NAME', 'Y', ''),
            gfnma_setComSelect(['POSTING_STATUS'], jsonPostingStatus, 'L_HRP032', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwMasterGrid'], jsonDeptName, 'P_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwMasterGrid'], jsonEmp, 'P_HRI0001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'EMP_CODE', 'EMP_FULL_NAME', 'Y', ''),
            //gfnma_setComSelect(['gvwMasterGrid'], jsonRetCalcType, 'L_HRA037', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwBonusGrid'], jsonPayItemCode, 'L_HRP004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwChangeGrid'], jsonPositionCode, 'L_HRI002_1', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),

            //퇴직정산구분
            gfnma_multiSelectInit({
                target			: ['#SRCH_RET_CALC_TYPE', '#RET_CALC_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRA037'
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

            //지급구분
            gfnma_multiSelectInit({
                target			: ['#SRCH_SITE_CODE']
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

            //퇴사사유
            gfnma_multiSelectInit({
                target			: ['#RET_REASON']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI013'
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

            //퇴사사유
            gfnma_multiSelectInit({
                target			: ['#IRP_BANK_CODE','#PENS_BANK_CODE1','#PENS_BANK_CODE2','#PENS_BANK_CODE3']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRA011'
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
        var searchText 		= gfnma_nvl(SBUxMethod.get("BANK_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '공통은행정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM027'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["코드", 		    "은행명"     ]
            ,searchInputFields		: ["BANK_CODE", 	"BANK_NAME"	]
            ,searchInputValues		: ["", 				 searchText ]

            ,searchInputTypes		: ["input", 		"input"     ]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["코드",		"은행명"    ]
            ,tableColumnNames		: ["SUB_CODE",	"CODE_NAME"]
            ,tableColumnWidths		: ["100px", 		"150px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('BANK_NAME', data.CODE_NAME);
                SBUxMethod.set('BANK_CODE', data.SUB_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("CS_NAME"));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var replaceText2 	= "_BIZ_REGNO_";
        var strWhereClause 	= "AND a.CS_CODE LIKE '%" + replaceText0 + "%' AND a.CS_NAME LIKE '%" + replaceText1 + "%' AND a.BIZ_REGNO LIKE '%"+ replaceText2 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM004'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드"  , 	"거래처명",  "사엄자번호" ]
            ,searchInputFields		: ["CS_CODE"   , 	"CS_NAME",  "BIZ_REGNO"]
            ,searchInputValues		: [""          , 	searchText, ""         ]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호" , "대표자"     ,"업태"          ,"종목"      ,"주소"    ,"전화"  ,"팩스"]
            ,tableColumnNames		: ["CS_CODE" , "CS_NAME", "BIZ_REGNO", "CHIEF_NAME","BIZ_CATEGORY" ,"BIZ_ITEMS","ADDRESS","TEL"   ,"FAX"]
            ,tableColumnWidths		: ["100px"    , "130px" , "100px"    , "120px"     ,"120px"        ,"100px"    ,"200px"  ,"100px" ,"100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('CS_NAME', data.CS_NAME);
                SBUxMethod.set('CS_CODE', data.CS_CODE);
            },
        });
    }

    var tabJsonData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "퇴직급여현황",         "targetid" : "tabInfo1" , "targetvalue" : "퇴직급여현황"},
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "퇴직소득세액",         "targetid" : "tabInfo2" ,     "targetvalue" : "퇴직소득세액"},
        { "id" : "2", "pid" : "-1", "order" : "3", "text" : "지급내역 및 납부명세",  "targetid" : "tabInfo3" ,     "targetvalue" : "지급내역 및 납부명세"},
        { "id" : "3", "pid" : "-1", "order" : "4", "text" : "회계처리",            "targetid" : "tabInfo4" ,  "targetvalue" : "회계처리"}
    ];

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        let nowDate = new Date();
        let openDate = gfn_dateToYmd(nowDate);

        let nextDate = new Date(nowDate);
        nextDate.setDate(nowDate.getDate() + 7);
        let openNextDate = gfn_dateToYmd(nextDate);


        SBUxMethod.set('SRCH_RETIRE_CALC_DATE_FR', openDate);
        SBUxMethod.set('SRCH_RETIRE_CALC_DATE_TO', openNextDate);

        // 과세 계산 여부
        SBUxMethod.set("SRCH_CALCULATE_TAX_YN", "Y");
        SBUxMethod.hide('SRCH_CALCULATE_TAX_YN');
        //chkcalculate_tax_yn.EditValue = "Y";
        //chkcalculate_tax_yn.Visible = false;

        //중간지급 포함 여부
        SBUxMethod.set("SRCH_CALCULATE_PREV_YN", "Y");
        SBUxMethod.hide('SRCH_CALCULATE_PREV_YN');
        //chkcalculate_prev_yn.EditValue = "Y";
        //chkcalculate_prev_yn.Visible = false;

        SBUxMethod.set("CALCULATE_TAX_YN", "N");
        //chkcalculate_tax_yn1.EditValue = "Y";
        SBUxMethod.set("TO_DC_YN", "N");
        //chkto_dc_yn.EditValue = "N";

        fn_createGrid();//사원 리스트
        fn_createPayGrid();//급여내역 리스트
        fn_createBonusGrid();//상여내역 리스트
        fn_createChangeGrid(); //임금 환산 년수 리스트
        fn_createInfoGrid();//회계처리 리스트

    }

    // 신규
    /*  function cfn_add() {
          fn_create();
      }*/
    // 저장
    function cfn_save() {

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            let nRow = gvwMasterGrid.getRow();

            if (nRow == -1) {

                /*gfn_comAlert("W0001", "사원");*/
                nRow = 1; //포커스 선택이 안되어 있을시, 사원리스트 조회후 1번째 인덱스 사원정보로 디테일 조회 하기 때문에 row값 디폴트로 1셋팅.

            }

            let rowData = gvwMasterGrid.getRowData(nRow);

            if (!_.isEmpty(rowData)) {

                fn_save(rowData);

                let complateCode = true;

                let payData = gvwPayGrid.getUpdateData(true, 'all');
                let bonusData = gvwBonusGrid.getUpdateData(true, 'all');
                let changeData = gvwChangeGrid.getUpdateData(true, 'all');
                //P_HRA5150_S1
                if (_.isEmpty(payData) == false) {
                    complateCode = fn_saveS1(payData, rowData);

                    //P_HRA5150_S2
                } else if (_.isEmpty(bonusData) == false) {
                    complateCode = fn_saveS2(bonusData, rowData);

                    //P_HRA5150_S2
                } else if (_.isEmpty(changeData) == false) {
                    complateCode = fn_saveS3(changeData, rowData);

                } else if (complateCode) {
                    gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                    fn_search();
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
        fn_search();
    }

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }

    //view 조회시 조회되는  테이블 그리드 초기화
    const fn_clearForm = function() {


        gfnma_uxDataClear('#dataArea2');
        gfnma_uxDataClear('#dataArea3');
        gfnma_uxDataClear('#dataArea4');
        gfnma_uxDataClear('#dataArea5');
        gfnma_uxDataClear('#dataArea6');
        gfnma_uxDataClear('#dataArea7');
        gfnma_uxDataClear('#dataArea8');
        gfnma_uxDataClear('#dataArea9');


        jsonPayList.length = 0
        gvwPayGrid.rebuild();

        jsonBonusList.length = 0
        gvwBonusGrid.rebuild();

        jsonChangeList.length = 0
        gvwChangeGrid.rebuild();

        jsonInfoList.length = 0
        gvwInfoGrid.rebuild();

    }

    //사원 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwMaster';
        SBGridProperties.id = 'gvwMasterGrid';
        SBGridProperties.jsonref = 'jsonMasterList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: [""], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["사업장"], ref: 'SITE_CODE', type: 'output', width: '100px', style: 'text-align:left', hidden : true},
            {caption: ["부서"], ref: 'DEPT_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["퇴직정산구분"], ref : 'RET_CALC_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonRetCalcType', displayui : true, label : 'label', value : 'value', hidden : true}
            },
            /* {caption: ["퇴직정산구분"], ref: 'RET_CALC_TYPE', type: 'output', width: '100px', style: 'text-align:left'},*/
            /* {caption : ["부서"], ref : 'DEPT_NAME', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                 typeinfo : {ref : 'jsonDeptName', displayui : true, label : 'label', value : 'value'}
             },
             {caption : ["사번"], ref : 'EMP_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                 typeinfo : {ref : 'jsonEmp', displayui : true, label : 'label', value : 'value'}
             },*/
            /* {caption : ["이름"], ref : 'EMP_NAME', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                 typeinfo : {ref : 'jsonEmp', displayui : true, label : 'label', value : 'value'}
             },*/
            /*{caption : ["퇴직정산구분"], ref : 'RET_CALC_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonRetCalcType', displayui : true, label : 'label', value : 'value', hidden : true}
            },*/
            {caption: ["확정"], ref: 'RET_CALC_CONFIRM_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }, disabled: true
            },
            {caption: ['입사일'], ref: 'ENTER_DATE', width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true, hidden : true},
            {caption: ['정산일'], ref: 'RET_CALC_DAT', width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["직군"], ref: 'JOB_GROUP', type: 'output', width: '100px', style: 'text-align:left', hidden : true },
            {caption: ["평균급여산정기준"], ref: 'AVG_PAY_TYPE', type: 'output', width: '100px', style: 'text-align:left', hidden : true},

        ];

        gvwMasterGrid = _SBGrid.create(SBGridProperties);
        gvwMasterGrid.bind('valuechanged','gridValueChangedMaster');
        gvwMasterGrid.bind('click', 'fn_view');
    }

    //급여내역 리스트
    function fn_createPayGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwPay';
        SBGridProperties.id = 'gvwPayGrid';
        SBGridProperties.jsonref = 'jsonPayList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [1],
                sum : [2,3,4,8]
            },
            subtotalrow : {
                1: {
                    titlecol: 0,
                    titlevalue: '합계',
                    style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol: 0
                },
            },
            grandtotalrow : {
                titlecol 	: 0,
                titlevalue	: '합계',
                style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                stylestartcol	: 0
            },
            datasorting	: false,
            usedecimal : false,
        };
        SBGridProperties.columns = [
            {caption: [""], ref: 'PEAK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ['귀속년월'], ref: 'PAY_YYYYMM', width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}},
            {caption: ["기본급"], ref: 'BASE_PAY_AMT', type: 'output', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###',  emptyvalue:'0'}},
            {caption: ["수당"], ref: 'ALLOWANCE_AMT', type: 'output', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["적용금액"], ref: 'APPLY_AMT', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ['적용시작일'], ref: 'ST_DAT', width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['적용종료일'], ref: 'END_DAT', width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["급여금액"], ref: 'PAY_AMT', type: 'output', width: '100px', style: 'text-align:left', hidden : true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["적용일수"], ref: 'APPLY_DAYS', type: 'output', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#' ,  emptyvalue:'0'}},
        ];

        gvwPayGrid = _SBGrid.create(SBGridProperties);
        gvwPayGrid.bind('valuechanged','gridValueChanged1');
        /*  gvwInfoGrid.bind('click', 'fn_view');*/
    }


    //상여내역 리스트
    function fn_createBonusGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwBonus';
        SBGridProperties.id = 'gvwBonusGrid';
        SBGridProperties.jsonref = 'jsonBonusList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: [""], ref: 'PEAK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ['귀속년월'], ref: 'PAY_YYYYMM', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}},
            {caption: ['지급일'], ref: 'PAY_DATE', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ["급여항목"], ref : 'PAY_ITEM_CODE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonPayItemCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["상여금액"], ref: 'PAY_AMT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["적용금액"], ref: 'APPLY_AMT', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
        ];

        gvwBonusGrid = _SBGrid.create(SBGridProperties);
        gvwBonusGrid.bind('valuechanged','gridValueChanged2');
        /*  gvwInfoGrid.bind('click', 'fn_view');*/
    }

    //임금 환산 년수 리스트
    function fn_createChangeGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwChange';
        SBGridProperties.id = 'gvwChangeGrid';
        SBGridProperties.jsonref = 'jsonChangeList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: [""], ref: 'PEAK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption : ["직위"], ref : 'POSITION_CODE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonPositionCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['적용시작일'], ref: 'ST_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['적용종료일'], ref: 'END_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["년"], ref: 'YY_CNT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4},  format : { type:'number' , rule:'#' }},
            {caption: ["월"], ref: 'MM_CNT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 2},  format : { type:'number' , rule:'#' }},
            {caption: ["일"], ref: 'DD_CNT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 2},  format : { type:'number' , rule:'#' }},
            {caption: ["근무일수"], ref: 'DD_TOT_CNT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#' , emptyvalue:'0'}},
            {caption: ["지급배수"], ref: 'PAY_MULTIPLE_NUMBER', type: 'input', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###.0', emptyvalue:'0.0' }},
            {caption: ["환산개월수"], ref: 'CHG_MM_CNT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###.00000', emptyvalue:'0.00000' }},

        ];

        gvwChangeGrid = _SBGrid.create(SBGridProperties);
        gvwChangeGrid.bind('valuechanged','gridValueChanged3');
        /*  gvwInfoGrid.bind('click', 'fn_view');*/
    }

    //회계처리 리스트
    function fn_createInfoGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwInfo';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["순    번"], ref: 'POSTING_SEQ', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 4*/},  format : { type:'number' , rule:'#' }},
            {caption: ["회계단위"], ref: 'FI_ORG_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["회계단위명"], ref: 'FI_ORG_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["부 서 명"], ref: 'DEPT_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["원가중심점코드"], ref: 'CC_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["원가중심점명"], ref: 'CC_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["계정코드"], ref: 'ACC_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["계정명"], ref: 'ACC_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["통화"], ref : 'CURRENCY_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonCurrencyCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["차변금액"], ref: 'DEBIT_AMT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["대변금액"], ref: 'CREDIT_AMT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["거래처"], ref: 'CS_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사원코드"], ref: 'EMP_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사 원 명"], ref: 'EMP_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["적    요"], ref: 'MEMO', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사원번호필수입력"], ref: 'NEED_EMP_CODE_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                },
            },
            {caption: ["집계결과 조정가능"], ref: 'POSTING_RESULT_ADJUST_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                },
            },
        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        /*  gvwInfoGrid.bind('click', 'fn_view');*/
    }


    // 행 추가( 급여내역 리스트 )
    const fn_btnAdd1 = function() {
        let rowVal = gvwPayGrid.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwPayGrid.addRow(true);
        }else{
            gvwPayGrid.insertRow(rowVal);
        }
    }

    // 행삭제( 급여내역 리스트 )
    const fn_btnDel1 = async function () {

        let rowVal = gvwPayGrid.getRow();

        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwPayGrid.deleteRow(rowVal);

            // 삭제시 적용금액의 합계 / 3 을 평균급여에 넣어줌
            let dSum = 0;
            let dSumNorm = 0;
            let dSumPeak = 0;

            let alldata = gvwPayGrid.getGridDataAll();

            alldata.forEach((item,index) => {
                if (item.PEAK_YN == 'N') {
                    dSum        += Number(item.APPLY_AMT);
                    dSumNorm    += Number(item.APPLY_AMT);
                } else {
                    dSumPeak    += Number(item.APPLY_AMT);

                }
            });

            let dDaySum = 0;
            let dDaySumPeak = 0;
            let dDaySumNorm = 0;

            alldata.forEach((item,index) => {
                if (item.PEAK_YN == 'N') {
                    dDaySum        += Number(item.APPLY_DAYS);
                    dDaySumNorm    += Number(item.APPLY_DAYS);
                } else {
                    dDaySumPeak    += Number(item.APPLY_DAYS);

                }
            });

            let RET_CALC_TYPE		= gfnma_multiSelectGet('#SRCH_RET_CALC_TYPE'); // 퇴직정산구분

            if (RET_CALC_TYPE == 'RETIRE' || RET_CALC_TYPE == "MIDDLE") {

                SBUxMethod.set("AVG_MM_PAY_AMT", dSum);
                SBUxMethod.set("AVG_MM_PAY_AMT_NORM", dSumNorm);
                SBUxMethod.set("AVG_MM_PAY_AMT_PEAK", dSumPeak);

                let AVG_MM_PAY_AMT	        = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT"))); //평균급여, numavg_monthly_pay_amt
                let AVG_MM_PAY_AMT_NORM	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT_NORM"))); //평균급여, numavg_monthly_pay_amt_norm
                let AVG_MM_PAY_AMT_PEAK	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT_PEAK"))); //평균급여, numavg_monthly_pay_amt_peak

                let AVG_MM_BONUS_AMT	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT"))); //평균상여, numavg_monthly_bonus_amt
                let AVG_MM_BONUS_AMT_NORM	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT_NORM"))); //평균상여, numavg_monthly_bonus_amt_norm
                let AVG_MM_BONUS_AMT_PEAK	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT_PEAK"))); //평균상여, numavg_monthly_bonus_amt_peak

                let AVG_MM_ANN_AMT	        = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT"))); //평균연차수당, numavg_monthly_annual_amt
                let AVG_MM_ANN_AMT_NORM 	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT_NORM"))); //평균연차수당, numavg_monthly_annual_amt_norm
                let AVG_MM_ANN_AMT_PEAK 	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT_PEAK"))); //평균연차수당, numavg_monthly_annual_amt_peak

                if (dDaySum != 0)
                {
                    let AVG_MM_RET_AMT= Math.round((AVG_MM_PAY_AMT + AVG_MM_BONUS_AMT + AVG_MM_ANN_AMT) / dDaySum);
                    SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                    //numavg_monthly_retire_amt.Value = Math.Round((numavg_monthly_pay_amt.Value + numavg_monthly_bonus_amt.Value + numavg_monthly_annual_amt.Value) / dDaySum);
                }
                if (dDaySumNorm != 0)
                {
                    let AVG_MM_RET_AMT_NORM = Math.round((AVG_MM_PAY_AMT_NORM + AVG_MM_BONUS_AMT_NORM + AVG_MM_ANN_AMT_NORM) / dDaySumNorm);
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                    //numavg_monthly_retire_amt_norm.Value = Math.Round((numavg_monthly_pay_amt_norm.Value + numavg_monthly_bonus_amt_norm.Value + numavg_monthly_annual_amt_norm.Value) / dDaySumNorm);
                }
                if (dDaySumPeak != 0)
                {
                    let AVG_MM_RET_AMT_PEAK = Math.round((AVG_MM_PAY_AMT_PEAK + AVG_MM_BONUS_AMT_PEAK + AVG_MM_ANN_AMT_PEAK) / dDaySumPeak);
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                    //numavg_monthly_retire_amt_peak.Value = Math.Round((numavg_monthly_pay_amt_peak.Value + numavg_monthly_bonus_amt_peak.Value + numavg_monthly_annual_amt_peak.Value) / dDaySumPeak);
                }
            }
            else if (cboretire_calc_type.EditValue.ToString() == "RETIRE_P" || cboretire_calc_type.EditValue.ToString() == "MIDDLE_P")
            {

                SBUxMethod.set("AVG_MM_PAY_AMT", dSum);
                SBUxMethod.set("AVG_MM_PAY_AMT_NORM", dSumNorm);
                SBUxMethod.set("AVG_MM_PAY_AMT_PEAK", dSumPeak);

                if (dDaySum != 0)
                {
                    let AVG_MM_RET_AMT= Math.round((AVG_MM_PAY_AMT + AVG_MM_BONUS_AMT + AVG_MM_ANN_AMT) / dDaySum);
                    SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                    //numavg_monthly_retire_amt.Value = Math.Round((numavg_monthly_pay_amt.Value + numavg_monthly_bonus_amt.Value + numavg_monthly_annual_amt.Value) / dDaySum);
                }
                if (dDaySumNorm != 0)
                {
                    let AVG_MM_RET_AMT_NORM = Math.round((AVG_MM_PAY_AMT_NORM + AVG_MM_BONUS_AMT_NORM + AVG_MM_ANN_AMT_NORM) / dDaySumNorm);
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                    //numavg_monthly_retire_amt_norm.Value = Math.Round((numavg_monthly_pay_amt_norm.Value + numavg_monthly_bonus_amt_norm.Value + numavg_monthly_annual_amt_norm.Value) / dDaySumNorm);
                }
                if (dDaySumPeak != 0)
                {
                    let AVG_MM_RET_AMT_PEAK = Math.round((AVG_MM_PAY_AMT_PEAK + AVG_MM_BONUS_AMT_PEAK + AVG_MM_ANN_AMT_PEAK) / dDaySumPeak);
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                    //numavg_monthly_retire_amt_peak.Value = Math.Round((numavg_monthly_pay_amt_peak.Value + numavg_monthly_bonus_amt_peak.Value + numavg_monthly_annual_amt_peak.Value) / dDaySumPeak);
                }
                //numavg_monthly_retire_amt.Value = numavg_monthly_pay_amt.Value + numavg_monthly_bonus_amt.Value + numavg_monthly_annual_amt.Value;
                // numavg_monthly_retire_amt.Value = Math.Round((dSum + numavg_monthly_bonus_amt.Value + numavg_monthly_annual_amt.Value) / Int32.Parse(gvwPay.Columns["apply_days"].SummaryText));
            }
        }
    }

    // 행 추가( 상여내역 리스트 )
    const fn_btnAdd2 = function() {

        let nRow = gvwMasterGrid.getRow();

        if (nRow < 1) {
            nRow = 1; //그리드 로우 첫번째값 셋팅
        }

        let rowData = gvwMasterGrid.getRowData(nRow);

        if (_.isEmpty(rowData) || rowData.RET_CALC_DAT == '' || rowData.RET_CALC_DAT == null)
        {
            gfn_comAlert("Q0000", "정산일이 등록되어있지 않습니다.");
            //SetMessageBox("정산일이 등록되어있지 않습니다.");
            return;
        }

        let rowVal = gvwBonusGrid.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwBonusGrid.addRow(true);
        }else{
            gvwBonusGrid.insertRow(rowVal);

        }
    }

    // 행삭제( 상여내역 리스트 )
    const fn_btnDel2 = async function () {

        let rowVal = gvwBonusGrid.getRow();

        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwBonusGrid.deleteRow(rowVal);

            // 삭제시 적용금액의 합계 / 12 을 평균상여에 넣어줌

            /* let _monthly_pay_amt = 0;
             _monthly_pay_amt = Convert.ToDecimal(gvwPay.Columns["apply_amt"].SummaryText);*/
            // 삭제시 적용금액의 합계 / 3 을 평균급여에 넣어줌
            let dSum = 0;
            let dSumNorm = 0;
            let dSumPeak = 0;

            let alldata = gvwBonusGrid.getGridDataAll();

            alldata.forEach((item,index) => {

                if (_.isEqual(item.PEAK_YN, 'N')){
                    dSum += Number(item.APPLY_AMT);
                    dSumNorm += Number(item.APPLY_AMT);
                }else{
                    dSumPeak += Number(item.APPLY_AMT);
                }
            });


            let dDaySum = 0;
            let dDaySumPeak = 0;
            let dDaySumNorm = 0;

            let gridPay = gvwPayGrid.getGridDataAll();

            gridPay.forEach((item,index) =>{
                if (item.PEAK_YN == 'N')
                {
                    dDaySum += item.APPLY_DAYS;
                    dDaySumNorm += item.APPLY_DAYS;
                }
                else
                {
                    dDaySumPeak += item.APPLY_DAYS;
                }
            });

            let AVG_MM_PAY_AMT	        = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT"))); //평균급여, numavg_monthly_pay_amt
            let AVG_MM_PAY_AMT_NORM	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT_NORM"))); //평균급여, numavg_monthly_pay_amt_norm
            let AVG_MM_PAY_AMT_PEAK	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT_PEAK"))); //평균급여, numavg_monthly_pay_amt_peak

            let AVG_MM_BONUS_AMT	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT"))); //평균상여, numavg_monthly_bonus_amt
            let AVG_MM_BONUS_AMT_NORM	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT_NORM"))); //평균상여, numavg_monthly_bonus_amt_norm
            let AVG_MM_BONUS_AMT_PEAK	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT_PEAK"))); //평균상여, numavg_monthly_bonus_amt_peak

            let AVG_MM_ANN_AMT	        = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT"))); //평균연차수당, numavg_monthly_annual_amt
            let AVG_MM_ANN_AMT_NORM 	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT_NORM"))); //평균연차수당, numavg_monthly_annual_amt_norm
            let AVG_MM_ANN_AMT_PEAK 	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT_PEAK"))); //평균연차수당, numavg_monthly_annual_amt_peak

            let RET_CALC_TYPE		= gfnma_multiSelectGet('#SRCH_RET_CALC_TYPE'); //퇴직정산구분

            if (_.isEqual(RET_CALC_TYPE, 'RETIRE') || _.isEqual(RET_CALC_TYPE, 'MIDDLE')){

                SBUxMethod.set("AVG_MM_BONUS_AMT", 			    Math.floor(dSum / 4)); //평균상여
                SBUxMethod.set("AVG_MM_BONUS_AMT_NORM", 	    Math.floor(dSumNorm / 4)); //평균상여
                SBUxMethod.set("AVG_MM_BONUS_AMT_PEAK", 		Math.Floor(dSumPeak / 4)); //평균상여

                if (dDaySum != 0)
                {
                    let AVG_MM_RET_AMT= Math.round((AVG_MM_PAY_AMT + AVG_MM_BONUS_AMT + AVG_MM_ANN_AMT) / dDaySum);
                    SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                    //numavg_monthly_retire_amt.Value = Math.Floor((numavg_monthly_pay_amt.Value + numavg_monthly_bonus_amt.Value + numavg_monthly_annual_amt.Value) / dDaySum);
                }

                if (dDaySumNorm != 0)
                {
                    let AVG_MM_RET_AMT_NORM = Math.round((AVG_MM_PAY_AMT_NORM + AVG_MM_BONUS_AMT_NORM + AVG_MM_ANN_AMT_NORM) / dDaySumNorm);
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                    //numavg_monthly_retire_amt_norm.Value = Math.Floor((numavg_monthly_pay_amt_norm.Value + numavg_monthly_bonus_amt_norm.Value + numavg_monthly_annual_amt_norm.Value) / dDaySumNorm);
                }

                if (dDaySumPeak != 0)
                {
                    let AVG_MM_RET_AMT_PEAK = Math.round((AVG_MM_PAY_AMT_PEAK + AVG_MM_BONUS_AMT_PEAK + AVG_MM_ANN_AMT_PEAK) / dDaySumPeak);
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                    //numavg_monthly_retire_amt_peak.Value = Math.Floor((numavg_monthly_pay_amt_peak.Value + numavg_monthly_bonus_amt_peak.Value + numavg_monthly_annual_amt_peak.Value) / dDaySumPeak);
                }
            }
            else if (RET_CALC_TYPE == 'RETIRE_P' || RET_CALC_TYPE == 'MIDDLE_P') {

                SBUxMethod.set("AVG_MM_BONUS_AMT", 			    Math.floor(dSum / 4)); //평균상여
                SBUxMethod.set("AVG_MM_BONUS_AMT_NORM", 	    Math.floor(dSumNorm / 4)); //평균상여
                SBUxMethod.set("AVG_MM_BONUS_AMT_PEAK", 		Math.Floor(dSumPeak / 4)); //평균상여

                if (dDaySum != 0)
                {
                    let AVG_MM_RET_AMT= Math.round((AVG_MM_PAY_AMT + AVG_MM_BONUS_AMT + AVG_MM_ANN_AMT) / dDaySum);
                    SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                    //numavg_monthly_retire_amt.Value = Math.Floor((numavg_monthly_pay_amt.Value + numavg_monthly_bonus_amt.Value + numavg_monthly_annual_amt.Value) / dDaySum);
                }

                if (dDaySumNorm != 0)
                {
                    let AVG_MM_RET_AMT_NORM = Math.round((AVG_MM_PAY_AMT_NORM + AVG_MM_BONUS_AMT_NORM + AVG_MM_ANN_AMT_NORM) / dDaySumNorm);
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                    //numavg_monthly_retire_amt_norm.Value = Math.Floor((numavg_monthly_pay_amt_norm.Value + numavg_monthly_bonus_amt_norm.Value + numavg_monthly_annual_amt_norm.Value) / dDaySumNorm);
                }

                if (dDaySumPeak != 0)
                {
                    let AVG_MM_RET_AMT_PEAK = Math.round((AVG_MM_PAY_AMT_PEAK + AVG_MM_BONUS_AMT_PEAK + AVG_MM_ANN_AMT_PEAK) / dDaySumPeak);
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                    //numavg_monthly_retire_amt_peak.Value = Math.Floor((numavg_monthly_pay_amt_peak.Value + numavg_monthly_bonus_amt_peak.Value + numavg_monthly_annual_amt_peak.Value) / dDaySumPeak);
                }
            }
        }
    }

    // 행 추가( 임금 환산 년수 리스트 )
    const fn_btnAdd3 = function() {
        let rowVal = gvwChangeGrid.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwChangeGrid.addRow(true);
        }else{
            gvwChangeGrid.insertRow(rowVal);
        }
    }

    // 행삭제( 임금 환산 년수 리스트 )
    const fn_btnDel3 = async function () {

        let rowVal = gvwChangeGrid.getRow();

        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwChangeGrid.deleteRow(rowVal);
        }
    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let SITE_CODE           = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        //let RET_CALC_TYPE = gfnma_nvl(SBUxMethod.get("SRCH_RET_CALC_TYPE")); //퇴직정산구분
        let RET_CALC_TYPE		= gfnma_multiSelectGet('#SRCH_RET_CALC_TYPE');
        let RETIRE_CALC_DATE_FR = gfnma_nvl(SBUxMethod.get("SRCH_RETIRE_CALC_DATE_FR")); //정산종료일
        let RETIRE_CALC_DATE_TO = gfnma_nvl(SBUxMethod.get("SRCH_RETIRE_CALC_DATE_TO")); //정산종료일
        let EMP_CODE            = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사번
        let EMP_NAME            = gfnma_nvl(SBUxMethod.get("SRCH_EMP_NAME")); //이름
        let RET_CALC_DAT        = gfnma_nvl(SBUxMethod.get("SRCH_RET_CALC_DAT")); //정산일
        let CALCULATE_TAX_YN    = gfnma_nvl(SBUxMethod.get("SRCH_CALCULATE_TAX_YN")); //과세계산여부
        let CALCULATE_PREV_YN   = gfnma_nvl(SBUxMethod.get("SRCH_CALCULATE_PREV_YN")); //중간지급 포함

        if (!RET_CALC_TYPE) {
            gfn_comAlert("W0002", "퇴직정산구분");
            return;
        }
        if (!RETIRE_CALC_DATE_FR) {
            gfn_comAlert("W0002", "정산종료일");
            return;
        }
        if (!RETIRE_CALC_DATE_TO) {
            gfn_comAlert("W0002", "정산종료일");
            return;
        }
        if (!RET_CALC_DAT) {
            gfn_comAlert("W0002", "정산일");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_RET_CALC_DAT_FR : RETIRE_CALC_DATE_FR
            ,V_P_RET_CALC_DAT_TO : RETIRE_CALC_DATE_TO
            ,V_P_RET_CALC_TYPE   : RET_CALC_TYPE
            ,V_P_SITE_CODE       : SITE_CODE
            ,V_P_EMP_CODE        : EMP_CODE
            ,V_P_EMP_NAME        : EMP_NAME

            //-- 평균임금 계산
            ,V_P_RET_CALC_DAT    : RET_CALC_DAT
            ,V_P_CALC_ST_DAT     : ''
            ,V_P_CALC_END_DAT    : ''

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/ret/selectHra5150List.do", {
            getType				: 'json',
            workType			: 'EMP',
            cv_count			: '9',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {


                /** @type {number} **/
                let totalRecordCount = 0;

                jsonMasterList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN		        : gfnma_nvl(item.CHK_YN),
                        DEPT_CODE		    : gfnma_nvl(item.DEPT_CODE),
                        DEPT_NAME		    : gfnma_nvl(item.DEPT_NAME),
                        EMP_CODE		    : gfnma_nvl(item.EMP_CODE),
                        EMP_NAME		    : gfnma_nvl(item.EMP_NAME),
                        RET_CALC_CONFIRM_YN	: gfnma_nvl(item.RET_CALC_CONFIRM_YN),
                        SITE_CODE		    : gfnma_nvl(item.SITE_CODE),
                        ENTER_DATE		    : gfnma_nvl(item.ENTER_DATE),
                        RET_CALC_TYPE		: gfnma_nvl(item.RET_CALC_TYPE),
                        RET_CALC_DAT		: gfnma_nvl(item.RET_CALC_DAT),
                        JOB_GROUP		    : gfnma_nvl(item.JOB_GROUP),
                        AVG_PAY_TYPE		: gfnma_nvl(item.AVG_PAY_TYPE),

                    }
                    jsonMasterList.push(msg);
                    totalRecordCount ++;
                });

                gvwMasterGrid.rebuild();
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

        let nRow = gvwMasterGrid.getRow();

        if (nRow == -1) {
            nRow = 1; //그리드 로우 첫번째값 셋팅
        } else if (nRow == 0) {
            return;
        }

        let rowData = gvwMasterGrid.getRowData(nRow);

        if (_.isEmpty(rowData)){
            return;
        }

        strjob_group = rowData.JOB_GROUP;
        stravg_pay_type = rowData.AVG_PAY_TYPE;


        let SITE_CODE = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        //let RET_CALC_TYPE = gfnma_nvl(SBUxMethod.get("SRCH_RET_CALC_TYPE")); //퇴직정산구분
        let RET_CALC_TYPE = gfnma_multiSelectGet('#SRCH_RET_CALC_TYPE');
        let RETIRE_CALC_DATE_FR = gfnma_nvl(SBUxMethod.get("SRCH_RETIRE_CALC_DATE_FR")); //정산종료일
        let RETIRE_CALC_DATE_TO = gfnma_nvl(SBUxMethod.get("SRCH_RETIRE_CALC_DATE_TO")); //정산종료일
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사번
        let EMP_NAME = gfnma_nvl(SBUxMethod.get("SRCH_EMP_NAME")); //이름
        let RET_CALC_DAT = gfnma_nvl(SBUxMethod.get("SRCH_RET_CALC_DAT")); //정산일
        let CALCULATE_TAX_YN = gfnma_nvl(SBUxMethod.get("SRCH_CALCULATE_TAX_YN")); //과세계산여부
        let CALCULATE_PREV_YN = gfnma_nvl(SBUxMethod.get("SRCH_CALCULATE_PREV_YN")); //중간지급 포함

        if (!RET_CALC_TYPE) {
            gfn_comAlert("W0002", "퇴직정산구분");
            return;
        }
        if (!RETIRE_CALC_DATE_FR) {
            gfn_comAlert("W0002", "정산종료일");
            return;
        }
        if (!RETIRE_CALC_DATE_TO) {
            gfn_comAlert("W0002", "정산종료일");
            return;
        }
        if (!RET_CALC_DAT) {
            gfn_comAlert("W0002", "정산일");
            return;
        }

        await fn_clearForm();


        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_RET_CALC_DAT_FR: RETIRE_CALC_DATE_FR
            , V_P_RET_CALC_DAT_TO: RETIRE_CALC_DATE_TO
            , V_P_RET_CALC_TYPE: RET_CALC_TYPE
            , V_P_SITE_CODE: SITE_CODE
            , V_P_EMP_CODE: rowData.EMP_CODE
            , V_P_EMP_NAME: EMP_NAME

            //-- 평균임금 계산
            , V_P_RET_CALC_DAT: rowData.RET_CALC_DAT
            , V_P_CALC_ST_DAT: ''
            , V_P_CALC_END_DAT: ''

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/ret/selectHra5150List.do", {
            getType: 'json',
            workType: 'DETAIL',
            cv_count: '9',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                //- [0] 정산 기본 정보
                data.cv_2.forEach((item, index) => {
                    SBUxMethod.set("RET_CALC_DAT", gfnma_nvl(item.RET_CALC_DAT));
                    SBUxMethod.set("RET_CALC_TYPE1", gfnma_nvl(item.RET_CALC_TYPE));
                    SBUxMethod.set("EMP_CODE", gfnma_nvl(item.EMP_CODE));
                    SBUxMethod.set("EMP_NAME", gfnma_nvl(item.EMP_NAME));
                    SBUxMethod.set("ENTER_DATE", gfnma_nvl(item.ENTER_DATE));
                    SBUxMethod.set("LAST_CALC_DAT", gfnma_nvl(item.LAST_CALC_DAT));
                    SBUxMethod.set("RET_DAT", gfnma_nvl(item.RET_DAT));
                    SBUxMethod.set("CALC_ST_DAT", gfnma_nvl(item.CALC_ST_DAT));
                    SBUxMethod.set("CALC_END_DAT", gfnma_nvl(item.CALC_END_DAT));
                    SBUxMethod.set("PEAK_START_DATE", gfnma_nvl(item.PEAK_START_DATE));
                    SBUxMethod.set("PEAK_CALC_START_DATE", gfnma_nvl(item.PEAK_CALC_START_DATE));
                    SBUxMethod.set("PEAK_CALC_END_DATE", gfnma_nvl(item.PEAK_CALC_END_DATE));
                    SBUxMethod.set("PEAK_PAY_START_DATE", gfnma_nvl(item.PEAK_PAY_START_DATE));
                    SBUxMethod.set("PEAK_PAY_END_DATE", gfnma_nvl(item.PEAK_PAY_END_DATE));
                    SBUxMethod.set("PEAK_BONUS_START_DATE", gfnma_nvl(item.PEAK_BONUS_START_DATE));
                    SBUxMethod.set("PEAK_BONUS_END_DATE", gfnma_nvl(item.PEAK_BONUS_END_DATE));
                    SBUxMethod.set("NORM_CALC_START_DATE", gfnma_nvl(item.NORM_CALC_START_DATE));
                    SBUxMethod.set("NORM_CALC_END_DATE", gfnma_nvl(item.NORM_CALC_END_DATE));
                    SBUxMethod.set("NORM_PAY_START_DATE", gfnma_nvl(item.NORM_PAY_START_DATE));
                    SBUxMethod.set("NORM_PAY_END_DATE", gfnma_nvl(item.NORM_PAY_END_DATE));
                    SBUxMethod.set("NORM_BONUS_START_DATE", gfnma_nvl(item.NORM_BONUS_START_DATE));
                    SBUxMethod.set("NORM_BONUS_END_DATE", gfnma_nvl(item.NORM_BONUS_END_DATE));
                    /*SBUxMethod.set("RET_REASON", 			    gfnma_nvl(item.RET_REASON));*/
                    gfnma_multiSelectSet('#RET_REASON', 'SUB_CODE', 'CODE_NAME', gfnma_nvl(item.RET_REASON));
                    SBUxMethod.set("RET_PENS_ST_DAT", gfnma_nvl(item.RET_PENS_ST_DAT));
                    SBUxMethod.set("EXEC_YN", gfnma_nvl(item.EXEC_YN));
                    SBUxMethod.set("EXEC_RET_PAY_AMT", gfnma_nvl(item.EXEC_RET_PAY_AMT));
                    SBUxMethod.set("JOB_ST_DAT", gfnma_nvl(item.JOB_ST_DAT));
                    SBUxMethod.set("JOB_END_DAT", gfnma_nvl(item.JOB_END_DAT));
                    SBUxMethod.set("WORKING_DAY_CNT", gfnma_nvl(item.WORKING_DAY_CNT));
                    SBUxMethod.set("WORKING_DAY_CNT_NORM", gfnma_nvl(item.WORKING_DAY_CNT_NORM));
                    SBUxMethod.set("WORKING_DAY_CNT_PEAK", gfnma_nvl(item.WORKING_DAY_CNT_PEAK));
                    SBUxMethod.set("WORKING_DAY_CNT2", gfnma_nvl(item.WORKING_DAY_CNT2));
                    SBUxMethod.set("WORKING_DAY_CNT2_NORM", gfnma_nvl(item.WORKING_DAY_CNT2_NORM));
                    SBUxMethod.set("WORKING_DAY_CNT2_PEAK", gfnma_nvl(item.WORKING_DAY_CNT2_PEAK));
                    // -- 일단 화면에 보이지 않고 숨겨두고 바인딩.
                    SBUxMethod.set("LIVE_YN", gfnma_nvl(item.LIVE_YN));
                    SBUxMethod.set("LIVE_NATION_CODE", gfnma_nvl(item.LIVE_NATION_CODE));
                    SBUxMethod.set("TO_DC_YN", gfnma_nvl(item.TO_DC_YN));


                    /* //회계처리( 퇴직일자)
                     SBUxMethod.set("PAY_DATE", gfnma_nvl(item.CALC_END_DAT));
                     //회계처리( 귀속년월)
                     SBUxMethod.set("PAY_YYYYMM", gfnma_nvl(item.CALC_END_DAT));*/
                });

                /*-- [TAB1] 퇴직급여 현황
                  -- [1-1] 평균임금계산 및 제외월수, 가산월수
                  -- [1-4] 퇴직급여현황*/
                data.cv_3.forEach((item, index) => {
                    SBUxMethod.set("ANN_BENEFIT_AMT", gfnma_nvl(item.ANN_BENEFIT_AMT));
                    SBUxMethod.set("PAY_MULTIPLE_NUMBER", gfnma_nvl(item.PAY_MULTIPLE_NUMBER));
                    SBUxMethod.set("CUMULATIVE_DAY_CNT", gfnma_nvl(item.CUMULATIVE_DAY_CNT));
                    SBUxMethod.set("BEF_3MM_DAY_CNT", gfnma_nvl(item.BEF_3MM_DAY_CNT));
                    SBUxMethod.set("BEF_3MM_DAY_CNT_NORM", gfnma_nvl(item.BEF_3MM_DAY_CNT_NORM));
                    SBUxMethod.set("BEF_3MM_DAY_CNT_PEAK", gfnma_nvl(item.BEF_3MM_DAY_CNT_PEAK));
                    SBUxMethod.set("RET_BONUS_ETC", gfnma_nvl(item.RET_BONUS_ETC));
                    SBUxMethod.set("AVG_MM_PAY_AMT", gfnma_nvl(item.AVG_MM_PAY_AMT));
                    SBUxMethod.set("AVG_MM_BONUS_AMT", gfnma_nvl(item.AVG_MM_BONUS_AMT));
                    SBUxMethod.set("AVG_MM_ANN_AMT", gfnma_nvl(item.AVG_MM_ANN_AMT));
                    SBUxMethod.set("AVG_MM_RET_AMT", gfnma_nvl(item.AVG_MM_RET_AMT));
                    SBUxMethod.set("ANN_BENEFIT_AMT_NORM", gfnma_nvl(item.ANN_BENEFIT_AMT_NORM));
                    SBUxMethod.set("AVG_MM_PAY_AMT_NORM", gfnma_nvl(item.AVG_MM_PAY_AMT_NORM));
                    SBUxMethod.set("AVG_MM_BONUS_AMT_NORM", gfnma_nvl(item.AVG_MM_BONUS_AMT_NORM));
                    SBUxMethod.set("AVG_MM_ANN_AMT_NORM", gfnma_nvl(item.AVG_MM_ANN_AMT_NORM));
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", gfnma_nvl(item.AVG_MM_RET_AMT_NORM));
                    SBUxMethod.set("ANN_BENEFIT_AMT_PEAK", gfnma_nvl(item.ANN_BENEFIT_AMT_PEAK));
                    SBUxMethod.set("AVG_MM_PAY_AMT_PEAK", gfnma_nvl(item.AVG_MM_PAY_AMT_PEAK));
                    SBUxMethod.set("AVG_MM_BONUS_AMT_PEAK", gfnma_nvl(item.AVG_MM_BONUS_AMT_PEAK));
                    SBUxMethod.set("AVG_MM_ANN_AMT_PEAK", gfnma_nvl(item.AVG_MM_ANN_AMT_PEAK));
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", gfnma_nvl(item.AVG_MM_RET_AMT_PEAK));
                    SBUxMethod.set("EXCP_MM_BEF_CNT", gfnma_nvl(item.EXCP_MM_BEF_CNT));
                    SBUxMethod.set("EXCP_MM_AFT_CNT", gfnma_nvl(item.EXCP_MM_AFT_CNT));
                    SBUxMethod.set("ADD_MM_BEF_CNT", gfnma_nvl(item.ADD_MM_BEF_CNT));
                    SBUxMethod.set("ADD_MM_AFT_CNT", gfnma_nvl(item.ADD_MM_AFT_CNT));
                    SBUxMethod.set("PREV_COM_NAME", gfnma_nvl(item.PREV_COM_NAME));
                    SBUxMethod.set("PREV_COM_NUM", gfnma_nvl(item.PREV_COM_NUM));
                    SBUxMethod.set("PREV_RETIRE_INC_AMT", gfnma_nvl(item.PREV_RETIRE_INC_AMT));
                    SBUxMethod.set("PREV_TXFREE_RET_INC_AMT", gfnma_nvl(item.PREV_TXFREE_RET_INC_AMT));
                    SBUxMethod.set("PREV_TX_RET_INC_AMT", gfnma_nvl(item.PREV_TX_RET_INC_AMT));
                    SBUxMethod.set("COMP_NAME", gfnma_nvl(item.COMP_NAME));
                    SBUxMethod.set("BIZ_REGNO", gfnma_nvl(item.BIZ_REGNO));
                    SBUxMethod.set("RET_INC_AMT", gfnma_nvl(item.RET_INC_AMT));
                    SBUxMethod.set("TXFREE_RET_INC_AMT", gfnma_nvl(item.TXFREE_RET_INC_AMT));
                    SBUxMethod.set("TX_RET_INC_AMT", gfnma_nvl(item.TX_RET_INC_AMT));
                    SBUxMethod.set("TOT_RET_INC_AMT", gfnma_nvl(item.TOT_RET_INC_AMT));
                    SBUxMethod.set("TOT_TXFREE_RET_INC_AMT", gfnma_nvl(item.TOT_TXFREE_RET_INC_AMT));
                    SBUxMethod.set("INSURANCE_RETIRE_CHG", gfnma_nvl(item.INSURANCE_RETIRE_CHG));
                    SBUxMethod.set("RETIRE_ESTIMATE_AMT", gfnma_nvl(item.RETIRE_ESTIMATE_AMT));
                    SBUxMethod.set("WORKING_DAY_CNT", gfnma_nvl(item.WORKING_DAY_CNT));
                    SBUxMethod.set("WORKING_DAY_CNT_NORM", gfnma_nvl(item.WORKING_DAY_CNT_NORM));
                    SBUxMethod.set("WORKING_DAY_CNT_PEAK", gfnma_nvl(item.WORKING_DAY_CNT_PEAK));
                    SBUxMethod.set("WORKING_DAY_CNT2", gfnma_nvl(item.WORKING_DAY_CNT2));
                    SBUxMethod.set("WORKING_DAY_CNT2_NORM", gfnma_nvl(item.WORKING_DAY_CNT2_NORM));
                    SBUxMethod.set("WORKING_DAY_CNT2_PEAK", gfnma_nvl(item.WORKING_DAY_CNT2_PEAK));
                });

                //-- [1-2] 평균임금 계산 - 급여내역
                jsonPayList.length = 0;
                data.cv_4.forEach((item, index) => {
                    const msg = {
                        PEAK_YN: gfnma_nvl(item.PEAK_YN),
                        PAY_YYYYMM: gfnma_nvl(item.PAY_YYYYMM),
                        BASE_PAY_AMT: gfnma_nvl(item.BASE_PAY_AMT),
                        ALLOWANCE_AMT: gfnma_nvl(item.ALLOWANCE_AMT),
                        PAY_AMT: gfnma_nvl(item.PAY_AMT),
                        ST_DAT: gfnma_nvl(item.ST_DAT),
                        END_DAT: gfnma_nvl(item.END_DAT),
                        APPLY_DAYS: gfnma_nvl(item.APPLY_DAYS),
                        APPLY_AMT: gfnma_nvl(item.APPLY_AMT),

                    }
                    jsonPayList.push(msg);
                });

                gvwPayGrid.rebuild();

                if (jsonPayList.length > 0) {
                    jsonPayList.forEach((item, index) => {
                        gvwPayGrid.setCellDisabled(index + 1, 1, index + 1, 1, true, false, true);
                    })
                }

                //[1-3] 평균임금 계산 - 상여내역
                jsonBonusList.length = 0;
                data.cv_5.forEach((item, index) => {
                    const msg = {
                        PEAK_YN: gfnma_nvl(item.PEAK_YN),
                        PAY_YYYYMM: gfnma_nvl(item.PAY_YYYYMM),
                        PAY_DATE: gfnma_nvl(item.PAY_DATE),
                        PAY_ITEM_CODE: gfnma_nvl(item.PAY_ITEM_CODE),
                        PAY_AMT: gfnma_nvl(item.PAY_AMT),
                        APPLY_AMT: gfnma_nvl(item.APPLY_AMT),

                    }
                    jsonBonusList.push(msg);
                });

                gvwBonusGrid.rebuild();

                //[TAB2] 퇴직소득세액계산
                data.cv_6.forEach((item, index) => {
                    SBUxMethod.set("PREV_ENTER_DAT", gfnma_nvl(item.PREV_ENTER_DAT));
                    SBUxMethod.set("PREV_RET_INITIAL_DAT", gfnma_nvl(item.PREV_RET_INITIAL_DAT));
                    SBUxMethod.set("PREV_RETIRE_DAT", gfnma_nvl(item.PREV_RETIRE_DAT));
                    SBUxMethod.set("PREV_RET_PAY_DATE", gfnma_nvl(item.PREV_RET_PAY_DATE));
                    SBUxMethod.set("PREV_WORKING_MM_CNT", gfnma_nvl(item.PREV_WORKING_MM_CNT));
                    SBUxMethod.set("PREV_EXCP_MM_CNT", gfnma_nvl(item.PREV_EXCP_MM_CNT));
                    SBUxMethod.set("PREV_ADD_MM_CNT", gfnma_nvl(item.PREV_ADD_MM_CNT));
                    SBUxMethod.set("PREV_WORKING_YEAR_CNT", gfnma_nvl(item.PREV_WORKING_YEAR_CNT));
                    SBUxMethod.set("ENTER_DAT", gfnma_nvl(item.ENTER_DAT));
                    SBUxMethod.set("CALC_ST_DAT", gfnma_nvl(item.CALC_ST_DAT));
                    SBUxMethod.set("RET_DAT", gfnma_nvl(item.RET_DAT));
                    SBUxMethod.set("PAY_DATE1", gfnma_nvl(item.PAY_DATE));
                    SBUxMethod.set("WORKING_MM_CNT", gfnma_nvl(item.WORKING_MM_CNT));
                    SBUxMethod.set("WORKING_MM_CNT_PEAK", gfnma_nvl(item.WORKING_MM_CNT_PEAK));
                    SBUxMethod.set("WORKING_MM_CNT_NORM", gfnma_nvl(item.WORKING_MM_CNT_NORM));
                    SBUxMethod.set("EXCP_MM_CNT", gfnma_nvl(item.EXCP_MM_CNT));
                    SBUxMethod.set("ADD_MM_CNT", gfnma_nvl(item.ADD_MM_CNT));
                    SBUxMethod.set("WORKING_YEAR_CNT", gfnma_nvl(item.WORKING_YEAR_CNT));
                    SBUxMethod.set("WORKING_YEAR_CNT_PEAK", gfnma_nvl(item.WORKING_YEAR_CNT_PEAK));
                    SBUxMethod.set("WORKING_YEAR_CNT_NORM", gfnma_nvl(item.WORKING_YEAR_CNT_NORM));
                    SBUxMethod.set("TOT_CALC_ST_DAT", gfnma_nvl(item.TOT_CALC_ST_DAT));
                    SBUxMethod.set("TOT_RET_DAT", gfnma_nvl(item.TOT_RET_DAT));
                    SBUxMethod.set("TOT_WORKING_MM_CNT", gfnma_nvl(item.TOT_WORKING_MM_CNT));
                    SBUxMethod.set("TOT_EXCP_MM_CNT", gfnma_nvl(item.TOT_EXCP_MM_CNT));
                    SBUxMethod.set("TOT_ADD_MM_CNT", gfnma_nvl(item.TOT_ADD_MM_CNT));
                    SBUxMethod.set("TOT_OVERLAP_MM_CNT", gfnma_nvl(item.TOT_OVERLAP_MM_CNT));
                    SBUxMethod.set("TOT_WORKING_YEAR_CNT", gfnma_nvl(item.TOT_WORKING_YEAR_CNT));
                    SBUxMethod.set("TOT_CALC_ST_DAT_BEF", gfnma_nvl(item.TOT_CALC_ST_DAT_BEF));
                    SBUxMethod.set("TOT_RET_DAT_BEF", gfnma_nvl(item.TOT_RET_DAT_BEF));
                    SBUxMethod.set("TOT_WORKING_MM_CNT_BEF", gfnma_nvl(item.TOT_WORKING_MM_CNT_BEF));
                    SBUxMethod.set("TOT_EXCP_MM_CNT_BEF", gfnma_nvl(item.TOT_EXCP_MM_CNT_BEF));
                    SBUxMethod.set("TOT_ADD_MM_CNT_BEF", gfnma_nvl(item.TOT_ADD_MM_CNT_BEF));
                    SBUxMethod.set("TOT_WORKING_YEAR_CNT_BEF", gfnma_nvl(item.TOT_WORKING_YEAR_CNT_BEF));
                    SBUxMethod.set("TOT_CALC_ST_DAT_AFT", gfnma_nvl(item.TOT_CALC_ST_DAT_AFT));
                    SBUxMethod.set("TOT_RET_DAT_AFT", gfnma_nvl(item.TOT_RET_DAT_AFT));
                    SBUxMethod.set("TOT_WORKING_MM_CNT_AFT", gfnma_nvl(item.TOT_WORKING_MM_CNT_AFT));
                    SBUxMethod.set("TOT_EXCP_MM_CNT_AFT", gfnma_nvl(item.TOT_EXCP_MM_CNT_AFT));
                    SBUxMethod.set("TOT_ADD_MM_CNT_AFT", gfnma_nvl(item.TOT_ADD_MM_CNT_AFT));
                    SBUxMethod.set("TOT_WORKING_YEAR_CNT_AFT", gfnma_nvl(item.TOT_WORKING_YEAR_CNT_AFT));

                    //--퇴직소득과세표준계산(2015.12.31 이전 계산방법)
                    SBUxMethod.set("PREV_RET_PAY_AMT", gfnma_nvl(item.PREV_RET_PAY_AMT));
                    SBUxMethod.set("RET_PAY_AMT", gfnma_nvl(item.RET_PAY_AMT));
                    SBUxMethod.set("TOT_RET_PAY_AMT1", gfnma_nvl(item.TOT_RET_PAY_AMT));
                    SBUxMethod.set("TOT_RET_FX_R_DEDUCT", gfnma_nvl(item.TOT_RET_FX_R_DEDUCT));
                    SBUxMethod.set("TOT_WORKING_CNT_DEDUCT1", gfnma_nvl(item.TOT_WORKING_CNT_DEDUCT));
                    SBUxMethod.set("TOT_RET_PAY_TX_STD_AMT", gfnma_nvl(item.TOT_RET_PAY_TX_STD_AMT));

                    // --퇴직소득과세표준계산(2016.01.01 이후 계산방법)
                    SBUxMethod.set("TOT_RET_PAY_AMT", gfnma_nvl(item.TOT_RET_PAY_AMT));
                    SBUxMethod.set("TOT_WORKING_CNT_DEDUCT", gfnma_nvl(item.TOT_WORKING_CNT_DEDUCT));
                    SBUxMethod.set("CONV_INC_AMT_2016", gfnma_nvl(item.CONV_INC_AMT_2016));
                    SBUxMethod.set("CONV_INC_DEDUCT_2016", gfnma_nvl(item.CONV_INC_DEDUCT_2016));
                    SBUxMethod.set("RET_PAY_TX_STD_AMT_2016", gfnma_nvl(item.RET_PAY_TX_STD_AMT_2016));

                    // --퇴직소득세액계산 (2015.12.31 이전 계산방법)
                    SBUxMethod.set("RET_PAY_TX_STD_BEF", gfnma_nvl(item.RET_PAY_TX_STD_BEF));
                    SBUxMethod.set("RET_PAY_TX_STD_AFT", gfnma_nvl(item.RET_PAY_TX_STD_AFT));
                    SBUxMethod.set("TOT_RET_PAY_TX_STD", gfnma_nvl(item.TOT_RET_PAY_TX_STD));
                    SBUxMethod.set("ANN_AVG_TX_STD_AMT_BEF", gfnma_nvl(item.ANN_AVG_TX_STD_AMT_BEF));
                    SBUxMethod.set("ANN_AVG_TX_STD_AMT_AFT", gfnma_nvl(item.ANN_AVG_TX_STD_AMT_AFT));
                    SBUxMethod.set("TOT_ANN_AVG_TX_STD_AMT", gfnma_nvl(item.TOT_ANN_AVG_TX_STD_AMT));
                    SBUxMethod.set("CONV_TX_STD_AMT_AFT", gfnma_nvl(item.CONV_TX_STD_AMT_AFT));
                    SBUxMethod.set("TOT_CONV_TX_STD_AMT", gfnma_nvl(item.TOT_CONV_TX_STD_AMT));
                    SBUxMethod.set("CONV_CALC_TX_AMT_AFT", gfnma_nvl(item.CONV_CALC_TX_AMT_AFT));
                    SBUxMethod.set("TOT_CONV_CALC_TX_AMT", gfnma_nvl(item.TOT_CONV_CALC_TX_AMT));
                    SBUxMethod.set("ANN_AVG_CALC_TX_AMT_BEF", gfnma_nvl(item.ANN_AVG_CALC_TX_AMT_BEF));
                    SBUxMethod.set("ANN_AVG_CALC_TX_AMT_AFT", gfnma_nvl(item.ANN_AVG_CALC_TX_AMT_AFT));
                    SBUxMethod.set("TOT_ANN_AVG_CALC_TX_AMT", gfnma_nvl(item.TOT_ANN_AVG_CALC_TX_AMT));
                    SBUxMethod.set("CALC_TX_AMT_BEF", gfnma_nvl(item.CALC_TX_AMT_BEF));
                    SBUxMethod.set("CALC_TX_AMT_AFT", gfnma_nvl(item.CALC_TX_AMT_AFT));
                    SBUxMethod.set("TOT_CALC_TX_AMT", gfnma_nvl(item.TOT_CALC_TX_AMT));

                    //--퇴직소득세액계산 (2016.01.01 이후 계산방법)
                    SBUxMethod.set("CONV_CALC_TX_AMT_2016", gfnma_nvl(item.CONV_CALC_TX_AMT_2016));
                    SBUxMethod.set("CALC_TX_AMT_2016", gfnma_nvl(item.CALC_TX_AMT_2016));
                    SBUxMethod.set("PAY_YYYY_RETIRE_DATE", gfnma_nvl(item.PAY_YYYY_RETIRE_DATE));
                    SBUxMethod.set("SPEC_CALC_TX_AMT_AMT_2016", gfnma_nvl(item.SPEC_CALC_TX_AMT_AMT_2016));
                    SBUxMethod.set("INC_PREV_PAID_TX_AMT", gfnma_nvl(item.INC_PREV_PAID_TX_AMT));
                    SBUxMethod.set("INC_TX_AMT", gfnma_nvl(item.INC_TX_AMT));
                });

                // -- [TAB3] 지급내역 및 납부명세
                data.cv_7.forEach((item, index) => {
                    SBUxMethod.set("DEFER_INC_TX_AMT", gfnma_nvl(item.DEFER_INC_TX_AMT));
                    /*SBUxMethod.set("IRP_BANK_CODE",         gfnma_nvl(item.IRP_BANK_CODE));*/
                    gfnma_multiSelectSet('#IRP_BANK_CODE', 'SUB_CODE', 'CODE_NAME', gfnma_nvl(item.IRP_BANK_CODE));
                    SBUxMethod.set("IRP_BANK_NAME", gfnma_nvl(item.IRP_BANK_NAME));
                    SBUxMethod.set("IRP_BIZ_REGNO", gfnma_nvl(item.IRP_BIZ_REGNO));
                    SBUxMethod.set("IRP_BANK_ACC", gfnma_nvl(item.IRP_BANK_ACC));
                    SBUxMethod.set("RET_PENS_END_DAT", gfnma_nvl(item.RET_PENS_END_DAT));
                    SBUxMethod.set("RET_PENS_AMT", gfnma_nvl(item.RET_PENS_AMT));
                    SBUxMethod.set("DEFER_RET_INC_AMT", gfnma_nvl(item.DEFER_RET_INC_AMT));
                    SBUxMethod.set("DEFER_RET_TX_AMT", gfnma_nvl(item.DEFER_RET_TX_AMT));
                    SBUxMethod.set("INC_RET_TX_AMT", gfnma_nvl(item.INC_RET_TX_AMT));
                    SBUxMethod.set("LOCAL_RET_TX_AMT", gfnma_nvl(item.LOCAL_RET_TX_AMT));
                    SBUxMethod.set("SPEC_RET_TX_AMT", gfnma_nvl(item.SPEC_RET_TX_AMT));
                    SBUxMethod.set("RET_TX_SUM", gfnma_nvl(item.RET_TX_SUM));
                    SBUxMethod.set("INC_DEFER_TX_AMT", gfnma_nvl(item.INC_DEFER_TX_AMT));
                    SBUxMethod.set("LOCAL_DEFER_TX_AMT", gfnma_nvl(item.LOCAL_DEFER_TX_AMT));
                    SBUxMethod.set("SPEC_DEFER_TX_AMT", gfnma_nvl(item.SPEC_DEFER_TX_AMT));
                    SBUxMethod.set("DEFER_TX_SUM", gfnma_nvl(item.DEFER_TX_SUM));
                    SBUxMethod.set("INC_BALANCE_TX_AMT", gfnma_nvl(item.INC_BALANCE_TX_AMT));
                    SBUxMethod.set("LOCAL_BALANCE_TX_AMT", gfnma_nvl(item.LOCAL_BALANCE_TX_AMT));
                    SBUxMethod.set("SPEC_BALANCE_TX_AMT", gfnma_nvl(item.SPEC_BALANCE_TX_AMT));
                    SBUxMethod.set("BALANCE_TX_SUM", gfnma_nvl(item.BALANCE_TX_SUM));
                    SBUxMethod.set("COM_PAY_AMT", gfnma_nvl(item.COM_PAY_AMT));
                    SBUxMethod.set("PAY_AMT_SUM", gfnma_nvl(item.PAY_AMT_SUM));
                    SBUxMethod.set("REAL_PAY_AMT", gfnma_nvl(item.REAL_PAY_AMT));
                    SBUxMethod.set("BANK_CODE", gfnma_nvl(item.BANK_CODE));
                    SBUxMethod.set("BANK_NAME", gfnma_nvl(item.BANK_NAME));
                    SBUxMethod.set("BANK_ACC", gfnma_nvl(item.BANK_ACC));
                    SBUxMethod.set("BANK_ACC_REAL", gfnma_nvl(item.BANK_ACC_REAL));
                    SBUxMethod.set("BANK_DEPOR", gfnma_nvl(item.BANK_DEPOR));
                    SBUxMethod.set("PENS_BANK_CODE1", gfnma_nvl(item.PENS_BANK_CODE1));
                    SBUxMethod.set("PENSION_BANK_NAME1", gfnma_nvl(item.PENSION_BANK_NAME1));
                    SBUxMethod.set("INSURER1_PAY_AMT", gfnma_nvl(item.INSURER1_PAY_AMT));
                    SBUxMethod.set("PENS_BANK_CODE2", gfnma_nvl(item.PENS_BANK_CODE2));
                    SBUxMethod.set("PENSION_BANK_NAME2", gfnma_nvl(item.PENSION_BANK_NAME2));
                    SBUxMethod.set("INSURER2_PAY_AMT", gfnma_nvl(item.INSURER2_PAY_AMT));
                    SBUxMethod.set("PENS_BANK_CODE3", gfnma_nvl(item.PENS_BANK_CODE3));
                    SBUxMethod.set("PENSION_BANK_NAME3", gfnma_nvl(item.PENSION_BANK_NAME3));
                    SBUxMethod.set("INSURER3_PAY_AMT", gfnma_nvl(item.INSURER3_PAY_AMT));
                    SBUxMethod.set("DIFF_AMT", gfnma_nvl(item.DIFF_AMT));
                    SBUxMethod.set("INSURANCE_RETIRE_CHG", gfnma_nvl(item.INSURANCE_RETIRE_CHG));
                    SBUxMethod.set("RETIRE_ESTIMATE_AMT", gfnma_nvl(item.RETIRE_ESTIMATE_AMT));
                    SBUxMethod.set("COMP_TAX_PAY_YN", gfnma_nvl(item.COMP_TAX_PAY_YN));
                });

                // -- [TAB4] 중간정산이력
                data.cv_8.forEach((item, index) => {
                    SBUxMethod.set("RET_CALC_DAT", gfnma_nvl(item.RET_CALC_DAT));
                    gfnma_multiSelectSet('#RET_CALC_TYPE', 'SUB_CODE', 'CODE_NAME', gfnma_nvl(item.RET_CALC_TYPE));
                    //SBUxMethod.set("RET_CALC_TYPE",         gfnma_nvl(item.RET_CALC_TYPE));

                    //-- 퇴직소득과세표준계산 내용
                    SBUxMethod.set("TOT_RET_PAY_AMT", gfnma_nvl(item.TOT_RET_PAY_AMT));
                    SBUxMethod.set("TOT_RET_FX_R_DEDUCT", gfnma_nvl(item.TOT_RET_FX_R_DEDUCT));
                    SBUxMethod.set("TOT_WORKING_CNT_DEDUCT", gfnma_nvl(item.TOT_WORKING_CNT_DEDUCT));
                    SBUxMethod.set("TOT_RET_PAY_TX_STD_AMT", gfnma_nvl(item.TOT_RET_PAY_TX_STD_AMT));

                    // -- 퇴직소득세액계산 내용
                    SBUxMethod.set("TOT_ANN_AVG_TX_STD_AMT", gfnma_nvl(item.TOT_ANN_AVG_TX_STD_AMT));
                    SBUxMethod.set("TOT_CONV_TX_STD_AMT", gfnma_nvl(item.TOT_CONV_TX_STD_AMT));
                    SBUxMethod.set("TOT_CONV_CALC_TX_AMT", gfnma_nvl(item.TOT_CONV_CALC_TX_AMT));
                    SBUxMethod.set("TOT_ANN_AVG_CALC_TX_AMT", gfnma_nvl(item.TOT_ANN_AVG_CALC_TX_AMT));
                    SBUxMethod.set("TOT_CALC_TX_AMT", gfnma_nvl(item.TOT_CALC_TX_AMT));
                    SBUxMethod.set("INC_PREV_PAID_TX_AMT", gfnma_nvl(item.INC_PREV_PAID_TX_AMT));
                    SBUxMethod.set("INC_TX_AMT", gfnma_nvl(item.INC_TX_AMT));

                    //-- 납세명세 내용
                    SBUxMethod.set("INC_DEFER_TX_AMT", gfnma_nvl(item.INC_DEFER_TX_AMT));
                    SBUxMethod.set("INC_BALANCE_TX_AMT", gfnma_nvl(item.INC_BALANCE_TX_AMT));

                });

                //-- [1-4] 평균임금 계산 - 임원 환산 년수 내역
                jsonChangeList.length = 0;
                data.cv_9.forEach((item, index) => {
                    const msg = {
                        EMP_CODE: gfnma_nvl(item.EMP_CODE),
                        POSITION_CODE: gfnma_nvl(item.POSITION_CODE),
                        POSITION_NAME: gfnma_nvl(item.POSITION_NAME),
                        WORK_TERM: gfnma_nvl(item.WORK_TERM),
                        WORK_YMD: gfnma_nvl(item.WORK_YMD),
                        ST_DAT: gfnma_nvl(item.ST_DAT),
                        END_DAT: gfnma_nvl(item.END_DAT),
                        PAY_MULTIPLE_NUMBER: gfnma_nvl(item.PAY_MULTIPLE_NUMBER),
                        DD_TOT_CNT: gfnma_nvl(item.DD_TOT_CNT),
                        CHG_MM_CNT: gfnma_nvl(item.CHG_MM_CNT),
                        YY_CNT: gfnma_nvl(item.YY_CNT),
                        MM_CNT: gfnma_nvl(item.MM_CNT),
                        DD_CNT: gfnma_nvl(item.DD_CNT),
                        PEAK_YN: gfnma_nvl(item.PEAK_YN),
                    }
                    jsonChangeList.push(msg);
                });

                gvwChangeGrid.rebuild();


                SBUxMethod.set("CALCULATE_TAX_YN", 'Y'); //과세 재계산

                fn_searchTabInfo4();
                //fn_searchQ2();

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

    /**
     * 퇴직급여 전표처리 조회 프로시저 (회계처리 TAB)
     */
    const fn_searchTabInfo4 = async function () {

        let tabId = SBUxMethod.get('tabJson');

        let CALC_END_DAT = gfnma_nvl(SBUxMethod.get("CALC_END_DAT")); // 정산종료일
        let CALC_END = CALC_END_DAT == '' ? '' : CALC_END_DAT.slice(0, -2);

        SBUxMethod.set("PAY_YYYYMM", CALC_END); //귀속년월
        SBUxMethod.set("PAY_DATE", CALC_END_DAT); //퇴직일자

        if (_.isEqual(tabId, 'tabInfo4')) {

            if (CALC_END != '') {

                await fn_searchQ2();
                fn_searchQH();

            } else {

                SBUxMethod.set("POSTING_DATE", ''); //회계처리일자
                SBUxMethod.set("POSTING_STATUS", ''); //진행상태
                SBUxMethod.set("DOC_NAME", ''); //전표번호
                SBUxMethod.set("DOC_ID", ''); //
                SBUxMethod.set("MEMO", ''); //메모
                SBUxMethod.set("EXPECTED_PAY_DATE", ''); //지급일

            }
        }
    }

    /**
     * 퇴직급여 전표처리 조회 프로시저 (회계처리 TAB)
     */
    const fn_searchQ2 = async function () {

        let PAY_YYYYMM           = gfnma_nvl(SBUxMethod.get("PAY_YYYYMM")); //귀속년월
        let RET_CALC_TYPE		 = gfnma_multiSelectGet('#RET_CALC_TYPE');//퇴직정산구분
        let PAY_DATE           = gfnma_nvl(SBUxMethod.get("PAY_DATE")); //퇴직일자


        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!RET_CALC_TYPE) {
            gfn_comAlert("W0002", "퇴직정산구분");
            return;
        }

        let nRow = gvwMasterGrid.getRow();

        if (nRow == -1) {
            nRow = 1; //그리드 로우 첫번째값 셋팅
        }else if(nRow == 0){
            return;
        }

        let rowData = gvwMasterGrid.getRowData(nRow);

        if (_.isEmpty(rowData) == false) {

            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                , V_P_LANG_ID: ''
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                , V_P_PAY_YYYYMM: PAY_YYYYMM
                , V_P_PAY_TYPE: RET_CALC_TYPE
                , V_P_PAY_DATE: PAY_DATE
                , V_P_EMP_CODE: rowData.EMP_CODE

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: ''
                , V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/ret/selectHra5150Q2.do", {
                getType: 'json',
                workType: 'Q',
                cv_count: '3',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {


                    /** @type {number} **/
                    let totalRecordCount = 0;


                    data.cv_1.forEach((item, index) => {

                        //SBUxMethod.set("PAY_YYYYMM", 			gfnma_nvl(item.PAY_YYYYMM));
                        //gfnma_multiSelectSet('#RET_CALC_TYPE', 'SUB_CODE', 'CODE_NAME', gfnma_nvl(item.PAY_TYPE));
                        //SBUxMethod.set("PAY_DATE", 			gfnma_nvl(item.PAY_DATE));
                        SBUxMethod.set("POSTING_DATE", 			gfnma_nvl(item.POSTING_DATE));
                        SBUxMethod.set("EXPECTED_PAY_DATE", 			gfnma_nvl(item.EXPECTED_PAY_DATE));
                        SBUxMethod.set("POSTING_STATUS", 			gfnma_nvl(item.POSTING_STATUS));
                        //SBUxMethod.set("INVOICE_BATCH_NO", 			gfnma_nvl(item.INVOICE_BATCH_NO));
                        SBUxMethod.set("DOC_ID", 			gfnma_nvl(item.DOC_ID));
                        SBUxMethod.set("DOC_NAME", 			gfnma_nvl(item.DOC_NAME));
                        SBUxMethod.set("MEMO", 			gfnma_nvl(item.MEMO));

                    });


                    //-- [1-4] 평균임금 계산 - 임원 환산 년수 내역
                    jsonInfoList.length = 0;
                    data.cv_2.forEach((item, index) => {
                        const msg = {
                            PAY_YYYYMM		            : gfnma_nvl(item.PAY_YYYYMM),
                            PAY_TYPE		            : gfnma_nvl(item.PAY_TYPE),
                            PAY_DATE		            : gfnma_nvl(item.PAY_DATE),
                            POSTING_SEQ		            : gfnma_nvl(item.POSTING_SEQ),
                            FI_ORG_CODE		            : gfnma_nvl(item.FI_ORG_CODE),
                            FI_ORG_NAME		            : gfnma_nvl(item.FI_ORG_NAME),
                            DEPT_CODE		            : gfnma_nvl(item.DEPT_CODE),
                            DEPT_NAME		            : gfnma_nvl(item.DEPT_NAME),
                            CC_CODE		                : gfnma_nvl(item.CC_CODE),
                            CC_NAME		                : gfnma_nvl(item.CC_NAME),
                            DEBIT_CREDIT		        : gfnma_nvl(item.DEBIT_CREDIT),
                            ACC_CODE		            : gfnma_nvl(item.ACC_CODE),
                            ACC_NAME		            : gfnma_nvl(item.ACC_NAME),
                            CURRENCY_CODE		        : gfnma_nvl(item.CURRENCY_CODE),
                            EMP_CODE		            : gfnma_nvl(item.EMP_CODE),
                            EMP_NAME		            : gfnma_nvl(item.EMP_NAME),
                            DEBIT_AMT		            : gfnma_nvl(item.DEBIT_AMT),
                            CREDIT_AMT		            : gfnma_nvl(item.CREDIT_AMT),
                            CS_CODE		                : gfnma_nvl(item.CS_CODE),
                            CS_NAME		                : gfnma_nvl(item.CS_NAME),
                            MEMO		                : gfnma_nvl(item.MEMO),
                            NEED_EMP_CODE_YN		    : gfnma_nvl(item.NEED_EMP_CODE_YN),
                            POSTING_RESULT_ADJUST_YN    : gfnma_nvl(item.POSTING_RESULT_ADJUST_YN),

                        }
                        jsonInfoList.push(msg);
                    });

                    gvwInfoGrid.rebuild();

                    //fn_searchQH();

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

    /**
     * 퇴직급여 전표처리 조회 프로시저 (회계처리 TAB 헤더)
     */
    const fn_searchQH = async function () {

        let PAY_YYYYMM           = gfnma_nvl(SBUxMethod.get("PAY_YYYYMM")); //귀속년월
        let RET_CALC_TYPE		 = gfnma_multiSelectGet('#RET_CALC_TYPE');//퇴직정산구분
        let PAY_DATE           = gfnma_nvl(SBUxMethod.get("PAY_DATE")); //퇴직일자


        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!RET_CALC_TYPE) {
            gfn_comAlert("W0002", "퇴직정산구분");
            return;
        }

        let nRow = gvwMasterGrid.getRow();

        if (nRow == -1) {
            nRow = 1; //그리드 로우 첫번째값 셋팅
        }else if(nRow == 0){
            return;
        }

        let rowData = gvwMasterGrid.getRowData(nRow);

        if (_.isEmpty(rowData) == false) {

            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                , V_P_LANG_ID: ''
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                , V_P_PAY_YYYYMM: PAY_YYYYMM
                , V_P_PAY_TYPE: RET_CALC_TYPE
                , V_P_PAY_DATE: PAY_DATE
                , V_P_EMP_CODE: rowData.EMP_CODE

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: ''
                , V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/ret/selectHra5150Q2.do", {
                getType: 'json',
                workType: 'HEADER',
                cv_count: '3',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    data.cv_3.forEach((item, index) => {

                        SBUxMethod.set("PAY_YYYYMM", 			gfnma_nvl(item.PAY_YYYYMM));
                        gfnma_multiSelectSet('#RET_CALC_TYPE', 'SUB_CODE', 'CODE_NAME', gfnma_nvl(item.PAY_TYPE));
                        SBUxMethod.set("PAY_DATE", 			gfnma_nvl(item.PAY_DATE));
                        SBUxMethod.set("POSTING_DATE", 			gfnma_nvl(item.POSTING_DATE));
                        SBUxMethod.set("EXPECTED_PAY_DATE", 			gfnma_nvl(item.EXPECTED_PAY_DATE));
                        SBUxMethod.set("POSTING_STATUS", 			gfnma_nvl(item.POSTING_STATUS));
                        //SBUxMethod.set("INVOICE_BATCH_NO", 			gfnma_nvl(item.INVOICE_BATCH_NO));
                        SBUxMethod.set("DOC_ID", 			gfnma_nvl(item.DOC_ID));
                        SBUxMethod.set("DOC_NAME", 			gfnma_nvl(item.DOC_NAME));
                        SBUxMethod.set("MEMO", 			gfnma_nvl(item.MEMO));

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

    //저장
    const fn_save = async function () {

        let nRow = gvwMasterGrid.getRow();

        if (nRow == -1) {

            /*gfn_comAlert("W0001", "사원");*/
            nRow = 1; //포커스 선택이 안되어 있을시, 사원리스트 조회후 1번째 인덱스 사원정보로 디테일 조회 하기 때문에 row값 디폴트로 1셋팅.

        }

        let rowData = gvwMasterGrid.getRowData(nRow);

        if (!_.isEmpty(rowData)) {

            let gridPayData = gvwPayGrid.getGridDataAll();

            let dDaySum = '';
            gridPayData.forEach((item, index) => {
                dDaySum = Number(dDaySum) + Number(item.APPLY_DAYS) + '';
            })

            /*********정산 기본 정보***********/
            let RET_CALC_TYPE       = gfnma_nvl(SBUxMethod.get("RET_CALC_TYPE1")); //퇴직정산구분
            let EMP_CODE            = gfnma_nvl(SBUxMethod.get("EMP_CODE")); //사원코드
            let ENTER_DATE          = gfnma_nvl(SBUxMethod.get("ENTER_DATE")); //입사일
            let RET_DAT             = gfnma_nvl(SBUxMethod.get("RET_DAT")); //퇴사일
            let CALCULATE_TAX_YN    = gfnma_nvl(SBUxMethod.get("CALCULATE_TAX_YN").CALCULATE_TAX_YN); //과세 재계산
            let CALC_ST_DAT         = gfnma_nvl(SBUxMethod.get("CALC_ST_DAT")); //정산시작일
            let CALC_END_DAT        = gfnma_nvl(SBUxMethod.get("CALC_END_DAT")); //정산종료일
            /*let RET_REASON = gfnma_nvl(SBUxMethod.get("RET_REASON")); //퇴사사유*/
            let RET_REASON		    = gfnma_multiSelectGet('#RET_REASON');//퇴사사유
            let RET_PENS_ST_DAT     = gfnma_nvl(SBUxMethod.get("RET_PENS_ST_DAT")); //확정급여형 퇴직연금제도 가입일
            let LIVE_YN             = gfnma_nvl(SBUxMethod.get("LIVE_YN").LIVE_YN); //거주구분
            let LIVE_NATION_CODE    = gfnma_nvl(SBUxMethod.get("LIVE_NATION_CODE")); //거주지국


            /*********정산 기본 정보***********/
            let ANN_BENEFIT_AMT         = gfnma_nvl(SBUxMethod.get("ANN_BENEFIT_AMT")); //연차수당
            let PAY_MULTIPLE_NUMBER     = gfnma_nvl(SBUxMethod.get("PAY_MULTIPLE_NUMBER")); //지급배수
            let CUMULATIVE_DAY_CNT      = gfnma_nvl(SBUxMethod.get("CUMULATIVE_DAY_CNT")); //누적일수
            let RET_BONUS_ETC           = gfnma_nvl(SBUxMethod.get("RET_BONUS_ETC")); //퇴직위로금등
            let AVG_MM_PAY_AMT          = gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT")); //평균급여
            let AVG_MM_BONUS_AMT        = gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT")); //평균상여
            let AVG_MM_ANN_AMT          = gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT")); //평균연차수당
            let AVG_MM_RET_AMT          = gfnma_nvl(SBUxMethod.get("AVG_MM_RET_AMT")); //평균임금
            let TXFREE_RET_INC_AMT      = gfnma_nvl(SBUxMethod.get("TXFREE_RET_INC_AMT")); //비과세 퇴직급여
            let EXCP_MM_BEF_CNT         = gfnma_nvl(SBUxMethod.get("EXCP_MM_BEF_CNT")); //최종분 제외월수(20121231이전)
            let EXCP_MM_AFT_CNT         = gfnma_nvl(SBUxMethod.get("EXCP_MM_AFT_CNT")); //최종분 제외월수(20130101이후)
            let ADD_MM_BEF_CNT          = gfnma_nvl(SBUxMethod.get("ADD_MM_BEF_CNT")); //최종분 가산월수(20121231이전)
            let ADD_MM_AFT_CNT          = gfnma_nvl(SBUxMethod.get("ADD_MM_AFT_CNT")); //최종분 가산월수(20130101이후)
            //let IRP_BANK_CODE = gfnma_nvl(SBUxMethod.get("IRP_BANK_CODE")); //
            let IRP_BANK_CODE	        = gfnma_multiSelectGet('#IRP_BANK_CODE');//
            let IRP_BIZ_REGNO           = gfnma_nvl(SBUxMethod.get("IRP_BIZ_REGNO")); //
            let IRP_BANK_ACC            = gfnma_nvl(SBUxMethod.get("IRP_BANK_ACC")); //
            let RET_PENS_END_DAT        = gfnma_nvl(SBUxMethod.get("RET_PENS_END_DAT")); //
            let RET_PENS_AMT            = gfnma_nvl(SBUxMethod.get("RET_PENS_AMT")); //계좌입금금액
            let COM_PAY_AMT             = gfnma_nvl(SBUxMethod.get("COM_PAY_AMT")); //
            let PAY_AMT_SUM             = gfnma_nvl(SBUxMethod.get("PAY_AMT_SUM")); //
            let REAL_PAY_AMT            = gfnma_nvl(SBUxMethod.get("REAL_PAY_AMT")); //
            let BANK_CODE               = gfnma_nvl(SBUxMethod.get("BANK_CODE")); //
            let BANK_ACC                = gfnma_nvl(SBUxMethod.get("BANK_ACC")); //
            let BANK_DEPOR              = gfnma_nvl(SBUxMethod.get("BANK_DEPOR")); //
            let PENS_BANK_CODE1         = gfnma_nvl(SBUxMethod.get("PENS_BANK_CODE1")); //
            let INSURER1_PAY_AMT        = gfnma_nvl(SBUxMethod.get("INSURER1_PAY_AMT")); //
            let PENS_BANK_CODE2         = gfnma_nvl(SBUxMethod.get("PENS_BANK_CODE2")); //
            let INSURER2_PAY_AMT        = gfnma_nvl(SBUxMethod.get("INSURER2_PAY_AMT")); //
            let PENS_BANK_CODE3         = gfnma_nvl(SBUxMethod.get("PENS_BANK_CODE3")); //
            let INSURER3_PAY_AMT        = gfnma_nvl(SBUxMethod.get("INSURER3_PAY_AMT")); //
            let INSURANCE_RETIRE_CHG    = gfnma_nvl(SBUxMethod.get("INSURANCE_RETIRE_CHG")); //
            let RETIRE_ESTIMATE_AMT     = gfnma_nvl(SBUxMethod.get("RETIRE_ESTIMATE_AMT")); //
            let COMP_TAX_PAY_YN         = gfnma_nvl(SBUxMethod.get("COMP_TAX_PAY_YN").COMP_TAX_PAY_YN); //
            let TO_DC_YN                = gfnma_nvl(SBUxMethod.get("TO_DC_YN").TO_DC_YN); //


            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                , V_P_LANG_ID: ''
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                , V_P_RET_CALC_DAT          : gfnma_nvl(rowData.RET_CALC_DAT)
                , V_P_RET_CALC_TYPE         : RET_CALC_TYPE
                , V_P_EMP_CODE              : EMP_CODE
                , V_P_ENTER_DAT             : ENTER_DATE
                , V_P_RET_DAT               : RET_DAT
                , V_P_CALCULATE_TAX_YN      : CALCULATE_TAX_YN == '' ? 'N' : CALCULATE_TAX_YN
                , V_P_CALC_ST_DAT           : CALC_ST_DAT
                , V_P_CALC_END_DAT          : CALC_END_DAT
                , V_P_RET_REASON            : RET_REASON
                , V_P_RETIRE_PENSION_ST_DAT : RET_PENS_ST_DAT
                , V_P_LIVE_YN               : LIVE_YN == '' ? 'N' : LIVE_YN
                , V_P_LIVE_NATION_CODE      : LIVE_NATION_CODE

                // -- @P_WORKING_YEAR_CNT       INT,  -- 근무년수-- @P_WORKING_MM_CNT      INT,  -- 근무월수-- @P_WORKING_DAY_CNT       INT,  -- 근무일수-- @P_BF_3MM_DAY_CNT    INT,
                , V_P_ANN_BENEFIT_AMT           : ANN_BENEFIT_AMT // -- 연차수당 (V)
                , V_P_PAY_MULTIPLE_NUMBER       : PAY_MULTIPLE_NUMBER // -- 지급배수
                , V_P_CUMULATIVE_DAY_CNT        : CUMULATIVE_DAY_CNT // -- 누적일수
                , V_P_RET_BONUS_ETC             : RET_BONUS_ETC // -- 퇴직위로금등
                , V_P_AVG_MM_PAY_AMT            : AVG_MM_PAY_AMT // -- 평균급여
                , V_P_AVG_MM_BONUS_AMT          : AVG_MM_BONUS_AMT // -- 평균상여
                , V_P_AVG_MM_ANN_AMT            : AVG_MM_ANN_AMT // -- 평균연차수당
                , V_P_AVG_MM_RET_AMT            : AVG_MM_RET_AMT //  -- 평균임금
                , V_P_TAX_FREE_RETIRE_INC_AMT   : TXFREE_RET_INC_AMT // -- 최종분 비과세 퇴직급여
                , V_P_EXCP_MM_BEF_CNT           : EXCP_MM_BEF_CNT //  -- 최종분 제외월수(20121231이전)
                , V_P_EXCP_MM_AFT_CNT           : EXCP_MM_AFT_CNT //  -- 최종분 제외월수(20130101이후)
                , V_P_ADD_MM_BEF_CNT            : ADD_MM_BEF_CNT // -- 최종분 가산월수(20121231이전)
                , V_P_ADD_MM_AFT_CNT            : ADD_MM_AFT_CNT //  -- 최종분 가산월수(20130101이후)
                , V_P_IRP_BANK_CODE             : IRP_BANK_CODE
                , V_P_IRP_BIZ_REGNO             : IRP_BIZ_REGNO
                , V_P_IRP_BANK_ACC              : IRP_BANK_ACC
                , V_P_RETIRE_PENSION_END_DAT    : RET_PENS_END_DAT
                , V_P_RET_PENS_AMT              : RET_PENS_AMT
                , V_P_COM_PAY_AMT               : COM_PAY_AMT
                , V_P_PAY_AMT_SUM               : PAY_AMT_SUM
                , V_P_REAL_PAY_AMT              : REAL_PAY_AMT
                , V_P_BANK_CODE                 : BANK_CODE
                , V_P_BANK_ACC                  : BANK_ACC
                , V_P_BANK_DEPOR                : BANK_DEPOR
                , V_P_PENS_BANK_CODE1           : PENS_BANK_CODE1
                , V_P_INSURER1_PAY_AMT          : INSURER1_PAY_AMT
                , V_P_PENS_BANK_CODE2           : PENS_BANK_CODE2
                , V_P_INSURER2_PAY_AMT          : INSURER2_PAY_AMT
                , V_P_PENS_BANK_CODE3           : PENS_BANK_CODE3
                , V_P_INSURER3_PAY_AMT          : INSURER3_PAY_AMT
                , V_P_INSURANCE_RETIRE_CHG      : INSURANCE_RETIRE_CHG
                , V_P_RETIRE_ESTIMATE_AMT       : RETIRE_ESTIMATE_AMT
                , V_P_COMP_TAX_PAY_YN           : COMP_TAX_PAY_YN == '' ? 'N' : COMP_TAX_PAY_YN
                , V_P_BEF_3MM_DAY_CNT           : dDaySum
                , V_P_TO_DC_YN                  : TO_DC_YN == '' ? 'N' : TO_DC_YN

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: ''
                , V_P_PC: ''

            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5150.do", {
                getType: 'json',
                workType: 'U',
                cv_count: '0',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);

                        return false;
                    } else {
                        return true;
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
    }

    //급여내역
    const fn_saveS1 = async function (payData, masterData) {


        let listData = [];
        listData =  await getParamFormS1(payData, masterData);
        console.log('--------listData save--------', listData);

        if (listData.length > 0) {

            const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5150S1.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        return false;
                    }else{
                        return true;
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
    }

    //급여내역 파라미터
    const getParamFormS1 = async function (payData, masterData) {

        let returnData = [];


        if (!_.isEmpty(payData)) {

            let RET_CALC_TYPE = gfnma_nvl(SBUxMethod.get("RET_CALC_TYPE1")); //퇴직정산구분
            let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE")); //사원코드

            payData.forEach((item, index) => {
                const param = {

                    cv_count: '0',
                    getType: 'json',
                    workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                    params: gfnma_objectToString({

                        V_P_DEBUG_MODE_YN: ''
                        , V_P_LANG_ID: ''
                        , V_P_COMP_CODE: gv_ma_selectedApcCd
                        , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                        ,V_P_RET_CALC_DAT  : masterData.RET_CALC_DAT
                        ,V_P_RET_CALC_TYPE : RET_CALC_TYPE
                        ,V_P_EMP_CODE      : EMP_CODE
                        ,V_P_PAY_YYYYMM    : item.data.PAY_YYYYMM
                        ,V_P_BASE_PAY_AMT  : item.data.BASE_PAY_AMT == '' ? 0 : item.data.BASE_PAY_AMT
                        ,V_P_ALLOWANCE_AMT : item.data.ALLOWANCE_AMT == '' ? 0 : item.data.ALLOWANCE_AMT
                        ,V_P_PAY_AMT       : item.data.PAY_AMT == '' ? 0 : item.data.PAY_AMT
                        ,V_P_ST_DAT        : item.data.ST_DAT
                        ,V_P_END_DAT       : item.data.END_DAT
                        ,V_P_APPLY_DAYS    : item.data.APPLY_DAYS
                        ,V_P_APPLY_AMT     : item.data.APPLY_AMT == '' ? 0 : item.data.APPLY_AMT

                        , V_P_FORM_ID: p_formId
                        , V_P_MENU_ID: p_menuId
                        , V_P_PROC_ID: ''
                        , V_P_USERID: ''
                        , V_P_PC: ''
                    })
                }

                console.log("---------param S1--------- : ", param);
                returnData.push(param);

            });

            console.log("---------returnData S1--------- : ", returnData);
            return returnData;

        }
    }


    //상여내역
    const fn_saveS2 = async function (bonusData, masterData) {


        let listData = [];
        listData =  await getParamFormS2(bonusData, masterData);
        console.log('--------listData save--------', listData);

        if (listData.length > 0) {

            const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5150S2.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        return false;
                    }else{
                        return true;
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
    }

    //상여내역 파라미터
    const getParamFormS2 = async function (bonusData, masterData) {

        let returnData = [];


        if (!_.isEmpty(bonusData)) {

            let RET_CALC_TYPE = gfnma_nvl(SBUxMethod.get("RET_CALC_TYPE1")); //퇴직정산구분
            let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE")); //사원코드

            bonusData.forEach((item, index) => {
                const param = {

                    cv_count: '0',
                    getType: 'json',
                    workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                    params: gfnma_objectToString({

                        V_P_DEBUG_MODE_YN: ''
                        , V_P_LANG_ID: ''
                        , V_P_COMP_CODE: gv_ma_selectedApcCd
                        , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                        ,V_P_RET_CALC_DAT  : masterData.RET_CALC_DAT
                        ,V_P_RET_CALC_TYPE : RET_CALC_TYPE
                        ,V_P_EMP_CODE      : EMP_CODE
                        ,V_P_PAY_YYYYMM    : item.data.PAY_YYYYMM
                        ,V_P_PAY_DATE      : item.data.PAY_DATE
                        ,V_P_PAY_ITEM_CODE : item.data.PAY_ITEM_CODE
                        ,V_P_PAY_AMT       : item.data.PAY_AMT  == '' ? 0 : item.data.PAY_AMT
                        ,V_P_APPLY_AMT     : item.data.APPLY_AMT  == '' ? 0 : item.data.APPLY_AMT

                        , V_P_FORM_ID: p_formId
                        , V_P_MENU_ID: p_menuId
                        , V_P_PROC_ID: ''
                        , V_P_USERID: ''
                        , V_P_PC: ''
                    })
                }

                console.log("---------param S2--------- : ", param);
                returnData.push(param);

            });

            console.log("---------returnData S2--------- : ", returnData);
            return returnData;

        }
    }

    //임금 환산 년수
    const fn_saveS3 = async function (changeData, masterData) {


        let listData = [];
        listData =  await getParamFormS3(changeData, masterData);
        console.log('--------listData save--------', listData);

        if (listData.length > 0) {

            const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5150S3.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        return false;
                    }else{
                        return true;
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
    }

    //임금 환산 년수 파라미터
    const getParamFormS3 = async function (changeData, masterData) {

        let returnData = [];


        if (!_.isEmpty(changeData)) {

            let RET_CALC_TYPE = gfnma_nvl(SBUxMethod.get("RET_CALC_TYPE1")); //퇴직정산구분
            let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE")); //사원코드

            changeData.forEach((item, index) => {
                const param = {

                    cv_count: '0',
                    getType: 'json',
                    workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                    params: gfnma_objectToString({

                        V_P_DEBUG_MODE_YN: ''
                        , V_P_LANG_ID: ''
                        , V_P_COMP_CODE: gv_ma_selectedApcCd
                        , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                        ,V_P_RET_CALC_DAT           : masterData.RET_CALC_DAT
                        ,V_P_RET_CALC_TYPE          : RET_CALC_TYPE
                        ,V_P_EMP_CODE               : EMP_CODE
                        ,V_P_POSITION_CODE          : item.data.POSITION_CODE
                        ,V_P_ST_DAT                 : item.data.ST_DAT
                        ,V_P_END_DAT                : item.data.END_DAT
                        ,V_P_YY_CNT                 : item.data.YY_CNT
                        ,V_P_MM_CNT                 : item.data.MM_CNT
                        ,V_P_DD_CNT                 : item.data.DD_CNT == '' ? 0 : item.data.DD_CNT
                        ,V_P_PAY_MULTIPLE_NUMBER    : item.data.PAY_MULTIPLE_NUMBER == '' ? 0 : item.data.PAY_MULTIPLE_NUMBER
                        ,V_P_DD_TOT_CNT             : item.data.DD_TOT_CNT
                        ,V_P_CHG_MM_CNT             : item.data.CHG_MM_CNT == '' ? 0 : item.data.CHG_MM_CNT

                        , V_P_FORM_ID: p_formId
                        , V_P_MENU_ID: p_menuId
                        , V_P_PROC_ID: ''
                        , V_P_USERID: ''
                        , V_P_PC: ''
                    })
                }

                console.log("---------param S3--------- : ", param);
                returnData.push(param);

            });

            console.log("---------returnData S3--------- : ", returnData);
            return returnData;

        }
    }
    async function gridValueChangedMaster() {

        var nCol = gvwMasterGrid.getCol();

        if (nCol < 1) {
            return;
        }
        var nRow = gvwMasterGrid.getRow();
        if (nRow < 1) {
            return;
        }

        if (_.isEmpty(rowData)){
            return;
        }else{
            strjob_group = rowData.JOB_GROUP;
            stravg_pay_type = rowData.AVG_PAY_TYPE;
        }

    }


    async function gridValueChanged1() {

        var nCol = gvwPayGrid.getCol();
        console.log('----------col------------',nCol);

        if (nCol < 1) {
            return;
        }
        var nRow = gvwPayGrid.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = gvwPayGrid.getRowData(nRow);
        //let _monthly_bonus_amt = 0;

        if (_.isEmpty(rowData)){
            return;
        }/*else{
            _monthly_bonus_amt = rowData.APPLY_AMT
        }*/

        console.log('----------gvwPayGrid.getColRef("END_DAT")------------',gvwPayGrid.getColRef("END_DAT") );
        console.log('----------gvwPayGrid.getColRef("END_DAT")------------',gvwPayGrid.getColRef("END_DAT") == 6);
        if (gvwPayGrid.getColRef("APPLY_AMT") == nCol || gvwPayGrid.getColRef("APPLY_DAYS") == nCol) {
            //gvwPay.UpdateSummary();

            let dSum = 0;
            let dDaySum = 0;
            let dSumPeak = 0;
            let dDaySumPeak = 0;
            let dSumNorm = 0;
            let dDaySumNorm = 0;

            let alldata = gvwPayGrid.getGridDataAll();

            alldata.forEach((item,index) => {
                if (item.PEAK_YN == 'N') {
                    dSum        += Number(item.APPLY_AMT);
                    dDaySum     += Number(item.APPLY_DAYS);
                    dSumNorm    += Number(item.APPLY_AMT);
                    dDaySumNorm += Number(item.APPLY_DAYS);
                } else {
                    dSumPeak    += Number(item.APPLY_AMT);
                    dDaySumPeak += Number(item.APPLY_DAYS);

                }
            });

            SBUxMethod.set("BEF_3MM_DAY_CNT", dDaySum);
            SBUxMethod.set("BEF_3MM_DAY_CNT_PEAK", dDaySumNorm);
            SBUxMethod.set("BEF_3MM_DAY_CNT_NORM", dDaySumPeak);
            /* numbef_3mm_day_cnt.Text = dDaySum.ToString();
             numbef_3mm_day_cnt_norm.Text = dDaySumNorm.ToString();
             numbef_3mm_day_cnt_peak.Text = dDaySumPeak.ToString();*/
            // SetMessageBox("stravg_pay_type : " + stravg_pay_type);
            // SetMessageBox("strjob_group : " + strjob_group);
            // SetMessageBox("numbef_3mm_day_cnt.Text : " + numbef_3mm_day_cnt.Text);
            let RET_CALC_TYPE		= gfnma_multiSelectGet('#SRCH_RET_CALC_TYPE'); // 퇴직정산구분
            //let CALC_END_DAT = gfnma_nvl(SBUxMethod.get("CALC_END_DAT")); // 정산종료일

            if (RET_CALC_TYPE == 'RETIRE' || RET_CALC_TYPE == "MIDDLE") {
                //numavg_monthly_pay_amt.Value = Math.Floor(dSum / 3);
                avg_mm_pay_amt
                SBUxMethod.set("AVG_MM_PAY_AMT", dSum);
                SBUxMethod.set("AVG_MM_PAY_AMT_NORM", dSumNorm);
                SBUxMethod.set("AVG_MM_PAY_AMT_PEAK", dSumPeak);

                let AVG_MM_PAY_AMT	        = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT"))); //평균급여, numavg_monthly_pay_amt
                let AVG_MM_PAY_AMT_NORM	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT_NORM"))); //평균급여, numavg_monthly_pay_amt_norm
                let AVG_MM_PAY_AMT_PEAK	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT_PEAK"))); //평균급여, numavg_monthly_pay_amt_peak

                let AVG_MM_BONUS_AMT	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT"))); //평균상여, numavg_monthly_bonus_amt
                let AVG_MM_BONUS_AMT_NORM	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT_NORM"))); //평균상여, numavg_monthly_bonus_amt_norm
                let AVG_MM_BONUS_AMT_PEAK	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT_PEAK"))); //평균상여, numavg_monthly_bonus_amt_peak

                let AVG_MM_ANN_AMT	        = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT"))); //평균연차수당, numavg_monthly_annual_amt
                let AVG_MM_ANN_AMT_NORM 	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT_NORM"))); //평균연차수당, numavg_monthly_annual_amt_norm
                let AVG_MM_ANN_AMT_PEAK 	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT_PEAK"))); //평균연차수당, numavg_monthly_annual_amt_peak

                if (stravg_pay_type == '10') {
                    //if (gvwPay.Columns["apply_days"].SummaryText != "0")

                    if (dDaySum != 0) {
                        let AVG_MM_RET_AMT= Math.round((AVG_MM_PAY_AMT + AVG_MM_BONUS_AMT + AVG_MM_ANN_AMT) / dDaySum);
                        SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                        //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value + numavg_monthly_bonus_amt.Value + numavg_monthly_annual_amt.Value) / dDaySum); // Int32.Parse(gvwPay.Columns["apply_days"].SummaryText)

                    }

                    if (dDaySumNorm != 0) {
                        let AVG_MM_RET_AMT_NORM = Math.round((AVG_MM_PAY_AMT_NORM + AVG_MM_BONUS_AMT_NORM + AVG_MM_ANN_AMT_NORM) / dDaySumNorm);
                        SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                        //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value + numavg_monthly_bonus_amt_norm.Value + numavg_monthly_annual_amt_norm.Value) / dDaySumNorm);
                    }

                    if (dDaySumPeak != 0) {
                        let AVG_MM_RET_AMT_PEAK = Math.round((AVG_MM_PAY_AMT_PEAK + AVG_MM_BONUS_AMT_PEAK + AVG_MM_ANN_AMT_PEAK) / dDaySumPeak);
                        SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                        //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value + numavg_monthly_bonus_amt_peak.Value + numavg_monthly_annual_amt_peak.Value) / dDaySumPeak);
                    }
                } else if (stravg_pay_type == "20") {
                    if (strjob_group == "3") {
                        if (dDaySum != 0) {
                            let AVG_MM_RET_AMT= Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.trunc((numavg_monthly_pay_amt.Value / dDaySum) + (numavg_monthly_bonus_amt.Value * 4 / 365) + (numannual_benefit_amt.Value / 365));
                        } else {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value) + (numavg_monthly_bonus_amt.Value * 4 / 365) + (numannual_benefit_amt.Value / 365));
                        }
                        if (dDaySumNorm != 0) {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (numavg_monthly_bonus_amt_norm.Value * 4 / 365) + (numannual_benefit_amt_norm.Value / 365));
                        } else {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value) + (numavg_monthly_bonus_amt_norm.Value * 4 / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }
                        if (dDaySumPeak != 0) {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (numavg_monthly_bonus_amt_peak.Value * 4 / 365) + (numannual_benefit_amt_peak.Value / 365));
                        } else {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value) + (numavg_monthly_bonus_amt_peak.Value * 4 / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                    } else {
                        if (dDaySum != 0) {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum) + (numavg_monthly_bonus_amt.Value * 4 / 360) + (numannual_benefit_amt.Value / 360));
                        } else {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value) + (numavg_monthly_bonus_amt.Value * 4 / 360) + (numannual_benefit_amt.Value / 360));
                        }

                        if (dDaySumNorm != 0) {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT_NORM / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (numavg_monthly_bonus_amt_norm.Value * 4 / 360) + (numannual_benefit_amt_norm.Value / 360));
                        } else {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT_NORM / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value) + (numavg_monthly_bonus_amt_norm.Value * 4 / 360) + (numannual_benefit_amt_norm.Value / 360));
                        }

                        if (dDaySumPeak != 0) {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (numavg_monthly_bonus_amt_peak.Value * 4 / 360) + (numannual_benefit_amt_peak.Value / 360));
                        } else {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value) + (numavg_monthly_bonus_amt_peak.Value * 4 / 360) + (numannual_benefit_amt_peak.Value / 360));
                        }
                    }
                } else if (stravg_pay_type == "30") {
                    if (strjob_group == "3") {
                        if (dDaySum != 0) {

                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum) + (numavg_monthly_bonus_amt.Value * 4 / 365) + (numannual_benefit_amt.Value / 365));
                        } else {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value) + (numavg_monthly_bonus_amt.Value * 4 / 365) + (numannual_benefit_amt.Value / 365));
                        }

                        if (dDaySumNorm != 0) {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (numavg_monthly_bonus_amt_norm.Value * 4 / 365) + (numannual_benefit_amt_norm.Value / 365));
                        } else {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value) + (numavg_monthly_bonus_amt_norm.Value * 4 / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }


                        if (dDaySumPeak != 0) {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (numavg_monthly_bonus_amt_peak.Value * 4 / 365) + (numannual_benefit_amt_peak.Value / 365));
                        } else {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value) + (numavg_monthly_bonus_amt_peak.Value * 4 / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                    } else {

                        if (dDaySum != 0) {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum) + (numavg_monthly_bonus_amt.Value * 4 / 365) + (numannual_benefit_amt.Value / 365));
                        } else {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value) + (numavg_monthly_bonus_amt.Value * 4 / 365) + (numannual_benefit_amt.Value / 365));
                        }
                        if (dDaySumNorm != 0) {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            // numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (numavg_monthly_bonus_amt_norm.Value * 4 / 365) + (numannual_benefit_amt_norm.Value / 365));
                        } else {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value) + (numavg_monthly_bonus_amt_norm.Value * 4 / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }
                        if (dDaySumPeak != 0) {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (numavg_monthly_bonus_amt_peak.Value * 4 / 365) + (numannual_benefit_amt_peak.Value / 365));
                        } else {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value) + (numavg_monthly_bonus_amt_peak.Value * 4 / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                    }
                }
            } else if (RET_CALC_TYPE == 'RETIRE_P' || RET_CALC_TYPE == 'MIDDLE_P') {
                if (stravg_pay_type == "10") {
                    if (dDaySum != 0) {
                        let AVG_MM_RET_AMT= Math.round((AVG_MM_PAY_AMT + AVG_MM_BONUS_AMT + AVG_MM_ANN_AMT) / dDaySum);
                        SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                        //numavg_monthly_retire_amt.Value = Math.Round((numavg_monthly_pay_amt.Value + numavg_monthly_bonus_amt.Value + numavg_monthly_annual_amt.Value) / dDaySum);
                    }

                    if (dDaySumNorm != 0) {
                        let AVG_MM_RET_AMT_NORM = Math.round((AVG_MM_PAY_AMT_NORM + AVG_MM_BONUS_AMT_NORM + AVG_MM_ANN_AMT_NORM) / dDaySumNorm);
                        SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                        //numavg_monthly_retire_amt_norm.Value = Math.Round((numavg_monthly_pay_amt_norm.Value + numavg_monthly_bonus_amt_norm.Value + numavg_monthly_annual_amt_norm.Value) / dDaySumNorm);
                    }

                    if (dDaySumPeak != 0) {
                        let AVG_MM_RET_AMT_PEAK = Math.round((AVG_MM_PAY_AMT_PEAK + AVG_MM_BONUS_AMT_PEAK + AVG_MM_ANN_AMT_PEAK) / dDaySumPeak);
                        SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                        //numavg_monthly_retire_amt_peak.Value = Math.Round((numavg_monthly_pay_amt_peak.Value + numavg_monthly_bonus_amt_peak.Value + numavg_monthly_annual_amt_peak.Value) / dDaySumPeak);
                    }
                } else if (stravg_pay_type == "20") {
                    if (strjob_group == "3") {
                        if (dDaySum != 0) {
                            let AVG_MM_RET_AMT= Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum) + (numavg_monthly_bonus_amt.Value * 4 / 365) + (numannual_benefit_amt.Value / 365));
                        }
                        if (dDaySumNorm != 0) {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (numavg_monthly_bonus_amt_norm.Value * 4 / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }
                        if (dDaySumPeak != 0) {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (numavg_monthly_bonus_amt_peak.Value * 4 / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                    } else {
                        if (dDaySum != 0) {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum) + (numavg_monthly_bonus_amt.Value * 4 / 360) + (numannual_benefit_amt.Value / 360));
                        }

                        if (dDaySumNorm != 0) {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT_NORM / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (numavg_monthly_bonus_amt_norm.Value * 4 / 360) + (numannual_benefit_amt_norm.Value / 360));
                        }

                        if (dDaySumPeak != 0) {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (numavg_monthly_bonus_amt_peak.Value * 4 / 360) + (numannual_benefit_amt_peak.Value / 360));
                        }
                    }
                } else if (stravg_pay_type == "30") {
                    if (strjob_group == "3") {
                        if (dDaySum != 0) {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum) + (numavg_monthly_bonus_amt.Value * 4 / 365) + (numannual_benefit_amt.Value / 365));
                        }

                        if (dDaySumNorm != 0) {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (numavg_monthly_bonus_amt_norm.Value * 4 / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }

                        if (dDaySumPeak != 0) {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (numavg_monthly_bonus_amt_peak.Value * 4 / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                    } else {
                        if (dDaySum != 0) {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum) + (numavg_monthly_bonus_amt.Value * 4 / 365) + (numannual_benefit_amt.Value / 365));
                        }

                        if (dDaySumNorm != 0) {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (numavg_monthly_bonus_amt_norm.Value * 4 / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }

                        if (dDaySumPeak != 0) {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (numavg_monthly_bonus_amt_peak.Value * 4 / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                    }
                }
            }
        }
        else if (gvwPayGrid.getColRef("ST_DAT") == nCol || gvwPayGrid.getColRef("END_DAT") == nCol)
        {
            if (gfnma_nvl(rowData.ST_DAT) == '' || gfnma_nvl(rowData.END_DAT) == '')
            {
                gvwPayGrid.setCellData(nRow, gvwPayGrid.getColRef("APPLY_DAYS"), 0);
                //gvwPay.SetValue("apply_days", 0);
                return;
            }

            // 시작일과 종료일을 비교함
            if (Number(gfnma_nvl(rowData.ST_DAT) == '' ? 0 : rowData.ST_DAT) > Number(gfnma_nvl(rowData.END_DAT) == '' ? 0 : rowData.END_DAT))
            {
                gfn_comAlert("Q0000", "적용시작일보다 적용종료일이 빠를 수 없습니다.");
                //SetMessageBox(GetFormMessage("HRA5150_013")); // 적용시작일보다 적용종료일이 빠를 수 없습니다.
                return;
            }

            let stDat = rowData.ST_DAT;
            let endDat = rowData.END_DAT

            let APPLY_DAYS = Number(endDat) - Number(stDat) + 1;

            gvwPayGrid.setCellData(nRow,gvwPayGrid.getColRef("APPLY_DAYS"),APPLY_DAYS);

            // 적용일수 계산
            /* let istart_yyyy = 0;
             let istart_mm = 0;
             let istart_dd = 0;

             let iend_yyyy = 0;
             let iend_mm = 0;
             let iend_dd = 0;

             istart_yyyy = int.Parse(gvwPay.GetValue("st_dat").ToString().Substring(0, 4));
             istart_mm = int.Parse(gvwPay.GetValue("st_dat").ToString().Substring(4, 2));
             istart_dd = int.Parse(gvwPay.GetValue("st_dat").ToString().Substring(6, 2));

             iend_yyyy = int.Parse(gvwPay.GetValue("end_dat").ToString().Substring(0, 4));
             iend_mm = int.Parse(gvwPay.GetValue("end_dat").ToString().Substring(4, 2));
             iend_dd = int.Parse(gvwPay.GetValue("end_dat").ToString().Substring(6, 2));

             DateTime dtstart_date = new DateTime(istart_yyyy, istart_mm, istart_dd);
             DateTime dtend_date = new DateTime(iend_yyyy, iend_mm, iend_dd);*/

            //gvwPay.SetValue("apply_days", (dtend_date - dtstart_date).Days + 1);
        }


        /*//급여내역 시작일과 종료일을 계산하여 적용일수 셋팅
        if (nCol == 5 || nCol == 6) {

            let rowData = gvwPayGrid.getRowData(nRow);
            let stDat = rowData.ST_DAT;
            let endDat = rowData.END_DAT

            if (_.isEmpty(stDat) == false && _.isEmpty(endDat) == false) {
                let APPLY_DAYS = Number(endDat) - Number(stDat);
                if (APPLY_DAYS < 0) {// 적용종료일이 적용시작일 날짜 보다 낮을때
                    gfn_comAlert("W0015", "적용종료일", "적용시작일") // W0015	{0}이/가 {1} 보다 작습니다.
                    gvwPayGrid.setCellData(nRow, gvwPayGrid.getColRef("END_DAT"), '');
                    gvwPayGrid.setCellData(nRow, gvwPayGrid.getColRef("APPLY_DAYS"), '');
                } else {
                    gvwPayGrid.setCellData(nRow, gvwPayGrid.getColRef("APPLY_DAYS"), APPLY_DAYS);
                }

            }else{
                gvwPayGrid.setCellData(nRow,gvwPayGrid.getColRef("APPLY_DAYS"),'');
            }
        }*/
    }

    const gridValueChanged2 = async function () {

        var nCol = gvwBonusGrid.getCol();
        if (nCol < 1) {
            return;
        }
        var nRow = gvwBonusGrid.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = gvwBonusGrid.getRowData(nRow);
        if (_.isEmpty(rowData)) {
            return;
        }


        if (gvwBonusGrid.getColRef("APPLY_AMT") == nCol)
        {
            let dSum = 0;
            let dSumNorm = 0;
            let dSumPeak = 0;

            /*let _monthly_pay_amt = 0;
            _monthly_pay_amt = Convert.ToDecimal(gvwPay.Columns["apply_amt"].SummaryText);*/

            let alldata = gvwBonusGrid.getGridDataAll();


            alldata.forEach((item,index) => {

                if (_.isEqual(item.PEAK_YN, 'N')){
                    dSum += Number(item.APPLY_AMT);
                    dSumNorm += Number(item.APPLY_AMT);
                }else{
                    dSumPeak += Number(item.APPLY_AMT);
                }
            });

            SBUxMethod.set("AVG_MM_BONUS_AMT", 			    Math.floor(dSum / 4)); //평균상여
            SBUxMethod.set("AVG_MM_BONUS_AMT_NORM", 	    Math.floor(dSumNorm / 4)); //평균상여
            SBUxMethod.set("AVG_MM_BONUS_AMT_PEAK", 		Math.Floor(dSumPeak / 4)); //평균상여

            /*numavg_monthly_bonus_amt.Value = Math.Floor(dSum / 4);
            numavg_monthly_bonus_amt_norm.Value = Math.Floor(dSumNorm / 4);
            numavg_monthly_bonus_amt_peak.Value = Math.Floor(dSumPeak / 4);*/

            let dDaySum = 0;
            let dDaySumPeak = 0;
            let dDaySumNorm = 0;

            let gridPay = gvwPayGrid.getGridDataAll();

            gridPay.forEach((item,index) =>{
                if (item.PEAK_YN == 'N')
                {
                    dDaySum += item.APPLY_DAYS;
                    dDaySumNorm += item.APPLY_DAYS;
                }
                else
                {
                    dDaySumPeak += item.APPLY_DAYS;
                }
            });

            let AVG_MM_PAY_AMT	        = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT"))); //평균급여, numavg_monthly_pay_amt
            let AVG_MM_PAY_AMT_NORM	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT_NORM"))); //평균급여, numavg_monthly_pay_amt_norm
            let AVG_MM_PAY_AMT_PEAK	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT_PEAK"))); //평균급여, numavg_monthly_pay_amt_peak

            let AVG_MM_BONUS_AMT	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT"))); //평균상여, numavg_monthly_bonus_amt
            let AVG_MM_BONUS_AMT_NORM	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT_NORM"))); //평균상여, numavg_monthly_bonus_amt_norm
            let AVG_MM_BONUS_AMT_PEAK	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT_PEAK"))); //평균상여, numavg_monthly_bonus_amt_peak

            let AVG_MM_ANN_AMT	        = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT"))); //평균연차수당, numavg_monthly_annual_amt
            let AVG_MM_ANN_AMT_NORM 	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT_NORM"))); //평균연차수당, numavg_monthly_annual_amt_norm
            let AVG_MM_ANN_AMT_PEAK 	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT_PEAK"))); //평균연차수당, numavg_monthly_annual_amt_peak

            let RET_CALC_TYPE		= gfnma_multiSelectGet('#SRCH_RET_CALC_TYPE'); //퇴직정산구분

            if (_.isEqual(RET_CALC_TYPE, 'RETIRE') || _.isEqual(RET_CALC_TYPE, 'MIDDLE')){
                //numavg_monthly_bonus_amt.Value = Math.Floor(dSum / 12);
                //numavg_monthly_bonus_amt.Value = Math.Floor(dSum / 4);

                //if (gvwPay.Columns["apply_days"].SummaryText != "0")
                //{
                //    numavg_monthly_retire_amt.Value = Math.Round((numavg_monthly_pay_amt.Value + numavg_monthly_bonus_amt.Value + numavg_monthly_annual_amt.Value) / Int32.Parse(gvwPay.Columns["apply_days"].SummaryText));
                //}

                if (stravg_pay_type == "10")
                {
                    if (dDaySum != 0)
                    {

                        let AVG_MM_RET_AMT= Math.round((AVG_MM_PAY_AMT + AVG_MM_BONUS_AMT + AVG_MM_ANN_AMT) / dDaySum);
                        SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                        //numavg_monthly_retire_amt.Value = Math.Round((numavg_monthly_pay_amt.Value + numavg_monthly_bonus_amt.Value + numavg_monthly_annual_amt.Value) / dDaySum);
                    }

                    if (dDaySumNorm != 0)
                    {
                        let AVG_MM_RET_AMT_NORM = Math.round((AVG_MM_PAY_AMT_NORM + AVG_MM_BONUS_AMT_NORM + AVG_MM_ANN_AMT_NORM) / dDaySumNorm);
                        SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                        //numavg_monthly_retire_amt_norm.Value = Math.Round((numavg_monthly_pay_amt_norm.Value + numavg_monthly_bonus_amt_norm.Value + numavg_monthly_annual_amt_norm.Value) / dDaySumNorm);
                    }

                    if (dDaySumPeak != 0)
                    {
                        let AVG_MM_RET_AMT_PEAK = Math.round((AVG_MM_PAY_AMT_PEAK + AVG_MM_BONUS_AMT_PEAK + AVG_MM_ANN_AMT_PEAK) / dDaySumPeak);
                        SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                        //numavg_monthly_retire_amt_peak.Value = Math.Round((numavg_monthly_pay_amt_peak.Value + numavg_monthly_bonus_amt_peak.Value + numavg_monthly_annual_amt_peak.Value) / dDaySumPeak);
                    }
                }
                else if (stravg_pay_type == "20")
                {
                    if (strjob_group == "3")
                    {
                        if (dDaySum != 0)
                        {
                            let AVG_MM_RET_AMT= Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + (dSum / 365) + (ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum) + (dSum / 365) + (numannual_benefit_amt.Value / 365));
                        }
                        else
                        {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT)) + (dSum / 365) + (ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value) + (dSum / 365) + (numannual_benefit_amt.Value / 365));
                        }

                        if (dDaySumNorm != 0)
                        {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + (dSumNorm / 365) + (ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (dSumNorm / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }
                        else
                        {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM)) + (dSumNorm / 365) + (ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt.Value) + (dSumNorm / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }

                        if (dDaySumPeak != 0)
                        {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + (dSumPeak / 365) + (ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (dSumPeak / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                        else
                        {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK)) + (dSumPeak / 365) + (ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value) + (dSumPeak / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                    }
                    else
                    {
                        if (dDaySum != 0)
                        {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + (dSum / 360) + (ANN_BENEFIT_AMT / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum) + (dSum / 360) + (numannual_benefit_amt.Value / 360));
                        }
                        else
                        {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT)) + (dSum / 360) + (ANN_BENEFIT_AMT / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value) + (dSum / 360) + (numannual_benefit_amt.Value / 360));
                        }

                        if (dDaySumNorm != 0)
                        {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + (dSumNorm / 360) + (ANN_BENEFIT_AMT_NORM / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (dSumNorm / 360) + (numannual_benefit_amt_norm.Value / 360));
                        }
                        else
                        {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM)) + (dSumNorm / 360) + (ANN_BENEFIT_AMT_NORM / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value) + (dSumNorm / 360) + (numannual_benefit_amt_norm.Value / 360));
                        }

                        if (dDaySumPeak != 0)
                        {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) +(dSumPeak / 360) + (ANN_BENEFIT_AMT_PEAK / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (dSumPeak / 360) + (numannual_benefit_amt_peak.Value / 360));
                        }
                        else
                        {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK)) + (dSumPeak / 360) + (ANN_BENEFIT_AMT_PEAK / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value) + (dSumPeak / 360) + (numannual_benefit_amt_peak.Value / 360));
                        }
                    }
                }

                else if (stravg_pay_type == "30")
                {
                    if (strjob_group == "3")
                    {
                        if (dDaySum != 0)
                        {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + (dSum / 365) + (ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum)  + (dSum / 365)  + (numannual_benefit_amt.Value / 365));
                        }
                        else
                        {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT)) + (dSum / 365) + (ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value) + (dSum / 365) + (numannual_benefit_amt.Value / 365));
                        }

                        if (dDaySumNorm != 0)
                        {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + (dSumNorm / 365)  + (ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (dSumNorm / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }
                        else
                        {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM)) + (dSumNorm / 365) + (ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value) + (dSumNorm / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }

                        if (dDaySumPeak != 0)
                        {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + (dSumPeak / 365) + (ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (dSumPeak / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                        else
                        {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK)) + (dSumPeak / 365) + (ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value) + (dSumPeak / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                    }
                    else
                    {
                        if (dDaySum != 0)
                        {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + (dSum / 365) + (ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum)  + (dSum / 365) + (numannual_benefit_amt.Value / 365));
                        }
                        else
                        {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT)) + (dSum / 365) + (ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value) + (dSum / 365) + (numannual_benefit_amt.Value / 365));
                        }
                        if (dDaySumNorm != 0)
                        {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + (dSumNorm / 365) + (ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (dSumNorm / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }
                        else
                        {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM)) + (dSumNorm / 365) + (ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value) + (dSumNorm / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }
                        if (dDaySumPeak != 0)
                        {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + (dSumPeak / 365) + (ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (dSumPeak / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                        else
                        {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK)) + (dSumPeak / 365) + (ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value) + (dSumPeak / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                    }
                }
            }
            else if (RET_CALC_TYPE == 'RETIRE_P' || RET_CALC_TYPE == 'MIDDLE_P') {
                //numavg_monthly_bonus_amt.Value = Math.Floor(dSum / 12);
                SBUxMethod.set("AVG_MM_BONUS_AMT", 			    Math.floor(dSum / 4)); //평균상여
                SBUxMethod.set("AVG_MM_BONUS_AMT_NORM", 	    Math.floor(dSumNorm / 4)); //평균상여
                SBUxMethod.set("AVG_MM_BONUS_AMT_PEAK", 		Math.Floor(dSumPeak / 4)); //평균상여
                /*numavg_monthly_bonus_amt.Value = Math.Floor(dSum / 4);
                numavg_monthly_bonus_amt_norm.Value = Math.Floor(dSumNorm / 4);
                numavg_monthly_bonus_amt_peak.Value = Math.Floor(dSumPeak / 4);*/

                if (dDaySum != 0)
                {
                    let AVG_MM_RET_AMT= Math.round((AVG_MM_PAY_AMT + AVG_MM_BONUS_AMT + AVG_MM_ANN_AMT) / dDaySum);
                    SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                    //numavg_monthly_retire_amt.Value = Math.Round((numavg_monthly_pay_amt.Value + numavg_monthly_bonus_amt.Value + numavg_monthly_annual_amt.Value) / dDaySum);
                }

                if (dDaySumNorm != 0)
                {
                    let AVG_MM_RET_AMT_NORM = Math.round((AVG_MM_PAY_AMT_NORM + AVG_MM_BONUS_AMT_NORM + AVG_MM_ANN_AMT_NORM) / dDaySumNorm);
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                    //numavg_monthly_retire_amt_norm.Value = Math.Round((numavg_monthly_pay_amt_norm.Value + numavg_monthly_bonus_amt_norm.Value + numavg_monthly_annual_amt_norm.Value) / dDaySumNorm);
                }

                if (dDaySumPeak != 0)
                {
                    let AVG_MM_RET_AMT_PEAK = Math.round((AVG_MM_PAY_AMT_PEAK + AVG_MM_BONUS_AMT_PEAK + AVG_MM_ANN_AMT_PEAK) / dDaySumPeak);
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                    //numavg_monthly_retire_amt_peak.Value = Math.Round((numavg_monthly_pay_amt_peak.Value + numavg_monthly_bonus_amt_peak.Value + numavg_monthly_annual_amt_peak.Value) / dDaySumPeak);
                }
                if (stravg_pay_type == "10")
                {
                    if (dDaySum != 0)
                    {
                        let AVG_MM_RET_AMT= Math.round((AVG_MM_PAY_AMT + AVG_MM_BONUS_AMT + AVG_MM_ANN_AMT) / dDaySum);
                        SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                        //numavg_monthly_retire_amt.Value = Math.Round((numavg_monthly_pay_amt.Value + numavg_monthly_bonus_amt.Value + numavg_monthly_annual_amt.Value) / dDaySum);
                    }

                    if (dDaySumNorm != 0)
                    {
                        let AVG_MM_RET_AMT_NORM = Math.round((AVG_MM_PAY_AMT_NORM + AVG_MM_BONUS_AMT_NORM + AVG_MM_ANN_AMT_NORM) / dDaySumNorm);
                        SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                        // numavg_monthly_retire_amt_norm.Value = Math.Round((numavg_monthly_pay_amt_norm.Value + numavg_monthly_bonus_amt_norm.Value + numavg_monthly_annual_amt_norm.Value) / dDaySumNorm);
                    }

                    if (dDaySumPeak != 0)
                    {
                        let AVG_MM_RET_AMT_PEAK = Math.round((AVG_MM_PAY_AMT_PEAK + AVG_MM_BONUS_AMT_PEAK + AVG_MM_ANN_AMT_PEAK) / dDaySumPeak);
                        SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                        //numavg_monthly_retire_amt_peak.Value = Math.Round((numavg_monthly_pay_amt_peak.Value + numavg_monthly_bonus_amt_peak.Value + numavg_monthly_annual_amt_peak.Value) / dDaySumPeak);
                    }
                }
                else if (stravg_pay_type == "20")
                {
                    if (strjob_group == "3")
                    {
                        if (dDaySum != 0)
                        {
                            let AVG_MM_RET_AMT= Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + (dSum / 365) + (ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum) + (dSum / 365) + (numannual_benefit_amt.Value / 365));
                        }
                        if (dDaySumNorm != 0)
                        {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + (dSumNorm / 365) + (ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (dSumNorm / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }
                        if (dDaySumPeak != 0)
                        {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + (dSumPeak / 365) + (ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (dSumPeak / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                    }
                    else
                    {
                        if (dDaySum != 0)
                        {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + (dSum / 360) + (ANN_BENEFIT_AMT / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum) + (dSum / 360) + (numannual_benefit_amt.Value / 360));
                        }

                        if (dDaySumNorm != 0)
                        {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + (dSumNorm / 360) + (ANN_BENEFIT_AMT_NORM / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (dSumNorm / 360) + (numannual_benefit_amt_norm.Value / 360));
                        }

                        if (dDaySumPeak != 0)
                        {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + (dSumPeak / 360) + (ANN_BENEFIT_AMT_PEAK / 360);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (dSumPeak / 360) + (numannual_benefit_amt_peak.Value / 360));
                        }
                    }
                }

                else if (stravg_pay_type == "30")
                {
                    if (strjob_group == "3")
                    {
                        if (dDaySum != 0)
                        {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + (dSum / 365) + (ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum) + (dSum / 365) + (numannual_benefit_amt.Value / 365));
                        }
                        if (dDaySumNorm != 0)
                        {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + (dSumNorm / 365) + (ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (dSumNorm / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }
                        if (dDaySumPeak != 0)
                        {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + (dSumPeak / 365) + (ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (dSumPeak / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                    }
                    else
                    {
                        if (dDaySum != 0)
                        {
                            let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + (dSum / 365) + (ANN_BENEFIT_AMT / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                            //numavg_monthly_retire_amt.Value = Math.Truncate((numavg_monthly_pay_amt.Value / dDaySum) + (dSum / 365) + (numannual_benefit_amt.Value / 365));
                        }
                        if (dDaySumNorm != 0)
                        {
                            let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + (dSumNorm / 365) + (ANN_BENEFIT_AMT_NORM / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                            //numavg_monthly_retire_amt_norm.Value = Math.Truncate((numavg_monthly_pay_amt_norm.Value / dDaySumNorm) + (dSumNorm / 365) + (numannual_benefit_amt_norm.Value / 365));
                        }
                        if (dDaySumPeak != 0)
                        {
                            let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + (dSumPeak / 365) + (ANN_BENEFIT_AMT_PEAK / 365);
                            SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                            //numavg_monthly_retire_amt_peak.Value = Math.Truncate((numavg_monthly_pay_amt_peak.Value / dDaySumPeak) + (dSumPeak / 365) + (numannual_benefit_amt_peak.Value / 365));
                        }
                    }
                }
            }
        }
    }



    //임금 환산 년수 스트 값 변경시
    //임금 환산 년수
    const gridValueChanged3 = async function () {

        var nCol = gvwChangeGrid.getCol();
        if (nCol < 1) {
            return;
        }
        var nRow = gvwChangeGrid.getRow();
        if (nRow < 1) {
            return;
        }
        console.log('-nRow--', nRow);

        let gridData = gvwChangeGrid.getGridDataAll();
        let rowData = gvwChangeGrid.getRowData(nRow);

        if (_.isEmpty(rowData)) {
            return;
        }

        if (_.isEmpty(gridData) == false) {
            if (gvwChangeGrid.getColRef("POSITION_CODE") == nCol) {
                if (gfnma_nvl(rowData.POSITION_CODE) == '') {
                    gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("PAY_MULTIPLE_NUMBER"), 1);
                } else {
                    if (gvwChange.DataRowCount > 0) {
                        position_aa = gfnma_nvl(rowData.POSITION_CODE);


                        gridData.forEach((item, index) => {

                            if (nRow != index) {
                                position_bb = gfnma_nvl(rowData.POSITION_CODE);

                                if (position_aa == position_bb) {
                                    gfn_comAlert("Q0000", "이미 등록되어 있는 직위입니다");
                                    //SetMessageBox("이미 등록되어 있는 직위입니다");
                                    gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("POSITION_CODE"), '');
                                    //gvwChange.SetFocusedRowCellValue("position_code", "");
                                    return;
                                }
                            }

                        });
                    }


                    let query = "select nvl(extra_field4,0) as multiple_num from comcodemaster where group_code = 'HRI002' and sub_code = '" + rowData.POSITION_CODE + "' ";
                    let cnt = fn_getMmCnt(query);
                    //ResultSet rs = CommonDirectSQL(Query);

                    if (cnt != '') {
                        gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("PAY_MULTIPLE_NUMBER"), Number(cnt));
                    }
                }
            }

            if (gvwChangeGrid.getColRef("pay_multiple_number") == nCol) {
                if (Math.floor(rowData.PAY_MULTIPLE_NUMBER) <= 0) {
                    gfn_comAlert("Q0000", "지급배수는 0이하일 수 없습니다.");
                    //SetMessageBox("지급배수는 0이하일 수 없습니다.");
                    gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("PAY_MULTIPLE_NUMBER"), 1.0);
                    //gvwChange.SetFocusedRowCellValue("pay_multiple_number", 1.0);
                    return;
                }

                let chk_basu = 1; //지급배수 변수

                if (gfnma_nvl(rowData.PAY_MULTIPLE_NUMBER) == '') {
                    chk_basu = 1;
                } else {
                    chk_basu = Math.floor(gfnma_nvl(rowData.PAY_MULTIPLE_NUMBER));
                }

                let query = "select ROUND((MONTHS_BETWEEN(TO_DATE('" + gfnma_nvl(rowData.END_DAT) + "','yyyymmdd')+1, TO_DATE('" + gfnma_nvl(rowData.ST_DAT) + "','yyyymmdd'))) * " + chk_basu + ",5) as recive from dual";
                let cnt = fn_getMmCnt(query);
                // ResultSet rs = CommonDirectSQL(Query);
                gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("CHG_MM_CNT"), Number(cnt));
                //gvwChange.SetFocusedRowCellValue("chg_mm_cnt", rs.ResultDataSet.Tables[0].Rows[0]["recive"].ToString());

            }


            if (gvwChangeGrid.getColRef("ST_DAT") == nCol || gvwChangeGrid.getColRef("END_DAT") == nCol) {


                if (gvwChangeGrid.getColRef("ST_DAT") == nCol) {
                    let CALC_ST_DAT = gfnma_nvl(SBUxMethod.get("CALC_ST_DAT"));//정산시작일 [정산기본정보]
                    let CALC_END_DAT = gfnma_nvl(SBUxMethod.get("CALC_END_DAT"));//정산종료일 [정산기본정보]


                    if (rowData.ST_DAT.length == 8) {
                        if (nRow > 0) {

                            cc = rowData.ST_DAT;

                            gridData.forEach((item, index) => {

                                if (nRow != index) {

                                    if (item.ST_DAT.length == 8 && item.END_DAT.length == 8) {
                                        aa = item.ST_DAT;
                                        bb = item.END_DAT;

                                        if (Number(cc) >= Number(aa) && Number(cc) <= Number(bb)) {
                                            gfn_comAlert("Q0000", "이미 등록되어 있는 기간은 등록하실 수 없습니다.");
                                            gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("ST_DAT"), '');
                                            //SetMessageBox("이미 등록되어 있는 기간은 등록하실 수 없습니다.");
                                            //gvwChange.SetFocusedRowCellValue("st_dat", "");
                                            return;
                                        } else if (Number(cc) < Number(CALC_ST_DAT)) {
                                            gfn_comAlert("Q0000", "정산시작일보다 이전 일수 없습니다.");
                                            gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("ST_DAT"), '');
                                            /*SetMessageBox("정산시작일보다 이전 일수 없습니다.");
                                            gvwChange.SetFocusedRowCellValue("st_dat", "");*/
                                            return;
                                        } else if (Number(cc) > Number(CALC_END_DAT)) {
                                            gfn_comAlert("Q0000", "정산종료일보다 이후 일수 없습니다.");
                                            gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("ST_DAT"), '');
                                            /*SetMessageBox("정산종료일보다 이후 일수 없습니다.");
                                            gvwChange.SetFocusedRowCellValue("st_dat", "");*/
                                            return;
                                        }
                                    }

                                }

                            });
                        }
                    }

                    if (item.ST_DAT.length == 8 && item.END_DAT.length == 8) {
                        if (Number(item.ST_DAT) > Number(item.END_DAT)) {
                            gfn_comAlert("Q0000", "시작일이 종료일보다 이후 일수 없습니다.");
                            gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("ST_DAT"), '');
                            /*SetMessageBox("시작일이 종료일보다 이후 일수 없습니다.");
                            gvwChange.SetFocusedRowCellValue("st_dat", "");*/
                            return;
                        }

                    }
                    if (Number(item.ST_DAT) < Number(CALC_ST_DAT)) {
                        gfn_comAlert("Q0000", "적용시작일이 정산시작일보다 이전 일수 없습니다.");
                        gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("ST_DAT"), '');
                        /* SetMessageBox("적용시작일이 정산시작일보다 이전 일수 없습니다.");
                         gvwChange.SetFocusedRowCellValue("st_dat", "");*/
                        return;
                    }

                    if (Number(item.ST_DAT) > Number(CALC_END_DAT)) {
                        gfn_comAlert("Q0000", "적용시작일이 정산종료일보다 이후 일수 없습니다.");
                        gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("ST_DAT"), '');
                        /*SetMessageBox("적용시작일이 정산종료일보다 이후 일수 없습니다.");
                        gvwChange.SetFocusedRowCellValue("st_dat", "");*/
                        return;
                    }
                }
            }

            if (gvwChangeGrid.getColRef("END_DAT") == nCol) {

                let CALC_ST_DAT = gfnma_nvl(SBUxMethod.get("CALC_ST_DAT"));//정산시작일 [정산기본정보]
                let CALC_END_DAT = gfnma_nvl(SBUxMethod.get("CALC_END_DAT"));//정산종료일 [정산기본정보]

                if (item.END_DAT.length == 8) {
                    if (nRow > 0) {
                        cc = rowData.END_DAT;

                        gridData.forEach((item, index) => {

                            if (nRow != index) {

                                if (item.ST_DAT.length == 8 && item.END_DAT.length == 8) {
                                    aa = item.ST_DAT;
                                    bb = item.END_DAT;

                                    if (Number(cc) >= Number(aa) && Number(cc) <= Number(bb)) {
                                        gfn_comAlert("Q0000", "이미 등록되어 있는 기간은 등록하실 수 없습니다.");
                                        gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("END_DAT"), '');
                                        //SetMessageBox("이미 등록되어 있는 기간은 등록하실 수 없습니다.");
                                        //gvwChange.SetFocusedRowCellValue("st_dat", "");
                                        return;
                                    } else if (Number(cc) < Number(CALC_ST_DAT)) {
                                        gfn_comAlert("Q0000", "정산시작일보다 이전 일수 없습니다.");
                                        gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("END_DAT"), '');
                                        /*SetMessageBox("정산시작일보다 이전 일수 없습니다.");
                                        gvwChange.SetFocusedRowCellValue("st_dat", "");*/
                                        return;
                                    } else if (Number(cc) > Number(CALC_END_DAT)) {
                                        gfn_comAlert("Q0000", "정산종료일보다 이후 일수 없습니다.");
                                        gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("END_DAT"), '');
                                        /*SetMessageBox("정산종료일보다 이후 일수 없습니다.");
                                        gvwChange.SetFocusedRowCellValue("st_dat", "");*/
                                        return;
                                    }
                                }

                            }

                        });
                    }

                    if (item.ST_DAT.ㅣength == 8 && item.END_DAT.ㅣength == 8) {
                        if (Number(item.END_DAT) < Number(item.ST_DAT)) {
                            gfn_comAlert("Q0000", "종료일이 시작일보다 이전 일수 없습니다.");
                            gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("END_DAT"), '');
                            /*SetMessageBox("종료일이 시작일보다 이전 일수 없습니다.");
                            gvwChange.SetFocusedRowCellValue("end_dat", "");*/
                            return;
                        }
                    }

                    if (Number(item.END_DAT) < Number(CALC_END_DAT)) {
                        gfn_comAlert("Q0000", "적용종료일이 정산종료일보다 이후 일수 없습니다.");
                        gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("END_DAT"), '');
                        /* SetMessageBox("적용종료일이 정산종료일보다 이후 일수 없습니다.");
                         gvwChange.SetFocusedRowCellValue("end_dat", "");*/
                        return;
                    }

                    if (Number(item.END_DAT) < Number(CALC_ST_DAT)) {
                        gfn_comAlert("Q0000", "적용종료일이 정산시작일보다 이전 일수 없습니다.");
                        gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("END_DAT"), '');
                        /*SetMessageBox("적용종료일이 정산시작일보다 이전 일수 없습니다.");
                        gvwChange.SetFocusedRowCellValue("end_dat", "");*/
                        return;
                    }


                }
            }


            if (item.ST_DAT.length == 8 && item.END_DAT.length == 8) {

                let endDat = Number(item.END_DAT);

                let dateYear = endDat.slice(0, -4);
                let dateMm = endDat.slice(4, -2);
                let dateDd = endDat.slice(6, 8);
                let dateFormat = dateYear + '-' + dateMm + '-' + dateDd;

                let datDate = new Date(dateFormat);
                datDate.setDate(datDate.getDate() + 1)

                let endDate = gfn_dateToYmd(datDate);

                let gap_day = fn_dataDiff("d", item.ST_DAT, endDate);

                let chk_gap = new Date();
                chk_gap.setDate(datDate.getDate() + Number(gap_day));

                let chk_gap_date = gfn_dateToYmd(chk_gap);
                let year = chk_gap_date.slice(0, -4);
                let mm = chk_gap_date.slice(4, -2);
                let dd = chk_gap_date.slice(6, 8);

                gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("YY_CNT"), Number(year));
                gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("MM_CNT"), Number(mm));
                gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("DD_CNT"), Number(dd));
                gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("DD_TOT_CNT"), Number(gap_day));

                /*gvwChange.SetFocusedRowCellValue("yy_cnt", int.Parse(chk_gap.AddDays(gap_day).ToString("yyyy-MM-dd").Substring(0, 4)) - 1);
                gvwChange.SetFocusedRowCellValue("mm_cnt", int.Parse(chk_gap.AddDays(gap_day).ToString("yyyy-MM-dd").Substring(5, 2)) - 1);
                gvwChange.SetFocusedRowCellValue("dd_cnt", int.Parse(chk_gap.AddDays(gap_day).ToString("yyyy-MM-dd").Substring(8, 2)) - 1);
                gvwChange.SetFocusedRowCellValue("dd_tot_cnt", gap_day.ToString());*/

                let chk_basu = 1; //지급배수 변수

                if (gfnma_nvl(item.PAY_MULTIPLE_NUMBER) == '') {
                    chk_basu = 1;
                } else {
                    chk_basu = Math.floor(item.PAY_MULTIPLE_NUMBER);
                }

                let query = "select ROUND((MONTHS_BETWEEN(TO_DATE('" + item.END_DAT + "','yyyymmdd')+1, TO_DATE('" + item.ST_DAT + "','yyyymmdd'))) * " + chk_basu + ",5) as recive from dual";
                let cnt = fn_getMmCnt(query);
                //ResultSet rs = CommonDirectSQL(Query);

                gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("CHG_MM_CNT"), Number(cnt));
                //gvwChange.SetFocusedRowCellValue("chg_mm_cnt", rs.ResultDataSet.Tables[0].Rows[0]["recive"].ToString());

            }
        }


        /*  /!******************** 직위가 중복일시 제한 ***********************!/
          let positonCode = '';
          for (let i = 0; i < gridData.length; i++) {

              if (positonCode == '') {
                  positonCode = gridData[i].POSITION_CODE;
                  continue;
              }
              //직위 중복시
              if (_.isEqual(positonCode, gridData[i].POSITION_CODE)) {
                  gfn_comAlert("W0010", "등록", "직위") // W0010 이미 {0}된 {1} 입니다.
                  gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("POSITION_CODE"), '');
                  break;
              }
          }

          /!******************** 적용 시작일, 종료일 제한 ***********************!/
          if (_.isEqual(nCol, gvwChangeGrid.getColRef("ST_DAT")) || _.isEqual(nCol, gvwChangeGrid.getColRef("END_DAT"))) {

              let CALC_ST_DAT = gfnma_nvl(SBUxMethod.get("CALC_ST_DAT"));//정산시작일 [정산기본정보]
              let CALC_END_DAT = gfnma_nvl(SBUxMethod.get("CALC_END_DAT"));//정산종료일 [정산기본정보]

              let cc = rowData.ST_DAT;
              let dd = rowData.END_DAT;


              for (let i = 0; i < gridData.length; i++) {

                  if (i + 1 != nRow) {
                      let aa = item.ST_DAT;
                      let bb = item.END_DAT;

                      if (_.isEmpty(aa) == false && _.isEmpty(bb) == false){

                          if (Number(cc) >= Number(aa) && Number(cc) <= Number(bb)) {
                              gfn_comAlert("E0000", "이미 등록되어 있는 기간은 등록하실 수 없습니다.");
                              gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("ST_DAT"), '');
                              break;
                              /!* SetMessageBox("이미 등록되어 있는 기간은 등록하실 수 없습니다.");
                               gvwChange.SetFocusedRowCellValue("st_dat", "");
                               return;*!/
                          }
                      }

                      /!* else if (Number(cc) < Number(CALC_ST_DAT))
                       {
                           gfn_comAlert("E0000", "정산시작일보다 이전 일수 없습니다.");
                           gvwPayGrid.setCellData(nRow, gvwChangeGrid.getColRef("ST_DAT"), '');
                           break;
                           /!* SetMessageBox("정산시작일보다 이전 일수 없습니다.");
                            gvwChange.SetFocusedRowCellValue("st_dat", "");
                            return;*!/
                       }
                       else if (Number(cc) > Number(CALC_END_DAT))
                       {
                           gfn_comAlert("E0000", "정산종료일보다 이후 일수 없습니다.");
                           gvwPayGrid.setCellData(nRow, gvwChangeGrid.getColRef("ST_DAT"), '');
                           break;
                           /!* SetMessageBox("정산종료일보다 이후 일수 없습니다.");
                            gvwChange.SetFocusedRowCellValue("st_dat", "");
                            return;*!/
                       }*!/
                  }
              }
              if (_.isEmpty(cc) == false && _.isEmpty(dd) == false){
                  if (Number(cc) > Number(dd)) {
                      gfn_comAlert("E0000", "시작일이 종료일보다 이후 일수 없습니다.");
                      gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("ST_DAT"), '');
                      return;
                  }
              }
              if (Number(cc) < Number(CALC_ST_DAT)) {
                  gfn_comAlert("E0000", "정산시작일보다 이전 일수 없습니다.");
                  gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("ST_DAT"), '');
                  return;
                  /!* SetMessageBox("정산시작일보다 이전 일수 없습니다.");
                   gvwChange.SetFocusedRowCellValue("st_dat", "");
                   return;*!/
              } else if (Number(cc) > Number(CALC_END_DAT)) {
                  gfn_comAlert("E0000", "정산종료일보다 이후 일수 없습니다.");
                  gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("ST_DAT"), '');
                  return;
                  /!* SetMessageBox("정산종료일보다 이후 일수 없습니다.");
                   gvwChange.SetFocusedRowCellValue("st_dat", "");
                   return;*!/
              }


          }

          /!******************** 종료일 제한 ***********************!/
          if (_.isEqual(nCol, gvwChangeGrid.getColRef("END_DAT"))) {

              let cc = rowData.END_DAT;

              if (_.isEmpty(cc)){
                  return;
              }

              for (let i = 0; i < gridData.length; i++) {

                  if (i + 1 != nRow) {

                      let aa = item.ST_DAT;
                      let bb = item.END_DAT;

                      if (_.isEmpty(aa) == false && _.isEmpty(bb) == false){

                          if (Number(cc) >= Number(aa) && Number(cc) <= Number(bb)) {
                              gfn_comAlert("E0000", "이미 등록되어 있는 기간은 등록하실 수 없습니다.");
                              gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("END_DAT"), '');
                              break;
                              /!* SetMessageBox("이미 등록되어 있는 기간은 등록하실 수 없습니다.");
                               gvwChange.SetFocusedRowCellValue("st_dat", "");
                               return;*!/
                          }
                      }
                      if (Number(cc) < Number(CALC_ST_DAT)) {
                          gfn_comAlert("E0000", "정산시작일보다 이전 일수 없습니다.");
                          gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("END_DAT"), '');
                          break;
                          /!* SetMessageBox("정산시작일보다 이전 일수 없습니다.");
                           gvwChange.SetFocusedRowCellValue("st_dat", "");
                           return;*!/
                      }else if (Number(cc) > Number(CALC_END_DAT)) {
                          gfn_comAlert("E0000", "정산종료일보다 이후 일수 없습니다.");
                          gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("END_DAT"), '');
                          break;
                          /!* SetMessageBox("정산종료일보다 이후 일수 없습니다.");
                           gvwChange.SetFocusedRowCellValue("st_dat", "");
                           return;*!/
                      }

                  }
              }

          }

          /!******************** 지급배수 ***********************!/
          if (_.isEqual(nCol, gvwChangeGrid.getColRef("PAY_MULTIPLE_NUMBER")) || _.isEqual(nCol, gvwChangeGrid.getColRef("ST_DAT")) || _.isEqual(nCol, gvwChangeGrid.getColRef("END_DAT"))) {

              let PAY_MULTIPLE_NUMBER =  rowData.PAY_MULTIPLE_NUMBER;
              let END_DAT = rowData.END_DAT;
              let ST_DAT = rowData.ST_DAT;

              if (_.isEmpty(PAY_MULTIPLE_NUMBER) || _.isEmpty(END_DAT) || _.isEmpty(ST_DAT)  ){
                  return;
              }

              let number = Math.floor(PAY_MULTIPLE_NUMBER); //소수점 제거

              if (number <= 0){

                  gfn_comAlert("E0000", "지급배수는 0이하일 수 없습니다.");
                  gvwChangeGrid.setCellData(nRow, gvwChangeGrid.getColRef("PAY_MULTIPLE_NUMBER"), '');
                  return;
              }

              let chk_basu = 1;

              if (_.isEmpty(PAY_MULTIPLE_NUMBER)){
                  chk_basu = 1;
              }else{
                  chk_basu = PAY_MULTIPLE_NUMBER;

                  let query ="select ROUND((MONTHS_BETWEEN(TO_DATE('" + END_DAT + "','yyyymmdd')+1, TO_DATE('" + ST_DAT + "','yyyymmdd'))) * " + chk_basu + ",5) as recive from dual";

                  //임금환산년수 지금배수로 환산개월수 구하기
                  let cnt = fn_getMmCnt(query);

                  /!*console.log('------multiVal-------', multiVal);

                  gvwPayGrid.setCellData(nRow, gvwChangeGrid.getColRef("CHG_MM_CNT"), Number(multiVal));*!/

              }

          }*/
    }

    //임금환산년수 지금배수로 환산개월수 구하기
    const fn_getMmCnt = async function (query) {

        var paramObj = {
            MULTIPLE: query

        }

        const postJsonPromise = gfn_postJSON("/hr/hrp/ret/chkMulti5150.do", paramObj);

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                }

                return gfnma_nvl(data.MULTIPLE);//환산개월수
                //gvwChangeGrid.setCellData(row, col, Number(data.MULTIPLE)); //환산개월수 셋팅
                /* return  data.MULTIPLE;*/

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
    /**
     * 확정버튼
     */
    const fn_btnConfirm = async function (type) {

        // 수정 저장
        if (gfn_comConfirm("Q0001", "선택한 사원을 확정")) {

            let SITE_CODE = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
            //let RET_CALC_TYPE = gfnma_nvl(SBUxMethod.get("SRCH_RET_CALC_TYPE")); //퇴직정산구분
            let RET_CALC_TYPE = gfnma_multiSelectGet('#SRCH_RET_CALC_TYPE');
            let RETIRE_CALC_DATE_FR = gfnma_nvl(SBUxMethod.get("SRCH_RETIRE_CALC_DATE_FR")); //정산종료일
            let RETIRE_CALC_DATE_TO = gfnma_nvl(SBUxMethod.get("SRCH_RETIRE_CALC_DATE_TO")); //정산종료일
            let EMP_CODE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사번
            let EMP_NAME = gfnma_nvl(SBUxMethod.get("SRCH_EMP_NAME")); //이름
            let RET_CALC_DAT = gfnma_nvl(SBUxMethod.get("SRCH_RET_CALC_DAT")); //정산일
            let CALCULATE_TAX_YN = SBUxMethod.get("SRCH_CALCULATE_TAX_YN"); //과세계산여부
            let CALCULATE_PREV_YN = SBUxMethod.get("SRCH_CALCULATE_PREV_YN"); //중간지급 포함
            let TO_DC_YN = SBUxMethod.get("TO_DC_YN"); //DC전환


            if (!RET_CALC_TYPE) {
                gfn_comAlert("W0002", "퇴직정산구분");
                return;
            }
            if (!RETIRE_CALC_DATE_FR) {
                gfn_comAlert("W0002", "정산종료일");
                return;
            }
            if (!RETIRE_CALC_DATE_TO) {
                gfn_comAlert("W0002", "정산종료일");
                return;
            }
            if (!RET_CALC_DAT) {
                gfn_comAlert("W0002", "정산일");
                return;
            }

            let stremp_code = '';
            let strretire_calc_date = '';

            let masterData = gvwMasterGrid.getGridDataAll();

            masterData.forEach((item, index) =>{

                stremp_code         += item.EMP_CODE + '|';
                strretire_calc_date += item.RET_CALC_DAT + '|';

            });

            if (stremp_code == ''){
                gfn_comAlert("W0001", "사원");		//	W0001	{0}을/를 선택하세요.
                return;
            }else{
                stremp_code = stremp_code.slice(0, -1);
            }

            if (strretire_calc_date != ''){
                strretire_calc_date = strretire_calc_date.slice(0, -1);
            }


            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                , V_P_LANG_ID: ''
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                ,V_P_RET_CALC_TYPE     : RET_CALC_TYPE
                ,V_P_RET_CALC_DAT      : RET_CALC_DAT
                ,V_P_CALCULATE_PREV_YN : CALCULATE_PREV_YN['SRCH_CALCULATE_PREV_YN']
                ,V_P_CALCULATE_TAX_YN  : CALCULATE_TAX_YN['SRCH_CALCULATE_TAX_YN']
                ,V_P_EMP_CODE          : stremp_code
                ,V_P_EMP_CODE_CALC_DAT : strretire_calc_date
                ,V_P_TO_DC_YN          : TO_DC_YN.TO_DC_YN

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: ''
                , V_P_PC: ''

            };

            console.log('--------------------CONFIRMparamObj-----------------------',paramObj);

            const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5150BAT.do", {
                getType: 'json',
                workType: type,
                cv_count: '0',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            console.log('--------------------CONFIRMdatadata-----------------------',data);

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);

                    } else {
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.

                        fn_search();
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
    }

    /* /!**
      * 확정취소버튼
      *!/
     const fn_btnCancel = async function () {

         // 수정 저장
         if (gfn_comConfirm("Q0001", "선택한 사원을 확정")) {

             let RET_CALC_TYPE = gfnma_multiSelectGet('#SRCH_RET_CALC_TYPE');
             let RETIRE_CALC_DATE_FR = gfnma_nvl(SBUxMethod.get("SRCH_RETIRE_CALC_DATE_FR")); //정산종료일
             let RETIRE_CALC_DATE_TO = gfnma_nvl(SBUxMethod.get("SRCH_RETIRE_CALC_DATE_TO")); //정산종료일
             let RET_CALC_DAT = gfnma_nvl(SBUxMethod.get("SRCH_RET_CALC_DAT")); //정산일
             let CALCULATE_TAX_YN = SBUxMethod.get("SRCH_CALCULATE_TAX_YN"); //과세계산여부
             let CALCULATE_PREV_YN = SBUxMethod.get("SRCH_CALCULATE_PREV_YN"); //중간지급 포함
             let TO_DC_YN = SBUxMethod.get("TO_DC_YN"); //DC전환

             if (!RET_CALC_TYPE) {
                 gfn_comAlert("W0002", "퇴직정산구분");
                 return;
             }
             if (!RETIRE_CALC_DATE_FR) {
                 gfn_comAlert("W0002", "정산종료일");
                 return;
             }
             if (!RETIRE_CALC_DATE_TO) {
                 gfn_comAlert("W0002", "정산종료일");
                 return;
             }
             if (!RET_CALC_DAT) {
                 gfn_comAlert("W0002", "정산일");
                 return;
             }

             let stremp_code = '';
             let strretire_calc_date = '';

             let masterData = gvwMasterGrid.getGridDataAll();

             masterData.forEach((item, index) =>{

                 stremp_code         += item.EMP_CODE + '|';
                 strretire_calc_date += item.RET_CALC_DAT + '|';

             });

             if (stremp_code == ''){
                 gfn_comAlert("W0001", "사원");		//	W0001	{0}을/를 선택하세요.
                 return false;
             }else{
                 stremp_code.slice(0, -1);
             }

             if (strretire_calc_date != ''){
                 strretire_calc_date.slice(0, -1);
             }


             var paramObj = {
                 V_P_DEBUG_MODE_YN: ''
                 , V_P_LANG_ID: ''
                 , V_P_COMP_CODE: gv_ma_selectedApcCd
                 , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                 ,V_P_RET_CALC_TYPE     : RET_CALC_TYPE
                 ,V_P_RET_CALC_DAT      : RET_CALC_DAT
                 ,V_P_CALCULATE_PREV_YN : CALCULATE_PREV_YN.CALCULATE_PREV_YN
                 ,V_P_CALCULATE_TAX_YN  : CALCULATE_TAX_YN.CALCULATE_TAX_YN
                 ,V_P_EMP_CODE          : stremp_code
                 ,V_P_EMP_CODE_CALC_DAT : strretire_calc_date
                 ,V_P_TO_DC_YN          : TO_DC_YN.TO_DC_YN

                 , V_P_FORM_ID: p_formId
                 , V_P_MENU_ID: p_menuId
                 , V_P_PROC_ID: ''
                 , V_P_USERID: ''
                 , V_P_PC: ''

             };

             console.log('--------------------CANCELparamObj-----------------------',paramObj);

             const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5150BAT.do", {
                 getType: 'json',
                 workType: 'CANCEL',
                 cv_count: '0',
                 params: gfnma_objectToString(paramObj)
             });

             const data = await postJsonPromise;

             console.log('--------------------CANCELdatadata-----------------------',data);

             try {
                 if (_.isEqual("S", data.resultStatus)) {
                     if (data.resultMessage) {
                         alert(data.resultMessage);

                         return false;
                     } else {
                         return true;
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
     }*/

    /**
     * 일괄계산
     */
    const fn_btnCalculate = async function (type) {

        let SITE_CODE = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        //let RET_CALC_TYPE = gfnma_nvl(SBUxMethod.get("SRCH_RET_CALC_TYPE")); //퇴직정산구분
        let RET_CALC_TYPE = gfnma_multiSelectGet('#SRCH_RET_CALC_TYPE');
        let RETIRE_CALC_DATE_FR = gfnma_nvl(SBUxMethod.get("SRCH_RETIRE_CALC_DATE_FR")); //정산종료일
        let RETIRE_CALC_DATE_TO = gfnma_nvl(SBUxMethod.get("SRCH_RETIRE_CALC_DATE_TO")); //정산종료일
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사번
        let EMP_NAME = gfnma_nvl(SBUxMethod.get("SRCH_EMP_NAME")); //이름
        let RET_CALC_DAT = gfnma_nvl(SBUxMethod.get("SRCH_RET_CALC_DAT")); //정산일
        let CALCULATE_TAX_YN = SBUxMethod.get("SRCH_CALCULATE_TAX_YN"); //과세계산여부
        let CALCULATE_PREV_YN = SBUxMethod.get("SRCH_CALCULATE_PREV_YN"); //중간지급 포함
        let TO_DC_YN = SBUxMethod.get("TO_DC_YN"); //DC전환

        if (!RET_CALC_TYPE) {
            gfn_comAlert("W0002", "퇴직정산구분");
            return;
        }
        if (!RETIRE_CALC_DATE_FR) {
            gfn_comAlert("W0002", "정산종료일");
            return;
        }
        if (!RETIRE_CALC_DATE_TO) {
            gfn_comAlert("W0002", "정산종료일");
            return;
        }
        if (!RET_CALC_DAT) {
            gfn_comAlert("W0002", "정산일");
            return;
        }

        if (_.isEqual(RET_CALC_TYPE, 'MIDDLE')){
            return;
        }

        let PEAK_START_DATE = gfnma_nvl(SBUxMethod.get("PEAK_START_DATE")); //정산시작일
        let masterData = gvwMasterGrid.getGridDataAll();

        if (PEAK_START_DATE == '' || PEAK_START_DATE == null){

            if (gfn_comConfirm("E0000", RET_CALC_DAT+' '+"정산일로 일괄 계산하시겠습니까?")) {



                for (let i = 0; i < masterData.length; i++){

                    if (masterData[i].CHK_YN == 'Y' && masterData[i].RET_CALC_CONFIRM_YN == 'Y'){
                        gfn_comAlert("E0000", "계산결과가 확정되어 있습니다. 확정취소후 실행하십시요.");
                        return;
                    }

                    fn_btnConfirm(type)

                }

            }

        }else{

            let nRow = gvwMasterGrid.getRow();

            if (nRow == -1) {
                nRow = 1;
            }

            let rowData =  gvwMasterGrid.getRowData(nRow);

            if (_.isEmpty(rowData) == false){

                if (rowData.RET_CALC_CONFIRM_YN == 'Y'){
                    gfn_comAlert("E0000", "계산결과가 확정되어 있습니다. 확정취소후 실행하십시요.");
                    return;
                }

                //C#코드에서 막혀있음
                /* if (fnSET_P_HRA5150_PEAK_BAT("CALCULATE"))*/

            }

        }

    }

    /**
     * 이 프로시저는 막혀있음
     */
    const fnSET_P_HRA5150_PEAK_BAT = async function (type) {

    }

    /**
     * 전표처리내역 집계[ fnSET_P_HRA5150_S3 = 'BATCH', 'CANCEL']
     */
    const fn_btnPosting = async function (type) {

        let POSTING_DATE   = gfnma_nvl(SBUxMethod.get("POSTING_DATE")); //회계처리일자

        if (!POSTING_DATE) {
            gfn_comAlert("W0002", "회계처리일자");
            return;
        }

        let PAY_YYYYMM          = gfnma_nvl(SBUxMethod.get("PAY_YYYYMM")); //귀속년월
        let RET_CALC_TYPE		= gfnma_multiSelectGet('#RET_CALC_TYPE');//퇴직정산구분
        let PAY_DATE            = gfnma_nvl(SBUxMethod.get("PAY_DATE")); //퇴직일자
        let EMP_CODE            = gfnma_nvl(SBUxMethod.get("EMP_CODE")); //사원번호 [정산 기본 정보]
        let EXPECTED_PAY_DATE   = gfnma_nvl(SBUxMethod.get("EXPECTED_PAY_DATE")); //지급일
        let CS_CODE             = gfnma_nvl(SBUxMethod.get("CS_CODE")); //거래처
        let MEMO                = gfnma_nvl(SBUxMethod.get("MEMO")); //메모

        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!RET_CALC_TYPE) {
            gfn_comAlert("W0002", "퇴직정산구분");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_PAY_YYYYMM         : PAY_YYYYMM
            ,V_P_PAY_TYPE           : RET_CALC_TYPE
            ,V_P_PAY_DATE           : PAY_DATE
            ,V_P_EMP_CODE           : EMP_CODE
            ,V_P_POSTING_DATE       : POSTING_DATE
            ,V_P_EXPECTED_PAY_DATE  : EXPECTED_PAY_DATE
            ,V_P_CS_CODE            : CS_CODE
            //, --신규
            ,V_P_MEMO               : MEMO
            ,V_P_POSTING_SEQ        : 0
            ,V_P_MEMO_DETAIL        : ''

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''

        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5150S3.do", {
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

                }else{
                    gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                    fn_searchQ2()
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

    /**
     * 회계 반영[ fnSET_P_HRA5150_S4 = 'PAYROLLN', 'PAYROLLD']
     */
    const fn_btnCreatePosting = async function (type) {

        let POSTING_DATE           = gfnma_nvl(SBUxMethod.get("POSTING_DATE")); //회계처리일자
        let PAY_YYYYMM           = gfnma_nvl(SBUxMethod.get("PAY_YYYYMM")); //귀속년월
        let RET_CALC_TYPE		 = gfnma_multiSelectGet('#RET_CALC_TYPE');//퇴직정산구분
        let PAY_DATE           = gfnma_nvl(SBUxMethod.get("PAY_DATE")); //퇴직일자
        let EMP_CODE           = gfnma_nvl(SBUxMethod.get("EMP_CODE")); //사원번호 [정산 기본 정보]
        let EXPECTED_PAY_DATE           = gfnma_nvl(SBUxMethod.get("EXPECTED_PAY_DATE")); //지급일
        let CS_CODE           = gfnma_nvl(SBUxMethod.get("CS_CODE")); //거래처
        let MEMO           = gfnma_nvl(SBUxMethod.get("MEMO")); //메모

        if (!EXPECTED_PAY_DATE) {
            gfn_comAlert("W0002", "지급일");
            return;
        }

        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!RET_CALC_TYPE) {
            gfn_comAlert("W0002", "퇴직정산구분");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_PERIOD_YYYYMM          : PAY_YYYYMM
            ,V_P_PAY_TYPE               : RET_CALC_TYPE
            ,V_P_PAY_DATE               : PAY_DATE
            ,V_P_EMP_CODE               : EMP_CODE
            ,V_P_EXPECTED_PAY_DATE      : EXPECTED_PAY_DATE

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''

        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5150S4.do", {
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

                }else{
                    gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                    fn_searchQ2()
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

    /**
     * 피크시작일
     */
    function fn_peakStartDate() {

        let PEAK_START_DATE           = gfnma_nvl(SBUxMethod.get("PEAK_START_DATE")); //피크시작일
        let RET_DAT           = gfnma_nvl(SBUxMethod.get("PEAK_START_DATE")); //퇴사일
        let ENTER_DATE           = gfnma_nvl(SBUxMethod.get("ENTER_DATE")); //입사일

        let PEAK_START_DATE_FORMAT = PEAK_START_DATE.slice(0,4) + '/' + PEAK_START_DATE.slice(4,6) + '/' + PEAK_START_DATE.slice(6,8)
        let RET_DAT_FORMAT = RET_DAT.slice(0,4) + '/' + RET_DAT.slice(4,6) + '/' + RET_DAT.slice(6,8)

        //데이트 포멧용
        let peakForm = new Date(PEAK_START_DATE_FORMAT);
        let retForm = new Date(RET_DAT_FORMAT);

        SBUxMethod.set("PEAK_CALC_START_DATE", 			PEAK_START_DATE);//피크정산기간
        SBUxMethod.set("PEAK_CALC_END_DATE", 			RET_DAT);

        let PEAK_PAY_START_DATE = new Date(RET_DAT_FORMAT);
        PEAK_PAY_START_DATE.setMonth(retForm.getMonth()-3);
        PEAK_PAY_START_DATE.setDate(retForm.getDate()+1);

        SBUxMethod.set("PEAK_PAY_START_DATE", 			gfn_dateToYmd(PEAK_PAY_START_DATE));//피크급여기간
        SBUxMethod.set("PEAK_PAY_END_DATE", 			RET_DAT);

        let PEAK_BONUS_START_DATE = new Date(RET_DAT_FORMAT);
        PEAK_BONUS_START_DATE.setMonth(retForm.getMonth()-12);
        PEAK_BONUS_START_DATE.setDate(retForm.getDate()+1);
        SBUxMethod.set("PEAK_BONUS_START_DATE", 		gfn_dateToYmd(PEAK_BONUS_START_DATE));//피크상여기간
        SBUxMethod.set("PEAK_BONUS_END_DATE", 			RET_DAT);

        if (Number(gfn_dateToYmd(PEAK_BONUS_START_DATE)) > Number(PEAK_START_DATE)){
            SBUxMethod.set("PEAK_BONUS_START_DATE", 		PEAK_START_DATE);//피크상여기간
        }

        let END_DATE = new Date(PEAK_START_DATE_FORMAT);
        END_DATE.setDate(peakForm.getDate()-1);

        SBUxMethod.set("NORM_CALC_START_DATE", 		    ENTER_DATE);//정상정산기간
        SBUxMethod.set("NORM_CALC_END_DATE", 			gfn_dateToYmd(END_DATE));


        let NORM_PAY_START_DATE = new Date(PEAK_START_DATE_FORMAT);
        NORM_PAY_START_DATE.setMonth(peakForm.getMonth()-3);

        SBUxMethod.set("NORM_PAY_START_DATE", 		    gfn_dateToYmd(NORM_PAY_START_DATE));//정상급여기간
        SBUxMethod.set("NORM_PAY_END_DATE", 			gfn_dateToYmd(END_DATE));

        let NORM_BONUS_START_DATE = new Date(PEAK_START_DATE_FORMAT);
        NORM_BONUS_START_DATE.setMonth(peakForm.getMonth()-12);

        SBUxMethod.set("NORM_BONUS_START_DATE", 		 gfn_dateToYmd(NORM_BONUS_START_DATE));//정상상여기간
        SBUxMethod.set("NORM_BONUS_END_DATE", 			gfn_dateToYmd(END_DATE));
    }

    /**
     * 이게 뭘 구하는 걸까?
     */
    function fn_calcRetireAmt() {

        let _monthly_pay_amt = 0;
        let _apply_days = 0;

        let dDaySum = 0;
        let dDaySumPeak = 0;
        let dDaySumNorm = 0;

        let gridPay = gvwPayGrid.getGridDataAll();

        if (_.isEmpty(gridPay)){
            return;
        }

        for (let i = 0; i < gridPay.length; i++){

            if (gridPay[i].PEAK_YN == 'N'){

                dDaySum = Number(dDaySum) + Number(gfnma_nvl(gridPay[i].APPLY_DAYS));
                dDaySumNorm = Number(dDaySumNorm) + Number(gfnma_nvl(gridPay[i].APPLY_DAYS));

            }else{
                dDaySumPeak = Number(dDaySumPeak) + Number(gfnma_nvl(gridPay[i].APPLY_DAYS));
            }

        }

        SBUxMethod.set("BEF_3MM_DAY_CNT", 			    dDaySum); //퇴직추계액
        SBUxMethod.set("BEF_3MM_DAY_CNT_NORM", 			dDaySumNorm); //퇴직추계액
        SBUxMethod.set("BEF_3MM_DAY_CNT_PEAK", 			dDaySumPeak); //퇴직추계액

        let RET_CALC_TYPE		= gfnma_multiSelectGet('#SRCH_RET_CALC_TYPE'); //퇴직정산구분

        let ANN_BENEFIT_AMT 			    = Number(gfnma_nvl(SBUxMethod.get("ANN_BENEFIT_AMT")));// 연차수당, numannual_benefit_amt
        let ANN_BENEFIT_AMT_NORM 			= Number(gfnma_nvl(SBUxMethod.get("ANN_BENEFIT_AMT_NORM")));// 연차수당, numannual_benefit_amt_norm
        let ANN_BENEFIT_AMT_PEAK 			= Number(gfnma_nvl(SBUxMethod.get("ANN_BENEFIT_AMT_PEAK")));// 연차수당, numannual_benefit_amt_peak

        if (_.isEqual(RET_CALC_TYPE, 'RETIRE') || _.isEqual(RET_CALC_TYPE, 'MIDDLE')){

            SBUxMethod.set("AVG_MM_ANN_AMT", 			        ANN_BENEFIT_AMT / 4); //평균연차수당
            SBUxMethod.set("AVG_MM_ANN_AMT_NORM", 			    ANN_BENEFIT_AMT_NORM / 4);
            SBUxMethod.set("AVG_MM_ANN_AMT_PEAK", 			    ANN_BENEFIT_AMT_PEAK / 4);

        }
        let AVG_MM_PAY_AMT	        = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT"))); //평균급여, numavg_monthly_pay_amt
        let AVG_MM_PAY_AMT_NORM	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT_NORM"))); //평균급여, numavg_monthly_pay_amt_norm
        let AVG_MM_PAY_AMT_PEAK	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_PAY_AMT_PEAK"))); //평균급여, numavg_monthly_pay_amt_peak

        let AVG_MM_BONUS_AMT	    = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT"))); //평균상여, numavg_monthly_bonus_amt
        let AVG_MM_BONUS_AMT_NORM	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT_NORM"))); //평균상여, numavg_monthly_bonus_amt_norm
        let AVG_MM_BONUS_AMT_PEAK	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_BONUS_AMT_PEAK"))); //평균상여, numavg_monthly_bonus_amt_peak

        let AVG_MM_ANN_AMT	        = Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT"))); //평균연차수당, numavg_monthly_annual_amt
        let AVG_MM_ANN_AMT_NORM 	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT_NORM"))); //평균연차수당, numavg_monthly_annual_amt_norm
        let AVG_MM_ANN_AMT_PEAK 	= Number(gfnma_nvl(SBUxMethod.get("AVG_MM_ANN_AMT_PEAK"))); //평균연차수당, numavg_monthly_annual_amt_peak

        /*let ANN_BENEFIT_AMT	= gfnma_nvl(SBUxMethod.get("ANN_BENEFIT_AMT")); //연차수당, numannual_benefit_amt
        let ANN_BENEFIT_AMT_NORM	= gfnma_nvl(SBUxMethod.get("ANN_BENEFIT_AMT_NORM")); //연차수당, numannual_benefit_amt_norm
        let ANN_BENEFIT_AMT_PEAK	= gfnma_nvl(SBUxMethod.get("ANN_BENEFIT_AMT_PEAK")); //연차수당, numannual_benefit_amt_peak*/

        if (stravg_pay_type == "10")
        {
            if (dDaySum != 0)
            {

                let AVG_MM_RET_AMT= Math.round((AVG_MM_PAY_AMT + AVG_MM_BONUS_AMT + AVG_MM_ANN_AMT) / dDaySum);
                SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                //평균임금, AVG_MM_RET_AMT, numavg_monthly_retire_amt
                //numavg_monthly_retire_amt.Value = Math.Round((AVG_MM_PAY_AMT + AVG_MM_BONUS_AMT + numavg_monthly_annual_amt.Value) / dDaySum);
            }

            if (dDaySumNorm != 0)
            {

                let AVG_MM_RET_AMT_NORM = Math.round((AVG_MM_PAY_AMT_NORM + AVG_MM_BONUS_AMT_NORM + AVG_MM_ANN_AMT_NORM) / dDaySumNorm);
                SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                //평균임금, AVG_MM_RET_AMT_NORM, numavg_monthly_retire_amt_norm
                //numavg_monthly_retire_amt_norm.Value = Math.Round((AVG_MM_PAY_AMT_NORM + AVG_MM_BONUS_AMT_NORM + numavg_monthly_annual_amt_norm.Value) / dDaySumNorm);
            }

            if (dDaySumPeak != 0)
            {
                let AVG_MM_RET_AMT_PEAK = Math.round((AVG_MM_PAY_AMT_PEAK + AVG_MM_BONUS_AMT_PEAK + AVG_MM_ANN_AMT_PEAK) / dDaySumPeak);
                SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                //평균임금, AVG_MM_RET_AMT_PEAK, numavg_monthly_retire_amt_peak
                //numavg_monthly_retire_amt_peak.Value = Math.Round((AVG_MM_PAY_AMT_PEAK + AVG_MM_BONUS_AMT_PEAK + numavg_monthly_annual_amt_peak.Value) / dDaySumPeak);
            }
        }
        else if (stravg_pay_type == "20")
        {
            if (strjob_group == "3")
            {
                if (dDaySum != 0)
                {
                    let AVG_MM_RET_AMT= Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                    //numavg_monthly_retire_amt.Value = Math.Truncate((AVG_MM_PAY_AMT / dDaySum)) + Math.Truncate((AVG_MM_BONUS_AMT * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT / 365);
                }
                else
                {
                    let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                    //numavg_monthly_retire_amt.Value = Math.Truncate((AVG_MM_PAY_AMT)) + Math.Truncate((AVG_MM_BONUS_AMT * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT / 365);
                }

                if (dDaySumNorm != 0)
                {
                    let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                    //numavg_monthly_retire_amt_norm.Value = Math.Truncate((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.Truncate((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT_NORM / 365);
                }
                else
                {
                    let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                    //numavg_monthly_retire_amt_norm.Value = Math.Truncate((AVG_MM_PAY_AMT_NORM)) + Math.Truncate((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT_NORM / 365);
                }

                if (dDaySumPeak != 0)
                {
                    let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                    //numavg_monthly_retire_amt_peak.Value = Math.Truncate((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.Truncate((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT_PEAK / 365);
                }
                else
                {
                    let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                    //numavg_monthly_retire_amt_peak.Value = Math.Truncate((AVG_MM_PAY_AMT_PEAK)) + Math.Truncate((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT_PEAK / 365);
                }
            }
            else
            {
                if (dDaySum != 0)
                {
                    let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT / 360);
                    SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                    //numavg_monthly_retire_amt.Value = Math.Truncate((AVG_MM_PAY_AMT / dDaySum)) + Math.Truncate((AVG_MM_BONUS_AMT * 4) / 360) + Math.Truncate(ANN_BENEFIT_AMT / 360);
                }
                else
                {
                    let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT / 360);
                    SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                    //numavg_monthly_retire_amt.Value = Math.Truncate((AVG_MM_PAY_AMT)) + Math.Truncate((AVG_MM_BONUS_AMT * 4) / 360) + Math.Truncate(ANN_BENEFIT_AMT / 360);
                }

                if (dDaySumNorm != 0)
                {
                    let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT_NORM / 360);
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                    //numavg_monthly_retire_amt_norm.Value = Math.Truncate((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.Truncate((AVG_MM_BONUS_AMT_NORM * 4) / 360) + Math.Truncate(ANN_BENEFIT_AMT_NORM / 360);
                }
                else
                {
                    let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT_NORM / 360);
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                    //numavg_monthly_retire_amt_norm.Value = Math.Truncate((AVG_MM_PAY_AMT_NORM)) + Math.Truncate((AVG_MM_BONUS_AMT_NORM * 4) / 360) + Math.Truncate(ANN_BENEFIT_AMT_NORM / 360);
                }
                if (dDaySumPeak != 0)
                {
                    let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 360);
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                    //numavg_monthly_retire_amt_peak.Value = Math.Truncate((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.Truncate((AVG_MM_BONUS_AMT_PEAK * 4) / 360) + Math.Truncate(ANN_BENEFIT_AMT_PEAK / 360);
                }
                else
                {
                    let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 360) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 360);
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                    //numavg_monthly_retire_amt_peak.Value = Math.Truncate((AVG_MM_PAY_AMT_PEAK)) + Math.Truncate((AVG_MM_BONUS_AMT_PEAK * 4) / 360) + Math.Truncate(ANN_BENEFIT_AMT_PEAK / 360);
                }
            }
        }

        else if (stravg_pay_type == "30")
        {
            if (strjob_group == "3")
            {
                if (dDaySum != 0)
                {
                    let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                    //numavg_monthly_retire_amt.Value = Math.Truncate((AVG_MM_PAY_AMT / dDaySum)) + Math.Truncate((AVG_MM_BONUS_AMT * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT / 365);
                }
                else
                {
                    let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                    //numavg_monthly_retire_amt.Value = Math.Truncate((AVG_MM_PAY_AMT)) + Math.Truncate((AVG_MM_BONUS_AMT * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT / 365);
                }

                if (dDaySumNorm != 0)
                {
                    let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                    //numavg_monthly_retire_amt_norm.Value = Math.Truncate((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.Truncate((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT_NORM / 365);
                }
                else
                {
                    let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                    //numavg_monthly_retire_amt_norm.Value = Math.Truncate((AVG_MM_PAY_AMT_NORM)) + Math.Truncate((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT_NORM / 365);
                }

                if (dDaySumPeak != 0)
                {
                    let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                    //numavg_monthly_retire_amt_peak.Value = Math.Truncate((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.Truncate((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT_PEAK / 365);
                }
                else
                {
                    let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                    //numavg_monthly_retire_amt_peak.Value = Math.Truncate((AVG_MM_PAY_AMT_PEAK)) + Math.Truncate((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT_PEAK / 365);
                }
            }
            else
            {
                if (dDaySum != 0)
                {
                    let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT / dDaySum)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                    //numavg_monthly_retire_amt.Value = Math.Truncate((AVG_MM_PAY_AMT / dDaySum)) + Math.Truncate((AVG_MM_BONUS_AMT * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT / 365);
                }
                else
                {
                    let AVG_MM_RET_AMT = Math.trunc((AVG_MM_PAY_AMT)) + Math.trunc((AVG_MM_BONUS_AMT * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT", 			    AVG_MM_RET_AMT);
                    //numavg_monthly_retire_amt.Value = Math.Truncate((AVG_MM_PAY_AMT)) + Math.Truncate((AVG_MM_BONUS_AMT * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT / 365);
                }
                if (dDaySumNorm != 0)
                {
                    let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                    //numavg_monthly_retire_amt_norm.Value = Math.Truncate((AVG_MM_PAY_AMT_NORM / dDaySumNorm)) + Math.Truncate((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT_NORM / 365);
                }
                else
                {
                    let AVG_MM_RET_AMT_NORM = Math.trunc((AVG_MM_PAY_AMT_NORM)) + Math.trunc((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_NORM / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT_NORM", 			    AVG_MM_RET_AMT_NORM);
                    //numavg_monthly_retire_amt_norm.Value = Math.Truncate((AVG_MM_PAY_AMT_NORM)) + Math.Truncate((AVG_MM_BONUS_AMT_NORM * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT_NORM / 365);
                }
                if (dDaySumPeak != 0)
                {
                    let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                    //numavg_monthly_retire_amt_peak.Value = Math.Truncate((AVG_MM_PAY_AMT_PEAK / dDaySumPeak)) + Math.Truncate((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT_PEAK / 365);
                }
                else
                {
                    let AVG_MM_RET_AMT_PEAK = Math.trunc((AVG_MM_PAY_AMT_PEAK)) + Math.trunc((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.trunc(ANN_BENEFIT_AMT_PEAK / 365);
                    SBUxMethod.set("AVG_MM_RET_AMT_PEAK", 			    AVG_MM_RET_AMT_PEAK);
                    //numavg_monthly_retire_amt_peak.Value = Math.Truncate((AVG_MM_PAY_AMT_PEAK)) + Math.Truncate((AVG_MM_BONUS_AMT_PEAK * 4) / 365) + Math.Truncate(ANN_BENEFIT_AMT_PEAK / 365);
                }
            }
        }
    }

    $(function () {
        // 변경을 감지할 노드 선택
        const targetNode = document.getElementById("SRCH_RET_CALC_TYPE"); //퇴직정산구분

        console.log('----------targetNode----------',targetNode);

        // 감지 옵션 (감지할 변경)
        const config = { attributes: true, childList: true, subtree: true };

        // 변경 감지 시 실행할 콜백 함수
        const callback = (mutationList, observer) => {

            let type = gfnma_multiSelectGet('#SRCH_RET_CALC_TYPE');

            console.log('----------type----------',type);

            if (!_.isEmpty(type)) {

                if (_.isEqual(type, 'RETIRE') || _.isEqual(type, 'MIDDLE')) {

                    SBUxMethod.show('SRCH_CALCULATE_TAX_YN');
                    SBUxMethod.show('SRCH_CALCULATE_PREV_YN');
                    /*chkcalculate_tax_yn.Visible = true;
                    chkcalculate_prev_yn.Visible = true;*/
                } else {
                    SBUxMethod.hide('SRCH_CALCULATE_TAX_YN');
                    SBUxMethod.hide('SRCH_CALCULATE_PREV_YN');
                    /*chkcalculate_tax_yn.Visible = false;
                    chkcalculate_prev_yn.Visible = false;*/
                }
                if (_.isEqual(type, 'MIDDLE')) {
                    SBUxMethod.set("TO_DC_YN", "Y");
                    //chkto_dc_yn.EditValue = "Y";
                }
            }

        };

        // 콜백 함수에 연결된 감지기 인스턴스 생성
        const observer = new MutationObserver(callback);

        // 설정한 변경의 감지 시작
        observer.observe(targetNode, config);

    });


    /**
     * 회사 납부액 (COM_PAY_AMT)
     */
    function fn_payAmt() {

        let INSURER1_PAY_AMT	= Number(gfnma_nvl(SBUxMethod.get("INSURER1_PAY_AMT"))); //금융기관1
        let INSURER2_PAY_AMT	= Number(gfnma_nvl(SBUxMethod.get("INSURER2_PAY_AMT"))); //금융기관2
        let INSURER3_PAY_AMT	= Number(gfnma_nvl(SBUxMethod.get("INSURER3_PAY_AMT"))); //금융기관3
        let RETIRE_ESTIMATE_AMT	= Number(gfnma_nvl(SBUxMethod.get("RETIRE_ESTIMATE_AMT"))); //퇴직추계액, numretire_estimate_amt

        let NUMPAY_AMT_SUM = INSURER1_PAY_AMT + INSURER2_PAY_AMT + INSURER3_PAY_AMT;
        let NUMDIFF_AMT = RETIRE_ESTIMATE_AMT - (INSURER1_PAY_AMT + INSURER2_PAY_AMT + INSURER3_PAY_AMT);


        //지급액계, numpay_amt_sum
        SBUxMethod.set("PAY_AMT_SUM", 			    NUMPAY_AMT_SUM);

        //차이금액
        SBUxMethod.set("DIFF_AMT", 			    NUMDIFF_AMT);

    }

    /*/!**
     * 금융기관1 (INSURER1_PAY_AMT) //numinsurer1_pay_amt_EditValueModified
     *!/
    function fn_numinsurer1PayAmt() {
        numpay_amt_sum.EditValue = numinsurer1_pay_amt.Value + numinsurer2_pay_amt.Value + numinsurer3_pay_amt.Value;
        numdiff_amt.EditValue = numretire_estimate_amt.Value - (numinsurer1_pay_amt.Value + numinsurer2_pay_amt.Value + numinsurer3_pay_amt.Value);

    }

    /!**
     * 금융기관2 (INSURER2_PAY_AMT) //numinsurer2_pay_amt_EditValueModified
     *!/
    function fn_numinsurer2PayAmt() {
        numpay_amt_sum.EditValue = numinsurer1_pay_amt.Value + numinsurer2_pay_amt.Value + numinsurer3_pay_amt.Value;
        numdiff_amt.EditValue = numretire_estimate_amt.Value - (numinsurer1_pay_amt.Value + numinsurer2_pay_amt.Value + numinsurer3_pay_amt.Value);

    }

    /!**
     * 금융기관3 (INSURER3_PAY_AMT)// numinsurer3_pay_amt_EditValueModified
     *!/
    function fn_numinsurer3PayAmt() {
        numpay_amt_sum.EditValue = numinsurer1_pay_amt.Value + numinsurer2_pay_amt.Value + numinsurer3_pay_amt.Value;
        numdiff_amt.EditValue = numretire_estimate_amt.Value - (numinsurer1_pay_amt.Value + numinsurer2_pay_amt.Value + numinsurer3_pay_amt.Value);

    }*/

    /**
     * 연차수당 (ANN_BENEFIT_AMT)
     */
    function fn_benAmtModi() {

        let ANN_BENEFIT_AMT	    = gfnma_nvl(SBUxMethod.get("ANN_BENEFIT_AMT")); //연차수당
        let RET_CALC_TYPE		= gfnma_multiSelectGet('#RET_CALC_TYPE');//퇴직정산구분

        if (ANN_BENEFIT_AMT == '' || ANN_BENEFIT_AMT.length != 6 || RET_CALC_TYPE == '')
        {
            return;
        }
    }

    /**
     * 퇴직일자 (PAY_DATE)
     */
    function fn_payDate() {

        let PAY_DATE	    = gfnma_nvl(SBUxMethod.get("PAY_DATE")); //퇴직일자

        if (PAY_DATE == ''){
            return;
        }

        fn_searchQH();
        //fnQRY_P_HRA5150_Q2("HEADER");

    }

    /**
     * 탭 선택시 확인후 조회
     */
    const fn_btnTab = async function (type) {


        let tabId = SBUxMethod.get('tabJson');

        if (_.isEqual(tabId, 'tabInfo4')){

            let PAY_DATE	    = gfnma_nvl(SBUxMethod.get("PAY_DATE")); //퇴직일자
            let PAY_YYYYMM	    = gfnma_nvl(SBUxMethod.get("PAY_YYYYMM")); //귀속년월

            /*ymdpay_yyyymm.EditValue = ymdcalc_end_date.yyyymm;
            ymdpay_date1.EditValue = ymdcalc_end_date.yyyymmdd;*/

            if (PAY_YYYYMM != '')
            {
                await fn_searchQ2();
                fn_searchQH();
                /*fnQRY_P_HRA5150_Q2("Q");
                fnQRY_P_HRA5150_Q2("HEADER");*/
            }

        }

    }


    /**
     * 데이터 계산?
     *
     */
    const fn_dataDiff = async function (Interval, Date1, Date2) {

        let diff = 0;

        let data1Year = Date1.slice(0, -4);
        let data1Mm = Date1.slice(4, -2);
        let data1Dd = Date1.slice(6, 8);
        let data1Format = data1Year + '-' + data1Mm + '-' + data1Dd;

        let data2Year = Date2.slice(0, -4);
        let data2Mm = Date2.slice(4, -2);
        let data2Dd = Date2.slice(6, 8);
        let data2Format = data2Year + '-' + data2Mm + '-' + data2Dd;

        let diffDays = new Date(data2Format).getTime() - new Date(data1Format).getTime();
        let ts = diffDays / (1000 * 60 * 60 * 24);

        switch (Interval)
        {
            case "y":
                ts = Number(data2Year) - Number(data2Year);
                diff = ts ;
                //ts = DateTime.Parse(Date2.ToString("yyyy-01-01")) - DateTime.Parse(Date1.ToString("yyyy-01-01"));
                //diff = Convert.ToDouble(ts.TotalDays / 365);
                break;
            case "m":
                ts = Number(data2Year+data2Mm) - Number(data2Year+data1Mm);
                diff = ts ;
                /* ts = DateTime.Parse(Date2.ToString("yyyy-MM-01")) - DateTime.Parse(Date1.ToString("yyyy-MM-01"));
                 diff = Convert.ToDouble((ts.TotalDays / 365) * 12);*/
                break;
            case "d":
                ts =  new Date(data2Format).getTime() - new Date(data1Format).getTime();
                diff = ts / (1000 * 60 * 60 * 24);
                /*ts = DateTime.Parse(Date2.ToString("yyyy-MM-dd")) - DateTime.Parse(Date1.ToString("yyyy-MM-dd"));
                diff = ts.Days;*/
                break;
            /* case "h":
                 ts = DateTime.Parse(Date2.ToString("yyyy-MM-dd HH:00:00")) - DateTime.Parse(Date1.ToString("yyyy-MM-dd HH:00:00"));
                 diff = ts.TotalHours;
                 break;
             case "n":
                 ts = DateTime.Parse(Date2.ToString("yyyy-MM-dd HH:mm:00")) - DateTime.Parse(Date1.ToString("yyyy-MM-dd HH:mm:00"));
                 diff = ts.TotalMinutes;
                 break;
             case "s":
                 ts = DateTime.Parse(Date2.ToString("yyyy-MM-dd HH:mm:ss")) - DateTime.Parse(Date1.ToString("yyyy-MM-dd HH:mm:ss"));
                 diff = ts.TotalSeconds;
                 break;
             case "ms":
                 diff = ts.TotalMilliseconds;
                 break;*/
        }

        return diff;
    }


</script>
</html>
