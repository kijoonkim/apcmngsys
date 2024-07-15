<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
            <%--<div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3>
                </div>
            </div>--%>
            <div class="box-body">

                <!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
				<!--[APC] END -->
                <table class="table table-bordered tbl_fixed" style="display: none;">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 10%">
						<col style="width: 10%">
                        <col style="width: 10%">
                        <col style="width: 10%">
                    </colgroup>
                    <tbody>
						<tr>
							<th scope="row" class="th_bg">회계단위</th>
							<td class="td_input" style="border-right:hidden;">
                                <sbux-input id="SRCH_DOC_H_FI_ORG_CODE" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
							</td>
                            <th scope="row" class="th_bg">사업장</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="SRCH_SITE_CODE" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                <sbux-input id="SRCH_CARD_YN" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                                <sbux-input id="SRCH_FROM_DATE" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                                <sbux-input id="SRCH_TO_DATE" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                                <sbux-input id="SRCH_INVOCE_BATCH_NO" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                            </td>
						</tr>
                    </tbody>
                </table>
				<div class="row">
                    <div class="ad_tbl_top">
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
                                <sbux-button class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-compopup1" onclick="fn_findApprovalNo"></sbux-button>
                            </div>
                            <sbux-button id="btnCreateInvoice" name="btnCreateInvoice" uitype="normal" text="세금계산서발행" class="btn btn-sm btn-outline-danger" onclick="fn_createInvoice" style="float: right;"></sbux-button>
                            <sbux-button id="btnCancelInvoice" name="btnCancelInvoice" uitype="normal" text="발행취소" class="btn btn-sm btn-outline-danger" onclick="fn_cancelInvoice" style="float: right;"></sbux-button>
                            <sbux-button id="btnScmInfo" name="btnScmInfo" uitype="normal" text="SCM정보" class="btn btn-sm btn-outline-danger" onclick="fn_scmInfo" style="float: right;"></sbux-button>
                            <sbux-button id="btnDocCopy" name="btnDocCopy" uitype="normal" text="전표복사" class="btn btn-sm btn-outline-danger" onclick="fn_docCopy" style="float: right;"></sbux-button>
                        </div>
                    </div>
                    <div>
                        <table class="table table-bordered tbl_fixed">
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
                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SUB_TAX_SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="DEPT_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                </td>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-button
                                            class="btn btn-xs btn-outline-dark"
                                            text="찾기" uitype="modal"
                                            target-id="modal-compopup1"
                                            onclick="fn_findDeptCode"
                                    ></sbux-button>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">전표유형</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-select id="DOC_TYPE" uitype="single" jsondata-ref="jsonDocType" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PAYEE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="CS_CODE" uitype="text" placeholder="" class="form-control input-sm" onchange="fn_changeCsCode(this)" readonly></sbux-input>
                                </td>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="CS_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                </td>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="BIZ_REGNO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                </td>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-button
                                            class="btn btn-xs btn-outline-dark"
                                            text="찾기" uitype="modal"
                                            target-id="modal-compopup1"
                                            onclick="fn_findCsCode"
                                    ></sbux-button>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg" id="LBL_PAY_TERM_CODE">지급기준</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="PAY_TERM_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                </td>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="PAY_TERM_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                </td>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-button
                                            class="btn btn-xs btn-outline-dark"
                                            text="찾기" uitype="modal"
                                            target-id="modal-compopup1"
                                            onclick="fn_findPayTermCode"
                                    ></sbux-button>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg">증빙번호</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-select id="VOUCHER_TYPE" uitype="single" jsondata-ref="jsonVoucherType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                </td>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="VOUCHER_NO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
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
                                            class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                            style="width:100%;"
                                    />
                                </td>
                                <th scope="row" class="th_bg">신고일자</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-datepicker
                                            uitype="popup"
                                            id="STANDARD_DATE"
                                            name="STANDARD_DATE"
                                            date-format="yyyy-mm-dd"
                                            class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                            style="width:100%;"
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
                                        <div class="dropdown-menu" aria-labelledby="PAY_METHOD" style="width:300px;height:150px;padding-top:0px;overflow:auto">
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
                                            class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                            style="width:100%;"
                                    />
                                </td>
                                <th scope="row" class="th_bg">통화</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <div class="dropdown">
                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="CURRENCY_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <font>선택</font>
                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="CURRENCY_CODE" style="width:250px;height:150px;padding-top:0px;overflow:auto">
                                        </div>
                                    </div>
                                </td>
                                <td colspan="2" class="td_input" style="border-right:hidden;">
                                    <sbux-input id="EXCHANGE_RATE" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                </td>
                                <th scope="row" class="th_bg" id="LBL_PAY_BASE_DATE">지급기산일자</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-datepicker
                                            uitype="popup"
                                            id="PAY_BASE_DATE"
                                            name="PAY_BASE_DATE"
                                            date-format="yyyy-mm-dd"
                                            class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                            style="width:100%;"
                                    />
                                </td>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="DIFF_DAY" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
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
                                            class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                            style="width:100%;"
                                            readonly
                                    />
                                </td>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="FINAL_APPROVER" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">총지급액</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="DOC_AMT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">세금코드</th>
                                <td colspan="2" class="td_input" style="border-right:hidden;">
                                    <div class="dropdown">
                                        <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="VAT_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <font>선택</font>
                                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="VAT_CODE" style="width:600px;height:150px;padding-top:0px;overflow:auto">
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
                                            class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                            style="width:100%;"
                                            onchange="fn_changeExpectedPayDate(EXPECTED_PAY_DATE)"
                                    />
                                </td>
                                <th scope="row" class="th_bg">어음만기일자</th>
                                <td colspan="2" class="td_input" style="border-right:hidden;">
                                    <sbux-datepicker
                                            uitype="popup"
                                            id="BILL_DUE_DATE"
                                            name="BILL_DUE_DATE"
                                            date-format="yyyy-mm-dd"
                                            class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
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
                                            class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
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
                                    <sbux-input id="VAT_AMOUNT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">공급가액</th>
                                <td colspan="2" class="td_input" style="border-right:hidden;">
                                    <sbux-input id="SUPPLY_AMT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
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
                                            class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
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
                                    <sbux-input id="DESCRIPTION" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">계좌비고</th>
                                <td colspan="4" class="td_input" style="border-right:hidden;">
                                    <sbux-input id="BANK_ACCOUNT_DESCRIPTION" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">역분개전표</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="REVERSE_DOC_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                </td>
                                <sbux-input id="WRITE_DATE" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="APPR_COUNT" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="KEY_ID" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="TXN_STOP_REASON" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="APPR_ID" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="DOC_NUM" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="INSERT_USERID" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="HEADER_COST_CENTER" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="OPEN_TO_ALL_YN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="TXN_STOP_YN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="CONFIRM_EMP_CODE" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="REGISTER_YN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="BNKCNT" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="WITHHOLD_TAX_YN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                <sbux-input id="OPEN_TO_FCM_YN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
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
                            <sbux-button id="btnCreateLine" name="btnCreateLine" uitype="normal" text="전표라인생성" class="btn btn-sm btn-outline-danger" onclick="fn_deleteAll" style="float: right;"></sbux-button>
                            <sbux-button id="btnClearMode" name="btnClearMode" uitype="normal" text="복사해제모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('clear')" style="float: right;"></sbux-button>
                            <sbux-button id="btnLineCopyMode" name="btnLineCopyMode" uitype="normal" text="행복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('line')" style="float: right;"></sbux-button>
                            <sbux-button id="btnCellCopyMode" name="btnCellCopyMode" uitype="normal" text="셀복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('cell')" style="float: right;"></sbux-button>

                        </div>
                    </div>
                    <div class="table-responsive tbl_scroll_sm" style="margin-top: 0px;">
                        <div id="sb-area-gvwWFItem" style="height:300px;"></div>
                    </div>
                    <div>
                        <table class="table table-bordered tbl_fixed">
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
                                    <sbux-input id="DR_SUM" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">대변합계</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="CR_SUM" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">차이(통화)</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="DIFF_ORIGIN" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">차이(전표)</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="DIFF_FUNTION" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
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
                                <table class="table table-bordered tbl_fixed">
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
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="ETAX_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                                        id="STANDARD_DATE"
                                                        name="STANDARD_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">공급가액</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="SUPPLY_AMT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">수출신고번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="EXPORT_LICENSE_NO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">당기제출금_외화</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="EXPORT_AMT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">카드용도</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="CARD_USE_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="CARD_USE_TYPE" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row" class="th_bg">카드번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="CARD_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">내국신용장구분</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="LOCAL_CREDIT_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                                        class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">당기제출금_원화</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="EXPORT_AMT_KRW" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">불공제유형</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="VAT_NOT_DEDUCTION_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="REPORT_OMIT_YN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="REPORT_OMIT_YN" style="width:130px;height:80px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row" class="th_bg">서류명</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="DOCUMENT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">수출외화금액</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="FOREIGN_AMT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">당기신고해당분_외화</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="VAT_EXPORT_AMT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">중복발행</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="DUP_ISSUE_BILL_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="VAT_ASSET_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="VAT_ASSET_TYPE" style="width:150px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row" class="th_bg">발급자</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ISSUE_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">수출원화금액</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="WON_AMT" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">당기신고해당분_원화</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="VAT_EXPORT_AMT_KRW" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">11일외전송</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="AFTER_DUE_DATE_YN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="ZERO_REPORT_YN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                                        class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">수입금액제외</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="EXCLUDE_REVENUE_AMT_YN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="ZERO_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="ZERO_TYPE" style="width:200px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row" class="th_bg">내국신용장서류번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="DOCUMENT_NO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="tabPage1">
                                <table class="table table-bordered tbl_fixed">
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
                                        <tr> <%--TODO : P_FIM041--%>
                                            <th scope="row" class="th_bg">관리항목1</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_ITEM_VALUE1" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_VALUE_NAME1" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccItem(1)"
                                                ></sbux-button>
                                            </td>
                                            <th scope="row" class="th_bg">관리항목5</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_ITEM_VALUE5" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_VALUE_NAME5" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccItem(5)"
                                                ></sbux-button>
                                            </td>
                                            <th scope="row" class="th_bg">관리항목9</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_ITEM_VALUE9" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_VALUE_NAME9" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccItem(9)"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">관리항목2</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_ITEM_VALUE2" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_VALUE_NAME2" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccItem(2)"
                                                ></sbux-button>
                                            </td>
                                            <th scope="row" class="th_bg">관리항목6</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_ITEM_VALUE6" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_VALUE_NAME6" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccItem(6)"
                                                ></sbux-button>
                                            </td>
                                            <th scope="row" class="th_bg">관리항목10</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_ITEM_VALUE10" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_VALUE_NAME10" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccItem(10)"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">관리항목3</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_ITEM_VALUE3" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_VALUE_NAME3" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccItem(3)"
                                                ></sbux-button>
                                            </td>
                                            <th scope="row" class="th_bg">관리항목7</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_ITEM_VALUE7" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_VALUE_NAME7" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccItem(7)"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">관리항목4</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_ITEM_VALUE4" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_VALUE_NAME4" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccItem(4)"
                                                ></sbux-button>
                                            </td>
                                            <th scope="row" class="th_bg">관리항목8</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_ITEM_VALUE8" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACC_VALUE_NAME8" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccItem(8)"
                                                ></sbux-button>
                                            </td>
                                            <sbux-input id="DEBIT_CREDIT" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                                            <sbux-input id="ACC_CODE" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                                            <sbux-input id="DESCRIPTION" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                                            <sbux-input id="PROJECT_CODE" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                                            <sbux-input id="PROJECT_NAME" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
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
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var strsourceType = "<%=request.getParameter("sourceType")%>";
    if(strsourceType == "") strsourceType = "AP";
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
    var p_fiDeleteUser =  "${loginVO.maFI_DELETE_USER}";

    var bnew = true;
    var bAllowPrint = false;
    var bfocuschange = false;

    var strCurrntDate;
    var strFileSourceType = "FIGDOCHEADER";
    var strFI_DELETE_USER = "";
    //-----------------------------------------------------------

    var editType			= "Q";
    var copyMode            = "clear";

    var jsonDocType = []; // 전표구분
    var jsonVoucherType = []; // 증빙유형
    var jsonBankCode = []; // 은행코드
    var jsonLineType = []; // 유형
    var jsonDebitCredit = []; // 차/대
    var jsonAccItemCode = []; // 관리항목코드
    var jsonCurrencyCode = []; // 통화코드
    var jsonZeroType = []; // 영세율구분
    var jsonCreditArea = []; // 여신영역

    //grid 초기화
    var gvwWFItem; 			// 그리드를 담기위한 객체 선언

    var jsonAccountLineList = []; 	// 그리드의 참조 데이터 주소 선언

    // Tab Data
    var jsonTabData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "부가세", "targetid" : "tabPage2", "targetvalue" : "부가세" },
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "관리항목", "targetid" : "tabPage1", "targetvalue" : "관리항목" },
    ];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업단위
            gfnma_multiSelectInit({
                target			: ['#TAX_SITE_CODE', '#SUB_TAX_SITE_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_ORG003'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'TAX_SITE_CODE'
                ,colLabel		: 'TAX_SITE_NAME'
                ,columns		:[
                    {caption: "신고사업장코드",		ref: 'TAX_SITE_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "신고사업장명", 		ref: 'TAX_SITE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 전표구분
            gfnma_setComSelect(['DOC_TYPE'], jsonDocType, 'L_FIM051', 'WHERE ' + (strsourceType == "AP" ? "ap_doc_write_yn = 'Y'" : (strsourceType == "BAD"  ? "doc_type like '91%'" : "ar_doc_write_yn = 'Y'")), gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표상태
            gfnma_multiSelectInit({
                target			: ['#DOC_STATUS']
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
            // 사용자
            gfnma_multiSelectInit({
                target			: ['#PAYEE_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_USER'
                ,whereClause	: "AND a.user_id IN (SELECT CASE WHEN b.account_manager_yn = 'Y' THEN a.user_id ELSE b.user_id END FROM sysUserMaster b WHERE b.user_id = '" + p_userId + "')"
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'USER_ID'
                ,colLabel		: 'USER_NAME'
                ,columns		:[
                    {caption: "사용자ID",		ref: 'USER_ID', 			width:'150px',  	style:'text-align:left'},
                    {caption: "사용자명", 		ref: 'USER_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 증빙유형
            gfnma_setComSelect(['VOUCHER_TYPE'], jsonVoucherType, 'L_FIG005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 지급방법
            gfnma_multiSelectInit({
                target			: ['#PAY_METHOD']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIM081'
                ,whereClause	: ''
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
                    {caption: "계좌번호", 		ref: 'ACCOUNT_NUM',    		width:'120px',  	style:'text-align:left'},
                    {caption: "계좌코드", 		ref: 'DEPOSIT_CODE',    		width:'100px',  	style:'text-align:left'}
                ]
            }),
            // 통화
            gfnma_multiSelectInit({
                target			: ['#CURRENCY_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_COM001'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'CURRENCY_CODE'
                ,colLabel		: 'CURRENCY_NAME'
                ,columns		:[
                    {caption: "통화명",		ref: 'CURRENCY_NAME', 			width:'100px',  	style:'text-align:left'},
                    {caption: "비고", 		ref: 'DESCIPTION',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 통화
            gfnma_multiSelectInit({
                target			: ['#VAT_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_VAT_INFO'
                ,whereClause	: "AND a.use_yn = 'Y' AND b.ar_ap_type = '" + strsourceType + "'"
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'VAT_CODE'
                ,colLabel		: 'VAT_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'VAT_CODE', 			width:'30px',  	style:'text-align:left'},
                    {caption: "코드명", 		ref: 'VAT_NAME',    		width:'230px',  	style:'text-align:left'},
                    {caption: "유형코드", 		ref: 'VAT_TYPE_CODE',    		width:'60px',  	style:'text-align:left'},
                    {caption: "유형명", 		ref: 'VAT_TYPE_NAME',    		width:'120px',  	style:'text-align:left'},
                    {caption: "세율", 		ref: 'VAT_RATE',    		width:'50px',  	style:'text-align:left'},
                    {caption: "상한비율", 		ref: 'LIMIT_PLUS_RATE',    		width:'50px',  	style:'text-align:left'},
                    {caption: "하한비율", 		ref: 'LIMIT_MINUS_RATE',    		width:'50px',  	style:'text-align:left'},
                ]
            }),
            // 전표템플릿
            gfnma_multiSelectInit({
                target			: ['#RULE_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_RULE'
                ,whereClause	: (strsourceType == "AP" ? "AND ap_doc_write_yn = 'Y'" : (strsourceType == "BAD" ? "AND doc_type LIKE '91%'" : "AND ar_doc_write_yn = 'Y'"))
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'RULE_CODE'
                ,colLabel		: 'RULE_NAME'
                ,columns		:[
                    {caption: "rule코드",		ref: 'RULE_CODE', 			width:'100px',  	style:'text-align:left'},
                    {caption: "rule코드명", 		ref: 'RULE_NAME',    		width:'300px',  	style:'text-align:left'},
                    {caption: "전표유형", 		ref: 'DOC_TYPE',    		width:'100px',  	style:'text-align:left'},
                    {caption: "AP_DOC_YN", 		ref: 'AP_DOC_YN',    		width:'100px',  	style:'text-align:left'},
                    {caption: "AR_DOC_YN", 		ref: 'AR_DOC_YN',    		width:'100px',  	style:'text-align:left'},
                ]
            }),
            // 은행코드
            gfnma_setComSelect(['BANK_CODE'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 전자발행
            gfnma_multiSelectInit({
                target			: ['#ETAX_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIT005'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "발행구분", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 카드용도구분
            gfnma_multiSelectInit({
                target			: ['#CARD_USE_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIT012'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "카드구분", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 내국신용장구분
            gfnma_multiSelectInit({
                target			: ['#LOCAL_CREDIT_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIT011'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "구분", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 불공제 사유 유형
            gfnma_multiSelectInit({
                target			: ['#VAT_NOT_DEDUCTION_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIT013'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "불공제 사유 유형", 		ref: 'CODE_NAME',    		width:'230px',  	style:'text-align:left'}
                ]
            }),
            // 예정누락여부
            gfnma_multiSelectInit({
                target			: ['#REPORT_OMIT_YN']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIT009'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "해당여부", 		ref: 'CODE_NAME',    		width:'80px',  	style:'text-align:left'}
                ]
            }),
            // 중복발행구분
            gfnma_multiSelectInit({
                target			: ['#DUP_ISSUE_BILL_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIT007'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'up' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "구분", 		ref: 'CODE_NAME',    		width:'50px',  	style:'text-align:left'}
                ]
            }),
            // 감가상각자산유형
            gfnma_multiSelectInit({
                target			: ['#VAT_ASSET_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIT014'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'up' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "자산구분", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'}
                ]
            }),
            // 중복발행구분
            gfnma_multiSelectInit({
                target			: ['#AFTER_DUE_DATE_YN']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIT006'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'up' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "해당여부", 		ref: 'CODE_NAME',    		width:'80px',  	style:'text-align:left'}
                ]
            }),
            // 영세율첨부서류여부
            gfnma_multiSelectInit({
                target			: ['#ZERO_REPORT_YN']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIT019'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'up' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "해당여부", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'}
                ]
            }),
            // 수입금액제외
            gfnma_multiSelectInit({
                target			: ['#EXCLUDE_REVENUE_AMT_YN']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIT008'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'up' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "해당여부", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'}
                ]
            }),
            // 수입금액제외
            gfnma_setComSelect(['gvwWFItem'], jsonZeroType, 'L_FIT010', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#ZERO_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIT010'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'up' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'50px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 계좌정보
            gfnma_multiSelectInit({
                target			: ['#BANK_ACCOUNT_SEQ']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_CS_ACCOUNT'
                ,whereClause	: "AND a.cs_code = '" + gfnma_nvl(SBUxMethod.get("CS_CODE")) + "' AND '" + gfnma_nvl(SBUxMethod.get("EXPECTED_PAY_DATE")) + "' BETWEEN a.effect_start_date AND a.effect_end_date"
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'left' 	// left, right
                ,colValue		: 'BANK_ACCOUNT_SEQ'
                ,colLabel		: 'SEQ_NAME'
                ,columns		:[
                    {caption: "행번",		ref: 'BANK_ACCOUNT_SEQ', 			width:'50px',  	style:'text-align:left'},
                    {caption: "행번명", 		ref: 'SEQ_NAME',    		width:'60px',  	style:'text-align:left'},
                    {caption: "은행코드", 		ref: 'BANK_CODE',    		width:'50px',  	style:'text-align:left'},
                    {caption: "은행명", 		ref: 'BANK_NAME',    		width:'100px',  	style:'text-align:left'},
                    {caption: "계좌번호", 		ref: 'BANK_ACCOUNT_NO',    		width:'130px',  	style:'text-align:left'},
                    {caption: "비고", 		ref: 'DESCRIPTION',    		width:'120px',  	style:'text-align:left'},
                    {caption: "계좌주", 		ref: 'BANK_ACCOUNT_OWNER',    		width:'100px',  	style:'text-align:left'},
                    {caption: "거래처", 		ref: 'CS_CODE',    		width:'100px',  	style:'text-align:left'},
                    {caption: "시작일", 		ref: 'EFFECT_START_DATE',    		width:'100px',  	style:'text-align:left'},
                    {caption: "종료일", 		ref: 'EFFECT_END_DATE',    		width:'100px',  	style:'text-align:left'},
                    {caption: "복수등록", 		ref: 'BNKCNT',    		width:'100px',  	style:'text-align:left'},
                ]
            }),
            // 유형
            gfnma_setComSelect(['gvwWFItem'], jsonLineType, 'L_FIM052', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 차/대
            gfnma_setComSelect(['gvwWFItem'], jsonDebitCredit, 'L_FIG003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 관리항목코드
            gfnma_setComSelect(['gvwWFItem'], jsonAccItemCode, 'P_FIM041', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'ACC_ITEM_VALUE', 'ACC_VALUE_NAME', 'Y', ''),
            // 통화코드
            gfnma_setComSelect(['gvwWFItem'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 여신영역
            gfnma_setComSelect(['gvwWFItem'], jsonCreditArea, 'L_ORG020', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    var fn_getBankAccountSeq = function () {
        // 계좌정보
        gfnma_multiSelectInit({
            target			: ['#BANK_ACCOUNT_SEQ']
            ,compCode		: gv_ma_selectedApcCd
            ,clientCode		: gv_ma_selectedClntCd
            ,bizcompId		: 'L_CS_ACCOUNT'
            ,whereClause	: "AND a.cs_code = '" + gfnma_nvl(SBUxMethod.get("CS_CODE")) + "' AND '" + gfnma_nvl(SBUxMethod.get("EXPECTED_PAY_DATE")) + "' BETWEEN a.effect_start_date AND a.effect_end_date"
            ,formId			: p_formId
            ,menuId			: p_menuId
            ,selectValue	: ''
            ,dropType		: 'down' 	// up, down
            ,dropAlign		: 'left' 	// left, right
            ,colValue		: 'BANK_ACCOUNT_SEQ'
            ,colLabel		: 'SEQ_NAME'
            ,columns		:[
                {caption: "행번",		ref: 'BANK_ACCOUNT_SEQ', 			width:'50px',  	style:'text-align:left'},
                {caption: "행번명", 		ref: 'SEQ_NAME',    		width:'60px',  	style:'text-align:left'},
                {caption: "은행코드", 		ref: 'BANK_CODE',    		width:'50px',  	style:'text-align:left'},
                {caption: "은행명", 		ref: 'BANK_NAME',    		width:'100px',  	style:'text-align:left'},
                {caption: "계좌번호", 		ref: 'BANK_ACCOUNT_NO',    		width:'130px',  	style:'text-align:left'},
                {caption: "비고", 		ref: 'DESCRIPTION',    		width:'120px',  	style:'text-align:left'},
                {caption: "계좌주", 		ref: 'BANK_ACCOUNT_OWNER',    		width:'100px',  	style:'text-align:left'},
                {caption: "거래처", 		ref: 'CS_CODE',    		width:'100px',  	style:'text-align:left'},
                {caption: "시작일", 		ref: 'EFFECT_START_DATE',    		width:'100px',  	style:'text-align:left'},
                {caption: "종료일", 		ref: 'EFFECT_END_DATE',    		width:'100px',  	style:'text-align:left'},
                {caption: "복수등록", 		ref: 'BNKCNT',    		width:'100px',  	style:'text-align:left'},
            ]
        });
    }

    var fn_changeExpectedPayDate = function (data) {
        fn_getBankAccountSeq();
    }

    var fn_findDeptCode = function() {
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
            ,searchInputValues		: ["", 				searchText,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    var fn_findApprovalNo = function () {
        var searchText 		= gfnma_nvl(SBUxMethod.get("APPROVAL_NO"));
        var CS_CODE 		= gfnma_nvl(SBUxMethod.get("CS_CODE"));
        var addParams = [CS_CODE, '', strsourceType];

        SBUxMethod.attr('modal-compopup1', 'header-title', '세금계산서목록');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_INVOICE_'+ strsourceType
            ,popupType				: 'B'
            ,whereClause			: addParams
            ,searchCaptions			: ["승인번호", "사업자번호", "상호", "작성시작일자", "작성종료일자"]
            ,searchInputFields		: ["APPROVAL_NO", "SELLER_REG_NO", "SELLER_NAME", "DATE_FR", "DATE_TO"]
            ,searchInputValues		: [searchText, "", "", gfn_dateFirstYmd(new Date()), gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", "input", "input", "datepicker", "datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["승인번호", "발급일자", "전송일자", "사업자번호", "상호", "대표자명", "합계금액", "공급가액", "부가세액"
                , "전자세금계산서분류", "전자세금계산서분류명", "전표담당자명", "증빙유형", "거래처코드", "거래처명"]
            ,tableColumnNames		: ["WRITE_DATE", "APPROVAL_NO", "ISSUE_DATE", "SEND_DATE", "SELLER_REG_NO", "SELLER_NAME", "SELLER_OWNER"
                , "TOTAL_AMT", "TOTAL_TAXABLE_AMT", "TOTAL_VAT_AMT", "EINVOICE_CATEGORY", "EINVOICE_CATEGORY_NAME", "ACCOUNT_EMP_NAME", "VOUCHER_TYPE", "CS_CODE", "CS_NAME"]
            ,tableColumnWidths		: ["100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('APPROVAL_NO', data.APPROVAL_NO);
                SBUxMethod.set('VOUCHER_TYPE', data.VOUCHER_TYPE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    var fn_findCsCode = function () {
        var CS_CODE 		= gfnma_nvl(SBUxMethod.get("CS_CODE"));
        var CS_NAME 		= gfnma_nvl(SBUxMethod.get("CS_NAME"));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var replaceText2 	= "_BIZ_REGNO_";
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%' AND BIZ_REGNO LIKE '%" + replaceText2 + "%'"
            + (strsourceType == "AP" ? " BETWEEN effect_start_date AND effect_end_date " : "");

        SBUxMethod.attr('modal-compopup1', 'header-title', strsourceType == "AP" ? '거래처 (구매)' : '거래처 (판매)');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: strsourceType == "AP" ? 'P_CS_PURCHASE_DOC' : "P_CS_SALE_DOC"
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드", "거래처명", "사업자번호"]
            ,searchInputFields		: ["CS_CODE", "CS_NAME", "BIZ_REGNO"]
            ,searchInputValues		: [CS_CODE, CS_NAME, ""]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호", "거래중지여부", "대표자", "업태", "종목", "주소", "전화", "팩스"
                , "채무계정", "채무계정명", "지급기준", "지급기준명", "지급방법", "통화", "TXN_STOP_REASON"]
            ,tableColumnNames		: ["CS_CODE", "CS_NAME", "BIZ_REGNO", "TXN_STOP_YN", "CHIEF_NAME", "BIZ_CATEGORY", "BIZ_ITEMS"
                , "ADDRESS", "TEL", "FAX", "AP_ACC_CODE", "AP_ACC_NAME", "PAY_TERM_CODE", "PAY_TERM_NAME", "PAY_METHOD", "CURRENCY_CODE", "TXN_STOP_REASON"]
            ,tableColumnWidths		: ["90px", "150px", "130px", "70px", "80px", "100px", "100px", "200px", "100px", "100px", "100px", "100px", "100px"
                , "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('CS_CODE', data.CS_CODE);
                SBUxMethod.set('CS_NAME', data.CS_NAME);
                SBUxMethod.set('BIZ_REGNO', data.BIZ_REGNO);
                fn_getBankAccountSeq();
            },
        });
    }

    var fn_findPayTermCode = function () {
        var searchText 		= gfnma_nvl(SBUxMethod.get("PAY_TERM_NAME"));
        var replaceText0 	= "_PAY_TERM_CODE_";
        var replaceText1 	= "_PAY_TERM_NAME_";
        var strWhereClause 	= "AND A.PAY_TERM_CODE LIKE '%" + replaceText0 + "%' AND A.PAY_TERM_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '지급기일정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: strsourceType == "AP" ? 'P_PAY_DATE_P' : "P_PAY_DATE_S"
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", 		"명칭"]
            ,searchInputFields		: ["PAY_TERM_CODE", 		"PAY_TERM_NAME"]
            ,searchInputValues		: ["", 			searchText]
            ,height					: '400px'
            ,tableHeader			: ["지급기일코드", "지급기일명", "지급기준"]
            ,tableColumnNames		: ["PAY_TERM_CODE", "PAY_TERM_NAME", "PAY_METHOD_NAME"]
            ,tableColumnWidths		: ["80px", "250px", "100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('PAY_TERM_NAME', data.PAY_TERM_NAME);
                SBUxMethod.set('PAY_TERM_CODE', data.PAY_TERM_CODE);
            },
        });
    }

    var fn_findAccItem = function (num) {
        var searchText 		= gfnma_nvl(SBUxMethod.get("ACC_VALUE_NAME"+num));
        var replaceText0 	= "_ACC_ITEM_VALUE_";
        var replaceText1 	= "_ACC_VALUE_NAME_";
        var strWhereClause 	= "AND ACC_ITEM_VALUE LIKE '%" + replaceText0 + "%' AND ACC_VALUE_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '지급기일정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FIM041'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["관리항목코드", 		"관리항목명"]
            ,searchInputFields		: ["ACC_ITEM_VALUE", 		"ACC_VALUE_NAME"]
            ,searchInputValues		: ["", 			searchText]
            ,height					: '400px'
            ,tableHeader			: ["관리항목", "관리항목명", "데이터유형", "컨트롤유형"]
            ,tableColumnNames		: ["ACC_ITEM_VALUE", "ACC_VALUE_NAME", "DATA_TYPE", "CONTROL_TYPE"]
            ,tableColumnWidths		: ["100px", "100px", "80px", "80px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('ACC_VALUE_NAME'+num, data.ACC_VALUE_NAME);
                SBUxMethod.set('ACC_ITEM_VALUE'+num, data.ACC_ITEM_VALUE);
            },
        });
    }

    var fn_findVatTypeForGvwWFItem = function(row, col) {
        var addParam = [gfn_dateToYmd(new Date())];

        SBUxMethod.attr('modal-compopup1', 'header-title', '부가세계정정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: strsourceType == "AP" ? 'P_ACCOUNT_POPUP_AP_Q' : "P_ACCOUNT_POPUP_AR_Q"
            ,popupType				: 'B'
            ,whereClause			: addParam
            ,searchCaptions			: ["코드", 		"코드명"]
            ,searchInputFields		: ["VAT_CODE", 	"VAT_NAME"]
            ,searchInputValues		: ["", 				""]
            ,searchInputTypes		: ["input", 		"input"]		//input, datepicker가 있는 경우
            ,height					: '400px'
            ,tableHeader			: ["부가세코드",		"부가세명", 		"부가세유형"]
            ,tableColumnNames		: ["VAT_CODE",	"VAT_NAME", 	"VAT_TYPE_CODE"]
            ,tableColumnWidths		: ["100px", 		"200px", 		"100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                gvwWFItem.setCellData(row, (col-1), data.VAT_CODE);
                gvwWFItem.setCellData(row, col, data.VAT_NAME);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'400px'})
    }

    var fn_findAccountCodeForGvwWFItem = function(row, col) {
        var addParam = [null];

        SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: "P_FIM045"
            ,popupType				: 'B'
            ,whereClause			: addParam
            ,searchCaptions			: ["코드", 		"코드명"]
            ,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
            ,searchInputValues		: ["", 				""]
            ,searchInputTypes		: ["input", 		"input"]		//input, datepicker가 있는 경우
            ,height					: '400px'
            ,tableHeader			: ["계정코드",		"계정명", 		"계정명(한글)"]
            ,tableColumnNames		: ["ACCOUNT_CODE",	"ACCOUNT_NAME", 	"ACCOUNT_NAME_CHN"]
            ,tableColumnWidths		: ["100px", 		"200px", 		"200px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                gvwWFItem.setCellData(row, (col-1), data.ACCOUNT_CODE);
                gvwWFItem.setCellData(row, col, data.ACCOUNT_NAME);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'500px'})
    }

    // 복사모드토글
    const fn_toggleMode = async function (mode) {
        if(mode == "clear") {
            $("#btnClearMode").hide();
            $("#btnLineCopyMode").show();
            $("#btnCellCopyMode").hide();
            copyMode = "line";
        } else if(mode == "line") {
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

    function fn_createGvwWFItemGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwWFItem';
        SBGridProperties.id 				= 'gvwWFItem';
        SBGridProperties.jsonref 			= 'jsonAccountLineList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';

        if (copyMode == 'clear') { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if(copyMode == 'line'){ //행복사모드
            SBGridProperties.selectmode = 'byrow'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.
        } else if(copyMode == 'cell'){ //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }

        SBGridProperties.frozencols = 10;
        SBGridProperties.columns = [
            {caption: ["ITEM_ID"], 	        ref: 'ITEM_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["KEY_ID"], 	        ref: 'KEY_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["순번"], 	        ref: 'ITEM_SEQ',    	        type:'output',  	width:'40px',  	style:'text-align:left'},
            {caption: ["유형"],           ref: 'LINE_TYPE', 		        type:'combo',  	width:'71px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonLineType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["차/대"],           ref: 'DEBIT_CREDIT', 		        type:'combo',  	width:'66px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDebitCredit',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부가세유형"], 	        ref: 'VAT_TYPE',    	        type:'output',  	width:'72px',  	style:'text-align:left'}, // TODO : P_ACCOUNT_POPUP_Q
            {caption: ["부가세유형명"], 	        ref: 'VAT_NAME',    	        type:'output',  	width:'184px',  	style:'text-align:left'}, // TODO : P_ACCOUNT_POPUP_Q
            {caption: ["계정코드"], 	        ref: 'ACCOUNT_CODE',    	        type:'output',  	width:'80px',  	style:'text-align:left'}, // TODO : P_FIM045
            {caption: ["계정과목명"], 	        ref: 'ACCOUNT_NAME',    	        type:'output',  	width:'170px',  	style:'text-align:left'}, // TODO : P_FIM045
            {caption: ["통화금액"],         ref: 'ORIGINAL_AMT',    type:'output',  	width:'126px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["전표금액"],         ref: 'FUNCTIONAL_AMT',    type:'output',  	width:'135px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["품목"], 	        ref: 'ITEM_CODE',    	        type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["단위"],           ref: 'UOM', 		        type:'output',  	width:'60px', style:'text-align:left'},
            {caption: ["수량"], 	        ref: 'TXN_QTY',    	        type:'output',  	width:'60px',  	style:'text-align:left'},
            {caption: ["귀속부서코드"], 	        ref: 'DEPT_CODE',    	        type:'output',  	width:'80px',  	style:'text-align:left', hidden: true},
            {caption: ["원가중심점"],           ref: 'COST_CENTER_CODE', 		        type:'output',  	width:'91px', style:'text-align:left'},
            {caption: ["원가중심점명"],           ref: 'COST_CENTER_NAME', 		        type:'output',  	width:'150px', style:'text-align:left'},
            {caption: ["사업장"],           ref: 'SITE_CODE', 		        type:'output',  	width:'100px', style:'text-align:left'},
            {caption: ["부서"], 	        ref: 'DEPT_NAME',    	        type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["프로젝트코드"], 	        ref: 'PROJECT_CODE',    	        type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["프로젝트명"], 	        ref: 'PROJECT_NAME',    	        type:'output',  	width:'234px',  	style:'text-align:left'},
            {caption: ["관리항목1"], 	        ref: 'ACC_ITEM_CODE1',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목2"], 	        ref: 'ACC_ITEM_CODE2',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목3"], 	        ref: 'ACC_ITEM_CODE3',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목4"], 	        ref: 'ACC_ITEM_CODE4',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목5"], 	        ref: 'ACC_ITEM_CODE5',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목6"], 	        ref: 'ACC_ITEM_CODE6',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목7"], 	        ref: 'ACC_ITEM_CODE7',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목8"], 	        ref: 'ACC_ITEM_CODE8',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAccItemCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["관리항목9"], 	        ref: 'ACC_ITEM_CODE9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["관리항목10"], 	        ref: 'ACC_ITEM_CODE10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME1"], 	        ref: 'ACC_ITEM_NAME1',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME2"], 	        ref: 'ACC_ITEM_NAME2',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME3"], 	        ref: 'ACC_ITEM_NAME3',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME4"], 	        ref: 'ACC_ITEM_NAME4',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME5"], 	        ref: 'ACC_ITEM_NAME5',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME6"], 	        ref: 'ACC_ITEM_NAME6',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME7"], 	        ref: 'ACC_ITEM_NAME7',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME8"], 	        ref: 'ACC_ITEM_NAME8',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME9"], 	        ref: 'ACC_ITEM_NAME9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_NAME10"], 	        ref: 'ACC_ITEM_NAME10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN1"], 	        ref: 'ACC_ITEM_YN1',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN2"], 	        ref: 'ACC_ITEM_YN2',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN3"], 	        ref: 'ACC_ITEM_YN3',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN4"], 	        ref: 'ACC_ITEM_YN4',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN5"], 	        ref: 'ACC_ITEM_YN5',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN6"], 	        ref: 'ACC_ITEM_YN6',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN7"], 	        ref: 'ACC_ITEM_YN7',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN8"], 	        ref: 'ACC_ITEM_YN8',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN9"], 	        ref: 'ACC_ITEM_YN9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_YN10"], 	        ref: 'ACC_ITEM_YN10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE1"], 	        ref: 'DATA_TYPE1',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE2"], 	        ref: 'DATA_TYPE2',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE3"], 	        ref: 'DATA_TYPE3',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE4"], 	        ref: 'DATA_TYPE4',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE5"], 	        ref: 'DATA_TYPE5',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE6"], 	        ref: 'DATA_TYPE6',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE7"], 	        ref: 'DATA_TYPE7',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE8"], 	        ref: 'DATA_TYPE8',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE9"], 	        ref: 'DATA_TYPE9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["DATA_TYPE10"], 	        ref: 'DATA_TYPE10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID1"], 	        ref: 'POPUP_ID1',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID2"], 	        ref: 'POPUP_ID2',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID3"], 	        ref: 'POPUP_ID3',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID4"], 	        ref: 'POPUP_ID4',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID5"], 	        ref: 'POPUP_ID5',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID6"], 	        ref: 'POPUP_ID6',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID7"], 	        ref: 'POPUP_ID7',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID8"], 	        ref: 'POPUP_ID8',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID9"], 	        ref: 'POPUP_ID9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["POPUP_ID10"], 	        ref: 'POPUP_ID10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE1"], 	        ref: 'ACC_ITEM_VALUE1',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE2"], 	        ref: 'ACC_ITEM_VALUE2',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE3"], 	        ref: 'ACC_ITEM_VALUE3',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE4"], 	        ref: 'ACC_ITEM_VALUE4',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE5"], 	        ref: 'ACC_ITEM_VALUE5',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE6"], 	        ref: 'ACC_ITEM_VALUE6',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE7"], 	        ref: 'ACC_ITEM_VALUE7',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE8"], 	        ref: 'ACC_ITEM_VALUE8',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE9"], 	        ref: 'ACC_ITEM_VALUE9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_ITEM_VALUE10"], 	        ref: 'ACC_ITEM_VALUE10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME1"], 	        ref: 'ACC_VALUE_NAME1',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME2"], 	        ref: 'ACC_VALUE_NAME2',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME3"], 	        ref: 'ACC_VALUE_NAME3',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME4"], 	        ref: 'ACC_VALUE_NAME4',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME5"], 	        ref: 'ACC_VALUE_NAME5',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME6"], 	        ref: 'ACC_VALUE_NAME6',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME7"], 	        ref: 'ACC_VALUE_NAME7',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME8"], 	        ref: 'ACC_VALUE_NAME8',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME9"], 	        ref: 'ACC_VALUE_NAME9',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_VALUE_NAME10"], 	        ref: 'ACC_VALUE_NAME10',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["ACC_CHARACTER"], 	        ref: 'ACC_CHARACTER',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["적요"], 	        ref: 'DESCRIPTION',    	        type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption: ["통화코드"], 		ref: 'CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["환율"],         ref: 'EXCHANGE_RATE',    type:'output',  	width:'75px',  style:'text-align:left',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["환산단위"], 	        ref: 'BASE_SCALE',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["사업자번호"], 	        ref: 'REG_NO',    	        type:'output',  	width:'90px',  	style:'text-align:left'},
            {caption: ["계정분류"], 	        ref: 'ACC_CATEGORY',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부가세유형"], 	        ref: 'VAT_TYPE_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["원천소스"], 	        ref: 'ITEM_SOURCE_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["원천전표번호"], 	        ref: 'ITEM_DOC_NAME',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["원천라인ID"], 	        ref: 'ITEM_SOURCE_ID',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["건수"], 	        ref: 'SOURCE_RECORD_COUNT',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["TMP_ACCOUNT_CODE"], 	        ref: 'TMP_ACCOUNT_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["TMP_ACCOUNT_NAME"], 	        ref: 'TMP_ACCOUNT_NAME',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["PROJECT_YN"], 	        ref: 'PROJECT_YN',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["전자발행구분"], 	        ref: 'ETAX_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["11일외전송여부"], 	        ref: 'AFTER_DUE_DATE_YN',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["중복발행구분"], 	        ref: 'DUP_ISSUE_BILL_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["수입금액제외여부"], 	        ref: 'EXCLUDE_REVENUE_AMT_YN',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["카드용도구분"], 	        ref: 'CARD_USE_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["카드번호"], 	        ref: 'CARD_NUM',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["불공제유형"], 	        ref: 'VAT_NOT_DEDUCTION_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["예정신고누락여부"], 	        ref: 'REPORT_OMIT_YN',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["공급가액"], 	        ref: 'SUPPLY_AMT',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["신고일자"], 	        ref: 'STANDARD_DATE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["감가상각자산유형"], 	        ref: 'VAT_ASSET_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["영세율첨부서류여부"], 	        ref: 'ZERO_REPORT_YN',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["내국신용장구분"], 	        ref: 'LOCAL_CREDIT_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["서류명"], 	        ref: 'DOCUMENT_NAME',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["발급자"], 	        ref: 'ISSUE_NAME',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["발급일자"], 	        ref: 'DOCUMENT_ISSUE_DATE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["수출신고번호"], 	        ref: 'EXPORT_LICENSE_NO',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["선적일자"], 	        ref: 'SHIPPING_DATE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["당기제출금_외화"], 	        ref: 'EXPORT_AMT',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["당기제출금_원화"], 	        ref: 'EXPORT_AMT_KRW',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["당기신고해당분_외화"], 	        ref: 'VAT_EXPORT_AMT',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["당기신고해당분_원화"], 	        ref: 'VAT_EXPORT_AMT_KRW',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["수출외화금액"], 	        ref: 'FOREIGN_AMT',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["수출원화금액"], 	        ref: 'WON_AMT',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["내국신용장서류번호"], 	        ref: 'DOCUMENT_NO',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["영세율구분"], 		ref: 'ZERO_TYPE',   	    type:'combo', style:'text-align:left' ,width: '83px',
                typeinfo: {
                    ref			: 'jsonZeroType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부가세"], 	        ref: 'VAT_AMT',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["원천징수여부"], 	        ref: 'WITHHOLD_FLAG',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["원천징수세금코드"], 	        ref: 'WITHHOLD_TAX_TYPE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["원천징수거래처코드"], 	        ref: 'WITHHOLD_CS_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["원천징수세금코드2"], 	        ref: 'WITHHOLD_TAX_TYPE2',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["원천징수거래처코드2"], 	        ref: 'WITHHOLD_CS_CODE2',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["PO번호"], 	        ref: 'PO_LINE_NO',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["영업사원"], 	        ref: 'SALES_PERSON',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["고객사코드"], 	        ref: 'SALES_CS_CODE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["반제완료일"], 	        ref: 'APPLY_COMPLETE_DATE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["반제완료여부"], 	        ref: 'APPLY_COMPLETE_FLAG',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["여신관리영역"], 		ref: 'CREDIT_AREA',   	    type:'combo', style:'text-align:left' ,width: '79px',
                typeinfo: {
                    ref			: 'jsonCreditArea',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["보류여부"], 	        ref: 'HOLD_FLAG',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["해제일"], 	        ref: 'RELEASE_DATE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["해제자"], 	        ref: 'RELEASE_USER',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["보류일"], 	        ref: 'HOLD_DATE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["보류자"], 	        ref: 'HOLD_USER',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["보류사유"], 	        ref: 'HOLD_REASON',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["지급기산일"], 	        ref: 'PAY_BASE_DATE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["어음만기일"], 	        ref: 'BILL_DUE_DATE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["어음기일"], 	        ref: 'BILL_DUE_DAY',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["어음만기지급일"], 	        ref: 'BILL_DUE_PAY_DATE',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["최초지급조건"], 	        ref: 'PAY_TERM_ORIG',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["제품군코드"], 	        ref: 'PROD_GROUP',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["계좌행번"], 	        ref: 'BANK_ACCOUNT_SEQ',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["원가유형"], 	        ref: 'COST_CLASS',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["불공제여부"], 	        ref: 'NONDED_YN',    	        type:'output',  	width:'75px',  	style:'text-align:left', hidden: true}
        ];

        gvwWFItem = _SBGrid.create(SBGridProperties);
        gvwWFItem.bind('dblclick', 'fn_gvwWFItemDblclick');
        gvwWFItem.bind('valuechanged','fn_gvwWFItemValueChanged');
        //gvwWFItem.bind('click', 'fn_view');
    }

    const fn_gvwWFItemDblclick = async function() {
        var nRow = gvwWFItem.getRow();
        var nCol = gvwWFItem.getCol();

        console.log(nCol);

        if(nCol == 5) {
            fn_findVatTypeForGvwWFItem(nRow, nCol);
        }

        if(nCol == 6) {
            fn_findVatTypeForGvwWFItem(nRow, (nCol - 1));
        }

        if(nCol == 7) {
            fn_findAccountCodeForGvwWFItem(nRow, nCol);
        }

        if(nCol == 8) {
            fn_findAccountCodeForGvwWFItem(nRow, (nCol - 1));
        }
    }

    const fn_gvwWFItemValueChanged = async function() {
        var nRow = gvwWFItem.getRow();
        var nCol = gvwWFItem.getCol();
        var rowData = gvwWFItem.getRowData(nRow);

        if (nCol == gvwWFItem.getColRef("CURRENCY_CODE")) {

            let ht = fn_getExchangeRate(ymddoc_date.yyyymmdd, gvwWFItem.GetValue(e.RowHandle, "currency_code").ToString(), null);

            gvwWFItem.SetValue(e.RowHandle, "exchange_rate", Decimal.Parse(ht["RATE"].ToString()));
            gvwWFItem.SetValue(e.RowHandle, "base_scale", Decimal.Parse(ht["BASE_SCALE"].ToString()));
            gvwWFItem.SetValue(e.RowHandle, "functional_amt", Math.Round(decimal.Parse(gvwWFItem.GetValue(e.RowHandle, "original_amt").ToString()) * decimal.Parse(gvwWFItem.GetValue(e.RowHandle, "exchange_rate").ToString()) / decimal.Parse(gvwWFItem.GetValue(e.RowHandle, "base_scale").ToString()), p_currUnit));
        }

        if (nCol == gvwWFItem.getColRef("ORIGINAL_AMT")) {

            gvwWFItem.SetValue(e.RowHandle, "functional_amt", Math.Round(decimal.Parse(gvwWFItem.GetValue(e.RowHandle, "original_amt").ToString()) * decimal.Parse(numexchange_rate.EditValue.ToString()) / decimal.Parse(numbase_scale.EditValue.ToString()), p_currUnit));
            // 합계
            fn_summary();
        }

        if (nCol == gvwWFItem.getColRef("FUNCTIONAL_AMT")) {
            // 합계
            fn_summary();
        } else if (nCol == gvwWFItem.getColRef("ACCOUNT_CODE")) {
            ChangeControlSettings(gvwWFItem.GetFocusedDataRow());
        } else if (nCol == gvwWFItem.getColRef("DEBIT_CREDIT")) {

            // 합계
            fn_summary();

            if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("ACCOUNT_CODE")) == "" || gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("ACCOUNT_NAME")) == "")
                return;

            SBUxMethod.set("DEBIT_CREDIT", gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("DEBIT_CREDIT")));

            // 차대 구분에 따라 컨트롤 필수 속성 변경
            for (var i = 1; i <= 10; i++){
                var txtacc_item_value = gfn_nvl(gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("ACC_ITEM_VALUE"+i)));
                var txtacc_value_name = gfn_nvl(gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("ACC_VALUE_NAME"+i)));

                if (txtacc_item_value != "") {
                    if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("DEBIT_CREDIT")) == "D") {
                        if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("ACC_ITEM_YN"+i)) == "Y") {
                            txtacc_item_value.Properties.AllowBlank = false;
                            txtacc_item_value.BackColor = AllowBlankColor;

                            if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("DATA_TYPE"+i)) == "POPUP") {
                                txtacc_value_name.Properties.AllowBlank = false;
                                txtacc_value_name.BackColor = AllowBlankColor;
                            }
                        } else {
                            txtacc_item_value.Properties.AllowBlank = true;
                            txtacc_item_value.BackColor = AppearanceBackColor;
                        }
                    } else if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("DEBIT_CREDIT")) == "C") {
                        if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("ACC_ITEM_YN"+i)) == "Y") {
                            txtacc_item_value.Properties.AllowBlank = false;
                            txtacc_item_value.BackColor = AllowBlankColor;

                            if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("DATA_TYPE"+i)) == "POPUP") {
                                txtacc_value_name.Properties.AllowBlank = false;
                                txtacc_value_name.BackColor = AllowBlankColor;
                            }
                        } else {
                            txtacc_item_value.Properties.AllowBlank = true;
                            txtacc_item_value.BackColor = AppearanceBackColor;
                        }
                    }
                }
            }
        } else if (nCol == gvwWFItem.getColRef("ACC_CHARACTER")) {
            ChangeControlSettings(gvwWFItem.GetFocusedDataRow());
        } else if (nCol == gvwWFItem.getColRef("LINE_TYPE")) {
            if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("LINE_TYPE")) == "2")
                // TODO : 확인필요
                colaccount_code.Popup.WhereQuery = "acc_character in ('C','V')";
        } else if (nCol == gvwWFItem.getColRef("COST_CLASS")) {
            if (gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("ACCOUNT_CODE")) != "") {
                var strAccountCostClass = gvwWFItem.getCellData(nRow, gvwWFItem.getColRef("COST_CLASS"));
                fnCostClassCheck("Y", strAccountCostClass);
            }
        }
    }

    const fn_getExchangeRate = async function (stryyyymmdd, strcurrency_code, strrate_type) {
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMMDD : stryyyymmdd,
            V_P_CURR_CODE : strcurrency_code,
            V_P_RATE_TYPE : strrate_type,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/fi/far/rec/getExchangeRate.do", {
            getType				: 'json',
            workType			: 'Q2',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
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

    const ChangeControlSettings = async function (dr) {
        if (dr == null)
            return;

        for (var i = 1; i <= 10; i++) {
            // 라벨명 설정
            let lblacc_item_name = FindControl("lblacc_item_name" + i.ToString());
            if (lblacc_item_name != null)
                lblacc_item_name.Text = dr["ACC_ITEM_NAME" + i];

            // 컨트롤 타입 설정
            let txtacc_item_value = FindControl("txtacc_item_value" + i.ToString());
            if (txtacc_item_value != "") {
                switch (dr["DATA_TYPE" + i])
                {
                    case "TEXT":
                        txtacc_item_value.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.None;
                        txtacc_item_value.Properties.Mask.UseMaskAsDisplayFormat = false;
                        txtacc_item_value.RightToLeft = RightToLeft.No;
                        txtacc_item_value.Enabled = true;
                        break;
                    case "POPUP":
                        txtacc_item_value.RightToLeft = RightToLeft.No;
                        txtacc_item_value.Enabled = true;
                        break;
                    case "NUM":
                        txtacc_item_value.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
                        txtacc_item_value.Properties.Mask.UseMaskAsDisplayFormat = true;
                        txtacc_item_value.Properties.Mask.EditMask = "###,###,###,###,###,###,##0";
                        if (txtacc_item_value.Text == "")
                            txtacc_item_value.Text = "0";
                        txtacc_item_value.RightToLeft = RightToLeft.Yes;
                        txtacc_item_value.Enabled = true;
                        break;
                    case "YYYY":
                        txtacc_item_value.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.DateTime;
                        txtacc_item_value.Properties.Mask.UseMaskAsDisplayFormat = true;
                        txtacc_item_value.Properties.Mask.EditMask = "yyyy";
                        txtacc_item_value.Text = null;
                        txtacc_item_value.Enabled = true;
                        break;
                    case "YYYYMM":
                        txtacc_item_value.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.DateTime;
                        txtacc_item_value.Properties.Mask.UseMaskAsDisplayFormat = true;
                        txtacc_item_value.Properties.Mask.EditMask = "yyyy-MM";
                        txtacc_item_value.Text = null;
                        txtacc_item_value.Enabled = true;
                        break;
                    case "YYYYMMDD":
                        txtacc_item_value.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.RegEx;
                        txtacc_item_value.Properties.Mask.UseMaskAsDisplayFormat = true;
                        txtacc_item_value.Properties.Mask.ShowPlaceHolders = false;
                        txtacc_item_value.Properties.Mask.EditMask = @"\d{4}-\d{2}-\d{2}";
                        txtacc_item_value.Text = null;
                        txtacc_item_value.Enabled = true;
                        break;
                    default:
                        txtacc_item_value.Enabled = false;
                        break;
                }
            }

            // 팝업 설정
            let txtacc_value_name = FindControl("txtacc_value_name" + i);

            if (txtacc_value_name != "") {
                if (dr["data_type" + i.ToString()].ToString() == "POPUP") {
                    txtacc_item_value.Properties.Popup.BizComponentID = dr["popup_id" + i.ToString()].ToString();
                    txtacc_item_value.Properties.Popup.FormType = "popBase";

                    txtacc_value_name.Enabled = true;
                    txtacc_value_name.Properties.Popup.BizComponentID = dr["popup_id" + i.ToString()].ToString();
                    txtacc_value_name.Properties.Popup.FormType = "popBase";

                    txtacc_item_value.Properties.Popup.WhereList.Clear();
                    WhereListItem witem1 = new WhereListItem("acc_item_value", "%_%", txtacc_item_value.Name);
                    txtacc_item_value.Properties.Popup.WhereList.Add(witem1);

                    txtacc_value_name.Properties.Popup.WhereList.Clear();
                    WhereListItem witem2 = new WhereListItem("acc_value_name", "%_%", txtacc_value_name.Name);
                    txtacc_value_name.Properties.Popup.WhereList.Add(witem2);

                    //P_LOAN01   차입금
                    //P_NOTE02   받을어음
                    //P_NOTE03   지급어음
                    //P_SAVE01   예적금
                    if (dr["popup_id" + i.ToString()].ToString() == "P_LOAN01" ||
                        dr["popup_id" + i.ToString()].ToString() == "P_NOTE02" ||
                        dr["popup_id" + i.ToString()].ToString() == "P_NOTE03" ||
                        dr["popup_id" + i.ToString()].ToString() == "P_SAVE01") {
                        WhereListItem witem3 = new WhereListItem("fi_org_code", "=", cbofi_org_code.Name);
                        txtacc_item_value.Properties.Popup.WhereList.Add(witem3);
                        WhereListItem witem4 = new WhereListItem("fi_org_code", "=", cbofi_org_code.Name);
                        txtacc_value_name.Properties.Popup.WhereList.Add(witem4);
                    }
                } else {
                    txtacc_item_value.Properties.Popup.BizComponentID = "";

                    txtacc_value_name.Enabled = false;
                    txtacc_value_name.Properties.Popup.BizComponentID = "";
                }
            }

            // 필수입력 설정
            if (dr["acc_item_yn" + i.ToString()].ToString() == "Y") {
                txtacc_item_value.Properties.AllowBlank = false;
                txtacc_item_value.BackColor = AllowBlankColor;

                if (dr["data_type" + i.ToString()].ToString() == "POPUP") {
                    txtacc_value_name.Properties.AllowBlank = false;
                    txtacc_value_name.BackColor = AllowBlankColor;
                } else {
                    txtacc_value_name.Properties.AllowBlank = true;
                    txtacc_value_name.BackColor = AppearanceBackColor;
                }
            } else {
                txtacc_item_value.Properties.AllowBlank = true;
                txtacc_item_value.BackColor = AppearanceBackColor;
                txtacc_value_name.Properties.AllowBlank = true;
                txtacc_value_name.BackColor = AppearanceBackColor;
            }
        }
    }

    const fnCostClassCheck = async function (strCostClassCheckYN, strCostClass) {
        JPlatform.Client.Controls8.Design.WhereListItem whereListItem25 = new JPlatform.Client.Controls8.Design.WhereListItem();
        JPlatform.Client.Controls8.Design.WhereListItem whereListItem26 = new JPlatform.Client.Controls8.Design.WhereListItem();
        JPlatform.Client.Controls8.Design.WhereListItem whereListItem27 = new JPlatform.Client.Controls8.Design.WhereListItem();
        JPlatform.Client.Controls8.Design.WhereListItem whereListItem28 = new JPlatform.Client.Controls8.Design.WhereListItem();
        JPlatform.Client.Controls8.Design.WhereListItem whereListItem29 = new JPlatform.Client.Controls8.Design.WhereListItem();
        JPlatform.Client.Controls8.Design.WhereListItem whereListItem30 = new JPlatform.Client.Controls8.Design.WhereListItem();

        if (strCostClassCheckYN == "N") {
            this.colcost_center_code.Popup.WhereList.Clear();
            whereListItem25.ControlName = "cost_center_code";
            whereListItem25.Field = "cost_center_code";
            whereListItem25.Operator = "%_%";
            whereListItem26.ControlName = "";
            whereListItem26.Field = "cost_center_name";
            whereListItem26.Operator = "%_%";
            this.colcost_center_code.Popup.WhereList.AddRange(new JPlatform.Client.Controls8.Design.WhereListItem[] {
            whereListItem25,
                whereListItem26});

            this.colcost_center_name.Popup.WhereList.Clear();
            whereListItem28.ControlName = "";
            whereListItem28.Field = "cost_center_code";
            whereListItem28.Operator = "%_%";
            whereListItem29.ControlName = "cost_center_name";
            whereListItem29.Field = "cost_center_name";
            whereListItem29.Operator = "%_%";
            this.colcost_center_name.Popup.WhereList.AddRange(new JPlatform.Client.Controls8.Design.WhereListItem[] {
            whereListItem28,
                whereListItem29});
        } else {
            if (strCostClass == "" || strCostClass == "8" || strCostClass == "9") {
                this.colcost_center_code.Popup.WhereList.Clear();
                whereListItem25.ControlName = "cost_center_code";
                whereListItem25.Field = "cost_center_code";
                whereListItem25.Operator = "_%";
                whereListItem26.ControlName = "";
                whereListItem26.Field = "cost_center_name";
                whereListItem26.Operator = "_%";
                this.colcost_center_code.Popup.WhereList.AddRange(new JPlatform.Client.Controls8.Design.WhereListItem[] {
                whereListItem25,
                    whereListItem26});

                this.colcost_center_name.Popup.WhereList.Clear();
                whereListItem28.ControlName = "";
                whereListItem28.Field = "cost_center_code";
                whereListItem28.Operator = "_%";
                whereListItem29.ControlName = "cost_center_name";
                whereListItem29.Field = "cost_center_name";
                whereListItem29.Operator = "%_%";
                this.colcost_center_name.Popup.WhereList.AddRange(new JPlatform.Client.Controls8.Design.WhereListItem[] {
                whereListItem28,
                    whereListItem29});
            } else {
                this.colcost_center_code.Popup.WhereList.Clear();
                whereListItem25.ControlName = "cost_center_code";
                whereListItem25.Field = "cost_center_code";
                whereListItem25.Operator = "%_%";
                whereListItem26.ControlName = "";
                whereListItem26.Field = "cost_center_name";
                whereListItem26.Operator = "%_%";
                whereListItem27.ControlName = "cost_class";
                whereListItem27.Field = "cost_class";
                whereListItem27.Operator = "_%";
                this.colcost_center_code.Popup.WhereList.AddRange(new JPlatform.Client.Controls8.Design.WhereListItem[] {
                whereListItem25,
                    whereListItem26,
                    whereListItem27});

                this.colcost_center_name.Popup.WhereList.Clear();
                whereListItem28.ControlName = "";
                whereListItem28.Field = "cost_center_code";
                whereListItem28.Operator = "%_%";
                whereListItem29.ControlName = "cost_center_name";
                whereListItem29.Field = "cost_center_name";
                whereListItem29.Operator = "%_%";
                whereListItem30.ControlName = "cost_class";
                whereListItem30.Field = "cost_class";
                whereListItem30.Operator = "_%";
                this.colcost_center_name.Popup.WhereList.AddRange(new JPlatform.Client.Controls8.Design.WhereListItem[] {
                whereListItem28,
                    whereListItem29,
                    whereListItem30});
            }
        }
    }

    // 행추가
    const fn_addRow = async function () {
        let rowVal = gvwWFItem.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwWFItem.addRow(true, {
                KEY_ID : gfnma_nvl(SBUxMethod.get("KEY_ID")),
                ITEM_SEQ : jsonAccountLineList.length,
                LINE_TYPE : "2",
                SITE_CODE : gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE")),
                DEPT_CODE : gfnma_nvl(SBUxMethod.get("DEPT_CODE")),
                DEBIT_CREDIT : gfnma_nvl(SBUxMethod.get("REVERSE_YN")) == "Y" ? "C" : "D",
                ORIGINAL_AMT : 0,
                VAT_AMT : 0,
                SUPPLY_AMT : 0,
                CURRENCY_CODE : gfnma_nvl(gfnma_multiSelectGet('#CURRENCY_CODE')),
                EXCHANGE_RATE : gfnma_nvl(SBUxMethod.get("EXCHANGE_RATE")),
                CS_CODE : gfnma_nvl(SBUxMethod.get("CS_CODE")),
                VAT_TYPE : gfnma_nvl(gfnma_multiSelectGet('#VAT_CODE', 'object').value),
                VAT_NAME : gfnma_nvl(gfnma_multiSelectGet('#VAT_CODE', 'object').label),
                DESCRIPTION : gfnma_nvl(SBUxMethod.get("DESCRIPTION")),
            });
        }else{
            gvwWFItem.insertRow(rowVal, {
                KEY_ID : gfnma_nvl(SBUxMethod.get("KEY_ID")),
                ITEM_SEQ : jsonAccountLineList.length,
                LINE_TYPE : "2",
                SITE_CODE : gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE")),
                DEPT_CODE : gfnma_nvl(SBUxMethod.get("DEPT_CODE")),
                DEBIT_CREDIT : gfnma_nvl(SBUxMethod.get("REVERSE_YN")) == "Y" ? "C" : "D",
                ORIGINAL_AMT : 0,
                VAT_AMT : 0,
                SUPPLY_AMT : 0,
                CURRENCY_CODE : gfnma_nvl(gfnma_multiSelectGet('#CURRENCY_CODE')),
                EXCHANGE_RATE : gfnma_nvl(SBUxMethod.get("EXCHANGE_RATE")),
                CS_CODE : gfnma_nvl(SBUxMethod.get("CS_CODE")),
                VAT_TYPE : gfnma_nvl(gfnma_multiSelectGet('#VAT_CODE', 'object').value),
                VAT_NAME : gfnma_nvl(gfnma_multiSelectGet('#VAT_CODE', 'object').label),
                DESCRIPTION : gfnma_nvl(SBUxMethod.get("DESCRIPTION")),
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

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createGvwWFItemGrid();
        fn_onload();
    });

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

    const fn_onload = async function () {
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();
        $("#apcSelectMa").hide();
        SBUxMethod.set("SRCH_DOC_H_FI_ORG_CODE", p_fiOrgCode);

        strCurrntDate = gfn_dateToYmd(new Date());

        if(strsourceType == null) {
            strsourceType = "AP";
        }
        SBUxMethod.set("REVERSE_YN",'N');
        //회계 삭제 권한
        if (p_fiDeleteUser != null)
            strFI_DELETE_USER = p_fiDeleteUser;

        // TODO : 추후 탭간 이동(파라미터포함) 기능 개발시 수정필요
        let parentParameter = {}
        if (parentParameter) {
            if (parentParameter.has("DOC_BATCH_NO")) {
                SBUxMethod.set("DOC_BATCH_NO", parentParameter["DOC_BATCH_NO"]);
            }

            if (parentParameter.has("SOURCE_TYPE")) {
                strsourceType = parentParameter["SOURCE_TYPE"];
            }

            SBUxMethod.set("SRCH_INVOCE_BATCH_NO", strsourceType);

            if (parentParameter.has("DOC_NUM")) {
                SBUxMethod.set("DOC_NUM", parentParameter["DOC_NUM"]);
            }

            if (parentParameter.has("TXN_FROM_DATE")) {
                SBUxMethod.set("SRCH_FROM_DATE", parentParameter["TXN_FROM_DATE"]);
            }
            if (parentParameter.has("TXN_TO_DATE")) {
                SBUxMethod.set("SRCH_TO_DATE", parentParameter["TXN_TO_DATE"]);
            }
            if (parentParameter.has("COMP_CODE")) {
                // TODO : 확인필요
                gv_ma_selectedApcCd = parentParameter["COMP_CODE"];
            }

            if (parentParameter.has("FI_ORG_CODE")) {
                SBUxMethod.set("SRCH_DOC_H_FI_ORG_CODE", parentParameter["FI_ORG_CODE"]);
            }

            if (parentParameter.has("VOUCHER_TYPE")) {
                SBUxMethod.set("VOUCHER_TYPE", parentParameter["VOUCHER_TYPE"]);
            }

            SBUxMethod.set("SRCH_SITE_CODE", p_siteCode);

            if (parentParameter.has("VOUCHER_NO")) {
                SBUxMethod.set("VOUCHER_NO", parentParameter["VOUCHER_NO"]);
            }

            if (gfn_nvl(SBUxMethod.get("DOC_BATCH_NO")) != "") {
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

                $("#SUB_TAX_SITE_CODE").attr("aria-required", "true");
                gfnma_multiSelectSet('#SUB_TAX_SITE_CODE', 'TAX_SITE_CODE', 'TAX_SITE_NAME', "T02");

                $("#btnScmInfo").attr('disabled', 'false');

                SBUxMethod.attr('DOC_TYPE', 'readonly', 'true');

            } else if (strsourceType == "AP") {
                strFileSourceType = "FIGDOCHEADER";

                $("#DUP_ISSUE_BILL_TYPE").attr('disabled', 'true');
                $("#EXCLUDE_REVENUE_AMT_YN").attr('disabled', 'true');

                $("#btnScmInfo").attr('disabled', 'false');

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

                $("#SUB_TAX_SITE_CODE").attr("aria-required", "false");
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

                $("#SUB_TAX_SITE_CODE").attr("aria-required", "true");
                gfnma_multiSelectSet('#SUB_TAX_SITE_CODE', 'TAX_SITE_CODE', 'TAX_SITE_NAME', "T02");
            }
            if (parentParameter.has("APRINT")) {
                if (parentParameter["APRINT"].ToString() != "Y") {
                    bAllowPrint = false;
                } else {
                    bAllowPrint = true;
                }
            }
        } else {
            SBUxMethod.set("SRCH_DOC_H_FI_ORG_CODE", p_fiOrgCode);
            SBUxMethod.set("SRCH_SITE_CODE", p_siteCode);
            SBUxMethod.set("SRCH_INVOCE_BATCH_NO", strsourceType);
             if (strsourceType == "AP") {
                 $("#btnCreateInvoice").hide();
                 $("#btnCancelInvoice").hide();
            }
        }
        if (gfn_nvl(SBUxMethod.get("DOC_BATCH_NO")) == "") {
            fn_create();

            $("#btnAddRow").attr("disabled", "true");
            $("#btnDeleteRow").attr("disabled", "true");
        }

        //사용자
        SBUxMethod.set("EMP_CODE", gfnma_nvl(gfnma_multiSelectGet('#PAYEE_CODE')));

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

        for (var i = 0; i < jsonAccountLineList.length; i++){
            dorigin_dr_amt += gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("DEBIT_CREDIT")) == "D" ? parseInt(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ORIGINAL_AMT"))) : 0;
            dorigin_cr_amt += gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("DEBIT_CREDIT")) == "C" ? parseInt(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ORIGINAL_AMT"))) : 0;
            dfunctional_dr_amt += gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("DEBIT_CREDIT")) == "D" ? parseInt(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("FUNCTIONAL_AMT"))) : 0;
            dfunctional_cr_amt += gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("DEBIT_CREDIT")) == "C" ? parseInt(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("FUNCTIONAL_AMT"))) : 0;

            if (gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("LINE_TYPE")) == "2") {
                exp_amt += parseInt(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ORIGINAL_AMT")));
                exp_amt_krw += parseInt(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("FUNCTIONAL_AMT")));
            }

            if (gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("LINE_TYPE")) == "3") {
                vat_amt += parseInt(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("ORIGINAL_AMT")));
                vat_amt_krw += parseInt(gvwWFItem.getCellData((i+1), gvwWFItem.getColRef("FUNCTIONAL_AMT")));

                x = (i+1);
            }
        }

        SBUxMethod.set("DR_SUM", dorigin_dr_amt);
        SBUxMethod.set("CR_SUM", dorigin_cr_amt);
        SBUxMethod.set("DIFF_ORIGIN", dorigin_dr_amt - dorigin_cr_amt);
        SBUxMethod.set("DIFF_FUNTION", dfunctional_dr_amt - dfunctional_cr_amt);

        if (!bnew || bfocuschange)
            return;

        if (x > 0) {
            let VAT_TYPE = gfnma_nvl(gfnma_multiSelectGet('#VAT_CODE'));
            if (VAT_TYPE == "A0" || VAT_TYPE == "A1" || VAT_TYPE == "A2" || VAT_TYPE == "A3") {
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("EXPORT_AMT"), exp_amt)
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("EXPORT_AMT_KRW"), exp_amt_krw)
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("VAT_EXPORT_AMT"), exp_amt)
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("VAT_EXPORT_AMT_KRW"), exp_amt_krw)
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("FOREIGN_AMT"), exp_amt)
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("WON_AMT"), exp_amt_krw)
                gvwWFItem.setCellData(x, gvwWFItem.getColRef("SHIPPING_DATE"), SBUxMethod.get("DOC_DATE"))
            }
        }

    }

    const fn_create = async function () {
        if (gfnma_nvl(SBUxMethod.get("DOC_NAME")) != "") {
            if (gfn_comConfirm("Q0000", "PROJECTBASE_003"))
            {
                return;
            }
        }

        var strcurrent_date = gfn_dateToYmd(new Date());

        bnew = false;

        SBUxMethod.set("DOC_BATCH_NO",'');

        // TODO: this.InitControls(panWFTop);
        // TODO: this.InitControls(grdWFItem);
        // TODO: this.InitControls(panWFMiddleBottom);
        // TODO: this.InitControls(panWFBottom);

        SBUxMethod.set("SRCH_SITE_CODE",p_siteCode);
        gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', p_currCode);
        SBUxMethod.set("BASE_SCALE",parseInt(jsonCurrencyCode.filter(data => data["CURRENCY_CODE"] == p_currCode)[0]["BASE_SCALE"]));

        // TODO: btnAttach.Enabled = false;
        SBUxMethod.attr('VAT_TYPE', 'readonly', 'false');

        SBUxMethod.set("APPROVAL_NO",'');
        SBUxMethod.set("VOUCHER_TYPE",'');
        SBUxMethod.set("VOUCHER_NO",'');

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

            $("#SUB_TAX_SITE_CODE").attr("aria-required", "true");
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

            $("#SUB_TAX_SITE_CODE").attr("aria-required", "false");
            gfnma_multiSelectSet('#SUB_TAX_SITE_CODE', 'TAX_SITE_CODE', 'TAX_SITE_NAME', "T02");
        } else if (strsourceType == "BAD") {
            $("#DUP_ISSUE_BILL_TYPE").attr('disabled', 'true');
            $("#EXCLUDE_REVENUE_AMT_YN").attr('disabled', 'true');

            if (!p_isAccountManager) {
                $("#AFTER_DUE_DATE_YN").attr('disabled', 'true');
                $("#REPORT_OMIT_YN").attr('disabled', 'true');
            }

            SBUxMethod.set("DOC_TYPE", "91");

            $("#SUB_TAX_SITE_CODE").attr("aria-required", "true");
            gfnma_multiSelectSet('#SUB_TAX_SITE_CODE', 'TAX_SITE_CODE', 'TAX_SITE_NAME', "T02");
        }

        // TODO: SaveButton = true;
        // TODO: DeleteButton = false;
        // TODO: btnSubmit.Enabled = false;
        // TODO: btnConfirmHist.Enabled = false;

        // TODO: PreviewButton = false;
        // TODO: PrintButton = false;

        $("#btnAddRow").attr("disabled", "true");
        $("#btnDeleteRow").attr("disabled", "true");
        $("#btnCreateLine").attr("disabled", "true");

        SBUxMethod.set("KEY_ID", "1");

        $("#RULE_CODE").attr('disabled', 'true');
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

    const fn_save = async function () {}

    const fn_delete = async function () {}

    const fn_search = async function () {
        if(!SBUxMethod.validateRequired() && !validateRequired()) {
            return false;
        }

        let DOC_BATCH_NO = gfnma_nvl(SBUxMethod.get("DOC_BATCH_NO"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            IV_P_DOC_BATCH_NO : DOC_BATCH_NO,
            V_P_DOC_NUM : 0,
            V_P_DOC_ID : 0,
            V_P_DOC_DATE : '',
            V_P_CURRENCY_CODE : '',
            V_P_PAY_METHOD : '',
            V_P_CS_CODE : '',
            V_P_RULE_CODE : '',
            V_P_SOURCE_TYPE : strsourceType,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/fi/far/rec/selectFig3510List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '10',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;
        console.log('data:', listData);

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                jsonAccountLineList.length = 0;

                var formData = listData.cv_2[0];

               /* const msg = {
                    KEY_ID : item.KEY_ID,
                    ACCT_RULE_CODE : item.ACCT_RULE_CODE,
                    FI_ORG_CODE : item.FI_ORG_CODE,
                    SITE_CODE : item.SITE_CODE,
                    DEPT_CODE : item.DEPT_CODE,
                    DEPT_NAME : item.DEPT_NAME,
                    DOC_ID : item.DOC_ID,
                    DOC_TYPE : item.DOC_TYPE,
                    DOC_DATE : item.DOC_DATE,
                    CS_CODE : item.CS_CODE,
                    CS_NAME : item.CS_NAME,
                    BIZ_REGNO : item.BIZ_REGNO,
                    DOC_NAME : item.DOC_NAME,
                    DOC_NUM : item.DOC_NUM,
                    CURRENCY_CODE : item.CURRENCY_CODE,
                    EXCHANGE_RATE : item.EXCHANGE_RATE,
                    BASE_SCALE : item.BASE_SCALE,
                    VAT_CODE : item.VAT_CODE,
                    DOC_AMT : item.DOC_AMT,
                    PAY_METHOD : item.PAY_METHOD,
                    PAY_TERM_CODE : item.PAY_TERM_CODE,
                    PAY_TERM_NAME : item.PAY_TERM_NAME,
                    VAT_AMOUNT : item.VAT_AMOUNT,
                    STANDARD_DATE : item.STANDARD_DATE,
                    SUPPLY_AMT : item.SUPPLY_AMT,
                    DESCRIPTION : item.DESCRIPTION,
                    PAY_BASE_DATE : item.PAY_BASE_DATE,
                    EXPECTED_PAY_DATE : item.EXPECTED_PAY_DATE,
                    BASIS_TYPE : item.BASIS_TYPE,
                    DIFF_DAY : item.DIFF_DAY,
                    BILL_DUE_DATE : item.BILL_DUE_DATE,
                    BILL_DUE_DAY : item.BILL_DUE_DAY,
                    BILL_DUE_PAY_DATE : item.BILL_DUE_PAY_DATE,
                    VOUCHER_RECEIPT_DATE : item.VOUCHER_RECEIPT_DATE,
                    VOUCHER_TYPE : item.VOUCHER_TYPE,
                    VOUCHER_NO : item.VOUCHER_NO,
                    PAYEE_CODE : item.PAYEE_CODE,
                    PAYEE_NAME : item.PAYEE_NAME,
                    APPROVE_DATE : item.APPROVE_DATE,
                    FINAL_APPROVER : item.FINAL_APPROVER,
                    DOC_STATUS : item.DOC_STATUS,
                    ACCT_OPINION : item.ACCT_OPINION,
                    TR_OPINION : item.TR_OPINION,
                    POSTING_DATE : item.POSTING_DATE,
                    POSTING_USER : item.POSTING_USER,
                    UNPOSTING_DATE : item.UNPOSTING_DATE,
                    UNPOSTING_USER : item.UNPOSTING_USER,
                    REGISTER_YN : item.REGISTER_YN,
                    APPR_COUNT : item.APPR_COUNT,
                    APPR_ID : item.APPR_ID,
                    INSERT_USERID : item.INSERT_USERID,
                    CONFIRM_EMP_CODE : item.CONFIRM_EMP_CODE,
                    PROXY_EMP_CODE : item.PROXY_EMP_CODE,
                    TEMP_AREA : item.TEMP_AREA,
                    BANK_ACCOUNT_SEQ : item.BANK_ACCOUNT_SEQ,
                    BANK_CODE : item.BANK_CODE,
                    BANK_ACCOUNT_NO : item.BANK_ACCOUNT_NO,
                    BANK_ACCOUNT_DESCRIPTION : item.BANK_ACCOUNT_DESCRIPTION,
                    TAX_SITE_CODE : item.TAX_SITE_CODE,
                    SUB_TAX_SITE_CODE : item.SUB_TAX_SITE_CODE,
                    APPLY_COMPLETE_FLAG : item.APPLY_COMPLETE_FLAG,
                    REVERSE_FLAG : item.REVERSE_FLAG,
                    REVERSE_DOC_NAME : item.REVERSE_DOC_NAME,
                    REVERSE_DOC_ID : item.REVERSE_DOC_ID,
                    ORIG_DOC_ID : item.ORIG_DOC_ID,
                    HEADER_COST_CENTER : item.HEADER_COST_CENTER,
                    REQUEST_EMP : item.REQUEST_EMP,
                    REQUEST_EMP_CODE : item.REQUEST_EMP_CODE,
                    BEFORE_APPR_EMP : item.BEFORE_APPR_EMP,
                    BEFORE_APPR_EMP_CODE : item.BEFORE_APPR_EMP_CODE,
                    BEFORE_PROXY_EMP_CODE : item.BEFORE_PROXY_EMP_CODE,
                    NEXT_APPR_EMP : item.NEXT_APPR_EMP,
                    BILL_NO : item.BILL_NO
                }*/

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

                if (gfnma_nvl(SBUxMethod.get("DOC_NAME")) != "") {
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
</script>