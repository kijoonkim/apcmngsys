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
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
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
            <div style="margin-left: auto;">
               <%-- <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="신규"
                             class="btn btn-sm btn-outline-danger"
                             onclick="fn_create"></sbux-button>--%>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger"
                             onclick="fn_save"></sbux-button>
                <sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제"
                             class="btn btn-sm btn-outline-danger"
                             onclick="fn_delete"></sbux-button>
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회"
                             class="btn btn-sm btn-outline-danger"
                             onclick="fn_search"></sbux-button>
            </div>
        </div>
        <!--[pp] 검색 -->
        <!--[APC] START -->
        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        <table class="table table-bordered tbl_fixed">
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
                <col style="width: 6%">
                <col style="width: 3%">
            </colgroup>
            <tbody>
            <tr>
                <%--<th scope="row" class="th_bg">법인</th>
                <td colspan="" class="td_input" style="border-right:hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="srch-comp_code"
                            name="srch-comp_code"
                            class="form-control input-sm"
                            jsondata-ref="L_ORG000"
                    />
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>--%>
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
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">재직구분</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="srch-emp_state"
                            name="srch-emp_state"
                            class="form-control input-sm"
                            jsondata-ref="jsonEmpState"
                    />
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td colspan="2" class="td_input td_input_dtl" style="border-left:hidden">
                    <sbux-button
                            uitype="normal" id="srch-btn-add" name="srch-btn-add"
                            class="btn btn-sm btn-outline-danger" text="변동항목추가" onclick="">
                    </sbux-button>
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">부서</th>
                <%--<td colspan="" class="td_input" style="border-right:hidden;">
                    <sbux-input id="srch-dept_code" uitype="text" style="width:200px" placeholder=""
                                class="form-control input-sm"></sbux-input>
                </td>
                <td colspan="" class="td_input" style="border-right:hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="srch-dept_name"
                            name="srch-dept_name"
                            class="form-control input-sm"
                            jsondata-ref="jsonDeptName"
                    />
                </td>--%>
                <td <%--colspan="2"--%>  class="td_input" style="border-right: hidden;">
                    <sbux-input
                            uitype="hidden"
                            uitype="text"
                            id="srch-dept_code"
                            class="form-control input-sm"
                    ></sbux-input>
                    <sbux-input
                            uitype="text"
                            id="srch-dept_name"
                            class="form-control input-sm"

                    ></sbux-input>
                </td>
                <td class="td_input" >
                    <sbux-button
                            class="btn btn-xs btn-outline-dark"
                            text="찾기" uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopup1"
                    ></sbux-button>
                </td>

                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">사원</th>
                <td <%--colspan="2"--%>  class="td_input" style="border-right: hidden;">
                    <sbux-input
                            uitype="hidden"
                            uitype="text"
                            id="srch-emp_code"
                            class="form-control input-sm"
                    ></sbux-input>
                    <sbux-input
                            uitype="text"
                            id="srch-emp_full_name"
                            class="form-control input-sm"

                    ></sbux-input>
                </td>
                <td class="td_input" >
                    <sbux-button
                            class="btn btn-xs btn-outline-dark"
                            text="찾기" uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopup2"
                    ></sbux-button>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">급여영역</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="srch-pay_area_type"
                            name="srch-pay_area_type"
                            class="form-control input-sm"
                            jsondata-ref="jsonPayAreaType"
                    />
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
            </tr>
            </tbody>
        </table>

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
                    <div id="sb-area-grwInfo" style="height:800px; width:100%;"></div>
                </div>
            </div>

            <div class="col-sm-8">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>인사정보</span></li>
                    </ul>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
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
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="EMP_CODE" uitype="text" style="width:200px" placeholder=""
                                            class="form-control input-sm"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text=""
                                        uitype="single"
                                        id="EMP_FULL_NAME"
                                        name="EMP_FULL_NAME"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonApcBx"
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">사업장</th>
                            <td class="td_input" style="border-right: hidden;">
                                <div class="dropdown">
                                    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SITE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
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
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="DEPT_CODE" uitype="text" style="width:200px" placeholder=""
                                            class="form-control input-sm"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text=""
                                        uitype="single"
                                        id="DEPT_NAME"
                                        name="DEPT_NAME"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonDeptName"
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">사원구분</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="EMP_TYPE"
                                        name="EMP_TYPE"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonEmpType"
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
                                        class="input-sm"
                                        autocomplete="off"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">퇴사일</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="RETIRE_DATE"
                                        name="RETIRE_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                        readonly
                                ></sbux-datepicker>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">여수습종료일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="TEMP_END_DATE"
                                        name="TEMP_END_DATE"
                                        class="input-sm"
                                        autocomplete="off"
                                ></sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">상여적용시작일</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="BONUS_APPLY_START_DATE"
                                        name="BONUS_APPLY_START_DATE"
                                        class="input-sm"
                                        autocomplete="off"
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
                <table class="table table-bordered tbl_fixed">
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
                        <td colspan="" class="td_input" style="border-right:hidden;">
                            <sbux-input id="BANK_ACCOUNT" uitype="text" style="width:100%" placeholder=""
                                        class="form-control input-sm"></sbux-input>
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text=""
                                    uitype="single"
                                    id="PAY_GROUP_CODE"
                                    name="PAY_GROUP_CODE"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonPayGroupCode"
                            />
                        </td>
                        <td style="border-right: hidden;">&nbsp;</td>
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
                            <sbux-input id="BANK_ACCOUNT_REAL" uitype="text" style="width:100%" placeholder=""
                                        class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}"></sbux-input>
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
                            <sbux-checkbox id="BONUS_PAY_YN" name="BONUS_PAY_YN" uitype="normal" text="상여지금" true-value="Y"
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
                            <sbux-input id="BANK_ACCOUNT2_REAL" uitype="text" style="width:100%" placeholder=""
                                        class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}"></sbux-input>
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
                            <sbux-input id="RET_PENS_BANK_ACC_REAL" uitype="text" style="width:100%" placeholder=""
                                        class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}"></sbux-input>
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
                            <sbux-input id="MAIN_ACC_TYPE" uitype="text" style="width:90%" placeholder=""
                                        class="form-control input-sm"></sbux-input>
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
                </table>
                <sbux-tabs id="tabJson" name="tabJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false">
                </sbux-tabs>
                <div class="tab-content">
                    <div id="payInfoTab" >
                        <div class="ad_tbl_toplist">
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
                        <div>
                            <div id="sb-area-grwPay" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="dedTab" >
                        <div>
                            <div id="sb-area-grwDed" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="varPayTab" >
                        <div>
                            <div id="sb-area-grwVarPay" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="varDedTab" >
                        <div>
                            <div id="sb-area-grwVarDed" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="payExTab" >
                        <div>
                            <div id="sb-area-grwPayEx" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="detailTab" >
                        <div>
                            <div id="sb-area-grwDetail" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="viewEx1Tab" >
                        <div>
                            <div id="sb-area-grwViewEx1" style="height:283px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="withholdTab" >
                        <div class="ad_tbl_toplist">
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
    var gvwHrpMasterGrid;
    var jsonHrpMasterList = [];
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
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )pay_area_type,srch-pay_area_type
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
            gfnma_setComSelect(['srch-comp_code'], jsonCompCode, 'L_ORG000', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'COMP_CODE', 'COMP_NAME', 'Y', ''),
            gfnma_setComSelect(['srch-emp_state','EMP_STATE'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['srch-pay_area_type','PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SALARY_CLASS'], jsonSalaryClass, 'L_HRI011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'GRADE_HOBONG_CODE', 'GRADE_HOBONG_NAME', 'Y', ''),
            gfnma_setComSelect(['EMP_TYPE'], jsonEmpType, 'L_HRI008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['POSITION_CODE'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['PAY_GROUP_CODE'], jsonPayGroupCode, 'L_HRI010', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_GROUP_CODE', 'PAY_GROUP_NAME', 'Y', ''),
            gfnma_setComSelect(['BANK_CODE','BANK_CODE2','RET_PENS_BANK_CODE'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayType, 'L_HRB008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayItemCode, 'L_HRP001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayItemCode2, 'L_HRP002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayItemCode3, 'L_HRP009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayItemCode4, 'L_HRP037', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayItemCode5, 'L_HRP004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonPayApplyType, 'L_HRP021', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonInsuType, 'L_HRW018', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonInsuReasonType, 'L_HRW019', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonInsuStateType, 'L_HRW021', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonInsuRegType, 'L_HRW020', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonApplyType, 'L_HRW023', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonLongApplyType, 'L_HRW022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonUser, 'L_USER', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'USER_ID', 'USER_NAME', 'Y', ''),


            //사업장
            gfnma_multiSelectInit({
                target			: ['#srch-site_code','#SITE_CODE']
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
            })
        ]);
    }

    /**
     * 공통팝업3
     */
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
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"     ,   "100"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('srch-dept_name', data.DEPT_NAME);
                SBUxMethod.set('srch-dept_code', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function() {
        var searchText = gfnma_nvl(SBUxMethod.get("srch-dept_name"));
        var replaceText0 = "_EMP_CODE";
        var replaceText1 = "_EMP_NAME";
        var replaceText2 = "_DEPT_CODE";
        var replaceText3 = "_DEPT_NAME";
        var replaceText4 = "_EMP_STATE";
        var strWhereClause = "AND X.EMP_CODE LIKE '%" + replaceText0 + "%' AND X.DEPT_NAME LIKE '%" + replaceText1 + "%' AND X.DEPT_CODE ="+replaceText2
            + "%' AND X.DEPT_NAME LIKE '%" + replaceText3 + "%' AND X.EMP_STATE ="+replaceText4;

        SBUxMethod.attr('modal-compopup1', 'header-title', '입력부서');
        compopup1({
            compCode: gv_ma_selectedApcCd
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
                console.log('callback data:', data);
                SBUxMethod.set('srch-emp_full_name', data.EMP_NAME);
                SBUxMethod.set('srch-emp_code', data.EMP_CODE);
            },
        });

    }

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        fn_createGrid();
        fn_createPayInfoGrid();        //급여정보
        fn_createPayGrid();     //고정 수당항목
        fn_createDedGrid();      //고정공제항목
        fn_createVarPayGrid();  //변동수당항목
        fn_createVarDedGrid();  //변동공제항목
        fn_createPayExGrid();   //급상여 예외항목
        fn_createDetailGrid();  //사회보험 가입이력
        fn_createViewEx1Grid();  //보수월액
        fn_createWithholdGrid(); //원천세징수비율
        fn_createHrpMasterGrid(); //급여 기본 사항, 사회보험
        fn_search();
    }

    //사원 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwInfo';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonGvwInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["등록"], ref: 'CREATE', type: 'checkbox', width: '70px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["급여체계"], ref : 'PAY_GROUP_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayGroupCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["급여영역"], ref : 'PAY_AREA_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayAreaType', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["직 책"], ref : 'DUTY_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDutyCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["직위"], ref : 'POSITION_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPositionCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["부서"], ref : 'DEPT_NAME', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDeptName', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["입사일"], ref: 'ENTER_DATE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["퇴사일"], ref: 'RETIRE_DATE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["급여계좌은행"], ref : 'BANK_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonBankCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["급여계좌번호"], ref: 'BANK_ACCOUNT_REAL', type: 'output', width: '200px', style: 'text-align:left'},
            {caption : ["연차계좌은행"], ref : 'BANK_CODE2', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonBankCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["연차계좌번호"], ref: 'BANK_ACCOUNT2_REAL', type: 'output', width: '200px', style: 'text-align:left'},

            {caption : ["재직구분"], ref : 'EMP_STATE', width : '100px', style : 'text-align:center', type : 'combo', hidden: true,
                typeinfo : {ref : 'jsonEmpState', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["급여계좌번호(암호화)"], ref: 'BANK_ACCOUNT', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["연차계좌번호(암호화)"], ref: 'BANK_ACCOUNT2', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption : ["IRP계좌은행"], ref : 'RET_PENS_BANK_CODE', width : '100px', style : 'text-align:center', type : 'combo', hidden: true,
                typeinfo : {ref : 'jsonBankCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["IRP계좌번호(암호화)"], ref: 'RET_PENS_BANK_ACC', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["IRP계좌번호"], ref: 'RET_PENS_BANK_ACC_REAL', type: 'output', width: '200px', style: 'text-align:left', hidden: true}

        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        gvwInfoGrid.bind('click', 'fn_view');
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
        SBGridProperties.columns = [
            {caption: ['시작일자'], 		ref: 'APPLY_START_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['종료일자'], 		ref: 'APPLY_END_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '200px', style: 'text-align:left'},
            {caption: ["급여기본급"], ref: 'SALARY_BASE_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["업적급"], ref: 'JOB_BASE_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["고정연장수당"], ref: 'OT_FIXED_BASE_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["역할급"], ref: 'ROLE_BASE_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["성과급"], ref: 'INCENTIVE_BASE_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["역량가급"], ref: 'COMPETENCE_BASE_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["월급여"], ref: 'MONTHLY_SALARY_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["지급횟수"], ref: 'PAY_COUNT', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["성과가급"], ref: 'INCENTIVE_ADD_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["지급횟수(성과)"], ref: 'BONUS_COUNT', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["연봉"], ref: 'ANNUAL_SALARY_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["성과급월액"], ref: 'INCENTIVE_MONTH_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["기본시급"], ref: 'HOURLY_BASE_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["기본급(통상시급용)"], ref: 'SUM_BASE_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["연차기준금액"], ref: 'ANNUAL_BASE_AMT', type: 'input', width: '150px', style: 'text-align:left'},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["수정일시"], ref: 'USERTIME', type: 'input', width: '100px', style: 'text-align:left', disabled: true},

            {caption: ["기본일급"], ref: 'DAILY_BASE_AMT', type: 'input', width: '150px', style: 'text-align:left', hidden: true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["상여기본급"], ref: 'BONUS_BASE_AMT', type: 'input', width: '150px', style: 'text-align:left', hidden: true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["기여시급"], ref: 'CONTRIBUTE_BASE_AMT', type: 'input', width: '150px', style: 'text-align:left', hidden: true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["조정수당"], ref: 'ADJUST_BASE_AMT', type: 'input', width: '150px', style: 'text-align:left', hidden: true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}}

        ];

        gvwPayInfoGrid = _SBGrid.create(SBGridProperties);
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
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayType', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["수당항목"], ref : 'PAY_ITEM_CODE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '120px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ['적용시작일'], ref: 'APPLY_START_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['적용종료일'], ref: 'APPLY_END_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["수정시간"], ref: 'USERTIME', type: 'output', width: '120px', style: 'text-align:left'},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '120px', style: 'text-align:left'},
            {caption: ["txn_id"], ref: 'TXN_ID', type: 'output', width: '120px', style: 'text-align:left', hidden: true}


        ];

        gvwPayGrid = _SBGrid.create(SBGridProperties);
    }

    //고정공제항목
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
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayType', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["공제항목"], ref : 'PAY_ITEM_CODE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode2', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '120px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ['적용시작일'], ref: 'APPLY_START_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['적용종료일'], ref: 'APPLY_END_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["수정시간"], ref: 'USERTIME', type: 'output', width: '120px', style: 'text-align:left'},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '120px', style: 'text-align:left'},
            {caption: ["gridColumnEx31"], ref: 'PAY_ITEM_CATEGORY', type: 'output', width: '120px', style: 'text-align:left', hidden: true},
            {caption: ["txn_id"], ref: 'TXN_ID', type: 'output', width: '120px', style: 'text-align:left', hidden: true}


        ];

        gvwDedGrid = _SBGrid.create(SBGridProperties);
    }

    //변동수당항목
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
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayType', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["공제항목"], ref : 'PAY_ITEM_CODE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode3', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '120px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ['적용시작일'], ref: 'APPLY_START_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,  disabled: true,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['지급일(세무)'], ref: 'TAX_PAY_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['적용종료일'], ref: 'APPLY_END_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false, hidden: true,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '120px', style: 'text-align:left'},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonUser', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["수정시간"], ref: 'USERTIME', type: 'output', width: '120px', style: 'text-align:left'},
            {caption: ["txn_id"], ref: 'TXN_ID', type: 'output', width: '120px', style: 'text-align:left', hidden: true}


        ];

        gvwVarPayGrid = _SBGrid.create(SBGridProperties);
    }

    //변동공제항목
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
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayType', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["공제항목"], ref : 'PAY_ITEM_CODE', width : '120px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode4', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '120px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ['적용시작일'], ref: 'APPLY_START_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,  disabled: true,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['지급일(세무)'], ref: 'TAX_PAY_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['적용종료일'], ref: 'APPLY_END_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false, hidden: true,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '120px', style: 'text-align:left'},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['수정시간'], ref: 'USERTIME', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["txn_id"], ref: 'TXN_ID', type: 'output', width: '120px', style: 'text-align:left', hidden: true}


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
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayType', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["공제항목"], ref : 'PAY_ITEM_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode5', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ['적용시작월'], ref: 'APPLY_START_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['적용종료월'], ref: 'APPLY_END_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ["적용구분"], ref : 'PAY_APPLY_TYPE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonPayApplyType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["적용비율"], ref: 'PAY_APPLY_RATE', type: 'input', width: '100px', style: 'text-align:left' , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/}},
            {caption: ["적용금액"], ref: 'PAY_APPLY_AMT', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['수정일시'], ref: 'USERTIME', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["비고"], ref: 'MEMO', type: 'output', width: '100px', style: 'text-align:left'}


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
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'INSU_TYPE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonInsuType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['가입일'], ref: 'START_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['종료일'], ref: 'END_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ["자격부여사유"], ref : 'INSU_REASON_TYPE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonInsuReasonType', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["신고"], ref : 'INSU_STATE_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonInsuStateType', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["상태"], ref : 'INSU_REG_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonInsuRegType', displayui : true, label : 'label', value : 'value'}
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
                typeinfo : {ref : 'jsonUser', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['수정일시'], ref: 'USERTIME', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
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
        SBGridProperties.columns = [
            {caption : ["사회보험"], ref : 'APPLY_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonApplyType', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["요양"], ref : 'LONG_APPLY_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonLongApplyType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['가입일'], ref: 'APPLY_START_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['종료일'], ref: 'APPLY_END_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["보수월액"], ref: 'BASE_AMT', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["사회보험보험료"], ref: 'VAL1', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["사회보험 면제/공제"], ref: 'VAL2', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["노인장기요양 보험료"], ref: 'VAL3', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["노인장기요양 면제"], ref: 'LONG_APPLY_EXEM_AMT', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["비고"], ref: 'MEMO', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['수정일시'], ref: 'USERTIME', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true}
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
        SBGridProperties.columns = [
            {caption: ['시작일'], ref: 'APPLY_START_DATE', 	width:'150px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['종료일'], ref: 'APPLY_END_DATE', 	width:'150px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["비율%"], ref: 'WITHHOLD_RATE', type: 'input', width: '150px', style: 'text-align:left' , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 3}},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '150px', style: 'text-align:left'},
            {caption : ["수정자"], ref : 'USERID', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonUser', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['수정일시'], ref: 'USERTIME', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true}
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
        /*SBGridProperties.allowcopy = true; //복사*/
        SBGridProperties.explorerbar = 'sortmove';
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["급여체계"], ref : 'PAY_GROUP_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayGroupCode', displayui : true, label : 'label', value : 'value'}
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
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["HEALTH_INSURE_YN"], ref: 'HEALTH_INSURE_YN', type: 'checkbox', width: '100px', style: 'text-align:center',
                typeinfo: {ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["HEALTH_INSURE_JOIN_DATE"], ref: 'HEALTH_INSURE_JOIN_DATE', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["HEALTH_INSURE_CLOSE_DATE"], ref: 'HEALTH_INSURE_CLOSE_DATE', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["HEALTH_INSURE_NO"], ref: 'HEALTH_INSURE_NO', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["HEALTH_INSURE_BASE_AMT"], ref: 'HEALTH_INSURE_BASE_AMT', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["EMPLOY_INSURE_YN"], ref: 'EMPLOY_INSURE_YN', type: 'checkbox', width: '100px', style: 'text-align:center',
                typeinfo: {ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["EMPLOY_INSURE_BASE_AMT"], ref: 'EMPLOY_INSURE_BASE_AMT', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
            {caption: ["APPLICATION_RATE"], ref: 'APPLICATION_RATE', type: 'input', width: '100px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false},}},
            {caption: ["LAST_APPLICATION_DATE"], ref: 'LAST_APPLICATION_DATE', type: 'output', width: '200px', style: 'text-align:left', hidden: true},
            {caption: ["LONGTERM_CARE_YN"], ref: 'LONGTERM_CARE_YN', type: 'checkbox', width: '100px', style: 'text-align:center',
                typeinfo: {ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
            }
        ];

        gvwHrpMasterGrid = _SBGrid.create(SBGridProperties);
    }


    //상세정보 보기
    async function fn_view(date) {

        fn_clearForm();


        let nCol = gvwInfoGrid.getCol();
        let nRow = gvwInfoGrid.getRow();

        if(_.isEmpty(date)) {
            //특정 열 부터 이벤트 적용
            if (nCol < 1) {
                return;
            }
            if (nRow < 1) {
                return;
            }
        }else if('search'){
            if (nRow < 1) {
                nRow = 1; //그리드 로우 첫번째값 셋팅
            }
        }

        let rowData = gvwInfoGrid.getRowData(nRow);

        if(rowData != null && rowData != '') {

            var paramObj = {
                V_P_DEBUG_MODE_YN: 'N'
                , V_P_LANG_ID: 'KOR'
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd
                , V_P_SITE_CODE: rowData.SITE_CODE
                , V_P_DEPT_CODE: rowData.DEPT_CODE
                , V_P_EMP_CODE: rowData.EMP_CODE
                , V_P_EMP_STATE: rowData.EMP_STATE
                , V_P_PAY_AREA_TYPE: rowData.PAY_AREA_TYPE
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

            console.log("----------------DETAIL-----------------    : ", data );

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    /*****************인사정보********************/
                    data.cv_2.forEach((item, index) => {
                        SBUxMethod.set("EMP_CODE", gfnma_nvl(item.EMP_CODE));
                        SBUxMethod.set("EMP_FULL_NAME", gfnma_nvl(item.EMP_FULL_NAME));
                        SBUxMethod.set("SITE_CODE", gfnma_nvl(item.SITE_CODE));
                        SBUxMethod.set("DEPT_CODE", gfnma_nvl(item.DEPT_CODE));
                        SBUxMethod.set("DEPT_NAME", gfnma_nvl(item.DEPT_NAME));
                        SBUxMethod.set("EMP_TYPE", gfnma_nvl(item.EMP_TYPE));
                        SBUxMethod.set("POSITION_CODE", gfnma_nvl(item.POSITION_CODE));
                        SBUxMethod.set("ENTER_DATE", gfnma_nvl(item.ENTER_DATE));
                        SBUxMethod.set("RETIRE_DATE", gfnma_nvl(item.RETIRE_DATE));
                        SBUxMethod.set("TEMP_END_DATE", gfnma_nvl(item.TEMP_END_DATE));
                        SBUxMethod.set("BONUS_APPLY_START_DATE", gfnma_nvl(item.BONUS_APPLY_START_DATE));
                    });

                    /*****************급여 기본 사항, 사회보험********************/
                    jsonHrpMasterList.length = 0;
                    data.cv_3.forEach((item, index) => {

                        const msg = {
                            PAY_GROUP_CODE: gfnma_nvl(item.PAY_GROUP_CODE),
                            BANK_ACCOUNT: gfnma_nvl(item.BANK_ACCOUNT),
                            RET_PENS_BANK_ACC: gfnma_nvl(item.RET_PENS_BANK_ACC),
                            PENSION_YN: gfnma_nvl(item.PENSION_YN),
                            PENSION_JOIN_DATE: gfnma_nvl(item.PENSION_JOIN_DATE),
                            PENSION_CLOSE_DATE: gfnma_nvl(item.PENSION_CLOSE_DATE),
                            PENSION_NO: gfnma_nvl(item.PENSION_NO),
                            PENSION_BASE_AMT: gfnma_nvl(item.PENSION_BASE_AMT),
                            HEALTH_INSURE_YN: gfnma_nvl(item.HEALTH_INSURE_YN),
                            HEALTH_INSURE_JOIN_DATE: gfnma_nvl(item.HEALTH_INSURE_JOIN_DATE),
                            HEALTH_INSURE_CLOSE_DATE: gfnma_nvl(item.HEALTH_INSURE_CLOSE_DATE),
                            HEALTH_INSURE_NO: gfnma_nvl(item.HEALTH_INSURE_NO),
                            HEALTH_INSURE_BASE_AMT: gfnma_nvl(item.HEALTH_INSURE_BASE_AMT),
                            EMPLOY_INSURE_YN: gfnma_nvl(item.EMPLOY_INSURE_YN),
                            EMPLOY_INSURE_BASE_AMT: gfnma_nvl(item.EMPLOY_INSURE_BASE_AMT),
                            APPLICATION_RATE: gfnma_nvl(item.APPLICATION_RATE),
                            LAST_APPLICATION_DATE: gfnma_nvl(item.LAST_APPLICATION_DATE),
                            LONGTERM_CARE_YN: gfnma_nvl(item.LONGTERM_CARE_YN)
                        }
                        jsonHrpMasterList.push(msg);

                        SBUxMethod.set("BANK_ACCOUNT", gfnma_nvl(item.BANK_ACCOUNT));
                        SBUxMethod.set("BANK_CODE", gfnma_nvl(item.BANK_CODE));
                        SBUxMethod.set("BANK_ACCOUNT_REAL", gfnma_nvl(item.BANK_ACCOUNT_REAL));

                        SBUxMethod.set("PAY_YN", gfnma_nvl(item.PAY_YN));
                        SBUxMethod.set("BONUS_PAY_YN", gfnma_nvl(item.BONUS_PAY_YN));
                        SBUxMethod.set("RETIRE_PAY_YN", gfnma_nvl(item.RETIRE_PAY_YN));
                        SBUxMethod.set("BANK_CODE2", gfnma_nvl(item.BANK_CODE2));
                        SBUxMethod.set("BANK_ACCOUNT2_REAL", gfnma_nvl(item.BANK_ACCOUNT2_REAL));
                        SBUxMethod.set("BANK2_PAY_ITEM", gfnma_nvl(item.BANK2_PAY_ITEM));
                        SBUxMethod.set("LUNCH_PAY_YN", gfnma_nvl(item.LUNCH_PAY_YN));
                        SBUxMethod.set("OVER_TIME_PAY_YN", gfnma_nvl(item.OVER_TIME_PAY_YN));
                        SBUxMethod.set("OT_TAX_FREE_YN", gfnma_nvl(item.OT_TAX_FREE_YN));
                        SBUxMethod.set("RET_PENS_BANK_CODE", gfnma_nvl(item.RET_PENS_BANK_CODE));
                        SBUxMethod.set("RET_PENS_BANK_ACC_REAL", gfnma_nvl(item.RET_PENS_BANK_ACC_REAL));
                        SBUxMethod.set("MUTUAL_AID_MEMBER_YN", gfnma_nvl(item.MUTUAL_AID_MEMBER_YN));
                        SBUxMethod.set("MONTHLY_DONATION_YN", gfnma_nvl(item.MONTHLY_DONATION_YN));
                        SBUxMethod.set("INCOME_TAX_YN", gfnma_nvl(item.INCOME_TAX_YN));
                        SBUxMethod.set("MAIN_ACC_TYPE", gfnma_nvl(item.MAIN_ACC_TYPE));
                        SBUxMethod.set("SUPPORTEE_QTY", gfnma_nvl(item.SUPPORTEE_QTY));
                        SBUxMethod.set("CHILDREN_QTY", gfnma_nvl(item.CHILDREN_QTY));
                    });

                    gvwHrpMasterGrid.rebuild();


                    /*****************급여정보********************/
                    jsonPayInfoList.length = 0;
                    data.cv_4.forEach((item, index) => {
                        const msg = {
                            APPLY_START_DATE: gfnma_nvl(item.APPLY_START_DATE),
                            APPLY_END_DATE: gfnma_nvl(item.APPLY_END_DATE),
                            MEMO: gfnma_nvl(item.MEMO),
                            SALARY_BASE_AMT: gfnma_nvl(item.SALARY_BASE_AMT),
                            JOB_BASE_AMT: gfnma_nvl(item.JOB_BASE_AMT),
                            OT_FIXED_BASE_AMT: gfnma_nvl(item.OT_FIXED_BASE_AMT),
                            ROLE_BASE_AMT: gfnma_nvl(item.ROLE_BASE_AMT),
                            INCENTIVE_BASE_AMT: gfnma_nvl(item.INCENTIVE_BASE_AMT),
                            COMPETENCE_BASE_AMT: gfnma_nvl(item.COMPETENCE_BASE_AMT),
                            MONTHLY_SALARY_AMT: gfnma_nvl(item.MONTHLY_SALARY_AMT),
                            PAY_COUNT: gfnma_nvl(item.PAY_COUNT),
                            INCENTIVE_ADD_AMT: gfnma_nvl(item.INCENTIVE_ADD_AMT),
                            BONUS_COUNT: gfnma_nvl(item.BONUS_COUNT),
                            ANNUAL_SALARY_AMT: gfnma_nvl(item.ANNUAL_SALARY_AMT),
                            INCENTIVE_MONTH_AMT: gfnma_nvl(item.INCENTIVE_MONTH_AMT),
                            HOURLY_BASE_AMT: gfnma_nvl(item.HOURLY_BASE_AMT),
                            SUM_BASE_AMT: gfnma_nvl(item.SUM_BASE_AMT),
                            ANNUAL_BASE_AMT: gfnma_nvl(item.ANNUAL_BASE_AMT),
                            USERID: gfnma_nvl(item.USERID),
                            USERTIME: gfnma_nvl(item.USERTIME),
                            DAILY_BASE_AMT: gfnma_nvl(item.DAILY_BASE_AMT),
                            BONUS_BASE_AMT: gfnma_nvl(item.BONUS_BASE_AMT),
                            CONTRIBUTE_BASE_AMT: gfnma_nvl(item.CONTRIBUTE_BASE_AMT),
                            ADJUST_BASE_AMT: gfnma_nvl(item.ADJUST_BASE_AMT)
                        }
                        jsonPayInfoList.push(msg);
                    });

                    gvwPayInfoGrid.rebuild();

                    /*****************고정 수당항목********************/
                    jsonPayList.length = 0;
                    data.cv_5.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE: gfnma_nvl(item.PAY_TYPE),
                            PAY_ITEM_CODE: gfnma_nvl(item.PAY_ITEM_CODE),
                            PAY_AMT: gfnma_nvl(item.PAY_AMT),
                            APPLY_START_DATE: gfnma_nvl(item.APPLY_START_DATE),
                            APPLY_END_DATE: gfnma_nvl(item.APPLY_END_DATE),
                            USERID: gfnma_nvl(item.USERID),
                            USERTIME: gfnma_nvl(item.USERTIME),
                            MEMO: gfnma_nvl(item.MEMO),
                            TXN_ID: gfnma_nvl(item.TXN_ID)
                        }
                        jsonPayList.push(msg);
                    });

                    gvwPayGrid.rebuild();

                    /*****************고정공제항목********************/
                    jsonDedList.length = 0;
                    data.cv_6.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE: gfnma_nvl(item.PAY_TYPE),
                            PAY_ITEM_CODE: gfnma_nvl(item.PAY_ITEM_CODE),
                            PAY_AMT: gfnma_nvl(item.PAY_AMT),
                            APPLY_START_DATE: gfnma_nvl(item.APPLY_START_DATE),
                            APPLY_END_DATE: gfnma_nvl(item.APPLY_END_DATE),
                            USERID: gfnma_nvl(item.USERID),
                            USERTIME: gfnma_nvl(item.USERTIME),
                            MEMO: gfnma_nvl(item.MEMO),
                            PAY_ITEM_CATEGORY: gfnma_nvl(item.PAY_ITEM_CATEGORY),
                            TXN_ID: gfnma_nvl(item.TXN_ID)
                        }
                        jsonDedList.push(msg);
                    });

                    gvwDedGrid.rebuild();

                    /*****************변동수당항목********************/
                    jsonVarPayList.length = 0;
                    data.cv_8.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE: gfnma_nvl(item.PAY_TYPE),
                            PAY_ITEM_CODE: gfnma_nvl(item.PAY_ITEM_CODE),
                            PAY_AMT: gfnma_nvl(item.PAY_AMT),
                            APPLY_START_DATE: gfnma_nvl(item.APPLY_START_DATE),
                            TAX_PAY_DATE: gfnma_nvl(item.TAX_PAY_DATE),
                            APPLY_END_DATE: gfnma_nvl(item.APPLY_END_DATE),
                            MEMO: gfnma_nvl(item.MEMO),
                            USERID: gfnma_nvl(item.USERID),
                            USERTIME: gfnma_nvl(item.USERTIME),
                            TXN_ID: gfnma_nvl(item.TXN_ID)
                        }
                        jsonVarPayList.push(msg);
                    });

                    gvwVarPayGrid.rebuild();

                    /*****************변동공제항목********************/
                    jsonVarDedList.length = 0;
                    data.cv_9.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE: gfnma_nvl(item.PAY_TYPE),
                            PAY_ITEM_CODE: gfnma_nvl(item.PAY_ITEM_CODE),
                            PAY_AMT: gfnma_nvl(item.PAY_AMT),
                            APPLY_START_DATE: gfnma_nvl(item.APPLY_START_DATE),
                            TAX_PAY_DATE: gfnma_nvl(item.TAX_PAY_DATE),
                            APPLY_END_DATE: gfnma_nvl(item.APPLY_END_DATE),
                            MEMO: gfnma_nvl(item.MEMO),
                            USERID: gfnma_nvl(item.USERID),
                            USERTIME: gfnma_nvl(item.USERTIME),
                            TXN_ID: gfnma_nvl(item.TXN_ID)
                        }
                        jsonVarDedList.push(msg);
                    });

                    gvwVarDedGrid.rebuild();

                    /*****************급상여 예외항목********************/
                    jsonPayExList.length = 0;
                    data.cv_10.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE: gfnma_nvl(item.PAY_TYPE),
                            PAY_ITEM_CODE: gfnma_nvl(item.PAY_ITEM_CODE),
                            PAY_AMT: gfnma_nvl(item.PAY_AMT),
                            APPLY_START_DATE: gfnma_nvl(item.APPLY_START_DATE),
                            APPLY_END_DATE: gfnma_nvl(item.APPLY_END_DATE),
                            PAY_APPLY_TYPE: gfnma_nvl(item.PAY_APPLY_TYPE),
                            PAY_APPLY_RATE: gfnma_nvl(item.PAY_APPLY_RATE),
                            PAY_APPLY_AMT: gfnma_nvl(item.PAY_APPLY_AMT),
                            USERID: gfnma_nvl(item.USERID),
                            USERTIME: gfnma_nvl(item.USERTIME),
                            MEMO: gfnma_nvl(item.MEMO)
                        }
                        jsonPayExList.push(msg);
                    });

                    gvwPayExGrid.rebuild();

                    /*****************사회보험 가입이력********************/
                    jsonDetailList.length = 0;
                    data.cv_11.forEach((item, index) => {
                        const msg = {
                            INSU_TYPE: gfnma_nvl(item.INSU_TYPE),
                            START_DATE: gfnma_nvl(item.START_DATE),
                            END_DATE: gfnma_nvl(item.END_DATE),
                            INSU_REASON_TYPE: gfnma_nvl(item.INSU_REASON_TYPE),
                            INSU_STATE_TYPE: gfnma_nvl(item.INSU_STATE_TYPE),
                            INSU_REG_TYPE: gfnma_nvl(item.INSU_REG_TYPE),
                            INSU_RATE: gfnma_nvl(item.INSU_RATE),
                            INSU_AMT_YN: gfnma_nvl(item.INSU_AMT_YN),
                            OVER_WORKER_YN: gfnma_nvl(item.OVER_WORKER_YN),
                            AGE_65_OVER_YN: gfnma_nvl(item.AGE_65_OVER_YN),
                            MEMO: gfnma_nvl(item.MEMO),
                            USERID: gfnma_nvl(item.USERID),
                            USERTIME: gfnma_nvl(item.USERTIME)
                        }
                        jsonDetailList.push(msg);
                    });

                    gvwDetailGrid.rebuild();

                    /*****************보수월액********************/
                    jsonViewEx1List.length = 0;
                    data.cv_7.forEach((item, index) => {
                        const msg = {
                            APPLY_TYPE: gfnma_nvl(item.APPLY_TYPE),
                            LONG_APPLY_TYPE: gfnma_nvl(item.LONG_APPLY_TYPE),
                            APPLY_START_DATE: gfnma_nvl(item.APPLY_START_DATE),
                            APPLY_END_DATE: gfnma_nvl(item.APPLY_END_DATE),
                            BASE_AMT: gfnma_nvl(item.BASE_AMT),
                            VAL1: gfnma_nvl(item.VAL1),
                            VAL2: gfnma_nvl(item.VAL2),
                            VAL3: gfnma_nvl(item.VAL3),
                            LONG_APPLY_EXEM_AMT: gfnma_nvl(item.LONG_APPLY_EXEM_AMT),
                            MEMO: gfnma_nvl(item.MEMO),
                            USERID: gfnma_nvl(item.USERID),
                            USERTIME: gfnma_nvl(item.USERTIME)
                        }
                        jsonViewEx1List.push(msg);
                    });

                    gvwViewEx1Grid.rebuild();

                    /*****************원천세징수비율********************/
                    jsonWithholdList.length = 0;
                    data.cv_12.forEach((item, index) => {
                        const msg = {
                            APPLY_START_DATE: gfnma_nvl(item.APPLY_START_DATE),
                            APPLY_END_DATE: gfnma_nvl(item.APPLY_END_DATE),
                            WITHHOLD_RATE: gfnma_nvl(item.WITHHOLD_RATE),
                            MEMO: gfnma_nvl(item.MEMO),
                            USERID: gfnma_nvl(item.USERID),
                            USERTIME: gfnma_nvl(item.USERTIME)
                        }
                        jsonWithholdList.push(msg);
                    });

                    gvwWithholdGrid.rebuild();

                    fn_setData();

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

    const fn_setData = function () {

        let nRows = gvwInfoGrid.getRows();
        if (nRows < 1) {
            return;
        }


    }

    var tabJsonData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "급여정보",         "targetid" : "payInfoTab" , "targetvalue" : "급여정보"},
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "고정 수당항목",     "targetid" : "payTab" ,     "targetvalue" : "고정 수당항목"},
        { "id" : "2", "pid" : "-1", "order" : "3", "text" : "고정공제항목",      "targetid" : "dedTab" ,     "targetvalue" : "고정공제항목"},
        { "id" : "3", "pid" : "-1", "order" : "4", "text" : "변동수당항목",      "targetid" : "varPayTab" ,  "targetvalue" : "변동수당항목"},
        { "id" : "4", "pid" : "-1", "order" : "5", "text" : "변동공제항목",      "targetid" : "varDedTab" ,  "targetvalue" : "변동공제항목"},
        { "id" : "5", "pid" : "-1", "order" : "6", "text" : "급상여 예외항목",    "targetid" : "payExTab" ,   "targetvalue" : "급상여 예외항목"},
        { "id" : "6", "pid" : "-1", "order" : "7", "text" : "사회보험 가입이력",  "targetid" : "detailTab" ,  "targetvalue" : "사회보험 가입이력"},
        { "id" : "7", "pid" : "-1", "order" : "8", "text" : "보수월액",          "targetid" : "viewEx1Tab" , "targetvalue" : "보수월액"},
        { "id" : "8", "pid" : "-1", "order" : "9", "text" : "원천세징수비율",     "targetid" : "withholdTab" , "targetvalue" : "원천세징수비율"}
    ];

    // 행 추가 (급여정보)
    const fn_payInfoAddRow = function () {
        let rowVal = gvwPayInfoGrid.getRow();

        let today = new Date();

        var year = today.getFullYear();
        var month = ('0' + (today.getMonth() + 1)).slice(-2);
        var day = ('0' + today.getDate()).slice(-2);

        var dateString = year + month + day;

        /*if (rowVal == -1) {*/ //데이터가 없고 행선택이 없을경우.

            const msg = {
                APPLY_START_DATE: dateString,
                APPLY_END_DATE: dateString,
                MEMO: '',
                SALARY_BASE_AMT: '',
                JOB_BASE_AMT: '',
                OT_FIXED_BASE_AMT: '',
                ROLE_BASE_AMT: '',
                INCENTIVE_BASE_AMT: '',
                COMPETENCE_BASE_AMT: '',
                MONTHLY_SALARY_AMT: '',
                PAY_COUNT: '',
                INCENTIVE_ADD_AMT: '',
                BONUS_COUNT: '',
                ANNUAL_SALARY_AMT: '',
                INCENTIVE_MONTH_AMT: '',
                HOURLY_BASE_AMT: '',
                SUM_BASE_AMT: '',
                ANNUAL_BASE_AMT: '',
                USERID: '',
                USERTIME: '',
                DAILY_BASE_AMT: '',
                BONUS_BASE_AMT: '',
                CONTRIBUTE_BASE_AMT: '',
                ADJUST_BASE_AMT: '',

                status: 'i'
            }
            /*jsonPayInfoList.push(msg);*/

        gvwPayInfoGrid.addRow(true, msg);

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

        /* let comp_code = gfnma_nvl(SBUxMethod.get("srch-comp_code"));  공통처리 */
        let SITE_CODE = gfnma_nvl(SBUxMethod.get("srch-site_code"));
        let EMP_STATE = gfnma_nvl(SBUxMethod.get("srch-emp_state"));
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("srch-dept_code"));
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("srch-emp_code"));
        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type"));


        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd
            ,V_P_SITE_CODE: SITE_CODE
            ,V_P_DEPT_CODE: DEPT_CODE
            ,V_P_EMP_CODE: EMP_CODE
            ,V_P_EMP_STATE: EMP_STATE
            ,V_P_PAY_AREA_TYPE: PAY_AREA_TYPE
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
        console.log("----------------------------------------------",data);

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonGvwInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CREATE: gfnma_nvl(item.CREATE),
                        EMP_CODE: gfnma_nvl(item.EMP_CODE),
                        EMP_NAME: gfnma_nvl(item.EMP_NAME),
                        PAY_GROUP_CODE: gfnma_nvl(item.PAY_GROUP_CODE),
                        PAY_AREA_TYPE: gfnma_nvl(item.PAY_AREA_TYPE),
                        DUTY_CODE: gfnma_nvl(item.DUTY_CODE),
                        POSITION_CODE: gfnma_nvl(item.POSITION_CODE),
                        DEPT_NAME: gfnma_nvl(item.DEPT_NAME),
                        ENTER_DATE: gfnma_nvl(item.ENTER_DATE),
                        RETIRE_DATE: gfnma_nvl(item.RETIRE_DATE),
                        BANK_CODE: gfnma_nvl(item.BANK_CODE),
                        BANK_ACCOUNT_REAL: gfnma_nvl(item.BANK_ACCOUNT_REAL),
                        BANK_CODE2: gfnma_nvl(item.BANK_CODE2),
                        BANK_ACCOUNT2_REAL: gfnma_nvl(item.BANK_ACCOUNT2_REAL),
                        EMP_STATE: gfnma_nvl(item.EMP_STATE),
                        BANK_ACCOUNT: gfnma_nvl(item.BANK_ACCOUNT),
                        BANK_ACCOUNT2: gfnma_nvl(item.BANK_ACCOUNT2),
                        RET_PENS_BANK_CODE: gfnma_nvl(item.RET_PENS_BANK_CODE),
                        RET_PENS_BANK_ACC: gfnma_nvl(item.RET_PENS_BANK_ACC),
                        RET_PENS_BANK_ACC_REAL: gfnma_nvl(item.RET_PENS_BANK_ACC_REAL)

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

                fn_view('search');


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

        SBUxMethod.set("EMP_CODE", "");
        SBUxMethod.set("SITE_CODE", "");
        SBUxMethod.set("SALARY_CLASS", "");
        SBUxMethod.set("DEPT_CODE", "");
        SBUxMethod.set("EMP_TYPE", "");
        SBUxMethod.set("POSITION_CODE", "");
        SBUxMethod.set("ENTER_DATE", "");
        SBUxMethod.set("RETIRE_DATE", "");
        SBUxMethod.set("TEMP_END_DATE", "");
        SBUxMethod.set("BONUS_APPLY_START_DATE", "");

        SBUxMethod.set("BANK_ACCOUNT", "");
        SBUxMethod.set("BANK_CODE", "");
        SBUxMethod.set("BANK_ACCOUNT_REAL", 0);

        SBUxMethod.set("PAY_YN", "");
        SBUxMethod.set("BONUS_PAY_YN", "");
        SBUxMethod.set("RETIRE_PAY_YN", "");
        SBUxMethod.set("BANK_CODE2", "");
        SBUxMethod.set("BANK_ACCOUNT2_REAL", 0);
        SBUxMethod.set("BANK2_PAY_ITEM", "");
        SBUxMethod.set("LUNCH_PAY_YN", "");
        SBUxMethod.set("OVER_TIME_PAY_YN", "");
        SBUxMethod.set("OT_TAX_FREE_YN", "");
        SBUxMethod.set("RET_PENS_BANK_CODE", "");
        SBUxMethod.set("RET_PENS_BANK_ACC_REAL", "");
        SBUxMethod.set("MUTUAL_AID_MEMBER_YN", "");
        SBUxMethod.set("MONTHLY_DONATION_YN", "");
        SBUxMethod.set("INCOME_TAX_YN", "");
        SBUxMethod.set("MAIN_ACC_TYPE", "");
        SBUxMethod.set("SUPPORTEE_QTY", 0);
        SBUxMethod.set("CHILDREN_QTY", 0);

        gvwPayInfoGrid.clearStatus();
        gvwPayGrid.clearStatus();
        gvwDedGrid.clearStatus();
        gvwVarPayGrid.clearStatus();
        gvwVarDedGrid.clearStatus();
        gvwPayExGrid.clearStatus();
        gvwDetailGrid.clearStatus();
        gvwViewEx1Grid.clearStatus();
        gvwWithholdGrid.clearStatus();
        gvwHrpMasterGrid.clearStatus();

    }

    //저장
    const fn_save = async function () {

        let tabId = SBUxMethod.get('tabJson'); //현재탭 아이디

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            var paramObj =await getParamForm('u');

            if (_.isEmpty(paramObj)){
                return;
            }

            console.log("+++++++++++++++++ paramObj +++++++++++++++++++++++", paramObj);

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp1000.do", {
                getType: 'json',
                workType: 'N',
                cv_count: '0',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }
                    fn_saveS1();
                    /*fn_saveHis(obj.NUMBERING_ID); //채번이력 저장*/
                   /* fn_search(/!*tabId*!/);*/ //현재 저장했던 탭위치 ID를 넘겨준다.
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
    const fn_saveS1 = async function () {

        var paramObj = {
           P_HRP1000_S1: await getParamFormS1()
        }

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp1000S1.do",paramObj );

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                }
                fn_saveS2();
                /*fn_search(/!*tabId*!/); *///현재 저장했던 탭위치 ID를 넘겨준다.
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

    //저장
    const fn_saveS2 = async function () {

        var paramObj = {
            P_HRP1000_S2: await getParamFormS2()
        }

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp1000S2.do",paramObj );

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);
                }
                fn_search(/*tabId*/); //현재 저장했던 탭위치 ID를 넘겨준다.
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

    //삭제
    const fn_delete = async function () {

        let tabId = SBUxMethod.get('tabJson'); //현재탭 아이디

        if (gfn_comConfirm("Q0001", "삭제")) {

            var paramObj = await getParamForm('d');

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp1000.do", {
                getType: 'json',
                workType: 'D',
                cv_count: '0',
                params: gfnma_objectToString(paramObj)
            });
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }
                    fn_search(/*tabId*/);
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


    const getParamFormS1 = async function(){


        /**************** 중복체크 *******************/
        let chdate = gvwPayInfoGrid.getGridDataAll();

        // 고정 수당항목 중복체크
        chdate.forEach((item1, index1) => {

            //종료일이 시작일보다 작을경우
            if (item1.APPLY_START_DATE > item1.APPLY_END_DATE){
                gfn_comAlert("Q0000", "종료일자보다 큰 시작일자 지정은 불가능합니다."); //수정
                return;
            }

            chdate.forEach((item2, index2) => {

                //시작일 종료일이 같은 데이터가 있을경우
                if (index1 != index2 && item1.APPLY_START_DATE == item2.APPLY_START_DATE && item1.APPLY_END_DATE == item2.APPLY_END_DATE){
                    gfn_comAlert("Q0000", "동일한 기간(일자)정보가 존재합니다."); //수정
                    return;
                }

            });
        });
        /**************** 중복체크 *******************/



        let updatedData = gvwPayInfoGrid.getUpdateData(true, 'all');

        console.log("---------------updatedData--------------- : ", updatedData);
        let returnData = [];

        let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE"));


        updatedData.forEach((item, index) => {

        const param = {

            cv_count : '0',
            getType : 'json',
            workType : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
            params: gfnma_objectToString({
                V_P_DEBUG_MODE_YN			: ''
                ,V_P_LANG_ID				: ''
                ,V_P_COMP_CODE				: gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE			: gv_ma_selectedClntCd

                ,V_P_EMP_CODE: EMP_CODE
                ,V_P_APPLY_START_DATE: item.data.APPLY_START_DATE
                ,V_P_APPLY_END_DATE: item.data.APPLY_END_DATE
                ,V_P_ANNUAL_SALARY_AMT: item.data.ANNUAL_SALARY_AMT
                ,V_P_PAY_COUNT: item.data.PAY_COUNT
                ,V_P_SALARY_BASE_AMT: item.data.SALARY_BASE_AMT
                ,V_P_BONUS_BASE_AMT: item.data.BONUS_BASE_AMT
                ,V_P_INCENTIVE_BASE_AMT: item.data.INCENTIVE_BASE_AMT
                ,V_P_COMPETENCE_BASE_AMT: item.data.COMPETENCE_BASE_AMT
                ,V_P_DAILY_BASE_AMT: item.data.DAILY_BASE_AMT
                ,V_P_HOURLY_BASE_AMT: item.data.HOURLY_BASE_AMT
                ,V_P_INCENTIVE_ADD_AMT: item.data.INCENTIVE_ADD_AMT
                ,V_P_BONUS_COUNT: item.data.BONUS_COUNT
                ,V_P_INCENTIVE_MONTH_AMT: item.data.INCENTIVE_MONTH_AMT
                ,V_P_SUNDRY_ALLOW_AMT: ""
                ,V_P_QUALIFICN_ALLOW_AMT: ""
                ,V_P_JOB_BASE_AMT: item.data.JOB_BASE_AMT
                ,V_P_OT_FIXED_BASE_AMT: item.data.OT_FIXED_BASE_AMT
                ,V_P_CONTRIBUTE_BASE_AMT: item.data.CONTRIBUTE_BASE_AMT
                ,V_P_ADJUST_BASE_AMT: item.data.ADJUST_BASE_AMT
                ,V_P_ROLE_BASE_AMT: item.data.ROLE_BASE_AMT
                ,V_P_SALARY_AMT01: ""
                ,V_P_SALARY_AMT02: ""
                ,V_P_SALARY_AMT03: ""
                ,V_P_SALARY_AMT04: ""
                ,V_P_SALARY_AMT05: ""
                ,V_P_SALARY_AMT06: ""
                ,V_P_SALARY_AMT07: ""
                ,V_P_SALARY_AMT08: ""
                ,V_P_SALARY_AMT09: ""
                ,V_P_SALARY_AMT10: ""
                ,V_P_SALARY_AMT11: ""
                ,V_P_SALARY_AMT12: ""
                ,V_P_SALARY_AMT13: ""
                ,V_P_SALARY_AMT14: ""
                ,V_P_SALARY_AMT15: ""
                ,V_P_SALARY_AMT16: ""
                ,V_P_SALARY_AMT17: ""
                ,V_P_SALARY_AMT18: ""
                ,V_P_SALARY_AMT19: ""
                ,V_P_SALARY_AMT20: ""
                ,V_P_SALARY_AMT21: ""
                ,V_P_SALARY_AMT22: ""
                ,V_P_SALARY_AMT23: ""
                ,V_P_SALARY_AMT24: ""
                ,V_P_SALARY_AMT25: ""
                ,V_P_SALARY_AMT26: ""
                ,V_P_SALARY_AMT27: ""
                ,V_P_SALARY_AMT28: ""
                ,V_P_SALARY_AMT29: ""
                ,V_P_SALARY_AMT30: ""
                ,V_P_MEMO: item.data.MEMO

                ,V_P_FORM_ID: p_formId
                ,V_P_MENU_ID: p_menuId
                ,V_P_PROC_ID: ''
                ,V_P_USERID: ''
                ,V_P_PC: ''

            })
        }

        console.log("---------param--------- : ", param);
        returnData.push(param);

        });

        console.log("---------returnData--------- : ", returnData);
        return  returnData;

    }

    const getParamFormS2 = async function(){


        //중복체크를 해야할 경우
        //let chdate = gvwWithholdGrid.getGridDataAll();

        let updatedData = gvwWithholdGrid.getUpdateData(true, 'all');
        let returnData = [];

        let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE"));

        updatedData.forEach((item, index) => {

            const param = {

                cv_count : '0',
                getType : 'json',
                workType : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({

                        V_P_DEBUG_MODE_YN			: ''
                        ,V_P_LANG_ID				: ''
                        ,V_P_COMP_CODE				: gv_ma_selectedApcCd
                        ,V_P_CLIENT_CODE			: gv_ma_selectedClntCd

                        ,V_P_EMP_CODE: EMP_CODE
                        ,V_P_APPLY_START_DATE: item.data.APPLY_START_DATE
                        ,V_P_APPLY_END_DATE: item.data.APPLY_END_DATE
                        ,V_P_WITHHOLD_RATE: item.data.WITHHOLD_RATE
                        ,V_P_MEMO: item.data.MEMO

                        ,V_P_FORM_ID: p_formId
                        ,V_P_MENU_ID: p_menuId
                        ,V_P_PROC_ID: ''
                        ,V_P_USERID: ''
                        ,V_P_PC: ''

                })
            }
            returnData.push(param);
        });

        return  returnData;

    }

    const getParamForm = async function(typeData){

        let payData;//고정 수당항목
        let dedData; //고정공제항목
        let varPayData;  //변동수당항목
        let varDedData; //변동공제항목

        /*payData = gvwPayGrid.getGridDataAll(); //고정 수당항목
        dedData = gvwDedGrid.getGridDataAll(); //고정공제항목
        varPayData = gvwVarPayGrid.getGridDataAll();  //변동수당항목
        varDedData = gvwVarDedGrid.getGridDataAll(); //변동공제항목*/

        if (typeData == 'u'){ //업데이트

             payData = gvwPayGrid.getGridDataAll(); //고정 수당항목
             dedData = gvwDedGrid.getGridDataAll(); //고정공제항목
             varPayData = gvwVarPayGrid.getGridDataAll();  //변동수당항목
             varDedData = gvwVarDedGrid.getGridDataAll(); //변동공제항목

         }else if (typeData == 'd'){ // 삭제

             payData = gvwPayGrid.getUpdateData(true, 'd'); //고정 수당항목
             dedData = gvwDedGrid.getUpdateData(true, 'd'); //고정공제항목
             varPayData = gvwVarPayGrid.getUpdateData(true, 'd');  //변동수당항목
             varDedData = gvwVarDedGrid.getUpdateData(true, 'd'); //변동공제항목

         }


        let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE"));
        let SITE_CODE = gfnma_nvl(SBUxMethod.get("SITE_CODE"));
        let SALARY_CLASS = gfnma_nvl(SBUxMethod.get("SALARY_CLASS"));
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("DEPT_CODE"));
        let EMP_TYPE = gfnma_nvl(SBUxMethod.get("EMP_TYPE"));
        let POSITION_CODE = gfnma_nvl(SBUxMethod.get("POSITION_CODE"));
        let ENTER_DATE = gfnma_nvl(SBUxMethod.get("ENTER_DATE"));
        let RETIRE_DATE = gfnma_nvl(SBUxMethod.get("RETIRE_DATE"));
        let TEMP_END_DATE = gfnma_nvl(SBUxMethod.get("TEMP_END_DATE"));
        let BONUS_APPLY_START_DATE = gfnma_nvl(SBUxMethod.get("BONUS_APPLY_START_DATE"));

        let BANK_ACCOUNT = gfnma_nvl(SBUxMethod.get("BANK_ACCOUNT"));
        let PAY_GROUP_CODE = gfnma_nvl(SBUxMethod.get("PAY_GROUP_CODE"));
        let BANK_CODE = gfnma_nvl(SBUxMethod.get("BANK_CODE"));
        let BANK_ACCOUNT_REAL = gfnma_nvl(SBUxMethod.get("BANK_ACCOUNT_REAL"));

        let PAY_YN = gfnma_nvl(SBUxMethod.get("PAY_YN"));
        let BONUS_PAY_YN = gfnma_nvl(SBUxMethod.get("BONUS_PAY_YN"));
        let RETIRE_PAY_YN = gfnma_nvl(SBUxMethod.get("RETIRE_PAY_YN"));
        let BANK_CODE2 = gfnma_nvl(SBUxMethod.get("BANK_CODE2"));
        let BANK_ACCOUNT2_REAL = gfnma_nvl(SBUxMethod.get("BANK_ACCOUNT2_REAL"));
        let BANK2_PAY_ITEM = gfnma_nvl(SBUxMethod.get("BANK2_PAY_ITEM"));
        let LUNCH_PAY_YN = gfnma_nvl(SBUxMethod.get("LUNCH_PAY_YN"));
        let OVER_TIME_PAY_YN = gfnma_nvl(SBUxMethod.get("OVER_TIME_PAY_YN"));
        let OT_TAX_FREE_YN = gfnma_nvl(SBUxMethod.get("OT_TAX_FREE_YN"));
        let RET_PENS_BANK_CODE = gfnma_nvl(SBUxMethod.get("RET_PENS_BANK_CODE"));
        let RET_PENS_BANK_ACC_REAL = gfnma_nvl(SBUxMethod.get("RET_PENS_BANK_ACC_REAL"));
        let MUTUAL_AID_MEMBER_YN = gfnma_nvl(SBUxMethod.get("MUTUAL_AID_MEMBER_YN"));
        let MONTHLY_DONATION_YN = gfnma_nvl(SBUxMethod.get("MONTHLY_DONATION_YN"));
        let INCOME_TAX_YN = gfnma_nvl(SBUxMethod.get("INCOME_TAX_YN"));
        let MAIN_ACC_TYPE = gfnma_nvl(SBUxMethod.get("MAIN_ACC_TYPE"));
        let SUPPORTEE_QTY = gfnma_nvl(SBUxMethod.get("SUPPORTEE_QTY"));
        let CHILDREN_QTY = gfnma_nvl(SBUxMethod.get("CHILDREN_QTY"));



        /************고정,고정 수당/공제 항목 프로시저 변수************/
        let TYPETYPE = '';
        let TYPETXN_ID = '';
        let TYPEPAY_TYPE = '';
        let TYPEPAY_ITEM_CODE = '';
        let TYPEAPPLY_START_DATE = '';
        let TYPEAPPLY_END_DATE = '';
        let TYPEPAY_AMT = '';
        let TYPEPAY_MEMO = '';


        /************변동 수당/공제 항목************/
        let TYPETYPE1 = '';
        let TYPETXN_ID1 = '';
        let TYPEPAY_TYPE1 = '';
        let TYPEPAY_ITEM_CODE1 = '';
        let TYPEAPPLY_START_DATE1 = '';
        let TYPEPAY_AMT1 = '';
        let TYPEPAY_MEMO1 = '';
        let TYPETAX_PAY_DATE1 = '';

        //고정 수당/공제 그리드 정보를 | 로 묶어 한개의 변수로 조합
        /*let payData = gvwPayGrid.getGridDataAll();*/

        // 고정 수당항목 중복체크
        payData.forEach((item1, index1) => {
            payData.forEach((item2, index2) => {

                if (item1.PAY_TYPE == item2.PAY_TYPE && item1.PAY_ITEM_CODE == item2.PAY_ITEM_CODE
                    && item1.APPLY_START_DATE == item2.APPLY_START_DATE && item1.APPLY_END_DATE == item2.APPLY_END_DATE){
                    gfn_comAlert("Q0000", "중복된 수당항목이 존재합니다."); //수정
                    return;
                }

            });
        });

       /* let dedData = gvwDedGrid.getGridDataAll();*/
        // 고정 공제항목 중복체크
        dedData.forEach((item1, index1) => {
            dedData.forEach((item2, index2) => {

                if (item1.PAY_TYPE == item2.PAY_TYPE && item1.PAY_ITEM_CODE == item2.PAY_ITEM_CODE
                    && item1.APPLY_START_DATE == item2.APPLY_START_DATE && item1.APPLY_END_DATE == item2.APPLY_END_DATE){
                    gfn_comAlert("Q0000", "중복된 공제항목이 존재합니다."); //수정
                    return;
                }

            });
        });


        payData.forEach((item, index) => {
            if (index == 0){
                TYPETYPE = 'PAY';
                TYPETXN_ID = index.toString();
                TYPEPAY_TYPE = gfnma_nvl(item.PAY_TYPE);
                TYPEPAY_ITEM_CODE = gfnma_nvl(item.PAY_ITEM_CODE);
                TYPEAPPLY_START_DATE = gfnma_nvl(item.APPLY_START_DATE);
                TYPEAPPLY_END_DATE = gfnma_nvl(item.APPLY_END_DATE);
                TYPEPAY_AMT = gfnma_nvl(item.PAY_AMT);
                TYPEPAY_MEMO = gfnma_nvl(item.MEMO);
            }else {
                TYPETYPE += '|' + 'PAY';
                TYPETXN_ID += '|' + index.toString();
                TYPEPAY_TYPE += '|' + gfnma_nvl(item.PAY_TYPE);
                TYPEPAY_ITEM_CODE += '|' + gfnma_nvl(item.PAY_ITEM_CODE);
                TYPEAPPLY_START_DATE += '|' + gfnma_nvl(item.APPLY_START_DATE);
                TYPEAPPLY_END_DATE += '|' + gfnma_nvl(item.APPLY_END_DATE);
                TYPEPAY_AMT += '|' + gfnma_nvl(item.PAY_AMT);
                TYPEPAY_MEMO += '|' + gfnma_nvl(item.MEMO);
            }
        });

        dedData.forEach((item, index) => {
            if (index == 0){

                if (TYPETYPE != ''){
                    TYPETYPE += '|';
                    TYPETXN_ID += '|';
                    TYPEPAY_TYPE += '|';
                    TYPEPAY_ITEM_CODE += '|';
                    TYPEAPPLY_START_DATE += '|';
                    TYPEAPPLY_END_DATE += '|';
                    TYPEPAY_AMT += '|';
                    TYPEPAY_MEMO += '|';
                }

                TYPETYPE += gfnma_nvl(item.PAY_ITEM_CATEGORY);
                TYPETXN_ID += index.toString();  // 순번
                TYPEPAY_TYPE += gfnma_nvl(item.PAY_TYPE);
                TYPEPAY_ITEM_CODE += gfnma_nvl(item.PAY_ITEM_CODE);
                TYPEAPPLY_START_DATE += gfnma_nvl(item.APPLY_START_DATE);
                TYPEAPPLY_END_DATE += gfnma_nvl(item.APPLY_END_DATE);
                TYPEPAY_AMT += gfnma_nvl(item.PAY_AMT);
                TYPEPAY_MEMO += gfnma_nvl(item.MEMO);
            }else {
                TYPETYPE += '|' + gfnma_nvl(item.PAY_ITEM_CATEGORY);
                TYPETXN_ID += '|' + index.toString();
                TYPEPAY_TYPE += '|' + gfnma_nvl(item.PAY_TYPE);
                TYPEPAY_ITEM_CODE += '|' + gfnma_nvl(item.PAY_ITEM_CODE);
                TYPEAPPLY_START_DATE += '|' + gfnma_nvl(item.APPLY_START_DATE);
                TYPEAPPLY_END_DATE += '|' + gfnma_nvl(item.APPLY_END_DATE);
                TYPEPAY_AMT += '|' + gfnma_nvl(item.PAY_AMT);
                TYPEPAY_MEMO += '|' + gfnma_nvl(item.MEMO);
            }
        });


        /*let varPayData = gvwVarPayGrid.getGridDataAll();*/

        console.log("++++++++++++++++++++ varPayData +++++++++++++++++++++++++++ :", varPayData);
        varPayData.forEach((item, index) => {
            if (index == 0){
                TYPETYPE1 = 'PAY';
                TYPETXN_ID1 = index.toString();
                TYPEPAY_TYPE1 = gfnma_nvl(item.PAY_TYPE);
                TYPEPAY_ITEM_CODE1 = gfnma_nvl(item.PAY_ITEM_CODE);
                TYPEAPPLY_START_DATE1 = gfnma_nvl(item.APPLY_START_DATE);
                TYPEPAY_AMT1 = gfnma_nvl(item.PAY_AMT);
                TYPEPAY_MEMO1 = gfnma_nvl(item.MEMO);
                TYPETAX_PAY_DATE1 = gfnma_nvl(item.TAX_PAY_DATE);

            }else {
                TYPETYPE1 += '|' + 'PAY';
                TYPETXN_ID1 += '|' + index.toString();
                TYPEPAY_TYPE1 += '|' + gfnma_nvl(item.PAY_TYPE);
                TYPEPAY_ITEM_CODE1 += '|' + gfnma_nvl(item.PAY_ITEM_CODE);
                TYPEAPPLY_START_DATE1 += '|' + gfnma_nvl(item.APPLY_START_DATE);
                TYPEPAY_AMT1 += '|' + gfnma_nvl(item.PAY_AMT);
                TYPEPAY_MEMO1 += '|' + gfnma_nvl(item.MEMO);
                TYPETAX_PAY_DATE1 += '|' + gfnma_nvl(item.TAX_PAY_DATE);
            }
        });

        /*let varDedData = gvwVarDedGrid.getGridDataAll();*/

        console.log("++++++++++++++++++++ varDedData +++++++++++++++++++++++++++ :", varDedData);
        varDedData.forEach((item, index) => {
            if (index == 0){

                if (TYPETYPE1 != ''){
                    TYPETYPE1 += '|';
                    TYPETXN_ID1 += '|';
                    TYPEPAY_TYPE1 += '|';
                    TYPEPAY_ITEM_CODE1 += '|';
                    TYPEAPPLY_START_DATE1 += '|';
                    TYPEPAY_AMT1 += '|';
                    TYPEPAY_MEMO1 += '|';
                    TYPETAX_PAY_DATE1 += '|';
                }

                TYPETYPE1 += 'DED';
                TYPETXN_ID1 += index.toString();
                TYPEPAY_TYPE1 += gfnma_nvl(item.PAY_TYPE);
                TYPEPAY_ITEM_CODE1 += gfnma_nvl(item.PAY_ITEM_CODE);
                TYPEAPPLY_START_DATE1 += gfnma_nvl(item.APPLY_START_DATE);
                TYPEPAY_AMT1 += gfnma_nvl(item.PAY_AMT);
                TYPEPAY_MEMO1 += gfnma_nvl(item.MEMO);
                TYPETAX_PAY_DATE1 += gfnma_nvl(item.TAX_PAY_DATE);

            }else {
                TYPETYPE1 += '|' + 'DED';
                TYPETXN_ID1 += '|' + index.toString();
                TYPEPAY_TYPE1 += '|' + gfnma_nvl(item.PAY_TYPE);
                TYPEPAY_ITEM_CODE1 += '|' + gfnma_nvl(item.PAY_ITEM_CODE);
                TYPEAPPLY_START_DATE1 += '|' + gfnma_nvl(item.APPLY_START_DATE);
                TYPEPAY_AMT1 += '|' + gfnma_nvl(item.PAY_AMT);
                TYPEPAY_MEMO1 += '|' + gfnma_nvl(item.MEMO);
                TYPETAX_PAY_DATE1 += '|' + gfnma_nvl(item.TAX_PAY_DATE);
            }
        });

        let hrpMasterDatas = gvwHrpMasterGrid.getGridDataAll();

        var date = new Date();
        var lastDate = date.getFullYear()+("0"+(date.getMonth()+1)).slice(-2)+("0"+date.getDate()).slice(-2);

        let RET_PENS_BANK_ACC = '';
        let PENSION_YN = '';
        let PENSION_JOIN_DATE = '';
        let PENSION_CLOSE_DATE = '';
        let PENSION_NO= '';
        let PENSION_BASE_AMT = '';//디폴트값 셋팅
        let HEALTH_INSURE_YN = '';//디폴트값 셋팅
        let HEALTH_INSURE_JOIN_DATE = '';
        let HEALTH_INSURE_CLOSE_DATE = '';
        let HEALTH_INSURE_NO = '';
        let HEALTH_INSURE_BASE_AMT = '';//디폴트값 셋팅
        let EMPLOY_INSURE_YN = '';//디폴트값 셋팅
        let EMPLOY_INSURE_BASE_AMT = '';
        let APPLICATION_RATE = '';//디폴트값 셋팅
        let LAST_APPLICATION_DATE = '';//디폴트값 셋팅
        let LONGTERM_CARE_YN = '';

        console.log("+++++++++++++++++++hrpMasterDatas+++++++++++++++++++++++++++  : ",hrpMasterDatas);

        hrpMasterDatas.forEach((item, index) => {
                RET_PENS_BANK_ACC= gfnma_nvl(item.RET_PENS_BANK_ACC);
                PENSION_YN= gfnma_nvl(item.PENSION_YN);
                PENSION_JOIN_DATE= gfnma_nvl(item.PENSION_JOIN_DATE);
                PENSION_CLOSE_DATE= gfnma_nvl(item.PENSION_CLOSE_DATE);
                PENSION_NO= gfnma_nvl(item.PENSION_NO);
                PENSION_BASE_AMT= gfnma_nvl(item.PENSION_BASE_AMT);
                HEALTH_INSURE_YN= gfnma_nvl(item.HEALTH_INSURE_YN);
                HEALTH_INSURE_JOIN_DATE= gfnma_nvl(item.HEALTH_INSURE_JOIN_DATE);
                HEALTH_INSURE_CLOSE_DATE= gfnma_nvl(item.HEALTH_INSURE_CLOSE_DATE);
                HEALTH_INSURE_NO= gfnma_nvl(item.HEALTH_INSURE_NO);
                HEALTH_INSURE_BASE_AMT= gfnma_nvl(item.HEALTH_INSURE_BASE_AMT);
                EMPLOY_INSURE_YN= gfnma_nvl(item.EMPLOY_INSURE_YN);
                EMPLOY_INSURE_BASE_AMT= gfnma_nvl(item.EMPLOY_INSURE_BASE_AMT);
                APPLICATION_RATE= gfnma_nvl(item.APPLICATION_RATE);
                LAST_APPLICATION_DATE= gfnma_nvl(item.LAST_APPLICATION_DATE);
                LONGTERM_CARE_YN= gfnma_nvl(item.LONGTERM_CARE_YN);
        });

        //디폴트값 셋팅
        if(PAY_YN ==''){
            PAY_YN = 'Y';
        }else if(BONUS_PAY_YN == ''){
            BONUS_PAY_YN = 'N';
        }else if(RETIRE_PAY_YN == ''){
            RETIRE_PAY_YN = 'Y';
        }else if(OVER_TIME_PAY_YN == ''){
            OVER_TIME_PAY_YN = 'Y';
        }else if(INCOME_TAX_YN == ''){
            INCOME_TAX_YN = 'Y';
        }else if(SUPPORTEE_QTY == ''){
            SUPPORTEE_QTY = 1;
        }else if(PENSION_YN == ''){
            PENSION_YN = 'Y';
        }else if(HEALTH_INSURE_YN == ''){
            HEALTH_INSURE_YN = 'Y';
        }else if(EMPLOY_INSURE_YN == ''){
            EMPLOY_INSURE_YN = 'Y';
        }else if(PENSION_BASE_AMT == ''){
            PENSION_BASE_AMT = 1;
        }else if(HEALTH_INSURE_BASE_AMT == ''){
            HEALTH_INSURE_BASE_AMT = 0;
        }else if(APPLICATION_RATE == ''){
            APPLICATION_RATE = 100;
        }else if(LAST_APPLICATION_DATE == ''){
            var date = new Date();
            var lastDate = date.getFullYear()+("0"+(date.getMonth()+1)).slice(-2)+("0"+date.getDate()).slice(-2);
            LAST_APPLICATION_DATE = lastDate;
        }


        let paramObj = {
                V_P_DEBUG_MODE_YN	: ''
                ,V_P_LANG_ID		: ''
                ,V_P_COMP_CODE		: gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd

                ,V_P_TYPEEMP_CODE: EMP_CODE
                ,V_P_TYPESALARY_CLASS: SALARY_CLASS
                ,V_P_TYPETEMP_END_DATE: TEMP_END_DATE
                ,V_P_TYPEBONUS_APPLY_START_DATE: BONUS_APPLY_START_DATE
                ,V_P_TYPEPAY_GROUP_CODE: PAY_GROUP_CODE
                ,V_P_TYPEPAY_YN: PAY_YN.PAY_YN
                ,V_P_TYPEBONUS_PAY_YN: BONUS_PAY_YN.BONUS_PAY_YN
                ,V_P_TYPERETIRE_PAY_YN: RETIRE_PAY_YN.RETIRE_PAY_YN
                ,V_P_TYPESUPPORTEE_QTY: SUPPORTEE_QTY
                ,V_P_TYPECHILDREN_QTY: CHILDREN_QTY
                ,V_P_TYPELUNCH_PAY_YN: LUNCH_PAY_YN.LUNCH_PAY_YN
                ,V_P_TYPEMUTUAL_AID_MEMBER_YN: MUTUAL_AID_MEMBER_YN.MUTUAL_AID_MEMBER_YN
                ,V_P_TYPEMONTHLY_DONATION_YN: MONTHLY_DONATION_YN.MONTHLY_DONATION_YN
                ,V_P_TYPEOVER_TIME_PAY_YN: OVER_TIME_PAY_YN.OVER_TIME_PAY_YN
                ,V_P_TYPEINCOME_TAX_YN: INCOME_TAX_YN.INCOME_TAX_YN
                ,V_P_TYPEOT_TAX_FREE_YN: OT_TAX_FREE_YN.OT_TAX_FREE_YN
                ,V_P_TYPEPENSION_YN: PENSION_YN
                ,V_P_TYPEPENSION_JOIN_DATE: ''
                ,V_P_TYPEPENSION_CLOSE_DATE: ''
                ,V_P_TYPEPENSION_NO: ''
                ,V_P_TYPEPENSION_BASE_AMT: PENSION_BASE_AMT
                ,V_P_TYPEHEALTH_INSURE_YN: HEALTH_INSURE_YN
                ,V_P_TYPEHEALTH_INSURE_JOIN_DATE: ''
                ,V_P_TYPEHEALTH_INSURE_CLOSE_DATE: ''
                ,V_P_TYPEHEALTH_INSURE_NO: ''
                ,V_P_TYPEHEALTH_INSURE_BASE_AMT: HEALTH_INSURE_BASE_AMT
                ,V_P_TYPEEMPLOY_INSURE_YN: EMPLOY_INSURE_YN
                ,V_P_TYPEEMPLOY_INSURE_BASE_AMT: EMPLOY_INSURE_BASE_AMT
                ,V_P_TYPEMAIN_ACC_TYPE: MAIN_ACC_TYPE
                ,V_P_TYPEBANK_CODE: BANK_CODE
                ,V_P_TYPEBANK_ACCOUNT: BANK_ACCOUNT
                ,V_P_TYPEBANK_ACCOUNT_ORIG: ""
                ,V_P_TYPEBANK_CODE2: BANK_CODE2
                ,V_P_TYPEBANK_ACCOUNT2: BANK_ACCOUNT2_REAL
                ,V_P_TYPEBANK_ACCOUNT2_ORIG: ""
                ,V_P_TYPEIRP_BANK_CODE: ""
                ,V_P_TYPEIRP_BANK_ACCOUNT: ""
                ,V_P_TYPEIRP_BANK_ACCOUNT_ORIG: ""
                ,V_P_TYPEAPPLICATION_RATE: APPLICATION_RATE
                ,V_P_TYPELAST_APPLICATION_DATE: LAST_APPLICATION_DATE
                ,V_P_TYPELONGTERM_CARE_YN: LONGTERM_CARE_YN
                ,V_P_TYPEBANK2_PAY_ITEM: BANK2_PAY_ITEM

                /*-- 고정 수당/공제 항목*/
                ,V_P_TYPETYPE: TYPETYPE
                ,V_P_TYPETXN_ID: TYPETXN_ID
                ,V_P_TYPEPAY_TYPE: TYPEPAY_TYPE
                ,V_P_TYPEPAY_ITEM_CODE: TYPEPAY_ITEM_CODE
                ,V_P_TYPEAPPLY_START_DATE: TYPEAPPLY_START_DATE
                ,V_P_TYPEAPPLY_END_DATE: TYPEAPPLY_END_DATE
                ,V_P_TYPEPAY_AMT: TYPEPAY_AMT
                ,V_P_TYPEPAY_MEMO: TYPEPAY_MEMO

                /*-- 변동 수당/공제 항목*/
                ,V_P_TYPETYPE1: TYPETYPE1
                ,V_P_TYPETXN_ID1: TYPETXN_ID1
                ,V_P_TYPEPAY_TYPE1: TYPEPAY_TYPE1
                ,V_P_TYPEPAY_ITEM_CODE1: TYPEPAY_ITEM_CODE1
                ,V_P_TYPEAPPLY_START_DATE1: TYPEAPPLY_START_DATE1
                ,V_P_TYPEPAY_AMT1: TYPEPAY_AMT1
                ,V_P_TYPEPAY_MEMO1: TYPEPAY_MEMO1
                ,V_P_TYPETAX_PAY_DATE1: TYPETAX_PAY_DATE1
                /*-----------------------------------*/
                ,V_P_FORM_ID		: p_formId
                ,V_P_MENU_ID		: p_menuId
                ,V_P_PROC_ID		: ''
                ,V_P_USERID			: ''
                ,V_P_PC				: ''
            }


        return paramObj;
    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
