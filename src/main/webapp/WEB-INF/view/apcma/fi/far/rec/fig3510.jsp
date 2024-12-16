<%
    /**
    * @Class Name 		: fig3510.jsp
    * @Description 	: 매출/매입송장등록 공통화면
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
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
                <div class="box-body">
                    <div class="box-search-ma">
                        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
                        <table class="table table-bordered tbl_fixed table-search-ma" style="display: none;">
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
                                <th scope="row" class="th_bg">APC</th>
                                <td colspan="3" class="td_input" style="border-right:hidden;">
                                    <sbux-input id="SRCH_DOC_H_FI_ORG_CODE" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg">사업장</th>
                                <td colspan="3" class="td_input" style="border-right:hidden;">
                                    <sbux-input id="SRCH_SITE_CODE" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    <sbux-input id="SRCH_CARD_YN" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                                    <sbux-input id="SRCH_FROM_DATE" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                                    <sbux-input id="SRCH_TO_DATE" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                                    <sbux-input id="SRCH_INVOCE_BATCH_NO" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                    <div class="row">
                        <div id="srchArea" class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>전표</span>
                                </li>
                            </ul>
                            <div class="ad_tbl_toplist" style="display: flex; align-items: center; justify-content: flex-end;">
                                <div style="display: flex; align-items: center; justify-content: start; width: 30%;">
                                    <span style="margin-right: 10px;">전표템플릿</span>
                                    <div class="dropdown" style="width: 40%; margin-right: 10px;">
                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="RULE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <font>선택</font>
                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="RULE_CODE" style="width:700px;height:150px;padding-top:0px;overflow:auto">
                                        </div>
                                    </div>
                                    <sbux-checkbox uitype="normal" id="CLOSE_YN" name="CLOSE_YN" uitype="normal" class="form-control input-sm check" text="역분개라인생성" true-value="Y" false-value="N"/>
                                </div>
                                <div style="display: flex; align-items: center; justify-content: left; width: 30%; margin-right: 5%">
                                    <span style="margin-right: 10px;" id="LBL_INVOICE">세금계산서</span>
                                    <sbux-input id="APPROVAL_NO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="VOUCHER_TYPE" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-button class="btn btn-xs btn-outline-dark" text="..." uitype="modal" target-id="modal-compopup1" onclick="fn_findApprovalNo"></sbux-button>
                                </div>
                				<sbux-button id="btnPrint" name="btnPrint" uitype="normal" class="btn btn-sm btn-outline-danger" text="출력" onclick="fn_btnPrint"></sbux-button>
                                
                                <sbux-button id="btnCreateInvoice" name="btnCreateInvoice" uitype="normal" text="세금계산서발행" class="btn btn-sm btn-outline-danger" onclick="fn_createInvoice" style="float: right;"></sbux-button>
                                <sbux-button id="btnCancelInvoice" name="btnCancelInvoice" uitype="normal" text="발행취소" class="btn btn-sm btn-outline-danger" onclick="fn_cancelInvoice" style="float: right;"></sbux-button>
                                <%--<sbux-button id="btnScmInfo" name="btnScmInfo" uitype="normal" text="SCM정보" class="btn btn-sm btn-outline-danger" onclick="fn_scmInfo" style="float: right;"></sbux-button>--%>
                                <sbux-button id="btnDocCopy" name="btnDocCopy" uitype="normal" text="전표복사" class="btn btn-sm btn-outline-danger" onclick="fn_docCopy" style="float: right;"></sbux-button>
                                <sbux-button id="btnConfirmHist" name="btnConfirmHist" uitype="normal" text="결재이력" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_confimHist"></sbux-button>
                            </div>
                        </div>
                        <div>
                            <table id="panWFTop" class="table table-bordered tbl_fixed">
                                <caption>전표</caption>
                                <colgroup>
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 3%">
                                    <col style="width: 7%">
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 3%">
                                    <col style="width: 7%">
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row" class="th_bg">신고사업장</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="TAX_SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="TAX_SITE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row" class="th_bg">종사업장</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SUB_TAX_SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFTop" required>
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="SUB_TAX_SITE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td colspan="2"></td>
                                    <th scope="row" class="th_bg">배치번호</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DOC_BATCH_NO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td colspan="2"></td>
                                    <th scope="row" class="th_bg">결의부서</th>
                                    <td class="td_input" style="border-right:hidden;" data-group="DEPT">
                                        <sbux-input id="DEPT_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="DEPT">
                                        <sbux-input id="DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="DEPT">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="..." uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findDeptCode"
                                                disabled="true"
                                        ></sbux-button>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">전표유형</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-select id="DOC_TYPE" uitype="single" jsondata-ref="jsonDocType" unselected-text="선택" class="form-control input-sm inpt_data_reqed" group-id="panWFTop" required></sbux-select>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="DOC_STATUS" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="DOC_STATUS" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td colspan="3"></td>
                                    <th scope="row" class="th_bg">전표번호</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DOC_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">전표ID</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DOC_ID" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">실사용자</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PAYEE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" disabled>
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="PAYEE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                        <sbux-input id="BILL_DUE_DAY" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                        <sbux-input id="BASE_SCALE" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">거래처</th>
                                    <td class="td_input" style="border-right:hidden;" data-group="CS">
                                        <sbux-input id="CS_CODE" uitype="text" placeholder="" class="form-control input-sm inpt_data_reqed" group-id="panWFTop" required></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="CS">
                                        <sbux-input id="CS_NAME" uitype="text" placeholder="" class="form-control input-sm inpt_data_reqed" group-id="panWFTop" required></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="CS">
                                        <sbux-input id="BIZ_REGNO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="CS">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="..." uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findCsCode"
                                        ></sbux-button>
                                    </td>
                                    <td></td>
                                    <th scope="row" class="th_bg" id="LBL_PAY_TERM_CODE">지급기준</th>
                                    <td class="td_input" style="border-right:hidden;" data-group="PAY_TERM">
                                        <sbux-input id="PAY_TERM_CODE" uitype="text" placeholder="" class="form-control input-sm inpt_data_reqed" group-id="panWFTop" required></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="PAY_TERM">
                                        <sbux-input id="PAY_TERM_NAME" uitype="text" placeholder="" class="form-control input-sm inpt_data_reqed" group-id="panWFTop" required></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="PAY_TERM">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="..." uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findPayTermCode"
                                        ></sbux-button>
                                    </td>
                                    <td></td>
                                    <th scope="row" class="th_bg">증빙번호</th>
                                    <td class="td_input" style="border-right:hidden;" data-group="VOUCHER">
                                        <sbux-select id="VOUCHER_TYPE" uitype="single" jsondata-ref="jsonVoucherType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="VOUCHER">
                                        <sbux-input id="VOUCHER_NO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="VOUCHER">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="확인" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_taxView"
                                        ></sbux-button>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">전기일자</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="DOC_DATE"
                                                name="DOC_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
                                                style="width:100%;"
                                                onchange="fn_changeDocDate(DOC_DATE)"
                                                group-id="panWFTop"
                                                required
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">신고일자</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="STANDARD_DATE"
                                                name="STANDARD_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
                                                style="width:100%;"
                                                onchange="fn_changeStandardDate(STANDARD_DATE)"
                                                group-id="panWFTop"
                                                required
                                        />
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EXCHANGE_TYPE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" id="LBL_PAY_METHOD">지급방법</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PAY_METHOD" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="PAY_METHOD" style="width:450px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td colspan="2"></td>
                                    <th scope="row" class="th_bg">매입송장번호</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BILL_NO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">증빙일자</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="VOUCHER_RECEIPT_DATE"
                                                name="VOUCHER_RECEIPT_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
                                                style="width:100%;"
                                                group-id="panWFTop"
                                                required
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">통화</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="CURRENCY_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFTop" required>
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="CURRENCY_CODE" style="width:250px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="EXCHANGE_RATE" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true}" readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg" id="LBL_PAY_BASE_DATE">지급기산일자</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="PAY_BASE_DATE"
                                                name="PAY_BASE_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                                style="width:100%;"
                                        />
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DIFF_DAY" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}" readonly></sbux-input>
                                        <sbux-input id="BASIS_TYPE" name="BASIS_TYPE" uitype="hidden"></sbux-input>
                                    </td>
                                    <td colspan="2"></td>
                                    <th scope="row" class="th_bg">현업결재일</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="APPROVE_DATE"
                                                name="APPROVE_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                                style="width:100%;"
                                                readonly
                                        />
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="FINAL_APPROVER" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">총액</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DOC_AMT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoGroup': 3, 'groupSeparator': ',', 'autoFillDigits': true}" onchange="fn_changeDocAmt(DOC_AMT)"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">세금코드</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="VAT_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFTop" required>
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="VAT_CODE" style="width:600px;height:400px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td></td>
                                    <th scope="row" class="th_bg" id="LBL_EXPECTED_PAY_DATE">지급만기일자</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="EXPECTED_PAY_DATE"
                                                name="EXPECTED_PAY_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
                                                style="width:100%;"
                                                onchange="fn_changeExpectedPayDate(EXPECTED_PAY_DATE)"
                                                group-id="panWFTop"
                                                required
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">어음만기일자</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="BILL_DUE_DATE"
                                                name="BILL_DUE_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                                style="width:100%;"
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">회계승인일</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="POSTING_DATE"
                                                name="POSTING_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                                style="width:100%;"
                                                readonly
                                        />
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="POSTING_USER" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">부가세</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="VAT_AMOUNT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoGroup': 3, 'groupSeparator': ',', 'autoFillDigits': true}" onchange="fn_changeVatAmount(VAT_AMOUNT)"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">공급가액</th>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="SUPPLY_AMT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoGroup': 3, 'groupSeparator': ',', 'autoFillDigits': true}" onchange="fn_changeSupplyAmt(SUPPLY_AMT)"></sbux-input>
                                    </td>
                                    <td></td>
                                    <th scope="row" class="th_bg">계좌정보</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="BANK_ACCOUNT_SEQ" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="BANK_ACCOUNT_SEQ" style="width:1010px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-select id="BANK_CODE" uitype="single" jsondata-ref="jsonBankCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BANK_ACCOUNT_NO" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">승인취소일</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="UNPOSTING_DATE"
                                                name="UNPOSTING_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                                style="width:100%;"
                                                readonly
                                        />
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="UNPOSTING_USER" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">제목</th>
                                    <td colspan="5" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DESCRIPTION" uitype="text" placeholder="" class="form-control input-sm inpt_data_reqed" onchange="fn_changeDescription(DESCRIPTION)" group-id="panWFTop" required></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">계좌비고</th>
                                    <td colspan="4" class="td_input" style="border-right:hidden;">
                                        <sbux-input id="BANK_ACCOUNT_DESCRIPTION" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">역분개전표</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="REVERSE_DOC_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                    </td>
                                    <sbux-input id="WRITE_DATE" uitype="hidden" placeholder="" class="form-control input-sm" onchange="fn_changeWriteDate(WRITE_DATE)"></sbux-input>
                                    <sbux-input id="APPR_COUNT" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="KEY_ID" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="TXN_STOP_REASON" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="APPR_ID" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="DOC_NUM" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="INSERT_USERID" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="HEADER_COST_CENTER" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <%--<sbux-input id="OPEN_TO_ALL_YN" name="OPEN_TO_ALL_YN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>--%>
                                    <sbux-checkbox id="OPEN_TO_ALL_YN" name="OPEN_TO_ALL_YN" uitype="normal" style="display: none;" class="form-control input-sm check" text="" true-value="Y" false-value="N"/>
                                    <sbux-input id="TXN_STOP_YN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="CONFIRM_EMP_CODE" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="REGISTER_YN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="BNKCNT" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="WITHHOLD_TAX_YN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <%--<sbux-input id="OPEN_TO_FCM_YN" name="OPEN_TO_FCM_YN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>--%>
                                    <sbux-checkbox id="OPEN_TO_FCM_YN" name="OPEN_TO_FCM_YN" uitype="normal" style="display: none;" class="form-control input-sm check" text="" true-value="Y" false-value="N"/>
                                    <sbux-input id="PROXY_EMP_CODE" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="SOURCE_DOC" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="TEMP_AREA" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="textEditEx1" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="RELEASE_DATE" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="textEditEx2" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="BILL_DUE_PAY_DATE" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="ACCT_RULE_CODE" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="ACCT_OPINION" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="HOLD_DATE" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="TR_OPINION" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="HOLD_FLAG" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="REQUEST_EMP_CODE" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="BEFORE_APPR_EMP_CODE" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="EMP_CODE" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="STEEL_SCRAP_PAY_YN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                    <sbux-input id="HOLD_REASON" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>전표라인</span>
                                </li>
                            </ul>
                            <div class="ad_tbl_toplist">
                                <sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow" style="float: right;"></sbux-button>
                                <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
                                <sbux-button id="btnCreateLine" name="btnCreateLine" uitype="normal" text="전표라인생성" class="btn btn-sm btn-outline-danger" onclick="fn_createLine" style="float: right;"></sbux-button>
                                <sbux-button id="btnClearMode" name="btnClearMode" uitype="normal" text="복사해제모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('clear')" style="float: right;"></sbux-button>
                                <sbux-button id="btnLineCopyMode" name="btnLineCopyMode" uitype="normal" text="행복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('line')" style="float: right;"></sbux-button>
                                <sbux-button id="btnCellCopyMode" name="btnCellCopyMode" uitype="normal" text="셀복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('cell')" style="float: right;"></sbux-button>

                            </div>
                        </div>
                        <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                            <div id="sb-area-gvwWFItem" style="height:300px;"></div>
                        </div>
                        <div>
                            <table id="panWFMiddleBottom" class="table table-bordered tbl_fixed">
                                <caption>합계</caption>
                                <colgroup>
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                    <col style="width: 10%">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row" class="th_bg">차변합계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DR_SUM" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'digits': 0, 'radixPoint': '.', 'autoGroup': 3, 'groupSeparator': ',', 'autoFillDigits': true}" readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">대변합계</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="CR_SUM" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'digits': 0, 'radixPoint': '.', 'autoGroup': 3, 'groupSeparator': ',', 'autoFillDigits': true}" readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">차이(통화)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DIFF_ORIGIN" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoGroup': 3, 'groupSeparator': ',', 'autoFillDigits': true}" readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">차이(전표)</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-input id="DIFF_FUNTION" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'digits': 0, 'radixPoint': '.', 'autoGroup': 3, 'groupSeparator': ',', 'autoFillDigits': true}" readonly></sbux-input>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div>
                            <sbux-tabs id="idxTab" name="idxTab" uitype="normal" is-scrollable="false" jsondata-ref="jsonTabData">
                            </sbux-tabs>
                            <div class="tab-content">
                                <div id="tabPage2">
                                    <table id="panWFVat" class="table table-bordered tbl_fixed">
                                        <caption>부가세</caption>
                                        <colgroup>
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row" class="th_bg">전자발행</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <div class="dropdown">
                                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="ETAX_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFVat">
                                                            <font>선택</font>
                                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="ETAX_TYPE" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th scope="row" class="th_bg">신고일자</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="STANDARD_DATE1"
                                                            name="STANDARD_DATE1"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                                            style="width:100%;"
                                                            group-id="panWFVat"
                                                            onchange="fn_changeRowData('STANDARD_DATE', STANDARD_DATE1)"
                                                    />
                                                </td>
                                                <th scope="row" class="th_bg">공급가액</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="SUPPLY_AMT1" name="SUPPLY_AMT1" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'autoFillDigits': true}" group-id="panWFVat" onchange="fn_changeRowData('SUPPLY_AMT', SUPPLY_AMT1)"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">수출신고번호</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="EXPORT_LICENSE_NO" name="EXPORT_LICENSE_NO" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFVat" onchange="fn_changeRowData('EXPORT_LICENSE_NO', EXPORT_LICENSE_NO)"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">당기제출금_외화</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="EXPORT_AMT" name="EXPORT_AMT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoGroup': 3, 'groupSeparator': ',', 'autoFillDigits': true}"  group-id="panWFVat" onchange="fn_changeRowData('EXPORT_AMT', EXPORT_AMT)"></sbux-input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">카드용도</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <div class="dropdown">
                                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="CARD_USE_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFVat">
                                                            <font>선택</font>
                                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="CARD_USE_TYPE" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th scope="row" class="th_bg">카드번호</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="CARD_NUM" name="CARD_NUM" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFVat" onchange="fn_changeRowData('EXPORT_AMT', EXPORT_AMT)"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">내국신용장구분</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <div class="dropdown">
                                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="LOCAL_CREDIT_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFVat">
                                                            <font>선택</font>
                                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="LOCAL_CREDIT_TYPE" style="width:200px;height:100px;padding-top:0px;overflow:auto">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th scope="row" class="th_bg">선적일자</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="SHIPPING_DATE"
                                                            name="SHIPPING_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                                            style="width:100%;"
                                                            group-id="panWFVat"
                                                            onchange="fn_changeRowData('SHIPPING_DATE', SHIPPING_DATE)"
                                                    />
                                                </td>
                                                <th scope="row" class="th_bg">당기제출금_원화</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="EXPORT_AMT_KRW" name="EXPORT_AMT_KRW" uitype="text" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',',}" placeholder="" class="form-control input-sm" group-id="panWFVat" onchange="fn_changeRowData('EXPORT_AMT_KRW', EXPORT_AMT_KRW)"></sbux-input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">불공제유형</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <div class="dropdown">
                                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="VAT_NOT_DEDUCTION_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFVat">
                                                            <font>선택</font>
                                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="VAT_NOT_DEDUCTION_TYPE" style="width:280px;height:150px;padding-top:0px;overflow:auto">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th scope="row" class="th_bg">예정신고누락</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <div class="dropdown">
                                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="REPORT_OMIT_YN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFVat">
                                                            <font>선택</font>
                                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="REPORT_OMIT_YN" style="width:130px;height:80px;padding-top:0px;overflow:auto">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th scope="row" class="th_bg">서류명</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="DOCUMENT_NAME" name="DOCUMENT_NAME" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFVat" onchange="fn_changeRowData('DOCUMENT_NAME', DOCUMENT_NAME)"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">수출외화금액</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="FOREIGN_AMT" name="FOREIGN_AMT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoGroup': 3, 'groupSeparator': ',', 'autoFillDigits': true}" group-id="panWFVat" onchange="fn_changeRowData('FOREIGN_AMT', FOREIGN_AMT)"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">당기신고해당분_외화</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="VAT_EXPORT_AMT" name="VAT_EXPORT_AMT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoGroup': 3, 'groupSeparator': ',', 'autoFillDigits': true}" group-id="panWFVat" onchange="fn_changeRowData('VAT_EXPORT_AMT', VAT_EXPORT_AMT)"></sbux-input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">중복발행</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <div class="dropdown">
                                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="DUP_ISSUE_BILL_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFVat">
                                                            <font>선택</font>
                                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="DUP_ISSUE_BILL_TYPE" style="width:100px;height:100px;padding-top:0px;overflow:auto">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th scope="row" class="th_bg">감가상각자산유형</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <div class="dropdown">
                                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="VAT_ASSET_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFVat">
                                                            <font>선택</font>
                                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="VAT_ASSET_TYPE" style="width:150px;height:150px;padding-top:0px;overflow:auto">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th scope="row" class="th_bg">발급자</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ISSUE_NAME" name="ISSUE_NAME" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFVat" onchange="fn_changeRowData('ISSUE_NAME', ISSUE_NAME)"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">수출원화금액</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="WON_AMT" name="WON_AMT"uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',',}" group-id="panWFVat" onchange="fn_changeRowData('WON_AMT', WON_AMT)"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">당기신고해당분_원화</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="VAT_EXPORT_AMT_KRW" name="VAT_EXPORT_AMT_KRW" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',',}" group-id="panWFVat" onchange="fn_changeRowData('VAT_EXPORT_AMT_KRW', VAT_EXPORT_AMT_KRW)"></sbux-input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">11일외전송</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <div class="dropdown">
                                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="AFTER_DUE_DATE_YN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFVat">
                                                            <font>선택</font>
                                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="AFTER_DUE_DATE_YN" style="width:130px;height:80px;padding-top:0px;overflow:auto">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th scope="row" class="th_bg">영세율첨부서류여부</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <div class="dropdown">
                                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="ZERO_REPORT_YN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFVat">
                                                            <font>선택</font>
                                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="ZERO_REPORT_YN" style="width:150px;height:150px;padding-top:0px;overflow:auto">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th scope="row" class="th_bg">발급일자</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="DOCUMENT_ISSUE_DATE"
                                                            name="DOCUMENT_ISSUE_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                                            style="width:100%;"
                                                            group-id="panWFVat"
                                                            onchange="fn_changeRowData('DOCUMENT_ISSUE_DATE', DOCUMENT_ISSUE_DATE)"
                                                    />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">수입금액제외</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <div class="dropdown">
                                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="EXCLUDE_REVENUE_AMT_YN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFVat">
                                                            <font>선택</font>
                                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="EXCLUDE_REVENUE_AMT_YN" style="width:150px;height:80px;padding-top:0px;overflow:auto">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th scope="row" class="th_bg">영세율구분</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <div class="dropdown">
                                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="ZERO_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panWFVat">
                                                            <font>선택</font>
                                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                        </button>
                                                        <div class="dropdown-menu" aria-labelledby="ZERO_TYPE" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                                        </div>
                                                    </div>
                                                </td>
                                                <th scope="row" class="th_bg">내국신용장서류번호</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="DOCUMENT_NO" name="DOCUMENT_NO" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFVat" onchange="fn_changeRowData('DOCUMENT_NO', DOCUMENT_NO)"></sbux-input>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="tabPage1">
                                    <table id="panWFBottom" class="table table-bordered tbl_fixed">
                                        <caption>관리항목</caption>
                                        <colgroup>
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 3%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 3%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 3%">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row" class="th_bg" id="LBL_ACC_ITEM_VALUE1">관리항목1</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_ITEM_VALUE1" name="ACC_ITEM_VALUE1" type="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_ITEM_VALUE1', ACC_ITEM_VALUE1)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_VALUE_NAME1" name="ACC_VALUE_NAME1" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_VALUE_NAME1', ACC_VALUE_NAME1)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-button
                                                            id="BTN_ACC_VALUE_NAME1"
                                                            class="btn btn-xs btn-outline-dark"
                                                            text="..." uitype="modal"
                                                            target-id="modal-compopup1"
                                                            onclick="fn_findAccItem(1)"
                                                    ></sbux-button>
                                                </td>
                                                <th scope="row" class="th_bg" id="LBL_ACC_ITEM_VALUE5">관리항목5</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_ITEM_VALUE5" name="ACC_ITEM_VALUE5" type="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_VALUE_NAME1', ACC_VALUE_NAME1)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_VALUE_NAME5" name="ACC_VALUE_NAME5" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_VALUE_NAME1', ACC_VALUE_NAME1)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-button
                                                            id="BTN_ACC_VALUE_NAME5"
                                                            class="btn btn-xs btn-outline-dark"
                                                            text="..." uitype="modal"
                                                            target-id="modal-compopup1"
                                                            onclick="fn_findAccItem(5)"
                                                    ></sbux-button>
                                                </td>
                                                <th scope="row" class="th_bg" id="LBL_ACC_ITEM_VALUE9">관리항목9</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_ITEM_VALUE9" name="ACC_ITEM_VALUE9" type="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_ITEM_VALUE9', ACC_ITEM_VALUE9)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_VALUE_NAME9" name="ACC_VALUE_NAME9" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_VALUE_NAME9', ACC_VALUE_NAME9)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-button
                                                            id="BTN_ACC_VALUE_NAME9"
                                                            class="btn btn-xs btn-outline-dark"
                                                            text="..." uitype="modal"
                                                            target-id="modal-compopup1"
                                                            onclick="fn_findAccItem(9)"
                                                    ></sbux-button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg" id="LBL_ACC_ITEM_VALUE2">관리항목2</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_ITEM_VALUE2" name="ACC_ITEM_VALUE2" type="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_ITEM_VALUE2', ACC_ITEM_VALUE2)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_VALUE_NAME2" name="ACC_VALUE_NAME2" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_VALUE_NAME2', ACC_VALUE_NAME2)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-button
                                                            id="BTN_ACC_VALUE_NAME2"
                                                            class="btn btn-xs btn-outline-dark"
                                                            text="..." uitype="modal"
                                                            target-id="modal-compopup1"
                                                            onclick="fn_findAccItem(2)"
                                                    ></sbux-button>
                                                </td>
                                                <th scope="row" class="th_bg" id="LBL_ACC_ITEM_VALUE6">관리항목6</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_ITEM_VALUE6" name="ACC_ITEM_VALUE6" type="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_ITEM_VALUE6', ACC_ITEM_VALUE6)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_VALUE_NAME6" name="ACC_VALUE_NAME6" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_VALUE_NAME6', ACC_VALUE_NAME6)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-button
                                                            id="BTN_ACC_VALUE_NAME6"
                                                            class="btn btn-xs btn-outline-dark"
                                                            text="..." uitype="modal"
                                                            target-id="modal-compopup1"
                                                            onclick="fn_findAccItem(6)"
                                                    ></sbux-button>
                                                </td>
                                                <th scope="row" class="th_bg" id="LBL_ACC_ITEM_VALUE10">관리항목10</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_ITEM_VALUE10" name="ACC_ITEM_VALUE10" type="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_ITEM_VALUE10', ACC_ITEM_VALUE10)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_VALUE_NAME10" name="ACC_VALUE_NAME10" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_VALUE_NAME10', ACC_VALUE_NAME10)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-button
                                                            id="BTN_ACC_VALUE_NAME10"
                                                            class="btn btn-xs btn-outline-dark"
                                                            text="..." uitype="modal"
                                                            target-id="modal-compopup1"
                                                            onclick="fn_findAccItem(10)"
                                                    ></sbux-button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg" id="LBL_ACC_ITEM_VALUE3">관리항목3</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_ITEM_VALUE3" name="ACC_ITEM_VALUE3" type="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_ITEM_VALUE3', ACC_ITEM_VALUE3)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_VALUE_NAME3" name="ACC_VALUE_NAME3" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_VALUE_NAME3', ACC_VALUE_NAME3)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-button
                                                            id="BTN_ACC_VALUE_NAME3"
                                                            class="btn btn-xs btn-outline-dark"
                                                            text="..." uitype="modal"
                                                            target-id="modal-compopup1"
                                                            onclick="fn_findAccItem(3)"
                                                    ></sbux-button>
                                                </td>
                                                <th scope="row" class="th_bg" id="LBL_ACC_ITEM_VALUE7">관리항목7</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_ITEM_VALUE7" name="ACC_ITEM_VALUE7" type="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_ITEM_VALUE7', ACC_ITEM_VALUE7)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_VALUE_NAME7" name="ACC_VALUE_NAME7" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_VALUE_NAME7', ACC_VALUE_NAME7)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-button
                                                            id="BTN_ACC_VALUE_NAME7"
                                                            class="btn btn-xs btn-outline-dark"
                                                            text="..." uitype="modal"
                                                            target-id="modal-compopup1"
                                                            onclick="fn_findAccItem(7)"
                                                    ></sbux-button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg" id="LBL_ACC_ITEM_VALUE4">관리항목4</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_ITEM_VALUE4" name="ACC_ITEM_VALUE4" type="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_ITEM_VALUE4', ACC_ITEM_VALUE4)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_VALUE_NAME4" name="ACC_VALUE_NAME4" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_VALUE_NAME4', ACC_VALUE_NAME4)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-button
                                                            id="BTN_ACC_VALUE_NAME4"
                                                            class="btn btn-xs btn-outline-dark"
                                                            text="..." uitype="modal"
                                                            target-id="modal-compopup1"
                                                            onclick="fn_findAccItem(4)"
                                                    ></sbux-button>
                                                </td>
                                                <th scope="row" class="th_bg" id="LBL_ACC_ITEM_VALUE8">관리항목8</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_ITEM_VALUE8" name="ACC_ITEM_VALUE8" type="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_ITEM_VALUE8', ACC_ITEM_VALUE8)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ACC_VALUE_NAME8" name="ACC_VALUE_NAME8" uitype="text" placeholder="" class="form-control input-sm" group-id="panWFBottom" onchange="fn_changeRowData('ACC_VALUE_NAME8', ACC_VALUE_NAME8)"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-button
                                                            id="BTN_ACC_VALUE_NAME8"
                                                            class="btn btn-xs btn-outline-dark"
                                                            text="..." uitype="modal"
                                                            target-id="modal-compopup1"
                                                            onclick="fn_findAccItem(8)"
                                                    ></sbux-button>
                                                </td>
                                                <sbux-input id="DEBIT_CREDIT" class="form-control input-sm" uitype="hidden" style="width:100%" group-id="panWFBottom"></sbux-input>
                                                <sbux-input id="ACC_CODE" class="form-control input-sm" uitype="hidden" style="width:100%" group-id="panWFBottom"></sbux-input>
                                                <sbux-input id="DESCRIPTION" name="DESCRIPTION" class="form-control input-sm" uitype="hidden" style="width:100%" group-id="panWFBottom" onchange="fn_changeRowData('DESCRIPTION', DESCRIPTION)"></sbux-input>
                                                <sbux-input id="PROJECT_CODE" name="PROJECT_CODE" class="form-control input-sm" uitype="hidden" style="width:100%" group-id="panWFBottom" onchange="fn_changeRowData('PROJECT_CODE', PROJECT_CODE)"></sbux-input>
                                                <sbux-input id="PROJECT_NAME" name="PROJECT_NAME" class="form-control input-sm" uitype="hidden" style="width:100%" group-id="panWFBottom" onchange="fn_changeRowData('PROJECT_NAME', PROJECT_NAME)"></sbux-input>
                                            </tr>
                                        </tbody>
                                    </table>
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

    <!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:1400px" id="modal-compopfim3420" name="modal-compopfim3420" uitype="middle" header-title="" body-html-id="body-modal-compopfim3420" header-is-close-button="true" footer-is-close-button="false" callback-after-close="fn_search"></sbux-modal>
    </div>
    <div id="body-modal-compopfim3420">
        <jsp:include page="../../../com/popup/comPopFim3420.jsp"></jsp:include>
    </div>
	    
	<!-- 리포트 출력 팝업 -->
	<div>
		<sbux-modal style="width:600px" id="modal-comPopFig1000Report" name="modal-comPopFig1000Report" uitype="middle" header-title="" body-html-id="body-modal-comPopFig1000Report" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
	</div>
	<div id="body-modal-comPopFig1000Report">
		<jsp:include page="../../../com/popup/comPopFig1000Report.jsp"></jsp:include>
	</div>	    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var strsourceType = "<%=request.getParameter("sourceType")%>";
    if (strsourceType == "") strsourceType = "AP";
    var p_userId = '${loginVO.maUserID}';
    var p_empCd = '${loginVO.maEmpCode}';
    var p_fiOrgCode = "${loginVO.maFIOrgCode}";
    var p_currCode = "${loginVO.maCurrCode}";
    var p_currUnit = "${loginVO.maCurrUnit}";
    var p_defaultAcctRule = "${loginVO.maDefaultAcctRule}";
    var p_deptCode = "${loginVO.maDeptCode}";
    var p_deptName = "${loginVO.maDeptName}";
    var p_isAccountManager = "${loginVO.maIsAccountManager}";
    var p_isAccountChief = "${loginVO.maIsAccountChief}";
    var p_siteCode = "${loginVO.maSiteCode}";
    var p_fiDeleteUser = "${loginVO.maFI_DELETE_USER}";
    var p_empCode = '${loginVO.maEmpCode}';

    var bnew = true;
    var bAllowPrint = false;

    var strCurrntDate;
    var strFileSourceType = "FIGDOCHEADER";
    var strFI_DELETE_USER = "";
    //-----------------------------------------------------------

    var editType = "Q";
    var copyMode = "clear";

    var jsonDocType = []; // 전표구분
    var jsonVoucherType = []; // 증빙유형
    var jsonBankCode = []; // 은행코드
    var jsonLineType = []; // 유형
    var jsonDebitCredit = []; // 차/대
    var jsonAccItemCode = []; // 관리항목코드
    var jsonCurrencyCode = []; // 통화코드
    var jsonZeroType = []; // 영세율구분
    var jsonCreditArea = []; // 여신영역
    var jsonBankAccountSeq = []; // 계좌정보
    var jsonVatCode = []; // 세금코드
    var jsonSiteCode = []; // 사업장

    //grid 초기화
    var gvwWFItem; 			// 그리드를 담기위한 객체 선언

    var jsonAccountLineList = []; 	// 그리드의 참조 데이터 주소 선언

    // Tab Data
    var jsonTabData = [
        {"id": "0", "pid": "-1", "order": "1", "text": "부가세", "targetid": "tabPage2", "targetvalue": "부가세"},
        {"id": "1", "pid": "-1", "order": "2", "text": "관리항목", "targetid": "tabPage1", "targetvalue": "관리항목"},
    ];

    var accPopupBizcompIdList = {
        ACC_VALUE_NAME1: "",
        ACC_VALUE_NAME2: "",
        ACC_VALUE_NAME3: "",
        ACC_VALUE_NAME4: "",
        ACC_VALUE_NAME5: "",
        ACC_VALUE_NAME6: "",
        ACC_VALUE_NAME7: "",
        ACC_VALUE_NAME8: "",
        ACC_VALUE_NAME9: "",
        ACC_VALUE_NAME10: ""
    }

    var accPopupWhereList = {
        ACC_VALUE_NAME1: "",
        ACC_VALUE_NAME2: "",
        ACC_VALUE_NAME3: "",
        ACC_VALUE_NAME4: "",
        ACC_VALUE_NAME5: "",
        ACC_VALUE_NAME6: "",
        ACC_VALUE_NAME7: "",
        ACC_VALUE_NAME8: "",
        ACC_VALUE_NAME9: "",
        ACC_VALUE_NAME10: ""
    }

    const fn_initSBSelect = async function () {
        let rst = await Promise.all([
            // APC
            gfnma_multiSelectInit({
                target: ['#TAX_SITE_CODE', '#SUB_TAX_SITE_CODE']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_ORG003'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'TAX_SITE_CODE'
                , colLabel: 'TAX_SITE_NAME'
                , columns: [
                    {caption: "신고사업장코드", ref: 'TAX_SITE_CODE', width: '150px', style: 'text-align:left'},
                    {caption: "신고사업장명", ref: 'TAX_SITE_NAME', width: '150px', style: 'text-align:left'}
                ]
            }),
            // 전표구분
            gfnma_setComSelect(['DOC_TYPE'], jsonDocType, 'L_FIM051', '' + (strsourceType == "AP" ? "AND AP_DOC_WRITE_YN = 'Y'" : (strsourceType == "BAD" ? "AND DOC_TYPE like '91%'" : "AND AR_DOC_WRITE_YN = 'Y'")), gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표상태
            gfnma_multiSelectInit({
                target: ['#DOC_STATUS']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIG002'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'right' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '150px', style: 'text-align:left'},
                    {caption: "전표상태", ref: 'CODE_NAME', width: '150px', style: 'text-align:left'}
                ]
            }),
            // 사용자
            gfnma_multiSelectInit({
                target: ['#PAYEE_CODE']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_USER'
                , whereClause: "AND a.USER_ID IN (SELECT CASE WHEN b.ACCOUNT_MANAGER_YN = 'Y' THEN a.USER_ID ELSE b.USER_ID END FROM sysusermaster b WHERE b.USER_ID = '" + p_userId + "')"
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'right' 	// left, right
                , colValue: 'USER_ID'
                , colLabel: 'USER_NAME'
                , columns: [
                    {caption: "사용자ID", ref: 'USER_ID', width: '150px', style: 'text-align:left'},
                    {caption: "사용자명", ref: 'USER_NAME', width: '150px', style: 'text-align:left'}
                ]
            }),
            // 증빙유형
            gfnma_setComSelect(['VOUCHER_TYPE'], jsonVoucherType, 'L_FIG005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 지급방법
            gfnma_multiSelectInit({
                target: ['#PAY_METHOD']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIM081'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "코드명", ref: 'CODE_NAME', width: '140px', style: 'text-align:left'},
                    {caption: "은행", ref: 'BANK_CODE', width: '30px', style: 'text-align:left'},
                    {caption: "계좌번호", ref: 'ACCOUNT_NUM', width: '120px', style: 'text-align:left'},
                    {caption: "계좌코드", ref: 'DEPOSIT_CODE', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 통화
            gfnma_multiSelectInit({
                target: ['#CURRENCY_CODE']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_COM001'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'CURRENCY_CODE'
                , colLabel: 'CURRENCY_NAME'
                , columns: [
                    {caption: "통화", ref: 'CURRENCY_CODE', width: '100px', style: 'text-align:left'},
                    {caption: "통화명", ref: 'CURRENCY_NAME', width: '100px', style: 'text-align:left'},
                    {caption: "비고", ref: 'DESCIPTION', width: '150px', style: 'text-align:left'}
                ]
                , callback : function(value) {
                    if(value == "KRW") {
                        $("#EXCHANGE_RATE").attr('disabled', 'true');
                    } else {
                        $("#EXCHANGE_RATE").removeAttr('disabled');
                        gvwWFItem.setColDisabled(gvwWFItem.getColRef("FUNCTIONAL_AMT"), false, true);
                    }

                    SBUxMethod.set("BASE_SCALE", parseInt(jsonCurrencyCode.filter(data => data["CURRENCY_CODE"] == value)[0]["BASE_SCALE"]));

                    fn_getExchange();
                }
            }),
            // 세금코드
            gfnma_setComSelect([''], jsonVatCode, 'L_VAT_INFO', "AND a.USE_YN = 'Y' AND b.AR_AP_TYPE = '" + strsourceType + "'", gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target: ['#VAT_CODE']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_VAT_INFO'
                , whereClause: "AND a.USE_YN = 'Y' AND b.AR_AP_TYPE = '" + strsourceType + "'"
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'VAT_CODE'
                , colLabel: 'VAT_NAME'
                , columns: [
                    {caption: "코드", ref: 'VAT_CODE', width: '30px', style: 'text-align:left'},
                    {caption: "코드명", ref: 'VAT_NAME', width: '230px', style: 'text-align:left'},
                    {caption: "유형코드", ref: 'VAT_TYPE_CODE', width: '60px', style: 'text-align:left'},
                    {caption: "유형명", ref: 'VAT_TYPE_NAME', width: '120px', style: 'text-align:left'},
                    {caption: "세율", ref: 'VAT_RATE', width: '50px', style: 'text-align:left'},
                    {caption: "상한비율", ref: 'LIMIT_PLUS_RATE', width: '50px', style: 'text-align:left'},
                    {caption: "하한비율", ref: 'LIMIT_MINUS_RATE', width: '50px', style: 'text-align:left'},
                ]
                , callback : function(value) {
                    if(gfn_nvl(SBUxMethod.get("DOC_AMT")) != "") {
                        let DOC_AMT = Number(gfn_nvl(SBUxMethod.get("DOC_AMT")).replace(/,/gi, ''));
                        let vatInfo = jsonVatCode.filter(data => data["VAT_CODE"] == gfn_nvl(value))[0];
                        let dcmvat_rate = Number(gfn_nvl(vatInfo.VAT_RATE) == "" ? "0" : gfn_nvl(vatInfo.VAT_RATE));

                        let SUPPLY_AMT = DOC_AMT / (1+(dcmvat_rate/100));
                        let VAT_AMOUNT = DOC_AMT - Number(SUPPLY_AMT);

                        SBUxMethod.set("SUPPLY_AMT", SUPPLY_AMT);
                        SBUxMethod.set("VAT_AMOUNT", VAT_AMOUNT);
                    }
                }
            }),
            // 전표템플릿
            gfnma_multiSelectInit({
                target: ['#RULE_CODE']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_RULE'
                , whereClause: (strsourceType == "AP" ? "AND AP_DOC_WRITE_YN = 'Y'" : (strsourceType == "BAD" ? "AND DOC_TYPE LIKE '91%'" : "AND AR_DOC_WRITE_YN = 'Y'"))
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'RULE_CODE'
                , colLabel: 'RULE_NAME'
                , columns: [
                    {caption: "rule코드", ref: 'RULE_CODE', width: '100px', style: 'text-align:left'},
                    {caption: "rule코드명", ref: 'RULE_NAME', width: '300px', style: 'text-align:left'},
                    {caption: "전표유형", ref: 'DOC_TYPE', width: '100px', style: 'text-align:left'},
                    {caption: "AP_DOC_YN", ref: 'AP_DOC_YN', width: '100px', style: 'text-align:left'},
                    {caption: "AR_DOC_YN", ref: 'AR_DOC_YN', width: '100px', style: 'text-align:left'},
                ]
                , callback : async function (value) {
                    if (gfn_nvl(value) == "" || gfn_nvl(SBUxMethod.get('DOC_BATCH_NO')) != "") {
                        return;
                    }
                    await fn_create();
                    await fn_searchRule();

                    //SBUxMethod.attr("DOC_TYPE", "readonly", "true");

                    $("#btnAddRow").removeAttr('disabled');
                    $("#btnDeleteRow").removeAttr('disabled');
                }
            }),
            // 은행코드
            gfnma_setComSelect(['BANK_CODE'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 전자발행
            gfnma_multiSelectInit({
                target: ['#ETAX_TYPE']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIT005'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "발행구분", ref: 'CODE_NAME', width: '150px', style: 'text-align:left'}
                ]
                , callback : function(value) {
                    var nRow = gvwWFItem.getRow();
                    if(nRow < 0) return;
                    gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("ETAX_TYPE"), value, true, true);
                }
            }),
            // 카드용도구분
            gfnma_multiSelectInit({
                target: ['#CARD_USE_TYPE']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIT012'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "카드구분", ref: 'CODE_NAME', width: '150px', style: 'text-align:left'}
                ]
                , callback : function(value) {
                    var nRow = gvwWFItem.getRow();
                    if(nRow < 0) return;
                    gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("CARD_USE_TYPE"), value, true, true);
                }
            }),
            // 내국신용장구분
            gfnma_multiSelectInit({
                target: ['#LOCAL_CREDIT_TYPE']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIT011'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'right' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "구분", ref: 'CODE_NAME', width: '150px', style: 'text-align:left'}
                ]
                , callback : function(value) {
                    var nRow = gvwWFItem.getRow();
                    if(nRow < 0) return;
                    gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("LOCAL_CREDIT_TYPE"), value, true, true);
                }
            }),
            // 불공제 사유 유형
            gfnma_multiSelectInit({
                target: ['#VAT_NOT_DEDUCTION_TYPE']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIT013'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "불공제 사유 유형", ref: 'CODE_NAME', width: '230px', style: 'text-align:left'}
                ]
                , callback : function(value) {
                    var nRow = gvwWFItem.getRow();
                    if(nRow < 0) return;
                    gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("VAT_NOT_DEDUCTION_TYPE"), value, true, true);
                }
            }),
            // 예정누락여부
            gfnma_multiSelectInit({
                target: ['#REPORT_OMIT_YN']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIT009'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "해당여부", ref: 'CODE_NAME', width: '80px', style: 'text-align:left'}
                ]
                , callback : function(value) {
                    var nRow = gvwWFItem.getRow();
                    if(nRow < 0) return;
                    gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("REPORT_OMIT_YN"), value, true, true);
                }
            }),
            // 중복발행구분
            gfnma_multiSelectInit({
                target: ['#DUP_ISSUE_BILL_TYPE']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIT007'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'up' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "구분", ref: 'CODE_NAME', width: '50px', style: 'text-align:left'}
                ]
                , callback : function(value) {
                    var nRow = gvwWFItem.getRow();
                    if(nRow < 0) return;
                    gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("DUP_ISSUE_BILL_TYPE"), value, true, true);
                }
            }),
            // 감가상각자산유형
            gfnma_multiSelectInit({
                target: ['#VAT_ASSET_TYPE']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIT014'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'up' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "자산구분", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
                , callback : function(value) {
                    var nRow = gvwWFItem.getRow();
                    if(nRow < 0) return;
                    gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("VAT_ASSET_TYPE"), value, true, true);
                }
            }),
            // 중복발행구분
            gfnma_multiSelectInit({
                target: ['#AFTER_DUE_DATE_YN']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIT006'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'up' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "해당여부", ref: 'CODE_NAME', width: '80px', style: 'text-align:left'}
                ]
                , callback : function(value) {
                    var nRow = gvwWFItem.getRow();
                    if(nRow < 0) return;
                    gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("AFTER_DUE_DATE_YN"), value, true, true);
                }
            }),
            // 영세율첨부서류여부
            gfnma_multiSelectInit({
                target: ['#ZERO_REPORT_YN']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIT019'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'up' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "해당여부", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
                , callback : function(value) {
                    var nRow = gvwWFItem.getRow();
                    if(nRow < 0) return;
                    gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("ZERO_REPORT_YN"), value, true, true);
                }
            }),
            // 수입금액제외
            gfnma_multiSelectInit({
                target: ['#EXCLUDE_REVENUE_AMT_YN']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIT008'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'up' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "해당여부", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
                , callback : function(value) {
                    var nRow = gvwWFItem.getRow();
                    if(nRow < 0) return;
                    gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("EXCLUDE_REVENUE_AMT_YN"), value, true, true);
                }
            }),
            // 수입금액제외
            gfnma_setComSelect(['gvwWFItem'], jsonZeroType, 'L_FIT010', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target: ['#ZERO_TYPE']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_FIT010'
                , whereClause: ''
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'up' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'SUB_CODE'
                , colLabel: 'CODE_NAME'
                , columns: [
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "명칭", ref: 'CODE_NAME', width: '150px', style: 'text-align:left'}
                ]
                , callback : function(value) {
                    var nRow = gvwWFItem.getRow();
                    if(nRow < 0) return;
                    gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("ZERO_TYPE"), value, true, true);
                }
            }),
            // 계좌정보
            gfnma_setComSelect([''], jsonBankAccountSeq, 'L_CS_ACCOUNT', "AND a.CS_CODE = '" + gfn_nvl(SBUxMethod.get("CS_CODE")) + "' AND '" + gfn_nvl(SBUxMethod.get("DOC_DATE")) + "' BETWEEN a.EFFECT_START_DATE AND a.EFFECT_END_DATE", gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'BANK_ACCOUNT_SEQ', 'SEQ_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target: ['#BANK_ACCOUNT_SEQ']
                , compCode: gv_ma_selectedCorpCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_CS_ACCOUNT'
                , whereClause: "AND a.CS_CODE = '" + gfn_nvl(SBUxMethod.get("CS_CODE")) + "' AND '" + gfn_nvl(SBUxMethod.get("EXPECTED_PAY_DATE")) + "' BETWEEN a.EFFECT_START_DATE AND a.EFFECT_END_DATE"
                , formId: p_formId
                , menuId: p_menuId
                , selectValue: ''
                , dropType: 'down' 	// up, down
                , dropAlign: 'left' 	// left, right
                , colValue: 'BANK_ACCOUNT_SEQ'
                , colLabel: 'SEQ_NAME'
                , columns: [
                    {caption: "행번", ref: 'BANK_ACCOUNT_SEQ', width: '50px', style: 'text-align:left'},
                    {caption: "행번명", ref: 'SEQ_NAME', width: '60px', style: 'text-align:left'},
                    {caption: "은행코드", ref: 'BANK_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "은행명", ref: 'BANK_NAME', width: '100px', style: 'text-align:left'},
                    {caption: "계좌번호", ref: 'BANK_ACCOUNT_NO', width: '130px', style: 'text-align:left'},
                    {caption: "비고", ref: 'DESCRIPTION', width: '120px', style: 'text-align:left'},
                    {caption: "계좌주", ref: 'BANK_ACCOUNT_OWNER', width: '100px', style: 'text-align:left'},
                    {caption: "거래처", ref: 'CS_CODE', width: '100px', style: 'text-align:left'},
                    {caption: "시작일", ref: 'EFFECT_START_DATE', width: '100px', style: 'text-align:left'},
                    {caption: "종료일", ref: 'EFFECT_END_DATE', width: '100px', style: 'text-align:left'},
                    {caption: "복수등록", ref: 'BNKCNT', width: '100px', style: 'text-align:left'},
                ]
                , callback : function(value) {
                    if (!bnew) return;

                    SBUxMethod.set('BANK_CODE', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BANK_CODE"]);
                    SBUxMethod.set('BANK_ACCOUNT_NO', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BANK_ACCOUNT_NO"]);
                    SBUxMethod.set('BANK_ACCOUNT_DESCRIPTION', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["DESCRIPTION"]);
                    SBUxMethod.set('BNKCNT', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BNKCNT"]);
                }
            }),
            // 유형
            gfnma_setComSelect(['gvwWFItem'], jsonLineType, 'L_FIM052', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 차/대
            gfnma_setComSelect(['gvwWFItem'], jsonDebitCredit, 'L_FIG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 관리항목코드
            gfnma_setComSelect(['gvwWFItem'], jsonAccItemCode, 'P_FIM041', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACC_ITEM_VALUE', 'ACC_VALUE_NAME', 'Y', ''),
            // 통화코드
            gfnma_setComSelect(['gvwWFItem'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 여신영역
            gfnma_setComSelect(['gvwWFItem'], jsonCreditArea, 'L_ORG020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['gvwWFItem'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
        ]);
    }

    var fn_getBankAccountSeq = async function () {
        // 계좌정보
        await gfnma_setComSelect([''], jsonBankAccountSeq, 'L_CS_ACCOUNT', "AND a.CS_CODE = '" + gfn_nvl(SBUxMethod.get("CS_CODE")) + "' AND '" + gfn_nvl(SBUxMethod.get("DOC_DATE")) + "' BETWEEN a.EFFECT_START_DATE AND a.EFFECT_END_DATE", gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'BANK_ACCOUNT_SEQ', 'SEQ_NAME', 'Y', ''),
        await gfnma_multiSelectInit({
            target: ['#BANK_ACCOUNT_SEQ']
            , compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'L_CS_ACCOUNT'
            , whereClause: "AND a.CS_CODE = '" + gfn_nvl(SBUxMethod.get("CS_CODE")) + "' AND '" + gfn_nvl(SBUxMethod.get("DOC_DATE")) + "' BETWEEN a.EFFECT_START_DATE AND a.EFFECT_END_DATE"
            , formId: p_formId
            , menuId: p_menuId
            , selectValue: ''
            , dropType: 'down' 	// up, down
            , dropAlign: 'left' 	// left, right
            , colValue: 'BANK_ACCOUNT_SEQ'
            , colLabel: 'SEQ_NAME'
            , columns: [
                {caption: "행번", ref: 'BANK_ACCOUNT_SEQ', width: '50px', style: 'text-align:left'},
                {caption: "행번명", ref: 'SEQ_NAME', width: '60px', style: 'text-align:left'},
                {caption: "은행코드", ref: 'BANK_CODE', width: '50px', style: 'text-align:left'},
                {caption: "은행명", ref: 'BANK_NAME', width: '100px', style: 'text-align:left'},
                {caption: "계좌번호", ref: 'BANK_ACCOUNT_NO', width: '130px', style: 'text-align:left'},
                {caption: "비고", ref: 'DESCRIPTION', width: '120px', style: 'text-align:left'},
                {caption: "계좌주", ref: 'BANK_ACCOUNT_OWNER', width: '100px', style: 'text-align:left'},
                {caption: "거래처", ref: 'CS_CODE', width: '100px', style: 'text-align:left'},
                {caption: "시작일", ref: 'EFFECT_START_DATE', width: '100px', style: 'text-align:left'},
                {caption: "종료일", ref: 'EFFECT_END_DATE', width: '100px', style: 'text-align:left'},
                {caption: "복수등록", ref: 'BNKCNT', width: '100px', style: 'text-align:left'},
            ]
            , callback : function(value) {
                if (!bnew) return;

                SBUxMethod.set('BANK_CODE', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BANK_CODE"]);
                SBUxMethod.set('BANK_ACCOUNT_NO', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BANK_ACCOUNT_NO"]);
                SBUxMethod.set('BANK_ACCOUNT_DESCRIPTION', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["DESCRIPTION"]);
                SBUxMethod.set('BNKCNT', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BNKCNT"]);
            }
        });
    }

    var fn_changeExpectedPayDate = async function (value) {
        if (!bnew)
            return;

        if (gfn_nvl(SBUxMethod.get('PAY_TERM_CODE')) == "" || gfn_nvl(value) == "")
            return;

        SBUxMethod.set("DIFF_DAY", gfn_nvl(value) == "" ? 0 : (gfn_diffDate(SBUxMethod.get('PAY_BASE_DATE'), value)/ (1000 * 60 * 60 * 24)));
        await fn_getBankAccountSeq();

        if (gfn_nvl(SBUxMethod.get('BASIS_TYPE')) == "5") {
            let ht1 = await fn_getExpectedPayDate(gfn_nvl(SBUxMethod.get('PAY_TERM_CODE')), value);

            SBUxMethod.set("BILL_DUE_DATE", ht1[0].hasOwnProperty("BILL_DUE_DATE") ? !gfn_nvl(ht1[0]["BILL_DUE_DATE"]) == "" ? gfn_nvl(ht1[0]["BILL_DUE_DATE"]) : "" : "");
            SBUxMethod.set("BILL_DUE_DAY", ht1[0].hasOwnProperty("BILL_DUE_DAY") ? !gfn_nvl(ht1[0]["BILL_DUE_DAY"]) == "" ? gfn_nvl(ht1[0]["BILL_DUE_DAY"]) : "" : "");
            SBUxMethod.set("BILL_DUE_PAY_DATE", ht1[0].hasOwnProperty("BILL_DUE_PAY_DATE") ? !gfn_nvl(ht1[0]["BILL_DUE_PAY_DATE"]) == "" ? gfn_nvl(ht1[0]["BILL_DUE_PAY_DATE"]) : "" : "");
        }
    }

    var fn_findDeptCode = function () {
        var searchCode = gfn_nvl(SBUxMethod.get("DEPT_CODE"));
        var searchName = gfn_nvl(SBUxMethod.get("DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_ORG001'
            , popupType: 'B'
            , whereClause: ''
            , searchCaptions: ["부서코드", "부서명", "기준일"]
            , searchInputFields: ["DEPT_CODE", "DEPT_NAME", "BASE_DATE"]
            , searchInputValues: [searchCode, searchName, gfn_dateToYmd(new Date())]
            , searchInputTypes: ["input", "input", "datepicker"]		//input, datepicker가 있는 경우
            , height: '400px'
            , tableHeader: ["기준일", "사업장", "부서명", "사업장코드"]
            , tableColumnNames: ["START_DATE", "SITE_NAME", "DEPT_NAME", "SITE_CODE"]
            , tableColumnWidths: ["100px", "150px", "100px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width: '800px'})
    }

    var fn_findApprovalNo = function () {
        var searchText = gfn_nvl(SBUxMethod.get("APPROVAL_NO"));
        var CS_CODE = gfn_nvl(SBUxMethod.get("CS_CODE"));
        var addParams = [CS_CODE == "" ? null : CS_CODE, null, "'" + strsourceType + "'"];

        SBUxMethod.attr('modal-compopup1', 'header-title', '세금계산서목록');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_INVOICE_' + strsourceType
            , popupType: 'B'
            , whereClause: addParams
            , searchCaptions: ["승인번호", "사업자번호", "상호", "작성시작일자", "작성종료일자"]
            , searchInputFields: ["APPROVAL_NO", "SELLER_REG_NO", "SELLER_NAME", "DATE_FR", "DATE_TO"]
            , searchInputValues: [searchText, "", "", gfn_dateFirstYmd(new Date()), gfn_dateToYmd(new Date())]
            , searchInputTypes: ["input", "input", "input", "datepicker", "datepicker"]		//input, datepicker가 있는 경우
            , height: '400px'
            , tableHeader: ["승인번호", "발급일자", "전송일자", "사업자번호", "상호", "대표자명", "합계금액", "공급가액", "부가세액"
                , "전자세금계산서분류", "전자세금계산서분류명", "전표담당자명", "증빙유형", "거래처코드", "거래처명"]
            , tableColumnNames: ["WRITE_DATE", "APPROVAL_NO", "ISSUE_DATE", "SEND_DATE", "SELLER_REG_NO", "SELLER_NAME", "SELLER_OWNER"
                , "TOTAL_AMT", "TOTAL_TAXABLE_AMT", "TOTAL_VAT_AMT", "EINVOICE_CATEGORY", "EINVOICE_CATEGORY_NAME", "ACCOUNT_EMP_NAME", "VOUCHER_TYPE", "CS_CODE", "CS_NAME"]
            , tableColumnWidths: ["100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('WRITE_DATE', gfn_nvl(data.WRITE_DATE));
                SBUxMethod.set('APPROVAL_NO', gfn_nvl(data.APPROVAL_NO));
                SBUxMethod.set('BIZ_REGNO', gfn_nvl(data.BUYER_REG_NO));
                SBUxMethod.set('DOC_AMT', gfn_nvl(data.TOTAL_AMT));
                SBUxMethod.set('SUPPLY_AMT', gfn_nvl(data.TOTAL_TAXABLE_AMT, 0));
                SBUxMethod.set('VAT_AMOUNT', gfn_nvl(data.TOTAL_VAT_AMT, 0));
                SBUxMethod.set('VOUCHER_TYPE', gfn_nvl(data.VOUCHER_TYPE));
                SBUxMethod.set('CS_CODE', gfn_nvl(data.CS_CODE));
                SBUxMethod.set('CS_NAME', gfn_nvl(data.CS_NAME));
                SBUxMethod.set('TXN_STOP_YN', gfn_nvl(data.TXN_STOP_YN));
                SBUxMethod.set('PAY_TERM_CODE', gfn_nvl(data.PAY_TERM_CODE));
                SBUxMethod.set('PAY_TERM_NAME', gfn_nvl(data.PAY_TERM_NAME));
                gfnma_multiSelectSet('#PAY_METHOD', 'SUB_CODE', 'CODE_NAME', gfn_nvl(data.PAY_METHOD));
                SBUxMethod.set('CURRENCY_CODE', gfn_nvl(data.CURRENCY_CODE));

                SBUxMethod.set('BASE_SCALE', gfn_nvl(data.BASE_SCALE));
                SBUxMethod.set('WITHHOLD_TAX_YN', gfn_nvl(data.WITHHOLD_TAX_YN));
                SBUxMethod.set('STEEL_SCRAP_PAY_YN', gfn_nvl(data.STEEL_SCRAP_PAY_YN));
                SBUxMethod.set('TXN_STOP_REASON', gfn_nvl(data.TXN_STOP_REASON));
                fn_changeApprovalNo(gfn_nvl(data.APPROVAL_NO));
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width: '800px'})
    }

    var fn_findCsCode = function () {
        var CS_CODE = gfn_nvl(SBUxMethod.get("CS_CODE"));
        var CS_NAME = gfn_nvl(SBUxMethod.get("CS_NAME"));
        var replaceText0 = "_CS_CODE_";
        var replaceText1 = "_CS_NAME_";
        var replaceText2 = "_BIZ_REGNO_";
        var strWhereClause = "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%' AND BIZ_REGNO LIKE '%" + replaceText2 + "%'"
            + (strsourceType == "AP" ? "AND '" + gfn_nvl(SBUxMethod.get("DOC_DATE")) + "' BETWEEN EFFECT_START_DATE AND EFFECT_END_DATE " : "");

        SBUxMethod.attr('modal-compopup1', 'header-title', strsourceType == "AP" ? '거래처 (구매)' : '거래처 (판매)');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: strsourceType == "AP" ? 'P_CS_PURCHASE_DOC' : "P_CS_SALE_DOC"
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions: ["거래처코드", "거래처명", "사업자번호"]
            , searchInputFields: ["CS_CODE", "CS_NAME", "BIZ_REGNO"]
            , searchInputValues: [CS_CODE, CS_NAME, ""]
            , height: '400px'
            , tableHeader: ["거래처코드", "거래처명", "사업자번호", "거래중지여부", "대표자", "업태", "종목", "주소", "전화", "팩스"
                , "채무계정", "채무계정명", "지급기준", "지급기준명", "지급방법", "통화", "TXN_STOP_REASON"]
            , tableColumnNames: ["CS_CODE", "CS_NAME", "BIZ_REGNO", "TXN_STOP_YN", "CHIEF_NAME", "BIZ_CATEGORY", "BIZ_ITEMS"
                , "ADDRESS", "TEL", "FAX", "AP_ACC_CODE", "AP_ACC_NAME", "PAY_TERM_CODE", "PAY_TERM_NAME", "PAY_METHOD", "CURRENCY_CODE", "TXN_STOP_REASON"]
            , tableColumnWidths: ["90px", "150px", "130px", "70px", "80px", "100px", "100px", "200px", "100px", "100px", "100px", "100px", "100px"
                , "100px", "100px", "100px", "100px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('CS_CODE', data.CS_CODE);
                SBUxMethod.set('CS_NAME', data.CS_NAME);
                SBUxMethod.set('BIZ_REGNO', data.BIZ_REGNO);

                if(gfn_nvl(data.PAY_TERM_CODE) != "") {
                    SBUxMethod.set('PAY_TERM_CODE', data.PAY_TERM_CODE);
                    SBUxMethod.set('PAY_TERM_NAME', data.PAY_TERM_NAME);
                }

                if(gfn_nvl(data.PAY_TERM_CODE) != "") {
                    gfnma_multiSelectSet('#PAY_METHOD', 'SUB_CODE', 'CODE_NAME', gfn_nvl(data.PAY_METHOD));
                }

                if(gfn_nvl(data.CURRENCY_CODE) != "") {
                    gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', data.CURRENCY_CODE);
                }
                
                if (gfn_nvl(data.CS_CODE) != "" && gfn_nvl(SBUxMethod.get("DOC_TYPE")) != "") {
                    SBUxMethod.attr("DOC_TYPE", "readonly", "true");

                    $("#btnAddRow").removeAttr('disabled');
                    $("#btnDeleteRow").removeAttr('disabled');
                    $("#btnCreateLine").removeAttr('disabled');
                } else {
                    SBUxMethod.attr("DOC_TYPE", "readonly", "false");

                    $("#btnAddRow").attr('disabled', 'true');
                    $("#btnDeleteRow").attr('disabled', 'true');
                    $("#btnCreateLine").attr('disabled', 'true');
                }

                fn_getBankAccountSeq();
            },
        });
    }

    var fn_findPayTermCode = function () {
        var searchCode = gfn_nvl(SBUxMethod.get("PAY_TERM_CODE"));
        var searchName = gfn_nvl(SBUxMethod.get("PAY_TERM_NAME"));
        var replaceText0 = "_PAY_TERM_CODE_";
        var replaceText1 = "_PAY_TERM_NAME_";
        var strWhereClause = "AND A.PAY_TERM_CODE LIKE '%" + replaceText0 + "%' AND A.PAY_TERM_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '지급기일정보');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: strsourceType == "AP" ? 'P_PAY_DATE_P' : "P_PAY_DATE_S"
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions: ["코드", "명칭"]
            , searchInputFields: ["PAY_TERM_CODE", "PAY_TERM_NAME"]
            , searchInputValues: [searchCode, searchName]
            , height: '400px'
            , tableHeader: ["지급기일코드", "지급기일명", "지급기준"]
            , tableColumnNames: ["PAY_TERM_CODE", "PAY_TERM_NAME", "PAY_METHOD_NAME"]
            , tableColumnWidths: ["80px", "250px", "100px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('PAY_TERM_NAME', data.PAY_TERM_NAME);
                SBUxMethod.set('PAY_TERM_CODE', data.PAY_TERM_CODE);
                gfnma_multiSelectSet('#PAY_METHOD', 'SUB_CODE', 'CODE_NAME', gfn_nvl(data.PAY_METHOD));
                SBUxMethod.set('BASIS_TYPE', data.BASIS_TYPE);

                fn_payTermCodeOnchange(gfn_nvl(data.PAY_TERM_CODE));
            },
        });
    }

    var fn_findAccItem = function (num) {
        var searchCode = gfn_nvl(SBUxMethod.get("ACC_ITEM_VALUE" + num));
        var searchName = gfn_nvl(SBUxMethod.get("ACC_VALUE_NAME" + num));
        var replaceText0 = "_ACC_ITEM_VALUE_";
        var replaceText1 = "_ACC_VALUE_NAME_";
        var strWhereClause = "AND ACC_ITEM_VALUE LIKE '%" + replaceText0 + "%' AND ACC_VALUE_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '관리항목 정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FIM041'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["관리항목코드", "관리항목명"]
            ,searchInputFields		: ["ACC_ITEM_VALUE", "ACC_VALUE_NAME"]
            ,searchInputValues		: [searchCode, searchName]
            ,searchInputTypes		: ["input", "input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", ""]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["관리항목", "관리항목명", "데이터유형", "컨트롤유형"]
            ,tableColumnNames		: ["ACC_ITEM_VALUE", "ACC_VALUE_NAME", "DATA_TYPE", "CONTROL_TYPE"]
            ,tableColumnWidths		: ["100px", "100px", "80px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('ACC_VALUE_NAME' + num, data.ACC_VALUE_NAME);
                SBUxMethod.set('ACC_ITEM_VALUE' + num, data.ACC_ITEM_VALUE);
            },
        });
    }

    var fn_findVatTypeForGvwWFItem = function (row) {
        var addParam = [gfn_dateToYmd(new Date())];

        SBUxMethod.attr('modal-compopup1', 'header-title', '부가세계정정보');
        SBUxMethod.openModal('modal-compopup1');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: strsourceType == "AP" ? 'P_ACCOUNT_POPUP_AP_Q' : "P_ACCOUNT_POPUP_AR_Q"
            , popupType: 'B'
            , whereClause: addParam
            , searchCaptions: ["코드", "코드명"]
            , searchInputFields: ["VAT_CODE", "VAT_NAME"]
            , searchInputValues: ["", ""]
            , searchInputTypes: ["input", "input"]		//input, datepicker가 있는 경우
            , height: '400px'
            , tableHeader: ["부가세코드", "부가세명", "부가세유형"]
            , tableColumnNames: ["VAT_CODE", "VAT_NAME", "VAT_TYPE_CODE"]
            , tableColumnWidths: ["100px", "200px", "100px"]
            , itemSelectEvent: function (data) {
                gvwWFItem.setCellData(row, gvwWFItem.getColRef("VAT_CODE"), data.VAT_CODE, true, true);
                gvwWFItem.setCellData(row, gvwWFItem.getColRef("VAT_NAME"), data.VAT_NAME, true, true);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width: '600px'})
    }

    var fn_findAccountCodeForGvwWFItem = function (row) {
        let OPEN_TO_ALL_YN = gfn_nvl(SBUxMethod.get("OPEN_TO_ALL_YN").OPEN_TO_ALL_YN) == "" ? "'Y'" : "'" + gfn_nvl(SBUxMethod.get("OPEN_TO_ALL_YN").OPEN_TO_ALL_YN) + "'";
        let LINE_TYPE = "'"+gvwWFItem.getCellData(row, gvwWFItem.getColRef("LINE_TYPE"))+"'";
        let OPEN_TO_FCM_YN = gfn_nvl(SBUxMethod.get("OPEN_TO_FCM_YN").OPEN_TO_FCM_YN) == "" ? "'Y'" : "'" + gfn_nvl(SBUxMethod.get("OPEN_TO_FCM_YN").OPEN_TO_FCM_YN) + "'";
        var addParam = [OPEN_TO_ALL_YN, LINE_TYPE, OPEN_TO_FCM_YN];

        SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목 정보');
        SBUxMethod.openModal('modal-compopup1');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: "P_FIM045_LINE"
            , popupType: 'B'
            , whereClause: addParam
            , searchCaptions: ["코드", "코드명"]
            , searchInputFields: ["ACCOUNT_CODE", "ACCOUNT_NAME"]
            , searchInputValues: ["", ""]
            , searchInputTypes: ["input", "input"]		//input, datepicker가 있는 경우
            , height: '400px'
            , tableHeader: ["계정코드", "계정명", "계정명(한글)"]
            , tableColumnNames: ["ACCOUNT_CODE", "ACCOUNT_NAME", "ACCOUNT_NAME_CHN"]
            , tableColumnWidths: ["100px", "200px", "200px"]
            , itemSelectEvent: function (data) {
                gvwWFItem.setCellData(row, gvwWFItem.getColRef("ACCOUNT_CODE"), data.ACCOUNT_CODE, true, true);
                gvwWFItem.setCellData(row, gvwWFItem.getColRef("ACCOUNT_NAME"), data.ACCOUNT_NAME, true, true);
                for(var i = 1; i < 11; i++) {
                    gvwWFItem.setCellData(row, gvwWFItem.getColRef("ACC_ITEM_CODE"+i), data["ACC_ITEM_CODE"+i], true, true);
                    gvwWFItem.setCellData(row, gvwWFItem.getColRef("ACC_ITEM_NAME"+i), data["ACC_ITEM_NAME"+i], true, true);
                    gvwWFItem.setCellData(row, gvwWFItem.getColRef("DATA_TYPE"+i), data["DATA_TYPE"+i], true, true);
                    gvwWFItem.setCellData(row, gvwWFItem.getColRef("POPUP_ID"+i), data["POPUP_ID"+i], true, true);
                    gvwWFItem.setCellData(row, gvwWFItem.getColRef("ACC_ITEM_YN"+i), data["ACC_ITEM_YN"+i], true, true);
                }

                gvwWFItem.setCellData(row, gvwWFItem.getColRef("ACC_CHARACTER"), data.ACC_CHARACTER, true, true);
                gvwWFItem.setCellData(row, gvwWFItem.getColRef("PROJECT_YN"), data.PROJECT_YN, true, true);
                gvwWFItem.setCellData(row, gvwWFItem.getColRef("COST_CLASS"), data.COST_CLASS, true, true);
            },/*
            returnDataFilter: function (data) {
                if (gvwWFItem.getCellData(row, gvwWFItem.getColRef("LINE_TYPE")) == "2") {
                    return data.filter(d => {
                        d["ACC_CHARACTER"] == "C" || d["ACC_CHARACTER"] == "V"
                    });
                } else {
                    return data;
                }
            }*/
        });
        SBUxMethod.setModalCss('modal-compopup1', {width: '600px'})
    }

    var fn_findCostCenterCodeForGvwWFItem = function (row) {
        var replaceText0 = "_COST_CENTER_CODE_";
        var replaceText1 = "_COST_CENTER_NAME_";
        var strWhereClause = "AND A.COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND A.COST_CENTER_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점');
        SBUxMethod.openModal('modal-compopup1');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: "P_CC_INPUT"
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions: ["코드", "명칭"]
            , searchInputFields: ["COST_CENTER_CODE", "COST_CENTER_NAME"]
            , searchInputValues: ["", ""]
            , height: '400px'
            , tableHeader: ["코드", "명칭", "부서코드", "부서명", "사업장", "여신영역"]
            , tableColumnNames: ["COST_CENTER_CODE", "COST_CENTER_NAME", "DEPT_CODE", "DEPT_NAME", "SITE_CODE", "CREDIT_AREA"]
            , tableColumnWidths: ["100px", "150px", "100px", "100px", "100px", "100px"]
            , itemSelectEvent: function (data) {
                gvwWFItem.setCellData(row, gvwWFItem.getColRef("COST_CLASS"), data.COST_CLASS, true, true);
                gvwWFItem.setCellData(row, gvwWFItem.getColRef("COST_CENTER_CODE"), data.COST_CENTER_CODE, true, true);
                gvwWFItem.setCellData(row, gvwWFItem.getColRef("COST_CENTER_NAME"), data.COST_CENTER_NAME, true, true);
            },
        });
    }

    var fn_findFiDeptCodeForGvwWFItem = function (row) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '부서 정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FI_DEPT'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: ["", 	"",	gfn_dateToYmd(new Date())]
            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
            ,width					: '700px'
            ,height					: '300px'
            ,tableHeader			: ["부서코드", 		"부서명"]
            ,tableColumnNames		: ["DEPT_CODE", 	"DEPT_NAME"]
            ,tableColumnWidths		: ["150px", 		"250px"]
            ,itemSelectEvent		: function (data){
                gvwWFItem.setCellData(row, gvwWFItem.getColRef("DEPT_CODE"), data.DEPT_CODE, true, true);
                gvwWFItem.setCellData(row, gvwWFItem.getColRef("DEPT_NAME"), data.DEPT_NAME, true, true);
            },
        });
        SBUxMethod.openModal('modal-compopup1');
    }

    var fn_findProjectCodeForGvwWFItem = function (row) {
        var replaceText0 = "_PROJECT_CODE_";
        var replaceText1 = "_PROJECT_NAME_";
        var strWhereClause = "AND I.PROJECT_CODE LIKE '%" + replaceText0 + "%' AND I.PROJECT_NAME LIKE '%" + replaceText1 + "%' AND I.FI_ORG_CODE ='"+p_fiOrgCode+"'";

        SBUxMethod.attr('modal-compopup1', 'header-title', "프로젝트 정보");

        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: "P_COM028_C"
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions: ["프로젝트코드", "프로젝트명"]
            , searchInputFields: ["PROJECT_CODE", "PROJECT_NAME"]
            , searchInputValues: ["", ""]
            , height: '400px'
            , tableHeader: ["프로젝트코드", "프로젝트명", "코스트센터코드", "코스트센터"]
            , tableColumnNames: ["PROJECT_CODE", "PROJECT_NAME", "COST_CENTER_CODE", "COST_CENTER_NAME"]
            , tableColumnWidths: ["150px", "250px", "100px", "250px"]
            , itemSelectEvent: function (data) {
                gvwWFItem.setCellData(row, gvwWFItem.getColRef("PROJECT_CODE"), data.PROJECT_CODE, true, true);
                gvwWFItem.setCellData(row, gvwWFItem.getColRef("PROJECT_NAME"), data.PROJECT_NAME, true, true);
            },
        });

        SBUxMethod.openModal('modal-compopup1');
    }

    // 복사모드토글
    const fn_toggleMode = async function (mode) {
        if (mode == "clear") {
            $("#btnClearMode").hide();
            $("#btnLineCopyMode").show();
            $("#btnCellCopyMode").hide();
            copyMode = "line";
        } else if (mode == "line") {
            $("#btnClearMode").hide();
            $("#btnLineCopyMode").hide();
            $("#btnCellCopyMode").show();
            copyMode = "cell";
        } else if (mode == "cell") {
            $("#btnClearMode").show();
            $("#btnLineCopyMode").hide();
            $("#btnCellCopyMode").hide();
            copyMode = "clear";
        }

        _SBGrid.destroy('gvwWFItem');
        fn_createGvwWFItemGrid();
    }

    async function fn_createGvwWFItemGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwWFItem';
        SBGridProperties.id = 'gvwWFItem';
        SBGridProperties.jsonref = 'jsonAccountLineList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol = 'scroll';

        if (copyMode == 'clear') { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if (copyMode == 'line') { //행복사모드
            SBGridProperties.selectmode = 'byrows'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.
        } else if (copyMode == 'cell') { //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }

        SBGridProperties.frozencols = 11;
        SBGridProperties.columns = [
            {
                caption: ["ITEM_ID"],
                ref: 'ITEM_ID',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {caption: ["KEY_ID"], ref: 'KEY_ID', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["순번"], ref: 'ITEM_SEQ', type: 'output', width: '40px', style: 'text-align:left'},
            {
                caption: ["유형"], ref: 'LINE_TYPE', type: 'combo', width: '71px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonLineType',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
            },
            {
                caption: ["차/대"], ref: 'DEBIT_CREDIT', type: 'combo', width: '66px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonDebitCredit',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
            },
            {caption: ["부가세유형"], ref: 'VAT_TYPE', type: 'output', width: '72px', style: 'text-align:left'},
            {caption: ["부가세유형명"], ref: 'VAT_NAME', type: 'output', width: '184px', style: 'text-align:left'},
            {caption: ["부가세유형명"], 		ref: 'VAT_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findVatTypeForGvwWFItem(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["계정코드"], ref: 'ACCOUNT_CODE', type: 'output', width: '80px', style: 'text-align:left'},
            {caption: ["계정과목명"], ref: 'ACCOUNT_NAME', type: 'output', width: '170px', style: 'text-align:left'},
            {caption: ["계정과목명"], 		ref: 'ACCOUNT_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findAccountCodeForGvwWFItem(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {
                caption: ["통화금액"], ref: 'ORIGINAL_AMT', type: 'input', width: '126px', style: 'text-align:right',
                typeinfo: {mask: {alias: 'numeric'}, maxlength: 24}
                , format: {type: 'number', rule: '#,###.00', emptyvalue: '0.00'}
            },
            {
                caption: ["전표금액"], ref: 'FUNCTIONAL_AMT', type: 'input', width: '135px', style: 'text-align:right',
                typeinfo: {mask: {alias: 'numeric'}, maxlength: 24}
                , format: {type: 'number', rule: '#,###', emptyvalue: '0'}
            },
            {
                caption: ["통화"], ref: 'CURRENCY_CODE', type: 'combo', style: 'text-align:left', width: '80px',
                typeinfo: {
                    ref: 'jsonCurrencyCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
            },
            {
                caption: ["환율"], ref: 'EXCHANGE_RATE', type: 'output', width: '75px', style: 'text-align:right',
                typeinfo: {mask: {alias: 'numeric'}, maxlength: 24}
                , format: {type: 'number', rule: '#,###.00', emptyvalue: '0.00'}
            },
            {caption: ["부서"], ref: 'DEPT_NAME', type: 'output', width: '120px', style: 'text-align:left'},
            {caption: ["부서"], 		ref: 'DEPT_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findFiDeptCodeForGvwWFItem(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["원가중심점"], ref: 'COST_CENTER_CODE', type: 'output', width: '91px', style: 'text-align:left'},
            {caption: ["원가중심점명"], ref: 'COST_CENTER_NAME', type: 'output', width: '150px', style: 'text-align:left'},
            {caption: ["원가중심점명"], 		ref: 'COST_CENTER_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findCostCenterCodeForGvwWFItem(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["사업장"], ref: 'SITE_CODE', type: 'input', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonSiteCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
            },
            {caption: ["적요"], ref: 'DESCRIPTION', type: 'input', width: '300px', style: 'text-align:left'},
            {caption: ["프로젝트코드"], ref: 'PROJECT_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["프로젝트명"], ref: 'PROJECT_NAME', type: 'output', width: '234px', style: 'text-align:left'},
            {caption: ["프로젝트명"], 		ref: 'PROJECT_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findProjectCodeForGvwWFItem(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["품목"], ref: 'ITEM_CODE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["단위"], ref: 'UOM', type: 'output', width: '60px', style: 'text-align:left'},
            {caption: ["수량"], ref: 'TXN_QTY', type: 'input', width: '60px', style: 'text-align:left'},
            {
                caption: ["건수"],
                ref: 'SOURCE_RECORD_COUNT',
                type: 'input',
                width: '75px',
                style: 'text-align:left'
            },
            {
                caption: ["여신관리영역"], ref: 'CREDIT_AREA', type: 'combo', style: 'text-align:left', width: '79px',
                typeinfo: {
                    ref: 'jsonCreditArea',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
            },
            {caption: ["사업자번호"], ref: 'REG_NO', type: 'output', width: '90px', style: 'text-align:left'},
            {
                caption: ["귀속부서코드"],
                ref: 'DEPT_CODE',
                type: 'output',
                width: '80px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["관리항목1"], ref: 'ACC_ITEM_CODE1', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {
                caption: ["관리항목2"], ref: 'ACC_ITEM_CODE2', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {
                caption: ["관리항목3"], ref: 'ACC_ITEM_CODE3', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {
                caption: ["관리항목4"], ref: 'ACC_ITEM_CODE4', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {
                caption: ["관리항목5"], ref: 'ACC_ITEM_CODE5', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {
                caption: ["관리항목6"], ref: 'ACC_ITEM_CODE6', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {
                caption: ["관리항목7"], ref: 'ACC_ITEM_CODE7', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {
                caption: ["관리항목8"], ref: 'ACC_ITEM_CODE8', type: 'output', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAccItemCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {
                caption: ["관리항목9"],
                ref: 'ACC_ITEM_CODE9',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["관리항목10"],
                ref: 'ACC_ITEM_CODE10',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_NAME1"],
                ref: 'ACC_ITEM_NAME1',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_NAME2"],
                ref: 'ACC_ITEM_NAME2',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_NAME3"],
                ref: 'ACC_ITEM_NAME3',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_NAME4"],
                ref: 'ACC_ITEM_NAME4',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_NAME5"],
                ref: 'ACC_ITEM_NAME5',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_NAME6"],
                ref: 'ACC_ITEM_NAME6',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_NAME7"],
                ref: 'ACC_ITEM_NAME7',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_NAME8"],
                ref: 'ACC_ITEM_NAME8',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_NAME9"],
                ref: 'ACC_ITEM_NAME9',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_NAME10"],
                ref: 'ACC_ITEM_NAME10',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_YN1"],
                ref: 'ACC_ITEM_YN1',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_YN2"],
                ref: 'ACC_ITEM_YN2',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_YN3"],
                ref: 'ACC_ITEM_YN3',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_YN4"],
                ref: 'ACC_ITEM_YN4',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_YN5"],
                ref: 'ACC_ITEM_YN5',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_YN6"],
                ref: 'ACC_ITEM_YN6',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_YN7"],
                ref: 'ACC_ITEM_YN7',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_YN8"],
                ref: 'ACC_ITEM_YN8',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_YN9"],
                ref: 'ACC_ITEM_YN9',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_YN10"],
                ref: 'ACC_ITEM_YN10',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["DATA_TYPE1"],
                ref: 'DATA_TYPE1',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["DATA_TYPE2"],
                ref: 'DATA_TYPE2',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["DATA_TYPE3"],
                ref: 'DATA_TYPE3',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["DATA_TYPE4"],
                ref: 'DATA_TYPE4',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["DATA_TYPE5"],
                ref: 'DATA_TYPE5',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["DATA_TYPE6"],
                ref: 'DATA_TYPE6',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["DATA_TYPE7"],
                ref: 'DATA_TYPE7',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["DATA_TYPE8"],
                ref: 'DATA_TYPE8',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["DATA_TYPE9"],
                ref: 'DATA_TYPE9',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["DATA_TYPE10"],
                ref: 'DATA_TYPE10',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["POPUP_ID1"],
                ref: 'POPUP_ID1',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["POPUP_ID2"],
                ref: 'POPUP_ID2',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["POPUP_ID3"],
                ref: 'POPUP_ID3',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["POPUP_ID4"],
                ref: 'POPUP_ID4',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["POPUP_ID5"],
                ref: 'POPUP_ID5',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["POPUP_ID6"],
                ref: 'POPUP_ID6',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["POPUP_ID7"],
                ref: 'POPUP_ID7',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["POPUP_ID8"],
                ref: 'POPUP_ID8',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["POPUP_ID9"],
                ref: 'POPUP_ID9',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["POPUP_ID10"],
                ref: 'POPUP_ID10',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_VALUE1"],
                ref: 'ACC_ITEM_VALUE1',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_VALUE2"],
                ref: 'ACC_ITEM_VALUE2',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_VALUE3"],
                ref: 'ACC_ITEM_VALUE3',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_VALUE4"],
                ref: 'ACC_ITEM_VALUE4',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_VALUE5"],
                ref: 'ACC_ITEM_VALUE5',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_VALUE6"],
                ref: 'ACC_ITEM_VALUE6',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_VALUE7"],
                ref: 'ACC_ITEM_VALUE7',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_VALUE8"],
                ref: 'ACC_ITEM_VALUE8',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_VALUE9"],
                ref: 'ACC_ITEM_VALUE9',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_ITEM_VALUE10"],
                ref: 'ACC_ITEM_VALUE10',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_VALUE_NAME1"],
                ref: 'ACC_VALUE_NAME1',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_VALUE_NAME2"],
                ref: 'ACC_VALUE_NAME2',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_VALUE_NAME3"],
                ref: 'ACC_VALUE_NAME3',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_VALUE_NAME4"],
                ref: 'ACC_VALUE_NAME4',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_VALUE_NAME5"],
                ref: 'ACC_VALUE_NAME5',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_VALUE_NAME6"],
                ref: 'ACC_VALUE_NAME6',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_VALUE_NAME7"],
                ref: 'ACC_VALUE_NAME7',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_VALUE_NAME8"],
                ref: 'ACC_VALUE_NAME8',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_VALUE_NAME9"],
                ref: 'ACC_VALUE_NAME9',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_VALUE_NAME10"],
                ref: 'ACC_VALUE_NAME10',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["ACC_CHARACTER"],
                ref: 'ACC_CHARACTER',
                type: 'output',
                width: '100px',
                style: 'text-align:left',
                hidden: true
            },
            {caption: ["환산단위"], ref: 'BASE_SCALE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["계정분류"], ref: 'ACC_CATEGORY', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["부가세유형"], ref: 'VAT_TYPE_CODE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["원천소스"], ref: 'ITEM_SOURCE_TYPE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {
                caption: ["원천전표번호"],
                ref: 'ITEM_DOC_NAME',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["원천라인ID"],
                ref: 'ITEM_SOURCE_ID',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["TMP_ACCOUNT_CODE"],
                ref: 'TMP_ACCOUNT_CODE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["TMP_ACCOUNT_NAME"],
                ref: 'TMP_ACCOUNT_NAME',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["PROJECT_YN"],
                ref: 'PROJECT_YN',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["전자발행구분"],
                ref: 'ETAX_TYPE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["11일외전송여부"],
                ref: 'AFTER_DUE_DATE_YN',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["중복발행구분"],
                ref: 'DUP_ISSUE_BILL_TYPE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["수입금액제외여부"],
                ref: 'EXCLUDE_REVENUE_AMT_YN',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["카드용도구분"],
                ref: 'CARD_USE_TYPE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {caption: ["카드번호"], ref: 'CARD_NUM', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {
                caption: ["불공제유형"],
                ref: 'VAT_NOT_DEDUCTION_TYPE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["예정신고누락여부"],
                ref: 'REPORT_OMIT_YN',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["공급가액"],
                ref: 'SUPPLY_AMT',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["신고일자"],
                ref: 'STANDARD_DATE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["감가상각자산유형"],
                ref: 'VAT_ASSET_TYPE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["영세율첨부서류여부"],
                ref: 'ZERO_REPORT_YN',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["내국신용장구분"],
                ref: 'LOCAL_CREDIT_TYPE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["서류명"],
                ref: 'DOCUMENT_NAME',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["발급자"],
                ref: 'ISSUE_NAME',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["발급일자"],
                ref: 'DOCUMENT_ISSUE_DATE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["수출신고번호"],
                ref: 'EXPORT_LICENSE_NO',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["선적일자"],
                ref: 'SHIPPING_DATE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["당기제출금_외화"],
                ref: 'EXPORT_AMT',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["당기제출금_원화"],
                ref: 'EXPORT_AMT_KRW',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["당기신고해당분_외화"],
                ref: 'VAT_EXPORT_AMT',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["당기신고해당분_원화"],
                ref: 'VAT_EXPORT_AMT_KRW',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["수출외화금액"],
                ref: 'FOREIGN_AMT',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["수출원화금액"],
                ref: 'WON_AMT',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["내국신용장서류번호"],
                ref: 'DOCUMENT_NO',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["영세율구분"], ref: 'ZERO_TYPE', type: 'combo', style: 'text-align:left', width: '83px',
                typeinfo: {
                    ref: 'jsonZeroType',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["부가세"], ref: 'VAT_AMT', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {
                caption: ["원천징수여부"],
                ref: 'WITHHOLD_FLAG',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["원천징수세금코드"],
                ref: 'WITHHOLD_TAX_TYPE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["원천징수거래처코드"],
                ref: 'WITHHOLD_CS_CODE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["원천징수세금코드2"],
                ref: 'WITHHOLD_TAX_TYPE2',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["원천징수거래처코드2"],
                ref: 'WITHHOLD_CS_CODE2',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["PO번호"],
                ref: 'PO_LINE_NO',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["영업사원"],
                ref: 'SALES_PERSON',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["고객사코드"],
                ref: 'SALES_CS_CODE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["반제완료일"],
                ref: 'APPLY_COMPLETE_DATE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["반제완료여부"],
                ref: 'APPLY_COMPLETE_FLAG',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["보류여부"],
                ref: 'HOLD_FLAG',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["해제일"],
                ref: 'RELEASE_DATE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["해제자"],
                ref: 'RELEASE_USER',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {caption: ["보류일"], ref: 'HOLD_DATE', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {caption: ["보류자"], ref: 'HOLD_USER', type: 'output', width: '75px', style: 'text-align:left', hidden: true},
            {
                caption: ["보류사유"],
                ref: 'HOLD_REASON',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["지급기산일"],
                ref: 'PAY_BASE_DATE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["어음만기일"],
                ref: 'BILL_DUE_DATE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["어음기일"],
                ref: 'BILL_DUE_DAY',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["어음만기지급일"],
                ref: 'BILL_DUE_PAY_DATE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["최초지급조건"],
                ref: 'PAY_TERM_ORIG',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["제품군코드"],
                ref: 'PROD_GROUP',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["계좌행번"],
                ref: 'BANK_ACCOUNT_SEQ',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["원가유형"],
                ref: 'COST_CLASS',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["불공제여부"],
                ref: 'NONDED_YN',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            }
        ];

        gvwWFItem = _SBGrid.create(SBGridProperties);
        /*gvwWFItem.bind('dblclick', 'fn_gvwWFItemDblclick');*/
        gvwWFItem.bind('valuechanged', 'fn_gvwWFItemValueChanged');
        gvwWFItem.bind('click', 'fn_view');
    }

    const fn_gvwWFItemDblclick = async function () {
        var nRow = gvwWFItem.getRow();
        var nCol = gvwWFItem.getCol();

        if (nCol == 5) {
            fn_findVatTypeForGvwWFItem(nRow);
        }

        if (nCol == 6) {
            fn_findVatTypeForGvwWFItem(nRow);
        }

        if (nCol == 7) {
            fn_findAccountCodeForGvwWFItem(nRow);
        }

        if (nCol == 8) {
            fn_findAccountCodeForGvwWFItem(nRow);
        }

        if (nCol == 15) {
            fn_findCostCenterCodeForGvwWFItem(nRow);
        }

        if (nCol == 16) {
            fn_findCostCenterCodeForGvwWFItem(nRow);
        }
    }

    const fn_gvwWFItemValueChanged = async function () {
        var nRow = gvwWFItem.getRow();
        var nCol = gvwWFItem.getCol();
        var rowData = gvwWFItem.getRowData(nRow);

        if (nCol == gvwWFItem.getColRef("CURRENCY_CODE")) {

            let ht = fn_getExchangeRate(SBUxMethod.get("DOC_DATE"), rowData.CURRENCY_CODE, null);

            gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("EXCHANGE_RATE"), Number(ht["RATE"]), true, true);
            gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("BASE_SCALE"), Number(ht["BASE_SCALE"]), true, true);
            gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("FUNCTIONAL_AMT"), Math.round(Number(gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("ORIGINAL_AMT"))) * Number(gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("EXCHANGE_RATE"))) / Number(gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("BASE_SCALE"))), p_currUnit), true, true);
        }

        if (nCol == gvwWFItem.getColRef("ORIGINAL_AMT")) {
            gvwWFItem.setCellData(nRow, gvwWFItem.getColRef("FUNCTIONAL_AMT"), Math.round(Number(gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("ORIGINAL_AMT"))) * Number(SBUxMethod.get("EXCHANGE_RATE")) / Number(SBUxMethod.get("BASE_SCALE")), p_currUnit), true, true);
            // 합계
            fn_summary();
        }

        if (nCol == gvwWFItem.getColRef("FUNCTIONAL_AMT")) {
            // 합계
            fn_summary();
        } else if (nCol == gvwWFItem.getColRef("ACCOUNT_CODE")) {
            fn_changeControlSettings(rowData);
        } else if (nCol == gvwWFItem.getColRef("DEBIT_CREDIT")) {

            // 합계
            fn_summary();

            if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("ACCOUNT_CODE")) == "" || gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("ACCOUNT_NAME")) == "")
                return;

            SBUxMethod.set("DEBIT_CREDIT", gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("DEBIT_CREDIT")));

            // 차대 구분에 따라 컨트롤 필수 속성 변경
            for (var i = 1; i <= 10; i++) {
                if (gvwWFItem.getColRef("ACC_ITEM_VALUE" + i) != -1) {
                    if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("DEBIT_CREDIT")) == "D") {
                        if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("ACC_ITEM_YN" + i)) == "Y") {
                            SBUxMethod.attr("ACC_ITEM_VALUE" + i, "required", "true");
                            $("#ACC_ITEM_VALUE" + i).addClass("inpt_data_reqed");
                            if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("DATA_TYPE" + i)) == "POPUP") {
                                SBUxMethod.attr("ACC_VALUE_NAME" + i, "required", "true");
                                $("#ACC_VALUE_NAME" + i).addClass("inpt_data_reqed");
                            }
                        } else {
                            SBUxMethod.attr("ACC_ITEM_VALUE" + i, "required", "false");
                            $("#ACC_ITEM_VALUE" + i).removeClass("inpt_data_reqed");
                        }
                    } else if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("DEBIT_CREDIT")) == "C") {
                        if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("ACC_ITEM_YN" + i)) == "Y") {
                            SBUxMethod.attr("ACC_ITEM_VALUE" + i, "required", "true");
                            $("#ACC_ITEM_VALUE" + i).addClass("inpt_data_reqed");
                            if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("DATA_TYPE" + i)) == "POPUP") {
                                SBUxMethod.attr("ACC_VALUE_NAME" + i, "required", "true");
                                $("#ACC_VALUE_NAME" + i).addClass("inpt_data_reqed");
                            }
                        } else {
                            SBUxMethod.attr("ACC_ITEM_VALUE" + i, "required", "false");
                            $("#ACC_ITEM_VALUE" + i).removeClass("inpt_data_reqed");
                        }
                    }
                }
            }
        } else if (nCol == gvwWFItem.getColRef("ACC_CHARACTER")) {
            fn_changeControlSettings(rowData);
        } else if (nCol == gvwWFItem.getColRef("ACC_ITEM_VALUE1")) {
            if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("LINE_TYPE")) == "1" && (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("VAT_TYPE")) == "VK" || gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("VAT_TYPE")) == "VL")) {
                SBUxMethod.set("VOUCHER_TYPE", "C")
                SBUxMethod.set("VOUCHER_NO", SBUxMethod.get("ACC_ITEM_VALUE1"));
            }
        }
    }

    const fn_changeRowData = async function (ref, data) {
        var nRow = gvwWFItem.getRow();
        if(nRow < 1) return;
        gvwWFItem.setCellData(nRow, gvwWFItem.getColRef(ref), data, true, true);
    }

    const fn_baseFocusedRowChanged = async function (nRow, nCol) {
        var rowData = gvwWFItem.getRowData(nRow);
        fn_changeControlSettings(rowData);

        if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("LINE_TYPE")) == "3") {
            SBUxMethod.enableTab('idxTab','tabPage2')
            SBUxMethod.setTab('idxTab','tabPage2');
            $("#btnDeleteRow").attr('disabled', 'true');

            gfnma_multiSelectSet('#ETAX_TYPE', 'SUB_CODE', 'CODE_NAME', rowData.ETAX_TYPE);
            gfnma_multiSelectSet('#CARD_USE_TYPE', 'SUB_CODE', 'CODE_NAME', rowData.CARD_USE_TYPE);
            gfnma_multiSelectSet('#LOCAL_CREDIT_TYPE', 'SUB_CODE', 'CODE_NAME', rowData.LOCAL_CREDIT_TYPE);
            gfnma_multiSelectSet('#VAT_NOT_DEDUCTION_TYPE', 'SUB_CODE', 'CODE_NAME', rowData.VAT_NOT_DEDUCTION_TYPE);
            gfnma_multiSelectSet('#REPORT_OMIT_YN', 'SUB_CODE', 'CODE_NAME', rowData.REPORT_OMIT_YN);
            gfnma_multiSelectSet('#DUP_ISSUE_BILL_TYPE', 'SUB_CODE', 'CODE_NAME', rowData.DUP_ISSUE_BILL_TYPE);
            gfnma_multiSelectSet('#VAT_ASSET_TYPE', 'SUB_CODE', 'CODE_NAME', rowData.VAT_ASSET_TYPE);
            gfnma_multiSelectSet('#AFTER_DUE_DATE_YN', 'SUB_CODE', 'CODE_NAME', rowData.AFTER_DUE_DATE_YN);
            gfnma_multiSelectSet('#ZERO_REPORT_YN', 'SUB_CODE', 'CODE_NAME', rowData.ZERO_REPORT_YN);
            gfnma_multiSelectSet('#EXCLUDE_REVENUE_AMT_YN', 'SUB_CODE', 'CODE_NAME', rowData.EXCLUDE_REVENUE_AMT_YN);
            gfnma_multiSelectSet('#ZERO_TYPE', 'SUB_CODE', 'CODE_NAME', rowData.ZERO_TYPE);

            SBUxMethod.set("STANDARD_DATE1", rowData.STANDARD_DATE);
            SBUxMethod.set("SUPPLY_AMT1", rowData.SUPPLY_AMT);
            SBUxMethod.set("EXPORT_LICENSE_NO", rowData.EXPORT_LICENSE_NO);
            SBUxMethod.set("EXPORT_AMT", rowData.EXPORT_AMT);
            SBUxMethod.set("CARD_NUM", rowData.CARD_NUM);
            SBUxMethod.set("SHIPPING_DATE", rowData.SHIPPING_DATE);
            SBUxMethod.set("EXPORT_AMT_KRW", rowData.EXPORT_AMT_KRW);
            SBUxMethod.set("DOCUMENT_NAME", rowData.DOCUMENT_NAME);
            SBUxMethod.set("FOREIGN_AMT", rowData.FOREIGN_AMT);
            SBUxMethod.set("VAT_EXPORT_AMT", rowData.VAT_EXPORT_AMT);
            SBUxMethod.set("ISSUE_NAME", rowData.ISSUE_NAME);
            SBUxMethod.set("WON_AMT", rowData.WON_AMT);
            SBUxMethod.set("VAT_EXPORT_AMT_KRW", rowData.VAT_EXPORT_AMT_KRW);
            SBUxMethod.set("DOCUMENT_ISSUE_DATE", rowData.DOCUMENT_ISSUE_DATE);
            SBUxMethod.set("DOCUMENT_NO", rowData.DOCUMENT_NO);
        } else if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("LINE_TYPE")) == "1") {
            SBUxMethod.disableTab('idxTab','tabPage2');
            SBUxMethod.setTab('idxTab','tabPage1');
            $("#btnDeleteRow").removeAttr('disabled');

            for(var i = 1; i <= 10; i++) {
                SBUxMethod.set("ACC_ITEM_VALUE"+i, rowData['ACC_ITEM_VALUE'+i]);
                SBUxMethod.set("ACC_VALUE_NAME"+i, rowData['ACC_VALUE_NAME'+i]);
            }
        } else {
            SBUxMethod.disableTab('idxTab','tabPage2');
            SBUxMethod.setTab('idxTab','tabPage1');

            for(var i = 1; i <= 10; i++) {
                SBUxMethod.set("ACC_ITEM_VALUE"+i, rowData['ACC_ITEM_VALUE'+i]);
                SBUxMethod.set("ACC_VALUE_NAME"+i, rowData['ACC_VALUE_NAME'+i]);
            }

            if (gfn_nvl(gfnma_multiSelectGet('#DOC_STATUS')) == "1")
                $("#btnDeleteRow").removeAttr('disabled');
        }
    }

    const fn_view = async function () {
        var nRow = gvwWFItem.getRow();
        if(nRow < 1) return;
        var nCol = gvwWFItem.getCol();

        fn_baseFocusedRowChanged(nRow, nCol);

        if (nCol == 5 || nCol == 6 || nCol == 7 || nCol == 8 || nCol == 15 || nCol == 16) {
            return;
        }

        //버튼 활성화 제어
        let strDoc_status = gfn_nvl(gfnma_multiSelectGet('#DOC_STATUS')); //전표 상태로 변경

        if (gfn_nvl(SBUxMethod.get('DOC_TYPE')) != "19" && gfn_nvl(SBUxMethod.get('DOC_TYPE')) != "39")
            $("#btnDocCopy").attr('disabled', 'true');

        if (gfn_nvl(SBUxMethod.get('DOC_BATCH_NO')) == "") {
            $("#main-btn-del").attr('disabled', 'true');
            $("#main-btn-appr").attr('disabled', 'true');
            $("#btnPrint").removeAttr('disabled');

            $("#btnAddRow").attr('disabled', 'true');
            $("#btnDeleteRow").attr('disabled', 'true');
            $("#btnCreateLine").attr('disabled', 'true');

            if (gfn_nvl(SBUxMethod.get('INSERT_USERID')) != p_userId) {
                $("#main-btn-appr").attr('disabled', 'true');

                $("#btnAddRow").attr('disabled', 'true');
                $("#btnDeleteRow").attr('disabled', 'true');
                $("#btnCreateLine").attr('disabled', 'true');
            }

            if (parseInt(gfn_nvl(SBUxMethod.get('APPR_ID')) == "" ? "0" : gfn_nvl(SBUxMethod.get('APPR_ID'))) != 0)
                // TODO : btnConfirmHist.Enabled = true;
                $("#main-btn-appr").removeAttr('disabled');
        } else {
            if (strDoc_status == "1") {
                //미승인
                $("#main-btn-del").removeAttr('disabled');
                $("#main-btn-appr").removeAttr('disabled');
                $("#btnPrint").attr('disabled', 'true');

                $("#btnAddRow").removeAttr('disabled');
                $("#btnDeleteRow").removeAttr('disabled');
                $("#btnCreateLine").removeAttr('disabled');

                $("#VAT_CODE").removeAttr('disabled');

                if (gfn_nvl(SBUxMethod.get('INSERT_USERID')) != p_userId) {
                    $("#main-btn-del").attr('disabled', 'true');
                    $("#main-btn-appr").attr('disabled', 'true');

                    $("#btnAddRow").attr('disabled', 'true');
                    $("#btnDeleteRow").attr('disabled', 'true');
                    $("#btnCreateLine").attr('disabled', 'true');
                }

                if (strFI_DELETE_USER == p_userId) {
                    $("#main-btn-del").removeAttr('disabled');
                }

            } else if (strDoc_status == "3") {
                //승인중
                $("#main-btn-appr").attr('disabled', 'true');
                $("#btnPrint").attr('disabled', 'true');

                $("#btnAddRow").attr('disabled', 'true');
                $("#btnDeleteRow").attr('disabled', 'true');
                $("#btnCreateLine").attr('disabled', 'true');

                $("#VAT_CODE").attr('disabled', 'true');

                if (gfn_nvl(SBUxMethod.get('CONFIRM_EMP_CODE')) == p_empCd || gfn_nvl(SBUxMethod.get('PROXY_EMP_CODE')) == p_empCd || gfn_nvl(SBUxMethod.get('BEFORE_APPR_EMP_CODE')) == p_empCd) {
                    $("#main-btn-appr").removeAttr('disabled');
                }

                if ((gfn_nvl(SBUxMethod.get('BEFORE_APPR_EMP_CODE')) == gfn_nvl(SBUxMethod.get('REQUEST_EMP_CODE'))) && (gfn_nvl(SBUxMethod.get('BEFORE_APPR_EMP_CODE')) == p_empCd)) {
                    $("#main-btn-del").removeAttr('disabled');
                } else {
                    $("#main-btn-del").attr('disabled', 'true');
                }

                if (strFI_DELETE_USER == p_userId) {
                    $("#main-btn-del").removeAttr('disabled');
                    $("#main-btn-appr").removeAttr('disabled');
                }

                if (gfn_nvl(SBUxMethod.get('APPR_ID')) != "")
                    // TODO : btnConfirmHist.Enabled = true;
                    $("#main-btn-appr").removeAttr('disabled');
            } else if (strDoc_status == "5") {
                //승인완료
                $("#main-btn-del").attr('disabled', 'true');
                $("#main-btn-appr").attr('disabled', 'true');
                $("#btnPrint").attr('disabled', 'true');

                $("#btnAddRow").attr('disabled', 'true');
                $("#btnDeleteRow").attr('disabled', 'true');
                $("#btnCreateLine").attr('disabled', 'true');

                $("#VAT_CODE").attr('disabled', 'true');

                if (strFI_DELETE_USER == p_userId) {
                    $("#main-btn-del").removeAttr('disabled');
                }

                //본인이 등록했고 본인만 결제권자 였으면 반려 가능
                if (gfn_nvl(SBUxMethod.get('INSERT_USERID')) == p_userId && parseInt(gfn_nvl(SBUxMethod.get('APPR_COUNT')) == "" ? "0" : gfn_nvl(SBUxMethod.get('APPR_COUNT'))) == 1) {
                    $("#main-btn-appr").removeAttr('disabled');
                    $("#main-btn-del").removeAttr('disabled');
                }

                if (parseInt(gfn_nvl(SBUxMethod.get('APPR_ID')) == "" ? "0" : gfn_nvl(SBUxMethod.get('APPR_ID'))) != 0)
                    // TODO : btnConfirmHist.Enabled = true;
                    $("#main-btn-appr").removeAttr('disabled');
            } else {
                //최종완료, 반려
                $("#main-btn-del").attr('disabled', 'true');
                $("#main-btn-appr").attr('disabled', 'true');
                $("#btnPrint").attr('disabled', 'true');

                $("#btnAddRow").attr('disabled', 'true');
                $("#btnDeleteRow").attr('disabled', 'true');
                $("#btnCreateLine").attr('disabled', 'true');

                $("#VAT_CODE").attr('disabled', 'true');

                if (parseInt(gfn_nvl(SBUxMethod.get('APPR_ID')) == "" ? "0" : gfn_nvl(SBUxMethod.get('APPR_ID'))) != 0)
                    // TODO : btnConfirmHist.Enabled = true;
                    $("#main-btn-appr").removeAttr('disabled');
            }
        }

        if (p_isAccountManager || (strDoc_status == "1" && gfn_nvl(SBUxMethod.get('INSERT_USERID')) == p_userId)) {
            // TODO : panWFTop.ActionMode = ActionMode.Save;
            // TODO : gvwWFItem.ActionMode = ActionMode.Save;
        } else {
            // TODO : panWFTop.ActionMode = ActionMode.View;
            // TODO : gvwWFItem.ActionMode = ActionMode.View;
        }

        if (nRow < 0)
            return;
    }

    const fn_getExchangeRate = async function (stryyyymmdd, strcurrency_code, strrate_type) {
        var paramObj = {
            V_P_DEBUG_MODE_YN: '',
            V_P_LANG_ID: '',
            V_P_COMP_CODE: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
            V_P_YYYYMMDD: stryyyymmdd,
            V_P_CURR_CODE: strcurrency_code,
            V_P_RATE_TYPE: strrate_type,
            V_P_FORM_ID: p_formId,
            V_P_MENU_ID: p_menuId,
            V_P_PROC_ID: '',
            V_P_USERID: '',
            V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/fi/far/rec/getExchangeRate.do", {
            getType: 'json',
            workType: 'Q2',
            cv_count: '1',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
                return {
                    RATE: data.cv_1[0]["RATE"],
                    BASE_SCALE: data.cv_1[0]["BASE_SCALE"]
                };
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

    const fn_getExchange = async function() {

        if (gfn_nvl(gfnma_multiSelectGet('#CURRENCY_CODE')) == "")
            return;

        let ht = fn_getExchangeRate(SBUxMethod.get("DOC_DATE"), gfn_nvl(gfnma_multiSelectGet('#CURRENCY_CODE')), null);

        SBUxMethod.set('exchange_rate', parseInt(ht["RATE"]));
        SBUxMethod.set('base_scale', parseInt(ht["BASE_SCALE"]));

        fn_exchageUpdate();
    }

    const fn_changeControlSettings = async function (dr) {
        if (dr == null)
            return;

        for (var i = 1; i <= 10; i++) {
            // 라벨명 설정
            $("#LBL_ACC_ITEM_VALUE" + i).text(dr["ACC_ITEM_NAME" + i])

            // 컨트롤 타입 설정
            switch (dr["DATA_TYPE" + i]) {
                case "TEXT":
                    SBUxMethod.attr('ACC_ITEM_VALUE' + i, 'readonly', 'false');
                    break;
                case "POPUP":
                    SBUxMethod.attr('ACC_ITEM_VALUE' + i, 'readonly', 'true');
                    break;
                case "NUM":
                    $('ACC_ITEM_VALUE' + i).prop("type", "number");
                    $('ACC_ITEM_VALUE' + i).attr("pattern", "\d{1,3}(,\d{3})*");
                    if (gfn_nvl(SBUxMethod.get('ACC_ITEM_VALUE' + i)) == "")
                        SBUxMethod.set('ACC_ITEM_VALUE' + i, 0);
                    SBUxMethod.attr('ACC_ITEM_VALUE' + i, 'readonly', 'false');
                    break;
                case "YYYY":
                    $('ACC_ITEM_VALUE' + i).attr("pattern", "^\d{4}$");
                    SBUxMethod.set('ACC_ITEM_VALUE' + i, null);
                    SBUxMethod.attr('ACC_ITEM_VALUE' + i, 'readonly', 'false');
                    break;
                case "YYYYMM":
                    $('ACC_ITEM_VALUE' + i).attr("pattern", "^\d{4}-(0[1-9]|1[0-2])$");
                    SBUxMethod.set('ACC_ITEM_VALUE' + i, null);
                    SBUxMethod.attr('ACC_ITEM_VALUE' + i, 'readonly', 'false');
                    break;
                case "YYYYMMDD":
                    $('ACC_ITEM_VALUE' + i).attr("pattern", "^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$");
                    SBUxMethod.set('ACC_ITEM_VALUE' + i, null);
                    SBUxMethod.attr('ACC_ITEM_VALUE' + i, 'readonly', 'false');
                    break;
                default:
                    SBUxMethod.attr('ACC_ITEM_VALUE' + i, 'readonly', 'true');
                    break;
            }

            // 팝업 설정
            if (dr["DATA_TYPE" + i] == "POPUP") {
                SBUxMethod.attr('ACC_VALUE_NAME' + i, 'readonly', 'false');
                $("#BTN_ACC_VALUE_NAME"+i).removeAttr('disabled');

                accPopupBizcompIdList["ACC_VALUE_NAME" + i] = dr["POPUP_ID" + i];

                accPopupWhereList["ACC_VALUE_NAME" + i] = "";
                accPopupWhereList["ACC_VALUE_NAME" + i] = " AND ACC_VALUE_NAME = '" + gfn_nvl(SBUxMethod.get("ACC_VALUE_NAME" + i)) + "'";

                //P_LOAN01   차입금
                //P_NOTE02   받을어음
                //P_NOTE03   지급어음
                //P_SAVE01   예적금
                if (dr["POPUP_ID" + i] == "P_LOAN01" ||
                    dr["POPUP_ID" + i] == "P_NOTE02" ||
                    dr["POPUP_ID" + i] == "P_NOTE03" ||
                    dr["POPUP_ID" + i] == "P_SAVE01") {
                    accPopupWhereList["ACC_VALUE_NAME" + i] += " AND FI_ORG_CODE = '" + p_fiOrgCode + "'";
                }
            } else {
                SBUxMethod.attr('ACC_VALUE_NAME' + i, 'readonly', 'true');
                SBUxMethod.attr('BTN_ACC_VALUE_NAME' + i, 'disabled', 'true');
            }

            // 필수입력 설정
            if (dr["ACC_ITEM_YN" + i] == "Y") {
                SBUxMethod.attr("ACC_ITEM_VALUE" + i, "required", "true");
                $("#ACC_ITEM_VALUE" + i).addClass("inpt_data_reqed");

                if (dr["DATA_TYPE" + i] == "POPUP") {
                    SBUxMethod.attr("ACC_VALUE_NAME" + i, "required", "true");
                    $("#ACC_VALUE_NAME" + i).addClass("inpt_data_reqed");
                } else {
                    SBUxMethod.attr("ACC_VALUE_NAME" + i, "required", "false");
                    $("#ACC_VALUE_NAME" + i).removeClass("inpt_data_reqed");
                }
            } else {
                SBUxMethod.attr("ACC_ITEM_VALUE" + i, "required", "false");
                SBUxMethod.attr("ACC_VALUE_NAME" + i, "required", "false");
                $("#ACC_ITEM_VALUE" + i).removeClass("inpt_data_reqed");
                $("#ACC_VALUE_NAME" + i).removeClass("inpt_data_reqed");
            }
        }
    }

    const fn_changeDocDate = async function (value) {
        if (!bnew || gfn_nvl(value) == "") {
            return;
        }

        SBUxMethod.set('VOUCHER_RECEIPT_DATE', value);
        SBUxMethod.set('STANDARD_DATE', value);

        fn_getExchange();

        await fn_getBankAccountSeq();

        if (gfn_nvl(SBUxMethod.get("PAY_TERM_CODE")) == "" || value == "")
            return;

        fn_setExpectedPayDateReadOnly();
    }

    const fn_changeDescription = async function (value) {
        if (!bnew)
            return;

        if (jsonAccountLineList.length != 0) {
            for (var i = 0; i < jsonAccountLineList.length; i++) {
                if (gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("DESCRIPTION")) == "") {
                    gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("DESCRIPTION", value), true, true);
                }
            }
        }
    }

    const fn_changeDocAmt = async function (value) {
        if (!bnew)
            return;

        if (gfn_nvl(value) == "" || gfn_nvl(SBUxMethod.get("VAT_AMOUNT")) == "")
            return;

        let DOC_AMT = Number(value.replace(/,/gi, ''));

        if(gfn_nvl(gfnma_multiSelectGet('#VAT_CODE')) != "") {
            let vatInfo = jsonVatCode.filter(data => data["VAT_CODE"] == gfn_nvl(gfnma_multiSelectGet('#VAT_CODE')))[0];
            let dcmvat_rate = Number(gfn_nvl(vatInfo.VAT_RATE) == "" ? "0" : gfn_nvl(vatInfo.VAT_RATE));

            let SUPPLY_AMT = DOC_AMT / (1+(dcmvat_rate/100));
            let VAT_AMOUNT = Number(DOC_AMT) - Number(SUPPLY_AMT);

            SBUxMethod.set("SUPPLY_AMT", SUPPLY_AMT);
            SBUxMethod.set("VAT_AMOUNT", VAT_AMOUNT);
        } else {
            SBUxMethod.set("SUPPLY_AMT", DOC_AMT);
            SBUxMethod.set("VAT_AMOUNT", 0);
        }
    }

    const fn_changeVatAmount = async function (value) {
        if (!bnew)
            return;

        if (gfn_nvl(SBUxMethod.get("DOC_AMT")) == "" || gfn_nvl(value) == "")
            return;

        SBUxMethod.set("SUPPLY_AMT", (Number(SBUxMethod.get("DOC_AMT").replace(/,/gi, '')) - Number(value.replace(/,/gi, ''))));

        if (jsonAccountLineList.length > 0) {
            for (var i = 0; i < jsonAccountLineList.length; i++) {
                if (gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("LINE_TYPE")) == "3") {
                    gvwWFItem.clickRow((i+1));
                    gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("VAT_AMT"), Number(value.replace(/,/gi, '')), true, true);
                }
            }
        }
    }

    const fn_changeSupplyAmt = async function (value) {
        if (!bnew)
            return;

        if (gfn_nvl(SBUxMethod.get("DOC_AMT")) == "" || gfn_nvl(value) == "")
            return;

        SBUxMethod.set("VAT_AMT", (Number(SBUxMethod.get("DOC_AMT").replace(/,/gi, '')) - Number(value)));
    }

    const fn_changeStandardDate = async function (value) {
        if (gfn_nvl(value) == "")
            return;

        if (jsonAccountLineList.length > 0) {
            for (var i = 0; i < jsonAccountLineList.length; i++) {
                if (gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("LINE_TYPE")) == "3") {
                    gvwWFItem.clickRow((i+1));
                    SBUxMethod.set("STANDARD_DATE1", value)
                    gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("STANDARD_DATE"), value, true, true);
                }
            }
        }
    }

    const fn_changeApprovalNo = async function (value) {
        if (gfn_nvl(value) != "") {
            SBUxMethod.set("VOUCHER_TYPE", "A")
            SBUxMethod.set("VOUCHER_NO", value);

            SBUxMethod.attr("CS_CODE", "readonly", "true");
            SBUxMethod.attr("CS_NAME", "readonly", "true");
            SBUxMethod.attr("BIZ_REGNO", "readonly", "true");
            SBUxMethod.attr("VOUCHER_RECEIPT_DATE", "readonly", "true");
        } else {
            SBUxMethod.attr("CS_CODE", "readonly", "false");
            SBUxMethod.attr("CS_NAME", "readonly", "false");
            SBUxMethod.attr("BIZ_REGNO", "readonly", "false");
            SBUxMethod.attr("VOUCHER_RECEIPT_DATE", "readonly", "false");
        }
    }

    const fn_changeWriteDate = async function (value) {
        SBUxMethod.set("VOUCHER_RECEIPT_DATE", value);
        SBUxMethod.set("DOC_DATE", value);
        SBUxMethod.set("STANDARD_DATE", value);
    }

    const fn_changeBasisType = async function (value) {
        fn_setExpectedPayDateReadOnly();
    }


    // 행추가
    const fn_addRow = async function () {
        if (!SBUxMethod.validateRequired( {group_id: 'panWFTop'} ) || !validateRequired("panWFTop"))
            return;

        let rowVal = gvwWFItem.getRow();

        if (rowVal == -1) { //데이터가 없고 행선택이 없을경우.
            gvwWFItem.addRow(true, {
                KEY_ID: gfn_nvl(SBUxMethod.get("KEY_ID")),
                ITEM_SEQ: jsonAccountLineList.length,
                LINE_TYPE: "2",
                SITE_CODE: gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE")),
                DEPT_CODE: gfn_nvl(SBUxMethod.get("DEPT_CODE")),
                DEBIT_CREDIT: gfn_nvl(SBUxMethod.get("REVERSE_YN")) == "Y" ? "C" : "D",
                ORIGINAL_AMT: 0,
                VAT_AMT: 0,
                SUPPLY_AMT: 0,
                CURRENCY_CODE: gfn_nvl(gfnma_multiSelectGet('#CURRENCY_CODE')),
                EXCHANGE_RATE: gfn_nvl(SBUxMethod.get("EXCHANGE_RATE")),
                CS_CODE: gfn_nvl(SBUxMethod.get("CS_CODE")),
                VAT_TYPE: gfn_nvl(gfnma_multiSelectGet('#VAT_CODE','object')['value']),
                VAT_NAME: gfn_nvl(gfnma_multiSelectGet('#VAT_CODE', 'object')['label']),
                DESCRIPTION: gfn_nvl(SBUxMethod.get("DESCRIPTION")),
            });
        } else {
            gvwWFItem.insertRow(rowVal, {
                KEY_ID: gfn_nvl(SBUxMethod.get("KEY_ID")),
                ITEM_SEQ: jsonAccountLineList.length,
                LINE_TYPE: "2",
                SITE_CODE: gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE")),
                DEPT_CODE: gfn_nvl(SBUxMethod.get("DEPT_CODE")),
                DEBIT_CREDIT: gfn_nvl(SBUxMethod.get("REVERSE_YN")) == "Y" ? "C" : "D",
                ORIGINAL_AMT: 0,
                VAT_AMT: 0,
                SUPPLY_AMT: 0,
                CURRENCY_CODE: gfn_nvl(gfnma_multiSelectGet('#CURRENCY_CODE')),
                EXCHANGE_RATE: gfn_nvl(SBUxMethod.get("EXCHANGE_RATE")),
                CS_CODE: gfn_nvl(SBUxMethod.get("CS_CODE")),
                VAT_TYPE: gfn_nvl(gfnma_multiSelectGet('#VAT_CODE', 'object').value),
                VAT_NAME: gfn_nvl(gfnma_multiSelectGet('#VAT_CODE', 'object').label),
                DESCRIPTION: gfn_nvl(SBUxMethod.get("DESCRIPTION")),
            });
        }
    }

    // 행삭제
    const fn_deleteRow = async function () {
        let rowVal = gvwWFItem.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwWFItem.deleteRow(rowVal);
            fn_summary();
        }
    }

    window.addEventListener('DOMContentLoaded', async function (e) {
        let initObject = localStorage.getItem("callMain");
        await fn_initSBSelect();
        await fn_createGvwWFItemGrid();

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

    // 파일첨부
    function cfn_attach() {
        fn_attach();
    }

    const fn_onload = async function (parentParameter) {
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();
        $("#apcSelectMa").hide();
        SBUxMethod.set("SRCH_DOC_H_FI_ORG_CODE", p_fiOrgCode);

        strCurrntDate = gfn_dateToYmd(new Date());

        if (strsourceType == null) {
            strsourceType = "AP";
        }
        SBUxMethod.set("REVERSE_YN", 'N');
        //회계 삭제 권한
        if (p_fiDeleteUser != null)
            strFI_DELETE_USER = p_fiDeleteUser;

        if (parentParameter) {
            if (parentParameter.hasOwnProperty("DOC_BATCH_NO")) {
                SBUxMethod.set("DOC_BATCH_NO", parentParameter["DOC_BATCH_NO"]);
            }

            if (parentParameter.hasOwnProperty("SOURCE_TYPE")) {
                strsourceType = parentParameter["SOURCE_TYPE"];
            }

            SBUxMethod.set("SRCH_INVOCE_BATCH_NO", strsourceType);

            if (parentParameter.hasOwnProperty("DOC_NUM")) {
                SBUxMethod.set("DOC_NUM", parentParameter["DOC_NUM"]);
            }

            if (parentParameter.hasOwnProperty("TXN_FROM_DATE")) {
                SBUxMethod.set("SRCH_FROM_DATE", parentParameter["TXN_FROM_DATE"]);
            }
            if (parentParameter.hasOwnProperty("TXN_TO_DATE")) {
                SBUxMethod.set("SRCH_TO_DATE", parentParameter["TXN_TO_DATE"]);
            }

            if (parentParameter.hasOwnProperty("FI_ORG_CODE")) {
                SBUxMethod.set("SRCH_DOC_H_FI_ORG_CODE", parentParameter["FI_ORG_CODE"]);
            }

            if (parentParameter.hasOwnProperty("VOUCHER_TYPE")) {
                SBUxMethod.set("VOUCHER_TYPE", parentParameter["VOUCHER_TYPE"]);
            }

            SBUxMethod.set("SRCH_SITE_CODE", p_siteCode);

            if (parentParameter.hasOwnProperty("VOUCHER_NO")) {
                SBUxMethod.set("VOUCHER_NO", parentParameter["VOUCHER_NO"]);
            }

            if (parentParameter.hasOwnProperty("APRINT")) {
                if (gfn_nvl(parentParameter["APRINT"]) != "Y") {
                    bAllowPrint = false;
                } else {
                    bAllowPrint = true;
                }
            }

            if (gfn_nvl(SBUxMethod.get("DOC_BATCH_NO")) != "") {
                bnew = false;
                fn_search();
            }

            if (strsourceType == "AR") {
                strFileSourceType = "FIGDOCHEADER";
                $("#CARD_USE_TYPE").attr('disabled', 'true');
                SBUxMethod.attr('CARD_NUM', 'readonly', 'true');
                $("#VAT_ASSET_TYPE").attr('disabled', 'true');
                $("#VAT_NOT_DEDUCTION_TYPE").attr('disabled', 'true');
                $("#REPORT_OMIT_YN").attr('disabled', 'true');

                $("#LBL_PAY_TERM_CODE").text("수금기준");
                $("#LBL_PAY_METHOD").text("수금방법");
                $("#LBL_PAY_BASE_DATE").text("수금기산일자");
                $("#LBL_EXPECTED_PAY_DATE").text("수금만기일자");

                $("#SUB_TAX_SITE_CODE").attr("required", "true");
                $("#SUB_TAX_SITE_CODE").addClass("inpt_data_reqed");
                gfnma_multiSelectSet('#SUB_TAX_SITE_CODE', 'TAX_SITE_CODE', 'TAX_SITE_NAME', "T02");

                $("#btnScmInfo").removeAttr('disabled');

                SBUxMethod.attr('DOC_TYPE', 'readonly', 'true');

            } else if (strsourceType == "AP") {
                strFileSourceType = "FIGDOCHEADER";

                $("#DUP_ISSUE_BILL_TYPE").attr('disabled', 'true');
                $("#EXCLUDE_REVENUE_AMT_YN").attr('disabled', 'true');

                $("#btnScmInfo").removeAttr('disabled');

                $("#btnCreateInvoice").hide();
                $("#btnCancelInvoice").hide();

                if (!p_isAccountManager) {
                    $("#AFTER_DUE_DATE_YN").attr('disabled', 'true');
                    $("#REPORT_OMIT_YN").attr('disabled', 'true');
                }

                $("#LBL_PAY_TERM_CODE").text("지급기준");
                $("#LBL_PAY_METHOD").text("지급방법");
                $("#LBL_PAY_BASE_DATE").text("지급기산일자");
                $("#LBL_EXPECTED_PAY_DATE").text("지급만기일자");

                SBUxMethod.attr('DOC_TYPE', 'readonly', 'true');

                $("#SUB_TAX_SITE_CODE").attr("required", "false");
                $("#SUB_TAX_SITE_CODE").removeClass("inpt_data_reqed");
                gfnma_multiSelectSet('#SUB_TAX_SITE_CODE', 'TAX_SITE_CODE', 'TAX_SITE_NAME', "T02");
            } else if (strsourceType == "BAD") {
                strFileSourceType = "BADSALESDOC";
                $("#DUP_ISSUE_BILL_TYPE").attr('disabled', 'true');
                $("#EXCLUDE_REVENUE_AMT_YN").attr('disabled', 'true');

                $("#LBL_INVOICE").hide();
                $("#APPROVAL_NO").hide();

                $("#btnCreateInvoice").hide();

                if (!p_isAccountManager) {
                    $("#AFTER_DUE_DATE_YN").attr('disabled', 'true');
                    $("#REPORT_OMIT_YN").attr('disabled', 'true');
                }

                SBUxMethod.set("DOC_TYPE", "91");

                SBUxMethod.attr('DOC_TYPE', 'readonly', 'true');

                $("#SUB_TAX_SITE_CODE").attr("required", "true");
                $("#SUB_TAX_SITE_CODE").addClass("inpt_data_reqed");
                gfnma_multiSelectSet('#SUB_TAX_SITE_CODE', 'TAX_SITE_CODE', 'TAX_SITE_NAME', "T02");
            }
        } else {
            SBUxMethod.set("SRCH_DOC_H_FI_ORG_CODE", p_fiOrgCode);
            SBUxMethod.set("SRCH_SITE_CODE", p_siteCode);
            SBUxMethod.set("SRCH_INVOCE_BATCH_NO", strsourceType);
            if (strsourceType == "AP") {
                $("#btnCreateInvoice").hide();
                $("#btnCancelInvoice").hide();
            }
            bnew = true;
        }
        if (gfn_nvl(SBUxMethod.get("DOC_BATCH_NO")) == "") {
            fn_create();

            $("#btnAddRow").attr("disabled", "true");
            $("#btnDeleteRow").attr("disabled", "true");
        }

        //사용자
        SBUxMethod.set("EMP_CODE", gfn_nvl(gfnma_multiSelectGet('#PAYEE_CODE')));

        if (p_isAccountManager || p_isAccountChief) {
            SBUxMethod.set("OPEN_TO_ALL_YN", "N");
            SBUxMethod.set("OPEN_TO_FCM_YN", "N");
            $("#btnDocCopy").show();
        } else {
            SBUxMethod.set("OPEN_TO_ALL_YN", "Y");
            SBUxMethod.set("OPEN_TO_FCM_YN", "Y");
            $("#btnDocCopy").hide();
        }
    }

    const fn_summary = async function () {
        let dorigin_dr_amt = 0;
        let dorigin_cr_amt = 0;
        let dfunctional_dr_amt = 0;
        let dfunctional_cr_amt = 0;

        let exp_amt = 0;
        let exp_amt_krw = 0;

        let vat_amt = 0;
        let vat_amt_krw = 0;

        let x = -1;

        for (var i = 0; i < jsonAccountLineList.length; i++) {
            dorigin_dr_amt += gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("DEBIT_CREDIT")) == "D" ? parseInt(gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("ORIGINAL_AMT"))) : 0;
            dorigin_cr_amt += gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("DEBIT_CREDIT")) == "C" ? parseInt(gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("ORIGINAL_AMT"))) : 0;
            dfunctional_dr_amt += gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("DEBIT_CREDIT")) == "D" ? parseInt(gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("FUNCTIONAL_AMT"))) : 0;
            dfunctional_cr_amt += gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("DEBIT_CREDIT")) == "C" ? parseInt(gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("FUNCTIONAL_AMT"))) : 0;

            if (gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("LINE_TYPE")) == "2") {
                exp_amt += parseInt(gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("ORIGINAL_AMT")));
                exp_amt_krw += parseInt(gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("FUNCTIONAL_AMT")));
            }

            if (gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("LINE_TYPE")) == "3") {
                vat_amt += parseInt(gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("ORIGINAL_AMT")));
                vat_amt_krw += parseInt(gvwWFItem.getCellData((i + 1), gvwWFItem.getColRef("FUNCTIONAL_AMT")));

                x = (i + 1);
            }
        }

        SBUxMethod.set("DR_SUM", dorigin_dr_amt);
        SBUxMethod.set("CR_SUM", dorigin_cr_amt);
        SBUxMethod.set("DIFF_ORIGIN", dorigin_dr_amt - dorigin_cr_amt);
        SBUxMethod.set("DIFF_FUNTION", dfunctional_dr_amt - dfunctional_cr_amt);

        if (!bnew)
            return;

        if (x > 0) {
            let VAT_TYPE = gfn_nvl(gfnma_multiSelectGet('#VAT_CODE'));
            if (VAT_TYPE == "A0" || VAT_TYPE == "A1" || VAT_TYPE == "A2" || VAT_TYPE == "A3") {
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("EXPORT_AMT"), exp_amt, true, true)
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("EXPORT_AMT_KRW"), exp_amt_krw, true, true)
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("VAT_EXPORT_AMT"), exp_amt, true, true)
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("VAT_EXPORT_AMT_KRW"), exp_amt_krw, true, true)
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("FOREIGN_AMT"), exp_amt, true, true)
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("WON_AMT"), exp_amt_krw, true, true)
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("SHIPPING_DATE"), SBUxMethod.get("DOC_DATE"), true, true)
            }
        }

    }

    const fn_create = async function () {
        if (editType != "Q" && gfn_nvl(SBUxMethod.get("DOC_NAME")) != "") {
            if (gfn_comConfirm("Q0000", "저장하지 않은 데이터가 있습니다. 계속 진행 하시겠습니까?")) {
                return;
            }
        }

        var strcurrent_date = gfn_dateToYmd(new Date());

        bnew = false;

        SBUxMethod.set("DOC_BATCH_NO", '');

        gfnma_uxDataClear('#panWFTop');
        jsonAccountLineList.length = 0;
        gvwWFItem.rebuild();
        gfnma_uxDataClear('#panWFMiddleBottom');
        gfnma_uxDataClear('#panWFBottom');

        SBUxMethod.set("SRCH_SITE_CODE", p_siteCode);
        gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', p_currCode);
        SBUxMethod.set("BASE_SCALE", parseInt(jsonCurrencyCode.filter(data => data["CURRENCY_CODE"] == p_currCode)[0]["BASE_SCALE"]));

        // TODO: btnAttach.Enabled = false;
        SBUxMethod.attr('VAT_TYPE', 'readonly', 'false');

        SBUxMethod.set("APPROVAL_NO", '');
        SBUxMethod.set("VOUCHER_TYPE", '');
        SBUxMethod.set("VOUCHER_NO", '');

        if (strsourceType == "AR") {
            $("#CARD_USE_TYPE").attr('disabled', 'true');
            SBUxMethod.attr('CARD_NUM', 'readonly', 'true');
            $("#VAT_ASSET_TYPE").attr('disabled', 'true');
            $("#VAT_NOT_DEDUCTION_TYPE").attr('disabled', 'true');
            $("#REPORT_OMIT_YN").attr('disabled', 'true');

            $("#LBL_PAY_TERM_CODE").text("수금기준");
            $("#LBL_PAY_METHOD").text("수금방법");
            $("#LBL_PAY_BASE_DATE").text("수금기산일자");
            $("#LBL_EXPECTED_PAY_DATE").text("수금만기일자");

            $("#SUB_TAX_SITE_CODE").attr("required", "true");
            $("#SUB_TAX_SITE_CODE").addClass("inpt_data_reqed");
            gfnma_multiSelectSet('#SUB_TAX_SITE_CODE', 'TAX_SITE_CODE', 'TAX_SITE_NAME', "T02");

        } else if (strsourceType == "AP") {
            $("#DUP_ISSUE_BILL_TYPE").attr('disabled', 'true');
            $("#EXCLUDE_REVENUE_AMT_YN").attr('disabled', 'true');

            if (!p_isAccountManager) {
                $("#AFTER_DUE_DATE_YN").attr('disabled', 'true');
                $("#REPORT_OMIT_YN").attr('disabled', 'true');
            }

            $("#LBL_PAY_TERM_CODE").text("지급기준");
            $("#LBL_PAY_METHOD").text("지급방법");
            $("#LBL_PAY_BASE_DATE").text("지급기산일자");
            $("#LBL_EXPECTED_PAY_DATE").text("지급만기일자");

            $("#SUB_TAX_SITE_CODE").attr("required", "false");
            $("#SUB_TAX_SITE_CODE").removeClass("inpt_data_reqed");
            gfnma_multiSelectSet('#SUB_TAX_SITE_CODE', 'TAX_SITE_CODE', 'TAX_SITE_NAME', "T02");
        } else if (strsourceType == "BAD") {
            $("#DUP_ISSUE_BILL_TYPE").attr('disabled', 'true');
            $("#EXCLUDE_REVENUE_AMT_YN").attr('disabled', 'true');

            if (!p_isAccountManager) {
                $("#AFTER_DUE_DATE_YN").attr('disabled', 'true');
                $("#REPORT_OMIT_YN").attr('disabled', 'true');
            }

            SBUxMethod.set("DOC_TYPE", "91");

            $("#SUB_TAX_SITE_CODE").attr("required", "true");
            $("#SUB_TAX_SITE_CODE").addClass("inpt_data_reqed");
            gfnma_multiSelectSet('#SUB_TAX_SITE_CODE', 'TAX_SITE_CODE', 'TAX_SITE_NAME', "T02");
        }

        $("#main-btn-save").removeAttr("disabled");
        $("#main-btn-save").attr("disabled", "true");
        $("#main-btn-appr").attr("disabled", "true");

        // TODO: PreviewButton = false;
        // TODO: PrintButton = false;

        $("#btnAddRow").attr("disabled", "true");
        $("#btnDeleteRow").attr("disabled", "true");
        $("#btnCreateLine").attr("disabled", "true");

        SBUxMethod.set("KEY_ID", "1");

        $("#RULE_CODE").removeAttr('disabled');
        gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', p_currCode);
        SBUxMethod.set("EXCHANGE_RATE", 1);

        SBUxMethod.set("SRCH_DOC_H_FI_ORG_CODE", p_fiOrgCode);
        SBUxMethod.set("ACCT_RULE_CODE", p_defaultAcctRule);

        gfnma_multiSelectSet('#DOC_STATUS', 'SUB_CODE', 'CODE_NAME', "1");

        SBUxMethod.set("DOC_DATE", strcurrent_date);
        SBUxMethod.set("STANDARD_DATE", strcurrent_date);

        SBUxMethod.set("VOUCHER_RECEIPT_DATE", strcurrent_date);
        SBUxMethod.set("EXPECTED_PAY_DATE", strcurrent_date);

        gfnma_multiSelectSet('#PAYEE_CODE', 'USER_ID', 'USER_NAME', p_userId);
        SBUxMethod.set("INSERT_USERID", p_userId);

        SBUxMethod.set("DOC_NUM", "1");

        SBUxMethod.set("DEPT_CODE", p_deptCode);
        SBUxMethod.set("DEPT_NAME", p_deptName);

        SBUxMethod.set("SOURCE_DOC", "MANUAL");
        gfnma_multiSelectSet('#TAX_SITE_CODE', 'TAX_SITE_CODE', 'TAX_SITE_NAME', "T02");

        if (strsourceType == "AP") {
            SBUxMethod.set("DOC_TYPE", "19"); //미지급
        } else if (strsourceType == "AR") {
            SBUxMethod.set("DOC_TYPE", "39"); //채권
        }
        SBUxMethod.attr("DOC_TYPE", "readonly", false);

        if (p_isAccountManager || p_isAccountChief) {
            SBUxMethod.set("OPEN_TO_ALL_YN", "N");
            SBUxMethod.set("OPEN_TO_FCM_YN", "N");
        } else {
            SBUxMethod.set("OPEN_TO_ALL_YN", "Y");
            SBUxMethod.set("OPEN_TO_FCM_YN", "Y");
        }

        // TODO: panWFTop.ActionMode = ActionMode.Save;
        // TODO: gvwWFItem.ActionMode = ActionMode.Save;

        bnew = true;
    }

    const StringToRemoveMask = async function(dr) {
        var removeMask =
        [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
        ];

        for (var index = 1; index <= 10; ++index) {
            if (gfn_nvl(dr["DATA_TYPE" + index]) != "" && gfn_nvl(dr["ACC_ITEM_VALUE" + index]) != "") {
                switch (dr["DATA_TYPE" + index]) {
                    case "TEXT":
                    case "POPUP":
                        removeMask[index - 1] = gfn_nvl(dr["ACC_ITEM_VALUE" + index] )+ "|";
                        continue;
                    case "NUM":
                        removeMask[index - 1] = gfn_nvl(dr["ACC_ITEM_VALUE" + index].replaceAll(",", "")) + "|";
                        continue;
                    case "YYYY":
                    case "YYYYMM":
                    case "YYYYMMDD":
                        removeMask[index - 1] = gfn_nvl(dr["ACC_ITEM_VALUE" + index].replaceAll("-", "")) + "|";
                        continue;
                    default:
                        removeMask[index - 1] = "|";
                        continue;
                }
            }
            else
                removeMask[index - 1] = "|";
        }
        return removeMask;
    }

    const fnSET_P_FIG3510_S = async function(strWorkType) {
        try {

            let bResult = false;

            // 관리항목 필수 체크
            for (var i = 0; i < jsonAccountLineList.length; i++) {
                if (gfn_nvl(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("LINE_TYPE"))) == "") {
                    gfn_comAlert("E0000", "유형은 필수 입력입니다.");
                    gvwWFItem.clickRow((i+1));
                    return false;
                }

                if (gfn_nvl(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("DEBIT_CREDIT"))) == "") {
                    gfn_comAlert("E0000", "차변/대변 구분은 필수 입력입니다.");
                    gvwWFItem.clickRow((i+1));
                    return false;
                }

                if (gfn_nvl(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ACCOUNT_CODE"))) == "" || gfn_nvl(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ACCOUNT_NAME"))) == "") {
                    gfn_comAlert("E0000", "계정코드, 계정과목은 필수 입력입니다.");
                    gvwWFItem.clickRow((i+1));
                    return false;
                }

                if (gfn_nvl(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("SITE_CODE"))) == "") {
                    gfn_comAlert("E0000", "사업장은 필수 입력입니다.");
                    gvwWFItem.clickRow((i+1));
                    return false;
                }

                if (gfn_nvl(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("DESCRIPTION"))) == "") {
                    gfn_comAlert("E0000", "적요는 필수 입력입니다.");
                    gvwWFItem.clickRow((i+1));
                    return false;
                }
            }

            if (jsonAccountLineList.length == 0)
                return false;

            if (gfn_nvl(SBUxMethod.get("PAY_TERM_CODE")) == "" || gfn_nvl(SBUxMethod.get("EXPECTED_PAY_DATE")) == "") {
                gfn_comAlert("E0000", "지급기일코드 나 지급요청일자를 입력해주십시오.");
                return false;
            }

            let strRowStatus = "";

            if (gfn_nvl(strWorkType) == "") {
                if (parseInt(gfn_nvl(SBUxMethod.get("DOC_ID")) == "" ? "0" : gfn_nvl(SBUxMethod.get("DOC_ID"))) == 0)
                    strRowStatus = "N";
                else
                    strRowStatus = "U";
            } else {
                strRowStatus = strWorkType;
            }

            let stritem_id = "";
            let stritem_seq = "";
            let strfi_org_code = "";
            let strline_type = "";
            let straccount_code = "";
            let strdebit_credit = "";
            let strorigin_dr_amt = "";
            let strorigin_cr_amt = "";
            let strfunctional_dr_amt = "";
            let strfunctional_cr_amt = "";
            let strvat_type = "";
            let stritem_code = "";
            let struom = "";
            let strtxn_qty = "";
            let strdept_code = "";
            let strcost_center_code = "";
            let strproject_code = "";
            let strdescription = "";
            let stracc_item_code1 = "";
            let stracc_item_value1 = "";
            let stracc_item_code2 = "";
            let stracc_item_value2 = "";
            let stracc_item_code3 = "";
            let stracc_item_value3 = "";
            let stracc_item_code4 = "";
            let stracc_item_value4 = "";
            let stracc_item_code5 = "";
            let stracc_item_value5 = "";
            let stracc_item_code6 = "";
            let stracc_item_value6 = "";
            let stracc_item_code7 = "";
            let stracc_item_value7 = "";
            let stracc_item_code8 = "";
            let stracc_item_value8 = "";
            let stracc_item_code9 = "";
            let stracc_item_value9 = "";
            let stracc_item_code10 = "";
            let stracc_item_value10 = "";
            let stracc_value_name1 = "";
            let stracc_value_name2 = "";
            let stracc_value_name3 = "";
            let stracc_value_name4 = "";
            let stracc_value_name5 = "";
            let stracc_value_name6 = "";
            let stracc_value_name7 = "";
            let stracc_value_name8 = "";
            let stracc_value_name9 = "";
            let stracc_value_name10 = "";
            let stritem_source_type_d = "";
            let stritem_source_id_d = "";
            let strsource_record_count_d = "";
            let strsum_acc_item1 = "";
            let strsum_acc_value1 = "";
            let strsum_acc_item2 = "";
            let strsum_acc_value2 = "";
            let strcs_code = "";
            let strfce_gb = "";
            let strcurrency_code = "";
            let strexchange_type = "";
            let strexchange_rate = "";
            let strpay_method = "";
            let strexpected_pay_date = "";
            let strvoucher_type = "";
            let strvoucher_no = "";
            let strpayee_code = "";
            let strcard_no = "";
            let strvoucher_receipt_date = "";
            let strpay_term_code = "";
            let strwithhold_flag = "";
            let strwithhold_tax_type = "";
            let strwithhold_cs_code = "";
            let strwithhold_tax_type2 = "";
            let strwithhold_cs_code2 = "";
            let strsite_code = "";
            let strcredit_area = "";
            let strsales_person = "";
            let strpo_line_no = "";
            let strsales_cs_code = "";
            let strapply_complete_flag = "";
            let strapply_complete_date = "";
            let strhold_flag = "";
            let strrelease_date = "";
            let strrelease_user = "";
            let strhold_date = "";
            let strhold_user = "";
            let strhold_reason = "";
            let strpay_base_date = "";
            let strbill_due_date = "";
            let strbill_due_day = "";
            let strbill_due_pay_date = "";
            let strpay_term_orig = "";
            let strprod_group = "";
            let strbank_account_seq = "";
            let stretax_type = "";
            let strafter_due_date_yn = "";
            let strdup_issue_bill_type = "";
            let strexclude_revenue_amt_yn = "";
            let strcard_use_type = "";
            let strcard_num = "";
            let strvat_not_deduction_type = "";
            let strreport_omit_yn = "";
            let strstandard_date = "";
            let strvat_asset_type = "";
            let strsupply_amt = "";
            let strzero_report_yn = "";
            let strlocal_credit_type = "";
            let strdocument_name = "";
            let strissue_name = "";
            let strdocument_issue_date = "";
            let strexport_license_no = "";
            let strshipping_date = "";
            let strexport_amt = "";
            let strexport_amt_krw = "";
            let strvat_export_amt = "";
            let strvat_export_amt_krw = "";
            let strforeign_amt = "";
            let strwon_amt = "";
            let strdocument_no = "";
            let strzero_type = "";
            let strvat_amt = "";

            // 관리항목 필수 체크
            let dSumdr_amt = 0;
            let dSumCr_amt = 0;
            let updatedData = gvwWFItem.getUpdateData(true, 'all');

            for(var i = 0; i < updatedData.length; i++) {
                let thisdr = updatedData[i].data;

                if (strRowStatus == "D" || updatedData[i].status == 'd')
                    continue;

                if (gfn_nvl(SBUxMethod.get("KEY_ID")) == gfn_nvl(thisdr["KEY_ID"])) {
                    if (gfn_nvl(thisdr["LINE_TYPE"]) == "3") {
                        //세금일경우
                        if (gfn_nvl(thisdr["VAT_TYPE"]) == "") {
                            gfn_comAlert("E0000", "세금 TYPE일 경우 부가세 유형은 필수 입력 항목입니다.");
                            return false;
                        }

                        let supply_amt1 = gfn_nvl(thisdr["SUPPLY_AMT"]) == "" ? 0 : Number(gfn_nvl(thisdr["SUPPLY_AMT"]));

                        if ((gfn_nvl(thisdr["VAT_TYPE"]) != "VZ" || gfn_nvl(thisdr["VAT_TYPE"]) != "AZ") && supply_amt1 == 0) {
                            gfn_comAlert("E0000", "기타매입(부가세 무관)이 아닐 경우 부가세 공급가액은 0 일 수 없습니다.");
                            return false;
                        }

                        if (gfn_nvl(thisdr["ETAX_TYPE"]) != "" || gfn_nvl(thisdr["AFTER_DUE_DATE_YN"]) != "") {
                            if (gfn_nvl(thisdr["CARD_USE_TYPE"]) != "" || gfn_nvl(thisdr["CARD_NUM"]) != "") {
                                gfn_comAlert("E0000", "전자 발행일 경우 카드 용도를 입력하면 안됩니다.");
                                return false;
                            }
                        }

                        if (gfn_nvl(thisdr["CARD_NUM"]) != "" || gfn_nvl(thisdr["CARD_NUM"]) != "") {
                            if (gfn_nvl(thisdr["ETAX_TYPE"]) != "" || gfn_nvl(thisdr["AFTER_DUE_DATE_YN"]) != "") {
                                gfn_comAlert("E0000", "카드 용도일 경우 전자 발행 정보를 입력하면 안됩니다.");
                                return false;
                            }
                        }

                        if (gfn_nvl(thisdr["NONDED_YN"]) == "Y" && gfn_nvl(thisdr["VAT_NOT_DEDUCTION_TYPE"]) == "") {
                            gfn_comAlert("E0000", "불공제부가세는 불공제유형이 필수 입력입니다.");
                            return false;
                        }

                        let Dsupply_amt = 0;
                        let Dsupply_amt_orig = 0;
                        Dsupply_amt_orig = Number(gfn_nvl(thisdr["SUPPLY_AMT"]) == "" ? "0" : gfn_nvl(thisdr["SUPPLY_AMT"]));

                        if (Dsupply_amt_orig < 0) {
                            Dsupply_amt = Dsupply_amt_orig * -1;
                        } else {
                            Dsupply_amt = Dsupply_amt_orig;
                        }

                        if (Dsupply_amt != Math.round(Number(gfn_nvl(SBUxMethod.get("SUPPLY_AMT")).replace(/,/g, '')) * Number(gfn_nvl(SBUxMethod.get("EXCHANGE_RATE")).replace(/,/g, '')))) {
                            gfn_comAlert("E0000", "전표헤더의 공급가액과 부가세탭의 공급가액이 다릅니다.");
                            return false;
                        }

                        if (gfn_nvl(thisdr["VAT_TYPE_CODE"]) == "PB01" || gfn_nvl(thisdr["VAT_TYPE_CODE"]) == "PB02" || gfn_nvl(thisdr["VAT_TYPE_CODE"]) == "PB06") {
                            if (gfn_nvl(thisdr["CARD_USE_TYPE"]) == "") {
                                gfn_comAlert("E0000", "카드 용도는 필수 입력 항목입니다.");
                                return false;
                            }

                            if (gfn_nvl(thisdr["CARD_NUM"]) == "") {
                                gfn_comAlert("E0000", "카드 번호는 필수 입력 항목입니다.");
                                return false;
                            }

                        }
                    }

                    if (gfn_nvl(thisdr["LINE_TYPE"]) != "3") { //세금 아닌 경우만 체크{
                        if (Number(gfn_nvl(thisdr["ORIGINAL_AMT"])) == 0) {
                            gfn_comAlert("E0000", "차대금액이 잘못 입력되었습니다. 금액을 확인해 주십시오");
                            return false;
                        }
                    }

                    if (gfn_nvl(thisdr["ACC_CATEGORY"]) == "D" || gfn_nvl(thisdr["ACC_CATEGORY"]) == "E") {
                        if (gfn_nvl(thisdr["COST_CENTER_CODE"]) == "") {
                            gfn_comAlert("E0000", "수익,비용인 경우 원가중심점이 필수 입니다.");
                            return false;
                        }

                        if (gfn_nvl(thisdr["DEPT_CODE"]) == "") {
                            gfn_comAlert("E0000", "수익,비용인 경우 부서코드는 필수입력사항입니다.");
                            return false;
                        }
                    }

                    if (gfn_nvl(thisdr["PROJECT_YN"]) == "Y") {
                        if (gfn_nvl(thisdr["PROJECT_CODE"]) == "") {
                            gfn_comAlert("E0000", "프로젝트 코드는 필수 입력 항목입니다.");
                            return false;
                        }

                    }

                    if (gfn_nvl(thisdr["COST_CLASS"]) == "1" || gfn_nvl(thisdr["COST_CLASS"]) == "2" || gfn_nvl(thisdr["COST_CLASS"]) == "8" || gfn_nvl(thisdr["PROJECT_YN"]) == "Y") {
                        if (gfn_nvl(thisdr["COST_CENTER_CODE"]) == "") {
                            gfn_comAlert("E0000", "원가중심점은 필수 입력입니다.");
                            return false;
                        }
                    }

                    dSumdr_amt += gfn_nvl(thisdr["DEBIT_CREDIT"]) == "D" ? Number(gfn_nvl(thisdr["ORIGINAL_AMT"])) : 0;
                    dSumCr_amt += gfn_nvl(thisdr["DEBIT_CREDIT"]) == "C" ? Number(gfn_nvl(thisdr["ORIGINAL_AMT"])) : 0;

                    for (var j = 1; j <= 10; j++) {
                        if (gfn_nvl(thisdr["ACC_ITEM_YN" + j]) == "Y" && Number(gfn_nvl(thisdr["ORIGINAL_AMT"])) != 0) {
                            if (gfn_nvl(thisdr["ACC_ITEM_CODE" + j]) != "") {
                                if (gfn_nvl(thisdr["ACC_ITEM_VALUE" + j]) == "" || gfn_nvl(thisdr["ACC_ITEM_VALUE" + j]) == "0") {
                                    return false;
                                }
                            }
                        }
                    }

                    stritem_id += gfn_nvl(thisdr["ITEM_ID"], "0") + "|";
                    stritem_seq += gfn_nvl(thisdr["ITEM_SEQ"]) + "|";
                    strfi_org_code += p_fiOrgCode + "|";
                    strline_type += gfn_nvl(thisdr["LINE_TYPE"]) + "|";

                    straccount_code += gfn_nvl(thisdr["ACCOUNT_CODE"]) + "|";
                    strdebit_credit += gfn_nvl(thisdr["DEBIT_CREDIT"]) + "|";

                    strorigin_dr_amt += (gfn_nvl(thisdr["DEBIT_CREDIT"]) == "D" ? gfn_nvl(thisdr["ORIGINAL_AMT"]) : "0.00") + "|";
                    strorigin_cr_amt += (gfn_nvl(thisdr["DEBIT_CREDIT"]) == "C" ? gfn_nvl(thisdr["ORIGINAL_AMT"]) : "0.00") + "|";
                    strfunctional_dr_amt += (gfn_nvl(thisdr["DEBIT_CREDIT"]) == "D" ? gfn_nvl(thisdr["FUNCTIONAL_AMT"]) : "0") + "|";
                    strfunctional_cr_amt += (gfn_nvl(thisdr["DEBIT_CREDIT"]) == "C" ? gfn_nvl(thisdr["FUNCTIONAL_AMT"]) : "0") + "|";

                    strvat_type += gfn_nvl(thisdr["VAT_TYPE"]) + "|";

                    stritem_code += gfn_nvl(thisdr["ITEM_CODE"]) + "|";
                    struom += gfn_nvl(thisdr["UOM"]) + "|";
                    strtxn_qty += gfn_nvl(thisdr["TXN_QTY"]) + "|";
                    strdept_code += gfn_nvl(thisdr["DEPT_CODE"]) + "|";
                    strcost_center_code += gfn_nvl(thisdr["COST_CENTER_CODE"]) + "|";
                    strproject_code += gfn_nvl(thisdr["PROJECT_CODE"]) + "|";
                    strdescription += gfn_nvl(thisdr["DESCRIPTION"]).replace("|", "_").replace("'", "`") + "|";

                    stracc_item_code1 += gfn_nvl(thisdr["ACC_ITEM_CODE1"]) + "|";
                    stracc_item_code2 += gfn_nvl(thisdr["ACC_ITEM_CODE2"]) + "|";
                    stracc_item_code3 += gfn_nvl(thisdr["ACC_ITEM_CODE3"]) + "|";
                    stracc_item_code4 += gfn_nvl(thisdr["ACC_ITEM_CODE4"]) + "|";
                    stracc_item_code5 += gfn_nvl(thisdr["ACC_ITEM_CODE5"]) + "|";
                    stracc_item_code6 += gfn_nvl(thisdr["ACC_ITEM_CODE6"]) + "|";
                    stracc_item_code7 += gfn_nvl(thisdr["ACC_ITEM_CODE7"]) + "|";
                    stracc_item_code8 += gfn_nvl(thisdr["ACC_ITEM_CODE8"]) + "|";
                    stracc_item_code9 += gfn_nvl(thisdr["ACC_ITEM_CODE9"]) + "|";
                    stracc_item_code10 += gfn_nvl(thisdr["ACC_ITEM_CODE10"]) + "|";

                    let strItem = await StringToRemoveMask(thisdr);

                    stracc_item_value1 += strItem[0];
                    stracc_item_value2 += strItem[1];
                    stracc_item_value3 += strItem[2];
                    stracc_item_value4 += strItem[3];
                    stracc_item_value5 += strItem[4];
                    stracc_item_value6 += strItem[5];
                    stracc_item_value7 += strItem[6];
                    stracc_item_value8 += strItem[7];
                    stracc_item_value9 += strItem[8];
                    stracc_item_value10 += strItem[9];

                    stracc_value_name1 += gfn_nvl(thisdr["ACC_VALUE_NAME1"]) + "|";
                    stracc_value_name2 += gfn_nvl(thisdr["ACC_VALUE_NAME2"]) + "|";
                    stracc_value_name3 += gfn_nvl(thisdr["ACC_VALUE_NAME3"]) + "|";
                    stracc_value_name4 += gfn_nvl(thisdr["ACC_VALUE_NAME4"]) + "|";
                    stracc_value_name5 += gfn_nvl(thisdr["ACC_VALUE_NAME5"]) + "|";
                    stracc_value_name6 += gfn_nvl(thisdr["ACC_VALUE_NAME6"]) + "|";
                    stracc_value_name7 += gfn_nvl(thisdr["ACC_VALUE_NAME7"]) + "|";
                    stracc_value_name8 += gfn_nvl(thisdr["ACC_VALUE_NAME8"]) + "|";
                    stracc_value_name9 += gfn_nvl(thisdr["ACC_VALUE_NAME9"]) + "|";
                    stracc_value_name10 += gfn_nvl(thisdr["ACC_VALUE_NAME10"]) + "|";

                    stritem_source_type_d += gfn_nvl(thisdr["ITEM_SOURCE_TYPE"]) + "|";
                    stritem_source_id_d += gfn_nvl(thisdr["ITEM_SOURCE_ID"]) + "|";
                    strsource_record_count_d += gfn_nvl(thisdr["SOURCE_RECORD_COUNT"]) + "|";

                    strexpected_pay_date += gfn_nvl(SBUxMethod.get("EXPECTED_PAY_DATE")) + "|";
                    strpay_term_code += gfn_nvl(SBUxMethod.get("PAY_TERM_CODE")) + "|";
                    strpay_method += gfn_nvl(gfnma_multiSelectGet('#PAY_METHOD')) + "|";

                    strcs_code += gfn_nvl(SBUxMethod.get("CS_CODE")) + "|";
                    strfce_gb += "" + "|";
                    strcurrency_code += gfn_nvl(thisdr["CURRENCY_CODE"]) + "|";
                    strexchange_type += "" + "|";
                    strexchange_rate += gfn_nvl(SBUxMethod.get("EXCHANGE_RATE")) + "|";

                    strvoucher_type += gfn_nvl(SBUxMethod.get("VOUCHER_TYPE")) + "|";
                    strvoucher_no += gfn_nvl(SBUxMethod.get("VOUCHER_NO")) + "|";
                    strpayee_code += gfn_nvl(gfnma_multiSelectGet('#PAYEE_CODE')) + "|";
                    strcard_no += gfn_nvl(thisdr["CARD_NUM"]) + "|";

                    strvoucher_receipt_date += gfn_nvl(SBUxMethod.get("VOUCHER_RECEIPT_DATE")) + "|";

                    strwithhold_flag += gfn_nvl(thisdr["WITHHOLD_FLAG"]) + "|";
                    strwithhold_tax_type += gfn_nvl(thisdr["WITHHOLD_TAX_TYPE"]) + "|";
                    strwithhold_cs_code += gfn_nvl(thisdr["WITHHOLD_CS_CODE"]) + "|";
                    strwithhold_tax_type2 += gfn_nvl(thisdr["WITHHOLD_TAX_TYPE2"]) + "|";
                    strwithhold_cs_code2 += gfn_nvl(thisdr["WITHHOLD_CS_CODE2"]) + "|";
                    strsite_code += gfn_nvl(thisdr["SITE_CODE"]) + "|";
                    strcredit_area += gfn_nvl(thisdr["CREDIT_AREA"]) + "|";
                    strsales_person += gfn_nvl(thisdr["SALES_PERSON"]) + "|";
                    strpo_line_no += gfn_nvl(thisdr["PO_LINE_NO"]) + "|";
                    strsales_cs_code += gfn_nvl(thisdr["SALES_CS_CODE"]) + "|";
                    strapply_complete_flag += gfn_nvl(thisdr["APPLY_COMPLETE_FLAG"]) + "|";
                    strapply_complete_date += gfn_nvl(thisdr["APPLY_COMPLETE_DATE"]) + "|";

                    strhold_flag += gfn_nvl(thisdr["HOLD_FLAG"]) + "|";
                    strrelease_date += gfn_nvl(thisdr["RELEASE_DATE"]) + "|";
                    strrelease_user += gfn_nvl(thisdr["RELEASE_USER"]) + "|";
                    strhold_date += gfn_nvl(thisdr["HOLD_DATE"]) + "|";
                    strhold_user += gfn_nvl(thisdr["HOLD_USER"]) + "|";
                    strhold_reason += gfn_nvl(thisdr["HOLD_REASON"]) + "|";
                    strpay_base_date += (gfn_nvl(thisdr["LINE_TYPE"]) == "1" ? gfn_nvl(SBUxMethod.get("PAY_BASE_DATE")) : "") + "|";
                    strbill_due_date += (gfn_nvl(thisdr["LINE_TYPE"]) == "1" ? gfn_nvl(SBUxMethod.get("BILL_DUE_DATE")) : "") + "|";
                    strbill_due_day += (gfn_nvl(thisdr["LINE_TYPE"]) == "1" ? gfn_nvl(SBUxMethod.get("BILL_DUE_DAY")) : "") + "|";
                    strbill_due_pay_date += (gfn_nvl(thisdr["LINE_TYPE"]) == "1" ? gfn_nvl(SBUxMethod.get("BILL_DUE_PAY_DATE")) : "") + "|";
                    strpay_term_orig += (gfn_nvl(thisdr["LINE_TYPE"]) == "1" ? gfn_nvl(SBUxMethod.get("PAY_TERM_CODE")) : "") + "|";
                    strprod_group += gfn_nvl(thisdr["PROD_GROUP"]) + "|";
                    strbank_account_seq += (gfn_nvl(thisdr["LINE_TYPE"]) == "1" ? gfn_nvl(gfnma_multiSelectGet('#BANK_ACCOUNT_SEQ')) : "") + "|";

                    strsum_acc_item1 += "" + "|";
                    strsum_acc_value1 += "" + "|";
                    strsum_acc_item2 += "" + "|";
                    strsum_acc_value2 += "" + "|";

                    stretax_type += gfn_nvl(thisdr["ETAX_TYPE"]) + "|";
                    strafter_due_date_yn += gfn_nvl(thisdr["AFTER_DUE_DATE_YN"]) + "|";
                    strdup_issue_bill_type += gfn_nvl(thisdr["DUP_ISSUE_BILL_TYPE"]) + "|";
                    strexclude_revenue_amt_yn += gfn_nvl(thisdr["EXCLUDE_REVENUE_AMT_YN"]) + "|";
                    strcard_use_type += gfn_nvl(thisdr["CARD_USE_TYPE"]) + "|";
                    strcard_num += gfn_nvl(thisdr["CARD_NUM"]) + "|";
                    strvat_not_deduction_type += gfn_nvl(thisdr["VAT_NOT_DEDUCTION_TYPE"]) + "|";
                    strreport_omit_yn += gfn_nvl(thisdr["REPORT_OMIT_YN"]) + "|";
                    strstandard_date += gfn_nvl(thisdr["STANDARD_DATE"]) == "" ? "" + "|" : gfn_nvl(thisdr["STANDARD_DATE"]).substring(0, 8) + "|";
                    strvat_asset_type += gfn_nvl(thisdr["VAT_ASSET_TYPE"]) + "|";
                    strsupply_amt += Number(gfn_nvl(thisdr["SUPPLY_AMT"])) + "|";

                    strzero_report_yn += gfn_nvl(thisdr["ZERO_REPORT_YN"]) + "|";
                    strlocal_credit_type += gfn_nvl(thisdr["LOCAL_CREDIT_TYPE"]) + "|";
                    strdocument_name += gfn_nvl(thisdr["DOCUMENT_NAME"]) + "|";
                    strissue_name += gfn_nvl(thisdr["ISSUE_NAME"]) + "|";
                    strdocument_issue_date += gfn_nvl(thisdr["DOCUMENT_ISSUE_DATE"]) + "|";
                    strexport_license_no += gfn_nvl(thisdr["EXPORT_LICENSE_NO"]) + "|";
                    strshipping_date += gfn_nvl(thisdr["SHIPPING_DATE"]) + "|";

                    strexport_amt += Number(gfn_nvl(thisdr["EXPORT_AMT"])) + "|";
                    strexport_amt_krw += Number(gfn_nvl(thisdr["EXPORT_AMT_KRW"])) + "|";
                    strvat_export_amt += Number(gfn_nvl(thisdr["VAT_EXPORT_AMT"])) + "|";
                    strvat_export_amt_krw += Number(gfn_nvl(thisdr["VAT_EXPORT_AMT_KRW"])) + "|";
                    strforeign_amt += Number(gfn_nvl(thisdr["FOREIGN_AMT"])) + "|";
                    strwon_amt += Number(gfn_nvl(thisdr["WON_AMT"])) + "|";
                    strdocument_no += gfn_nvl(thisdr["DOCUMENT_NO"]) + "|";
                    strzero_type += gfn_nvl(thisdr["ZERO_TYPE"]) + "|";
                    strvat_amt += Number(gfn_nvl(thisdr["VAT_AMT"])) + "|";
                }
            }

            if (dSumdr_amt != dSumCr_amt) {
                gfn_comAlert("E0000", "차대금액이 맞지 않습니다. 금액을 확인해 주십시오.");
                return false;
            }

            if (stritem_id != "") {
                stritem_id = stritem_id.substring(0, stritem_id.length - 1);
                stritem_seq = stritem_seq.substring(0, stritem_seq.length - 1);
                strfi_org_code = strfi_org_code.substring(0, strfi_org_code.length - 1);
                strline_type = strline_type.substring(0, strline_type.length - 1);
                straccount_code = straccount_code.substring(0, straccount_code.length - 1);
                strdebit_credit = strdebit_credit.substring(0, strdebit_credit.length - 1);
                strorigin_dr_amt = strorigin_dr_amt.substring(0, strorigin_dr_amt.length - 1);
                strorigin_cr_amt = strorigin_cr_amt.substring(0, strorigin_cr_amt.length - 1);
                strfunctional_dr_amt = strfunctional_dr_amt.substring(0, strfunctional_dr_amt.length - 1);
                strfunctional_cr_amt = strfunctional_cr_amt.substring(0, strfunctional_cr_amt.length - 1);
                strvat_type = strvat_type.substring(0, strvat_type.length - 1);

                stritem_code = stritem_code.substring(0, stritem_code.length - 1);
                struom = struom.substring(0, struom.length - 1);
                strtxn_qty = strtxn_qty.substring(0, strtxn_qty.length - 1);
                strdept_code = strdept_code.substring(0, strdept_code.length - 1);
                strcost_center_code = strcost_center_code.substring(0, strcost_center_code.length - 1);
                strproject_code = strproject_code.substring(0, strproject_code.length - 1);
                strdescription = strdescription.substring(0, strdescription.length - 1);

                stracc_item_code1 = stracc_item_code1.substring(0, stracc_item_code1.length - 1);
                stracc_item_value1 = stracc_item_value1.substring(0, stracc_item_value1.length - 1);
                stracc_item_code2 = stracc_item_code2.substring(0, stracc_item_code2.length - 1);
                stracc_item_value2 = stracc_item_value2.substring(0, stracc_item_value2.length - 1);
                stracc_item_code3 = stracc_item_code3.substring(0, stracc_item_code3.length - 1);
                stracc_item_value3 = stracc_item_value3.substring(0, stracc_item_value3.length - 1);
                stracc_item_code4 = stracc_item_code4.substring(0, stracc_item_code4.length - 1);
                stracc_item_value4 = stracc_item_value4.substring(0, stracc_item_value4.length - 1);
                stracc_item_code5 = stracc_item_code5.substring(0, stracc_item_code5.length - 1);
                stracc_item_value5 = stracc_item_value5.substring(0, stracc_item_value5.length - 1);
                stracc_item_code6 = stracc_item_code6.substring(0, stracc_item_code6.length - 1);
                stracc_item_value6 = stracc_item_value6.substring(0, stracc_item_value6.length - 1);
                stracc_item_code7 = stracc_item_code7.substring(0, stracc_item_code7.length - 1);
                stracc_item_value7 = stracc_item_value7.substring(0, stracc_item_value7.length - 1);
                stracc_item_code8 = stracc_item_code8.substring(0, stracc_item_code8.length - 1);
                stracc_item_value8 = stracc_item_value8.substring(0, stracc_item_value8.length - 1);

                stracc_item_code9 = stracc_item_code9.substring(0, stracc_item_code9.length - 1);
                stracc_item_value9 = stracc_item_value9.substring(0, stracc_item_value9.length - 1);
                stracc_item_code10 = stracc_item_code10.substring(0, stracc_item_code10.length - 1);
                stracc_item_value10 = stracc_item_value10.substring(0, stracc_item_value10.length - 1);

                stracc_value_name1 = stracc_value_name1.substring(0, stracc_value_name1.length - 1);
                stracc_value_name2 = stracc_value_name2.substring(0, stracc_value_name2.length - 1);
                stracc_value_name3 = stracc_value_name3.substring(0, stracc_value_name3.length - 1);
                stracc_value_name4 = stracc_value_name4.substring(0, stracc_value_name4.length - 1);
                stracc_value_name5 = stracc_value_name5.substring(0, stracc_value_name5.length - 1);
                stracc_value_name6 = stracc_value_name6.substring(0, stracc_value_name6.length - 1);
                stracc_value_name7 = stracc_value_name7.substring(0, stracc_value_name7.length - 1);
                stracc_value_name8 = stracc_value_name8.substring(0, stracc_value_name8.length - 1);
                stracc_value_name9 = stracc_value_name9.substring(0, stracc_value_name9.length - 1);
                stracc_value_name10 = stracc_value_name10.substring(0, stracc_value_name10.length - 1);

                stritem_source_type_d = stritem_source_type_d.substring(0, stritem_source_type_d.length - 1);
                stritem_source_id_d = stritem_source_id_d.substring(0, stritem_source_id_d.length - 1);
                strsource_record_count_d = strsource_record_count_d.substring(0, strsource_record_count_d.length - 1);

                strexpected_pay_date = strexpected_pay_date.substring(0, strexpected_pay_date.length - 1);
                strpay_term_code = strpay_term_code.substring(0, strpay_term_code.length - 1);
                strpay_method = strpay_method.substring(0, strpay_method.length - 1);
                strcs_code = strcs_code.substring(0, strcs_code.length - 1);
                strfce_gb = strfce_gb.substring(0, strfce_gb.length - 1);
                strcurrency_code = strcurrency_code.substring(0, strcurrency_code.length - 1);
                strexchange_type = strexchange_type.substring(0, strexchange_type.length - 1);
                strexchange_rate = strexchange_rate.substring(0, strexchange_rate.length - 1);

                strvoucher_type = strvoucher_type.substring(0, strvoucher_type.length - 1);
                strvoucher_no = strvoucher_no.substring(0, strvoucher_no.length - 1);
                strpayee_code = strpayee_code.substring(0, strpayee_code.length - 1);
                strcard_no = strcard_no.substring(0, strcard_no.length - 1);
                strvoucher_receipt_date = strvoucher_receipt_date.substring(0, strvoucher_receipt_date.length - 1);

                strwithhold_flag = strwithhold_flag.substring(0, strwithhold_flag.length - 1);
                strwithhold_tax_type = strwithhold_tax_type.substring(0, strwithhold_tax_type.length - 1);
                strwithhold_cs_code = strwithhold_cs_code.substring(0, strwithhold_cs_code.length - 1);
                strwithhold_tax_type2 = strwithhold_tax_type2.substring(0, strwithhold_tax_type2.length - 1);
                strwithhold_cs_code2 = strwithhold_cs_code2.substring(0, strwithhold_cs_code2.length - 1);

                strsite_code = strsite_code.substring(0, strsite_code.length - 1);
                strcredit_area = strcredit_area.substring(0, strcredit_area.length - 1);
                strsales_person = strsales_person.substring(0, strsales_person.length - 1);
                strpo_line_no = strpo_line_no.substring(0, strpo_line_no.length - 1);
                strsales_cs_code = strsales_cs_code.substring(0, strsales_cs_code.length - 1);
                strapply_complete_flag = strapply_complete_flag.substring(0, strapply_complete_flag.length - 1);
                strapply_complete_date = strapply_complete_date.substring(0, strapply_complete_date.length - 1);

                strhold_flag = strhold_flag.substring(0, strhold_flag.length - 1);
                strrelease_date = strrelease_date.substring(0, strrelease_date.length - 1);
                strrelease_user = strrelease_user.substring(0, strrelease_user.length - 1);
                strhold_date = strhold_date.substring(0, strhold_date.length - 1);
                strhold_user = strhold_user.substring(0, strhold_user.length - 1);
                strhold_reason = strhold_reason.substring(0, strhold_reason.length - 1);
                strpay_base_date = strpay_base_date.substring(0, strpay_base_date.length - 1);
                strbill_due_date = strbill_due_date.substring(0, strbill_due_date.length - 1);
                strbill_due_day = strbill_due_day.substring(0, strbill_due_day.length - 1);
                strbill_due_pay_date = strbill_due_pay_date.substring(0, strbill_due_pay_date.length - 1);
                strpay_term_orig = strpay_term_orig.substring(0, strpay_term_orig.length - 1);
                strprod_group = strprod_group.substring(0, strprod_group.length - 1);
                strbank_account_seq = strbank_account_seq.substring(0, strbank_account_seq.length - 1);

                strsum_acc_item1 = strsum_acc_item1.substring(0, strsum_acc_item1.length - 1);
                strsum_acc_value1 = strsum_acc_value1.substring(0, strsum_acc_value1.length - 1);
                strsum_acc_item2 = strsum_acc_item2.substring(0, strsum_acc_item2.length - 1);
                strsum_acc_value2 = strsum_acc_value2.substring(0, strsum_acc_value2.length - 1);

                stretax_type = stretax_type.substring(0, stretax_type.length - 1);
                strafter_due_date_yn = strafter_due_date_yn.substring(0, strafter_due_date_yn.length - 1);
                strdup_issue_bill_type = strdup_issue_bill_type.substring(0, strdup_issue_bill_type.length - 1);
                strexclude_revenue_amt_yn = strexclude_revenue_amt_yn.substring(0, strexclude_revenue_amt_yn.length - 1);
                strcard_use_type = strcard_use_type.substring(0, strcard_use_type.length - 1);
                strcard_num = strcard_num.substring(0, strcard_num.length - 1);
                strvat_not_deduction_type = strvat_not_deduction_type.substring(0, strvat_not_deduction_type.length - 1);
                strreport_omit_yn = strreport_omit_yn.substring(0, strreport_omit_yn.length - 1);
                strstandard_date = strstandard_date.substring(0, strstandard_date.length - 1);
                strvat_asset_type = strvat_asset_type.substring(0, strvat_asset_type.length - 1);
                strsupply_amt = strsupply_amt.substring(0, strsupply_amt.length - 1);
                strzero_report_yn = strzero_report_yn.substring(0, strzero_report_yn.length - 1);
                strlocal_credit_type = strlocal_credit_type.substring(0, strlocal_credit_type.length - 1);
                strdocument_name = strdocument_name.substring(0, strdocument_name.length - 1);
                strissue_name = strissue_name.substring(0, strissue_name.length - 1);
                strdocument_issue_date = strdocument_issue_date.substring(0, strdocument_issue_date.length - 1);
                strexport_license_no = strexport_license_no.substring(0, strexport_license_no.length - 1);
                strshipping_date = strshipping_date.substring(0, strshipping_date.length - 1);
                strexport_amt = strexport_amt.substring(0, strexport_amt.length - 1);
                strexport_amt_krw = strexport_amt_krw.substring(0, strexport_amt_krw.length - 1);
                strvat_export_amt = strvat_export_amt.substring(0, strvat_export_amt.length - 1);
                strvat_export_amt_krw = strvat_export_amt_krw.substring(0, strvat_export_amt_krw.length - 1);
                strforeign_amt = strforeign_amt.substring(0, strforeign_amt.length - 1);
                strwon_amt = strwon_amt.substring(0, strwon_amt.length - 1);
                strdocument_no = strdocument_no.substring(0, strdocument_no.length - 1);
                strzero_type = strzero_type.substring(0, strzero_type.length - 1);
                strvat_amt = strvat_amt.substring(0, strvat_amt.length - 1);
            }

            if (strRowStatus != "D") {
                if (straccount_code == "") {
                    gfn_comAlert("E0000", "전표내역을 입력해 주십시오.");
                    return false;
                }
            }

            var paramObj = {
                V_P_DEBUG_MODE_YN: '',
                V_P_LANG_ID: '',
                V_P_COMP_CODE: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                V_P_ACCT_RULE_CODE : gfn_nvl(SBUxMethod.get("ACCT_RULE_CODE")),
                IV_P_DOC_BATCH_NO : gfn_nvl(SBUxMethod.get("DOC_BATCH_NO")),
                V_P_KEY_ID_H : gfn_nvl(SBUxMethod.get("KEY_ID")),
                V_P_DOC_ID_H : parseInt(gfn_nvl(SBUxMethod.get("DOC_ID")) == "" ? "0" : gfn_nvl(SBUxMethod.get("DOC_ID"))),
                V_P_SOURCE_ID_H : 0,
                V_P_FI_ORG_CODE_H : p_fiOrgCode,
                V_P_DOC_DATE_H : gfn_nvl(SBUxMethod.get("DOC_DATE")),
                V_P_WRITE_DATE_H : "",
                V_P_APPROVE_DATE_H : "",
                V_P_DOC_NUM_H : 0,
                V_P_DOC_NAME_H : gfn_nvl(SBUxMethod.get("DOC_NAME")),
                V_P_SITE_CODE_H : gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE")),
                V_P_DOC_TYPE_H : gfn_nvl(SBUxMethod.get("DOC_TYPE")),
                V_P_DEPT_CODE_H : gfn_nvl(SBUxMethod.get("DEPT_CODE")),
                V_P_ENTRY_PATH_H : strsourceType,
                V_P_DOC_AMT_H : 0,
                V_P_DOC_STATUS_H : gfn_nvl(gfnma_multiSelectGet('#DOC_STATUS')),
                V_P_SOURCE_TYPE_H : strsourceType,
                V_P_CURRENCY_CODE_H : gfn_nvl(gfnma_multiSelectGet('#CURRENCY_CODE')),
                V_P_EXCHANGE_TYPE_H : gfn_nvl(SBUxMethod.get("EXCHANGE_TYPE")),
                V_P_EXCHANGE_RATE_H : Number(gfn_nvl(SBUxMethod.get("EXCHANGE_RATE")) == "" ? "1" : gfn_nvl(SBUxMethod.get("EXCHANGE_RATE"))),
                V_P_DESCRIPTION_H : gfn_nvl(SBUxMethod.get("DESCRIPTION")),
                V_P_ACCT_OPINION_H : gfn_nvl(SBUxMethod.get("ACCT_OPINION")),
                V_P_TR_OPINION_H : gfn_nvl(SBUxMethod.get("TR_OPINION")),
                V_P_SOURCE_DOC_H : gfn_nvl(SBUxMethod.get("SOURCE_DOC")),
                V_P_TAX_SITE_CODE_H : gfn_nvl(gfnma_multiSelectGet("#TAX_SITE_CODE")),
                V_P_SUB_TAX_SITE_CODE_H : gfn_nvl(gfnma_multiSelectGet("#SUB_TAX_SITE_CODE")),
                V_P_APPROVAL_NO_H : gfn_nvl(SBUxMethod.get("APPROVAL_NO")),
                V_P_KEY_ID_D : "",
                V_P_ITEM_ID_D : stritem_id,
                V_P_ITEM_SEQ_D : stritem_seq,
                V_P_FI_ORG_CODE_D : strfi_org_code,
                V_P_LINE_TYPE_D : strline_type,
                V_P_ACCOUNT_CODE_D : straccount_code,
                V_P_DEBIT_CREDIT_D : strdebit_credit,
                V_P_ORIGINAL_DR_AMT_D : strorigin_dr_amt,
                V_P_ORIGINAL_CR_AMT_D : strorigin_cr_amt,
                V_P_FUNCTIONAL_DR_AMT_D : strfunctional_dr_amt,
                V_P_FUNCTIONAL_CR_AMT_D : strfunctional_cr_amt,
                V_P_VAT_TYPE_D : strvat_type,
                V_P_DEPT_CODE_D : strdept_code,
                V_P_COST_CENTER_CODE_D : strcost_center_code,
                V_P_PROJECT_CODE_D : strproject_code,
                V_P_ITEM_CODE_D : stritem_code,
                V_P_UOM_D : struom,
                V_P_TXN_QTY_D : strtxn_qty,
                V_P_DESCRIPTION_D : strdescription,
                V_P_ACC_ITEM_CODE1_D : stracc_item_code1,
                V_P_ACC_ITEM_VALUE1_D : stracc_item_value1,
                V_P_ACC_ITEM_CODE2_D : stracc_item_code2,
                V_P_ACC_ITEM_VALUE2_D : stracc_item_value2,
                V_P_ACC_ITEM_CODE3_D : stracc_item_code3,
                V_P_ACC_ITEM_VALUE3_D : stracc_item_value3,
                V_P_ACC_ITEM_CODE4_D : stracc_item_code4,
                V_P_ACC_ITEM_VALUE4_D : stracc_item_value4,
                V_P_ACC_ITEM_CODE5_D : stracc_item_code5,
                V_P_ACC_ITEM_VALUE5_D : stracc_item_value5,
                V_P_ACC_ITEM_CODE6_D : stracc_item_code6,
                V_P_ACC_ITEM_VALUE6_D : stracc_item_value6,
                V_P_ACC_ITEM_CODE7_D : stracc_item_code7,
                V_P_ACC_ITEM_VALUE7_D : stracc_item_value7,
                V_P_ACC_ITEM_CODE8_D : stracc_item_code8,
                V_P_ACC_ITEM_VALUE8_D : stracc_item_value8,
                V_P_ACC_ITEM_CODE9_D : stracc_item_code9,
                V_P_ACC_ITEM_VALUE9_D : stracc_item_value9,
                V_P_ACC_ITEM_CODE10_D : stracc_item_code10,
                V_P_ACC_ITEM_VALUE10_D : stracc_item_value10,
                V_P_ACC_ITEM_VALUE_NAME1_D : stracc_value_name1,
                V_P_ACC_ITEM_VALUE_NAME2_D : stracc_value_name2,
                V_P_ACC_ITEM_VALUE_NAME3_D : stracc_value_name3,
                V_P_ACC_ITEM_VALUE_NAME4_D : stracc_value_name4,
                V_P_ACC_ITEM_VALUE_NAME5_D : stracc_value_name5,
                V_P_ACC_ITEM_VALUE_NAME6_D : stracc_value_name6,
                V_P_ACC_ITEM_VALUE_NAME7_D : stracc_value_name7,
                V_P_ACC_ITEM_VALUE_NAME8_D : stracc_value_name8,
                V_P_ACC_ITEM_VALUE_NAME9_D : stracc_value_name9,
                V_P_ACC_ITEM_VALUE_NAME10_D : stracc_value_name10,
                V_P_ITEM_SOURCE_TYPE_D : stritem_source_type_d,
                V_P_ITEM_SOURCE_ID_D : stritem_source_id_d,
                V_P_SOURCE_RECORD_COUNT_D : strsource_record_count_d,
                V_P_EXPECTED_PAY_DATE_D : strexpected_pay_date,
                V_P_PAY_TERM_CODE_D : strpay_term_code,
                V_P_PAY_METHOD_D : strpay_method,
                V_P_CS_CODE_D : strcs_code,
                V_P_FCE_GB_D : strfce_gb,
                V_P_CURRENCY_CODE_D : strcurrency_code,
                V_P_EXCHANGE_TYPE_D : strexchange_type,
                V_P_EXCHANGE_RATE_D : strexchange_rate,
                V_P_VOUCHER_TYPE_D : strvoucher_type,
                V_P_VOUCHER_NO_D : strvoucher_no,
                V_P_PAYEE_CODE_D : strpayee_code,
                V_P_CARD_NO_D : strcard_no,
                V_P_VOUCHER_RECEIPT_DATE_D : strvoucher_receipt_date,
                V_P_WITHHOLD_FLAG_D : strwithhold_flag,
                V_P_WITHHOLD_TAX_TYPE_D : strwithhold_tax_type,
                V_P_WITHHOLD_CS_CODE_D : strwithhold_cs_code,
                V_P_WITHHOLD_TAX_TYPE2_D : strwithhold_tax_type2,
                V_P_WITHHOLD_CS_CODE2_D : strwithhold_cs_code2,
                V_P_SITE_CODE_D : strsite_code,
                V_P_CREDIT_AREA_D : strcredit_area,
                V_P_SALES_PERSON_D : strsales_person,
                V_P_PO_LINE_NO_D : strpo_line_no,
                V_P_SALES_CS_CODE_D : strsales_cs_code,
                V_P_APPLY_COMPLETE_FLAG_D : strapply_complete_flag,
                V_P_APPLY_COMPLETE_DATE_D : strapply_complete_date,
                V_P_HOLD_FLAG_D : strhold_flag,
                V_P_RELEASE_DATE_D : strrelease_date,
                V_P_RELEASE_USER_D : strrelease_user,
                V_P_HOLD_DATE_D : strhold_date,
                V_P_HOLD_USER_D : strhold_user,
                V_P_HOLD_REASON_D : strhold_reason,
                V_P_PAY_BASE_DATE_D : strpay_base_date,
                V_P_BILL_DUE_DATE_D : strbill_due_date,
                V_P_BILL_DUE_DAY_D : strbill_due_day,
                V_P_BILL_DUE_PAY_DATE_D : strbill_due_pay_date,
                V_P_PAY_TERM_ORIG_D : strpay_term_orig,
                V_P_PROD_GROUP_D : strprod_group,
                V_P_BANK_ACCOUNT_SEQ_D : strbank_account_seq,
                V_P_ETAX_TYPE_D : stretax_type,
                V_P_AFTER_DUE_DATE_YN_D : strafter_due_date_yn,
                V_P_DUP_ISSUE_BILL_TYPE_D : strdup_issue_bill_type,
                V_P_EXCLUDE_REVENUE_AMT_YN_D : strexclude_revenue_amt_yn,
                V_P_CARD_USE_TYPE_D : strcard_use_type,
                V_P_CARD_NUM_D : strcard_num,
                V_P_VAT_NOT_DEDUCTION_TYPE_D : strvat_not_deduction_type,
                V_P_REPORT_OMIT_YN_D : strreport_omit_yn,
                V_P_STANDARD_DATE_D : strstandard_date,
                V_P_VAT_ASSET_TYPE_D : strvat_asset_type,
                V_P_SUPPLY_AMT_D : strsupply_amt,
                V_P_ZERO_REPORT_YN_D : strzero_report_yn,
                V_P_LOCAL_CREDIT_TYPE_D : strlocal_credit_type,
                V_P_DOCUMENT_NAME_D : strdocument_name,
                V_P_ISSUE_NAME_D : strissue_name,
                V_P_DOCUMENT_ISSUE_DATE_D : strdocument_issue_date,
                V_P_EXPORT_LICENSE_NO_D : strexport_license_no,
                V_P_SHIPPING_DATE_D : strshipping_date,
                V_P_EXPORT_AMT_D : strexport_amt,
                V_P_EXPORT_AMT_KRW_D : strexport_amt_krw,
                V_P_VAT_EXPORT_AMT_D : strvat_export_amt,
                V_P_VAT_EXPORT_AMT_KRW_D : strvat_export_amt_krw,
                V_P_FOREIGN_AMT_D : strforeign_amt,
                V_P_WON_AMT_D : strwon_amt,
                V_P_DOCUMENT_NO_D : strdocument_no,
                V_P_ZERO_TYPE_D : strzero_type,
                V_P_VAT_AMT_D : strvat_amt,
                V_P_DEPT_CODE : p_deptCode,
                V_P_EMP_CODE : p_empCd,
                V_P_FORM_ID: p_formId,
                V_P_MENU_ID: p_menuId,
                V_P_PROC_ID: '',
                V_P_USERID: '',
                V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3510List.do", {
                getType: 'json',
                workType: strRowStatus,
                cv_count: '0',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            bResult = false;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (gfn_nvl(SBUxMethod.get("DOC_BATCH_NO")) == "") {
                        if (data.v_returnStr.indexOf("_") > -1) {
                            SBUxMethod.set("DOC_BATCH_NO", data.v_returnStr.split("_")[0]);
                        } else {
                            SBUxMethod.set("DOC_BATCH_NO", data.v_returnStr);
                        }
                    }

                    bResult = true;
                } else {
                    var strreturn_string = data.v_returnStr.split('|');

                    gfn_comAlert("E0002", "배치번호 : " + data.v_returnStr.replaceAll("|", ","));

                    bResult = false;
                }

                return bResult;
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

    const fn_save = async function () {
        if (gfn_nvl(SBUxMethod.get("BNKCNT")) == "Y") {
            if (!gfn_comConfirm("Q0000", "해당 거래처의 등록계좌가 2개이상입니다.\r" +
                "선택하신계좌는 " + gfn_nvl(SBUxMethod.getText("BANK_CODE"))
                + " " +
                gfn_nvl(SBUxMethod.get("BANK_ACCOUNT_NO")) + " 입니다"))
                return;

        }

        if (gfn_nvl(SBUxMethod.get("TXN_STOP_YN")) == "Y") {
            gfn_comAlert("E0000", "거래중지 업체입니다." + gfn_nvl(SBUxMethod.get("TXN_STOP_REASON")))
            return;
        }

        if (parseInt(SBUxMethod.get("EXCHANGE_RATE")) == 0) {
            gfn_comAlert("E0000", "환율정보 전송중입니다.10분후 작업하세요");
            return;
        }

        for (var i = 0; i < jsonAccountLineList.length; i++){
            if (gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("LINE_TYPE")) == "1") {
                if (gfn_nvl(gfnma_multiSelectGet('#VAT_CODE')) != gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("VAT_TYPE"))) {
                    gfn_comAlert("E0000", "부가세정보를 변경하면 라인생성을 다시해야합니다.");
                    return;
                }

                if (Number(gfn_nvl(SBUxMethod.get("DOC_AMT")).replace(/,/g, '')) != Number(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ORIGINAL_AMT")))) {
                    gfn_comAlert("E0000", "총지급액과 전표라인정보를 확인하세요.");
                    return;
                }
            } else if (gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("LINE_TYPE")) == "3" && gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("VAT_TYPE")) != "VE") {
                if (Number(gfn_nvl(SBUxMethod.get("VAT_AMOUNT")).replace(/,/g, '')) != Number(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ORIGINAL_AMT")))) {
                    gfn_comAlert("E0000", "부가세금액과 전표라인정보를 확인하세요.");
                    return;
                }
            }

            for (var j = 1; j <= 10; j++){
                if (gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ACC_ITEM_YN" + j)) == "Y" && Number(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ORIGINAL_AMT"))) != 0) {
                    if (gfn_nvl(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ACC_ITEM_CODE" + j))) != "") {
                        if (gfn_nvl(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ACC_ITEM_VALUE" + j))) == "") {
                            gfn_comAlert("E0000", gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ACCOUNT_NAME")) + " 계정의 관리항목을 입력해야 합니다.");

                            gvwWFItem.clickRow((i+1));

                            if (gfn_nvl(SBUxMethod.get("ACC_ITEM_VALUE" + j)) != "") {
                                SBUxMethod.focus("ACC_ITEM_VALUE" + j);
                            }

                            return;
                        }
                    }
                }
            }
        }

        //관리항목 체크 입력이 필수일때 값이 없으면 리턴
        if (!SBUxMethod.validateRequired( {group_id: 'panWFBottom'} ))
            return;

        if (!SBUxMethod.validateRequired( {group_id: 'panWFTop'} ) || !validateRequired("panWFTop"))
            return;

        if (gfn_nvl(SBUxMethod.get("DOC_BATCH_NO")) == "") {
            if (!await fnSET_P_FIG3510_S("GEN")) {
                return false;
            }
        }
        if (await fnSET_P_FIG3510_S("")) {
            SBUxMethod.set("APPROVAL_NO", "");
            fn_search();
        }
    }

    const fn_delete = async function () {
        if (gfn_nvl(gfnma_multiSelectGet('#DOC_STATUS')) == "5" || gfn_nvl(gfnma_multiSelectGet('#DOC_STATUS')) == "6") {
            gfn_comAlert("E0000", "일부 내역이 승인 또는 완료처리되어 행삭제가 불가능합니다.");
            return;
        }

        if (gfn_nvl(SBUxMethod.get("REGISTER_YN")) == "Y") {
            gfn_comAlert("E0000", "자금계획으로 등록된 내역이므로 삭제가 불가능합니다.");
            return;
        }

        let strkey_id = gfn_nvl(SBUxMethod.get("KEY_ID"));

        for (var j = jsonAccountLineList.length - 1; j >= 0; j--){
            let strKeyIdItem = gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("KEY_ID"));

            if (strkey_id == strKeyIdItem) {
                gvwWFItem.deleteRow((j+1));
            }
        }

        if (gfn_comConfirm("정말 삭제하시겠습니까? 삭제하시려면 예를 클릭하세요.")) {
            if (await fnSET_P_FIG3510_S("D")) {
                fn_create();
            }
        }
    }

    const fn_search = async function () {
        /*if (!SBUxMethod.validateRequired( {group_id: 'panWFTop'} ) || !validateRequired("panWFTop")) {
            return false;
        }*/

        let DOC_BATCH_NO = gfn_nvl(SBUxMethod.get("DOC_BATCH_NO"));

        var paramObj = {
            V_P_DEBUG_MODE_YN: '',
            V_P_LANG_ID: '',
            V_P_COMP_CODE: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
            IV_P_DOC_BATCH_NO: DOC_BATCH_NO,
            V_P_DOC_NUM: 0,
            V_P_DOC_ID: 0,
            V_P_DOC_DATE: '',
            V_P_CURRENCY_CODE: '',
            V_P_PAY_METHOD: '',
            V_P_CS_CODE: '',
            V_P_RULE_CODE: '',
            V_P_SOURCE_TYPE: strsourceType,
            V_P_FORM_ID: p_formId,
            V_P_MENU_ID: p_menuId,
            V_P_PROC_ID: '',
            V_P_USERID: '',
            V_P_PC: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/fi/far/rec/selectFig3510List.do", {
            getType: 'json',
            workType: 'Q',
            cv_count: '10',
            params: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                jsonAccountLineList.length = 0;

                var formData = listData.cv_1[0];

                if(formData) {
                    SBUxMethod.set('KEY_ID', formData.KEY_ID);
                    SBUxMethod.set('ACCT_RULE_CODE', formData.ACCT_RULE_CODE);
                    SBUxMethod.set('SRCH_DOC_H_FI_ORG_CODE', formData.FI_ORG_CODE);
                    SBUxMethod.set('SRCH_SITE_CODE', formData.SITE_CODE);
                    SBUxMethod.set('DEPT_CODE', formData.DEPT_CODE);
                    SBUxMethod.set('DEPT_NAME', formData.DEPT_NAME);
                    SBUxMethod.set('DOC_ID', formData.DOC_ID);
                    SBUxMethod.set('DOC_TYPE', formData.DOC_TYPE);
                    SBUxMethod.set('DOC_DATE', formData.DOC_DATE);
                    SBUxMethod.set('CS_CODE', formData.CS_CODE);
                    SBUxMethod.set('CS_NAME', formData.CS_NAME);
                    SBUxMethod.set('BIZ_REGNO', formData.BIZ_REGNO);
                    SBUxMethod.set('DOC_NAME', formData.DOC_NAME);
                    SBUxMethod.set('DOC_NUM', formData.DOC_NUM);
                    gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', gfn_nvl(formData.CURRENCY_CODE));
                    SBUxMethod.set('EXCHANGE_RATE', formData.EXCHANGE_RATE);
                    SBUxMethod.set('BASE_SCALE', formData.BASE_SCALE);
                    gfnma_multiSelectSet('#VAT_CODE', 'VAT_CODE', 'VAT_NAME', gfn_nvl(formData.VAT_CODE));
                    SBUxMethod.set('DOC_AMT', formData.DOC_AMT);
                    gfnma_multiSelectSet('#PAY_METHOD', 'SUB_CODE', 'CODE_NAME', gfn_nvl(formData.PAY_METHOD));
                    SBUxMethod.set('PAY_TERM_CODE', formData.PAY_TERM_CODE);
                    SBUxMethod.set('PAY_TERM_NAME', formData.PAY_TERM_NAME);
                    SBUxMethod.set('VAT_AMOUNT', formData.VAT_AMOUNT);
                    SBUxMethod.set('STANDARD_DATE', formData.STANDARD_DATE);
                    SBUxMethod.set('SUPPLY_AMT', formData.SUPPLY_AMT);
                    SBUxMethod.set('DESCRIPTION', formData.DESCRIPTION);
                    SBUxMethod.set('PAY_BASE_DATE', formData.PAY_BASE_DATE);
                    SBUxMethod.set('EXPECTED_PAY_DATE', formData.EXPECTED_PAY_DATE);
                    SBUxMethod.set('BASIS_TYPE', formData.BASIS_TYPE);
                    fn_changeBasisType();
                    SBUxMethod.set('DIFF_DAY', formData.DIFF_DAY);
                    SBUxMethod.set('BILL_DUE_DATE', formData.BILL_DUE_DATE);
                    SBUxMethod.set('BILL_DUE_DAY', formData.BILL_DUE_DAY);
                    SBUxMethod.set('BILL_DUE_PAY_DATE', formData.BILL_DUE_PAY_DATE);
                    SBUxMethod.set('VOUCHER_RECEIPT_DATE', formData.VOUCHER_RECEIPT_DATE);
                    SBUxMethod.set('VOUCHER_TYPE', formData.VOUCHER_TYPE);
                    SBUxMethod.set('VOUCHER_NO', formData.VOUCHER_NO);
                    gfnma_multiSelectSet('#PAYEE_CODE', 'USER_ID', 'USER_NAME', gfn_nvl(formData.PAYEE_CODE));
                    SBUxMethod.set('PAYEE_NAME', formData.PAYEE_NAME);
                    SBUxMethod.set('APPROVE_DATE', formData.APPROVE_DATE);
                    SBUxMethod.set('FINAL_APPROVER', formData.FINAL_APPROVER);
                    gfnma_multiSelectSet('#DOC_STATUS', 'SUB_CODE', 'CODE_NAME', gfn_nvl(formData.DOC_STATUS));
                    SBUxMethod.set('ACCT_OPINION', formData.ACCT_OPINION);
                    SBUxMethod.set('TR_OPINION', formData.TR_OPINION);
                    SBUxMethod.set('POSTING_DATE', formData.POSTING_DATE);
                    SBUxMethod.set('POSTING_USER', formData.POSTING_USER);
                    SBUxMethod.set('UNPOSTING_DATE', formData.UNPOSTING_DATE);
                    SBUxMethod.set('UNPOSTING_USER', formData.UNPOSTING_USER);
                    SBUxMethod.set('REGISTER_YN', formData.REGISTER_YN);
                    SBUxMethod.set('APPR_COUNT', formData.APPR_COUNT);
                    SBUxMethod.set('APPR_ID', formData.APPR_ID);
                    SBUxMethod.set('INSERT_USERID', formData.INSERT_USERID);
                    SBUxMethod.set('CONFIRM_EMP_CODE', formData.CONFIRM_EMP_CODE);
                    SBUxMethod.set('PROXY_EMP_CODE', formData.PROXY_EMP_CODE);
                    SBUxMethod.set('TEMP_AREA', formData.TEMP_AREA);
                    await fn_getBankAccountSeq();

                    SBUxMethod.set('BANK_CODE', formData.BANK_CODE);
                    SBUxMethod.set('BANK_ACCOUNT_NO', formData.BANK_ACCOUNT_NO);
                    SBUxMethod.set('BANK_ACCOUNT_DESCRIPTION', formData.BANK_ACCOUNT_DESCRIPTION);
                    gfnma_multiSelectSet('#TAX_SITE_CODE', 'TAX_SITE_CODE', 'TAX_SITE_NAME', gfn_nvl(formData.TAX_SITE_CODE));
                    gfnma_multiSelectSet('#SUB_TAX_SITE_CODE', 'TAX_SITE_CODE', 'TAX_SITE_NAME', gfn_nvl(formData.SUB_TAX_SITE_CODE));
                    SBUxMethod.set('APPLY_COMPLETE_FLAG', formData.APPLY_COMPLETE_FLAG);
                    SBUxMethod.set('REVERSE_FLAG', formData.REVERSE_FLAG);
                    SBUxMethod.set('REVERSE_DOC_NAME', formData.REVERSE_DOC_NAME);
                    SBUxMethod.set('REVERSE_DOC_ID', formData.REVERSE_DOC_ID);
                    SBUxMethod.set('ORIG_DOC_ID', formData.ORIG_DOC_ID);
                    SBUxMethod.set('HEADER_COST_CENTER', formData.HEADER_COST_CENTER);
                    SBUxMethod.set('REQUEST_EMP', formData.REQUEST_EMP);
                    SBUxMethod.set('REQUEST_EMP_CODE', formData.REQUEST_EMP_CODE);
                    SBUxMethod.set('BEFORE_APPR_EMP', formData.BEFORE_APPR_EMP);
                    SBUxMethod.set('BEFORE_APPR_EMP_CODE', formData.BEFORE_APPR_EMP_CODE);
                    SBUxMethod.set('BEFORE_PROXY_EMP_CODE', formData.BEFORE_PROXY_EMP_CODE);
                    SBUxMethod.set('NEXT_APPR_EMP', formData.NEXT_APPR_EMP);
                    SBUxMethod.set('BILL_NO', formData.BILL_NO);
                    await gfnma_multiSelectSet('#BANK_ACCOUNT_SEQ', 'BANK_ACCOUNT_SEQ', 'SEQ_NAME', gfn_nvl(formData.BANK_ACCOUNT_SEQ));
                }

                listData.cv_2.forEach((item, index) => {
                    var msg = {
                        KEY_ID: item.KEY_ID,
                        ITEM_ID: item.ITEM_ID,
                        ITEM_SEQ: item.ITEM_SEQ,
                        LINE_TYPE: item.LINE_TYPE,
                        DEBIT_CREDIT: item.DEBIT_CREDIT,
                        VAT_TYPE: item.VAT_TYPE,
                        VAT_NAME: item.VAT_NAME,
                        VAT_TYPE_CODE: item.VAT_TYPE_CODE,
                        DEPT_CODE: item.DEPT_CODE,
                        COST_CENTER_CODE: item.COST_CENTER_CODE,
                        COST_CENTER_NAME: item.COST_CENTER_NAME,
                        PROJECT_CODE: item.PROJECT_CODE,
                        PROJECT_NAME: item.PROJECT_NAME,
                        ORIGINAL_AMT: item.ORIGINAL_AMT,
                        FUNCTIONAL_AMT: item.FUNCTIONAL_AMT,
                        ITEM_SUPPLY_AMOUNT: item.ITEM_SUPPLY_AMOUNT,
                        TXN_QTY: item.TXN_QTY,
                        ACCOUNT_CODE: item.ACCOUNT_CODE,
                        ACCOUNT_NAME: item.ACCOUNT_NAME,
                        COST_CLASS: item.COST_CLASS,
                        TMP_ACCOUNT_CODE: item.TMP_ACCOUNT_CODE,
                        TMP_ACCOUNT_NAME: item.TMP_ACCOUNT_NAME,
                        ACC_CATEGORY: item.ACC_CATEGORY,
                        ACC_ITEM_CODE1: item.ACC_ITEM_CODE1,
                        ACC_ITEM_CODE2: item.ACC_ITEM_CODE2,
                        ACC_ITEM_CODE3: item.ACC_ITEM_CODE3,
                        ACC_ITEM_CODE4: item.ACC_ITEM_CODE4,
                        ACC_ITEM_CODE5: item.ACC_ITEM_CODE5,
                        ACC_ITEM_CODE6: item.ACC_ITEM_CODE6,
                        ACC_ITEM_CODE7: item.ACC_ITEM_CODE7,
                        ACC_ITEM_CODE8: item.ACC_ITEM_CODE8,
                        ACC_ITEM_CODE9: item.ACC_ITEM_CODE9,
                        ACC_ITEM_CODE10: item.ACC_ITEM_CODE10,
                        ACC_ITEM_NAME1: item.ACC_ITEM_NAME1,
                        ACC_ITEM_NAME2: item.ACC_ITEM_NAME2,
                        ACC_ITEM_NAME3: item.ACC_ITEM_NAME3,
                        ACC_ITEM_NAME4: item.ACC_ITEM_NAME4,
                        ACC_ITEM_NAME5: item.ACC_ITEM_NAME5,
                        ACC_ITEM_NAME6: item.ACC_ITEM_NAME6,
                        ACC_ITEM_NAME7: item.ACC_ITEM_NAME7,
                        ACC_ITEM_NAME8: item.ACC_ITEM_NAME8,
                        ACC_ITEM_NAME9: item.ACC_ITEM_NAME9,
                        ACC_ITEM_NAME10: item.ACC_ITEM_NAME10,
                        ACC_ITEM_YN1: item.ACC_ITEM_YN1,
                        ACC_ITEM_YN2: item.ACC_ITEM_YN2,
                        ACC_ITEM_YN3: item.ACC_ITEM_YN3,
                        ACC_ITEM_YN4: item.ACC_ITEM_YN4,
                        ACC_ITEM_YN5: item.ACC_ITEM_YN5,
                        ACC_ITEM_YN6: item.ACC_ITEM_YN6,
                        ACC_ITEM_YN7: item.ACC_ITEM_YN7,
                        ACC_ITEM_YN8: item.ACC_ITEM_YN8,
                        ACC_ITEM_YN9: item.ACC_ITEM_YN9,
                        ACC_ITEM_YN10: item.ACC_ITEM_YN10,
                        DATA_TYPE1: item.DATA_TYPE1,
                        DATA_TYPE2: item.DATA_TYPE2,
                        DATA_TYPE3: item.DATA_TYPE3,
                        DATA_TYPE4: item.DATA_TYPE4,
                        DATA_TYPE5: item.DATA_TYPE5,
                        DATA_TYPE6: item.DATA_TYPE6,
                        DATA_TYPE7: item.DATA_TYPE7,
                        DATA_TYPE8: item.DATA_TYPE8,
                        DATA_TYPE9: item.DATA_TYPE9,
                        DATA_TYPE10: item.DATA_TYPE10,
                        POPUP_ID1: item.POPUP_ID1,
                        POPUP_ID2: item.POPUP_ID2,
                        POPUP_ID3: item.POPUP_ID3,
                        POPUP_ID4: item.POPUP_ID4,
                        POPUP_ID5: item.POPUP_ID5,
                        POPUP_ID6: item.POPUP_ID6,
                        POPUP_ID7: item.POPUP_ID7,
                        POPUP_ID8: item.POPUP_ID8,
                        POPUP_ID9: item.POPUP_ID9,
                        POPUP_ID10: item.POPUP_ID10,
                        ACC_CHARACTER: item.ACC_CHARACTER,
                        ACC_ITEM_VALUE1: item.ACC_ITEM_VALUE1,
                        ACC_ITEM_VALUE2: item.ACC_ITEM_VALUE2,
                        ACC_ITEM_VALUE3: item.ACC_ITEM_VALUE3,
                        ACC_ITEM_VALUE4: item.ACC_ITEM_VALUE4,
                        ACC_ITEM_VALUE5: item.ACC_ITEM_VALUE5,
                        ACC_ITEM_VALUE6: item.ACC_ITEM_VALUE6,
                        ACC_ITEM_VALUE7: item.ACC_ITEM_VALUE7,
                        ACC_ITEM_VALUE8: item.ACC_ITEM_VALUE8,
                        ACC_ITEM_VALUE9: item.ACC_ITEM_VALUE9,
                        ACC_ITEM_VALUE10: item.ACC_ITEM_VALUE10,
                        ACC_VALUE_NAME1: item.ACC_VALUE_NAME1,
                        ACC_VALUE_NAME2: item.ACC_VALUE_NAME2,
                        ACC_VALUE_NAME3: item.ACC_VALUE_NAME3,
                        ACC_VALUE_NAME4: item.ACC_VALUE_NAME4,
                        ACC_VALUE_NAME5: item.ACC_VALUE_NAME5,
                        ACC_VALUE_NAME6: item.ACC_VALUE_NAME6,
                        ACC_VALUE_NAME7: item.ACC_VALUE_NAME7,
                        ACC_VALUE_NAME8: item.ACC_VALUE_NAME8,
                        ACC_VALUE_NAME9: item.ACC_VALUE_NAME9,
                        ACC_VALUE_NAME10: item.ACC_VALUE_NAME10,
                        ITEM_CODE: item.ITEM_CODE,
                        UOM: item.UOM,
                        TXN_QTY: item.TXN_QTY,
                        DEPT_NAME: item.DEPT_NAME,
                        DESCRIPTION: item.DESCRIPTION,
                        ITEM_SOURCE_ID: item.ITEM_SOURCE_ID,
                        ITEM_SOURCE_TYPE: item.ITEM_SOURCE_TYPE,
                        ITEM_DOC_NAME: item.ITEM_DOC_NAME,
                        SOURCE_RECORD_COUNT: item.SOURCE_RECORD_COUNT,
                        PROJECT_YN: item.PROJECT_YN,
                        CS_CODE: item.CS_CODE,
                        PO_LINE_NO: item.PO_LINE_NO,
                        CREDIT_AREA: item.CREDIT_AREA,
                        SALES_PERSON: item.SALES_PERSON,
                        CURRENCY_CODE: item.CURRENCY_CODE,
                        EXCHANGE_TYPE: item.EXCHANGE_TYPE,
                        EXCHANGE_RATE: item.EXCHANGE_RATE,
                        BASE_SCALE: item.BASE_SCALE,
                        WITHHOLD_FLAG: item.WITHHOLD_FLAG,
                        WITHHOLD_TAX_TYPE: item.WITHHOLD_TAX_TYPE,
                        WITHHOLD_CS_CODE: item.WITHHOLD_CS_CODE,
                        WITHHOLD_TAX_TYPE2: item.WITHHOLD_TAX_TYPE2,
                        WITHHOLD_CS_CODE2: item.WITHHOLD_CS_CODE2,
                        PAY_TERM_CODE: item.PAY_TERM_CODE,
                        EXPECTED_PAY_DATE: item.EXPECTED_PAY_DATE,
                        PAY_METHOD: item.PAY_METHOD,
                        VOUCHER_TYPE: item.VOUCHER_TYPE,
                        VOUCHER_NO: item.VOUCHER_NO,
                        VOUCHER_NO1: item.VOUCHER_NO1,
                        VOUCHER_RECEIPT_DATE: item.VOUCHER_RECEIPT_DATE,
                        FI_ORG_CODE: item.FI_ORG_CODE,
                        SITE_CODE: item.SITE_CODE,
                        APPLY_COMPLETE_DATE: item.APPLY_COMPLETE_DATE,
                        APPLY_COMPLETE_FLAG: item.APPLY_COMPLETE_FLAG,
                        SALES_CS_CODE: item.SALES_CS_CODE,
                        ETAX_TYPE: item.ETAX_TYPE,
                        AFTER_DUE_DATE_YN: item.AFTER_DUE_DATE_YN,
                        DUP_ISSUE_BILL_TYPE: item.DUP_ISSUE_BILL_TYPE,
                        EXCLUDE_REVENUE_AMT_YN: item.EXCLUDE_REVENUE_AMT_YN,
                        CARD_USE_TYPE: item.CARD_USE_TYPE,
                        CARD_NUM: item.CARD_NUM,
                        VAT_NOT_DEDUCTION_TYPE: item.VAT_NOT_DEDUCTION_TYPE,
                        REPORT_OMIT_YN: item.REPORT_OMIT_YN,
                        STANDARD_DATE: item.STANDARD_DATE,
                        VAT_ASSET_TYPE: item.VAT_ASSET_TYPE,
                        SUPPLY_AMT: item.SUPPLY_AMT,
                        VAT_AMT: item.VAT_AMT,
                        ZERO_REPORT_YN: item.ZERO_REPORT_YN,
                        LOCAL_CREDIT_TYPE: item.LOCAL_CREDIT_TYPE,
                        DOCUMENT_NAME: item.DOCUMENT_NAME,
                        ISSUE_NAME: item.ISSUE_NAME,
                        DOCUMENT_ISSUE_DATE: item.DOCUMENT_ISSUE_DATE,
                        EXPORT_LICENSE_NO: item.EXPORT_LICENSE_NO,
                        SHIPPING_DATE: item.SHIPPING_DATE,
                        EXPORT_AMT: item.EXPORT_AMT,
                        EXPORT_AMT_KRW: item.EXPORT_AMT_KRW,
                        VAT_EXPORT_AMT: item.VAT_EXPORT_AMT,
                        VAT_EXPORT_AMT_KRW: item.VAT_EXPORT_AMT_KRW,
                        FOREIGN_AMT: item.FOREIGN_AMT,
                        WON_AMT: item.WON_AMT,
                        DOCUMENT_NO: item.DOCUMENT_NO,
                        ZERO_TYPE: item.ZERO_TYPE,
                        HOLD_FLAG: item.HOLD_FLAG,
                        RELEASE_DATE: item.RELEASE_DATE,
                        RELEASE_USER: item.RELEASE_USER,
                        HOLD_DATE: item.HOLD_DATE,
                        HOLD_USER: item.HOLD_USER,
                        HOLD_REASON: item.HOLD_REASON,
                        PAY_BASE_DATE: item.PAY_BASE_DATE,
                        BILL_DUE_DATE: item.BILL_DUE_DATE,
                        BILL_DUE_DAY: item.BILL_DUE_DAY,
                        BILL_DUE_PAY_DATE: item.BILL_DUE_PAY_DATE,
                        PAY_TERM_ORIG: item.PAY_TERM_ORIG,
                        PROD_GROUP: item.PROD_GROUP,
                        BANK_ACCOUNT_SEQ: item.BANK_ACCOUNT_SEQ,
                        MATL_NO: item.MATL_NO,
                        PROD_ORDER_NO: item.PROD_ORDER_NO,
                        SALES_NO: item.SALES_NO,
                        ORDER_NO: item.ORDER_NO,
                        NONDED_YN: item.NONDED_YN,
                        REG_NO: item.REG_NO,
                    }

                    jsonAccountLineList.push(msg);
                });

                if (gfn_nvl(SBUxMethod.get("DOC_NAME")) != "") {
                    $("#main-btn-attach").removeAttr("disabled");
                    gvwWFItem.clickRow(1);
                    fn_summary();
                } else {
                    jsonAccountLineList.length = 0;
                    gvwWFItem.rebuild();
                    fn_create();
                }
                gvwWFItem.rebuild();

                gfnma_multiSelectSet('#RULE_CODE', '', '', '');
                $("#RULE_CODE").attr('disabled', 'true');
            } else {
                alert(listData.resultMessage);
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_searchRule = async function () {
        let RULE_CODE = gfn_nvl(gfnma_multiSelectGet('#RULE_CODE'))
        let DOC_BATCH_NO = gfn_nvl(SBUxMethod.get("DOC_BATCH_NO"));

        let strWorkType = "RULE";

        if (RULE_CODE == "" && strWorkType == "RULE") {
            strWorkType = "DEFAULTRULE";
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: '',
            V_P_LANG_ID: '',
            V_P_COMP_CODE: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
            IV_P_DOC_BATCH_NO: DOC_BATCH_NO,
            V_P_DOC_NUM: 0,
            V_P_DOC_ID: 0,
            V_P_DOC_DATE: '',
            V_P_CURRENCY_CODE: '',
            V_P_PAY_METHOD: (strWorkType == "DEFAULTRULE") ? gfn_nvl(SBUxMethod.get('PAY_TERM_CODE')) : "",
            V_P_CS_CODE: (strWorkType == "DEFAULTRULE") ?  gfn_nvl(SBUxMethod.get('CS_CODE')) : "",
            V_P_RULE_CODE: (strWorkType == "DEFAULTRULE") ? gfn_nvl(SBUxMethod.get('DOC_TYPE')) : RULE_CODE,
            V_P_SOURCE_TYPE: strsourceType,
            V_P_FORM_ID: p_formId,
            V_P_MENU_ID: p_menuId,
            V_P_PROC_ID: '',
            V_P_USERID: '',
            V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/fi/far/rec/selectFig3510List.do", {
            getType: 'json',
            workType: strWorkType,
            cv_count: '10',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                var formData = data.cv_9[0];

                SBUxMethod.set('KEY_ID', formData.KEY_ID);
                SBUxMethod.set('DOC_TYPE', formData.DOC_TYPE);
                SBUxMethod.set('DOC_TYPE_NAME', formData.DOC_TYPE_NAME);
                gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', gfn_nvl(formData.CURRENCY_CODE));
                SBUxMethod.set('MEMO', formData.MEMO);
                SBUxMethod.set('ACCT_RULE_CODE', formData.ACCT_RULE_CODE);
                SBUxMethod.set('HEADER_COST_CENTER', formData.HEADER_COST_CENTER);

                if (strWorkType == "DEFAULTRULE") {
                    await fn_defaultRuleSet(data.cv_10);
                } else {
                    await fn_ruleSet(data.cv_9, data.cv_10);
                }
            } else {
                alert(data.resultMessage);
            }
        } catch (e) {
            console.log(e);
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_noCommitYN = async function() {
        let bNoCommitRow = false;

        if (editType != "Q")
            bNoCommitRow = true;
        if (!bNoCommitRow) {
            var accountLineList = gvwWFItem.getUpdateData(true, 'all');
            // TODO 필수값 체크 필요
            if (accountLineList.length > 0)   // TODO 필수값을 입력 안한 경우
                bNoCommitRow = true;
        }

        if (bNoCommitRow)
            gfn_comAlert("E0000", "저장되지 않은 DATA 가 있습니다. 저장 후 작업해주세요.");

        return bNoCommitRow;
    }

    // 세금계산서발행
    const fn_createInvoice = async function () {
        let ACCT_RULE_CODE = gfn_nvl(SBUxMethod.get("ACCT_RULE_CODE"));
        let DOC_ID = gfn_nvl(SBUxMethod.get("DOC_ID"));

        if (DOC_ID == "")
            return;

        if (fn_noCommitYN())
            return;

        //저장할 건이 없을시
        var paramObj = {
            V_P_DEBUG_MODE_YN: '',
            V_P_LANG_ID: '',
            V_P_COMP_CODE: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
            V_P_FI_ORG_CODE : p_fiOrgCode,
            V_P_ACCT_RULE_CODE : ACCT_RULE_CODE,
            V_P_DOC_ID : DOC_ID,
            V_P_FORM_ID: p_formId,
            V_P_MENU_ID: p_menuId,
            V_P_PROC_ID: '',
            V_P_USERID: '',
            V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3510Sub.do", {
            getType: 'json',
            workType: 'CREATE',
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

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
    }

    // 발행취소
    const fn_cancelInvoice = async function () {
        let ACCT_RULE_CODE = gfn_nvl(SBUxMethod.get("ACCT_RULE_CODE"));
        let DOC_ID = gfn_nvl(SBUxMethod.get("DOC_ID"));

        var paramObj = {
            V_P_DEBUG_MODE_YN: '',
            V_P_LANG_ID: '',
            V_P_COMP_CODE: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
            V_P_FI_ORG_CODE : p_fiOrgCode,
            V_P_ACCT_RULE_CODE : ACCT_RULE_CODE,
            V_P_DOC_ID : DOC_ID,
            V_P_FORM_ID: p_formId,
            V_P_MENU_ID: p_menuId,
            V_P_PROC_ID: '',
            V_P_USERID: '',
            V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/fi/far/rec/insertFig3510Sub.do", {
            getType: 'json',
            workType: 'CANCEL',
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

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
    }

    // SCM정보
    const fn_scmInfo = async function () {
        // TODO : SCM 정보(FIG2260) 버튼 개발 목록에 없어 삭제처리
    }

    // 전표복사
    const fn_docCopy = async function () {
        $("#btnCreateLine").removeAttr("disabled");
        $("#btnAddRow").removeAttr("disabled");
        $("#main-btn-attach").attr("disabled", "true");
        $("#main-btn-appr").attr("disabled", "true");

        strCurrntDate = gfn_dateToYmd(new Date());

        SBUxMethod.set('DOC_ID', 0);
        gfnma_multiSelectSet('#DOC_STATUS', 'SUB_CODE', 'CODE_NAME', "1");
        SBUxMethod.set('DOC_BATCH_NO', "");
        SBUxMethod.set('DOC_NAME', "");
        SBUxMethod.set('DOC_NUM', "1");
        SBUxMethod.set('APPROVE_DATE', "");
        SBUxMethod.set('FINAL_APPROVER', "");
        SBUxMethod.set('POSTING_DATE', "");
        SBUxMethod.set('POSTING_USER', "");
        SBUxMethod.set('RELEASE_DATE', "");
        SBUxMethod.set('UNPOSTING_USER', "");

        SBUxMethod.set('DOC_DATE', strCurrntDate);

        bnew = true;
        fn_payTermCodeOnchange(gfn_nvl(SBUxMethod.get('PAY_TERM_CODE')));

        // 20181004 LJE  복사시 APPLY FLAG CLEAR
        if (jsonAccountLineList.length != 0) {
            for (var i = 0; i < jsonAccountLineList.length; i++) {
                gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("APPLY_COMPLETE_DATE"), "", true, true);
                gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("APPLY_COMPLETE_FLAG"), "", true, true);
                gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("RELEASE_USER"), "", true, true);
                gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("RELEASE_DATE"), "", true, true);
            }
        }
    }

    const fn_getExpectedPayDate = async function (strpay_term_code, strtxn_date) {
        var retrunData;

        var paramObj = {
            V_P_DEBUG_MODE_YN: '',
            V_P_LANG_ID: '',
            V_P_COMP_CODE: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
            V_P_PAY_TERM_CODE : strpay_term_code,
            V_P_TXN_DATE : strtxn_date,
            V_P_OUTPUT_TYPE : '',
            V_P_BASE_CALC_TYPE : '',
            V_P_FORM_ID: p_formId,
            V_P_MENU_ID: p_menuId,
            V_P_PROC_ID: '',
            V_P_USERID: '',
            V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/fi/far/rec/getExpectedPayDate.do", {
            getType: 'json',
            workType: 'Q2',
            cv_count: '1',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                retrunData = data.cv_1[0];

                return retrunData;
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

    const fn_setExpectedPayDateReadOnly = async function () {
        let ht = await fn_getExpectedPayDate(gfn_nvl(SBUxMethod.get('PAY_TERM_CODE')), gfn_nvl(SBUxMethod.get('DOC_DATE')));

        if (ht) {
            if (ht.hasOwnProperty("EXPECTED_PAY_DATE")) {
                if (gfn_nvl(SBUxMethod.get('BASIS_TYPE')) != "5") {
                    SBUxMethod.attr("EXPECTED_PAY_DATE", "readonly", "true");
                } else if (gfn_nvl(SBUxMethod.get('BASIS_TYPE')) == "5") {
                    SBUxMethod.attr("EXPECTED_PAY_DATE", "readonly", "false");
                }
            }
        }

        if (gfn_nvl(SBUxMethod.get('BASIS_TYPE')) != "5") {
            SBUxMethod.attr("EXPECTED_PAY_DATE", "readonly", "false");
            SBUxMethod.attr("PAY_BASE_DATE", "readonly", "false");
            SBUxMethod.set("PAY_BASE_DATE", SBUxMethod.get("DOC_DATE"));
        } else {
            SBUxMethod.attr("EXPECTED_PAY_DATE", "readonly", "true");
            SBUxMethod.attr("PAY_BASE_DATE", "readonly", "true");
        }

        if (!bnew)
            return;

        if (gfn_nvl(SBUxMethod.get('BASIS_TYPE')) == "5") {
            SBUxMethod.set("PAY_BASE_DATE", SBUxMethod.get("DOC_DATE"));
            SBUxMethod.set("EXPECTED_PAY_DATE", "");
            SBUxMethod.attr("EXPECTED_PAY_DATE", "readonly", "false");
            SBUxMethod.set("DIFF_DAY", 0);
        } else {
            SBUxMethod.set("PAY_BASE_DATE", ht.hasOwnProperty("PAY_BASE_DATE") ? (ht["PAY_BASE_DATE"] != "" ? ht["PAY_BASE_DATE"] : "") : "");
            SBUxMethod.set("EXPECTED_PAY_DATE", ht.hasOwnProperty("EXPECTED_PAY_DATE") ? (ht["EXPECTED_PAY_DATE"] != "" ? ht["EXPECTED_PAY_DATE"] : "") : "");
            SBUxMethod.set("BILL_DUE_DATE", ht.hasOwnProperty("BILL_DUE_DATE") ? (ht["BILL_DUE_DATE"] != "" ? ht["BILL_DUE_DATE"] : "") : "");
            SBUxMethod.set("BILL_DUE_DAY", ht.hasOwnProperty("BILL_DUE_DAY") ? (ht["BILL_DUE_DAY"] != "" ? ht["BILL_DUE_DAY"] : "") : "");
            SBUxMethod.set("BILL_DUE_PAY_DATE", ht.hasOwnProperty("BILL_DUE_PAY_DATE") ? (ht["BILL_DUE_PAY_DATE"] != "" ? ht["BILL_DUE_PAY_DATE"] : "") : "");
            SBUxMethod.attr("EXPECTED_PAY_DATE", "readonly", "true");

            // 지급만기일 - 지급기산일 = 일수
            SBUxMethod.set("DIFF_DAY", Number(gfn_diffDate((gfn_nvl(SBUxMethod.get("PAY_BASE_DATE")) == "" ? SBUxMethod.get("DOC_DATE") : SBUxMethod.get("PAY_BASE_DATE")), (SBUxMethod.get("EXPECTED_PAY_DATE"))) / (1000 * 60 * 60 * 24)));
        }
    }

    const fn_payTermCodeOnchange = async function (data) {
        if (data == "" || gfn_nvl(SBUxMethod.get('DOC_DATE')) == "" || data.length != 4)
            return;

        fn_setExpectedPayDateReadOnly();
    }

    const fn_ruleSet = async function (ms, rs) {
        if (ms.length > 0 && Object.keys(ms[0]).length > 0) {

            let strcurrent_date = gfn_dateToYmd(new Date());

            fn_create();

            SBUxMethod.set("ACCT_RULE_CODE", p_defaultAcctRule);
            SBUxMethod.set("KEY_ID", ms[0]["KEY_ID"]);
            SBUxMethod.set("SRCH_DOC_H_FI_ORG_CODE", p_fiOrgCode);
            SBUxMethod.set("SRCH_SITE_CODE", p_siteCode);
            gfnma_multiSelectSet('#DOC_STATUS', 'SUB_CODE', 'CODE_NAME', "1");
            SBUxMethod.set("DOC_DATE", strcurrent_date);
            SBUxMethod.set('DOC_NUM', "1");
            gfnma_multiSelectSet('#PAYEE_CODE', 'USER_ID', 'USER_NAME', p_userId);
            SBUxMethod.set('EXPECTED_PAY_DATE', strcurrent_date);
            SBUxMethod.set('INSERT_USERID', p_userId);
            SBUxMethod.set('DESCRIPTION', gfn_nvl(ms[0]["MEMO"]));
            SBUxMethod.set('DEPT_CODE', p_deptCode);
            SBUxMethod.set('DEPT_NAME', p_deptName);
            SBUxMethod.set('DOC_TYPE', gfn_nvl(ms[0]["DOC_TYPE"]));
            gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', gfn_nvl(ms[0]["CURRENCY_CODE"]));
            SBUxMethod.set('DESCRIPTION', gfn_nvl(ms[0]["MEMO"]));

            jsonAccountLineList.length = 0;
            rs.forEach((item, index) => {
                var msg = {
                    KEY_ID : item.KEY_ID,
                    ITEM_SEQ : item.ITEM_SEQ,
                    LINE_TYPE : item.LINE_TYPE,
                    ACCOUNT_CODE : item.ACCOUNT_CODE,
                    ACCOUNT_NAME : item.ACCOUNT_NAME,
                    ORIGINAL_AMT : item.ORIGINAL_AMT,
                    FUNCTIONAL_AMT : item.FUNCTIONAL_AMT,
                    DEBIT_CREDIT : item.DEBIT_CREDIT,
                    ACC_ITEM_CODE1 : item.ACC_ITEM_CODE1,
                    ACC_ITEM_CODE2 : item.ACC_ITEM_CODE2,
                    ACC_ITEM_CODE3 : item.ACC_ITEM_CODE3,
                    ACC_ITEM_CODE4 : item.ACC_ITEM_CODE4,
                    ACC_ITEM_CODE5 : item.ACC_ITEM_CODE5,
                    ACC_ITEM_CODE6 : item.ACC_ITEM_CODE6,
                    ACC_ITEM_CODE7 : item.ACC_ITEM_CODE7,
                    ACC_ITEM_CODE8 : item.ACC_ITEM_CODE8,
                    ACC_ITEM_CODE9 : item.ACC_ITEM_CODE9,
                    ACC_ITEM_CODE10 : item.ACC_ITEM_CODE10,
                    ACC_ITEM_NAME1 : item.ACC_ITEM_NAME1,
                    ACC_ITEM_NAME2 : item.ACC_ITEM_NAME2,
                    ACC_ITEM_NAME3 : item.ACC_ITEM_NAME3,
                    ACC_ITEM_NAME4 : item.ACC_ITEM_NAME4,
                    ACC_ITEM_NAME5 : item.ACC_ITEM_NAME5,
                    ACC_ITEM_NAME6 : item.ACC_ITEM_NAME6,
                    ACC_ITEM_NAME7 : item.ACC_ITEM_NAME7,
                    ACC_ITEM_NAME8 : item.ACC_ITEM_NAME8,
                    ACC_ITEM_NAME9 : item.ACC_ITEM_NAME9,
                    ACC_ITEM_NAME10 : item.ACC_ITEM_NAME10,
                    ACC_ITEM_YN1 : item.ACC_ITEM_YN1,
                    ACC_ITEM_YN2 : item.ACC_ITEM_YN2,
                    ACC_ITEM_YN3 : item.ACC_ITEM_YN3,
                    ACC_ITEM_YN4 : item.ACC_ITEM_YN4,
                    ACC_ITEM_YN5 : item.ACC_ITEM_YN5,
                    ACC_ITEM_YN6 : item.ACC_ITEM_YN6,
                    ACC_ITEM_YN7 : item.ACC_ITEM_YN7,
                    ACC_ITEM_YN8 : item.ACC_ITEM_YN8,
                    ACC_ITEM_YN9 : item.ACC_ITEM_YN9,
                    ACC_ITEM_YN10 : item.ACC_ITEM_YN10,
                    DATA_TYPE1 : item.DATA_TYPE1,
                    DATA_TYPE2 : item.DATA_TYPE2,
                    DATA_TYPE3 : item.DATA_TYPE3,
                    DATA_TYPE4 : item.DATA_TYPE4,
                    DATA_TYPE5 : item.DATA_TYPE5,
                    DATA_TYPE6 : item.DATA_TYPE6,
                    DATA_TYPE7 : item.DATA_TYPE7,
                    DATA_TYPE8 : item.DATA_TYPE8,
                    DATA_TYPE9 : item.DATA_TYPE9,
                    DATA_TYPE10 : item.DATA_TYPE10,
                    POPUP_ID1 : item.POPUP_ID1,
                    POPUP_ID2 : item.POPUP_ID2,
                    POPUP_ID3 : item.POPUP_ID3,
                    POPUP_ID4 : item.POPUP_ID4,
                    POPUP_ID5 : item.POPUP_ID5,
                    POPUP_ID6 : item.POPUP_ID6,
                    POPUP_ID7 : item.POPUP_ID7,
                    POPUP_ID8 : item.POPUP_ID8,
                    POPUP_ID9 : item.POPUP_ID9,
                    POPUP_ID10 : item.POPUP_ID10,
                    ACC_ITEM_VALUE1 : item.ACC_ITEM_VALUE1,
                    ACC_ITEM_VALUE2 : item.ACC_ITEM_VALUE2,
                    ACC_ITEM_VALUE3 : item.ACC_ITEM_VALUE3,
                    ACC_ITEM_VALUE4 : item.ACC_ITEM_VALUE4,
                    ACC_ITEM_VALUE5 : item.ACC_ITEM_VALUE5,
                    ACC_ITEM_VALUE6 : item.ACC_ITEM_VALUE6,
                    ACC_ITEM_VALUE7 : item.ACC_ITEM_VALUE7,
                    ACC_ITEM_VALUE8 : item.ACC_ITEM_VALUE8,
                    ACC_ITEM_VALUE9 : item.ACC_ITEM_VALUE9,
                    ACC_ITEM_VALUE10 : item.ACC_ITEM_VALUE10,
                    ACC_VALUE_NAME1 : item.ACC_VALUE_NAME1,
                    ACC_VALUE_NAME2 : item.ACC_VALUE_NAME2,
                    ACC_VALUE_NAME3 : item.ACC_VALUE_NAME3,
                    ACC_VALUE_NAME4 : item.ACC_VALUE_NAME4,
                    ACC_VALUE_NAME5 : item.ACC_VALUE_NAME5,
                    ACC_VALUE_NAME6 : item.ACC_VALUE_NAME6,
                    ACC_VALUE_NAME7 : item.ACC_VALUE_NAME7,
                    ACC_VALUE_NAME8 : item.ACC_VALUE_NAME8,
                    ACC_VALUE_NAME9 : item.ACC_VALUE_NAME9,
                    ACC_VALUE_NAME10 : item.ACC_VALUE_NAME10,
                    DEPT_CODE : item.DEPT_CODE,
                    DEPT_NAME : item.DEPT_NAME,
                    COST_CENTER_CODE : item.COST_CENTER_CODE,
                    COST_CENTER_NAME : item.COST_CENTER_NAME,
                    DESCRIPTION : item.DESCRIPTION,
                    VAT_TYPE : item.VAT_TYPE,
                    PROJECT_YN : item.PROJECT_YN,
                    CURRENCY_CODE : item.CURRENCY_CODE,
                    BASE_SCALE : item.BASE_SCALE,
                    EXCHANGE_RATE : item.EXCHANGE_RATE,
                    CS_CODE : item.CS_CODE,
                    PO_LINE_NO : item.PO_LINE_NO,
                    CREDIT_AREA : item.CREDIT_AREA,
                    SALES_PERSON : item.SALES_PERSON,
                    EXCHANGE_TYPE : item.EXCHANGE_TYPE,
                    WITHHOLD_FLAG : item.WITHHOLD_FLAG,
                    WITHHOLD_TAX_TYPE : item.WITHHOLD_TAX_TYPE,
                    WITHHOLD_CS_CODE : item.WITHHOLD_CS_CODE,
                    WITHHOLD_TAX_TYPE2 : item.WITHHOLD_TAX_TYPE2,
                    WITHHOLD_CS_CODE2 : item.WITHHOLD_CS_CODE2,
                    PAY_TERM_CODE : item.PAY_TERM_CODE,
                    EXPECTED_PAY_DATE : item.EXPECTED_PAY_DATE,
                    BASIS_TYPE : item.BASIS_TYPE,
                    PAY_METHOD : item.PAY_METHOD,
                    VOUCHER_TYPE : item.VOUCHER_TYPE,
                    VOUCHER_NO : item.VOUCHER_NO,
                    VOUCHER_NO1 : item.VOUCHER_NO1,
                    VOUCHER_RECEIPT_DATE : item.VOUCHER_RECEIPT_DATE,
                    FI_ORG_CODE : item.FI_ORG_CODE,
                    SITE_CODE : item.SITE_CODE,
                    APPLY_COMPLETE_DATE : item.APPLY_COMPLETE_DATE,
                    APPLY_COMPLETE_FLAG : item.APPLY_COMPLETE_FLAG,
                    SALES_CS_CODE : item.SALES_CS_CODE,
                    ETAX_TYPE : item.ETAX_TYPE,
                    AFTER_DUE_DATE_YN : item.AFTER_DUE_DATE_YN,
                    DUP_ISSUE_BILL_TYPE : item.DUP_ISSUE_BILL_TYPE,
                    EXCLUDE_REVENUE_AMT_YN : item.EXCLUDE_REVENUE_AMT_YN,
                    CARD_USE_TYPE : item.CARD_USE_TYPE,
                    CARD_NUM : item.CARD_NUM,
                    VAT_NOT_DEDUCTION_TYPE : item.VAT_NOT_DEDUCTION_TYPE,
                    REPORT_OMIT_YN : item.REPORT_OMIT_YN,
                    VAT_ASSET_TYPE : item.VAT_ASSET_TYPE,
                    STANDARD_DATE : item.STANDARD_DATE,
                    SUPPLY_AMT : item.SUPPLY_AMT,
                    ZERO_REPORT_YN : item.ZERO_REPORT_YN,
                    LOCAL_CREDIT_TYPE : item.LOCAL_CREDIT_TYPE,
                    DOCUMENT_NAME : item.DOCUMENT_NAME,
                    ISSUE_NAME : item.ISSUE_NAME,
                    DOCUMENT_ISSUE_DATE : item.DOCUMENT_ISSUE_DATE,
                    EXPORT_LICENSE_NO : item.EXPORT_LICENSE_NO,
                    SHIPPING_DATE : item.SHIPPING_DATE,
                    EXPORT_AMT : item.EXPORT_AMT,
                    EXPORT_AMT_KRW : item.EXPORT_AMT_KRW,
                    VAT_EXPORT_AMT : item.VAT_EXPORT_AMT,
                    VAT_EXPORT_AMT_KRW : item.VAT_EXPORT_AMT_KRW,
                    FOREIGN_AMT : item.FOREIGN_AMT,
                    WON_AMT : item.WON_AMT,
                    DOCUMENT_NO : item.DOCUMENT_NO,
                    ZERO_TYPE : item.ZERO_TYPE,
                    HOLD_FLAG : item.HOLD_FLAG,
                    RELEASE_DATE : item.RELEASE_DATE,
                    RELEASE_USER : item.RELEASE_USER,
                    HOLD_DATE : item.HOLD_DATE,
                    HOLD_USER : item.HOLD_USER,
                    HOLD_REASON : item.HOLD_REASON,
                    PAY_BASE_DATE : item.PAY_BASE_DATE,
                    BILL_DUE_DATE : item.BILL_DUE_DATE,
                    BILL_DUE_DAY : item.BILL_DUE_DAY,
                    BILL_DUE_PAY_DATE : item.BILL_DUE_PAY_DATE,
                    PAY_TERM_ORIG : item.PAY_TERM_ORIG,
                    PROD_GROUP : item.PROD_GROUP,
                    BANK_ACCOUNT_SEQ : item.BANK_ACCOUNT_SEQ,
                }

                jsonAccountLineList.push(msg);
            });

            gvwWFItem.rebuild();

            gvwWFItem.clickRow(1);

            $("#main-btn-save").removeAttr('disabled');
        }
    }

    const fn_defaultRuleSet = async function (rs) {
        if (rs.length > 0 && Object.keys(rs[0]).length > 0) {
            for(var i = 0; i < rs.length; i++) {
                gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("CURRENCY_CODE"), gfn_nvl(gfnma_multiSelectGet('#CURRENCY_CODE')));
                gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("BASE_SCALE"), SBUxMethod.get("BASE_SCALE"));
                gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("SITE_CODE"), SBUxMethod.get("SRCH_SITE_CODE"));
                gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("DEPT_CODE"), SBUxMethod.get("DEPT_CODE"));
                gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("DEPT_NAME"), SBUxMethod.get("DEPT_NAME"));
                gvwWFItem.setRowStatus((i+1), 1);
            }
            gvwWFItem.clickRow(1);

            $("#main-btn-save").removeAttr("disabled");
        }

    }

    const fn_exchageUpdate = async function () {
        for (var i = 0; i < jsonAccountLineList.length; i++) {
            gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("CURRENCY_CODE"), gfn_nvl(gfnma_multiSelectGet('#CURRENCY_CODE')), true, true);
            gvwWFItem.setCellData((i+1), gvwWFItem.getColRef("FUNCTIONAL_AMT"), Math.round(Number(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ORIGINAL_AMT"))) * Number(SBUxMethod.get("EXCHANGE_RATE")) / Number(SBUxMethod.get("BASE_SCALE")), p_currUnit), true, true);

            fn_summary();
        }
    }

    const fn_createLine = async function () {
        if (!SBUxMethod.validateRequired( {group_id: 'panWFTop'} ) || !validateRequired("panWFTop"))
            return;

        if (gfn_nvl(SBUxMethod.get("STEEL_SCRAP_PAY_YN")) != "Y" && gfn_nvl(gfnma_multiSelectGet('#VAT_CODE')) == "AG") {
            gfn_comAlert("E0000", "철스크랩부가세는 철스크랩거래처만 가능합니다.");
            return;
        }

        let dcmvat_rate = 0;
        let dcmlimit_plus_rate = 0;
        let dcmlimit_minus_rate = 0;

        let dcmlimit_plus_amt = 0;
        let dcmlimit_minus_amt = 0;

        if(gfn_nvl(gfnma_multiSelectGet('#VAT_CODE')) == "") return false;

        let vatInfo = jsonVatCode.filter(data => data["VAT_CODE"] == gfn_nvl(gfnma_multiSelectGet('#VAT_CODE')))[0];
        dcmvat_rate = Number(gfn_nvl(vatInfo.VAT_RATE) == "" ? "0" : gfn_nvl(vatInfo.VAT_RATE));

        dcmlimit_plus_rate = Number(gfn_nvl(vatInfo.LIMIT_PLUS_RATE) == "" ? "0" : gfn_nvl(vatInfo.LIMIT_PLUS_RATE));
        dcmlimit_minus_rate = Number(gfn_nvl(vatInfo.LIMIT_MINUS_RATE) == "" ? "0" : gfn_nvl(vatInfo.LIMIT_MINUS_RATE));

        dcmlimit_plus_amt = Number(gfn_nvl(SBUxMethod.get("SUPPLY_AMT"))) * (dcmvat_rate / 100) * (1 + (dcmlimit_plus_rate / 100));
        dcmlimit_minus_amt = Number(gfn_nvl(SBUxMethod.get("SUPPLY_AMT"))) * (dcmvat_rate / 100) * (1 - (dcmlimit_minus_rate / 100));

        if (Number(gfn_nvl(SBUxMethod.get("VAT_AMOUNT"))) > dcmlimit_plus_amt || Number(gfn_nvl(SBUxMethod.get("VAT_AMOUNT"))) < dcmlimit_minus_amt) {
            if (!gfn_comConfirm("Q0000", "부가세 상하한 비율을 벗어납니다. 계속 진행하겠습니까?")) {
                return;
            }
        }

        jsonAccountLineList.length = 0;
        gvwWFItem.rebuild();

        let DOC_ID = gfn_nvl(SBUxMethod.get("KEY_ID"));
        let DOC_TYPE = gfn_nvl(SBUxMethod.get("DOC_TYPE"));
        let CS_CODE = gfn_nvl(SBUxMethod.get("CS_CODE"));
        let CURRENCY_CODE = gfn_nvl(gfnma_multiSelectGet('#CURRENCY_CODE'));
        let EXCHANGE_RATE = gfn_nvl(SBUxMethod.get("EXCHANGE_RATE"));
        let DOC_AMT = Number(SBUxMethod.get("DOC_AMT").replace(/,/gi, ''));
        let SUPPLY_AMT = Number(SBUxMethod.get("SUPPLY_AMT").replace(/,/gi, ''));
        let VAT_AMOUNT = Number(SBUxMethod.get("VAT_AMOUNT").replace(/,/gi, ''));
        let VAT_TYPE = gfn_nvl(gfnma_multiSelectGet('#VAT_CODE'));
        let VOUCHER_TYPE = gfn_nvl(SBUxMethod.get("VOUCHER_TYPE"));
        let APPROVAL_NO = gfn_nvl(SBUxMethod.get("APPROVAL_NO"));
        let STANDARD_DATE = gfn_nvl(SBUxMethod.get("STANDARD_DATE"));
        let DESCRIPTION = gfn_nvl(SBUxMethod.get("DESCRIPTION"));
        let REVERSE_FLAG = gfn_nvl(SBUxMethod.get("CLOSE_YN").CLOSE_YN);


        var paramObj = {
            V_P_DEBUG_MODE_YN: '',
            V_P_LANG_ID: '',
            V_P_COMP_CODE: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
            V_P_DOC_ID : DOC_ID,
            V_P_DOC_TYPE : DOC_TYPE,
            V_P_CS_CODE : CS_CODE,
            V_P_CURRENCY_CODE : CURRENCY_CODE,
            V_P_EXCHANGE_RATE : EXCHANGE_RATE,
            V_P_DOC_AMT : DOC_AMT,
            V_P_SUPPLY_AMT : SUPPLY_AMT,
            V_P_VAT_AMOUNT : VAT_AMOUNT,
            V_P_VAT_TYPE : VAT_TYPE,
            V_P_VOUCHER_TYPE : VOUCHER_TYPE,
            V_P_VOUCHER_NO : APPROVAL_NO,
            V_P_STANDARD_DATE : STANDARD_DATE,
            V_P_DESCRIPTION : DESCRIPTION,
            V_P_REVERSE_FLAG : REVERSE_FLAG,
            V_P_FORM_ID: p_formId,
            V_P_MENU_ID: p_menuId,
            V_P_PROC_ID: '',
            V_P_USERID: '',
            V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/fi/far/rec/selectFig3510ForLine.do", {
            getType: 'json',
            workType: 'DEFAULTRULE',
            cv_count: '1',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonAccountLineList.length = 0;
                data.cv_1.forEach((item, index) => {
                    var msg = {
                        KEY_ID : item.KEY_ID,
                        ITEM_SEQ : item.ITEM_SEQ,
                        LINE_TYPE : item.LINE_TYPE,
                        ACCOUNT_CODE : item.ACCOUNT_CODE,
                        ACCOUNT_NAME : item.ACCOUNT_NAME,
                        COST_CLASS : item.COST_CLASS,
                        ORIGINAL_AMT : item.ORIGINAL_AMT,
                        FUNCTIONAL_AMT : item.FUNCTIONAL_AMT,
                        SUPPLY_AMOUNT : item.SUPPLY_AMOUNT,
                        DEBIT_CREDIT : item.DEBIT_CREDIT,
                        ACC_ITEM_CODE1 : item.ACC_ITEM_CODE1,
                        ACC_ITEM_CODE2 : item.ACC_ITEM_CODE2,
                        ACC_ITEM_CODE3 : item.ACC_ITEM_CODE3,
                        ACC_ITEM_CODE4 : item.ACC_ITEM_CODE4,
                        ACC_ITEM_CODE5 : item.ACC_ITEM_CODE5,
                        ACC_ITEM_CODE6 : item.ACC_ITEM_CODE6,
                        ACC_ITEM_CODE7 : item.ACC_ITEM_CODE7,
                        ACC_ITEM_CODE8 : item.ACC_ITEM_CODE8,
                        ACC_ITEM_CODE9 : item.ACC_ITEM_CODE9,
                        ACC_ITEM_CODE10 : item.ACC_ITEM_CODE10,
                        ACC_ITEM_NAME1 : item.ACC_ITEM_NAME1,
                        ACC_ITEM_NAME2 : item.ACC_ITEM_NAME2,
                        ACC_ITEM_NAME3 : item.ACC_ITEM_NAME3,
                        ACC_ITEM_NAME4 : item.ACC_ITEM_NAME4,
                        ACC_ITEM_NAME5 : item.ACC_ITEM_NAME5,
                        ACC_ITEM_NAME6 : item.ACC_ITEM_NAME6,
                        ACC_ITEM_NAME7 : item.ACC_ITEM_NAME7,
                        ACC_ITEM_NAME8 : item.ACC_ITEM_NAME8,
                        ACC_ITEM_NAME9 : item.ACC_ITEM_NAME9,
                        ACC_ITEM_NAME10 : item.ACC_ITEM_NAME10,
                        ACC_ITEM_YN1 : item.ACC_ITEM_YN1,
                        ACC_ITEM_YN2 : item.ACC_ITEM_YN2,
                        ACC_ITEM_YN3 : item.ACC_ITEM_YN3,
                        ACC_ITEM_YN4 : item.ACC_ITEM_YN4,
                        ACC_ITEM_YN5 : item.ACC_ITEM_YN5,
                        ACC_ITEM_YN6 : item.ACC_ITEM_YN6,
                        ACC_ITEM_YN7 : item.ACC_ITEM_YN7,
                        ACC_ITEM_YN8 : item.ACC_ITEM_YN8,
                        ACC_ITEM_YN9 : item.ACC_ITEM_YN9,
                        ACC_ITEM_YN10 : item.ACC_ITEM_YN10,
                        DATA_TYPE1 : item.DATA_TYPE1,
                        DATA_TYPE2 : item.DATA_TYPE2,
                        DATA_TYPE3 : item.DATA_TYPE3,
                        DATA_TYPE4 : item.DATA_TYPE4,
                        DATA_TYPE5 : item.DATA_TYPE5,
                        DATA_TYPE6 : item.DATA_TYPE6,
                        DATA_TYPE7 : item.DATA_TYPE7,
                        DATA_TYPE8 : item.DATA_TYPE8,
                        DATA_TYPE9 : item.DATA_TYPE9,
                        DATA_TYPE10 : item.DATA_TYPE10,
                        POPUP_ID1 : item.POPUP_ID1,
                        POPUP_ID2 : item.POPUP_ID2,
                        POPUP_ID3 : item.POPUP_ID3,
                        POPUP_ID4 : item.POPUP_ID4,
                        POPUP_ID5 : item.POPUP_ID5,
                        POPUP_ID6 : item.POPUP_ID6,
                        POPUP_ID7 : item.POPUP_ID7,
                        POPUP_ID8 : item.POPUP_ID8,
                        POPUP_ID9 : item.POPUP_ID9,
                        POPUP_ID10 : item.POPUP_ID10,
                        DEPT_CODE : item.DEPT_CODE,
                        DEPT_NAME : item.DEPT_NAME,
                        COST_CENTER_CODE : item.COST_CENTER_CODE,
                        COST_CENTER_NAME : item.COST_CENTER_NAME,
                        DESCRIPTION : item.DESCRIPTION,
                        VAT_TYPE : item.VAT_TYPE,
                        VAT_NAME : item.VAT_NAME,
                        PROJECT_YN : item.PROJECT_YN,
                        CURRENCY_CODE : item.CURRENCY_CODE,
                        EXCHANGE_RATE : item.EXCHANGE_RATE,
                        BASE_SCALE : item.BASE_SCALE,
                        CS_CODE : item.CS_CODE,
                        PO_LINE_NO : item.PO_LINE_NO,
                        CREDIT_AREA : item.CREDIT_AREA,
                        SALES_PERSON : item.SALES_PERSON,
                        EXCHANGE_TYPE : item.EXCHANGE_TYPE,
                        WITHHOLD_FLAG : item.WITHHOLD_FLAG,
                        WITHHOLD_TAX_TYPE : item.WITHHOLD_TAX_TYPE,
                        WITHHOLD_CS_CODE : item.WITHHOLD_CS_CODE,
                        WITHHOLD_TAX_TYPE2 : item.WITHHOLD_TAX_TYPE2,
                        WITHHOLD_CS_CODE2 : item.WITHHOLD_CS_CODE2,
                        PAY_TERM_CODE : item.PAY_TERM_CODE,
                        EXPECTED_PAY_DATE : item.EXPECTED_PAY_DATE,
                        PAY_METHOD : item.PAY_METHOD,
                        VOUCHER_TYPE : item.VOUCHER_TYPE,
                        VOUCHER_NO : item.VOUCHER_NO,
                        VOUCHER_NO1 : item.VOUCHER_NO1,
                        VOUCHER_RECEIPT_DATE : item.VOUCHER_RECEIPT_DATE,
                        FI_ORG_CODE : item.FI_ORG_CODE,
                        SITE_CODE : item.SITE_CODE,
                        APPLY_COMPLETE_DATE : item.APPLY_COMPLETE_DATE,
                        APPLY_COMPLETE_FLAG : item.APPLY_COMPLETE_FLAG,
                        SALES_CS_CODE : item.SALES_CS_CODE,
                        ETAX_TYPE : item.ETAX_TYPE,
                        AFTER_DUE_DATE_YN : item.AFTER_DUE_DATE_YN,
                        DUP_ISSUE_BILL_TYPE : item.DUP_ISSUE_BILL_TYPE,
                        EXCLUDE_REVENUE_AMT_YN : item.EXCLUDE_REVENUE_AMT_YN,
                        CARD_USE_TYPE : item.CARD_USE_TYPE,
                        CARD_NUM : item.CARD_NUM,
                        VAT_NOT_DEDUCTION_TYPE : item.VAT_NOT_DEDUCTION_TYPE,
                        REPORT_OMIT_YN : item.REPORT_OMIT_YN,
                        VAT_ASSET_TYPE : item.VAT_ASSET_TYPE,
                        STANDARD_DATE : item.STANDARD_DATE,
                        SUPPLY_AMT : item.SUPPLY_AMT,
                        VAT_AMT : item.VAT_AMT,
                        ZERO_REPORT_YN : item.ZERO_REPORT_YN,
                        LOCAL_CREDIT_TYPE : item.LOCAL_CREDIT_TYPE,
                        DOCUMENT_NAME : item.DOCUMENT_NAME,
                        ISSUE_NAME : item.ISSUE_NAME,
                        DOCUMENT_ISSUE_DATE : item.DOCUMENT_ISSUE_DATE,
                        EXPORT_LICENSE_NO : item.EXPORT_LICENSE_NO,
                        SHIPPING_DATE : item.SHIPPING_DATE,
                        EXPORT_AMT : item.EXPORT_AMT,
                        EXPORT_AMT_KRW : item.EXPORT_AMT_KRW,
                        VAT_EXPORT_AMT : item.VAT_EXPORT_AMT,
                        VAT_EXPORT_AMT_KRW : item.VAT_EXPORT_AMT_KRW,
                        FOREIGN_AMT : item.FOREIGN_AMT,
                        WON_AMT : item.WON_AMT,
                        DOCUMENT_NO : item.DOCUMENT_NO,
                        ZERO_TYPE : item.ZERO_TYPE,
                        HOLD_FLAG : item.HOLD_FLAG,
                        RELEASE_DATE : item.RELEASE_DATE,
                        RELEASE_USER : item.RELEASE_USER,
                        HOLD_DATE : item.HOLD_DATE,
                        HOLD_USER : item.HOLD_USER,
                        HOLD_REASON : item.HOLD_REASON,
                        PAY_BASE_DATE : item.PAY_BASE_DATE,
                        BILL_DUE_DATE : item.BILL_DUE_DATE,
                        BILL_DUE_DAY : item.BILL_DUE_DAY,
                        BILL_DUE_PAY_DATE : item.BILL_DUE_PAY_DATE,
                        PAY_TERM_ORIG : item.PAY_TERM_ORIG,
                        PROD_GROUP : item.PROD_GROUP,
                        BANK_ACCOUNT_SEQ : item.BANK_ACCOUNT_SEQ,
                        MATL_NO : item.MATL_NO,
                        PROD_ORDER_NO : item.PROD_ORDER_NO,
                        ORDER_NO : item.ORDER_NO,
                        SALES_NO : item.SALES_NO,
                        NONDED_YN : item.NONDED_YN,
                    }

                    jsonAccountLineList.push(msg);
                });

                gvwWFItem.rebuild();
                fn_defaultRuleSet(jsonAccountLineList);
                fn_exchageUpdate();
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

    const fn_report = async function (type, formId) {
        // TODO : Report 확인 필요
        /*string strFinishYn = SessionInfo.FinishYn; // SessionInfo.EssReportHome;
        string pcd = "";
        if (cbovoucher_type.ControlValue.ToString() == "A" || cbovoucher_type.ControlValue.ToString() == "B") {
            if (txtsource_type.ControlValue.ToString() == "AP")
            {
                pcd = "P_FIG3100_Q";
            }
            else if (txtsource_type.ControlValue.ToString() == "AR")
            {
                pcd = "P_FIG3300_Q";
            }
        } else if (cbovoucher_type.ControlValue.ToString() == "C") {
            pcd = "P_FIG3180_Q";
        }

        string strUUID = fnP_JASPERREPORTCHECK_S();
        //----------------------------------------------------------------------------------------------파라미터 스트럭쳐지정
        csParamInfo _ParamInfo = WSParamInfo();
        //----------------------------------------------------------------------------------------------파라미터 지정
        _ParamInfo.ParamInfo.Rows.Add(new object[] { 1, "common", "procedure", pcd });
        _ParamInfo.ParamInfo.Rows.Add(new object[] { 2, "common", "workType", strWorkType });
        _ParamInfo.ParamInfo.Rows.Add(new object[] { 3, "common", "cv_count", "3" });
        _ParamInfo.ParamInfo.Rows.Add(new object[] { 4, "common", "getType", SessionInfo.WebContentType });  // "HRI1700_REPORT_WORK"
        _ParamInfo.ParamInfo.Rows.Add(new object[] { 5, "common", "jr_report", strReportType });  // "HRI1700_REPORT_WORK"
        _ParamInfo.ParamInfo.Rows.Add(new object[] { 6, "common", "cm_key", strUUID });  // "cm_key"

        if (strReportType.ToString() == "FIG3100_REPORT") {
            _ParamInfo.ParamData.Rows.Add(new object[] { 1, "params", "v_p_comp_code", SessionInfo.CompCode });
            _ParamInfo.ParamData.Rows.Add(new object[] { 2, "params", "v_p_lang_id", SessionInfo.LanguageID });
            _ParamInfo.ParamData.Rows.Add(new object[] { 3, "params", "v_p_fi_org_code", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 4, "params", "v_p_date_fr", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 5, "params", "v_p_date_to", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 6, "params", "v_p_cs_biz_regno", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 7, "params", "v_p_approval_no", txtvoucher_no.ControlValue.ToString() });
            _ParamInfo.ParamData.Rows.Add(new object[] { 8, "params", "v_p_item_taxable_amt", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 9, "params", "v_p_cs_name", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 10, "params", "v_p_dept_code", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 11, "params", "v_p_emp_code", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 12, "params", "v_p_gubun", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 13, "params", "v_p_userid", SessionInfo.UserID });
            _ParamInfo.ParamData.Rows.Add(new object[] { 14, "params", "v_p_pc", GetClientPCName() + "/" + GetIPAddress() });
        } else if (strReportType.ToString() == "FIG3300_REPORT") {
            _ParamInfo.ParamData.Rows.Add(new object[] { 1, "params", "v_p_comp_code", SessionInfo.CompCode });
            _ParamInfo.ParamData.Rows.Add(new object[] { 2, "params", "v_p_lang_id", SessionInfo.LanguageID });
            _ParamInfo.ParamData.Rows.Add(new object[] { 3, "params", "v_p_fi_org_code", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 4, "params", "v_p_date_fr", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 5, "params", "v_p_date_to", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 6, "params", "v_p_cs_biz_regno", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 7, "params", "v_p_approval_no", txtvoucher_no.ControlValue.ToString() });
            _ParamInfo.ParamData.Rows.Add(new object[] { 8, "params", "v_p_item_taxable_amt", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 9, "params", "v_p_cs_name", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 10, "params", "v_p_emp_code", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 11, "params", "v_p_gubun", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 12, "params", "v_p_userid", SessionInfo.UserID });
            _ParamInfo.ParamData.Rows.Add(new object[] { 13, "params", "v_p_pc", GetClientPCName() + "/" + GetIPAddress() });
        }

        if (strReportType.ToString() == "FIG3180_REPORT") {
            _ParamInfo.ParamData.Rows.Add(new object[] { 1, "params", "v_p_comp_code", SessionInfo.CompCode });
            _ParamInfo.ParamData.Rows.Add(new object[] { 2, "params", "v_p_lang_id", SessionInfo.LanguageID });
            _ParamInfo.ParamData.Rows.Add(new object[] { 3, "params", "v_p_fi_org_code", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 4, "params", "v_p_date_fr", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 5, "params", "v_p_date_to", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 6, "params", "v_p_cs_biz_regno", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 7, "params", "v_p_doc_name", txtdoc_name.ControlValue.ToString() });
            _ParamInfo.ParamData.Rows.Add(new object[] { 8, "params", "v_p_item_taxable_amt", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 9, "params", "v_p_cs_name", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 10, "params", "v_p_dept_code", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 11, "params", "v_p_emp_code", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 12, "params", "v_p_gubun", "" });
            _ParamInfo.ParamData.Rows.Add(new object[] { 13, "params", "v_p_userid", SessionInfo.UserID });
            _ParamInfo.ParamData.Rows.Add(new object[] { 14, "params", "v_p_pc", GetClientPCName() + "/" + GetIPAddress() });
        }

        string strHtml = fnSetParamHtml(_ParamInfo);
        pbStartWebBrowser(strHtml, strFinishYn);*/
    }

    const fn_taxView = async function () {
        if (gfn_nvl(SBUxMethod.get("VOUCHER_TYPE")) == "A" || gfn_nvl(SBUxMethod.get("VOUCHER_TYPE")) == "B") {
            if(gfn_nvl(SBUxMethod.get("VOUCHER_NO")).length > 0) {
                if (gfn_nvl(SBUxMethod.get("SRCH_INVOCE_BATCH_NO")) == "AP") {
                    fn_report("REPORT", "FIG3100_REPORT");
                } else if (gfn_nvl(SBUxMethod.get("SRCH_INVOCE_BATCH_NO")) == "AR") {
                    fn_report("REPORT", "FIG3300_REPORT");
                }
            } else {
                gfn_comAlert("E0000", "증빙번호가 존재하지 않습니다.");
            }
        }
        else if (gfn_nvl(SBUxMethod.get("VOUCHER_TYPE")) == "C") {
            fn_report("REPORT", "FIG3180_REPORT");
        }
    }

    const fn_approval = async function () {
        if (gfn_nvl(SBUxMethod.get("DOC_BATCH_NO")) == "")
            return;

        if (await fn_noCommitYN())
            return;

        let strApprId = gfn_nvl(SBUxMethod.get("APPR_ID"));
        let sourceNo = gfn_nvl(SBUxMethod.get("DOC_ID"));
        let sourceType = gfn_nvl(SBUxMethod.get("DOC_TYPE"));
        let costCenterCode = gfn_nvl(SBUxMethod.get("HEADER_COST_CENTER"));
        let apprStatus = gfn_nvl(gfnma_multiSelectGet('#DOC_STATUS'));

        compopappvmng({
            workType		: strApprId == "0" ? 'TEMPLATE' : 'APPR'	// 상신:TEMPLATE , 승인(반려):APPR
            ,compCode		: gv_ma_selectedCorpCd
            ,compCodeNm		: gv_ma_selectedCorpNm
            ,clientCode		: gv_ma_selectedClntCd
            ,apprId			: strApprId
            ,sourceNo		: sourceNo
            ,sourceType		: sourceType
            ,empCode		: p_empCode
            ,formID			: p_formId
            ,menuId			: p_menuId
            ,costCenterCode : costCenterCode
            ,apprStatus     : apprStatus
            ,callback       : function(data) {
                fn_search(); //조회
            }
        });
    }

    const fn_confimHist = async function () {
        if(gfn_nvl(SBUxMethod.get("APPR_ID")) == "" || gfn_nvl(SBUxMethod.get("APPR_ID")) == "0"){
            gfn_comAlert("E0000","결재정보 생성 후 조회가 가능합니다.");
            return;
        }

        SBUxMethod.attr('modal-compopfim3420', 'header-title', '승인결과조회');
        SBUxMethod.openModal('modal-compopfim3420');

        compopfim3420({
            height			: '600px'
            ,param			: {
                p_appr_id	: gfn_nvl(SBUxMethod.get("APPR_ID"))
                ,p_doc_id	: gfn_nvl(SBUxMethod.get("DOC_ID"))
                ,p_doc_type	: gfn_nvl(SBUxMethod.get("DOC_TYPE"))
            }
        });
    }

    const fn_attach = async function() {
        if (gfn_nvl(SBUxMethod.get("DOC_ID")) == "" || gfn_nvl(SBUxMethod.get("DOC_ID")) == "0") {
            gfn_comAlert("E0000", "전표저장후 파일등록가능합니다.");
            return;
        }

        let strsource_code = gfn_nvl(SBUxMethod.get("DOC_ID"));

        if (strsource_code != "") {
            compopfilemng({
                compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,sourceType		: strFileSourceType
                ,sourceCode		: strsource_code
                ,formID			: p_formId
                ,menuId			: p_menuId
            });
        }
    }
    
    const fn_btnPrint = async function () {
        let DOC_BATCH_NO = gfn_nvl(SBUxMethod.get("DOC_BATCH_NO"));
        if(DOC_BATCH_NO == ''){
        	return;
        }
   		SBUxMethod.attr('modal-comPopFig1000Report', 'header-title', '전표 출력');
   		SBUxMethod.openModal('modal-comPopFig1000Report');
   		comPopFig1000Report({
   			height			: '200px'
   			,width			: '400px'
   			,param			: {
   				P_WORK_TYPE		: "INVOICE"
   				,P_DOC_BATCH_NO	: DOC_BATCH_NO
   				,P_COMP_CODE	: gv_ma_selectedCorpCd
   				,P_CLIENT_CODE	: gv_ma_selectedClntCd
   			}
   		});
    }
</script>