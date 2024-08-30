<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title></title>
    
    <style>
		.cu-table-selected {
		    background-color: #adddff; 
		    font-weight:bold;
		}		
    </style>
    
</head>
<body oncontextmenu="return false">
	<section id="compopfig2320">
		<div class="box box-solid">
		
			<div class="box-body cu-table-div" style="overflow:auto">

                <div style="display:flex;vertical-align:middle;float:right;padding-top:0px;padding-bottom:5px;margin-right:auto">
					<sbux-button id="scp-pop-btn-query-disp" class="btn btn-xs btn-outline-dark" text="조회" uitype="modal" onclick="fn_popQueryDisp('Q')"></sbux-button>
					<font style="width:5px"></font>
					<sbux-button class="btn btn-xs btn-outline-dark" text="반제처리" uitype="modal" onclick=""></sbux-button>
					<font style="width:5px"></font>
					<sbux-button class="btn btn-xs btn-outline-dark" text="취소" uitype="modal" onclick=""></sbux-button>
				</div>

				<div class="card" style="height:200px;margin-bottom:20px;">
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
	                    
                           	<!-- hidden  -->
  							<sbux-input  id="sch-pop-numbase-scale"  	name="sch-pop-numbase-scale" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
                       		<sbux-select id="sch-pop-site-code" 		name="sch-pop-site-code" 		style="display:none;" uitype="single" 	jsondata-ref="jsonPopSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
  							<sbux-input  id="sch-pop-dept-name"  		name="sch-pop-dept-name" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-pop-dept-code"  		name="sch-pop-dept-code" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-pop-open-to-fcm-yn"  	name="sch-pop-open-to-fcm-yn" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
                       		<!-- /hidden -->
	                    
	                    	<tr>
	                            <th scope="row" class="th_bg">회계단위</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="sch-pop-fi-org-code" uitype="single" jsondata-ref="jsonPopCbofiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">통화</th>
	                            <td colspan="7" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			                            <sbux-select style="width:150px" onchange="fn_popCurrencyCodeChange(sch-pop-currency-code)" id="sch-pop-currency-code" uitype="single" jsondata-ref="jsonPopCurrencyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                    <font style="width:5px"></font>
	   									<sbux-input style="width:150px" id="sch-pop-exchange-rate" uitype="text" class="form-control input-sm"></sbux-input>
					                    <font style="width:5px"></font>
		                       			<sbux-checkbox id="sch-pop-chkspot-yn" uitype="normal" text="스팟환율" true-value="Y" false-value="N" ></sbux-checkbox>
	                            	</div>
	                            </td>
	                    	</tr>
	                    	<tr>
	                            <th scope="row" class="th_bg">기준일자</th>
	                            <td colspan="3" class="td_input" >
								    <sbux-datepicker
								            id="sch-pop-entry-date-to"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed">
								    </sbux-datepicker>                            
	                            </td>
	                            
	                            <th scope="row" class="th_bg">회계기준</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="sch-pop-acct-rule-code" uitype="single" jsondata-ref="jsonPopAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">미결관리대상</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="sch-pop-acc-character" uitype="single" jsondata-ref="jsonPopAccCharacter" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                    	</tr>
	                    	<tr>
	                            <th scope="row" class="th_bg">계정과목</th>
	                            <td colspan="11" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px" id="sch-pop-account-code-fr" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="sch-pop-btn-acct-fr"
											name="sch-pop-btn-acct-fr"
											class="btn btn-xs btn-outline-dark"
											text=".." uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_popCompopup1('1')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px"  id="sch-pop-account-name-fr" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
					                    <font>~</font>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:100px"  id="sch-pop-account-code-to" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="sch-pop-btn-acct-to"
											name="sch-pop-btn-acct-to"
											class="btn btn-xs btn-outline-dark"
											text=".." uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_popCompopup1('2')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px" id="sch-pop-account-name-to" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
		                       			<sbux-checkbox 
		                       				id="sch-pop-multi-act-yn" 
		                       				uitype="normal" 
		                       				text="복수선택" 
		                       				true-value="Y" 
		                       				false-value="N" ></sbux-checkbox>
	   									<font style="width:5px"></font>
										<sbux-button
											id="sch-pop-btn-acct-multi"
											class="btn btn-xs btn-outline-dark"
											text="복수계정" 
											onclick="fn_popMultiAccount()"></sbux-button>
									</div>
	                            </td>
	                    	</tr>
	                    	<tr>
	                            <th scope="row" class="th_bg">거래처</th>
	                            <td colspan="11" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px"  id="sch-pop-cs-code-fr" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="sch-pop-btn-cs-fr"
											name="sch-pop-btn-cs-fr"
											class="btn btn-xs btn-outline-dark"
											text=".." uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_popCompopup2('1')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px"  id="sch-pop-cs-name-fr" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
					                    <font>~</font>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:100px"  id="sch-pop-cs-code-to" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="sch-pop-btn-cs-to"
											name="sch-pop-btn-cs-to"
											class="btn btn-xs btn-outline-dark"
											text=".." uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_popCompopup2('2')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px"  id="sch-pop-cs-name-to" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
		                       			<sbux-checkbox 
		                       				id="sch-pop-multi-cs-yn" 
		                       				uitype="normal" 
		                       				text="복수선택" 
		                       				true-value="Y" 
		                       				false-value="N" ></sbux-checkbox>
	   									<font style="width:5px"></font>
										<sbux-button
											id="sch-pop-btn-cs-multi"
											class="btn btn-xs btn-outline-dark"
											text="복수거래처" 
											onclick="fn_popMultiCs()"></sbux-button>
									</div>
	                            </td>
	                    	</tr>
	                    	<tr>
	                            <th scope="row" class="th_bg">전표유형</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="sch-pop-doc-type" uitype="single" jsondata-ref="jsonPopDocType" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <th scope="row" class="th_bg">제목</th>
	                            <td colspan="7" class="td_input" >
   									<sbux-input id="" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>
	                    	</tr>	                    	
	                    </tbody>
					</table>
				</div>
				
				<div id="compopfig2320GridListDiv" class="card" style="width:100%;height:200px;border:1px solid #f4f4f4;">
				</div>
				
                <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
					<a href="#" id="btn1-row-add" class="cu-btn-plus" style="padding-left:10px" >
						<img src="../../../resource/images/plus.png" width="20px" /> 행추가
					</a>
					<a href="#" id="btn1-row-del" class="cu-btn-minus" style="padding-left:10px">
						<img src="../../../resource/images/minus.png" width="20px" /> 행삭제
					</a>
				</div>
				
				<div id="compopfig2320GridEditDiv" class="card" style="width:100%;height:200px;border:1px solid #f4f4f4;">
				</div>
				
                <div style="padding-top:10px">
                
	                <sbux-tabs id="tab_norm_pop" name="tab_norm_pop" uitype="normal"
						is-scrollable="false"
						title-target-id-array="popTab1^popTab2"
						title-text-array="부가세^관리항목">
					</sbux-tabs>
					
                    <div class="tab-content" style="border-top:1px solid #bdbfc5;">
						<div id="popTab1" style="height:210px;">
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
				                       		<sbux-select 	onchange="fn_FomPopChange(POP_ETAX_TYPE, 'POP_ETAX_TYPE')"   	id="POP_ETAX_TYPE" 	jsondata-ref="jsonEtaxType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">신고일자</th>
			                            <td class="td_input" >
										    <sbux-datepicker onchange="fn_FomPopChange(POP_STANDARD_DATE, 'POP_STANDARD_DATE')"  id="POP_STANDARD_DATE" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>                          
			                            </td>
			                            <th scope="row" class="th_bg">공급가액</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_SUPPLY_AMT, 'POP_SUPPLY_AMT')" id="POP_SUPPLY_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">수출신고번호</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_EXPORT_LICENSE_NO, 'POP_EXPORT_LICENSE_NO')" id="POP_EXPORT_LICENSE_NO" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">당기제출금_외화</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_EXPORT_AMT, 'POP_EXPORT_AMT')" id="POP_EXPORT_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
									</tr>				                    	
			                        <tr>
			                            <th scope="row" class="th_bg">카드용도</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomPopChange(POP_CARD_USE_TYPE, 'POP_CARD_USE_TYPE')" id="POP_CARD_USE_TYPE" 	jsondata-ref="jsonCardUseType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">카드번호</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_CARD_NUM, 'POP_CARD_NUM')" id="POP_CARD_NUM" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">내국신용장구분</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomPopChange(POP_LOCAL_CREDIT_TYPE, 'POP_LOCAL_CREDIT_TYPE')" id="POP_LOCAL_CREDIT_TYPE" 	jsondata-ref="jsonLocalCreditType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">선적일자</th>
			                            <td class="td_input" >
										    <sbux-datepicker onchange="fn_FomPopChange(POP_SHIPPING_DATE, 'POP_SHIPPING_DATE')" id="POP_SHIPPING_DATE" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>                          
			                            </td>
			                            <th scope="row" class="th_bg">당기제출금_원화</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_EXPORT_AMT_KRW, 'POP_EXPORT_AMT_KRW')" id="POP_EXPORT_AMT_KRW" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
									</tr>				                    	
			                        <tr>
			                            <th scope="row" class="th_bg">불공제유형</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomPopChange(POP_VAT_NOT_DEDUCTION_TYPE, 'POP_VAT_NOT_DEDUCTION_TYPE')" id="POP_VAT_NOT_DEDUCTION_TYPE" jsondata-ref="jsonVatNotDedType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">예정신고누락</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomPopChange(POP_REPORT_OMIT_YN, 'POP_REPORT_OMIT_YN')" id="POP_REPORT_OMIT_YN" jsondata-ref="jsonReportOmitYn" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">서류명</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_DOCUMENT_NAME, 'POP_DOCUMENT_NAME')" id="POP_DOCUMENT_NAME" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">수출외화금액</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_FOREIGN_AMT, 'POP_FOREIGN_AMT')" id="POP_FOREIGN_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">당기신고해당분_외화</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_VAT_EXPORT_AMT, 'POP_VAT_EXPORT_AMT')" id="POP_VAT_EXPORT_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
									</tr>				                    	
			                        <tr>
			                            <th scope="row" class="th_bg">중복발행</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomPopChange(POP_DUP_ISSUE_BILL_TYPE, 'POP_DUP_ISSUE_BILL_TYPE')" id="POP_DUP_ISSUE_BILL_TYPE" jsondata-ref="jsonDupIssList" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">감가상각자산유형</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomPopChange(POP_VAT_ASSET_TYPE, 'POP_VAT_ASSET_TYPE')" id="POP_VAT_ASSET_TYPE" jsondata-ref="jsonVatAssetType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">발급자</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_ISSUE_NAME, 'POP_ISSUE_NAME')" id="POP_ISSUE_NAME" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">수출원화금액</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_WON_AMT, 'POP_WON_AMT')" id="POP_WON_AMT" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg">당기신고해당분_원화</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_VAT_EXPORT_AMT_KRW, 'POP_VAT_EXPORT_AMT_KRW')" id="POP_VAT_EXPORT_AMT_KRW" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
									</tr>				                    	
			                        <tr>
			                            <th scope="row" class="th_bg">11일외전송</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomPopChange(POP_AFTER_DUE_DATE_YN, 'POP_AFTER_DUE_DATE_YN')" id="POP_AFTER_DUE_DATE_YN" 	jsondata-ref="jsonAfterDueDateYn" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">영세율첨부서류여부</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomPopChange(POP_ZERO_REPORT_YN, 'POP_ZERO_REPORT_YN')" id="POP_ZERO_REPORT_YN" 	jsondata-ref="jsonZeroReportYn" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">발급일자</th>
			                            <td class="td_input" >
										    <sbux-datepicker onchange="fn_FomPopChange(POP_DOCUMENT_ISSUE_DATE, 'POP_DOCUMENT_ISSUE_DATE')"  id="POP_DOCUMENT_ISSUE_DATE" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>                          
			                            </td>
			                            <td colspan="4" class="td_input" >
			                            </td>
									</tr>				                    	
			                        <tr>
			                            <th scope="row" class="th_bg">수입금액제외</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomPopChange(POP_EXCLUDE_REVENUE_AMT_YN, 'POP_EXCLUDE_REVENUE_AMT_YN')" id="POP_EXCLUDE_REVENUE_AMT_YN" jsondata-ref="jsonExcludeAmtYn" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">영세율구분</th>
			                            <td class="td_input" >
				                       		<sbux-select onchange="fn_FomPopChange(POP_ZERO_TYPE, 'POP_ZERO_TYPE')"  id="POP_ZERO_TYPE"  jsondata-ref="jsonZeroType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
			                            </td>
			                            <th scope="row" class="th_bg">내국신용장서류번호</th>
			                            <td class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_DOCUMENT_NO, 'POP_DOCUMENT_NO')"  id="POP_DOCUMENT_NO" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <td colspan="4" class="td_input" >
			                            </td>
									</tr>				                    	
								</tbody>					
							</table>
						</div>
						
						<div id="popTab2" style="height:210px;">
						
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
			                            <th scope="row" class="th_bg cu-poptab2-fom-area" ></th>
			                            <td colspan="2" class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_ACC_ITEM_VALUE1, 'POP_ACC_ITEM_VALUE1')"  id="POP_ACC_ITEM_VALUE1" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg cu-poptab2-fom-area" ></th>
			                            <td colspan="2" class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_ACC_ITEM_VALUE5, 'POP_ACC_ITEM_VALUE5')"  id="POP_ACC_ITEM_VALUE5" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg cu-poptab2-fom-area" ></th>
			                            <td colspan="2" class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_ACC_ITEM_VALUE9, 'POP_ACC_ITEM_VALUE9')"  id="POP_ACC_ITEM_VALUE9" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
									</tr>
			                        <tr>
			                            <th scope="row" class="th_bg cu-poptab2-fom-area" ></th>
			                            <td colspan="2" class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_ACC_ITEM_VALUE2, 'POP_ACC_ITEM_VALUE2')"  id="POP_ACC_ITEM_VALUE2" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg cu-poptab2-fom-area" ></th>
			                            <td colspan="2" class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_ACC_ITEM_VALUE6, 'POP_ACC_ITEM_VALUE6')"  id="POP_ACC_ITEM_VALUE6" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg cu-poptab2-fom-area" ></th>
			                            <td colspan="2" class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_ACC_ITEM_VALUE10, 'POP_ACC_ITEM_VALUE10')"  id="POP_ACC_ITEM_VALUE10" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
									</tr>
			                        <tr>
			                            <th scope="row" class="th_bg cu-poptab2-fom-area" ></th>
			                            <td colspan="2" class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_ACC_ITEM_VALUE3, 'POP_ACC_ITEM_VALUE3')"  id="POP_ACC_ITEM_VALUE3" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg cu-poptab2-fom-area" ></th>
			                            <td colspan="2" class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_ACC_ITEM_VALUE7, 'POP_ACC_ITEM_VALUE7')"  id="POP_ACC_ITEM_VALUE7" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg cu-poptab2-fom-area" ></th>
			                            <td colspan="2" class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_PROJECT_CODE, 'POP_PROJECT_CODE')"  id="POP_PROJECT_CODE" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
									</tr>
			                        <tr>
			                            <th scope="row" class="th_bg cu-poptab2-fom-area" ></th>
			                            <td colspan="2" class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_ACC_ITEM_VALUE4, 'POP_ACC_ITEM_VALUE4')"  id="POP_ACC_ITEM_VALUE4" uitype="text" class="form-control input-sm" ></sbux-input>
			                            </td>
			                            <th scope="row" class="th_bg cu-poptab2-fom-area" ></th>
			                            <td colspan="2" class="td_input" >
			   								<sbux-input onchange="fn_FomPopChange(POP_ACC_ITEM_VALUE8, 'POP_ACC_ITEM_VALUE8')"  id="POP_ACC_ITEM_VALUE8" uitype="text" class="form-control input-sm" ></sbux-input>
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
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script >

//grid 초기화
var Fig2320GridList; 			// 그리드를 담기위한 객체 선언
var jsonFig2320List = []; 		// 그리드의 참조 데이터 주소 선언

var Fig2320GridEdit; 			// 그리드를 담기위한 객체 선언
var jsonFig2320Edit = []; 		// 그리드의 참조 데이터 주소 선언

var jsonPopCbofiOrgCode 	= []; // 회계단위
var jsonPopCurrencyCode 	= []; // 통화
var jsonPopAcctRuleCode 	= []; // 회계기준
var jsonPopAccCharacter 	= []; // 미결관리대상
var jsonPopDocType 			= []; // 전표유형
var jsonPopSiteCode 		= []; // 

var pp_strAccountCodeList	= ""; // 복수계정 파라미터
var pp_strCsCodeList		= ""; // 복수거래처 파라미터

/**
 * @description 미결반제전표
 */
function compopfig2320(options) {
	
	// id 선언
	var modalId  	= '#compopfig2320';
	var modalDivId 	= 'modal-compopfig2320';
	
	var settings = {
		height					: null
		,param					: null
		,callbackEvent			: null
		,cancelEvent			: null
	};
	$.extend(settings, options);	
	//console.log('settings:', settings);

	//css
	$('#' + modalDivId).find('.sbux-mol-hd-close').css({'font-size':'30px','margin-top':'-20px'});
	if(settings.width){
	 	$(modalId).closest('.sbux-mol-md-dlg').css('width', settings.width);
	}
	if(settings.height){
	 	$(modalId).find('.cu-table-div').css('height', settings.height);
	}	
	
	//컴포넌트를 다시 그린다.
	SBUxMethod.refresh('sch-pop-entry-date-to');
	SBUxMethod.refresh('tab_norm_pop');
	SBUxMethod.refresh('sch-pop-btn-acct-fr');
	SBUxMethod.refresh('sch-pop-btn-acct-to');
	SBUxMethod.refresh('sch-pop-btn-cs-fr');
	SBUxMethod.refresh('sch-pop-btn-cs-to');
	SBUxMethod.refresh('sch-pop-btn-acct-multi');
	SBUxMethod.refresh('sch-pop-btn-cs-multi');
	SBUxMethod.refresh('scp-pop-btn-query-disp');
	
	const fn_popInitSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['sch-pop-fi-org-code'],		jsonPopCbofiOrgCode, 	'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            gfnma_setComSelect(['sch-pop-site-code'],		jsonPopSiteCode, 		'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['sch-pop-currency-code'],	jsonPopCurrencyCode, 	'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['sch-pop-acct-rule-code'],	jsonPopAcctRuleCode, 	'L_FIM054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 미결관리대상
            gfnma_setComSelect(['sch-pop-acc-character'],	jsonPopAccCharacter, 	'L_FIM033_01', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표유형
            gfnma_setComSelect(['sch-pop-doc-type'],		jsonPopDocType, 	  	'L_FIM051_CLR', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	
	
	async function fn_initPopup() {
		
		//select init
  		await fn_popInitSBSelect()
		//화면셋팅
    	fn_statePopup();
	} 	
	
	function fn_statePopup(){
		
		SBUxMethod.set("sch-pop-account-code-fr", "");
		SBUxMethod.set("sch-pop-account-name-fr", "");
		SBUxMethod.set("sch-pop-account-code-to", "");
		SBUxMethod.set("sch-pop-account-name-to", "");
		
		SBUxMethod.set("sch-pop-chkspot-yn", 		"N");
		SBUxMethod.set("sch-pop-doc-type", 			"93");
		SBUxMethod.hide("sch-pop-chkspot-yn");
		SBUxMethod.attr('sch-pop-exchange-rate',	'disabled', true);
		
		if(settings.param){
			if(settings.param['FI_ORG_CODE']){
				SBUxMethod.set("sch-pop-fi-org-code", 	settings.param['FI_ORG_CODE']);
			}
			if(settings.param['ACCT_RULE_CODE']){
				SBUxMethod.set("sch-pop-acct-rule-code", settings.param['ACCT_RULE_CODE']);
			}
			
			SBUxMethod.set("sch-pop-site-code", 	p_ss_siteCode);
			SBUxMethod.set("sch-pop-dept-code", 	p_ss_deptCode);
			SBUxMethod.set("sch-pop-dept-name", 	p_ss_deptName);
		} else {
			SBUxMethod.set("sch-pop-fi-org-code", 	p_ss_fiOrgCode);
			SBUxMethod.set("sch-pop-site-code", 	p_ss_siteCode);
			SBUxMethod.set("sch-pop-dept-code", 	p_ss_deptCode);
			SBUxMethod.set("sch-pop-dept-name", 	p_ss_deptName);
		}
		
		if(p_ss_isAccountManager || p_ss_issAccountChief){
			SBUxMethod.set("sch-pop-open-to-fcm-yn", 	"N");
			SBUxMethod.show("sch-pop-chkspot-yn");
			SBUxMethod.attr('sch-pop-exchange-rate',	'disabled', false);
		} else {
			SBUxMethod.set("sch-pop-open-to-fcm-yn", 	"Y");
			SBUxMethod.hide("sch-pop-chkspot-yn");
			SBUxMethod.attr('sch-pop-exchange-rate',	'disabled', true);
		}
		
	}
	
	fn_initPopup();
	
    function fn_createFig2320GridList() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'compopfig2320GridListDiv';
	    SBGridProperties.id 				= 'Fig2320GridList';
	    SBGridProperties.jsonref 			= 'jsonFig2320List';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["전표번호"],					ref: 'DOC_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순번"], 					ref: 'ITEM_SEQ',    			type:'output',  	width:'60px',  		style:'text-align:left'},
            {caption: ["수정시간"], 				ref: 'INSERT_TIME', 			type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["수정자"],    				ref: 'INSERT_USERID', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["수정자명"],    				ref: 'USER_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급기준일"],  				ref: 'PAY_BASE_DATE', 			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["지급예상일"],  				ref: 'EXPECTED_PAY_DATE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급조건"],    				ref: 'PAY_TERM_CODE', 			type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ["지급조건명"],  				ref: 'PAY_TERM_NAME', 			type:'output',  	width:'120px',  	style:'text-align:right'},
            {caption: ["금액"],	   					ref: 'AMOUNT', 					type:'output',  	width:'120px',  	style:'text-align:right'},
            {caption: ["어음만기일"],	  			ref: 'BILL_DUE_DATE', 			type:'output',  	width:'100px',  	style:'text-align:right'},
            {caption: ["비고"],	  					ref: 'DESCRIPTION', 			type:'output',  	width:'250px',  	style:'text-align:right'},
            {caption: ["어음일수"],	   				ref: 'BILL_DUE_DAY', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["어음지급일"],				ref: 'BILL_DUE_PAY_DATE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Fig2320GridList = _SBGrid.create(SBGridProperties);
        //Fig2320GridList.bind('click', 'fn_viewGrid');
    }	
    fn_createFig2320GridList();	
	
    const fn_setFig2320GridList = async function(wtype) {

		Fig2320GridList.clearStatus();

	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : settings.param['p_strfi_org_code']
			,V_P_DOC_ID             : settings.param['p_doc_id']

			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig2320List.do", {
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

  	        	jsonFig2320List.length = 0;
  	        	data.cv_2.forEach((item, index) => {
  					const msg = {
  						DOC_ID					: gfnma_nvl(item.DOC_ID),			
  						DOC_NAME				: gfnma_nvl(item.DOC_NAME),
  						ITEM_ID					: gfnma_nvl(item.ITEM_ID),			
  						ITEM_SEQ				: gfnma_nvl(item.ITEM_SEQ),		
  						INSERT_USERID			: gfnma_nvl(item.INSERT_USERID),
  						USER_NAME				: gfnma_nvl(item.USER_NAME),
  						INSERT_TIME				: gfnma_nvl(item.INSERT_TIME),
  						PAY_BASE_DATE			: gfnma_nvl(item.PAY_BASE_DATE),
  						EXPECTED_PAY_DATE		: gfnma_date5(gfnma_nvl(item.EXPECTED_PAY_DATE)),
  						PAY_TERM_CODE			: gfnma_nvl(item.PAY_TERM_CODE),
  						PAY_TERM_NAME			: gfnma_nvl(item.PAY_TERM_NAME),
  						AMOUNT					: gfnma_nvl(item.AMOUNT),
  						DESCRIPTION				: gfnma_nvl(item.DESCRIPTION),
  						BILL_DUE_DATE			: gfnma_date5(gfnma_nvl(item.BILL_DUE_DATE)),
  						BILL_DUE_DAY			: gfnma_nvl(item.BILL_DUE_DAY),
  						BILL_DUE_PAY_DATE		: gfnma_date5(gfnma_nvl(item.BILL_DUE_PAY_DATE)),
  						BANK_ACCOUNT_SEQ		: gfnma_nvl(item.BANK_ACCOUNT_SEQ),
  						PGM_ID					: gfnma_nvl(item.PGM_ID),
  					}
  					jsonFig2320List.push(msg);
  					totalRecordCount ++;
  				});

        		Fig2320GridList.rebuild();
  	        	//document.querySelector('#listCount1').innerText = totalRecordCount;
  	        	
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

    function fn_createFig2320GridEdit() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'compopfig2320GridEditDiv';
	    SBGridProperties.id 				= 'Fig2320GridEdit';
	    SBGridProperties.jsonref 			= 'jsonFig2320Edit';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["전표번호"],					ref: 'DOC_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순번"], 					ref: 'ITEM_SEQ',    			type:'output',  	width:'60px',  		style:'text-align:left'},
            {caption: ["수정시간"], 				ref: 'INSERT_TIME', 			type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["수정자"],    				ref: 'INSERT_USERID', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["수정자명"],    				ref: 'USER_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급기준일"],  				ref: 'PAY_BASE_DATE', 			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["지급예상일"],  				ref: 'EXPECTED_PAY_DATE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급조건"],    				ref: 'PAY_TERM_CODE', 			type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ["지급조건명"],  				ref: 'PAY_TERM_NAME', 			type:'output',  	width:'120px',  	style:'text-align:right'},
            {caption: ["금액"],	   					ref: 'AMOUNT', 					type:'output',  	width:'120px',  	style:'text-align:right'},
            {caption: ["어음만기일"],	  			ref: 'BILL_DUE_DATE', 			type:'output',  	width:'100px',  	style:'text-align:right'},
            {caption: ["비고"],	  					ref: 'DESCRIPTION', 			type:'output',  	width:'250px',  	style:'text-align:right'},
            {caption: ["어음일수"],	   				ref: 'BILL_DUE_DAY', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["어음지급일"],				ref: 'BILL_DUE_PAY_DATE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Fig2320GridList = _SBGrid.create(SBGridProperties);
        //Fig2320GridList.bind('click', 'fn_viewGrid');
    }	
    fn_createFig2320GridEdit();	
    
	//close event
	$(modalId).find('.cu-btn-cancel').off('click');
	$(modalId).find('.cu-btn-cancel').click(function(){
 		if(settings.cancelEvent){
 			settings.cancelEvent();
 		}
	 	SBUxMethod.closeModal(modalDivId);
	});	
	
}
 
/**
 * 통화 변경 event
 */
function fn_popCurrencyCodeChange(val) {
	
	if(!val) return;
	
	let p_entry_date_to	= gfnma_date6(gfnma_nvl(SBUxMethod.get("sch-pop-entry-date-to")));
	
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
		
		var p_chkspot_yn = gfnma_nvl(SBUxMethod.get('sch-pop-chkspot-yn')['sch-pop-chkspot-yn'])
		if(p_chkspot_yn=='N'){
			SBUxMethod.set('sch-pop-exchange-rate', data[0]['RATE']);
		}
		var p_exchange_rate = SBUxMethod.get('sch-pop-exchange-rate');
		
		SBUxMethod.set('sch-pop-numbase-scale', data[0]['BASE_SCALE']);
	    if(p_chkspot_yn == "Y" && !p_exchange_rate ){
			SBUxMethod.set('sch-pop-exchange-rate', data[0]['RATE']);
	    }
	});
}    

/**
 * 계정과목 
 */
function fn_popCompopup1(type) {
	
    var searchText1 	= '';
    var searchText2 	= '';
    if(type=='1'){
        searchText1 	= gfnma_nvl(SBUxMethod.get("sch-pop-account-code-fr"));
        searchText2 	= gfnma_nvl(SBUxMethod.get("sch-pop-account-name-fr"));
    } else {
        searchText1 	= gfnma_nvl(SBUxMethod.get("sch-pop-account-code-to"));
        searchText2 	= gfnma_nvl(SBUxMethod.get("sch-pop-account-name-to"));
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
				SBUxMethod.set('sch-pop-account-code-fr', data.ACCOUNT_CODE);
				SBUxMethod.set('sch-pop-account-name-fr', data.ACCOUNT_NAME);
			} else {
				SBUxMethod.set('sch-pop-account-code-to', data.ACCOUNT_CODE);
				SBUxMethod.set('sch-pop-account-name-to', data.ACCOUNT_NAME);
			}
		},
	});
}
 
/**
 * 거래처 
 */
function fn_popCompopup2(type) {
	
    var searchText1 	= '';
    var searchText2 	= '';
    if(type=='1'){
        searchText1 	= gfnma_nvl(SBUxMethod.get("sch-pop-cs-code-fr"));
        searchText2 	= gfnma_nvl(SBUxMethod.get("sch-pop-cs-name-fr"));
    } else {
        searchText1 	= gfnma_nvl(SBUxMethod.get("sch-pop-cs-code-to"));
        searchText2 	= gfnma_nvl(SBUxMethod.get("sch-pop-cs-name-to"));
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
				SBUxMethod.set('sch-pop-cs-code-fr', data.CS_CODE);
				SBUxMethod.set('sch-pop-cs-name-fr', data.CS_NAME);
			} else {
				SBUxMethod.set('sch-pop-cs-code-to', data.CS_CODE);
				SBUxMethod.set('sch-pop-cs-name-to', data.CS_NAME);
			}
		},
	});
}
 
/**
 * 복수계정 
 */
function fn_popMultiAccount() {
	
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
					SBUxMethod.set('sch-pop-multi-act-yn', "Y");
				} else {
					SBUxMethod.set('sch-pop-multi-act-yn', "N");
				}
			},
	});
	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
}
 
/**
 * 복수거래처 
 */
function fn_popMultiCs() {
	
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
					SBUxMethod.set('sch-pop-multi-cs-yn', "Y");
				} else {
					SBUxMethod.set('sch-pop-multi-cs-yn', "N");
				}
			},
	});
	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
}
 
/**
 * 조회
 */
const fn_popQueryDisp = async function (wtype){

	let p_cs_code_fr		= gfnma_nvl(SBUxMethod.get("sch-pop-cs-code-fr"));
	let p_cs_code_to		= gfnma_nvl(SBUxMethod.get("sch-pop-cs-code-to"));
	let p_account_code_fr	= gfnma_nvl(SBUxMethod.get("sch-pop-account-code-fr"));
	let p_account_code_to	= gfnma_nvl(SBUxMethod.get("sch-pop-account-code-to"));
	
	let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("sch-pop-fi-org-code"));
	let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("sch-pop-acct-rule-code"));
	let p_entry_date_to		= gfnma_date6(gfnma_nvl(SBUxMethod.get("sch-pop-entry-date-to")));
	let p_acc_character		= gfnma_nvl(SBUxMethod.get("sch-pop-acc-character"));
	let p_currenty_code		= gfnma_nvl(SBUxMethod.get("sch-pop-currency-code"));
	
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
	console.log('data:', data);

    try {
    	if (_.isEqual("S", data.resultStatus)) {
    		if(data.resultMessage){
          		alert(data.resultMessage);
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
 
 
</script>
</html>