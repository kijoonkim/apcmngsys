<%
    /**
     * @Class Name 		: trd2020.jsp
     * @Description 	: 예적금만기스케쥴 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.09.09
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.09.09   	이경한		최초 생성
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
    <title>title : 예적금만기스케쥴</title>
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
                        <col style="width: 10%">
						<col style="width: 10%">
                        <col style="width: 1%">
						<col style="width: 9%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 3%">
                    </colgroup>
                    <tbody>
						<tr>
							<th scope="row" class="th_bg">사업단위</th>
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<div class="dropdown">
									<button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panHeader" required>
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
							<td colspan="2" class="td_input" style="border-right:hidden;">
								<sbux-datepicker
										uitype="popup"
										id="SRCH_BASE_DATE"
										name="SRCH_BASE_DATE"
										date-format="yyyy-mm-dd"
										class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast inpt_data_reqed"
										style="width:100%;"
                                        group-id="panHeader"
                                        required
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
							<td colspan="2" class="td_input" style="border-right:hidden;">
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
                                 <sbux-input id="SRCH_BANK_CS_CODE" class="form-control input-sm" uitype="text"></sbux-input>
                            </td>
                            <td class="td_input">
                                <sbux-input id="SRCH_BANK_CS_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findBankCsCode('SRCH_')"
                                ></sbux-button>
                            </td>
						</tr>
                        <tr>
                            <th scope="row" class="th_bg">거래일자</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="SRCH_TXN_DATE_FR"
                                        name="SRCH_TXN_DATE_FR"
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
                                        id="SRCH_TXN_DATE_TO"
                                        name="SRCH_TXN_DATE_TO"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                        style="width:100%;"
                                />
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
                        <sbux-tabs id="idxTabMaster" name="idxTabMaster" uitype="normal" is-scrollable="false" jsondata-ref="jsonTabData">
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
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="FI_ORG_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
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
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="DEPOSIT_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
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
                                            <td class="td_input" data-group="BANK_CS">
                                                <sbux-input id="BANK_CS_CODE" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input" data-group="BANK_CS">
                                                <sbux-input id="BANK_CS_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;" data-group="BANK_CS">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findBankCsCode('')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">은행</th>
                                            <td class="td_input">
                                                <sbux-input id="BANK_CODE" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="BANK_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
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
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="CURRENCY_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
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
                                                            mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true}" onchange="fn_changeExchangeRate(EXCHANGE_RATE)" required></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">예적금액(원래)</th>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_AMT" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true}" onchange="fn_changeDepositAmt(DEPOSIT_AMT)" required></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">예적금액(환산)</th>
                                            <td colspan="2" class="td_input">
                                                <sbux-input id="DEPOSIT_AMT_KRW" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{'alias': 'numeric', 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true}" required></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">입금계좌</th>
                                            <td class="td_input">
                                                <sbux-input id="IN_DEPOSIT_CODE" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="IN_DEPOSIT_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findDepositCode('IN')"
                                                ></sbux-button>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="IN_ACCOUNT_NUM" class="form-control input-sm" uitype="text" readonly></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">출금계좌</th>
                                            <td class="td_input">
                                                <sbux-input id="OUT_DEPOSIT_CODE" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="OUT_DEPOSIT_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findDepositCode('OUT')"
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
                                                        onchange="fn_changeDepositDate(DEPOSIT_DATE)"
                                                        required
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
                                                        onchange="fn_changeDueDate(DUE_DATE)"
                                                        required
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">총가입일수(일)</th>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_DAY" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }" required></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">예적금상태</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="DEPOSIT_STATUS" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
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
                                                <sbux-input id="DEPOSIT_ACCOUNT" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccountCode('DEPOSIT_ACCOUNT')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">선수수익계정</th>
                                            <td class="td_input">
                                                <sbux-input id="ADVANCE_INCOME_ACCOUNT" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="ADVANCE_INCOME_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccountCode('ADVANCE_INCOME_ACCOUNT')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">미수수익계정</th>
                                            <td class="td_input">
                                                <sbux-input id="ACCRUED_INCOME_ACCOUNT" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="ACCRUED_INCOME_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccountCode('ACCRUED_INCOME_ACCOUNT')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">선급법인세계정</th>
                                            <td class="td_input">
                                                <sbux-input id="CTAX_WITHHOLD_ACCOUNT" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="CTAX_WITHHOLD_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccountCode('CTAX_WITHHOLD_ACCOUNT')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">선급지방소득세계정</th>
                                            <td class="td_input">
                                                <sbux-input id="PTAX_WITHHOLD_ACCOUNT" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="PTAX_WITHHOLD_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccountCode('PTAX_WITHHOLD_ACCOUNT')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">현재가치할인차금계정</th>
                                            <td class="td_input">
                                                <sbux-input id="PRESENT_VALUE_ACCOUNT" class="form-control input-sm" uitype="text"></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="PRESENT_VALUE_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccountCode('PRESENT_VALUE_ACCOUNT')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">유동성대체계정</th>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_LIQUID_ACCOUNT" class="form-control input-sm" uitype="text"></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_LIQUID_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccountCode('DEPOSIT_LIQUID_ACCOUNT')"
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
                                                <sbux-input id="PAY_DEPOSIT_CODE" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="PAY_DEPOSIT_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findDepositCode('PAY')"
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
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="IN_TERM" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
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
                                                            mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }" required></sbux-input>
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
                                                        onchange="fn_changeInStartDate(IN_START_DATE)"
                                                        required
                                                />
                                            </td>
                                            </td>
                                            <th scope="row" class="th_bg">최초불입액</th>
                                            <td colspan="2" class="td_input">
                                                <sbux-input id="IN_FIRST_AMT" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }" required></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>

                                            <th scope="row" class="th_bg">1회불입액</th>
                                            <td class="td_input">
                                                <sbux-input id="IN_PER_AMT" class="form-control input-sm" uitype="text" style="width:100%"
                                                            mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }" required></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">불입일</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="IN_DD" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
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
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="IN_BASE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
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
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INTEREST_CALC_METHOD" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
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
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INTEREST_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
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
                                                            mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }" required></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">이자수취기준</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INTEREST_IN_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
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
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INTEREST_CALC_DAYS_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
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
                                                            mask="{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }" required></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">년간이자일수</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INTEREST_CALC_YEAR_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
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
                                                        onchange="fn_changeInterestInStartDate(INTEREST_IN_START_DATE)"
                                                        required
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">이자발생일</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INTEREST_IN_DD" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" required>
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
                                    <div id="sb-area-gvwHistory" style="height:450px;"></div>
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
                                        <sbux-button id="btnReCalc" name="btnReCalc" uitype="normal" text="재계산" class="btn btn-sm btn-outline-danger" onclick="fn_reCalc" style="float: right;"></sbux-button>
                                        <sbux-button id="btnPlan" name="btnPlan" uitype="normal" text="최초불입계획" class="btn btn-sm btn-outline-danger" onclick="fn_plan" style="float: right;"></sbux-button>
                                    </div>
                                </div>
                                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                                    <div id="sb-area-gvwPlan" style="height:450px;"></div>
                                </div>
                            </div>
                            <div id="tabAmortize">
                                <div class="ad_tbl_top2">
                                    <ul class="ad_tbl_count">
                                        <li><span>현재가치관리</span></li>
                                    </ul>
                                    <%--<div class="ad_tbl_toplist">
                                        <sbux-button id="btnAmRecalc" name="btnAmRecalc" uitype="normal" text="재계산" class="btn btn-sm btn-outline-danger" onclick="fn_amRecalc" style="float: right;"></sbux-button>
                                        <sbux-button id="btnAmortize" name="btnAmortize" uitype="normal" text="최초 상각스케줄" class="btn btn-sm btn-outline-danger" onclick="fn_amortize" style="float: right;"></sbux-button>
                                    </div--%>>
                                </div>
                                <div class="table-responsive tbl_scroll_sm" style="margin-top: 10px;">
                                    <div id="sb-area-gvwAmortize" style="height:450px;"></div>
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
                                                <sbux-input id="INTEREST_INCOME_ACCOUNT" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="INTEREST_INCOME_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccountCode('INTEREST_INCOME_ACCOUNT')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">환차익계정</th>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_GAIN_ACC" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_GAIN_ACC_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccountCode('EXCHANGE_GAIN_ACC')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">환차손계정</th>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_LOSS_ACC" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_LOSS_ACC_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccountCode('EXCHANGE_LOSS_ACC')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">환평가이익계정</th>
                                            <td class="td_input">
                                                <sbux-input id="VAL_GAIN_ACC" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="VAL_GAIN_ACC_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccountCode('VAL_GAIN_ACC')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">환평가손실계정</th>
                                            <td class="td_input">
                                                <sbux-input id="VAL_LOSS_ACC" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="VAL_LOSS_ACC_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findAccountCode('VAL_LOSS_ACC')"
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
                                                <sbux-input id="DEPOSIT_START_TR_TYPE" class="form-control input-sm" uitype="text"></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_START_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findFundCode('DEPOSIT_START_TR')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">예금이체출금</th>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_IN_TR_TYPE" class="form-control input-sm" uitype="text"></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="DEPOSIT_IN_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findFundCode('DEPOSIT_IN_TR')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">이자수익</th>
                                            <td class="td_input">
                                                <sbux-input id="INTEREST_IN_TR_TYPE" class="form-control input-sm" uitype="text"></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="INTEREST_IN_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findFundCode('INTEREST_IN_TR')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">법인세원천징수</th>
                                            <td class="td_input">
                                                <sbux-input id="CTAX_WITHHOLD_TR_TYPE" class="form-control input-sm" uitype="text"></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="CTAX_WITHHOLD_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findFundCode('CTAX_WITHHOLD_TR')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">지방소득세원천징수</th>
                                            <td class="td_input">
                                                <sbux-input id="PTAX_WITHHOLD_TR_TYPE" class="form-control input-sm" uitype="text"></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="PTAX_WITHHOLD_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findFundCode('PTAX_WITHHOLD_TR')"
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
                                                <sbux-input id="EXCHANGE_GAIN_TR_TYPE" class="form-control input-sm" uitype="text"></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_GAIN_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findFundCode('EXCHANGE_GAIN_TR')"
                                                ></sbux-button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">환차손</th>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_LOSS_TR_TYPE" class="form-control input-sm" uitype="text"></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="EXCHANGE_LOSS_TR_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        text="찾기" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findFundCode('EXCHANGE_LOSS_TR')"
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
                                                <sbux-input id="DEPT_CODE" class="form-control input-sm" uitype="text" required></sbux-input>
                                            </td>
                                            <td class="td_input">
                                                <sbux-input id="DEPT_NAME" class="form-control input-sm" uitype="text" style="width:100%" required></sbux-input>
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
                                                <sbux-input id="COST_CENTER_CODE" class="form-control input-sm" uitype="text"></sbux-input>
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
</body>

<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_fiOrgCode = "${loginVO.maFIOrgCode}";
    var p_baseCurrCode = "${loginVO.maBaseCurrCode}";
    var p_currUnit = "${loginVO.maCurrUnit}";
    //-----------------------------------------------------------

    var strDepositNoTmp = "";
    var strtxn_id = "";

    var jsonBankCode = []; // 은행코드
    var jsonCurrencyCode = []; // 통화코드
    var jsonFiOrgCode = []; // 사업단위
    var jsonBankCsCode = []; // 금융기관코드
    var jsonDepositType = []; // 예적금유형
    var jsonBankAccountSeq = []; // 계좌정보
    var jsonCtaxRate = []; // 법인세율

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
    var jsonTabData = [
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
                target			: ['#SRCH_DEPOSIT_TYPE']
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
            gfnma_multiSelectInit({
                target			: ['#DEPOSIT_TYPE']
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
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
                ]
                , callback : function(value) {
                    if (gfn_nvl(value) == "")
                        return;

                    SBUxMethod.set('DEPOSIT_ACCOUNT', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD1"]);
                    SBUxMethod.set('DEPOSIT_ACCOUNT_NAME', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD1_NM"]);

                    SBUxMethod.set('ADVANCE_INCOME_ACCOUNT', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD2"]);
                    SBUxMethod.set('ADVANCE_INCOME_ACCOUNT_NAME', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD2_NM"]);

                    SBUxMethod.set('ACCRUED_INCOME_ACCOUNT', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD3"]);
                    SBUxMethod.set('ACCRUED_INCOME_ACCOUNT_NAME', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD3_NM"]);

                    SBUxMethod.set('CTAX_WITHHOLD_ACCOUNT', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD4"]);
                    SBUxMethod.set('CTAX_WITHHOLD_ACCOUNT_NAME', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD4_NM"]);

                    SBUxMethod.set('PTAX_WITHHOLD_ACCOUNT', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD5"]);
                    SBUxMethod.set('PTAX_WITHHOLD_ACCOUNT_NAME', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD5_NM"]);

                    SBUxMethod.set('INTEREST_INCOME_ACCOUNT', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD6"]);
                    SBUxMethod.set('INTEREST_INCOME_ACCOUNT_NAME', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD6_NM"]);

                    SBUxMethod.set('EXCHANGE_GAIN_ACC', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD7"]);
                    SBUxMethod.set('EXCHANGE_GAIN_ACC_NAME', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD7_NM"]);

                    SBUxMethod.set('EXCHANGE_LOSS_ACC', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD8"]);
                    SBUxMethod.set('EXCHANGE_LOSS_ACC_NAME', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD8_NM"]);

                    SBUxMethod.set('VAL_GAIN_ACC', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD9"]);
                    SBUxMethod.set('VAL_GAIN_ACC_NAME', jsonDepositType.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD9_NM"]);
                }
            }),
            // 계좌행번
            gfnma_setComSelect([''], jsonBankAccountSeq, 'L_CS_ACCOUNT', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_ACCOUNT_SEQ', 'SEQ_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target: ['#PAY_SEQ']
                , compCode: gv_ma_selectedApcCd
                , clientCode: gv_ma_selectedClntCd
                , bizcompId: 'L_CS_ACCOUNT'
                , whereClause: "AND a.cs_code = '" + gfn_nvl(SBUxMethod.get("BANK_CODE")) + "' AND '" + gfn_nvl(SBUxMethod.get("DEPOSIT_DATE")) + "' BETWEEN a.effect_start_date AND a.effect_end_date"
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
                    console.log(value)
                    if(value == "KRW") {
                        $("#EXCHANGE_GAIN_ACC").attr("required", false);
                        $("#EXCHANGE_GAIN_ACC_NAME").attr("required", false);
                        $("#EXCHANGE_LOSS_ACC").attr("required", false);
                        $("#EXCHANGE_LOSS_ACC_NAME").attr("required", false);
                        $("#VAL_GAIN_ACC").attr("required", false);
                        $("#VAL_GAIN_ACC_NAME").attr("required", false);
                        $("#VAL_LOSS_ACC").attr("required", false);
                        $("#VAL_LOSS_ACC_NAME").attr("required", false);

                        $("#EXCHANGE_GAIN_ACC").removeClass("inpt_data_reqed");
                        $("#EXCHANGE_GAIN_ACC_NAME").removeClass("inpt_data_reqed");
                        $("#EXCHANGE_LOSS_ACC").removeClass("inpt_data_reqed");
                        $("#EXCHANGE_LOSS_ACC_NAME").removeClass("inpt_data_reqed");
                        $("#VAL_GAIN_ACC").removeClass("inpt_data_reqed");
                        $("#VAL_GAIN_ACC_NAME").removeClass("inpt_data_reqed");
                        $("#VAL_LOSS_ACC").removeClass("inpt_data_reqed");
                        $("#VAL_LOSS_ACC_NAME").removeClass("inpt_data_reqed");
                    } else {
                        $("#EXCHANGE_GAIN_ACC").attr("required", true);
                        $("#EXCHANGE_GAIN_ACC_NAME").attr("required", true);
                        $("#EXCHANGE_LOSS_ACC").attr("required", true);
                        $("#EXCHANGE_LOSS_ACC_NAME").attr("required", true);
                        $("#VAL_GAIN_ACC").attr("required", true);
                        $("#VAL_GAIN_ACC_NAME").attr("required", true);
                        $("#VAL_LOSS_ACC").attr("required", true);
                        $("#VAL_LOSS_ACC_NAME").attr("required", true);

                        $("#EXCHANGE_GAIN_ACC").addClass("inpt_data_reqed");
                        $("#EXCHANGE_GAIN_ACC_NAME").addClass("inpt_data_reqed");
                        $("#EXCHANGE_LOSS_ACC").addClass("inpt_data_reqed");
                        $("#EXCHANGE_LOSS_ACC_NAME").addClass("inpt_data_reqed");
                        $("#VAL_GAIN_ACC").addClass("inpt_data_reqed");
                        $("#VAL_GAIN_ACC_NAME").addClass("inpt_data_reqed");
                        $("#VAL_LOSS_ACC").addClass("inpt_data_reqed");
                        $("#VAL_LOSS_ACC_NAME").addClass("inpt_data_reqed");
                    }
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
            gfnma_setComSelect([''], jsonCtaxRate, 'L_FIF050', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
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
                , callback : function(value) {
                    if (gfn_nvl(value) == "") {
                        gfnma_multiSelectSet('#PTAX_RATE', 'SUB_CODE', 'CODE_NAME', "");
                        return;
                    }

                    gfnma_multiSelectSet('#PTAX_RATE', 'SUB_CODE', 'CODE_NAME', jsonCtaxRate.filter(data => data["SUB_CODE"] == value)[0]["EXTRA_FIELD1"]);
                }
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

    const fn_view = async function () {
        var nRow = gvwPlan.getRow();
        await fnQRY_P_TRD2010_Q("DETAIL");

        if(nRow < 0) return;

        if (gvwPlan.getCellData(nRow, gvwPlan.getColRef("CONFIRM_FLAG")) == "Y") {
            for(var i = 0; i < gvwPlan.getCols(); i++) {
                if (i == gvwPlan.getColRef("CHECK_YN")) {
                    gvwPlan.setColDisabled(i, false);
                } else {
                    gvwPlan.setColDisabled(i, true);
                }
            }
        } else {
            for (var i = 0; i < gvwPlan.getCols(); i++){
                if (i == gvwPlan.getColRef("CONFIRM_FLAG") || i == gvwPlan.getColRef("INTERFACE_FLAG")
                    || i == gvwPlan.getColRef("COMPLETE_FLAG") || i == gvwPlan.getColRef("DEPOSIT_NUM") || i == gvwPlan.getColRef("PLAN_SEQ")) {
                    gvwPlan.setColDisabled(i, true);
                } else {
                    gvwPlan.setColDisabled(i, false);
                }
            }
        }

        SBUxMethod.attr("DEPOSIT_NUM", "readonly", "true");
    }

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
        gvwPlan.bind('valuechanged','fn_gvwPlanValueChanged');
    }

    const fn_gvwPlanValueChanged = async function () {
        var nRow = gvwPlan.getRow();
        var nCol = gvwPlan.getCol();
        if (nRow < 0)
            return;

        // 수량, 단가 변경시 금액 계산
        if (nCol == gvwPlan.getColRef("PRETAX_INTEREST_AMOUNT") || nCol == gvwPlan.getColRef("CTAX_RATE") || nCol == gvwPlan.getColRef("PTAX_RATE")) {
            let dpretax_interest_amt = parseFloat(gvwPlan.getCellData(nRow, gvwPlan.getColRef("PRETAX_INTEREST_AMOUNT")));
            let dctax_withhold_amt = Math.trunc(dpretax_interest_amt * parseFloat(gvwPlan.getCellData(nRow, gvwPlan.getColRef("CTAX_RATE"))) / 100 / 10) * 10;
            let dptax_withhold_amt = Math.trunc(dpretax_interest_amt * parseFloat(gvwPlan.getCellData(nRow, gvwPlan.getColRef("PTAX_RATE"))) / 100 / 10) * 10;
            let dinterest_in_plan_amt = dpretax_interest_amt - dctax_withhold_amt - dptax_withhold_amt;

            gvwPlan.setCellData(nRow, gvwPlan.getColRef("CTAX_WITHHOLD_AMOUNT"), dctax_withhold_amt);
            gvwPlan.setCellData(nRow, gvwPlan.getColRef("PTAX_WITHHOLD_AMOUNT"), dptax_withhold_amt);
            gvwPlan.setCellData(nRow, gvwPlan.getColRef("INTEREST_IN_PLAN_AMT"), dinterest_in_plan_amt);

            let din_plan_amt = parseFloat(gvwPlan.getCellData(nRow, gvwPlan.getColRef("IN_PLAN_AMT")));
            gvwPlan.setCellData(nRow, gvwPlan.getColRef("IN_TOTAL_AMT"), dinterest_in_plan_amt + din_plan_amt);
        }
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

    const fn_findBankCsCode = function(elementId) {
        var searchCode 		= gfn_nvl(SBUxMethod.get(elementId+"BANK_CS_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get(elementId+"BANK_CS_NAME"));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CS_BANK'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드", "거래처명"]
            ,searchInputFields		: ["CS_CODE", "CS_NAME"]
            ,searchInputValues		: [searchCode, searchName]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "은행코드", "은행명", "사업자번호", "주소"]
            ,tableColumnNames		: ["CS_CODE" , "CS_NAME", "BANK_CODE", "BANK_NAME", "BIZ_REGNO", "ADDRESS"]
            ,tableColumnWidths		: ["100px", "200px", "100px", "100px", "120px", "300px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set(elementId + 'BANK_CS_NAME', data.CS_NAME);
                SBUxMethod.set(elementId + 'BANK_CS_CODE', data.CS_CODE);
            },
        });
    }

    const fn_findBankCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("BANK_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("BANK_NAME"));
        var replaceText0 	= "_BANK_CODE_";
        var replaceText1 	= "_BANK_NAME_";
        var strWhereClause 	= "AND a.BANK_CODE LIKE '%" + replaceText0 + "%' AND a.BANK_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '은행 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM003'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "명칭"]
            ,searchInputFields		: ["BANK_CODE", "BANK_NAME"]
            ,searchInputValues		: [searchCode, searchName]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명"]
            ,tableColumnNames		: ["BANK_CODE" , "BANK_NAME"]
            ,tableColumnWidths		: ["80px", "150px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('BANK_NAME', data.BANK_NAME);
                SBUxMethod.set('BANK_CODE', data.BANK_CODE);
            },
        });
    }

    const fn_findDepositCode = function(inOrOut) {
        var searchCode 		= gfn_nvl(SBUxMethod.get(inOrOut + "_DEPOSIT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get(inOrOut + "_DEPOSIT_NAME"));
        var replaceText0 	= "_DEPOSIT_CODE_";
        var replaceText1 	= "_DEPOSIT_NAME_";
        var strWhereClause 	= "AND DEPOSIT_CODE LIKE '%" + replaceText0 + "%' AND DEPOSIT_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '예적금 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FIF001'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "코드명"]
            ,searchInputFields		: ["DEPOSIT_CODE", "DEPOSIT_NAME"]
            ,searchInputValues		: [searchCode, searchName]
            ,height					: '400px'
            ,tableHeader			: ["계좌코드", "계좌명", "계좌유형명", "계좌번호", "은행코드", "은행명", "개설일", "만기일"]
            ,tableColumnNames		: ["DEPOSIT_CODE", "DEPOSIT_NAME", "DEPOSIT_TYPE_NAME", "ACCOUNT_NUM", "BANK_CODE", "BANK_NAME", "OPEN_DATE", "EXPIRE_DATE"]
            ,tableColumnWidths		: ["120px", "160px", "100px", "120px", "100px", "140px", "80px", "80px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set(inOrOut + '_DEPOSIT_NAME', data.DEPOSIT_NAME);
                SBUxMethod.set(inOrOut + '_DEPOSIT_CODE', data.DEPOSIT_CODE);
                SBUxMethod.set(inOrOut + '_ACCOUNT_NUM', data.ACCOUNT_NUM);

            },
        });
    }

    const fn_findAccountCode = function(section) {
        var searchCode 		= gfn_nvl(SBUxMethod.get(section));
        var searchName 		= gfn_nvl(SBUxMethod.get(section + "_NAME"));
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_";
        var strWhereClause 	= "AND a.ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND a.ACCOUNT_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ACCT_DOC_IN'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "명칭"]
            ,searchInputFields		: ["ACCOUNT_CODE", "ACCOUNT_NAME"]
            ,searchInputValues		: [searchCode, searchName]
            ,height					: '400px'
            ,tableHeader			: ["계정코드", "계정명", "계정(한국어)"]
            ,tableColumnNames		: ["ACCOUNT_CODE", "ACCOUNT_NAME", "ACCOUNT_NAME_CHN"]
            ,tableColumnWidths		: ["100px", "200px", "200px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set(section + '_NAME', data.ACCOUNT_NAME);
                SBUxMethod.set(section, data.ACCOUNT_CODE);
            },
        });
    }

    const fn_findFundCode = function(section) {
        var searchCode 		= gfn_nvl(SBUxMethod.get(section));
        var searchName 		= gfn_nvl(SBUxMethod.get(section + "_NAME"));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_NAME_";
        var strWhereClause 	= "AND a.CODE LIKE '%" + replaceText0 + "%' AND a.NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '자금수지항목 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FUND_CODE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "명칭"]
            ,searchInputFields		: ["CODE", "NAME"]
            ,searchInputValues		: [searchCode, searchName]
            ,height					: '400px'
            ,tableHeader			: ["코드", "명칭", "GROUP1", "GROUP2", "GROUP3", "GROUP4"]
            ,tableColumnNames		: ["CODE", "NAME", "GROUP1", "GROUP2", "GROUP3", "GROUP4"]
            ,tableColumnWidths		: ["100px", "200px", "100px", "150px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set(section + '_NAME', data.NAME);
                SBUxMethod.set(section + '_TYPE', data.CODE);
            },
        });
    }

    const fn_findDeptCode = function() {
        var searchCode 	= gfn_nvl(SBUxMethod.get("DEPT_CODE"));
        var searchName 	= gfn_nvl(SBUxMethod.get("DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FI_DEPT'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: [searchCode, 	searchName,	gfn_dateToYmd(new Date())]
            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
            ,width					: '700px'
            ,height					: '300px'
            ,tableHeader			: ["부서코드", 		"부서명"]
            ,tableColumnNames		: ["DEPT_CODE", 	"DEPT_NAME"]
            ,tableColumnWidths		: ["150px", 		"250px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('DEPT_CODE', 	data.DEPT_CODE);
                SBUxMethod.set('DEPT_NAME', 	data.DEPT_NAME);
            },
        });
    }

    const fn_findCostCenterCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("COST_CENTER_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("COST_CENTER_NAME"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND A.COST_CENTER_CODE  LIKE '%" + replaceText0 + "%' AND A.COST_CENTER_NAME  LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CC_INPUT'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["계정코드", "계정명"]
            ,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
            ,searchInputValues		: [searchCode, searchName]
            ,height					: '400px'
            ,tableHeader			: ["코드", "명칭", "부서코드", "부서명", "원가유형", "사업장", "여신영역"]
            ,tableColumnNames		: ["COST_CENTER_CODE", "COST_CENTER_NAME", "DEPT_CODE", "COST_CENTER_NAME", "COST_CLASS", "SITE_CODE", "CREDIT_AREA"]
            ,tableColumnWidths		: ["80px", "80px", "80px", "80px", "80px", "80px","80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('COST_CENTER_CODE', data.COST_CENTER_CODE);
                SBUxMethod.set('COST_CENTER_NAME', data.COST_CENTER_NAME);
            },
        });
    }

    const fnQRY_P_TRD2010_Q = async function (strWorkType) {
        if (strWorkType == "LIST") {
            if (!SBUxMethod.validateRequired({group_id:'panHeader'}) && !validateRequired('panHeader')) {
                return false;
            }
        }

        let FI_ORG_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE'));
        let BASE_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
        let TXN_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_FR"));
        let TXN_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_TXN_DATE_TO"));
        let ALL_YN = gfn_nvl(gfnma_multiSelectGet("#SRCH_ALL_YN"));
        let DEPOSIT_TYPE = gfn_nvl(gfnma_multiSelectGet("#SRCH_DEPOSIT_TYPE"));
        let BANK_CS_CODE = gfn_nvl(SBUxMethod.get("SRCH_BANK_CS_CODE"));
        let DEPOSIT_NUM = strWorkType == "DETAIL" || strWorkType == "PLAN" || strWorkType == "RECALC" || strWorkType == "AMORTIZE" || strWorkType == "AM_RECALC" ? gfn_nvl(gvwInfo.getCellData(gvwInfo.getRow(), gvwInfo.getColRef("DEPOSIT_NUM"))) : "";
        let PLAN_SEQ = strWorkType == "RECALC" || strWorkType == "AM_RECALC" ? parseInt(gfn_nvl(gvwPlan.getCellData(gvwPlan.getRow(), gvwPlan.getColRef("PLAN_SEQ")))) : 0;

        // 비즈니스 로직 정보
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_FI_ORG_CODE : FI_ORG_CODE,
            V_P_BASE_DATE_TO : BASE_DATE_TO,
            V_P_TXN_DATE_FR : TXN_DATE_FR,
            V_P_TXN_DATE_TO : TXN_DATE_TO,
            V_P_ALL_YN : ALL_YN,
            V_P_DEPOSIT_TYPE : DEPOSIT_TYPE,
            V_P_BANK_CS_CODE : BANK_CS_CODE,
            V_P_DEPOSIT_NUM : DEPOSIT_NUM,
            V_P_PLAN_SEQ : PLAN_SEQ,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/trd/selectTrd2010List.do", {
            getType				: 'json',
            workType			: strWorkType,
            cv_count			: '5',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (strWorkType == "LIST") {
                    jsonDepositList.length = 0;
                    data.cv_1.forEach((item, index) => {
                        const msg = {
                            DEPOSIT_NUM : item.DEPOSIT_NUM,
                            FI_ORG_CODE : item.FI_ORG_CODE,
                            BANK_CODE : item.BANK_CODE,
                            BANK_CS_CODE : item.BANK_CS_CODE,
                            DEPOSIT_CATEGORY1 : item.DEPOSIT_CATEGORY1,
                            DEPOSIT_CATEGORY2 : item.DEPOSIT_CATEGORY2,
                            DEPOSIT_CATEGORY3 : item.DEPOSIT_CATEGORY3,
                            DEPOSIT_NAME : item.DEPOSIT_NAME,
                            ACCOUNT_NUM : item.ACCOUNT_NUM,
                            ACCOUNT_OWNER : item.ACCOUNT_OWNER,
                            DEPOSIT_DATE : item.DEPOSIT_DATE,
                            DEPOSIT_AMT : item.DEPOSIT_AMT,
                            IN_AMT : item.IN_AMT,
                            REMAIN_AMT : item.REMAIN_AMT,
                            DUE_DATE : item.DUE_DATE,
                            CURRENCY_CODE : item.CURRENCY_CODE,
                            INTEREST_RATE : item.INTEREST_RATE,
                            DEPOSIT_TYPE : item.DEPOSIT_TYPE,
                            INTEREST_CALC_METHOD : item.INTEREST_CALC_METHOD,
                        }
                        jsonDepositList.push(msg);
                    });

                    gvwInfo.rebuild();

                    if (jsonDepositList.length > 0) {
                        gvwInfo.clickRow(1);
                    } else {
                        fn_create();
                    }
                } else if (strWorkType == "DETAIL") {
                    jsonInterestRateHistoryList.length = 0;
                    jsonPaymentPlanList.length = 0;

                    var rs = data.cv_2[0];

                    gfnma_uxDataSet("#tabBase", rs);
                    gfnma_uxDataSet("#tabAccount", rs);
                    gfnma_uxDataSet("#tabInfo", rs);
                    gfnma_uxDataSet("#tabPL", rs);
                    gfnma_uxDataSet("#tabTR", rs);
                    gfnma_uxDataSet("#tabTreasury", rs);
                    gfnma_uxDataSet("#tabDept", rs);
                    gfnma_multiSelectSet('#FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', rs.FI_ORG_CODE);
                    gfnma_multiSelectSet('#DEPOSIT_TYPE', 'SUB_CODE', 'CODE_NAME', rs.DEPOSIT_TYPE);
                    gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', rs.CURRENCY_CODE);
                    gfnma_multiSelectSet('#DEPOSIT_STATUS', 'SUB_CODE', 'CODE_NAME', rs.DEPOSIT_STATUS);
                    gfnma_multiSelectSet('#PAY_SEQ', 'BANK_ACCOUNT_SEQ', 'SEQ_NAME', rs.DEPOSIT_STATUS);
                    gfnma_multiSelectSet('#IN_TERM', 'SUB_CODE', 'CODE_NAME', rs.IN_TERM);
                    gfnma_multiSelectSet('#IN_DD', 'SUB_CODE', 'CODE_NAME', rs.IN_DD);
                    gfnma_multiSelectSet('#IN_BASE', 'SUB_CODE', 'CODE_NAME', rs.IN_BASE);
                    gfnma_multiSelectSet('#INTEREST_TYPE', 'SUB_CODE', 'CODE_NAME', rs.INTEREST_TYPE);
                    gfnma_multiSelectSet('#INTEREST_IN_TYPE', 'SUB_CODE', 'CODE_NAME', rs.INTEREST_IN_TYPE);
                    gfnma_multiSelectSet('#INTEREST_CALC_DAYS_TYPE', 'SUB_CODE', 'CODE_NAME', rs.INTEREST_CALC_DAYS_TYPE);
                    gfnma_multiSelectSet('#INTEREST_IN_DD', 'SUB_CODE', 'CODE_NAME', rs.INTEREST_IN_DD);
                    gfnma_multiSelectSet('#INTEREST_CALC_METHOD', 'SUB_CODE', 'CODE_NAME', rs.INTEREST_CALC_METHOD);
                    gfnma_multiSelectSet('#INTEREST_CALC_YEAR_TYPE', 'SUB_CODE', 'CODE_NAME', rs.INTEREST_CALC_YEAR_TYPE);
                    gfnma_multiSelectSet('#CTAX_RATE', 'SUB_CODE', 'CODE_NAME', rs.CTAX_RATE);
                    gfnma_multiSelectSet('#PTAX_RATE', 'SUB_CODE', 'CODE_NAME', rs.PTAX_RATE);

                    /*SBUxMethod.set("IN_BANK_CODE", gfn_nvl(rs.IN_BANK_CODE));
                    SBUxMethod.set("IN_BANK_NAME", gfn_nvl(rs.IN_BANK_NAME));
                    SBUxMethod.set("PAY_ACCOUNT_OWNER", gfn_nvl(rs.PAY_ACCOUNT_OWNER));
                    SBUxMethod.set("IN_AMT", gfn_nvl(rs.IN_AMT));
                    SBUxMethod.set("REMAIN_DEPOSIT_AMT", gfn_nvl(rs.REMAIN_DEPOSIT_AMT));
                    SBUxMethod.set("DEFERRED_MM", gfn_nvl(rs.DEFERRED_MM));
                    SBUxMethod.set("INTEREST_DEFERRED_MM", gfn_nvl(rs.INTEREST_DEFERRED_MM));
                    SBUxMethod.set("DOC_DATE", gfn_nvl(rs.DOC_DATE));
                    SBUxMethod.set("DOC_NUM", gfn_nvl(rs.DOC_NUM));
                    SBUxMethod.set("DOC_SEQ", gfn_nvl(rs.DOC_SEQ));
                    SBUxMethod.set("INSERT_USERID", gfn_nvl(rs.INSERT_USERID));*/

                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            TXN_ID : item.TXN_ID,
                            SEQ : item.SEQ,
                            DEPOSIT_NUM : item.DEPOSIT_NUM,
                            APPLY_START_DATE : item.APPLY_START_DATE,
                            APPLY_END_DATE : item.APPLY_END_DATE,
                            INTEREST_RATE : item.INTEREST_RATE,
                            DESCR : item.DESCR,
                            CONFIRM_FLAG : item.CONFIRM_FLAG,
                        }
                        jsonInterestRateHistoryList.push(msg);
                    });

                    data.cv_4.forEach((item, index) => {
                        const msg = {
                            TXN_ID : item.TXN_ID,
                            DEPOSIT_NUM : item.DEPOSIT_NUM,
                            PLAN_SEQ : item.PLAN_SEQ,
                            CURRENCY_CODE : item.CURRENCY_CODE,
                            IN_PLAN_DATE : item.IN_PLAN_DATE,
                            CURRENCY_CODE : item.CURRENCY_CODE,
                            IN_PLAN_AMT : item.IN_PLAN_AMT,
                            IN_TRANSFER_AMT : item.IN_TRANSFER_AMT,
                            REMAIN_DEPOSIT_AMT : item.REMAIN_DEPOSIT_AMT,
                            INTEREST_DAY : item.INTEREST_DAY,
                            INTEREST_IN_PLAN_AMT : item.INTEREST_IN_PLAN_AMT,
                            IN_TOTAL_AMT : item.IN_TOTAL_AMT,
                            INTEREST_FROM_DATE : item.INTEREST_FROM_DATE,
                            INTEREST_TO_DATE : item.INTEREST_TO_DATE,
                            INTEREST_RATE : item.INTEREST_RATE,
                            INTERFACE_FLAG : item.INTERFACE_FLAG,
                            CONFIRM_FLAG : item.CONFIRM_FLAG,
                            COMPLETE_FLAG : item.COMPLETE_FLAG,
                            DUE_WITHDRAW_AMT : item.DUE_WITHDRAW_AMT,
                            CTAX_RATE : item.CTAX_RATE,
                            PTAX_RATE : item.PTAX_RATE,
                            CTAX_WITHHOLD_AMOUNT : item.CTAX_WITHHOLD_AMOUNT,
                            PTAX_WITHHOLD_AMOUNT : item.PTAX_WITHHOLD_AMOUNT,
                            PRETAX_INTEREST_AMOUNT : item.PRETAX_INTEREST_AMOUNT,
                        }
                        jsonPaymentPlanList.push(msg);
                    });

                    gvwHistory.rebuild();
                    gvwPlan.rebuild();
                } else if (strWorkType == "PLAN" || strWorkType == "RECALC") {
                    jsonPaymentPlanList.length = 0;
                    data.cv_5.forEach((item, index) => {
                        const msg = {
                            PLAN_SEQ : item.PLAN_SEQ,
                            CURRENCY_CODE : item.CURRENCY_CODE,
                            DEPOSIT_NUM : item.DEPOSIT_NUM,
                            DEPOSIT_AMOUNT : item.DEPOSIT_AMOUNT,
                            IN_PLAN_AMT : item.IN_PLAN_AMT,
                            IN_TRANSFER_AMT : item.IN_TRANSFER_AMT,
                            REMAIN_DEPOSIT_AMT : item.REMAIN_DEPOSIT_AMT,
                            IN_TOTAL_AMT : item.IN_TOTAL_AMT,
                            INTEREST_RATE : item.INTEREST_RATE,
                            INTEREST_FROM_DATE : item.INTEREST_FROM_DATE,
                            INTEREST_TO_DATE : item.INTEREST_TO_DATE,
                            IN_PLAN_DATE : item.IN_PLAN_DATE,
                            INTEREST_DAY : item.INTEREST_DAY,
                            TOTAL_DAY : item.TOTAL_DAY,
                            INTEREST_IN_PLAN_AMT : item.INTEREST_IN_PLAN_AMT,
                            TOTAL_IN_AMOUNT : item.TOTAL_IN_AMOUNT,
                            CONFIRM_FLAG : item.CONFIRM_FLAG,
                            INTERFACE_FLAG : item.INTERFACE_FLAG,
                            COMPLETE_FLAG : item.COMPLETE_FLAG,
                        }
                        jsonPaymentPlanList.push(msg);
                    });

                    gvwPlan.rebuild();
                }

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

    const fnSET_P_TRD2010_S = async function (strWorkType) {
        if (!SBUxMethod.validateRequired({group_id:'panList'}) || !SBUxMethod.validateRequired({group_id:'panInfo'})
            || !SBUxMethod.validateRequired({group_id:'panAccount'}) || !SBUxMethod.validateRequired({group_id:'panPL'})
            || !SBUxMethod.validateRequired({group_id:'panTR'}) || !SBUxMethod.validateRequired({group_id:'panTRF'})
            || !SBUxMethod.validateRequired({group_id:'panDept'})
            || !validateRequired('panList') || !validateRequired('panInfo')
            || !validateRequired('panAccount') || !validateRequired('panPL')
            || !validateRequired('panTR') || !validateRequired('panTRF')
            || !validateRequired('panDept'))
            return false;

        // 비즈니스 로직 정보
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            IV_P_DEPOSIT_NUM : gfn_nvl(SBUxMethod.get("DEPOSIT_NUM")),
            V_P_FI_ORG_CODE : gfn_nvl(gfnma_multiSelectGet('#SRCH_FI_ORG_CODE')),
            V_P_ACCOUNT_NUM : gfn_nvl(SBUxMethod.get("ACCOUNT_NUM")),
            V_P_ACCOUNT_OWNER : gfn_nvl(SBUxMethod.get("ACCOUNT_OWNER")),
            V_P_DEPOSIT_NAME : gfn_nvl(SBUxMethod.get("DEPOSIT_NAME")),
            V_P_DEPOSIT_TYPE : gfn_nvl(gfnma_multiSelectGet("#SRCH_DEPOSIT_TYPE")),
            V_P_DEPOSIT_CATEGORY1 : gfn_nvl(SBUxMethod.get("DEPOSIT_CATEGORY1")),
            V_P_DEPOSIT_CATEGORY2 : gfn_nvl(SBUxMethod.get("DEPOSIT_CATEGORY2")),
            V_P_DEPOSIT_CATEGORY3 : gfn_nvl(SBUxMethod.get("DEPOSIT_CATEGORY3")),
            V_P_BANK_CODE : gfn_nvl(SBUxMethod.get("BANK_CODE")),
            V_P_BANK_CS_CODE : gfn_nvl(SBUxMethod.get("SRCH_BANK_CS_CODE")),
            V_P_DEPT_CODE : gfn_nvl(SBUxMethod.get("DEPT_CODE")),
            V_P_COST_CENTER_CODE : gfn_nvl(SBUxMethod.get("COST_CENTER_CODE")),
            V_P_DEPOSIT_ACCOUNT : gfn_nvl(SBUxMethod.get("DEPOSIT_ACCOUNT")),
            V_P_INTEREST_INCOME_ACCOUNT : gfn_nvl(SBUxMethod.get("INTEREST_INCOME_ACCOUNT")),
            V_P_ADVANCE_INCOME_ACCOUNT : gfn_nvl(SBUxMethod.get("ADVANCE_INCOME_ACCOUNT")),
            V_P_ACCRUED_INCOME_ACCOUNT : gfn_nvl(SBUxMethod.get("ACCRUED_INCOME_ACCOUNT")),
            V_P_PRESENT_VALUE_ACCOUNT : gfn_nvl(SBUxMethod.get("PRESENT_VALUE_ACCOUNT")),
            V_P_DEPOSIT_LIQUID_ACCOUNT : gfn_nvl(SBUxMethod.get("DEPOSIT_LIQUID_ACCOUNT")),
            V_P_DEPOSIT_IN_TR_TYPE : gfn_nvl(SBUxMethod.get("DEPOSIT_IN_TR_TYPE")),
            V_P_INTEREST_IN_TR_TYPE : gfn_nvl(SBUxMethod.get("INTEREST_IN_TR_TYPE")),
            V_P_DEPOSIT_START_TR_TYPE : gfn_nvl(SBUxMethod.get("DEPOSIT_START_TR_TYPE")),
            V_P_EXCHANGE_GAIN_ACC : gfn_nvl(SBUxMethod.get("EXCHANGE_GAIN_ACC")),
            V_P_EXCHANGE_LOSS_ACC : gfn_nvl(SBUxMethod.get("EXCHANGE_LOSS_ACC")),
            V_P_VAL_GAIN_ACC : gfn_nvl(SBUxMethod.get("VAL_GAIN_ACC")),
            V_P_VAL_LOSS_ACC : gfn_nvl(SBUxMethod.get("VAL_LOSS_ACC")),
            V_P_CURRENCY_CODE : gfn_nvl(gfnma_multiSelectGet("#CURRENCY_CODE")),
            V_P_EXCHANGE_RATE : Number(gfn_nvl(SBUxMethod.get("EXCHANGE_RATE"))),
            V_P_DEPOSIT_AMT : Number(gfn_nvl(SBUxMethod.get("DEPOSIT_AMT"))),
            V_P_DEPOSIT_AMT_KRW : Number(gfn_nvl(SBUxMethod.get("DEPOSIT_AMT_KRW"))),
            V_P_IN_DEPOSIT_CODE : gfn_nvl(SBUxMethod.get("IN_DEPOSIT_CODE")),
            V_P_OUT_DEPOSIT_CODE : gfn_nvl(SBUxMethod.get("OUT_DEPOSIT_CODE")),
            V_P_DEPOSIT_DATE : gfn_nvl(SBUxMethod.get("DEPOSIT_DATE")),
            V_P_DUE_DATE : gfn_nvl(SBUxMethod.get("DUE_DATE")),
            V_P_DEPOSIT_STATUS : gfn_nvl(gfnma_multiSelectGet("DEPOSIT_STATUS")),
            V_P_DESCR : gfn_nvl(SBUxMethod.get("DESCR")),
            V_P_PAY_DEPOSIT_CODE : gfn_nvl(SBUxMethod.get("PAY_DEPOSIT_CODE")),
            V_P_PAY_ACCOUNT_NUM : gfn_nvl(SBUxMethod.get("PAY_ACCOUNT_NUM")),
            V_P_PAY_DEPOSIT_NAME : gfn_nvl(SBUxMethod.get("PAY_DEPOSIT_NAME")),
            V_P_IN_AMT : 0,
            V_P_REMAIN_DEPOSIT_AMT : 0,
            V_P_IN_TERM : gfn_nvl(gfnma_multiSelectGet("#IN_TERM")),
            V_P_DEFERRED_MM : 0,
            V_P_IN_CYCLE_MM : parseInt(gfn_nvl(SBUxMethod.get("IN_CYCLE_MM"))),
            V_P_IN_START_DATE : gfn_nvl(SBUxMethod.get("IN_START_DATE")),
            V_P_IN_PER_AMT : Number(gfn_nvl(SBUxMethod.get("IN_PER_AMT"))),
            V_P_IN_FIRST_AMT : Number(gfn_nvl(SBUxMethod.get("IN_FIRST_AMT"))),
            V_P_IN_DD : gfn_nvl(SBUxMethod.get("IN_DD")),
            V_P_IN_BASE : gfn_nvl(SBUxMethod.get("IN_BASE")),
            V_P_INTEREST_TYPE : gfn_nvl(SBUxMethod.get("INTEREST_TYPE")),
            V_P_INTEREST_RATE : Number(gfn_nvl(SBUxMethod.get("INTEREST_RATE"))),
            V_P_INTEREST_IN_TYPE : gfn_nvl(gfnma_multiSelectGet("#INTEREST_IN_TYPE")),
            V_P_INTEREST_CALC_DAYS_TYPE : gfn_nvl(gfnma_multiSelectGet("#INTEREST_CALC_DAYS_TYPE")),
            V_P_INTEREST_DEFERRED_MM : 0,
            V_P_INTEREST_IN_CYCLE_MM : parseInt(gfn_nvl(SBUxMethod.get("INTEREST_IN_CYCLE_MM"))),
            V_P_INTEREST_IN_START_DATE : gfn_nvl(SBUxMethod.get("INTEREST_IN_START_DATE")),
            V_P_INTEREST_IN_DD : gfn_nvl(gfnma_multiSelectGet("#INTEREST_IN_DD")),
            V_P_EFFECTIVE_INTEREST_RATE : Number(gfn_nvl(SBUxMethod.get("EFFECTIVE_INTEREST_RATE"))),
            V_P_DEPOSIT_DISCOUNT_AMT : Number(gfn_nvl(SBUxMethod.get("DEPOSIT_DISCOUNT_AMT"))),
            V_P_DOC_DATE : "",
            V_P_DOC_NUM : 0,
            V_P_DOC_SEQ : 0,
            V_P_INTEREST_CALC_YEAR_TYPE : gfn_nvl(gfnma_multiSelectGet("#INTEREST_CALC_YEAR_TYPE")),
            V_P_INTEREST_CALC_METHOD : gfn_nvl(gfnma_multiSelectGet("#INTEREST_CALC_METHOD")),
            V_P_CTAX_WITHHOLD_ACCOUNT : gfn_nvl(SBUxMethod.get("CTAX_WITHHOLD_ACCOUNT")),
            V_P_PTAX_WITHHOLD_ACCOUNT : gfn_nvl(SBUxMethod.get("PTAX_WITHHOLD_ACCOUNT")),
            V_P_CTAX_WITHHOLD_TR_TYPE : gfn_nvl(SBUxMethod.get("CTAX_WITHHOLD_TR_TYPE")),
            V_P_PTAX_WITHHOLD_TR_TYPE : gfn_nvl(SBUxMethod.get("PTAX_WITHHOLD_TR_TYPE")),
            V_P_EXCHANGE_GAIN_TR_TYPE : gfn_nvl(SBUxMethod.get("EXCHANGE_GAIN_TR_TYPE")),
            V_P_EXCHANGE_LOSS_TR_TYPE : gfn_nvl(SBUxMethod.get("EXCHANGE_LOSS_TR_TYPE")),
            V_P_CTAX_RATE : Number(gfn_nvl(gfnma_multiSelectGet("CTAX_RATE")) == "" ? 0 : gfn_nvl(gfnma_multiSelectGet("CTAX_RATE"))),
            V_P_PTAX_RATE : Number(gfn_nvl(gfnma_multiSelectGet("PTAX_RATE")) == "" ? 0 : gfn_nvl(gfnma_multiSelectGet("PTAX_RATE"))),
            V_P_IN_PREAUTH_PAY_YN : gfn_nvl(SBUxMethod.get("IN_PREAUTH_PAY_YN").IN_PREAUTH_PAY_YN),
            V_P_PAY_SEQ : gfn_nvl(gfnma_multiSelectGet("#PAY_SEQ")) == "" ? 0 : parseInt(gfn_nvl(gfnma_multiSelectGet("#PAY_SEQ"))),
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: '',
        };

        const postJsonPromise = gfn_postJSON("/fi/ftr/trd/insertTrd2010Master.do", {
            getType				: 'json',
            workType			: strWorkType,
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (strWorkType == "N") {
                    SBUxMethod.set("DEPOSIT_NUM", data.v_returnStr)
                    strDepositNoTmp = data.v_returnStr;
                } else {
                    strDepositNoTmp = data.v_returnStr;
                }
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

    const fnSET_P_TRD2010_S1 = async function (strWorkType) {
        if (!SBUxMethod.validateRequired({group_id:'gvwHistory'}))
            return false;

        // 비즈니스 로직 정보
        let updatedData = gvwHistory.getUpdateData(true, 'all');
        let listData = [];

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
                    V_P_DEPOSIT_NUM : gfn_nvl(item.data.DEPOSIT_NUM),
                    V_P_TXN_ID : gfn_nvl(item.data.TXN_ID) == "" ? 0 : parseInt(gfn_nvl(item.data.TXN_ID)),
                    V_P_APPLY_START_DATE : gfn_nvl(item.data.APPLY_START_DATE),
                    V_P_APPLY_END_DATE : gfn_nvl(item.data.APPLY_END_DATE),
                    V_P_INTEREST_RATE : gfn_nvl(item.data.INTEREST_RATE) == "" ? 0 : Number(gfn_nvl(item.data.INTEREST_RATE)),
                    V_P_DESCR : gfn_nvl(item.data.DESCR),
                    V_P_CONFIRM_FLAG : gfn_nvl(item.data.CONFIRM_FLAG),
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
            const postJsonPromise = gfn_postJSON("/fi/ftr/trd/insertTrd2010ForHistory.do", {listData: listData});

            const data = await postJsonPromise;
            console.log('data:', data);
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
    }

    const fnSET_P_TRD2010_S2 = async function (strWorkType) {
        if (!SBUxMethod.validateRequired({group_id:'gvwPlan'}))
            return false;

        // 비즈니스 로직 정보
        let updatedData = gvwPlan.getUpdateData(true, 'all');
        let listData = [];

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
                    V_P_DEPOSIT_NUM : gfn_nvl(item.data.DEPOSIT_NUM),
                    V_P_TXN_ID : gfn_nvl(item.data.TXN_ID) == "" ? 0 : parseInt(gfn_nvl(item.data.TXN_ID)),
                    V_P_PLAN_SEQ : gfn_nvl(item.data.PLAN_SEQ) == "" ? 0 : parseInt(gfn_nvl(item.data.PLAN_SEQ)),
                    V_P_IN_PLAN_DATE : gfn_nvl(item.data.IN_PLAN_DATE),
                    V_P_CURRENCY_CODE : gfn_nvl(item.data.CURRENCY_CODE),
                    V_P_IN_PLAN_AMT : gfn_nvl(item.data.IN_PLAN_AMT) == "" ? 0 : Number(gfn_nvl(item.data.IN_PLAN_AMT)),
                    V_P_IN_TRANSFER_AMT : gfn_nvl(item.data.IN_TRANSFER_AMT) == "" ? 0 : Number(gfn_nvl(item.data.IN_TRANSFER_AMT)),
                    V_P_INTEREST_RATE : gfn_nvl(item.data.INTEREST_RATE) == "" ? 0 : Number(gfn_nvl(item.data.INTEREST_RATE)),
                    V_P_REMAIN_DEPOSIT_AMT : gfn_nvl(item.data.REMAIN_DEPOSIT_AMT) == "" ? 0 : Number(gfn_nvl(item.data.REMAIN_DEPOSIT_AMT)),
                    V_P_PRETAX_INTEREST_AMOUNT : gfn_nvl(item.data.PRETAX_INTEREST_AMOUNT) == "" ? 0 : Number(gfn_nvl(item.data.PRETAX_INTEREST_AMOUNT)),
                    V_P_INTEREST_IN_PLAN_AMT : gfn_nvl(item.data.INTEREST_IN_PLAN_AMT) == "" ? 0 : Number(gfn_nvl(item.data.INTEREST_IN_PLAN_AMT)),
                    V_P_INTEREST_DAY : gfn_nvl(item.data.INTEREST_DAY) == "" ? 0 : parseInt(gfn_nvl(item.data.INTEREST_DAY)),
                    V_P_INTEREST_FROM_DATE : gfn_nvl(item.data.INTEREST_FROM_DATE),
                    V_P_INTEREST_TO_DATE : gfn_nvl(item.data.INTEREST_TO_DATE),
                    V_P_INTERFACE_FLAG : gfn_nvl(item.data.INTERFACE_FLAG),
                    V_P_CONFIRM_FLAG : gfn_nvl(item.data.CONFIRM_FLAG),
                    V_P_COMPLETE_FLAG : gfn_nvl(item.data.COMPLETE_FLAG),
                    V_P_CTAX_RATE : gfn_nvl(item.data.CTAX_RATE) == "" ? 0 : Number(gfn_nvl(item.data.CTAX_RATE)),
                    V_P_PTAX_RATE : gfn_nvl(item.data.PTAX_RATE) == "" ? 0 : Number(gfn_nvl(item.data.PTAX_RATE)),
                    V_P_CTAX_WITHHOLD_AMOUNT : gfn_nvl(item.data.CTAX_WITHHOLD_AMOUNT) == "" ? 0 : Number(gfn_nvl(item.data.CTAX_WITHHOLD_AMOUNT)),
                    V_P_PTAX_WITHHOLD_AMOUNT : gfn_nvl(item.data.PTAX_WITHHOLD_AMOUNT) == "" ? 0 : Number(gfn_nvl(item.data.PTAX_WITHHOLD_AMOUNT)),
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
            const postJsonPromise = gfn_postJSON("/fi/ftr/trd/insertTrd2010ForPlan.do", {listData: listData});

            const data = await postJsonPromise;
            console.log('data:', data);
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
    }

    const fn_changeExchangeRate = async function(val) {
        SBUxMethod.set("DEPOSIT_AMT_KRW", Math.round(Number(gfn_nvl(SBUxMethod.get("DEPOSIT_AMT"))) * Number(gfn_nvl(val)), p_currUnit));
    }

    const fn_changeDepositAmt = async function(val) {
        SBUxMethod.set("DEPOSIT_AMT_KRW", Math.round(Number(gfn_nvl(val)) * Number(gfn_nvl(SBUxMethod.get("EXCHANGE_RATE"))), p_currUnit));
    }

    const fn_changeDepositDate = async function(val) {
        if (gfn_nvl(val) == "")
            return;

        if (gfn_nvl(SBUxMethod.get("IN_START_DATE")) != "")
            return;

        SBUxMethod.set("IN_START_DATE", gfn_dateToYmd(gfn_nvl(val)));
    }

    const fn_changeInStartDate = async function(val) {
        if (gfn_nvl(val) == "")
            return;

        if (gfn_nvl(SBUxMethod.get("IN_DD")) != "")
            return;

        SBUxMethod.set("IN_DD", gfn_nvl(val).substring(6,8));
    }

    const fn_changeDueDate = async function(val) {
        if (gfn_nvl(val) == "")
            return;

        if (gfn_nvl(SBUxMethod.get("INTEREST_IN_START_DATE")) != "")
            return;

        SBUxMethod.set("INTEREST_IN_START_DATE", gfn_dateToYmd(gfn_nvl(val)));
    }

    const fn_changeInterestInStartDate = async function(val) {
        if (gfn_nvl(val) == "")
            return;

        if (gfn_nvl(gfnma_multiSelectGet("#INTEREST_IN_DD")) != "")
            return;

        gfnma_multiSelectSet('#INTEREST_IN_DD', 'SUB_CODE', 'CODE_NAME', gfn_nvl(val).substring(6,8));
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

    const fn_onload = async function (parentParameter) {
        SBUxMethod.hideTab('tabBase');
        SBUxMethod.hideTab('tabAccount');
        SBUxMethod.hideTab('tabInfo');
        SBUxMethod.hideTab('tabHistory');
        SBUxMethod.hideTab('tabAmortize');
        SBUxMethod.hideTab('tabPL');
        SBUxMethod.hideTab('tabTreasury');
        SBUxMethod.hideTab('tabTreasuryF');
        SBUxMethod.hideTab('tabDept');

        gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);
        gfnma_multiSelectSet('#FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);

        if (parentParameter == null) {
            SBUxMethod.set("SRCH_BASE_DATE", gfn_dateToYmd(new Date()));
        } else {

            if (parentParameter.hasOwnProperty("TXN_DATE")) {
                SBUxMethod.set("SRCH_BASE_DATE", parentParameter["TXN_DATE"]);
            }

            if (parentParameter.hasOwnProperty("BANK_CS_CODE")) {
                SBUxMethod.set("BANK_CS_CODE", parentParameter["BANK_CS_CODE"]);
            }

            if (parentParameter.hasOwnProperty("BANK_CS_NAME")) {
                SBUxMethod.set("BANK_CS_NAME", parentParameter["BANK_CS_NAME"]);
            }

            fn_search();
        }
        SBUxMethod.set("IN_PREAUTH_PAY_YN", "N");
    }

    const fn_create = async function () {
        gfnma_uxDataClear('tabBase');
        gfnma_uxDataClear('tabAccount');
        gfnma_uxDataClear('tabInfo');
        gfnma_uxDataClear('tabPL');
        gfnma_uxDataClear('tabTreasury');
        gfnma_uxDataClear('tabTreasuryF');
        gfnma_uxDataClear('tabDept');

        jsonInterestRateHistoryList.length = 0;
        jsonPaymentPlanList.length = 0;
        jsonPresentValueList.length = 0;
        gvwHistory.rebuild();
        gvwPlan.rebuild();
        gvwAmortize.rebuild();

        gfnma_multiSelectSet('#FI_ORG_CODE', '', '', '');
        gfnma_multiSelectSet('#DEPOSIT_TYPE', '', '', '');
        gfnma_multiSelectSet('#CURRENCY_CODE', '', '', '');
        gfnma_multiSelectSet('#DEPOSIT_STATUS', '', '', '');
        gfnma_multiSelectSet('#PAY_SEQ', '', '', '');
        gfnma_multiSelectSet('#IN_TERM', '', '', '');
        gfnma_multiSelectSet('#IN_DD', '', '', '');
        gfnma_multiSelectSet('#IN_BASE', '', '', '');
        gfnma_multiSelectSet('#INTEREST_TYPE', '', '', '');
        gfnma_multiSelectSet('#INTEREST_IN_TYPE', '', '', '');
        gfnma_multiSelectSet('#INTEREST_CALC_DAYS_TYPE', '', '', '');
        gfnma_multiSelectSet('#INTEREST_IN_DD', '', '', '');
        gfnma_multiSelectSet('#INTEREST_CALC_METHOD', '', '', '');
        gfnma_multiSelectSet('#INTEREST_CALC_YEAR_TYPE', '', '', '');
        gfnma_multiSelectSet('#CTAX_RATE', '', '', '');
        gfnma_multiSelectSet('#PTAX_RATE', '', '', '');

        SBUxMethod.focus('DEPOSIT_NUM');

        SBUxMethod.set("DEPOSIT_NUM", "");
        strDepositNoTmp = "";

        gfnma_multiSelectSet('#FI_ORG_CODE', 'FI_ORG_CODE', 'FI_ORG_NAME', p_fiOrgCode);
        gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', p_baseCurrCode);
        SBUxMethod.set("EXCHANGE_RATE", "1");
        gfnma_multiSelectSet('#PTAX_RATE', 'SUB_CODE', 'CODE_NAME', "14");
    }

    const fn_save = async function () {
        let strStatus = "";

        if (gfn_nvl(SBUxMethod.get("DEPOSIT_NUM")) == "")
            strStatus = "N";
        else
            strStatus = "U";

        strtxn_id = gvwPlan.getCellData(gvwPlan.getRow(), gvwPlan.getColRef("TXN_ID"));

        if (!fnSET_P_TRD2010_S2()) {
            return;
        }

        gvwInfo.clickRow(gvwInfo.getFilterDatas(gvwInfo.getColRef("TXN_ID"), strtxn_id));
    }

    const fn_delete = async function () {
        if (gfn_comConfirm("Q0000", "[" + gfn_nvl(SBUxMethod.get("DEPOSIT_NUM")) + "]" + " 예적금 정보를 삭제하시겠습니까?")) {
            if (fnSET_P_TRD2010_S("D"))
                fnQRY_P_TRD2010_Q("LIST");

            if (jsonDepositList.length < 1) {
                gfnma_uxDataClear('tabBase');
                gfnma_uxDataClear('tabAccount');
                gfnma_uxDataClear('tabInfo');
                gfnma_uxDataClear('tabPL');

                jsonInterestRateHistoryList.length = 0;
                jsonPaymentPlanList.length = 0;
                gvwHistory.rebuild();
                gvwPlan.rebuild();
            }
        }
    }

    const fn_search = async function () {
        await fnQRY_P_TRD2010_Q("LIST");
    }

    // 행추가
    const fn_addRowForGvwHistory = async function () {
        let rowVal = gvwHistory.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwHistory.addRow(true, {
                DEPOSIT_NUM : gfn_nvl(SBUxMethod.get("DEPOSIT_NUM")),
                CONFIRM_FLAG : "N"
            });
        }else{
            gvwHistory.insertRow(rowVal, 'below', {
                DEPOSIT_NUM : gfn_nvl(SBUxMethod.get("DEPOSIT_NUM")),
                CONFIRM_FLAG : "N"
            });
        }
    }

    // 행삭제
    const fn_deleteRowForGvwHistory = async function () {
        let rowVal = gvwHistory.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwHistory.deleteRow(rowVal);
        }
    }

    // 행추가
    const fn_addRowForGvwPlan = async function () {
        let rowVal = gvwPlan.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwPlan.addRow(true, {
                DEPOSIT_NUM : gfn_nvl(SBUxMethod.get("DEPOSIT_NUM")),
                INTERFACE_FLAG : "N",
                CONFIRM_FLAG : "N",
                COMPLETE_FLAG : "N"
            });
        }else{
            gvwPlan.insertRow(rowVal, 'below', {
                DEPOSIT_NUM : gfn_nvl(SBUxMethod.get("DEPOSIT_NUM")),
                INTERFACE_FLAG : "N",
                CONFIRM_FLAG : "N",
                COMPLETE_FLAG : "N"
            });
        }
    }

    // 행삭제
    const fn_deleteRowForGvwPlan = async function () {
        let rowVal = gvwPlan.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwPlan.deleteRow(rowVal);
        }
    }

    const fn_plan = async function () {
        if (gfn_comConfirm("Q0000", "기존 불입계획 정보를 초기화하고 새로운 불입계획 정보를 불러오시겠습니까?")) {
            var strdeposit_num = "";

            if (jsonDepositList.length > 0)
                strdeposit_num = gfn_nvl(gvwInfo.getCellData(gvwInfo.getRow(), gvwInfo.getColRef("DEPOSIT_NUM")));

            fnQRY_P_TRD2010_Q("PLAN");
            fnQRY_P_TRD2010_Q("DETAIL");
            if (strdeposit_num != "") {
                gvwInfo.clickRow(gvwInfo.getFilterDatas(gvwInfo.getColRef("DEPOSIT_NUM"), strdeposit_num)[0].row);
            }
        }
    }

    const fn_reCalc = async function () {
        if (gfn_comConfirm("Q0000", "기존 현재가치관리 정보를 초기화하고 새로운 정보를 불러오시겠습니까?")) {
            var strdeposit_num = "";

            if (gvwInfo.RowCount > 0)
                strdeposit_num = gfn_nvl(gvwInfo.getCellData(gvwInfo.getRow(), gvwInfo.getColRef("DEPOSIT_NUM")));

            fnQRY_P_TRD2010_Q("RECALC");
            fnQRY_P_TRD2010_Q("DETAIL");

            if (strdeposit_num != "") {
                gvwInfo.clickRow(gvwInfo.getFilterDatas(gvwInfo.getColRef("DEPOSIT_NUM"), strdeposit_num)[0].row);
            }
        }
    }

    const fn_amRecalc = async function () {}

    const fn_amortize = async function () {}

    window.addEventListener('DOMContentLoaded', async function(e) {
        let initObject = localStorage.getItem("callMain");
        await fn_initSBSelect();
        fn_createGvwInfoGrid();
        fn_createGvwHistoryGrid();
        fn_createGvwPlanGrid();
        fn_createGvwAmortizeGrid();

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
<!-- inline scripts related to this page -->
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>