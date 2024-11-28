<%
/**
 * @Class Name 		: fig2210_99.jsp
 * @Description 	: 전표등록 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.29
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.07.29   	장성주		최초 생성
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
	<title>title : 전표등록</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
	
	<style type="text/css">
	</style>
	
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid" style="border-radius:0px">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 전표등록 -->
                </div>
                <div id="top_lable1" style="margin-left:auto">
                	<!-- 
                    <font style="font-size:11px">전표템플릿</font>
                	 -->
                </div>
                <div id="top_lable2" style="padding-left:10px;padding-right:10px">
                	<!-- 
					<div class="dropdown">
					    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="srch-compopup1-rulecode" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    	원가마감전표
					        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
					    </button>
					    <div class="dropdown-menu" aria-labelledby="srch-compopup1-rulecode" style="width:600px;height:150px;padding-top:0px;overflow:auto">
					    </div>
					</div> 
                	 -->
                </div>
                <div>
        			<sbux-checkbox 
        				id="srh-cost-class-check-yn" 
        				uitype="normal" 
        				text="원가유형제한" 
        				true-value="Y" 
        				false-value="N" 
       				></sbux-checkbox>
                    <font style="margin-right:10px"></font>
                    <!-- 
                    <sbux-button uitype="normal" text="SCM정보"  		id="sch-btn-scm" 			class="btn btn-sm btn-outline-danger" onclick="fn_btnScmInfo"></sbux-button>
                    <sbux-button uitype="normal" text="파일첨부"  		id="sch-btn-attach" 		class="btn btn-sm btn-outline-danger" onclick="fn_attach"></sbux-button>
                     -->
                    <sbux-button uitype="normal" text="부서·적요수정"  	id="sch-btn-descUpdate" 	class="btn btn-sm btn-outline-danger" onclick="fn_descUpdate"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="전표복사"  		id="sch-btn-copy" 			class="btn btn-sm btn-outline-danger" onclick="fn_docCopy"></sbux-button>
                    <!-- 
                    <sbux-button uitype="normal" text="결재"  			id="sch-btn-submit" 		class="btn btn-sm btn-outline-danger" onclick="fn_submit"></sbux-button>
                     -->
                    <sbux-button uitype="normal" text="결재이력"  		id="sch-btn-confirmHist" 	class="btn btn-sm btn-outline-danger" onclick="fn_confimHist"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="전기처리"  		id="sch-btn-end" 			class="btn btn-sm btn-outline-danger" onclick="fn_docEnd"></sbux-button>
                    <sbux-button uitype="normal" text="전기취소"  		id="sch-btn-cancel" 		class="btn btn-sm btn-outline-danger" onclick="fn_docCancel"></sbux-button>
                    <sbux-button uitype="normal" text="보류해제"  		id="sch-btn-release" 		class="btn btn-sm btn-outline-danger" onclick="fn_docRelease"></sbux-button>
                    <sbux-button uitype="normal" text="보류지정"  		id="sch-btn-unrelease" 		class="btn btn-sm btn-outline-danger" onclick="fn_docUnRelease"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="역분개취소"  	id="sch-btn-reverseCancel" 	class="btn btn-sm btn-outline-danger" onclick="fn_docReverseCancel"></sbux-button>
                    <sbux-button uitype="normal" text="출력"  			id="sch-btn-print" 			class="btn btn-sm btn-outline-danger" onclick="fn_btnPrint"></sbux-button>
                </div>
            </div>
            <div class="box-body">

				<div class="box-search-ma" >
	                <!--[pp] 검색 -->
					<!--[APC] START -->
						<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
					<!--[APC] END -->
				</div>
				
				<div>	
	                <table id="srchArea1" class="table table-bordered tbl_fixed">
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
	                    
                           	<!-- hidden  -->
                       		<sbux-select id="sch-hold-flag" 			name="sch-hold-flag" 				style="display:none;" uitype="single" 	jsondata-ref="jsonHoldFlag" unselected-text="선택" class="form-control input-sm"></sbux-select>
  							<sbux-input  id="sch-release-date"  		name="sch-release-date" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-insert-userid"  		name="sch-insert-userid" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-reverse-flag"  		name="sch-reverse-flag" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txtopen-to-fcm-yn" 	name="sch-txtopen-to-fcm-yn" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-confirm-emp-code" 		name="sch-confirm-emp-code" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-temp-doc-num" 			name="sch-temp-doc-num" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							
  							<sbux-input  id="sch-hold-date" 			name="sch-hold-date" 				style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-release-user" 			name="sch-release-user" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-hold-user" 			name="sch-hold-user" 				style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
                       		<sbux-select id="sch-hold-reason" 			name="sch-hold-reason" 				style="display:none;" uitype="single" 	jsondata-ref="jsonHoldReason" unselected-text="선택" class="form-control input-sm"></sbux-select>
  							<sbux-input  id="sch-proxy-emp-code" 		name="sch-proxy-emp-code" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-source-type" 			name="sch-source-type" 				style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-appr-id" 				name="sch-appr-id" 					style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txtsource-type2"  		name="sch-txtsource-type2" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-entry-path"  			name="sch-entry-path" 				style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-source-id"  			name="sch-source-id" 				style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-appr-acount"  			name="sch-appr-acount" 				style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
                       		<sbux-select id="sch-fi-org-code" 			name="sch-fi-org-code" 				style="display:none;" uitype="single" 	jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
  							<sbux-input  id="sch-base-scale"  			name="sch-base-scale" 				style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-request-emp-code"  	name="sch-request-emp-code" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-before-appr-emp-code"  name="sch-before-appr-emp-code" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-before-proxy-emp-code" name="sch-before-proxy-emp-code" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-next-appr-emp-code" 	name="sch-next-appr-emp-code" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							
                       		<sbux-select id="sch-site-code" 			name="sch-site-code" 				style="display:none;" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
  							<sbux-input  id="sch-acct-opinion" 			name="sch-acct-opinion" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-tr-opinion" 			name="sch-tr-opinion" 				style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
                       		<!-- /hidden -->
                       		
	                        <tr>
	                            <th scope="row" class="th_bg">배치번호</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-doc-batch-no" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
	                            <th scope="row" class="th_bg">회계기준</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="sch-acct-rule-code" name="sch-acct-rule-code" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
	                            <th scope="row" class="th_bg">결의부서</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input
										uitype="text"
										id="sch-dept-name"
										class="form-control input-sm"									
	   								></sbux-input>
									<sbux-input
										uitype="hidden"
										uitype="text"
										id="sch-dept-code"
										class="form-control input-sm"
	   								></sbux-input>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px">
									<sbux-button 
										class="btn btn-xs btn-outline-dark"
										text="…" 
										uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1"
									></sbux-button>									
	                            </td>
	                            
	                            <td colspan="5" rowspan="7" class="td_input" >
				                    <div id="sb-area-grdSum" style="height:250px;border: solid 1px #cdc7c7;">
				                    </div>
	                            </td>
	                        </tr>    
	                        
	                        <tr>
	                            <th scope="row" class="th_bg">전표번호</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-doc-name" name="sch-doc-name" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
	                            <th scope="row" class="th_bg">전표ID</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-doc-id" name="sch-doc-id" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
	                            <th scope="row" class="th_bg">증빙번호</th>
	                            <td colspan="3" class="td_input" >
		                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
		                                <sbux-select id="sch-voucher-type" name="sch-voucher-type" uitype="single" jsondata-ref="jsonVoucherType" unselected-text="선택" class="form-control input-sm"></sbux-select>
	  									<font style="width:5px"></font>
		   								<sbux-input uitype="text" id="sch-voucher-no" class="form-control input-sm" ></sbux-input>
	  									<font style="width:5px"></font>
		                           	</div>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px">
									<sbux-button
										id="btn-tax-view"
										class="btn btn-xs btn-outline-dark"
										text="확인" 
										onclick=""
									></sbux-button>
	                            </td>
	                            
	                        </tr>    
	                        
	                        <tr>

	                            <th scope="row" class="th_bg">신고사업장</th>
	                            <td colspan="3" class="td_input" >
		                        	<sbux-select id="sch-tax-site-code" name="sch-tax-site-code" uitype="single" jsondata-ref="jsonTaxSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
	                            <th scope="row" class="th_bg">종사업장</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="sch-sub-tax-site-code" name="sch-sub-tax-site-code" uitype="single" jsondata-ref="jsonSubTaxSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
	                            <th scope="row" class="th_bg">매입송장번호</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-bill-no" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>

	                        </tr>    
	                        
	                        <tr>
	                        
	                            <th scope="row" class="th_bg">전표유형</th>
	                            <td class="td_input" >
	                                <sbux-select id="sch-doc-type" name="sch-doc-type" uitype="single" jsondata-ref="jsonDocType" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            <td class="td_input" >
	                                <sbux-select id="sch-doc-status" name="sch-doc-status" uitype="single" jsondata-ref="jsonDocStatus" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
	                            <th scope="row" class="th_bg">현업결재일</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-approve-date" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
	                            <th scope="row" class="th_bg">회계승인일</th>
	                            <td class="td_input" >
	   								<sbux-input uitype="text" id="sch-posting-date" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td></td>
	                            <td class="td_input" >
	   								<sbux-input uitype="text" id="sch-posting-user" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
							</tr>
							
							<tr>	                            
	                            
	                            <th scope="row" class="th_bg">전기일자</th>
	                            <td colspan="3" class="td_input" >
								    <sbux-datepicker
								            id="sch-doc-date"
								            name="sch-doc-date"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast table-datepicker-ma">
								    </sbux-datepicker>                          
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
	                            <th scope="row" class="th_bg">증빙일자</th>
	                            <td colspan="3" class="td_input" >
								    <sbux-datepicker
								            id="sch-voucher-receipt-date"
								            name="sch-voucher-receipt-date"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast table-datepicker-ma">
								    </sbux-datepicker>                          
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
	                            <th scope="row" class="th_bg">승인취소일</th>
	                            <td class="td_input" >
	   								<sbux-input uitype="text" id="sch-unposting-date" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td></td>
	                            <td class="td_input" >
	   								<sbux-input uitype="text" id="sch-unposting-user" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
							</tr>
							
							<tr>	                            
	                            
	                            <th scope="row" class="th_bg">제목</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-description" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>

	                            <th scope="row" class="th_bg">역분개전표</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-reverse-doc-name" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
	                            <th scope="row" class="th_bg">원전표</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-orig-doc-name" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td class="th_bg" style="border-left:none;padding-left:0px"></td>
	                            
	                        </tr>
	                        
	                        <tr>    
	                            
	                            <th scope="row" class="th_bg">통화</th>
	                            <td colspan="5" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
		                                <sbux-select onchange="fn_currencyCodeChange(sch-currency-code)"  style="width:150px" id="sch-currency-code" name="sch-currency-code" uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
		                                <font style="padding-left:5px"></font>
		   								<sbux-input uitype="text" id="sch-exchange-type" class="form-control input-sm" ></sbux-input>
		                                <font style="padding-left:5px"></font>
		   								<sbux-input uitype="text" id="sch-exchange-rate" class="form-control input-sm" ></sbux-input>
	                            	</div>
	                            </td>
	                            <td colspan="14"></td>
	                            
	                        </tr>    
 								                            
	                    </tbody>
	                </table>				
				</div>
                
                <div class="row">
                
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>회계전표</span>
	                            <span id="sch-lblalert" style="font-size:12px;padding-left:20px;color:red">SCM전표 전기취소는 SCM에서만 가능합니다</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
	                    	<!-- 
							<a href="#" id="btn-copy-clear" class="cu-btn-clear" >
								<img src="../../../resource/images/clear.png" width="20px" /> 복사모드해제
							</a>
	                    	 -->
							<a href="#" id="btn1-row-add" class="cu-btn-plus" style="padding-left:10px" >
								<img src="../../../resource/images/plus.png" width="20px" /> 행추가
							</a>
							<a href="#" id="btn1-row-del" class="cu-btn-minus" style="padding-left:10px">
								<img src="../../../resource/images/minus.png" width="20px" /> 행삭제
							</a>
						</div>
	                </div>
	                <div>
	                    <div id="sb-area-grdTop" style="height:200px; width:100%;">
	                    </div>
	                </div>
	                
                    <div style="display:flex;vertical-align:middle;float:left;padding-top:5px;padding-bottom:10px;margin-bottom:10px;width:100%;border:solid 1px #b2bad2">
                    	<font style="padding-left:10px">차변합계</font>
						<sbux-input style="width:150px;padding-left:10px" uitype="text" id="tot-numdr-sum" class="form-control input-sm" style="font-weight:bold;" mask="{'alias':'numeric','autoGroup':3,'groupSeparator':','}" ></sbux-input>
                    	<font style="padding-left:20px">대변합계</font>
						<sbux-input style="width:150px;padding-left:10px" uitype="text" id="tot-numcr-sum" class="form-control input-sm" style="font-weight:bold;" mask="{'alias':'numeric','autoGroup':3,'groupSeparator':','}" ></sbux-input>
                    	<font style="padding-left:20px">차이(통화)</font>
						<sbux-input style="width:150px;padding-left:10px" uitype="text" id="tot-numDiffWon" class="form-control input-sm" style="font-weight:bold;" mask="{'alias':'numeric','autoGroup':3,'groupSeparator':','}" ></sbux-input>
                    	<font style="padding-left:20px">차이(전표)</font>
						<sbux-input style="width:150px;padding-left:10px" uitype="text" id="tot-numDiffFuntion" class="form-control input-sm" style="font-weight:bold;"  mask="{'alias':'numeric','autoGroup':3,'groupSeparator':','}" ></sbux-input>
	                </div>
	                
	                <div>
		                <sbux-tabs id="tab_norm" name="tab_norm" uitype="normal"
							is-scrollable="false"
							title-target-id-array="tab1^tab2"
							title-text-array="부가세^관리항목">
						</sbux-tabs>
	                    <div class="tab-content">
	                    
							<div id="tab1" style="height:200px;">
				                <table class="table table-bordered tbl_fixed">
				                    <colgroup>
				                        <col style="width: 10%">
				                        <col style="width: 10%">
				
				                        <col style="width: 10%">
				                        <col style="width: 10%">
				
				                        <col style="width: 10%">
				                        <col style="width: 10%">
				
				                        <col style="width: 10%">
				                        <col style="width: 10%">
				
				                        <col style="width: 10%">
				                        <col style="width: 10%">
				                    </colgroup>
				                    <tbody>
				                        <tr>
				                            <th scope="row" class="th_bg">전자발행</th>
				                            <td class="td_input" >
					                       		<sbux-select 	onchange="fn_FomChange(ETAX_TYPE, 'ETAX_TYPE')"   	id="ETAX_TYPE" 	name="ETAX_TYPE" 	jsondata-ref="jsonEtaxType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
				                            </td>
				                            <th scope="row" class="th_bg">신고일자</th>
				                            <td class="td_input" >
											    <sbux-datepicker onchange="fn_FomChange(STANDARD_DATE, 'STANDARD_DATE')"  id="STANDARD_DATE" name="STANDARD_DATE" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast table-datepicker-ma"></sbux-datepicker>                          
				                            </td>
				                            <th scope="row" class="th_bg">공급가액</th>
				                            <td class="td_input" >
				   								<sbux-input onchange="fn_FomChange(SUPPLY_AMT, 'SUPPLY_AMT')" id="SUPPLY_AMT" name="SUPPLY_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg">수출신고번호</th>
				                            <td class="td_input" >
				   								<sbux-input onchange="fn_FomChange(EXPORT_LICENSE_NO, 'EXPORT_LICENSE_NO')" id="EXPORT_LICENSE_NO" name="EXPORT_LICENSE_NO" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg">당기제출금_외화</th>
				                            <td class="td_input" >
				   								<sbux-input onchange="fn_FomChange(EXPORT_AMT, 'EXPORT_AMT')" id="EXPORT_AMT" name="EXPORT_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
										</tr>				                    	
				                        <tr>
				                            <th scope="row" class="th_bg">카드용도</th>
				                            <td class="td_input" >
					                       		<sbux-select onchange="fn_FomChange(CARD_USE_TYPE, 'CARD_USE_TYPE')" id="CARD_USE_TYPE" 	name="CARD_USE_TYPE" 	jsondata-ref="jsonCardUseType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
				                            </td>
				                            <th scope="row" class="th_bg">카드번호</th>
				                            <td class="td_input" >
				   								<sbux-input onchange="fn_FomChange(CARD_NUM, 'CARD_NUM')" id="CARD_NUM" name="CARD_NUM" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg">내국신용장구분</th>
				                            <td class="td_input" >
					                       		<sbux-select onchange="fn_FomChange(LOCAL_CREDIT_TYPE, 'LOCAL_CREDIT_TYPE')" id="LOCAL_CREDIT_TYPE" 	name="LOCAL_CREDIT_TYPE" 	jsondata-ref="jsonLocalCreditType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
				                            </td>
				                            <th scope="row" class="th_bg">선적일자</th>
				                            <td class="td_input" >
											    <sbux-datepicker onchange="fn_FomChange(SHIPPING_DATE, 'SHIPPING_DATE')" id="SHIPPING_DATE" name="SHIPPING_DATE" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast table-datepicker-ma"></sbux-datepicker>                          
				                            </td>
				                            <th scope="row" class="th_bg">당기제출금_원화</th>
				                            <td class="td_input" >
				   								<sbux-input onchange="fn_FomChange(EXPORT_AMT_KRW, 'EXPORT_AMT_KRW')" id="EXPORT_AMT_KRW" name="EXPORT_AMT_KRW" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
										</tr>				                    	
				                        <tr>
				                            <th scope="row" class="th_bg">불공제유형</th>
				                            <td class="td_input" >
					                       		<sbux-select onchange="fn_FomChange(VAT_NOT_DEDUCTION_TYPE, 'VAT_NOT_DEDUCTION_TYPE')" id="VAT_NOT_DEDUCTION_TYPE" 	name="VAT_NOT_DEDUCTION_TYPE" 	jsondata-ref="jsonVatNotDedType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
				                            </td>
				                            <th scope="row" class="th_bg">예정신고누락</th>
				                            <td class="td_input" >
					                       		<sbux-select onchange="fn_FomChange(REPORT_OMIT_YN, 'REPORT_OMIT_YN')" id="REPORT_OMIT_YN" 	name="REPORT_OMIT_YN" 	jsondata-ref="jsonReportOmitYn" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
				                            </td>
				                            <th scope="row" class="th_bg">서류명</th>
				                            <td class="td_input" >
				   								<sbux-input onchange="fn_FomChange(DOCUMENT_NAME, 'DOCUMENT_NAME')" id="DOCUMENT_NAME" name="DOCUMENT_NAME" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg">수출외화금액</th>
				                            <td class="td_input" >
				   								<sbux-input onchange="fn_FomChange(FOREIGN_AMT, 'FOREIGN_AMT')" id="FOREIGN_AMT" name="FOREIGN_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg">당기신고해당분_외화</th>
				                            <td class="td_input" >
				   								<sbux-input onchange="fn_FomChange(VAT_EXPORT_AMT, 'VAT_EXPORT_AMT')" id="VAT_EXPORT_AMT" name="VAT_EXPORT_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
										</tr>				                    	
				                        <tr>
				                            <th scope="row" class="th_bg">중복발행</th>
				                            <td class="td_input" >
					                       		<sbux-select onchange="fn_FomChange(DUP_ISSUE_BILL_TYPE, 'DUP_ISSUE_BILL_TYPE')" id="DUP_ISSUE_BILL_TYPE" 	name="DUP_ISSUE_BILL_TYPE" 	jsondata-ref="jsonDupIssList" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
				                            </td>
				                            <th scope="row" class="th_bg">감가상각자산유형</th>
				                            <td class="td_input" >
					                       		<sbux-select onchange="fn_FomChange(VAT_ASSET_TYPE, 'VAT_ASSET_TYPE')" id="VAT_ASSET_TYPE" 	name="VAT_ASSET_TYPE" 	jsondata-ref="jsonVatAssetType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
				                            </td>
				                            <th scope="row" class="th_bg">발급자</th>
				                            <td class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ISSUE_NAME, 'ISSUE_NAME')" id="ISSUE_NAME" name="ISSUE_NAME" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg">수출원화금액</th>
				                            <td class="td_input" >
				   								<sbux-input onchange="fn_FomChange(WON_AMT, 'WON_AMT')" id="WON_AMT" name="WON_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg">당기신고해당분_원화</th>
				                            <td class="td_input" >
				   								<sbux-input onchange="fn_FomChange(VAT_EXPORT_AMT_KRW, 'VAT_EXPORT_AMT_KRW')" id="VAT_EXPORT_AMT_KRW" name="VAT_EXPORT_AMT_KRW" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
										</tr>				                    	
				                        <tr>
				                            <th scope="row" class="th_bg">11일외전송</th>
				                            <td class="td_input" >
					                       		<sbux-select onchange="fn_FomChange(AFTER_DUE_DATE_YN, 'AFTER_DUE_DATE_YN')" id="AFTER_DUE_DATE_YN" 	name="AFTER_DUE_DATE_YN" 	jsondata-ref="jsonAfterDueDateYn" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
				                            </td>
				                            <th scope="row" class="th_bg">영세율첨부서류여부</th>
				                            <td class="td_input" >
					                       		<sbux-select onchange="fn_FomChange(ZERO_REPORT_YN, 'ZERO_REPORT_YN')" id="ZERO_REPORT_YN" 	name="ZERO_REPORT_YN" 	jsondata-ref="jsonZeroReportYn" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
				                            </td>
				                            <th scope="row" class="th_bg">발급일자</th>
				                            <td class="td_input" >
											    <sbux-datepicker onchange="fn_FomChange(DOCUMENT_ISSUE_DATE, 'DOCUMENT_ISSUE_DATE')"  id="DOCUMENT_ISSUE_DATE" name="DOCUMENT_ISSUE_DATE" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast table-datepicker-ma"></sbux-datepicker>                          
				                            </td>
				                            <td colspan="4" class="td_input" >
				                            </td>
										</tr>				                    	
				                        <tr>
				                            <th scope="row" class="th_bg">수입금액제외</th>
				                            <td class="td_input" >
					                       		<sbux-select onchange="fn_FomChange(EXCLUDE_REVENUE_AMT_YN, 'EXCLUDE_REVENUE_AMT_YN')" id="EXCLUDE_REVENUE_AMT_YN" 	name="EXCLUDE_REVENUE_AMT_YN" 	jsondata-ref="jsonExcludeAmtYn" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
				                            </td>
				                            <th scope="row" class="th_bg">영세율구분</th>
				                            <td class="td_input" >
					                       		<sbux-select onchange="fn_FomChange(ZERO_TYPE, 'ZERO_TYPE')"  id="ZERO_TYPE" 	name="ZERO_TYPE" 	jsondata-ref="jsonZeroType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
				                            </td>
				                            <th scope="row" class="th_bg">내국신용장서류번호</th>
				                            <td class="td_input" >
				   								<sbux-input onchange="fn_FomChange(DOCUMENT_NO, 'DOCUMENT_NO')"  id="DOCUMENT_NO" name="DOCUMENT_NO" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <td colspan="4" class="td_input" >
				                            </td>
										</tr>				                    	
									</tbody>					
								</table>
							</div>
							
							<div id="tab2" style="height:200px;">
							
				                <table class="table table-bordered tbl_fixed">
				                    <colgroup>
				                        <col style="width: 10%">
				                        <col style="width: 12%">
				                        <col style="width: 11%">
				
				                        <col style="width: 10%">
				                        <col style="width: 12%">
				                        <col style="width: 11%">
				
				                        <col style="width: 10%">
				                        <col style="width: 12%">
				                        <col style="width: 12%">
				                    </colgroup>
				                    <tbody>
				                        <tr>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME1"></th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE1, 'ACC_ITEM_VALUE1')"  id="ACC_ITEM_VALUE1" name="ACC_ITEM_VALUE1" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME5"></th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE5, 'ACC_ITEM_VALUE5')"  id="ACC_ITEM_VALUE5" name="ACC_ITEM_VALUE5" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME9"></th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE9, 'ACC_ITEM_VALUE9')"  id="ACC_ITEM_VALUE9" name="ACC_ITEM_VALUE9" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
										</tr>
				                        <tr>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME2"></th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE2, 'ACC_ITEM_VALUE2')"  id="ACC_ITEM_VALUE2" name="ACC_ITEM_VALUE2" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME6"></th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE6, 'ACC_ITEM_VALUE6')"  id="ACC_ITEM_VALUE6" name="ACC_ITEM_VALUE6" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME10"></th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE10, 'ACC_ITEM_VALUE10')"  id="ACC_ITEM_VALUE10" name="ACC_ITEM_VALUE10" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
										</tr>
				                        <tr>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME3"></th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE3, 'ACC_ITEM_VALUE3')"  id="ACC_ITEM_VALUE3" name="ACC_ITEM_VALUE3" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME7"></th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE7, 'ACC_ITEM_VALUE7')"  id="ACC_ITEM_VALUE7" name="ACC_ITEM_VALUE7" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="PROJECT_NAME"></th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(PROJECT_CODE, 'PROJECT_CODE')"  id="PROJECT_CODE" name="PROJECT_CODE" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
										</tr>
				                        <tr>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME4"></th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE4, 'ACC_ITEM_VALUE4')"  id="ACC_ITEM_VALUE4" name="ACC_ITEM_VALUE4" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME8"></th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE8, 'ACC_ITEM_VALUE8')"  id="ACC_ITEM_VALUE8" name="ACC_ITEM_VALUE8" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg" ></th>
				                            <td colspan="2" class="td_input" >
				                            </td>
										</tr>
									</tbody>
								</table>										
							
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
        <sbux-modal style="width:1400px" id="modal-compopfim3420" name="modal-compopfim3420" uitype="middle" header-title="" body-html-id="body-modal-compopfim3420" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopfim3420">
    	<jsp:include page="../../../com/popup/comPopFim3420.jsp"></jsp:include>
    </div>

	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:500px" id="modal-compopup4" name="modal-compopup4" uitype="middle" header-title="" body-html-id="body-modal-compopup4" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup4">
    	<jsp:include page="../../../com/popup/comPopup4.jsp"></jsp:include>
    </div>
    
   	<!-- 리포트 출력 팝업 -->
	<div>
		<sbux-modal style="width:600px" id="modal-comPopFig1000Report" name="modal-comPopFig1000Report" uitype="middle" header-title="" body-html-id="body-modal-comPopFig1000Report" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
	</div>
	<div id="body-modal-comPopFig1000Report">
		<jsp:include page="../../../com/popup/comPopFig1000Report.jsp"></jsp:include>
	</div>	
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.userId}';
	
	var p_ss_issAccountChief	= '${loginVO.maIsAccountChief}';
	var p_ss_isAccountManager	= '${loginVO.maIsAccountManager}';
	var p_ss_fiDeleteUser 		= '${loginVO.maFI_DELETE_USER}';
	var p_ss_defaultAcctRule	= '${loginVO.maDefaultAcctRule}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	var p_ss_siteCode			= '${loginVO.maSiteCode}';
	var p_ss_deptCode			= '${loginVO.maDeptCode}';
	var p_ss_deptName			= '${loginVO.maDeptName}';
	var p_ss_currCode			= '${loginVO.maCurrCode}';
	var p_ss_currUnit			= '${loginVO.maCurrUnit}';
	var p_ss_empCode			= '${loginVO.maEmpCode}';
	var p_ss_empName			= '${loginVO.maEmpName}';
	var p_ss_isPostingUser		= '${loginVO.maIsPostingUser}';
	
	var pg_state				= 'new';
	
	var p_header_dataStatus		= '';
	
    var pg_doc_name				= '';	
    var pg_source_type			= '';	
    var pg_fi_delete_user		= (p_ss_fiDeleteUser) ? p_ss_fiDeleteUser : '';
    var pg_strdoc_type			= '99';
    var pg_strdoc_status		= '1';
    
    var pg_vat_type_bizId		= '';	//그리드내(부가세유형) 팝업 bizId
    
    var pg_colcs_code_bizId		= '';	//그리드내(거래처) 팝업 bizId
    var pg_colcs_code_title		= '';	//그리드내(거래처) 팝업 타이틀
    var pg_colcs_code_field1	= '';	//그리드내(거래처) 컬럼명
    var pg_colcs_code_field2	= '';	//그리드내(거래처) 컬럼명
    
    var pg_rule_code_bizId		= '';	//멀티셀렉트 'srch-compopup1-rulecode' bizId
    var pg_rule_code_where		= "";	//멀티셀렉트 'srch-compopup1-rulecode' where

    var pg_doc_type_bizId		= '';	//셀텍트 'sch-doc-type' bizId
    var pg_doc_type_where		= '';	//셀텍트 'sch-doc-type' where
    
    var p_sel_row 				= '';
    var p_sel_col 				= '';
    
  	var p_unposting_type		= '';
  	var p_unposting_date		= '';
    
    var p_summit_yn 	= true;		// c# fnsummit_yn();
    
    var p_menu_param	= null;
    
    //grid 초기화
    var Fig2210Grid; 			// 그리드를 담기위한 객체 선언
    var jsonFig2210 = []; 		// 그리드의 참조 데이터 주소 선언

    var FigGridSum; 			// 그리드를 담기위한 객체 선언
    var jsonGridSum = []; 		// 그리드의 참조 데이터 주소 선언
    //-----------------------------------------------------------

    var jsonFiOrgCode 			= []; // 사업단위
    var jsonSiteCode 			= []; 
    var jsonHoldFlag 			= []; 
    
    var jsonAcctRuleCode 		= []; // 회계기준
    var jsonVoucherType 		= []; // 증빙번호
    var jsonTaxSiteCode 		= []; // 신고사업장
    var jsonSubTaxSiteCode 		= []; // 총사업장
    var jsonDocType 			= []; // 전표유형
    var jsonDocStatus 			= []; // 전표유형
    var jsonCurrencyCode 		= []; // 통화
	
    var jsonLineType 			= []; // 라인유형
    var jsonDebitCredit 		= []; // 차/대
    var jsonGridSiteCode		= []; // 사업장 
    var jsonHoldReason			= []; // 보류사유 
    var jsonCreditArea			= []; // 여신영역
    
    var jsonEtaxType			= []; // 전자발행
    var jsonCardUseType			= []; // 카드용도
    var jsonLocalCreditType		= []; // 내국신용장구분
    var jsonVatNotDedType		= []; // 불공제유형
    var jsonReportOmitYn		= []; // 예정신고누락
    var jsonDupIssList			= []; // 중복발행
    var jsonVatAssetType		= []; // 감가상각자산유형
    var jsonAfterDueDateYn		= []; // 11일외전송
    var jsonZeroReportYn		= []; // 영세율첨부서류여부
    var jsonExcludeAmtYn		= []; // 수입금액제외
    var jsonZeroType			= []; // 영세율구분
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            gfnma_setComSelect(['sch-hold-flag'],				jsonHoldFlag, 		'L_COM036', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 사업단위
            gfnma_setComSelect(['sch-fi-org-code'],				jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            gfnma_setComSelect(['sch-site-code'],				jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            
            // 회계기준
            gfnma_setComSelect(['sch-acct-rule-code'],			jsonAcctRuleCode, 	'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 증빙번호
            gfnma_setComSelect(['sch-voucher-type'],			jsonVoucherType, 	'L_FIG005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 신고사업장
            gfnma_setComSelect(['sch-tax-site-code'],			jsonTaxSiteCode, 	'L_ORG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TAX_SITE_CODE', 'TAX_SITE_NAME', 'Y', ''),
            // 종사업장
            gfnma_setComSelect(['sch-sub-tax-site-code'],		jsonSubTaxSiteCode, 'L_ORG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TAX_SITE_CODE', 'TAX_SITE_NAME', 'Y', ''),
            // 전표유형
            gfnma_setComSelect(['sch-doc-type'],				jsonDocType, 		pg_doc_type_bizId, pg_doc_type_where, gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['sch-doc-status'],				jsonDocStatus, 		'L_FIG002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['sch-currency-code'],			jsonCurrencyCode, 	'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            
            // 그리드내 라인유형
			gfnma_setComSelect([], 								jsonLineType, 		'L_FIM052', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 그리드내 차/대
			gfnma_setComSelect([], 								jsonDebitCredit, 	'L_FIG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 그리드내 사업장
			gfnma_setComSelect([], 								jsonGridSiteCode, 	'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 그리드내 보류사유
			gfnma_setComSelect([], 								jsonHoldReason, 	'L_COM042', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 그리드내 여신영역
			gfnma_setComSelect([], 								jsonCreditArea, 	'L_ORG020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

            // 전자발행
            gfnma_setComSelect(['ETAX_TYPE'],					jsonEtaxType, 		'L_FIT005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 카드용도
            gfnma_setComSelect(['CARD_USE_TYPE'],				jsonCardUseType, 	'L_FIT012', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 내국신용장구분
            gfnma_setComSelect(['LOCAL_CREDIT_TYPE'],			jsonLocalCreditType,'L_FIT011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 불공제유형
            gfnma_setComSelect(['VAT_NOT_DEDUCTION_TYPE'],		jsonVatNotDedType,	'L_FIT013', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 예정신고누락
            gfnma_setComSelect(['REPORT_OMIT_YN'],				jsonReportOmitYn,	'L_FIT009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 중복발행
            gfnma_setComSelect(['DUP_ISSUE_BILL_TYPE'],			jsonDupIssList,		'L_FIT007', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 감가상각자산유형
            gfnma_setComSelect(['VAT_ASSET_TYPE'],				jsonVatAssetType,	'L_FIT014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 11일외전송
            gfnma_setComSelect(['AFTER_DUE_DATE_YN'],			jsonAfterDueDateYn,	'L_FIT006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 영세율첨부서류여부
            gfnma_setComSelect(['ZERO_REPORT_YN'],				jsonZeroReportYn,	'L_FIT019', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 수입금액제외
            gfnma_setComSelect(['EXCLUDE_REVENUE_AMT_YN'],		jsonExcludeAmtYn,	'L_FIT008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 영세율구분
            gfnma_setComSelect(['ZERO_TYPE'],					jsonZeroType,		'L_FIT010', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			
			//전표템플릿
			gfnma_multiSelectInit({
				target			: ['#srch-compopup1-rulecode']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: pg_rule_code_bizId
				,whereClause	: pg_rule_code_where
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'RULE_CODE'
				,colLabel		: 'RULE_NAME'
				,columns		:[
		            {caption: "rule코드",		ref: 'RULE_CODE',			width:'100px',  	style:'text-align:left'},
		            {caption: "rule코드명", 	ref: 'RULE_NAME',    		width:'200px',  	style:'text-align:left'},
		            {caption: "전표유형", 		ref: 'DOC_TYPE',    		width:'100px',  	style:'text-align:left'},
		            {caption: "ap_doc_yn", 		ref: 'AP_DOC_YN',    		width:'100px',  	style:'text-align:left'},
		            {caption: "ar_doc_yn", 		ref: 'AR_DOC_YN',    		width:'100px',  	style:'text-align:left'},
				]
			})
		]);
	}	

	async function fn_init(type) {

		if(pg_state=='new'){
			pg_vat_type_bizId		= 'P_ACCOUNT_POPUP_LINE_Q';
			
    		pg_colcs_code_bizId 	= 'P_CS_ALL';
    		pg_colcs_code_title 	= '거래처';
    		pg_colcs_code_field1 	= 'CS_CODE';
    		pg_colcs_code_field2 	= 'CS_NAME';
    		
    		pg_rule_code_bizId		= 'L_RULE';
    		pg_rule_code_where		= "AND manual_doc_write_yn = 'Y'";
    		
    		pg_doc_type_bizId		= 'L_FIM051';
    		pg_doc_type_where		= "AND manual_doc_write_yn = 'Y'";
		} else {
			pg_vat_type_bizId		= 'P_ACCOUNT_POPUP_LINE_Q';
			
    		pg_colcs_code_bizId 	= 'P_CS_ALL';
    		pg_colcs_code_title 	= '거래처';
    		pg_colcs_code_field1 	= 'CS_CODE';
    		pg_colcs_code_field2 	= 'CS_NAME';
    		
    		pg_rule_code_bizId		= 'L_RULE';
    		pg_rule_code_where		= "AND manual_doc_write_yn = 'Y'";
    		
    		pg_doc_type_bizId		= 'L_FIM051';
    		//pg_doc_type_where		= "AND manual_doc_write_yn = 'Y'";
		}
		
		if(type){
			//select init
	  		await fn_initSBSelect()
		}
		
		//그리드 셋팅
    	fn_createGrid2210();	
    	fn_createGridSum();
    	
		//화면셋팅
    	fn_state(pg_state);
	}    
    
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	//메뉴 파라미터
    	p_menu_param = localStorage.getItem("callMain");
    	if(p_menu_param){
    		p_menu_param = JSON.parse(p_menu_param);
    	}
    	localStorage.removeItem("callMain");
		if(p_menu_param){
			pg_state = 'edit';			
		} else {
			pg_state = 'new';			
		}
// 		console.log('1 pg_state:', pg_state);			
// 		console.log('1 p_menu_param:', p_menu_param);
		//-------------------------------
    	
    	fn_init(true);

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
				p_menu_param 	= obj;
				if(p_menu_param){
					pg_state = 'edit';			
			     	fn_init(false);
				} else {
					pg_state = 'new';			
			    	fn_init(true);
				}		     	
			}
		}
    });
    
    /**
     * 화면 state 변경
     */
    function fn_state(type) {
    	
		
    	if(type=='new'){
    		
			SBUxMethod.selectTab('tab_norm','tab2');
    		
			$('#main-btn-add', parent.document).attr('disabled', false);
			$('#main-btn-save', parent.document).attr('disabled', true);
			
    		//신규
    		$('#sch-lblalert').hide();
        	if(!pg_source_type){
        		pg_source_type = 'MANUAL';
        	}
    		SBUxMethod.set('sch-txtsource-type2', 		pg_source_type);
    		SBUxMethod.set('sch-insert-userid', 		p_userId);
    		SBUxMethod.set('sch-acct-rule-code', 		p_ss_defaultAcctRule);
    		SBUxMethod.set('sch-doc-type', 				pg_strdoc_type);
    		SBUxMethod.set('sch-doc-status', 			pg_strdoc_status);
    		SBUxMethod.set('sch-fi-org-code', 			p_ss_fiOrgCode);
    		SBUxMethod.set('sch-site-code', 			p_ss_siteCode);
    		SBUxMethod.set('sch-dept-code', 			p_ss_deptCode);
    		SBUxMethod.set('sch-dept-name', 			p_ss_deptName);
    		SBUxMethod.set('sch-hold-flag', 			"Y");
    		SBUxMethod.set('sch-tax-site-code', 		"T02");
    		
    		SBUxMethod.attr('sch-acct-rule-code', 		'readonly', false);
    		SBUxMethod.attr('sch-fi-org-code', 			'readonly', false);
    		SBUxMethod.attr('sch-site-code', 			'readonly', false);
    		
    		$('#top_lable1').show();
    		$('#top_lable2').show();
    		
    		//button display state
    		SBUxMethod.attr('sch-btn-attach', 			'disabled', true);
    		SBUxMethod.hide('sch-btn-descUpdate');
    		//SBUxMethod.hide('sch-btn-copy');
    		SBUxMethod.attr('sch-btn-submit', 			'disabled', true);
    		SBUxMethod.attr('sch-btn-confirmHist', 		'disabled', true);    		
    		SBUxMethod.attr('sch-btn-end', 				'disabled', true);
    		SBUxMethod.attr('sch-btn-scm', 				'disabled', true);
    		
    		SBUxMethod.attr('btn1-row-add', 			'disabled', false);
    		SBUxMethod.attr('btn1-row-del', 			'disabled', false);
    		
    		SBUxMethod.attr('sch-btn-cancel', 			'disabled', true);
    		SBUxMethod.attr('sch-btn-release', 			'disabled', true);
    		SBUxMethod.attr('sch-btn-unrelease', 		'disabled', true);
    		SBUxMethod.hide('sch-btn-reverseCancel');
    		//.....................
    		
    		SBUxMethod.set('sch-doc-date', 				gfnma_date4());
    		SBUxMethod.set('sch-voucher-receipt-date', 	gfnma_date4());
    		SBUxMethod.set('sch-currency-code', 		p_ss_currCode);
    		SBUxMethod.set('sch-base-scale', 			'1');
    		SBUxMethod.set('sch-exchange-rate', 		'1');
    		
    		SBUxMethod.attr('sch-doc-type', 			'readonly', false);

            //합계표시 보여주기 결정
			gfnma_getComCode({
					workType		: 'DETAIL_01'
					,groupCategory	: ''
					,groupCode		: 'SYS601'
					,groupName		: ''
					,subCode		: ''
					,extraField1	: 'FIG2210'
					,extraField2	: 'panAccountSum'
					,extraField3	: 'N'
					,extraField3	: 'N'
					,extraField3	: 'N'
					,formId			: p_formId
					,menuId			: p_menuId					
				}
				,function(data){
					if(data.length>0){
			            $('#panAccountSum').hide();
					}
				}
			);
            
    		//원가유형제한
    		if(p_ss_isAccountManager || p_ss_issAccountChief){
    			SBUxMethod.show('srh-cost-class-check-yn');
        		SBUxMethod.set('sch-reverse-flag', 			"N");
        		SBUxMethod.set('sch-txtopen-to-fcm-yn', 	"N");
    			SBUxMethod.hide('sch-btn-copy');
    		} else {
    			SBUxMethod.hide('srh-cost-class-check-yn');
        		SBUxMethod.set('sch-reverse-flag', 			"Y");
        		SBUxMethod.set('sch-txtopen-to-fcm-yn', 	"Y");
    			SBUxMethod.hide('sch-btn-copy');
    		}
			SBUxMethod.set('srh-cost-class-check-yn', 'Y');
    			
    		let p_sch_voucher_type = SBUxMethod.get('sch-voucher-type');
    		if(p_sch_voucher_type=='A' || p_sch_voucher_type=='B' || p_sch_voucher_type=='C'){
    			SBUxMethod.show('btn-tax-view');
    		} else {
    			SBUxMethod.hide('btn-tax-view');
    		}
    		
    		fn_setFig2210Grid('DEFAULTRULE');
    		
    	} else {
    		//수정
    		//전표조회에서 오는 경우
    		
    		$('#sch-lblalert').show();
    		SBUxMethod.set('sch-doc-id', 		p_menu_param['DOC_ID']);
    		SBUxMethod.attr('sch-doc-type', 	'disabled', true);
    		SBUxMethod.attr('sch-doc-status', 	'disabled', true);
			
    		fn_setFig2210Grid('Q',function(data){
    			console.log('this===>>>:', data);
    			
    			var tobj = {};
    			if(data.cv_2.length > 0){
    				tobj = data.cv_2[0];
    			}
    			
    			//조회부분
    			SBUxMethod.set('sch-doc-batch-no', 				gfnma_nvl(tobj['DOC_BATCH_NO']));
    			SBUxMethod.set('sch-acct-rule-code', 			gfnma_nvl(tobj['ACCT_RULE_CODE']));
    			SBUxMethod.set('sch-dept-name', 				gfnma_nvl(tobj['DEPT_NAME']));
    			SBUxMethod.set('sch-dept-code', 				gfnma_nvl(tobj['DEPT_CODE']));
    			SBUxMethod.set('sch-doc-name', 					gfnma_nvl(tobj['DOC_NAME']));
    			SBUxMethod.set('sch-doc-id', 					gfnma_nvl(tobj['DOC_ID']));
    			SBUxMethod.set('sch-voucher-type', 				gfnma_nvl(tobj['VOUCHER_TYPE']));
    			SBUxMethod.set('sch-voucher-no', 				gfnma_nvl(tobj['VOUCHER_NO']));
    			SBUxMethod.set('sch-tax-site-code', 			gfnma_nvl(tobj['TAX_SITE_CODE']));
    			SBUxMethod.set('sch-sub-tax-site-code', 		gfnma_nvl(tobj['SUB_TAX_SITE_CODE']));
    			SBUxMethod.set('sch-bill-no', 					gfnma_nvl(tobj['BILL_NO']));
    			SBUxMethod.set('sch-doc-type', 					gfnma_nvl(tobj['DOC_TYPE']));
    			SBUxMethod.set('sch-doc-status', 				gfnma_nvl(tobj['DOC_STATUS']));
    			SBUxMethod.set('sch-approve-date', 				gfnma_nvl(tobj['APPROVE_DATE']));
    			SBUxMethod.set('sch-doc-date', 					gfnma_nvl(tobj['DOC_DATE']));
    			SBUxMethod.set('sch-voucher-receipt-date', 		gfnma_nvl(tobj['VOUCHER_RECEIPT_DATE']));
    			SBUxMethod.set('sch-posting-date', 				gfnma_nvl(tobj['POSTING_DATE']));
    			SBUxMethod.set('sch-posting-user', 				gfnma_nvl(tobj['POSTING_USER']));
    			SBUxMethod.set('sch-currency-code', 			gfnma_nvl(tobj['CURRENCY_CODE']));
    			SBUxMethod.set('sch-exchange-type', 			gfnma_nvl(tobj['EXCHANGE_TYPE']));
    			SBUxMethod.set('sch-exchange-rate', 			gfnma_nvl(tobj['EXCHANGE_RATE']));
    			SBUxMethod.set('sch-unposting-date', 			gfnma_nvl(tobj['UNPOSTING_DATE']));
    			SBUxMethod.set('sch-unposting-user', 			gfnma_nvl(tobj['UNPOSTING_USER']));
    			SBUxMethod.set('sch-description', 				gfnma_nvl(tobj['DESCRIPTION']));
    			SBUxMethod.set('sch-reverse-doc-name', 			gfnma_nvl(tobj['REVERSE_DOC_NAME']));
    			SBUxMethod.set('sch-orig-doc-name', 			gfnma_nvl(tobj['ORIG_DOC_ID']));
    			
    			SBUxMethod.set('sch-hold-flag', 				gfnma_nvl(tobj['HOLD_FLAG']));
    			SBUxMethod.set('sch-release-date', 				gfnma_nvl(tobj['RELEASE_DATE']));
    			SBUxMethod.set('sch-insert-userid', 			gfnma_nvl(tobj['INSERT_USERID']));
    			SBUxMethod.set('sch-reverse-flag', 				gfnma_nvl(tobj['REVERSE_FLAG']));
    			SBUxMethod.set('sch-confirm-emp-code', 			gfnma_nvl(tobj['CONFIRM_EMP_CODE']));
    			SBUxMethod.set('sch-temp-doc-num', 				gfnma_nvl(tobj['DOC_NUM']));
    			SBUxMethod.set('sch-hold-date', 				gfnma_nvl(tobj['HOLD_DATE']));
    			SBUxMethod.set('sch-release-user', 				gfnma_nvl(tobj['RELEASE_USER']));
    			SBUxMethod.set('sch-hold-user', 				gfnma_nvl(tobj['HOLD_USER']));
    			SBUxMethod.set('sch-hold-reason', 				gfnma_nvl(tobj['HOLD_REASON']));
    			SBUxMethod.set('sch-proxy-emp-code', 			gfnma_nvl(tobj['PROXY_EMP_CODE']));
    			SBUxMethod.set('sch-source-type', 				gfnma_nvl(tobj['SOURCE_TYPE']));
    			SBUxMethod.set('sch-appr-id', 					gfnma_nvl(tobj['APPR_ID']));
    			SBUxMethod.set('sch-entry-path', 				gfnma_nvl(tobj['ENTRY_PATH']));
    			SBUxMethod.set('sch-source-id', 				gfnma_nvl(tobj['SOURCE_ID']));
    			SBUxMethod.set('sch-appr-acount', 				gfnma_nvl(tobj['APPR_COUNT']));
    			SBUxMethod.set('sch-fi-org-code', 				gfnma_nvl(tobj['FI_ORG_CODE']));
    			SBUxMethod.set('sch-base-scale', 				gfnma_nvl(tobj['BASE_SCALE']));
    			SBUxMethod.set('sch-request-emp-code', 			gfnma_nvl(tobj['REQUEST_EMP_CODE']));
    			SBUxMethod.set('sch-before-appr-emp-code', 		gfnma_nvl(tobj['BEFORE_APPR_EMP_CODE']));
    			SBUxMethod.set('sch-before-proxy-emp-code', 	gfnma_nvl(tobj['BEFORE_PROXY_EMP_CODE']));
    			SBUxMethod.set('sch-next-appr-emp-code', 		gfnma_nvl(tobj['NEXT_APPR_EMP_CODE']));
    			SBUxMethod.set('sch-site-code', 				gfnma_nvl(tobj['SITE_CODE']));

    			//그리드합계
				jsonGridSum = [];
   	        	data.cv_4.forEach((item, index) => {
   					const msg = {
						ACCOUNT_CODE	: gfnma_nvl(item.ACCOUNT_CODE),			
						ACCOUNT_NAME	: gfnma_nvl(item.ACCOUNT_NAME),			
						ORIGINAL_AMT	: gfnma_nvl(item.ORIGINAL_AMT),			
						FUNCTIONAL_AMT	: gfnma_nvl(item.FUNCTIONAL_AMT),			
     					ETC				: ''		
   					}
   					jsonGridSum.push(msg);
   	        	});	
				jsonGridSum = data.cv_4;
				FigGridSum.rebuild();
    			
                //합계표시 보여주기 결정
    			gfnma_getComCode({
    					workType		: 'DETAIL_01'
    					,groupCategory	: ''
    					,groupCode		: 'SYS601'
    					,groupName		: ''
    					,subCode		: ''
    					,extraField1	: 'FIG2210'
    					,extraField2	: 'panAccountSum'
    					,extraField3	: 'N'
    					,extraField3	: 'N'
    					,extraField3	: 'N'
    					,formId			: p_formId
    					,menuId			: p_menuId					
    				}
    				,function(data){
    					if(data.length>0){
    			            $('#panAccountSum').hide();
    					}
    				}
    			);
                
    			pg_source_type 	= SBUxMethod.get('sch-doc-type');
    			pg_doc_name		= SBUxMethod.get('sch-doc-name');
    			if(pg_doc_name){
    	    		SBUxMethod.attr('sch-btn-attach', 	'disabled', false);
    			}
    			
    			let strinvoice_status_code = SBUxMethod.get('sch-doc-status');
    			fn_enableSet(strinvoice_status_code);
    			
        		SBUxMethod.attr('sch-acct-rule-code', 	'disabled', true);
        		SBUxMethod.attr('sch-fi-org-code', 		'disabled', true);
        		SBUxMethod.attr('sch-site-code', 		'disabled', true);
                
        		SBUxMethod.set('sch-txtsource-type2', SBUxMethod.get('sch-source-type'));
        		
        		let entry_path  	= SBUxMethod.get('sch-entry-path');
        		let reverse_flag 	= SBUxMethod.get('sch-reverse-flag');
        		if(entry_path == 'REVERSE' && reverse_flag == 'Y' && p_ss_isAccountManager){
        			SBUxMethod.show('sch-btn-reverseCancel');
        		} else {
        			SBUxMethod.hide('sch-btn-reverseCancel');
        		}
        		
        		let doc_id 		= SBUxMethod.get('sch-doc-id');
        		let doc_status 	= SBUxMethod.get('sch-doc-status');
        		if(doc_id != '0'){
        			if(doc_status == '1'){
        				$('#main-btn-del', parent.document).attr('disabled', false);
        				$('#top_lable1').hide();
        				$('#top_lable2').hide();
        			}
        		}
        		
        		//원가유형제한
        		if(p_ss_isAccountManager || p_ss_issAccountChief){
        			SBUxMethod.show('srh-cost-class-check-yn');
            		SBUxMethod.set('sch-reverse-flag', 			"N");
            		SBUxMethod.set('sch-txtopen-to-fcm-yn', 	"N");
        			//SBUxMethod.hide('sch-btn-copy');
        		} else {
        			SBUxMethod.hide('srh-cost-class-check-yn');
            		SBUxMethod.set('sch-reverse-flag', 			"Y");
            		SBUxMethod.set('sch-txtopen-to-fcm-yn', 	"Y");
        			//SBUxMethod.hide('sch-btn-copy');
        		}
    			SBUxMethod.set('srh-cost-class-check-yn', 'Y');
        		
        		let p_sch_voucher_type = gfnma_nvl(SBUxMethod.get('sch-voucher-type'));
        		if(p_sch_voucher_type=='A' || p_sch_voucher_type=='B' || p_sch_voucher_type=='C'){
        			SBUxMethod.show('btn-tax-view');
        		} else {
        			SBUxMethod.hide('btn-tax-view');
        		}    			
    		});
    	}
    }
    
    /**
     * 콤포넌트 할성화
     */
    var fn_enableSet = function(code) {
    	
console.log('fn_enableSet(code):', code);

    	if(code=='0'){
    		
			$('#main-btn-save', parent.document).attr('disabled', true);
			$('#main-btn-del', 	parent.document).attr('disabled', false);
			
    		SBUxMethod.attr('sch-btn-submit', 		'disabled', true);
    		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', true);
    		SBUxMethod.attr('sch-btn-end', 			'disabled', true);
    		SBUxMethod.attr('sch-btn-scm', 			'disabled', true);
    		
    		$('#btn1-row-add').attr('disabled', 	false);
    		$('#btn1-row-del').attr('disabled', 	false);
    		SBUxMethod.attr('sch-btn-cancel', 		'disabled', true);
    		
    		SBUxMethod.attr('sch-btn-release', 		'disabled', true);
    		SBUxMethod.attr('sch-btn-unrelease', 	'disabled', true);
    	
    	} else {
    		
    		if(code=='1'){
    			
        		//미승인
    			$('#main-btn-save', parent.document).attr('disabled', true);
    			$('#main-btn-del', 	parent.document).attr('disabled', true);
    			
        		SBUxMethod.attr('sch-btn-submit', 		'disabled', false);
        		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', true);
        		SBUxMethod.attr('sch-btn-end', 			'disabled', true);
        		
        		$('#btn1-row-add').attr('disabled', 	false);
        		$('#btn1-row-del').attr('disabled', 	false);
        		SBUxMethod.attr('sch-btn-cancel', 		'disabled', true);

        		SBUxMethod.attr('sch-btn-release', 		'disabled', true);
        		SBUxMethod.attr('sch-btn-unrelease', 	'disabled', true);
        		
        		let insert_userid = SBUxMethod.get('sch-insert-userid');
        		if(insert_userid != p_userId || !p_summit_yn){
        			$('#main-btn-save', parent.document).attr('disabled', true);
        			$('#main-btn-del', parent.document).attr('disabled', true);
            		SBUxMethod.attr('sch-btn-submit', 		'disabled', true);
            		$('#btn1-row-add').attr('disabled', 	true);
            		$('#btn1-row-del').attr('disabled', 	true);
        		}
        	} else if(code=='3'){
        		
        		//승인중
    			$('#main-btn-save', parent.document).attr('disabled', true);
    			$('#main-btn-del', parent.document).attr('disabled', false);
        		
        		SBUxMethod.attr('sch-btn-submit', 		'disabled', false);
        		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', false);
        		SBUxMethod.attr('sch-btn-end', 			'disabled', true);
        		
        		$('#btn1-row-add').attr('disabled', 	false);
        		$('#btn1-row-del').attr('disabled', 	false);
        		SBUxMethod.attr('sch-btn-cancel', 		'disabled', true);
        		
        		SBUxMethod.attr('sch-btn-release', 		'disabled', true);
        		SBUxMethod.attr('sch-btn-unrelease', 	'disabled', true);
        		
        		let confirm_emp_code 		= SBUxMethod.get('sch-confirm-emp-code');
        		let proxy_emp_code 			= SBUxMethod.get('sch-proxy-emp-code');
        		let next_appr_emp_code		= SBUxMethod.get('sch-next-appr-emp-code');
        		let before_appr_emp_code	= SBUxMethod.get('sch-before-appr-emp-code');
        		let insert_userid			= SBUxMethod.get('sch-insert-userid');
        		let appr_id					= SBUxMethod.get('sch-appr-id');
        		
        		if( confirm_emp_code != p_ss_empCode && proxy_emp_code != p_ss_empCode && next_appr_emp_code != p_ss_empCode && before_appr_emp_code != p_ss_empCode ){
            		SBUxMethod.attr('sch-btn-submit', 		'disabled', true);
        		}
        		if( insert_userid == p_userId || before_appr_emp_code == p_userId || !p_summit_yn || p_ss_isAccountManager ){
        			$('#main-btn-save', parent.document).attr('disabled', 	false);
        			$('#main-btn-del', parent.document).attr('disabled', 	false);
            		SBUxMethod.attr('sch-btn-submit', 		'disabled', 	false);
        		}
        		if(p_ss_fiDeleteUser == p_userId){
        			$('#main-btn-del', parent.document).attr('disabled', 	false);
            		SBUxMethod.attr('sch-btn-submit', 		'disabled', 	false);
        		}
        		if(appr_id == ''){
            		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', 	true);
        		}
        	
        	} else if(code=='5'){
        		
        		//승인완료
    			$('#main-btn-save', parent.document).attr('disabled', true);
    			$('#main-btn-del', parent.document).attr('disabled', true);
        		
        		SBUxMethod.attr('sch-btn-submit', 		'disabled', true);
        		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', true);
    			
        		if(p_ss_isPostingUser){
            		SBUxMethod.attr('sch-btn-end', 		'disabled', false);
        		} else {
            		SBUxMethod.attr('sch-btn-end', 		'disabled', true);
        		}
        		SBUxMethod.attr('sch-btn-cancel', 		'disabled', true);
        		$('#btn1-row-add').attr('disabled', 	true);
        		$('#btn1-row-del').attr('disabled', 	true);
        		SBUxMethod.attr('sch-btn-release', 		'disabled', true);
        		SBUxMethod.attr('sch-btn-unrelease', 	'disabled', true);
    			
        		let insert_userid		= SBUxMethod.get('sch-insert-userid');
        		if(insert_userid == p_userId || !p_summit_yn){
        			$('#main-btn-save', parent.document).attr('disabled', false);
        			$('#main-btn-del', parent.document).attr('disabled', false);
            		$('#btn1-row-add').attr('disabled', 	false);
            		$('#btn1-row-del').attr('disabled', 	false);
        		}
        		if(p_ss_isAccountManager){
        			$('#main-btn-save', parent.document).attr('disabled', false);
        			$('#main-btn-del', parent.document).attr('disabled', false);
        		}
        		let appr_acount			= SBUxMethod.get('sch-appr-acount');
        		appr_acount = (appr_acount=="") ? '0' : appr_acount;
        		if(insert_userid == p_userId && appr_acount == "1" ){
            		SBUxMethod.attr('sch-btn-submit', 		'disabled', false);
        			$('#main-btn-del', parent.document).attr('disabled', false);
        		}
        		if(appr_acount != "0" ){
            		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', false);
        		}
        	} else {
        		
    			$('#main-btn-save', parent.document).attr('disabled', true);
    			$('#main-btn-del', parent.document).attr('disabled', true);
        		
        		SBUxMethod.attr('sch-btn-submit', 		'disabled', true);
        		let appr_id 			= SBUxMethod.get('sch-appr-id');
        		if(appr_id == ""){
            		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', true);
        		} else {
            		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', false);
        		}
        		SBUxMethod.attr('sch-btn-end', 		'disabled', true);
    			
        		let posting_date	= SBUxMethod.get('sch-posting-date');
        		let reverse_flag 	= SBUxMethod.get('sch-reverse-flag');
        		if(posting_date != "" && reverse_flag != "Y" && p_ss_isPostingUser){
        			$('#main-btn-cancel', parent.document).attr('disabled', false);
        		} else {
        			$('#main-btn-cancel', parent.document).attr('disabled', true);
        		}
        		$('#btn1-row-add').attr('disabled', 	true);
        		$('#btn1-row-del').attr('disabled', 	true);
        		if(p_ss_isAccountManager){
            		SBUxMethod.attr('sch-btn-release', 		'disabled', false);
            		SBUxMethod.attr('sch-btn-unrelease', 	'disabled', false);
            		//this
                    //colhold_flag.OptionsColumn.ReadOnly = false;
                    //colhold_reason.OptionsColumn.ReadOnly = false;
        		}
        	}
    		
    		let insert_userid		= SBUxMethod.get('sch-insert-userid');
    		if(p_ss_isAccountManager || insert_userid == p_userId || code=='1'){
                //panHeader.ActionMode = ActionMode.Save;
                //gvwInfo.ActionMode = ActionMode.Save;
    		} else {
                //panHeader.ActionMode = ActionMode.View;
                //gvwInfo.ActionMode = ActionMode.View;
    		}
    		if(p_ss_issAccountChief || p_ss_isAccountManager){
    			SBUxMethod.show('sch-btn-descUpdate');
        		let doc_type = SBUxMethod.get('sch-doc-type');
    			if( doc_type == '31' || doc_type == '15' || doc_type == '11' ){
            		SBUxMethod.attr('sch-btn-scm', 		'disabled', false);
    			}
    		}
    		
    	}    		
    	
    }
    
    /**
     * 초기화
     */
    var cfn_init = function() {
    	pg_state = 'new';
    	fn_init(false);
    	fn_createGrid2210();	
    	gfnma_uxDataClear('#tab1');
    	gfnma_uxDataClear('#tab2');
    	fn_gridTotal();
    }
    
    /**
     * 신규
     */
     var cfn_add = function() {
    	pg_state = 'new';
    	fn_init(false);
    	fn_createGrid2210();	
    	gfnma_uxDataClear('#tab1');
    	gfnma_uxDataClear('#tab2');
    	
		$('#main-btn-add', parent.document).attr('disabled', 	true);
		$('#main-btn-save', parent.document).attr('disabled', 	false);
    }
    
    /**
     * 저장
     */
    function cfn_save() {

    	var len = jsonFig2210.length;
    	if(len==0){
    		gfn_comAlert("E0000","회계전표를 등록하세요");
    		return;
    	}
    	var chk = false;
    	for (var i = 0; i < jsonFig2210.length; i++) {
			var obj = jsonFig2210[i];
    		if(!obj['LINE_TYPE']){
        		gfn_comAlert("E0000","라인유형을 선택하세요");
        		chk = true;
        		break;
    		} else if(Number(obj['EXCHANGE_RATE'])==0 ){
        		gfn_comAlert("E0000","환율이 0 입니다.");
        		chk = true;
        		break;
    		} else if(!obj['ORIGINAL_AMT'] || isNaN(gfnma_getNumber(obj['ORIGINAL_AMT'])) || Number(obj['ORIGINAL_AMT'])==0 ){
        		gfn_comAlert("E0000","통화금액을 입력하세요");
        		chk = true;
        		break;
    		} else if(obj['LINE_TYPE'] == '3'){
    			//부가세
    			if(!obj['VAT_TYPE']){
            		gfn_comAlert("E0000","라인유형이 부가세 인경우 부가세유형을 선택하세요");
            		chk = true;
            		break;
    			}
    			if(obj['VAT_TYPE']!='VZ' || obj['VAT_TYPE']!='AZ'){
    				if(!obj['STANDARD_DATE']){
// 	            		gfn_comAlert("E0000","부가세 기타 유형이 아닌 경우 신고일자는 필수입력사항 입니다.");
// 	            		chk = true;
// 	            		break;
    				}
    			}
    			if(obj['VAT_TYPE']!='VZ' || obj['VAT_TYPE']!='AZ'){
    				if(!obj['SUPPLY_AMT']){
	            		gfn_comAlert("E0000","부가세 기타 유형이 아닌 경우 공급가액은 필수입력사항 입니다.");
	            		chk = true;
	            		break;
    				}
    			}
    			if(obj['ETAX_TYPE'] || obj['AFTER_DUE_DATE_YN']){
    				if(obj['CARD_USE_TYPE'] || obj['CARD_NUM']){
	            		gfn_comAlert("E0000","전자 발행일 경우 카드 용도를 입력하면 안됩니다.");
	            		chk = true;
	            		break;
    				}
    			}
				if(obj['CARD_USE_TYPE'] || obj['CARD_NUM']){
	    			if(obj['ETAX_TYPE'] || obj['AFTER_DUE_DATE_YN']){
	            		gfn_comAlert("E0000","카드 용도일 경우 전자 발행 정보를 입력하면 안됩니다");
	            		chk = true;
	            		break;
	    			}
				}
				if(obj['NONDED_YN']=='Y' && !obj['VAT_NOT_DEDUCTION_TYPE']){
            		gfn_comAlert("E0000","불공제부가세는 불공제유형이 필수 입력입니다.");
            		chk = true;
            		break;
				}
    		} else if(obj['LINE_TYPE'] == '1'){
    			//헤더일경우
    			if(!obj['PAY_TERM_CODE']){
            		gfn_comAlert("E0000","헤더 라인일 경우 지급 조건은 필수 입니다.");
            		chk = true;
            		break;
    			}
    			if(!obj['CS_CODE']){
            		gfn_comAlert("E0000","헤더 라인일 경우 거래처는 필수 입니다.");
            		chk = true;
            		break;
    			}
    			if(obj['TXN_STOP_YN']=='Y'){
            		gfn_comAlert("E0000","거래중지 업체는 전표작성이 불가합니다.");
            		chk = true;
            		break;
    			}
    			if(obj['VAT_TYPE']=='VK' || obj['VAT_TYPE']=='VL' || obj['VAT_TYPE']=='VM'){
    				jsonFig2210[i]['VOUCHER_TYPE'] 	= 'C';
    				jsonFig2210[i]['VOUCHER_NO'] 	= SBUxMethod.get("ACC_ITEM_VALUE1");
    			}
    		} else if(obj['ACC_CATEGORY'] == 'D' || obj['ACC_CATEGORY'] == 'E'){
    			if(!obj['COST_CENTER_CODE']){
            		gfn_comAlert("E0000","수익,비용인 경우 원가중심점이 필수 입니다.");
            		chk = true;
            		break;
    			}
    			if(!obj['DEPT_NAME']){
            		gfn_comAlert("E0000","수익,비용인 경우 부서는 필수 입니다.");
            		chk = true;
            		break;
    			}
    		} else if(!obj['DEBIT_CREDIT']){
        		gfn_comAlert("E0000","차/대를 선택하세요");
        		chk = true;
        		break;
    		} else if(!obj['ACCOUNT_CODE']){
        		gfn_comAlert("E0000","계정코드를 선택하세요");
        		chk = true;
        		break;
    		} else if(!obj['SITE_CODE']){
        		gfn_comAlert("E0000","사업장은 필수 입력입니다.");
        		chk = true;
        		break;
    		} else if(!obj['DESCRIPTION']){
        		gfn_comAlert("E0000","적요는 필수 입력입니다.");
        		chk = true;
        		break;
    		} else if(obj['PROJECT_YN']=='Y'){
    			if(!obj['PROJECT_CODE']){
	        		gfn_comAlert("E0000","프로젝트는 필수 입니다.");
	        		chk = true;
	        		break;
    			}
    		} else if(obj['BASIS_TYPE']=='5'){
    			if(!obj['EXPECTED_PAY_DATE']){
	        		gfn_comAlert("E0000","지급기일은 필수 입력사항입니다.");
	        		chk = true;
	        		break;
    			}
    		} else if(obj['COST_CLASS']=='1' || obj['COST_CLASS']=='2' || obj['COST_CLASS']=='8'){
    			if(!obj['COST_CENTER_CODE']){
	        		gfn_comAlert("E0000","코스트센터는 필수 입력사항입니다.");
	        		chk = true;
	        		break;
    			}
    		}else if(obj['LINE_TYPE']!='3'){
    			var tchk = fn_tab2ValidateCheck(obj);
    			if(!tchk) {
    				chk = true;
    				break;
    			}
    		}
    	}
    	if(chk) return;

		var ckobj = fn_gridTotal();            
		console.log('ckobj:', ckobj);		
    	if(ckobj['D'] != ckobj['C']){
    		gfn_comAlert("E0000","차대금액이 맞지 않습니다. 금액을 확인하세요");
    		return;
    	}
    	
		// 신규 등록
		if(gfn_comConfirm("Q0001", "저장")){
			fn_subInsert();
		} 
    }
    
    /**
     * tab2 벨리데이션 check
     */
    var fn_tab2ValidateCheck = function(obj){
    	var chk 	 = true;
    	var colName1 = '';
    	var colName2 = '';
    	var colName3 = '';
    	for (var i = 1; i < 11; i++) {
    		colName1 = 'ACC_ITEM_YN' 	+ i;
    		colName2 = 'ACC_ITEM_CODE' 	+ i;
    		colName3 = 'ACC_ITEM_VALUE'	+ i;
        	if(obj[colName1]=='Y' && Number(obj['ORIGINAL_AMT']) != 0){
    	    	if(obj[colName2] && !obj[colName3]){
    	    		gfn_comAlert("E0000","관리항목을 입력해야 합니다.");
    	    		chk = false;
    	    		break;
    	    	}
        	}
		}
    	return chk;
    }
    
    /**
     * 저장
     */   
    const fn_subInsert = async function (){
    	
    	var p_doc_batch_no			= gfnma_nvl(SBUxMethod.get("sch-doc-batch-no"));
    	var p_doc_id				= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
		p_doc_id = (!p_doc_id) ? '0' : p_doc_id;
    	
    	var p_source_id				= '1';
    	var p_acct_rule_code		= gfnma_nvl(SBUxMethod.get("sch-acct-rule-code"));
    	var p_hold_flag				= gfnma_nvl(SBUxMethod.get('sch-hold-flag'));
    	var p_fi_org_code			= gfnma_nvl(SBUxMethod.get("sch-fi-org-code"));
    	var p_doc_date				= gfnma_getNumber(gfnma_nvl(SBUxMethod.get("sch-doc-date")));
    	var p_doc_name				= gfnma_nvl(SBUxMethod.get("sch-doc-name"));
    	var p_site_code				= gfnma_nvl(SBUxMethod.get("sch-site-code"));
    	var p_doc_type				= gfnma_nvl(SBUxMethod.get("sch-doc-type"));
    	var p_dept_code				= gfnma_nvl(SBUxMethod.get("sch-dept-code"));
    	var p_entry_path			= 'FI100';
    	var p_doc_amt				= '0';
    	var p_doc_status			= gfnma_nvl(SBUxMethod.get("sch-doc-status"));
    	var p_source_type			= gfnma_nvl(SBUxMethod.get("sch-txtsource-type2"));
    	var p_currency_code			= gfnma_nvl(SBUxMethod.get("sch-currency-code"));
    	var p_exchange_type			= gfnma_nvl(SBUxMethod.get("sch-exchange-type"));
    	var p_exchange_rate			= gfnma_nvl(SBUxMethod.get("sch-exchange-rate"));
    	var p_description			= gfnma_nvl(SBUxMethod.get("sch-description"));
    	var p_acct_opinion			= gfnma_nvl(SBUxMethod.get("sch-acct-opinion"));
    	var p_tr_opinion			= gfnma_nvl(SBUxMethod.get("sch-tr-opinion"));
    	var p_txtsource_type2		= gfnma_nvl(SBUxMethod.get("sch-txtsource-type2"));
    	var p_tax_site_code			= gfnma_nvl(SBUxMethod.get("sch-tax-site-code"));
    	var p_sub_tax_site_code		= gfnma_nvl(SBUxMethod.get("sch-sub-tax-site-code"));
    	var p_voucher_receipt_date	= gfnma_nvl(SBUxMethod.get("sch-voucher-receipt-date"));
    	
    	var stritem_id 				= "";
    	var stritem_seq 			= "";
    	var strfi_org_code 			= "";
    	var strline_type 			= "";
    	var straccount_code 		= "";
    	var strdebit_credit 		= "";
    	var strorigin_dr_amt 		= "";
    	var strorigin_cr_amt 		= "";
    	var strfunctional_dr_amt 	= "";
    	var strfunctional_cr_amt 	= "";
    	var strvat_type 			= "";
    	var stritem_code 			= "";
    	var struom 					= "";
    	var strtxn_qty 				= "";
    	var strdept_code 			= "";
    	var strcost_center_code 	= "";
    	var strproject_code 		= "";
    	var strdescription 			= "";

    	var stracc_item_code1 		= "";
    	var stracc_item_value1 		= "";
    	var stracc_item_code2 		= "";
    	var stracc_item_value2 		= "";
    	var stracc_item_code3 		= "";
    	var stracc_item_value3 		= "";
    	var stracc_item_code4 		= "";
    	var stracc_item_value4 		= "";
    	var stracc_item_code5 		= "";
    	var stracc_item_value5 		= "";
    	var stracc_item_code6 		= "";
    	var stracc_item_value6 		= "";
    	var stracc_item_code7 		= "";
    	var stracc_item_value7 		= "";
    	var stracc_item_code8 		= "";
    	var stracc_item_value8 		= "";
    	var stracc_item_code9 		= "";
    	var stracc_item_value9 		= "";
    	var stracc_item_code10 		= "";
    	var stracc_item_value10 	= "";

    	var stracc_value_name1 		= "";
    	var stracc_value_name2 		= "";
    	var stracc_value_name3 		= "";
    	var stracc_value_name4 		= "";
    	var stracc_value_name5 		= "";
    	var stracc_value_name6 		= "";
    	var stracc_value_name7 		= "";
    	var stracc_value_name8 		= "";
    	var stracc_value_name9 		= "";
    	var stracc_value_name10 	= "";

    	var stritem_source_type_d 	= "";
    	var stritem_source_id_d 	= "";
    	var strsource_record_count_d = "";

    	var strsum_acc_item1 		= "";
    	var strsum_acc_value1 		= "";
    	var strsum_acc_item2 		= "";
    	var strsum_acc_value2 		= "";

    	var strcs_code 				= "";
    	var strfce_gb 				= "";
    	var strcurrency_code 		= "";
    	var strexchange_type 		= "";
    	var strexchange_rate 		= "";
    	var strpay_method 			= "";
    	var strexpected_pay_date 	= "";
    	var strvoucher_type 		= "";
    	var strvoucher_no 			= "";
    	var strpayee_code 			= "";
    	var strcard_no 				= "";
    	var strvoucher_receipt_date = "";
    	var strpay_term_code 		= "";
    	var strwithhold_flag 		= "";
    	var strwithhold_tax_type 	= "";
    	var strwithhold_cs_code 	= "";
    	var strwithhold_tax_type2 	= "";
    	var strwithhold_cs_code2 	= "";
    	var strsite_code 			= "";
    	var strcredit_area 			= "";
    	var strsales_person 		= "";
    	var strpo_line_no 			= "";
    	var strsales_cs_code 		= "";
    	var strapply_complete_flag 	= "";
    	var strapply_complete_date 	= "";

    	var strhold_flag 			= "";
    	var strrelease_date 		= "";
    	var strrelease_user 		= "";
    	var strhold_date 			= "";
    	var strhold_user 			= "";
    	var strhold_reason 			= "";
    	var strpay_base_date 		= "";
    	var strbill_due_date 		= "";
    	var strbill_due_day 		= "";
    	var strbill_due_pay_date 	= "";
    	var strpay_term_orig 		= "";
    	var strprod_group 			= "";
    	var strbank_account_seq 	= "";

    	var stretax_type 			= "";
    	var strafter_due_date_yn 	= "";
    	var strdup_issue_bill_type 	= "";
    	var strexclude_revenue_amt_yn = "";
    	var strcard_use_type 		= "";
    	var strcard_num 			= "";
    	var strvat_not_deduction_type = "";
    	var strreport_omit_yn 		= "";
    	var strstandard_date 		= "";
    	var strvat_asset_type 		= "";
    	var strsupply_amt 			= "";

    	var strzero_report_yn 		= "";
    	var strlocal_credit_type 	= "";
    	var strdocument_name 		= "";
    	var strissue_name 			= "";
    	var strdocument_issue_date 	= "";
    	var strexport_license_no 	= "";
    	var strshipping_date 		= "";
    	var strexport_amt 			= "";
    	var strexport_amt_krw 		= "";
    	var strvat_export_amt 		= "";
    	var strvat_export_amt_krw 	= "";
    	var strforeign_amt 			= "";
    	var strwon_amt 				= "";
    	var strdocument_no 			= "";
    	var strzero_type 			= "";
    	var strvat_amt 				= "";
    	
    	var fn_convert = function(data_type, acc_item_value){
    		var rstr = '';
    		if(data_type && acc_item_value){
    			if(data_type=='TEXT' || data_type=='POPUP'){
                    rstr = acc_item_value + "|";
    			} else if(data_type=='NUM'){
                    rstr = acc_item_value.replace(/,/gi, "") + "|";
    			} else if(data_type=='YYYY' || data_type=='YYYYMM' || data_type=='YYYYMMDD'){
                    rstr = acc_item_value.replace(/-/gi, "") + "|";
    			} else {
        			rstr = '|';
    			}
    		} else {
    			rstr = '|';
    		}
    		return rstr;
    	}
    	
		var list = Fig2210Grid.getGridDataAll();
		for (var i = 0; i < list.length; i++) {
			stritem_id 				+=	gfnma_nvl(list[i]['ITEM_ID']) + "|";	
			stritem_seq				+=	gfnma_nvl(list[i]['ITEM_SEQ']) + "|";	
			strfi_org_code			+=	((!list[i]['FI_ORG_CODE']) ? p_fi_org_code : gfnma_nvl(list[i]['FI_ORG_CODE'])) + "|";	
			strline_type			+=	gfnma_nvl(list[i]['LINE_TYPE']) + "|";	
			straccount_code			+=	gfnma_nvl(list[i]['ACCOUNT_CODE']) + "|";	
			strdebit_credit			+=	gfnma_nvl(list[i]['DEBIT_CREDIT']) + "|";	
			strorigin_dr_amt		+=	((list[i]['DEBIT_CREDIT']=='D') ? gfnma_nvl(list[i]['ORIGINAL_AMT']) : '0') + "|";	
			strorigin_cr_amt		+=	((list[i]['DEBIT_CREDIT']=='C') ? gfnma_nvl(list[i]['ORIGINAL_AMT']) : '0') + "|";	
			strfunctional_dr_amt	+=	((list[i]['DEBIT_CREDIT']=='D') ? gfnma_nvl(list[i]['FUNCTIONAL_AMT']) : '0') + "|";	
			strfunctional_cr_amt	+=	((list[i]['DEBIT_CREDIT']=='C') ? gfnma_nvl(list[i]['FUNCTIONAL_AMT']) : '0') + "|";	
			strvat_type				+=	gfnma_nvl(list[i]['VAT_TYPE']) + "|";	
			
			stritem_code			+=	gfnma_nvl(list[i]['ITEM_CODE']) + "|";	
			struom					+=	gfnma_nvl(list[i]['UOM']) + "|";	
			strtxn_qty				+=	((!list[i]['TXN_QTY']) ? '0' : gfnma_nvl(list[i]['TXN_QTY'])) + "|";	
			strdept_code			+=	gfnma_nvl(list[i]['DEPT_CODE']) + "|";	
			strcost_center_code		+=	gfnma_nvl(list[i]['COST_CENTER_CODE']) + "|";	
			strproject_code			+=	gfnma_nvl(list[i]['PROJECT_CODE']) + "|";	
			
// 			var temp1 = gfnma_nvl(list[i]['DESCRIPTION']);
// 			temp1 = temp1.replace(/|/gi, "_");
// 			temp1 = temp1.replace(/'/gi, "`");
// 			strdescription			+= temp1 + "|";
			strdescription			+=	gfnma_nvl(list[i]['DESCRIPTION']) + "|";	
			
            stracc_item_code1 		+= 	gfnma_nvl(list[i]['ACC_ITEM_CODE1']) + "|";	
            stracc_item_code2 		+= 	gfnma_nvl(list[i]['ACC_ITEM_CODE2']) + "|";	
            stracc_item_code3 		+= 	gfnma_nvl(list[i]['ACC_ITEM_CODE3']) + "|";	
            stracc_item_code4 		+= 	gfnma_nvl(list[i]['ACC_ITEM_CODE4']) + "|";	
            stracc_item_code5 		+= 	gfnma_nvl(list[i]['ACC_ITEM_CODE5']) + "|";	
            stracc_item_code6 		+= 	gfnma_nvl(list[i]['ACC_ITEM_CODE6']) + "|";	
            stracc_item_code7 		+= 	gfnma_nvl(list[i]['ACC_ITEM_CODE7']) + "|";	
            stracc_item_code8 		+= 	gfnma_nvl(list[i]['ACC_ITEM_CODE8']) + "|";	
            stracc_item_code9 		+= 	gfnma_nvl(list[i]['ACC_ITEM_CODE9']) + "|";	
            stracc_item_code10 		+= 	gfnma_nvl(list[i]['ACC_ITEM_CODE10']) + "|";	
			
			stracc_item_value1		+=	fn_convert(gfnma_nvl(list[i]['DATA_TYPE1']), gfnma_nvl(list[i]['ACC_ITEM_VALUE1']));	
			stracc_item_value2		+=	fn_convert(gfnma_nvl(list[i]['DATA_TYPE2']), gfnma_nvl(list[i]['ACC_ITEM_VALUE2']));
			stracc_item_value3		+=	fn_convert(gfnma_nvl(list[i]['DATA_TYPE3']), gfnma_nvl(list[i]['ACC_ITEM_VALUE3']));
			stracc_item_value4		+=	fn_convert(gfnma_nvl(list[i]['DATA_TYPE4']), gfnma_nvl(list[i]['ACC_ITEM_VALUE4']));
			stracc_item_value5		+=	fn_convert(gfnma_nvl(list[i]['DATA_TYPE5']), gfnma_nvl(list[i]['ACC_ITEM_VALUE5']));
			stracc_item_value6		+=	fn_convert(gfnma_nvl(list[i]['DATA_TYPE6']), gfnma_nvl(list[i]['ACC_ITEM_VALUE6']));
			stracc_item_value7		+=	fn_convert(gfnma_nvl(list[i]['DATA_TYPE7']), gfnma_nvl(list[i]['ACC_ITEM_VALUE7']));
			stracc_item_value8		+=	fn_convert(gfnma_nvl(list[i]['DATA_TYPE8']), gfnma_nvl(list[i]['ACC_ITEM_VALUE8']));
			stracc_item_value9		+=	fn_convert(gfnma_nvl(list[i]['DATA_TYPE9']), gfnma_nvl(list[i]['ACC_ITEM_VALUE9']));
			stracc_item_value10		+=	fn_convert(gfnma_nvl(list[i]['DATA_TYPE10']), gfnma_nvl(list[i]['ACC_ITEM_VALUE10']));

			stracc_value_name1 		+=	gfnma_nvl(list[i]['ACC_VALUE_NAME1']) + "|";
			stracc_value_name2 		+=	gfnma_nvl(list[i]['ACC_VALUE_NAME2']) + "|";
			stracc_value_name3 		+=	gfnma_nvl(list[i]['ACC_VALUE_NAME3']) + "|";
			stracc_value_name4 		+=	gfnma_nvl(list[i]['ACC_VALUE_NAME4']) + "|";
			stracc_value_name5 		+=	gfnma_nvl(list[i]['ACC_VALUE_NAME5']) + "|";
			stracc_value_name6 		+=	gfnma_nvl(list[i]['ACC_VALUE_NAME6']) + "|";
			stracc_value_name7 		+=	gfnma_nvl(list[i]['ACC_VALUE_NAME7']) + "|";
			stracc_value_name8 		+=	gfnma_nvl(list[i]['ACC_VALUE_NAME8']) + "|";
			stracc_value_name9 		+=	gfnma_nvl(list[i]['ACC_VALUE_NAME9']) + "|";
			stracc_value_name10		+=	gfnma_nvl(list[i]['ACC_VALUE_NAME10']) + "|";
			
            stritem_source_type_d		+=	gfnma_nvl(list[i]['ITEM_SOURCE_TYPE']) + "|";
            stritem_source_id_d			+=	gfnma_nvl(list[i]['ITEM_SOURCE_ID']) + "|";
            strsource_record_count_d	+=	gfnma_nvl(list[i]['SOURCE_RECORD_COUNT']) + "|";
			
            strexpected_pay_date	+=	gfnma_getNumber(gfnma_nvl(list[i]['EXPECTED_PAY_DATE'])) + "|";
            strpay_term_code		+=	gfnma_nvl(list[i]['PAY_TERM_CODE']) + "|";
            strpay_method			+=	gfnma_nvl(list[i]['PAY_METHOD']) + "|";
            
            strcs_code				+=	gfnma_nvl(list[i]['CS_CODE']) + "|";
            strfce_gb 				+= "" + "|";
            strcurrency_code		+=	gfnma_nvl(list[i]['CURRENCY_CODE']) + "|";
            strexchange_type		+=	gfnma_nvl(list[i]['EXCHANGE_TYPE']) + "|";
            strexchange_rate		+=	gfnma_nvl(list[i]['EXCHANGE_RATE']) + "|";
            
            strvoucher_type			+=	gfnma_nvl(list[i]['VOUCHER_TYPE']) + "|";
            strvoucher_no			+=	gfnma_nvl(list[i]['VOUCHER_NO']) + "|";
            strpayee_code			+=	gfnma_nvl(list[i]['PAYEE_CODE']) + "|";
            strcard_no				+=	gfnma_nvl(list[i]['CARD_NO']) + "|";
            strvoucher_receipt_date	+=	((list[i]['LINE_TYPE']=='1') ? gfnma_getNumber(p_voucher_receipt_date) : '') + "|";	
            
            strwithhold_flag		+=	gfnma_nvl(list[i]['WITHHOLD_FLAG']) + "|";
            strwithhold_tax_type	+=	gfnma_nvl(list[i]['WITHHOLD_TAX_TYPE']) + "|";
            strwithhold_cs_code		+=	gfnma_nvl(list[i]['WITHHOLD_CS_CODE']) + "|";
            strwithhold_tax_type2	+=	gfnma_nvl(list[i]['WITHHOLD_TAX_TYPE2']) + "|";
            strwithhold_cs_code2	+=	gfnma_nvl(list[i]['WITHHOLD_CS_CODE2']) + "|";
            
            strsite_code			+=	gfnma_nvl(list[i]['SITE_CODE']) + "|";
            strcredit_area			+=	gfnma_nvl(list[i]['CREDIT_AREA']) + "|";
            strsales_person			+=	gfnma_nvl(list[i]['SALES_PERSON']) + "|";
            strpo_line_no			+=	gfnma_nvl(list[i]['PO_LINE_NO']) + "|";
            strsales_cs_code		+=	gfnma_nvl(list[i]['SALES_CS_CODE']) + "|";
            strapply_complete_flag	+=	gfnma_nvl(list[i]['APPLY_COMPLETE_FLAG']) + "|";
            strapply_complete_date	+=	gfnma_nvl(list[i]['APPLY_COMPLETE_DATE']) + "|";
            
            strhold_flag			+=	gfnma_nvl(list[i]['HOLD_FLAG']) + "|";
            strrelease_date			+=	gfnma_nvl(list[i]['RELEASE_DATE']) + "|";
            strrelease_user			+=	gfnma_nvl(list[i]['RELEASE_USER']) + "|";
            strhold_date			+=	gfnma_nvl(list[i]['HOLD_DATE']) + "|";
            strhold_user			+=	gfnma_nvl(list[i]['HOLD_USER']) + "|";
            strhold_reason			+=	gfnma_nvl(list[i]['HOLD_REASON']) + "|";
            
            strpay_base_date		+=	((list[i]['LINE_TYPE']=='1') ? gfnma_getNumber(gfnma_nvl(list[i]['PAY_BASE_DATE'])) : '') + "|";	
            strbill_due_date		+=	gfnma_getNumber(gfnma_nvl(list[i]['BILL_DUE_DATE'])) + "|";
            strbill_due_day			+=	gfnma_nvl(list[i]['BILL_DUE_DAY']) + "|";
            strbill_due_pay_date	+=	gfnma_getNumber(gfnma_nvl(list[i]['BILL_DUE_PAY_DATE'])) + "|";
            strpay_term_orig		+=	((list[i]['LINE_TYPE']=='1') ? gfnma_nvl(list[i]['PAY_TERM_CODE']) : '') + "|";	
            strprod_group			+=	gfnma_nvl(list[i]['PROD_GROUP']) + "|";
            strbank_account_seq		+=	gfnma_nvl(list[i]['BANK_ACCOUNT_SEQ']) + "|";
                
            strsum_acc_item1 		+= "" + "|";
            strsum_acc_value1 		+= "" + "|";
            strsum_acc_item2 		+= "" + "|";
            strsum_acc_value2 		+= "" + "|";
            
            stretax_type				+=	gfnma_nvl(list[i]['ETAX_TYPE']) + "|";
            strafter_due_date_yn		+=	gfnma_nvl(list[i]['AFTER_DUE_DATE_YN']) + "|";
            strdup_issue_bill_type		+=	gfnma_nvl(list[i]['DUP_ISSUE_BILL_TYPE']) + "|";
            strexclude_revenue_amt_yn	+=	gfnma_nvl(list[i]['EXCLUDE_REVENUE_AMT_YN']) + "|";
            strcard_use_type			+=	gfnma_nvl(list[i]['CARD_USE_TYPE']) + "|";
            strcard_num					+=	gfnma_nvl(list[i]['CARD_NUM']) + "|";
            strvat_not_deduction_type	+=	gfnma_nvl(list[i]['VAT_NOT_DEDUCTION_TYPE']) + "|";
            strreport_omit_yn			+=	gfnma_nvl(list[i]['REPORT_OMIT_YN']) + "|";
            strstandard_date			+=	gfnma_getNumber(gfnma_nvl(list[i]['STANDARD_DATE'])) + "|";
            strvat_asset_type			+=	gfnma_nvl(list[i]['VAT_ASSET_TYPE']) + "|";
            strsupply_amt				+=	gfnma_nvl(list[i]['SUPPLY_AMT']) + "|";
            
            strzero_report_yn			+=	gfnma_nvl(list[i]['ZERO_REPORT_YN']) + "|";
            strlocal_credit_type		+=	gfnma_nvl(list[i]['LOCAL_CREDIT_TYPE']) + "|";
            strdocument_name			+=	gfnma_nvl(list[i]['DOCUMENT_NAME']) + "|";
            strissue_name				+=	gfnma_nvl(list[i]['ISSUE_NAME']) + "|";
            
            strdocument_issue_date		+=	gfnma_nvl(list[i]['DOCUMENT_ISSUE_DATE']) + "|";
            strexport_license_no		+=	gfnma_nvl(list[i]['EXPORT_LICENSE_NO']) + "|";
            strshipping_date			+=	gfnma_getNumber(gfnma_nvl(list[i]['SHIPPING_DATE'])) + "|";
            strexport_amt				+=	gfnma_nvl(list[i]['EXPORT_AMT']) + "|";
            strexport_amt_krw			+=	gfnma_nvl(list[i]['EXPORT_AMT_KRW']) + "|";
            strvat_export_amt			+=	gfnma_nvl(list[i]['VAT_EXPORT_AMT']) + "|";
            strvat_export_amt_krw		+=	gfnma_nvl(list[i]['VAT_EXPORT_AMT_KRW']) + "|";
            
            strforeign_amt				+=	gfnma_nvl(list[i]['FOREIGN_AMT']) + "|";
            strwon_amt					+=	gfnma_nvl(list[i]['WON_AMT']) + "|";
            strdocument_no				+=	gfnma_nvl(list[i]['DOCUMENT_NO']) + "|";
            strzero_type				+=	gfnma_nvl(list[i]['ZERO_TYPE']) + "|";
            strvat_amt					+=	gfnma_nvl(list[i]['VAT_AMT']) + "|";
		}
		
		if(list.length > 0){
			
            stritem_id				= stritem_id.slice(0, -1);
            stritem_seq				= stritem_seq.slice(0, -1);
            strfi_org_code			= strfi_org_code.slice(0, -1);
            strline_type			= strline_type.slice(0, -1);
            straccount_code			= straccount_code.slice(0, -1);
            strdebit_credit			= strdebit_credit.slice(0, -1);
            strorigin_dr_amt		= strorigin_dr_amt.slice(0, -1);
            strorigin_cr_amt		= strorigin_cr_amt.slice(0, -1);
            strfunctional_dr_amt	= strfunctional_dr_amt.slice(0, -1);
            strfunctional_cr_amt	= strfunctional_cr_amt.slice(0, -1);
            strvat_type				= strvat_type.slice(0, -1);
            
            stritem_code			= stritem_code.slice(0, -1);
            struom					= struom.slice(0, -1);
            strtxn_qty				= strtxn_qty.slice(0, -1);
            strdept_code			= strdept_code.slice(0, -1);
            strcost_center_code		= strcost_center_code.slice(0, -1);
            strproject_code			= strproject_code.slice(0, -1);
            strdescription			= strdescription.slice(0, -1);
            
            stracc_item_code1		= stracc_item_code1.slice(0, -1);
            stracc_item_code2		= stracc_item_code2.slice(0, -1);
            stracc_item_code3		= stracc_item_code3.slice(0, -1);
            stracc_item_code4		= stracc_item_code4.slice(0, -1);
            stracc_item_code5		= stracc_item_code5.slice(0, -1);
            stracc_item_code6		= stracc_item_code6.slice(0, -1);
            stracc_item_code7		= stracc_item_code7.slice(0, -1);
            stracc_item_code8		= stracc_item_code8.slice(0, -1);
            stracc_item_code9		= stracc_item_code9.slice(0, -1);
            stracc_item_code10		= stracc_item_code10.slice(0, -1);
            
            stracc_item_value1		= stracc_item_value1.slice(0, -1);
            stracc_item_value2		= stracc_item_value2.slice(0, -1);
            stracc_item_value3		= stracc_item_value3.slice(0, -1);
            stracc_item_value4		= stracc_item_value4.slice(0, -1);
            stracc_item_value5		= stracc_item_value5.slice(0, -1);
            stracc_item_value6		= stracc_item_value6.slice(0, -1);
            stracc_item_value7		= stracc_item_value7.slice(0, -1);
            stracc_item_value8		= stracc_item_value8.slice(0, -1);
            stracc_item_value9		= stracc_item_value9.slice(0, -1);
            stracc_item_value10		= stracc_item_value10.slice(0, -1);

            stracc_value_name1		= stracc_value_name1.slice(0, -1);
            stracc_value_name2		= stracc_value_name2.slice(0, -1);
            stracc_value_name3		= stracc_value_name3.slice(0, -1);
            stracc_value_name4		= stracc_value_name4.slice(0, -1);
            stracc_value_name5		= stracc_value_name5.slice(0, -1);
            stracc_value_name6		= stracc_value_name6.slice(0, -1);
            stracc_value_name7		= stracc_value_name7.slice(0, -1);
            stracc_value_name8		= stracc_value_name8.slice(0, -1);
            stracc_value_name9		= stracc_value_name9.slice(0, -1);
            stracc_value_name10		= stracc_value_name10.slice(0, -1);
            
            stritem_source_type_d		= stritem_source_type_d.slice(0, -1);
            stritem_source_id_d			= stritem_source_id_d.slice(0, -1);
            strsource_record_count_d	= strsource_record_count_d.slice(0, -1);
            
            strexpected_pay_date		= strexpected_pay_date.slice(0, -1);
            strpay_term_code			= strpay_term_code.slice(0, -1);
            strpay_method				= strpay_method.slice(0, -1);
            strcs_code					= strcs_code.slice(0, -1);
            strfce_gb					= strfce_gb.slice(0, -1);
            strcurrency_code			= strcurrency_code.slice(0, -1);
            strexchange_type			= strexchange_type.slice(0, -1);
            strexchange_rate			= strexchange_rate.slice(0, -1);
            
            strvoucher_type				= strvoucher_type.slice(0, -1);
            strvoucher_no				= strvoucher_no.slice(0, -1);
            strpayee_code				= strpayee_code.slice(0, -1);
            strcard_no					= strcard_no.slice(0, -1);
            strvoucher_receipt_date		= strvoucher_receipt_date.slice(0, -1);
            
            strwithhold_flag			= strwithhold_flag.slice(0, -1);
            strwithhold_tax_type		= strwithhold_tax_type.slice(0, -1);
            strwithhold_cs_code			= strwithhold_cs_code.slice(0, -1);
            strwithhold_tax_type2		= strwithhold_tax_type2.slice(0, -1);
            strwithhold_cs_code2		= strwithhold_cs_code2.slice(0, -1);
            strsite_code				= strsite_code.slice(0, -1);
            strcredit_area				= strcredit_area.slice(0, -1);
            strsales_person				= strsales_person.slice(0, -1);
            strpo_line_no				= strpo_line_no.slice(0, -1);
            strsales_cs_code			= strsales_cs_code.slice(0, -1);
            strapply_complete_flag		= strapply_complete_flag.slice(0, -1);
            strapply_complete_date		= strapply_complete_date.slice(0, -1);
            
            strhold_flag				= strhold_flag.slice(0, -1);
            strrelease_date				= strrelease_date.slice(0, -1);
            strrelease_user				= strrelease_user.slice(0, -1);
            strhold_date				= strhold_date.slice(0, -1);
            strhold_user				= strhold_user.slice(0, -1);
            strhold_reason				= strhold_reason.slice(0, -1);
            strpay_base_date			= strpay_base_date.slice(0, -1);
            strbill_due_date			= strbill_due_date.slice(0, -1);
            strbill_due_day				= strbill_due_day.slice(0, -1);
            strbill_due_pay_date		= strbill_due_pay_date.slice(0, -1);
            strpay_term_orig			= strpay_term_orig.slice(0, -1);
            strprod_group				= strprod_group.slice(0, -1);
            strbank_account_seq			= strbank_account_seq.slice(0, -1);
            
            strsum_acc_item1			= strsum_acc_item1.slice(0, -1);
            strsum_acc_item2			= strsum_acc_item2.slice(0, -1);
            strsum_acc_value1			= strsum_acc_value1.slice(0, -1);
            strsum_acc_value2			= strsum_acc_value2.slice(0, -1);
            
            stretax_type				= stretax_type.slice(0, -1);
            strafter_due_date_yn		= strafter_due_date_yn.slice(0, -1);
            strdup_issue_bill_type		= strdup_issue_bill_type.slice(0, -1);
            strexclude_revenue_amt_yn	= strexclude_revenue_amt_yn.slice(0, -1);
            strcard_use_type			= strcard_use_type.slice(0, -1);
            strcard_num					= strcard_num.slice(0, -1);
            strvat_not_deduction_type	= strvat_not_deduction_type.slice(0, -1);
            strreport_omit_yn			= strreport_omit_yn.slice(0, -1);
            strstandard_date			= strstandard_date.slice(0, -1);
            strvat_asset_type			= strvat_asset_type.slice(0, -1);
            strsupply_amt				= strsupply_amt.slice(0, -1);
            strzero_report_yn			= strzero_report_yn.slice(0, -1);
            strlocal_credit_type		= strlocal_credit_type.slice(0, -1);
            strdocument_name			= strdocument_name.slice(0, -1);
            strissue_name				= strissue_name.slice(0, -1);
            strdocument_issue_date		= strdocument_issue_date.slice(0, -1);
            strexport_license_no		= strexport_license_no.slice(0, -1);
            strshipping_date			= strshipping_date.slice(0, -1);
            strexport_amt				= strexport_amt.slice(0, -1);
            strexport_amt_krw			= strexport_amt_krw.slice(0, -1);
            strvat_export_amt			= strvat_export_amt.slice(0, -1);
            strvat_export_amt_krw		= strvat_export_amt_krw.slice(0, -1);
            strforeign_amt				= strforeign_amt.slice(0, -1);
            strwon_amt					= strwon_amt.slice(0, -1);
            strdocument_no				= strdocument_no.slice(0, -1);
            strzero_type				= strzero_type.slice(0, -1);
            strvat_amt					= strvat_amt.slice(0, -1);
		}
		
 	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
			,IV_P_DOC_BATCH_NO			: p_doc_batch_no
			,V_P_DOC_ID					: p_doc_id
			,V_P_SOURCE_ID				: p_source_id
			,V_P_ACCT_RULE_CODE			: p_acct_rule_code
			,V_P_HOLD_FLAG				: p_hold_flag
			,V_P_FI_ORG_CODE			: p_fi_org_code
			,V_P_DOC_DATE				: p_doc_date
			,V_P_WRITE_DATE				: ''
			,V_P_APPROVE_DATE			: ''
			,V_P_DOC_NUM				: '0'
			,V_P_DOC_NAME				: p_doc_name
			,V_P_SITE_CODE				: p_site_code
			,V_P_DOC_TYPE				: p_doc_type
			,V_P_DEPT_CODE				: p_dept_code
			,V_P_ENTRY_PATH				: p_entry_path
			,V_P_DOC_AMT				: p_doc_amt
			,V_P_DOC_STATUS				: p_doc_status			
			,V_P_SOURCE_TYPE			: p_source_type			
			,V_P_CURRENCY_CODE			: p_currency_code
			,V_P_EXCHANGE_TYPE			: p_exchange_type
			,V_P_EXCHANGE_RATE          : p_exchange_rate 
			,V_P_DESCRIPTION            : p_description 
			,V_P_ACCT_OPINION           : p_acct_opinion
			,V_P_TR_OPINION             : p_tr_opinion
			,V_P_SOURCE_DOC             : p_txtsource_type2
			,V_P_TAX_SITE_CODE          : p_tax_site_code
			,V_P_SUB_TAX_SITE_CODE		: p_sub_tax_site_code
			
			,V_P_ITEM_ID_D    			: stritem_id           
			,V_P_ITEM_SEQ_D             : stritem_seq 
			,V_P_FI_ORG_CODE_D			: strfi_org_code           
			,V_P_LINE_TYPE_D			: strline_type             
			,V_P_ACCOUNT_CODE_D			: straccount_code          
			,V_P_DEBIT_CREDIT_D			: strdebit_credit          
			,V_P_ORIGINAL_DR_AMT_D		: strorigin_dr_amt       
			,V_P_ORIGINAL_CR_AMT_D		: strorigin_cr_amt       
			,V_P_FUNCTIONAL_DR_AMT_D	: strfunctional_dr_amt     
			,V_P_FUNCTIONAL_CR_AMT_D	: strfunctional_cr_amt     
			,V_P_VAT_TYPE_D				: strvat_type              
			,V_P_ITEM_CODE_D			: stritem_code             
			,V_P_UOM_D					: struom                   
			,V_P_TXN_QTY_D				: strtxn_qty               
			,V_P_DEPT_CODE_D			: strdept_code             
			,V_P_COST_CENTER_CODE_D 	: strcost_center_code     
			,V_P_PROJECT_CODE_D			: strproject_code          
			,V_P_DESCRIPTION_D			: strdescription           
			,V_P_ACC_ITEM_CODE1_D		: stracc_item_code1        
			,V_P_ACC_ITEM_VALUE1_D		: stracc_item_value1       
			,V_P_ACC_ITEM_CODE2_D		: stracc_item_code2        
			,V_P_ACC_ITEM_VALUE2_D		: stracc_item_value2       
			,V_P_ACC_ITEM_CODE3_D		: stracc_item_code3        
			,V_P_ACC_ITEM_VALUE3_D		: stracc_item_value3       
			,V_P_ACC_ITEM_CODE4_D		: stracc_item_code4        
			,V_P_ACC_ITEM_VALUE4_D		: stracc_item_value4       
			,V_P_ACC_ITEM_CODE5_D		: stracc_item_code5        
			,V_P_ACC_ITEM_VALUE5_D		: stracc_item_value5       
			,V_P_ACC_ITEM_CODE6_D		: stracc_item_code6        
			,V_P_ACC_ITEM_VALUE6_D		: stracc_item_value6       
			,V_P_ACC_ITEM_CODE7_D		: stracc_item_code7        
			,V_P_ACC_ITEM_VALUE7_D		: stracc_item_value7       
			,V_P_ACC_ITEM_CODE8_D		: stracc_item_code8        
			,V_P_ACC_ITEM_VALUE8_D		: stracc_item_value8       
			,V_P_ACC_ITEM_CODE9_D		: stracc_item_code9        
			,V_P_ACC_ITEM_VALUE9_D 		: stracc_item_value9      
			,V_P_ACC_ITEM_CODE10_D		: stracc_item_code10       
			,V_P_ACC_ITEM_VALUE10_D 	: stracc_item_value10     
			,V_P_ACC_ITEM_VALUE_NAME1_D	: stracc_value_name1  
			,V_P_ACC_ITEM_VALUE_NAME2_D	: stracc_value_name2   
			,V_P_ACC_ITEM_VALUE_NAME3_D	: stracc_value_name3   
			,V_P_ACC_ITEM_VALUE_NAME4_D	: stracc_value_name4   
			,V_P_ACC_ITEM_VALUE_NAME5_D	: stracc_value_name5   
			,V_P_ACC_ITEM_VALUE_NAME6_D	: stracc_value_name6   
			,V_P_ACC_ITEM_VALUE_NAME7_D	: stracc_value_name7   
			,V_P_ACC_ITEM_VALUE_NAME8_D	: stracc_value_name8   
			,V_P_ACC_ITEM_VALUE_NAME9_D	: stracc_value_name9   
			,V_P_ACC_ITEM_VALUE_NAME10_D: stracc_value_name10  
			,V_P_ITEM_SOURCE_TYPE_D 	: stritem_source_type_d      
			,V_P_ITEM_SOURCE_ID_D		: stritem_source_id_d         
			,V_P_SOURCE_RECORD_COUNT_D	: strsource_record_count_d    
			,V_P_EXPECTED_PAY_DATE_D	: strexpected_pay_date       
			,V_P_PAY_TERM_CODE_D		: strpay_term_code           
			,V_P_PAY_METHOD_D			: strpay_method              
			,V_P_CS_CODE_D				: strcs_code                 
			,V_P_FCE_GB_D				: strfce_gb                  
			,V_P_CURRENCY_CODE_D		: strcurrency_code            
			,V_P_EXCHANGE_TYPE_D 		: strexchange_type          
			,V_P_EXCHANGE_RATE_D		: strexchange_rate           
			,V_P_VOUCHER_TYPE_D			: strvoucher_type            
			,V_P_VOUCHER_NO_D			: strvoucher_no              
			,V_P_PAYEE_CODE_D			: strpayee_code              
			,V_P_CARD_NO_D              : strcard_no   
			,V_P_VOUCHER_RECEIPT_DATE_D	: strvoucher_receipt_date    
			,V_P_WITHHOLD_FLAG_D		: strwithhold_flag           
			,V_P_WITHHOLD_TAX_TYPE_D	: strwithhold_tax_type       
			,V_P_WITHHOLD_CS_CODE_D 	: strwithhold_cs_code    
			,V_P_WITHHOLD_TAX_TYPE2_D	: strwithhold_tax_type2     
			,V_P_WITHHOLD_CS_CODE2_D	: strwithhold_cs_code2     
			,V_P_SITE_CODE_D			: strsite_code               
			,V_P_CREDIT_AREA_D			: strcredit_area             
			,V_P_SALES_PERSON_D			: strsales_person           
			,V_P_PO_LINE_NO_D 			: strpo_line_no          
			,V_P_SALES_CS_CODE_D		: strsales_cs_code           
			,V_P_APPLY_COMPLETE_FLAG_D	: strapply_complete_flag          
			,V_P_APPLY_COMPLETE_DATE_D	: strapply_complete_date       
			
			,V_P_HOLD_FLAG_D			: strhold_flag                    
			,V_P_RELEASE_DATE_D			: strrelease_date                 
			,V_P_RELEASE_USER_D			: strrelease_user                 
			,V_P_HOLD_DATE_D			: strhold_date                    
			,V_P_HOLD_USER_D			: strhold_user                    
			,V_P_HOLD_REASON_D			: strhold_reason                  
			,V_P_PAY_BASE_DATE_D		: strpay_base_date                
			,V_P_BILL_DUE_DATE_D		: strbill_due_date                
			,V_P_BILL_DUE_DAY_D			: strbill_due_day                 
			,V_P_BILL_DUE_PAY_DATE_D	: strbill_due_pay_date            
			,V_P_PAY_TERM_ORIG_D		: strpay_term_orig                
			,V_P_PROD_GROUP_D			: strprod_group                   
			,V_P_BANK_ACCOUNT_SEQ_D		: strbank_account_seq      
			
			,V_P_ETAX_TYPE_D				: stretax_type               
			,V_P_AFTER_DUE_DATE_YN_D		: strafter_due_date_yn       
			,V_P_DUP_ISSUE_BILL_TYPE_D		: strdup_issue_bill_type     
			,V_P_EXCLUDE_REVENUE_AMT_YN_D	: strexclude_revenue_amt_yn  
			,V_P_CARD_USE_TYPE_D 			: strcard_use_type          
			,V_P_CARD_NUM_D					: strcard_num                
			,V_P_VAT_NOT_DEDUCTION_TYPE_D	: strvat_not_deduction_type  
			,V_P_REPORT_OMIT_YN_D			: strreport_omit_yn          
			,V_P_STANDARD_DATE_D			: strstandard_date           
			,V_P_VAT_ASSET_TYPE_D			: strvat_asset_type          
			,V_P_SUPPLY_AMT_D				: strsupply_amt           
			
			,V_P_ZERO_REPORT_YN_D			: strzero_report_yn       
			,V_P_LOCAL_CREDIT_TYPE_D		: strlocal_credit_type    
			,V_P_DOCUMENT_NAME_D			: strdocument_name        
			,V_P_ISSUE_NAME_D				: strissue_name           
			,V_P_DOCUMENT_ISSUE_DATE_D		: strdocument_issue_date  
			,V_P_EXPORT_LICENSE_NO_D		: strexport_license_no    
			,V_P_SHIPPING_DATE_D			: strshipping_date        
			,V_P_EXPORT_AMT_D				: strexport_amt           
			,V_P_EXPORT_AMT_KRW_D			: strexport_amt_krw       
			,V_P_VAT_EXPORT_AMT_D			: strvat_export_amt       
			,V_P_VAT_EXPORT_AMT_KRW_D		: strvat_export_amt_krw   
			,V_P_FOREIGN_AMT_D				: strforeign_amt          
			,V_P_WON_AMT_D					: strwon_amt              
			,V_P_DOCUMENT_NO_D				: strdocument_no          
			,V_P_ZERO_TYPE_D				: strzero_type            
			,V_P_VAT_AMT_D					: strvat_amt             
			,V_P_CONFIRM_EMP_CODE			: ''        			
			
			,V_P_FORM_ID				: p_formId
			,V_P_MENU_ID				: p_menuId
			,V_P_PROC_ID				: ''
			,V_P_USERID					: ''
			,V_P_PC						: '' 
	    };		
		console.log('P_FIG2210_S param:', paramObj);

        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/insertFig2210S.do", {
        	getType				: 'json',
        	workType			: 'N',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
		console.log('P_FIG2210_S data:', data);
        
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        		
        		//성공했을때..
        		
        		
        		
        		
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
     * 결의부서 팝업
     */
    var fn_compopup1 = function() {
    	
    	//type B 형 팝업
    	var addParams = [];	//bizcompId 의 파라미터에 따라 추가할것
    	var p_find1	= gfnma_nvl(SBUxMethod.get("sch-dept-name"));
    	var p_day	= gfnma_date4();
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG001'
    		,popupType				: 'B'
    		,whereClause			: addParams
   			,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
   			,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
   			,searchInputValues		: ["", 				p_find1,		p_day]
			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
    		,height					: '400px'
   			,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
   			,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
   			,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('sch-dept-name', data.DEPT_NAME);
				SBUxMethod.set('sch-dept-code', data.DEPT_CODE);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
  	}   
    
    function fn_createGrid2210() {
    	
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTop';
	    SBGridProperties.id 				= 'Fig2210Grid';
	    SBGridProperties.jsonref 			= 'jsonFig2210';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.frozencols 		= 4;
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= ['seq'];
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	{caption: [""], ref: 'CHECK_YN', type: 'checkbox', width: '40px', style: 'text-align:center',
        	    typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
        	        checkedvalue: 'Y', uncheckedvalue: 'N'
        	    }
        	},        	
            {caption: ["순번"],						ref: 'ITEM_SEQ', 				type:'output', 		width:'50px',  		style:'text-align:left'},
            {caption: ["라인유형"],					ref: 'LINE_TYPE', 				type:'combo',  		width:'80px',  		style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonLineType',
					label		: 'label',
					value		: 'value',
					displayui :true, 
					oneclickedit: true
            	}
            },
            {caption: ["차/대"],					ref: 'DEBIT_CREDIT', 			type:'combo',  		width:'60px',  		style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonDebitCredit',
					label		: 'label',
					value		: 'value',
					displayui :true, 
					oneclickedit: true
            	}
            },
            
            {caption: ["부가세유형"], 				ref: 'VAT_TYPE',    			type:'input',  		width:'70px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn1',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup1(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["부가세유형명"], 			ref: 'VAT_NAME', 			type:'input',		width:'100px',  	style:'text-align:left'},
            
            {caption: ["거래처"], 					ref: pg_colcs_code_field1,    	type:'input',  		width:'70px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn2',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup2(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["거래처명"], 				ref: pg_colcs_code_field2, 		type:'input',		width:'150px',  	style:'text-align:left'},
            
            {caption: ["계정코드"], 				ref: 'ACCOUNT_CODE', 			type:'input',  		width:'70px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn3',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup3(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["계정과목명"], 				ref: 'ACCOUNT_NAME', 			type:'input',		width:'150px',  	style:'text-align:left'},
            
            {caption: ["통화금액"], 				ref: 'ORIGINAL_AMT', 			type:'input',		width:'150px',  	style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20},  format : {type:'number', rule:'#,###'}},
            {caption: ["전표금액"], 				ref: 'FUNCTIONAL_AMT', 			type:'input',		width:'150px',  	style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20},  format : {type:'number', rule:'#,###'}},
            {caption: ["적요"], 					ref: 'DESCRIPTION', 			type:'input',		width:'250px',  	style:'text-align:left'},

            {caption: ["부서"], 					ref: 'DEPT_NAME', 				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn4',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup4(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["부서코드"],					ref: 'DEPT_CODE', 				type:'output',		width:'100px',  	style:'text-align:left', hidden:true},
            
            {caption: ["원가중심점"], 				ref: 'COST_CENTER_CODE',		type:'input',  		width:'70px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn5',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup5(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["원가중심점명"], 			ref: 'COST_CENTER_NAME', 		type:'input',		width:'150px',  	style:'text-align:left'},
            
            {caption: ["사업장"],					ref: 'SITE_CODE', 				type:'combo',  		width:'100px',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonGridSiteCode',
					label		: 'label',
					value		: 'value',
					displayui 	: true, 
					oneclickedit: true
            	}
            },
            
            {caption: ["프로젝트코드"], 			ref: 'PROJECT_CODE',			type:'input',  		width:'100px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn6',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup6(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["프로젝트명"], 				ref: 'PROJECT_NAME', 			type:'input',		width:'250px',  	style:'text-align:left'},
            
            {caption: ["지급기준"], 				ref: 'PAY_TERM_CODE', 			type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn6',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup7(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["지급기준명"], 				ref: 'PAY_TERM_NAME', 			type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["지급방법"], 				ref: 'PAY_METHOD', 				type:'output',		width:'150px',  	style:'text-align:left'},
            
			{caption: ['지급기일'],					ref: 'EXPECTED_PAY_DATE',		type:'datepicker',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	}, width:'150px', style:'text-align:center'},	
            {caption: ["환율"], 					ref: 'EXCHANGE_RATE', 			type:'input',		width:'100px',  	style:'text-align:right'},
			{caption: ['지급기산일'],				ref: 'PAY_BASE_DATE',			type:'datepicker',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	}, width:'150px', style:'text-align:center'},	

            {caption: ["계좌행번"], 				ref: 'BANK_ACCOUNT_SEQ',		type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn7',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup8(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["거래처은행"], 				ref: 'BANK_NAME', 				type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["거래처계좌번호"], 			ref: 'BANK_ACCOUNT_NO',			type:'output',		width:'150px',  	style:'text-align:left'},
			
            {caption: ["보류여부"], 				ref: 'HOLD_FLAG', 				type:'checkbox', 	width:'80px', 		style:'text-align:center', typeinfo: { ignoreupdate: false, checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
            {caption: ["보류사유"],					ref: 'HOLD_REASON', 			type:'combo',  		width:'120px',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonHoldReason',
					label		: 'label',
					value		: 'value',
					displayui 	: true, 
					oneclickedit: true
            	}
            },
            {caption: ["여신영역"],					ref: 'CREDIT_AREA', 			type:'combo',  		width:'120px',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonCreditArea',
					label		: 'label',
					value		: 'value',
					displayui 	: true, 
					oneclickedit: true
            	}
            },
            {caption: ["사업자번호"], 				ref: 'REGNO', 					type:'output',		width:'100px',  	style:'text-align:left'},
            
            {caption: ["원천id"], 					ref: 'ITEM_SOURCE_ID', 			type:'input',		width:'100px',  	style:'text-align:left'},
            {caption: ["원천"], 					ref: 'ITEM_SOURCE_TYPE',		type:'input',		width:'100px',  	style:'text-align:left'},
        ];

        Fig2210Grid = _SBGrid.create(SBGridProperties);
        Fig2210Grid.bind('valuechanged', 	'fn_comboValFig2210GridEvent')
        Fig2210Grid.bind('click', 			'fn_viewFig2210GridEvent');
    }
    
    //콤보, 인풋박스 이벤트
    function fn_comboValFig2210GridEvent() {
        let nRow = Fig2210Grid.getRow(); // 클릭한 Row Index 추출
        let nCol = Fig2210Grid.getCol(); // 클릭한 Col Index 추출

        let rowData = Fig2210Grid.getRowData(nRow);
		fn_getFig2210Grid(rowData);
        
        if (Fig2210Grid.getRefOfCol(nCol) == 'LINE_TYPE') {			// 컬럼이 curriculum 일 때 (Combo Col 검사)
            let cellValue = Fig2210Grid.getCellData(nRow, nCol); 	// Combo Value 추출
            let comboItem = jsonLineType.find(item => item.value === cellValue); // jsonLineType Json에서 ComboLabel과 일치하는 항목 추출

            if (comboItem) { 					// ComboItem 값이 있을 때
                let value = comboItem.value; 	// ComboItem의 Value 추출
                console.log('추출된 Value:', value);
				if(value=='3'){
					//부가세
					SBUxMethod.selectTab('tab_norm','tab1');
				} else {
					SBUxMethod.selectTab('tab_norm','tab2');
				}
            }
        } else if(Fig2210Grid.getRefOfCol(nCol) == 'ORIGINAL_AMT'){
            let cellValue = Fig2210Grid.getCellData(nRow, nCol); 	
        	console.log('ORIGINAL_AMT:', cellValue);
            Fig2210Grid.setCellData(nRow, nCol+1, cellValue, true, true);
            fn_gridTotal();            
        } else if(Fig2210Grid.getRefOfCol(nCol) == 'DEBIT_CREDIT'){
            fn_gridTotal();            
        }    	
    }
    
    //그리드 합계 표시
    function fn_gridTotal(){
    	var robj = null; 
    	var dt	= 0;
    	var ct	= 0;
    	var t1	= 0;
    	var t2	= 0;
    	for (var i = 0; i < jsonFig2210.length; i++) {
			var obj = jsonFig2210[i];
			if(obj['DEBIT_CREDIT']=='D'){
				//차변
				dt += Number(obj['ORIGINAL_AMT']);
			} else if(obj['DEBIT_CREDIT']=='C'){
				//대변
				ct += Number(obj['ORIGINAL_AMT']);
			}
		}
    	t1 = dt - ct;
    	t2 = dt - ct;
		SBUxMethod.set('tot-numdr-sum', 	dt);
		SBUxMethod.set('tot-numcr-sum', 	ct);
		SBUxMethod.set('tot-numDiffWon', 	t1);
		SBUxMethod.set('tot-numDiffFuntion',t2);
		
		robj = {
			'D' : dt
			,'C': ct
		}
		return robj;
    }
    
    //상세정보 보기
    function fn_viewFig2210GridEvent() {
    	
    	let nRow = Fig2210Grid.getRow();
    	let nCol = Fig2210Grid.getCol();
		if (nRow < 1) {
            return;
		}
		p_sel_row = nRow;
		p_sel_col = nCol;
		
        let rowData = Fig2210Grid.getRowData(nRow);
		fn_getFig2210Grid(rowData);
		
		if(rowData['LINE_TYPE']=='3'){
			//부가세
			SBUxMethod.selectTab('tab_norm','tab1');
		} else {
			SBUxMethod.selectTab('tab_norm','tab2');
		}
    }
    
    //그리드 값 가져오기
    function fn_getFig2210Grid(rowData) {
		console.log('fn_getFig2210Grid:', rowData);        
    	gfnma_uxDataClear('#tab1');
    	gfnma_uxDataClear('#tab2');
    	$('.cu-tab2-fom-area').text('');
    	
        gfnma_uxDataSet('#tab1', rowData);
        gfnma_uxDataSet('#tab2', rowData);
    }
    
    //폼의 값 --> 그리드에 셋팅하기
    function fn_FomChange(val, id) {
		console.log('val:', val);        
		console.log('id:', id);        
		console.log('p_sel_row:', p_sel_row);        
		if(p_sel_row>-1){
			jsonFig2210[p_sel_row-1][id] = val;
		}
		console.log(jsonFig2210);
    }
    
    //통화 change event
    function fn_currencyCodeChange(val) {
		console.log(val);
		if(!val) return;
		
    	var p_doc_date	= gfnma_nvl(SBUxMethod.get("sch-doc-date"));
		fn_getExchangeRate(
			p_doc_date
			,val
			,function(data){
	    		SBUxMethod.set('sch-exchange-rate',  	Number(data.RATE));
	    		SBUxMethod.set('sch-base-scale',  		Number(data.BASE_SCALE));
	    		var list = Fig2210Grid.getGridDataAll();
	    		for (var i = 0; i < list.length; i++) {
					if( (list[i]['CURRENCY_CODE']!='KRW' && val=='KRW' ) || (list[i]['CURRENCY_CODE']=='KRW' && val!='KRW')	){
                        Fig2210Grid.setCellData((i+1), 8, "", true, true);	//CS_CODE
                        Fig2210Grid.setCellData((i+1), 10, "", true, true);	//CS_NAME
                        Fig2210Grid.setCellData((i+1), 11, "", true, true);	//ACCOUNT_CODE
                        Fig2210Grid.setCellData((i+1), 13, "", true, true);	//ACCOUNT_NAME
					}
                    Fig2210Grid.setCellData((i+1), 32, Number(data.RATE), true, true);	//EXCHANGE_RATE
					jsonFig2210[i]['CURRENCY_CODE'] = val;
					jsonFig2210[i]['BASE_SCALE'] 	= Number(data.BASE_SCALE);
					
					var calNum = Number(gfnma_getNumber(list[i]['ORIGINAL_AMT'])) * Number(data.RATE) / Number(data.BASE_SCALE);
					if(p_ss_currUnit !='' && p_ss_currUnit != null && !isNaN(p_ss_currUnit)){
						calNum = gfnma_getRound(calNum, Number(p_ss_currUnit));
					} 
                    Fig2210Grid.setCellData((i+1), 15, calNum, true, true);	//FUNCTIONAL_AMT
				}
	        	var p_doc_type = gfnma_nvl(SBUxMethod.get("sch-doc-type"));
	    		if(p_doc_type=='92'){
	    			if(val=='KRW'){
	    			    pg_colcs_code_bizId		= 'P_CS_PURCHASE_DOC';	
	    			    pg_colcs_code_title		= '거래처 (구매)';	
	    			} else {
	    			    pg_colcs_code_bizId		= 'P_CS_PURCHASE_DOC_FOREIGN';	
	    			    pg_colcs_code_title		= '거래처 (구매)';	
	    			}
	    		} else {
	    			if(val=='KRW'){
	    			    pg_colcs_code_bizId		= 'P_CS_ALL';	
	    			    pg_colcs_code_title		= '거래처';	
	    			} else {
	    			    pg_colcs_code_bizId		= 'P_CS_ALL_FOREIGN';	
	    			    pg_colcs_code_title		= '거래처';	
	    			}
	    		}
	    		pg_colcs_code_field1 	= 'CS_CODE';
			}
		);
    }
    
    /**
     * 환율 가져오기
     */   
    const fn_getExchangeRate = async function (p_doc_date, p_currency_code, callbackFn){
    	
    	var p_doc_id			= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
    	
 	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
			,V_P_YYYYMMDD     			: p_doc_date
			,V_P_CURR_CODE    			: p_currency_code
			,V_P_RATE_TYPE    			: ''
			
			,V_P_FORM_ID				: p_formId
			,V_P_MENU_ID				: p_menuId
			,V_P_PROC_ID				: ''
			,V_P_USERID					: ''
			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/far/rec/getExchangeRate.do", {
        	getType				: 'json',
        	workType			: 'Q2',
        	cv_count			: '1',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
        console.log('getExchangeRate:', data);        		

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		callbackFn(data.cv_1[0]);
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
     * 그리드내 팝업(부가세유형) 조회
     */
	function fn_gridPopup1(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2210Grid.getCellData(row, 5) 
        let cellData2 = Fig2210Grid.getCellData(row, 7) 
    	fn_gridPopup1Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(부가세유형) 오픈
     */
    var fn_gridPopup1Show = function(row, col, cellData1, cellData2) {
    	
        var searchText1 	= cellData1;
        var searchText2 	= cellData2;
    	var addParams = [gfnma_date6(), 'NULL'];	
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부가세유형');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: pg_vat_type_bizId
       		,popupType				: 'B'
    		,whereClause			: addParams
       		,searchCaptions			: ["부가세코드", 	"부가세명",		]
   			,searchInputFields		: ["VAT_CODE", 		"VAT_NAME",		]
   			,searchInputValues		: [searchText1, 	searchText2,	]
			,searchInputTypes		: ["input", 		"input",		]		//input, datepicker가 있는 경우
    		,width					: '600px'
    		,height					: '300px'
   			,tableHeader			: ["부가세코드", 	"부가세명",		"부가세유형",		"불공제여부"]
   			,tableColumnNames		: ["VAT_CODE", 		"VAT_NAME",		"VAT_TYPE_CODE",	"NONDED_YN"]
   			,tableColumnWidths		: ["100px", 		"200px",		"100px",			"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2210Grid.setCellData(row, 5, 	data['VAT_CODE'], true, true);
				Fig2210Grid.setCellData(row, 7, 	data['VAT_NAME'], true, true);
				jsonFig2210[row-1]['NONDED_YN'] = data['NONDED_YN'];
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
    
    /**
     * 그리드내 팝업(거래처) 조회
     */
	function fn_gridPopup2(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2210Grid.getCellData(row, 8) 
        let cellData2 = Fig2210Grid.getCellData(row, 10) 
        if(!cellData1 && !cellData2){
        	gfn_comAlert("E0000","찾고자 하는 거래처 코드 혹은 거래처명을 2글자 이상 입력하세요");
        	return;	
        }
    	fn_gridPopup2Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(거래처) 오픈
     */
    var fn_gridPopup2Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_BIZ_REGNO_"; 
        var replaceText2 	= "_CS_NAME_"; 
        var strWhereClause 	= "AND A.CS_CODE LIKE '%" + replaceText0 + "%' AND A.CS_NAME LIKE '%" + replaceText1 + "%' " + " AND A.CS_NAME LIKE '%" + replaceText2 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: pg_colcs_code_bizId
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["고객사코드", 	"사업자번호",	"고객사명"]
   			,searchInputFields		: ["CS_CODE", 		"BIZ_REGNO",	"CS_NAME"]
   			,searchInputValues		: [cellData1, 		'',				cellData2]
			,searchInputTypes		: ["input", 		"input",		"input"]		//input, datepicker가 있는 경우
    		,width					: '1000px'
    		,height					: '500px'
   			,tableHeader			: ["거래처코드", 	"거래처명",		"사업자번호",		"거래중지여부",		"거래처유형",	"구매처",		"판매처",	"수금기준",			"수금기준명",		"수금방법",		"원천세대상여부"]
   			,tableColumnNames		: ["CS_CODE", 		"CS_NAME",		"BIZ_REGNO",		"TXN_STOP_YN",		"CS_GROUP",		"PURCHASE_YN",	"SALE_YN",	"PAY_TERM_CODE",	"PAY_TERM_NAME",	"PAY_METHOD",	"WITHHOLD_TAX_YN"]
   			,tableColumnWidths		: ["80px", 			"200px",		"100px",			"100px",			"200px",		"70px",			"70px",		"70px",				"150px",			"70px",			"120px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2210Grid.setCellData(row, 8, 	data['CS_CODE'], true, true);
				Fig2210Grid.setCellData(row, 10, 	data['CS_NAME'], true, true);
				jsonFig2210[row-1]['TXN_STOP_YN'] = data['TXN_STOP_YN'];
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
    
    /**
     * 그리드내 팝업(계정코드) 조회
     */
	function fn_gridPopup3(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2210Grid.getCellData(row, 11) 
        let cellData2 = Fig2210Grid.getCellData(row, 13) 
    	fn_gridPopup3Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(계정과목명) 오픈
     */
    var fn_gridPopup3Show = function(row, col, cellData1, cellData2) {
    	
        var nRow 			= Fig2210Grid.getRow();
        var rowData 		= Fig2210Grid.getRowData(nRow);
    	var pp_open_to_all	= "'" + gfnma_nvl(SBUxMethod.get("sch-reverse-flag")) + "'"; 
    	var pp_line_type	= "'" + rowData['LINE_TYPE'] + "'"; 
    	var pp_open_to_fcm	= "'" + gfnma_nvl(SBUxMethod.get("sch-txtopen-to-fcm-yn")) + "'"; 
        
        var searchText1 	= cellData1;
        var searchText2 	= cellData2;
    	var addParams 		= [pp_open_to_all, pp_line_type, pp_open_to_fcm];	
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FIM045_LINE'
       		,popupType				: 'B'
    		,whereClause			: addParams
       		,searchCaptions			: ["계정코드", 		"계정명"]
   			,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,searchInputValues		: [searchText1, 	searchText2]
			,searchInputTypes		: ["input", 		"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드", 		"계정명",		"계정명(한글)"]
   			,tableColumnNames		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME",	"ACCOUNT_NAME_CHN"]
   			,tableColumnWidths		: ["100px", 		"250px",		"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2210Grid.setCellData(row, 11, 	data['ACCOUNT_CODE'], true, true);
				Fig2210Grid.setCellData(row, 13, 	data['ACCOUNT_NAME'], true, true);
				
				jsonFig2210[row-1]['ACC_ITEM_CODE1'] = data['ACC_ITEM_CODE1'];
				jsonFig2210[row-1]['ACC_ITEM_CODE2'] = data['ACC_ITEM_CODE2'];
				jsonFig2210[row-1]['ACC_ITEM_CODE3'] = data['ACC_ITEM_CODE3'];
				jsonFig2210[row-1]['ACC_ITEM_CODE4'] = data['ACC_ITEM_CODE4'];
				jsonFig2210[row-1]['ACC_ITEM_CODE5'] = data['ACC_ITEM_CODE5'];
				jsonFig2210[row-1]['ACC_ITEM_CODE6'] = data['ACC_ITEM_CODE6'];
				jsonFig2210[row-1]['ACC_ITEM_CODE7'] = data['ACC_ITEM_CODE7'];
				jsonFig2210[row-1]['ACC_ITEM_CODE8'] = data['ACC_ITEM_CODE8'];
				jsonFig2210[row-1]['ACC_ITEM_CODE9'] = data['ACC_ITEM_CODE9'];
				jsonFig2210[row-1]['ACC_ITEM_CODE10'] = data['ACC_ITEM_CODE10'];
				
				jsonFig2210[row-1]['ACC_ITEM_NAME1'] = data['ACC_ITEM_NAME1'];
				jsonFig2210[row-1]['ACC_ITEM_NAME2'] = data['ACC_ITEM_NAME2'];
				jsonFig2210[row-1]['ACC_ITEM_NAME3'] = data['ACC_ITEM_NAME3'];
				jsonFig2210[row-1]['ACC_ITEM_NAME4'] = data['ACC_ITEM_NAME4'];
				jsonFig2210[row-1]['ACC_ITEM_NAME5'] = data['ACC_ITEM_NAME5'];
				jsonFig2210[row-1]['ACC_ITEM_NAME6'] = data['ACC_ITEM_NAME6'];
				jsonFig2210[row-1]['ACC_ITEM_NAME7'] = data['ACC_ITEM_NAME7'];
				jsonFig2210[row-1]['ACC_ITEM_NAME8'] = data['ACC_ITEM_NAME8'];
				jsonFig2210[row-1]['ACC_ITEM_NAME9'] = data['ACC_ITEM_NAME9'];
				jsonFig2210[row-1]['ACC_ITEM_NAME10'] = data['ACC_ITEM_NAME10'];
				
				jsonFig2210[row-1]['DATA_TYPE1'] = data['DATA_TYPE1'];
				jsonFig2210[row-1]['DATA_TYPE2'] = data['DATA_TYPE2'];
				jsonFig2210[row-1]['DATA_TYPE3'] = data['DATA_TYPE3'];
				jsonFig2210[row-1]['DATA_TYPE4'] = data['DATA_TYPE4'];
				jsonFig2210[row-1]['DATA_TYPE5'] = data['DATA_TYPE5'];
				jsonFig2210[row-1]['DATA_TYPE6'] = data['DATA_TYPE6'];
				jsonFig2210[row-1]['DATA_TYPE7'] = data['DATA_TYPE7'];
				jsonFig2210[row-1]['DATA_TYPE8'] = data['DATA_TYPE8'];
				jsonFig2210[row-1]['DATA_TYPE9'] = data['DATA_TYPE9'];
				jsonFig2210[row-1]['DATA_TYPE10'] = data['DATA_TYPE10'];
				
				jsonFig2210[row-1]['POPUP_ID1'] = data['POPUP_ID1'];
				jsonFig2210[row-1]['POPUP_ID2'] = data['POPUP_ID2'];
				jsonFig2210[row-1]['POPUP_ID3'] = data['POPUP_ID3'];
				jsonFig2210[row-1]['POPUP_ID4'] = data['POPUP_ID4'];
				jsonFig2210[row-1]['POPUP_ID5'] = data['POPUP_ID5'];
				jsonFig2210[row-1]['POPUP_ID6'] = data['POPUP_ID6'];
				jsonFig2210[row-1]['POPUP_ID7'] = data['POPUP_ID7'];
				jsonFig2210[row-1]['POPUP_ID8'] = data['POPUP_ID8'];
				jsonFig2210[row-1]['POPUP_ID9'] = data['POPUP_ID9'];
				jsonFig2210[row-1]['POPUP_ID10'] = data['POPUP_ID10'];
				
				jsonFig2210[row-1]['ACC_ITEM_YN1'] = data['ACC_ITEM_YN1'];
				jsonFig2210[row-1]['ACC_ITEM_YN2'] = data['ACC_ITEM_YN2'];
				jsonFig2210[row-1]['ACC_ITEM_YN3'] = data['ACC_ITEM_YN3'];
				jsonFig2210[row-1]['ACC_ITEM_YN4'] = data['ACC_ITEM_YN4'];
				jsonFig2210[row-1]['ACC_ITEM_YN5'] = data['ACC_ITEM_YN5'];
				jsonFig2210[row-1]['ACC_ITEM_YN6'] = data['ACC_ITEM_YN6'];
				jsonFig2210[row-1]['ACC_ITEM_YN7'] = data['ACC_ITEM_YN7'];
				jsonFig2210[row-1]['ACC_ITEM_YN8'] = data['ACC_ITEM_YN8'];
				jsonFig2210[row-1]['ACC_ITEM_YN9'] = data['ACC_ITEM_YN9'];
				jsonFig2210[row-1]['ACC_ITEM_YN10'] = data['ACC_ITEM_YN10'];
				
				jsonFig2210[row-1]['ACC_CATEGORY'] 	= data['ACC_CATEGORY'];
				jsonFig2210[row-1]['PROJECT_YN'] 	= data['PROJECT_YN'];
				jsonFig2210[row-1]['COST_CLASS'] 	= data['COST_CLASS'];
				
				fn_getFig2210Grid(jsonFig2210[row-1]);				
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
    
    /**
     * 그리드내 팝업(부서) 조회
     */
	function fn_gridPopup4(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2210Grid.getCellData(row, 17) 
    	fn_gridPopup4Show(row, col, cellData1);
	}
    
    /**
     * 그리드내 공통팝업(부서) 오픈
     */
    var fn_gridPopup4Show = function(row, col, cellData1) {
    	
        var searchText1 	= '';
        var searchText2 	= cellData1;
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
   			,tableColumnWidths		: ["100px", 		"500px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2210Grid.setCellData(row, 17, 	data['DEPT_NAME'], true, true);
				Fig2210Grid.setCellData(row, 19, 	data['DEPT_CODE'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
        
    /**
     * 그리드내 팝업(원가중심점코드) 조회
     */
	function fn_gridPopup5(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2210Grid.getCellData(row, 20) 
        let cellData2 = Fig2210Grid.getCellData(row, 22) 
    	fn_gridPopup5Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(원가중심점코드) 오픈
     */
    var fn_gridPopup5Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_"; 
        var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_CC_INPUT'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
   			,searchInputValues		: [cellData1, 			cellData2]
			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '300px'
   			,tableHeader			: ["코드", 				"명칭",				"부서코드",		"부서명",		"사업장"]
   			,tableColumnNames		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME",	"DEPT_CODE",	"DEPT_NAME",	"SITE_CODE"]	
   			,tableColumnWidths		: ["150px", 		"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2210Grid.setCellData(row, 20, 	data['COST_CENTER_CODE'], true, true);
				Fig2210Grid.setCellData(row, 22, 	data['COST_CENTER_NAME'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }       
        
    /**
     * 그리드내 팝업(프로젝트코드) 조회
     */
	function fn_gridPopup6(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2210Grid.getCellData(row, 24) 
        let cellData2 = Fig2210Grid.getCellData(row, 26) 
    	fn_gridPopup6Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(프로젝트코드) 오픈
     */
    var fn_gridPopup6Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_PROJECT_CODE_";
        var replaceText1 	= "_PROJECT_NAME_"; 
        var strWhereClause 	= "AND PROJECT_CODE LIKE '%" + replaceText0 + "%' AND PROJECT_NAME LIKE '%" + replaceText1 + "%' ";
		
		SBUxMethod.attr('modal-compopup1', 'header-title', '프로젝트');
		compopup1({
			compCode				: gv_ma_selectedCorpCd
			,clientCode				: gv_ma_selectedClntCd
			,bizcompId				: 'P_COM028'
			,popupType				: 'A'
			,whereClause			: strWhereClause
			,searchCaptions			: ["프로젝트코드",		"프로젝트명"]
			,searchInputFields		: ["PROJECT_CODE",		"PROJECT_NAME"]
			,searchInputValues		: [cellData1, 			cellData2]
			,searchInputTypes		: ["input", 			"input"]		//input, select가 있는 경우
			,searchInputTypeValues	: ["", 					""]				//select 경우
			,width					: '700px'
			,height					: '400px'
			,tableHeader			: ["프로젝트코드", 		"프로젝트명"]
			,tableColumnNames		: ["PROJECT_CODE", 		"PROJECT_NAME"]
			,tableColumnWidths		: ["100px", 			"500px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2210Grid.setCellData(row, 24, 	data['PROJECT_CODE'], true, true);
				Fig2210Grid.setCellData(row, 26, 	data['PROJECT_NAME'], true, true);
			},
		});
		SBUxMethod.openModal('modal-compopup1');
    }       
    
    /**
     * 그리드내 팝업(지급기준) 조회
     */
	function fn_gridPopup7(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2210Grid.getCellData(row, 27) 
        let cellData2 = Fig2210Grid.getCellData(row, 29) 
    	fn_gridPopup7Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(지급기준) 오픈
     */
    var fn_gridPopup7Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_PAY_TERM_CODE_";
        var replaceText1 	= "_PAY_TERM_NAME_"; 
        var strWhereClause 	= "AND PAY_TERM_CODE LIKE '%" + replaceText0 + "%' AND PAY_TERM_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '지급기일정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_PAY_DATE'
       		,popupType				: 'A'
       		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["PAY_TERM_CODE", 	"PAY_TERM_NAME"]
   			,searchInputValues		: [cellData1, 			cellData2]
   			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '500px'
   			,tableHeader			: ["지급기일코드", 		"지급기일명",		"지급기준"	]
   			,tableColumnNames		: ["PAY_TERM_CODE", 	"PAY_TERM_NAME",	"PAY_METHOD_NAME"]
   			,tableColumnWidths		: ["100px", 			"250px",			"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2210Grid.setCellData(row, 27, 	data['PAY_TERM_CODE'], true, true);
				Fig2210Grid.setCellData(row, 29, 	data['PAY_TERM_NAME'], true, true);
				Fig2210Grid.setCellData(row, 30, 	data['PAY_METHOD_NAME'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }      
    
    /**
     * 그리드내 팝업(계좌행번) 조회
     */
	function fn_gridPopup8(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2210Grid.getCellData(row, 8)		//거래처 
        let cellData2 = Fig2210Grid.getCellData(row, 31) 	//지급기일
        if(!cellData1 || !cellData2){
        	gfn_comAlert("E0000","거래처 및 지급기일을 입력하세요");
        	return;	
        }
    	fn_gridPopup8Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(계좌행번) 오픈
     */
    var fn_gridPopup8Show = function(row, col, cellData1, cellData2) {
    	
    	cellData2			= cellData2.replace(/-/gi, "");
        var replaceText0 	= "_" + pg_colcs_code_field1 + "_";
        var replaceText1 	= "_EXPECTED_PAY_DATE_"; 
        var strWhereClause 	= "AND A." + pg_colcs_code_field1 + " LIKE '%" + replaceText0 + "%' AND '" + replaceText1 + "' BETWEEN A.EFFECT_START_DATE AND A.EFFECT_END_DATE";
        //"AND A.CS_CODE LIKE '%100004%' AND '20240802' BETWEEN A.EFFECT_START_DATE AND A.EFFECT_END_DATE"        
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계좌행번');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_CS_ACCOUNT'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["거래처코드", 			"지급기일"]
   			,searchInputFields		: [pg_colcs_code_field1, 	"EXPECTED_PAY_DATE"]
   			,searchInputValues		: [cellData1, 				cellData2]
			,searchInputTypes		: ["input", 				"input"]		//input, datepicker가 있는 경우
    		,width					: '1000px'
    		,height					: '500px'
   			,tableHeader			: ["행번", 				"행번명",		"은행코드",			"은행명",			"계좌번호",			"비고",			"계좌주",				"거래처",			"시작일",				"종료일",			"복수등록"]
   			,tableColumnNames		: ["BANK_ACCOUNT_SEQ", 	"SEQ_NAME",		"BANK_CODE",		"BANK_NAME",		"BANK_ACCOUNT_NO",	"DESCRIPTION",	"BANK_ACCOUNT_OWNER",	"CS_CODE",			"EFFECT_START_DATE",	"EFFECT_END_DATE",	"BNKCNT"]
   			,tableColumnWidths		: ["50px", 				"80px",			"80px",				"150px",			"150px",			"200px",		"200px",				"100px",			"80px",					"80px",				"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2210Grid.setCellData(row, 34, 	data['BANK_ACCOUNT_SEQ'], true, true);
				Fig2210Grid.setCellData(row, 36, 	data['BANK_NAME'], true, true);
				Fig2210Grid.setCellData(row, 37, 	data['BANK_ACCOUNT_NO'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }      
    
	const fn_setFig2210Grid = async function (wtype, callbackFn){

		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("sch-fi-org-code"));
		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("sch-acct-rule-code"));
		let p_doc_id			= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("sch-site-code"));
		let p_dept_code			= gfnma_nvl(SBUxMethod.get("sch-dept-code"));
		let p_rule_code			= '';
		
		if(wtype=='RULE') {
			p_rule_code = gfnma_multiSelectGet('#srch-compopup1-rulecode'); 
		} else if(wtype=='DEFAULTRULE'){
			p_rule_code = gfnma_nvl(SBUxMethod.get("sch-doc-type"));
		} else {
			p_rule_code = '';
		}
		
		p_doc_id = (!p_doc_id) ? '0' : p_doc_id;
		
  	    var paramObj = { 
  				V_P_DEBUG_MODE_YN			: ''
  				,V_P_LANG_ID				: ''
				,V_P_COMP_CODE				: gv_ma_selectedCorpCd
				,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
				
  				,V_P_FI_ORG_CODE			: p_fi_org_code
  				,V_P_ACCT_RULE_CODE			: p_acct_rule_code
  				,V_P_DOC_ID     			: p_doc_id
  				,V_P_ITEM_SEQ				: '0'
  				,V_P_SITE_CODE				: p_site_code
  				,V_P_DEPT_CODE				: p_dept_code
  				,V_P_ENTRY_DATE_FR			: ''
  				,V_P_ENTRY_DATE_TO			: ''
  				,V_P_RULE_CODE				: p_rule_code
  				,V_P_USER_ID				: p_userId
  				
  				,V_P_FORM_ID				: p_formId
  				,V_P_MENU_ID				: p_menuId
  				,V_P_PROC_ID				: ''
  				,V_P_USERID					: p_userId
  				,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig2210QList.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '5',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
		console.log(data);        		

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		jsonFig2210.length = 0;
        		
        		var list = [];
        		if(wtype=='DEFAULTRULE'){
        			list = data.cv_5;
        		} else if(wtype=='Q'){
        			list = data.cv_3;
        		}
        		
        		list.forEach((item, index) => {
  					const msg = {
  						CHECK_YN				: gfnma_nvl(item.CHECK_YN),			
  						
  						ITEM_ID					: gfnma_nvl(item.ITEM_ID),			
  						DOC_ID					: gfnma_nvl(item.DOC_ID),			
  						TMP_ACCOUNT_CODE		: gfnma_nvl(item.TMP_ACCOUNT_CODE),			
  						TMP_ACCOUNT_NAME		: gfnma_nvl(item.TMP_ACCOUNT_NAME),			
  						FUNCTIONAL_AMT_HIST		: gfnma_nvl(item.FUNCTIONAL_AMT_HIST),			
  						VAT_TYPE_CODE			: gfnma_nvl(item.VAT_TYPE_CODE),			
  						ITEM_CODE				: gfnma_nvl(item.ITEM_CODE),			
  						UOM						: gfnma_nvl(item.UOM),			
  						TXN_QTY					: gfnma_nvl(item.TXN_QTY),			
  						BALANCE_SIDE			: gfnma_nvl(item.BALANCE_SIDE),			
  						TXT_STOP_YN				: gfnma_nvl(item.TXT_STOP_YN),			
  						
  						ITEM_SEQ				: gfnma_nvl(item.ITEM_SEQ),			
  						LINE_TYPE				: gfnma_nvl(item.LINE_TYPE),			
  						ACCOUNT_CODE			: gfnma_nvl(item.ACCOUNT_CODE),			
  						ACCOUNT_NAME			: gfnma_nvl(item.ACCOUNT_NAME),
  						DEBIT_CREDIT			: gfnma_nvl(item.DEBIT_CREDIT),
  						SUPPLY_AMOUNT			: gfnma_nvl(item.SUPPLY_AMOUNT),
  						ACC_CATEGORY			: gfnma_nvl(item.ACC_CATEGORY),
  						
  						ACC_ITEM_CODE1			: gfnma_nvl(item.ACC_ITEM_CODE1),
  						ACC_ITEM_CODE2			: gfnma_nvl(item.ACC_ITEM_CODE2),
  						ACC_ITEM_CODE3			: gfnma_nvl(item.ACC_ITEM_CODE3),
  						ACC_ITEM_CODE4			: gfnma_nvl(item.ACC_ITEM_CODE4),
  						ACC_ITEM_CODE5			: gfnma_nvl(item.ACC_ITEM_CODE5),
  						ACC_ITEM_CODE6			: gfnma_nvl(item.ACC_ITEM_CODE6),
  						ACC_ITEM_CODE7			: gfnma_nvl(item.ACC_ITEM_CODE7),
  						ACC_ITEM_CODE8			: gfnma_nvl(item.ACC_ITEM_CODE8),
  						ACC_ITEM_CODE9			: gfnma_nvl(item.ACC_ITEM_CODE9),
  						ACC_ITEM_CODE10			: gfnma_nvl(item.ACC_ITEM_CODE10),

  						ACC_ITEM_NAME1			: gfnma_nvl(item.ACC_ITEM_NAME1),
  						ACC_ITEM_NAME2			: gfnma_nvl(item.ACC_ITEM_NAME2),
  						ACC_ITEM_NAME3			: gfnma_nvl(item.ACC_ITEM_NAME3),
  						ACC_ITEM_NAME4			: gfnma_nvl(item.ACC_ITEM_NAME4),
  						ACC_ITEM_NAME5			: gfnma_nvl(item.ACC_ITEM_NAME5),
  						ACC_ITEM_NAME6			: gfnma_nvl(item.ACC_ITEM_NAME6),
  						ACC_ITEM_NAME7			: gfnma_nvl(item.ACC_ITEM_NAME7),
  						ACC_ITEM_NAME8			: gfnma_nvl(item.ACC_ITEM_NAME8),
  						ACC_ITEM_NAME9			: gfnma_nvl(item.ACC_ITEM_NAME9),
  						ACC_ITEM_NAME10			: gfnma_nvl(item.ACC_ITEM_NAME10),
  						
  						ACC_ITEM_YN1			: gfnma_nvl(item.ACC_ITEM_YN1),
  						ACC_ITEM_YN2			: gfnma_nvl(item.ACC_ITEM_YN2),
  						ACC_ITEM_YN3			: gfnma_nvl(item.ACC_ITEM_YN3),
  						ACC_ITEM_YN4			: gfnma_nvl(item.ACC_ITEM_YN4),
  						ACC_ITEM_YN5			: gfnma_nvl(item.ACC_ITEM_YN5),
  						ACC_ITEM_YN6			: gfnma_nvl(item.ACC_ITEM_YN6),
  						ACC_ITEM_YN7			: gfnma_nvl(item.ACC_ITEM_YN7),
  						ACC_ITEM_YN8			: gfnma_nvl(item.ACC_ITEM_YN8),
  						ACC_ITEM_YN9			: gfnma_nvl(item.ACC_ITEM_YN9),
  						ACC_ITEM_YN10			: gfnma_nvl(item.ACC_ITEM_YN10),
  						
  						DATA_TYPE1				: gfnma_nvl(item.DATA_TYPE1),
  						DATA_TYPE2				: gfnma_nvl(item.DATA_TYPE2),
  						DATA_TYPE3				: gfnma_nvl(item.DATA_TYPE3),
  						DATA_TYPE4				: gfnma_nvl(item.DATA_TYPE4),
  						DATA_TYPE5				: gfnma_nvl(item.DATA_TYPE5),
  						DATA_TYPE6				: gfnma_nvl(item.DATA_TYPE6),
  						DATA_TYPE7				: gfnma_nvl(item.DATA_TYPE7),
  						DATA_TYPE8				: gfnma_nvl(item.DATA_TYPE8),
  						DATA_TYPE9				: gfnma_nvl(item.DATA_TYPE9),
  						DATA_TYPE10				: gfnma_nvl(item.DATA_TYPE10),
  						
  						POPUP_ID1				: gfnma_nvl(item.POPUP_ID1),
  						POPUP_ID2				: gfnma_nvl(item.POPUP_ID2),
  						POPUP_ID3				: gfnma_nvl(item.POPUP_ID3),
  						POPUP_ID4				: gfnma_nvl(item.POPUP_ID4),
  						POPUP_ID5				: gfnma_nvl(item.POPUP_ID5),
  						POPUP_ID6				: gfnma_nvl(item.POPUP_ID6),
  						POPUP_ID7				: gfnma_nvl(item.POPUP_ID7),
  						POPUP_ID8				: gfnma_nvl(item.POPUP_ID8),
  						POPUP_ID9				: gfnma_nvl(item.POPUP_ID9),
  						POPUP_ID10				: gfnma_nvl(item.POPUP_ID10),
  						
  						ACC_ITEM_VALUE1			: gfnma_nvl(item.ACC_ITEM_VALUE1),
  						ACC_ITEM_VALUE2			: gfnma_nvl(item.ACC_ITEM_VALUE2),
  						ACC_ITEM_VALUE3			: gfnma_nvl(item.ACC_ITEM_VALUE3),
  						ACC_ITEM_VALUE4			: gfnma_nvl(item.ACC_ITEM_VALUE4),
  						ACC_ITEM_VALUE5			: gfnma_nvl(item.ACC_ITEM_VALUE5),
  						ACC_ITEM_VALUE6			: gfnma_nvl(item.ACC_ITEM_VALUE6),
  						ACC_ITEM_VALUE7			: gfnma_nvl(item.ACC_ITEM_VALUE7),
  						ACC_ITEM_VALUE8			: gfnma_nvl(item.ACC_ITEM_VALUE8),
  						ACC_ITEM_VALUE9			: gfnma_nvl(item.ACC_ITEM_VALUE9),
  						ACC_ITEM_VALUE10		: gfnma_nvl(item.ACC_ITEM_VALUE10),
  						
  						ACC_VALUE_NAME1			: gfnma_nvl(item.ACC_VALUE_NAME1),
  						ACC_VALUE_NAME2			: gfnma_nvl(item.ACC_VALUE_NAME2),
  						ACC_VALUE_NAME3			: gfnma_nvl(item.ACC_VALUE_NAME3),
  						ACC_VALUE_NAME4			: gfnma_nvl(item.ACC_VALUE_NAME4),
  						ACC_VALUE_NAME5			: gfnma_nvl(item.ACC_VALUE_NAME5),
  						ACC_VALUE_NAME6			: gfnma_nvl(item.ACC_VALUE_NAME6),
  						ACC_VALUE_NAME7			: gfnma_nvl(item.ACC_VALUE_NAME7),
  						ACC_VALUE_NAME8			: gfnma_nvl(item.ACC_VALUE_NAME8),
  						ACC_VALUE_NAME9			: gfnma_nvl(item.ACC_VALUE_NAME9),
  						ACC_VALUE_NAME10		: gfnma_nvl(item.ACC_VALUE_NAME10),
  						
  						ITEM_SOURCE_ID			: gfnma_nvl(item.ITEM_SOURCE_ID),
  						ITEM_SOURCE_TYPE		: gfnma_nvl(item.ITEM_SOURCE_TYPE),
  						SOURCE_RECORD_COUNT		: gfnma_nvl(item.SOURCE_RECORD_COUNT),
  						DEPT_CODE				: gfnma_nvl(item.DEPT_CODE),
  						DEPT_NAME				: gfnma_nvl(item.DEPT_NAME),
  						COST_CENTER_CODE		: gfnma_nvl(item.COST_CENTER_CODE),
  						COST_CENTER_NAME		: gfnma_nvl(item.COST_CENTER_NAME),
  						DESCRIPTION				: gfnma_nvl(item.DESCRIPTION),
  						VAT_TYPE				: gfnma_nvl(item.VAT_TYPE),
  						PROJECT_YN				: gfnma_nvl(item.PROJECT_YN),
  						CS_CODE					: gfnma_nvl(item.CS_CODE),
  						CS_NAME					: gfnma_nvl(item.CS_NAME),
  						CURRENCY_CODE			: gfnma_nvl(item.CURRENCY_CODE),
  						EXCHANGE_RATE			: gfnma_nvl(item.EXCHANGE_RATE),
  						BASE_SCALE				: gfnma_nvl(item.BASE_SCALE),
  						EXCHANGE_TYPE			: gfnma_nvl(item.EXCHANGE_TYPE),
  						PAY_METHOD				: gfnma_nvl(item.PAY_METHOD),
  						EXPECTED_PAY_DATE		: gfnma_date5(gfnma_nvl(item.EXPECTED_PAY_DATE)),
  						PAY_TERM_CODE			: gfnma_nvl(item.PAY_TERM_CODE),
  						PAY_TERM_NAME			: gfnma_nvl(item.PAY_TERM_NAME),
  						BASIS_TYPE				: gfnma_nvl(item.BASIS_TYPE),
  						VOUCHER_TYPE			: gfnma_nvl(item.VOUCHER_TYPE),
  						VOUCHER_NO				: gfnma_nvl(item.VOUCHER_NO),
  						PAYEE_CODE				: gfnma_nvl(item.PAYEE_CODE),
  						CARD_NO					: gfnma_nvl(item.CARD_NO),
  						VOUCHER_RECEIPT_DATE	: gfnma_nvl(item.VOUCHER_RECEIPT_DATE),
  						APPLY_COMPLETE_FLAG		: gfnma_nvl(item.APPLY_COMPLETE_FLAG),
  						WITHHOLD_FLAG			: gfnma_nvl(item.WITHHOLD_FLAG),
  						WITHHOLD_TAX_TYPE		: gfnma_nvl(item.WITHHOLD_TAX_TYPE),
  						SITE_CODE				: gfnma_nvl(item.SITE_CODE),
  						CREDIT_AREA				: gfnma_nvl(item.CREDIT_AREA),
  						FI_ORG_CODE				: gfnma_nvl(item.FI_ORG_CODE),
  						PO_LINE_NO				: gfnma_nvl(item.PO_LINE_NO),
  						SALES_PERSON			: gfnma_nvl(item.SALES_PERSON),
  						WITHHOLD_CS_CODE		: gfnma_nvl(item.WITHHOLD_CS_CODE),
  						WITHHOLD_TAX_TYPE2		: gfnma_nvl(item.WITHHOLD_TAX_TYPE2),
  						WITHHOLD_CS_CODE2		: gfnma_nvl(item.WITHHOLD_CS_CODE2),
  						APPLY_COMPLETE_DATE		: gfnma_nvl(item.APPLY_COMPLETE_DATE),
  						SALES_CS_CODE			: gfnma_nvl(item.SALES_CS_CODE),
  						HOLD_FLAG				: gfnma_nvl(item.HOLD_FLAG),
  						RELEASE_DATE			: gfnma_nvl(item.RELEASE_DATE),
  						RELEASE_USER			: gfnma_nvl(item.RELEASE_USER),
  						HOLD_DATE				: gfnma_nvl(item.HOLD_DATE),
  						HOLD_USER				: gfnma_nvl(item.HOLD_USER),
  						HOLD_REASON				: gfnma_nvl(item.HOLD_REASON),
  						PAY_BASE_DATE			: gfnma_date5(gfnma_nvl(item.PAY_BASE_DATE)),
  						BILL_DUE_DATE			: gfnma_nvl(item.BILL_DUE_DATE),
  						BILL_DUE_DAY			: gfnma_nvl(item.BILL_DUE_DAY),
  						BILL_DUE_PAY_DATE		: gfnma_nvl(item.BILL_DUE_PAY_DATE),
  						PAY_TERM_ORIG			: gfnma_nvl(item.PAY_TERM_ORIG),
  						PROD_GROUP				: gfnma_nvl(item.PROD_GROUP),
  						BANK_ACCOUNT_SEQ		: gfnma_nvl(item.BANK_ACCOUNT_SEQ),
  						MATL_NO					: gfnma_nvl(item.MATL_NO),
  						PROD_ORDER_NO			: gfnma_nvl(item.PROD_ORDER_NO),
  						ORDER_NO				: gfnma_nvl(item.ORDER_NO),
  						SALES_NO				: gfnma_nvl(item.SALES_NO),
  						ETAX_TYPE				: gfnma_nvl(item.ETAX_TYPE),
  						AFTER_DUE_DATE_YN		: gfnma_nvl(item.AFTER_DUE_DATE_YN),
  						DUP_ISSUE_BILL_TYPE		: gfnma_nvl(item.DUP_ISSUE_BILL_TYPE),
  						EXCLUDE_REVENUE_AMT_YN	: gfnma_nvl(item.EXCLUDE_REVENUE_AMT_YN),
  						CARD_USE_TYPE			: gfnma_nvl(item.CARD_USE_TYPE),
  						CARD_NUM				: gfnma_nvl(item.CARD_NUM),
  						VAT_NOT_DEDUCTION_TYPE	: gfnma_nvl(item.VAT_NOT_DEDUCTION_TYPE),
  						REPORT_OMIT_YN			: gfnma_nvl(item.REPORT_OMIT_YN),
  						STANDARD_DATE			: gfnma_nvl(item.STANDARD_DATE),
  						VAT_ASSET_TYPE			: gfnma_nvl(item.VAT_ASSET_TYPE),
  						SUPPLY_AMT				: gfnma_nvl(item.SUPPLY_AMT),
  						VAT_AMT					: gfnma_nvl(item.VAT_AMT),
  						ZERO_REPORT_YN			: gfnma_nvl(item.ZERO_REPORT_YN),
  						LOCAL_CREDIT_TYPE		: gfnma_nvl(item.LOCAL_CREDIT_TYPE),
  						DOCUMENT_NAME			: gfnma_nvl(item.DOCUMENT_NAME),
  						ISSUE_NAME				: gfnma_nvl(item.ISSUE_NAME),
  						DOCUMENT_ISSUE_DATE		: gfnma_nvl(item.DOCUMENT_ISSUE_DATE),
  						EXPORT_LICENSE_NO		: gfnma_nvl(item.EXPORT_LICENSE_NO),
  						SHIPPING_DATE			: gfnma_nvl(item.SHIPPING_DATE),
  						EXPORT_AMT				: gfnma_nvl(item.EXPORT_AMT),
  						EXPORT_AMT_KRW			: gfnma_nvl(item.EXPORT_AMT_KRW),
  						VAT_EXPORT_AMT			: gfnma_nvl(item.VAT_EXPORT_AMT),
  						VAT_EXPORT_AMT_KRW		: gfnma_nvl(item.VAT_EXPORT_AMT_KRW),
  						FOREIGN_AMT				: gfnma_nvl(item.FOREIGN_AMT),
  						WON_AMT					: gfnma_nvl(item.WON_AMT),
  						DOCUMENT_NO				: gfnma_nvl(item.DOCUMENT_NO),
  						ZERO_TYPE				: gfnma_nvl(item.ZERO_TYPE),
  						COST_CLASS				: gfnma_nvl(item.COST_CLASS),
  						NONDED_YN				: gfnma_nvl(item.NONDED_YN),
  						WITHHOLD_TAX_YN			: gfnma_nvl(item.WITHHOLD_TAX_YN),
  						
  						VAT_NAME				: gfnma_nvl(item.VAT_NAME),
  						ORIGINAL_AMT			: (gfnma_nvl(item.ORIGINAL_AMT)) ? gfnma_nvl(item.ORIGINAL_AMT) : '0',
  						FUNCTIONAL_AMT			: (gfnma_nvl(item.FUNCTIONAL_AMT)) ? gfnma_nvl(item.FUNCTIONAL_AMT) : '0',
  						PROJECT_CODE			: gfnma_nvl(item.PROJECT_CODE),
  						PROJECT_NAME			: gfnma_nvl(item.PROJECT_NAME),
  						BANK_NAME				: gfnma_nvl(item.BANK_NAME),
  						BANK_ACCOUNT_NO			: gfnma_nvl(item.BANK_ACCOUNT_NO),
  						REGNO					: gfnma_nvl(item.REGNO),
  						TXN_STOP_YN				: gfnma_nvl(item.TXN_STOP_YN),
  						
  						ITEM_SOURCE_ID_ORIG		: gfnma_nvl(item.ITEM_SOURCE_ID_ORIG),
  						ITEM_SOURCE_TYPE_ORIG	: gfnma_nvl(item.ITEM_SOURCE_TYPE_ORIG),
  							
  					}
  					jsonFig2210.push(msg);
  				});        		
  	        	Fig2210Grid.rebuild();
        		if(pg_state=='edit'){
        			fn_gridTotal();
        		}
  	        	
        	} else {
          		alert(data.resultMessage);
        	}
        	if(callbackFn){
        		callbackFn(data);
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
    var fn_gridRowAdd = function() {
        var idx = Fig2210Grid.getRows();
        if(idx==-1){
        	idx = 0;
        }
        Fig2210Grid.insertRow(idx-1, 'below');
        Fig2210Grid.setCellData(idx, 2, idx, true, true);
        Fig2210Grid.setCellData(idx, 14, 0, true, true);
        Fig2210Grid.setCellData(idx, 15, 0, true, true);
        Fig2210Grid.setCellData(idx, 32, 1, true, true);
    }
    
    /**
     * 행삭제
     */
    var fn_gridRowDel = function() {
    	Fig2210Grid.deleteRow(Fig2210Grid.getRow());
    	fn_gridTotal();
    } 
    
    /**
     * 계정과목별합계
     */
    function fn_createGridSum() {
    	
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdSum';
	    SBGridProperties.id 				= 'FigGridSum';
	    SBGridProperties.jsonref 			= 'jsonGridSum';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.frozencols 		= 1;
	    SBGridProperties.allowcopy 			= true; //복사	    
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["계정코드"],					ref: 'ACCOUNT_CODE', 			type:'output', 		width:'80px',  		style:'text-align:left'},
            {caption: ["계정과목명"],				ref: 'ACCOUNT_NAME', 			type:'output', 		width:'200px',  	style:'text-align:left'},
            {caption: ["통화금액(차-대)"], 			ref: 'ORIGINAL_AMT', 			type:'output',		width:'100px',  	style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20},  format : {type:'number', rule:'#,###'}},
            {caption: ["전표금액(차-대)"], 			ref: 'FUNCTIONAL_AMT', 			type:'output',		width:'100px',  	style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20},  format : {type:'number', rule:'#,###'}},
            {caption: ["비고"], 					ref: 'ETC', 					type:'output',		width:'100px',  	style:'text-align:left'},
        ];

        FigGridSum = _SBGrid.create(SBGridProperties);
    }    
    
    /**
     * SCM정보
     */
    var fn_btnScmInfo = function() {
    } 
    
    /**
     * 부서·적요수정
     */
    var fn_descUpdate = function() {
    	
		if(gfn_comConfirm("Q0001", "부서·적요수정")){
			fn_subDescUpdate('DESC_UPDATE');
		} 
    } 
    
    /**
     * 부서·적요수정 - 실행
     */   
    const fn_subDescUpdate = async function (wType){    
    	
    	var p_fi_org_code			= gfnma_nvl(SBUxMethod.get("sch-fi-org-code"));
    	var p_doc_id				= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
    	var p_description			= gfnma_nvl(SBUxMethod.get("sch-description"));
    	
    	var stritem_id_d 			= "";
    	var strdept_d 				= "";
    	var strproject_d 			= "";
    	var strdescription_d 		= "";
    	
//     	let allDatas = Fig2210Grid.getGridDataAll();
// 		console.log('allDatas===>>>', allDatas);
    	
		var list = Fig2210Grid.getUpdateData(true)
		if(list.length==0){
    		gfn_comAlert("E0000","부서·적요수정 할 내용이 없습니다.");
    		return;
			
		}
		//console.log('list===>>>', list);
		
		for (var i = 0; i < list.length; i++) {
			stritem_id_d		+=	gfnma_nvl(list[i]['data']['ITEM_ID']) + "|";	
			strdept_d 			+=	gfnma_nvl(list[i]['data']['DEPT_CODE']) + "|";	
			strproject_d 		+=	gfnma_nvl(list[i]['data']['PROJECT_CODE']) + "|";	
			strdescription_d 	+=	gfnma_nvl(list[i]['data']['DESCRIPTION']) + "|";	
		}
		if(list.length > 0){
			stritem_id_d		= stritem_id_d.slice(0, -1);
            strdept_d			= strdept_d.slice(0, -1);
            strproject_d		= strproject_d.slice(0, -1);
            strdescription_d	= strdescription_d.slice(0, -1);
		}
		
 	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE			: p_fi_org_code
			,V_P_DOC_ID					: p_doc_id
			,V_P_DESCRIPTION            : p_description 
			,V_P_ITEM_ID    			: stritem_id_d           
			,V_P_DEPT_CODE_D			: strdept_d
			,V_P_DESCRIPTION_D          : strdescription_d 
			
			,V_P_FORM_ID				: p_formId
			,V_P_MENU_ID				: p_menuId
			,V_P_PROC_ID				: ''
			,V_P_USERID					: ''
			,V_P_PC						: '' 
	    };		
		console.log('P_FIG2210_S2 param:', paramObj);
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/updateFig2210S2.do", {
        	getType				: 'json',
        	workType			: wType,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
		console.log('P_FIG2210_S2 data:', data);
        
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        		fn_state(pg_state);        		
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
     * 전표복사
     */
    var fn_docCopy = function() {
    	
    	p_header_dataStatus = 'N';
    	
		$('#btn1-row-add').attr('disabled', 	false);
		$('#btn1-row-del').attr('disabled', 	false);
    	
		SBUxMethod.attr('sch-btn-attach', 		'disabled', true);
		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', true);
		SBUxMethod.attr('sch-btn-submit', 		'disabled', true);
		SBUxMethod.set('sch-doc-batch-no', 		'');
		SBUxMethod.set('sch-doc-name', 			'');
		SBUxMethod.set('sch-posting-date', 		'');
		SBUxMethod.set('sch-unposting-date', 	'');
		SBUxMethod.set('sch-approve-date', 		'');
		SBUxMethod.set('sch-posting-user', 		'');
		SBUxMethod.set('sch-unposting-user', 	'');
		SBUxMethod.set('sch-doc-id', 			'0');
		SBUxMethod.set('sch-doc-status', 		'1');
		SBUxMethod.set('sch-reverse-flag', 		'N');
		SBUxMethod.set('sch-reverse-doc-name', 	'');
		SBUxMethod.attr('sch-doc-date', 		'disabled', false);
    	
		$('#main-btn-save', parent.document).attr('disabled', false);
		$('#main-btn-del', 	parent.document).attr('disabled', false);
		
		SBUxMethod.set('sch-doc-date', 					gfnma_date4());
		SBUxMethod.set('sch-voucher-receipt-date', 		gfnma_date4());
    	
		let allDatas = jsonFig2210.getOrgGridDataAll()
		if(allDatas.length > 0){
			for (var i = 0; i < allDatas.length; i++) {
				allDatas[i]['APPLY_COMPLETE_FLAG'] 		= 'N';
				allDatas[i]['APPLY_COMPLETE_DATE'] 		= '';
				allDatas[i]['EXPECTED_PAY_DATE'] 		= '';
				allDatas[i]['BILL_DUE_DATE'] 			= '';
				allDatas[i]['BILL_DUE_DAY'] 			= '';
				allDatas[i]['BILL_DUE_PAY_DATE'] 		= '';
				allDatas[i]['VOUCHER_TYPE'] 			= '';
				allDatas[i]['VOUCHER_NO'] 				= '';
				allDatas[i]['VOUCHER_NO1'] 				= '';
				allDatas[i]['VOUCHER_RECEIPT_DATE'] 	= '';
				allDatas[i]['ITEM_SOURCE_ID_ORIG'] 		= '';
				allDatas[i]['ITEM_SOURCE_TYPE_ORIG'] 	= '';
				allDatas[i]['ITEM_SOURCE_ID'] 			= '';
				allDatas[i]['ITEM_SOURCE_TYPE'] 		= '';
				allDatas[i]['ITEM_ID'] 					= '';
				allDatas[i]['DOC_ID'] 					= '';
				allDatas[i]['CARD_NO'] 					= '';
				allDatas[i]['HOLD_FLAG'] 				= '';
			}
			Fig2210Grid.refresh();
		}
    } 
    
    /**
     * 결재이력
     */
    var fn_confimHist = function() {
    	
		var p_appr_id = gfnma_nvl(SBUxMethod.get("sch-appr-id"));
		if(p_appr_id=='' || p_appr_id=='0'){
 			gfn_comAlert("E0000","결재정보 생성 후 조회가 가능합니다.");
			return;
		}

		var p_doc_id 	= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
		var p_doc_type	= gfnma_nvl(SBUxMethod.get("sch-doc-type"));
    	
    	SBUxMethod.attr('modal-compopfim3420', 'header-title', '승인결과조회');
		SBUxMethod.openModal('modal-compopfim3420');
		
		compopfim3420({
    		height			: '600px'
    		,param			: {
    			p_appr_id	: p_appr_id		//'23'
    			,p_doc_id	: p_doc_id		//'584'
    			,p_doc_type	: p_doc_type	//'AP'
    		}
   			,callbackEvent	: function (data){
   				console.log('callback data:', data);
   			},
    	});
  	}     
    
    /**
     * 전기처리
     */
    var fn_docEnd = function() {
    	
    	var bNoCommitRow = false; 
    	if(p_header_dataStatus != 'Q'){
    		bNoCommitRow = true;
    	}
        if(bNoCommitRow){
    		gfn_comAlert("E0000","저장되지 않은 DATA 가 있습니다. 저장 후 작업해주세요.");
    		return;
        }
        
        fn_subDocProcess('END');
  	}     
    
    /**
     * 전기처리 - 실행
     */
    const fn_subDocProcess = async function (wtype){

		let p_fi_org_code	= gfnma_nvl(SBUxMethod.get("sch-fi-org-code"));
		let p_strdoc_id		= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
		
        if(!p_strdoc_id){
    		gfn_comAlert("E0000","전기처리 할 전표를 선택하세요");
    		return;
        }
		
  	    var paramObj = { 
 			V_P_DEBUG_MODE_YN			: ''
 			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
 			,V_P_FI_ORG_CODE			: p_fi_org_code
 			,V_P_ACCT_RULE_CODE			: p_ss_defaultAcctRule
 			,V_P_DOC_ID     			: p_strdoc_id
 			,V_P_HOLD_REASON			: ''
 			,V_P_UNPOSTING_TYPE			: ''
 			,V_P_UNPOSTING_DATE			: ''
 				
 			,V_P_FORM_ID				: p_formId
 			,V_P_MENU_ID				: p_menuId
 			,V_P_PROC_ID				: ''
 			,V_P_USERID					: p_userId
 			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/updateFig2200S1.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
	    		fn_state('edit');        		
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
     * 전기취소
     */
    var fn_docCancel = function() {
    	
		let p_strdoc_id		= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
    	
    	SBUxMethod.attr('modal-compopup4', 'header-title', '전표전기취소');
    	compopup4({
    		param					: {}
			,callbackEvent			: function (data){
				console.log('callback data:', data);
				if(gfn_comConfirm("Q0001", "전기취소")){
			      	fn_subDocCancel(data['workType'], p_strdoc_id, data['code'], data['date']);
				}       	
			},
    	});
		SBUxMethod.openModal('modal-compopup4');
  	}     

    /**
     * 전기취소 - 실행
     */
    const fn_subDocCancel = async function (wtype, p_strdoc_id, p_type, p_date){

		let p_fi_org_code	= gfnma_nvl(SBUxMethod.get("sch-fi-org-code"));
        if(!p_strdoc_id){
    		gfn_comAlert("E0000","전기취소 할 전표를 선택하세요");
    		return;
        }
		
  	    var paramObj = { 
 			V_P_DEBUG_MODE_YN			: ''
 			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
 			,V_P_FI_ORG_CODE			: p_fi_org_code
 			,V_P_ACCT_RULE_CODE			: p_ss_defaultAcctRule
 			,V_P_DOC_ID     			: p_strdoc_id
 			,V_P_HOLD_REASON			: ''
 			,V_P_UNPOSTING_TYPE			: p_type
 			,V_P_UNPOSTING_DATE			: p_date
 				
 			,V_P_FORM_ID				: p_formId
 			,V_P_MENU_ID				: p_menuId
 			,V_P_PROC_ID				: ''
 			,V_P_USERID					: p_userId
 			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/updateFig2200S1.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
	    		fn_state('edit');        		
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
     * 보류해제
     */
    var fn_docRelease = function() {
    	
      	var p_strdoc_id		= '';
		var p_item_id_d 	= "";
        var p_hold_reason_d = "";
      	var p_numhold_count	= 0;
      	
      	var allList = Fig2210Grid.getGridDataAll()
		for (var i = 0; i < allList.length; i++) {
			var obj = allList[i].data;
			if(obj['CHECK_YN']=='Y'){
				if(obj['HOLD_FLAG']=='Y'){
					p_numhold_count ++;
				}
			}
			p_strdoc_id 	+= obj['DOC_ID'] + '|';
			p_item_id_d 	+= obj['ITEM_ID'] + '|';
			p_hold_reason_d += obj['HOLD_REASON'] + '|';
		}
      	if(p_numhold_count == 0){
      		gfn_comAlert("E0000","보류해체 할 전표가 없습니다.");
			return;      		 
      	}
      	p_strdoc_id 		= p_strdoc_id.slice(0, -1);
      	p_item_id_d 		= p_item_id_d.slice(0, -1);
      	p_hold_reason_d 	= p_hold_reason_d.slice(0, -1);
      	
		if(gfn_comConfirm("Q0001", "보류해체")){
			fn_subAllRelease('RELEASE', p_strdoc_id, p_item_id_d, p_hold_reason_d);
		}       	
  	}     
    
    /**
     * 보류지정
     */
    var fn_docUnRelease = function() {
    	
      	var p_strdoc_id		= '';
		var p_item_id_d 	= "";
        var p_hold_reason_d = "";
      	var p_numnoreason_count	= 0;
      	
      	var allList = Fig2210Grid.getGridDataAll()
		for (var i = 0; i < allList.length; i++) {
			var obj = allList[i].data;
			if(obj['CHECK_YN']=='Y'){
				if(obj['HOLD_REASON']==''){
					p_numnoreason_count ++;
				}
			}
			p_strdoc_id 	+= obj['DOC_ID'] + '|';
			p_item_id_d 	+= obj['ITEM_ID'] + '|';
			p_hold_reason_d += obj['HOLD_REASON'] + '|';
		}
      	if(p_numhold_count > 0){
      		gfn_comAlert("E0000","보류지정 사유는 필수 입니다.");
			return;      		 
      	}
      	p_strdoc_id 		= p_strdoc_id.slice(0, -1);
      	p_item_id_d 		= p_item_id_d.slice(0, -1);
      	p_hold_reason_d 	= p_hold_reason_d.slice(0, -1);
      	
		if(gfn_comConfirm("Q0001", "보류지정")){
			fn_subAllRelease('UNRELEASE', p_strdoc_id, p_item_id_d, p_hold_reason_d);
		}       	
  	}     
    
    /**
     * 보류해제, 보류지정
     */
    const fn_subAllRelease = async function (wtype, p_strdoc_id, p_item_id_d, p_hold_reason_d){

		let p_fi_org_code	= gfnma_nvl(SBUxMethod.get("sch-fi-org-code"));
		let p_doc_date		= gfnma_date7(gfnma_nvl(SBUxMethod.get("sch-doc-date")));
      	if(!p_doc_date){
      		gfn_comAlert("E0000","전기일자가 없습니다.");
			return;      		 
      	}
		
  	    var paramObj = { 
 			V_P_DEBUG_MODE_YN			: ''
 			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
 			,V_P_FI_ORG_CODE			: p_fi_org_code
 			,V_P_DOC_DATE				: p_doc_date
 			,V_P_DOC_ID     			: p_strdoc_id
 			,V_P_ITEM_ID     			: p_item_id_d
 			,V_P_HOLD_REASON			: p_hold_reason_d
 				
 			,V_P_FORM_ID				: p_formId
 			,V_P_MENU_ID				: p_menuId
 			,V_P_PROC_ID				: ''
 			,V_P_USERID					: p_userId
 			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/updateFig2210S1.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
	    		fn_state('edit');        		
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
     * 역분개취소
     */
    var fn_docReverseCancel = function() {
    	
		if(gfn_comConfirm("Q0001", "역분개 취소를")){
			fn_subReverseCancel('REVERSE_CANCEL');
		}       	
  	}     
    
    /**
     * 역분개취소 - 실행
     */
    const fn_subReverseCancel = async function (wtype){

		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("sch-fi-org-code"));
		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("sch-acct-rule-code"));
		let p_doc_id			= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
		let p_hold_reason		= gfnma_nvl(SBUxMethod.get("sch-hold-reason"));
		
      	if(!p_acct_rule_code){
      		gfn_comAlert("E0000","회계기준이 선택되지 않았습니다.");
			return;      		 
      	}
      	if(!p_doc_id){
      		gfn_comAlert("E0000","전표ID가 없습니다.");
			return;      		 
      	}
		
  	    var paramObj = { 
 			V_P_DEBUG_MODE_YN			: ''
 			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
 			,V_P_FI_ORG_CODE			: p_fi_org_code
 			,V_P_ACCT_RULE_CODE			: p_doc_date
 			,V_P_DOC_ID     			: p_strdoc_id
 			,V_P_HOLD_REASON			: p_hold_reason_d
 			,V_P_UNPOSTING_TYPE			: p_unposting_type
 			,V_P_UNPOSTING_DATE			: p_unposting_date
 				
 			,V_P_FORM_ID				: p_formId
 			,V_P_MENU_ID				: p_menuId
 			,V_P_PROC_ID				: ''
 			,V_P_USERID					: p_userId
 			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/updateFig2200S1.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        		cfn_add();
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
     * 파일첨부시 필요 변수
     */
	var lgv_sourceType = 'FIGDOCHEADER';    	// 화면(업무)마다 소스타입이 다르다.
	var lgv_sourceCode = '';     				// 소스코드는 신규 저장후 리턴되는 값을 지정하여야 한다.
	
    /**
     * 파일첨부
     */
    var cfn_attach = function() {
    	
    	var p_doc_id	= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
        if (p_doc_id == ""|| p_doc_id == "0")
        {
    		gfn_comAlert("E0000","전표저장후 첨부파일 등록가능합니다.");
            return;
        }
        lgv_sourceCode = p_doc_id;
        
    	if( (lgv_sourceType) && (lgv_sourceCode) ){
			compopfilemng({
	    		compCode		: gv_ma_selectedCorpCd
	    		,clientCode		: gv_ma_selectedClntCd
	    		,sourceType		: lgv_sourceType
	    		,sourceCode		: lgv_sourceCode
	   			,formID			: p_formId
	   			,menuId			: p_menuId    		
			});
    	}
    }
	
    /**
     * 결재처리
     */
    var cfn_appr = function() {
    	
    	var p_doc_id	= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
        if (p_doc_id == ""|| p_doc_id == "0")
        {
    		gfn_comAlert("E0000","전표저장후 결재처리 가능합니다.");
            return;
        }
        
    	//본인이 상신하는 경우
    	compopappvmng({
    		compCode		: gv_ma_selectedCorpCd
    		,compCodeNm		: gv_ma_selectedCorpNm
    		,clientCode		: gv_ma_selectedClntCd
    		,apprId			: gfnma_nvl(SBUxMethod.get("sch-appr-id"))  
    		,sourceNo		: gfnma_nvl(SBUxMethod.get("sch-doc-id"))  
    		,sourceType		: gfnma_nvl(SBUxMethod.get("sch-doc-type"))   
    		,apprStatus		: gfnma_nvl(SBUxMethod.get("sch-doc-status"))
   			,empCode		: p_ss_empCode
   			,empName		: p_ss_empName
   			,deptCode		: p_ss_deptCode
   			,deptName		: p_ss_deptName
   			,costCenterCode	: ''
   			,isPostingUser	: p_ss_isPostingUser
   			,formID			: p_formId
   			,menuId			: p_menuId    		
		});
    }
    
    /**
     * 전표출력
     */
    const fn_btnPrint = async function() {
    	let DOC_ID = gfn_nvl(SBUxMethod.get("sch-doc-id"));
    	if (DOC_ID == 0 || DOC_ID == '0' || gfn_isEmpty(DOC_ID)) {
    		return;
    	}else{
    		SBUxMethod.attr('modal-comPopFig1000Report', 'header-title', '전표 출력');
    		SBUxMethod.openModal('modal-comPopFig1000Report');
    		comPopFig1000Report({
    			height			: '200px'
    			,width			: '400px'
    			,param			: {
    				P_WORK_TYPE		: 'DOC'
    				,P_DOC_ID		: DOC_ID
    				,P_COMP_CODE	: gv_ma_selectedCorpCd
    				,P_CLIENT_CODE	: gv_ma_selectedClntCd
    			}
    		});
    	}
    }
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>