<%
    /**
     * @Class Name        : hrp2320.jsp
     * @Description       : 급상여 계산(신규) 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.06.19
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.19   	표주완		최초 생성
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
    <title>title : 급상여 계산(신규) 정보</title>
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
                </h3><!-- 급상여 계산(신규) -->
            </div>
        </div>
        <div class="box-search-ma">
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
                    <th scope="row" class="th_bg_search">귀속년월</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_PAY_YYYYMM"
                                name="SRCH_PAY_YYYYMM"
                                uitype="popup"
                                datepicker-mode="month"
                                date-format="yyyy-mm"
                                class="table-datepicker-ma inpt_data_reqed"
                                onchange="fn_ymPay"
                        ></sbux-datepicker>
                    </td>
                    <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">상여기준월</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_BASE_YYYYMM"
                                name="SRCH_BASE_YYYYMM"
                                uitype="popup"
                                datepicker-mode="month"
                                date-format="yyyy-mm"
                                class="table-datepicker-ma input-sm-ast"
                        <%--onchange="fn_payDate"--%>>
                        </sbux-datepicker>
                    </td>
                    <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">지급구분</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_PAY_TYPE"
                                uitype="single"
                                jsondata-ref="jsonPayType"
                                unselected-text="선택"
                                class="form-control input-sm inpt_data_reqed"
                                onchange="fn_payType"
                        ></sbux-select>
                    </td>
                    <td colspan="6" style="border-right: hidden;">&nbsp;</td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">지급일</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_PAY_DATE"
                                name="SRCH_PAY_DATE"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="table-datepicker-ma inpt_data_reqed"
                        >
                        </sbux-datepicker>
                    </td>
                    <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">퇴사일</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_EXPECTED_PAY_DATE"
                                name="SRCH_EXPECTED_PAY_DATE"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="table-datepicker-ma inpt_data_reqed"
                        >
                        </sbux-datepicker>
                    </td>
                    <th scope="row" class="th_bg_search" style="display: none">급상여구분</th>
                    <td colspan="3" class="td_input" style="display: none">
                        <sbux-select
                                id="SRCH_PAY_CALCULATE_TYPE"
                                uitype="single"
                                jsondata-ref="jsonPayCalculateType"
                                unselected-text="선택"
                                class="form-control input-sm"
                                onchange="fn_payCalType"
                        ></sbux-select>
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <td colspan="8" style="border-right: hidden;">&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </div>

        <div>
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li><span>급상여계산</span></li>
                </ul>
            </div>
            <div>
                <table class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 7%">
                        <col style="width: 7%">
                        <col style="width: 3%">

                        <col style="width: 3%">
                        <col style="width: 3%">
                        <col style="width: 3%">

                        <col style="width: 7%">
                        <col style="width: 7%">
                        <col style="width: 4%">

                        <col style="width: 7%">
                        <col style="width: 4%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">법인</th>
                       <%-- <td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text=""
                                    uitype="single"
                                    id="COMP_CODE"
                                    name="COMP_CODE"
                                    unselected-text=""
                                    class="form-control input-sm"
                                    jsondata-ref="jsonCompCode"
                            />
                        </td>--%>
                        <td class="td_input">
                            <sbux-select
                                    id="COMP_CODE"
                                    uitype="single"
                                    jsondata-ref="jsonCompCode"
                                    unselected-text="선택"
                                    class="form-control input-sm inpt_data_reqed"
                                    readonly
                            ></sbux-select>
                        </td>
                        <td style="border-right: hidden;">&nbsp;</td>
                        <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                        <td class="td_input" style="border-right: hidden; display : none;">
                            <sbux-checkbox
                                    id="CALC_YEAR_END_YYYY1"
                                    name="CALC_YEAR_END_YYYY1"
                                    uitype="normal"
                                    text="연말정산반영"
                                    true-value="Y"
                                    false-value="N"
                            ></sbux-checkbox>
                        </td>
                        <th scope="row" class="th_bg" style="display : none;">정산연도</th>
                        <td class="td_input" style="border-right: hidden; display : none;">
                            <sbux-datepicker
                                    id="YEAR_END_TAX_YYYY"
                                    name="YEAR_END_TAX_YYYY"
                                    uitype="popup"
                                    datepicker-mode="year"
                                    date-format="yyyy"
                                    class="form-control input-sm input-sm-ast"
                                    readonly>
                            </sbux-datepicker>
                        </td>
                        <td class="td_input" style="border-right: hidden; display : none;">
                            <sbux-checkbox
                                    id="CALC_YEAR_END_YYYY2"
                                    name="CALC_YEAR_END_YYYY2"
                                    uitype="normal"
                                    text="연말정산 재정산"
                                    true-value="Y"
                                    false-value="N"
                            ></sbux-checkbox>
                        </td>
                        <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">급여영역</th>
                        <%--<td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text=""
                                    uitype="single"
                                    id="PAY_AREA_TYPE"
                                    name="PAY_AREA_TYPE"
                                    unselected-text="전체"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonPayAreaType"
                                    group-id="group1" required
                            />
                        </td>--%>
                        <td class="td_input">
                            <sbux-select
                                    id="PAY_AREA_TYPE"
                                    uitype="single"
                                    jsondata-ref="jsonPayAreaType"
                                    unselected-text="선택"
                                    class="form-control input-sm inpt_data_reqed"
                                    group-id="group1"
                                    required>
                            </sbux-select>
                        </td>
                        <td colspan="9" style="border-right: hidden;">&nbsp;</td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">사업장</th>
                        <%--<td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text=""
                                    uitype="single"
                                    id="SITE_CODE"
                                    name="SITE_CODE"
                                    unselected-text="전체"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonSiteCode"
                            />
                        </td>--%>
                        <td class="td_input">
                            <sbux-select
                                    id="SITE_CODE"
                                    uitype="single"
                                    jsondata-ref="jsonSiteCode"
                                    unselected-text="선택"
                                    class="form-control input-sm">
                            </sbux-select>
                        </td>
                        <td colspan="9" style="border-right: hidden;">&nbsp;</td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">급여체계</th>
                        <%--<td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text=""
                                    uitype="single"
                                    id="PAY_GROUP_CODE"
                                    name="PAY_GROUP_CODE"
                                    unselected-text="전체"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonPayGroupCode"
                            />
                        </td>--%>
                        <td class="td_input">
                            <sbux-select
                                    id="PAY_GROUP_CODE"
                                    uitype="single"
                                    jsondata-ref="jsonPayGroupCode"
                                    unselected-text="선택"
                                    class="form-control input-sm">
                            </sbux-select>
                        </td>
                        <td colspan="9" style="border-right: hidden;">&nbsp;</td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">부서</th>
                        <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                            <sbux-input
                                    <%--uitype="hidden"--%>
                                    uitype="text"
                                    id="DEPT_CODE"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                            <sbux-input
                                    uitype="text"
                                    id="DEPT_NAME"
                                    class="form-control input-sm"

                            ></sbux-input>
                        </td>
                        <td colspan="8" class="td_input" data-group="DEPT">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_compopup1"
                            ></sbux-button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">사원</th>
                        <td <%--colspan="2"--%>  class="td_input" style="border-right: hidden; " data-group="EMP">
                            <sbux-input
                                    <%--uitype="hidden"--%>
                                    uitype="text"
                                    id="EMP_CODE"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right: hidden;" data-group="EMP">
                            <sbux-input
                                    uitype="text"
                                    id="EMP_FULL_NAME"
                                    class="form-control input-sm"

                            ></sbux-input>
                        </td>
                        <td colspan="8" class="td_input" data-group="EMP">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_compopup2"
                            ></sbux-button>
                        </td>
                        <td class="td_input" style="border-right: hidden; display : none;">
                            <sbux-checkbox
                                    id="MULTI_YN"
                                    name="MULTI_YN"
                                    uitype="normal"
                                    text="복수선택"
                                    true-value="Y"
                                    false-value="N"
                            ></sbux-checkbox>
                        </td>
                        <td colspan="6"  class="td_input" style="border-right: hidden; display : none;">
                            <sbux-button
                                    id="btnMultiSelect"
                                    name="btnMultiSelect"
                                    uitype="normal"
                                    text="복수선택"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnMultiSelect">
                            </sbux-button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">예약시간</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-datepicker id="YMDRESERVE_TIME" name="YMDRESERVE_TIME" uitype="popup"
                                             date-format="yyyy-mm-dd HH:MM"
                                             show-time-bar="true" readonly>
                            </sbux-datepicker>
                        </td>
                        <td colspan="9" class="td_input" style="border-right: hidden;">
                            <sbux-checkbox
                                    id="CHKRESERVE_YN"
                                    name="CHKRESERVE_YN"
                                    uitype="normal"
                                    text="예약여부"
                                    true-value="Y"
                                    false-value="N"
                                    onchange="fn_ChkreserveYn"
                            ></sbux-checkbox>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">소급시작월</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-datepicker
                                    id="YMDSTART_PAY_YYYYMM"
                                    name="YMDSTART_PAY_YYYYMM"
                                    uitype="popup"
                                    datepicker-mode="month"
                                    date-format="yyyy-mm"
                                    class="form-control input-sm input-sm-ast"
                                    >
                            </sbux-datepicker>
                        </td>
                        <td colspan="9" class="td_input" style="border-right: hidden;">
                            <sbux-checkbox
                                    id="TAX_CALCULATE_EACH"
                                    name="TAX_CALCULATE_EACH"
                                    uitype="normal"
                                    text="소급계산제외"
                                    true-value="Y"
                                    false-value="N"
                                    onchange="fn_taxCalculateEach"
                            ></sbux-checkbox>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <table class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 1%">

                        <col style="width: 2%">
                        <col style="width: 0.5%">

                        <col style="width: 2%">

                        <col style="width: 2%">

                        <col style="width: 2%">

                        <col style="width: 3%">

                        <col style="width: 3%">

                        <col style="width: 27%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td style="border-right: hidden;">&nbsp;</td>
                        <td class="td_input" style="border-right: hidden;">
                        <sbux-button
                                id="btnCalculate"
                                name="btnCalculate"
                                uitype="normal"
                                text="급여계산"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_btnCalculate">
                        </sbux-button>
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-button
                                    id="btnCancel"
                                    name="btnCancel"
                                    uitype="normal"
                                    text="급여계산취소"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnCanceld">
                            </sbux-button>
                        </td>
                        <td style="border-right: hidden;">&nbsp;</td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-button
                                    id="btnApplyUpdate"
                                    name="btnApplyUpdate"
                                    uitype="normal"
                                    text="소급반영"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnApplyUpdate">
                            </sbux-button>
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-button
                                    id="btnCancelUpdate"
                                    name="btnCancelUpdate"
                                    uitype="normal"
                                    text="소급취소"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnCancelUpdate">
                            </sbux-button>
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-button
                                    id="btnRetireCalc"
                                    name="btnRetireCalc"
                                    uitype="normal"
                                    text="퇴직정산 일괄실행"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnRetireCalc">
                            </sbux-button>
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-button
                                    id="btnRetireCancel"
                                    name="btnRetireCancel"
                                    uitype="normal"
                                    text="퇴직정산 일괄취소"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_btnRetireCancel">
                            </sbux-button>
                        </td>
                        <td style="border-right: hidden;">&nbsp;</td>
                    </tr>
                    </tbody>
                </table>

                <table class="table table-bordered tbl_fixed" style="display: none">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 7%">
                        <col style="width: 5%">

                        <col style="width: 7%">
                        <col style="width: 5%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">numbonus_rate</th>
                        <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                            <sbux-input
                            <%--uitype="hidden"--%>
                                    uitype="text"
                                    id="BONUS_RATE"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <th scope="row" class="th_bg">cbobonus_pay_item_code</th>
                        <td class="td_input">
                            <sbux-select
                                    id="BONUS_PAY_ITEM_CODE"
                                    uitype="single"
                                    jsondata-ref="jsonBonusPayType"
                                    unselected-text="선택"
                                    class="form-control input-sm">
                            </sbux-select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">cbobonus_calculate_type</th>
                        <td class="td_input">
                            <sbux-select
                                    id="BONUS_CALCULATE_TYPE"
                                    uitype="single"
                                    jsondata-ref="jsonBonusCalculateType"
                                    unselected-text="선택"
                                    class="form-control input-sm">
                            </sbux-select>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div>
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li><span>계산 이력(로그)</span>
                        <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                    </li>
                </ul>
            </div>
            <div>
                <div id="sb-area-gvwLog" style="height:800px; width:100%;"></div>
            </div>
            <div style="display: none">
                <div id="sb-area-gvwBonus" style="height:800px; width:100%;"></div>
            </div>
            <div style="display: none">
                <div id="sb-area-gvwException" style="height:800px; width:100%;"></div>
            </div>
        </div>
    </div>
</section>
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title=""
                body-html-id="body-modal-compopup1" header-is-close-button="false"
                footer-is-close-button="false"></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>
<div>
    <sbux-modal style="width:700px" id="modal-compopup3" name="modal-compopup3" uitype="middle" header-title="" body-html-id="body-modal-compopup3" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup3">
    <jsp:include page="../../../com/popup/comPopup3.jsp"></jsp:include>
</div>
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    var strEmpCodeList = '';

    //grid 초기화
    var gvwLogGrid; 			// 그리드를 담기위한 객체 선언
    var jsonGvwLogList = []; 	// 그리드의 참조 데이터 주소 선언
    var gvwBonusGrid;
    var jsonBonusList = [];
    var gvwExceptionGrid;
    var jsonExceptionList = [];

    var jsonPayType = []; //지급구분 //SRCH_PAY_TYPE  //L_HRB008
    var jsonPayCalculateType = []; //급상여구분 //SRCH_PAY_CALCULATE_TYPE  //L_HRP005
    var jsonCompCode = []; //법인 //comp_code  //L_ORG000
    var jsonPayAreaType = []; //급여영역 //PAY_AREA_TYPE  //L_HRP034
    var jsonSiteCode = []; //사업장 //SITE_CODE  //L_ORG001
    var jsonPayGroupCode = []; //급여체계 //PAY_GROUP_CODE  //L_HRI010
    var jsonCalculateWorkType = []; //처리구분 //CALCULATE_WORK_TYPE  //L_HRP008
    var jsonWorkMonthsType = []; //근속기간(~개월 이상) //PAY_WORK_MONTHS  //L_HRP010
    var jsonApplyType = []; //상여적용기준 //BONUS_APPLY_TYPE  //L_HRP021
    var jsonBonusPayType = []; //cbobonus_pay_item_code //BONUS_PAY_ITEM_CODE  //L_HRP014
    var jsonPayItemCodeType = []; //급여항목 -gvwExceptionGrid //PAY_ITEM_CODE  //L_HRP004
    var jsonBonusCalculateType = []; //cbobonus_calculate_type //BONUS_CALCULATE_TYPE  //L_HRP007


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['SRCH_PAY_TYPE'], jsonPayType, 'L_HRB008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_CALCULATE_TYPE'], jsonPayCalculateType, 'L_HRP005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['COMP_CODE'], jsonCompCode, 'L_ORG000', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'COMP_CODE', 'COMP_NAME', 'Y', ''),
            gfnma_setComSelect(['PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['PAY_GROUP_CODE'], jsonPayGroupCode, 'L_HRI010', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_GROUP_CODE', 'PAY_GROUP_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwLogGrid'], jsonCalculateWorkType, 'L_HRP008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwWorkGrid'], jsonWorkMonthsType, 'L_HRP010', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwWorkGrid'], jsonApplyType, 'L_HRP021', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['BONUS_PAY_ITEM_CODE'], jsonBonusPayType, 'L_HRP014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwExceptionGrid'], jsonPayItemCodeType, 'L_HRP004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect(['BONUS_CALCULATE_TYPE'], jsonBonusCalculateType, 'L_HRP007', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '')

        ]);

       fn_onLoad();
    }

    /**
     * 공통팝업3
     */
    var fn_compopup1 = function() {

        var searchText 		= gfn_nvl(SBUxMethod.get("DEPT_NAME"));

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
                SBUxMethod.set('DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function() {

        var searchText = gfn_nvl(SBUxMethod.get("EMP_FULL_NAME"));
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
                SBUxMethod.set('EMP_FULL_NAME', data.EMP_NAME);
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

        let openDate = gfn_dateToYm(new Date());

        SBUxMethod.set('SRCH_PAY_YYYYMM', openDate);

        fn_createGrid();
        fn_createBonusGrid();
        fn_createExceptionGrid();

        //fn_onLoad();

    }

    function fn_onLoad() {

        /*cbopay_area_type.EditValue = "1";

        cbopay_calculate_type.EditValue = "PAY";

        chkcalc_year_end_yyyy_yn.EditValue = "N";
        chktax_calculate_each.EditValue = "Y";
        chkreCalc_year_end_yyyy_yn.EditValue = "N";
        chkreserve_yn.EditValue = "N";*/

        SBUxMethod.set("PAY_AREA_TYPE"          , "1");

        SBUxMethod.set("SRCH_PAY_CALCULATE_TYPE", "PAY");

        SBUxMethod.set("CALC_YEAR_END_YYYY1"    , "N");
        SBUxMethod.set("TAX_CALCULATE_EACH"     , "Y");
        SBUxMethod.set("CALC_YEAR_END_YYYY2"    , "N");
        SBUxMethod.set("CHKRESERVE_YN"          , "N");


        SBUxMethod.set("COMP_CODE", gv_ma_selectedCorpCd);

    }

    // 신규
    /*  function cfn_add() {
          fn_create();
      }*/
    // 저장
   /* function cfn_save() {
        fn_save();
    }*/
    // 삭제
    /*function cfn_del() {
        fn_delete();
    }*/

    // 조회
    function cfn_search() {
        fn_search('Q');
    }

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }

    //계산이력(로그)
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwLog';
        SBGridProperties.id = 'gvwLogGrid';
        SBGridProperties.jsonref = 'jsonGvwLogList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["연번"], ref: 'PAY_CALCULATE_SEQ', type: 'output', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#', emptyvalue:'0'}},
            {caption : ["처리구분"], ref : 'CALCULATE_WORK_TYPE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonCalculateWorkType',  label : 'label', value : 'value'}
            },
            {caption: ["시작시각"], ref: 'ACTION_START_TIME', type: 'input', width: '200px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/}/*,  format : {type:'number', rule:'##:##:##'}*/},
            {caption: ["종료시각"], ref: 'ACTION_END_TIME', type: 'input', width: '200px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/}/*,  format : {type:'number', rule:'##:##:##'}*/},
            {caption: ["처리자ID"], ref: 'INSERT_USERID', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["처리시각"], ref: 'INSERT_TIME', type: 'input', width: '200px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/}/*,  format : {type:'number', rule:'##:##:##'}*/},
            {caption: ["처리PC"], ref: 'INSERT_PC', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["계산대상정보"], ref: 'CALCULATE_CONDITION', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["메    모"], ref: 'MEMO', type: 'output', width: '350px', style: 'text-align:left'},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값
        ];

        gvwLogGrid = _SBGrid.create(SBGridProperties);
        gvwLogGrid.bind('click', 'fn_view');
    }

    function fn_createBonusGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwBonus';
        SBGridProperties.id = 'gvwBonusGrid';
        SBGridProperties.jsonref = 'jsonBonusList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["근속기간(~개월 이상)"], ref : 'PAY_WORK_MONTHS', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonWorkMonthsType',  label : 'label', value : 'value'}
            },
            {caption : ["상여적용기준"], ref : 'BONUS_APPLY_TYPE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonApplyType',  label : 'label', value : 'value'}
            },
            {caption: ["적용비율(%)"], ref: 'BONUS_RATE', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/}/*,  format : {type:'number', rule:'##:##:##'}*/},
            {caption: ["상여금액"], ref: 'BONUS_AMT', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###'}},
        ];

        gvwBonusGrid = _SBGrid.create(SBGridProperties);
    }

    function fn_createExceptionGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwException';
        SBGridProperties.id = 'gvwExceptionGrid';
        SBGridProperties.jsonref = 'jsonExceptionList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        /*SBGridProperties.allowcopy = true; //복사*/
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["급여항목"], ref : 'PAY_ITEM_CODE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCodeType',  label : 'label', value : 'value'}
            },
            {caption: ['적용시작년월'], ref: 'PAY_APPLY_YYYYMM_FR', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['적용종료년월'], ref: 'PAY_APPLY_YYYYMM_TO', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
        ];

        gvwExceptionGrid = _SBGrid.create(SBGridProperties);
    }

    // 지급일자 가져오기
    const fn_search = async function (strWorkType) {

        let PAY_YYYYMM          = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); // 귀속년월
        let BASE_YYYYMM         = gfn_nvl(SBUxMethod.get("SRCH_BASE_YYYYMM")); // 상여기준월
        let PAY_CALCULATE_TYPE  = gfn_nvl(SBUxMethod.get("SRCH_PAY_CALCULATE_TYPE")); // 급상여구분
        let PAY_TYPE            = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); // 지급구분
        let PAY_DATE            = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); // 지급일
        let EXPECTED_PAY_DATE   = gfn_nvl(SBUxMethod.get("SRCH_EXPECTED_PAY_DATE")); // 퇴사일

        let SITE_CODE           = gfn_nvl(SBUxMethod.get("SITE_CODE")); // 사업장
        let PAY_AREA_TYPE       = gfn_nvl(SBUxMethod.get("PAY_AREA_TYPE")); // 급여영역

        if (_.isEqual(strWorkType, 'Q')){

            if (!PAY_TYPE) {
                gfn_comAlert("W0002", "지급구분");
                return;
            }
            if (!PAY_YYYYMM) {
                gfn_comAlert("W0002", "귀속년월");
                return;
            }
            if (!PAY_DATE) {
                gfn_comAlert("W0002", "지급일");
                return;
            }
            if (!EXPECTED_PAY_DATE) {
                gfn_comAlert("W0002", "퇴사일");
                return;
            }
        }


        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_SITE_CODE          : SITE_CODE
            ,V_P_PAY_YYYYMM         : PAY_YYYYMM
            ,V_P_PAY_CALCULATE_TYPE : PAY_CALCULATE_TYPE
            /* -- 'PAY' : 급여,  'BONUS' : 상여,  'ALL' : 급상여*/
            ,V_P_PAY_TYPE           : PAY_TYPE
            ,V_P_PAY_DATE           : PAY_DATE
            ,V_P_PAY_AREA_TYPE      : PAY_AREA_TYPE

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/selectHrp2320List.do", {
            getType: 'json',
            workType: strWorkType,
            cv_count: '8',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {


                if (strWorkType == "Q"){

                    jsonGvwLogList.length = 0;
                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            PAY_ITEM_CODE		     : gfn_nvl(item.PAY_ITEM_CODE),
                            PAY_APPLY_YYYYMM_FR		 : gfn_nvl(item.PAY_APPLY_YYYYMM_FR),
                            PAY_APPLY_YYYYMM_TO		 : gfn_nvl(item.PAY_APPLY_YYYYMM_TO),
                        }
                        jsonGvwLogList.push(msg);
                        //totalRecordCount ++;
                    });

                    gvwLogGrid.rebuild();

                    jsonBonusList.length = 0;
                    data.cv_4.forEach((item, index) => {
                        const msg = {
                            PAY_WORK_MONTHS		 : gfn_nvl(item.PAY_WORK_MONTHS),
                            BONUS_APPLY_TYPE	 : gfn_nvl(item.BONUS_APPLY_TYPE),
                            BONUS_RATE		     : gfn_nvl(item.BONUS_RATE),
                            BONUS_AMT		     : gfn_nvl(item.BONUS_AMT),
                        }
                        jsonBonusList.push(msg);
                        //totalRecordCount ++;
                    });

                    gvwBonusGrid.rebuild();


                    jsonBonusList.length = 0;
                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            PAY_CALCULATE_SEQ		 : gfn_nvl(item.PAY_CALCULATE_SEQ),
                            CALCULATE_WORK_TYPE		 : gfn_nvl(item.CALCULATE_WORK_TYPE),
                            TAX_CALCULATE_TYPE		 : gfn_nvl(item.TAX_CALCULATE_TYPE),
                            TAX_RATE		         : gfn_nvl(item.TAX_RATE),
                            BONUS_CALCULATE_TYP      : gfn_nvl(item.BONUS_CALCULATE_TYP),
                            BONUS_RATE		         : gfn_nvl(item.BONUS_RATE),
                            BONUS_APPLY_TYPE		 : gfn_nvl(item.BONUS_APPLY_TYPE),
                            CALCULATE_CONDITION		 : gfn_nvl(item.CALCULATE_CONDITION),
                            MEMO		             : gfn_nvl(item.MEMO),
                            ACTION_START_TIME		 : gfn_nvl(item.ACTION_START_TIME),
                            ACTION_END_TIME		     : gfn_nvl(item.ACTION_END_TIME),
                            INSERT_USERID		     : gfn_nvl(item.INSERT_USERID),
                            INSERT_TIME		         : gfn_nvl(item.INSERT_TIME),
                            INSERT_PC		         : gfn_nvl(item.INSERT_PC),
                            PAY_AREA_TYPE		     : gfn_nvl(item.PAY_AREA_TYPE),
                        }
                        jsonBonusList.push(msg);
                        //totalRecordCount ++;
                    });

                    gvwBonusGrid.rebuild();

                } else if (strWorkType == "PAYDATE") {

                    data.cv_1.forEach((item, index) => {

                        SBUxMethod.set("SRCH_PAY_DATE"          , gfn_nvl(item.PAY_DATE));
                        SBUxMethod.set("SRCH_EXPECTED_PAY_DATE" , gfn_nvl(item.EXPECTED_PAY_DATE));

                    });


                    jsonGvwLogList.length = 0;
                    data.cv_2.forEach((item, index) => {
                        const msg = {
                            PAY_CALCULATE_SEQ		 : gfn_nvl(item.PAY_CALCULATE_SEQ),
                            CALCULATE_WORK_TYPE		 : gfn_nvl(item.CALCULATE_WORK_TYPE),
                            // -- 처리구분
                            TAX_CALCULATE_TYPE		 : gfn_nvl(item.TAX_CALCULATE_TYPE),
                            TAX_RATE		         : gfn_nvl(item.TAX_RATE),
                            BONUS_CALCULATE_TYPE     : gfn_nvl(item.BONUS_CALCULATE_TYPE),
                            BONUS_RATE		         : gfn_nvl(item.BONUS_RATE),
                            BONUS_APPLY_TYPE		 : gfn_nvl(item.BONUS_APPLY_TYPE),
                            CALCULATE_CONDITION		 : gfn_nvl(item.CALCULATE_CONDITION),
                            MEMO		             : gfn_nvl(item.MEMO),
                            INSERT_USERID		     : gfn_nvl(item.INSERT_USERID),
                            ACTION_START_TIME		 : gfn_nvl(item.ACTION_START_TIME),
                            ACTION_END_TIME		     : gfn_nvl(item.ACTION_END_TIME),
                            INSERT_TIME		         : gfn_nvl(item.INSERT_TIME),
                            INSERT_PC		         : gfn_nvl(item.INSERT_PC),
                            PAY_AREA_TYPE		     : gfn_nvl(item.PAY_AREA_TYPE)
                        }
                        jsonGvwLogList.push(msg);
                        //totalRecordCount ++;
                    });

                    gvwLogGrid.rebuild();


                } else if (strWorkType == "PAYDATE2") {

                    data.cv_1.forEach((item, index) => {

                        SBUxMethod.set("SRCH_EXPECTED_PAY_DATE", item.EXPECTED_PAY_DATE); //퇴사일

                    });


                    jsonGvwLogList.length = 0;
                    data.cv_2.forEach((item, index) => {
                        const msg = {
                            PAY_CALCULATE_SEQ       : gfn_nvl(item.PAY_CALCULATE_SEQ),
                            CALCULATE_WORK_TYPE     : gfn_nvl(item.CALCULATE_WORK_TYPE),
                            // -- 처리구분
                            TAX_CALCULATE_TYPE      : gfn_nvl(item.TAX_CALCULATE_TYPE),
                            TAX_RATE                : gfn_nvl(item.TAX_RATE),
                            BONUS_CALCULATE_TYPE    : gfn_nvl(item.BONUS_CALCULATE_TYPE),
                            BONUS_RATE              : gfn_nvl(item.BONUS_RATE),
                            BONUS_APPLY_TYPE        : gfn_nvl(item.BONUS_APPLY_TYPE),
                            CALCULATE_CONDITION     : gfn_nvl(item.CALCULATE_CONDITION),
                            MEMO                    : gfn_nvl(item.MEMO),
                            INSERT_USERID           : gfn_nvl(item.INSERT_USERID),
                            ACTION_START_TIME       : gfn_nvl(item.ACTION_START_TIME),
                            ACTION_END_TIME         : gfn_nvl(item.ACTION_END_TIME),
                            INSERT_TIME             : gfn_nvl(item.INSERT_TIME),
                            INSERT_PC               : gfn_nvl(item.INSERT_PC),
                            PAY_AREA_TYPE           : gfn_nvl(item.PAY_AREA_TYPE)
                        }
                        jsonGvwLogList.push(msg);
                        //totalRecordCount ++;
                    });

                    gvwLogGrid.rebuild();


                } else if (strWorkType == "BONUS") {

                    data.cv6.forEach((item, index) => {

                        SBUxMethod.set("BONUS_RATE"         , item.BONUS_RATE);
                        SBUxMethod.set("BONUS_PAY_ITEM_CODE", item.PAY_ITEM_CODE);

                    });


                    jsonGvwLogList.length = 0;
                    data.cv_7.forEach((item, index) => {
                        const msg = {
                            PAY_CALCULATE_SEQ       : gfn_nvl(item.PAY_CALCULATE_SEQ),
                            CALCULATE_WORK_TYPE     : gfn_nvl(item.CALCULATE_WORK_TYPE),
                            // -- 처리구분
                            TAX_CALCULATE_TYPE      : gfn_nvl(item.TAX_CALCULATE_TYPE),
                            TAX_RATE                : gfn_nvl(item.TAX_RATE),
                            BONUS_CALCULATE_TYPE    : gfn_nvl(item.BONUS_CALCULATE_TYPE),
                            BONUS_RATE              : gfn_nvl(item.BONUS_RATE),
                            BONUS_APPLY_TYPE        : gfn_nvl(item.BONUS_APPLY_TYPE),
                            CALCULATE_CONDITION     : gfn_nvl(item.CALCULATE_CONDITION),
                            MEMO                    : gfn_nvl(item.MEMO),
                            INSERT_USERID           : gfn_nvl(item.INSERT_USERID),
                            ACTION_START_TIME       : gfn_nvl(item.ACTION_START_TIME),
                            ACTION_END_TIME         : gfn_nvl(item.ACTION_END_TIME),
                            INSERT_TIME             : gfn_nvl(item.INSERT_TIME),
                            INSERT_PC               : gfn_nvl(item.INSERT_PC),
                            PAY_AREA_TYPE           : gfn_nvl(item.PAY_AREA_TYPE)
                        }
                        jsonGvwLogList.push(msg);
                        //totalRecordCount ++;
                    });

                    gvwLogGrid.rebuild();

                } else if (strWorkType == "COPY") {

                    jsonBonusList.length = 0;
                    data.cv_8.forEach((item, index) => {
                        const msg = {
                            PAY_WORK_MONTHS     : gfn_nvl(item.PAY_WORK_MONTHS),
                            BONUS_RATE          : gfn_nvl(item.BONUS_RATE),
                            BONUS_AMT           : gfn_nvl(item.BONUS_AMT)

                        }
                        jsonBonusList.push(msg);
                        //totalRecordCount ++;
                    });

                    gvwBonusGrid.rebuild();

                }

                return true;

            } else {
                alert(data.resultMessage);

                if (strWorkType == "PAYDATE") {

                        SBUxMethod.set("SRCH_PAY_DATE"          , "");
                        SBUxMethod.set("SRCH_EXPECTED_PAY_DATE" , "");
                        SBUxMethod.set("BONUS_RATE"             , '0');
                        SBUxMethod.set("BONUS_PAY_ITEM_CODE"    , "");
                        return false;


                }else if (strWorkType == "PAYDATE2") {

                        SBUxMethod.set("SRCH_PAY_DATE"          , "");
                        SBUxMethod.set("SRCH_EXPECTED_PAY_DATE" , "");
                        SBUxMethod.set("BONUS_RATE"             , '0');
                        SBUxMethod.set("BONUS_PAY_ITEM_CODE"    , "");
                        return false;


                }else if (strWorkType == "BONUS") {

                        SBUxMethod.set("BONUS_RATE"             , '0');
                        SBUxMethod.set("BONUS_PAY_ITEM_CODE"    , "");
                        return false;

                }else if (strWorkType == "COPY") {

                    return false;

                }
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
    async function fn_view(date) {

    }

    // 귀속년월 EditValueModified
    const fn_ymPay = async function () {

        let PAY_YYYYMM          = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); // 귀속년월
        let PAY_CALCULATE_TYPE  = gfn_nvl(SBUxMethod.get("SRCH_PAY_CALCULATE_TYPE")); // 급상여구분
        let PAY_TYPE            = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); // 지급구분
        let PAY_DATE            = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); // 지급일

        if(PAY_YYYYMM != '') {

            SBUxMethod.set("SRCH_BASE_YYYYMM", 			PAY_YYYYMM);
        }
        // 지급일 조회
        if (PAY_YYYYMM != '' && PAY_CALCULATE_TYPE != '' && PAY_TYPE != '')
        {
            await fn_search("PAYDATE");
        }

        if (PAY_YYYYMM != '' && PAY_CALCULATE_TYPE != '' && PAY_TYPE != '' && PAY_DATE != '')
        {
            if (PAY_CALCULATE_TYPE == "PAY"){
                return;
            }

            await fn_search('Q');

            // 상여율 조회
            await fn_search('BONUS');
        }

    }

    // 급상여구분 EditValueChanged
    const fn_payCalType = async function () {

        if (cbopay_calculate_type.EditValue.ToString() == "")
            return;

        // ALL : 급상여, BONUS : 상여
        if (cbopay_calculate_type.EditValue.ToString() == "ALL" || cbopay_calculate_type.EditValue.ToString() == "BONUS")
        {
            grpBonus.Enabled = true;
            grpBonusCriteria.Enabled = true;
            cbobonus_calculate_type.SelectedIndex = 1;

            if (ymdpay_yyyymm.Text != "" && cbopay_calculate_type.EditValue.ToString() != ""
                && cbopay_type.EditValue.ToString() != "" && ymdpay_date.Text != "")
            {
                QueryClick();

                // 상여율 조회
                fnQRY_P_HRP2320_Q("BONUS");
            }
        }
        else
        {
            grpBonus.Enabled = false;
            grpBonusCriteria.Enabled = false;

            InitControls(grpBonus);
            InitControls(grpBonusCriteria);
            InitControls(grdBonus);
        }

    }

    // 지급일자 가져오기
    const fn_payType = async function () {

        let PAY_YYYYMM          = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); // 귀속년월
        let PAY_CALCULATE_TYPE  = gfn_nvl(SBUxMethod.get("SRCH_PAY_CALCULATE_TYPE")); // 급상여구분
        let PAY_TYPE            = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); // 지급구분
        let PAY_DATE            = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); // 지급일

        let PAY_AREA_TYPE       = gfn_nvl(SBUxMethod.get("PAY_AREA_TYPE")); // 지급일

        // 지급일 조회
        if (PAY_YYYYMM != '' && PAY_CALCULATE_TYPE != '' && PAY_TYPE != '')
        {
            await fn_search('PAYDATE');
        }

        if (PAY_YYYYMM != '' && PAY_CALCULATE_TYPE != '' && PAY_TYPE != '' && PAY_DATE != ''){
            if (PAY_CALCULATE_TYPE == "PAY"){
                return;
            }

            await fn_search('Q');

            // 상여율 조회
            await fn_search('BONUS');

        }
    }

    //소급계산제외 여부
    const fn_taxCalculateEach = async function () {
        let TAX_CALCULATE_EACH = gfn_nvl(SBUxMethod.get("TAX_CALCULATE_EACH")); // 소급계산제외 여부

        if (_.isEqual(TAX_CALCULATE_EACH.TAX_CALCULATE_EACH, 'Y')){

            SBUxMethod.set("YMDSTART_PAY_YYYYMM", 			""); //소급시작월 초기화
            SBUxMethod.attr('YMDSTART_PAY_YYYYMM',	'readonly', true);
        }else{

            SBUxMethod.attr('YMDSTART_PAY_YYYYMM',	'readonly', false);
            //현재 날짜 셋팅
            let openDate = gfn_dateToYm(new Date());
            SBUxMethod.set('YMDSTART_PAY_YYYYMM', openDate);
        }
    }

    //예약시간 설정
    const fn_ChkreserveYn =  async function () {

        let CHKRESERVE_YN = gfn_nvl(SBUxMethod.get("CHKRESERVE_YN")); // 예약여부

        if (_.isEqual(CHKRESERVE_YN.CHKRESERVE_YN, 'Y')) {

            SBUxMethod.attr('YMDRESERVE_TIME',	'readonly', false);

        }else{
            SBUxMethod.set("YMDRESERVE_TIME", 			"");
            SBUxMethod.attr('YMDRESERVE_TIME',	'readonly', true);
        }
    }


    //복수선택
    const fn_btnMultiSelect =  async function () {

        SBUxMethod.attr('modal-compopup3', 'header-title', '복수사원');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){
                strEmpCodeList = "";
                data.forEach((item, index) => {
                    strEmpCodeList += item + "|";
                });

                if (strCsCodeList.length > 0)
                    strEmpCodeList = strEmpCodeList.substring(0, strEmpCodeList.length - 1);

                if (strEmpCodeList.replace("|", "") == ""){
                    SBUxMethod.set("MULTI_YN", "N");
                }else {
                    SBUxMethod.set("MULTI_YN", "Y");
                }
            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})

    }

    //급여계산
    const fn_P_HRP2320_CHECK =  async function (strWorkType, strPassCheck) {

        let PAY_YYYYMM           = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); // 귀속년월
        let BASE_YYYYMM          = gfn_nvl(SBUxMethod.get("SRCH_BASE_YYYYMM")); // 상여기준월
        let PAY_TYPE             = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); // 지급구분
        let PAY_DATE             = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); // 지급일
        let EXPECTED_PAY_DATE    = gfn_nvl(SBUxMethod.get("SRCH_EXPECTED_PAY_DATE")); // 퇴사일
        let PAY_CALCULATE_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_CALCULATE_TYPE")); // 급상여구분


        let SITE_CODE               = gfn_nvl(SBUxMethod.get("SITE_CODE")); // 사업장
        let BONUS_CALCULATE_TYPE    = gfn_nvl(SBUxMethod.get("BONUS_CALCULATE_TYPE"));
        let BONUS_RATE              = gfn_nvl(SBUxMethod.get("BONUS_RATE"));
        let BONUS_PAY_ITEM_CODE     = gfn_nvl(SBUxMethod.get("BONUS_PAY_ITEM_CODE"));

        let PAY_AREA_TYPE           = gfn_nvl(SBUxMethod.get("PAY_AREA_TYPE")); //급여영역
        let PAY_GROUP_CODE          = gfn_nvl(SBUxMethod.get("PAY_GROUP_CODE")); //급여체계
        let DEPT_CODE               = gfn_nvl(SBUxMethod.get("DEPT_CODE")); //부서
        let EMP_CODE                = gfn_nvl(SBUxMethod.get("EMP_CODE")); //사원
        let CALC_YEAR_END_YYYY1     = gfn_nvl(SBUxMethod.get("CALC_YEAR_END_YYYY1").CALC_YEAR_END_YYYY1); //연말정산반영
        let YEAR_END_TAX_YYYY       = gfn_nvl(SBUxMethod.get("YEAR_END_TAX_YYYY")); //정산연도
        let TAX_CALCULATE_EACH      = gfn_nvl(SBUxMethod.get("TAX_CALCULATE_EACH").TAX_CALCULATE_EACH); //소급계산제외
        let CALC_YEAR_END_YYYY2     = gfn_nvl(SBUxMethod.get("CALC_YEAR_END_YYYY2").CALC_YEAR_END_YYYY2); //연말정산 재정산
        let YMDRESERVE_TIME         = gfn_nvl(SBUxMethod.get("YMDRESERVE_TIME")); //예약시간

        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일");
            return;
        }
        if (!EXPECTED_PAY_DATE) {
            gfn_comAlert("W0002", "퇴사일");
            return;
        }

        let gridBonus =gvwBonusGrid.getGridDataAll();
        let gridException =gvwExceptionGrid.getGridDataAll();

        if (_.isEmpty(gridBonus) ||  _.isEmpty(gridException)){
            return false;
        }

        //귀속연월 예외 정보
        let strpay_item_code        = '';
        let strpay_apply_yyyymm_fr  = '';
        let strpay_apply_yyyymm_to  = '';

        // 상여 1년 미만 근속자
        let strpay_work_months      = '';
        let strbonus_apply_type     = '';
        let strbonus_rate_detail    = '';
        let strbonus_amt_detail     = '';


        gridException.forEach((item,index) => {

            strpay_item_code       += item.PAY_ITEM_CODE + "|";
            strpay_apply_yyyymm_fr += item.PAY_APPLY_YYYYMM_FR + "|";
            strpay_apply_yyyymm_to += item.PAY_APPLY_YYYYMM_TO + "|";

        });

        if (strpay_item_code.length > 0){

            strpay_item_code        = strpay_item_code.slice(0, -1);
            strpay_apply_yyyymm_fr  = strpay_apply_yyyymm_fr.slice(0, -1);
            strpay_apply_yyyymm_to  = strpay_apply_yyyymm_to.slice(0, -1);

        }

        if (PAY_CALCULATE_TYPE == "ALL" || PAY_CALCULATE_TYPE == "BONUS") {

            gridBonus.forEach((item, index) => {

                strpay_work_months      += item.PAY_WORK_MONTHS + "|";
                strbonus_apply_type     += item.BONUS_APPLY_TYPE + "|";
                strbonus_rate_detail    += item.BONUS_RATE + "|";
                strbonus_amt_detail     += item.BONUS_AMT + "|";

            });

            if (strpay_work_months.length > 0)
            {
                strpay_work_months      = strpay_work_months.slice(0, -1);
                strbonus_apply_type     = strbonus_apply_type.slice(0, -1);
                strbonus_rate_detail    = strbonus_rate_detail.slice(0, -1);
                strbonus_amt_detail     = strbonus_amt_detail.slice(0, -1);
            }

        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_SITE_CODE             : SITE_CODE
            ,V_P_PAY_YYYYMM            : PAY_YYYYMM
            ,V_P_PAY_CALCULATE_TYPE    : PAY_CALCULATE_TYPE      //-- 'PAY' : 급여,  'BONUS' : 상여,  'ALL' : 급상여
            ,V_P_PAY_TYPE              : PAY_TYPE      //-- 계산정보
            ,V_P_PAY_DATE              : PAY_DATE
            ,V_P_TAX_CALCULATE_TYPE    : 'TAXTABLE'      //-- 소득세 적용방법 APPLYALL : 전체일괄세율, INDIVISUAL : 개인별 소득세율 적용, TAXTABLE : 간이세율표
            ,V_P_TAX_RATE              : 0
            ,V_P_BONUS_CALCULATE_TYPE  : BONUS_CALCULATE_TYPE
            ,V_P_BONUS_RATE            : BONUS_RATE
            ,V_P_BONUS_PAY_ITEM_CODE   : BONUS_PAY_ITEM_CODE      //-- 상여급여 항목

        //-- 귀속년월 예외 정보
            ,V_P_PAY_ITEM_CODE         : strpay_item_code
            ,V_P_PAY_APPLY_YYYYMM_FR   : strpay_apply_yyyymm_fr
            ,V_P_PAY_APPLY_YYYYMM_TO   : strpay_apply_yyyymm_to

        //-- 상여 1년 미만자 정보
            ,V_P_PAY_WORK_MONTHS       : strpay_work_months
            ,V_P_BONUS_APPLY_TYPE      : strbonus_apply_type
            ,V_P_BONUS_RATE_DETAIL     : strbonus_rate_detail
            ,V_P_BONUS_AMT_DETAIL      : strbonus_amt_detail

        //-- 계산 대상 정보
            ,V_P_APPLY_PAY_AREA_TYPE   : PAY_AREA_TYPE          //-- 추가 급여영역 170915
            ,V_P_APPLY_PAY_GROUP_CODE  : PAY_GROUP_CODE
            ,V_P_APPLY_DEPT_CODE       : strEmpCodeList == '' ? DEPT_CODE : ''
            ,V_P_APPLY_EMP_CODE        : strEmpCodeList == '' ? EMP_CODE : ''
            ,V_P_CALC_YE_YYYY_YN       : CALC_YEAR_END_YYYY1          //--20180228 ADJ
            ,V_P_YEAR_END_TAX_YYYY     : YEAR_END_TAX_YYYY
            ,V_P_PASS_CHECK_YN         : strPassCheck           //-- 이미 급상여 계산한 자료 존재시(귀속년월, 지급구분만 체크) 계속 수행할 것인지에 대한 판단
            ,V_P_TAX_CALCULATE_EACH    : TAX_CALCULATE_EACH     //--  'Y'이면 세금계산 단독으로 아니면 누적(정기급여[='1']이면 단독인 것은 이전 방식 유지)
            ,V_P_RE_CALC_YE_YYYY_YN    : CALC_YEAR_END_YYYY2     //--20170814ADD --연말정산 재정산결과 급여반영여부
            ,V_P_EXPECTED_PAY_DATE     : EXPECTED_PAY_DATE
            ,V_P_APPLY_EMP_CODE_D      : strEmpCodeList
            ,V_P_RESERVE_TIME          : YMDRESERVE_TIME

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/selectHrp2320List.do", {
            getType: 'json',
            workType: strWorkType,
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                if (data.resultMessage) {
                    await alert(data.resultMessage);
                    return true;
                }else{
                    await gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                    return true;
                }

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

    //급여계산
    const fn_btnCalculate =  async function () {

        let PAY_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); // 지급구분
        //let PAY_CALCULATE_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PAY_CALCULATE_TYPE")); // 급상여구분

        if (_.isEqual(PAY_TYPE, "99")){
            gfn_comAlert("E0000", "소급분임금 계산은 [급상여 소급처리] 화면에서 수행하십시오.");		//	W0001	{0}
            return;
        }
        gfn_comAlert("I0002", "급여계산버튼을","실행");		//	W0001	{0}

        if (fn_P_HRP2320_CHECK('CHECK', 'N')){
            fn_search('Q');
        }
    }

    //급여계산취소
    const fn_btnCanceld =  async function () {

        /*SetMessageBox("급여계산취소버튼을 실행하였습니다."); // 소급분임금 계산은 [급상여 소급처리] 화면에서 수행하십시오.
        if (fnSET_P_HRP2320_BAT("CANCEL", "N"))
            QueryClick();*/

        gfn_comAlert("E0000", "소급분임금 계산은 [급상여 소급처리] 화면에서 수행하십시오.");

        if (fn_P_HRP2320_CHECK('CANCEL', 'N')){
            fn_search('Q');
        }

    }

    //소급반영
    const fn_btnApplyUpdate =  async function () {

        /*if (cbopay_type.EditValue.ToString() == "99")
        {
            SetMessageBox(cbopay_type.Text + GetFormMessage("HRP2320_002")); // 소급분임금 계산은 [급상여 소급처리] 화면에서 수행하십시오.
            return;
        }
        SetMessageBox("급여계산버튼을 실행하였습니다."); // 소급분임금 계산은 [급상여 소급처리] 화면에서 수행하십시오.
        if (fnSET_P_HRP2320_CHANGE_CREATE("UPDATE"))
            QueryClick();*/

        let PAY_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); // 지급구분

        if (_.isEqual(PAY_TYPE, "99")){
            gfn_comAlert("E0000", "소급분임금 계산은 [급상여 소급처리] 화면에서 수행하십시오.");		//	W0001	{0}
            return;
        }

        gfn_comAlert("E0000", "급여계산버튼을 실행하였습니다.");
        if (fn_P_HRP2320_CHANGE_CREATE('UPDATE')){
            fn_search('Q');
        }

    }

    //소급취소
    const fn_btnCancelUpdate =  async function () {

         gfn_comAlert("E0000", "급여계산취소버튼을 실행하였습니다.");
        if (fn_P_HRP2320_CHANGE_CREATE('CANCEL')){
            fn_search('Q');
        }

    }

    //퇴직정산 일괄실행
    const fn_btnRetireCalc =  async function () {

        let PAY_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); // 지급구분
        let EMP_CODE = gfn_nvl(SBUxMethod.get("EMP_CODE")); // 사원

        if(PAY_TYPE != '7')
        {
            gfn_comAlert("E0000", "지급구분이 퇴직자정산일 경우에만 실행할 수 있습니다.");
            return;
        }

        if (EMP_CODE == '')
        {
            gfn_comAlert("E0000", "사원을 선택하세요.");
            return;
        }

        if (fn_P_HRP2320_RETI_BAT("CALCULATE", "N")){
            fn_search('Q');
        }

    }

    //퇴직정산 일괄취소
    const fn_btnRetireCancel =  async function () {

        let PAY_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); // 지급구분
        let EMP_CODE = gfn_nvl(SBUxMethod.get("EMP_CODE")); // 사원

        if(PAY_TYPE != '7')
        {
            gfn_comAlert("E0000", "지급구분이 퇴직자정산일 경우에만 실행할 수 있습니다.");
            return;
        }

        if (EMP_CODE == '')
        {
            gfn_comAlert("E0000", "사원을 선택하세요.");
            return;
        }

        if (fn_P_HRP2320_RETI_BAT("CANCEL", "N")){
            fn_search('Q');
        }

    }

    //급여계산
    const fn_P_HRP2320_CHANGE_CREATE =  async function (strWorkType) {

        let PAY_YYYYMM           = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); // 귀속년월
        let BASE_YYYYMM          = gfn_nvl(SBUxMethod.get("SRCH_BASE_YYYYMM")); // 상여기준월
        let PAY_TYPE             = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); // 지급구분
        let PAY_DATE             = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); // 지급일
        let EXPECTED_PAY_DATE    = gfn_nvl(SBUxMethod.get("SRCH_EXPECTED_PAY_DATE")); // 퇴사일
        let PAY_CALCULATE_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_CALCULATE_TYPE")); // 급상여구분

        let COMP_CODE            = gfn_nvl(SBUxMethod.get("COMP_CODE")); // 법인
        let SITE_CODE            = gfn_nvl(SBUxMethod.get("SITE_CODE")); // 사업장
        let PAY_AREA_TYPE        = gfn_nvl(SBUxMethod.get("PAY_AREA_TYPE")); // 급여영역
        let PAY_GROUP_CODE       = gfn_nvl(SBUxMethod.get("PAY_GROUP_CODE")); // 급여체계
        let DEPT_CODE            = gfn_nvl(SBUxMethod.get("DEPT_CODE")); // 부서
        let EMP_CODE             = gfn_nvl(SBUxMethod.get("EMP_CODE")); // 사원

        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일");
            return;
        }
        if (!EXPECTED_PAY_DATE) {
            gfn_comAlert("W0002", "퇴사일");
            return;
        }

        //귀속연월 예외 정보
        let strpay_item_code        = '';
        let strpay_apply_yyyymm_fr  = '';
        let strpay_apply_yyyymm_to  = '';

        // 상여 1년 미만 근속자
        let strpay_work_months      = '';
        let strbonus_apply_type     = '';
        let strbonus_rate_detail    = '';
        let strbonus_amt_detail     = '';

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_PAY_YYYYMM             : PAY_YYYYMM
            ,V_P_PAY_TYPE               : PAY_TYPE
            ,V_P_PAY_DATE               : PAY_DATE
            // 계산 대상 정보
            ,V_P_SITE_CODE              : SITE_CODE
            ,V_P_APPLY_PAY_AREA_TYPE    : PAY_AREA_TYPE
            ,V_P_APPLY_PAY_GROUP_CODE   : PAY_GROUP_CODE
            ,V_P_APPLY_DEPT_CODE        : strEmpCodeList == '' ? DEPT_CODE : ''
            ,V_P_APPLY_EMP_CODE         : strEmpCodeList == '' ? EMP_CODE : ''
            ,V_P_EXPECTED_PAY_DATE      : strEmpCodeList

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp2320CRE.do", {
            getType: 'json',
            workType: strWorkType,
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                if (data.resultMessage) {
                    await alert(data.resultMessage);
                    return true;
                }else{
                    await gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                    return true;
                }

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

    const fn_P_HRP2320_RETI_BAT =  async function (strWorkType, strPassCheck) {

        let PAY_YYYYMM           = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); // 귀속년월
        let BASE_YYYYMM          = gfn_nvl(SBUxMethod.get("SRCH_BASE_YYYYMM")); // 상여기준월
        let PAY_TYPE             = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); // 지급구분
        let PAY_DATE             = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); // 지급일
        let EXPECTED_PAY_DATE    = gfn_nvl(SBUxMethod.get("SRCH_EXPECTED_PAY_DATE")); // 퇴사일
        let PAY_CALCULATE_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_CALCULATE_TYPE")); // 급상여구분


        let SITE_CODE               = gfn_nvl(SBUxMethod.get("SITE_CODE")); // 사업장
        let BONUS_CALCULATE_TYPE    = gfn_nvl(SBUxMethod.get("BONUS_CALCULATE_TYPE"));
        let BONUS_RATE              = gfn_nvl(SBUxMethod.get("BONUS_RATE"));
        let BONUS_PAY_ITEM_CODE     = gfn_nvl(SBUxMethod.get("BONUS_PAY_ITEM_CODE"));

        let PAY_AREA_TYPE           = gfn_nvl(SBUxMethod.get("PAY_AREA_TYPE")); //급여영역
        let PAY_GROUP_CODE          = gfn_nvl(SBUxMethod.get("PAY_GROUP_CODE")); //급여체계
        let DEPT_CODE               = gfn_nvl(SBUxMethod.get("DEPT_CODE")); //부서
        let EMP_CODE                = gfn_nvl(SBUxMethod.get("EMP_CODE")); //사원
        let CALC_YEAR_END_YYYY1     = gfn_nvl(SBUxMethod.get("CALC_YEAR_END_YYYY1").CALC_YEAR_END_YYYY1); //연말정산반영
        let YEAR_END_TAX_YYYY       = gfn_nvl(SBUxMethod.get("YEAR_END_TAX_YYYY")); //정산연도
        let TAX_CALCULATE_EACH      = gfn_nvl(SBUxMethod.get("TAX_CALCULATE_EACH").TAX_CALCULATE_EACH); //소급계산제외
        let CALC_YEAR_END_YYYY2     = gfn_nvl(SBUxMethod.get("CALC_YEAR_END_YYYY2").CALC_YEAR_END_YYYY2); //연말정산 재정산
        let YMDRESERVE_TIME         = gfn_nvl(SBUxMethod.get("YMDRESERVE_TIME")); //예약시간

        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일");
            return;
        }
        if (!EXPECTED_PAY_DATE) {
            gfn_comAlert("W0002", "퇴사일");
            return;
        }

        let gridBonus =gvwBonusGrid.getGridDataAll();
        let gridException =gvwExceptionGrid.getGridDataAll();

        if (_.isEmpty(gridBonus) ||  _.isEmpty(gridException)){
            return false;
        }

        //귀속연월 예외 정보
        let strpay_item_code        = '';
        let strpay_apply_yyyymm_fr  = '';
        let strpay_apply_yyyymm_to  = '';

        // 상여 1년 미만 근속자
        let strpay_work_months      = '';
        let strbonus_apply_type     = '';
        let strbonus_rate_detail    = '';
        let strbonus_amt_detail     = '';

        gridException.forEach((item, index) => {

            strpay_item_code        += item.PAY_ITEM_CODE + "|";
            strpay_apply_yyyymm_fr  += item.PAY_APPLY_YYYYMM_FR + "|";
            strpay_apply_yyyymm_to  += item.PAY_APPLY_YYYYMM_TO + "|";

        });

        if (strpay_item_code.length > 0){
            strpay_item_code        = strpay_item_code.slice(0, -1);
            strpay_apply_yyyymm_fr  = strpay_apply_yyyymm_fr.slice(0, -1);
            strpay_apply_yyyymm_to  = strpay_apply_yyyymm_to.slice(0, -1);
        }

        if (PAY_CALCULATE_TYPE == "ALL" || PAY_CALCULATE_TYPE == "BONUS"){

            gridBonus.forEach((item, index) => {

                strpay_work_months      += item.PAY_WORK_MONTHS + "|";
                strbonus_apply_type     += item.BONUS_APPLY_TYPE + "|";
                strbonus_rate_detail    += item.BONUS_RATE + "|";
                strbonus_amt_detail     += item.BONUS_AMT + "|";

            });

            if (strpay_work_months.length > 0)
            {
                strpay_work_months      = strpay_work_months.slice(0, -1);
                strbonus_apply_type     = strbonus_apply_type.slice(0, -1);
                strbonus_rate_detail    = strbonus_rate_detail.slice(0, -1);
                strbonus_amt_detail     = strbonus_amt_detail.slice(0, -1);
            }
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_SITE_CODE                  : SITE_CODE
            ,V_P_PAY_YYYYMM                 : PAY_YYYYMM
            ,V_P_PAY_CALCULATE_TYPE         : PAY_CALCULATE_TYPE         //-- 'PAY' : 급여,  'BONUS' : 상여,  'ALL' : 급상여
            ,V_P_PAY_TYPE                   : PAY_TYPE         //-- 계산정보
            ,V_P_PAY_DATE                   : PAY_DATE
            ,V_P_TAX_CALCULATE_TYPE         : 'TAXTABLE'         //-- 소득세 적용방법 APPLYALL : 전체일괄세율, INDIVISUAL : 개인별 소득세율 적용, TAXTABLE : 간이세율표
            ,V_P_TAX_RATE                   : 0
            ,V_P_BONUS_CALCULATE_TYPE       : BONUS_CALCULATE_TYPE
            ,V_P_BONUS_RATE                 : BONUS_RATE
            ,V_P_BONUS_PAY_ITEM_CODE        : BONUS_PAY_ITEM_CODE         //-- 상여급여 항목
        //-- 귀속년월 예외 정보
            ,V_P_PAY_ITEM_CODE              : strpay_item_code
            ,V_P_PAY_APPLY_YYYYMM_FR        : strpay_apply_yyyymm_fr
            ,V_P_PAY_APPLY_YYYYMM_TO        : strpay_apply_yyyymm_to
        //-- 상여 1년 미만자 정보
            ,V_P_PAY_WORK_MONTHS            : strpay_work_months
            ,V_P_BONUS_APPLY_TYPE           : strbonus_apply_type
            ,V_P_BONUS_RATE_DETAIL          : strbonus_rate_detail
            ,V_P_BONUS_AMT_DETAIL           : strbonus_amt_detail
        //-- 계산 대상 정보
            ,V_P_APPLY_PAY_AREA_TYPE        : PAY_AREA_TYPE         //-- 추가 급여영역 170915
            ,V_P_APPLY_PAY_GROUP_CODE       : PAY_GROUP_CODE
            ,V_P_APPLY_DEPT_CODE            : strEmpCodeList == '' ? DEPT_CODE : ''
            ,V_P_APPLY_EMP_CODE             : strEmpCodeList == '' ? EMP_CODE : ''
            ,V_P_CALC_YE_YYYY_YN            : CALC_YEAR_END_YYYY1         //--20180228 ADJ
            ,V_P_YEAR_END_TAX_YYYY          : YEAR_END_TAX_YYYY
            ,V_P_PASS_CHECK_YN              : strPassCheck          //-- 이미 급상여 계산한 자료 존재시(귀속년월, 지급구분만 체크) 계속 수행할 것인지에 대한 판단
            ,V_P_TAX_CALCULATE_EACH         : TAX_CALCULATE_EACH          //--  'Y'이면 세금계산 단독으로 아니면 누적(정기급여[='1']이면 단독인 것은 이전 방식 유지)
            ,V_P_RE_CALC_YE_YYYY_YN         : CALC_YEAR_END_YYYY2          //--20170814ADD --연말정산 재정산결과 급여반영여부
            ,V_P_EXPECTED_PAY_DATE          : EXPECTED_PAY_DATE

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp2320CRE.do", {
            getType: 'json',
            workType: strWorkType,
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            //TODO : grpCalculate에 어떤컬럼이 있는지 모르겠음 기능 이해가 안댐

            let bResult = false;
            if (_.isEqual("S", data.resultStatus)) {

                if (strWorkType == "CALCULATE"){
                    //ResultSet rs = CommonCallExecute(ServiceInfo.ERPBizDB, dtData, cProc.ProcName, cProc.GetParamInfo());

                    if (_.isEmpty(data) == false) {
                        if (data.v_errorCode == "P_HRP2320_BAT_011") {

                            //let dr = gfn_comConfirm("Q0000", PAY_YYYYMM + " " + pay_type + "계산된 정보 다른 지급일자가 존재합니다. 계속하시겠습니까?");
                            //DialogResult dr = SetYesNoMessageBox(PAY_YYYYMM + " " + pay_type + ""); // 계산된 정보 다른 지급일자가 존재합니다. 계속하시겠습니까?

                            if (gfn_comConfirm("Q0000", PAY_YYYYMM + " " + pay_type + "계산된 정보 다른 지급일자가 존재합니다. 계속하시겠습니까?")){
                                if (fnSET_P_HRP2320_RETI_BAT("CANCEL", "N"))
                                {
                                    if (fnSET_P_HRP2320_RETI_BAT("CALCULATE", "Y"))
                                    {
                                        bResult = true;
                                    }
                                }
                            }
                        }
                    }
                }
                else if (strWorkType == "CANCEL")
                {
                    bResult = true;
                    //bResult = CommonProcessSave(ServiceInfo.ERPBizDB, dtData, cProc.ProcName, cProc.GetParamInfo(), grpCalculate);
                }

                return bResult;

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

</script>
</body>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
