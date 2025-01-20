<%
/**
 * @Class Name 		: com3630.jsp
 * @Description 	: 계정과목 정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.06.05
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.06.05   	천용진		최초 생성
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
	<title>title : 계정과목 정보</title>
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
	                            <th scope="row" class="th_bg_search">계정과목코드</th>
	                            <td class="td_input" colspan="3" style="border-right:hidden;">
	                                <sbux-input id="SRCH_ACCOUNT_CODE_P" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                            <th scope="row" class="th_bg_search">계정과목명</th>
	                            <td class="td_input" colspan="3" style="border-right: hidden;">
	                                <sbux-input id="SRCH_ACCOUNT_NAME_P" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
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
                                    <span>◎ 계정과목 리스트</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdCom3630" style="height:73vh; width:100%;"></div>
                        </div>
                    </div>
                    
	                <sbux-tabs id="idxTab_norm" name="tab_norm" uitype="normal"
						is-scrollable="false"
						title-target-id-array="tab1^tab2^tab3^tab4^tab5"
						title-text-array="기본정보^회계관리^예산관리^관리항목^외화관련계정">
					</sbux-tabs>
                    <div class="col-sm-8 tab-content">
                        <div id="tab1" style="height:68vh;">
                            <table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:16%">
                                    <col style="width:20%">
                                    <col style="width:20%">
                                    <col style="width:16%">
                                    <col style="width:14%">
                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">계정과목코드</th>
                                    <td class="td_input">
                                        <sbux-input id="ACCOUNT_CODE" class="form-control input-sm inpt_data_reqed"  uitype="text"  style="width:100%" group-id="panAppoint" required readonly>
                                        </sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">계정과목 약어</th>
                                    <td class="td_input" colspan="3">
                                        <sbux-input id="ACC_ABBR_NAME" class="form-control input-sm"  uitype="text"  style="width:100%">
                                        </sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">계정과목명</th>
                                    <td colspan="5" class="td_input" >
                                        <sbux-input id="ACCOUNT_NAME" class="form-control input-sm inpt_data_reqed" uitype="text"  style="width:100%" group-id="panAppoint" required></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">적    요</th>
                                    <td colspan="5" class="td_input">
                                        <sbux-input id="DESCR" class="form-control input-sm" uitype="text"  style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">계정과목(한글)</th>
                                    <td colspan="5" class="td_input">
                                        <sbux-input id="ACCOUNT_NAME_CHN" class="form-control input-sm" uitype="text"  style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">상위계정 여부</th>
                                    <td class="td_input" colspan="2">
                            			<sbux-checkbox 
                            				id="PARENT_YN" 
                            				uitype="normal" 
                            				text="상위계정" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
                                    </td>
                                    <th scope="row" class="th_bg">전표입력 여부</th>
                                    <td class="td_input" colspan="2">
                            			<sbux-checkbox
                            				id="DOC_INPUT_YN" 
                            				uitype="normal" 
                            				text="전표입력" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">상위계정</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input
											uitype="text"
											id="PARENT_ACC"
											class="form-control input-sm"
		   								></sbux-input>
									</td>
									<td colspan="3"  class="td_input" style="border-right: hidden;">
										<sbux-input
											uitype="text"
											id="PARENT_NAME"
											class="form-control input-sm"
		   								></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="…"
											uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopupParent"
										></sbux-button>
		                            </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">계정그룹구분</th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
										    	type="button"
										    	id="ACC_GROUP_GUBUN" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false"
										    	group-id="panAppoint" required>
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=ACC_GROUP_TYPE style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
                                    </td>
                                    <td></td>
                                    <th scope="row" class="th_bg">계정분류</th>
                                    <td class="td_input" colspan="2">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
										    	type="button"
										    	id="ACC_CATEGORY" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false"
										    	group-id="panAppoint" required>
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=ACC_CATEGORY style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">계정잔액구분</th>
                                    <td class="td_input " colspan="2">
										<sbux-radio id="BALANCE_SIDE1" name="RDO_BALANCE_SIDE" text="차변"uitype="normal" value="D" class="radio_label inpt_data_reqed" checked></sbux-radio>
										<sbux-radio id="BALANCE_SIDE2" name="RDO_BALANCE_SIDE" text="대변"uitype="normal" value="C" class="radio_label inpt_data_reqed"></sbux-radio>
									</td>
                                    <th scope="row" class="th_bg">미결관리대상</th>
                                    <td class="td_input" colspan="2">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button" 
										    	id="ACC_CHARACTER" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=ACC_CHARACTER style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
									</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">현업사용 여부</th>
                                    <td class="td_input" colspan="2">
                            			<sbux-checkbox 
                            				id="OPEN_TO_ALL_YN" 
                            				uitype="normal" 
                            				text="현업사용(SCM)" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
                            			<sbux-checkbox 
                            				id="OPEN_TO_FCM_YN" 
                            				uitype="normal" 
                            				text="현업사용(FCM)" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
                                    </td>
                                    <th scope="row" class="th_bg">차감계정여부 </br>[시산표]</th>
                                    <td class="td_input" colspan="2">
                                    	 <sbux-checkbox 
                            				id="FS_VIEW_FLAG" 
                            				uitype="normal" 
                            				text="예" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
                                    </td>
                                </tr>   
                                <tr>
                                    <th scope="row" class="th_bg">순잔액집계계정</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input
											uitype="text"
											id="SUMACCOUNT_CODE"
											class="form-control input-sm"
		   								></sbux-input>
									</td>	
									<td colspan="3" class="td_input" style="border-right: hidden;">
										<sbux-input
											uitype="text"
											id="SUMACCOUNT_NAME"
											class="form-control input-sm"
		   								></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="…"uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopupSumAccount"
										></sbux-button>
		                            </td>
                                </tr>      
                                <tr>
                                    <th scope="row" class="th_bg">사용여부</th>
                                    <td class="td_input">
                            			<sbux-checkbox 
                            				id="USE_YN" 
                            				uitype="normal" 
                            				text="사용" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
                                    </td>
                                    <th scope="row" class="th_bg">정렬순서</th>
                                    <td class="td_input">
		   								<sbux-input
											uitype="text"
											id="SORT_SEQ"
											class="form-control input-sm inpt_data_reqed"
											group-id="panAppoint" required
		   								></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">Report 사용여부</th>
                                    <td class="td_input">
                            			<sbux-checkbox 
                            				id="REPORT_VIEW_YN" 
                            				uitype="normal" 
                            				text="예" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
                                    </td>
                                </tr>         
                                <tr>
                                    <th scope="row" class="th_bg">본사계정</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input
											uitype="text"
											id="HQ_ACCOUNT_CODE"
											class="form-control input-sm"
		   								></sbux-input>
	   								</td>
									<td colspan="4" class="td_input" style="border-right: hidden;">
										<sbux-input
											uitype="text"
											id="HQ_ACCOUNT_NAME"
											class="form-control input-sm"
		   								></sbux-input>
									</td>
                                </tr>  
                                <tr>
                                    <th scope="row" class="th_bg">보고서계정</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input
											uitype="text"
											id="REPORT_ACCOUNT_CODE"
											class="form-control input-sm"
		   								></sbux-input>
		   							</td>
									<td colspan="4" class="td_input" style="border-right: hidden;">
										<sbux-input
											uitype="text"
											id="REPORT_ACCOUNT_NAME"
											class="form-control input-sm"
		   								></sbux-input>
									</td>
                                </tr>  
                                <tr>
                                    <th scope="row" class="th_bg">계정과목(구)</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input
											uitype="text"
											id="OLD_ACCOUNT_CODE"
											class="form-control input-sm"
		   								></sbux-input>
	   								</td>
									<td colspan="4" class="td_input" style="border-right: hidden;">
										<sbux-input
											uitype="text"
											id="OLD_ACCOUNT_NAME"
											class="form-control input-sm"
		   								></sbux-input>
									</td>
                                </tr>   
                                <tr>
                                    <th scope="row" class="th_bg">IFRS PL 순서</th>
                                    <td class="td_input">
		   								<sbux-input
											uitype="text"
											id="SORT_SEQ_PL"
											class="form-control input-sm inpt_data_reqed"
											group-id="panAppoint" required
		   								></sbux-input>                                    
                                    </td>
                                    <th scope="row" class="th_bg">PL사용여부</th>
                                    <td class="td_input" colspan ="3">
                            			<sbux-checkbox 
                            				id="PL_VIEW_YN" 
                            				uitype="normal" 
                            				text="예" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
                                    </td>
                                </tr>                                                                                                                                                                                     
                                <tr>
                                    <th scope="row" class="th_bg">KGAAP PL 순서</th>
                                    <td class="td_input">
		   								<sbux-input
											uitype="text"
											id="SORT_SEQ_KGAAP_PL"
											class="form-control input-sm inpt_data_reqed"
											group-id="panAppoint" required
		   								></sbux-input>                                    
                                    </td>
                                    <th scope="row" class="th_bg">KGAAP PL사용여부</th>
                                    <td class="td_input" colspan ="3">
                            			<sbux-checkbox 
                            				id="KGAAP_PL_VIEW_YN" 
                            				uitype="normal" 
                            				text="예" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
                                    </td>
                                </tr>                                                                                                                                                                                     
                            </table>
                        </div>
                        <div id="tab2" style="height:68vh;">
                            <table id="dataArea2" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:20%">
                                    <col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">자금수지항목</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input
											uitype="text"
											id="TTR_TYPE"
											class="form-control input-sm"
		   								></sbux-input>
									</td>
									<td colspan="2"  class="td_input" style="border-right: hidden;">
										<sbux-input
											uitype="text"
											id="TTR_TYPE_NAME"
											class="form-control input-sm"
		   								></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopupTtrType"
										></sbux-button>
		                            </td>
                                </tr>
								<tr>
                                    <th scope="row" class="th_bg">원가요소</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input
											uitype="text"
											id="COST_ELEMENT_CODE"
											class="form-control input-sm"
		   								></sbux-input>
									</td>
									<td colspan="2"  class="td_input" style="border-right: hidden;">
										<sbux-input
											uitype="text"
											id="COST_ELEMENT_NAME"
											class="form-control input-sm"
		   								></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopupCostElement"
										></sbux-button>
		                            </td>
                                </tr>      
                                <tr>
								<th scope="row" class="th_bg">자산등록대상</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox 
                            				id="ASSET_YN" 
                            				uitype="normal" 
                            				text="예" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
									<th scope="row" class="th_bg">원가요소(GL가져오기)</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
										<sbux-checkbox 
                            				id="GL_IMPORT_YN" 
                            				uitype="normal" 
                            				text="예" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
                                </tr>
                                <tr>
								<th scope="row" class="th_bg">미처분이익잉여금(년)</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox 
                            				id="YEAR_RE_ACCOUNT_YN" 
                            				uitype="normal" 
                            				text="예" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
									<th scope="row" class="th_bg">미처분이익잉여금(월)</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
										<sbux-checkbox 
                            				id="MONTH_RE_ACCOUNT_YN" 
                            				uitype="normal" 
                            				text="예" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
                                </tr>
                                <tr>
								<th scope="row" class="th_bg">프로젝트필수여부</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox 
                            				id="PROJECT_YN" 
                            				uitype="normal" 
                            				text="예" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
									<th scope="row" class="th_bg">원가유형</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
									<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle " 
										    	type="button"
										    	id="COST_CLASS" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=COST_CLASS style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
									</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">사용불가부가세코드</th>
									<td class="td_input" style="border-right: hidden;" colspan="4">
		   								<sbux-input
											uitype="text"
											id="USABLE_TAX_TYPE"
											class="form-control input-sm"
		   								></sbux-input>
									</td>	
								</tr>
                                <tr>
                                    <th scope="row" class="th_bg">비고</th>
									<td class="td_input" style="border-right: hidden;" colspan="4">
		   								<sbux-textarea
											uitype="normal"
											id="REMARK"
											class="form-control input-sm"
		   								></sbux-textarea>
									</td>	
								</tr>													
                                <tr>
                                    <th scope="row" class="th_bg">입금분류</th>
									<td class="td_input" style="border-right: hidden;" colspan="4">
		   								<sbux-input
											uitype="text"
											id="CATEGORY1"
											class="form-control input-sm"
		   								></sbux-input>
									</td>	
								</tr>                                                                                                                                                                        
                            </table>
                        </div>
                        <div id="tab3" style="height:68vh;">
							<table id="dataArea3" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:18%">
                                    <col style="width:16%">
                                    <col style="width:16%">
                                    <col style="width:18%">
                                    <col style="width:22%">
									<col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">예산편성여부</th>
									<td class="td_input" style="border-right: hidden;" colspan="5">
										<sbux-checkbox id="BUDGETING_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
									</td>
                                </tr>    
								<tr>
                                    <th scope="row" class="th_bg">예산관리방법</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle " 
										    	type="button"
										    	id="BUDGET_METHOD" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=BUDGET_METHOD style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
									</td>
									<th scope="row" class="th_bg">통제시점</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle " 
										    	type="button"
										    	id="CONTROL_TIME" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CONTROL_TIME style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
									</td>
                                </tr>      
                                <tr>
									<th scope="row" class="th_bg">예산총괄부서</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="BUDGET_DEPT_CODE" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<sbux-input uitype="text" id="BUDGET_DEPT_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupBudgetDept" ></sbux-button>
		                            </td>
                                </tr>
                                <tr>
									<th scope="row" class="th_bg">예산계정</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="BUDGET_ACC_CODE" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<sbux-input uitype="text" id="BUDGET_ACC_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupBudgetAcc" ></sbux-button>
		                            </td>
                                </tr>
                                <tr>
									<th scope="row" class="th_bg">예산통제여부</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
										<sbux-checkbox 
                            				id="BUDGET_CONTROL_YN" 
                            				uitype="normal" 
                            				text="통제 여부" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
									<th scope="row" class="th_bg">예산누적관리여부</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
										<sbux-checkbox 
                            				id="BUDGET_FORWARD_YN" 
                            				uitype="normal" 
                            				text="예산누적관리여부" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
                                </tr>
                                <tr>
									<th scope="row" class="th_bg">통제방식</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle " 
										    	type="button"
										    	id="CONTROL_METHOD" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CONTROL_METHOD style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
									</td>
									<th scope="row" class="th_bg">통제주기</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle " 
										    	type="button"
										    	id="CONTROL_CYCLE" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CONTROL_CYCLE style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
									</td>									
								</tr>													
                                <tr>
									<th scope="row" class="th_bg">구매예산통제여부</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
										<sbux-checkbox 
                            				id="PUR_BUDGET_CONTROL_YN" 
                            				uitype="normal" 
                            				text="구매예산통제여부" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
									<th scope="row" class="th_bg">구매예산누적관리</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
										<sbux-checkbox 
                            				id="PUR_BUDGET_FORWARD_YN" 
                            				uitype="normal" 
                            				text="구매예산누적관리" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
                                </tr>    
                                <tr>
									<th scope="row" class="th_bg">통제방식</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle " 
										    	type="button"
										    	id="PUR_CONTROL_METHOD" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CONTROL_METHOD style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
									</td>
									<th scope="row" class="th_bg">구매예산통제주기</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle " 
										    	type="button"
										    	id="PUR_CONTROL_CYCLE" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CONTROL_CYCLE style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
									</td>									
								</tr>		                                
								<tr>
									<th></th>
									<td class="td_input" style="border-right: hidden;" colspan="5">
										<sbux-checkbox 
                            				id="CATEGORY3" 
                            				uitype="normal" 
                            				text="공장별총괄구매예산관리여부" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
								</tr>  
                                <tr>
									<th scope="row" class="th_bg">총괄[포항]구매CC</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="PUR_BUDGET_CC" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<sbux-input uitype="text" id="PUR_BUDGET_CC_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupPurBudget" ></sbux-button>
		                            </td>
                                </tr>
                                <tr>
									<th scope="row" class="th_bg">증평구매CC</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="CATEGORY2" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;" colspan="3">
										<sbux-input uitype="text" id="CATEGORY2_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…"  uitype="modal" target-id="modal-compopup1" onclick="fn_compopupCategory2" ></sbux-button>
		                            </td>
                                </tr>																                                                                                                                                                                
                            </table>                        	
                        </div>
                        <div id="tab4" style="height:68vh;">
                            <table id="dataArea4" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:20%">
                                    <col style="width:40%">
                                    <col style="width:10%">
                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">참조1</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="ACC_ITEM_CODE1" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ACC_ITEM_NAME1" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…"  uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccItemCode('1')" ></sbux-button>
		                            </td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox id="ITEM_USE_YN1" uitype="normal" text="필수" true-value="Y" false-value="N" ></sbux-checkbox>
									</td>									
                                </tr>    
                                <tr>
                                    <th scope="row" class="th_bg">참조2</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="ACC_ITEM_CODE2" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ACC_ITEM_NAME2" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…"  uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccItemCode('2')" ></sbux-button>
		                            </td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox id="ITEM_USE_YN2" uitype="normal" text="필수" true-value="Y" false-value="N" ></sbux-checkbox>
									</td>									
                                </tr>                                  
                                <tr>
                                    <th scope="row" class="th_bg">참조3</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="ACC_ITEM_CODE3" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ACC_ITEM_NAME3" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…"  uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccItemCode('3')" ></sbux-button>
		                            </td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox id="ITEM_USE_YN3" uitype="normal" text="필수" true-value="Y" false-value="N" ></sbux-checkbox>
									</td>									
                                </tr>   								
                                <tr>
                                    <th scope="row" class="th_bg">참조4</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="ACC_ITEM_CODE4" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ACC_ITEM_NAME4" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…"  uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccItemCode('4')" ></sbux-button>
		                            </td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox id="ITEM_USE_YN4" uitype="normal" text="필수" true-value="Y" false-value="N" ></sbux-checkbox>
									</td>									
                                </tr>   								
                                <tr>
                                    <th scope="row" class="th_bg">참조5</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="ACC_ITEM_CODE5" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ACC_ITEM_NAME5" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…"  uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccItemCode('5')" ></sbux-button>
		                            </td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox id="ITEM_USE_YN5" uitype="normal" text="필수" true-value="Y" false-value="N" ></sbux-checkbox>
									</td>									
                                </tr>   								
                                <tr>
                                    <th scope="row" class="th_bg">참조6</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="ACC_ITEM_CODE6" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ACC_ITEM_NAME6" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…"  uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccItemCode('6')" ></sbux-button>
		                            </td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox id="ITEM_USE_YN6" uitype="normal" text="필수" true-value="Y" false-value="N" ></sbux-checkbox>
									</td>									
                                </tr>   								
                                <tr>
                                    <th scope="row" class="th_bg">참조7</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="ACC_ITEM_CODE7" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ACC_ITEM_NAME7" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…"  uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccItemCode('7')" ></sbux-button>
		                            </td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox id="ITEM_USE_YN7" uitype="normal" text="필수" true-value="Y" false-value="N" ></sbux-checkbox>
									</td>									
                                </tr>   								
                                <tr>
                                    <th scope="row" class="th_bg">참조8</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="ACC_ITEM_CODE8" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ACC_ITEM_NAME8" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…"  uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccItemCode('8')" ></sbux-button>
		                            </td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox id="ITEM_USE_YN8" uitype="normal" text="필수" true-value="Y" false-value="N" ></sbux-checkbox>
									</td>									
                                </tr>   								
                                <tr>
                                    <th scope="row" class="th_bg">참조9</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="ACC_ITEM_CODE9" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ACC_ITEM_NAME9" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…"  uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccItemCode('9')" ></sbux-button>
		                            </td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox id="ITEM_USE_YN9" uitype="normal" text="필수" true-value="Y" false-value="N" ></sbux-checkbox>
									</td>									
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">참조10</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="ACC_ITEM_CODE10" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ACC_ITEM_NAME10" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…"  uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccItemCode('10')" ></sbux-button>
		                            </td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-checkbox id="ITEM_USE_YN10" uitype="normal" text="필수" true-value="Y" false-value="N" ></sbux-checkbox>
									</td>									
                                </tr>   		
                                <tr>
                                    <th scope="row" class="th_bg">ESS팝업페이지</th>
									<td class="td_input" style="border-right: hidden;" colspan="4">
		   								<sbux-input uitype="text" id="ESS_POPUP_PAGE" class="form-control input-sm" ></sbux-input>
									</td>									
                                </tr>   															   								 												                                                                                                                                                                 
                            </table>                        	
                        </div>
                        <div id="tab5" style="height:68vh">
							<table id="dataArea5" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:20%">
                                    <col style="width:40%">
                                    <col style="width:20%">
                                </colgroup>
                                <tr>
									<th scope="row" class="th_bg">환차익계정</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="EXCHANGE_GAIN_ACC" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="EXCHANGE_GAIN_ACC_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAcc('EXCHANGE_GAIN_ACC')" ></sbux-button>
		                            </td>
                                </tr>				
                                <tr>
									<th scope="row" class="th_bg">환차손계정</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="EXCHANGE_LOSS_ACC" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="EXCHANGE_LOSS_ACC_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAcc('EXCHANGE_LOSS_ACC')" ></sbux-button>
		                            </td>
                                </tr>		
                                <tr>
									<th scope="row" class="th_bg">평가이익계정</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="VAL_GAIN_ACC" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="VAL_GAIN_ACC_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAcc('VAL_GAIN_ACC')" ></sbux-button>
		                            </td>
                                </tr>					
                                <tr>
									<th scope="row" class="th_bg">평가이익계정</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="VAL_LOSS_ACC" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="VAL_LOSS_ACC_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAcc('VAL_LOSS_ACC')" ></sbux-button>
		                            </td>
                                </tr>																																		                                                                                                                                                                
                            </table>                        	
                        </div>
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
	var editType = 'N';
	
	const fn_initSBSelect = async function() {
		
		let rst = await Promise.all([
			SBUxMethod.hideTab('tab_norm','tab3'),
			//계정그룹구분
			gfnma_multiSelectInit({
				target			: ['#ACC_GROUP_GUBUN']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIG011'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SBSD_CD'
				,colLabel		: 'CD_NM'
				,columns		:[
		            {caption: "코드",			ref: 'SBSD_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "계정그룹구분", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//계정분류
			gfnma_multiSelectInit({
				target			: ['#ACC_CATEGORY']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM032'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SBSD_CD'
				,colLabel		: 'CD_NM'
				,columns		:[
		            {caption: "코드",		ref: 'SBSD_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "계정분류", 	ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//미결관리대상
			gfnma_multiSelectInit({
				target			: ['#ACC_CHARACTER']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM033'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SBSD_CD'
				,colLabel		: 'CD_NM'
				,columns		:[
		            {caption: "코드",		ref: 'SBSD_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "계정특성", 	ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//원가유형
			gfnma_multiSelectInit({
				target			: ['#COST_CLASS']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM126'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SBSD_CD'
				,colLabel		: 'CD_NM'
				,columns		:[
		            {caption: "코드",		ref: 'SBSD_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "코드명	",	 	ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//통제시점
			gfnma_multiSelectInit({
				target			: ['#CONTROL_TIME']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM036'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'SBSD_CD'
				,colLabel		: 'CD_NM'
				,columns		:[
		            {caption: "코드",		ref: 'SBSD_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명칭",	 	ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//통제방식
			gfnma_multiSelectInit({
				target			: ['#CONTROL_METHOD']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM041'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'SBSD_CD'
				,colLabel		: 'CD_NM'
				,columns		:[
		            {caption: "코드",		ref: 'SBSD_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "통제방식",	 	ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//통제주기
			gfnma_multiSelectInit({
				target			: ['#CONTROL_CYCLE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM035'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'SBSD_CD'
				,colLabel		: 'CD_NM'
				,columns		:[
		            {caption: "코드",		ref: 'SBSD_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명칭",	 	ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//통제방식
			gfnma_multiSelectInit({
				target			: ['#PUR_CONTROL_METHOD']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM041'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'SBSD_CD'
				,colLabel		: 'CD_NM'
				,columns		:[
		            {caption: "코드",		ref: 'SBSD_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "통제방식",	 	ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
				]
			}),	
			//통제주기
			gfnma_multiSelectInit({
				target			: ['#PUR_CONTROL_CYCLE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM035'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'SBSD_CD'
				,colLabel		: 'CD_NM'
				,columns		:[
		            {caption: "코드",		ref: 'SBSD_CD', 			width:'100px',  	style:'text-align:left'},
		            {caption: "명칭",	 	ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
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
    
    /**
     * 초기화
     */
    function cfn_init() {
    	gfnma_uxDataClear('#srchArea1');
    	editType = 'N';
    }
	// 신규
	function cfn_add() {
		fn_clearForm();
		editType = 'N';
		$("#ACCOUNT_CODE" ).prop('readonly', false);
	}
	
    // 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
	        fn_save();
		}
    }
	
	// 마스터 그리드 삭제
	function cfn_del() {
		fn_delete();
	}
 
	// 조회
	function cfn_search() {
		fn_search();
		fn_clearForm();
		fn_createGrid();
	}

    //grid 초기화
    var masterTreeGrid; 					// 그리드를 담기위한 객체 선언
    var jsonMasterTreeList		= []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdCom3630';
	    SBGridProperties.id 				= 'masterTreeGrid';
	    SBGridProperties.jsonref 			= 'jsonMasterTreeList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.contextmenu = true;
        SBGridProperties.contextmenulist = objMenuList;	    
	    SBGridProperties.tree = {
	            col: 1,
	            levelref: "LEVEL",
	            open: true,
	            lock: true
        };
        SBGridProperties.columns = [
            {caption : ["계정코드"],			ref: 'ACCOUNT_CODE', 		type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption : ["계정과목명"],		ref: 'ACCOUNT_NAME', 		type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption : ["계정그룹"],			ref: 'ACC_GROUP_TYPE',		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ["계정과목(한글)"],		ref: 'ACCOUNT_NAME_CHN',	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption : ["원가요소"],			ref: 'COST_ELEMENT',   		type:'output',  	width:'80px',	  	style:'text-align:left'},
            {caption : ["원가요소명"],		ref: 'COST_ELEMENT_NAME',   type:'output',  	width:'150px', 		style:'text-align:left'},
            {caption : ["보고서계정코드"],		ref: 'REPORT_ACCOUNT_CODE',	type:'output',  	width:'150px', 		style:'text-align:left'},
            {caption : ["보고서계정명"],		ref: 'REPORT_ACCOUNT_NAME', type:'output',  	width:'150px',	  	style:'text-align:left'}
        ];
        masterTreeGrid	= _SBGrid.create(SBGridProperties);
        masterTreeGrid.bind('click', 'fn_view');
        masterTreeGrid.bind('keyup', 'fn_keyup');
    }
    const fn_keyup = async function(event){
    	if(event.keyCode == 38 || event.keyCode == 40 ){
    		await fn_view();
    	}
    }
    
    /**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    var objMenuList = {
            "Add": {
                "name": "계정과목 추가",			//컨텍스트메뉴에 표시될 이름
                "accesskey": "a",			//단축키
                "callback": fn_ctxtAddRow,	//콜백함수명
                "callbackparam": ['masterTreeGrid', true]// 콜백함수 파라미터 전달
            },
            "Delete": {
                "name": "계정과목 삭제",
                "accesskey": "d",
                "callback": fn_ctxtDelRow
            }
    };
	/**
     * @name fn_ctxtAddRow
     * @description 메뉴추가 (CTXT)
     */
    function fn_ctxtAddRow(arg1, arg2, arg3) {
        /* 두번째 파라미터 부터 callbackparam 속성으로 설정한 값을 반환할 수 있습니다. */
        var nRow = grdMenuTreeList.getRow();
        if (nRow > 0) {
            fn_create(nRow);
        }
    };
	/**
     * @name fn_ctxtDelRow
     * @description 메뉴삭제 (CTXT)
     */
    function fn_ctxtDelRow() {
    	fn_delete();
    };
    
    /**
     * 코드목록 조회
     */
    const fn_search = async function() {

    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	
    	let SRCH_ACCOUNT_CODE_P	= gfn_nvl(SBUxMethod.get("SRCH_ACCOUNT_CODE_P"));
    	let SRCH_ACCOUNT_NAME_P = gfn_nvl(SBUxMethod.get("SRCH_ACCOUNT_NAME_P"));
    	
    	var paramObj = {
    		    V_P_DEBUG_MODE_YN       : ''
	    	   ,V_P_LANG_ID             : ''
	    	   ,V_P_COMP_CODE           : gv_ma_selectedCorpCd
	    	   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
	    	   ,V_P_ACCOUNT_CODE        : SRCH_ACCOUNT_CODE_P
	    	   ,V_P_ACCOUNT_NAME        : SRCH_ACCOUNT_NAME_P
	    	   ,V_P_FORM_ID             : p_formId
	    	   ,V_P_MENU_ID             : p_menuId
	    	   ,V_P_PROC_ID             : ''
	    	   ,V_P_USERID              : p_userId
	    	   ,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3630.do", {
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
		    				LEVEL				: item.LEVEL,
		    				KEYID				: item.KEY_ID,
		    				PARENTKEYID			: item.UP_KEY_ID,
		    				ACCOUNT_CODE		: item.ACNTL_CD,
		    				ACCOUNT_NAME		: item.ACNT_NM,
		    				PARENT_ACC			: item.PRNT_ACNT,
		    				ACC_CATEGORY		: item.ACNT_CTGRY,
		    				BALANCE_SIDE		: item.ACNT_BLNC_SE,
		    				ACC_CHARACTER		: item.INCPL_TYPE,
		    				ACC_GROUP_TYPE		: item.ACNT_GROUP_TYPE,
		    				ACCOUNT_NAME_CHN	: item.ACNT_NM_CHN,
		    				COST_ELEMENT		: item.CST_ELMT_CD,
		    				COST_ELEMENT_NAME	: item.CST_ELMT_NM,
		    				REPORT_ACCOUNT_CODE	: item.RPT_ACNT_CD,
		    				REPORT_ACCOUNT_NAME	: item.RPT_ACNT_NM
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
    const fn_clearForm = function() {
		
    	//코드목록 
    	jsonMasterTreeList = [];
    	
    	//기본정보
    	SBUxMethod.set("ACCOUNT_CODE", 		    "");
    	SBUxMethod.set("ACC_ABBR_NAME", 	    "");
    	SBUxMethod.set("ACCOUNT_NAME",		    "");
    	SBUxMethod.set("DESCR", 			    "");
    	SBUxMethod.set("ACCOUNT_NAME_CHN", 	    "");
    	SBUxMethod.set("PARENT_YN", 		    "N");
    	SBUxMethod.set("DOC_INPUT_YN", 		    "N");
    	SBUxMethod.set("PARENT_ACC", 		    "");
    	SBUxMethod.set("PARENT_NAME", 		    "");
    	SBUxMethod.set("SUMACCOUNT_CODE", 	    "");
    	SBUxMethod.set("SUMACCOUNT_NAME", 	    "");
    	SBUxMethod.set("SORT_SEQ", 			    "");
    	SBUxMethod.set("HQ_ACCOUNT_CODE", 	    "");
    	SBUxMethod.set("HQ_ACCOUNT_NAME",	    "");
    	SBUxMethod.set("REPORT_ACCOUNT_CODE",   "");
    	SBUxMethod.set("REPORT_ACCOUNT_NAME",   "");
    	SBUxMethod.set("OLD_ACCOUNT_CODE", 		"");
    	SBUxMethod.set("OLD_ACCOUNT_NAME", 		"");
    	SBUxMethod.set("SORT_SEQ_PL", 			"");
    	SBUxMethod.set("SORT_SEQ_KGAAP_PL", 	"");
    	SBUxMethod.set("RDO_BALANCE_SIDE", 		"D");
    	SBUxMethod.set("OPEN_TO_ALL_YN", 		"N");
    	SBUxMethod.set("OPEN_TO_FCM_YN", 		"N");
    	SBUxMethod.set("FS_VIEW_FLAG", 			"N");
    	SBUxMethod.set("USE_YN", 				"N");
    	SBUxMethod.set("REPORT_VIEW_YN", 		"N");
    	SBUxMethod.set("PL_VIEW_YN", 			"N");
    	SBUxMethod.set("KGAAP_PL_VIEW_YN", 		"N");
    	gfnma_multiSelectSet('#ACC_GROUP_GUBUN', 	'', '', '');
    	gfnma_multiSelectSet('#ACC_CATEGORY', 		'', '', '');
    	gfnma_multiSelectSet('#ACC_CHARACTER', 		'', '', '');

    	// 회계관리
    	SBUxMethod.set("TTR_TYPE", 				"");
    	SBUxMethod.set("TTR_TYPE_NAME", 		"");
    	SBUxMethod.set("COST_ELEMENT_CODE", 	"");
    	SBUxMethod.set("COST_ELEMENT_NAME", 	"");
    	SBUxMethod.set("ASSET_YN", 				"N");
    	SBUxMethod.set("GL_IMPORT_YN", 			"N");
    	SBUxMethod.set("YEAR_RE_ACCOUNT_YN", 	"");
    	SBUxMethod.set("MONTH_RE_ACCOUNT_YN", 	"");
    	SBUxMethod.set("PROJECT_YN", 			"N");
    	SBUxMethod.set("USABLE_TAX_TYPE", 		"");
    	SBUxMethod.set("REMARK", 				"");
    	SBUxMethod.set("CATEGORY1", 			"");
    	gfnma_multiSelectSet('#COST_CLASS', 	'', '', '');

    	//예산관리
    	SBUxMethod.set("BUDGETING_YN", 			"N");
    	SBUxMethod.set("BUDGET_DEPT_CODE", 		"");
    	SBUxMethod.set("BUDGET_DEPT_NAME", 		"");
    	SBUxMethod.set("BUDGET_ACC_CODE", 		"");
    	SBUxMethod.set("BUDGET_ACC_NAME", 		"");
    	SBUxMethod.set("BUDGET_CONTROL_YN", 	"N");
    	SBUxMethod.set("BUDGET_FORWARD_YN", 	"N");
    	SBUxMethod.set("PUR_BUDGET_CONTROL_YN", "N");
    	SBUxMethod.set("PUR_BUDGET_FORWARD_YN", "N");
    	SBUxMethod.set("CATEGORY3", 			"N");
    	SBUxMethod.set("PUR_BUDGET_CC", 		"");
    	SBUxMethod.set("PUR_BUDGET_CC_NAME", 	"");
    	SBUxMethod.set("CATEGORY2", 			"");
    	SBUxMethod.set("CATEGORY2_NAME", 		"");
    	gfnma_multiSelectSet('#BUDGET_METHOD', 		'', '', '');
    	gfnma_multiSelectSet('#CONTROL_TIME', 		'', '', '');
    	gfnma_multiSelectSet('#CONTROL_METHOD', 	'', '', '');
    	gfnma_multiSelectSet('#CONTROL_CYCLE', 		'', '', '');
    	gfnma_multiSelectSet('#PUR_CONTROL_METHOD', '', '', '');
    	gfnma_multiSelectSet('#PUR_CONTROL_CYCLE', 	'', '', '');

    	//관리항목
    	SBUxMethod.set("ACC_ITEM_CODE1",          "");
    	SBUxMethod.set("ACC_ITEM_NAME1",          "");
    	SBUxMethod.set("ACC_ITEM_CODE2",          "");
    	SBUxMethod.set("ACC_ITEM_NAME2",          "");
    	SBUxMethod.set("ACC_ITEM_CODE3",          "");
    	SBUxMethod.set("ACC_ITEM_NAME3",          "");
    	SBUxMethod.set("ACC_ITEM_CODE4",          "");
    	SBUxMethod.set("ACC_ITEM_NAME4",          "");
    	SBUxMethod.set("ACC_ITEM_CODE5",          "");
    	SBUxMethod.set("ACC_ITEM_NAME5",          "");
    	SBUxMethod.set("ACC_ITEM_CODE6",          "");
    	SBUxMethod.set("ACC_ITEM_NAME6",          "");
    	SBUxMethod.set("ACC_ITEM_CODE7",          "");
    	SBUxMethod.set("ACC_ITEM_NAME7",          "");
    	SBUxMethod.set("ACC_ITEM_CODE8",          "");
    	SBUxMethod.set("ACC_ITEM_NAME8",          "");
    	SBUxMethod.set("ACC_ITEM_CODE9",          "");
    	SBUxMethod.set("ACC_ITEM_NAME9",          "");
    	SBUxMethod.set("ACC_ITEM_CODE10",		  "");
    	SBUxMethod.set("ACC_ITEM_NAME10",		  "");
    	SBUxMethod.set("ESS_POPUP_PAGE",		  "");

    	SBUxMethod.set("ITEM_USE_YN1",		      "N");
    	SBUxMethod.set("ITEM_USE_YN2",		      "N");
    	SBUxMethod.set("ITEM_USE_YN3",		      "N");
    	SBUxMethod.set("ITEM_USE_YN4",		      "N");
    	SBUxMethod.set("ITEM_USE_YN5",		      "N");
    	SBUxMethod.set("ITEM_USE_YN6",		      "N");
    	SBUxMethod.set("ITEM_USE_YN7",		      "N");
    	SBUxMethod.set("ITEM_USE_YN8",		      "N");
    	SBUxMethod.set("ITEM_USE_YN9",		      "N");
    	SBUxMethod.set("ITEM_USE_YN10",		      "N");
    	    	
    	

    	//외화관련계정
    	SBUxMethod.set("EXCHANGE_GAIN_ACC", 		"");
    	SBUxMethod.set("EXCHANGE_GAIN_ACC_NAME", 	"");
    	SBUxMethod.set("EXCHANGE_LOSS_ACC", 		"");
    	SBUxMethod.set("EXCHANGE_LOSS_ACC_NAME", 	"");
    	SBUxMethod.set("VAL_GAIN_ACC", 				"");
    	SBUxMethod.set("VAL_GAIN_ACC_NAME", 		"");
    	SBUxMethod.set("VAL_LOSS_ACC",				"");
    	SBUxMethod.set("VAL_LOSS_ACC_NAME", 		"");
    }
    
    // 그리드 삭제
    const fn_delete = async function(){

  	    var paramObj = {
   	    	   V_P_DEBUG_MODE_YN              : ""
     		   ,V_P_LANG_ID                   : ""
     		   ,V_P_COMP_CODE                 : gv_ma_selectedCorpCd
     		   ,V_P_CLIENT_CODE               : gv_ma_selectedClntCd
     		   ,V_P_ACCOUNT_CODE              : gfn_nvl(SBUxMethod.get("ACCOUNT_CODE"))
     		   ,V_P_ACCOUNT_NAME              : gfn_nvl(SBUxMethod.get("ACCOUNT_NAME"))
     		   ,V_P_ACC_ABBR_NAME             : gfn_nvl(SBUxMethod.get("ACC_ABBR_NAME"))
     		   ,V_P_PARENT_YN                 : gfn_nvl(SBUxMethod.get("PARENT_YN").PARENT_YN)
     		   ,V_P_PARENT_ACC                : gfn_nvl(SBUxMethod.get("PARENT_ACC"))
     		   ,V_P_ACC_GROUP_TYPE            : gfnma_multiSelectGet('#ACC_GROUP_GUBUN')
     		   ,V_P_ACC_CATEGORY              : gfnma_multiSelectGet('#ACC_CATEGORY')
     		   ,V_P_BALANCE_SIDE              : gfn_nvl(SBUxMethod.get("RDO_BALANCE_SIDE"))
     		   ,V_P_DOC_INPUT_YN              : gfn_nvl(SBUxMethod.get("DOC_INPUT_YN").DOC_INPUT_YN)
     		   ,V_P_OPEN_TO_ALL_YN            : gfn_nvl(SBUxMethod.get("OPEN_TO_ALL_YN").OPEN_TO_ALL_YN)
     		   ,V_P_OPEN_TO_FCM_YN            : gfn_nvl(SBUxMethod.get("OPEN_TO_FCM_YN").OPEN_TO_FCM_YN)
     		   ,V_P_REPORT_VIEW_YN            : gfn_nvl(SBUxMethod.get("REPORT_VIEW_YN").REPORT_VIEW_YN)
     		   ,V_P_PL_VIEW_YN                : gfn_nvl(SBUxMethod.get("PL_VIEW_YN").PL_VIEW_YN)
     		   ,V_P_KGAAP_PL_VIEW_YN          : gfn_nvl(SBUxMethod.get("KGAAP_PL_VIEW_YN").KGAAP_PL_VIEW_YN)
     		   ,V_P_SORT_SEQ_PL               : gfn_nvl(SBUxMethod.get("SORT_SEQ_PL"))
     		   ,V_P_SORT_SEQ_KGAAP_PL         : gfn_nvl(SBUxMethod.get("SORT_SEQ_KGAAP_PL"))
     		   ,V_P_ACC_CHARACTER             : gfnma_multiSelectGet('#ACC_CHARACTER')
     		   ,V_P_SUMACCOUNT_CODE           : gfn_nvl(SBUxMethod.get("SUMACCOUNT_CODE"))
     		   ,V_P_DESCR                     : gfn_nvl(SBUxMethod.get("DESCR"))
     		   ,V_P_USE_YN                    : gfn_nvl(SBUxMethod.get("USE_YN").USE_YN)
     		   ,V_P_SORT_SEQ                  : gfn_nvl(SBUxMethod.get("SORT_SEQ"))
     		   ,V_P_SORT_SEQ_CHN              : ''
     		   ,V_P_ACC_ITEM_CODE1            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE1"))
     		   ,V_P_ACC_ITEM_CODE2            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE2"))
     		   ,V_P_ACC_ITEM_CODE3            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE3"))
     		   ,V_P_ACC_ITEM_CODE4            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE4"))
     		   ,V_P_ACC_ITEM_CODE5            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE5"))
     		   ,V_P_ACC_ITEM_CODE6            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE6"))
     		   ,V_P_ACC_ITEM_CODE7            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE7"))
     		   ,V_P_ACC_ITEM_CODE8            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE8"))
     		   ,V_P_ACC_ITEM_CODE9            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE9"))
     		   ,V_P_ACC_ITEM_CODE10           : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE10"))
     		   ,V_P_ITEM_USE_YN1              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN1").ITEM_USE_YN1)
     		   ,V_P_ITEM_USE_YN2              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN2").ITEM_USE_YN2)
     		   ,V_P_ITEM_USE_YN3              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN3").ITEM_USE_YN3)
     		   ,V_P_ITEM_USE_YN4              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN4").ITEM_USE_YN4)
     		   ,V_P_ITEM_USE_YN5              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN5").ITEM_USE_YN5)
     		   ,V_P_ITEM_USE_YN6              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN6").ITEM_USE_YN6)
     		   ,V_P_ITEM_USE_YN7              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN7").ITEM_USE_YN7)
     		   ,V_P_ITEM_USE_YN8              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN8").ITEM_USE_YN8)
     		   ,V_P_ITEM_USE_YN9              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN9").ITEM_USE_YN9)
     		   ,V_P_ITEM_USE_YN10             : gfn_nvl(SBUxMethod.get("ITEM_USE_YN10").ITEM_USE_YN10)
     		   ,V_P_BUDGETING_YN              : gfn_nvl(SBUxMethod.get("BUDGETING_YN").BUDGETING_YN)
     		   ,V_P_BUDGET_METHOD             : gfnma_multiSelectGet('#BUDGET_METHOD')
     		   ,V_P_CONTROL_METHOD            : gfnma_multiSelectGet('#CONTROL_METHOD')
     		   ,V_P_CONTROL_CYCLE             : gfnma_multiSelectGet('#CONTROL_CYCLE')
     		   ,V_P_BUDGET_DEPT_CODE          : gfn_nvl(SBUxMethod.get("BUDGET_DEPT_CODE"))
     		   ,V_P_BUDGET_CONTROL_YN         : gfn_nvl(SBUxMethod.get("BUDGET_CONTROL_YN").BUDGET_CONTROL_YN)
     		   ,V_P_CONTROL_TIME              : gfnma_multiSelectGet('#CONTROL_TIME')
     		   ,V_P_BUDGET_ACC_CODE           : gfn_nvl(SBUxMethod.get("BUDGET_ACC_CODE"))
     		   ,V_P_BUDGET_FORWARD_YN         : gfn_nvl(SBUxMethod.get("BUDGET_FORWARD_YN").BUDGET_FORWARD_YN)
     		   ,V_P_FINANCE_ITEM              : gfn_nvl(SBUxMethod.get("TTR_TYPE"))
     		   ,V_P_COST_ELEMENT              : gfn_nvl(SBUxMethod.get("COST_ELEMENT_CODE"))
     		   ,V_P_ASSET_YN                  : gfn_nvl(SBUxMethod.get("ASSET_YN").ASSET_YN)
     		   ,V_P_YEAR_RE_ACCOUNT_YN        : gfn_nvl(SBUxMethod.get("YEAR_RE_ACCOUNT_YN").YEAR_RE_ACCOUNT_YN)
     		   ,V_P_MONTH_RE_ACCOUNT_YN       : gfn_nvl(SBUxMethod.get("MONTH_RE_ACCOUNT_YN").MONTH_RE_ACCOUNT_YN)
     		   ,V_P_GL_IMPORT_YN              : gfn_nvl(SBUxMethod.get("GL_IMPORT_YN").GL_IMPORT_YN)
     		   ,V_P_FS_VIEW_FLAG              : gfn_nvl(SBUxMethod.get("FS_VIEW_FLAG").FS_VIEW_FLAG)
     		   ,V_P_ACCOUNT_NAME_CHN          : gfn_nvl(SBUxMethod.get("ACCOUNT_NAME_CHN"))
     		   ,V_P_HQ_ACCOUNT_CODE           : gfn_nvl(SBUxMethod.get("HQ_ACCOUNT_CODE"))
     		   ,V_P_HQ_ACCOUNT_NAME           : gfn_nvl(SBUxMethod.get("HQ_ACCOUNT_NAME"))
     		   ,V_P_REPORT_ACCOUNT_CODE       : gfn_nvl(SBUxMethod.get("REPORT_ACCOUNT_CODE"))
     		   ,V_P_REPORT_ACCOUNT_NAME       : gfn_nvl(SBUxMethod.get("REPORT_ACCOUNT_NAME"))
     		   ,V_P_EXCHANGE_GAIN_ACC         : gfn_nvl(SBUxMethod.get("EXCHANGE_GAIN_ACC"))
     		   ,V_P_EXCHANGE_LOSS_ACC         : gfn_nvl(SBUxMethod.get("EXCHANGE_LOSS_ACC"))
     		   ,V_P_VAL_GAIN_ACC              : gfn_nvl(SBUxMethod.get("VAL_GAIN_ACC"))
     		   ,V_P_VAL_LOSS_ACC              : gfn_nvl(SBUxMethod.get("VAL_LOSS_ACC"))
     		   ,V_P_PROJECT_YN                : gfn_nvl(SBUxMethod.get("PROJECT_YN").PROJECT_YN)
     		   ,V_P_COST_CLASS                : gfnma_multiSelectGet('#COST_CLASS')
     		   ,V_P_USABLE_TAX_TYPE           : gfn_nvl(SBUxMethod.get("USABLE_TAX_TYPE"))
     		   ,V_P_ESS_POPUP_PAGE            : gfn_nvl(SBUxMethod.get("ESS_POPUP_PAGE"))
     		   ,V_P_PUR_BUDGET_CONTROL_YN     : gfn_nvl(SBUxMethod.get("PUR_BUDGET_CONTROL_YN").PUR_BUDGET_CONTROL_YN)
     		   ,V_P_PUR_CONTROL_METHOD  	  : gfnma_multiSelectGet('#PUR_CONTROL_METHOD')
     		   ,V_P_PUR_CONTROL_CYCLE         : gfnma_multiSelectGet('#PUR_CONTROL_CYCLE')
     		   ,V_P_PUR_BUDGET_FORWARD_YN     : gfn_nvl(SBUxMethod.get("PUR_BUDGET_FORWARD_YN").PUR_BUDGET_FORWARD_YN)
     		   ,V_P_PUR_BUDGET_CC             : gfn_nvl(SBUxMethod.get("PUR_BUDGET_CC"))
     		   ,V_REMARK                      : gfn_nvl(SBUxMethod.get("REMARK"))
     		   ,V_P_CATEGORY1                 : gfn_nvl(SBUxMethod.get("CATEGORY1"))
     		   ,V_P_CATEGORY2                 : gfn_nvl(SBUxMethod.get("CATEGORY2"))
     		   ,V_P_CATEGORY3                 : gfn_nvl(SBUxMethod.get("CATEGORY3").CATEGORY3)
     		   ,V_P_OLD_ACCOUNT_CODE          : gfn_nvl(SBUxMethod.get("OLD_ACCOUNT_CODE"))
     		   ,V_P_OLD_ACCOUNT_NAME          : gfn_nvl(SBUxMethod.get("OLD_ACCOUNT_NAME"))
     		   ,V_P_FORM_ID                   : p_formId
     		   ,V_P_MENU_ID                   : p_menuId
     		   ,V_P_PROC_ID                   : ''
     		   ,V_P_USERID                    : p_userId
     		   ,V_P_PC                        : ''
 	    };	
        const postJsonPromise = gfn_postJSON("/co/sys/com/deleteCom3630.do", {
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

    //그룹코드 내역 저장
    const fn_save = async function() {

        if (!SBUxMethod.validateRequired({group_id:'panAppoint'}) || !validateRequired("panAppoint")) {
            return false;
        }
    	
    	if(editType == "N"){
    		var valUrl = "/co/sys/com/insertCom3630.do";
    	}else{
    		var valUrl = "/co/sys/com/updateCom3630.do";
    	}
    	
  	    var paramObj = {
   	    	   V_P_DEBUG_MODE_YN              : ""
      		   ,V_P_LANG_ID                   : ""
      		   ,V_P_COMP_CODE                 : gv_ma_selectedCorpCd
      		   ,V_P_CLIENT_CODE               : gv_ma_selectedClntCd
      		   ,V_P_ACCOUNT_CODE              : gfn_nvl(SBUxMethod.get("ACCOUNT_CODE"))
      		   ,V_P_ACCOUNT_NAME              : gfn_nvl(SBUxMethod.get("ACCOUNT_NAME"))
      		   ,V_P_ACC_ABBR_NAME             : gfn_nvl(SBUxMethod.get("ACC_ABBR_NAME"))
      		   ,V_P_PARENT_YN                 : gfn_nvl(SBUxMethod.get("PARENT_YN").PARENT_YN)
      		   ,V_P_PARENT_ACC                : gfn_nvl(SBUxMethod.get("PARENT_ACC"))
      		   ,V_P_ACC_GROUP_TYPE            : gfnma_multiSelectGet('#ACC_GROUP_GUBUN')
      		   ,V_P_ACC_CATEGORY              : gfnma_multiSelectGet('#ACC_CATEGORY')
      		   ,V_P_BALANCE_SIDE              : gfn_nvl(SBUxMethod.get("RDO_BALANCE_SIDE"))
      		   ,V_P_DOC_INPUT_YN              : gfn_nvl(SBUxMethod.get("DOC_INPUT_YN").DOC_INPUT_YN)
      		   ,V_P_OPEN_TO_ALL_YN            : gfn_nvl(SBUxMethod.get("OPEN_TO_ALL_YN").OPEN_TO_ALL_YN)
      		   ,V_P_OPEN_TO_FCM_YN            : gfn_nvl(SBUxMethod.get("OPEN_TO_FCM_YN").OPEN_TO_FCM_YN)
      		   ,V_P_REPORT_VIEW_YN            : gfn_nvl(SBUxMethod.get("REPORT_VIEW_YN").REPORT_VIEW_YN)
      		   ,V_P_PL_VIEW_YN                : gfn_nvl(SBUxMethod.get("PL_VIEW_YN").PL_VIEW_YN)
      		   ,V_P_KGAAP_PL_VIEW_YN          : gfn_nvl(SBUxMethod.get("KGAAP_PL_VIEW_YN").KGAAP_PL_VIEW_YN)
      		   ,V_P_SORT_SEQ_PL               : gfn_nvl(SBUxMethod.get("SORT_SEQ_PL"))
      		   ,V_P_SORT_SEQ_KGAAP_PL         : gfn_nvl(SBUxMethod.get("SORT_SEQ_KGAAP_PL"))
      		   ,V_P_ACC_CHARACTER             : gfnma_multiSelectGet('#ACC_CHARACTER')
      		   ,V_P_SUMACCOUNT_CODE           : gfn_nvl(SBUxMethod.get("SUMACCOUNT_CODE"))
      		   ,V_P_DESCR                     : gfn_nvl(SBUxMethod.get("DESCR"))
      		   ,V_P_USE_YN                    : gfn_nvl(SBUxMethod.get("USE_YN").USE_YN)
      		   ,V_P_SORT_SEQ                  : gfn_nvl(SBUxMethod.get("SORT_SEQ"))
      		   ,V_P_SORT_SEQ_CHN              : ''
      		   ,V_P_ACC_ITEM_CODE1            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE1"))
      		   ,V_P_ACC_ITEM_CODE2            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE2"))
      		   ,V_P_ACC_ITEM_CODE3            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE3"))
      		   ,V_P_ACC_ITEM_CODE4            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE4"))
      		   ,V_P_ACC_ITEM_CODE5            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE5"))
      		   ,V_P_ACC_ITEM_CODE6            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE6"))
      		   ,V_P_ACC_ITEM_CODE7            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE7"))
      		   ,V_P_ACC_ITEM_CODE8            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE8"))
      		   ,V_P_ACC_ITEM_CODE9            : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE9"))
      		   ,V_P_ACC_ITEM_CODE10           : gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE10"))
      		   ,V_P_ITEM_USE_YN1              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN1").ITEM_USE_YN1)
      		   ,V_P_ITEM_USE_YN2              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN2").ITEM_USE_YN2)
      		   ,V_P_ITEM_USE_YN3              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN3").ITEM_USE_YN3)
      		   ,V_P_ITEM_USE_YN4              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN4").ITEM_USE_YN4)
      		   ,V_P_ITEM_USE_YN5              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN5").ITEM_USE_YN5)
      		   ,V_P_ITEM_USE_YN6              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN6").ITEM_USE_YN6)
      		   ,V_P_ITEM_USE_YN7              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN7").ITEM_USE_YN7)
      		   ,V_P_ITEM_USE_YN8              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN8").ITEM_USE_YN8)
      		   ,V_P_ITEM_USE_YN9              : gfn_nvl(SBUxMethod.get("ITEM_USE_YN9").ITEM_USE_YN9)
      		   ,V_P_ITEM_USE_YN10             : gfn_nvl(SBUxMethod.get("ITEM_USE_YN10").ITEM_USE_YN10)
      		   ,V_P_BUDGETING_YN              : gfn_nvl(SBUxMethod.get("BUDGETING_YN").BUDGETING_YN)
      		   ,V_P_BUDGET_METHOD             : gfnma_multiSelectGet('#BUDGET_METHOD')
      		   ,V_P_CONTROL_METHOD            : gfnma_multiSelectGet('#CONTROL_METHOD')
      		   ,V_P_CONTROL_CYCLE             : gfnma_multiSelectGet('#CONTROL_CYCLE')
      		   ,V_P_BUDGET_DEPT_CODE          : gfn_nvl(SBUxMethod.get("BUDGET_DEPT_CODE"))
      		   ,V_P_BUDGET_CONTROL_YN         : gfn_nvl(SBUxMethod.get("BUDGET_CONTROL_YN").BUDGET_CONTROL_YN)
      		   ,V_P_CONTROL_TIME              : gfnma_multiSelectGet('#CONTROL_TIME')
      		   ,V_P_BUDGET_ACC_CODE           : gfn_nvl(SBUxMethod.get("BUDGET_ACC_CODE"))
      		   ,V_P_BUDGET_FORWARD_YN         : gfn_nvl(SBUxMethod.get("BUDGET_FORWARD_YN").BUDGET_FORWARD_YN)
      		   ,V_P_FINANCE_ITEM              : gfn_nvl(SBUxMethod.get("TTR_TYPE"))
      		   ,V_P_COST_ELEMENT              : gfn_nvl(SBUxMethod.get("COST_ELEMENT_CODE"))
      		   ,V_P_ASSET_YN                  : gfn_nvl(SBUxMethod.get("ASSET_YN").ASSET_YN)
      		   ,V_P_YEAR_RE_ACCOUNT_YN        : gfn_nvl(SBUxMethod.get("YEAR_RE_ACCOUNT_YN").YEAR_RE_ACCOUNT_YN)
      		   ,V_P_MONTH_RE_ACCOUNT_YN       : gfn_nvl(SBUxMethod.get("MONTH_RE_ACCOUNT_YN").MONTH_RE_ACCOUNT_YN)
      		   ,V_P_GL_IMPORT_YN              : gfn_nvl(SBUxMethod.get("GL_IMPORT_YN").GL_IMPORT_YN)
      		   ,V_P_FS_VIEW_FLAG              : gfn_nvl(SBUxMethod.get("FS_VIEW_FLAG").FS_VIEW_FLAG)
      		   ,V_P_ACCOUNT_NAME_CHN          : gfn_nvl(SBUxMethod.get("ACCOUNT_NAME_CHN"))
      		   ,V_P_HQ_ACCOUNT_CODE           : gfn_nvl(SBUxMethod.get("HQ_ACCOUNT_CODE"))
      		   ,V_P_HQ_ACCOUNT_NAME           : gfn_nvl(SBUxMethod.get("HQ_ACCOUNT_NAME"))
      		   ,V_P_REPORT_ACCOUNT_CODE       : gfn_nvl(SBUxMethod.get("REPORT_ACCOUNT_CODE"))
      		   ,V_P_REPORT_ACCOUNT_NAME       : gfn_nvl(SBUxMethod.get("REPORT_ACCOUNT_NAME"))
      		   ,V_P_EXCHANGE_GAIN_ACC         : gfn_nvl(SBUxMethod.get("EXCHANGE_GAIN_ACC"))
      		   ,V_P_EXCHANGE_LOSS_ACC         : gfn_nvl(SBUxMethod.get("EXCHANGE_LOSS_ACC"))
      		   ,V_P_VAL_GAIN_ACC              : gfn_nvl(SBUxMethod.get("VAL_GAIN_ACC"))
      		   ,V_P_VAL_LOSS_ACC              : gfn_nvl(SBUxMethod.get("VAL_LOSS_ACC"))
      		   ,V_P_PROJECT_YN                : gfn_nvl(SBUxMethod.get("PROJECT_YN").PROJECT_YN)
      		   ,V_P_COST_CLASS                : gfnma_multiSelectGet('#COST_CLASS')
      		   ,V_P_USABLE_TAX_TYPE           : gfn_nvl(SBUxMethod.get("USABLE_TAX_TYPE"))
      		   ,V_P_ESS_POPUP_PAGE            : gfn_nvl(SBUxMethod.get("ESS_POPUP_PAGE"))
      		   ,V_P_PUR_BUDGET_CONTROL_YN     : gfn_nvl(SBUxMethod.get("PUR_BUDGET_CONTROL_YN").PUR_BUDGET_CONTROL_YN)
      		   ,V_P_PUR_CONTROL_METHOD  	  : gfnma_multiSelectGet('#PUR_CONTROL_METHOD')
      		   ,V_P_PUR_CONTROL_CYCLE         : gfnma_multiSelectGet('#PUR_CONTROL_CYCLE')
      		   ,V_P_PUR_BUDGET_FORWARD_YN     : gfn_nvl(SBUxMethod.get("PUR_BUDGET_FORWARD_YN").PUR_BUDGET_FORWARD_YN)
      		   ,V_P_PUR_BUDGET_CC             : gfn_nvl(SBUxMethod.get("PUR_BUDGET_CC"))
      		   ,V_REMARK                      : gfn_nvl(SBUxMethod.get("REMARK"))
      		   ,V_P_CATEGORY1                 : gfn_nvl(SBUxMethod.get("CATEGORY1"))
      		   ,V_P_CATEGORY2                 : gfn_nvl(SBUxMethod.get("CATEGORY2"))
      		   ,V_P_CATEGORY3                 : gfn_nvl(SBUxMethod.get("CATEGORY3").CATEGORY3)
      		   ,V_P_OLD_ACCOUNT_CODE          : gfn_nvl(SBUxMethod.get("OLD_ACCOUNT_CODE"))
      		   ,V_P_OLD_ACCOUNT_NAME          : gfn_nvl(SBUxMethod.get("OLD_ACCOUNT_NAME"))
      		   ,V_P_FORM_ID                   : p_formId
      		   ,V_P_MENU_ID                   : p_menuId
      		   ,V_P_PROC_ID                   : ''
      		   ,V_P_USERID                    : p_userId
      		   ,V_P_PC                        : ''
  	    };	
        const postJsonPromise = gfn_postJSON(valUrl, {
        	getType				: 'json',
        	workType			: editType,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
        
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
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

    //서브 그리드
    function fn_view() {
		editType = 'U';
    	
    	var nCol = masterTreeGrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = masterTreeGrid.getRow();
		if (nRow < 1) {
            return;
		}
		
		let rowData = masterTreeGrid.getRowData(nRow);
		
    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	fn_viewSubGrid(rowData.ACCOUNT_CODE);
    }
    
    const fn_viewSubGrid = async function(ACCOUNT_CODE) {

    	var paramObj = {
    		    V_P_DEBUG_MODE_YN       : ''
	    	   ,V_P_LANG_ID             : ''
	    	   ,V_P_COMP_CODE           : gv_ma_selectedCorpCd
	    	   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
	    	   ,V_P_ACCOUNT_CODE        : ACCOUNT_CODE
	    	   ,V_P_ACCOUNT_NAME        : ''
	    	   ,V_P_FORM_ID             : p_formId
	    	   ,V_P_MENU_ID             : p_menuId
	    	   ,V_P_PROC_ID             : ''
	    	   ,V_P_USERID              : p_userId
	    	   ,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3630.do", {
			getType				: 'json',
			workType			: 'Q1',
			cv_count			: '2',
			params				: gfnma_objectToString(paramObj)
		});
    	const subData = await postJsonPromise;
    	try {
	    	if (_.isEqual("S", subData.resultStatus)) {

	    		let obj = subData.cv_2[0];
	    		// 기본정보
   	   	   		SBUxMethod.set("ACCOUNT_CODE", 			    obj.ACNTL_CD);
		   		SBUxMethod.set("ACC_ABBR_NAME", 		    obj.ACNT_ABBR_NM);
		   		SBUxMethod.set("ACCOUNT_NAME", 			    obj.ACNT_NM);
		   		SBUxMethod.set("DESCR", 				    obj.DSCTN);
		   		SBUxMethod.set("ACCOUNT_NAME_CHN", 		    obj.ACNT_NM_CHN);
		   		SBUxMethod.set("PARENT_YN", 			    obj.PRNT_YN);
		   		SBUxMethod.set("DOC_INPUT_YN", 			    obj.SLIP_INPT_YN);
		   		SBUxMethod.set("PARENT_ACC", 			    obj.PRNT_ACNT);
		   		SBUxMethod.set("PARENT_NAME", 			    obj.PARENT_NAME);
		   		SBUxMethod.set("SUMACCOUNT_CODE", 		    obj.SUM_BLNC_ACNT_CD);
		   		SBUxMethod.set("SUMACCOUNT_NAME", 		    obj.SUMACCOUNT_NAME);
		   		SBUxMethod.set("SORT_SEQ", 				    obj.SORT_SEQ);
		   		SBUxMethod.set("HQ_ACCOUNT_CODE", 		    obj.HQ_ACNT_CD);
		   		SBUxMethod.set("HQ_ACCOUNT_NAME", 		    obj.HQ_ACNT_NM);
		   		SBUxMethod.set("REPORT_ACCOUNT_CODE", 	    obj.RPT_ACNT_CD);
		   		SBUxMethod.set("REPORT_ACCOUNT_NAME", 	    obj.RPT_ACNT_NM);
		   		SBUxMethod.set("OLD_ACCOUNT_CODE", 		    obj.BFR_ACNT_CD);
		   		SBUxMethod.set("OLD_ACCOUNT_NAME", 		    obj.BFR_ACNT_NM);
		   		SBUxMethod.set("SORT_SEQ_PL", 			    obj.SORT_SEQ_GNLS);
		   		SBUxMethod.set("SORT_SEQ_KGAAP_PL", 	    obj.SORT_SEQ_GAAP_GNLS);
		   		SBUxMethod.set("RDO_BALANCE_SIDE", 		    obj.ACNT_BLNC_SE);
		   		SBUxMethod.set("OPEN_TO_ALL_YN", 		    obj.WHOL_OPN_USE_YN);
		   		SBUxMethod.set("OPEN_TO_FCM_YN", 		    obj.OPN_FA_USE_YN);
		   		SBUxMethod.set("FS_VIEW_FLAG", 			    obj.SBTR_ACNT_FLAG);
		   		SBUxMethod.set("USE_YN", 				    obj.USE_YN);
		   		SBUxMethod.set("REPORT_VIEW_YN", 		    obj.RPT_VIEW_YN);
		   		SBUxMethod.set("PL_VIEW_YN", 			    obj.PFLS_VIEW_YN);
		   		SBUxMethod.set("KGAAP_PL_VIEW_YN", 			obj.GAAP_INQ_YN);
		        gfnma_multiSelectSet('#ACC_GROUP_GUBUN', 	'SBSD_CD', 'CD_NM', obj.ACNT_GROUP_TYPE);
		        gfnma_multiSelectSet('#ACC_CATEGORY', 		'SBSD_CD', 'CD_NM', obj.ACNT_CTGRY);
		        gfnma_multiSelectSet('#ACC_CHARACTER', 		'SBSD_CD', 'CD_NM', obj.INCPL_TYPE);
	
		        // 회계관리
		   		SBUxMethod.set("TTR_TYPE", 				    obj.TTR_TYPE);
		   		SBUxMethod.set("TTR_TYPE_NAME", 		    obj.TTR_TYPE_NAME);
		   		SBUxMethod.set("COST_ELEMENT_CODE", 	    obj.CST_ELMT_CD);
		   		SBUxMethod.set("COST_ELEMENT_NAME", 	    obj.CST_ELMT_NM);
		   		SBUxMethod.set("ASSET_YN", 				    obj.AST_REG_YN);
		   		SBUxMethod.set("GL_IMPORT_YN", 			    obj.GNLGR_RCPTN_YN);
		   		SBUxMethod.set("YEAR_RE_ACCOUNT_YN", 	    obj.YR_PRFT_RMNDR_ACNT_YN);
		   		SBUxMethod.set("MONTH_RE_ACCOUNT_YN", 	    obj.MM_DSSPS_PRFT_YN);
		   		SBUxMethod.set("PROJECT_YN", 			    obj.PJT_YN);
		   		SBUxMethod.set("USABLE_TAX_TYPE", 		    obj.USE_VAT_TYPE);
		   		SBUxMethod.set("REMARK", 				    obj.RMRK);
		   		SBUxMethod.set("CATEGORY1", 			    obj.CTRGY1);
		        gfnma_multiSelectSet('#COST_CLASS', 	    'SBSD_CD', 'CD_NM', obj.CST_CLSF);
		        
		        //예산관리
		   		SBUxMethod.set("BUDGETING_YN", 				obj.BGT_FRMT_YN);
		   		SBUxMethod.set("BUDGET_DEPT_CODE", 			obj.BGT_OVS_DEPT_CD);
		   		SBUxMethod.set("BUDGET_DEPT_NAME", 			obj.BUDGET_DEPT_NAME);
		   		SBUxMethod.set("BUDGET_ACC_CODE", 			obj.BGT_ACNTL_CD);
		   		SBUxMethod.set("BUDGET_ACC_NAME", 			obj.BUDGET_ACC_NAME);
		   		SBUxMethod.set("BUDGET_CONTROL_YN", 		obj.BGT_CNTRL_YN);
		   		SBUxMethod.set("BUDGET_FORWARD_YN", 		obj.BGT_CF_YN);
		   		SBUxMethod.set("PUR_BUDGET_CONTROL_YN", 	obj.PORDR_BGT_CNTRL_YN);
		   		SBUxMethod.set("PUR_BUDGET_FORWARD_YN", 	obj.PORDR_BGT_CF_YN);
		   		SBUxMethod.set("CATEGORY3", 				obj.CTRGY3);
		   		SBUxMethod.set("PUR_BUDGET_CC", 			obj.PORDR_BGT_CSTCT);
		   		SBUxMethod.set("PUR_BUDGET_CC_NAME", 		obj.PUR_BUDGET_CC_NAME);
		   		SBUxMethod.set("CATEGORY2", 				obj.CTRGY2);
		   		SBUxMethod.set("CATEGORY2_NAME", 			obj.CATEGORY2_NAME);
		        gfnma_multiSelectSet('#BUDGET_METHOD', 		'SBSD_CD', 'CD_NM', obj.BGT_MNG_MTHD);
		        gfnma_multiSelectSet('#CONTROL_TIME', 		'SBSD_CD', 'CD_NM', obj.CNTRL_TM);
		        gfnma_multiSelectSet('#CONTROL_METHOD', 	'SBSD_CD', 'CD_NM', obj.CNTRL_MTHD);
		        gfnma_multiSelectSet('#CONTROL_CYCLE', 		'SBSD_CD', 'CD_NM', obj.CNTRL_CYCL);
		        gfnma_multiSelectSet('#PUR_CONTROL_METHOD', 'SBSD_CD', 'CD_NM', obj.PORDR_BGT_CNTRL_MTHD);
		        gfnma_multiSelectSet('#PUR_CONTROL_CYCLE', 	'SBSD_CD', 'CD_NM', obj.PORDR_BGT_CNTRL_CYCL);
		        
		        //관리항목
		   		SBUxMethod.set("ACC_ITEM_CODE1", 			obj.ACNT_MNG_ARTCL_CD1);
		   		SBUxMethod.set("ACC_ITEM_NAME1", 			obj.ACNT_MNG_ARTCL_NM1);
		   		SBUxMethod.set("ACC_ITEM_CODE2", 			obj.ACNT_MNG_ARTCL_CD2);
		   		SBUxMethod.set("ACC_ITEM_NAME2", 			obj.ACNT_MNG_ARTCL_NM2);
		   		SBUxMethod.set("ACC_ITEM_CODE3", 			obj.ACNT_MNG_ARTCL_CD3);
		   		SBUxMethod.set("ACC_ITEM_NAME3", 			obj.ACNT_MNG_ARTCL_NM3);
		   		SBUxMethod.set("ACC_ITEM_CODE4", 			obj.ACNT_MNG_ARTCL_CD4);
		   		SBUxMethod.set("ACC_ITEM_NAME4", 			obj.ACNT_MNG_ARTCL_NM4);
		   		SBUxMethod.set("ACC_ITEM_CODE5", 			obj.ACNT_MNG_ARTCL_CD5);
		   		SBUxMethod.set("ACC_ITEM_NAME5", 			obj.ACNT_MNG_ARTCL_NM5);
		   		SBUxMethod.set("ACC_ITEM_CODE6", 			obj.ACNT_MNG_ARTCL_CD6);
		   		SBUxMethod.set("ACC_ITEM_NAME6", 			obj.ACNT_MNG_ARTCL_NM6);
		   		SBUxMethod.set("ACC_ITEM_CODE7", 			obj.ACNT_MNG_ARTCL_CD7);
		   		SBUxMethod.set("ACC_ITEM_NAME7", 			obj.ACNT_MNG_ARTCL_NM7);
		   		SBUxMethod.set("ACC_ITEM_CODE8", 			obj.ACNT_MNG_ARTCL_CD8);
		   		SBUxMethod.set("ACC_ITEM_NAME8", 			obj.ACNT_MNG_ARTCL_NM8);
		   		SBUxMethod.set("ACC_ITEM_CODE9", 			obj.ACNT_MNG_ARTCL_CD9);
		   		SBUxMethod.set("ACC_ITEM_NAME9", 			obj.ACNT_MNG_ARTCL_NM9);
		   		SBUxMethod.set("ACC_ITEM_CODE10", 			obj.ACNT_MNG_ARTCL_CD10);
		   		SBUxMethod.set("ACC_ITEM_NAME10", 			obj.ACNT_MNG_ARTCL_NM10);
		    	SBUxMethod.set("ITEM_USE_YN1",		      	obj.ITEM_USE_YN1);
		    	SBUxMethod.set("ITEM_USE_YN2",		      	obj.ITEM_USE_YN2);
		    	SBUxMethod.set("ITEM_USE_YN3",		      	obj.ITEM_USE_YN3);
		    	SBUxMethod.set("ITEM_USE_YN4",		      	obj.ITEM_USE_YN4);
		    	SBUxMethod.set("ITEM_USE_YN5",		      	obj.ITEM_USE_YN5);
		    	SBUxMethod.set("ITEM_USE_YN6",		      	obj.ITEM_USE_YN6);
		    	SBUxMethod.set("ITEM_USE_YN7",		      	obj.ITEM_USE_YN7);
		    	SBUxMethod.set("ITEM_USE_YN8",		      	obj.ITEM_USE_YN8);
		    	SBUxMethod.set("ITEM_USE_YN9",		      	obj.ITEM_USE_YN9);
		    	SBUxMethod.set("ITEM_USE_YN10",		      	obj.ITEM_USE_YN10);
		    	SBUxMethod.set("ESS_POPUP_PAGE",		    obj.ESS_POPUP_PAGE);
		    	
		        //외화관련계정
		   		SBUxMethod.set("EXCHANGE_GAIN_ACC", 		obj.EXCHRT_PRF_ACNT);
		   		SBUxMethod.set("EXCHANGE_GAIN_ACC_NAME", 	obj.EXCHANGE_GAIN_ACC_NAME);
		   		SBUxMethod.set("EXCHANGE_LOSS_ACC", 		obj.EXCHRT_LOSS_ACNT);
		   		SBUxMethod.set("EXCHANGE_LOSS_ACC_NAME", 	obj.EXCHANGE_LOSS_ACC_NAME);
		   		SBUxMethod.set("VAL_GAIN_ACC", 				obj.CNVRT_PRF_ACNT_CD);
		   		SBUxMethod.set("VAL_GAIN_ACC_NAME", 		obj.VAL_GAIN_ACC_NAME);
		   		SBUxMethod.set("VAL_LOSS_ACC", 				obj.CNVRT_LOSS_ACNT_CD);
		   		SBUxMethod.set("VAL_LOSS_ACC_NAME", 		obj.VAL_LOSS_ACC_NAME);
		   		
    		} else {
    	  		alert(subData.resultMessage);
    		}

    	} catch (e) {
	    	if (!(e instanceof Error)) {
	    		e = new Error(e);
	    	}
    		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    	}
    }
    
    /**
     * 공통팝업
     * 상위계정
     */
    var fn_compopupParent = function() {
    	
        var searchCode 		= gfn_nvl(SBUxMethod.get("PARENT_ACC"));
        var searchName 		= gfn_nvl(SBUxMethod.get("PARENT_NAME"));
        var replaceText0 	= "_ACNTL_CD_";
        var replaceText1 	= "_ACNT_NM_";
        var strWhereClause 	= "AND ACNTL_CD LIKE '%" + replaceText0 + "%' AND ACNT_NM LIKE '%" + replaceText1 + "%' AND CO_CD = '" + gv_ma_selectedCorpCd + "'" ;
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '상위계정 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_PARENT_ACCOUNT'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["계정코드", 		"계정명"]
   			,searchInputFields		: ["ACNTL_CD", 		"ACNT_NM"]
   			,searchInputValues		: [searchCode, 		searchName]
    		,height					: '400px'
   			,tableHeader			: ["계정코드", 		"계정명", 		"계정구분"]
   			,tableColumnNames		: ["ACNTL_CD",		"ACNT_NM", 		"ACNT_GROUP_TYPE"]
   			,tableColumnWidths		: ["80px", 			"80px", 		"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('PARENT_ACC',	data.ACNTL_CD);
				SBUxMethod.set('PARENT_NAME',	data.ACNT_NM);
			},
    	});
  	}
    
    /**
     * 공통팝업
     * 순잔액집계계정
     */
    var fn_compopupSumAccount = function() {
    	
        var searchCode 		= gfn_nvl(SBUxMethod.get("SUMACCOUNT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SUMACCOUNT_NAME"));
        var replaceText0 	= "_SUM_BLNC_ACNT_CD_";
        var replaceText1 	= "_SUM_BLNC_ACNT_NM_";
        var strWhereClause 	= "AND ACNTL_CD LIKE '%" + replaceText0 + "%' AND ACNT_NM LIKE '%" + replaceText1 + "%' AND CO_CD = '" + gv_ma_selectedCorpCd + "'" ;
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목 정보 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FIM042'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["계정코드", 			"계정명"]
   			,searchInputFields		: ["SUM_BLNC_ACNT_CD", 	"SUM_BLNC_ACNT_NM"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["계정코드", 		"계정명"]
   			,tableColumnNames		: ["ACNTL_CD",	"ACNT_NM"]
   			,tableColumnWidths		: ["80px", 			"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('SUMACCOUNT_CODE', data.ACNTL_CD);
				SBUxMethod.set('SUMACCOUNT_NAME', data.ACNT_NM);
			},
    	});
  	}
    
    /**
     * 공통팝업
     * 자금수지항목
     */ 
    var fn_compopupTtrType = function() {
    	
        var searchCode 		= gfn_nvl(SBUxMethod.get("TTR_TYPE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("TTR_TYPE_NAME"));
        var replaceText0 	= "_TTR_TYPE_";
        var replaceText1 	= "_TTR_TYPE_NAME_";
        var strWhereClause 	= "AND A.CODE LIKE '%" + replaceText0 + "%' AND A.FAM_NM LIKE '%" + replaceText1 + "%' AND CO_CD = '" + gv_ma_selectedCorpCd + "'" ;
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자금수지항목 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FUND_CODE'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 		"명칭"]
   			,searchInputFields		: ["TTR_TYPE", 	"TTR_TYPE_NAME"]
   			,searchInputValues		: [searchCode, 	searchName]
    		,height					: '400px'
   			,tableHeader			: ["코드", 	"명칭", 		"GROUP1", "GROUP2", "GROUP3", "GROUP4"]
   			,tableColumnNames		: ["CODE",	"FAM_NM", 	"GROUP1", "GROUP2", "GROUP3", "GROUP4"]
   			,tableColumnWidths		: ["80px", 	"80px", 	"80px",   "80px",   "80px",   "80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('TTR_TYPE', 		data.CODE);
				SBUxMethod.set('TTR_TYPE_NAME',	data.FAM_NM);
			},
    	});
  	}
    
    /**
     * 공통팝업
     * 원가요소
     */ 
    var fn_compopupCostElement = function() {
    	
        var searchCode 		= gfn_nvl(SBUxMethod.get("COST_ELEMENT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("COST_ELEMENT_NAME"));
        var replaceText0 	= "_CST_ELMT_CD_";
        var replaceText1 	= "_CST_ELMT_NM_";
        var strWhereClause 	= "AND A.CODE LIKE '%" + replaceText0 + "%' AND A.FAM_NM LIKE '%" + replaceText1 + "%' AND A.CO_CD = '" + gv_ma_selectedCorpCd + "'" ;
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원가요소 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COST_ELEMENT'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 			"명칭"]
   			,searchInputFields		: ["CST_ELMT_CD", 	"CST_ELMT_NM"]
   			,searchInputValues		: [searchCode, 		searchName]
    		,height					: '400px'
   			,tableHeader			: ["코드", 	"명칭"]
   			,tableColumnNames		: ["CODE",	"FAM_NM"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('COST_ELEMENT_CODE', 	data.CODE);
				SBUxMethod.set('COST_ELEMENT_NAME',		data.FAM_NM);
			},
    	});
  	}
    
    /**
     * 공통팝업
     * 예산총괄부서
     */ 
     //
    var fn_compopupBudgetDept = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("BUDGET_DEPT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("BUDGET_DEPT_NAME"));
        var replaceText0 	= "_BGT_OVS_DEPT_CD_";
        var replaceText1 	= "_BGT_OVS_DEPT_NM_";
        var strWhereClause 	= "AND CODE LIKE '%" + replaceText0 + "%' AND NAME FAM_NM '%" + replaceText1 + "%' AND CO_CD = '" + gv_ma_selectedCorpCd + "'" ;
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 정보 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FI_DEPT'
        	,popupType				: 'A'
    		,whereClause			: ""
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["BGT_OVS_DEPT_CD", 	"BGT_OVS_DEPT_NM"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["부서코드", 	"부서명"]
   			,tableColumnNames		: ["DEPT_CD",	"DEPT_NM"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('BUDGET_DEPT_CODE', 		data.DEPT_CD);
				SBUxMethod.set('BUDGET_DEPT_NAME',		data.DEPT_NM);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
  	}
    
    /**
     * 공통팝업
     * 예산계정	
     */
   	var fn_compopupBudgetAcc = function() {
    	
        var searchCode 		= gfn_nvl(SBUxMethod.get("BUDGET_ACC_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("BUDGET_ACC_NAME"));
        var replaceText0 	= "_BGT_ACNTL_CD_";
        var replaceText1 	= "_BGT_ACNTL_NM_";
        var strWhereClause 	= "AND CLNT_CD = '" + gv_ma_selectedClntCd + "' AND CO_CD = '" + gv_ma_selectedCorpCd + "'" ;
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_BUDGET'
    		,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["ACNTL_CD", 		"ACNT_NM"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["코드",			"명칭", 				"구분", 				"원가구분"]
   			,tableColumnNames		: ["ACNTL_CD",		"ACNT_NM",			"EXTRA_COL1",  		"CST_CLSF"]
   			,tableColumnWidths		: ["100px", 		"100px", 			"100px", 			"100px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('BUDGET_ACC_CODE', data.ACNTL_CD);
				SBUxMethod.set('BUDGET_ACC_NAME', data.ACNT_NM);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
  	}
    
    /**
     * 공통팝업
     * 추가정보 공통팝업
     */
    var fn_compopupAcc = function(target) {
    	
        var searchCode 		= gfn_nvl(SBUxMethod.get(target));
        var searchName 		= gfn_nvl(SBUxMethod.get(target + "_NAME"));
        var replaceText0 	= "_" + target + "_";
        var replaceText1 	= "_" + target + "_NAME_";
        var strWhereClause 	= "AND A.ACNTL_CD LIKE '%" + replaceText0 + "%' AND A.ACNT_NM  LIKE '%" + replaceText1 + "%' AND A.CO_CD = '" + gv_ma_selectedCorpCd + "' AND A.CLNT_CD = '" + gv_ma_selectedClntCd +  "'";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["계정코드", 	"계정명"]
   			,searchInputFields		: [target, target + "_NAME"]
   			,searchInputValues		: [searchCode, 	searchName]
    		,height					: '400px'
   			,tableHeader			: ["계정코드", 		"계정명", 		"계정(한국어)"]
   			,tableColumnNames		: ["ACNTL_CD", 	 	"ACNT_NM", 		"ACNT_NM_CHN"]
   			,tableColumnWidths		: ["80px", 			"80px", 		"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set(target,			 data.ACNTL_CD);
				SBUxMethod.set(target + "_NAME", data.ACNT_NM);
			},
    	});
  	}
    
    /**
     * 공통팝업
     * 참조 1~10
     */
    var fn_compopupAccItemCode = function(target) {
    	
        var searchCode 		= gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE" + target));
        var searchName 		= gfn_nvl(SBUxMethod.get("ACC_ITEM_NAME" + target));
        var replaceText0 	= "_ACNT_MNG_ARTCL_CD_";
        var replaceText1 	= "_ACNT_MNG_ARTCL_NM_";
        var strWhereClause 	= "AND ACC_ITEM_VALUE LIKE '%" + replaceText0 + "%' AND ACC_VALUE_NAME  LIKE '%" + replaceText1 + "%' AND CO_CD = '" + gv_ma_selectedCorpCd + "'" ;
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FIM041'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["관리항목코드", 	"관리항목명"]
   			,searchInputFields		: ["ACNT_MNG_ARTCL_CD", "ACNT_MNG_ARTCL_NM"]
   			,searchInputValues		: [searchCode, 	searchName]
    		,height					: '400px'
   			,tableHeader			: ["관리항목", 		 "관리항목명", 		"데이터유형",	 "컨트롤유형"]
   			,tableColumnNames		: ["ACC_ITEM_VALUE", "ACC_VALUE_NAME", 	"DATA_TYPE", "CNTRL_TYPE"]
   			,tableColumnWidths		: ["80px", 			 "80px", 			"80px", 	 "80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('ACC_ITEM_CODE' + target, data.ACC_ITEM_VALUE);
				SBUxMethod.set('ACC_ITEM_NAME' + target, data.ACC_VALUE_NAME);
			},
    	});
  	}
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>