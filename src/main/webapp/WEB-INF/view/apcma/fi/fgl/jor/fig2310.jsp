<%
/**
 * @Class Name 		: fig2310.jsp
 * @Description 	: 미결반제전표생성 화면
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
	<title>title : 미결반제전표</title>
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
                    </h3><!-- 미결반제전표 -->
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
					    	<font>선택</font>
					        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
					    </button>
					    <div class="dropdown-menu" aria-labelledby="srch-compopup1-rulecode" style="width:600px;height:150px;padding-top:0px;overflow:auto">
					    </div>
					</div> 
					-->
                </div>
                <div>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="미결반제전표 생성"  		id="sch-btn-addItem" 	class="btn btn-sm btn-outline-danger" onclick="fn_addItem"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <!-- 
                    <sbux-button uitype="normal" text="전표복사"  		id="sch-btn-copy" 			class="btn btn-sm btn-outline-danger" onclick=""></sbux-button>
                     -->
                    <sbux-button uitype="normal" text="결재이력"  		id="sch-btn-confirmHist" 	class="btn btn-sm btn-outline-danger" onclick="fn_confimHist"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="전기처리"  		id="sch-btn-end" 			class="btn btn-sm btn-outline-danger" onclick="fn_docEnd"></sbux-button>
                    <sbux-button uitype="normal" text="전기취소"  		id="sch-btn-cancel" 		class="btn btn-sm btn-outline-danger" onclick="fn_docCancel"></sbux-button>
                    <sbux-button uitype="normal" text="보류해제"  		id="sch-btn-release" 		class="btn btn-sm btn-outline-danger" onclick="fn_docRelease"></sbux-button>
                    <sbux-button uitype="normal" text="보류지정"  		id="sch-btn-unrelease" 		class="btn btn-sm btn-outline-danger" onclick="fn_docUnRelease"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="출력"  			id="sch-btn-print" 			class="btn btn-sm btn-outline-danger" onclick="fn_docDelAll"></sbux-button>
                </div>
            </div>
            <div class="box-body">
 
				<div class="box-search-ma" >
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
	                    
                           	<!-- hidden  -->
  							<sbux-input  id="sch-txtinsert-userid" 		name="sch-txtinsert-userid" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txttemp-doc-num" 		name="sch-txttemp-doc-num" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txtconfirm-emp-code" 	name="sch-txtconfirm-emp-code" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txtstd-doc-num" 		name="sch-txtstd-doc-num" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txtsource-type" 		name="sch-txtsource-type" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txtappr-id" 			name="sch-txtappr-id" 				style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txtsource-type2" 		name="sch-txtsource-type2" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txtentry-path" 		name="sch-txtentry-path" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txtproxy-emp-code" 	name="sch-txtproxy-emp-code" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-numappr-count" 		name="sch-numappr-count" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							
                       		<sbux-select id="sch-hold-flag" 			name="sch-hold-flag" 				style="display:none;" uitype="single" 	jsondata-ref="jsonHoldFlag" unselected-text="선택" class="form-control input-sm"></sbux-select>
  							<sbux-input  id="sch-ymdrelease-date" 		name="sch-ymdrelease-date" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-textEditEx1" 			name="sch-textEditEx1" 				style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-ymdhold-date" 			name="sch-ymdhold-date" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-textEditEx2" 			name="sch-textEditEx2" 				style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
                       		<sbux-select id="sch-cbohold-reason" 		name="sch-cbohold-reason" 			style="display:none;" uitype="single" 	jsondata-ref="jsonHoldReason" unselected-text="선택" class="form-control input-sm"></sbux-select>
                       		<sbux-select id="sch-fi-org-code" 			name="sch-fi-org-code" 			style="display:none;" uitype="single" 	jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                       		
                       		<sbux-select id="sch-cbosite-code" 			name="sch-cbosite-code" 			style="display:none;" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                       		<sbux-select id="sch-cboexchange-type" 		name="sch-cboexchange-type" 		style="display:none;" uitype="single" jsondata-ref="jsonExchangeType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                       		
  							<sbux-input  id="sch-txtdebit-credit" 		name="sch-txtdebit-credit" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txtaccount-code" 		name="sch-txtaccount-code" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
                       		<!-- /hidden -->
                       		
	                        <tr>
	                            <th scope="row" class="th_bg_search">배치번호</th>
	                            <td class="td_input" >
	   								<sbux-input id="sch-doc-batch-no" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td colspan="2" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
		                            	<font>전표ID</font>
		   								<sbux-input id="sch-doc-id" uitype="text" class="form-control input-sm"></sbux-input>
	                            	</div>
	                            </td>
	                            <td></td>
 
	                            <th scope="row" class="th_bg_search">결의부서</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input
										uitype="text"
										id="sch-dept-name"
										class="form-control input-sm inpt_data_reqed"									
										group-id="frmBody" 
										required                                       
	   								></sbux-input>
									<sbux-input
										uitype="hidden"
										uitype="text"
										id="sch-dept-code"
										class="form-control input-sm"
	   								></sbux-input>
	                            </td>
	                            <td class="td_input" >
									<sbux-button
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1"
									></sbux-button>
	                            </td>
	                            
	                            <th scope="row" class="th_bg_search">회계기준</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="sch-acct-rule-code" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed"
										group-id="frmBody" 
										required                                       
		                            ></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">전표번호</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input id="sch-doc-name" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                            
	                        </tr>    
	                        
	                        <tr>
 
	                            <th scope="row" class="th_bg_search">회계검토의견</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input id="sch-acct-opinion" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
 
	                            <th scope="row" class="th_bg_search">자금검토의건</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input id="sch-tr-opinion" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">신고사업장</th>
	                            <td class="td_input" >
		                            <sbux-select id="sch-tax-site-code" uitype="single" jsondata-ref="jsonTaxSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td>/</td>
	                            <td class="td_input" >
		                            <sbux-select id="sch-sub-tax-site-code" uitype="single" jsondata-ref="jsonSubTaxSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">현업결재일</th>
	                            <td colspan="1" class="td_input" >
								    <sbux-datepicker
								            id="sch-approve-date"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast table-datepicker-ma">
								    </sbux-datepicker>                          
	                            </td>
	                            <td colspan="3"></td>
	                            
	                        </tr>    
	                        
	                        <tr>
 
	                            <th scope="row" class="th_bg_search">회계승인일</th>
	                            <td class="td_input" >
								    <sbux-datepicker
								            id="sch-posting-date"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast table-datepicker-ma">
								    </sbux-datepicker>                          
	                            </td>
	                            <td></td>
	                            <td class="td_input" >
   									<sbux-input id="sch-tposting-user" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">전표유형</th>
	                            <td class="td_input" >
	                                <sbux-select id="sch-doc-type" name="sch-doc-type" uitype="single" jsondata-ref="jsonDocType" unselected-text="선택" class="form-control input-sm inpt_data_reqed"
										group-id="frmBody" 
										required                                       
	                                ></sbux-select>
	                            </td>
	                            <td></td>
	                            <td class="td_input" >
	                                <sbux-select id="sch-doc-status" name="sch-doc-status" uitype="single" jsondata-ref="jsonDocStatus" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
 
	                            <th scope="row" class="th_bg_search">전기일자</th>
	                            <td colspan="1" class="td_input" >
								    <sbux-datepicker
							            id="sch-doc-date"
							            uitype="popup"
							            date-format="yyyy-mm-dd"
							            class="form-control input-sm input-sm-ast table-datepicker-ma inpt_data_reqed"
										group-id="frmBody" 
										required                                       
						            >
								    </sbux-datepicker>                          
	                            </td>
	                            <td colspan="3"></td>
 
	                            <th scope="row" class="th_bg_search">승인취소일</th>
	                            <td class="td_input" >
								    <sbux-datepicker
								            id="sch-unposting-date"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast table-datepicker-ma">
								    </sbux-datepicker>                          
	                            </td>
	                            <td></td>
	                            <td class="td_input" >
   									<sbux-input id="sch-unposting-user" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                            
	                        </tr>    
	                        
	                        <tr>
	                            <th scope="row" class="th_bg_search">증빙일자</th>
	                            <td colspan="1" class="td_input" >
								    <sbux-datepicker
							            id="sch-voucher-receipt-date"
							            uitype="popup"
							            date-format="yyyy-mm-dd"
							            class="form-control input-sm input-sm-ast table-datepicker-ma">
								    </sbux-datepicker>                          
	                            </td>
	                            <td colspan="3"></td>
 
	                            <th scope="row" class="th_bg_search">통화</th>
	                            <td class="td_input" >
	                                <sbux-select id="sch-currency-code" name="sch-currency-code" onchange="fn_changeCurrencyCode(sch-currency-code)"  uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed"
										group-id="frmBody" 
										required                                       
	                                ></sbux-select>
	                            </td>
	                            <td></td>
	                            <td class="td_input" >
	   								<sbux-input uitype="text" id="sch-exchange-rate" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td></td>
 
	                            <th scope="row" class="th_bg_search">제목</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input id="sch-description" uitype="text" class="form-control input-sm inpt_data_reqed"
										group-id="frmBody" 
										required                                       
	   								></sbux-input>
	                            </td>
	                            <td></td>
	                            
	                        </tr>    
								                            
	                    </tbody>
	                </table>				
				</div>
                
                <div class="row">
                
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>회계전표</span>
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
                    	<font style="padding-left:20px">차이(원래)</font>
						<sbux-input style="width:150px;padding-left:10px" uitype="text" id="tot-numDiffWon" class="form-control input-sm" style="font-weight:bold;" mask="{'alias':'numeric','autoGroup':3,'groupSeparator':','}" ></sbux-input>
                    	<font style="padding-left:20px">차이(환산)</font>
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
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME1">관리항목1</th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE1, 'ACC_ITEM_VALUE1')"  id="ACC_ITEM_VALUE1" name="ACC_ITEM_VALUE1" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME5">관리항목5</th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE5, 'ACC_ITEM_VALUE5')"  id="ACC_ITEM_VALUE5" name="ACC_ITEM_VALUE5" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME9">관리항목9</th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE9, 'ACC_ITEM_VALUE9')"  id="ACC_ITEM_VALUE9" name="ACC_ITEM_VALUE9" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
										</tr>
				                        <tr>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME2">관리항목2</th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE2, 'ACC_ITEM_VALUE2')"  id="ACC_ITEM_VALUE2" name="ACC_ITEM_VALUE2" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME6">관리항목6</th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE6, 'ACC_ITEM_VALUE6')"  id="ACC_ITEM_VALUE6" name="ACC_ITEM_VALUE6" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME10">관리항목10</th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE10, 'ACC_ITEM_VALUE10')"  id="ACC_ITEM_VALUE10" name="ACC_ITEM_VALUE10" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
										</tr>
				                        <tr>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME3">관리항목3</th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE3, 'ACC_ITEM_VALUE3')"  id="ACC_ITEM_VALUE3" name="ACC_ITEM_VALUE3" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME7">관리항목7</th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE7, 'ACC_ITEM_VALUE7')"  id="ACC_ITEM_VALUE7" name="ACC_ITEM_VALUE7" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="PROJECT_NAME">프로젝트</th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(PROJECT_CODE, 'PROJECT_CODE')"  id="PROJECT_CODE" name="PROJECT_CODE" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
										</tr>
				                        <tr>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME4">관리항목4</th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE4, 'ACC_ITEM_VALUE4')"  id="ACC_ITEM_VALUE4" name="ACC_ITEM_VALUE4" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg cu-tab2-fom-area" id="ACC_ITEM_NAME8">관리항목8</th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input onchange="fn_FomChange(ACC_ITEM_VALUE8, 'ACC_ITEM_VALUE8')"  id="ACC_ITEM_VALUE8" name="ACC_ITEM_VALUE8" uitype="text" class="form-control input-sm" ></sbux-input>
				                            </td>
				                            <th scope="row" class="th_bg" ></th>
				                            <td colspan="2" class="td_input" >
				   								<sbux-input uitype="hidden" id="DEBIT_CREDIT" name="DEBIT_CREDIT" class="form-control input-sm" ></sbux-input>
				   								<sbux-input uitype="hidden" id="ACCOUNT_CODE" name="ACCOUNT_CODE" class="form-control input-sm" ></sbux-input>
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
	var p_ss_empCode 			= '${loginVO.maEmpCode}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	var p_ss_siteCode			= '${loginVO.maSiteCode}';
	var p_ss_deptCode			= '${loginVO.maDeptCode}';
	var p_ss_deptName			= '${loginVO.maDeptName}';
	var p_ss_currCode			= '${loginVO.maCurrCode}';
	var p_ss_currUnit			= '${loginVO.maCurrUnit}';
	
    var pg_vat_type_bizId		= 'P_ACCOUNT_POPUP_Q';	//그리드내(부가세유형) 팝업 bizId
	
    var pg_colcs_code_bizId		= 'P_CS_ALL';	//그리드내(거래처) 팝업 bizId
    var pg_colcs_code_title		= '거래처';		//그리드내(거래처) 팝업 타이틀
    var pg_colcs_code_field1	= 'CNPT_CD';	//그리드내(거래처) 컬럼명
    var pg_colcs_code_field2	= 'CNPT_NM';	//그리드내(거래처) 컬럼명
    
    var pg_colpay_term_code_bizId	= 'P_PAY_DATE';			//그리드내(지급기준) 컬럼명
    
    var pg_rule_code_bizId		= 'L_RULE';					//멀티셀렉트 'srch-compopup1-rulecode' bizId
    var pg_rule_code_where		= "AND SLIP_TYPE = '93'";	//멀티셀렉트 'srch-compopup1-rulecode' where
	
	var pg_doc_type_bizId		= 'L_FIM051';
	//var pg_doc_type_where		= "AND manual_doc_write_yn = 'Y'";
	var pg_doc_type_where		= "AND MLT_APS_SLIP_YN = 'Y'";
    
    var pg_strdoc_type			= '93';
    
    var p_summit_yn 			= true;		// c# fnsummit_yn();
    var p_menu_param			= null;
	var pg_state				= '';
	
	
	var p_strwork_type			= '';
	var p_strunposting_type		= '';
	var p_strunposting_date		= '';
	
    //grid 초기화
    var Fig2310Grid; 			// 그리드를 담기위한 객체 선언
    var jsonFig2310 = []; 		// 그리드의 참조 데이터 주소 선언
	//-----------------------------------------------------------
	
    var jsonAcctRuleCode 		= []; // 회계기준
    var jsonFiOrgCode 			= []; // 사업단위
    var jsonSiteCode 			= []; 
    var jsonHoldFlag 			= []; 
    var jsonHoldReason			= []; // 보류사유 
    var jsonExchangeType		= [];  
 
    var jsonTaxSiteCode 		= []; // 신고사업장
    var jsonSubTaxSiteCode 		= []; // 총사업장
    var jsonDocType 			= []; // 전표유형
    var jsonDocStatus 			= []; // 전표유형
    var jsonCurrencyCode 		= []; // 통화
    
    var jsonLineType 			= []; // 라인유형
    var jsonDebitCredit 		= []; // 차/대
 
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
    var jsonPayMethod			= []; // 지급방법
 
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
 
            gfnma_setComSelect(['sch-hold-flag'],				jsonHoldFlag, 		'L_COM036', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			gfnma_setComSelect([], 								jsonHoldReason, 	'L_COM042', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['sch-fi-org-code'],				jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACNTG_OGNZ_CD', 'ACNTG_OGNZ_NM', 'Y', ''),
            gfnma_setComSelect(['sch-cbosite-code'],			jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),
            gfnma_setComSelect(['sch-cboexchange-type'],		jsonExchangeType,	'L_COM034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			
            // 회계기준
            gfnma_setComSelect(['sch-acct-rule-code'],			jsonAcctRuleCode, 	'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 신고사업장
            gfnma_setComSelect(['sch-tax-site-code'],			jsonTaxSiteCode, 	'L_ORG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TX_SITE_CD', 'TX_SITE_NM', 'Y', ''),
            // 종사업장
            gfnma_setComSelect(['sch-sub-tax-site-code'],		jsonSubTaxSiteCode, 'L_ORG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TX_SITE_CD', 'TX_SITE_NM', 'Y', ''),
            // 전표유형
            gfnma_setComSelect(['sch-doc-type'],				jsonDocType, 		pg_doc_type_bizId, pg_doc_type_where, gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['sch-doc-status'],				jsonDocStatus, 		'L_FIG002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 통화
            gfnma_setComSelect(['sch-currency-code'],			jsonCurrencyCode, 	'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CRN_CD', 'CRN_NM', 'Y', ''),
            
            // 그리드내 라인유형
			gfnma_setComSelect([], 								jsonLineType, 		'L_FIM052', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 그리드내 차/대
			gfnma_setComSelect([], 								jsonDebitCredit, 	'L_FIG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			
            // 전자발행
            gfnma_setComSelect(['ETAX_TYPE'],					jsonEtaxType, 		'L_FIT005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 카드용도
            gfnma_setComSelect(['CARD_USE_TYPE'],				jsonCardUseType, 	'L_FIT012', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 내국신용장구분
            gfnma_setComSelect(['LOCAL_CREDIT_TYPE'],			jsonLocalCreditType,'L_FIT011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 불공제유형
            gfnma_setComSelect(['VAT_NOT_DEDUCTION_TYPE'],		jsonVatNotDedType,	'L_FIT013', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 예정신고누락
            gfnma_setComSelect(['REPORT_OMIT_YN'],				jsonReportOmitYn,	'L_FIT009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 중복발행
            gfnma_setComSelect(['DUP_ISSUE_BILL_TYPE'],			jsonDupIssList,		'L_FIT007', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 감가상각자산유형
            gfnma_setComSelect(['VAT_ASSET_TYPE'],				jsonVatAssetType,	'L_FIT014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 11일외전송
            gfnma_setComSelect(['AFTER_DUE_DATE_YN'],			jsonAfterDueDateYn,	'L_FIT006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 영세율첨부서류여부
            gfnma_setComSelect(['ZERO_REPORT_YN'],				jsonZeroReportYn,	'L_FIT019', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 수입금액제외
            gfnma_setComSelect(['EXCLUDE_REVENUE_AMT_YN'],		jsonExcludeAmtYn,	'L_FIT008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 영세율구분
            gfnma_setComSelect(['ZERO_TYPE'],					jsonZeroType,		'L_FIT010', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 지급방법
            gfnma_setComSelect([],								jsonPayMethod,		'L_FIM081', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			
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
				,colValue		: 'RULE_CD'
				,colLabel		: 'RULE_NM'
				,columns		:[
		            {caption: "rule코드",		ref: 'RULE_CD',			width:'100px',  	style:'text-align:left'},
		            {caption: "rule코드명", 	ref: 'RULE_NM',    		width:'200px',  	style:'text-align:left'},
		            {caption: "전표유형", 		ref: 'SLIP_TYPE',    		width:'100px',  	style:'text-align:left'},
		            {caption: "ap_doc_yn", 		ref: 'APS_SLIP_YN',    		width:'100px',  	style:'text-align:left'},
		            {caption: "ar_doc_yn", 		ref: 'AR_SLIP_YN',    		width:'100px',  	style:'text-align:left'},
				]
			})
		]);
	}	
 
	async function fn_init(type) {
		
		if(type){
			//select init
	  		await fn_initSBSelect()
		}
		
		//그리드 셋팅
    	fn_createGrid2310();	
    	
		//화면셋팅
    	fn_state(pg_state);
	}    
    
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	
    	p_menu_param = localStorage.getItem("callMain");
    	if(p_menu_param){
    		p_menu_param = JSON.parse(p_menu_param);
    	}
    	localStorage.removeItem("callMain");
    	if(p_menu_param){
    		if(p_menu_param['STATE']=='new'){
        		pg_state = 'new';
    		} else {
	    		pg_state = 'edit';
    		}
    	} else {
    		pg_state = 'new';
    	}
    	
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
	    		if(p_menu_param['STATE']=='new'){
	        		pg_state = 'new';
	    		} else {
		    		pg_state = 'edit';
	    		}
		     	fn_init(false);
			}
		}
    });    
    
    /**
     * 화면 state 변경
     */
    function fn_state(type) {
    	
		if(type=='new'){
			cfn_add();
		} else if(type=='edit'){
			if(p_menu_param){
				console.log('p_menu_param ====>>> ', p_menu_param);			
				if(p_menu_param['DOC_ID']){
					
					SBUxMethod.set('sch-doc-id', 			gfnma_nvl(p_menu_param['DOC_ID']));
					SBUxMethod.set('sch-doc-name', 			gfnma_nvl(p_menu_param['DOC_NAME']));
					SBUxMethod.set('sch-doc-batch-no', 		gfnma_nvl(p_menu_param['DOC_BATCH_NO']));
					SBUxMethod.set('sch-dept-code', 		gfnma_nvl(p_menu_param['DEPT_CODE']));
					SBUxMethod.set('sch-dept-name', 		gfnma_nvl(p_menu_param['DEPT_NAME']));
					SBUxMethod.set('sch-tax-site-code', 	gfnma_nvl(p_menu_param['SITE_CODE']));
					SBUxMethod.set('sch-sub-tax-site-code',	gfnma_nvl(p_menu_param['SITE_CODE']));
					SBUxMethod.set('sch-doc-type',			gfnma_nvl(p_menu_param['DOC_TYPE']));
					SBUxMethod.set('sch-doc-status',		gfnma_nvl(p_menu_param['DOC_STATUS']));
					SBUxMethod.set('sch-currency-code', 	gfnma_nvl(p_menu_param['CURRENCY_CODE']));
					SBUxMethod.set('sch-description', 		gfnma_nvl(p_menu_param['DESCRIPTION']));
					SBUxMethod.set('sch-doc-date', 			gfnma_nvl(p_menu_param['DOC_DATE']));
					SBUxMethod.set('sch-posting-date', 		gfnma_nvl(p_menu_param['POSTING_DATE']));
					SBUxMethod.set('sch-acct-rule-code', 	gfnma_nvl(p_menu_param['ACCT_RULE_CODE']));
					
					fn_subSearch(function(){
						if(p_menu_param['WORK_TYPE']=='COPY'){
							SBUxMethod.set('sch-doc-id', 		'0');
							SBUxMethod.set('sch-doc-name', 		'');
							SBUxMethod.set('sch-doc-status', 	'1');
							SBUxMethod.set('sch-doc-date', 		gfnma_date4());
						}
						if(SBUxMethod.get('sch-doc-type')!='93'){
			    			$('#main-btn-save', parent.document).attr('disabled', true);
							if(SBUxMethod.get('sch-doc-status')=='1'){
								$('#main-btn-del', 	parent.document).attr('disabled', false);
							}
							$('#btn1-row-add').css('disabled', true);					
							$('#btn1-row-del').css('disabled', true);					
						}
					});
				}
				if(Number(SBUxMethod.get('sch-doc-id'))!=0){
					if(SBUxMethod.get('sch-doc-status')=='1'){
						$('#main-btn-del', 	parent.document).attr('disabled', false);
					}
				}
			}
		}
    }
    
    /**
     * 신규
     */
     var cfn_add = function() {
    	
		SBUxMethod.set("sch-txtinsert-userid", 	p_userId);
		SBUxMethod.set("sch-acct-rule-code", 	p_ss_defaultAcctRule);
		SBUxMethod.set("sch-doc-type", 			pg_strdoc_type);
		SBUxMethod.set("sch-doc-status", 		'1');
		SBUxMethod.set("sch-fi-org-code", 		p_ss_fiOrgCode);
		SBUxMethod.set("sch-cbosite-code", 		p_ss_siteCode);
		SBUxMethod.set("sch-dept-code", 		p_ss_deptCode);
		SBUxMethod.set("sch-dept-name", 		p_ss_deptName);
		SBUxMethod.set("sch-hold-flag", 		'Y');
		SBUxMethod.set("sch-tax-site-code", 	'T02');
		
		SBUxMethod.attr('sch-acct-rule-code', 	'disabled', false);
		SBUxMethod.attr('sch-fi-org-code', 		'disabled', false);
		SBUxMethod.attr('sch-cbosite-code', 	'disabled', false);
		
		SBUxMethod.set("sch-doc-date", 			gfnma_date4());
		SBUxMethod.set("sch-currency-code", 	p_ss_currCode);
		SBUxMethod.set("sch-exchange-rate", 	'1');
		
		var strinvoice_status_code = SBUxMethod.get('sch-doc-status');
		console.log('strinvoice_status_code:', strinvoice_status_code);		
		fn_enableSet(strinvoice_status_code);
		
		pg_vat_type_bizId		= 'P_NOT_ACCOUNT_POPUP_Q';
		
		SBUxMethod.set("sch-txtsource-type2", 	'MANUAL');
		if(pg_strdoc_type == '92'){
			pg_colcs_code_bizId 		= 'P_CS_PURCHASE';
    		pg_colcs_code_title 		= '거래처 (구매)';
    		pg_colpay_term_code_bizId 	= 'P_PAY_DATE_P';
    		SBUxMethod.set("sch-txtsource-type2", 	'AP');
		}
		
		fn_setFig2310Grid('DEFAULTRULE', function(){
		});		
		
    }
 
     /**
      * 콤포넌트 활성화
      */    
	var fn_enableSet = function(code) {
    	
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
        		
        		var insert_userid = SBUxMethod.get('sch-txtinsert-userid');
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
        		
        		var confirm_emp_code 		= SBUxMethod.get('sch-txtconfirm-emp-code');
        		var proxy_emp_code 			= SBUxMethod.get('sch-txtproxy-emp-code');
        		
        		var insert_userid			= SBUxMethod.get('sch-txtinsert-userid');
        		var appr_id					= SBUxMethod.get('sch-txtappr-id');
        		
        		if( confirm_emp_code != p_ss_empCode && proxy_emp_code != p_ss_empCode ){
            		SBUxMethod.attr('sch-btn-submit', 		'disabled', true);
        		}
        		if( insert_userid == p_userId || !p_summit_yn ){
        			$('#main-btn-save', parent.document).attr('disabled', 	true);
        			$('#main-btn-del', parent.document).attr('disabled', 	true);
        		}
        		if(!appr_id){
            		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', 	true);
        		}
        	
        	} else if(code=='5'){
        		
        		//승인완료
    			$('#main-btn-save', parent.document).attr('disabled', false);
    			$('#main-btn-del', parent.document).attr('disabled', false);
        		
        		SBUxMethod.attr('sch-btn-submit', 		'disabled', true);
        		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', true);
           		SBUxMethod.attr('sch-btn-end', 			'disabled', false);
        		SBUxMethod.attr('sch-btn-cancel', 		'disabled', true);
 
        		$('#btn1-row-add').attr('disabled', 	true);
        		$('#btn1-row-del').attr('disabled', 	true);
        		
        		SBUxMethod.attr('sch-btn-release', 		'disabled', true);
        		SBUxMethod.attr('sch-btn-unrelease', 	'disabled', true);
 
        		var insert_userid		= SBUxMethod.get('sch-txtinsert-userid');
        		if(insert_userid == p_userId || !p_summit_yn){
        			$('#main-btn-save', parent.document).attr('disabled', true);
        			$('#main-btn-del', parent.document).attr('disabled', true);
            		$('#btn1-row-add').attr('disabled', 	false);
            		$('#btn1-row-del').attr('disabled', 	false);
        		}
        		
                //본인이 등록했고 본인만 결제권자 였으면 반려 가능
        		var appr_acount			= SBUxMethod.get('sch-numappr-count');
        		appr_acount = (appr_acount=="") ? '0' : appr_acount;
        		if(insert_userid == p_userId && appr_acount == "1" ){
            		SBUxMethod.attr('sch-btn-submit', 		'disabled', false);
        			$('#main-btn-del', parent.document).attr('disabled', true);
        		}
        		
        		if(appr_acount != "0" ){
            		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', false);
        		}
 
        	} else {
        		
    			$('#main-btn-save', parent.document).attr('disabled', false);
    			$('#main-btn-del', parent.document).attr('disabled', false);
    			
        		SBUxMethod.attr('sch-btn-submit', 		'disabled', true);
        		var appr_id			= SBUxMethod.get('sch-txtappr-id');
        		if(appr_id == ""){
            		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', true);
        		} else {
            		SBUxMethod.attr('sch-btn-confirmHist', 	'disabled', false);
        		}
        		SBUxMethod.attr('sch-btn-end', 		'disabled', true);
    			
        		var posting_date	= SBUxMethod.get('sch-posting-date');
        		var txtentry_path	= SBUxMethod.get('sch-txtentry-path');
        		if(posting_date != "" && txtentry_path != "REVERSE"){
        			$('#main-btn-cancel', parent.document).attr('disabled', false);
        		} else {
        			$('#main-btn-cancel', parent.document).attr('disabled', true);
        		}
        		$('#btn1-row-add').attr('disabled', 	true);
        		$('#btn1-row-del').attr('disabled', 	true);
        		
        		SBUxMethod.attr('sch-btn-release', 		'disabled', false);
        		SBUxMethod.attr('sch-btn-unrelease', 	'disabled', false);
        	}
    		
    		var insert_userid		= SBUxMethod.get('sch-txtinsert-userid');
    		if(p_ss_isAccountManager || code=='1' || insert_userid == p_userId ){
                //panHeader.ActionMode = ActionMode.Save;
                //gvwInfo.ActionMode = ActionMode.Save;
    		} else {
                //panHeader.ActionMode = ActionMode.View;
                //gvwInfo.ActionMode = ActionMode.View;
    		}
    		
    	}       	 
    	 
    }
    
    function fn_createGrid2310() {
    	
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTop';
	    SBGridProperties.id 				= 'Fig2310Grid';
	    SBGridProperties.jsonref 			= 'jsonFig2310';
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
            {caption: ["부가세유형명"], 			ref: 'VAT_NAME', 				type:'input',		width:'100px',  	style:'text-align:left'},
            
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
            {caption: ["통화"],						ref: 'CURRENCY_CODE', 			type:'combo',  		width:'100px',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonCurrencyCode',
					label		: 'label',
					value		: 'value',
					displayui :true, 
					oneclickedit: true
            	}
            },
            
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
            
            {caption: ["프로젝트코드"], 			ref: 'PROJECT_CODE',			type:'input',  		width:'100px',  	style:'text-align:left'},
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
            {caption: ["지급방법"], 				ref: 'PAY_METHOD_NAME', 		type:'output', 		width:'150px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn7',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup8(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["지급방법코드"],				ref: 'PAY_METHOD', 				type:'output',		width:'100px',  	style:'text-align:left', hidden:true},
            
			{caption: ['지급기일'],					ref: 'EXPECTED_PAY_DATE',		type:'datepicker',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	}, width:'150px', style:'text-align:center'},	
            {caption: ["지급일기준"], 				ref: 'BASIS_TYPE', 				type:'input',		width:'100px',  	style:'text-align:left'},
            {caption: ["환율"], 					ref: 'EXCHANGE_RATE', 			type:'input',		width:'100px',  	style:'text-align:right'},
            {caption: ["원천징수여부"], 			ref: 'WITHHOLD_FLAG', 			type:'checkbox', 	width:'120px', 		style:'text-align:center', typeinfo: { ignoreupdate: false, checkedvalue: 'Y', uncheckedvalue: 'N'}},        	

            {caption: ["원천징수세금코드"],			ref: 'WITHHOLD_TAX_TYPE', 		type:'output', 		width:'150px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn8',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup9(event," + "1," + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["원천징수세금코드"],			ref: 'WITHHOLD_TAX_CODE', 		type:'output',		width:'100px',  	style:'text-align:left', hidden:true},

            {caption: ["원천징수거래처"], 			ref: 'WITHHOLD_CS_CODE', 		type:'input',		width:'200px',  	style:'text-align:left'},

            {caption: ["원천징수세금코드2"],		ref: 'WITHHOLD_TAX_TYPE2', 		type:'output', 		width:'150px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn9',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup9(event," + "2," + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["원천징수세금코드2"],		ref: 'WITHHOLD_TAX_CODE2', 		type:'output',		width:'100px',  	style:'text-align:left', hidden:true},
  
            {caption: ["원천징수거래처2"], 			ref: 'WITHHOLD_CS_CODE2', 		type:'input',		width:'200px',  	style:'text-align:left'},
          
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
            
            {caption: ["계좌행번"], 				ref: 'SEQ_NAME', 				type:'output', 		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn10',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup10(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["계좌행번"],					ref: 'BANK_ACCOUNT_SEQ', 		type:'output',		width:'100px',  	style:'text-align:left', hidden:true},
			
        ];
 
        Fig2310Grid = _SBGrid.create(SBGridProperties);
        Fig2310Grid.bind('valuechanged', 	'fn_comboValFig2310GridEvent')
        Fig2310Grid.bind('click', 			'fn_viewFig2310GridEvent');
    }    
    
    //콤보, 인풋박스 이벤트
    const fn_comboValFig2310GridEvent = async function() {
    	
        let nRow = Fig2310Grid.getRow(); // 클릭한 Row Index 추출
        let nCol = Fig2310Grid.getCol(); // 클릭한 Col Index 추출
 
        let rowData 	= Fig2310Grid.getRowData(nRow);
        let cellValue 	= Fig2310Grid.getCellData(nRow, nCol); 	
		fn_getFig2310Grid(rowData);
        
   		if (Fig2310Grid.getRefOfCol(nCol) == 'LINE_TYPE') {	
	        let comboItem = jsonLineType.find(item => item.value === cellValue); 
	        if (comboItem) { 					
	            let value = comboItem.value; 	
	            console.log('추출된 Value:', value);
				if(value=='3'){
					//부가세
					SBUxMethod.selectTab('tab_norm','tab1');
				} else {
					SBUxMethod.selectTab('tab_norm','tab2');
				}
	        }	
        } else if (Fig2310Grid.getRefOfCol(nCol) == 'PAY_TERM_CODE') {			
        	var p_doc_date	= gfnma_nvl(SBUxMethod.get("sch-doc-date"));
        	if(rowData['PAY_TERM_CODE'] && p_doc_date){
        		var ht1 = await fn_getExpectedPayDate('Q', rowData['PAY_TERM_CODE'], gfnma_date7(gfnma_nvl(SBUxMethod.get("sch-doc-date"))), '');
        		if(ht1[0]['EXPECTED_PAY_DATE'] == 'X'){
        			Fig2310Grid.setCellData(nRow, 27, gfnma_date7(gfnma_nvl(SBUxMethod.get("sch-doc-date"))), true, true);	
        			Fig2310Grid.setCellData(nRow, 33, '', true, true);	
        		} else {
            		var ht2 = await fn_getExpectedPayDate('Q', rowData['PAY_TERM_CODE'], gfnma_date7(gfnma_nvl(SBUxMethod.get("sch-doc-date"))), 'PAY_BASE_DATE');
        			Fig2310Grid.setCellData(nRow, 51, ht2[0]['EXPECTED_PAY_DATE'], true, true);	
        			Fig2310Grid.setCellData(nRow, 33, ht1[0]['EXPECTED_PAY_DATE'], true, true);	
        		}	
        	}
        } else if (Fig2310Grid.getRefOfCol(nCol) == 'BASIS_TYPE') {			
        	if(rowData['BASIS_TYPE']=='5'){
    			Fig2310Grid.setCellData(nRow, 51, gfnma_date7(gfnma_nvl(SBUxMethod.get("sch-doc-date"))), true, true);	
    			Fig2310Grid.setCellData(nRow, 33, '', true, true);	
        	} else {
        		var ht2 = await fn_getExpectedPayDate('Q', rowData['PAY_TERM_CODE'], gfnma_date7(gfnma_nvl(SBUxMethod.get("sch-doc-date"))), 'PAY_BASE_DATE');
    			Fig2310Grid.setCellData(nRow, 51, ht2[0]['EXPECTED_PAY_DATE'], true, true);	
    			Fig2310Grid.setCellData(nRow, 33, rowData['EXPECTED_PAY_DATE'], true, true);	
        	}
        } else if(Fig2310Grid.getRefOfCol(nCol) == 'ORIGINAL_AMT'){
			var calNum = Number(rowData['ORIGINAL_AMT']) * Number(rowData['EXCHANGE_RATE']);
			calNum = gfnma_getRound(calNum, Number(p_ss_currUnit));
			Fig2310Grid.setCellData(nRow, 15, calNum, true, true);	//FUNCTIONAL_AMT
	    	fn_gridTotal();            
        } else if(Fig2310Grid.getRefOfCol(nCol) == 'DEBIT_CREDIT'){
        	if(!rowData['ACCOUNT_CODE'] || !rowData['ACCOUNT_NAME']){
        		return;
        	}
			SBUxMethod.set('sch-txtdebit-credit', rowData['DEBIT_CREDIT']);
	    	fn_gridTotal();            
        } else if(Fig2310Grid.getRefOfCol(nCol) == 'CS_NAME' || Fig2310Grid.getRefOfCol(nCol) == 'CS_CODE' ){
        	var temp1 = "A.CS_CODE like '" + rowData['CS_CODE'] + "'";  //다중채무전표의 부가세 세금라인 제거
        	fn_gridPopup10Show(nRow, 55, '', '', temp1);
        } else if(Fig2310Grid.getRefOfCol(nCol) == 'VAT_TYPE' || Fig2310Grid.getRefOfCol(nCol) == 'VAT_NAME' || Fig2310Grid.getRefOfCol(nCol) == 'TMP_ACCOUNT_CODE' || Fig2310Grid.getRefOfCol(nCol) == 'TMP_ACCOUNT_NAME' ){
        	if(rowData['VAT_TYPE'] && rowData['VAT_NAME'] && rowData['LINE_TYPE'] == '3'){
    			Fig2310Grid.setCellData(nRow, 11, rowData['TMP_ACCOUNT_CODE'], true, true);
    			Fig2310Grid.setCellData(nRow, 13, rowData['TMP_ACCOUNT_NAME'], true, true);
        	} else {
    			Fig2310Grid.setCellData(nRow, 11, '', true, true);
    			Fig2310Grid.setCellData(nRow, 13, '', true, true);
        	}
        }    	
    }    
    
    //상세정보 보기
    function fn_viewFig2310GridEvent() {
    	
    	let nRow = Fig2310Grid.getRow();
    	let nCol = Fig2310Grid.getCol();
		if (nRow < 1) {
            return;
		}
		p_sel_row = nRow;
		p_sel_col = nCol;
		
        let rowData = Fig2310Grid.getRowData(nRow);
		fn_getFig2310Grid(rowData);
		
		if(rowData['LINE_TYPE']=='3'){
			//부가세
			SBUxMethod.selectTab('tab_norm','tab1');
		} else {
			SBUxMethod.selectTab('tab_norm','tab2');
		}
    }    
    
    //그리드 값 가져오기
    function fn_getFig2310Grid(rowData) {
		//console.log('fn_getFig2210Grid:', rowData);        
    	gfnma_uxDataClear('#tab1');
    	gfnma_uxDataClear('#tab2');
    	$('.cu-tab2-fom-area').text('');
    	
        gfnma_uxDataSet('#tab1', rowData);
        gfnma_uxDataSet('#tab2', rowData);
    }
    
    
    /**
     * 그리드내 팝업(부가세유형) 조회
     */
	function fn_gridPopup1(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310Grid.getCellData(row, 5) 
        let cellData2 = Fig2310Grid.getCellData(row, 7) 
    	fn_gridPopup1Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(부가세유형) 오픈
     */
    var fn_gridPopup1Show = function(row, col, cellData1, cellData2) {
    	
        var searchText1 	= cellData1;
        var searchText2 	= cellData2;
        var today			= "'" + gfnma_date6() + "'";
    	var addParams = [today];	
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부가세유형');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: pg_vat_type_bizId
       		,popupType				: 'B'
    		,whereClause			: addParams
       		,searchCaptions			: ["부가세코드", 	"부가세명",		]
   			,searchInputFields		: ["VAT_CD", 		"VAT_NM",		]
   			,searchInputValues		: [searchText1, 	searchText2,	]
			,searchInputTypes		: ["input", 		"input",		]		//input, datepicker가 있는 경우
    		,width					: '600px'
    		,height					: '300px'
   			,tableHeader			: ["부가세코드", 	"부가세명",		"부가세유형",		"불공제여부"]
   			,tableColumnNames		: ["VAT_CD", 		"VAT_NM",		"VAT_TYPE_CD",	"NDDC_YN"]
   			,tableColumnWidths		: ["100px", 		"200px",		"100px",			"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2310Grid.setCellData(row, 5, 	data['VAT_CD'], true, true);
				Fig2310Grid.setCellData(row, 7, 	data['VAT_NM'], true, true);
				jsonFig2310[row-1]['NONDED_YN'] = data['NDDC_YN'];
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
    
    /**
     * 그리드내 팝업(거래처) 조회
     */
	function fn_gridPopup2(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310Grid.getCellData(row, 8) 
        let cellData2 = Fig2310Grid.getCellData(row, 10) 
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
    	
        var replaceText0 	= "_CNPT_CD_";
        var replaceText1 	= "_BRNO_"; 
        var replaceText2 	= "_CNPT_NM_"; 
        var strWhereClause 	= "AND A.CNPT_CD LIKE '%" + replaceText0 + "%' AND A.BRNO LIKE '%" + replaceText1 + "%' " + " AND A.CNPT_NM LIKE '%" + replaceText2 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', pg_colcs_code_title);
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: pg_colcs_code_bizId
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["고객사코드", 	"사업자번호",	"고객사명"]
   			,searchInputFields		: ["CNPT_CD", 		"BRNO",	"CNPT_NM"]
   			,searchInputValues		: [cellData1, 		'',				cellData2]
			,searchInputTypes		: ["input", 		"input",		"input"]		//input, datepicker가 있는 경우
    		,width					: '1000px'
    		,height					: '500px'
   			,tableHeader			: ["거래처코드", 	"거래처명",		"사업자번호",		"거래중지여부",		"거래처유형",	"구매처",		"판매처",	"수금기준",			"수금기준명",		"수금방법",		"원천세대상여부"]
   			,tableColumnNames		: ["CNPT_CD", 		"CNPT_NM",		"BRNO",		"TRSC_HLT_YN",		"CNPT_GROUP",		"PCPL_YN",	"SLS_CNPT_YN",	"PAY_TERM_CD",	"PAY_TERM_NM",	"PAY_MTHD",	"WTHD_TX_YN"]
   			,tableColumnWidths		: ["80px", 			"200px",		"100px",			"100px",			"200px",		"70px",			"70px",		"70px",				"150px",			"70px",			"120px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2310Grid.setCellData(row, 8, 	data['CNPT_CD'], true, true);
				Fig2310Grid.setCellData(row, 10, 	data['CNPT_NM'], true, true);
				jsonFig2310[row-1]['TXN_STOP_YN'] = data['TRSC_HLT_YN'];
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }     
    
    /**
     * 그리드내 팝업(계정코드) 조회
     */
	function fn_gridPopup3(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310Grid.getCellData(row, 11) 
        let cellData2 = Fig2310Grid.getCellData(row, 13) 
    	fn_gridPopup3Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(계정과목명) 오픈
     */
    var fn_gridPopup3Show = function(row, col, cellData1, cellData2) {
    	
        var nRow 			= Fig2310Grid.getRow();
        var rowData 		= Fig2310Grid.getRowData(nRow);
    	var pp_open_to_all	= "'" + gfnma_nvl(SBUxMethod.get("sch-reverse-flag")) + "'"; 
        
        var searchText1 	= cellData1;
        var searchText2 	= cellData2;
    	var addParams 		= [pp_open_to_all];	
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FIM045'
       		,popupType				: 'B'
    		,whereClause			: addParams
       		,searchCaptions			: ["계정코드", 		"계정명"]
   			,searchInputFields		: ["ACNTL_CD", 		"ACNT_NM"]
   			,searchInputValues		: [searchText1, 	searchText2]
			,searchInputTypes		: ["input", 		"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드", 		"계정명",		"계정명(한글)"]
   			,tableColumnNames		: ["ACNTL_CD", 		"ACNT_NM",		"ACNT_NM_CHN"]
   			,tableColumnWidths		: ["100px", 		"250px",		"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2310Grid.setCellData(row, 11, 	data['ACNTL_CD'], true, true);
				Fig2310Grid.setCellData(row, 13, 	data['ACNT_NM'], true, true);
				
				jsonFig2310[row-1]['ACC_ITEM_CODE1'] = data['ACNT_MNG_ARTCL_CD1'];
				jsonFig2310[row-1]['ACC_ITEM_CODE2'] = data['ACNT_MNG_ARTCL_CD2'];
				jsonFig2310[row-1]['ACC_ITEM_CODE3'] = data['ACNT_MNG_ARTCL_CD3'];
				jsonFig2310[row-1]['ACC_ITEM_CODE4'] = data['ACNT_MNG_ARTCL_CD4'];
				jsonFig2310[row-1]['ACC_ITEM_CODE5'] = data['ACNT_MNG_ARTCL_CD5'];
				jsonFig2310[row-1]['ACC_ITEM_CODE6'] = data['ACNT_MNG_ARTCL_CD6'];
				jsonFig2310[row-1]['ACC_ITEM_CODE7'] = data['ACNT_MNG_ARTCL_CD7'];
				jsonFig2310[row-1]['ACC_ITEM_CODE8'] = data['ACNT_MNG_ARTCL_CD8'];
				jsonFig2310[row-1]['ACC_ITEM_CODE9'] = data['ACNT_MNG_ARTCL_CD9'];
				jsonFig2310[row-1]['ACC_ITEM_CODE10'] = data['ACNT_MNG_ARTCL_CD10'];
				
				jsonFig2310[row-1]['ACC_ITEM_NAME1'] = data['ACNT_MNG_ARTCL_NM1'];
				jsonFig2310[row-1]['ACC_ITEM_NAME2'] = data['ACNT_MNG_ARTCL_NM2'];
				jsonFig2310[row-1]['ACC_ITEM_NAME3'] = data['ACNT_MNG_ARTCL_NM3'];
				jsonFig2310[row-1]['ACC_ITEM_NAME4'] = data['ACNT_MNG_ARTCL_NM4'];
				jsonFig2310[row-1]['ACC_ITEM_NAME5'] = data['ACNT_MNG_ARTCL_NM5'];
				jsonFig2310[row-1]['ACC_ITEM_NAME6'] = data['ACNT_MNG_ARTCL_NM6'];
				jsonFig2310[row-1]['ACC_ITEM_NAME7'] = data['ACNT_MNG_ARTCL_NM7'];
				jsonFig2310[row-1]['ACC_ITEM_NAME8'] = data['ACNT_MNG_ARTCL_NM8'];
				jsonFig2310[row-1]['ACC_ITEM_NAME9'] = data['ACNT_MNG_ARTCL_NM9'];
				jsonFig2310[row-1]['ACC_ITEM_NAME10'] = data['ACNT_MNG_ARTCL_NM10'];
				
				jsonFig2310[row-1]['DATA_TYPE1'] = data['DATA_TYPE1'];
				jsonFig2310[row-1]['DATA_TYPE2'] = data['DATA_TYPE2'];
				jsonFig2310[row-1]['DATA_TYPE3'] = data['DATA_TYPE3'];
				jsonFig2310[row-1]['DATA_TYPE4'] = data['DATA_TYPE4'];
				jsonFig2310[row-1]['DATA_TYPE5'] = data['DATA_TYPE5'];
				jsonFig2310[row-1]['DATA_TYPE6'] = data['DATA_TYPE6'];
				jsonFig2310[row-1]['DATA_TYPE7'] = data['DATA_TYPE7'];
				jsonFig2310[row-1]['DATA_TYPE8'] = data['DATA_TYPE8'];
				jsonFig2310[row-1]['DATA_TYPE9'] = data['DATA_TYPE9'];
				jsonFig2310[row-1]['DATA_TYPE10'] = data['DATA_TYPE10'];
				
				jsonFig2310[row-1]['POPUP_ID1'] = data['POPUP_ID1'];
				jsonFig2310[row-1]['POPUP_ID2'] = data['POPUP_ID2'];
				jsonFig2310[row-1]['POPUP_ID3'] = data['POPUP_ID3'];
				jsonFig2310[row-1]['POPUP_ID4'] = data['POPUP_ID4'];
				jsonFig2310[row-1]['POPUP_ID5'] = data['POPUP_ID5'];
				jsonFig2310[row-1]['POPUP_ID6'] = data['POPUP_ID6'];
				jsonFig2310[row-1]['POPUP_ID7'] = data['POPUP_ID7'];
				jsonFig2310[row-1]['POPUP_ID8'] = data['POPUP_ID8'];
				jsonFig2310[row-1]['POPUP_ID9'] = data['POPUP_ID9'];
				jsonFig2310[row-1]['POPUP_ID10'] = data['POPUP_ID10'];
				
				jsonFig2310[row-1]['ACC_ITEM_YN1'] = data['ACNT_MNG_ARTCL_YN1'];
				jsonFig2310[row-1]['ACC_ITEM_YN2'] = data['ACNT_MNG_ARTCL_YN2'];
				jsonFig2310[row-1]['ACC_ITEM_YN3'] = data['ACNT_MNG_ARTCL_YN3'];
				jsonFig2310[row-1]['ACC_ITEM_YN4'] = data['ACNT_MNG_ARTCL_YN4'];
				jsonFig2310[row-1]['ACC_ITEM_YN5'] = data['ACNT_MNG_ARTCL_YN5'];
				jsonFig2310[row-1]['ACC_ITEM_YN6'] = data['ACNT_MNG_ARTCL_YN6'];
				jsonFig2310[row-1]['ACC_ITEM_YN7'] = data['ACNT_MNG_ARTCL_YN7'];
				jsonFig2310[row-1]['ACC_ITEM_YN8'] = data['ACNT_MNG_ARTCL_YN8'];
				jsonFig2310[row-1]['ACC_ITEM_YN9'] = data['ACNT_MNG_ARTCL_YN9'];
				jsonFig2310[row-1]['ACC_ITEM_YN10'] = data['ACNT_MNG_ARTCL_YN10'];
				
				jsonFig2310[row-1]['ACC_CATEGORY'] 	= data['ACNT_CTGRY'];
				jsonFig2310[row-1]['PROJECT_YN'] 	= data['PJT_YN'];
				jsonFig2310[row-1]['COST_CLASS'] 	= data['CST_CLSF'];
				
				fn_getFig2310Grid(jsonFig2310[row-1]);				
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }      
    
    /**
     * 그리드내 팝업(부서) 조회
     */
	function fn_gridPopup4(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310Grid.getCellData(row, 18) 
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
   			,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
   			,searchInputValues		: [searchText1, 	searchText2,	searchText3]
			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '300px'
   			,tableHeader			: ["부서코드", 		"부서명"]
   			,tableColumnNames		: ["DEPT_CD", 	"DEPT_NM"]
   			,tableColumnWidths		: ["100px", 		"500px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2310Grid.setCellData(row, 18, 	data['DEPT_NM'], true, true);
				Fig2310Grid.setCellData(row, 20, 	data['DEPT_CD'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }      
    
    /**
     * 그리드내 팝업(원가중심점코드) 조회
     */
	function fn_gridPopup5(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310Grid.getCellData(row, 21) 
        let cellData2 = Fig2310Grid.getCellData(row, 23) 
    	fn_gridPopup5Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(원가중심점코드) 오픈
     */
    var fn_gridPopup5Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_CSTCT_CD_";
        var replaceText1 	= "_CSTCT_NM_"; 
        var strWhereClause 	= "AND CSTCT_CD LIKE '%" + replaceText0 + "%' AND CSTCT_NM LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_CC_INPUT'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["CSTCT_CD", 	"CSTCT_NM"]
   			,searchInputValues		: [cellData1, 			cellData2]
			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '300px'
   			,tableHeader			: ["코드", 				"명칭",				"부서코드",		"부서명",		"사업장"]
   			,tableColumnNames		: ["CSTCT_CD", 	"CSTCT_NM",	"DEPT_CD",	"DEPT_NM",	"SITE_CD"]	
   			,tableColumnWidths		: ["150px", 		"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2310Grid.setCellData(row, 21, 	data['CSTCT_CD'], true, true);
				Fig2310Grid.setCellData(row, 23, 	data['CSTCT_NM'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }   
    
    /**
     * 그리드내 팝업(프로젝트코드) 조회
     */
	function fn_gridPopup6(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310Grid.getCellData(row, 24) 
        let cellData2 = Fig2310Grid.getCellData(row, 26) 
    	fn_gridPopup6Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(프로젝트코드) 오픈
     */
    var fn_gridPopup6Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_PJT_CD_";
        var replaceText1 	= "_PJT_NM_"; 
        var strWhereClause 	= "AND PJT_CD LIKE '%" + replaceText0 + "%' AND PJT_NM LIKE '%" + replaceText1 + "%' ";
		
		SBUxMethod.attr('modal-compopup1', 'header-title', '프로젝트');
		compopup1({
			compCode				: gv_ma_selectedCorpCd
			,clientCode				: gv_ma_selectedClntCd
			,bizcompId				: 'P_COM028' 
			,popupType				: 'A'
			,whereClause			: strWhereClause
			,searchCaptions			: ["프로젝트코드",		"프로젝트명"]
			,searchInputFields		: ["PJT_CD",			"PJT_NM"]
			,searchInputValues		: [cellData1, 			cellData2]
			,searchInputTypes		: ["input", 			"input"]		//input, select가 있는 경우
			,searchInputTypeValues	: ["", 					""]				//select 경우
			,width					: '700px'
			,height					: '400px'
			,tableHeader			: ["프로젝트코드", 		"프로젝트명"]
			,tableColumnNames		: ["PJT_CD", 			"PJT_NM"]
			,tableColumnWidths		: ["100px", 			"500px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2310Grid.setCellData(row, 24, 	data['PJT_CD'], true, true);
				Fig2310Grid.setCellData(row, 26, 	data['PJT_NM'], true, true);
			},
		});
		SBUxMethod.openModal('modal-compopup1');
    }          
    
    /**
     * 그리드내 팝업(지급기준) 조회
     */
	function fn_gridPopup7(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310Grid.getCellData(row, 27) 
        let cellData2 = Fig2310Grid.getCellData(row, 29) 
    	fn_gridPopup7Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(지급기준) 오픈
     */
    var fn_gridPopup7Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_PAY_TERM_CD_";
        var replaceText1 	= "_PAY_TERM_NM_"; 
        var strWhereClause 	= "AND A.PAY_TERM_CD LIKE '%" + replaceText0 + "%' AND A.PAY_TERM_NM LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '지급기일정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: pg_colpay_term_code_bizId
       		,popupType				: 'A'
       		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["PAY_TERM_CD", 	"PAY_TERM_NM"]
   			,searchInputValues		: [cellData1, 			cellData2]
   			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '500px'
   			,tableHeader			: ["지급기일코드", 		"지급기일명",		"지급기준"	]
   			,tableColumnNames		: ["PAY_TERM_CD", 	"PAY_TERM_NM",	"PAY_METHOD_NAME"]
   			,tableColumnWidths		: ["100px", 			"250px",			"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2310Grid.setCellData(row, 27, 	data['PAY_TERM_CD'], true, true);
				Fig2310Grid.setCellData(row, 29, 	data['PAY_TERM_NM'], true, true);
				Fig2310Grid.setCellData(row, 30, 	data['PAY_METHOD_NAME'], true, true);
				Fig2310Grid.setCellData(row, 32, 	data['PAY_MTHD'], true, true);
				Fig2310Grid.setCellData(row, 34, 	data['BASE_CRN_CD'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }          
    
    /**
     * 그리드내 팝업(지급방법) 조회
     */
	function fn_gridPopup8(event, row, col) {
		event.stopPropagation();
        let cellData1 = Fig2310Grid.getCellData(row, 32) 
        let cellData2 = Fig2310Grid.getCellData(row, 30) 
    	fn_gridPopup8Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(지급방법) 오픈
     */
    var fn_gridPopup8Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_SBSD_CD_";
        var replaceText1 	= "_CD_NM_"; 
        var strWhereClause 	= "AND SBSD_CD LIKE '%" + replaceText0 + "%' AND CD_NM LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '지급방법');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_FIM081'
       		,popupType				: 'A'
       		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"코드명"]
   			,searchInputFields		: ["SBSD_CD", 			"CD_NM"]
   			,searchInputValues		: [cellData1, 			cellData2]
   			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '900px'
    		,height					: '500px'
   			,tableHeader			: ["코드",		"코드명", 			"은행",			"계좌번호",			"계좌코드"]
   			,tableColumnNames		: ["SBSD_CD",	"CD_NM", 			"BANK_CD",		"ACTNO",			"DPMNY_CD"]
   			,tableColumnWidths		: ["100px", 	"200px",			"100px",		"200px",			"200px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2310Grid.setCellData(row, 30, 	data['CD_NM'], true, true);
				Fig2310Grid.setCellData(row, 32, 	data['SBSD_CD'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }          
    
    /**
     * 그리드내 팝업(원천징수세금코드) 조회
     */
	function fn_gridPopup9(event, type, row, col) {
		event.stopPropagation();	
        let cellData1 = ''; 
        let cellData2 = ''; 
        if(type=='1'){
            cellData1 = Fig2310Grid.getCellData(row, 39) 
            cellData2 = Fig2310Grid.getCellData(row, 37) 
        } else {
            cellData1 = Fig2310Grid.getCellData(row, 43) 
            cellData2 = Fig2310Grid.getCellData(row, 41) 
        }
    	fn_gridPopup9Show(type, row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(원천징수세금코드) 오픈
     */
    var fn_gridPopup9Show = function(type, row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_TX_TYPE_CD_";
        var replaceText1 	= "_TX_TYPE_NM_"; 
        var strWhereClause 	= "AND A.TX_TYPE_CD LIKE '%" + replaceText0 + "%' AND A.TX_TYPE_NM LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원천징수세금코드');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_WITHHOLD_TAX_TYPE'
       		,popupType				: 'A'
       		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"코드명"]
   			,searchInputFields		: ["TX_TYPE_CD", 	"TX_TYPE_NM"]
   			,searchInputValues		: [cellData1, 			cellData2]
   			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '900px'
    		,height					: '500px'
   			,tableHeader			: ["원천세코드",		"원천세명", 		"세율구분",		"구분명",			"원천세율"]
   			,tableColumnNames		: ["TX_TYPE_CD",		"TX_TYPE_NM", 	"TX_GROUP",	"TAX_GROUP_NAME",	"TX_RT"]
   			,tableColumnWidths		: ["100px", 			"200px",			"100px",		"200px",			"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				if(type=='1'){
					Fig2310Grid.setCellData(row, 37, 	data['TX_TYPE_NM'], true, true);
					Fig2310Grid.setCellData(row, 39, 	data['TX_TYPE_CD'], true, true);
				} else {
					Fig2310Grid.setCellData(row, 41, 	data['TX_TYPE_NM'], true, true);
					Fig2310Grid.setCellData(row, 43, 	data['TX_TYPE_CD'], true, true);
				}
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }          
    
    
    /**
     * 그리드내 팝업(계좌행번) 조회
     */
	function fn_gridPopup10(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310Grid.getCellData(row, 8)		//거래처 
        let cellData2 = Fig2310Grid.getCellData(row, 33) 	//지급기일
        if(!cellData1 || !cellData2){
        	gfn_comAlert("E0000","거래처 및 지급기일을 입력하세요");
        	return;	
        }
    	fn_gridPopup10Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(계좌행번) 오픈
     */
    var fn_gridPopup10Show = function(row, col, cellData1, cellData2, otherWhere) {
    	
    	cellData2			= cellData2.replace(/-/gi, "");
        var replaceText0 	= "_" + pg_colcs_code_field1 + "_";
        var replaceText1 	= "_PAY_PRNMNT_YMD_"; 
        var strWhereClause 	= "AND A." + pg_colcs_code_field1 + " LIKE '%" + replaceText0 + "%' AND '" + replaceText1 + "' BETWEEN A.EFCT_BGNG_YMD AND A.EFCT_END_YMD";
        //"AND A.CNPT_CD LIKE '%100004%' AND '20240802' BETWEEN A.EFCT_BGNG_YMD AND A.EFFECT_END_DATE"        
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계좌행번');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_CS_ACCOUNT'
       		,popupType				: 'A'
    		,whereClause			: (otherWhere ? otherWhere : strWhereClause)
       		,searchCaptions			: ["거래처코드", 			"지급기일"]
   			,searchInputFields		: [pg_colcs_code_field1, 	"PAY_PRNMNT_YMD"]
   			,searchInputValues		: [cellData1, 				cellData2]
			,searchInputTypes		: ["input", 				"input"]		//input, datepicker가 있는 경우
    		,width					: '1000px'
    		,height					: '500px'
   			,tableHeader			: ["행번", 				"행번명",		"은행코드",			"은행명",			"계좌번호",			"비고",			"계좌주",				"거래처",			"시작일",				"종료일",			"복수등록"]
   			,tableColumnNames		: ["BACNT_SEQ", 	"SEQ_NAME",		"BANK_CD",		"BANK_NM",		"BACNT_NO",	"DSCTN",	"BACNT_OWNR",	"CNPT_CD",			"EFCT_BGNG_YMD",	"EFCT_END_YMD",	"BNKCNT"]
   			,tableColumnWidths		: ["50px", 				"80px",			"80px",				"150px",			"150px",			"200px",		"200px",				"100px",			"80px",					"80px",				"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2310Grid.setCellData(row, 55, 	data['SEQ_NAME'], true, true);
				Fig2310Grid.setCellData(row, 57, 	data['BACNT_SEQ'], true, true);
				//Fig2310Grid.setCellData(row, 37, 	data['BACNT_NO'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }        
    
    /**
     * 미결반제전표 생성
     */
    var fn_addItem = function() {
    	
        var obj = {
        	'MENU_MOVE'		: 'Y'	
        	,'target'		: 'MA_A20_030_020_001'
        }
        let json = JSON.stringify(obj);
        window.parent.cfn_openTabSearch(json);
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
   			,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
   			,searchInputValues		: ["", 				p_find1,		p_day]
			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
    		,height					: '400px'
   			,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
   			,tableColumnNames		: ["BGNG_YMD",	"SITE_NM", 	"DEPT_NM",  	"SITE_CD"]
   			,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('sch-dept-name', data.DEPT_NM);
				SBUxMethod.set('sch-dept-code', data.DEPT_CD);
			},
    	});
  	}   
    
    /**
     * 통화
     */
    var fn_changeCurrencyCode = function(val) {
    	
		//환율가져오기
		let p_doc_date		= gfnma_nvl(SBUxMethod.get('sch-doc-date'));
		let p_currency_code	= gfnma_nvl(SBUxMethod.get('sch-currency-code'));
		let p_exchange_type	= gfnma_nvl(SBUxMethod.get('sch-cboexchange-type'));
		
		var paramObj = {
			    V_P_DEBUG_MODE_YN	: '',
			    V_P_LANG_ID			: '',
			    V_P_COMP_CODE		: gv_ma_selectedCorpCd,
			    V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
			    V_P_YYYYMMDD		: p_doc_date,
			    V_P_CURR_CODE		: p_currency_code,
			    V_P_RATE_TYPE		: p_exchange_type,
			    V_P_FORM_ID			: p_formId,
			    V_P_MENU_ID			: p_menuId,
			    V_P_PROC_ID			: '',
			    V_P_USERID			: '',
			    V_P_PC				: ''
		};
		gfnma_getExchangeRateQ(paramObj, "Q", function(data){
			
			//data[0]['RATE']);
			//data[0]['BASE_SCALE']);
			SBUxMethod.set('sch-exchange-rate', data[0]['RATE']);
		});    	
    }
    
    /**
     * 조회
     */
	const fn_setFig2310Grid = async function (wtype, callbackFn){
 
		let p_doc_status		= gfnma_nvl(SBUxMethod.get("sch-doc-status"));
		
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("sch-fi-org-code"));
		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("sch-acct-rule-code"));
		let p_doc_id			= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("sch-cbosite-code"));
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
 
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig2310QList.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '5',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
		console.log(data);        		
 
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		jsonFig2310.length = 0;
        		
        		var list = [];
        		if(wtype=='RULE'){
        			fn_ruleSet(data);
        			list = data.cv_2;
        		} else if(wtype=='DEFAULTRULE'){
        			fn_defaultRuleSet(data)
        			list = data.cv_2;
        		} else if(wtype=='MENU'){
        			if(data.cv_1.length>0){
        				pg_strdoc_type = data.cv_1[0]['PRMTR_INFO'];
        			}
        			return;
        		} else {
        			//list = data.cv_1;
        			list = data.cv_3;
        		}
        		
        		list.forEach((item, index) => {
        			for(let payMethodObj of jsonPayMethod){
        				if(payMethodObj.SBSD_CD == item.PAY_MTHD){
        					item.PAY_MTHD_NAME = payMethodObj.CD_NM;
        				}
        			}
        			
  					const msg = {
  						CHECK_YN				: gfnma_nvl(item.CHECK_YN),			
  						
  						ITEM_ID					: gfnma_nvl(item.ITEM_ID),			
  						DOC_ID					: gfnma_nvl(item.SLIP_ID),			
  						TMP_ACCOUNT_CODE		: gfnma_nvl(item.TMP_ACCOUNT_CODE),			
  						TMP_ACCOUNT_NAME		: gfnma_nvl(item.TMP_ACCOUNT_NAME),			
  						FUNCTIONAL_AMT_HIST		: gfnma_nvl(item.FUNCTIONAL_AMT_HIST),			
  						VAT_TYPE_CODE			: gfnma_nvl(item.VAT_TYPE_CD),			
  						ITEM_CODE				: gfnma_nvl(item.ITEM_CD),			
  						UOM						: gfnma_nvl(item.UNIT),			
  						TXN_QTY					: gfnma_nvl(item.TRSC_QTY),			
  						BALANCE_SIDE			: gfnma_nvl(item.ACNT_BLNC_SE),			
  						TXT_STOP_YN				: gfnma_nvl(item.TXT_STOP_YN),			
  						
  						ITEM_SEQ				: gfnma_nvl(item.ITEM_SEQ),			
  						LINE_TYPE				: gfnma_nvl(item.LINE_TYPE),			
  						ACCOUNT_CODE			: gfnma_nvl(item.ACNTL_CD),			
  						ACCOUNT_NAME			: gfnma_nvl(item.ACNT_NM),
  						DEBIT_CREDIT			: gfnma_nvl(item.DBSD_CRSD),
  						SUPPLY_AMOUNT			: gfnma_nvl(item.SPLY_AMT),
  						ACC_CATEGORY			: gfnma_nvl(item.ACNT_CTGRY),
  						
  						ACC_ITEM_CODE1			: gfnma_nvl(item.ACNT_MNG_ARTCL_CD1),
  						ACC_ITEM_CODE2			: gfnma_nvl(item.ACNT_MNG_ARTCL_CD2),
  						ACC_ITEM_CODE3			: gfnma_nvl(item.ACNT_MNG_ARTCL_CD3),
  						ACC_ITEM_CODE4			: gfnma_nvl(item.ACNT_MNG_ARTCL_CD4),
  						ACC_ITEM_CODE5			: gfnma_nvl(item.ACNT_MNG_ARTCL_CD5),
  						ACC_ITEM_CODE6			: gfnma_nvl(item.ACNT_MNG_ARTCL_CD6),
  						ACC_ITEM_CODE7			: gfnma_nvl(item.ACNT_MNG_ARTCL_CD7),
  						ACC_ITEM_CODE8			: gfnma_nvl(item.ACNT_MNG_ARTCL_CD8),
  						ACC_ITEM_CODE9			: gfnma_nvl(item.ACNT_MNG_ARTCL_CD9),
  						ACC_ITEM_CODE10			: gfnma_nvl(item.ACNT_MNG_ARTCL_CD10),
 
  						ACC_ITEM_NAME1			: gfnma_nvl(item.ACNT_MNG_ARTCL_NM1),
  						ACC_ITEM_NAME2			: gfnma_nvl(item.ACNT_MNG_ARTCL_NM2),
  						ACC_ITEM_NAME3			: gfnma_nvl(item.ACNT_MNG_ARTCL_NM3),
  						ACC_ITEM_NAME4			: gfnma_nvl(item.ACNT_MNG_ARTCL_NM4),
  						ACC_ITEM_NAME5			: gfnma_nvl(item.ACNT_MNG_ARTCL_NM5),
  						ACC_ITEM_NAME6			: gfnma_nvl(item.ACNT_MNG_ARTCL_NM6),
  						ACC_ITEM_NAME7			: gfnma_nvl(item.ACNT_MNG_ARTCL_NM7),
  						ACC_ITEM_NAME8			: gfnma_nvl(item.ACNT_MNG_ARTCL_NM8),
  						ACC_ITEM_NAME9			: gfnma_nvl(item.ACNT_MNG_ARTCL_NM9),
  						ACC_ITEM_NAME10			: gfnma_nvl(item.ACNT_MNG_ARTCL_NM10),
  						
  						ACC_ITEM_YN1			: gfnma_nvl(item.ACNT_MNG_ARTCL_YN1),
  						ACC_ITEM_YN2			: gfnma_nvl(item.ACNT_MNG_ARTCL_YN2),
  						ACC_ITEM_YN3			: gfnma_nvl(item.ACNT_MNG_ARTCL_YN3),
  						ACC_ITEM_YN4			: gfnma_nvl(item.ACNT_MNG_ARTCL_YN4),
  						ACC_ITEM_YN5			: gfnma_nvl(item.ACNT_MNG_ARTCL_YN5),
  						ACC_ITEM_YN6			: gfnma_nvl(item.ACNT_MNG_ARTCL_YN6),
  						ACC_ITEM_YN7			: gfnma_nvl(item.ACNT_MNG_ARTCL_YN7),
  						ACC_ITEM_YN8			: gfnma_nvl(item.ACNT_MNG_ARTCL_YN8),
  						ACC_ITEM_YN9			: gfnma_nvl(item.ACNT_MNG_ARTCL_YN9),
  						ACC_ITEM_YN10			: gfnma_nvl(item.ACNT_MNG_ARTCL_YN10),
  						
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
  						
  						ACC_ITEM_VALUE1			: gfnma_nvl(item.ACNT_MNG_ARTCL_VL1),
  						ACC_ITEM_VALUE2			: gfnma_nvl(item.ACNT_MNG_ARTCL_VL2),
  						ACC_ITEM_VALUE3			: gfnma_nvl(item.ACNT_MNG_ARTCL_VL3),
  						ACC_ITEM_VALUE4			: gfnma_nvl(item.ACNT_MNG_ARTCL_VL4),
  						ACC_ITEM_VALUE5			: gfnma_nvl(item.ACNT_MNG_ARTCL_VL5),
  						ACC_ITEM_VALUE6			: gfnma_nvl(item.ACNT_MNG_ARTCL_VL6),
  						ACC_ITEM_VALUE7			: gfnma_nvl(item.ACNT_MNG_ARTCL_VL7),
  						ACC_ITEM_VALUE8			: gfnma_nvl(item.ACNT_MNG_ARTCL_VL8),
  						ACC_ITEM_VALUE9			: gfnma_nvl(item.ACNT_MNG_ARTCL_VL9),
  						ACC_ITEM_VALUE10		: gfnma_nvl(item.ACNT_MNG_ARTCL_VL10),
  						
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
  						
  						ITEM_SOURCE_ID			: gfnma_nvl(item.ITEM_SRC_ID),
  						ITEM_SOURCE_TYPE		: gfnma_nvl(item.ITEM_SRC_TYPE),
  						SOURCE_RECORD_COUNT		: gfnma_nvl(item.SRC_RCRD_CNT),
  						DEPT_CODE				: gfnma_nvl(item.DEPT_CD),
  						DEPT_NAME				: gfnma_nvl(item.DEPT_NM),
  						COST_CENTER_CODE		: gfnma_nvl(item.CSTCT_CD),
  						COST_CENTER_NAME		: gfnma_nvl(item.CSTCT_NM),
  						DESCRIPTION				: gfnma_nvl(item.DSCTN),
  						VAT_TYPE				: gfnma_nvl(item.VAT_TYPE),
  						PROJECT_YN				: gfnma_nvl(item.PJT_YN),
  						CNPT_CD					: gfnma_nvl(item.CNPT_CD),
  						CNPT_NM					: gfnma_nvl(item.CNPT_NM),
  						CURRENCY_CODE			: gfnma_nvl(item.CRN_CD),
  						EXCHANGE_RATE			: gfnma_nvl(item.EXCHRT),
  						BASE_SCALE				: gfnma_nvl(item.BASE_SCALE),
  						EXCHANGE_TYPE			: gfnma_nvl(item.EXCHRT_TYPE),
  						PAY_METHOD				: gfnma_nvl(item.PAY_MTHD),
  						PAY_METHOD_NAME			: gfnma_nvl(item.PAY_MTHD_NAME),
  						EXPECTED_PAY_DATE		: gfnma_date5(gfnma_nvl(item.PAY_PRNMNT_YMD)),
  						PAY_TERM_CODE			: gfnma_nvl(item.PAY_TERM_CD),
  						PAY_TERM_NAME			: gfnma_nvl(item.PAY_TERM_NM),
  						BASIS_TYPE				: gfnma_nvl(item.BASE_CRN_CD),
  						VOUCHER_TYPE			: gfnma_nvl(item.EVDNC_TYPE),
  						VOUCHER_NO				: gfnma_nvl(item.EVDNC_NO),
  						PAYEE_CODE				: gfnma_nvl(item.RCPNT_CD),
  						CARD_NO					: gfnma_nvl(item.CARD_NO),
  						VOUCHER_RECEIPT_DATE	: gfnma_nvl(item.EVDNC_RCPT_YMD),
  						APPLY_COMPLETE_FLAG		: gfnma_nvl(item.REVE_CMPTN_FLAG),
  						WITHHOLD_FLAG			: gfnma_nvl(item.WTHD_FLAG),
  						WITHHOLD_TAX_TYPE		: gfnma_nvl(item.WTHD_TX_TYPE),
  						SITE_CODE				: gfnma_nvl(item.SITE_CD),
  						CREDIT_AREA				: gfnma_nvl(item.CRDT_SECT),
  						FI_ORG_CODE				: gfnma_nvl(item.ACNTG_OGNZ_CD),
  						PO_LINE_NO				: gfnma_nvl(item.PORDR_LINE_NO),
  						SALES_PERSON			: gfnma_nvl(item.SALS_EMP),
  						WITHHOLD_CS_CODE		: gfnma_nvl(item.WTHD_CNPT_CD),
  						WITHHOLD_TAX_TYPE2		: gfnma_nvl(item.WTHD_TX_TYPE2),
  						WITHHOLD_CS_CODE2		: gfnma_nvl(item.WTHD_CNPT_CD2),
  						APPLY_COMPLETE_DATE		: gfnma_nvl(item.REVE_CMPTN_YMD),
  						SALES_CS_CODE			: gfnma_nvl(item.SLL_CNPT_CD),
  						HOLD_FLAG				: gfnma_nvl(item.HLDOF_FLAG),
  						RELEASE_DATE			: gfnma_nvl(item.RMV_YMD),
  						RELEASE_USER			: gfnma_nvl(item.RMV_USER),
  						HOLD_DATE				: gfnma_nvl(item.HLDOF_YMD),
  						HOLD_USER				: gfnma_nvl(item.HLDOF_USER),
  						HOLD_REASON				: gfnma_nvl(item.HLDOF_RSN),
  						PAY_BASE_DATE			: gfnma_date5(gfnma_nvl(item.PAY_RCK_YMD)),
  						BILL_DUE_DATE			: gfnma_nvl(item.PRMNT_MTRY_YMD),
  						BILL_DUE_DAY			: gfnma_nvl(item.PRMNT_DCNT),
  						BILL_DUE_PAY_DATE		: gfnma_nvl(item.PRMNT_MTRY_PAY_YMD),
  						PAY_TERM_ORIG			: gfnma_nvl(item.PAY_TERM_FRST),
  						PROD_GROUP				: gfnma_nvl(item.PRDCT_GRP),
  						BANK_ACCOUNT_SEQ		: gfnma_nvl(item.BACNT_SEQ),
  						MATL_NO					: gfnma_nvl(item.INDIV_NO),
  						PROD_ORDER_NO			: gfnma_nvl(item.PRDCTN_ORDR_NO),
  						ORDER_NO				: gfnma_nvl(item.ORDR_NO),
  						SALES_NO				: gfnma_nvl(item.SLS_NO),
  						ETAX_TYPE				: gfnma_nvl(item.ELDOC_TYPE),
  						AFTER_DUE_DATE_YN		: gfnma_nvl(item.AFTR_DUDT_SEND_YN),
  						DUP_ISSUE_BILL_TYPE		: gfnma_nvl(item.DPCN_ISSU_BILL_TYPE),
  						EXCLUDE_REVENUE_AMT_YN	: gfnma_nvl(item.EXCLUDE_REVENUE_AMT_YN),
  						CARD_USE_TYPE			: gfnma_nvl(item.CARD_USG_TYPE),
  						CARD_NUM				: gfnma_nvl(item.CARD_NO),
  						VAT_NOT_DEDUCTION_TYPE	: gfnma_nvl(item.VAT_NOT_DEDUCTION_TYPE),
  						REPORT_OMIT_YN			: gfnma_nvl(item.RPT_PRNMNT_YN),
  						STANDARD_DATE			: gfnma_nvl(item.DCLR_YMD),
  						VAT_ASSET_TYPE			: gfnma_nvl(item.VAT_AST_TYPE),
  						SUPPLY_AMT				: gfnma_nvl(item.SPLY_AMT),
  						VAT_AMT					: gfnma_nvl(item.VAT_AMT),
  						ZERO_REPORT_YN			: gfnma_nvl(item.ZRT_DCMNT_YN),
  						LOCAL_CREDIT_TYPE		: gfnma_nvl(item.LCL_LC_TYPE),
  						DOCUMENT_NAME			: gfnma_nvl(item.DOC_NM),
  						ISSUE_NAME				: gfnma_nvl(item.ISSU_NM),
  						DOCUMENT_ISSUE_DATE		: gfnma_nvl(item.DOC_ISSU_YMD),
  						EXPORT_LICENSE_NO		: gfnma_nvl(item.EXPRT_LCNS_NO),
  						SHIPPING_DATE			: gfnma_nvl(item.SHPG_YMD),
  						EXPORT_AMT				: gfnma_nvl(item.EXPRT_AMT),
  						EXPORT_AMT_KRW			: gfnma_nvl(item.EXPRT_AMT_KRW),
  						VAT_EXPORT_AMT			: gfnma_nvl(item.VAT_THTM_EXPRT_AMT),
  						VAT_EXPORT_AMT_KRW		: gfnma_nvl(item.VAT_THTM_EXPRT_AMT_KRW),
  						FOREIGN_AMT				: gfnma_nvl(item.EXPRT_FRCNCY_AMT),
  						WON_AMT					: gfnma_nvl(item.KRW_AMT),
  						DOCUMENT_NO				: gfnma_nvl(item.DOC_NO),
  						ZERO_TYPE				: gfnma_nvl(item.ZRT_TYPE),
  						COST_CLASS				: gfnma_nvl(item.CST_CLSF),
  						NONDED_YN				: gfnma_nvl(item.NDDC_YN),
  						WITHHOLD_TAX_YN			: gfnma_nvl(item.WTHD_TX_YN),
  						
  						VAT_NAME				: gfnma_nvl(item.VAT_NM),
  						ORIGINAL_AMT			: (gfnma_nvl(item.ORIGINAL_AMT)) ? gfnma_nvl(item.ORIGINAL_AMT) : '0',
  						FUNCTIONAL_AMT			: (gfnma_nvl(item.CNVS_AMT)) ? gfnma_nvl(item.CNVS_AMT) : '0',
  						PROJECT_CODE			: gfnma_nvl(item.PJT_CD),
  						PROJECT_NAME			: gfnma_nvl(item.PJT_NM),
  						BANK_NAME				: gfnma_nvl(item.BANK_NM),
  						BANK_ACCOUNT_NO			: gfnma_nvl(item.BACNT_NO),
  						REGNO					: gfnma_nvl(item.REGNO),
  						TXN_STOP_YN				: gfnma_nvl(item.TRSC_HLT_YN),
  						
  						ITEM_SOURCE_ID_ORIG		: gfnma_nvl(item.ITEM_SRC_ID_ORGNL),
  						ITEM_SOURCE_TYPE_ORIG	: gfnma_nvl(item.ITEM_SRC_TYPE_ORGNL),
  							
  					}
  					jsonFig2310.push(msg);
  				});        		
  	        	Fig2310Grid.rebuild();
  	        	
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
        var idx = Fig2310Grid.getRows();
        if(idx==-1){
        	idx = 0;
        }
        
        var p_description 	= gfnma_nvl(SBUxMethod.get("sch-description"));
        var p_currency_code = gfnma_nvl(SBUxMethod.get("sch-currency-code"));
        var p_exchange_rate = gfnma_nvl(SBUxMethod.get("sch-exchange-rate"));
        var p_site_code 	= gfnma_nvl(SBUxMethod.get("sch-cbosite-code"));
        var p_dept_code 	= gfnma_nvl(SBUxMethod.get("sch-dept-code"));
        var p_dept_name 	= gfnma_nvl(SBUxMethod.get("sch-dept-name"));
        
        Fig2310Grid.insertRow(idx-1, 'below');
        Fig2310Grid.setCellData(idx, 2, idx, true, true);
        Fig2310Grid.setCellData(idx, 7,  p_description, true, true);
        Fig2310Grid.setCellData(idx, 16, p_currency_code, true, true);
        Fig2310Grid.setCellData(idx, 35, p_exchange_rate, true, true);
        
        //Fig2310Grid.setCellData(idx, 35, p_site_code, true, true);
        Fig2310Grid.setCellData(idx, 20, p_dept_code, true, true);
        Fig2310Grid.setCellData(idx, 18, p_dept_name, true, true);
    }
    
    /**
     * 행삭제
     */
    var fn_gridRowDel = function() {
    	Fig2310Grid.deleteRow(Fig2310Grid.getRow());
    	//fn_gridTotal();
    } 
    
    /**
     * 저장
     */
    var cfn_save = function() {
    	
        if(!SBUxMethod.validateRequired({group_id: "frmBody"}) || !validateRequired("frmBody")) {        
            return false;
        }        
    	
    	if(fn_saveFig2310S('')){
    		if( Number(gfnma_nvl(SBUxMethod.get("sch-doc-id"))) !=0 && gfnma_nvl(SBUxMethod.get("sch-doc-status")) == '1'  ){
    			$('#main-btn-save', parent.document).attr('disabled', false);
    			$('#main-btn-del', 	parent.document).attr('disabled', false);
    		}
    	}
    } 
    
    /**
     * 저장
     */
    const fn_saveFig2310S = async function(wtype) {
    	
		let p_numDiffWon			= Number(gfnma_nvl(SBUxMethod.get("tot-numDiffWon")));
		let p_numDiffFuntion		= Number(gfnma_nvl(SBUxMethod.get("tot-numDiffFuntion")));
		
    	if(wtype=='' || wtype=='N' || wtype=='U'){
    		
            // 차대금액 체크
    		if(p_numDiffWon != 0 || p_numDiffFuntion != 0){
	      		gfn_comAlert("E0000","차대금액이 맞지 않습니다. 금액을 확인해 주십시오");
	      		return false;
    		}
       		var allList = Fig2310Grid.getGridDataAll();
			for (var i = 0; i < allList.length; i++) {
				var obj = allList[i];
				if(Number(obj['ORIGINAL_AMT'])==0){
		      		gfn_comAlert("E0000","금액이 잘못 입력되었습니다. 금액을 확인해 주십시오");
		      		return false;
				}
				if(obj['LINE_TYPE']=='3'){	//세금일경우
					if(!obj['VAT_TYPE']){
			      		gfn_comAlert("E0000","세금 라인일 경우 부가세 유형은 필수 입니다.");
			      		return false;
					}
				}
				if(obj['ACC_CATEGORY']=='D' || obj['ACC_CATEGORY']=='E'){
					if(!obj['COST_CENTER_CODE']){
			      		gfn_comAlert("E0000","수익,비용인 경우 원가중심점이 필수 입니다.");
			      		return false;
					}
				}
				if(obj['PROJECT_YN']=='Y'){	
					if(!obj['PROJECT_CODE']){	
			      		gfn_comAlert("E0000","프로젝트는 필수 입니다.");
			      		return false;
					}
				}
				if(obj['BASIS_TYPE']=='5'){	
					if(!obj['EXPECTED_PAY_DATE']){	
			      		gfn_comAlert("E0000","지급기일은 필수 입력사항입니다.");
			      		return false;
					}
				}
                for (var j = 1; j <= 10; j++){
					if( obj['ACC_ITEM_YN'+j] == 'Y' && Number(obj['ORIGINAL_AMT']) !=0 ){
						if( obj['ACC_ITEM_CODE'+j] ){
							if( !obj['ACC_ITEM_VALUE'+j] ){
					      		gfn_comAlert("E0000","필수 관리항목을 입력해주십시요.");
					      		return false;
							}
						}
					}
				}
			}
			
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
            var stracc_item_code3		= "";
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
            //var strpayer_id = "";
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
 
            var strzero_report_yn 			= "";
            var strlocal_credit_type 		= "";
            var strdocument_name 			= "";
            var strissue_name 				= "";
            var strdocument_issue_date 		= "";
            var strexport_license_no 		= "";
            var strshipping_date 			= "";
            var strexport_amt 				= "";
            var strexport_amt_krw 			= "";
            var strvat_export_amt 			= "";
            var strvat_export_amt_krw 		= "";
            var strforeign_amt 				= "";
            var strwon_amt 					= "";
            var strdocument_no 				= "";
            var strzero_type 				= "";
            var strvat_amt 					= "";            
         
			for (var i = 0; i < allList.length; i++) {
	    		var obj = allList[i];
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
                
                strhold_flag 			+= obj["HOLD_FLAG"] + "|";
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
             
                strzero_report_yn 			+= obj["ZERO_REPORT_YN"] + "|";
                strlocal_credit_type 		+= obj["LOCAL_CREDIT_TYPE"] + "|";
                strdocument_name 			+= obj["DOCUMENT_NAME"] + "|";
                strissue_name 				+= obj["ISSUE_NAME"] + "|";
               	// MessageBox.Show("89");
                strdocument_issue_date		+= obj["DOCUMENT_ISSUE_DATE"] + "|";
                strexport_license_no 		+= obj["EXPORT_LICENSE_NO"] + "|";
                strshipping_date 			+= obj["SHIPPING_DATE"] + "|";
                strexport_amt 				+= obj["EXPORT_AMT"] + "|";
                strexport_amt_krw 			+= obj["EXPORT_AMT_KRW"] + "|";
                strvat_export_amt 			+= obj["VAT_EXPORT_AMT"] + "|";
                strvat_export_amt_krw 		+= obj["VAT_EXPORT_AMT_KRW"] + "|";
                //MessageBox.Show("99");
                strforeign_amt	 			+= obj["FOREIGN_AMT"] + "|";
                strwon_amt 					+= obj["WON_AMT"] + "|";
                strdocument_no	 			+= obj["DOCUMENT_NO"] + "|";
                strzero_type				+= obj["ZERO_TYPE"] + "|";
                strvat_amt	 				+= obj["VAT_AMT"] + "|";				
			}
			
			if(allList.length > 0){
				
				stritem_id 				= stritem_id.slice(0, -1);
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
                stracc_value_name10 	= stracc_value_name10.slice(0, -1);
 
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
 
                strzero_report_yn 		= strzero_report_yn.slice(0, -1);
                strlocal_credit_type 	= strlocal_credit_type.slice(0, -1);
                strdocument_name 		= strdocument_name.slice(0, -1);
                strissue_name 			= strissue_name.slice(0, -1);
                strdocument_issue_date 	= strdocument_issue_date.slice(0, -1);
                strexport_license_no 	= strexport_license_no.slice(0, -1);
                strshipping_date 		= strshipping_date.slice(0, -1);
                strexport_amt 			= strexport_amt.slice(0, -1);
                strexport_amt_krw 		= strexport_amt_krw.slice(0, -1);
                strvat_export_amt 		= strvat_export_amt.slice(0, -1);
                strvat_export_amt_krw 	= strvat_export_amt_krw.slice(0, -1);
                strforeign_amt 			= strforeign_amt.slice(0, -1);
                strwon_amt 				= strwon_amt.slice(0, -1);
                strdocument_no 			= strdocument_no.slice(0, -1);
                strzero_type 			= strzero_type.slice(0, -1);
                strvat_amt 				= strvat_amt.slice(0, -1);				
			}
			
        	var paramObj = {
               	V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                   
   				IV_P_DOC_BATCH_NO  			: gfnma_nvl(SBUxMethod.get('sch-doc-batch-no')),
   				V_P_DOC_ID         			: gfnma_nvl(SBUxMethod.get('sch-doc-id')),
   				V_P_SOURCE_ID      			: '0',
   				V_P_ACCT_RULE_CODE 			: gfnma_nvl(SBUxMethod.get('sch-acct-rule-code')),
   				V_P_HOLD_FLAG      			: gfnma_nvl(SBUxMethod.get('sch-hold-flag')),
   				V_P_FI_ORG_CODE    			: gfnma_nvl(SBUxMethod.get('sch-fi-org-code')),
   				V_P_DOC_DATE       			: gfnma_date7(gfnma_nvl(SBUxMethod.get('sch-doc-date'))),
   				V_P_WRITE_DATE     			: '',
   				V_P_APPROVE_DATE   			: '',
   				V_P_DOC_NUM        			: '0',
   				V_P_DOC_NAME       			: gfnma_nvl(SBUxMethod.get('sch-doc-name')),
   				V_P_SITE_CODE      			: gfnma_nvl(SBUxMethod.get('sch-cbosite-code')),
   				V_P_DOC_TYPE       			: gfnma_nvl(SBUxMethod.get('sch-doc-type')),
   				V_P_DEPT_CODE      			: gfnma_nvl(SBUxMethod.get('sch-dept-code')),
   				V_P_ENTRY_PATH     			: 'FI100',
   				V_P_DOC_AMT        			: '0',
   				V_P_DOC_STATUS     			: gfnma_nvl(SBUxMethod.get('sch-doc-status')),
   				V_P_SOURCE_TYPE    			: 'MANUAL',
   				V_P_CURRENCY_CODE  			: gfnma_nvl(SBUxMethod.get('sch-currency-code')),
   				V_P_EXCHANGE_TYPE  			: gfnma_nvl(SBUxMethod.get('sch-cboexchange-type')),
   				V_P_EXCHANGE_RATE  			: gfnma_nvl(SBUxMethod.get('sch-exchange-rate')),
   				V_P_DESCRIPTION    			: gfnma_nvl(SBUxMethod.get('sch-description')),
   				
   				V_P_ACCT_OPINION      		: gfnma_nvl(SBUxMethod.get('sch-acct-opinion')),
   				V_P_TR_OPINION        		: gfnma_nvl(SBUxMethod.get('sch-tr-opinion')),
   				V_P_SOURCE_DOC        		: 'MANUAL',
   				V_P_TAX_SITE_CODE     		: gfnma_nvl(SBUxMethod.get('sch-tax-site-code')),
   				V_P_SUB_TAX_SITE_CODE 		: gfnma_nvl(SBUxMethod.get('sch-sub-tax-site-code')),
   				
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
   				
   				V_P_ZERO_REPORT_YN_D     	: strzero_report_yn, 
   				V_P_LOCAL_CREDIT_TYPE_D   	: strlocal_credit_type, 
   				V_P_DOCUMENT_NAME_D       	: strdocument_name, 
   				V_P_ISSUE_NAME_D          	: strissue_name, 
   				V_P_DOCUMENT_ISSUE_DATE_D 	: strdocument_issue_date, 
   				V_P_EXPORT_LICENSE_NO_D   	: strexport_license_no, 
   				V_P_SHIPPING_DATE_D       	: strshipping_date, 
   				V_P_EXPORT_AMT_D            : strexport_amt, 
   				V_P_EXPORT_AMT_KRW_D      	: strexport_amt_krw, 
   				V_P_VAT_EXPORT_AMT_D      	: strvat_export_amt, 
   				V_P_VAT_EXPORT_AMT_KRW_D  	: strvat_export_amt_krw, 
   				V_P_FOREIGN_AMT_D         	: strforeign_amt, 
   				V_P_WON_AMT_D             	: strwon_amt, 
   				V_P_DOCUMENT_NO_D         	: strdocument_no, 
   				V_P_ZERO_TYPE_D           	: strzero_type, 
   				V_P_VAT_AMT_D             	: strvat_amt,
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
            
    	} else if(wtype == "D" || wtype == "CONFIRM" || wtype == "REJECT" || wtype == "END" || wtype == "CANCEL"){
    		
        	var paramObj = {
               	V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                   
   				IV_P_DOC_BATCH_NO  			: gfnma_nvl(SBUxMethod.get('sch-doc-batch-no')),
   				V_P_DOC_ID         			: gfnma_nvl(SBUxMethod.get('sch-doc-id')),
   				V_P_SOURCE_ID      			: '0',
   				V_P_ACCT_RULE_CODE 			: gfnma_nvl(SBUxMethod.get('sch-acct-rule-code')),
   				V_P_HOLD_FLAG      			: gfnma_nvl(SBUxMethod.get('sch-hold-flag')),
   				V_P_FI_ORG_CODE    			: gfnma_nvl(SBUxMethod.get('sch-fi-org-code')),
   				V_P_DOC_DATE       			: gfnma_date7(gfnma_nvl(SBUxMethod.get('sch-doc-date'))),
   				V_P_WRITE_DATE     			: '',
   				V_P_APPROVE_DATE   			: '',
   				V_P_DOC_NUM        			: '0',
   				V_P_DOC_NAME       			: gfnma_nvl(SBUxMethod.get('sch-doc-name')),
   				V_P_SITE_CODE      			: gfnma_nvl(SBUxMethod.get('sch-cbosite-code')),
   				V_P_DOC_TYPE       			: gfnma_nvl(SBUxMethod.get('sch-doc-type')),
   				V_P_DEPT_CODE      			: gfnma_nvl(SBUxMethod.get('sch-dept-code')),
   				V_P_ENTRY_PATH     			: 'FI100',
   				V_P_DOC_AMT        			: '0',
   				V_P_DOC_STATUS     			: gfnma_nvl(SBUxMethod.get('sch-doc-status')),
   				V_P_SOURCE_TYPE    			: '',
   				V_P_CURRENCY_CODE  			: gfnma_nvl(SBUxMethod.get('sch-currency-code')),
   				V_P_EXCHANGE_TYPE  			: gfnma_nvl(SBUxMethod.get('sch-cboexchange-type')),
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
    
    //그리드 합계 표시
    function fn_gridTotal(){
    	var robj = null; 
    	var dt	= 0;
    	var ct	= 0;
    	var fdt	= 0;
    	var fct	= 0;
    	var t1	= 0;
    	var t2	= 0;
    	for (var i = 0; i < jsonFig2310.length; i++) {
			var obj = jsonFig2310[i];
			if(obj['DEBIT_CREDIT']=='D'){
				dt 	+= Number(obj['ORIGINAL_AMT']);
				fdt += Number(obj['FUNCTIONAL_AMT']);
			} else if(obj['DEBIT_CREDIT']=='C'){
				ct 	+= Number(obj['ORIGINAL_AMT']);
				fct += Number(obj['FUNCTIONAL_AMT']);
			}
		}
    	t1 = dt - ct;
    	t2 = fdt - fct;
		SBUxMethod.set('tot-numDiffWon', 	t1);
		SBUxMethod.set('tot-numDiffFuntion',t2);
    }    
    
    const fn_getExpectedPayDate = async function (wType, strpay_term_code, strtxn_date, strdate_type) {
        var retrunData = [];
 
        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID			: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
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
            workType: 'Q2',
            cv_count: '1',
            params: gfnma_objectToString(paramObj)
        });
 
        const data = await postJsonPromise;
        console.log('data:', data);
 
        try {
            if (_.isEqual("S", data.resultStatus)) {
                data.cv_1.forEach((item, index) => {
                    var msg = {
                        EXPECTED_PAY_DATE 	: item.PAY_PRNMNT_YMD,
                        PAY_BASE_DATE 		: item.PAY_RCK_YMD,
                        BILL_DUE_DAY 		: item.PRMNT_DCNT,
                        BILL_DUE_DATE 		: item.PRMNT_MTRY_YMD,
                        BILL_DUE_PAY_DATE 	: item.PRMNT_MTRY_PAY_YMD
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
     * 문자 추출
     */
	function fn_stringToRemoveMask(iRow) {
    	
   		var tList = Fig2310Grid.getGridDataAll();
    	var rlist = [];
        for (var i = 1; i <= 10; i++){
        	if( tList[iRow]['DATA_TYPE'+i] && tList[iRow]['ACC_ITEM_VALUE'+i] ){
        		switch ( tList[iRow]['DATA_TYPE'+i] ) {
        			case 'TEXT':
        		  	case 'POPUP':
        		  		rlist.push(tList[iRow]['ACC_ITEM_VALUE'+i] + '|');  
        		    	break;
        		  	case 'NUM':
        		  		rlist.push((tList[iRow]['ACC_ITEM_VALUE'+i]).replaceAll(',','') + '|');  
        		    	break;
        		  	case 'YYYY':
        		  	case 'YYYYMM':
        		  	case 'YYYYMMDD':
        		  		rlist.push((tList[iRow]['ACC_ITEM_VALUE'+i]).replaceAll('-','') + '|');  
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
     * 목록 조회
     */
	function cfn_search() {
    	
		pg_vat_type_bizId	= 'P_ACCOUNT_POPUP_Q';
		fn_setFig2310Grid('Q', function(){
			fn_enableSet();
		});		
	}
 
	function fn_subSearch(callbackFn) {
    	
		pg_vat_type_bizId	= 'P_ACCOUNT_POPUP_Q';
		fn_setFig2310Grid('Q', function(){
			fn_enableSet();
			if(callbackFn){
				callbackFn();
			}
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
 
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("sch-fi-org-code"));
		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("sch-acct-rule-code"));
		let p_strdoc_id			= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
		let p_hold_reason		= gfnma_nvl(SBUxMethod.get("sch-cbohold-reason"));
		
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
 			,V_P_ACCT_RULE_CODE			: p_acct_rule_code
 			,V_P_DOC_ID     			: p_strdoc_id
 			,V_P_HOLD_REASON			: p_hold_reason
 			,V_P_UNPOSTING_TYPE			: p_strunposting_type
 			,V_P_UNPOSTING_DATE			: p_strunposting_date
 				
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
     * 전기취소
     */
    var fn_docCancel = function() {
    	
    	var bNoCommitRow = false; 
    	if(p_header_dataStatus != 'Q'){
    		bNoCommitRow = true;
    	}
        if(bNoCommitRow){
    		gfn_comAlert("E0000","저장되지 않은 DATA 가 있습니다. 저장 후 작업해주세요.");
    		return;
        }
    	
    	p_strwork_type			= '';
    	p_strunposting_type		= '';
    	p_strunposting_date		= '';
        
		let p_strdoc_id		= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
		
    	SBUxMethod.attr('modal-compopup4', 'header-title', '전표전기취소');
    	compopup4({
    		param					: {}
			,callbackEvent			: function (data){
				console.log('callback data:', data);
				p_strwork_type 		= data['workType'];
				p_strunposting_type = data['code'];
				p_strunposting_date	= data['date'];
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
     * 보류해제
     */
    var fn_docRelease = function() {
    	
      	var p_strdoc_id		= '';
		var p_item_id_d 	= "";
        var p_hold_reason_d = "";
      	var p_numhold_count	= 0;
      	
      	var allList = Fig2310Grid.getGridDataAll()
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
      	
      	var allList = Fig2310Grid.getGridDataAll()
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
 
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/updateFig2310S1.do", {
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
     * 결재이력
     */
    var fn_confimHist = function() {
    	
		var p_appr_id = gfnma_nvl(SBUxMethod.get("sch-txtappr-id"));
		if(p_appr_id=='' || p_appr_id=='0'){
 			gfn_comAlert("E0000","결재정보 생성 후 조회가 가능합니다.");
			return;
		}
 
		var p_doc_id 	= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
		var p_doc_type	= gfnma_nvl(SBUxMethod.get("sch-txtsource-type2"));
    	
    	SBUxMethod.attr('modal-compopfim3420', 'header-title', '승인결과조회');
		SBUxMethod.openModal('modal-compopfim3420');
		
		compopfim3420({
    		height			: '600px'
    		,param			: {
    			p_appr_id	: p_appr_id		//
    			,p_doc_id	: p_doc_id		//
    			,p_doc_type	: p_doc_type	//
    		}
   			,callbackEvent	: function (data){
   				console.log('callback data:', data);
   			},
    	});
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
    	
		var p_appr_id		= gfnma_nvl(SBUxMethod.get("sch-txtappr-id"));
		var p_doc_id		= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
		var p_doc_type		= gfnma_nvl(SBUxMethod.get("sch-doc-type"));
		var p_doc_status	= gfnma_nvl(SBUxMethod.get("sch-doc-status"));
    	
        if (p_doc_id == ""|| p_doc_id == "0")
        {
    		gfn_comAlert("E0000","전표ID가 없습니다.");
            return;
        }
        
    	//본인이 상신하는 경우
    	compopappvmng({
    		compCode		: gv_ma_selectedCorpCd
    		,compCodeNm		: gv_ma_selectedCorpNm
    		,clientCode		: gv_ma_selectedClntCd
    		,apprId			: p_appr_id  
    		,sourceNo		: p_doc_id  
    		,sourceType		: p_doc_type   
    		,apprStatus		: p_doc_status
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
     * 조회내용 처리
     */
    var fn_ruleSet = function(data) {
    	if(data.cv_1.length>0){
    		SBUxMethod.set("sch-doc-type", 			data.cv_1[0]['SLIP_TYPE']);
    		SBUxMethod.set("sch-acct-rule-code", 	data.cv_1[0]['GAAP_CD']);
    		SBUxMethod.set("sch-currency-code", 	data.cv_1[0]['CRN_CD']);
    		SBUxMethod.set("sch-description", 		data.cv_1[0]['MEMO']);
    	}
    }    
	
    /**
     * 조회내용 처리
     */
    var fn_defaultRuleSet = function(data) {
    	if(data.cv_1.length>0){
    		SBUxMethod.set("sch-doc-type", 			data.cv_1[0]['SLIP_TYPE']);
    		SBUxMethod.set("sch-acct-rule-code", 	data.cv_1[0]['GAAP_CD']);
    		SBUxMethod.set("sch-currency-code", 	data.cv_1[0]['CRN_CD']);
    		SBUxMethod.set("sch-description", 		data.cv_1[0]['MEMO']);
    	}
    }    
    
    /**
     * 삭제
     */
     var cfn_del = function() {
    	
		if(fn_subDel()){
			fn_setFig2310Grid('MENU', function(){
				cfn_add();
			});		
		}    	
    }
    
     /**
      * 삭제
      */
    var fn_subDel = function() {
    	
 		let p_doc_id	= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
 		let p_doc_type	= gfnma_nvl(SBUxMethod.get("sch-doc-type"));
 		
    	if(Number(p_doc_id)==0){
    		return false;
    	}
    	if( p_doc_type!='93' && p_doc_type!='95' ){
        	gfn_comAlert("E0000","등록한 화면에서 삭제를 진행하십시오.");
        	return false;	
    	}
    	
    	var msg = gfnma_nvl(SBUxMethod.get("sch-doc-name")) + ' 을(를) 삭제';
		if(gfn_comConfirm("Q0001", msg)){
			fn_saveFig2310S('D');
		}
		return true;
    }
    
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
