<%
    /**
     * @Class Name 		: fbs2010.jsp
     * @Description 	: 실시간이체 화면
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
    <title>title : 실시간이체</title>
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
                    </h3>
                </div>
                <div style="margin-left: auto;">
                    <sbux-button id="btnPrint" name="btnPrint" uitype="normal" text="출력" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_print"></sbux-button>
                    <sbux-button id="btnConfirmHist" name="btnConfirmHist" uitype="normal" text="결재이력" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_confimHist"></sbux-button>
                    <sbux-button id="btnResultQuery" name="btnResultQuery" uitype="normal" text="이체결과조회" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_resultQuery"></sbux-button>
                    <sbux-button id="btnBankUniqueNo" name="btnBankUniqueNo" uitype="normal" text="부가세 고유번호" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_bankUniqueNo"></sbux-button>
                    <sbux-button id="btnTxnCancel" name="btnTxnCancel" uitype="normal" text="이체취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_txnCancel"></sbux-button>
                    <sbux-button id="btnTxnComplete" name="btnTxnComplete" uitype="normal" text="이체처리" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_txnComplete"></sbux-button>
                    <sbux-button id="btnRetry" name="btnRetry" uitype="normal" text="재전송" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_retry"></sbux-button>
                    <sbux-button id="btnName" name="btnName" uitype="normal" text="수취인확인" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_checkName"></sbux-button>
                    <sbux-button id="btnFbsNew" name="btnFbsNew" uitype="normal" text="FBS 일괄생성" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_fbsNew"></sbux-button>
                    <sbux-button id="btnMailingList" name="btnMailingList" uitype="normal" text="메일링 리스트" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_mailingList"></sbux-button>
                    <sbux-button id="btnFbsUser" name="btnFbsUser" uitype="normal" text="FBS담당자생성" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_fbsUser"></sbux-button>
                </div>
            </div>
            <div class="box-body">
                <div class="box-search-ma">
                    <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
                    <table id="srchArea" class="table table-bordered tbl_fixed table-search-ma">
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
                            <th scope="row" class="th_bg_search">APC명</th>
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
                            <th scope="row" class="th_bg_search">거래처</th>
                            <td class="td_input" style="border-right:hidden;" data-group="SRCH_CUSTOMER_CS">
                                <sbux-input id="SRCH_CUSTOMER_CS_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_CUSTOMER_CS">
                                <sbux-input id="SRCH_CUSTOMER_CS_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;" data-group="SRCH_CUSTOMER_CS">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findCsCode"
                                ></sbux-button>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-checkbox
                                        uitype="normal"
                                        id="SRCH_MULTI_CS_YN"
                                        name="SRCH_MULTI_CS_YN"
                                        uitype="normal"
                                        class="form-control input-sm"
                                        text="복수선택"
                                        true-value="Y" false-value="N"
                                />
                            </td>
                            <td colspan="3" class="td_input">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="복수거래처" uitype="modal"
                                        target-id="modal-compopup3"
                                        onclick="fn_multiCsSelect"
                                ></sbux-button>
                                <sbux-select id="SRCH_DEPOSIT_CODE" uitype="single" jsondata-ref="jsonDepositCode" unselected-text="선택" class="form-control input-sm" style="display: none;"></sbux-select>
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg_search">지급일자</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="SRCH_TXN_DATE"
                                        name="SRCH_TXN_DATE"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                        style="width:100%;"
                                />
                            </td>
                            <td colspan="3"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg_search">전송회차</th>
                            <td class="td_input" style="border-right:hidden;" data-group="SRCH_TRANS">
                                <sbux-input id="SRCH_TRANS_COUNT" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_TRANS">
                                <sbux-input id="SRCH_TXN_TIME" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;" data-group="SRCH_TRANS">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="…" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findPayCurrency"
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg_search">전표번호</th>
                            <td colspan="4" class="td_input" style="border-right:hidden;">
                                <sbux-input id="SRCH_DOC_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-checkbox
                                        uitype="normal"
                                        id="SRCH_MULTI_A_YN"
                                        name="SRCH_MULTI_A_YN"
                                        uitype="normal"
                                        class="form-control input-sm"
                                        text="복수선택"
                                        true-value="Y" false-value="N"
                                />
                            </td>
                            <td colspan="3" class="td_input">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="복수선택" uitype="modal"
                                        target-id="modal-compopup3"
                                        onclick="fn_multiASelect"
                                ></sbux-button>
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg_search">입출유형</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_TRANSFER_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SRCH_TRANSFER_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg_search">승인상태</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_TXN_STATUS" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SRCH_TXN_STATUS" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg_search">이체상태</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_PROCESS_YN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SRCH_PROCESS_YN" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg_search">FBS서비스</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_FBS_SERVICE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panHeader" required>
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SRCH_FBS_SERVICE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td></td>
                            <th scope="row" class="th_bg_search">지급구분</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_PAY_GUBUN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panHeader" required>
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SRCH_PAY_GUBUN" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg_search">지급방법</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_PAY_METHOD" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SRCH_PAY_METHOD" style="width:440px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                                <sbux-input uitype="hidden" uitype="text" id="SRCH_TXN_TIME_RAW" class="form-control input-sm"></sbux-input>
                                <sbux-input uitype="hidden" uitype="text" id="SRCH_TXN_ID" class="form-control input-sm"></sbux-input>
                                <sbux-input uitype="hidden" uitype="text" id="SRCH_BANK_CODE" class="form-control input-sm"></sbux-input>
                                <sbux-input uitype="hidden" uitype="text" id="SRCH_INSERT_USERID" name="INSERT_USERID" grid-id="gvwDetail" class="form-control input-sm"></sbux-input>
                                <sbux-input uitype="hidden" uitype="text" id="SRCH_TXN_STATUS1" name="TXN_STATUS" grid-id="gvwDetail" class="form-control input-sm"></sbux-input>
                                <sbux-input uitype="hidden" uitype="text" id="SRCH_PROXY_EMP_CODE" name="PROXY_EMP_CODE" grid-id="gvwDetail" class="form-control input-sm"></sbux-input>
                                <sbux-input uitype="hidden" uitype="text" id="SRCH_PASSWORD" class="form-control input-sm"></sbux-input>
                                <sbux-input uitype="hidden" uitype="text" id="SRCH_FEE" class="form-control input-sm"></sbux-input>
                                <sbux-input uitype="hidden" uitype="text" id="SRCH_TXN_DATE1" name="TXN_DATE" grid-id="gvwDetail" class="form-control input-sm"></sbux-input>
                                <sbux-input uitype="hidden" uitype="text" id="SRCH_TXN_TIME1" name="TXN_TIME" grid-id="gvwDetail" class="form-control input-sm"></sbux-input>
                                <sbux-input uitype="hidden" uitype="text" id="SRCH_APPR_ID" name="APPR_ID" grid-id="gvwDetail" class="form-control input-sm"></sbux-input>
                                <sbux-input uitype="hidden" uitype="text" id="SRCH_CONFIRM_EMP_CODE" name="CONFIRM_EMP_CODE" grid-id="gvwDetail" class="form-control input-sm"></sbux-input>
                            </td>
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>자금이체 상세</span>
                            </li>
                        </ul>
                        <div class="ad_tbl_toplist" style="display: flex; align-items: center; justify-content: flex-end;">
                            <div style="display: flex; align-items: center; justify-content: left; width: 30%; margin-right: 5%">
                                <span style="margin-right: 10px;">입금적요</span>
                                <sbux-input id="IN_PRINT_A" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-button class="btn btn-xs btn-outline-dark" text="입금적요반영" uitype="normal" onclick="fn_batchAllInPrint"></sbux-button>
                            </div>
                            <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
                            <sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow" style="float: right;"></sbux-button>
                        </div>
                    </div>
                    <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                        <div id="sb-area-gvwDetail" style="height:300px;"></div>
                        <table class="table table-bordered tbl_fixed">
                            <caption>로그</caption>
                            <colgroup>
                                <col style="width: 100%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="LOG" name="LOG" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <sbux-tabs id="idxTab" name="idxTab" uitype="normal" is-scrollable="false" jsondata-ref="jsonTabData">
                    </sbux-tabs>
                        <div class="tab-content">
                            <div id="tabPageEx1">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li>
                                            <span>자금계획 내역</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="table-responsive tbl_scroll_sm" style="margin-top: 0px;">
                                    <div id="sb-area-gvwAct" style="height:200px;"></div>
                                </div>
                            </div>
                            <div id="tabPageEx2">
                                <table id="" class="table table-bordered tbl_fixed">
                                    <caption>외화상세내역</caption>
                                    <colgroup>
                                        <col style="width: 12.5%">
                                        <col style="width: 12.5%">
                                        <col style="width: 12.5%">
                                        <col style="width: 12.5%">
                                        <col style="width: 12.5%">
                                        <col style="width: 12.5%">
                                        <col style="width: 12.5%">
                                        <col style="width: 12.5%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" class="th_bg">수취인명</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="CS_NAME" name="CS_NAME" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">수취인 주소</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="CS_ADDRESS" name="CS_ADDRESS" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">SWIFT BIC</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="PAYER_SWIFT_BIC" name="PAYER_SWIFT_BIC" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">입금은행명 및 주소</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="PAYER_BANK_INFO" name="PAYER_BANK_INFO" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">지급사유코드</th>
                                        <td colspan="3" class="td_input" style="border-right:hidden;">
                                            <div class="dropdown">
                                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PAY_REASON" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <font>선택</font>
                                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="PAY_REASON" style="width:440px;height:150px;padding-top:0px;overflow:auto">
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row" class="th_bg">송금사유코드</th>
                                        <td colspan="3" class="td_input" style="border-right:hidden;">
                                            <div class="dropdown">
                                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SEND_REASON" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <font>선택</font>
                                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="SEND_REASON" style="width:440px;height:150px;padding-top:0px;overflow:auto">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">수취인앞지시사항1</th>
                                        <td colspan="3" class="td_input" style="border-right:hidden;">
                                            <sbux-input id="ORDER1_TO_RECEIPT" name="ORDER1_TO_RECEIPT" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">수취인앞지시사항2</th>
                                        <td colspan="3" class="td_input" style="border-right:hidden;">
                                            <sbux-input id="ORDER2_TO_RECEIPT" name="ORDER2_TO_RECEIPT" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">수취인앞지시사항3</th>
                                        <td colspan="3" class="td_input" style="border-right:hidden;">
                                            <sbux-input id="ORDER3_TO_RECEIPT" name="ORDER3_TO_RECEIPT" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">수취인앞지시사항4</th>
                                        <td colspan="3" class="td_input" style="border-right:hidden;">
                                            <sbux-input id="ORDER4_TO_RECEIPT" name="ORDER4_TO_RECEIPT" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">송금경유은행1</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="TRANS_BANK1" name="TRANS_BANK1" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">송금경유은행2</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="TRANS_BANK2" name="TRANS_BANK2" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">송금경유은행3</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="TRANS_BANK3" name="TRANS_BANK3" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">수수료부담자</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <p class="ad_input_row">
                                                <sbux-radio id="FEE_CHARGER_1" name="FEE_CHARGER" uitype="normal" text="수취인" value="1"></sbux-radio>
                                            </p>
                                            <p class="ad_input_row">
                                                <sbux-radio id="FEE_CHARGER_2" name="FEE_CHARGER" uitype="normal" text="송금인" value="2"></sbux-radio>
                                            </p>
                                        </td>
                                        <th scope="row" class="th_bg">지급구분</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <p class="ad_input_row">
                                                <sbux-radio id="FOREIGN_GB_1" name="FOREIGN_GB" uitype="normal" text="국내" value="2"></sbux-radio>
                                            </p>
                                            <p class="ad_input_row">
                                                <sbux-radio id="FOREIGN_GB_2" name="FOREIGN_GB" uitype="normal" text="해외" value="1"></sbux-radio>
                                            </p>
                                        </td>
                                        <th scope="row" class="th_bg">가격조건</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <div class="dropdown">
                                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PRICE_CONDITION" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <font>선택</font>
                                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="PRICE_CONDITION" style="width:440px;height:150px;padding-top:0px;overflow:auto">
                                                </div>
                                            </div>
                                        </td>
                                        <th scope="row" class="th_bg">수입용도코드</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <div class="dropdown">
                                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="IMPORT_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <font>선택</font>
                                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="IMPORT_TYPE" style="width:440px;height:150px;padding-top:0px;overflow:auto">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">수입신고번호</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="IMPORT_DOC_NO" name="IMPORT_DOC_NO" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">H.S Code</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="HS_CODE" name="HS_CODE" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <th scope="row" class="th_bg">수수료 계좌</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-input id="CHARGE_ACCOUNT" name="CHARGE_ACCOUNT" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">비고</th>
                                        <td colspan="5" class="td_input" style="border-right:hidden;">
                                            <sbux-input id="REMARK" name="IMPORT_DOC_NO" grid-id="gvwDetail" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
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

    <div>
        <sbux-modal
            id="modal-comPopCom5500"
            name="modal-comPopCom5500"
            uitype="middle"
            header-title=""
            body-html-id="body-com-popCom5500"
            header-is-close-button="true"
            footer-is-close-button="true"
            style="width:1000px">
        </sbux-modal>
    </div>
    <div id="body-com-popCom5500">
        <jsp:include page="../../../com/popup/comPopCom5500.jsp"></jsp:include>
    </div>

     <div>
        <sbux-modal
            id="modal-comPopFbs2040"
            name="modal-comPopFbs2040"
            uitype="middle"
            header-title=""
            body-html-id="body-com-popFbs2040"
            header-is-close-button="true"
            footer-is-close-button="true"
            style="width:1000px">
        </sbux-modal>
    </div>
    <div id="body-com-popFbs2040">
        <jsp:include page="../../../com/popup/comPopFbs2040.jsp"></jsp:include>
    </div>

<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:1400px" id="modal-compopfim3420" name="modal-compopfim3420" uitype="middle" header-title="" body-html-id="body-modal-compopfim3420" header-is-close-button="true" footer-is-close-button="false"  callback-after-close="fn_search"></sbux-modal>
    </div>
    <div id="body-modal-compopfim3420">
    	<jsp:include page="../../../com/popup/comPopFim3420.jsp"></jsp:include>
    </div>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_fiOrgCode = "${loginVO.maFIOrgCode}";
    var p_siteCode = "${loginVO.maSiteCode}";
    var p_userID = "${loginVO.maUserID}";
    var p_isTrUser = "${loginVO.maIsTrUser}";
    var p_empCode = "${loginVO.maEmpCode}";
    var p_isTrManager = "${loginVO.maIsTrManager}";
    var p_isAccountChief = "${loginVO.maIsAccountChief}";
    var p_fbsvan = "${loginVO.maFBSVAN}";
    var p_fbsvancb = "${loginVO.maFBSVANCB}";
    var p_fbsvanfc = "${loginVO.maFBSVANFC}";
    var p_fbsrip = "${loginVO.maFBSRIP}";
    var p_fbsrport = "${loginVO.maFBSRPORT}";
    var p_fbscip = "${loginVO.maFBSCIP}";
    var p_fbscport = "${loginVO.maFBSCPORT}";
    var p_fbsfip = "${loginVO.maFBSFIP}";
    var p_fbsfport = "${loginVO.maFBSFPORT}";
    var p_isGW = "${loginVO.maIsGW}";
    //-----------------------------------------------------------

    var dtFirmbanking;
    var dtTransCnt;
    var dtCheck;

    var strCode1List = "";
    var strCode2List = "";
    var strCsCodeList = "";
    var strAccountCodeList = "";

    var dtResult1 = null;
    var dtResult2 = null;
    var dtResult3 = null;
    var dtResult4 = null;

    var bPopUpFlag = false;
    var bTransCountSelect = true;
    var bDetailSelect = true;
    var isFBSAsync = true;

    var jsonPayMethod = []; // 지급방법
    var jsonDepositCode = []; // 입금코드
    var jsonSiteCode = []; // 사업장
    var jsonStatusCode = []; // 승인상태
    var jsonProcessYn = []; // 이체처리결과
    var jsonBankCode = []; // 은행코드
    var jsonTransferType = []; // 입출유형
    var jsonErrorCode = []; // 조회결과
    var jsonComType = []; // 기업분류
    var jsonCurrencyCode = []; // 통화
    var jsonUser = []; // 사용자
    var jsonPayerName = []; // 입금처

    // Tab Data
    var jsonTabData = [
        {"id": "0", "pid": "-1", "order": "1", "text": "자금계획", "targetid": "tabPageEx1", "targetvalue": "자금계획"},
        {"id": "1", "pid": "-1", "order": "2", "text": "외화상세내역", "targetid": "tabPageEx2", "targetvalue": "외화상세내역"},
    ];

    //grid 초기화
    var gvwDetail; 			// 그리드를 담기위한 객체 선언
    var gvwAct;

    var jsonFinancialTransferList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonFinancialPlanList = [];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // APC명
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
            // FBS서비스
            gfnma_multiSelectInit({
                target			: ['#SRCH_FBS_SERVICE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FBS019'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 지급구분
            gfnma_multiSelectInit({
                target			: ['#SRCH_PAY_GUBUN']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FBS031'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 지급방법
            gfnma_multiSelectInit({
                target			: ['#SRCH_PAY_METHOD']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIM081_FBS'
                ,whereClause	: "AND EXTRA_FIELD11 = '" + "ECBANK" + "'"
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "코드명", 		ref: 'CODE_NAME',    		width:'140px',  	style:'text-align:left'},
                    {caption: "은행", 		ref: 'BANK_CODE',    		width:'30px',  	style:'text-align:left'},
                    {caption: "계좌번호", 	ref: 'ACCOUNT_NUM',    		width:'120px',  	style:'text-align:left'},
                    {caption: "계좌코드", 	ref: 'DEPOSIT_CODE',    	width:'100px',  	style:'text-align:left'},
                ]
            }),
            // 지급구분
            gfnma_setComSelect(['SRCH_DEPOSIT_CODE'], jsonDepositCode, 'L_DEPOSIT_LIST', "", gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'DEPOSIT_CODE', 'DEPOSIT_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['gvwDetail'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 상태
            gfnma_setComSelect(['gvwDetail'], jsonStatusCode, 'L_FIG002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_TXN_STATUS']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIG002'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "전표상태", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 이체처리결과
            gfnma_setComSelect(['gvwDetail'], jsonProcessYn, 'L_FIM080', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_PROCESS_YN']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIM080'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 은행코드
            gfnma_setComSelect(['gvwDetail'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 입출유형
            gfnma_setComSelect(['gvwDetail'], jsonTransferType, 'L_FBS016', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_TRANSFER_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FBS016'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 입출유형
            gfnma_setComSelect(['gvwDetail'], jsonErrorCode, 'L_FBS012', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 기업분류
            gfnma_setComSelect(['gvwDetail'], jsonComType, 'L_COM030', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['gvwAct'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 사용자
            gfnma_setComSelect(['gvwAct'], jsonUser, 'L_USER', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'USER_ID', 'USER_NAME', 'Y', ''),
            // 지불방식
            gfnma_setComSelect(['gvwAct'], jsonPayMethod, 'L_FIM073', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_TERM_CODE', 'PAY_TERM_NAME', 'Y', ''),
            // 지급사유코드
            gfnma_multiSelectInit({
                target			: ['#PAY_REASON']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_COM062'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "코드명", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 송금사유코드
            gfnma_multiSelectInit({
                target			: ['#SEND_REASON']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_COM063'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "코드명", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 가격조건
            gfnma_multiSelectInit({
                target			: ['#PRICE_CONDITION']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_COM065'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "코드명", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 수입용도코드
            gfnma_multiSelectInit({
                target			: ['#IMPORT_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_COM066'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "코드명", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 입금처
            gfnma_setComSelect([''], jsonPayerName, 'L_COMP_ID', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CS_CODE', 'CS_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDetail';
        SBGridProperties.id 				= 'gvwDetail';
        SBGridProperties.jsonref 			= 'jsonFinancialTransferList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHECK_YN', 			        type:'checkbox',  	width:'40px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '115px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["등록일"],       ref: 'TXN_DATE', 		type:'inputdate',  	width:'76px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["처리일"],       ref: 'PROCESS_DATE', 		type:'inputdate',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["등록시간"],       ref: 'TXN_TIME', 		type:'inputdate',  	width:'64px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["등록회차"],         ref: 'TRANS_COUNT',    type:'output',  	width:'64px',  style:'text-align:left'},
            {caption: ["승인상태"], 		ref: 'TXN_STATUS',   	    type:'combo', style:'text-align:left' ,width: '85px',
                typeinfo: {
                    ref			: 'jsonStatusCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["전표상태"], 		ref: 'DOC_STATUS',   	    type:'combo', style:'text-align:left' ,width: '76px',
                typeinfo: {
                    ref			: 'jsonStatusCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["이체처리결과"], 		ref: 'PROCESS_YN',   	    type:'combo', style:'text-align:left' ,width: '90px',
                typeinfo: {
                    ref			: 'jsonProcessYn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["에러메세지"],         ref: 'ERROR_MESSAGE',    type:'output',  	width:'99px',  style:'text-align:left'},
            {caption: ["전문번호"],         ref: 'FIRM_NO',    type:'output',  	width:'76px',  style:'text-align:left'},
            {caption: ["통화"],         ref: 'CURRENCY_CODE',    type:'output',  	width:'76px',  style:'text-align:left'},
            {caption: ["지급전표번호"],         ref: 'DOC_NAME',    type:'output',  	width:'109px',  style:'text-align:left'},
            {caption: ["전표 제목"],         ref: 'DOC_DESCRIPTION',    type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["거래처코드"],         ref: 'PAYER_ID',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["거래처명"],         ref: 'PAYER_NAME',    type:'output',  	width:'99px',  style:'text-align:left'},
            {caption: ["예금주"],         ref: 'PAYER_BANK_ACCOUNT_OWNER',    type:'output',  	width:'101px',  style:'text-align:left'},
            {caption: ["이체금액"],         ref: 'TXN_AMT',    type:'output',  	width:'140px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["입금은행"], 		ref: 'PAYER_BANK_CODE',   	    type:'combo', style:'text-align:left' ,width: '90px',
                typeinfo: {
                    ref			: 'jsonBankCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["입금은행명"],         ref: 'PAYER_BANK_NAME',    type:'output',  	width:'87px',  style:'text-align:left'},
            {caption: ["입금계좌"],         ref: 'PAYER_BANK_ACCOUNT',    type:'output',  	width:'130px',  style:'text-align:left'},
            {caption: ["계좌코드"],         ref: 'DEPOSIT_CODE',    type:'output',  	width:'99px',  style:'text-align:left'},
            {caption: ["출금은행"],         ref: 'BANK_CODE',    type:'output',  	width:'76px',  style:'text-align:left'},
            {caption: ["출금은행명"],         ref: 'BANK_NAME',    type:'output',  	width:'101px',  style:'text-align:left'},
            {caption: ["출금계좌(회사)"],         ref: 'BANK_ACCOUNT_NO',    type:'output',  	width:'160px',  style:'text-align:left'},
            {caption: ["부가세 고유번호"],         ref: 'BANK_UNIQUE_NO',    type:'output',  	width:'118px',  style:'text-align:left'},
            {caption: ["순번"],         ref: 'TXN_SEQ',    type:'output',  	width:'49px',  style:'text-align:left'},
            {caption: ["처리예정일"],         ref: 'PLANNED_PAY_DATE',    type:'output',  	width:'90px',  style:'text-align:left'},
            {caption: ["입출유형"], 		ref: 'TRANSFER_TYPE',   	    type:'combo', style:'text-align:left' ,width: '97px',
                typeinfo: {
                    ref			: 'jsonTransferType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["예약여부"],         ref: 'RESERVE_YN',    type:'output',  	width:'66px',  style:'text-align:left'},
            {caption: ["지급구분"],         ref: 'PAYROLL_FLAG',    type:'output',  	width:'60px',  style:'text-align:left'},
            {caption: ["입금적요"],         ref: 'IN_PRINT',    type:'output',  	width:'118px',  style:'text-align:left'},
            {caption: ["출금적요"],         ref: 'OUT_PRINT',    type:'output',  	width:'115px',  style:'text-align:left'},
            {caption: ["출금계좌주"],         ref: 'BANK_OWNER',    type:'output',  	width:'76px',  style:'text-align:left'},
            {caption: ["수수료"],         ref: 'FEE_AMT',    type:'output',  	width:'76px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["EB여부"],         ref: 'EB_USED',    type:'output',  	width:'76px',  style:'text-align:left'},
            {caption: ["입력시간"],       ref: 'INSERT_TIME', 		type:'inputdate',  	width:'160px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["수정시간"],       ref: 'UPDATE_TIME', 		type:'inputdate',  	width:'160px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["거래ID"],         ref: 'TREASURY_ID',    type:'output',  	width:'76px',  style:'text-align:left'},
            {caption: ["거래번호"],         ref: 'FBS_NO',    type:'output',  	width:'101px',  style:'text-align:left'},
            {caption: ["수취인전문번호"],         ref: 'FIRM_PAYEE_TRF_NO',    type:'output',  	width:'115px',  style:'text-align:left'},
            {caption: ["수취인전문일자"],       ref: 'FIRM_PAYEE_DATE', 		type:'inputdate',  	width:'106px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["수취인명"],         ref: 'FIRM_PAYEE_NAME',    type:'output',  	width:'99px',  style:'text-align:left'},
            {caption: ["수취인조회결과"], 		ref: 'FIRM_PAYEE_ERROR_CODE',   	    type:'combo', style:'text-align:left' ,width: '99px',
                typeinfo: {
                    ref			: 'jsonErrorCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["승인자"],         ref: 'CONFIRM_EMP_CODE',    type:'output',  	width:'76px',  style:'text-align:left'},
            {caption: ["작성자"],         ref: 'USER_NAME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["전표상태"],         ref: 'DOC_H_DOC_STATUS',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["전표id"],         ref: 'DOC_ID',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["전표배치번호"],         ref: 'DOC_BATCH_NO',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["SOURCE_TYPE"],         ref: 'SOURCE_TYPE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["APPR_COUNT"],         ref: 'APPR_COUNT',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["APPR_ID"],         ref: 'APPR_ID',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["ITEM_ID"],         ref: 'ITEM_ID',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["이체시간"],         ref: 'TXN_TIME_RAW',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["PROXY_EMP_CODE"],         ref: 'PROXY_EMP_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["CMS코드"],         ref: 'CMS_CODE',    type:'output',  	width:'111px',  style:'text-align:left'},
            {caption: ["법인번호"],         ref: 'COMP_REGNO',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["사업자번호"],         ref: 'BIZ_REGNO',    type:'output',  	width:'99px',  style:'text-align:left'},
            {caption: ["기업분류"], 		ref: 'COM_TYPE',   	    type:'combo', style:'text-align:left' ,width: '76px',
                typeinfo: {
                    ref			: 'jsonComType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["대표자명"],         ref: 'CHIEF_NAME',    type:'output',  	width:'99px',  style:'text-align:left'},
            {caption: ["이전승인권자"],         ref: 'BEFORE_APPR_EMP',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["다음승인권자"],         ref: 'NEXT_APPR_EMP',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["이전대행자"],         ref: 'BEFORE_PROXY_EMP',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["다음대행자"],         ref: 'NEXT_PROXY_EMP',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["청구자"],         ref: 'REQUEST_EMP',    type:'output',  	width:'75px',  style:'text-align:left'},
        ];

        gvwDetail = _SBGrid.create(SBGridProperties);
        gvwDetail.bind('click', 'fn_view');
    }

    function fn_createGvwActGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwAct';
        SBGridProperties.id 				= 'gvwAct';
        SBGridProperties.jsonref 			= 'jsonFinancialPlanList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["품의번호"],         ref: 'TREASURY_BATCH_NO',    type:'output',  	width:'76px',  style:'text-align:left'},
            {caption: ["지급요청일"],       ref: 'PLANNED_PAY_DATE', 		type:'inputdate',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["통화"], 		ref: 'CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '69px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["환율"],         ref: 'EXCHANGE_RATE',    type:'output',  	width:'76px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["품의금액"],         ref: 'ORIGINAL_AMOUNT',    type:'output',  	width:'123px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["품의환산금액"],         ref: 'FUNCTIONAL_AMOUNT',    type:'output',  	width:'129px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["작성자"], 		ref: 'INSERT_USERID',   	    type:'combo', style:'text-align:left' ,width: '90px',
                typeinfo: {
                    ref			: 'jsonUser',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["지급방법"], 		ref: 'PAY_METHOD',   	    type:'combo', style:'text-align:left' ,width: '76px',
                typeinfo: {
                    ref			: 'jsonPayMethod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["집행금액"],         ref: 'ORIGINAL_AMOUNT2',    type:'output',  	width:'123px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["집행원화금액"],         ref: 'FUNCTIONAL_AMOUNT2',    type:'output',  	width:'125px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["적요"],         ref: 'DESCRIPTION',    type:'output',  	width:'300px',  style:'text-align:left'},
            {caption: ["TREASURY_ID"],         ref: 'TREASURY_ID',    type:'output',  	width:'76px',  style:'text-align:left', hidden: true},
            {caption: ["TREASURY_LINE_NUM"],         ref: 'TREASURY_LINE_NUM',    type:'output',  	width:'76px',  style:'text-align:left', hidden: true},
            {caption: ["DOC_BATCH_NO"],         ref: 'DOC_BATCH_NO',    type:'output',  	width:'76px',  style:'text-align:left', hidden: true},
            {caption: ["DOC_ID"],         ref: 'DOC_ID',    type:'output',  	width:'76px',  style:'text-align:left', hidden: true},
            {caption: ["DOC_STATUS"],         ref: 'DOC_STATUS',    type:'output',  	width:'76px',  style:'text-align:left', hidden: true},
        ];

        gvwAct = _SBGrid.create(SBGridProperties);
    }

    const fn_findCsCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_CUSTOMER_CS_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_CUSTOMER_CS_NAME"));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var replaceText2 	= "_BIZ_REGNO_";
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%' AND BIZ_REGNO LIKE '%"+ replaceText2 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CS_PURCHASE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드", "거래처명", "사업자번호" ]
            ,searchInputFields		: ["CS_CODE", "CS_NAME", "BIZ_REGNO"]
            ,searchInputValues		: [searchCode, searchName, ""]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호", "대표자", "업태", "종목", "주소", "전화", "팩스", "지급기준", "지급기준명", "지급방법", "통화"]
            ,tableColumnNames		: ["CS_CODE" , "CS_NAME", "BIZ_REGNO", "CHIEF_NAME", "BIZ_CATEGORY", "BIZ_ITEMS", "ADDRESS", "TEL", "FAX", "PAY_TERM_CODE", "PAY_TERM_NAME", "PAY_METHOD", "CURRENCY_CODE"]
            ,tableColumnWidths		: ["90px", "150px", "130px", "80px", "100px", "100px", "200px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_CUSTOMER_CS_NAME', data.CS_NAME);
                SBUxMethod.set('SRCH_CUSTOMER_CS_CODE', data.CS_CODE);
            },
        });
    }

    var fn_findPayCurrency = function () {
        var TRANS_COUNT = gfn_nvl(SBUxMethod.get("SRCH_TRANS_COUNT"));
        var replaceText0 = "_TRANS_COUNT_";
        var replaceText1 = "_TXN_DATE_";
        var strWhereClause = "AND AA.TRANS_COUNT LIKE '%" + replaceText0 + "%' AND AA.TXN_DATE LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '전송회차');
        compopup1({
            compCode: gv_ma_selectedApcCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_BANK_TRANS'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions: ["전송회차", "등록시간"]
            , searchInputFields: ["TRANS_COUNT", "TXN_DATE"]
            ,searchInputTypes: ["input", "input"]
            , searchInputValues: [TRANS_COUNT, gfn_dateToTime(new Date())]
            , height: '200px'
            , tableHeader: ["전송회차", "등록시간"]
            , tableColumnNames: ["TRANS_COUNT", "TXN_TIME"]
            , tableColumnWidths: ["60px", "65px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('SRCH_TRANS_COUNT', data.TRANS_COUNT);
                SBUxMethod.set('SRCH_TXN_TIME', data.TXN_TIME);
            },
        });
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        let initObject = localStorage.getItem("callMain");
        await fn_initSBSelect();
        fn_createGvwDetailGrid();
        fn_createGvwActGrid();

        if(!gfn_isEmpty(initObject)){
            initObject = JSON.parse(initObject);
            localStorage.removeItem("callMain");

            await fn_onload(initObject);
        } else {
            await fn_onload();
        }
    });

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

    var fn_mailingList = function() {
        SBUxMethod.attr('modal-comPopCom5500', 'header-title', '메일링 리스트');
        SBUxMethod.openModal('modal-comPopCom5500');
        com5500Popup({
            contact_group			: 'FIRMBANK_REQ'
            ,comp_code				: gv_ma_selectedApcCd
            ,client_code			: gv_ma_selectedClntCd
        });
    }

    window.addEventListener('message', async function(event){
        let obj = event.data;
        if(!gfn_isEmpty(obj)){
            await fn_onload(obj);
        } else {
            await fn_onload();
        }
    });

    // 행추가
    const fn_addRow = function () {
        var iCnt = 0;
        for (var i = 0; i < jsonFinancialTransferList.length; i++) {
            if (gvwDetail.getCellData((i+1), gvwDetail.getColRef("TXN_STATUS")) == "5" || gvwDetail.getCellData((i+1), gvwDetail.getColRef("TXN_STATUS")) == "3") {
                iCnt++;
            }
        }

        if (iCnt > 0) {
            gfn_comAlert("E0000", "승인중이거나 승인완료상태에서는 행추가를 할 수 없습니다.")
            return;
        }

        SBUxMethod.attr('modal-comPopFbs2040', 'header-title', '당/타행 이체');
        SBUxMethod.openModal('modal-comPopFbs2040');
        fbs2040Popup({
            DEPOSIT_CODE : "",
            DEPOSIT_NAME : "",
            TRANSFER_TYPE : gfn_nvl(gfnma_multiSelectGet('#SRCH_TRANSFER_TYPE')),
            callback: function(data) {
                SBUxMethod.closeModal('modal-comPopFbs2040');
            }
        });
    }

    // 행삭제
    const fn_deleteRow = async function () {
        if (gvwDetail.getRow() < 0)
            return;

        let iDelCnt = 0;
        let iRowCnt = jsonFinancialTransferList.length + 1;

        let gvwDetailCheckedList = gvwDetail.getCheckedRows(gvwDetail.getColRef("CHECK_YN"), true);

        gvwDetailCheckedList.forEach((item, index) => {
            if (gvwDetail.getRowStatus(item) == "1" || gvwList.getRowStatus(item) == "3") {
                gvwDetail.deleteRow(item);
            } else {
                if ((gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("PROCESS_YN"))) == "A" || gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("PROCESS_YN"))) == "N")
                    && gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("ERROR_MESSAGE"))) != "VTIM") {
                    iDelCnt++;
                } else {
                    gfn_comAlert("E0000", "자금이체완료나 타임아웃(VTIM)상태에서는 삭제가 불가능합니다.");
                    return;
                }
            }
        });

        if (iDelCnt > 0) {
            if (gfn_comConfirm("Q0000", "정말 삭제하시겠습니까? 삭제하시려면 예를 클릭하세요.")) {
                if (fnSET_P_FBS2010_S("D")) {
                    if (jsonFinancialTransferList.length < 1) {
                        if (bTransCountSelect) {
                            let strMaxTransCount = "";
                            let strtxn_time = "";
                            let strtxn_time_raw = "";

                            await fnQRY_P_FBS2010_Q("TRANS_COUNT");

                            if (dtTransCnt == null || dtTransCnt.Rows.Count < 1) {
                                return;
                            }

                            for(const dr in dtTransCnt) {
                                strMaxTransCount = gfn_nvl(dr["MAX_TRANS_COUNT"]);
                                strtxn_time = gfn_nvl(dr["TXN_TIME"]);
                                strtxn_time_raw = gfn_nvl(dr["TXN_TIME_RAW"]);
                            }

                            if (gfn_nvl(strMaxTransCount) != "") {
                                SBUxMethod.set("SRCH_TRANS_COUNT", strMaxTransCount);
                                SBUxMethod.set("SRCH_TXN_TIME_RAW", strtxn_time_raw);
                                SBUxMethod.set("SRCH_TXN_TIME", strtxn_time);

                                await fn_search();
                            } else {
                                jsonFinancialTransferList.length = 0;
                                jsonFinancialPlanList.length = 0;
                                gvwDetail.rebuild();
                                gvwAct.rebuild();
                            }
                        }
                    }
                    jsonFinancialPlanList.length = 0;
                    gvwAct.rebuild();

                    await fn_search();
                }
            }
        }
    }

    const fn_batchAllInPrint = async function () {
        var strin_print_a = gfn_nvl(SBUxMethod.get("IN_PRINT_A"));
        let iCnt = 0;

        if (strin_print_a == "") {
            gfn_comAlert("E0000", "입금적요는 필수입력항목입니다.");
            return;
        }

        let gvwDetailCheckedList = gvwDetail.getCheckedRows(gvwDetail.getColRef("CHECK_YN"), true);

        gvwDetailCheckedList.forEach((item, index) => {
            if (gvwDetail.getCellData(item, gvwDetail.getColRef("PROCESS_YN")) == "A") {
                iCnt++;
            }
        });

        if (iCnt == 0) {
            gfn_comAlert("E0000", "변경하고자 하는 대상을 선택 후 조건 변경 적용하십시오.");
            return;
        } else {
            gvwDetailCheckedList.forEach((item, index) => {
                if (gvwDetail.getCellData(item, gvwDetail.getColRef("PROCESS_YN")) == "A") {
                    gvwDetail.setCellData(item, gvwDetail.getColRef("IN_PRINT"), strin_print_a);
                }
            });
        }
    }

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 신규
    function cfn_add() {
        fn_create();
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

    // 결재처리
    function cfn_appr() {
        fn_approval();
    }

    const fn_onload = async function (parentParameter) {
        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);
        SBUxMethod.set("FEE_CHARGER", "1");
        SBUxMethod.set("FOREIGN_GB", "2");
        SBUxMethod.set("SRCH_MULTI_CS_YN", "N");
        SBUxMethod.set("SRCH_MULTI_A_YN", "N");
        gfnma_multiSelectSet('#SRCH_FBS_SERVICE', 'SUB_CODE', 'CODE_NAME', "ECBANK");
        gfnma_multiSelectSet('#SRCH_PAY_GUBUN', 'SUB_CODE', 'CODE_NAME', "10");

        if (parentParameter) {
            bPopUpFlag = true;

            if (parentParameter.hasOwnProperty("TYPE")) {
                if (gfn_nvl(parentParameter["TYPE"]) == "Q1") {
                    if (parentParameter.hasOwnProperty("TXN_DATE")) {
                        SBUxMethod.set("SRCH_TXN_DATE", gfn_nvl(parentParameter["TXN_DATE"]));
                    }

                    if (parentParameter.hasOwnProperty("TXN_TIME")) {
                        SBUxMethod.set("SRCH_TXN_TIME", gfn_nvl(parentParameter["TXN_TIME"]));
                        SBUxMethod.set("SRCH_TXN_TIME_RAW", gfn_nvl(parentParameter["TXN_TIME"]));
                    }

                    if (parentParameter.hasOwnProperty("TRANS_COUNT")) {
                        SBUxMethod.set("SRCH_TRANS_COUNT", gfn_nvl(parentParameter["TRANS_COUNT"]));
                    }

                    if (gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE")) != "" && gfn_nvl(SBUxMethod.get("SRCH_TXN_TIME")) != "") {
                        let query = "SELECT min(aa.trans_count)  as  trans_count ";
                        query += " FROM(SELECT ";
                        query += " TO_CHAR(TO_DATE(a.txn_date, 'YYYYMMDD'), 'YYYY-MM-DD') as txn_date ";
                        query += " , TO_CHAR(TO_DATE(a.txn_time, 'HH24:MI:SS'), 'HH24:MI:SS') as txn_time ";
                        query += " , a.txn_time as txn_time_raw ";
                        query += " , a.txn_date as txn_date_raw ";
                        query += " , dense_rank() over(PARTITION BY a.txn_date order by a.txn_time) as trans_count";
                        query += " FROM FBSBANKTXN a ";
                        query += " where a.txn_date = '" + gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE")) + "' ";
                        query += " group by a.txn_date ";
                        query += " , a.txn_time) aa ";
                        query += " where aa.txn_date_raw = '" + gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE")) + "' ";
                        query += " and aa.txn_time_raw = '" + gfn_nvl(SBUxMethod.get("SRCH_TXN_TIME")) + "'";

                        var paramObj = {
                            TRANS_COUNT: query
                        }

                        const postJsonPromise = gfn_postJSON("/fi/ftr/pay/selectFbs2010TransCount.do", paramObj);

                        const data = await postJsonPromise;

                        try {
                            if (_.isEqual("S", data.resultStatus)) {
                                SBUxMethod.set("SRCH_TRANS_COUNT", Number(gfn_nvl(data.TRANS_COUNT)));
                                gfnma_multiSelectSet('#SRCH_FBS_SERVICE', 'SUB_CODE', 'CODE_NAME', "ECBANK");
                                await fn_search();
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
                } else if (parentParameter.hasOwnProperty("TYPE") && gfn_nvl(parentParameter["TYPE"]) != "N") {

                    bTransCountSelect = false;

                    if (parentParameter.hasOwnProperty("TXN_DATE")) {
                        SBUxMethod.set("SRCH_TXN_DATE", gfn_nvl(parentParameter["TXN_DATE"]));
                    }

                    if (parentParameter.hasOwnProperty("TXN_TIME")) {
                        SBUxMethod.set("SRCH_TXN_TIME", gfn_nvl(parentParameter["TXN_TIME"]));
                    }

                    if (parentParameter.hasOwnProperty("TXN_TIME_RAW")) {
                        SBUxMethod.set("SRCH_TXN_TIME_RAW", gfn_nvl(parentParameter["TXN_TIME"]));
                    }

                    if (parentParameter.hasOwnProperty("TRANS_COUNT")) {
                        SBUxMethod.set("SRCH_TRANS_COUNT", gfn_nvl(parentParameter["TRANS_COUNT"]));
                    }

                    if (parentParameter.hasOwnProperty("TXN_ID")) {
                        var strTXN_ID = parentParameter["TXN_ID"].ToString();
                    }

                    if (parentParameter.hasOwnProperty("DEPOSIT_CODE")) {
                        SBUxMethod.set("SRCH_DEPOSIT_CODE", gfn_nvl(parentParameter["DEPOSIT_CODE"]));
                    }

                    if (parentParameter.hasOwnProperty("BANK_CODE")) {
                        SBUxMethod.set("SRCH_BANK_CODE", gfn_nvl(parentParameter["BANK_CODE"]));
                    }

                    if (parentParameter.hasOwnProperty("FI_ORG_CODE")) {
                        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', gfn_nvl(parentParameter["FI_ORG_CODE"]));
                    }

                    bTransCountSelect = true;
                }
            }
        } else {
            bPopUpFlag = false;
            SBUxMethod.set("SRCH_TXN_DATE", gfn_dateToYmd(new Date())); // TODO : GetServerDateTime
            SBUxMethod.set("SRCH_TXN_TIME_RAW", "");
            SBUxMethod.set("SRCH_TRANS_COUNT", "");
            SBUxMethod.set("SRCH_TXN_TIME", "");
            gfnma_multiSelectSet('#SRCH_PROCESS_YN', 'SUB_CODE', 'CODE_NAME', "A");
        }
    }

    const fn_view = async function () {
        if (bDetailSelect) {
            if (gvwDetail.getRow() < 0)
                return;

            fnQRY_P_FBS2010_Q("DETAIL");
            fnQRY_P_FBS2010_Q("DETAIL1");

            if (gfn_nvl(SBUxMethod.get("SRCH_TXN_STATUS1")) == "1") {
                SBUxMethod.attr("btnTxnComplete", "disabled", "true");
                SBUxMethod.attr("btnRetry", "disabled", "true");
                SBUxMethod.attr("btnResultQuery", "disabled", "true");

                // SessionInfo.IsTrUser 추가
                if (gfn_nvl(SBUxMethod.get("SRCH_INSERT_USERID")) == p_userID || p_isTrUser == true || gfn_nvl(SBUxMethod.get("SRCH_PROXY_EMP_CODE")) == p_empCode)
                    $("#main-btn-appr").attr('disabled', 'false');
                else
                    $("#main-btn-appr").attr('disabled', 'true');

                SBUxMethod.attr("btnAddRow", "disabled", "false");
                SBUxMethod.attr("btnDeleteRow", "disabled", "false");
            } else if (gfn_nvl(SBUxMethod.get("SRCH_TXN_STATUS1")) == "3") {
                SBUxMethod.attr("btnTxnComplete", "disabled", "true");
                SBUxMethod.attr("btnRetry", "disabled", "true");
                SBUxMethod.attr("btnResultQuery", "disabled", "true");

                // SessionInfo.IsTrManager 추가
                if (gfn_nvl(SBUxMethod.get("SRCH_CONFIRM_EMP_CODE")) == p_empCode || p_isTrManager == true || gfn_nvl(SBUxMethod.get("SRCH_PROXY_EMP_CODE")) == p_empCode || gfn_nvl(SBUxMethod.get("SRCH_PROXY_EMP_CODE")) == p_empCode) {
                    $("#main-btn-appr").attr('disabled', 'false');
                } else {
                    $("#main-btn-appr").attr('disabled', 'true');
                }

                SBUxMethod.attr("btnAddRow", "disabled", "true");
                SBUxMethod.attr("btnDeleteRow", "disabled", "true");
            } else if (gfn_nvl(SBUxMethod.get("SRCH_TXN_STATUS1")) == "5") {
                //승인완료
                $("#main-btn-appr").attr('disabled', 'true');
                SBUxMethod.attr("btnRetry", "disabled", "false");
                SBUxMethod.attr("btnResultQuery", "disabled", "false");

                //회계팀장일때에만 활성화
                if ( (p_isAccountChief)  || (p_isTrUser) )
                    SBUxMethod.attr("btnTxnComplete", "disabled", "false");
                else
                    SBUxMethod.attr("btnTxnComplete", "disabled", "true");

                SBUxMethod.attr("btnAddRow", "disabled", "true");
                SBUxMethod.attr("btnDeleteRow", "disabled", "false");
            } else {
                $("#main-btn-appr").attr('disabled', 'false');
                SBUxMethod.attr("btnTxnComplete", "disabled", "true");
                SBUxMethod.attr("btnRetry", "disabled", "true");
                SBUxMethod.attr("btnResultQuery", "disabled", "true");

                SBUxMethod.attr("btnAddRow", "disabled", "false");
                SBUxMethod.attr("btnDeleteRow", "disabled", "false");
            }

            if (parseInt(gfn_nvl(SBUxMethod.get("SRCH_APPR_ID")) == "" ? "0" : gfn_nvl(SBUxMethod.get("SRCH_APPR_ID"))) != 0)
                $("#main-btn-appr").attr('disabled', 'false');
            else
                $("#main-btn-appr").attr('disabled', 'true');
        }
    }

    const fn_create = async function () {
        if (jsonFinancialTransferList.length == 0) {
            SBUxMethod.set("SRCH_TXN_DATE", "");
            SBUxMethod.set("SRCH_TXN_TIME_RAW", "");
            SBUxMethod.set("SRCH_TRANS_COUNT", "");
            SBUxMethod.set("SRCH_TXN_TIME", "");

            //gfnma_uxDataClear('#panHeader');
            jsonFinancialTransferList.length = 0;
            jsonFinancialPlanList.length = 0;
            gvwDetail.rebuild();
            gvwAct.rebuild();

            $("#main-btn-appr").attr('disabled', 'true');
            SBUxMethod.attr("btnAddRow", "disabled", "false");
            SBUxMethod.attr("btnDeleteRow", "disabled", "false");

            SBUxMethod.set("SRCH_TXN_DATE", gfn_dateToYmd(new Date())); // TODO : GetServerDateTime
            return;
        }

        let bNoCommitRow = false;
        let updatedData = gvwDetail.getUpdateData(true, 'all');

        if(updatedData.length > 0) {
            bNoCommitRow = true;
        }

        //저장할 건이 없을시
        if (!bNoCommitRow) {
            //신규
            SBUxMethod.set("SRCH_TXN_DATE", "");
            SBUxMethod.set("SRCH_TXN_TIME_RAW", "");
            SBUxMethod.set("SRCH_TRANS_COUNT", "");
            SBUxMethod.set("SRCH_TXN_TIME", "");

            //gfnma_uxDataClear('#panHeader');
            jsonFinancialTransferList.length = 0;
            jsonFinancialPlanList.length = 0;
            gvwDetail.rebuild();
            gvwAct.rebuild();

            $("#main-btn-appr").attr('disabled', 'true');
            SBUxMethod.attr("btnAddRow", "disabled", "false");
            SBUxMethod.attr("btnDeleteRow", "disabled", "false");

            SBUxMethod.set("SRCH_TXN_DATE", gfn_dateToYmd(new Date())); // TODO : GetServerDateTime
        } else {
            if (gfn_comConfirm("Q0000", "저장하지 않은 데이터가 있습니다. 계속 진행 하시겠습니까?")) {
                //신규
                SBUxMethod.set("SRCH_TXN_DATE", "");
                SBUxMethod.set("SRCH_TXN_TIME_RAW", "");
                SBUxMethod.set("SRCH_TRANS_COUNT", "");
                SBUxMethod.set("SRCH_TXN_TIME", "");

                //gfnma_uxDataClear('#panHeader');
                jsonFinancialTransferList.length = 0;
                jsonFinancialPlanList.length = 0;
                gvwDetail.rebuild();
                gvwAct.rebuild();

                $("#main-btn-appr").attr('disabled', 'true');
                SBUxMethod.attr("btnAddRow", "disabled", "false");
                SBUxMethod.attr("btnDeleteRow", "disabled", "false");

                SBUxMethod.set("SRCH_TXN_DATE", gfn_dateToYmd(new Date())); // TODO : GetServerDateTime
            }
        }
    }

    const fn_save = async function () {
        if (jsonFinancialTransferList.length == 0) {
            gfn_comAlert("E0000", "저장할 데이터가 없습니다.");
            return;
        }

        if (gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE")) == "") {
            gfn_comAlert("E0000", "등록일자가 생성되지 않아 저장할 수 없습니다.");
            return;
        }

        if (fnSET_P_FBS2010_S("")) {
            if (bTransCountSelect) {
                let strMaxTransCount = "";
                let strtxn_time = "";
                let strtxn_time_raw = "";

                await fnQRY_P_FBS2010_Q("TRANS_COUNT");

                if (dtTransCnt == null || dtTransCnt.length < 1) {
                    return;
                }

                for(const dr in dtTransCnt) {
                    strMaxTransCount = gfn_nvl(dr["MAX_TRANS_COUNT"]);
                    strtxn_time = gfn_nvl(dr["TXN_TIME"]);
                    strtxn_time_raw = gfn_nvl(dr["TXN_TIME_RAW"]);
                }

                if (gfn_nvl(strMaxTransCount) != "") {
                    SBUxMethod.set("SRCH_TRANS_COUNT", strMaxTransCount);
                    SBUxMethod.set("SRCH_TXN_TIME_RAW", strtxn_time_raw);
                    SBUxMethod.set("SRCH_TXN_TIME", strtxn_time);

                    await fn_search();
                } else {
                    jsonFinancialTransferList.length = 0;
                    jsonFinancialPlanList.length = 0;
                    gvwDetail.rebuild();
                    gvwAct.rebuild();
                }
            }

            await fn_search();
        }
        fnSET_P_FBS2010_S1("U");
    }

    const fn_delete = async function () {
        if (gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE1")) == "") {
            return;
        }

        if (gfn_comConfirm("Q0000", "정말 삭제하시겠습니까? 삭제하시려면 예를 클릭하세요.")) {
            for (var i = 0; i < jsonFinancialTransferList.length; i++) {
                if(gvwDetail.getCellData((i+1), gvwDetail.getColRef("PROCESS_YN")) != "A" && gvwDetail.getCellData((i+1), gvwDetail.getColRef("PROCESS_YN")) != "N") {
                    gfn_comAlert("E0000", "자금이체 상태에서는 삭제가 불가능합니다.")
                    return;
                }
            }

            if (fnSET_P_FBS2010_S("D1")) {
                jsonFinancialTransferList.length = 0;
                jsonFinancialPlanList.lneght = 0;
                gvwDetail.rebuild();
                gvwAct.rebuild();
            }
        }

        fn_create();
    }

    const fn_search = async function () {
        jsonFinancialPlanList.length = 0;
        fnQRY_P_FBS2010_Q("Q");
    }

    const fn_approval = async function () {
        let strApprId = gvwDetail.getCellData(gvwDetail.getRow(), gvwDetail.getColRef("APPR_ID"));

        if (gfn_nvl(SBUxMethod.get("SRCH_TXN_TIME1")) == "")
            return;

        if (gfn_nvl(SBUxMethod.get("SRCH_TRANS_COUNT")) == "") {
            gfn_comAlert("E0000", "결재할 전송회차를 선택하십시요");
            return;
        }

        if (!p_isGW) {
            compopappvmng({
                workType		: strApprId == 0 ? 'TEMPLATE' : 'APPR'	// 상신:TEMPLATE , 승인(반려):APPR
                ,compCode		: gv_ma_selectedApcCd
                ,compCodeNm		: gv_ma_selectedApcNm
                ,clientCode		: gv_ma_selectedClntCd
                ,apprId			: strApprId
                ,sourceNo		: gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE1")) + gfn_nvl(SBUxMethod.get("SRCH_TXN_TIME1"))
                ,sourceType		: "TRF"
                ,empCode		: p_empCode
                ,formID			: p_formId
                ,menuId			: p_menuId
                ,callback       : function(data) {
                    if(data && data.result == "Y") {
                        fn_search();
                    }

                    //최종결재시 자동 이체처리 실행
                    fnQRY_P_FBS2010_Q2("CHECK", strApprId);

                    let strCheck = "";
                    for (const dr in dtCheck) {
                        strCheck = gfn_nvl(dr["CHECK_RESULT"]);
                    }

                    if (strCheck == "Y") {
                        if (gfn_comConfirm("Q0000", "계좌이체를 실행하시겠습니까?")) {
                            fn_fbsSend();
                        }
                    }
                }
            });
        }
    }

    const fn_confimHist = async function () {
        if (gfn_nvl(SBUxMethod.get("SRCH_TXN_TIME1")) == "")
            return;

        var nRow = gvwDetail.getRow();

        SBUxMethod.attr('modal-compopfim3420', 'header-title', '승인결과조회');
        SBUxMethod.openModal('modal-compopfim3420');

        compopfim3420({
            height			: '600px'
            ,param			: {
                p_appr_id	: gvwDetail.getCellData(nRow, gvwDetail.getColRef("APPR_ID"))		//'23'
                ,p_doc_id	: gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE1")) + gfn_nvl(SBUxMethod.get("SRCH_TXN_TIME1"))		//'584'
                ,p_doc_type	: "TRF"	//'AP'
            }
        });
    }

    const fnQRY_P_FBS2010_Q = async function (strWorkType) {
        if (strWorkType == "Q") {
            if (!validateRequired("panHeader")) {
                return false;
            }
        }

        try {
            let FBS_SERVICE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE'));
            let PAY_GUBUN = gfn_nvl(gfnma_multiSelectGet('#SRCH_PAY_GUBUN'));
            let SITE_CODE = gfn_nvl(p_siteCode);
            let TXN_DATE = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE"));
            let TXN_TIME = gfn_nvl(SBUxMethod.get("SRCH_TXN_TIME_RAW"));
            let TREASURY_ID = gfn_nvl(gvwDetail.getCellData(gvwDetail.getRow(), gvwDetail.getColRef("TREASURY_ID"))) == "" ? 0 : parseInt(gfn_nvl(gvwDetail.getCellData(gvwDetail.getRow(), gvwDetail.getColRef("TREASURY_ID"))));
            let FBS_NO = gfn_nvl(gvwDetail.getCellData(gvwDetail.getRow(), gvwDetail.getColRef("FBS_NO"))) == "" ? "" : gfn_nvl(gvwDetail.getCellData(gvwDetail.getRow(), gvwDetail.getColRef("FBS_NO")));
            let PASS_WORD = gfn_nvl(SBUxMethod.get("SRCH_PASSWORD"));
            let BANK_CODE = gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE"));
            let TRANSFER_TYPE = gfn_nvl(gfnma_multiSelectGet('#SRCH_TRANSFER_TYPE'));
            let PROCESS_YN = gfn_nvl(gfnma_multiSelectGet('#SRCH_PROCESS_YN'));
            let PAY_METHOD = gfn_nvl(gfnma_multiSelectGet('#SRCH_PAY_METHOD'));
            let CS_CODE_D = gfn_nvl(SBUxMethod.get("SRCH_MULTI_CS_YN").SRCH_MULTI_CS_YN) == "N" ? gfn_nvl(SBUxMethod.get("SRCH_CUSTOMER_CS_CODE")) : strCsCodeList;
            let DOC_NAME = gfn_nvl(SBUxMethod.get("SRCH_MULTI_A_YN").SRCH_MULTI_A_YN) == "N" ? gfn_nvl(SBUxMethod.get("SRCH_DOC_NAME")) : strAccountCodeList;
            let TXN_STATUS = gfn_nvl(gfnma_multiSelectGet('#SRCH_TXN_STATUS'));

            // 비즈니스 로직 정보
            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_FBS_SERVICE : FBS_SERVICE,
                V_P_PAY_GUBUN : PAY_GUBUN,
                V_P_SITE_CODE : SITE_CODE,
                V_P_TXN_DATE : TXN_DATE,
                V_P_TXN_TIME : TXN_TIME,
                V_P_TREASURY_ID : TREASURY_ID,
                V_P_ARRFBS_NO : '',
                V_P_FBS_NO : FBS_NO,
                V_P_PASS_WORD : PASS_WORD,
                V_P_BANK_CODE : BANK_CODE,
                V_P_TRANSFER_TYPE : TRANSFER_TYPE,
                V_P_PROCESS_YN : PROCESS_YN,
                V_P_PAY_METHOD : PAY_METHOD,
                V_P_CS_CODE_D : CS_CODE_D,
                V_P_DOC_NAME : DOC_NAME,
                V_P_TXN_STATUS : TXN_STATUS,
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: '',
            };

            const postJsonPromise = gfn_postJSON("/fi/ftr/pay/selectFbs2010List.do", {
                getType				: 'json',
                workType			: strWorkType,
                cv_count			: '3',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (strWorkType == "Q") {
                        jsonFinancialTransferList.length = 0;
                        data.cv_1.forEach((item, index) => {
                            const msg = {
                                CHECK_YN : item.CHECK_YN,
                                FBS_NO : item.FBS_NO,
                                SITE_CODE : item.SITE_CODE,
                                SEQ : item.SEQ,
                                TXN_DATE : item.TXN_DATE,
                                TXN_TIME : item.TXN_TIME,
                                TXN_TIME_RAW : item.TXN_TIME_RAW,
                                TRANS_COUNT : item.TRANS_COUNT,
                                TXN_SEQ : item.TXN_SEQ,
                                TRANSFER_TYPE : item.TRANSFER_TYPE,
                                RESERVE_YN : item.RESERVE_YN,
                                DEPOSIT_CODE : item.DEPOSIT_CODE,
                                BANK_CODE : item.BANK_CODE,
                                BANK_NAME : item.BANK_NAME,
                                BANK_ACCOUNT_NO : item.BANK_ACCOUNT_NO,
                                PAYER_BANK_CODE : item.PAYER_BANK_CODE,
                                PAYER_BANK_NAME : item.PAYER_BANK_NAME,
                                PAYER_BANK_ACCOUNT : item.PAYER_BANK_ACCOUNT,
                                CMS_CODE : item.CMS_CODE,
                                TXN_AMT : item.TXN_AMT,
                                PAYER_BANK_ACCOUNT_OWNER : item.PAYER_BANK_ACCOUNT_OWNER,
                                PAYROLL_FLAG : item.PAYROLL_FLAG,
                                IN_PRINT : item.IN_PRINT,
                                OUT_PRINT : item.OUT_PRINT,
                                BANK_OWNER : item.BANK_OWNER,
                                FEE_AMT : item.FEE_AMT,
                                PLANNED_PAY_DATE : item.PLANNED_PAY_DATE,
                                PROCESS_YN : item.PROCESS_YN,
                                PROCESS_DATE : item.PROCESS_DATE,
                                ERROR_MESSAGE : item.ERROR_MESSAGE,
                                EB_USED : item.EB_USED,
                                INSERT_TIME : item.INSERT_TIME,
                                UPDATE_TIME : item.UPDATE_TIME,
                                TREASURY_ID : item.TREASURY_ID,
                                FIRM_NO : item.FIRM_NO,
                                FIRM_PAYEE_TRF_NO : item.FIRM_PAYEE_TRF_NO,
                                FIRM_PAYEE_DATE : item.FIRM_PAYEE_DATE,
                                FIRM_PAYEE_NAME : item.FIRM_PAYEE_NAME,
                                FIRM_PAYEE_ERROR_CODE : item.FIRM_PAYEE_ERROR_CODE,
                                TXN_STATUS : item.TXN_STATUS,
                                INSERT_USERID : item.INSERT_USERID,
                                PAYER_ID : item.PAYER_ID,
                                PAYER_NAME : item.PAYER_NAME,
                                DOC_ID : item.DOC_ID,
                                DOC_NAME : item.DOC_NAME,
                                ITEM_ID : item.ITEM_ID,
                                DOC_BATCH_NO : item.DOC_BATCH_NO,
                                DOC_H_DOC_STATUS : item.DOC_H_DOC_STATUS,
                                DOC_DESCRIPTION : item.DOC_DESCRIPTION,
                                SOURCE_TYPE : item.SOURCE_TYPE,
                                APPR_COUNT : item.APPR_COUNT,
                                APPR_ID : item.APPR_ID,
                                COM_TYPE : item.COM_TYPE,
                                CS_CATEGORY : item.CS_CATEGORY,
                                BIZ_REGNO : item.BIZ_REGNO,
                                COMP_REGNO : item.COMP_REGNO,
                                CHIEF_NAME : item.CHIEF_NAME,
                                CURRENCY_CODE : item.CURRENCY_CODE,
                                CS_NAME : item.CS_NAME,
                                CS_ADDRESS : item.CS_ADDRESS,
                                PAYER_SWIFT_BIC : item.PAYER_SWIFT_BIC,
                                PAYER_BANK_INFO : item.PAYER_BANK_INFO,
                                PAY_REASON : item.PAY_REASON,
                                SEND_REASON : item.SEND_REASON,
                                FEE_CHARGER : item.FEE_CHARGER,
                                FOREIGN_GB : item.FOREIGN_GB,
                                ORDER1_TO_RECEIPT : item.ORDER1_TO_RECEIPT,
                                ORDER2_TO_RECEIPT : item.ORDER2_TO_RECEIPT,
                                ORDER3_TO_RECEIPT : item.ORDER3_TO_RECEIPT,
                                ORDER4_TO_RECEIPT : item.ORDER4_TO_RECEIPT,
                                TRANS_BANK1 : item.TRANS_BANK1,
                                TRANS_BANK2 : item.TRANS_BANK2,
                                TRANS_BANK3 : item.TRANS_BANK3,
                                PRICE_CONDITION : item.PRICE_CONDITION,
                                IMPORT_TYPE : item.IMPORT_TYPE,
                                IMPORT_DOC_NO : item.IMPORT_DOC_NO,
                                HS_CODE : item.HS_CODE,
                                CHARGE_ACCOUNT : item.CHARGE_ACCOUNT,
                                REMARK : item.REMARK,
                                DOC_STATUS : item.DOC_STATUS,
                                REQUEST_EMP : item.REQUEST_EMP,
                                BEFORE_APPR_EMP : item.BEFORE_APPR_EMP,
                                NEXT_APPR_EMP : item.NEXT_APPR_EMP,
                                BEFORE_PROXY_EMP : item.BEFORE_PROXY_EMP,
                                NEXT_PROXY_EMP : item.NEXT_PROXY_EMP,
                                CONFIRM_EMP_CODE : item.CONFIRM_EMP_CODE,
                                PROXY_EMP_CODE : item.PROXY_EMP_CODE,
                                BANK_UNIQUE_NO : item.BANK_UNIQUE_NO,
                            }
                            jsonFinancialTransferList.push(msg);
                        });

                        gvwDetail.rebuild();

                        if (jsonFinancialTransferList.length > 0) {
                            gvwDetail.clickRow(1);
                        } else {
                            jsonFinancialPlanList.length = 0;
                        }
                    } else if (strWorkType == "DETAIL") {
                        jsonFinancialPlanList.length = 0;
                        data.cv_2.forEach((item, index) => {
                            const msg = {
                                TREASURY_BATCH_NO : item.TREASURY_BATCH_NO,
                                TXN_ID : item.TXN_ID,
                                TXN_SEQ : item.TXN_SEQ,
                                PLANNED_PAY_DATE : item.PLANNED_PAY_DATE,
                                CURRENCY_CODE : item.CURRENCY_CODE,
                                ORIGINAL_AMOUNT2 : item.ORIGINAL_AMOUNT2,
                                FUNCTIONAL_AMOUNT2 : item.FUNCTIONAL_AMOUNT2,
                                EXCHANGE_RATE : item.EXCHANGE_RATE,
                                DESCRIPTION : item.DESCRIPTION,
                                ORIGINAL_AMOUNT : item.ORIGINAL_AMOUNT,
                                FUNCTIONAL_AMOUNT : item.FUNCTIONAL_AMOUNT,
                                INSERT_USERID : item.INSERT_USERID,
                                PAY_METHOD : item.PAY_METHOD,
                                DOC_BATCH_NO : item.DOC_BATCH_NO,
                                DOC_ID : item.DOC_ID,
                                DOC_STATUS : item.DOC_STATUS,
                            }
                            jsonFinancialPlanList.push(msg);
                        });

                        gvwAct.rebuild();
                    } else if (strWorkType == "DETAIL1") {
                        var returnData = data.cv_2[0];

                        SBUxMethod.set("CS_NAME", gfn_nvl(returnData.CS_NAME));
                        SBUxMethod.set("CS_ADDRESS", gfn_nvl(returnData.CS_ADDRESS));
                        SBUxMethod.set("PAYER_SWIFT_BIC", gfn_nvl(returnData.PAYER_SWIFT_BIC));
                        SBUxMethod.set("PAYER_BANK_INFO", gfn_nvl(returnData.PAYER_BANK_INFO));
                        gfnma_multiSelectSet('#PAY_REASON', 'SUB_CODE', 'CODE_NAME', gfn_nvl(returnData.PAY_REASON));
                        gfnma_multiSelectSet('#SEND_REASON', 'SUB_CODE', 'CODE_NAME', gfn_nvl(returnData.SEND_REASON));
                        SBUxMethod.set("FEE_CHARGER", gfn_nvl(returnData.FEE_CHARGER));
                        SBUxMethod.set("ORDER1_TO_RECEIPT", gfn_nvl(returnData.ORDER1_TO_RECEIPT));
                        SBUxMethod.set("ORDER2_TO_RECEIPT", gfn_nvl(returnData.ORDER2_TO_RECEIPT));
                        SBUxMethod.set("ORDER3_TO_RECEIPT", gfn_nvl(returnData.ORDER3_TO_RECEIPT));
                        SBUxMethod.set("ORDER4_TO_RECEIPT", gfn_nvl(returnData.ORDER4_TO_RECEIPT));
                        SBUxMethod.set("TRANS_BANK1", gfn_nvl(returnData.TRANS_BANK1));
                        SBUxMethod.set("TRANS_BANK2", gfn_nvl(returnData.TRANS_BANK2));
                        SBUxMethod.set("TRANS_BANK3", gfn_nvl(returnData.TRANS_BANK3));
                        gfnma_multiSelectSet('#PRICE_CONDITION', 'SUB_CODE', 'CODE_NAME', gfn_nvl(returnData.PRICE_CONDITION));
                        gfnma_multiSelectSet('#IMPORT_TYPE', 'SUB_CODE', 'CODE_NAME', gfn_nvl(returnData.IMPORT_TYPE));
                        SBUxMethod.set("IMPORT_DOC_NO", gfn_nvl(returnData.IMPORT_DOC_NO));
                        SBUxMethod.set("HS_CODE", gfn_nvl(returnData.HS_CODE));
                        SBUxMethod.set("CHARGE_ACCOUNT", gfn_nvl(returnData.CHARGE_ACCOUNT));
                        SBUxMethod.set("REMARK", gfn_nvl(returnData.REMARK));

                    } else if (strWorkType == "TRANS_COUNT") {
                        if (data.cv_3.length >= 1) {
                            dtTransCnt = data.cv_3[0];
                        }
                    }
                    return true;
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
        } catch (e){
            console.error(e);
            return false;
        }
    }

    const fnQRY_P_FBS2010_Q2 = async function (strWorkType, strApprID) {
        if (strWorkType == "Q") {
            if (!SBUxMethod.validateRequired({group_id:'panHeader'})) {
                return false;
            }
        }

        try {
            // 비즈니스 로직 정보
            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_APPR_ID : parseInt(strApprID),
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: '',
            };

            const postJsonPromise = gfn_postJSON("/fi/ftr/pay/selectFbs2010Check.do", {
                getType				: 'json',
                workType			: strWorkType,
                cv_count			: '1',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.cv_1.length >= 1) {
                        dtCheck = data.cv_1;
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
        } catch (e){
            console.error(e);
            return false;
        }
    }

    const fnQRY_P_FBSBANKTXN_Q = async function (strWorkType) {
        if (!validateRequired("panHeader")) {
            return false;
        }

        try {
            let arrfbs_no = "";
            let strFBS_WORK_TYPE = "";

            if (strWorkType == "BANKING" || strWorkType == "TAXING" || strWorkType == "TAXING_NO" || strWorkType == "RETRY" || strWorkType == "CANCEL") {
                //이체
                let gvwDetailCheckedList = gvwDetail.getCheckedRows(gvwDetail.getColRef("CHECK_YN"), true);

                gvwDetailCheckedList.forEach((item, index) => {
                    if (gvwDetail.getCellData(item, gvwDetail.getColRef("ERROR_MESSAGE")) != "VTIM") {
                        //응답시간 초과 아닌건만
                        if (arrfbs_no != "")
                            arrfbs_no += "|";

                        arrfbs_no += gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("FBS_NO")));
                    }
                });

                if (strWorkType == "BANKING") {
                    strFBS_WORK_TYPE = "BANKTXN";
                } else if (strWorkType == "TAXING") {
                    strFBS_WORK_TYPE = "TAXTXN";
                } else if (strWorkType == "TAXING_NO") {
                    strFBS_WORK_TYPE = "TAXTXN_NO";
                } else if (strWorkType == "CANCEL") {
                    strFBS_WORK_TYPE = "BANKCANCEL";
                } else {
                    strFBS_WORK_TYPE = "BANKTXN";
                }
            }

            // 비즈니스 로직 정보
            let BANK_CODE = gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE"));
            let FBS_SERVICE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE'));
            let TXN_DATE = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE"));
            let PASSWORD = gfn_nvl(SBUxMethod.get("SRCH_PASSWORD"));
            let PROCESS_YN = gfn_nvl(gfnma_multiSelectGet('#SRCH_PROCESS_YN'));

            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_BANK_CODE : BANK_CODE,
                V_P_FBS_SERVICE : FBS_SERVICE,
                V_P_FBS_WORK_TYPE : strFBS_WORK_TYPE,
                V_P_TXN_DATE : TXN_DATE,
                V_P_PASSWORD : PASSWORD,
                V_P_ARR_FBS_NO : arrfbs_no,
                V_P_PROCESS_YN : PROCESS_YN,
                V_P_INTERFACEID : "",
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: '',
            };

            const postJsonPromise = gfn_postJSON("/fi/ftr/pay/selectFbsbanktxnList.do", {
                getType				: 'json',
                workType			: strWorkType,
                cv_count			: '1',
                params				: gfnma_objectToString(paramObj)
            });
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (strWorkType == "BANKING" || strWorkType == "TAXING" || strWorkType == "TAXING_NO" || strWorkType == "RETRY" || strWorkType == "CANCEL") {
                        if (data.cv_1.length >= 1) {
                            dtFirmbanking = data.cv_1;
                        }
                    }
                    return true;
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
            return false;
        }
    }

    const fnSET_P_FBS2010_S_FIRM = async function(strWorkType, strfbs_no, strtreasury_id, strbank_code, strplusminus,
                                                  strbalance_amt, strfee_amt, strerror_code, strfirm_no, strfirm_payee_name,
                                                  strfirm_payee_error_code) {
        try {
            // 비즈니스 로직 정보
            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_FBS_NO : strfbs_no,
                V_P_DOC_ID : "",
                V_P_DOC_ITEM_ID : "",
                IV_P_TREASURY_ID : parseInt(strtreasury_id.trim()),
                V_P_BANK_CODE : strbank_code,
                V_P_PLUS_MINUS : strplusminus,
                V_P_BALANCE_AMT : Number(strbalance_amt.trim() == "" ? "0" : strbalance_amt.trim()),
                V_P_FEE_AMT : Number(strfee_amt.trim() == "" ? "0" : strfee_amt.trim()),
                V_P_FBS_TXN_TIME : "",
                V_P_ERROR_MESSAGE : strerror_code,
                V_P_FIRM_NO : strfirm_no,
                V_P_FIRM_PAYEE_NAME : strfirm_payee_name,
                V_P_FIRM_PAYEE_ERROR_CODE : strfirm_payee_error_code,
                V_P_PAYER_BANK_CODE : "",
                V_P_PAYER_BANK_ACCOUNT_NO : "",
                V_P_BANK_ACCOUNT_NO : "",
                V_P_TRANS_DATE : "",
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: '',
            };

            const postJsonPromise = gfn_postJSON("/fi/ftr/pay/insertFbs2010Firm.do", {
                getType				: 'json',
                workType			: strWorkType,
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    return data.v_returnStr;
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
        } catch (e){
            console.error(e);
            return false;
        }
    }

    const fnSET_P_FBS2010_S = async function(strWorkType) {
        try {
            // 비즈니스 로직 정보
            var updatedData = null;

            if(strWorkType == "D" || strWorkType == "D1") {
                let gvwDetailCheckedList = gvwDetail.getCheckedRows(gvwDetail.getColRef("CHECK_YN"), true);
                gvwDetailCheckedList.forEach((item, index) => {
                    var rowData = {
                        rownum : item,
                        status : 'd',
                        data : gvwDetail.getRowData(item)
                    }

                    updatedData.push(rowData);
                });
            } else {
                updatedData = gvwDetail.getUpdateData(true, 'all');
            }

            if (updatedData == null) {
                return false;
            } else if (updatedData != null && updatedData.length == 0) {
                return true;
            }

            updatedData.forEach((item, index) => {
                const param = {
                    cv_count: '0',
                    getType: 'json',
                    rownum: item.rownum,
                    workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                    params: gfnma_objectToString({
                        V_P_DEBUG_MODE_YN: '',
                        V_P_LANG_ID: '',
                        V_P_COMP_CODE: gv_ma_selectedApcCd,
                        V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                        V_P_CHECK_YN : gfn_nvl(item.data.CHECK_YN),
                        IV_P_FBS_NO : gfn_nvl(item.data.FBS_NO),
                        V_P_SITE_CODE : gfn_nvl(item.data.SITE_CODE),
                        V_P_TXN_DATE : gfn_nvl(item.data.TXN_DATE) == "" ? gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE")) : gfn_nvl(item.data.TXN_DATE),
                        V_P_TXN_TIME : gfn_nvl(item.data.TXN_TIME) == "" ? gfn_nvl(SBUxMethod.get("SRCH_TXN_TIME")) : gfn_nvl(item.data.TXN_TIME),
                        V_P_TXN_SEQ : parseInt(gfn_nvl(item.data.TXN_SEQ)),
                        V_P_TRANSFER_TYPE : gfn_nvl(item.data.TRANSFER_TYPE),
                        V_P_RESERVE_YN : gfn_nvl(item.data.RESERVE_YN),
                        V_P_BANK_ACCOUNT_NO : gfn_nvl(item.data.BANK_ACCOUNT_NO),
                        V_P_PAYER_BANK_CODE : gfn_nvl(item.data.PAYER_BANK_CODE),
                        V_P_PAYER_BANK_ACCOUNT : gfn_nvl(item.data.PAYER_BANK_ACCOUNT),
                        V_P_CMS_CODE : gfn_nvl(item.data.CMS_CODE),
                        V_P_TXN_AMT : Number(gfn_nvl(item.data.TXN_AMT)),
                        V_P_PAYER_BANK_ACCOUNT_OWNER : gfn_nvl(item.data.PAYER_BANK_ACCOUNT_OWNER),
                        V_P_PAYROLL_FLAG : gfn_nvl(item.data.PAYROLL_FLAG),
                        V_P_IN_PRINT : gfn_nvl(item.data.IN_PRINT),
                        V_P_OUT_PRINT : gfn_nvl(item.data.OUT_PRINT),
                        V_P_PROCESS_YN : gfn_nvl(item.data.PROCESS_YN),
                        V_P_TREASURY_ID : parseInt(gfn_nvl(item.data.TREASURY_ID)),
                        V_P_PLANNED_PAY_DATE : gfn_nvl(item.data.PLANNED_PAY_DATE),
                        V_P_DOC_ID : gfn_nvl(item.data.DOC_ID),
                        V_P_ITEM_ID : gfn_nvl(item.data.ITEM_ID),
                        V_P_CURRENCY_CODE : gfn_nvl(item.data.CURRENCY_CODE),
                        V_P_PAYER_ID : gfn_nvl(item.data.PAYER_ID),
                        V_P_CS_NAME : gfn_nvl(SBUxMethod.get("CS_NAME")),
                        V_P_CS_ADDRESS : gfn_nvl(SBUxMethod.get("CS_ADDRESS")),
                        V_P_PAYER_SWIFT_BIC : gfn_nvl(SBUxMethod.get("PAYER_SWIFT_BIC")),
                        V_P_PAYER_BANK_INFO : gfn_nvl(SBUxMethod.get("PAYER_BANK_INFO")),
                        V_P_PAY_REASON : gfn_nvl(gfnma_multiSelectGet("PAY_REASON")),
                        V_P_SEND_REASON : gfn_nvl(gfnma_multiSelectGet("SEND_REASON")),
                        V_P_ORDER1_TO_RECEIPT : gfn_nvl(SBUxMethod.get("ORDER1_TO_RECEIPT")),
                        V_P_ORDER2_TO_RECEIPT : gfn_nvl(SBUxMethod.get("ORDER2_TO_RECEIPT")),
                        V_P_ORDER3_TO_RECEIPT : gfn_nvl(SBUxMethod.get("ORDER3_TO_RECEIPT")),
                        V_P_ORDER4_TO_RECEIPT : gfn_nvl(SBUxMethod.get("ORDER4_TO_RECEIPT")),
                        V_P_TRANS_BANK1 : gfn_nvl(SBUxMethod.get("TRANS_BANK1")),
                        V_P_TRANS_BANK2 : gfn_nvl(SBUxMethod.get("TRANS_BANK2")),
                        V_P_TRANS_BANK3 : gfn_nvl(SBUxMethod.get("TRANS_BANK3")),
                        V_P_FEE_CHARGER : gfn_nvl(SBUxMethod.get("FEE_CHARGER")),
                        V_P_FOREIGN_GB : gfn_nvl(SBUxMethod.get("FOREIGN_GB")),
                        V_P_PRICE_CONDITION : gfn_nvl(gfnma_multiSelectGet("PRICE_CONDITION")),
                        V_P_IMPORT_TYPE : gfn_nvl(gfnma_multiSelectGet("IMPORT_TYPE")),
                        V_P_IMPORT_DOC_NO : gfn_nvl(SBUxMethod.get("IMPORT_DOC_NO")),
                        V_P_HS_CODE : gfn_nvl(SBUxMethod.get("HS_CODE")),
                        V_P_CHARGE_ACCOUNT : gfn_nvl(SBUxMethod.get("CHARGE_ACCOUNT")),
                        V_P_REMARK : gfn_nvl(SBUxMethod.get("REMARK")),
                        V_P_FORM_ID: p_formId,
                        V_P_MENU_ID: p_menuId,
                        V_P_PROC_ID: '',
                        V_P_USERID: '',
                        V_P_PC: ''
                    })
                }
                listData.push(param);
            });

            if(listData.length > 0) {
                const postJsonPromise = gfn_postJSON("/fi/ftr/pay/insertFbs2010List.do", {listData: listData});

                const data = await postJsonPromise;

                try {
                    if (_.isEqual("S", data.resultStatus)) {
                        gfn_comAlert("I0001");
                        return true;
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
                    return false;
                }
            }
        } catch (e){
            console.error(e);
            return false;
        }
    }

    const fnSET_P_FBS2010_S1 = async function(strWorkType) {
        if (gfn_nvl(SBUxMethod.get("TRANS_BANK2")) == "")
            return false;

        try {
            // 비즈니스 로직 정보
            let FBS_NO = gfn_nvl(gvwDetail.getCellData(gvwDetail.getRow(), gvwDetail.getColRef("FBS_NO")));
            let CS_NAME = gfn_nvl(SBUxMethod.get("CS_NAME"));
            let CS_ADDRESS = gfn_nvl(SBUxMethod.get("CS_ADDRESS"));
            let PAYER_SWIFT_BIC = gfn_nvl(SBUxMethod.get("PAYER_SWIFT_BIC"));
            let PAYER_BANK_INFO = gfn_nvl(SBUxMethod.get("PAYER_BANK_INFO"));
            let PAY_REASON = gfn_nvl(gfnma_multiSelectGet("PAY_REASON"));
            let SEND_REASON = gfn_nvl(gfnma_multiSelectGet("SEND_REASON"));
            let ORDER1_TO_RECEIPT = gfn_nvl(SBUxMethod.get("ORDER1_TO_RECEIPT"));
            let ORDER2_TO_RECEIPT = gfn_nvl(SBUxMethod.get("ORDER2_TO_RECEIPT"));
            let ORDER3_TO_RECEIPT = gfn_nvl(SBUxMethod.get("ORDER3_TO_RECEIPT"));
            let ORDER4_TO_RECEIPT = gfn_nvl(SBUxMethod.get("ORDER4_TO_RECEIPT"));
            let TRANS_BANK1 = gfn_nvl(SBUxMethod.get("TRANS_BANK1"));
            let TRANS_BANK2 = gfn_nvl(SBUxMethod.get("TRANS_BANK2"));
            let TRANS_BANK3 = gfn_nvl(SBUxMethod.get("TRANS_BANK3"));
            let FEE_CHARGER = gfn_nvl(SBUxMethod.get("FEE_CHARGER"));
            let FOREIGN_GB = gfn_nvl(SBUxMethod.get("FOREIGN_GB"));
            let PRICE_CONDITION = gfn_nvl(gfnma_multiSelectGet("PRICE_CONDITION"));
            let IMPORT_TYPE = gfn_nvl(gfnma_multiSelectGet("IMPORT_TYPE"));
            let IMPORT_DOC_NO = gfn_nvl(SBUxMethod.get("IMPORT_DOC_NO"));
            let HS_CODE = gfn_nvl(SBUxMethod.get("HS_CODE"));
            let CHARGE_ACCOUNT = gfn_nvl(SBUxMethod.get("CHARGE_ACCOUNT"));
            let REMARK = gfn_nvl(SBUxMethod.get("REMARK"));

            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_FBS_NO : FBS_NO,
                V_P_CS_NAME : CS_NAME,
                V_P_CS_ADDRESS : CS_ADDRESS,
                V_P_PAYER_SWIFT_BIC : PAYER_SWIFT_BIC,
                V_P_PAYER_BANK_INFO : PAYER_BANK_INFO,
                V_P_PAY_REASON : PAY_REASON,
                V_P_SEND_REASON : SEND_REASON,
                V_P_ORDER1_TO_RECEIPT : ORDER1_TO_RECEIPT,
                V_P_ORDER2_TO_RECEIPT : ORDER2_TO_RECEIPT,
                V_P_ORDER3_TO_RECEIPT : ORDER3_TO_RECEIPT,
                V_P_ORDER4_TO_RECEIPT : ORDER4_TO_RECEIPT,
                V_P_TRANS_BANK1 : TRANS_BANK1,
                V_P_TRANS_BANK2 : TRANS_BANK2,
                V_P_TRANS_BANK3 : TRANS_BANK3,
                V_P_FEE_CHARGER : FEE_CHARGER,
                V_P_FOREIGN_GB : FOREIGN_GB,
                V_P_PRICE_CONDITION : PRICE_CONDITION,
                V_P_IMPORT_TYPE : IMPORT_TYPE,
                V_P_IMPORT_DOC_NO : IMPORT_DOC_NO,
                V_P_HS_CODE : HS_CODE,
                V_P_CHARGE_ACCOUNT : CHARGE_ACCOUNT,
                V_P_REMARK : REMARK,
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: '',
            };

            const postJsonPromise = gfn_postJSON("/fi/ftr/pay/insertFbs2010Sub.do", {
                getType				: 'json',
                workType			: strWorkType,
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    return true;
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
                return false;
            }
        } catch (e){
            console.error(e);
            return false;
        }
    }

    const fn_fbsSend = async function() {
        if (!validateRequired("panHeader")) {
            return false;
        }

        SBUxMethod.attr("btnTxnComplete", "disabled", "true");
        // 이중클릭 방지 ( 처음 클릭 후 0.4초내 클릭은 무시)
        if (gvwDetail.getRow() < 0)
            return;

        let objResult = "";

        SBUxMethod.set("LOG", "");
        let strLog = "";

        if (typeof objResult === 'string') {
            SBUxMethod.openProgress(gv_loadingOptions);

            SBUxMethod.set("SRCH_PASSWORD", objResult);

            strLog = strLog + "-전문생성시작(" + gfn_getDateTime() + ")"
            if (gfn_nvl(gfnma_multiSelectGet('#SRCH_PAY_GUBUN')) == "10") {
                fnQRY_P_FBSBANKTXN_Q("BANKING");
            } else {
                fnQRY_P_FBSBANKTXN_Q("TAXING");
            }

            strLog = strLog + "-전문생성끝(" + gfn_getDateTime() + ")";

            if (dtFirmbanking == null || dtFirmbanking.length < 1) {
                SBUxMethod.closeProgress(gv_loadingOptions);
                gfn_comAlert("E0000", "이체할 데이터가 없습니다.");
                return;
            }

            for(const dr in dtFirmbanking) {
                if (isFBSAsync) {
                    await gfnma_firmBankingSend(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), gfn_nvl(dr["SEND_DATA"]), false);

                    await fnSET_P_FBS2010_S_FIRM("SEND",
                        gfn_nvl(dr["FBS_NO"]),
                        "0",
                        gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE")),
                        "",
                        "",
                        "",
                        "",
                        gfn_nvl(dr["FIRM_NO"]),
                        "",
                        ""
                    );
                } else {
                    strLog = strLog + "-전문전송시작(" + gfn_getDateTime() + ")";

                    var result = await gfnma_firmBankingSend(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), gfn_nvl(dr["SEND_DATA"]));

                    strLog = strLog + "-전문전송끝(" + gfn_getDateTime() + ")";

                    let strReturnCode = result.code.trim();
                    let strTxtMessage = result.message;
                    let strWorkType = "";

                    if (strReturnCode == "000" || strReturnCode == "0000") {
                        // 성공시
                        strWorkType = "U";
                    } else {
                        //에러시
                        strWorkType = "N";
                    }

                    strLog = strLog + "-결과저장시작(" + gfn_getDateTime() + ")";

                    await fnSET_P_FBS2010_S_FIRM(strWorkType,
                        gfn_nvl(dr["FBS_NO"]),
                        "0",
                        gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE")),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : gfnma_firmSubString(strTxtMessage, 164, 1),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : gfnma_firmSubString(strTxtMessage, 165, 13),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : strTxtMessage.substring(195, 9),
                        strReturnCode,
                        gfn_nvl(dr["FIRM_NO"]),
                        "",
                        ""
                    );

                    strLog = strLog + "-결과저장끝(" + gfn_getDateTime() + ")";
                }
            }

            SBUxMethod.set("LOG", strLog);

            await fn_search();

            SBUxMethod.closeProgress(gv_loadingOptions);
        }

        SBUxMethod.attr("btnTxnComplete", "disabled", "false");
    }

    const fn_addDataSet = async function (objResult) {
        if (Array.isArray(objResult)) {
            bDetailSelect = false;

            if (gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE")) == "") {
                SBUxMethod.set("SRCH_TXN_DATE", gfn_dateToYmd(new Date()));
            }

            if (gfn_nvl(SBUxMethod.get("SRCH_TXN_TIME_RAW")) == "") {
                SBUxMethod.set("SRCH_TXN_TIME_RAW", gfn_dateToTime(new Date(), ""));
            }

            var iseq = 1;

            if (jsonFinancialTransferList.length != 0) {
                iseq = parseInt(gvwDetail.getCellData((jsonFinancialTransferList.length + 1), gvwDetail.getColRef("TXN_SEQ"))) + 1;
            }

            var bDataCheck = (jsonFinancialTransferList.length != 0);

            for (const dr in objResult) {
                if (bDataCheck) {
                    var dr_temp = jsonFinancialTransferList.filter(data => data["TREASURY_ID"] == dr["TREASURY_ID"]);
                    if (dr_temp != null && dr_temp.length > 0) {
                        continue;
                    }
                }

                if (gfn_nvl(dr["defer_yn"]) != "Y") {
                    var ht = {};

                    ht["FBS_NO"] =  "";
                    ht["SITE_CODE"] =  dr["SITE_CODE"];
                    ht["TREASURY_ID"] =  dr["TREASURY_ID"];
                    ht["TXN_DATE"] =  "";
                    ht["TXN_TIME"] =  "";
                    ht["TXN_SEQ"] =  iseq++;

                    ht["FIRM_PAYEE_ERROR_CODE"] = "";
                    ht["FIRM_PAYEE_NAME"] = "";
                    ht["ERROR_MESSAGE"] = "";

                    ht["TRANSFER_TYPE"] = gfn_nvl(dr["TRANSFER_TYPE"]);
                    ht["RESERVE_YN"] = gfn_nvl(dr["RESERVE_YN"]);
                    ht["BANK_CODE"] = gfn_nvl(dr["BANK_CODE"]);
                    ht["BANK_NAME"] = gfn_nvl(dr["BANK_NAME"]);
                    ht["BANK_ACCOUNT_NO"] = gfn_nvl(dr["BANK_ACCOUNT_NO"]);
                    ht["PAYER_BANK_CODE"] = gfn_nvl(dr["PAYER_BANK_CODE"]);
                    ht["PAYER_BANK_NAME"] = gfn_nvl(dr["PAYER_BANK_NAME"]);
                    ht["PAYER_BANK_ACCOUNT"] = gfn_nvl(dr["PAYER_BANK_ACCOUNT"]);
                    ht["TXN_AMT"] = gfn_nvl(dr["TXN_AMT"]);
                    ht["PAYER_BANK_ACCOUNT_OWNER"] = gfn_nvl(dr["PAYER_BANK_ACCOUNT_OWNER"]);
                    ht["PAYROLL_FLAG"] = gfn_nvl(dr["PAYROLL_FLAG"]);
                    ht["IN_PRINT"] = gfn_nvl(dr["IN_PRINT"]);
                    ht["OUT_PRINT"] = gfn_nvl(dr["OUT_PRINT"]);
                    ht["PROCESS_YN"] = gfn_nvl("A");
                    ht["TXN_STATUS"] = gfn_nvl("1");
                    ht["PLANNED_PAY_DATE"] = gfn_nvl(dr["PLANNED_PAY_DATE"]);
                    ht["PAYER_ID"] = gfn_nvl(dr["PAYER_ID"]);
                    ht["PAYER_NAME"] = gfn_nvl(dr["PAYER_NAME"]);
                    ht["CURRENCY_CODE"] = gfn_nvl(dr["CURRENCY_CODE"]);
                    ht["DOC_ID"] = gfn_nvl(dr["DOC_ID"]);
                    ht["DOC_NAME"] = gfn_nvl(dr["DOC_NAME"]);
                    ht["ITEM_ID"] = gfn_nvl(dr["ITEM_ID"]);
                    ht["CMS_CODE"] = gfn_nvl(dr["CMS_CODE"]);

                    SBUxMethod.set("SRCH_DEPOSIT_CODE", dr["DEPOSIT_CODE"]);
                    SBUxMethod.set("SRCH_BANK_CODE", dr["BANK_CODE"]);

                    gvwDetail.addRow(true, ht);

                    SaveButton = true;
                }
            }

            bDetailSelect = true;
        }
    }

    const fn_fbsUser = async function () {
        await fn_create();

        let TXN_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE"));
        let TXN_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE"));
        let TRANSFER_TYPE = gfn_nvl(gfnma_multiSelectGet('#SRCH_TRANSFER_TYPE'));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_TXN_DATE_FR : TXN_DATE_FR,
            V_P_TXN_DATE_TO : TXN_DATE_TO,
            V_P_DEPOSIT_CODE : '',
            V_P_TRANSFER_TYPE : TRANSFER_TYPE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/pay/selectFbs5010List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                var drs = data.cv_1.filter(data => data["CHECK_YN"] == "N");
                fn_addDataSet(drs);
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

        SaveButton = true;
    }

    const fn_fbsNew = async function () {
        await fn_create();

        let TXN_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE"));
        let TXN_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE"));
        let TRANSFER_TYPE = gfn_nvl(gfnma_multiSelectGet('#SRCH_TRANSFER_TYPE'));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_TXN_DATE_FR : TXN_DATE_FR,
            V_P_TXN_DATE_TO : TXN_DATE_TO,
            V_P_DEPOSIT_CODE : '',
            V_P_TRANSFER_TYPE : TRANSFER_TYPE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/pay/selectFbs2040List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                var drs = data.cv_1.filter(data => data["CHECK_YN"] == "N");
                fn_addDataSet(drs);
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

        SaveButton = true;
    }

    const fn_checkName = async function () {
        if (!validateRequired("panHeader")) {
            return false;
        }

        if (gvwDetail.getRow() < 0)
            return;

        let bresult = [];

        let intmax_seq = 0;
        let strpayer_bank_code = "";
        let strpayer_bank_account = "";
        let strsocial_num = "";
        let strpayer_bank_account_owner = "";
        let strcurrency_code = "";
        let strfbs_no = "";

        let gvwDetailCheckedList = gvwDetail.getCheckedRows(gvwDetail.getColRef("CHECK_YN"), true);
        intmax_seq = gvwDetailCheckedList.length;

        if (intmax_seq == 0) {
            gfn_comAlert("E0000", "수취인확인 데이터가 없습니다.");
            return;
        }

        let intprogram_seq = 1;

        SBUxMethod.openProgress(gv_loadingOptions);

        gvwDetailCheckedList.forEach((item, index) => {
            if (intprogram_seq == 1) {
                strpayer_bank_code = gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("PAYER_BANK_CODE")));
                strpayer_bank_account = gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("PAYER_BANK_ACCOUNT")));
                strpayer_bank_account_owner = gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("PAYER_BANK_ACCOUNT_OWNER")));
                strcurrency_code = gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("CURRENCY_CODE")));
                strfbs_no = "FBSBANKTXN." + gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("FBS_NO")));
            } else {
                strpayer_bank_code = strpayer_bank_code + "|" + gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("PAYER_BANK_CODE")));
                strpayer_bank_account = strpayer_bank_account + "|" + gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("PAYER_BANK_ACCOUNT")));
                strpayer_bank_account_owner = strpayer_bank_account_owner + "|" + gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("PAYER_BANK_ACCOUNT_OWNER")));
                strcurrency_code = strcurrency_code + "|" + gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("CURRENCY_CODE")));
                strfbs_no = strfbs_no + "|" + "FBSBANKTXN." + gfn_nvl(gvwDetail.getCellData(item, gvwDetail.getColRef("FBS_NO")));
            }
            intprogram_seq = intprogram_seq + 1;
        });

        let FBS_SERVICE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE'));

        var result = await gfnma_fbsName("", FBS_SERVICE, "NAME", strpayer_bank_code, strpayer_bank_account, strsocial_num, strpayer_bank_account_owner, strcurrency_code, strfbs_no);

        SBUxMethod.closeProgress(gv_loadingOptions);
    }

    const fn_retry = async function () {
        if (!validateRequired("panHeader")) {
            return false;
        }

        if (gvwDetail.getRow() < 0)
            return;

        let objResult = "";

        SBUxMethod.set("LOG", "");
        let strLog = "";

        if (typeof objResult === 'string') {
            SBUxMethod.openProgress(gv_loadingOptions);

            SBUxMethod.set("SRCH_PASSWORD", objResult);

            strLog = strLog + "-전문생성시작(" + gfn_getDateTime() + ")";

            fnQRY_P_FBSBANKTXN_Q("RETRY");

            strLog = strLog + "-전문생성끝(" + gfn_getDateTime() + ")";

            if (dtFirmbanking == null || dtFirmbanking.length < 1) {
                SBUxMethod.closeProgress(gv_loadingOptions);
                return;
            }

            for(const dr in dtFirmbanking) {
                //계좌성명조회
                if (isFBSAsync) {
                    await gfnma_firmBankingSend(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), dr["SEND_DATA"], false);

                    await fnSET_P_FBS2010_S_FIRM("SEND",
                        gfn_nvl(dr["FBS_NO"]),
                        "0",
                        gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE")),
                        "",
                        "",
                        "",
                        "",
                        gfn_nvl(dr["FIRM_NO"]),
                        "",
                        ""
                    );
                } else {
                    strLog = strLog + "-전문전송시작(" + gfn_getDateTime() + ")";

                    var result = await gfnma_firmBankingSend(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), gfn_nvl(dr["SEND_DATA"]));

                    strLog = strLog + "-전문전송시작(" + gfn_getDateTime() + ")";

                    let strReturnCode = result.code.trim();
                    let strTxtMessage = result.message;
                    let strWorkType = "";

                    if (strReturnCode == "000" || strReturnCode == "0000") {
                        // 성공시
                        strWorkType = "U";
                    } else {
                        //에러시
                        strWorkType = "N";
                    }

                    strLog = strLog + "-결과저장시작(" + gfn_getDateTime() + ")";

                    await fnSET_P_FBS2010_S_FIRM(strWorkType,
                        gfn_nvl(dr["FBS_NO"]),
                        "0",
                        gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE")),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : gfnma_firmSubString(strTxtMessage, 164, 1),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : gfnma_firmSubString(strTxtMessage, 165, 13),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : strTxtMessage.substring(195, 9),
                        strReturnCode,
                        gfn_nvl(dr["FIRM_NO"]),
                        "",
                        ""
                    );

                    strLog = strLog + "-결과저장끝(" + gfn_getDateTime() + ")";
                }
            }

            SBUxMethod.set("LOG", strLog);

            await fn_search();

            SBUxMethod.closeProgress(gv_loadingOptions);
        }
    }

    const fn_txnComplete = async function () {
        if (!validateRequired("panHeader")) {
            return false;
        }

        SBUxMethod.attr("btnTxnComplete", "disabled", "true");

        if (gvwDetail.getRow() < 0)
            return;

        let objResult = "";
        SBUxMethod.set("LOG", "");

        let strLog = "";

        if (typeof objResult === 'string') {
            SBUxMethod.openProgress(gv_loadingOptions);

            SBUxMethod.set("SRCH_PASSWORD", objResult);

            strLog = strLog + "-전문생성시작(" + gfn_getDateTime() + ")";
            if (gfn_nvl(gfnma_multiSelectGet('#SRCH_PAY_GUBUN')) == "10") {
                fnQRY_P_FBSBANKTXN_Q("BANKING");
            } else {
                fnQRY_P_FBSBANKTXN_Q("TAXING");
            }

            strLog = strLog + "-전문생성끝(" + gfn_getDateTime() + ")";''

            if (dtFirmbanking == null || dtFirmbanking.length < 1) {
                SBUxMethod.closeProgress(gv_loadingOptions);
                gfn_comAlert("E0000", "이체할 데이터가 없습니다.");
                return;
            }

            for(const dr in dtFirmbanking) {
                //계좌성명조회
                if (isFBSAsync) {
                    await gfnma_firmBankingSend(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), gfn_nvl(dr["SEND_DATA"]), false);

                    await fnSET_P_FBS2010_S_FIRM("SEND",
                        gfn_nvl(dr["FBS_NO"]),
                        "0",
                        gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE")),
                        "",
                        "",
                        "",
                        "",
                        gfn_nvl(dr["FIRM_NO"]),
                        "",
                        ""
                    );
                } else {
                    strLog = strLog + "-전문전송시작(" + gfn_getDateTime() + ")";

                    var result = await gfnma_firmBankingSend(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), gfn_nvl(dr["SEND_DATA"]));

                    strLog = strLog + "-전문전송끝(" + gfn_getDateTime() + ")";

                    let strReturnCode = result.code.trim();
                    let strTxtMessage = result.message;
                    let strWorkType = "";

                    if (strReturnCode == "000" || strReturnCode == "0000") {
                        // 성공시
                        strWorkType = "U";
                    } else {
                        //에러시
                        strWorkType = "N";
                    }

                    strLog = strLog + "-결과저장시작(" + gfn_getDateTime() + ")";

                    await fnSET_P_FBS2010_S_FIRM(strWorkType,
                        gfn_nvl(dr["FBS_NO"]),
                        "0",
                        gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE")),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : gfnma_firmSubString(strTxtMessage, 164, 1),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : gfnma_firmSubString(strTxtMessage, 165, 13),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : strTxtMessage.substring(195, 9),
                        strReturnCode,
                        gfn_nvl(dr["FIRM_NO"]),
                        "",
                        ""
                    );
                    strLog = strLog + "-결과저장끝(" + gfn_getDateTime() + ")";
                }
            }

            SBUxMethod.set("LOG", strLog);

            await fn_search();

            SBUxMethod.closeProgress(gv_loadingOptions);

        }
        SBUxMethod.attr("btnTxnComplete", "disabled", "false");
    }

    const fn_txnCancel = async function () {
        if (!validateRequired("panHeader")) {
            return false;
        }

        if (gvwDetail.getRow() < 0)
            return;

        let objResult = "";
        SBUxMethod.set("LOG", "");

        let strLog = "";

        if (typeof objResult === 'string') {
            SBUxMethod.openProgress(gv_loadingOptions);

            SBUxMethod.set("SRCH_PASSWORD", objResult);
            strLog = strLog + "-전문생성시작(" + gfn_getDateTime() + ")";

            fnQRY_P_FBSBANKTXN_Q("CANCEL");

            strLog = strLog + "-전문생성끝(" + gfn_getDateTime() + ")";

            if (dtFirmbanking == null || dtFirmbanking.length < 1) {
                SBUxMethod.closeProgress(gv_loadingOptions);
                gfn_comAlert("E0000", "이체할 데이터가 없습니다.");
                return;
            }

            for(const dr in dtFirmbanking) {
                if (isFBSAsync) {
                    var result = await gfnma_firmBankingSend(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), gfn_nvl(dr["SEND_DATA"]), false);

                    let strReturnCode = result.code.trim();
                    let strTxtMessage = result.message;

                    await fnSET_P_FBS2010_S_FIRM("SEND",
                        gfn_nvl(dr["FBS_NO"]),
                        "0",
                        gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE")),
                        "",
                        "",
                        "",
                        strReturnCode == "CTIM" ? strTxtMessage : "",
                        gfn_nvl(dr["FIRM_NO"]),
                        "",
                        ""
                    );
                } else {
                    strLog = strLog + "-전문전송시작(" + gfn_getDateTime() + ")";

                    var result = await gfnma_firmBankingSend(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), gfn_nvl(dr["SEND_DATA"]));

                    strLog = strLog + "-전문전송끝(" + gfn_getDateTime() + ")";

                    let strReturnCode = result.code.trim();
                    let strTxtMessage = result.message;
                    let strWorkType = "";

                    if (strReturnCode == "000" || strReturnCode == "0000") {
                        // 성공시
                        strWorkType = "C";
                    } else {
                        //에러시
                        strWorkType = "N";
                    }

                    strLog = strLog + "-결과저장시작(" + gfn_getDateTime() + ")";

                    await fnSET_P_FBS2010_S_FIRM(strWorkType,
                        gfn_nvl(dr["FBS_NO"]),
                        "0",
                        gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE")),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : gfnma_firmSubString(strTxtMessage, 164, 1),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : gfnma_firmSubString(strTxtMessage, 165, 13),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : strTxtMessage.substring(195, 9),
                        strReturnCode,
                        gfn_nvl(dr["FIRM_NO"]),
                        "",
                        ""
                    );
                    strLog = strLog + "-결과저장끝(" + gfn_getDateTime() + ")";
                }
            }

            SBUxMethod.set("LOG", strLog);

            await fn_search();

            SBUxMethod.closeProgress(gv_loadingOptions);
        }
    }

    const fn_bankUniqueNo = async function () {
        if (!validateRequired("panHeader")) {
            return false;
        }

        if (gvwDetail.getRow() < 0)
            return;

        let objResult = "";
        SBUxMethod.set("LOG", "");

        let strLog = "";

        if (typeof objResult === 'string') {
            SBUxMethod.openProgress(gv_loadingOptions);

            SBUxMethod.set("SRCH_PASSWORD", objResult);

            if (gfn_nvl(gfnma_multiSelectGet('#SRCH_PAY_GUBUN')) == "10") {
                SBUxMethod.closeProgress(gv_loadingOptions);
                gfn_comAlert("E0000", "실시간 이체는 처리할수 없습니다.");
                return;
            }

            strLog = strLog + "-전문생성시작(" + gfn_getDateTime() + ")";

            fnQRY_P_FBSBANKTXN_Q("TAXING_NO");

            strLog = strLog + "-전문생성끝(" + gfn_getDateTime() + ")";

            if (dtFirmbanking == null || dtFirmbanking.length < 1) {
                SBUxMethod.closeProgress(gv_loadingOptions);
                gfn_comAlert("E0000", "이체할 데이터가 없습니다.");
                return;
            }

            for(const dr in dtFirmbanking){
                //계좌성명조회
                if (isFBSAsync) {
                    await gfnma_firmBankingSend(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), gfn_nvl(dr["SEND_DATA"]), false);
                } else {
                    strLog = strLog + "-전문전송시작(" + gfn_getDateTime() + ")";

                    var result = await gfnma_firmBankingSend(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), gfn_nvl(dr["SEND_DATA"]));

                    strLog = strLog + "-전문전송끝(" + gfn_getDateTime() + ")";

                    let strReturnCode = result.code.trim();
                    let strTxtMessage = result.message;
                    let strWorkType = "";

                    if (strReturnCode == "000" || strReturnCode == "0000") {
                        // 성공시
                        strWorkType = "U";
                    } else {
                        //에러시
                        strWorkType = "N";
                    }

                    strLog = strLog + "-결과저장시작(" + gfn_getDateTime() + ")";

                    await fnSET_P_FBS2010_S_FIRM(strWorkType,
                        gfn_nvl(dr["FBS_NO"]),
                        "0",
                        gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE")),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : gfnma_firmSubString(strTxtMessage, 164, 1),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : gfnma_firmSubString(strTxtMessage, 165, 13),
                        gfn_nvl(strTxtMessage) != "VTIM" ? "" : strTxtMessage.substring(195, 9),
                        strReturnCode,
                        gfn_nvl(dr["FIRM_NO"]),
                        "",
                        ""
                    );
                    strLog = strLog + "-결과저장끝(" + gfn_getDateTime() + ")";
                }
            }

            SBUxMethod.set("LOG", strLog);

            await fn_search();

            SBUxMethod.closeProgress(gv_loadingOptions);

        }
    }

    const fn_resultQuery = async function () {
        if (!validateRequired("panHeader")) {
            return false;
        }

        if (gvwDetail.getRow() < 0)
            return;

        SBUxMethod.openProgress(gv_loadingOptions);

        let arrfbs_no = "";
        let strFBS_WORK_TYPE = "";

        for (var i = 0; i < jsonFinancialTransferList.length; i++) {
            if (gvwDetail.getCellData((i+1), gvwDetail.getColRef("ERROR_MESSAGE")) == "VTIM" || gvwDetail.getCellData((i+1), gvwDetail.getColRef("PROCESS_YN")) == "P") {
                if (arrfbs_no != "")
                    arrfbs_no += "|";

                arrfbs_no += gvwDetail.getCellData((i+1), gvwDetail.getColRef("FBS_NO"));
            }
            strFBS_WORK_TYPE = "BANKTXNRESULT";
        }

        // 비즈니스 로직 정보
        let BANK_CODE = gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE"));
        let FBS_SERVICE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE'));
        let TXN_DATE = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE"));
        let PASSWORD = gfn_nvl(SBUxMethod.get("SRCH_PASSWORD"));
        let PROCESS_YN = gfn_nvl(gfnma_multiSelectGet('#SRCH_PROCESS_YN'));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_BANK_CODE : BANK_CODE,
            V_P_FBS_SERVICE : FBS_SERVICE,
            V_P_FBS_WORK_TYPE : strFBS_WORK_TYPE,
            V_P_TXN_DATE : TXN_DATE,
            V_P_PASSWORD : PASSWORD,
            V_P_ARR_FBS_NO : arrfbs_no,
            V_P_PROCESS_YN : PROCESS_YN,
            V_P_INTERFACEID : "",
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/pay/selectFbsbankResultList.do", {
            getType				: 'json',
            workType			: 'RESULT',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.cv_1.length >= 1) {
                    dtFirmbanking = data.cv_1;
                }

                if (dtFirmbanking == null || dtFirmbanking.length < 1) {
                    SBUxMethod.closeProgress(gv_loadingOptions);
                    gfn_comAlert("E0000", "결과를 확인할 데이터가 없습니다.");
                    return;
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

        for(const dr in dtFirmbanking){
            if (isFBSAsync) {
                await gfnma_firmBankingSend(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), gfn_nvl(dr["SEND_DATA"]), false);
            } else {
                var result = await gfnma_firmBankingSend(gfn_nvl(gfnma_multiSelectGet('#SRCH_FBS_SERVICE')), gfn_nvl(dr["SEND_DATA"]));

                if (result.code.trim() == "000" || result.code.trim() == "0000") {
                    await fnSET_P_FBS2010_S_FIRM("RE_Q",
                        gfn_nvl(dr["FBS_NO"]),
                        "0",
                        gfn_nvl(SBUxMethod.get("SRCH_BANK_CODE")),
                        "",
                        "0",
                        gfnma_firmSubString(result.message, 187, 9) == "" ? "0" : gfnma_firmSubString(result.message, 187, 9),
                        gfnma_firmSubString(result.message, 234, 4),
                        "",
                        "",
                        "");
                }
            }
        }

        await fn_search();

        SBUxMethod.closeProgress(gv_loadingOptions);
    }

    const fn_print = async function () {
        if (gfn_nvl(SBUxMethod.get("SRCH_TRANS_COUNT")) == "") {
            gfn_comAlert("E0000", "전송회차가 선택되지 않았습니다.");
            return;
        }

        if (gvwDetail.getRow() < 0)
            return;

        if (gfn_nvl(SBUxMethod.get("SRCH_TXN_TIME_RAW")) == "") {
            return;
        }

        var param = {};

        param["WORK_TYPE"] = "FBS";
        param["PRINT_TYPE"] = "PREVIEW";
        param["TXN_DATE"] = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE"));
        param["TXN_TIME"] = gfn_nvl(SBUxMethod.get("SRCH_TXN_TIME_RAW"));

        gfn_popClipReport("", reportFilePath, param);
        // object objResult = OpenChildForm("\\FIG\\App.erp.FIG.FIG1010.dll", htparam, OpenType.Modal);
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>