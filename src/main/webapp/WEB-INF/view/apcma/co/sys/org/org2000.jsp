<%
/**
 * @Class Name 		: Org2000.jsp
 * @Description 	: 부서 정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.08.05
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.08.05   	천용진		최초 생성
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
	<title>title : 부서 정보</title>
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
	                            <th scope="row" class="th_bg_search">부서코드</th>
	                            <td class="td_input" colspan="3" style="border-right:hidden;">
	                                <sbux-input id="SRCH_DEPT_CODE" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                            <th scope="row" class="th_bg_search">부서명</th>
	                            <td class="td_input" colspan="3" style="border-right: hidden;">
	                                <sbux-input id="SRCH_DEPT_NAME" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                            <th scope="row" class="th_bg_search">기준일</th>
	                            <td class="td_input"  style="border-right: hidden;">
	                                <sbux-datepicker id="SRCH_BASE_DATE" name="SRCH_BASE_DATE" uitype="popup" datepicker-mode="day" style="height: 3.6vh;width:100%;" class="table-datepicker-ma" date-format="yyyy-mm-dd"></sbux-datepicker>
	                            </td>
	                            <td colspan="3"></td>
	                        </tr>
	                    </tbody>
	                </table>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>부서 리스트</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdOrg2000" style="height:100vh; width:100%;"></div>
                        </div>
                    </div>
	                <sbux-tabs id="idxTab_norm" name="tab_norm" uitype="normal"
						is-scrollable="false"
						title-target-id-array="INFO^MNG"
						title-text-array="기본정보^관리항목">
					</sbux-tabs>
                    <div class="col-sm-6 tab-content">
                        <div id="INFO" style="height:95vh;">
                            <table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:20%">
                                    <col style="width:20%">
                                    <col style="width:20%">
                                    <col style="width:20%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">사업장</th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
										    	type="button"
										    	id="SITE_CODE" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=SITE_CODE style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>                                      
                                    </td>
                                    <th scope="row" class="th_bg">정렬순서</th>
                                    <td class="td_input" colspan="2">
                                        <sbux-input id="SORT_SEQ" class="form-control input-sm inpt_data_reqed"  uitype="text"  style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">부서코드</th>
                                    <td class="td_input" >
                                        <sbux-input id="DEPT_CODE" class="form-control input-sm" uitype="text"  style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">부서명</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="DEPT_NAME" class="form-control input-sm inpt_data_reqed"  uitype="text"  style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">약칭</th>
                                    <td class="td_input">
                                        <sbux-input id="DEPT_ABBR_NAME" class="form-control input-sm" uitype="text"  style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">부서명(영문)</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="DEPT_NAME_ENG" class="form-control input-sm"  uitype="text"  style="width:100%"></sbux-input>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">부서명(한문)</th>
                                    <td colspan="4" class="td_input">
                                        <sbux-input id="DEPT_NAME_FOR" class="form-control input-sm"  uitype="text"  style="width:100%"></sbux-input>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">상위부서</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="PARENT_DEPT" class="form-control input-sm" readonly></sbux-input>
									</td>
									<td colspan="2"  class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="PARENT_DEPT_NAME" class="form-control input-sm" readonly></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button id="BTN_PARENT" class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupParent" ></sbux-button>
		                            </td>
                                </tr>                                
                                <tr>
                                    <th scope="row" class="th_bg">부서장</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="DEPT_LEADER" class="form-control input-sm" ></sbux-input>
									</td>
									<td colspan="2"  class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="DEPT_LEADER_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupDeptLeader" ></sbux-button>
		                            </td>
                                </tr>                                
                                <tr>
                                    <th scope="row" class="th_bg">부서구분</th>
									<td class="td_input" style="border-right: hidden;">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
										    	type="button"
										    	id="DEPT_CATEGORY" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=DEPT_CATEGORY style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>  
									</td>
                                    <th scope="row" class="th_bg">인건비분류</th>
									<td class="td_input" style="border-right: hidden;" colspan="2">
										<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left"
										    	class="btn btn-sm btn-light dropdown-toggle"
										    	type="button"
										    	id="LABOR_COST_GROUP" 
										    	data-toggle="dropdown"
										    	aria-haspopup="true"
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=LABOR_COST_GROUP style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>
									</td>
                                </tr>
                                <tr style="vertical-align:middle; text-align:right; height:3rem;">
                                    <td class="td_input" style="border-right: hidden;">
                                    	<sbux-checkbox uitype="normal" id="SALES_DEPT_YN" class="form-control input-sm check" text="영업부서" true-value="Y" false-value="N"/>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                    	<sbux-checkbox uitype="normal" id="MARKETING_DEPT_YN" class="form-control input-sm check" text="마케팅부서" true-value="Y" false-value="N"/>
                                    </td>
                                    <td class="td_input" style="border-right: hidden;">
                                    	<sbux-checkbox uitype="normal" id="PRODUCTION_DEPT_YN" class="form-control input-sm check" text="생산팀" true-value="Y" false-value="N"/>
                                    </td>
                                    <td class="td_input"style="border-right: hidden;">
                                    	<sbux-checkbox uitype="normal" id="FINANCE_DEPT_YN" class="form-control input-sm check" text="재무부서" true-value="Y" false-value="N"/>
                                    </td>
                                    <td class="td_input"style="border-right: hidden;"></td>
                                </tr>
                                <tr>    
                                    <th scope="row" class="th_bg">원가조직</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="CC_CODE" class="form-control input-sm" ></sbux-input>
									</td>
									<td colspan="2"  class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="CC_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupCcCode" ></sbux-button>
		                            </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">적용시작일</th>
                                    <td class="td_input ">
                                		<sbux-datepicker id="START_DATE" name="START_DATE" uitype="popup" datepicker-mode="day" style="height: 3.6vh;width:100%;" date-format="yyyy-mm-dd"></sbux-datepicker>
									</td>
                                    <th scope="row" class="th_bg">적용종료일</th>
                                    <td class="td_input" style="border-right: hidden;">
                               			<sbux-datepicker id="END_DATE" name="END_DATE" uitype="popup" datepicker-mode="day" style="height: 3.6vh;width:100%;" date-format="yyyy-mm-dd"></sbux-datepicker>
									</td>
									<td class="td_input" style="border-right: hidden;"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">우편번호</th>
                                    <td class="td_input">
                                    	<sbux-input uitype="text" id="ZIP_CODE" class="form-control input-sm" ></sbux-input>
                                    </td>
                                    <td class="td_input" colspan="3">
                                    </td>
                                </tr>   
                                <tr>
                                    <th scope="row" class="th_bg">주소</th>
                                    <td class="td_input" colspan="4">
                                    	<sbux-input uitype="text" id="ADDRESS" class="form-control input-sm" ></sbux-input>
                                    </td>
                                </tr>      
                                <tr>
                                    <th scope="row" class="th_bg">정원</th>
                                    <td class="td_input">
                                    	<sbux-input uitype="text" id="FIXED_NUMBER" class="form-control input-sm" ></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">근무패턴</th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button"
										    	id="WORK_PATTERN_CODE" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=WORK_PATTERN_CODE style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>                                     
                                    </td>
                                    <td class="td_input" style="text-align:center;">
                                    	<sbux-checkbox uitype="normal" id="WORK_TIME_YN" class="form-control input-sm check" text="근태실적관리" true-value="Y" false-value="N"/>
									</td>
                                </tr>         
                                <tr>
                                    <th scope="row" class="th_bg">비고</th>
									<td class="td_input" style="border-right: hidden;" colspan="4">
										<sbux-textarea id="MEMO" name="MEMO" uitype="normal" style="width:100%;"></sbux-textarea>									
	   								</td>
                                </tr>  
                            </table>
                        </div>
                        <div id="MNG" style="height:95vh;">
                            <table id="dataArea2" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:20%">
                                    <col style="width:30%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">부서구분</th>
									<td class="td_input" style="border-right: hidden;">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button"
										    	id="ATTR1" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=ATTR1 style="width:250px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>   									
									</td>
									<th scope="row" class="th_bg">관리항목6</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ATTR6" class="form-control input-sm" ></sbux-input>									
									</td>
                                </tr>    
								<tr>
									<th scope="row" class="th_bg">관리항목2</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ATTR2" class="form-control input-sm" ></sbux-input>									
									</td>								
									<th scope="row" class="th_bg">관리항목7</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ATTR7" class="form-control input-sm" ></sbux-input>									
									</td>								
                                </tr>      
                                <tr>
									<th scope="row" class="th_bg">관리항목3</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ATTR3" class="form-control input-sm" ></sbux-input>									
									</td>								
									<th scope="row" class="th_bg">총원가사업장배부</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ATTR8" class="form-control input-sm" ></sbux-input>									
									</td>	
                                </tr>
                                <tr>
									<th scope="row" class="th_bg">관리항목4</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ATTR4" class="form-control input-sm" ></sbux-input>									
									</td>								
									<th scope="row" class="th_bg">관리항목9</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ATTR9" class="form-control input-sm" ></sbux-input>									
									</td>	                                
                                </tr>
                                <tr>
									<th scope="row" class="th_bg">관리항목5</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="ATTR5" class="form-control input-sm" ></sbux-input>									
									</td>								
									<th scope="row" class="th_bg">관리항목10</th>
									<td class="td_input" style="border-right: hidden;">
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
	var jsonEmpState = []; // 재직구분
	const fn_initSBSelect = async function() {
		
		let rst = await Promise.all([
			
			SBUxMethod.set('SRCH_BASE_DATE', gfn_dateToYmd(new Date())),
			
			SBUxMethod.attr('BTN_PARENT', 'disabled', 'true'),
			//재직구분
		    gfnma_setComSelect([''], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		    
			//사업장코드
			gfnma_multiSelectInit({
				target			: ['#SITE_CODE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_ORG001'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SITE_CODE'
				,colLabel		: 'SITE_NAME'
				,columns		:[
		            {caption: "사업장코드",		ref: 'SITE_CODE', 			width:'100px',  	style:'text-align:left'},
		            {caption: "사업장명", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//부서구분
			gfnma_multiSelectInit({
				target			: ['#DEPT_CATEGORY']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_ORG010'
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
		            {caption: "부서구분", 	ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//인건비분류
			gfnma_multiSelectInit({
				target			: ['#LABOR_COST_GROUP']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_HRI007'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "인건비분류코드",	ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
		            {caption: "인건비분류", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//근무패턴
			gfnma_multiSelectInit({
				target			: ['#WORK_PATTERN_CODE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_HRT020'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'up' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
		            {caption: "근무패턴",	 	ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//부서구분
			gfnma_multiSelectInit({
				target			: ['#ATTR1']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_ORG009'
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
		            {caption: "부서구분",	 	ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
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
	        fn_save();
		}
    }
	
	// 마스터 그리드 삭제
	function cfn_del() {
	}
 
	// 조회
	function cfn_search() {
		fn_search();
	}

    //grid 초기화
    var masterTreeGrid; 					// 그리드를 담기위한 객체 선언
    var jsonMasterTreeList		= []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdOrg2000';
	    SBGridProperties.id 				= 'masterTreeGrid';
	    SBGridProperties.jsonref 			= 'jsonMasterTreeList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.tree = {
	            col: 1,
	            levelref: "LEVEL",
	            open: true,
	            lock: true
        };
        SBGridProperties.columns = [
            {caption : ["부서명"],			ref: 'DEPT_NAME', 		type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption : ["부서코드"],			ref: 'DEPT_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ["사업장"],			ref: 'SITE_NAME',		type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption : ["정렬순서"],			ref: 'SORT_SEQ',		type:'output',  	width:'200px',  	style:'text-align:right'},
            {caption : ['적용시작일'],     	ref: 'START_DATE',      type:'datepicker' ,   
            	typeinfo : {dateformat :"yyyy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'
            },
            {caption : ['적용종료일'],     	ref: 'END_DATE',      type:'datepicker' ,   
            	typeinfo : {dateformat :"yyyy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'
            }
        ];
        masterTreeGrid	= _SBGrid.create(SBGridProperties);
        masterTreeGrid.bind('click', 'fn_viewSubTable');
    }
    /**
     * 코드목록 조회
     */
    const fn_search = async function() {

    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	
    	let SRCH_DEPT_CODE	= gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
    	let SRCH_DEPT_NAME 	= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));
    	let SRCH_BASE_DATE 	= gfn_nvl(SBUxMethod.get("SRCH_BASE_DATE"));
    	
    	var paramObj = {
    			   V_P_DEBUG_MODE_YN       : ''
    			  ,V_P_LANG_ID             : ''
   				  ,V_P_COMP_CODE           : gv_ma_selectedCorpCd
   				  ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
   				  ,V_P_SITE_CODE           : ''
   				  ,V_P_DEPT_CODE           : SRCH_DEPT_CODE
   				  ,V_P_DEPT_NAME           : SRCH_DEPT_NAME
   				  ,V_P_BASE_DATE           : SRCH_BASE_DATE
   				  ,V_P_FORM_ID             : p_formId
   				  ,V_P_MENU_ID             : p_menuId
   				  ,V_P_PROC_ID             : ''
   				  ,V_P_USERID              : p_userId
   				  ,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg2000.do", {
			getType				: 'json',
			workType			: 'Q1',
			cv_count			: '1',
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
		    				LEVEL				: gfn_nvl(item.LVL),
		    				KEYID				: gfn_nvl(item.KEYID),
		    				PARENTKEYID			: gfn_nvl(item.PARENTKEYID),
		    				DEPT_CODE			: gfn_nvl(item.DEPT_CODE),
		    				DEPT_NAME			: gfn_nvl(item.DEPT_NAME),
		    				DEPT_ABBR_NAME		: gfn_nvl(item.DEPT_ABBR_NAME),
		    				SITE_CODE			: gfn_nvl(item.SITE_CODE),
		    				SITE_NAME			: gfn_nvl(item.SITE_NAME),
		    				DEPT_NAME_ENG		: gfn_nvl(item.DEPT_NAME_ENG),
		    				DEPT_NAME_FOR		: gfn_nvl(item.DEPT_NAME_FOR),
		    				PARENT_DEPT			: gfn_nvl(item.PARENT_DEPT),
		    				PARENT_DEPT_NAME	: gfn_nvl(item.PARENT_DEPT_NAME),
		    				DEPT_LEADER			: gfn_nvl(item.DEPT_LEADER),
		    				DEPT_LEADER_NAME	: gfn_nvl(item.DEPT_LEADER_NAME),
		    				DEPT_CATEGORY		: gfn_nvl(item.DEPT_CATEGORY),
		    				LABOR_COST_GROUP	: gfn_nvl(item.LABOR_COST_GROUP),
		    				FINANCE_DEPT_YN		: gfn_nvl(item.FINANCE_DEPT_YN),
		    				SALES_DEPT_YN		: gfn_nvl(item.SALES_DEPT_YN),
		    				MARKETING_DEPT_YN	: gfn_nvl(item.MARKETING_DEPT_YN),
		    				PRODUCTION_DEPT_YN	: gfn_nvl(item.PRODUCTION_DEPT_YN),
		    				CC_CODE				: gfn_nvl(item.CC_CODE),
		    				CC_NAME				: gfn_nvl(item.CC_NAME),
		    				START_DATE			: gfn_nvl(item.START_DATE.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3")),
		    				END_DATE			: gfn_nvl(item.END_DATE.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3")),
		    				ZIP_CODE			: gfn_nvl(item.ZIP_CODE),
		    				ADDRESS				: gfn_nvl(item.ADDRESS),
		    				FIXED_NUMBER		: gfn_nvl(item.FIXED_NUMBER),
		    				MEMO				: gfn_nvl(item.MEMO),
		    				SORT_SEQ			: gfn_nvl(item.SORT_SEQ),
		    				WORK_TIME_YN		: gfn_nvl(item.WORK_TIME_YN),
		    				WORK_PATTERN_CODE	: gfn_nvl(item.WORK_PATTERN_CODE),
		    				ATTR1				: gfn_nvl(item.ATTR1),
		    				ATTR2				: gfn_nvl(item.ATTR2),
		    				ATTR3				: gfn_nvl(item.ATTR3),
		    				ATTR4				: gfn_nvl(item.ATTR4),
		    				ATTR5				: gfn_nvl(item.ATTR5),
		    				ATTR6				: gfn_nvl(item.ATTR6),
		    				ATTR7				: gfn_nvl(item.ATTR7),
		    				ATTR8				: gfn_nvl(item.ATTR8),
		    				ATTR9				: gfn_nvl(item.ATTR9),
		    				ATTR10				: gfn_nvl(item.ATTR10)
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
		
    	//코드목록 
    	jsonMasterTreeList = [];
    	
    	//기본정보
		SBUxMethod.set("DEPT_CODE"			, "");
		SBUxMethod.set("DEPT_NAME"			, "");
		SBUxMethod.set("DEPT_ABBR_NAME"		, "");
		SBUxMethod.set("SITE_CODE"			, "");
		SBUxMethod.set("SITE_NAME"			, "");
		SBUxMethod.set("DEPT_NAME_ENG"		, "");
		SBUxMethod.set("DEPT_NAME_FOR"		, "");
		SBUxMethod.set("PARENT_DEPT"		, "");
		SBUxMethod.set("PARENT_DEPT_NAME"	, "");
		SBUxMethod.set("DEPT_LEADER"		, "");
		SBUxMethod.set("DEPT_LEADER_NAME"	, "");
		SBUxMethod.set("DEPT_CATEGORY"		, "");
		SBUxMethod.set("LABOR_COST_GROUP"	, "");
		SBUxMethod.set("FINANCE_DEPT_YN"	, "N");
		SBUxMethod.set("SALES_DEPT_YN"		, "N");
		SBUxMethod.set("MARKETING_DEPT_YN"	, "N");
		SBUxMethod.set("PRODUCTION_DEPT_YN"	, "N");
		SBUxMethod.set("CC_CODE"			, "");
		SBUxMethod.set("CC_NAME"			, "");
		SBUxMethod.set("START_DATE"			, "");
		SBUxMethod.set("END_DATE"			, "");
		SBUxMethod.set("ZIP_CODE"			, "");
		SBUxMethod.set("ADDRESS"			, "");
		SBUxMethod.set("FIXED_NUMBER"		, "");
		SBUxMethod.set("MEMO"				, "");
		SBUxMethod.set("SORT_SEQ"			, "");
		SBUxMethod.set("WORK_TIME_YN"		, "N");
		SBUxMethod.set("ATTR2"				, "");
		SBUxMethod.set("ATTR3"				, "");
		SBUxMethod.set("ATTR4"				, "");
		SBUxMethod.set("ATTR5"				, "");
		SBUxMethod.set("ATTR6"				, "");
		SBUxMethod.set("ATTR7"				, "");
		SBUxMethod.set("ATTR8"				, "");
		SBUxMethod.set("ATTR9"				, "");
		SBUxMethod.set("ATTR10"				, "");
    	gfnma_multiSelectSet('#SITE_CODE', 			'SITE_CODE', 	'SITE_NAME', '');
    	gfnma_multiSelectSet('#DEPT_CATEGORY', 		'SUB_CODE', 	'CODE_NAME', '');
    	gfnma_multiSelectSet('#LABOR_COST_GROUP', 	'SUB_CODE', 	'CODE_NAME', '');
    	gfnma_multiSelectSet('#WORK_PATTERN_CODE', 	'SUB_CODE', 	'CODE_NAME', '');
    	gfnma_multiSelectSet('#ATTR1', 				'SUB_CODE', 	'CODE_NAME', '');
    }
    
    // 그리드 삭제

    //그룹코드 내역 저장
    const fn_save = async function() {

    	if(gfnma_multiSelectGet("#SITE_CODE") == "") {
            gfn_comAlert("W0002", "사업장	");
            return;
    	}
    	if(gfnma_multiSelectGet("#DEPT_CATEGORY") == "") {
            gfn_comAlert("W0002", "부서구분");
            return;
    	}
    	if(gfn_nvl(SBUxMethod.get("SORT_SEQ")) == "") {
            gfn_comAlert("W0002", "정렬순서");
            return;
    	}
    	if(gfn_nvl(SBUxMethod.get("DEPT_NAME")) == "") {
            gfn_comAlert("W0002", "부서명");
            return;
    	}
    	
  	    var paramObj = {
  	    		 V_P_DEBUG_MODE_YN       : ''
    			,V_P_LANG_ID             : ''
    			,V_P_COMP_CODE           : gv_ma_selectedCorpCd
    			,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
    			,V_P_DEPT_CODE           : gfn_nvl(SBUxMethod.get("DEPT_CODE"))
    			,V_P_DEPT_NAME           : gfn_nvl(SBUxMethod.get("DEPT_NAME"))
    			,V_P_DEPT_NAME_ENG       : gfn_nvl(SBUxMethod.get("DEPT_NAME_ENG"))
    			,V_P_DEPT_NAME_FOR       : gfn_nvl(SBUxMethod.get("DEPT_NAME_FOR"))
    			,V_P_DEPT_ABBR_NAME      : gfn_nvl(SBUxMethod.get("DEPT_ABBR_NAME"))
    			,V_P_SITE_CODE           : gfnma_multiSelectGet('#SITE_CODE')
    			,V_P_PARENT_DEPT         : gfn_nvl(SBUxMethod.get("PARENT_DEPT"))
    			,V_P_DEPT_LEADER         : gfn_nvl(SBUxMethod.get("DEPT_LEADER"))
    			,V_P_DEPT_CATEGORY       : gfnma_multiSelectGet('#DEPT_CATEGORY')
    			,V_P_LABOR_COST_GROUP    : gfn_nvl(SBUxMethod.get("LABOR_COST_GROUP"))
    			,V_P_SALES_DEPT_YN       : gfn_nvl(SBUxMethod.get("SALES_DEPT_YN").SALES_DEPT_YN)
    			,V_P_MARKETING_DEPT_YN   : gfn_nvl(SBUxMethod.get("MARKETING_DEPT_YN").MARKETING_DEPT_YN)
    			,V_P_PRODUCTION_DEPT_YN  : gfn_nvl(SBUxMethod.get("PRODUCTION_DEPT_YN").PRODUCTION_DEPT_YN)
    			,V_P_FINANCE_DEPT_YN     : gfn_nvl(SBUxMethod.get("FINANCE_DEPT_YN").FINANCE_DEPT_YN)
    			,V_P_CC_CODE             : gfnma_multiSelectGet('#CC_CODE')
    			,V_P_START_DATE          : gfn_nvl(SBUxMethod.get("START_DATE"))
    			,V_P_END_DATE            : gfn_nvl(SBUxMethod.get("END_DATE"))
    			,V_P_ZIP_CODE            : gfn_nvl(SBUxMethod.get("ZIP_CODE"))
    			,V_P_ADDRESS             : gfn_nvl(SBUxMethod.get("ADDRESS"))
    			,V_P_FIXED_NUMBER        : gfn_nvl(SBUxMethod.get("FIXED_NUMBER"))
    			,V_P_MEMO                : gfn_nvl(SBUxMethod.get("MEMO"))
    			,V_P_SORT_SEQ            : gfn_nvl(SBUxMethod.get("SORT_SEQ"))
    			,V_P_WORK_TIME_YN        : gfn_nvl(SBUxMethod.get("WORK_TIME_YN").WORK_TIME_YN)
    			,V_P_WORK_PATTERN_CODE   : gfnma_multiSelectGet('#WORK_PATTERN_CODE')
    			,V_P_ATTR1               : gfnma_multiSelectGet('#ATTR1')
    			,V_P_ATTR2               : gfn_nvl(SBUxMethod.get("ATTR2"))
    			,V_P_ATTR3               : gfn_nvl(SBUxMethod.get("ATTR3"))
    			,V_P_ATTR4               : gfn_nvl(SBUxMethod.get("ATTR4"))
    			,V_P_ATTR5               : gfn_nvl(SBUxMethod.get("ATTR5"))
    			,V_P_ATTR6               : gfn_nvl(SBUxMethod.get("ATTR6"))
    			,V_P_ATTR7               : gfn_nvl(SBUxMethod.get("ATTR7"))
    			,V_P_ATTR8               : gfn_nvl(SBUxMethod.get("ATTR8"))
    			,V_P_ATTR9               : gfn_nvl(SBUxMethod.get("ATTR9"))
    			,V_P_ATTR10              : gfn_nvl(SBUxMethod.get("ATTR10"))
    			,V_P_FORM_ID             : p_formId
    			,V_P_MENU_ID             : p_menuId
    			,V_P_PROC_ID             : ''
    			,V_P_USERID              : p_userId
    			,V_P_PC                  : ''
  	    };	
        const postJsonPromise = gfn_postJSON("/co/sys/org/insertOrg2000.do", {
        	getType				: 'json',
        	workType			: 'U',
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
    const fn_viewSubTable = async function() {
    	// 코드목록 그리드 초기화
    	await fn_clearForm();
    	
	    const nRow = masterTreeGrid.getRow();
	    if (nRow == -1) {
	        return;
	    }
	    const selectRowVal = masterTreeGrid.getRowData(nRow);

    	SBUxMethod.set("DEPT_CODE"			, gfn_nvl(selectRowVal.DEPT_CODE) );
    	SBUxMethod.set("DEPT_NAME"			, gfn_nvl(selectRowVal.DEPT_NAME) );
    	SBUxMethod.set("DEPT_ABBR_NAME"		, gfn_nvl(selectRowVal.DEPT_ABBR_NAME) );
    	SBUxMethod.set("SITE_CODE"			, gfn_nvl(selectRowVal.SITE_CODE) );
    	SBUxMethod.set("SITE_NAME"			, gfn_nvl(selectRowVal.SITE_NAME) );
    	SBUxMethod.set("DEPT_NAME_ENG"		, gfn_nvl(selectRowVal.DEPT_NAME_ENG) );
    	SBUxMethod.set("DEPT_NAME_FOR"		, gfn_nvl(selectRowVal.DEPT_NAME_FOR) );
    	SBUxMethod.set("PARENT_DEPT"		, gfn_nvl(selectRowVal.PARENT_DEPT) );
    	SBUxMethod.set("PARENT_DEPT_NAME"	, gfn_nvl(selectRowVal.PARENT_DEPT_NAME) );
    	SBUxMethod.set("DEPT_LEADER"		, gfn_nvl(selectRowVal.DEPT_LEADER) );
    	SBUxMethod.set("DEPT_LEADER_NAME"	, gfn_nvl(selectRowVal.DEPT_LEADER_NAME) );
    	SBUxMethod.set("FINANCE_DEPT_YN"	, gfn_nvl(selectRowVal.FINANCE_DEPT_YN) );
    	SBUxMethod.set("SALES_DEPT_YN"		, gfn_nvl(selectRowVal.SALES_DEPT_YN) );
    	SBUxMethod.set("MARKETING_DEPT_YN"	, gfn_nvl(selectRowVal.MARKETING_DEPT_YN) );
    	SBUxMethod.set("PRODUCTION_DEPT_YN"	, gfn_nvl(selectRowVal.PRODUCTION_DEPT_YN) );
    	SBUxMethod.set("CC_CODE"			, gfn_nvl(selectRowVal.CC_CODE) );
    	SBUxMethod.set("CC_NAME"			, gfn_nvl(selectRowVal.CC_NAME) );
    	SBUxMethod.set("START_DATE"			, gfn_nvl(selectRowVal.START_DATE) );
    	SBUxMethod.set("END_DATE"			, gfn_nvl(selectRowVal.END_DATE) );
    	SBUxMethod.set("ZIP_CODE"			, gfn_nvl(selectRowVal.ZIP_CODE) );
    	SBUxMethod.set("ADDRESS"			, gfn_nvl(selectRowVal.ADDRESS) );
    	SBUxMethod.set("FIXED_NUMBER"		, gfn_nvl(selectRowVal.FIXED_NUMBER) );
    	SBUxMethod.set("MEMO"				, gfn_nvl(selectRowVal.MEMO) );
    	SBUxMethod.set("SORT_SEQ"			, gfn_nvl(selectRowVal.SORT_SEQ) );
    	SBUxMethod.set("WORK_TIME_YN"		, gfn_nvl(selectRowVal.WORK_TIME_YN) );
    	SBUxMethod.set("ATTR2"				, gfn_nvl(selectRowVal.ATTR2) );
    	SBUxMethod.set("ATTR3"				, gfn_nvl(selectRowVal.ATTR3) );
    	SBUxMethod.set("ATTR4"				, gfn_nvl(selectRowVal.ATTR4) );
    	SBUxMethod.set("ATTR5"				, gfn_nvl(selectRowVal.ATTR5) );
    	SBUxMethod.set("ATTR6"				, gfn_nvl(selectRowVal.ATTR6) );
    	SBUxMethod.set("ATTR7"				, gfn_nvl(selectRowVal.ATTR7) );
    	SBUxMethod.set("ATTR8"				, gfn_nvl(selectRowVal.ATTR8) );
    	SBUxMethod.set("ATTR9"				, gfn_nvl(selectRowVal.ATTR9) );
    	SBUxMethod.set("ATTR10"				, gfn_nvl(selectRowVal.ATTR10) );
    	
    	gfnma_multiSelectSet('#SITE_CODE', 			'SITE_CODE', 	'SITE_NAME', gfn_nvl(selectRowVal.SITE_CODE) );
    	gfnma_multiSelectSet('#DEPT_CATEGORY', 		'SUB_CODE', 	'CODE_NAME', gfn_nvl(selectRowVal.DEPT_CATEGORY) );
    	gfnma_multiSelectSet('#LABOR_COST_GROUP', 	'SUB_CODE', 	'CODE_NAME', gfn_nvl(selectRowVal.LABOR_COST_GROUP) );
    	gfnma_multiSelectSet('#WORK_PATTERN_CODE', 	'SUB_CODE', 	'CODE_NAME', gfn_nvl(selectRowVal.WORK_PATTERN_CODE) );
    	gfnma_multiSelectSet('#ATTR1', 				'SUB_CODE', 	'CODE_NAME', gfn_nvl(selectRowVal.ATTR1) );
    	
    }
    
    
    /**
     * 공통팝업
     * 상위부서
     */
    var fn_compopupParent = function() {
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG001'
    		,popupType				: 'B'
    		,whereClause			: ''
   			,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
   			,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
   			,searchInputValues		: ["", 				"",				"2024-07-10"]
			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
    		,height					: '400px'
   			,tableHeader			: ["기준일",			"사업장", 		"부서명", 		"사업장코드"]
   			,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
   			,tableColumnWidths		: ["100px", 		"150px", 		"100px", 		"100px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('PARENT_DEPT', 		data.DEPT_CODE);
				SBUxMethod.set('PARENT_DEPT_NAME',	data.DEPT_NAME);
			},
    	});
  	}
    
    /**
     * 공통팝업
     * 부서장
     */
    var fn_compopupDeptLeader = function() {
        var searchText1 	= gfn_nvl(SBUxMethod.get("DEPT_LEADER"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("DEPT_LEADER_NAME"));
        var replaceText0 	= "_EMP_CODE_";
        var replaceText1 	= "_EMP_NAME_";
        var replaceText2 	= "_EMP_STATE_";
        var strWhereClause 	= "AND EMP_CODE LIKE '%" + replaceText0 + "%' AND EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE LIKE '%" + replaceText2 + "%'";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_HRI001'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["부서명", 		"사원코드",			"사원명",			"재직상태"]
   			,searchInputFields		: ["DEPT_NAME", 	"EMP_CODE",		"EMP_NAME",		"EMP_STATE"]
   			,searchInputValues		: ["",				searchText1, 	searchText2,	""]
			,searchInputTypes		: ["input", 		"input",		"input",		"select"]			//input, select가 있는 경우
   			,searchInputTypeValues	: ["", 				"",				"",				jsonEmpState]				//select 경우
    		,width					: '700px'
    		,height					: '500px'
   			,tableHeader			: ["사번", 			"이름",		"부서",			"사업장"]
   			,tableColumnNames		: ["EMP_CODE", 		"EMP_NAME",	"DEPT_NAME",	"SITE_NAME"]
   			,tableColumnWidths		: ["150px", 		"150px",	"200px",		"200px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('DEPT_LEADER', 		data.EMP_CODE);
				SBUxMethod.set('DEPT_LEADER_NAME', 	data.EMP_NAME);
			},
    	});
  	}
    /**
     * 공통팝업
     * 원가조직
     */
    var fn_compopupCcCode = function() {
        var searchText1 	= gfn_nvl(SBUxMethod.get("CC_CODE"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("CC_NAME"));
        var replaceText0 	= "_CC_CODE_";
        var replaceText1 	= "_CC_NAME_";
        var strWhereClause 	= "AND CC_CODE LIKE '%" + replaceText0 + "%' AND CC_NAME LIKE '%" + replaceText1 +  "%'";
 
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 정보 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG010'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["원가조직코드", 	"원가조직명"]
   			,searchInputFields		: ["CC_CODE", 		"CC_NAME"]
   			,searchInputValues		: [searchText1, 	searchText2]
    		,width					: '600px'
    		,height					: '400px'
   			,tableHeader			: ["원가조직코드","원가조직명"]
   			,tableColumnNames		: ["CC_CODE", "CC_NAME"]
   			,tableColumnWidths		: ["100px", "100px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('CC_CODE', 	data.CC_CODE);
				SBUxMethod.set('CC_NAME', 	data.CC_NAME);
			},
    	});
  	}
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>