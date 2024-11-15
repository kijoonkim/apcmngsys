<%
/**
 * @Class Name 		: fim3100.jsp
 * @Description 	: 카드정보 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.01
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
	<title>title : 카드정보</title>
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
                    </h3><!-- 카드정보 -->
                </div>
                <div style="margin-left: auto;">
                	<sbux-button uitype="normal" text="카드정보수신" 		class="btn btn-sm btn-outline-danger" onclick="fn_callDataList"></sbux-button>
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
	                            <th scope="row" class="th_bg_search">상태(카드사기준)</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbocard-status2-p" uitype="single" jsondata-ref="jsonCbocardStatus2" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        	<td></td>
	                            
	                            <th scope="row" class="th_bg_search">카드번호</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="srch-txtcard-no-p" class="form-control input-sm" ></sbux-input>
	                            </td>
	                        	<td></td>
	                            
	                            <th scope="row" class="th_bg_search">카드명</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="srch-txtcard-name" class="form-control input-sm" ></sbux-input>
	                            </td>
	                        	<td></td>
	                            	 
	                            <th scope="row" class="th_bg_search">카드상태</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbocard-status1" uitype="single" jsondata-ref="jsonCbocardStatus1" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        	<td></td>
	                        </tr>    
	                    </tbody>
	                </table>				
				</div>
                
                <div class="row">
                    <div class="col-sm-6">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>카드리스트</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdComMsg" style="height:925px; width:100%;"></div>
                        </div>
                    </div>

                    <div id="dataArea1"  class="col-sm-6">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>기초정보</span></li>
                            </ul>
                        </div>
                        <div>
                            <table class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:20%">
                                    <col style="width:30%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">APC</th>
                                    <td colspan="3" class="td_input">
										<div class="dropdown" style="margin-right:5px" >
										    <button id="FI_ORG_CODE" style="width:200px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby="FI_ORG_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>                                    
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">카드번호</th>
                                    <td colspan="3" class="td_input">
                                        <sbux-input id="CARD_NO" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                        <sbux-input id="CARD_ID" class="form-control input-sm" uitype="hidden" ></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">카드명</th>
                                    <td colspan="3" class="td_input">
                                        <sbux-input id="CARD_NAME" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">카드사</th>
                                    <td colspan="3" class="td_input">
                                    	<div style="display:flex;float:left">
	                                        <sbux-input id="CARD_CS_CODE" class="form-control input-sm" uitype="text" style="width:120px" placeholder="코드"></sbux-input>
	                                        <font style="width:5px"></font>
	                                        <sbux-input id="CARD_CS_NAME" class="form-control input-sm" uitype="text" style="width:200px" placeholder="카드사"></sbux-input>
	                                        <font style="width:5px"></font>
											<sbux-button 
												class="btn btn-xs btn-outline-dark"
												text="…" 
												uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_compopup1"
											></sbux-button>
                                    	</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">법인개인구분</th>
                                    <td class="td_input">
										<div class="dropdown" style="margin-right:5px" >
										    <button id="BIZ_TYPE"  style="width:200px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby="BIZ_TYPE" style="width:200px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>                                    
                                    </td>
                                    <th scope="row" class="th_bg">카드용도구분</th>
                                    <td class="td_input">
										<div class="dropdown" style="margin-right:5px" >
										    <button id="CARD_USE_TYPE"  style="width:200px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby="CARD_USE_TYPE" style="width:200px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>                                    
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">발급일</th>
                                    <td class="td_input">
									    <sbux-datepicker
									            id="ISSUE_DATE"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
									    </sbux-datepicker>                          
                                    </td>
                                    <th scope="row" class="th_bg">유효기간</th>
                                    <td class="td_input">
										<sbux-datepicker
										        id="EXPIRE_YYYYMM"
										        uitype="popup"
										        datepicker-mode="month"
										        date-format="yyyy-mm"
										        style="width:80px"
										        class="form-control input-sm input-sm-ast inpt_data_reqed"
										        >
										</sbux-datepicker>                            
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">한도금액</th>
                                    <td class="td_input">
                                        <sbux-input id="LIMIT_AMT" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">해지일</th>
                                    <td class="td_input">
										<sbux-datepicker
										        id="CANCEL_DATE"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
										        >
										</sbux-datepicker>                            
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">채무계정</th>
                                    <td colspan="3" class="td_input">
                                    	<div style="display:flex;float:left">
	                                        <sbux-input id="AP_ACCOUNT_CODE" class="form-control input-sm" uitype="text" style="width:120px" placeholder="계정코드"></sbux-input>
	                                        <font style="width:5px"></font>
	                                        <sbux-input id="AP_ACCOUNT_NAME" class="form-control input-sm" uitype="text" style="width:200px" placeholder="계정명"></sbux-input>
	                                        <font style="width:5px"></font>
											<sbux-button 
												class="btn btn-xs btn-outline-dark"
												text="…"  uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_compopup2"
											></sbux-button>
                                    	</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">지급거래처</th>
                                    <td colspan="3" class="td_input">
                                    	<div style="display:flex;float:left">
	                                        <sbux-input id="PAY_CS_CODE" class="form-control input-sm" uitype="text" style="width:120px" placeholder="지급처코드"></sbux-input>
	                                        <font style="width:5px"></font>
	                                        <sbux-input id="PAY_CS_NAME" class="form-control input-sm" uitype="text" style="width:200px" placeholder="지급처명"></sbux-input>
	                                        <font style="width:5px"></font>
											<sbux-button 
												class="btn btn-xs btn-outline-dark"
												text="…"  uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_compopup3"
											></sbux-button>
                                    	</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">카드상태</th>
                                    <td class="td_input">
										<div class="dropdown" style="margin-right:5px" >
										    <button id="CARD_STATUS" style="width:200px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby="CARD_STATUS" style="width:200px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>                                    
                                    </td>
                                    <th scope="row" class="th_bg">상태(카드사기준)</th>
                                    <td class="td_input">
										<div class="dropdown" style="margin-right:5px" >
										    <button id="CARD_STATUS2" style="width:200px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby="CARD_STATUS2" style="width:200px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>                                    
                                    </td>
                                </tr>

                            </table>
                        </div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>세부코드 정보</span></li>
                            </ul>
                        </div>
                        <div>
			                <sbux-tabs id="idxTab_norm" name="tab_norm" uitype="normal"
								is-scrollable="false"
								title-target-id-array="tab1^tab2"
								title-text-array="결제/사용자정보^카드이력">
							</sbux-tabs>
		                    <div class="tab-content">
		                    
								<div id="tab1" style="height:460px;">
		                            <table class="table table-bordered tbl_fixed">
		                                <colgroup>
		                                    <col style="width:18%">
		                                    <col style="width:32%">
		                                    <col style="width:18%">
		                                    <col style="width:32%">
		                                </colgroup>
		                                <tr>
		                                    <th scope="row" class="th_bg">결제계좌(카드)</th>
		                                    <td class="td_input">
		                                        <sbux-input id="ACCOUNT_NO" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
		                                        <sbux-input id="DEPOSIT_CODE" class="form-control input-sm" uitype="hidden" ></sbux-input>
		                                    </td>
		                                    <td colspan="2" class="td_input">
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th scope="row" class="th_bg">결제은행(카드)</th>
		                                    <td class="td_input">
		                                        <sbux-input id="BANK_CODE" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
		                                    </td>
		                                    <td colspan="2" class="td_input">
		                                        <sbux-input id="BANK_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th scope="row" class="th_bg">결제계좌(지급)</th>
		                                    <td class="td_input">
		                                        <sbux-input id="PAY_BANK_ACCOUNT_NO" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
		                                    </td>
		                                    <td colspan="2" class="td_input">
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th scope="row" class="th_bg">결제은행(지급)</th>
		                                    <td colspan="3" class="td_input">
		                                    	<div style="display:flex;float:left">
			                                        <sbux-input id="PAY_BANK_CODE" class="form-control input-sm" uitype="text" style="width:120px" placeholder="코드"></sbux-input>
	                                        		<font style="width:5px"></font>
			                                        <sbux-input id="PAY_BANK_NAME" class="form-control input-sm" uitype="text" style="width:200px" placeholder="명칭"></sbux-input>
	                                        		<font style="width:5px"></font>
													<sbux-button 
														class="btn btn-xs btn-outline-dark"
														text="…"  uitype="modal"
														target-id="modal-compopup1"
														onclick="fn_compopup4"
													></sbux-button>
		                                    	</div>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th scope="row" class="th_bg">결제일</th>
		                                    <td colspan="3" class="td_input">
		                                    	<div style="display:flex;float:left">
													<div class="dropdown" style="margin-right:5px" >
													    <button id="SETTLE_DD" style="width:200px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
													    	<font>선택</font>
													        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
													    </button>
													    <div class="dropdown-menu" aria-labelledby="SETTLE_DD" style="width:200px;height:150px;padding-top:0px;overflow:auto">
													    </div>
													</div>                                    
			                                        <font style="width:10px"></font>
													<div class="dropdown" style="margin-right:5px" >
													    <button id="PAY_TERM_CODE" style="width:350px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
													    	<font>선택</font>
													        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
													    </button>
													    <div class="dropdown-menu" aria-labelledby="PAY_TERM_CODE" style="width:350px;height:150px;padding-top:0px;overflow:auto">
													    </div>
													</div>                                    
		                                    	</div>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th scope="row" class="th_bg">사업장</th>
		                                    <td colspan="3" class="td_input">
												<div class="dropdown" style="margin-right:5px" >
												    <button id="SITE_CODE" style="width:200px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												    	<font>선택</font>
												        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
												    </button>
												    <div class="dropdown-menu" aria-labelledby="SITE_CODE" style="width:200px;height:150px;padding-top:0px;overflow:auto">
												    </div>
												</div>                                    
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th scope="row" class="th_bg">부서</th>
		                                    <td colspan="3" class="td_input">
		                                    	<div style="display:flex;float:left">
			                                        <sbux-input id="DEPT_CODE" class="form-control input-sm" uitype="text" style="width:120px" placeholder="부서코드"></sbux-input>
	                                        		<font style="width:5px"></font>
			                                        <sbux-input id="DEPT_NAME" class="form-control input-sm" uitype="text" style="width:200px" placeholder="부서명"></sbux-input>
	                                        		<font style="width:5px"></font>
													<sbux-button 
														class="btn btn-xs btn-outline-dark"
														text="…"  uitype="modal"
														target-id="modal-compopup1"
														onclick="fn_compopup5"
													></sbux-button>
		                                    	</div>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th scope="row" class="th_bg">사용자</th>
		                                    <td colspan="3" class="td_input">
		                                    	<div style="display:flex;float:left">
			                                        <sbux-input id="EMP_CODE" class="form-control input-sm" uitype="text" style="width:120px" placeholder="사번"></sbux-input>
	                                        		<font style="width:5px"></font>
			                                        <sbux-input id="EMP_NAME" class="form-control input-sm" uitype="text" style="width:200px" placeholder="이름"></sbux-input>
	                                        		<font style="width:5px"></font>
													<sbux-button 
														id="SRCH_EMP_BTN"
														class="btn btn-xs btn-outline-dark"
														text="…"  uitype="modal"
														target-id="modal-compopup1"
														onclick="fn_compopup6"
													></sbux-button>
		                                    	</div>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th scope="row" class="th_bg">전표담당자</th>
		                                    <td colspan="3" class="td_input">
		                                    	<div style="display:flex;float:left">
			                                        <sbux-input id="ACCOUNT_EMP_CODE" class="form-control input-sm" uitype="text" style="width:120px" placeholder="사번"></sbux-input>
	                                        		<font style="width:5px"></font>
			                                        <sbux-input id="ACCOUNT_EMP_NAME" class="form-control input-sm" uitype="text" style="width:200px" placeholder="이름"></sbux-input>
	                                        		<font style="width:5px"></font>
													<sbux-button 
														id="SRCH_ACCOUNT_EMP_BTN"
														class="btn btn-xs btn-outline-dark"
														text="…"  uitype="modal"
														target-id="modal-compopup1"
														onclick="fn_compopup7"
													></sbux-button>
		                                    	</div>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th scope="row" class="th_bg">조회수준</th>
		                                    <td colspan="3" class="td_input">
		                                    	<div style="display:flex;float:left">
													<div class="dropdown" style="margin-right:5px" >
													    <button id="VIEW_LEVEL" style="width:200px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
													    	<font>선택</font>
													        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
													    </button>
													    <div class="dropdown-menu" aria-labelledby="VIEW_LEVEL" style="width:200px;height:150px;padding-top:0px;overflow:auto">
													    </div>
													</div>    
			                                        <font style="width:10px"></font>
			                                        <font>개인형카드회계처리</font>
			                                        <font style="width:5px"></font>
					                       			<sbux-checkbox 
					                       				id="PERSONAL_CARD_ACCT_YN" 
					                       				uitype="normal" 
					                       				text="예" 
					                       				true-value="Y" 
					                       				false-value="N" 
					                       				style="margin-top:8px"
					                       				>
					                       			</sbux-checkbox>
												</div>                                
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th scope="row" class="th_bg">조회담당자</th>
		                                    <td colspan="3" class="td_input">
		                                        <sbux-input id="VIEW_EMP_CODE" class="form-control input-sm" uitype="text" style="width:300px"></sbux-input>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th scope="row" class="th_bg">지급일</th>
		                                    <td class="td_input">
											    <sbux-datepicker
											            id="PAY_DATE"
											            uitype="popup"
											            date-format="yyyy-mm-dd"
											            class="form-control input-sm input-sm-ast inpt_data_reqed">
											    </sbux-datepicker>                          
		                                    </td>
		                                    <th scope="row" class="th_bg">회수일</th>
		                                    <td class="td_input">
											    <sbux-datepicker
											            id="RECEIVE_DATE"
											            uitype="popup"
											            date-format="yyyy-mm-dd"
											            class="form-control input-sm input-sm-ast inpt_data_reqed">
											    </sbux-datepicker>                          
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <th scope="row" class="th_bg">적요</th>
		                                    <td colspan="3" class="td_input">
		                                        <sbux-input id="DESCR" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
		                                    </td>
		                                </tr>
									</table>								
								</div>
								
								<div id="tab2" style="height:460px;">
									<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
										<font style="margin-right:auto;">카드이력등록</font>
										<a href="#" id="tab2-row-add" class="cu-btn-plus" >
											<img src="../../../resource/images/plus.png" width="20px" /> 행추가
										</a>
										<a href="#" id="tab2-row-del" class="cu-btn-minus" style="padding-left:10px">
											<img src="../../../resource/images/minus.png" width="20px" /> 행삭제
										</a>
										<a href="#" id="tab2-row-clear" class="cu-btn-clear" style="padding-left:10px">
											<img src="../../../resource/images/clear.png" width="20px" /> 초기화
										</a>
									</div>
									<div style="width:100%;height:430px;border:1px solid #f4f4f4;overflow:auto;">
										<table id="card-history-table" class="table table-bordered table-hover cu-data-table">
									        <colgroup>
												<col style="width:25%">
												<col style="width:28%">
												<col style="width:18%">
												<col style="width:5%">
												<col style="width:12%">
												<col style="width:12%">
									        </colgroup>
											<thead class="thead-light" style="background-color:#f5fbff;position:sticky;top:0;z-index:3">
												<th style="text-align:center;" >사업장</th>
												<th style="text-align:center;" >부서명</th>
												<th style="text-align:center;" >사원명</th>
												<th style="text-align:center;" ></th>
												<th style="text-align:center;" >지급일</th>
												<th style="text-align:center;" >회수일</th>
											</thead>
											<tbody style="vertical-align:middle;text-align:right !important;">
											</tbody>
									    </table>
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
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.userId}';
	//-----------------------------------------------------------

	var editType	= "N";
	
	var jsonCbocardStatus2		= [];	// 상태(카드사기준)
	var jsonCbocardStatus1		= [];	// 카드상태
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//상태(카드사기준)
			gfnma_setComSelect(['srch-cbocard-status2-p'], 	jsonCbocardStatus2, 'L_FIM008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//카드상태
			gfnma_setComSelect(['srch-cbocard-status1'], 	jsonCbocardStatus1, 'L_FIM009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
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
		            {caption: "코드",		ref: 'FI_ORG_CODE', 		width:'80px',  		style:'text-align:left'},
		            {caption: "명칭", 		ref: 'FI_ORG_NAME',    		width:'220px',  	style:'text-align:left'}
				]
			}),
			//법인개인구분
			gfnma_multiSelectInit({
				target			: ['#BIZ_TYPE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM003'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",			ref: 'SUB_CODE', 		width:'60px',  		style:'text-align:left'},
		            {caption: "카드소유구분", 	ref: 'CODE_NAME',    	width:'140px',  	style:'text-align:left'}
				]
			}),
			//카드용도구분
			gfnma_multiSelectInit({
				target			: ['#CARD_USE_TYPE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM216'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",			ref: 'SUB_CODE', 		width:'60px',  		style:'text-align:left'},
		            {caption: "코드명", 		ref: 'CODE_NAME',    	width:'140px',  	style:'text-align:left'}
				]
			}),
			//카드상태
			gfnma_multiSelectInit({
				target			: ['#CARD_STATUS']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM009'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",			ref: 'SUB_CODE', 		width:'60px',  		style:'text-align:left'},
		            {caption: "카드상태", 		ref: 'CODE_NAME',    	width:'140px',  	style:'text-align:left'}
				]
			}),
			//상태(카드사기준)
			gfnma_multiSelectInit({
				target			: ['#CARD_STATUS2']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM008'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",			ref: 'SUB_CODE', 		width:'60px',  		style:'text-align:left'},
		            {caption: "카드상태", 		ref: 'CODE_NAME',    	width:'140px',  	style:'text-align:left'}
				]
			}),
			//결제일
			gfnma_multiSelectInit({
				target			: ['#SETTLE_DD']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM010'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",			ref: 'SUB_CODE', 		width:'60px',  		style:'text-align:left'},
		            {caption: "결재일", 		ref: 'CODE_NAME',    	width:'140px',  	style:'text-align:left'}
				]
			}),
			//지급기일코드
			gfnma_multiSelectInit({
				target			: ['#PAY_TERM_CODE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_PAY_DATE'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'PAY_TERM_CODE'
				,colLabel		: 'PAY_TERM_NAME'
				,columns		:[
		            {caption: "지급기일코드",		ref: 'PAY_TERM_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "지급기일명", 		ref: 'PAY_TERM_NAME',    	width:'250px',  	style:'text-align:left'}
				]
			}),
			//사업장
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
		            {caption: "사업장코드",		ref: 'SITE_CODE', 		width:'80px',  		style:'text-align:left'},
		            {caption: "사업장명", 		ref: 'SITE_NAME',    	width:'120px',  	style:'text-align:left'}
				]
			}),
			//조회수준
			gfnma_multiSelectInit({
				target			: ['#VIEW_LEVEL']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM007'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'up' 		// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",			ref: 'SUB_CODE', 		width:'60px',  		style:'text-align:left'},
		            {caption: "조회수준", 		ref: 'CODE_NAME',    	width:'140px',  	style:'text-align:left'}
				]
			}),
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	fn_initSBSelect();
    	fn_createGrid();	
    	
		//재직상태
		gfnma_getComSelectList('L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME',
			function(list){
				$('#SRCH_EMP_BTN').click(function(){
					fn_compopup6(list);
				});
				$('#SRCH_ACCOUNT_EMP_BTN').click(function(){
					fn_compopup7(list);
				});
			}
		)
		
		$('#tab2-row-add').click(function(e){
			e.preventDefault();
			fn_tab2RowAdd();
		});
		$('#tab2-row-del').click(function(e){
			e.preventDefault();
			fn_tab2RowDel();
		});
		$('#tab2-row-clear').click(function(e){
			e.preventDefault();
			fn_tab2RowClear();
		});
    });

    /**
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#dataArea1');
    }
    
    //grid 초기화
    var Fim3100Grid; 			// 그리드를 담기위한 객체 선언
    var jsonFim3100List = []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdComMsg';
	    SBGridProperties.id 				= 'Fim3100Grid';
	    SBGridProperties.jsonref 			= 'jsonFim3100List';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["APC"],				ref: 'FI_ORG_NAME', 			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["카드번호"], 			ref: 'CARD_NO',    				type:'output',  	width:'350px',  	style:'text-align:left'},
            {caption: ["카드명"],  				ref: 'CARD_NAME', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["법인개인구분"],    		ref: 'BIZ_TYPE_NAME', 			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["카드용도구분"],			ref: 'CARD_USE_TYPE_NAME',		type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["카드상태"], 			ref: 'CARD_STATUS_NAME', 		type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["사원명"], 				ref: 'EMP_NAME',  				type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["카드상태(현대카드)"], 	ref: 'CARD_STATUS2_NAME',  		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["조회수준"],				ref: 'VIEW_LEVEL_NAME',  		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["조회담당자"], 			ref: 'VIEW_EMP_CODE',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Fim3100Grid = _SBGrid.create(SBGridProperties);
        Fim3100Grid.bind('click', 'fn_view');
    }
	
    //상세정보 보기
    function fn_view() {

    	editType = "U";    	
    	
    	var nCol = Fim3100Grid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = Fim3100Grid.getRow();
		if (nRow < 1) {
            return;
		}

        let rowData = Fim3100Grid.getRowData(nRow);
		console.log(rowData);        
        //SBUxMethod.attr('NATION_CODE',	'readonly', true);
        
        gfnma_uxDataSet('#dataArea1', rowData);
        gfnma_multiSelectSet('#FI_ORG_CODE', 		'FI_ORG_CODE', 		'FI_ORG_NAME', 		rowData.FI_ORG_CODE);
        gfnma_multiSelectSet('#BIZ_TYPE', 			'SUB_CODE', 		'CODE_NAME', 		rowData.BIZ_TYPE);
        gfnma_multiSelectSet('#CARD_USE_TYPE',		'SUB_CODE', 		'CODE_NAME', 		rowData.CARD_USE_TYPE);
        gfnma_multiSelectSet('#CARD_STATUS',		'SUB_CODE', 		'CODE_NAME', 		rowData.CARD_STATUS);
        gfnma_multiSelectSet('#CARD_STATUS2',		'SUB_CODE', 		'CODE_NAME', 		rowData.CARD_STATUS2);
        gfnma_multiSelectSet('#SETTLE_DD',			'SUB_CODE', 		'CODE_NAME', 		rowData.SETTLE_DD);
        gfnma_multiSelectSet('#PAY_TERM_CODE',		'PAY_TERM_CODE', 	'PAY_TERM_NAME', 	rowData.PAY_TERM_CODE);
        gfnma_multiSelectSet('#SITE_CODE',			'SITE_CODE', 		'SITE_NAME', 		rowData.SITE_CODE);
        gfnma_multiSelectSet('#VIEW_LEVEL',			'SUB_CODE', 		'CODE_NAME', 		rowData.VIEW_LEVEL);
        
        //gfnma_uxDisabled('#dataArea1', true);
        fn_tab2RowClear();        
    }
    
    /**
     * 목록 조회
     */
	function cfn_search() {
    	editType = "N";    	
    	gfnma_uxDataClear('#dataArea1');
		fn_setFim3100Grid('Q');
	}
    
    /**
     * 목록 가져오기
     */
    const fn_setFim3100Grid = async function(wtype) {

		Fim3100Grid.clearStatus();

		//let p_cbofi_org_code	= gfnma_nvl(SBUxMethod.get("srch-cbofi-org-code"));
		let p_txtcard_no 		= gfnma_nvl(SBUxMethod.get("srch-txtcard-no-p"));
		let p_txtcard_name 		= gfnma_nvl(SBUxMethod.get("srch-txtcard-name"));
		let p_cbocard_status1	= gfnma_nvl(SBUxMethod.get("srch-cbocard-status1"));
		let p_cbocard_status2	= gfnma_nvl(SBUxMethod.get("srch-cbocard-status2-p"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN	: ''
			,V_P_LANG_ID		: ''
			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
			,V_P_FI_ORG_CODE	: ''	
			,V_P_CARD_NO		: p_txtcard_no			
			,V_P_CARD_NAME		: p_txtcard_name			
			,V_P_CARD_ID		: ''			
			,V_P_CARD_STATUS	: p_cbocard_status1			
			,V_P_CARD_STATUS2	: p_cbocard_status2			
			,V_P_FORM_ID		: p_formId
			,V_P_MENU_ID		: p_menuId
			,V_P_PROC_ID		: ''
			,V_P_USERID			: ''
			,V_P_PC				: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fap/car/selectFim3100List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '2',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFim3100List.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						FI_ORG_CODE				: gfnma_nvl(item.FI_ORG_CODE),				//APC				--> FI_ORG_CODE_NAME (필요)		<-- L_FIM022 공통코드 조인
  						FI_ORG_NAME				: gfnma_nvl(item.FI_ORG_NAME),				//APC명			
  						CARD_NO					: gfnma_nvl(item.CARD_NO),					//카드번호
  						CARD_NAME				: gfnma_nvl(item.CARD_NAME),				//카드명
  						BIZ_TYPE				: gfnma_nvl(item.BIZ_TYPE),					//법인개인구분			--> BIZ_TYPE_NAME (필요)		<-- L_FIM003 공통코드 조인
  						BIZ_TYPE_NAME			: gfnma_nvl(item.BIZ_TYPE_NAME),			//법인개인구분명		
  						CARD_USE_TYPE			: gfnma_nvl(item.CARD_USE_TYPE),			//카드용도구분			--> CARD_USE_TYPE_NAME (필요)	<-- L_FIM216 공통코드 조인
  						CARD_USE_TYPE_NAME		: gfnma_nvl(item.CARD_USE_TYPE_NAME),		//카드용도구분명		
  						CARD_STATUS				: gfnma_nvl(item.CARD_STATUS),				//카드상태				--> CARD_STATUS_NAME (필요)		<-- L_FIM009 공통코드 조인
  						CARD_STATUS_NAME		: gfnma_nvl(item.CARD_STATUS_NAME),			//카드상태명		
  						EMP_CODE				: gfnma_nvl(item.EMP_CODE),					//사원코드
  						EMP_NAME				: gfnma_nvl(item.EMP_NAME),					//사원명
  						CARD_STATUS2			: gfnma_nvl(item.CARD_STATUS2),				//카드상태(현대카드)	--> CARD_STATUS2_NAME (필요)	<-- L_FIM008 공통코드 조인
  						CARD_STATUS2_NAME		: gfnma_nvl(item.CARD_STATUS2_NAME),		//카드상태(현대카드)명
  						VIEW_LEVEL				: gfnma_nvl(item.VIEW_LEVEL),				//조회수준				--> VIEW_LEVEL_NAME (필요)  	<-- L_FIM007 공통코드 조인
  						VIEW_LEVEL_NAME			: gfnma_nvl(item.VIEW_LEVEL_NAME),			//조회수준명
  						VIEW_EMP_CODE			: gfnma_nvl(item.VIEW_EMP_CODE),
  						
  						ACCOUNT_NO				: gfnma_nvl(item.ACCOUNT_NO),
  						AP_ACCOUNT_CODE			: gfnma_nvl(item.AP_ACCOUNT_CODE),
  						AP_ACCOUNT_NAME			: gfnma_nvl(item.AP_ACCOUNT_NAME),
  						BANK_CODE				: gfnma_nvl(item.BANK_CODE),
  						BANK_NAME				: gfnma_nvl(item.BANK_NAME),
  						CARD_CS_CODE			: gfnma_nvl(item.CARD_CS_CODE),
  						CARD_CS_NAME			: gfnma_nvl(item.CARD_CS_NAME),
  						CARD_ID					: gfnma_nvl(item.CARD_ID),
  						CARD_NAME				: gfnma_nvl(item.CARD_NAME),
  						DEPOSIT_CODE			: gfnma_nvl(item.DEPOSIT_CODE),
  						DEPT_CODE				: gfnma_nvl(item.DEPT_CODE),
  						DEPT_NAME				: gfnma_nvl(item.DEPT_NAME),
  						DESCR					: gfnma_nvl(item.DESCR),
  						EXPIRE_YYYYMM			: gfnma_nvl(item.EXPIRE_YYYYMM),
  						INSERT_TIME				: gfnma_nvl(item.INSERT_TIME),
  						ISSUE_DATE				: gfnma_nvl(item.ISSUE_DATE),
  						LIMIT_AMT				: gfnma_nvl(item.LIMIT_AMT),
  						PAY_CS_CODE				: gfnma_nvl(item.PAY_CS_CODE),
  						PAY_CS_NAME				: gfnma_nvl(item.PAY_CS_NAME),
  						PAY_DATE				: gfnma_nvl(item.PAY_DATE),
  						PAY_TERM_CODE			: gfnma_nvl(item.PAY_TERM_CODE),
  						PERSONAL_CARD_ACCT_YN	: gfnma_nvl(item.PERSONAL_CARD_ACCT_YN),
  						RECEIVE_DATE			: gfnma_nvl(item.RECEIVE_DATE),
  						SETTLE_DD				: gfnma_nvl(item.SETTLE_DD),
  						SITE_CODE				: gfnma_nvl(item.SITE_CODE),
  						CANCEL_DATE				: gfnma_nvl(item.CANCEL_DATE),
  						PAY_BANK_ACCOUNT_NO		: gfnma_nvl(item.PAY_BANK_ACCOUNT_NO),
  						PAY_BANK_CODE			: gfnma_nvl(item.PAY_BANK_CODE),
  						PAY_BANK_NAME			: gfnma_nvl(item.PAY_BANK_NAME),
  						ACCOUNT_EMP_CODE		: gfnma_nvl(item.ACCOUNT_EMP_CODE),
  						ACCOUNT_EMP_NAME		: gfnma_nvl(item.ACCOUNT_EMP_NAME)
  					}
  					jsonFim3100List.push(msg);
  					totalRecordCount ++;
  				});

        		Fim3100Grid.rebuild();
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
    
    /**
     * 신규작성
     */
    function cfn_add() {
    	
    	editType = "N";    	
    	gfnma_uxDataClear('#dataArea1');
    	fn_tab2RowClear();
    }
    
    /**
     * 저장
     */
    function cfn_save() {
    	fn_saveMast(editType);
    }
    
    /**
     * 신규저장 or 수정
     */
    const fn_saveMast = async function(wtype) {
    	
		let p_card_no	= gfnma_nvl(SBUxMethod.get("CARD_NO"));
		let p_card_name	= gfnma_nvl(SBUxMethod.get("CARD_NAME"));
    	
		if(!p_card_no){
        	gfn_comAlert("W0002", "카드번호");
        	return;
		}    	
		if(!p_card_name){
        	gfn_comAlert("W0002", "카드명");
        	return;
		}    	
		
		if(wtype=='N'){
			if(confirm("신규 저장 하시겠습니까?")){
			}else{
				return;
			}		
		} else {
			if(confirm("수정 하시겠습니까?")){
			}else{
				return;
			}		
		}
    	
	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gfnma_nvl(gv_ma_selectedCorpCd)
			,V_P_CLIENT_CODE			: gfnma_nvl(gv_ma_selectedClntCd)
			,V_P_FI_ORG_CODE      		: gfnma_nvl(gfnma_multiSelectGet("#FI_ORG_CODE"))
			,V_P_CARD_NO          		: gfnma_nvl(SBUxMethod.get("CARD_NO"))
			,V_P_CARD_NAME        		: gfnma_nvl(SBUxMethod.get("CARD_NAME"))
			,V_P_CARD_CS_CODE     		: gfnma_nvl(SBUxMethod.get("CARD_CS_CODE"))
			,V_P_BIZ_TYPE         		: gfnma_nvl(gfnma_multiSelectGet("#BIZ_TYPE"))
			,V_P_CARD_USE_TYPE    		: gfnma_nvl(gfnma_multiSelectGet("#CARD_USE_TYPE"))
			,V_P_ISSUE_DATE       		: gfnma_nvl(SBUxMethod.get("ISSUE_DATE"))
			,V_P_EXPIRE_YYYYMM    		: gfnma_nvl(SBUxMethod.get("EXPIRE_YYYYMM"))
			,V_P_LIMIT_AMT        		: gfnma_nvl(SBUxMethod.get("LIMIT_AMT"))
			,V_P_CARD_STATUS      		: gfnma_nvl(gfnma_multiSelectGet("#CARD_STATUS"))
			,V_P_CARD_STATUS2     		: gfnma_nvl(gfnma_multiSelectGet("#CARD_STATUS2"))
			,V_P_DEPOSIT_CODE     		: gfnma_nvl(SBUxMethod.get("DEPOSIT_CODE"))
			,V_P_BANK_CODE        		: gfnma_nvl(SBUxMethod.get("BANK_CODE"))
			,V_P_ACCOUNT_NO       		: gfnma_nvl(SBUxMethod.get("ACCOUNT_NO"))
			,V_P_PAY_BANK_CODE    		: gfnma_nvl(SBUxMethod.get("PAY_BANK_CODE"))
			,V_P_PAY_BANK_ACCOUNT_NO	: gfnma_nvl(SBUxMethod.get("PAY_BANK_ACCOUNT_NO"))
			,V_P_SETTLE_DD        		: gfnma_nvl(gfnma_multiSelectGet("#SETTLE_DD"))
			,V_P_SITE_CODE        		: gfnma_nvl(gfnma_multiSelectGet("#SITE_CODE"))
			,V_P_DEPT_CODE        		: gfnma_nvl(SBUxMethod.get("DEPT_CODE"))
			,V_P_EMP_CODE         		: gfnma_nvl(SBUxMethod.get("EMP_CODE"))
			,V_P_ACCOUNT_EMP_CODE 		: gfnma_nvl(SBUxMethod.get("ACCOUNT_EMP_CODE"))
			,V_P_PAY_DATE         		: gfnma_nvl(SBUxMethod.get("PAY_DATE"))
			,V_P_RECEIVE_DATE     		: gfnma_nvl(SBUxMethod.get("RECEIVE_DATE"))
			,V_P_DESCR            		: gfnma_nvl(SBUxMethod.get("DESCR"))
			,V_P_AP_ACCOUNT_CODE  		: gfnma_nvl(SBUxMethod.get("AP_ACCOUNT_CODE"))
			,V_P_PAY_TERM_CODE    		: gfnma_nvl(gfnma_multiSelectGet("#PAY_TERM_CODE"))
			,V_P_PAY_CS_CODE      		: gfnma_nvl(SBUxMethod.get("PAY_CS_CODE"))
			,V_P_CARD_ID          		: gfnma_nvl(SBUxMethod.get("CARD_ID"))
			,V_P_VIEW_LEVEL       		: gfnma_nvl(gfnma_multiSelectGet("#VIEW_LEVEL"))
			,V_P_VIEW_EMP_CODE    		: gfnma_nvl(SBUxMethod.get("VIEW_EMP_CODE"))
			,V_P_PERSONAL_CARD_ACCT_YN	: gfnma_nvl(SBUxMethod.get("PERSONAL_CARD_ACCT_YN")['PERSONAL_CARD_ACCT_YN'])	//checkbox
			,V_P_FORM_ID				: gfnma_nvl(p_formId)
			,V_P_MENU_ID				: gfnma_nvl(p_menuId)
			,V_P_PROC_ID				: ''
			,V_P_USERID					: ''
			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fap/car/saveFim3100Mast.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");
                fn_saveDetail('S');
  				//cfn_search();  				
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
     * 카드이력 저장 팝업
     */
    const fn_saveDetail = async function(wtype) {
    
    	var cnt		= 0
    	var chkList = [];
    	$('#card-history-table').find('tbody').find('tr').each(function(){
    		cnt ++;
    		chkList.push({
    			'SEQ'			: cnt
    			,'SITE_CODE'	: $(this).find('input[name=SITE_CODE]').val()
    			,'DEPT_CODE'	: $(this).find('input[name=DEPT_CODE]').val()
    			,'EMP_CODE'		: $(this).find('input[name=EMP_CODE]').val()
    			,'PAY_DATE'		: $(this).find('input[name=PAY_DATE]').val()
    			,'RECEIVE_DATE'	: $(this).find('input[name=RECEIVE_DATE]').val()
    			,'rownum'		: cnt
    		});
    	});
    	
		if(cnt==0){
        	return;
		}    	
		
		//서버 전송 리스트
        let listData = [];
    	for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i];
            const param = {
                    cv_count	: '0',
                    getType		: 'json',
                    rownum		: obj.rownum,
                    workType	: wtype,
                    params		: gfnma_objectToString({
                        V_P_DEBUG_MODE_YN			: '',
                        V_P_LANG_ID					: '',
                        V_P_COMP_CODE				: gv_ma_selectedCorpCd,
                        V_P_CLIENT_CODE				: gv_ma_selectedClntCd,
                        V_P_CARD_NO					: obj.CARD_NO,
                        V_P_SEQ						: obj.SEQ,
                        V_P_SITE_CODE				: obj.SITE_CODE,
                        V_P_DEPT_CODE				: obj.DEPT_CODE,
                        V_P_EMP_CODE				: obj.EMP_CODE,
                        V_P_PAY_DATE				: obj.PAY_DATE,
                        V_P_RECEIVE_DATE			: obj.RECEIVE_DATE,
                        V_P_FORM_ID					: p_formId,
                        V_P_MENU_ID					: p_menuId,
                        V_P_PROC_ID					: '',
                        V_P_USERID					: '',
                        V_P_PC						: ''
                    })
            	}			
            listData.push(param);
    	}	

        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/fi/fap/car/saveFim3100Detail.do", {listData: listData});

            const data = await postJsonPromise;
            console.log('data:', data);
            try {
                if (_.isEqual("S", data.resultStatus)) {
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
    
    /**
     * 카드사 팝업
     */
    var fn_compopup1 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("CARD_CS_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("CARD_CS_NAME"));
        var replaceText0 	= "_SUB_CODE_";
        var replaceText1 	= "_CODE_NAME_";
        var strWhereClause 	= "AND EXTRA_FIELD1 LIKE '%" + replaceText0 + "%' AND CODE_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '카드사');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FIM053'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 		"명칭"]
   			,searchInputFields		: ["SUB_CODE", 	"CODE_NAME"]
   			,searchInputValues		: [searchText1, searchText2]
    		,width					: '500px'
    		,height					: '300px'
   			,tableHeader			: ["코드", 		"카드사"]
   			,tableColumnNames		: ["SUB_CODE", 	"CODE_NAME"]
			,tableColumnWidths		: ["150px", 	"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('CARD_CS_CODE', 	data.SUB_CODE);
				SBUxMethod.set('CARD_CS_NAME', 	data.CODE_NAME);
			},
    	});
  	}    
    
    /**
     * 채무계정 팝업
     */
    var fn_compopup2 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("AP_ACCOUNT_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("AP_ACCOUNT_NAME"));
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_";
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '채무계정');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["계정코드", 		"계정명"]
   			,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,searchInputValues		: [searchText1, 	searchText2]
    		,width					: '500px'
    		,height					: '300px'
   			,tableHeader			: ["계정코드", 		"계정명"]
   			,tableColumnNames		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,tableColumnWidths		: ["150px", 		"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('AP_ACCOUNT_CODE', 	data.ACCOUNT_CODE);
				SBUxMethod.set('AP_ACCOUNT_NAME', 	data.ACCOUNT_NAME);
			},
    	});
  	}    
    
    /**
     * 지급거래처 팝업
     */
    var fn_compopup3 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("PAY_CS_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("PAY_CS_NAME"));
        var replaceText0 	= "_SUB_CODE_";
        var replaceText1 	= "_CODE_NAME_";
        var strWhereClause 	= "AND SUB_CODE LIKE '%" + replaceText0 + "%' AND CODE_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '지급거래처');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_CS_CARD_PAY'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["지급처코드", 		"지급처명"]
   			,searchInputFields		: ["SUB_CODE", 			"CODE_NAME"]
   			,searchInputValues		: [searchText1, 		searchText2]
    		,width					: '500px'
    		,height					: '300px'
   			,tableHeader			: ["지급처코드", 		"지급처명"]
   			,tableColumnNames		: ["SUB_CODE", 			"CODE_NAME"]
   			,tableColumnWidths		: ["150px", 			"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('PAY_CS_CODE', 	data.SUB_CODE);
				SBUxMethod.set('PAY_CS_NAME', 	data.CODE_NAME);
			},
    	});
  	}    
    
    /**
     * 결제은행(지급) 팝업
     */
    var fn_compopup4 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("PAY_BANK_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("PAY_BANK_NAME"));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_NAME_";
        var strWhereClause 	= "AND CODE LIKE '%" + replaceText0 + "%' AND NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '결제은행(지급)');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_BANK_CODE'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 			"명칭"]
   			,searchInputFields		: ["CODE", 			"NAME"]
   			,searchInputValues		: [searchText1, 	searchText2]
    		,width					: '500px'
    		,height					: '300px'
   			,tableHeader			: ["코드", 			"명칭"]
   			,tableColumnNames		: ["CODE", 			"NAME"]
   			,tableColumnWidths		: ["150px", 		"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('PAY_BANK_CODE', 	data.CODE);
				SBUxMethod.set('PAY_BANK_NAME', 	data.NAME);
			},
    	});
  	}    
    
    /**
     * 부서 팝업
     */
    var fn_compopup5 = function() {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("DEPT_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("DEPT_NAME"));
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
				console.log('callback data:', data);
				SBUxMethod.set('DEPT_CODE', 	data.DEPT_CODE);
				SBUxMethod.set('DEPT_NAME', 	data.DEPT_NAME);
			},
    	});
  	}    
    
    /**
     * 사용자 팝업
     */
    var fn_compopup6 = function(list) {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("EMP_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("EMP_NAME"));
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
       		,searchCaptions			: ["부서명", 		"사원코드",		"사원명",		"재직상태"]
   			,searchInputFields		: ["DEPT_NAME", 	"EMP_CODE",		"EMP_NAME",		"EMP_STATE"]
   			,searchInputValues		: ["",				searchText1, 	searchText2,	""]
			,searchInputTypes		: ["input", 		"input",		"input",		"select"]			//input, select가 있는 경우
   			,searchInputTypeValues	: ["", 				"",				"",				list]				//select 경우
    		,width					: '700px'
    		,height					: '300px'
   			,tableHeader			: ["사번", 			"이름",		"부서",			"사업장"]
   			,tableColumnNames		: ["EMP_CODE", 		"EMP_NAME",	"DEPT_NAME",	"SITE_NAME"]
   			,tableColumnWidths		: ["150px", 		"150px",	"200px",		"200px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('EMP_CODE', 	data.EMP_CODE);
				SBUxMethod.set('EMP_NAME', 	data.EMP_NAME);
			},
    	});
  	}    
    
    /**
     * 전표담당자 팝업
     */
    var fn_compopup7 = function(list) {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("ACCOUNT_EMP_CODE"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("ACCOUNT_EMP_NAME"));
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
       		,searchCaptions			: ["부서명", 		"사원코드",		"사원명",		"재직상태"]
   			,searchInputFields		: ["DEPT_NAME", 	"EMP_CODE",		"EMP_NAME",		"EMP_STATE"]
   			,searchInputValues		: ["",				searchText1, 	searchText2,	""]
			,searchInputTypes		: ["input", 		"input",		"input",		"select"]			//input, select가 있는 경우
   			,searchInputTypeValues	: ["", 				"",				"",				list]				//select 경우
    		,width					: '700px'
    		,height					: '300px'
   			,tableHeader			: ["사번", 			"이름",		"부서",			"사업장"]
   			,tableColumnNames		: ["EMP_CODE", 		"EMP_NAME",	"DEPT_NAME",	"SITE_NAME"]
   			,tableColumnWidths		: ["150px", 		"150px",	"200px",		"200px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('ACCOUNT_EMP_CODE', 	data.EMP_CODE);
				SBUxMethod.set('ACCOUNT_EMP_NAME', 	data.EMP_NAME);
			},
    	});
  	}    
    
    /**
     * 카드정보수신
     */
    const fn_callDataList = async function() {
    	
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: ''
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fap/car/selectFim3100CardInfo.do", {
        	getType				: 'json',
        	workType			: 'Interface',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {
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
    
    /**
     * 행추가
     */
    var fn_tab2RowAdd = function() {
    	var htm = '';
    	htm +=	'<tr>';
    	htm +=	'<input type="hidden" name="SITE_CODE">';
    	htm +=	'<input type="hidden" name="DEPT_CODE">';
    	htm +=	'<input type="hidden" name="EMP_CODE">';
    	htm +=	'<input type="hidden" name="PAY_DATE" 		value="' + gfnma_date().substr(0,8) + '">';
    	htm +=	'<input type="hidden" name="RECEIVE_DATE" 	value="' + gfnma_date().substr(0,8) + '">';
    	htm +=	'<td></td>';
    	htm +=	'<td></td>';
    	htm +=	'<td></td>';
    	htm +=	'<td>';
    	htm +=	'<button class="btn btn-xs btn-outline-danger">찾기</button>';
    	htm +=	'</td>';
    	htm +=	'<td>' + gfnma_date4() + '</td>';
    	htm +=	'<td>' + gfnma_date4() + '</td>';
    	htm +=	'</tr>';
    	
    	var tar = $('#card-history-table').find('tbody');
    	tar.append(htm);
    	
		tar.find('tr').off('click');
		tar.find('tr').click(function(){
		     if($(this).hasClass("cu-table-selected")){
		        $(this).removeClass('cu-table-selected');
		     } else {
		        $(this).addClass('cu-table-selected').siblings().removeClass('cu-table-selected');
		     }
		});			
    	
		tar.find('tr').find('button').off('click');
		tar.find('tr').find('button').click(function(e){
			e.stopPropagation();
			var tarTr = $(this).closest('tr');
	        var searchText 		= "";
	        var replaceText0 	= "_EMP_CODE_";
	        var replaceText1 	= "_EMP_NAME_"; 
	        var strWhereClause 	= "AND X.EMP_CODE LIKE '%" + replaceText0 + "%' AND X.EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE = 'WORK'";
	    	SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
			SBUxMethod.openModal('modal-compopup1');
	    	compopup1({
	    		compCode				: gv_ma_selectedCorpCd
	    		,clientCode				: gv_ma_selectedClntCd
	    		,bizcompId				: 'P_HRI001_ESS'
	           	,popupType				: 'A'
	    		,whereClause			: strWhereClause
	   			,searchCaptions			: ["사번", 		"사원명"]
	   			,searchInputFields		: ["EMP_CODE", 	"EMP_NAME"]
	   			,searchInputValues		: ["", 			searchText]
	    		,height					: '400px'
	   			,tableHeader			: ["사번", "직원명", "부서코드", "부서명", "사업장명","직위명"]
	   			,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_CODE", "DEPT_NAME","SITE_NAME","POSITION_NAME"]
	   			,tableColumnWidths		: ["80px", "80px", "80px", "120px", "120px", "100px"]
				,itemSelectEvent		: function (data){
					console.log('callback data:', data);
					console.log(tarTr);
					tarTr.find('td').eq(0).html(data.SITE_NAME);
					tarTr.find('td').eq(1).html(data.DEPT_NAME);
					tarTr.find('td').eq(2).html(data.EMP_NAME);
					tarTr.find('[name=EMP_CODE]').val(data.EMP_CODE);
				}
	    	});
		});			
    }
    
    /**
     * 행삭제
     */
    var fn_tab2RowDel = function() {
    	$('#card-history-table').find('tbody').find('.cu-table-selected').remove();
    }
    
    /**
     * 초기화
     */
    var fn_tab2RowClear = function() {
    	$('#card-history-table').find('tbody').html('');
    }
        
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>