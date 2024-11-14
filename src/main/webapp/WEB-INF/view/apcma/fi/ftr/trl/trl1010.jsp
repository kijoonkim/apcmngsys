<%
/**
 * @Class Name 		: trl1010.jsp
 * @Description 	: 차입금원장등록 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.10.17
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.10.17   	장성주		최초 생성
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
	<title>title : 차입금원장등록</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid" style="border-radius:0px">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 차입금원장등록 -->
                </div>
                <div style="margin-left: auto;">
                </div>
            </div>
            <div class="box-body">

				<div class="box-search-ma">
					<!--[pp] 검색 -->
					<!--[APC] START -->
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
					<!--[APC] END -->
					<table id="srchArea1" class="table table-bordered tbl_fixed table-search-ma">
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
								<sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode"
											 unselected-text="선택"
											 class="form-control input-sm inpt_data_reqed"></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg_search">조회기준일자</th>
							<td class="td_input">
								<sbux-datepicker
										id="SCH_BASE_DATE"
										uitype="popup"
										date-format="yyyy-mm-dd"
										class="table-datepicker-ma inpt_data_reqed">
								</sbux-datepicker>
							</td>
							<td colspan="3" style="border-right: hidden;"></td>
							<th scope="row" class="th_bg_search">만기차입금포함여부</th>
							<td colspan="3" class="td_input">
								<sbux-select id="SCH_ALL_YN" uitype="single" jsondata-ref="jsonAllYn"
											 unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg_search">차입금유형</th>
							<td colspan="3" class="td_input">
								<sbux-select id="SCH_LOAN_TYPE" uitype="single" jsondata-ref="jsonLoanType"
											 unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg_search">차입기관</th>
							<td class="td_input" data-group="SCH_BANK_CS_CODE">
								<sbux-input style="width:100%" id="SCH_BANK_CS_CODE" uitype="text"
											class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input" data-group="SCH_BANK_CS_CODE">
								<sbux-input style="width:100%" id="SCH_BANK_CS_NAME" uitype="text"
											class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" data-group="SCH_BANK_CS_CODE">
								<sbux-button
										class="btn btn-xs btn-outline-dark"
										text="…"
										uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1('1')"
								></sbux-button>
							</td>
							<td colspan="15" style="border-right: hidden;">&nbsp;</td>
						</tr>
						</tbody>
					</table>
				</div>
                
                <div class="row">
                
                    <div class="col-sm-6" style="width:100%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>차입금</span>
									<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb_area_grid_top" style="height:180px; width:100%;"></div>
                        </div>
                    </div>
                
                    <div class="col-sm-6" style="width:100%;padding-top:10px">
					
					    <sbux-tabs id="idxTab_norm1" name="idxTab_norm1" uitype="normal"
		                   title-target-id-array = "SB_TOP_TAB1^SB_TOP_TAB2^SB_TOP_TAB3^SB_TOP_TAB4<%--^SB_TOP_TAB5^SB_TOP_TAB6--%>^SB_TOP_TAB7^SB_TOP_TAB8"
		                   title-text-array = "기본정보^계정과목정보^상환정보^이율변동정보<%--^상환계획^현재가치관리--%>^손익계정^햇지정보"
		                   title-target-value-array="1^2^3^4<%--^5^6--%>^7^8"
		                   onclick="fn_tabClick(idxTab_norm1)"></sbux-tabs>					
						
						<div class="tab-content" style="height:530px;width:100%;padding-top:0px" >
						
							<div id="SB_TOP_TAB1" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>기본정보</span>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
					                    <sbux-button uitype="normal" text="파일첨부"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnAttch"></sbux-button>
									</div>
		                        </div>
		                        <div style="width:100%;">
		                        
		                        	<table id="srchArea2" class="table table-bordered tbl_fixed">
		                                <colgroup>
					                        <col style="width: 7%">
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 3%">
					                        
					                        <col style="width: 7%">
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 3%">
					                        
					                        <col style="width: 7%">
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 3%">
		                                </colgroup>
					                    <tbody>
					                    
			                                <tr>
			                                    <th scope="row" class="th_bg">회계단위</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select id="FM_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">차입금번호</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input id="FM_LOAN_NUM" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		
			                                                            
			                                    <th scope="row" class="th_bg">사업장</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select id="FM_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed"></sbux-select>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">차입금명</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input id="FM_LOAN_NAME" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>

												<td colspan="8" style="border-right: hidden;">&nbsp;</td>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">차입금유형</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:150px" id="FM_LOAN_TYPE" uitype="single" jsondata-ref="jsonLoanType" unselected-text="선택" class="form-control input-sm inpt_data_reqed" onchange="fn_editValLoanType()"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">분류1</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input id="FM_LOAN_CATEGORY1" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>

												<td colspan="4" style="border-right: hidden;">&nbsp;</td>

			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">분류2</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input id="FM_LOAN_CATEGORY2" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">분류3</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input id="FM_LOAN_CATEGORY3" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>

												<td colspan="4" style="border-right: hidden;">&nbsp;</td>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">차입기관</th>
												<td class="td_input" data-group="FM_BANK_CS_CODE">
													<sbux-input style="width:100%" id="FM_BANK_CS_CODE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_BANK_CS_CODE">
													<sbux-input style="width:100%" id="FM_BANK_CS_NAME" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_BANK_CS_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark inpt_data_reqed"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup1('2')"
													></sbux-button>
												</td>
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">은행</th>
												<td class="td_input" data-group="BANK_CODE">
													<sbux-input style="width:100%" id="FM_BANK_CODE" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="BANK_CODE">
													<sbux-input style="width:100%" id="FM_BANK_NAME" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
			                                    <td colspan="9" class="td_input" data-group="BANK_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup2()"></sbux-button>
													<font style="width:5px"></font>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">통화</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select id="FM_CURRENCY_CODE" uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed" onchange="fn_editValCurrency()"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">환율</th>
			                                    <td colspan="3" class="td_input">
					  								<sbux-input id="FM_EXCHANGE_RATE" uitype="text" class="form-control input-sm inpt_data_reqed" onchange="fn_editValEx()"></sbux-input>
			                                    </td>

												<td colspan="4" style="border-right: hidden;">&nbsp;</td>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">차입금액(통화)</th>
			                                    <td colspan="3" class="td_input">
					  								<sbux-input id="FM_LOAN_AMT" uitype="text" class="form-control input-sm inpt_data_reqed" onchange="fn_editValLoan()"></sbux-input>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">차입금액(전표)</th>
			                                    <td colspan="3" class="td_input">
					  								<sbux-input id="FM_LOAN_AMT_KRW" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
			                                    </td>

												<td colspan="4" style="border-right: hidden;">&nbsp;</td>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">입금계좌</th>
												<td class="td_input" data-group="FM_IN_DEPOSIT_CODE">
													<sbux-input style="width:100%" id="FM_IN_DEPOSIT_CODE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_IN_DEPOSIT_CODE">
													<sbux-input style="width:100%" id="FM_IN_DEPOSIT_NAME" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td colspan="9" class="td_input" data-group="FM_IN_DEPOSIT_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark inpt_data_reqed"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup3('1')"></sbux-button>
													<font style="width:5px"></font>
												</td>
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">출금계좌</th>
												<td class="td_input" data-group="FM_OUT_DEPOSIT_CODE">
													<sbux-input style="width:100%" id="FM_OUT_DEPOSIT_CODE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_OUT_DEPOSIT_CODE">
													<sbux-input style="width:100%" id="FM_OUT_DEPOSIT_NAME" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td colspan="9" class="td_input" data-group="FM_OUT_DEPOSIT_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark inpt_data_reqed"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup3('2')"
													></sbux-button>
												</td>
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">차입일</th>
			                                    <td colspan="3" class="td_input">
												    <sbux-datepicker
												            id="FM_LOAN_DATE"
												            uitype="popup"
												            date-format="yyyy-mm-dd"
												            class="form-control input-sm input-sm-ast inpt_data_reqed ">
												    </sbux-datepicker>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">만기일</th>
			                                    <td colspan="7" class="td_input">
												    <sbux-datepicker
												            id="FM_EXPIRE_DATE"
												            uitype="popup"
												            date-format="yyyy-mm-dd"
												            class="form-control input-sm input-sm-ast inpt_data_reqed">
												    </sbux-datepicker>
			                                    </td>

			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">년간이자일수</th>
			                                    <td colspan="11" class="td_input">
					                                <sbux-select style="width:200px" id="FM_LOAN_STATUS" uitype="single" jsondata-ref="jsonLoanStatus" unselected-text="선택" class="form-control input-sm inpt_data_reqed"></sbux-select>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">적요</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input id="FM_DESCR" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>

												<td colspan="8" style="border-right: hidden;">&nbsp;</td>
		                        			</tr>
		                        			
		                        		</tbody>
		                        	</table>		
		                        
		                        </div>							
							</div>
						
							<div id="SB_TOP_TAB2" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>계정과목 정보</span>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
									</div>
		                        </div>
		                        <div style="width:100%;">
		                        
		                        	<table id="srchArea3" class="table table-bordered tbl_fixed">
		                                <colgroup>
					                        <col style="width: 7%">
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 3%">
					                        
					                        <col style="width: 7%">
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 3%">
		                                </colgroup>
					                    <tbody>
			                                <tr>
			                                    <th scope="row" class="th_bg">부서</th>
												<td class="td_input" data-group="FM_DEPOSIT_CODE">
													<sbux-input style="width:100%" id="FM_DEPOSIT_CODE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_DEPOSIT_CODE">
													<sbux-input style="width:100%" id="FM_DEPOSIT_NAME" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td colspan="5" class="td_input" data-group="FM_DEPOSIT_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark inpt_data_reqed"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup4('1')"
													></sbux-button>
												</td>
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">원가중심점</th>
												<td class="td_input" data-group="FM_COST_CENTER_CODE">
													<sbux-input style="width:100%" id="FM_COST_CENTER_CODE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_COST_CENTER_CODE">
													<sbux-input style="width:100%" id="FM_COST_CENTER_NAME" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td  class="td_input" data-group="FM_COST_CENTER_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark inpt_data_reqed"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup5('1')"
													></sbux-button>
												</td>
			                                    <th scope="row" class="th_bg">차입금차입</th>
												<td class="td_input" data-group="FM_LOAN_START_TR_CODE">
													<sbux-input style="width:100%" id="FM_LOAN_START_TR_CODE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_LOAN_START_TR_CODE">
													<sbux-input style="width:100%" id="FM_LOAN_START_TR_NAME" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td  class="td_input" data-group="FM_LOAN_START_TR_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark inpt_data_reqed"
															text="…" uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup6('1')"
													></sbux-button>
												</td>
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">차입금계정</th>
												<td class="td_input" data-group="FM_LOAN_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_LOAN_ACCOUNT_CODE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_LOAN_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_LOAN_ACCOUNT_NAME" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td  class="td_input" data-group="FM_LOAN_ACCOUNT_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark inpt_data_reqed"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('1')"
													></sbux-button>
												</td>
			                                    <th scope="row" class="th_bg">차입금상환</th>
												<td class="td_input" data-group="FM_LOAN_REPAY_TR_CODE">
													<sbux-input style="width:100%" id="FM_LOAN_REPAY_TR_CODE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_LOAN_REPAY_TR_CODE">
													<sbux-input style="width:100%" id="FM_LOAN_REPAY_TR_NAME" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td  class="td_input" data-group="FM_LOAN_REPAY_TR_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark inpt_data_reqed"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup6('2')"
													></sbux-button>
												</td>
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">이자비용계정</th>
												<td class="td_input" data-group="FM_INTEREST_EXPENSE_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_INTEREST_EXPENSE_ACCOUNT_CODE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_INTEREST_EXPENSE_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_INTEREST_EXPENSE_ACCOUNT_NAME" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td  class="td_input" data-group="FM_INTEREST_EXPENSE_ACCOUNT_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark inpt_data_reqed"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('2')"
													></sbux-button>
												</td>
			                                    <th scope="row" class="th_bg">이자상환</th>
												<td class="td_input" data-group="FM_INTEREST_REPAY_TR_CODE">
													<sbux-input style="width:100%" id="FM_INTEREST_REPAY_TR_CODE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_INTEREST_REPAY_TR_CODE">
													<sbux-input style="width:100%" id="FM_INTEREST_REPAY_TR_NAME" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td  class="td_input" data-group="FM_INTEREST_REPAY_TR_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark inpt_data_reqed"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup6('3')"
													></sbux-button>
												</td>
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">선급비용계정</th>
												<td class="td_input" data-group="FM_PREPAID_ACC_CODE">
													<sbux-input style="width:100%" id="FM_PREPAID_ACC_CODE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_PREPAID_ACC_CODE">
													<sbux-input style="width:100%" id="FM_PREPAID_ACC_NAME" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td  class="td_input" data-group="FM_PREPAID_ACC_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark inpt_data_reqed"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('3')"
													></sbux-button>
												</td>
			                                    <th scope="row" class="th_bg">장기선급비용계정</th>
												<td class="td_input" data-group="FM_LONG_PREPAID_ACC_CODE">
													<sbux-input style="width:100%" id="FM_LONG_PREPAID_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_LONG_PREPAID_ACC_CODE">
													<sbux-input style="width:100%" id="FM_LONG_PREPAID_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td  class="td_input" data-group="FM_LONG_PREPAID_ACC_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('4')"
													></sbux-button>
												</td>
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">미지급비용계정</th>
												<td class="td_input" data-group="FM_ACCRUED_EXPENSE_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_ACCRUED_EXPENSE_ACCOUNT_CODE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_ACCRUED_EXPENSE_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_ACCRUED_EXPENSE_ACCOUNT_NAME" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td colspan="5" class="td_input" data-group="FM_ACCRUED_EXPENSE_ACCOUNT_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark inpt_data_reqed"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('5')"
													></sbux-button>
												</td>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">현재가치할인차금계정</th>
												<td class="td_input" data-group="FM_PRESENT_VALUE_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_PRESENT_VALUE_ACCOUNT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_PRESENT_VALUE_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_PRESENT_VALUE_ACCOUNT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td colspan="5" class="td_input" data-group="FM_PRESENT_VALUE_ACCOUNT_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('6')"
													></sbux-button>
												</td>
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">유동성대체계정(상환계정)</th>
												<td class="td_input" data-group="FM_LOAN_LIQUID_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_LOAN_LIQUID_ACCOUNT_CODE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_LOAN_LIQUID_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_LOAN_LIQUID_ACCOUNT_NAME" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
												</td>
												<td colspan="5" class="td_input" data-group="FM_LOAN_LIQUID_ACCOUNT_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark inpt_data_reqed"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('7')"
													></sbux-button>
												</td>
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">현재가치할인차금유동성대체계정</th>
												<td class="td_input" data-group="FM_PRESENT_VALUE_LIQUID_ACCT_CD">
													<sbux-input style="width:100%" id="FM_PRESENT_VALUE_LIQUID_ACCT_CD" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_PRESENT_VALUE_LIQUID_ACCT_CD">
													<sbux-input style="width:100%" id="FM_PRESENT_VALUE_LIQUID_ACCT_NM" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td colspan="5" class="td_input" data-group="FM_PRESENT_VALUE_LIQUID_ACCT_CD">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('8')"
													></sbux-button>
												</td>
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">사채할인차금이자비용</th>
												<td class="td_input" data-group="FM_PRESENT_VALUE_INTEREST_ACCT_CD">
													<sbux-input style="width:100%" id="FM_PRESENT_VALUE_INTEREST_ACCT_CD" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_PRESENT_VALUE_INTEREST_ACCT_CD">
													<sbux-input style="width:100%" id="FM_PRESENT_VALUE_INTEREST_ACCT_NM" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td colspan="5" class="td_input" data-group="FM_PRESENT_VALUE_INTEREST_ACCT_CD">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('9')"
													></sbux-button>
												</td>
		                        			</tr>
		                        		</tbody>
		                        	</table>
		                        </div>							
							</div>
							<div id="SB_TOP_TAB3" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>상환정보</span>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
									</div>
		                        </div>
		                        <div style="width:100%;">
		                        
		                        	<table id="srchArea4" class="table table-bordered tbl_fixed">
		                                <colgroup>
					                        <col style="width: 7%">
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 3%">
					                        
					                        <col style="width: 7%">
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 3%">
		                                </colgroup>
					                    <tbody>
			                                <tr>
												<th scope="row" class="th_bg">상환거래처</th>
												<td class="td_input" data-group="FM_REPAY_BANK_CS_CODE">
													<sbux-input style="width:100%" id="FM_REPAY_BANK_CS_CODE" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_REPAY_BANK_CS_CODE">
													<sbux-input style="width:100%" id="FM_REPAY_BANK_CS_NAME" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td colspan="5" class="td_input" data-group="FM_REPAY_BANK_CS_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup8()"
													></sbux-button>
												</td>
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">상환거래처계좌</th>
			                                    <td colspan="7" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
														<div class="dropdown">
															<button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="FM_REPAY_SEQ" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																<font>선택</font>
																<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
															</button>
															<div class="dropdown-menu" aria-labelledby="FM_REPAY_SEQ" style="width:300px;height:150px;padding-top:0px;overflow:auto">
															</div>
														</div>
					  									<font style="width:5px"></font>
						                                <sbux-select style="width:150px" id="FM_REPAY_BANK_CODE" uitype="single" jsondata-ref="jsonRepayBankCode" unselected-text="선택" class="form-control input-sm" readonly></sbux-select>
					  									<sbux-input style="width:150px" id="FM_REPAY_ACCOUNT_NUM" uitype="text" class="form-control input-sm" readonly></sbux-input>
					  									<sbux-input style="width:150px" id="FM_REPAY_ACCOUNT_OWNER" uitype="text" class="form-control input-sm" readonly></sbux-input>
						                           	</div>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">기상환금액</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_REPAY_AMT" uitype="text" class="form-control input-sm inpt_data_reqed" onchange="fn_editValRepay()"></sbux-input>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">미상환금액</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_REMAIN_LOAN_AMT" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">원금상환조건</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_REPAY_TERM" uitype="single" jsondata-ref="jsonRepayTerm" unselected-text="선택" class="form-control input-sm inpt_data_reqed"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">원금거치기간(개월)</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_DEFERRED_MM" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">원금상환주기(개월)</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_REPAY_CYCLE_MM" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">원금최초상환일</th>
			                                    <td colspan="3" class="td_input">
												    <sbux-datepicker
												            id="FM_REPAY_START_DATE"
												            uitype="popup"
												            date-format="yyyy-mm-dd"
												            class="form-control input-sm input-sm-ast inpt_data_reqed">
												    </sbux-datepicker>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">1회원금상환액</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_REPAY_PER_AMT" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">최초원금상환액</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_REPAY_FIRST_AMT" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
			                                    </td>		
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">원금상환일</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_REPAY_DD" uitype="single" jsondata-ref="jsonRepayDd" unselected-text="선택" class="form-control input-sm inpt_data_reqed"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">상환기준</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_REPAY_BASE" uitype="single" jsondata-ref="jsonRepayBase" unselected-text="선택" class="form-control input-sm inpt_data_reqed"></sbux-select>
			                                    </td>		
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">이자율구분</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_INTEREST_TYPE" uitype="single" jsondata-ref="jsonInterestType" unselected-text="선택" class="form-control input-sm inpt_data_reqed"></sbux-select>
			                                    </td>
			                                    <th scope="row" class="th_bg">약정이율</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_INTEREST_RATE" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
			                                    </td>		
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">이자지급기준</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_INTEREST_REPAY_TYPE" uitype="single" jsondata-ref="jsonInterestRepayType" unselected-text="선택" class="form-control input-sm inpt_data_reqed"></sbux-select>
			                                    </td>
			                                    <th scope="row" class="th_bg">이자일수계산기준</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_INTEREST_CALC_DAYS_TYPE" uitype="single" jsondata-ref="jsonInterestCalcDaysType" unselected-text="선택" class="form-control input-sm inpt_data_reqed"></sbux-select>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">이자거치기간(개월)</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_INTEREST_DEFERRED_MM" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">이자상환주기(개월)</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_INTEREST_REPAY_CYCLE_MM" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">이자최초상환일</th>
			                                    <td colspan="3" class="td_input">
												    <sbux-datepicker
												            id="FM_INTEREST_REPAY_START_DATE"
												            uitype="popup"
												            date-format="yyyy-mm-dd"
												            class="form-control input-sm input-sm-ast inpt_data_reqed">
												    </sbux-datepicker>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">이자상환일</th>
			                                    <td colspan="3" class="td_input">
												    <sbux-datepicker
												            id="FM_INTEREST_PAY_DD"
												            uitype="popup"
												            date-format="yyyy-mm-dd"
												            class="form-control input-sm input-sm-ast inpt_data_reqed">
												    </sbux-datepicker>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">년간이자일수</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_INTEREST_CALC_YEAR_TYPE" uitype="single" jsondata-ref="jsonInterestCalcYearType" unselected-text="선택" class="form-control input-sm inpt_data_reqed"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">이자기산일기준</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_INTEREST_CALC_BASE_DAY" uitype="single" jsondata-ref="jsonInterestCalcBaseDay" unselected-text="선택" class="form-control input-sm inpt_data_reqed"></sbux-select>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">유효이자율</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_EFFECTIVE_INTEREST_RATE" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">현재가치할인차금</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_LOAN_DISCOUNT_AMT" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">상각기준일</th>
			                                    <td colspan="3" class="td_input">
												    <sbux-datepicker
												            id="FM_AMORTIZE_BASE_DATE"
												            uitype="popup"
												            date-format="yyyy-mm-dd"
												            class="form-control input-sm input-sm-ast inpt_data_reqed">
												    </sbux-datepicker>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">차금상각주기(개월)</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_AMORTIZE_REPAY_CYCLE_MM" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">원금지급기준</th>
			                                    <td colspan="3" class="td_input">
					                            	<sbux-checkbox id="FM_REPAY_PREAUTH_PAY_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">이자지급기준</th>
			                                    <td colspan="3" class="td_input">
					                            	<sbux-checkbox id="FM_INTEREST_PREAUTH_PAY_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
			                                    </td>		
		                        			</tr>
		                        			
		                        		</tbody>
		                        	</table>
		                        	
		                        </div>							
							</div>
						
							<div id="SB_TOP_TAB4" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>이율변동정보</span>
											<%--<span style="font-size:12px">(조회건수 <span id="listCoun2">0</span>건)</span>--%>
		                                </li>
		                            </ul>
				                    <%--<div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
										<a href="#" id="btn1-row-add" class="cu-btn-plus" style="padding-left:10px" >
											<img src="../../../resource/images/plus.png" width="20px" /> 행추가
										</a>
										<a href="#" id="btn1-row-del" class="cu-btn-minus" style="padding-left:10px">
											<img src="../../../resource/images/minus.png" width="20px" /> 행삭제
										</a>
									</div>--%>
									<sbux-button
											id="btnDel"
											name="btnDel"
											uitype="normal"
											text="행삭제"
											class="btn btn-sm btn-outline-danger"
											onclick="fn_btnDel"
											style="float: right;"
									></sbux-button>
									<sbux-button
											id="btnAdd"
											name="btnAdd"
											uitype="normal"
											text="행추가"
											class="btn btn-sm btn-outline-danger"
											onclick="fn_btnAdd"
											style="float: right;"
									></sbux-button>
		                        </div>
		                        <div style="width:100%;">
		                            <div id="sb_area_grid_tap4" style="height:280px; width:100%;"></div>
		                        </div>							
							</div>
						
							<%--<div id="SB_TOP_TAB5" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>상환계획</span>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
									</div>
									<sbux-button
											id="btnDelPlan"
											name="btnDelPlan"
											uitype="normal"
											text="행삭제"
											class="btn btn-sm btn-outline-danger"
											onclick="fn_btnDelPlan()"
											style="float: right;"
									></sbux-button>
									<sbux-button
											id="btnAddPlan"
											name="btnAddPlan"
											uitype="normal"
											text="행추가"
											class="btn btn-sm btn-outline-danger"
											onclick="fn_btnAddPlan()"
											style="float: right;"
									></sbux-button>
		                        </div>
		                        <div style="width:100%;">
		                            <div id="sb_area_grid_tap5" style="height:280px; width:100%;"></div>
		                        </div>							
							</div>--%>
						
							<%--<div id="SB_TOP_TAB6" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>현재가치관리</span>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
									</div>
		                        </div>
		                        <div style="width:100%;">
		                            <div id="sb_area_grid_tap6" style="height:280px; width:100%;"></div>
		                        </div>							
							</div>--%>
						
							<div id="SB_TOP_TAB7" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>손익계정</span>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
									</div>
		                        </div>
		                        <div style="width:100%;">
		                        
		                        	<table id="srchArea5" class="table table-bordered tbl_fixed">
		                                <colgroup>
					                        <col style="width: 7%">
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 3%">
					                        
					                        <col style="width: 7%">
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 3%">
		                                </colgroup>
					                    <tbody>
			                                <tr>
			                                    <th scope="row" class="th_bg">환차익계정</th>
												<td class="td_input" data-group="FM_EXCHANGE_GAIN_ACC_CODE">
													<sbux-input style="width:100%" id="FM_EXCHANGE_GAIN_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_EXCHANGE_GAIN_ACC_CODE">
													<sbux-input style="width:100%" id="FM_EXCHANGE_GAIN_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td  colspan="5" class="td_input" data-group="FM_EXCHANGE_GAIN_ACC_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															id="FM_EXCHANGE_GAIN_ACC_BTN"
															onclick="fn_compopup10('1')"
													></sbux-button>
												</td>
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">환차손계정</th>
												<td class="td_input" data-group="FM_EXCHANGE_LOSS_ACC_CODE">
													<sbux-input style="width:100%" id="FM_EXCHANGE_LOSS_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_EXCHANGE_LOSS_ACC_CODE">
													<sbux-input style="width:100%" id="FM_EXCHANGE_LOSS_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td  colspan="5" class="td_input" data-group="FM_EXCHANGE_LOSS_ACC_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															id="FM_EXCHANGE_LOSS_ACC_BTN"
															onclick="fn_compopup10('2')"
													></sbux-button>
												</td>
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">환평가이익계정</th>
												<td class="td_input" data-group="FM_VAL_GAIN_ACC_CODE">
													<sbux-input style="width:100%" id="FM_VAL_GAIN_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_VAL_GAIN_ACC_CODE">
													<sbux-input style="width:100%" id="FM_VAL_GAIN_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td  colspan="5" class="td_input" data-group="FM_VAL_GAIN_ACC_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															id="FM_VAL_GAIN_ACC_BTN"
															target-id="modal-compopup1"
															onclick="fn_compopup10('3')"
													></sbux-button>
												</td>
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">환평가손실계정</th>
												<td class="td_input" data-group="FM_VAL_LOSS_ACC_CODE">
													<sbux-input style="width:100%" id="FM_VAL_LOSS_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_VAL_LOSS_ACC_CODE">
													<sbux-input style="width:100%" id="FM_VAL_LOSS_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td  colspan="5" class="td_input" data-group="FM_VAL_LOSS_ACC_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															id="FM_VAL_LOSS_ACC_BTN"
															target-id="modal-compopup1"
															onclick="fn_compopup10('4')"
													></sbux-button>
												</td>
		                        			</tr>
		                        		</tbody>	
		                        	</table>
		                        	
		                        </div>							
							</div>
						
							<div id="SB_TOP_TAB8" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>햇지정보</span>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
									</div>
		                        </div>
		                        <div style="width:100%;">
		                        
		                        	<table id="srchArea6" class="table table-bordered tbl_fixed">
		                                <colgroup>
					                        <col style="width: 7%">
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 3%">
					                        
					                        <col style="width: 7%">
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 3%">
		                                </colgroup>
					                    <tbody>
			                                <tr>
			                                    <th scope="row" class="th_bg">햇지상품여부</th>
			                                    <td colspan="7" class="td_input">
					                            	<sbux-checkbox id="FM_HDG_FLAG" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">파생상품거래처</th>
												<td class="td_input" data-group="FM_HDG_CS_CODE">
													<sbux-input style="width:100%" id="FM_HDG_CS_CODE" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_HDG_CS_CODE">
													<sbux-input style="width:100%" id="FM_HDG_CS_NAME" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td  colspan="5" class="td_input" data-group="FM_HDG_CS_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup1('3')"
													></sbux-button>
												</td>
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">파생상품이익계정</th>
												<td class="td_input" data-group="FM_HDG_GAIN_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_HDG_GAIN_ACCOUNT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_HDG_GAIN_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_HDG_GAIN_ACCOUNT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td  colspan="5" class="td_input" data-group="FM_HDG_GAIN_ACCOUNT_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('10')"
													></sbux-button>
												</td>
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">파생상품손실계정</th>
												<td class="td_input" data-group="FM_HDG_LOSS_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_HDG_LOSS_ACCOUNT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_HDG_LOSS_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_HDG_LOSS_ACCOUNT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td  colspan="5" class="td_input" data-group="FM_HDG_LOSS_ACCOUNT_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup10('5')"
													></sbux-button>
												</td>
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">파생상품가계정</th>
												<td class="td_input" data-group="FM_HDG_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_HDG_ACCOUNT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td class="td_input" data-group="FM_HDG_ACCOUNT_CODE">
													<sbux-input style="width:100%" id="FM_HDG_ACCOUNT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
												</td>
												<td  colspan="5" class="td_input" data-group="FM_HDG_ACCOUNT_CODE">
													<sbux-button
															class="btn btn-xs btn-outline-dark"
															text="…"
															uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('11')"
													></sbux-button>
												</td>
		                        			</tr>
			                                <tr>
			                                    <th scope="row" class="th_bg">파생상품내역</th>
			                                    <td colspan="7" class="td_input">
					  								<sbux-input style="width:400px" id="FM_HDG_DESCR" uitype="text" class="form-control input-sm"></sbux-input>
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
        			
    </section>
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:700px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:700px" id="modal-compopup3" name="modal-compopup3" uitype="middle" header-title="" body-html-id="body-modal-compopup3" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup3">
    	<jsp:include page="../../../com/popup/comPopup3.jsp"></jsp:include>
    </div>
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.userId}';
	
	var p_ss_languageID	= '${loginVO.maLanguageID}';
	//-----------------------------------------------------------

	var p_sel_rowData =  null;

	// 현재탭 [ 기본정보 = 1 , 계정과목정보 = 2, 상환정보 = 3, 이율변동정보 = 4, 상환계획 = 5, 현재가치관리 = 6, 손익계정 = 7, 햇지정보 = 8]
	var p_sel_tab			= 1;
	var bQuery = false;
	var bfocuschange = false;
	
    //grid 초기화
    var Trl1010GridTop; 			// 그리드를 담기위한 객체 선언
    var jsonTrl1010Top 	= []; 		// 그리드의 참조 데이터 주소 선언
    
    var Trl1010GridTab4; 			// 그리드를 담기위한 객체 선언
    var jsonTrl1010Tab4	= []; 		// 그리드의 참조 데이터 주소 선언
    
	var jsonFiOrgCode		= [];	// APC명
	var jsonAllYn			= [];	// 만기차입금포함여부
	
	var jsonSiteCode		= [];	// 사업장
	var jsonLoanType		= [];	// 차입금유형
	var jsonCurrencyCode	= [];	// 통화
	var jsonLoanStatus		= [];	// 년간이자일수
	var jsonRepayBankCode	= [];	// 상환거래처계좌
	var jsonRepayTerm		= [];	// 원금상환조건
	var jsonRepayDd			= [];	// 원금상환일
	var jsonRepayBase		= [];	// 상환기준
	var jsonInterestType	= [];	// 이자율구분
	var jsonBankCsCode		= [];	// 금융기관
	var jsonBankAccountSeq	= [];	// 계좌정보

	var jsonInterestRepayType		= [];	// 이자지급기준
	var jsonInterestCalcDaysType	= [];	// 이자일수계산기준
	var jsonInterestCalcYearType	= [];	// 년간이자일수
	var jsonInterestCalcBaseDay		= [];	// 이자기산일기준
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // APC명
            gfnma_setComSelect(['SCH_FI_ORG_CODE','FM_FI_ORG_CODE'],		jsonFiOrgCode, 	'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 만기차입금포함여부
            gfnma_setComSelect(['SCH_ALL_YN'],			jsonAllYn, 			'L_FIF016', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 차입금유형
            gfnma_setComSelect(['SCH_LOAN_TYPE', 'FM_LOAN_TYPE'],		jsonLoanType, 		'L_FIF003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            
            // 사업장
            gfnma_setComSelect(['FM_SITE_CODE'],		jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 차입금유형
            //gfnma_setComSelect(['FM_LOAN_TYPE'],		jsonLoanType, 		'P_FIF002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'LOAN_NUM', 'LOAN_NAME', 'Y', ''),
            // 사업장
            //gfnma_setComSelect(['FM_SITE_CODE'],		jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['FM_CURRENCY_CODE'],	jsonCurrencyCode,	'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 년간이자일수
            gfnma_setComSelect(['FM_LOAN_STATUS'],		jsonLoanStatus,		'L_FIF004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상환거래처계좌
            gfnma_setComSelect(['FM_REPAY_BANK_CODE'],	jsonRepayBankCode,	'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 원금상환조건
            gfnma_setComSelect(['FM_REPAY_TERM'],		jsonRepayTerm,		'L_FIF005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 원금상환일
            gfnma_setComSelect(['FM_REPAY_DD'],			jsonRepayDd,		'L_COM010', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상환기준
            gfnma_setComSelect(['FM_REPAY_BASE'],		jsonRepayBase,		'L_FIF017', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 이자율구분
            gfnma_setComSelect(['FM_INTEREST_TYPE'],	jsonInterestType,	'L_FIF006', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            
            // 이자지급기준
            gfnma_setComSelect(['FM_INTEREST_REPAY_TYPE'],		jsonInterestRepayType,		'L_FIF007', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 이자일수계산기준
            gfnma_setComSelect(['FM_INTEREST_CALC_DAYS_TYPE'],	jsonInterestCalcDaysType,	'L_FIF008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 년간이자일수
            gfnma_setComSelect(['FM_INTEREST_CALC_YEAR_TYPE'],	jsonInterestCalcYearType,	'L_FIF039', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 이자기산일기준
            gfnma_setComSelect(['FM_INTEREST_CALC_BASE_DAY'],	jsonInterestCalcBaseDay,	'L_FIF043', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//금융기관
			gfnma_setComSelect(['Trl1010GridTop'],	jsonBankCsCode,	'L_CS_BANK', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CS_CODE', 'BANK_CS_NAME', 'Y', ''),

			// 계좌정보
			gfnma_setComSelect([''], jsonBankAccountSeq, 'L_CS_ACCOUNT', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_ACCOUNT_SEQ', 'SEQ_NAME', 'Y', ''),

			gfnma_multiSelectInit({
				target: ['#FM_REPAY_SEQ']
				, compCode: gv_ma_selectedApcCd
				, clientCode: gv_ma_selectedClntCd
				, bizcompId: 'L_CS_ACCOUNT'
				, whereClause: "AND a.cs_code = '" + gfn_nvl(SBUxMethod.get("FM_REPAY_BANK_CODE")) + "' AND '" + gfn_nvl(SBUxMethod.get("FM_LOAN_DATE")) + "' BETWEEN a.effect_start_date AND a.effect_end_date"
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

					if (_.isEmpty(value) == false){

						SBUxMethod.set('FM_REPAY_BANK_CODE', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BANK_CODE"]);
						SBUxMethod.set('FM_REPAY_ACCOUNT_NUM', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BANK_ACCOUNT_NO"]);
						SBUxMethod.set('FM_REPAY_ACCOUNT_OWNER', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["DESCRIPTION"]);
						//SBUxMethod.set('BNKCNT', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BNKCNT"]);
					}
				}
			}),

		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state('L');
  		
		fn_createTrl1010GridTop();
		fn_createTrl1010GridTab4();
		//fn_createTrl1010GridTab5();
		//fn_createTrl1010GridTab6();
		//cfn_search();

		let openDate = gfn_dateToYmd(new Date());

		SBUxMethod.set('SCH_BASE_DATE', openDate);

	} 
	
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	fn_init();
    });

    
    /**
     * 화면 state 변경
     */
    function fn_state(type) {
    	

    }

	/**
	 * 신규
	 */
	function cfn_add() {

		/*** 기본정보 테이블***/
		gfnma_uxDataClear('#srchArea2');
		/*** 계정과목 정보 테이블***/
		gfnma_uxDataClear('#srchArea3');
		/*** 상환정보 테이블***/
		gfnma_uxDataClear('#srchArea4');
		/*** 손익계정 테이블***/
		gfnma_uxDataClear('#srchArea5');
		/*** 햇지정보 테이블***/
		gfnma_uxDataClear('#srchArea6');

		/*** 이율변동정보 그리드 ***/
		jsonTrl1010Tab4.length = 0;
		Trl1010GridTab4.rebuild();

		/*** 상환계획  그리드***/
		//jsonTrl1010Tab5.length = 0;
		//Trl1010GridTab5.rebuild();

		/*** 현재가치관리  그리드***/
		//jsonTrl1010Tab6.length = 0;
		//Trl1010GridTab6.rebuild();


	}

	/**
	 * 저장
	 */
	async function cfn_save() {

		// 수정 저장
		if (gfn_comConfirm("Q0001", "수정 저장")) {

			let strStatus = "";

			let REPAY_PREAUTH_PAY_YN = gfn_nvl(SBUxMethod.get("FM_REPAY_PREAUTH_PAY_YN")); //원금지급기준(자동이체여부)
			let INTEREST_PREAUTH_PAY_YN = gfn_nvl(SBUxMethod.get("FM_INTEREST_PREAUTH_PAY_YN")); //이자지급기준
			let REPAY_SEQ = gfnma_multiSelectGet('#REPAY_SEQ');

			if ((_.isEqual(REPAY_PREAUTH_PAY_YN, 'N') || _.isEqual(INTEREST_PREAUTH_PAY_YN, 'N')) && REPAY_SEQ == '')
			{
				gfn_comConfirm("Q0000", "원금/이자지급 중 자동이체가 아닌건의 경우 상환거래처 계좌가 반드시 필요합니다.");
				//SetMessageBox(GetFormMessage("TRL1010_005")); //원금/이자지급 중 자동이체가 아닌건의 경우 상환거래처 계좌가 반드시 필요합니다.
				//cbobank_account_seq.Focus();
				return;
			}

			let FM_LOAN_NUM = gfn_nvl(SBUxMethod.get("FM_LOAN_NUM")); //차입금번호

			if (FM_LOAN_NUM == '') {
				strStatus = "N";
			} else {
				strStatus = "U";
			}

			if (await fn_P_TRL1010_S(strStatus) == false){
				return;
			}
			if (await fn_P_TRL1010_S1() == false) {
				return;
			}

			await gfn_comAlert("I0001"); // I0001	처리 되었습니다.
			fn_P_TRL1010_Q_LIST('LIST');

		}

	}

	/**
	 * 삭제
	 */
	async function cfn_del() {

		if (gfn_comConfirm("Q0001", "삭제")) {

			if (await fn_P_TRL1010_S('D') == false){

				await gfn_comAlert("I0001"); // I0001	처리 되었습니다.
				fn_P_TRL1010_Q_LIST('LIST');

				let infoData = Trl1010GridTop.getGridDataAll();

				if (infoData.length == 0){

					/*** 기본정보 테이블***/
					gfnma_uxDataClear('#srchArea2');
					/*** 계정과목 정보 테이블***/
					gfnma_uxDataClear('#srchArea3');
					/*** 상환정보 테이블***/
					gfnma_uxDataClear('#srchArea4');
					/*** 손익계정 테이블***/
					gfnma_uxDataClear('#srchArea5');
					/*** 햇지정보 테이블***/
					gfnma_uxDataClear('#srchArea6');

					/*** 이율변동정보 그리드 ***/
					jsonTrl1010Tab4.length = 0;
					Trl1010GridTab4.rebuild();

					/*** 상환계획  그리드***/
					//jsonTrl1010Tab5.length = 0;
					//Trl1010GridTab5.rebuild();

					/*** 현재가치관리  그리드***/
					//jsonTrl1010Tab6.length = 0;
					//Trl1010GridTab6.rebuild();

				}

			}

		}
	}
    
    /**
     * 목록 조회
     */
 	function cfn_search() {
 		fn_state('L');
		fn_P_TRL1010_Q_LIST('LIST');
    	//fn_setTrl1010GridTop('LIST');
    }

	/**
	 * 초기화
	 */
	var cfn_init = function() {
		gfnma_uxDataClear('#srchArea1');
	}

	//차입금
    function fn_createTrl1010GridTop() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid_top';
	    SBGridProperties.id 				= 'Trl1010GridTop';
	    SBGridProperties.jsonref 			= 'jsonTrl1010Top';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total 				= {
                type 		: 'grand',
                position	: 'bottom',
                columns		: {
                    standard : [0],
                    sum : [7,8,9]
                },
                grandtotalrow : {
                    titlecol 		: 6,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["차입금번호"],	ref: 'LOAN_NUM', 	type:'output',  	width:'200px',  	style:'text-align:left'},
			{caption : ["회계단위"], ref : 'FI_ORG_CODE', width : '200px', style : 'text-align:center', type : 'combo', hidden : true,
				typeinfo : {ref : 'jsonFiOrgCode',  label : 'label', value : 'value'}/*, disabled: true*/
			},
			{caption : ["금융기관"], ref : 'BANK_CS_CODE', width : '200px', style : 'text-align:center', type : 'combo',
				typeinfo : {ref : 'jsonBankCsCode',  label : 'label', value : 'value'}, disabled: true
			},
			{caption : ["사업장"], ref : 'SITE_CODE', width : '200px', style : 'text-align:center', type : 'combo',
				typeinfo : {ref : 'jsonSiteCode',  label : 'label', value : 'value'}, disabled: true
			},
			{caption : ["차입금유형"], ref : 'LOAN_TYPE', width : '200px', style : 'text-align:center', type : 'combo',
				typeinfo : {ref : 'jsonLoanType',  label : 'label', value : 'value'}, disabled: true
			},
			{caption: ["차입금명"],	ref: 'LOAN_NAME',	type:'output',  	width:'250px',  	style:'text-align:left'}, //P_FIM002 DBOBIZCOMPONENT 에 값이 없음.
			{caption : ["통화"], ref : 'CURRENCY_CODE', width : '200px', style : 'text-align:center', type : 'combo',
				typeinfo : {ref : 'jsonCurrencyCode',  label : 'label', value : 'value'}, disabled: true
			},
			{caption: ["차입금액(통화)"],	ref: 'LOAN_AMT',  		type:'output',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption: ["상환금액(통화)"],	ref: 'REPAY_AMT',   	type:'output',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption: ["잔액(통화)"],	ref: 'REMAIN_AMT', 		type:'output',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption: ['차입일'], ref: 'LOAN_DATE', 	width:'200px',	type: 'inputdate', style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			{caption: ['만기일'], ref: 'EXPIRE_DATE', 	width:'200px',	type: 'inputdate', style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			{caption: ["약정이율"],         ref: 'INTEREST_RATE',    type:'output',  	width:'150px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
			},
			{caption: ["분류1"],			ref: 'LOAN_CATEGORY1',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
			{caption: ["분류2"],			ref: 'LOAN_CATEGORY2',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
			{caption: ["분류3"],			ref: 'LOAN_CATEGORY3',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
			{caption: ["repay_bank_cs_code"],	ref: 'REPAY_BANK_CS_CODE',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
			{caption: ["repay_seq"],			ref: 'REPAY_SEQ',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
        ];

        Trl1010GridTop = _SBGrid.create(SBGridProperties);
        Trl1010GridTop.bind('click', 'fn_view');
    }

	//이율변동정보
    function fn_createTrl1010GridTab4() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid_tap4';
	    SBGridProperties.id 				= 'Trl1010GridTab4';
	    SBGridProperties.jsonref 			= 'jsonTrl1010Tab4';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["차입금번호"],		ref: 'LOAN_NUM', 			type:'input',  	width:'250px',  	style:'text-align:left'},
            //TODO : 화면상에는 순번 컬럼이지만 C#코드에서는 계획연변으로 되어있는 것으로 추측
			{caption: ["순번"], 			ref: 'PLAN_SEQ', 		 	type:'output',  	width:'100px',  	style:'text-align:left'},
			{caption: ['적용시작일'], 	ref: 'INTEREST_FROM_DATE', 	type:'inputdate',	width:'200px', 		style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}},
			{caption: ['적용종료일'], 	ref: 'INTEREST_TO_DATE', 	type:'inputdate',	width:'200px', 		style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}},
			{caption: ["이자율"],        ref: 'INTEREST_RATE',    type:'input',  	width:'150px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}},
			{caption: ["확정여부"], ref: 'CONFIRM_FLAG', type: 'checkbox', width: '100px', style: 'text-align:center',
				typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			//TODO: 화면상에는 있는 컬럼이지만 C#코드에는 없는 컬럼( 화면과 같아야 할 것 같아 임의로 넣었음
			{caption: ["적요"],	ref: 'DESCR',	type:'input',  width:'350px',  style:'text-align:left'},
			{caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'},//스타일상 빈값


			{caption: ['상환예정일'], ref: 'REPAY_PLAN_DATE', 	width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}, hidden : true },
			{caption : ["통화"], ref : 'CURRENCY_CODE', width : '100px', style : 'text-align:center', type : 'combo',
				typeinfo : {ref : 'jsonCurrencyCode',  label : 'label', value : 'value'}, hidden : true
			},
			{caption: ["총상환액"],		ref: 'REPAY_TOTAL_AMT',   	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}, hidden : true},
			{caption: ["차입금대체"],		ref: 'REPAY_TRANSFER_AMT',  type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}, hidden : true},
			{caption: ["원금상환예정액"],	ref: 'REPAY_PLAN_AMT',   	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}, hidden : true},
			{caption: ["차입금잔액"],		ref: 'REMAIN_LOAN_AMT',   	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}, hidden : true},
			{caption: ["이자상환예정액"],	ref: 'INTEREST_REPAY_PLAN_AMT', type:'output',  width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}, hidden : true},
			{caption : ["이자일수"], 	ref : 'INTEREST_DAY', 		type:'combo',		width:'100px', 	style : 'text-align:center',
				typeinfo : {ref : 'jsonRepayDd',  label : 'label', value : 'value'}, hidden : true
			},
			{caption: ["전송여부"], ref: 'INTERFACE_FLAG', type: 'checkbox', width: '70px', style: 'text-align:center',
				typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}, hidden : true
			},
			{caption: ["완료여부"], ref: 'COMPLETE_FLAG', type: 'checkbox', width: '70px', style: 'text-align:center',
				typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}, hidden : true
			},
			{caption: ["id"],	ref: 'TXN_ID',	type:'output',  width:'300px',  style:'text-align:left' , hidden : true},

        ];

        Trl1010GridTab4 = _SBGrid.create(SBGridProperties);
        //Trl1010GridTab4.bind('click', 			'fn_viewTrl1010GridTab4Event');
    }

	//상환계획
    /*function fn_createTrl1010GridTab5() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid_tap5';
	    SBGridProperties.id 				= 'Trl1010GridTab5';
	    SBGridProperties.jsonref 			= 'jsonTrl1010Tab5';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
			{caption: ["차입금번호"], 		ref: 'LOAN_NUM', 			  	type:'output',  	width:'230px',  	style:'text-align:left'},
			{caption: ["계획연번"], 		ref: 'PLAN_SEQ', 			  	type:'output',  	width:'200px',  	style:'text-align:left'},
			{caption: ['상환예정일'], 	ref: 'REPAY_PLAN_DATE', 	type:'datepicker',	width:'220px', 		style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}},
			{caption : ["통화"], 		ref : 'CURRENCY_CODE', width : '200px', style : 'text-align:center', type : 'combo',
				typeinfo : {ref : 'jsonCurrencyCode',  label : 'label', value : 'value'}},
			{caption: ["총상환액"],		ref: 'REPAY_TOTAL_AMT',  	type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}, hidden : true},
			{caption: ["차입금대체"],		ref: 'REPAY_TRANSFER_AMT',  type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}, hidden : true},
			{caption: ["원금상환예정액"],	ref: 'REPAY_PLAN_AMT',  type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}, hidden : true},
			{caption: ["차입금잔액"],		ref: 'REMAIN_LOAN_AMT',  type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}, hidden : true},
			{caption: ["이자상환예정액"],	ref: 'INTEREST_REPAY_PLAN_AMT',  type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}, hidden : true},
			{caption: ["이자율"],        ref: 'INTEREST_RATE',    type:'input',  	width:'200px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}},
			{caption : ["이자일수"], 	ref : 'INTEREST_DAY', 		type:'combo',		width:'200px', 	style : 'text-align:center',
				typeinfo : {ref : 'jsonRepayDd',  label : 'label', value : 'value'}
			},
			{caption: ['적용시작일'], 	ref: 'INTEREST_FROM_DATE', 	type:'datepicker',	width:'220px', 		style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}},
			{caption: ['적용종료일'], 	ref: 'INTEREST_TO_DATE', 	type:'datepicker',	width:'220px', 		style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}},
			{caption: ["확정여부"], 	ref: 'CONFIRM_FLAG', type: 'checkbox', width: '100px', style: 'text-align:center',
				typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			{caption: ["전송여부"], 	ref: 'INTERFACE_FLAG', type: 'checkbox', width: '100px', style: 'text-align:center',
				typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			{caption: ["완료여부"], 	ref: 'COMPLETE_FLAG', type: 'checkbox', width: '100px', style: 'text-align:center',
				typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			{caption: ["id"],	ref: 'TXN_ID',	type:'output',  width:'300px',  style:'text-align:left' , hidden : true},

        ];

        Trl1010GridTab5 = _SBGrid.create(SBGridProperties);
        //Trl1010GridTab5.bind('click', 			'fn_viewTrl1010GridTab5Event');
    }*/

	//현재가치관리
   /* function fn_createTrl1010GridTab6() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid_tap6';
	    SBGridProperties.id 				= 'Trl1010GridTab6';
	    SBGridProperties.jsonref 			= 'jsonTrl1010Tab6';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
			{caption: ["계획연번"], 		ref: 'PLAN_SEQ', 			  	type:'output',  	width:'150px',  	style:'text-align:left'},
			{caption: ['상환예정일'], 	ref: 'REPAY_PLAN_DATE', 	type:'datepicker',	width:'120px', 		style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}},
			{caption : ["통화"], 		ref : 'CURRENCY_CODE', width : '120px', style : 'text-align:center', type : 'combo',
				typeinfo : {ref : 'jsonCurrencyCode',  label : 'label', value : 'value'}},
			{caption: ["이자율"],        ref: 'INTEREST_RATE',    type:'input',  	width:'100px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}},
			{caption: ["유효이자율"],     ref: 'EFFECTIVE_INTEREST_RATE',    type:'input',  	width:'100px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}},
			{caption: ["원금"],			ref: 'REMAIN_LOAN_AMT',   	type:'output',  	width:'130px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
			{caption: ["원금상환액"],		ref: 'REPAY_PLAN_AMT',  	type:'output',  	width:'130px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
			{caption: ["차입금대체"],		ref: 'REPAY_TRANSFER_AMT',  type:'output',  	width:'130px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
			{caption: ["유효이자"],		ref: 'EFFECTIVE_INTEREST_PLAN_AMT',  type:'output',  	width:'130px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
			{caption: ["액면이자"],		ref: 'INTEREST_REPAY_PLAN_AMT',  type:'output',  	width:'130px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
			{caption: ["상각액"],		ref: 'AMORTIZE_PLAN_AMT',  type:'output',  	width:'130px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
			{caption: ["장부가액"],		ref: 'LOAN_BOOK_VALUE_AMT',  type:'output',  	width:'130px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
			{caption: ['시작일자'], 		ref: 'INTEREST_FROM_DATE', 	type:'datepicker',	width:'120px', 		style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}},
			{caption: ['종료일자'], 		ref: 'INTEREST_TO_DATE', 	type:'datepicker',	width:'120px', 		style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}},
			{caption: ["확정여부"], 	ref: 'CONFIRM_FLAG', type: 'checkbox', width: '70px', style: 'text-align:center',
				typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			{caption: ["전송여부"], 	ref: 'INTERFACE_FLAG', type: 'checkbox', width: '70px', style: 'text-align:center',
				typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			{caption: ["완료여부"], 	ref: 'COMPLETE_FLAG', type: 'checkbox', width: '70px', style: 'text-align:center',
				typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false}, checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
        ];

        Trl1010GridTab6 = _SBGrid.create(SBGridProperties);
        //Trl1010GridTab6.bind('click', 			'fn_viewTrl1010GridTab6Event');
    }*/
    
    /**
     * 차입기관 
     */
    function fn_compopup1(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfn_nvl(SBUxMethod.get("SCH_BANK_CS_CODE"));
            searchText2 	= gfn_nvl(SBUxMethod.get("SCH_BANK_CS_NAME"));
        } else if(type=='2'){
            searchText1 	= gfn_nvl(SBUxMethod.get("FM_BANK_CS_CODE"));
            searchText2 	= gfn_nvl(SBUxMethod.get("FM_BANK_CS_NAME"));
        } else if(type=='3'){
            searchText1 	= gfn_nvl(SBUxMethod.get("FM_HDG_CS_CODE"));
            searchText2 	= gfn_nvl(SBUxMethod.get("FM_HDG_CS_NAME"));
        }        
        
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var strWhereClause 	= "AND A.CS_CODE LIKE '%" + replaceText0 + "%' AND A.CS_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_CS_BANK'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["거래처코드", 	"거래처명칭"]
  			,searchInputFields		: ["CS_CODE", 		"CS_NAME"]
  			,searchInputValues		: [searchText1, 	searchText2]
    		,width					: '700px'
    		,height					: '400px'
  			,tableHeader			: ["거래처코드",	"거래처명",		"은행코드",		"은행명",		"사업자번호",		"주소"]
  			,tableColumnNames		: ["CS_CODE", 	 	"CS_NAME",		"BANK_CODE",	"BANK_NAME",	"BIZ_REGNO",		"ADDRESS"]
  			,tableColumnWidths		: ["100px", 		 "250px",		"100px",		"100px",		"150px",			"300px"]
			,itemSelectEvent		: function (data){
		        if(type=='1'){
					SBUxMethod.set('SCH_BANK_CS_CODE', 	data.CS_CODE);
					SBUxMethod.set('SCH_BANK_CS_NAME', 	data.CS_NAME);
		        } else if(type=='2'){
					SBUxMethod.set('FM_BANK_CS_CODE', 	data.CS_CODE);
					SBUxMethod.set('FM_BANK_CS_NAME', 	data.CS_NAME);
		        } else if(type=='3'){
					SBUxMethod.set('FM_HDG_CS_CODE', 	data.CS_CODE);
					SBUxMethod.set('FM_HDG_CS_NAME', 	data.CS_NAME);
		        }
			},
    	});
    }
    
    /**
     * 은행 
     */
    function fn_compopup2() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("FM_BANK_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("FM_BANK_NAME"));
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
                SBUxMethod.set('FM_BANK_CODE', data.BANK_CODE);
                SBUxMethod.set('FM_BANK_NAME', data.BANK_NAME);
            },
        });
    }
    
    /**
     * 입금계좌 
     */
     function fn_compopup3(type) {
        var searchCode 		= '';
        var searchName 		= '';
        if(type=='1'){
            searchCode 		= gfn_nvl(SBUxMethod.get("FM_IN_DEPOSIT_CODE"));
            searchName 		= gfn_nvl(SBUxMethod.get("FM_IN_DEPOSIT_NAME"));
        } else if (type=='2'){
            searchCode 		= gfn_nvl(SBUxMethod.get("FM_OUT_DEPOSIT_CODE"));
            searchName 		= gfn_nvl(SBUxMethod.get("FM_OUT_DEPOSIT_NAME"));
        }
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
            ,searchCaptions			: ["코드", 			"코드명"]
            ,searchInputFields		: ["DEPOSIT_CODE", 	"DEPOSIT_NAME"]
            ,searchInputValues		: [searchCode, 		searchName]
            ,height					: '400px'
            ,tableHeader			: ["계좌코드", 		"계좌명", 		"계좌유형명", 		"계좌번호", 	"은행코드", 	"은행명", 		"개설일", 		"만기일"]
            ,tableColumnNames		: ["DEPOSIT_CODE", 	"DEPOSIT_NAME", "DEPOSIT_TYPE_NAME","ACCOUNT_NUM", 	"BANK_CODE", 	"BANK_NAME", 	"OPEN_DATE", 	"EXPIRE_DATE"]
            ,tableColumnWidths		: ["120px", 		"160px", 		"100px", 			"200px", 		"100px", 		"140px", 		"100px", 		"100px"]
            ,itemSelectEvent		: function (data){
                if(type=='1'){
	                SBUxMethod.set('FM_IN_DEPOSIT_CODE', data.DEPOSIT_NAME);
	                SBUxMethod.set('FM_IN_DEPOSIT_NAME', data.DEPOSIT_CODE);
                } else if (type=='2'){
	                SBUxMethod.set('FM_OUT_DEPOSIT_CODE', data.DEPOSIT_NAME);
	                SBUxMethod.set('FM_OUT_DEPOSIT_NAME', data.DEPOSIT_CODE);
                }
            },
        });
    }
    
     /**
      * 담당부서 
      */
     function fn_compopup4(type) {
     	
         var searchText1		= '';
         var searchText2		= '';
         if(type=='1'){
             searchText1		= gfn_nvl(SBUxMethod.get("FM_DEPOSIT_CODE"));
             searchText2		= gfn_nvl(SBUxMethod.get("FM_DEPOSIT_NAME"));
         } else if(type=='2'){
         }
         
         var param		 	= null;

         SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
         compopup1({
             compCode				: gv_ma_selectedApcCd
             ,clientCode			: gv_ma_selectedClntCd
             ,bizcompId				: 'P_FI_DEPT'
             ,popupType				: 'B'
        	 ,whereClause			: param
             ,searchCaptions		: ["부서코드", 		"부서명",		"기준일"]
             ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
             ,searchInputValues		: [searchText2, 	searchText1,	""]
             ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
             ,width					: '500px'
             ,height					: '400px'
             ,tableHeader			: ["부서코드",		"부서명" 		]
             ,tableColumnNames		: ["DEPT_CODE",		"DEPT_NAME"  	]
             ,tableColumnWidths		: ["100px", 		"200px" 		]
             ,itemSelectEvent		: function (data){
                 if(type=='1'){
 	                SBUxMethod.set('FM_DEPOSIT_NAME', data.DEPT_NAME);
 	                SBUxMethod.set('FM_DEPOSIT_CODE', data.DEPT_CODE);
                 } else if(type=='2'){
                 }
             },
         });
     }
     
     /**
      * 원가중심점코드
      */
     var fn_compopup5 = function(type) {
     	
         var searchText1 	= '';
         var searchText2 	= '';
         if(type=='1'){
             searchText1 	= gfn_nvl(SBUxMethod.get("FM_COST_CENTER_CODE"));
             searchText2 	= gfn_nvl(SBUxMethod.get("FM_COST_CENTER_NAME"));
         } else if(type=='2'){
         }
         
         var replaceText0 	= "_COST_CENTER_CODE_";
         var replaceText1 	= "_COST_CENTER_NAME_"; 
         var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";
         
     	SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점');
     	compopup1({
     		compCode				: gv_ma_selectedApcCd
     		,clientCode				: gv_ma_selectedClntCd
     		,bizcompId				: 'P_CC_INPUT'
        	,popupType				: 'A'
     		,whereClause			: strWhereClause
        	,searchCaptions			: ["코드", 				"명칭"]
    		,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
    		,searchInputValues		: [searchText1, 		searchText2]
 			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
     		,width					: '700px'
     		,height					: '400px'
    		,tableHeader			: ["코드", 				"명칭",				"부서코드",		"부서명",		"사업장"]
    		,tableColumnNames		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME",	"DEPT_CODE",	"DEPT_NAME",	"SITE_CODE"]	
    		,tableColumnWidths		: ["150px", 			"250px",			"100px",		"150px",		"100px"]
 			,itemSelectEvent		: function (data){
 		        if(type=='1'){
 					SBUxMethod.set('FM_COST_CENTER_CODE', 	data.COST_CENTER_CODE);
 					SBUxMethod.set('FM_COST_CENTER_NAME', 	data.COST_CENTER_NAME);
 		        } else if(type=='2'){
 		        }
 			},
     	});
     }
     
     /**
      * 차입금차입
      */ 
     var fn_compopup6 = function(type) {
     	
         var searchCode 	= '';
         var searchName 	= '';
         if(type=='1'){
        	 searchCode 	= gfn_nvl(SBUxMethod.get("FM_LOAN_START_TR_CODE"));
        	 searchName 	= gfn_nvl(SBUxMethod.get("FM_LOAN_START_TR_NAME"));
         } else if(type=='2'){
        	 searchCode 	= gfn_nvl(SBUxMethod.get("FM_LOAN_REPAY_TR_CODE"));
        	 searchName 	= gfn_nvl(SBUxMethod.get("FM_LOAN_REPAY_TR_NAME"));
         } else if(type=='3'){
        	 searchCode 	= gfn_nvl(SBUxMethod.get("FM_INTEREST_REPAY_TR_CODE"));
        	 searchName 	= gfn_nvl(SBUxMethod.get("FM_INTEREST_REPAY_TR_NAME"));
         }         
         
         var replaceText0 		= "_CODE_";
         var replaceText1 		= "_NAME_";
         var strWhereClause 	= "AND A.CODE LIKE '%" + replaceText0 + "%' AND A.NAME LIKE '%" + replaceText1 + "%'";
     	
     	SBUxMethod.attr('modal-compopup1', 'header-title', '자금수지항목 팝업');
     	compopup1({
     		compCode				: gv_ma_selectedApcCd
     		,clientCode				: gv_ma_selectedClntCd
     		,bizcompId				: 'P_FUND_CODE'
         	,popupType				: 'A'
     		,whereClause			: strWhereClause
    		,searchCaptions			: ["코드", 		"명칭"]
    		,searchInputFields		: ["CODE", 		"NAME"]
    		,searchInputValues		: [searchCode, 	searchName]
     		,height					: '400px'
    		,tableHeader			: ["코드", 	"명칭", 	"GROUP1", "GROUP2", "GROUP3", "GROUP4"]
    		,tableColumnNames		: ["CODE",	"NAME", 	"GROUP1", "GROUP2", "GROUP3", "GROUP4"]
    		,tableColumnWidths		: ["80px", 	"200px", 	"80px",   "80px",   "80px",   "80px"]
 			,itemSelectEvent		: function (data){
 				if(type=='1'){
	 				SBUxMethod.set('FM_LOAN_START_TR_CODE', data.CODE);
	 				SBUxMethod.set('FM_LOAN_START_TR_NAME',	data.NAME);
 				} else if(type=='2'){
	 				SBUxMethod.set('FM_LOAN_REPAY_TR_CODE', data.CODE);
	 				SBUxMethod.set('FM_LOAN_REPAY_TR_NAME',	data.NAME);
 				} else if(type=='3'){
	 				SBUxMethod.set('FM_INTEREST_REPAY_TR_CODE', data.CODE);
	 				SBUxMethod.set('FM_INTEREST_REPAY_TR_NAME',	data.NAME);
 				}
 			},
     	});
	 }
    
     /**
      * 차입금계정
      */ 
     var fn_compopup7 = function(type) {
     	
         var searchText1 	= '';
         var searchText2 	= '';
         if(type=='1'){
             searchText1 	= gfn_nvl(SBUxMethod.get("FM_LOAN_ACCOUNT_CODE"));
             searchText2 	= gfn_nvl(SBUxMethod.get("FM_LOAN_ACCOUNT_NAME"));
         } else if(type=='2'){
             searchText1 	= gfn_nvl(SBUxMethod.get("FM_INTEREST_EXPENSE_ACCOUNT_CODE"));
             searchText2 	= gfn_nvl(SBUxMethod.get("FM_INTEREST_EXPENSE_ACCOUNT_NAME"));
         } else if(type=='3'){
             searchText1 	= gfn_nvl(SBUxMethod.get("FM_PREPAID_ACC_CODE"));
             searchText2 	= gfn_nvl(SBUxMethod.get("FM_PREPAID_ACC_NAME"));
         } else if(type=='4'){
             searchText1 	= gfn_nvl(SBUxMethod.get("FM_LONG_PREPAID_ACC_CODE"));
             searchText2 	= gfn_nvl(SBUxMethod.get("FM_LONG_PREPAID_ACC_NAME"));
         } else if(type=='5'){
             searchText1 	= gfn_nvl(SBUxMethod.get("FM_ACCRUED_EXPENSE_ACCOUNT_CODE"));
             searchText2 	= gfn_nvl(SBUxMethod.get("FM_ACCRUED_EXPENSE_ACCOUNT_NAME"));
         } else if(type=='6'){
             searchText1 	= gfn_nvl(SBUxMethod.get("FM_PRESENT_VALUE_ACCOUNT_CODE"));
             searchText2 	= gfn_nvl(SBUxMethod.get("FM_PRESENT_VALUE_ACCOUNT_NAME"));
         } else if(type=='7'){
             searchText1 	= gfn_nvl(SBUxMethod.get("FM_LOAN_LIQUID_ACCOUNT_CODE"));
             searchText2 	= gfn_nvl(SBUxMethod.get("FM_LOAN_LIQUID_ACCOUNT_NAME"));
         } else if(type=='8'){
             searchText1 	= gfn_nvl(SBUxMethod.get("FM_PRESENT_VALUE_LIQUID_ACCT_CD"));
             searchText2 	= gfn_nvl(SBUxMethod.get("FM_PRESENT_VALUE_LIQUID_ACCT_NM"));
         } else if(type=='9'){
             searchText1 	= gfn_nvl(SBUxMethod.get("FM_PRESENT_VALUE_INTEREST_ACCT_CD"));
             searchText2 	= gfn_nvl(SBUxMethod.get("FM_PRESENT_VALUE_INTEREST_ACCT_NM"));
         } else if(type=='10'){
             searchText1 	= gfn_nvl(SBUxMethod.get("FM_HDG_GAIN_ACCOUNT_CODE"));
             searchText2 	= gfn_nvl(SBUxMethod.get("FM_HDG_GAIN_ACCOUNT_NAME"));
         } else if(type=='11'){
             searchText1 	= gfn_nvl(SBUxMethod.get("FM_HDG_ACCOUNT_CODE"));
             searchText2 	= gfn_nvl(SBUxMethod.get("FM_HDG_ACCOUNT_NAME"));
         }
         
         var replaceText0 	= "_ACCOUNT_CODE_";
         var replaceText1 	= "_ACCOUNT_NAME_"; 
         var strWhereClause = "AND A.ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND A.ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
         
     	SBUxMethod.attr('modal-compopup1', 'header-title', '자산프로젝트');
     	compopup1({
     		compCode				: gv_ma_selectedApcCd
     		,clientCode				: gv_ma_selectedClntCd
     		,bizcompId				: 'P_ACCT_DOC_IN'
        	,popupType				: 'A'
     		,whereClause			: strWhereClause
        	,searchCaptions			: ["코드", 				"명칭"]
    		,searchInputFields		: ["ACCOUNT_CODE", 		"ACCOUNT_NAME"]
    		,searchInputValues		: [searchText1, 		searchText2]
 			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
     		,width					: '700px'
     		,height					: '400px'
    		,tableHeader			: ["계정코드", 			"계정명",			"계정(한국어)"]
    		,tableColumnNames		: ["ACCOUNT_CODE", 		"ACCOUNT_NAME",		"ACCOUNT_NAME_CHN"]	
    		,tableColumnWidths		: ["100px", 			"250px",			"250px"]
 			,itemSelectEvent		: function (data){
 		        if(type=='1'){
 					SBUxMethod.set('FM_LOAN_ACCOUNT_CODE', 				data.ACCOUNT_CODE);
 					SBUxMethod.set('FM_LOAN_ACCOUNT_NAME', 				data.ACCOUNT_NAME);
 		        } else if(type=='2'){
 					SBUxMethod.set('FM_INTEREST_EXPENSE_ACCOUNT_CODE', 	data.ACCOUNT_CODE);
 					SBUxMethod.set('FM_INTEREST_EXPENSE_ACCOUNT_NAME', 	data.ACCOUNT_NAME);
 		        } else if(type=='3'){
 					SBUxMethod.set('FM_PREPAID_ACC_CODE', 				data.ACCOUNT_CODE);
 					SBUxMethod.set('FM_PREPAID_ACC_NAME', 				data.ACCOUNT_NAME);
 		        } else if(type=='4'){
 					SBUxMethod.set('FM_LONG_PREPAID_ACC_CODE', 			data.ACCOUNT_CODE);
 					SBUxMethod.set('FM_LONG_PREPAID_ACC_NAME', 			data.ACCOUNT_NAME);
 		        } else if(type=='5'){
 					SBUxMethod.set('FM_ACCRUED_EXPENSE_ACCOUNT_CODE',	data.ACCOUNT_CODE);
 					SBUxMethod.set('FM_ACCRUED_EXPENSE_ACCOUNT_NAME',	data.ACCOUNT_NAME);
 		        } else if(type=='6'){
 					SBUxMethod.set('FM_PRESENT_VALUE_ACCOUNT_CODE',		data.ACCOUNT_CODE);
 					SBUxMethod.set('FM_PRESENT_VALUE_ACCOUNT_NAME',		data.ACCOUNT_NAME);
 		        } else if(type=='7'){
 					SBUxMethod.set('FM_LOAN_LIQUID_ACCOUNT_CODE',		data.ACCOUNT_CODE);
 					SBUxMethod.set('FM_LOAN_LIQUID_ACCOUNT_NAME',		data.ACCOUNT_NAME);
 		        } else if(type=='8'){
 					SBUxMethod.set('FM_PRESENT_VALUE_LIQUID_ACCT_CD',	data.ACCOUNT_CODE);
 					SBUxMethod.set('FM_PRESENT_VALUE_LIQUID_ACCT_NM',	data.ACCOUNT_NAME);
 		        } else if(type=='9'){
 					SBUxMethod.set('FM_PRESENT_VALUE_INTEREST_ACCT_CD',	data.ACCOUNT_CODE);
 					SBUxMethod.set('FM_PRESENT_VALUE_INTEREST_ACCT_NM',	data.ACCOUNT_NAME);
 		        } else if(type=='10'){
 					SBUxMethod.set('FM_HDG_GAIN_ACCOUNT_CODE',			data.ACCOUNT_CODE);
 					SBUxMethod.set('FM_HDG_GAIN_ACCOUNT_NAME',			data.ACCOUNT_NAME);
 		        } else if(type=='11'){
 					SBUxMethod.set('FM_HDG_ACCOUNT_CODE',				data.ACCOUNT_CODE);
 					SBUxMethod.set('FM_HDG_ACCOUNT_NAME',				data.ACCOUNT_NAME);
 		        }
 			},
     	});
     }
    
     /**
      * 상환거래처
      */ 
     var fn_compopup8 = function() {
    	 
         var searchCode 		= gfn_nvl(SBUxMethod.get("FM_REPAY_BANK_CS_CODE"));
         var searchName 		= gfn_nvl(SBUxMethod.get("FM_REPAY_BANK_CS_NAME"));
         var replaceText0 		= "_CS_CODE_";
         var replaceText1 		= "_CS_NAME_";
         var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%'";

         SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 정보');
         compopup1({
             compCode				: gv_ma_selectedApcCd
             ,clientCode			: gv_ma_selectedClntCd
             ,bizcompId				: 'P_CS_BANK'
             ,popupType				: 'A'
             ,whereClause			: strWhereClause
             ,searchCaptions		: ["거래처코드", 	"거래처명"]
             ,searchInputFields		: ["CS_CODE", 		"CS_NAME"]
             ,searchInputValues		: [searchCode, 		searchName]
             ,height				: '400px'	
             ,tableHeader			: ["거래처코드", 	"거래처명", "은행코드", "은행명", "사업자번호", "주소"]
             ,tableColumnNames		: ["CS_CODE" , 		"CS_NAME", "BANK_CODE", "BANK_NAME", "BIZ_REGNO", "ADDRESS"]
             ,tableColumnWidths		: ["100px", 		"200px", "100px", "100px", "120px", "300px"]
             ,itemSelectEvent		: function (data){
                 SBUxMethod.set('FM_REPAY_BANK_CS_CODE', data.CS_NAME);
                 SBUxMethod.set('FM_REPAY_BANK_CS_NAME', data.CS_CODE);
             },
         });
     }
     
     /**
      * 상환거래처계좌
      */
      var fn_compopup9 = function(cellData1, cellData2, cellData3) {
     	
    	 var p_cellData1 = (cellData1) ? cellData1 : "";
    	 var p_cellData2 = (cellData2) ? cellData2 : "";
    	 var p_cellData3 = (cellData3) ? cellData3 : "";
    	 
    	 p_cellData2		= p_cellData2.replace(/-/gi, "");
         var replaceText0 	= "_CS_CODE_";
         var replaceText1 	= "_EXPECTED_PAY_DATE_"; 
         var strWhereClause = " AND A.CS_CODE LIKE '%" + replaceText0 + "%' ";
         if(p_cellData2){
        	 strWhereClause += " AND '" + replaceText1 + "' BETWEEN A.EFFECT_START_DATE AND A.EFFECT_END_DATE";
         }
         
     	SBUxMethod.attr('modal-compopup1', 'header-title', '계좌행번');
     	compopup1({
     		compCode				: gv_ma_selectedApcCd
     		,clientCode				: gv_ma_selectedClntCd
     		,bizcompId				: 'L_CS_ACCOUNT'
       		,popupType				: 'A'
     		,whereClause			: strWhereClause
       		,searchCaptions			: ["거래처코드", 		"지급기일"]
   			,searchInputFields		: ["CS_CODE", 			"EXPECTED_PAY_DATE"]
   			,searchInputValues		: [p_cellData1, 		p_cellData2]
 			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
     		,width					: '1000px'
     		,height					: '500px'
   			,tableHeader			: ["행번", 				"행번명",		"은행코드",			"은행명",			"계좌번호",			"비고",			"계좌주",				"거래처",			"시작일",				"종료일",			"복수등록"]
   			,tableColumnNames		: ["BANK_ACCOUNT_SEQ", 	"SEQ_NAME",		"BANK_CODE",		"BANK_NAME",		"BANK_ACCOUNT_NO",	"DESCRIPTION",	"BANK_ACCOUNT_OWNER",	"CS_CODE",			"EFFECT_START_DATE",	"EFFECT_END_DATE",	"BNKCNT"]
   			,tableColumnWidths		: ["50px", 				"80px",			"80px",				"150px",			"150px",			"200px",		"200px",				"100px",			"80px",					"80px",				"100px"]
 			,itemSelectEvent		: function (data){
                SBUxMethod.set('FM_REPAY_BANK_CS_CODE', 	data.CS_CODE);
                SBUxMethod.set('FM_REPAY_BANK_CODE', 		data.BANK_CODE);
 			},
     	});
		 SBUxMethod.openModal('modal-compopup1');
     }     
     
      var fn_compopup10 = function(type) {
      	
          var searchText1 	= '';
          var searchText2 	= '';
          if(type=='1'){
              searchText1 	= gfn_nvl(SBUxMethod.get("FM_EXCHANGE_GAIN_ACC_CODE"));
              searchText2 	= gfn_nvl(SBUxMethod.get("FM_EXCHANGE_GAIN_ACC_NAME"));
          } else if(type=='2'){
              searchText1 	= gfn_nvl(SBUxMethod.get("FM_EXCHANGE_LOSS_ACC_CODE"));
              searchText2 	= gfn_nvl(SBUxMethod.get("FM_EXCHANGE_LOSS_ACC_NAME"));
          } else if(type=='3'){
              searchText1 	= gfn_nvl(SBUxMethod.get("FM_VAL_GAIN_ACC_CODE"));
              searchText2 	= gfn_nvl(SBUxMethod.get("FM_VAL_GAIN_ACC_NAME"));
          } else if(type=='4'){
              searchText1 	= gfn_nvl(SBUxMethod.get("FM_VAL_LOSS_ACC_CODE"));
              searchText2 	= gfn_nvl(SBUxMethod.get("FM_VAL_LOSS_ACC_NAME"));
          } else if(type=='5'){
              searchText1 	= gfn_nvl(SBUxMethod.get("FM_HDG_LOSS_ACCOUNT_CODE"));
              searchText2 	= gfn_nvl(SBUxMethod.get("FM_HDG_LOSS_ACCOUNT_NAME"));
          }
          
          var replaceText0 	= "_ACCOUNT_CODE_";
          var replaceText1 	= "_ACCOUNT_NAME_"; 
          var strWhereClause 	= "AND A.ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND A.ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
          
      	SBUxMethod.attr('modal-compopup1', 'header-title', '자산프로젝트');
      	compopup1({
      		compCode				: gv_ma_selectedApcCd
      		,clientCode				: gv_ma_selectedClntCd
      		,bizcompId				: 'P_ACCT_DOC_IN'
         	,popupType				: 'A'
      		,whereClause			: strWhereClause
         	,searchCaptions			: ["코드", 				"명칭"]
     		,searchInputFields		: ["ACCOUNT_CODE", 		"ACCOUNT_NAME"]
     		,searchInputValues		: [searchText1, 		searchText2]
  			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
      		,width					: '700px'
      		,height					: '400px'
     		,tableHeader			: ["계정코드", 			"계정명",			"계정(한국어)"]
     		,tableColumnNames		: ["ACCOUNT_CODE", 		"ACCOUNT_NAME",		"ACCOUNT_NAME_CHN"]	
     		,tableColumnWidths		: ["100px", 			"250px",			"250px"]
  			,itemSelectEvent		: function (data){
  		        if(type=='1'){
  					SBUxMethod.set('FM_EXCHANGE_GAIN_ACC_CODE', 	data.ACCOUNT_CODE);
  					SBUxMethod.set('FM_EXCHANGE_GAIN_ACC_NAME', 	data.ACCOUNT_NAME);
  		        } else if(type=='2'){
  					SBUxMethod.set('FM_EXCHANGE_LOSS_ACC_CODE', 	data.ACCOUNT_CODE);
  					SBUxMethod.set('FM_EXCHANGE_LOSS_ACC_NAME', 	data.ACCOUNT_NAME);
  		        } else if(type=='3'){
  					SBUxMethod.set('FM_VAL_GAIN_ACC_CODE', 	data.ACCOUNT_CODE);
  					SBUxMethod.set('FM_VAL_GAIN_ACC_NAME', 	data.ACCOUNT_NAME);
  		        } else if(type=='4'){
  					SBUxMethod.set('FM_VAL_LOSS_ACC_CODE', 	data.ACCOUNT_CODE);
  					SBUxMethod.set('FM_VAL_LOSS_ACC_NAME', 	data.ACCOUNT_NAME);
  		        } else if(type=='5'){
  					SBUxMethod.set('FM_HDG_LOSS_ACCOUNT_CODE', 	data.ACCOUNT_CODE);
  					SBUxMethod.set('FM_HDG_LOSS_ACCOUNT_NAME', 	data.ACCOUNT_NAME);
  		        }
  			},
      	});
      }

	// 행 추가 [이율변동정보]
	const fn_btnAdd = function() {
		let rowVal = Trl1010GridTab4.getRow();

		let LOAN_NUM 	= gfn_nvl(SBUxMethod.get("FM_LOAN_NUM")); //차입금번호

		const msg = {
			LOAN_NUM            : LOAN_NUM,	//차입금번호
			PLAN_SEQ            : '',		//순번
			INTEREST_FROM_DATE  : '',		//적용시작일
			INTEREST_TO_DATE    : '',		//적용종료일
			INTEREST_RATE       : 0,		//이자율
			CONFIRM_FLAG        : 'N',		//CONFIRM_FLAG
			DESCR            	: '',		//적요

			/********** hidden : true 컬럼 **********/
			REPAY_PLAN_DATE				: '',
			CURRENCY_CODE				: '',
			REPAY_TOTAL_AMT				: 0,
			REPAY_TRANSFER_AMT			: 0,
			REPAY_PLAN_AMT				: 0,
			REMAIN_LOAN_AMT				: 0,
			INTEREST_REPAY_PLAN_AMT		: 0,
			INTEREST_DAY				: '',
			INTERFACE_FLAG				: '',
			COMPLETE_FLAG				: '',
			TXN_ID						: '',

			status: 'i'
		}

		if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
			Trl1010GridTab4.addRow(true, msg);
		}else{
			Trl1010GridTab4.insertRow(rowVal, 'below', msg);
		}
	}

	// 행삭제 [이율변동정보]
	const fn_btnDel = async function () {

		let rowVal = Trl1010GridTab4.getRow();

		if (rowVal == -1) {
			gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
			return;
		} else {
			Trl1010GridTab4.deleteRow(rowVal);
		}

	}

	/*// 행 추가 [상황계횐]
	const fn_btnAddPlan = function() {
		let rowVal = Trl1010GridTab5.getRow();

		let LOAN_NUM 	= gfn_nvl(SBUxMethod.get("FM_LOAN_NUM")); //차입금번호

		const msg = {
			LOAN_NUM            		: LOAN_NUM,	//차입금번호
			PLAN_SEQ            		: '',		//순번
			REPAY_PLAN_DATE  			: '',		//상환예정일
			CURRENCY_CODE    			: '',		//통화
			REPAY_TOTAL_AMT            	: 0,		//총상환액
			REPAY_TRANSFER_AMT          : 0,		//차입금대체
			REPAY_PLAN_AMT            	: 0,		//원금상환예정액
			REMAIN_LOAN_AMT            	: 0,		//차입금잔액
			INTEREST_REPAY_PLAN_AMT     : 0,		//이자상환예정액
			INTEREST_RATE            	: 0,		//이자율
			INTEREST_DAY            	: '',		//이자일수
			INTEREST_FROM_DATE          : '',		//적용시작일
			INTEREST_TO_DATE          	: '',		//적용종료일
			CONFIRM_FLAG            	: 'N',		//확정여부
			INTERFACE_FLAG            	: 'N',		//전송여부
			COMPLETE_FLAG            	: 'N',		//완료여부
			TXN_ID            			: '',		//id


			status: 'i'
		}

		if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
			Trl1010GridTab5.addRow(true, msg);
		}else{
			Trl1010GridTab5.insertRow(rowVal, 'below', msg);
		}
	}

	// 행삭제 [상황계횐]
	const fn_btnDelPlan = async function () {

		let rowVal = Trl1010GridTab5.getRow();

		if (rowVal == -1) {
			gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
			return;
		} else {
			Trl1010GridTab5.deleteRow(rowVal);
		}

	}*/

	//상세정보 보기
	async function fn_view() {
		var nCol = Trl1010GridTop.getCol();
		var nRow = Trl1010GridTop.getRow();

		if (nCol == -1) {
			return;
		}

		if (nRow == -1) {
			return;
		}

		let gridData = Trl1010GridTop.getRowData(nRow);

		if (_.isEmpty(gridData)){
			return;
		}

		let tmpLoanDate 	= gfn_nvl(gridData.LOAN_DATE);
		let tmpBankCsCode 	= gfn_nvl(gridData.REPAY_BANK_CS_CODE);
		let tmpBankAcctSeq 	= gfn_nvl(gridData.REPAY_SEQ);

		gfnma_multiSelectInit({
			target: ['#FM_REPAY_SEQ']
			, compCode: gv_ma_selectedApcCd
			, clientCode: gv_ma_selectedClntCd
			, bizcompId: 'L_CS_ACCOUNT'
			, whereClause: "AND a.cs_code = '" + tmpBankCsCode + "' AND '" + tmpLoanDate + "' BETWEEN a.effect_start_date AND a.effect_end_date"
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

				if (_.isEmpty(value) == false) {

					SBUxMethod.set('FM_REPAY_BANK_CODE', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BANK_CODE"]);
					SBUxMethod.set('FM_REPAY_ACCOUNT_NUM', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BANK_ACCOUNT_NO"]);
					SBUxMethod.set('FM_REPAY_ACCOUNT_OWNER', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["DESCRIPTION"]);
					//SBUxMethod.set('BNKCNT', jsonBankAccountSeq.filter(data => data["BANK_ACCOUNT_SEQ"] == value)[0]["BNKCNT"]);
				}
			}
		});

		//SBUxMethod.set("FM_REPAY_SEQ"      , tmpBankAcctSeq);
		gfnma_multiSelectSet('#FM_REPAY_SEQ', 'SUB_CODE', 'CODE_NAME', tmpBankAcctSeq);


		fn_P_TRL1010_Q('DETAIL', gridData);


	}

	/**
	 * 목록 조회
	 */
	const fn_P_TRL1010_Q_LIST = async function (strWorkType) {

		let FI_ORG_CODE 	= gfn_nvl(SBUxMethod.get("SCH_FI_ORG_CODE")); 	//APC명
		let BASE_DATE 		= gfn_nvl(SBUxMethod.get("SCH_BASE_DATE")); 	//조회기준일자
		let ALL_YN 			= gfn_nvl(SBUxMethod.get("SCH_ALL_YN")); 		//만기차입금포함여부
		let LOAN_TYPE 		= gfn_nvl(SBUxMethod.get("SCH_LOAN_TYPE")); 	//차입금유형
		let BANK_CS_CODE 	= gfn_nvl(SBUxMethod.get("SCH_BANK_CS_CODE")); 	//차입기관

		if (_.isEqual(strWorkType, 'LIST')){

			if (!FI_ORG_CODE) {
				gfn_comAlert("W0002", "APC명");
				return;
			}
			if (!BASE_DATE) {
				gfn_comAlert("W0002", "조회기준일자");
				return;
			}

		}

		var paramObj = {
			V_P_DEBUG_MODE_YN: ''
			,V_P_LANG_ID: ''
			,V_P_COMP_CODE: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE: gv_ma_selectedClntCd

			,V_P_FI_ORG_CODE  : FI_ORG_CODE /*fi_org_code*/
			,V_P_BASE_DATE    : BASE_DATE
			,V_P_TXN_DATE_FR  : ''
			,V_P_TXN_DATE_TO  : ''
			,V_P_ALL_YN       : ALL_YN
			,V_P_LOAN_TYPE    : LOAN_TYPE
			,V_P_BANK_CS_CODE : BANK_CS_CODE
			,V_P_LOAN_NUM     : ''
			,V_P_PLAN_SEQ     : 0

			,V_P_FORM_ID: p_formId
			,V_P_MENU_ID: p_menuId
			,V_P_PROC_ID: ''
			,V_P_USERID: ''
			,V_P_PC: ''
		};

		const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectTrl1010List.do", {
			getType: 'json',
			workType: strWorkType,
			cv_count: '5',
			params: gfnma_objectToString(paramObj)
		});

		const data = await postJsonPromise;

		try {
			bQuery = true;

			if (_.isEqual("S", data.resultStatus)) {

				/** @type {number} **/
                let totalRecordCount = 0;

				jsonTrl1010Top.length = 0;
				data.cv_1.forEach((item, index) => {
					const msg = {
						LOAN_NUM        	: gfn_nvl(item.LOAN_NUM),
						FI_ORG_CODE        	: gfn_nvl(item.FI_ORG_CODE),
						SITE_CODE        	: gfn_nvl(item.SITE_CODE),
						BANK_CODE        	: gfn_nvl(item.BANK_CODE),
						BANK_CS_CODE        : gfn_nvl(item.BANK_CS_CODE),
						LOAN_CATEGORY1      : gfn_nvl(item.LOAN_CATEGORY1),
						LOAN_CATEGORY2      : gfn_nvl(item.LOAN_CATEGORY2),
						LOAN_CATEGORY3      : gfn_nvl(item.LOAN_CATEGORY3),
						LOAN_NAME        	: gfn_nvl(item.LOAN_NAME),
						LOAN_DATE        	: gfn_nvl(item.LOAN_DATE),
						LOAN_AMT        	: gfn_nvl(item.LOAN_AMT),
						REPAY_AMT        	: gfn_nvl(item.REPAY_AMT),
						REMAIN_AMT        	: gfn_nvl(item.REMAIN_AMT),
						EXPIRE_DATE        	: gfn_nvl(item.EXPIRE_DATE),
						CURRENCY_CODE       : gfn_nvl(item.CURRENCY_CODE),
						INTEREST_RATE       : gfn_nvl(item.INTEREST_RATE),
						LOAN_TYPE        	: gfn_nvl(item.LOAN_TYPE),
						REPAY_BANK_CS_CODE  : gfn_nvl(item.REPAY_BANK_CS_CODE),
						REPAY_SEQ        	: gfn_nvl(item.REPAY_SEQ),
						HDG_FLAG        	: gfn_nvl(item.HDG_FLAG),


					}
					jsonTrl1010Top.push(msg);
					 totalRecordCount++;
				});

				Trl1010GridTop.rebuild();

				if(jsonTrl1010Top.length > 0) {
					Trl1010GridTop.clickRow(1);
				}
				document.querySelector('#listCount').innerText = totalRecordCount;


			} else {
				alert(data.resultMessage);
			}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}finally {
			bQuery = false;
		}

	}

	/**
	 * 목록 조회
	 */
	const fn_P_TRL1010_Q = async function (strWorkType, grdData) {

		let FI_ORG_CODE 	= gfn_nvl(SBUxMethod.get("SCH_FI_ORG_CODE")); 	//APC명
		let BASE_DATE 		= gfn_nvl(SBUxMethod.get("SCH_BASE_DATE")); 	//조회기준일자
		let ALL_YN 			= gfn_nvl(SBUxMethod.get("SCH_ALL_YN")); 		//만기차입금포함여부
		let LOAN_TYPE 		= gfn_nvl(SBUxMethod.get("SCH_LOAN_TYPE")); 	//차입금유형
		let BANK_CS_CODE 	= gfn_nvl(SBUxMethod.get("SCH_BANK_CS_CODE")); 	//차입기관

		if (_.isEqual(strWorkType, 'LIST')){

			if (!FI_ORG_CODE) {
				gfn_comAlert("W0002", "APC명");
				return;
			}
			if (!BASE_DATE) {
				gfn_comAlert("W0002", "조회기준일자");
				return;
			}

		}

		var paramObj = {
			V_P_DEBUG_MODE_YN: ''
			,V_P_LANG_ID: ''
			,V_P_COMP_CODE: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE: gv_ma_selectedClntCd

			,V_P_FI_ORG_CODE  : FI_ORG_CODE /*fi_org_code*/
			,V_P_BASE_DATE    : BASE_DATE
			,V_P_TXN_DATE_FR  : ''
			,V_P_TXN_DATE_TO  : ''
			,V_P_ALL_YN       : ALL_YN
			,V_P_LOAN_TYPE    : LOAN_TYPE
			,V_P_BANK_CS_CODE : BANK_CS_CODE
			,V_P_LOAN_NUM     : gfn_nvl(grdData.LOAN_NUM)
			,V_P_PLAN_SEQ     : gfn_nvl(grdData.PLAN_SEQ)

			,V_P_FORM_ID: p_formId
			,V_P_MENU_ID: p_menuId
			,V_P_PROC_ID: ''
			,V_P_USERID: ''
			,V_P_PC: ''
		};

		const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectTrl1010List.do", {
			getType: 'json',
			workType: strWorkType,
			cv_count: '5',
			params: gfnma_objectToString(paramObj)
		});

		const data = await postJsonPromise;

		try {
			bQuery = true;

			if (_.isEqual("S", data.resultStatus)) {

				/*/!** @type {number} **!/
                let totalRecordCount = 0;*/

				data.cv_2.forEach((item, index) => {

					SBUxMethod.set("FM_LOAN_NUM"      		, gfn_nvl(item.LOAN_NUM));
					SBUxMethod.set("FM_FI_ORG_CODE"      	, gfn_nvl(item.FI_ORG_CODE));
					SBUxMethod.set("FM_SITE_CODE"      		, gfn_nvl(item.SITE_CODE));
					SBUxMethod.set("FM_LOAN_NAME"      		, gfn_nvl(item.LOAN_NAME));
					SBUxMethod.set("FM_LOAN_TYPE"      		, gfn_nvl(item.LOAN_TYPE));
					SBUxMethod.set("FM_BANK_CS_CODE"       	, gfn_nvl(item.BANK_CS_CODE));
					SBUxMethod.set("FM_BANK_CS_NAME"       	, gfn_nvl(item.BANK_CS_NAME));
					SBUxMethod.set("FM_BANK_CODE"      		, gfn_nvl(item.BANK_CODE));
					SBUxMethod.set("FM_BANK_NAME"      		, gfn_nvl(item.BANK_NAME));
					SBUxMethod.set("FM_LOAN_CATEGORY1"     	, gfn_nvl(item.LOAN_CATEGORY1));
					SBUxMethod.set("FM_LOAN_CATEGORY2"     	, gfn_nvl(item.LOAN_CATEGORY2));
					SBUxMethod.set("FM_LOAN_CATEGORY3"     	, gfn_nvl(item.LOAN_CATEGORY3));
					SBUxMethod.set("FM_CURRENCY_CODE"      	, gfn_nvl(item.CURRENCY_CODE));
					SBUxMethod.set("FM_EXCHANGE_RATE"      	, gfn_nvl(item.EXCHANGE_RATE));
					SBUxMethod.set("FM_LOAN_AMT"      		, gfn_nvl(item.LOAN_AMT));
					SBUxMethod.set("FM_LOAN_AMT_KRW"      	, gfn_nvl(item.LOAN_AMT_KRW));
					SBUxMethod.set("FM_IN_DEPOSIT_CODE"    	, gfn_nvl(item.IN_DEPOSIT_CODE));
					SBUxMethod.set("FM_IN_DEPOSIT_NAME"    	, gfn_nvl(item.IN_DEPOSIT_NAME));
					SBUxMethod.set("FM_IN_ACCOUNT_NUM"     	, gfn_nvl(item.IN_ACCOUNT_NUM));
					SBUxMethod.set("FM_OUT_DEPOSIT_CODE"   	, gfn_nvl(item.OUT_DEPOSIT_CODE));
					SBUxMethod.set("FM_OUT_DEPOSIT_NAME"   	, gfn_nvl(item.OUT_DEPOSIT_NAME));
					SBUxMethod.set("FM_OUT_ACCOUNT_NUM"    	, gfn_nvl(item.OUT_ACCOUNT_NUM));
					SBUxMethod.set("FM_LOAN_DATE"      		, gfn_nvl(item.LOAN_DATE));
					SBUxMethod.set("FM_EXPIRE_DATE"      	, gfn_nvl(item.EXPIRE_DATE));
					SBUxMethod.set("FM_LOAN_STATUS"      	, gfn_nvl(item.LOAN_STATUS));
					SBUxMethod.set("FM_DESCR"      			, gfn_nvl(item.DESCR));

					/**************************** 계정과목 정보 **********************************/
					SBUxMethod.set("FM_DEPOSIT_CODE"      					, gfn_nvl(item.DEPT_CODE));
					SBUxMethod.set("FM_DEPOSIT_NAME"      					, gfn_nvl(item.DEPT_NAME));
					SBUxMethod.set("FM_COST_CENTER_CODE"      				, gfn_nvl(item.COST_CENTER_CODE));
					SBUxMethod.set("FM_COST_CENTER_NAME"      				, gfn_nvl(item.COST_CENTER_NAME));
					SBUxMethod.set("FM_LOAN_ACCOUNT"      					, gfn_nvl(item.LOAN_ACCOUNT));
					SBUxMethod.set("FM_LOAN_ACCOUNT_NAME"      				, gfn_nvl(item.LOAN_ACCOUNT_NAME));
					SBUxMethod.set("FM_INTEREST_EXPENSE_ACCOUNT_CODE"      	, gfn_nvl(item.INTEREST_EXPENSE_ACCOUNT));
					SBUxMethod.set("FM_INTEREST_EXPENSE_ACCOUNT_NAME"      	, gfn_nvl(item.INTEREST_EXPENSE_ACCOUNT_NAME));
					SBUxMethod.set("FM_PREPAID_ACC_CODE"      				, gfn_nvl(item.PREPAID_EXPENSE_ACCOUNT));
					SBUxMethod.set("FM_PREPAID_ACC_NAME"      				, gfn_nvl(item.PREPAID_ACC_NAME));
					SBUxMethod.set("FM_ACCRUED_EXPENSE_ACCOUNT_CODE"      	, gfn_nvl(item.ACCRUED_EXPENSE_ACCOUNT));
					SBUxMethod.set("FM_ACCRUED_EXPENSE_ACCOUNT_NAME"      	, gfn_nvl(item.ACCRUED_EXPENSE_ACCOUNT_NAME));
					SBUxMethod.set("FM_PRESENT_VALUE_ACCOUNT_CODE"      	, gfn_nvl(item.PRESENT_VALUE_ACCOUNT));
					SBUxMethod.set("FM_PRESENT_VALUE_ACCOUNT_NAME"      	, gfn_nvl(item.PRESENT_VALUE_ACCOUNT_NAME));
					SBUxMethod.set("FM_LOAN_LIQUID_ACCOUNT_CODE"      		, gfn_nvl(item.LOAN_LIQUID_ACCOUNT));
					SBUxMethod.set("FM_LOAN_LIQUID_ACCOUNT_NAME"      		, gfn_nvl(item.LOAN_LIQUID_ACCOUNT_NAME));
					SBUxMethod.set("FM_LOAN_REPAY_TR_CODE"      			, gfn_nvl(item.LOAN_REPAY_TR_TYPE)); //--차입금상환 (신규))
					SBUxMethod.set("FM_LOAN_REPAY_TR_NAME"      			, gfn_nvl(item.LOAN_REPAY_TR_NAME));
					SBUxMethod.set("FM_INTEREST_REPAY_TR_CODE"      		, gfn_nvl(item.INTEREST_REPAY_TR_TYPE)); // --이자상환 (신규))
					SBUxMethod.set("FM_INTEREST_REPAY_TR_NAME"      		, gfn_nvl(item.INTEREST_REPAY_TR_NAME));
					SBUxMethod.set("FM_LOAN_START_TR_CODE"      			, gfn_nvl(item.LOAN_START_TR_TYPE)); //--차입금차입 (신규))
					SBUxMethod.set("FM_LOAN_START_TR_NAME"      			, gfn_nvl(item.LOAN_START_TR_NAME));
					SBUxMethod.set("FM_EXCHANGE_GAIN_ACC_CODE"     			, gfn_nvl(item.EXCHANGE_GAIN_ACC)); // -- ADD 20160804 외화환차익계)정
					SBUxMethod.set("FM_EXCHANGE_GAIN_ACC_NAME"      		, gfn_nvl(item.EXCHANGE_GAIN_ACC_NAME));
					SBUxMethod.set("FM_EXCHANGE_LOSS_ACC_CODE"      		, gfn_nvl(item.EXCHANGE_LOSS_ACC)); //-- ADD 20160804 외화환차손계)정
					SBUxMethod.set("FM_EXCHANGE_LOSS_ACC_NAME"      		, gfn_nvl(item.EXCHANGE_LOSS_ACC_NAME));
					SBUxMethod.set("FM_VAL_GAIN_ACC_CODE"      				, gfn_nvl(item.VAL_GAIN_ACC)); // -- ADD 20160804 외화평가이익계)정
					SBUxMethod.set("FM_VAL_GAIN_ACC_NAME"      				, gfn_nvl(item.VAL_GAIN_ACC_NAME));
					SBUxMethod.set("FM_VAL_LOSS_ACC_CODE"      				, gfn_nvl(item.VAL_LOSS_ACC)); // -- ADD 20160804 외화평가손실계)정
					SBUxMethod.set("FM_VAL_LOSS_ACC_NAME"      				, gfn_nvl(item.VAL_LOSS_ACC_NAME));
					SBUxMethod.set("FM_PRESENT_VALUE_LIQUID_ACCT_CD"      	, gfn_nvl(item.PRESENT_VALUE_LIQUID_ACCOUNT)); //-- 현재가치할인차금유동성계정 20170908AD)D
					SBUxMethod.set("FM_PRESENT_VALUE_LIQUID_ACCT_NM"      	, gfn_nvl(item.PRESENT_VALUE_LIQUID_ACCT_NM));


					/**************************** 상환 정보 **********************************/
					SBUxMethod.set("FM_REPAY_BANK_CS_CODE"      				, gfn_nvl(item.REPAY_BANK_CS_CODE));
					SBUxMethod.set("FM_REPAY_BANK_CS_NAME"      				, gfn_nvl(item.REPAY_BANK_CS_NAME));
					SBUxMethod.set("FM_REPAY_BANK_CODE"      					, gfn_nvl(item.REPAY_BANK_CODE));
					SBUxMethod.set("FM_REPAY_ACCOUNT_NUM"      					, gfn_nvl(item.REPAY_ACCOUNT_NUM));
					SBUxMethod.set("FM_REPAY_ACCOUNT_OWNER"      				, gfn_nvl(item.REPAY_ACCOUNT_OWNER));
					SBUxMethod.set("FM_REPAY_AMT"      							, gfn_nvl(item.REPAY_AMT));
					SBUxMethod.set("FM_REMAIN_LOAN_AMT"      					, gfn_nvl(item.REMAIN_LOAN_AMT));
					SBUxMethod.set("FM_REPAY_TERM"      						, gfn_nvl(item.REPAY_TERM));
					SBUxMethod.set("FM_DEFERRED_MM"      						, gfn_nvl(item.DEFERRED_MM));
					SBUxMethod.set("FM_REPAY_CYCLE_MM"      					, gfn_nvl(item.REPAY_CYCLE_MM));
					SBUxMethod.set("FM_REPAY_START_DATE"      					, gfn_nvl(item.REPAY_START_DATE));
					SBUxMethod.set("FM_REPAY_PER_AMT"      						, gfn_nvl(item.REPAY_PER_AMT));
					SBUxMethod.set("FM_REPAY_FIRST_AMT"      					, gfn_nvl(item.REPAY_FIRST_AMT));
					SBUxMethod.set("FM_REPAY_DD"      							, gfn_nvl(item.REPAY_DD));
					SBUxMethod.set("FM_REPAY_BASE"      						, gfn_nvl(item.REPAY_BASE));
					SBUxMethod.set("FM_INTEREST_TYPE"      						, gfn_nvl(item.INTEREST_TYPE));
					SBUxMethod.set("FM_INTEREST_RATE"      						, gfn_nvl(item.INTEREST_RATE));
					SBUxMethod.set("FM_INTEREST_REPAY_TYPE"      				, gfn_nvl(item.INTEREST_REPAY_TYPE));
					SBUxMethod.set("FM_INTEREST_CALC_DAYS_TYPE"      			, gfn_nvl(item.INTEREST_CALC_DAYS_TYPE));
					SBUxMethod.set("FM_INTEREST_DEFERRED_MM"      				, gfn_nvl(item.INTEREST_DEFERRED_MM));
					SBUxMethod.set("FM_INTEREST_REPAY_CYCLE_MM"      			, gfn_nvl(item.INTEREST_REPAY_CYCLE_MM));
					SBUxMethod.set("FM_INTEREST_REPAY_START_DATE"      			, gfn_nvl(item.INTEREST_REPAY_START_DATE));
					SBUxMethod.set("FM_INTEREST_PAY_DD"      					, gfn_nvl(item.INTEREST_PAY_DD));
					SBUxMethod.set("FM_EFFECTIVE_INTEREST_RATE"      			, gfn_nvl(item.EFFECTIVE_INTEREST_RATE));
					SBUxMethod.set("FM_LOAN_DISCOUNT_AMT"      					, gfn_nvl(item.LOAN_DISCOUNT_AMT));
					SBUxMethod.set("FM_DOC_DATE"      							, gfn_nvl(item.DOC_DATE));
					SBUxMethod.set("FM_DOC_NUM"      							, gfn_nvl(item.DOC_NUM));
					SBUxMethod.set("FM_DOC_SEQ"      							, gfn_nvl(item.DOC_SEQ));
					SBUxMethod.set("FM_INSERT_USERID"      						, gfn_nvl(item.INSERT_USERID));
					SBUxMethod.set("FM_INTEREST_CALC_YEAR_TYPE"      			, gfn_nvl(item.INTEREST_CALC_YEAR_TYPE));
					SBUxMethod.set("FM_INTEREST_CALC_BASE_DAY"      			, gfn_nvl(item.INTEREST_CALC_BASE_DAY));
					SBUxMethod.set("FM_AMORTIZE_BASE_DATE"      				, gfn_nvl(item.AMORTIZE_BASE_DATE));
					//SBUxMethod.set("FM_REPAY_SEQ"      							, gfn_nvl(item.REPAY_SEQ));
					gfnma_multiSelectSet('#FM_REPAY_SEQ', 'SUB_CODE', 'CODE_NAME', gfn_nvl(item.REPAY_SEQ));
					SBUxMethod.set("FM_REPAY_PREAUTH_PAY_YN"      				, gfn_nvl(item.REPAY_PREAUTH_PAY_YN));
					SBUxMethod.set("FM_INTEREST_PREAUTH_PAY_YN"      			, gfn_nvl(item.INTEREST_PREAUTH_PAY_YN));
					SBUxMethod.set("FM_AMORTIZE_REPAY_CYCLE_MM"      			, gfn_nvl(item.AMORTIZE_REPAY_CYCLE_MM));
					SBUxMethod.set("FM_PRESENT_VALUE_INTEREST_ACCT_CD"      	, gfn_nvl(item.PRESENT_VALUE_INTEREST_ACCOUNT)); // --  사채할인차금이자비용 20190320 LJ)E
					SBUxMethod.set("FM_PRESENT_VALUE_INTEREST_ACCT_NM"      	, gfn_nvl(item.PRESENT_VALUE_INTEREST_ACCT_NM)); // --  사채할인차금이자비용 20190320 LJ)E
					SBUxMethod.set("FM_HDG_FLAG"      							, gfn_nvl(item.HDG_FLAG));
					SBUxMethod.set("FM_HDG_GAIN_ACCOUNT_CODE"      				, gfn_nvl(item.HDG_GAIN_ACC));
					SBUxMethod.set("FM_HDG_GAIN_ACCOUNT_NAME"      				, gfn_nvl(item.HDG_GAIN_ACCOUNT_NAME));
					SBUxMethod.set("FM_HDG_LOSS_ACCOUNT_CODE"      				, gfn_nvl(item.HDG_LOSS_ACC));
					SBUxMethod.set("FM_HDG_LOSS_ACCOUNT_NAME"      				, gfn_nvl(item.HDG_LOSS_ACCOUNT_NAME));
					SBUxMethod.set("FM_HDG_CS_CODE"      						, gfn_nvl(item.HDG_CS_CODE));
					SBUxMethod.set("FM_HDG_CS_NAME"      						, gfn_nvl(item.HDG_CS_NAME));
					SBUxMethod.set("FM_HDG_DESCR"      							, gfn_nvl(item.HDG_DESCR));
					SBUxMethod.set("FM_HDG_ACCOUNT_CODE"      					, gfn_nvl(item.HDG_ACC));
					SBUxMethod.set("FM_HDG_ACCOUNT_NAME"      					, gfn_nvl(item.HDG_ACCOUNT_NAME));

				});

				/** @type {number} **/
				//let totalRecordCount = 0;
				/**************************** 이율변동정보 **********************************/
				jsonTrl1010Tab4.length = 0;
				data.cv_3.forEach((item, index) => {
					const msg = {
						TXN_ID        		: gfn_nvl(item.TXN_ID),
						LOAN_NUM        	: gfn_nvl(item.LOAN_NUM),
						PLAN_SEQ        	: gfn_nvl(item.SEQ),
						APPLY_START_DATE    : gfn_nvl(item.APPLY_START_DATE),
						APPLY_END_DATE      : gfn_nvl(item.APPLY_END_DATE),
						INTEREST_RATE       : gfn_nvl(item.INTEREST_RATE),
						DESCR        		: gfn_nvl(item.DESCR),
						CONFIRM_FLAG        : gfn_nvl(item.CONFIRM_FLAG),


					}
					jsonTrl1010Tab4.push(msg);
					//totalRecordCount++;
				});

				Trl1010GridTab4.rebuild();
				//document.querySelector('#listCoun2').innerText = totalRecordCount;



				/*/!**************************** 상환계획 **********************************!/
				jsonTrl1010Tab5.length = 0;
				data.cv_4.forEach((item, index) => {
					const msg = {
						TXN_ID        				: gfn_nvl(item.TXN_ID),
						LOAN_NUM        			: gfn_nvl(item.LOAN_NUM),
						PLAN_SEQ        			: gfn_nvl(item.PLAN_SEQ),
						CURRENCY_CODE        		: gfn_nvl(item.CURRENCY_CODE),
						REPAY_PLAN_DATE        		: gfn_nvl(item.REPAY_PLAN_DATE),
						REPAY_TRANSFER_AMT        	: gfn_nvl(item.REPAY_TRANSFER_AMT),
						REMAIN_LOAN_AMT        		: gfn_nvl(item.REMAIN_LOAN_AMT),
						INTEREST_DAY        		: gfn_nvl(item.INTEREST_DAY),
						INTEREST_REPAY_PLAN_AMT     : gfn_nvl(item.INTEREST_REPAY_PLAN_AMT),
						REPAY_TOTAL_AMT        		: gfn_nvl(item.REPAY_TOTAL_AMT),
						INTEREST_FROM_DATE        	: gfn_nvl(item.INTEREST_FROM_DATE),
						INTEREST_TO_DATE        	: gfn_nvl(item.INTEREST_TO_DATE),
						INTEREST_RATE        		: gfn_nvl(item.INTEREST_RATE),	//--종료일자
						INTERFACE_FLAG        		: gfn_nvl(item.INTERFACE_FLAG),
						CONFIRM_FLAG        		: gfn_nvl(item.CONFIRM_FLAG),
						COMPLETE_FLAG        		: gfn_nvl(item.COMPLETE_FLAG),
						UPDATE_TIME        			: gfn_nvl(item.UPDATE_TIME),
						HDG_TRANS_AMT        		: gfn_nvl(item.HDG_TRANS_AMT),

					}
					jsonTrl1010Tab5.push(msg);
				});

				Trl1010GridTab5.rebuild();*/


			} else {
				alert(data.resultMessage);
			}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}finally {
			bQuery = false;
		}

	}


	//저장
	const fn_P_TRL1010_S = async function (strWorkType) {

		let LOAN_NUM 						= gfn_nvl(SBUxMethod.get("FM_LOAN_NUM")); 						//차입금번호
		let FI_ORG_CODE 					= gfn_nvl(SBUxMethod.get("FM_FI_ORG_CODE")); 					//회계단위
		let SITE_CODE 						= gfn_nvl(SBUxMethod.get("FM_SITE_CODE")); 						//사업장
		let LOAN_NAME 						= gfn_nvl(SBUxMethod.get("FM_LOAN_NAME")); 						//차입금명
		let LOAN_TYPE 						= gfn_nvl(SBUxMethod.get("FM_LOAN_TYPE")); 						//차입금유형
		let LOAN_CATEGORY1 					= gfn_nvl(SBUxMethod.get("FM_LOAN_CATEGORY1")); 				//분류1
		let LOAN_CATEGORY2 					= gfn_nvl(SBUxMethod.get("FM_LOAN_CATEGORY2")); 				//분류2
		let LOAN_CATEGORY3 					= gfn_nvl(SBUxMethod.get("FM_LOAN_CATEGORY3")); 				//분류3
		let BANK_CODE 						= gfn_nvl(SBUxMethod.get("FM_BANK_CODE")); 						//은행
		let BANK_CS_CODE 					= gfn_nvl(SBUxMethod.get("FM_BANK_CS_CODE")); 					//차입기관
		let FM_DEPOSIT_CODE 				= gfn_nvl(SBUxMethod.get("FM_DEPOSIT_CODE")); 					//부서
		let COST_CENTER_CODE 				= gfn_nvl(SBUxMethod.get("FM_COST_CENTER_CODE")); 				//원가중심점
		let LOAN_ACCOUNT 					= gfn_nvl(SBUxMethod.get("FM_LOAN_ACCOUNT_CODE")); 				//차입금계정
		let INTEREST_EXPENSE_ACCOUNT 		= gfn_nvl(SBUxMethod.get("FM_INTEREST_EXPENSE_ACCOUNT_CODE")); 	//이자비용계정
		let PREPAID_EXPENSE_ACCOUNT 		= gfn_nvl(SBUxMethod.get("FM_PREPAID_ACC_CODE")); 				//선급비용계정
		let ACCRUED_EXPENSE_ACCOUNT 		= gfn_nvl(SBUxMethod.get("FM_ACCRUED_EXPENSE_ACCOUNT_CODE")); 	//미지급비용계정
		let PRESENT_VALUE_ACCOUNT 			= gfn_nvl(SBUxMethod.get("FM_PRESENT_VALUE_ACCOUNT_CODE")); 	//현재가치할인차금계정
		let LOAN_LIQUID_ACCOUNT 			= gfn_nvl(SBUxMethod.get("FM_LOAN_LIQUID_ACCOUNT_CODE")); 		//유동성대체계정(상환계정)
		let LOAN_REPAY_TR_TYPE 				= gfn_nvl(SBUxMethod.get("FM_LOAN_REPAY_TR_CODE"));				//차입금상환
		let LOAN_START_TR_TYPE 				= gfn_nvl(SBUxMethod.get("FM_LOAN_START_TR_CODE"));				//차입금차입
		let EXCHANGE_GAIN_ACC 				= gfn_nvl(SBUxMethod.get("FM_EXCHANGE_GAIN_ACC_CODE"));			//환차익계정
		let EXCHANGE_LOSS_ACC 				= gfn_nvl(SBUxMethod.get("FM_EXCHANGE_LOSS_ACC_CODE"));			//환차손계정
		let VAL_GAIN_ACC 					= gfn_nvl(SBUxMethod.get("FM_VAL_GAIN_ACC_CODE"));				//환평가이익계정
		let VAL_LOSS_ACC 					= gfn_nvl(SBUxMethod.get("FM_VAL_LOSS_ACC_CODE"));				//환평가손실계정
		let CURRENCY_CODE 					= gfn_nvl(SBUxMethod.get("FM_CURRENCY_CODE"));					//통화
		let EXCHANGE_RATE 					= gfn_nvl(SBUxMethod.get("FM_EXCHANGE_RATE"));					//환율
		let LOAN_AMT 						= gfn_nvl(SBUxMethod.get("FM_LOAN_AMT"));						//차입금액(통화)
		let LOAN_AMT_KRW 					= gfn_nvl(SBUxMethod.get("FM_LOAN_AMT_KRW"));					//차입금액(전표)
		let IN_DEPOSIT_CODE 				= gfn_nvl(SBUxMethod.get("FM_IN_DEPOSIT_CODE"));					//입금계좌
		let OUT_DEPOSIT_CODE 				= gfn_nvl(SBUxMethod.get("FM_OUT_DEPOSIT_CODE"));				//출금계좌
		let LOAN_DATE 						= gfn_nvl(SBUxMethod.get("FM_LOAN_DATE"));						//차입일
		let EXPIRE_DATE 					= gfn_nvl(SBUxMethod.get("FM_EXPIRE_DATE"));					//만기일
		let LOAN_STATUS 					= gfn_nvl(SBUxMethod.get("FM_LOAN_STATUS"));					//년간이자일수
		let DESCR 							= gfn_nvl(SBUxMethod.get("FM_DESCR"));							//적요
		let REPAY_BANK_CODE 				= gfn_nvl(SBUxMethod.get("FM_REPAY_BANK_CODE"));				//상환거래처계좌
		let REPAY_ACCOUNT_NUM 				= gfn_nvl(SBUxMethod.get("FM_REPAY_ACCOUNT_NUM"));				//상환거래처계좌
		let REPAY_ACCOUNT_OWNER 			= gfn_nvl(SBUxMethod.get("FM_REPAY_ACCOUNT_OWNER"));			//상환거래처계좌
		let REPAY_AMT 						= gfn_nvl(SBUxMethod.get("FM_REPAY_AMT"));						//기상환금액
		let REMAIN_LOAN_AMT 				= gfn_nvl(SBUxMethod.get("FM_REMAIN_LOAN_AMT"));				//미상환금액
		let REPAY_TERM 						= gfn_nvl(SBUxMethod.get("FM_REPAY_TERM"));						//원금상환조건
		let DEFERRED_MM 					= gfn_nvl(SBUxMethod.get("FM_DEFERRED_MM"));					//원금거치기간(개월)
		let REPAY_CYCLE_MM 					= gfn_nvl(SBUxMethod.get("FM_REPAY_CYCLE_MM"));					//원금상환주기(개월)
		let REPAY_START_DATE 				= gfn_nvl(SBUxMethod.get("FM_REPAY_START_DATE"));				//원금최초상환일
		let REPAY_PER_AMT 					= gfn_nvl(SBUxMethod.get("FM_REPAY_PER_AMT"));					//1회원금상환액
		let REPAY_FIRST_AMT 				= gfn_nvl(SBUxMethod.get("FM_REPAY_FIRST_AMT"));				//최초원금상환액
		let REPAY_DD 						= gfn_nvl(SBUxMethod.get("FM_REPAY_DD"));						//원금상환일
		let REPAY_BASE 						= gfn_nvl(SBUxMethod.get("FM_REPAY_BASE"));						//상환기준
		let INTEREST_TYPE 					= gfn_nvl(SBUxMethod.get("FM_INTEREST_TYPE"));					//이자율구분
		let INTEREST_RATE 					= gfn_nvl(SBUxMethod.get("FM_INTEREST_RATE"));					//약정이율
		let INTEREST_REPAY_TYPE 			= gfn_nvl(SBUxMethod.get("FM_INTEREST_REPAY_TYPE"));			//이자지급기준
		let INTEREST_CALC_DAYS_TYPE 		= gfn_nvl(SBUxMethod.get("FM_INTEREST_CALC_DAYS_TYPE"));		//이자일수계산기준
		let INTEREST_DEFERRED_MM 			= gfn_nvl(SBUxMethod.get("FM_INTEREST_DEFERRED_MM"));			//이자거치기간(개월)
		let INTEREST_REPAY_CYCLE_MM 		= gfn_nvl(SBUxMethod.get("FM_INTEREST_REPAY_CYCLE_MM"));		//이자상환주기(개월)
		let INTEREST_REPAY_START_DATE 		= gfn_nvl(SBUxMethod.get("FM_INTEREST_REPAY_START_DATE"));		//이자최초상환일
		let INTEREST_PAY_DD 				= gfn_nvl(SBUxMethod.get("FM_INTEREST_PAY_DD"));				//이자상환일
		let EFFECTIVE_INTEREST_RATE 		= gfn_nvl(SBUxMethod.get("FM_EFFECTIVE_INTEREST_RATE"));		//유효이자율
		let LOAN_DISCOUNT_AMT 				= gfn_nvl(SBUxMethod.get("FM_LOAN_DISCOUNT_AMT"));				//현재가치할인차금
		let INTEREST_CALC_YEAR_TYPE 		= gfn_nvl(SBUxMethod.get("FM_INTEREST_CALC_YEAR_TYPE"));		//년간이자일수
		let INTEREST_CALC_BASE_DAY 			= gfn_nvl(SBUxMethod.get("FM_INTEREST_CALC_BASE_DAY"));			//이자기산일기준
		let AMORTIZE_BASE_DATE 				= gfn_nvl(SBUxMethod.get("FM_AMORTIZE_BASE_DATE"));				//상각기준일
		let PRESENT_VALUE_LIQUID_ACCT 		= gfn_nvl(SBUxMethod.get("FM_PRESENT_VALUE_LIQUID_ACCT_CD"));	//현재가치할인차금유동성대체계정
		let PRESENT_VALUE_INT_ACCT 			= gfn_nvl(SBUxMethod.get("FM_PRESENT_VALUE_INTEREST_ACCT_CD"));	//사채할인차금이자비용
		//let REPAY_SEQ 						= gfn_nvl(SBUxMethod.get("FM_REPAY_SEQ"));						//상환거래처계좌
		let REPAY_SEQ						= gfn_nvl(gfnma_multiSelectGet('#FM_REPAY_SEQ'));				//상환거래처계좌
		let REPAY_BANK_CS_CODE 				= gfn_nvl(SBUxMethod.get("FM_REPAY_BANK_CS_CODE"));				//상환거래처
		let REPAY_PREAUTH_PAY_YN 			= gfn_nvl(SBUxMethod.get("FM_REPAY_PREAUTH_PAY_YN"));			//원금지급기준
		let INTEREST_PREAUTH_PAY_YN 		= gfn_nvl(SBUxMethod.get("FM_INTEREST_PREAUTH_PAY_YN"));		//이자지급기준
		let AMORTIZE_REPAY_CYCLE_MM 		= gfn_nvl(SBUxMethod.get("FM_AMORTIZE_REPAY_CYCLE_MM"));		//차금상각주기(개월)
		let HDG_FLAG 						= gfn_nvl(SBUxMethod.get("FM_HDG_FLAG"));						//햇지상품여부
		let HDG_GAIN_ACC 					= gfn_nvl(SBUxMethod.get("FM_HDG_GAIN_ACCOUNT_CODE"));			//파생상품이익계정
		let HDG_LOSS_ACC 					= gfn_nvl(SBUxMethod.get("FM_HDG_LOSS_ACCOUNT_CODE"));			//파생상품손실계정
		let HDG_CS_CODE 					= gfn_nvl(SBUxMethod.get("FM_HDG_CS_CODE"));					//파생상품거래처
		let HDG_DESCR 						= gfn_nvl(SBUxMethod.get("FM_HDG_DESCR"));						//파생상품내역
		let HDG_ACC 						= gfn_nvl(SBUxMethod.get("FM_HDG_ACCOUNT_CODE"));				//파생상품가계정
		let LNPREPAID_EXPENSE_ACCOUNT 		= gfn_nvl(SBUxMethod.get("FM_LONG_PREPAID_ACC_CODE"));			//장기선급비용계정


		var paramObj = {
			V_P_DEBUG_MODE_YN: ''
			, V_P_LANG_ID: ''
			, V_P_COMP_CODE: gv_ma_selectedApcCd
			, V_P_CLIENT_CODE: gv_ma_selectedClntCd

			,IV_P_LOAN_NUM                 : LOAN_NUM
			,V_P_FI_ORG_CODE               : FI_ORG_CODE
			,V_P_SITE_CODE                 : SITE_CODE
			,V_P_LOAN_NAME                 : LOAN_NAME
			,V_P_LOAN_TYPE                 : LOAN_TYPE
			,V_P_LOAN_CATEGORY1            : LOAN_CATEGORY1
			,V_P_LOAN_CATEGORY2            : LOAN_CATEGORY2
			,V_P_LOAN_CATEGORY3            : LOAN_CATEGORY3
			,V_P_BANK_CODE                 : BANK_CODE
			,V_P_BANK_CS_CODE              : BANK_CS_CODE
			,V_P_DEPT_CODE                 : FM_DEPOSIT_CODE
			,V_P_COST_CENTER_CODE          : COST_CENTER_CODE
			,V_P_LOAN_ACCOUNT              : LOAN_ACCOUNT
			,V_P_INTEREST_EXPENSE_ACCOUNT  : INTEREST_EXPENSE_ACCOUNT
			,V_P_PREPAID_EXPENSE_ACCOUNT   : PREPAID_EXPENSE_ACCOUNT
			,V_P_ACCRUED_EXPENSE_ACCOUNT   : ACCRUED_EXPENSE_ACCOUNT
			,V_P_PRESENT_VALUE_ACCOUNT     : PRESENT_VALUE_ACCOUNT
			,V_P_LOAN_LIQUID_ACCOUNT       : LOAN_LIQUID_ACCOUNT
			,V_P_LOAN_REPAY_TR_TYPE        : LOAN_REPAY_TR_TYPE
			,V_P_INTEREST_REPAY_TR_TYPE    : LOAN_REPAY_TR_TYPE
			,V_P_LOAN_START_TR_TYPE        : LOAN_START_TR_TYPE
			,V_P_EXCHANGE_GAIN_ACC         : EXCHANGE_GAIN_ACC
			,V_P_EXCHANGE_LOSS_ACC         : EXCHANGE_LOSS_ACC
			,V_P_VAL_GAIN_ACC              : VAL_GAIN_ACC
			,V_P_VAL_LOSS_ACC              : VAL_LOSS_ACC
			,V_P_CURRENCY_CODE             : CURRENCY_CODE
			,V_P_EXCHANGE_RATE             : EXCHANGE_RATE
			,V_P_LOAN_AMT                  : LOAN_AMT
			,V_P_LOAN_AMT_KRW              : LOAN_AMT_KRW
			,V_P_IN_DEPOSIT_CODE           : IN_DEPOSIT_CODE
			,V_P_OUT_DEPOSIT_CODE          : OUT_DEPOSIT_CODE
			,V_P_LOAN_DATE                 : LOAN_DATE
			,V_P_EXPIRE_DATE               : EXPIRE_DATE
			,V_P_LOAN_STATUS               : LOAN_STATUS
			,V_P_DESCR                     : DESCR
			,V_P_REPAY_BANK_CODE           : REPAY_BANK_CODE
			,V_P_REPAY_ACCOUNT_NUM         : REPAY_ACCOUNT_NUM
			,V_P_REPAY_ACCOUNT_OWNER       : REPAY_ACCOUNT_OWNER
			,V_P_REPAY_AMT                 : REPAY_AMT
			,V_P_REMAIN_LOAN_AMT           : REMAIN_LOAN_AMT
			,V_P_REPAY_TERM                : REPAY_TERM
			,V_P_DEFERRED_MM               : DEFERRED_MM
			,V_P_REPAY_CYCLE_MM            : REPAY_CYCLE_MM
			,V_P_REPAY_START_DATE          : REPAY_START_DATE
			,V_P_REPAY_PER_AMT             : REPAY_PER_AMT
			,V_P_REPAY_FIRST_AMT           : REPAY_FIRST_AMT
			,V_P_REPAY_DD                  : REPAY_DD
			,V_P_REPAY_BASE                : REPAY_BASE
			,V_P_INTEREST_TYPE             : INTEREST_TYPE
			,V_P_INTEREST_RATE             : INTEREST_RATE
			,V_P_INTEREST_REPAY_TYPE       : INTEREST_REPAY_TYPE
			,V_P_INTEREST_CALC_DAYS_TYPE   : INTEREST_CALC_DAYS_TYPE
			,V_P_INTEREST_DEFERRED_MM      : INTEREST_DEFERRED_MM
			,V_P_INTEREST_REPAY_CYCLE_MM   : INTEREST_REPAY_CYCLE_MM
			,V_P_INTEREST_REPAY_START_DATE : INTEREST_REPAY_START_DATE
			,V_P_INTEREST_PAY_DD           : INTEREST_PAY_DD
			,V_P_EFFECTIVE_INTEREST_RATE   : EFFECTIVE_INTEREST_RATE
			,V_P_LOAN_DISCOUNT_AMT         : LOAN_DISCOUNT_AMT
			,V_P_DOC_DATE                  : ''
			,V_P_DOC_NUM                   : 0
			,V_P_DOC_SEQ                   : 0
			,V_P_INTEREST_CALC_YEAR_TYPE   : INTEREST_CALC_YEAR_TYPE
			,V_P_INTEREST_CALC_BASE_DAY    : INTEREST_CALC_BASE_DAY
			,V_P_AMORTIZE_BASE_DATE        : AMORTIZE_BASE_DATE
			,V_P_PRESENT_VALUE_LIQUID_ACCT : PRESENT_VALUE_LIQUID_ACCT
			,V_P_PRESENT_VALUE_INT_ACCT    : PRESENT_VALUE_INT_ACCT
			,V_P_REPAY_SEQ                 : REPAY_SEQ
			,V_P_REPAY_BANK_CS_CODE        : REPAY_BANK_CS_CODE
			,V_P_REPAY_PREAUTH_PAY_YN      : REPAY_PREAUTH_PAY_YN
			,V_P_INTEREST_PREAUTH_PAY_YN   : INTEREST_PREAUTH_PAY_YN
			,V_P_AMORTIZE_REPAY_CYCLE_MM   : AMORTIZE_REPAY_CYCLE_MM
			,V_P_HDG_FLAG                  : HDG_FLAG
			,V_P_HDG_GAIN_ACC              : HDG_GAIN_ACC
			,V_P_HDG_LOSS_ACC              : HDG_LOSS_ACC
			,V_P_HDG_CS_CODE               : HDG_CS_CODE
			,V_P_HDG_DESCR                 : HDG_DESCR
			,V_P_HDG_ACC                   : HDG_ACC
			,V_P_LNPREPAID_EXPENSE_ACCOUNT : LNPREPAID_EXPENSE_ACCOUNT

			, V_P_FORM_ID: p_formId
			, V_P_MENU_ID: p_menuId
			, V_P_PROC_ID: ''
			, V_P_USERID: ''
			, V_P_PC: ''
		};

		const postJsonPromise = gfn_postJSON("/fi/ffa/alm/insertTrl1010.do", {
			getType: 'json',
			workType: strWorkType,
			cv_count: '0',
			params: gfnma_objectToString(paramObj)
		});
		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				if (data.resultMessage) {
                    alert(data.resultMessage);
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
		}

	}

	//저장
	const fn_P_TRL1010_S1 = async function () {

		let listData = [];
		listData =  await getParamForm();

		if (listData.length > 0) {
			const postJsonPromise = gfn_postJSON("/fi/ffa/alm/insertTrl1010S1.do", {listData: listData});
			const data = await postJsonPromise;

			try {
				if (_.isEqual("S", data.resultStatus)) {

					if (data.resultMessage) {
						alert(data.resultMessage);
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
				gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}else{
			return true;
		}
	}

	const getParamForm = async function () {

		let updatedData;
		let returnData = [];

		updatedData = Trl1010GridTab4.getUpdateData(true, 'all');

		updatedData.forEach((item, index) => {

			const param = {

				cv_count: '0',
				getType: 'json',
				workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
				params: gfnma_objectToString({
					V_P_DEBUG_MODE_YN: ''
					, V_P_LANG_ID: ''
					, V_P_COMP_CODE: gv_ma_selectedApcCd
					, V_P_CLIENT_CODE: gv_ma_selectedClntCd

					,V_P_LOAN_NUM         : gfn_nvl(item.data.LOAN_NUM)
					,V_P_TXN_ID           : gfn_nvl(item.data.TXN_ID) == '' ? 0 : item.data.TXN_ID
					,V_P_APPLY_START_DATE : gfn_nvl(item.data.APPLY_START_DATE)
					,V_P_APPLY_END_DATE   : gfn_nvl(item.data.APPLY_END_DATE)
					,V_P_INTEREST_RATE    : gfn_nvl(item.data.INTEREST_RATE) == '' ? 0 : item.data.INTEREST_RATE
					,V_P_DESCR            : gfn_nvl(item.data.DESCR)
					,V_P_CONFIRM_FLAG     : gfn_nvl(item.data.CONFIRM_FLAG)

					, V_P_FORM_ID: p_formId
					, V_P_MENU_ID: p_menuId
					, V_P_PROC_ID: ''
					, V_P_USERID: ''
					, V_P_PC: ''

				})
			}

			returnData.push(param);

		});
		return returnData;
	}



	/**
	 * 탭클릭
	 */
	const fn_tabClick = function(val) {

		p_sel_tab = val;
	}

	/**
	 * 차입금액(전표) 계산	[환율]
	 */
	var fn_editValEx = function() {

		let EXCHANGE_RATE 		= gfn_nvl(SBUxMethod.get("FM_EXCHANGE_RATE"));	//환율
		let LOAN_AMT 			= gfn_nvl(SBUxMethod.get("FM_LOAN_AMT"));	//차입금액(통화)

		let totalVal = Math.round(Number(LOAN_AMT) * Number(EXCHANGE_RATE));	//차입금액(통화) * 환율

		//차입금액(전표)
		SBUxMethod.set("FM_LOAN_AMT_KRW"    	, totalVal);


	}

	/**
	 * 차입금액(전표) 계산	[차입금액(통화)]
	 */
	var fn_editValLoan = function() {

		let EXCHANGE_RATE 		= gfn_nvl(SBUxMethod.get("FM_EXCHANGE_RATE"));	//환율
		let LOAN_AMT 			= gfn_nvl(SBUxMethod.get("FM_LOAN_AMT"));	//차입금액(통화)

		let totalVal = Math.round(Number(LOAN_AMT) * Number(EXCHANGE_RATE));	//차입금액(통화) * 환율

		//차입금액(전표)
		SBUxMethod.set("FM_LOAN_AMT_KRW"    	, totalVal);

		let REPAY_AMT 		= gfn_nvl(SBUxMethod.get("FM_REPAY_AMT"));	//기상환금액

		let dValue = Number(REPAY_AMT) - Number(LOAN_AMT);

		if (dValue >= 0){
			//미상환금액
			SBUxMethod.set("FM_REMAIN_LOAN_AMT"    	, dValue);
		}else{
			//미상환금액
			SBUxMethod.set("FM_REMAIN_LOAN_AMT"    	, Math.abs(dValue));
		}

	}


	/**
	 * 미상환금액 계산 [기상환금액]		numrepay_amt_EditValueChanged
	 */
	var fn_editValRepay = function() {

		let REPAY_AMT 		= gfn_nvl(SBUxMethod.get("FM_REPAY_AMT"));	//기상환금액
		let LOAN_AMT 		= gfn_nvl(SBUxMethod.get("FM_LOAN_AMT"));	//차입금액(통화)

		let dValue = Number(REPAY_AMT) - Number(LOAN_AMT);

		if (dValue >= 0){
			//미상환금액
			SBUxMethod.set("FM_REMAIN_LOAN_AMT"    	, dValue);
		}else{
			//미상환금액
			SBUxMethod.set("FM_REMAIN_LOAN_AMT"    	, Math.abs(dValue));
		}

	}

	/**
	 * 통화
	 */
	var fn_editValCurrency = function() {

		let CURRENCY_CODE 		= gfn_nvl(SBUxMethod.get("FM_CURRENCY_CODE"));	//통화

		if (_.isEqual(CURRENCY_CODE, "KRW"))
		{
			fn_ExchangeEvalAcct(false);
		}
		else
		{
			fn_ExchangeEvalAcct(true);
		}
	}

	/**
	 * 통화
	 */
	var fn_ExchangeEvalAcct = function(bFlag) {

		let strBgColor = "White";

		if (bFlag)
		{
			SBUxMethod.attr("FM_EXCHANGE_GAIN_ACC_CODE", "readonly"	, false);	//환차익계정
			SBUxMethod.attr("FM_EXCHANGE_GAIN_ACC_NAME", "readonly"	, false);	//환차익계정
			SBUxMethod.attr("FM_EXCHANGE_GAIN_ACC_BTN", "readonly"	, false);	//환차익계정 팝업버튼
			SBUxMethod.attr("FM_EXCHANGE_LOSS_ACC_CODE", "readonly"	, false);	//환자손계정
			SBUxMethod.attr("FM_EXCHANGE_LOSS_ACC_NAME", "readonly"	, false);	//환자손계정
			SBUxMethod.attr("FM_EXCHANGE_LOSS_ACC_BTN", "readonly"	, false);	//환자손계정 팝업버튼

			SBUxMethod.attr("FM_VAL_GAIN_ACC_CODE", "readonly"	, false);	//환평가이익계정
			SBUxMethod.attr("FM_VAL_GAIN_ACC_NAME", "readonly"	, false);	//환평가이익계정
			SBUxMethod.attr("FM_VAL_GAIN_ACC_BTN", "readonly"	, false);	//환평가이익계정 팝업버튼
			SBUxMethod.attr("FM_VAL_LOSS_ACC_CODE", "readonly"	, false);	//환평가손실계정
			SBUxMethod.attr("FM_VAL_LOSS_ACC_NAME", "readonly"	, false);	//환평가손실계정
			SBUxMethod.attr("FM_VAL_LOSS_ACC_BTN", "readonly"	, false);	//환평가손실계정 팝업버튼

		}
		else
		{
			SBUxMethod.attr("FM_EXCHANGE_GAIN_ACC_CODE", "readonly", true);	//환차익계정
			SBUxMethod.attr("FM_EXCHANGE_GAIN_ACC_NAME", "readonly", true);	//환차익계정
			SBUxMethod.attr("FM_EXCHANGE_GAIN_ACC_BTN", "readonly", true);	//환차익계정 팝업버튼
			SBUxMethod.attr("FM_EXCHANGE_LOSS_ACC_CODE", "readonly", true);	//환자손계정
			SBUxMethod.attr("FM_EXCHANGE_LOSS_ACC_NAME", "readonly", true);	//환자손계정
			SBUxMethod.attr("FM_EXCHANGE_LOSS_ACC_BTN", "readonly", true);	//환자손계정 팝업버튼

			SBUxMethod.attr("FM_VAL_GAIN_ACC_CODE", "readonly"	, true);	//환평가이익계정
			SBUxMethod.attr("FM_VAL_GAIN_ACC_NAME", "readonly"	, true);	//환평가이익계정
			SBUxMethod.attr("FM_VAL_GAIN_ACC_BTN", "readonly"	, true);	//환평가이익계정 팝업버튼
			SBUxMethod.attr("FM_VAL_LOSS_ACC_CODE", "readonly"	, true);	//환평가손실계정
			SBUxMethod.attr("FM_VAL_LOSS_ACC_NAME", "readonly"	, true);	//환평가손실계정
			SBUxMethod.attr("FM_VAL_LOSS_ACC_BTN", "readonly"	, true);	//환평가손실계정 팝업버튼
		}

	}

	/**
	 * 차입금유형
	 */
	var fn_editValLoanType = function() {

		if (bQuery){
			return;
		}

		let LOAN_TYPE 		= gfn_nvl(SBUxMethod.get("FM_LOAN_TYPE"));	//차입금유형

		if (LOAN_TYPE == ''){
			return;
		}

		jsonLoanType.forEach((item, index) => {


			if (_.isEqual(item.SUB_CODE, LOAN_TYPE)) {

				//차입금계정
				SBUxMethod.set("FM_LOAN_ACCOUNT_CODE"    	, item.EXTRA_FIELD1);
				SBUxMethod.set("FM_LOAN_ACCOUNT_NAME"    	, item.EXTRA_FIELD1_NM);

				//이자비용계정
				SBUxMethod.set("FM_INTEREST_EXPENSE_ACCOUNT_CODE"    	, item.EXTRA_FIELD2);
				SBUxMethod.set("FM_INTEREST_EXPENSE_ACCOUNT_NAME"    	, item.EXTRA_FIELD2_NM);

				//선급비용계정
				SBUxMethod.set("FM_PREPAID_ACC_CODE"    	, item.EXTRA_FIELD3);
				SBUxMethod.set("FM_PREPAID_ACC_NAME"    	, item.EXTRA_FIELD3_NM);

				//미지급비용계정
				SBUxMethod.set("FM_ACCRUED_EXPENSE_ACCOUNT_CODE"    	, item.EXTRA_FIELD4);
				SBUxMethod.set("FM_ACCRUED_EXPENSE_ACCOUNT_NAME"    	, item.EXTRA_FIELD4_NM);

				//환차익계정
				SBUxMethod.set("FM_EXCHANGE_GAIN_ACC_CODE"    	, item.EXTRA_FIELD5);
				SBUxMethod.set("FM_EXCHANGE_GAIN_ACC_NAME"    	, item.EXTRA_FIELD5_NM);

				//환차손계정
				SBUxMethod.set("FM_EXCHANGE_LOSS_ACC_CODE"    	, item.EXTRA_FIELD6);
				SBUxMethod.set("FM_EXCHANGE_LOSS_ACC_NAME"    	, item.EXTRA_FIELD6_NM);

				//환평가이익계정
				SBUxMethod.set("FM_VAL_GAIN_ACC_CODE"    	, item.EXTRA_FIELD7);
				SBUxMethod.set("FM_VAL_GAIN_ACC_NAME"    	, item.EXTRA_FIELD7_NM);

				//환평가손실계정
				SBUxMethod.set("FM_VAL_LOSS_ACC_CODE"    	, item.EXTRA_FIELD8);
				SBUxMethod.set("FM_VAL_LOSS_ACC_NAME"    	, item.EXTRA_FIELD8_NM);

				//부서
				SBUxMethod.set("FM_DEPOSIT_CODE"    	, item.EXTRA_FIELD9);
				SBUxMethod.set("FM_DEPOSIT_NAME"    	, item.EXTRA_FIELD9_NM);

				//원가중심점
				SBUxMethod.set("FM_COST_CENTER_CODE"    	, item.EXTRA_FIELD10);
				SBUxMethod.set("FM_COST_CENTER_NAME"    	, item.EXTRA_FIELD10_NM);

			}

		});

	}



</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>