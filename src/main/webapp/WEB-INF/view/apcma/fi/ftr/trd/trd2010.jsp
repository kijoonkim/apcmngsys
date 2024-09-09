<%
    /**
     * @Class Name 		: trd2010.jsp
     * @Description 	: 예적금원장등록 화면
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
    <title>title : 예적금원장등록</title>
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
					<sbux-button id="btnDocCopy" name="btnDocCopy" uitype="normal" class="btn btn-sm btn-outline-danger" text="복사" onclick="fn_docCopy"></sbux-button>
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
                        <col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 3%">
                    </colgroup>
                    <tbody>
						<tr>
							<th scope="row" class="th_bg">사업단위</th>
							<td class="td_input" style="border-right:hidden;">
								<div class="dropdown">
									<button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<font>선택</font>
										<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
									</button>
									<div class="dropdown-menu" aria-labelledby="SRCH_FI_ORG_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">조회기준일자</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-datepicker
										uitype="popup"
										id="SRCH_BASE_DATE"
										name="SRCH_BASE_DATE"
										date-format="yyyy-mm-dd"
										class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
										style="width:100%;"
								/>
							</td>
                            <th scope="row" class="th_bg">만기예적금포함여부</th>
                            <td class="td_input" style="border-right:hidden;">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_ALL_YN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SRCH_ALL_YN" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
                            </td>
						</tr>
						 <tr>
							<th scope="row" class="th_bg">예적금유형</th>
							<td class="td_input" style="border-right:hidden;">
                                <div class="dropdown">
                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_DEPOSIT_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <font>선택</font>
                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="SRCH_DEPOSIT_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                    </div>
                                </div>
							</td>
                            <th scope="row" class="th_bg">금융기관</th>
                            <td class="td_input">
                                 <sbux-input id="SRCH_BANK_CODE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                            </td>
                            <td class="td_input">
                                <sbux-input id="SRCH_BANK_CS_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findBankCode"
                                ></sbux-button>
                            </td>
						</tr>
                    </tbody>
                </table>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>예적금</span>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                    <div id="sb-area-gvwInfo" style="height:150px;"></div>
                </div>
                <div class="row">
                    <div>
                        <sbux-tabs id="idxTabMaster" name="idxTabMaster" uitype="normal" is-scrollable="false" jsondata-ref="jsonMasterTabData">
                        </sbux-tabs>
                        <div class="tab-content">
                            <div id="tabBase">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li><span>기본정보</span></li>
                                    </ul>
                                </div>
                                <div>
                                    <table class="table table-bordered tbl_fixed">
                                        <caption>기본정보</caption>
                                        <colgroup>
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 3%">
                                            <col style="width: 7%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" class="th_bg">사업단위</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="FI_ORG_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row" class="th_bg">예적금번호</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="DEPOSIT_NUM" class="form-control input-sm input-sm-ast" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">계좌번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACCOUNT_NUM" class="form-control input-sm input-sm-ast" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">예금주</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ACCOUNT_OWNER" class="form-control input-sm input-sm-ast" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">예적금명</th>
                                            <td colspan="4" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="DEPOSIT_NAME" class="form-control input-sm input-sm-ast" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">예적금유형</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="DEPOSIT_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="DEPOSIT_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row" class="th_bg">분류1</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="DEPOSIT_CATEGORY1" class="form-control input-sm input-sm-ast" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">분류2</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="DEPOSIT_CATEGORY2" class="form-control input-sm input-sm-ast" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">분류3</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="DEPOSIT_CATEGORY3" class="form-control input-sm input-sm-ast" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">금융기관</th>
                                            <td class="td_input">
                                                <sbux-input id="BANK_CS_CODE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="BANK_CS_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findBankCsCode"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">은행</th>
                                            <td class="td_input">
                                                <sbux-input id="BANK_CODE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="BANK_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findBankCode"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">은행입금계좌</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PAY_SEQ" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="PAY_SEQ" style="width:1010px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-select id="BANK_CODE" uitype="single" jsondata-ref="jsonBankCode" unselected-text="선택" class="form-control input-sm" readonly></sbux-select>
                                            </td>
                                            <td colspan="2" class="td_input">
                                                <sbux-input id="BANK_ACCOUNT_NO" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="BANK_ACCOUNT_DESCRIPTION" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
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
                                            <th scope="row" class="th_bg">환율</th>
                                            <td colspan="2" class="td_input">
                                                <sbux-input id="EXCHANGE_RATE" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true}"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">예적금액(원래)</th>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_AMT" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true}"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">예적금액(환산)</th>
                                            <td colspan="2" class="td_input">
                                                <sbux-input id="DEPOSIT_AMT_KRW" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true}"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">입금계좌</th>
                                            <td class="td_input">
                                                <sbux-input id="IN_DEPOSIT_CODE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="IN_DEPOSIT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findInDeposit"
                                                ></sbux-button>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="IN_ACCOUNT_NUM" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">출금계좌</th>
                                            <td class="td_input">
                                                <sbux-input id="OUT_DEPOSIT_CODE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="OUT_DEPOSIT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findOutDeposit"
                                                ></sbux-button>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="OUT_ACCOUNT_NUM" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">가입일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="DEPOSIT_DATE"
                                                        name="DEPOSIT_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">만기일</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="DUE_DATE"
                                                        name="DUE_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">총가입일수(일)</th>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_DAY" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">예적금상태</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="DEPOSIT_STATUS" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="DEPOSIT_STATUS" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">적요</th>
                                            <td colspan="4" class="td_input">
                                                <sbux-input id="DESCR" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">예적금불입기준</th>
                                            <td class="td_input">
                                                <sbux-checkbox
                                                        uitype="normal"
                                                        id="IN_PREAUTH_PAY_YN"
                                                        name="IN_PREAUTH_PAY_YN"
                                                        uitype="normal"
                                                        class="form-control input-sm"
                                                        text="자동이체여부"
                                                        true-value="Y" false-value="N"
                                                />
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div id="tabAccount">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li><span>계정과목 정보</span></li>
                                    </ul>
                                </div>
                                <div>
                                    <table class="table table-bordered tbl_fixed">
                                        <caption>계정과목 정보</caption>
                                        <colgroup>
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 3%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" class="th_bg">예적금계정</th>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_ACCOUNT" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findDepositAccount"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">선수수익계정</th>
                                            <td class="td_input">
                                                <sbux-input id="ADVANCE_INCOME_ACCOUNT" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="ADVANCE_ACC_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAdvanceIncomeAccount"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">미수수익계정</th>
                                            <td class="td_input">
                                                <sbux-input id="ACCRUED_INCOME_ACCOUNT" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="ACCRUED_INCOME_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccruedIncomeAccount"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">선급법인세계정</th>
                                            <td class="td_input">
                                                <sbux-input id="CTAX_WITHHOLD_ACCOUNT" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="CTAX_WITHHOLD_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findCtaxWithholdAccount"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">선급지방소득세계정</th>
                                            <td class="td_input">
                                                <sbux-input id="PTAX_WITHHOLD_ACCOUNT" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="PTAX_WITHHOLD_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findPtaxWithholdAccount"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">현재가치할인차금계정</th>
                                            <td class="td_input">
                                                <sbux-input id="PRESENT_VALUE_ACCOUNT" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="PRESENT_VALUE_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findPresentValueAccount"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">유동성대체계정</th>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_LIQUID_ACCOUNT" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_LIQUID_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findDepositLiquidAccount"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div id="tabInfo">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li><span>불입정보</span></li>
                                    </ul>
                                </div>
                                <div>
                                    <table class="table table-bordered tbl_fixed">
                                        <caption>불입정보</caption>
                                        <colgroup>
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 3%">
                                            <col style="width: 7%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" class="th_bg">불입계좌</th>
                                            <td class="td_input">
                                                <sbux-input id="PAY_DEPOSIT_CODE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="PAY_DEPOSIT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findPayDepositCode"
                                                ></sbux-button>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="PAY_ACCOUNT_NUM" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">불입조건</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="IN_TERM" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="IN_TERM" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row" class="th_bg">불입주기(개월)</th>
                                            <td colspan="2" class="td_input">
                                                <sbux-input id="IN_CYCLE_MM" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">최초불입일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="IN_START_DATE"
                                                        name="IN_START_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            </td>
                                            <th scope="row" class="th_bg">최초불입액</th>
                                            <td colspan="2" class="td_input">
                                                <sbux-input id="IN_FIRST_AMT" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>

                                            <th scope="row" class="th_bg">1회불입액</th>
                                            <td class="td_input">
                                                <sbux-input id="IN_PER_AMT" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">불입일</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="IN_DD" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="IN_DD" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">불입기준</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="IN_BASE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="IN_BASE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row" class="th_bg">단복리 구분</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INTEREST_CALC_METHOD" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="INTEREST_CALC_METHOD" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">이자율구분</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INTEREST_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="INTEREST_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row" class="th_bg">약정이율</th>
                                            <td colspan="2" class="td_input">
                                                <sbux-input id="INTEREST_RATE" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">이자수취기준</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INTEREST_IN_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="INTEREST_IN_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row" class="th_bg">이자일수계산기준</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INTEREST_CALC_DAYS_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="INTEREST_CALC_DAYS_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">이자발생주기(개월)</th>
                                            <td class="td_input">
                                                <sbux-input id="INTEREST_IN_CYCLE_MM" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">년간이자일수</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INTEREST_CALC_YEAR_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="INTEREST_CALC_YEAR_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">이자최초발생일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="INTEREST_IN_START_DATE"
                                                        name="INTEREST_IN_START_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">이자발생일</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INTEREST_IN_DD" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="INTEREST_IN_DD" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">법인세율</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="CTAX_RATE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="CTAX_RATE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row" class="th_bg">지방소득세율</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PTAX_RATE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="PTAX_RATE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">유효이자율</th>
                                            <td class="td_input">
                                                <sbux-input id="EFFECTIVE_INTEREST_RATE" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true}"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">현재가치할인차금</th>
                                            <td colspan="2" class="td_input">
                                                <sbux-input id="DEPOSIT_DISCOUNT_AMT" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true}"></sbux-input>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div id="tabHistory">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li><span>이율변동정보</span></li>
                                    </ul>
                                    <div class="ad_tbl_toplist">
                                        <sbux-button id="btn_addRowForGvwHistory" name="btn_addRowForGvwHistory" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwHistory"></sbux-button>
                                        <sbux-button id="btn_delRowForGvwHistory" name="btn_delRowForGvwHistory" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwHistory"></sbux-button>
                                    </div>
                                </div>
                                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                                    <div id="sb-area-gvwHistory" style="height:650px;"></div>
                                </div>
                            </div>
                            <div id="tabPlan">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li><span>불입계획</span></li>
                                    </ul>
                                    <div class="ad_tbl_toplist">
                                        <sbux-button id="btn_addRowForGvwPlan" name="btn_addRowForGvwPlan" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwPlan"></sbux-button>
                                        <sbux-button id="btn_delRowForGvwPlan" name="btn_delRowForGvwPlan" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwPlan"></sbux-button>
                                    </div>
                                </div>
                                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                                    <div id="sb-area-gvwPlan" style="height:650px;"></div>
                                </div>
                            </div>
                            <div id="tabAmortize">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li><span>현재가치관리</span></li>
                                    </ul>
                                    <div class="ad_tbl_toplist">
                                        <sbux-button id="btnAmRecalc" name="btnAmRecalc" uitype="normal" text="재계산" class="btn btn-sm btn-outline-danger" onclick="fn_amRecalc" style="float: right;"></sbux-button>
                                        <sbux-button id="btnAmortize" name="btnAmortize" uitype="normal" text="최초 상각스케줄" class="btn btn-sm btn-outline-danger" onclick="fn_amortize" style="float: right;"></sbux-button>
                                    </div>
                                </div>
                                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                                    <div id="sb-area-gvwAmortize" style="height:650px;"></div>
                                </div>
                            </div>
                            <div id="tabPL">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li><span>손익계정</span></li>
                                    </ul>
                                </div>
                                <div>
                                    <table class="table table-bordered tbl_fixed">
                                        <caption>손익계정</caption>
                                        <colgroup>
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 3%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" class="th_bg">이자수익계정</th>
                                            <td class="td_input">
                                                <sbux-input id="INTEREST_INCOME_ACCOUNT" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="INTEREST_INCOME_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findInterestIncomeAccount"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">환차익계정</th>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_GAIN_ACC" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_GAIN_ACC_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findExchangeGainAcc"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">환차손계정</th>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_LOSS_ACC" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_LOSS_ACC_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findExchangeLossAcc"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">환평가이익계정</th>
                                            <td class="td_input">
                                                <sbux-input id="VAL_GAIN_ACC" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="VAL_GAIN_ACC_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findValGainAcc"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">환평가손실계정</th>
                                            <td class="td_input">
                                                <sbux-input id="VAL_LOSS_ACC" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="VAL_LOSS_ACC_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findValLossAcc"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div id="tabTreasury">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li><span>자금수지</span></li>
                                    </ul>
                                </div>
                                <div>
                                    <table class="table table-bordered tbl_fixed">
                                        <caption>자금수지</caption>
                                        <colgroup>
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 3%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" class="th_bg">예금이체입금</th>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_START_TR_TYPE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_START_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findDepositStartTrType"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">예금이체출금</th>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_IN_TR_TYPE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_IN_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findDepositInTrType"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">이자수익</th>
                                            <td class="td_input">
                                                <sbux-input id="INTEREST_IN_TR_TYPE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="INTEREST_IN_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findInterestInTrType"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">법인세원천징수</th>
                                            <td class="td_input">
                                                <sbux-input id="CTAX_WITHHOLD_TR_TYPE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="CTAX_WITHHOLD_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findCtaxWithholdTrType"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">지방소득세원천징수</th>
                                            <td class="td_input">
                                                <sbux-input id="PTAX_WITHHOLD_TR_TYPE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="PTAX_WITHHOLD_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findPtaxWithholdTrType"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div id="tabTreasuryF">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li><span>자금수지(외화)</span></li>
                                    </ul>
                                </div>
                                <div>
                                    <table class="table table-bordered tbl_fixed">
                                        <caption>자금수지(외화)</caption>
                                        <colgroup>
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 3%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" class="th_bg">환차익</th>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_GAIN_TR_TYPE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_GAIN_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findExchangeGainTrType"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">환차손</th>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_LOSS_TR_TYPE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_LOSS_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findExchangeLossTrType"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div id="tabDept">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li><span>조직정보</span></li>
                                    </ul>
                                </div>
                                <div>
                                    <table class="table table-bordered tbl_fixed">
                                        <caption>계정과목 정보</caption>
                                        <colgroup>
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 10%">
                                            <col style="width: 3%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" class="th_bg">부서</th>
                                            <td class="td_input">
                                                <sbux-input id="DEPT_CODE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="DEPT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
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
                                            <th scope="row" class="th_bg">원가중심점</th>
                                            <td class="td_input">
                                                <sbux-input id="COST_CENTER_CODE" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="COST_CENTER_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findCostCenterCode"
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

<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_empCd = '${loginVO.maEmpCode}';
    var p_fiOrgCode = "${loginVO.maFIOrgCode}";
    //-----------------------------------------------------------

    var jsonBankCode = []; // 은행코드
    var jsonCurrencyCode = []; // 통화코드
    var jsonFiOrgCode = []; // 사업단위
    var jsonBankCsCode = []; // 금융기관코드
    var jsonDepositType = []; // 예적금유형

    //grid 초기화
    var gvwInfo; 			// 그리드를 담기위한 객체 선언
    var gvwHistory;
    var gvwPlan;
    var gvwAmortize;

    var jsonDepositList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonInterestRateHistoryList = [];
    var jsonPaymentPlanList = [];
    var jsonPresentValueList = [];

    // Tab Data
    var jsonMasterTabData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "기본 정보", "targetid" : "tabBase", "targetvalue" : "기본 정보" },
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "계정과목 정보", "targetid" : "tabAccount", "targetvalue" : "계정과목 정보" },
        { "id" : "2", "pid" : "-1", "order" : "3", "text" : "불입정보", "targetid" : "tabInfo", "targetvalue" : "불입정보" },
        { "id" : "3", "pid" : "-1", "order" : "4", "text" : "이율변동정보", "targetid" : "tabHistory", "targetvalue" : "이율변동정보" },
        { "id" : "4", "pid" : "-1", "order" : "5", "text" : "불입계획", "targetid" : "tabPlan", "targetvalue" : "계정과목 정보" },
        { "id" : "5", "pid" : "-1", "order" : "6", "text" : "현재가치관리", "targetid" : "tabAmortize", "targetvalue" : "현재가치관리" },
        { "id" : "6", "pid" : "-1", "order" : "7", "text" : "손익계정", "targetid" : "tabPL", "targetvalue" : "손익계정" },
        { "id" : "7", "pid" : "-1", "order" : "8", "text" : "자금수지", "targetid" : "tabTreasury", "targetvalue" : "자금수지" },
        { "id" : "8", "pid" : "-1", "order" : "9", "text" : "자금수지(외화)", "targetid" : "tabTreasuryF", "targetvalue" : "자금수지(외화)" },
        { "id" : "9", "pid" : "-1", "order" : "10", "text" : "조직정보", "targetid" : "tabDept", "targetvalue" : "계정과목 정보" },
    ];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['gvwInfo'], jsonFiOrgCode, 'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_FI_ORG_CODE', '#FI_ORG_CODE']
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
            // 만기예적금포함여부
            gfnma_multiSelectInit({
                target			: ['#SRCH_ALL_YN']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIF016'
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
                    {caption: "출금방법", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 예적금유형
            gfnma_setComSelect(['gvwInfo'], jsonDepositType, 'L_FIF040', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_DEPOSIT_TYPE', '#DEPOSIT_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIF040'
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
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'}
                ]
            }),
            // 계좌행번
            gfnma_multiSelectInit({
                target: ['#PAY_SEQ']
                , compCode: gv_ma_selectedApcCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_CS_ACCOUNT'
                , whereClause: "AND a.cs_code = '" + gfn_nvl(SBUxMethod.get("CS_CODE")) + "' AND '" + gfn_nvl(SBUxMethod.get("EXPECTED_PAY_DATE")) + "' BETWEEN a.effect_start_date AND a.effect_end_date"
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
                    if (!bQuery) return;

                    SBUxMethod.set('BANK_CODE', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BANK_CODE"]);
                    SBUxMethod.set('BANK_ACCOUNT_NO', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BANK_ACCOUNT_NO"]);
                    SBUxMethod.set('BANK_ACCOUNT_DESCRIPTION', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["DESCRIPTION"]);
                }
            }),
            // 은행코드
            gfnma_setComSelect(['BANK_CODE'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 통화
            gfnma_multiSelectInit({
                target: ['#CURRENCY_CODE']
                , compCode: gv_ma_selectedApcCd
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
                        $("#EXCHANGE_RATE").attr('disabled', 'false');
                        gvwWFItem.setColDisabled(gvwWFItem.getColRef("FUNCTIONAL_AMT"), false, true);
                    }

                    SBUxMethod.set("BASE_SCALE", parseInt(jsonCurrencyCode.filter(data => data["CURRENCY_CODE"] == value)[0]["BASE_SCALE"]));

                    fn_getExchange();
                }
            }),
            // 예적금유형
            gfnma_multiSelectInit({
                target			: ['#DEPOSIT_STATUS']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIF002'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'up' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "예적금상태", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 예적금유형
            gfnma_multiSelectInit({
                target			: ['#IN_TERM']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIF042'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "명칭", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 불입일
            gfnma_multiSelectInit({
                target			: ['#IN_DD', '#INTEREST_IN_DD']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_COM010'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'up' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "결제일", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 불입기준
            gfnma_multiSelectInit({
                target			: ['#IN_BASE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIF017'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "상환기준일", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 단복리 구분
            gfnma_multiSelectInit({
                target			: ['#INTEREST_CALC_METHOD']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIF041'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "단복리구분", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 이자율 구분
            gfnma_multiSelectInit({
                target			: ['#INTEREST_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIF006'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "이자율구분", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 이자율 구분
            gfnma_multiSelectInit({
                target			: ['#INTEREST_IN_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIF007'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "이자지급기준", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 이자율 구분
            gfnma_multiSelectInit({
                target			: ['#INTEREST_CALC_DAYS_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIF008'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "이자계산일수기준", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 이자율 구분
            gfnma_multiSelectInit({
                target			: ['#INTEREST_CALC_YEAR_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIF039'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'up' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "명칭", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 법인세율
            gfnma_multiSelectInit({
                target			: ['#CTAX_RATE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIF050'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'up' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "명칭", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 지방세율
            gfnma_multiSelectInit({
                target			: ['#PTAX_RATE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_FIF051'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'up' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드", ref: 'SUB_CODE', width: '50px', style: 'text-align:left'},
                    {caption: "명칭", ref: 'CODE_NAME', width: '100px', style: 'text-align:left'}
                ]
            }),
            // 통화코드
            gfnma_setComSelect(['gvwInfo', 'gvwPlan', 'gvwAmortize'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 금융기관코드
            gfnma_setComSelect(['gvwInfo'], jsonBankCsCode, 'L_CS_BANK', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CS_CODE', 'BANK_CS_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwInfo';
        SBGridProperties.id 				= 'gvwInfo';
        SBGridProperties.jsonref 			= 'jsonDepositList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["예적금번호"],         ref: 'DEPOSIT_NUM',    type:'output',  	width:'144px',  style:'text-align:left'},
            {caption: ["사업단위"], 		ref: 'FI_ORG_CODE',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonFiOrgCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["금융기관"], 		ref: 'BANK_CS_CODE',   	    type:'combo', style:'text-align:left' ,width: '198px',
                typeinfo: {
                    ref			: 'jsonBankCsCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["예적금유형"], 		ref: 'DEPOSIT_TYPE',   	    type:'combo', style:'text-align:left' ,width: '198px',
                typeinfo: {
                    ref			: 'jsonDepositType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["계좌번호"],         ref: 'ACCOUNT_NUM',    type:'output',  	width:'137px',  style:'text-align:left'},
            {caption: ["예금주"],         ref: 'ACCOUNT_OWNER',    type:'output',  	width:'127px',  style:'text-align:left'},
            {caption: ["예적금명"],         ref: 'DEPOSIT_NAME',    type:'output',  	width:'248px',  style:'text-align:left'},
            {caption: ["통화"], 		ref: 'CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["계약금액"],         ref: 'DEPOSIT_AMT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["불입금액(원래)"],         ref: 'IN_AMT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["잔액"],         ref: 'REMAIN_AMT',    type:'output',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
                , hidden: true
            },
            {caption: ["가입일"],       ref: 'DEPOSIT_DATE', 		type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["만기일"],       ref: 'DUE_DATE', 		type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["가입일수"],         ref: 'DEPOSIT_DAY',    type:'output',  	width:'75px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {caption: ["약정이율"],         ref: 'INTEREST_RATE',    type:'output',  	width:'75px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["분류1"],         ref: 'deposit_category1',    type:'output',  	width:'100px',  style:'text-align:left', hidden: true},
            {caption: ["분류2"],         ref: 'deposit_category2',    type:'output',  	width:'100px',  style:'text-align:left', hidden: true},
            {caption: ["분류3"],         ref: 'deposit_category3',    type:'output',  	width:'100px',  style:'text-align:left', hidden: true},
        ];

        gvwInfo = _SBGrid.create(SBGridProperties);
        gvwInfo.bind('click', 'fn_view');
    }

    const fn_view = async function () {}

    function fn_createGvwHistoryGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwHistory';
        SBGridProperties.id 				= 'gvwHistory';
        SBGridProperties.jsonref 			= 'jsonInterestRateHistoryList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["예적금번호"],         ref: 'DEPOSIT_NUM',    type:'input',  	width:'100px',  style:'text-align:left'},
            {caption: ["순번"],         ref: 'SEQ',    type:'output',  	width:'46px',  style:'text-align:left'},
            {caption: ["적용시작일"],       ref: 'APPLY_START_DATE', 		type:'datepicker',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["적용종료일"],       ref: 'APPLY_END_DATE', 		type:'datepicker',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["이자율(%)"],         ref: 'INTEREST_RATE',    type:'output',  	width:'100px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.000', emptyvalue:'0.000'}
            },
            {caption: ["확정여부"],   ref: 'CONFIRM_FLAG', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["적요"],         ref: 'DESCR',    type:'input',  	width:'228px',  style:'text-align:left'},
            {caption: ["TXN_ID"],         ref: 'TXN_ID',    type:'input',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        gvwHistory = _SBGrid.create(SBGridProperties);
    }

    function fn_createGvwPlanGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwPlan';
        SBGridProperties.id 				= 'gvwPlan';
        SBGridProperties.jsonref 			= 'jsonPaymentPlanList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["예적금번호"],         ref: 'DEPOSIT_NUM',    type:'input',  	width:'100px',  style:'text-align:left'},
            {caption: ["계획연번"],         ref: 'PLAN_SEQ',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["불입예정일"],       ref: 'IN_PLAN_DATE', 		type:'datepicker',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["통화"], 		ref: 'CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["총불입액"],         ref: 'IN_TOTAL_AMT',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["예적금대체"],         ref: 'IN_TRANSFER_AMT',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["예적금불입예정액"],         ref: 'IN_PLAN_AMT',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["예적금잔액"],         ref: 'REMAIN_DEPOSIT_AMT',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["이자발생예정액"],         ref: 'INTEREST_IN_PLAN_AMT',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["이자율"],         ref: 'INTEREST_RATE',    type:'input',  	width:'70px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["이자일수"],         ref: 'INTEREST_DAY',    type:'input',  	width:'70px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["적용시작일"],       ref: 'INTEREST_FROM_DATE', 		type:'datepicker',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["적용종료일"],       ref: 'INTEREST_TO_DATE', 		type:'datepicker',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["확정여부"],   ref: 'CONFIRM_FLAG', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["전송여부"],   ref: 'INTERFACE_FLAG', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["완료여부"],   ref: 'COMPLETE_FLAG', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["TXN_ID"],         ref: 'TXN_ID',    type:'input',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        gvwPlan = _SBGrid.create(SBGridProperties);
    }

    function fn_createGvwAmortizeGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwAmortize';
        SBGridProperties.id 				= 'gvwAmortize';
        SBGridProperties.jsonref 			= 'jsonPresentValueList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["계획연번"],         ref: 'PLAN_SEQ',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["불입예정일"],       ref: 'IN_PLAN_DATE', 		type:'datepicker',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["통화"], 		ref: 'CURRENCY_CODE',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonCurrencyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["이자율"],         ref: 'INTEREST_RATE',    type:'input',  	width:'75px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["유효이자율"],         ref: 'EFFECTIVE_INTEREST_RATE',    type:'input',  	width:'100px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["예적금"],         ref: 'REMAIN_DEPOSIT_AMT',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["예적금불입액"],         ref: 'IN_PLAN_AMT',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["예적금대체"],         ref: 'IN_TRANSFER_AMT',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["유효이자"],         ref: 'EFFECTIVE_INTEREST_PLAN_AMT',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["액면이자"],         ref: 'INTEREST_IN_PLAN_AMT',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["상각액"],         ref: 'AMORTIZE_PLAN_AMT',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["장부가액"],         ref: 'DEPOSIT_BOOK_VALUE_AMT',    type:'input',  	width:'120px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["이자일수"],         ref: 'INTEREST_DAY',    type:'input',  	width:'70px',  style:'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}
                , format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
            },
            {caption: ["시작일자"],       ref: 'INTEREST_FROM_DATE', 		type:'datepicker',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["종료일자"],       ref: 'INTEREST_TO_DATE', 		type:'datepicker',  	width:'80px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["확정여부"],   ref: 'CONFIRM_FLAG', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["전송여부"],   ref: 'INTERFACE_FLAG', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["완료여부"],   ref: 'COMPLETE_FLAG', 		    type:'checkbox',  	width:'75px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
        ];

        gvwAmortize = _SBGrid.create(SBGridProperties);
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwInfoGrid();
        fn_createGvwHistoryGrid();
        fn_createGvwPlanGrid();
        fn_createGvwAmortizeGrid();
    });
</script>
<!-- inline scripts related to this page -->
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>