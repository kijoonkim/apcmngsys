<%
    /**
     * @Class Name        : hrp1000.jsp
     * @Description       :  중간/퇴직급여 계산 정보 화면
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
                <sbux-button id="btnCopy" name="btnCopy" uitype="normal" text="전년도 자료복사"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnCopy"></sbux-button>
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
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="srch-site_code" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="srch-site_code" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">퇴직정산구분</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="srch-ret_calc_type" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="srch-ret_calc_type" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="6" style="border-right: hidden;">&nbsp;</td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">정산종료일</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-retire_calc_date_fr"
                            name="srch-retire_calc_date_fr"
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
                            id="srch-retire_calc_date_to"
                            name="srch-retire_calc_date_to"
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
                            id="srch-emp_code"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">이름</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-input
                            uitype="text"
                            id="srch-emp_name"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">정산일</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-ret_calc_dat"
                            name="srch-ret_calc_dat"
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
                            id="srch-calculate_tax_yn"
                            name="srch-calculate_tax_yn"
                            uitype="normal"
                            text="과세계산여부"
                            true-value="Y"
                            false-value="N"
                    ></sbux-checkbox>
                </td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-checkbox
                            id="srch-calculate_prev_yn"
                            name="srch-calculate_prev_yn"
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
                    <div id="sb-area-gvwMaster" style="height:800px; width:100%;"></div>
                </div>
            </div>

            <div class="col-sm-10">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>정산 기본 정보</span></li>
                    </ul>
                </div>

                <div>
                    <table class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:2%">

                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:2%">

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
                            <th scope="row" class="th_bg">퇴직정산구분</th>
                            <td colspan="3" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="RET_CALC_TYPE"
                                        name="RET_CALC_TYPE"
                                        class="form-control input-sm"
                                        jsondata-ref=""
                                        readonly
                                />
                            </td>
                            <th scope="row" class="th_bg">사원</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input
                                        uitype="text"
                                        id="EMP_CODE"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="EMP_NAME"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                           <%-- <td  class="td_input" >
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup2"
                                ></sbux-button>
                            </td>--%>
                            <th scope="row" class="th_bg">입사일</th>
                            <td colspan="3" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="ENTER_DATE"
                                        name="ENTER_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                            <th scope="row" class="th_bg">피크시작일</th>
                            <td colspan="3" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="PEAK_START_DATE"
                                        name="PEAK_START_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                        </tr>
                        <tr>

                            <th scope="row" class="th_bg">퇴사일</th>
                            <td colspan="3" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="RET_DAT"
                                        name="RET_DAT"
                                        class="input-sm"
                                        autocomplete="off"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                            <th scope="row" class="th_bg">정산시작일</th>
                            <td colspan="3" class="td_input" style="border-right: hidden;">
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
                            <td colspan="3" class="td_input" style="border-right: hidden;">
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
                            <td colspan="3" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="RET_PENS_ST_DAT"
                                        name="RET_PENS_ST_DAT"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                            <td colspan="4" class="td_input" style="border-right: hidden;">
                                <sbux-checkbox
                                        id="EXEC_YN"
                                        name="EXEC_YN"
                                        uitype="normal"
                                        text="임원여부"
                                        true-value="Y"
                                        false-value="N"
                                ></sbux-checkbox>
                            </td>
                            <th scope="row" class="th_bg">임원퇴직금(2011.12.31기준)</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <sbux-input id="EXEC_RET_PAY_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
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
                            <td colspan="3" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="JOB_ST_DAT"
                                        name="JOB_ST_DAT"
                                        class="input-sm"
                                        autocomplete="off"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                            <th scope="row" class="th_bg">귀속연월 종료일</th>
                            <td colspan="3" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="JOB_END_DAT"
                                        name="JOB_END_DAT"
                                        class="input-sm"
                                        autocomplete="off"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                            <th scope="row" class="th_bg">최근중도 정산일</th>
                            <td colspan="3" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="LAST_CALC_DAT"
                                        name="LAST_CALC_DAT"
                                        class="input-sm"
                                        autocomplete="off"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                            <td colspan="4" class="td_input" style="border-right: hidden;">
                                <sbux-checkbox
                                        id="TO_DC_YN"
                                        name="TO_DC_YN"
                                        uitype="normal"
                                        text="DC전환"
                                        true-value="Y"
                                        false-value="N"
                                ></sbux-checkbox>
                            </td>
                        </tr>
                        <tr>
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
                            <th scope="row" class="th_bg">거주지국</th>
                            <td colspan="3" class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="LIVE_NATION_CODE"
                                        name="LIVE_NATION_CODE"
                                        class="form-control input-sm"
                                        jsondata-ref=""
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
                            <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                            <td colspan="4" class="td_input" style="border-right: hidden;">
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
                            <td style="border-right: hidden;">&nbsp;</td>
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
                            <td style="border-right: hidden;">&nbsp;</td>
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
                            <td colspan="5" style="border-right: hidden;">&nbsp;</td>
                        </tr>
                    </table>
                </div>

                <sbux-tabs id="tabJson" name="tabJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false">
                </sbux-tabs>

                <div class="tab-content">
                    <div id="tabInfo1" >
                        <div>
                            <table class="table table-bordered tbl_fixed">
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
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균상여</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_BONUS_AMT" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
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
                                        <sbux-input id="NUMWORKING_DAY_CNT" uitype="text" style="width:100%" placeholder=""
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
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균연차수당</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_ANN_AMT" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균임금</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_RET_AMT" uitype="text" style="width:100%" placeholder=""
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
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균상여(P)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_BONUS_AMT_PEAK" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
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
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
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
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균연차수당(P)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_ANN_AMT_PEAK" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균임금(P)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_RET_AMT_PEAK" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">적용일수(P)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WORKING_DAY_CNT2_PEAK" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">연차수당(N)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="WORKING_DAY_CNT2_PEAK" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균연차수당(N)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_ANN_AMT_NORM" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">평균임금(N)</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="AVG_MM_RET_AMT_NORM" uitype="text" style="width:100%" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }" ></sbux-input>
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
                            <div class="col-sm-3">
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
                            <div class="col-sm-3">
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
                            <table class="table table-bordered tbl_fixed">
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
                                        <sbux-input id="TXFREE_RET_INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="TOT_TXFREE_RET_INC_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
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
                            <table class="table table-bordered tbl_fixed">
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
                                        <sbux-input uitype="text" id="PAY_DATE" class="form-control input-sm"  style="background-color: #FFFFFF !important;"
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
                            <table class="table table-bordered tbl_fixed">
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
                                        <sbux-input id="TOT_RET_PAY_AMT" uitype="text" style="background-color: #FFFFFF !important;" placeholder=""
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
                            <table class="table table-bordered tbl_fixed">
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
                                            <button style="width:100px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="IRP_BANK_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="IRP_BANK_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="IRP_BIZ_REGNO" uitype="text" placeholder=""
                                                    class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="IRP_BANK_ACCOUNT_REAL" uitype="text" placeholder=""
                                                    class="form-control input-sm"
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
                                                    class="form-control input-sm" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                                                    readonly></sbux-input>
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
                            <table class="table table-bordered tbl_fixed">
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
                                    onclick="fn_btnCancelPosting"
                                    style="float: right;"
                            ></sbux-button>
                            <sbux-button
                                    id="btnCreatePosting"
                                    name="btnCreatePosting"
                                    uitype="normal"
                                    text="회계 반영"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnCreatePosting"
                                    style="float: right;"
                            ></sbux-button>
                            <sbux-button
                                    id="btnCancel2"
                                    name="btnCancel2"
                                    uitype="normal"
                                    text="전표처리 집계취소"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnCancel2"
                                    style="float: right;"
                            ></sbux-button>
                            <sbux-button
                                    id="btnPosting"
                                    name="btnPosting"
                                    uitype="normal"
                                    text="전표처리내역 집계"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnPosting"
                                    style="float: right;"
                            ></sbux-button>
                        </div>
                        <div>
                            <table class="table table-bordered tbl_fixed">
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
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast">
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
                                                jsondata-ref="jsonPayAreaType"
                                        />
                                    </td>
                                    <td class="td_input" style="border-right:hidden; display: none">
                                        <sbux-input id="doc_id" uitype="text" placeholder="" class="form-control input-sm"
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
                                    <th scope="row" class="th_bg">지급은행</th>
                                    <td colspan="2" class="td_input" style="border-right: hidden;">
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
                                    <td colspan="2" <%--colspan="2"--%> class="td_input" >
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="찾기" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_compopup2"
                                        ></sbux-button>
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
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    var editType			= 'N';

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

    var jsonPayItemCode2 = []; //공제항목 ( L_HRP012 )PAY_ITEM_CODE

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['srch-pay_area_type'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

            //지급구분
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

        SBUxMethod.attr('modal-compopup1', 'header-title', '공통은행정보');
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

        let openDate = gfn_dateToYmd(new Date());

        SBUxMethod.set('srch-pay_yyyymm_fr', openDate);
        SBUxMethod.set('srch-pay_yyyymm_fr2', openDate);

        fn_createGrid();
    }

    // 신규
    /*  function cfn_add() {
          fn_create();
      }*/
    /* // 저장
     function cfn_save() {
         fn_save();
     }*/
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
            {caption : ["부서"], ref : 'DEPT_NAME', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : '', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["사번"], ref : 'EMP_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : '', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["이름"], ref : 'EMP_NAME', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : '', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["퇴직정산구분"], ref : 'RET_CALC_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : '', displayui : true, label : 'label', value : 'value', hidden : true}
            },
            {caption: ["확정"], ref: 'RET_CALC_CONFIRM_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                },
            },
            {caption: ['입사일'], ref: 'ENTER_DATE', width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true, hidden : true},
            {caption: ['정산일'], ref: 'RET_CALC_DAT', width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["직군"], ref: 'JOB_GROUP', type: 'output', width: '100px', style: 'text-align:left', hidden : true },
            {caption: ["평균급여산정기준"], ref: 'AVG_PAY_TYPE', type: 'output', width: '100px', style: 'text-align:left', hidden : true},

        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        gvwInfoGrid.bind('click', 'fn_view');
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
        SBGridProperties.columns = [
            {caption: [""], ref: 'PEAK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ['귀속년월'], ref: 'PAY_YYYYMM', width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ["기본급"], ref: 'BASE_PAY_AMT', type: 'output', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["수당"], ref: 'ALLOWANCE_AMT', type: 'output', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["급여금액"], ref: 'PAY_AMT', type: 'output', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["적용금액"], ref: 'APPLY_AMT', type: 'output', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ['적용시작일'], ref: 'ST_DAT', width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['적용종료일'], ref: 'END_DAT', width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["적용일수"], ref: 'APPLY_DAYS', type: 'output', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#' }},
        ];

        gvwPayGrid = _SBGrid.create(SBGridProperties);
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
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['지급일'], ref: 'PAY_DATE', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption : ["급여항목"], ref : 'PAY_ITEM_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : '', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["상여금액"], ref: 'PAY_AMT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["적용금액"], ref: 'APPLY_AMT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
        ];

        gvwBonusGrid = _SBGrid.create(SBGridProperties);
        /*  gvwInfoGrid.bind('click', 'fn_view');*/
    }

    //상여내역 리스트
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
            {caption : ["직위"], ref : 'POSITION_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : '', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['적용시작일'], ref: 'ST_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['적용종료일'], ref: 'END_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["년"], ref: 'YY_CNT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4},  format : { type:'number' , rule:'#' }},
            {caption: ["월"], ref: 'MM_CNT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 2},  format : { type:'number' , rule:'#' }},
            {caption: ["일"], ref: 'DD_CNT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 2},  format : { type:'number' , rule:'#' }},
/*
            {caption: ['년'], ref: 'YY_CNT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy', origin:'yyyy'}, disabled: true, hidden : true},
            {caption: ['월'], ref: 'MM_CNT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'mm', origin:'mm'}, disabled: true, hidden : true},
            {caption: ['일'], ref: 'DD_CNT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'dd', origin:'dd'}, disabled: true, hidden : true},*/
            {caption: ["근무일수"], ref: 'DD_TOT_CNT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#' }},
            {caption: ["지급배수"], ref: 'PAY_MULTIPLE_NUMBER', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#' }},
            {caption: ["환산개월수"], ref: 'CHG_MM_CNT', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#' }},

        ];

        gvwChangeGrid = _SBGrid.create(SBGridProperties);
        /*  gvwInfoGrid.bind('click', 'fn_view');*/
    }

    //상여내역 리스트
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
                typeinfo : {ref : '', displayui : true, label : 'label', value : 'value'}
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

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
