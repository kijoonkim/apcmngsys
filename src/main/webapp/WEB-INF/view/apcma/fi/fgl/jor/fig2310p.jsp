<%
/**
 * @Class Name 		: fig2310p.jsp
 * @Description 	: 미결반제전표 신규 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.08.09
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.08.09   	장성주		최초 생성
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
	<title>title : 미결반제전표 신규</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
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
                    </h3><!-- 미결반제전표 신규 -->
                </div>
                <div id="top_lable1" style="margin-left:auto">
                    <font style="top:5px">전표템플릿</font>
                </div>
                <div id="top_lable2" style="padding-left:10px;padding-right:100px">
					<div class="dropdown">
					    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="srch-compopup1-rulecode" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    	<font>선택</font>
					        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
					    </button>
					    <div class="dropdown-menu" aria-labelledby="srch-compopup1-rulecode" style="width:600px;height:150px;padding-top:0px;overflow:auto">
					    </div>
					</div> 
                </div>
                <div>
					<sbux-button class="btn btn-sm btn-outline-danger" text="조회" 		onclick="fn_queryDisp()"></sbux-button>
                    <font style="margin-right:10px"></font>
					<sbux-button class="btn btn-sm btn-outline-danger" text="반제처리" 	onclick="fn_confirm()"></sbux-button>
					<sbux-button class="btn btn-sm btn-outline-danger" text="취소" 		onclick="fn_cancel()"></sbux-button>
                </div>
            </div>
            <div class="box-body">

				<div>
	                <!--[pp] 검색 -->
					<!--[APC] START -->
						<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
					<!--[APC] END -->
	                <table id="srchArea1" class="table table-bordered tbl_fixed">
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
	                    
                           	<!-- hidden  -->
  							<sbux-input  id="sch-debit-credit"  	name="sch-debit-credit" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-account-code"  	name="sch-account-code" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-doc-batch-no"  	name="sch-doc-batch-no" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-doc-id"  			name="sch-doc-id" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-doc-name"  		name="sch-doc-name" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-numDiffWon"  		name="sch-numDiffWon" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-numDiffFuntion" 	name="sch-numDiffFuntion" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							
  							<sbux-input  id="sch-numbase-scale"  	name="sch-numbase-scale" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
                       		<sbux-select id="sch-site-code" 		name="sch-site-code" 		style="display:none;" uitype="single" 	jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
  							<sbux-input  id="sch-dept-name"  		name="sch-dept-name" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-dept-code"  		name="sch-dept-code" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-open-to-fcm-yn"  	name="sch-open-to-fcm-yn" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							
  							<sbux-input  id="sch-numapply-functional-amt-dr"  	name="sch-numapply-functional-amt-dr" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-numapply-functional-amt-cr"  	name="sch-numapply-functional-amt-cr" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-numapply-functional-amt-dr2"  	name="sch-numapply-functional-amt-dr2" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-numapply-functional-amt-cr2"  	name="sch-numapply-functional-amt-cr2" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
                       		<!-- /hidden -->
                       		
	                    	<tr>
	                            <th scope="row" class="th_bg">회계단위</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="sch-fi-org-code" uitype="single" jsondata-ref="jsonCbofiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">통화</th>
	                            <td colspan="7" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			                            <sbux-select style="width:150px" onchange="fn_currencyCodeChange(sch-currency-code)" id="sch-currency-code" uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                    <font style="width:5px"></font>
	   									<sbux-input style="width:150px" id="sch-exchange-rate" uitype="text" class="form-control input-sm"></sbux-input>
					                    <font style="width:5px"></font>
		                       			<sbux-checkbox id="sch-chkspot-yn" uitype="normal" text="스팟환율" true-value="Y" false-value="N" ></sbux-checkbox>
	                            	</div>
	                            </td>
	                    	</tr>
	                    	<tr>
	                            <th scope="row" class="th_bg">기준일자</th>
	                            <td colspan="3" class="td_input" >
								    <sbux-datepicker
								            id="sch-entry-date-to"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed">
								    </sbux-datepicker>                            
	                            </td>
	                            
	                            <th scope="row" class="th_bg">회계기준</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="sch-acct-rule-code" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">미결관리대상</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="sch-acc-character" uitype="single" jsondata-ref="jsonAccCharacter" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                    	</tr>
	                    	<tr>
	                            <th scope="row" class="th_bg">계정과목</th>
	                            <td colspan="11" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px" id="sch-account-code-fr" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="sch-btn-acct-fr"
											name="sch-btn-acct-fr"
											class="btn btn-xs btn-outline-dark"
											text=".." uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup1('1')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px"  id="sch-account-name-fr" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
					                    <font>~</font>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:100px"  id="sch-account-code-to" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="sch-btn-acct-to"
											name="sch-btn-acct-to"
											class="btn btn-xs btn-outline-dark"
											text=".." uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup1('2')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px" id="sch-account-name-to" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
		                       			<sbux-checkbox 
		                       				id="sch-multi-act-yn" 
		                       				uitype="normal" 
		                       				text="복수선택" 
		                       				true-value="Y" 
		                       				false-value="N" ></sbux-checkbox>
	   									<font style="width:5px"></font>
										<sbux-button
											id="sch-btn-acct-multi"
											class="btn btn-xs btn-outline-dark"
											text="복수계정" 
											onclick="fn_multiAccount()"></sbux-button>
									</div>
	                            </td>
	                    	</tr>
	                    	<tr>
	                            <th scope="row" class="th_bg">거래처</th>
	                            <td colspan="11" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px"  id="sch-cs-code-fr" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="sch-btn-cs-fr"
											name="sch-btn-cs-fr"
											class="btn btn-xs btn-outline-dark"
											text=".." uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup2('1')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px"  id="sch-cs-name-fr" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
					                    <font>~</font>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:100px"  id="sch-cs-code-to" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="sch-btn-cs-to"
											name="sch-btn-cs-to"
											class="btn btn-xs btn-outline-dark"
											text=".." uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup2('2')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px"  id="sch-cs-name-to" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
		                       			<sbux-checkbox 
		                       				id="sch-multi-cs-yn" 
		                       				uitype="normal" 
		                       				text="복수선택" 
		                       				true-value="Y" 
		                       				false-value="N" ></sbux-checkbox>
	   									<font style="width:5px"></font>
										<sbux-button
											id="sch-btn-cs-multi"
											class="btn btn-xs btn-outline-dark"
											text="복수거래처" 
											onclick="fn_multiCs()"></sbux-button>
									</div>
	                            </td>
	                    	</tr>
	                    	<tr>
	                            <th scope="row" class="th_bg">전표유형</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="sch-doc-type" uitype="single" jsondata-ref="jsonDocType" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <th scope="row" class="th_bg">제목</th>
	                            <td colspan="7" class="td_input" >
   									<sbux-input id="sch-description" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>
	                    	</tr>	  
								                            
	                    </tbody>
	                </table>				
				</div>
                
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>미결항목</span>
                        </li>
                    </ul>
                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
                    	<font style="visibility:hidden;" >잔액(통화)</font>
						<sbux-input style="width:150px;visibility:hidden" id="sch-numremain-original-amount" uitype="text" class="form-control input-sm" ></sbux-input>
						
                    	<font style="visibility:hidden;" >잔액(전표)</font>
						<sbux-input style="width:150px;visibility:hidden" id="sch-numremain-functional-amount" uitype="text" class="form-control input-sm" ></sbux-input>
						
                    	<font>반제(통화)</font>
						<sbux-input style="width:150px" id="sch-numapply-original-amount" uitype="text" class="form-control input-sm" ></sbux-input>
						
                    	<font style="visibility:hidden;" >반제(전표)</font>
						<sbux-input style="width:150px;visibility:hidden" id="sch-numapply-functional-amount" uitype="text" class="form-control input-sm" ></sbux-input>
						
                    	<font style="visibility:hidden;" >반제(순금액-통화)</font>
						<sbux-input style="width:150px;visibility:hidden" id="sch-numapply-original-amount-raw" uitype="text" class="form-control input-sm" ></sbux-input>
					</div>
                </div>
				
				<div id="sb-area-grdTop" class="card" style="width:100%;height:200px;border:1px solid #f4f4f4;">
				</div>
				
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>미결반제항목 등록</span>
                        </li>
                    </ul>
                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
                    	<font>반제(통화)</font>
						<sbux-input style="width:150px" id="sch-numapply-original-amount2" uitype="text" class="form-control input-sm" ></sbux-input>
						
						<font style="width:10px"></font>
						
                    	<font>반제(전표)</font>
						<sbux-input style="width:150px" id="sch-numapply-functional-amount2" uitype="text" class="form-control input-sm" ></sbux-input>

						<font style="width:10px"></font>
						
						<a href="#" id="btn1-row-add" class="cu-btn-plus" style="padding-left:10px" >
							<img src="../../../resource/images/plus.png" width="20px" /> 행추가
						</a>
						<a href="#" id="btn1-row-del" class="cu-btn-minus" style="padding-left:10px">
							<img src="../../../resource/images/minus.png" width="20px" /> 행삭제
						</a>
					</div>
                </div>
				
				<div id="sb-area-grdBot" class="card" style="width:100%;height:200px;border:1px solid #f4f4f4;">
				</div>
				
                <div style="padding-top:10px">
                
	                <sbux-tabs id="tab_norm" name="tab_norm" uitype="normal"
						is-scrollable="false"
						title-target-id-array="tab1^tab2"
						title-text-array="부가세^관리항목">
					</sbux-tabs>
					
                    <div class="tab-content" style="border-top:1px solid #bdbfc5;">
						<div id="tab1" style="height:210px;">
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
				                       		<sbux-select 	onchange="fn_FomChange(ETAX_TYPE, 'ETAX_TYPE')"   	id="ETAX_TYPE" 	jsondata-ref="jsonEtaxType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">신고일자</th>
			                            <td class="td_input" >
										    <sbux-datepicker onchange="fn_FomChange(STANDARD_DATE, 'STANDARD_DATE')"  id="STANDARD_DATE" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>                          
			                            </td>
			                            <th scope="row" class="th_bg">공급가액</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomChange(SUPPLY_AMT, 'SUPPLY_AMT')" id="SUPPLY_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">수출신고번호</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomChange(EXPORT_LICENSE_NO, 'EXPORT_LICENSE_NO')" id="EXPORT_LICENSE_NO" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">당기제출금_외화</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomChange(EXPORT_AMT, 'EXPORT_AMT')" id="EXPORT_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
									</tr>				                    	
			                        <tr>
			                            <th scope="row" class="th_bg">카드용도</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomChange(CARD_USE_TYPE, 'CARD_USE_TYPE')" id="CARD_USE_TYPE" 	jsondata-ref="jsonCardUseType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">카드번호</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomChange(CARD_NUM, 'CARD_NUM')" id="CARD_NUM" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">내국신용장구분</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomChange(LOCAL_CREDIT_TYPE, 'LOCAL_CREDIT_TYPE')" id="LOCAL_CREDIT_TYPE" 	jsondata-ref="jsonLocalCreditType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">선적일자</th>
			                            <td class="td_input" >
										    <sbux-datepicker onchange="fn_FomChange(SHIPPING_DATE, 'SHIPPING_DATE')" id="SHIPPING_DATE" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>                          
			                            </td>
			                            <th scope="row" class="th_bg">당기제출금_원화</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomChange(EXPORT_AMT_KRW, 'EXPORT_AMT_KRW')" id="EXPORT_AMT_KRW" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
									</tr>				                    	
			                        <tr>
			                            <th scope="row" class="th_bg">불공제유형</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomChange(VAT_NOT_DEDUCTION_TYPE, 'VAT_NOT_DEDUCTION_TYPE')" id="VAT_NOT_DEDUCTION_TYPE" jsondata-ref="jsonVatNotDedType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">예정신고누락</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomChange(REPORT_OMIT_YN, 'REPORT_OMIT_YN')" id="REPORT_OMIT_YN" jsondata-ref="jsonReportOmitYn" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">서류명</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomChange(DOCUMENT_NAME, 'DOCUMENT_NAME')" id="DOCUMENT_NAME" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">수출외화금액</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomChange(FOREIGN_AMT, 'FOREIGN_AMT')" id="FOREIGN_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">당기신고해당분_외화</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomChange(VAT_EXPORT_AMT, 'VAT_EXPORT_AMT')" id="VAT_EXPORT_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
									</tr>				                    	
			                        <tr>
			                            <th scope="row" class="th_bg">중복발행</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomChange(DUP_ISSUE_BILL_TYPE, 'DUP_ISSUE_BILL_TYPE')" id="DUP_ISSUE_BILL_TYPE" jsondata-ref="jsonDupIssList" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">감가상각자산유형</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomChange(VAT_ASSET_TYPE, 'VAT_ASSET_TYPE')" id="VAT_ASSET_TYPE" jsondata-ref="jsonVatAssetType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">발급자</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomChange(ISSUE_NAME, 'ISSUE_NAME')" id="ISSUE_NAME" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">수출원화금액</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomChange(WON_AMT, 'WON_AMT')" id="WON_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">당기신고해당분_원화</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomChange(VAT_EXPORT_AMT_KRW, 'VAT_EXPORT_AMT_KRW')" id="VAT_EXPORT_AMT_KRW" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
									</tr>				                    	
			                        <tr>
			                            <th scope="row" class="th_bg">11일외전송</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomChange(AFTER_DUE_DATE_YN, 'AFTER_DUE_DATE_YN')" id="AFTER_DUE_DATE_YN" 	jsondata-ref="jsonAfterDueDateYn" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">영세율첨부서류여부</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomChange(ZERO_REPORT_YN, 'ZERO_REPORT_YN')" id="ZERO_REPORT_YN" 	jsondata-ref="jsonZeroReportYn" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">발급일자</th>
			                            <td class="td_input" >
										    <sbux-datepicker onchange="fn_FomChange(DOCUMENT_ISSUE_DATE, 'DOCUMENT_ISSUE_DATE')"  id="DOCUMENT_ISSUE_DATE" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>                          
			                            </td>
			                            <td colspan="4" class="td_input" >
			                            </td>
									</tr>				                    	
			                        <tr>
			                            <th scope="row" class="th_bg">수입금액제외</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomChange(EXCLUDE_REVENUE_AMT_YN, 'EXCLUDE_REVENUE_AMT_YN')" id="EXCLUDE_REVENUE_AMT_YN" jsondata-ref="jsonExcludeAmtYn" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">영세율구분</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomChange(ZERO_TYPE, 'ZERO_TYPE')"  id="ZERO_TYPE"  jsondata-ref="jsonZeroType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">내국신용장서류번호</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomChange(DOCUMENT_NO, 'DOCUMENT_NO')"  id="DOCUMENT_NO" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <td colspan="4" class="td_input" >
			                            </td>
									</tr>				                    	
								</tbody>					
							</table>
						</div>
						
						<div id="tab2" style="height:210px;">
						
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
			                            <th scope="row" class="th_bg cu-tab2-fom-area" >관리항목1</th>
			                            <td colspan="2" class="td_input" >
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE1, 'ACC_ITEM_VALUE1')"  id="ACC_ITEM_VALUE1" uitype="text" class="form-control input-sm" ></sbux-input>
				   								<sbux-input onchange="fn_FomChange(ACC_VALUE_NAME1, 'ACC_VALUE_NAME1')"  id="ACC_VALUE_NAME1" uitype="text" class="form-control input-sm" ></sbux-input>
			                            	</div>
			                            </td>
			                            <th scope="row" class="th_bg cu-tab2-fom-area" >관리항목5</th>
			                            <td colspan="2" class="td_input" >
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE5, 'ACC_ITEM_VALUE5')"  id="ACC_ITEM_VALUE5" uitype="text" class="form-control input-sm" ></sbux-input>
				   								<sbux-input onchange="fn_FomChange(ACC_VALUE_NAME5, 'ACC_VALUE_NAME5')"  id="ACC_VALUE_NAME5" uitype="text" class="form-control input-sm" ></sbux-input>
			                            	</div>
			                            </td>
			                            <th scope="row" class="th_bg cu-tab2-fom-area" >관리항목9</th>
			                            <td colspan="2" class="td_input" >
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			   									<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE9, 'ACC_ITEM_VALUE9')"  id="ACC_ITEM_VALUE9" uitype="text" class="form-control input-sm" ></sbux-input>
				   								<sbux-input onchange="fn_FomChange(ACC_VALUE_NAME9, 'ACC_VALUE_NAME9')"  id="ACC_VALUE_NAME9" uitype="text" class="form-control input-sm" ></sbux-input>
			   								</div>
			                            </td>
									</tr>
			                        <tr>
			                            <th scope="row" class="th_bg cu-tab2-fom-area" >관리항목2</th>
			                            <td colspan="2" class="td_input" >
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE2, 'ACC_ITEM_VALUE2')"  id="ACC_ITEM_VALUE2" uitype="text" class="form-control input-sm" ></sbux-input>
				   								<sbux-input onchange="fn_FomChange(ACC_VALUE_NAME2, 'ACC_VALUE_NAME2')"  id="ACC_VALUE_NAME2" uitype="text" class="form-control input-sm" ></sbux-input>
			                            	</div>
			                            </td>
			                            <th scope="row" class="th_bg cu-tab2-fom-area" >관리항목6</th>
			                            <td colspan="2" class="td_input" >
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE6, 'ACC_ITEM_VALUE6')"  id="ACC_ITEM_VALUE6" uitype="text" class="form-control input-sm" ></sbux-input>
				   								<sbux-input onchange="fn_FomChange(ACC_VALUE_NAME6, 'ACC_VALUE_NAME6')"  id="ACC_VALUE_NAME6" uitype="text" class="form-control input-sm" ></sbux-input>
			                            	</div>
			                            </td>
			                            <th scope="row" class="th_bg cu-tab2-fom-area" >관리항목10</th>
			                            <td colspan="2" class="td_input" >
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE10, 'ACC_ITEM_VALUE10')"  id="ACC_ITEM_VALUE10" uitype="text" class="form-control input-sm" ></sbux-input>
				   								<sbux-input onchange="fn_FomChange(ACC_VALUE_NAME10, 'ACC_VALUE_NAME10')"  id="ACC_VALUE_NAME10" uitype="text" class="form-control input-sm" ></sbux-input>
			                            	</div>
			                            </td>
									</tr>
			                        <tr>
			                            <th scope="row" class="th_bg cu-tab2-fom-area" >관리항목3</th>
			                            <td colspan="2" class="td_input" >
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE3, 'ACC_ITEM_VALUE3')"  id="ACC_ITEM_VALUE3" uitype="text" class="form-control input-sm" ></sbux-input>
				   								<sbux-input onchange="fn_FomChange(ACC_VALUE_NAME3, 'ACC_VALUE_NAME3')"  id="ACC_VALUE_NAME3" uitype="text" class="form-control input-sm" ></sbux-input>
			                            	</div>
			                            </td>
			                            <th scope="row" class="th_bg cu-tab2-fom-area" >관리항목7</th>
			                            <td colspan="2" class="td_input" >
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE7, 'ACC_ITEM_VALUE7')"  id="ACC_ITEM_VALUE7" uitype="text" class="form-control input-sm" ></sbux-input>
				   								<sbux-input onchange="fn_FomChange(ACC_VALUE_NAME7, 'ACC_VALUE_NAME7')"  id="ACC_VALUE_NAME7" uitype="text" class="form-control input-sm" ></sbux-input>
			                            	</div>
			                            </td>
			                            <th scope="row" class="th_bg cu-tab2-fom-area" ></th>
			                            <td colspan="2" class="td_input" >
			                            </td>
									</tr>
			                        <tr>
			                            <th scope="row" class="th_bg cu-tab2-fom-area" >관리항목4</th>
			                            <td colspan="2" class="td_input" >
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE4, 'ACC_ITEM_VALUE4')"  id="ACC_ITEM_VALUE4" uitype="text" class="form-control input-sm" ></sbux-input>
				   								<sbux-input onchange="fn_FomChange(ACC_VALUE_NAME4, 'ACC_VALUE_NAME4')"  id="ACC_VALUE_NAME4" uitype="text" class="form-control input-sm" ></sbux-input>
			                            	</div>
			                            </td>
			                            <th scope="row" class="th_bg cu-tab2-fom-area" >관리항목8</th>
			                            <td colspan="2" class="td_input" >
			                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE8, 'ACC_ITEM_VALUE8')"  id="ACC_ITEM_VALUE8" uitype="text" class="form-control input-sm" ></sbux-input>
				   								<sbux-input onchange="fn_FomChange(ACC_VALUE_NAME8, 'ACC_VALUE_NAME8')"  id="ACC_VALUE_NAME8" uitype="text" class="form-control input-sm" ></sbux-input>
			                            	</div>
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
	
	var p_ss_issAccountChief	= '${loginVO.maIsAccountChief}';
	var p_ss_isAccountManager	= '${loginVO.maIsAccountManager}';
	var p_ss_fiDeleteUser 		= '${loginVO.maFI_DELETE_USER}';
	var p_ss_empCode 			= '${loginVO.maEmpCode}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	var p_ss_siteCode			= '${loginVO.maSiteCode}';
	var p_ss_deptCode			= '${loginVO.maDeptCode}';
	var p_ss_deptName			= '${loginVO.maDeptName}';
	var p_ss_currUnit			= '${loginVO.maCurrUnit}';

	var p_menu_param			= null;	// 메뉴이동 파라미터
	
	//grid 초기화
	var Fig2310GridList; 			// 그리드를 담기위한 객체 선언
	var jsonFig2310List 	= []; 	// 그리드의 참조 데이터 주소 선언

	var Fig2310GridEdit; 			// 그리드를 담기위한 객체 선언
	var jsonFig2310Edit 	= [];	// 그리드의 참조 데이터 주소 선언

	var jsonTempList 		= [];	// 저장할 임시 저장소

	var jsonCbofiOrgCode 	= []; 	// 회계단위
	var jsonCurrencyCode 	= []; 	// 통화
	var jsonAcctRuleCode 	= []; 	// 회계기준
	var jsonAccCharacter 	= []; 	// 미결관리대상
	var jsonDocType 		= []; 	// 전표유형
	var jsonSiteCode 		= []; 	// 

	var jsonLineType 		= []; 	// 라인유형
	var jsonDebitCredit 	= []; 	// 차/대
    var jsonHoldReason		= []; 	// 보류사유 

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
    
	var pp_strAccountCodeList	= ""; // 복수계정 파라미터
	var pp_strCsCodeList		= ""; // 복수거래처 파라미터
	
	var bEditEventEnabled		= true;

    var p_sel_row 				= '';
    var p_sel_col 				= '';
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['sch-fi-org-code'],			jsonCbofiOrgCode, 	'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            gfnma_setComSelect(['sch-site-code'],			jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['sch-currency-code'],		jsonCurrencyCode, 	'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['sch-acct-rule-code'],		jsonAcctRuleCode, 	'L_FIM054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 미결관리대상
            gfnma_setComSelect(['sch-acc-character'],		jsonAccCharacter, 	'L_FIM033_01', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표유형
            gfnma_setComSelect(['sch-doc-type'],			jsonDocType, 	  	'L_FIM051_CLR', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            
            // 그리드내 라인유형
			gfnma_setComSelect([], 							jsonLineType, 		'L_FIM052', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 그리드내 차/대
			gfnma_setComSelect([], 							jsonDebitCredit, 	'L_FIG003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 그리드내 보류사유
			gfnma_setComSelect([], 							jsonHoldReason, 	'L_COM042', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			
            // 전자발행
            gfnma_setComSelect(['ETAX_TYPE'],					jsonEtaxType, 		'L_FIT005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 카드용도
            gfnma_setComSelect(['CARD_USE_TYPE'],				jsonCardUseType, 	'L_FIT012', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 내국신용장구분
            gfnma_setComSelect(['LOCAL_CREDIT_TYPE'],			jsonLocalCreditType,'L_FIT011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 불공제유형
            gfnma_setComSelect(['VAT_NOT_DEDUCTION_TYPE'],		jsonVatNotDedType,	'L_FIT013', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 예정신고누락
            gfnma_setComSelect(['REPORT_OMIT_YN'],				jsonReportOmitYn,	'L_FIT009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 중복발행
            gfnma_setComSelect(['DUP_ISSUE_BILL_TYPE'],			jsonDupIssList,		'L_FIT007', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 감가상각자산유형
            gfnma_setComSelect(['VAT_ASSET_TYPE'],				jsonVatAssetType,	'L_FIT014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 11일외전송
            gfnma_setComSelect(['AFTER_DUE_DATE_YN'],			jsonAfterDueDateYn,	'L_FIT006', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 영세율첨부서류여부
            gfnma_setComSelect(['ZERO_REPORT_YN'],				jsonZeroReportYn,	'L_FIT019', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 수입금액제외
            gfnma_setComSelect(['EXCLUDE_REVENUE_AMT_YN'],		jsonExcludeAmtYn,	'L_FIT008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 영세율구분
            gfnma_setComSelect(['ZERO_TYPE'],					jsonZeroType,		'L_FIT010', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state();
  	    fn_createFig2310GridList();	
  	    fn_createFig2310GridEdit();	
	}    
    
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	
    	p_menu_param = localStorage.getItem("callMain");
    	if(p_menu_param){
    		p_menu_param = JSON.parse(p_menu_param);
    	}
    	localStorage.removeItem("callMain");
    	
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

    /**
     * 화면 state 변경
     */
    function fn_state() {
    	
		SBUxMethod.set("sch-account-code-fr", "");
		SBUxMethod.set("sch-account-name-fr", "");
		SBUxMethod.set("sch-account-code-to", "");
		SBUxMethod.set("sch-account-name-to", "");
		
		SBUxMethod.set("sch-chkspot-yn", 		"N");
		SBUxMethod.set("sch-doc-type", 			"93");
		SBUxMethod.hide("sch-chkspot-yn");
		SBUxMethod.attr('sch-exchange-rate',	'disabled', true);
		
		if(p_menu_param){
			if(p_menu_param['FI_ORG_CODE']){
				SBUxMethod.set("sch-fi-org-code", 		p_menu_param['FI_ORG_CODE']);
			}
			if(p_menu_param['ACCT_RULE_CODE']){
				SBUxMethod.set("sch-acct-rule-code", 	p_menu_param['ACCT_RULE_CODE']);
			}
			
			SBUxMethod.set("sch-site-code", 	p_ss_siteCode);
			SBUxMethod.set("sch-dept-code", 	p_ss_deptCode);
			SBUxMethod.set("sch-dept-name", 	p_ss_deptName);
		} else {
			SBUxMethod.set("sch-fi-org-code", 	p_ss_fiOrgCode);
			SBUxMethod.set("sch-site-code", 	p_ss_siteCode);
			SBUxMethod.set("sch-dept-code", 	p_ss_deptCode);
			SBUxMethod.set("sch-dept-name", 	p_ss_deptName);
		}
		
		if(p_ss_isAccountManager || p_ss_issAccountChief){
			SBUxMethod.set("sch-open-to-fcm-yn", 	"N");
			SBUxMethod.show("sch-chkspot-yn");
			SBUxMethod.attr('sch-exchange-rate',	'disabled', false);
		} else {
			SBUxMethod.set("sch-open-to-fcm-yn", 	"Y");
			SBUxMethod.hide("sch-chkspot-yn");
			SBUxMethod.attr('sch-exchange-rate',	'disabled', true);
		}    	
		
    }
    
    function fn_createFig2310GridList() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTop';
	    SBGridProperties.id 				= 'Fig2310GridList';
	    SBGridProperties.jsonref 			= 'jsonFig2310List';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	{caption: [""], ref: 'CHECK_YN', type: 'checkbox', width: '40px', style: 'text-align:center',
        	    typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
        	        checkedvalue: 'Y', uncheckedvalue: 'N'
        	    }
        	},        	
            {caption: ["전표유형"],					ref: 'ITEM_SOURCE_TYPE_NAME',	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전표번호"],					ref: 'DOC_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전기일자"],  				ref: 'DOC_DATE', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["계정명"],  					ref: 'ACCOUNT_NAME', 			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["부서명"],  					ref: 'DEPT_NAME', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["원가중심코드"], 			ref: 'COST_CENTER_CODE', 		type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ["원가중심명"], 				ref: 'COST_CENTER_NAME', 		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["거래처코드"], 				ref: 'CS_CODE', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["거래처명"], 				ref: 'CS_NAME', 				type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["통화"], 					ref: 'CURRENCY_CODE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환율"], 					ref: 'EXCHANGE_RATE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["차대"], 					ref: 'DEBIT_CREDIT_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순금액(잔액-통화)"], 		ref: 'REMAIN_ORIGINAL_AMOUNT_RAW', 			type:'output',		width:'200px',  	style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20},  format : {type:'number', rule:'#,###'}},
            {caption: ["반제금액(통화)"], 			ref: 'REMAIN_ORIGINAL_AMOUNT_RAW', 			type:'output',		width:'200px',  	style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20},  format : {type:'number', rule:'#,###'}},
            {caption: ["적요"], 					ref: 'DOC_DESC',    			type:'output',  	width:'300px',  		style:'text-align:left'},
            {caption: ["상태"], 					ref: 'DOC_STATUS_NAME', 		type:'output',  	width:'100px',  		style:'text-align:left'},
        ];

        Fig2310GridList = _SBGrid.create(SBGridProperties);
        Fig2310GridList.bind('valuechanged', 	'fn_changeValFig2310GridListEvent')
        //Fig2310GridList.bind('click', 'fn_popViewFig2310GridEvent');
    }	

    /**
     * 그리드내 change event
     */    
    function fn_changeValFig2310GridListEvent() {
        let nRow = Fig2310GridList.getRow(); // 클릭한 Row Index 추출
        let nCol = Fig2310GridList.getCol(); // 클릭한 Col Index 추출

        let rowData = Fig2310GridList.getRowData(nRow);
		console.log('nRow:', nRow);
		console.log('nCol:', nCol);
		console.log('rowData:', rowData);
        
        let cellValue = Fig2310GridList.getCellData(nRow, nCol);
		console.log('cellValue:', cellValue);
        if (Fig2310GridList.getRefOfCol(nCol) == 'CHECK_YN') {			
            if(cellValue=='Y'){
            	if(Number(rowData['APPLY_ORIGINAL_AMOUNT_INPUT'])==0){
            		jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT_INPUT'] 	= rowData['REMAIN_ORIGINAL_AMOUNT_RAW'];
            		jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT'] 		= rowData['REMAIN_ORIGINAL_AMOUNT'];
            	}
            	if(Number(rowData['APPLY_FUNCTIONAL_AMOUNT'])==0){
            		jsonFig2310List[nRow-1]['APPLY_FUNCTIONAL_AMOUNT'] 		= rowData['REMAIN_FUNCTIONAL_AMOUNT'];
            	}
            	if(Number(rowData['APPLY_ORIGINAL_AMOUNT_RAW'])==0){
            		jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT_RAW'] 	= rowData['REMAIN_ORIGINAL_AMOUNT_RAW'];
            	}
            } else {
            	jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT']		= '0';
            	jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT_INPUT']	= '0';
            	jsonFig2310List[nRow-1]['APPLY_FUNCTIONAL_AMOUNT']		= '0';
            	jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT_RAW']	= '0';
            }
        	if(rowData['HOLD_FLAG']=='Y'){
        		jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT']		= '0';
        		jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT_INPUT']	= '0';
        		jsonFig2310List[nRow-1]['APPLY_FUNCTIONAL_AMOUNT']		= '0';
        		jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT_RAW']	= '0';
        		jsonFig2310List[nRow-1]['CHECK_YN']						= 'N';
          		gfn_comAlert("E0000","보류지정된 거래처 또는 전표입니다.");
    			return;      		 
        	}
        }
        
        if (Fig2310GridList.getRefOfCol(nCol) == 'APPLY_ORIGINAL_AMOUNT_INPUT') {			
        	if(rowData['DEBIT_CREDIT']=='C'){
            	jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT']		= Math.abs(Number(rowData['APPLY_ORIGINAL_AMOUNT_INPUT']));
        	} else {
            	jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT']		= rowData['APPLY_ORIGINAL_AMOUNT_INPUT'];
        	}
        	if(rowData['APPLY_ORIGINAL_AMOUNT']==rowData['REMAIN_ORIGINAL_AMOUNT']){
            	jsonFig2310List[nRow-1]['APPLY_FUNCTIONAL_AMOUNT']		= rowData['REMAIN_FUNCTIONAL_AMOUNT'];
        	} else {
            	if(Number(rowData['APPLY_ORIGINAL_AMOUNT_INPUT']) == 0){
            		jsonFig2310List[nRow-1]['APPLY_FUNCTIONAL_AMOUNT']		= '0';
            		jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT_RAW']	= '0';
            		jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT']		= '0';
            	}
            	if(Number(rowData['APPLY_ORIGINAL_AMOUNT_INPUT']) != 0){
            		var tmp1 = gfnma_getRound((Number(rowData['APPLY_ORIGINAL_AMOUNT']) * Number(rowData['EXCHANGE_RATE']) / Number(SBUxMethod.get('sch-numbase-scale'))), Number(p_ss_currUnit));
            		jsonFig2310List[nRow-1]['APPLY_FUNCTIONAL_AMOUNT']		= Number(tmp1);
            		var tmp2 = Number(rowData['REMAIN_ORIGINAL_AMOUNT']) * Number(rowData['REMAIN_ORIGINAL_AMOUNT_RAW']);
            		if(tmp2>0){
            			tmp2 = 1;
            		} else if(tmp2<0){
            			tmp2 = -1;
            		} else {
            			tmp2 = 0;
            		}
            		jsonFig2310List[nRow-1]['APPLY_ORIGINAL_AMOUNT_RAW']	= (Number(rowData['APPLY_ORIGINAL_AMOUNT']) *  tmp2);
            		
            	}
        	}
        }
        fn_SummaryA();
    }    
    
    function fn_SummaryA() {
    		
        var p_dremain_functional_amount 	= 0;
        var p_dremain_original_amount 		= 0;
        var p_daply_functional_amount 		= 0;
        var p_dapply_original_amount 		= 0;
        var p_dapply_original_amount_raw 	= 0;

        var p_cr_apply_original_amount 		= 0;
        var p_dr_apply_original_amount 		= 0;
        var p_cr_apply_functional_amount 	= 0;
        var p_dr_apply_functional_amount 	= 0;
    	
    	for (var i = 0; i < jsonFig2310List.length; i++) {
			var obj = jsonFig2310List[i];
			if(obj['CHECK_YN']=='Y'){
				p_dremain_functional_amount 		+= Number(obj['REMAIN_FUNCTIONAL_AMOUNT']);
				p_dremain_original_amount 			+= Number(obj['REMAIN_ORIGINAL_AMOUNT']);
				p_daply_functional_amount 			+= Number(obj['APPLY_FUNCTIONAL_AMOUNT']);
				p_dapply_original_amount 			+= Number(obj['APPLY_ORIGINAL_AMOUNT_INPUT']);
				p_dapply_original_amount_raw 		+= Number(obj['APPLY_ORIGINAL_AMOUNT_RAW']);
				if(obj['DEBIT_CREDIT']=='D'){
					p_dr_apply_original_amount 		+= Number(obj['APPLY_ORIGINAL_AMOUNT']);
					p_dr_apply_functional_amount 	+= Number(obj['APPLY_FUNCTIONAL_AMOUNT']);
				} else {
					p_cr_apply_original_amount 		+= Number(obj['APPLY_ORIGINAL_AMOUNT']);
					p_cr_apply_functional_amount 	+= Number(obj['APPLY_FUNCTIONAL_AMOUNT']);
				}
			}
    	}
    	
    	SBUxMethod.set('sch-numremain-functional-amount', 	p_dremain_functional_amount);
    	SBUxMethod.set('sch-numremain-original-amount', 	p_dremain_original_amount);
    	SBUxMethod.set('sch-numapply-functional-amount', 	p_daply_functional_amount);
    	SBUxMethod.set('sch-numapply-original-amount', 		p_dapply_original_amount);
    	
    	SBUxMethod.set('sch-numapply-functional-amt-cr', 	p_cr_apply_functional_amount);
    	SBUxMethod.set('sch-numapply-functional-amt-dr', 	p_dr_apply_functional_amount);
    	SBUxMethod.set('sch-numapply-original-amount-raw', 	p_dapply_original_amount_raw);
    	
        var iDrSetCnt = 0;
        var iCrSetCnt = 0;    	
        var tmp1 	= gfnma_nvl(SBUxMethod.get('sch-acc-character'));
        var elist	= jsonFig2310Edit;
        if(tmp1){
        	if(elist.length > 0){
            	for (var i = elist.length - 1; i >= 0; i--) {
        			var obj2 = elist[i];
            		if(obj2['CHECK_YN']=='Y'){
            			if(p_dr_apply_original_amount > 0){
                    		if(obj2['DEBIT_CREDIT']=='D' && obj2['LINE_TYPE']=='1' && iDrSetCnt == 0){
                    			Fig2310GridEdit.setCellData((i+1), 11, p_dr_apply_original_amount, true, true);
                    			iDrSetCnt ++;
                    		}
            			}
            			if(p_cr_apply_original_amount > 0){
                    		if(obj2['DEBIT_CREDIT']=='C' && obj2['LINE_TYPE']=='1' && iCrSetCnt == 0){
                    			Fig2310GridEdit.setCellData((i+1), 11, p_cr_apply_original_amount, true, true);
                    			iDrSetCnt ++;
                    		}
            			}
            		}
            	}
        	}
            // 반제항목 반대계정 설정된 행이 없을 경우 추가한다.
			if((p_dr_apply_original_amount > 0 && iDrSetCnt < 1) || (p_cr_apply_original_amount > 0 && iCrSetCnt < 1)){
				
		        var p_currency_code = gfnma_nvl(SBUxMethod.get('sch-currency-code'));
		        var p_exchange_rate = gfnma_nvl(SBUxMethod.get('sch-exchange-rate'));
		        var p_description 	= gfnma_nvl(SBUxMethod.get('sch-description'));
		        var idx 			= Fig2310GridEdit.getRows();
		        if(idx==-1){
		        	idx = 0;
		        }
		        Fig2310GridEdit.insertRow(idx-1, 'below');
		        Fig2310GridEdit.setCellData(idx, 1, 'Y', true, true);
		        Fig2310GridEdit.setCellData(idx, 2, idx, true, true);
		        Fig2310GridEdit.setCellData(idx, 3, '1', true, true);
		        Fig2310GridEdit.setCellData(idx, 13, p_currency_code, true, true);
		        Fig2310GridEdit.setCellData(idx, 30, p_exchange_rate, true, true);
		        Fig2310GridEdit.setCellData(idx, 14, p_description, true, true);
		        if(p_dr_apply_original_amount > 0 && iDrSetCnt < 1){
			        Fig2310GridEdit.setCellData(idx, 4, 'D', true, true);
			        Fig2310GridEdit.setCellData(idx, 11, p_dr_apply_original_amount, true, true);
		        }
                // 반제항목 반대계정 설정된 행이 없을 경우추가한다.
                if(p_cr_apply_original_amount > 0 && iCrSetCnt < 1){
			        Fig2310GridEdit.setCellData(idx, 4, 'C', true, true);
			        Fig2310GridEdit.setCellData(idx, 11, p_cr_apply_original_amount, true, true);
                }
			}        		
        	if(elist.length > 0){
        		if(p_dr_apply_original_amount == 0 || p_cr_apply_original_amount == 0){
                	for (var i = elist.length - 1; i >= 0; i--) {
            			var obj2 = elist[i];
                		if(obj2['DEBIT_CREDIT']=='D' && obj2['LINE_TYPE']=='1'){
                			if(p_dr_apply_original_amount == 0){
                		    	Fig2310GridEdit.deleteRow(Fig2310GridEdit.getRow());
                			}
                		} else if(obj2['DEBIT_CREDIT']=='C' && obj2['LINE_TYPE']=='1'){
                			if(p_cr_apply_original_amount == 0){
                		    	Fig2310GridEdit.deleteRow(Fig2310GridEdit.getRow());
                			}
                		}
                	}
        		}
        	}
        }
    }
    
    function fn_SummaryB() {
    	
        var daply_functional_amount2 	= 0;
        var dapply_original_amount2 	= 0;            
        var cr_apply_functional_amount2 = 0;
        var dr_apply_functional_amount2 = 0;
    	
   		var editAllList = Fig2310GridEdit.getGridDataAll();
    	for (var i = 0; i < editAllList.length; i++) {
    		var obj = editAllList[i];
    		if(obj['CHECK_YN']=='Y'){
    			daply_functional_amount2	+= Number(obj['FUNCTIONAL_AMT']);
    			dapply_original_amount2		+= Number(obj['ORIGINAL_AMT']);
    			if(obj['DEBIT_CREDIT'] =='D'){
    				dr_apply_functional_amount2 += Number(obj['FUNCTIONAL_AMT']);
    			} else {
    				cr_apply_functional_amount2 += Number(obj['FUNCTIONAL_AMT']);
    			}
    		}
    	}
    	
    	SBUxMethod.set('sch-numapply-functional-amount2', 	daply_functional_amount2);    	
    	SBUxMethod.set('sch-numapply-original-amount2', 	dapply_original_amount2);    	
    	SBUxMethod.set('sch-numapply-functional-amt-cr2', 	cr_apply_functional_amount2);    	
    	SBUxMethod.set('sch-numapply-functional-amt-dr2', 	dr_apply_functional_amount2);    	
    }
    
    function fn_SummaryTemp() {
    	
        var dorigin_dr_amt 		= 0;
        var dorigin_cr_amt 		= 0;
        var dfunctional_dr_amt 	= 0;
        var dfunctional_cr_amt 	= 0;    	
    	
    	for (var i = 0; i < jsonTempList.length; i++) {
    		var obj = jsonTempList[i];
    		dorigin_dr_amt		+= (obj['DEBIT_CREDIT'] == 'D') ? Number(obj['ORIGINAL_AMT']) : 0;
    		dorigin_cr_amt		+= (obj['DEBIT_CREDIT'] == 'C') ? Number(obj['ORIGINAL_AMT']) : 0;
    		dfunctional_dr_amt	+= (obj['DEBIT_CREDIT'] == 'D') ? Number(obj['FUNCTIONAL_AMT']) : 0;
    		dfunctional_cr_amt	+= (obj['DEBIT_CREDIT'] == 'C') ? Number(obj['FUNCTIONAL_AMT']) : 0;
    	}        
       
    	var t1 = dorigin_dr_amt - dorigin_cr_amt;
    	var t2 = dfunctional_dr_amt - dfunctional_cr_amt;
    	SBUxMethod.set('sch-numDiffWon', 		t1);    	
    	SBUxMethod.set('sch-numDiffFuntion', 	t2);   	
    }
    
    function fn_createFig2310GridEdit() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdBot';
	    SBGridProperties.id 				= 'Fig2310GridEdit';
	    SBGridProperties.jsonref 			= 'jsonFig2310Edit';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	{caption: [""], ref: 'CHECK_YN', type: 'checkbox', width: '40px', style: 'text-align:center',
        	    typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
        	        checkedvalue: 'Y', uncheckedvalue: 'N'
        	    }
        	},        	
            {caption: ["순번"], 					ref: 'ITEM_SEQ',    			type:'output',  	width:'60px',  		style:'text-align:left'},
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
            
            {caption: ["거래처"], 					ref: 'CS_CODE',    				type:'input',  		width:'70px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn1',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup1(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["거래처명"], 				ref: 'CS_NAME', 				type:'input',		width:'150px',  	style:'text-align:left'},

            {caption: ["계정코드"], 				ref: 'ACCOUNT_CODE', 			type:'input',  		width:'70px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn2',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup2(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["계정과목명"], 				ref: 'ACCOUNT_NAME', 			type:'input',		width:'150px',  	style:'text-align:left'},
            
            {caption: ["통화금액"], 				ref: 'ORIGINAL_AMT', 			type:'input',		width:'150px',  	style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20},  format : {type:'number', rule:'#,###'}},
            {caption: ["전표금액"], 				ref: 'FUNCTIONAL_AMT', 			type:'output',		width:'150px',  	style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20},  format : {type:'number', rule:'#,###'}},
            {caption: ["통화"],						ref: 'CURRENCY_CODE', 			type:'combo',  		width:'120px',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonCurrencyCode',
					label		: 'label',
					value		: 'value',
					displayui :true, 
					oneclickedit: true
            	}
            },

            {caption: ["적요"], 					ref: 'DESCRIPTION', 			type:'input',		width:'300px',  	style:'text-align:left'},
          
            {caption: ["부서"], 					ref: 'DEPT_NAME', 				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn3',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup3(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["부서코드"],					ref: 'DEPT_CODE', 				type:'output',		width:'100px',  	style:'text-align:left', hidden:true},
            
            {caption: ["원가중심점"], 				ref: 'COST_CENTER_CODE',		type:'input',  		width:'70px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn4',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup4(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["원가중심점명"], 			ref: 'COST_CENTER_NAME', 		type:'input',		width:'150px',  	style:'text-align:left'},
            
            {caption: ["사업장"],					ref: 'SITE_CODE', 				type:'combo',  		width:'100px',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonSiteCode',
					label		: 'label',
					value		: 'value',
					displayui 	: true, 
					oneclickedit: true
            	}
            },
            
            {caption: ["프로젝트코드"], 			ref: 'PROJECT_CODE',			type:'input',  		width:'100px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn5',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup5(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["프로젝트명"], 				ref: 'PROJECT_NAME', 			type:'input',		width:'250px',  	style:'text-align:left'},
          
            {caption: ["지급기준"], 				ref: 'PAY_TERM_CODE', 			type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn6',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup6(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["지급기준명"], 				ref: 'PAY_TERM_NAME', 			type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["지급방법"], 				ref: 'PAY_METHOD', 				type:'output',		width:'150px',  	style:'text-align:left'},
            
			{caption: ['지급기일'],					ref: 'EXPECTED_PAY_DATE',		type:'datepicker',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	}, width:'150px', style:'text-align:center'},	
            {caption: ["환율"], 					ref: 'EXCHANGE_RATE', 			type:'input',		width:'100px',  	style:'text-align:right'},
            
            {caption: ["원천징수여부"], 			ref: 'WITHHOLD_FLAG', 			type:'checkbox', 	width:'80px', 		style:'text-align:center', typeinfo: { ignoreupdate: false, checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
            
            {caption: ["원천징수세금코드"], 		ref: 'WITHHOLD_TAX_TYPE',		type:'input',  		width:'120px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn7',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup7(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["원천징수세금코드"],			ref: 'WITHHOLD_TAX_TYPE_CODE', 	type:'output',		width:'100px',  	style:'text-align:left', hidden:true},

            {caption: ["원천징수거래처"], 			ref: 'WITHHOLD_CS_CODE', 		type:'input',		width:'150px',  	style:'text-align:left'},
            
            {caption: ["원천징수세금코드2"], 		ref: 'WITHHOLD_TAX_TYPE2',		type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn8',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup8(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["원천징수세금코드2"],		ref: 'WITHHOLD_TAX_TYPE2_CODE', type:'output',		width:'100px',  	style:'text-align:left', hidden:true},

            {caption: ["원천징수거래처2"], 			ref: 'WITHHOLD_CS_CODE2', 		type:'input',		width:'150px',  	style:'text-align:left'},
            
            {caption: ["보류사유"],					ref: 'HOLD_REASON', 			type:'combo',  		width:'120px',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonHoldReason',
					label		: 'label',
					value		: 'value',
					displayui 	: true, 
					oneclickedit: true
            	}
            },

            {caption: ["보류자"], 					ref: 'HOLD_USER', 				type:'input',		width:'100px',  	style:'text-align:left'},
            {caption: ["보류여부"], 				ref: 'HOLD_FLAG', 				type:'checkbox', 	width:'80px', 		style:'text-align:center', typeinfo: { ignoreupdate: false, checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
			{caption: ['해제일'],					ref: 'RELEASE_DATE',			type:'datepicker',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	}, width:'150px', style:'text-align:center'},	
            {caption: ["해제자"], 					ref: 'RELEASE_USER', 			type:'input',		width:'100px',  	style:'text-align:left'},
			{caption: ['보류일'],					ref: 'HOLD_DATE',				type:'datepicker',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	}, width:'150px', style:'text-align:center'},	
			{caption: ['지급기산일'],				ref: 'PAY_BASE_DATE',			type:'datepicker',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	}, width:'150px', style:'text-align:center'},	
			{caption: ['어음만기일'],				ref: 'BILL_DUE_DATE',			type:'datepicker',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	}, width:'150px', style:'text-align:center'},	
            {caption: ["어음기일"], 				ref: 'BILL_DUE_DAY', 			type:'input',		width:'100px',  	style:'text-align:left'},
			{caption: ['어음만기지급일'],			ref: 'BILL_DUE_PAY_DATE',		type:'datepicker',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	}, width:'150px', style:'text-align:center'},	
            
        ];

        Fig2310GridEdit = _SBGrid.create(SBGridProperties);
        Fig2310GridEdit.bind('valuechanged', 	'fn_changeValFig2310GridEditEvent')
        Fig2310GridEdit.bind('click', 			'fn_viewFig2310GridEditEvent');
    }	    

    /**
     * 그리드내 click event
     */
    function fn_viewFig2310GridEditEvent() {
    	
    	let nRow = Fig2310GridEdit.getRow();
    	let nCol = Fig2310GridEdit.getCol();
		if (nRow < 1) {
            return;
		}
		p_sel_row = nRow;
		p_sel_col = nCol;
		
        let rowData = Fig2310GridEdit.getRowData(nRow);
		fn_getFig2310GridEdit(rowData);
		
		if(rowData['LINE_TYPE']=='3'){
			//부가세
			SBUxMethod.selectTab('tab_norm','tab1');
		} else {
			SBUxMethod.selectTab('tab_norm','tab2');
		}
    }
    
    /**
     * 그리드내 change event
     */
    const fn_changeValFig2310GridEditEvent = async function() {
     
    	if(!bEditEventEnabled){
    		return;
    	}
    	
        let nRow = Fig2310GridEdit.getRow(); // 클릭한 Row Index 추출
        let nCol = Fig2310GridEdit.getCol(); // 클릭한 Col Index 추출

        let rowData = Fig2310GridEdit.getRowData(nRow);
        fn_getFig2310GridEdit(rowData);
		console.log('nRow:', nRow);
		console.log('nCol:', nCol);
		console.log('rowData:', rowData);
        
        let cellValue = Fig2310GridEdit.getCellData(nRow, nCol);
		console.log('cellValue:', cellValue);
		
		let p_entry_date_to	= gfnma_date7(gfnma_nvl(SBUxMethod.get("sch-entry-date-to")));
		
        if (Fig2310GridEdit.getRefOfCol(nCol) == 'LINE_TYPE') {			
            let comboItem = jsonLineType.find(item => item.value === cellValue); 

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
        }
        
        if (Fig2310GridEdit.getRefOfCol(nCol) == 'CURRENCY_CODE') {		
        	
			//환율가져오기
			let p_currency_code	= gfnma_nvl(rowData['CURRENCY_CODE']);
			var paramObj = {
				    V_P_DEBUG_MODE_YN	: '',
				    V_P_LANG_ID			: '',
				    V_P_COMP_CODE		: gv_ma_selectedApcCd,
				    V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
				    V_P_YYYYMMDD		: p_entry_date_to,
				    V_P_CURR_CODE		: p_currency_code,
				    V_P_RATE_TYPE		: "",
				    V_P_FORM_ID			: p_formId,
				    V_P_MENU_ID			: p_menuId,
				    V_P_PROC_ID			: '',
				    V_P_USERID			: '',
				    V_P_PC				: ''
			};
			gfnma_getExchangeRateQ(paramObj, "Q2", function(data){
				
				//SBUxMethod.set('sch-pop-exchange-rate', data[0]['RATE']);
				//SBUxMethod.set('sch-pop-numbase-scale', data[0]['BASE_SCALE']);
				var p_chkspot_yn 	= gfnma_nvl(SBUxMethod.get('sch-chkspot-yn')['sch-chkspot-yn']);
				var p_exchange_rate = gfnma_nvl(SBUxMethod.get('sch-exchange-rate'));
				if(p_chkspot_yn == 'N'){
					Fig2310GridEdit.setCellData(nRow, 30, data[0]['RATE'], true, true);
				} else {
					if( (p_chkspot_yn == 'Y') && (!p_exchange_rate) ){
						SBUxMethod.set('sch-exchange-rate', data[0]['RATE']);
					}
					Fig2310GridEdit.setCellData(nRow, 30, p_exchange_rate, true, true);
				}
				jsonFig2310Edit[nRow-1]['BASE_SCALE'] = data[0]['BASE_SCALE'];
				if( !(data[0]['BASE_SCALE']) || Number(rowData['ORIGINAL_AMT']) == 0 ){
            		var tmp1 = gfnma_getRound((Number(rowData['ORIGINAL_AMT']) * Number(p_exchange_rate) / Number(SBUxMethod.get('sch-numbase-scale'))), Number(p_ss_currUnit));
					Fig2310GridEdit.setCellData(nRow, 12, tmp1, true, true);
				} else {
            		var tmp2 = gfnma_getRound((Number(rowData['ORIGINAL_AMT']) * Number(rowData['EXCHANGE_RATE']) / Number(rowData['BASE_SCALE'])), Number(p_ss_currUnit));
					Fig2310GridEdit.setCellData(nRow, 12, tmp2, true, true);
				}
				fn_SummaryB();
			});
        }
        	
        if (Fig2310GridEdit.getRefOfCol(nCol) == 'ORIGINAL_AMT') {		
        	if( !rowData['BASE_SCALE'] || Number(rowData['ORIGINAL_AMT']) == 0 ){
        		var tmp1 = gfnma_getRound((Number(rowData['ORIGINAL_AMT']) * Number(p_exchange_rate) / Number(SBUxMethod.get('sch-numbase-scale'))), Number(p_ss_currUnit));
				Fig2310GridEdit.setCellData(nRow, 12, tmp1, true, true);
        	} else {
        		var tmp2 = gfnma_getRound((Number(rowData['ORIGINAL_AMT']) * Number(rowData['EXCHANGE_RATE']) / Number(rowData['BASE_SCALE'])), Number(p_ss_currUnit));
				Fig2310GridEdit.setCellData(nRow, 12, tmp2, true, true);
        	}
			fn_SummaryB();
        }
		
        if (Fig2310GridEdit.getRefOfCol(nCol) == 'PAY_TERM_CODE') {		
        	if(rowData['PAY_TERM_CODE']){
                let ht = await fn_getExpectedPayDate('Q2', rowData['PAY_TERM_CODE'], gfnma_date7(gfnma_nvl(SBUxMethod.get("sch-entry-date-to"))), '');
        		if(ht.length > 0){
        			var obj = ht[0];
        			if(Object.keys(obj).includes('EXPECTED_PAY_DATE')){
        				if( obj['EXPECTED_PAY_DATE'] != 'X' ){
        					bEditEventEnabled = false;
        					Fig2310GridEdit.setCellData(nRow, 29, gfnma_nvl(obj['EXPECTED_PAY_DATE']), 	true, true);
        					Fig2310GridEdit.setCellData(nRow, 46, gfnma_nvl(obj['PAY_BASE_DATE']), 		true, true);
        					Fig2310GridEdit.setCellData(nRow, 48, gfnma_nvl(obj['BILL_DUE_DAY']), 		true, true);
        					Fig2310GridEdit.setCellData(nRow, 47, gfnma_nvl(obj['BILL_DUE_DATE']), 		true, true);
        					Fig2310GridEdit.setCellData(nRow, 49, gfnma_nvl(obj['BILL_DUE_PAY_DATE']), 	true, true);
        					bEditEventEnabled = true;
        				} else if(obj['EXPECTED_PAY_DATE'] == 'X') {
        					bEditEventEnabled = false;
        					Fig2310GridEdit.setCellData(nRow, 29, p_entry_date_to, 	true, true);
        					Fig2310GridEdit.setCellData(nRow, 46, p_entry_date_to, 	true, true);
        					Fig2310GridEdit.setCellData(nRow, 48, '', true, true);
        					Fig2310GridEdit.setCellData(nRow, 47, '', true, true);
        					Fig2310GridEdit.setCellData(nRow, 49, '', true, true);
        					bEditEventEnabled = true;
        				}
        			}
        		}
        	}
        }
        
        if (Fig2310GridEdit.getRefOfCol(nCol) == 'PAY_BASE_DATE') {		
        	if(rowData['PAY_TERM_CODE']){
                let ht = await fn_getExpectedPayDate('Q2', rowData['PAY_TERM_CODE'], rowData['PAY_BASE_DATE'], 'PAY_BASE_DATE');
        		if(ht.length > 0){
        			var obj = ht[0];
        			if(Object.keys(obj).includes('EXPECTED_PAY_DATE')){
        				if( obj['EXPECTED_PAY_DATE'] != 'X' ){
        					Fig2310GridEdit.setCellData(nRow, 29, gfnma_nvl(obj['EXPECTED_PAY_DATE']), 	true, true);
        					Fig2310GridEdit.setCellData(nRow, 48, gfnma_nvl(obj['BILL_DUE_DAY']), 		true, true);
        					Fig2310GridEdit.setCellData(nRow, 47, gfnma_nvl(obj['BILL_DUE_DATE']), 		true, true);
        					Fig2310GridEdit.setCellData(nRow, 49, gfnma_nvl(obj['BILL_DUE_PAY_DATE']), 	true, true);
        				} else if(obj['EXPECTED_PAY_DATE'] == 'X') {
        					Fig2310GridEdit.setCellData(nRow, 29, rowData['PAY_BASE_DATE'], 	true, true);
        					Fig2310GridEdit.setCellData(nRow, 48, '', true, true);
        					Fig2310GridEdit.setCellData(nRow, 47, '', true, true);
        					Fig2310GridEdit.setCellData(nRow, 49, '', true, true);
        				}
        			}
        		}
        	}
        }
        
        if (Fig2310GridEdit.getRefOfCol(nCol) == 'BASIS_TYPE') {		
        	if(rowData['BASIS_TYPE'] == '5'){
				Fig2310GridEdit.setCellData(nRow, 46, p_entry_date_to, true, true);
				Fig2310GridEdit.setCellData(nRow, 29, "", true, true);
        	} else {
            	if(rowData['PAY_TERM_CODE']){
                    let ht = await fn_getExpectedPayDate('Q', rowData['PAY_TERM_CODE'], p_entry_date_to, 'PAY_BASE_DATE');
					Fig2310GridEdit.setCellData(nRow, 46, gfnma_nvl(ht[0]['EXPECTED_PAY_DATE']), true, true);
					Fig2310GridEdit.setCellData(nRow, 29, rowData['EXPECTED_PAY_DATE'], true, true);
            	}
        	}
        }
        
        if (Fig2310GridEdit.getRefOfCol(nCol) == 'ACCOUNT_CODE') {		
			jsonFig2310Edit[nRow-1]['ACC_ITEM_VALUE1'] = "";
			jsonFig2310Edit[nRow-1]['ACC_ITEM_VALUE2'] = "";
			jsonFig2310Edit[nRow-1]['ACC_ITEM_VALUE3'] = "";
			jsonFig2310Edit[nRow-1]['ACC_ITEM_VALUE4'] = "";
			jsonFig2310Edit[nRow-1]['ACC_ITEM_VALUE5'] = "";
			jsonFig2310Edit[nRow-1]['ACC_ITEM_VALUE6'] = "";
			jsonFig2310Edit[nRow-1]['ACC_ITEM_VALUE7'] = "";
			jsonFig2310Edit[nRow-1]['ACC_ITEM_VALUE8'] = "";
			jsonFig2310Edit[nRow-1]['ACC_ITEM_VALUE9'] = "";
			jsonFig2310Edit[nRow-1]['ACC_ITEM_VALUE10'] = "";
        	
			jsonFig2310Edit[nRow-1]['ACC_VALUE_NAME1'] = "";
			jsonFig2310Edit[nRow-1]['ACC_VALUE_NAME2'] = "";
			jsonFig2310Edit[nRow-1]['ACC_VALUE_NAME3'] = "";
			jsonFig2310Edit[nRow-1]['ACC_VALUE_NAME4'] = "";
			jsonFig2310Edit[nRow-1]['ACC_VALUE_NAME5'] = "";
			jsonFig2310Edit[nRow-1]['ACC_VALUE_NAME6'] = "";
			jsonFig2310Edit[nRow-1]['ACC_VALUE_NAME7'] = "";
			jsonFig2310Edit[nRow-1]['ACC_VALUE_NAME8'] = "";
			jsonFig2310Edit[nRow-1]['ACC_VALUE_NAME9'] = "";
			jsonFig2310Edit[nRow-1]['ACC_VALUE_NAME10'] = "";
        }
    }
    
    const fn_getExpectedPayDate = async function (wType, strpay_term_code, strtxn_date, strdate_type) {
        var retrunData = [];

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID			: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
            V_P_PAY_TERM_CODE 	: strpay_term_code,
            V_P_TXN_DATE 		: strtxn_date,
            V_P_OUTPUT_TYPE 	: '',
            V_P_BASE_CALC_TYPE 	: gfnma_nvl(strdate_type),
            V_P_FORM_ID			: p_formId,
            V_P_MENU_ID			: p_menuId,
            V_P_PROC_ID			: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/fi/far/rec/getExpectedPayDate.do", {
            getType: 'json',
            workType: wType,
            cv_count: '1',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {
                data.cv_1.forEach((item, index) => {
                    var msg = {
                        EXPECTED_PAY_DATE 	: item.EXPECTED_PAY_DATE,
                        PAY_BASE_DATE 		: item.PAY_BASE_DATE,
                        BILL_DUE_DAY 		: item.BILL_DUE_DAY,
                        BILL_DUE_DATE 		: item.BILL_DUE_DATE,
                        BILL_DUE_PAY_DATE 	: item.BILL_DUE_PAY_DATE
                    }
                    retrunData.push(msg);
                });
                return retrunData;
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
     * 그리드내 팝업(거래처) 조회
     */
	function fn_gridPopup1(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310GridEdit.getCellData(row, 5) 
        let cellData2 = Fig2310GridEdit.getCellData(row, 7) 
        if(!cellData1 && !cellData2){
        	gfn_comAlert("E0000","찾고자 하는 거래처 코드 혹은 거래처명을 2글자 이상 입력하세요");
        	return;	
        }
    	fn_gridPopup1Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(거래처) 오픈
     */
    var fn_gridPopup1Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_BIZ_REGNO_"; 
        var replaceText2 	= "_CS_NAME_"; 
        var strWhereClause 	= "AND A.CS_CODE LIKE '%" + replaceText0 + "%' AND A.BIZ_REGNO LIKE '%" + replaceText1 + "%' " + " AND A.CS_NAME LIKE '%" + replaceText2 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_CS_ALL'
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
				Fig2310GridEdit.setCellData(row, 5, 	data['CS_CODE'], true, true);
				Fig2310GridEdit.setCellData(row, 7, 	data['CS_NAME'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }      
    
    /**
     * 그리드내 팝업(계정코드) 조회
     */
	function fn_gridPopup2(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310GridEdit.getCellData(row, 8) 
        let cellData2 = Fig2310GridEdit.getCellData(row, 10) 
    	fn_gridPopup2Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(계정과목명) 오픈
     */
    var fn_gridPopup2Show = function(row, col, cellData1, cellData2) {
    	
        var nRow 			= Fig2310GridEdit.getRow();
        var rowData 		= Fig2310GridEdit.getRowData(nRow);
    	var pp_open_to_all	= "NULL"; 
    	var pp_line_type	= "'" + rowData['LINE_TYPE'] + "'"; 
    	var pp_open_to_fcm	= "'" + gfnma_nvl(SBUxMethod.get("sch-open-to-fcm-yn")) + "'"; 
    	if(pp_open_to_fcm==''){
    		pp_open_to_fcm	= "NULL";
    	};
        
        var searchText1 	= cellData1;
        var searchText2 	= cellData2;
    	var addParams 		= [pp_open_to_all, pp_line_type, pp_open_to_fcm];	
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				Fig2310GridEdit.setCellData(row, 8, 	data['ACCOUNT_CODE'], true, true);
				Fig2310GridEdit.setCellData(row, 10, 	data['ACCOUNT_NAME'], true, true);
				
				jsonFig2310Edit[row-1]['ACC_ITEM_CODE1'] = data['ACC_ITEM_CODE1'];
				jsonFig2310Edit[row-1]['ACC_ITEM_CODE2'] = data['ACC_ITEM_CODE2'];
				jsonFig2310Edit[row-1]['ACC_ITEM_CODE3'] = data['ACC_ITEM_CODE3'];
				jsonFig2310Edit[row-1]['ACC_ITEM_CODE4'] = data['ACC_ITEM_CODE4'];
				jsonFig2310Edit[row-1]['ACC_ITEM_CODE5'] = data['ACC_ITEM_CODE5'];
				jsonFig2310Edit[row-1]['ACC_ITEM_CODE6'] = data['ACC_ITEM_CODE6'];
				jsonFig2310Edit[row-1]['ACC_ITEM_CODE7'] = data['ACC_ITEM_CODE7'];
				jsonFig2310Edit[row-1]['ACC_ITEM_CODE8'] = data['ACC_ITEM_CODE8'];
				jsonFig2310Edit[row-1]['ACC_ITEM_CODE9'] = data['ACC_ITEM_CODE9'];
				jsonFig2310Edit[row-1]['ACC_ITEM_CODE10'] = data['ACC_ITEM_CODE10'];
				
				jsonFig2310Edit[row-1]['ACC_ITEM_NAME1'] = data['ACC_ITEM_NAME1'];
				jsonFig2310Edit[row-1]['ACC_ITEM_NAME2'] = data['ACC_ITEM_NAME2'];
				jsonFig2310Edit[row-1]['ACC_ITEM_NAME3'] = data['ACC_ITEM_NAME3'];
				jsonFig2310Edit[row-1]['ACC_ITEM_NAME4'] = data['ACC_ITEM_NAME4'];
				jsonFig2310Edit[row-1]['ACC_ITEM_NAME5'] = data['ACC_ITEM_NAME5'];
				jsonFig2310Edit[row-1]['ACC_ITEM_NAME6'] = data['ACC_ITEM_NAME6'];
				jsonFig2310Edit[row-1]['ACC_ITEM_NAME7'] = data['ACC_ITEM_NAME7'];
				jsonFig2310Edit[row-1]['ACC_ITEM_NAME8'] = data['ACC_ITEM_NAME8'];
				jsonFig2310Edit[row-1]['ACC_ITEM_NAME9'] = data['ACC_ITEM_NAME9'];
				jsonFig2310Edit[row-1]['ACC_ITEM_NAME10'] = data['ACC_ITEM_NAME10'];
				
				jsonFig2310Edit[row-1]['DATA_TYPE1'] = data['DATA_TYPE1'];
				jsonFig2310Edit[row-1]['DATA_TYPE2'] = data['DATA_TYPE2'];
				jsonFig2310Edit[row-1]['DATA_TYPE3'] = data['DATA_TYPE3'];
				jsonFig2310Edit[row-1]['DATA_TYPE4'] = data['DATA_TYPE4'];
				jsonFig2310Edit[row-1]['DATA_TYPE5'] = data['DATA_TYPE5'];
				jsonFig2310Edit[row-1]['DATA_TYPE6'] = data['DATA_TYPE6'];
				jsonFig2310Edit[row-1]['DATA_TYPE7'] = data['DATA_TYPE7'];
				jsonFig2310Edit[row-1]['DATA_TYPE8'] = data['DATA_TYPE8'];
				jsonFig2310Edit[row-1]['DATA_TYPE9'] = data['DATA_TYPE9'];
				jsonFig2310Edit[row-1]['DATA_TYPE10'] = data['DATA_TYPE10'];
				
				jsonFig2310Edit[row-1]['POPUP_ID1'] = data['POPUP_ID1'];
				jsonFig2310Edit[row-1]['POPUP_ID2'] = data['POPUP_ID2'];
				jsonFig2310Edit[row-1]['POPUP_ID3'] = data['POPUP_ID3'];
				jsonFig2310Edit[row-1]['POPUP_ID4'] = data['POPUP_ID4'];
				jsonFig2310Edit[row-1]['POPUP_ID5'] = data['POPUP_ID5'];
				jsonFig2310Edit[row-1]['POPUP_ID6'] = data['POPUP_ID6'];
				jsonFig2310Edit[row-1]['POPUP_ID7'] = data['POPUP_ID7'];
				jsonFig2310Edit[row-1]['POPUP_ID8'] = data['POPUP_ID8'];
				jsonFig2310Edit[row-1]['POPUP_ID9'] = data['POPUP_ID9'];
				jsonFig2310Edit[row-1]['POPUP_ID10'] = data['POPUP_ID10'];
				
				jsonFig2310Edit[row-1]['ACC_ITEM_YN1'] = data['ACC_ITEM_YN1'];
				jsonFig2310Edit[row-1]['ACC_ITEM_YN2'] = data['ACC_ITEM_YN2'];
				jsonFig2310Edit[row-1]['ACC_ITEM_YN3'] = data['ACC_ITEM_YN3'];
				jsonFig2310Edit[row-1]['ACC_ITEM_YN4'] = data['ACC_ITEM_YN4'];
				jsonFig2310Edit[row-1]['ACC_ITEM_YN5'] = data['ACC_ITEM_YN5'];
				jsonFig2310Edit[row-1]['ACC_ITEM_YN6'] = data['ACC_ITEM_YN6'];
				jsonFig2310Edit[row-1]['ACC_ITEM_YN7'] = data['ACC_ITEM_YN7'];
				jsonFig2310Edit[row-1]['ACC_ITEM_YN8'] = data['ACC_ITEM_YN8'];
				jsonFig2310Edit[row-1]['ACC_ITEM_YN9'] = data['ACC_ITEM_YN9'];
				jsonFig2310Edit[row-1]['ACC_ITEM_YN10'] = data['ACC_ITEM_YN10'];
				
				jsonFig2310Edit[row-1]['ACC_CATEGORY'] 	= data['ACC_CATEGORY'];
				jsonFig2310Edit[row-1]['PROJECT_YN'] 	= data['PROJECT_YN'];
				jsonFig2310Edit[row-1]['COST_CLASS'] 	= data['COST_CLASS'];
				
				fn_getFig2310GridEdit(jsonFig2310Edit[row-1]);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }      
    
    //그리드 값 가져오기
    function fn_getFig2310GridEdit(rowData) {
    	gfnma_uxDataClear('#tab1');
    	gfnma_uxDataClear('#tab2');
    	$('.cu-tab2-fom-area').text('');
    	
        gfnma_uxDataSet('#tab1', rowData);
        gfnma_uxDataSet('#tab2', rowData);
    }
    
    /**
     * 그리드내 팝업(부서) 조회
     */
	function fn_gridPopup3(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310GridEdit.getCellData(row, 15) 
        let cellData2 = Fig2310GridEdit.getCellData(row, 17) 
    	fn_gridPopup3Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(부서) 오픈
     */
    var fn_gridPopup3Show = function(row, col, cellData1, cellData2) {
    	
        var searchText1 	= cellData2;
        var searchText2 	= cellData1;
        var searchText3 	= gfnma_date4();
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				Fig2310GridEdit.setCellData(row, 15, 	data['DEPT_NAME'], true, true);
				Fig2310GridEdit.setCellData(row, 17, 	data['DEPT_CODE'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }      
    
    /**
     * 그리드내 팝업(원가중심점코드) 조회
     */
	function fn_gridPopup4(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310GridEdit.getCellData(row, 18) 
        let cellData2 = Fig2310GridEdit.getCellData(row, 20) 
    	fn_gridPopup4Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(원가중심점코드) 오픈
     */
    var fn_gridPopup4Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_"; 
        var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				Fig2310GridEdit.setCellData(row, 18, 	data['COST_CENTER_CODE'], true, true);
				Fig2310GridEdit.setCellData(row, 20, 	data['COST_CENTER_NAME'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }    
    
    /**
     * 그리드내 팝업(프로젝트코드) 조회
     */
	function fn_gridPopup5(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310GridEdit.getCellData(row, 22) 
        let cellData2 = Fig2310GridEdit.getCellData(row, 24) 
    	fn_gridPopup5Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(프로젝트코드) 오픈
     */
    var fn_gridPopup5Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_PROJECT_CODE_";
        var replaceText1 	= "_PROJECT_NAME_"; 
        var strWhereClause 	= "AND PROJECT_CODE LIKE '%" + replaceText0 + "%' AND PROJECT_NAME LIKE '%" + replaceText1 + "%' ";
		
		SBUxMethod.attr('modal-compopup1', 'header-title', '프로젝트');
		compopup1({
			compCode				: gv_ma_selectedApcCd
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
				Fig2310GridEdit.setCellData(row, 22, 	data['PROJECT_CODE'], true, true);
				Fig2310GridEdit.setCellData(row, 24, 	data['PROJECT_NAME'], true, true);
			},
		});
		SBUxMethod.openModal('modal-compopup1');
    }         
    
    /**
     * 그리드내 팝업(지급기준) 조회
     */
	function fn_gridPopup6(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310GridEdit.getCellData(row, 25) 
        let cellData2 = Fig2310GridEdit.getCellData(row, 27) 
    	fn_gridPopup6Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(지급기준) 오픈
     */
    var fn_gridPopup6Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_PAY_TERM_CODE_";
        var replaceText1 	= "_PAY_TERM_NAME_"; 
        var strWhereClause 	= "AND PAY_TERM_CODE LIKE '%" + replaceText0 + "%' AND PAY_TERM_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '지급기일정보');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				Fig2310GridEdit.setCellData(row, 25, 	data['PAY_TERM_CODE'], true, true);
				Fig2310GridEdit.setCellData(row, 27, 	data['PAY_TERM_NAME'], true, true);
				Fig2310GridEdit.setCellData(row, 28, 	data['PAY_METHOD_NAME'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }    
    
    /**
     * 그리드내 팝업(원천징수세금코드) 조회
     */
	function fn_gridPopup7(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310GridEdit.getCellData(row, 32) 
        let cellData2 = Fig2310GridEdit.getCellData(row, 34) 
    	fn_gridPopup7Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(원천징수세금코드) 오픈
     */
    var fn_gridPopup7Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_TAX_TYPE_CODE_";
        var replaceText1 	= "_TAX_TYPE_NAME_"; 
        var strWhereClause 	= "AND A.TAX_TYPE_CODE LIKE '%" + replaceText0 + "%' AND A.TAX_TYPE_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원천징수세금코드');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_WITHHOLD_TAX_TYPE'
       		,popupType				: 'A'
       		,whereClause			: strWhereClause
       		,searchCaptions			: ["원천세코드", 		"원천세명"]
   			,searchInputFields		: ["TAX_TYPE_CODE", 	"TAX_TYPE_NAME"]
   			,searchInputValues		: [cellData2, 			cellData1]
   			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '800px'
    		,height					: '500px'
   			,tableHeader			: ["원천세코드", 		"원천세명",			"세율구분",		"구분명",			"원천세율"]
   			,tableColumnNames		: ["TAX_TYPE_CODE", 	"TAX_TYPE_NAME",	"TAX_GROUP",	"TAX_GROUP_NAME",	"TAX_RATE"]
   			,tableColumnWidths		: ["100px", 			"250px",			"100px",		"200px",			"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2310GridEdit.setCellData(row, 32, 	data['TAX_TYPE_NAME'], true, true);
				Fig2310GridEdit.setCellData(row, 34, 	data['TAX_TYPE_CODE'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }    
    
    /**
     * 그리드내 팝업(원천징수세금코드2) 조회
     */
	function fn_gridPopup8(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310GridEdit.getCellData(row, 36) 
        let cellData2 = Fig2310GridEdit.getCellData(row, 38) 
    	fn_gridPopup8Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(원천징수세금코드2) 오픈
     */
    var fn_gridPopup8Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_TAX_TYPE_CODE_";
        var replaceText1 	= "_TAX_TYPE_NAME_"; 
        var strWhereClause 	= "AND A.TAX_TYPE_CODE LIKE '%" + replaceText0 + "%' AND A.TAX_TYPE_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원천징수세금코드2');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_WITHHOLD_TAX_TYPE'
       		,popupType				: 'A'
       		,whereClause			: strWhereClause
       		,searchCaptions			: ["원천세코드", 		"원천세명"]
   			,searchInputFields		: ["TAX_TYPE_CODE", 	"TAX_TYPE_NAME"]
   			,searchInputValues		: [cellData2, 			cellData1]
   			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '800px'
    		,height					: '500px'
   			,tableHeader			: ["원천세코드", 		"원천세명",			"세율구분",		"구분명",			"원천세율"]
   			,tableColumnNames		: ["TAX_TYPE_CODE", 	"TAX_TYPE_NAME",	"TAX_GROUP",	"TAX_GROUP_NAME",	"TAX_RATE"]
   			,tableColumnWidths		: ["100px", 			"250px",			"100px",		"200px",			"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2310GridEdit.setCellData(row, 36, 	data['TAX_TYPE_NAME'], true, true);
				Fig2310GridEdit.setCellData(row, 38, 	data['TAX_TYPE_CODE'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }    
    
    /**
     * 행추가
     */
    var fn_gridRowAdd = function() {
        var idx = Fig2310GridEdit.getRows();
        if(idx==-1){
        	idx = 0;
        }
        Fig2310GridEdit.insertRow(idx-1, 'below');
        Fig2310GridEdit.setCellData(idx, 2, idx, true, true);
        Fig2310GridEdit.setCellData(idx, 14, 0, true, true);
        Fig2310GridEdit.setCellData(idx, 15, 0, true, true);
        Fig2310GridEdit.setCellData(idx, 32, 1, true, true);
    }
    
    /**
     * 행삭제
     */
    var fn_gridRowDel = function() {
    	Fig2310GridEdit.deleteRow(Fig2310GridEdit.getRow());
    }     
    
    /**
     * 통화 변경 event
     */
    function fn_currencyCodeChange(val) {
    	
    	if(!val) return;
    	
    	let p_entry_date_to	= gfnma_date7(gfnma_nvl(SBUxMethod.get("sch-entry-date-to")));
    	
    	var paramObj = {
    		    V_P_DEBUG_MODE_YN	: '',
    		    V_P_LANG_ID			: '',
    		    V_P_COMP_CODE		: gv_ma_selectedApcCd,
    		    V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
    		    V_P_YYYYMMDD		: p_entry_date_to,
    		    V_P_CURR_CODE		: val,
    		    V_P_RATE_TYPE		: "",
    		    V_P_FORM_ID			: p_formId,
    		    V_P_MENU_ID			: p_menuId,
    		    V_P_PROC_ID			: '',
    		    V_P_USERID			: '',
    		    V_P_PC				: ''
    	};
    	gfnma_getExchangeRateQ(paramObj, "Q2", function(data){
    		
    		var p_chkspot_yn = gfnma_nvl(SBUxMethod.get('sch-chkspot-yn')['sch-chkspot-yn'])
    		if(p_chkspot_yn=='N'){
    			SBUxMethod.set('sch-exchange-rate', data[0]['RATE']);
    		}
    		var p_exchange_rate = gfnma_nvl(SBUxMethod.get('sch-exchange-rate'));
    		
    		SBUxMethod.set('sch-numbase-scale', data[0]['BASE_SCALE']);
    	    if(p_chkspot_yn == "Y" && !p_exchange_rate ){
    			SBUxMethod.set('sch-exchange-rate', data[0]['RATE']);
    	    }
    	});
    }        
    
    /**
     * 계정과목 
     */
    function fn_compopup1(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("sch-account-code-fr"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("sch-account-name-fr"));
        } else {
            searchText1 	= gfnma_nvl(SBUxMethod.get("sch-account-code-to"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("sch-account-name-to"));
        }
        
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_";
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND ACCOUNT_NAME LIKE '%" + replaceText1 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FIM042_1'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
    		,searchCaptions			: ["계정코드", 		"계정명"]
    		,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
    		,searchInputValues		: [searchText1, 	searchText2]
    		,height					: '400px'
    		,tableHeader			: ["계정코드", 		"계정명"]
    		,tableColumnNames		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
    		,tableColumnWidths		: ["100px", 		"200px"]
    		,itemSelectEvent		: function (data){
    			console.log('callback data:', data);
    			if(type=='1'){
    				SBUxMethod.set('sch-account-code-fr', data.ACCOUNT_CODE);
    				SBUxMethod.set('sch-account-name-fr', data.ACCOUNT_NAME);
    			} else {
    				SBUxMethod.set('sch-account-code-to', data.ACCOUNT_CODE);
    				SBUxMethod.set('sch-account-name-to', data.ACCOUNT_NAME);
    			}
    		},
    	});
    }  
    
    /**
     * 거래처 
     */
    function fn_compopup2(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("sch-cs-code-fr"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("sch-cs-name-fr"));
        } else {
            searchText1 	= gfnma_nvl(SBUxMethod.get("sch-cs-code-to"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("sch-cs-name-to"));
        }
        
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var replaceText2 	= "_BIZ_REGNO_";
        var strWhereClause 	= "AND a.CS_CODE LIKE '%" + replaceText0 + "%' AND a.CS_NAME LIKE '%" + replaceText1 + "%' AND a.BIZ_REGNO LIKE '%"+ replaceText2 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처정보');
    	compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM004'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드", 	"거래처명",  	"사업자번호" ]
            ,searchInputFields		: ["CS_CODE", 		"CS_NAME",  	"BIZ_REGNO"]
            ,searchInputValues		: [searchText1, 	searchText2, 	""         ]
            ,height					: '400px'
            ,width					: '1000px'
            ,tableHeader			: ["거래처코드",	"거래처명", 	"사업자번호" , 	"대표자",		"업태",			"종목",			"주소",		"전화",		"팩스"]
            ,tableColumnNames		: ["CS_CODE", 		"CS_NAME", 		"BIZ_REGNO", 	"CHIEF_NAME",	"BIZ_CATEGORY",	"BIZ_ITEMS",	"ADDRESS",	"TEL",		"FAX"]
            ,tableColumnWidths		: ["100px", 		"200px", 		"100px", 		"100px",		"100px",		"150px",		"400px",	"120px",	"120px"]
    		,itemSelectEvent		: function (data){
    			console.log('callback data:', data);
    			if(type=='1'){
    				SBUxMethod.set('sch-cs-code-fr', data.CS_CODE);
    				SBUxMethod.set('sch-cs-name-fr', data.CS_NAME);
    			} else {
    				SBUxMethod.set('sch-cs-code-to', data.CS_CODE);
    				SBUxMethod.set('sch-cs-name-to', data.CS_NAME);
    			}
    		},
    	});
    }    
    
    /**
     * 복수계정 
     */
    function fn_multiAccount() {
    	
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
    	SBUxMethod.openModal('modal-compopup3');
    	
    	compopup3({
    		height			: '400px'
    			,callbackEvent	: function (data){
    				console.log('callback data:', data);
    				pp_strAccountCodeList = "";
    				for (var i = 0; i < data.length; i++) {
    					pp_strAccountCodeList += data[i] + '|';
    				}
    				if(pp_strAccountCodeList){
    					pp_strAccountCodeList = pp_strAccountCodeList.slice(0, -1);
    					SBUxMethod.set('sch-multi-act-yn', "Y");
    				} else {
    					SBUxMethod.set('sch-multi-act-yn', "N");
    				}
    			},
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }  
    
    /**
     * 복수거래처 
     */
    function fn_multiCs() {
    	
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
    	SBUxMethod.openModal('modal-compopup3');
    	
    	compopup3({
    		height			: '400px'
    			,callbackEvent	: function (data){
    				console.log('callback data:', data);
    				pp_strCsCodeList = "";
    				for (var i = 0; i < data.length; i++) {
    					pp_strCsCodeList += data[i] + '|';
    				}
    				if(pp_strCsCodeList){
    					pp_strCsCodeList = pp_strCsCodeList.slice(0, -1);
    					SBUxMethod.set('sch-multi-cs-yn', "Y");
    				} else {
    					SBUxMethod.set('sch-multi-cs-yn', "N");
    				}
    			},
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }    

    /**
     * 조회
     */
    const fn_queryDisp = function (){

    	fn_subQueryDispA('Q');
    	fn_subQueryDispB('DEFAULTRULE');
    }

    /**
     * 조회
     */
    const fn_subQueryDispA = async function (wtype){

    	let p_cs_code_fr		= gfnma_nvl(SBUxMethod.get("sch-cs-code-fr"));
    	let p_cs_code_to		= gfnma_nvl(SBUxMethod.get("sch-cs-code-to"));
    	let p_account_code_fr	= gfnma_nvl(SBUxMethod.get("sch-account-code-fr"));
    	let p_account_code_to	= gfnma_nvl(SBUxMethod.get("sch-account-code-to"));
    	
    	let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("sch-fi-org-code"));
    	let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("sch-acct-rule-code"));
    	let p_entry_date_to		= gfnma_date7(gfnma_nvl(SBUxMethod.get("sch-entry-date-to")));
    	let p_acc_character		= gfnma_nvl(SBUxMethod.get("sch-acc-character"));
    	let p_currenty_code		= gfnma_nvl(SBUxMethod.get("sch-currency-code"));
    	
    	let p_rule_code 		= (wtype=='DEFAULTRULE') ? '93' : '';
    	
    	if( p_cs_code_fr == "" || p_cs_code_to == "" || p_account_code_fr == "" || p_account_code_to == ""){
    			gfn_comAlert("E0000","거래처 또는 계정과목을 반드시 입력 후 조회해주세요.");
    		return;      		 
    	}
    	if( !p_currenty_code ) {
    		gfn_comAlert("E0000","통화를 선택해야 합니다.");
    		return;      		 
    	}
    	
        var paramObj = { 
    		V_P_DEBUG_MODE_YN			: ''
    		,V_P_LANG_ID				: ''
    		,V_P_COMP_CODE				: gv_ma_selectedApcCd
    		,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
    	
    		,V_P_FI_ORG_CODE			: p_fi_org_code
    		,V_P_ACCT_RULE_CODE			: p_acct_rule_code
    		,V_P_BASE_DATE     			: p_entry_date_to
    		,V_P_ACCOUNT_CODE_FR 		: p_account_code_fr
    		,V_P_ACCOUNT_CODE_TO		: p_account_code_to
    		,V_P_CS_CODE_FR 			: p_cs_code_fr
    		,V_P_CS_CODE_TO				: p_cs_code_to
    		,V_P_ACCOUNT_CODE_D			: pp_strAccountCodeList
    		,V_P_CS_CODE_D				: pp_strCsCodeList
    		,V_P_ACC_CHARACTER			: p_acc_character
    		,V_P_CURRENCY_CODE			: p_currenty_code
    		,V_P_RULE_CODE				: p_rule_code
    			
    		,V_P_FORM_ID				: p_formId
    		,V_P_MENU_ID				: p_menuId
    		,V_P_PROC_ID				: ''
    		,V_P_USERID					: p_userId
    		,V_P_PC						: '' 
        };		
    	console.log('paramObj:', paramObj);
    	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig2320List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '3',
        	params				: gfnma_objectToString(paramObj)
    	});    	 
        const data = await postJsonPromise;
    	console.log('P_FIG2320_Q data:', data);

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		
            	/** @type {number} **/
        		let totalRecordCount = 0;

        		jsonFig2310List.length = 0;
            	data.cv_1.forEach((item, index) => {
    				const msg = {
    					ACCOUNT_CODE			: gfnma_nvl(item.ACCOUNT_CODE),			
    					ACCOUNT_NAME			: gfnma_nvl(item.ACCOUNT_NAME),			
    					
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
    					
    					AFTER_DUE_DATE_YN			: gfnma_nvl(item.AFTER_DUE_DATE_YN),			
    					APPLY_FUNCTIONAL_AMOUNT		: gfnma_nvl(item.APPLY_FUNCTIONAL_AMOUNT),			
    					APPLY_FUNCTIONAL_AMOUNT_RAW	: gfnma_nvl(item.APPLY_FUNCTIONAL_AMOUNT_RAW),			
    					APPLY_ORIGINAL_AMOUNT		: gfnma_nvl(item.APPLY_ORIGINAL_AMOUNT),			
    					APPLY_ORIGINAL_AMOUNT_INPUT	: gfnma_nvl(item.APPLY_ORIGINAL_AMOUNT_INPUT),			
    					APPLY_ORIGINAL_AMOUNT_RAW	: gfnma_nvl(item.APPLY_ORIGINAL_AMOUNT_RAW),			
    					
    					BASIS_TYPE				: gfnma_nvl(item.BASIS_TYPE),			
    					BILL_DUE_DATE			: gfnma_nvl(item.BILL_DUE_DATE),			
    					BILL_DUE_DAY			: gfnma_nvl(item.BILL_DUE_DAY),			
    					BILL_DUE_PAY_DATE		: gfnma_nvl(item.BILL_DUE_PAY_DATE),			
    					CARD_NUM				: gfnma_nvl(item.CARD_NUM),			
    					CARD_USE_TYPE			: gfnma_nvl(item.CARD_USE_TYPE),			
    					CHECK_YN				: gfnma_nvl(item.CHECK_YN),			
    					
    					COST_CENTER_CODE		: gfnma_nvl(item.COST_CENTER_CODE),			
    					COST_CENTER_NAME		: gfnma_nvl(item.COST_CENTER_NAME),			
    					CS_CODE					: gfnma_nvl(item.CS_CODE),			
    					CS_NAME					: gfnma_nvl(item.CS_NAME),			
    					CURRENCY_CODE			: gfnma_nvl(item.CURRENCY_CODE),			
    					DEBIT_CREDIT			: gfnma_nvl(item.DEBIT_CREDIT),			
    					DEBIT_CREDIT_NAME		: gfnma_nvl(item.DEBIT_CREDIT_NAME),			
    					DEPT_CODE				: gfnma_nvl(item.DEPT_CODE),			
    					DEPT_NAME				: gfnma_nvl(item.DEPT_NAME),			
    					
    					DOCUMENT_ISSUE_DATE		: gfnma_nvl(item.DOCUMENT_ISSUE_DATE),			
    					DOCUMENT_NAME			: gfnma_nvl(item.DOCUMENT_NAME),			
    					DOCUMENT_NO				: gfnma_nvl(item.DOCUMENT_NO),			
    					
    					DOC_BATCH_NO			: gfnma_nvl(item.DOC_BATCH_NO),			
    					DOC_DATE				: gfnma_nvl(item.DOC_DATE),			
    					DOC_DATE_P				: gfnma_nvl(item.DOC_DATE_P),			
    					DOC_DESC				: gfnma_nvl(item.DOC_DESC),			
    					DOC_ID					: gfnma_nvl(item.DOC_ID),			
    					DOC_NAME				: gfnma_nvl(item.DOC_NAME),			
    					DOC_NUM					: gfnma_nvl(item.DOC_NUM),			
    					DOC_STATUS				: gfnma_nvl(item.DOC_STATUS),			
    					DOC_STATUS_NAME			: gfnma_nvl(item.DOC_STATUS_NAME),			
    					DOC_TYPE				: gfnma_nvl(item.DOC_TYPE),			
    					DUP_ISSUE_BILL_TYPE		: gfnma_nvl(item.DUP_ISSUE_BILL_TYPE),			
    					ETAX_TYPE				: gfnma_nvl(item.ETAX_TYPE),			
    					
    					EXCHANGE_GAIN_ACCOUNT		: gfnma_nvl(item.EXCHANGE_GAIN_ACCOUNT),			
    					EXCHANGE_GAIN_ACCOUNT_NAME	: gfnma_nvl(item.EXCHANGE_GAIN_ACCOUNT_NAME),			
    					EXCHANGE_LOSS_ACCOUNT		: gfnma_nvl(item.EXCHANGE_LOSS_ACCOUNT),			
    					EXCHANGE_LOSS_ACCOUNT_NAME	: gfnma_nvl(item.EXCHANGE_LOSS_ACCOUNT_NAME),			
    					EXCHANGE_RATE				: gfnma_nvl(item.EXCHANGE_RATE),			
    					EXCHANGE_TYPE				: gfnma_nvl(item.EXCHANGE_TYPE),			
    					
    					EXCLUDE_REVENUE_AMT_YN		: gfnma_nvl(item.EXCLUDE_REVENUE_AMT_YN),			
    					EXPECTED_PAY_DATE			: gfnma_nvl(item.EXPECTED_PAY_DATE),			
    					EXPORT_AMT					: gfnma_nvl(item.EXPORT_AMT),			
    					EXPORT_AMT_KRW				: gfnma_nvl(item.EXPORT_AMT_KRW),			
    					EXPORT_LICENSE_NO			: gfnma_nvl(item.EXPORT_LICENSE_NO),			
    					FI_ORG_CODE					: gfnma_nvl(item.FI_ORG_CODE),			
    					FOREIGN_AMT					: gfnma_nvl(item.FOREIGN_AMT),			
    					FUNCTIONAL_AMOUNT			: gfnma_nvl(item.FUNCTIONAL_AMOUNT),			
    					HOLD_FLAG					: gfnma_nvl(item.HOLD_FLAG),			
    					HOLD_REASON					: gfnma_nvl(item.HOLD_REASON),			
    					ISSUE_NAME					: gfnma_nvl(item.ISSUE_NAME),			
    					ITEM_SOURCE_ID				: gfnma_nvl(item.ITEM_SOURCE_ID),			
    					ITEM_SOURCE_TYPE			: gfnma_nvl(item.ITEM_SOURCE_TYPE),			
    					ITEM_SOURCE_TYPE_NAME		: gfnma_nvl(item.ITEM_SOURCE_TYPE_NAME),			
    					LINE_STATUS					: gfnma_nvl(item.LINE_STATUS),			
    					LOCAL_CREDIT_TYPE			: gfnma_nvl(item.LOCAL_CREDIT_TYPE),			
    					ORIGINAL_AMOUNT				: gfnma_nvl(item.ORIGINAL_AMOUNT),			
    					PAYEE_CODE					: gfnma_nvl(item.PAYEE_CODE),			
    					PAY_BASE_DATE				: gfnma_nvl(item.PAY_BASE_DATE),			
    					PAY_METHOD					: gfnma_nvl(item.PAY_METHOD),			
    					PAY_TERM_CODE				: gfnma_nvl(item.PAY_TERM_CODE),			
    					PAY_TERM_NAME				: gfnma_nvl(item.PAY_TERM_NAME),			
    					PROJECT_CODE				: gfnma_nvl(item.PROJECT_CODE),			
    					PROJECT_NAME				: gfnma_nvl(item.PROJECT_NAME),			
    					
    					REMAIN_FUNCTIONAL_AMOUNT	: gfnma_nvl(item.REMAIN_FUNCTIONAL_AMOUNT),			
    					REMAIN_FUNCTIONAL_AMOUNT_RAW: gfnma_nvl(item.REMAIN_FUNCTIONAL_AMOUNT_RAW),			
    					REMAIN_ORIGINAL_AMOUNT		: gfnma_nvl(item.REMAIN_ORIGINAL_AMOUNT),			
    					REMAIN_ORIGINAL_AMOUNT_RAW	: gfnma_nvl(item.REMAIN_ORIGINAL_AMOUNT_RAW),			
    					
    					REPORT_OMIT_YN				: gfnma_nvl(item.REPORT_OMIT_YN),			
    					SEQ							: gfnma_nvl(item.SEQ),			
    					SHIPPING_DATE				: gfnma_nvl(item.SHIPPING_DATE),			
    					SITE_CODE					: gfnma_nvl(item.SITE_CODE),			
    					SOURCE_RECORD_COUNT			: gfnma_nvl(item.SOURCE_RECORD_COUNT),			
    					STANDARD_DATE				: gfnma_nvl(item.STANDARD_DATE),			
    					SUPPLY_AMT					: gfnma_nvl(item.SUPPLY_AMT),			
    					VAT_AMT						: gfnma_nvl(item.VAT_AMT),			
    					VAT_ASSET_TYPE				: gfnma_nvl(item.VAT_ASSET_TYPE),			
    					VAT_EXPORT_AMT				: gfnma_nvl(item.VAT_EXPORT_AMT),			
    					VAT_EXPORT_AMT_KRW			: gfnma_nvl(item.VAT_EXPORT_AMT_KRW),			
    					VAT_NOT_DEDUCTION_TYPE		: gfnma_nvl(item.VAT_NOT_DEDUCTION_TYPE),			
    					
    					VOUCHER_NO					: gfnma_nvl(item.VOUCHER_NO),			
    					VOUCHER_TYPE				: gfnma_nvl(item.VOUCHER_TYPE),
    					WON_AMT						: gfnma_nvl(item.WON_AMT),
    					ZERO_REPORT_YN				: gfnma_nvl(item.ZERO_REPORT_YN),
    					ZERO_TYPE					: gfnma_nvl(item.ZERO_TYPE)    		
    				}
    				jsonFig2310List.push(msg);
    				totalRecordCount ++;
    			});

            	Fig2310GridList.rebuild();
        		
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
     * 조회
     */
    const fn_subQueryDispB = async function (wtype){

    	let p_cs_code_fr		= gfnma_nvl(SBUxMethod.get("sch-cs-code-fr"));
    	let p_cs_code_to		= gfnma_nvl(SBUxMethod.get("sch-cs-code-to"));
    	let p_account_code_fr	= gfnma_nvl(SBUxMethod.get("sch-account-code-fr"));
    	let p_account_code_to	= gfnma_nvl(SBUxMethod.get("sch-account-code-to"));
    	
    	let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("sch-fi-org-code"));
    	let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("sch-acct-rule-code"));
    	let p_entry_date_to		= gfnma_date7(gfnma_nvl(SBUxMethod.get("sch-entry-date-to")));
    	let p_acc_character		= gfnma_nvl(SBUxMethod.get("sch-acc-character"));
    	let p_currenty_code		= gfnma_nvl(SBUxMethod.get("sch-currency-code"));
    	
    	let p_rule_code 		= (wtype=='DEFAULTRULE') ? '93' : '';
    	
    	if( p_cs_code_fr == "" || p_cs_code_to == "" || p_account_code_fr == "" || p_account_code_to == ""){
    		//gfn_comAlert("E0000","거래처 또는 계정과목을 반드시 입력 후 조회해주세요.");
    		return;      		 
    	}
    	if( !p_currenty_code ) {
    		//gfn_comAlert("E0000","통화를 선택해야 합니다.");
    		return;      		 
    	}
    	
        var paramObj = { 
    		V_P_DEBUG_MODE_YN			: ''
    		,V_P_LANG_ID				: ''
    		,V_P_COMP_CODE				: gv_ma_selectedApcCd
    		,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
    	
    		,V_P_FI_ORG_CODE			: p_fi_org_code
    		,V_P_ACCT_RULE_CODE			: p_acct_rule_code
    		,V_P_BASE_DATE     			: p_entry_date_to
    		,V_P_ACCOUNT_CODE_FR 		: p_account_code_fr
    		,V_P_ACCOUNT_CODE_TO		: p_account_code_to
    		,V_P_CS_CODE_FR 			: p_cs_code_fr
    		,V_P_CS_CODE_TO				: p_cs_code_to
    		,V_P_ACCOUNT_CODE_D			: pp_strAccountCodeList
    		,V_P_CS_CODE_D				: pp_strCsCodeList
    		,V_P_ACC_CHARACTER			: p_acc_character
    		,V_P_CURRENCY_CODE			: p_currenty_code
    		,V_P_RULE_CODE				: p_rule_code
    			
    		,V_P_FORM_ID				: p_formId
    		,V_P_MENU_ID				: p_menuId
    		,V_P_PROC_ID				: ''
    		,V_P_USERID					: p_userId
    		,V_P_PC						: '' 
        };		
    	console.log('paramObj:', paramObj);
    	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig2320List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '3',
        	params				: gfnma_objectToString(paramObj)
    	});    	 
        const data = await postJsonPromise;
    	console.log('data:', data);

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.cv_2.length>0){
        			jsonFig2310Edit.length = 0;
                	data.cv_2.forEach((item, index) => {
        				const msg = {
        						ITEM_SEQ				: (index + 1),			
        						ACCT_RULE_CODE			: gfnma_nvl(item.ACCT_RULE_CODE),			
        						CURRENCY_CODE			: gfnma_nvl(item.CURRENCY_CODE),			
        						DOC_TYPE				: gfnma_nvl(item.DOC_TYPE),			
        						MEMO					: gfnma_nvl(item.MEMO),		
        						
        						CHECK_YN				: 'N',
        						LINE_TYPE				: '',
        						DEBIT_CREDIT			: '',
        						CS_CODE					: '',
        						CS_NAME					: '',
        						ACCOUNT_CODE			: '',
        						ACCOUNT_NAME			: '',
        						ORIGINAL_AMT			: '',
        						FUNCTIONAL_AMT			: '',
        						DESCRIPTION				: '',
        						DEPT_NAME				: '',
        						DEPT_CODE				: '',
        						COST_CENTER_CODE		: '',
        						COST_CENTER_NAME		: '',
        						SITE_CODE				: '',
        						PROJECT_CODE			: '',
        						PROJECT_NAME			: '',
        						PAY_TERM_CODE			: '',
        						PAY_TERM_NAME			: '',
        						PAY_METHOD				: '',
        						EXPECTED_PAY_DATE		: '',
        						EXCHANGE_RATE			: '',
        						WITHHOLD_FLAG			: '',
        						WITHHOLD_TAX_TYPE		: '',
        						WITHHOLD_TAX_TYPE_CODE	: '',
        						WITHHOLD_CS_CODE		: '',
        						WITHHOLD_TAX_TYPE2		: '',
        						WITHHOLD_TAX_TYPE2_CODE : '',
        						WITHHOLD_CS_CODE2 		: '',
        						HOLD_REASON 			: '',
        						
        						HOLD_USER 				: '',
        						HOLD_FLAG 				: '',
        						RELEASE_DATE			: '',
        						RELEASE_USER			: '',
        						HOLD_DATE 				: '',
        						PAY_BASE_DATE 			: '',
        						BILL_DUE_DATE 			: '',
        						BILL_DUE_DAY 			: '',
        						BILL_DUE_PAY_DATE 		: '',
        						
        						BASE_SCALE 				: '',
        				}        			
        				jsonFig2310Edit.push(msg);
        			});
                	Fig2310GridEdit.rebuild();
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
     * 반제처리 준비단계
     */
    function fn_confirm() {
    	
    	var p_doc_type 	= gfnma_nvl(SBUxMethod.get('sch-doc-type'));
        if(!p_doc_type){
      		gfn_comAlert("E0000","전표유형을 입력하세요.");
      		return;
        }
        
		var p_currency_code = gfnma_nvl(SBUxMethod.get('sch-currency-code'));
		var p_exchange_rate = gfnma_nvl(SBUxMethod.get('sch-exchange-rate'));
		var p_description 	= gfnma_nvl(SBUxMethod.get('sch-description'));
        
        var iCostCenterCnt 	= 0;
        var iHoldFlagCnt	= 0;
        var p_acc_character = gfnma_nvl(SBUxMethod.get('sch-acc-character'));
        
        if(p_acc_character == 'C'){
        	var prev_cc_code 	= "";
        	var this_cc_code 	= "";
        	var iCount 			= 0;
       		var gridAllList 	= Fig2310GridList.getGridDataAll();
        	for (var i = 0; i < gridAllList.length; i++) {
        		var obj = gridAllList[i];
        		if(obj['CHECK_YN']=='Y'){
        			if(iCount == 0){
                        prev_cc_code = obj["COST_CENTER_CODE"];
        			} else {
                        this_cc_code = obj["COST_CENTER_CODE"];
                        if (prev_cc_code != this_cc_code)
                        {
                            iCostCenterCnt++;
                            prev_cc_code = this_cc_code;
                            break;
                        }
        			}
        			if(obj["HOLD_FLAG"]=='Y'){
                        iHoldFlagCnt++;
                        break;
        			}
                    iCount++;
        		}
                if(iCostCenterCnt > 0){
                    break;
                }
                if (iHoldFlagCnt > 0){
                    break;
                }
			}
        }
        if (iHoldFlagCnt > 0){
      		gfn_comAlert("E0000","보류지정된 거래처 또는 전표가 포함되어있습니다.");
      		return;
        }
        if (iCostCenterCnt > 0){
      		gfn_comAlert("E0000","미수금반제의 경우는 각 전표당 한개의 원가중심점만 등록이 가능합니다.");
      		return;
        } else {
        	
        	jsonTempList 	= [];
            var iSeq 		= 0;
            
       		var editAllList = Fig2310GridEdit.getGridDataAll();
        	for (var i = 0; i < editAllList.length; i++) {
        		var obj = editAllList[i];
        		if(obj['CHECK_YN']=='Y'){
        			iSeq ++;
	        		obj['ITEM_SEQ'] 		= iSeq;
	        		obj['CURRENCY_CODE'] 	= p_currency_code;
	        		obj['EXCHANGE_RATE'] 	= p_exchange_rate;
	        		obj['DESCRIPTION'] 		= p_description;
	        		jsonTempList.push(obj);
        		}
        	}
        	
       		var gridAllList = Fig2310GridList.getGridDataAll();
        	for (var i = 0; i < gridAllList.length; i++) {
        		var obj = editAllList[i];
        		if(obj['CHECK_YN']=='Y'){
        			iSeq ++;
	        		obj['ITEM_SEQ'] 		= iSeq;
	        		obj['CURRENCY_CODE'] 	= p_currency_code;
	        		obj['EXCHANGE_RATE'] 	= p_exchange_rate;
	        		obj['DESCRIPTION'] 		= p_description;
	        		jsonTempList.push(obj);
	        		
	        		for (var key in obj) {
	        			var tmpcol = (key == 'APPLY_ORIGINAL_AMOUNT') ? 'ORIGINAL_AMT' : key;
	        			if(tmpcol == 'APPLY_FUNCTIONAL_AMOUNT') {
	        				tmpcol = 'FUNCTIONAL_AMT';
	        			}
	        			var len = jsonTempList.lengh;
	        			if(jsonTempList[len-1][tmpcol]){
	        				if(key == 'DEBIT_CREDIT'){
	        					if(obj[key] == 'D'){
	        						jsonTempList[len-1][key] = 'C';
	        					} else {
	        						jsonTempList[len-1][key] = 'D';
	        					}
	        				} else if(key == 'LINE_TYPE'){
        						jsonTempList[len-1][key] = '2';
	        				} else {
	        					jsonTempList[len-1][tmpcol] = obj[key];
	        				}
	        			}
	        		}        		
        		}
        	}
        	
        	fn_saveP_FIG2310_S('N', function(ok){
        		
        		if(ok){
	                var p_doc_id = Number(gfnma_nvl(SBUxMethod.get('sch-doc-id')));
	                var reObj = {};
	        		if(p_doc_id > 0){
	        			reObj['DOC_ID'] 		= p_doc_id;
	        			reObj['DOC_NAME'] 		= gfnma_nvl(SBUxMethod.get('sch-doc-name'));
	        			reObj['DOC_BATCH_NO'] 	= gfnma_nvl(SBUxMethod.get('sch-doc-batch-no'));
	         		}
	        		
	        		// 파라미터 전송
	        		
	        		// this.close()
	        		
        		}
        	});
        }
    }  
    
    /**
     * 반제처리 실행
     */
    const fn_saveP_FIG2310_S = async function (wType, callbackFn) {

        var chk_currency_flag = "N";
    	
        if( !wType || wType=='N' || wType=='U' ){
    		
       		var editAllList = Fig2310GridEdit.getGridDataAll();
        	for (var i = 0; i < editAllList.length; i++) {
        		
				var obj = editAllList[i];
				if(Number(obj['ORIGINAL_AMT']) == 0 && obj['LINE_TYPE'] != '5' ){
		      		gfn_comAlert("E0000","금액이 잘못 입력되었습니다. 금액을 확인해 주십시오.");
		      		callbackFn(false);
		      		return;
				}
				if( obj['LINE_TYPE'] != '3' ){
		      		gfn_comAlert("E0000","세금 라인일 경우 부가세 유형은 필수 입니다.");
		      		callbackFn(false);
		      		return;
				}
				if(obj['ACC_CATEGORY'] == 'D' && obj['ACC_CATEGORY'] == 'E' ){
					if(!obj['COST_CENTER_CODE']){
			      		gfn_comAlert("E0000","수익,비용인 경우 원가중심점이 필수 입니다.");
			      		callbackFn(false);
			      		return;
					}
				}
				if( obj['PROJECT_YN'] == 'Y' ){
					if(!obj['PROJECT_CODE']){
			      		gfn_comAlert("E0000","프로젝트는 필수 입니다.");
			      		callbackFn(false);
			      		return;
					}
				}
				if( obj['BASIS_TYPE'] == '5' ){
					if(!obj['EXPECTED_PAY_DATE']){
			      		gfn_comAlert("E0000","지급기일은 필수 입력사항입니다.");
			      		callbackFn(false);
			      		return;
					}
				}
			}
        	
        	fn_SummaryTemp();
        	
            // 차대금액 체크 // 20180119 original 금액만 체크 전표금액은 journalentry_new 프로시저에서 자동 보정
        	for (var i = 0; i < jsonTempList.length; i++) {
        		var obj  = jsonTempList[i];
        		var tmp1 = gfnma_nvl(SBUxMethod.get('sch-currency-code'));
        		//통화가 이종통화로 반제일경우 차대 금액이 안맞아도 
				if(tmp1 == obj['CURRENCY_CODE']){
                	chk_currency_flag = "Y";
				}        		
        	}
        	
            if( chk_currency_flag != 'N' && Number(SBUxMethod.get('sch-numDiffWon')) != 0 ){
	      		gfn_comAlert("E0000","차대금액이 맞지 않습니다. 금액을 확인해 주십시오.");
	      		callbackFn(false);
	      		return;
            }
            
            // 관리항목 필수 체크
	    	for (var i = 0; i < jsonTempList.length; i++) {
				if( Number(obj['ORIGINAL_AMT']) == 0 && obj['LINE_TYPE'] != '5' ){
		      		gfn_comAlert("E0000","금액이 잘못 입력되었습니다. 금액을 확인해 주십시오.");
		      		callbackFn(false);
		      		return;
				}
				if( obj['LINE_TYPE'] == '3' ){
		      		gfn_comAlert("E0000","세금 라인일 경우 부가세 유형은 필수 입니다.");
		      		callbackFn(false);
		      		return;
				}
				if( obj['ACC_CATEGORY'] == 'D' && obj['ACC_CATEGORY'] == 'E' ){
					if( !obj['COST_CENTER_CODE'] ){
			      		gfn_comAlert("E0000","수익,비용인 경우 원가중심점이 필수 입니다.");
			      		callbackFn(false);
			      		return;
					}
				}
				//20161114 프로젝트 필수여부 체크
				if( obj['PROJECT_YN'] == 'Y' ){
					if( !obj['PROJECT_CODE'] ){
			      		gfn_comAlert("E0000","프로젝트는 필수 입니다.");
			      		callbackFn(false);
			      		return;
					}
				}
				//20161114 프로젝트 필수여부 체크
				if( obj['COST_CLASS'] == '1' || obj['COST_CLASS'] == '2' || obj['COST_CLASS'] == '8' || obj['PROJECT_YN'] == 'Y' ){
					if( !obj['COST_CENTER_CODE'] ){
			      		gfn_comAlert("E0000","코스트센터는 필수입력사항 입니다.");
			      		callbackFn(false);
			      		return;
					}
				}
                //20181126 lje 헤더일경우 거래처입력필수 
				if( obj['LINE_TYPE'] == '1' ){
					if( !obj['PAY_TERM_CODE'] ){
			      		gfn_comAlert("E0000","헤더 라인일 경우 거래처는 필수 입니다.");
			      		callbackFn(false);
			      		return;
					}
					if( !obj['CS_CODE'] ){
			      		gfn_comAlert("E0000","헤더 라인일 경우 거래처는 필수 입니다.");
			      		callbackFn(false);
			      		return;
					}
				}
				
                for (var j = 1; j <= 10; j++) {
                	if( obj['ACC_ITEM_YN' + j] == 'Y' && Number(obj['ORIGINAL_AMT']) != 0 ){
                		if( obj['ACC_ITEM_CODE' + j] ){
                    		if( obj['ACC_ITEM_VALUE' + j] ){
        			      		gfn_comAlert("E0000","필수 관리항목을 입력해주십시요.");
        			      		callbackFn(false);
        			      		return;
                    		}
                		}
                	}	
                }
	    	}
            
            var stritem_id 				= "";
            var stritem_seq 			= "";
            var strfi_org_code	 		= "";
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

            //var strtrader_id = "";
            var strcs_code 				= "";
            var strfce_gb 				= "";
            var strcurrency_code 		= "";
            var strexchange_type 		= "";
            var strexchange_rate 		= "";
            //var strpayer_id 			= "";
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

            var stretax_type 				= "";
            var strafter_due_date_yn 		= "";
            var strdup_issue_bill_type 		= "";
            var strexclude_revenue_amt_yn 	= "";
            var strcard_use_type 			= "";
            var strcard_num 				= "";
            var strvat_not_deduction_type 	= "";
            var strreport_omit_yn 			= "";
            var strstandard_date 			= "";
            var strvat_asset_type 			= "";
            var strsupply_amt 				= "";

            var strzero_report_yn_d 		= "";
            var strlocal_credit_type_d 		= "";
            var strdocument_name_d 			= "";
            var strissue_name_d 			= "";
            var strdocument_issue_date_d 	= "";
            var strexport_license_no_d 		= "";
            var strshipping_date_d 			= "";
            var strexport_amt_d 			= "";
            var strexport_amt_krw_d 		= "";
            var strvat_export_amt_d 		= "";
            var strvat_export_amt_krw_d 	= "";
            var strforeign_amt_d 			= "";
            var strwon_amt_d 				= "";
            var strdocument_no_d 			= "";
            var strzero_type_d 				= "";
            var strvat_amt_d 				= "";            
            
	    	for (var i = 0; i < jsonTempList.length; i++) {
	    		var obj = jsonTempList[i];
                stritem_id 				+= obj["ITEM_ID"] + "|";
                stritem_seq 			+= obj["ITEM_SEQ"] + "|";
                strfi_org_code 			+= (obj["FI_ORG_CODE"] == "" ? SBUxMethod.get('sch-fi-org-code') : obj["FI_ORG_CODE"]) + "|";
                strline_type 			+= obj["LINE_TYPE"] + "|";
                straccount_code 		+= obj["ACCOUNT_CODE"] + "|";
                strdebit_credit 		+= obj["DEBIT_CREDIT"] + "|";
                strorigin_dr_amt 		+= (obj["DEBIT_CREDIT"] == "D" ? obj["ORIGINAL_AMT"] : "0.00") + "|";
                strorigin_cr_amt 		+= (obj["DEBIT_CREDIT"] == "C" ? obj["ORIGINAL_AMT"] : "0.00") + "|";
                strfunctional_dr_amt	+= (obj["DEBIT_CREDIT"] == "D" ? obj["FUNCTIONAL_AMT"] : "0") + "|";
                strfunctional_cr_amt 	+= (obj["DEBIT_CREDIT"] == "C" ? obj["FUNCTIONAL_AMT"] : "0") + "|";
                strvat_type 			+= obj["VAT_TYPE"] + "|";

                stritem_code 			+= obj["ITEM_CODE"] + "|";
                struom 					+= obj["UOM"] + "|";
                strtxn_qty 				+= (obj["TXN_QTY"] == "" ? "0" : obj["TXN_QTY"]) + "|";
                strdept_code 			+= obj["DEPT_CODE"] + "|";
                strcost_center_code 	+= obj["COST_CENTER_CODE"] + "|";
                strproject_code 		+= obj["PROJECT_CODE"] + "|";
                strdescription 			+= obj["DESCRIPTION"].replaceAll("|", "_").replaceAll("'", "`") + "|";
                
                stracc_item_code1 		+= obj["ACC_ITEM_CODE1"] + "|";
                strACC_ITEM_CODE2 		+= obj["ACC_ITEM_CODE2"] + "|";
                strACC_ITEM_CODE3 		+= obj["ACC_ITEM_CODE3"] + "|";
                strACC_ITEM_CODE4 		+= obj["ACC_ITEM_CODE4"] + "|";
                strACC_ITEM_CODE5 		+= obj["ACC_ITEM_CODE5"] + "|";
                strACC_ITEM_CODE6 		+= obj["ACC_ITEM_CODE6"] + "|";
                strACC_ITEM_CODE7 		+= obj["ACC_ITEM_CODE7"] + "|";
                strACC_ITEM_CODE8 		+= obj["ACC_ITEM_CODE8"] + "|";
                strACC_ITEM_CODE9 		+= obj["ACC_ITEM_CODE9"] + "|";
                strACC_ITEM_CODE10 		+= obj["ACC_ITEM_CODE10"] + "|";
                
                var slist = fn_stringToRemoveMask(i);
                stracc_item_value1 		+= slist[0];
                stracc_item_value2 		+= slist[1];
                stracc_item_value3 		+= slist[2];
                stracc_item_value4 		+= slist[3];
                stracc_item_value5 		+= slist[4];
                stracc_item_value6 		+= slist[5];
                stracc_item_value7 		+= slist[6];
                stracc_item_value8 		+= slist[7];
                stracc_item_value9 		+= slist[8];
                stracc_item_value10 	+= slist[9];
                
                strACC_VALUE_NAME1 		+= obj["ACC_VALUE_NAME1"] + "|";
                strACC_VALUE_NAME2 		+= obj["ACC_VALUE_NAME2"] + "|";
                strACC_VALUE_NAME3 		+= obj["ACC_VALUE_NAME3"] + "|";
                strACC_VALUE_NAME4 		+= obj["ACC_VALUE_NAME4"] + "|";
                strACC_VALUE_NAME5 		+= obj["ACC_VALUE_NAME5"] + "|";
                strACC_VALUE_NAME6 		+= obj["ACC_VALUE_NAME6"] + "|";
                strACC_VALUE_NAME7 		+= obj["ACC_VALUE_NAME7"] + "|";
                strACC_VALUE_NAME8 		+= obj["ACC_VALUE_NAME8"] + "|";
                strACC_VALUE_NAME9 		+= obj["ACC_VALUE_NAME9"] + "|";
                strACC_VALUE_NAME10 	+= obj["ACC_VALUE_NAME10"] + "|";

                stritem_source_type_d 	 += obj["ITEM_SOURCE_TYPE"] + "|";
                stritem_source_id_d 	 += obj["ITEM_SOURCE_ID"] + "|";
                strsource_record_count_d += obj["SOURCE_RECORD_COUNT"] + "|";
                
                //figdocitem 으로 추가된 필드
                strexpected_pay_date 	+= obj["EXPECTED_PAY_DATE"] + "|";
                strpay_term_code 		+= obj["PAY_TERM_CODE"] + "|";
                strpay_method 			+= obj["PAY_METHOD"] + "|";
                //MessageBox.Show("22");
                strcs_code 				+= obj["CS_CODE"] + "|";
                strfce_gb 				+= "" + "|";
                strcurrency_code 		+= obj["CURRENCY_CODE"] + "|";
                strexchange_type 		+= obj["EXCHANGE_TYPE"] + "|";
                strexchange_rate 		+= obj["EXCHANGE_RATE"] + "|";
                //MessageBox.Show("222");
                strvoucher_type 		+= obj["VOUCHER_TYPE"] + "|";
                strvoucher_no 			+= obj["VOUCHER_NO"] + "|";
                strpayee_code 			+= obj["PAYEE_CODE"] + "|";
                strcard_no 				+= obj["CARD_NO"] + "|";
                strvoucher_receipt_date += obj["VOUCHER_RECEIPT_DATE"] + "|";
              	//MessageBox.Show("88-2");
                strwithhold_flag 		+= obj["WITHHOLD_FLAG"] + "|";
                strwithhold_tax_type 	+= obj["WITHHOLD_TAX_TYPE"] + "|";
                strwithhold_cs_code 	+= obj["WITHHOLD_CS_CODE"] + "|";
                strwithhold_tax_type2	+= obj["WITHHOLD_TAX_TYPE2"] + "|";
                strwithhold_cs_code2 	+= obj["WITHHOLD_CS_CODE2"] + "|";
                strsite_code 			+= (obj["SITE_CODE"] == "" ? p_ss_siteCode : obj["SITE_CODE"]) + "|";
                strcredit_area 			+= obj["CREDIT_AREA"] + "|";
                strsales_person 		+= obj["SALES_PERSON"] + "|";
                strpo_line_no 			+= obj["PO_LINE_NO"] + "|";
                strsales_cs_code 		+= obj["SALES_CS_CODE"] + "|";
                strapply_complete_flag 	+= obj["APPLY_COMPLETE_FLAG"] + "|";
                strapply_complete_date 	+= obj["APPLY_COMPLETE_DATE"] + "|";
                
                strhold_flag 			+= (!obj["HOLD_FLAG"]) ? "N" : obj["HOLD_FLAG"] + "|";
                strrelease_date 		+= obj["RELEASE_DATE"] + "|";
                strrelease_user 		+= obj["RELEASE_USER"] + "|";
                strhold_date 			+= obj["HOLD_DATE"] + "|";
                strhold_user 			+= obj["HOLD_USER"] + "|";
                strhold_reason 			+= obj["HOLD_REASON"] + "|";
                strpay_base_date 		+= (obj["LINE_TYPE"] == "1" ? obj["PAY_BASE_DATE"] : "") + "|";
                strbill_due_date 		+= obj["BILL_DUE_DATE"] + "|";
                strbill_due_day 		+= obj["BILL_DUE_DAY"] + "|";
                strbill_due_pay_date 	+= obj["BILL_DUE_PAY_DATE"] + "|";
                strpay_term_orig 		+= (obj["LINE_TYPE"] == "1" ? obj["PAY_TERM_CODE"] : "") + "|";
                strprod_group 			+= obj["PROD_GROUP"] + "|";
                strbank_account_seq 	+= obj["BANK_ACCOUNT_SEQ"] + "|";
                // MessageBox.Show("88-3");
                
                strsum_acc_item1 			+= "" + "|";
                strsum_acc_value1 			+= "" + "|";
                strsum_acc_item2			+= "" + "|";
                strsum_acc_value2 			+= "" + "|";
                
                stretax_type 				+= obj["ETAX_TYPE"] + "|";
                strafter_due_date_yn 		+= obj["AFTER_DUE_DATE_YN"] + "|";
                strdup_issue_bill_type 		+= obj["DUP_ISSUE_BILL_TYPE"] + "|";
                strexclude_revenue_amt_yn 	+= obj["EXCLUDE_REVENUE_AMT_YN"] + "|";
                strcard_use_type 			+= obj["CARD_USE_TYPE"] + "|";
                strcard_num 				+= obj["CARD_NUM"] + "|";
                strvat_not_deduction_type 	+= obj["VAT_NOT_DEDUCTION_TYPE"] + "|";
                strreport_omit_yn 			+= obj["REPORT_OMIT_YN"] + "|";
                strstandard_date 			+= obj["STANDARD_DATE"] + "|";
                strvat_asset_type 			+= obj["VAT_ASSET_TYPE"] + "|";
                strsupply_amt 				+= obj["SUPPLY_AMT"] + "|";
              	//  MessageBox.Show("88-4");
             
                strzero_report_yn_d 		+= obj["ZERO_REPORT_YN"] + "|";
                strlocal_credit_type_d 		+= obj["LOCAL_CREDIT_TYPE"] + "|";
                strdocument_name_d 			+= obj["DOCUMENT_NAME"] + "|";
                strissue_name_d 			+= obj["ISSUE_NAME"] + "|";
               	// MessageBox.Show("89");
                strdocument_issue_date_d	+= obj["DOCUMENT_ISSUE_DATE"] + "|";
                strexport_license_no_d 		+= obj["EXPORT_LICENSE_NO"] + "|";
                strshipping_date_d 			+= obj["SHIPPING_DATE"] + "|";
                strexport_amt_d 			+= obj["EXPORT_AMT"] + "|";
                strexport_amt_krw_d 		+= obj["EXPORT_AMT_KRW"] + "|";
                strvat_export_amt_d 		+= obj["VAT_EXPORT_AMT"] + "|";
                strvat_export_amt_krw_d 	+= obj["VAT_EXPORT_AMT_KRW"] + "|";
                //MessageBox.Show("99");
                strforeign_amt_d 			+= obj["FOREIGN_AMT"] + "|";
                strwon_amt_d 				+= obj["WON_AMT"] + "|";
                strdocument_no_d 			+= obj["DOCUMENT_NO"] + "|";
                strzero_type_d 				+= obj["ZERO_TYPE"] + "|";
                strvat_amt_d 				+= obj["VAT_AMT"] + "|";
                //SetMessageBox("99");
	    	}
        	
			if(jsonTempList.length > 0){
				
                stritem_seq 			= stritem_seq.slice(0, -1);
                strfi_org_code 			= strfi_org_code.slice(0, -1);
                strline_type 			= strline_type.slice(0, -1);
                straccount_code 		= straccount_code.slice(0, -1);
                strdebit_credit 		= strdebit_credit.slice(0, -1);
                strorigin_dr_amt 		= strorigin_dr_amt.slice(0, -1);
                strorigin_cr_amt 		= strorigin_cr_amt.slice(0, -1);
                strfunctional_dr_amt 	= strfunctional_dr_amt.slice(0, -1);
                strfunctional_cr_amt 	= strfunctional_cr_amt.slice(0, -1);
                strvat_type 			= strvat_type.slice(0, -1);

                stritem_code 			= stritem_code.slice(0, -1);
                struom 					= struom.slice(0, -1);
                strtxn_qty 				= strtxn_qty.slice(0, -1);
                strdept_code 			= strdept_code.slice(0, -1);
                strcost_center_code 	= strcost_center_code.slice(0, -1);
                strproject_code 		= strproject_code.slice(0, -1);
                strdescription 			= strdescription.slice(0, -1);

                stracc_item_code1 		= stracc_item_code1.slice(0, -1);
                stracc_item_value1 		= stracc_item_value1.slice(0, -1);
                stracc_item_code2 		= stracc_item_code2.slice(0, -1);
                stracc_item_value2 		= stracc_item_value2.slice(0, -1);
                stracc_item_code3 		= stracc_item_code3.slice(0, -1);
                stracc_item_value3 		= stracc_item_value3.slice(0, -1);
                stracc_item_code4 		= stracc_item_code4.slice(0, -1);
                stracc_item_value4 		= stracc_item_value4.slice(0, -1);
                stracc_item_code5 		= stracc_item_code5.slice(0, -1);
                stracc_item_value5 		= stracc_item_value5.slice(0, -1);
                stracc_item_code6 		= stracc_item_code6.slice(0, -1);
                stracc_item_value6 		= stracc_item_value6.slice(0, -1);
                stracc_item_code7 		= stracc_item_code7.slice(0, -1);
                stracc_item_value7 		= stracc_item_value7.slice(0, -1);
                stracc_item_code8 		= stracc_item_code8.slice(0, -1);
                stracc_item_value8 		= stracc_item_value8.slice(0, -1);

                stracc_item_code9 		= stracc_item_code9.slice(0, -1);
                stracc_item_value9 		= stracc_item_value9.slice(0, -1);
                stracc_item_code10 		= stracc_item_code10.slice(0, -1);
                stracc_item_value10 	= stracc_item_value10.slice(0, -1);


                stracc_value_name1 		= stracc_value_name1.slice(0, -1);
                stracc_value_name2 		= stracc_value_name2.slice(0, -1);
                stracc_value_name3 		= stracc_value_name3.slice(0, -1);
                stracc_value_name4 		= stracc_value_name4.slice(0, -1);
                stracc_value_name5 		= stracc_value_name5.slice(0, -1);
                stracc_value_name6 		= stracc_value_name6.slice(0, -1);
                stracc_value_name7 		= stracc_value_name7.slice(0, -1);
                stracc_value_name8 		= stracc_value_name8.slice(0, -1);
                stracc_value_name9 		= stracc_value_name9.slice(0, -1);
                stracc_value_name10 		= stracc_value_name10.slice(0, -1);

                stritem_source_type_d 	= stritem_source_type_d.slice(0, -1);
                stritem_source_id_d 	= stritem_source_id_d.slice(0, -1);
                strsource_record_count_d = strsource_record_count_d.slice(0, -1);

                strexpected_pay_date 	= strexpected_pay_date.slice(0, -1);
                strpay_term_code 		= strpay_term_code.slice(0, -1);
                strpay_method 			= strpay_method.slice(0, -1);
                strcs_code 				= strcs_code.slice(0, -1);

                strfce_gb 				= strfce_gb.slice(0, -1);
                strcurrency_code 		= strcurrency_code.slice(0, -1);
                strexchange_type 		= strexchange_type.slice(0, -1);
                strexchange_rate 		= strexchange_rate.slice(0, -1);
                strvoucher_type 		= strvoucher_type.slice(0, -1);
                strvoucher_no 			= strvoucher_no.slice(0, -1);
                strpayee_code 			= strpayee_code.slice(0, -1);
                strcard_no 				= strcard_no.slice(0, -1);
                strvoucher_receipt_date = strvoucher_receipt_date.slice(0, -1);
                strwithhold_flag 		= strwithhold_flag.slice(0, -1);
                strwithhold_tax_type 	= strwithhold_tax_type.slice(0, -1);
                strwithhold_cs_code 	= strwithhold_cs_code.slice(0, -1);
                strwithhold_tax_type2 	= strwithhold_tax_type2.slice(0, -1);
                strwithhold_cs_code2 	= strwithhold_cs_code2.slice(0, -1);
                strsite_code 			= strsite_code.slice(0, -1);
                strcredit_area 			= strcredit_area.slice(0, -1);
                strsales_person 		= strsales_person.slice(0, -1);
                strpo_line_no 			= strpo_line_no.slice(0, -1);
                strsales_cs_code 		= strsales_cs_code.slice(0, -1);
                strapply_complete_flag 	= strapply_complete_flag.slice(0, -1);
                strapply_complete_date 	= strapply_complete_date.slice(0, -1);

                strhold_flag 			= strhold_flag.slice(0, -1);
                strrelease_date 		= strrelease_date.slice(0, -1);
                strrelease_user 		= strrelease_user.slice(0, -1);
                strhold_date 			= strhold_date.slice(0, -1);
                strhold_user 			= strhold_user.slice(0, -1);
                strhold_reason 			= strhold_reason.slice(0, -1);
                strpay_base_date 		= strpay_base_date.slice(0, -1);
                strbill_due_date 		= strbill_due_date.slice(0, -1);
                strbill_due_day 		= strbill_due_day.slice(0, -1);
                strbill_due_pay_date 	= strbill_due_pay_date.slice(0, -1);
                strpay_term_orig 		= strpay_term_orig.slice(0, -1);
                strprod_group 			= strprod_group.slice(0, -1);
                strbank_account_seq 	= strbank_account_seq.slice(0, -1);

                strsum_acc_item1 		= strsum_acc_item1.slice(0, -1);
                strsum_acc_value1 		= strsum_acc_value1.slice(0, -1);
                strsum_acc_item2 		= strsum_acc_item2.slice(0, -1);
                strsum_acc_value2 		= strsum_acc_value2.slice(0, -1);

                stretax_type 			= stretax_type.slice(0, -1);
                strafter_due_date_yn 	= strafter_due_date_yn.slice(0, -1);
                strdup_issue_bill_type 	= strdup_issue_bill_type.slice(0, -1);
                strexclude_revenue_amt_yn = strexclude_revenue_amt_yn.slice(0, -1);
                strcard_use_type 		= strcard_use_type.slice(0, -1);
                strcard_num 			= strcard_num.slice(0, -1);
                strvat_not_deduction_type = strvat_not_deduction_type.slice(0, -1);
                strreport_omit_yn 		= strreport_omit_yn.slice(0, -1);
                strstandard_date 		= strstandard_date.slice(0, -1);
                strvat_asset_type 		= strvat_asset_type.slice(0, -1);
                strsupply_amt 			= strsupply_amt.slice(0, -1);

                strzero_report_yn_d 	= strzero_report_yn_d.slice(0, -1);
                strlocal_credit_type_d 	= strlocal_credit_type_d.slice(0, -1);
                strdocument_name_d 		= strdocument_name_d.slice(0, -1);
                strissue_name_d 		= strissue_name_d.slice(0, -1);
                strdocument_issue_date_d = strdocument_issue_date_d.slice(0, -1);
                strexport_license_no_d 	= strexport_license_no_d.slice(0, -1);
                strshipping_date_d 		= strshipping_date_d.slice(0, -1);
                strexport_amt_d 		= strexport_amt_d.slice(0, -1);
                strexport_amt_krw_d 	= strexport_amt_krw_d.slice(0, -1);
                strvat_export_amt_d 	= strvat_export_amt_d.slice(0, -1);
                strvat_export_amt_krw_d = strvat_export_amt_krw_d.slice(0, -1);
                strforeign_amt_d 		= strforeign_amt_d.slice(0, -1);
                strwon_amt_d 			= strwon_amt_d.slice(0, -1);
                strdocument_no_d 		= strdocument_no_d.slice(0, -1);
                strzero_type_d 			= strzero_type_d.slice(0, -1);
                strvat_amt_d 			= strvat_amt_d.slice(0, -1);				
			}
	    	
        	var paramObj = {
            	V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
				IV_P_DOC_BATCH_NO  			: gfnma_nvl(SBUxMethod.get('sch-doc-batch-no')),
				V_P_DOC_ID         			: gfnma_nvl(SBUxMethod.get('sch-doc-id')),
				V_P_SOURCE_ID      			: '0',
				V_P_ACCT_RULE_CODE 			: gfnma_nvl(SBUxMethod.get('sch-acct-rule-code')),
				V_P_HOLD_FLAG      			: '',
				V_P_FI_ORG_CODE    			: gfnma_nvl(SBUxMethod.get('sch-fi-org-code')),
				V_P_DOC_DATE       			: gfnma_date7(gfnma_nvl(SBUxMethod.get('sch-entry-date-to'))),
				V_P_WRITE_DATE     			: '',
				V_P_APPROVE_DATE   			: '',
				V_P_DOC_NUM        			: '0',
				V_P_DOC_NAME       			: gfnma_nvl(SBUxMethod.get('sch-doc-name')),
				V_P_SITE_CODE      			: p_ss_siteCode,
				V_P_DOC_TYPE       			: gfnma_nvl(SBUxMethod.get('sch-doc-type')),
				V_P_DEPT_CODE      			: p_ss_deptCode,
				V_P_ENTRY_PATH     			: 'FI100',
				V_P_DOC_AMT        			: '0',
				V_P_DOC_STATUS     			: '1',
				V_P_SOURCE_TYPE    			: 'MANUAL',
				V_P_CURRENCY_CODE  			: gfnma_nvl(SBUxMethod.get('sch-currency-code')),
				V_P_EXCHANGE_TYPE  			: '',
				V_P_EXCHANGE_RATE  			: gfnma_nvl(SBUxMethod.get('sch-exchange-rate')),
				V_P_DESCRIPTION    			: gfnma_nvl(SBUxMethod.get('sch-description')),
				V_P_ACCT_OPINION      		: '',
				V_P_TR_OPINION        		: '',
				V_P_SOURCE_DOC        		: 'MANUAL',
				V_P_TAX_SITE_CODE     		: 'T02', 
				V_P_SUB_TAX_SITE_CODE 		: 'T02', 
				V_P_ITEM_ID_D               : stritem_id,
				V_P_ITEM_SEQ_D              : stritem_seq,
				V_P_FI_ORG_CODE_D           : strfi_org_code,
				V_P_LINE_TYPE_D            	: strline_type,
				V_P_ACCOUNT_CODE_D          : straccount_code,
				V_P_DEBIT_CREDIT_D          : strdebit_credit,
				V_P_ORIGINAL_DR_AMT_D       : strorigin_dr_amt,
				V_P_ORIGINAL_CR_AMT_D       : strorigin_cr_amt,
				V_P_FUNCTIONAL_DR_AMT_D     : strfunctional_dr_amt,
				V_P_FUNCTIONAL_CR_AMT_D     : strfunctional_cr_amt,
				V_P_VAT_TYPE_D              : strvat_type,
				V_P_ITEM_CODE_D             : stritem_code,
				V_P_UOM_D                   : struom,
				V_P_TXN_QTY_D               : strtxn_qty,
				V_P_DEPT_CODE_D             : strdept_code,
				V_P_COST_CENTER_CODE_D      : strcost_center_code,
				V_P_PROJECT_CODE_D          : strproject_code,
				V_P_DESCRIPTION_D           : strdescription,
				V_P_ACC_ITEM_CODE1_D        : stracc_item_code1,
				V_P_ACC_ITEM_VALUE1_D       : stracc_item_value1,
				V_P_ACC_ITEM_CODE2_D        : stracc_item_code2,
				V_P_ACC_ITEM_VALUE2_D       : stracc_item_value2,
				V_P_ACC_ITEM_CODE3_D        : stracc_item_code3,
				V_P_ACC_ITEM_VALUE3_D       : stracc_item_value3,
				V_P_ACC_ITEM_CODE4_D        : stracc_item_code4,
				V_P_ACC_ITEM_VALUE4_D       : stracc_item_value4,
				V_P_ACC_ITEM_CODE5_D        : stracc_item_code5,
				V_P_ACC_ITEM_VALUE5_D       : stracc_item_value5,
				V_P_ACC_ITEM_CODE6_D        : stracc_item_code6,
				V_P_ACC_ITEM_VALUE6_D       : stracc_item_value6,
				V_P_ACC_ITEM_CODE7_D        : stracc_item_code7,
				V_P_ACC_ITEM_VALUE7_D       : stracc_item_value7,
				V_P_ACC_ITEM_CODE8_D        : stracc_item_code8,
				V_P_ACC_ITEM_VALUE8_D       : stracc_item_value8,
				V_P_ACC_ITEM_CODE9_D        : stracc_item_code9,
				V_P_ACC_ITEM_VALUE9_D       : stracc_item_value9,
				V_P_ACC_ITEM_CODE10_D       : stracc_item_code10,
				V_P_ACC_ITEM_VALUE10_D      : stracc_item_value10,
				V_P_ACC_ITEM_VALUE_NAME1_D  : stracc_value_name1,
				V_P_ACC_ITEM_VALUE_NAME2_D  : stracc_value_name2,
				V_P_ACC_ITEM_VALUE_NAME3_D  : stracc_value_name3,
				V_P_ACC_ITEM_VALUE_NAME4_D  : stracc_value_name4,
				V_P_ACC_ITEM_VALUE_NAME5_D  : stracc_value_name5,
				V_P_ACC_ITEM_VALUE_NAME6_D  : stracc_value_name6,
				V_P_ACC_ITEM_VALUE_NAME7_D  : stracc_value_name7,
				V_P_ACC_ITEM_VALUE_NAME8_D  : stracc_value_name8,
				V_P_ACC_ITEM_VALUE_NAME9_D  : stracc_value_name9,
				V_P_ACC_ITEM_VALUE_NAME10_D : stracc_value_name10,
				V_P_ITEM_SOURCE_TYPE_D      : stritem_source_type_d, 
				V_P_ITEM_SOURCE_ID_D        : stritem_source_id_d, 
				V_P_SOURCE_RECORD_COUNT_D   : strsource_record_count_d, 
				V_P_EXPECTED_PAY_DATE_D 	: strexpected_pay_date, 
				V_P_PAY_TERM_CODE_D     	: strpay_term_code, 
				V_P_PAY_METHOD_D        	: strpay_method, 
				V_P_CS_CODE_D           	: strcs_code, 
				V_P_FCE_GB_D        		: strfce_gb, 
				V_P_CURRENCY_CODE_D 		: strcurrency_code, 
				V_P_EXCHANGE_TYPE_D 		: strexchange_type, 
				V_P_EXCHANGE_RATE_D 		: strexchange_rate, 
				V_P_VOUCHER_TYPE_D         	: strvoucher_type, 
				V_P_VOUCHER_NO_D           	: strvoucher_no, 
				V_P_PAYEE_CODE_D           	: strpayee_code, 
				V_P_CARD_NO_D              	: strcard_no, 
				V_P_VOUCHER_RECEIPT_DATE_D 	: strvoucher_receipt_date, 
				V_P_WITHHOLD_FLAG_D        	: strwithhold_flag, 
				V_P_WITHHOLD_TAX_TYPE_D    	: strwithhold_tax_type, 
				V_P_WITHHOLD_CS_CODE_D     	: strwithhold_cs_code, 
				V_P_WITHHOLD_TAX_TYPE2_D   	: strwithhold_tax_type2, 
				V_P_WITHHOLD_CS_CODE2_D    	: strwithhold_cs_code2, 
				V_P_SITE_CODE_D            	: strsite_code, 
				V_P_CREDIT_AREA_D          	: strcredit_area, 
				V_P_SALES_PERSON_D         	: strsales_person, 
				V_P_PO_LINE_NO_D           	: strpo_line_no, 
				V_P_SALES_CS_CODE_D        	: strsales_cs_code, 
				V_P_APPLY_COMPLETE_FLAG_D  	: strapply_complete_flag, 
				V_P_APPLY_COMPLETE_DATE_D  	: strapply_complete_date, 
				V_P_HOLD_FLAG_D         	: strhold_flag, 
				V_P_RELEASE_DATE_D      	: strrelease_date, 
				V_P_RELEASE_USER_D      	: strrelease_user, 
				V_P_HOLD_DATE_D         	: strhold_date, 
				V_P_HOLD_USER_D         	: strhold_user,  
				V_P_HOLD_REASON_D      	 	: strhold_reason, 
				V_P_PAY_BASE_DATE_D     	: strpay_base_date, 
				V_P_BILL_DUE_DATE_D     	: strbill_due_date, 
				V_P_BILL_DUE_DAY_D      	: strbill_due_day, 
				V_P_BILL_DUE_PAY_DATE_D 	: strbill_due_pay_date, 
				V_P_PAY_TERM_ORIG_D     	: strpay_term_orig, 
				V_P_PROD_GROUP_D        	: strprod_group, 
				V_P_BANK_ACCOUNT_SEQ_D 		: strbank_account_seq, 
				V_P_ETAX_TYPE_D            	: stretax_type, 
				V_P_AFTER_DUE_DATE_YN_D     : strafter_due_date_yn, 
				V_P_DUP_ISSUE_BILL_TYPE_D   : strdup_issue_bill_type, 
				V_P_EXCLUDE_REVENUE_AMT_YN_D : strexclude_revenue_amt_yn, 
				V_P_CARD_USE_TYPE_D         : strcard_use_type, 
				V_P_CARD_NUM_D              : strcard_num, 
				V_P_VAT_NOT_DEDUCTION_TYPE_D : strvat_not_deduction_type, 
				V_P_REPORT_OMIT_YN_D        : strreport_omit_yn, 
				V_P_STANDARD_DATE_D         : strstandard_date, 
				V_P_VAT_ASSET_TYPE_D        : strvat_asset_type, 
				V_P_SUPPLY_AMT_D            : strsupply_amt, 
				V_P_ZERO_REPORT_YN_D     	: strzero_report_yn_d, 
				V_P_LOCAL_CREDIT_TYPE_D   	: strlocal_credit_type_d, 
				V_P_DOCUMENT_NAME_D       	: strdocument_name_d, 
				V_P_ISSUE_NAME_D          	: strissue_name_d, 
				V_P_DOCUMENT_ISSUE_DATE_D 	: strdocument_issue_date_d, 
				V_P_EXPORT_LICENSE_NO_D   	: strexport_license_no_d, 
				V_P_SHIPPING_DATE_D       	: strshipping_date_d, 
				V_P_EXPORT_AMT_D            : strexport_amt_d, 
				V_P_EXPORT_AMT_KRW_D      	: strexport_amt_krw_d, 
				V_P_VAT_EXPORT_AMT_D      	: strvat_export_amt_d, 
				V_P_VAT_EXPORT_AMT_KRW_D  	: strvat_export_amt_krw_d, 
				V_P_FOREIGN_AMT_D         	: strforeign_amt_d, 
				V_P_WON_AMT_D             	: strwon_amt_d, 
				V_P_DOCUMENT_NO_D         	: strdocument_no_d, 
				V_P_ZERO_TYPE_D           	: strzero_type_d, 
				V_P_VAT_AMT_D             	: strvat_amt_d,
				V_P_CONFIRM_EMP_CODE 		: '',
                
                V_P_FORM_ID			: p_formId,
                V_P_MENU_ID			: p_menuId,
                V_P_PROC_ID			: '',
                V_P_USERID			: '',
                V_P_PC				: ''
             };

            const postJsonPromise = gfn_postJSON("/fi/fgl/jor/insertFig2310.do", {
            	getType		: 'json',
                workType	: wType,
                cv_count	: '0',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;
            console.log('data:', data);

            try {
            	if (_.isEqual("S", data.resultStatus)) {
                	return true;
                } else {
                    alert(data.resultMessage);
                 	return false;
                }
            } catch (e) {
                if(!(e instanceof Error)) {
                	e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }    		
    		
    	} else if (wType == "D" || wType == "CONFIRM" || wType == "REJECT" || wType == "END" || wType == "CANCEL"){
    		
        	var paramObj = {
               	V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                   
   				IV_P_DOC_BATCH_NO  			: '',
   				V_P_DOC_ID         			: '0',
   				V_P_SOURCE_ID      			: '0',
   				V_P_ACCT_RULE_CODE 			: gfnma_nvl(SBUxMethod.get('sch-acct-rule-code')),
   				V_P_HOLD_FLAG      			: '',
   				V_P_FI_ORG_CODE    			: gfnma_nvl(SBUxMethod.get('sch-fi-org-code')),
   				V_P_DOC_DATE       			: gfnma_date7(gfnma_nvl(SBUxMethod.get('sch-entry-date-to'))),
   				V_P_WRITE_DATE     			: '',
   				V_P_APPROVE_DATE   			: '',
   				V_P_DOC_NUM        			: '0',
   				V_P_DOC_NAME       			: gfnma_nvl(SBUxMethod.get('sch-description')),
   				V_P_SITE_CODE      			: p_ss_siteCode,
   				V_P_DOC_TYPE       			: gfnma_nvl(SBUxMethod.get('sch-doc-type')),
   				V_P_DEPT_CODE      			: p_ss_deptCode,
   				V_P_ENTRY_PATH     			: 'FI100',
   				V_P_DOC_AMT        			: '0',
   				V_P_DOC_STATUS     			: '',
   				V_P_SOURCE_TYPE    			: '',
   				V_P_CURRENCY_CODE  			: gfnma_nvl(SBUxMethod.get('sch-currency-code')),
   				V_P_EXCHANGE_TYPE  			: '',
   				V_P_EXCHANGE_RATE  			: gfnma_nvl(SBUxMethod.get('sch-exchange-rate')),
   				V_P_DESCRIPTION    			: gfnma_nvl(SBUxMethod.get('sch-description')),
   				V_P_ACCT_OPINION      		: '',
   				V_P_TR_OPINION        		: '',
   				V_P_SOURCE_DOC        		: '',
   				V_P_TAX_SITE_CODE     		: '', 
   				V_P_SUB_TAX_SITE_CODE 		: '', 
   				V_P_ITEM_ID_D               : '',
   				V_P_ITEM_SEQ_D              : '',
   				V_P_FI_ORG_CODE_D           : '',
   				V_P_LINE_TYPE_D            	: '',
   				V_P_ACCOUNT_CODE_D          : '',
   				V_P_DEBIT_CREDIT_D          : '',
   				V_P_ORIGINAL_DR_AMT_D       : '',
   				V_P_ORIGINAL_CR_AMT_D       : '',
   				V_P_FUNCTIONAL_DR_AMT_D     : '',
   				V_P_FUNCTIONAL_CR_AMT_D     : '',
   				V_P_VAT_TYPE_D              : '',
   				V_P_ITEM_CODE_D             : '',
   				V_P_UOM_D                   : '',
   				V_P_TXN_QTY_D               : '',
   				V_P_DEPT_CODE_D             : '',
   				V_P_COST_CENTER_CODE_D      : '',
   				V_P_PROJECT_CODE_D          : '',
   				V_P_DESCRIPTION_D           : '',
   				V_P_ACC_ITEM_CODE1_D        : '',
   				V_P_ACC_ITEM_VALUE1_D       : '',
   				V_P_ACC_ITEM_CODE2_D        : '',
   				V_P_ACC_ITEM_VALUE2_D       : '',
   				V_P_ACC_ITEM_CODE3_D        : '',
   				V_P_ACC_ITEM_VALUE3_D       : '',
   				V_P_ACC_ITEM_CODE4_D        : '',
   				V_P_ACC_ITEM_VALUE4_D       : '',
   				V_P_ACC_ITEM_CODE5_D        : '',
   				V_P_ACC_ITEM_VALUE5_D       : '',
   				V_P_ACC_ITEM_CODE6_D        : '',
   				V_P_ACC_ITEM_VALUE6_D       : '',
   				V_P_ACC_ITEM_CODE7_D        : '',
   				V_P_ACC_ITEM_VALUE7_D       : '',
   				V_P_ACC_ITEM_CODE8_D        : '',
   				V_P_ACC_ITEM_VALUE8_D       : '',
   				V_P_ACC_ITEM_CODE9_D        : '',
   				V_P_ACC_ITEM_VALUE9_D       : '',
   				V_P_ACC_ITEM_CODE10_D       : '',
   				V_P_ACC_ITEM_VALUE10_D      : '',
   				V_P_ACC_ITEM_VALUE_NAME1_D  : '',
   				V_P_ACC_ITEM_VALUE_NAME2_D  : '',
   				V_P_ACC_ITEM_VALUE_NAME3_D  : '',
   				V_P_ACC_ITEM_VALUE_NAME4_D  : '',
   				V_P_ACC_ITEM_VALUE_NAME5_D  : '',
   				V_P_ACC_ITEM_VALUE_NAME6_D  : '',
   				V_P_ACC_ITEM_VALUE_NAME7_D  : '',
   				V_P_ACC_ITEM_VALUE_NAME8_D  : '',
   				V_P_ACC_ITEM_VALUE_NAME9_D  : '',
   				V_P_ACC_ITEM_VALUE_NAME10_D : '',
   				V_P_ITEM_SOURCE_TYPE_D      : '',
   				V_P_ITEM_SOURCE_ID_D        : '',
   				V_P_SOURCE_RECORD_COUNT_D   : '',
   				V_P_EXPECTED_PAY_DATE_D 	: '',
   				V_P_PAY_TERM_CODE_D     	: '',
   				V_P_PAY_METHOD_D        	: '',
   				V_P_CS_CODE_D           	: '',
   				V_P_FCE_GB_D        		: '',
   				V_P_CURRENCY_CODE_D 		: '',
   				V_P_EXCHANGE_TYPE_D 		: '',
   				V_P_EXCHANGE_RATE_D 		: '',
   				V_P_VOUCHER_TYPE_D         	: '',
   				V_P_VOUCHER_NO_D           	: '',
   				V_P_PAYEE_CODE_D           	: '',
   				V_P_CARD_NO_D              	: '',
   				V_P_VOUCHER_RECEIPT_DATE_D 	: '',
   				V_P_WITHHOLD_FLAG_D        	: '',
   				V_P_WITHHOLD_TAX_TYPE_D    	: '',
   				V_P_WITHHOLD_CS_CODE_D     	: '',
   				V_P_WITHHOLD_TAX_TYPE2_D   	: '',
   				V_P_WITHHOLD_CS_CODE2_D    	: '',
   				V_P_SITE_CODE_D            	: '',
   				V_P_CREDIT_AREA_D          	: '',
   				V_P_SALES_PERSON_D         	: '',
   				V_P_PO_LINE_NO_D           	: '',
   				V_P_SALES_CS_CODE_D        	: '',
   				V_P_APPLY_COMPLETE_FLAG_D  	: '',
   				V_P_APPLY_COMPLETE_DATE_D  	: '',
   				
   				V_P_HOLD_FLAG_D         	: '',
   				V_P_RELEASE_DATE_D      	: '',
   				V_P_RELEASE_USER_D      	: '',
   				V_P_HOLD_DATE_D         	: '',
   				V_P_HOLD_USER_D         	: '',
   				V_P_HOLD_REASON_D      	 	: '',
   				V_P_PAY_BASE_DATE_D     	: '',
   				V_P_BILL_DUE_DATE_D     	: '',
   				V_P_BILL_DUE_DAY_D      	: '',
   				V_P_BILL_DUE_PAY_DATE_D 	: '',
   				V_P_PAY_TERM_ORIG_D     	: '',
   				V_P_PROD_GROUP_D        	: '',
   				V_P_BANK_ACCOUNT_SEQ_D 		: '',
   				V_P_ETAX_TYPE_D            	: '',
   				V_P_AFTER_DUE_DATE_YN_D     : '',
   				V_P_DUP_ISSUE_BILL_TYPE_D   : '',
   				V_P_EXCLUDE_REVENUE_AMT_YN_D : '', 
   				V_P_CARD_USE_TYPE_D         : '', 
   				V_P_CARD_NUM_D              : '', 
   				V_P_VAT_NOT_DEDUCTION_TYPE_D : '', 
   				V_P_REPORT_OMIT_YN_D        : '',
   				V_P_STANDARD_DATE_D         : '',
   				V_P_VAT_ASSET_TYPE_D        : '',
   				V_P_SUPPLY_AMT_D            : '',
   				V_P_ZERO_REPORT_YN_D     	: '',
   				V_P_LOCAL_CREDIT_TYPE_D   	: '',
   				V_P_DOCUMENT_NAME_D       	: '',
   				V_P_ISSUE_NAME_D          	: '',
   				V_P_DOCUMENT_ISSUE_DATE_D 	: '',
   				V_P_EXPORT_LICENSE_NO_D   	: '',
   				V_P_SHIPPING_DATE_D       	: '',
   				V_P_EXPORT_AMT_D            : '',
   				V_P_EXPORT_AMT_KRW_D      	: '',
   				V_P_VAT_EXPORT_AMT_D      	: '',
   				V_P_VAT_EXPORT_AMT_KRW_D  	: '',
   				V_P_FOREIGN_AMT_D         	: '',
   				V_P_WON_AMT_D             	: '',
   				V_P_DOCUMENT_NO_D         	: '',
   				V_P_ZERO_TYPE_D           	: '',
   				V_P_VAT_AMT_D             	: '',
   				V_P_CONFIRM_EMP_CODE 		: p_ss_empCode,
                   
                V_P_FORM_ID			: p_formId,
                V_P_MENU_ID			: p_menuId,
                V_P_PROC_ID			: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };

            const postJsonPromise = gfn_postJSON("/fi/fgl/jor/insertFig2310.do", {
            	getType		: 'json',
                workType	: wType,
                cv_count	: '0',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;
            console.log('data:', data);

            try {
            	if (_.isEqual("S", data.resultStatus)) {
                	return true;
                } else {
                    alert(data.resultMessage);
                 	return false;
                }
            } catch (e) {
                if(!(e instanceof Error)) {
                	e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }       		
    		
    	}
    }       
    
    /**
     * 문자 추출
     */
	function fn_stringToRemoveMask(iRow) {
    	
    	var rlist = [];
        for (var i = 1; i <= 10; i++){
        	if( jsonTempList[iRow]['DATA_TYPE'+i] && jsonTempList[iRow]['ACC_ITEM_VALUE'+i] ){
        		switch ( jsonTempList[iRow]['DATA_TYPE'+i] ) {
        			case 'TEXT':
        		  	case 'POPUP':
        		  		rlist.push(jsonTempList[iRow]['ACC_ITEM_VALUE'+i] + '|');  
        		    	break;
        		  	case 'NUM':
        		  		rlist.push((jsonTempList[iRow]['ACC_ITEM_VALUE'+i]).replaceAll(',','') + '|');  
        		    	break;
        		  	case 'YYYY':
        		  	case 'YYYYMM':
        		  	case 'YYYYMMDD':
        		  		rlist.push((jsonTempList[iRow]['ACC_ITEM_VALUE'+i]).replaceAll('-','') + '|');  
        		    	break;
        		  	default:
        		  		rlist.push('|');
	    		    	break;
        		}        		
        	}
        }
        return rlist;
    }
    
    /**
     * close
     */
	function fn_cancel() {
	    let menuId = 'MA_A20_030_020_001';
		window.parent.cfn_closeTab(menuId);
    }
    
    //폼의 값 --> 그리드에 셋팅하기
    function fn_FomChange(val, id) {
		console.log('val:', val);        
		console.log('id:', id);        
		console.log('p_sel_row:', p_sel_row);        
		if(p_sel_row>-1){
			jsonFig2310Edit[p_sel_row-1][id] = val;
		}
		console.log(jsonFig2210);
    }    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>