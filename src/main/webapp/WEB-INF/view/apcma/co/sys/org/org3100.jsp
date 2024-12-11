<%
/**
 * @Class Name 		: Org3100.jsp
 * @Description 	: 원가중심점 정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.08.08
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.08.08   	천용진		최초 생성
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
	<title>title : 원가중심점 정보</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
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
	                            <td colspan="3" class="td_input" colspan="" style="border-right:hidden;">
									<div class="dropdown">
									    <button 
									    	style="width:160px;text-align:left" 
									    	class="btn btn-sm btn-light dropdown-toggle " 
									    	type="button"
									    	id="SRCH_FI_ORG_CODE" 
									    	data-toggle="dropdown" 
									    	aria-haspopup="true" 
									    	aria-expanded="false">
									    	<font>선택</font>
									        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
									    </button>
									    <div class="dropdown-menu" aria-labelledby=SRCH_FI_ORG_CODE style="width:250px;height:250px;padding-top:0px;overflow:auto">
									    </div>
									</div>                                
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">원가유형</th>
	                            <td colspan="3" class="td_input" style="border-right: hidden;">
									<div class="dropdown">
									    <button 
									    	style="width:160px;text-align:left" 
									    	class="btn btn-sm btn-light dropdown-toggle " 
									    	type="button"
									    	id="SRCH_COST_CLASS" 
									    	data-toggle="dropdown" 
									    	aria-haspopup="true" 
									    	aria-expanded="false">
									    	<font>선택</font>
									        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
									    </button>
									    <div class="dropdown-menu" aria-labelledby=SRCH_COST_CLASS style="width:250px;height:250px;padding-top:0px;overflow:auto">
									    </div>
									</div>                                    
	                            </td>
	                            <td></td>
	                            <th scope="row" class="th_bg_search">배부대상</th>
	                            <td colspan="3" class="td_input" style="border-right: hidden;">
									<div class="dropdown">
									    <button 
									    	style="width:160px;text-align:left" 
									    	class="btn btn-sm btn-light dropdown-toggle " 
									    	type="button"
									    	id="SRCH_PATH_TYPE" 
									    	data-toggle="dropdown" 
									    	aria-haspopup="true" 
									    	aria-expanded="false">
									    	<font>선택</font>
									        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
									    </button>
									    <div class="dropdown-menu" aria-labelledby=SRCH_PATH_TYPE style="width:250px;height:250px;padding-top:0px;overflow:auto">
									    </div>
									</div>                                    
	                            </td>
	                            <td></td>                            
	                        </tr>
	                        <tr>
	                            <th scope="row" class="th_bg_search">원가중심점코드</th>
	                            <td class="td_input" colspan="3" style="border-right:hidden;">
	                                <sbux-input id="SRCH_COST_CENTER_CODE" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">원가중심점명</th>
	                            <td colspan="3" class="td_input" style="border-right: hidden;">
	                                <sbux-input id="SRCH_COST_CENTER_NAME" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>                            
	                        </tr>
	                    </tbody>
	                </table>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>◎ 원가중심점 리스트</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdOrg3100" style="height:70vh; width:100%;"></div>
                        </div>
                    </div>
                    <sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="normal"
						is-scrollable="false"
						title-target-id-array="NORMAL^CATEGORY"
						title-text-array="기본정보^관리항목">
					</sbux-tabs>
                    <div class="col-sm-8 tab-content">
                        <div id="NORMAL" style="height:65vh;">
	                    	<table id="dataArea1" class="table table-bordered tbl_fixed">
								<colgroup>
									<col style="width:13%">
									<col style="width:12%">
									<col style="width:15%">
									<col style="width:10%">
									<col style="width:10%">
									<col style="width:15%">
									<col style="width:15%">
									<col style="width:10%">
								</colgroup>
								<tr>
									<th scope="row" class="th_bg">APC</th>
									<td class="td_input" style="border-right: hidden;" colspan="7">
										<div class="dropdown">
											<button 
												style="width:160px;text-align:left" 
												class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
												type="button"
												id="FI_ORG_CODE" 
												data-toggle="dropdown" 
												aria-haspopup="true" 
												aria-expanded="false"
												group-id="panAppoint" required>
												<font>선택</font>
												<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
											</button>
											<div class="dropdown-menu" aria-labelledby=FI_ORG_CODE style="width:250px;height:250px;padding-top:0px;overflow:auto">
											</div>
										</div>                                    
									</td>	                                    
								</tr>    
								<tr>
									<th scope="row" class="th_bg">원가중심점코드</th>
									<td class="td_input" colspan="3">
										<sbux-input id="COST_CENTER_CODE" class="form-control input-sm inpt_data_reqed"  uitype="text"  style="width:100% group-id="panAppoint" required"></sbux-input>
									</td>
									<th scope="row" class="th_bg">사용여부</th>
									<td colspan="3" class="td_input" style="border-right: hidden;">
										<sbux-checkbox uitype="normal" id="USE_YN" class="form-control input-sm check" text="사용여부" true-value="Y" false-value="N"/>
									</td>
								</tr>    
								<tr>
									<th scope="row" class="th_bg">원가중심점명</th>
									<td colspan="7" class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="COST_CENTER_NAME" class="form-control input-sm inpt_data_reqed" group-id="panAppoint" required></sbux-input>
									</td>
								</tr>                                   
								<tr>
									<th scope="row" class="th_bg">원가중심점(한글)</th>
									<td colspan="7" class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="COST_CENTER_NAME_CHN" class="form-control input-sm" ></sbux-input>
									</td>
								</tr> 
								<tr>
									<th scope="row" class="th_bg">본지점계정</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="PARENT_COST_CENTER" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="PARENT_COST_CENTER_NAME" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupParent" ></sbux-button>
									</td>
									<th scope="row" class="th_bg">상위여부</th>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<sbux-checkbox uitype="normal" id="PARENT_YN" class="form-control input-sm check" text="상위" true-value="Y" false-value="N"/>
									</td>										
								</tr>   
								<tr>
									<th scope="row" class="th_bg">원가유형</th>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<div class="dropdown">
											<button 
												style="width:160px;text-align:left" 
												class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
												type="button"
												id="COST_CLASS" 
												data-toggle="dropdown" 
												aria-haspopup="true" 
												aria-expanded="false"
												group-id="panAppoint" required>
												<font>선택</font>
												<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
											</button>
											<div class="dropdown-menu" aria-labelledby=COST_CLASS style="width:250px;height:250px;padding-top:0px;overflow:auto">
											</div>
										</div>                                    
									</td>
									<th scope="row" class="th_bg">최종여부</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox uitype="normal" id="FINAL_FLAG" class="form-control input-sm check" text="최종" true-value="Y" false-value="N"/>
									</td>				                            										
								</tr>
								<tr>
									<th scope="row" class="th_bg">사업부</th>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<div class="dropdown">
											<button 
												style="width:160px;text-align:left" 
												class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
												type="button"
												id="DIV_CODE" 
												data-toggle="dropdown" 
												aria-haspopup="true" 
												aria-expanded="false"
												group-id="panAppoint" required>
												<font>선택</font>
												<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
											</button>
											<div class="dropdown-menu" aria-labelledby=DIV_CODE style="width:250px;height:250px;padding-top:0px;overflow:auto">
											</div>
										</div>                                    
									</td>
									<th scope="row" class="th_bg">공장</th>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<div class="dropdown">
											<button 
												style="width:160px;text-align:left" 
												class="btn btn-sm btn-light dropdown-toggle " 
												type="button"
												id="PLANT_CODE" 
												data-toggle="dropdown" 
												aria-haspopup="true" 
												aria-expanded="false">
												<font>선택</font>
												<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
											</button>
											<div class="dropdown-menu" aria-labelledby=PLANT_CODE style="width:250px;height:250px;padding-top:0px;overflow:auto">
											</div>
										</div>                                    
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">직간접비</th>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<div class="dropdown">
											<button 
												style="width:160px;text-align:left" 
												class="btn btn-sm btn-light dropdown-toggle " 
												type="button"
												id="PROD_RELATION_FLAG" 
												data-toggle="dropdown" 
												aria-haspopup="true" 
												aria-expanded="false">
												<font>선택</font>
												<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
											</button>
											<div class="dropdown-menu" aria-labelledby=PROD_RELATION_FLAG style="width:250px;height:250px;padding-top:0px;overflow:auto">
											</div>
										</div>                                    
									</td>
									<th scope="row" class="th_bg">배부기준코드</th>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<div class="dropdown">
											<button 
												style="width:160px;text-align:left" 
												class="btn btn-sm btn-light dropdown-toggle " 
												type="button"
												id="DEFAULT_DRIVER_CODE" 
												data-toggle="dropdown" 
												aria-haspopup="true" 
												aria-expanded="false">
												<font>선택</font>
												<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
											</button>
											<div class="dropdown-menu" aria-labelledby=DEFAULT_DRIVER_CODE style="width:250px;height:250px;padding-top:0px;overflow:auto">
											</div>
										</div>                                    
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">설비</th>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<sbux-input uitype="text" id="PLANT_NAME" class="form-control input-sm" ></sbux-input>
									</td>
									<th scope="row" class="th_bg">정렬순서</th>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<sbux-input uitype="text" id="SORT_SEQ" class="form-control input-sm" ></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">판관원가중심점</th>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<div class="dropdown">
											<button 
												style="width:160px;text-align:left" 
												class="btn btn-sm btn-light dropdown-toggle " 
												type="button"
												id="MG_COST_CENTER" 
												data-toggle="dropdown" 
												aria-haspopup="true" 
												aria-expanded="false">
												<font>선택</font>
												<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
											</button>
											<div class="dropdown-menu" aria-labelledby=MG_COST_CENTER style="width:250px;height:250px;padding-top:0px;overflow:auto">
											</div>
										</div>                                    
									</td>
									<th scope="row" class="th_bg">전표대상</th>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<sbux-checkbox uitype="normal" id="DOC_INPUT_YN" class="form-control input-sm check" text="상위" true-value="Y" false-value="N"/>
									</td>				                            										
								</tr>	
								<tr>
									<th scope="row" class="th_bg">적요</th>
									<td class="td_input" style="border-right: hidden;" colspan="7">
										<sbux-input uitype="text" id="DESCRIPTION" class="form-control input-sm " ></sbux-input>
									</td>								
								</tr>		
								<tr>
									<th scope="row" class="th_bg">부서</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="DEPT_CODE" class="form-control input-sm inpt_data_reqed" group-id="panAppoint" required></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="DEPT_NAME" class="form-control input-sm inpt_data_reqed" group-id="panAppoint" required></sbux-input>
									</td>
									<td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupDept" ></sbux-button>
									</td>
									<th scope="row" class="th_bg">손익사업장</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="SITE_CODE" class="form-control input-sm inpt_data_reqed" group-id="panAppoint" required></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="SITE_NAME" class="form-control input-sm inpt_data_reqed" group-id="panAppoint" required ></sbux-input>
									</td>
									<td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupSite" ></sbux-button>
									</td>
								</tr>  													
								<tr>
									<th scope="row" class="th_bg">대체원가중심점</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="TRANS_COST_CENTER" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="TRANS_COST_CENTER_NAME" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupTrans" ></sbux-button>
									</td>
									<th scope="row" class="th_bg">센터장</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="COST_CENTER_LEADER" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="COST_CENTER_LEADER_NAME" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupLeader" ></sbux-button>
									</td>
								</tr>				 
								<tr>
									<th scope="row" class="th_bg">예산C/C</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="BUDGET_COST_CENTER" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="BUDGET_COST_CENTER_NAME" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupBudget" ></sbux-button>
									</td>
									<th scope="row" class="th_bg">예산관리</th>
									<td class="td_input" style="border-right: hidden;"colspan="3">
										<sbux-checkbox uitype="normal" id="BUDGET_YN" class="form-control input-sm check" text="예" true-value="Y" false-value="N"/>
									</td>
								</tr>  													 
	                    	</table>
                    	</div>              	
                        <div id="CATEGORY" style="height:65vh;">
	                    	<table id="dataArea2" class="table table-bordered tbl_fixed">
								<colgroup>
									<col style="width:15%">
									<col style="width:35%">
									<col style="width:15%">
									<col style="width:35%">
								</colgroup>
								<tr>
									<th scope="row" class="th_bg">참조1</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input id="ATTR1" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
									</td>	                                    
									<th scope="row" class="th_bg">참조6</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input id="ATTR6" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
									</td>	                                    
								</tr>    
								<tr>
									<th scope="row" class="th_bg">참조2</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input id="ATTR2" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
									</td>	                                    
									<th scope="row" class="th_bg">참조7</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input id="ATTR7" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
									</td>	                                    
								</tr>    
								<tr>
									<th scope="row" class="th_bg">참조3</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input id="ATTR3" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
									</td>	                                    
									<th scope="row" class="th_bg">총원가사업장배부</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input id="ATTR8" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
									</td>	                                    
								</tr>    
								<tr>
									<th scope="row" class="th_bg">참조4</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input id="ATTR4" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
									</td>	                                    
									<th scope="row" class="th_bg">참조9</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input id="ATTR9" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
									</td>	                                    
								</tr>    
								<tr>
									<th scope="row" class="th_bg">참조5</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input id="ATTR5" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
									</td>	                                    
									<th scope="row" class="th_bg">참조10</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input id="ATTR10" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
									</td>	                                    
								</tr>    
	                    	</table>
                    	</div>              	
                </div>
            </div>
        </div>
    </section>
    
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal 
        	id="modal-compopup1" 
        	name="modal-compopup1" 
        	uitype="middle" 
        	header-title="" 
        	body-html-id="body-com-popup1" 
        	header-is-close-button="true" footer-is-close-button="false" style="width:1000px">
        </sbux-modal>
    </div>
    <div id="body-com-popup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
</body>

<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.id}';
	//-----------------------------------------------------------
	var workType = 'N'
	var jsonEmpState = []; // 재직구분
	const fn_initSBSelect = async function() {
		
		let rst = await Promise.all([
			
			//재직구분
		    gfnma_setComSelect([''], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		    
			//APC
			gfnma_multiSelectInit({
				target			: ['#SRCH_FI_ORG_CODE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM022'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'FI_ORG_CODE'
				,colLabel		: 'FI_ORG_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'FI_ORG_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명", 		ref: 'FI_ORG_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
		    
			//원가유형
			gfnma_multiSelectInit({
				target			: ['#SRCH_COST_CLASS']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM101'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "코드명",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),
		    
			//배부대상
			gfnma_multiSelectInit({
				target			: ['#SRCH_PATH_TYPE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM102'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "코드명",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),
		    
			//APC
			gfnma_multiSelectInit({
				target			: ['#FI_ORG_CODE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM022'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'FI_ORG_CODE'
				,colLabel		: 'FI_ORG_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'FI_ORG_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명", 		ref: 'FI_ORG_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
		    
			//원가유형
			gfnma_multiSelectInit({
				target			: ['#COST_CLASS']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM101'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "코드명",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),

			//원가유형
			gfnma_multiSelectInit({
				target			: ['#DIV_CODE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM102'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "코드명",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),

			//공장
			gfnma_multiSelectInit({
				target			: ['#PLANT_CODE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM104'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "코드명",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),

			//직간접비
			gfnma_multiSelectInit({
				target			: ['#PROD_RELATION_FLAG']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM107'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "코드명",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),

			//배부기준코드
			gfnma_multiSelectInit({
				target			: ['#DEFAULT_DRIVER_CODE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COST_DRIVER_CODE'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'COST_DRIVER_CODE'
				,colLabel		: 'COST_DRIVER_NAME'
				,columns		:[
		            {caption: "배부기준코드",	ref: 'COST_DRIVER_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "배부기준명",	ref: 'COST_DRIVER_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),

			//판관원가중심점
			gfnma_multiSelectInit({
				target			: ['#MG_COST_CENTER']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_CC_MG'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'COST_CENTER_CODE'
				,colLabel		: 'COST_CENTER_NAME'
				,columns		:[
		            {caption: "원가중심점코드",	ref: 'COST_CENTER_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "원가중심점명",		ref: 'COST_CENTER_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_initSBSelect();
    	fn_createGrid();
    	cfn_search();
    });
    
	// 신규
	function cfn_add() {
		workType = 'N';
		fn_clearSubForm();
	}
	/**
	 * 초기화
	 */
	function cfn_init() {
		gfnma_uxDataClear('#srchArea1');
	}
    // 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
			workType = 'U';
	        fn_save();
		}
    }
	
	// 마스터 그리드 삭제
	function cfn_del() {
		if(gfn_comConfirm("Q0001", "삭제")){ //{0} 하시겠습니까?
			fn_delete();
		}
	}
 
	// 조회
	function cfn_search() {
		fn_search();
	}

    //grid 초기화
    var masterTreeGrid; 					// 원가중심점 그리드를 담기위한 객체 선언
    var jsonMasterTreeList			= []; 	// 원가중심점 그리드의 참조 데이터 주소 선언
    function fn_createGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdOrg3100';
	    SBGridProperties.id 				= 'masterTreeGrid';
	    SBGridProperties.jsonref 			= 'jsonMasterTreeList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.useinitsorting 	= true;
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.tree = {
	            col: 1,
	            levelref: "LVL",
	            open: true,
	            lock: true
        };
        SBGridProperties.columns = [
            {caption : ["원가중심점코드"],		ref: 'COST_CENTER_CODE', 	type:'output',  	width:'100px',  	style:'text-align:center'},
            {caption : ["원가중심점명"],		ref: 'COST_CENTER_NAME', 	type:'output',  	width:'150px',  	style:'text-align:center'},
            {caption: ['상위여부'],    ref: 'PARENT_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center',
            		disabled : true
            },
            {caption : ["본지점계정명"],	ref: 'PARENT_COST_CENTER',		type:'output',  	width:'200px',  	style:'text-align:center'},
            {caption : ["부서코드"],			ref: 'DEPT_CODE',		type:'output',  	width:'100px',  	style:'text-align:center'},
            {caption : ["부서명"],			ref: 'DEPT_NAME',		type:'output',  	width:'100px',  	style:'text-align:center'},
            {caption: ['예산관리여부'],   		ref: 'BUDGET_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center',
            		disabled : true
            },
            {caption : ["예산코스트센터"],		ref: 'BUDGET_COST_CENTER',		type:'output',  	width:'100px',  	style:'text-align:center'},
            {caption : ["예산코스트센터명"],	ref: 'BUDGET_COST_CENTER_NAME',		type:'output',  	width:'150px',  	style:'text-align:center'},
            {caption : ["코스트센터장"],		ref: 'COST_CENTER_LEADER',		type:'output',  	width:'200px',  	style:'text-align:center'}
        ];
        masterTreeGrid	= _SBGrid.create(SBGridProperties);
        masterTreeGrid.bind('click', 'fn_viewSubTable');
        masterTreeGrid.bind('keyup', 'fn_keyup');
    }
    const fn_keyup = async function(event){
    	if(event.keyCode == 38 || event.keyCode == 40 ){
    		await fn_viewSubTable();
    	}
    }
    /**
     * 코드목록 조회
     */
    const fn_search = async function() {

    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	
    	let SRCH_ORG_CODE	= gfn_nvl(SBUxMethod.get("SRCH_ORG_CODE"));
    	let SRCH_ORG_NAME 	= gfn_nvl(SBUxMethod.get("SRCH_ORG_NAME"));
    	
    	var paramObj = {
    			 V_P_DEBUG_MODE_YN       : ''
   				,V_P_LANG_ID             : ''
   				,V_P_COMP_CODE           : gv_ma_selectedCorpCd
   				,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
   				,V_P_FI_ORG_CODE         : ''
   				,V_P_COST_CLASS          : ''
   				,V_P_PATH_TYPE           : ''
   				,V_P_COST_CENTER_CODE    : ''
   				,V_P_COST_CENTER_NAME    : ''
   				,V_P_FORM_ID             : p_formId
   				,V_P_MENU_ID             : p_menuId
   				,V_P_PROC_ID             : ''
   				,V_P_USERID              : p_userId
   				,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg3100.do", {
			getType				: 'json',
			workType			: 'Q',
			cv_count			: '2',
			params				: gfnma_objectToString(paramObj)
		});
    	const data = await postJsonPromise;
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
	    	   	/** @type {number} **/
	    		let totalRecordCount = 0;
	    		masterTreeGrid.length = 0;
	    	   	data.cv_1.forEach((item, index) => {
		    		const msg = {
			    			LEVEL						: gfn_nvl(item.LVL),
		    				KEYID						: gfn_nvl(item.KEYID),
		    				PARENTKEYID					: gfn_nvl(item.PARENTKEYID),
		    				COST_CENTER_CODE			: gfn_nvl(item.COST_CENTER_CODE),
		    				COST_CENTER_NAME			: gfn_nvl(item.COST_CENTER_NAME),
		    				COST_CLASS					: gfn_nvl(item.COST_CLASS),
		    				USE_YN						: gfn_nvl(item.USE_YN),
		    				COST_CENTER_NAME_CHN		: gfn_nvl(item.COST_CENTER_NAME_CHN),
		    				COMP_CODE					: gfn_nvl(item.COMP_CODE),
		    				PARENT_YN					: gfn_nvl(item.PARENT_YN),
		    				PARENT_COST_CENTER			: gfn_nvl(item.PARENT_COST_CENTER),
		    				PARENT_COST_CENTER_NAME     : gfn_nvl(item.PARENT_COST_CENTER_NAME),
		    				COST_CENTER_LEADER			: gfn_nvl(item.COST_CENTER_LEADER),
		    				DEPT_CODE					: gfn_nvl(item.DEPT_CODE),
		    				DEPT_NAME					: gfn_nvl(item.DEPT_NAME),
		    				BUDGET_YN					: gfn_nvl(item.BUDGET_YN),
		    				BUDGET_COST_CENTER			: gfn_nvl(item.BUDGET_COST_CENTER)
		    		}
		    		jsonMasterTreeList.push(msg);
		    		totalRecordCount ++;
		    	});
	    	   	masterTreeGrid.rebuild();
	    	   	document.querySelector('#listCount').innerText = totalRecordCount;
                if(jsonMasterTreeList.length > 0) {
                	masterTreeGrid.clickRow(1);
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
     * @name fn_clearForm
     * @description 그리드 및 화면 초기화
     * @param 
     */
    const fn_clearForm = async function() {
    	//원가중심점 리스트 
    	jsonMasterTreeList = [];
    }
    
    /**
     * @name fn_clearSubForm
     * @description 기본정보, 관리항목 화면 초기화
     * @param 
     */
    const fn_clearSubForm = async function() {
    	SBUxMethod.set("COST_CENTER_CODE",			"");
    	SBUxMethod.set("COST_CENTER_NAME",		 	"");
    	SBUxMethod.set("COST_CENTER_NAME_CHN",		"");
    	SBUxMethod.set("PARENT_COST_CENTER",		"");
    	SBUxMethod.set("PARENT_COST_CENTER_NAME",	"");
    	SBUxMethod.set("PLANT_NAME",				"");
    	SBUxMethod.set("SORT_SEQ",					"");
    	SBUxMethod.set("DESCRIPTION",				"");
    	SBUxMethod.set("DEPT_CODE",					"");
    	SBUxMethod.set("DEPT_NAME",					"");
    	SBUxMethod.set("SITE_CODE",					"");
    	SBUxMethod.set("SITE_NAME",					"");
    	SBUxMethod.set("TRANS_COST_CENTER",			"");
    	SBUxMethod.set("TRANS_COST_CENTER_NAME",	"");
    	SBUxMethod.set("COST_CENTER_LEADER",		"");
    	SBUxMethod.set("COST_CENTER_LEADER_NAME",	"");
    	SBUxMethod.set("BUDGET_COST_CENTER",		"");
    	SBUxMethod.set("BUDGET_COST_CENTER_NAME",	"");
    	SBUxMethod.set("ATTR1",						"");
    	SBUxMethod.set("ATTR2",						"");
    	SBUxMethod.set("ATTR3",						"");
    	SBUxMethod.set("ATTR4",						"");
    	SBUxMethod.set("ATTR5",						"");
    	SBUxMethod.set("ATTR6",						"");
    	SBUxMethod.set("ATTR7",						"");
    	SBUxMethod.set("ATTR8",						"");
    	SBUxMethod.set("ATTR9",						"");
    	SBUxMethod.set("ATTR10",					"");
    	
    	SBUxMethod.set("USE_YN", 					"N");
    	SBUxMethod.set("PARENT_YN", 				"N");
    	SBUxMethod.set("FINAL_FLAG", 				"N");
    	SBUxMethod.set("BUDGET_YN", 				"N");
    	SBUxMethod.set("DOC_INPUT_YN", 				"N");

    	gfnma_multiSelectSet("#FI_ORG_CODE", 		"", "", "");
    	gfnma_multiSelectSet("#COST_CLASS", 		"", "", "");
    	gfnma_multiSelectSet("#DIV_CODE", 			"", "", "");
    	gfnma_multiSelectSet("#PLANT_CODE", 		"", "", "");
    	gfnma_multiSelectSet("#PROD_RELATION_FLAG", "", "", "");
    	gfnma_multiSelectSet("#DEFAULT_DRIVER_CODE","", "", "");
    	gfnma_multiSelectSet("#MG_COST_CENTER",		"", "", "");
    }
    
    //기본정보, 관리항목 탭 내역 저장
    const fn_save = async function(type) {

        if (!SBUxMethod.validateRequired({group_id:'panAppoint'}) || !validateRequired("panAppoint")) {
            return false;
        }
  	    var paramObj = {
       			 V_P_DEBUG_MODE_YN        : ""
   				,V_P_LANG_ID              : ""
   				,V_P_COMP_CODE            : gv_ma_selectedCorpCd
   				,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
   				,V_P_COST_CENTER_CODE     : gfn_nvl(SBUxMethod.get("COST_CENTER_CODE"))
   				,V_P_COST_CENTER_NAME     : gfn_nvl(SBUxMethod.get("COST_CENTER_NAME"))
   				,V_P_COST_CENTER_NAME_CHN : gfn_nvl(SBUxMethod.get("COST_CENTER_NAME_CHN"))
   				,V_P_COST_CLASS           : gfnma_multiSelectGet("#COST_CLASS")
   				,V_P_FI_ORG_CODE          : gfnma_multiSelectGet("#FI_ORG_CODE")
   				,V_P_DIV_CODE             : gfnma_multiSelectGet("#DIV_CODE")
   				,V_P_DESCRIPTION          : gfn_nvl(SBUxMethod.get("DESCRIPTION"))
   				,V_P_ORGANIZATION_ID      : gfn_nvl(SBUxMethod.get("ORGANIZATION_ID"))
   				,V_P_PROD_RELATION_FLAG   : gfnma_multiSelectGet("#PROD_RELATION_FLAG")
   				,V_P_DEFAULT_DRIVER_CODE  : gfnma_multiSelectGet("#DEFAULT_DRIVER_CODE")
   				,V_P_FINAL_FLAG           : gfn_nvl(SBUxMethod.get("FINAL_FLAG").FINAL_FLAG)
   				,V_P_PLANT_NAME           : gfn_nvl(SBUxMethod.get("PLANT_NAME"))
   				,V_P_USE_YN               : gfn_nvl(SBUxMethod.get("USE_YN").USE_YN)
   				,V_P_MG_COST_CENTER       : gfnma_multiSelectGet("#MG_COST_CENTER")
   				,V_P_DOC_INPUT_YN         : gfn_nvl(SBUxMethod.get("DOC_INPUT_YN").DOC_INPUT_YN)
   				,V_P_PLANT_CODE           : gfnma_multiSelectGet("#PLANT_CODE")
   				,V_P_SORT_SEQ             : gfn_nvl(SBUxMethod.get("SORT_SEQ"))
   				,V_P_ATTR1                : gfn_nvl(SBUxMethod.get("ATTR1"))
   				,V_P_ATTR2                : gfn_nvl(SBUxMethod.get("ATTR2"))
   				,V_P_ATTR3                : gfn_nvl(SBUxMethod.get("ATTR3"))
   				,V_P_ATTR4                : gfn_nvl(SBUxMethod.get("ATTR4"))
   				,V_P_ATTR5                : gfn_nvl(SBUxMethod.get("ATTR5"))
   				,V_P_ATTR6                : gfn_nvl(SBUxMethod.get("ATTR6"))
   				,V_P_ATTR7                : gfn_nvl(SBUxMethod.get("ATTR7"))
   				,V_P_ATTR8                : gfn_nvl(SBUxMethod.get("ATTR8"))
   				,V_P_ATTR9                : gfn_nvl(SBUxMethod.get("ATTR9"))
   				,V_P_ATTR10               : gfn_nvl(SBUxMethod.get("ATTR10"))
   				,V_P_PARENT_YN            : gfn_nvl(SBUxMethod.get("PARENT_YN").PARENT_YN)
   				,V_P_PARENT_COSTCENTER    : gfn_nvl(SBUxMethod.get("PARENT_COSTCENTER"))
   				,V_P_DEPT_CODE            : gfn_nvl(SBUxMethod.get("DEPT_CODE"))
   				,V_P_TRANS_COST_CENTER    : gfn_nvl(SBUxMethod.get("TRANS_COST_CENTER"))
   				,V_P_SITE_CODE            : gfn_nvl(SBUxMethod.get("SITE_CODE"))
   				,V_P_COST_CENTER_LEADER   : gfn_nvl(SBUxMethod.get("COST_CENTER_LEADER"))
   				,V_P_BUDGET_YN            : gfn_nvl(SBUxMethod.get("BUDGET_YN").BUDGET_YN)
   				,V_P_BUDGET_COST_CENTER   : gfn_nvl(SBUxMethod.get("BUDGET_COST_CENTER"))
   				,V_P_FORM_ID              : p_formId
   				,V_P_MENU_ID              : p_menuId
   				,V_P_PROC_ID              : ''
   				,V_P_USERID               : p_userId
   				,V_P_PC                   : ''
       		  
  	    };	
        const postJsonPromise = gfn_postJSON("/co/sys/org/updateOrg3100.do", {
        	getType				: 'json',
        	workType			: workType,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        		gfn_comAlert("I0001");
        		cfn_search();
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
    
    // 기본정보를 토대로 원가중심점 리스트 삭제
    const fn_delete = async function() {
  	    var paramObj = {
       			 V_P_DEBUG_MODE_YN        : ""
   				,V_P_LANG_ID              : ""
   				,V_P_COMP_CODE            : gv_ma_selectedCorpCd
   				,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
   				,V_P_COST_CENTER_CODE     : gfn_nvl(SBUxMethod.get("COST_CENTER_CODE"))
   				,V_P_COST_CENTER_NAME     : gfn_nvl(SBUxMethod.get("COST_CENTER_NAME"))
   				,V_P_COST_CENTER_NAME_CHN : gfn_nvl(SBUxMethod.get("COST_CENTER_NAME_CHN"))
   				,V_P_COST_CLASS           : gfnma_multiSelectGet("#COST_CLASS")
   				,V_P_FI_ORG_CODE          : gfnma_multiSelectGet("#FI_ORG_CODE")
   				,V_P_DIV_CODE             : gfnma_multiSelectGet("#DIV_CODE")
   				,V_P_DESCRIPTION          : gfn_nvl(SBUxMethod.get("DESCRIPTION"))
   				,V_P_ORGANIZATION_ID      : gfn_nvl(SBUxMethod.get("ORGANIZATION_ID"))
   				,V_P_PROD_RELATION_FLAG   : gfnma_multiSelectGet("#PROD_RELATION_FLAG")
   				,V_P_DEFAULT_DRIVER_CODE  : gfnma_multiSelectGet("#DEFAULT_DRIVER_CODE")
   				,V_P_FINAL_FLAG           : gfn_nvl(SBUxMethod.get("FINAL_FLAG").FINAL_FLAG)
   				,V_P_PLANT_NAME           : gfn_nvl(SBUxMethod.get("PLANT_NAME"))
   				,V_P_USE_YN               : gfn_nvl(SBUxMethod.get("USE_YN").USE_YN)
   				,V_P_MG_COST_CENTER       : gfnma_multiSelectGet("#MG_COST_CENTER")
   				,V_P_DOC_INPUT_YN         : gfn_nvl(SBUxMethod.get("DOC_INPUT_YN").DOC_INPUT_YN)
   				,V_P_PLANT_CODE           : gfnma_multiSelectGet("#PLANT_CODE")
   				,V_P_SORT_SEQ             : gfn_nvl(SBUxMethod.get("SORT_SEQ"))
   				,V_P_ATTR1                : gfn_nvl(SBUxMethod.get("ATTR1"))
   				,V_P_ATTR2                : gfn_nvl(SBUxMethod.get("ATTR2"))
   				,V_P_ATTR3                : gfn_nvl(SBUxMethod.get("ATTR3"))
   				,V_P_ATTR4                : gfn_nvl(SBUxMethod.get("ATTR4"))
   				,V_P_ATTR5                : gfn_nvl(SBUxMethod.get("ATTR5"))
   				,V_P_ATTR6                : gfn_nvl(SBUxMethod.get("ATTR6"))
   				,V_P_ATTR7                : gfn_nvl(SBUxMethod.get("ATTR7"))
   				,V_P_ATTR8                : gfn_nvl(SBUxMethod.get("ATTR8"))
   				,V_P_ATTR9                : gfn_nvl(SBUxMethod.get("ATTR9"))
   				,V_P_ATTR10               : gfn_nvl(SBUxMethod.get("ATTR10"))
   				,V_P_PARENT_YN            : gfn_nvl(SBUxMethod.get("PARENT_YN").PARENT_YN)
   				,V_P_PARENT_COSTCENTER    : gfn_nvl(SBUxMethod.get("PARENT_COSTCENTER"))
   				,V_P_DEPT_CODE            : gfn_nvl(SBUxMethod.get("DEPT_CODE"))
   				,V_P_TRANS_COST_CENTER    : gfn_nvl(SBUxMethod.get("TRANS_COST_CENTER"))
   				,V_P_SITE_CODE            : gfn_nvl(SBUxMethod.get("SITE_CODE"))
   				,V_P_COST_CENTER_LEADER   : gfn_nvl(SBUxMethod.get("COST_CENTER_LEADER"))
   				,V_P_BUDGET_YN            : gfn_nvl(SBUxMethod.get("BUDGET_YN").BUDGET_YN)
   				,V_P_BUDGET_COST_CENTER   : gfn_nvl(SBUxMethod.get("BUDGET_COST_CENTER"))
   				,V_P_FORM_ID              : p_formId
   				,V_P_MENU_ID              : p_menuId
   				,V_P_PROC_ID              : ''
   				,V_P_USERID               : p_userId
   				,V_P_PC                   : ''
       		  
  	    };	
        const postJsonPromise = gfn_postJSON("/co/sys/org/deleteOrg3100.do", {
        	getType				: 'json',
        	workType			: 'D',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        		gfn_comAlert("I0001");
        		cfn_search();
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

    //대상사업장, 전표 전기 권한 그리드 조회
    const fn_viewSubTable = async function() {
    	// 그리드의 빈곳을 눌렀을 때 리턴
    	const nRow = masterTreeGrid.getRow();
	    if (nRow == -1) {
	        return;
	    }
	    const selectRowVal = masterTreeGrid.getRowData(nRow);
    	await fn_clearSubForm();
    	var paramObj = {
 			   V_P_DEBUG_MODE_YN       : ''
			  ,V_P_LANG_ID             : ''
			  ,V_P_COMP_CODE           : gv_ma_selectedCorpCd
			  ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
			  ,V_P_FI_ORG_CODE         : ''
			  ,V_P_COST_CLASS          : ''
			  ,V_P_PATH_TYPE           : ''
			  ,V_P_COST_CENTER_CODE    : gfn_nvl(selectRowVal.COST_CENTER_CODE)
			  ,V_P_COST_CENTER_NAME    : ''
			  ,V_P_FORM_ID             : p_formId
			  ,V_P_MENU_ID             : p_menuId
			  ,V_P_PROC_ID             : ''
			  ,V_P_USERID              : p_userId
			  ,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg3100.do", {
			getType				: 'json',
			workType			: 'Q1',
			cv_count			: '2',
			params				: gfnma_objectToString(paramObj)
		});
    	const data = await postJsonPromise;
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
	    		
	    		let obj = data.cv_2[0];
	        	
	        	SBUxMethod.set("COST_CENTER_CODE",			gfn_nvl(obj.COST_CENTER_CODE));
	        	SBUxMethod.set("COST_CENTER_NAME",		 	gfn_nvl(obj.COST_CENTER_NAME ));
	        	SBUxMethod.set("COST_CENTER_NAME_CHN",		gfn_nvl(obj.COST_CENTER_NAME_CHN ));
	        	SBUxMethod.set("PARENT_COST_CENTER",		gfn_nvl(obj.PARENT_COST_CENTER));
	        	SBUxMethod.set("PARENT_COST_CENTER_NAME",	gfn_nvl(obj.PARENT_COST_CENTER_NAME));
	        	SBUxMethod.set("PLANT_NAME",				gfn_nvl(obj.PLANT_NAME));
	        	SBUxMethod.set("SORT_SEQ",					gfn_nvl(obj.SORT_SEQ));
	        	SBUxMethod.set("DESCRIPTION",				gfn_nvl(obj.DESCRIPTION));
	        	SBUxMethod.set("DEPT_CODE",					gfn_nvl(obj.DEPT_CODE));
	        	SBUxMethod.set("DEPT_NAME",					gfn_nvl(obj.DEPT_NAME));
	        	SBUxMethod.set("SITE_CODE",					gfn_nvl(obj.SITE_CODE));
	        	SBUxMethod.set("SITE_NAME",					gfn_nvl(obj.SITE_NAME));
	        	SBUxMethod.set("TRANS_COST_CENTER",			gfn_nvl(obj.TRANS_COST_CENTER));
	        	SBUxMethod.set("TRANS_COST_CENTER_NAME",	gfn_nvl(obj.TRANS_COST_CENTER_NAME));
	        	SBUxMethod.set("COST_CENTER_LEADER",		gfn_nvl(obj.COST_CENTER_LEADER));
	        	SBUxMethod.set("COST_CENTER_LEADER_NAME",	gfn_nvl(obj.COST_CENTER_LEADER_NAME));
	        	SBUxMethod.set("BUDGET_COST_CENTER",		gfn_nvl(obj.BUDGET_COST_CENTER));
	        	SBUxMethod.set("BUDGET_COST_CENTER_NAME",	gfn_nvl(obj.BUDGET_COST_CENTER_NAME));
	        	SBUxMethod.set("ATTR1",						gfn_nvl(obj.ATTR1));
	        	SBUxMethod.set("ATTR2",						gfn_nvl(obj.ATTR2));
	        	SBUxMethod.set("ATTR3",						gfn_nvl(obj.ATTR3));
	        	SBUxMethod.set("ATTR4",						gfn_nvl(obj.ATTR4));
	        	SBUxMethod.set("ATTR5",						gfn_nvl(obj.ATTR5));
	        	SBUxMethod.set("ATTR6",						gfn_nvl(obj.ATTR6));
	        	SBUxMethod.set("ATTR7",						gfn_nvl(obj.ATTR7));
	        	SBUxMethod.set("ATTR8",						gfn_nvl(obj.ATTR8));
	        	SBUxMethod.set("ATTR9",						gfn_nvl(obj.ATTR9));
	        	SBUxMethod.set("ATTR10",					gfn_nvl(obj.ATTR10));
	        	
	        	SBUxMethod.set("USE_YN", 					gfn_nvl(obj.USE_YN));
	        	SBUxMethod.set("PARENT_YN", 				gfn_nvl(obj.PARENT_YN));
	        	SBUxMethod.set("FINAL_FLAG", 				gfn_nvl(obj.FINAL_FLAG));
	        	SBUxMethod.set("BUDGET_YN", 				gfn_nvl(obj.BUDGET_YN));
	        	SBUxMethod.set("DOC_INPUT_YN", 				gfn_nvl(obj.DOC_INPUT_YN));
	        	
	        	gfnma_multiSelectSet("#FI_ORG_CODE", 		"FI_ORG_CODE", "FI_ORG_NAME", gfn_nvl(obj.FI_ORG_CODE));
	        	gfnma_multiSelectSet("#COST_CLASS", 		"SUB_CODE", "CODE_NAME", gfn_nvl(obj.COST_CLASS));
	        	gfnma_multiSelectSet("#DIV_CODE", 			"SUB_CODE", "CODE_NAME", gfn_nvl(obj.DIV_CODE));
	        	gfnma_multiSelectSet("#PLANT_CODE", 		"SUB_CODE", "CODE_NAME", gfn_nvl(obj.PLANT_CODE));
	        	gfnma_multiSelectSet("#PROD_RELATION_FLAG", "SUB_CODE", "CODE_NAME", gfn_nvl(obj.PROD_RELATION_FLAG));
	        	gfnma_multiSelectSet("#DEFAULT_DRIVER_CODE","COST_DRIVER_CODE", "COST_DRIVER_NAME", gfn_nvl(obj.DEFAULT_DRIVER_CODE));
	        	gfnma_multiSelectSet("#MG_COST_CENTER",		"COST_CENTER_CODE", "COST_DRIVER_NAME", gfn_nvl(obj.MG_COST_CENTER));
	        	
	        	
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
	 * 공통팝업
	 * 본지점계정 공통팝업
	 */
    var fn_compopupParent = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get('PARENT_COST_CENTER'));
        var searchName 		= gfn_nvl(SBUxMethod.get("PARENT_COST_CENTER_NAME"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND COMP_CODE LIKE '%" + gv_ma_selectedCorpCd + "%'" + "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%'" + "AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '본지점계정 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_PARENT_COSTCENTER'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["코드", 	"명칭"]
  			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
  			,searchInputValues		: [searchCode, 	searchName]
    		,width					: '500px'
    		,height					: '400px'
  			,tableHeader			: ["코드", 		 "명칭"]
  			,tableColumnNames		: ["COST_CENTER_CODE", 	 "COST_CENTER_NAME"]
  			,tableColumnWidths		: ["80px", 			 "80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('PARENT_COST_CENTER',		data.COST_CENTER_CODE);
				SBUxMethod.set('PARENT_COST_CENTER_NAME', 	data.COST_CENTER_NAME);
			},
    	});
  	}
    
    /**
     * 공통팝업
     * 부서
     */
    var fn_compopupDept = function() {
    	
        var searchText1 	= gfn_nvl(SBUxMethod.get("DEPT_CODE"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("DEPT_NAME"));
        var searchText3 	= gfnma_date4();
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FI_DEPT'
       		,popupType				: 'B'
    		,whereClause			: ''
       		,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
   			,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
   			,searchInputValues		: [searchText1, 	searchText2,	searchText3]
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
    /**
     * 공통팝업
     * 손익사업장
     */
    var fn_compopupSite = function() {
    	
        var searchText1 	= gfn_nvl(SBUxMethod.get("SITE_CODE"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("SITE_NAME"));
        var replaceText0 	= "_SITE_CODE_";
        var replaceText1 	= "_SITE_NAME_";
        var strWhereClause 	= "AND AA.SITE_CODE LIKE '%" + replaceText0 + "%' AND AA.SITE_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '손익사업장');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG201'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["사업장코드", 		"사업장명"]
   			,searchInputFields		: ["SITE_CODE", 	"SITE_NAME"]
   			,searchInputValues		: [searchText1, 	searchText2]
			,searchInputTypes		: ["input", 		"input"]
    		,width					: '600px'
    		,height					: '400px'
   			,tableHeader			: ["부서코드", 		"부서명"]
   			,tableColumnNames		: ["SITE_CODE", 	"SITE_NAME"]
   			,tableColumnWidths		: ["150px", 		"250px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('SITE_CODE', 	data.SITE_CODE);
				SBUxMethod.set('SITE_NAME', 	data.SITE_NAME);
			},
    	});
  	}
    /**
     * 공통팝업
     * 대체원가중심점
     */
    var fn_compopupTrans = function() {
    	
        var searchText1 	= gfn_nvl(SBUxMethod.get("TRANS_COST_CENTER"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("TRANS_COST_CENTER_NAME"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '대체원가중심점 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COST_CENTER'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["코드", 	"명칭"]
  			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
  			,searchInputValues		: [searchText1, 		searchText2]
    		,width					: '600px'
    		,height					: '400px'
  			,tableHeader			: ["코드", 		 "명칭"]
  			,tableColumnNames		: ["COST_CENTER_CODE", 	 "COST_CENTER_NAME"]
  			,tableColumnWidths		: ["80px", 			 "80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('TRANS_COST_CENTER',		data.COST_CENTER_CODE);
				SBUxMethod.set('TRANS_COST_CENTER_NAME', 	data.COST_CENTER_NAME);
			},
    	});
  	}
    /**
     * 공통팝업
     * 센터장
     */
    var fn_compopupLeader = function() {
    	
        var searchText1 	= gfn_nvl(SBUxMethod.get("COST_CENTER_LEADER"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("COST_CENTER_LEADER_NAME"));
        var param		 	= [null];
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FI_DEPT'
       		,popupType				: 'B'
    		,whereClause			: param
       		,searchCaptions			: ["사번", 			"센터장"]
   			,searchInputFields		: ["DEPT_LEADER", 	"DEPT_LEADER_NAME"]
   			,searchInputValues		: [searchText1, 	searchText2]
			,searchInputTypes		: ["input", 		"input"]		//input, datepicker가 있는 경우
    		,width					: '600px'
    		,height					: '400px'
   			,tableHeader			: ["부서", 		"사번", 			"센터장"]
   			,tableColumnNames		: ["DEPT_NAME", "DEPT_LEADER", 	"DEPT_LEADER_NAME"]
   			,tableColumnWidths		: ["150px", 	"150px",		"150px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('COST_CENTER_LEADER', 	data.DEPT_LEADER);
				SBUxMethod.set('COST_CENTER_LEADER_NAME', 	data.DEPT_LEADER_NAME);
			},
    	});
  	}
    /**
     * 공통팝업
     * 예산C/C
     */
    var fn_compopupBudget = function() {
    	
        var searchText1 	= gfn_nvl(SBUxMethod.get("BUDGET_COST_CENTER"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("BUDGET_COST_CENTER_NAME"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '대체원가중심점 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COST_CENTER'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["코드", 	"명칭"]
  			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
  			,searchInputValues		: [searchText1, 		searchText2]
    		,width					: '500px'
    		,height					: '400px'
  			,tableHeader			: ["코드", 		 "명칭"]
  			,tableColumnNames		: ["COST_CENTER_CODE", 	 "COST_CENTER_NAME"]
  			,tableColumnWidths		: ["100px", 			 "100px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('BUDGET_COST_CENTER',		data.COST_CENTER_CODE);
				SBUxMethod.set('BUDGET_COST_CENTER_NAME', 	data.COST_CENTER_NAME);
			},
    	});
  	}
    
    //  	
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>