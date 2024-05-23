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
        <table class="table table-bordered tbl_fixed">
            <caption>검색 조건 설정</caption>
            <colgroup>
                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 6%">
                <col style="width: 5%">

                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 6%">
                <col style="width: 3%">

                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 6%">
                <col style="width: 3%">
                <col style="width: 3%">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row" class="th_bg">법인</th>
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
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">사업장</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="srch-site_code"
                            name="srch-site_code"
                            class="form-control input-sm"
                            jsondata-ref="jsonSiteCode"
                    />
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
                <td class="td_input td_input_dtl" style="border-left:hidden">
                    <sbux-button
                            uitype="normal" id="srch-btn-add" name="srch-btn-add"
                            class="btn btn-sm btn-outline-danger" text="변동항목추가" onclick="">
                    </sbux-button>
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">부서</th>
                <td colspan="" class="td_input" style="border-right:hidden;">
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
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">사원</th>
                <td colspan="" class="td_input" style="border-right:hidden;">
                    <sbux-input id="srch-emp_code" uitype="text" style="width:200px" placeholder=""
                                class="form-control input-sm"></sbux-input>
                </td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="srch-emp_full_name"
                            name="srch-emp_full_name"
                            class="form-control input-sm"
                            jsondata-ref=""
                    />
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
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="SITE_CODE"
                                        name="SITE_CODE"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonSiteCode"
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
                            <sbux-input id="supportee_qty" uitype="text" style="width:100%" placeholder=""
                                        class="form-control input-sm" mask = "{ 'alias': 'numeric'}" maxlength="2"></sbux-input>
                        </td>
                        <td colspan="" class="td_input" style="border-right:hidden;">
                        <th scope="row" class="th_bg">20세미만자녀수</th>
                        <td colspan="2" class="td_input" style="border-right:hidden;">
                            <sbux-input id="children_qty" uitype="text" style="width:90%" placeholder=""
                                        class="form-control input-sm" mask = "{ 'alias': 'numeric'}" maxlength="2"></sbux-input>
                        </td>
                    </tr>
                </table>


                <sbux-tabs id="idxtabTopJson" name="tabTopJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false">
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
                    <div id="sb-area-grwHrimaster" style="height:283px; width:100%; display: none;" ></div>
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


    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        //지역
        gfnma_setComSelect(['srch-comp_code'], jsonCompCode, 'L_ORG000', '', '', 'COMP_CODE', 'COMP_NAME', 'Y', ''),
        gfnma_setComSelect(['srch-site_code','SITE_CODE'], jsonSiteCode, 'L_ORG001', '', '', 'SITE_CODE', 'SITE_NAME', 'Y', ''),
        gfnma_setComSelect(['srch-emp_state','EMP_STATE'], jsonEmpState, 'L_HRI009', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['SALARY_CLASS'], jsonSalaryClass, 'L_HRI011', '', '', 'GRADE_HOBONG_CODE', 'GRADE_HOBONG_NAME', 'Y', ''),
        gfnma_setComSelect(['EMP_TYPE'], jsonEmpType, 'L_HRI008', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['POSITION_CODE'], jsonPositionCode, 'L_HRI002', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect(['PAY_GROUP_CODE'], jsonPayGroupCode, 'L_HRI010', '', '', 'PAY_GROUP_CODE', 'PAY_GROUP_NAME', 'Y', ''),
        gfnma_setComSelect(['BANK_CODE','BANK_CODE2','RET_PENS_BANK_CODE'], jsonBankCode, 'L_BANK_CODE', '', '', 'BANK_CODE', 'BANK_NAME', 'Y', ''),
        //gfnma_setComSelect(['srch-pay_area_type'], jsonBank2PayItem, 'L_HRP063', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', '')
        gfnma_setComSelect([''], jsonDutyCode, 'L_HRI003', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonPayType, 'L_HRB008', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonPayItemCode, 'L_HRP001', '', '', 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonPayItemCode2, 'L_HRP002', '', '', 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonPayItemCode3, 'L_HRP009', '', '', 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonPayItemCode4, 'L_HRP037', '', '', 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonPayItemCode5, 'L_HRP004', '', '', 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonPayApplyType, 'L_HRP021', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonInsuType, 'L_HRW018', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonInsuReasonType, 'L_HRW019', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonInsuStateType, 'L_HRW021', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonInsuRegType, 'L_HRW020', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonApplyType, 'L_HRW023', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonLongApplyType, 'L_HRW022', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        gfnma_setComSelect([''], jsonUser, 'L_USER', '', '', 'USER_ID', 'USER_NAME', 'Y', '')

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

            {caption: ["기본일급"], ref: 'DAILY_BASE_AMT', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["상여기본급"], ref: 'BONUS_BASE_AMT', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["기여시급"], ref: 'CONTRIBUTE_BASE_AMT', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["조정수당"], ref: 'ADJUST_BASE_AMT', type: 'output', width: '100px', style: 'text-align:left', hidden: true}

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
            {caption: ['적용시작일'], ref: 'APPLY_START_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
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

    /*//인사정보
    function fn_createHrimasterGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwHrimaster';
        SBGridProperties.id = 'gvwHrimasterGrid';
        SBGridProperties.jsonref = 'jsonHrimasterList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /!*SBGridProperties.allowcopy = true; //복사*!/
        SBGridProperties.explorerbar = 'sortmove';
        /!*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*!/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사원"], ref: 'EMP_FULL_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사업장"], ref: 'SITE_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["부서"], ref: 'DEPT_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["부서명"], ref: 'DEPT_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사원구분"], ref: 'EMP_TYPE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["직위"], ref: 'POSITION_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["입사일"], ref: 'ENTER_DATE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["퇴사일"], ref: 'RETIRE_DATE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["여수습종료일"], ref: 'TEMP_END_DATE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["상여적용시작일"], ref: 'BONUS_APPLY_START_DATE', type: 'output', width: '100px', style: 'text-align:left'}
        ];

        gvwHrimasterGrid = _SBGrid.create(SBGridProperties);
    }*/

    /*//급여 기본 사항, 사회보험
    function fn_createHrpmasterGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwHrpmaster';
        SBGridProperties.id = 'gvwHrpmasterGrid';
        SBGridProperties.jsonref = 'jsonHrpmasterList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /!*SBGridProperties.allowcopy = true; //복사*!/
        SBGridProperties.explorerbar = 'sortmove';
        /!*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*!/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["급여체계"], ref: 'pay_group_code', type: 'output', width: '100px', style: 'text-align:left'},



            {caption: ["사원"], ref: 'EMP_FULL_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사업장"], ref: 'SITE_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["부서"], ref: 'DEPT_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["부서명"], ref: 'DEPT_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사원구분"], ref: 'EMP_TYPE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["직위"], ref: 'POSITION_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["입사일"], ref: 'ENTER_DATE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["퇴사일"], ref: 'RETIRE_DATE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["여수습종료일"], ref: 'TEMP_END_DATE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["상여적용시작일"], ref: 'BONUS_APPLY_START_DATE', type: 'output', width: '100px', style: 'text-align:left'}
        ];

        gvwHrimasterGrid = _SBGrid.create(SBGridProperties);
    }*/


    //상세정보 보기
    async function fn_view(date) {

        console.log("----------------fn_view : date -----------------   ", date);


        let nCol = gvwInfoGrid.getCol();
        let nRow = gvwInfoGrid.getRow();

        if(date == '' || date == null) {
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

        console.log("----------------fn_view : rowData -----------------   ", rowData);

        if(rowData != null && rowData != '') {

            var paramObj = {
                V_P_DEBUG_MODE_YN: 'N'
                , V_P_LANG_ID: 'KOR'
                , V_P_COMP_CODE: '1000'
                , V_P_CLIENT_CODE: '100'
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

            try {
                if (_.isEqual("S", data.resultStatus)) {


                    /*****************인사정보********************/
                    let dataCv2 = data.cv_2;
                    SBUxMethod.set("EMP_CODE", dataCv2.EMP_CODE);
                    SBUxMethod.set("EMP_FULL_NAME", dataCv2.EMP_FULL_NAME);
                    SBUxMethod.set("SITE_CODE", dataCv2.SITE_CODE);
                    SBUxMethod.set("DEPT_CODE", dataCv2.DEPT_CODE);
                    SBUxMethod.set("DEPT_NAME", dataCv2.DEPT_NAME);
                    SBUxMethod.set("EMP_TYPE", dataCv2.EMP_TYPE);
                    SBUxMethod.set("POSITION_CODE", dataCv2.POSITION_CODE);
                    SBUxMethod.set("ENTER_DATE", dataCv2.ENTER_DATE);
                    SBUxMethod.set("RETIRE_DATE", dataCv2.RETIRE_DATE);
                    SBUxMethod.set("TEMP_END_DATE", dataCv2.TEMP_END_DATE);
                    SBUxMethod.set("BONUS_APPLY_START_DATE", dataCv2.BONUS_APPLY_START_DATE);

                    /*****************급여 기본 사항, 사회보험********************/
                    let dataCv3 = data.cv_3;

                    SBUxMethod.set("BANK_ACCOUNT", dataCv3.BANK_ACCOUNT);
                    SBUxMethod.set("BANK_CODE", dataCv3.BANK_CODE);
                    SBUxMethod.set("BANK_ACCOUNT_REAL", dataCv3.BANK_ACCOUNT_REAL);

                    SBUxMethod.set("PAY_YN", dataCv3.PAY_YN);
                    SBUxMethod.set("BONUS_PAY_YN", dataCv3.BONUS_PAY_YN);
                    SBUxMethod.set("RETIRE_PAY_YN", dataCv3.RETIRE_PAY_YN);
                    SBUxMethod.set("BANK_CODE2", dataCv3.BANK_CODE2);
                    SBUxMethod.set("BANK_ACCOUNT2_REAL", dataCv3.BANK_ACCOUNT2_REAL);
                    SBUxMethod.set("BANK2_PAY_ITEM", dataCv3.BANK2_PAY_ITEM);
                    SBUxMethod.set("LUNCH_PAY_YN", dataCv3.LUNCH_PAY_YN);
                    SBUxMethod.set("OVER_TIME_PAY_YN", dataCv3.OVER_TIME_PAY_YN);
                    SBUxMethod.set("OT_TAX_FREE_YN", dataCv3.OT_TAX_FREE_YN);
                    SBUxMethod.set("RET_PENS_BANK_CODE", dataCv3.RET_PENS_BANK_CODE);
                    SBUxMethod.set("RET_PENS_BANK_ACC_REAL", dataCv3.RET_PENS_BANK_ACC_REAL);
                    SBUxMethod.set("MUTUAL_AID_MEMBER_YN", dataCv3.MUTUAL_AID_MEMBER_YN);
                    SBUxMethod.set("MONTHLY_DONATION_YN", dataCv3.MONTHLY_DONATION_YN);
                    SBUxMethod.set("INCOME_TAX_YN", dataCv3.INCOME_TAX_YN);
                    SBUxMethod.set("MAIN_ACC_TYPE", dataCv3.MAIN_ACC_TYPE);
                    SBUxMethod.set("SUPPORTEE_QTY", dataCv3.SUPPORTEE_QTY);
                    SBUxMethod.set("CHILDREN_QTY", dataCv3.CHILDREN_QTY);


                    /*****************급여정보********************/
                    data.cv_4.forEach((item, index) => {
                        const msg = {
                            APPLY_START_DATE: item.APPLY_START_DATE,
                            APPLY_END_DATE: item.APPLY_END_DATE,
                            MEMO: item.MEMO,
                            SALARY_BASE_AMT: item.SALARY_BASE_AMT,
                            JOB_BASE_AMT: item.JOB_BASE_AMT,
                            OT_FIXED_BASE_AMT: item.OT_FIXED_BASE_AMT,
                            ROLE_BASE_AMT: item.ROLE_BASE_AMT,
                            INCENTIVE_BASE_AMT: item.INCENTIVE_BASE_AMT,
                            COMPETENCE_BASE_AMT: item.COMPETENCE_BASE_AMT,
                            MONTHLY_SALARY_AMT: item.MONTHLY_SALARY_AMT,
                            PAY_COUNT: item.PAY_COUNT,
                            INCENTIVE_ADD_AMT: item.INCENTIVE_ADD_AMT,
                            BONUS_COUNT: item.BONUS_COUNT,
                            ANNUAL_SALARY_AMT: item.ANNUAL_SALARY_AMT,
                            INCENTIVE_MONTH_AMT: item.INCENTIVE_MONTH_AMT,
                            HOURLY_BASE_AMT: item.HOURLY_BASE_AMT,
                            SUM_BASE_AMT: item.SUM_BASE_AMT,
                            ANNUAL_BASE_AMT: item.ANNUAL_BASE_AMT,
                            USERID: item.USERID,
                            USERTIME: item.USERTIME,
                            DAILY_BASE_AMT: item.DAILY_BASE_AMT,
                            BONUS_BASE_AMT: item.BONUS_BASE_AMT,
                            CONTRIBUTE_BASE_AMT: item.CONTRIBUTE_BASE_AMT,
                            ADJUST_BASE_AMT: item.ADJUST_BASE_AMT
                        }
                        jsonPayInfoList.push(msg);
                    });

                    gvwPayInfoGrid.rebuild();

                    /*****************고정 수당항목********************/
                    data.cv_5.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE: item.PAY_TYPE,
                            PAY_ITEM_CODE: item.PAY_ITEM_CODE,
                            PAY_AMT: item.PAY_AMT,
                            APPLY_START_DATE: item.APPLY_START_DATE,
                            APPLY_END_DATE: item.APPLY_END_DATE,
                            USERID: item.USERID,
                            USERTIME: item.USERTIME,
                            MEMO: item.MEMO,
                            TXN_ID: item.TXN_ID
                        }
                        jsonPayList.push(msg);
                    });

                    gvwPayGrid.rebuild();

                    /*****************고정공제항목********************/
                    data.cv_6.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE: item.PAY_TYPE,
                            PAY_ITEM_CODE: item.PAY_ITEM_CODE,
                            PAY_AMT: item.PAY_AMT,
                            APPLY_START_DATE: item.APPLY_START_DATE,
                            APPLY_END_DATE: item.APPLY_END_DATE,
                            USERID: item.USERID,
                            USERTIME: item.USERTIME,
                            MEMO: item.MEMO,
                            PAY_ITEM_CATEGORY: item.PAY_ITEM_CATEGORY,
                            TXN_ID: item.TXN_ID
                        }
                        jsonDedList.push(msg);
                    });

                    gvwDedGrid.rebuild();

                    /*****************변동수당항목********************/
                    data.cv_8.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE: item.PAY_TYPE,
                            PAY_ITEM_CODE: item.PAY_ITEM_CODE,
                            PAY_AMT: item.PAY_AMT,
                            APPLY_START_DATE: item.APPLY_START_DATE,
                            TAX_PAY_DATE: item.TAX_PAY_DATE,
                            APPLY_END_DATE: item.APPLY_END_DATE,
                            MEMO: item.MEMO,
                            USERID: item.USERID,
                            USERTIME: item.USERTIME,
                            TXN_ID: item.TXN_ID
                        }
                        jsonVarPayList.push(msg);
                    });

                    gvwVarPayGrid.rebuild();

                    /*****************변동공제항목********************/
                    data.cv_9.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE: item.PAY_TYPE,
                            PAY_ITEM_CODE: item.PAY_ITEM_CODE,
                            PAY_AMT: item.PAY_AMT,
                            APPLY_START_DATE: item.APPLY_START_DATE,
                            TAX_PAY_DATE: item.TAX_PAY_DATE,
                            APPLY_END_DATE: item.APPLY_END_DATE,
                            MEMO: item.MEMO,
                            USERID: item.USERID,
                            USERTIME: item.USERTIME,
                            TXN_ID: item.TXN_ID
                        }
                        jsonVarDedList.push(msg);
                    });

                    gvwVarDedGrid.rebuild();

                    /*****************급상여 예외항목********************/
                    data.cv_10.forEach((item, index) => {
                        const msg = {
                            PAY_TYPE: item.PAY_TYPE,
                            PAY_ITEM_CODE: item.PAY_ITEM_CODE,
                            PAY_AMT: item.PAY_AMT,
                            APPLY_START_DATE: item.APPLY_START_DATE,
                            APPLY_END_DATE: item.APPLY_END_DATE,
                            PAY_APPLY_TYPE: item.PAY_APPLY_TYPE,
                            PAY_APPLY_RATE: item.PAY_APPLY_RATE,
                            PAY_APPLY_AMT: item.PAY_APPLY_AMT,
                            USERID: item.USERID,
                            USERTIME: item.USERTIME,
                            MEMO: item.MEMO
                        }
                        jsonPayExList.push(msg);
                    });

                    gvwPayExGrid.rebuild();

                    /*****************사회보험 가입이력********************/
                    data.cv_11.forEach((item, index) => {
                        const msg = {
                            INSU_TYPE: item.INSU_TYPE,
                            START_DATE: item.START_DATE,
                            END_DATE: item.END_DATE,
                            INSU_REASON_TYPE: item.INSU_REASON_TYPE,
                            INSU_STATE_TYPE: item.INSU_STATE_TYPE,
                            INSU_REG_TYPE: item.INSU_REG_TYPE,
                            INSU_RATE: item.INSU_RATE,
                            INSU_AMT_YN: item.INSU_AMT_YN,
                            OVER_WORKER_YN: item.OVER_WORKER_YN,
                            AGE_65_OVER_YN: item.AGE_65_OVER_YN,
                            MEMO: item.MEMO,
                            USERID: item.USERID,
                            USERTIME: item.USERTIME
                        }
                        jsonDetailList.push(msg);
                    });

                    gvwDetailGrid.rebuild();

                    /*****************보수월액********************/
                    data.cv_7.forEach((item, index) => {
                        const msg = {
                            APPLY_TYPE: item.APPLY_TYPE,
                            LONG_APPLY_TYPE: item.LONG_APPLY_TYPE,
                            APPLY_START_DATE: item.APPLY_START_DATE,
                            APPLY_END_DATE: item.APPLY_END_DATE,
                            BASE_AMT: item.BASE_AMT,
                            VAL1: item.VAL1,
                            VAL2: item.VAL2,
                            VAL3: item.VAL3,
                            LONG_APPLY_EXEM_AMT: item.LONG_APPLY_EXEM_AMT,
                            MEMO: item.MEMO,
                            USERID: item.USERID,
                            USERTIME: item.USERTIME
                        }
                        jsonViewEx1List.push(msg);
                    });

                    gvwViewEx1Grid.rebuild();

                    /*****************원천세징수비율********************/
                    data.cv_12.forEach((item, index) => {
                        const msg = {
                            APPLY_START_DATE: item.APPLY_START_DATE,
                            APPLY_END_DATE: item.APPLY_END_DATE,
                            WITHHOLD_RATE: item.WITHHOLD_RATE,
                            MEMO: item.MEMO,
                            USERID: item.USERID,
                            USERTIME: item.USERTIME
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

        if (rowVal == -1) { //데이터가 없고 행선택이 없을경우.

            gvwPayInfoGrid.addRow(true);
        } else {
            gvwPayInfoGrid.insertRow(rowVal);
        }
        //grdFimList.refresh();
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
    const fn_search = async function () {

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
            V_P_DEBUG_MODE_YN: 'N'
            ,V_P_LANG_ID: 'KOR'
            ,V_P_COMP_CODE: '1000'
            ,V_P_CLIENT_CODE: '100'
            ,V_P_SITE_CODE: SITE_CODE
            ,V_P_DEPT_CODE: DEPT_CODE
            ,V_P_EMP_CODE: EMP_CODE
            ,V_P_EMP_STATE: EMP_STATE
            ,V_P_PAY_AREA_TYPE: PAY_AREA_TYPE
            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: p_userId
            ,V_P_PC:''
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
                        CREATE: item.CREATE,
                        EMP_CODE: item.EMP_CODE,
                        EMP_NAME: item.EMP_NAME,
                        PAY_GROUP_CODE: item.PAY_GROUP_CODE,
                        PAY_AREA_TYPE: item.PAY_AREA_TYPE,
                        DUTY_CODE: item.DUTY_CODE,
                        POSITION_CODE: item.POSITION_CODE,
                        DEPT_NAME: item.DEPT_NAME,
                        ENTER_DATE: item.ENTER_DATE,
                        RETIRE_DATE: item.RETIRE_DATE,
                        BANK_CODE: item.BANK_CODE,
                        BANK_ACCOUNT_REAL: item.BANK_ACCOUNT_REAL,
                        BANK_CODE2: item.BANK_CODE2,
                        BANK_ACCOUNT2_REAL: item.BANK_ACCOUNT2_REAL,
                        EMP_STATE: item.EMP_STATE,
                        BANK_ACCOUNT: item.BANK_ACCOUNT,
                        BANK_ACCOUNT2: item.BANK_ACCOUNT2,
                        RET_PENS_BANK_CODE: item.RET_PENS_BANK_CODE,
                        RET_PENS_BANK_ACC: item.RET_PENS_BANK_ACC,
                        RET_PENS_BANK_ACC_REAL: item.RET_PENS_BANK_ACC_REAL

                    }
                    jsonGvwInfoList.push(msg);
                    totalRecordCount++;
                });

                gvwInfoGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

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
        SBUxMethod.set("BANK_ACCOUNT_REAL", "");

        SBUxMethod.set("PAY_YN", "");
        SBUxMethod.set("BONUS_PAY_YN", "");
        SBUxMethod.set("RETIRE_PAY_YN", "");
        SBUxMethod.set("BANK_CODE2", "");
        SBUxMethod.set("BANK_ACCOUNT2_REAL", "");
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
        SBUxMethod.set("SUPPORTEE_QTY", "");
        SBUxMethod.set("CHILDREN_QTY", "");

        gvwPayInfoGrid.clearStatus();
        gvwPayGrid.clearStatus();
        gvwDedGrid.clearStatus();
        gvwVarPayGrid.clearStatus();
        gvwVarDedGrid.clearStatus();
        gvwPayExGrid.clearStatus();
        gvwDetailGrid.clearStatus();
        gvwViewEx1Grid.clearStatus();
        gvwWithholdGrid.clearStatus();

    }

    //저장
    const fn_save = async function () {

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



        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {
            var obj = {
                V_P_DEBUG_MODE_YN: ""
                ,V_P_LANG_ID: ""
                ,V_P_COMP_CODE: ""
                ,V_P_CLIENT_CODE: ""

                ,V_P_EMP_CODE: EMP_CODE
                ,V_P_SALARY_CLASS: SALARY_CLASS
                ,V_P_TEMP_END_DATE: TEMP_END_DATE
                ,V_P_BONUS_APPLY_START_DATE: BONUS_APPLY_START_DATE
                ,V_P_PAY_GROUP_CODE: PAY_GROUP_CODE
                ,V_P_PAY_YN: PAY_YN
                ,V_P_BONUS_PAY_YN: BONUS_PAY_YN
                ,V_P_RETIRE_PAY_YN: RETIRE_PAY_YN
                ,V_P_SUPPORTEE_QTY: SUPPORTEE_QTY
                ,V_P_CHILDREN_QTY: CHILDREN_QTY
                ,V_P_LUNCH_PAY_YN: LUNCH_PAY_YN
                ,V_P_MUTUAL_AID_MEMBER_YN: MUTUAL_AID_MEMBER_YN
                ,V_P_MONTHLY_DONATION_YN: MONTHLY_DONATION_YN
                ,V_P_OVER_TIME_PAY_YN: OVER_TIME_PAY_YN
                ,V_P_INCOME_TAX_YN: INCOME_TAX_YN
                ,V_P_OT_TAX_FREE_YN: OT_TAX_FREE_YN
                ,V_P_PENSION_YN: ""
                ,V_P_PENSION_JOIN_DATE: ""
                ,V_P_PENSION_CLOSE_DATE: ""
                ,V_P_PENSION_NO: ""
                ,V_P_PENSION_BASE_AMT: ""
                ,V_P_HEALTH_INSURE_YN: ""
                ,V_P_HEALTH_INSURE_JOIN_DATE: ""
                ,V_P_HEALTH_INSURE_CLOSE_DATE: ""
                ,V_P_HEALTH_INSURE_NO: ""
                ,V_P_HEALTH_INSURE_BASE_AMT: ""
                ,V_P_EMPLOY_INSURE_YN: ""
                ,V_P_EMPLOY_INSURE_BASE_AMT: ""
                ,V_P_MAIN_ACC_TYPE: MAIN_ACC_TYPE
                ,V_P_BANK_CODE: BANK_CODE
                ,V_P_BANK_ACCOUNT: BANK_ACCOUNT
                ,V_P_BANK_ACCOUNT_ORIG: ""
                ,V_P_BANK_CODE2: BANK_CODE2
                ,V_P_BANK_ACCOUNT2: ""
                ,V_P_BANK_ACCOUNT2_ORIG: ""
                ,V_P_IRP_BANK_CODE: ""
                ,V_P_IRP_BANK_ACCOUNT: ""
                ,V_P_IRP_BANK_ACCOUNT_ORIG: ""
                ,V_P_APPLICATION_RATE: ""
                ,V_P_LAST_APPLICATION_DATE: ""
                ,V_P_LONGTERM_CARE_YN: ""
                ,V_P_BANK2_PAY_ITEM: BANK2_PAY_ITEM
            /*-- 고정 수당/공제 항목*/
                ,V_P_TYPE: ""
                ,V_P_TXN_ID: ""
                ,V_P_PAY_TYPE: ""
                ,V_P_PAY_ITEM_CODE: ""
                ,V_P_APPLY_START_DATE: ""
                ,V_P_APPLY_END_DATE: ""
                ,V_P_PAY_AMT: ""
                ,V_P_PAY_MEMO: ""
            /*-- 변동 수당/공제 항목*/
                ,V_P_TYPE1: ""
                ,V_P_TXN_ID1: ""
                ,V_P_PAY_TYPE1: ""
                ,V_P_PAY_ITEM_CODE1: ""
                ,V_P_APPLY_START_DATE1: ""
                ,V_P_PAY_AMT1: ""
                ,V_P_PAY_MEMO1: ""
                ,V_P_TAX_PAY_DATE1: ""
        }

        }

    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
