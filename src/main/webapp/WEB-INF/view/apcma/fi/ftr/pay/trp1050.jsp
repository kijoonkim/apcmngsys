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
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_FI_ORG_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">거래처</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_CS_CODE_FR" uitype="hidden" placeholder="" class="form-control input-sm" readonly></sbux-input>
                        <sbux-input id="SRCH_CS_NAME_FR" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
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
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_CS_CODE_TO" uitype="hidden" placeholder="" class="form-control input-sm" readonly></sbux-input>
                        <sbux-input id="SRCH_CS_NAME_TO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
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
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                style="width:100%;"
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
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_PAY_CURRENCY_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_PAY_CURRENCY_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
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
                                id="SRCH_FTXN_DATE"
                                name="SRCH_FTXN_DATE"
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
                                id="SRCH_TTXN_DATE"
                                name="SRCH_TTXN_DATE"
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
                            <sbux-button class="btn btn-xs btn-outline-dark" text="찾기" uitype="normal" style="margin-right: 10px" onclick="fn_findBankCode"></sbux-button>
                            <sbux-input id="DEPOSIT_CODE_P" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                            <sbux-input id="DEPOSIT_NAME_P" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                            <sbux-button class="btn btn-xs btn-outline-dark" text="찾기" uitype="normal" style="margin-right: 10px" onclick="fn_findDepositCode"></sbux-button>
                            <sbux-button class="btn btn-xs btn-outline-dark" text="계좌반영" uitype="normal" onclick="fn_batchAllInPrint"></sbux-button>
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
                                <th scope="row" class="th_bg">지급(환산전)</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="LOG" name="LOG" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">지급(환산후)</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="LOG" name="LOG" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-button id="btnSum" name="btnSum" uitype="normal" text="합계" class="btn btn-sm btn-outline-danger" onclick="fn_sum" style="float: right;"></sbux-button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                    <div id="sb-area-gvwList" style="height:600px;"></div>
                </div>
                <div class="ad_tbl_top2">
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
    //-----------------------------------------------------------

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
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
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
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_CS_NAME_'+flag, data.CS_NAME);
                SBUxMethod.set('SRCH_CS_CODE_'+flag, data.CS_CODE);
            },
        });
    }

    const fn_findPayCurrencyCode = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_PAY_CURRENCY_NAME"));
        var replaceText0 	= "_CURRENCY_CODE_";
        var replaceText1 	= "_CURRENCY_NAME_";
        var strWhereClause 	= "AND CURRENCY_CODE '%" + replaceText0 + "%' AND CURRENCY_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '통화 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CURRENCY_USE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "코드명"]
            ,searchInputFields		: ["CURRENCY_CODE", "CURRENCY_NAME"]
            ,searchInputValues		: ["", searchText]
            ,height					: '400px'
            ,tableHeader			: ["통화코드", "통화명", "비고"]
            ,tableColumnNames		: ["CURRENCY_CODE" , "CURRENCY_NAME", "DESCIPTION"]
            ,tableColumnWidths		: ["60px"    , "100px" , "100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_PAY_CURRENCY_NAME', data.CURRENCY_NAME);
                SBUxMethod.set('SRCH_PAY_CURRENCY_CODE', data.CURRENCY_CODE);
            },
        });
    }

    const fn_findBankCode = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("BANK_NAME_P"));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_NAME_";
        var strWhereClause 	= "AND CODE '%" + replaceText0 + "%' AND NAME LIKE '%" + replaceText1 + "%'";

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
                console.log('callback data:', data);
                SBUxMethod.set('BANK_NAME_P', data.NAME);
                SBUxMethod.set('BANK_CODE_P', data.CODE);
            },
        });
    }

    const fn_findDepositCode = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("DEPOSIT_NAME_P"));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_NAME_";
        var strWhereClause 	= "AND CODE '%" + replaceText0 + "%' AND NAME LIKE '%" + replaceText1 + "%'";

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
                console.log('callback data:', data);
                SBUxMethod.set('DEPOSIT_NAME_P', data.NAME);
                SBUxMethod.set('DEPOSIT_CODE_P', data.CODE);
            },
        });
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
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
