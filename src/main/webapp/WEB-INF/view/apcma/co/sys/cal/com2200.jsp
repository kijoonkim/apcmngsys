<%
/**
 * @Class Name 		: com2200.jsp
 * @Description 	: 기간정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.06.20
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.06.20   	천용진		최초 생성
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
	<title>title : 기간정보</title>
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
                            <th scope="row" class="th_bg">회기</th>
                            <td class="td_input" colspan="" style="border-right:hidden;">
								<div class="dropdown">
								    <button 
								    	style="width:160px;text-align:left" 
								    	class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
								    	uitype="normal"
								    	id="SRCH_FISCAL_NO" 
								    	data-toggle="dropdown" 
								    	aria-haspopup="true" 
								    	aria-expanded="false">
								    	<font>선택</font>
								        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
								    </button>
								    <div class="dropdown-menu" aria-labelledby=SRCH_FISCAL_NO style="width:500px;height:200px;padding-top:0px;overflow:auto">
								    </div>
								</div>                             
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>                            
                            <th scope="row" class="th_bg">기간코드</th>
                            <td class="td_input" colspan="" style="border-right:hidden;">
                                <sbux-input id="SRCH_PERIOD_CODE" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>                            
                            <th scope="row" class="th_bg">기간명</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="SRCH_PERIOD_NAME" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
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
                        <div style="display: flex;align-items: center;gap:5px;margin-bottom:5px;">
	              		    <p style="font-size:13px;">현업 OPEN</p>
							<sbux-datepicker id="WORKPERIODFROM" name="WORKPERIODFROM" uitype="popup" datepicker-mode="month" style="width:80px;height:28px;"></sbux-datepicker>
							<sbux-datepicker id="WORKPERIODTO" name="WORKPERIODTO" uitype="popup" datepicker-mode="month" style="width:80px;height:28px;"></sbux-datepicker>
						    <sbux-button 
						    	style="text-align:center; vertical-align:middle;" 
						    	class="btn btn-sm btn-light" 
						    	uitype="normal"
						    	id="WORKPERIODOPEN" 
						    	name="WORKPERIODOPEN" 
						    	text="일괄개설"
						    	onclick="fn_workPeriodOpen()">
						    </sbux-button >
	              		    <p style="font-size:13px;margin-left:1rem;">담당자 OPEN</p>
							<sbux-datepicker id="CONTRACTPERIODFROM" name="CONTRACTPERIODFROM" uitype="popup" datepicker-mode="month" style="width:80px;height:28px;"></sbux-datepicker>
							<sbux-datepicker id="CONTRACTPERIODTO" name="CONTRACTPERIODTO" uitype="popup" datepicker-mode="month" style="width:80px;height:28px;"></sbux-datepicker>
						    <sbux-button 
						    	style="text-align:center; vertical-align:middle;" 
						    	class="btn btn-sm btn-light" 
						    	uitype="normal"
						    	id="CONTRACTPERIODOPEN" 
						    	name="CONTRACTPERIODOPEN" 
						    	text="일괄개설"
						    	onclick="fn_ContractPeriodOpen()">
						    </sbux-button >
                        </div>
                        <div>
                            <div id="sb-area-grdCom2200" style="height:600px; width:100%;"></div>
                        </div>
                    </div>
	                <sbux-tabs id="idxTab_norm" name="tab_norm" uitype="normal"
						is-scrollable="false"
						title-target-id-array="tab1^tab2^tab3^tab4"
						title-text-array="기초정보^FCM현업사용자마감^FCM담당자마감^SCM마감">
					</sbux-tabs>

                    <div class="col-sm-6 tab-content">
						<div id="tab1" style="height:560px;">
                            <table id="dataArea1" class="table table-bordered tbl_fixed"  >
                                <colgroup>
                                    <col style="width:25%">
                                    <col style="width:25%">
                                    <col style="width:25%">
                                    <col style="width:25%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">기간코드</th>
                                    <td class="td_input">
                                        <sbux-input id="PERIOD_CODE1" class="form-control input-sm inpt_data_reqed" uitype="text"  style="width:100%"  readonly></sbux-input>
                                    </td>
                                    <th id="PERIOD_STATUS_TH" scope="row" class="th_bg">상태</th>
                                    <td id="PERIOD_STATUS_TD" class="td_input ">
                                        <sbux-input id="PERIOD_STATUS" class="form-control input-sm hidden" uitype="text"  style="width:100%"  readonly></sbux-input>
                                        <sbux-input id="PERIOD_NAME_CHN" class="form-control input-sm hidden" uitype="text"  style="width:100%"  readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">기간명</th>
                                    <td class="td_input " colspan="3" >
                                        <sbux-input id="PERIOD_NAME1" class="form-control input-sm inpt_data_reqed" uitype="text"  style="width:100%"  readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">회기</th>
                                    <td class="td_input">
                        				<sbux-select id="FISCAL_NO1" uitype="single" jsondata-ref="jsonFiscalNo1" unselected-text="선택" class="form-control input-sm" readonly></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">년도</th>
                                    <td colspan="" class="td_input ">
										<sbux-datepicker id="PERIOD_YYYY" name="PERIOD_YYYY" uitype="popup" datepicker-mode="year" readonly></sbux-datepicker>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">분기</th>
                                    <td class="td_input">
                        				<sbux-select id="PERIOD_QUARTER" uitype="single" jsondata-ref="jsonPeriodQuarter" unselected-text="선택" class="form-control input-sm" readonly></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">정렬순서</th>
									<td class="td_input " style="border-right: hidden;">
		   								<sbux-input uitype="text" id="SORT_SEQ" class="form-control input-sm inpt_data_reqed" readonly></sbux-input>
									</td>                                    
                                </tr>                       
                                <tr>
                                    <th scope="row" class="th_bg">시작일자</th>
									<td class="td_input " style="border-right: hidden;">
										<sbux-datepicker id="START_DATE" name="START_DATE" uitype="popup" datepicker-mode="day" readonly></sbux-datepicker>
									</td>
                                    <th scope="row" class="th_bg">종료일자</th>
									<td class="td_input" style="border-right: hidden;">
										<sbux-datepicker id="END_DATE" name="END_DATE" uitype="popup" datepicker-mode="day" readonly></sbux-datepicker>
									</td>
                                </tr>
                                <tr>
									<th scope="row" class="th_bg">적요</th>
									<td class="td_input" style="border-right;" hidden; colspan="3">
		   								<sbux-input uitype="text" id="DESCRIPTION" class="form-control input-sm" readonly></sbux-input>
									</td>
                                </tr>
                            </table>
                        </div>
						<div id="tab2" style="height:560px;">
						<div style="display: inline-block; margin: 0 5px;  float: right;">
						   <sbux-button 
						    	style="text-align:center; vertical-align:middle;"  
						    	class="btn btn-sm btn-light" 
						    	uitype="normal"
						    	id="WORKOPEN" 
						    	name="WORKOPEN" 
						    	text="일괄개설"
						    	button-color="blue"
						    	onclick="fn_btnWorkOpen()">
						    </sbux-button >
						   <sbux-button 
						    	style="text-align:center; vertical-align:middle;"  
						    	class="btn btn-sm btn-light" 
						    	uitype="normal"
						    	id="WORKCLOSE" 
						    	name="WORKCLOSE" 
						    	text="일괄마감"
						    	button-color="red"
						    	onclick="fn_btnWorkClose()">
						    </sbux-button >
						</div>						
                            <table id="dataArea2" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:33%">
                                    <col style="width:33%">
                                    <col style="width:34%">
                                </colgroup>
                                <tr>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light" 
									    	uitype="normal"
									    	id="WORKAP" 
									    	name="WORKAP" 
									    	text="채무관리"
									    	onclick="fn_workClick('WORKAP')">
									    </sbux-button >
                                    </td>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light" 
									    	uitype="normal"
									    	id="WORKAR" 
									    	name="WORKAR" 
									    	text="채권관리"
									    	onclick="fn_workClick('WORKAR')">
									    </sbux-button >   
                                    </td>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light" 
									    	uitype="normal"
									    	id="WORKFA" 
									    	name="WORKFA" 
									    	text="자산관리"
									    	onclick="fn_workClick('WORKFA')"
									    </sbux-button >  
                                    </td>
                                </tr>             
                                <tr>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light" 
									    	uitype="normal"
									    	id="WORKTR" 
									    	name="WORKTR" 
									    	text="자금관리"
									    	onclick="fn_workClick('WORKTR')">
									    </sbux-button >
                                    </td>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light"
									    	uitype="normal"
									    	id="WORKGL"
									    	name="WORKGL"
									    	text="원장관리"
									    	onclick="fn_workClick('WORKGL')">
									    </sbux-button >   
                                    </td>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light"
									    	uitype="normal"
									    	id="WORKBG"
									    	name="WORKBG"
									    	text="예산관리"
									    	onclick="fn_workClick('WORKBG')">
									    </sbux-button >  
                                    </td>
                                </tr>                 
                            </table>
                        </div>                        
						<div id="tab3" style="height:560px;">
						<div style="display: inline-block; margin: 0 5px;  float: right;">
						   <sbux-button 
						    	style="text-align:center; vertical-align:middle;" 
						    	class="btn btn-sm btn-light" 
						    	uitype="normal"
						    	id="CONTRACTOPEN" 
						    	name="CONTRACTOPEN" 
						    	text="일괄개설"
						    	button-color="blue"
						    	onclick="fn_btnContractOpen()">
						    </sbux-button >
						   <sbux-button 
						    	style="text-align:center; vertical-align:middle;" 
						    	class="btn btn-sm btn-light" 
						    	uitype="normal"
						    	id="CONTRACTCLOSE" 
						    	name="CONTRACTCLOSE" 
						    	text="일괄마감"
						    	button-color="red"
						    	onclick="fn_btnContractClose()">
						    </sbux-button >
						</div>						
                            <table id="dataArea3" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:33%">
                                    <col style="width:33%">
                                    <col style="width:34%">
                                </colgroup>
                                <tr>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light" 
									    	uitype="normal"
									    	id="AP" 
									    	name="AP" 
									    	text="채무관리"
									    	onclick="fn_contractClick('AP')">
									    </sbux-button >
                                    </td>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light" 
									    	uitype="normal"
									    	id="AR" 
									    	name="AR" 
									    	text="채권관리"
									    	onclick="fn_contractClick('AR')">
									    </sbux-button >   
                                    </td>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light" 
									    	uitype="normal"
									    	id="FA" 
									    	name="FA" 
									    	text="자산관리"
									    	onclick="fn_contractClick('FA')">
									    </sbux-button >  
                                    </td>
                                </tr>             
                                <tr>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light" 
									    	uitype="normal"
									    	id="TR" 
									    	name="TR" 
									    	text="자금관리"
									    	onclick="fn_contractClick('TR')"
									    </sbux-button >
                                    </td>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light"
									    	uitype="normal"
									    	id="GL"
									    	name="GL"
									    	text="총계정원장관리"
									    	onclick="fn_contractClick('GL')">
									    </sbux-button >   
                                    </td>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light"
									    	uitype="normal"
									    	id="BG"
									    	name="BG"
									    	text="예산관리"
									    	onclick="fn_contractClick('BG')">
									    </sbux-button >  
                                    </td>
                                </tr>                 
                                <tr>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light" 
									    	uitype="normal"
									    	id="HR" 
									    	name="HR" 
									    	text="인사관리"
									    	onclick="fn_contractClick('HR')">
									    </sbux-button >
                                    </td>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light"
									    	uitype="normal"
									    	id="CO"
									    	name="CO"
									    	text="원가관리"
									    	onclick="fn_contractClick('CO')">
									    </sbux-button >   
                                    </td>
                                </tr>                 
                            </table>
                        </div>                        
						<div id="tab4" style="height:560px;">
                            <table id="dataArea4" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:33%">
                                    <col style="width:33%">
                                    <col style="width:34%">
                                </colgroup>
                                <tr>
                                    <td class="td_input">
									    <sbux-button
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;" 
									    	class="btn btn-sm btn-light" 
									    	uitype="normal"
									    	id="MM" 
									    	name="MM" 
									    	text="구매"
									    	onclick="fn_apClick('MM')">
									    </sbux-button >
                                    </td>
                                    <td class="td_input">
									    <sbux-button
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;"
									    	class="btn btn-sm btn-light"
									    	uitype="normal"
									    	id="IV"
									    	name="IV"
									    	text="재고"
									    	onclick="fn_apClick('IV')">
									    </sbux-button >   
                                    </td>
                                    <td class="td_input">
									    <sbux-button
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;display: none;"
									    	class="btn btn-sm btn-light"
									    	uitype="normal"
									    	id="DM" 
									    	name="DM" 
									    	text="출하"
									    	onclick="fn_apClick('DM')">
									    </sbux-button >  
                                    </td>
                                </tr>             
                                <tr>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;display: none;"
									    	class="btn btn-sm btn-light" 
									    	uitype="normal"
									    	id="SR" 
									    	name="SR" 
									    	text="스크랩구매"
									    	onclick="fn_apClick('SR')">
									    </sbux-button >
                                    </td>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;display: none;"
									    	class="btn btn-sm btn-light"
									    	uitype="normal"
									    	id="RM"
									    	name="RM"
									    	text="원료"
									    	onclick="fn_apClick('RM')">
									    </sbux-button >   
                                    </td>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;display: none;"
									    	class="btn btn-sm btn-light"
									    	uitype="normal"
									    	id="PP"
									    	name="PP"
									    	text="생산"
									    	onclick="fn_apClick('PP')">
									    </sbux-button >  
                                    </td>
                                </tr>                 
                                <tr>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;display: none;"
									    	class="btn btn-sm btn-light" 
									    	uitype="normal"
									    	id="PI" 
									    	name="PI" 
									    	text="제강/단강"
									    	onclick="fn_apClick('PI')">
									    </sbux-button >
                                    </td>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;display: none;"
									    	class="btn btn-sm btn-light"
									    	uitype="normal"
									    	id="PF"
									    	name="PF"
									    	text="단조/가공"
									    	onclick="fn_apClick('PF')">
									    </sbux-button >   
                                    </td>
                                    <td class="td_input">
									    <sbux-button 
									    	style="text-align:center; vertical-align:middle; height:80px; width:100%;display: none;"
									    	class="btn btn-sm btn-light"
									    	uitype="normal"
									    	id="UT"
									    	name="UT"
									    	text="유틸리티"
									    	onclick="fn_apClick('UT')">
									    </sbux-button >   
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
	var jsonPeriodQuarter = []; // 분기
	var jsonFiscalNo1 = []; 	// 회기
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_initSBSelect();
    	fn_createGrid();
    	cfn_search()
    });
	// 신규
	function cfn_add() {
	}
	
	// 그룹코드 내역, 세부코드 정보 저장
	function cfn_save() {
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
    var masterGrid; 			// 그리드를 담기위한 객체 선언
    var jsonMasterList 	= []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdCom2200';
	    SBGridProperties.id 				= 'masterGrid';
	    SBGridProperties.jsonref 			= 'jsonMasterList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'free';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption : ["기간","년도"],					ref: 'PERIOD_YYYY', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ["기간","기간코드"],				ref: 'PERIOD_CODE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ["기간","기간명"],					ref: 'PERIOD_NAME',				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ["FCM현업","FCMFCM현업마감모듈"],	ref: 'WORK_CLOSE_CNT',			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ["FCM현업","FCM현업마감여부"],		ref: 'WORK_CLOSE_STATUS',		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ["FCM담당자","FCM담당자마감모듈"],	ref: 'CONTRACT_CLOSE_CNT',		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ["FCM담당자","FCM담당자마감여부"],	ref: 'CONTRACT_CLOSE_STATUS',	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ["SCM","SCM마감모듈"],				ref: 'SCM_CLOSE_CNT',			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ["SCM","SCM마감여부"],				ref: 'SCM_CLOSE_STATUS',		type:'output',  	width:'150px',  	style:'text-align:left'}
        ];
        masterGrid	= _SBGrid.create(SBGridProperties);
        masterGrid.bind('click', 'fn_view');
    }
    
    /*
     * 현업OPEN 일괄개설
     */
    const fn_workPeriodOpen = async function(){
    	
    	if( gfnma_nvl(SBUxMethod.get("WORKPERIODFROM")) == '' || gfnma_nvl(SBUxMethod.get("WORKPERIODTO")) == '' ){
    		gfn_comAlert("W0002", "기간정보");
    		return;
    	}
    	
        $('#dataArea2 button').each(function() {
            const tagetId = $(this).attr('id');
            fn_workClick( tagetId , '2');
        });
    	
    }
    
    /*
     * 현업OPEN 일괄개설
     */
    const fn_ContractPeriodOpen = async function(){
    	
    	if( gfnma_nvl(SBUxMethod.get("CONTRACTPERIODFROM")) == '' || gfnma_nvl(SBUxMethod.get("CONTRACTPERIODTO")) == '' ){
    		gfn_comAlert("W0002", "기간정보");
    		return;
    	}
    	
        $('#dataArea3 button').each(function() {
            const tagetId = $(this).attr('id');
            fn_contractClick( tagetId , '2');
        });
    	
    }
    /*
    * FCM현업사용자마감 일괄개설
    */
    const fn_btnWorkOpen = async function() {
		
        var APColor     = $("#AP").css('color');
        var ARColor     = $("#AR").css('color');
        var FAColor     = $("#FA").css('color');
        var TRColor     = $("#TR").css('color');
        var GLColor     = $("#GL").css('color');
        var BGColor     = $("#BG").css('color');

        var WORKAPColor = $("#WORKAP").css('color');
        var WORKARColor = $("#WORKAR").css('color');
        var WORKFAColor = $("#WORKFA").css('color');
        var WORKTRColor = $("#WORKTR").css('color');
        var WORKGLColor = $("#WORKGL").css('color');
        var WORKBGColor = $("#WORKBG").css('color');
    	
        if (APColor == 'rgb(0, 0, 255)' && WORKAPColor == 'rgb(255, 0, 0)'  || WORKAPColor == 'rgb(0, 255, 0)'){
        	fn_workClick('WORKAP');
        }
        if (ARColor == 'rgb(0, 0, 255)' && WORKARColor == 'rgb(255, 0, 0)'  || WORKARColor == 'rgb(0, 255, 0)'){
        	fn_workClick('WORKAR');
        }
        if (FAColor == 'rgb(0, 0, 255)' && WORKFAColor == 'rgb(255, 0, 0)'  || WORKFAColor == 'rgb(0, 255, 0)'){
        	fn_workClick('WORKFA');
        }
        if (TRColor == 'rgb(0, 0, 255)' && WORKTRColor == 'rgb(255, 0, 0)'  || WORKTRColor == 'rgb(0, 255, 0)'){
        	fn_workClick('WORKTR');
        }
        if (GLColor == 'rgb(0, 0, 255)' && WORKGLColor == 'rgb(255, 0, 0)'  || WORKGLColor == 'rgb(0, 255, 0)'){
        	fn_workClick('WORKGL');
        }
        if (BGColor == 'rgb(0, 0, 255)' && WORKBGColor == 'rgb(255, 0, 0)'  || WORKBGColor == 'rgb(0, 255, 0)'){
        	fn_workClick('WORKBG');
        }
    }
    /*
    * FCM현업사용자마감 일괄마감
    */
    const fn_btnWorkClose = async function() {
		

        var WORKAPColor = $("#WORKAP").css('color');
        var WORKARColor = $("#WORKAR").css('color');
        var WORKFAColor = $("#WORKFA").css('color');
        var WORKTRColor = $("#WORKTR").css('color');
        var WORKGLColor = $("#WORKGL").css('color');
        var WORKBGColor = $("#WORKBG").css('color');
    	
        if (WORKAPColor == 'rgb(0, 0, 255)'  || WORKAPColor == 'rgb(0, 255, 0)'){
        	fn_workClick('WORKAP');
        }
        if (WORKARColor == 'rgb(0, 0, 255)'  || WORKARColor == 'rgb(0, 255, 0)'){
        	fn_workClick('WORKAR');
        }
        if (WORKFAColor == 'rgb(0, 0, 255)'  || WORKFAColor == 'rgb(0, 255, 0)'){
        	fn_workClick('WORKFA');
        }
        if (WORKTRColor == 'rgb(0, 0, 255)'  || WORKTRColor == 'rgb(0, 255, 0)'){
        	fn_workClick('WORKTR');
        }
        if (WORKGLColor == 'rgb(0, 0, 255)'  || WORKGLColor == 'rgb(0, 255, 0)'){
        	fn_workClick('WORKGL');
        }
        if (WORKBGColor == 'rgb(0, 0, 255)'  || WORKBGColor == 'rgb(0, 255, 0)'){
        	fn_workClick('WORKBG');
        }
    }
    /*
    * FCM현업사용자마감 저장
    */
    const fn_workClick = async function( target, type) {
    	
		var nRow 		= masterGrid.getRow();
		var rowData 	= masterGrid.getRowData(nRow);
		
		var targetColor	= $('#' + target).css('color');
		var workType 	= '';
    	var startDate	= gfnma_nvl(SBUxMethod.get("START_DATE"));
    	var endDate		= gfnma_nvl(SBUxMethod.get("END_DATE"));
    	
    	if(targetColor == 'rgb(0, 0, 255)'){
    		workType = 'WORK_CLOSE';
    	}else if(targetColor == 'rgb(255, 0, 0)'){
    		workType = 'WORK_OPEN';
    	}
		
    	if(type == '2'){
    		workType 	= 'WORK_OPEN_P';
    		startDate	= gfnma_nvl(SBUxMethod.get("WORKPERIODFROM"));
    		endDate		= gfnma_nvl(SBUxMethod.get("WORKPERIODTO"));
    	}
    	
    	var saveParamObj = {
    			V_P_DEBUG_MODE_YN      : ''
   				,V_P_LANG_ID           : ''
   				,V_P_COMP_CODE         : gv_ma_selectedApcCd
   				,V_P_CLIENT_CODE       : gv_ma_selectedClntCd
   				,V_P_PERIOD_CODE       : gfnma_nvl(SBUxMethod.get("PERIOD_CODE1"))
   				,V_P_PERIOD_NAME       : gfnma_nvl(SBUxMethod.get("PERIOD_NAME1"))
   				,V_P_PERIOD_NAME_CHN   : gfnma_nvl(SBUxMethod.get("PERIOD_NAME_CHN"))
   				,V_P_FISCAL_NO         : gfnma_nvl(SBUxMethod.get("FISCAL_NO1"))
   				,V_P_PERIOD_STATUS     : gfnma_nvl(SBUxMethod.get("PERIOD_STATUS"))
   				,V_P_DESCRIPTION       : gfnma_nvl(SBUxMethod.get("DESCRIPTION"))
   				,V_P_PERIOD_YYYY       : gfnma_nvl(SBUxMethod.get("PERIOD_YYYY"))
   				,V_P_PERIOD_QUARTER    : gfnma_nvl(SBUxMethod.get("PERIOD_QUARTER"))
   				,V_P_SORT_SEQ          : gfnma_nvl(SBUxMethod.get("SORT_SEQ"))
   				,V_P_START_DATE        : startDate
   				,V_P_END_DATE          : endDate
   				,V_P_ATTR1             : ''
   				,V_P_ATTR2             : ''
   				,V_P_ATTR3             : ''
   				,V_P_ATTR4             : ''
   				,V_P_ATTR5             : ''
   				,V_P_ATTR6             : ''
   				,V_P_ATTR7             : ''
   				,V_P_ATTR8             : ''
   				,V_P_ATTR9             : ''
   				,V_P_ATTR10            : ''
   				,V_P_USE_YN            : 'Y'
   				,V_P_SUB_MODULE        : target.replace('WORK', '')
   				,V_P_FORM_ID           : p_formId
   				,V_P_MENU_ID           : p_menuId
   				,V_P_PROC_ID           : ''
   				,V_P_USERID            : p_userId
   				,V_P_PC                : ''
   	    };	
        const postJsonPromise = gfn_postJSON('/co/sys/cal/updateCom2200.do', {
	       	getType				: 'json',
	       	workType			: workType,
	       	cv_count			: '0',
	       	params				: gfnma_objectToString(saveParamObj)
 		});    	 
         const saveData = await postJsonPromise;
         try {
         	if (_.isEqual("S", saveData.resultStatus)) {
         		if(saveData.resultMessage){
 	          		alert(saveData.resultMessage);
         		}
         		fn_viewSubGrid(rowData);
         	} else {
           		alert(saveData.resultMessage);
         	}
         } catch (e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
         	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
         }	
    }
    
    /*
     * FCM담당자마감 일괄개설
     */
     const fn_btnContractOpen = async function() {
 		
         var APColor     = $("#AP").css('color');
         var ARColor     = $("#AR").css('color');
         var FAColor     = $("#FA").css('color');
         var TRColor     = $("#TR").css('color');
         var GLColor     = $("#GL").css('color');
         var BGColor     = $("#BG").css('color');
         var HRColor     = $("#HR").css('color');
         var COColor     = $("#CO").css('color');

         if (APColor == 'rgb(255, 0, 0)' || APColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('AP');
         }
         if (ARColor == 'rgb(255, 0, 0)' || ARColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('AR');
         }
         if (FAColor == 'rgb(255, 0, 0)' || FAColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('FA');
         }
         if (TRColor == 'rgb(255, 0, 0)' || TRColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('TR');
         }
         if (GLColor == 'rgb(255, 0, 0)' || GLColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('GL');
         }
         if (BGColor == 'rgb(255, 0, 0)' || BGColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('BG');
         }
         if (HRColor == 'rgb(255, 0, 0)' || HRColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('HR');
         }
         if (COColor == 'rgb(255, 0, 0)' || COColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('CO');
         }
     }
     /*
     * FCM담당자마감 일괄마감
     */
     const fn_btnContractClose = async function() {
    	 
         var APColor     = $("#AP").css('color');
         var ARColor     = $("#AR").css('color');
         var FAColor     = $("#FA").css('color');
         var TRColor     = $("#TR").css('color');
         var GLColor     = $("#GL").css('color');
         var BGColor     = $("#BG").css('color');
         var HRColor     = $("#HR").css('color');
         var COColor     = $("#CO").css('color');

         var WORKAPColor = $("#WORKAP").css('color');
         var WORKARColor = $("#WORKAR").css('color');
         var WORKFAColor = $("#WORKFA").css('color');
         var WORKTRColor = $("#WORKTR").css('color');
         var WORKGLColor = $("#WORKGL").css('color');
         var WORKBGColor = $("#WORKBG").css('color');

         if (APColor == 'rgb(0, 0, 255)' && WORKAPColor == 'rgb(255, 0, 0)'  || WORKAPColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('AP');
         }
         if (ARColor == 'rgb(0, 0, 255)' && WORKARColor == 'rgb(255, 0, 0)'  || WORKARColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('AR');
         }
         if (FAColor == 'rgb(0, 0, 255)' && WORKFAColor == 'rgb(255, 0, 0)'  || WORKFAColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('FA');
         }
         if (TRColor == 'rgb(0, 0, 255)' && WORKTRColor == 'rgb(255, 0, 0)'  || WORKTRColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('TR');
         }
         if (GLColor == 'rgb(0, 0, 255)' && WORKGLColor == 'rgb(255, 0, 0)'  || WORKGLColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('GL');
         }
         if (BGColor == 'rgb(0, 0, 255)' && WORKBGColor == 'rgb(255, 0, 0)'  || WORKBGColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('BG');
         }
         if (HRColor == 'rgb(0, 0, 255)' || GLColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('HR');
         }
         if (COColor == 'rgb(0, 0, 255)' || BGColor == 'rgb(0, 255, 0)'){
        	 fn_contractClick('CO');
         }
     }    
    
    
    /*
    * FCM담당자마감 저장
    */
    const fn_contractClick = async function(target, type) {
    	
		var nRow 		= masterGrid.getRow();
		var rowData 	= masterGrid.getRowData(nRow);
		var targetColor	= $('#' + target).css('color');
		var workType 	= '';
		var startDate 	= gfnma_nvl(SBUxMethod.get("START_DATE"));
		var endDate 	= gfnma_nvl(SBUxMethod.get("END_DATE"));
    	
    	if(targetColor == 'rgb(0, 0, 255)'){
    		workType = 'CLOSE';
    	}else if(targetColor == 'rgb(255, 0, 0)'){
    		workType = 'OPEN';
    	}
    	
    	if(type == '2'){
    		workType 	= 'OPEN_P';
    		startDate	= gfnma_nvl(SBUxMethod.get("CONTRACTPERIODFROM"));
    		endDate		= gfnma_nvl(SBUxMethod.get("CONTRACTPERIODTO"));
    	}
    	
		if(targetColor == 'rgb(0, 0, 255)' && 
			$('#WORK'+target).css('color') == 'rgb(0, 0, 255)' &&
			type != '2')
		{
			gfn_comAlert("Q0000", "현업사용자 마감을 먼저 해야합니다.");
			return;
		}
    	
    	var saveParamObj = {
    			V_P_DEBUG_MODE_YN      : ''
   				,V_P_LANG_ID           : ''
   				,V_P_COMP_CODE         : gv_ma_selectedApcCd
   				,V_P_CLIENT_CODE       : gv_ma_selectedClntCd
   				,V_P_PERIOD_CODE       : gfnma_nvl(SBUxMethod.get("PERIOD_CODE1"))
   				,V_P_PERIOD_NAME       : gfnma_nvl(SBUxMethod.get("PERIOD_NAME1"))
   				,V_P_PERIOD_NAME_CHN   : gfnma_nvl(SBUxMethod.get("PERIOD_NAME_CHN"))
   				,V_P_FISCAL_NO         : gfnma_nvl(SBUxMethod.get("FISCAL_NO1"))
   				,V_P_PERIOD_STATUS     : gfnma_nvl(SBUxMethod.get("PERIOD_STATUS"))
   				,V_P_DESCRIPTION       : gfnma_nvl(SBUxMethod.get("DESCRIPTION"))
   				,V_P_PERIOD_YYYY       : gfnma_nvl(SBUxMethod.get("PERIOD_YYYY"))
   				,V_P_PERIOD_QUARTER    : gfnma_nvl(SBUxMethod.get("PERIOD_QUARTER"))
   				,V_P_SORT_SEQ          : gfnma_nvl(SBUxMethod.get("SORT_SEQ"))
   				,V_P_START_DATE        : startDate
   				,V_P_END_DATE          : endDate
   				,V_P_ATTR1             : ''
   				,V_P_ATTR2             : ''
   				,V_P_ATTR3             : ''
   				,V_P_ATTR4             : ''
   				,V_P_ATTR5             : ''
   				,V_P_ATTR6             : ''
   				,V_P_ATTR7             : ''
   				,V_P_ATTR8             : ''
   				,V_P_ATTR9             : ''
   				,V_P_ATTR10            : ''
   				,V_P_USE_YN            : 'Y'
   				,V_P_SUB_MODULE        : target
   				,V_P_FORM_ID           : p_formId
   				,V_P_MENU_ID           : p_menuId
   				,V_P_PROC_ID           : ''
   				,V_P_USERID            : p_userId
   				,V_P_PC                : ''
   	    };	
        const postJsonPromise = gfn_postJSON('/co/sys/cal/updateCom2200.do', {
	       	getType				: 'json',
	       	workType			: workType,
	       	cv_count			: '0',
	       	params				: gfnma_objectToString(saveParamObj)
 		});    	 
         const saveData = await postJsonPromise;
         try {
         	if (_.isEqual("S", saveData.resultStatus)) {
         		if(saveData.resultMessage){
 	          		alert(saveData.resultMessage);
         		}
         		fn_viewSubGrid(rowData);
         	} else {
           		alert(saveData.resultMessage);
         	}
         } catch (e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
         	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
         }	    	
    
    }
    /*
    * SCM마감 저장
    */
    const fn_apClick = async function(target) {
    	var nRow 		= masterGrid.getRow();
		var rowData 	= masterGrid.getRowData(nRow);
		var targetColor	= $('#' + target).css('color');
		var workType 	= '';
		var startDate 	= gfnma_nvl(SBUxMethod.get("START_DATE"));
		var endDate 	= gfnma_nvl(SBUxMethod.get("END_DATE"));
    	
    	if(targetColor == 'rgb(0, 0, 255)'){
    		workType = 'CLOSE';
    	} else {
    		workType = 'OPEN';
    	}
    	
    	var saveParamObj = {
    			V_P_DEBUG_MODE_YN      : ''
   				,V_P_LANG_ID           : ''
   				,V_P_COMP_CODE         : gv_ma_selectedApcCd
   				,V_P_CLIENT_CODE       : gv_ma_selectedClntCd
   				,V_P_PERIOD_CODE       : gfnma_nvl(SBUxMethod.get("PERIOD_CODE1"))
   				,V_P_PERIOD_NAME       : gfnma_nvl(SBUxMethod.get("PERIOD_NAME1"))
   				,V_P_PERIOD_NAME_CHN   : gfnma_nvl(SBUxMethod.get("PERIOD_NAME_CHN"))
   				,V_P_FISCAL_NO         : gfnma_nvl(SBUxMethod.get("FISCAL_NO1"))
   				,V_P_PERIOD_STATUS     : gfnma_nvl(SBUxMethod.get("PERIOD_STATUS"))
   				,V_P_DESCRIPTION       : gfnma_nvl(SBUxMethod.get("DESCRIPTION"))
   				,V_P_PERIOD_YYYY       : gfnma_nvl(SBUxMethod.get("PERIOD_YYYY"))
   				,V_P_PERIOD_QUARTER    : gfnma_nvl(SBUxMethod.get("PERIOD_QUARTER"))
   				,V_P_SORT_SEQ          : gfnma_nvl(SBUxMethod.get("SORT_SEQ"))
   				,V_P_START_DATE        : startDate
   				,V_P_END_DATE          : endDate
   				,V_P_ATTR1             : ''
   				,V_P_ATTR2             : ''
   				,V_P_ATTR3             : ''
   				,V_P_ATTR4             : ''
   				,V_P_ATTR5             : ''
   				,V_P_ATTR6             : ''
   				,V_P_ATTR7             : ''
   				,V_P_ATTR8             : ''
   				,V_P_ATTR9             : ''
   				,V_P_ATTR10            : ''
   				,V_P_USE_YN            : 'Y'
   				,V_P_SUB_MODULE        : target
   				,V_P_FORM_ID           : p_formId
   				,V_P_MENU_ID           : p_menuId
   				,V_P_PROC_ID           : ''
   				,V_P_USERID            : p_userId
   				,V_P_PC                : ''
   	    };	
        const postJsonPromise = gfn_postJSON('/co/sys/cal/updateCom2200.do', {
	       	getType				: 'json',
	       	workType			: workType,
	       	cv_count			: '0',
	       	params				: gfnma_objectToString(saveParamObj)
 		});    	 
         const saveData = await postJsonPromise;
         try {
         	if (_.isEqual("S", saveData.resultStatus)) {
         		if(saveData.resultMessage){
 	          		alert(saveData.resultMessage);
         		}
         		fn_viewSubGrid(rowData);
         	} else {
           		alert(saveData.resultMessage);
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
     * 코드목록 조회
     */
    const fn_search = async function() {

    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	
    	let SRCH_FISCAL_NO		= gfnma_multiSelectGet('#SRCH_FISCAL_NO') 
    	let SRCH_PERIOD_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_PERIOD_CODE"));
    	let SRCH_PERIOD_NAME	= gfnma_nvl(SBUxMethod.get("SRCH_PERIOD_NAME"));
    	
    	var paramObj = {
    		    V_P_DEBUG_MODE_YN       : ''
	    	   ,V_P_LANG_ID             : ''
	    	   ,V_P_COMP_CODE           : gv_ma_selectedApcCd
	    	   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
	    	   ,V_P_FISCAL_NO         	: SRCH_FISCAL_NO
	    	   ,V_P_PERIOD_CODE        	: SRCH_PERIOD_CODE
	    	   ,V_P_PERIOD_NAME        	: SRCH_PERIOD_NAME
	    	   ,V_P_FORM_ID             : p_formId
	    	   ,V_P_MENU_ID             : p_menuId
	    	   ,V_P_PROC_ID             : ''
	    	   ,V_P_USERID              : p_userId
	    	   ,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/cal/selectCom2200.do", {
			getType				: 'json',
			workType			: 'Q',
			cv_count			: '3',
			params				: gfnma_objectToString(paramObj)
		});
    	const data = await postJsonPromise;
    	
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
	    		
	
	    	   	/** @type {number} **/
	    		let totalRecordCount = 0;
	 
	    		masterGrid.length = 0;
	    	   	data.cv_1.forEach((item, index) => {
		    		const msg = {
		    				PERIOD_CODE					: item.PERIOD_CODE,
		    				PERIOD_NAME					: item.PERIOD_NAME,
		    				FISCAL_NO					: item.FISCAL_NO,
		    				PERIOD_STATUS				: item.PERIOD_STATUS,
		    				DESCRIPTION					: item.DESCRIPTION,
		    				PERIOD_YYYY					: item.PERIOD_YYYY,
		    				PERIOD_QUARTER				: item.PERIOD_QUARTER,
		    				SORT_SEQ					: item.SORT_SEQ,
		    				START_DATE					: item.START_DATE,
		    				END_DATE					: item.END_DATE,
		    				PERIOD_NAME_CHN				: item.PERIOD_NAME_CHN,
		    				WORK_CLOSE_CNT				: item.WORK_CLOSE_CNT,
		    				WORK_CLOSE_STATUS			: item.WORK_CLOSE_STATUS,
		    				CONTRACT_CLOSE_CNT			: item.CONTRACT_CLOSE_CNT,
		    				CONTRACT_CLOSE_STATUS		: item.CONTRACT_CLOSE_STATUS,
		    				SCM_CLOSE_CNT				: item.SCM_CLOSE_CNT,
		    				SCM_CLOSE_STATUS			: item.SCM_CLOSE_STATUS
		    		}
		    		jsonMasterList.push(msg);
		    		totalRecordCount ++;
		    	});
	    	   	masterGrid.rebuild();
	    	   	document.querySelector('#listCount').innerText = totalRecordCount;
	
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
			//회기
			gfnma_multiSelectInit({
				target			: ['#SRCH_FISCAL_NO']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIG007'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'FISCAL_NO'
				,colLabel		: 'FISCAL_PERIOD'
				,columns		:[
		            {caption: "회기",		ref: 'FISCAL_NO', 		width:'100px',  	style:'text-align:left'},
		            {caption: "회기기간", 	ref: 'FISCAL_PERIOD',  	width:'250px',  	style:'text-align:left'},
		            {caption: "종료년월",		ref: 'YYYYMM_TO',    	width:'150px',  	style:'text-align:left'}
				]
			}),
			
			//기초정보 - 회기
            gfnma_setComSelect(['FISCAL_NO1'], jsonFiscalNo1, 'L_FIG007', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FISCAL_NO', 'FISCAL_PERIOD', 'Y', ''),
			//기초정보 - 분기
            gfnma_setComSelect(['PERIOD_QUARTER'], jsonPeriodQuarter, 'L_COM021', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	
		]);
	}
    
    /**
     * @name fn_clearForm
     * @DESCRIPTION 그리드 및 화면 초기화
     * @param 
     */
    const fn_clearForm = function() {
		
    	//코드목록 
    	jsonMasterList = [];
    	
    	//기본정보
    	SBUxMethod.set("PERIOD_CODE1", 		    "");
    	SBUxMethod.set("PERIOD_NAME1", 	    	"");
    	SBUxMethod.set("PERIOD_YYYY", 	    	"");
    	SBUxMethod.set("SORT_SEQ", 	   		 	"");
    	SBUxMethod.set("START_DATE", 		 	"");
    	SBUxMethod.set("END_DATE", 		 		"");
    	SBUxMethod.set("DESCRIPTION", 		 	"");
		gfnma_multiSelectSet('#FISCAL_NO1', 	'', '', '');
		gfnma_multiSelectSet('#PERIOD_QUARTER', 	'', '', '');
		
    }
    
    // 그리드 삭제
    const fn_delete = async function(){

    	if(gfnma_nvl(SBUxMethod.get("PERIOD_CODE1")) == ''){
    		gfn_comAlert("W0001", "삭제할 기간정보"); 
    		return;
    	}
    	if(confirm("기간코드를 삭제하시겠습니까?")) {
	  	    var paramObj = {
	    			V_P_DEBUG_MODE_YN      : ''
	   				,V_P_LANG_ID           : ''
	   				,V_P_COMP_CODE         : gv_ma_selectedApcCd
	   				,V_P_CLIENT_CODE       : gv_ma_selectedClntCd
	   				,V_P_PERIOD_CODE       : gfnma_nvl(SBUxMethod.get("PERIOD_CODE1"))
	   				,V_P_PERIOD_NAME       : gfnma_nvl(SBUxMethod.get("PERIOD_NAME1"))
	   				,V_P_PERIOD_NAME_CHN   : gfnma_nvl(SBUxMethod.get("PERIOD_NAME_CHN"))
	   				,V_P_FISCAL_NO         : gfnma_nvl(SBUxMethod.get("FISCAL_NO1"))
	   				,V_P_PERIOD_STATUS     : gfnma_nvl(SBUxMethod.get("PERIOD_STATUS"))
	   				,V_P_DESCRIPTION       : gfnma_nvl(SBUxMethod.get("DESCRIPTION"))
	   				,V_P_PERIOD_YYYY       : gfnma_nvl(SBUxMethod.get("PERIOD_YYYY"))
	   				,V_P_PERIOD_QUARTER    : gfnma_nvl(SBUxMethod.get("PERIOD_QUARTER"))
	   				,V_P_SORT_SEQ          : gfnma_nvl(SBUxMethod.get("SORT_SEQ"))
	   				,V_P_START_DATE        : gfnma_nvl(SBUxMethod.get("START_DATE"))
	   				,V_P_END_DATE          : gfnma_nvl(SBUxMethod.get("END_DATE"))
	   				,V_P_ATTR1             : ''
	   				,V_P_ATTR2             : ''
	   				,V_P_ATTR3             : ''
	   				,V_P_ATTR4             : ''
	   				,V_P_ATTR5             : ''
	   				,V_P_ATTR6             : ''
	   				,V_P_ATTR7             : ''
	   				,V_P_ATTR8             : ''
	   				,V_P_ATTR9             : ''
	   				,V_P_ATTR10            : ''
	   				,V_P_USE_YN            : 'Y'
	   				,V_P_SUB_MODULE        : ''
	   				,V_P_FORM_ID           : p_formId
	   				,V_P_MENU_ID           : p_menuId
	   				,V_P_PROC_ID           : ''
	   				,V_P_USERID            : p_userId
	   				,V_P_PC                : ''
	 	    };	
	  	    
	        const postJsonPromise = gfn_postJSON("/co/sys/cal/deleteCom2200.do", {
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
    	
    	
    }

    //서브 그리드
    function fn_view() {
    	var nCol = masterGrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = masterGrid.getRow();
		if (nRow < 1) {
            return;
		}
		
		let rowData = masterGrid.getRowData(nRow);
    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	fn_viewSubGrid(rowData);
    }
    
    const fn_viewSubGrid = async function(rowData) {

    	var paramObj = {
    		    V_P_DEBUG_MODE_YN       : ''
	    	   ,V_P_LANG_ID             : ''
	    	   ,V_P_COMP_CODE           : gv_ma_selectedApcCd
	    	   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
	    	   ,V_P_FISCAL_NO         	: ''
	    	   ,V_P_PERIOD_CODE        	: rowData.PERIOD_CODE
	    	   ,V_P_PERIOD_NAME        	: ''
	    	   ,V_P_FORM_ID             : p_formId
	    	   ,V_P_MENU_ID             : p_menuId
	    	   ,V_P_PROC_ID             : ''
	    	   ,V_P_USERID              : p_userId
	    	   ,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/cal/selectCom2200.do", {
			getType				: 'json',
			workType			: 'DETAIL',
			cv_count			: '3',
			params				: gfnma_objectToString(paramObj)
		});
    	const subData = await postJsonPromise;
    	try {
	    	if (_.isEqual("S", subData.resultStatus)) {

				//기초정보
				$('#PERIOD_STATUS_TH').hide();
				$('#PERIOD_STATUS_TD').hide();
				SBUxMethod.set("PERIOD_CODE1", 		rowData.PERIOD_CODE);
				SBUxMethod.set("PERIOD_NAME1", 		rowData.PERIOD_NAME);
				SBUxMethod.set("PERIOD_NAME_CHN", 	rowData.PERIOD_NAME_CHN);
				SBUxMethod.set("PERIOD_YYYY", 		rowData.PERIOD_YYYY);
				SBUxMethod.set("PERIOD_STATUS", 	rowData.PERIOD_STATUS);
				SBUxMethod.set("SORT_SEQ", 			rowData.SORT_SEQ);
				SBUxMethod.set("START_DATE", 		rowData.START_DATE);
				SBUxMethod.set("END_DATE", 			rowData.END_DATE);
				SBUxMethod.set("DESCRIPTION", 		rowData.DESCRIPTION);
	            gfnma_setComSelect(['FISCAL_NO1'], jsonFiscalNo1, 'L_FIG007', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FISCAL_NO', 'FISCAL_PERIOD', 'Y', rowData.FISCAL_NO);
	            gfnma_setComSelect(['PERIOD_QUARTER'], jsonPeriodQuarter, 'L_COM021', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', rowData.PERIOD_QUARTER);

				for(var i = 0; subData.cv_2.length > i; i++){
					
					var strbtntxt 	= '';
					var strbtntxt1 	= '';
					var strsubmodule = subData.cv_2[i].SUB_MODULE;
					
					strbtntxt = subData.cv_2[i].SUB_MODULE_NAME;
					strbtntxt += "\n";
					
					if(subData.cv_2[i].SCM_YN =='Y'){
						
						strbtntxt += "FCM : " + gfnma_nvl(subData.cv_2[i].F_PERIOD_STATUS);
						strbtntxt += "\n";
						strbtntxt += "SCM : " + gfnma_nvl(subData.cv_2[i].PERIOD_STATUS);
					}else{
						strbtntxt1 += strbtntxt;
						strbtntxt1 += "Due : " + gfnma_nvl(subData.cv_2[i].PLAN_CLOSE_DATE_FIELD);;
						strbtntxt1 += "\n";
						strbtntxt1 += gfnma_nvl(subData.cv_2[i].PERIOD_STATUS_FIELD);;
						strbtntxt += "Due : " + gfnma_nvl(subData.cv_2[i].PLAN_CLOSE_DATE);
						strbtntxt += "\n";
						strbtntxt += gfnma_nvl(subData.cv_2[i].PERIOD_STATUS);
						
					}
					
					if(subData.cv_2[i].SCM_YN =='Y'){
						
						if(gfnma_nvl(subData.cv_2[i].F_PERIOD_STATUS) == 'CLOSE'){
							$('#' + strsubmodule).css('color','red')
						}else if(gfnma_nvl(subData.cv_2[i].F_PERIOD_STATUS) == 'FUTURE'){
							$('#' + strsubmodule).css('color','green')
						}else{
							$('#' + strsubmodule).css('color','blue')
						}
						
					}else{
						if(gfnma_nvl(subData.cv_2[i].PERIOD_STATUS) == 'CLOSE'){
							$('#' + strsubmodule).css('color','red')
						}else if(gfnma_nvl(subData.cv_2[i].PERIOD_STATUS) == 'FUTURE'){
							$('#' + strsubmodule).css('color','green')
						}else{
							$('#' + strsubmodule).css('color','blue')
						}
                        if (strsubmodule == "AR" || 
                        		strsubmodule == "AP" || 
                        		strsubmodule == "TR" || 
                        		strsubmodule == "FA" || 
                        		strsubmodule == "BG" || 
                        		strsubmodule == "GL"
                        	){
    						if(gfnma_nvl(subData.cv_2[i].PERIOD_STATUS_FIELD) == 'CLOSE'){
    							$('#WORK' + strsubmodule).css('color','red')
    						}else if(gfnma_nvl(subData.cv_2[i].PERIOD_STATUS_FIELD) == 'FUTURE'){
    							$('#WORK' + strsubmodule).css('color','green')
    						}else{
    							$('#WORK' + strsubmodule).css('color','blue')
    						}
    						if(gfnma_nvl(subData.cv_2[i].CLOSE_DATE_FIELD) != ''){
                                strbtntxt1 += "\n";
                                strbtntxt1 += gfnma_nvl(subData.cv_2[i].CLOSE_DATE_FIELD);

    						}
    						//초기화
    						$('#WORK' + strsubmodule).html("");
    						//줄바꿈 스타일
    						$('#WORK' + strsubmodule).css('white-space','pre-line');
    						//텍스트 입력
    						$('#WORK' + strsubmodule).html(strbtntxt1);
    						
                        }
					}
					if(gfnma_nvl(subData.cv_2[i].CLOSE_DATE) != ''){
						strbtntxt += "\n";
						strbtntxt += gfnma_nvl(subData.cv_2[i].CLOSE_DATE);
					}
					//초기화
					$('#' + strsubmodule).html("");
					//줄바꿈 스타일
					$('#' + strsubmodule).css('white-space','pre-line');					
					//텍스트 입력
					$('#' + strsubmodule).html(strbtntxt);
				}	
    		} else {
    	  		alert(subData.resultMessage);
    		}

    	} catch (e) {
        	if (!(e instanceof Error)) {
        		e = new Error(e);
        	}
        	console.error("failed", e.message);
       		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
       	}
    }
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>