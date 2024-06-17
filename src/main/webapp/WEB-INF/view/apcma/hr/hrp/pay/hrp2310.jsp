<%
    /**
     * @Class Name        : hrp1000.jsp
     * @Description       : 급상여 조정 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.05.21
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.14   	표주완		최초 생성
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
    <title>title : 급상여 조정 정보</title>
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
                <sbux-button
                        id="btnConfirm" name="btnConfirm" uitype="normal" text="확정"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnConfirm" style="float: right;"
                ></sbux-button>
                <sbux-button
                        id="btnCancel" name="btnCancel" uitype="normal" text="확정취소"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnCancel" style="float: right;"
                ></sbux-button>
            </div>
        </div>


        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        <table class="table table-bordered tbl_fixed">
            <caption>검색 조건 설정</caption>
            <colgroup>
                <col style="width: 7%">
                <col style="width: 5%">
                <col style="width: 5%">
                <col style="width: 5%">

                <col style="width: 7%">
                <col style="width: 5%">
                <col style="width: 5%">
                <col style="width: 5%">

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
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">급여영역</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="srch-pay_area_type"
                            name="srch-pay_area_type"
                            class="form-control input-sm inpt_data_reqed"
                            jsondata-ref="jsonPayAreaType"
                    />
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">귀속년월</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-pay_yyyymm"
                            name="srch-pay_yyyymm"
                            uitype="popup"
                            datepicker-mode="month"
                            date-format="yyyymm"
                            class="form-control input-sm input-sm-ast inpt_data_reqed">
                    </sbux-datepicker>
                </td>
                <th scope="row" class="th_bg">지급구분</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="srch-pay_type"
                            name="srch-pay_type"
                            class="form-control input-sm inpt_data_reqed"
                            jsondata-ref="jsonPayType"
                    />
                </td>
                <th scope="row" class="th_bg">지급일자</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="srch-pay_date"
                            name="srch-pay_date"
                            class="form-control input-sm inpt_data_reqed"
                            jsondata-ref="jsonPayDate"
                    />
                  <%--  <sbux-datepicker
                            id="srch-pay_date"
                            name="srch-pay_date"
                            uitype="popup"
                            datepicker-mode="month"
                            date-format="yyyymm"
                            class="form-control input-sm input-sm-ast inpt_data_reqed">
                    </sbux-datepicker>--%>
                </td>
                <th scope="row" class="th_bg">사번</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-input
                            uitype="text"
                            id="srch-emp_code"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>

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
                    <div id="sb-area-gvwList" style="height:800px; width:100%;"></div>
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
                            <col style="width:6%">
                            <col style="width:5%">
                            <col style="width:2%">

                            <col style="width:6%">
                            <col style="width:3%">
                            <col style="width:4%">
                            <col style="width:2%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">급여체계</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text=""
                                        uitype="single"
                                        id="PAY_GROUP_CODE"
                                        name="PAY_GROUP_CODE"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonPayGroupCode"
                                        readonly
                                />
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">부서</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input
                                        <%--uitype="hidden"--%>
                                        uitype="text"
                                        id="DEPT_CODE"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td>
                                <sbux-input
                                        uitype="text"
                                        id="DEPT_NAME"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td  class="td_input" >
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup1"
                                        readonly
                                ></sbux-button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">사번</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input uitype="text" id="EMP_CODE" class="form-control input-sm" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">이름</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-input uitype="text" id="EMP_NAME" class="form-control input-sm" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">직급</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text=""
                                        uitype="single"
                                        id="JOB_RANK"
                                        name="JOB_RANK"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonJobRank"
                                        readonly
                                />
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">직책</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text=""
                                        uitype="single"
                                        id="DUTY_CODE"
                                        name="DUTY_CODE"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonDutyCode"
                                        readonly
                                />
                            </td>
                            <td colspan="2" style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">입사일</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="ENTER_DATE"
                                        name="ENTER_DATE"
                                        uitype="popup"
                                        date-format="yyyymmdd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        readonly>
                                </sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">퇴사일</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="RETIRE_DATE"
                                        name="RETIRE_DATE"
                                        uitype="popup"
                                        date-format="yyyymmdd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        readonly>
                                </sbux-datepicker>
                            </td>
                            <td colspan="2" style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">수습만료일</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="TEMP_END_DATE"
                                        name="TEMP_END_DATE"
                                        uitype="popup"
                                        date-format="yyyymmdd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        readonly>
                                </sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">상여수습종료일</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="BONUS_APPLY_START_DATE"
                                        name="BONUS_APPLY_START_DATE"
                                        uitype="popup"
                                        date-format="yyyymmdd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        readonly>
                                </sbux-datepicker>
                            </td>
                            <td colspan="2" style="border-right: hidden;"></td>
                        </tr>
                    </table>
                </div>

                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>급여정보</span></li>
                    </ul>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:6%">
                            <col style="width:5%">
                            <col style="width:2%">

                            <col style="width:6%">
                            <col style="width:5%">
                            <col style="width:2%">

                            <col style="width:6%">
                            <col style="width:5%">
                            <col style="width:2%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">급여일</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="PAY_DATE"
                                        name="PAY_DATE"
                                        uitype="popup"
                                        date-format="yyyymmdd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        readonly>
                                </sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">급여기본급</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="SALARY_BASE_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">상여기본급</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="BONUS_BASE_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">급여총액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">상여총액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="BONUS_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">비과세액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="TAX_FREE_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">지급총액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_TOTAL_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">공제총액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_DEDUCTION_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">실지급액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_NET_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">현금지급액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_CASH_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">이체액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="TRANSFER_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                        </tr>
                    </table>
                </div>


                <div class="row">
                    <div class="col-sm-4">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>지급항목</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-gvwPay" style="height:400px; width:100%;"></div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>공제항목</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-gvwDeduct" style="height:400px; width:100%;"></div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>기초정보</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-gvwBasic" style="height:400px; width:100%;"></div>
                        </div>
                    </div>
                </div>
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
    var gvwListGrid; 			// 그리드를 담기위한 객체 선언
    var jsonGvwList = []; 	// 그리드의 참조 데이터 주소 선언
    var gvwPayGrid;
    var jsonPayList = [];
    var gvwDeductGrid;
    var jsonDeductList = [];
    var gvwBasicGrid;
    var jsonBasicList = [];

    var jsonSiteCode = []; //사업장 ( L_ORG001 )srch-site_code, SITE_CODE
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )srch-pay_area_type
    var jsonPayType = []; //지급구분 ( L_HRB008 )srch-pay_type
    var jsonPayDate = []; //지급일자 ( L_HRP027 )srch-pay_date
    var jsonPayGroupCode = []; //급여체계 ( L_HRI010 )pay_group_code
    var jsonJobRank = []; //직급 ( L_HRI005 )JOB_RANK
    var jsonDutyCode = []; //직책 ( L_HRI003 )DUTY_CODE
    var jsonDeptCode = []; //부서 ( P_ORG004 )DEPT_CODE
    var jsonDeptName = []; //부서명 ( P_ORG001 )dept_name
    var jsonPositionCode = []; //직위 ( L_HRI002 )position_code
    var jsonEmpState = []; //재직구분 ( L_HRI009 )emp_state
    var jsonPayItemCode1 = []; //수당항목 ( L_HRP011 )gvwPayGrid
    var jsonPayItemCode2 = []; //공제항목 ( L_HRP012 )gvwDeductGrid
    var jsonPayItemCode3 = []; //기초항목 ( L_HRP015 )gvwBasicGrid


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['gvwListGrid'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['srch-pay_area_type'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['srch-pay_type'], jsonPayType, 'L_HRB008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['srch-pay_date'], jsonPayDate, 'L_HRP027', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_DATE', 'PAY_DATE2', 'Y', ''),

            gfnma_setComSelect(['PAY_GROUP_CODE'], jsonPayGroupCode, 'L_HRI010', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_GROUP_CODE', 'PAY_GROUP_NAME', 'Y', ''),
            gfnma_setComSelect(['JOB_RANK'], jsonJobRank, 'L_HRI005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwListGrid','DUTY_CODE'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

            gfnma_setComSelect(['gvwListGrid'], jsonDeptCode, 'P_ORG004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwListGrid'], jsonDeptName, 'P_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwListGrid'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwListGrid'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),

            gfnma_setComSelect(['gvwPayGrid'], jsonPayItemCode1, 'L_HRP011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),

            gfnma_setComSelect(['gvwDeductGrid'], jsonPayItemCode2, 'L_HRP012', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),

            gfnma_setComSelect(['gvwBasicGrid'], jsonPayItemCode3, 'L_HRP015', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),



            //급여체계
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

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        let openDate = gfn_dateToYm(new Date());

        SBUxMethod.set('srch-pay_yyyymm', openDate);

        fn_createGrid();
        fn_createPayGrid();
        fn_createDeductGrid();
        fn_createBasicGrid();
    }

    function cfn_save() {
        fn_save();
    }

    function cfn_search(){
        fn_search();
    }

    function cfn_add(){

    }
    function cfn_del(){
    }


    //사원 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwList';
        SBGridProperties.id = 'gvwListGrid';
        SBGridProperties.jsonref = 'jsonGvwList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["□"], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption : ["사 업 장"], ref : 'SITE_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : '', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["부    서"], ref : 'DEPT_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDeptCode', displayui : true, label : 'label', value : 'value'}, hidden: true
            },
            {caption : ["부서"], ref : 'DEPT_NAME', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDeptName', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["확정"], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption : ["직위"], ref : 'POSITION_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPositionCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["직책"], ref : 'DUTY_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDutyCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["정산반영"], ref: 'PAY_APPLY_YN', type: 'checkbox', width: '70px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ['급여반영월'], 		ref: 'PAY_APPLY_MONTH', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption : ["재직구분"], ref : 'EMP_STATE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonEmpState', displayui : true, label : 'label', value : 'value'}
            },

        ];

        gvwListGrid = _SBGrid.create(SBGridProperties);
        gvwListGrid.bind('click', 'fn_view');
    }

    //지급항목 리스트
    function fn_createPayGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwPay';
        SBGridProperties.id = 'gvwPayGrid';
        SBGridProperties.jsonref = 'jsonPayList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["수당항목"], ref : 'PAY_ITEM_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode1', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["비과세액"], ref: 'TAX_FREE_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["수량"], ref: 'PAY_QTY', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#', emptyvalue:'0'}},
            {caption: ['귀속년월'], 		ref: 'RE_PAY_YYYYMM', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['소급년월'], 		ref: 'RE_PAY_YYYYMM_P', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['지급일(세무)'],  ref: 'TAX_PAY_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['소급년월일'],  ref: 'RE_PAY_DATE_P', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true}

        ];

        gvwPayGrid = _SBGrid.create(SBGridProperties);
    }

    //공제항목 리스트
    function fn_createDeductGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwDeduct';
        SBGridProperties.id = 'gvwDeductGrid';
        SBGridProperties.jsonref = 'jsonDeductList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["공제항목"], ref : 'PAY_ITEM_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode2', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["수량"], ref: 'PAY_QTY', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#', emptyvalue:'0'}},
            {caption: ['귀속년월'], ref: 'RE_PAY_YYYYMM1', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['소급년월'], 		ref: 'RE_PAY_YYYYMM_P', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['지급일(세무)'],  ref: 'TAX_PAY_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['소급년월일'],  ref: 'RE_PAY_DATE_P', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true}

        ];

        gvwDeductGrid = _SBGrid.create(SBGridProperties);
    }


    //기초정보 리스트
    function fn_createBasicGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwBasic';
        SBGridProperties.id = 'gvwBasicGrid';
        SBGridProperties.jsonref = 'jsonBasicList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["기초항목"], ref : 'pay_item_code', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode3', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["수량"], ref: 'PAY_QTY', type: 'input', width: '150px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#', emptyvalue:'0'}},
            {caption: ['귀속년월'], ref: 'RE_PAY_YYYYMM1', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['소급년월'], 		ref: 'RE_PAY_YYYYMM_P', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['지급일(세무)'],  ref: 'TAX_PAY_DATE', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['소급년월일'],  ref: 'RE_PAY_DATE_P', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true}
        ];

        gvwBasicGrid = _SBGrid.create(SBGridProperties);
    }

    /**
     * 목록 조회
     */
    const fn_search = async function (/*tabMoveVal*/) {

        let SITE_CODE = gfnma_nvl(SBUxMethod.get("srch-site_code")); //사업장
        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let PAY_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm")); //귀속년월
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
        let PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-pay_date")); //지급일자
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("srch-emp_code")); //사번
        let EMP_NAME = gfnma_nvl(SBUxMethod.get("srch-emp_name")); //이름


        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_SITE_CODE      : SITE_CODE
            ,V_P_PAY_YYYYMM     : PAY_YYYYMM
            ,V_P_PAY_DATE       : PAY_DATE
            ,V_P_PAY_TYPE       : PAY_TYPE
            ,V_P_EMP_CODE       : EMP_CODE
            ,V_P_EMP_NAME       : EMP_NAME
            ,V_P_PAY_AREA_TYPE  : PAY_AREA_TYPE

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrp2310List.do", {
            getType: 'json',
            workType: 'LIST',
            cv_count: '5',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log("----------------------------------------------",data);

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonGvwList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN: gfnma_nvl(item.CHK_YN),
                        SITE_CODE: gfnma_nvl(item.SITE_CODE),
                        EMP_CODE: gfnma_nvl(item.EMP_CODE),
                        EMP_NAME: gfnma_nvl(item.EMP_NAME),
                        DEPT_CODE: gfnma_nvl(item.DEPT_CODE),
                        DEPT_NAME: gfnma_nvl(item.DEPT_NAME),
                        PAY_CONFIRM_YN: gfnma_nvl(item.PAY_CONFIRM_YN),
                        POSITION_CODE: gfnma_nvl(item.POSITION_CODE),
                        DUTY_CODE: gfnma_nvl(item.DUTY_CODE),
                        EMP_STATE: gfnma_nvl(item.EMP_STATE),
                        PAY_APPLY_YN: gfnma_nvl(item.PAY_APPLY_YN),
                        PAY_APPLY_MONTH: gfnma_nvl(item.PAY_APPLY_MONTH)

                    }
                    jsonGvwList.push(msg);
                    totalRecordCount++;
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

        let SITE_CODE = gfnma_nvl(SBUxMethod.get("srch-site_code")); //사업장
        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let PAY_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm")); //귀속년월
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
        let PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-pay_date")); //지급일자
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("srch-emp_code")); //사번
        let EMP_NAME = gfnma_nvl(SBUxMethod.get("srch-emp_name")); //이름

        let nRow = gvwListGrid.getRow();

        if (nRow < 1){
            nRow = 1;
        }

        let rowData = gvwListGrid.getRowData(nRow);
        if (!_.isEmpty(rowData)) {

            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                ,V_P_LANG_ID: ''
                ,V_P_COMP_CODE: gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

                ,V_P_SITE_CODE      : SITE_CODE
                ,V_P_PAY_YYYYMM     : PAY_YYYYMM
                ,V_P_PAY_DATE       : PAY_DATE
                ,V_P_PAY_TYPE       : PAY_TYPE
                ,V_P_EMP_CODE       : rowData.EMP_CODE
                ,V_P_EMP_NAME       : rowData.EMP_NAME
                ,V_P_PAY_AREA_TYPE  : PAY_AREA_TYPE

                ,V_P_FORM_ID: p_formId
                ,V_P_MENU_ID: p_menuId
                ,V_P_PROC_ID: ''
                ,V_P_USERID: ''
                ,V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrp5600List.do", {
                getType: 'json',
                workType: 'DETAIL',
                cv_count: '5' +
                    '',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;
            console.log("----------------------2------------------------", data);

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    data.cv_2.forEach((item, index) => {

                        SBUxMethod.set("PAY_GROUP_CODE", gfnma_nvl(item.PAY_GROUP_CODE));
                        SBUxMethod.set("DEPT_CODE", gfnma_nvl(item.DEPT_CODE));
                        SBUxMethod.set("DEPT_NAME", gfnma_nvl(item.DEPT_NAME));
                        SBUxMethod.set("EMP_CODE", gfnma_nvl(item.EMP_CODE));
                        SBUxMethod.set("EMP_NAME", gfnma_nvl(item.EMP_NAME));
                        SBUxMethod.set("JOB_RANK", gfnma_nvl(item.JOB_RANK));
                        SBUxMethod.set("POSITION_CODE", gfnma_nvl(item.POSITION_CODE));
                        SBUxMethod.set("DUTY_CODE", gfnma_nvl(item.DUTY_CODE));
                        SBUxMethod.set("ENTER_DATE", gfnma_nvl(item.ENTER_DATE));
                        SBUxMethod.set("RETIRE_DATE", gfnma_nvl(item.RETIRE_DATE));
                        SBUxMethod.set("TEMP_END_DATE", gfnma_nvl(item.TEMP_END_DATE));
                        SBUxMethod.set("BONUS_APPLY_START_DATE", gfnma_nvl(item.BONUS_APPLY_START_DATE));
                        SBUxMethod.set("PAY_DATE", gfnma_nvl(item.PAY_DATE));
                        SBUxMethod.set("PAY_AMT", gfnma_nvl(item.PAY_AMT));
                        SBUxMethod.set("BONUS_AMT", gfnma_nvl(item.BONUS_AMT));
                        SBUxMethod.set("TAX_FREE_AMT", gfnma_nvl(item.TAX_FREE_AMT));
                        SBUxMethod.set("PAY_TOTAL_AMT", gfnma_nvl(item.PAY_TOTAL_AMT));
                        SBUxMethod.set("PAY_DEDUCTION_AMT", gfnma_nvl(item.PAY_DEDUCTION_AMT));
                        SBUxMethod.set("PAY_NET_AMT", gfnma_nvl(item.PAY_NET_AMT));
                        SBUxMethod.set("PAY_CASH_AMT", gfnma_nvl(item.PAY_CASH_AMT));
                        SBUxMethod.set("TRANSFER_AMT", gfnma_nvl(item.TRANSFER_AMT));
                        SBUxMethod.set("SALARY_BASE_AMT", gfnma_nvl(item.SALARY_BASE_AMT));
                        SBUxMethod.set("BONUS_BASE_AMT", gfnma_nvl(item.BONUS_BASE_AMT));
                       /* SBUxMethod.set("INCENTIVE_BASE_AMT", gfnma_nvl(item.INCENTIVE_BASE_AMT));
                        SBUxMethod.set("COMPETENCE_BASE_AMT", gfnma_nvl(item.COMPETENCE_BASE_AMT));*/

                    });


                    jsonPayList.length = 0;
                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            PAY_ITEM_CODE: gfnma_nvl(item.PAY_ITEM_CODE),
                            PAY_AMT: gfnma_nvl(item.PAY_AMT),
                            TAX_FREE_AMT: gfnma_nvl(item.TAX_FREE_AMT),
                            PAY_QTY: gfnma_nvl(item.PAY_QTY),
                            RE_PAY_YYYYMM: gfnma_nvl(item.RE_PAY_YYYYMM),
                            RE_PAY_YYYYMM_P: gfnma_nvl(item.RE_PAY_YYYYMM_P),
                            RE_PAY_DATE_P: gfnma_nvl(item.RE_PAY_DATE_P),
                            TAX_PAY_DATE: gfnma_nvl(item.TAX_PAY_DATE),

                        }
                        jsonPayList.push(msg);
                    });

                    gvwPayGrid.rebuild();

                    jsonDeductList.length = 0;
                    data.cv_4.forEach((item, index) => {
                        const msg = {
                            PAY_ITEM_CODE: gfnma_nvl(item.PAY_ITEM_CODE),
                            PAY_AMT: gfnma_nvl(item.PAY_AMT),
                            PAY_QTY: gfnma_nvl(item.PAY_QTY),
                            RE_PAY_YYYYMM1: gfnma_nvl(item.RE_PAY_YYYYMM1),
                            RE_PAY_YYYYMM_P: gfnma_nvl(item.RE_PAY_YYYYMM_P),
                            RE_PAY_DATE_P: gfnma_nvl(item.RE_PAY_DATE_P),
                            TAX_PAY_DATE: gfnma_nvl(item.TAX_PAY_DATE)
                        }
                        jsonDeductList.push(msg);
                    });

                    gvwDeductGrid.rebuild();


                    jsonBasicList.length = 0;
                    data.cv_5.forEach((item, index) => {
                        const msg = {
                            PAY_ITEM_CODE: gfnma_nvl(item.PAY_ITEM_CODE),
                            PAY_AMT: gfnma_nvl(item.PAY_AMT),
                            PAY_QTY: gfnma_nvl(item.PAY_QTY),
                            RE_PAY_YYYYMM1: gfnma_nvl(item.RE_PAY_YYYYMM1),
                            RE_PAY_YYYYMM_P: gfnma_nvl(item.RE_PAY_YYYYMM_P),
                            RE_PAY_DATE_P: gfnma_nvl(item.RE_PAY_DATE_P),
                            TAX_PAY_DATE: gfnma_nvl(item.TAX_PAY_DATE)
                        }
                        jsonBasicList.push(msg);
                    });

                    gvwBasicGrid.rebuild();

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

    }


</script>
</body>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
