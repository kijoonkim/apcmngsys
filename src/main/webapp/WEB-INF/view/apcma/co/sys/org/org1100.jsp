<%
/**
 * @Class Name 		: Com3630.jsp
 * @Description 	: 신고사업장 정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.30
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.07.30   	천용진		최초 생성
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
	<title>사업장정보</title>
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
	                <table class="table table-bordered tbl_fixed table-search-ma">
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
	                            <th scope="row" class="th_bg_search">사업장코드</th>
	                            <td colspan="3" class="td_input"  style="border-right:hidden;">
	                            	<sbux-input uitype="text" id="SRCH_TAX_SITE_CODE1" class="form-control input-sm"></sbux-input>	
	                            </td>
	                            <td></td>
	                            <th scope="row" class="th_bg_search">사업장명</th>
	                            <td colspan="3" class="td_input"  style="border-right:hidden;">
	                            	<sbux-input uitype="text" id="SRCH_TAX_SITE_NAME1" class="form-control input-sm"></sbux-input>	
	                            </td>
	                            <td></td>
	                            <th scope="row" class="th_bg_search">사업자번호</th>
	                            <td colspan="3" class="td_input"  style="border-right:hidden;">
	                            	<sbux-input uitype="text" id="SRCH_BIZ_REGNO" class="form-control input-sm"></sbux-input>	
	                            </td> 
	                            <td></td>                           
	                        </tr>
	                    </tbody>
	                </table>
	            </div>    
                <div>
                    <div class="col-sm-6">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>신고사업장 리스트</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdOrg1100" style="height:300px; width:100%;"></div>
                        </div>
                        <sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="normal"
							is-scrollable="false"
							title-target-id-array="HISTORY^LIMIT"
							title-text-array="변경이력관리^발행한도관리"
							onclick = "fn_clickTab"
							style="margin-top:1rem;">
						</sbux-tabs>
						<div class="tab-content">
							<div id="HISTORY" style="height:52vh;">
		                        <div class="ad_tbl_top2">
		                        	<sbux-button id="btnSaveHistoryGrid" name="btnSaveHistoryGrid" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveHistoryGrid" style="float: right; margin-right:1rem;"></sbux-button>
		                        	<sbux-button id="btnDelHistoryRow"  name="btnDelHistoryRow"  uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delHistoryRow" style="float: right; margin-right:1rem;"></sbux-button>
		                        	<sbux-button id="btnAddHistoryRow"  name="btnAddHistoryRow"  uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addHistoryRow" style="float: right; margin-right:1rem;"></sbux-button>
		                        </div>							
	                            <div id="sb-area-grdHistoryOrg1100" style="width:100%;height:47vh;"></div>
							</div>
							<div id="LIMIT" style="height:52vh;">
								<div class="ad_tbl_top2">
		                        	<sbux-button id="btnSaveLimitGrid" name="btnSaveLimitGrid" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveLimitGrid" style="float: right; margin-right:1rem;"></sbux-button>
		                        	<sbux-button id="btnDelLimitRow"  name="btnDelLimitRow"  uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delLimitRow" style="float: right; margin-right:1rem;"></sbux-button>
		                        	<sbux-button id="btnAddLimitRow"  name="btnAddLimitRow"  uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addLimitRow" style="float: right; margin-right:1rem;"></sbux-button>
		                        </div>							
	                            <div id="sb-area-grdLimitOrg1100" style="width:100%;height:47vh;"></div>
							</div>
						</div>
                    </div>
                    <div class="col-sm-6">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>신고사업장 정보 편집</span>
                                </li>
                            </ul>
	                        <div class="ad_tbl_toplist">
	                        	<sbux-button id="btnTaxSiteStamp" name="btnTaxSiteStamp" uitype="normal" text="사용인감 추가" class="btn btn-sm btn-outline-danger"  style="float: right; margin-right:1rem;"></sbux-button>
	                        </div>
                        </div>
		                <table class="table table-bordered tbl_fixed">
		                    <caption>검색 조건 설정</caption>
		                    <colgroup>
								<col style="width: 20%">
								<col style="width: 25%">
								<col style="width: 20%">
								<col style="width: 35%">
		                    </colgroup>
		                    <tbody>
		                        <tr>
		                            <th scope="row" class="th_bg">사업장코드</th>
		                            <td class="td_input"  style="border-right:hidden;">
										<sbux-input uitype="text" id="TAX_SITE_CODE" class="form-control input-sm inpt_data_reqed" readonly></sbux-input>	
		                            </td>
		                            <th scope="row" class="th_bg">홈택스 ID</th>
		                            <td class="td_input"  style="border-right:hidden;">
										<sbux-input uitype="text" id="HOME_TAX_ID" class="form-control input-sm inpt_data_reqed"></sbux-input>	
		                            </td>		                            
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">사업장명</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="3">
										<sbux-input uitype="text" id="TAX_SITE_NAME" class="form-control input-sm inpt_data_reqed" style="width:100%" required></sbux-input>		                            
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">사업장명(한글)</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="3">
										<sbux-input uitype="text" id="TAX_SITE_NAME_CHN" class="form-control input-sm" style="width:100%"></sbux-input>		                            
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">사업자 번호</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
										<sbux-input uitype="text" id="BIZ_REGNO1" class="form-control input-sm inpt_data_reqed" style="width:100%"></sbux-input>		                            
		                            </td>		           
			                        <th scope="row" class="th_bg" rowspan="3">사용 인감</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" rowspan="3">
                                        <img id="TAX_SITE_STAMP" style="width: 280px; height: 100px;object-fit: contain;">
                                        <input type="file" name="TAX_SITE_STAMP_FILE" id="TAX_SITE_STAMP_FILE" accept="image/*" style="display: none;">		                            
		                            </td>	
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">대표자</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
										<sbux-input uitype="text" id="CHIEF_NAME" class="form-control input-sm inpt_data_reqed" style="width:100%" required></sbux-input>		                            
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">대표주민번호</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="CHIEF_SOCIALNO" class="form-control input-sm " style="width:100%" required></sbux-input>		
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">업태</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="3">
		                                <sbux-input uitype="text" id="BIZ_CATEGORY" class="form-control input-sm " style="width:100%" required></sbux-input>		
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">종목</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="3">
		                                <sbux-input uitype="text" id="BIZ_ITEMS" class="form-control input-sm" style="width:100%"></sbux-input>		
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">우편번호</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="">
		                                <sbux-input uitype="text" id="ZIP_CODE" class="form-control input-sm" style="width:100%" required></sbux-input>		
		                            </td>		               
		                            <td class="td_input"  style="border-right:hidden;width:100%;"></td>
		                            <td class="td_input"  style="border-right:hidden;width:100%;"></td>         
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">주소</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="3">
		                                <sbux-input uitype="text" id="ADDRESS" class="form-control input-sm inpt_data_reqed" style="width:100%"></sbux-input>		
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">대표전화</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="TEL" class="form-control input-sm inpt_data_reqed" style="width:100%" required></sbux-input>		
		                            </td>		                        
			                        <th scope="row" class="th_bg">FAX</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="FAX" class="form-control input-sm" style="width:100%"></sbux-input>		
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">주소지 전화번호</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="RESIDENCE_TEL" class="form-control input-sm" style="width:100%" required></sbux-input>		
		                            </td>		                        
			                        <th scope="row" class="th_bg">휴대전화</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="CELL_PHONE" class="form-control input-sm" style="width:100%"></sbux-input>		
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">개업일</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-datepicker id="ESTABLISH_DATE" name="ESTABLISH_DATE" uitype="popup" datepicker-mode="day" style="height: 3.6vh;x;width:100%;" class="" date-format="yyyy-mm-dd"></sbux-datepicker>
		                            </td>		                        
			                        <th scope="row" class="th_bg">폐업일</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-datepicker id="CLOSE_DATE" name="CLOSE_DATE" uitype="popup" datepicker-mode="day" style="height: 3.6vh;width:100%;" class="" date-format="yyyy-mm-dd"></sbux-datepicker>
		                            </td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">부가세관할세무소</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
										<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
										    	type="button" 
										    	id="VAT_OFFICE" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false"
										    	required>
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=VAT_OFFICE style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>		                            
		                            </td>		                        
			                        <th scope="row" class="th_bg">원천세관할세무소</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
										<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
										    	type="button" 
										    	id="INCOME_TAX_OFFICE" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false"
										    	required>
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=INCOME_TAX_OFFICE style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>		 
									</td>		                        
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">부가세담당 email</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="VAT_EMAIL" class="form-control input-sm" style="width:100%"></sbux-input>		
		                            </td>		                        
			                        <th scope="row" class="th_bg">원천세담당 email</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
		                                <sbux-input uitype="text" id="INCOME_TAX_EMAIL" class="form-control input-sm" style="width:100%"></sbux-input>		
		                            </td>
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">메모</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="3">
		                                <sbux-input uitype="text" id="DESCR" class="form-control input-sm" style="width:100%"></sbux-input>		
		                            </td>
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">통화코드</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
										<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left"
										    	class="btn btn-sm btn-light dropdown-toggle"
										    	type="button"
										    	id="CURRENCY_CODE"
										    	data-toggle="dropdown"
										    	aria-haspopup="true"
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CURRENCY_CODE style="width:400px;height:250px;padding-top:0px;overflow:auto">
										    </div>
										</div>
		                            </td>   
			                        <th scope="row" class="th_bg">종사업장번호</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;" colspan="2">
		                                <sbux-input uitype="text" id="BIZ_SUBNO" class="form-control input-sm" style="width:100%"></sbux-input>
		                            </td>
		                        </tr>
		                        <tr>
			                        <th scope="row" class="th_bg">사용여부</th>
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
                                        <sbux-checkbox uitype="normal" id="USE_YN" name="USE_YN" class="form-control input-sm check" text="사용" true-value="Y" false-value="N"/>
									</td>
			                        <th scope="row" class="th_bg">사업장</th> 
		                            <td class="td_input"  style="border-right:hidden;width:100%;">
										<div class="dropdown">
										    <button
										    	style="width:160px;text-align:left"
										    	class="btn btn-sm btn-light dropdown-toggle"
										    	type="button"
										    	id="SITE_CODE"
										    	data-toggle="dropdown"
										    	aria-haspopup="true"
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=SITE_CODE style="width:450px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>		                            
		                            </td>
		                        </tr>
		                    </tbody>
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
	
	
	/*
	
그리드 전체 초기화(rebuild)
SBGrid의 UI와 속성들을 모두 초기화하고 다시 생성합니다.
	
그리드 데이터 초기화(refresh)
SBGrid의 데이터 변경 사항을 갱신합니다.
	*/
	
	
	
	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId = '${comMenuVO.menuId}';
	var p_userId = '${loginVO.id}';
	//-----------------------------------------------------------
	var jsonCurrencyCode = [];
	const fn_initSBSelect = async function() {
	    let rst = await Promise.all([
			gfnma_setComSelect(['historyGrid','CURRENCY_CODE'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
	        //통화코드
	        gfnma_multiSelectInit({
	            target: ['#CURRENCY_CODE'],
	            compCode: gv_ma_selectedApcCd,
	            clientCode: gv_ma_selectedClntCd,
	            bizcompId: 'L_COM001',
	            whereClause: '',
	            formId: p_formId,
	            menuId: p_menuId,
	            selectValue: '',
	            dropType: 'up', // up, down
	            dropAlign: 'right', // left, right
	            colValue: 'CURRENCY_CODE',
	            colLabel: 'CURRENCY_NAME',
	            columns: [
	            	{	caption: "통화코드",	ref: 'CURRENCY_CODE',	width: '125px',	style: 'text-align:left' },
	            	{	caption: "통화명",	ref: 'CURRENCY_NAME',	width: '125px',	style: 'text-align:left' },
	            	{	caption: "비고",	ref: 'DESCIPTION',	width: '150px',	style: 'text-align:left'}
	            ]
	        }),
	        //부가세관할세무소
	        gfnma_multiSelectInit({
	            target: ['#VAT_OFFICE'],
	            compCode: gv_ma_selectedApcCd,
	            clientCode: gv_ma_selectedClntCd,
	            bizcompId: 'L_COM004',
	            whereClause: '',
	            formId: p_formId,
	            menuId: p_menuId,
	            selectValue: '',
	            dropType: 'down', // up, down
	            dropAlign: 'left', // left, right
	            colValue: 'SUB_CODE',
	            colLabel: 'CODE_NAME',
	            columns: [
	            	{	caption: "세무서코드",	ref: 'SUB_CODE',	width: '100px',	style: 'text-align:left' },
	            	{	caption: "세무서명",		ref: 'CODE_NAME',	width: '100px',	style: 'text-align:left' }
	            ]
	        }),
	        //원천세관할세무소
	        gfnma_multiSelectInit({
	            target: ['#INCOME_TAX_OFFICE'],
	            compCode: gv_ma_selectedApcCd,
	            clientCode: gv_ma_selectedClntCd,
	            bizcompId: 'L_COM004',
	            whereClause: '',
	            formId: p_formId,
	            menuId: p_menuId,
	            selectValue: '',
	            dropType: 'down', // up, down
	            dropAlign: 'left', // left, right
	            colValue: 'SUB_CODE',
	            colLabel: 'CODE_NAME',
	            columns: [
	            	{	caption: "세무서코드",	ref: 'SUB_CODE',	width: '100px',	style: 'text-align:left' },
	            	{	caption: "세무서명",		ref: 'CODE_NAME',	width: '100px',	style: 'text-align:left' }
	            ]
	        }),
	        
	        //국가
	        gfnma_multiSelectInit({
	            target: ['#SITE_CODE'],
	            compCode: gv_ma_selectedApcCd,
	            clientCode: gv_ma_selectedClntCd,
	            bizcompId: 'L_ORG001',
	            whereClause: '',
	            formId: p_formId,
	            menuId: p_menuId,
	            selectValue: '',
	            dropType: 'up', // up, down
	            dropAlign: 'right', // left, right
	            colValue: 'SITE_CODE',
	            colLabel: 'SITE_NAME',
	            columns: [
	            	{ caption: "사업장코드", 		ref: 'SITE_CODE',	width: '100px',	style: 'text-align:left'  },
	            	{ caption: "사업장명",		ref: 'SITE_NAME',	width: '150px',	style: 'text-align:left' },
	            	{ caption: "비고",	  		ref: 'DESCR',	width: '150px',	style: 'text-align:left' },
	            	{ caption: "회계단위코드",	 	ref: 'FI_ORG_CODE',	width: '150px',	style: 'text-align:left' }
	            ]
	        }),
	    ]);
	}
	
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
	    document.getElementById('btnTaxSiteStamp').addEventListener('click', function() {
	        let TAX_SITE_CODE = gfnma_nvl(SBUxMethod.get("TAX_SITE_CODE"));
	        if (TAX_SITE_CODE == '') {
	            gfn_comAlert("W0005", "선택한 사업장");
	            return;
	        }
	        if (gfn_comConfirm("Q0001", "사용인감을 수정")) { //{0} 하시겠습니까?
	            document.getElementById('TAX_SITE_STAMP_FILE').click();
	        }
	    });
	    document.getElementById('TAX_SITE_STAMP_FILE').addEventListener('change', function(event) {
	        const file = event.target.files[0];
	        let TAX_SITE_CODE = gfnma_nvl(SBUxMethod.get("TAX_SITE_CODE"));
	        TAX_SITE_CODE = TAX_SITE_CODE + "_SITE_STAMP"
	        if (TAX_SITE_CODE != "") {
	            fn_imgUpload(TAX_SITE_CODE, file, "5");
	        }
	    });
	
	    fn_initSBSelect();
	    fn_createGrid();
	    fn_createHistoryGrid();
	    fn_createLimitGrid();
	    cfn_search();
	});
	
	function fn_clickTab(){
	    const nRow = masterGrid.getRow();
	    const tabId = SBUxMethod.get('idxTab_norm');
	    
	    if (nRow == -1) {
	        return;
	    }
	    const selectRowVal = masterGrid.getRowData(nRow);
		if(gfn_comConfirm("Q0001", "탭 이동시 저장되지 않은 정보는 저장되지 않습니다 탭 이동")){ //{0} 하시겠습니까?
			if(tabId == 'HISTORY'){
				fn_searchHistoryGrid(selectRowVal.TAX_SITE_CODE, selectRowVal.TAX_SITE_NAME, selectRowVal.BIZ_REGNO);
			}else{
				fn_searchLimitGrid(selectRowVal.TAX_SITE_CODE, selectRowVal.TAX_SITE_NAME, selectRowVal.BIZ_REGNO);
			}
		}else{
			SBUxMethod.selectTab('idxTab_norm', tabId);
		}
	}
	// 신규
	function cfn_add() {
	    fn_clearSubTable();
	    $('#btnTaxSiteStamp').find('.sbux-btn-txt').text('사용인감 추가');
	}
	// 저장
	function cfn_save() {

		if(gfn_comConfirm("Q0001", "저장")){
		    fn_save();
		}
	}
	// 마스터 그리드 삭제
	function cfn_del() {
	    const nRow = masterGrid.getRow();
	    if (nRow == -1) {
	    	gfn_comAlert("W0003", "삭제"); // W0003 {0}할 대상이 없습니다.
	    	return;
	    }
		if(gfn_comConfirm("Q0001", "삭제")){ // Q0001 {0} 하시겠습니까?
	    	fn_delete();
		}
	}
	// 조회
	function cfn_search() {
	    fn_search();
	}
	
	var masterGrid; // 그리드를 담기위한 객체 선언
	var historyGrid; // 그리드를 담기위한 객체 선언
	var limitGrid; // 그리드를 담기위한 객체 선언
	var jsonMasterList = []; // 그리드의 참조 데이터 주소 선언
	var jsonHistoryList = []; // 변경이력관리 그리드 리스트 
	var jsonLimitList = []; //발행한도관리 그리드 리스트 
	function fn_createGrid() {
	    //사업장 리스트 
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdOrg1100';
	    SBGridProperties.id = 'masterGrid';
	    SBGridProperties.jsonref = 'jsonMasterList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.rowheader = 'seq';
	    SBGridProperties.rowheadercaption = {seq: 'No'};
	    SBGridProperties.rowheaderwidth = {seq: '60'};
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
			{ 	caption: ["사업장코드"], 	ref: 'TAX_SITE_CODE', 	type: 'output', 	width: '220px', 	style: 'text-align:left' 	}, 	
		    { 	caption: ["사업장명"], 	ref: 'TAX_SITE_NAME', 	type: 'output', 	width: '220px', 	style: 'text-align:left' 	}, 	
		    { 	caption: ["사업자번호"], 	ref: 'BIZ_REGNO', 	type: 'output', 	width: '220px', 	style: 'text-align:left' 	},
	    ];
	    masterGrid = _SBGrid.create(SBGridProperties);
	    masterGrid.bind('click', 'fn_searchSubTable');
	}
	
	function fn_createHistoryGrid() {
	    //변경이력관리 리스트 
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdHistoryOrg1100';
	    SBGridProperties.id = 'historyGrid';
	    SBGridProperties.jsonref = 'jsonHistoryList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.rowheader = 'seq';
	    SBGridProperties.rowheadercaption = { seq: 'No' };
	    SBGridProperties.rowheaderwidth = {  seq: '60' };
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
			{	caption:['적용시작일'],	ref:'APPLY_START_DATE',	type:'inputdate',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	},
				fixedstyle : 'background-color:#f1ffd9;',	width:'150px',	style:'text-align:center'	
		    },	
			{	caption:['적용종료일'],	ref:'APPLY_END_DATE',	type:'inputdate',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	},
		    	fixedstyle : 'background-color:#f1ffd9;', width:'150px',	style:'text-align:center'	
		    },	
	        { caption: ["사업장명"],   ref: 'TAX_SITE_NAME',	  type: 'input', width: '120px', style: 'text-align:left', fixedstyle : 'background-color:#f1ffd9;', },
	        { caption: ["종사업장번호"], ref: 'BIZ_SUBNO',       type: 'input', width: '120px', style: 'text-align:left' },
	        { caption: ["사업자번호"], ref: 'BIZ_REGNO', type: 'input',  width: '120px', style: 'text-align:left' },
            {caption: ["통화코드"],	ref: 'CURRENCY_CODE', 	type:'combo',  	width:'100px',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonCurrencyCode',
					label		: 'label',
					value		: 'value',
					displayui :true, 
					oneclickedit: true
            	}
            },
	        
	        { caption: ["업태"], ref: 'BIZ_CATEGORY', type: 'input', width: '120px', style: 'text-align:left', fixedstyle : 'background-color:#f1ffd9;' },
	        { caption: ["종목"], ref: 'BIZ_ITEMS', type: 'input',  width: '120px', style: 'text-align:left', fixedstyle : 'background-color:#f1ffd9;' },
	        { caption: ["대표자"],  ref: 'CHIEF_NAME', type: 'input', width: '120px',  style: 'text-align:left', fixedstyle : 'background-color:#f1ffd9;' },
	        { caption: ["대표주민번호"],  ref: 'CHIEF_SOCIALNO', type: 'input', width: '120px',  style: 'text-align:left' },
	        { caption: ["우편번호"], ref: 'ZIP_CODE', type: 'input', width: '120px', style: 'text-align:left', fixedstyle : 'background-color:#f1ffd9;' },
	        { caption: ["주소"], ref: 'ADDRESS', type: 'input', width: '120px', style: 'text-align:left', fixedstyle : 'background-color:#f1ffd9;' },
	        { caption: ["교부일"], ref: 'ISSUE_DATE', type: 'input', width: '120px', style: 'text-align:left' },
	        { caption: ["교부사유"], ref: 'ISSUE_REASON', type: 'input', width: '120px', style: 'text-align:left' },
	        { caption: ["비고"], ref: 'MEMO', type: 'input', width: '120px', style: 'text-align:left' },
	        { caption: ["사업장코드"], ref: 'TAX_SITE_CODE', type: 'input', width: '120px', style: 'text-align:left', hidden:true }
	    ];
	    historyGrid = _SBGrid.create(SBGridProperties);
	}
	
	function fn_createLimitGrid() {
	    //발행한도관리 리스트 
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdLimitOrg1100';
	    SBGridProperties.id = 'limitGrid';
	    SBGridProperties.jsonref = 'jsonLimitList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.rowheader = 'seq';
	    SBGridProperties.rowheadercaption = {  seq: 'No'  };
	    SBGridProperties.rowheaderwidth = { seq: '60' };
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
			{	caption:['적용시작일'],	ref:'APPLY_START_DATE',	type:'inputdate',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	},
		    	width:'150px',	style:'text-align:center', fixedstyle : 'background-color:#f1ffd9;'	
		    },	
		    {	caption:['적용종료일'],	ref:'APPLY_END_DATE',	type:'inputdate',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	},	
		    	width:'150px',	style:'text-align:center', fixedstyle : 'background-color:#f1ffd9;'
		    },
		    {	caption:["월발행한도"],	ref:'ISSUE_LIMIT_MONTH',	type:'input',	width:'150px',	style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;'	},
		    {	caption:["1회발행한도"],	ref:'ISSUE_LIMIT_ONCE',	type:'input',	width:'150px',	style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;'	},
		    {	caption:["사업장코드"],	ref:'TAX_SITE_CODE',	type:'input',	width:'150px',	style:'text-align:left', hidden: true	}
	    ];
	    limitGrid = _SBGrid.create(SBGridProperties);
	}
	/**
	 * 사업장 리스트 조회
	 */
	const fn_search = async function() {
	    // 사업장 리스트 그리드 초기화
	    fn_clearForm();
	
	    let SRCH_TAX_SITE_CODE1 = gfnma_nvl(SBUxMethod.get("SRCH_TAX_SITE_CODE1"));
	    let SRCH_TAX_SITE_NAME1 = gfnma_nvl(SBUxMethod.get("SRCH_TAX_SITE_NAME1"));
	    let SRCH_BIZ_REGNO = gfnma_nvl(SBUxMethod.get("SRCH_BIZ_REGNO"));
	
	    var paramObj = {
	        V_P_DEBUG_MODE_YN			: '',
	        V_P_LANG_ID					: '',
	        V_P_COMP_CODE				: gv_ma_selectedApcCd,
	        V_P_CLIENT_CODE				: gv_ma_selectedClntCd,
	        V_P_TAX_SITE_CODE			: SRCH_TAX_SITE_CODE1,
	        V_P_TAX_SITE_NAME			: SRCH_TAX_SITE_NAME1,
	        V_P_BIZ_REGNO				: SRCH_BIZ_REGNO,
	        V_P_FORM_ID					: p_formId,
	        V_P_MENU_ID					: p_menuId,
	        V_P_PROC_ID					: '',
	        V_P_USERID					: p_userId,
	        V_P_PC						: ''
	    };
	    const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg1100.do", {
	        getType: 'json',
	        workType: 'Q',
	        cv_count: '2',
	        params: gfnma_objectToString(paramObj)
	    });
	    const data = await postJsonPromise;
	    try {
	        if (_.isEqual("S", data.resultStatus)) {
	            /** @type {number} **/
	            let totalRecordCount = 0;
	            masterGrid.length = 0;
	            data.cv_1.forEach((item, index) => {
	                const msg = {
	                    TAX_SITE_CODE: gfnma_nvl(item.TAX_SITE_CODE),
	                    TAX_SITE_NAME: gfnma_nvl(item.TAX_SITE_NAME),
	                    BIZ_REGNO: gfnma_nvl(item.BIZ_REGNO),
	                    CHIEF_NAME: gfnma_nvl(item.CHIEF_NAME),
	                    CHIEF_SOCIALNO: gfnma_nvl(item.CHIEF_SOCIALNO),
	                    CHIEF_SOCIALNO_REAL: gfnma_nvl(item.CHIEF_SOCIALNO_REAL),
	                    TAX_SITE_STAMP: gfnma_nvl(item.TAX_SITE_STAMP),
	                    BIZ_CATEGORY: gfnma_nvl(item.BIZ_CATEGORY),
	                    BIZ_ITEMS: gfnma_nvl(item.BIZ_ITEMS),
	                    ZIP_CODE: gfnma_nvl(item.ZIP_CODE),
	                    ADDRESS: gfnma_nvl(item.ADDRESS),
	                    TEL: gfnma_nvl(item.TEL),
	                    RESIDENCE_TEL: gfnma_nvl(item.RESIDENCE_TEL),
	                    FAX: gfnma_nvl(item.FAX),
	                    ESTABLISH_DATE: gfnma_nvl(item.ESTABLISH_DATE),
	                    CLOSE_DATE: gfnma_nvl(item.CLOSE_DATE),
	                    HOME_TAX_ID: gfnma_nvl(item.HOME_TAX_ID),
	                    VAT_OFFICE: gfnma_nvl(item.VAT_OFFICE),
	                    INCOME_TAX_OFFICE: gfnma_nvl(item.INCOME_TAX_OFFICE),
	                    VAT_EMAIL: gfnma_nvl(item.VAT_EMAIL),
	                    INCOME_TAX_EMAIL: gfnma_nvl(item.INCOME_TAX_EMAIL),
	                    DESCR: gfnma_nvl(item.DESCR),
	                    USE_YN: gfnma_nvl(item.USE_YN),
	                    BIZ_SUBNO: gfnma_nvl(item.BIZ_SUBNO),
	                    CURRENCY_CODE: gfnma_nvl(item.CURRENCY_CODE),
	                    TAX_SITE_NAME_CHN: gfnma_nvl(item.TAX_SITE_NAME_CHN),
	                    COMP_CODE: gfnma_nvl(item.COMP_CODE),
	                    SITE_CODE: gfnma_nvl(item.SITE_CODE),
	                    SITE_STAMP_FILE_NAME: gfnma_nvl(item.SITE_STAMP_FILE_NAME)
	                }
	                jsonMasterList.push(msg);
	                totalRecordCount++;
	            });
	            masterGrid.rebuild();
	            document.querySelector('#listCount').innerText = totalRecordCount;
	            
                if(jsonMasterList.length > 0) {
                	masterGrid.clickRow(1);
                }
                
	        } else {
	            alert(data.resultMessage);
	        }
	
	    } catch (e) {
	        if (!(e instanceof Error)) {
	            e = new Error(e);
	        }
	        console.error("failed", e.message);
	        gfn_comAlert("E0001"); //	E0001	오류가 발생하였습니다.
	    }
	}
	
	
	const fn_searchHistoryGrid = async function(P_TAX_SITE_CODE, P_TAX_SITE_NAME, P_BIZ_REGNO) {
	    jsonHistoryList = [];
	    var paramObj = {
	        V_P_DEBUG_MODE_YN: '',
	        V_P_LANG_ID: '',
	        V_P_COMP_CODE: gv_ma_selectedApcCd,
	        V_P_CLIENT_CODE: gv_ma_selectedClntCd,
	        V_P_TAX_SITE_CODE: gfnma_nvl(P_TAX_SITE_CODE),
	        V_P_TAX_SITE_NAME: gfnma_nvl(P_TAX_SITE_NAME),
	        V_P_BIZ_REGNO: gfnma_nvl(P_BIZ_REGNO),
	        V_P_FORM_ID: p_formId,
	        V_P_MENU_ID: p_menuId,
	        V_P_PROC_ID: '',
	        V_P_USERID: p_userId,
	        V_P_PC: ''
	    };
	    const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg1100.do", {
	        getType: 'json',
	        workType: 'HISTORY',
	        cv_count: '2',
	        params: gfnma_objectToString(paramObj)
	    });
	    const data = await postJsonPromise;
	    try {
	        if (_.isEqual("S", data.resultStatus)) {
	            data.cv_2.forEach((item, index) => {
	                const msg = {
	                    APPLY_START_DATE: gfnma_nvl(item.APPLY_START_DATE),
	                    APPLY_END_DATE: gfnma_nvl(item.APPLY_END_DATE),
	                    TAX_SITE_NAME: gfnma_nvl(item.TAX_SITE_NAME),
	                    TAX_SITE_CODE: gfnma_nvl(paramObj.V_P_TAX_SITE_CODE),
	                    BIZ_REGNO: gfnma_nvl(item.BIZ_REGNO),
	                    BIZ_CATEGORY: gfnma_nvl(item.BIZ_CATEGORY),
	                    BIZ_ITEMS: gfnma_nvl(item.BIZ_ITEMS),
	                    CHIEF_NAME: gfnma_nvl(item.CHIEF_NAME),
	                    CHIEF_SOCIALNO: gfnma_nvl(item.CHIEF_SOCIALNO),
	                    CHIEF_SOCIALNO_REAL: gfnma_nvl(item.CHIEF_SOCIALNO_REAL),
	                    ZIP_CODE: gfnma_nvl(item.ZIP_CODE),
	                    ADDRESS: gfnma_nvl(item.ADDRESS),
	                    ISSUE_DATE: gfnma_nvl(item.ISSUE_DATE),
	                    ISSUE_REASON: gfnma_nvl(item.ISSUE_REASON),
	                    MEMO: gfnma_nvl(item.MEMO),
	                    BIZ_SUBNO: gfnma_nvl(item.BIZ_SUBNO),
	                    CURRENCY_CODE: gfnma_nvl(item.CURRENCY_CODE),
	                    CLIENT_CODE: gfnma_nvl(item.CLIENT_CODE),
	                    COMP_CODE: gfnma_nvl(item.COMP_CODE)
	                }
	                jsonHistoryList.push(msg);
	            });
	            historyGrid.rebuild();
	        } else {
	            alert(data.resultMessage);
	        }
	
	    } catch (e) {
	        if (!(e instanceof Error)) {
	            e = new Error(e);
	        }
	        console.error("failed", e.message);
	        gfn_comAlert("E0001"); //	E0001	오류가 발생하였습니다.
	    }
	}
	
	const fn_searchLimitGrid = async function(P_TAX_SITE_CODE, P_TAX_SITE_NAME, P_BIZ_REGNO) {
	    jsonLimitList = [];
	    var paramObj = {
	        V_P_DEBUG_MODE_YN			: '',
	        V_P_LANG_ID					: '',
	        V_P_COMP_CODE				: gv_ma_selectedApcCd,
	        V_P_CLIENT_CODE				: gv_ma_selectedClntCd,
	        V_P_TAX_SITE_CODE			: gfnma_nvl(P_TAX_SITE_CODE),
	        V_P_TAX_SITE_NAME			: gfnma_nvl(P_TAX_SITE_NAME),
	        V_P_BIZ_REGNO				: gfnma_nvl(P_BIZ_REGNO),
	        V_P_FORM_ID					: p_formId,
	        V_P_MENU_ID					: p_menuId,
	        V_P_PROC_ID					: '',
	        V_P_USERID					: p_userId,
	        V_P_PC						: ''
	    };
	    const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg1100.do", {
	        getType: 'json',
	        workType: 'LIMIT',
	        cv_count: '2',
	        params: gfnma_objectToString(paramObj)
	    });
	    const data = await postJsonPromise;
	    try {
	        if (_.isEqual("S", data.resultStatus)) {
	            data.cv_2.forEach((item, index) => {
	                const msg = {
	                    APPLY_START_DATE			: gfnma_nvl(item.APPLY_START_DATE),
	                    APPLY_END_DATE				: gfnma_nvl(item.APPLY_END_DATE),
	                    ISSUE_LIMIT_MONTH			: gfnma_nvl(item.ISSUE_LIMIT_MONTH),
	                    ISSUE_LIMIT_ONCE			: gfnma_nvl(item.ISSUE_LIMIT_ONCE),
	                    TAX_SITE_CODE				: gfnma_nvl(paramObj.V_P_TAX_SITE_CODE)
	                }
	                jsonLimitList.push(msg);
	            });
	            limitGrid.rebuild();
	        } else {
	            alert(data.resultMessage);
	        }
	    } catch (e) {
	        if (!(e instanceof Error)) {
	            e = new Error(e);
	        }
	        console.error("failed", e.message);
	        gfn_comAlert("E0001"); //	E0001	오류가 발생하였습니다.
	    }
	}
	
		
	
	const fn_searchSubTable = async function() {
	
	    const nRow = masterGrid.getRow();
	    if (nRow == -1) {
	        return;
	    }
	    const selectRowVal = masterGrid.getRowData(nRow);
	    
		await fn_searchHistoryGrid(selectRowVal.TAX_SITE_CODE, selectRowVal.TAX_SITE_NAME, selectRowVal.BIZ_REGNO);
		await fn_searchLimitGrid(selectRowVal.TAX_SITE_CODE, selectRowVal.TAX_SITE_NAME, selectRowVal.BIZ_REGNO);
	
	    // 사업장정보 테이블 초기화
	    await fn_clearSubTable();
	    
	    var paramObj = {
		        V_P_DEBUG_MODE_YN			: '',
		        V_P_LANG_ID					: '',
		        V_P_COMP_CODE				: gv_ma_selectedApcCd,
		        V_P_CLIENT_CODE				: gv_ma_selectedClntCd,
		        V_P_TAX_SITE_CODE			: selectRowVal.TAX_SITE_CODE,
		        V_P_TAX_SITE_NAME			: selectRowVal.TAX_SITE_NAME,
		        V_P_BIZ_REGNO				: selectRowVal.BIZ_REGNO,
		        V_P_FORM_ID					: p_formId,
		        V_P_MENU_ID					: p_menuId,
		        V_P_PROC_ID					: '',
		        V_P_USERID					: p_userId,
		        V_P_PC						: ''
		    };
		    const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg1100.do", {
		        getType: 'json',
		        workType: 'DETAIL',
		        cv_count: '2',
		        params: gfnma_objectToString(paramObj)
		    });
		    const data = await postJsonPromise;
		    try {
		        if (_.isEqual("S", data.resultStatus)) {
		        	var obj = data.cv_1[0];
		    	    SBUxMethod.set("TAX_SITE_CODE", gfnma_nvl(obj.TAX_SITE_CODE));
		    	    SBUxMethod.set("TAX_SITE_NAME", gfnma_nvl(obj.TAX_SITE_NAME));
		    	    SBUxMethod.set("BIZ_REGNO1", gfnma_nvl(obj.BIZ_REGNO));
		    	    SBUxMethod.set("CHIEF_NAME", gfnma_nvl(obj.CHIEF_NAME));
		    	    SBUxMethod.set("CHIEF_SOCIALNO", gfnma_nvl(obj.CHIEF_SOCIALNO));
		    	    SBUxMethod.set("CHIEF_SOCIALNO_REAL", gfnma_nvl(obj.CHIEF_SOCIALNO_REAL));
		    	    SBUxMethod.set("BIZ_CATEGORY", gfnma_nvl(obj.BIZ_CATEGORY));
		    	    SBUxMethod.set("BIZ_ITEMS", gfnma_nvl(obj.BIZ_ITEMS));
		    	    SBUxMethod.set("ZIP_CODE", gfnma_nvl(obj.ZIP_CODE));
		    	    SBUxMethod.set("ADDRESS", gfnma_nvl(obj.ADDRESS));
		    	    SBUxMethod.set("TEL", gfnma_nvl(obj.TEL));
		    	    SBUxMethod.set("RESIDENCE_TEL", gfnma_nvl(obj.RESIDENCE_TEL));
		    	    SBUxMethod.set("FAX", gfnma_nvl(obj.FAX));
		    	    SBUxMethod.set("ESTABLISH_DATE", gfnma_nvl(obj.ESTABLISH_DATE));
		    	    SBUxMethod.set("CLOSE_DATE", gfnma_nvl(obj.CLOSE_DATE));
		    	    SBUxMethod.set("HOME_TAX_ID", gfnma_nvl(obj.HOME_TAX_ID));
		    	    SBUxMethod.set("VAT_EMAIL", gfnma_nvl(obj.VAT_EMAIL));
		    	    SBUxMethod.set("INCOME_TAX_EMAIL", gfnma_nvl(obj.INCOME_TAX_EMAIL));
		    	    SBUxMethod.set("DESCR", gfnma_nvl(obj.DESCR));
		    	    SBUxMethod.set("USE_YN", gfnma_nvl(obj.USE_YN));
		    	    SBUxMethod.set("BIZ_SUBNO", gfnma_nvl(obj.BIZ_SUBNO));
		    	    SBUxMethod.set("TAX_SITE_NAME_CHN", gfnma_nvl(obj.TAX_SITE_NAME_CHN));
		    	    SBUxMethod.set("COMP_CODE", gfnma_nvl(obj.COMP_CODE));
		    	
		    	    gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', gfnma_nvl(obj.CURRENCY_CODE));
		    	    gfnma_multiSelectSet('#VAT_OFFICE', 'SUB_CODE', 'CODE_NAME', gfnma_nvl(obj.VAT_OFFICE));
		    	    gfnma_multiSelectSet('#INCOME_TAX_OFFICE', 'SUB_CODE', 'CODE_NAME', gfnma_nvl(obj.INCOME_TAX_OFFICE));
		    	    gfnma_multiSelectSet('#SITE_CODE', 'SITE_CODE', 'SITE_NAME', gfnma_nvl(obj.SITE_CODE));
		    	
		    	    if (gfnma_nvl(obj.SITE_STAMP_FILE_NAME) != '') {
		    	        $("#TAX_SITE_STAMP").attr("src", "/com/getFileImage.do?fkey=" + obj.SITE_STAMP_FILE_NAME + "&comp_code=" + gv_ma_selectedApcCd + "&client_code=" + gv_ma_selectedClntCd);
		    	    }
		    	    $('#btnTaxSiteStamp').find('.sbux-btn-txt').text('사용인감 변경');
		    	    
		        } else {
		            alert(data.resultMessage);
		        }
		
		    } catch (e) {
		        if (!(e instanceof Error)) {
		            e = new Error(e);
		        }
		        console.error("failed", e.message);
		        gfn_comAlert("E0001"); //	E0001	오류가 발생하였습니다.
		    }
	    

	
	}
	
	const fn_clearSubTable = async function() {
	    SBUxMethod.set("TAX_SITE_CODE", "");
	    SBUxMethod.set("TAX_SITE_NAME", "");
	    SBUxMethod.set("BIZ_REGNO1", "");
	    SBUxMethod.set("CHIEF_NAME", "");
	    SBUxMethod.set("CHIEF_SOCIALNO", "");
	    SBUxMethod.set("CHIEF_SOCIALNO_REAL", "");
	    SBUxMethod.set("BIZ_CATEGORY", "");
	    SBUxMethod.set("BIZ_ITEMS", "");
	    SBUxMethod.set("ZIP_CODE", "");
	    SBUxMethod.set("ADDRESS", "");
	    SBUxMethod.set("TEL", "");
	    SBUxMethod.set("RESIDENCE_TEL", "");
	    SBUxMethod.set("FAX", "");
	    SBUxMethod.set("ESTABLISH_DATE", "");
	    SBUxMethod.set("CLOSE_DATE", "");
	    SBUxMethod.set("HOME_TAX_ID", "");
	    SBUxMethod.set("VAT_EMAIL", "");
	    SBUxMethod.set("INCOME_TAX_EMAIL", "");
	    SBUxMethod.set("DESCR", "");
	    SBUxMethod.set("USE_YN", "");
	    SBUxMethod.set("BIZ_SUBNO", "");
	    SBUxMethod.set("TAX_SITE_NAME_CHN", "");
	    SBUxMethod.set("COMP_CODE", "");
	
	    gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', "");
	    gfnma_multiSelectSet('#VAT_OFFICE', 'SUB_CODE', 'CODE_NAME', "");
	    gfnma_multiSelectSet('#INCOME_TAX_OFFICE', 'SUB_CODE', 'CODE_NAME', "");
	    gfnma_multiSelectSet('#SITE_CODE', 'SITE_CODE', 'SITE_NAME', "");
	    $("#TAX_SITE_STAMP").attr("src", "");
	}
	
	/**
	 * @name fn_clearForm
	 * @description 그리드 및 화면 초기화
	 * @param 
	 */
	const fn_clearForm = function() {
	    //사업장 그리드 리스트 
	    jsonMasterList = [];
	    //변경이력관리 그리드 리스트 
	    jsonHistoryList = [];
	    //발행한도관리 그리드 리스트 
	    jsonLimitList = [];
	}
	
	//그룹코드 내역 저장
	const fn_save = async function() {
	    let workType = 'N';
	    const txt = $('#btnTaxSiteStamp').find('.sbux-btn-txt').text();
	    if (txt == '사용인감 변경') {
	        workType = 'U';
	    }
	    if (gfnma_nvl(SBUxMethod.get("HOME_TAX_ID")) == "") {
	        gfn_comAlert("W0002", "홈택스 ID");
	        return;
	    }
	    if (gfnma_nvl(SBUxMethod.get("TAX_SITE_NAME")) == "") {
	        gfn_comAlert("W0002", "사업장명");
	        return;
	    }
	    if (gfnma_nvl(SBUxMethod.get("BIZ_REGNO1")) == "") {
	        gfn_comAlert("W0002", "사업자 번호");
	        return;
	    }
	    if (gfnma_nvl(SBUxMethod.get("CHIEF_NAME")) == "") {
	        gfn_comAlert("W0002", "대표자	");
	        return;
	    }
	    if (gfnma_nvl(SBUxMethod.get("ADDRESS")) == "") {
	        gfn_comAlert("W0002", "주소");
	        return;
	    }
	    if (gfnma_nvl(SBUxMethod.get("TEL")) == "") {
	        gfn_comAlert("W0002", "대표전화");
	        return;
	    }
	    if (gfnma_nvl(SBUxMethod.get("ADDRESS")) == "") {
	        gfn_comAlert("W0002", "주소");
	        return;
	    }
	    if (gfnma_nvl(SBUxMethod.get("TEL")) == "") {
	        gfn_comAlert("W0002", "전화번호");
	        return;
	    }
	    if (gfnma_multiSelectGet("#VAT_OFFICE") == "") {
	        gfn_comAlert("W0002", "부가세관할세무소");
	        return;
	    }
	    if (gfnma_multiSelectGet("#INCOME_TAX_OFFICE") == "") {
	        gfn_comAlert("W0002", "원천세관할세무소");
	        return;
	    }
	    var paramObj = {
	    		   V_P_DEBUG_MODE_YN       : ''
    			  ,V_P_LANG_ID             : ''
    			  ,V_P_COMP_CODE           : gv_ma_selectedApcCd
    			  ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
    			  ,V_P_TAX_SITE_CODE       : gfnma_nvl(SBUxMethod.get("TAX_SITE_CODE"))
    			  ,V_P_TAX_SITE_NAME       : gfnma_nvl(SBUxMethod.get("TAX_SITE_NAME"))
    			  ,V_P_TAX_SITE_NAME_CHN   : gfnma_nvl(SBUxMethod.get("TAX_SITE_NAME_CHN"))
    			  ,V_P_BIZ_REGNO           : gfnma_nvl(SBUxMethod.get("BIZ_REGNO1"))
    			  ,V_P_BIZ_CATEGORY        : gfnma_nvl(SBUxMethod.get("BIZ_CATEGORY"))
    			  ,V_P_BIZ_ITEMS           : gfnma_nvl(SBUxMethod.get("BIZ_ITEMS"))
    			  ,V_P_CHIEF_NAME          : gfnma_nvl(SBUxMethod.get("CHIEF_NAME"))
    			  ,V_P_CHIEF_SOCIALNO      : gfnma_nvl(SBUxMethod.get("CHIEF_SOCIALNO"))
    			  ,V_P_TAX_SITE_STAMP      : ''
    			  ,V_P_ZIP_CODE            : gfnma_nvl(SBUxMethod.get("ZIP_CODE"))
    			  ,V_P_ADDRESS             : gfnma_nvl(SBUxMethod.get("ADDRESS"))
    			  ,V_P_TEL                 : gfnma_nvl(SBUxMethod.get("TEL"))
    			  ,V_P_RESIDENCE_TEL       : gfnma_nvl(SBUxMethod.get("RESIDENCE_TEL"))
    			  ,V_P_CELL_PHONE          : gfnma_nvl(SBUxMethod.get("CELL_PHONE"))
    			  ,V_P_FAX                 : gfnma_nvl(SBUxMethod.get("FAX"))
    			  ,V_P_ESTABLISH_DATE      : gfnma_nvl(SBUxMethod.get("ESTABLISH_DATE"))
    			  ,V_P_CLOSE_DATE          : gfnma_nvl(SBUxMethod.get("CLOSE_DATE"))
    			  ,V_P_HOME_TAX_ID         : gfnma_nvl(SBUxMethod.get("HOME_TAX_ID"))
    			  ,V_P_VAT_OFFICE          : gfnma_multiSelectGet("#VAT_OFFICE")
    			  ,V_P_INCOME_TAX_OFFICE   : gfnma_multiSelectGet("#INCOME_TAX_OFFICE")
    			  ,V_P_VAT_EMAIL           : gfnma_nvl(SBUxMethod.get("VAT_EMAIL"))
    			  ,V_P_INCOME_TAX_EMAIL    : gfnma_nvl(SBUxMethod.get("INCOME_TAX_EMAIL"))
    			  ,V_P_DESCR               : gfnma_nvl(SBUxMethod.get("DESCR"))
    			  ,V_P_USE_YN              : gfnma_nvl(SBUxMethod.get("USE_YN").USE_YN)
    			  ,V_P_BIZ_SUBNO           : gfnma_nvl(SBUxMethod.get("BIZ_SUBNO"))
    			  ,V_P_CURRENCY_CODE       : gfnma_multiSelectGet("#CURRENCY_CODE")
    			  ,V_P_SITE_CODE           : gfnma_multiSelectGet("#SITE_CODE")
    			  ,V_P_FORM_ID             : p_formId
    			  ,V_P_MENU_ID             : p_menuId
    			  ,V_P_PROC_ID             : ''
    			  ,V_P_USERID              : p_userId
    			  ,V_P_PC                  : ''
	    };
	    const postJsonPromise = gfn_postJSON("/co/sys/org/insertOrg1100.do", {
	        getType: 'json',
	        workType: workType,
	        cv_count: '0',
	        params: gfnma_objectToString(paramObj)
	    });
	    const data = await postJsonPromise;
	    try {
	        if (_.isEqual("S", data.resultStatus)) {
	            if (data.resultMessage) {
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
	        gfn_comAlert("E0001"); //	E0001	오류가 발생하였습니다.
	    }
	}
	const fn_delete = async function() {
	    var paramObj = {
	    		   V_P_DEBUG_MODE_YN       : ''
    			  ,V_P_LANG_ID             : ''
    			  ,V_P_COMP_CODE           : gv_ma_selectedApcCd
    			  ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
    			  ,V_P_TAX_SITE_CODE       : gfnma_nvl(SBUxMethod.get("TAX_SITE_CODE"))
    			  ,V_P_TAX_SITE_NAME       : gfnma_nvl(SBUxMethod.get("TAX_SITE_NAME"))
    			  ,V_P_TAX_SITE_NAME_CHN   : gfnma_nvl(SBUxMethod.get("TAX_SITE_NAME_CHN"))
    			  ,V_P_BIZ_REGNO           : gfnma_nvl(SBUxMethod.get("BIZ_REGNO1"))
    			  ,V_P_BIZ_CATEGORY        : gfnma_nvl(SBUxMethod.get("BIZ_CATEGORY"))
    			  ,V_P_BIZ_ITEMS           : gfnma_nvl(SBUxMethod.get("BIZ_ITEMS"))
    			  ,V_P_CHIEF_NAME          : gfnma_nvl(SBUxMethod.get("CHIEF_NAME"))
    			  ,V_P_CHIEF_SOCIALNO      : gfnma_nvl(SBUxMethod.get("CHIEF_SOCIALNO"))
    			  ,V_P_TAX_SITE_STAMP      : ''
    			  ,V_P_ZIP_CODE            : gfnma_nvl(SBUxMethod.get("ZIP_CODE"))
    			  ,V_P_ADDRESS             : gfnma_nvl(SBUxMethod.get("ADDRESS"))
    			  ,V_P_TEL                 : gfnma_nvl(SBUxMethod.get("TEL"))
    			  ,V_P_RESIDENCE_TEL       : gfnma_nvl(SBUxMethod.get("RESIDENCE_TEL"))
    			  ,V_P_CELL_PHONE          : gfnma_nvl(SBUxMethod.get("CELL_PHONE"))
    			  ,V_P_FAX                 : gfnma_nvl(SBUxMethod.get("FAX"))
    			  ,V_P_ESTABLISH_DATE      : gfnma_nvl(SBUxMethod.get("ESTABLISH_DATE"))
    			  ,V_P_CLOSE_DATE          : gfnma_nvl(SBUxMethod.get("CLOSE_DATE"))
    			  ,V_P_HOME_TAX_ID         : gfnma_nvl(SBUxMethod.get("HOME_TAX_ID"))
    			  ,V_P_VAT_OFFICE          : gfnma_multiSelectGet("#VAT_OFFICE")
    			  ,V_P_INCOME_TAX_OFFICE   : gfnma_multiSelectGet("#INCOME_TAX_OFFICE")
    			  ,V_P_VAT_EMAIL           : gfnma_nvl(SBUxMethod.get("VAT_EMAIL"))
    			  ,V_P_INCOME_TAX_EMAIL    : gfnma_nvl(SBUxMethod.get("INCOME_TAX_EMAIL"))
    			  ,V_P_DESCR               : gfnma_nvl(SBUxMethod.get("DESCR"))
    			  ,V_P_USE_YN              : gfnma_nvl(SBUxMethod.get("USE_YN").USE_YN)
    			  ,V_P_BIZ_SUBNO           : gfnma_nvl(SBUxMethod.get("BIZ_SUBNO"))
    			  ,V_P_CURRENCY_CODE       : gfnma_multiSelectGet("#CURRENCY_CODE")
    			  ,V_P_SITE_CODE           : gfnma_multiSelectGet("#SITE_CODE")
    			  ,V_P_FORM_ID             : p_formId
    			  ,V_P_MENU_ID             : p_menuId
    			  ,V_P_PROC_ID             : ''
    			  ,V_P_USERID              : p_userId
    			  ,V_P_PC                  : ''
	    };
	    const postJsonPromise = gfn_postJSON("/co/sys/org/insertOrg1100.do", {
	        getType: 'json',
	        workType: 'D',
	        cv_count: '0',
	        params: gfnma_objectToString(paramObj)
	    });
	    const data = await postJsonPromise;
	    try {
	        if (_.isEqual("S", data.resultStatus)) {
	            if (data.resultMessage) {
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
	        gfn_comAlert("E0001"); //	E0001	오류가 발생하였습니다.
	    }
	}
	
	const fn_imgUpload = async function(key, file, type) {
	    var paramData = new FormData();
	
	    paramData.append("files", file);
	    paramData.append("type", type); // 1:사진 , 2:싸인, 3:법인 로고, 4: 직인, 5: 사용인감
	    paramData.append("empCode", key); // 키값 여기서는 사업장정보 -> 사업장코드를 이용
	    paramData.append("comp_code", gv_ma_selectedApcCd);
	    paramData.append("client_code", gv_ma_selectedClntCd);
	    paramData.append("formID", p_formId);
	    paramData.append("menuId", p_menuId);
	
	    const postJsonPromise = gfn_postFormData("/com/hrImageUpload.do", paramData);
	    const data = await postJsonPromise;
	    try {
	        if (_.isEqual("S", data.resultStatus)) {
	            $("#TAX_SITE_STAMP").attr("src", "/com/getFileImage.do?fkey=" + data.imgKey + "&comp_code=" + gv_ma_selectedApcCd + "&client_code=" + gv_ma_selectedClntCd);
	        } else {
	            alert(data.resultMessage);
	        }
	    } catch (e) {
	        if (!(e instanceof Error)) {
	            e = new Error(e);
	        }
	        console.error("failed", e.message);
	        gfn_comAlert("E0001"); //	E0001	오류가 발생하였습니다.
	    }
	}
	/**
	 * @name fn_addHistoryRow
	 * @DESCRIPTION 변경이력관리 그리드 행 추가
	 * @function
	 */
	const fn_addHistoryRow = function() {
	    var rowVal = historyGrid.getRow();
	    if (rowVal == -1) { //데이터가 없고 행선택이 없을경우.
	        historyGrid.addRow(true);
	    } else {
	        historyGrid.insertRow(rowVal);
	    }
	}
	
	/**
	 * @name fn_delHistoryRow
	 * @DESCRIPTION 변경이력관리 그리드 행 삭제
	 * @function
	 */
	const fn_delHistoryRow = async function() {
	    var rowVal = historyGrid.getRow();
	    if (rowVal == -1) { //데이터가 없고 행선택이 없을경우.
	        gfn_comAlert("W0003", "행삭제"); // W0003	{0}할 대상이 없습니다.
	        return;
	    } else {
	        historyGrid.deleteRow(rowVal);
	    }
	}
	/**
	 * @name fn_saveHistoryGrid
	 * @DESCRIPTION 변경이력관리 탭 저장
	 * @function
	 */
	const fn_saveHistoryGrid = async function() {
		
		if(gfn_comConfirm("Q0001", "저장") == false){
		    return;
		}
		
	    let updatedHistoryData = historyGrid.getUpdateData(true, 'all');
	    for(var i=0; updatedHistoryData.length > i; i++){
	    	if( updatedHistoryData[i].data.APPLY_START_DATE == ''){
	    		gfn_comAlert("W0002", updatedHistoryData[i].rownum + "번 행 적용시작일"); // W0002	 {0}을/를 입력하세요.
	    		return;
	    	}
	    	if( updatedHistoryData[i].data.APPLY_END_DATE == ''){
	    		gfn_comAlert("W0002", updatedHistoryData[i].rownum + "번 행 적용종료일"); // W0002	 {0}을/를 입력하세요.
	    		return;
	    	}
	    	if( updatedHistoryData[i].data.TAX_SITE_NAME == ''){
	    		gfn_comAlert("W0002", updatedHistoryData[i].rownum + "번 행 사업장명"); // W0002	 {0}을/를 입력하세요.
	    		return;
	    	}
	    	if( updatedHistoryData[i].data.BIZ_CATEGORY == ''){
	    		gfn_comAlert("W0002", updatedHistoryData[i].rownum + "번 행 업태"); // W0002	 {0}을/를 입력하세요.
	    		return;
	    	}
	    	if( updatedHistoryData[i].data.BIZ_ITEMS == ''){
	    		gfn_comAlert("W0002", updatedHistoryData[i].rownum + "번 행 종목"); // W0002	 {0}을/를 입력하세요.
	    		return;
	    	}
	    	if( updatedHistoryData[i].data.CHIEF_NAME == ''){
	    		gfn_comAlert("W0002", updatedHistoryData[i].rownum + "번 행 대표자"); // W0002	 {0}을/를 입력하세요.
	    		return;
	    	}
	    	if( updatedHistoryData[i].data.ZIP_CODE == ''){
	    		gfn_comAlert("W0002", updatedHistoryData[i].rownum + "번 행 우편번호"); // W0002	 {0}을/를 입력하세요.
	    		return;
	    	}
	    	if( updatedHistoryData[i].data.ADDRESS == ''){
	    		gfn_comAlert("W0002", updatedHistoryData[i].rownum + "번 행 주소"); // W0002	 {0}을/를 입력하세요.
	    		return;
	    	}
	    }
	    
	    let listData = [];
	    updatedHistoryData.forEach((item, index) => {
	        const param = {
	            cv_count: '0',
	            getType: 'json',
	            rownum: item.rownum,
	            workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
	            params: gfnma_objectToString({
	            	   V_P_DEBUG_MODE_YN        : ''
            		  ,V_P_LANG_ID              : ''
            		  ,V_P_COMP_CODE            : gv_ma_selectedApcCd
            		  ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
            		  ,V_P_TAX_SITE_CODE        : gfnma_nvl(SBUxMethod.get("TAX_SITE_CODE"))
            		  ,V_P_APPLY_START_DATE     : gfnma_nvl(item.data.APPLY_START_DATE)
            		  ,V_P_APPLY_END_DATE       : gfnma_nvl(item.data.APPLY_END_DATE)
            		  ,V_P_TAX_SITE_NAME        : gfnma_nvl(item.data.TAX_SITE_NAME)
            		  ,V_P_BIZ_REGNO            : gfnma_nvl(item.data.BIZ_REGNO)
            		  ,V_P_BIZ_CATEGORY         : gfnma_nvl(item.data.BIZ_CATEGORY)
            		  ,V_P_BIZ_ITEMS            : gfnma_nvl(item.data.BIZ_ITEMS)
            		  ,V_P_CHIEF_NAME           : gfnma_nvl(item.data.CHIEF_NAME)
            		  ,V_P_CHIEF_SOCIALNO       : gfnma_nvl(item.data.CHIEF_SOCIALNO)
            		  ,V_P_ZIP_CODE             : gfnma_nvl(item.data.ZIP_CODE)
            		  ,V_P_ADDRESS              : gfnma_nvl(item.data.ADDRESS)
            		  ,V_P_ISSUE_DATE           : gfnma_nvl(item.data.ISSUE_DATE)
            		  ,V_P_ISSUE_REASON         : gfnma_nvl(item.data.ISSUE_REASON)
            		  ,V_P_MEMO                 : gfnma_nvl(item.data.MEMO)
            		  ,V_P_BIZ_SUBNO            : gfnma_nvl(item.data.BIZ_SUBNO)
            		  ,V_P_CURRENCY_CODE        : gfnma_nvl(item.data.CURRENCY_CODE)
            		  ,V_P_FORM_ID              : p_formId
            		  ,V_P_MENU_ID              : p_menuId
            		  ,V_P_PROC_ID              : ''
            		  ,V_P_USERID               : p_userId
            		  ,V_P_PC                   : ''
	            })
	        }
	        listData.push(param);
	    });
	    if (listData.length > 0) {
	        const postJsonPromise = gfn_postJSON("/co/sys/org/insertOrg1100_S1.do", { listData: listData });
	        const data = await postJsonPromise;
	        try {
	            if (_.isEqual("S", data.resultStatus)) {
	                gfn_comAlert("I0001");
	        	    fn_searchHistoryGrid(gfnma_nvl(SBUxMethod.get("TAX_SITE_CODE")), gfnma_nvl(SBUxMethod.get("TAX_SITE_NAME")), gfnma_nvl(SBUxMethod.get("BIZ_REGNO")));	                
	            } else {
	                alert(data.resultMessage);
	            }
	        } catch (e) {
	            if (!(e instanceof Error)) {
	                e = new Error(e);
	            }
	            console.error("failed", e.message);
	            gfn_comAlert("E0001"); //	E0001	오류가 발생하였습니다.
	        }
	    }
	}
	/**
	 * @name fn_addLimitRow
	 * @DESCRIPTION 발행한도관리 그리드 행 추가
	 * @function
	 */
	const fn_addLimitRow = function() {
	    var rowVal = limitGrid.getRow();
	    if (rowVal == -1) { //데이터가 없고 행선택이 없을경우.
	        limitGrid.addRow(true);
	    } else {
	        limitGrid.insertRow(rowVal);
	    }
	}
	
	/**
	 * @name fn_delLimitRow
	 * @DESCRIPTION 발행한도관리 그리드 행 삭제
	 * @function
	 */
	const fn_delLimitRow = async function() {
	    var rowVal = limitGrid.getRow();
	    if (rowVal == -1) { //데이터가 없고 행선택이 없을경우.
	        gfn_comAlert("W0003", "행삭제"); // W0003	{0}할 대상이 없습니다.
	        return;
	    } else {
	        limitGrid.deleteRow(rowVal);
	    }
	}
	/**
	 * @name fn_saveLimitGrid
	 * @DESCRIPTION 발행한도관리 탭 저장
	 * @function
	 */
	const fn_saveLimitGrid = async function() {
		if(gfn_comConfirm("Q0001", "저장") == false){
		    return;
		}
	    let updatedLimitData = limitGrid.getUpdateData(true, 'all');
	    for(var i=0; updatedLimitData.length > i; i++){
	    	if( updatedLimitData[i].data.APPLY_START_DATE == ''){
	    		gfn_comAlert("W0002", updatedLimitData[i].rownum + "번 행 적용시작일"); // W0002	 {0}을/를 입력하세요.
	    		return;
	    	}
	    	if( updatedLimitData[i].data.APPLY_END_DATE == ''){
	    		gfn_comAlert("W0002", updatedLimitData[i].rownum + "번 행 적용종료일"); // W0002	 {0}을/를 입력하세요.
	    		return;
	    	}
	    	if( updatedLimitData[i].data.ISSUE_LIMIT_MONTH == ''){
	    		gfn_comAlert("W0002", updatedLimitData[i].rownum + "번 행 월발행한도"); // W0002	 {0}을/를 입력하세요.
	    		return;
	    	}
	    	if( updatedLimitData[i].data.ISSUE_LIMIT_ONCE == ''){
	    		gfn_comAlert("W0002", updatedLimitData[i].rownum + "번 행 1회발행한도"); // W0002	 {0}을/를 입력하세요.
	    		return;
	    	}
	    }
	    
	    let listData = [];
	    updatedLimitData.forEach((item, index) => {
	        const param = {
	            cv_count: '0',
	            getType: 'json',
	            rownum: item.rownum,
	            workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
	            params: gfnma_objectToString({
	            	   V_P_DEBUG_MODE_YN        : ""
            		  ,V_P_LANG_ID              : ""
            		  ,V_P_COMP_CODE            : gv_ma_selectedApcCd
            		  ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
            		  ,V_P_TAX_SITE_CODE        : gfnma_nvl(SBUxMethod.get("TAX_SITE_CODE"))
            		  ,V_P_APPLY_START_DATE     : gfnma_nvl(item.data.APPLY_START_DATE)
            		  ,V_P_APPLY_END_DATE       : gfnma_nvl(item.data.APPLY_END_DATE)
            		  ,V_P_ISSUE_LIMIT_MONTH    : gfnma_nvl(item.data.ISSUE_LIMIT_MONTH)
            		  ,V_P_ISSUE_LIMIT_ONCE     : gfnma_nvl(item.data.ISSUE_LIMIT_ONCE)
            		  ,V_P_FORM_ID              : p_formId
            		  ,V_P_MENU_ID              : p_menuId
            		  ,V_P_PROC_ID              : ""
            		  ,V_P_USERID               : p_userId
            		  ,V_P_PC                   : ""
	            })
	        }
	        listData.push(param);
	    });
	    if (listData.length > 0) {
	        const postJsonPromise = gfn_postJSON("/co/sys/org/insertOrg1100_S2.do", { listData: listData });
	        const data = await postJsonPromise;
	        try {
	            if (_.isEqual("S", data.resultStatus)) {
	        	    fn_searchLimitGrid(gfnma_nvl(SBUxMethod.get("TAX_SITE_CODE")), gfnma_nvl(SBUxMethod.get("TAX_SITE_NAME")), gfnma_nvl(SBUxMethod.get("BIZ_REGNO")));	
	        	    gfn_comAlert("I0001");
	            } else {
	                alert(data.resultMessage);
	            }
	        } catch (e) {
	            if (!(e instanceof Error)) {
	                e = new Error(e);
	            }
	            console.error("failed", e.message);
	            gfn_comAlert("E0001"); //	E0001	오류가 발생하였습니다.
	        }
	    }
	}
	
	    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>