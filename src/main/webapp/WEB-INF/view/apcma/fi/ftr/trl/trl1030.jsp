<%
/**
 * @Class Name 		: trl1010.jsp
 * @Description 	: 차입금상환스케줄 화면
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
	<title>title : 차입금상환스케줄</title>
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
                    </h3><!-- 차입금상환스케줄 -->
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
							<%--<th scope="row" class="th_bg">APC명</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>--%>

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
							<th scope="row" class="th_bg_search">차입기관</th>
							<td class="td_input" data-group="BANK_CS">
								<sbux-input style="width:100%" id="SCH_BANK_CS_CODE" uitype="text"
											class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input" data-group="BANK_CS">
								<sbux-input style="width:100%" id="SCH_BANK_CS_NAME" uitype="text"
											class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" data-group="BANK_CS">
								<sbux-button
										class="btn btn-xs btn-outline-dark"
										text="…"
										uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1('1')"
								></sbux-button>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg_search">거래일자</th>
							<td class="td_input">
								<sbux-datepicker
										id="SCH_BASE_DATE_FR"
										uitype="popup"
										date-format="yyyy-mm-dd"
										class="table-datepicker-ma">
								</sbux-datepicker>
							</td>
							<td class="td_input">
								<span>-</span>
							</td>
							<td class="td_input">
								<sbux-datepicker
										id="SCH_BASE_DATE_TO"
										uitype="popup"
										date-format="yyyy-mm-dd"
										class="table-datepicker-ma">
								</sbux-datepicker>
							</td>
							<td colspan="16" style="border-right: hidden;"></td>
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
                            <div id="sb_area_grid_top" style="height:280px; width:100%;"></div>
                        </div>
                    </div>
                
                    <div class="col-sm-6" style="width:100%;padding-top:10px">
					
					    <sbux-tabs id="idxTab_norm1" name="idxTab_norm1" uitype="normal"
		                   <%--title-target-id-array = "SB_TOP_TAB1^SB_TOP_TAB2^SB_TOP_TAB3^SB_TOP_TAB4^SB_TOP_TAB5^SB_TOP_TAB6"
		                   title-text-array = "기본정보^계정과목정보^상환정보^이율변동정보^상환계획^현재가치관리"
		                   title-target-value-array="1^2^3^4^5^6"--%>
						   title-target-id-array = "SB_TOP_TAB5"
						   title-text-array = "상환계획"
						   title-target-value-array="5"
		                   onclick="fn_tabClick(idxTab_norm1)"></sbux-tabs>					
						
						<div class="tab-content" style="height:430px;width:100%;padding-top:0px" >
						
							<%--<div id="SB_TOP_TAB1" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>기본정보</span>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
									</div>
		                        </div>
		                        <div style="width:100%;">
		                        
		                        	<table class="table table-bordered tbl_fixed">
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
					                                <sbux-select id="FM_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">차입금번호</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input id="FM_LOAN_NUM" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		
			                                                            
			                                    <th scope="row" class="th_bg">사업장</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select id="FM_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">차입금명</th>
			                                    <td colspan="7" class="td_input">
				  									<sbux-input id="FM_LOAN_NAME" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg"></th>
			                                    <td colspan="3" class="td_input">
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">차입금유형</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:150px" id="FM_LOAN_TYPE" uitype="single" jsondata-ref="jsonLoanType" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">분류1</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input id="FM_LOAN_CATEGORY1" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		
			                                                            
			                                    <th scope="row" class="th_bg"></th>
			                                    <td colspan="3" class="td_input">
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
			                                                            
			                                    <th scope="row" class="th_bg"></th>
			                                    <td colspan="3" class="td_input">
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">차입기관</th>
			                                    <td colspan="11" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_BANK_CS_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup1('2')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:200px" id="FM_BANK_CS_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">은행</th>
			                                    <td colspan="11" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_BANK_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup2()"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:200px" id="FM_BANK_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">통화</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select id="FM_CURRENCY_CODE" uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">환율</th>
			                                    <td colspan="3" class="td_input">
					  								<sbux-input id="FM_EXCHANGE_RATE" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		
			                                                            
			                                    <th scope="row" class="th_bg"></th>
			                                    <td colspan="3" class="td_input">
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">차입금액(통화)</th>
			                                    <td colspan="3" class="td_input">
					  								<sbux-input id="FM_LOAN_AMT" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">차입금액(전표)</th>
			                                    <td colspan="3" class="td_input">
					  								<sbux-input id="FM_LOAN_AMT_KRW" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		
			                                                            
			                                    <th scope="row" class="th_bg"></th>
			                                    <td colspan="3" class="td_input">
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">입금계좌</th>
			                                    <td colspan="11" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_IN_DEPOSIT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup3('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:200px" id="FM_IN_DEPOSIT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">출금계좌</th>
			                                    <td colspan="11" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_OUT_DEPOSIT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup3('2')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:200px" id="FM_OUT_DEPOSIT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">차입일</th>
			                                    <td colspan="3" class="td_input">
												    <sbux-datepicker
												            id="FM_LOAN_DATE"
												            uitype="popup"
												            date-format="yyyy-mm-dd"
												            class="form-control input-sm input-sm-ast inpt_data_reqed">
												    </sbux-datepicker>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">만기일</th>
			                                    <td colspan="3" class="td_input">
												    <sbux-datepicker
												            id="FM_EXPIRE_DATE"
												            uitype="popup"
												            date-format="yyyy-mm-dd"
												            class="form-control input-sm input-sm-ast inpt_data_reqed">
												    </sbux-datepicker>
			                                    </td>		
			                                                            
			                                    <th scope="row" class="th_bg"></th>
			                                    <td colspan="3" class="td_input">
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">년간이자일수</th>
			                                    <td colspan="11" class="td_input">
					                                <sbux-select style="width:200px" id="FM_LOAN_STATUS" uitype="single" jsondata-ref="jsonLoanStatus" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">적요</th>
			                                    <td colspan="11" class="td_input">
				  									<sbux-input id="FM_DESCR" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		                        
		                        			</tr>
		                        			
		                        		</tbody>
		                        	</table>		
		                        
		                        </div>							
							</div>--%>
						
							<%--<div id="SB_TOP_TAB2" >
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
		                        
		                        	<table class="table table-bordered tbl_fixed">
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
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_DEPOSIT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup4('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_DEPOSIT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg"></th>
			                                    <td colspan="3" class="td_input">
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">원가중심점</th>
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_COST_CENTER_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup5('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_COST_CENTER_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">차입금차입</th>
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_LOAN_START_TR_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup6('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_LOAN_START_TR_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">차입금계정</th>
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_LOAN_ACCOUNT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_LOAN_ACCOUNT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">차입금상환</th>
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_LOAN_REPAY_TR_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup6('2')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_LOAN_REPAY_TR_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">이자비용계정</th>
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_INTEREST_EXPENSE_ACCOUNT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('2')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_INTEREST_EXPENSE_ACCOUNT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">이자상환</th>
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_INTEREST_REPAY_TR_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup6('3')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_INTEREST_REPAY_TR_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">선급비용계정</th>
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_PREPAID_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('3')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_PREPAID_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">장기선급비용계정</th>
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_LONG_PREPAID_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('4')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_LONG_PREPAID_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">미지급비용계정</th>
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_ACCRUED_EXPENSE_ACCOUNT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('5')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_ACCRUED_EXPENSE_ACCOUNT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg"></th>
			                                    <td colspan="3" class="td_input">
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">현재가치할인차금계정</th>
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_PRESENT_VALUE_ACCOUNT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('6')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_PRESENT_VALUE_ACCOUNT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg"></th>
			                                    <td colspan="3" class="td_input">
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">유동성대체계정(상환계정)</th>
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_LOAN_LIQUID_ACCOUNT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('7')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_LOAN_LIQUID_ACCOUNT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg"></th>
			                                    <td colspan="3" class="td_input">
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">현재가치할인차금유동성대체계정</th>
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_PRESENT_VALUE_LIQUID_ACCT_CD" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('8')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_PRESENT_VALUE_LIQUID_ACCT_NM" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg"></th>
			                                    <td colspan="3" class="td_input">
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">사채할인차금이자비용</th>
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_PRESENT_VALUE_INTEREST_ACCT_CD" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('9')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_PRESENT_VALUE_INTEREST_ACCT_NM" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg"></th>
			                                    <td colspan="3" class="td_input">
			                                    </td>		                        
		                        			</tr>

		                        		</tbody>
		                        	</table>		                        
		                        
		                        </div>							
							</div>
						--%>
							<%--<div id="SB_TOP_TAB3" >
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
		                        
		                        	<table class="table table-bordered tbl_fixed">
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
			                                    <td colspan="3" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_REPAY_BANK_CS_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup8()"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_REPAY_BANK_CS_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg"></th>
			                                    <td colspan="3" class="td_input">
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">상환거래처계좌</th>
			                                    <td colspan="7" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_REPAY_BANK_CS_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup9()"></sbux-button>
					  									<font style="width:5px"></font>
						                                <sbux-select style="width:150px" id="FM_REPAY_BANK_CODE" uitype="single" jsondata-ref="jsonRepayBankCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					  									<sbux-input style="width:150px" id="FM_REPAY_ACCOUNT_NUM" uitype="text" class="form-control input-sm"></sbux-input>
					  									<sbux-input style="width:150px" id="FM_RREPAY_ACCOUNT_OWNER" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>		                        
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">기상환금액</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_REPAY_AMT" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">미상환금액</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_REMAIN_LOAN_AMT" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">원금상환조건</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_REPAY_TERM" uitype="single" jsondata-ref="jsonRepayTerm" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">원금거치기간(개월)</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_DEFERRED_MM" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">원금상환주기(개월)</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_REPAY_CYCLE_MM" uitype="text" class="form-control input-sm"></sbux-input>
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
				  									<sbux-input style="width:200px" id="FM_REPAY_PER_AMT" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">최초원금상환액</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_REPAY_FIRST_AMT" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">원금상환일</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_REPAY_DD" uitype="single" jsondata-ref="jsonRepayDd" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">상환기준</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_REPAY_BASE" uitype="single" jsondata-ref="jsonRepayBase" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">이자율구분</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_INTEREST_TYPE" uitype="single" jsondata-ref="jsonInterestType" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">약정이율</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_INTEREST_RATE" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">이자지급기준</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_INTEREST_REPAY_TYPE" uitype="single" jsondata-ref="jsonInterestRepayType" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">이자일수계산기준</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_INTEREST_CALC_DAYS_TYPE" uitype="single" jsondata-ref="jsonInterestCalcDaysType" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>		
		                        			</tr>
		                        			
			                                <tr>
			                                    <th scope="row" class="th_bg">이자거치기간(개월)</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_INTEREST_DEFERRED_MM" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">이자상환주기(개월)</th>
			                                    <td colspan="3" class="td_input">
				  									<sbux-input style="width:200px" id="FM_INTEREST_REPAY_CYCLE_MM" uitype="text" class="form-control input-sm"></sbux-input>
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
					                                <sbux-select style="width:200px" id="FM_INTEREST_CALC_YEAR_TYPE" uitype="single" jsondata-ref="jsonInterestCalcYearType" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>		                        
			                                    
			                                    <th scope="row" class="th_bg">이자기산일기준</th>
			                                    <td colspan="3" class="td_input">
					                                <sbux-select style="width:200px" id="FM_INTEREST_CALC_BASE_DAY" uitype="single" jsondata-ref="jsonInterestCalcBaseDay" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
							</div>--%>
						
							<%--<div id="SB_TOP_TAB4" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>이율변동정보</span>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
										<a href="#" id="btn1-row-add" class="cu-btn-plus" style="padding-left:10px" >
											<img src="../../../resource/images/plus.png" width="20px" /> 행추가
										</a>
										<a href="#" id="btn1-row-del" class="cu-btn-minus" style="padding-left:10px">
											<img src="../../../resource/images/minus.png" width="20px" /> 행삭제
										</a>
									</div>
		                        </div>
		                        <div style="width:100%;">
		                            <div id="sb_area_grid_tap4" style="height:280px; width:100%;"></div>
		                        </div>							
							</div>--%>
						
							<div id="SB_TOP_TAB5" >
		                        <div class="ad_tbl_top">
		                            <ul class="ad_tbl_count">
		                                <li>
		                                    <span>상환계획</span>
											<%--<span style="font-size:12px">(조회건수 <span id="listCount2">0</span>건)</span>--%>
		                                </li>
		                            </ul>
				                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
					                    <sbux-button uitype="normal" text="최초상환계획"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnPlan"></sbux-button>
					                    <font style="padding-right:5px"></font>
					                    <sbux-button uitype="normal" text="재계산"  		class="btn btn-sm btn-outline-danger" onclick="fn_btnReCalc"></sbux-button>
					                    <font style="padding-right:10px"></font>
										<%--<a href="#" id="btn1-row-add" class="cu-btn-plus" style="padding-left:10px" >
											<img src="../../../resource/images/plus.png" width="20px" /> 행추가
										</a>
										<a href="#" id="btn1-row-del" class="cu-btn-minus" style="padding-left:10px">
											<img src="../../../resource/images/minus.png" width="20px" /> 행삭제
										</a>--%>
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
		                        </div>
		                        <div style="width:100%;">
		                            <div id="sb_area_grid_tap5" style="height:380px; width:100%;"></div>
		                        </div>							
							</div>
						
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
	
    //grid 초기화
    var Trl1030GridTop; 			// 그리드를 담기위한 객체 선언
    var jsonTrl1030Top 	= []; 		// 그리드의 참조 데이터 주소 선언
    
    /*var Trl1030GridTab4; 			// 그리드를 담기위한 객체 선언
    var jsonTrl1030Tab4	= []; 		// 그리드의 참조 데이터 주소 선언*/
    
    var Trl1030GridTab5; 			// 그리드를 담기위한 객체 선언
    var jsonTrl1030Tab5	= []; 		// 그리드의 참조 데이터 주소 선언
    
  /*  var Trl1030GridTab6; 			// 그리드를 담기위한 객체 선언
    var jsonTrl1030Tab6	= []; 		// 그리드의 참조 데이터 주소 선언*/
    
	var jsonFiOrgCode		= [];	// APC명
	var jsonAllYn			= [];	// 만기차입금포함여부
	var jsonLoanType		= [];	// 차입금유형
	
	var jsonSiteCode		= [];	// 사업장
	var jsonLoanType		= [];	// 차입금유형
	var jsonCurrencyCode	= [];	// 통화
	var jsonLoanStatus		= [];	// 년간이자일수
	var jsonRepayBankCode	= [];	// 상환거래처계좌
	var jsonRepayTerm		= [];	// 원금상환조건
	var jsonRepayDd			= [];	// 원금상환일
	var jsonRepayBase		= [];	// 상환기준
	var jsonInterestType	= [];	// 이자율구분
	var jsonBankCsCode	= [];	// 상환거래처계좌

	var jsonInterestRepayType		= [];	// 이자지급기준
	var jsonInterestCalcDaysType	= [];	// 이자일수계산기준
	var jsonInterestCalcYearType	= [];	// 년간이자일수
	var jsonInterestCalcBaseDay		= [];	// 이자기산일기준
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // APC명
            gfnma_setComSelect(['SCH_FI_ORG_CODE','FM_FI_ORG_CODE'],		jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 만기차입금포함여부
            gfnma_setComSelect(['SCH_ALL_YN'],			jsonAllYn, 			'L_FIF016', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 차입금유형
            gfnma_setComSelect(['SCH_LOAN_TYPE'],		jsonLoanType, 		'L_FIF003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            
            // 사업장
            gfnma_setComSelect(['Trl1030GridTop'],		jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
			// 상환거래처계좌
			gfnma_setComSelect(['FM_REPAY_BANK_CODE'],	jsonBankCsCode,	'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),

            // 차입금유형
            //gfnma_setComSelect(['FM_LOAN_TYPE'],		jsonLoanType, 		'P_FIF002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'LOAN_NUM', 'LOAN_NAME', 'Y', ''),
            // 사업장
            //gfnma_setComSelect(['FM_SITE_CODE'],		jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['Trl1030GridTop','Trl1030GridTab5'],	jsonCurrencyCode,	'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 년간이자일수
            //gfnma_setComSelect(['FM_LOAN_STATUS'],		jsonLoanStatus,		'L_FIF004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상환거래처계좌
            //gfnma_setComSelect(['FM_REPAY_BANK_CODE'],	jsonRepayBankCode,	'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
            // 원금상환조건
            //gfnma_setComSelect(['FM_REPAY_TERM'],		jsonRepayTerm,		'L_FIF005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 이자일수
            gfnma_setComSelect([/*'FM_REPAY_DD',*/ 'Trl1030GridTab5'],			jsonRepayDd,		'L_COM010', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상환기준
            //gfnma_setComSelect(['FM_REPAY_BASE'],		jsonRepayBase,		'L_FIF017', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 이자율구분
            //gfnma_setComSelect(['FM_INTEREST_TYPE'],	jsonInterestType,	'L_FIF006', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            
            // 이자지급기준
            //gfnma_setComSelect(['FM_INTEREST_REPAY_TYPE'],		jsonInterestRepayType,		'L_FIF007', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 이자일수계산기준
            //gfnma_setComSelect(['FM_INTEREST_CALC_DAYS_TYPE'],	jsonInterestCalcDaysType,	'L_FIF008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 년간이자일수
            //gfnma_setComSelect(['FM_INTEREST_CALC_YEAR_TYPE'],	jsonInterestCalcYearType,	'L_FIF039', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 이자기산일기준
            //gfnma_setComSelect(['FM_INTEREST_CALC_BASE_DAY'],	jsonInterestCalcBaseDay,	'L_FIF043', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state('L');

		fn_createTrl1030GridTop();
		//fn_createTrl1030GridTab4();
		fn_createTrl1030GridTab5();
		//fn_createTrl1030GridTab6();

		let openDate = gfn_dateToYmd(new Date());

		SBUxMethod.set('SCH_BASE_DATE', openDate);
	} 
	
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	fn_init();
    });

    /**
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#srchArea1');
    }
    
    /**
     * 화면 state 변경
     */
    function fn_state(type) {
    
// 		SBUxMethod.attr('FM_VAT_TYPE_CODE', 	'readonly', true);
    	
//     	if(type=='L'){
// 			$('#main-btn-new', parent.document).attr('disabled', true);
// 			$('#main-btn-save', parent.document).attr('disabled', true);
// 			$('#main-btn-del', 	parent.document).attr('disabled', true);
// 			//fn_fmDisabled(true);
//     	} else if(type=='N'){
//     		SBUxMethod.attr('SCH_DEPRECIATION_METHOD2', 		'readonly', false);
//     		$('#main-btn-save', parent.document).attr('disabled', false);
//     		$('#main-btn-del', 	parent.document).attr('disabled', false);
// 			//fn_fmDisabled(false);
//     	}
    }    
    
    /**
     * 목록 조회
     */
 	function cfn_search() {
 		fn_state('L');
		fn_P_TRL1010_Q_LIST('LIST', 1);
    	//fn_setTrl1030GridTop('LIST');
    }

	//차입금
	function fn_createTrl1030GridTop() {
		var SBGridProperties 				= {};
		SBGridProperties.parentid 			= 'sb_area_grid_top';
		SBGridProperties.id 				= 'Trl1030GridTop';
		SBGridProperties.jsonref 			= 'jsonTrl1030Top';
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
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}},
			{caption: ['만기일'], ref: 'EXPIRE_DATE', 	width:'200px',	type: 'inputdate', style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}},
			{caption: ["약정이율"],         ref: 'INTEREST_RATE',    type:'output',  	width:'150px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}
			},
			{caption: ["분류1"],			ref: 'LOAN_CATEGORY1',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
			{caption: ["분류2"],			ref: 'LOAN_CATEGORY2',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
			{caption: ["분류3"],			ref: 'LOAN_CATEGORY3',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
			{caption: ["repay_bank_cs_code"],	ref: 'REPAY_BANK_CS_CODE',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
			{caption: ["repay_seq"],			ref: 'REPAY_SEQ',				type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
		];

		Trl1030GridTop = _SBGrid.create(SBGridProperties);
		Trl1030GridTop.bind('click', 'fn_view');
	}
    
    /*function fn_createTrl1030GridTop() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid_top';
	    SBGridProperties.id 				= 'Trl1030GridTop';
	    SBGridProperties.jsonref 			= 'jsonTrl1030Top';
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
            {caption: ["차입금번호"],		ref: 'LOAN_NUM', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["금융기관"], 		ref: 'BANK_CS_CODE',  		  	type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["사업장"], 			ref: 'SITE_CODE', 			   	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["차입금유형"],		ref: 'LOAN_TYPE',				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["차입금명"],			ref: 'LOAN_NAME',				type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["통화"],				ref: 'CURRENCY_CODE',			type:'output',  	width:'100px',  	style:'text-align:left'},

            {caption: ["차입금액(통화)"],	ref: 'LOAN_AMT',  		  		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["상환금액(통화)"],	ref: 'REPAY_AMT',    			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["잔액(통화)"],		ref: 'REMAIN_AMT', 		   		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},

            {caption: ["차입일"],			ref: 'LOAN_DATE',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["만기일"],			ref: 'EXPIRE_DATE',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["약정이율"],			ref: 'INTEREST_RATE',			type:'output',  	width:'150px',  	style:'text-align:left'},
        ];

        Trl1030GridTop = _SBGrid.create(SBGridProperties);
        //Trl1030GridTop.bind('click', 			'fn_viewTrl1030GridTopEvent');
    }
    
    function fn_createTrl1030GridTab4() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid_tap4';
	    SBGridProperties.id 				= 'Trl1030GridTab4';
	    SBGridProperties.jsonref 			= 'jsonTrl1030Tab4';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["차입금번호"],		ref: 'LOAN_NUM', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["순번"], 			ref: 'SEQ', 		 		  	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["적용시작일"],		ref: 'APPLY_START_DATE', 	   	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["적용종료일"],		ref: 'APPLY_END_DATE',			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["이자율(%)"],		ref: 'INTEREST_RATE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["확정여부"],			ref: 'CONFIRM_FLAG',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["적요"],				ref: 'DESCR',					type:'output',  	width:'300px',  	style:'text-align:left'},
            
            {caption: ["비고"],				ref: 'ETC',						type:'output',  	width:'300px',  	style:'text-align:left'},
        ];

        Trl1030GridTab4 = _SBGrid.create(SBGridProperties);
        //Trl1030GridTab4.bind('click', 			'fn_viewTrl1030GridTab4Event');
    }*/

	//상환계획
	function fn_createTrl1030GridTab5() {
		var SBGridProperties 				= {};
		SBGridProperties.parentid 			= 'sb_area_grid_tap5';
		SBGridProperties.id 				= 'Trl1030GridTab5';
		SBGridProperties.jsonref 			= 'jsonTrl1030Tab5';
		SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
		SBGridProperties.selectmode 		= 'byrow';
		SBGridProperties.explorerbar 		= 'sortmove';
		SBGridProperties.extendlastcol 		= 'scroll';
		SBGridProperties.columns = [
			{caption: ["차입금번호"], 		ref: 'LOAN_NUM', 			  	type:'output',  	width:'230px',  	style:'text-align:left'},
			{caption: ["계획연번"], 		ref: 'PLAN_SEQ', 			  	type:'output',  	width:'200px',  	style:'text-align:left'},
			{caption: ['상환예정일'], 	ref: 'REPAY_PLAN_DATE', 	type:'inputdate',	width:'220px', 		style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			{caption : ["통화"], 		ref : 'CURRENCY_CODE', width : '200px', style : 'text-align:center', type : 'combo',
				typeinfo : {ref : 'jsonCurrencyCode',  label : 'label', value : 'value'}},
			{caption: ["총상환액"],		ref: 'REPAY_TOTAL_AMT',  	type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption: ["차입금대체"],		ref: 'REPAY_TRANSFER_AMT',  type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption: ["원금상환예정액"],	ref: 'REPAY_PLAN_AMT',  type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption: ["차입금잔액"],		ref: 'REMAIN_LOAN_AMT',  type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption: ["이자상환예정액"],	ref: 'INTEREST_REPAY_PLAN_AMT',  type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###', emptyvalue:'0'}},
			{caption: ["이자율"],        ref: 'INTEREST_RATE',    type:'input',  	width:'200px',  style:'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}, maxlength : 24}, format : {type:'number', rule:'#,###.00', emptyvalue:'0.00'}},
			{caption : ["이자일수"], 	ref : 'INTEREST_DAY', 		type:'combo',		width:'200px', 	style : 'text-align:center',
				typeinfo : {ref : 'jsonRepayDd',  label : 'label', value : 'value'}
			},
			{caption: ['적용시작일'], 	ref: 'INTEREST_FROM_DATE', 	type:'inputdate',	width:'220px', 		style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			{caption: ['적용종료일'], 	ref: 'INTEREST_TO_DATE', 	type:'inputdate',	width:'220px', 		style: 'text-align: center', sortable: false,
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
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
			{caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값
		];

		Trl1030GridTab5 = _SBGrid.create(SBGridProperties);
		//Trl1030GridTab5.bind('click', 			'fn_viewTrl1030GridTab5Event');
	}
    
    /*function fn_createTrl1030GridTab6() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid_tap6';
	    SBGridProperties.id 				= 'Trl1030GridTab6';
	    SBGridProperties.jsonref 			= 'jsonTrl1030Tab6';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["계획연번"],			ref: 'PLAN_SEQ', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["상환예정일"],		ref: 'REPAY_PLAN_DATE', 	   	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["통화"],				ref: 'CURRENCY_CODE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["이자율"],			ref: 'INTEREST_RATE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["유효이자율"],		ref: 'EFFECTIVE_INTEREST_RATE',	type:'output',  	width:'100px',  	style:'text-align:left'},

            {caption: ["원금"],				ref: 'REMAIN_LOAN_AMT',				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["차입금대체"],		ref: 'REPAY_TRANSFER_AMT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["원금상환액"],		ref: 'REPAY_PLAN_AMT',				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["유효이자"],			ref: 'EFFECTIVE_INTEREST_PLAN_AMT',	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["액면이자"],			ref: 'INTEREST_REPAY_PLAN_AMT',		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["상각액"],			ref: 'AMORTIZE_PLAN_AMT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["장부가액"],			ref: 'LOAN_BOOK_VALUE_AMT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["시작일자"],			ref: 'INTEREST_FROM_DATE',		type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["종료일자"],			ref: 'INTEREST_TO_DATE',		type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["확정여부"],			ref: 'CONFIRM_FLAG',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전송여부"],			ref: 'INTERFACE_FLAG',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["완료여부"],			ref: 'COMPLETE_FLAG',			type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Trl1030GridTab6 = _SBGrid.create(SBGridProperties);
        //Trl1030GridTab6.bind('click', 			'fn_viewTrl1030GridTab6Event');
    }*/
    
    /**
     * 차입기관 
     */
    function fn_compopup1(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("SCH_BANK_CS_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("SCH_BANK_CS_NAME"));
        } else if(type=='2'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_BANK_CS_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_BANK_CS_NAME"));
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
		        }
			},
    	});
    }
    
    /**
     * 은행 
     */
   /* function fn_compopup2() {
        var searchCode 		= gfnma_nvl(SBUxMethod.get("FM_BANK_CODE"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("FM_BANK_NAME"));
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
                SBUxMethod.set('FM_BANK_CODE', data.BANK_NAME);
                SBUxMethod.set('FM_BANK_NAME', data.BANK_CODE);
            },
        });
    }    */
    
    /**
     * 입금계좌 
     */
     /*function fn_compopup3(type) {
        var searchCode 		= '';
        var searchName 		= '';
        if(type=='1'){
            searchCode 		= gfnma_nvl(SBUxMethod.get("FM_IN_DEPOSIT_CODE"));
            searchName 		= gfnma_nvl(SBUxMethod.get("FM_IN_DEPOSIT_NAME"));
        } else if (type=='2'){
            searchCode 		= gfnma_nvl(SBUxMethod.get("FM_OUT_DEPOSIT_CODE"));
            searchName 		= gfnma_nvl(SBUxMethod.get("FM_OUT_DEPOSIT_NAME"));
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
    }    */
    
     /**
      * 담당부서 
      */
     /*function fn_compopup4(type) {
     	
         var searchText1		= '';
         var searchText2		= '';
         if(type=='1'){
             searchText1		= gfnma_nvl(SBUxMethod.get("FM_DEPOSIT_CODE"));
             searchText2		= gfnma_nvl(SBUxMethod.get("FM_DEPOSIT_NAME"));
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
     }     */
     
     /**
      * 원가중심점코드
      */
    /*function fn_compopup5(type) {
     	
         var searchText1 	= '';
         var searchText2 	= '';
         if(type=='1'){
             searchText1 	= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_CODE"));
             searchText2 	= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_NAME"));
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
     }     */
     
     /**
      * 차입금차입
      */ 
	/*function fn_compopup6(type) {
     	
         var searchCode 	= '';
         var searchName 	= '';
         if(type=='1'){
        	 searchCode 	= gfnma_nvl(SBUxMethod.get("FM_LOAN_ACCOUNT_CODE"));
        	 searchName 	= gfnma_nvl(SBUxMethod.get("FM_LOAN_ACCOUNT_NAME"));
         } else if(type=='2'){
        	 searchCode 	= gfnma_nvl(SBUxMethod.get("FM_LOAN_REPAY_TR_CODE"));
        	 searchName 	= gfnma_nvl(SBUxMethod.get("FM_LOAN_REPAY_TR_NAME"));
         } else if(type=='3'){
        	 searchCode 	= gfnma_nvl(SBUxMethod.get("FM_INTEREST_REPAY_TR_CODE"));
        	 searchName 	= gfnma_nvl(SBUxMethod.get("FM_INTEREST_REPAY_TR_NAME"));
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
   	}*/
    
     /**
      * 차입금계정
      */ 
  	/*function fn_compopup7(type) {
     	
         var searchText1 	= '';
         var searchText2 	= '';
         if(type=='1'){
             searchText1 	= gfnma_nvl(SBUxMethod.get("FM_LOAN_ACCOUNT_CODE"));
             searchText2 	= gfnma_nvl(SBUxMethod.get("FM_LOAN_ACCOUNT_NAME"));
         } else if(type=='2'){
             searchText1 	= gfnma_nvl(SBUxMethod.get("FM_INTEREST_EXPENSE_ACCOUNT_CODE"));
             searchText2 	= gfnma_nvl(SBUxMethod.get("FM_INTEREST_EXPENSE_ACCOUNT_NAME"));
         } else if(type=='3'){
             searchText1 	= gfnma_nvl(SBUxMethod.get("FM_PREPAID_ACC_CODE"));
             searchText2 	= gfnma_nvl(SBUxMethod.get("FM_PREPAID_ACC_NAME"));
         } else if(type=='4'){
             searchText1 	= gfnma_nvl(SBUxMethod.get("FM_LONG_PREPAID_ACC_CODE"));
             searchText2 	= gfnma_nvl(SBUxMethod.get("FM_LONG_PREPAID_ACC_NAME"));
         } else if(type=='5'){
             searchText1 	= gfnma_nvl(SBUxMethod.get("FM_ACCRUED_EXPENSE_ACCOUNT_CODE"));
             searchText2 	= gfnma_nvl(SBUxMethod.get("FM_ACCRUED_EXPENSE_ACCOUNT_NAME"));
         } else if(type=='6'){
             searchText1 	= gfnma_nvl(SBUxMethod.get("FM_PRESENT_VALUE_ACCOUNT_CODE"));
             searchText2 	= gfnma_nvl(SBUxMethod.get("FM_PRESENT_VALUE_ACCOUNT_NAME"));
         } else if(type=='7'){
             searchText1 	= gfnma_nvl(SBUxMethod.get("FM_LOAN_LIQUID_ACCOUNT_CODE"));
             searchText2 	= gfnma_nvl(SBUxMethod.get("FM_LOAN_LIQUID_ACCOUNT_NAME"));
         } else if(type=='8'){
             searchText1 	= gfnma_nvl(SBUxMethod.get("FM_PRESENT_VALUE_LIQUID_ACCT_CD"));
             searchText2 	= gfnma_nvl(SBUxMethod.get("FM_PRESENT_VALUE_LIQUID_ACCT_NM"));
         } else if(type=='9'){
             searchText1 	= gfnma_nvl(SBUxMethod.get("FM_PRESENT_VALUE_INTEREST_ACCT_CD"));
             searchText2 	= gfnma_nvl(SBUxMethod.get("FM_PRESENT_VALUE_INTEREST_ACCT_NM"));
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
 		        }
 			},
     	});
     }       */
    
     /**
      * 상환거래처
      */ 
   	/*function fn_compopup8(){
    	 
         var searchCode 		= gfnma_nvl(SBUxMethod.get("FM_REPAY_BANK_CS_CODE"));
         var searchName 		= gfnma_nvl(SBUxMethod.get("FM_REPAY_BANK_CS_NAME"));
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
     }*/
     
     /**
      * 상환거래처계좌
      */
	/*function fn_compopup9(cellData1, cellData2, cellData3) {
     	
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
     }*/

	/**
	 * 목록 조회
	 */
	const fn_P_TRL1010_Q_LIST = async function (strWorkType, row) {

		let FI_ORG_CODE 	= gfn_nvl(SBUxMethod.get("SCH_FI_ORG_CODE")); 	//APC명
		let BASE_DATE 		= gfn_nvl(SBUxMethod.get("SCH_BASE_DATE")); 	//조회기준일자
		let ALL_YN 			= gfn_nvl(SBUxMethod.get("SCH_ALL_YN")); 		//만기차입금포함여부
		let LOAN_TYPE 		= gfn_nvl(SBUxMethod.get("SCH_LOAN_TYPE")); 	//차입금유형
		let BANK_CS_CODE 	= gfn_nvl(SBUxMethod.get("SCH_BANK_CS_CODE")); 	//차입기관

		if (_.isEqual(strWorkType, 'LIST')){

			/*if (!FI_ORG_CODE) {
				gfn_comAlert("W0002", "APC명");
				return;
			}*/
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

		const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectTrl1030List.do", {
			getType: 'json',
			workType: strWorkType,
			cv_count: '5',
			params: gfnma_objectToString(paramObj)
		});

		const data = await postJsonPromise;

		try {

			if (_.isEqual("S", data.resultStatus)) {

				/** @type {number} **/
                let totalRecordCount = 0;

				jsonTrl1030Top.length = 0;
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
					jsonTrl1030Top.push(msg);
					 totalRecordCount++;
				});

				Trl1030GridTop.rebuild();

				if(jsonTrl1030Top.length > 0) {
					Trl1030GridTop.clickRow(gfn_nvl(row) == '' ? 1 : row);
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

			/*if (!FI_ORG_CODE) {
				gfn_comAlert("W0002", "APC명");
				return;
			}*/
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

		const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectTrl1030List.do", {
			getType: 'json',
			workType: strWorkType,
			cv_count: '5',
			params: gfnma_objectToString(paramObj)
		});

		const data = await postJsonPromise;

		try {

			if (_.isEqual("S", data.resultStatus)) {

				/** @type {number} **/
                //let totalRecordCount = 0;

				/**************************** 상환계획 **********************************/
				jsonTrl1030Tab5.length = 0;
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
					jsonTrl1030Tab5.push(msg);
					//totalRecordCount++;
				});

				Trl1030GridTab5.rebuild();
				//document.querySelector('#listCount2').innerText = totalRecordCount;


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

	//상세정보 보기
	async function fn_view() {
		var nCol = Trl1030GridTop.getCol();
		var nRow = Trl1030GridTop.getRow();

		if (nCol == -1) {
			return;
		}

		if (nRow == -1) {
			return;
		}

		let gridData = Trl1030GridTop.getRowData(nRow);

		if (_.isEmpty(gridData)){
			return;
		}


		fn_P_TRL1010_Q('DETAIL', gridData);


	}



	// 행 추가 [상황계횐]
	const fn_btnAdd = function() {
		let rowVal = Trl1030GridTab5.getRow();

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
			Trl1030GridTab5.addRow(true, msg);
		}else{
			Trl1030GridTab5.insertRow(rowVal, 'below', msg);
		}
	}

	// 행삭제 [상황계횐]
	const fn_btnDel = async function () {

		let rowVal = Trl1030GridTab5.getRow();

		if (rowVal == -1) {
			gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
			return;
		} else {
			Trl1030GridTab5.deleteRow(rowVal);
		}

	}

	// 최초상황계횐
	const fn_btnPlan = async function () {

		if (gfn_comConfirm("Q0000", "기존 상환계획 정보를 초기화하고 새로운 상환계획 정보를 불러오시겠습니까?")) {

			let strloan_num = '';

			var nRow = Trl1030GridTop.getRow();

			let gridData = Trl1030GridTop.getRowData(nRow);

			if (_.isEmpty(gridData) == false){
				strloan_num = gridData.LOAN_NUM;
			}

			//GridDeleteAllRow(grdPlan);
			await fn_P_TRL1010_Q("PLAN", gridData);
			await fn_P_TRL1010_Q("DETAIL", gridData);
			if (strloan_num != '')
			{
				//gvwInfo.FocusedRowHandle = GetGridRowIndex(grdInfo, "loan_num", strloan_num);
				//fn_P_TRL1010_Q_LIST('LIST', nRow);
			}

		}

	}

	// 재계산
	const fn_btnReCalc = async function () {

		if (gfn_comConfirm("Q0000", "기존 현재가치관리 정보를 초기화하고 새로운 정보를 불러오시겠습니까?")) {

			let strloan_num = '';

			var nRow = Trl1030GridTop.getRow();

			let gridData = Trl1030GridTop.getRowData(nRow);

			if (_.isEmpty(gridData) == false){
				strloan_num = gridData.LOAN_NUM;
			}

			//GridDeleteAllRow(grdPlan);
			await fn_P_TRL1010_Q("RECALC", gridData);
			await fn_P_TRL1010_Q("DETAIL", gridData);
			if (strloan_num != '')
			{
				//gvwInfo.FocusedRowHandle = GetGridRowIndex(grdInfo, "loan_num", strloan_num);
				//fn_P_TRL1010_Q_LIST('LIST', nRow);
			}
		}

	}

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>