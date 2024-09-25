<%
    /**
     * @Class Name 		: hrb5200.jsp
     * @Description 	: 급여항목등록 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.06.03
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.03   	이경한		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 급여항목등록</title>
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
                </h3>
            </div>
        </div>
        <div class="box-body">

            <!--[pp] 검색 -->
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <table class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 16%">
                    <col style="width: 16%">
                    <col style="width: 16%">
                    <col style="width: 16%">
                    <col style="width: 16%">
                    <col style="width: 16%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">급여항목구분</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_PAY_ITEM_CATEGORY" uitype="single" jsondata-ref="jsonPayItemCategory" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">급여항목코드</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_PAY_ITEM_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">급여항목명</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_PAY_ITEM_NAME" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>급여항목</span>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-gvwMaster" style="height:350px;"></div>
                </div>
                <div>
                    <sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="normal" is-scrollable="false" jsondata-ref="jsonTabData">
                    </sbux-tabs>
                    <div class="tab-content">
                        <div id="tpgInfo">
                            <div class="ad_tbl_top2">
                                <ul class="ad_tbl_count">
                                    <li>
                                        <span>급여항목 편집</span>
                                    </li>
                                </ul>
                            </div>
                            <div>
                                <table class="table table-bordered tbl_fixed">
                                    <caption>신체</caption>
                                    <colgroup>
                                        <col style="width: 11%">
                                        <col style="width: 11%">
                                        <col style="width: 11%">
                                        <col style="width: 11%">
                                        <col style="width: 11%">
                                        <col style="width: 11%">
                                        <col style="width: 11%">
                                        <col style="width: 11%">
                                        <col style="width: 11%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" class="th_bg">급여항목구분</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-select id="PAY_ITEM_CATEGORY" uitype="single" jsondata-ref="jsonPayItemCategory" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="PAY_YN"
                                                    name="PAY_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="급여항목"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="BONUS_YN"
                                                    name="BONUS_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="상여항목"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <th scope="row" class="th_bg">급여항목특성</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-select id="PAY_ITEM_PROPERTY" uitype="single" jsondata-ref="jsonPayItemProperty" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">급여항목코드</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="PAY_ITEM_CODE" uitype="text" placeholder="" class="form-control input-sm" required></sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">급여항목명</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="PAY_ITEM_NAME" uitype="text" placeholder="" class="form-control input-sm" required></sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">원천징수항목구분</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <div class="dropdown">
                                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="TAX_REPORT_ITEM_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <font>선택</font>
                                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="TAX_REPORT_ITEM_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">집계방법구분</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <div class="dropdown">
                                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SUMMARY_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <font>선택</font>
                                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="SUMMARY_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row" class="th_bg">관련항목</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <div class="dropdown">
                                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SUMMARY_RELATED_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <font>선택</font>
                                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="SUMMARY_RELATED_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row" class="th_bg">적용기준</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-select id="PAY_ITEM_RANGE_TYPE" uitype="single" jsondata-ref="jsonPayItemRangeType" unselected-text="선택" class="form-control input-sm" required></sbux-select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="TAX_FREE_YN"
                                                    name="TAX_FREE_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="비과세"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <th scope="row" class="th_bg">비과세코드</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="TAX_FREE_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="TAX_FREE_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-button
                                                    class="btn btn-xs btn-outline-dark"
                                                    text="찾기" uitype="modal"
                                                    target-id="modal-compopup1"
                                                    onclick="fn_findTaxFreeCode"
                                            ></sbux-button>
                                        </td>
                                        <th scope="row" class="th_bg">끝전처리방법</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <div class="dropdown">
                                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="ROUND_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <font>선택</font>
                                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="ROUND_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row" class="th_bg">끝전처리기준액</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <div class="dropdown">
                                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="ROUND_TYPE_BASE_AMT" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <font>선택</font>
                                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="ROUND_TYPE_BASE_AMT" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">수습지급율</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="INTERN_EMP_PAY_RATE" uitype="text" placeholder="" class="form-control input-sm" required></sbux-input><label>%</label>
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="AVERAGE_INCLUDE_YN"
                                                    name="AVERAGE_INCLUDE_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="평균임금포함"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="ORDINARY_INCLUDE_YN"
                                                    name="ORDINARY_INCLUDE_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="통상임금포함"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="RETIRE_INCLUDE_YN"
                                                    name="RETIRE_INCLUDE_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="퇴직급여포함"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="PRINT_YN"
                                                    name="PRINT_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="급여대장출력"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="ITEM_INCLUDE_YN"
                                                    name="ITEM_INCLUDE_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="명세포함여부"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">정렬순서</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="SORT_SEQ" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="TAX_CALCULATE_YN"
                                                    name="TAX_CALCULATE_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="세금계산"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="WORKSHOP_TAX_YN"
                                                    name="WORKSHOP_TAX_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="사업소세계산"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="BASE_ACCOUNTING_YN"
                                                    name="BASE_ACCOUNTING_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="기초항목회계처리여부"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="INSURE_ACCOUNTING_YN"
                                                    name="INSURE_ACCOUNTING_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="4대보험회계처리여부"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">입력담당부서</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="ENTRY_DEPT_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="ENTRY_DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-button
                                                    class="btn btn-xs btn-outline-dark"
                                                    text="찾기" uitype="modal"
                                                    target-id="modal-compopup1"
                                                    onclick="fn_findEntryDeptCode"
                                            ></sbux-button>
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="DAY_DISCOUNT_YN"
                                                    name="DAY_DISCOUNT_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="일할계산"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="DAILY_CALC_YN"
                                                    name="DAILY_CALC_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="일단위계산"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="DAILY_SUM_YN"
                                                    name="DAILY_SUM_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="일합계"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="DAILY_AVG_YN"
                                                    name="DAILY_AVG_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="일평균"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">계산기준일</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <div class="dropdown">
                                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SUMMARY_RULE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <font>선택</font>
                                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="SUMMARY_RULE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                </div>
                                            </div>
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="SHUTDOWN_AVG_YN"
                                                    name="SHUTDOWN_AVG_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="평균임금(휴업)"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="SHUTDOWN_ORD_YN"
                                                    name="SHUTDOWN_ORD_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="통상임금(휴업-1개월미만)"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="MINUS_APPLY_YN"
                                                    name="MINUS_APPLY_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="차감여부(코로나)"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="USE_YN"
                                                    name="USE_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="사용"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="RETIRE_DISCOUNT_YN"
                                                    name="RETIRE_DISCOUNT_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="퇴직일할계산"
                                                    true-value="Y" false-value="N"
                                            />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">메모</th>
                                        <td colspan="7" class="td_input" style="border-right:hidden;">
                                            <sbux-textarea id="MEMO" rows="3" class="form-control input-sm" uitype="normal" style="width:100%"></sbux-textarea>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="tpgException">
                            <div class="ad_tbl_top2">
                                <ul class="ad_tbl_count">
                                    <li><span>급여항목 미적용대상</span></li>
                                </ul>
                                <div class="ad_tbl_toplist">
                                    <sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow" style="float: right;"></sbux-button>
                                    <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
                                </div>
                            </div>
                            <div>
                                <div id="sb-area-gvwExcept" style="height:370px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    //-----------------------------------------------------------
    var editType			= "N";

    var jsonPayItemCategory = []; // 급여항목구분코드
    var jsonPayItemProperty = []; // 급여항목특성코드
    var jsonTaxReportItemCode = []; // 원천징수항목구분코드
    var jsonPayItemRangeType = []; // 적용기준
    var jsonSummaryType = []; // 집계방법구분코드
    var jsonSummaryRelatedCode = []; // 관련항목
    var jsonRoundType = []; // 끝전처리방법
    var jsonRoundTypeBaseAmt = []; // 끝전처리기준액
    var jsonSummaryRule = []; // 계산기준일
    var jsonPayItemExceptGroupType = []; // 미적용대상구분코드

    //grid 초기화
    var gvwMaster; 			// 그리드를 담기위한 객체 선언
    var gvwExcept;

    var jsonPayItemList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonExceptList = [];

    // Tab Data
    var jsonTabData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "급여항목 편집", "targetid" : "tpgInfo", "targetvalue" : "급여항목 편집" },
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "급여항목 미적용대상", "targetid" : "tpgException", "targetvalue" : "급여항목 미적용대상" },
    ];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 급여항목구분코드
            gfnma_setComSelect(['SRCH_PAY_ITEM_CATEGORY', 'PAY_ITEM_CATEGORY', 'gvwMaster'], jsonPayItemCategory, 'L_HRB009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 급여항목특성코드
            gfnma_setComSelect(['PAY_ITEM_PROPERTY', 'gvwMaster'], jsonPayItemProperty, 'L_HRB010', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 원천징수항목구분
            gfnma_setComSelect(['gvwMaster'], jsonTaxReportItemCode, 'L_HRB017', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#TAX_REPORT_ITEM_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRB017'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 집계방법구분
            gfnma_setComSelect(['gvwMaster'], jsonSummaryType, 'L_HRB011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SUMMARY_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRB011'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 관련항목
            gfnma_setComSelect(['gvwMaster'], jsonSummaryRelatedCode, 'L_HRB012', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SUMMARY_RELATED_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRB012'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
                    {caption: "명칭",		ref: 'CODE_NAME', 			width:'100px',  	style:'text-align:left'},
                    {caption: "필드명", 		ref: 'FIELD_NAME',    		width:'100px',  	style:'text-align:left'}
                ]
            }),
            // 적용기준
            gfnma_setComSelect(['PAY_ITEM_RANGE_TYPE', 'gvwMaster'], jsonPayItemRangeType, 'L_HRB026', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 끝전처리방법
            gfnma_setComSelect(['gvwMaster'], jsonRoundType, 'L_HRB013', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#ROUND_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRB013'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 끝전처리기준액
            gfnma_setComSelect(['gvwMaster'], jsonRoundTypeBaseAmt, 'L_HRB014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#ROUND_TYPE_BASE_AMT']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRB014'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 계산기준일
            gfnma_setComSelect(['gvwMaster'], jsonSummaryRule, 'L_HRT017', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SUMMARY_RULE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRT017'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 미적용대상구분
            gfnma_setComSelect(['gvwExcept'], jsonPayItemExceptGroupType, 'L_HRB027', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    const fn_findTaxFreeCode = function() {
        var searchCode 		= gfnma_nvl(SBUxMethod.get("TAX_FREE_CODE"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("TAX_FREE_NAME"));
        var replaceText0 	= "_TAX_FREE_CODE_";
        var replaceText1 	= "_TAX_FREE_NAME_";
        var strWhereClause 	= "AND TAX_FREE_CODE LIKE '%" + replaceText0 + "%' AND TAX_FREE_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '비과세항목정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRB015'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["비과세코드",		"비과세약칭"]
            ,searchInputFields		: ["TAX_FREE_CODE",	"TAX_FREE_NAME"]
            ,searchInputValues		: [searchCode, 			searchName]
            ,searchInputTypes		: ["input", 	"input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", "",	""]				//select 경우
            ,height					: '500px'
            ,tableHeader			: ["비과세코드", "비과세약칭", "비과세설명"]
            ,tableColumnNames		: ["TAX_FREE_CODE", "TAX_FREE_NAME",  "TAX_FREE_DESCR"]
            ,tableColumnWidths		: ["80px", "120px", "300px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('TAX_FREE_CODE', data.TAX_FREE_CODE);
                SBUxMethod.set('TAX_FREE_NAME', data.TAX_FREE_NAME);
            },
        });
    }

    var fn_findEntryDeptCode = function() {
        var searchCode 		= gfnma_nvl(SBUxMethod.get("ENTRY_DEPT_CODE"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("ENTRY_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: [searchCode, 				searchName,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('ENTRY_DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('ENTRY_DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    function fn_createGvwMasterGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwMaster';
        SBGridProperties.id 				= 'gvwMaster';
        SBGridProperties.jsonref 			= 'jsonPayItemList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["급여항목구분"],           ref: 'PAY_ITEM_CATEGORY', 		        type:'combo',  	width:'100px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPayItemCategory',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["급여항목특성"],           ref: 'PAY_ITEM_PROPERTY', 		        type:'combo',  	width:'100px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPayItemProperty',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["급여항목코드"], 	        ref: 'PAY_ITEM_CODE',    	        type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["급여항목명"], 	        ref: 'PAY_ITEM_NAME',    	        type:'output',  	width:'136px',  	style:'text-align:left'},
            {caption: ["집계방법구분"],           ref: 'SUMMARY_TYPE', 		        type:'combo',  	width:'100px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSummaryType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["관련항목"],           ref: 'SUMMARY_RELATED_CODE', 		        type:'combo',  	width:'100px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSummaryRelatedCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["원천징수항목구분"],           ref: 'TAX_REPORT_ITEM_CODE', 		        type:'combo',  	width:'100px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonTaxReportItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["입력담당부서"], 	        ref: 'ENTRY_DEPT_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["입력담당부서"], 	        ref: 'ENTRY_DEPT_NAME',    	        type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["비과세여부"], 	        ref: 'TAX_FREE_YN',    	        type:'output',  	width:'100px',  	style:'text-align:left'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["비과세코드"], 	        ref: 'TAX_FREE_CODE',    	        type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["비과세약칭"], 	        ref: 'TAX_FREE_NAME',    	        type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["끝전처리방법"],           ref: 'ROUND_TYPE', 		        type:'combo',  	width:'100px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonRoundType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["끝전처리기준액"],           ref: 'ROUND_TYPE_BASE_AMT', 		        type:'combo',  	width:'120px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonRoundTypeBaseAmt',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["급여항목"],   ref: 'PAY_YN', 		    type:'checkbox',  	width:'70px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["상여항목"],   ref: 'BONUS_YN', 		    type:'checkbox',  	width:'70px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["수습지급율(%)"], 	        ref: 'INTERN_EMP_PAY_RATE',    	        type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["평균임금포함"],   ref: 'AVERAGE_INCLUDE_YN', 		    type:'checkbox',  	width:'100px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["통상임금포함"],   ref: 'ORDINARY_INCLUDE_YN', 		    type:'checkbox',  	width:'100px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["퇴직급상여포함"],   ref: 'RETIRE_INCLUDE_YN', 		    type:'checkbox',  	width:'110px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["일할계산"],   ref: 'DAY_DISCOUNT_YN', 		    type:'checkbox',  	width:'70px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["급여대장출력"],   ref: 'PRINT_YN', 		    type:'checkbox',  	width:'100px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["세금계산"],   ref: 'TAX_CALCULATE_YN', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["기초항목회계처리"],   ref: 'BASE_ACCOUNTING_YN', 		    type:'checkbox',  	width:'130px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["4대보험회계처리"],   ref: 'INSURE_ACCOUNTING_YN', 		    type:'checkbox',  	width:'90px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["일단위계산"],   ref: 'DAILY_CALC_YN', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["일실적집계"],   ref: 'DAILY_SUM_YN', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["일평균"],   ref: 'DAILY_AVG_YN', 		    type:'checkbox',  	width:'94px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["차감여부(코로나)"],   ref: 'MINUS_APPLY_YN', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["통상임금(휴업)"],   ref: 'SHUTDOWN_ORD_YN', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["평균임금(휴업)"],   ref: 'SHUTDOWN_AVG_YN', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["명세포함여부"],   ref: 'ITEM_INCLUDE_YN', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["정렬순서"], 	        ref: 'SORT_SEQ',    	        type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["사용"],   ref: 'USE_YN', 		    type:'checkbox',  	width:'68px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["비고"], 	        ref: 'MEMO',    	        type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["적용코드"],           ref: 'PAY_ITEM_RANGE_CODE', 		        type:'combo',  	width:'120px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPayItemRangeType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["사업소세대상"],   ref: 'WORKSHOP_TAX_YN', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["계산기준일"],           ref: 'SUMMARY_RULE', 		        type:'combo',  	width:'120px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSummaryRule',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["퇴직일할여부"],   ref: 'RETIRE_DISCOUNT_YN', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
        ];

        gvwMaster = _SBGrid.create(SBGridProperties);
        gvwMaster.bind('click', 'fn_view');
    }

    function fn_createGvwExceptGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwExcept';
        SBGridProperties.id 				= 'gvwExcept';
        SBGridProperties.jsonref 			= 'jsonExceptList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["미적용대상구분"],           ref: 'PAY_ITEM_EXCEPT_GROUP_TYPE', 		        type:'combo',  	width:'100px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPayItemExceptGroupType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["미적용대상코드"], 	        ref: 'PAY_ITEM_EXCEPT_GROUP_CODE',    	        type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["미적용대상코드명"], 	        ref: 'PAY_ITEM_EXCEPT_GROUP_NAME',    	        type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["메모"], 	        ref: 'MEMO',    	        type:'input',  	width:'300px',  	style:'text-align:left'},
        ];

        gvwExcept = _SBGrid.create(SBGridProperties);
        gvwExcept.bind('dblclick', 'fn_gvwExceptDblclick');
    }

    const fn_findPayItemExceptGroupCodeForGvwExcept = function(nRow, nCol) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '미적용대상 정보');
        SBUxMethod.openModal('modal-compopup1');

        var replaceText0 	= "_PAY_ITEM_EXCEPT_GROUP_CODE_";
        var replaceText1 	= "_PAY_ITEM_EXCEPT_GROUP_NAME_";
        var strWhereClause 	= "AND PAY_ITEM_EXCEPT_GROUP_CODE LIKE '%" + replaceText0 + "%' AND PAY_ITEM_EXCEPT_GROUP_NAME LIKE '%" + replaceText1 + "%'";

        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRB001'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["미적용대상코드",		"미적용대상명"]
            ,searchInputFields		: ["PAY_ITEM_EXCEPT_GROUP_CODE",	"PAY_ITEM_EXCEPT_GROUP_NAME"]
            ,searchInputValues		: ["", 			""]
            ,searchInputTypes		: ["input", 	"input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", ""]				//select 경우
            ,height					: '500px'
            ,tableHeader			: ["미적용대상코드", "미적용대상명"]
            ,tableColumnNames		: ["PAY_ITEM_EXCEPT_GROUP_CODE", "PAY_ITEM_EXCEPT_GROUP_NAME"]
            ,tableColumnWidths		: ["100px", "150px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                gvwExcept.setCellData(nRow, nCol, data['PAY_ITEM_EXCEPT_GROUP_CODE']);
                gvwExcept.setCellData(nRow, (nCol+1), data['PAY_ITEM_EXCEPT_GROUP_NAME']);
            },
        });
    }

    const fn_view = async function () {
        SBUxMethod.attr("PAY_ITEM_CODE", "readonly", true);
        var nRow = gvwMaster.getRow();
        var rowData = gvwMaster.getRowData(nRow);

        if(gfn_nvl(rowData) == "") return;

        editType = "U";
        let PAY_ITEM_CODE = gfn_nvl(rowData.PAY_ITEM_CODE)
        let PAY_ITEM_NAME = gfnma_nvl(SBUxMethod.get("SRCH_PAY_ITEM_NAME"));
        let PAY_ITEM_CATEGORY = gfnma_nvl(SBUxMethod.get("SRCH_PAY_ITEM_CATEGORY"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_ITEM_CODE : PAY_ITEM_CODE,
            V_P_PAY_ITEM_NAME : PAY_ITEM_NAME,
            V_P_PAY_ITEM_CATEGORY : PAY_ITEM_CATEGORY,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrb5200List.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {

                var infoData = data.cv_2[0];

                SBUxMethod.set("PAY_ITEM_CODE", gfn_nvl(infoData.PAY_ITEM_CODE));
                SBUxMethod.set("PAY_ITEM_NAME", gfn_nvl(infoData.PAY_ITEM_NAME));
                SBUxMethod.set("PAY_ITEM_CATEGORY", gfn_nvl(infoData.PAY_ITEM_CATEGORY));
                gfnma_multiSelectSet('#SUMMARY_TYPE', 'SUB_CODE', 'CODE_NAME', gfn_nvl(infoData.SUMMARY_TYPE));
                gfnma_multiSelectSet('#SUMMARY_RELATED_CODE', 'SUB_CODE', 'CODE_NAME', gfn_nvl(infoData.SUMMARY_RELATED_CODE));
                gfnma_multiSelectSet('#TAX_REPORT_ITEM_CODE', 'SUB_CODE', 'CODE_NAME', gfn_nvl(infoData.TAX_REPORT_ITEM_CODE));
                SBUxMethod.set("ENTRY_DEPT_CODE", gfn_nvl(infoData.ENTRY_DEPT_CODE));
                SBUxMethod.set("ENTRY_DEPT_NAME", gfn_nvl(infoData.ENTRY_DEPT_NAME));
                SBUxMethod.set("TAX_FREE_YN", gfn_nvl(infoData.TAX_FREE_YN));
                SBUxMethod.set("TAX_FREE_CODE", gfn_nvl(infoData.TAX_FREE_CODE));
                SBUxMethod.set("TAX_FREE_NAME", gfn_nvl(infoData.TAX_FREE_NAME));
                gfnma_multiSelectSet('#ROUND_TYPE', 'SUB_CODE', 'CODE_NAME', gfn_nvl(infoData.ROUND_TYPE));
                gfnma_multiSelectSet('#ROUND_TYPE_BASE_AMT', 'SUB_CODE', 'CODE_NAME', gfn_nvl(infoData.ROUND_TYPE_BASE_AMT));
                SBUxMethod.set("PAY_YN", gfn_nvl(infoData.PAY_YN));
                SBUxMethod.set("BONUS_YN", gfn_nvl(infoData.BONUS_YN));
                SBUxMethod.set("INTERN_EMP_PAY_RATE", gfn_nvl(infoData.INTERN_EMP_PAY_RATE));
                SBUxMethod.set("AVERAGE_INCLUDE_YN", gfn_nvl(infoData.AVERAGE_INCLUDE_YN));
                SBUxMethod.set("ORDINARY_INCLUDE_YN", gfn_nvl(infoData.ORDINARY_INCLUDE_YN));
                SBUxMethod.set("RETIRE_INCLUDE_YN", gfn_nvl(infoData.RETIRE_INCLUDE_YN));
                SBUxMethod.set("DAY_DISCOUNT_YN", gfn_nvl(infoData.DAY_DISCOUNT_YN));
                SBUxMethod.set("PRINT_YN", gfn_nvl(infoData.PRINT_YN));
                SBUxMethod.set("SORT_SEQ", gfn_nvl(infoData.SORT_SEQ));
                SBUxMethod.set("USE_YN", gfn_nvl(infoData.USE_YN));
                SBUxMethod.set("MEMO", gfn_nvl(infoData.MEMO));
                SBUxMethod.set("PAY_ITEM_PROPERTY", gfn_nvl(infoData.PAY_ITEM_PROPERTY));
                SBUxMethod.set("PAY_ITEM_RANGE_TYPE", gfn_nvl(infoData.PAY_ITEM_RANGE_TYPE));
                SBUxMethod.set("TAX_CALCULATE_YN", gfn_nvl(infoData.TAX_CALCULATE_YN));
                SBUxMethod.set("BASE_ACCOUNTING_YN", gfn_nvl(infoData.BASE_ACCOUNTING_YN));
                SBUxMethod.set("INSURE_ACCOUNTING_YN", gfn_nvl(infoData.INSURE_ACCOUNTING_YN));
                SBUxMethod.set("ITEM_INCLUDE_YN", gfn_nvl(infoData.ITEM_INCLUDE_YN));
                SBUxMethod.set("DAILY_CALC_YN", gfn_nvl(infoData.DAILY_CALC_YN));
                SBUxMethod.set("DAILY_SUM_YN", gfn_nvl(infoData.DAILY_SUM_YN));
                SBUxMethod.set("DAILY_AVG_YN", gfn_nvl(infoData.DAILY_AVG_YN));
                SBUxMethod.set("MINUS_APPLY_YN", gfn_nvl(infoData.MINUS_APPLY_YN));
                SBUxMethod.set("SHUTDOWN_AVG_YN", gfn_nvl(infoData.SHUTDOWN_AVG_YN));
                SBUxMethod.set("SHUTDOWN_ORD_YN", gfn_nvl(infoData.SHUTDOWN_ORD_YN));
                SBUxMethod.set("WORKSHOP_TAX_YN", gfn_nvl(infoData.WORKSHOP_TAX_YN));
                gfnma_multiSelectSet('#SUMMARY_RULE', 'SUB_CODE', 'CODE_NAME', gfn_nvl(infoData.SUMMARY_RULE));
                SBUxMethod.set("RETIRE_DISCOUNT_YN", gfn_nvl(infoData.RETIRE_DISCOUNT_YN));

                jsonExceptList.length = 0;
                data.cv_3.forEach((item, index) => {
                    const msg = {
                        PAY_ITEM_EXCEPT_GROUP_TYPE : item.PAY_ITEM_EXCEPT_GROUP_TYPE,
                        PAY_ITEM_EXCEPT_GROUP_CODE : item.PAY_ITEM_EXCEPT_GROUP_CODE,
                        PAY_ITEM_EXCEPT_GROUP_NAME : item.PAY_ITEM_EXCEPT_GROUP_NAME,
                        MEMO : item.MEMO
                    }
                    jsonExceptList.push(msg);
                });
                gvwExcept.rebuild();
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

    const fn_gvwExceptDblclick = async function() {
        var nRow = gvwExcept.getRow();
        var nCol = gvwExcept.getCol();

        if(nCol == 1) {
            fn_findPayItemExceptGroupCodeForGvwExcept(nRow, nCol);
        }

        if(nCol == 2) {
            fn_findPayItemExceptGroupCodeForGvwExcept(nRow, nCol-1);
        }
    }

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createGvwMasterGrid();
        fn_createGvwExceptGrid();
        fn_search();
    });


    // 행추가
    const fn_addRow = async function () {
        let rowVal = gvwExcept.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwExcept.addRow(true);
        }else{
            gvwExcept.insertRow(rowVal);
        }
    }

    // 행삭제
    const fn_deleteRow = async function () {
        let rowVal = gvwExcept.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwExcept.deleteRow(rowVal);
        }
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    // 삭제
    function cfn_del() {
        fn_delete();
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    // 신규
    function cfn_add() {
        fn_create();
    }

    const fn_save = async function() {
        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        let PAY_ITEM_CODE = gfnma_nvl(SBUxMethod.get("PAY_ITEM_CODE"));
        let PAY_ITEM_NAME = gfnma_nvl(SBUxMethod.get("PAY_ITEM_NAME"));
        let PAY_ITEM_CATEGORY = gfnma_nvl(SBUxMethod.get("PAY_ITEM_CATEGORY"));
        let PAY_ITEM_PROPERTY = gfnma_nvl(SBUxMethod.get("PAY_ITEM_PROPERTY"));
        let SUMMARY_TYPE = gfnma_nvl(gfnma_multiSelectGet('#SUMMARY_TYPE'));
        let SUMMARY_RELATED_CODE = gfnma_nvl(gfnma_multiSelectGet('#SUMMARY_RELATED_CODE'));
        let TAX_REPORT_ITEM_CODE = gfnma_nvl(gfnma_multiSelectGet('#TAX_REPORT_ITEM_CODE'));
        let ENTRY_DEPT_CODE = gfnma_nvl(SBUxMethod.get("ENTRY_DEPT_CODE"));
        let TAX_FREE_YN = gfnma_nvl(SBUxMethod.get("TAX_FREE_YN"));
        let TAX_FREE_CODE = gfnma_nvl(SBUxMethod.get("TAX_FREE_CODE"));
        let ROUND_TYPE = gfnma_nvl(gfnma_multiSelectGet('#ROUND_TYPE'));
        let ROUND_TYPE_BASE_AMT = gfnma_nvl(gfnma_multiSelectGet('#ROUND_TYPE_BASE_AMT'));
        let PAY_YN = gfnma_nvl(SBUxMethod.get("PAY_YN"));
        let BONUS_YN = gfnma_nvl(SBUxMethod.get("BONUS_YN"));
        let INTERN_EMP_PAY_RATE = gfnma_nvl(SBUxMethod.get("INTERN_EMP_PAY_RATE"));
        let AVERAGE_INCLUDE_YN = gfnma_nvl(SBUxMethod.get("AVERAGE_INCLUDE_YN"));
        let ORDINARY_INCLUDE_YN = gfnma_nvl(SBUxMethod.get("ORDINARY_INCLUDE_YN"));
        let RETIRE_INCLUDE_YN = gfnma_nvl(SBUxMethod.get("RETIRE_INCLUDE_YN"));
        let DAY_DISCOUNT_YN = gfnma_nvl(SBUxMethod.get("DAY_DISCOUNT_YN"));
        let PRINT_YN = gfnma_nvl(SBUxMethod.get("PRINT_YN"));
        let SORT_SEQ = gfnma_nvl(SBUxMethod.get("SORT_SEQ"));
        let USE_YN = gfnma_nvl(SBUxMethod.get("USE_YN"));
        let MEMO = gfnma_nvl(SBUxMethod.get("MEMO"));
        let PAY_ITEM_RANGE_TYPE = gfnma_nvl(SBUxMethod.get("PAY_ITEM_RANGE_TYPE"));
        let TAX_CALCULATE_YN = gfnma_nvl(SBUxMethod.get("TAX_CALCULATE_YN"));
        let BASE_ACCOUNTING_YN = gfnma_nvl(SBUxMethod.get("BASE_ACCOUNTING_YN"));
        let INSURE_ACCOUNTING_YN = gfnma_nvl(SBUxMethod.get("INSURE_ACCOUNTING_YN"));
        let ITEM_INCLUDE_YN = gfnma_nvl(SBUxMethod.get("ITEM_INCLUDE_YN"));
        let DAILY_CALC_YN = gfnma_nvl(SBUxMethod.get("DAILY_CALC_YN"));
        let DAILY_SUM_YN = gfnma_nvl(SBUxMethod.get("DAILY_SUM_YN"));
        let DAILY_AVG_YN = gfnma_nvl(SBUxMethod.get("DAILY_AVG_YN"));
        let MINUS_APPLY_YN = gfnma_nvl(SBUxMethod.get("MINUS_APPLY_YN"));
        let SHUTDOWN_AVG_YN = gfnma_nvl(SBUxMethod.get("SHUTDOWN_AVG_YN"));
        let SHUTDOWN_ORD_YN = gfnma_nvl(SBUxMethod.get("SHUTDOWN_ORD_YN"));
        let WORKSHOP_TAX_YN = gfnma_nvl(SBUxMethod.get("WORKSHOP_TAX_YN"));
        let SUMMARY_RULE = gfnma_nvl(gfnma_multiSelectGet('#SUMMARY_RULE'));
        let RETIRE_DISCOUNT_YN = gfnma_nvl(SBUxMethod.get("RETIRE_DISCOUNT_YN"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_ITEM_CODE : PAY_ITEM_CODE,
            V_P_PAY_ITEM_NAME : PAY_ITEM_NAME,
            V_P_PAY_ITEM_CATEGORY : PAY_ITEM_CATEGORY,
            V_P_PAY_ITEM_PROPERTY : PAY_ITEM_PROPERTY,
            V_P_SUMMARY_TYPE : SUMMARY_TYPE,
            V_P_SUMMARY_RELATED_CODE : SUMMARY_RELATED_CODE,
            V_P_TAX_REPORT_ITEM_CODE : TAX_REPORT_ITEM_CODE,
            V_P_ENTRY_DEPT_CODE : ENTRY_DEPT_CODE,
            V_P_TAX_FREE_YN : TAX_FREE_YN.TAX_FREE_YN,
            V_P_TAX_FREE_CODE : TAX_FREE_CODE,
            V_P_ROUND_TYPE : ROUND_TYPE,
            V_P_ROUND_TYPE_BASE_AMT : ROUND_TYPE_BASE_AMT,
            V_P_PAY_YN : PAY_YN.PAY_YN,
            V_P_BONUS_YN : BONUS_YN.BONUS_YN,
            V_P_INTERN_EMP_PAY_RATE : INTERN_EMP_PAY_RATE,
            V_P_AVERAGE_INCLUDE_YN : AVERAGE_INCLUDE_YN.AVERAGE_INCLUDE_YN,
            V_P_ORDINARY_INCLUDE_YN : ORDINARY_INCLUDE_YN.ORDINARY_INCLUDE_YN,
            V_P_RETIRE_INCLUDE_YN : RETIRE_INCLUDE_YN.RETIRE_INCLUDE_YN,
            V_P_DAY_DISCOUNT_YN : DAY_DISCOUNT_YN.DAY_DISCOUNT_YN,
            V_P_PRINT_YN : PRINT_YN.PRINT_YN,
            V_P_SORT_SEQ : SORT_SEQ,
            V_P_USE_YN : USE_YN.USE_YN,
            V_P_MEMO : MEMO,
            V_P_PAY_ITEM_RANGE_TYPE : PAY_ITEM_RANGE_TYPE,
            V_P_TAX_CALCULATE_YN : TAX_CALCULATE_YN.TAX_CALCULATE_YN,
            V_P_BASE_ACCOUNTING_YN : BASE_ACCOUNTING_YN.BASE_ACCOUNTING_YN,
            V_P_INSURE_ACCOUNTING_YN : INSURE_ACCOUNTING_YN.INSURE_ACCOUNTING_YN,
            V_P_ITEM_INCLUDE_YN : ITEM_INCLUDE_YN.ITEM_INCLUDE_YN,
            V_P_DAILY_CALC_YN : DAILY_CALC_YN.DAILY_CALC_YN,
            V_P_DAILY_SUM_YN : DAILY_SUM_YN.DAILY_SUM_YN,
            V_P_DAILY_AVG_YN : DAILY_AVG_YN.DAILY_AVG_YN,
            V_P_MINUS_APPLY_YN : MINUS_APPLY_YN.MINUS_APPLY_YN,
            V_P_SHUTDOWN_AVG_YN : SHUTDOWN_AVG_YN.SHUTDOWN_AVG_YN,
            V_P_SHUTDOWN_ORD_YN : SHUTDOWN_ORD_YN.SHUTDOWN_ORD_YN,
            V_P_WORKSHOP_TAX_YN : WORKSHOP_TAX_YN.WORKSHOP_TAX_YN,
            V_P_SUMMARY_RULE : SUMMARY_RULE,
            V_P_RETIRE_DISCOUNT_YN : RETIRE_DISCOUNT_YN.RETIRE_DISCOUNT_YN,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrb5200.do", {
            getType				: 'json',
            workType			: editType,
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {
                let updatedData = gvwExcept.getUpdateData(true, 'all');
                let returnData = [];

                updatedData.forEach((item, index) => {
                    const param = {
                        cv_count : '0',
                        getType : 'json',
                        rownum: item.rownum,
                        workType : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                        params: gfnma_objectToString({
                            V_P_DEBUG_MODE_YN : '',
                            V_P_LANG_ID	: '',
                            V_P_COMP_CODE : gv_ma_selectedApcCd,
                            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                            V_P_PAY_ITEM_CODE : PAY_ITEM_CODE,
                            V_P_PAY_ITEM_EXCEPT_GROUP_TYPE : item.data.PAY_ITEM_EXCEPT_GROUP_TYPE,
                            V_P_PAY_ITEM_EXCEPT_GROUP_CODE : item.data.PAY_ITEM_EXCEPT_GROUP_CODE,
                            V_P_MEMO : item.data.MEMO,
                            V_P_FORM_ID : p_formId,
                            V_P_MENU_ID : p_menuId,
                            V_P_PROC_ID : '',
                            V_P_USERID : '',
                            V_P_PC : ''
                        })
                    }
                    returnData.push(param);
                });

                if(returnData.length > 0) {
                    const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrb5200List.do", {listData: returnData});
                    const data = await postJsonPromise;

                    try {
                        if (_.isEqual("S", data.resultStatus)) {
                            gfn_comAlert("I0001");
                            fn_search();
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
                } else {
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

    const fn_delete = async function () {
        if(gfnma_nvl(SBUxMethod.get("PAY_ITEM_CODE")) == "") return;

        if(gfn_comConfirm("Q0000", "정말 삭제하시겠습니까?")) {
            let PAY_ITEM_CODE = gfnma_nvl(SBUxMethod.get("PAY_ITEM_CODE"));
            let PAY_ITEM_NAME = gfnma_nvl(SBUxMethod.get("PAY_ITEM_NAME"));
            let PAY_ITEM_CATEGORY = gfnma_nvl(SBUxMethod.get("PAY_ITEM_CATEGORY"));
            let PAY_ITEM_PROPERTY = gfnma_nvl(SBUxMethod.get("PAY_ITEM_PROPERTY"));
            let SUMMARY_TYPE = gfnma_nvl(gfnma_multiSelectGet('#SUMMARY_TYPE'));
            let SUMMARY_RELATED_CODE = gfnma_nvl(gfnma_multiSelectGet('#SUMMARY_RELATED_CODE'));
            let TAX_REPORT_ITEM_CODE = gfnma_nvl(gfnma_multiSelectGet('#TAX_REPORT_ITEM_CODE'));
            let ENTRY_DEPT_CODE = gfnma_nvl(SBUxMethod.get("ENTRY_DEPT_CODE"));
            let TAX_FREE_YN = gfnma_nvl(SBUxMethod.get("TAX_FREE_YN"));
            let TAX_FREE_CODE = gfnma_nvl(SBUxMethod.get("TAX_FREE_CODE"));
            let ROUND_TYPE = gfnma_nvl(gfnma_multiSelectGet('#ROUND_TYPE'));
            let ROUND_TYPE_BASE_AMT = gfnma_nvl(gfnma_multiSelectGet('#ROUND_TYPE_BASE_AMT'));
            let PAY_YN = gfnma_nvl(SBUxMethod.get("PAY_YN"));
            let BONUS_YN = gfnma_nvl(SBUxMethod.get("BONUS_YN"));
            let INTERN_EMP_PAY_RATE = gfnma_nvl(SBUxMethod.get("INTERN_EMP_PAY_RATE"));
            let AVERAGE_INCLUDE_YN = gfnma_nvl(SBUxMethod.get("AVERAGE_INCLUDE_YN"));
            let ORDINARY_INCLUDE_YN = gfnma_nvl(SBUxMethod.get("ORDINARY_INCLUDE_YN"));
            let RETIRE_INCLUDE_YN = gfnma_nvl(SBUxMethod.get("RETIRE_INCLUDE_YN"));
            let DAY_DISCOUNT_YN = gfnma_nvl(SBUxMethod.get("DAY_DISCOUNT_YN"));
            let PRINT_YN = gfnma_nvl(SBUxMethod.get("PRINT_YN"));
            let SORT_SEQ = gfnma_nvl(SBUxMethod.get("SORT_SEQ"));
            let USE_YN = gfnma_nvl(SBUxMethod.get("USE_YN"));
            let MEMO = gfnma_nvl(SBUxMethod.get("MEMO"));
            let PAY_ITEM_RANGE_TYPE = gfnma_nvl(SBUxMethod.get("PAY_ITEM_RANGE_TYPE"));
            let TAX_CALCULATE_YN = gfnma_nvl(SBUxMethod.get("TAX_CALCULATE_YN"));
            let BASE_ACCOUNTING_YN = gfnma_nvl(SBUxMethod.get("BASE_ACCOUNTING_YN"));
            let INSURE_ACCOUNTING_YN = gfnma_nvl(SBUxMethod.get("INSURE_ACCOUNTING_YN"));
            let ITEM_INCLUDE_YN = gfnma_nvl(SBUxMethod.get("ITEM_INCLUDE_YN"));
            let DAILY_CALC_YN = gfnma_nvl(SBUxMethod.get("DAILY_CALC_YN"));
            let DAILY_SUM_YN = gfnma_nvl(SBUxMethod.get("DAILY_SUM_YN"));
            let DAILY_AVG_YN = gfnma_nvl(SBUxMethod.get("DAILY_AVG_YN"));
            let MINUS_APPLY_YN = gfnma_nvl(SBUxMethod.get("MINUS_APPLY_YN"));
            let SHUTDOWN_AVG_YN = gfnma_nvl(SBUxMethod.get("SHUTDOWN_AVG_YN"));
            let SHUTDOWN_ORD_YN = gfnma_nvl(SBUxMethod.get("SHUTDOWN_ORD_YN"));
            let WORKSHOP_TAX_YN = gfnma_nvl(SBUxMethod.get("WORKSHOP_TAX_YN"));
            let SUMMARY_RULE = gfnma_nvl(gfnma_multiSelectGet('#SUMMARY_RULE'));
            let RETIRE_DISCOUNT_YN = gfnma_nvl(SBUxMethod.get("RETIRE_DISCOUNT_YN"));

            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_PAY_ITEM_CODE : PAY_ITEM_CODE,
                V_P_PAY_ITEM_NAME : PAY_ITEM_NAME,
                V_P_PAY_ITEM_CATEGORY : PAY_ITEM_CATEGORY,
                V_P_PAY_ITEM_PROPERTY : PAY_ITEM_PROPERTY,
                V_P_SUMMARY_TYPE : SUMMARY_TYPE,
                V_P_SUMMARY_RELATED_CODE : SUMMARY_RELATED_CODE,
                V_P_TAX_REPORT_ITEM_CODE : TAX_REPORT_ITEM_CODE,
                V_P_ENTRY_DEPT_CODE : ENTRY_DEPT_CODE,
                V_P_TAX_FREE_YN : TAX_FREE_YN,
                V_P_TAX_FREE_CODE : TAX_FREE_CODE,
                V_P_ROUND_TYPE : ROUND_TYPE,
                V_P_ROUND_TYPE_BASE_AMT : ROUND_TYPE_BASE_AMT,
                V_P_PAY_YN : PAY_YN,
                V_P_BONUS_YN : BONUS_YN,
                V_P_INTERN_EMP_PAY_RATE : INTERN_EMP_PAY_RATE,
                V_P_AVERAGE_INCLUDE_YN : AVERAGE_INCLUDE_YN,
                V_P_ORDINARY_INCLUDE_YN : ORDINARY_INCLUDE_YN,
                V_P_RETIRE_INCLUDE_YN : RETIRE_INCLUDE_YN,
                V_P_DAY_DISCOUNT_YN : DAY_DISCOUNT_YN,
                V_P_PRINT_YN : PRINT_YN,
                V_P_SORT_SEQ : SORT_SEQ,
                V_P_USE_YN : USE_YN,
                V_P_MEMO : MEMO,
                V_P_PAY_ITEM_RANGE_TYPE : PAY_ITEM_RANGE_TYPE,
                V_P_TAX_CALCULATE_YN : TAX_CALCULATE_YN,
                V_P_BASE_ACCOUNTING_YN : BASE_ACCOUNTING_YN,
                V_P_INSURE_ACCOUNTING_YN : INSURE_ACCOUNTING_YN,
                V_P_ITEM_INCLUDE_YN : ITEM_INCLUDE_YN,
                V_P_DAILY_CALC_YN : DAILY_CALC_YN,
                V_P_DAILY_SUM_YN : DAILY_SUM_YN,
                V_P_DAILY_AVG_YN : DAILY_AVG_YN,
                V_P_MINUS_APPLY_YN : MINUS_APPLY_YN,
                V_P_SHUTDOWN_AVG_YN : SHUTDOWN_AVG_YN,
                V_P_SHUTDOWN_ORD_YN : SHUTDOWN_ORD_YN,
                V_P_WORKSHOP_TAX_YN : WORKSHOP_TAX_YN,
                V_P_SUMMARY_RULE : SUMMARY_RULE,
                V_P_RETIRE_DISCOUNT_YN : RETIRE_DISCOUNT_YN,
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrb5200.do", {
                getType				: 'json',
                workType			: 'D',
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;
            console.log('data:', data);

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    fn_search();
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

    const fn_search = async function() {
        editType = "N";

        let PAY_ITEM_CODE = gfnma_nvl(SBUxMethod.get("SRCH_PAY_ITEM_CODE"));
        let PAY_ITEM_NAME = gfnma_nvl(SBUxMethod.get("SRCH_PAY_ITEM_NAME"));
        let PAY_ITEM_CATEGORY = gfnma_nvl(SBUxMethod.get("SRCH_PAY_ITEM_CATEGORY"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_PAY_ITEM_CODE : PAY_ITEM_CODE,
            V_P_PAY_ITEM_NAME : PAY_ITEM_NAME,
            V_P_PAY_ITEM_CATEGORY : PAY_ITEM_CATEGORY,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrb5200List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonPayItemList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        PAY_ITEM_CODE : item.PAY_ITEM_CODE,
                        PAY_ITEM_NAME : item.PAY_ITEM_NAME,
                        PAY_ITEM_CATEGORY : item.PAY_ITEM_CATEGORY,
                        SUMMARY_TYPE : item.SUMMARY_TYPE,
                        SUMMARY_RELATED_CODE : item.SUMMARY_RELATED_CODE,
                        TAX_REPORT_ITEM_CODE : item.TAX_REPORT_ITEM_CODE,
                        ENTRY_DEPT_CODE : item.ENTRY_DEPT_CODE,
                        ENTRY_DEPT_NAME : item.ENTRY_DEPT_NAME,
                        TAX_FREE_YN : item.TAX_FREE_YN,
                        TAX_FREE_CODE : item.TAX_FREE_CODE,
                        TAX_FREE_NAME : item.TAX_FREE_NAME,
                        ROUND_TYPE : item.ROUND_TYPE,
                        ROUND_TYPE_BASE_AMT : item.ROUND_TYPE_BASE_AMT,
                        PAY_YN : item.PAY_YN,
                        BONUS_YN : item.BONUS_YN,
                        INTERN_EMP_PAY_RATE : item.INTERN_EMP_PAY_RATE,
                        AVERAGE_INCLUDE_YN : item.AVERAGE_INCLUDE_YN,
                        ORDINARY_INCLUDE_YN : item.ORDINARY_INCLUDE_YN,
                        RETIRE_INCLUDE_YN : item.RETIRE_INCLUDE_YN,
                        DAY_DISCOUNT_YN : item.DAY_DISCOUNT_YN,
                        PRINT_YN : item.PRINT_YN,
                        SORT_SEQ : item.SORT_SEQ,
                        USE_YN : item.USE_YN,
                        MEMO : item.MEMO,
                        PAY_ITEM_PROPERTY : item.PAY_ITEM_PROPERTY,
                        PAY_ITEM_RANGE_TYPE : item.PAY_ITEM_RANGE_TYPE,
                        TAX_CALCULATE_YN : item.TAX_CALCULATE_YN,
                        BASE_ACCOUNTING_YN : item.BASE_ACCOUNTING_YN,
                        INSURE_ACCOUNTING_YN : item.INSURE_ACCOUNTING_YN,
                        ITEM_INCLUDE_YN : item.ITEM_INCLUDE_YN,
                        DAILY_CALC_YN : item.DAILY_CALC_YN,
                        DAILY_SUM_YN : item.DAILY_SUM_YN,
                        DAILY_AVG_YN : item.DAILY_AVG_YN,
                        MINUS_APPLY_YN : item.MINUS_APPLY_YN,
                        SHUTDOWN_AVG_YN : item.SHUTDOWN_AVG_YN,
                        SHUTDOWN_ORD_YN : item.SHUTDOWN_ORD_YN,
                        WORKSHOP_TAX_YN : item.WORKSHOP_TAX_YN,
                        RETIRE_DISCOUNT_YN : item.RETIRE_DISCOUNT_YN,
                        SUMMARY_RULE : item.SUMMARY_RULE

                    }
                    jsonPayItemList.push(msg);
                });
                gvwMaster.rebuild();

                if(jsonPayItemList.length > 0) {
                    gvwMaster.clickRow(1);
                } else {
                    fn_create();
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

    const fn_create = async function() {
        editType = "N";
        SBUxMethod.attr("PAY_ITEM_CODE", "readonly", false);

        SBUxMethod.set("PAY_ITEM_CODE", "");
        SBUxMethod.set("PAY_ITEM_NAME", "");
        SBUxMethod.set("PAY_ITEM_CATEGORY", "");
        gfnma_multiSelectSet('#SUMMARY_TYPE', '', '', '');
        gfnma_multiSelectSet('#SUMMARY_RELATED_CODE', '', '', '');
        gfnma_multiSelectSet('#TAX_REPORT_ITEM_CODE', '', '', '');
        SBUxMethod.set("ENTRY_DEPT_CODE", "");
        SBUxMethod.set("ENTRY_DEPT_NAME", "");
        SBUxMethod.set("TAX_FREE_YN", "");
        SBUxMethod.set("TAX_FREE_CODE", "");
        SBUxMethod.set("TAX_FREE_NAME", "");
        gfnma_multiSelectSet('#ROUND_TYPE', 'SUB_CODE', 'CODE_NAME', 'ABS_DOWN');
        gfnma_multiSelectSet('#ROUND_TYPE_BASE_AMT', 'SUB_CODE', 'CODE_NAME', '1');
        SBUxMethod.set("PAY_YN", "");
        SBUxMethod.set("BONUS_YN", "");
        SBUxMethod.set("INTERN_EMP_PAY_RATE", "100");
        SBUxMethod.set("AVERAGE_INCLUDE_YN", "");
        SBUxMethod.set("ORDINARY_INCLUDE_YN", "");
        SBUxMethod.set("RETIRE_INCLUDE_YN", "");
        SBUxMethod.set("DAY_DISCOUNT_YN", "");
        SBUxMethod.set("PRINT_YN", "");
        SBUxMethod.set("SORT_SEQ", "");
        SBUxMethod.set("USE_YN", "Y");
        SBUxMethod.set("MEMO", "");
        SBUxMethod.set("PAY_ITEM_PROPERTY", "");
        SBUxMethod.set("PAY_ITEM_RANGE_TYPE", "");
        SBUxMethod.set("TAX_CALCULATE_YN", "");
        SBUxMethod.set("BASE_ACCOUNTING_YN", "");
        SBUxMethod.set("INSURE_ACCOUNTING_YN", "");
        SBUxMethod.set("ITEM_INCLUDE_YN", "");
        SBUxMethod.set("DAILY_CALC_YN", "");
        SBUxMethod.set("DAILY_SUM_YN", "");
        SBUxMethod.set("DAILY_AVG_YN", "");
        SBUxMethod.set("MINUS_APPLY_YN", "");
        SBUxMethod.set("SHUTDOWN_AVG_YN", "");
        SBUxMethod.set("SHUTDOWN_ORD_YN", "");
        SBUxMethod.set("WORKSHOP_TAX_YN", "");
        gfnma_multiSelectSet('#SUMMARY_RULE', '', '', '');
        SBUxMethod.set("RETIRE_DISCOUNT_YN", "");

        jsonExceptList.length = 0;
        gvwExcept.rebuild();
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
