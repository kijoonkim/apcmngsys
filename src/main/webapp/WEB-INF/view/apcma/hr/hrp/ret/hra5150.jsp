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
                                    <th rowspan="6" scope="row" class="th_bg">퇴직급여현황</th>
                                    <th scope="row" class="th_bg">근 무 처 구 분</th>
                                    <th scope="row" class="th_bg">중간지급 등</th>
                                    <th scope="row" class="th_bg">최종분</th>
                                    <th scope="row" class="th_bg">정산(합산)</th>
                                    <td rowspan="6" style="border-right: hidden;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">근무처명</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="PREV_COM_NAME"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="COMP_NAME"
                                                class="form-control input-sm"
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
                                    <th scope="row" class="th_bg">사업자등록번호</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="PREV_COM_NUM"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="BIZ_REGNO"
                                                class="form-control input-sm"
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
                                    <th scope="row" class="th_bg">퇴직급여</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="PREV_RET_INC_AMT"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="RET_INC_AMT"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="TOT_RET_INC_AMT"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                  <%--  <td style="border-right: hidden;">&nbsp;</td>--%>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">비과세 퇴직급여</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="PREV_TXFREE_RET_INC_AMT"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="TXFREE_RET_INC_AMT"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="TOT_TXFREE_RET_INC_AMT"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <%--<td style="border-right: hidden;">&nbsp;</td>--%>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">과세대상 퇴직급여</th>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="PREV_TX_RET_INC_AMT"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="TX_RET_INC_AMT"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                        <sbux-input
                                                uitype="text"
                                                id="TOT_TX_RET_INC_AMT"
                                                class="form-control input-sm"
                                        ></sbux-input>
                                    </td>
                                    <%--<td style="border-right: hidden;">&nbsp;</td>--%>
                                </tr>
                            </table>
                        </div>

                    </div>
                    <div id="tabInfo2" >


                    </div>
                    <div id="tabInfo3" >
                    </div>
                    <div id="tabInfo4" >
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
    var gvwInfoGrid; 			// 그리드를 담기위한 객체 선언
    var jsonInfoList = []; 	    // 그리드의 참조 데이터 주소 선언

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

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
