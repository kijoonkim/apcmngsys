<%
    /**
     * @Class Name 		: trp1050.jsp
     * @Description 	: 지급처리 화면
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
    <title>title : 지급처리</title>
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
            <div style="margin-left: auto;">
                <sbux-button id="btnQuery" name="btnQuery" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_query"></sbux-button>
                <sbux-button id="btnPayPlan" name="btnPayPlan" uitype="normal" text="지급처리" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_payPlan"></sbux-button>
                <sbux-button id="btnGroupCancel" name="btnGroupCancel" uitype="normal" text="그룹취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_groupCancel"></sbux-button>
                <sbux-button id="btnGroup" name="btnGroup" uitype="normal" text="그룹지정" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_group"></sbux-button>
                <sbux-button id="btnSplitCancel" name="btnSplitCancel" uitype="normal" text="분할취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_splitCancel"></sbux-button>
                <sbux-button id="btnSplit" name="btnSplit" uitype="normal" text="분할생성" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_split"></sbux-button>
            </div>
        </div>
        <div class="box-body">

            <!--[pp] 검색 -->
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <table id="panHeader" class="table table-bordered tbl_fixed">
                <caption>지급프로그램</caption>
                <colgroup>
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 1%">
                    <col style="width: 8%">
                    <col style="width: 3%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 1%">
                    <col style="width: 2%">
                    <col style="width: 1%">
                    <col style="width: 8%">
                    <col style="width: 3%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">회계단위</th>
                    <td colspan="3" class="td_input">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panHeader" required>
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_FI_ORG_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">거래처</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_CS_FR">
                        <sbux-input id="SRCH_CS_CODE_FR" uitype="hidden" placeholder="" class="form-control input-sm" readonly></sbux-input>
                        <sbux-input id="SRCH_CS_NAME_FR" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_CS_FR">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findCsCode('FR')"
                        ></sbux-button>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <span> ~ </span>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_CS_TO">
                        <sbux-input id="SRCH_CS_CODE_TO" uitype="hidden" placeholder="" class="form-control input-sm" readonly></sbux-input>
                        <sbux-input id="SRCH_CS_NAME_TO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_CS_TO">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findCsCode('TO')"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">
                        <sbux-checkbox
                                uitype="normal"
                                id="SRCH_MULTI_CS_YN"
                                name="SRCH_MULTI_CS_YN"
                                uitype="normal"
                                class="form-control input-sm"
                                text="복수선택"
                                true-value="Y" false-value="N"
                        />
                    </th>
                    <td class="td_input">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="복수거래처" uitype="modal"
                                target-id="modal-compopup3"
                                onclick="fn_multiCsSelect"
                        ></sbux-button>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">지급일자</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_FROM_DATE"
                                name="SRCH_FROM_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td>
                        <sbux-checkbox
                                uitype="normal"
                                id="SRCH_BEFORE_INCLUDE_YN"
                                name="SRCH_BEFORE_INCLUDE_YN"
                                uitype="normal"
                                class="form-control input-sm"
                                text="이전일포함"
                                true-value="Y" false-value="N"
                        />
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">송장지급조건</th>
                    <td colspan="6" class="td_input">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_AP_PAY_TERM" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_AP_PAY_TERM" style="width:730px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">
                        <sbux-checkbox
                                uitype="normal"
                                id="SRCH_MULTI_YN"
                                name="SRCH_MULTI_YN"
                                uitype="normal"
                                class="form-control input-sm"
                                text="복수선택"
                                true-value="Y" false-value="N"
                        />
                    </th>
                    <td class="td_input">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="복수선택" uitype="modal"
                                target-id="modal-compopup3"
                                onclick="fn_multiSelect"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">승인일자</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_POSING_DATE"
                                name="SRCH_POSING_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">지급통화</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_PAY_CURRENCY">
                        <sbux-input id="SRCH_PAY_CURRENCY_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_PAY_CURRENCY">
                        <sbux-input id="SRCH_PAY_CURRENCY_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_PAY_CURRENCY">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findPayCurrencyCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">지급방법</th>
                    <td colspan="6" class="td_input">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_PAY_METHOD" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_PAY_METHOD" style="width:470px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <th scope="row" class="th_bg">
                        <sbux-checkbox
                                uitype="normal"
                                id="SRCH_MULTI_M_YN"
                                name="SRCH_MULTI_M_YN"
                                uitype="normal"
                                class="form-control input-sm"
                                text="복수선택"
                                true-value="Y" false-value="N"
                        />
                    </th>
                    <td class="td_input">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="복수선택" uitype="modal"
                                target-id="modal-compopup3"
                                onclick="fn_multiMSelect"
                        ></sbux-button>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">전기일자</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_F_TXN_DATE"
                                name="SRCH_F_TXN_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <span> ~ </span>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_T_TXN_DATE"
                                name="SRCH_T_TXN_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">전표번호</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DOC_NAME_FR" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <span> ~ </span>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DOC_NAME_TO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">
                        <sbux-checkbox
                                uitype="normal"
                                id="SRCH_MULTI_A_YN"
                                name="SRCH_MULTI_A_YN"
                                uitype="normal"
                                class="form-control input-sm"
                                text="복수선택"
                                true-value="Y" false-value="N"
                        />
                    </th>
                    <td class="td_input">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="복수선택" uitype="modal"
                                target-id="modal-compopup3"
                                onclick="fn_multiASelect"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">검색조건</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-checkbox
                                uitype="normal"
                                id="SRCH_OTHER_CURRENCY_YN"
                                name="SRCH_OTHER_CURRENCY_YN"
                                uitype="normal"
                                class="form-control input-sm"
                                text="이종통화 조회여부"
                                true-value="Y" false-value="N"
                        />
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_TREASURY_BATCH_NO" class="form-control input-sm"></sbux-input>
                        <sbux-select id="SRCH_GATE" uitype="single" jsondata-ref="jsonGate" unselected-text="선택" class="form-control input-sm" style="display: none;"></sbux-select>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_ACCOUNT_CODE" class="form-control input-sm"></sbux-input>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_ACCOUNT_NAME" class="form-control input-sm"></sbux-input>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_DEPOSIT_CODE" class="form-control input-sm"></sbux-input>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_DEPOSIT_NAME" class="form-control input-sm"></sbux-input>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_BANK_CODE" class="form-control input-sm"></sbux-input>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_WITHDRAW_TYPE" class="form-control input-sm"></sbux-input>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_ACCOUNT_NUM" class="form-control input-sm"></sbux-input>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_EXCHANGE_RATE" value="0" class="form-control input-sm"></sbux-input>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_EXCHANGE_BASE_SCALE" value="0" class="form-control input-sm"></sbux-input>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_CURRENCY_CODE" class="form-control input-sm"></sbux-input>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_TXN_DATE" class="form-control input-sm"></sbux-input>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_DEPOSIT_ACCOUNT" class="form-control input-sm"></sbux-input>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_PAY_ORIGINAL_AMOUNT" class="form-control input-sm"></sbux-input>
                        <sbux-input uitype="hidden" uitype="text" id="SRCH_BANK_ACCOUNT_NO_P" class="form-control input-sm"></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>지급상세내역</span>
                        </li>
                    </ul>
                    <div class="ad_tbl_toplist" style="display: flex; align-items: center; justify-content: flex-end;">
                        <div style="display: flex; align-items: center; justify-content: left; width: 40%; margin-right: 3%">
                            <span style="margin-right: 10px;">계좌번호</span>
                            <sbux-input id="BANK_CODE_P" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                            <sbux-input id="BANK_NAME_P" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                            <sbux-button class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-compopup1" style="margin-right: 10px;" onclick="fn_findBankCode"></sbux-button>
                            <sbux-input id="DEPOSIT_CODE_P" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                            <sbux-input id="DEPOSIT_NAME_P" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                            <sbux-button class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-compopup1" style="margin-right: 10px;" onclick="fn_findDepositCode"></sbux-button>
                            <sbux-button id="btnApplyAccount" name="btnApplyAccount" class="btn btn-xs btn-outline-dark" text="계좌반영" uitype="normal" onclick="fn_applyAccount"></sbux-button>
                        </div>
                        <table class="table table-bordered tbl_fixed" style="width: 45%">
                            <caption>지급</caption>
                            <colgroup>
                                <col style="width: 20%">
                                <col style="width: 20%">
                                <col style="width: 20%">
                                <col style="width: 20%">
                                <col style="width: 20%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td class="td_input" style="border:hidden;">지급(환산전)</td>
                                <td class="td_input" style="border:hidden;">
                                    <sbux-input id="TOT_PAY_FUNCTIONAL_AMOUNT" name="TOT_PAY_FUNCTIONAL_AMOUNT" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <td class="td_input" style="border:hidden;">지급(환산후)</td>
                                <td class="td_input" style="border:hidden;">
                                    <sbux-input id="TOT_PAY_FUNCTIONAL_AMT_CONV" name="TOT_PAY_FUNCTIONAL_AMT_CONV" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <td class="td_input" style="border:hidden;">
                                    <sbux-button id="btnSum" name="btnSum" uitype="normal" text="합계" class="btn btn-sm btn-outline-danger" onclick="fn_sum" style="float: right;"></sbux-button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 20px;">
                    <div id="sb-area-gvwList" style="height:600px;"></div>
                </div>
                <div id="panBottom" class="ad_tbl_top2">
                    <div class="ad_tbl_toplist" style="display: flex; align-items: center; justify-content: flex-end;">
                        <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확인" class="btn btn-sm btn-outline-danger" onclick="fn_confirm" style="float: right;"></sbux-button>
                        <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="fn_cancel" style="float: right;"></sbux-button>
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

<div>
    <sbux-modal style="width:700px" id="modal-compopup3" name="modal-compopup3" uitype="middle" header-title="" body-html-id="body-modal-compopup3" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup3">
    <jsp:include page="../../../com/popup/comPopup3.jsp"></jsp:include>
</div>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_fiOrgCode = "${loginVO.maFIOrgCode}";
    var p_currUnit = "${loginVO.maCurrUnit}";
    var p_deptCode = "${loginVO.maDeptCode}";
    var p_empCode = "${loginVO.maEmpCode}";
    //-----------------------------------------------------------

    var strCode1List = "";
    var strCode2List = "";
    var strCsCodeList = "";
    var strAccountCodeList = "";

    var dtResult1 = null;
    var dtResult2 = null;
    var dtResult3 = null;
    var dtResult4 = null;

    var htInvoice;
    var dtKeyInvoiceMapping = {};

    var strtr_batch_no = "";

    var bPopUpFlag = false;
    var bQuery = false;

    var jsonTxnGroupCode = []; // 입출
    var jsonTermCode = []; // 지급기준
    var jsonBankCode = []; // 은행코드
    var jsonUser = []; // 사용자
    var jsonCurrencyCode = []; // 통화코드
    var jsonPayMethod = []; // 지급방법
    var jsonHoldReason = []; // 보류사유
    var jsonStatus = []; // 상태
    var jsonPlanSource = []; // 소스
    var jsonWithdrawType = []; // 지급방법
    var jsonItemSourceType = []; // 전표구분
    var jsonComType = []; // 기업분류
    var jsonGate = []; // AND OR Gate

    //grid 초기화
    var gvwList; 			// 그리드를 담기위한 객체 선언

    var jsonPaymentDetailList = []; 	// 그리드의 참조 데이터 주소 선언

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 회계단위
            gfnma_multiSelectInit({
                target			: ['#SRCH_FI_ORG_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIM022'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'FI_ORG_CODE'
                ,colLabel		: 'FI_ORG_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'FI_ORG_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명", 		ref: 'FI_ORG_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 송장지급조건
            gfnma_multiSelectInit({
                target			: ['#SRCH_AP_PAY_TERM']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_COM012_P'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'PAY_TERM_CODE'
                ,colLabel		: 'PAY_TERM_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'PAY_TERM_CODE', 			width:'80px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'PAY_TERM_NAME',    		width:'200px',  	style:'text-align:left'},
                    {caption: "명칭2", 		ref: 'PAY_TERM_NAME2',    		width:'250px',  	style:'text-align:left'},
                    {caption: "지급방법", 		ref: 'PAY_METHOD',    		width:'100px',  	style:'text-align:left'},
                    {caption: "지급방법명", 		ref: 'PAY_METHOD_NAME',    		width:'100px',  	style:'text-align:left'},
                ]
            }),
            // 지급방법
            gfnma_multiSelectInit({
                target			: ['#SRCH_PAY_METHOD']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIM081_A1'
                ,whereClause	: ""
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "코드명", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'},
                    {caption: "은행", 		ref: 'BANK_CODE',    		width:'30px',  	style:'text-align:left'},
                    {caption: "계좌번호", 	ref: 'ACCOUNT_NUM',    		width:'120px',  	style:'text-align:left'},
                    {caption: "계좌코드", 	ref: 'DEPOSIT_CODE',    	width:'120px',  	style:'text-align:left'},
                ]
            }),
            // 입출
            gfnma_setComSelect(['gvwList'], jsonTxnGroupCode, 'L_FIM071', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 지급기준
            gfnma_setComSelect(['gvwList'], jsonTermCode, 'L_COM012', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_TERM_CODE', 'PAY_TERM_NAME', 'Y', ''),
            // 은행코드
            gfnma_setComSelect(['gvwList'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 사용자
            gfnma_setComSelect(['gvwList'], jsonUser, 'L_USER', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'USER_ID', 'USER_NAME', 'Y', ''),
            // 통화코드
            gfnma_setComSelect(['gvwList'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 지급방법
            gfnma_setComSelect(['gvwList'], jsonPayMethod, 'L_FIM081', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 보류사유
            gfnma_setComSelect(['gvwList'], jsonHoldReason, 'L_COM042', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상태
            gfnma_setComSelect(['gvwList'], jsonStatus, 'L_FIG002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 소스
            gfnma_setComSelect(['gvwList'], jsonPlanSource, 'L_FIM075', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 지급방법
            gfnma_setComSelect(['gvwList'], jsonWithdrawType, 'L_FIM073', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_TERM_CODE', 'PAY_TERM_NAME', 'Y', ''),
            // 전표구분
            gfnma_setComSelect(['gvwList'], jsonItemSourceType, 'L_FIM051', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 기업분류
            gfnma_setComSelect(['gvwList'], jsonComType, 'L_COM030', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 기업분류
            gfnma_setComSelect(['SRCH_GATE'], jsonGate, 'L_AND_OR', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

        ]);
    }

    function fn_createGvwListGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwList';
        SBGridProperties.id 				= 'gvwList';
        SBGridProperties.jsonref 			= 'jsonPaymentDetailList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.frozencols = 14;
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
            {caption: ["계좌"],         ref: 'DEPOSIT_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["입출계좌"],         ref: 'DEPOSIT_NAME',    type:'output',  	width:'155px',  style:'text-align:left'}, // TODO : P_DEPOSIT_OUT
            {caption: ["그룹"],         ref: 'GROUP_ID',    type:'output',  	width:'50px',  style:'text-align:left'},
            {caption: ["PAY_DATE_P"],         ref: 'PAY_DATE_P',    type:'output',  	width:'50px',  style:'text-align:left', hidden: true},
            {caption: ["지급일자"],       ref: 'PLANNED_PAY_DATE', 		type:'datepicker',  	width:'86px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["입출"], 		ref: 'TXN_GROUP_CODE',   	    type:'combo', style:'text-align:left' ,width: '84px',
                typeinfo: {
                    ref			: 'jsonTxnGroupCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["소스"], 		ref: 'PLAN_SOURCE',   	    type:'combo', style:'text-align:left' ,width: '78px',
                typeinfo: {
                    ref			: 'jsonPlanSource',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전기일자"],       ref: 'DOC_DATE', 		type:'datepicker',  	width:'94px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["승인일자"],       ref: 'POSTING_DATE', 		type:'datepicker',  	width:'94px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["거래처코드"],         ref: 'CS_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["지급처명"],         ref: 'CS_NAME',    type:'output',  	width:'187px',  style:'text-align:left'},
            {caption: ["회사지급기준"], 		ref: 'CS_PAY_TERM',   	    type:'combo', style:'text-align:left' ,width: '130px',
                typeinfo: {
                    ref			: 'jsonTermCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["송장지급기준"], 		ref: 'AP_PAY_TERM',   	    type:'combo', style:'text-align:left' ,width: '119px',
                typeinfo: {
                    ref			: 'jsonTermCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["지급방법(AP)"], 		ref: 'AP_PAY_METHOD',   	    type:'combo', style:'text-align:left' ,width: '85px',
                typeinfo: {
                    ref			: 'jsonPayMethod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["라인전표유형"], 		ref: 'ITEM_SOURCE_TYPE',   	    type:'combo', style:'text-align:left' ,width: '99px',
                typeinfo: {
                    ref			: 'jsonItemSourceType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["소스전표번호"],         ref: 'DOC_SOURCE_NAME',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["배치번호"],         ref: 'DOC_BATCH_NO',    type:'output',  	width:'158px',  style:'text-align:left'},
            {caption: ["지급통화"], 		ref: 'PAY_CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["환율"],         ref: 'EXCHANGE_RATE',    type:'output',  	width:'80px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["지급(통화)"],         ref: 'PAY_ORIGINAL_AMOUNT',    type:'output',  	width:'129px',  style:'text-align:left'},
            {caption: ["지급(환산전)"],         ref: 'PAY_FUNCTIONAL_AMOUNT',    type:'output',  	width:'112px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["지급환율(채무기준)"],         ref: 'EXCHANGE_RATE_AP',    type:'output',  	width:'112px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["지급액(통화-채무)"],         ref: 'PAY_ORIGINAL_AMOUNT_AP',    type:'output',  	width:'128px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["지급액(환산-채무)"],         ref: 'PAY_FUNCTIONAL_AMOUNT_AP',    type:'output',  	width:'128px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["지급액(환산후)"],         ref: 'PAY_FUNCTIONAL_AMT_CONV',    type:'output',  	width:'132px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["환차손익"],         ref: 'PAY_EXCHANGE_PL_AMT',    type:'output',  	width:'130px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["거래처은행"], 		ref: 'PAYER_BANK_CODE',   	    type:'combo', style:'text-align:left' ,width: '96px',
                typeinfo: {
                    ref			: 'jsonBankCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["거래처계좌번호"],         ref: 'PAYER_BANK_ACCOUNT',    type:'output',  	width:'128px',  style:'text-align:left'},
            {caption: ["거래처예금주"],         ref: 'PAYER_BANK_ACCOUNT_OWNER',    type:'output',  	width:'105px',  style:'text-align:left'},
            {caption: ["통화(채무)"], 		ref: 'CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '119px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["당초환율(채무)"],         ref: 'EXCHANGE_RATE_ORIG',    type:'output',  	width:'140px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["잔액(통화)"],         ref: 'REMAIN_ORIGINAL_AMOUNT',    type:'output',  	width:'130px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["잔액(환산전)"],         ref: 'REMAIN_FUNCTIONAL_AMOUNT',    type:'output',  	width:'122px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["잔액(환산후)"],         ref: 'REMAIN_FUNCTIONAL_AMT_CONV',    type:'output',  	width:'119px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["총금액(통화)"],         ref: 'ORIGINAL_AMOUNT',    type:'output',  	width:'131px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["총금액(환산)"],         ref: 'FUNCTIONAL_AMOUNT',    type:'output',  	width:'138px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["적요"],         ref: 'DOC_DESC',    type:'output',  	width:'400px',  style:'text-align:left'},{caption: ["실사용자"], 		ref: 'PAYEE_CODE',   	    type:'combo', style:'text-align:left' ,width: '87px',
                typeinfo: {
                    ref			: 'jsonUser',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["보류여부"],         ref: 'HOLD_FLAG',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["보류사유"], 		ref: 'HOLD_REASON',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonHoldReason',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["증빙번호"],         ref: 'VOUCHER_NO',    type:'output',  	width:'127px',  style:'text-align:left'},
            {caption: ["상태"], 		ref: 'INVOICE_STATUS_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["지급방법(자금)"], 		ref: 'WITHDRAW_TYPE',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonWithdrawType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["어음만기일"],       ref: 'BILL_DUE_DATE', 		type:'datepicker',  	width:'86px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["어음만기지급일"],       ref: 'BILL_DUE_PAY_DATE', 		type:'datepicker',  	width:'86px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["코드확정"],         ref: 'USE_YN',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["거래처 지급보류"],         ref: 'DEFER_YN',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["지급가능여부"],         ref: 'TR_ABLE_YN',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["지급불가사유"],         ref: 'TR_UNABLE_REASON',    type:'output',  	width:'200px',  style:'text-align:left'},
            {caption: ["증빙일자"],       ref: 'VOUCHER_RECEIPT_DATE', 		type:'datepicker',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["법인번호"],         ref: 'COMP_REGNO',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["사업자번호"],         ref: 'BIZ_REGNO',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["기업분류"], 		ref: 'COM_TYPE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonComType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["원천세"],         ref: 'WTAX_AMT',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["지방세"],         ref: 'WTAXSUBAMT',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["원천세제외금액"],         ref: 'WADJUST_CR_AMT',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["원천세계정"],         ref: 'WTAX_ACCOUNT_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["지방세계정"],         ref: 'SUB_WTAX_ACCOUNT_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["원천세거래처"],         ref: 'WTAX_CS_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["원천세총액"],         ref: 'TOTAL_WTAX_AMT',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["원천세type"],         ref: 'WITHHOLD_TAX_TYPE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["라인소스ID"],         ref: 'ITEM_SOURCE_ID',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["DOC_ID"],         ref: 'DOC_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["순번"],         ref: 'DOC_NUM',    type:'output',  	width:'49px',  style:'text-align:left', hidden: true},
            {caption: ["환율단위"],         ref: 'EXCHANGE_BASE_SCALE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["SEQ"],         ref: 'SEQ',    type:'output',  	width:'44px',  style:'text-align:left', hidden: true},
            {caption: ["상태"],         ref: 'LINE_STATUS',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["AP_ACC_NAME"],         ref: 'AP_ACC_NAME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["AP_ACC_CODE"],         ref: 'AP_ACC_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["AR_ACC_CODE"],         ref: 'AR_ACC_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["AR_ACC_NAME"],         ref: 'AR_ACC_NAME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["ACCOUNT_CODE"],         ref: 'ACCOUNT_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["ACCOUNT_NAME"],         ref: 'ACCOUNT_NAME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["환차익계정"],         ref: 'EXCHANGE_GAIN_ACCOUNT',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["환차익계정명"],         ref: 'EXCHANGE_GAIN_ACCOUNT_NAME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["환차손계정"],         ref: 'EXCHANGE_LOSS_ACCOUNT',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["환차손계정명"],         ref: 'EXCHANGE_LOSS_ACCOUNT_NAME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["은행코드"],         ref: 'BANK_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["계좌번호"],         ref: 'ACCOUNT_NUM',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["환율유형"],         ref: 'EXCHANGE_TYPE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["VOUCHER_TYPE"],         ref: 'VOUCHER_TYPE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["소스전표ID"],         ref: 'DOC_SOURCE_ID',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["소스건수"],         ref: 'SOURCE_RECORD_COUNT',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["부서명"],         ref: 'DEPT_NAME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["원가중심점코드"],         ref: 'COST_CENTER_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["원가중심점명"],         ref: 'COST_CENTER_NAME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["프로젝트코드"],         ref: 'PROJECT_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["프로젝트명"],         ref: 'PROJECT_NAME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["DEPOSIT_DEPT_CODE"],         ref: 'DEPOSIT_DEPT_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["DEPOSIT_COST_CENTER"],         ref: 'DEPOSIT_COST_CENTER',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["SITE_CODE"],         ref: 'SITE_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["FI_ORG_CODE"],         ref: 'FI_ORG_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["DOC_H_DOC_STATUS"],         ref: 'DOC_H_DOC_STATUS',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["TR_STATUS_CODE"],         ref: 'TR_STATUS_CODE',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["계좌검증PASS여부"],         ref: 'BANK_CHECK_BYPASS_YN',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["EXTRA_FIELD6"],         ref: 'EXTRA_FIELD6',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        gvwList = _SBGrid.create(SBGridProperties);
        gvwList.bind('valuechanged','fn_gvwListValueChanged');
        gvwList.bind('click', 'fn_gvwListClick');
        gvwList.bind('dblclick', 'fn_gvwListDblclick');
        gvwList.bind('afterrebuild','fn_gvwListAfterRebuild');
        gvwList.bind('afterrefresh','fn_gvwListAfterRebuild');
    }

    // 환율 체크
    const SetCurrencyRate = async function () {
        var nRow = gvwList.getRow();
        SBUxMethod.set("SRCH_CURRENCY_CODE", gvwList.getCellData(nRow, gvwList.getColRef("PAY_CURRENCY_CODE")));
        SBUxMethod.set("SRCH_TXN_DATE", gvwList.getCellData(nRow, gvwList.getColRef("PLANNED_PAY_DATE")));
        SBUxMethod.set("SRCH_DEPOSIT_ACCOUNT", gvwList.getCellData(nRow, gvwList.getColRef("ACCOUNT_CODE")));
        SBUxMethod.set("SRCH_PAY_ORIGINAL_AMOUNT", Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"))));

        let strtxn_group_code = gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("TXN_GROUP_CODE"))).substring(0, 1); // 1:입금, 2:출금
        let dsign = (strtxn_group_code == "1") ? -1 : 1;

        let YYYYMMDD = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE"))
        let CURRENCY_CODE = gfn_nvl(SBUxMethod.get("SRCH_CURRENCY_CODE"))
        let ACCOUNT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPOSIT_ACCOUNT"))

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMMDD : YYYYMMDD,
            V_P_CURRENCY_CODE : CURRENCY_CODE,
            V_P_ACCOUNT_CODE : ACCOUNT_CODE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/com/selectExchangeAvgRate.do", {
            getType				: 'json',
            workType			: 'Q2',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(data.cv_1.length > 0) {
                    var ht = data.cv_1[0];
                    SBUxMethod.set("SRCH_EXCHANGE_RATE", Number(gfn_nvl(ht["RATE"])));
                    SBUxMethod.set("SRCH_EXCHANGE_BASE_SCALE", Number(gfn_nvl(ht["BASE_SCALE"])));
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

        gvwList.setCellData(nRow, gvwList.getColRef("EXCHANGE_RATE"), SBUxMethod.get("SRCH_EXCHANGE_RATE"));
        gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV"),  Math.round(SBUxMethod.get("SRCH_PAY_ORIGINAL_AMOUNT") * SBUxMethod.get("SRCH_EXCHANGE_RATE") / SBUxMethod.get("SRCH_EXCHANGE_BASE_SCALE"), p_currUnit));
        gvwList.setCellData(nRow, gvwList.getColRef("PAY_EXCHANGE_PL_AMT"), (Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"))) - Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")))) * dsign);
    }

    // 환율 체크--채무기준 환율
    const SetCurrencyRateAp = async function () {
        var nRow = gvwList.getRow();

        SBUxMethod.set("SRCH_CURRENCY_CODE", gvwList.getCellData(nRow, gvwList.getColRef("CURRENCY_CODE")));
        SBUxMethod.set("SRCH_TXN_DATE", gvwList.getCellData(nRow, gvwList.getColRef("PLANNED_PAY_DATE")));
        SBUxMethod.set("SRCH_PAY_ORIGINAL_AMOUNT", Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT_AP"))));

        let strtxn_group_code = gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("TXN_GROUP_CODE"))).substring(0, 1);  // 1:입금, 2:출금

        gvwList.setCellData(nRow, gvwList.getColRef("EXCHANGE_RATE_AP"), Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_FUNCTIONAL_AMOUNT"))) / Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_ORIGINAL_AMOUNT"))) * Number(gvwList.getCellData(nRow, gvwList.getColRef("EXCHANGE_BASE_SCALE"))));
        gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP"), Math.round(SBUxMethod.get("SRCH_PAY_ORIGINAL_AMOUNT") * Number(gvwList.getCellData(nRow, gvwList.getColRef("EXCHANGE_RATE_AP"))) / Number(gvwList.getCellData(nRow, gvwList.getColRef("EXCHANGE_BASE_SCALE"))), p_currUnit));
    }

    const fn_gvwListClick = async function () {
        if(gvwList.getRow() == gvwList.getColRef("CHECK_YN") && gvwList.getFixedCellcheckboxChecked(0, 0)) {
            if (gfn_nvl(SBUxMethod.get("SRCH_DEPOSIT_NAME")) != "") {
                gvwList.setCellData(nRow, gvwList.getColRef("DEPOSIT_CODE"), gfn_nvl(SBUxMethod.get("SRCH_DEPOSIT_CODE")));
                gvwList.setCellData(nRow, gvwList.getColRef("DEPOSIT_NAME"), gfn_nvl(SBUxMethod.get("SRCH_DEPOSIT_NAME")));
                gvwList.setCellData(nRow, gvwList.getColRef("BANK_CODE"), gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE")));
                gvwList.setCellData(nRow, gvwList.getColRef("WITHDRAW_TYPE"), gfn_nvl(SBUxMethod.get("SRCH_WITHDRAW_TYPE")));
                gvwList.setCellData(nRow, gvwList.getColRef("ACCOUNT_NUM"), gfn_nvl(SBUxMethod.get("SRCH_ACCOUNT_NUM")));
                gvwList.setCellData(nRow, gvwList.getColRef("ACCOUNT_CODE"), gfn_nvl(SBUxMethod.get("SRCH_ACCOUNT_CODE")));
                gvwList.setCellData(nRow, gvwList.getColRef("ACCOUNT_NAME"), gfn_nvl(SBUxMethod.get("SRCH_ACCOUNT_NAME")));
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_CURRENCY_CODE"), gfn_nvl(SBUxMethod.get("SRCH_PAY_CURRENCY_CODE")));
            }
        }
    }

    const fn_gvwListValueChanged = async function () {
        var nRow = gvwList.getRow();

        if (gvwList.getRow() < 0)
            return;

        if (nRow == gvwList.getColRef("CHECK_YN")) {
            if (gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("CHECK_YN"))) == "Y") {
                if (gfn_nvl(SBUxMethod.get("SRCH_DEPOSIT_NAME")) != "") {
                    gvwList.setCellData(nRow, gvwList.getColRef("DEPOSIT_CODE"), gfn_nvl(SBUxMethod.get("SRCH_DEPOSIT_CODE")));
                    gvwList.setCellData(nRow, gvwList.getColRef("DEPOSIT_NAME"), gfn_nvl(SBUxMethod.get("SRCH_DEPOSIT_NAME")));
                    gvwList.setCellData(nRow, gvwList.getColRef("BANK_CODE"), gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE")));
                    gvwList.setCellData(nRow, gvwList.getColRef("WITHDRAW_TYPE"), gfn_nvl(SBUxMethod.get("SRCH_WITHDRAW_TYPE")));
                    gvwList.setCellData(nRow, gvwList.getColRef("ACCOUNT_NUM"), gfn_nvl(SBUxMethod.get("SRCH_ACCOUNT_NUM")));
                    gvwList.setCellData(nRow, gvwList.getColRef("ACCOUNT_CODE"), gfn_nvl(SBUxMethod.get("SRCH_ACCOUNT_CODE")));
                    gvwList.setCellData(nRow, gvwList.getColRef("ACCOUNT_NAME"), gfn_nvl(SBUxMethod.get("SRCH_ACCOUNT_NAME")));
                    gvwList.setCellData(nRow, gvwList.getColRef("PAY_CURRENCY_CODE"), gfn_nvl(SBUxMethod.get("SRCH_PAY_CURRENCY_CODE")));

                    if (gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("PAY_CURRENCY_CODE"))) != gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("CURRENCY_CODE")))) {
                        gfn_comAlert("E0000", "채무통화와 지급통화가 다릅니다. 확인후 진행하십시요");
                    }
                }
            }
        }

        let strtxn_group_code = "";
        let dsign = 1;
        SBUxMethod.set("SRCH_EXCHANGE_BASE_SCALE", gvwList.getCellData(nRow, gvwList.getColRef("EXCHANGE_BASE_SCALE")));

        if (nRow == gvwList.getColRef("PLANNED_PAY_DATE") || nRow == gvwList.getColRef("CURRENCY_CODE") || nRow == gvwList.getColRef("PAY_ORIGINAL_AMOUNT")
            || nRow == gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV") || nRow == gvwList.getColRef("EXCHANGE_RATE")) {
            strtxn_group_code = gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("TXN_GROUP_CODE"))).substring(0, 1); // 1:입금, 2:출금
            dsign = (strtxn_group_code == "1") ? -1 : 1;
        }

        if (nRow == gvwList.getColRef("PLANNED_PAY_DATE") || nRow == gvwList.getColRef("PAY_CURRENCY_CODE")) {
            if (gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("PAY_CURRENCY_CODE"))) == gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("CURRENCY_CODE")))) {
                SetCurrencyRate();  //지급통화기준 지급일 환율
            } else {
                SetCurrencyRate(); //지급통화기준 지급일 환율
                SetCurrencyRateAp(); //채무통화기준 지급일 환율
            }
        }

        if (nRow == gvwList.getColRef("PAY_ORIGINAL_AMOUNT_AP")) {
            if (gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("PAY_CURRENCY_CODE"))) == gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("CURRENCY_CODE")))) {
                if (gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT_AP")) == gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_ORIGINAL_AMOUNT"))) {
                    gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP"), gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_FUNCTIONAL_AMOUNT")));
                    gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"), gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_FUNCTIONAL_AMOUNT")));
                } else {
                    gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP"), Math.round(Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT_AP"))) * Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_FUNCTIONAL_AMOUNT"))) / Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_ORIGINAL_AMOUNT"))), p_currUnit));
                    gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"), Math.round(Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT_AP"))) * Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_FUNCTIONAL_AMOUNT"))) / Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_ORIGINAL_AMOUNT"))), p_currUnit));
                }

                if (Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT_AP"))) > Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_ORIGINAL_AMOUNT")))) {
                    gfn_comAlert("E0000", "잔액을 초과하여 지급할 수 없습니다.");
                    var prevCellData = gvwList.getPrevCellDataInfo();
                    gvwList.setCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT_AP"), prevCellData.data);
                }
            }
        }

        if (nRow == gvwList.getColRef("PAY_ORIGINAL_AMOUNT")) {
            if (gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("PAY_CURRENCY_CODE"))) == gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("CURRENCY_CODE")))) {
                if (gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT")) == gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_ORIGINAL_AMOUNT"))) {
                    gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP"), gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_FUNCTIONAL_AMOUNT")));
                    gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"), gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_FUNCTIONAL_AMOUNT")));
                } else {
                    gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"), Math.round(Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"))) * Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_FUNCTIONAL_AMOUNT"))) / Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_ORIGINAL_AMOUNT"))), p_currUnit));
                    gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUN_AP"), Math.round(Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"))) * Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_FUNCTIONAL_AMOUNT"))) / Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_ORIGINAL_AMOUNT"))), p_currUnit));
                }
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV"), Math.round(Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"))) * Number(gvwList.getCellData(nRow, gvwList.getColRef("EXCHANGE_RATE"))) / SBUxMethod.get("SRCH_EXCHANGE_BASE_SCALE"), p_currUnit));
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT_AP"), Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"))));
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_EXCHANGE_PL_AMT"), (Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"))) - Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")))) * dsign);

                if (Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"))) > Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_ORIGINAL_AMOUNT")))) {
                    gfn_comAlert("E0000", "잔액을 초과하여 지급할 수 없습니다.");
                    var prevCellData = gvwList.getPrevCellDataInfo();
                    gvwList.setCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"), prevCellData.data);
                }
            } else {
                if (gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT_AP")) == gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_ORIGINAL_AMOUNT"))) {
                    gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP"), gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_FUNCTIONAL_AMOUNT")));
                } else {
                    gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUN_AP"), Math.round(Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_FUNCTIONAL_AMOUNT"))) * Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_FUNCTIONAL_AMOUNT"))) / Number(gvwList.getCellData(nRow, gvwList.getColRef("REMAIN_ORIGINAL_AMOUNT"))), SessionInfo.CurrUnit));
                }
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV"), Math.round(Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"))) * Number(gvwList.getCellData(nRow, gvwList.getColRef("EXCHANGE_RATE"))) / SBUxMethod.get("SRCH_EXCHANGE_BASE_SCALE"), p_currUnit));
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_EXCHANGE_PL_AMT"), (Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP"))) - Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")))) * dsign);
            }
        }

        if (nRow == gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")) {
            if (gvwList.getCellData(nRow, gvwList.getColRef("PAY_CURRENCY_CODE")) == gvwList.getCellData(nRow, gvwList.getColRef("CURRENCY_CODE"))) {
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_EXCHANGE_PL_AMT"), (Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"))) - Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")))) * dsign);
            } else {
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_EXCHANGE_PL_AMT"), (Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP"))) - Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")))) * dsign);
            }
        }

        if (nRow == gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP")) {
            if (gvwList.getCellData(nRow, gvwList.getColRef("PAY_CURRENCY_CODE")) == gvwList.getCellData(nRow, gvwList.getColRef("CURRENCY_CODE"))) {
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_EXCHANGE_PL_AMT"), (Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"))) - Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")))) * dsign);
            } else {
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_EXCHANGE_PL_AMT"), (Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP"))) - Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")))) * dsign);
            }
        }

        if (Row == gvwList.getColRef("EXCHANGE_RATE")) {
            if (gvwList.getCellData(nRow, gvwList.getColRef("PAY_CURRENCY_CODE")) == gvwList.getCellData(nRow, gvwList.getColRef("CURRENCY_CODE"))) {
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV"), Math.round(Number(gvwList.getCellData(nRow, gvwList.getColRef("EXCHANGE_RATE"))) * Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"))) / SBUxMethod.get("SRCH_EXCHANGE_BASE_SCALE"), p_currUnit));
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_EXCHANGE_PL_AMT"), (Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"))) - Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")))) * dsign);
            } else {
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV"), Math.round(Number(gvwList.getCellData(nRow, gvwList.getColRef("EXCHANGE_RATE"))) * Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"))) / SBUxMethod.get("SRCH_EXCHANGE_BASE_SCALE"), p_currUnit));
                gvwList.setCellData(nRow, gvwList.getColRef("PAY_EXCHANGE_PL_AMT"), (Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP"))) - Number(gvwList.getCellData(nRow, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")))) * dsign);
            }
        }
    }

    const fn_gvwListDblclick = async function () {
        var nRow = gvwList.getRow();
        var nCol = gvwList.getCol();

        if (nRow < 0)
            return;

        if(nCol == gvwList.getColRef("DOC_SOURCE_NAME")) {
            var param = {
                WORK_TYPE : "VIEW",
                DOC_ID : gvwList.getCellData(nRow, gvwList.getColRef("DOC_SOURCE_ID")),
                target : "MA_A20_030_020_150"
            };

            let json = JSON.stringify(param);
            window.parent.cfn_openTabSearch(json);
        }
    }

    const fn_gvwListAfterRebuild = async function() {
        let gvwListData = gvwList.getGridDataAll();

        for(var i = 0; i < gvwListData.length; i++) {
            if(gfn_nvl(gvwList.getCellData((i+1), gvwList.getColRef("TR_ABLE_YN"))) == "N")
                gvwList.setRowStyle((i+1), 'data', 'background', '#FFB6C1');
        }
    }

    const fn_findCsCode = function(flag) {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_CS_NAME_"+flag));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var replaceText2 	= "_BIZ_REGNO_";
        var strWhereClause 	= "AND a.CS_CODE LIKE '%" + replaceText0 + "%' AND a.CS_NAME LIKE '%" + replaceText1 + "%' AND a.BIZ_REGNO LIKE '%"+ replaceText2 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM004'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드"  , 	"거래처명",  "사엄자번호" ]
            ,searchInputFields		: ["CS_CODE"   , 	"CS_NAME",  "BIZ_REGNO"]
            ,searchInputValues		: [""          , 	searchText, ""         ]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호" , "대표자"     ,"업태"          ,"종목"      ,"주소"    ,"전화"  ,"팩스"]
            ,tableColumnNames		: ["CS_CODE" , "CS_NAME", "BIZ_REGNO", "CHIEF_NAME","BIZ_CATEGORY" ,"BIZ_ITEMS","ADDRESS","TEL"   ,"FAX"]
            ,tableColumnWidths		: ["100px"    , "130px" , "100px"    , "120px"     ,"120px"        ,"100px"    ,"200px"  ,"100px" ,"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_CS_NAME_'+flag, data.CS_NAME);
                SBUxMethod.set('SRCH_CS_CODE_'+flag, data.CS_CODE);
            },
        });
    }

    const fn_findPayCurrencyCode = function() {
        var searchCode 		= gfnma_nvl(SBUxMethod.get("SRCH_PAY_CURRENCY_CODE"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("SRCH_PAY_CURRENCY_NAME"));
        var replaceText0 	= "_CURRENCY_CODE_";
        var replaceText1 	= "_CURRENCY_NAME_";
        var strWhereClause 	= "AND CURRENCY_CODE LIKE '%" + replaceText0 + "%' AND CURRENCY_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '통화 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CURRENCY_USE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "코드명"]
            ,searchInputFields		: ["CURRENCY_CODE", "CURRENCY_NAME"]
            ,searchInputValues		: [searchCode, searchName]
            ,height					: '400px'
            ,tableHeader			: ["통화코드", "통화명", "비고"]
            ,tableColumnNames		: ["CURRENCY_CODE" , "CURRENCY_NAME", "DESCIPTION"]
            ,tableColumnWidths		: ["60px"    , "100px" , "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_PAY_CURRENCY_NAME', data.CURRENCY_NAME);
                SBUxMethod.set('SRCH_PAY_CURRENCY_CODE', data.CURRENCY_CODE);
            },
        });
    }

    const fn_findBankCode = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("BANK_NAME_P"));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_NAME_";
        var strWhereClause 	= "AND CODE LIKE '%" + replaceText0 + "%' AND NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '은행코드 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_BANK_CODE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "명칭"]
            ,searchInputFields		: ["CODE", "NAME"]
            ,searchInputValues		: ["", searchText]
            ,height					: '400px'
            ,tableHeader			: ["코드", "명칭"]
            ,tableColumnNames		: ["CODE" , "NAME"]
            ,tableColumnWidths		: ["100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('BANK_NAME_P', data.NAME);
                SBUxMethod.set('BANK_CODE_P', data.CODE);
            },
        });
    }

    const fn_findDepositCode = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("DEPOSIT_NAME_P"));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_NAME_";
        var strWhereClause 	= "AND CODE LIKE '%" + replaceText0 + "%' AND NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '은행계좌 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_BANK_ACCOUNT'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "명칭"]
            ,searchInputFields		: ["CODE", "NAME"]
            ,searchInputValues		: ["", searchText]
            ,height					: '400px'
            ,tableHeader			: ["코드", "명칭", "은행명", "통화"]
            ,tableColumnNames		: ["CODE" , "NAME", "BANK_NAME", "CURRENCY_CODE"]
            ,tableColumnWidths		: ["100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('DEPOSIT_NAME_P', data.NAME);
                SBUxMethod.set('DEPOSIT_CODE_P', data.CODE);
            },
        });
    }

    const fn_multiCsSelect = function() {
        SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){
                strCsCodeList = "";
                data.forEach((item, index) => {
                    strCsCodeList += item + "|";
                });

                if (strCsCodeList.length > 0)
                    strCsCodeList = strCsCodeList.substring(0, strCsCodeList.length - 1);

                if (strCsCodeList.replaceAll("|", "") == "")
                    SBUxMethod.set("SRCH_MULTI_CS_YN", "N");
                else
                    SBUxMethod.set("SRCH_MULTI_CS_YN", "Y");
            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }

    const fn_multiSelect = function() {
        SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){
                strCode2List = "";
                data.forEach((item, index) => {
                    strCode2List += item + "|";
                });

                if (strCode2List.length > 0)
                    strCode2List = strCode2List.substring(0, strCode2List.length - 1);

                if (strCode2List.replaceAll("|", "") == "")
                    SBUxMethod.set("SRCH_MULTI_YN", "N");
                else
                    SBUxMethod.set("SRCH_MULTI_YN", "Y");
            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }

    const fn_multiMSelect = function() {
        SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){
                strCode1List = "";
                data.forEach((item, index) => {
                    strCode1List += item + "|";
                });

                if (strCode1List.length > 0)
                    strCode1List = strCode1List.substring(0, strCode1List.length - 1);

                if (strCode1List.replaceAll("|", "") == "")
                    SBUxMethod.set("SRCH_MULTI_M_YN", "N");
                else
                    SBUxMethod.set("SRCH_MULTI_M_YN", "Y");
            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }

    const fn_multiASelect = function() {
        SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){
                strAccountCodeList = "";
                data.forEach((item, index) => {
                    strAccountCodeList += item + "|";
                });

                if (strAccountCodeList.length > 0)
                    strAccountCodeList = strAccountCodeList.substring(0, strAccountCodeList.length - 1);

                if (strAccountCodeList.replaceAll("|", "") == "")
                    SBUxMethod.set("SRCH_MULTI_A_YN", "N");
                else
                    SBUxMethod.set("SRCH_MULTI_A_YN", "Y");
            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }

    const fn_onload = async function (parentParameter) {
        SBUxMethod.set("SRCH_GATE", "OR");
        SBUxMethod.set("SRCH_MULTI_CS_YN", "N");
        SBUxMethod.set("SRCH_MULTI_M_YN", "N");
        SBUxMethod.set("SRCH_MULTI_A_YN", "N");
        SBUxMethod.set("SRCH_BEFORE_INCLUDE_YN", "N");
        if (parentParameter){
            bPopUpFlag = true;

            if (parentParameter.hasOwnProperty("FI_ORG_CODE")) {
                gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', gfn_nvl(parentParameter["FI_ORG_CODE"]));
            }

            if (parentParameter.hasOwnProperty("TREASURY_BATCH_NO")) {
                SBUxMethod.set("SRCH_TREASURY_BATCH_NO", gfn_nvl(parentParameter["TREASURY_BATCH_NO"]));
            }

/*            if (gfn_nvl(parentParameter["APRINT"]) == "Y")
                gvwList.ContextMenuStyle.EnableExportData = true;
            else
                gvwList.ContextMenuStyle.EnableExportData = false;*/

            SBUxMethod.set("SRCH_FROM_DATE", gfn_dateToYmd(new Date())); // TODO GetServerDateTime()
        } else {
            bPopUpFlag = false;

            SBUxMethod.set("SRCH_FROM_DATE", gfn_dateToYmd(new Date())); // TODO GetServerDateTime()
            gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);
        }

        if (!bPopUpFlag) {
            $("#panBottom").hide();
            $("#btnQuery").hide();
            $("#btnPayPlan").show();
        } else {
            $("#btnQuery").show();
            $("#btnPayPlan").hide();
        }
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        let initObject = localStorage.getItem("callMain");
        await fn_initSBSelect();
        fn_createGvwListGrid();

        if(!gfn_isEmpty(initObject)){
            initObject = JSON.parse(initObject);
            localStorage.removeItem("callMain");

            await fn_onload(initObject);
        } else {
            await fn_onload();
        }
    });

    window.addEventListener('message', async function(event){
        let obj = event.data;
        if(!gfn_isEmpty(obj)){
            await fn_onload(obj);
        } else {
            await fn_onload();
        }
    });

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_query = async function () {
        await fn_search();
    }

    const fn_search = async function () {
        if (strWorkType == "Q") {
            if (!SBUxMethod.validateRequired({group_id:'panHeader'}) || !validateRequired("panHeader")) {
                return false;
            }
        }

        let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE'));
        let CURRENCY_CODE = gfn_nvl(SBUxMethod.get("SRCH_PAY_CURRENCY_CODE"));
        let FROM_DATE = gfn_nvl(SBUxMethod.get("SRCH_FROM_DATE"));
        let F_TXN_DATE = gfn_nvl(SBUxMethod.get("SRCH_F_TXN_DATE"));
        let T_TXN_DATE = gfn_nvl(SBUxMethod.get("SRCH_T_TXN_DATE"));
        let POSTING_DATE = gfn_nvl(SBUxMethod.get("SRCH_POSTING_DATE"));
        let GATE = gfn_nvl(SBUxMethod.get("SRCH_GATE"));
        let PAY_TERM_CODE = gfn_nvl(SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN) == "N" ? gfn_nvl(gfnma_multiSelectGet('#SRCH_AP_PAY_TERM')) : "";
        let PAY_METHOD = gfn_nvl(SBUxMethod.get("SRCH_MULTI_M_YN").SRCH_MULTI_M_YN) == "N" ? gfn_nvl(gfnma_multiSelectGet('#SRCH_PAY_METHOD')) : "";
        let PAY_METHOD_D = gfn_nvl(SBUxMethod.get("SRCH_MULTI_M_YN").SRCH_MULTI_M_YN) == "N" ? "" : strCode1List;
        let PAY_TERM_CODE_D = gfn_nvl(SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN) == "N" ? "" : strCode2List;
        let OTHER_CURRENCY_YN = gfn_nvl(SBUxMethod.get("SRCH_OTHER_CURRENCY_YN").SRCH_OTHER_CURRENCY_YN);
        let CS_CODE_FR = gfn_nvl(SBUxMethod.get("SRCH_CS_CODE_FR"));
        let CS_CODE_TO = gfn_nvl(SBUxMethod.get("SRCH_CS_CODE_TO"));
        let CS_CODE_D = gfn_nvl(SBUxMethod.get("SRCH_MULTI_CS_YN").SRCH_MULTI_CS_YN) == "N" ? strCsCodeList : "";
        let DOC_NAME_FR = gfn_nvl(SBUxMethod.get("SRCH_DOC_NAME_FR"));
        let DOC_NAME_TO = gfn_nvl(SBUxMethod.get("SRCH_DOC_NAME_TO"));
        let DOC_NAME = gfn_nvl(SBUxMethod.get("SRCH_MULTI_A_YN").SRCH_MULTI_A_YN) == "N" ? gfn_nvl(SBUxMethod.get("SRCH_ACCOUNT_CODE")) : strAccountCodeList;
        let BEFORE_INCLUDE_YN = gfn_nvl(SBUxMethod.get("SRCH_BEFORE_INCLUDE_YN").SRCH_BEFORE_INCLUDE_YN);

        // 비즈니스 로직 정보
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_FI_ORG_CODE : FI_ORG_CODE,
            V_P_CURRENCY_CODE : CURRENCY_CODE,
            V_P_FROM_DATE : FROM_DATE,
            V_P_TO_DATE : '',
            V_P_F_TXN_DATE : F_TXN_DATE,
            V_P_T_TXN_DATE : T_TXN_DATE,
            V_P_POSTING_DATE : POSTING_DATE,
            V_P_GATE : GATE,
            V_P_PAY_TERM_CODE : PAY_TERM_CODE,
            V_P_PAY_METHOD : PAY_METHOD,
            V_P_PAY_METHOD_D : PAY_METHOD_D,
            V_P_PAY_TERM_CODE_D : PAY_TERM_CODE_D,
            V_P_OTHER_CURRENCY_YN : OTHER_CURRENCY_YN,
            V_P_CS_CODE_FR : CS_CODE_FR,
            V_P_CS_CODE_TO : CS_CODE_TO,
            V_P_CS_CODE_D : CS_CODE_D,
            V_P_DOC_NAME_FR : DOC_NAME_FR,
            V_P_DOC_NAME_TO : DOC_NAME_TO,
            V_P_DOC_NAME : DOC_NAME,
            V_P_BEFORE_INCLUDE_YN : BEFORE_INCLUDE_YN,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/pay/selectTrp1050List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonPaymentDetailList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHECK_YN : item.CHECK_YN,
                        PLAN_SOURCE : item.PLAN_SOURCE,
                        PAY_DATE_P : item.PAY_DATE_P,
                        PLANNED_PAY_DATE : item.PLANNED_PAY_DATE,
                        CS_CODE : item.CS_CODE,
                        CS_NAME : item.CS_NAME,
                        DOC_TYPE : item.DOC_TYPE,
                        SEQ : item.SEQ,
                        GROUP_ID : item.GROUP_ID,
                        LINE_STATUS : item.LINE_STATUS,
                        TXN_GROUP_CODE : item.TXN_GROUP_CODE,
                        DOC_DATE : item.DOC_DATE,
                        POSTING_DATE : item.POSTING_DATE,
                        DOC_BATCH_NO : item.DOC_BATCH_NO,
                        DOC_NUM : item.DOC_NUM,
                        DOC_ID : item.DOC_ID,
                        ITEM_SOURCE_TYPE : item.ITEM_SOURCE_TYPE,
                        DOC_SOURCE_ID : item.DOC_SOURCE_ID,
                        DOC_SOURCE_NAME : item.DOC_SOURCE_NAME,
                        ITEM_SOURCE_ID : item.ITEM_SOURCE_ID,
                        TXN_DATE : item.TXN_DATE,
                        PAYER_BANK_CODE : item.PAYER_BANK_CODE,
                        PAYER_BANK_ACCOUNT : item.PAYER_BANK_ACCOUNT,
                        PAYER_BANK_ACCOUNT_OWNER : item.PAYER_BANK_ACCOUNT_OWNER,
                        CURRENCY_CODE : item.CURRENCY_CODE,
                        PAY_CURRENCY_CODE : item.PAY_CURRENCY_CODE,
                        EXCHANGE_RATE_ORIG : item.EXCHANGE_RATE_ORIG,
                        EXCHANGE_BASE_SCALE : item.EXCHANGE_BASE_SCALE,
                        EXCHANGE_RATE : item.EXCHANGE_RATE,
                        EXCHANGE_RATE_AP : item.EXCHANGE_RATE_AP,
                        REMAIN_ORIGINAL_AMOUNT : item.REMAIN_ORIGINAL_AMOUNT,
                        REMAIN_FUNCTIONAL_AMOUNT : item.REMAIN_FUNCTIONAL_AMOUNT,
                        REMAIN_FUNCTIONAL_AMT_CONV : item.REMAIN_FUNCTIONAL_AMT_CONV,
                        PAY_ORIGINAL_AMOUNT : item.PAY_ORIGINAL_AMOUNT,
                        PAY_FUNCTIONAL_AMOUNT : item.PAY_FUNCTIONAL_AMOUNT,
                        PAY_ORIGINAL_AMOUNT_AP : item.PAY_ORIGINAL_AMOUNT_AP,
                        PAY_FUNCTIONAL_AMOUNT_AP : item.PAY_FUNCTIONAL_AMOUNT_AP,
                        PAY_FUNCTIONAL_AMT_CONV : item.PAY_FUNCTIONAL_AMT_CONV,
                        PAY_EXCHANGE_PL_AMT : item.PAY_EXCHANGE_PL_AMT,
                        ORIGINAL_AMOUNT : item.ORIGINAL_AMOUNT,
                        FUNCTIONAL_AMOUNT : item.FUNCTIONAL_AMOUNT,
                        PAYEE_CODE : item.PAYEE_CODE,
                        VOUCHER_NO : item.VOUCHER_NO,
                        VOUCHER_TYPE : item.VOUCHER_TYPE,
                        INVOICE_STATUS_CODE : item.INVOICE_STATUS_CODE,
                        AP_PAY_TERM : item.AP_PAY_TERM,
                        CS_PAY_TERM : item.CS_PAY_TERM,
                        AP_PAY_METHOD : item.AP_PAY_METHOD,
                        DOC_DESC : item.DOC_DESC,
                        HOLD_FLAG : item.HOLD_FLAG,
                        HOLD_REASON : item.HOLD_REASON,
                        DEPT_CODE : item.DEPT_CODE,
                        DEPT_NAME : item.DEPT_NAME,
                        COST_CENTER_CODE : item.COST_CENTER_CODE,
                        COST_CENTER_NAME : item.COST_CENTER_NAME,
                        PROJECT_CODE : item.PROJECT_CODE,
                        PROJECT_NAME : item.PROJECT_NAME,
                        AP_ACC_CODE : item.AP_ACC_CODE,
                        AP_ACC_NAME : item.AP_ACC_NAME,
                        AR_ACC_CODE : item.AR_ACC_CODE,
                        AR_ACC_NAME : item.AR_ACC_NAME,
                        DEPOSIT_CODE : item.DEPOSIT_CODE,
                        DEPOSIT_NAME : item.DEPOSIT_NAME,
                        ACCOUNT_CODE : item.ACCOUNT_CODE,
                        ACCOUNT_NAME : item.ACCOUNT_NAME,
                        DEPOSIT_DEPT_CODE : item.DEPOSIT_DEPT_CODE,
                        DEPOSIT_COST_CENTER : item.DEPOSIT_COST_CENTER,
                        EXCHANGE_GAIN_ACCOUNT : item.EXCHANGE_GAIN_ACCOUNT,
                        EXCHANGE_GAIN_ACCOUNT_NAME : item.EXCHANGE_GAIN_ACCOUNT_NAME,
                        EXCHANGE_LOSS_ACCOUNT : item.EXCHANGE_LOSS_ACCOUNT,
                        EXCHANGE_LOSS_ACCOUNT_NAME : item.EXCHANGE_LOSS_ACCOUNT_NAME,
                        BANK_CODE : item.BANK_CODE,
                        BANK_CS_CODE : item.BANK_CS_CODE,
                        ACCOUNT_NUM : item.ACCOUNT_NUM,
                        EXCHANGE_TYPE : item.EXCHANGE_TYPE,
                        WITHDRAW_TYPE : item.WITHDRAW_TYPE,
                        FI_ORG_CODE : item.FI_ORG_CODE,
                        SITE_CODE : item.SITE_CODE,
                        SOURCE_RECORD_COUNT : item.SOURCE_RECORD_COUNT,
                        DOC_H_DOC_STATUS : item.DOC_H_DOC_STATUS,
                        TR_STATUS_CODE : item.TR_STATUS_CODE,
                        BILL_DUE_DATE : item.BILL_DUE_DATE,
                        BILL_DUE_DAY : item.BILL_DUE_DAY,
                        BILL_DUE_PAY_DATE : item.BILL_DUE_PAY_DATE,
                        USE_YN : item.USE_YN,
                        DEFER_YN : item.DEFER_YN,
                        BANK_CHECK_BYPASS_YN : item.BANK_CHECK_BYPASS_YN,
                        TR_ABLE_YN : item.TR_ABLE_YN,
                        TR_UNABLE_REASON : item.TR_UNABLE_REASON,
                        VOUCHER_RECEIPT_DATE : item.VOUCHER_RECEIPT_DATE,
                        COMP_REGNO : item.COMP_REGNO,
                        BIZ_REGNO : item.BIZ_REGNO,
                        COM_TYPE : item.COM_TYPE,
                        WADJUST_CR_AMT : item.WADJUST_CR_AMT,
                        TOTAL_WTAX_AMT : item.TOTAL_WTAX_AMT,
                        WTAX_AMT : item.WTAX_AMT,
                        WTAXSUBAMT : item.WTAXSUBAMT,
                        WTAX_ACCOUNT_CODE : item.WTAX_ACCOUNT_CODE,
                        SUB_WTAX_ACCOUNT_CODE : item.SUB_WTAX_ACCOUNT_CODE,
                        WTAX_CS_CODE : item.WTAX_CS_CODE,
                        WITHHOLD_TAX_TYPE : item.WITHHOLD_TAX_TYPE,
                        EXTRA_FIELD6 : item.EXTRA_FIELD6,
                        BASE_SCALE : item.BASE_SCALE,
                        WTAXSUBAMT_FUNC : item.WTAXSUBAMT_FUNC,
                        WTAX_AMT_FUNC : item.WTAX_AMT_FUNC,
                    }
                    jsonPaymentDetailList.push(msg);
                });

                gvwList.rebuild();

                if (jsonPaymentDetailList.length <= 0) {
                    SBUxMethod.set("TOT_PAY_FUNCTIONAL_AMOUNT", 0);
                    SBUxMethod.set("TOT_PAY_FUNCTIONAL_AMT_CONV", 0);
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

    const fn_sum = async function () {
        let dtot_pay_functional_amount = 0;
        let dtot_pay_functional_amt_conv = 0;

        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);
        gvwListCheckedList.forEach((item, index) => {
            dtot_pay_functional_amount += Number(gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"))));
            dtot_pay_functional_amt_conv += Number(gfn_nvl(gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV"))));
        });

        SBUxMethod.set("TOT_PAY_FUNCTIONAL_AMOUNT", dtot_pay_functional_amount);
        SBUxMethod.set("TOT_PAY_FUNCTIONAL_AMT_CONV", dtot_pay_functional_amt_conv);
    }

    const fn_applyAccount = async function () {
        let strdeposit_code = gfn_nvl(SBUxMethod.get("DEPOSIT_CODE_P"));
        let strdeposit_name = gfn_nvl(SBUxMethod.get("DEPOSIT_NAME_P"));
        let strbank_code = gfn_nvl(SBUxMethod.get("BANK_CODE_P"));
        let strbank_account_no = gfn_nvl(SBUxMethod.get("SRCH_BANK_ACCOUNT_NO_P"));
        let iCnt = 0;

        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);

        iCnt = gvwListCheckedList.length;

        if (iCnt == 0) {
            gfn_comAlert("E0000", "변경하고자 하는 대상을 선택 후 변경적용을 하십시오.");
        } else {
            gvwListCheckedList.forEach((item, index) => {
                gvwList.setCellData(item, "DEPOSIT_CODE", strdeposit_code);
                gvwList.setCellData(item, "DEPOSIT_NAME", strdeposit_name);
                gvwList.setCellData(item, "BANK_CODE", strbank_code);
                gvwList.setCellData(item, "ACCOUNT_NUM", strbank_account_no);
                gvwList.setCellData(item, "ACCOUNT_CODE", gfn_nvl(SBUxMethod.get("SRCH_ACCOUNT_CODE")));
            });
        }
    }

    const fn_payPlan = async function () {
        SBUxMethod.openProgress(gv_loadingOptions);

        strtr_batch_no = "";

        await fn_confirm();

        SBUxMethod.closeProgress(gv_loadingOptions);
    }

    const fn_groupCancel = async function () {
        if (gvwList.getRow() < 0)
            return;

        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);

        gvwListCheckedList.forEach((item, index) => {
            gvwList.setCellData(item, gvwList.getColRef("GROUP_ID"), Number(gvwList.getCellData(item, gvwList.getColRef("SEQ"))));
            gvwList.setCellData(item, gvwList.getColRef("CHECK_YN"), "N");
        })
    }

    const fn_group = async function () {
        if (gvwList.getRow() < 0)
            return;

        // 그룹 아이디 체크

        if (fn_groupError(""))
            return;

        //첫번쨰 선택된 그룹 아이디를 찾는다

        let igroup_id = 0;
        let strdeposit_code = "";
        let strdeposit_name = "";
        let strwithdraw_type = "";
        let straccount_num = "";
        let straccount_code = "";
        let straccount_name = "";
        let strpay_currency_code = "";
        let strcurrency_code = "";
        let strexchange_gain_account = "";
        let strexchange_gain_account_name = "";
        let strexchange_loss_account = "";
        let strexchange_loss_account_name = "";

        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);

        gvwListCheckedList.forEach((item, index) => {
            if (igroup_id == 0) {
                if (gvwList.getCellData(item, gvwList.getColRef("DEPOSIT_CODE")) == "") {
                    gfn_comAlert("E0000", "입출계좌를 선택해 주십시오.");
                    gvwList.setRow(item);
                    return false;
                }

                igroup_id = parseInt(gvwList.getCellData(item, gvwList.getColRef("GROUP_ID")));
                strdeposit_code = gvwList.getCellData(item, gvwList.getColRef("DEPOSIT_CODE"));
                strdeposit_name = gvwList.getCellData(item, gvwList.getColRef("DEPOSIT_NAME"));
                strwithdraw_type = gvwList.getCellData(item, gvwList.getColRef("WITHDRAW_TYPE"));
                straccount_num = gvwList.getCellData(item, gvwList.getColRef("ACCOUNT_NUM"));
                straccount_code = gvwList.getCellData(item, gvwList.getColRef("ACCOUNT_CODE"));
                straccount_name = gvwList.getCellData(item, gvwList.getColRef("ACCOUNT_NAME"));
                strpay_currency_code = gvwList.getCellData(item, gvwList.getColRef("PAY_CURRENCY_CODE"));
                strcurrency_code = gvwList.getCellData(item, gvwList.getColRef("CURRENCY_CODE"));
                strexchange_gain_account = gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_GAIN_ACCOUNT"));
                strexchange_gain_account_name = gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_GAIN_ACCOUNT_NAME"));
                strexchange_loss_account = gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_LOSS_ACCOUNT"));
                strexchange_loss_account_name = gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_LOSS_ACCOUNT_NAME"));
                return;
            }

            gvwList.getCellData(item, gvwList.getColRef("GROUP_ID"), igroup_id);
            gvwList.getCellData(item, gvwList.getColRef("DEPOSIT_CODE"), strdeposit_code);
            gvwList.getCellData(item, gvwList.getColRef("DEPOSIT_NAME"), strdeposit_name);
            gvwList.getCellData(item, gvwList.getColRef("WITHDRAW_TYPE"), strwithdraw_type);
            gvwList.getCellData(item, gvwList.getColRef("ACCOUNT_NUM"), straccount_num);
            gvwList.getCellData(item, gvwList.getColRef("ACCOUNT_CODE"), straccount_code);
            gvwList.getCellData(item, gvwList.getColRef("ACCOUNT_NAME"), straccount_name);
            gvwList.getCellData(item, gvwList.getColRef("PAY_CURRENCY_CODE"), strpay_currency_code);
            gvwList.getCellData(item, gvwList.getColRef("CURRENCY_CODE"), strcurrency_code);
            gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_GAIN_ACCOUNT"), strexchange_gain_account);
            gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_GAIN_ACCOUNT_NAME"), strexchange_gain_account_name);
            gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_LOSS_ACCOUNT"), strexchange_loss_account);
            gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_LOSS_ACCOUNT_NAME"), strexchange_loss_account_name);
        })
    }

    const fn_splitCancel = async function () {
        var nRow = gvwList.getRow();

        if (gfn_nvl(gvwList.getCellData(nRow, gvwList.getColRef("LINE_STATUS"))) == "C") {
            if (gfn_comConfirm("Q0000", "정말 삭제하시겠습니까? 삭제하시려면 예를 클릭하세요.")) {
                gvwList.deleteRow(nRow);
            }
        }
    }

    const fn_split = async function () {
        gvwList.addRow(true, null, true);
        var nRow = gvwList.getRow(); //현재 포커스를 가져온다.
        gvwList.setCellData(nRow, gvwList.getColRef("SEQ"), nRow);
        gvwList.setCellData(nRow, gvwList.getColRef("CHECK_YN"), "Y");


        //첫번쨰 행이 아닐시 윗행의 데이터를 복사해온다.
        if (nRow > 1) {
            gvwList.setCellData(nRow, gvwList.getColRef("GROUP_ID"), Number(gvwList.getCellData(nRow, gvwList.getColRef("SEQ"))));

            gvwList.setCellData(nRow, gvwList.getColRef("LINE_STATUS"), "C");
            gvwList.setCellData(nRow, gvwList.getColRef("PLAN_SOURCE"), gvwList.getCellData((nRow - 1), gvwList.getColRef("PLAN_SOURCE")));
            gvwList.setCellData(nRow, gvwList.getColRef("DOC_ID"), gvwList.getCellData((nRow - 1), gvwList.getColRef("DOC_ID")));
            gvwList.setCellData(nRow, gvwList.getColRef("DOC_BATCH_NO"), gvwList.getCellData((nRow - 1), gvwList.getColRef("DOC_BATCH_NO")));
            gvwList.setCellData(nRow, gvwList.getColRef("DOC_NUM"), gvwList.getCellData((nRow - 1), gvwList.getColRef("DOC_NUM")));
            gvwList.setCellData(nRow, gvwList.getColRef("TXN_GROUP_CODE"), gvwList.getCellData((nRow - 1), gvwList.getColRef("TXN_GROUP_CODE")));
            gvwList.setCellData(nRow, gvwList.getColRef("PLANNED_PAY_DATE"), gvwList.getCellData((nRow - 1), gvwList.getColRef("PLANNED_PAY_DATE")));
            gvwList.setCellData(nRow, gvwList.getColRef("DOC_DATE"), gvwList.getCellData((nRow - 1), gvwList.getColRef("DOC_DATE")));
            gvwList.setCellData(nRow, gvwList.getColRef("PAYER_ID"), gvwList.getCellData((nRow - 1), gvwList.getColRef("PAYER_ID")));
            gvwList.setCellData(nRow, gvwList.getColRef("PAYER_NAME"), gvwList.getCellData((nRow - 1), gvwList.getColRef("PAYER_NAME")));
            gvwList.setCellData(nRow, gvwList.getColRef("DEPOSIT_CODE"), gvwList.getCellData((nRow - 1), gvwList.getColRef("DEPOSIT_CODE")));
            gvwList.setCellData(nRow, gvwList.getColRef("PAY_CURRENCY_CODE"), gvwList.getCellData((nRow - 1), gvwList.getColRef("PAY_CURRENCY_CODE")));
            gvwList.setCellData(nRow, gvwList.getColRef("CURRENCY_CODE"), gvwList.getCellData((nRow - 1), gvwList.getColRef("CURRENCY_CODE")));
            gvwList.setCellData(nRow, gvwList.getColRef("EXCHANGE_RATE"), Number(gvwList.getCellData((nRow - 1), gvwList.getColRef("EXCHANGE_RATE"))));
            gvwList.setCellData(nRow, gvwList.getColRef("EXCHANGE_RATE_AP"), Number(gvwList.getCellData((nRow - 1), gvwList.getColRef("EXCHANGE_RATE_AP"))));
            gvwList.setCellData(nRow, gvwList.getColRef("ORIGINAL_AMOUNT"), Number(gvwList.getCellData((nRow - 1), gvwList.getColRef("ORIGINAL_AMOUNT"))));
            gvwList.setCellData(nRow, gvwList.getColRef("FUNCTIONAL_AMOUNT"), Number(gvwList.getCellData((nRow - 1), gvwList.getColRef("FUNCTIONAL_AMOUNT"))));
            gvwList.setCellData(nRow, gvwList.getColRef("EXCHANGE_RATE_AP"), Number(gvwList.getCellData((nRow - 1), gvwList.getColRef("EXCHANGE_RATE_AP"))));
            gvwList.setCellData(nRow, gvwList.getColRef("ORIGINAL_AMOUNT_AP"), Number(gvwList.getCellData((nRow - 1), gvwList.getColRef("ORIGINAL_AMOUNT_AP"))));
            gvwList.setCellData(nRow, gvwList.getColRef("FUNCTIONAL_AMOUNT_AP"), Number(gvwList.getCellData((nRow - 1), gvwList.getColRef("FUNCTIONAL_AMOUNT_AP"))));

            gvwList.setCellData(nRow, gvwList.getColRef("PAYEE_CODE"), gvwList.getCellData((nRow - 1), gvwList.getColRef("PAYEE_CODE")));
            gvwList.setCellData(nRow, gvwList.getColRef("PAY_METHOD"), gvwList.getCellData((nRow - 1), gvwList.getColRef("PAY_METHOD")));
            gvwList.setCellData(nRow, gvwList.getColRef("VOUCHER_NO"), gvwList.getCellData((nRow - 1), gvwList.getColRef("VOUCHER_NO")));
            gvwList.setCellData(nRow, gvwList.getColRef("INVOICE_STATUS_CODE"), gvwList.getCellData((nRow - 1), gvwList.getColRef("INVOICE_STATUS_CODE")));
            gvwList.setCellData(nRow, gvwList.getColRef("PAYER_BANK_CODE"), gvwList.getCellData((nRow - 1), gvwList.getColRef("PAYER_BANK_CODE")));
            gvwList.setCellData(nRow, gvwList.getColRef("PAYER_BANK_ACCOUNT"), gvwList.getCellData((nRow - 1), gvwList.getColRef("PAYER_BANK_ACCOUNT")));
            gvwList.setCellData(nRow, gvwList.getColRef("PAYER_BANK_ACCOUNT_OWNER"), gvwList.getCellData((nRow - 1), gvwList.getColRef("PAYER_BANK_ACCOUNT_OWNER")));
            gvwList.setCellData(nRow, gvwList.getColRef("DOC_DESC"), gvwList.getCellData((nRow - 1), gvwList.getColRef("DOC_DESC")));

            gvwList.setRow(nRow);
            gvwList.setCol(gvwList.getColRef("GROUP_ID"));
            gvwList.editCell();
        } else {
            gvwList.setCellData(nRow, gvwList.getColRef("GROUP_ID"), Number(gvwList.getCellData(nRow, gvwList.getColRef("SEQ"))));

            gvwList.setCellData(nRow, gvwList.getColRef("LINE_STATUS"), "C");
            gvwList.setCellData(nRow, gvwList.getColRef("DOC_ID"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("DOC_BATCH_NO"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("DOC_NUM"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("TXN_GROUP_CODE"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("PLANNED_PAY_DATE"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("DOC_DATE"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("CS_CODE"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("CS_NAME"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("CURRENCY_CODE"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("PAY_CURRENCY_CODE"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("DEPOSIT_CODE"), gfn_nvl(SBUxMethod.get("SRCH_DEPOSIT_CODE")));

            gvwList.setCellData(nRow, gvwList.getColRef("EXCHANGE_RATE"), 0);
            gvwList.setCellData(nRow, gvwList.getColRef("EXCHANGE_RATE_AP"), 0);
            gvwList.setCellData(nRow, gvwList.getColRef("ORIGINAL_AMOUNT"), 0);
            gvwList.setCellData(nRow, gvwList.getColRef("FUNCTIONAL_AMOUNT"), 0);
            gvwList.setCellData(nRow, gvwList.getColRef("ORIGINAL_AMOUNT_AP"), 0);
            gvwList.setCellData(nRow, gvwList.getColRef("FUNCTIONAL_AMOUNT_AP"), 0);

            gvwList.setCellData(nRow, gvwList.getColRef("PAYEE_CODE"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("PAY_METHOD"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("VOUCHER_NO"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("INVOICE_STATUS_CODE"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("PAYER_BANK_CODE"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("PAYER_BANK_ACCOUNT"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("PAYER_BANK_ACCOUNT_OWNER"), "");
            gvwList.setCellData(nRow, gvwList.getColRef("DOC_DESC"), "");

            gvwList.setRow(nRow);
            gvwList.setCol(gvwList.getColRef("GROUP_ID"));
            gvwList.editCell();
        }
    }

    const fn_groupError = async function (strwork_type) {
        let bgroup_id_error = false;
        let bfirst = true;

        for (var i = 0; i < jsonPaymentDetailList.length; i++){
            if (gfn_nvl(gvwList.getCellData((i+1), gvwList.getColRef("CHECK_YN"))) == "N")
                continue;

            if (bfirst) {
                if (gfn_nvl(gvwList.getCellData((i+1), gvwList.getColRef("DEPOSIT_CODE"))) == "") {
                    gfn_comAlert("E0000", "입출계좌를 입력해 주십시오.");
                    bfirst = false;
                    bgroup_id_error = true;
                    break;
                }
                bfirst = false;
            }

            let igroup_id = 0;

            if (strwork_type == "OK")
                igroup_id = parseInt(gvwList.getCellData((i+1), gvwList.getColRef("GROUP_ID")));

            let strcs_code = gvwList.getCellData((i+1), gvwList.getColRef("CS_CODE"));
            let strpayer_bank_account = gvwList.getCellData((i+1), gvwList.getColRef("PAYER_BANK_ACCOUNT"));
            let strpay_method = gvwList.getCellData((i+1), gvwList.getColRef("AP_PAY_METHOD"));
            let strbill_due_date = gvwList.getCellData((i+1), gvwList.getColRef("BILL_DUE_DATE"));

            for (var j = 0; j < jsonPaymentDetailList.length; j++) {
                if (gvwList.getCellData((j+1), gvwList.getColRef("CHECK_YN")) == "Y" && gvwList.getCellData((j+1), gvwList.getColRef("TR_ABLE_YN")) == "Y") {
                    if (i != j) {
                        let igroup_id_j = 0;

                        if (strwork_type == "OK")
                            igroup_id_j = parseInt(gvwList.getCellData((j+1), gvwList.getColRef("GROUP_ID")));

                        let strcs_code_j = gvwList.getCellData((j+1), gvwList.getColRef("CS_CODE"));
                        let strpayer_bank_account_j = gvwList.getCellData((j+1), gvwList.getColRef("PAYER_BANK_ACCOUNT"));
                        let strpay_method_j = gvwList.getCellData((j+1), gvwList.getColRef("AP_PAY_METHOD"));
                        let strbill_due_date_j = gvwList.getCellData((j+1), gvwList.getColRef("BILL_DUE_DATE"));

                        if ((igroup_id == igroup_id_j && strcs_code != strcs_code_j) || (igroup_id == igroup_id_j && strpay_method != strpay_method_j) || (igroup_id == igroup_id_j && strpayer_bank_account != strpayer_bank_account_j) || (igroup_id == igroup_id_j && strbill_due_date != strbill_due_date_j)) {
                            bgroup_id_error = true;
                            break;
                        }
                    }
                }
            }

            if (bgroup_id_error) {
                gfn_comAlert("E0000", "그룹 설정이 잘못 되었습니다.");
                break;
            }
        }

        return bgroup_id_error;
    }

    const fn_payerBankError = async function () {
        let bpayer_bank_error = false;

        for (var i = 0; i < jsonPaymentDetailList.length; i++) {
            let strbank_check_bypass_yn = gvwList.getCellData((i+1), gvwList.getColRef("BANK_CHECK_BYPASS_YN"));

            if (gvwList.getCellData((i+1), gvwList.getColRef("CHECK_YN")) == "Y" && gvwList.getCellData((i+1), gvwList.getColRef("TR_ABLE_YN")) == "Y") {
                let strcs_code = gvwList.getCellData((i+1), gvwList.getColRef("CS_CODE"));
                let strpayer_bank_account = gfn_nvl(gvwList.getCellData((i+1), gvwList.getColRef("PAYER_BANK_ACCOUNT")));

                if (strpayer_bank_account == "" && strbank_check_bypass_yn == "N") {
                    bpayer_bank_error = true;
                }
            }

            if (bpayer_bank_error) {
                gfn_comAlert("E0000", "거래처 계좌가 등록되어 있지 않습니다.");
                return true;
            }
        }

        return bpayer_bank_error;
    }

    const fn_docError = async function () {
        let bhold_error = false;
        let bdefer_error = false;
        let buse_error = false;
        let bdoc_error = false;

        for (var i = 0; i < jsonPaymentDetailList.length; i++) {
            if (gvwList.getCellData((i+1), gvwList.getColRef("CHECK_YN")) == "Y" && gvwList.getCellData((i+1), gvwList.getColRef("HOLD_FLAG")) == "Y") {
                bdoc_error = true;
                bhold_error = true;
            }

            if (gvwList.getCellData((i+1), gvwList.getColRef("CHECK_YN")) == "Y" && gvwList.getCellData((i+1), gvwList.getColRef("DEFER_YN")) == "Y") {
                bdoc_error = true;
                bdefer_error = true;
            }

            if (gvwList.getCellData((i+1), gvwList.getColRef("CHECK_YN")) == "Y" && gvwList.getCellData((i+1), gvwList.getColRef("USE_YN")) == "N") {
                bdoc_error = true;
                bdefer_error = true;
            }
        }

        if (bhold_error) {
            gfn_comAlert("E0000", "전표가 지급보류상태입니다. 보류해제 후 진행하십시오.");
            return true;
        }

        if (bdefer_error) {
            gfn_comAlert("E0000", "거래처가 지급보류상태입니다. 보류해제후 진행하십시오.");
            return true;
        }

        if (buse_error) {
            gfn_comAlert("E0000", "거래처가 미확정상태입니다. 확정후 진행하십시요.");
            return true;
        }

        return bdoc_error;
    }

    const fn_confirm = async function () {
        var strtreasury_batch_no = "";
        if (fn_groupError("OK"))
            return;

        // 거래처 계좌 체크
        if (fn_payerBankError())
            return;

        // 전표상태 체크
        if (fn_docError())
            return;

        try {
            let strcs_code = "";
            let strdebit_credit = "";
            let strgroup_id = "";
            let straccount_code = "";
            let strar_acc_code = "";
            let strap_acc_code = "";
            let strexchange_gain_account = "";
            let strexchange_loss_account = "";
            let strdept_code = "";
            let strcost_center_code = "";
            let strproject_code = "";
            let stroriginal_dr_amt = "";
            let stroriginal_cr_amt = "";
            let stroriginal_dr_amt_ap = "";
            let stroriginal_cr_amt_ap = "";
            let strfunctional_dr_amt = "";
            let strfunctional_dr_amt1 = "";
            let strfunctional_dr_amt_ap = "";
            let strfunctional_cr_amt = "";
            let strfunctional_cr_amt1 = "";
            let strfunctional_cr_amt_ap = "";
            let strdoc_id = "";
            let strpay_exchange_pl_amt = "";
            let stritem_source_type = "";
            let strdoc_source_id = "";
            let strdoc_source_name = "";
            let stritem_source_id = "";
            let strdeposit_dept_code = "";
            let strdeposit_cost_center = "";
            let strcurrency_code = "";
            let strexchange_rate = "";
            let strcurrency_code_ap = "";
            let strexchange_rate_ap = "";
            let strexchange_type = "";
            let strdeposit_code = "";
            let strfi_org_code = "";
            let strsite_code = "";
            let strpay_method = "";
            let strtxn_group_code = "";
            let strpayer_bank_code = "";
            let strpayer_bank_account = "";
            let strpayer_bank_account_owner = "";

            let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHECK_YN"), true);

            gvwListCheckedList.forEach((item, index) => {
                if (gvwList.getCellData(item, gvwList.getColRef("TR_ABLE_YN")) == "Y") {
                    //인터넷뱅킹,FBS일시
                    if (gvwList.getCellData(item, gvwList.getColRef("AP_PAY_METHOD")) == "1" || gvwList.getCellData(item, gvwList.getColRef("EXTRA_FIELD6")) != "Y") {
                        if (gvwList.getCellData(item, gvwList.getColRef("PAYER_BANK_CODE")) == "") {
                            gfn_comAlert("E0000", "거래처 은행은 필수 입니다.");
                            return false;
                        }

                        if (gvwList.getCellData(item, gvwList.getColRef("PAYER_BANK_ACCOUNT")) == "") {
                            gfn_comAlert("E0000", "거래처 계좌번호는 필수 입니다.");
                            return false;
                        }

                        if (gvwList.getCellData(item, gvwList.getColRef("PAYER_BANK_ACCOUNT_OWNER")) == "") {
                            gfn_comAlert("E0000", "거래처 예금주는 필수 입니다.");
                            return false;
                        }
                    }

                    if (gvwList.getCellData(item, gvwList.getColRef("DEPOSIT_CODE")) == "") {
                        gfn_comAlert("E0000", "입출 계좌를 선택해 주십시오.");
                        return false;
                    }

                    if (strcs_code != "") {
                        strcs_code += "|";
                        strdebit_credit += "|";
                        strgroup_id += "|";
                        straccount_code += "|";
                        strar_acc_code += "|";
                        strap_acc_code += "|";
                        strexchange_gain_account += "|";
                        strexchange_loss_account += "|";
                        strdept_code += "|";
                        strcost_center_code += "|";
                        strproject_code += "|";
                        stroriginal_dr_amt += "|";
                        stroriginal_cr_amt += "|";
                        stroriginal_dr_amt_ap += "|";
                        stroriginal_cr_amt_ap += "|";
                        strfunctional_dr_amt += "|";
                        strfunctional_dr_amt1 += "|";
                        strfunctional_dr_amt_ap += "|";
                        strfunctional_cr_amt += "|";
                        strfunctional_cr_amt1 += "|";
                        strfunctional_cr_amt_ap += "|";
                        strdoc_id += "|";
                        strpay_exchange_pl_amt += "|";
                        stritem_source_type += "|";
                        strdoc_source_id += "|";
                        strdoc_source_name += "|";
                        stritem_source_id += "|";
                        strdeposit_dept_code += "|";
                        strdeposit_cost_center += "|";
                        strcurrency_code += "|";
                        strexchange_rate += "|";
                        strcurrency_code_ap += "|";
                        strexchange_rate_ap += "|";
                        strexchange_type += "|";
                        strfi_org_code += "|";
                        strsite_code += "|";
                        strdeposit_code += "|";
                        strpay_method += "|";
                        strtxn_group_code += "|";
                        strpayer_bank_code += "|";
                        strpayer_bank_account += "|";
                        strpayer_bank_account_owner += "|";
                    }

                    strcs_code += gvwList.getCellData(item, gvwList.getColRef("CS_CODE"));
                    //지급
                    if (gvwList.getCellData(item, gvwList.getColRef("TXN_GROUP_CODE")) == "110") {
                        strdebit_credit += "C";
                        stroriginal_dr_amt += "0";
                        stroriginal_dr_amt_ap += "0";
                        strfunctional_dr_amt += "0";
                        strfunctional_dr_amt1 += "0";// ADD 20160617
                        strfunctional_dr_amt_ap += "0";// ADD 20160617
                        if (gvwList.getCellData(item, gvwList.getColRef("CURRENCY_CODE")) == gvwList.getCellData(item, gvwList.getColRef("PAY_CURRENCY_CODE"))) {
                            stroriginal_cr_amt += gvwList.getCellData(item, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"));
                            stroriginal_cr_amt_ap += gvwList.getCellData(item, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"));
                            strfunctional_cr_amt += gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")); //환산후
                            strfunctional_cr_amt1 += gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"));
                            strfunctional_cr_amt_ap += gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"));
                        } else {
                            stroriginal_cr_amt += gvwList.getCellData(item, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"));
                            stroriginal_cr_amt_ap += gvwList.getCellData(item, gvwList.getColRef("PAY_ORIGINAL_AMOUNT_AP"));
                            strfunctional_cr_amt += gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")); //환산후
                            strfunctional_cr_amt1 += gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP"));
                            strfunctional_cr_amt_ap += gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP"));
                        }
                    } else {
                        strdebit_credit += "D";
                        stroriginal_cr_amt += "0";
                        stroriginal_cr_amt_ap += "0";
                        strfunctional_cr_amt += "0";
                        strfunctional_cr_amt1 += "0";// ADD 20160617
                        strfunctional_cr_amt_ap += "0";// ADD 20160617
                        if (gvwList.getCellData(item, gvwList.getColRef("CURRENCY_CODE")) == gvwList.getCellData(item, gvwList.getColRef("PAY_CURRENCY_CODE"))) {
                            stroriginal_dr_amt += gvwList.getCellData(item, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"));
                            stroriginal_dr_amt_ap += gvwList.getCellData(item, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"));
                            strfunctional_dr_amt += gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")); //환산후
                            strfunctional_dr_amt1 += gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"));
                            strfunctional_dr_amt_ap += gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT"));
                        } else {
                            stroriginal_dr_amt += gvwList.getCellData(item, gvwList.getColRef("PAY_ORIGINAL_AMOUNT"));
                            stroriginal_dr_amt_ap += gvwList.getCellData(item, gvwList.getColRef("PAY_ORIGINAL_AMOUNT_AP"));
                            strfunctional_dr_amt += gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMT_CONV")); //환산후
                            strfunctional_dr_amt1 += gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP"));// ADD 20160617 // 환산전
                            strfunctional_dr_amt_ap += gvwList.getCellData(item, gvwList.getColRef("PAY_FUNCTIONAL_AMOUNT_AP"));// ADD 20160617 // 채무전표기준 환산금액
                        }

                    }

                    strpay_exchange_pl_amt += gvwList.getCellData(item, gvwList.getColRef("PAY_EXCHANGE_PL_AMT")); // ADD 20160617

                    stritem_source_type += gvwList.getCellData(item, gvwList.getColRef("ITEM_SOURCE_TYPE"));// ADD 20160617
                    strdoc_source_id += gvwList.getCellData(item, gvwList.getColRef("DOC_SOURCE_ID"));// ADD 20160617
                    strdoc_source_name += gvwList.getCellData(item, gvwList.getColRef("DOC_SOURCE_NAME"));// ADD 20160617
                    stritem_source_id += gvwList.getCellData(item, gvwList.getColRef("ITEM_SOURCE_ID"));// ADD 20160617

                    straccount_code += gvwList.getCellData(item, gvwList.getColRef("ACCOUNT_CODE"));
                    strgroup_id += gvwList.getCellData(item, gvwList.getColRef("GROUP_ID"));
                    strar_acc_code += gvwList.getCellData(item, gvwList.getColRef("AR_ACC_CODE"));
                    strap_acc_code += gvwList.getCellData(item, gvwList.getColRef("AP_ACC_CODE"));
                    strexchange_gain_account += gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_GAIN_ACCOUNT"));
                    strexchange_loss_account += gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_LOSS_ACCOUNT"));
                    strdept_code += gvwList.getCellData(item, gvwList.getColRef("DEPT_CODE"));
                    strcost_center_code += gvwList.getCellData(item, gvwList.getColRef("COST_CENTER_CODE"));
                    strproject_code += gvwList.getCellData(item, gvwList.getColRef("PROJECT_CODE"));
                    strdoc_id += gvwList.getCellData(item, gvwList.getColRef("DOC_ID"));
                    strdeposit_dept_code += gvwList.getCellData(item, gvwList.getColRef("DEPOSIT_DEPT_CODE"));
                    strdeposit_cost_center += gvwList.getCellData(item, gvwList.getColRef("DEPOSIT_COST_CENTER"));

                    strcurrency_code += gvwList.getCellData(item, gvwList.getColRef("PAY_CURRENCY_CODE"));
                    strexchange_rate += gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_RATE"));
                    if (gvwList.getCellData(item, gvwList.getColRef("PAY_CURRENCY_CODE")) == gvwList.getCellData(item, gvwList.getColRef("CURRENCY_CODE"))){
                        strcurrency_code_ap += gvwList.getCellData(item, gvwList.getColRef("PAY_CURRENCY_CODE"));
                        strexchange_rate_ap += gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_RATE"));
                    } else {
                        strcurrency_code_ap += gvwList.getCellData(item, gvwList.getColRef("CURRENCY_CODE"));
                        strexchange_rate_ap += gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_RATE_AP"));
                    }
                    strexchange_type += gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_TYPE"));

                    strdeposit_code += gvwList.getCellData(item, gvwList.getColRef("DEPOSIT_CODE"));
                    strfi_org_code += gvwList.getCellData(item, gvwList.getColRef("FI_ORG_CODE"));
                    strsite_code += gvwList.getCellData(item, gvwList.getColRef("SITE_CODE"));
                    strpay_method += gvwList.getCellData(item, gvwList.getColRef("AP_PAY_METHOD"));
                    strtxn_group_code += gvwList.getCellData(item, gvwList.getColRef("TXN_GROUP_CODE"));
                    strpayer_bank_code += gvwList.getCellData(item, gvwList.getColRef("PAYER_BANK_CODE"));
                    strpayer_bank_account += gvwList.getCellData(item, gvwList.getColRef("PAYER_BANK_ACCOUNT"));
                    strpayer_bank_account_owner += gvwList.getCellData(item, gvwList.getColRef("PAYER_BANK_ACCOUNT_OWNER"));


                    //원천세type이 있을경우 원천세
                    if (gvwList.getCellData(item, gvwList.getColRef("WITHHOLD_TAX_TYPE")) == "")
                    { return false; }
                    else
                    {//lje  원천세코드 있을경우
                        for (var k = 0; k < 2; k++) {
                            if (strcs_code != "") {
                                strcs_code += "|";
                                strdebit_credit += "|";
                                strgroup_id += "|";
                                straccount_code += "|";
                                strar_acc_code += "|";
                                strap_acc_code += "|";
                                strexchange_gain_account += "|";
                                strexchange_loss_account += "|";
                                strdept_code += "|";
                                strcost_center_code += "|";
                                strproject_code += "|";
                                stroriginal_dr_amt += "|";
                                stroriginal_cr_amt += "|";
                                stroriginal_dr_amt_ap += "|";
                                stroriginal_cr_amt_ap += "|";
                                strfunctional_dr_amt += "|";
                                strfunctional_dr_amt1 += "|";
                                strfunctional_dr_amt_ap += "|";
                                strfunctional_cr_amt += "|";
                                strfunctional_cr_amt1 += "|";
                                strfunctional_cr_amt_ap += "|";
                                strdoc_id += "|";
                                strpay_exchange_pl_amt += "|";
                                stritem_source_type += "|";
                                strdoc_source_id += "|";
                                strdoc_source_name += "|";
                                stritem_source_id += "|";
                                strdeposit_dept_code += "|";
                                strdeposit_cost_center += "|";
                                strcurrency_code += "|";
                                strexchange_rate += "|";
                                strcurrency_code_ap += "|";
                                strexchange_rate_ap += "|";
                                strexchange_type += "|";

                                strfi_org_code += "|";
                                strsite_code += "|";
                                strdeposit_code += "|";
                                strpay_method += "|";
                                strtxn_group_code += "|";
                                strpayer_bank_code += "|";
                                strpayer_bank_account += "|";
                                strpayer_bank_account_owner += "|";
                            }

                            if (k == 0) {
                                strdebit_credit += "C";
                                stroriginal_dr_amt += "0";
                                stroriginal_cr_amt += gvwList.getCellData(item, gvwList.getColRef("WTAX_AMT"));
                                stroriginal_dr_amt_ap += "0";
                                stroriginal_cr_amt_ap += gvwList.getCellData(item, gvwList.getColRef("WTAX_AMT"));
                                strfunctional_dr_amt += "0";
                                strfunctional_dr_amt1 += "0";//
                                strfunctional_dr_amt_ap += "0";//
                                strfunctional_cr_amt += gvwList.getCellData(item, gvwList.getColRef("WTAX_AMT"));
                                strfunctional_cr_amt1 += gvwList.getCellData(item, gvwList.getColRef("WTAX_AMT"));
                                strfunctional_cr_amt_ap += gvwList.getCellData(item, gvwList.getColRef("WTAX_AMT"));
                                strcs_code += gvwList.getCellData(item, gvwList.getColRef("CS_CODE"));

                                straccount_code += gvwList.getCellData(item, gvwList.getColRef("WTAX_ACCOUNT_CODE"));
                                strar_acc_code += gvwList.getCellData(item, gvwList.getColRef("WTAX_ACCOUNT_CODE"));
                                strap_acc_code += gvwList.getCellData(item, gvwList.getColRef("WTAX_ACCOUNT_CODE"));
                            } else {
                                strdebit_credit += "C";
                                stroriginal_dr_amt += "0";
                                stroriginal_cr_amt += gvwList.getCellData(item, gvwList.getColRef("WTAXSUBAMT"));
                                stroriginal_dr_amt_ap += "0";
                                stroriginal_cr_amt_ap += gvwList.getCellData(item, gvwList.getColRef("WTAXSUBAMT"));
                                strfunctional_dr_amt += "0";
                                strfunctional_dr_amt1 += "0";//
                                strfunctional_dr_amt_ap += "0";//
                                strfunctional_cr_amt += gvwList.getCellData(item, gvwList.getColRef("WTAXSUBAMT"));
                                strfunctional_cr_amt1 += gvwList.getCellData(item, gvwList.getColRef("WTAXSUBAMT"));
                                strfunctional_cr_amt_ap += gvwList.getCellData(item, gvwList.getColRef("WTAXSUBAMT"));
                                strcs_code += gvwList.getCellData(item, gvwList.getColRef("CS_CODE"));

                                straccount_code += gvwList.getCellData(item, gvwList.getColRef("SUB_WTAX_ACCOUNT_CODE"));
                                strar_acc_code += gvwList.getCellData(item, gvwList.getColRef("SUB_WTAX_ACCOUNT_CODE"));
                                strap_acc_code += gvwList.getCellData(item, gvwList.getColRef("SUB_WTAX_ACCOUNT_CODE"));
                            }

                            strpay_exchange_pl_amt += gvwList.getCellData(item, gvwList.getColRef("PAY_EXCHANGE_PL_AMT"));
                            stritem_source_type += "";
                            strdoc_source_id += gvwList.getCellData(item, gvwList.getColRef("DOC_SOURCE_ID"));
                            strdoc_source_name += gvwList.getCellData(item, gvwList.getColRef("DOC_SOURCE_NAME"));
                            stritem_source_id += "";

                            strgroup_id += gvwList.getCellData(item, gvwList.getColRef("GROUP_ID"));

                            strexchange_gain_account += gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_GAIN_ACCOUNT"));
                            strexchange_loss_account += gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_LOSS_ACCOUNT"));
                            strdept_code += gvwList.getCellData(item, gvwList.getColRef("DEPT_CODE"));
                            strcost_center_code += gvwList.getCellData(item, gvwList.getColRef("COST_CENTER_CODE"));
                            strproject_code += gvwList.getCellData(item, gvwList.getColRef("PROJECT_CODE"));
                            strdoc_id += gvwList.getCellData(item, gvwList.getColRef("DOC_ID"));
                            strdeposit_dept_code += gvwList.getCellData(item, gvwList.getColRef("DEPT_CODE"));
                            strdeposit_cost_center += gvwList.getCellData(item, gvwList.getColRef("COST_CENTER_CODE"));

                            strcurrency_code += gvwList.getCellData(item, gvwList.getColRef("PAY_CURRENCY_CODE"));
                            strexchange_rate += gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_RATE"));
                            if (gvwList.getCellData(item, gvwList.getColRef("PAY_CURRENCY_CODE")) == gvwList.getCellData(item, gvwList.getColRef("CURRENCY_CODE"))) {
                                strcurrency_code_ap += gvwList.getCellData(item, gvwList.getColRef("PAY_CURRENCY_CODE"));
                                strexchange_rate_ap += gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_RATE"));
                            } else {
                                strcurrency_code_ap += gvwList.getCellData(item, gvwList.getColRef("CURRENCY_CODE"));
                                strexchange_rate_ap += gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_RATE_AP"));
                            }
                            strexchange_type += gvwList.getCellData(item, gvwList.getColRef("EXCHANGE_TYPE"));


                            strdeposit_code += gvwList.getCellData(item, gvwList.getColRef("DEPOSIT_CODE"));
                            strfi_org_code += gvwList.getCellData(item, gvwList.getColRef("FI_ORG_CODE"));
                            strsite_code += gvwList.getCellData(item, gvwList.getColRef("SITE_CODE"));
                            strpay_method += gvwList.getCellData(item, gvwList.getColRef("AP_PAY_METHOD"));
                            strtxn_group_code += gvwList.getCellData(item, gvwList.getColRef("TXN_GROUP_CODE"));
                            strpayer_bank_code += gvwList.getCellData(item, gvwList.getColRef("PAYER_BANK_CODE"));
                            strpayer_bank_account += gvwList.getCellData(item, gvwList.getColRef("PAYER_BANK_ACCOUNT"));
                            strpayer_bank_account_owner += gvwList.getCellData(item, gvwList.getColRef("PAYER_BANK_ACCOUNT_OWNER"));
                        }
                    }
                }
            });

            // 비즈니스 로직 정보
            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_DOC_DATE : gfn_nvl(SBUxMethod.get("SRCH_FROM_DATE")),
                V_P_CS_CODE : strcs_code,
                V_P_DEBIT_CREDIT : strdebit_credit,
                V_P_GROUP_ID : strgroup_id,
                V_P_ACCOUNT_CODE : straccount_code,
                V_P_AR_ACC_CODE : strar_acc_code,
                V_P_AP_ACC_CODE : strap_acc_code,
                V_P_EXCHANGE_GAIN_ACC_CODE : strexchange_gain_account,
                V_P_EXCHANGE_LOSS_ACC_CODE : strexchange_loss_account,
                V_P_DEPT_CODE : strdept_code,
                V_P_COST_CENTER_CODE : strcost_center_code,
                V_P_PROJECT_CODE : strproject_code,
                V_P_DEPOSIT_DEPT_CODE : strdeposit_dept_code,
                V_P_DEPOSIT_COST_CENTER : strdeposit_cost_center,
                V_P_ORIGINAL_DR_AMT : stroriginal_dr_amt,
                V_P_ORIGINAL_CR_AMT : stroriginal_cr_amt,
                V_P_ORIGINAL_DR_AMT_AP : stroriginal_dr_amt_ap,
                V_P_ORIGINAL_CR_AMT_AP : stroriginal_cr_amt_ap,
                V_P_FUNCTIONAL_DR_AMT : strfunctional_dr_amt,
                V_P_FUNCTIONAL_DR_AMT1 : strfunctional_dr_amt1,
                V_P_FUNCTIONAL_DR_AMT_AP : strfunctional_dr_amt_ap,
                V_P_FUNCTIONAL_CR_AMT : strfunctional_cr_amt,
                V_P_FUNCTIONAL_CR_AMT1 : strfunctional_cr_amt1,
                V_P_FUNCTIONAL_CR_AMT_AP : strfunctional_cr_amt_ap,
                V_P_PAY_EXCHANGE_PL_AMT : strpay_exchange_pl_amt,
                V_P_ITEM_SOURCE_TYPE : stritem_source_type,
                V_P_DOC_SOURCE_ID : strdoc_source_id,
                V_P_DOC_SOURCE_NAME : strdoc_source_name,
                V_P_ITEM_SOURCE_ID : stritem_source_id,
                V_P_CURRENCY_CODE : strcurrency_code,
                V_P_EXCHANGE_RATE : strexchange_rate,
                V_P_CURRENCY_CODE_AP : strcurrency_code_ap,
                V_P_EXCHANGE_RATE_AP : strexchange_rate_ap,
                V_P_EXCHANGE_TYPE : strexchange_type,
                V_P_DOC_ID : strdoc_id,
                V_P_FI_ORG_CODE : strfi_org_code,
                V_P_SITE_CODE : strsite_code,
                V_P_DEPOSIT_CODE : strdeposit_code,
                V_P_PAY_METHOD : strpay_method,
                V_P_TXN_GROUP_CODE : strtxn_group_code,
                V_P_PAYER_BANK_CODE : strpayer_bank_code,
                V_P_PAYER_BANK_ACCOUNT : strpayer_bank_account,
                V_P_PAYER_BANK_ACCOUNT_OWNER : strpayer_bank_account_owner,
                V_P_DEPT_CODE_H : p_deptCode,
                V_P_EMP_CODE : p_empCode,
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: '',
            };

            const postJsonPromise = gfn_postJSON("/fi/ftr/pay/insertTrp1050.do", {
                getType				: 'json',
                workType			: 'N',
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (gfn_nvl(SBUxMethod.get("SRCH_TREASURY_BATCH_NO")) == "") {
                        SBUxMethod.set("SRCH_TREASURY_BATCH_NO", data.v_returnStr);
                        strtr_batch_no = data.v_returnStr;
                    }

                    if (!bPopUpFlag) {
                        SBUxMethod.set("SRCH_TREASURY_BATCH_NO", "");

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
        } catch (e) {
            console.error(e);
        }

        strtreasury_batch_no = strtr_batch_no;

        if (bPopUpFlag) {
            this.FormResult = strtreasury_batch_no;
            SBUxMethod.closeModal('modal-comPopFbs2040');
        } else {
            if (!strtreasury_batch_no == "") {
                var param = {
                    TREASURY_BATCH_NO : strtreasury_batch_no,
                    COMP_CODE : gv_ma_selectedApcCd,
                    FI_ORG_CODE : p_fiOrgCode,
                    ASAVE : "N",
                    APRINT : "Y",
                    target : "MA_A20_060_030_700"
                };

                let json = JSON.stringify(param);
                window.parent.cfn_openTabSearch(json);
            }
        }

    }

    const fn_cancel = async function () {
        this.Close();
    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
