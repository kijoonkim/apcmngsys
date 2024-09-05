<%
/**
 * @Class Name 		: fig2310_99.jsp
 * @Description 	: 미결반제전표 화면
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
                    </h3><!-- 미결반제전표 -->
                </div>
                <div id="top_lable1" style="margin-left:auto">
                    <font style="top:5px">전표템플릿</font>
                </div>
                <div id="top_lable2" style="padding-left:10px;padding-right:10px">
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
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="신규"  			id="sch-btn-new" 			class="btn btn-sm btn-outline-danger" onclick="fn_btnScmInfo"></sbux-button>
                    <sbux-button uitype="normal" text="삭제"  			id="sch-btn-delete" 		class="btn btn-sm btn-outline-danger" onclick="fn_fig2250pop"></sbux-button>
                    <sbux-button uitype="normal" text="저장"  			id="sch-btn-save" 			class="btn btn-sm btn-outline-danger" onclick="fn_fig2250pop"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="미결반제전표 생성"  		id="sch-btn-addItem" 	class="btn btn-sm btn-outline-danger" onclick="fn_addItem"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="전표복사"  		id="sch-btn-copy" 			class="btn btn-sm btn-outline-danger" onclick=""></sbux-button>
                    <sbux-button uitype="normal" text="결재"  			id="sch-btn-submit" 		class="btn btn-sm btn-outline-danger" onclick="fn_docAppr"></sbux-button>
                    <sbux-button uitype="normal" text="결재이력"  		id="sch-btn-confirmHist" 	class="btn btn-sm btn-outline-danger" onclick="fn_docDetail"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="전기처리"  		id="sch-btn-end" 			class="btn btn-sm btn-outline-danger" onclick="fn_docProcess"></sbux-button>
                    <sbux-button uitype="normal" text="전기취소"  		id="sch-btn-cancel" 		class="btn btn-sm btn-outline-danger" onclick="fn_docCancel"></sbux-button>
                    <sbux-button uitype="normal" text="보류해제"  		id="sch-btn-release" 		class="btn btn-sm btn-outline-danger" onclick="fn_docHoldExit"></sbux-button>
                    <sbux-button uitype="normal" text="보류지정"  		id="sch-btn-unrelease" 		class="btn btn-sm btn-outline-danger" onclick="fn_docHoldPoint"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="출력"  			id="sch-btn-print" 			class="btn btn-sm btn-outline-danger" onclick="fn_docDelAll"></sbux-button>
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
                       		<!-- /hidden -->
                       		
	                        <tr>
	                            <th scope="row" class="th_bg">배치번호</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
		   								<sbux-input id="sch-doc-batch-no" uitype="text" class="form-control input-sm"></sbux-input>
					                    <font style="margin-right:10px">전표ID</font>
		   								<sbux-input id="sch-doc-id" uitype="text" class="form-control input-sm"></sbux-input>
	                            	</div>
	                            </td>

	                            <th scope="row" class="th_bg">결의부서</th>
	                            <td colspan="2" class="td_input" >
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
	                            <td class="td_input" >
									<sbux-button
										class="btn btn-xs btn-outline-dark"
										text="찾기" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1"
									></sbux-button>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">회계기준</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="sch-acct-rule-code" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        </tr>    
	                        
	                        <tr>
	                            <th scope="row" class="th_bg">전표번호</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input id="sch-doc-name" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>

	                            <th scope="row" class="th_bg">회계검토의견</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input id="sch-acct-opinion" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>

	                            <th scope="row" class="th_bg">자금검토의건</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input id="sch-tr-opinion" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>
	                        </tr>    
	                        
	                        <tr>
	                            <th scope="row" class="th_bg">신고사업장</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			                            <sbux-select id="sch-tax-site-code" uitype="single" jsondata-ref="jsonTaxSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                    <font style="margin-right:10px">&nbsp;/&nbsp;</font>
			                            <sbux-select id="sch-sub-tax-site-code" uitype="single" jsondata-ref="jsonSubTaxSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            	</div>
	                            </td>

	                            <th scope="row" class="th_bg">현업결재일</th>
	                            <td colspan="3" class="td_input" >
								    <sbux-datepicker
								            id="sch-approve-date"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed">
								    </sbux-datepicker>                          
	                            </td>

	                            <th scope="row" class="th_bg">회계승인일</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
									    <sbux-datepicker
									            id="sch-posting-date"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
									    </sbux-datepicker>                          
					                    <font style="margin-right:10px"></font>
	   									<sbux-input id="sch-tposting-user" uitype="text" class="form-control input-sm"></sbux-input>
	                            	</div>
	                            </td>
	                        </tr>    
	                        
	                        <tr>
	                            <th scope="row" class="th_bg">전표유형</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
		                                <sbux-select id="sch-doc-type" name="sch-doc-type" uitype="single" jsondata-ref="jsonDocType" unselected-text="선택" class="form-control input-sm"></sbux-select>
		                                <sbux-select id="sch-doc-status" name="sch-doc-status" uitype="single" jsondata-ref="jsonDocStatus" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            	</div>
	                            </td>

	                            <th scope="row" class="th_bg">전기일자</th>
	                            <td colspan="3" class="td_input" >
								    <sbux-datepicker
								            id="sch-doc-date"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed">
								    </sbux-datepicker>                          
	                            </td>

	                            <th scope="row" class="th_bg">승인취소일</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
									    <sbux-datepicker
									            id="sch-unposting-date"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
									    </sbux-datepicker>                          
					                    <font style="margin-right:10px"></font>
	   									<sbux-input id="sch-unposting-user" uitype="text" class="form-control input-sm"></sbux-input>
	                            	</div>
	                            </td>
	                        </tr>    
	                        
	                        <tr>
	                            <th scope="row" class="th_bg">증빙일자</th>
	                            <td colspan="3" class="td_input" >
								    <sbux-datepicker
								            id="sch-voucher-receipt-date"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed">
								    </sbux-datepicker>                          
	                            </td>

	                            <th scope="row" class="th_bg">통화</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
		                                <sbux-select style="width:150px" id="sch-currency-code" name="sch-currency-code" uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
		   								<sbux-input uitype="text" id="sch-exchange-rate" class="form-control input-sm" ></sbux-input>
	                            	</div>
	                            </td>

	                            <th scope="row" class="th_bg">제목</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input id="sch-description" uitype="text" class="form-control input-sm"></sbux-input>
	                            </td>
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
											    <sbux-datepicker onchange="fn_FomChange(STANDARD_DATE, 'STANDARD_DATE')"  id="STANDARD_DATE" name="STANDARD_DATE" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>                          
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
											    <sbux-datepicker onchange="fn_FomChange(SHIPPING_DATE, 'SHIPPING_DATE')" id="SHIPPING_DATE" name="SHIPPING_DATE" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>                          
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
											    <sbux-datepicker onchange="fn_FomChange(DOCUMENT_ISSUE_DATE, 'DOCUMENT_ISSUE_DATE')"  id="DOCUMENT_ISSUE_DATE" name="DOCUMENT_ISSUE_DATE" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>                          
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
        <sbux-modal style="width:700px" id="modal-compopup3" name="modal-compopup3" uitype="middle" header-title="" body-html-id="body-modal-compopup3" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup3">
    	<jsp:include page="../../../com/popup/comPopup3.jsp"></jsp:include>
    </div>
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:1600px" id="modal-compopfig2320" name="modal-compopfig2320" uitype="middle" header-title="" body-html-id="body-modal-compopfig2320" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopfig2320">
    	<jsp:include page="../../../com/popup/comPopFig2320.jsp"></jsp:include>
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
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	var p_ss_siteCode			= '${loginVO.maSiteCode}';
	var p_ss_deptCode			= '${loginVO.maDeptCode}';
	var p_ss_deptName			= '${loginVO.maDeptName}';
	
    var pg_colcs_code_bizId		= '';	//그리드내(거래처) 팝업 bizId
    var pg_colcs_code_title		= '';	//그리드내(거래처) 팝업 타이틀
    var pg_colcs_code_field1	= '';	//그리드내(거래처) 컬럼명
    var pg_colcs_code_field2	= '';	//그리드내(거래처) 컬럼명
	
    var pg_rule_code_bizId		= '';	//멀티셀렉트 'srch-compopup1-rulecode' bizId
    var pg_rule_code_where		= "";	//멀티셀렉트 'srch-compopup1-rulecode' where
	
	var pg_state	= 'new';
	
    //grid 초기화
    var Fig2310Grid; 			// 그리드를 담기위한 객체 선언
    var jsonFig2310 = []; 		// 그리드의 참조 데이터 주소 선언
	//-----------------------------------------------------------
	
    var jsonLineType 			= []; // 라인유형
    var jsonDebitCredit 		= []; // 차/대

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([

            // 그리드내 라인유형
			gfnma_setComSelect([], 								jsonLineType, 		'L_FIM052', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 그리드내 차/대
			gfnma_setComSelect([], 								jsonDebitCredit, 	'L_FIG003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			
			//전표템플릿
			gfnma_multiSelectInit({
				target			: ['#srch-compopup1-rulecode']
				,compCode		: gv_ma_selectedApcCd
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
    		pg_rule_code_bizId		= 'L_RULE';
    		pg_rule_code_where		= "AND doc_type = '93'";
		}
		if(type){
			//select init
	  		await fn_initSBSelect()
		}
		//화면셋팅
    	//fn_state(pg_state);
	}    
    
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init(true);
    	fn_createGrid2310();	

    });

    /**
     * 화면 state 변경
     */
    function fn_state(type) {
    	

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
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup1(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["부가세유형명"], 			ref: 'VAT_NAME', 			type:'input',		width:'100px',  	style:'text-align:left'},
            
            {caption: ["거래처"], 					ref: pg_colcs_code_field1,    	type:'input',  		width:'70px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn2',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup2(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["거래처명"], 				ref: pg_colcs_code_field2, 		type:'input',		width:'150px',  	style:'text-align:left'},
            
            {caption: ["계정코드"], 				ref: 'ACCOUNT_CODE', 			type:'input',  		width:'70px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn3',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup3(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["계정과목명"], 				ref: 'ACCOUNT_NAME', 			type:'input',		width:'150px',  	style:'text-align:left'},
            
            {caption: ["통화금액"], 				ref: 'ORIGINAL_AMT', 			type:'input',		width:'150px',  	style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20},  format : {type:'number', rule:'#,###'}},
            {caption: ["전표금액"], 				ref: 'FUNCTIONAL_AMT', 			type:'input',		width:'150px',  	style:'text-align:right', typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 20},  format : {type:'number', rule:'#,###'}},
            {caption: ["통화"],						ref: 'CURRENCY_CODE',			type:'output',  	width:'70px',  		style:'text-align:left'},
            {caption: ["적요"], 					ref: 'DESCRIPTION', 			type:'input',		width:'250px',  	style:'text-align:left'},

            {caption: ["부서"], 					ref: 'DEPT_NAME', 				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn4',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup4(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["부서코드"],					ref: 'DEPT_CODE', 				type:'output',		width:'100px',  	style:'text-align:left', hidden:true},
            
            {caption: ["원가중심점"], 				ref: 'COST_CENTER_CODE',		type:'input',  		width:'70px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn5',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup5(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["원가중심점명"], 			ref: 'COST_CENTER_NAME', 		type:'input',		width:'150px',  	style:'text-align:left'},
            
            {caption: ["프로젝트코드"], 			ref: 'PROJECT_CODE',			type:'input',  		width:'100px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn6',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup6(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["프로젝트명"], 				ref: 'PROJECT_NAME', 			type:'input',		width:'250px',  	style:'text-align:left'},
            
            {caption: ["지급기준"], 				ref: 'PAY_TERM_CODE', 			type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn6',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup7(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["지급기준명"], 				ref: 'PAY_TERM_NAME', 			type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["지급방법"], 				ref: 'PAY_METHOD', 				type:'output',		width:'150px',  	style:'text-align:left'},
            
			{caption: ['지급기일'],					ref: 'EXPECTED_PAY_DATE',		type:'datepicker',	typeinfo:{	dateformat:"yyyy-mm-dd"	,displayui:true	}, width:'150px', style:'text-align:center'},	
            {caption: ["환율"], 					ref: 'EXCHANGE_RATE', 			type:'input',		width:'100px',  	style:'text-align:right'},

        ];

        Fig2310Grid = _SBGrid.create(SBGridProperties);
        Fig2310Grid.bind('valuechanged', 	'fn_comboValFig2310GridEvent')
        Fig2310Grid.bind('click', 			'fn_viewFig2310GridEvent');
    }    
    
    //콤보, 인풋박스 이벤트
    function fn_comboValFig2310GridEvent() {
        let nRow = Fig2310Grid.getRow(); // 클릭한 Row Index 추출
        let nCol = Fig2310Grid.getCol(); // 클릭한 Col Index 추출

        let rowData = Fig2310Grid.getRowData(nRow);
		fn_getFig2310Grid(rowData);
        
        if (Fig2310Grid.getRefOfCol(nCol) == 'LINE_TYPE') {			// 컬럼이 curriculum 일 때 (Combo Col 검사)
            let cellValue = Fig2310Grid.getCellData(nRow, nCol); 	// Combo Value 추출
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
        } else if(Fig2310Grid.getRefOfCol(nCol) == 'ORIGINAL_AMT'){
            let cellValue = Fig2310Grid.getCellData(nRow, nCol); 	
        	console.log('ORIGINAL_AMT:', cellValue);
            Fig2310Grid.setCellData(nRow, nCol+1, cellValue, true, true);
            fn_gridTotal();            
        } else if(Fig2310Grid.getRefOfCol(nCol) == 'DEBIT_CREDIT'){
            fn_gridTotal();            
        }    	
    }    
    
    //상세정보 보기
    function fn_viewFig2310GridEvent() {
    	
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
    	var addParams = [gfnma_date6(), 'NULL'];	
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부가세유형');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				Fig2310Grid.setCellData(row, 5, 	data['VAT_CODE'], true, true);
				Fig2310Grid.setCellData(row, 7, 	data['VAT_NAME'], true, true);
				jsonFig2310[row-1]['NONDED_YN'] = data['NONDED_YN'];
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
    	
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_BIZ_REGNO_"; 
        var replaceText2 	= "_CS_NAME_"; 
        var strWhereClause 	= "AND A.CS_CODE LIKE '%" + replaceText0 + "%' AND A.BIZ_REGNO LIKE '%" + replaceText1 + "%' " + " AND A.CS_NAME LIKE '%" + replaceText2 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				Fig2310Grid.setCellData(row, 8, 	data['CS_CODE'], true, true);
				Fig2310Grid.setCellData(row, 10, 	data['CS_NAME'], true, true);
				jsonFig2310[row-1]['TXN_STOP_YN'] = data['TXN_STOP_YN'];
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
    	var pp_line_type	= "'" + rowData['LINE_TYPE'] + "'"; 
    	var pp_open_to_fcm	= "'" + gfnma_nvl(SBUxMethod.get("sch-txtopen-to-fcm-yn")) + "'"; 
        
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
				Fig2310Grid.setCellData(row, 11, 	data['ACCOUNT_CODE'], true, true);
				Fig2310Grid.setCellData(row, 13, 	data['ACCOUNT_NAME'], true, true);
				
				jsonFig2310[row-1]['ACC_ITEM_CODE1'] = data['ACC_ITEM_CODE1'];
				jsonFig2310[row-1]['ACC_ITEM_CODE2'] = data['ACC_ITEM_CODE2'];
				jsonFig2310[row-1]['ACC_ITEM_CODE3'] = data['ACC_ITEM_CODE3'];
				jsonFig2310[row-1]['ACC_ITEM_CODE4'] = data['ACC_ITEM_CODE4'];
				jsonFig2310[row-1]['ACC_ITEM_CODE5'] = data['ACC_ITEM_CODE5'];
				jsonFig2310[row-1]['ACC_ITEM_CODE6'] = data['ACC_ITEM_CODE6'];
				jsonFig2310[row-1]['ACC_ITEM_CODE7'] = data['ACC_ITEM_CODE7'];
				jsonFig2310[row-1]['ACC_ITEM_CODE8'] = data['ACC_ITEM_CODE8'];
				jsonFig2310[row-1]['ACC_ITEM_CODE9'] = data['ACC_ITEM_CODE9'];
				jsonFig2310[row-1]['ACC_ITEM_CODE10'] = data['ACC_ITEM_CODE10'];
				
				jsonFig2310[row-1]['ACC_ITEM_NAME1'] = data['ACC_ITEM_NAME1'];
				jsonFig2310[row-1]['ACC_ITEM_NAME2'] = data['ACC_ITEM_NAME2'];
				jsonFig2310[row-1]['ACC_ITEM_NAME3'] = data['ACC_ITEM_NAME3'];
				jsonFig2310[row-1]['ACC_ITEM_NAME4'] = data['ACC_ITEM_NAME4'];
				jsonFig2310[row-1]['ACC_ITEM_NAME5'] = data['ACC_ITEM_NAME5'];
				jsonFig2310[row-1]['ACC_ITEM_NAME6'] = data['ACC_ITEM_NAME6'];
				jsonFig2310[row-1]['ACC_ITEM_NAME7'] = data['ACC_ITEM_NAME7'];
				jsonFig2310[row-1]['ACC_ITEM_NAME8'] = data['ACC_ITEM_NAME8'];
				jsonFig2310[row-1]['ACC_ITEM_NAME9'] = data['ACC_ITEM_NAME9'];
				jsonFig2310[row-1]['ACC_ITEM_NAME10'] = data['ACC_ITEM_NAME10'];
				
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
				
				jsonFig2310[row-1]['ACC_ITEM_YN1'] = data['ACC_ITEM_YN1'];
				jsonFig2310[row-1]['ACC_ITEM_YN2'] = data['ACC_ITEM_YN2'];
				jsonFig2310[row-1]['ACC_ITEM_YN3'] = data['ACC_ITEM_YN3'];
				jsonFig2310[row-1]['ACC_ITEM_YN4'] = data['ACC_ITEM_YN4'];
				jsonFig2310[row-1]['ACC_ITEM_YN5'] = data['ACC_ITEM_YN5'];
				jsonFig2310[row-1]['ACC_ITEM_YN6'] = data['ACC_ITEM_YN6'];
				jsonFig2310[row-1]['ACC_ITEM_YN7'] = data['ACC_ITEM_YN7'];
				jsonFig2310[row-1]['ACC_ITEM_YN8'] = data['ACC_ITEM_YN8'];
				jsonFig2310[row-1]['ACC_ITEM_YN9'] = data['ACC_ITEM_YN9'];
				jsonFig2310[row-1]['ACC_ITEM_YN10'] = data['ACC_ITEM_YN10'];
				
				jsonFig2310[row-1]['ACC_CATEGORY'] 	= data['ACC_CATEGORY'];
				jsonFig2310[row-1]['PROJECT_YN'] 	= data['PROJECT_YN'];
				jsonFig2310[row-1]['COST_CLASS'] 	= data['COST_CLASS'];
				
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
        let cellData1 = Fig2310Grid.getCellData(row, 17) 
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
				Fig2310Grid.setCellData(row, 17, 	data['DEPT_NAME'], true, true);
				Fig2310Grid.setCellData(row, 19, 	data['DEPT_CODE'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }      
    
    /**
     * 그리드내 팝업(원가중심점코드) 조회
     */
	function fn_gridPopup5(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2310Grid.getCellData(row, 20) 
        let cellData2 = Fig2310Grid.getCellData(row, 22) 
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
				Fig2310Grid.setCellData(row, 20, 	data['COST_CENTER_CODE'], true, true);
				Fig2310Grid.setCellData(row, 22, 	data['COST_CENTER_NAME'], true, true);
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
				Fig2310Grid.setCellData(row, 24, 	data['PROJECT_CODE'], true, true);
				Fig2310Grid.setCellData(row, 26, 	data['PROJECT_NAME'], true, true);
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
				Fig2310Grid.setCellData(row, 27, 	data['PAY_TERM_CODE'], true, true);
				Fig2310Grid.setCellData(row, 29, 	data['PAY_TERM_NAME'], true, true);
				Fig2310Grid.setCellData(row, 30, 	data['PAY_METHOD_NAME'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }          
    
    /**
     * 미결반제전표 생성
     */
    var fn_addItem = function() {
    	
//     	SBUxMethod.attr('modal-compopfig2320', 'header-title', '미결반제전표');
// 		SBUxMethod.openModal('modal-compopfig2320');
		
//     	compopfig2320({
//     		height			: '600px'
//     		,width			: '1600px'
//     		,param			: {
//     		}
//    			,callbackEvent	: function (data){
//    				console.log('callback data:', data);
//    			},
//     	});

        var obj = {
        	'MENU_MOVE'		: 'Y'	
        	,'target'		: 'MA_A20_030_020_001'
        }
        let json = JSON.stringify(obj);
        window.parent.cfn_openTabSearch(json);
  	}       
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>