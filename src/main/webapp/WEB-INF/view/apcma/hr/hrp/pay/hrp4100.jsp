<%
    /**
     * @Class Name        : hrp4100.jsp
     * @Description       : 급여 전표처리기준 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.06.20
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ ----------		----------	---------------------------
     * @ 2024.06.20   	표주완		최초 생성
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
    <title>title : 급여 전표처리기준 정보</title>
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
                </h3><!-- 급여 전표처리기준 -->
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
                    <th scope="row" class="th_bg_search로">급여체계</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_PAY_GROUP_CODE"
                                uitype="single"
                                jsondata-ref="jsonPayGroupCode"
                                unselected-text="선택"
                                class="form-control input-sm inpt_data_reqed"
                                required
                        ></sbux-select>
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search로">전표구분</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle"
                                    type="button" id="SRCH_HR_POSTING_TYPE" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_HR_POSTING_TYPE"
                                 style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search로">상대계정(미지급금)</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-input
                                id="SRCH_TXTCORRESPONDING_ACCOUNT"
                                class="form-control input-sm"
                                uitype="text"
                                style="width:100%"
                                readonly>
                        </sbux-input>
                    </td>
                    <td colspan="6" style="border-right: hidden;">&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </div>

        <div>
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>회계처리구분</span>
                        <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                    </li>
                </ul>
            </div>
            <div>
                <div id="sb-area-bandgvwInfo" style="height:320px; width:100%;"></div>
            </div>
        </div>
        <div>
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li><span>급여전표 처리기준 편접</span></li>
                </ul>
            </div>
            <div>
                <table id="dataArea2" class="table table-bordered tbl_fixed">
                    <colgroup>
                        <col style="width:6%">
                        <col style="width:4%">
                        <col style="width:4%">
                        <col style="width:2%">

                        <col style="width:6%">
                        <col style="width:5%">
                        <col style="width:4%">
                        <col style="width:2%">

                        <col style="width:3%">
                        <col style="width:3%">
                        <col style="width:3%">
                        <col style="width:4%">
                        <col style="width:2%">

                    </colgroup>
                    <tr>
                        <th scope="row" class="th_bg">급여항목</th>
                        <td colspan="2" class="td_input">
                            <sbux-select
                                    id="HR_PAY_ACCOUNT_TYPE"
                                    uitype="single"
                                    jsondata-ref="jsonHrPayAccountType"
                                    unselected-text="선택"
                                    class="form-control input-sm inpt_data_reqed"
                                    readonly
                                    required>
                            </sbux-select>
                        </td>
                        <td style="border-right: hidden;">&nbsp;</td>

                        <th scope="row" class="th_bg">집계구분</th>
                        <td class="td_input" style="border-right: hidden;">
                            <div class="dropdown">
                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="POSTING_SUMMARY_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="POSTING_SUMMARY_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-checkbox
                                    id="NEED_EMP_CODE_YN"
                                    name="NEED_EMP_CODE_YN"
                                    uitype="normal"
                                    text="사원코드 필수입력"
                                    true-value="Y"
                                    false-value="N"
                            ></sbux-checkbox>
                        </td>
                        <td style="border-right: hidden;">&nbsp;</td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-checkbox
                                    id="ACCOUNTING_YN"
                                    name="ACCOUNTING_YN"
                                    uitype="normal"
                                    text="계정처리여부"
                                    true-value="Y"
                                    false-value="N"
                            ></sbux-checkbox>
                        </td>
                        <td colspan="4" class="td_input" style="border-right: hidden;">
                            <sbux-checkbox
                                    id="POSTING_RESULT_ADJUST_YN"
                                    name="POSTING_RESULT_ADJUST_YN"
                                    uitype="normal"
                                    text="회계집계데이터 조정가능"
                                    true-value="Y"
                                    false-value="N"
                            ></sbux-checkbox>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">판매비 주계정</th>
                        <td class="td_input">
                            <sbux-input id="SALES_COST_ACC_CODE"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input
                                    id="SALES_COST_ACC_NAME"
                                    class="form-control input-sm"
                                    uitype="text"
                                    style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_ACCOUNT_POPUP('1')"
                            ></sbux-button>
                        </td>
                        <th scope="row" class="th_bg">판매비(일용직) 주계정</th>
                        <td class="td_input">
                            <sbux-input id="SALES_COST_TEMP_ACC_CODE"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input
                                    id="SALES_COST_TEMP_ACC_NAME"
                                    class="form-control input-sm"
                                    uitype="text"
                                    style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_ACCOUNT_POPUP('2')"
                            ></sbux-button>
                        </td>
                        <th colspan="2" scope="row" class="th_bg">대표 원가중심점(판매)</th>
                        <td class="td_input">
                            <sbux-input id="SALES_COST_CENTER"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input
                                    id="SALES_COST_CENTER_NAME"
                                    class="form-control input-sm"
                                    uitype="text"
                                    style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_findIntroducerCode('1')"
                            ></sbux-button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">관리비 주계정</th>
                        <td class="td_input">
                            <sbux-input id="ADMIN_COST_ACC_CODE"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input id="ADMIN_COST_ACC_NAME"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_ACCOUNT_POPUP('3')"
                            ></sbux-button>
                        </td>
                        <th scope="row" class="th_bg">관리비(일용직) 주계정</th>
                        <td class="td_input">
                            <sbux-input id="ADMIN_COST_TEMP_ACC_CODE"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input id="ADMIN_COST_TEMP_ACC_NAME"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_ACCOUNT_POPUP('4')"
                            ></sbux-button>
                        </td>
                        <th colspan="2" scope="row" class="th_bg">대표 원가중심점(관리)</th>
                        <td class="td_input">
                            <sbux-input id="ADMIN_COST_CENTER"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input
                                    id="ADMIN_COST_CENTER_NAME"
                                    class="form-control input-sm"
                                    uitype="text"
                                    style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_findIntroducerCode('2')"
                            ></sbux-button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">제조경비 주계정</th>
                        <td class="td_input">
                            <sbux-input id="MFG_COST_ACC_CODE"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input id="MFG_COST_ACC_NAME"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_ACCOUNT_POPUP('5')"
                            ></sbux-button>
                        </td>

                        <th scope="row" class="th_bg">제조경비(일용직) 주계정</th>
                        <td class="td_input">
                            <sbux-input id="MFG_COST_TEMP_ACC_CODE"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input id="MFG_COST_TEMP_ACC_NAME"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_ACCOUNT_POPUP('6')"
                            ></sbux-button>
                        </td>

                        <th colspan="2" scope="row" class="th_bg">대표 원가중심점(제조)</th>
                        <td class="td_input">
                            <sbux-input id="MFG_COST_CENTER"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input
                                    id="MFG_COST_CENTER_NAME"
                                    class="form-control input-sm"
                                    uitype="text"
                                    style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_findIntroducerCode('3')"
                            ></sbux-button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">경상연구개발비 주계정</th>
                        <td class="td_input">
                            <sbux-input id="RESEARCH_COST_ACC_CODE"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input id="RESEARCH_COST_ACC_NAME"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_ACCOUNT_POPUP('7')"
                            ></sbux-button>
                        </td>

                        <th scope="row" class="th_bg">미지급금계정</th>
                        <td class="td_input">
                            <sbux-input id="AP_ACCOUNT_CODE"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input id="AP_ACCOUNT_NAME"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_ACCOUNT_POPUP('8')"
                            ></sbux-button>
                        </td>

                        <th colspan="2" scope="row" class="th_bg">대표 원가중심점(연구)</th>
                        <td class="td_input">
                            <sbux-input id="RESEARCH_COST_CENTER"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input
                                    id="RESEARCH_COST_CENTER_NAME"
                                    class="form-control input-sm"
                                    uitype="text"
                                    style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_findIntroducerCode('4')"
                            ></sbux-button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">거래처</th>
                        <td class="td_input">
                            <sbux-input id="CS_CODE"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input id="CS_NAME"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_findCsCode"
                            ></sbux-button>
                        </td>

                        <th scope="row" class="th_bg">미수금계정</th>
                        <td class="td_input">
                            <sbux-input id="AR_ACCOUNT_CODE"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input">
                            <sbux-input id="AR_ACCOUNT_NAME"
                                        class="form-control input-sm"
                                        uitype="text"
                                        style="width:100%"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right:hidden;">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_ACCOUNT_POPUP('9')"
                            ></sbux-button>
                        </td>
                        <th colspan="2" scope="row" class="th_bg">차대구분</th>
                        <td colspan="3" class="td_input">
                            <sbux-radio id="D" name="DEBIT_CREDIT" uitype="normal"
                                        text="차변" value="D" checked>
                            </sbux-radio>
                            <sbux-radio id="C" name="DEBIT_CREDIT" uitype="normal"
                                        text="대변" value="C">
                            </sbux-radio>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">전표급여항목</th>
                        <td class="td_input" style="border-right: hidden;">
                            <div class="dropdown">
                                <button style="width:100%; height: 30px; text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="ACCOUNT_PAY_ITEM" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="ACCOUNT_PAY_ITEM" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                        <th scope="row" class="th_bg">급여항목명</th>
                        <td colspan="2" class="td_input" style="border-right: hidden;">
                            <sbux-input
                            <%--uitype="hidden"--%>
                                    uitype="text"
                                    id="ACCOUNT_PAY_ITEM_NAME"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td style="border-right: hidden;">&nbsp;</td>

                        <td class="td_input" style="border-right: hidden;">
                            <sbux-checkbox
                                    id="PAY_ITEM_UNIT_YN"
                                    name="PAY_ITEM_UNIT_YN"
                                    uitype="normal"
                                    text="급여항목단위여부"
                                    true-value="Y"
                                    false-value="N"
                            ></sbux-checkbox>
                        </td>
                    </tr>
                </table>
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

    var editType			= "N";

    var CHk_HR_POSTING_TYPE; //전표구분 체크

    //grid 초기화
    var gvwBandgvwInfoGrid; 			// 그리드를 담기위한 객체 선언
    var jsonBandgvwInfoList = []; 	// 그리드의 참조 데이터 주소 선언

    /*var radioJsonData = [
        { text  : "차변"  , value  : "D"  },
        { text  : "대변"  , value  : "C"  }
    ];*/
    var jsonPayGroupCode = []; //급여체계 //SRCH_PAY_GROUP_CODE  //L_HRI010
    var jsonHrPostingType = []; //전표구분 //SRCH_HR_POSTING_TYPE	//L_HRP023
    var jsonHrPayAccountType = []; //급여항목 //HR_PAY_ACCOUNT_TYPE	//L_HRP004_A
    var jsonPayItemCategory = []; //구분 //gvwBandgvwInfoGrid(PAY_ITEM_CATEGORY)	//L_HRB009
    var jsonPostingSummaryType = []; //집계단위 //gvwBandgvwInfoGrid(POSTING_SUMMARY_TYPE)	//L_HRP031



    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['SRCH_PAY_GROUP_CODE'], jsonPayGroupCode, 'L_HRI010', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SLRY_GRD_CD', 'SLRY_GRD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwBandgvwInfoGrid','HR_PAY_ACCOUNT_TYPE'], jsonHrPayAccountType, 'L_HRP004_A', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SLRY_ITEM_CD', 'SLRY_ITEM_NM', 'Y', ''),
            gfnma_setComSelect(['gvwBandgvwInfoGrid'], jsonPayItemCategory, 'L_HRB009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwBandgvwInfoGrid'], jsonPostingSummaryType, 'L_HRP031', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect([''], jsonHrPostingType, 'L_HRP023', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'EXTRA_COL1', 'Y', ''),

            //전표구분
            gfnma_multiSelectInit({
                target			: ['#SRCH_HR_POSTING_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRP023'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'100px',  	style:'text-align:left'},
                    {caption: "구분명", 		ref: 'CD_NM',    		width:'100px',  	style:'text-align:left'},
                    {caption: "구분계정과목", ref: 'EXTRA_COL1',    		width:'100px',  	style:'text-align:left'}
                ]
            }),

            //전표구분
            gfnma_multiSelectInit({
                target			: ['#POSTING_SUMMARY_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRP031'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "집계단위", 	ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

            //전표구분
            gfnma_multiSelectInit({
                target			: ['#ACCOUNT_PAY_ITEM']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRP031'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'up' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "집계단위", 	ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),


        ]);
    }

    var fn_ACCOUNT_POPUP = function(type) {
        var searchText 		= '';

        if (_.isEqual(type, '1')){
            searchText = gfn_nvl(SBUxMethod.get("SALES_COST_ACC_NAME"));
        }else if (_.isEqual(type, '2')){
            searchText = gfn_nvl(SBUxMethod.get("SALES_COST_TEMP_ACC_NAME"));
        }else if (_.isEqual(type, '3')){
            searchText = gfn_nvl(SBUxMethod.get("ADMIN_COST_ACC_NAME"));
        }else if (_.isEqual(type, '4')){
            searchText = gfn_nvl(SBUxMethod.get("ADMIN_COST_TEMP_ACC_NAME"));
        }else if (_.isEqual(type, '5')){
            searchText = gfn_nvl(SBUxMethod.get("MFG_COST_ACC_NAME"));
        }else if (_.isEqual(type, '6')){
            searchText = gfn_nvl(SBUxMethod.get("MFG_COST_TEMP_ACC_NAME"));
        }else if (_.isEqual(type, '7')){
            searchText = gfn_nvl(SBUxMethod.get("RESEARCH_COST_ACC_NAME"));
        }else if (_.isEqual(type, '8')){
            searchText = gfn_nvl(SBUxMethod.get("AP_ACCOUNT_NAME"));
        }else if (_.isEqual(type, '9')){
            searchText = gfn_nvl(SBUxMethod.get("AR_ACCOUNT_NAME"));
        }

        SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목 정보 팝업');
        var addParams = ['NULL'];
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FIM045'
            ,popupType				: 'B'
            ,whereClause			: addParams
            ,searchCaptions			: ["코드"         , 	"코드명"           /*,"오픈"*/]
            ,searchInputFields		: ["ACNTL_CD", 	"ACNT_NM"    /*,"V_P_OPEN_TO_ALL"*/]
            ,searchInputValues		: [""            , 	searchText		  /*,""*/]

            ,searchInputTypes		: ["input"       , 	"input"           /*,""*/]

            ,height					: '400px'
            ,tableHeader			: ["계정코드",		"계정명"   , 		"계정명(한글)" ]
            ,tableColumnNames		: ["ACNTL_CD",	"ACNT_NM", 	"ACNT_NM_CHN"        ]
            ,tableColumnWidths		: ["100px", 		"100px", 		"250px"          ]
            ,itemSelectEvent		: function (data){
                if (_.isEqual(type, '1')){
                    SBUxMethod.set('SALES_COST_ACC_CODE', data.ACNTL_CD);
                    SBUxMethod.set('SALES_COST_ACC_NAME', data.ACNT_NM);
                }else if (_.isEqual(type, '2')){
                    SBUxMethod.set('SALES_COST_TEMP_ACC_CODE', data.ACNTL_CD);
                    SBUxMethod.set('SALES_COST_TEMP_ACC_NAME', data.ACNT_NM);
                }else if (_.isEqual(type, '3')){
                    SBUxMethod.set('ADMIN_COST_ACC_CODE', data.ACNTL_CD);
                    SBUxMethod.set('ADMIN_COST_ACC_NAME', data.ACNT_NM);
                }else if (_.isEqual(type, '4')){
                    SBUxMethod.set('ADMIN_COST_TEMP_ACC_CODE', data.ACNTL_CD);
                    SBUxMethod.set('ADMIN_COST_TEMP_ACC_NAME', data.ACNT_NM);
                }else if (_.isEqual(type, '5')){
                    SBUxMethod.set('MFG_COST_ACC_CODE', data.ACNTL_CD);
                    SBUxMethod.set('MFG_COST_ACC_NAME', data.ACNT_NM);
                }else if (_.isEqual(type, '6')){
                    SBUxMethod.set('MFG_COST_TEMP_ACC_CODE', data.ACNTL_CD);
                    SBUxMethod.set('MFG_COST_TEMP_ACC_NAME', data.ACNT_NM);
                }else if (_.isEqual(type, '7')){
                    SBUxMethod.set('RESEARCH_COST_ACC_CODE', data.ACNTL_CD);
                    SBUxMethod.set('RESEARCH_COST_ACC_NAME', data.ACNT_NM);
                }else if (_.isEqual(type, '8')){
                    SBUxMethod.set('AP_ACCOUNT_CODE', data.ACNTL_CD);
                    SBUxMethod.set('AP_ACCOUNT_NAME', data.ACNT_NM);
                }else if (_.isEqual(type, '9')){
                    SBUxMethod.set('AR_ACCOUNT_CODE', data.ACNTL_CD);
                    SBUxMethod.set('AR_ACCOUNT_NAME', data.ACNT_NM);
                }
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findIntroducerCode = function(type) {

        var searchText 		= '';

        if (_.isEqual(type, '1')){
            searchText 		= gfn_nvl(SBUxMethod.get("SALES_COST_CENTER_NAME"));
        }else if(_.isEqual(type, '2')){
            searchText 		= gfn_nvl(SBUxMethod.get("ADMIN_COST_CENTER_NAME"));
        }else if(_.isEqual(type, '3')){
            searchText 		= gfn_nvl(SBUxMethod.get("MFG_COST_CENTER_NAME"));
        }else if(_.isEqual(type, '4')){
            searchText 		= gfn_nvl(SBUxMethod.get("RESEARCH_COST_CENTER_NAME"));
        }
        var replaceText0 	= "_CSTCT_CD_";
        var replaceText1 	= searchText;
        var strWhereClause 	= "AND CSTCT_CD LIKE '%" + replaceText0 + "%' AND CSTCT_NM LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '원가조직정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG010'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["원가조직코드", 		"원가조직명"]
            ,searchInputFields		: ["CSTCT_CD"   , 	    "CSTCT_NM" ]
            ,searchInputValues		: [""           , 		searchText]
            ,height					: '400px'
            ,tableHeader			: ["원가조직코드", "원가조직명"]
            ,tableColumnNames		: ["CSTCT_CD"   , "CSTCT_NM" ]
            ,tableColumnWidths		: ["150px"     , "150px"   ]
            ,itemSelectEvent		: function (data){
                if (_.isEqual(type, '1')){
                    SBUxMethod.set('SALES_COST_CENTER_NAME', data.CSTCT_NM);
                    SBUxMethod.set('SALES_COST_CENTER', data.CSTCT_CD);
                }else if(_.isEqual(type, '2')){
                    SBUxMethod.set('ADMIN_COST_CENTER_NAME', data.CSTCT_NM);
                    SBUxMethod.set('ADMIN_COST_CENTER', data.CSTCT_CD);
                }else if(_.isEqual(type, '3')){
                    SBUxMethod.set('MFG_COST_CENTER_NAME', data.CSTCT_NM);
                    SBUxMethod.set('MFG_COST_CENTER', data.CSTCT_CD);
                }else if(_.isEqual(type, '4')){
                    SBUxMethod.set('RESEARCH_COST_CENTER_NAME', data.CSTCT_NM);
                    SBUxMethod.set('RESEARCH_COST_CENTER', data.CSTCT_CD);
                }

            },
        });
    }

    const fn_findCsCode = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("CS_NAME"));
        var replaceText0 	= "_CNPT_CD_";
        var replaceText1 	= searchText;
        var replaceText2 	= "_BRNO_";
        var strWhereClause 	= "AND a.CNPT_CD LIKE '%" + replaceText0 + "%' AND a.CNPT_NM LIKE '%" + replaceText1 + "%' AND a.BRNO LIKE '%"+ replaceText2 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM004'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드"  , 	"거래처명",  "사엄자번호" ]
            ,searchInputFields		: ["CNPT_CD"   , 	"CNPT_NM",  "BRNO"]
            ,searchInputValues		: [""          , 	searchText, ""         ]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호" , "대표자"     ,"업태"          ,"종목"      ,"주소"    ,"전화"  ,"팩스"]
            ,tableColumnNames		: ["CNPT_CD" , "CNPT_NM", "BRNO", "CEO_NM","BZSTAT" ,"TPBIZ","ADDR","TELNO"   ,"FX_NO"]
            ,tableColumnWidths		: ["100px"    , "130px" , "100px"    , "120px"     ,"120px"        ,"100px"    ,"200px"  ,"100px" ,"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('CS_NAME', data.CNPT_NM);
                SBUxMethod.set('CS_CODE', data.CNPT_CD);
            },
        });
    }

    // only document
    window.addEventListener('DOMContentLoaded', async function (e) {

        await fn_initSBSelect();
        await fn_init();
        fn_search('search');

    });

    const fn_init = async function () {

        fn_createGrid();

        gfnma_multiSelectSet('#SRCH_HR_POSTING_TYPE', 'SBSD_CD', 'CD_NM', jsonHrPostingType[0].SUB_CODE);

        //let HR_POSTING_TYPE			    = gfnma_multiSelectGet('#SRCH_HR_POSTING_TYPE');//전표구분


    }

    // 신규
    function cfn_add() {

        fn_add();
    }
    // 저장
    function cfn_save() {
        fn_save();
    }
    // 삭제
    function cfn_del() {
        fn_del();
    }

    // 조회
    function cfn_search() {
        fn_search('search');
    }

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }

    //회계처리구분 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-bandgvwInfo';
        SBGridProperties.id = 'gvwBandgvwInfoGrid';
        SBGridProperties.jsonref = 'jsonBandgvwInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.frozencols = 5;
        SBGridProperties.columns = [
            {caption : ["구분","구 분"], ref : 'PAY_ITEM_CATEGORY', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCategory',  label : 'label', value : 'value'}
            },
            {caption : ["구분","급여항목"], ref : 'HR_PAY_ACCOUNT_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonHrPayAccountType',  label : 'label', value : 'value'}
            },
            {caption: ["구분","계정처리"], ref: 'ACCOUNTING_YN', type: 'checkbox', width: '70px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["구분","차대구분"], ref: 'DEBIT_CREDIT', type: 'output', width: '100px', style: 'text-align:left' , hidden: true},
            {caption : ["구분","집계단위"], ref : 'POSTING_SUMMARY_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPostingSummaryType',  label : 'label', value : 'value'}
            },
            {caption: ["판매비","판매비 주계정"], ref: 'SALES_COST_ACC_CODE', type: 'output', width: '120px', style: 'text-align:left', disabled: true},
            {caption: ["판매비","판매비 주계정명"], ref: 'SALES_COST_ACC_NAME', type: 'output', width: '120px', style: 'text-align:left', disabled: true},
            {caption: ["관리비","관리비 주계정"], ref: 'ADMIN_COST_ACC_CODE', type: 'output', width: '120px', style: 'text-align:left', disabled: true},
            {caption: ["관리비","관리비 주계정명"], ref: 'ADMIN_COST_ACC_NAME', type: 'output', width: '120px', style: 'text-align:left', disabled: true},
            {caption: ["제조경비","제조경비 주계정"], ref: 'MFG_COST_ACC_CODE', type: 'output', width: '140px', style: 'text-align:left', disabled: true},
            {caption: ["제조경비","제조경비 주계정명"], ref: 'MFG_COST_ACC_NAME', type: 'output', width: '140px', style: 'text-align:left', disabled: true},
            {caption: ["경상연구개발비","경상연구개발비 주계정"], ref: 'RESEARCH_COST_ACC_CODE', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["경상연구개발비","경상연구비개발 주계정명"], ref: 'RESEARCH_COST_ACC_NAME', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["판매비(일용직)","판매비(일용직) 주계정"], ref: 'SALES_COST_TEMP_ACC_CODE', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["판매비(일용직)","판매비(일용직) 주계정명"], ref: 'SALES_COST_TEMP_ACC_NAME', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["관리비(일용직)","관리비(일용직) 주계정"], ref: 'ADMIN_COST_TEMP_ACC_CODE', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["관리비(일용직)","관리비(일용직) 주계정명"], ref: 'ADMIN_COST_TEMP_ACC_NAME', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["제조경비(일용직)","제조경비(일용직) 주계정"], ref: 'MFG_COST_TEMP_ACC_CODE', type: 'output', width: '200px', style: 'text-align:left', disabled: true},
            {caption: ["제조경비(일용직)","제조경비(일용직) 주계정명"], ref: 'MFG_COST_TEMP_ACC_NAME', type: 'output', width: '200px', style: 'text-align:left', disabled: true},
            {caption: ["사원코드필수입력","사원코드필수입력"], ref: 'NEED_EMP_CODE_YN', type: 'checkbox', width: '120px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                } , hidden: true
            },
            {caption: ["집계결과조정가능","집계결과조정가능"], ref: 'POSTING_RESULT_ADJUST_YN', type: 'checkbox', width: '120px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }, hidden: true
            },
            {caption: ["대표원가중심점( 판매 )","대표 원가중심점(판매)"], ref: 'SALES_COST_CENTER', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["대표원가중심점( 판매 )","대표 원가중심점(판매)명"], ref: 'SALES_COST_CENTER_NAME', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["대표 원가중심점( 관리 )","대표 원가중심점(관리)"], ref: 'ADMIN_COST_CENTER', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["대표 원가중심점( 관리 )","대표 원가중심점(관리)명"], ref: 'ADMIN_COST_CENTER_NAME', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["대표원가중심점( 제조 )","대표 원가중심점(제조)"], ref: 'MFG_COST_CENTER', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["대표원가중심점( 제조 )","대표 원가중심점(제조)명"], ref: 'MFG_COST_CENTER_NAME', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["대표원가중심점( 연구 )","대표원가중심점(연구)"], ref: 'RESEARCH_COST_CENTER', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["대표원가중심점( 연구 )","대표 원가중심점(연구)명"], ref: 'RESEARCH_COST_CENTER_NAME', type: 'output', width: '170px', style: 'text-align:left', disabled: true},
            {caption: ["거래처","거래처코드"], ref: 'CS_CODE', type: 'output', width: '120px', style: 'text-align:left' , hidden: true, disabled: true},
            {caption: ["거래처","거래처"], ref: 'CS_NAME', type: 'output', width: '120px', style: 'text-align:left' , hidden: true, disabled: true},
            {caption: ["거래처","거래처"], ref: 'CS_NAME', type: 'output', width: '120px', style: 'text-align:left' , disabled: true},
            {caption: ["급여체계","급여체계"], ref: 'PAY_GROUP_CODE', type: 'output', width: '120px', style: 'text-align:left' , hidden: true},
            {caption: ["채무계정","채무계정코드"], ref: 'AP_ACCOUNT_CODE', type: 'output', width: '120px', style: 'text-align:left' , disabled: true},
            {caption: ["채무계정","채무계정명"], ref: 'AP_ACCOUNT_NAME', type: 'output', width: '120px', style: 'text-align:left' , disabled: true},
            {caption: ["채권계정","채권계정코드"], ref: 'AR_ACCOUNT_CODE', type: 'output', width: '120px', style: 'text-align:left' , disabled: true},
            {caption: ["채권계정","채권계정명"], ref: 'AR_ACCOUNT_NAME', type: 'output', width: '120px', style: 'text-align:left' , disabled: true},
            {caption: ["급여항목레벨여부","급여항목레벨여부"], ref: 'PAY_ITEM_UNIT_YN', type: 'checkbox', width: '120px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }, hidden: true
            },
            {caption : ["전표처리급여항목","전표처리급여항목"], ref : 'ACCOUNT_PAY_ITEM', width : '140px', style : 'text-align:center', type : 'combo', hidden: true,
                typeinfo : {ref : 'jsonHrPayAccountType',  label : 'label', value : 'value'}
            },
            {caption: ["전표급여항목명","전표급여항목명"], ref: 'ACCOUNT_PAY_ITEM_NAME', type: 'output', width: '140px', style: 'text-align:left' , hidden: true},
        ];

        gvwBandgvwInfoGrid = _SBGrid.create(SBGridProperties);
        gvwBandgvwInfoGrid.bind('click', 'fn_view');
        gvwBandgvwInfoGrid.bind('keyup', 'fn_keyup');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function (type) {

        let PAY_GROUP_CODE              = gfn_nvl(SBUxMethod.get("SRCH_PAY_GROUP_CODE")); //급여체계
        let HR_POSTING_TYPE			    = gfnma_multiSelectGet('#SRCH_HR_POSTING_TYPE');//전표구분
        /*let HR_POSTING_TYPE = gfn_nvl(SBUxMethod.get("SRCH_HR_POSTING_TYPE")); //전표구분*/
        let TXTCORRESPONDING_ACCOUNT    = gfn_nvl(SBUxMethod.get("SRCH_TXTCORRESPONDING_ACCOUNT")); //상대계정(미지급금)

        //필수값 검증
        if(!SBUxMethod.validateRequired({
            isDetectAttack: true,
            group_id : 'dataArea1'})) {
            return false;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedCorpCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_PAY_GROUP_CODE      : PAY_GROUP_CODE
            ,V_P_HR_POSTING_TYPE     : HR_POSTING_TYPE
            ,V_P_HR_PAY_ACCOUNT_TYPE : TXTCORRESPONDING_ACCOUNT

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/selectHrp4100List.do", {
            getType: 'json',
            workType: 'Q',
            cv_count: '1',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonBandgvwInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        PAY_ITEM_CATEGORY           : gfn_nvl(item.SLRY_ITEM_CTGRY),
                        HR_PAY_ACCOUNT_TYPE         : gfn_nvl(item.HRM_SLRY_ACNT_TYPE),
                        POSTING_SUMMARY_TYPE        : gfn_nvl(item.TOT_TYPE),
                        SALES_COST_ACC_CODE         : gfn_nvl(item.SLS_CST_ACNT_CD),
                        SALES_COST_ACC_NAME         : gfn_nvl(item.SALES_COST_ACC_NAME),
                        MFG_COST_ACC_CODE           : gfn_nvl(item.MNFTR_CST_ACNT_CD),
                        MFG_COST_ACC_NAME           : gfn_nvl(item.MFG_COST_ACC_NAME),
                        RESEARCH_COST_ACC_CODE      : gfn_nvl(item.RSRCH_DVLP_ACNT_CD),
                        RESEARCH_COST_ACC_NAME      : gfn_nvl(item.RESEARCH_COST_ACC_NAME),
                        SALES_COST_TEMP_ACC_CODE    : gfn_nvl(item.SLS_CST_DLBRR_ACNT_CD),
                        SALES_COST_TEMP_ACC_NAME    : gfn_nvl(item.SALES_COST_TEMP_ACC_NAME),
                        MFG_COST_TEMP_ACC_CODE      : gfn_nvl(item.MNFTR_CST_TMPR_ACNT_CD),
                        MFG_COST_TEMP_ACC_NAME      : gfn_nvl(item.MFG_COST_TEMP_ACC_NAME),
                        SALES_COST_CENTER           : gfn_nvl(item.SLS_CSTCT),
                        SALES_COST_CENTER_NAME      : gfn_nvl(item.SALES_COST_CENTER_NAME),
                        MFG_COST_CENTER             : gfn_nvl(item.MNFTR_CSTCT),
                        MFG_COST_CENTER_NAME        : gfn_nvl(item.MFG_COST_CENTER_NAME),
                        RESEARCH_COST_CENTER        : gfn_nvl(item.RSRCH_DVLP_CSTCT),
                        RESEARCH_COST_CENTER_NAME   : gfn_nvl(item.RESEARCH_COST_CENTER_NAME),
                        NEED_EMP_CODE_YN            : gfn_nvl(item.ND_EMP_CD_YN),
                        POSTING_RESULT_ADJUST_YN    : gfn_nvl(item.TOT_RSLT_AJMT_YN),
                        CS_CODE                     : gfn_nvl(item.CNPT_CD),
                        CS_NAME                     : gfn_nvl(item.CNPT_NM),
                        ACCOUNTING_YN               : gfn_nvl(item.ACNT_PRCS_YN),
                        DEBIT_CREDIT                : gfn_nvl(item.DBSD_CRSD),
                        ADMIN_COST_ACC_CODE         : gfn_nvl(item.MNCO_ACNT_CD),
                        ADMIN_COST_ACC_NAME         : gfn_nvl(item.ADMIN_COST_ACC_NAME),
                        ADMIN_COST_TEMP_ACC_CODE    : gfn_nvl(item.MNCO_DLBRR),
                        ADMIN_COST_TEMP_ACC_NAME    : gfn_nvl(item.ADMIN_COST_TEMP_ACC_NAME),
                        ADMIN_COST_CENTER           : gfn_nvl(item.ADMST_CSTCO),
                        ADMIN_COST_CENTER_NAME      : gfn_nvl(item.ADMIN_COST_CENTER_NAME),
                        PAY_GROUP_CODE              : gfn_nvl(item.SLRY_GRD_CD),
                        PAY_GROUP_NAME              : gfn_nvl(item.SLRY_GRD_NM),
                        AP_ACCOUNT_CODE             : gfn_nvl(item.APS_ACNT_CD),
                        AP_ACCOUNT_NAME             : gfn_nvl(item.AP_ACCOUNT_NAME),
                        AR_ACCOUNT_CODE             : gfn_nvl(item.AR_ACNT_CD),
                        AR_ACCOUNT_NAME             : gfn_nvl(item.AR_ACCOUNT_NAME),
                        PAY_ITEM_UNIT_YN            : gfn_nvl(item.SLRY_ITEM_UNIT_YN),
                        ACCOUNT_PAY_ITEM            : gfn_nvl(item.SLRY_SLIP__ACNT_ITEM),
                        ACCOUNT_PAY_ITEM_NAME       : gfn_nvl(item.SLRY_SLIP__ACNT_ITEM_NM),
                    }
                    jsonBandgvwInfoList.push(msg);
                    totalRecordCount++;
                });

                gvwBandgvwInfoGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if (_.isEqual(type, 'search')){

                    if (jsonBandgvwInfoList.length > 0) {
                        gvwBandgvwInfoGrid.clickRow(2);
                    }
                    //fn_view();
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

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    //상세정보 보기
    async function fn_view() {

        gfnma_uxDataClear('#dataArea2');

        SBUxMethod.set("ACCOUNTING_YN", 			"N");

        editType = "E";

        let nRow = gvwBandgvwInfoGrid.getRow();

        if (nRow == -1){
            nRow = 2;
        }

        let rowData = gvwBandgvwInfoGrid.getRowData(nRow);

        //라디오버튼 초기화시 리플레시 해줘야함
        SBUxMethod.refresh('DEBIT_CREDIT')


        if (_.isEmpty(rowData) == false){

            gfnma_uxDataSet('#dataArea2', rowData);

            gfnma_multiSelectSet('#POSTING_SUMMARY_TYPE', 'SBSD_CD', 'CD_NM'   , gfn_nvl(rowData.POSTING_SUMMARY_TYPE));
            gfnma_multiSelectSet('#ACCOUNT_PAY_ITEM'    , 'SBSD_CD', 'CD_NM'    , gfn_nvl(rowData.ACCOUNT_PAY_ITEM));
        }


    }

    //저장
    const fn_save = async function () {

        if (editType=="N") {
            // 신규 등록
            if(gfn_comConfirm("Q0001", "신규 등록")){

                var paramObj =await getParamForm();

                if (_.isEmpty(paramObj)){
                    return;
                }

                const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp4100.do", {
                    getType: 'json',
                    workType: '',
                    cv_count: '0',
                    params: gfnma_objectToString(paramObj)
                });

                const data = await postJsonPromise;

                try {
                    if (_.isEqual("S", data.resultStatus)) {

                        if (data.resultMessage) {
                            alert(data.resultMessage);
                        }

                        fn_search('save');

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


        }else if(editType=="E"){

            // 수정 저장
            if(gfn_comConfirm("Q0001", "수정 저장")){

                var paramObj =await getParamForm();

                if (_.isEmpty(paramObj)){
                    return;
                }

                const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp4100.do", {
                    getType: 'json',
                    workType: '',
                    cv_count: '0',
                    params: gfnma_objectToString(paramObj)
                });

                const data = await postJsonPromise;

                try {
                    if (_.isEqual("S", data.resultStatus)) {
                        if (data.resultMessage) {
                            alert(data.resultMessage);
                        }
                        fn_search('save');

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

    }


    const getParamForm = async function(){

        let PAY_GROUP_CODE      = gfn_nvl(SBUxMethod.get("SRCH_PAY_GROUP_CODE")); //급여체계
        let HR_POSTING_TYPE	    = gfnma_multiSelectGet('#SRCH_HR_POSTING_TYPE');//전표구분
        //let TXTCORRESPONDING_ACCOUNT = gfn_nvl(SBUxMethod.get("SRCH_TXTCORRESPONDING_ACCOUNT")); //상대계정(미지급금)

        if (!PAY_GROUP_CODE) {
            gfn_comAlert("W0002", "급여체계");
            return;
        }
        if (!HR_POSTING_TYPE) {
            gfn_comAlert("W0002", "전표구분");
            return;
        }

        let HR_PAY_ACCOUNT_TYPE         = gfn_nvl(SBUxMethod.get("HR_PAY_ACCOUNT_TYPE"));         //급여항목
        let POSTING_SUMMARY_TYPE        = gfnma_multiSelectGet('#POSTING_SUMMARY_TYPE');//집계구분
        //let POSTING_SUMMARY_TYPE      = gfn_nvl(SBUxMethod.get("POSTING_SUMMARY_TYPE"));   //집계구분


        let NEED_EMP_CODE_YN            = gfn_nvl(SBUxMethod.get("NEED_EMP_CODE_YN"));   //사원코드 필수입력
        let ACCOUNTING_YN               = gfn_nvl(SBUxMethod.get("ACCOUNTING_YN"));   //계정처리여부
        let POSTING_RESULT_ADJUST_YN    = gfn_nvl(SBUxMethod.get("POSTING_RESULT_ADJUST_YN"));   //회계집계데이터 조정가능
        let SALES_COST_ACC_CODE         = gfn_nvl(SBUxMethod.get("SALES_COST_ACC_CODE"));   //판매비 주계정
        //let SALES_COST_ACC_NAME       = gfn_nvl(SBUxMethod.get("SALES_COST_ACC_NAME"));   //판매비 주계정
        let SALES_COST_TEMP_ACC_CODE    = gfn_nvl(SBUxMethod.get("SALES_COST_TEMP_ACC_CODE"));   //판매비(일용직) 주계정
        //let SALES_COST_TEMP_ACC_NAME  = gfn_nvl(SBUxMethod.get("SALES_COST_TEMP_ACC_NAME"));   //판매비(일용직) 주계정
        let SALES_COST_CENTER           = gfn_nvl(SBUxMethod.get("SALES_COST_CENTER"));   //대표 원가중심점(판매)
        //let SALES_COST_CENTER_NAME    = gfn_nvl(SBUxMethod.get("SALES_COST_CENTER_NAME"));   //대표 원가중심점(판매)
        let ADMIN_COST_ACC_CODE         = gfn_nvl(SBUxMethod.get("ADMIN_COST_ACC_CODE"));   //관리비 주계정
        //let ADMIN_COST_ACC_NAME       = gfn_nvl(SBUxMethod.get("ADMIN_COST_ACC_NAME"));   //관리비 주계정
        let ADMIN_COST_TEMP_ACC_CODE    = gfn_nvl(SBUxMethod.get("ADMIN_COST_TEMP_ACC_CODE"));   //관리비(일용직) 주계정
        //let ADMIN_COST_TEMP_ACC_NAME  = gfn_nvl(SBUxMethod.get("ADMIN_COST_TEMP_ACC_NAME"));   //관리비(일용직) 주계정
        let ADMIN_COST_CENTER           = gfn_nvl(SBUxMethod.get("ADMIN_COST_CENTER"));   //대표 원가중심점(관리)
        //let ADMIN_COST_CENTER_NAME    = gfn_nvl(SBUxMethod.get("ADMIN_COST_CENTER_NAME"));   //대표 원가중심점(관리)
        let MFG_COST_ACC_CODE           = gfn_nvl(SBUxMethod.get("MFG_COST_ACC_CODE"));   //제조경비 주계정
        //let MFG_COST_ACC_NAME         = gfn_nvl(SBUxMethod.get("MFG_COST_ACC_NAME"));   //제조경비 주계정
        let MFG_COST_TEMP_ACC_CODE      = gfn_nvl(SBUxMethod.get("MFG_COST_TEMP_ACC_CODE"));   //제조경비(일용직) 주계정
        //let MFG_COST_TEMP_ACC_NAME    = gfn_nvl(SBUxMethod.get("MFG_COST_TEMP_ACC_NAME"));   //제조경비(일용직) 주계정
        let MFG_COST_CENTER             = gfn_nvl(SBUxMethod.get("MFG_COST_CENTER"));   //대표 원가중심점(제조)
        //let MFG_COST_CENTER_NAME      = gfn_nvl(SBUxMethod.get("MFG_COST_CENTER_NAME"));   //대표 원가중심점(제조)
        let RESEARCH_COST_ACC_CODE      = gfn_nvl(SBUxMethod.get("RESEARCH_COST_ACC_CODE"));   //경상연구개발비 주계정
        //let RESEARCH_COST_ACC_NAME    = gfn_nvl(SBUxMethod.get("RESEARCH_COST_ACC_NAME"));   //경상연구개발비 주계정
        let AP_ACCOUNT_CODE             = gfn_nvl(SBUxMethod.get("AP_ACCOUNT_CODE"));   //미지급금계정
        //let AP_ACCOUNT_NAME           = gfn_nvl(SBUxMethod.get("AP_ACCOUNT_NAME"));   //미지급금계정
        let RESEARCH_COST_CENTER        = gfn_nvl(SBUxMethod.get("RESEARCH_COST_CENTER"));   //대표 원가중심점(연구)
        //let RESEARCH_COST_CENTER_NAME = gfn_nvl(SBUxMethod.get("RESEARCH_COST_CENTER_NAME"));   //대표 원가중심점(연구)
        let CS_CODE                     = gfn_nvl(SBUxMethod.get("CS_CODE"));   //거래처
        //let CS_NAME                   = gfn_nvl(SBUxMethod.get("CS_NAME"));   //거래처
        let AR_ACCOUNT_CODE             = gfn_nvl(SBUxMethod.get("AR_ACCOUNT_CODE"));   //미수금계정
        //let AR_ACCOUNT_NAME           = gfn_nvl(SBUxMethod.get("AR_ACCOUNT_NAME"));   //미수금계정
        let DEBIT_CREDIT                = gfn_nvl(SBUxMethod.get("DEBIT_CREDIT"));   //차대구분
        let ACCOUNT_PAY_ITEM	        = gfnma_multiSelectGet('#ACCOUNT_PAY_ITEM');//전표급여항목

        let ACCOUNT_PAY_ITEM_NAME       = gfn_nvl(SBUxMethod.get("ACCOUNT_PAY_ITEM_NAME"));   //급여항목명
        let PAY_ITEM_UNIT_YN            = gfn_nvl(SBUxMethod.get("PAY_ITEM_UNIT_YN"));   //급여항목단위여부


        //필수값 검증
        /*if(!SBUxMethod.validateRequired({
            isDetectAttack: true,
            group_id : 'dataArea2'})) {
            return false;
        }*/
        if (!HR_PAY_ACCOUNT_TYPE) {
            gfn_comAlert("W0002", "전표구분");
            return;
        }

        if (!POSTING_SUMMARY_TYPE) {
            gfn_comAlert("W0002", "사용여부");
            return;
        }
        /* if (!DEBIT_CREDIT) {
             gfn_comAlert("W0002", "차대구분");
             return;
         }*/


        let paramObj = {
            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd

            ,V_P_HR_POSTING_TYPE          : HR_POSTING_TYPE
            ,V_P_PAY_GROUP_CODE           : PAY_GROUP_CODE
            ,V_P_HR_PAY_ACCOUNT_TYPE      : HR_PAY_ACCOUNT_TYPE
            ,V_P_POSTING_SUMMARY_TYPE     : POSTING_SUMMARY_TYPE
            ,V_P_SALES_COST_ACC_CODE      : SALES_COST_ACC_CODE
            ,V_P_ADMIN_COST_ACC_CODE      : ADMIN_COST_ACC_CODE
            ,V_P_MFG_COST_ACC_CODE        : MFG_COST_ACC_CODE
            ,V_P_RESEARCH_COST_ACC_CODE   : RESEARCH_COST_ACC_CODE
            ,V_P_SALES_COST_TEMP_ACC_CODE : SALES_COST_TEMP_ACC_CODE
            ,V_P_ADMIN_COST_TEMP_ACC_CODE : ADMIN_COST_TEMP_ACC_CODE
            ,V_P_MFG_COST_TEMP_ACC_CODE   : MFG_COST_TEMP_ACC_CODE
            ,V_P_SALES_COST_CENTER        : SALES_COST_CENTER
            ,V_P_ADMIN_COST_CENTER        : ADMIN_COST_CENTER
            ,V_P_MFG_COST_CENTER          : MFG_COST_CENTER
            ,V_P_RESEARCH_COST_CENTER     : RESEARCH_COST_CENTER
            ,V_P_NEED_EMP_CODE_YN         : NEED_EMP_CODE_YN.NEED_EMP_CODE_YN
            ,V_P_POSTING_RESULT_ADJUST_YN : POSTING_RESULT_ADJUST_YN.POSTING_RESULT_ADJUST_YN
            ,V_P_CS_CODE                  : CS_CODE
            ,V_P_ACCOUNTING_YN            : ACCOUNTING_YN.ACCOUNTING_YN
            ,V_P_DEBIT_CREDIT             : DEBIT_CREDIT
            ,V_P_AP_ACCOUNT_CODE          : AP_ACCOUNT_CODE
            ,V_P_AR_ACCOUNT_CODE          : AR_ACCOUNT_CODE
            ,V_P_PAY_ITEM_UNIT_YN         : PAY_ITEM_UNIT_YN.PAY_ITEM_UNIT_YN
            ,V_P_ACCOUNT_PAY_ITEM         : ACCOUNT_PAY_ITEM
            ,V_P_ACCOUNT_PAY_ITEM_NAME    : ACCOUNT_PAY_ITEM_NAME

            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        }

        return paramObj;
    }

    //신규 작성
    function fn_add() {

        editType = "N";

        SBUxMethod.attr('HR_PAY_ACCOUNT_TYPE',	'readonly', false);

        gfnma_uxDataClear('#dataArea2');

        SBUxMethod.set("ACCOUNTING_YN", 			"N");
        SBUxMethod.set("ACCOUNTING_YN", 			"N");
        SBUxMethod.set("ACCOUNTING_YN", 			"N");


    }

    //삭제
    const fn_del = async function() {

        if (gfn_comConfirm("Q0001", "삭제")) {

            var paramObj =await getParamForm();

            if (_.isEmpty(paramObj)){
                return;
            }

            const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp4100.do", {
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
                        fn_search('search');
                    }else{
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        fn_search('search');
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

    $(function () {

        // 변경을 감지할 노드 선택
        const targetNode = document.getElementById("SRCH_HR_POSTING_TYPE");

        // 감지 옵션 (감지할 변경)
        const config = { attributes: true, childList: true, subtree: true };


        // 변경 감지 시 실행할 콜백 함수
        const callback = (mutationList, observer) => {

            let HR_POSTING_TYPE = gfnma_multiSelectGet('#SRCH_HR_POSTING_TYPE');

            if (!_.isEmpty(HR_POSTING_TYPE)) {
                if (!_.isEqual(CHk_HR_POSTING_TYPE, HR_POSTING_TYPE)) {
                    CHk_HR_POSTING_TYPE = HR_POSTING_TYPE;

                    jsonHrPostingType.forEach((item,index)=>{

                        if (_.isEqual(HR_POSTING_TYPE, item.value)){

                            SBUxMethod.set("SRCH_TXTCORRESPONDING_ACCOUNT", item.label);
                        }

                    })
                }
            }

        };

        // 콜백 함수에 연결된 감지기 인스턴스 생성
        const observer = new MutationObserver(callback);

        // 설정한 변경의 감지 시작
        observer.observe(targetNode, config);


        //전표구분 선택시 상태계정(미지지급금 set)
        /*$("#SRCH_HR_POSTING_TYPE").on("DOMSubtreeModified",function(e){

            let HR_POSTING_TYPE = gfnma_multiSelectGet('#SRCH_HR_POSTING_TYPE');

            if (!_.isEmpty(HR_POSTING_TYPE)) {
                if (!_.isEqual(CHk_HR_POSTING_TYPE, HR_POSTING_TYPE)) {
                    CHk_HR_POSTING_TYPE = HR_POSTING_TYPE;

                    jsonHrPostingType.forEach((item,index)=>{

                        if (_.isEqual(HR_POSTING_TYPE, item.value)){

                            SBUxMethod.set("SRCH_TXTCORRESPONDING_ACCOUNT", item.label);
                        }

                    })
                }
            }
        });*/

    });


</script>
</body>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
