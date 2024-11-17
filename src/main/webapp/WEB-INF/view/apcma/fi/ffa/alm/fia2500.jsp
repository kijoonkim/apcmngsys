<%
/**
 * @Class Name 		: fia2500.jsp
 * @Description 	: 취득등록 화면
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
	<title>title : 취득등록</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid" style="border-radius:0px">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 취득등록 -->
                </div>
                <div style="margin-left: auto;">
                	<!-- 
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="취득내역 가져오기"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnInterface"></sbux-button>
                	 -->
                    <font style="margin-right:5px"></font>
                    <sbux-button id="BTN_CANCEL" uitype="normal" text="자산지정취소"  		class="btn btn-sm btn-outline-danger" onclick="fn_btnCancel"></sbux-button>
                    <font style="margin-right:5px"></font>
                    <sbux-button id="BTN_ASSET" uitype="normal" text="자산등록"  			class="btn btn-sm btn-outline-danger" onclick="fn_btnAsset"></sbux-button>
                    <font style="margin-right:5px"></font>
                    <sbux-button uitype="normal" text="일괄등록"  			class="btn btn-sm btn-outline-danger" onclick="fn_btnInterfaceBth"></sbux-button>
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
	                    
	                      	<!-- hidden  -->
	  						<sbux-input style="display:none" id="SCH_ASSET_CATEGORY" uitype="text" class="form-control input-sm"></sbux-input>
	                  		<!-- /hidden -->
	                    
	                        <tr>
	                            <th scope="row" class="th_bg_search">APC</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        	<td></td>
	                        	
	                            <th scope="row" class="th_bg_search">사업장</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        	<td></td>
	                        
	                            <th scope="row" class="th_bg_search">실적구분</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select style="width:150px" id="SCH_ACTUAL_FLAG_P" uitype="single" jsondata-ref="jsonActualFlagP" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        	<td></td>
	                        	
	                            <th scope="row" class="th_bg_search">취득일</th>
	                            <td class="td_input" >
								    <sbux-datepicker
								            id="SCH_ACQUIRE_DATE_FR"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast table-datepicker-ma">
								    </sbux-datepicker>
	                            </td>
	                        	<td>-</td>
	                            <td class="td_input" >
								    <sbux-datepicker
								            id="SCH_ACQUIRE_DATE_TO"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast table-datepicker-ma">
								    </sbux-datepicker>                          
	                            </td>
	                        	<td></td>
	                        
	                        </tr>
	                        
	                        <tr>
	                        
	                            <th scope="row" class="th_bg_search">취득구분</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_SACQUIRE_TYPE" uitype="single" jsondata-ref="jsonSacquireType" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        	<td></td>
	                        
	                            <th scope="row" class="th_bg_search">취득처</th>
	                            <td colspan="3" class="td_input" >
		                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	  									<sbux-input style="width:80px" id="SCH_CS_CODE" uitype="text" class="form-control input-sm"></sbux-input>
	  									<font style="width:5px"></font>
										<sbux-button
											id="BTN_POP1" 
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup1()"></sbux-button>
	  									<font style="width:5px"></font>
	  									<sbux-input style="width:100%" id="SCH_CS_NAME" uitype="text" class="form-control input-sm"></sbux-input>
		                           	</div>
	                            </td>
	                        	<td></td>
	                            
	                            <th scope="row" class="th_bg_search">담당부서</th>
	                            <td colspan="3" class="td_input" >
		                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	  									<sbux-input style="width:80px" id="SCH_DEPT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
	  									<font style="width:5px"></font>
										<sbux-button
											id="BTN_POP2" 
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup2()"></sbux-button>
	  									<font style="width:5px"></font>
	  									<sbux-input style="width:100%" id="SCH_DEPT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
		                           	</div>
	                            </td>
	                        	<td></td>
	                        
	                            <th scope="row" class="th_bg_search">담당자</th>
	                            <td colspan="3" class="td_input" >
		                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	  									<sbux-input style="width:80px" id="SCH_EMP_CODE" uitype="text" class="form-control input-sm"></sbux-input>
	  									<font style="width:5px"></font>
										<sbux-button
											id="BTN_POP3" 
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup3"></sbux-button>
	  									<font style="width:5px"></font>
	  									<sbux-input style="width:100%" id="SCH_EMP_NAME" uitype="text" class="form-control input-sm"></sbux-input>
		                           	</div>
	                            </td>
	                        	<td></td>
	                            
	                        </tr>
	                        
	                        <tr>
	                        
	                            <th scope="row" class="th_bg_search">회계기준</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        	<td></td>
	                            
	                        	<td colspan="15"></td>
	                        </tr>
	                    </tbody>
	                </table>
				</div>                

                <div class="row">
                
                    <div class="col-sm-6" style="width:100%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>유형자산취득리스트</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb_area_grid1" style="height:200px; width:100%;"></div>
                        </div>
                    </div>
                
                    <div class="col-sm-6" style="width:100%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>취득내역</span>
                                </li>
                            </ul>
                        </div>
                        
						<div class="table-responsive tbl_scroll_sm" style="padding-top:10px">
						
						    <sbux-tabs id="idxTab_norm1" name="idxTab_norm1" uitype="normal"
			                   title-target-id-array = "SB_TOP_TAB1^SB_TOP_TAB2"
			                   title-text-array = "취득내역^자산원장등록"
			                   title-target-value-array="1^2"
			                   onclick="fn_tabClick(idxTab_norm1)"></sbux-tabs>					
							
							<div class="tab-content" style="width:100%" >
							
								<div id="SB_TOP_TAB1" >
		                        	<table id="dataArea1" class="table table-bordered tbl_fixed">
		                                <colgroup>
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 9%">
					
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 9%">
					
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 9%">
					
					                        <col style="width: 6%">
					                        <col style="width: 6%">
					                        <col style="width: 9%">
		                                </colgroup>
					                    <tbody>
					                    
				                           	<!-- hidden  -->
				  							<sbux-input  id="FM_FI_ORG_CODE"  		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_DOC_BATCH_NO"  		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_INVOICE_ID" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_INVOICE_SEQ" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_DOC_NUM" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							
				  							<sbux-input  id="FM_ASSET_CATEGORY"  		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_ASSET_CATEGORY_NAME"  	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							
				  							<sbux-input  id="FM_ASSET_LEVEL2"  			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_ASSET_LEVEL2_NAME"  	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							
				  							<sbux-input  id="FM_ASSET_LEVEL3"  			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_ASSET_LEVEL3_NAME" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							
				  							<sbux-input  id="FM_LOCATION_CODE"  	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_LOCATION_NAME" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							
			                                <sbux-input  id="FM_VAT_RATE" 		style="display:none" class="form-control input-sm" uitype="text" ></sbux-input>
				                       		<!-- /hidden -->
		                       					                    
			                                <tr>
			                                    <th scope="row" class="th_bg">취득번호</th>
			                                    <td colspan="2" class="td_input">
			                                        <sbux-input id="FM_ASSET_ACQUIRE_NO" class="form-control input-sm" uitype="text" ></sbux-input>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">취득일</th>
			                                    <td colspan="2" class="td_input">
												    <sbux-datepicker
												            id="FM_ACQUIRE_DATE"
												            uitype="popup"
												            date-format="yyyy-mm-dd"
												            class="form-control input-sm input-sm-ast table-datepicker-ma">
												    </sbux-datepicker>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">통화</th>
			                                    <td colspan="2" class="td_input">
			                            			<sbux-select id="FM_CURRENCY_CODE" name="FM_CURRENCY_CODE" uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm" onChange=fn_changeCurrencyCode(FM_CURRENCY_CODE)></sbux-select>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">신고사업장</th>
			                                    <td colspan="2" class="td_input">
			                            			<sbux-select id="FM_TAX_SITE_CODE" uitype="single" jsondata-ref="jsonTaxSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>
			                                </tr>
			                                
			                                <tr>
			                                    <th scope="row" class="th_bg">취득처</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_CS_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															id="BTN_POP4" 
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text="…" uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup4()"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_CS_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">취득구분</th>
			                                    <td colspan="2" class="td_input">
			                            			<sbux-select id="FM_ACQUIRE_TYPE" name="FM_ACQUIRE_TYPE" uitype="single" jsondata-ref="jsonSacquireType" unselected-text="선택" class="form-control input-sm" 
			                            			onchange="fn_CngAcquireType(FM_ACQUIRE_TYPE)"></sbux-select>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">환율</th>
			                                    <td colspan="2" class="td_input">
			                                        <sbux-input id="FM_EXCHANGE_RATE" name="FM_EXCHANGE_RATE" class="form-control input-sm" uitype="text"  onchange="fn_CngExchangeRate(FM_EXCHANGE_RATE)" ></sbux-input>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">부가세유형</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:60px" id="FM_VAT_TYPE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															id="BTN_POP5" 
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text="…" uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup5()"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_VAT_TYPE_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                </tr>
			                                
			                                <tr>
			                                    <th scope="row" class="th_bg">담당부서</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_DEPT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															id="BTN_POP6" 
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text="…" uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup6('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_DEPT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">자산번호</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_ASSET_NO" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															id="BTN_POP7" 
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text="…" uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7()"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_ASSET_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">취득금액</th>
			                                    <td colspan="2" class="td_input">
				  									<sbux-input style="width:100%" id="FM_ORIGINAL_AMOUNT" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">부가세</th>
			                                    <td colspan="2" class="td_input">
				  									<sbux-input style="width:100%" id="FM_VAT_AMOUNT" name="FM_VAT_AMOUNT" uitype="text" class="form-control input-sm" onChange=fn_changeVatAmount(FM_VAT_AMOUNT)></sbux-input>
			                                    </td>
			                                </tr>
			                                
			                                <tr>
			                                    <th scope="row" class="th_bg">담당자</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_EMP_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															id="BTN_POP8" 
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text="…" uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup8"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_EMP_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">사업장</th>
			                                    <td colspan="2" class="td_input">
					                                <sbux-select id="FM_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">환산금액</th>
			                                    <td colspan="2" class="td_input">
				  									<sbux-input style="width:100%" id="FM_FUNCTIONAL_AMOUNT" name="FM_FUNCTIONAL_AMOUNT" uitype="text" class="form-control input-sm" onChange=fn_changeFunctionalAmount(FM_FUNCTIONAL_AMOUNT)></sbux-input>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">금액합계</th>
			                                    <td colspan="2" class="td_input">
				  									<sbux-input style="width:100%" id="FM_TOTAL_AMOUNT" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>
			                                </tr>
			                                
			                                <tr>
			                                    <th scope="row" class="th_bg">원가중심점</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_COST_CENTER_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															id="BTN_POP9" 
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text="…" uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup9('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_COST_CENTER_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">프로젝트</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_PROJECT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															id="BTN_POP10" 
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text="…" uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup10('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_PROJECT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">회계기준</th>
			                                    <td colspan="2" class="td_input">
					                                <sbux-select id="FM_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">취득수량</th>
			                                    <td colspan="2" class="td_input">
				  									<sbux-input style="width:100%" id="FM_ACQUISITION_QTY" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>
			                                </tr>
			                                
			                                <tr>
			                                    <th scope="row" class="th_bg">비고</th>
			                                    <td colspan="2" class="td_input">
			                                        <sbux-textarea id="FM_MEMO" class="form-control input-sm" uitype="normal" style="width:100%; height:50px;""></sbux-textarea>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">자산계정</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_ACCOUNT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															id="BTN_POP11" 
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text="…" uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup11('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_ACCOUNT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">원천</th>
			                                    <td colspan="5" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_SOURCE_TYPE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:200px" id="FM_SOURCE_NAME" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:10px"></font>
									                    <sbux-button id="BTN_DOC_VIEW" 	uitype="normal" text="전표조회"  	class="btn btn-sm btn-outline-danger" onclick="fn_docView"></sbux-button>
					  								</div>	
			                                    </td>
			                                    
			                                </tr>
			                                
			                            </tbody>
			                        </table>            							
								</div>
							
								<div id="SB_TOP_TAB2" >
								
								    <sbux-tabs id="idxTab_norm2" name="idxTab_norm2" uitype="normal"
					                   title-target-id-array = "SB_SUB_TAB1^SB_SUB_TAB2"
					                   title-text-array = "기본내역등록^감가상각등록"
					                   title-target-value-array="1^2"
					                   onclick="fn_tabClick2(idxTab_norm2)"></sbux-tabs>					
									
									<div class="tab-content" style="width:100%" >
									
										<div id="SB_SUB_TAB1" >
										
				                        	<table id="dataArea2" class="table table-bordered tbl_fixed">
				                                <colgroup>
							                        <col style="width: 6%">
							                        <col style="width: 6%">
							                        <col style="width: 9%">
							
							                        <col style="width: 6%">
							                        <col style="width: 6%">
							                        <col style="width: 9%">
							
							                        <col style="width: 6%">
							                        <col style="width: 6%">
							                        <col style="width: 9%">
							
							                        <col style="width: 6%">
							                        <col style="width: 6%">
							                        <col style="width: 9%">
				                                </colgroup>
							                    <tbody>
							                    
						                      	<!-- hidden  -->
						  						<sbux-input style="display:none" id="FM2_ASSET_ACC_CODE_A" uitype="text" class="form-control input-sm"></sbux-input>
						                  		<!-- /hidden -->
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">자산구분</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:100%" id="FM2_ASSET_CATEGORY_NAME" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP12" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup12"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="display:none;" id="FM2_ASSET_CATEGORY_CODE" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">자산명</th>
					                                    <td colspan="5" class="td_input">
						  									<sbux-input id="FM2_ASSET_NAME_A" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">자산계정</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM2_ASSET_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP13" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup13"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM2_ASSET_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">중분류</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:100%" id="FM2_ASSET_LEVEL2_NAME" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP14" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup14"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="display:none;" id="FM2_ASSET_LEVEL2_CODE" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">최초감가상각년월</th>
					                                    <td colspan="2" class="td_input">
															<sbux-datepicker
															        id="FM_DEPRECIATE_START_YYYYMM"
															        uitype="popup"
															        datepicker-mode="month"
															        date-format="yyyy-mm"
															        style="width:100px"
															        class="form-control input-sm input-sm-ast table-datepicker-ma" >
															</sbux-datepicker>                            
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">최초취득처</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM2_CS_CODE1_A" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP15" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup15"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM2_CS_NAME1_A" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">감가상각비계정</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM2_DEPR_EXP_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP16" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup11('2')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM2_DEPR_EXP_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">소분류</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:100%" id="FM2_ASSET_LEVEL3_NAME" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP17" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup16"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="display:none;" id="FM2_ASSET_LEVEL3_CODE" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">최초상각월(IFRS)</th>
					                                    <td colspan="2" class="td_input">
															<sbux-datepicker
															        id="FM_DEPRECIATE_START_YYYYMM_IFRS"
															        uitype="popup"
															        datepicker-mode="month"
															        date-format="yyyy-mm"
															        style="width:100px"
															        class="form-control input-sm input-sm-ast table-datepicker-ma" >
															</sbux-datepicker>                            
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">담당부서</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM2_DEPT_CODE1_A" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP18" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup6('2')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM2_DEPT_NAME1_A" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">감가상각누계계정</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM2_ACCUM_DEPR_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP19" 
																	style="width:21px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup11('3')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM2_ACCUM_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">최초취득일</th>
					                                    <td colspan="2" class="td_input">
														    <sbux-datepicker
														            id="FM2_ACQUIRE_DATE_A"
														            uitype="popup"
														            date-format="yyyy-mm-dd"
														            class="form-control input-sm input-sm-ast table-datepicker-ma">
														    </sbux-datepicker>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">통화</th>
					                                    <td colspan="2" class="td_input">
							                                <sbux-select id="FM2_CURRENCY_CODE_A" uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">원가중심점</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM2_COST_CENTER_CODE1_A" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP20" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup9('2')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM2_COST_CENTER_NAME1_A" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">보조금계정</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM2_SUBSIDIES_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP21" 
																	style="width:21px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup11('4')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM2_SUBSIDIES_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">사업장</th>
					                                    <td colspan="2" class="td_input">
							                            	<sbux-select id="FM2_SITE_CODE1_A" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">취득금액</th>
					                                    <td colspan="2" class="td_input">
				  											<sbux-input style="width:100%" id="FM2_FUNCTIONAL_AMOUNT_A" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">프로젝트</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM2_PROJECT_CODE_A" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP22" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup10('2')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM2_PROJECT_NAME_A" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">보조금상각비</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM2_SUBSIDIES_DEPR_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP23" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup11('5')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM2_SUBSIDIES_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">상각여부</th>
					                                    <td colspan="2" class="td_input">
							                            	<sbux-checkbox id="FM2_DEPRECIATE_YN" uitype="normal" text="예" true-value="Y" false-value="N" onchange="fn_cngDepreciateYn(FM2_DEPRECIATE_YN)"></sbux-checkbox>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">자본적지출</th>
					                                    <td colspan="2" class="td_input">
				  											<sbux-input style="width:100%" id="FM2_CAPITAL_EXPENDITURE" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">위치코드</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM2_LOCATION_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP24" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup17()"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM2_LOCATION_NAME" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">보조금상각누계액</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM2_SUBSIDIES_ACCUM_DEPR_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP25" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text="…" uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup11('6')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM2_SUBSIDIES_ACCUM_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
													</tr>
													
												</tbody>
											</table>
												
										</div>
										
										<div id="SB_SUB_TAB2" >
										
				                        	<table id="dataArea3" class="table table-bordered tbl_fixed">
				                                <colgroup>
							                        <col style="width: 6%">
							                        <col style="width: 6%">
							                        <col style="width: 9%">
							
							                        <col style="width: 6%">
							                        <col style="width: 6%">
							                        <col style="width: 9%">
							
							                        <col style="width: 6%">
							                        <col style="width: 6%">
							                        <col style="width: 9%">
							
				                                </colgroup>
							                    <tbody>
							                    
					                                <tr>
					                                    <th scope="row" colspan="3" class="td_input" style="text-align:center">▶ 기업회계기준</th>
					                                    <th scope="row" colspan="3" class="td_input" style="text-align:center">▶ 법인세기준</th>
					                                    <th scope="row" colspan="3" class="td_input" style="text-align:center">▶ IFRS기준</th>
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">감가상각방법</th>
					                                    <td colspan="2" class="td_input">
					                            			<sbux-select style="width:150px" id="FM2_DEPRECIATION_METHOD_GAAP" uitype="single" jsondata-ref="jsonDepreMethodCode" unselected-text="선택" class="form-control input-sm" onChange=fn_changeDepMethodGaap(FM2_DEPRECIATION_METHOD_GAAP)></sbux-select>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">감가상각방법</th>
					                                    <td colspan="2" class="td_input">
					                            			<sbux-select style="width:150px" id="FM2_DEPRECIATION_METHOD_TAX" uitype="single" jsondata-ref="jsonDepreMethodCode" unselected-text="선택" class="form-control input-sm" onChange=fn_changeDepMethodTax(FM2_DEPRECIATION_METHOD_TAX)></sbux-select>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">감가상각방법</th>
					                                    <td colspan="2" class="td_input">
					                            			<sbux-select style="width:150px" id="FM2_DEPRECIATION_METHOD_IFRS" uitype="single" jsondata-ref="jsonDepreMethodCode" unselected-text="선택" class="form-control input-sm" onChange=fn_changeDepMethodIfrs(FM2_DEPRECIATION_METHOD_IFRS)></sbux-select>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">감가상각주기</th>
					                                    <td colspan="2" class="td_input">
					                            			<sbux-select style="width:150px" id="FM2_DEPRECIATION_PERIOD_GAAP" uitype="single" jsondata-ref="jsonDeprePeriodCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">감가상각주기</th>
					                                    <td colspan="2" class="td_input">
					                            			<sbux-select style="width:150px" id="FM2_DEPRECIATION_PERIOD_TAX" uitype="single" jsondata-ref="jsonDeprePeriodCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">감가상각주기</th>
					                                    <td colspan="2" class="td_input">
					                            			<sbux-select style="width:150px" id="FM2_DEPRECIATION_PERIOD_IFRS" uitype="single" jsondata-ref="jsonDeprePeriodCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">내용년수</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM2_USEFUL_LIFE_GAAP" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">내용년수</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM2_USEFUL_LIFE_TAX" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">내용년수</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM2_USEFUL_LIFE_IFRS" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">잔존가액</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM2_SALVAGE_VALUE_GAAP" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">잔존가액</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM2_SALVAGE_VALUE_TAX" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">잔존가액</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM2_SALVAGE_VALUE_IFRS" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg"><font id="LV2_SALVAGE_RATE_GAAP">잔존율</font></th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM2_SALVAGE_RATE_GAAP" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg"><font id="LV2_SALVAGE_RATE_TAX">잔존율</font></th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM2_SALVAGE_RATE_TAX" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg"><font id="LV2_SALVAGE_RATE_IFRS">잔존율</font></th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM2_SALVAGE_RATE_IFRS" uitype="text" class="form-control input-sm"></sbux-input>
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
        		
                    <div class="col-sm-6" style="width:100%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>상세내역</span>
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
                        <div>
                            <div id="sb_area_grid2" style="height:200px; width:100%;"></div>
                        </div>
	                    <div style="width:100%;display:flex;vertical-align:middle;padding-top:10px;margin-right:auto">
		                    <font style="margin-left:380px"></font>
							<sbux-input style="width:100px;font-weight:bold" id="TOT_ASSET_QTY" readonly uitype="text" 
								mask="{'alias':'numeric','autoGroup':3,'groupSeparator':',','isShortcutChar':true}" 
								class="form-control input-sm">
							</sbux-input>
							
		                    <font style="margin-left:270px"></font>
							<sbux-input style="width:170px;font-weight:bold" id="TOT_ORIGINAL_AMOUNT" readonly uitype="text" 
								mask="{'alias':'numeric','autoGroup':3,'groupSeparator':',','isShortcutChar':true}" 
								class="form-control input-sm">
							</sbux-input>
							
							<sbux-input style="width:170px;font-weight:bold" id="TOT_FUNCTIONAL_AMOUNT" readonly uitype="text" 
								mask="{'alias':'numeric','autoGroup':3,'groupSeparator':',','isShortcutChar':true}" 
								class="form-control input-sm">
							</sbux-input>
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
	<!-- 
    <div>
        <sbux-modal style="width:1400px" id="modal-compopfia2510" name="modal-compopfia2510" uitype="middle" header-title="" body-html-id="body-modal-compopfia2510" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopfia2510">
    	<jsp:include page="../../../com/popup/comPopFia2510.jsp"></jsp:include>
    </div>
	 -->
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:1400px" id="modal-compopfia2520" name="modal-compopfia2520" uitype="middle" header-title="" body-html-id="body-modal-compopfia2520" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopfia2520">
    	<jsp:include page="../../../com/popup/comPopFia2520.jsp"></jsp:include>
    </div>
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.userId}';
	
	var p_ss_languageID			= '${loginVO.maLanguageID}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	var p_ss_siteCode			= '${loginVO.maSiteCode}';
	var p_ss_currUnit			= '${loginVO.maCurrUnit}';
	var p_ss_currCode			= '${loginVO.maCurrCode}';
	var p_ss_defaultAcctRule 	= '${loginVO.maDefaultAcctRule}';
	var p_ss_baseCurrCode 		= '${loginVO.maBaseCurrCode}';
	var p_ss_taxSiteCode 		= '${loginVO.maTaxSiteCode}';
	
	//-----------------------------------------------------------

	var p_sel_rowData =  null;
	
    var p_menu_param	= null;
	
    //grid 초기화
    var Fia2500GridMast; 			// 그리드를 담기위한 객체 선언
    var jsonFia2500Mast 	= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fia2500GridDetail; 			// 그리드를 담기위한 객체 선언
    var jsonFia2500Detail 	= []; 	// 그리드의 참조 데이터 주소 선언

	var jsonFiOrgCode		= [];	// APC
	var jsonSiteCode		= [];	// 사업장
	var jsonActualFlagP		= [];	// 실적구분
	var jsonSacquireType	= [];	// 취득구분
	var jsonAcctRuleCode	= [];	// 회계기준
	var jsonTaxSiteCode		= [];	// 신고사업장
	var jsonCurrencyCode	= [];	// 통화
	var jsonDepreMethodCode	= [];	// 감가상각방법
	var jsonDeprePeriodCode	= [];	// 감가상각주기
	
	var jsonUnitCode		= [];	// 단위
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // APC
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],									jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SCH_SITE_CODE','FM_SITE_CODE','FM2_SITE_CODE1_A'],	jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 실적구분
            gfnma_setComSelect(['SCH_ACTUAL_FLAG_P'],								jsonActualFlagP,	'L_FIA020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 취득구분
            gfnma_setComSelect(['SCH_SACQUIRE_TYPE','FM_ACQUIRE_TYPE'],				jsonSacquireType,	'L_FIA007', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE','FM_ACCT_RULE_CODE'],			jsonAcctRuleCode,	'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 신고사업장
            gfnma_setComSelect(['FM_TAX_SITE_CODE'],								jsonTaxSiteCode,	'L_ORG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TAX_SITE_CODE', 'TAX_SITE_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['FM2_CURRENCY_CODE_A','FM_CURRENCY_CODE'],			jsonCurrencyCode,	'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 감가상각방법
            gfnma_setComSelect(['FM2_DEPRECIATION_METHOD_GAAP','FM2_DEPRECIATION_METHOD_TAX','FM2_DEPRECIATION_METHOD_IFRS'],	jsonDepreMethodCode,'L_FIA003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 감가상각주기
            gfnma_setComSelect(['FM2_DEPRECIATION_PERIOD_GAAP','FM2_DEPRECIATION_PERIOD_TAX','FM2_DEPRECIATION_PERIOD_IFRS'],	jsonDeprePeriodCode,'L_FIA004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            
            // 단위
            gfnma_setComSelect(['Fia2500GridDetail'],	jsonUnitCode,	'L_LGS001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'UNIT_CODE', 'UNIT_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//재직상태
		gfnma_getComSelectList('L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME',
			function(list){
				$('#BTN_POP3').click(function(){
					fn_compopup3(list);
				});
				$('#BTN_POP8').click(function(){
					fn_compopup8(list);
				});
			}
		)
  		
		//화면셋팅
    	fn_state('L');
  		
		fn_createFia2500GridMast();
		fn_createFia2500GridDetail();
		//cfn_search();
	} 	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	//메뉴 파라미터 받기 -----------------------------
    	p_menu_param = localStorage.getItem("callMain");
    	if(p_menu_param){
    		p_menu_param = JSON.parse(p_menu_param);
    	}
    	localStorage.removeItem("callMain");
    	//-------------------------------------------------
    	
    	fn_init();
    	
		$('#btn1-row-add').click(function(e){
			e.preventDefault();
			fn_gridRowAdd();
		});
		$('#btn1-row-del').click(function(e){
			e.preventDefault();
			fn_gridRowDel();
		});
    });
    
    //메뉴가 이미 열려있을때..
    window.addEventListener('message', async function(e) {
    	let obj = e.data;
		if(obj){
			if(obj['MENU_MOVE']){
				//console.log('2 message obj:', obj);
				p_menu_param 	= obj;
		     	fn_init();
			}
		}
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
    
       	SBUxMethod.hideTab('idxTab_norm1','SB_TOP_TAB2');
       	
    	if(type=='L'){
    		
			$('#main-btn-new', 	parent.document).attr('disabled', true);
			$('#main-btn-save', parent.document).attr('disabled', true);
			
			SBUxMethod.set('SCH_FI_ORG_CODE', 			p_ss_fiOrgCode);
			SBUxMethod.set('SCH_SITE_CODE', 			p_ss_siteCode);
			SBUxMethod.set('FM2_SITE_CODE1_A', 			p_ss_siteCode);
			SBUxMethod.set('SCH_ACCT_RULE_CODE', 		p_ss_defaultAcctRule);
			SBUxMethod.set('SCH_ACQUIRE_DATE_FR', 		gfnma_date9(-1));
			SBUxMethod.set('SCH_ACQUIRE_DATE_TO', 		gfnma_date4());
			
			SBUxMethod.set('SCH_ASSET_CATEGORY', 		p_ss_languageID);
			
    		SBUxMethod.attr('FM_ASSET_NO', 			'disabled', true);
    		SBUxMethod.attr('FM_ASSET_NAME', 		'disabled', true);
			
    		SBUxMethod.hide('BTN_CANCEL');
    		SBUxMethod.hide('BTN_ASSET');
    		
			if(p_menu_param){
	            var strparam_info = p_menu_param['ParameterInfo'];
	    		if(strparam_info){
					SBUxMethod.set('SCH_ACTUAL_FLAG_P', 	strparam_info); 
		    		SBUxMethod.attr('SCH_ACTUAL_FLAG_P', 	'disabled', true);
	    		}
			}
    		
			//fn_fmDisabled(true);
    	} else if(type=='N'){
    		
    	}
    }     
    
    /**
     * 목록 조회
     */
 	function cfn_search() {
    	
//     	var SaveButton =  $('#main-btn-save', parent.document).prop('disabled');
//     	if(!SaveButton){
// 			if(gfn_comConfirm("Q0001", "작업중 저장하지 않은 데이터가 존재합니다. 저장 후 이동하시겠습니까?")){
// 				if(fn_validation()){
// 					cfn_save();
// 				}
// 			} 
//     	}
		$('#main-btn-save', parent.document).attr('disabled', true);
		$('#main-btn-del', 	parent.document).attr('disabled', false);
    	fn_setFia2500GridMast('HEADER');
    }
    
    /**
     * 입력사항 벨리데이션 check
     */
    function fn_validation(){
    	
    	var bol = true;
    	var p_fm_acquire_date 		= SBUxMethod.set('FM_ACQUIRE_DATE'); 
    	var p_fm_currency_code 		= SBUxMethod.set('FM_CURRENCY_CODE'); 
    	var p_fm_cs_code2 			= SBUxMethod.set('FM_CS_CODE'); 
    	var p_fm_tacquire_type 		= SBUxMethod.set('FM_ACQUIRE_TYPE'); 
    	var p_fm_exchange_rate 		= SBUxMethod.set('FM_EXCHANGE_RATE'); 
    	var p_fm_dept_code 			= SBUxMethod.set('FM_DEPT_CODE'); 
    	var p_fm_asset_code 		= SBUxMethod.set('FM_ASSET_NO'); 
    	var p_fm_emp_code 			= SBUxMethod.set('FM_EMP_CODE'); 
    	var p_fm_site_code 			= SBUxMethod.set('FM_SITE_CODE'); 
    	var p_fm_cost_center_code 	= SBUxMethod.set('FM_COST_CENTER_CODE'); 
    	var p_fm_acct_rule_code 	= SBUxMethod.set('FM_ACCT_RULE_CODE'); 
    	var p_fm_account_code 		= SBUxMethod.set('FM_ACCOUNT_CODE'); 
    	
    	if(!p_fm_acquire_date){
    		gfn_comAlert("E0000","취득내역 탭의 취득일은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_currency_code){
    		gfn_comAlert("E0000","취득내역 탭의 통화는 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_cs_code2){
    		gfn_comAlert("E0000","취득내역 탭의 취득처는 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_tacquire_type){
    		gfn_comAlert("E0000","취득내역 탭의 취득구분은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_exchange_rate){
    		gfn_comAlert("E0000","취득내역 탭의 환율은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_dept_code){
    		gfn_comAlert("E0000","취득내역 탭의 담당부서는 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_asset_code){
    		gfn_comAlert("E0000","취득내역 탭의 자산번호는 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_emp_code){
    		gfn_comAlert("E0000","취득내역 탭의 담당자는 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_site_code){
    		gfn_comAlert("E0000","취득내역 탭의 사업장은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_cost_center_code){
    		gfn_comAlert("E0000","취득내역 탭의 원가중심점은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_acct_rule_code){
    		gfn_comAlert("E0000","취득내역 탭의 회계기준은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_account_code){
    		gfn_comAlert("E0000","취득내역 탭의 자산계정은 필수입력입니다.");
    		bol = false;
    	}
    	return bol;
    }    
    
    /**
     * 그리드 셋팅
     */
    function fn_createFia2500GridMast() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid1';
	    SBGridProperties.id 				= 'Fia2500GridMast';
	    SBGridProperties.jsonref 			= 'jsonFia2500Mast';
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
                    sum : [12,13,14]
                },
                grandtotalrow : {
                    titlecol 		: 11,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["취득일"],			ref: 'ACQUIRE_DATE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["취득구분"], 		ref: 'ACQUIRE_TYPE_NAME',  	  	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["취득번호"], 		ref: 'ASSET_ACQUIRE_NO',    	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["취득처"], 			ref: 'CS_NAME',    				type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["자산번호"],			ref: 'ASSET_NO',  			  	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["자산명"],			ref: 'ASSET_NAME',    			type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["회계기준"],			ref: 'ACCT_RULE_NAME',    		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부가세유형"],		ref: 'VAT_TYPE_NAME',  			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["부가세율"],			ref: 'VAT_RATE',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["통화"],				ref: 'CURRENCY_CODE',    		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환율"],				ref: 'EXCHANGE_RATE',    		type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["취득금액"],			ref: 'ORIGINAL_AMOUNT',    		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["전표금액"],			ref: 'FUNCTIONAL_AMOUNT',		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["부가세"],			ref: 'VAT_AMOUNT',    			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["총합계"],			ref: 'TOTAL_AMOUNT',    		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["취득수량"],			ref: 'ACQUISITION_QTY',    		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전표배치"],			ref: 'DOC_BATCH_NO', 		   	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["전표순번"],			ref: 'DOC_NUM',    				type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Fia2500GridMast = _SBGrid.create(SBGridProperties);
        Fia2500GridMast.bind('click', 			'fn_viewFia2500GridMastEvent');
    }    
    
    //상세정보 보기
    function fn_viewFia2500GridMastEvent() {
    	
        var nRow = Fia2500GridMast.getRow();
		if (nRow < 1) {
            return;
		}
        let rowData = Fia2500GridMast.getRowData(nRow);
		console.log(rowData);      
		
        fn_setFormFia2500GridMast(rowData);
		fn_setFia2500GridDetail('DETAIL', rowData);
    }    
    
    //상세정보 보기
    function fn_viewFia2500GridMastReload(idx) {
    	
    	Fia2500GridMast.setRow(idx);
        let rowData = Fia2500GridMast.getRowData(idx);
		//console.log(rowData);        
		
        fn_setFormFia2500GridMast(rowData);
		fn_setFia2500GridDetail('DETAIL', rowData);
    }
    
    //데이터를 폼에 셋팅
    function fn_setFormFia2500GridMast(obj) {
        
    	gfnma_uxDataSet2('#dataArea1', obj, '', 'FM_', '');
        if(obj['ACQUIRE_TYPE']!='CE' && obj['ACQUIRE_TYPE']!='SUBSIDIES'){
        	SBUxMethod.attr('FM_ASSET_NO', 		'disabled', true);
        	SBUxMethod.attr('FM_ASSET_NAME', 	'disabled', true);
        	$('#BTN_POP7').prop('disabled', 	true);
        } else {
        	SBUxMethod.attr('FM_ASSET_NO', 		'disabled', false);
        	SBUxMethod.attr('FM_ASSET_NAME', 	'disabled', false);
        	$('#BTN_POP7').prop('disabled', 	false);
        }
    }    
    
    /**
     * 취득구분 이벤트 
     */    
    function fn_CngAcquireType(val) {
        console.log('val:', val);
        
        if(!val){
        	return;
        }
        
        if(val=='CE' || val=='SUBSIDIES'){
        	SBUxMethod.attr('FM_ASSET_NO', 		'disabled', false);
        	SBUxMethod.attr('FM_ASSET_NAME', 	'disabled', false);
        	$('#BTN_POP7').prop('disabled', 	false);
        	SBUxMethod.attr('BTN_ASSET', 		'visible',  false);
        	
        	SBUxMethod.hideTab('idxTab_norm1','SB_TOP_TAB2');
        	
        } else {
        	SBUxMethod.set('FM_ASSET_NO', 		'');
        	SBUxMethod.set('FM_ASSET_NAME', 	'');
        	SBUxMethod.attr('FM_ASSET_NO', 		'disabled', true);
        	SBUxMethod.attr('FM_ASSET_NAME', 	'disabled', true);
        	$('#BTN_POP7').prop('disabled', 	true);
        	
        	SBUxMethod.showTab('idxTab_norm1',	'SB_TOP_TAB2');
        	SBUxMethod.attr('BTN_ASSET', 		'visible',  true);
        	
        	SBUxMethod.set('FM2_ASSET_ACC_CODE', 			SBUxMethod.get('FM_ACCOUNT_CODE'));
        	SBUxMethod.set('FM2_ASSET_ACC_NAME', 			SBUxMethod.get('FM_ACCOUNT_NAME'));
        	
        	SBUxMethod.set('FM2_DEPT_CODE1_A', 				SBUxMethod.get('FM_DEPT_CODE'));
        	SBUxMethod.set('FM2_DEPT_NAME1_A', 				SBUxMethod.get('FM_DEPT_NAME'));
        	
        	SBUxMethod.set('FM2_COST_CENTER_CODE1_A', 		SBUxMethod.get('FM_COST_CENTER_CODE'));
        	SBUxMethod.set('FM2_COST_CENTER_NAME1_A', 		SBUxMethod.get('FM_COST_CENTER_NAME'));
        	
        	SBUxMethod.set('FM2_PROJECT_CODE_A', 			SBUxMethod.get('FM_PROJECT_CODE'));
        	SBUxMethod.set('FM2_PROJECT_NAME_A', 			SBUxMethod.get('FM_PROJECT_NAME'));
        	
        	SBUxMethod.set('FM2_CS_CODE1_A', 				SBUxMethod.get('FM_CS_CODE'));
        	SBUxMethod.set('FM2_CS_NAME1_A', 				SBUxMethod.get('FM_CS_NAME'));
        	
        	SBUxMethod.set('FM2_LOCATION_CODE', 			SBUxMethod.get('FM_LOCATION_CODE'));
        	SBUxMethod.set('FM2_LOCATION_NAME', 			SBUxMethod.get('FM_LOCATION_NAME'));
        	
        	SBUxMethod.set('FM2_CURRENCY_CODE_A', 			SBUxMethod.get('FM_CURRENCY_CODE'));
        	SBUxMethod.set('FM2_SITE_CODE1_A', 				SBUxMethod.get('FM_SITE_CODE'));
        	SBUxMethod.set('FM2_ACQUIRE_DATE_A', 			SBUxMethod.get('FM_ACQUIRE_DATE'));
        	SBUxMethod.set('FM2_FUNCTIONAL_AMOUNT_A', 		SBUxMethod.get('FM_FUNCTIONAL_AMOUNT'));
        	
        	SBUxMethod.set('FM2_ASSET_CATEGORY_CODE', 		SBUxMethod.get('FM_ASSET_CATEGORY'));
        	SBUxMethod.set('FM2_ASSET_CATEGORY_NAME', 		SBUxMethod.get('FM_ASSET_CATEGORY_NAME'));
        	
        	SBUxMethod.set('FM2_ASSET_LEVEL2_CODE', 		SBUxMethod.get('FM_ASSET_LEVEL2'));
        	SBUxMethod.set('FM2_ASSET_LEVEL2_NAME', 		SBUxMethod.get('FM_ASSET_LEVEL2_NAME'));
        	
        	SBUxMethod.set('FM2_ASSET_LEVEL3_CODE', 		SBUxMethod.get('FM_ASSET_LEVEL3'));
        	SBUxMethod.set('FM2_ASSET_LEVEL3_NAME', 		SBUxMethod.get('FM_ASSET_LEVEL3_NAME'));
        	
        	fn_setFia1100('Q');
        	
        }
    }    
    
    /**
     * 자산원장등록 가져오기
     */
    const fn_setFia1100 = async function(wtype) {
    	
		let p_fm2_asset_level2_code		= gfnma_nvl(SBUxMethod.get("FM2_ASSET_LEVEL2_CODE"));
		let p_fm2_asset_level3_code		= gfnma_nvl(SBUxMethod.get("FM2_ASSET_LEVEL3_CODE"));
		let p_fm2_asset_level3_name		= gfnma_nvl(SBUxMethod.get("FM2_ASSET_LEVEL3_NAME"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_ASSET_LEVEL2       : p_fm2_asset_level2_code
			,V_P_ASSET_LEVEL3       : p_fm2_asset_level3_code
			,V_P_ASSET_LEVEL3_NAME  : p_fm2_asset_level3_name
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectFia1100.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '1',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {

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
     * 목록 가져오기
     */
    const fn_setFia2500GridMast = async function(wtype) {
    	
		Fia2500GridMast.clearStatus();

		let p_sch_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_sch_site_code				= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_sch_actual_flag_p			= gfnma_nvl(SBUxMethod.get("SCH_ACTUAL_FLAG_P"));
		let p_sch_sacquire_type			= gfnma_nvl(SBUxMethod.get("SCH_SACQUIRE_TYPE"));
		let p_sch_dept_code				= gfnma_nvl(SBUxMethod.get("SCH_DEPT_CODE"));
		let p_sch_emp_code				= gfnma_nvl(SBUxMethod.get("SCH_EMP_CODE"));
		let p_sch_cs_code				= gfnma_nvl(SBUxMethod.get("SCH_CS_CODE"));
		let p_fm_asset_acquire_no		= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACQUIRE_NO"));
		
		let p_sch_acquire_date_fr		= gfnma_nvl(SBUxMethod.get("SCH_ACQUIRE_DATE_FR"));
		let p_sch_acquire_date_to		= gfnma_nvl(SBUxMethod.get("SCH_ACQUIRE_DATE_TO"));
		let p_sch_acct_rule_code		= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		
		if(!p_sch_acquire_date_fr){
 			gfn_comAlert("E0000","취득일(시작일)을 입력하세요");
			return;      		 
		}
		if(!p_sch_acquire_date_to){
 			gfn_comAlert("E0000","취득일(종료일)을 입력하세요");
			return;      		 
		}
		if(!p_sch_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_sch_fi_org_code
			,V_P_SITE_CODE          : p_sch_site_code
			,V_P_ACCT_RULE_CODE     : p_sch_acct_rule_code 
			,V_P_ACTUAL_FLAG     	: p_sch_actual_flag_p 
			,V_P_ACQUIRE_DATE_FR   	: p_sch_acquire_date_fr 
			,V_P_ACQUIRE_DATE_TO   	: p_sch_acquire_date_to 
			,V_P_ACQUIRE_TYPE   	: p_sch_sacquire_type 
			,V_P_DEPT_CODE   		: p_sch_dept_code 
			,V_P_EMP_CODE   		: p_sch_emp_code 
			,V_P_CS_CODE   			: p_sch_cs_code 
			,V_P_ASSET_ACQUIRE_NO	: p_fm_asset_acquire_no 
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectFia2500List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '2',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFia2500Mast.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						FOCUS					: gfnma_nvl(item.FOCUS),			
  						ASSET_ACQUIRE_NO		: gfnma_nvl(item.ASSET_ACQUIRE_NO),			
  						ASSET_NO				: gfnma_nvl(item.ASSET_NO),			
  						ASSET_NAME				: gfnma_nvl(item.ASSET_NAME),			
  						SITE_CODE				: gfnma_nvl(item.SITE_CODE),			
  						ACQUIRE_DATE			: gfnma_nvl(item.ACQUIRE_DATE),			
  						ACQUIRE_TYPE			: gfnma_nvl(item.ACQUIRE_TYPE),			
  						ACQUIRE_TYPE_NAME		: gfnma_nvl(item.ACQUIRE_TYPE_NAME),			
  						ASSET_CATEGORY			: gfnma_nvl(item.ASSET_CATEGORY),			
  						ASSET_LEVEL2			: gfnma_nvl(item.ASSET_LEVEL2),			
  						ASSET_LEVEL3			: gfnma_nvl(item.ASSET_LEVEL3),			
  						DEPT_CODE				: gfnma_nvl(item.DEPT_CODE),			
  						DEPT_NAME				: gfnma_nvl(item.DEPT_NAME),			
  						EMP_CODE				: gfnma_nvl(item.EMP_CODE),			
  						EMP_NAME				: gfnma_nvl(item.EMP_NAME),			
  						CS_CODE					: gfnma_nvl(item.CS_CODE),			
  						CS_NAME					: gfnma_nvl(item.CS_NAME),			
  						COST_CENTER_CODE		: gfnma_nvl(item.COST_CENTER_CODE),			
  						COST_CENTER_NAME		: gfnma_nvl(item.COST_CENTER_NAME),			
  						PROJECT_CODE			: gfnma_nvl(item.PROJECT_CODE),			
  						PROJECT_NAME			: gfnma_nvl(item.PROJECT_NAME),			
  						ACCOUNT_CODE			: gfnma_nvl(item.ACCOUNT_CODE),			
  						ACCOUNT_NAME			: gfnma_nvl(item.ACCOUNT_NAME),			
  						TAX_SITE_CODE			: gfnma_nvl(item.TAX_SITE_CODE),			
  						VAT_TYPE				: gfnma_nvl(item.VAT_TYPE),			
  						VAT_TYPE_NAME			: gfnma_nvl(item.VAT_TYPE_NAME),			
  						VAT_RATE				: gfnma_nvl(item.VAT_RATE),			
  						CURRENCY_CODE			: gfnma_nvl(item.CURRENCY_CODE),			
  						EXCHANGE_RATE			: gfnma_nvl(item.EXCHANGE_RATE),			
  						ORIGINAL_AMOUNT			: gfnma_nvl(item.ORIGINAL_AMOUNT),			
  						VAT_AMOUNT				: gfnma_nvl(item.VAT_AMOUNT),			
  						FUNCTIONAL_AMOUNT		: gfnma_nvl(item.FUNCTIONAL_AMOUNT),			
  						TOTAL_AMOUNT			: gfnma_nvl(item.TOTAL_AMOUNT),			
  						INVOICE_ID				: gfnma_nvl(item.INVOICE_ID),			
  						INVOICE_SEQ				: gfnma_nvl(item.INVOICE_SEQ),			
  						SOURCE_TYPE				: gfnma_nvl(item.SOURCE_TYPE),			
  						MEMO					: gfnma_nvl(item.MEMO),			
  						COMP_CODE				: gfnma_nvl(item.COMP_CODE),
  						FI_ORG_CODE				: gfnma_nvl(item.FI_ORG_CODE),
  						SOURCE_NAME				: gfnma_nvl(item.SOURCE_NAME),
  						ACCT_RULE_CODE			: gfnma_nvl(item.ACCT_RULE_CODE),
  						ACCT_RULE_NAME			: gfnma_nvl(item.ACCT_RULE_NAME),
  						ACQUISITION_QTY			: gfnma_nvl(item.ACQUISITION_QTY),
  					}
  					jsonFia2500Mast.push(msg);
  					totalRecordCount ++;
  				});

        		Fia2500GridMast.rebuild();
  	        	
  	        	//deatil grid 첫번째 행 선택
				if(jsonFia2500Mast.length>0){
					fn_viewFia2500GridMastReload(1);					
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
    
    function fn_createFia2500GridDetail() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid2';
	    SBGridProperties.id 				= 'Fia2500GridDetail';
	    SBGridProperties.jsonref 			= 'jsonFia2500Detail';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.allowcopy 			= true; //복사	    
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["연번"],			ref: 'ACQUIRE_SEQ', 			type:'input',  	width:'80px',  		style:'text-align:left'},
            {caption: ["자산명"], 		ref: 'ASSET_NAME',  		  	type:'input',  	width:'200px',  	style:'text-align:left'},
            {caption: ["규격"], 		ref: 'ASSET_SPEC',    			type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["수량"], 		ref: 'ASSET_QTY',  				type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["단위"],			ref: 'UNIT_CODE', 				type:'combo',  	width:'100px',  	style:'text-align:left', disabled: false,
            	typeinfo: {
					ref			: 'jsonUnitCode',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
            	}
            },
            {caption: ["단가"],			ref: 'ASSET_PRICE',    			type:'input',  		width:'170px',  	style:'text-align:left'},
            {caption: ["통화금액"],		ref: 'ORIGINAL_AMOUNT',    		type:'input',  		width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["전표금액"],		ref: 'FUNCTIONAL_AMOUNT',		type:'input',  		width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["비고"],			ref: 'MEMO',    				type:'input',  		width:'300px',  	style:'text-align:left'},
        ];

        Fia2500GridDetail = _SBGrid.create(SBGridProperties);
        Fia2500GridDetail.bind('valuechanged', 	'fn_comboValFia2500GridDetailEvent')
    }    
    
    //콤보, 인풋박스 이벤트
    function fn_comboValFia2500GridDetailEvent() {
        let nRow = Fia2500GridDetail.getRow(); // 클릭한 Row Index 추출
        let nCol = Fia2500GridDetail.getCol(); // 클릭한 Col Index 추출

        let rowData = Fia2500GridDetail.getRowData(nRow);
       	console.log('rowData:', rowData);
        
       	//수량, 단가 변경시 금액 계산
        if (Fia2500GridDetail.getRefOfCol(nCol) == 'ASSET_QTY' || Fia2500GridDetail.getRefOfCol(nCol) == 'ASSET_PRICE') {	
        	
        	var dAmount = Number(rowData['ASSET_QTY']) * Number(rowData['ASSET_PRICE']);
        	dAmount		= gfnma_getRound(dAmount, Number(p_ss_currUnit));
            Fia2500GridDetail.setCellData(nRow, 6, dAmount, true, true);
            var dSum	= fn_setFia2500GridTotal('O');       
            SBUxMethod.set("FM_ORIGINAL_AMOUNT", dSum);
        } else if(Fia2500GridDetail.getRefOfCol(nCol) == 'ORIGINAL_AMOUNT'){
        	
        	var rate	= SBUxMethod.get("FM_EXCHANGE_RATE"); 
        	var dAmount = Number(rowData['ORIGINAL_AMOUNT']) * Number(rate);
        	dAmount		= gfnma_getRound(dAmount, Number(p_ss_currUnit));
            var dSum	= fn_setFia2500GridTotal('F');       
            SBUxMethod.set("FM_FUNCTIONAL_AMOUNT", dSum);
        }    	
    }    
    
    /**
     * 목록 가져오기
     */
    const fn_setFia2500GridDetail = async function(wtype, obj) {
    	
    	Fia2500GridDetail.clearStatus();

		let p_sch_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_sch_site_code				= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_sch_actual_flag_p			= gfnma_nvl(SBUxMethod.get("SCH_ACTUAL_FLAG_P"));
		let p_sch_sacquire_type			= gfnma_nvl(SBUxMethod.get("SCH_SACQUIRE_TYPE"));
		let p_sch_dept_code				= gfnma_nvl(SBUxMethod.get("SCH_DEPT_CODE"));
		let p_sch_emp_code				= gfnma_nvl(SBUxMethod.get("SCH_EMP_CODE"));
		let p_sch_cs_code				= gfnma_nvl(SBUxMethod.get("SCH_CS_CODE"));
		let p_fm_asset_acquire_no		= gfnma_nvl(obj['ASSET_ACQUIRE_NO']);
		
		let p_sch_acquire_date_fr		= gfnma_nvl(SBUxMethod.get("SCH_ACQUIRE_DATE_FR"));
		let p_sch_acquire_date_to		= gfnma_nvl(SBUxMethod.get("SCH_ACQUIRE_DATE_TO"));
		let p_sch_acct_rule_code		= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		
		if(!p_sch_acquire_date_fr){
 			gfn_comAlert("E0000","취득일(시작일)을 입력하세요");
			return;      		 
		}
		if(!p_sch_acquire_date_to){
 			gfn_comAlert("E0000","취득일(종료일)을 입력하세요");
			return;      		 
		}
		if(!p_sch_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_sch_fi_org_code
			,V_P_SITE_CODE          : p_sch_site_code
			,V_P_ACCT_RULE_CODE     : p_sch_acct_rule_code 
			,V_P_ACTUAL_FLAG     	: p_sch_actual_flag_p 
			,V_P_ACQUIRE_DATE_FR   	: p_sch_acquire_date_fr 
			,V_P_ACQUIRE_DATE_TO   	: p_sch_acquire_date_to 
			,V_P_ACQUIRE_TYPE   	: p_sch_sacquire_type 
			,V_P_DEPT_CODE   		: p_sch_dept_code 
			,V_P_EMP_CODE   		: p_sch_emp_code 
			,V_P_CS_CODE   			: p_sch_cs_code 
			,V_P_ASSET_ACQUIRE_NO	: p_fm_asset_acquire_no 
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectFia2500List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '2',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	    		jsonFia2500Detail.length = 0;
  	        	data.cv_2.forEach((item, index) => {
  					const msg = {
  						ACQUIRE_SEQ				: gfnma_nvl(item.ACQUIRE_SEQ),			
  						ASSET_NAME				: gfnma_nvl(item.ASSET_NAME),			
  						ASSET_PRICE				: gfnma_nvl(item.ASSET_PRICE),			
  						ASSET_QTY				: gfnma_nvl(item.ASSET_QTY),			
  						ASSET_SPEC				: gfnma_nvl(item.ASSET_SPEC),			
  						FUNCTIONAL_AMOUNT		: gfnma_nvl(item.FUNCTIONAL_AMOUNT),			
  						MEMO					: gfnma_nvl(item.MEMO),			
  						ORIGINAL_AMOUNT			: gfnma_nvl(item.ORIGINAL_AMOUNT),			
  						UNIT_CODE				: gfnma_nvl(item.UNIT_CODE),			
  						STATE_TYPE				: 'U',			
  					}
  					jsonFia2500Detail.push(msg);
  					totalRecordCount ++;
  				});
  	        	Fia2500GridDetail.rebuild();
  	        	fn_setFia2500GridTotal();
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
     * 합계 
     */
    function fn_setFia2500GridTotal(type) {
    	
    	var list 	= Fia2500GridDetail.getOrgGridDataAll();
    	var t1		= 0;
    	var t2		= 0;
    	var t3		= 0;
    	for (var i = 0; i < list.length; i++) {
			t1 += Number(list[i]['ASSET_QTY']);
			t2 += Number(list[i]['ORIGINAL_AMOUNT']);
			t3 += Number(list[i]['FUNCTIONAL_AMOUNT']);
		}
    	SBUxMethod.set('TOT_ASSET_QTY', 		t1);
    	SBUxMethod.set('TOT_ORIGINAL_AMOUNT', 	t2);
    	SBUxMethod.set('TOT_FUNCTIONAL_AMOUNT', t3);
    	
    	if(type=='O'){
	    	return t2;
    	} else {
	    	return t3;
    	}
    }
    
    /**
     * 취득처 
     */
    function fn_compopup1() {
    	
        var searchCode 		= gfnma_nvl(SBUxMethod.get('SCH_CS_CODE'));
        var searchName 		= gfnma_nvl(SBUxMethod.get('SCH_CS_NAME'));
        
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COM009'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["코드", 		"명칭"]
  			,searchInputFields		: ["CS_CODE", 	"CS_NAME"]
  			,searchInputValues		: [searchCode, 	searchName]
    		,width					: '700px'
    		,height					: '400px'
  			,tableHeader			: ["거래처코드",	"거래처명",	"사업자번호",	"대표자",		"업태",			"종목",			"주소",		"전화",		"팩스"]
  			,tableColumnNames		: ["CS_CODE", 	 	"CS_NAME",	"BIZ_REGNO",	"CHIEF_NAME",	"BIZ_CATEGORY",	"BIZ_ITEMS",	"ADDRESS",	"TEL",		"FAX"]
  			,tableColumnWidths		: ["100px", 		 "250px",	"100px",		"100px",		"150px",		"200px",		"250px",	"150px",	"150px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('SCH_CS_CODE',	data.CS_CODE);
				SBUxMethod.set('SCH_CS_NAME', 	data.CS_NAME);
			},
    	});
    }       
    
    /**
     * 담당부서 
     */
    function fn_compopup2() {
    	
        var searchText1		= gfnma_nvl(SBUxMethod.get("SCH_DEPT_NAME"));
        var searchText2		= gfnma_nvl(SBUxMethod.get("SCH_DEPT_CODE"));
        var param		 	= null;

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
       		,whereClause			: param
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: [searchText2, 	searchText1,	""]
            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
            ,width					: '700px'
            ,height					: '400px'
            ,tableHeader			: ["부서코드",		"부서명", 		"사업장"]
            ,tableColumnNames		: ["DEPT_CODE",		"DEPT_NAME",  	"SITE_NAME"]
            ,tableColumnWidths		: ["100px", 		"200px", 		"100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('SCH_DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('SCH_DEPT_CODE', data.DEPT_CODE);
            },
        });
    }   
    
    /**
     * 담당자 
     */
    function fn_compopup3(list) {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("SCH_EMP_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("SCH_EMP_NAME"));
        var replaceText0 	= "_EMP_CODE_";
        var replaceText1 	= "_EMP_NAME_";
        var replaceText2 	= "_EMP_STATE_";
        var strWhereClause 	= "AND X.EMP_CODE LIKE '%" + replaceText0 + "%' AND X.EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE LIKE '%" + replaceText2 + "%'";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_HRI001'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["부서명",		"사원명",		"사업장",		"부서명"]
   			,searchInputFields		: ["DEPT_NAME", 	"EMP_CODE",		"EMP_NAME",		"EMP_STATE"]
   			,searchInputValues		: ["",				searchText1, 	searchText2,	""]
			,searchInputTypes		: ["input", 		"input",		"input",		"select"]			//input, select가 있는 경우
   			,searchInputTypeValues	: ["", 				"",				"",				list]				//select 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["사번", 			"이름",		"부서",			"사업장"]
   			,tableColumnNames		: ["EMP_CODE", 		"EMP_NAME",	"DEPT_NAME",	"SITE_NAME"]
   			,tableColumnWidths		: ["150px", 		"150px",	"200px",		"200px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('SCH_EMP_CODE', 	data.EMP_CODE);
				SBUxMethod.set('SCH_EMP_NAME', 	data.EMP_NAME);
			},
    	});
    }      
    
    /**
     * 취득처 2
     */
    function fn_compopup4() {
    	
        var searchCode 		= gfnma_nvl(SBUxMethod.get('FM_CS_CODE'));
        var searchName 		= gfnma_nvl(SBUxMethod.get("FM_CS_NAME"));
        
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COM009'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["코드", 		"명칭"]
  			,searchInputFields		: ["CS_CODE", 	"CS_NAME"]
  			,searchInputValues		: [searchCode, 	searchName]
    		,width					: '700px'
    		,height					: '400px'
  			,tableHeader			: ["거래처코드",	"거래처명",	"사업자번호",	"대표자",		"업태",			"종목",			"주소",		"전화",		"팩스"]
  			,tableColumnNames		: ["CS_CODE", 	 	"CS_NAME",	"BIZ_REGNO",	"CHIEF_NAME",	"BIZ_CATEGORY",	"BIZ_ITEMS",	"ADDRESS",	"TEL",		"FAX"]
  			,tableColumnWidths		: ["100px", 		 "250px",	"100px",		"100px",		"150px",		"200px",		"250px",	"150px",	"150px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('FM_CS_CODE',	data.CS_CODE);
				SBUxMethod.set('FM_CS_NAME', 	data.CS_NAME);
			},
    	});
    }   
    
    /**
     * 부가세유형
     */
    function fn_compopup5() {
    	
        var searchName 		= gfnma_nvl(SBUxMethod.get("FM_VAT_TYPE_NAME"));
        
        var replaceText0 	= "_VAT_NAME_";
        var strWhereClause 	= "AND A.VAT_NAME LIKE '%" + replaceText0 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부가세유형');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_VAT_INFO'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["코드명"]
  			,searchInputFields		: ["VAT_NAME"]
  			,searchInputValues		: [searchName]
    		,width					: '780px'
    		,height					: '400px'
  			,tableHeader			: ["코드명",		"유형코드",			"유형명",			"세율",			"상한",				"하한"]
  			,tableColumnNames		: ["VAT_NAME", 	 	"VAT_TYPE_CODE",	"VAT_TYPE_NAME",	"VAT_RATE",		"LIMIT_PLUS_RATE",	"LIMIT_MINUS_RATE"]
  			,tableColumnWidths		: ["250px", 		 "80px",			"200px",			"50px",			"50px",				"50px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('FM_VAT_TYPE',		data.VAT_CODE);
				SBUxMethod.set('FM_VAT_TYPE_NAME', 	data.VAT_NAME);
				
				var cal = (!data.VAT_RATE) ? 0 : data.VAT_RATE;
				SBUxMethod.set('FM_VAT_RATE',		cal);
			},
    	});
    }   
    
    /**
     * 담당부서 
     */
    function fn_compopup6(type) {
    	
        var searchText1		= '';
        var searchText2		= '';
        if(type=='1'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_DEPT_NAME"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_DEPT_CODE"));
        } else if(type=='2'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM2_DEPT_NAME1_A"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM2_DEPT_CODE1_A"));
        }
        
        var param		 	= null;

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FI_DEPT'
            ,popupType				: 'B'
       		,whereClause			: param
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: [searchText2, 	searchText1,	""]
            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
            ,width					: '500px'
            ,height					: '400px'
            ,tableHeader			: ["부서코드",		"부서명" 		]
            ,tableColumnNames		: ["DEPT_CODE",		"DEPT_NAME"  	]
            ,tableColumnWidths		: ["100px", 		"200px" 		]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                if(type=='1'){
	                SBUxMethod.set('FM_DEPT_NAME', data.DEPT_NAME);
	                SBUxMethod.set('FM_DEPT_CODE', data.DEPT_CODE);
                } else if(type=='2'){
	                SBUxMethod.set('FM2_DEPT_NAME1_A', data.DEPT_NAME);
	                SBUxMethod.set('FM2_DEPT_CODE1_A', data.DEPT_CODE);
                }
            },
        });
    }       
        
    /**
     * 자산번호
     */
    function fn_compopup7() {
    	
        var searchCode 		= gfnma_nvl(SBUxMethod.get('FM_ASSET_NO'));
        var searchName 		= gfnma_nvl(SBUxMethod.get("FM_ASSET_NAME"));
        
        var replaceText0 	= "_ASSET_NO_";
        var replaceText1 	= "_ASSET_NAME_";
        var strWhereClause 	= "AND ASSET_NO LIKE '%" + replaceText0 + "%' AND ASSET_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산목록');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ASSET_LIST'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["자산번호", 	"자산명"]
  			,searchInputFields		: ["ASSET_NO", 	"ASSET_NAME"]
  			,searchInputValues		: [searchCode, 	searchName]
    		,width					: '800px'
    		,height					: '400px'
  			,tableHeader			: ["자산번호", 	"자산명",		"사업장",		"자산구분",			"구분명",				"중분류명",				"소분류명",				"부서코드",		"부서명",		"원가코드",			"원가중심점",		"프로젝트코드",	"프로젝트명"]
  			,tableColumnNames		: ["ASSET_NO", 	"ASSET_NAME",	"SITE_CODE",	"ASSET_CATEGORY",	"ASSET_CATEGORY_NAME",	"ASSET_LEVEL2_NAME",	"ASSET_LEVEL3_NAME",	"DEPT_CODE",	"DEPT_NAME",	"COST_CENTER_CODE",	"COST_CENTER_NAME",	"PROJECT_CODE",	"PROJECT_NAME"]
  			,tableColumnWidths		: ["80px", 	 	"250px",		"100px",		"80px",				"80px",					"100px",				"100px",				"100px",		"200px",		"100px",			"150px",			"100px",		"250px",]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('FM_ASSET_NO',	data.ASSET_NO);
				SBUxMethod.set('FM_ASSET_NAME',	data.ASSET_NAME);
			},
    	});
    }       
    
    /**
     * 담당자 
     */
    function fn_compopup8(list) {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM_EMP_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM_EMP_NAME"));
        var replaceText0 	= "_EMP_CODE_";
        var replaceText1 	= "_EMP_NAME_";
        var replaceText2 	= "_EMP_STATE_";
        var strWhereClause 	= "AND X.EMP_CODE LIKE '%" + replaceText0 + "%' AND X.EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE LIKE '%" + replaceText2 + "%'";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_HRI001'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["부서명",		"사원명",		"사업장",		"부서명"]
   			,searchInputFields		: ["DEPT_NAME", 	"EMP_CODE",		"EMP_NAME",		"EMP_STATE"]
   			,searchInputValues		: ["",				searchText1, 	searchText2,	""]
			,searchInputTypes		: ["input", 		"input",		"input",		"select"]			//input, select가 있는 경우
   			,searchInputTypeValues	: ["", 				"",				"",				list]				//select 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["사번", 			"이름",		"부서",			"사업장"]
   			,tableColumnNames		: ["EMP_CODE", 		"EMP_NAME",	"DEPT_NAME",	"SITE_NAME"]
   			,tableColumnWidths		: ["150px", 		"150px",	"200px",		"200px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('FM_EMP_CODE', 	data.EMP_CODE);
				SBUxMethod.set('FM_EMP_NAME', 	data.EMP_NAME);
			},
    	});
    }     
    
    /**
     * 원가중심점코드
     */
    var fn_compopup9 = function(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_NAME"));
        } else if(type=='2'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM2_COST_CENTER_CODE1_A"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM2_COST_CENTER_NAME1_A"));
        }
        
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_"; 
        var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
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
				console.log('callback data:', data);
		        if(type=='1'){
					SBUxMethod.set('FM_COST_CENTER_CODE', 	data.COST_CENTER_CODE);
					SBUxMethod.set('FM_COST_CENTER_NAME', 	data.COST_CENTER_NAME);
		        } else if(type=='2'){
					SBUxMethod.set('FM2_COST_CENTER_CODE1_A', 	data.COST_CENTER_CODE);
					SBUxMethod.set('FM2_COST_CENTER_NAME1_A', 	data.COST_CENTER_NAME);
		        }
			},
    	});
    }         
    
    /**
     * 프로젝트코드
     */
    var fn_compopup10 = function(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_PROJECT_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_PROJECT_NAME"));
        } else if(type=='2'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM2_PROJECT_CODE_A"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM2_PROJECT_NAME_A"));
        }
        
        var replaceText0 	= "_PROJECT_CODE_";
        var replaceText1 	= "_PROJECT_NAME_"; 
        var strWhereClause 	= "AND A.PROJECT_CODE LIKE '%" + replaceText0 + "%' AND A.PROJECT_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산프로젝트');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_PROJECT_CIP'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["PROJECT_CODE", 		"PROJECT_NAME"]
   			,searchInputValues		: [searchText1, 		searchText2]
			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["코드", 				"명칭",				"년도",			"부서",			"호기",			"부서"]
   			,tableColumnNames		: ["PROJECT_CODE", 		"PROJECT_NAME",		"CODE_SEG01",	"CODE_SEG02",	"CODE_SEG03",	"CODE_SEG04"]	
   			,tableColumnWidths		: ["80px", 				"300px",			"100px",		"100px",		"100px",		"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
		        if(type=='1'){
					SBUxMethod.set('FM_PROJECT_CODE', 	data.PROJECT_CODE);
					SBUxMethod.set('FM_PROJECT_NAME', 	data.PROJECT_NAME);
		        } else if(type=='2'){
					SBUxMethod.set('FM2_PROJECT_CODE_A', 	data.PROJECT_CODE);
					SBUxMethod.set('FM2_PROJECT_NAME_A', 	data.PROJECT_NAME);
		        }
			},
    	});
    }     
    
    /**
     * 자산계정, 감가상각비계정, 감가상각누계계정, 보조금상각누계액
     */
    var fn_compopup11 = function(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_ACCOUNT_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_ACCOUNT_NAME"));
        } else if(type=='2'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM2_DEPR_EXP_ACC_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM2_DEPR_EXP_ACC_NAME"));
        } else if(type=='3'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM2_ACCUM_DEPR_ACC_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM2_ACCUM_DEPR_ACC_NAME"));
        } else if(type=='4'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM2_SUBSIDIES_ACC_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM2_SUBSIDIES_ACC_NAME"));
        } else if(type=='5'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM2_SUBSIDIES_DEPR_ACC_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM2_SUBSIDIES_DEPR_ACC_NAME"));
        } else if(type=='6'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM2_SUBSIDIES_ACCUM_DEPR_ACC_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM2_SUBSIDIES_ACCUM_DEPR_ACC_NAME"));
        }
        
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_"; 
        var strWhereClause 	= "AND A.ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND A.ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산프로젝트');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
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
				console.log('callback data:', data);
		        if(type=='1'){
					SBUxMethod.set('FM_ACCOUNT_CODE', 			data.ACCOUNT_CODE);
					SBUxMethod.set('FM_ACCOUNT_NAME', 			data.ACCOUNT_NAME);
		        } else if(type=='2'){
					SBUxMethod.set('FM2_DEPR_EXP_ACC_CODE', 		data.ACCOUNT_CODE);
					SBUxMethod.set('FM2_DEPR_EXP_ACC_NAME', 		data.ACCOUNT_NAME);
		        } else if(type=='3'){
					SBUxMethod.set('FM2_ACCUM_DEPR_ACC_CODE', 	data.ACCOUNT_CODE);
					SBUxMethod.set('FM2_ACCUM_DEPR_ACC_NAME', 	data.ACCOUNT_NAME);
		        } else if(type=='4'){
					SBUxMethod.set('FM2_SUBSIDIES_ACC_CODE', 	data.ACCOUNT_CODE);
					SBUxMethod.set('FM2_SUBSIDIES_ACC_NAME', 	data.ACCOUNT_NAME);
		        } else if(type=='5'){
					SBUxMethod.set('FM2_SUBSIDIES_DEPR_ACC_CODE', 	data.ACCOUNT_CODE);
					SBUxMethod.set('FM2_SUBSIDIES_DEPR_ACC_NAME', 	data.ACCOUNT_NAME);
		        } else if(type=='6'){
					SBUxMethod.set('FM2_SUBSIDIES_ACCUM_DEPR_ACC_CODE', 	data.ACCOUNT_CODE);
					SBUxMethod.set('FM2_SUBSIDIES_ACCUM_DEPR_ACC_NAME', 	data.ACCOUNT_NAME);
		        }
			},
    	});
    }        
    
    /**
     * 자산구분
     */
    var fn_compopup12 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM2_ASSET_CATEGORY_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM2_ASSET_CATEGORY_NAME"));
        
        var replaceText0 	= "_ASSET_CATEGORY_";
        var replaceText1 	= "_ASSET_CATEGORY_NAME_"; 
        var strWhereClause 	= "AND A.ASSET_CATEGORY LIKE '%" + replaceText0 + "%' AND A.ASSET_CATEGORY_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산구분');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ASSET_CATEGORY'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["ASSET_CATEGORY", 	"ASSET_CATEGORY_NAME"]
   			,searchInputValues		: [searchText1, 		searchText2]
			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["분류코드", 			"분류명"]
   			,tableColumnNames		: ["ASSET_CATEGORY", 	"ASSET_CATEGORY_NAME"]	
   			,tableColumnWidths		: ["100px", 			"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('FM2_ASSET_CATEGORY_CODE', 	data.ASSET_CATEGORY);
				SBUxMethod.set('FM2_ASSET_CATEGORY_NAME', 	data.ASSET_CATEGORY_NAME);
			},
    	});
    }     
    
    /**
     * 자산계정
     */
    var fn_compopup13 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM2_ASSET_ACC_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM2_ASSET_ACC_NAME"));
        
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_"; 
        var strWhereClause 	= "AND A.ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND A.ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산프로젝트');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
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
				console.log('callback data:', data);
				SBUxMethod.set('FM2_ASSET_ACC_CODE', 	data.ACCOUNT_CODE);
				SBUxMethod.set('FM2_ASSET_ACC_NAME', 	data.ACCOUNT_NAME);
			},
    	});
    }         
    
    /**
     * 중분류
     */
    var fn_compopup14 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM2_ASSET_LEVEL2_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM2_ASSET_LEVEL2_NAME"));
        
        var replaceText0 	= "_ASSET_LEVEL2_";
        var replaceText1 	= "_ASSET_LEVEL2_NAME_"; 
        var strWhereClause 	= "AND AA.ASSET_LEVEL2 LIKE '%" + replaceText0 + "%' AND AA.ASSET_LEVEL2_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산중분류');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ASSET_LEVEL2'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["ASSET_LEVEL2", 		"ASSET_LEVEL2_NAME"]
   			,searchInputValues		: [searchText1, 		searchText2]
			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["중분류", 			"중분류명",				"자산구분",			"자산구분명",			"comp_code"]
   			,tableColumnNames		: ["ASSET_LEVEL2", 		"ASSET_LEVEL2_NAME",	"ASSET_CATEGORY",	"ASSET_CATEGORY_NAME",	"COMP_CODE"]	
   			,tableColumnWidths		: ["100px", 			"200px",				"100px",			"100px",				"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('FM2_ASSET_LEVEL2_CODE', 	data.ASSET_LEVEL2);
				SBUxMethod.set('FM2_ASSET_LEVEL2_NAME', 	data.ASSET_LEVEL2_NAME);
			},
    	});
    }         
    
    /**
     * 최초취득처
     */
    var fn_compopup15 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM2_CS_CODE1_A"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM2_CS_NAME1_A"));
        
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_"; 
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COM009'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["거래처코드", 		"거래처명"]
   			,searchInputFields		: ["CS_CODE", 			"CS_NAME"]
   			,searchInputValues		: [searchText1, 		searchText2]
			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["거래처코드", 		"거래처명",		"사업자번호",	"대표자",		"업태",			"종목",			"주소",		"전화",		"팩스"]
   			,tableColumnNames		: ["CS_CODE", 			"CS_NAME",		"BIZ_REGNO",	"CHIEF_NAME",	"BIZ_CATEGORY"	,"BIZ_ITEMS",	"ADDRESS",	"TEL",		"FAX"]	
   			,tableColumnWidths		: ["100px", 			"200px",		"150px",		"100px",		"120px",		"150px",		"350px",	"120px",	"120px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('FM2_CS_CODE1_A', 	data.CS_CODE);
				SBUxMethod.set('FM2_CS_NAME1_A', 	data.CS_NAME);
			},
    	});
    }         
    
    /**
     * 소분류 
     */
    function fn_compopup16() {
    	
    	//type C 형 팝업
    	var p_find1	= p_ss_languageID;
    	var p_find2	= gv_ma_selectedCorpCd;
    	var p_find3	= gfnma_nvl(SBUxMethod.get("FM2_ASSET_LEVEL2_CODE"));
   		var p_find4	= gfnma_nvl(SBUxMethod.get("FM2_ASSET_LEVEL3_CODE"));
		var p_find5	= gfnma_nvl(SBUxMethod.get("FM2_ASSET_LEVEL3_NAME"));
		var p_find6	= "";
		var p_find7	= "";

        SBUxMethod.attr('modal-compopup1', 'header-title', '자산 소분류');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ASSET_LEVEL3_ALL'
            ,popupType				: 'C'
       		,whereClause			: ''
            ,searchCaptions			: ["소분류", 		"소분류명"]
            ,searchInputFields		: ["ASSET_LEVEL3", 	"ASSET_LEVEL3_NAME"]
            ,searchInputValues		: [p_find4, 		p_find5]
            ,searchInputTypes		: ["input", 		"input"]		
        
			,cTypeParamFields		: ["",			"",			"",			"ASSET_LEVEL3",		"ASSET_LEVEL3_NAME",	"",		""]
			,cTypeParamValues		: [p_find1,		p_find2,	p_find3,	p_find4,			p_find5,				p_find6, p_find7]
        
            ,width					: '600px'
            ,height					: '400px'
            ,tableHeader			: ["소분류코드",	"소분류명",				"중분류코드",	"중분류명",			"자산구분",			"자산구분명",			"상각여부",		"자산계정",		"자산계정명",			"감가상계정",	"감가상각계정",			"감가상각누계계정",	"감가상각누계계정명",	"보조금계정",		"보조금계정명",			"보조금상각계정",		"보조금상각계정명",			"보조금상각누계계정",		"보조금상각누계계정명",				"상각주기(회계기준)",		"상각주기(IFRS)",			"상각주기(법인세)",			"상각방법(회계기준)",		"상각방법(IFRS)",			"상각방법(법인세)",			"잔존율(회계기준)",		"잔존율(IFRS)",			"잔존율(법인세)",	"잔존가치(회계기준)",	"잔존가치(IFRS)",		"잔존가치(법인세)",		"내용연수(회계기준)",	"내용연수(IFRS)",	"내용연수(법인세)"]
            ,tableColumnNames		: ["ASSET_LEVEL3",	"ASSET_LEVEL3_NAME",	"ASSET_LEVEL2",	"ASSET_LEVEL2_NAME","ASSET_CATEGORY",	"ASSET_CATEGORY_NAME",	"DEPRECIATE_YN","ASSET_ACCOUNT","ASSET_ACCOUNT_NAME",	"DEPR_EXP_ACC",	"DEPR_EXP_ACC_NAME",	"ACCUM_DEPR_ACC",	"ACCUM_DEPR_ACC_NAME",	"UBSIDIES_ACCOUNT",	"SUBSIDIES_ACC_NAME",	"SUBSIDIES_DEPR_ACC",	"SUBSIDIES_DEPR_ACC_NAME",	"SUBSIDIES_ACCUM_DEPR_ACC",	"SUBSIDIES_ACCUM_DEPR_ACC_NAME",	"DEPRECIATION_PERIOD_GAAP",	"DEPRECIATION_PERIOD_IFRS",	"DEPRECIATION_PERIOD_TAX",	"DEPRECIATION_METHOD_GAAP",	"DEPRECIATION_METHOD_IFRS",	"DEPRECIATION_METHOD_TAX",	"SALVAGE_RATE_GAAP",	"SALVAGE_RATE_IFRS",	"SALVAGE_RATE_TAX",	"SALVAGE_VALUE_GAAP",	"SALVAGE_VALUE_IFRS",	"SALVAGE_VALUE_TAX",	"USEFUL_LIFE_GAAP",		"USEFUL_LIFE_IFRS",	"USEFUL_LIFE_TAX"]
            ,tableColumnWidths		: ["100px", 		"200px",				"100px",		"100px",			"100px",			"100px",				"100px",		"150px",		"200px",				"100px",		"150px",				"150px",			"200px",				"100px",			"150px",				"150px",				"250px",					"150px",					"250px",							"150px",					"150px",					"150px",					"150px",					"150px",					"150px",					"150px",				"120px",				"120px",			"150px",				"150px",				"150px",				"150px",				"150px",			"150px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('FM2_ASSET_LEVEL3_NAME', data.ASSET_LEVEL3_NAME);
                SBUxMethod.set('FM2_ASSET_LEVEL3_CODE', data.ASSET_LEVEL3);
            },
        });
		SBUxMethod.openModal('modal-compopup1');
    }       
          
    /**
     * 위치코드
     */
    var fn_compopup17 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM2_LOCATION_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM2_LOCATION_NAME"));
        
        var replaceText0 	= "_LOCATION_CODE_";
        var replaceText1 	= "_LOCATION_NAME_"; 
        var strWhereClause 	= "AND LOCATION_CODE LIKE '%" + replaceText0 + "%' AND LOCATION_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산위치');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FA_LOCATION'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["LOCATION_CODE", 	"LOCATION_NAME"]
   			,searchInputValues		: [searchText1, 		searchText2]
			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["위치코드", 			"위치명",			"비고",			"법인"]
   			,tableColumnNames		: ["LOCATION_CODE", 	"LOCATION_NAME",	"DESCIPTION",	"COMP_CODE"]	
   			,tableColumnWidths		: ["100px", 			"200px",			"100px",		"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('FM2_LOCATION_CODE', 	data.LOCATION_CODE);
				SBUxMethod.set('FM2_LOCATION_NAME', 	data.LOCATION_NAME);
			},
    	});
    }       
    
    /**
     * 신규
     */
    function cfn_add() {
		
        SBUxMethod.set("FM_SITE_CODE",		SBUxMethod.get("SCH_SITE_CODE"));
        SBUxMethod.set("FM_CURRENCY_CODE",	p_ss_baseCurrCode);
        SBUxMethod.set("FM_ACQUIRE_DATE",	gfnma_date4());
		
		$('#main-btn-save', parent.document).attr('disabled', false);
		$('#main-btn-del', 	parent.document).attr('disabled', true);
    }
	
    /**
     * 행추가
     */
    var fn_gridRowAdd = function() {
        var idx = Fia2500GridDetail.getRows();
		console.log(idx);        
		Fia2500GridDetail.insertRow((idx-1), 'below');
    }
    
    /**
     * 행삭제
     */
    var fn_gridRowDel = function() {
    	Fia2500GridDetail.deleteRow(Fia2500GridDetail.getRow());
    	fn_setFia2500GridTotal();    	
    }
    
    /**
     * 저장
     */
    var cfn_save = function() {
    	
    	if(!fn_validation()){
    		return;
    	}
    	if(jsonFia2500Detail.length < 1){
    		gfn_comAlert("E0000","자산 취득 상세내역이 없습니다. 상세내역을 등록하시기 바랍니다.");
    		return;
    	}
    	
        var strStatus 				= "";
		var p_fm_asset_acquire_no 	= SBUxMethod.get("FM_ASSET_ACQUIRE_NO");
        if (!p_fm_asset_acquire_no){
            strStatus = "N";
        } else {
            strStatus = "U";    	
        }
        
        fn_subInsert1(strStatus);
    }
    
    /**
     * 저장1
     */
    const fn_subInsert1 = async function (wtype){

		let p_sch_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_fm_tax_site_code		= gfnma_nvl(SBUxMethod.get("FM_TAX_SITE_CODE"));
		let p_sch_actual_flag_p		= gfnma_nvl(SBUxMethod.get("SCH_ACTUAL_FLAG_P"));
		let p_fm_asset_acquire_no	= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACQUIRE_NO"));
		let p_fm_asset_no			= gfnma_nvl(SBUxMethod.get("FM_ASSET_NO"));
		let p_fm_acquire_date		= gfnma_nvl(SBUxMethod.get("FM_ACQUIRE_DATE"));
		let p_fm_acquire_type		= gfnma_nvl(SBUxMethod.get("FM_ACQUIRE_TYPE"));
		let p_fm_cs_code			= gfnma_nvl(SBUxMethod.get("FM_CS_CODE"));
		let p_fm_asset_category		= gfnma_nvl(SBUxMethod.get("FM_ASSET_CATEGORY"));
		let p_fm_asset_level2		= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL2"));
		let p_fm_asset_level3		= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL3"));
		let p_fm_dept_code			= gfnma_nvl(SBUxMethod.get("FM_DEPT_CODE"));
		let p_fm_emp_code			= gfnma_nvl(SBUxMethod.get("FM_EMP_CODE"));
		let p_fm_cost_center_code	= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_CODE"));
		let p_fm_project_code		= gfnma_nvl(SBUxMethod.get("FM_PROJECT_CODE"));
		let p_fm_account_code		= gfnma_nvl(SBUxMethod.get("FM_ACCOUNT_CODE"));
		let p_fm_vat_type			= gfnma_nvl(SBUxMethod.get("FM_VAT_TYPE"));
		let p_fm_vat_rate			= gfnma_nvl(SBUxMethod.get("FM_VAT_RATE"));
		let p_fm_currency_code		= gfnma_nvl(SBUxMethod.get("FM_CURRENCY_CODE"));
		let p_fm_exchange_rate		= gfnma_nvl(SBUxMethod.get("FM_EXCHANGE_RATE"));
		let p_fm_original_amount	= gfnma_nvl(SBUxMethod.get("FM_ORIGINAL_AMOUNT"));
		let p_fm_vat_amount			= gfnma_nvl(SBUxMethod.get("FM_VAT_AMOUNT"));
		let p_fm_functional_amount	= gfnma_nvl(SBUxMethod.get("FM_FUNCTIONAL_AMOUNT"));
		let p_fm_memo				= gfnma_nvl(SBUxMethod.get("FM_MEMO"));
		let p_fm_invoice_id			= gfnma_nvl(SBUxMethod.get("FM_INVOICE_ID"));
		let p_fm_invoice_seq		= gfnma_nvl(SBUxMethod.get("FM_INVOICE_SEQ"));
		let p_fm_source_type		= gfnma_nvl(SBUxMethod.get("FM_SOURCE_TYPE"));
		let p_fm_acquisition_qty	= gfnma_nvl(SBUxMethod.get("FM_ACQUISITION_QTY"));

 	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_ACCT_RULE_CODE		: p_sch_fi_org_code    
			,V_P_SITE_CODE         	: p_fm_tax_site_code
			,V_P_ACTUAL_FLAG       	: p_sch_actual_flag_p
			,IV_P_ASSET_ACQUIRE_NO 	: p_fm_asset_acquire_no
			,V_P_ASSET_NO          	: p_fm_asset_no
			,V_P_ACQUIRE_DATE      	: p_fm_acquire_date
			,V_P_ACQUIRE_TYPE      	: p_fm_acquire_type
			,V_P_CS_CODE           	: p_fm_cs_code
			,V_P_ASSET_CATEGORY    	: p_fm_asset_category
			,V_P_ASSET_LEVEL2      	: p_fm_asset_level2
			,V_P_ASSET_LEVEL3      	: p_fm_asset_level3
			,V_P_DEPT_CODE         	: p_fm_dept_code
			,V_P_EMP_CODE          	: p_fm_emp_code
			,V_P_COST_CENTER_CODE  	: p_fm_cost_center_code
			,V_P_PROJECT_CODE      	: p_fm_project_code
			,V_P_ACCOUNT_CODE      	: p_fm_account_code
			,V_P_TAX_SITE_CODE     	: p_fm_tax_site_code
			,V_P_VAT_TYPE          	: p_fm_vat_type
			,V_P_VAT_RATE          	: p_fm_vat_rate
			,V_P_CURRENCY_CODE     	: p_fm_currency_code
			,V_P_EXCHANGE_RATE     	: p_fm_exchange_rate
			,V_P_ORIGINAL_AMOUNT   	: p_fm_original_amount
			,V_P_VAT_AMOUNT        	: p_fm_vat_amount
			,V_P_FUNCTIONAL_AMOUNT 	: p_fm_functional_amount
			,V_P_MEMO              	: p_fm_memo
			,V_P_INVOICE_ID        	: p_fm_invoice_id
			,V_P_INVOICE_SEQ       	: p_fm_invoice_seq
			,V_P_SOURCE_TYPE       	: p_fm_source_type
			,V_P_ACQUISITION_QTY   	: p_fm_acquisition_qty
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/ffa/alm/modifyFia2500S.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(wtype=='N'){
	    			SBUxMethod.set('FM_ASSET_ACQUIRE_NO',	data.v_returnStr);
        		}
        		fn_ProcessFia2500S1();
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
     * detail 저장
     */
     const fn_ProcessFia2500S1 = async function(){
    	
		let p_fm_tax_site_code			= gfnma_nvl(SBUxMethod.get("FM_TAX_SITE_CODE"));
		let p_fm_asset_acquire_no		= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACQUIRE_NO"));
    	
    	 var chkList = Fia2500GridDetail.getOrgGridDataAll();
    	 console.log('---->> grid all');
    	 console.log(chkList);
    	 
    	 //서버 전송 리스트
    	 let listData 	= [];
    	 let workt		= ""; 
    	 let state_type	= "";
    	 for (var i = 0; i < chkList.length; i++) {
 			var obj = chkList[i].data;
 			state_type = (obj['STATE_TYPE']) ? 'N' : 'U'; 
    	 	const param = {
    	 			cv_count	: '0',
    	 			getType		: 'json',
    	 			rownum		: chkList[i].rownum,
    	 			workType	: state_type,
    	 			params		: gfnma_objectToString({
    	 				V_P_DEBUG_MODE_YN			: ''
    	 				,V_P_LANG_ID				: ''
    	 				,V_P_COMP_CODE				: gfnma_nvl(gv_ma_selectedCorpCd)
    	 				,V_P_CLIENT_CODE			: gfnma_nvl(gv_ma_selectedClntCd)
    	 				
    	 				,V_P_SITE_CODE				: gfnma_nvl(p_fm_tax_site_code)
    	 				,V_P_ASSET_ACQUIRE_NO		: gfnma_nvl(p_fm_asset_acquire_no)
    	 				,V_P_ACQUIRE_SEQ   			: gfnma_nvl(obj.ACQUIRE_SEQ)
    	 				,V_P_ASSET_NAME				: gfnma_nvl(obj.ASSET_NAME)
    	 				,V_P_ASSET_SPEC				: gfnma_nvl(obj.ASSET_SPEC)
    	 				,V_P_ASSET_QTY				: gfnma_nvl(obj.ASSET_QTY)
    	 				,V_P_UNIT_CODE				: gfnma_nvl(obj.UNIT_CODE)
    	 				,V_P_ASSET_PRICE			: gfnma_nvl(obj.ASSET_PRICE)
    	 				,V_P_ORIGINAL_AMOUNT		: gfnma_nvl(obj.ORIGINAL_AMOUNT)
    	 				,V_P_FUNCTIONAL_AMOUNT		: gfnma_nvl(obj.FUNCTIONAL_AMOUNT)
    	 				
    	 				,V_P_FORM_ID				: gfnma_nvl(p_formId)
    	 				,V_P_MENU_ID				: gfnma_nvl(p_menuId)
    	 				,V_P_PROC_ID				: ''
    	 				,V_P_USERID					: ''
    	 				,V_P_PC						: ''
    	 			})
    	 		}			
    	 	listData.push(param);
    	 }	

    	 if(listData.length > 0) {
    	 	const postJsonPromise = gfn_postJSON("/fi/fgl/alm/saveFia2500S1.do", {listData: listData});

    	 	const data = await postJsonPromise;
    	 	console.log('data:', data);
    	 	try {
    	 		if (_.isEqual("S", data.resultStatus)) {
    	 			gfn_comAlert("I0001");
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
    }
    
     /**
      * 삭제
      */
     function cfn_del() {
    	 
  		let p_fm_asset_acquire_no		= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACQUIRE_NO"));
    	if(!p_fm_asset_acquire_no){
    		gfn_comAlert("E0000","삭제할 항목이 선택되지 않았습니다.");
    		return;
    	}
 		if(confirm("선택하신 정보를 삭제하시겠습니까?")){
 		}else{
 			return;
 		}		
    	 
 		fn_ProcessFia2500S('D');
     }
     
     const fn_ProcessFia2500S = async function(wtype){
     	
   		let p_fm_asset_acquire_no	= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACQUIRE_NO"));
		let p_sch_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_fm_tax_site_code		= gfnma_nvl(SBUxMethod.get("FM_TAX_SITE_CODE"));
		let p_sch_actual_flag_p		= gfnma_nvl(SBUxMethod.get("SCH_ACTUAL_FLAG_P"));
		let p_fm_asset_no			= gfnma_nvl(SBUxMethod.get("FM_ASSET_NO"));
		let p_fm_acquire_date		= gfnma_nvl(SBUxMethod.get("FM_ACQUIRE_DATE"));
		let p_fm_acquire_type		= gfnma_nvl(SBUxMethod.get("FM_ACQUIRE_TYPE"));
		let p_fm_cs_code			= gfnma_nvl(SBUxMethod.get("FM_CS_CODE"));
		let p_fm_asset_category		= gfnma_nvl(SBUxMethod.get("FM_ASSET_CATEGORY"));
		let p_fm_asset_level2		= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL2"));
		let p_fm_asset_level3		= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL3"));
		let p_fm_dept_code			= gfnma_nvl(SBUxMethod.get("FM_DEPT_CODE"));
		let p_fm_emp_code			= gfnma_nvl(SBUxMethod.get("FM_EMP_CODE"));
		let p_fm_cost_center_code	= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_CODE"));
		let p_fm_project_code		= gfnma_nvl(SBUxMethod.get("FM_PROJECT_CODE"));
		let p_fm_account_code		= gfnma_nvl(SBUxMethod.get("FM_ACCOUNT_CODE"));
		let p_fm_vat_type			= gfnma_nvl(SBUxMethod.get("FM_VAT_TYPE"));
		let p_fm_vat_rate			= gfnma_nvl(SBUxMethod.get("FM_VAT_RATE"));
		let p_fm_currency_code		= gfnma_nvl(SBUxMethod.get("FM_CURRENCY_CODE"));
		let p_fm_exchange_rate		= gfnma_nvl(SBUxMethod.get("FM_EXCHANGE_RATE"));
		let p_fm_original_amount	= gfnma_nvl(SBUxMethod.get("FM_ORIGINAL_AMOUNT"));
		let p_fm_vat_amount			= gfnma_nvl(SBUxMethod.get("FM_VAT_AMOUNT"));
		let p_fm_functional_amount	= gfnma_nvl(SBUxMethod.get("FM_FUNCTIONAL_AMOUNT"));
		let p_fm_memo				= gfnma_nvl(SBUxMethod.get("FM_MEMO"));
		let p_fm_invoice_id			= gfnma_nvl(SBUxMethod.get("FM_INVOICE_ID"));
		let p_fm_invoice_seq		= gfnma_nvl(SBUxMethod.get("FM_INVOICE_SEQ"));
		let p_fm_source_type		= gfnma_nvl(SBUxMethod.get("FM_SOURCE_TYPE"));
		let p_fm_acquisition_qty	= gfnma_nvl(SBUxMethod.get("FM_ACQUISITION_QTY"));

 	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_ACCT_RULE_CODE		: p_sch_fi_org_code    
			,V_P_SITE_CODE         	: p_fm_tax_site_code
			,V_P_ACTUAL_FLAG       	: p_sch_actual_flag_p
			,IV_P_ASSET_ACQUIRE_NO 	: p_fm_asset_acquire_no
			,V_P_ASSET_NO          	: p_fm_asset_no
			,V_P_ACQUIRE_DATE      	: p_fm_acquire_date
			,V_P_ACQUIRE_TYPE      	: p_fm_acquire_type
			,V_P_CS_CODE           	: p_fm_cs_code
			,V_P_ASSET_CATEGORY    	: p_fm_asset_category
			,V_P_ASSET_LEVEL2      	: p_fm_asset_level2
			,V_P_ASSET_LEVEL3      	: p_fm_asset_level3
			,V_P_DEPT_CODE         	: p_fm_dept_code
			,V_P_EMP_CODE          	: p_fm_emp_code
			,V_P_COST_CENTER_CODE  	: p_fm_cost_center_code
			,V_P_PROJECT_CODE      	: p_fm_project_code
			,V_P_ACCOUNT_CODE      	: p_fm_account_code
			,V_P_TAX_SITE_CODE     	: p_fm_tax_site_code
			,V_P_VAT_TYPE          	: p_fm_vat_type
			,V_P_VAT_RATE          	: p_fm_vat_rate
			,V_P_CURRENCY_CODE     	: p_fm_currency_code
			,V_P_EXCHANGE_RATE     	: p_fm_exchange_rate
			,V_P_ORIGINAL_AMOUNT   	: p_fm_original_amount
			,V_P_VAT_AMOUNT        	: p_fm_vat_amount
			,V_P_FUNCTIONAL_AMOUNT 	: p_fm_functional_amount
			,V_P_MEMO              	: p_fm_memo
			,V_P_INVOICE_ID        	: p_fm_invoice_id
			,V_P_INVOICE_SEQ       	: p_fm_invoice_seq
			,V_P_SOURCE_TYPE       	: p_fm_source_type
			,V_P_ACQUISITION_QTY   	: p_fm_acquisition_qty
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };			

         const postJsonPromise = gfn_postJSON("/fi/fgl/alm/modifyFia2500S.do", {
         	getType				: 'json',
         	workType			: wtype,
         	cv_count			: '0',
         	params				: gfnma_objectToString(paramObj)
 		});    	 
         const data = await postJsonPromise;

         try {
         	if (_.isEqual("S", data.resultStatus)) {
 	 			gfn_comAlert("I0001");
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
     * 부가세 변경 event
     */
	function fn_changeVatAmount(val) {
    	 console.log('val:', val);
    	 var cal = Number(gfnma_nvl(SBUxMethod.get('FM_FUNCTIONAL_AMOUNT'))) + Number(gfnma_nvl(SBUxMethod.get('FM_VAT_AMOUNT')));
    	 SBUxMethod.set('FM_TOTAL_AMOUNT', cal);
    }
    
    /**
     * 환산금액 변경 event
     */
	function fn_changeFunctionalAmount(val) {
    	console.log('val:', val);
    	 
     	var dAmount = Number(gfnma_nvl(SBUxMethod.get('FM_VAT_RATE'))) * Number(gfnma_nvl(SBUxMethod.get('FM_FUNCTIONAL_AMOUNT'))) / 100;
    	dAmount		= gfnma_getRound(dAmount, Number(p_ss_currUnit));
   	 	SBUxMethod.set('FM_VAT_AMOUNT', dAmount);
    	
    	var cal = Number(gfnma_nvl(SBUxMethod.get('FM_FUNCTIONAL_AMOUNT'))) + Number(gfnma_nvl(SBUxMethod.get('FM_VAT_AMOUNT')));
    	SBUxMethod.set('FM_TOTAL_AMOUNT', cal);
    }
    
    /**
     * 통화 변경 event
     */
	function fn_changeCurrencyCode(val) {
    	console.log('val:', val);
    	if(val==p_ss_currCode){
			SBUxMethod.set('FM_EXCHANGE_RATE', 	'1');
    	}
    	SBUxMethod.set('FM_TAX_SITE_CODE', 	p_ss_taxSiteCode);    	
    }
    
    /**
     * 환율 변경 event
     */
	function fn_CngExchangeRate(val) {
    	console.log('val:', val);
    	var dSum = 0;
    	var list = Fia2500GridDetail.getOrgGridDataAll();
    	for (var i = 0; i < list.length; i++) {
    		var dAmount = Number(list[i]['ORIGINAL_AMOUNT']) * val;
        	dAmount		= gfnma_getRound(dAmount, Number(p_ss_currUnit));
            Fia2500GridDetail.setCellData(i+1, 7, dAmount, true, true);
            dSum += Number(dAmount);
		}
    	SBUxMethod.set('FM_FUNCTIONAL_AMOUNT', 	dSum);    	
    }
    
    /**
     * 감가상각방법 변경 event
     */
	function fn_changeDepMethodGaap(val) {
    	console.log('val:', val);
    	if(val=='AMOUNT'){
    		SBUxMethod.hide('FM2_SALVAGE_RATE_GAAP');
    		$('#LV2_SALVAGE_RATE_GAAP').hide();
    	} else {
    		SBUxMethod.show('FM2_SALVAGE_RATE_GAAP');
    		$('#LV2_SALVAGE_RATE_GAAP').show();
    	}
    }
    
    /**
     * 감가상각방법 변경 event
     */
	function fn_changeDepMethodTax(val) {
    	console.log('val:', val);
    	if(val=='AMOUNT'){
    		SBUxMethod.hide('FM2_SALVAGE_RATE_TAX');
    		$('#LV2_SALVAGE_RATE_TAX').hide();
    	} else {
    		SBUxMethod.show('FM2_SALVAGE_RATE_TAX');
    		$('#LV2_SALVAGE_RATE_TAX').show();
    	}
    }
    
    /**
     * 감가상각방법 변경 event
     */
	function n_changeDepMethodIfrs(val) {
    	console.log('val:', val);
    	if(val=='AMOUNT'){
    		SBUxMethod.hide('FM2_SALVAGE_RATE_IFRS');
    		$('#LV2_SALVAGE_RATE_IFRS').hide();
    	} else {
    		SBUxMethod.show('FM2_SALVAGE_RATE_IFRS');
    		$('#LV2_SALVAGE_RATE_IFRS').show();
    	}
    }
    
    /**
     * 상각여부 변경 event
     */
	function fn_cngDepreciateYn(val) {
    	console.log('val:', val['FM2_DEPRECIATE_YN']);
    	
    	if(val['FM2_DEPRECIATE_YN']=='Y'){
    		
    		SBUxMethod.attr('FM2_DEPR_EXP_ACC_CODE',	'disabled', false);
			$('#BTN_POP16').attr('disabled', false);
    		SBUxMethod.attr('FM2_DEPR_EXP_ACC_NAME',	'disabled', false);
    		
    		SBUxMethod.attr('FM2_ACCUM_DEPR_ACC_CODE',	'disabled', false);
			$('#BTN_POP19').attr('disabled', false);
    		SBUxMethod.attr('FM2_ACCUM_DEPR_ACC_NAME',	'disabled', false);
    		
    		SBUxMethod.attr('FM2_SUBSIDIES_DEPR_ACC_CODE',	'disabled', false);
			$('#BTN_POP23').attr('disabled', false);
    		SBUxMethod.attr('FM2_SUBSIDIES_DEPR_ACC_NAME',	'disabled', false);
    		
    		SBUxMethod.attr('FM2_SUBSIDIES_ACCUM_DEPR_ACC_CODE',	'disabled', false);
			$('#BTN_POP25').attr('disabled', false);
    		SBUxMethod.attr('FM2_SUBSIDIES_ACCUM_DEPR_ACC_NAME',	'disabled', false);
    		
    		SBUxMethod.attr('FM2_DEPRECIATION_METHOD_GAAP',	'disabled', false);
    		SBUxMethod.attr('FM2_DEPRECIATION_PERIOD_GAAP',	'disabled', false);
    		SBUxMethod.attr('FM2_USEFUL_LIFE_GAAP',			'disabled', false);
    		SBUxMethod.attr('FM2_SALVAGE_VALUE_GAAP',		'disabled', false);
    		SBUxMethod.attr('FM2_SALVAGE_RATE_GAAP',		'disabled', false);
    		
    		SBUxMethod.attr('FM2_DEPRECIATION_METHOD_TAX',	'disabled', false);
    		SBUxMethod.attr('FM2_DEPRECIATION_PERIOD_TAX',	'disabled', false);
    		SBUxMethod.attr('FM2_USEFUL_LIFE_TAX',			'disabled', false);
    		SBUxMethod.attr('FM2_SALVAGE_VALUE_TAX',		'disabled', false);
    		SBUxMethod.attr('FM2_SALVAGE_RATE_TAX',			'disabled', false);

    		SBUxMethod.attr('FM2_DEPRECIATION_METHOD_IFRS',	'disabled', false);
    		SBUxMethod.attr('FM2_DEPRECIATION_PERIOD_IFRS',	'disabled', false);
    		SBUxMethod.attr('FM2_USEFUL_LIFE_IFRS',			'disabled', false);
    		SBUxMethod.attr('FM2_SALVAGE_VALUE_IFRS',		'disabled', false);
    		SBUxMethod.attr('FM2_SALVAGE_RATE_IFRS',		'disabled', false);
    		
    	} else {

    		SBUxMethod.attr('FM2_DEPR_EXP_ACC_CODE',	'disabled', true);
			$('#BTN_POP16').attr('disabled', true);
    		SBUxMethod.attr('FM2_DEPR_EXP_ACC_NAME',	'disabled', true);
    		
    		SBUxMethod.attr('FM2_ACCUM_DEPR_ACC_CODE',	'disabled', true);
			$('#BTN_POP19').attr('disabled', true);
    		SBUxMethod.attr('FM2_ACCUM_DEPR_ACC_NAME',	'disabled', true);
    		
    		SBUxMethod.attr('FM2_SUBSIDIES_DEPR_ACC_CODE',	'disabled', true);
			$('#BTN_POP23').attr('disabled', true);
    		SBUxMethod.attr('FM2_SUBSIDIES_DEPR_ACC_NAME',	'disabled', true);
    		
    		SBUxMethod.attr('FM2_SUBSIDIES_ACCUM_DEPR_ACC_CODE',	'disabled', true);
			$('#BTN_POP25').attr('disabled', true);
    		SBUxMethod.attr('FM2_SUBSIDIES_ACCUM_DEPR_ACC_NAME',	'disabled', true);
    		
    		SBUxMethod.attr('FM2_DEPRECIATION_METHOD_GAAP',	'disabled', true);
    		SBUxMethod.attr('FM2_DEPRECIATION_PERIOD_GAAP',	'disabled', true);
    		SBUxMethod.attr('FM2_USEFUL_LIFE_GAAP',			'disabled', true);
    		SBUxMethod.attr('FM2_SALVAGE_VALUE_GAAP',		'disabled', true);
    		SBUxMethod.attr('FM2_SALVAGE_RATE_GAAP',		'disabled', true);
    		
    		SBUxMethod.attr('FM2_DEPRECIATION_METHOD_TAX',	'disabled', true);
    		SBUxMethod.attr('FM2_DEPRECIATION_PERIOD_TAX',	'disabled', true);
    		SBUxMethod.attr('FM2_USEFUL_LIFE_TAX',			'disabled', true);
    		SBUxMethod.attr('FM2_SALVAGE_VALUE_TAX',		'disabled', true);
    		SBUxMethod.attr('FM2_SALVAGE_RATE_TAX',			'disabled', true);

    		SBUxMethod.attr('FM2_DEPRECIATION_METHOD_IFRS',	'disabled', true);
    		SBUxMethod.attr('FM2_DEPRECIATION_PERIOD_IFRS',	'disabled', true);
    		SBUxMethod.attr('FM2_USEFUL_LIFE_IFRS',			'disabled', true);
    		SBUxMethod.attr('FM2_SALVAGE_VALUE_IFRS',		'disabled', true);
    		SBUxMethod.attr('FM2_SALVAGE_RATE_IFRS',		'disabled', true);    		
    	}
    }
     
    /**
     * 자산지정취소
     */
	function fn_btnCancel() {
    	
		if(gfn_comConfirm("Q0001", "취득내역을 삭제하시겠습니까?")){
			fn_CancelProcess('CANCEL');
		}
    }  
    
	const fn_CancelProcess = async function(wtype){
     	
 		let p_fm_asset_acquire_no		= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACQUIRE_NO"));
    	if(!p_fm_asset_acquire_no){
    		gfn_comAlert("E0000","취소할 항목이 선택되지 않았습니다.");
    		return;
    	}
 		
		let p_sch_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_fm_tax_site_code		= gfnma_nvl(SBUxMethod.get("FM_TAX_SITE_CODE"));
		let p_sch_actual_flag_p		= gfnma_nvl(SBUxMethod.get("SCH_ACTUAL_FLAG_P"));
		let p_fm_asset_no			= gfnma_nvl(SBUxMethod.get("FM_ASSET_NO"));
		let p_fm_acquire_date		= gfnma_nvl(SBUxMethod.get("FM_ACQUIRE_DATE"));
		let p_fm_acquire_type		= gfnma_nvl(SBUxMethod.get("FM_ACQUIRE_TYPE"));
		let p_fm_cs_code			= gfnma_nvl(SBUxMethod.get("FM_CS_CODE"));
		let p_fm_asset_category		= gfnma_nvl(SBUxMethod.get("FM_ASSET_CATEGORY"));
		let p_fm_asset_level2		= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL2"));
		let p_fm_asset_level3		= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL3"));
		let p_fm_dept_code			= gfnma_nvl(SBUxMethod.get("FM_DEPT_CODE"));
		let p_fm_emp_code			= gfnma_nvl(SBUxMethod.get("FM_EMP_CODE"));
		let p_fm_cost_center_code	= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_CODE"));
		let p_fm_project_code		= gfnma_nvl(SBUxMethod.get("FM_PROJECT_CODE"));
		let p_fm_account_code		= gfnma_nvl(SBUxMethod.get("FM_ACCOUNT_CODE"));
		let p_fm_vat_type			= gfnma_nvl(SBUxMethod.get("FM_VAT_TYPE"));
		let p_fm_vat_rate			= gfnma_nvl(SBUxMethod.get("FM_VAT_RATE"));
		let p_fm_currency_code		= gfnma_nvl(SBUxMethod.get("FM_CURRENCY_CODE"));
		let p_fm_exchange_rate		= gfnma_nvl(SBUxMethod.get("FM_EXCHANGE_RATE"));
		let p_fm_original_amount	= gfnma_nvl(SBUxMethod.get("FM_ORIGINAL_AMOUNT"));
		let p_fm_vat_amount			= gfnma_nvl(SBUxMethod.get("FM_VAT_AMOUNT"));
		let p_fm_functional_amount	= gfnma_nvl(SBUxMethod.get("FM_FUNCTIONAL_AMOUNT"));
		let p_fm_memo				= gfnma_nvl(SBUxMethod.get("FM_MEMO"));
		let p_fm_invoice_id			= gfnma_nvl(SBUxMethod.get("FM_INVOICE_ID"));
		let p_fm_invoice_seq		= gfnma_nvl(SBUxMethod.get("FM_INVOICE_SEQ"));
		let p_fm_source_type		= gfnma_nvl(SBUxMethod.get("FM_SOURCE_TYPE"));
		let p_fm_acquisition_qty	= gfnma_nvl(SBUxMethod.get("FM_ACQUISITION_QTY"));

 	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_ACCT_RULE_CODE		: p_sch_fi_org_code    
			,V_P_SITE_CODE         	: p_fm_tax_site_code
			,V_P_ACTUAL_FLAG       	: p_sch_actual_flag_p
			,IV_P_ASSET_ACQUIRE_NO 	: p_fm_asset_acquire_no
			,V_P_ASSET_NO          	: p_fm_asset_no
			,V_P_ACQUIRE_DATE      	: p_fm_acquire_date
			,V_P_ACQUIRE_TYPE      	: p_fm_acquire_type
			,V_P_CS_CODE           	: p_fm_cs_code
			,V_P_ASSET_CATEGORY    	: p_fm_asset_category
			,V_P_ASSET_LEVEL2      	: p_fm_asset_level2
			,V_P_ASSET_LEVEL3      	: p_fm_asset_level3
			,V_P_DEPT_CODE         	: p_fm_dept_code
			,V_P_EMP_CODE          	: p_fm_emp_code
			,V_P_COST_CENTER_CODE  	: p_fm_cost_center_code
			,V_P_PROJECT_CODE      	: p_fm_project_code
			,V_P_ACCOUNT_CODE      	: p_fm_account_code
			,V_P_TAX_SITE_CODE     	: p_fm_tax_site_code
			,V_P_VAT_TYPE          	: p_fm_vat_type
			,V_P_VAT_RATE          	: p_fm_vat_rate
			,V_P_CURRENCY_CODE     	: p_fm_currency_code
			,V_P_EXCHANGE_RATE     	: p_fm_exchange_rate
			,V_P_ORIGINAL_AMOUNT   	: p_fm_original_amount
			,V_P_VAT_AMOUNT        	: p_fm_vat_amount
			,V_P_FUNCTIONAL_AMOUNT 	: p_fm_functional_amount
			,V_P_MEMO              	: p_fm_memo
			,V_P_INVOICE_ID        	: p_fm_invoice_id
			,V_P_INVOICE_SEQ       	: p_fm_invoice_seq
			,V_P_SOURCE_TYPE       	: p_fm_source_type
			,V_P_ACQUISITION_QTY   	: p_fm_acquisition_qty
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };			

         const postJsonPromise = gfn_postJSON("/fi/fgl/alm/modifyFia2500S.do", {
         	getType				: 'json',
         	workType			: wtype,
         	cv_count			: '0',
         	params				: gfnma_objectToString(paramObj)
 		});    	 
         const data = await postJsonPromise;

         try {
         	if (_.isEqual("S", data.resultStatus)) {
 	 			gfn_comAlert("I0001");
         	} else {
           		alert(data.resultMessage);
         	}
  			cfn_search();
         } catch (e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
         	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
         }	    	
	}        
    
    /**
     * 취득내역 가져오기 - 사용안함
     */
	function fn_btnInterface() {
    	
    	let p_sch_acquire_date_fr	= gfnma_nvl(SBUxMethod.get("SCH_ACQUIRE_DATE_FR"));
    	let p_sch_acquire_date_to	= gfnma_nvl(SBUxMethod.get("SCH_ACQUIRE_DATE_TO"));
    	let p_sch_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
    	let p_sch_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
    	let p_sch_actual_flag_p		= gfnma_nvl(SBUxMethod.get("SCH_ACTUAL_FLAG_P"));
    	
    	SBUxMethod.attr('modal-compopfia2510', 'header-title', '취득내역');
		SBUxMethod.openModal('modal-compopfia2510');
		
		compopfia2510({
    		height			: '400px'
    		,param			: {
    			p_sch_acquire_date_fr	: p_sch_acquire_date_fr
    			,p_sch_acquire_date_to	: p_sch_acquire_date_to
    			,p_sch_fi_org_code		: p_sch_fi_org_code
    			,p_sch_acct_rule_code	: p_sch_acct_rule_code
    			,p_sch_actual_flag_p	: p_sch_actual_flag_p
    		}
   			,callbackEvent	: function (data){
   				console.log('callback data:', data);
   			},
    	});
    }  
    
    /**
     * 자산등록
     */
    const fn_btnAsset = async function() {
    	
    	if(!fn_validation()){
    		return;
    	}
    	let list = jsonFia2500Detail.getOrgGridDataAll();
    	if(list.length==0){
 			gfn_comAlert("E0000","자산 취득 상세내역이 없습니다. 상세내역을 등록하시기 바랍니다.");
			return;      		 
    	}
    	
        var strStatus = "";
		var p_fm_asset_acquire_no 	= SBUxMethod.get("FM_ASSET_ACQUIRE_NO");
        if (!p_fm_asset_acquire_no.Text){
            strStatus = "N";
        } else {
            strStatus = "U";    	
        }
    	
    	await fn_ProcessFia2500S(strStatus);
    	await fn_ProcessFia2500S1();
    	await fn_ProcessFia3100S('N');
    }  
	
     const fn_ProcessFia3100S = async function(wtype){
     	
		let p_sch_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_sch_actual_flag_p			= gfnma_nvl(SBUxMethod.get("SCH_ACTUAL_FLAG_P"));
		let p_fm2_asset_name_a			= gfnma_nvl(SBUxMethod.get("FM2_ASSET_NAME_A"));
		let p_fm2_asset_category_code	= gfnma_nvl(SBUxMethod.get("FM2_ASSET_CATEGORY_CODE"));
		let p_fm2_asset_level2_code		= gfnma_nvl(SBUxMethod.get("FM2_ASSET_LEVEL2_CODE"));
		let p_fm2_asset_level3_code		= gfnma_nvl(SBUxMethod.get("FM2_ASSET_LEVEL3_CODE"));
		let p_fm2_acquire_date_a		= gfnma_nvl(SBUxMethod.get("FM2_ACQUIRE_DATE_A"));
		let p_fm2_currency_code_a		= gfnma_nvl(SBUxMethod.get("FM2_CURRENCY_CODE_A"));
		let p_fm2_functional_amount_a	= gfnma_nvl(SBUxMethod.get("FM2_FUNCTIONAL_AMOUNT_A"));
		let p_fm2_site_code1_a			= gfnma_nvl(SBUxMethod.get("FM2_SITE_CODE1_A"));
		let p_fm2_cs_code1_a			= gfnma_nvl(SBUxMethod.get("FM2_CS_CODE1_A"));
		let p_fm2_dept_code1_a			= gfnma_nvl(SBUxMethod.get("FM2_DEPT_CODE1_A"));
		let p_fm2_cost_center_code1_a	= gfnma_nvl(SBUxMethod.get("FM2_COST_CENTER_CODE1_A"));
		let p_fm2_project_code_a		= gfnma_nvl(SBUxMethod.get("FM2_PROJECT_CODE_A"));
		let p_fm2_location_code			= gfnma_nvl(SBUxMethod.get("FM2_LOCATION_CODE"));
		let p_fm2_depreciate_yn			= gfnma_nvl(SBUxMethod.get("FM2_DEPRECIATE_YN")['FM2_DEPRECIATE_YN']);
		let p_fm2_asset_acc_code		= gfnma_nvl(SBUxMethod.get("FM2_ASSET_ACC_CODE"));
		let p_fm2_depr_exp_acc_code		= gfnma_nvl(SBUxMethod.get("FM2_DEPR_EXP_ACC_CODE"));
		let p_fm2_accum_depr_acc_code	= gfnma_nvl(SBUxMethod.get("FM2_ACCUM_DEPR_ACC_CODE"));
		
		let p_fm2_subsidies_acc_code			= gfnma_nvl(SBUxMethod.get("FM2_SUBSIDIES_ACC_CODE"));
		let p_fm2_subsidies_depr_acc_code		= gfnma_nvl(SBUxMethod.get("FM2_SUBSIDIES_DEPR_ACC_CODE"));
		let p_fm2_subsidies_accum_depr_acc_code	= gfnma_nvl(SBUxMethod.get("FM2_SUBSIDIES_ACCUM_DEPR_ACC_CODE"));
		
		let p_fm2_useful_life_gaap				= gfnma_nvl(SBUxMethod.get("FM2_USEFUL_LIFE_GAAP"));
		let p_fm2_useful_life_ifrs				= gfnma_nvl(SBUxMethod.get("FM2_USEFUL_LIFE_IFRS"));
		let p_fm2_useful_life_tax				= gfnma_nvl(SBUxMethod.get("FM2_USEFUL_LIFE_TAX"));
		
		let p_fm2_salvage_rate_gaap				= gfnma_nvl(SBUxMethod.get("FM2_SALVAGE_RATE_GAAP"));
		let p_fm2_salvage_rate_ifrs				= gfnma_nvl(SBUxMethod.get("FM2_SALVAGE_RATE_IFRS"));
		let p_fm2_salvage_rate_tax				= gfnma_nvl(SBUxMethod.get("FM2_SALVAGE_RATE_TAX"));
		
		let p_fm2_salvage_value_gaap			= gfnma_nvl(SBUxMethod.get("FM2_SALVAGE_VALUE_GAAP"));
		let p_fm2_salvage_value_ifrs			= gfnma_nvl(SBUxMethod.get("FM2_SALVAGE_VALUE_IFRS"));
		let p_fm2_salvage_value_tax				= gfnma_nvl(SBUxMethod.get("FM2_SALVAGE_VALUE_TAX"));
		
		let p_fm2_depreciation_method_gaap		= gfnma_nvl(SBUxMethod.get("FM2_DEPRECIATION_METHOD_GAAP"));
		let p_fm2_depreciation_method_ifrs		= gfnma_nvl(SBUxMethod.get("FM2_DEPRECIATION_METHOD_IFRS"));
		let p_fm2_depreciation_method_tax		= gfnma_nvl(SBUxMethod.get("FM2_DEPRECIATION_METHOD_TAX"));
		
		let p_fm2_depreciation_period_gaap		= gfnma_nvl(SBUxMethod.get("FM2_DEPRECIATION_PERIOD_GAAP"));
		let p_fm2_depreciation_period_ifrs		= gfnma_nvl(SBUxMethod.get("FM2_DEPRECIATION_PERIOD_IFRS"));
		let p_fm2_depreciation_period_tax		= gfnma_nvl(SBUxMethod.get("FM2_DEPRECIATION_PERIOD_TAX"));
		
		let p_fm_depreciate_start_yyyymm		= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATE_START_YYYYMM"));
		let p_fm_depreciate_start_yyyymm_ifrs	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATE_START_YYYYMM_IFRS"));
		
		let p_fm_memo							= gfnma_nvl(SBUxMethod.get("FM_MEMO"));
		
		
 	    var paramObj = { 
			V_P_DEBUG_MODE_YN				: ''
			,V_P_LANG_ID					: ''
			,V_P_COMP_CODE					: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE				: gv_ma_selectedClntCd
			
			,V_P_ACCT_RULE_CODE				: p_sch_fi_org_code    
			,V_P_ACTUAL_FLAG       			: ''
			,IV_P_ASSET_NO         			: p_sch_actual_flag_p
			,V_P_ASSET_NAME        			: p_fm2_asset_name_a
			,V_P_ASSET_CATEGORY    			: p_fm2_asset_category_code
			,V_P_ASSET_LEVEL2      			: p_fm2_asset_level2_code
			,V_P_ASSET_LEVEL3      			: p_fm2_asset_level3_code
			,V_P_ACQUIRE_DATE      			: p_fm2_acquire_date_a
			,V_P_CURRENCY_CODE     			: p_fm2_currency_code_a
			,V_P_FUNCTIONAL_AMOUNT 			: p_fm2_functional_amount_a
			,V_P_SITE_CODE         			: p_fm2_site_code1_a
			,V_P_CS_CODE           			: p_fm2_cs_code1_a
			,V_P_DEPT_CODE         			: p_fm2_dept_code1_a
			,V_P_COST_CENTER_CODE  			: p_fm2_cost_center_code1_a
			,V_P_PROJECT_CODE      			: p_fm2_project_code_a
			,V_P_LOCATION_CODE     			: p_fm2_location_code
			,V_P_DEPRECIATE_YN     			: p_fm2_depreciate_yn
			,V_P_ASSET_ACCOUNT     			: p_fm2_asset_acc_code
			,V_P_DEPR_EXP_ACC     			: p_fm2_depr_exp_acc_code
			,V_P_ACCUM_DEPR_ACC    			: p_fm2_accum_depr_acc_code
			,V_P_SUBSIDIES_ACCOUNT    		: p_fm2_subsidies_acc_code
			,V_P_SUBSIDIES_DEPR_ACC    		: p_fm2_subsidies_depr_acc_code
			,V_P_SUBSIDIES_ACCUM_DEPR_ACC   : p_fm2_subsidies_accum_depr_acc_code
			
			,V_P_USEFUL_LIFE_GAAP   		: p_fm2_useful_life_gaap
			,V_P_USEFUL_LIFE_IFRS   		: p_fm2_useful_life_ifrs
			,V_P_USEFUL_LIFE_TAX   			: p_fm2_useful_life_tax
			
			,V_P_SALVAGE_RATE_GAAP   		: p_fm2_salvage_rate_gaap
			,V_P_SALVAGE_RATE_IFRS   		: p_fm2_salvage_rate_ifrs
			,V_P_SALVAGE_RATE_TAX   		: p_fm2_salvage_rate_tax
			
			,V_P_SALVAGE_VALUE_GAAP   		: p_fm2_salvage_value_gaap
			,V_P_SALVAGE_VALUE_IFRS   		: p_fm2_salvage_value_ifrs
			,V_P_SALVAGE_VALUE_TAX   		: p_fm2_salvage_value_tax
			
			,V_P_DEPRECIATION_METHOD_GAAP	: p_fm2_depreciation_method_gaap
			,V_P_DEPRECIATION_METHOD_IFRS	: p_fm2_depreciation_method_ifrs
			,V_P_DEPRECIATION_METHOD_TAX	: p_fm2_depreciation_method_tax
			
			,V_P_DEPRECIATION_PERIOD_GAAP	: p_fm2_depreciation_period_gaap
			,V_P_DEPRECIATION_PERIOD_IFRS	: p_fm2_depreciation_period_ifrs
			,V_P_DEPRECIATION_PERIOD_TAX	: p_fm2_depreciation_period_tax
			
			,V_P_DEPRECIATE_START_YYYYMM	: p_fm_depreciate_start_yyyymm
			,V_P_DEPREC_START_YYYYMM_IFRS	: p_fm_depreciate_start_yyyymm_ifrs
			
			,V_P_QTY						: ''
			,V_P_MEMO						: p_fm_memo
			,V_P_ASSET_ACQUIRE_NO			: ''
			,V_P_EQUIPMENT_NO				: ''
			
			,V_P_FORM_ID					: p_formId
			,V_P_MENU_ID					: p_menuId
			,V_P_PROC_ID					: ''
			,V_P_USERID						: p_userId
			,V_P_PC							: '' 
	    };			

         const postJsonPromise = gfn_postJSON("/fi/ffa/alm/saveFia3100S.do", {
         	getType				: 'json',
         	workType			: wtype,
         	cv_count			: '0',
         	params				: gfnma_objectToString(paramObj)
 		});    	 
         const data = await postJsonPromise;

         try {
         	if (_.isEqual("S", data.resultStatus)) {
        		if(wtype=='N'){
	    			SBUxMethod.set('FM_ASSET_ACQUIRE_NO',	data.v_returnStr);
        		}
 	 			gfn_comAlert("I0001");
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
      * 일괄등록
      */
 	function fn_btnInterfaceBth() {
     	
     	let p_sch_acquire_date_fr	= gfnma_nvl(SBUxMethod.get("SCH_ACQUIRE_DATE_FR"));
     	let p_sch_acquire_date_to	= gfnma_nvl(SBUxMethod.get("SCH_ACQUIRE_DATE_TO"));
     	let p_sch_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
     	let p_sch_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
     	let p_sch_actual_flag_p		= gfnma_nvl(SBUxMethod.get("SCH_ACTUAL_FLAG_P"));
     	
     	SBUxMethod.attr('modal-compopfia2520', 'header-title', '취득내역');
 		SBUxMethod.openModal('modal-compopfia2520');
 		
 		compopfia2520({
     		height			: '400px'
     		,param			: {
     			p_sch_acquire_date_fr	: p_sch_acquire_date_fr
     			,p_sch_acquire_date_to	: p_sch_acquire_date_to
     			,p_sch_fi_org_code		: p_sch_fi_org_code
     			,p_sch_acct_rule_code	: p_sch_acct_rule_code
     			,p_sch_actual_flag_p	: p_sch_actual_flag_p
     		}
   			,callbackEvent	: function (data){
   				console.log('callback data:', data);
   			},
     	});
     }          
     
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>