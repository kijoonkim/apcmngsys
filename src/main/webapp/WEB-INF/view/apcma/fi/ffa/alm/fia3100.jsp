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
	                        
	                            <th scope="row" class="th_bg_search">비고</th>
	                            <td colspan="3" class="td_input" >
									<sbux-input id="SCH_DESCRIPTION" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                        
	                            <th scope="row" class="th_bg_search">실적구분</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_ACTUAL_FLAG_P" uitype="single" jsondata-ref="jsonActualFlagP" unselected-text="선택" class="form-control input-sm inpt_data_reqed"
										group-id="schHeader" 
										required                                       
	                                ></sbux-select>
	                            </td>
	                            <td></td>
	                        </tr>
	                    
	                        <tr>
	                            <th scope="row" class="th_bg_search">자산구분</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_ASSET_CATEGORY" uitype="single" jsondata-ref="jsonAssetCategory" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">중분류</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_ASSET_LEVEL2" uitype="single" jsondata-ref="jsonAssetLevel2" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">소분류</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_ASSET_LEVEL3" uitype="single" jsondata-ref="jsonAssetLevel3" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">조회기준일자</th>
	                            <td colspan="3" class="td_input" >
								    <sbux-datepicker
							            id="SCH_BASE_DATE"
							            uitype="popup"
							            date-format="yyyy-mm-dd"
							            class="form-control input-sm input-sm-ast table-datepicker-ma inpt_data_reqed"
										group-id="schHeader" 
										required                                       
								    >
								    </sbux-datepicker>
									<sbux-input style="display:none" id="SCH_LANG_ID" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                        </tr>
	                        
	                        <tr>
	                            <th scope="row" class="th_bg_search">담당부서</th>
	                            <td colspan="3" class="td_input" >
		                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	  									<sbux-input style="width:80px" placeholder="코드" id="SCH_DEPT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
	  									<font style="width:5px"></font>
		        						<button type='button' class='ma-btn1' style='width:30px' onClick='fn_compopup1()'>
		        							…
										</button>
	  									<font style="width:5px"></font>
	  									<sbux-input style="width:100%" placeholder="부서명" id="SCH_DEPT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
		                           	</div>
	                            </td>                        
	                            <td></td>
	                        
	                            <th scope="row" class="th_bg_search">원가중심점</th>
	                            <td colspan="3" class="td_input" >
		                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	  									<sbux-input style="width:80px" placeholder="코드" id="SCH_COST_CENTER_CODE" uitype="text" class="form-control input-sm"></sbux-input>
	  									<font style="width:5px"></font>
		        						<button type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup7('2')">
		        							…
										</button>
	  									<font style="width:5px"></font>
	  									<sbux-input style="width:100%" placeholder="원가중심점명" id="SCH_COST_CENTER_NAME" uitype="text" class="form-control input-sm"></sbux-input>
		                           	</div>
	                            </td>
	                            <td></td>
	                        
	                            <th scope="row" class="th_bg_search">감가상각기준</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_DEPRECIATION_TYPE" uitype="single" jsondata-ref="jsonDepreciationType" unselected-text="선택" class="form-control input-sm inpt_data_reqed"
										group-id="schHeader" 
										required                                       
	                                ></sbux-select>
	                            </td>
	                            <td></td>
	                        
	                            <th scope="row" class="th_bg_search">회계기준</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed"
										group-id="schHeader" 
										required                                       
	                                ></sbux-select>
	                            </td>
	                            <td></td>
	                        </tr>
	                        
	                    </tbody>
	                </table>
                </div>
                
                <div class="row">
                
                    <div class="col-sm-6" style="width:100%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>자산리스트</span>
                                </li>
                            </ul>
                        </div>
                        <div style="border:1px solid #d7d4d4">
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
                        
						<div id="dataArea0" class="table-responsive tbl_scroll_sm" style="padding-top:10px">
						
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
				  							<sbux-input  id="FM_ASST_ACQS_NO"  		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
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
					  									<sbux-input style="width:80px" placeholder="코드" id="FM_ASSET_ACCOUNT" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
						        						<button type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup2('1')">
						        							…
														</button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" placeholder="계정명" id="FM_ASSET_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
		                       				</tr>
		                       					                    
											<tr>
			                                    <th scope="row" class="th_bg">자산구분</th>
			                                    <td colspan="2" class="td_input">
					                                <sbux-select id="FM_ASSET_CATEGORY" uitype="single" jsondata-ref="jsonFmAssetCategory" unselected-text="선택" class="form-control input-sm"></sbux-select>
					  								<sbux-input  id="FM_ASSET_CATEGORY_NAME" style="display:none;" uitype="text" class="form-control input-sm"></sbux-input>
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
					  									<sbux-input style="width:80px" placeholder="코드" id="FM_CNPT_CD" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
						        						<button type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup3()">
						        							…
														</button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" placeholder="취득처명" id="FM_CNPT_NM" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">감가상각비계정</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" placeholder="코드" id="FM_DEPR_EXP_ACC" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
						        						<button id="BTN_FM_DEPR_EXP_ACC" type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup2('2')">
						        							…
														</button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" placeholder="계정명" id="FM_DEPR_EXP_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
											</tr>
											
											<tr>
			                                    <th scope="row" class="th_bg">중분류</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" placeholder="코드" id="FM_ASSET_LEVEL2" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
						        						<button type='button' class='ma-btn1' style='width:30px' onClick='fn_compopup4()'>
						        							…
														</button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" placeholder="중분류명" id="FM_ASSET_LEVEL2_NAME" uitype="text" class="form-control input-sm"></sbux-input>
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
					  									<sbux-input style="width:80px" placeholder="코드" id="FM_DEPT_CODE" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
						        						<button type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup5('1')">
						        							…
														</button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" placeholder="부서명" id="FM_DEPT_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
											
			                                    <th scope="row" class="th_bg">감가상각누계계정</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" placeholder="코드" id="FM_ACCUM_DEPR_ACC" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
						        						<button id="BTN_FM_ACCUM_DEPR_ACC" type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup2('3')">
						        							…
														</button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" placeholder="계정명" id="FM_ACCUM_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
											
											</tr>
			                                
			                                <tr>
			                                    <th scope="row" class="th_bg">소분류</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" placeholder="코드" id="FM_ASSET_LEVEL3" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
						        						<button type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup6()">
						        							…
														</button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" placeholder="소분류명" id="FM_ASSET_LEVEL3_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">통화</th>
			                                    <td colspan="2" class="td_input">
					                                <sbux-select style="width:100px" id="FM_CURRENCY_CODE" uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">원가중심점</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" placeholder="코드" id="FM_CSTCD_CD" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
						        						<button type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup7('1')">
						        							…
														</button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" placeholder="원가중심점명" id="FM_CSTCD_NM" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
											
			                                    <th scope="row" class="th_bg">보조금계정</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" placeholder="코드" id="FM_GVSBS_ACNT" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
						        						<button type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup2('4')">
						        							…
														</button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" placeholder="계정명" id="FM_SUBSIDIES_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
			                                
			                                </tr>
			                                
			                                <tr>
			                                    <th scope="row" class="th_bg">최초취득일</th>
			                                    <td colspan="2" class="td_input">
												    <sbux-datepicker
												            id="FM_ACQS_FRST_YMD"
												            uitype="popup"
												            date-format="yyyy-mm-dd"
												            class="form-control input-sm input-sm-ast table-datepicker-ma">
												    </sbux-datepicker>
			                                    </td>
			                                    
			                                    <th scope="row" class="th_bg">취득금액</th>
			                                    <td colspan="2" class="td_input">
				  									<sbux-input style="width:100%" id="FM_FUNCTIONAL_AMOUNT" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">프로젝트</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" placeholder="코드" id="FM_PJT_CD" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
						        						<button type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup8('1')">
						        							…
														</button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" placeholder="프로젝트명" id="FM_PJT_NM" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>
											
			                                    <th scope="row" class="th_bg">보조금상각비</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" placeholder="코드" id="FM_GVSBS_DPCO_ACNT" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
						        						<button id="BTN_FM_SUBSIDIES_DEPR_ACC" type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup2('5')">
						        							…
														</button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" placeholder="계정명" id="FM_SUBSIDIES_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
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
				  									<sbux-input style="width:100%" id="FM_CPEXPND_ACML_AMT" uitype="text" class="form-control input-sm"></sbux-input>
			                                    </td>
			                                
			                                    <th scope="row" class="th_bg">위치코드</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" placeholder="코드" id="FM_LOCTN_CD" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
						        						<button type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup9()">
						        							…
														</button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" placeholder="위치명" id="FM_LOCTN_NM" uitype="text" class="form-control input-sm"></sbux-input>
						                           	</div>
			                                    </td>								
											
			                                    <th scope="row" class="th_bg">보조금상각누계액</th>
			                                    <td colspan="2" class="td_input">
						                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
					  									<sbux-input style="width:80px" placeholder="코드" id="FM_GVSBS_DPRC_AT_ACNT" uitype="text" class="form-control input-sm"></sbux-input>
					  									<font style="width:5px"></font>
						        						<button id="BTN_FM_SUBSIDIES_ACCUM_DEPR_ACC" type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup2('6')">
						        							…
														</button>
					  									<font style="width:5px"></font>
					  									<sbux-input style="width:100%" placeholder="계정명" id="FM_SUBSIDIES_ACCUM_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
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
				  									<sbux-input style="width:100%" id="FM_GVSBS_AMT" uitype="text" class="form-control input-sm"></sbux-input>
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
			                    <sbux-button id="BTN_btnAcquireQuery" uitype="normal" text="취득내역"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnAcquireQuery"></sbux-button>
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
			                   title-target-value-array="1^2^3^4"
			                   onclick="fn_tabClick2(idxTab_norm2)"></sbux-tabs>					
							
							<div class="tab-content" style="width:100%" >
							
								<div id="SB_BOT_TAB1" >
		                            <div id="sb_area_detail01" style="height:170px; width:100%;"></div>
		                            
				                    <div style="width:100%;display:flex;vertical-align:middle;padding-top:5px;margin-right:auto">
					                    <font style="margin-left:1150px">금액(전표)</font>
					                    <font style="margin-left:10px"></font>
										<sbux-input style="width:170px;font-weight:bold" id="TOT_BOT_TAB1_FUNCTIONAL_AMOUNT" readonly uitype="text" 
											mask="{'alias':'numeric','autoGroup':3,'groupSeparator':',','isShortcutChar':true}" 
											class="form-control input-sm">
										</sbux-input>
			                        </div>
								
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
										            class="form-control input-sm input-sm-ast table-datepicker-ma">
										    </sbux-datepicker>
										    <font style="padding-left:5px;padding-right:5px" >-</font>                          
										    <sbux-datepicker
										            id="FM_ACQUIRE_DATE_TO"
										            uitype="popup"
										            date-format="yyyy-mm-dd"
										            class="form-control input-sm input-sm-ast table-datepicker-ma">
										    </sbux-datepicker> 
										                             
		                                	<font style="padding-right:10px"></font>
		                                	
		                                	<font>담당자</font>
		  									<sbux-input style="width:80px" id="FM_EMP_CD" uitype="text" class="form-control input-sm"></sbux-input>
		  									<font style="width:5px"></font>
			        						<button id="BTN_POP1" type='button' class='ma-btn1' style='width:30px' onClick="fn_compopup10()">
			        							…
											</button>
		  									<font style="width:5px"></font>
		  									<sbux-input style="width:150px" id="FM_EMP_NM" uitype="text" class="form-control input-sm"></sbux-input>
		  									
		                                	<font style="padding-right:20px"></font>
		                                	
						                    <sbux-button uitype="normal" text="조회"  			class="btn btn-sm btn-outline-danger" onclick="fn_btnQueryClick"></sbux-button>
		  									<font style="width:5px"></font>
						                    <sbux-button uitype="normal" text="자산원장반영"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnAcquireClick"></sbux-button>
										</div>
			                        </div>
								
		                            <div id="sb_area_detail02" style="height:200px; width:100%;"></div>
								
								</div>
							
								<div id="SB_BOT_TAB3" >
		                            <div id="sb_area_detail03" style="height:200px; width:100%;"></div>
								</div>
							
								<div id="SB_BOT_TAB4" >
		                            <div id="sb_area_detail04" style="height:170px; width:100%;"></div>
		                            
				                    <div style="width:100%;display:flex;vertical-align:middle;padding-top:5px;margin-right:auto">
					                    <font style="margin-left:370px">공시지가금액</font>
					                    <font style="margin-left:10px"></font>
										<sbux-input style="width:170px;font-weight:bold" id="TOT_BOT_TAB4_AMOUNT" readonly uitype="text" 
											mask="{'alias':'numeric','autoGroup':3,'groupSeparator':',','isShortcutChar':true}" 
											class="form-control input-sm">
										</sbux-input>
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
	
	var p_ss_languageID			= '${loginVO.maLanguageID}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	var p_ss_defaultAcctRule 	= '${loginVO.maDefaultAcctRule}';
	var p_ss_baseCurrCode 		= '${loginVO.maBaseCurrCode}';
	//-----------------------------------------------------------
 
	var p_sel_tab2 		=  1;
	
    var p_menu_param	= null;
	
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
 
	var jsonFiOrgCode		= [];	// APC
	var jsonSiteCode		= [];	// 사업장
	var jsonActualFlagP		= [];	// 실적구분
	var jsonAssetCategory	= [];	// 자산구분
	var jsonAssetLevel2		= [];	// 중분류
	var jsonAssetLevel3		= [];	// 소분류
	var jsonFmAssetCategory			= [];	// 자산구분
	var jsonCurrencyCode			= [];	// 통화
	var jsonAcctRuleCode			= [];	// 회계기준
	var jsonDepreciationType		= [];	// 감가상각기준
	
	var jsonDepreMethodCode	= [];	// 감가상각방법
	var jsonDeprePeriodCode	= [];	// 감가상각주기
	var jsonUnitCode		= [];	// 단위
	var jsonAreaUom			= [];	// 단위
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // APC
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],								jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACNTG_OGNZ_CD', 'ACNTG_OGNZ_NM', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SCH_SITE_CODE','FM_SITE_CODE'],				jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),
            // 실적구분
            gfnma_setComSelect(['SCH_ACTUAL_FLAG_P'],							jsonActualFlagP,	'L_FIA020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 자산구분
            gfnma_setComSelect(['SCH_ASSET_CATEGORY'],							jsonAssetCategory,	'L_FIA001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 중분류
            gfnma_setComSelect(['SCH_ASSET_LEVEL2'],							jsonAssetLevel2,	'L_FIA005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ASST_GROUP_CD', 'ASST_GROUP_NM', 'Y', ''),
            // 소분류
            gfnma_setComSelect(['SCH_ASSET_LEVEL3'],							jsonAssetLevel3,	'L_FIA006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ASST_GROUP_CD', 'ASST_GROUP_NM', 'Y', ''),
            // 자산구분
            gfnma_setComSelect(['FM_ASSET_CATEGORY'],							jsonFmAssetCategory,	'P_ASSET_CATEGORY', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ASST_CTGRY', 'ASST_CTGRY_NM', 'Y', ''),
            // 통화
            gfnma_setComSelect(['FM_CURRENCY_CODE'],							jsonCurrencyCode,	'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CRN_CD', 'CRN_NM', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE','FM_ACCT_RULE_CODE'],		jsonAcctRuleCode,	'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 감가상각기준
            gfnma_setComSelect(['SCH_DEPRECIATION_TYPE'],						jsonDepreciationType,'L_FIA018', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            
            // 감가상각방법
            gfnma_setComSelect(['FM_DEPRECIATION_METHOD_GAAP','FM_DEPRECIATION_METHOD_TAX','FM_DEPRECIATION_METHOD_IFRS'],	jsonDepreMethodCode,'L_FIA003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 감가상각주기
            gfnma_setComSelect(['FM_DEPRECIATION_PERIOD_GAAP','FM_DEPRECIATION_PERIOD_TAX','FM_DEPRECIATION_PERIOD_IFRS'],	jsonDeprePeriodCode,'L_FIA004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            
            // 단위
            gfnma_setComSelect([],	jsonUnitCode,	'L_LGS001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'UNIT_CD', 'UNIT_NM', 'Y', ''),
            // 단위
            gfnma_setComSelect([],	jsonAreaUom,	'L_FIM402', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
		]);
	}	
 
	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//재직상태
		gfnma_getComSelectList('L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM',
			function(list){
				$('#BTN_POP1').click(function(){
					fn_compopup10(list);
				});
			}
		)
  		
		//화면셋팅
		SBUxMethod.hideTab('idxTab_norm2','SB_BOT_TAB2');
    	fn_state('L');
  		
		fn_createFia3100GridMast();
		fn_createFia3100GridDetail01();
		fn_createFia3100GridDetail02();
		fn_createFia3100GridDetail03();
		fn_createFia3100GridDetail04();
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
    
    	if(type=='L'){
			$('#main-btn-add', parent.document).attr('disabled', false);
			$('#main-btn-save', parent.document).attr('disabled', true);
			
			SBUxMethod.set('SCH_BASE_DATE', 		gfnma_date4());
			
			SBUxMethod.hide('BTN_btnAcquireQuery');
			
			SBUxMethod.set('SCH_FI_ORG_CODE', 			p_ss_fiOrgCode);
			SBUxMethod.set('SCH_LANG_ID', 				p_ss_languageID);
			SBUxMethod.set('SCH_DEPRECIATION_TYPE', 	p_ss_defaultAcctRule);
			SBUxMethod.set('SCH_ACCT_RULE_CODE', 		p_ss_defaultAcctRule);
			
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
        if(!SBUxMethod.validateRequired({group_id: "schHeader"}) || !validateRequired("schHeader")) {        
            return false;
        }        
//     	var SaveButton =  $('#main-btn-save', parent.document).prop('disabled');
//     	if(!SaveButton){
// 			if(gfn_comConfirm("Q0001", "작업중 저장하지 않은 데이터가 존재합니다. 저장 후 이동하시겠습니까?")){
// 				if(fn_validationMain()){
// 					cfn_save();
// 				}
// 			} 
//     	}
		$('#main-btn-save', parent.document).attr('disabled', true);
		$('#main-btn-del', 	parent.document).attr('disabled', false);
    	fn_setFia3100GridMast('LIST');
    }
    
    /**
     * 조회부분 벨리데이션 check
     */
    function fn_validationFindArea(){
    	
    	var bol = true;
    	var p_sch_base_date 		= gfnma_nvl(SBUxMethod.get('SCH_BASE_DATE')); 
    	var p_sch_depreciation_type	= gfnma_nvl(SBUxMethod.get('SCH_DEPRECIATION_TYPE')); 
    	var p_sch_acct_rule_code	= gfnma_nvl(SBUxMethod.get('SCH_ACCT_RULE_CODE')); 
		let p_sch_actual_flag_p		= gfnma_nvl(SBUxMethod.get("SCH_ACTUAL_FLAG_P"));
    	
    	if(!p_sch_base_date){
    		gfn_comAlert("E0000","조회기준일자는 필수입력입니다.");
    		bol = false;
    	} else if(!p_sch_depreciation_type){
    		gfn_comAlert("E0000","감가상각기준은 필수입력입니다.");
    		bol = false;
    	} else if(!p_sch_acct_rule_code){
    		gfn_comAlert("E0000","회계기준은 필수입력입니다.");
    		bol = false;
    	} else if(!p_sch_actual_flag_p){
    		gfn_comAlert("E0000","실적구분은 필수입력입니다.");
    		bol = false;
    	}
    	return bol;
    }     
    
    /**
     * 상세내역탭의 취득내역 벨리데이션 check
     */
    function fn_validationDetailTab2(){
    	
    	var bol = true;
    	var p_fm_acquire_date_fr 	= gfnma_nvl(SBUxMethod.get('FM_ACQUIRE_DATE_FR')); 
    	var p_fm_acquire_date_to 	= gfnma_nvl(SBUxMethod.get('FM_ACQUIRE_DATE_TO')); 
    	
    	if(!p_fm_acquire_date_fr){
    		gfn_comAlert("E0000","상세내역의 취득내역탭 취득일 시작일자는 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_acquire_date_to){
    		gfn_comAlert("E0000","상세내역의 취득내역탭 취득일 종료일자는 필수입력입니다.");
    		bol = false;
    	}
    	return bol;
    }     
    
    /**
     * 자산내역의 벨리데이션 check
     */
    function fn_validationMain(){
    	
    	var bol = true;
    	var p_fm_asset_name 			= gfnma_nvl(SBUxMethod.get('FM_ASSET_NAME')); 
    	var p_fm_asset_account			= gfnma_nvl(SBUxMethod.get('FM_ASSET_ACCOUNT')); 
    	var p_fm_asset_category			= gfnma_nvl(SBUxMethod.get('FM_ASSET_CATEGORY')); 
    	var p_fm_asset_level2			= gfnma_nvl(SBUxMethod.get('FM_ASSET_LEVEL2')); 
    	var p_fm_dept_code				= gfnma_nvl(SBUxMethod.get('FM_DEPT_CODE')); 
    	var p_fm_asset_level3			= gfnma_nvl(SBUxMethod.get('FM_ASSET_LEVEL3')); 
    	var p_fm_currency_code			= gfnma_nvl(SBUxMethod.get('FM_CURRENCY_CODE')); 
    	var p_fm_cost_center_code		= gfnma_nvl(SBUxMethod.get('FM_CSTCD_CD')); 
    	var p_fm_acquire_date			= gfnma_nvl(SBUxMethod.get('FM_ACQS_FRST_YMD')); 
    	var p_fm_functional_amount		= gfnma_nvl(SBUxMethod.get('FM_FUNCTIONAL_AMOUNT')); 
    	var p_fm_site_code				= gfnma_nvl(SBUxMethod.get('FM_SITE_CODE')); 
    	var p_fm_capital_expenditure	= gfnma_nvl(SBUxMethod.get('FM_CPEXPND_ACML_AMT')); 
    	var p_fm_subsidies_amount		= gfnma_nvl(SBUxMethod.get('FM_GVSBS_AMT')); 
    	var p_fm_acct_rule_code			= gfnma_nvl(SBUxMethod.get('FM_ACCT_RULE_CODE')); 
    	
    	if(!p_fm_asset_name){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 자산명은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_asset_account){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 자산계정은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_asset_category){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 자산구분은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_asset_level2){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 중분류는 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_dept_code){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 담당부서는 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_asset_level3){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 소분류는 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_currency_code){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 통화는 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_cost_center_code){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 원가중심점은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_acquire_date){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 최초취득일은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_functional_amount){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 취득금액은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_site_code){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 사업장은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_site_code){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 자본적지출은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_subsidies_amount){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 국고보조금은 필수입력입니다.");
    		bol = false;
    	} else if(!p_fm_acct_rule_code){
    		gfn_comAlert("E0000","자산내역의 기본내역탭 회계기준은 필수입력입니다.");
    		bol = false;
    	}
    	return bol;
    }     
    
    function fn_createFia3100GridMast() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid1';
	    SBGridProperties.id 				= 'Fia3100GridMast';
	    SBGridProperties.jsonref 			= 'jsonFia3100Mast';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total 				= {
                type 		: 'grand',
                position	: 'bottom',
                columns		: {
                    standard : [0],
                    sum : [5,6,7,8,9,10,11,12,13,14]
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
            {caption: ["자산구분"],			ref: 'ASSET_CATEGORY_NAME', 	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["자산번호"], 		ref: 'ASSET_NO',  			  	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["자산명"], 			ref: 'ASSET_NAME', 			   	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["회계기준"], 		ref: 'ACCT_RULE_NAME', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["취득처"],			ref: 'CS_NAME',  			  	type:'output',  	width:'150px',  	style:'text-align:left'},

            {caption: ["장부가액"],					ref: 'BOOK_VALUE',  	  				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["취득금액"],					ref: 'FUNCTIONAL_AMOUNT',  				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["자본적지출"],				ref: 'CAPITAL_EXPENDITURE', 			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["국고보조금"],				ref: 'SUBSIDIES_AMOUNT',   				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["지분취득가액"],				ref: 'OUT_ACQUISITION_AMOUNT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["처분국고보조금"],			ref: 'OUT_SUBSIDIES_AMOUNT',  			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["처분감가상각누계액"],		ref: 'OUT_ACCUMULATED_DEPRECIATION',    type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["처분국고보조금감가누계액"],	ref: 'OUT_SUBSIDIES_ACC_DEPRECIATION', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["감가상각누계액"],			ref: 'ACCUMULATED_DEPRECIATION',  		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["국고보조금감가상각누계액"],	ref: 'SUBSIDIES_ACC_DEPRECIATION', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["사업장"],					ref: 'SITE_NAME',    			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["관리부서"],					ref: 'DEPT_NAME', 		   		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["원가중심점"],				ref: 'COST_CENTER_NAME', 		type:'output',  	width:'150px',  	style:'text-align:left'},
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
        Fia3100GridMast.bind('click', 			'fn_viewFia3100GridMastEvent');
    }
    
    //상세정보 보기
    function fn_viewFia3100GridMastEvent() {
    	
        var nRow = Fia3100GridMast.getRow();
		if (nRow < 1) {
            return;
		}
        let rowData = Fia3100GridMast.getRowData(nRow);
		console.log('rowData:', rowData);      
		
		fn_viewSetData(rowData);
    	fn_setFia3100GridMast('DETAIL');
    	fn_setFia3100GridMast('BOOK');
    	fn_setFia3100GridMast('LAND');
    	
        SBUxMethod.hide("BTN_btnAcquireQuery");
       	//SBUxMethod.hideTab('idxTab_norm1','SB_TOP_TAB2');
       	
		if(rowData['DEPRECIATE_YN']=='Y'){
			
			SBUxMethod.attr('FM_DEPR_EXP_ACC', 					'disabled', false);
			$('#BTN_FM_DEPR_EXP_ACC').attr('disabled', 			false);
			SBUxMethod.attr('FM_DEPR_EXP_ACC_NAME', 			'disabled', false);
			
			SBUxMethod.attr('FM_ACCUM_DEPR_ACC', 				'disabled', false);
			$('#BTN_FM_ACCUM_DEPR_ACC').attr('disabled', 		false);
			SBUxMethod.attr('FM_ACCUM_DEPR_ACC_NAME', 			'disabled', false);
			
			SBUxMethod.attr('FM_GVSBS_DPCO_ACNT', 			'disabled', false);
			$('#BTN_FM_SUBSIDIES_DEPR_ACC').attr('disabled', 	false);
			SBUxMethod.attr('FM_SUBSIDIES_DEPR_ACC_NAME',	'	disabled', false);
			
			SBUxMethod.attr('FM_GVSBS_DPRC_AT_ACNT', 		'disabled', false);
			$('#BTN_FM_SUBSIDIES_ACCUM_DEPR_ACC').attr('disabled', false);
			SBUxMethod.attr('FM_SUBSIDIES_ACCUM_DEPR_ACC_NAME',	'disabled', false);
			
			SBUxMethod.attr('FM_DEPRECIATION_METHOD_GAAP',		'disabled', false);
			SBUxMethod.attr('FM_DEPRECIATION_PERIOD_GAAP',		'disabled', false);
			SBUxMethod.attr('FM_USEFUL_LIFE_GAAP',				'disabled', false);
			SBUxMethod.attr('FM_SALVAGE_VALUE_GAAP',			'disabled', false);
			SBUxMethod.attr('FM_SALVAGE_RATE_GAAP',				'disabled', false);
 
			SBUxMethod.attr('FM_DEPRECIATION_METHOD_TAX',		'disabled', false);
			SBUxMethod.attr('FM_DEPRECIATION_PERIOD_TAX',		'disabled', false);
			SBUxMethod.attr('FM_USEFUL_LIFE_TAX',				'disabled', false);
			SBUxMethod.attr('FM_SALVAGE_VALUE_TAX',				'disabled', false);
			SBUxMethod.attr('FM_SALVAGE_RATE_TAX',				'disabled', false);
 
			SBUxMethod.attr('FM_DEPRECIATION_METHOD_IFRS',		'disabled', false);
			SBUxMethod.attr('FM_DEPRECIATION_PERIOD_IFRS',		'disabled', false);
			SBUxMethod.attr('FM_USEFUL_LIFE_IFRS',				'disabled', false);
			SBUxMethod.attr('FM_SALVAGE_VALUE_IFRS',			'disabled', false);
			SBUxMethod.attr('FM_SALVAGE_RATE_IFRS',				'disabled', false);
			
		} else {
			
			SBUxMethod.attr('FM_DEPR_EXP_ACC', 					'disabled', true);
			$('#BTN_FM_DEPR_EXP_ACC').attr('disabled', 			true);
			SBUxMethod.attr('FM_DEPR_EXP_ACC_NAME', 			'disabled', true);
			
			SBUxMethod.attr('FM_ACCUM_DEPR_ACC', 				'disabled', true);
			$('#BTN_FM_ACCUM_DEPR_ACC').attr('disabled', 		true);
			SBUxMethod.attr('FM_ACCUM_DEPR_ACC_NAME', 			'disabled', true);
			
			SBUxMethod.attr('FM_GVSBS_DPCO_ACNT', 			'disabled', true);
			$('#BTN_FM_SUBSIDIES_DEPR_ACC').attr('disabled', 	true);
			SBUxMethod.attr('FM_SUBSIDIES_DEPR_ACC_NAME',	'	disabled', true);
			
			SBUxMethod.attr('FM_GVSBS_DPRC_AT_ACNT', 		'disabled', true);
			$('#BTN_FM_SUBSIDIES_ACCUM_DEPR_ACC').attr('disabled', true);
			SBUxMethod.attr('FM_SUBSIDIES_ACCUM_DEPR_ACC_NAME',	'disabled', true);
			
			SBUxMethod.attr('FM_DEPRECIATION_METHOD_GAAP',		'disabled', true);
			SBUxMethod.attr('FM_DEPRECIATION_PERIOD_GAAP',		'disabled', true);
			SBUxMethod.attr('FM_USEFUL_LIFE_GAAP',				'disabled', true);
			SBUxMethod.attr('FM_SALVAGE_VALUE_GAAP',			'disabled', true);
			SBUxMethod.attr('FM_SALVAGE_RATE_GAAP',				'disabled', true);
 
			SBUxMethod.attr('FM_DEPRECIATION_METHOD_TAX',		'disabled', true);
			SBUxMethod.attr('FM_DEPRECIATION_PERIOD_TAX',		'disabled', true);
			SBUxMethod.attr('FM_USEFUL_LIFE_TAX',				'disabled', true);
			SBUxMethod.attr('FM_SALVAGE_VALUE_TAX',				'disabled', true);
			SBUxMethod.attr('FM_SALVAGE_RATE_TAX',				'disabled', true);
 
			SBUxMethod.attr('FM_DEPRECIATION_METHOD_IFRS',		'disabled', true);
			SBUxMethod.attr('FM_DEPRECIATION_PERIOD_IFRS',		'disabled', true);
			SBUxMethod.attr('FM_USEFUL_LIFE_IFRS',				'disabled', true);
			SBUxMethod.attr('FM_SALVAGE_VALUE_IFRS',			'disabled', true);
			SBUxMethod.attr('FM_SALVAGE_RATE_IFRS',				'disabled', true);
		}    
    }     
    
    //상세정보 보기
    function fn_viewFia3100GridMastReload(idx) {
    	
    	Fia3100GridMast.setRow(idx);
        let rowData = Fia3100GridMast.getRowData(idx);
		//console.log(rowData);        
		
		fn_viewSetData(rowData);
    	fn_setFia3100GridMast('DETAIL');
    	fn_setFia3100GridMast('BOOK');
    	fn_setFia3100GridMast('LAND');
    }
    
    //상세정보 컴포넌트에 셋팅
    function fn_viewSetData(obj) {
    	console.log('obj:', obj);
    	gfnma_uxDataSet2('#dataArea0', obj, '', 'FM_', '');
    }
    
    /**
     * 목록 가져오기
     */
    const fn_setFia3100GridMast = async function(wtype) {
    	
		let p_site_code	= '';
		
		let list2 	= Fia3100GridDetail02.getOrgGridDataAll();
		let nRow2 	= Fia3100GridDetail02.getRow();
		let rowData2 = '';
		if (nRow2 > 0) {
			rowData2 = Fia3100GridDetail02.getRowData(nRow2);
		}
		
    	if(wtype=='LIST'){
    		if(!fn_validationFindArea()){
    			return;
    		}
    	} else if(wtype=='ACQ_LIST'){
    		if(!fn_validationDetailTab2()){
    			return;
    		}
    	}
    	
    	if(wtype=='ACQ_LIST'){
    		p_site_code =  gfnma_nvl(SBUxMethod.get("FM_SITE_CODE")); 
    	} else if(wtype=='ACQUIRE'){
    		if(list2.length > 0){
    			if (nRow2 < 1) {
    	            return;
    			}
    			p_site_code = gfnma_nvl(rowData2['SITE_CODE']);
    		} else {
    			p_site_code = gfnma_nvl(SBUxMethod.get("FM_SITE_CODE")); 
    		}
    	} else {
			p_site_code = gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE")); 
    	}

		Fia3100GridMast.clearStatus();

		let p_sch_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_sch_acct_rule_code		= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_sch_actual_flag_p			= gfnma_nvl(SBUxMethod.get("SCH_ACTUAL_FLAG_P"));
		let p_sch_depreciation_type		= gfnma_nvl(SBUxMethod.get("SCH_DEPRECIATION_TYPE"));
		let p_sch_asset_category		= gfnma_nvl(SBUxMethod.get("SCH_ASSET_CATEGORY"));
		let p_sch_asset_level2			= gfnma_nvl(SBUxMethod.get("SCH_ASSET_LEVEL2"));
		let p_sch_asset_level3			= gfnma_nvl(SBUxMethod.get("SCH_ASSET_LEVEL3"));
		let p_sch_dept_code				= (wtype=='ACQ_LIST') ? gfnma_nvl(SBUxMethod.get("FM_DEPT_CODE")) : gfnma_nvl(SBUxMethod.get("SCH_DEPT_CODE"));
		let p_sch_cost_center_code		= gfnma_nvl(SBUxMethod.get("SCH_COST_CENTER_CODE"));
		let p_sch_base_date				= gfnma_nvl(SBUxMethod.get("SCH_BASE_DATE"));
		let p_sch_asset_no				= (wtype=='LIST') ? '' : gfnma_nvl(SBUxMethod.get("FM_ASSET_NO"));
		let p_fm_cs_code				= gfnma_nvl(SBUxMethod.get("FM_CNPT_CD"));
		let p_fm_acquire_date_fr		= gfnma_nvl(SBUxMethod.get("FM_ACQUIRE_DATE_FR"));
		let p_fm_acquire_date_to		= gfnma_nvl(SBUxMethod.get("FM_ACQUIRE_DATE_TO"));
		let p_fm_emp_code				= gfnma_nvl(SBUxMethod.get("FM_EMP_CD"));
		let p_sch_description			= gfnma_nvl(SBUxMethod.get("SCH_DESCRIPTION"));
		
		let p_sch_asset_acquire_no		= '';
		if(wtype=='ACQUIRE'){
			if(list2 > 0){
				p_sch_asset_acquire_no = gfnma_nvl(rowData2['ASSET_ACQUIRE_NO']);
			} else {
				p_sch_asset_acquire_no = '';
			}
		} else {
				p_sch_asset_acquire_no = '';
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE       	: p_sch_fi_org_code
			,V_P_ACCT_RULE_CODE 	: p_sch_acct_rule_code	   
			,V_P_ACTUAL_FLAG      	: p_sch_actual_flag_p
			,V_P_DEPRECIATION_TYPE	: p_sch_depreciation_type
			,V_P_ASSET_CATEGORY    	: p_sch_asset_category
			,V_P_ASSET_LEVEL2      	: p_sch_asset_level2
			,V_P_ASSET_LEVEL3      	: p_sch_asset_level3
			,V_P_SITE_CODE         	: p_site_code
			,V_P_DEPT_CODE         	: p_sch_dept_code
			,V_P_COST_CENTER_CODE  	: p_sch_cost_center_code
			,V_P_BASE_DATE         	: p_sch_base_date
			,V_P_ASSET_NO          	: p_sch_asset_no
			,V_P_CS_CODE           	: p_fm_cs_code
			,V_P_ACQUIRE_DATE_FR   	: p_fm_acquire_date_fr
			,V_P_ACQUIRE_DATE_TO   	: p_fm_acquire_date_to
			,V_P_EMP_CODE          	: p_fm_emp_code
			,V_DESCRIPTION         	: p_sch_description
			,V_P_ASSET_ACQUIRE_NO  	: p_sch_asset_acquire_no
 
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectFia3100List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '7',
        	params				: gfnma_objectToString(paramObj, true)
		});
 
        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {
 
  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;
 
  	        	var tlist = [];
  	        	
				if(wtype=='LIST'){
					
	  	        	data.cv_1.forEach((item, index) => {
	  					const msg = {
							ASSET_NAME						: gfnma_nvl2(item.ASST_NM),	
							DEPRECIATION_METHOD_IFRS		: gfnma_nvl2(item.DPRC_MTHD_IFRS),	
							DEPR_EXP_ACC_NAME				: gfnma_nvl2(item.DEPR_EXP_ACC_NAME),	
							DEPRECIATION_PERIOD_GAAP		: gfnma_nvl2(item.DPRC_PRD_GAAP),	
							OUT_ACCUMULATED_DEPRECIATION	: gfnma_nvl2(item.DSPSL_ACML_DPRC),	
							SALVAGE_RATE_IFRS				: gfnma_nvl2(item.RMN_RT_IFRS),	
							ASSET_CATEGORY_NAME				: gfnma_nvl2(item.ASSET_CATEGORY_NAME),	
							BOOK_VALUE						: gfnma_nvl2(item.BKVL),	
							ASSET_ACC_NAME					: gfnma_nvl2(item.ASSET_ACC_NAME),	
							QTY								: gfnma_nvl2(item.QTY),	
							CATEGORY2						: gfnma_nvl2(item.CTRGY2),	
							FI_ORG_CODE						: gfnma_nvl2(item.ACNTG_OGNZ_CD),	
							CATEGORY3						: gfnma_nvl2(item.CTRGY3),	
							CATEGORY4						: gfnma_nvl2(item.CTRGY4),	
							CATEGORY5						: gfnma_nvl2(item.CTRGY5),	
							OUT_SUBSIDIES_AMOUNT			: gfnma_nvl2(item.DSPSL_GVSBS_AMT),	
							MEMO							: gfnma_nvl2(item.MEMO),	
							COMP_CODE						: gfnma_nvl2(item.CO_CD),	
							SALVAGE_RATE_TAX				: gfnma_nvl2(item.RMN_RT_TAX),	
							DEPRECIATION_METHOD_TAX			: gfnma_nvl2(item.DPRC_MTHD_TAX),	
							SUBSIDIES_ACC_NAME				: gfnma_nvl2(item.SUBSIDIES_ACC_NAME),	
							CATEGORY1						: gfnma_nvl2(item.CTRGY1),	
							ASSET_CATEGORY					: gfnma_nvl2(item.ASST_CTGRY),	
							ACCT_RULE_CODE					: gfnma_nvl2(item.GAAP_CD),	
							ACCT_RULE_NAME					: gfnma_nvl2(item.ACCT_RULE_NAME),	
							OUT_ACQUISITION_AMOUNT			: gfnma_nvl2(item.DSPSL_ACQS_AMT),	
							USEFUL_LIFE_MM_TAX				: gfnma_nvl2(item.SVLF_MM_TAX),	
							DEPT_CODE						: gfnma_nvl2(item.DEPT_CD),	
							SALVAGE_VALUE_GAAP				: gfnma_nvl2(item.RMN_AMT_GAAP),	
							PROJECT_CODE					: gfnma_nvl2(item.PJT_CD),	
							DEPRECIATE_YN					: gfnma_nvl2(item.DPRC_YN),	
							CAPITAL_EXPENDITURE				: gfnma_nvl2(item.CPEXPND_ACML_AMT),	
							DEPR_EXP_ACC					: gfnma_nvl2(item.DPCO_ACNT),	
							COST_CENTER_NAME				: gfnma_nvl2(item.CSTCD_NM),	
							CS_NAME							: gfnma_nvl2(item.CNPT_NM),	
							SUBSIDIES_AMOUNT				: gfnma_nvl2(item.GVSBS_AMT),	
							DEPRECIATE_START_YYYYMM			: gfnma_nvl2(item.DPRC_BGNG_YM),	
							DEPRECIATION_PERIOD_IFRS		: gfnma_nvl2(item.DPRC_PRD_IFRS),	
							ASSET_ACQUIRE_NO				: gfnma_nvl2(item.ASST_ACQS_NO),	
							ACCUM_DEPR_ACC					: gfnma_nvl2(item.ACML_DPRC_ACNT),	
							LOCATION_NAME					: gfnma_nvl2(item.LOCTN_NM),	
							SALVAGE_RATE_GAAP				: gfnma_nvl2(item.RMN_RT_GAAP),	
							EQUIPMENT_NO					: gfnma_nvl2(item.EQPMNT_NO),	
							DEPT_NAME						: gfnma_nvl2(item.DEPT_NM),	
							OUT_SUBSIDIES_ACC_DEPRECIATION	: gfnma_nvl2(item.DSPSL_GVSBS_ACML_DPRC_AMT),	
							ASSET_LEVEL2_NAME				: gfnma_nvl2(item.ASSET_LEVEL2_NAME),	
							ACCUM_DEPR_ACC_NAME				: gfnma_nvl2(item.ACCUM_DEPR_ACC_NAME),	
							COST_CENTER_CODE				: gfnma_nvl2(item.ACCUM_DEPR_ACC_NAME),	
							USEFUL_LIFE_MM_IFRS				: gfnma_nvl2(item.SVLF_MM_IFRS),	
							FUNCTIONAL_AMOUNT				: gfnma_nvl2(item.CNVS_AMT),	
							CURRENCY_CODE					: gfnma_nvl2(item.CRN_CD),	
							PROJECT_NAME					: gfnma_nvl2(item.PJT_NM),	
							SALVAGE_VALUE_IFRS				: gfnma_nvl2(item.RMN_AMT_IFRS),	
							DEPRECIATE_START_YYYYMM_IFRS	: gfnma_nvl2(item.DPRC_BGNG_YM_IFRS),	
							SUBSIDIES_ACCUM_DEPR_ACC_NAME	: gfnma_nvl2(item.SUBSIDIES_ACCUM_DEPR_ACC_NAME),	
							LOCATION_CODE					: gfnma_nvl2(item.LOCTN_CD),	
							ACCUMULATED_DEPRECIATION		: gfnma_nvl2(item.ACML_DPRC_AMT),	
							SALVAGE_VALUE_TAX				: gfnma_nvl2(item.RMN_AMT_TAX),	
							SUBSIDIES_ACCOUNT				: gfnma_nvl2(item.GVSBS_ACNT),	
							CS_CODE							: gfnma_nvl2(item.CNPT_CD),	
							SUBSIDIES_ACCUM_DEPR_ACC		: gfnma_nvl2(item.GVSBS_DPRC_AT_ACNT),	
							ASSET_LEVEL3					: gfnma_nvl2(item.ASST_SCLSF),	
							USEFUL_LIFE_TAX					: gfnma_nvl2(item.SVLF_TAX),	
							ASSET_LEVEL2					: gfnma_nvl2(item.ASST_MCLSF),	
							USEFUL_LIFE_GAAP				: gfnma_nvl2(item.SVLF_GAAP),	
							USEFUL_LIFE_MM_GAAP				: gfnma_nvl2(item.SVLF_MM_GAAP),	
							SUBSIDIES_DEPR_ACC				: gfnma_nvl2(item.GVSBS_DPCO_ACNT),	
							ASSET_LEVEL3_NAME				: gfnma_nvl2(item.ASSET_LEVEL3_NAME),	
							SITE_CODE						: gfnma_nvl2(item.SITE_CD),	
							SITE_NAME						: gfnma_nvl2(item.SITE_NM),	
							ACQUIRE_DATE					: gfnma_nvl2(item.ACQS_FRST_YMD),	
							ASSET_ACCOUNT					: gfnma_nvl2(item.ASST_ACNT_CD),	
							SUBSIDIES_DEPR_ACC_NAME			: gfnma_nvl2(item.SUBSIDIES_DEPR_ACC_NAME),	
							ASSET_NO						: gfnma_nvl2(item.ASST_NO),	
							SUBSIDIES_ACC_DEPRECIATION		: gfnma_nvl2(item.SUBSIDIES_ACC_DEPRECIATION),	
							USEFUL_LIFE_IFRS				: gfnma_nvl2(item.SVLF_IFRS),	
							ACTUAL_FLAG						: gfnma_nvl2(item.ACTL_FLAG),	
							DEPRECIATION_METHOD_GAAP		: gfnma_nvl2(item.DPRC_MTHD_GAAP),	
							DEPRECIATION_PERIOD_TAX			: gfnma_nvl2(item.DPRC_PRD_TAX),	
	  					}
	  					tlist.push(msg);
	  					totalRecordCount ++;
	  				});					
					
					jsonFia3100Mast.length 	= 0;
					jsonFia3100Mast 		= JSON.parse(JSON.stringify(tlist));
	        		Fia3100GridMast.rebuild();
	  	        	//deatil grid 첫번째 행 선택
	 				if(jsonFia3100Mast.length > 0){
	 					fn_viewFia3100GridMastReload(1);					
	 				}
				} else if(wtype=='DETAIL'){
					
	  	        	data.cv_2.forEach((item, index) => {
	  					const msg = {
	  							
							ACCT_RULE_CODE					: gfnma_nvl2(item.GAAP_CD),	
							ACCT_RULE_NAME					: gfnma_nvl2(item.ACCT_RULE_NAME),
							ACQUIRE_QTY						: gfnma_nvl2(item.ACQS_QTY),
							ASSET_ACQUIRE_NO				: gfnma_nvl2(item.ASST_ACQS_NO),
							ASSET_NAME						: gfnma_nvl2(item.ASST_NM),	
							ASSET_SEQ						: gfnma_nvl2(item.AST_SEQ),	
							ASSET_SPEC						: gfnma_nvl2(item.AST_SPCFCT),	
							COST_CENTER_CODE				: gfnma_nvl2(item.CSTCD_CD),	
							COST_CENTER_NAME				: gfnma_nvl2(item.CSTCD_NM),	
							CURRENCY_CODE					: gfnma_nvl2(item.CRN_CD),	
							DEPT_CODE						: gfnma_nvl2(item.DEPT_CD),	
							DEPT_NAME						: gfnma_nvl2(item.DEPT_NM),	
							EXCHANGE_RATE					: gfnma_nvl2(item.EXCHRT),	
							FUNCTIONAL_AMOUNT				: gfnma_nvl2(item.CNVS_AMT),	
							MEMO							: gfnma_nvl2(item.MEMO),	
							ONHAND_QTY						: gfnma_nvl2(item.INVT_QTY),	
							ORIGINAL_AMOUNT					: gfnma_nvl2(item.ORGNL_AMT),	
							SITE_CODE						: gfnma_nvl2(item.SITE_CD),	
							SITE_NAME						: gfnma_nvl2(item.SITE_NM),	
							TXN_DATE						: gfnma_nvl2(item.TRSC_DT),	
							TXN_TYPE						: gfnma_nvl2(item.TRSC_TYPE),	
							UNIT_CODE						: gfnma_nvl2(item.UNIT_CD),	
	  					}
	  					tlist.push(msg);
	  					totalRecordCount ++;
	  				});		
	  	        	
					jsonFia3100Detail01.length 	= 0;
					jsonFia3100Detail01			= JSON.parse(JSON.stringify(tlist));
					Fia3100GridDetail01.rebuild();
		    		fn_setFia3100GridDetail01Total();    	
		    		
				} else if(wtype=='ACQ_LIST'){
					
	  	        	data.cv_5.forEach((item, index) => {
	  					const msg = {
	  							
	  						SITE_CODE						: gfnma_nvl2(item.SITE_CD),	
	  						SITE_NAME						: gfnma_nvl2(item.SITE_NM),
	  						ASSET_ACQUIRE_NO				: gfnma_nvl2(item.ASST_ACQS_NO),
							ASSET_NAME						: gfnma_nvl2(item.ASST_NM),	
							ASSET_SPEC						: gfnma_nvl2(item.AST_SPCFCT),	
							ASSET_QTY						: gfnma_nvl2(item.AST_DSPSL_QTY),	
							UNIT_CODE						: gfnma_nvl2(item.UNIT_CD),	
							ACQUIRE_TYPE					: gfnma_nvl2(item.ACQS_TYPE),	
							ASSET_CATEGORY					: gfnma_nvl2(item.ASST_CTGRY),	
							ASSET_LEVEL2					: gfnma_nvl2(item.ASST_MCLSF),
							ASSET_LEVEL3					: gfnma_nvl2(item.ASST_SCLSF),
							CS_CODE							: gfnma_nvl2(item.CNPT_CD),
							CS_NAME							: gfnma_nvl2(item.CNPT_NM),
							DEPT_CODE						: gfnma_nvl2(item.DEPT_CD),
							DEPT_NAME						: gfnma_nvl2(item.DEPT_NM),
							EMP_CODE						: gfnma_nvl2(item.EMP_CD),
							EMP_NAME						: gfnma_nvl2(item.EMP_NM),
							COST_CENTER_CODE				: gfnma_nvl2(item.CSTCD_CD),
							COST_CENTER_NAME				: gfnma_nvl2(item.CSTCD_NM),
							PROJECT_CODE					: gfnma_nvl2(item.PJT_CD),
							PROJECT_NAME					: gfnma_nvl2(item.PJT_NM),
							CURRENCY_CODE					: gfnma_nvl2(item.CRN_CD),
							EXCHANGE_RATE					: gfnma_nvl2(item.EXCHRT),
							ASSET_PRICE						: gfnma_nvl2(item.AST_UNTPRC),
							ORIGINAL_AMOUNT					: gfnma_nvl2(item.ORGNL_AMT),
							FUNCTIONAL_AMOUNT				: gfnma_nvl2(item.CNVS_AMT),
							ASSET_ACQUIRE_NO				: gfnma_nvl2(item.ASST_ACQS_NO),
							ACQUIRE_SEQ						: gfnma_nvl2(item.ACQS_SEQ),
							ACQUIRE_DATE					: gfnma_nvl2(item.ACQS_FRST_YMD),
							MEMO							: gfnma_nvl2(item.MEMO),
							COMP_CODE						: gfnma_nvl2(item.CO_CD),
							FI_ORG_CODE						: gfnma_nvl2(item.ACNTG_OGNZ_CD),
							ACCT_RULE_CODE					: gfnma_nvl2(item.GAAP_CD),
							ACCT_RULE_NAME					: gfnma_nvl2(item.ACCT_RULE_NAME),
	  					}
	  					tlist.push(msg);
	  					totalRecordCount ++;
	  				});		
	  	        	
					jsonFia3100Detail02.length 	= 0;
					jsonFia3100Detail02			= JSON.parse(JSON.stringify(tlist));
					Fia3100GridDetail02.rebuild();
					
				} else if(wtype=='BOOK'){
					
	  	        	data.cv_3.forEach((item, index) => {
	  					const msg = {
	  							
							ACCT_RULE_CODE					: gfnma_nvl2(item.GAAP_CD),	
							ACCT_RULE_NAME					: gfnma_nvl2(item.ACCT_RULE_NAME),
							ACQ_DEPR_AMT					: gfnma_nvl2(item.DPCO_AMT),
							ASSET_CATEGORY					: gfnma_nvl2(item.ASST_CTGRY),
							ASSET_LEVEL2					: gfnma_nvl2(item.ASST_MCLSF),
							ASSET_LEVEL3					: gfnma_nvl2(item.ASST_SCLSF),
							ASSET_NAME						: gfnma_nvl2(item.ASST_NM),	
							ASSET_NO						: gfnma_nvl2(item.ASST_NO),	
							BEGIN_ACQUISITION_AMOUNT		: gfnma_nvl2(item.BSC_ACQS_AMT),	
							BEGIN_SUBSIDIES_AMOUNT			: gfnma_nvl2(item.BSS_GVSBS_AMT),	
							CONFIRM_FLAG					: gfnma_nvl2(item.CFMTN_FLAG),	
							DEPRECIATION_METHOD				: gfnma_nvl2(item.DPRC_MTHD),	
							DEPRECIATION_PERIOD				: gfnma_nvl2(item.DPRC_INTRVL),	
							DEPRECIATION_RATE				: gfnma_nvl2(item.DPRT),	
							DEPRECIATION_TYPE				: gfnma_nvl2(item.DPRC_TYPE),	
							DEPRECIATION_YYYYMM				: gfnma_nvl2(item.DPRC_YM),	
							DOC_ID							: gfnma_nvl2(item.SLIP_ID),	
							END_ACCUM_DEPR					: gfnma_nvl2(item.ACML_DPRC_EBLNC),	
							END_ACQUISITION_AMOUNT			: gfnma_nvl2(item.ACQS_AMT_EBLNC),	
							END_SUBSIDES_ACCUM_DEPR			: gfnma_nvl2(item.GVSBS_DPRC_ACML_EBLNC),	
							END_SUBSIDIES_AMOUNT			: gfnma_nvl2(item.GVSBS_AMT_EBLNC),	
							IN_ACQUISITION_AMOUNT			: gfnma_nvl2(item.THTM_ACQS_AMT),	
							IN_SUBSIDIES_AMOUNT				: gfnma_nvl2(item.THTM_ACQS_GVSBS_AMT),	
							OUT_ACCUM_DEPR					: gfnma_nvl2(item.DSPSL_ACML_DPRC),	
							OUT_ACQUISITION_AMOUNT			: gfnma_nvl2(item.DSPSL_ACQS_AMT),	
							OUT_ACQ_DEPR					: gfnma_nvl2(item.DSPSL_AST_DPCO),	
							OUT_SUBSIDIES_ACCUM_DEPR		: gfnma_nvl2(item.DSPSL_GVSBS_ACML_DPRC_AMT),	
							OUT_SUBSIDIES_AMOUNT			: gfnma_nvl2(item.DSPSL_GVSBS_AMT),	
							OUT_SUBSIDIES_DEPR				: gfnma_nvl2(item.DSPSL_GVSBS_DPRC_AMT),	
							SUBSIDIES_DEPR_AMT				: gfnma_nvl2(item.GVSBS_DPCO_AMT),	
							USEFUL_LIFE						: gfnma_nvl2(item.SVLF),	
							USEFUL_LIFE_MM					: gfnma_nvl2(item.SVLF_MM),	
	  					}
	  					tlist.push(msg);
	  					totalRecordCount ++;
	  				});		
	  	        	
					jsonFia3100Detail03.length 	= 0;
					jsonFia3100Detail03			= JSON.parse(JSON.stringify(tlist));
					Fia3100GridDetail03.rebuild();
					
				} else if(wtype=='LAND'){
					
	  	        	data.cv_4.forEach((item, index) => {
	  					const msg = {
	  						BASE_YYYYMM				: gfnma_nvl2(item.CRTR_YM),	
	  						UNIT_PRICE				: gfnma_nvl2(item.UNIT_PRC),
	  						AREA					: gfnma_nvl2(item.AREA),
	  						AREA_UOM				: gfnma_nvl2(item.AREA_UNIT),
	  						AMOUNT					: gfnma_nvl2(item.AMT),
	  						ADDRESS					: gfnma_nvl2(item.ADDR),
	  						ETC						: gfnma_nvl2(item.ETC),
	  						STATE_TYPE				: 'U',			
	  					}
	  					tlist.push(msg);
	  					totalRecordCount ++;
	  				});		
	  	        	
					jsonFia3100Detail04.length 	= 0;
					jsonFia3100Detail04			= JSON.parse(JSON.stringify(tlist));
					Fia3100GridDetail04.rebuild();
		    		fn_setFia3100GridDetail04Total();    	
		    		
				} else if(wtype=='ACQUIRE'){
					
					if(data.cv_6 && data.cv_6.length > 0){
				    	gfnma_uxDataSet2('#dataArea0', data.cv_6[0], '', 'FM_', '');
					}
					for (var i = 0; i < data.cv_7.length; i++) {
						var tobj = data.cv_7[i];
// 			            var tidx = Fia3100GridDetail01.getRows();
// 			    		Fia3100GridDetail01.insertRow((tidx-1), 'below');
// 		                Fia3100GridDetail01.setCellData((tidx-1), 1, 	tobj['ACQUIRE_DATE'], true, true);
						jsonFia3100Detail01.push(tobj);
					}
					Fia3100GridDetail01.rebuild();
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
    
    function fn_createFia3100GridDetail01() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_detail01';
	    SBGridProperties.id 				= 'Fia3100GridDetail01';
	    SBGridProperties.jsonref 			= 'jsonFia3100Detail01';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    //SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
// 	    SBGridProperties.frozenbottomrows 	= 1;
//         SBGridProperties.total 				= {
//                 type 		: 'grand',
//                 position	: 'bottom',
//                 columns		: {
//                     standard : [0],
//                     sum : [9]
//                 },
//                 grandtotalrow : {
//                     titlecol 		: 7,
//                     titlevalue		: '합계',
//                     style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
//                     stylestartcol	: 0
//                 },
//                 datasorting	: true,
//         };
        SBGridProperties.columns = [
            {caption: ["취득일자"],			ref: 'TXN_DATE', 				type:'input',  		width:'100px', 		style:'text-align:left'},
            {caption: ["취득유형"],			ref: 'TXN_TYPE', 	 		  	type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["취득번호"],			ref: 'ASSET_ACQUIRE_NO', 		type:'input', 	 	width:'150px',  	style:'text-align:left'},
            {caption: ["연번"], 			ref: 'ASSET_SEQ',  				type:'input',  		width:'100px',  	style:'text-align:left'},
            
            {caption: ["자산명"],			ref: 'ASSET_NAME', 			  	type:'input',  		width:'200px',  	style:'text-align:left'},
            {caption: ["규격"],				ref: 'ASSET_SPEC',    			type:'input',  		width:'200px',  	style:'text-align:left'},
            {caption: ["통화"],				ref: 'CURRENCY_CODE',  			type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["환율"],				ref: 'EXCHANGE_RATE',  			type:'input',  		width:'100px',  	style:'text-align:left'},
            
            {caption: ["금액(통화)"],		ref: 'ORIGINAL_AMOUNT', 		type:'input',  		width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["금액(전표)"],		ref: 'FUNCTIONAL_AMOUNT', 		type:'input',  		width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["취득수량"],			ref: 'ACQUIRE_QTY',    			type:'input',  		width:'170px',  	style:'text-align:left'},
            {caption: ["재고량"],			ref: 'ONHAND_QTY',    			type:'input',  		width:'150px',  	style:'text-align:left'},
            
            {caption: ["단위"],				ref: 'UNIT_CODE', 				type:'combo',  		width:'100px',  	style:'text-align:left', disabled: false,
            	typeinfo: {
					ref			: 'jsonUnitCode',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
            	}
            },
            
            {caption: ["사업장"],			ref: 'SITE_CODE', 				type:'combo',  		width:'170px',  	style:'text-align:left', disabled: false,
            	typeinfo: {
					ref			: 'jsonSiteCode',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
            	}
            },
            
            {caption: ["관리부서"], 				ref: 'DEPT_NAME', 				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn1',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup1(event, " + nRow + ", " + nCol + ")'>…</button>";
				}	
            },
            {caption: ["관리부서코드"],				ref: 'DEPT_CODE', 				type:'input',		width:'100px',  	style:'text-align:left', hidden:true},
            
            {caption: ["원가중심점명"],				ref: 'COST_CENTER_NAME', 		type:'output',  	width:'170px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn2',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup2(event, " + nRow + ", " + nCol + ")'>…</button>";
				}	
            },
            {caption: ["관리부서코드"],				ref: 'COST_CENTER_CODE', 		type:'input',		width:'100px',  	style:'text-align:left', hidden:true},
            
            {caption: ["비고"],						ref: 'MEMO',    				type:'input',  		width:'300px',  	style:'text-align:left'},
        ];
 
        Fia3100GridDetail01 = _SBGrid.create(SBGridProperties);
        Fia3100GridDetail01.bind('valuechanged', 	'fn_comboValFig3100GridDetail01Event')
    }
    
    //콤보, 인풋박스 이벤트
    function fn_comboValFig3100GridDetail01Event() {
        let nRow = Fia3100GridDetail01.getRow(); 
        let nCol = Fia3100GridDetail01.getCol(); 
 
        let rowData = Fia3100GridDetail01.getRowData(nRow);
        
        if (Fia3100GridDetail01.getRefOfCol(nCol) == 'FUNCTIONAL_AMOUNT') {	
            let cellValue = Fia3100GridDetail01.getCellData(nRow, nCol); 	
        	console.log('FUNCTIONAL_AMOUNT:', cellValue);
        	fn_setFia3100GridDetail01Total();            
        } else if (Fia3100GridDetail01.getRefOfCol(nCol) == 'ACQUIRE_QTY') {	
            Fia3100GridDetail01.setCellData(nRow, 11, 	rowData['ACQUIRE_QTY'], true, true);
        }
    }    
    
    function fn_createFia3100GridDetail02() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_detail02';
	    SBGridProperties.id 				= 'Fia3100GridDetail02';
	    SBGridProperties.jsonref 			= 'jsonFia3100Detail02';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
	    //SBGridProperties.explorerbar 		= 'sortmove';
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
            
            {caption: ["취득가액"],			ref: 'EXCHANGE_RATE',  			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["환산금액"],			ref: 'ORIGINAL_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
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
	    //SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
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
            
            {caption: ["기초취득가액"],				ref: 'BEGIN_ACQUISITION_AMOUNT',  	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["기초보조금"],				ref: 'BEGIN_SUBSIDIES_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["당기취득금액"],				ref: 'IN_ACQUISITION_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["당기취득보조금"],			ref: 'IN_SUBSIDIES_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["감가상각비"],				ref: 'ACQ_DEPR_AMT',  				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["보조금상각비"],				ref: 'SUBSIDIES_DEPR_AMT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["처분취득가액"],				ref: 'OUT_ACQUISITION_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["처분보조금"],				ref: 'OUT_SUBSIDIES_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["처분자산상각비"],			ref: 'OUT_ACQ_DEPR',  				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["처분자산보조금상각비"],		ref: 'OUT_SUBSIDIES_DEPR', 			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["처분자산상각누계액"],		ref: 'OUT_ACCUM_DEPR', 				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["처분자산보조금상각누계액"],	ref: 'OUT_SUBSIDIES_ACCUM_DEPR', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["기말취득가액"],				ref: 'END_ACQUISITION_AMOUNT',		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["기말보조금"],				ref: 'END_SUBSIDIES_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["기말상각누계액"],			ref: 'END_ACCUM_DEPR', 				type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            {caption: ["기말보조금상각누계액"],		ref: 'END_SUBSIDES_ACCUM_DEPR', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},  
            
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
	    //SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
//	    SBGridProperties.frozenbottomrows 	= 1;
//         SBGridProperties.total 				= {
//                 type 		: 'grand',
//                 position	: 'bottom',
//                 columns		: {
//                     standard : [0],
//                     sum : [5]
//                 },
//                 grandtotalrow : {
//                     titlecol 		: 4,
//                     titlevalue		: '합계',
//                     style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
//                     stylestartcol	: 0
//                 },
//                 datasorting	: true,
//         };
        SBGridProperties.columns = [
         	{caption: ['기준월'],     			ref: 'BASE_YYYYMM', 			type:'datepicker',	width:'100px',   	style:'text-align:left',	typeinfo : {dateformat :"yyyy-mm", calendartype :"yearmonth", displayui:true}},
            
            {caption: ["공시지가"],				ref: 'UNIT_PRICE',  		 	type:'input',	  	width:'150px',  	style:'text-align:left'},
            {caption: ["면적"],					ref: 'AREA', 					type:'input', 	 	width:'100px',  	style:'text-align:left'},
            
            {caption: ["단위"],					ref: 'AREA_UOM', 				type:'combo',  		width:'100px',  	style:'text-align:left', disabled: false,
            	typeinfo: {
					ref			: 'jsonAreaUom',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
            	}
            },
            
            {caption: ["공시지가금액"],			ref: 'AMOUNT',				  	type:'input',  		width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}}, 
            {caption: ["주소"],					ref: 'ADDRESS', 				type:'input',  		width:'350px',  	style:'text-align:left'},
            {caption: ["비고"],					ref: 'ETC', 					type:'output',  	width:'400px',  	style:'text-align:left'},
        ];
 
        Fia3100GridDetail04 = _SBGrid.create(SBGridProperties);
        Fia3100GridDetail04.bind('valuechanged', 	'fn_comboValFig3100GridDetail04Event')
    }
    
    //콤보, 인풋박스 이벤트
    function fn_comboValFig3100GridDetail04Event() {
        let nRow = Fia3100GridDetail04.getRow(); 
        let nCol = Fia3100GridDetail04.getCol(); 
 
        let rowData = Fia3100GridDetail04.getRowData(nRow);
    	console.log('rowData:', rowData);
        
        if (Fia3100GridDetail04.getRefOfCol(nCol) == 'AMOUNT') {	
        	fn_setFia3100GridDetail04Total();            
        }    	
        
        if (Fia3100GridDetail04.getRefOfCol(nCol) == 'UNIT_PRICE' || Fia3100GridDetail04.getRefOfCol(nCol) == 'AREA') {	
            //var cellValue = Fia3100GridDetail04.getCellData(nRow, nCol); 	
            // 재고량에 취득수량을 입력
            let numUnit_Price 	= 0;
            let numArea			= 0;            
            
            if(!rowData['UNIT_PRICE']){
            	numUnit_Price 	= 0;
            } else {
            	numUnit_Price 	= Number(rowData['UNIT_PRICE']);
            }
            if(!rowData['AREA']){
            	numArea 		= 0;
            } else {
            	numArea 		= Number(rowData['AREA']);
            }
            Fia3100GridDetail04.setCellData(row, 4, (numUnit_Price * numArea), true, true);
        }    	
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
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
       		,whereClause			: param
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: [searchText2, 	searchText1,	""]
            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
            ,width					: '700px'
            ,height					: '400px'
            ,tableHeader			: ["부서코드",		"부서명", 		"사업장"]
            ,tableColumnNames		: ["DEPT_CD",		"DEPT_NM",  	"SITE_NM"]
            ,tableColumnWidths		: ["100px", 		"200px", 		"100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('SCH_DEPT_NAME', data.DEPT_NM);
                SBUxMethod.set('SCH_DEPT_CODE', data.DEPT_CD);
            },
        });
		SBUxMethod.openModal('modal-compopup1');
    }   
    
    /**
     * 자산계정
     */
    var fn_compopup2 = function(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACCOUNT"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACC_NAME"));
        } else if(type=='2'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_DEPR_EXP_ACC"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_DEPR_EXP_ACC_NAME"));
        } else if(type=='3'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_ACCUM_DEPR_ACC"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_ACCUM_DEPR_ACC_NAME"));
        } else if(type=='4'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_GVSBS_ACNT"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_ACC_NAME"));
        } else if(type=='5'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_GVSBS_DPCO_ACNT"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_DEPR_ACC_NAME"));
        } else if(type=='6'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_GVSBS_DPRC_AT_ACNT"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_ACCUM_DEPR_ACC_NAME"));
        }
        
        var replaceText0 	= "_ACNTL_CD_";
        var replaceText1 	= "_ACNT_NM_"; 
        var strWhereClause 	= "AND A.ACNTL_CD LIKE '%" + replaceText0 + "%' AND A.ACNT_NM LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산프로젝트');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["ACNTL_CD", 			"ACNT_NM"]
   			,searchInputValues		: [searchText1, 		searchText2]
			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드", 			"계정명",			"계정(한국어)"]
   			,tableColumnNames		: ["ACNTL_CD", 			"ACNT_NM",			"ACNT_NM_CHN"]	
   			,tableColumnWidths		: ["100px", 			"250px",			"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
		        if(type=='1'){
					SBUxMethod.set('FM_ASSET_ACCOUNT', 				data.APLY_ACNTL_CD);
					SBUxMethod.set('FM_ASSET_ACC_NAME', 			data.ACNT_NM);
		        } else if(type=='2'){
					SBUxMethod.set('FM_DEPR_EXP_ACC', 				data.ACNTL_CD);
					SBUxMethod.set('FM_DEPR_EXP_ACC_NAME', 			data.ACNT_NM);
		        } else if(type=='3'){
					SBUxMethod.set('FM_ACCUM_DEPR_ACC', 			data.APLY_ACNTL_CD);
					SBUxMethod.set('FM_ACCUM_DEPR_ACC_NAME', 		data.ACNT_NM);
		        } else if(type=='4'){
					SBUxMethod.set('FM_GVSBS_ACNT', 			data.APLY_ACNTL_CD);
					SBUxMethod.set('FM_SUBSIDIES_ACC_NAME', 		data.ACNT_NM);
		        } else if(type=='5'){
					SBUxMethod.set('FM_GVSBS_DPCO_ACNT', 		data.APLY_ACNTL_CD);
					SBUxMethod.set('FM_SUBSIDIES_DEPR_ACC_NAME', 	data.ACNT_NM);
		        } else if(type=='6'){
					SBUxMethod.set('FM_GVSBS_DPRC_AT_ACNT', 		data.APLY_ACNTL_CD);
					SBUxMethod.set('FM_SUBSIDIES_ACCUM_DEPR_ACC_NAME', 	data.ACNT_NM);
		        }
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }     
    
    /**
     * 취득처 
     */
    function fn_compopup3() {
    	
        var searchCode 		= gfnma_nvl(SBUxMethod.get('FM_CNPT_CD'));
        var searchName 		= gfnma_nvl(SBUxMethod.get("FM_CNPT_NM"));
        if(!searchCode && !searchName){
        	gfn_comAlert("E0000","찾고자 하는 취득처 코드 혹은 취득처명을 2글자 이상 입력하세요");
        	return;	
        }
        
        var replaceText0 	= "_CNPT_CD_";
        var replaceText1 	= "_CNPT_NM_";
        var strWhereClause 	= "AND CNPT_CD LIKE '%" + replaceText0 + "%' AND CNPT_NM LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COM009'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["코드", 		"명칭"]
  			,searchInputFields		: ["CNPT_CD", 	"CNPT_NM"]
  			,searchInputValues		: [searchCode, 	searchName]
    		,width					: '700px'
    		,height					: '400px'
  			,tableHeader			: ["거래처코드",	"거래처명",	"사업자번호",	"대표자",		"업태",			"종목",			"주소",		"전화",		"팩스"]
  			,tableColumnNames		: ["CNPT_CD", 	 	"CNPT_NM",	"BRNO",	"CEO_NM",	"BZSTAT",	"TPBIZ",	"ADDR",	"TELNO",		"FX_NO"]
  			,tableColumnWidths		: ["100px", 		 "250px",	"100px",		"100px",		"150px",		"200px",		"250px",	"150px",	"150px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('FM_CNPT_CD',	data.CNPT_CD);
				SBUxMethod.set('FM_CNPT_NM', 	data.CNPT_NM);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }   
    
    /**
     * 중분류
     */
    var fn_compopup4 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL2"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL2_NAME"));
        
        var replaceText0 	= "_ASST_MCLSF_";
        var replaceText1 	= "_ASST_MCLSF_NM_"; 
        var strWhereClause 	= "AND AA.ASST_MCLSF LIKE '%" + replaceText0 + "%' AND AA.ASST_MCLSF_NM LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산중분류');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ASSET_LEVEL2'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["ASST_MCLSF", 		"ASST_MCLSF_NM"]
   			,searchInputValues		: [searchText1, 		searchText2]
			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["중분류", 			"중분류명",				"자산구분",			"자산구분명",			"comp_code"]
   			,tableColumnNames		: ["ASST_MCLSF", 		"ASST_MCLSF_NM",		"ASST_CTGRY",		"ASSET_CATEGORY_NAME",	"CO_CD"]	
   			,tableColumnWidths		: ["100px", 			"200px",				"100px",			"100px",				"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('FM_ASSET_LEVEL2', 		data.ASST_MCLSF);
				SBUxMethod.set('FM_ASSET_LEVEL2_NAME', 	data.ASSET_LEVEL2_NAME);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
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
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FI_DEPT'
            ,popupType				: 'B'
       		,whereClause			: param
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: [searchText2, 	searchText1,	""]
            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
            ,width					: '500px'
            ,height					: '400px'
            ,tableHeader			: ["부서코드",		"부서명" 		]
            ,tableColumnNames		: ["DEPT_CD",		"DEPT_NM"  	]
            ,tableColumnWidths		: ["100px", 		"200px" 		]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                if(type=='1'){
	                SBUxMethod.set('FM_DEPT_NAME', data.DEPT_NM);
	                SBUxMethod.set('FM_DEPT_CODE', data.DEPT_CD);
                } else if(type=='2'){
                }
            },
        });
		SBUxMethod.openModal('modal-compopup1');
    }       
    
    /**
     * 소분류 
     */
    function fn_compopup6() {
    	
    	//type C 형 팝업
    	var p_find1	= 'Q';
    	var p_find2	= 'N';
    	var p_find3	= p_ss_languageID;
    	var p_find4	= gv_ma_selectedCorpCd;
    	var p_find5	= gv_ma_selectedClntCd;
    	var p_find6	= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL2"));
   		var p_find7	= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL3"));
		var p_find8	= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL3_NAME"));
		var p_find9 = '';
		var p_find10 = '';
		var p_find11 = '';
		var p_find12 = '';
		var p_find13 = '';
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '자산 소분류');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ASSET_LEVEL3_ALL'
            ,popupType				: 'C'
       		,whereClause			: ''
            ,searchCaptions			: ["소분류", 		"소분류명"]
            ,searchInputFields		: ["ASST_SCLSF", 	"ASSET_LEVEL3_NAME"]
            ,searchInputValues		: [p_find7, 		p_find8]
            ,searchInputTypes		: ["input", 		"input"]		
        
			,cTypeParamFields		: ["",		"",			"",			"",			"",			"",			"ASST_SCLSF",	"ASSET_LEVEL3_NAME",	"",			"",			"",			"",			""]
			,cTypeParamValues		: [p_find1,	p_find2,	p_find3,	p_find4,	p_find5, 	p_find6,	p_find7,		p_find8,				p_find9,	p_find10,	p_find11,	p_find12,	p_find13,]
        
            ,width					: '600px'
            ,height					: '400px'
            ,tableHeader			: ["소분류코드",	"소분류명",				"중분류코드",	"중분류명",			"자산구분",			"자산구분명",			"상각여부",		"자산계정",		"자산계정명",			"감가상계정",	"감가상각계정",			"감가상각누계계정",	"감가상각누계계정명",	"보조금계정",		"보조금계정명",			"보조금상각계정",		"보조금상각계정명",			"보조금상각누계계정",		"보조금상각누계계정명",				"상각주기(회계기준)",		"상각주기(IFRS)",			"상각주기(법인세)",			"상각방법(회계기준)",		"상각방법(IFRS)",			"상각방법(법인세)",			"잔존율(회계기준)",		"잔존율(IFRS)",			"잔존율(법인세)",	"잔존가치(회계기준)",	"잔존가치(IFRS)",		"잔존가치(법인세)",		"내용연수(회계기준)",	"내용연수(IFRS)",	"내용연수(법인세)"]
            ,tableColumnNames		: ["ASST_SCLSF",	"ASSET_LEVEL3_NAME",	"ASST_MCLSF",	"ASSET_LEVEL2_NAME","ASST_CTGRY",	"ASSET_CATEGORY_NAME",	"DPRC_YN","ASST_ACNT_CD","ASSET_ACCOUNT_NAME",	"DPCO_ACNT",	"DEPR_EXP_ACC_NAME",	"ACML_DPRC_ACNT",	"ACCUM_DEPR_ACC_NAME",	"UBSIDIES_ACCOUNT",	"SUBSIDIES_ACC_NAME",	"GVSBS_DPCO_ACNT",	"SUBSIDIES_DEPR_ACC_NAME",	"GVSBS_DPRC_AT_ACNT",	"SUBSIDIES_ACCUM_DEPR_ACC_NAME",	"DPRC_PRD_GAAP",	"DPRC_PRD_IFRS",	"DPRC_PRD_TAX",	"DPRC_MTHD_GAAP",	"DPRC_MTHD_IFRS",	"DPRC_MTHD_TAX",	"RMN_RT_GAAP",	"RMN_RT_IFRS",	"RMN_RT_TAX",	"RMN_AMT_GAAP",	"RMN_AMT_IFRS",	"RMN_AMT_TAX",	"SVLF_GAAP",		"SVLF_IFRS",	"SVLF_TAX"]
            ,tableColumnWidths		: ["100px", 		"200px",				"100px",		"100px",			"100px",			"100px",				"100px",		"150px",		"200px",				"100px",		"150px",				"150px",			"200px",				"100px",			"150px",				"150px",				"250px",					"150px",					"250px",							"150px",					"150px",					"150px",					"150px",					"150px",					"150px",					"150px",				"120px",				"120px",			"150px",				"150px",				"150px",				"150px",				"150px",			"150px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('FM_ASSET_LEVEL3_NAME', 	data.ASSET_LEVEL3_NAME);
                SBUxMethod.set('FM_ASSET_LEVEL3', 		data.ASST_SCLSF);
            },
        });
		SBUxMethod.openModal('modal-compopup1');
    }     
    
    /**
     * 원가중심점코드
     */
    var fn_compopup7 = function(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_CSTCD_CD"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_CSTCD_NM"));
        } else if(type=='2'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("SCH_COST_CENTER_CODE"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("SCH_COST_CENTER_NAME"));
        }
        
        var replaceText0 	= "_CSTCD_CD_";
        var replaceText1 	= "_CSTCD_NM_"; 
        var strWhereClause 	= "AND CSTCD_CD LIKE '%" + replaceText0 + "%' AND CSTCD_NM LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_CC_INPUT'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["CSTCD_CD", 	"CSTCD_NM"]
   			,searchInputValues		: [searchText1, 		searchText2]
			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["코드", 				"명칭",				"부서코드",		"부서명",		"사업장"]
   			,tableColumnNames		: ["CSTCD_CD", 	"CSTCD_NM",	"DEPT_CD",	"DEPT_NM",	"SITE_CD"]	
   			,tableColumnWidths		: ["150px", 			"250px",			"100px",		"150px",		"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
		        if(type=='1'){
					SBUxMethod.set('FM_CSTCD_CD', 	data.CSTCD_CD);
					SBUxMethod.set('FM_CSTCD_NM', 	data.CSTCD_NM);
		        } else if(type=='2'){
					SBUxMethod.set('SCH_COST_CENTER_CODE', 	data.CSTCD_CD);
					SBUxMethod.set('SCH_COST_CENTER_NAME', 	data.CSTCD_NM);
		        }
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }     
    
    /**
     * 프로젝트코드
     */
    var fn_compopup8 = function(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("FM_PJT_CD"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("FM_PJT_NM"));
        } else if(type=='2'){
        }
        
        var replaceText0 	= "_PJT_CD_";
        var replaceText1 	= "_PJT_NM_"; 
        var strWhereClause 	= "AND A.PJT_CD LIKE '%" + replaceText0 + "%' AND A.PJT_NM LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산프로젝트');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_PROJECT_CIP'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["PJT_CD", 		"PJT_NM"]
   			,searchInputValues		: [searchText1, 		searchText2]
			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["코드", 				"명칭",				"년도",			"부서",			"호기",			"부서"]
   			,tableColumnNames		: ["PJT_CD", 		"PJT_NM",		"CD_SGMT01",	"CD_SGMT02",	"CD_SGMT03",	"CD_SGMT04"]	
   			,tableColumnWidths		: ["80px", 				"300px",			"100px",		"100px",		"100px",		"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
		        if(type=='1'){
					SBUxMethod.set('FM_PJT_CD', 	data.PJT_CD);
					SBUxMethod.set('FM_PJT_NM', 	data.PJT_NM);
		        } else if(type=='2'){
		        }
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }      
    
    /**
     * 위치코드
     */
    var fn_compopup9 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM_LOCTN_CD"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM_LOCTN_NM"));
        
        var replaceText0 	= "_LOCTN_CD_";
        var replaceText1 	= "_LOCTN_NM_"; 
        var strWhereClause 	= "AND LOCTN_CD LIKE '%" + replaceText0 + "%' AND LOCTN_NM LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '위치코드');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FA_LOCATION'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["LOCTN_CD", 			"LOCTN_NM"]
   			,searchInputValues		: [searchText1, 		searchText2]
			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["위치코드", 			"위치명",			"비고",			"법인"]
   			,tableColumnNames		: ["LOCTN_CD", 			"LOCTN_NM",			"DESCIPTION",	"CO_CD"]	
   			,tableColumnWidths		: ["100px", 			"200px",			"100px",		"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('FM_LOCTN_CD', 	data.CNPT_CD);
				SBUxMethod.set('FM_LOCTN_NM', 	data.CNPT_NM);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }         
        
    /**
     * 담당자 
     */
    function fn_compopup10(list) {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("FM_EMP_CD"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("FM_EMP_NM"));
        var replaceText0 	= "_EMP_CD_";
        var replaceText1 	= "_EMP_NM_";
        var replaceText2 	= "_EMP_STTS_";
        var strWhereClause 	= "AND X.EMP_CD LIKE '%" + replaceText0 + "%' AND X.EMP_NM LIKE '%" + replaceText1 + "%' AND X.EMP_STTS LIKE '%" + replaceText2 + "%'";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_HRI001'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["부서명",		"사원명",		"사업장",		"부서명"]
   			,searchInputFields		: ["DEPT_NM", 	"EMP_CD",		"EMP_NM",		"EMP_STTS"]
   			,searchInputValues		: ["",				searchText1, 	searchText2,	""]
			,searchInputTypes		: ["input", 		"input",		"input",		"select"]			//input, select가 있는 경우
   			,searchInputTypeValues	: ["", 				"",				"",				list]				//select 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["사번", 			"이름",		"부서",			"사업장"]
   			,tableColumnNames		: ["EMP_CD", 		"EMP_NM",	"DEPT_NM",	"SITE_NM"]
   			,tableColumnWidths		: ["150px", 		"150px",	"200px",		"200px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('FM_EMP_CD', 	data.EMP_CD);
				SBUxMethod.set('FM_EMP_NM', 	data.EMP_NM);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }      
    
    /**
     * 상세내역 탭 클릭
     */
    function fn_tabClick2(val) {
    	console.log(val);
    	p_sel_tab2 = val;
    	
    	//tpgAsset 		= tab1 : 자산상세내역
    	//grdAsset 		= tab2 : 취득내역
    	//tpgBook  		= tab3 : 감가상각내역
    	//tpgLandPrice 	= tab4 : 토지공시지가
    	
    	if(p_sel_tab2=='1'){
    		
        	fn_setFia3100GridMast('DETAIL');
    		$('#btn1-row-add').show();
    		$('#btn1-row-del').show();
    		
    	} else if(p_sel_tab2=='2'){
    		
    		$('#btn1-row-add').hide();
    		$('#btn1-row-del').hide();
    		
    	} else if(p_sel_tab2=='3'){
    		
        	fn_setFia3100GridMast('BOOK');
    		$('#btn1-row-add').hide();
    		$('#btn1-row-del').hide();
    		
    	} else if(p_sel_tab2=='4'){
    		
        	fn_setFia3100GridMast('LAND');
    		$('#btn1-row-add').show();
    		$('#btn1-row-del').show();
    		
    	}
    }
    
    /**
     * 신규
     */
    function cfn_add() {
		
        SBUxMethod.set("FM_ACQS_FRST_YMD",	gfnma_date4());
        SBUxMethod.set("FM_CURRENCY_CODE",	p_ss_baseCurrCode);
        
        SBUxMethod.show("BTN_btnAcquireQuery");
 
		$('#main-btn-save', parent.document).attr('disabled', false);
		$('#main-btn-del', 	parent.document).attr('disabled', true);
    }
	
    /**
     * 행추가
     */
    var fn_gridRowAdd = function() {
    	
		console.log('p_sel_tab2:',p_sel_tab2);        
    	if(p_sel_tab2==1){
            var idx = Fia3100GridDetail01.getRows();
    		console.log(idx);        
    		Fia3100GridDetail01.insertRow((idx-1), 'below');
    		fn_setFia3100GridDetail01Total();    		
    	} else if(p_sel_tab2==4){
            var idx = Fia3100GridDetail04.getRows();
    		console.log(idx);        
    		Fia3100GridDetail04.insertRow((idx-1), 'below');
    		fn_setFia3100GridDetail04Total();    		
    	}
    }
    
    /**
     * 행삭제
     */
    var fn_gridRowDel = function() {
		console.log('p_sel_tab2:',p_sel_tab2);        
    	if(p_sel_tab2==1){
    		Fia3100GridDetail01.deleteRow(Fia3100GridDetail01.getRow());
    		fn_setFia3100GridDetail01Total();    		
    	} else if(p_sel_tab2==4){
    		Fia3100GridDetail04.deleteRow(Fia3100GridDetail04.getRow());
    		fn_setFia3100GridDetail04Total();    		
    	}
    }    
    
    /**
     * 취득내역
     */
    var fn_btnAcquireQuery = function() {
    	
        SBUxMethod.show("BTN_btnAcquireQuery");
       	SBUxMethod.showTab('idxTab_norm1','SB_TOP_TAB2');
    	
        SBUxMethod.set("FM_ACQUIRE_DATE_FR",	gfnma_date9(-1));
        SBUxMethod.set("FM_ACQUIRE_DATE_TO",	gfnma_date4());
    	
    	fn_setFia3100GridMast('ACQ_LIST');
        
    }    
    
    /**
     * 그리드내 팝업(관리부서) 조회
     */
	function fn_gridPopup1(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fia3100GridDetail01.getCellData(row, 14) 
        let cellData2 = Fia3100GridDetail01.getCellData(row, 16) 
    	fn_gridPopup1Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(관리부서) 오픈
     */
    var fn_gridPopup1Show = function(row, col, cellData1, cellData2) {
    	
        var param		 	= null;
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
       		,whereClause			: param
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: [cellData2, 		cellData1,		""]
            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
            ,width					: '700px'
            ,height					: '400px'
            ,tableHeader			: ["부서코드",		"부서명", 		"사업장"]
            ,tableColumnNames		: ["DEPT_CD",		"DEPT_NM",  	"SITE_NM"]
            ,tableColumnWidths		: ["100px", 		"200px", 		"100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                Fia3100GridDetail01.setCellData(row, 14, 	data['DEPT_NM'], true, true);
                Fia3100GridDetail01.setCellData(row, 16, 	data['DEPT_CD'], true, true);
            },
        });
		SBUxMethod.openModal('modal-compopup1');
    }      
    
    /**
     * 그리드내 팝업(원가중심점) 조회
     */
	function fn_gridPopup2(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fia3100GridDetail01.getCellData(row, 17) 
        let cellData2 = Fia3100GridDetail01.getCellData(row, 19) 
    	fn_gridPopup2Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(원가중심점) 오픈
     */
    var fn_gridPopup2Show = function(row, col, cellData1, cellData2) {
    	
        var searchText1 	= cellData2;
        var searchText2 	= cellData1;
        var replaceText0 	= "_CSTCD_CD_";
        var replaceText1 	= "_CSTCD_NM_";
        var strWhereClause 	= "AND CSTCD_CD LIKE '%" + replaceText0 + "%' AND CSTCD_NM LIKE '%" + replaceText1 + "%' ";
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점');
        compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COST_CENTER'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["코드", 				"명칭"]
  			,searchInputFields		: ["CSTCD_CD", 	"CSTCD_NM"]
  			,searchInputValues		: [searchText2, 		searchText1]
    		,width					: '600px'
    		,height					: '400px'
  			,tableHeader			: ["코드", 		 		"명칭"]
  			,tableColumnNames		: ["CSTCD_CD", 	 "CSTCD_NM"]
  			,tableColumnWidths		: ["150px", 			"200px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                Fia3100GridDetail01.setCellData(row, 17, 	data['CSTCD_NM'], true, true);
                Fia3100GridDetail01.setCellData(row, 19, 	data['CSTCD_CD'], true, true);
            },
        });
		SBUxMethod.openModal('modal-compopup1');
    }  
    
    /**
     * 상세내역 - 자산상세내역탭 - 합계 
     */
    function fn_setFia3100GridDetail01Total() {
    	
    	var list 	= Fia3100GridDetail01.getOrgGridDataAll();
    	var t1		= 0;
    	for (var i = 0; i < list.length; i++) {
			t1 += Number(list[i]['FUNCTIONAL_AMOUNT']);
		}
    	SBUxMethod.set('TOT_BOT_TAB1_FUNCTIONAL_AMOUNT', t1);
    }    
    
    /**
     * 상세내역 - 토지공시지가탭 - 합계 
     */
    function fn_setFia3100GridDetail04Total() {
    	
    	var list 	= Fia3100GridDetail04.getOrgGridDataAll();
    	var t1		= 0;
    	for (var i = 0; i < list.length; i++) {
			t1 += Number(list[i]['AMOUNT']);
		}
    	SBUxMethod.set('TOT_BOT_TAB4_AMOUNT', t1);
    }    
    
    /**
     * 저장
     */
   	var cfn_save = async function() {
    	
    	if(!fn_validationMain()){
    		return;
    	}
		
        var strStatus 		= "";
		var p_fm_asset_no 	= SBUxMethod.get("FM_ASSET_NO");
        if (!p_fm_asset_no){
            strStatus = "N";
        } else {
            strStatus = "U";    	
        }
		
        await fn_processFia3100S(strStatus);
        await fn_processFia3100S2();        
    }
    
    /**
     * 메인 저장
     */
    const fn_processFia3100S = async function (wtype, callback){
 
		let p_fm_acct_rule_code		= gfnma_nvl(SBUxMethod.get("FM_ACCT_RULE_CODE"));
		let p_sch_actual_flag_p		= gfnma_nvl(SBUxMethod.get("SCH_ACTUAL_FLAG_P"));
		let p_fm_asset_no			= gfnma_nvl(SBUxMethod.get("FM_ASSET_NO"));
		let p_fm_asset_name			= gfnma_nvl(SBUxMethod.get("FM_ASSET_NAME"));
		let p_fm_asset_category		= gfnma_nvl(SBUxMethod.get("FM_ASSET_CATEGORY"));
		let p_fm_asset_level2		= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL2"));
		let p_fm_asset_level3		= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL3"));
		let p_fm_acquire_date		= gfnma_nvl(SBUxMethod.get("FM_ACQS_FRST_YMD"));
		let p_fm_currency_code		= gfnma_nvl(SBUxMethod.get("FM_CURRENCY_CODE"));
		let p_fm_functional_amount	= gfnma_nvl(SBUxMethod.get("FM_FUNCTIONAL_AMOUNT"));
		let p_fm_site_code			= gfnma_nvl(SBUxMethod.get("FM_SITE_CODE"));
		let p_fm_cs_code			= gfnma_nvl(SBUxMethod.get("FM_CNPT_CD"));
		let p_fm_dept_code			= gfnma_nvl(SBUxMethod.get("FM_DEPT_CODE"));
		let p_fm_cost_center_code	= gfnma_nvl(SBUxMethod.get("FM_CSTCD_CD"));
		let p_fm_project_code		= gfnma_nvl(SBUxMethod.get("FM_PJT_CD"));
		let p_fm_location_code		= gfnma_nvl(SBUxMethod.get("FM_LOCTN_CD"));
		let p_fm_depreciate_yn		= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATE_YN")['FM_DEPRECIATE_YN']);
		let p_fm_asset_account		= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACCOUNT"));
		let p_fm_depr_exp_acc		= gfnma_nvl(SBUxMethod.get("FM_DEPR_EXP_ACC"));
		let p_fm_accum_depr_acc		= gfnma_nvl(SBUxMethod.get("FM_ACCUM_DEPR_ACC"));
		let p_fm_subsidies_account	= gfnma_nvl(SBUxMethod.get("FM_GVSBS_ACNT"));
		let p_fm_subsidies_depr_acc	= gfnma_nvl(SBUxMethod.get("FM_GVSBS_DPCO_ACNT"));
		let p_fm_subsidies_accum_depr_acc	= gfnma_nvl(SBUxMethod.get("FM_GVSBS_DPRC_AT_ACNT"));
		let p_fm_useful_life_gaap			= gfnma_nvl(SBUxMethod.get("FM_USEFUL_LIFE_GAAP"));
		let p_fm_useful_life_ifrs			= gfnma_nvl(SBUxMethod.get("FM_USEFUL_LIFE_IFRS"));
		let p_fm_useful_life_tax			= gfnma_nvl(SBUxMethod.get("FM_USEFUL_LIFE_TAX"));
		let p_fm_useful_life_mm_gaap		= gfnma_nvl(SBUxMethod.get("FM_USEFUL_LIFE_MM_GAAP"));
		let p_fm_useful_life_mm_ifrs		= gfnma_nvl(SBUxMethod.get("FM_USEFUL_LIFE_MM_IFRS"));
		let p_fm_useful_life_mm_tax			= gfnma_nvl(SBUxMethod.get("FM_USEFUL_LIFE_MM_TAX"));
		let p_fm_salvage_rate_gaap			= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_RATE_GAAP"));
		let p_fm_salvage_rate_ifrs			= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_RATE_IFRS"));
		let p_fm_salvage_rate_tax			= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_RATE_TAX"));
		let p_fm_salvage_value_gaap			= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_VALUE_GAAP"));
		let p_fm_salvage_value_ifrs			= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_VALUE_IFRS"));
		let p_fm_salvage_value_tax			= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_VALUE_TAX"));
		
		let p_fm_depreciation_method_gaap	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_METHOD_GAAP"));
		let p_fm_depreciation_method_ifrs	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_METHOD_IFRS"));
		let p_fm_depreciation_method_tax	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_METHOD_TAX"));
		
		let p_fm_depreciation_period_gaap	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_PERIOD_GAAP"));
		let p_fm_depreciation_period_ifrs	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_PERIOD_IFRS"));
		let p_fm_depreciation_period_tax	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_PERIOD_TAX"));
		
		let p_fm_depreciate_start_yyyymm		= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATE_START_YYYYMM"));
		let p_fm_depreciate_start_yyyymm_ifrs	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATE_START_YYYYMM_IFRS"));
		let p_fm_qty				= gfnma_nvl(SBUxMethod.get("FM_QTY"));
		let p_fm_memo				= gfnma_nvl(SBUxMethod.get("FM_MEMO"));
		let p_fm_asset_acquire_no	= gfnma_nvl(SBUxMethod.get("FM_ASST_ACQS_NO"));
		let p_fm_equipment_no		= gfnma_nvl(SBUxMethod.get("FM_EQUIPMENT_NO"));
 
 	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_ACCT_RULE_CODE				: p_fm_acct_rule_code    
			,V_P_ACTUAL_FLAG       			: p_sch_actual_flag_p
			,IV_P_ASSET_NO        			: p_fm_asset_no
			,V_P_ASSET_NAME        			: p_fm_asset_name
			,V_P_ASSET_CATEGORY    			: p_fm_asset_category
			,V_P_ASSET_LEVEL2      			: p_fm_asset_level2
			,V_P_ASSET_LEVEL3      			: p_fm_asset_level3
			,V_P_ACQUIRE_DATE      			: p_fm_acquire_date
			,V_P_CURRENCY_CODE     			: p_fm_currency_code
			,V_P_FUNCTIONAL_AMOUNT 			: p_fm_functional_amount
			,V_P_SITE_CODE         			: p_fm_site_code
			,V_P_CS_CODE           			: p_fm_cs_code
			,V_P_DEPT_CODE         			: p_fm_dept_code
			,V_P_COST_CENTER_CODE  			: p_fm_cost_center_code
			,V_P_PROJECT_CODE      			: p_fm_project_code
			,V_P_LOCATION_CODE     			: p_fm_location_code
			,V_P_DEPRECIATE_YN     			: p_fm_depreciate_yn
			,V_P_ASSET_ACCOUNT     			: p_fm_asset_account
			,V_P_DEPR_EXP_ACC     			: p_fm_depr_exp_acc
			,V_P_ACCUM_DEPR_ACC    			: p_fm_accum_depr_acc
			,V_P_SUBSIDIES_ACCOUNT 			: p_fm_subsidies_account
			,V_P_SUBSIDIES_DEPR_ACC 		: p_fm_subsidies_depr_acc
			,V_P_SUBSIDIES_ACCUM_DEPR_ACC 	: p_fm_subsidies_accum_depr_acc
			,V_P_USEFUL_LIFE_GAAP		 	: p_fm_useful_life_gaap
			,V_P_USEFUL_LIFE_IFRS		 	: p_fm_useful_life_ifrs
			,V_P_USEFUL_LIFE_TAX		 	: p_fm_useful_life_tax
			,V_P_USEFUL_LIFE_MM_GAAP	 	: p_fm_useful_life_mm_gaap
			,V_P_USEFUL_LIFE_MM_IFRS	 	: p_fm_useful_life_mm_ifrs
			,V_P_USEFUL_LIFE_MM_TAX		 	: p_fm_useful_life_mm_tax
			,V_P_SALVAGE_RATE_GAAP		 	: p_fm_salvage_rate_gaap
			,V_P_SALVAGE_RATE_IFRS		 	: p_fm_salvage_rate_ifrs
			,V_P_SALVAGE_RATE_TAX		 	: p_fm_salvage_rate_tax
			,V_P_SALVAGE_VALUE_GAAP		 	: p_fm_salvage_value_gaap
			,V_P_SALVAGE_VALUE_IFRS		 	: p_fm_salvage_value_ifrs
			,V_P_SALVAGE_VALUE_TAX		 	: p_fm_salvage_value_tax
			,V_P_DEPRECIATION_METHOD_GAAP 	: p_fm_depreciation_method_gaap
			,V_P_DEPRECIATION_METHOD_IFRS 	: p_fm_depreciation_method_ifrs
			,V_P_DEPRECIATION_METHOD_TAX 	: p_fm_depreciation_method_tax
			,V_P_DEPRECIATION_PERIOD_GAAP 	: p_fm_depreciation_period_gaap
			,V_P_DEPRECIATION_PERIOD_IFRS 	: p_fm_depreciation_period_ifrs
			,V_P_DEPRECIATION_PERIOD_TAX 	: p_fm_depreciation_period_tax
			,V_P_DEPRECIATE_START_YYYYMM 	: p_fm_depreciate_start_yyyymm
			,V_P_DEPREC_START_YYYYMM_IFRS 	: p_fm_depreciate_start_yyyymm_ifrs
			,V_P_QTY 						: p_fm_qty
			,V_P_MEMO 						: p_fm_memo
			,V_P_ASSET_ACQUIRE_NO 			: p_fm_asset_acquire_no
			,V_P_EQUIPMENT_NO 				: p_fm_equipment_no
			
			,V_P_FORM_ID					: p_formId
			,V_P_MENU_ID					: p_menuId
			,V_P_PROC_ID					: ''
			,V_P_USERID						: p_userId
			,V_P_PC							: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/fi/ffa/alm/modifyFia3100S.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
	 	console.log('data:', data);
        
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(wtype=='N'){
	    			SBUxMethod.set('FM_ASSET_NO',	data.v_returnStr);
        		}
        		if(callback){
        			callback();
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
    
    /**
     * detail 저장
     */
     const fn_processFia3100S2 = async function(){
    	
		let p_fm_tax_site_code			= gfnma_nvl(SBUxMethod.get("FM_TX_SITE_CD"));
		let p_fm_asset_acquire_no		= gfnma_nvl(SBUxMethod.get("FM_ASST_ACQS_NO"));
    	
		var chkList = Fia3100GridDetail04.getOrgGridDataAll();
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
   	 				
   	 				,V_P_ASSET_NO				: gfnma_nvl(obj.ASSET_NO)
   	 				,V_P_BASE_YYYYMM			: gfnma_nvl(obj.BASE_YYYYMM)
   	 				,V_P_ADDRESS   				: gfnma_nvl(obj.ADDRESS)
   	 				,V_P_AREA_UOM				: gfnma_nvl(obj.AREA_UOM)
   	 				,V_P_UNIT_PRICE				: gfnma_nvl(obj.UNIT_PRICE)
   	 				,V_P_AREA					: gfnma_nvl(obj.AREA)
   	 				,V_P_AMOUNT					: gfnma_nvl(obj.AMOUNT)
   	 				
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
    	 	const postJsonPromise = gfn_postJSON("/fi/fgl/alm/modifyFia3100S2.do", {listData: listData});
 
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
 		cfn_search();
    }    
    
     /**
      * 삭제
      */
     function cfn_del() {
    	 
  		let p_fm_asset_no	= gfnma_nvl(SBUxMethod.get("FM_ASSET_NO"));
    	if(!p_fm_asset_no){
    		gfn_comAlert("E0000","삭제할 항목이 선택되지 않았습니다.");
    		return;
    	}
 		if(confirm("선택하신 정보를 삭제하시겠습니까?")){
 		}else{
 			return;
 		}		
    	 
 		fn_processFia3100S('D', function(){
 			cfn_search();
 		});
     }
    
     /**
      * 상세내역 - 취득내역탭 - 조회
      */
     function fn_btnQueryClick() {
     	fn_setFia3100GridMast('ACQ_LIST');
     }
    
     /**
      * 상세내역 - 취득내역탭 - 자산원장반영
      */
     function fn_btnAcquireClick() {
     	fn_setFia3100GridMast('ACQUIRE');
     }
 
    
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
