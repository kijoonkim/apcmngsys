<%
/**
 * @Class Name 		: Com3710.jsp
 * @Description 	: 프로젝트 정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.06.12
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.06.12   	천용진		최초 생성
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
	<title>title : 프로젝트 정보</title>
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
                <div style="margin-left: auto;">
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
                            <th scope="row" class="th_bg">프로젝트코드</th>
                            <td class="td_input" colspan="" style="border-right:hidden;">
                                <sbux-input id="SRCH_PROJECT_CODE_P" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">프로젝트명</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="SRCH_PROJECT_NAME_P" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>코드목록</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdCom3710" style="height:600px; width:100%;"></div>
                        </div>
                    </div>
	                <sbux-tabs id="idxTab_norm" name="tab_norm" uitype="normal"
						is-scrollable="false"
						title-target-id-array="tab1^tab2^tab3"
						title-text-array="기본정보^채번관리^관리항목">
					</sbux-tabs>
                    <div class="col-sm-6 tab-content">
						<div id="tab1">
                            <table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:25%">
                                    <col style="width:25%">
                                    <col style="width:25%">
                                    <col style="width:25%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">사업단위</th>
                                    <td class="td_input ">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
										    	type="button"
										    	id="FI_ORG_CODE" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=FI_ORG_CODE style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
                                    </td>
                                    <th scope="row" class="th_bg">프로젝트유형</th>
                                    <td class="td_input ">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
										    	type="button"
										    	id="PROJECT_TYPE" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=PROJECT_TYPE style="width:800px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div> 
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">프로젝트코드</th>
                                    <td class="td_input " >
                                        <sbux-input id="PROJECT_CODE" class="form-control input-sm inpt_data_reqed" uitype="text"  style="width:100%"></sbux-input>
                                    </td>
                                  	<th scope="row" class="th_bg">약칭</th>
                                    <td class="td_input">
                                        <sbux-input id="PROJECT_ABBR" class="form-control input-sm" uitype="text"  style="width:100%"></sbux-input>
                                    </td>									
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">프로젝트명</th>
                                    <td colspan="3" class="td_input ">
                                        <sbux-input id="PROJECT_NAME" class="form-control input-sm inpt_data_reqed" uitype="text"  style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">프로젝트명(한글)</th>
                                    <td colspan="3" class="td_input">
                                        <sbux-input id="PROJECT_NAME_CHN" class="form-control input-sm" uitype="text"  style="width:100%"></sbux-input>
                                    </td>
                                </tr>                       
                                <tr>
                                    <th scope="row" class="th_bg">카테고리</th>
									<td class="td_input " style="border-right: hidden;">
		   								<sbux-input uitype="text" id="PROJECT_CATEGORY" class="form-control input-sm inpt_data_reqed"></sbux-input>
									</td>
                                    <th scope="row" class="th_bg">상위여부</th>
									<td class="td_input" style="border-right: hidden;">
                            			<sbux-checkbox 
                            				id="PARENT_YN" 
                            				uitype="normal" 
                            				text="사용" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>

                                </tr>
                                <tr>
									<th scope="row" class="th_bg">상위코드</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="PARENT_CODE" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="PARENT_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupParent()"></sbux-button>
		                            </td>
                                </tr>
                                <tr>
									<th scope="row" class="th_bg">관리부서</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="DEPT_CODE" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="DEPT_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupDept()"></sbux-button>
		                            </td>
                                </tr>
                                <tr>
									<th scope="row" class="th_bg">원가중심점</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="COST_CENTER_CODE" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="COST_CENTER_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupCostCenter()"></sbux-button>
		                            </td>
                                </tr>
                                <tr>
									<th scope="row" class="th_bg">발생계정</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="ACCOUNT_CODE" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ACCOUNT_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccount('ACCOUNT')"></sbux-button>
		                            </td>
                                </tr>
                                <tr>
									<th scope="row" class="th_bg">건설중인자산계정</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="CIP_ACCOUNT_CODE" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="CIP_ACCOUNT_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccount('CIP_ACCOUNT')"></sbux-button>
		                            </td>
                                </tr>
                                <tr>
									<th scope="row" class="th_bg">본자산계정</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="ASSET_ACCOUNT_CODE" class="form-control input-sm" ></sbux-input>
									</td>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ASSET_ACCOUNT_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccount('ASSET_ACCOUNT')"></sbux-button>
		                            </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">사용여부</th>
									<td class="td_input" style="border-right: hidden;">
                            			<sbux-checkbox 
                            				id="USE_YN" 
                            				uitype="normal" 
                            				text="사용" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
									<th scope="row" class="th_bg">전표입력여부</th>
                                    <td class="td_input" >
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
                                    <th scope="row" class="th_bg">예산편성여부</th>
									<td class="td_input" style="border-right: hidden;">
                            			<sbux-checkbox 
                            				id="BUDGET_YN" 
                            				uitype="normal" 
                            				text="편성여부" 
                            				true-value="Y" 
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
									<th scope="row" class="th_bg">계정수준통제</th>
                                    <td class="td_input" >
                            			<sbux-checkbox 
                            				id="ACCT_LEVEL_YN"
                            				uitype="normal"
                            				text="편성여부"
                            				true-value="Y"
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">마감일자</th>
                                    <td class="td_input" >
										<sbux-datepicker id="DATE_CLOSED" name="DATE_CLOSED" uitype="popup"></sbux-datepicker>
                                    </td>
                                    <th scope="row" class="th_bg">정렬순서</th>
                                    <td class="td_input" >
		   								<sbux-input uitype="text" id="SORT_SEQ" class="form-control input-sm inpt_data_reqed" ></sbux-input>
                                    </td>
                                </tr>   
                                <tr>
                                    <th scope="row" class="th_bg">적    요</th>
									<td class="td_input" style="border-right: hidden;" colspan="3">
		   								<sbux-input uitype="text" id="DESCRIPTION" class="form-control input-sm" ></sbux-input>
									</td>	
                                </tr>                                                                                                                                                                                   
                            </table>
                        </div>
						<div id="tab2" style="height:500px;">
                            <table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:25%">
                                    <col style="width:75%">
                                </colgroup>
                                <tr id="codeSegTr1">
                                    <th id="codeSegTh1" scope="row" class="th_bg"></th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button"
										    	id="CODE_SEG01" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CODE_SEG01 style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
                                    </td>
                                </tr>             
                                <tr id="codeSegTr2">
                                    <th id="codeSegTh2" scope="row" class="th_bg"></th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button"
										    	id="CODE_SEG02" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CODE_SEG02 style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
                                    </td>
                                </tr>  			
                                <tr id="codeSegTr3">
                                    <th id="codeSegTh3"scope="row" class="th_bg"></th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button"
										    	id="CODE_SEG03" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CODE_SEG03 style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
                                    </td>
                                </tr>  		
                                <tr id="codeSegTr4">
                                    <th id="codeSegTh4" scope="row" class="th_bg"></th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button"
										    	id="CODE_SEG04" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CODE_SEG04 style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
                                    </td>
                                </tr>  																					                                                                                                                                                         
                                <tr id="codeSegTr5">
                                    <th id="codeSegTh5" scope="row" class="th_bg"></th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button"
										    	id="CODE_SEG05" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CODE_SEG05 style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
                                    </td>
                                </tr>  																					                                                                                                                                                         
                                <tr id="codeSegTr6">
                                    <th id="codeSegTh6" scope="row" class="th_bg"></th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button"
										    	id="CODE_SEG06" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CODE_SEG06 style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
                                    </td>
                                </tr>  																					                                                                                                                                                         
                                <tr id="codeSegTr7">
                                    <th id="codeSegTh7" scope="row" class="th_bg"></th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button"
										    	id="CODE_SEG07" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CODE_SEG07 style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
                                    </td>
                                </tr>  																					                                                                                                                                                         
                                <tr id="codeSegTr8">
                                    <th id="codeSegTh8" scope="row" class="th_bg"></th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button"
										    	id="CODE_SEG08" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CODE_SEG08 style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
                                    </td>
                                </tr>  																					                                                                                                                                                         
                                <tr id="codeSegTr9">
                                    <th id="codeSegTh9" scope="row" class="th_bg"></th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button"
										    	id="CODE_SEG09" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CODE_SEG09 style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
                                    </td>
                                </tr>  																					                                                                                                                                                         
                                <tr id="codeSegTr10">
                                    <th id="codeSegTh10" scope="row" class="th_bg"></th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button"
										    	id="CODE_SEG010" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CODE_SEG010 style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
                                    </td>
                                </tr>  																					                                                                                                                                                         
                            </table>
                        </div>                        
						<div id="tab3">
                            <table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:25%">
                                    <col style="width:25%">
                                    <col style="width:25%">
                                    <col style="width:25%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">관리항목1</th>
                                    <td class="td_input" colspan="3">
										<sbux-input uitype="text" id="ATTR1" class="form-control input-sm" ></sbux-input>
                                    </td>
                                </tr>             
                                <tr>
                                    <th scope="row" class="th_bg">관리항목2</th>
                                    <td class="td_input" colspan="3">
										<sbux-input uitype="text" id="ATTR2" class="form-control input-sm" ></sbux-input>
                                    </td>
                                </tr>      
                                <tr>
                                    <th scope="row" class="th_bg">관리항목3</th>
                                    <td class="td_input" colspan="3">
										<sbux-input uitype="text" id="ATTR3" class="form-control input-sm" ></sbux-input>
                                    </td>
                                </tr>   								    
                                <tr>
                                    <th scope="row" class="th_bg">관리항목4</th>
                                    <td class="td_input" colspan="3">
										<sbux-input uitype="text" id="ATTR4" class="form-control input-sm" ></sbux-input>
                                    </td>
                                </tr>   								   
                                <tr>
                                    <th scope="row" class="th_bg">관리항목5</th>
                                    <td class="td_input" colspan="3">
										<sbux-input uitype="text" id="ATTR5" class="form-control input-sm" ></sbux-input>
                                    </td>
                                </tr>   								    
                                <tr>
                                    <th scope="row" class="th_bg">관리항목6</th>
                                    <td class="td_input" colspan="3">
										<sbux-input uitype="text" id="ATTR6" class="form-control input-sm" ></sbux-input>
                                    </td>
                                </tr>   								    
                                <tr>
                                    <th scope="row" class="th_bg">관리항목7</th>
                                    <td class="td_input" colspan="3">
										<sbux-input uitype="text" id="ATTR7" class="form-control input-sm" ></sbux-input>
                                    </td>
                                </tr>   								   
                                <tr>
                                    <th scope="row" class="th_bg">관리항목8</th>
                                    <td class="td_input" colspan="3">
										<sbux-input uitype="text" id="ATTR8" class="form-control input-sm" ></sbux-input>
                                    </td>
                                </tr>   								   
                                <tr>
                                    <th scope="row" class="th_bg">관리항목9</th>
                                    <td class="td_input" colspan="3">
										<sbux-input uitype="text" id="ATTR9" class="form-control input-sm" ></sbux-input>
                                    </td>
                                </tr>   								   
                                <tr>
                                    <th scope="row" class="th_bg">관리항목10</th>
                                    <td class="td_input" colspan="3">
										<sbux-input uitype="text" id="ATTR10" class="form-control input-sm" ></sbux-input>
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
	var BizcomponentIdList = [];

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	$("#PROJECT_CODE" ).prop('readonly', true);
    	fn_getBizcomponent();
    	fn_initSBSelect();
    	cfn_search();
    });
    
	// 신규
	function cfn_add() {
		fn_clearForm();
		editType = 'N';
		$("#PROJECT_CODE" ).prop('readonly', false);
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
		editType = 'N';
		fn_createGrid();
		fn_clearForm();
		fn_search();
	}

    //grid 초기화
    var masterTreeGrid; 			// 그리드를 담기위한 객체 선언
    var jsonMasterTreeList 	= []; 	// 그리드의 참조 데이터 주소 선언
    var jsonGroupCode0		= []; 	// GroupCode0를 담기 위한 리스트 선언
    var jsonGroupCode1		= []; 	// GroupCode1를 담기 위한 리스트 선언
    var jsonGroupCode2		= []; 	// GroupCode2를 담기 위한 리스트 선언
    var jsonGroupCode3		= []; 	// GroupCode3를 담기 위한 리스트 선언
    var jsonGroupCode4		= []; 	// GroupCode4를 담기 위한 리스트 선언
    var jsonGroupCode5		= []; 	// GroupCode5를 담기 위한 리스트 선언
    var jsonGroupCode6		= []; 	// GroupCode6를 담기 위한 리스트 선언
    var jsonGroupCode7		= []; 	// GroupCode7를 담기 위한 리스트 선언
    var jsonGroupCode8		= []; 	// GroupCode8를 담기 위한 리스트 선언
    var jsonGroupCode9		= []; 	// GroupCode9를 담기 위한 리스트 선언

    function fn_createGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdCom3710';
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
            {caption : ["프로젝트코드"],	ref: 'PROJECT_CODE', 		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ["프로젝트명"],	ref: 'PROJECT_NAME', 		type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption : ["유형"],			ref: 'PROJECT_TYPE',		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ["카테고리"],		ref: 'PROJECT_CATEGORY',	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ["상위여부"],		ref: 'PARENT_YN',   		type:'checkbox',  	width:'100px',	  	style:'text-align:center', 
            	typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }
            },
            {caption : ["년도"], 		ref: 'CODE_SEG01', 			type:'combo',		width : '100px', 	style:'text-align:center', 
                typeinfo : {ref : 'jsonGroupCode0', label : 'label', value : 'value'}
            },
            {caption : ["부서"], 		ref: 'CODE_SEG02', 			type:'combo',		width : '100px', 	style:'text-align:center', 
                typeinfo : {ref : 'jsonGroupCode1', label : 'label', value : 'value'}
            },
            {caption : ["호기"], 		ref: 'CODE_SEG03', 			type:'combo',		width : '100px', 	style:'text-align:center', 
                typeinfo : {ref : 'jsonGroupCode2', label : 'label', value : 'value'}
            },
            {caption : ["용도"], 		ref: 'CODE_SEG04', 			type:'combo',		width : '200px', 	style:'text-align:center', 
                typeinfo : {ref : 'jsonGroupCode3', label : 'label', value : 'value'}
            }
        ];
        masterTreeGrid	= _SBGrid.create(SBGridProperties);
        masterTreeGrid.bind('click', 'fn_view');
    }
    
    /**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    var objMenuList = {
            "Add": {
                "name": "프로젝트 추가",			//컨텍스트메뉴에 표시될 이름
                "accesskey": "a",			//단축키
                "callback": fn_ctxtAddRow,	//콜백함수명
                "callbackparam": ['masterTreeGrid', true]// 콜백함수 파라미터 전달
            },
            "Delete": {
                "name": "프로젝트 삭제",
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
    	
    	let SRCH_PROJECT_CODE	= gfn_nvl(SBUxMethod.get("SRCH_PROJECT_CODE_P"));
    	let SRCH_PROJECT_NAME 	= gfn_nvl(SBUxMethod.get("SRCH_PROJECT_NAME_P"));
    	
    	var paramObj = {
    		    V_P_DEBUG_MODE_YN       : ''
	    	   ,V_P_LANG_ID             : ''
	    	   ,V_P_COMP_CODE           : gv_ma_selectedApcCd
	    	   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
	    	   ,V_P_FI_ORG_CODE         : ''
	    	   ,V_P_PROJECT_CODE        : SRCH_PROJECT_CODE
	    	   ,V_P_PROJECT_NAME        : SRCH_PROJECT_NAME
	    	   ,V_P_FORM_ID             : p_formId
	    	   ,V_P_MENU_ID             : p_menuId
	    	   ,V_P_PROC_ID             : ''
	    	   ,V_P_USERID              : p_userId
	    	   ,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3710.do", {
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
		    				LEVEL				: item.LVL,
		    				KEYID				: item.KEYID,
		    				PARENTKEYID			: item.PARENTKEYID,
		    				PROJECT_CODE		: item.PROJECT_CODE,
		    				PROJECT_NAME		: item.PROJECT_NAME,
		    				PROJECT_TYPE		: item.PROJECT_TYPE,
		    				PROJECT_CATEGORY	: item.PROJECT_CATEGORY,
		    				PROJECT_NAME_CHN	: item.PROJECT_NAME_CHN,
		    				FI_ORG_CODE			: item.FI_ORG_CODE,
		    				PARENT_YN			: item.PARENT_YN,
		    				PARENT_ACC			: item.PARENT_ACC,
		    				CODE_SEG01			: item.CODE_SEG01,
		    				CODE_SEG02			: item.CODE_SEG02,
		    				CODE_SEG03			: item.CODE_SEG03,
		    				CODE_SEG04			: item.CODE_SEG04,
		    				CODE_SEG05			: item.CODE_SEG05,
		    				CODE_SEG06			: item.CODE_SEG06,
		    				CODE_SEG07			: item.CODE_SEG07,
		    				CODE_SEG08			: item.CODE_SEG08,
		    				CODE_SEG09			: item.CODE_SEG09,
		    				CODE_SEG10			: item.CODE_SEG10,
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
    
    const fn_getBizcomponent = async function() {

    	var paramObj = {
    		    V_P_DEBUG_MODE_YN       : ''
	    	   ,V_P_LANG_ID             : ''
	    	   ,V_P_COMP_CODE           : gv_ma_selectedApcCd
	    	   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
	    	   ,V_P_FI_ORG_CODE         : ''
	    	   ,V_P_PROJECT_CODE        : ''
	    	   ,V_P_PROJECT_NAME        : ''
	    	   ,V_P_FORM_ID             : p_formId
	    	   ,V_P_MENU_ID             : p_menuId
	    	   ,V_P_PROC_ID             : ''
	    	   ,V_P_USERID              : p_userId
	    	   ,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3710.do", {
			getType				: 'json',
			workType			: 'NUMBER',
			cv_count			: '2',
			params				: gfnma_objectToString(paramObj)
		});
    	const data = await postJsonPromise;
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
					
					var num;
					var jsonGroupCodeName;
		    		for(var i = 0; data.cv_1.length > i; i++){
	    				num = i + 1;
						if(data.cv_1[i].USE_YN == 'N'){
		    				$('#codeSegTr'+num).css('display', 'none');
						}else{
		    				$('#codeSegTr'+num).css('display', '');
		    				$('#codeSegTh'+num).text(data.cv_1[i].GROUP_NAME);
		    				
							if( i == '0'){
			     				gfnma_setComSelect(['masterTreeGrid'], jsonGroupCode0, data.cv_1[i].BIZCOMPONENT_ID, '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
							}else if( i == '1'){
			     				gfnma_setComSelect(['masterTreeGrid'], jsonGroupCode1, data.cv_1[i].BIZCOMPONENT_ID, '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
							}else if( i == '2'){
			     				gfnma_setComSelect(['masterTreeGrid'], jsonGroupCode2, data.cv_1[i].BIZCOMPONENT_ID, '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
							}else if( i == '3'){
			     				gfnma_setComSelect(['masterTreeGrid'], jsonGroupCode3, data.cv_1[i].BIZCOMPONENT_ID, '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
							}else if( i == '4'){
			     				gfnma_setComSelect(['masterTreeGrid'], jsonGroupCode4, data.cv_1[i].BIZCOMPONENT_ID, '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
							}else if( i == '5'){
			     				gfnma_setComSelect(['masterTreeGrid'], jsonGroupCode5, data.cv_1[i].BIZCOMPONENT_ID, '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
							}else if( i == '6'){
			     				gfnma_setComSelect(['masterTreeGrid'], jsonGroupCode6, data.cv_1[i].BIZCOMPONENT_ID, '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
							}else if( i == '7'){
			     				gfnma_setComSelect(['masterTreeGrid'], jsonGroupCode7, data.cv_1[i].BIZCOMPONENT_ID, '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
							}else if( i == '8'){
			     				gfnma_setComSelect(['masterTreeGrid'], jsonGroupCode8, data.cv_1[i].BIZCOMPONENT_ID, '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
							}else if( i == '9'){
			     				gfnma_setComSelect(['masterTreeGrid'], jsonGroupCode9, data.cv_1[i].BIZCOMPONENT_ID, '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
							};

							let rst = await Promise.all([
								//채번관리 탭 항목 드랍다운 추가
								gfnma_multiSelectInit({
									target			: ['#'+data.cv_1[i].SEGMENT_FIELD_NAME.toUpperCase()]
									,compCode		: gv_ma_selectedApcCd
									,clientCode		: gv_ma_selectedClntCd
									,bizcompId		: data.cv_1[i].BIZCOMPONENT_ID
									,whereClause	: ''
									,formId			: p_formId
									,menuId			: p_menuId
									,selectValue	: ''
									,dropType		: 'down' 	// up, down
									,dropAlign		: 'left' 	// left, right
									,colValue		: 'SUB_CODE'
									,colLabel		: 'CODE_NAME'
									,columns		:[
										{caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
										{caption: "계정특성", 	ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
									]
								})
							]);
						}
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
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			
			//사업단위
			gfnma_multiSelectInit({
				target			: ['#FI_ORG_CODE']
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
		            {caption: "코드",	ref: 'FI_ORG_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명", 		ref: 'FI_ORG_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//프로젝트유형
			gfnma_multiSelectInit({
				target			: ['#PROJECT_TYPE']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM121'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",				ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
		            {caption: "코드명", 				ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
		            {caption: "발생계정", 			ref: 'ACCOUNT_CODE',    	width:'100px',  	style:'text-align:left'},
		            {caption: "발생계정명", 			ref: 'ACCOUNT_NAME',    	width:'100px',  	style:'text-align:left'},
		            {caption: "건설중인자산계정", 		ref: 'CIP_ACCOUNT_CODE',    width:'100px',  	style:'text-align:left'},
		            {caption: "건설중인자산계정명", 	ref: 'CIP_ACCOUNT_NAME',    width:'100px',  	style:'text-align:left'},
		            {caption: "자산계정", 			ref: 'ASSET_ACCOUNT_CODE',  width:'100px',  	style:'text-align:left'},
		            {caption: "자산계정명", 			ref: 'ASSET_ACCOUNT_NAME',  width:'100px',  	style:'text-align:left'}
				]
			}),
		]);
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
    	SBUxMethod.set("PROJECT_CODE", 	    	"");
    	SBUxMethod.set("PROJECT_CODE", 	    	"");
    	SBUxMethod.set("PROJECT_ABBR",		    "");
    	SBUxMethod.set("PROJECT_NAME", 			"");
    	SBUxMethod.set("PROJECT_NAME_CHN", 	    "");
    	SBUxMethod.set("PROJECT_CATEGORY", 		"");
    	SBUxMethod.set("PARENT_YN", 		    "N");
    	SBUxMethod.set("PARENT_CODE", 		    "");
    	SBUxMethod.set("PARENT_NAME", 		    "");
    	SBUxMethod.set("DEPT_CODE", 	    	"");
    	SBUxMethod.set("DEPT_NAME", 	   		"");
    	SBUxMethod.set("COST_CENTER_CODE", 		"");
    	SBUxMethod.set("COST_CENTER_NAME", 	    "");
    	SBUxMethod.set("ACCOUNT_CODE",	    	"");
    	SBUxMethod.set("ACCOUNT_NAME",   		"");
    	SBUxMethod.set("CIP_ACCOUNT_CODE",   	"");
    	SBUxMethod.set("CIP_ACCOUNT_NAME", 		"");
    	SBUxMethod.set("ASSET_ACCOUNT_CODE", 	"");
    	SBUxMethod.set("ASSET_ACCOUNT_NAME", 	"");
    	SBUxMethod.set("USE_YN", 				"N");
    	SBUxMethod.set("DOC_INPUT_YN", 			"N");
    	SBUxMethod.set("BUDGET_YN", 			"N");
    	SBUxMethod.set("ACCT_LEVEL_YN", 		"N");
    	SBUxMethod.set("DATE_CLOSED", 			"");
    	SBUxMethod.set("SORT_SEQ", 				"");
    	SBUxMethod.set("DESCRIPTION", 			"");
		gfnma_multiSelectSet('#FI_ORG_CODE', 	'', '', '');
		gfnma_multiSelectSet('#PROJECT_TYPE', 	'', '', '');
    	
    	// 채번관리
		gfnma_multiSelectSet('#CODE_SEG01', 	'', '', '');
		gfnma_multiSelectSet('#CODE_SEG02', 	'', '', '');
		gfnma_multiSelectSet('#CODE_SEG03', 	'', '', '');
		gfnma_multiSelectSet('#CODE_SEG04', 	'', '', '');
		gfnma_multiSelectSet('#CODE_SEG05', 	'', '', '');
		gfnma_multiSelectSet('#CODE_SEG06', 	'', '', '');
		gfnma_multiSelectSet('#CODE_SEG07', 	'', '', '');
		gfnma_multiSelectSet('#CODE_SEG08', 	'', '', '');
		gfnma_multiSelectSet('#CODE_SEG09', 	'', '', '');
		gfnma_multiSelectSet('#CODE_SEG10', 	'', '', '');

    	//관리항목
    	SBUxMethod.set("ATTR1", 				"");
    	SBUxMethod.set("ATTR2", 				"");
    	SBUxMethod.set("ATTR3", 				"");
    	SBUxMethod.set("ATTR4", 				"");
    	SBUxMethod.set("ATTR5", 				"");
    	SBUxMethod.set("ATTR6", 				"");
    	SBUxMethod.set("ATTR7", 				"");
    	SBUxMethod.set("ATTR8", 				"");
    	SBUxMethod.set("ATTR9", 				"");
    	SBUxMethod.set("ATTR10", 				"");
    }
    
    // 그리드 삭제
    const fn_delete = async function(){

  	    var paramObj = {
	    	   V_P_DEBUG_MODE_YN       : ""
    		   ,V_P_LANG_ID            : ""
    		   ,V_P_COMP_CODE          : gv_ma_selectedApcCd
    		   ,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
    		   ,IV_P_PROJECT_CODE      : gfn_nvl(SBUxMethod.get("PROJECT_CODE"))
    		   ,V_P_PROJECT_NAME       : gfn_nvl(SBUxMethod.get("PROJECT_NAME"))
    		   ,V_P_PROJECT_NAME_CHN   : gfn_nvl(SBUxMethod.get("PROJECT_NAME_CHN"))
    		   ,V_P_DESCRIPTION        : gfn_nvl(SBUxMethod.get("DESCRIPTION"))
    		   ,V_P_PROJECT_ABBR       : gfn_nvl(SBUxMethod.get("PROJECT_ABBR"))
    		   ,V_P_PROJECT_TYPE       : gfnma_multiSelectGet('#PROJECT_TYPE')
    		   ,V_P_PARENT_PROJECT     : gfn_nvl(SBUxMethod.get("PARENT_CODE"))
    		   ,V_P_PARENT_YN          : gfn_nvl(SBUxMethod.get("PARENT_YN").PARENT_YN)
    		   ,V_P_PROJECT_CATEGORY   : gfn_nvl(SBUxMethod.get("PROJECT_CATEGORY"))
    		   ,V_P_FI_ORG_CODE        : gfnma_multiSelectGet('#FI_ORG_CODE')
    		   ,V_P_DEPT_CODE          : gfn_nvl(SBUxMethod.get("DEPT_CODE"))
    		   ,V_P_COST_CENTER_CODE   : gfn_nvl(SBUxMethod.get("COST_CENTER_CODE"))
    		   ,V_P_ACCOUNT_CODE       : gfn_nvl(SBUxMethod.get("ACCOUNT_CODE"))
    		   ,V_P_DATE_CLOSED        : gfn_nvl(SBUxMethod.get("DATE_CLOSED"))
    		   ,V_P_USE_YN             : gfn_nvl(SBUxMethod.get("USE_YN").USE_YN)
    		   ,V_P_DOC_INPUT_YN       : gfn_nvl(SBUxMethod.get("DOC_INPUT_YN").DOC_INPUT_YN)
    		   ,V_P_BUDGET_YN          : gfn_nvl(SBUxMethod.get("BUDGET_YN").BUDGET_YN)
    		   ,V_P_ACCT_LEVEL_YN      : gfn_nvl(SBUxMethod.get("ACCT_LEVEL_YN").ACCT_LEVEL_YN)
    		   ,V_P_SORT_SEQ           : gfn_nvl(SBUxMethod.get("SORT_SEQ"))
    		   ,V_P_ATTR1              : gfn_nvl(SBUxMethod.get("ATTR1"))
    		   ,V_P_ATTR2              : gfn_nvl(SBUxMethod.get("ATTR2"))
    		   ,V_P_ATTR3              : gfn_nvl(SBUxMethod.get("ATTR3"))
    		   ,V_P_ATTR4              : gfn_nvl(SBUxMethod.get("ATTR4"))
    		   ,V_P_ATTR5              : gfn_nvl(SBUxMethod.get("ATTR5"))
    		   ,V_P_ATTR6              : gfn_nvl(SBUxMethod.get("ATTR6"))
    		   ,V_P_ATTR7              : gfn_nvl(SBUxMethod.get("ATTR7"))
    		   ,V_P_ATTR8              : gfn_nvl(SBUxMethod.get("ATTR8"))
    		   ,V_P_ATTR9              : gfn_nvl(SBUxMethod.get("ATTR9"))
    		   ,V_P_ATTR10             : gfn_nvl(SBUxMethod.get("ATTR10"))
    		   ,V_P_CODE_SEG01         : gfnma_multiSelectGet('#CODE_SEG01')
    		   ,V_P_CODE_SEG02         : gfnma_multiSelectGet("#CODE_SEG02")
    		   ,V_P_CODE_SEG03         : gfnma_multiSelectGet("#CODE_SEG03")
    		   ,V_P_CODE_SEG04         : gfnma_multiSelectGet("#CODE_SEG04")
    		   ,V_P_CODE_SEG05         : gfnma_multiSelectGet("#CODE_SEG05")
    		   ,V_P_CODE_SEG06         : gfnma_multiSelectGet("#CODE_SEG06")
    		   ,V_P_CODE_SEG07         : gfnma_multiSelectGet("#CODE_SEG07")
    		   ,V_P_CODE_SEG08         : gfnma_multiSelectGet("#CODE_SEG08")
    		   ,V_P_CODE_SEG09         : gfnma_multiSelectGet("#CODE_SEG09")
    		   ,V_P_CODE_SEG10         : gfnma_multiSelectGet("#CODE_SEG10")
    		   ,V_P_CIP_ACCOUNT_CODE   : gfn_nvl(SBUxMethod.get("CIP_ACCOUNT_CODE"))
    		   ,V_P_ASSET_ACCOUNT_CODE : gfn_nvl(SBUxMethod.get("ASSET_ACCOUNT_CODE"))
    		   ,V_P_FORM_ID            : p_formId
    		   ,V_P_MENU_ID            : p_menuId
    		   ,V_P_PROC_ID            : ""
    		   ,V_P_USERID             : p_userId
    		   ,V_P_PC                 : ""
 	    };	
        const postJsonPromise = gfn_postJSON("/co/sys/com/deleteCom3710.do", {
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

    	if(gfnma_multiSelectGet('#FI_ORG_CODE') == "") {
            gfn_comAlert("W0002", "사업단위");
            return;
    	}
    	if(gfnma_multiSelectGet('#PROJECT_TYPE') == "") {
            gfn_comAlert("W0002", "프로젝트유형");
            return;
    	}
    	if(gfn_nvl(SBUxMethod.get("PROJECT_NAME")) == "") {
            gfn_comAlert("W0002", "프로젝트명");
            return;
    	}
    	if(gfn_nvl(SBUxMethod.get("PROJECT_CATEGORY")) == "") {
            gfn_comAlert("W0002", "카테고리");
            return;
    	}
    	if(gfnma_multiSelectGet('#CODE_SEG01') == "" ||
    			gfnma_multiSelectGet('#CODE_SEG02') == ""||
    			gfnma_multiSelectGet('#CODE_SEG03') == ""||
    			gfnma_multiSelectGet('#CODE_SEG04') == ""){
            gfn_comAlert("W0002", "채번관리 탭 정보");
            return;
    	}
    	if(editType == "N"){
    		var valUrl = "/co/sys/com/insertCom3710.do";
    	}else{
    		var valUrl = "/co/sys/com/updateCom3710.do";
    	}
    	
  	    var paramObj = {
   	    	   V_P_DEBUG_MODE_YN       : ""
    		   ,V_P_LANG_ID            : ""
    		   ,V_P_COMP_CODE          : gv_ma_selectedApcCd
    		   ,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
    		   ,IV_P_PROJECT_CODE      : gfn_nvl(SBUxMethod.get("PROJECT_CODE"))
    		   ,V_P_PROJECT_NAME       : gfn_nvl(SBUxMethod.get("PROJECT_NAME"))
    		   ,V_P_PROJECT_NAME_CHN   : gfn_nvl(SBUxMethod.get("PROJECT_NAME_CHN"))
    		   ,V_P_DESCRIPTION        : gfn_nvl(SBUxMethod.get("DESCRIPTION"))
    		   ,V_P_PROJECT_ABBR       : gfn_nvl(SBUxMethod.get("PROJECT_ABBR"))
    		   ,V_P_PROJECT_TYPE       : gfnma_multiSelectGet('#PROJECT_TYPE')
    		   ,V_P_PARENT_PROJECT     : gfn_nvl(SBUxMethod.get("PARENT_CODE"))
    		   ,V_P_PARENT_YN          : gfn_nvl(SBUxMethod.get("PARENT_YN").PARENT_YN)
    		   ,V_P_PROJECT_CATEGORY   : gfn_nvl(SBUxMethod.get("PROJECT_CATEGORY"))
    		   ,V_P_FI_ORG_CODE        : gfnma_multiSelectGet('#FI_ORG_CODE')
    		   ,V_P_DEPT_CODE          : gfn_nvl(SBUxMethod.get("DEPT_CODE"))
    		   ,V_P_COST_CENTER_CODE   : gfn_nvl(SBUxMethod.get("COST_CENTER_CODE"))
    		   ,V_P_ACCOUNT_CODE       : gfn_nvl(SBUxMethod.get("ACCOUNT_CODE"))
    		   ,V_P_DATE_CLOSED        : gfn_nvl(SBUxMethod.get("DATE_CLOSED"))
    		   ,V_P_USE_YN             : gfn_nvl(SBUxMethod.get("USE_YN").USE_YN)
    		   ,V_P_DOC_INPUT_YN       : gfn_nvl(SBUxMethod.get("DOC_INPUT_YN").DOC_INPUT_YN)
    		   ,V_P_BUDGET_YN          : gfn_nvl(SBUxMethod.get("BUDGET_YN").BUDGET_YN)
    		   ,V_P_ACCT_LEVEL_YN      : gfn_nvl(SBUxMethod.get("ACCT_LEVEL_YN").ACCT_LEVEL_YN)
    		   ,V_P_SORT_SEQ           : gfn_nvl(SBUxMethod.get("SORT_SEQ"))
    		   ,V_P_ATTR1              : gfn_nvl(SBUxMethod.get("ATTR1"))
    		   ,V_P_ATTR2              : gfn_nvl(SBUxMethod.get("ATTR2"))
    		   ,V_P_ATTR3              : gfn_nvl(SBUxMethod.get("ATTR3"))
    		   ,V_P_ATTR4              : gfn_nvl(SBUxMethod.get("ATTR4"))
    		   ,V_P_ATTR5              : gfn_nvl(SBUxMethod.get("ATTR5"))
    		   ,V_P_ATTR6              : gfn_nvl(SBUxMethod.get("ATTR6"))
    		   ,V_P_ATTR7              : gfn_nvl(SBUxMethod.get("ATTR7"))
    		   ,V_P_ATTR8              : gfn_nvl(SBUxMethod.get("ATTR8"))
    		   ,V_P_ATTR9              : gfn_nvl(SBUxMethod.get("ATTR9"))
    		   ,V_P_ATTR10             : gfn_nvl(SBUxMethod.get("ATTR10"))
    		   ,V_P_CODE_SEG01         : gfnma_multiSelectGet('#CODE_SEG01')
    		   ,V_P_CODE_SEG02         : gfnma_multiSelectGet("#CODE_SEG02")
    		   ,V_P_CODE_SEG03         : gfnma_multiSelectGet("#CODE_SEG03")
    		   ,V_P_CODE_SEG04         : gfnma_multiSelectGet("#CODE_SEG04")
    		   ,V_P_CODE_SEG05         : gfnma_multiSelectGet("#CODE_SEG05")
    		   ,V_P_CODE_SEG06         : gfnma_multiSelectGet("#CODE_SEG06")
    		   ,V_P_CODE_SEG07         : gfnma_multiSelectGet("#CODE_SEG07")
    		   ,V_P_CODE_SEG08         : gfnma_multiSelectGet("#CODE_SEG08")
    		   ,V_P_CODE_SEG09         : gfnma_multiSelectGet("#CODE_SEG09")
    		   ,V_P_CODE_SEG10         : gfnma_multiSelectGet("#CODE_SEG10")
    		   ,V_P_CIP_ACCOUNT_CODE   : gfn_nvl(SBUxMethod.get("CIP_ACCOUNT_CODE"))
    		   ,V_P_ASSET_ACCOUNT_CODE : gfn_nvl(SBUxMethod.get("ASSET_ACCOUNT_CODE"))
    		   ,V_P_FORM_ID            : p_formId
    		   ,V_P_MENU_ID            : p_menuId
    		   ,V_P_PROC_ID            : ""
    		   ,V_P_USERID             : p_userId
    		   ,V_P_PC                 : ""
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
    	fn_viewSubGrid(rowData);
    }
    
    const fn_viewSubGrid = async function(obj) {

    	var paramObj = {
    		    V_P_DEBUG_MODE_YN       : ''
	    	   ,V_P_LANG_ID             : ''
	    	   ,V_P_COMP_CODE           : gv_ma_selectedApcCd
	    	   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
	    	   ,V_P_FI_ORG_CODE         : obj.FI_ORG_CODE
	    	   ,V_P_PROJECT_CODE        : obj.PROJECT_CODE
	    	   ,V_P_PROJECT_NAME        : ''
	    	   ,V_P_FORM_ID             : p_formId
	    	   ,V_P_MENU_ID             : p_menuId
	    	   ,V_P_PROC_ID             : ''
	    	   ,V_P_USERID              : p_userId
	    	   ,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3710.do", {
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
		   		SBUxMethod.set("PROJECT_TYPE", 		    	obj.PROJECT_TYPE);
		   		SBUxMethod.set("PROJECT_CODE", 			    obj.PROJECT_CODE);
		   		SBUxMethod.set("PROJECT_ABBR", 				obj.PROJECT_ABBR);
		   		SBUxMethod.set("PROJECT_NAME", 		   		obj.PROJECT_NAME);
		   		SBUxMethod.set("PROJECT_NAME_CHN", 			obj.PROJECT_NAME_CHN);
		   		SBUxMethod.set("PROJECT_CATEGORY", 			obj.PROJECT_CATEGORY);
		   		SBUxMethod.set("PARENT_YN", 			    obj.PARENT_YN);
		   		SBUxMethod.set("PARENT_CODE", 			    obj.PARENT_CODE);
		   		SBUxMethod.set("PARENT_NAME", 			    obj.PARENT_NAME);
		   		SBUxMethod.set("DEPT_CODE", 		    	obj.DEPT_CODE);
		   		SBUxMethod.set("DEPT_NAME", 		    	obj.DEPT_NAME);
		   		SBUxMethod.set("COST_CENTER_CODE", 		    obj.COST_CENTER_CODE);
		   		SBUxMethod.set("COST_CENTER_NAME", 		    obj.COST_CENTER_NAME);
		   		SBUxMethod.set("ACCOUNT_CODE", 				obj.ACCOUNT_CODE);
		   		SBUxMethod.set("ACCOUNT_NAME", 	   			obj.ACCOUNT_NAME);
		   		SBUxMethod.set("USE_YN", 	    			obj.USE_YN);
		   		SBUxMethod.set("DOC_INPUT_YN", 		    	obj.DOC_INPUT_YN);
		   		SBUxMethod.set("BUDGET_YN", 		    	obj.BUDGET_YN);
		   		SBUxMethod.set("ACCT_LEVEL_YN", 			obj.ACCT_LEVEL_YN);
		   		SBUxMethod.set("SORT_SEQ", 	    			obj.SORT_SEQ);
		   		SBUxMethod.set("PROJECT_NAME_CHN", 			obj.PROJECT_NAME_CHN);
		        gfnma_multiSelectSet('#FI_ORG_CODE', 		'FI_ORG_CODE', 'FI_ORG_NAME', obj.FI_ORG_CODE);
		        gfnma_multiSelectSet('#PROJECT_TYPE', 		'SUB_CODE', 'CODE_NAME', obj.PROJECT_TYPE);
	
		        // 회계관리
		        gfnma_multiSelectSet('#CODE_SEG01', 		'SUB_CODE', 'CODE_NAME', obj.CODE_SEG01);
		        gfnma_multiSelectSet('#CODE_SEG02', 	    'SUB_CODE', 'CODE_NAME', obj.CODE_SEG02);
		        gfnma_multiSelectSet('#CODE_SEG03', 	    'SUB_CODE', 'CODE_NAME', obj.CODE_SEG03);
		        gfnma_multiSelectSet('#CODE_SEG04', 	    'SUB_CODE', 'CODE_NAME', obj.CODE_SEG04);
		        
		        //관리항목
		   		SBUxMethod.set("ATTR1", 		    		obj.ATTR1);
		   		SBUxMethod.set("ATTR2", 		    		obj.ATTR2);
		   		SBUxMethod.set("ATTR3", 		    		obj.ATTR3);
		   		SBUxMethod.set("ATTR4", 			    	obj.ATTR4);
		   		SBUxMethod.set("ATTR5", 				    obj.ATTR5);
		   		SBUxMethod.set("ATTR6", 		    		obj.ATTR6);
		   		SBUxMethod.set("ATTR7", 			    	obj.ATTR7);
		   		SBUxMethod.set("ATTR8", 					obj.ATTR8);
		   		SBUxMethod.set("ATTR9", 					obj.ATTR9);
		   		SBUxMethod.set("ATTR10", 					obj.ATTR10);
		   		
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
     * 상위코드
     */
    var fn_compopupParent = function() {
    	
        var searchCode 		= gfn_nvl(SBUxMethod.get("PARENT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("PARENT_NAME"));
        var replaceText0 	= "_PARENT_CODE_";
        var replaceText1 	= "_PARENT_NAME_";
        var strWhereClause 	= "AND A.PROJECT_CODE  LIKE '%" + replaceText0 + "%' AND A.PROJECT_NAME  LIKE '%" + replaceText1 + "%'";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '상위코드 조회');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_PROJECT_PARENT'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["계정코드", 		"계정명"]
   			,searchInputFields		: ["PARENT_CODE", 	"PARENT_NAME"]
   			,searchInputValues		: [searchCode, 	searchName]
    		,height					: '400px'
   			,tableHeader			: ["코드", 			"명", 			"년도", 		  "부서", 		"호기", 		  "용도"]
   			,tableColumnNames		: ["PROJECT_CODE",	"PROJECT_NAME", "CODE_SEG01", "CODE_SEG02", "CODE_SEG03", "CODE_SEG04"]
   			,tableColumnWidths		: ["80px", 			"480px", 		"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('PARENT_CODE', data.PROJECT_CODE);
				SBUxMethod.set('PARENT_NAME', data.PROJECT_NAME);
			},
    	});
  	}
    
    /**
     * 공통팝업
     * 관리부서
     */
    var fn_compopupDept = function() {
    	
        var searchCode 		= gfn_nvl(SBUxMethod.get("DEPT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("DEPT_NAME"));
        var replaceText0 	= "_DEPT_CODE_";
        var replaceText1 	= "_DEPT_NAME_";
        var strWhereClause 	= "AND CODE LIKE '%" + replaceText0 + "%' AND NAME LIKE '%" + replaceText1 + "%'";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '관리부서 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FI_DEPT'
        	,popupType				: 'A'
    		,whereClause			: ""
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["부서코드", 	"부서명"]
   			,tableColumnNames		: ["DEPT_CODE",	"DEPT_NAME"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('DEPT_CODE', 	data.DEPT_CODE);
				SBUxMethod.set('DEPT_NAME',		data.DEPT_NAME);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
  	}
    
    /**
     * 공통팝업
     * 원가중심점
     */
    var fn_compopupCostCenter = function() {
    	
        var searchCode 		= gfn_nvl(SBUxMethod.get("COST_CENTER_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("COST_CENTER_NAME"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND A.COST_CENTER_CODE  LIKE '%" + replaceText0 + "%' AND A.COST_CENTER_NAME  LIKE '%" + replaceText1 + "%'";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_CC_INPUT'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["계정코드", 			"계정명"]
   			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["코드", 				"명칭", 				"부서코드", 		"부서명", 			"원가유형", 		"사업장", 		"여신영역"]
   			,tableColumnNames		: ["COST_CENTER_CODE",	"COST_CENTER_NAME",	"DEPT_CODE",	"COST_CENTER_NAME",	"COST_CLASS",	"SITE_CODE",	"CREDIT_AREA"]
   			,tableColumnWidths		: ["80px", 				"80px", 			"80px", 		"80px", 			"80px", 		"80px", 		"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('COST_CENTER_CODE', data.COST_CENTER_CODE);
				SBUxMethod.set('COST_CENTER_NAME', data.COST_CENTER_NAME);
			},
    	});
  	}
    
    /**
     * 공통팝업
     * 발생계정, 건설중인자산계정, 본자산계정 팝업
     */ 
    var fn_compopupAccount = function(target) {
    	
        var searchCode 		= gfn_nvl(SBUxMethod.get(target + "_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get(target + "_NAME"));
        var replaceText0 	= "_" + target + "_CODE_";
        var replaceText1 	= "_" + target + "_NAME_";        
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + searchCode + "%' AND ACCOUNT_NAME LIKE '%" + searchName + "%'";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정 정보 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,searchInputValues		: [searchCode, 	searchName]
    		,height					: '400px'
   			,tableHeader			: ["코드", 			"계정명"]
   			,tableColumnNames		: ["ACCOUNT_CODE",	"ACCOUNT_NAME"]
   			,tableColumnWidths		: ["80px", 		"100px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set(target + "_CODE", 	data.ACCOUNT_CODE);
				SBUxMethod.set(target + "_NAME",	data.ACCOUNT_NAME);
			},
    	});
  	}
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>