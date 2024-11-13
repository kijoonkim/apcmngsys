<%
/**
 * @Class Name 		: fia1100.jsp
 * @Description 	: 자산분류등록 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.04.29
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.04.29   	장성주		최초 생성
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
	<title>title : 자산분류등록</title>
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
                    </h3><!-- 자산분류등록 -->
                </div>
                <div style="margin-left: auto;">
                </div>
            </div>
			<div class="box-search-ma" >

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
                            <th scope="row" class="th_bg_search">자산분류명</th>
                            <td colspan="3" class="td_input" >
                                <sbux-input id="SCH_ASSET_GROUP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
	  							<sbux-input  id="SCH_TXTLANG_ID"  	name="SCH_TXTLANG_ID" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
                            </td>
                            <td></td>
                            
                            <th scope="row" class="th_bg_search">감가상각방법</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_DEPRECIATION_METHOD" style="width:150px" uitype="single" jsondata-ref="jsonDepreciationMethod" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td></td>
                            
                            <th scope="row" class="th_bg_search">감가상각주기</th>
							<td colspan="3"  class="td_input">
                                <sbux-select id="SCH_DEPRECIATION_PERIOD" style="width:150px" uitype="single" jsondata-ref="jsonDepreciationPeriod" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
                            <td></td>
                            
                            <td colspan="5"></td>
                        </tr>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-6" style="width:25%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>자산분류리스트</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb_area_grid1" style="height:590px; width:100%;"></div>
                        </div>
                    </div>

                    <div class="col-sm-6" style="width:75%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>자산분류정보편집</span></li>
                            </ul>
                        </div>
                        <div style="height:590px;overflow:auto;">
                        	<table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
			                        <col style="width: 10%">
			                        <col style="width: 6%">
			                        <col style="width: 6%">
			
			                        <col style="width: 10%">
			                        <col style="width: 6%">
			                        <col style="width: 6%">
			
			                        <col style="width: 10%">
			                        <col style="width: 6%">
			                        <col style="width: 6%">
			
			                        <col style="width: 10%">
			                        <col style="width: 6%">
			                        <col style="width: 6%">
                                </colgroup>
			                    <tbody>
			                    
	                                <tr>
	                                    <th scope="row" class="th_bg">분류구분</th>
	                                    <td colspan="5" class="td_input">
			                                <sbux-select id="FM_ASSET_LEVEL_TYPE" jsondata-ref="jsonAssetLevelType" style="width:150px" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                                    </td>
	                                
	                                    <th scope="row" class="th_bg">자산분류코드</th>
	                                    <td colspan="5" class="td_input">
	                                        <sbux-input id="FM_ASSET_GROUP_CODE" class="form-control input-sm" style="width:150px" uitype="text" ></sbux-input>
	                                    </td>
	                                </tr>
			                    
	                                <tr>
	                                    <th scope="row" class="th_bg">비용유형</th>
	                                    <td colspan="5" class="td_input">
			                                <sbux-select id="FM_EXPENSE_TYPE" jsondata-ref="jsonExpenseType" style="width:150px" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                                    </td>
	                                
	                                    <th scope="row" class="th_bg">자산분류명</th>
	                                    <td colspan="5" class="td_input">
	                                        <sbux-input id="FM_ASSET_GROUP_NAME" class="form-control input-sm" uitype="text" ></sbux-input>
	                                    </td>
	                                </tr>
			                    
	                                <tr>
	                                    <th scope="row" class="th_bg">자산구분</th>
	                                    <td colspan="5" class="td_input">
			                                <sbux-select id="FM_ASSET_CATEGORY" jsondata-ref="jsonAssetCategory" style="width:300px" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                                    </td>
	                                
	                                    <td colspan="6" class="td_input">
			                            	<div style="display:flex;float:left">
			                            	
											    <font style="padding-left:20px;padding-right:5px;">자산화대상</font>  
	                            				<sbux-checkbox id="FM_CAPITAL_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
											    
											    <font style="padding-left:20px;padding-right:5px;">상각여부</font>  
	                            				<sbux-checkbox id="FM_DEPRECIATE_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
											    
											    <font style="padding-left:20px;padding-right:5px;">사용여부</font>  
	                            				<sbux-checkbox id="FM_USE_YN" uitype="normal" text="사용" true-value="Y" false-value="N" ></sbux-checkbox>
											    <font style="padding-left:20px;"></font>  
			                            		
			                            	</div>
	                                    </td>
	                                </tr>
			                    
	                                <tr>
	                                    <th scope="row" class="th_bg">
	                                    	<font id="LA_PARENT_ASSET_LABEL">중분류</font>
	                                    </th>
	                                    <td colspan="5" class="td_input">
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			   									<sbux-input style="width:100px" id="FM_PARENT_ASSET_GROUP" uitype="text" class="form-control input-sm"></sbux-input>
			   									<font style="width:5px"></font>
												<sbux-button
													id="BTN_POP1" 
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup1()"></sbux-button>
			   									<font style="width:5px"></font>
			   									<sbux-input style="width:200px"  id="FM_PARENT_ASSET_GROUP_NAME" uitype="text" class="form-control input-sm"></sbux-input>
			                            	</div>
	                                    </td>
	                                
	                                    <td colspan="6" class="td_input">
			                            	<div style="display:flex;float:left">
			                            	
											    <font style="padding-left:20px;padding-right:5px;">재고관리대상</font>  
	                            				<sbux-checkbox id="FM_INVENTORY_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
											    
											    <font style="padding-left:20px;padding-right:5px;">보류여부</font>  
	                            				<sbux-checkbox id="FM_OWNED_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
											    
											    <font style="padding-left:20px;padding-right:5px;">리스여부</font>  
	                            				<sbux-checkbox id="FM_LEASE_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
											    <font style="padding-left:20px;"></font>  
			                            		
			                            	</div>
	                                    </td>
	                                </tr>
	                                
	                                <tr style="padding-top:5px">
	                                    <th scope="row" colspan="6" class="td_input" style="text-align:left;padding-top:10px !important">▶ 기업회계기준 감가상각기준</th>
	                                    <th scope="row" colspan="6" class="td_input" style="text-align:left">▶ 자산계정과목 정의</th>
	                                </tr>
	                                
	                                <tr>
	                                    <th scope="row" class="th_bg">감가상각방법</th>
	                                    <td colspan="2" class="td_input">
			                                <sbux-select id="FM_DEPRECIATION_METHOD_GAAP" jsondata-ref="jsonDepreciationMethodGaap" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">내용연수</th>
	                                    <td colspan="2" class="td_input">
	                                        <sbux-input id="FM_USEFUL_LIFE_GAAP" class="form-control input-sm" uitype="text" ></sbux-input>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">자산계정</th>
	                                    <td colspan="5" class="td_input">
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			   									<sbux-input style="width:100px" id="FM_ASSET_ACCOUNT" uitype="text" class="form-control input-sm"></sbux-input>
			   									<font style="width:5px"></font>
												<sbux-button
													id="BTN_POP2" 
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup2('1')"></sbux-button>
			   									<font style="width:5px"></font>
			   									<sbux-input style="width:300px"  id="FM_ASSET_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
			                            	</div>
										</td>		                                	
	                                </tr>
	                                
	                                <tr>
	                                    <th scope="row" class="th_bg">감가상각주기</th>
	                                    <td colspan="2" class="td_input">
			                                <sbux-select id="FM_DEPRECIATION_PERIOD_GAAP" jsondata-ref="jsonDepreciationPeriodGaap" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">잔존가액</th>
	                                    <td colspan="2" class="td_input">
	                                        <sbux-input id="FM_SALVAGE_VALUE_GAAP" class="form-control input-sm" uitype="text" ></sbux-input>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">감가상각비 계정</th>
	                                    <td colspan="5" class="td_input">
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			   									<sbux-input style="width:100px" id="FM_DEPR_EXP_ACC" uitype="text" class="form-control input-sm"></sbux-input>
			   									<font style="width:5px"></font>
												<sbux-button
													id="BTN_POP3" 
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup2('2')"></sbux-button>
			   									<font style="width:5px"></font>
			   									<sbux-input style="width:300px"  id="FM_DEPR_EXP_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
			                            	</div>
										</td>		                                	
	                                </tr>
	                                
	                                <tr>
	                                    <th scope="row" class="th_bg"></th>
	                                    <td colspan="2" class="td_input">
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">잔존율</th>
	                                    <td colspan="2" class="td_input">
	                                        <sbux-input id="FM_SALVAGE_RATE_GAAP" class="form-control input-sm" uitype="text" ></sbux-input>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">감가상각누계 계정</th>
	                                    <td colspan="5" class="td_input">
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			   									<sbux-input style="width:100px" id="FM_ACCUM_DEPR_ACC" uitype="text" class="form-control input-sm"></sbux-input>
			   									<font style="width:5px"></font>
												<sbux-button
													id="BTN_POP4" 
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup2('3')"></sbux-button>
			   									<font style="width:5px"></font>
			   									<sbux-input style="width:300px"  id="FM_ACCUM_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
			                            	</div>
										</td>		                                	
	                                </tr>
	                                
	                                <tr style="padding-top:5px">
	                                    <th scope="row" colspan="6" class="td_input" style="text-align:left;padding-top:10px !important">▶ 법인세 감가상각기준</th>
	                                    <th scope="row" colspan="6" class="td_input" style="text-align:left">▶ 국고보조금 계정과목 정의</th>
	                                </tr>
	                                
	                                <tr>
	                                    <th scope="row" class="th_bg">감가상각방법</th>
	                                    <td colspan="2" class="td_input">
			                                <sbux-select id="FM_DEPRECIATION_METHOD_TAX" jsondata-ref="jsonDepreciationMethodTax" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">내용연수</th>
	                                    <td colspan="2" class="td_input">
	                                        <sbux-input id="FM_USEFUL_LIFE_TAX" class="form-control input-sm" uitype="text" ></sbux-input>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">보조금 계정</th>
	                                    <td colspan="5" class="td_input">
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			   									<sbux-input style="width:100px" id="FM_SUBSIDIES_ACCOUNT" uitype="text" class="form-control input-sm"></sbux-input>
			   									<font style="width:5px"></font>
												<sbux-button
													id="BTN_POP5" 
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup2('4')"></sbux-button>
			   									<font style="width:5px"></font>
			   									<sbux-input style="width:300px"  id="FM_SUBSIDIES_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
			                            	</div>
										</td>		                                	
	                                </tr>
	                                
	                                <tr>
	                                    <th scope="row" class="th_bg">감가상각주기</th>
	                                    <td colspan="2" class="td_input">
			                                <sbux-select id="FM_DEPRECIATION_PERIOD_TAX" jsondata-ref="jsonDepreciationPeriodTax" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">잔존가액</th>
	                                    <td colspan="2" class="td_input">
	                                        <sbux-input id="FM_SALVAGE_VALUE_TAX" class="form-control input-sm" uitype="text" ></sbux-input>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">감가상각비 계정</th>
	                                    <td colspan="5" class="td_input">
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			   									<sbux-input style="width:100px" id="FM_SUBSIDIES_DEPR_ACC" uitype="text" class="form-control input-sm"></sbux-input>
			   									<font style="width:5px"></font>
												<sbux-button
													id="BTN_POP6" 
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup2('5')"></sbux-button>
			   									<font style="width:5px"></font>
			   									<sbux-input style="width:300px"  id="FM_SUBSIDIES_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
			                            	</div>
										</td>		                                	
	                                </tr>
	                                
	                                <tr>
	                                    <th scope="row" class="th_bg"></th>
	                                    <td colspan="2" class="td_input">
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">잔존율</th>
	                                    <td colspan="2" class="td_input">
	                                        <sbux-input id="FM_SALVAGE_RATE_TAX" class="form-control input-sm" uitype="text" ></sbux-input>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">감가상각누계 계정</th>
	                                    <td colspan="5" class="td_input">
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			   									<sbux-input style="width:100px" id="FM_SUBSIDIES_ACCUM_DEPR_ACC" uitype="text" class="form-control input-sm"></sbux-input>
			   									<font style="width:5px"></font>
												<sbux-button
													id="BTN_POP7" 
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup2('6')"></sbux-button>
			   									<font style="width:5px"></font>
			   									<sbux-input style="width:300px"  id="FM_SUBSIDIES_ACCUM_DEPR_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
			                            	</div>
										</td>		                                	
	                                </tr>
	                                
	                                <tr style="padding-top:5px">
	                                    <th scope="row" colspan="6" class="td_input" style="text-align:left;padding-top:10px !important">▶ 국제회계기준 감가상각기준</th>
	                                    <th scope="row" colspan="6" class="td_input" style="text-align:left">▶ 자산처분손익 계정과목 정의</th>
	                                </tr>
	                                
	                                <tr>
	                                    <th scope="row" class="th_bg">감가상각방법</th>
	                                    <td colspan="2" class="td_input">
			                                <sbux-select id="FM_DEPRECIATION_METHOD_IFRS" jsondata-ref="jsonDepreciationMethodIfrs" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">내용연수</th>
	                                    <td colspan="2" class="td_input">
	                                        <sbux-input id="FM_USEFUL_LIFE_IFRS" class="form-control input-sm" uitype="text" ></sbux-input>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">매각이익계정</th>
	                                    <td colspan="5" class="td_input">
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			   									<sbux-input style="width:100px" id="FM_DISPOSAL_PROFIT_ACCOUNT" uitype="text" class="form-control input-sm"></sbux-input>
			   									<font style="width:5px"></font>
												<sbux-button
													id="BTN_POP8" 
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup2('7')"></sbux-button>
			   									<font style="width:5px"></font>
			   									<sbux-input style="width:300px"  id="FM_DISPOSAL_PROFIT_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
			                            	</div>
										</td>		                                	
	                                </tr>
	                                
	                                <tr>
	                                    <th scope="row" class="th_bg">감가상각주기</th>
	                                    <td colspan="2" class="td_input">
			                                <sbux-select id="FM_DEPRECIATION_PERIOD_IFRS" jsondata-ref="jsonDepreciationPeriodIfrs" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">잔존가액</th>
	                                    <td colspan="2" class="td_input">
	                                        <sbux-input id="FM_SALVAGE_VALUE_IFRS" class="form-control input-sm" uitype="text" ></sbux-input>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">매각손실계정</th>
	                                    <td colspan="5" class="td_input">
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			   									<sbux-input style="width:100px" id="FM_DISPOSAL_LOSS_ACCOUNT" uitype="text" class="form-control input-sm"></sbux-input>
			   									<font style="width:5px"></font>
												<sbux-button
													id="BTN_POP9" 
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup2('8')"></sbux-button>
			   									<font style="width:5px"></font>
			   									<sbux-input style="width:300px"  id="FM_DISPOSAL_LOSS_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
			                            	</div>
										</td>		                                	
	                                </tr>
	                                
	                                <tr>
	                                    <th scope="row" class="th_bg"></th>
	                                    <td colspan="2" class="td_input">
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">잔존율</th>
	                                    <td colspan="2" class="td_input">
	                                        <sbux-input id="FM_SALVAGE_RATE_IFRS" class="form-control input-sm" uitype="text" ></sbux-input>
										</td>		                                	
	                                
	                                    <th scope="row" class="th_bg">폐기손실계정</th>
	                                    <td colspan="5" class="td_input">
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			   									<sbux-input style="width:100px" id="FM_DISUSE_LOSS_ACCOUNT" uitype="text" class="form-control input-sm"></sbux-input>
			   									<font style="width:5px"></font>
												<sbux-button
													id="BTN_POP10" 
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup2('9')"></sbux-button>
			   									<font style="width:5px"></font>
			   									<sbux-input style="width:300px"  id="FM_DISUSE_LOSS_ACC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
			                            	</div>
										</td>		                                	
	                                </tr>
	                                
	                                <tr>
	                                    <th scope="row" class="th_bg">비고</th>
	                                    <td colspan="5" class="td_input">
	                                        <sbux-textarea id="FM_MEMO" class="form-control input-sm" uitype="normal" style="width:100%; height:50px;""></sbux-textarea>
										</td>		                                	
										
	                                    <th scope="row" class="th_bg">정렬순서</th>
	                                    <td colspan="5" class="td_input">
	                                        <sbux-input id="FM_SORT_SEQ" class="form-control input-sm" style="width:100px" uitype="text" ></sbux-input>
										</td>		                                	
	                                </tr>
	                                
                                </tbody>
                            </table>
                            
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
    var Fia1100Grid; 			// 그리드를 담기위한 객체 선언
    var jsonFia1100Grid = []; 	// 그리드의 참조 데이터 주소 선언

	var jsonDepreciationMethod		= [];	// 감가상각방법
	var jsonDepreciationPeriod		= [];	// 감가상각주기
	
	var jsonAssetLevelType			= [];	// 분류구분
	var jsonExpenseType				= [];	// 비용유형
	var jsonAssetCategory			= [];	// 자산구분
	var jsonDepreciationMethodGaap	= [];	// 감가상각방법
	var jsonDepreciationPeriodGaap	= [];	// 감가상각주기
	
	var jsonDepreciationMethodTax	= [];	// 감가상각방법
	var jsonDepreciationPeriodTax	= [];	// 감가상각주기
	
	var jsonDepreciationMethodIfrs	= [];	// 감가상각방법
	var jsonDepreciationPeriodIfrs	= [];	// 감가상각주기
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//감가상각방법
			gfnma_setComSelect(['SCH_DEPRECIATION_METHOD'], jsonDepreciationMethod, 'L_FIA003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//감가상각주기
			gfnma_setComSelect(['SCH_DEPRECIATION_PERIOD'], jsonDepreciationPeriod, 'L_FIA004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			
			//분류구분
			gfnma_setComSelect(['FM_ASSET_LEVEL_TYPE'], 	jsonAssetLevelType, 	'L_FIA002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//비용유형
			gfnma_setComSelect(['FM_EXPENSE_TYPE'], 		jsonExpenseType, 		'L_FIA014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//자산구분
			gfnma_setComSelect(['FM_ASSET_CATEGORY'], 		jsonAssetCategory, 		'L_FIA001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//감가상각방법
			gfnma_setComSelect(['FM_DEPRECIATION_METHOD_GAAP'], 		jsonDepreciationMethodGaap, 	'L_FIA003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//감가상각주기
			gfnma_setComSelect(['FM_DEPRECIATION_PERIOD_GAAP'], 		jsonDepreciationPeriodGaap,		'L_FIA004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			
			//감가상각방법
			gfnma_setComSelect(['FM_DEPRECIATION_METHOD_TAX'], 			jsonDepreciationMethodTax,		'L_FIA003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//감가상각주기
			gfnma_setComSelect(['FM_DEPRECIATION_PERIOD_TAX'], 			jsonDepreciationPeriodTax,		'L_FIA004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			
			//감가상각방법
			gfnma_setComSelect(['FM_DEPRECIATION_METHOD_IFRS'], 		jsonDepreciationMethodIfrs,		'L_FIA003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//감가상각주기
			gfnma_setComSelect(['FM_DEPRECIATION_PERIOD_IFRS'], 		jsonDepreciationPeriodIfrs,		'L_FIA004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state();
  		
  		fn_createFia1100Grid();
		cfn_search();
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
    function fn_state() {
    
		$('#main-btn-new', parent.document).attr('disabled', true);
		$('#main-btn-save', parent.document).attr('disabled', true);
		$('#main-btn-del', 	parent.document).attr('disabled', false);
    	
		SBUxMethod.set("SCH_TXTLANG_ID", p_ss_languageID);
		
		fn_fmDisabled(true);
    }    
    
    /**
     * 목록 조회
     */
 	function cfn_search() {
 		p_sel_rowData = null;    	
    	fn_setFia1100Grid('LIST');
    }
    
    function fn_createFia1100Grid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid1';
	    SBGridProperties.id 				= 'Fia1100Grid';
	    SBGridProperties.jsonref 			= 'jsonFia1100Grid';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.tree = {
	            col: 0,
	            levelref: 'LVL',
	            open: true,
	            lock: true
	    },
        SBGridProperties.columns = [
            {caption: ["자산분류코드"],		ref: 'ASSET_GROUP_CODE', 		type:'output',  	width:'170px',  	style:'text-align:left'},
            {caption: ["자산분류명"], 		ref: 'ASSET_GROUP_NAME',    	type:'output',  	width:'250px',  	style:'text-align:left'},
        ];

        Fia1100Grid = _SBGrid.create(SBGridProperties);
        Fia1100Grid.bind('click', 			'fn_viewFia1100GridEvent');
    }
    //상세정보 보기
    function fn_viewFia1100GridEvent() {
    	
    	let nRow = Fia1100Grid.getRow();
    	let nCol = Fia1100Grid.getCol();
		if (nRow < 1) {
            return;
		}
        let rowData = Fia1100Grid.getRowData(nRow);
        p_sel_rowData = rowData;
        console.log('rowData:', rowData);
		
		if(rowData['ASSET_LEVEL_TYPE']=='LEVEL1'){
			fn_fmDisabled(true);
			$('#main-btn-del', 	parent.document).attr('disabled', true);
		} else {
			fn_fmDisabled(false);
			$('#main-btn-del', 	parent.document).attr('disabled', false);
		}
		
		if(rowData['DEPRECIATE_YN']=='Y'){
			fn_fmDisabled(true);
		} else {
			fn_fmDisabled(false);
		}
		
		fn_setFia1100Detail('Q1', rowData);
    }  
    
    /**
     * 화면 입력 상태
     */
    function fn_fmDisabled(type) {
		SBUxMethod.attr('FM_ASSET_LEVEL_TYPE', 		'readonly', type);
		SBUxMethod.attr('FM_ASSET_GROUP_CODE', 		'readonly', type);
		SBUxMethod.attr('FM_EXPENSE_TYPE', 			'readonly', type);
		SBUxMethod.attr('FM_ASSET_GROUP_NAME', 		'readonly', type);
		SBUxMethod.attr('FM_ASSET_CATEGORY', 		'readonly', type);
		
		SBUxMethod.attr('FM_CAPITAL_YN', 			'readonly', type);
		SBUxMethod.attr('FM_DEPRECIATE_YN', 		'readonly', type);
		SBUxMethod.attr('FM_USE_YN', 				'readonly', type);
		
		SBUxMethod.attr('FM_PARENT_ASSET_GROUP', 		'readonly', type);
		SBUxMethod.attr('BTN_POP1', 					'readonly', type);
		SBUxMethod.attr('FM_PARENT_ASSET_GROUP_NAME',	'readonly', type);
		
		SBUxMethod.attr('FM_INVENTORY_YN',				'readonly', type);
		SBUxMethod.attr('FM_OWNED_YN',					'readonly', type);
		SBUxMethod.attr('FM_LEASE_YN',					'readonly', type);
		
		SBUxMethod.attr('FM_DEPRECIATION_METHOD_GAAP',	'readonly', type);
		SBUxMethod.attr('FM_USEFUL_LIFE_GAAP',			'readonly', type);
		SBUxMethod.attr('FM_ASSET_ACCOUNT', 			'readonly', type);
		SBUxMethod.attr('BTN_POP2', 					'readonly', type);
		SBUxMethod.attr('FM_ASSET_ACC_NAME',			'readonly', type);
		
		SBUxMethod.attr('FM_DEPRECIATION_PERIOD_GAAP',	'readonly', type);
		SBUxMethod.attr('FM_SALVAGE_VALUE_GAAP',		'readonly', type);
		SBUxMethod.attr('FM_DEPR_EXP_ACC', 				'readonly', type);
		SBUxMethod.attr('BTN_POP3', 					'readonly', type);
		SBUxMethod.attr('FM_DEPR_EXP_ACC_NAME',			'readonly', type);
		
		SBUxMethod.attr('FM_SALVAGE_RATE_GAAP',			'readonly', type);
		SBUxMethod.attr('FM_ACCUM_DEPR_ACC', 			'readonly', type);
		SBUxMethod.attr('BTN_POP4', 					'readonly', type);
		SBUxMethod.attr('FM_ACCUM_DEPR_ACC_NAME',		'readonly', type);
		
		SBUxMethod.attr('FM_DEPRECIATION_METHOD_TAX',	'readonly', type);
		SBUxMethod.attr('FM_USEFUL_LIFE_TAX',			'readonly', type);
		SBUxMethod.attr('FM_SUBSIDIES_ACCOUNT', 		'readonly', type);
		SBUxMethod.attr('BTN_POP5', 					'readonly', type);
		SBUxMethod.attr('FM_SUBSIDIES_ACC_NAME',		'readonly', type);
		
		SBUxMethod.attr('FM_DEPRECIATION_PERIOD_TAX',	'readonly', type);
		SBUxMethod.attr('FM_SALVAGE_VALUE_TAX',			'readonly', type);
		SBUxMethod.attr('FM_SUBSIDIES_DEPR_ACC', 		'readonly', type);
		SBUxMethod.attr('BTN_POP6', 					'readonly', type);
		SBUxMethod.attr('FM_SUBSIDIES_DEPR_ACC_NAME',	'readonly', type);

		SBUxMethod.attr('FM_SALVAGE_RATE_TAX',				'readonly', type);
		SBUxMethod.attr('FM_SUBSIDIES_ACCUM_DEPR_ACC', 		'readonly', type);
		SBUxMethod.attr('BTN_POP7', 						'readonly', type);
		SBUxMethod.attr('FM_SUBSIDIES_ACCUM_DEPR_ACC_NAME',	'readonly', type);
		
		SBUxMethod.attr('FM_DEPRECIATION_METHOD_IFRS',		'readonly', type);
		SBUxMethod.attr('FM_USEFUL_LIFE_IFRS',				'readonly', type);
		SBUxMethod.attr('FM_DISPOSAL_PROFIT_ACCOUNT', 		'readonly', type);
		SBUxMethod.attr('BTN_POP8', 						'readonly', type);
		SBUxMethod.attr('FM_DISPOSAL_PROFIT_ACC_NAME',		'readonly', type);
		
		SBUxMethod.attr('FM_DEPRECIATION_PERIOD_IFRS',		'readonly', type);
		SBUxMethod.attr('FM_SALVAGE_VALUE_IFRS',			'readonly', type);
		SBUxMethod.attr('FM_DISPOSAL_LOSS_ACCOUNT', 		'readonly', type);
		SBUxMethod.attr('BTN_POP9', 						'readonly', type);
		SBUxMethod.attr('FM_DISPOSAL_LOSS_ACC_NAME',		'readonly', type);
		
		SBUxMethod.attr('FM_SALVAGE_RATE_IFRS',				'readonly', type);
		SBUxMethod.attr('FM_DISUSE_LOSS_ACCOUNT', 			'readonly', type);
		SBUxMethod.attr('BTN_POP10', 						'readonly', type);
		SBUxMethod.attr('FM_DISUSE_LOSS_ACC_NAME',			'readonly', type);
		
		SBUxMethod.attr('FM_MEMO',			'readonly', type);
		SBUxMethod.attr('FM_SORT_SEQ',		'readonly', type);
    }
    
    /**
     * 목록조회
     */
    const fn_setFia1100Grid = async function(wtype) {
		
  		Fia1100Grid.clearStatus();
    	
		let p_asset_group_name		= gfnma_nvl(SBUxMethod.get("SCH_ASSET_GROUP_NAME"));
		let p_depreciation_method	= gfnma_nvl(SBUxMethod.get("SCH_DEPRECIATION_METHOD"));
		let p_depreciation_period	= gfnma_nvl(SBUxMethod.get("SCH_DEPRECIATION_PERIOD"));
		let p_asset_category		= '';
		let p_asset_group_code		= '';
		
		if(wtype=='Q1' || wtype=='DATA'){
			p_asset_category	=	"";
			p_asset_group_code	=	"";
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
			,V_P_ASSET_GROUP_NAME		: p_asset_group_name
			,V_P_DEPRECIATION_METHOD	: p_depreciation_method
			,V_P_DEPRECIATION_PERIOD	: p_depreciation_period
			,V_P_ASSET_CATEGORY			: p_asset_category
			,V_P_ASSET_GROUP_CODE		: p_asset_group_code
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
		console.log('paramObj:', paramObj);
        const postJsonPromise = gfn_postJSON("/fi/ffa/com/selectFia1100List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '2',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFia1100Grid.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						LVL							: gfnma_nvl(item.LVL),	
  							
  						ASSET_CATEGORY				: gfnma_nvl(item.ASSET_CATEGORY),
  						ASSET_GROUP_CODE			: gfnma_nvl(item.ASSET_GROUP_CODE),
  						ASSET_GROUP_NAME			: gfnma_nvl(item.ASSET_GROUP_NAME),
  						ASSET_LEVEL_TYPE			: gfnma_nvl(item.ASSET_LEVEL_TYPE),
  						COMP_CODE					: gfnma_nvl(item.COMP_CODE),
  						
  						DEPRECIATE_YN				: gfnma_nvl(item.DEPRECIATE_YN),
  						DEPRECIATION_METHOD_GAAP	: gfnma_nvl(item.DEPRECIATION_METHOD_GAAP),
  						DEPRECIATION_METHOD_IFRS	: gfnma_nvl(item.DEPRECIATION_METHOD_IFRS),
  						DEPRECIATION_METHOD_TAX		: gfnma_nvl(item.DEPRECIATION_METHOD_TAX),
  						
  						EXPENSE_TYPE				: gfnma_nvl(item.EXPENSE_TYPE),
  						KEYID						: gfnma_nvl(item.KEYID),
  						PARENTKEYID					: gfnma_nvl(item.PARENTKEYID),
  						PARENT_ASSET_GROUP			: gfnma_nvl(item.PARENT_ASSET_GROUP),
  						
  						ETC							: gfnma_nvl(item.ETC),
  					}
  					jsonFia1100Grid.push(msg);
  					totalRecordCount ++;
  				});

        		Fia1100Grid.rebuild();
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
     * 건별조회
     */
    const fn_setFia1100Detail = async function(wtype, obj) {
		
		let p_asset_group_name		= gfnma_nvl(SBUxMethod.get("SCH_ASSET_GROUP_NAME"));
		let p_depreciation_method	= gfnma_nvl(SBUxMethod.get("SCH_DEPRECIATION_METHOD"));
		let p_depreciation_period	= gfnma_nvl(SBUxMethod.get("SCH_DEPRECIATION_PERIOD"));
		let p_asset_category		= gfnma_nvl(obj['ASSET_CATEGORY']);
		let p_asset_group_code		= gfnma_nvl(obj['ASSET_GROUP_CODE']);
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
			,V_P_ASSET_GROUP_NAME		: p_asset_group_name
			,V_P_DEPRECIATION_METHOD	: p_depreciation_method
			,V_P_DEPRECIATION_PERIOD	: p_depreciation_period
			,V_P_ASSET_CATEGORY			: p_asset_category
			,V_P_ASSET_GROUP_CODE		: p_asset_group_code
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
        const postJsonPromise = gfn_postJSON("/fi/ffa/com/selectFia1100List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '2',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {
  				
  				//폼에 데이터 셋	
  	          	gfnma_uxDataSet2('#dataArea1', data.cv_2[0], '', 'FM_', '');
  	          	if(p_asset_group_name){
  	      			SBUxMethod.attr('SCH_ASSET_GROUP_NAME',  'readonly', true);
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
     * 중분류 
     */
    function fn_compopup1(type) {
    	
    	//type C 형 팝업
    	var p_find1	= p_ss_languageID;
    	var p_find2	= gv_ma_selectedApcCd;
    	var p_find3	= gfnma_nvl(SBUxMethod.get("FM_ASSET_CATEGORY"));
   		var p_find4	= gfnma_nvl(SBUxMethod.get("FM_PARENT_ASSET_GROUP"));
		var p_find5	= gfnma_nvl(SBUxMethod.get("FM_PARENT_ASSET_GROUP_NAME"));
		
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산 소분류');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ASSET_LEVEL2_POPUP'
    		,popupType				: 'C'
    		,whereClause			: ''
   			,searchCaptions			: ["코드", 			"코드명"]
   			,searchInputFields		: ["ASSET_LEVEL2", 	"ASSET_LEVEL2_NAME"]
  			,searchInputValues		: [p_find4, 		p_find5]
			,searchInputTypes		: ["input", 		"input"]		//input, datepicker가 있는 경우
			
			,cTypeParamFields		: ["",			"",			"",			"ASSET_LEVEL2",		"ASSET_LEVEL2_NAME"]
			,cTypeParamValues		: [p_find1,		p_find2,	p_find3,	p_find4,			p_find5]
			
    		,width					: '600px'
    		,height					: '400px'
   			,tableHeader			: ["중분류코드", 	"중분류명",				"자산구분",			"자산구분명",			"자산계정",			"자산계정명",			"depr_exp_acc",					"depr_exp_acc_name",					"accum_depr_acc",					"accum_depr_acc_name",						"보조금계정",					"보조금계정명",				"보조금상각비계정",		"상각누계액계정",			"보증금상각누계액계정",			"보증금상각누계액계정명",			"상각주기(회계기준)",		"상각기준(IFRS)",			"상각주기(법인세)",			"상각방법(회계기준)",		"상각방법(IFRS)",			"상각방법(법인세)",			"잔존율(회계기준)",		"잔존율(IFRS)",				"잔존율(법인세)",		"잔존가치(회계기준)",	"잔존가치(국제회계기준)",	"잔존가치(법인세)",		"내용연수(회계기준)",	"내용연수(IFRS)",	"내용연수(법인세)",	"자산화여부",		"상각여부",			"사용여부",	"재고관리여부",	"리스여부",	"소유여부"]
   			,tableColumnNames		: ["ASSET_LEVEL2", 	"ASSET_LEVEL2_NAME",	"ASSET_CATEGORY",	"ASSET_CATEGORY_NAME",	"ASSET_ACCOUNT",	"ASSET_ACCOUNT_NAME",	"DEPR_EXP_ACC",					"DEPR_EXP_ACC_NAME",					"ACCUM_DEPR_ACC",					"ACCUM_DEPR_ACC_NAME",						"SUBSIDIES_ACCOUNT",			"SUBSIDIES_ACCOUNT_NAME",	"SUBSIDIES_DEPR_ACC",	"SUBSIDIES_DEPR_ACC_NAME",	"SUBSIDIES_ACCUM_DEPR_ACC",		"SUBSIDIES_ACCUM_DEPR_ACC_NAME",	"DEPRECIATION_PERIOD_GAAP",	"DEPRECIATION_PERIOD_IFRS",	"DEPRECIATION_PERIOD_TAX",	"DEPRECIATION_METHOD_GAAP",	"DEPRECIATION_METHOD_IFRS",	"DEPRECIATION_METHOD_TAX",	"SALVAGE_RATE_GAAP",	"SALVAGE_RATE_IFRS",		"SALVAGE_RATE_TAX",		"SALVAGE_VALUE_GAAP",	"SALVAGE_VALUE_IFRS",		"SALVAGE_VALUE_TAX",	"USEFUL_LIFE_GAAP",		"USEFUL_LIFE_IFRS",	"USEFUL_LIFE_TAX",	"CAPITAL_YN",		"DEPRECIATE_YN",	"USE_YN",	"INVENTORY_YN",	"LEASE_YN",	"OWNED_YN"]
   			,tableColumnWidths		: ["100px", 		"100px",				"100px",			"200px",				"100px",			"150px",				"100px",						"200px",								"100px",							"100px",									"200px",						"150px",					"150px",				"150px",					"200px",						"150px",							"150px",					"150px",					"150px",					"150px",					"150px",					"150px",					"150px",				"150px",					"150px",				"150px",				"150px",					"150px",				"150px",				"150px",			"100px",			"100px",			"100px",			"100px",	"100px",		"100px",	"100px"	]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('FM_PARENT_ASSET_GROUP', 		data.ASSET_LEVEL2);
				SBUxMethod.set('FM_PARENT_ASSET_GROUP_NAME', 	data.ASSET_LEVEL2_NAME);
			},
    	});
    }    
    
    /**
     * 자산계정 팝업
     */
    var fn_compopup2 = function(type) {
    	
    	//type A 형 팝업
    	
        var searchText1		= null;
        var searchText2		= null;
        if(type=='1'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACCOUNT"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACC_NAME"));
        } else if(type=='2'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_DEPR_EXP_ACC"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_DEPR_EXP_ACC_NAME"));
        } else if(type=='3'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_ACCUM_DEPR_ACC"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_ACCUM_DEPR_ACC_NAME"));
        } else if(type=='4'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_ACCOUNT"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_ACC_NAME"));
        } else if(type=='5'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_DEPR_ACC"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_DEPR_ACC_NAME"));
        } else if(type=='6'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_ACCUM_DEPR_ACC"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_ACCUM_DEPR_ACC_NAME"));
        } else if(type=='7'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_DISPOSAL_PROFIT_ACCOUNT"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_DISPOSAL_PROFIT_ACC_NAME"));
        } else if(type=='8'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_DISPOSAL_LOSS_ACCOUNT"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_DISPOSAL_LOSS_ACC_NAME"));
        } else if(type=='9'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_DISUSE_LOSS_ACCOUNT"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_DISUSE_LOSS_ACC_NAME"));
        }
        
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_";
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사용자 조회');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 			"명칭"]
   			,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,searchInputValues		: [searchText1, 	searchText2]
    		,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드", 		"계정명"]
   			,tableColumnNames		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
			,tableColumnWidths		: ["100px", 		"300px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				if(type=='1'){
					SBUxMethod.set('FM_ASSET_ACCOUNT', data.ACCOUNT_CODE);
					SBUxMethod.set('FM_ASSET_ACC_NAME', data.ACCOUNT_NAME);
				} else if(type=='2'){
					SBUxMethod.set('FM_DEPR_EXP_ACC', data.ACCOUNT_CODE);
					SBUxMethod.set('FM_DEPR_EXP_ACC_NAME', data.ACCOUNT_NAME);
				} else if(type=='3'){
					SBUxMethod.set('FM_ACCUM_DEPR_ACC', data.ACCOUNT_CODE);
					SBUxMethod.set('FM_ACCUM_DEPR_ACC_NAME', data.ACCOUNT_NAME);
				} else if(type=='4'){
					SBUxMethod.set('FM_SUBSIDIES_ACCOUNT', data.ACCOUNT_CODE);
					SBUxMethod.set('FM_SUBSIDIES_ACC_NAME', data.ACCOUNT_NAME);
				} else if(type=='5'){
					SBUxMethod.set('FM_SUBSIDIES_DEPR_ACC', data.ACCOUNT_CODE);
					SBUxMethod.set('FM_SUBSIDIES_DEPR_ACC_NAME', data.ACCOUNT_NAME);
				} else if(type=='6'){
					SBUxMethod.set('FM_SUBSIDIES_ACCUM_DEPR_ACC', data.ACCOUNT_CODE);
					SBUxMethod.set('FM_SUBSIDIES_ACCUM_DEPR_ACC_NAME', data.ACCOUNT_NAME);
				} else if(type=='7'){
					SBUxMethod.set('FM_DISPOSAL_PROFIT_ACCOUNT', data.ACCOUNT_CODE);
					SBUxMethod.set('FM_DISPOSAL_PROFIT_ACC_NAME', data.ACCOUNT_NAME);
				} else if(type=='8'){
					SBUxMethod.set('FM_DISPOSAL_LOSS_ACCOUNT', data.ACCOUNT_CODE);
					SBUxMethod.set('FM_DISPOSAL_LOSS_ACC_NAME', data.ACCOUNT_NAME);
				} else if(type=='9'){
					SBUxMethod.set('FM_DISUSE_LOSS_ACCOUNT', data.ACCOUNT_CODE);
					SBUxMethod.set('FM_DISUSE_LOSS_ACC_NAME', data.ACCOUNT_NAME);
				}
			},
    	});
  	}     
    
    /**
     * 신규
     */
 	function cfn_add() {
    	
		SBUxMethod.set('"FM_USE_YN"', 'Y');
    	
		$('#LA_PARENT_ASSET_LABEL').hide();
		SBUxMethod.hide('FM_PARENT_ASSET_GROUP');
		SBUxMethod.hide('BTN_POP1');
		SBUxMethod.hide('FM_PARENT_ASSET_GROUP_NAME');
		
		fn_fmDisabled(false);
    	
		$('#main-btn-save', parent.document).attr('disabled', false);
		$('#main-btn-del', 	parent.document).attr('disabled', true);
    }
    
    /**
     * 저장
     */
    function cfn_save() {
    	
		//자산분류코드
		var p_group_code = SBUxMethod.getAttr('FM_ASSET_GROUP_CODE');
		console.log(p_group_code);
		var p_strStatus = '';
    	if(p_group_code.readonly == 'true'){
            strStatus = "U";
    	} else {
            strStatus = "N";
    	}
    	
    	fn_saveFia1100(strStatus, function(){
    		
    		$('#main-btn-new', 	parent.document).attr('disabled', false);
    		$('#main-btn-save', parent.document).attr('disabled', true);
    		$('#main-btn-del', 	parent.document).attr('disabled', false);
    		fn_fmDisabled(true);
    		
    		cfn_search();
    	});
    }
    
    /**
     * 저장 처리
     */
    const fn_saveFia1100 = async function(status, callbackFn) {
		
		let p_asset_group_name		= gfnma_nvl(SBUxMethod.get("SCH_ASSET_GROUP_NAME"));
    	
		let p_asset_group_code		= gfnma_nvl(SBUxMethod.get("FM_ASSET_GROUP_CODE"));
		let p_asset_group_name1		= gfnma_nvl(SBUxMethod.get("FM_ASSET_GROUP_NAME"));
		let p_asset_category		= gfnma_nvl(SBUxMethod.get("FM_ASSET_CATEGORY"));
		let p_asset_level_type		= gfnma_nvl(SBUxMethod.get("FM_ASSET_LEVEL_TYPE"));
		let p_parent_asset_group	= gfnma_nvl(SBUxMethod.get("FM_PARENT_ASSET_GROUP"));
		let p_expanse_type			= gfnma_nvl(SBUxMethod.get("FM_EXPENSE_TYPE"));
		
		let p_useful_life_gaap		= gfnma_nvl(SBUxMethod.get("FM_USEFUL_LIFE_GAAP"));
		let p_useful_life_ifrs		= gfnma_nvl(SBUxMethod.get("FM_USEFUL_LIFE_IFRS"));
		let p_useful_life_tax		= gfnma_nvl(SBUxMethod.get("FM_USEFUL_LIFE_TAX"));
		
		let p_salvage_rate_gaap		= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_RATE_GAAP"));
		let p_salvage_rate_ifrs		= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_RATE_IFRS"));
		let p_salvage_rate_tax		= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_RATE_TAX"));
		
		let p_salvage_value_gaap	= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_VALUE_GAAP"));
		let p_salvage_value_ifrs	= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_VALUE_IFRS"));
		let p_salvage_value_tax		= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_VALUE_TAX"));
		
		let p_depreciation_method_gaap	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_METHOD_GAAP"));
		let p_depreciation_method_ifrs	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_METHOD_IFRS"));
		let p_depreciation_method_tax	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_METHOD_TAX"));
		let p_depreciation_period_gaap	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_PERIOD_GAAP"));
		let p_depreciation_period_ifrs	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_PERIOD_IFRS"));
		let p_depreciation_period_tax	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_PERIOD_TAX"));
		
		let p_asset_account				= gfnma_nvl(SBUxMethod.get("FM_ASSET_ACCOUNT"));
		let p_depr_exp_acc				= gfnma_nvl(SBUxMethod.get("FM_DEPR_EXP_ACC"));
		let p_accum_depr_acc			= gfnma_nvl(SBUxMethod.get("FM_ACCUM_DEPR_ACC"));
		let p_subsidies_account			= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_ACCOUNT"));
		let p_subsidies_depr_acc		= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_DEPR_ACC"));
		let p_subsidies_accum_depr_acc	= gfnma_nvl(SBUxMethod.get("FM_SUBSIDIES_ACCUM_DEPR_ACC"));
		
		let p_disposal_profit_account	= gfnma_nvl(SBUxMethod.get("FM_DISPOSAL_PROFIT_ACCOUNT"));
		let p_disposal_loss_account		= gfnma_nvl(SBUxMethod.get("FM_DISPOSAL_LOSS_ACCOUNT"));
		let p_disuse_loss_account		= gfnma_nvl(SBUxMethod.get("FM_DISUSE_LOSS_ACCOUNT"));
		
		let p_memo						= gfnma_nvl(SBUxMethod.get("FM_MEMO"));
		let p_sort_seq					= gfnma_nvl(SBUxMethod.get("FM_SORT_SEQ"));
		
		let p_capital_yn				= gfnma_nvl(SBUxMethod.get("FM_CAPITAL_YN")['FM_CAPITAL_YN']);
		let p_inventory_yn				= gfnma_nvl(SBUxMethod.get("FM_INVENTORY_YN")['FM_INVENTORY_YN']);
		let p_owned_yn					= gfnma_nvl(SBUxMethod.get("FM_OWNED_YN")['FM_OWNED_YN']);
		let p_lease_yn					= gfnma_nvl(SBUxMethod.get("FM_LEASE_YN")['FM_LEASE_YN']);
		let p_depreciate_yn				= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATE_YN")['FM_DEPRECIATE_YN']);
		let p_use_yn					= gfnma_nvl(SBUxMethod.get("FM_USE_YN")['FM_USE_YN']);
		
    	if(status=='N' || status=='U'){
	    	if(!p_asset_level_type){
	    		gfn_comAlert("E0000","분류구분을 등록하세요");
	    		return;
	    	}
	    	if(!p_asset_group_code){
	    		gfn_comAlert("E0000","자산분류코드를 등록하세요");
	    		return;
	    	}
	    	if(!p_asset_category){
	    		gfn_comAlert("E0000","자산구분을 등록하세요");
	    		return;
	    	}
	    	if(!p_asset_group_name1){
	    		gfn_comAlert("E0000","자산분류명을 등록하세요");
	    		return;
	    	}
	    	if(!p_sort_seq){
	    		gfn_comAlert("E0000","정렬순서를 등록하세요");
	    		return;
	    	}
    	}
		
    	if(status=='N'){
			if(gfn_comConfirm("Q0001", "신규 등록")){
			} else {
				return;
			}      	
    	} else if(status=='U') {
			if(gfn_comConfirm("Q0001", "수정")){
			} else {
				return;
			}       	
    	} else {
			if(gfn_comConfirm("Q0001", p_asset_group_name + "을 삭제")){
			} else {
				return;
			}       	
    	}
    	
	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
			,V_P_ASSET_GROUP_CODE			: p_asset_group_code
			,V_P_ASSET_GROUP_NAME			: p_asset_group_name1
			,V_P_ASSET_CATEGORY				: p_asset_category
			,V_P_ASSET_LEVEL_TYPE			: p_asset_level_type
			,V_P_PARENT_ASSET_GROUP			: p_parent_asset_group
			,V_P_EXPENSE_TYPE				: p_expanse_type
			,V_P_USEFUL_LIFE_GAAP			: p_useful_life_gaap
			,V_P_USEFUL_LIFE_IFRS			: p_useful_life_ifrs
			,V_P_USEFUL_LIFE_TAX			: p_useful_life_tax
			
			,V_P_SALVAGE_RATE_GAAP			: p_salvage_rate_gaap
			,V_P_SALVAGE_RATE_IFRS			: p_salvage_rate_ifrs
			,V_P_SALVAGE_RATE_TAX			: p_salvage_rate_tax
			,V_P_SALVAGE_VALUE_GAAP			: p_salvage_value_gaap
			,V_P_SALVAGE_VALUE_IFRS			: p_salvage_value_ifrs
			,V_P_SALVAGE_VALUE_TAX			: p_salvage_value_tax
			
			,V_P_DEPRECIATION_METHOD_GAAP	: p_depreciation_method_gaap
			,V_P_DEPRECIATION_METHOD_IFRS	: p_depreciation_method_ifrs
			,V_P_DEPRECIATION_METHOD_TAX	: p_depreciation_method_tax
			,V_P_DEPRECIATION_PERIOD_GAAP	: p_depreciation_period_gaap
			,V_P_DEPRECIATION_PERIOD_IFRS	: p_depreciation_period_ifrs
			,V_P_DEPRECIATION_PERIOD_TAX	: p_depreciation_period_tax
			
			,V_P_ASSET_ACCOUNT				: p_asset_account
			,V_P_DEPR_EXP_ACC				: p_depr_exp_acc
			,V_P_ACCUM_DEPR_ACC				: p_accum_depr_acc
			,V_P_SUBSIDIES_ACCOUNT			: p_subsidies_account
			,V_P_SUBSIDIES_DEPR_ACC			: p_subsidies_depr_acc
			,V_P_SUBSIDIES_ACCUM_DEPR_ACC	: p_subsidies_accum_depr_acc
			,V_P_DISPOSAL_PROFIT_ACCOUNT	: p_disposal_profit_account
			,V_P_DISPOSAL_LOSS_ACCOUNT		: p_disposal_loss_account
			,V_P_DISUSE_LOSS_ACCOUNT		: p_disuse_loss_account
			
			,V_P_MEMO						: p_memo
			,V_P_SORT_SEQ					: p_sort_seq
			
			,V_P_CAPITAL_YN					: p_capital_yn
			,V_P_INVENTORY_YN				: p_inventory_yn
			,V_P_OWNED_YN					: p_owned_yn
			,V_P_LEASE_YN					: p_lease_yn
			,V_P_DEPRECIATE_YN				: p_depreciate_yn
			,V_P_USE_YN						: p_use_yn
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
        const postJsonPromise = gfn_postJSON("/fi/ffa/com/insertFia1100.do", {
        	getType				: 'json',
        	workType			: status,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {
        	} else {
          		alert(data.resultMessage);
        	}
			if(callbackFn){
 				callbackFn();
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
     * 삭제
     */
    function cfn_del() {
    	
    	if(p_sel_rowData['PARENT_ASSET_GROUP']){
      		gfn_comAlert("E0000","소분류가 존재하여 삭제할 수 없습니다. 소분류를 먼저 삭제해주세요.");
			return;      		 
    		
    	}
    	
		var p_strStatus = 'D';
    	fn_saveFia1100(strStatus, function(){
    		
    		$('#main-btn-new', 	parent.document).attr('disabled', false);
    		$('#main-btn-save', parent.document).attr('disabled', true);
    		$('#main-btn-del', 	parent.document).attr('disabled', false);
    		fn_fmDisabled(true);
    		
    		cfn_search();
    	});
    }
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>