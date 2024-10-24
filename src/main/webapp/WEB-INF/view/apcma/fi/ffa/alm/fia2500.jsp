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
                    </h3><!-- 취득등록 -->
                </div>
                <div style="margin-left: auto;">
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="취득자산 가져오기"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnInterface"></sbux-button>
                    <font style="margin-right:5px"></font>
                    <sbux-button uitype="normal" text="자산지정취소"  		class="btn btn-sm btn-outline-danger" onclick="fn_btnCancel"></sbux-button>
                    <font style="margin-right:5px"></font>
                    <sbux-button uitype="normal" text="자산등록"  			class="btn btn-sm btn-outline-danger" onclick="fn_btnAsset"></sbux-button>
                    <font style="margin-right:15px"></font>
                    <sbux-button uitype="normal" text="일괄등록"  			class="btn btn-sm btn-outline-danger" onclick="fn_btnInterfaceBth"></sbux-button>
                </div>
            </div>
            <div class="box-body">

                <!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
				<!--[APC] END -->
                <table id="srchArea1" class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>
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
                            <th scope="row" class="th_bg">사업단위</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        
                            <th scope="row" class="th_bg">사업장</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        
                            <th scope="row" class="th_bg">실적구분</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_ACTUAL_FLAG_P" uitype="single" jsondata-ref="jsonActualFlagP" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        </tr>
                        
                        <tr>
                            <th scope="row" class="th_bg">취득일</th>
                            <td colspan="3" class="td_input" >
	                            <div style="display:flex;float:left;vertical-align:middle;width:100%">
								    <sbux-datepicker
								            id="SCH_ACQUIRE_DATE_FR"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed">
								    </sbux-datepicker>
								    <font style="padding-left:5px;padding-right:5px" >-</font>                          
								    <sbux-datepicker
								            id="SCH_ACQUIRE_DATE_TO"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed">
								    </sbux-datepicker>                          
                            	</div>
                            </td>
                        
                            <th scope="row" class="th_bg">취득구분</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_SACQUIRE_TYPE" uitype="single" jsondata-ref="jsonSacquireType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        
                            <th scope="row" class="th_bg">취득처</th>
                            <td colspan="3" class="td_input" >
	                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
  									<sbux-input style="width:80px" id="SCH_CS_CODE" uitype="text" class="form-control input-sm"></sbux-input>
  									<font style="width:5px"></font>
									<sbux-button
										id="BTN_POP1" 
										class="btn btn-xs btn-outline-dark"
										text=".." uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1()"></sbux-button>
  									<font style="width:5px"></font>
  									<sbux-input style="width:100%" id="SCH_CS_NAME" uitype="text" class="form-control input-sm"></sbux-input>
	                           	</div>
                            </td>
                        </tr>
                        
                        <tr>
                            <th scope="row" class="th_bg">담당부서</th>
                            <td colspan="3" class="td_input" >
	                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
  									<sbux-input style="width:80px" id="SCH_DEPT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
  									<font style="width:5px"></font>
									<sbux-button
										id="BTN_POP2" 
										class="btn btn-xs btn-outline-dark"
										text=".." uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup2()"></sbux-button>
  									<font style="width:5px"></font>
  									<sbux-input style="width:100%" id="SCH_DEPT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
	                           	</div>
                            </td>
                        
                            <th scope="row" class="th_bg">담당자</th>
                            <td colspan="3" class="td_input" >
	                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
  									<sbux-input style="width:80px" id="SCH_EMP_CODE" uitype="text" class="form-control input-sm"></sbux-input>
  									<font style="width:5px"></font>
									<sbux-button
										id="BTN_POP3" 
										class="btn btn-xs btn-outline-dark"
										text=".." uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup3"></sbux-button>
  									<font style="width:5px"></font>
  									<sbux-input style="width:100%" id="SCH_EMP_NAME" uitype="text" class="form-control input-sm"></sbux-input>
	                           	</div>
                            </td>
                        
                            <th scope="row" class="th_bg">회계기준</th>
                            <td colspan="3" class="td_input" >
	                            <sbux-select id="SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
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
				  							<sbux-input  id="FM_ASSET_CATEGORY"  	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_ASSET_LEVEL2"  		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_ASSET_LEVEL3"  		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_LOCATION_CODE" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_LOCATION_NAME" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_INVOICE_ID" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_INVOICE_SEQ" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_DOC_NUM" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							
				  							<sbux-input  id="FM_ASSET_CATEGORY2"  	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_ASSET_LEVEL2_1"  	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				  							<sbux-input  id="FM_ASSET_LEVEL3_1" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
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
												            class="form-control input-sm input-sm-ast inpt_data_reqed">
												    </sbux-datepicker>
			                                        <sbux-input style="display:none" id="FM_VAT_RATE" class="form-control input-sm" uitype="text" ></sbux-input>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">통화</th>
			                                    <td colspan="2" class="td_input">
			                                        <sbux-input id="FM_CURRENCY_CODE" class="form-control input-sm" uitype="text" ></sbux-input>
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
					  									<sbux-input style="width:80px" id="FM_CS_CODE2" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															id="BTN_POP4" 
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup4()"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_CS_NAME2" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">취득구분</th>
			                                    <td colspan="2" class="td_input">
			                            			<sbux-select id="FM_TACQUIRE_TYPE" uitype="single" jsondata-ref="jsonSacquireType" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">환율</th>
			                                    <td colspan="2" class="td_input">
			                                        <sbux-input id="FM_EXCHANGE_RATE" class="form-control input-sm" uitype="text" ></sbux-input>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">부가세유형</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:40px" id="FM_VAT_TYPE_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															id="BTN_POP5" 
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
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
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup6('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_DEPT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">자산번호</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_ASSET_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															id="BTN_POP7" 
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
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
				  									<sbux-input style="width:100%" id="FM_VAT_AMOUNT" uitype="text" class="form-control input-sm"></sbux-input>
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
															text=".." uitype="modal"
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
				  									<sbux-input style="width:100%" id="FM_FUNCTIONAL_AMOUNT" uitype="text" class="form-control input-sm"></sbux-input>
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
															text=".." uitype="modal"
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
															text=".." uitype="modal"
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
															text=".." uitype="modal"
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
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">자산구분</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:100%" id="FM_ASSET_CATEGORY_NAME" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP12" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup12"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="display:none;" id="FM_ASSET_CATEGORY_CODE" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">자산명</th>
					                                    <td colspan="5" class="td_input">
						  									<sbux-input id="FM_ASSET_NAME_A" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">자산계정</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM_ASSET_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP13" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup13"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM_ASSET_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">중분류</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:100%" id="FM_ASSET_LEVEL2_NAME" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP14" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup14"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="display:none;" id="FM_ASSET_LEVEL2_CODE" uitype="text" class="form-control input-sm"></sbux-input>
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
															        class="form-control input-sm input-sm-ast inpt_data_reqed" >
															</sbux-datepicker>                            
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">최초취득처</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM_CS_CODE1_A" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP15" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup15"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM_CS_NAME1_A" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">감가상각비계정</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM_DEPR_EXP_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP16" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup11('2')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM_DEPR_EXP_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">소분류</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:100%" id="FM_ASSET_LEVEL3_NAME" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP17" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup16"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="display:none;" id="FM_ASSET_LEVEL3_CODE" uitype="text" class="form-control input-sm"></sbux-input>
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
															        class="form-control input-sm input-sm-ast inpt_data_reqed" >
															</sbux-datepicker>                            
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">담당부서</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM_DEPT_CODE1_A" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP18" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup6('2')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM_DEPT_NAME1_A" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">감가상각누계계정</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM_ACCUM_DEPR_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP19" 
																	style="width:21px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup11('3')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM_ACCUM_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">최초취득일</th>
					                                    <td colspan="2" class="td_input">
														    <sbux-datepicker
														            id="FM_ACQUIRE_DATE_A"
														            uitype="popup"
														            date-format="yyyy-mm-dd"
														            class="form-control input-sm input-sm-ast inpt_data_reqed">
														    </sbux-datepicker>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">통화</th>
					                                    <td colspan="2" class="td_input">
							                                <sbux-select id="FM_CURRENCY_CODE_A" uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">원가중심점</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM_COST_CENTER_CODE1_A" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP20" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup9('2')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM_COST_CENTER_NAME1_A" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">보조금계정</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM_SUBSIDIES_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP21" 
																	style="width:21px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup11('4')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM_SUBSIDIES_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">사업장</th>
					                                    <td colspan="2" class="td_input">
							                            	<sbux-select id="SCH_SITE_CODE1_A" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">취득금액</th>
					                                    <td colspan="2" class="td_input">
				  											<sbux-input style="width:100%" id="FM_FUNCTIONAL_AMOUNT_A" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">프로젝트</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM_PROJECT_CODE_A" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP22" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup10('2')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM_PROJECT_NAME_A" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">보조금상각비</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM_SUBSIDIES_DEPR_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP23" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup11('5')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM_SUBSIDIES_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">상각여부</th>
					                                    <td colspan="2" class="td_input">
							                            	<sbux-checkbox id="FM_DEPRECIATE_YN" uitype="normal" text="예" true-value="Y" false-value="N" onchange="fn_cngChkReportYn(SCH_CHKREPORT_YN)"></sbux-checkbox>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">자본적지출</th>
					                                    <td colspan="2" class="td_input">
				  											<sbux-input style="width:100%" id="FM_CAPITAL_EXPENDITURE" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">위치코드</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM_LOCATION_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP24" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup17()"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM_LOCATION_NAME" uitype="text" class="form-control input-sm"></sbux-input>
								                           	</div>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">보조금상각누계액</th>
					                                    <td colspan="2" class="td_input">
								                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
							  									<sbux-input style="width:80px" id="FM_SUBSIDIES_ACCUM_DEPR_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
							  									<font style="width:5px"></font>
																<sbux-button
																	id="BTN_POP25" 
																	style="width:20px"
																	class="btn btn-xs btn-outline-dark"
																	text=".." uitype="modal"
																	target-id="modal-compopup1"
																	onclick="fn_compopup11('6')"></sbux-button>
							  									<font style="width:5px"></font>
							  									<sbux-input style="width:100%" id="FM_SUBSIDIES_ACCUM_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
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
					                            			<sbux-select style="width:150px" id="FM_DEPRECIATION_METHOD_GAAP" uitype="single" jsondata-ref="jsonDepreMethodCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">감가상각방법</th>
					                                    <td colspan="2" class="td_input">
					                            			<sbux-select style="width:150px" id="FM_DEPRECIATION_METHOD_TAX" uitype="single" jsondata-ref="jsonDepreMethodCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">감가상각방법</th>
					                                    <td colspan="2" class="td_input">
					                            			<sbux-select style="width:150px" id="FM_DEPRECIATION_METHOD_IFRS" uitype="single" jsondata-ref="jsonDepreMethodCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">감가상각주기</th>
					                                    <td colspan="2" class="td_input">
					                            			<sbux-select style="width:150px" id="FM_DEPRECIATION_PERIOD_GAAP" uitype="single" jsondata-ref="jsonDeprePeriodCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">감가상각주기</th>
					                                    <td colspan="2" class="td_input">
					                            			<sbux-select style="width:150px" id="FM_DEPRECIATION_PERIOD_TAX" uitype="single" jsondata-ref="jsonDeprePeriodCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">감가상각주기</th>
					                                    <td colspan="2" class="td_input">
					                            			<sbux-select style="width:150px" id="FM_DEPRECIATION_PERIOD_IFRS" uitype="single" jsondata-ref="jsonDeprePeriodCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">내용년수</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM_USEFUL_LIFE_GAAP" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">내용년수</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM_USEFUL_LIFE_TAX" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">내용년수</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM_USEFUL_LIFE_IFRS" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">잔존가액</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM_SALVAGE_VALUE_GAAP" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">잔존가액</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM_SALVAGE_VALUE_TAX" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">잔존가액</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM_SALVAGE_VALUE_IFRS" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
													</tr>
							                    
					                                <tr>
					                                    <th scope="row" class="th_bg">잔존율</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM_SALVAGE_RATE_GAAP" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>
					                                
					                                    <th scope="row" class="th_bg">잔존율</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM_SALVAGE_RATE_TAX" uitype="text" class="form-control input-sm"></sbux-input>
					                                    </td>								
					                                
					                                    <th scope="row" class="th_bg">잔존율</th>
					                                    <td colspan="2" class="td_input">
						  									<sbux-input style="width:150px" id="FM_SALVAGE_RATE_IFRS" uitype="text" class="form-control input-sm"></sbux-input>
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
    var Fia2500GridMast; 			// 그리드를 담기위한 객체 선언
    var jsonFia2500Mast 	= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fia2500GridDetail; 			// 그리드를 담기위한 객체 선언
    var jsonFia2500Detail 	= []; 	// 그리드의 참조 데이터 주소 선언

	var jsonFiOrgCode		= [];	// 사업단위
	var jsonSiteCode		= [];	// 사업장
	var jsonActualFlagP		= [];	// 실적구분
	var jsonSacquireType	= [];	// 취득구분
	var jsonAcctRuleCode	= [];	// 회계기준
	var jsonTaxSiteCode		= [];	// 신고사업장
	var jsonCurrencyCode	= [];	// 통화
	var jsonDepreMethodCode	= [];	// 감가상각방법
	var jsonDeprePeriodCode	= [];	// 감가상각주기
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],								jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SCH_SITE_CODE','FM_SITE_CODE','SCH_SITE_CODE1_A'],	jsonSiteCode, 	'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 실적구분
            gfnma_setComSelect(['SCH_ACTUAL_FLAG_P'],							jsonActualFlagP,	'L_FIA020', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 취득구분
            gfnma_setComSelect(['SCH_SACQUIRE_TYPE','FM_TACQUIRE_TYPE'],		jsonSacquireType,	'L_FIA007', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE','FM_ACCT_RULE_CODE'],		jsonAcctRuleCode,	'L_FIM054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 신고사업장
            gfnma_setComSelect(['FM_TAX_SITE_CODE'],							jsonTaxSiteCode,	'L_ORG003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TAX_SITE_CODE', 'TAX_SITE_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['FM_CURRENCY_CODE_A'],							jsonCurrencyCode,	'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 감가상각방법
            gfnma_setComSelect(['FM_DEPRECIATION_METHOD_GAAP','FM_DEPRECIATION_METHOD_TAX','FM_DEPRECIATION_METHOD_IFRS'],	jsonDepreMethodCode,'L_FIA003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 감가상각주기
            gfnma_setComSelect(['FM_DEPRECIATION_PERIOD_GAAP','FM_DEPRECIATION_PERIOD_TAX','FM_DEPRECIATION_PERIOD_IFRS'],	jsonDeprePeriodCode,'L_FIA004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//재직상태
		gfnma_getComSelectList('L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME',
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
    	//fn_setFia2500GridMast('LIST');
    }
    
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
                    sum : [13,14,15]
                },
                grandtotalrow : {
                    titlecol 		: 10,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["취득일"],			ref: 'ACQUIRE_DATE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["취득구분"], 		ref: 'ACQUIRE_TYPE',  		  	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["취득번호"], 		ref: 'ASSET_ACQUIRE_NO',    	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["취득처"], 			ref: 'CS_NAME',    				type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["자산번호"],			ref: 'ASSET_NO',  			  	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["자산명"],			ref: 'ASSET_NAME',    			type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["회계기준"],			ref: 'ACCT_RULE_CODE',    		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부가세유형"],		ref: 'VAT_TYPE',    			type:'output',  	width:'150px',  	style:'text-align:left'},
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
        //Fia2500GridMast.bind('click', 			'fn_viewFia2500GridMastEvent');
    }
    
    function fn_createFia2500GridDetail() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid2';
	    SBGridProperties.id 				= 'Fia2500GridDetail';
	    SBGridProperties.jsonref 			= 'jsonFia2500Detail';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.columns = [
            {caption: ["연번"],			ref: 'ACQUIRE_SEQ', 			type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ["자산명"], 		ref: 'ASSET_NAME',  		  	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["규격"], 		ref: 'ASSET_SPEC',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["수량"], 		ref: 'ASSET_QTY',  				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["단위"],			ref: 'UNIT_CODE',  			  	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["단가"],			ref: 'ASSET_PRICE',    			type:'output',  	width:'170px',  	style:'text-align:left'},
            
            {caption: ["통화금액"],		ref: 'ORIGINAL_AMOUNT',    		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["전표금액"],		ref: 'FUNCTIONAL_AMOUNT',		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["비고"],			ref: 'MEMO',    				type:'output',  	width:'300px',  	style:'text-align:left'},
        ];

        Fia2500GridDetail = _SBGrid.create(SBGridProperties);
        //Fia2500GridDetail.bind('click', 			'fn_viewFia2500GridDetailEvent');
    }
    
    
    /**
     * 취득처 
     */
    function fn_compopup1() {
    	
        var searchCode 		= gfnma_nvl(SBUxMethod.get('SCH_CS_CODE'));
        var searchName 		= gfnma_nvl(SBUxMethod.get("SCH_CS_NAME"));
        
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
            compCode				: gv_ma_selectedApcCd
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
    		compCode				: gv_ma_selectedApcCd
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
    	
        var searchCode 		= gfnma_nvl(SBUxMethod.get('FM_CS_CODE2'));
        var searchName 		= gfnma_nvl(SBUxMethod.get("FM_CS_NAME2"));
        
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				SBUxMethod.set('FM_CS_CODE2',	data.CS_CODE);
				SBUxMethod.set('FM_CS_NAME2', 	data.CS_NAME);
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
    		compCode				: gv_ma_selectedApcCd
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
				SBUxMethod.set('FM_VAT_TYPE_CODE',	data.VAT_CODE);
				SBUxMethod.set('FM_VAT_TYPE_NAME', 	data.VAT_NAME);
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
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_DEPT_NAME1_A"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_DEPT_CODE1_A"));
        }
        
        var param		 	= null;

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
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
	                SBUxMethod.set('FM_DEPT_NAME1_A', data.DEPT_NAME);
	                SBUxMethod.set('FM_DEPT_CODE1_A', data.DEPT_CODE);
                }
            },
        });
    }       
        
    /**
     * 자산번호
     */
    function fn_compopup7() {
    	
        var searchCode 		= gfnma_nvl(SBUxMethod.get('FM_ASSET_CODE'));
        var searchName 		= gfnma_nvl(SBUxMethod.get("FM_ASSET_NAME"));
        
        var replaceText0 	= "_ASSET_NO_";
        var replaceText1 	= "_ASSET_NAME_";
        var strWhereClause 	= "AND ASSET_NO LIKE '%" + replaceText0 + "%' AND ASSET_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산목록');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				SBUxMethod.set('FM_ASSET_CODE',	data.ASSET_NO);
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
    		compCode				: gv_ma_selectedApcCd
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
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_CODE1_A"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_NAME1_A"));
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
				console.log('callback data:', data);
		        if(type=='1'){
					SBUxMethod.set('FM_COST_CENTER_CODE', 	data.COST_CENTER_CODE);
					SBUxMethod.set('FM_COST_CENTER_NAME', 	data.COST_CENTER_NAME);
		        } else if(type=='2'){
					SBUxMethod.set('FM_COST_CENTER_CODE1_A', 	data.COST_CENTER_CODE);
					SBUxMethod.set('FM_COST_CENTER_NAME1_A', 	data.COST_CENTER_NAME);
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
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_PROJECT_CODE_A"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_PROJECT_NAME_A"));
        }
        
        var replaceText0 	= "_PROJECT_CODE_";
        var replaceText1 	= "_PROJECT_NAME_"; 
        var strWhereClause 	= "AND A.PROJECT_CODE LIKE '%" + replaceText0 + "%' AND A.PROJECT_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산프로젝트');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
					SBUxMethod.set('FM_PROJECT_CODE_A', 	data.PROJECT_CODE);
					SBUxMethod.set('FM_PROJECT_NAME_A', 	data.PROJECT_NAME);
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
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_DEPR_EXP_ACC_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_DEPR_EXP_ACC_NAME"));
        } else if(type=='3'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_ACCUM_DEPR_ACC_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_ACCUM_DEPR_ACC_NAME"));
        } else if(type=='4'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_ACC_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_ACC_NAME"));
        } else if(type=='5'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_DEPR_ACC_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_DEPR_ACC_NAME"));
        } else if(type=='6'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_ACCUM_DEPR_ACC_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_ACCUM_DEPR_ACC_NAME"));
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
				console.log('callback data:', data);
		        if(type=='1'){
					SBUxMethod.set('FM_ACCOUNT_CODE', 			data.ACCOUNT_CODE);
					SBUxMethod.set('FM_ACCOUNT_NAME', 			data.ACCOUNT_NAME);
		        } else if(type=='2'){
					SBUxMethod.set('FM_DEPR_EXP_ACC_CODE', 		data.ACCOUNT_CODE);
					SBUxMethod.set('FM_DEPR_EXP_ACC_NAME', 		data.ACCOUNT_NAME);
		        } else if(type=='3'){
					SBUxMethod.set('FM_ACCUM_DEPR_ACC_CODE', 	data.ACCOUNT_CODE);
					SBUxMethod.set('FM_ACCUM_DEPR_ACC_NAME', 	data.ACCOUNT_NAME);
		        } else if(type=='4'){
					SBUxMethod.set('FM_SUBSIDIES_ACC_CODE', 	data.ACCOUNT_CODE);
					SBUxMethod.set('FM_SUBSIDIES_ACC_NAME', 	data.ACCOUNT_NAME);
		        } else if(type=='5'){
					SBUxMethod.set('FM_SUBSIDIES_DEPR_ACC_CODE', 	data.ACCOUNT_CODE);
					SBUxMethod.set('FM_SUBSIDIES_DEPR_ACC_NAME', 	data.ACCOUNT_NAME);
		        } else if(type=='6'){
					SBUxMethod.set('FM_SUBSIDIES_ACCUM_DEPR_ACC_CODE', 	data.ACCOUNT_CODE);
					SBUxMethod.set('FM_SUBSIDIES_ACCUM_DEPR_ACC_NAME', 	data.ACCOUNT_NAME);
		        }
			},
    	});
    }     
    
    /**
     * 자산구분
     */
    var fn_compopup12 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM_ASSET_CATEGORY_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM_ASSET_CATEGORY_NAME"));
        
        var replaceText0 	= "_ASSET_CATEGORY_";
        var replaceText1 	= "_ASSET_CATEGORY_NAME_"; 
        var strWhereClause 	= "AND A.ASSET_CATEGORY LIKE '%" + replaceText0 + "%' AND A.ASSET_CATEGORY_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산구분');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				SBUxMethod.set('FM_ASSET_CATEGORY_CODE', 	data.ASSET_CATEGORY);
				SBUxMethod.set('FM_ASSET_CATEGORY_NAME', 	data.ASSET_CATEGORY_NAME);
			},
    	});
    }     
    
    /**
     * 자산계정
     */
    var fn_compopup13 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACC_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACC_NAME"));
        
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
				console.log('callback data:', data);
				SBUxMethod.set('FM_ASSET_ACC_CODE', 	data.ACCOUNT_CODE);
				SBUxMethod.set('FM_ASSET_ACC_NAME', 	data.ACCOUNT_NAME);
			},
    	});
    }         
    
    /**
     * 중분류
     */
    var fn_compopup14 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL2_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL2_NAME"));
        
        var replaceText0 	= "_ASSET_LEVEL2_";
        var replaceText1 	= "_ASSET_LEVEL2_NAME_"; 
        var strWhereClause 	= "AND AA.ASSET_LEVEL2 LIKE '%" + replaceText0 + "%' AND AA.ASSET_LEVEL2_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산중분류');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				SBUxMethod.set('FM_ASSET_LEVEL2_CODE', 	data.ASSET_LEVEL2);
				SBUxMethod.set('FM_ASSET_LEVEL2_NAME', 	data.ASSET_LEVEL2_NAME);
			},
    	});
    }         
    
    /**
     * 최초취득처
     */
    var fn_compopup15 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM_CS_CODE1_A"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM_CS_NAME1_A"));
        
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_"; 
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				SBUxMethod.set('FM_CS_CODE1_A', 	data.CS_CODE);
				SBUxMethod.set('FM_CS_NAME1_A', 	data.CS_NAME);
			},
    	});
    }         
    
    /**
     * 소분류 
     */
    function fn_compopup16() {
    	
    	//type C 형 팝업
    	var p_find1	= p_ss_languageID;
    	var p_find2	= gv_ma_selectedApcCd;
    	var p_find3	= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL2_CODE"));
   		var p_find4	= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL3_CODE"));
		var p_find5	= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL3_NAME"));
		var p_find6	= "";
		var p_find7	= "";

        SBUxMethod.attr('modal-compopup1', 'header-title', '자산 소분류');
        compopup1({
            compCode				: gv_ma_selectedApcCd
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
                SBUxMethod.set('FM_ASSET_LEVEL3_NAME', data.ASSET_LEVEL3_NAME);
                SBUxMethod.set('FM_ASSET_LEVEL3_CODE', data.ASSET_LEVEL3);
            },
        });
    }       
          
    /**
     * 위치코드
     */
    var fn_compopup17 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM_LOCATION_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM_LOCATION_NAME"));
        
        var replaceText0 	= "_LOCATION_CODE_";
        var replaceText1 	= "_LOCATION_NAME_"; 
        var strWhereClause 	= "AND LOCATION_CODE LIKE '%" + replaceText0 + "%' AND LOCATION_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				SBUxMethod.set('FM_LOCATION_CODE', 	data.CS_CODE);
				SBUxMethod.set('FM_LOCATION_NAME', 	data.CS_NAME);
			},
    	});
    }         
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>