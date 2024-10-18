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
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
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
        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        <table id="dataArea1" class="table table-bordered tbl_fixed">
            <caption>검색 조건 설정</caption>
            <colgroup>
                <col style="width: 7%">
                <col style="width: 7%">
                <col style="width: 5%">
                <col style="width: 3%">

                <col style="width: 7%">
                <col style="width: 7%">
                <col style="width: 5%">
                <col style="width: 3%">

                <col style="width: 7%">
                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 2%">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row" class="th_bg">귀속년월</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-pay_yyyymm"
                            name="srch-pay_yyyymm"
                            uitype="popup"
                            datepicker-mode="month"
                            date-format="yyyymm"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            <%--onchange="fn_payDate"--%>>
                    </sbux-datepicker>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">상여기준월</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-base_yyyymm"
                            name="srch-base_yyyymm"
                            uitype="popup"
                            datepicker-mode="month"
                            date-format="yyyymm"
                            class="form-control input-sm input-sm-ast"
                    <%--onchange="fn_payDate"--%>>
                    </sbux-datepicker>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">급상여구분</th>
               <%-- <td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            unselected-text=""
                            uitype="single"
                            id="srch-pay_calculate_type"
                            name="srch-pay_calculate_type"
                            class="form-control input-sm inpt_data_reqed"
                            jsondata-ref="jsonPayCalculateType"
                    />
                </td>--%>
                <td class="td_input">
                    <sbux-select
                            id="srch-pay_calculate_type"
                            uitype="single"
                            jsondata-ref="jsonPayCalculateType"
                            unselected-text="선택"
                            class="form-control input-sm"
                            <%--onchange="fn_payType"--%>>
                    </sbux-select>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">지급구분</th>
                <%--<td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            unselected-text=""
                            uitype="single"
                            id="srch-pay_type"
                            name="srch-pay_type"
                            class="form-control input-sm inpt_data_reqed"
                            jsondata-ref="jsonPayType"
                            onchange="fn_payType"
                    />
                </td>--%>
                <td class="td_input">
                    <sbux-select
                            id="srch-pay_type"
                            uitype="single"
                            jsondata-ref="jsonPayType"
                            unselected-text="선택"
                            class="form-control input-sm inpt_data_reqed"
                            onchange="fn_payType">
                    </sbux-select>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">지급일</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-pay_date"
                            name="srch-pay_date"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            >
                    </sbux-datepicker>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">퇴사일</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-expected_pay_date"
                            name="srch-expected_pay_date"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            >
                    </sbux-datepicker>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
            </tr>
            </tbody>
        </table>

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
                                    class="form-control input-sm inpt_data_reqed">
                            </sbux-select>
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
                                    text="찾기" uitype="modal"
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
                                    text="찾기" uitype="modal"
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
                                    date-format="yyyymm"
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
            </div>
        </div>

        <div>
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li><span>계산 이력(로그)</span></li>
                </ul>
            </div>
            <div>
                <div id="sb-area-gvwLog" style="height:800px; width:100%;"></div>
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
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    //grid 초기화
    var gvwLogGrid; 			// 그리드를 담기위한 객체 선언
    var jsonGvwLogList = []; 	// 그리드의 참조 데이터 주소 선언

    var jsonPayType = []; //지급구분 //srch-pay_type  //L_HRB008
    var jsonPayCalculateType = []; //급상여구분 //srch-pay_calculate_type  //L_HRP005
    var jsonCompCode = []; //법인 //comp_code  //L_ORG000
    var jsonPayAreaType = []; //급여영역 //PAY_AREA_TYPE  //L_HRP034
    var jsonSiteCode = []; //사업장 //SITE_CODE  //L_ORG001
    var jsonPayGroupCode = []; //급여체계 //PAY_GROUP_CODE  //L_HRI010
    var jsonCalculateWorkType = []; //처리구분 //CALCULATE_WORK_TYPE  //L_HRP008

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['srch-pay_type'], jsonPayType, 'L_HRB008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['srch-pay_calculate_type'], jsonPayCalculateType, 'L_HRP005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['COMP_CODE'], jsonCompCode, 'L_ORG000', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'COMP_CODE', 'COMP_NAME', 'Y', ''),
            gfnma_setComSelect(['PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['PAY_GROUP_CODE'], jsonPayGroupCode, 'L_HRI010', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_GROUP_CODE', 'PAY_GROUP_NAME', 'Y', ''),
            gfnma_setComSelect(['CALCULATE_WORK_TYPE'], jsonCalculateWorkType, 'L_HRP008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '')


        ]);
    }

    /**
     * 공통팝업3
     */
    var fn_compopup1 = function() {

        var searchText 		= gfnma_nvl(SBUxMethod.get("DEPT_NAME"));

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
                SBUxMethod.set('DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function() {

        var searchText = gfnma_nvl(SBUxMethod.get("EMP_FULL_NAME"));
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

        SBUxMethod.set('srch-pay_yyyymm', openDate);

        fn_createGrid();
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
        fn_search();
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
            {caption: ["연번"], ref: 'PAY_CALCULATE_SEQ', type: 'output', width: '200px', style: 'text-align:left'},
            {caption : ["처리구분"], ref : 'CALCULATE_WORK_TYPE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonCalculateWorkType', displayui : true, label : 'label', value : 'value'}
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

    // 지급일자 가져오기
    const fn_search = async function () {

        let PAY_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm")); // 귀속년월
        let BASE_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-base_yyyymm")); // 상여기준월
        let PAY_CALCULATE_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_calculate_type")); // 급상여구분
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); // 지급구분
        let PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-pay_date")); // 지급일
        let EXPECTED_PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-expected_pay_date")); // 퇴사일


        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_SITE_CODE          : ''
            ,V_P_PAY_YYYYMM         : PAY_YYYYMM
            ,V_P_PAY_CALCULATE_TYPE : ''
            /* -- 'PAY' : 급여,  'BONUS' : 상여,  'ALL' : 급상여*/
            ,V_P_PAY_TYPE           : PAY_TYPE
            ,V_P_PAY_DATE           : ''
            ,V_P_PAY_AREA_TYPE      : ''

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/selectHrp2320List.do", {
            getType: 'json',
            workType: 'Q',
            cv_count: '8',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                data.cv_3.forEach((item, index) => {
                    const msg = {
                        PAY_ITEM_CODE		        : gfnma_nvl(item.PAY_ITEM_CODE),
                        PAY_APPLY_YYYYMM_FR		        : gfnma_nvl(item.PAY_APPLY_YYYYMM_FR),
                        PAY_APPLY_YYYYMM_TO		        : gfnma_nvl(item.PAY_APPLY_YYYYMM_TO)
                    }
                });

                data.cv_4.forEach((item, index) => {
                    const msg = {
                        PAY_WORK_MONTHS		        : gfnma_nvl(item.PAY_WORK_MONTHS),
                        BONUS_APPLY_TYPE		        : gfnma_nvl(item.BONUS_APPLY_TYPE),
                        BONUS_RATE		        : gfnma_nvl(item.BONUS_RATE),
                        BONUS_AMT		        : gfnma_nvl(item.BONUS_AMT),

                    }
                });


                /** @type {number} **/
                //let totalRecordCount = 0;

                jsonGvwLogList.length = 0;
                data.cv_5.forEach((item, index) => {
                    const msg = {
                        PAY_CALCULATE_SEQ		 : gfnma_nvl(item.PAY_CALCULATE_SEQ),
                        CALCULATE_WORK_TYPE		 : gfnma_nvl(item.CALCULATE_WORK_TYPE),
                        TAX_CALCULATE_TYPE		 : gfnma_nvl(item.TAX_CALCULATE_TYPE),
                        TAX_RATE		         : gfnma_nvl(item.TAX_RATE),
                        BONUS_CALCULATE_TYP      : gfnma_nvl(item.BONUS_CALCULATE_TYP),
                        BONUS_RATE		         : gfnma_nvl(item.BONUS_RATE),
                        BONUS_APPLY_TYPE		 : gfnma_nvl(item.BONUS_APPLY_TYPE),
                        CALCULATE_CONDITION		 : gfnma_nvl(item.CALCULATE_CONDITION),
                        MEMO		             : gfnma_nvl(item.MEMO),
                        ACTION_START_TIME		 : gfnma_nvl(item.ACTION_START_TIME),
                        ACTION_END_TIME		     : gfnma_nvl(item.ACTION_END_TIME),
                        INSERT_USERID		     : gfnma_nvl(item.INSERT_USERID),
                        INSERT_TIME		         : gfnma_nvl(item.INSERT_TIME),
                        INSERT_PC		         : gfnma_nvl(item.INSERT_PC),
                        PAY_AREA_TYPE		     : gfnma_nvl(item.PAY_AREA_TYPE),
                    }
                    jsonGvwLogList.push(msg);
                    //totalRecordCount ++;
                });

                gvwLogGrid.rebuild();
                //document.querySelector('#listCount').innerText = totalRecordCount;


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
    async function fn_view(date) {

    }

    // 지급일자 가져오기
    const fn_payType = async function () {

        let PAY_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm")); // 귀속년월
        let BASE_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-base_yyyymm")); // 상여기준월
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); // 지급구분


        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_SITE_CODE          : ''
            ,V_P_PAY_YYYYMM         : PAY_YYYYMM
            ,V_P_PAY_CALCULATE_TYPE : ''
            /* -- 'PAY' : 급여,  'BONUS' : 상여,  'ALL' : 급상여*/
            ,V_P_PAY_TYPE           : PAY_TYPE
            ,V_P_PAY_DATE           : ''
            ,V_P_PAY_AREA_TYPE      : ''

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/selectHrp2320List.do", {
            getType: 'json',
            workType: 'PAYDATE',
            cv_count: '8',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                data.cv_1.forEach((item, index) => {

                        SBUxMethod.set("srch-pay_date", 			rowData.PAY_DATE);
                        SBUxMethod.set("srch-expected_pay_date", 	rowData.EXPECTED_PAY_DATE);

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

    //소급계산제외 여부
    const fn_taxCalculateEach = async function () {
        let TAX_CALCULATE_EACH = gfnma_nvl(SBUxMethod.get("TAX_CALCULATE_EACH")); // 소급계산제외 여부

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

        let CHKRESERVE_YN = gfnma_nvl(SBUxMethod.get("CHKRESERVE_YN")); // 예약여부

        if (_.isEqual(CHKRESERVE_YN.CHKRESERVE_YN, 'Y')) {

            SBUxMethod.attr('YMDRESERVE_TIME',	'readonly', false);

        }else{
            SBUxMethod.set("YMDRESERVE_TIME", 			"");
            SBUxMethod.attr('YMDRESERVE_TIME',	'readonly', true);
        }
    }


    //복수선택
    const fn_btnMultiSelect =  async function () {

    }


    //급여계산
    const fn_btnCalculate =  async function () {

        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); // 예약여부
        let PAY_CALCULATE_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_calculate_type")); // 예약여부

        if (_.isEqual(PAY_TYPE, '99')){
            gfn_comAlert("E0000", "소급분임금 계산은 [급상여 소급처리] 화면에서 수행하십시오.");		//	W0001	{0}
            return;
        }
        gfn_comAlert("I0002", "급여계산버튼을","실행");		//	W0001	{0}

        //급여계산
        fn_P_HRP2320_BAT();

        if (_.isEqual(PAY_CALCULATE_TYPE, 'PAY')){

            //필수값 검증
            if(!SBUxMethod.validateRequired({
                isDetectAttack: true,
                group_id : 'group1'})) {
                return false;
            }
        }else{

        }


    }


    //급여계산
    const fn_P_HRP2320_BAT =  async function () {



    }

</script>
</body>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
