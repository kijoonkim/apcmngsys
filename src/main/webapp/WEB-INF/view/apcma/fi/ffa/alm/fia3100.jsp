<%
/**
 * @Class Name 		: fia3100.jsp
 * @Description 	: 자산원장 화면
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
	<title>title : 자산원장</title>
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
                    </h3><!-- 자산원장 -->
                </div>
                <div style="margin-left: auto;">
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
                        
                            <th scope="row" class="th_bg">비고</th>
                            <td colspan="3" class="td_input" >
								<sbux-input id="SCH_DESCRIPTION" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                        
                            <th scope="row" class="th_bg">실적구분</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_ACTUAL_FLAG_P" uitype="single" jsondata-ref="jsonActualFlagP" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        </tr>
                    
                        <tr>
                            <th scope="row" class="th_bg">자산구분</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_ASSET_CATEGORY" uitype="single" jsondata-ref="jsonAssetCategory" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            
                            <th scope="row" class="th_bg">중분류</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_ASSET_LEVEL2" uitype="single" jsondata-ref="jsonAssetLevel2" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            
                            <th scope="row" class="th_bg">소분류</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_ASSET_LEVEL3" uitype="single" jsondata-ref="jsonAssetLevel3" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            
                            <th scope="row" class="th_bg">조회기준일자</th>
                            <td colspan="3" class="td_input" >
							    <sbux-datepicker
							            id="SCH_BASE_DATE"
							            uitype="popup"
							            date-format="yyyy-mm-dd"
							            class="form-control input-sm input-sm-ast inpt_data_reqed">
							    </sbux-datepicker>
								<sbux-input style="display:none" id="SCH_LANG_ID" uitype="text" class="form-control input-sm"></sbux-input>
                            </td>
                        </tr>
                        
                        <tr>
                            <th scope="row" class="th_bg">담당부서</th>
                            <td colspan="3" class="td_input" >
	                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
  									<sbux-input style="width:80px" id="SCH_DEPT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
  									<font style="width:5px"></font>
									<sbux-button
										class="btn btn-xs btn-outline-dark"
										text=".." uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1()"></sbux-button>
  									<font style="width:5px"></font>
  									<sbux-input style="width:100%" id="SCH_DEPT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
	                           	</div>
                            </td>                        
                        
                            <th scope="row" class="th_bg">원가중심점</th>
                            <td colspan="3" class="td_input" >
	                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
  									<sbux-input style="width:80px" id="SCH_COST_CENTER_CODE" uitype="text" class="form-control input-sm"></sbux-input>
  									<font style="width:5px"></font>
									<sbux-button
										class="btn btn-xs btn-outline-dark"
										text=".." uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup7('2')"></sbux-button>
  									<font style="width:5px"></font>
  									<sbux-input style="width:100%" id="SCH_COST_CENTER_NAME" uitype="text" class="form-control input-sm"></sbux-input>
	                           	</div>
                            </td>
                        
                            <th scope="row" class="th_bg">감가상각기준</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_DEPRECIATION_TYPE" uitype="single" jsondata-ref="jsonDepreciationType" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                                    <span>자산리스트</span>
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
                                    <span>자산내역</span>
                                </li>
                            </ul>
                        </div>
                        
						<div class="table-responsive tbl_scroll_sm" style="padding-top:10px">
						
						    <sbux-tabs id="idxTab_norm1" name="idxTab_norm1" uitype="normal"
			                   title-target-id-array = "SB_TOP_TAB1^SB_TOP_TAB2"
			                   title-text-array = "기본내역^감가상각"
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
				  							<sbux-input  id="FM_ASSET_ACQUIRE_NO"  		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
				                       		<!-- /hidden -->
		                       					                    
			                                <tr>
			                                    <th scope="row" class="th_bg">자산번호</th>
			                                    <td colspan="2" class="td_input">
			                                        <sbux-input id="FM_ASSET_NO" class="form-control input-sm" uitype="text" ></sbux-input>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">자산명</th>
			                                    <td colspan="5" class="td_input">
			                                        <sbux-input id="FM_ASSET_NAME" class="form-control input-sm" uitype="text" ></sbux-input>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">자산계정</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_ASSET_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup2('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_ASSET_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
		                       				</tr>
		                       					                    
											<tr>
			                                    <th scope="row" class="th_bg">자산구분</th>
			                                    <td colspan="2" class="td_input">
					                                <sbux-select id="FM_ASSET_CATEGORY_NAME" uitype="single" jsondata-ref="jsonAssetCategoryName" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
					  									<sbux-input style="width:80px" id="FM_CS_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup3()"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_CS_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">감가상각비계정</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_DEPR_EXP_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup2('2')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_DEPR_EXP_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
											</tr>
											
											<tr>
			                                    <th scope="row" class="th_bg">중분류</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_ASSET_LEVEL2_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup4()"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_ASSET_LEVEL2_NAME" uitype="text" class="form-control input-sm"></sbux-input>
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
					  									<sbux-input style="width:80px" id="FM_DEPT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup5('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_DEPT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
											
			                                    <th scope="row" class="th_bg">감가상각누계계정</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_ACCUM_DEPR_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup2('3')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_ACCUM_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
											
											</tr>
			                                
			                                <tr>
			                                    <th scope="row" class="th_bg">소분류</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_ASSET_LEVEL3_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup6()"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_ASSET_LEVEL3_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">통화</th>
			                                    <td colspan="2" class="td_input">
					                                <sbux-select style="width:100px" id="FM_CURRENCY_CODE" uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">원가중심점</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_COST_CENTER_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup7('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_COST_CENTER_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
											
			                                    <th scope="row" class="th_bg">보조금계정</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_SUBSIDIES_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup2('4')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_SUBSIDIES_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                
			                                </tr>
			                                
			                                <tr>
			                                    <th scope="row" class="th_bg">최초취득일</th>
			                                    <td colspan="2" class="td_input">
												    <sbux-datepicker
												            id="FM_ACQUIRE_DATE"
												            uitype="popup"
												            date-format="yyyy-mm-dd"
												            class="form-control input-sm input-sm-ast inpt_data_reqed">
												    </sbux-datepicker>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">취득금액</th>
			                                    <td colspan="2" class="td_input">
				  									<sbux-input style="width:100%" id="FM_FUNCTIONAL_AMOUNT" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">프로젝트</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_PROJECT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup8('1')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_PROJECT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
											
			                                    <th scope="row" class="th_bg">보조금상각비</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" id="FM_SUBSIDIES_DEPR_ACC_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
														<sbux-button
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup2('5')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_SUBSIDIES_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                
			                                </tr>
			                                
			                                <tr>
					                            <th scope="row" class="th_bg">사업장</th>
					                            <td colspan="2" class="td_input" >
					                                <sbux-select id="FM_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
															onclick="fn_compopup9()"></sbux-button>
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
															style="width:20px"
															class="btn btn-xs btn-outline-dark"
															text=".." uitype="modal"
															target-id="modal-compopup1"
															onclick="fn_compopup2('6')"></sbux-button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" id="FM_SUBSIDIES_ACCUM_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                </tr>
			                                
			                                <tr>
			                                    <th scope="row" class="th_bg">상각여부</th>
			                                    <td colspan="2" class="td_input">
					                            	<sbux-checkbox id="FM_DEPRECIATE_YN" uitype="normal" text="예" true-value="Y" false-value="N" onchange="fn_cngChkReportYn(SCH_CHKREPORT_YN)"></sbux-checkbox>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">국고보조금</th>
			                                    <td colspan="2" class="td_input">
				  									<sbux-input style="width:100%" id="FM_SUBSIDIES_AMOUNT" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">회계기준</th>
			                                    <td colspan="2" class="td_input">
					                                <sbux-select id="FM_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">설비번호</th>
			                                    <td colspan="2" class="td_input">
				  									<sbux-input style="width:100%" id="FM_EQUIPMENT_NO" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>
			                                </tr>
			                                
			                                <tr>
			                                    <th scope="row" class="th_bg">비고</th>
			                                    <td colspan="8" class="td_input">
				  									<sbux-input style="width:100%" id="FM_MEMO" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">수량</th>
			                                    <td colspan="2" class="td_input">
				  									<sbux-input style="width:100px" id="FM_QTY" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>
			                                </tr>
			                                
			                            </tbody>
			                        </table>            							
								</div>
							
								<div id="SB_TOP_TAB2" >
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
			                                    <th scope="row" class="th_bg">내용년수(월)</th>
			                                    <td colspan="2" class="td_input">
				  									<sbux-input style="width:150px" id="FM_USEFUL_LIFE_MM_GAAP" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">내용년수(월)</th>
			                                    <td colspan="2" class="td_input">
				  									<sbux-input style="width:150px" id="FM_USEFUL_LIFE_MM_TAX" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>								
			                                
			                                    <th scope="row" class="th_bg">내용년수(월)</th>
			                                    <td colspan="2" class="td_input">
				  									<sbux-input style="width:150px" id="FM_USEFUL_LIFE_MM_IFRS" uitype="text" class="form-control input-sm"></sbux-input>
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
        		
                    <div class="col-sm-6" style="width:100%">
                    
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>상세내역</span>
                                </li>
                            </ul>
		                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
			                    <sbux-button uitype="normal" text="취득내역"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnAcquireQuery"></sbux-button>
								<a href="#" id="btn1-row-add" class="cu-btn-plus" style="padding-left:10px" >
									<img src="../../../resource/images/plus.png" width="20px" /> 행추가
								</a>
								<a href="#" id="btn1-row-del" class="cu-btn-minus" style="padding-left:10px">
									<img src="../../../resource/images/minus.png" width="20px" /> 행삭제
								</a>
							</div>
                        </div>
                        
                        <div>
                        
						    <sbux-tabs id="idxTab_norm2" name="idxTab_norm2" uitype="normal"
			                   title-target-id-array = "SB_BOT_TAB1^SB_BOT_TAB2^SB_BOT_TAB3^SB_BOT_TAB4"
			                   title-text-array = "자산상세내역^취득내역^감가상각내역^토지공시지가"
			                   title-target-value-array="1^2"
			                   onclick="fn_tabClick2(idxTab_norm2)"></sbux-tabs>					
							
							<div class="tab-content" style="width:100%" >
							
								<div id="SB_BOT_TAB1" >
		                            <div id="sb_area_detail01" style="height:200px; width:100%;"></div>
								</div>
							
								<div id="SB_BOT_TAB2" >
			                        <div class="ad_tbl_top">
					                    <div style="width:100%;display:flex;vertical-align:middle;float:right;padding-top:0px;margin-right:auto">
		                                	<font>취득일</font>
		                                	<font style="padding-right:10px"></font>
										    <sbux-datepicker
										            id="FM_ACQUIRE_DATE_FR"
										            uitype="popup"
										            date-format="yyyy-mm-dd"
										            class="form-control input-sm input-sm-ast inpt_data_reqed">
										    </sbux-datepicker>
										    <font style="padding-left:5px;padding-right:5px" >-</font>                          
										    <sbux-datepicker
										            id="FM_ACQUIRE_DATE_TO"
										            uitype="popup"
										            date-format="yyyy-mm-dd"
										            class="form-control input-sm input-sm-ast inpt_data_reqed">
										    </sbux-datepicker> 
										                             
		                                	<font style="padding-right:10px"></font>
		                                	
		                                	<font>담당자</font>
		  									<sbux-input style="width:80px" id="FM_EMP_CODE" uitype="text" class="form-control input-sm"></sbux-input>
		  									<font style="width:5px"></font>
											<sbux-button
												id="BTN_POP1" 
												class="btn btn-xs btn-outline-dark"
												text=".." uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_compopup10"></sbux-button>
		  									<font style="width:5px"></font>
		  									<sbux-input style="width:150px" id="FM_EMP_NAME" uitype="text" class="form-control input-sm"></sbux-input>
		  									
		                                	<font style="padding-right:20px"></font>
		                                	
						                    <sbux-button uitype="normal" text="조회"  			class="btn btn-sm btn-outline-danger" onclick="fn_btnAcquireQuery"></sbux-button>
		  									<font style="width:5px"></font>
						                    <sbux-button uitype="normal" text="자산원장반영"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnAcquireQuery"></sbux-button>
										</div>
			                        </div>
								
		                            <div id="sb_area_detail02" style="height:200px; width:100%;"></div>
								
								</div>
							
								<div id="SB_BOT_TAB3" >
		                            <div id="sb_area_detail03" style="height:200px; width:100%;"></div>
								</div>
							
								<div id="SB_BOT_TAB4" >
		                            <div id="sb_area_detail04" style="height:200px; width:100%;"></div>
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
	
    //grid 초기화
    var Fia3100GridMast; 			// 그리드를 담기위한 객체 선언
    var jsonFia3100Mast 	= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fia3100GridDetail01; 		// 그리드를 담기위한 객체 선언
    var jsonFia3100Detail01 = []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fia3100GridDetail02; 		// 그리드를 담기위한 객체 선언
    var jsonFia3100Detail02 = []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fia3100GridDetail03; 		// 그리드를 담기위한 객체 선언
    var jsonFia3100Detail03 = []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fia3100GridDetail04; 		// 그리드를 담기위한 객체 선언
    var jsonFia3100Detail04 = []; 	// 그리드의 참조 데이터 주소 선언

	var jsonFiOrgCode		= [];	// 사업단위
	var jsonSiteCode		= [];	// 사업장
	var jsonActualFlagP		= [];	// 실적구분
	var jsonAssetCategory	= [];	// 자산구분
	var jsonAssetLevel2		= [];	// 중분류
	var jsonAssetLevel3		= [];	// 소분류
	var jsonAssetCategoryName		= [];	// 자산구분
	var jsonCurrencyCode			= [];	// 통화
	var jsonAcctRuleCode			= [];	// 회계기준
	var jsonDepreciationType		= [];	// 감가상각기준
	
	var jsonDepreMethodCode	= [];	// 감가상각방법
	var jsonDeprePeriodCode	= [];	// 감가상각주기
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],								jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SCH_SITE_CODE','FM_SITE_CODE'],				jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 실적구분
            gfnma_setComSelect(['SCH_ACTUAL_FLAG_P'],							jsonActualFlagP,	'L_FIA020', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 자산구분
            gfnma_setComSelect(['SCH_ASSET_CATEGORY'],							jsonActualFlagP,	'L_FIA001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 중분류
            gfnma_setComSelect(['SCH_ASSET_LEVEL2'],							jsonAssetLevel2,	'L_FIA005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'ASSET_GROUP_CODE', 'ASSET_GROUP_NAME', 'Y', ''),
            // 소분류
            gfnma_setComSelect(['SCH_ASSET_LEVEL3'],							jsonAssetLevel2,	'L_FIA006', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'ASSET_GROUP_CODE', 'ASSET_GROUP_NAME', 'Y', ''),
            // 자산구분
            gfnma_setComSelect(['FM_ASSET_CATEGORY_NAME'],						jsonAssetCategoryName,	'P_ASSET_CATEGORY', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'ASSET_CATEGORY', 'ASSET_CATEGORY_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['FM_CURRENCY_CODE'],							jsonCurrencyCode,	'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE','FM_ACCT_RULE_CODE'],		jsonAcctRuleCode,	'L_FIM054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 감가상각기준
            gfnma_setComSelect(['SCH_DEPRECIATION_TYPE'],						jsonDepreciationType,'L_FIA018', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            
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
				$('#BTN_POP1').click(function(){
					fn_compopup10(list);
				});
			}
		)
  		
		//화면셋팅
    	fn_state('L');
  		
		fn_createFia3100GridMast();
		fn_createFia3100GridDetail01();
		fn_createFia3100GridDetail02();
		fn_createFia3100GridDetail03();
		fn_createFia3100GridDetail04();
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
    	//fn_setFia3100GridMast('LIST');
    }
    
    function fn_createFia3100GridMast() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid1';
	    SBGridProperties.id 				= 'Fia3100GridMast';
	    SBGridProperties.jsonref 			= 'jsonFia3100Mast';
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
                    sum : [6,7,8,9,10,11,12,13,14,15]
                },
                grandtotalrow : {
                    titlecol 		: 5,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["자산구분"],			ref: 'ASSET_CATEGORY', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["자산번호"], 		ref: 'ASSET_NO',  			  	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["자산명"], 			ref: 'ASSET_NAME', 			   	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["회계기준"], 		ref: 'ACCT_RULE_CODE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["취득처"],			ref: 'CS_NAME',  			  	type:'output',  	width:'150px',  	style:'text-align:left'},

            {caption: ["장부가액"],					ref: 'BOOK_VALUE',  	  				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["취득금액"],					ref: 'FUNCTIONAL_AMOUNT',  				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["자본적지출"],				ref: 'CAPITAL_EXPENDITURE', 			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["국고보조금"],				ref: 'SUBSIDIES_AMOUNT',   				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["지분취득가액"],				ref: 'OUT_ACQUISITION_AMOUNT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["처분국고보조금"],			ref: 'OUT_SUBSIDIES_AMOUNT',  			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["처분감가상각누계액"],		ref: 'OUT_ACCUMULATED_DEPRECIATION',    type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["처분국고보조금감가누계액"],	ref: 'OUT_SUBSIDIES_ACC_DEPRECIATION', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["감가상각누계액"],			ref: 'ACCUMULATED_DEPRECIATION',  		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["국고보조금감가상각누계액"],	ref: 'SUBSIDIES_ACC_DEPRECIATION', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["사업장"],					ref: 'SITE_CODE',    			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["관리부서"],					ref: 'DEPT_CODE', 		   		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["원가중심점"],				ref: 'COST_CENTER_CODE', 		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["프로젝트명"],				ref: 'PROJECT_NAME',   			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["내용연수(기업회계)"],		ref: 'USEFUL_LIFE_GAAP',   		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["내용연수월(기업회계)"],		ref: 'USEFUL_LIFE_MM_GAAP', 	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["내용연수(IFRS)"],			ref: 'USEFUL_LIFE_IFRS',   		type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["내용연수월(IFRS)"],			ref: 'USEFUL_LIFE_MM_IFRS', 	type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["내용연수(세법)"],			ref: 'USEFUL_LIFE_TAX',    		type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["내용연수월(세법)"],			ref: 'USEFUL_LIFE_MM_TAX', 		type:'output',  	width:'120px',  	style:'text-align:left'},
            
            {caption: ["잔존율"],					ref: 'SALVAGE_RATE_GAAP',  		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["잔존가액"],					ref: 'SALVAGE_VALUE_GAAP', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["수량"],						ref: 'QTY', 			   		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["비고"],						ref: 'MEMO',  			  		type:'output',  	width:'300px',  	style:'text-align:left'},
        ];

        Fia3100GridMast = _SBGrid.create(SBGridProperties);
        //Fia3100GridMast.bind('click', 			'fn_viewFia3100GridMastEvent');
    }
    
    function fn_createFia3100GridDetail01() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_detail01';
	    SBGridProperties.id 				= 'Fia3100GridDetail01';
	    SBGridProperties.jsonref 			= 'jsonFia3100Detail01';
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
                    sum : [10]
                },
                grandtotalrow : {
                    titlecol 		: 9,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["취득일자"],			ref: 'TXN_DATE', 				type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["취득유형"],			ref: 'TXN_TYPE', 	 		  	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["취득번호"],			ref: 'ASSET_ACQUIRE_NO', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["연번"], 			ref: 'ASSET_SEQ',  				type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["자산명"],			ref: 'ASSET_NAME', 			  	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["규격"],				ref: 'ASSET_SPEC',    			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["통화"],				ref: 'CURRENCY_CODE',  			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환율"],				ref: 'EXCHANGE_RATE',  			type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["금액(통화)"],		ref: 'ORIGINAL_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["금액(전표)"],		ref: 'FUNCTIONAL_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["취득수량"],			ref: 'ACQUIRE_QTY',    			type:'output',  	width:'170px',  	style:'text-align:left'},
            {caption: ["재고량"],			ref: 'ONHAND_QTY',    			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["단위"],				ref: 'UNIT_CODE',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업장"],			ref: 'SITE_CODE',    			type:'output',  	width:'170px',  	style:'text-align:left'},
            {caption: ["관리부서"],			ref: 'DEPT_CODE',    			type:'output',  	width:'170px',  	style:'text-align:left'},
            {caption: ["원가중심점명"],		ref: 'COST_CENTER_CODE', 		type:'output',  	width:'170px',  	style:'text-align:left'},
            
            {caption: ["비고"],				ref: 'MEMO',    				type:'output',  	width:'300px',  	style:'text-align:left'},
        ];

        Fia3100GridDetail01 = _SBGrid.create(SBGridProperties);
        //Fia3100GridDetail01.bind('click', 			'fn_viewFia3100GridDetail01Event');
    }
    
    function fn_createFia3100GridDetail02() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_detail02';
	    SBGridProperties.id 				= 'Fia3100GridDetail02';
	    SBGridProperties.jsonref 			= 'jsonFia3100Detail02';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.columns = [
            {caption: ["사업장"],			ref: 'TXN_DATE', 				type:'output',  	width:'150px', 		style:'text-align:left'},
            {caption: ["자산명"],			ref: 'TXN_TYPE', 	 		  	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["규격"],				ref: 'ASSET_ACQUIRE_NO', 		type:'output',  	width:'150px',  	style:'text-align:left'},
            
            {caption: ["수량"], 			ref: 'ASSET_SEQ',  				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["댠위"],				ref: 'ASSET_NAME', 			  	type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["취득처"],			ref: 'ASSET_SPEC',    			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["단가"],				ref: 'CURRENCY_CODE',  			type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["취득가액"],			ref: 'EXCHANGE_RATE',  			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["환산금액"],			ref: 'ORIGINAL_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["취득번호"],			ref: 'FUNCTIONAL_AMOUNT', 		type:'output',  	width:'150px',  	style:'text-align:left'},
            
            {caption: ["연번"],				ref: 'ACQUIRE_QTY',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["취득일"],			ref: 'ONHAND_QTY',    			type:'output',  	width:'120px',  	style:'text-align:left'},
            
            {caption: ["비고"],				ref: 'MEMO',    				type:'output',  	width:'200px',  	style:'text-align:left'},
        ];

        Fia3100GridDetail02 = _SBGrid.create(SBGridProperties);
        //Fia3100GridDetail02.bind('click', 			'fn_viewFia3100GridDetail02Event');
    }
    
    function fn_createFia3100GridDetail03() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_detail03';
	    SBGridProperties.id 				= 'Fia3100GridDetail03';
	    SBGridProperties.jsonref 			= 'jsonFia3100Detail03';
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
                    sum : [7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]
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
            {caption: ["감가상각년월"],		ref: 'DEPRECIATION_YYYYMM', 	type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["상각방법"],			ref: 'DEPRECIATION_METHOD',   	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["상각주기"],			ref: 'DEPRECIATION_PERIOD', 	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["내용연수"], 		ref: 'USEFUL_LIFE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["내용연수(월)"],		ref: 'USEFUL_LIFE_MM',		  	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["상각률(1000)"],		ref: 'DEPRECIATION_RATE', 		type:'output',  	width:'150px',  	style:'text-align:left'},
            
            {caption: ["기초취득가액"],				ref: 'BEGIN_ACQUISITION_AMOUNT',  	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["기초보조금"],				ref: 'BEGIN_SUBSIDIES_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["당기취득금액"],				ref: 'IN_ACQUISITION_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["당기취득보조금"],			ref: 'IN_SUBSIDIES_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["감가상각비"],				ref: 'ACQ_DEPR_AMT',  				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["보조금상각비"],				ref: 'SUBSIDIES_DEPR_AMT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["처분취득가액"],				ref: 'OUT_ACQUISITION_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["처분보조금"],				ref: 'OUT_SUBSIDIES_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["처분자산상각비"],			ref: 'OUT_ACQ_DEPR',  				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["처분자산보조금상각비"],		ref: 'OUT_SUBSIDIES_DEPR', 			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["처분자산상각누계액"],		ref: 'OUT_ACCUM_DEPR', 				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["처분자산보조금상각누계액"],	ref: 'OUT_SUBSIDIES_ACCUM_DEPR', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["기말취득가액"],				ref: 'END_ACQUISITION_AMOUNT',		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["기말보조금"],				ref: 'END_SUBSIDIES_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["기말상각누계액"],			ref: 'END_ACCUM_DEPR', 				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["기말보조금상각누계액"],		ref: 'END_SUBSIDES_ACCUM_DEPR', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            
            {caption: ["비고"],				ref: 'MEMO',    				type:'output',  	width:'200px',  	style:'text-align:left'},
        ];

        Fia3100GridDetail03 = _SBGrid.create(SBGridProperties);
        //Fia3100GridDetail03.bind('click', 			'fn_viewFia3100GridDetail03Event');
    }
    
    function fn_createFia3100GridDetail04() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_detail04';
	    SBGridProperties.id 				= 'Fia3100GridDetail04';
	    SBGridProperties.jsonref 			= 'jsonFia3100Detail04';
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
                    sum : [5]
                },
                grandtotalrow : {
                    titlecol 		: 4,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["기준월"],				ref: 'BASE_YYYYMM', 			type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["공시지가"],				ref: 'UNIT_PRICE',  		 	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["면적"],					ref: 'AREA', 					type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["단위"], 				ref: 'AREA_UOM', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["공시지가금액"],			ref: 'AMOUNT',				  	type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}}, 
            
            {caption: ["주소"],					ref: 'ADDRESS', 				type:'output',  	width:'350px',  	style:'text-align:left'},
            
            {caption: ["비고"],					ref: 'ETC', 					type:'output',  	width:'400px',  	style:'text-align:left'},
        ];

        Fia3100GridDetail04 = _SBGrid.create(SBGridProperties);
        //Fia3100GridDetail04.bind('click', 			'fn_viewFia3100GridDetail04Event');
    }
    
    /**
     * 담당부서 
     */
    function fn_compopup1() {
    	
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
     * 자산계정
     */
    var fn_compopup2 = function(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACC_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACC_NAME"));
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
					SBUxMethod.set('FM_ASSET_ACC_CODE', 			data.ACCOUNT_CODE);
					SBUxMethod.set('FM_ASSET_ACC_NAME', 			data.ACCOUNT_NAME);
		        } else if(type=='2'){
					SBUxMethod.set('FM_DEPR_EXP_ACC_CODE', 			data.ACCOUNT_CODE);
					SBUxMethod.set('FM_DEPR_EXP_ACC_NAME', 			data.ACCOUNT_NAME);
		        } else if(type=='3'){
					SBUxMethod.set('FM_ACCUM_DEPR_ACC_CODE', 		data.ACCOUNT_CODE);
					SBUxMethod.set('FM_ACCUM_DEPR_ACC_NAME', 		data.ACCOUNT_NAME);
		        } else if(type=='4'){
					SBUxMethod.set('FM_SUBSIDIES_ACC_CODE', 		data.ACCOUNT_CODE);
					SBUxMethod.set('FM_SUBSIDIES_ACC_NAME', 		data.ACCOUNT_NAME);
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
     * 취득처 
     */
    function fn_compopup3() {
    	
        var searchCode 		= gfnma_nvl(SBUxMethod.get('FM_CS_CODE'));
        var searchName 		= gfnma_nvl(SBUxMethod.get("FM_CS_NAME"));
        
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
				SBUxMethod.set('FM_CS_CODE',	data.CS_CODE);
				SBUxMethod.set('FM_CS_NAME', 	data.CS_NAME);
			},
    	});
    }   
    
    /**
     * 중분류
     */
    var fn_compopup4 = function() {
    	
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
     * 담당부서 
     */
    function fn_compopup5(type) {
    	
        var searchText1		= '';
        var searchText2		= '';
        if(type=='1'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_DEPT_NAME"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_DEPT_CODE"));
        } else if(type=='2'){
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
                }
            },
        });
    }       
    
    /**
     * 소분류 
     */
    function fn_compopup6() {
    	
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
     * 원가중심점코드
     */
    var fn_compopup7 = function(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_NAME"));
        } else if(type=='2'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("SCH_COST_CENTER_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("SCH_COST_CENTER_NAME"));
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
					SBUxMethod.set('SCH_COST_CENTER_CODE', 	data.COST_CENTER_CODE);
					SBUxMethod.set('SCH_COST_CENTER_NAME', 	data.COST_CENTER_NAME);
		        }
			},
    	});
    }     
    
    /**
     * 프로젝트코드
     */
    var fn_compopup8 = function(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_PROJECT_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_PROJECT_NAME"));
        } else if(type=='2'){
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
		        }
			},
    	});
    }      
    
    /**
     * 위치코드
     */
    var fn_compopup9 = function() {
    	
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
        
    /**
     * 담당자 
     */
    function fn_compopup10(list) {
    	
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
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>