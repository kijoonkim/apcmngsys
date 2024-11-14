<%
    /**
     * @Class Name        : hrp2310.jsp
     * @Description       : 급상여 조정 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.06.14
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
            <div style="margin-left: auto;">
                <sbux-button
                        id="btnCancel" name="btnCancel" uitype="normal" text="확정취소"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnCancel" style="float: right;"
                ></sbux-button>
                <sbux-button
                        id="btnConfirm" name="btnConfirm" uitype="normal" text="확정"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnConfirm" style="float: right;"
                ></sbux-button>
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
                    <th scope="row" class="th_bg_search">사업장</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle"
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
                    <th scope="row" class="th_bg_search">급여영역</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-select
                                unselected-text="선택"
                                uitype="single"
                                id="SRCH_PAY_AREA_TYPE"
                                name="SRCH_PAY_AREA_TYPE"
                                class="form-control input-sm inpt_data_reqed"
                                jsondata-ref="jsonPayAreaType"
                                onchange="fn_payDate"
                        />
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">귀속년월</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_PAY_YYYYMM"
                                name="SRCH_PAY_YYYYMM"
                                uitype="popup"
                                datepicker-mode="month"
                                date-format="yyyy-mm"
                                class="table-datepicker-ma inpt_data_reqed"
                                onchange="fn_payDate">
                        </sbux-datepicker>
                    </td>
                    <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">지급구분</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-select
                                unselected-text="선택"
                                uitype="single"
                                id="SRCH_PAY_TYPE"
                                name="SRCH_PAY_TYPE"
                                class="form-control input-sm inpt_data_reqed"
                                jsondata-ref="jsonPayType"
                                onchange="fn_payDate"
                        />
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">지급일자</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-select
                                unselected-text="선택"
                                uitype="single"
                                id="SRCH_PAY_DATE"
                                name="SRCH_PAY_DATE"
                                class="form-control input-sm inpt_data_reqed"
                                jsondata-ref="jsonPayDate"
                        />
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">사번</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="SRCH_EMP_CODE"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">이름</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="SRCH_EMP_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="6" style="border-right: hidden;">&nbsp;</td>
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
                    <div id="sb-area-gvwList" style="height:800px; width:100%;"></div>
                </div>
            </div>

            <div class="col-sm-8">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>사원정보</span></li>
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

                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:4%">

                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">급여체계</th>
                          <%--  <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text=""
                                        uitype="single"
                                        id="PAY_GROUP_CODE"
                                        name="PAY_GROUP_CODE"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonPayGroupCode"
                                        readonly
                                />
                            </td>--%>
                            <td colspan="2" class="td_input">
                                <sbux-select
                                        id="PAY_GROUP_CODE"
                                        uitype="single"
                                        jsondata-ref="jsonPayGroupCode"
                                        unselected-text="선택"
                                        class="form-control input-sm"
                                        readonly>
                                </sbux-select>
                            </td>
                            <%--<td style="border-right: hidden;"></td>--%>
                            <th scope="row" class="th_bg">부서</th>
                            <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                                <sbux-input
                                        <%--uitype="hidden"--%>
                                        uitype="text"
                                        id="DEPT_CODE"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                                <sbux-input
                                        uitype="text"
                                        id="DEPT_NAME"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td colspan="4"  class="td_input" data-group="DEPT">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…"
                                        uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup1"
                                        readonly
                                ></sbux-button>
                            </td>
                            <%--<td colspan="3" style="border-right: hidden;"></td>--%>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">사번</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-input uitype="text" id="EMP_CODE" class="form-control input-sm" readonly></sbux-input>
                            </td>
                            <%--<td style="border-right: hidden;"></td>--%>
                            <th scope="row" class="th_bg">이름</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-input uitype="text" id="EMP_NAME" class="form-control input-sm" readonly></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <td colspan="3" style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">직급</th>
                            <%--<td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text=""
                                        uitype="single"
                                        id="JOB_RANK"
                                        name="JOB_RANK"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonJobRank"
                                        readonly
                                />
                            </td>--%>
                            <td colspan="2" class="td_input">
                                <sbux-select
                                        id="JOB_RANK"
                                        uitype="single"
                                        jsondata-ref="jsonJobRank"
                                        unselected-text="선택"
                                        class="form-control input-sm"
                                        readonly>
                                </sbux-select>
                            </td>
                           <%-- <td style="border-right: hidden;"></td>--%>
                            <th scope="row" class="th_bg">직책</th>
                           <%-- <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text=""
                                        uitype="single"
                                        id="DUTY_CODE"
                                        name="DUTY_CODE"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonDutyCode"
                                        readonly
                                />
                            </td>--%>
                            <td class="td_input">
                                <sbux-select
                                        id="DUTY_CODE"
                                        uitype="single"
                                        jsondata-ref="jsonDutyCode"
                                        unselected-text="선택"
                                        class="form-control input-sm"
                                        readonly>
                                </sbux-select>
                            </td>
                            <td colspan="2" style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">입사일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="ENTER_DATE"
                                        name="ENTER_DATE"
                                        uitype="popup"
                                        date-format="yyyymmdd"
                                        class="form-control input-sm input-sm-ast"
                                        readonly>
                                </sbux-datepicker>
                            </td>
                           <%-- <td style="border-right: hidden;"></td>--%>
                            <th scope="row" class="th_bg">퇴사일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="RETIRE_DATE"
                                        name="RETIRE_DATE"
                                        uitype="popup"
                                        date-format="yyyymmdd"
                                        class="form-control input-sm input-sm-ast"
                                        readonly>
                                </sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">퇴직자 정산세액 반영</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-button
                                        id="btnApply"
                                        name="btnApply"
                                        uitype="normal"
                                        text="정산반영"
                                        class="btn btn-sm btn-outline-danger"
                                        onclick="fn_btnApply"
                                        style="float: right;"
                                        disabled>
                                </sbux-button>
                            </td>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-button
                                        id="btnApplyCancel"
                                        name="btnApplyCancel"
                                        uitype="normal"
                                        text="반영취소"
                                        class="btn btn-sm btn-outline-danger"
                                        onclick="fn_btnApplyCancel"
                                        style="float: right;"
                                        disabled>
                                </sbux-button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">수습만료일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="TEMP_END_DATE"
                                        name="TEMP_END_DATE"
                                        uitype="popup"
                                        date-format="yyyymmdd"
                                        class="form-control input-sm input-sm-ast"
                                        readonly>
                                </sbux-datepicker>
                            </td>
                          <%--  <td style="border-right: hidden;"></td>--%>
                            <th scope="row" class="th_bg">상여수습종료일</th>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="BONUS_APPLY_START_DATE"
                                        name="BONUS_APPLY_START_DATE"
                                        uitype="popup"
                                        date-format="yyyymmdd"
                                        class="form-control input-sm input-sm-ast"
                                        readonly>
                                </sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;"></td>
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
                                        class="form-control input-sm input-sm-ast"
                                        readonly>
                                </sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">급여기본급</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="SALARY_BASE_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" ></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">상여기본급</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="BONUS_BASE_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" ></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">급여총액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" ></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">상여총액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="BONUS_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" ></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">비과세액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="TAX_FREE_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" ></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">지급총액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_TOTAL_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" ></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">공제총액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_DEDUCTION_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" ></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">실지급액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_NET_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" ></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">현금지급액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="PAY_CASH_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}"
                                            onchange="fn_payCashAmt"></sbux-input>
                            </td>
                            <td style="border-right: hidden;"></td>
                            <th scope="row" class="th_bg">이체액</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="TRANSFER_AMT" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm" mask = "{ 'alias': 'numeric','-'}" ></sbux-input>
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
                                    <span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
                                </li>
                            </ul>
                            <div class="ad_tbl_toplist">
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
                                    <%--<span style="font-size:12px">(조회건수 <span id="listCount2">0</span>건)</span>--%>
                                </li>
                            </ul>
                            <div class="ad_tbl_toplist">
                                <sbux-button
                                        id="btnDel1"
                                        name="btnDel1"
                                        uitype="normal"
                                        text="행삭제"
                                        class="btn btn-sm btn-outline-danger"
                                        onclick="fn_delRow1"
                                        style="float: right;"
                                >
                                </sbux-button>
                                <sbux-button
                                        id="btnAdd1"
                                        name="btnAdd1"
                                        uitype="normal"
                                        text="행추가"
                                        class="btn btn-sm btn-outline-danger"
                                        onclick="fn_addRow1"
                                        style="float: right;"
                                ></sbux-button>
                            </div>
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
                                    <span style="font-size:12px">(조회건수 <span id="listCount3">0</span>건)</span>
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

    var jsonSiteCode = []; //사업장 ( L_ORG001 )SRCH_SITE_CODE, SITE_CODE
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )SRCH_PAY_AREA_TYPE
    var jsonPayType = []; //지급구분 ( L_HRB008 )SRCH_PAY_TYPE
    var jsonPayDate = []; //지급일자 ( L_HRP027 )SRCH_PAY_DATE
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

            gfnma_setComSelect(['gvwListGrid'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_TYPE'], jsonPayType, 'L_HRB008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            /*gfnma_setComSelect(['SRCH_PAY_DATE'], jsonPayDate, 'L_HRP027', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_DATE', 'PAY_DATE2', 'Y', ''),
*/
            gfnma_setComSelect(['PAY_GROUP_CODE'], jsonPayGroupCode, 'L_HRI010', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_GROUP_CODE', 'PAY_GROUP_NAME', 'Y', ''),
            gfnma_setComSelect(['JOB_RANK'], jsonJobRank, 'L_HRI005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwListGrid','DUTY_CODE'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

            gfnma_setComSelect(['gvwListGrid'], jsonDeptCode, 'P_ORG004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwListGrid'], jsonDeptName, 'P_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwListGrid'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwListGrid'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),

            gfnma_setComSelect(['gvwPayGrid'], jsonPayItemCode1, 'L_HRP011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),

            gfnma_setComSelect(['gvwDeductGrid'], jsonPayItemCode2, 'L_HRP012', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),

            gfnma_setComSelect(['gvwBasicGrid'], jsonPayItemCode3, 'L_HRP015', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),



            //급여체계
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
    var fn_compopup1 = function() {

        var searchText 		= gfn_nvl(SBUxMethod.get("srch-dept_name"));

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
                SBUxMethod.set('srch-dept_name', data.DEPT_NAME);
                SBUxMethod.set('srch-dept_code', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    /**
     * 지급일자 조회
     */
    var fn_payDate = function() {

        let PAY_YYYYMM      = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); //귀속년월
        let PAY_TYPE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let PAY_AREA_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역

        let V_P_WHERE_CLAUSE = "WHERE site_code IN (select site_code from orgsite where comp_code ='"+gv_ma_selectedCorpCd+ "') AND pay_yyyymm = '"
            + PAY_YYYYMM + "' AND pay_type = '" + PAY_TYPE + "'AND pay_area_type ='" + PAY_AREA_TYPE + "'";

        gfnma_setComSelect(['SRCH_PAY_DATE'], jsonPayDate, 'L_HRP027', V_P_WHERE_CLAUSE, gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_DATE', 'PAY_DATE2', 'Y', '');


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
        fn_createPayGrid();
        fn_createDeductGrid();
        fn_createBasicGrid();

        SBUxMethod.hide('btnAdd');
        SBUxMethod.hide('btnAdd1');
        SBUxMethod.hide('btnDel');
        SBUxMethod.hide('btnDel1');
    }

    function cfn_save() {
        fn_save();
    }

    function cfn_search(){
        fn_search();
    }

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }

    /*function cfn_add(){

    }
    function cfn_del(){
        fn_del();
    }*/


    //사원 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwList';
        SBGridProperties.id = 'gvwListGrid';
        SBGridProperties.jsonref = 'jsonGvwList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true;
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["□"], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption : ["사 업 장"], ref : 'SITE_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode',  label : 'label', value : 'value'}
            },
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["부    서"], ref : 'DEPT_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDeptCode',  label : 'label', value : 'value'}, hidden: true
            },
            {caption : ["부서"], ref : 'DEPT_NAME', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDeptName',  label : 'label', value : 'value'}
            },
            {caption: ["확정"], ref: 'PAY_CONFIRM_YN', type: 'checkbox', width: '70px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption : ["직위"], ref : 'POSITION_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPositionCode',  label : 'label', value : 'value'}
            },
            {caption : ["직책"], ref : 'DUTY_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDutyCode',  label : 'label', value : 'value'}
            },
            {caption: ["정산반영"], ref: 'PAY_APPLY_YN', type: 'checkbox', width: '70px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ['급여반영월'], ref: 'PAY_APPLY_MONTH', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption : ["재직구분"], ref : 'EMP_STATE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonEmpState',  label : 'label', value : 'value'}
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
        //SBGridProperties.filtering = true
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["수당항목"], ref : 'PAY_ITEM_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode1',  label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["비과세액"], ref: 'TAX_FREE_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["수량"], ref: 'PAY_QTY', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#', emptyvalue:'0'}},
            {caption: ['귀속년월'], 		ref: 'RE_PAY_YYYYMM', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['소급년월'], 		ref: 'RE_PAY_YYYYMM_P', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['지급일(세무)'],  ref: 'TAX_PAY_DATE', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['소급년월일'],  ref: 'RE_PAY_DATE_P', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
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
        //SBGridProperties.filtering = true
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["공제항목"], ref : 'PAY_ITEM_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode2',  label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["수량"], ref: 'PAY_QTY', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#', emptyvalue:'0'}},
            {caption: ['귀속년월'], ref: 'RE_PAY_YYYYMM1', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['소급년월'], 		ref: 'RE_PAY_YYYYMM_P', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['지급일(세무)'],  ref: 'TAX_PAY_DATE', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['소급년월일'],  ref: 'RE_PAY_DATE_P', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
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
        //SBGridProperties.filtering = true
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["기초항목"], ref : 'pay_item_code', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode3',  label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#,###', emptyvalue:'0'}},
            {caption: ["수량"], ref: 'PAY_QTY', type: 'input', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number', rule:'#', emptyvalue:'0'}},
            {caption: ['귀속년월'], ref: 'RE_PAY_YYYYMM1', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['소급년월'], 		ref: 'RE_PAY_YYYYMM_P', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption: ['지급일(세무)'],  ref: 'TAX_PAY_DATE', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['소급년월일'],  ref: 'RE_PAY_DATE_P', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true}
        ];

        gvwBasicGrid = _SBGrid.create(SBGridProperties);
    }

    /**
     * 입력 초기화
     */
    const fn_clearForm = function(type) {


        if (_.isEqual(type, '1')) {
            SBUxMethod.set("PAY_GROUP_CODE"         , "");
            SBUxMethod.set("DEPT_CODE"              , "");
            SBUxMethod.set("DEPT_NAME"              , "");
            SBUxMethod.set("EMP_CODE"               , "");
            SBUxMethod.set("EMP_NAME"               , "");
            SBUxMethod.set("JOB_RANK"               , "");
            SBUxMethod.set("DUTY_CODE"              , "");
            SBUxMethod.set("ENTER_DATE"             , "");
            SBUxMethod.set("RETIRE_DATE"            , "");
            SBUxMethod.set("TEMP_END_DATE"          , "");
            SBUxMethod.set("BONUS_APPLY_START_DATE" , "");
            SBUxMethod.set("BONUS_APPLY_START_DATE" , "");
        }

        SBUxMethod.set("PAY_DATE"           , 			"");
        SBUxMethod.set("SALARY_BASE_AMT"    , 			"");
        SBUxMethod.set("BONUS_BASE_AMT"     , 			"");
        SBUxMethod.set("PAY_AMT"            , 			"");
        SBUxMethod.set("BONUS_AMT"          , 			"");
        SBUxMethod.set("TAX_FREE_AMT"       , 			"");
        SBUxMethod.set("PAY_TOTAL_AMT"      , 			"");
        SBUxMethod.set("PAY_DEDUCTION_AMT"  , 			"");
        SBUxMethod.set("PAY_NET_AMT"        , 			"");
        SBUxMethod.set("PAY_CASH_AMT"       , 			"");
        SBUxMethod.set("TRANSFER_AMT"       , 			"");


    }

    /**
     * 목록 조회
     */
    const fn_search = async function (/*tabMoveVal*/) {

        fn_clearForm('1');


        let SITE_CODE       = gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        let PAY_AREA_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let PAY_YYYYMM      = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); //귀속년월
        let PAY_TYPE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let PAY_DATE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); //지급일자
        let EMP_CODE        = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사번
        let EMP_NAME        = gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME")); //이름

        if (!PAY_AREA_TYPE) {
            gfn_comAlert("W0002", "급여영역");
            return;
        }
        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일자");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
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


        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/selectHrp2310List.do", {
            getType: 'json',
            workType: 'LIST',
            cv_count: '5',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonGvwList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN          : gfn_nvl(item.CHK_YN),
                        SITE_CODE       : gfn_nvl(item.SITE_CODE),
                        EMP_CODE        : gfn_nvl(item.EMP_CODE),
                        EMP_NAME        : gfn_nvl(item.EMP_NAME),
                        DEPT_CODE       : gfn_nvl(item.DEPT_CODE),
                        DEPT_NAME       : gfn_nvl(item.DEPT_NAME),
                        PAY_CONFIRM_YN  : gfn_nvl(item.PAY_CONFIRM_YN),
                        POSITION_CODE   : gfn_nvl(item.POSITION_CODE),
                        DUTY_CODE       : gfn_nvl(item.DUTY_CODE),
                        EMP_STATE       : gfn_nvl(item.EMP_STATE),
                        PAY_APPLY_YN    : gfn_nvl(item.PAY_APPLY_YN),
                        PAY_APPLY_MONTH : gfn_nvl(item.PAY_APPLY_MONTH)

                    }
                    jsonGvwList.push(msg);
                    totalRecordCount++;
                });

                gvwListGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if(jsonGvwList.length > 0) {
                    gvwListGrid.clickRow(1);
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

        fn_clearForm('');

        let SITE_CODE       = gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        let PAY_AREA_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let PAY_YYYYMM      = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); //귀속년월
        let PAY_TYPE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let PAY_DATE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); //지급일자
        let EMP_CODE        = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사번
        let EMP_NAME        = gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME")); //이름

        let nRow = gvwListGrid.getRow();
        let nCol = gvwListGrid.getCol();

        if (nCol == -1) {
            return;
        }
        if (nRow < 1) {
            return;
        }

        let rowData = gvwListGrid.getRowData(nRow);
        if (!_.isEmpty(rowData)) {

            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                ,V_P_LANG_ID: ''
                ,V_P_COMP_CODE: gv_ma_selectedCorpCd
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

            const postJsonPromise = gfn_postJSON("/hr/hrp/pay/selectHrp2310List.do", {
                getType: 'json',
                workType: 'DETAIL',
                cv_count: '5',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    data.cv_2.forEach((item, index) => {

                        SBUxMethod.set("PAY_GROUP_CODE"         , gfn_nvl(item.PAY_GROUP_CODE));
                        SBUxMethod.set("DEPT_CODE"              , gfn_nvl(item.DEPT_CODE));
                        SBUxMethod.set("DEPT_NAME"              , gfn_nvl(item.DEPT_NAME));
                        SBUxMethod.set("EMP_CODE"               , gfn_nvl(item.EMP_CODE));
                        SBUxMethod.set("EMP_NAME"               , gfn_nvl(item.EMP_NAME));
                        SBUxMethod.set("JOB_RANK"               , gfn_nvl(item.JOB_RANK));
                        SBUxMethod.set("POSITION_CODE"          , gfn_nvl(item.POSITION_CODE));
                        SBUxMethod.set("DUTY_CODE"              , gfn_nvl(item.DUTY_CODE));
                        SBUxMethod.set("ENTER_DATE"             , gfn_nvl(item.ENTER_DATE));
                        SBUxMethod.set("RETIRE_DATE"            , gfn_nvl(item.RETIRE_DATE));
                        SBUxMethod.set("TEMP_END_DATE"          , gfn_nvl(item.TEMP_END_DATE));
                        SBUxMethod.set("BONUS_APPLY_START_DATE" , gfn_nvl(item.BONUS_APPLY_START_DATE));
                        SBUxMethod.set("PAY_DATE"               , gfn_nvl(item.PAY_DATE));
                        SBUxMethod.set("PAY_AMT"                , gfn_nvl(item.PAY_AMT));
                        SBUxMethod.set("BONUS_AMT"              , gfn_nvl(item.BONUS_AMT));
                        SBUxMethod.set("TAX_FREE_AMT"           , gfn_nvl(item.TAX_FREE_AMT));
                        SBUxMethod.set("PAY_TOTAL_AMT"          , gfn_nvl(item.PAY_TOTAL_AMT));
                        SBUxMethod.set("PAY_DEDUCTION_AMT"      , gfn_nvl(item.PAY_DEDUCTION_AMT));
                        SBUxMethod.set("PAY_NET_AMT"            , gfn_nvl(item.PAY_NET_AMT));
                        SBUxMethod.set("PAY_CASH_AMT"           , gfn_nvl(item.PAY_CASH_AMT));
                        SBUxMethod.set("TRANSFER_AMT"           , gfn_nvl(item.TRANSFER_AMT));
                        SBUxMethod.set("SALARY_BASE_AMT"        , gfn_nvl(item.SALARY_BASE_AMT));
                        SBUxMethod.set("BONUS_BASE_AMT"         , gfn_nvl(item.BONUS_BASE_AMT));
                       /* SBUxMethod.set("INCENTIVE_BASE_AMT", gfn_nvl(item.INCENTIVE_BASE_AMT));
                        SBUxMethod.set("COMPETENCE_BASE_AMT", gfn_nvl(item.COMPETENCE_BASE_AMT));*/

                    });

                    jsonPayList.length = 0;
                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            PAY_ITEM_CODE   : gfn_nvl(item.PAY_ITEM_CODE),
                            PAY_AMT         : gfn_nvl(item.PAY_AMT),
                            TAX_FREE_AMT    : gfn_nvl(item.TAX_FREE_AMT),
                            PAY_QTY         : gfn_nvl(item.PAY_QTY),
                            RE_PAY_YYYYMM   : gfn_nvl(item.RE_PAY_YYYYMM),
                            RE_PAY_YYYYMM_P : gfn_nvl(item.RE_PAY_YYYYMM_P),
                            RE_PAY_DATE_P   : gfn_nvl(item.RE_PAY_DATE_P),
                            TAX_PAY_DATE    : gfn_nvl(item.TAX_PAY_DATE),

                        }
                        jsonPayList.push(msg);
                    });

                    gvwPayGrid.rebuild();

                    jsonDeductList.length = 0;
                    data.cv_4.forEach((item, index) => {
                        const msg = {
                            PAY_ITEM_CODE   : gfn_nvl(item.PAY_ITEM_CODE),
                            PAY_AMT         : gfn_nvl(item.PAY_AMT),
                            PAY_QTY         : gfn_nvl(item.PAY_QTY),
                            RE_PAY_YYYYMM1  : gfn_nvl(item.RE_PAY_YYYYMM1),
                            RE_PAY_YYYYMM_P : gfn_nvl(item.RE_PAY_YYYYMM_P),
                            RE_PAY_DATE_P   : gfn_nvl(item.RE_PAY_DATE_P),
                            TAX_PAY_DATE    : gfn_nvl(item.TAX_PAY_DATE)
                        }
                        jsonDeductList.push(msg);
                    });

                    gvwDeductGrid.rebuild();

                    jsonBasicList.length = 0;
                    data.cv_5.forEach((item, index) => {
                        const msg = {
                            PAY_ITEM_CODE   : gfn_nvl(item.PAY_ITEM_CODE),
                            PAY_AMT         : gfn_nvl(item.PAY_AMT),
                            PAY_QTY         : gfn_nvl(item.PAY_QTY),
                            RE_PAY_YYYYMM1  : gfn_nvl(item.RE_PAY_YYYYMM1),
                            RE_PAY_YYYYMM_P : gfn_nvl(item.RE_PAY_YYYYMM_P),
                            RE_PAY_DATE_P   : gfn_nvl(item.RE_PAY_DATE_P),
                            TAX_PAY_DATE    : gfn_nvl(item.TAX_PAY_DATE)
                        }
                        jsonBasicList.push(msg);
                    });

                    gvwBasicGrid.rebuild();

                    let PAY_CONFIRM_YN  = rowData.PAY_CONFIRM_YN;
                    let PAY_APPLY_MONTH = rowData.PAY_APPLY_MONTH;
                    let PAY_APPLY_YN    = rowData.PAY_APPLY_MONTH;

                    let EMP_STATE = rowData.EMP_STATE;
                    if (EMP_STATE == 'RETI' &&  PAY_TYPE == 1) {

                        //grpPayApply 가 몬지 모르겠음
                        /*grpPayApply.Visible = true;*/

                        if (PAY_APPLY_YN == 'Y') {

                            SBUxMethod.attr('btnApply', 'disabled', false);

                            if (PAY_APPLY_MONTH == PAY_YYYYMM) {
                                SBUxMethod.attr('btnApplyCancel', 'disabled', true);
                            } else {
                                SBUxMethod.attr('btnApplyCancel', 'disabled', false);
                            }

                        } else {

                            SBUxMethod.attr('btnApplyCancel', 'disabled', false);
                            SBUxMethod.attr('btnApply', 'disabled', true);
                        }
                    } else{

                        /*grpPayApply.Visible = false;*/
                    }

                    /****************그리드 버튼 활성화****************/
                    if (PAY_CONFIRM_YN == 'Y'){
                        SBUxMethod.hide('btnAdd')
                        SBUxMethod.hide('btnAdd1')
                        SBUxMethod.hide('btnDel')
                        SBUxMethod.hide('btnDel1')

                    }else{

                        SBUxMethod.show('btnAdd')
                        SBUxMethod.show('btnAdd1')
                        SBUxMethod.show('btnDel')
                        SBUxMethod.show('btnDel1')
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

    // 행 추가
    const fn_addRow = function () {

        let rowVal = gvwPayGrid.getRow();

        const msg = {
            PAY_ITEM_CODE              : '',
            PAY_AMT                    : 0,
            TAX_FREE_AMT               : 0,
            PAY_QTY                    : 0,
            RE_PAY_YYYYMM              : '',
            RE_PAY_YYYYMM_P            : '',
            TAX_PAY_DATE               : '',
            RE_PAY_DATE_P              : '',

            status: 'i'
        }

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwPayGrid.addRow(true, msg);
        }else{
            gvwPayGrid.insertRow(rowVal, 'below', msg);
        }
        //grdFimList.refresh();
    }

    // 행삭제
    const fn_delRow = async function () {

        let rowVal = gvwPayGrid.getRow();

        if (rowVal == -1) {

            gvwPayGrid("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwPayGrid.deleteRow(rowVal);
        }
    }

    // 행 추가
    const fn_addRow1 = function () {

        let rowVal = gvwDeductGrid.getRow();

        const msg = {
            PAY_ITEM_CODE       : '',
            PAY_AMT             : 0,
            PAY_QTY             : 0,
            RE_PAY_YYYYMM1      : '',
            RE_PAY_YYYYMM_P     : '',
            TAX_PAY_DATE        : '',
            RE_PAY_DATE_P       : '',

            status: 'i'
        }

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwDeductGrid.addRow(true, msg);
        }else{
            gvwDeductGrid.insertRow(rowVal, 'below', msg);
        }
        //grdFimList.refresh();
    }

    // 행삭제
    const fn_delRow1 = async function () {

        let rowVal = gvwDeductGrid.getRow();

        if (rowVal == -1) {

            gvwDeductGrid("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwDeductGrid.deleteRow(rowVal);
        }
    }

    //퇴직자 정산세액 반영 저장
    const fn_btnApply = async function () {

        let V_P_PAY_YYYYMM  = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); //귀속년월
        let V_P_PAY_TYPE    = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let PAY_DATE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); //지급일자
        let V_P_EMP_CODE    = gfn_nvl(SBUxMethod.get("EMP_CODE")); //사번

        if (!V_P_PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!V_P_PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일자");
            return;
        }
        if (!V_P_EMP_CODE) {
            gfn_comAlert("W0002", "사번");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN			: ''
            ,V_P_LANG_ID				: ''
            ,V_P_COMP_CODE				: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE			: gv_ma_selectedClntCd

            ,V_P_PAY_YYYYMM  : V_P_PAY_YYYYMM
            ,V_P_PAY_TYPE    : V_P_PAY_TYPE
            ,V_P_PAY_DATE    : PAY_DATE
            ,V_P_EMP_CODE    : V_P_EMP_CODE

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''


        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp2310.do", {
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

    //퇴직자 정산세액 반영 삭제
    const fn_btnApplyCancel = async function () {

        let V_P_PAY_YYYYMM  = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); //귀속년월
        let V_P_PAY_TYPE    = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let PAY_DATE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); //지급일자
        let V_P_EMP_CODE    = gfn_nvl(SBUxMethod.get("EMP_CODE")); //사번

        if (!V_P_PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!V_P_PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일자");
            return;
        }
        if (!V_P_EMP_CODE) {
            gfn_comAlert("W0002", "사번");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN			: ''
            ,V_P_LANG_ID				: ''
            ,V_P_COMP_CODE				: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE			: gv_ma_selectedClntCd

            ,V_P_PAY_YYYYMM  : V_P_PAY_YYYYMM
            ,V_P_PAY_TYPE    : V_P_PAY_TYPE
            ,V_P_PAY_DATE    : PAY_DATE
            ,V_P_EMP_CODE    : V_P_EMP_CODE

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''


        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp2310.do", {
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
    const fn_save = async function () {

        var paramObj;

        // 수정 저장
        if (gfn_comConfirm("Q0001", "세금을 재계산을")) {

            paramObj = await getParamForm('u', 'Y');

        }else{
            paramObj = await getParamForm('u', 'N');

        }

        if (_.isEmpty(paramObj)){
            return;
        }

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp2310BAT.do", {
            getType: 'json',
            workType: 'U',
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    await alert(data.resultMessage);
                    fn_view();
                }else{
                    await gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                    fn_view();
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

    const getParamForm = async function(type, strReCalculate){

        let STRNUD_TYPE         = '';
        let STRPAY_ITEM_CODE    = '';
        let STRPAY_AMT          = '';
        let STRTAX_FREE_AMT     = '';
        let STRRE_PAY_YYYYMM    = '';
        let STRTAX_PAY_DATE     = '';

        let STREMP_CODE = '';

        let dtSource1;
        let dtSource2;
        let dtSource3;


        if (_.isEqual(type, 'u')) {
            dtSource1 = gvwPayGrid.getUpdateData(true, 'all');
            dtSource2 = gvwDeductGrid.getUpdateData(true, 'all');
            dtSource3 = gvwBasicGrid.getUpdateData(true, 'all');

            if (!_.isEmpty(dtSource1)) {

                // 고정 수당항목 중복체크
                dtSource1.forEach((item1, index1) => {

                    let PAY_ITEM_CODE1 = item1.data.PAY_ITEM_CODE;
                    let RE_PAY_YYYYMM_P1 = item1.data.RE_PAY_YYYYMM_P;

                    dtSource1.forEach((item2, index2) => {

                        let PAY_ITEM_CODE2 = item2.data.PAY_ITEM_CODE;
                        let RE_PAY_YYYYMM_P2 = item2.data.RE_PAY_YYYYMM_P;

                        let PAY_ITEM_CODE1 = item1.data.PAY_ITEM_CODE;
                        if (PAY_ITEM_CODE1 == PAY_ITEM_CODE2 && RE_PAY_YYYYMM_P1 == RE_PAY_YYYYMM_P2) {

                            gfn_comAlert("Q0000", "중복된 수당항목이 존재합니다."); //수정
                            return;
                        }

                    })
                })
            }

            if (!_.isEmpty(dtSource2)) {

                // 고정 수당항목 중복체크
                dtSource2.forEach((item1, index1) => {

                    let PAY_ITEM_CODE1      = item1.data.PAY_ITEM_CODE;
                    let RE_PAY_YYYYMM_P1    = item1.data.RE_PAY_YYYYMM_P;

                    dtSource2.forEach((item2, index2) => {

                        let PAY_ITEM_CODE2      = item2.data.PAY_ITEM_CODE;
                        let RE_PAY_YYYYMM_P2    = item2.data.RE_PAY_YYYYMM_P;

                        let PAY_ITEM_CODE1 = item1.data.PAY_ITEM_CODE;
                        if (PAY_ITEM_CODE1 == PAY_ITEM_CODE2 && RE_PAY_YYYYMM_P1 == RE_PAY_YYYYMM_P2) {

                            gfn_comAlert("Q0000", "중복된 수당항목이 존재합니다."); //수정
                            return;
                        }

                    })
                })
            }



            if (!_.isEmpty(dtSource1)) {

                dtSource1.forEach((item, index1) => {

                    TRNUD_TYPE          += index + '|';
                    TRPAY_ITEM_CODE     += item.PAY_ITEM_CODE + '|';
                    TRPAY_AMT           += item.PAY_AMT + '|';
                    TRTAX_FREE_AMT      += item.TAX_FREE_AMT + '|';
                    TRRE_PAY_YYYYMM     += item.RE_PAY_YYYYMM_P + '|';
                    TRTAX_PAY_DATE      += item.TAX_PAY_DATE + '|';


                })
            }

            if (!_.isEmpty(dtSource2)) {

                dtSource2.forEach((item, index1) => {

                    TRNUD_TYPE          += index + '|';
                    TRPAY_ITEM_CODE     += item.PAY_ITEM_CODE + '|';
                    TRPAY_AMT           += item.PAY_AMT + '|';
                    TRTAX_FREE_AMT      +=  '0|'; // 공제항목에서 비과세액은 0으로 넘겨줌.
                    TRRE_PAY_YYYYMM     += item.RE_PAY_YYYYMM_P + '|';
                    TRTAX_PAY_DATE      += item.TAX_PAY_DATE + '|';


                })
            }

            if (!_.isEmpty(dtSource3)) {

                dtSource3.forEach((item, index1) => {

                    TRNUD_TYPE          += index + '|';
                    TRPAY_ITEM_CODE     += item.PAY_ITEM_CODE + '|';
                    TRPAY_AMT           += item.PAY_AMT + '|';
                    TRTAX_FREE_AMT      +=  '0|'; // 공제항목에서 비과세액은 0으로 넘겨줌.
                    TRRE_PAY_YYYYMM     += item.RE_PAY_YYYYMM_P + '|';
                    TRTAX_PAY_DATE      += item.TAX_PAY_DATE + '|';


                })
            }


            if (STRNUD_TYPE.length > 0) {
                STRNUD_TYPE         = STRNUD_TYPE.slice(0, -1);
                STRPAY_ITEM_CODE    = STRPAY_ITEM_CODE.slice(0, -1);
                STRPAY_AMT          = STRPAY_AMT.slice(0, -1);
                STRTAX_FREE_AMT     = STRTAX_FREE_AMT.slice(0, -1);
                STRRE_PAY_YYYYMM    = STRRE_PAY_YYYYMM.slice(0, -1);
                STRTAX_PAY_DATE     = STRTAX_PAY_DATE.slice(0, -1);
            }


        }else if (_.isEqual(type, 'CONFIRM') || _.isEqual(type, 'CANCEL')){

            let alldata = gvwListGrid.getGridDataAll();

            alldata.forEach((item, index) => {

                if (item.CHK_YN == 'Y'){
                    STREMP_CODE += item.EMP_CODE +'|';
                }
            })

            if (STREMP_CODE.length > 1){
                STREMP_CODE = STREMP_CODE.slice(0, -1);
            }
        }

        let SITE_CODE;
        let PAY_YYYYMM      = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); //귀속년월
        let PAY_TYPE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let PAY_DATE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); //지급일자
        let EMP_CODE        = gfn_nvl(SBUxMethod.get("EMP_CODE")); //사번
        let PAY_CASH_AMT    = gfn_nvl(SBUxMethod.get("PAY_CASH_AMT")); //현급지급액
        let PAY_AREA_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역

        let rowVal = gvwListGrid.getRow();

        if (rowVal == -1) {
            SITE_CODE = '';
        }else{
            let rowData = gvwListGrid.getRowData(rowVal);
            SITE_CODE = rowData.SITE_CODE;
        }


        let paramObj = {
            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd

            ,V_P_SITE_CODE           : SITE_CODE
            ,V_P_PAY_YYYYMM          : PAY_YYYYMM
            ,V_P_PAY_TYPE            : PAY_TYPE
            ,V_P_PAY_DATE            : PAY_DATE
            ,V_P_EMP_CODE            : EMP_CODE
            ,V_P_PAY_CASH_AMT        : PAY_CASH_AMT
            ,V_P_TAX_RE_CALCULATE_YN : strReCalculate
            ,V_P_PAY_AREA            : PAY_AREA_TYPE

            /*-- 급여수정 정보*/
            ,V_P_NUD_TYPE            : STRNUD_TYPE
            ,V_P_PAY_ITEM_CODE       : STRPAY_ITEM_CODE
            ,V_P_PAY_AMT             : STRPAY_AMT
            ,V_P_TAX_FREE_AMT        : STRTAX_FREE_AMT
            ,V_P_RE_PAY_YYYYMM       : STRRE_PAY_YYYYMM

            /*-- 확정, 확정 취소용*/
            ,V_P_EMP_CODE1           : STREMP_CODE
            ,V_P_TAX_PAY_DATE        : STRTAX_PAY_DATE


            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        }


        return paramObj;
    }


    //확정
    const fn_btnConfirm = async function () {

        var paramObj = await getParamForm('CONFIRM', '');

        if (_.isEmpty(paramObj)){
            return;
        }

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp2310BAT.do", {
            getType: 'json',
            workType: 'CONFIRM',
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    await alert(data.resultMessage);
                    fn_view();
                }else{
                    await gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                    fn_view();
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

    //확정취소
    const fn_btnCancel = async function () {

        var paramObj = await getParamForm('CANCEL', '');


        if (_.isEmpty(paramObj)){
            return;
        }

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp2310BAT.do", {
            getType: 'json',
            workType: 'CANCEL',
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    await alert(data.resultMessage);
                    fn_view();
                }else{
                    await gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                    fn_view();
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
     * 현금지급액
     */
    var fn_payCashAmt = function() {

        let PAY_NET_AMT     = gfn_nvl(SBUxMethod.get("PAY_NET_AMT")); //실지급액
        let PAY_CASH_AMT    = gfn_nvl(SBUxMethod.get("PAY_CASH_AMT")); //현금지급액

        //이체액
        // 이체액 = 실지급액 - 현금지급액
        SBUxMethod.set("TRANSFER_AMT", Number(PAY_NET_AMT) - Number(PAY_CASH_AMT));

        //numtransfer_amt.Value = numpay_net_amt.Value - numpay_cash_amt.Value;

    }


</script>
</body>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
