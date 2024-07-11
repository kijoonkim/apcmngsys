<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body oncontextmenu="return false">
<style>
    /*.left-section, .right-section {
        display: flex;
        align-items: center;
    }
    .ad_tbl_toplist .dropdown {
        margin-left: 5px;
    }
    .ad_tbl_toplist .form-control, .ad_tbl_toplist .btn, .ad_tbl_toplist span {
        margin-left: 5px;
    }*/
</style>
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
                            <div style="display: flex; align-items: center; justify-content: start; width: 20%;">
                            <span>전표템플릿</span>
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="RULE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="RULE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                                <sbux-checkbox uitype="normal" id="CLOSE_YN" name="CLOSE_YN" uitype="normal" class="form-control input-sm check" text="역분개라인생성" true-value="Y" false-value="N"/>
                            </div>
                            <div style="display: flex; align-items: center; justify-content: start; width: 20%;">
                                <span>세금계산서</span>
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
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">거래처</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-input id="CS_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
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
                                <th scope="row" class="th_bg">지급기준</th>
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
                                <th scope="row" class="th_bg">지급방법</th>
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
                                        <div class="dropdown-menu" aria-labelledby="CURRENCY_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                        </div>
                                    </div>
                                </td>
                                <td colspan="2" class="td_input" style="border-right:hidden;">
                                    <sbux-input id="EXCHANGE_RATE" uitype="text" placeholder="" class="form-control input-sm" mask="{'alias': 'numeric'}"></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">지급기산일자</th>
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
                                        <div class="dropdown-menu" aria-labelledby="VAT_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                        </div>
                                    </div>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg">지급만기일자</th>
                                <td class="td_input" style="border-right:hidden;">
                                    <sbux-datepicker
                                            uitype="popup"
                                            id="EXPECTED_PAY_DATE"
                                            name="EXPECTED_PAY_DATE"
                                            date-format="yyyy-mm-dd"
                                            class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                            style="width:100%;"
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
                                        <div class="dropdown-menu" aria-labelledby="BANK_ACCOUNT_SEQ" style="width:300px;height:150px;padding-top:0px;overflow:auto">
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
                                                    <div class="dropdown-menu" aria-labelledby="ETAX_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
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
                                                    <div class="dropdown-menu" aria-labelledby="CARD_USE_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
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
                                                    <div class="dropdown-menu" aria-labelledby="LOCAL_CREDIT_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
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
                                                    <div class="dropdown-menu" aria-labelledby="VAT_NOT_DEDUCTION_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
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
                                                    <div class="dropdown-menu" aria-labelledby="REPORT_OMIT_YN" style="width:300px;height:150px;padding-top:0px;overflow:auto">
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
                                                    <div class="dropdown-menu" aria-labelledby="DUP_ISSUE_BILL_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
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
                                                    <div class="dropdown-menu" aria-labelledby="VAT_ASSET_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
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
                                                    <div class="dropdown-menu" aria-labelledby="AFTER_DUE_DATE_YN" style="width:300px;height:150px;padding-top:0px;overflow:auto">
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
                                                    <div class="dropdown-menu" aria-labelledby="ZERO_REPORT_YN" style="width:300px;height:150px;padding-top:0px;overflow:auto">
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
                                                    <div class="dropdown-menu" aria-labelledby="EXCLUDE_REVENUE_AMT_YN" style="width:300px;height:150px;padding-top:0px;overflow:auto">
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
                                                    <div class="dropdown-menu" aria-labelledby="ZERO_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
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
                                                        onclick="fn_findAccItem(3)"
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
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
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
    var strsource_type ="<%=request.getParameter("sourceType")%>";
    var p_fiOrgCode = "${loginVO.fiOrgCode}";
    //-----------------------------------------------------------
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
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();
        $("#apcSelectMa").hide();
        SBUxMethod.set("SRCH_DOC_H_FI_ORG_CODE",p_fiOrgCode);
        SBUxMethod.set("SRCH_SITE_CODE",'');
        SBUxMethod.set("SRCH_PERIOD_YYYYMM",gfn_dateToYm(new Date()));
        SBUxMethod.set("SRCH_TXN_DATE_FROM",gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("SRCH_TXN_DATE_TO", gfn_dateLastYmd(new Date()));
        SBUxMethod.set("SRCH_REVERSE_FLAG", "Y");
        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);

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
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'TAX_SITE_CODE'
                ,colLabel		: 'TAX_SITE_NAME'
                ,columns		:[
                    {caption: "신고사업장코드",		ref: 'TAX_SITE_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "신고사업장명", 		ref: 'TAX_SITE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 전표구분
            gfnma_setComSelect(['DOC_TYPE'], jsonDocType, 'L_FIM051', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
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
                ,whereClause	: ''
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
                ,dropAlign		: 'right' 	// left, right
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
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
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
            // 계좌정보
            gfnma_multiSelectInit({
                target			: ['#BANK_ACCOUNT_SEQ']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_CS_ACCOUNT'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
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
            // 전표템플릿
            gfnma_multiSelectInit({
                target			: ['#RULE_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_RULE'
                ,whereClause	: ''
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
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'40px',  	style:'text-align:left'},
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
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'40px',  	style:'text-align:left'},
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
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'40px',  	style:'text-align:left'},
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
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'40px',  	style:'text-align:left'},
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
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'40px',  	style:'text-align:left'},
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
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'40px',  	style:'text-align:left'},
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
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'40px',  	style:'text-align:left'},
                    {caption: "자산구분", 		ref: 'CODE_NAME',    		width:'50px',  	style:'text-align:left'}
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
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'40px',  	style:'text-align:left'},
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
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'40px',  	style:'text-align:left'},
                    {caption: "해당여부", 		ref: 'CODE_NAME',    		width:'80px',  	style:'text-align:left'}
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
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'40px',  	style:'text-align:left'},
                    {caption: "해당여부", 		ref: 'CODE_NAME',    		width:'80px',  	style:'text-align:left'}
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
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'40px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
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
            {caption: ["부가세유형코드"], 	        ref: 'VAT_TYPE',    	        type:'output',  	width:'72px',  	style:'text-align:left', hidden: true}, // TODO : P_ACCOUNT_POPUP_Q
            {caption: ["부가세유형"], 	        ref: 'VAT_NAME',    	        type:'output',  	width:'184px',  	style:'text-align:left'}, // TODO : P_ACCOUNT_POPUP_Q
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
        //gvwWFItem.bind('click', 'fn_view');
    }

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createGvwWFItemGrid();
        //fn_search();
    });
</script>