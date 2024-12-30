<%
    /**
     * @Class Name        : hrp1000.jsp
     * @Description       : 개인급여 정보 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.05.21
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.05.21   	표주완		최초 생성
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
    <title>title : 개인급여 정보 정보</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3><!-- 국가정보 -->
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
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">재직구분</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-select
                                unselected-text="전체"
                                uitype="single"
                                id="SRCH_EMP_STATE"
                                name="SRCH_EMP_STATE"
                                class="form-control input-sm"
                                jsondata-ref="jsonEmpState"
                        />
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">급여영역</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-select
                                unselected-text="전체"
                                uitype="single"
                                id="SRCH_PAY_AREA_TYPE"
                                name="SRCH_PAY_AREA_TYPE"
                                class="form-control input-sm"
                                jsondata-ref="jsonPayAreaType"
                        />
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <td colspan="5" class="td_input td_input_dtl" style="border-left:hidden">
                        <sbux-button
                                uitype="normal" id="lbladd1" name="lbladd1"
                                class="btn btn-sm btn-outline-danger" text="변동항목추가" onclick="fn_lbladd1">
                        </sbux-button>
                    </td>
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
                                uitype="text"
                                id="SRCH_DEPT_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td class="td_input" data-group="DEPT">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                uitype="modal"
                                target-id="modal-compopup1"
                                text="…"
                                onclick="fn_compopup1('srch')"
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
                                uitype="text"
                                id="SRCH_EMP_FULL_NAME"
                                class="form-control input-sm"

                        ></sbux-input>
                    </td>
                    <td class="td_input" data-group="EMP">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                uitype="modal"
                                target-id="modal-compopup1"
                                text="…"
                                onclick="fn_compopup2('srch')"
                        ></sbux-button>
                    </td>
                    <td colspan="10" style="border-right: hidden;">&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>사원리스트</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-grwInfo" style="height:730px; width:100%;"></div>
                </div>
            </div>

            <div class="col-sm-8">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>인사정보</span></li>
                    </ul>
                </div>
                <div>
                    <table id="dataArea2" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:5%">
                            <col style="width:4%">
                            <col style="width:3%">
                            <col style="width:3%">

                            <col style="width:5%">
                            <col style="width:7%">
                            <col style="width:5%">
                            <col style="width:7%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">사원</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input
                                        uitype="text"
                                        id="EMP_CODE"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="EMP_FULL_NAME"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td class="td_input" >
                                <%--<button id="empBtn" type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup2">
                                    <img src='../../../resource/images/find2.png' width='12px' />
                                </button>--%>
                                <sbux-button
                                        id="empBtn"
                                        class="btn btn-xs btn-outline-dark"
                                        uitype="modal"
                                        target-id="modal-compopup1"
                                        image-src="../../../resource/images/find2.png"
                                        image-style="width:25px;height:15px;"
                                        onclick="fn_compopup2"
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">사업장</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="SITE_CODE"
                                        name="SITE_CODE"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonSiteCode"
                                        readonly
                                />
                            </td>
                            <th scope="row" class="th_bg">호봉</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="SALARY_CLASS"
                                        name="SALARY_CLASS"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonSalaryClass"
                                />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">부서</th>
                            <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                                <sbux-input
                                        uitype="text"
                                        id="DEPT_CODE"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="DEPT_NAME"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td class="td_input" >
                                <%--<button id="deptBtn" type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup1">
                                    <img src='../../../resource/images/find2.png' width='12px' />
                                </button>--%>
                                <sbux-button
                                        id="deptBtn"
                                        class="btn btn-xs btn-outline-dark"
                                        text="…" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup1"
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">사원구분</th>
                            <td class="td_input" style="border-right: hidden;" data-group="EMP">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="EMP_TYPE"
                                        name="EMP_TYPE"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonEmpType"
                                        readonly
                                />
                            </td>
                            <th scope="row" class="th_bg">직위</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="POSITION_CODE"
                                        name="POSITION_CODE"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonPositionCode"
                                        readonly
                                />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">입사일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="ENTER_DATE"
                                        name="ENTER_DATE"
                                        class="table-datepicker-ma"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">퇴사일</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="RETIRE_DATE"
                                        name="RETIRE_DATE"
                                        uitype="popup"
                                        date-format="yyyy-mm-dd"
                                        class="table-datepicker-ma"
                                ></sbux-datepicker>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">급여수습종료일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="TEMP_END_DATE"
                                        name="TEMP_END_DATE"
                                        uitype="popup"
                                        date-format="yyyy-mm-dd"
                                        class="table-datepicker-ma"
                                ></sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">상여적용시작일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="BONUS_APPLY_START_DATE"
                                        name="BONUS_APPLY_START_DATE"
                                        uitype="popup"
                                        date-format="yyyy-mm-dd"
                                        class="table-datepicker-ma"
                                ></sbux-datepicker>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>급여정보</span></li>
                    </ul>
                </div>
                <table id="dataArea3" class="table table-bordered tbl_fixed">
                    <colgroup>
                        <col style="width:5%">
                        <col style="width:5%">
                        <col style="width:5%">
                        <col style="width:1%">

                        <col style="width:6%">
                        <col style="width:7%">
                        <col style="width:5%">
                        <col style="width:7%">
                        <col style="width:6%">
                        <col style="width:7%">
                    </colgroup>
                    <tr>
                        <th scope="row" class="th_bg">급여체계</th>
                        <td colspan="2" class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text=""
                                    uitype="single"
                                    id="PAY_GROUP_CODE"
                                    name="PAY_GROUP_CODE"
                                    class="form-control input-sm inpt_data_reqed"
                                    jsondata-ref="jsonPayGroupCode"
                            />
                        </td>
                        <td style="border-right: hidden;">&nbsp;
                            <sbux-input
                                    uitype="hidden"
                                    uitype="text"
                                    id="BANK_ACCOUNT"
                                    class="form-control input-sm"
                            ></sbux-input>
                            <sbux-input
                                    uitype="hidden"
                                    uitype="text"
                                    id="BANK_ACCOUNT2"
                                    class="form-control input-sm"
                            ></sbux-input>
                            <sbux-input
                                    uitype="hidden"
                                    uitype="text"
                                    id="RET_PENS_BANK_ACC"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">급여은행</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="BANK_CODE"
                                    name="BANK_CODE"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonBankCode"
                            />
                        </td>
                        <th scope="row" class="th_bg">급여계좌</th>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                            <%--<sbux-input id="BANK_ACCOUNT_REAL" uitype="text" style="width:100%" placeholder=""
                                        class="tpgTd" init="0" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                            ></sbux-input>--%>
                            <sbux-input id="BANK_ACCOUNT_REAL" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                        <td style="border-right: hidden;">&nbsp;</td>
                        <td style="border-right: hidden;">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                            <sbux-checkbox id="PAY_YN" name="PAY_YN" uitype="normal" text="급여지급" true-value="Y"
                                           false-value="N"></sbux-checkbox>
                        </td>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                            <sbux-checkbox id="BONUS_PAY_YN" name="BONUS_PAY_YN" uitype="normal" text="상여지급" true-value="Y"
                                           false-value="N"></sbux-checkbox>
                        </td>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                            <sbux-checkbox id="RETIRE_PAY_YN" name="RETIRE_PAY_YN" uitype="normal" text="퇴직금지급" true-value="Y"
                                           false-value="N"></sbux-checkbox>
                        </td>
                        <td style="border-right: hidden;">&nbsp;</td>
                        <th scope="row" class="th_bg">연차은행</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="BANK_CODE2"
                                    name="BANK_CODE2"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonBankCode"
                            />
                        </td>
                        <th scope="row" class="th_bg">연차계좌</th>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                            <%--<sbux-input id="BANK_ACCOUNT2_REAL" uitype="text" style="width:100%" placeholder=""
                                        class="tpgTd" init="0" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                            ></sbux-input>--%>
                            <sbux-input id="BANK_ACCOUNT2_REAL" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">2계좌지급급여</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="BANK2_PAY_ITEM"
                                    name="BANK2_PAY_ITEM"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonBank2PayItem"
                            />
                        </td>
                    </tr>

                    <tr>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                            <sbux-checkbox id="LUNCH_PAY_YN" name="LUNCH_PAY_YN" uitype="normal" text="중식비지급" true-value="Y"
                                           false-value="N"></sbux-checkbox>
                        </td>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                            <sbux-checkbox id="OVER_TIME_PAY_YN" name="OVER_TIME_PAY_YN" uitype="normal" text="연장수당지급" true-value="Y"
                                           false-value="N"></sbux-checkbox>
                        </td>
                        <td colspan="2" class="td_input" style="border-right:hidden;">
                            <sbux-checkbox id="OT_TAX_FREE_YN" name="OT_TAX_FREE_YN" uitype="normal" text="연장비과세대상" true-value="Y"
                                           false-value="N"></sbux-checkbox>
                        </td>
                        <%--<td style="border-right: hidden;">&nbsp;</td>--%>
                        <th scope="row" class="th_bg">IRP은행</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="RET_PENS_BANK_CODE"
                                    name="RET_PENS_BANK_CODE"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonBankCode"
                            />
                        </td>
                        <th scope="row" class="th_bg">IRP계좌</th>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                            <%--<sbux-input id="RET_PENS_BANK_ACC_REAL" uitype="text" style="width:100%" placeholder=""
                                        class="tpgTd" init="0" mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }"
                            ></sbux-input>--%>
                            <sbux-input id="RET_PENS_BANK_ACC_REAL" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                            <sbux-checkbox id="MUTUAL_AID_MEMBER_YN" name="MUTUAL_AID_MEMBER_YN" uitype="normal" text="상조회비공제" true-value="Y"
                                           false-value="N"></sbux-checkbox>
                        </td>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                            <sbux-checkbox id="MONTHLY_DONATION_YN" name="MONTHLY_DONATION_YN" uitype="normal" text="기부금공제" true-value="Y"
                                           false-value="N"></sbux-checkbox>
                        </td>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                            <sbux-checkbox id="INCOME_TAX_YN" name="INCOME_TAX_YN" uitype="normal" text="소득세계산" true-value="Y"
                                           false-value="N"></sbux-checkbox>
                        </td>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                        <th scope="row" class="th_bg">기본계좌</th>
                        <td colspan="2" class="td_input" style="border-right:hidden;">
                            <%--<sbux-input id="MAIN_ACC_TYPE" uitype="text" style="width:90%" placeholder=""
                                        class="form-control input-sm"></sbux-input>--%>
                            <sbux-input id="MAIN_ACC_TYPE" uitype="text" style="width:100%" placeholder=""
                                        class="form-control input-sm" mask = "{ 'alias': 'numeric'}" maxlength="3"></sbux-input>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">부양가족수</th>
                        <td colspan="2" class="td_input" style="border-right:hidden;">
                            <sbux-input id="SUPPORTEE_QTY" uitype="text" style="width:100%" placeholder=""
                                        class="form-control input-sm" mask = "{ 'alias': 'numeric'}" maxlength="2"></sbux-input>
                        </td>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                        <th scope="row" class="th_bg">20세미만자녀수</th>
                        <td colspan="2" class="td_input" style="border-right:hidden;">
                            <sbux-input id="CHILDREN_QTY" uitype="text" style="width:90%" placeholder=""
                                        class="form-control input-sm" mask = "{ 'alias': 'numeric'}" maxlength="2"></sbux-input>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="PENSION_YN"
                                    name="PENSION_YN"
                                    uitype="normal"
                                    uitype="hidden"
                                    class="form-control input-sm check"
                                    text="국민연금대상"
                                    true-value="Y" false-value="N"
                            />
                            <sbux-checkbox
                                    uitype="normal"
                                    id="HEALTH_INSURE_YN"
                                    name="HEALTH_INSURE_YN"
                                    uitype="normal"
                                    uitype="hidden"
                                    class="form-control input-sm check"
                                    text="건강보험 대상"
                                    true-value="Y" false-value="N"
                            />
                            <sbux-checkbox
                                    uitype="normal"
                                    id="LONGTERM_CARE_YN"
                                    name="LONGTERM_CARE_YN"
                                    uitype="normal"
                                    uitype="hidden"
                                    class="form-control input-sm check"
                                    text="장기요양보험 대상"
                                    true-value="Y" false-value="N"
                            />
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <%--국민연금취득일--%>
                            <sbux-datepicker
                                    id="PENSION_JOIN_DATE"
                                    name="PENSION_JOIN_DATE"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="table-datepicker-ma"
                                    readonly>
                            </sbux-datepicker>
                            <%--건강보험취득일--%>
                            <sbux-datepicker
                                    id="HEALTH_INSURE_JOIN_DATE"
                                    name="HEALTH_INSURE_JOIN_DATE"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="table-datepicker-ma"
                                    readonly>
                            </sbux-datepicker>
                            <%--국민연금상실일--%>
                            <sbux-datepicker
                                    id="PENSION_CLOSE_DATE"
                                    name="PENSION_CLOSE_DATE"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="table-datepicker-ma"
                                    readonly>
                            </sbux-datepicker>
                            <%--건강보험상실일--%>
                            <sbux-datepicker
                                    id="HEALTH_INSURE_CLOSE_DATE"
                                    name="HEALTH_INSURE_CLOSE_DATE"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="table-datepicker-ma"
                                    readonly>
                            </sbux-datepicker>
                            <%--비율최종적용일--%>
                            <sbux-datepicker
                                    id="LAST_APPLICATION_DATE"
                                    name="LAST_APPLICATION_DATE"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="table-datepicker-ma"
                                    readonly>
                            </sbux-datepicker>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <%--국민연금번호--%>
                            <sbux-input
                                    uitype="hidden"
                                    uitype="text"
                                    id="PENSION_NO"
                                    class="form-control input-sm"
                            ></sbux-input>
                            <%--건강보험번호--%>
                            <sbux-input
                                    uitype="hidden"
                                    uitype="text"
                                    id="HEALTH_INSURE_NO"
                                    class="form-control input-sm"
                            ></sbux-input>
                            <%--국민연금보수월액--%>
                            <sbux-input
                                    uitype="hidden"
                                    uitype="text"
                                    id="PENSION_BASE_AMT"
                                    class="form-control input-sm"
                            ></sbux-input>
                            <%--건강보험보수월액--%>
                            <sbux-input
                                    uitype="hidden"
                                    uitype="text"
                                    id="HEALTH_INSURE_BASE_AMT"
                                    class="form-control input-sm"
                            ></sbux-input>
                            <%--고용보험보수월액--%>
                            <sbux-input
                                    uitype="hidden"
                                    uitype="text"
                                    id="EMPLOY_INSURE_BASE_AMT"
                                    class="form-control input-sm"
                            ></sbux-input>
                            <%--원천징수적용비율--%>
                            <sbux-input
                                    uitype="hidden"
                                    uitype="text"
                                    id="APPLICATION_RATE"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-checkbox
                                    uitype="normal"
                                    id="EMPLOY_INSURE_YN"
                                    name="EMPLOY_INSURE_YN"
                                    uitype="normal"
                                    uitype="hidden"
                                    class="form-control input-sm check"
                                    text="고용보험대상"
                                    true-value="Y" false-value="N"
                            />
                        </td>
                    </tr>
                </table>
                <sbux-tabs id="tabJson" name="tabJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false">
                </sbux-tabs>
                <div class="tab-content">
                    <div id="payInfoTab" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>급여정보</span>
                                    <%--<span style="font-size:12px">(조회건수 <span id="listCount2">0</span>건)</span>--%>
                                </li>
                            </ul>
                            <sbux-button
                                    id="btnDel"
                                    name="btnDel"
                                    uitype="normal"
                                    text="행삭제"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_payInfoDelRow"
                                    style="float: right;"
                            >
                            </sbux-button>
                            <sbux-button
                                    id="btnAdd"
                                    name="btnAdd"
                                    uitype="normal"
                                    text="행추가"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_payInfoAddRow"
                                    style="float: right;"
                            ></sbux-button>
                        </div>
                        <div>
                            <div id="sb-area-grwPayInfo" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="payTab" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>고정 수당항목</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount3">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grwPay" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="dedTab" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>고정 공제항목</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount4">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grwDed" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="varPayTab" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>변동 수당항목</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount5">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grwVarPay" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="varDedTab" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>변동 공제항목</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount6">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grwVarDed" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="payExTab" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>급상여 예외항목</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount7">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grwPayEx" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="detailTab" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>사회보험 가입이력</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount8">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grwDetail" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="viewEx1Tab" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>보수월액</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount9">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grwViewEx1" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="withholdTab" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>원천세징수비율</span>
                                    <%--<span style="font-size:12px">(조회건수 <span id="listCount10">0</span>건)</span>--%>
                                </li>
                            </ul>
                            <sbux-button
                                    id="btnDelWithhold"
                                    name="btnDelWithhold"
                                    uitype="normal"
                                    text="행삭제"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_WithholdDelRow"
                                    style="float: right;"
                            >
                            </sbux-button>
                            <sbux-button
                                    id="btnAddWithhold"
                                    name="btnAddWithhold"
                                    uitype="normal"
                                    text="행추가"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_WithholdAddRow"
                                    style="float: right;"
                            ></sbux-button>
                        </div>
                        <div>
                            <div id="sb-area-grwWithhold" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                </div>
                <div>
                    <div id="sb-area-grwHrpMaster" style="height:283px; width:100%; display: none;" ></div>
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
    var NationInGrid; 			// 그리드를 담기위한 객체 선언
    var jsonNationList = []; 	// 그리드의 참조 데이터 주소 선언
    var gvwPayInfoGrid;
    var jsonPayInfoList = [];
    var gvwPayGrid;
    var jsonPayList = [];
    var gvwDedGrid;
    var jsonDedList = [];
    var gvwVarPayGrid;
    var jsonVarPayList = [];
    var gvwVarDedGrid;
    var jsonVarDedList = [];
    var gvwPayExGrid;
    var jsonPayExList = [];
    var gvwDetailGrid;
    var jsonDetailList = [];
    var gvwViewEx1Grid;
    var jsonViewEx1List = [];
    var gvwWithholdGrid;
    var jsonWithholdList = [];
    /*var gvwHrpMasterGrid;
    var jsonHrpMasterList = [];*/
   /* var gvwHrimasterGrid;
    var jsonHrimasterList = [];*/

    var jsonCompCode = []; //법인 ( L_ORG000 )comp_code
    var jsonSiteCode = []; //사업장 ( L_ORG001 )site_code
    var jsonEmpState = []; //재직구분 ( L_HRI009 )emp_state
    var jsonSalaryClass = []; //호봉 ( L_HRI011 )salary_class
    var jsonEmpType = []; //사원구분 ( L_HRI008 )emp_type
    var jsonPositionCode = []; //직위 ( L_HRI002 )position_code
    var jsonPayGroupCode = []; //급여체계 ( L_HRI010 )pay_group_code
    var jsonBankCode = []; //급여은행 ( L_BANK_CODE )bank_code, bank_code2, ret_pens_bank_code
    var jsonBank2PayItem = []; //2계좌지급급여 ( L_HRP063 )bank2_pay_item
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )pay_area_type,SRCH_PAY_AREA_TYPE
    var jsonDutyCode = []; //직책 ( L_HRI003 )duty_code
    var jsonDeptName = []; //부서 ( P_ORG001 )dept_name
    var jsonPayType = []; //지급구분 ( L_HRB008 )pay_type
    var jsonPayItemCode = []; //공제항목 ( L_HRP001 )pay_item_code
    var jsonPayItemCode2 = []; //공제항목 ( L_HRP002 )pay_item_code
    var jsonPayItemCode3 = []; //공제항목 ( L_HRP009 )pay_item_code
    var jsonPayItemCode4 = []; //공제항목 ( L_HRP037 )pay_item_code
    var jsonPayItemCode5 = []; //공제항목 ( L_HRP004 )pay_item_code
    var jsonPayApplyType= []; //공제항목 ( L_HRP021 )pay_item_code
    var jsonInsuType= []; //공제항목 ( L_HRW018 )pay_item_code
    var jsonInsuReasonType= []; //공제항목 ( L_HRW019 )insu_reason_type
    var jsonInsuStateType= []; //공제항목 ( L_HRW021 )insu_state_type
    var jsonInsuRegType= []; //공제항목 ( L_HRW020 )insu_reg_type
    var jsonApplyType= []; //공제항목 ( L_HRW023 )apply_type
    var jsonLongApplyType= []; //공제항목 ( L_HRW022 )long_apply_type
    var jsonUser= []; //공제항목 ( L_USER )userid

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            gfnma_setComSelect(['srch-comp_code'], jsonCompCode, 'L_ORG000', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'COMP_CODE', 'COMP_NAME', 'Y', ''),
            gfnma_setComSelect(['SRCH_EMP_STATE','EMP_STATE'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE','PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SALARY_CLASS'], jsonSalaryClass, 'L_HRI011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'GRADE_HOBONG_CODE', 'GRADE_HOBONG_NAME', 'Y', ''),
            gfnma_setComSelect(['EMP_TYPE'], jsonEmpType, 'L_HRI008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['POSITION_CODE'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['PAY_GROUP_CODE'], jsonPayGroupCode, 'L_HRI010', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_GROUP_CODE', 'PAY_GROUP_NAME', 'Y', ''),
            gfnma_setComSelect(['BANK_CODE','BANK_CODE2','RET_PENS_BANK_CODE'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            gfnma_setComSelect(['BANK2_PAY_ITEM'], jsonBank2PayItem, 'L_HRP063', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayType, 'L_HRB008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayItemCode, 'L_HRP001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayItemCode2, 'L_HRP002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayItemCode3, 'L_HRP009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayItemCode4, 'L_HRP037', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayItemCode5, 'L_HRP004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayApplyType, 'L_HRP021', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonInsuType, 'L_HRW018', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonInsuReasonType, 'L_HRW019', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonInsuStateType, 'L_HRW021', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonInsuRegType, 'L_HRW020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonApplyType, 'L_HRW023', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonLongApplyType, 'L_HRW022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonUser, 'L_USER', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'USER_ID', 'USER_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonDeptName, 'P_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'USER_ID', 'USER_NAME', 'Y', ''),


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
            })
        ]);
    }

    /**
     * 공통팝업3
     */
    var fn_compopup1 = function(type) {

        var searchText = '';
        if (_.isEqual(type, 'srch')){
            searchText 		= gfnma_nvl2(SBUxMethod.get("SRCH_DEPT_NAME"));
        }else {
            searchText 		= gfnma_nvl2(SBUxMethod.get("DEPT_NAME"));
        }
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
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"     ,   "100"]
            ,itemSelectEvent		: function (data){
                if (_.isEqual(type, 'srch')){
                    SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NAME);
                    SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CODE);
                }else{
                    SBUxMethod.set('DEPT_NAME', data.DEPT_NAME);
                    SBUxMethod.set('DEPT_CODE', data.DEPT_CODE);
                }

            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function(type) {

        var searchText = '';
        if (_.isEqual(type, 'srch')){
            searchText = gfnma_nvl2(SBUxMethod.get("SRCH_EMP_FULL_NAME"));
        }else{
            searchText = gfnma_nvl2(SBUxMethod.get("EMP_FULL_NAME"));
        }

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
            , searchInputValues: [""           , searchText ,""             ,""         ,""]
            , height: '400px'
            , tableHeader:       ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames:  ["EMP_CODE"  , "EMP_NAME"  , "DEPT_NAME"   ,"SITE_NAME"  ,"EMP_STATE_NAME"]
            , tableColumnWidths: ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            , itemSelectEvent: function (data) {
                if (_.isEqual(type, 'srch')){
                    SBUxMethod.set('SRCH_EMP_FULL_NAME', data.EMP_NAME);
                    SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
                }else{
                    SBUxMethod.set('EMP_NAME', data.EMP_NAME);
                    SBUxMethod.set('EMP_CODE', data.EMP_CODE);
                }
            },
        });
        //SBUxMethod.openModal('modal-compopup1');

    }

    // only document
    window.addEventListener('DOMContentLoaded', async function (e) {

        fn_initSBSelect();
        fn_init();
        await fn_onload();

    });

    const fn_onload = async function () {

        SBUxMethod.attr('empBtn'        ,	'readonly', true);//사원
        SBUxMethod.attr('EMP_CODE'      ,	'readonly', true);//사원
        SBUxMethod.attr('EMP_FULL_NAME' ,	'readonly', true);//사원
        SBUxMethod.attr('SITE_CODE'     ,	'readonly', true);//사업장
        SBUxMethod.attr('DEPT_CODE'     ,	'readonly', true);//부서
        SBUxMethod.attr('DEPT_NAME'     ,	'readonly', true);//부서
        SBUxMethod.attr('deptBtn'       ,	'readonly', true);//부서
        SBUxMethod.attr('EMP_TYPE'      ,	'readonly', true);//사원구분
        //$('#EMP_TYPE').attr('readonly', true);
        $('#EMP_TYPE').removeAttr('readonly');
        SBUxMethod.attr('POSITION_CODE' ,	'readonly', true);//직위
        SBUxMethod.attr('ENTER_DATE'    ,	'readonly', true);//입사일
        SBUxMethod.attr('RETIRE_DATE'   ,	'readonly', true);//퇴사일
    }

    const fn_init = async function () {

        fn_createGrid();
        fn_createPayInfoGrid();        //급여정보
        fn_createPayGrid();     //고정 수당항목
        fn_createDedGrid();      //고정 공제항목
        fn_createVarPayGrid();  //변동 수당항목
        fn_createVarDedGrid();  //변동 공제항목
        fn_createPayExGrid();   //급상여 예외항목
        fn_createDetailGrid();  //사회보험 가입이력
        fn_createViewEx1Grid();  //보수월액
        fn_createWithholdGrid(); //원천세징수비율
        /*fn_createHrpMasterGrid();*/ //급여 기본 사항, 사회보험
        fn_search();
    }

    // 신규
  /*  function cfn_add() {
        fn_create();
    }*/
    // 저장
    async function cfn_save() {
        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            let  ret = false;

            ret = await fn_save('N');

            if (!ret){// DB에서 신규와 수정을 구분한다.
                return;
            }

            //수정시 수정된 데이터만 가져감
            let updatedData = gvwPayInfoGrid.getUpdateData(true, 'all');
            if (_.isEmpty(updatedData) == false && ret == true){
                ret = await fn_saveS1(updatedData);
            }

            let updatedData2 = gvwWithholdGrid.getUpdateData(true, 'all');
            if (_.isEmpty(updatedData2) == false && ret == true){
                ret = await fn_saveS2(updatedData2);
            }

            /************ 사회보험가입이력 ************/
            let detailGridData = gvwDetailGrid.getUpdateData(true, 'all');

            detailGridData.forEach((item, index) => {

                if (item.status == 'i'){
                    if (item.data.START_DATE == ''){

                        gfn_comConfirm("Q0000","[가입이력]"+"가입일을 필수입니다!");
                        return;
                        /*SetMessageBox("[가입이력]" + GetFormMessage("HRP1000_005"), IconType.Information);
                        return;*/
                    }

                    if (item.data.END_DATE == ''){

                        gfn_comConfirm("Q0000","[가입이력]"+"종료일을 필수입니다!");
                        return;
                        /*SetMessageBox("[가입이력]" + GetFormMessage("HRP1000_005"), IconType.Information);
                        return;*/
                    }

                    if (Number(item.data.START_DATE) >= Number(item.data.END_DATE)){
                        gfn_comConfirm("Q0000","[가입이력]"+"가입일이 종료일보다 클수 없습니다!");
                        return;
                        /*SetMessageBox("[가입이력]" + GetFormMessage("HRP1000_007"), IconType.Information);
                        return;*/
                    }

                }

            });

           /* ret = fnSET_P_HRP5600_S("");*/
            let updatedData3 = gvwDetailGrid.getUpdateData(true, 'all');
            if (_.isEmpty(updatedData3) == false && ret == true){
                ret = await fn_saveS3(updatedData3);
            }


            /************ 사회보험가입이력 ************/
            let viewEx1GridData = gvwViewEx1Grid.getUpdateData(true, 'all');

            viewEx1GridData.forEach((item, index) => {

                if (item.status == 'i'){
                    if (item.data.APPLY_START_DATE == ''){

                        gfn_comConfirm("Q0000","[가입이력]"+"가입일을 필수입니다!");
                        return;
                        /*SetMessageBox("[가입이력]" + GetFormMessage("HRP1000_005"), IconType.Information);
                        return;*/
                    }

                    if (item.data.APPLY_END_DATE == ''){

                        gfn_comConfirm("Q0000","[가입이력]"+"종료일을 필수입니다!");
                        return;
                        /*SetMessageBox("[가입이력]" + GetFormMessage("HRP1000_005"), IconType.Information);
                        return;*/
                    }

                    if (Number(item.data.APPLY_START_DATE) >= Number(item.data.APPLY_END_DATE)){
                        gfn_comConfirm("Q0000","[가입이력]"+"가입일이 종료일보다 클수 없습니다!");
                        return;
                        /*SetMessageBox("[가입이력]" + GetFormMessage("HRP1000_007"), IconType.Information);
                        return;*/
                    }

                }

            });
            let updatedData4 = gvwDetailGrid.getUpdateData(true, 'all');
            if (_.isEmpty(updatedData4) == false && ret == true){
                ret = await fn_saveS4(updatedData4);
            }

            if (ret) {
                gfn_comAlert("I0001");
                fn_search();
            }

           /* ret = fnSET_P_HRP5700_S("");

            if (ret)
            {
                string strfocus = txtemp_code1.Text;

                QueryClick();

                gvwList.FocusedRowHandle = GetGridRowIndex(gvwList, "emp_code", strfocus);
            }*/

        }
    }
    // 삭제
    function cfn_del() {
        //fn_delete();
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

    //사원 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwInfo';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonGvwInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        /*SBGridProperties.allowcopy = true; //복사*/
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: ["등록"], ref: 'CREATE', type: 'checkbox', width: '70px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["급여체계"], ref : 'PAY_GROUP_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayGroupCode', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption : ["급여영역"], ref : 'PAY_AREA_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayAreaType', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption : ["직 책"], ref : 'DUTY_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDutyCode', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption : ["직위"], ref : 'POSITION_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPositionCode', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption : ["부서"], ref : 'DEPT_NAME', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDeptName', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ['입사일'], ref: 'ENTER_DATE', width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['퇴사일'], ref: 'RETIRE_DATE', width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption : ["급여계좌은행"], ref : 'BANK_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonBankCode', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["급여계좌번호"], ref: 'BANK_ACCOUNT_REAL', type: 'output', width: '200px', style: 'text-align:left'},
            {caption : ["연차계좌은행"], ref : 'BANK_CODE2', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonBankCode', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["연차계좌번호"], ref: 'BANK_ACCOUNT2_REAL', type: 'output', width: '200px', style: 'text-align:left'},

            {caption : ["재직구분"], ref : 'EMP_STATE', width : '100px', style : 'text-align:center', type : 'combo', hidden: true,
                typeinfo : {ref : 'jsonEmpState', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["급여계좌번호(암호화)"], ref: 'BANK_ACCOUNT', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["연차계좌번호(암호화)"], ref: 'BANK_ACCOUNT2', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption : ["IRP계좌은행"], ref : 'RET_PENS_BANK_CODE', width : '100px', style : 'text-align:center', type : 'combo', hidden: true,
                typeinfo : {ref : 'jsonBankCode', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["IRP계좌번호(암호화)"], ref: 'RET_PENS_BANK_ACC', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["IRP계좌번호"], ref: 'RET_PENS_BANK_ACC_REAL', type: 'output', width: '200px', style: 'text-align:left', hidden: true}

        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        gvwInfoGrid.bind('click', 'fn_view');
        gvwInfoGrid.bind('keyup', 'fn_keyup');

    }

    //급여정보
    function fn_createPayInfoGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwPayInfo';
        SBGridProperties.id = 'gvwPayInfoGrid';
        SBGridProperties.jsonref = 'jsonPayInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: ['시작일자'], 		ref: 'APPLY_START_DATE', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, isvalidatecheck: true, validate : 'fnValidate'},
            {caption: ['종료일자'], 		ref: 'APPLY_END_DATE', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, isvalidatecheck: true, validate : 'fnValidate'},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '200px', style: 'text-align:left'},
            {caption: ["급여기본급"], ref: 'SALARY_BASE_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["업적급"], ref: 'JOB_BASE_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["고정연장수당"], ref: 'OT_FIXED_BASE_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["역할급"], ref: 'ROLE_BASE_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["성과급"], ref: 'INCENTIVE_BASE_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["역량가급"], ref: 'COMPETENCE_BASE_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["월급여"], ref: 'MONTHLY_SALARY_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["지급횟수"], ref: 'PAY_COUNT', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["성과가급"], ref: 'INCENTIVE_ADD_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["지급횟수(성과)"], ref: 'BONUS_COUNT', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["연봉"], ref: 'ANNUAL_SALARY_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["성과급월액"], ref: 'INCENTIVE_MONTH_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["기본시급"], ref: 'HOURLY_BASE_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["기본급(통상시급용)"], ref: 'SUM_BASE_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["연차기준금액"], ref: 'ANNUAL_BASE_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["수정일시"], ref: 'USERTIME', type: 'input', width: '100px', style: 'text-align:left', disabled: true},

            {caption: ["기본일급"], ref: 'DAILY_BASE_AMT', type: 'input', width: '150px', style: 'text-align:right', hidden: true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["상여기본급"], ref: 'BONUS_BASE_AMT', type: 'input', width: '150px', style: 'text-align:right', hidden: true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["기여시급"], ref: 'CONTRIBUTE_BASE_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["조정수당"], ref: 'ADJUST_BASE_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}}

        ];

        gvwPayInfoGrid = _SBGrid.create(SBGridProperties);
        gvwPayInfoGrid.bind('valuechanged','gridValueChanged');
    }

    window.fnValidate = function(objGrid, nRow, nCol, strValue) {
        if (strValue === '') {
            return { isValid : false, message : '값을 입력하시오.'};
        }

        /*if (!(/[0-9]/g).test(strValue)) {
            return { isValid : false, message : '숫자를 입력하시오.', value: strValue};
        }*/

        return Number(strValue);
    }

    //고정 수당항목
    function fn_createPayGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwPay';
        SBGridProperties.id = 'gvwPayGrid';
        SBGridProperties.jsonref = 'jsonPayList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.explorerbar = 'sortmove';
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true ,
                typeinfo : {ref : 'jsonPayType', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption : ["수당항목"], ref : 'PAY_ITEM_CODE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '120px', style: 'text-align:right', isvalidatecheck: true,	validate : 'fnValidate'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ['적용시작일'], ref: 'APPLY_START_DATE', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['적용종료일'], ref: 'APPLY_END_DATE', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["수정시간"], ref: 'USERTIME', type: 'output', width: '120px', style: 'text-align:left'},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '120px', style: 'text-align:left'},
            {caption: ["txn_id"], ref: 'TXN_ID', type: 'output', width: '120px', style: 'text-align:left', hidden: true},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값


        ];

        gvwPayGrid = _SBGrid.create(SBGridProperties);
    }

    //고정 공제항목
    function fn_createDedGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwDed';
        SBGridProperties.id = 'gvwDedGrid';
        SBGridProperties.jsonref = 'jsonDedList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.explorerbar = 'sortmove';
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayType', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption : ["공제항목"], ref : 'PAY_ITEM_CODE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode2', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '120px', style: 'text-align:right', isvalidatecheck: true,	validate : 'fnValidate'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ['적용시작일'], ref: 'APPLY_START_DATE', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['적용종료일'], ref: 'APPLY_END_DATE', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false , isvalidatecheck: true,	validate : 'fnValidate',
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["수정시간"], ref: 'USERTIME', type: 'output', width: '120px', style: 'text-align:left'},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '120px', style: 'text-align:left'},
            {caption: ["gridColumnEx31"], ref: 'PAY_ITEM_CATEGORY', type: 'output', width: '120px', style: 'text-align:left', hidden: true},
            {caption: ["txn_id"], ref: 'TXN_ID', type: 'output', width: '120px', style: 'text-align:left', hidden: true},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값


        ];

        gvwDedGrid = _SBGrid.create(SBGridProperties);
    }

    //변동 수당항목
    function fn_createVarPayGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwVarPay';
        SBGridProperties.id = 'gvwVarPayGrid';
        SBGridProperties.jsonref = 'jsonVarPayList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        SBGridProperties.explorerbar = 'sortmove';
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayType', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption : ["공제항목"], ref : 'PAY_ITEM_CODE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode3', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '120px', style: 'text-align:right', isvalidatecheck: true,	validate : 'fnValidate'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ['적용시작일'], ref: 'APPLY_START_DATE', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, typeinfo : {alias : "yyyy-mm",calendartype : "yearmonth", dateformat: 'yymm'}},
            {caption: ['지급일(세무)'], ref: 'TAX_PAY_DATE', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['적용종료일'], ref: 'APPLY_END_DATE', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false, hidden: true,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '120px', style: 'text-align:left'},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonUser', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["수정시간"], ref: 'USERTIME', type: 'output', width: '120px', style: 'text-align:left'},
            {caption: ["txn_id"], ref: 'TXN_ID', type: 'output', width: '120px', style: 'text-align:left', hidden: true},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값


        ];

        gvwVarPayGrid = _SBGrid.create(SBGridProperties);
    }

    //변동 공제항목
    function fn_createVarDedGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwVarDed';
        SBGridProperties.id = 'gvwVarDedGrid';
        SBGridProperties.jsonref = 'jsonVarDedList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        SBGridProperties.explorerbar = 'sortmove';
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayType', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption : ["공제항목"], ref : 'PAY_ITEM_CODE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode4', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '120px', style: 'text-align:right', isvalidatecheck: true,	validate : 'fnValidate'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ['적용시작일'], ref: 'APPLY_START_DATE', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false,  disabled: true,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, typeinfo : {alias : "yyyy-mm",calendartype : "yearmonth", dateformat: 'yymm'}},
            {caption: ['지급일(세무)'], ref: 'TAX_PAY_DATE', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['적용종료일'], ref: 'APPLY_END_DATE', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false, hidden: true,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '120px', style: 'text-align:left'},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ['수정시간'], ref: 'USERTIME', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["txn_id"], ref: 'TXN_ID', type: 'output', width: '120px', style: 'text-align:left', hidden: true},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값

        ];

        gvwVarDedGrid = _SBGrid.create(SBGridProperties);
    }


    //급상여 예외항목
    function fn_createPayExGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwPayEx';
        SBGridProperties.id = 'gvwPayExGrid';
        SBGridProperties.jsonref = 'jsonPayExList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        SBGridProperties.explorerbar = 'sortmove';
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayType', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption : ["공제항목"], ref : 'PAY_ITEM_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode5', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '100px', style: 'text-align:right', isvalidatecheck: true,	validate : 'fnValidate'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ['적용시작월'], ref: 'APPLY_START_DATE', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymm'}, disabled: true},
            {caption: ['적용종료월'], ref: 'APPLY_END_DATE', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymm'}},
            {caption : ["적용구분"], ref : 'PAY_APPLY_TYPE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonPayApplyType', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["적용비율"], ref: 'PAY_APPLY_RATE', type: 'input', width: '100px', style: 'text-align:right' , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/}},
            {caption: ["적용금액"], ref: 'PAY_APPLY_AMT', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ['수정일시'], ref: 'USERTIME', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["비고"], ref: 'MEMO', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값


        ];

        gvwPayExGrid = _SBGrid.create(SBGridProperties);
    }

    //사회보험 가입이력
    function fn_createDetailGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwDetail';
        SBGridProperties.id = 'gvwDetailGrid';
        SBGridProperties.jsonref = 'jsonDetailList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        SBGridProperties.explorerbar = 'sortmove';
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'INSU_TYPE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonInsuType', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ['가입일'], ref: 'START_DATE', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['종료일'], ref: 'END_DATE', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ["자격부여사유"], ref : 'INSU_REASON_TYPE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonInsuReasonType', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption : ["신고"], ref : 'INSU_STATE_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonInsuStateType', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption : ["상태"], ref : 'INSU_REG_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonInsuRegType', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["적용율(%)"], ref: 'INSU_RATE', type: 'input', width: '100px', style: 'text-align:left' , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 3}},
            {caption: ["취득월제외"], ref: 'INSU_AMT_YN', type: 'checkbox', width: '100px', style: 'text-align:center',
                typeinfo: {ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["해외근로자"], ref: 'OVER_WORKER_YN', type: 'checkbox', width: '100px', style: 'text-align:center',
                typeinfo: {ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["65세이상"], ref: 'AGE_65_OVER_YN', type: 'checkbox', width: '100px', style: 'text-align:center',
                typeinfo: {ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '100px', style: 'text-align:left'},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ['수정일시'], ref: 'USERTIME', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true}

        ];

        gvwDetailGrid = _SBGrid.create(SBGridProperties);
    }

    //보수월액
    function fn_createViewEx1Grid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwViewEx1';
        SBGridProperties.id = 'gvwViewEx1Grid';
        SBGridProperties.jsonref = 'jsonViewEx1List';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        SBGridProperties.explorerbar = 'sortmove';
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption : ["사회보험"], ref : 'APPLY_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonApplyType', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption : ["요양"], ref : 'LONG_APPLY_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonLongApplyType', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ['가입일'], ref: 'APPLY_START_DATE', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['종료일'], ref: 'APPLY_END_DATE', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["보수월액"], ref: 'BASE_AMT', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["사회보험보험료"], ref: 'VAL1', type: 'input', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["사회보험 면제/공제"], ref: 'VAL2', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["노인장기요양 보험료"], ref: 'VAL3', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["노인장기요양 면제"], ref: 'LONG_APPLY_EXEM_AMT', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["비고"], ref: 'MEMO', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ['수정일시'], ref: 'USERTIME', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값
        ];

        gvwViewEx1Grid = _SBGrid.create(SBGridProperties);
    }

    //원천세징수비율
    function fn_createWithholdGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwWithhold';
        SBGridProperties.id = 'gvwWithholdGrid';
        SBGridProperties.jsonref = 'jsonWithholdList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        SBGridProperties.explorerbar = 'sortmove';
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: ['시작일'], ref: 'APPLY_START_DATE', 	width:'150px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['종료일'], ref: 'APPLY_END_DATE', 	width:'150px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["비율%"], ref: 'WITHHOLD_RATE', type: 'input', width: '150px', style: 'text-align:right' , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 3}},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '150px', style: 'text-align:left'},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ['수정일시'], ref: 'USERTIME', 	width:'120px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값
        ];

        gvwWithholdGrid = _SBGrid.create(SBGridProperties);
    }

    //급여 기본 사항, 사회보험
    function fn_createHrpMasterGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwHrpMaster';
        SBGridProperties.id = 'gvwHrpMasterGrid';
        SBGridProperties.jsonref = 'jsonHrpMasterList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        //!*SBGridProperties.allowcopy = true; //복사
        SBGridProperties.explorerbar = 'sortmove';
        //!*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption : ["급여체계"], ref : 'PAY_GROUP_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayGroupCode', /*displayui : true,*/ label : 'label', value : 'value'}
            },
            {caption: ["급여계좌번호(암호화)"], ref: 'BANK_ACCOUNT', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["급여계좌번호(암호화)"], ref: 'RET_PENS_BANK_ACC', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["PENSION_YN"], ref: 'PENSION_YN', type: 'checkbox', width: '100px', style: 'text-align:center',
                typeinfo: {ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["PENSION_JOIN_DATE"], ref: 'PENSION_JOIN_DATE', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["PENSION_CLOSE_DATE"], ref: 'PENSION_CLOSE_DATE', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["PENSION_NO"], ref: 'PENSION_NO', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["PENSION_BASE_AMT"], ref: 'PENSION_BASE_AMT', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false},/*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["HEALTH_INSURE_YN"], ref: 'HEALTH_INSURE_YN', type: 'checkbox', width: '100px', style: 'text-align:center',
                typeinfo: {ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["HEALTH_INSURE_JOIN_DATE"], ref: 'HEALTH_INSURE_JOIN_DATE', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["HEALTH_INSURE_CLOSE_DATE"], ref: 'HEALTH_INSURE_CLOSE_DATE', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["HEALTH_INSURE_NO"], ref: 'HEALTH_INSURE_NO', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["HEALTH_INSURE_BASE_AMT"], ref: 'HEALTH_INSURE_BASE_AMT', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["EMPLOY_INSURE_YN"], ref: 'EMPLOY_INSURE_YN', type: 'checkbox', width: '100px', style: 'text-align:center',
                typeinfo: {ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["EMPLOY_INSURE_BASE_AMT"], ref: 'EMPLOY_INSURE_BASE_AMT', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["APPLICATION_RATE"], ref: 'APPLICATION_RATE', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false},}},
            {caption: ["LAST_APPLICATION_DATE"], ref: 'LAST_APPLICATION_DATE', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["LONGTERM_CARE_YN"], ref: 'LONGTERM_CARE_YN', type: 'checkbox', width: '100px', style: 'text-align:center',
                typeinfo: {ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
            }
        ];

        gvwHrpMasterGrid = _SBGrid.create(SBGridProperties);
    }

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    //상세정보 보기
    async function fn_view() {

        fn_clearForm();

        let nCol = gvwInfoGrid.getCol();
        let nRow = gvwInfoGrid.getRow();

        //특정 열 부터 이벤트 적용
        if (nCol == -1) {
            return;
        }
        if (nRow == -1) {
            return;
        }

        let rowData = gvwInfoGrid.getRowData(nRow);

        if(_.isEmpty(rowData) == false) {

            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                , V_P_LANG_ID: ''
                , V_P_COMP_CODE: gv_ma_selectedCorpCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                , V_P_SITE_CODE     : gfnma_nvl2(rowData.SITE_CODE)
                , V_P_DEPT_CODE     : gfnma_nvl2(rowData.DEPT_CODE)
                , V_P_EMP_CODE      : gfnma_nvl2(rowData.EMP_CODE)
                , V_P_EMP_STATE     : gfnma_nvl2(rowData.EMP_STATE)
                , V_P_PAY_AREA_TYPE : gfnma_nvl2(rowData.PAY_AREA_TYPE)

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: p_userId
                , V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrp1000List.do", {
                getType: 'json',
                workType: 'DETAIL',
                cv_count: '13',

                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    /*****************인사정보********************/
                    data.cv_2.forEach((item, index) => {
                        SBUxMethod.set("EMP_CODE"               , gfnma_nvl2(item.EMP_CODE));
                        SBUxMethod.set("EMP_FULL_NAME"          , gfnma_nvl2(item.EMP_FULL_NAME));
                        SBUxMethod.set("SITE_CODE"              , gfnma_nvl2(item.SITE_CODE));
                        SBUxMethod.set("DEPT_CODE"              , gfnma_nvl2(item.DEPT_CODE));
                        SBUxMethod.set("DEPT_NAME"              , gfnma_nvl2(item.DEPT_NAME));
                        SBUxMethod.set("EMP_TYPE"               , gfnma_nvl2(item.EMP_TYPE));
                        SBUxMethod.set("POSITION_CODE"          , gfnma_nvl2(item.POSITION_CODE));
                        SBUxMethod.set("ENTER_DATE"             , gfnma_nvl2(item.ENTER_DATE));
                        SBUxMethod.set("RETIRE_DATE"            , gfnma_nvl2(item.RETIRE_DATE));
                        SBUxMethod.set("TEMP_END_DATE"          , gfnma_nvl2(item.TEMP_END_DATE));
                        SBUxMethod.set("BONUS_APPLY_START_DATE" , gfnma_nvl2(item.BONUS_APPLY_START_DATE));
                    });

                    /*****************급여 기본 사항, 사회보험********************/
                    /*jsonHrpMasterList.length = 0;*/
                    data.cv_3.forEach((item, index) => {

                        /*const msg = {
                            PAY_GROUP_CODE: gfnma_nvl2(item.PAY_GROUP_CODE),
                            BANK_ACCOUNT: gfnma_nvl2(item.BANK_ACCOUNT),
                            RET_PENS_BANK_ACC: gfnma_nvl2(item.RET_PENS_BANK_ACC),
                            PENSION_YN: gfnma_nvl2(item.PENSION_YN),
                            PENSION_JOIN_DATE: gfnma_nvl2(item.PENSION_JOIN_DATE),
                            PENSION_CLOSE_DATE: gfnma_nvl2(item.PENSION_CLOSE_DATE),
                            PENSION_NO: gfnma_nvl2(item.PENSION_NO),
                            PENSION_BASE_AMT: gfnma_nvl2(item.PENSION_BASE_AMT),
                            HEALTH_INSURE_YN: gfnma_nvl2(item.HEALTH_INSURE_YN),
                            HEALTH_INSURE_JOIN_DATE: gfnma_nvl2(item.HEALTH_INSURE_JOIN_DATE),
                            HEALTH_INSURE_CLOSE_DATE: gfnma_nvl2(item.HEALTH_INSURE_CLOSE_DATE),
                            HEALTH_INSURE_NO: gfnma_nvl2(item.HEALTH_INSURE_NO),
                            HEALTH_INSURE_BASE_AMT: gfnma_nvl2(item.HEALTH_INSURE_BASE_AMT),
                            EMPLOY_INSURE_YN: gfnma_nvl2(item.EMPLOY_INSURE_YN),
                            EMPLOY_INSURE_BASE_AMT: gfnma_nvl2(item.EMPLOY_INSURE_BASE_AMT),
                            APPLICATION_RATE: gfnma_nvl2(item.APPLICATION_RATE),
                            LAST_APPLICATION_DATE: gfnma_nvl2(item.LAST_APPLICATION_DATE),
                            LONGTERM_CARE_YN: gfnma_nvl2(item.LONGTERM_CARE_YN)
                        }
                        jsonHrpMasterList.push(msg);*/

                        SBUxMethod.set("BANK_ACCOUNT"               , gfnma_nvl2(item.BANK_ACCOUNT));
                        SBUxMethod.set("BANK_CODE"                  , gfnma_nvl2(item.BANK_CODE));
                        SBUxMethod.set("BANK_ACCOUNT_REAL"          , gfnma_nvl2(item.BANK_ACCOUNT_REAL));
                        SBUxMethod.set("BANK_ACCOUNT2"              , gfnma_nvl2(item.BANK_ACCOUNT2));

                        SBUxMethod.set("PAY_YN"                     , gfnma_nvl2(item.PAY_YN));
                        SBUxMethod.set("BONUS_PAY_YN"               , gfnma_nvl2(item.BONUS_PAY_YN));
                        SBUxMethod.set("RETIRE_PAY_YN"              , gfnma_nvl2(item.RETIRE_PAY_YN));
                        SBUxMethod.set("BANK_CODE2"                 , gfnma_nvl2(item.BANK_CODE2));
                        SBUxMethod.set("BANK_ACCOUNT2_REAL"         , gfnma_nvl2(item.BANK_ACCOUNT2_REAL));
                        SBUxMethod.set("BANK2_PAY_ITEM"             , gfnma_nvl2(item.BANK2_PAY_ITEM));
                        SBUxMethod.set("LUNCH_PAY_YN"               , gfnma_nvl2(item.LUNCH_PAY_YN));
                        SBUxMethod.set("OVER_TIME_PAY_YN"           , gfnma_nvl2(item.OVER_TIME_PAY_YN));
                        SBUxMethod.set("OT_TAX_FREE_YN"             , gfnma_nvl2(item.OT_TAX_FREE_YN));
                        SBUxMethod.set("RET_PENS_BANK_CODE"         , gfnma_nvl2(item.RET_PENS_BANK_CODE));
                        SBUxMethod.set("RET_PENS_BANK_ACC_REAL"     , gfnma_nvl2(item.RET_PENS_BANK_ACC_REAL));
                        SBUxMethod.set("MUTUAL_AID_MEMBER_YN"       , gfnma_nvl2(item.MUTUAL_AID_MEMBER_YN));
                        SBUxMethod.set("MONTHLY_DONATION_YN"        , gfnma_nvl2(item.MONTHLY_DONATION_YN));
                        SBUxMethod.set("INCOME_TAX_YN"              , gfnma_nvl2(item.INCOME_TAX_YN));
                        SBUxMethod.set("MAIN_ACC_TYPE"              , gfnma_nvl2(item.MAIN_ACC_TYPE));
                        SBUxMethod.set("SUPPORTEE_QTY"              , gfnma_nvl2(item.SUPPORTEE_QTY));
                        SBUxMethod.set("CHILDREN_QTY"               , gfnma_nvl2(item.CHILDREN_QTY));

                        SBUxMethod.set("PENSION_YN"                 , gfnma_nvl2(item.PENSION_YN));
                        SBUxMethod.set("HEALTH_INSURE_YN"           , gfnma_nvl2(item.HEALTH_INSURE_YN));
                        SBUxMethod.set("LONGTERM_CARE_YN"           , gfnma_nvl2(item.LONGTERM_CARE_YN));
                        SBUxMethod.set("PENSION_JOIN_DATE"          , gfnma_nvl2(item.PENSION_JOIN_DATE));
                        SBUxMethod.set("HEALTH_INSURE_JOIN_DATE"    , gfnma_nvl2(item.HEALTH_INSURE_JOIN_DATE));
                        SBUxMethod.set("PENSION_CLOSE_DATE"         , gfnma_nvl2(item.PENSION_CLOSE_DATE));
                        SBUxMethod.set("HEALTH_INSURE_CLOSE_DATE"   , gfnma_nvl2(item.HEALTH_INSURE_CLOSE_DATE));
                        SBUxMethod.set("LAST_APPLICATION_DATE"      , gfnma_nvl2(item.LAST_APPLICATION_DATE));
                        SBUxMethod.set("PENSION_NO"                 , gfnma_nvl2(item.PENSION_NO));
                        SBUxMethod.set("HEALTH_INSURE_NO"           , gfnma_nvl2(item.HEALTH_INSURE_NO));
                        SBUxMethod.set("PENSION_BASE_AMT"           , gfnma_nvl2(item.PENSION_BASE_AMT));
                        SBUxMethod.set("HEALTH_INSURE_BASE_AMT"     , gfnma_nvl2(item.HEALTH_INSURE_BASE_AMT));
                        SBUxMethod.set("EMPLOY_INSURE_BASE_AMT"     , gfnma_nvl2(item.EMPLOY_INSURE_BASE_AMT));
                        SBUxMethod.set("APPLICATION_RATE"           , gfnma_nvl2(item.APPLICATION_RATE));
                        SBUxMethod.set("EMPLOY_INSURE_YN"           , gfnma_nvl2(item.EMPLOY_INSURE_YN));
                    });

                    /*gvwHrpMasterGrid.rebuild();*/


                    /*****************급여정보********************/
                    /** @type {number} **/
                   // let totalRecordCount2 = 0;
                    jsonPayInfoList.length = 0;
                    data.cv_4.forEach((item, index) => {
                        const msg = {
                            APPLY_START_DATE        : gfnma_nvl2(item.APPLY_START_DATE),
                            APPLY_END_DATE          : gfnma_nvl2(item.APPLY_END_DATE),
                            MEMO                    : gfnma_nvl2(item.MEMO),
                            SALARY_BASE_AMT         : gfnma_nvl2(item.SALARY_BASE_AMT),
                            JOB_BASE_AMT            : gfnma_nvl2(item.JOB_BASE_AMT),
                            OT_FIXED_BASE_AMT       : gfnma_nvl2(item.OT_FIXED_BASE_AMT),
                            ROLE_BASE_AMT           : gfnma_nvl2(item.ROLE_BASE_AMT),
                            INCENTIVE_BASE_AMT      : gfnma_nvl2(item.INCENTIVE_BASE_AMT),
                            COMPETENCE_BASE_AMT     : gfnma_nvl2(item.COMPETENCE_BASE_AMT),
                            MONTHLY_SALARY_AMT      : gfnma_nvl2(item.MONTHLY_SALARY_AMT),
                            PAY_COUNT               : gfnma_nvl2(item.PAY_COUNT),
                            INCENTIVE_ADD_AMT       : gfnma_nvl2(item.INCENTIVE_ADD_AMT),
                            BONUS_COUNT             : gfnma_nvl2(item.BONUS_COUNT),
                            ANNUAL_SALARY_AMT       : gfnma_nvl2(item.ANNUAL_SALARY_AMT),
                            INCENTIVE_MONTH_AMT     : gfnma_nvl2(item.INCENTIVE_MONTH_AMT),
                            HOURLY_BASE_AMT         : gfnma_nvl2(item.HOURLY_BASE_AMT),
                            SUM_BASE_AMT            : gfnma_nvl2(item.SUM_BASE_AMT),
                            ANNUAL_BASE_AMT         : gfnma_nvl2(item.ANNUAL_BASE_AMT),
                            USERID                  : gfnma_nvl2(item.USERID),
                            USERTIME                : gfnma_nvl2(item.USERTIME),
                            DAILY_BASE_AMT          : gfnma_nvl2(item.DAILY_BASE_AMT),
                            BONUS_BASE_AMT          : gfnma_nvl2(item.BONUS_BASE_AMT),
                            CONTRIBUTE_BASE_AMT     : gfnma_nvl2(item.CONTRIBUTE_BASE_AMT),
                            ADJUST_BASE_AMT         : gfnma_nvl2(item.ADJUST_BASE_AMT)
                        }
                        jsonPayInfoList.push(msg);
                        //totalRecordCount2++;
                    });

                    gvwPayInfoGrid.rebuild();
                    //document.querySelector('#listCount2').innerText = totalRecordCount2;

                    /*****************고정 수당항목********************/
                    /** @type {number} **/
                    let totalRecordCount3 = 0;
                    jsonPayList.length = 0;
                    data.cv_5.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE            : gfnma_nvl2(item.PAY_TYPE),
                            PAY_ITEM_CODE       : gfnma_nvl2(item.PAY_ITEM_CODE),
                            PAY_AMT             : gfnma_nvl2(item.PAY_AMT),
                            APPLY_START_DATE    : gfnma_nvl2(item.APPLY_START_DATE),
                            APPLY_END_DATE      : gfnma_nvl2(item.APPLY_END_DATE),
                            USERID              : gfnma_nvl2(item.USERID),
                            USERTIME            : gfnma_nvl2(item.USERTIME),
                            MEMO                : gfnma_nvl2(item.MEMO),
                            TXN_ID              : gfnma_nvl2(item.TXN_ID)
                        }
                        jsonPayList.push(msg);
                        totalRecordCount3++;
                    });

                    gvwPayGrid.rebuild();
                    document.querySelector('#listCount3').innerText = totalRecordCount3;

                    /*****************고정 공제항목********************/
                    /** @type {number} **/
                    let totalRecordCount4 = 0;
                    jsonDedList.length = 0;
                    data.cv_6.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE            : gfnma_nvl2(item.PAY_TYPE),
                            PAY_ITEM_CODE       : gfnma_nvl2(item.PAY_ITEM_CODE),
                            PAY_AMT             : gfnma_nvl2(item.PAY_AMT),
                            APPLY_START_DATE    : gfnma_nvl2(item.APPLY_START_DATE),
                            APPLY_END_DATE      : gfnma_nvl2(item.APPLY_END_DATE),
                            USERID              : gfnma_nvl2(item.USERID),
                            USERTIME            : gfnma_nvl2(item.USERTIME),
                            MEMO                : gfnma_nvl2(item.MEMO),
                            PAY_ITEM_CATEGORY   : gfnma_nvl2(item.PAY_ITEM_CATEGORY),
                            TXN_ID              : gfnma_nvl2(item.TXN_ID)
                        }
                        jsonDedList.push(msg);
                        totalRecordCount4++;
                    });

                    gvwDedGrid.rebuild();
                    document.querySelector('#listCount4').innerText = totalRecordCount4;


                    /*****************변동 수당항목********************/
                    /** @type {number} **/
                    let totalRecordCount5 = 0;
                    jsonVarPayList.length = 0;
                    data.cv_8.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE            : gfnma_nvl2(item.PAY_TYPE),
                            PAY_ITEM_CODE       : gfnma_nvl2(item.PAY_ITEM_CODE),
                            PAY_AMT             : gfnma_nvl2(item.PAY_AMT),
                            APPLY_START_DATE    : gfnma_nvl2(item.APPLY_START_DATE),
                            TAX_PAY_DATE        : gfnma_nvl2(item.TAX_PAY_DATE),
                            APPLY_END_DATE      : gfnma_nvl2(item.APPLY_END_DATE),
                            MEMO                : gfnma_nvl2(item.MEMO),
                            USERID              : gfnma_nvl2(item.USERID),
                            USERTIME            : gfnma_nvl2(item.USERTIME),
                            TXN_ID              : gfnma_nvl2(item.TXN_ID)
                        }
                        jsonVarPayList.push(msg);
                        totalRecordCount5++;
                    });

                    gvwVarPayGrid.rebuild();
                    document.querySelector('#listCount5').innerText = totalRecordCount5;

                    /*****************변동 공제항목********************/
                    /** @type {number} **/
                    let totalRecordCount6 = 0;
                    jsonVarDedList.length = 0;
                    data.cv_9.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE            : gfnma_nvl2(item.PAY_TYPE),
                            PAY_ITEM_CODE       : gfnma_nvl2(item.PAY_ITEM_CODE),
                            PAY_AMT             : gfnma_nvl2(item.PAY_AMT),
                            APPLY_START_DATE    : gfnma_nvl2(item.APPLY_START_DATE),
                            TAX_PAY_DATE        : gfnma_nvl2(item.TAX_PAY_DATE),
                            APPLY_END_DATE      : gfnma_nvl2(item.APPLY_END_DATE),
                            MEMO                : gfnma_nvl2(item.MEMO),
                            USERID              : gfnma_nvl2(item.USERID),
                            USERTIME            : gfnma_nvl2(item.USERTIME),
                            TXN_ID              : gfnma_nvl2(item.TXN_ID)
                        }
                        jsonVarDedList.push(msg);
                        totalRecordCount6++;
                    });

                    gvwVarDedGrid.rebuild();
                    document.querySelector('#listCount6').innerText = totalRecordCount6;

                    /*****************급상여 예외항목********************/listCount7
                    /** @type {number} **/
                    let totalRecordCount7 = 0;
                    jsonPayExList.length = 0;
                    data.cv_10.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE            : gfnma_nvl2(item.PAY_TYPE),
                            PAY_ITEM_CODE       : gfnma_nvl2(item.PAY_ITEM_CODE),
                            PAY_AMT             : gfnma_nvl2(item.PAY_AMT),
                            APPLY_START_DATE    : gfnma_nvl2(item.APPLY_START_DATE),
                            APPLY_END_DATE      : gfnma_nvl2(item.APPLY_END_DATE),
                            PAY_APPLY_TYPE      : gfnma_nvl2(item.PAY_APPLY_TYPE),
                            PAY_APPLY_RATE      : gfnma_nvl2(item.PAY_APPLY_RATE),
                            PAY_APPLY_AMT       : gfnma_nvl2(item.PAY_APPLY_AMT),
                            USERID              : gfnma_nvl2(item.USERID),
                            USERTIME            : gfnma_nvl2(item.USERTIME),
                            MEMO                : gfnma_nvl2(item.MEMO)
                        }
                        jsonPayExList.push(msg);
                        totalRecordCount7++;
                    });

                    gvwPayExGrid.rebuild();
                    document.querySelector('#listCount7').innerText = totalRecordCount7;

                    /*****************사회보험 가입이력********************/listCount8
                    /** @type {number} **/
                    let totalRecordCount8 = 0;
                    jsonDetailList.length = 0;
                    data.cv_11.forEach((item, index) => {
                        const msg = {
                            INSU_TYPE           : gfnma_nvl2(item.INSU_TYPE),
                            START_DATE          : gfnma_nvl2(item.START_DATE),
                            END_DATE            : gfnma_nvl2(item.END_DATE),
                            INSU_REASON_TYPE    : gfnma_nvl2(item.INSU_REASON_TYPE),
                            INSU_STATE_TYPE     : gfnma_nvl2(item.INSU_STATE_TYPE),
                            INSU_REG_TYPE       : gfnma_nvl2(item.INSU_REG_TYPE),
                            INSU_RATE           : gfnma_nvl2(item.INSU_RATE),
                            INSU_AMT_YN         : gfnma_nvl2(item.INSU_AMT_YN),
                            OVER_WORKER_YN      : gfnma_nvl2(item.OVER_WORKER_YN),
                            AGE_65_OVER_YN      : gfnma_nvl2(item.AGE_65_OVER_YN),
                            MEMO                : gfnma_nvl2(item.MEMO),
                            USERID              : gfnma_nvl2(item.USERID),
                            USERTIME            : gfnma_nvl2(item.USERTIME)
                        }
                        jsonDetailList.push(msg);
                        totalRecordCount8++;
                    });

                    gvwDetailGrid.rebuild();
                    document.querySelector('#listCount8').innerText = totalRecordCount8;

                    /*****************보수월액********************/
                    /** @type {number} **/
                    let totalRecordCount9 = 0;
                    jsonViewEx1List.length = 0;
                    data.cv_7.forEach((item, index) => {
                        const msg = {
                            APPLY_TYPE          : gfnma_nvl2(item.APPLY_TYPE),
                            LONG_APPLY_TYPE     : gfnma_nvl2(item.LONG_APPLY_TYPE),
                            APPLY_START_DATE    : gfnma_nvl2(item.APPLY_START_DATE),
                            APPLY_END_DATE      : gfnma_nvl2(item.APPLY_END_DATE),
                            BASE_AMT            : gfnma_nvl2(item.BASE_AMT),
                            VAL1                : gfnma_nvl2(item.VAL1),
                            VAL2                : gfnma_nvl2(item.VAL2),
                            VAL3                : gfnma_nvl2(item.VAL3),
                            LONG_APPLY_EXEM_AMT : gfnma_nvl2(item.LONG_APPLY_EXEM_AMT),
                            MEMO                : gfnma_nvl2(item.MEMO),
                            USERID              : gfnma_nvl2(item.USERID),
                            USERTIME            : gfnma_nvl2(item.USERTIME)
                        }
                        jsonViewEx1List.push(msg);
                        totalRecordCount9++;
                    });

                    gvwViewEx1Grid.rebuild();
                    document.querySelector('#listCount9').innerText = totalRecordCount9;

                    /*****************원천세징수비율********************/
                    /** @type {number} **/
                    //let totalRecordCount10 = 0;
                    jsonWithholdList.length = 0;
                    data.cv_12.forEach((item, index) => {
                        const msg = {
                            APPLY_START_DATE    : gfnma_nvl2(item.APPLY_START_DATE),
                            APPLY_END_DATE      : gfnma_nvl2(item.APPLY_END_DATE),
                            WITHHOLD_RATE       : gfnma_nvl2(item.WITHHOLD_RATE),
                            MEMO                : gfnma_nvl2(item.MEMO),
                            USERID              : gfnma_nvl2(item.USERID),
                            USERTIME            : gfnma_nvl2(item.USERTIME)
                        }
                        jsonWithholdList.push(msg);
                        //totalRecordCount10++;
                    });

                    gvwWithholdGrid.rebuild();
                    //document.querySelector('#listCount10').innerText = totalRecordCount10;

                    //TODO : 이게 왜 있는지 모르겠음
                    fn_setData(gfnma_nvl2(rowData.EMP_CODE));

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

    //급여정보 변경
    async function gridValueChanged() {

        let nCol = gvwPayInfoGrid.getCol();
        let nRow = gvwPayInfoGrid.getRow();

        //특정 열 부터 이벤트 적용
        if (nCol == -1) {
            return;
        }
        if (nRow == -1) {
            return;
        }

        let rowData = gvwPayInfoGrid.getRowData(nRow);

        if (gvwPayInfoGrid.getColRef('SALARY_BASE_AMT') == nCol || gvwPayInfoGrid.getColRef('JOB_BASE_AMT') == nCol || gvwPayInfoGrid.getColRef('OT_FIXED_BASE_AMT') == nCol ||
            gvwPayInfoGrid.getColRef('INCENTIVE_BASE_AMT') == nCol || gvwPayInfoGrid.getColRef('COMPETENCE_BASE_AMT') == nCol ){

            let isalary_base_amt        = gfnma_nvl2(rowData.SALARY_BASE_AMT);          //급여기본급
            let ijob_base_amt           = gfnma_nvl2(rowData.JOB_BASE_AMT);          //역할급
            let iot_fixed_base_amt      = gfnma_nvl2(rowData.OT_FIXED_BASE_AMT);          //고정연장수당
            let iincentive_base_amt     = gfnma_nvl2(rowData.INCENTIVE_BASE_AMT);      //성과급
            let icompetence_base_amt    = gfnma_nvl2(rowData.COMPETENCE_BASE_AMT);    //역량가급
            let iincentive_add_amt      = gfnma_nvl2(rowData.INCENTIVE_ADD_AMT);        //성과가급
            let ipay_count              = gfnma_nvl2(rowData.PAY_COUNT);
            let ibonus_count            = gfnma_nvl2(rowData.BONUS_COUNT);

            gvwPayInfoGrid.setCellData(nRow, gvwPayInfoGrid.getColRef('MONTHLY_SALARY_AMT'), Number(isalary_base_amt) + Number(iincentive_base_amt) + Number(icompetence_base_amt) + Number(ijob_base_amt) + Number(iot_fixed_base_amt));

            if (ipay_count > 1)
            {
                //성과급월액
                gvwPayInfoGrid.setCellData(nRow, gvwPayInfoGrid.getColRef("incentive_month_amt"), ((Number(iincentive_base_amt) * (Number(ipay_count) - Number(ibonus_count))) + (Number(iincentive_add_amt) * Number(ibonus_count))) / Number(ipay_count));
            }

            //연봉
            gvwPayInfoGrid.setCellData(nRow, gvwPayInfoGrid.getColRef("annual_salary_amt"), ((Number(isalary_base_amt) * Number(ipay_count)) + (Number(ijob_base_amt) * Number(ipay_count)) + (Number(iot_fixed_base_amt) * Number(ipay_count)) + (Number(iincentive_base_amt) * (Number(ipay_count) - Number(ibonus_count))) + (Number(icompetence_base_amt) * Number(ipay_count)))
                + (Number(iincentive_add_amt) * Number(ibonus_count)));

        }else if (gvwPayInfoGrid.getColRef('PAY_COUNT') == nCol){

            let isalary_base_amt     = gfnma_nvl2(rowData.SALARY_BASE_AMT);
            let ijob_base_amt        = gfnma_nvl2(rowData.JOB_BASE_AMT);          //역할급
            let iot_fixed_base_amt   = gfnma_nvl2(rowData.OT_FIXED_BASE_AMT);          //고정연장수당
            let iincentive_base_amt  = gfnma_nvl2(rowData.INCENTIVE_BASE_AMT);
            let icompetence_base_amt = gfnma_nvl2(rowData.COMPETENCE_BASE_AMT);
            let ipay_count           = gfnma_nvl2(rowData.PAY_COUNT);
            let ibonus_count         = gfnma_nvl2(rowData.BONUS_COUNT);

            // 연봉이나 지급횟수가 입력될 경우 급여기본급, 상여기본급을 넣어줌
            //gvwPayInfo.SetValue("annual_salary_amt", (iannual_salary_amt + iincentive_base_amt + icompetence_base_amt) * ipay_count);
            gvwPayInfoGrid.setCellData(nRow, gvwPayInfoGrid.getColRef("ANNUAL_SALARY_AMT"), ((Number(isalary_base_amt) * Number(ipay_count)) + (Number(ijob_base_amt) * Number(ipay_count)) + (Number(iot_fixed_base_amt) * Number(ipay_count)) + (Number(iincentive_base_amt) * (Number(ipay_count) - Number(ibonus_count))) + (Number(icompetence_base_amt) * Number(ipay_count))));

        }else if (gvwPayInfoGrid.getColRef('INCENTIVE_ADD_AMT') == nCol || gvwPayInfoGrid.getColRef('BONUS_COUNT') == nCol){

            let iincentive_add_amt      = gfnma_nvl2(rowData.INCENTIVE_ADD_AMT);        //성과가급
            let iincentive_base_amt     = gfnma_nvl2(rowData.INCENTIVE_BASE_AMT);      //성과급       *
            let isalary_base_amt        = gfnma_nvl2(rowData.SALARY_BASE_AMT);          //기본급 iannual_salary_amt ->    isalary_base_amt

            let ijob_base_amt           = gfnma_nvl2(rowData.JOB_BASE_AMT);          //역할급
            let iot_fixed_base_amt      = gfnma_nvl2(rowData.OT_FIXED_BASE_AMT);          //고정연장수당
            let icompetence_base_amt    = gfnma_nvl2(rowData.COMPETENCE_BASE_AMT);    //역량가급

            let ipay_count              = gfnma_nvl2(rowData.PAY_COUNT);
            let ibonus_count            = gfnma_nvl2(rowData.BONUS_COUNT);

            if (ipay_count > 1)
            {
                // 연봉이나 지급횟수가 입력될 경우 급여기본급, 상여기본급을 넣어줌
                //성과급월액
                gvwPayInfoGrid.setCellData(nRow, gvwPayInfoGrid.getColRef("INCENTIVE_MONTH_AMT"), ((Number(iincentive_base_amt) * (Number(ipay_count) - Number(ibonus_count))) + (Number(iincentive_add_amt) * Number(ibonus_count))) / Number(ipay_count));
            }

            //연봉
            gvwPayInfoGrid.setCellData(nRow, gvwPayInfoGrid.getColRef("ANNUAL_SALARY_AMT"), ( (Number(isalary_base_amt) * Number(ipay_count)) + (Number(ijob_base_amt) * Number(ipay_count)) + (Number(iot_fixed_base_amt) * Number(ipay_count)) + (Number(iincentive_base_amt) * (Number(ipay_count)- Number(ibonus_count))) + (Number(icompetence_base_amt) * Number(ipay_count)) )
                + (Number(iincentive_add_amt) * Number(ibonus_count)));

        }




    }

    const fn_setData = async function (EMP_CODE){

        //TODO : 원본로우가 중복되어 에러가 나기 때문에 COMP_CODE를 추가해서 대처해놓음
        //let query = "select * from hrpmaster where emp_code = '" + EMP_CODE + "' " ;
        let query = "select * from hrpmaster where emp_code = '" + EMP_CODE + "' " + " AND comp_code = '" + gv_ma_selectedCorpCd + "'";
        var paramObj = {
            EMP_CODE: query
        }

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp1000ChkEmp.do", paramObj);

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                if (_.isEmpty(gfnma_nvl2(data.EMP_CODE))){

                    SBUxMethod.set("PENSION_YN"         , 'Y');
                    SBUxMethod.set("HEALTH_INSURE_YN"   , 'Y');
                    SBUxMethod.set("EMPLOY_INSURE_YN"   , 'Y');
                    SBUxMethod.set("PAY_YN"             , 'Y');
                    SBUxMethod.set("BONUS_PAY_YN"       , 'N');
                    SBUxMethod.set("OVER_TIME_PAY_YN"   , 'Y');
                    SBUxMethod.set("RETIRE_PAY_YN"      , 'Y');
                    SBUxMethod.set("INCOME_TAX_YN"      , 'Y');
                    SBUxMethod.set("SUPPORTEE_QTY"      , 1);
                    SBUxMethod.set("APPLICATION_RATE"   , 100);
                    let openDate = gfn_dateToYm(new Date());
                    SBUxMethod.set("LAST_APPLICATION_DATE", openDate);


                }

               /* if (rs != null)
                {
                    if (rs.ResultDataSet.Tables[0].Rows.Count == 0)
                    {
                        chkpension_yn.EditValue = "Y";
                        chkhealth_insure_yn.EditValue = "Y";
                        chkemploy_insure_yn.EditValue = "Y";
                        chkpay_yn.EditValue = "Y";
                        chkbonus_pay_yn.EditValue = "N";
                        chkover_time_pay_yn.EditValue = "Y";
                        chkretire_pay_yn.EditValue = "Y";
                        chkincome_tax_yn.EditValue = "Y";
                        // 부양가족수 기본값 1로 설정
                        numsupportee_qty.EditValue = 1;
                        // 원천징수적용비율 100%로 설정
                        numapplication_rate.EditValue = 100;
                        // 비율최종적용일 시스템일자로 설정
                        string strDate = CurrentDate("YYYYMMDD");
                        ymdlast_application_date.Text = strDate;
                    }

                }*/

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

    var tabJsonData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "급여정보",         "targetid" : "payInfoTab" , "targetvalue" : "급여정보"},
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "고정 수당항목",     "targetid" : "payTab" ,     "targetvalue" : "고정 수당항목"},
        { "id" : "2", "pid" : "-1", "order" : "3", "text" : "고정 공제항목",      "targetid" : "dedTab" ,     "targetvalue" : "고정 공제항목"},
        { "id" : "3", "pid" : "-1", "order" : "4", "text" : "변동 수당항목",      "targetid" : "varPayTab" ,  "targetvalue" : "변동 수당항목"},
        { "id" : "4", "pid" : "-1", "order" : "5", "text" : "변동 공제항목",      "targetid" : "varDedTab" ,  "targetvalue" : "변동 공제항목"},
        { "id" : "5", "pid" : "-1", "order" : "6", "text" : "급상여 예외항목",    "targetid" : "payExTab" ,   "targetvalue" : "급상여 예외항목"},
        { "id" : "6", "pid" : "-1", "order" : "7", "text" : "사회보험 가입이력",  "targetid" : "detailTab" ,  "targetvalue" : "사회보험 가입이력"},
        { "id" : "7", "pid" : "-1", "order" : "8", "text" : "보수월액",          "targetid" : "viewEx1Tab" , "targetvalue" : "보수월액"},
        { "id" : "8", "pid" : "-1", "order" : "9", "text" : "원천세징수비율",     "targetid" : "withholdTab" , "targetvalue" : "원천세징수비율"}
    ];

    // 행 추가 (급여정보)
    const fn_payInfoAddRow = function () {
        let rowVal = gvwPayInfoGrid.getRow();

        let today = new Date();

        var year    = today.getFullYear();
        var month   = ('0' + (today.getMonth() + 1)).slice(-2);
        var day     = ('0' + today.getDate()).slice(-2);

        var dateString = year + month + day;

        /*if (rowVal == -1) {*/ //데이터가 없고 행선택이 없을경우.

            const msg = {
                APPLY_START_DATE    : dateString,
                APPLY_END_DATE      : dateString,
                MEMO                : '',
                SALARY_BASE_AMT     : 0,
                JOB_BASE_AMT        : 0,
                OT_FIXED_BASE_AMT   : 0,
                ROLE_BASE_AMT       : 0,
                INCENTIVE_BASE_AMT  : 0,
                COMPETENCE_BASE_AMT : 0,
                MONTHLY_SALARY_AMT  : 0,
                PAY_COUNT           : 0,
                INCENTIVE_ADD_AMT   : 0,
                BONUS_COUNT         : 0,
                ANNUAL_SALARY_AMT   : 0,
                INCENTIVE_MONTH_AMT : 0,
                HOURLY_BASE_AMT     : 0,
                SUM_BASE_AMT        : 0,
                ANNUAL_BASE_AMT     : 0,
                USERID              : '',
                USERTIME            : '',
                DAILY_BASE_AMT      : 0,
                BONUS_BASE_AMT      : 0,
                CONTRIBUTE_BASE_AMT : 0,
                ADJUST_BASE_AMT     : 0,

                status: 'i'
            }
            /*jsonPayInfoList.push(msg);*/
        if (rowVal == -1) {
            gvwPayInfoGrid.addRow(true, msg);
        }else{
            gvwPayInfoGrid.insertRow(rowVal,'below', msg);
        }
                   /*gvwPayInfoGrid.addRow(true);*/
       /* } else {
            gvwPayInfoGrid.insertRow(rowVal);
        }*/
        //grdFimList.refresh();

        /*gvwPayInfoGrid.rebuild();*/
    }

    // 행삭제 (급여정보)
    const fn_payInfoDelRow = async function () {

        let rowVal = gvwPayInfoGrid.getRow();

        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwPayInfoGrid.deleteRow(rowVal);
        }

    }

    // 행 추가 (원천세징수비율)
    const fn_WithholdAddRow = function () {
        let rowVal = gvwWithholdGrid.getRow();

        /*const msg = {
            APPLY_START_DATE  : '',
            APPLY_END_DATE    : '',
            WITHHOLD_RATE     : '',
            MEMO              : '',
            USERID            : '',
            USERTIME          : '',

            status: 'i'
        }*/

        if (rowVal == -1) { //데이터가 없고 행선택이 없을경우.

            gvwWithholdGrid.addRow(true);
        } else {
            gvwWithholdGrid.insertRow(rowVal);
        }
        //grdFimList.refresh();
    }

    // 행삭제 (원천세징수비율)
    const fn_WithholdDelRow = async function () {

        let rowVal = gvwWithholdGrid.getRow();

        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwWithholdGrid.deleteRow(rowVal);
        }

    }

    /**
     * 목록 조회
     */
    const fn_search = async function (/*tabMoveVal*/) {

        // form clear
        fn_clearForm();
        gvwInfoGrid.clearStatus();

        /* let comp_code = gfnma_nvl2(SBUxMethod.get("srch-comp_code"));  공통처리 */
        let SITE_CODE       = gfnma_nvl2(SBUxMethod.get("SRCH_SITE_CODE"));
        let EMP_STATE       = gfnma_nvl2(SBUxMethod.get("SRCH_EMP_STATE"));
        let DEPT_CODE       = gfnma_nvl2(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE        = gfnma_nvl2(SBUxMethod.get("SRCH_EMP_CODE"));
        let PAY_AREA_TYPE   = gfnma_nvl2(SBUxMethod.get("SRCH_PAY_AREA_TYPE"));


        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_SITE_CODE      : SITE_CODE
            ,V_P_DEPT_CODE      : DEPT_CODE
            ,V_P_EMP_CODE       : EMP_CODE
            ,V_P_EMP_STATE      : EMP_STATE
            ,V_P_PAY_AREA_TYPE  : PAY_AREA_TYPE

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrp1000List.do", {
            getType: 'json',
            workType: 'MASTER',
            cv_count: '13',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonGvwInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CREATE                  : gfnma_nvl2(item.CREATE),
                        EMP_CODE                : gfnma_nvl2(item.EMP_CODE),
                        EMP_NAME                : gfnma_nvl2(item.EMP_NAME),
                        PAY_GROUP_CODE          : gfnma_nvl2(item.PAY_GROUP_CODE),
                        PAY_AREA_TYPE           : gfnma_nvl2(item.PAY_AREA_TYPE),
                        DUTY_CODE               : gfnma_nvl2(item.DUTY_CODE),
                        POSITION_CODE           : gfnma_nvl2(item.POSITION_CODE),
                        DEPT_NAME               : gfnma_nvl2(item.DEPT_NAME),
                        ENTER_DATE              : gfnma_nvl2(item.ENTER_DATE),
                        RETIRE_DATE             : gfnma_nvl2(item.RETIRE_DATE),
                        BANK_CODE               : gfnma_nvl2(item.BANK_CODE),
                        BANK_ACCOUNT_REAL       : gfnma_nvl2(item.BANK_ACCOUNT_REAL),
                        BANK_CODE2              : gfnma_nvl2(item.BANK_CODE2),
                        BANK_ACCOUNT2_REAL      : gfnma_nvl2(item.BANK_ACCOUNT2_REAL),
                        EMP_STATE               : gfnma_nvl2(item.EMP_STATE),
                        BANK_ACCOUNT            : gfnma_nvl2(item.BANK_ACCOUNT),
                        BANK_ACCOUNT2           : gfnma_nvl2(item.BANK_ACCOUNT2),
                        RET_PENS_BANK_CODE      : gfnma_nvl2(item.RET_PENS_BANK_CODE),
                        RET_PENS_BANK_ACC       : gfnma_nvl2(item.RET_PENS_BANK_ACC),
                        RET_PENS_BANK_ACC_REAL  : gfnma_nvl2(item.RET_PENS_BANK_ACC_REAL)

                    }
                    jsonGvwInfoList.push(msg);
                    totalRecordCount++;
                });

                gvwInfoGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                //수정했던 탭 페이지로 이동
                /*if (tabMoveVal != null && tabMoveVal != ''){

                    SBUxMethod.set('idx1', 'SBUx_IDE_JSON');
                }*/

                if(jsonGvwInfoList.length > 0) {
                    gvwInfoGrid.clickRow(1);
                }

                //fn_view('search');


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

    const fn_clearForm = function () {

        SBUxMethod.set("EMP_CODE"               , "");
        SBUxMethod.set("SITE_CODE"              , "");
        SBUxMethod.set("SALARY_CLASS"           , "");
        SBUxMethod.set("DEPT_CODE"              , "");
        SBUxMethod.set("EMP_TYPE"               , "");
        SBUxMethod.set("POSITION_CODE"          , "");
        SBUxMethod.set("ENTER_DATE"             , "");
        SBUxMethod.set("RETIRE_DATE"            , "");
        SBUxMethod.set("TEMP_END_DATE"          , "");
        SBUxMethod.set("BONUS_APPLY_START_DATE" , "");

        SBUxMethod.set("BANK_ACCOUNT"           , "");
        SBUxMethod.set("BANK_CODE"              , "");
        SBUxMethod.set("BANK_ACCOUNT_REAL"      , 0);

        SBUxMethod.set("PAY_YN"                 , "");
        SBUxMethod.set("BONUS_PAY_YN"           , "");
        SBUxMethod.set("RETIRE_PAY_YN"          , "");
        SBUxMethod.set("BANK_CODE2"             , "");
        SBUxMethod.set("BANK_ACCOUNT2_REAL"     , 0);
        SBUxMethod.set("BANK2_PAY_ITEM"         , "");
        SBUxMethod.set("LUNCH_PAY_YN"           , "");
        SBUxMethod.set("OVER_TIME_PAY_YN"       , "");
        SBUxMethod.set("OT_TAX_FREE_YN"         , "");
        SBUxMethod.set("RET_PENS_BANK_CODE"     , "");
        SBUxMethod.set("RET_PENS_BANK_ACC_REAL" , "");
        SBUxMethod.set("MUTUAL_AID_MEMBER_YN"   , "");
        SBUxMethod.set("MONTHLY_DONATION_YN"    , "");
        SBUxMethod.set("INCOME_TAX_YN"          , "");
        SBUxMethod.set("MAIN_ACC_TYPE"          , "");
        SBUxMethod.set("SUPPORTEE_QTY"          , 0);
        SBUxMethod.set("CHILDREN_QTY"           , 0);

        /*gvwPayInfoGrid.clearStatus();
        gvwPayGrid.clearStatus();
        gvwDedGrid.clearStatus();
        gvwVarPayGrid.clearStatus();
        gvwVarDedGrid.clearStatus();
        gvwPayExGrid.clearStatus();
        gvwDetailGrid.clearStatus();
        gvwViewEx1Grid.clearStatus();
        gvwWithholdGrid.clearStatus();*/
        /*gvwHrpMasterGrid.clearStatus();*/

    }

    //저장
    const fn_save = async function (strWorkType) {

        /*let tabId = SBUxMethod.get('tabJson');*/ //현재탭 아이디
        let EMP_CODE                = gfnma_nvl2(SBUxMethod.get("EMP_CODE"));
        let SITE_CODE               = gfnma_nvl2(SBUxMethod.get("SITE_CODE"));
        let SALARY_CLASS            = gfnma_nvl2(SBUxMethod.get("SALARY_CLASS"));
        let DEPT_CODE               = gfnma_nvl2(SBUxMethod.get("DEPT_CODE"));
        let EMP_TYPE                = gfnma_nvl2(SBUxMethod.get("EMP_TYPE"));
        let POSITION_CODE           = gfnma_nvl2(SBUxMethod.get("POSITION_CODE"));
        let ENTER_DATE              = gfnma_nvl2(SBUxMethod.get("ENTER_DATE"));
        let RETIRE_DATE             = gfnma_nvl2(SBUxMethod.get("RETIRE_DATE"));
        let TEMP_END_DATE           = gfnma_nvl2(SBUxMethod.get("TEMP_END_DATE"));
        let BONUS_APPLY_START_DATE  = gfnma_nvl2(SBUxMethod.get("BONUS_APPLY_START_DATE"));

        let PAY_GROUP_CODE          = gfnma_nvl2(SBUxMethod.get("PAY_GROUP_CODE"));
        let BANK_CODE               = gfnma_nvl2(SBUxMethod.get("BANK_CODE"));
        let BANK_ACCOUNT_REAL       = gfnma_nvl2(SBUxMethod.get("BANK_ACCOUNT_REAL"));
        //BANK_ACCOUNT_REAL           = BANK_ACCOUNT_REAL.replace(/,/gi,'');

        let PAY_YN                  = gfnma_nvl2(SBUxMethod.get("PAY_YN").PAY_YN);
        let BONUS_PAY_YN            = gfnma_nvl2(SBUxMethod.get("BONUS_PAY_YN").BONUS_PAY_YN);
        let RETIRE_PAY_YN           = gfnma_nvl2(SBUxMethod.get("RETIRE_PAY_YN").RETIRE_PAY_YN);
        let BANK_CODE2              = gfnma_nvl2(SBUxMethod.get("BANK_CODE2"));
        let BANK_ACCOUNT2_REAL      = gfnma_nvl2(SBUxMethod.get("BANK_ACCOUNT2_REAL"));
        //BANK_ACCOUNT2_REAL          = BANK_ACCOUNT2_REAL.replace(/,/gi,'');

        let BANK2_PAY_ITEM          = gfnma_nvl2(SBUxMethod.get("BANK2_PAY_ITEM"));
        let LUNCH_PAY_YN            = gfnma_nvl2(SBUxMethod.get("LUNCH_PAY_YN").LUNCH_PAY_YN);
        let OVER_TIME_PAY_YN        = gfnma_nvl2(SBUxMethod.get("OVER_TIME_PAY_YN").OVER_TIME_PAY_YN);
        let OT_TAX_FREE_YN          = gfnma_nvl2(SBUxMethod.get("OT_TAX_FREE_YN").OT_TAX_FREE_YN);
        let RET_PENS_BANK_CODE      = gfnma_nvl2(SBUxMethod.get("RET_PENS_BANK_CODE"));
        let RET_PENS_BANK_ACC_REAL  = gfnma_nvl2(SBUxMethod.get("RET_PENS_BANK_ACC_REAL"));
        //RET_PENS_BANK_ACC_REAL      = RET_PENS_BANK_ACC_REAL.replace(/,/gi,'');

        let MUTUAL_AID_MEMBER_YN    = gfnma_nvl2(SBUxMethod.get("MUTUAL_AID_MEMBER_YN").MUTUAL_AID_MEMBER_YN);
        let MONTHLY_DONATION_YN     = gfnma_nvl2(SBUxMethod.get("MONTHLY_DONATION_YN").MONTHLY_DONATION_YN);
        let INCOME_TAX_YN           = gfnma_nvl2(SBUxMethod.get("INCOME_TAX_YN").INCOME_TAX_YN);
        let MAIN_ACC_TYPE           = gfnma_nvl2(SBUxMethod.get("MAIN_ACC_TYPE"));
        let SUPPORTEE_QTY           = gfnma_nvl2(SBUxMethod.get("SUPPORTEE_QTY"));
        let CHILDREN_QTY            = gfnma_nvl2(SBUxMethod.get("CHILDREN_QTY"));


        let PENSION_YN                  = gfnma_nvl2(SBUxMethod.get("PENSION_YN").PENSION_YN);
        let HEALTH_INSURE_YN            = gfnma_nvl2(SBUxMethod.get("HEALTH_INSURE_YN").HEALTH_INSURE_YN);
        let LONGTERM_CARE_YN            = gfnma_nvl2(SBUxMethod.get("LONGTERM_CARE_YN").LONGTERM_CARE_YN);
        let PENSION_JOIN_DATE           = gfnma_nvl2(SBUxMethod.get("PENSION_JOIN_DATE"));
        let HEALTH_INSURE_JOIN_DATE     = gfnma_nvl2(SBUxMethod.get("HEALTH_INSURE_JOIN_DATE"));
        let PENSION_CLOSE_DATE          = gfnma_nvl2(SBUxMethod.get("PENSION_CLOSE_DATE"));
        let HEALTH_INSURE_CLOSE_DATE    = gfnma_nvl2(SBUxMethod.get("HEALTH_INSURE_CLOSE_DATE"));
        let LAST_APPLICATION_DATE       = gfnma_nvl2(SBUxMethod.get("LAST_APPLICATION_DATE"));
        let PENSION_NO                  = gfnma_nvl2(SBUxMethod.get("PENSION_NO"));
        let HEALTH_INSURE_NO            = gfnma_nvl2(SBUxMethod.get("HEALTH_INSURE_NO"));
        let PENSION_BASE_AMT            = gfnma_nvl2(SBUxMethod.get("PENSION_BASE_AMT"));
        let HEALTH_INSURE_BASE_AMT      = gfnma_nvl2(SBUxMethod.get("HEALTH_INSURE_BASE_AMT"));
        let EMPLOY_INSURE_BASE_AMT      = gfnma_nvl2(SBUxMethod.get("EMPLOY_INSURE_BASE_AMT"));
        let APPLICATION_RATE            = gfnma_nvl2(SBUxMethod.get("APPLICATION_RATE"));
        let EMPLOY_INSURE_YN            = gfnma_nvl2(SBUxMethod.get("EMPLOY_INSURE_YN").EMPLOY_INSURE_YN);

        let BANK_ACCOUNT                = gfnma_nvl2(SBUxMethod.get("BANK_ACCOUNT"));
        let BANK_ACCOUNT2               = gfnma_nvl2(SBUxMethod.get("BANK_ACCOUNT2"));
        let RET_PENS_BANK_ACC           = gfnma_nvl2(SBUxMethod.get("RET_PENS_BANK_ACC"));

        /* let payData = gvwPayGrid.getGridDataAll(); //고정 수당항목
         let dedData = gvwDedGrid.getGridDataAll(); //고정 공제항목
         let varPayData = gvwVarPayGrid.getGridDataAll();  //변동 수당항목
         let varDedData = gvwVarDedGrid.getGridDataAll(); //변동 공제항목
 */
        let payData     = gvwPayGrid.getGridDataAll(true, 'all'); //고정 수당항목
        let dedData     = gvwDedGrid.getGridDataAll(true, 'all'); //고정 공제항목
        let varPayData  = gvwVarPayGrid.getGridDataAll(true, 'all');  //변동 수당항목
        let varDedData  = gvwVarDedGrid.getGridDataAll(true, 'all'); //변동 공제항목

        /************고정,고정 수당/공제 항목 프로시저 변수************/
        let strtype             = "";
        let strtxn_id           = "";
        let strpay_type         = ""; // 지급구분
        let strpay_item_code    = ""; // 급여항목
        let strapply_start_date = ""; // 적용시작일
        let strapply_end_date   = ""; // 적용종료일
        let strpay_amt          = ""; // 금액
        let strmemo             = "";    //메모


        /************변동 수당/공제 항목************/
        let strtype1             = "";
        let strtxn_id1           = "";
        let strpay_type1         = ""; // 지급구분
        let strpay_item_code1    = ""; // 급여항목
        let strapply_start_date1 = ""; // 적용시작일
        let strapply_end_date1   = ""; // 적용종료일
        let strpay_amt1          = ""; // 금액
        let strmemo1             = "";    //메모
        let strtax_pay_date1     = "";
        let rowcnt               = 0;

        if (_.isEmpty(payData) == false)
        {
            // 고정 수당항목 중복체크
            payData.forEach((item1, index1) => {
                payData.forEach((item2, index2) => {
                    if (item1.data.PAY_TYPE         == item2.data.PAY_TYPE &&
                        item1.data.PAY_ITEM_CODE    == item2.data.PAY_ITEM_CODE &&
                        item1.data.APPLY_START_DATE == item2.data.APPLY_START_DATE &&
                        item1.data.APPLY_END_DATE   == item2.data.APPLY_END_DATE)
                    {
                        gfn_comAlert("Q0000", "중복된 수당항목이 존재합니다."); //수정(HRP1000_002)
                        return false;
                    }
                });
            });
        }

        // 고정 공제항목 중복체크
        if (_.isEmpty(dedData) == false)
        {
            dedData.forEach((item1, index1) => {
                dedData.forEach((item2, index2) => {
                    if (item1.PAY_TYPE           == item2.PAY_TYPE &&
                        item1.PAY_ITEM_CODE      == item2.PAY_ITEM_CODE     &&
                        item1.APPLY_START_DATE   == item2.APPLY_START_DATE  &&
                        item1.APPLY_END_DATE     == item2.APPLY_END_DATE    )
                    {
                        gfn_comAlert("Q0000", "중복된 공제항목이 존재합니다."); //수정 (HRP1000_003)
                        return false;
                    }
                });
            });
        }

        rowcnt = 0;

        payData.forEach((item, index) => {
            //gvwList.GetDataRow(i).RowState.ToString()  = "Added"?"N":"U"

            if (item.status == 'i' ||  item.status == 'u' ||  item.status == 'd')
            {
                if(rowcnt == 0)
                {
                    strtype             = "PAY";
                    strtxn_id           = gfnma_nvl2(item.data.TXN_ID); // 순번
                    strpay_type         = gfnma_nvl2(item.data.PAY_TYPE); // 지급구분
                    strpay_item_code    = gfnma_nvl2(item.data.PAY_ITEM_CODE); // 급여항목
                    strapply_start_date = gfnma_nvl2(item.data.APPLY_START_DATE); // 적용시작일
                    strapply_end_date   = gfnma_nvl2(item.data.APPLY_END_DATE); // 적용종료일
                    strpay_amt          = gfnma_nvl2(item.data.PAY_AMT); // 금액
                    strmemo             = gfnma_nvl2(item.data.MEMO); // 메모
                }
                else
                {
                    strtype             += "|" + "PAY";
                    strtxn_id            = "|" + gfnma_nvl2(item.data.TXN_ID); // 순번
                    strpay_type         += "|" + gfnma_nvl2(item.data.PAY_TYPE); // 지급구분
                    strpay_item_code    += "|" + gfnma_nvl2(item.data.PAY_ITEM_CODE); // 급여항목
                    strapply_start_date += "|" + gfnma_nvl2(item.data.APPLY_START_DATE); // 적용시작일
                    strapply_end_date   += "|" + gfnma_nvl2(item.data.APPLY_END_DATE); // 적용종료일
                    strpay_amt          += "|" + gfnma_nvl2(item.data.PAY_AMT); // 금액
                    strmemo             += "|" + gfnma_nvl2(item.data.MEMO); // 금액
                }

                rowcnt++;
            }
        });

        let strtpay_item_category = '';/*string.Empty;*/

        rowcnt = 0;

        dedData.forEach((item, index) => {
            if (item.status == 'i' ||  item.status == 'u' ||  item.status == 'd')
            {
                if (rowcnt == 0)
                {
                    if (strtype != "")
                    {
                        strtype             += "|";
                        strtxn_id           += "|";
                        strpay_type         += "|";
                        strpay_item_code    += "|";
                        strapply_start_date += "|";
                        strapply_end_date   += "|";
                        strpay_amt          += "|";
                        strmemo             += "|";
                    }


                    strtype             += gfnma_nvl2(item.data.PAY_ITEM_CATEGORY);

                    strtxn_id           += gfnma_nvl2(item.data.TXN_ID); // 순번
                    strpay_type         += gfnma_nvl2(item.data.PAY_TYPE); // 지급구분
                    strpay_item_code    += gfnma_nvl2(item.data.PAY_ITEM_CODE); // 급여항목
                    strapply_start_date += gfnma_nvl2(item.data.APPLY_START_DATE); // 적용시작일
                    strapply_end_date   += gfnma_nvl2(item.data.APPLY_END_DATE); // 적용종료일
                    strpay_amt          += gfnma_nvl2(item.data.PAY_AMT); // 금액
                    strmemo             += gfnma_nvl2(item.data.MEMO); // 메모
                }
                else
                {
                    strtype             += "|" + gfnma_nvl2(item.data.PAY_ITEM_CATEGORY);

                    strtxn_id           += "|" + gfnma_nvl2(item.data.TXN_ID); // 지급구분
                    strpay_type         += "|" + gfnma_nvl2(item.data.PAY_TYPE); // 지급구분
                    strpay_item_code    += "|" + gfnma_nvl2(item.data.PAY_ITEM_CODE); // 급여항목
                    strapply_start_date += "|" + gfnma_nvl2(item.data.APPLY_START_DATE); // 적용시작일
                    strapply_end_date   += "|" + gfnma_nvl2(item.data.APPLY_END_DATE); // 적용종료일
                    strpay_amt          += "|" + gfnma_nvl2(item.data.PAY_AMT); // 금액
                    strmemo             += "|" + gfnma_nvl2(item.data.MEMO); // 메모
                }
                rowcnt++;
            }
        });

        rowcnt = 0;

        varPayData.forEach((item, index) => {
            if (item.status == 'i' ||  item.status == 'u' ||  item.status == 'd')
            {
                if (rowcnt == 0)
                {
                    strtype1             = "PAY";
                    strtxn_id1           = gfnma_nvl2(item.TXN_ID)               // txn_id
                    strpay_type1         = gfnma_nvl2(item.PAY_TYPE)             // 지급구분
                    strpay_item_code1    = gfnma_nvl2(item.PAY_ITEM_CODE)        // 급여항목
                    strapply_start_date1 = gfnma_nvl2(item.APPLY_START_DATE)     // 적용시작일
                    strpay_amt1          = gfnma_nvl2(item.PAY_AMT)              // 금액
                    strmemo1             = gfnma_nvl2(item.MEMO)                 // 메모
                    strtax_pay_date1     = gfnma_nvl2(item.TAX_PAY_DATE)         // 지급일(세무)
                }
                else
                {
                    strtype1             += "|" + "PAY";
                    strtxn_id1           += "|" + gfnma_nvl2(item.TXN_ID)                // txn_id
                    strpay_type1         += "|" + gfnma_nvl2(item.PAY_TYPE)              // 지급구분
                    strpay_item_code1    += "|" + gfnma_nvl2(item.PAY_ITEM_CODE)         // 급여항목
                    strapply_start_date1 += "|" + gfnma_nvl2(item.APPLY_START_DATE)      // 적용시작일
                    strpay_amt1          += "|" + gfnma_nvl2(item.PAY_AMT)               // 금액
                    strmemo1             += "|" + gfnma_nvl2(item.MEMO)                  // 메모
                    strtax_pay_date1     += "|" + gfnma_nvl2(item.TAX_PAY_DATE)          // 지급일(세무)
                }

                rowcnt++;
            }
        });


        rowcnt = 0;

        varDedData.forEach((item, index) => {
            if (item.status == 'i' ||  item.status == 'u' ||  item.status == 'd')
            {
                if (rowcnt == 0)
                {
                    if (strtype1 != "")
                    {
                        strtype1             += "|";
                        strtxn_id1           += "|";
                        strpay_type1         += "|";
                        strpay_item_code1    += "|";
                        strapply_start_date1 += "|";
                        strapply_end_date1   += "|";
                        strpay_amt1          += "|";
                        strmemo1             += "|";
                        strtax_pay_date1     += "|";
                    }

                    strtype1             += "DED";
                    strtxn_id1           += gfnma_nvl2(item.TXN_ID)                  // txn_id
                    strpay_type1         += gfnma_nvl2(item.PAY_TYPE)                // 지급구분
                    strpay_item_code1    += gfnma_nvl2(item.PAY_ITEM_CODE)           // 급여항목
                    strapply_start_date1 += gfnma_nvl2(item.APPLY_START_DATE)        // 적용시작일
                    strpay_amt1          += gfnma_nvl2(item.PAY_AMT)                 // 금액
                    strmemo1             += gfnma_nvl2(item.MEMO)                    // 메모
                    strtax_pay_date1     += gfnma_nvl2(item.TAX_PAY_DATE)            // 지급일(세무)
                }
                else
                {
                    strtype1             += "|" + "DED";
                    strtxn_id1           += "|" + gfnma_nvl2(item.TXN_ID)               // txn_id
                    strpay_type1         += "|" + gfnma_nvl2(item.PAY_TYPE)             // 지급구분
                    strpay_item_code1    += "|" + gfnma_nvl2(item.PAY_ITEM_CODE)        // 급여항목
                    strapply_start_date1 += "|" + gfnma_nvl2(item.APPLY_START_DATE)     // 적용시작일
                    strpay_amt1          += "|" + gfnma_nvl2(item.PAY_AMT)              // 금액
                    strmemo1             += "|" + gfnma_nvl2(item.MEMO)                 // 메모
                    strtax_pay_date1     += "|" + gfnma_nvl2(item.TAX_PAY_DATE)         // 지급일(세무)
                }
                rowcnt++;
            }
        });

        let strBank_account     = BANK_ACCOUNT_REAL;
        let strBank_account2    = BANK_ACCOUNT2_REAL;
        let strBank_account3    = RET_PENS_BANK_ACC_REAL;

        let paramObj = {
            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd

            , V_P_EMP_CODE                  : EMP_CODE
            , V_P_SALARY_CLASS              : SALARY_CLASS
            , V_P_TEMP_END_DATE             : TEMP_END_DATE
            , V_P_BONUS_APPLY_START_DATE    : BONUS_APPLY_START_DATE
            , V_P_PAY_GROUP_CODE            : PAY_GROUP_CODE
            , V_P_PAY_YN                    : PAY_YN == '' ? 'N' : PAY_YN
            , V_P_BONUS_PAY_YN              : BONUS_PAY_YN == '' ? 'N' : BONUS_PAY_YN
            , V_P_RETIRE_PAY_YN             : RETIRE_PAY_YN == '' ? 'N' : RETIRE_PAY_YN
            , V_P_SUPPORTEE_QTY             : SUPPORTEE_QTY
            , V_P_CHILDREN_QTY              : CHILDREN_QTY == '' ? 0 : CHILDREN_QTY
            , V_P_LUNCH_PAY_YN              : LUNCH_PAY_YN == '' ? 'N' : LUNCH_PAY_YN
            , V_P_MUTUAL_AID_MEMBER_YN      : MUTUAL_AID_MEMBER_YN == '' ? 'N' : MUTUAL_AID_MEMBER_YN
            , V_P_MONTHLY_DONATION_YN       : MONTHLY_DONATION_YN == '' ? 'N' : MONTHLY_DONATION_YN
            , V_P_OVER_TIME_PAY_YN          : OVER_TIME_PAY_YN == '' ? 'N' : OVER_TIME_PAY_YN
            , V_P_INCOME_TAX_YN             : INCOME_TAX_YN == '' ? 'N' : INCOME_TAX_YN
            , V_P_OT_TAX_FREE_YN            : OT_TAX_FREE_YN == '' ? 'N' : OT_TAX_FREE_YN
            , V_P_PENSION_YN                : PENSION_YN == '' ? 'N' : PENSION_YN
            , V_P_PENSION_JOIN_DATE         : PENSION_JOIN_DATE
            , V_P_PENSION_CLOSE_DATE        : PENSION_CLOSE_DATE
            , V_P_PENSION_NO                : PENSION_NO
            , V_P_PENSION_BASE_AMT          : PENSION_BASE_AMT == '' ? 0 :  PENSION_BASE_AMT
            , V_P_HEALTH_INSURE_YN          : HEALTH_INSURE_YN == '' ? 'N' : HEALTH_INSURE_YN
            , V_P_HEALTH_INSURE_JOIN_DATE   : HEALTH_INSURE_JOIN_DATE
            , V_P_HEALTH_INSURE_CLOSE_DATE  : HEALTH_INSURE_CLOSE_DATE
            , V_P_HEALTH_INSURE_NO          : HEALTH_INSURE_NO
            , V_P_HEALTH_INSURE_BASE_AMT    : HEALTH_INSURE_BASE_AMT == '' ? 0 :  HEALTH_INSURE_BASE_AMT
            , V_P_EMPLOY_INSURE_YN          : EMPLOY_INSURE_YN == '' ? 'N' : EMPLOY_INSURE_YN
            , V_P_EMPLOY_INSURE_BASE_AMT    : EMPLOY_INSURE_BASE_AMT  == '' ? 0 :  EMPLOY_INSURE_BASE_AMT
            , V_P_MAIN_ACC_TYPE             : MAIN_ACC_TYPE
            , V_P_BANK_CODE                 : BANK_CODE
            , V_P_BANK_ACCOUNT              : strBank_account
            , V_P_BANK_ACCOUNT_ORIG         : BANK_ACCOUNT
            , V_P_BANK_CODE2                : BANK_CODE2
            , V_P_BANK_ACCOUNT2             : strBank_account2
            , V_P_BANK_ACCOUNT2_ORIG        : BANK_ACCOUNT2
            , V_P_IRP_BANK_CODE             : RET_PENS_BANK_CODE
            , V_P_IRP_BANK_ACCOUNT          : strBank_account3
            , V_P_IRP_BANK_ACCOUNT_ORIG     : RET_PENS_BANK_ACC
            , V_P_APPLICATION_RATE          : APPLICATION_RATE
            , V_P_LAST_APPLICATION_DATE     : LAST_APPLICATION_DATE
            , V_P_LONGTERM_CARE_YN          : LONGTERM_CARE_YN == '' ? 'N' : LONGTERM_CARE_YN
            , V_P_BANK2_PAY_ITEM            : BANK2_PAY_ITEM
            //-- 고정 수당/공제 항목
            , V_P_TYPE                      : strtype
            , V_P_TXN_ID                    : strtxn_id
            , V_P_PAY_TYPE                  : strpay_type
            , V_P_PAY_ITEM_CODE             : strpay_item_code
            , V_P_APPLY_START_DATE          : strapply_start_date
            , V_P_APPLY_END_DATE            : strapply_end_date
            , V_P_PAY_AMT                   : strpay_amt
            , V_P_PAY_MEMO                  : strmemo
            //-- 변동 수당/공제 항목
            , V_P_TYPE1                     : strtype1
            , V_P_TXN_ID1                   : strtxn_id1
            , V_P_PAY_TYPE1                 : strpay_type1
            , V_P_PAY_ITEM_CODE1            : strpay_item_code1
            , V_P_APPLY_START_DATE1         : strapply_start_date1
            , V_P_PAY_AMT1                  : strpay_amt1
            , V_P_PAY_MEMO1                 : strmemo1
            , V_P_TAX_PAY_DATE1             : strtax_pay_date1

            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        }

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp1000.do", {
            getType: 'json',
            workType: strWorkType,
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

    //저장
    const fn_saveS1 = async function (updatedData) {

        let listData = [];
        listData =  await getParamFormS1(updatedData);

        if (_.isEmpty(listData) == false) {
            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp1000S1.do", {listData: listData});

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
    }

    //저장
    const fn_saveS2 = async function (updatedData) {

        let listData = [];
        listData =  await getParamFormS2(updatedData);

        if (_.isEmpty(listData) == false) {

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp1000S2.do", {listData: listData});

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

    }

    //사회보험 가입이력 저장
    const fn_saveS3 = async function (updatedData) {

        let listData = [];
        listData =  await getParamFormS3(updatedData);

        if (_.isEmpty(listData) ==  false){

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp1000S3.do", {listData: listData});

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
    }

    //월보수액 저장
    const fn_saveS4 = async function (updatedData) {

        let listData = [];
        listData =  await getParamFormS4(updatedData);

        if (_.isEmpty(listData) ==  false){

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp1000S4.do", {listData: listData});

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
    }


    const getParamFormS1 = async function (updatedData) {

        /*let updatedData;*/
        let allDate = gvwPayInfoGrid.getGridDataAll();
        let returnData = [];

        let EMP_CODE = gfnma_nvl2(SBUxMethod.get("EMP_CODE"));

        /**************** 중복체크  Start *******************/

        // 고정 수당항목 중복체크
        allDate.forEach((item1, index1) => {

            //종료일이 시작일보다 작을경우
            if (item1.APPLY_START_DATE > item1.APPLY_END_DATE) {
                gfn_comAlert("Q0000", "종료일자보다 큰 시작일자 지정은 불가능합니다."); //수정
                return;
            }

            allDate.forEach((item2, index2) => {

                //시작일 종료일이 같은 데이터가 있을경우
                if (index1 != index2 && item1.APPLY_START_DATE == item2.APPLY_START_DATE && item1.APPLY_END_DATE == item2.APPLY_END_DATE) {
                    gfn_comAlert("Q0000", "동일한 기간(일자)정보가 존재합니다."); //수정
                    return;
                }

            });
        });
        /**************** 중복체크 End *******************/

       /* //수정시 수정된 데이터만 가져감
        updatedData = gvwPayInfoGrid.getUpdateData(true, 'all');*/

        if (!_.isEmpty(updatedData)) {

            updatedData.forEach((item, index) => {

                const param = {

                    cv_count: '0',
                    getType: 'json',
                    workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                    params: gfnma_objectToString({
                        V_P_DEBUG_MODE_YN   : ''
                        , V_P_LANG_ID       : ''
                        , V_P_COMP_CODE     : gv_ma_selectedCorpCd
                        , V_P_CLIENT_CODE   : gv_ma_selectedClntCd

                        , V_P_EMP_CODE              : EMP_CODE
                        , V_P_APPLY_START_DATE      : gfnma_nvl2(item.data.APPLY_START_DATE)
                        , V_P_APPLY_END_DATE        : gfnma_nvl2(item.data.APPLY_END_DATE)
                        , V_P_ANNUAL_SALARY_AMT     : gfnma_nvl2(item.data.ANNUAL_SALARY_AMT) == '' ? 0 : item.data.ANNUAL_SALARY_AMT // 연봉입력가능
                        , V_P_PAY_COUNT             : gfnma_nvl2(item.data.PAY_COUNT) == '' ? 0 : item.data.PAY_COUNT
                        , V_P_SALARY_BASE_AMT       : gfnma_nvl2(item.data.SALARY_BASE_AMT) == '' ? 0 : item.data.SALARY_BASE_AMT
                        , V_P_BONUS_BASE_AMT        : gfnma_nvl2(item.data.BONUS_BASE_AMT) == '' ? 0 : item.data.BONUS_BASE_AMT
                        , V_P_INCENTIVE_BASE_AMT    : gfnma_nvl2(item.data.INCENTIVE_BASE_AMT) == '' ? 0 : item.data.INCENTIVE_BASE_AMT
                        , V_P_COMPETENCE_BASE_AMT   : gfnma_nvl2(item.data.COMPETENCE_BASE_AMT) == '' ? 0 : item.data.COMPETENCE_BASE_AMT
                        , V_P_DAILY_BASE_AMT        : gfnma_nvl2(item.data.DAILY_BASE_AMT) == '' ? 0 : item.data.DAILY_BASE_AMT
                        , V_P_HOURLY_BASE_AMT       : gfnma_nvl2(item.data.HOURLY_BASE_AMT) == '' ? 0 : item.data.HOURLY_BASE_AMT
                        , V_P_INCENTIVE_ADD_AMT     : gfnma_nvl2(item.data.INCENTIVE_ADD_AMT) == '' ? 0 : item.data.INCENTIVE_ADD_AMT
                        , V_P_BONUS_COUNT           : gfnma_nvl2(item.data.BONUS_COUNT) == '' ? 0 : item.data.BONUS_COUNT
                        , V_P_INCENTIVE_MONTH_AMT   : gfnma_nvl2(item.data.INCENTIVE_MONTH_AMT) == '' ? 0 : item.data.INCENTIVE_MONTH_AMT
                        , V_P_SUNDRY_ALLOW_AMT      : 0
                        , V_P_QUALIFICN_ALLOW_AMT   : 0
                        , V_P_JOB_BASE_AMT          : gfnma_nvl2(item.data.JOB_BASE_AMT) == '' ? 0 : item.data.JOB_BASE_AMT
                        , V_P_OT_FIXED_BASE_AMT     : gfnma_nvl2(item.data.OT_FIXED_BASE_AMT) == '' ? 0 : item.data.OT_FIXED_BASE_AMT
                        , V_P_CONTRIBUTE_BASE_AMT   : gfnma_nvl2(item.data.CONTRIBUTE_BASE_AMT) == '' ? 0 : item.data.CONTRIBUTE_BASE_AMT
                        , V_P_ADJUST_BASE_AMT       : gfnma_nvl2(item.data.ADJUST_BASE_AMT) == '' ? 0 : item.data.ADJUST_BASE_AMT
                        , V_P_ROLE_BASE_AMT         : gfnma_nvl2(item.data.ROLE_BASE_AMT) == '' ? 0 : item.data.ROLE_BASE_AMT
                        , V_P_SALARY_AMT01          : ''
                        , V_P_SALARY_AMT02          : ''
                        , V_P_SALARY_AMT03          : ''
                        , V_P_SALARY_AMT04          : ''
                        , V_P_SALARY_AMT05          : ''
                        , V_P_SALARY_AMT06          : ''
                        , V_P_SALARY_AMT07          : ''
                        , V_P_SALARY_AMT08          : ''
                        , V_P_SALARY_AMT09          : ''
                        , V_P_SALARY_AMT10          : ''
                        , V_P_SALARY_AMT11          : ''
                        , V_P_SALARY_AMT12          : ''
                        , V_P_SALARY_AMT13          : ''
                        , V_P_SALARY_AMT14          : ''
                        , V_P_SALARY_AMT15          : ''
                        , V_P_SALARY_AMT16          : ''
                        , V_P_SALARY_AMT17          : ''
                        , V_P_SALARY_AMT18          : ''
                        , V_P_SALARY_AMT19          : ''
                        , V_P_SALARY_AMT20          : ''
                        , V_P_SALARY_AMT21          : ''
                        , V_P_SALARY_AMT22          : ''
                        , V_P_SALARY_AMT23          : ''
                        , V_P_SALARY_AMT24          : ''
                        , V_P_SALARY_AMT25          : ''
                        , V_P_SALARY_AMT26          : ''
                        , V_P_SALARY_AMT27          : ''
                        , V_P_SALARY_AMT28          : ''
                        , V_P_SALARY_AMT29          : ''
                        , V_P_SALARY_AMT30          : ''
                        , V_P_MEMO                  : gfnma_nvl2(item.data.MEMO)

                        , V_P_FORM_ID: p_formId
                        , V_P_MENU_ID: p_menuId
                        , V_P_PROC_ID: ''
                        , V_P_USERID: ''
                        , V_P_PC: ''

                    })
                }

                returnData.push(param);

            });
        }

        return returnData;

    }

    const getParamFormS2 = async function (updatedData) {


        //중복체크를 해야할 경우
        //let chdate = gvwWithholdGrid.getGridDataAll();

        /*let updatedData;*/
        let returnData = [];

        let EMP_CODE = gfnma_nvl2(SBUxMethod.get("EMP_CODE"));


        /*updatedData = gvwWithholdGrid.getUpdateData(true, 'all');*/

        if (!_.isEmpty(updatedData)) {
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

                        , V_P_EMP_CODE          : EMP_CODE
                        , V_P_APPLY_START_DATE  : gfnma_nvl2(item.data.APPLY_START_DATE)
                        , V_P_APPLY_END_DATE    : gfnma_nvl2(item.data.APPLY_END_DATE)
                        , V_P_WITHHOLD_RATE     : gfnma_nvl2(item.data.WITHHOLD_RATE) == '' ? 0 : item.data.WITHHOLD_RATE
                        , V_P_MEMO              : gfnma_nvl2(item.data.MEMO)

                        , V_P_FORM_ID: p_formId
                        , V_P_MENU_ID: p_menuId
                        , V_P_PROC_ID: ''
                        , V_P_USERID: ''
                        , V_P_PC: ''

                    })
                }
                returnData.push(param);
            });
        }

        return returnData;

    }

    const getParamFormS3 = async function (updatedData) {


        let returnData = [];
        let EMP_CODE = gfnma_nvl2(SBUxMethod.get("EMP_CODE"));

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

                    , V_P_EMP_CODE            : EMP_CODE
                    , V_P_INSU_TYPE           : gfnma_nvl2(item.data.INSU_TYPE)
                    , V_P_START_DATE          : gfnma_nvl2(item.data.START_DATE)
                    , V_P_END_DATE            : gfnma_nvl2(item.data.END_DATE)
                    , V_P_ORG_START_DATE      : null
                    , V_P_INSU_REASON_TYPE    : gfnma_nvl2(item.data.INSU_REASON_TYPE)
                    , V_P_INSU_STATE_TYPE     : gfnma_nvl2(item.data.INSU_STATE_TYPE)
                    , V_P_INSU_REG_TYPE       : gfnma_nvl2(item.data.INSU_REG_TYPE)
                    , V_P_INSU_RATE           : gfnma_nvl2(item.data.INSU_RATE)
                    , V_P_INSU_AMT_YN         : gfnma_nvl2(item.data.INSU_AMT_YN)
                    , V_P_OVER_WORKER_YN      : gfnma_nvl2(item.data.OVER_WORKER_YN)
                    , V_P_AGE_65_OVER_YN      : gfnma_nvl2(item.data.AGE_65_OVER_YN)
                    , V_P_MEMO                : gfnma_nvl2(item.data.MEMO)

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

    const getParamFormS4 = async function (updatedData) {

        let returnData = [];
        let EMP_CODE = gfnma_nvl2(SBUxMethod.get("EMP_CODE"));

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

                    , V_P_EMP_CODE              : EMP_CODE
                    , V_P_APPLY_TYPE            : gfnma_nvl2(item.data.APPLY_TYPE)
                    , V_P_LONG_APPLY_TYPE       : gfnma_nvl2(item.data.LONG_APPLY_TYPE)
                    , V_P_APPLY_START_DATE      : gfnma_nvl2(item.data.APPLY_START_DATE)
                    , V_P_APPLY_END_DATE        : gfnma_nvl2(item.data.APPLY_END_DATE)
                    , V_P_BASE_AMT              : gfnma_nvl2(item.data.BASE_AMT)
                    , V_P_LONG_APPLY_EXEM_AMT   : gfnma_nvl2(item.data.LONG_APPLY_EXEM_AMT)
                    , V_P_MEMO                  : gfnma_nvl2(item.data.MEMO)

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

    //변동항목추가 저장
    const fn_lbladd1 = async function () {
        var ht = {};

        ht["target"] = 'MA_A10_030_010_280';
        let json = JSON.stringify(ht);

        window.parent.cfn_openTabSearch(json);


    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
