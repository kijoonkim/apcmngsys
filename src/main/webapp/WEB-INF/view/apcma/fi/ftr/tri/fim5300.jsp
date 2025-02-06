<%
    /**
     * @Class Name 		: fim5300.jsp
     * @Description 	: 은행계좌정보 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.07.15
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.11   	신정철		최초 생성
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
    <title>title : 은행계좌정보</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
<style>
	#resizer{
			background-image:url('/static/resource/svg/dot_h.svg');
			background-repeat: no-repeat;
			background-position: center;
			background-size: 17px;
			cursor:ew-resize;
			background-color: rgba(43, 45, 48, 0.07);
			height: 100%;
			width: 5px;
		}
 
 
	.splitter {
		width: 100%;
		height: 100px;
		display: flex;
	}
 
	#separator {
		cursor: col-resize;
		background-color: #aaa;
		background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='10' height='30'><path d='M2 0 v30 M5 0 v30 M8 0 v30' fill='none' stroke='black'/></svg>");
		background-repeat: no-repeat;
		background-position: center;
		width: 10px;
		height: 100%;
 
		/* Prevent the browser's built-in drag from interfering */
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
	}
 
 
</style>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background: white; z-index: 999" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
			<div style="margin-left: auto;">
		        <sbux-button
		                id="btn-copy"
		                name="btn-copy"
		                uitype="normal"
		                class="btn btn-sm btn-primary"
		                text="복사"
		                onclick="fn_copy"
		        ></sbux-button>
      		</div>
        </div>
        <div class="box-body">
        	<div class="box-search-ma">
	        	<!--[APC] START -->
	            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
	            <!--[APC] END -->
	            
	            <table class="table table-bordered tbl_fixed table-search-ma">
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
	                    <th scope="row" class="th_bg_search">예적금유형</th>
						<td colspan="3" class="td_input" style="border-right:hidden;">
							<sbux-select
	                        	unselected-text="전체"
	                            uitype="single"
	                            id="srch-slt-depositType"
	                            name="srch-slt-depositType"
	                            class="form-control input-sm"
	                            jsondata-ref="jsonDepositType"
							/>					
						</td>
						<td></td>			
						<th scope="row" class="th_bg_search">금융기관</th>
	                    <td class="td_input" style="border-right: hidden;">
	                    	<sbux-input 
	                    		uitype="text" 
	                    		id="srch-inp-bankCsCode" 
	                    		name="srch-inp-bankCsCode" 
	                    		class="form-control input-sm"
	                    		readonly
	                    	></sbux-input>  
						</td>
						<td colspan="2" class="td_input" style="border-right: hidden;">
							<sbux-input 
								uitype="text" 
								id="srch-inp-bankCsName" 
								name="srch-inp-bankCsName" 
								class="form-control input-sm"
							></sbux-input>
						</td>
	                    <td class="td_input">
	                    	<sbux-button 
	                    		class="btn btn-xs btn-outline-dark" 
	                    		text="..." 
	                    		uitype="modal" 
	                    		target-id="modal-compopup1" 
	                    		onclick="fn_compopupComBank('srch-inp-bankCsCode', 'srch-inp-bankCsName')"
	                    	></sbux-button>
	                    </td>
						<th scope="row" class="th_bg_search">APC</th>
	                    <td colspan="3" class="td_input" style="border-right: hidden;">
	                    	  <div class="dropdown">
								<button 
									style="width:100%;text-align:left" 
									class="btn btn-sm btn-light dropdown-toggle" 
									type="button" 
									id="srch-fiOrgCode" 
									data-toggle="dropdown" 
									aria-haspopup="true" 
									aria-expanded="false"
								>
									<font>선택</font>
									<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
								</button>
								<div 
									class="dropdown-menu" 
									aria-labelledby="srch-fiOrgCode" 
									style="width:300px;height:150px;padding-top:0px;overflow:auto"
								></div>
							</div>  
						</td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <th scope="row" class="th_bg_search">조회기준일자</th>
						<td colspan="3" class="td_input" style="border-right:hidden;">
							<sbux-datepicker
								uitype="popup" 
								id="srch-dtp-txnDate" 
								name="srch-dtp-txnDate"
								date-format="yyyy-mm-dd" 
								class="table-datepicker-ma inpt_data_reqed"
								wrap-style="border:0;padding:0;"
								group-id="panHeader"
	                            required
							/>						
						</td>
						<td></td>
						<th scope="row" class="th_bg_search">경과예금포함여부</th>
						<td colspan="3" class="td_input" style="border-right:hidden;">
							<sbux-select
	                        	unselected-text="전체"
	                            uitype="single"
	                            id="srch-slt-allYn"
	                            name="srch-slt-allYn"
	                            class="form-control input-sm"
	                            jsondata-ref="jsonUseYn"
							/>					
						</td>
						<td></td>
						<th scope="row" class="th_bg_search">계좌번호</th>
	                    <td colspan="3" class="td_input" style="border-right: hidden;">
	                    	<sbux-input 
	                    		id="srch-inp-accountNum" 
	                    		class="form-control input-sm" 
	                    		uitype="text" 
	                    		style="width:100%"
	                    	></sbux-input>
	                    </td>
	                    <td></td>
	                </tr>
	                </tbody>
	            </table>
			</div>
 
			<div style=" height: 80vh; display: flex">
			<!--<div class="row">-->
				<div style="width: 30%;padding: 10px">
            	<!--<div class="col-sm-6 col-md-7">-->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
                        	<li>
                        		<span>예적금원장</span>
							</li>
                     	</ul>
					</div>
					<div>
                    	<div id="sb-area-grdSvgGnlgr" style="height:700px; width:100%;"></div>
                   	</div>
				</div>
				<div id="resizer"></div>
				<div style="padding: 10px;flex: 1;display: flex;flex-direction: column">
				<!--div class="col-sm-6 col-md-5">-->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
                        	<li>
                        		<span>기본정보</span>
							</li>
                     	</ul>
					</div>
					<div>
						<sbux-input 
                        	id="dtl-inp-depositId" 
                            name="dtl-inp-depositId" 
                            uitype="hidden"
                        ></sbux-input>
                    	<table class="table table-bordered tbl_fixed">
                        	<colgroup>
                            	<col style="width:20%">
                                <col style="width:30%">
                                <col style="width:20%">
                                <col style="width:10%">
                                <col style="width:10%">
                                <col style="width:10%">
                          	</colgroup>
                            <tr>
                            	<th scope="row" class="th_bg">APC</th>
                                <td class="td_input">
									<sbux-select
			                        	unselected-text="선택"
			                            uitype="single"
			                            id="dtl-slt-fiOrgCode"
			                            name="dtl-slt-fiOrgCode"
			                            class="form-control input-sm"
			                            jsondata-ref="jsonFiOrgCode"
									/>
                                </td>
                                <th scope="row" class="th_bg">계좌유형</th>
                                <td colspan="3" class="td_input">
									<sbux-select
			                        	unselected-text="선택"
			                            uitype="single"
			                            id="dtl-slt-depositType"
			                            name="dtl-slt-depositType"
			                            class="form-control input-sm"
			                            jsondata-ref="jsonDepositType"
									/>
                                </td>
                          	</tr>
                            <tr>
                            	<th scope="row" class="th_bg">계좌코드</th>
                                <td class="td_input">
                                	<sbux-input 
                                    	id="dtl-inp-depositCode" 
                                    	name="dtl-inp-depositCode" 
                                    	class="form-control input-sm" 
                                    	uitype="text" 
                                    	required 
                                    	style="width:100%"
                                    	readonly
                                    ></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">예금주</th>
                                <td colspan="3" class="td_input">
                                    <sbux-input 
                                    	id="dtl-inp-accountOwner"
                                    	name="dtl-inp-accountOwner"  
                                    	class="form-control input-sm" 
                                    	uitype="text" 
                                    	required 
                                    	style="width:100%"
                                    ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                            	<th scope="row" class="th_bg">계좌명</th>
                                <td colspan="5" class="td_input">
                                	<sbux-input 
                                    	id="dtl-inp-depositName" 
                                    	id="dtl-inp-depositName" 
                                    	class="form-control input-sm" 
                                    	uitype="text" 
                                    	required 
                                    	style="width:100%"
                                    ></sbux-input>
                                </td>
                           	</tr>
                           	<tr>
                            	<th scope="row" class="th_bg">계좌번호</th>
                                <td class="td_input">
                                	<sbux-input 
                                    	id="dtl-inp-accountNum" 
                                    	class="form-control input-sm" 
                                    	uitype="text" 
                                    	required 
                                    	style="width:100%"
                                    ></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">계좌구분</th>
                                <td colspan="3" class="td_input">
                                    <sbux-input
                                    	id="dtl-inp-depositCategory3" 
                                    	name="dtl-inp-depositCategory3" 
                                    	class="form-control input-sm" 
                                    	uitype="text" 
                                    	required 
                                    	style="width:100%"
                                    ></sbux-input>
                                </td>
                            </tr>
                            <tr>
                            	<th scope="row" class="th_bg">분류1</th>
                                <td class="td_input">
                                	<sbux-input 
                                    	id="dtl-inp-depositCategory1" 
                                    	name="dtl-inp-depositCategory1" 
                                    	class="form-control input-sm" 
                                    	uitype="text" 
                                    	required 
                                    	style="width:100%"
                                    ></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">분류2</th>
                                <td colspan="3" class="td_input">
                                    <sbux-input 
                                    	id="dtl-inp-depositCategory2" 
                                    	name="dtl-inp-depositCategory2" 
                                    	class="form-control input-sm" 
                                    	uitype="text" 
                                    	required 
                                    	style="width:100%"
                                    ></sbux-input>
                            	</td>
                         	</tr>
                         	<tr>
                                <th scope="row" class="th_bg">금융기관</th>
                                <td class="td_input" style="border-right: hidden;">
									<sbux-input 
										uitype="text" 
										id="dtl-inp-bankCsCode" 
										name="dtl-inp-bankCsCode" 
										class="form-control input-sm" 
									></sbux-input>
								</td>
								<td colspan="3" class="td_input" style="border-right: hidden;">
									<sbux-input 
										uitype="text" 
										id="dtl-inp-bankCsName" 
										name="dtl-inp-bankCsName" 
										class="form-control input-sm" 
									></sbux-input>
								</td>
								<td class="td_input">
									<sbux-button 
										class="btn btn-xs btn-outline-dark" 
										text="..." 
										uitype="modal" 
										target-id="modal-compopup1" 
										onclick="fn_compopupComBankD" 
									></sbux-button>
								</td>
                            </tr>
                            <tr>
                            	<th scope="row" class="th_bg">은행</th>
                              	<td class="td_input" data-group="BANK">
                                	<sbux-input 
                                		id="dtl-inp-bankCode" 
                                		name="dtl-inp-bankCode" 
                                		class="form-control input-sm inpt_data_reqed" 
                                		uitype="text" 
                                		group-id="panList" 
                                		required
                                	></sbux-input>
                                </td>
                                <td colspan="3" class="td_input" data-group="BANK">
                                	<sbux-input 
                                		id="dtl-inp-bankName" 
                                		name="dtl-inp-bankName" 
                                		class="form-control input-sm inpt_data_reqed" 
                                		uitype="text" 
                                		style="width:100%" 
                                		group-id="panList" 
                                		required
                                	></sbux-input>
                                </td>
                                <td class="td_input" style="border-right:hidden;" data-group="BANK">
                                	<sbux-button
                                    	class="btn btn-xs btn-outline-dark"
                                        text="..." 
                                        uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopupBankD"
                               		></sbux-button>
                                </td>
                         	</tr>
                         	<tr>
                         		<th scope="row" class="th_bg">지점</th>
                                <td class="td_input">
                                	<sbux-input 
                                    	id="dtl-inp-branch" 
                                    	class="form-control input-sm" 
                                    	uitype="text" 
                                    	required 
                                    	style="width:100%"
                                    ></sbux-input>
                                </td>
                                <th scope="row" class="th_bg">예적금상태</th> 
                                <td colspan="3" class="td_input" style="border-right:hidden;">
                                    <sbux-select
			                        	unselected-text="선택"
			                            uitype="single"
			                            id="dtl-slt-depositStatus"
			                            name="dtl-slt-depositStatus"
			                            class="form-control input-sm"
			                            jsondata-ref="jsonDepositStatus"
									/>
                            	</td>
                         	</tr>
                         	<tr>
                         		<th scope="row" class="th_bg">적요</th>
                                <td colspan="5" class="td_input">
                                	<sbux-input 
                                    	id="dtl-inp-descr"
                                    	name="dtl-inp-descr"
                                    	class="form-control input-sm" 
                                    	uitype="text" 
                                    	style="width:100%"
                                    ></sbux-input>
                                </td>
                         	</tr>
                         	<tr>
                         		<th scope="row" class="th_bg">출금계좌여부</th>
                         		<td class="td_input" style="border-right: hidden;">
                         			<p class="ad_input_row">
                                        <sbux-checkbox
                                        	uitype="normal"
                                            id="dtl-chk-withdrawAccYn"
                                            name="dtl-chk-withdrawAccYn"
                                            uitype="normal"
                                            class="form-control input-sm check"
                                            text="출금계좌"
                                            true-value="Y" 
                                            false-value="N"
                                    	/>
                                  	</p>  
                         		</td>
                         		<td class="td_input" style="border-right: hidden;">FBS계좌</td>
                         		<td class="td_input" style="border-right: hidden;">
                         			<p class="ad_input_row">
                                        <sbux-checkbox
                                        	uitype="normal"
                                            id="dtl-chk-fbsYn"
                                            name="dtl-chk-fbsYn"
                                            uitype="normal"
                                            class="form-control input-sm check"
                                            text="예"
                                            true-value="Y" 
                                            false-value="N"
                                    	/>
                                  	</p>  
                         		</td>
                         		<td class="td_input" style="border-right: hidden;">회차관리</td>
                         		<td class="td_input" style="border-right: hidden;">
                         			<p class="ad_input_row">
                                        <sbux-checkbox
                                        	uitype="normal"
                                            id="dtl-chk-seqYn"
                                            name="dtl-chk-seqYn"
                                            uitype="normal"
                                            class="form-control input-sm check"
                                            text="예"
                                            true-value="Y" 
                                            false-value="N"
                                    	/>
                                  	</p>  
                         		</td>
                         	</tr>
							<tr>
								<th scope="row" class="th_bg">출금방법</th>
								<td class="td_input">
									<sbux-select
			                        	unselected-text="선택"
			                            uitype="single"
			                            id="dtl-slt-withdrawType"
			                            name="dtl-slt-withdrawType"
			                            class="form-control input-sm"
			                            jsondata-ref="jsonWithdrawType"
									/>
								</td>
								<th scope="row" class="th_bg">부가세FBS</th>
								<td colspan="3" class="td_input">
									<p class="ad_input_row">
                                        <sbux-checkbox
                                        	uitype="normal"
                                            id="dtl-chk-taxFbsYn"
                                            name="dtl-chk-taxFbsYn"
                                            uitype="normal"
                                            class="form-control input-sm check"
                                            text="예"
                                            true-value="Y" 
                                            false-value="N"
                                    	/>
                                  	</p>
								</td>
							</tr>
							<tr>
								<th scope="row" class="th_bg">1회한도</th>
								<td class="td_input">
									<sbux-input 
										uitype="text" 
										id="dtl-inp-limit1"
										name="dtl-inp-limit1"
										class="form-control input-sm" 			
										style="width:120px;
										margin-right:5px"
										maxlength="20"
										autocomplete="off"
										mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									></sbux-input>
								</td>
								<th scope="row" class="th_bg">1일한도</th>
								<td colspan="3" class="td_input">
									<sbux-input 
										uitype="text" 
										id="dtl-inp-limit2"
										name="dtl-inp-limit2"
										class="form-control input-sm" 			
										style="width:120px;
										margin-right:5px"
										maxlength="20"
										autocomplete="off"
										mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									></sbux-input>
								</td>
							</tr>
						</table>
					</div>
					
					<!--
					<sbux-accordion id="idxAccrd" name="idxAccrd" uitype="normal"
						title-target-id-array="detail-content"
						title-text-array="세부내역"
						style="	font-weight: 600; color: #3c6dbc;background-color: #e8f1f9;"
					></sbux-accordion>
					 -->
                   	
                   	<div class="ad_tbl_top">
                    	<ul class="ad_tbl_count">
                        	<li><span>세부내역</span></li>
                        </ul>
                    </div>
                    
					<div id="detail-content">
						<sbux-tabs
							id="tab-bank"
							name="tab-bank"
							uitype="normal"
							is-scrollable="false"
							jsondata-css-style="styleKey"
							jsondata-ref="jsonDetailTabData"
							onclick="fn_tabClick"
						></sbux-tabs>
						<div class="tab-content">
							<!-- ##개설정보 -->
							<div id="tp-estbl" class="tab-page">
			          			<table class="table table-bordered tbl_fixed">
	                                <colgroup>
	                                    <col style="width:18%">
	                                    <col style="width:32%">
	                                    <col style="width:18%">
	                                    <col style="width:22%">
	                                    <col style="width:10%">
	                                </colgroup>
	                                <tr>
	                                    <th scope="row" class="th_bg">개설일</th>
	                                    <td class="td_input">
	                                    	<sbux-datepicker
												uitype="popup" 
												id="estbl-dtp-openDate" 
												name="estbl-dtp-openDate"
												date-format="yyyy-mm-dd" 
												class="table-datepicker-ma"
												wrap-class="displayFlex" 
												wrap-style="border:0;padding:0;"
												group-id="pan-estbl"
											/>
	                                    </td>
	                                    <th scope="row" class="th_bg">만기일</th>
	                                    <td colspan="2" class="td_input">
	                                    	<sbux-datepicker
												uitype="popup" 
												id="estbl-dtp-expireDate" 
												name="estbl-dtp-expireDate"
												date-format="yyyy-mm-dd" 
												class="table-datepicker-ma"
												wrap-class="displayFlex" 
												wrap-style="border:0;padding:0;"
												group-id="pan-estbl"
											/>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">통화</th>
	                                    <td class="td_input">
	                                    	<sbux-select
					                        	unselected-text="선택"
					                            uitype="single"
					                            id="estbl-slt-currencyCode"
					                            name="estbl-slt-currencyCode"
					                            class="form-control input-sm"
					                            jsondata-ref="jsonCurrencyCode"
					                            group-id="pan-estbl"
											/>
	                                    </td>
	                                    <th scope="row" class="th_bg">환율</th>
	                                    <td colspan="2" class="td_input">
	                                    	<sbux-input 
												uitype="text" 
												id="estbl-inp-exchangeRate"
												name="estbl-inp-exchangeRate"
												class="form-control input-sm" 			
												style="width:120px;
												margin-right:5px"
												maxlength="10"
												autocomplete="off"
												mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
												group-id="pan-estbl"
											></sbux-input>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">계약금액</th>
	                                    <td class="td_input">
	                                    	<sbux-input 
												uitype="text" 
												id="estbl-inp-contractAmt"
												name="estbl-inp-contractAmt"
												class="form-control input-sm" 			
												style="width:120px;
												margin-right:5px"
												maxlength="10"
												autocomplete="off"
												mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
												group-id="pan-estbl"
											></sbux-input>
	                                    </td>
	                                    <th scope="row" class="th_bg">원화계약금액</th>
	                                    <td colspan="2" class="td_input">
	                                    	<sbux-input 
												uitype="text" 
												id="estbl-inp-contractAmtKrw"
												name="estbl-inp-contractAmtKrw"
												class="form-control input-sm" 			
												style="width:120px;
												margin-right:5px"
												maxlength="10"
												autocomplete="off"
												mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
												group-id="pan-estbl"
											></sbux-input>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">납입주기</th>
	                                    <td class="td_input">
	                                    	<sbux-spinner 
	                                    		id="estbl-spnn-payinCycle" 
	                                    		name="estbl-spnn-payinCycle"
                                                wrap-style="flex-basis:30%"
                                                uitype="normal"  
                                                number-min-value="0"
                                                number-max-value="9999999999" 
                                                group-id="pan-estbl"
                                    		></sbux-spinner>
	                                    </td>
	                                    <th scope="row" class="th_bg">납입일</th>
	                                    <td colspan="2" class="td_input">
	                                    	<sbux-datepicker
												uitype="popup" 
												id="estbl-dtp-payinDate" 
												name="estbl-dtp-payinDate"
												date-format="yyyy-mm-dd" 
												class="table-datepicker-ma"
												wrap-class="displayFlex" 
												wrap-style="border:0;padding:0;"
												group-id="pan-estbl"
					                            required
											/>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">총납입횟수</th>
	                                    <td class="td_input">
	                                    	<sbux-input 
												uitype="text" 
												id="estbl-inp-totalPayinCount"	
												name="estbl-inp-totalPayinCount"
												class="form-control input-sm" 			
												style="width:120px;
												margin-right:5px"
												maxlength="10"
												autocomplete="off"
												mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
												group-id="pan-estbl"
											></sbux-input>
	                                    </td>
	                                    <th scope="row" class="th_bg">일회불입금</th>
	                                    <td colspan="2" class="td_input">
	                                    	<sbux-input 
												uitype="text" 
												id="estbl-inp-moneyPerAmt"
												name="estbl-inp-moneyPerAmt"
												class="form-control input-sm" 			
												style="width:120px;
												margin-right:5px"
												maxlength="10"
												autocomplete="off"
												mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
												group-id="pan-estbl"
											></sbux-input>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">이자율</th>
	                                    <td class="td_input">
	                                    	<sbux-input 
												uitype="text" 
												id="estbl-inp-interestRate"
												name="estbl-inp-interestRate"
												class="form-control input-sm" 			
												style="width:120px;
												margin-right:5px"
												maxlength="10"
												autocomplete="off"
												mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
												group-id="pan-estbl"
											></sbux-input>
	                                    </td>
	                                    <th scope="row" class="th_bg">세율(%)</th>
	                                    <td colspan="2" class="td_input">
	                                    	<sbux-input 
												uitype="text" 
												id="estbl-inp-corporateTaxRate"
												name="estbl-inp-corporateTaxRate"
												class="form-control input-sm" 			
												style="width:120px;
												margin-right:5px"
												maxlength="10"
												autocomplete="off"
												mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
												group-id="pan-estbl"
											></sbux-input>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">가상은행</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="estbl-inp-txnBankCode" 
		                                		name="estbl-inp-txnBankCode" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-estbl"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="estbl-inp-txnBankName" 
		                                		name="estbl-inp-txnBankName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-estbl"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupBankEstbl"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">가상계좌</th>
	                                    <td class="td_input">
	                                    	<sbux-input 
		                                		id="estbl-inp-txnAccountNum" 
		                                		name="estbl-inp-txnAccountNum" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-estbl"
		                                	></sbux-input>
	                                    </td>
	                                    <th scope="row" class="th_bg">가상계좌주</th>
	                                    <td class="td_input">
	                                    	<sbux-input 
		                                		id="estbl-inp-txnAccountOwner"
		                                		name="estbl-inp-txnAccountOwner" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-estbl"
		                                	></sbux-input>
	                                    </td>
	                                </tr>
	                          	</table>
			       			</div>
			       			
							<!-- 해약정보 -->
							<div id="tp-cncl" class="tab-page">
			          			<table class="table table-bordered tbl_fixed">
	                                <colgroup>
	                                    <col style="width:18%">
	                                    <col style="width:32%">
	                                    <col style="width:18%">
	                                    <col style="width:32%">
	                                </colgroup>
	                                <tr>
	                                    <th scope="row" class="th_bg">해약일</th>
	                                    <td colspan="3" class="td_input">
	                                    	<sbux-datepicker
												uitype="popup" 
												id="cncl-dtp-cancelDate" 
												name="cncl-dtp-cancelDate"
												date-format="yyyy-mm-dd" 
												class="table-datepicker-ma"
												wrap-class="displayFlex" 
												wrap-style="border:0;padding:0;"
												group-id="pan-cncl"
					                            required
											/>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">해약사유</th>
	                                    <td colspan="3" class="td_input">
	                                    	<sbux-input 
		                                		id="cncl-inp-cancelReason"
		                                		name="cncl-inp-cancelReason" 
		                                		class="form-control input-sm" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-cncl"
		                                	></sbux-input>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">해약시환율</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
												uitype="text" 
												id="cncl-inp-cancelExchangeRate"
												name="cncl-inp-cancelExchangeRate"
												class="form-control input-sm" 			
												style="width:120px;
												margin-right:5px"
												maxlength="10"
												autocomplete="off"
												mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
												group-id="pan-cncl"
											></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">해약시원금</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
												uitype="text" 
												id="cncl-inp-cancelAmt"
												name="cncl-inp-cancelAmt"
												class="form-control input-sm" 			
												style="width:120px;
												margin-right:5px"
												maxlength="10"
												autocomplete="off"
												mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
												group-id="pan-cncl"
											></sbux-input>
	                                    </td>
	                                    <th scope="row" class="th_bg">원화해약시원금</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
												uitype="text" 
												id="cncl-inp-cancelAmtKrw"
												name="cncl-inp-cancelAmtKrw"
												class="form-control input-sm" 			
												style="width:120px;
												margin-right:5px"
												maxlength="10"
												autocomplete="off"
												mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
												group-id="pan-cncl"
											></sbux-input>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">해약시이자</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
												uitype="text" 
												id="cncl-inp-cancelInterestAmt"
												name="cncl-inp-cancelInterestAmt"
												class="form-control input-sm" 			
												style="width:120px;
												margin-right:5px"
												maxlength="10"
												autocomplete="off"
												mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
												group-id="pan-cncl"
											></sbux-input>
	                                    </td>
	                                    <th scope="row" class="th_bg">원화해약시이자</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
												uitype="text" 
												id="cncl-inp-cancelInterestAmtKrw"
												name="cncl-inp-cancelInterestAmtKrw"
												class="form-control input-sm" 			
												style="width:120px;
												margin-right:5px"
												maxlength="10"
												autocomplete="off"
												mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
												group-id="pan-cncl"
											></sbux-input>
	                                    </td>
	                                </tr>
	                        	</table>
			       			</div>
			       			
			       			<!-- 회차정보 TNGTRN -->
							<div id="tp-tngtrn" class="tab-page">
			       				<div class="ad_tbl_top">
			           				<ul class="ad_tbl_count">
					        			<li>회차정보</li>
			           				</ul>
			        			</div>
			         			<div id="sb-area-grdTngtrn" style="height:300px"></div>
			       			</div>
			       			
			       			<!-- 계정정보 -->
							<div id="tp-acnt" class="tab-page">
			          			<table class="table table-bordered tbl_fixed">
	                                <colgroup>
	                                    <col style="width:18%">
	                                    <col style="width:32%">
	                                    <col style="width:18%">
	                                    <col style="width:22%">
	                                    <col style="width:10%">
	                                </colgroup>
	                                <tr>
	                                    <th scope="row" class="th_bg">예금계정</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-depositAccount"
		                                		name="acnt-inp-depositAccount" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-depositAccountName" 
		                                		name="acnt-inp-depositAccountName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupAccountCode('acnt-inp-depositAccount', 'acnt-inp-depositAccountName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">선수수익계정</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-advancedIncomeAccount"
		                                		name="acnt-inp-advancedIncomeAccount" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-advancedIncomeAccountName" 
		                                		name="acnt-inp-advancedIncomeAccountName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupAccountCode('acnt-inp-advancedIncomeAccount', 'acnt-inp-advancedIncomeAccountName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">미수수익계정</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-accruedIncomeAccount"
		                                		name="acnt-inp-accruedIncomeAccount" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-accruedIncomeAccountName" 
		                                		name="acnt-inp-accruedIncomeAccountName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupAccountCode('acnt-inp-accruedIncomeAccount', 'acnt-inp-accruedIncomeAccountName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">선급법인세계정</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-ctaxWithholdAccount"
		                                		name="acnt-inp-ctaxWithholdAccount" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-ctaxWithholdAccountName" 
		                                		name="acnt-inp-ctaxWithholdAccountName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupAccountCode('acnt-inp-ctaxWithholdAccount', 'acnt-inp-ctaxWithholdAccountName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">선급지방소득세계정</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-ptaxWithholdAccount"
		                                		name="acnt-inp-ptaxWithholdAccount" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-ptaxWithholdAccountName" 
		                                		name="acnt-inp-ptaxWithholdAccountName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupAccountCode('acnt-inp-ptaxWithholdAccount', 'acnt-inp-ptaxWithholdAccountName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">지급어음계정</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-billAccount"
		                                		name="acnt-inp-billAccount" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-billAccountName" 
		                                		name="acnt-inp-billAccountName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupAccountCode('acnt-inp-billAccount', 'acnt-inp-billAccountName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">수금정산계정</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-receiptAccount"
		                                		name="acnt-inp-receiptAccount" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-receiptAccountName" 
		                                		name="acnt-inp-receiptAccountName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupAccountCode('acnt-inp-receiptAccount', 'acnt-inp-receiptAccountName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                        	</table>
			       			</div>
			       			<!-- 손익계정 -->
							<div id="tp-pflsAcnt" class="tab-page">
			          			<table class="table table-bordered tbl_fixed">
	                                <colgroup>
	                                    <col style="width:18%">
	                                    <col style="width:32%">
	                                    <col style="width:18%">
	                                    <col style="width:22%">
	                                    <col style="width:10%">
	                                </colgroup>
	                                <tr>
	                                    <th scope="row" class="th_bg">이자수익계정</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-interestIncomeAccount"
		                                		name="acnt-inp-interestIncomeAccount" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-interestIncomeAccountName" 
		                                		name="acnt-inp-interestIncomeAccountName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupAccountCode('acnt-inp-interestIncomeAccount', 'acnt-inp-interestIncomeAccountName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">환차익계정</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-exchangeGainAccount"
		                                		name="acnt-inp-exchangeGainAccount" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-exchangeGainAccountName" 
		                                		name="acnt-inp-exchangeGainAccountName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupAccountCode('acnt-inp-exchangeGainAccount', 'acnt-inp-exchangeGainAccountName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">환차손계정</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-exchangeLossAccount"
		                                		name="acnt-inp-exchangeLossAccount" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-exchangeLossAccountName" 
		                                		name="acnt-inp-exchangeLossAccountName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupAccountCode('acnt-inp-exchangeLossAccount', 'acnt-inp-exchangeLossAccountName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">외화평가이익계정</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-valGainAccount"
		                                		name="acnt-inp-valGainAccount" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-valGainAccountName" 
		                                		name="acnt-inp-valGainAccountName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupAccountCode('acnt-inp-valGainAccount', 'acnt-inp-valGainAccountName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">외화평가손실계정</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-valLossAccount"
		                                		name="acnt-inp-valLossAccount" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-valLossAccountName" 
		                                		name="acnt-inp-valLossAccountName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupAccountCode('acnt-inp-valLossAccount', 'acnt-inp-valLossAccountName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">수수료계정</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-feeAccount"
		                                		name="acnt-inp-feeAccount" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="acnt-inp-feeAccountName" 
		                                		name="acnt-inp-feeAccountName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-acnt"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupAccountCode('acnt-inp-feeAccount', 'acnt-inp-feeAccountName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                        	</table>
			       			</div>
			       			<!-- 자금수지 -->
							<div id="tp-fundPfls" class="tab-page">
			          			<table class="table table-bordered tbl_fixed">
	                                <colgroup>
	                                    <col style="width:18%">
	                                    <col style="width:32%">
	                                    <col style="width:18%">
	                                    <col style="width:22%">
	                                    <col style="width:10%">
	                                </colgroup>
	                                <tr>
	                                    <th scope="row" class="th_bg">예금이체입금</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-depositInTrType"
		                                		name="fund-inp-depositInTrType" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-depositInTrName" 
		                                		name="fund-inp-depositInTrName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupFundCode('fund-inp-depositInTrType', 'fund-inp-depositInTrName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">예금이체출금</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-depositOutTrType"
		                                		name="fund-inp-depositOutTrType" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-depositOutTrName" 
		                                		name="fund-inp-depositOutTrName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupFundCode('fund-inp-depositOutTrType', 'fund-inp-depositOutTrName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">이자수익</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-interestInTrType"
		                                		name="fund-inp-interestInTrType" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-interestInTrName" 
		                                		name="fund-inp-interestInTrName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupFundCode('fund-inp-interestInTrType', 'fund-inp-interestInTrName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">법인세원천징수</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-ctaxWithholdTrType"
		                                		name="fund-inp-ctaxWithholdTrType" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-ctaxWithholdTrName" 
		                                		name="fund-inp-ctaxWithholdTrName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-fundPfls"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupFundCode('fund-inp-ctaxWithholdTrType', 'fund-inp-ctaxWithholdTrName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">주민세원천징수</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-ptaxWithholdTrType"
		                                		name="fund-inp-ptaxWithholdTrType" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-fundPfls"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-ptaxWithholdTrName" 
		                                		name="fund-inp-ptaxWithholdTrName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupFundCode('fund-inp-ptaxWithholdTrType', 'fund-inp-ptaxWithholdTrName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">수금</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-receiptTrType"
		                                		name="fund-inp-receiptTrType" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-fundPfls"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-receiptTrName" 
		                                		name="fund-inp-receiptTrName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupFundCode('fund-inp-receiptTrType', 'fund-inp-receiptTrName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">수수료</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-feeTrType"
		                                		name="fund-inp-feeTrType" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-fundPfls"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-feeTrName" 
		                                		name="fund-inp-feeTrName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupFundCode('fund-inp-feeTrType', 'fund-inp-feeTrName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                        	</table>
			       			</div>
			       			<!-- 자금수지-외화 FRCNCY-->
							<div id="tp-fundPflsFrcncy" class="tab-page">
			          			<table class="table table-bordered tbl_fixed">
	                                <colgroup>
	                                    <col style="width:18%">
	                                    <col style="width:32%">
	                                    <col style="width:18%">
	                                    <col style="width:22%">
	                                    <col style="width:10%">
	                                </colgroup>
	                                <tr>
	                                    <th scope="row" class="th_bg">환차익자금수지</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-exchangeGainTrType"
		                                		name="fund-inp-exchangeGainTrType" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-exchangeGainTrName" 
		                                		name="fund-inp-exchangeGainTrName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupFundCode('fund-inp-exchangeGainTrType', 'fund-inp-exchangeGainTrName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">환차손자금수지</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-exchangeLossTrType"
		                                		name="fund-inp-exchangeLossTrType" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-exchangeLossTrName" 
		                                		name="fund-inp-exchangeLossTrName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupFundCode('fund-inp-exchangeLossTrType', 'fund-inp-exchangeLossTrName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">어음발행</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-billInTrType"
		                                		name="fund-inp-billInTrType" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-billInTrName" 
		                                		name="fund-inp-billInTrName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupFundCode('fund-inp-billInTrType', 'fund-inp-billInTrName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">어음만기</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-billOutTrType"
		                                		name="fund-inp-billOutTrType" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="fund-inp-billOutTrName" 
		                                		name="fund-inp-billOutTrName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-fund"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupFundCode('fund-inp-billOutTrType', 'fund-inp-billOutTrName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                        	</table>
			       			</div>
			       			
			       			<!-- 조직정보-->
							<div id="tp-ognz" class="tab-page">
			          			<table class="table table-bordered tbl_fixed">
	                                <colgroup>
	                                    <col style="width:18%">
	                                    <col style="width:32%">
	                                    <col style="width:18%">
	                                    <col style="width:22%">
	                                    <col style="width:10%">
	                                </colgroup>
	                                <tr>
	                                    <th scope="row" class="th_bg">부서</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="ognz-inp-deptCode"
		                                		name="ognz-inp-deptCode" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-ognz"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="ognz-inp-deptName" 
		                                		name="ognz-inp-deptName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-ognz"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupDeptCode('ognz-inp-deptCode', 'ognz-inp-deptName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">원가중심점</th>
	                                    <td class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="ognz-inp-costCenterCode"
		                                		name="ognz-inp-costCenterCode" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		group-id="pan-ognz"
		                                	></sbux-input>
	                                    </td>
	                                    <td colspan="2" class="td_input" style="border-right:hidden;">
	                                    	<sbux-input 
		                                		id="ognz-inp-costCenterName" 
		                                		name="ognz-inp-costCenterName" 
		                                		class="form-control input-sm inpt_data_reqed" 
		                                		uitype="text" 
		                                		style="width:100%" 
		                                		group-id="pan-ognz"
		                                	></sbux-input>
	                                    </td>
	                                    <td class="td_input">
	                                    	<sbux-button
		                                    	class="btn btn-xs btn-outline-dark"
		                                        text="..." 
		                                        uitype="modal"
		                                        target-id="modal-compopup1"
		                                        onclick="fn_compopupCostCenterCode('ognz-inp-costCenterCode', 'ognz-inp-costCenterName')"
		                               		></sbux-button>
	                                    </td>
	                                </tr>
	                        	</table>
			       			</div>
			       		</div>
			       		
					</div>
				</div>
			</div>
        </div>
    </div>
</section>
 
<div>
    <sbux-modal
    	style="width:600px" 
    	id="modal-compopup1" 
    	name="modal-compopup1" 
    	uitype="middle" 
    	header-title="" 
    	body-html-id="body-modal-compopup1" 
    	header-is-close-button="true" 
    	footer-is-close-button="false" 
    ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>
 
 
</body>
<script>
 
	// common ---------------------------------------------------
	var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId = '${comMenuVO.menuId}';
	var p_empCd = '${loginVO.maEmpCode}';
	var p_fiOrgCode = "${loginVO.maFIOrgCode}";
	//-----------------------------------------------------------
 
	// Tab Data
	var jsonDetailTabData = [
	    { "styleKey": "font-size:11px;", "id" : "0", "pid" : "-1", "order" : "1", "text" : "개설정보", "targetid" : "tp-estbl", "targetvalue" : "개설정보" },
	    { "styleKey": "font-size:11px;", "id" : "1", "pid" : "-1", "order" : "2", "text" : "해약정보", "targetid" : "tp-cncl", "targetvalue" : "해약정보" },
	    { "styleKey": "font-size:11px;", "id" : "2", "pid" : "-1", "order" : "3", "text" : "회차정보", "targetid" : "tp-tngtrn", "targetvalue" : "회차정보" },
	    { "styleKey": "font-size:11px;", "id" : "3", "pid" : "-1", "order" : "4", "text" : "계정정보", "targetid" : "tp-acnt", "targetvalue" : "계정정보" },
	    { "styleKey": "font-size:11px;", "id" : "4", "pid" : "-1", "order" : "5", "text" : "손익계정", "targetid" : "tp-pflsAcnt", "targetvalue" : "손익계정" },
	    { "styleKey": "font-size:11px;", "id" : "5", "pid" : "-1", "order" : "6", "text" : "자금수지", "targetid" : "tp-fundPfls", "targetvalue" : "자금수지" },
	    { "styleKey": "font-size:11px;", "id" : "6", "pid" : "-1", "order" : "7", "text" : "자금수지-외화", "targetid" : "tp-fundPflsFrcncy", "targetvalue" : "자금수지-외화" },
	    { "styleKey": "font-size:11px;", "id" : "7", "pid" : "-1", "order" : "8", "text" : "조직정보", "targetid" : "tp-ognz", "targetvalue" : "조직정보" },
	];
 
	const elements = [
		{"type": "string", "id": "fiOrgCode", "col": "ACNTG_OGNZ_CD", "elmt": "dtl-slt-fiOrgCode"},
		{"type": "string", "id": "depositType", "col": "DPMNY_TYPE", "elmt": "dtl-slt-depositType"},
		{"type": "string", "id": "accountNum", "col": "ACTNO", "elmt": "dtl-inp-accountNum"},
		{"type": "string", "id": "depositCode", "col": "DPMNY_CD", "elmt": "dtl-inp-depositCode"},
		{"type": "string", "id": "depositName", "col": "DPMNY_NM", "elmt": "dtl-inp-depositName"},
		{"type": "string", "id": "accountOwner", "col": "DPSTR_NM", "elmt": "dtl-inp-accountOwner"},
		{"type": "string", "id": "depositCategory1", "col": "DPMNY_CTGRY1", "elmt": "dtl-inp-depositCategory1"},
		{"type": "string", "id": "depositCategory2", "col": "DPMNY_CTGRY2", "elmt": "dtl-inp-depositCategory2"},
		{"type": "string", "id": "depositCategory3", "col": "DPMNY_CTGRY3", "elmt": "dtl-inp-depositCategory3"},
		{"type": "string", "id": "bankCsCode", "col": "BANK_CNPT_CD", "elmt": "dtl-inp-bankCsCode"},
		{"type": "string", "id": "bankCsName", "col": "BANK_CS_NAME", "elmt": "dtl-inp-bankCsName"},
		{"type": "string", "id": "bankCode", "col": "BANK_CD", "elmt": "dtl-inp-bankCode"},
		{"type": "string", "id": "bankName", "col": "BANK_NM", "elmt": "dtl-inp-bankName"},
		{"type": "string", "id": "branch", "col": "BRNCH", "elmt": "dtl-inp-branch"},
		{"type": "string", "id": "depositStatus", "col": "DPMNY_STTS", "elmt": "dtl-slt-depositStatus"},
		{"type": "string", "id": "descr", "col": "DSCTN", "elmt": "dtl-inp-descr"},
		{"type": "string", "id": "withdrawAccYn", "col": "WHDWL_ACNT_YN", "elmt": "dtl-chk-withdrawAccYn", "default": "N"},
		{"type": "string", "id": "fbsYn", "col": "FBS_YN", "elmt": "dtl-chk-fbsYn", "default": "N"},
		{"type": "string", "id": "seqYn", "col": "SEQ_YN", "elmt": "dtl-chk-seqYn", "default": "N"},
		{"type": "string", "id": "withdrawType", "col": "WHDWL_TYPE", "elmt": "dtl-slt-withdrawType"},
		{"type": "string", "id": "taxFbsYn", "col": "TX_FBS_YN", "elmt": "dtl-chk-taxFbsYn", "default": "N"},
		{"type": "string", "id": "limit1", "col": "PONE_LMT1", "elmt": "dtl-inp-limit1"},
		{"type": "string", "id": "limit2", "col": "PONE_LMT2", "elmt": "dtl-inp-limit2"},
		{"type": "string", "id": "openDate", "col": "OPN_YMD", "elmt": "estbl-dtp-openDate"},
		{"type": "string", "id": "expireDate", "col": "MTRY_YMD", "elmt": "estbl-dtp-expireDate"},
		{"type": "string", "id": "currencyCode", "col": "CRN_CD", "elmt": "estbl-slt-currencyCode"},
		{"type": "string", "id": "exchangeRate", "col": "EXCHRT", "elmt": "estbl-inp-exchangeRate"},
		{"type": "number", "id": "contractAmt", "col": "CTRT_AMT", "elmt": "estbl-inp-contractAmt"},
		{"type": "number", "id": "contractAmtKrw", "col": "CTRT_AMT_KRW", "elmt": "estbl-inp-contractAmtKrw"},
		{"type": "number", "id": "payinCycle", "col": "PAYN_CYCL", "elmt": "estbl-spnn-payinCycle"},
		{"type": "string", "id": "payinDate", "col": "PAYN_YMD", "elmt": "estbl-dtp-payinDate"},
		{"type": "number", "id": "totalPayinCount", "col": "TOT_PAYN_CNT", "elmt": "estbl-inp-totalPayinCount"},
		{"type": "number", "id": "moneyPerAmt", "col": "PONE_PAYN_AMT", "elmt": "estbl-inp-moneyPerAmt"},
		{"type": "number", "id": "interestRate", "col": "INT_RT", "elmt": "estbl-inp-interestRate"},
		{"type": "number", "id": "corporateTaxRate", "col": "CORP_TX_RT", "elmt": "estbl-inp-corporateTaxRate"},
		{"type": "string", "id": "txnBankCode", "col": "BANK_CD", "elmt": "estbl-inp-txnBankCode"},
		{"type": "string", "id": "txnBankName", "col": "BANK_NM", "elmt": "estbl-inp-txnBankName"},
		{"type": "string", "id": "txnAccountNum", "col": "TRSC_ACTNO", "elmt": "estbl-inp-txnAccountNum"},
		{"type": "string", "id": "txnAccountOwner", "col": "TRSC_BACNT_OWNR", "elmt": "estbl-inp-txnAccountOwner"},
		{"type": "string", "id": "cancelDate", "col": "CNCL_YMD", "elmt": "cncl-dtp-cancelDate"},
		{"type": "string", "id": "cancelReason", "col": "CNCL_RSN", "elmt": "cncl-inp-cancelReason"},
		{"type": "number", "id": "cancelExchangeRate", "col": "CNCL_EXCHRT", "elmt": "cncl-inp-cancelExchangeRate"},
		{"type": "number", "id": "cancelAmt", "col": "CNCL_AMT", "elmt": "cncl-inp-cancelAmt"},
		{"type": "number", "id": "cancelAmtKrw", "col": "CNCL_AMT_KRW", "elmt": "cncl-inp-cancelAmtKrw"},
		{"type": "number", "id": "cancelInterestAmt", "col": "CNCL_INT", "elmt": "cncl-inp-cancelInterestAmt"},
		{"type": "string", "id": "cancelInterestAmtKrw", "col": "CNCL_INT_KRW", "elmt": "cncl-inp-cancelInterestAmtKrw"},
		{"type": "string", "id": "depositAccount", "col": "DPMNY_ACNT", "elmt": "acnt-inp-depositAccount"},
		{"type": "string", "id": "depositAccountName", "col": "DEPOSIT_ACCOUNT_NAME", "elmt": "acnt-inp-depositAccountName"},
		{"type": "string", "id": "interestIncomeAccount", "col": "INTRV_ACNT_CD", "elmt": "acnt-inp-interestIncomeAccount"},
		{"type": "string", "id": "interestIncomeAccountName", "col": "INTEREST_INCOME_ACCOUNT_NAME", "elmt": "acnt-inp-interestIncomeAccountName"},
		{"type": "string", "id": "exchangeGainAccount", "col": "EXCHRT_PRF_ACNT", "elmt": "acnt-inp-exchangeGainAccount"},
		{"type": "string", "id": "exchangeGainAccountName", "col": "EXCHANGE_GAIN_ACCOUNT_NAME", "elmt": "acnt-inp-exchangeGainAccountName"},
		{"type": "string", "id": "exchangeLossAccount", "col": "EXCHRT_LOSS_ACNT", "elmt": "acnt-inp-exchangeLossAccount"},
		{"type": "string", "id": "exchangeLossAccountName", "col": "EXCHANGE_LOSS_ACCOUNT_NAME", "elmt": "acnt-inp-exchangeLossAccountName"},
		{"type": "string", "id": "valGainAccount", "col": "CNVRT_PRF_ACNT_CD", "elmt": "acnt-inp-valGainAccount"},
		{"type": "string", "id": "valGainAccountName", "col": "VAL_GAIN_ACCOUNT_NAME", "elmt": "acnt-inp-valGainAccountName"},
		{"type": "string", "id": "valLossAccount", "col": "CNVRT_LOSS_ACNT_CD", "elmt": "acnt-inp-valLossAccount"},
		{"type": "string", "id": "valLossAccountName", "col": "VAL_LOSS_ACCOUNT_NAME", "elmt": "acnt-inp-valLossAccountName"},
		{"type": "string", "id": "receiptAccount", "col": "RCPT_ACNT_CD", "elmt": "acnt-inp-receiptAccount"},
		{"type": "string", "id": "receiptAccountName", "col": "RECEIPT_ACCOUNT_NAME", "elmt": "acnt-inp-receiptAccountName"},
		{"type": "string", "id": "feeAccount", "col": "FEE_AMT", "elmt": "acnt-inp-feeAccount"},
		{"type": "string", "id": "feeAccountName", "col": "FEE_ACCOUNT_NAME", "elmt": "acnt-inp-feeAccountName"},
		{"type": "string", "id": "depositInTrType", "col": "DPMNY_INT_MTRY_FUND_TYPE", "elmt": "fund-inp-depositInTrType"},
		{"type": "string", "id": "depositInTrName", "col": "DEPOSIT_IN_TR_NAME", "elmt": "fund-inp-depositInTrName"},
		{"type": "string", "id": "depositOutTrType", "col": "DPMNY_TKMNY_FUND_TYPE", "elmt": "fund-inp-depositOutTrType"},
		{"type": "string", "id": "depositOutTrName", "col": "DEPOSIT_OUT_TR_NAME", "elmt": "fund-inp-depositOutTrName"},
		{"type": "string", "id": "interestInTrType", "col": "SVG_MTRY_FUND_TYPE", "elmt": "fund-inp-interestInTrType"},
		{"type": "string", "id": "interestInTrName", "col": "INTEREST_IN_TR_NAME", "elmt": "fund-inp-interestInTrName"},
		{"type": "string", "id": "ctaxWithholdTrType", "col": "COTX_WTHD_FUND_TYPE", "elmt": "fund-inp-ctaxWithholdTrType"},
		{"type": "string", "id": "ctaxWithholdTrName", "col": "CTAX_WITHHOLD_TR_NAME", "elmt": "fund-inp-ctaxWithholdTrName"},
		{"type": "string", "id": "ptaxWithholdTrType", "col": "RSDTX_WTHD_FUND_TYPE", "elmt": "fund-inp-ptaxWithholdTrType"},
		{"type": "string", "id": "ptaxWithholdTrName", "col": "PTAX_WITHHOLD_TR_NAME", "elmt": "fund-inp-ptaxWithholdTrName"},
		{"type": "string", "id": "exchangeGainTrType", "col": "EXCHRT_PRF_FUND_TYPE", "elmt": "fund-inp-exchangeGainTrType"},
		{"type": "string", "id": "exchangeGainTrName", "col": "EXCHANGE_GAIN_TR_NAME", "elmt": "fund-inp-exchangeGainTrName"},
		{"type": "string", "id": "exchangeLossTrType", "col": "EXCHRT_LOSS_FUND_TYPE", "elmt": "fund-inp-exchangeLossTrType"},
		{"type": "string", "id": "exchangeLossTrName", "col": "EXCHANGE_LOSS_TR_NAME", "elmt": "fund-inp-exchangeLossTrName"},
		{"type": "string", "id": "receiptTrType", "col": "RCPT_FUND_TYPE", "elmt": "fund-inp-receiptTrType"},
		{"type": "string", "id": "receiptTrName", "col": "RECEIPT_TR_NAME", "elmt": "fund-inp-receiptTrName"},
		{"type": "string", "id": "feeTrType", "col": "FEE_FUND_TYPE", "elmt": "fund-inp-feeTrType"},
		{"type": "string", "id": "feeTrName", "col": "FEE_TR_NAME", "elmt": "fund-inp-feeTrName"},
		{"type": "string", "id": "billInTrType", "col": "PRMNT_PBNCN_FUND_TYPE", "elmt": "fund-inp-billInTrType"},
		{"type": "string", "id": "billInTrName", "col": "BILL_IN_TR_NAME", "elmt": "fund-inp-billInTrName"},
		{"type": "string", "id": "billOutTrType", "col": "PRMNT_MTRY_FUND_TYPE", "elmt": "fund-inp-billOutTrType"},
		{"type": "string", "id": "billOutTrName", "col": "BILL_OUT_TR_NAME", "elmt": "fund-inp-billOutTrName"},
		{"type": "string", "id": "deptCode", "col": "DEPT_CD", "elmt": "ognz-inp-deptCode"},
		{"type": "string", "id": "deptName", "col": "DEPT_NM", "elmt": "ognz-inp-deptName"},
		{"type": "string", "id": "costCenterCode", "col": "CSTCD_CD", "elmt": "ognz-inp-costCenterCode"},
		{"type": "string", "id": "costCenterName", "col": "CSTCD_NM", "elmt": "ognz-inp-costCenterName"},
		
		{"type": "string", "id": "advancedIncomeAccount", "col": "UNRV_ACNTL_CD", "elmt": "acnt-inp-advancedIncomeAccount"},
		{"type": "string", "id": "advancedIncomeAccountName", "col": "ADVANCED_INCOME_ACCOUNT_NAME", "elmt": "acnt-inp-advancedIncomeAccountName"},
		{"type": "string", "id": "accruedIncomeAccount", "col": "UCRV", "elmt": "acnt-inp-accruedIncomeAccount"},
		{"type": "string", "id": "accruedIncomeAccountName", "col": "ACCRUED_INCOME_ACCOUNT_NAME", "elmt": "acnt-inp-accruedIncomeAccountName"},
		{"type": "string", "id": "ctaxWithholdAccount", "col": "ADPY_COTX_ACNTL_CD", "elmt": "acnt-inp-ctaxWithholdAccount"},
		{"type": "string", "id": "ctaxWithholdAccountName", "col": "CTAX_WITHHOLD_ACCOUNT_NAME", "elmt": "acnt-inp-ctaxWithholdAccountName"},
		{"type": "string", "id": "ptaxWithholdAccount", "col": "LCLTX_WTHD_ACNT_CD", "elmt": "acnt-inp-ptaxWithholdAccount"},
		{"type": "string", "id": "ptaxWithholdAccountName", "col": "PTAX_WITHHOLD_ACCOUNT_NAME", "elmt": "acnt-inp-ptaxWithholdAccountName"},
		{"type": "string", "id": "billAccount", "col": "PRMNT_ACNT", "elmt": "acnt-inp-billAccount"},
		{"type": "string", "id": "billAccountName", "col": "BILL_ACCOUNT_NAME", "elmt": "acnt-inp-billAccountName"},
	];
	
	const srchElements = [
		{"id": "srch-slt-depositType"},
		{"id": "srch-inp-bankCsCode"},
		{"id": "srch-inp-bankCsName"},
		{"id": "srch-slt-allYn"},
		{"id": "srch-inp-accountNum"},
	];
 
	
	//초기화
	function cfn_init() {
		if (!gfn_comConfirm("Q0001", "초기화")) {	// Q0001	{0} 하시겠습니까?
			return;
		}
 
		fn_init();
	}
	
	// 신규
	function cfn_add() {
	    fn_create();
	}
	
	// 저장
	function cfn_save() {
	    fn_save();
	}
	
	// 삭제
	function cfn_del() {
		fn_delete();
	}
	
	// 조회
	function cfn_search() {
	    fn_search();
	}
 
	
	// JSON OBJECT
	var jsonFiOrgCode = []; 		// 사업단위
	var jsonDepositType = [];		// 계좌유형
	var jsonDepositStatus = [];		// 예적금상태
	var jsonWithdrawType = []; 		// 지급방법
	var jsonCurrencyCode = [];		// 통화
	var jsonBankCode = [];			// 은행코드
	var jsonUseYn = [];
 
	
	// 예적금원장
	var grdSvgGnlgr;
	var jsonSvgGnlgr = [];
 
	var jsonDetail = [];
	var jsonDetailSeq = [];
	
	// 회차정보
	// sb-area-grdTngtrn
	var grdTngtrn;
	var jsonTngtrn = [];
	
	
	
    window.addEventListener("DOMContentLoaded",function(){
		fn_init();
    });
	
    /**
     * @name fn_init
     * @description 화면 초기 호출
     * @function
     */
    const fn_init = async function() {
    	
    	let nowDate = new Date();
		let firstYmd = gfn_dateFirstYmd(nowDate);
		let lastYmd = gfn_dateToYmd(nowDate);
		
		SBUxMethod.set("srch-dtp-txnDate", lastYmd);
 
		srchElements.forEach((item) => {
			SBUxMethod.set(item.id, "");
		});
 
		await fn_initSBSelect();
 
		jsonSvgGnlgr.length = 0;
 
		// 그리드 생성
    	fn_createGridSvgGnlgr();
    	fn_createGridTngtrn();
    	
		fn_setElmtDisabled(true);
		fn_clearDetail();
    }
    
    
    const fn_create = async function() {
    	
    	fn_clearDetail();
    	grdSvgGnlgr.refresh();
    	grdSvgGnlgr.setRow(-1);
    	
    	fn_setElmtDisabled(false);
    }
    
    const fn_copy = async function() {
    	if (jsonDetail.length == 0) {
    		gfn_comAlert("W0003", "복사");		//	W0003	{0}할 대상이 없습니다.
			return;
    	}
    	
    	fn_create();
    	fn_setDetailElmt(jsonDetail[0]);
    	SBUxMethod.set("dtl-inp-depositId", "");
    	SBUxMethod.set("dtl-inp-depositCode", "");
    }
    
    
	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
		
        if (!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }
        
        // 사업단위
        const fiOrgCode = gfn_nvl(gfnma_multiSelectGet("#srch-fiOrgCode"));
        // 금융기관
        const bankCsCode = gfn_nvl(SBUxMethod.get('srch-dtp-bankCsCode'));;
        // 조회기준일자
        const txnDate = SBUxMethod.get('srch-dtp-txnDate');
        // 예적금유형
        const depositType = gfn_nvl(SBUxMethod.get('srch-slt-depositType'));
        // 경과예금포함여부
        const allYn = gfn_nvl(SBUxMethod.get('srch-slt-allYn'));
        // 계좌번호
        const accountNum = gfn_nvl(SBUxMethod.get('srch-inp-accountNum'));
        
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                V_P_FI_ORG_CODE 	: fiOrgCode,
                V_P_BASE_DATE		: txnDate,
                V_P_ALL_YN			: allYn,
                V_P_DEPOSIT_TYPE	: depositType,
                V_P_BANK_CS_CODE	: bankCsCode,
                V_P_ACCOUNT_NUM		: accountNum,
                V_P_DEPOSIT_CODE	: '',
                
                V_P_FORM_ID			: p_formId,
                V_P_MENU_ID			: p_menuId,
                V_P_PROC_ID			: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };
        	console.log("paramObj", paramObj);
        const postJsonPromiseForList = gfn_postJSON("/fi/ftr/tri/selectFim5300List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });
 
        const listData = await postJsonPromiseForList;
 
        try {
            if (_.isEqual("S", listData.resultStatus)) {
            	
            	console.log("listData.cv_1", listData.cv_1);
            	
            	jsonSvgGnlgr.length = 0;
 
                listData.cv_1.forEach((item, index) => {
                    /*
					const obj = {
                    		FI_ORG_CODE: item.ACNTG_OGNZ_CD,
                    		DEPOSIT_TYPE: item.DPMNY_TYPE,
                    		ACCOUNT_OWNER: item.DPSTR_NM,
                    		DEPOSIT_CATEGORY1: item.DPMNY_CTGRY1,
                    		DEPOSIT_CATEGORY2: item.DPMNY_CTGRY2,
                    		DEPOSIT_CATEGORY3: item.DPMNY_CTGRY3,
                    		DEPOSIT_CODE: item.DPMNY_CD,
                    		DEPOSIT_NAME: item.DPMNY_NM,
                    		ACCOUNT_NUM: item.ACTNO,
                    		BANK_CS_CODE: item.BANK_CNPT_CD,
                    		BANK_CS_NAME: item.BANK_CS_NAME,
                    		BANK_CODE: item.BANK_CD,
                    		BANK_NAME: item.BANK_NM,
                    		BRANCH: item.BRNCH,
                    		INSERT_USERID: item.WRT_USER_ID,
                    		INSERT_TIME: item.WRT_DT,
                    		INSERT_PC: item.WRT_PC,
                    		UPDATE_USERID: item.UPDT_USER_ID,
                    		UPDATE_TIME: item.UPDT_DT,
                    		UPDATE_PC: item.UPDT_PC,
                    }
                    jsonSvgGnlgr.push(obj);

                     */
					jsonSvgGnlgr.push(item);
                });

				console.log(jsonSvgGnlgr);

                grdSvgGnlgr.rebuild();
                
                fn_clearDetail();
                
            } else {
                alert(listData.resultMessage);
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
     * @name fn_delete
     * @description 삭제 버튼
     */
    const fn_delete = async function() {
 
        let fiOrgCode = SBUxMethod.get("dtl-slt-fiOrgCode");
        let depositCode = SBUxMethod.get("dtl-inp-depositCode");
        
        if (gfn_isEmpty(depositCode)) {
        	gfn_comAlert("W0003", "삭제");		//	W0003	{0}할 대상이 없습니다.
			return;
        }
		
        if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
        
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
                IV_P_DEPOSIT_CODE: depositCode,
                V_P_FI_ORG_CODE: fiOrgCode,
                V_P_DEPOSIT_NAME: '',
                V_P_DEPOSIT_TYPE: '',
                V_P_ACCOUNT_OWNER: '',
                V_P_DEPOSIT_CATEGORY1: '',
                V_P_DEPOSIT_CATEGORY2: '',
                V_P_DEPOSIT_CATEGORY3: '',
                V_P_ACCOUNT_NUM: '',
                V_P_BANK_CS_CODE: '',
                V_P_BANK_CODE: '',
                V_P_BRANCH: '',
                V_P_TXN_ACCOUNT_NUM: '',
                V_P_TXN_BANK_CODE: '',
                V_P_TXN_ACCOUNT_OWNER: '',
                V_P_DEPT_CODE: '',
                V_P_COST_CENTER_CODE: '',
                V_P_DEPOSIT_ACCOUNT: '',
                V_P_INTEREST_INCOME_ACCOUNT: '',
                V_P_ADVANCED_INCOME_ACCOUNT: '',
                V_P_ACCRUED_INCOME_ACCOUNT: '',
                V_P_CTAX_WITHHOLD_ACCOUNT: '',
                V_P_PTAX_WITHHOLD_ACCOUNT: '',
                V_P_BILL_ACCOUNT: '',
                V_P_DEPOSIT_IN_TR_TYPE: '',
                V_P_DEPOSIT_OUT_TR_TYPE: '',
                V_P_INTEREST_IN_TR_TYPE: '',
                V_P_CTAX_WITHHOLD_TR_TYPE: '',
                V_P_PTAX_WITHHOLD_TR_TYPE: '',
                V_P_BILL_IN_TR_TYPE: '',
                V_P_BILL_OUT_TR_TYPE: '',
                V_P_OPEN_DATE: '',
                V_P_EXPIRE_DATE: '',
                V_P_CURRENCY_CODE: '',
                V_P_EXCHANGE_RATE: '',
                V_P_CONTRACT_AMT: '',
                V_P_CONTRACT_AMT_KRW: '',
                V_P_PAYIN_CYCLE: '',
                V_P_PAYIN_DATE: '',
                V_P_TOTAL_PAYIN_COUNT: '',
                V_P_MONEY_PER_AMT: '',
                V_P_INTEREST_RATE: '',
                V_P_CORPORATE_TAX_RATE: '',
                V_P_DEPOSIT_STATUS: '',
                V_P_DESCR: '',
                V_P_CANCEL_DATE: '',
                V_P_CANCEL_REASON: '',
                V_P_CANCEL_EXCHANGE_RATE: '',
                V_P_CANCEL_AMT: '',
                V_P_CANCEL_AMT_KRW: '',
                V_P_CANCEL_INTEREST_AMT: '',
                V_P_CANCEL_INTEREST_AMT_KRW: '',
                V_P_LIMIT1: '',
                V_P_LIMIT2: '',
                V_P_WITHDRAW_ACC_YN: '',
                V_P_WITHDRAW_TYPE: '',
                V_P_FBS_YN: '',
                V_P_SEQ_YN: '',
                V_P_TAX_FBS_YN: '',
                V_P_EXCHANGE_GAIN_ACCOUNT: '',
                V_P_EXCHANGE_LOSS_ACCOUNT: '',
                V_P_EXCHANGE_GAIN_TR_TYPE: '',
                V_P_EXCHANGE_LOSS_TR_TYPE: '',
                V_P_VAL_GAIN_ACCOUNT: '',
                V_P_VAL_LOSS_ACCOUNT: '',
                V_P_RECEIPT_TR_TYPE: '',
                V_P_RECEIPT_ACCOUNT: '',
                V_P_FEE_ACCOUNT: '',
                V_P_FEE_TR_TYPE: '',
                
                V_P_FORM_ID			: p_formId,
                V_P_MENU_ID			: p_menuId,
                V_P_PROC_ID			: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };
        	
        const postJsonPromise = gfn_postJSON("/fi/ftr/tri/insertFim5300S.do", {
            getType				: 'json',
            workType			: 'D',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });
        
        const resoponseData = await postJsonPromise;
        
        try {
            if (_.isEqual("S", resoponseData.resultStatus)) {
            	gfn_comAlert("I0001");	// I0001	처리 되었습니다.
            	fn_search();
            } else {
                alert(resoponseData.resultMessage);
                return false;
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
     * @name fn_save
     * @description 조회 버튼
     */
    const fn_save = async function() {
    	
		/*
		if (!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }
         */
 
         
        let fiOrgCode = SBUxMethod.get("dtl-slt-fiOrgCode");
        let depositType = SBUxMethod.get("dtl-slt-depositType");
        let accountNum = SBUxMethod.get("dtl-inp-accountNum");
        let depositCode = SBUxMethod.get("dtl-inp-depositCode");
        let depositName = SBUxMethod.get("dtl-inp-depositName");
        let accountOwner = SBUxMethod.get("dtl-inp-accountOwner");
        let depositCategory1 = SBUxMethod.get("dtl-inp-depositCategory1");
        let depositCategory2 = SBUxMethod.get("dtl-inp-depositCategory2");
        let depositCategory3 = SBUxMethod.get("dtl-inp-depositCategory3");
        let bankCsCode = SBUxMethod.get("dtl-inp-bankCsCode");
        let bankCsName = SBUxMethod.get("dtl-inp-bankCsName");
        let bankCode = SBUxMethod.get("dtl-inp-bankCode");
        let bankName = SBUxMethod.get("dtl-inp-bankName");
        let branch = SBUxMethod.get("dtl-inp-branch");
        let depositStatus = SBUxMethod.get("dtl-slt-depositStatus");
        let descr = SBUxMethod.get("dtl-inp-descr");
        let withdrawAccYn = SBUxMethod.get("dtl-chk-withdrawAccYn")["dtl-chk-withdrawAccYn"];
        let fbsYn = SBUxMethod.get("dtl-chk-fbsYn")["dtl-chk-fbsYn"];
        let seqYn = SBUxMethod.get("dtl-chk-seqYn")["dtl-chk-seqYn"];
        let withdrawType = SBUxMethod.get("dtl-slt-withdrawType");
        let taxFbsYn = SBUxMethod.get("dtl-chk-taxFbsYn")["dtl-chk-taxFbsYn"];
        let limit1 = SBUxMethod.get("dtl-inp-limit1");
        let limit2 = SBUxMethod.get("dtl-inp-limit2");
        let openDate = SBUxMethod.get("estbl-dtp-openDate");
        let expireDate = SBUxMethod.get("estbl-dtp-expireDate");
        let currencyCode = SBUxMethod.get("estbl-slt-currencyCode");
        let exchangeRate = SBUxMethod.get("estbl-inp-exchangeRate");
        let contractAmt = SBUxMethod.get("estbl-inp-contractAmt");
        let contractAmtKrw = SBUxMethod.get("estbl-inp-contractAmtKrw");
        let payinCycle = SBUxMethod.get("estbl-spnn-payinCycle");
        let payinDate = SBUxMethod.get("estbl-dtp-payinDate");
        let totalPayinCount = SBUxMethod.get("estbl-inp-totalPayinCount");
        let moneyPerAmt = SBUxMethod.get("estbl-inp-moneyPerAmt");
        let interestRate = SBUxMethod.get("estbl-inp-interestRate");
        let corporateTaxRate = SBUxMethod.get("estbl-inp-corporateTaxRate");
        let txnBankCode = SBUxMethod.get("estbl-inp-txnBankCode");
        let txnBankName = SBUxMethod.get("estbl-inp-txnBankName");
        let txnAccountNum = SBUxMethod.get("estbl-inp-txnAccountNum");
        let txnAccountOwner = SBUxMethod.get("estbl-inp-txnAccountOwner");
        let cancelDate = SBUxMethod.get("cncl-dtp-cancelDate");
        let cancelReason = SBUxMethod.get("cncl-inp-cancelReason");
        let cancelExchangeRate = SBUxMethod.get("cncl-inp-cancelExchangeRate");
        let cancelAmt = SBUxMethod.get("cncl-inp-cancelAmt");
        let cancelAmtKrw = SBUxMethod.get("cncl-inp-cancelAmtKrw");
        let cancelInterestAmt = SBUxMethod.get("cncl-inp-cancelInterestAmt");
        let cancelInterestAmtKrw = SBUxMethod.get("cncl-inp-cancelInterestAmtKrw");
        let depositAccount = SBUxMethod.get("acnt-inp-depositAccount");
        let depositAccountName = SBUxMethod.get("acnt-inp-depositAccountName");
        let interestIncomeAccount = SBUxMethod.get("acnt-inp-interestIncomeAccount");
        let interestIncomeAccountName = SBUxMethod.get("acnt-inp-interestIncomeAccountName");
        let exchangeGainAccount = SBUxMethod.get("acnt-inp-exchangeGainAccount");
        let exchangeGainAccountName = SBUxMethod.get("acnt-inp-exchangeGainAccountName");
        let exchangeLossAccount = SBUxMethod.get("acnt-inp-exchangeLossAccount");
        let exchangeLossAccountName = SBUxMethod.get("acnt-inp-exchangeLossAccountName");
        let valGainAccount = SBUxMethod.get("acnt-inp-valGainAccount");
        let valGainAccountName = SBUxMethod.get("acnt-inp-valGainAccountName");
        let valLossAccount = SBUxMethod.get("acnt-inp-valLossAccount");
        let valLossAccountName = SBUxMethod.get("acnt-inp-valLossAccountName");
        let receiptAccount = SBUxMethod.get("acnt-inp-receiptAccount");
        let receiptAccountName = SBUxMethod.get("acnt-inp-receiptAccountName");
        let feeAccount = SBUxMethod.get("acnt-inp-feeAccount");
        let feeAccountName = SBUxMethod.get("acnt-inp-feeAccountName");
        let depositInTrType = SBUxMethod.get("fund-inp-depositInTrType");
        let depositInTrName = SBUxMethod.get("fund-inp-depositInTrName");
        let depositOutTrType = SBUxMethod.get("fund-inp-depositOutTrType");
        let depositOutTrName = SBUxMethod.get("fund-inp-depositOutTrName");
        let interestInTrType = SBUxMethod.get("fund-inp-interestInTrType");
        let interestInTrName = SBUxMethod.get("fund-inp-interestInTrName");
        let ctaxWithholdTrType = SBUxMethod.get("fund-inp-ctaxWithholdTrType");
        let ctaxWithholdTrName = SBUxMethod.get("fund-inp-ctaxWithholdTrName");
        let ptaxWithholdTrType = SBUxMethod.get("fund-inp-ptaxWithholdTrType");
        let ptaxWithholdTrName = SBUxMethod.get("fund-inp-ptaxWithholdTrName");
        let exchangeGainTrType = SBUxMethod.get("fund-inp-exchangeGainTrType");
        let exchangeGainTrName = SBUxMethod.get("fund-inp-exchangeGainTrName");
        let exchangeLossTrType = SBUxMethod.get("fund-inp-exchangeLossTrType");
        let exchangeLossTrName = SBUxMethod.get("fund-inp-exchangeLossTrName");
        let receiptTrType = SBUxMethod.get("fund-inp-receiptTrType");
        let receiptTrName = SBUxMethod.get("fund-inp-receiptTrName");
        let feeTrType = SBUxMethod.get("fund-inp-feeTrType");
        let feeTrName = SBUxMethod.get("fund-inp-feeTrName");
        let billInTrType = SBUxMethod.get("fund-inp-billInTrType");
        let billInTrName = SBUxMethod.get("fund-inp-billInTrName");
        let billOutTrType = SBUxMethod.get("fund-inp-billOutTrType");
        let billOutTrName = SBUxMethod.get("fund-inp-billOutTrName");
        let deptCode = SBUxMethod.get("ognz-inp-deptCode");
        let deptName = SBUxMethod.get("ognz-inp-deptName");
	    let costCenterCode = SBUxMethod.get("ognz-inp-costCenterCode");
		let costCenterName = SBUxMethod.get("ognz-inp-costCenterName");
 
		let advancedIncomeAccount = SBUxMethod.get("acnt-inp-advancedIncomeAccount");
		let advancedIncomeAccountName = SBUxMethod.get("acnt-inp-advancedIncomeAccountName");
		let accruedIncomeAccount = SBUxMethod.get("acnt-inp-accruedIncomeAccount");
		let accruedIncomeAccountName = SBUxMethod.get("acnt-inp-accruedIncomeAccountName");
		let ctaxWithholdAccount = SBUxMethod.get("acnt-inp-ctaxWithholdAccount");
		let ctaxWithholdAccountName = SBUxMethod.get("acnt-inp-ctaxWithholdAccountName");
		let ptaxWithholdAccount = SBUxMethod.get("acnt-inp-ptaxWithholdAccount");
		let ptaxWithholdAccountName = SBUxMethod.get("acnt-inp-ptaxWithholdAccountName");
		let billAccount = SBUxMethod.get("acnt-inp-billAccount");
		let billAccountName = SBUxMethod.get("acnt-inp-billAccountName");
		
		if (gfn_isEmpty(depositName)) {
			gfn_comAlert("W0005", "계좌명");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(depositType)) {
			gfn_comAlert("W0005", "계좌유형");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(accountNum)) {
			gfn_comAlert("W0005", "계좌번호");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(exchangeRate)) {
			gfn_comAlert("W0005", "환율");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(contractAmt)) {
			gfn_comAlert("W0005", "계약금액");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(contractAmt)) {
			gfn_comAlert("W0005", "원화계약금액");		//	W0005	{0}이/가 없습니다.
			return;
		}
		
		
		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
		
		const workType = gfn_isEmpty(SBUxMethod.get("dtl-inp-depositId")) ? "N" : "U";
		
		
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
                IV_P_DEPOSIT_CODE: gfn_nvl(depositCode),
                V_P_FI_ORG_CODE: gfn_nvl(fiOrgCode),
                V_P_DEPOSIT_NAME: gfn_nvl(depositName),
                V_P_DEPOSIT_TYPE: gfn_nvl(depositType),
                V_P_ACCOUNT_OWNER: gfn_nvl(accountOwner),
                V_P_DEPOSIT_CATEGORY1: gfn_nvl(depositCategory1),
                V_P_DEPOSIT_CATEGORY2: gfn_nvl(depositCategory2),
                V_P_DEPOSIT_CATEGORY3: gfn_nvl(depositCategory3),
                V_P_ACCOUNT_NUM: gfn_nvl(accountNum),
                V_P_BANK_CS_CODE: gfn_nvl(bankCsCode),
                V_P_BANK_CODE: gfn_nvl(bankCode),
                V_P_BRANCH: gfn_nvl(branch),
                V_P_TXN_ACCOUNT_NUM: gfn_nvl(txnAccountNum),
                V_P_TXN_BANK_CODE: gfn_nvl(txnBankCode),
                V_P_TXN_ACCOUNT_OWNER: gfn_nvl(txnAccountOwner),
                V_P_DEPT_CODE: gfn_nvl(deptCode),
                V_P_COST_CENTER_CODE: gfn_nvl(costCenterCode),
                V_P_DEPOSIT_ACCOUNT: gfn_nvl(depositAccount),
                V_P_INTEREST_INCOME_ACCOUNT: gfn_nvl(interestIncomeAccount),
                V_P_ADVANCED_INCOME_ACCOUNT: gfn_nvl(advancedIncomeAccount),
                V_P_ACCRUED_INCOME_ACCOUNT: gfn_nvl(accruedIncomeAccount),
                V_P_CTAX_WITHHOLD_ACCOUNT: gfn_nvl(ctaxWithholdAccount),
                V_P_PTAX_WITHHOLD_ACCOUNT: gfn_nvl(ptaxWithholdAccount),
                V_P_BILL_ACCOUNT: gfn_nvl(billAccount),
                V_P_DEPOSIT_IN_TR_TYPE: gfn_nvl(depositInTrType),
                V_P_DEPOSIT_OUT_TR_TYPE: gfn_nvl(depositOutTrType),
                V_P_INTEREST_IN_TR_TYPE: gfn_nvl(interestInTrType),
                V_P_CTAX_WITHHOLD_TR_TYPE: gfn_nvl(ctaxWithholdTrType),
                V_P_PTAX_WITHHOLD_TR_TYPE: gfn_nvl(ptaxWithholdTrType),
                V_P_BILL_IN_TR_TYPE: gfn_nvl(billInTrType),
                V_P_BILL_OUT_TR_TYPE: gfn_nvl(billOutTrType),
                V_P_OPEN_DATE: gfn_nvl(openDate),
                V_P_EXPIRE_DATE: gfn_nvl(expireDate),
                V_P_CURRENCY_CODE: gfn_nvl(currencyCode),
                V_P_EXCHANGE_RATE: exchangeRate,
                V_P_CONTRACT_AMT: contractAmt,
                V_P_CONTRACT_AMT_KRW: contractAmtKrw,
                V_P_PAYIN_CYCLE: payinCycle,
                V_P_PAYIN_DATE: gfn_nvl(payinDate),
                V_P_TOTAL_PAYIN_COUNT: totalPayinCount,
                V_P_MONEY_PER_AMT: moneyPerAmt,
                V_P_INTEREST_RATE: interestRate,
                V_P_CORPORATE_TAX_RATE: corporateTaxRate,
                V_P_DEPOSIT_STATUS: gfn_nvl(depositStatus),
                V_P_DESCR: gfn_nvl(descr),
                V_P_CANCEL_DATE: gfn_nvl(cancelDate),
                V_P_CANCEL_REASON: gfn_nvl(cancelReason),
                V_P_CANCEL_EXCHANGE_RATE: cancelExchangeRate,
                V_P_CANCEL_AMT: cancelAmt,
                V_P_CANCEL_AMT_KRW: cancelAmtKrw,
                V_P_CANCEL_INTEREST_AMT: cancelInterestAmt,
                V_P_CANCEL_INTEREST_AMT_KRW: cancelInterestAmtKrw,
                V_P_LIMIT1: limit1,
                V_P_LIMIT2: limit2,
                V_P_WITHDRAW_ACC_YN: gfn_nvl(withdrawAccYn),
                V_P_WITHDRAW_TYPE: gfn_nvl(withdrawType),
                V_P_FBS_YN: gfn_nvl(fbsYn),
                V_P_SEQ_YN: gfn_nvl(seqYn),
                V_P_TAX_FBS_YN: gfn_nvl(taxFbsYn),
                V_P_EXCHANGE_GAIN_ACCOUNT: gfn_nvl(exchangeGainAccount),
                V_P_EXCHANGE_LOSS_ACCOUNT: gfn_nvl(exchangeLossAccount),
                V_P_EXCHANGE_GAIN_TR_TYPE: gfn_nvl(exchangeGainTrType),
                V_P_EXCHANGE_LOSS_TR_TYPE: gfn_nvl(exchangeLossTrType),
                V_P_VAL_GAIN_ACCOUNT: gfn_nvl(valGainAccount),
                V_P_VAL_LOSS_ACCOUNT: gfn_nvl(valLossAccount),
                V_P_RECEIPT_TR_TYPE: gfn_nvl(receiptTrType),
                V_P_RECEIPT_ACCOUNT: gfn_nvl(receiptAccount),
                V_P_FEE_ACCOUNT: gfn_nvl(feeAccount),
                V_P_FEE_TR_TYPE: gfn_nvl(feeTrType),
                
                V_P_FORM_ID			: p_formId,
                V_P_MENU_ID			: p_menuId,
                V_P_PROC_ID			: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };
        	console.log("paramObj", paramObj);
        	
        	Object.keys(paramObj).forEach((key) => {
        		console.log("key", key, paramObj[key]);
        	});
        	
        	
        
        const postJsonPromise = gfn_postJSON("/fi/ftr/tri/insertFim5300S.do", {
            getType				: 'json',
            workType			: workType,
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });
        
        const resoponseData = await postJsonPromise;
        
        try {
            if (_.isEqual("S", resoponseData.resultStatus)) {
            	gfn_comAlert("I0001");	// I0001	처리 되었습니다.
            	fn_search();
            } else {
                alert(resoponseData.resultMessage);
                return false;
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
     * @name fn_initSBSelect
     * @description 화면 초기 호출
     * @function
     */
	const fn_initSBSelect = async function() {
		
        //gfnma_multiSelectSet('#SRCH_FI_ORG_CODE', 'ACNTG_OGNZ_CD', 'ACNTG_OGNZ_NM', p_fiOrgCode);
		
        let rst = await Promise.all([
	        
	        // 여부
	        gfnma_setComSelect(['srch-slt-allYn'], jsonUseYn, 'L_COM014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	        	
	        // 계좌유형
	        gfnma_setComSelect(['srch-slt-depositType','dtl-slt-depositType'], jsonDepositType, 'L_FIF001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			
	        // 사업단위
	        gfnma_setComSelect(['dtl-slt-fiOrgCode'], jsonFiOrgCode, 'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACNTG_OGNZ_CD', 'ACNTG_OGNZ_NM', 'Y', ''),
	        gfnma_multiSelectInit({
	            target			: ['#srch-fiOrgCode']
	            ,compCode		: gv_ma_selectedCorpCd
	            ,clientCode		: gv_ma_selectedClntCd
	            ,bizcompId		: 'L_FIM022'
	            ,whereClause	: ''
	            ,formId			: p_formId
	            ,menuId			: p_menuId
	            ,selectValue	: ''
	            ,dropType		: 'down' 	// up, down
	            ,dropAlign		: 'right' 	// left, right
	            ,colValue		: 'ACNTG_OGNZ_CD'
	            ,colLabel		: 'ACNTG_OGNZ_NM'
	            ,columns		:[
	                {caption: "코드",		ref: 'ACNTG_OGNZ_CD', 			width:'150px',  	style:'text-align:left'},
	                {caption: "명", 		ref: 'ACNTG_OGNZ_NM',    		width:'150px',  	style:'text-align:left'}
	        	]
	        }),
	        
	        // 예적금상태
	        gfnma_setComSelect(['dtl-slt-depositStatus'], jsonDepositStatus, 'L_FIF002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	        
	     	// 지급방법
			gfnma_setComSelect(['dtl-slt-withdrawType'], jsonWithdrawType, 'L_FIM073', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			
			// 통화
			gfnma_setComSelect(['estbl-slt-currencyCode'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CRN_CD', 'CRN_NM', 'Y', ''),
	        
			// 은행
			gfnma_setComSelect(['estbl-inp-bankName'], jsonBankCode, 'P_COM003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CRN_CD', 'CRN_NM', 'Y', ''),
	        
		]);
        
        console.log("jsonWithdrawType", jsonWithdrawType);
	}
    
	
	/**
     * @name fn_createGridSvgGnlgr
     * @description 예적금원장 그리드 생성	sb-area-grdSvgGnlgr
     * @function
     */
	const fn_createGridSvgGnlgr = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSvgGnlgr';
        SBGridProperties.id = 'grdSvgGnlgr';
        SBGridProperties.jsonref = 'jsonSvgGnlgr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
        	{
        		caption: ["사업단위"], 		
        		ref: 'ACNTG_OGNZ_CD',   	    
        		type:'combo', 
        		style:'text-align:left',
        		width: '115px',
                typeinfo: {
                    ref			: 'jsonFiOrgCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                },
                disabled: true
            },
            {
        		caption: ["계좌유형"], 		
        		ref: 'DPMNY_TYPE',   	    
        		type:'combo', 
        		style:'text-align:left',
        		width: '115px',
                typeinfo: {
                    ref			: 'jsonDepositType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                },
                disabled: true
            },
            {
            	caption : ["계좌코드"],				
            	ref: 'DPMNY_CD',		
            	type:'input',  	
            	width:'100px',  	
            	style:'text-align:center', 
            },
            {
            	caption : ["계좌명"],				
            	ref: 'DPMNY_NM',		
            	type:'input',  	
            	width:'100px',  	
            	style:'text-align:left', 
            },
            {
            	caption : ["계좌번호"],				
            	ref: 'ACTNO',		
            	type:'output',  	
            	width:'150px',  	
            	style:'text-align:left', 
            },
            {
            	caption : ["금융기관명"],				
            	ref: 'BANK_NM',		
            	type:'output',  	
            	width:'150px',  	
            	style:'text-align:left', 
            },
            {
            	caption : ["지점"],				
            	ref: 'BRNCH',		
            	type:'output',  	
            	width:'150px',  	
            	style:'text-align:left', 
            },
            {
            	caption : ["계좌구분"],				
            	ref: 'DPMNY_CTGRY3',		
            	type:'output',  	
            	width:'150px',  	
            	style:'text-align:left', 
            },
            {
            	caption : ["분류1"],				
            	ref: 'DPMNY_CTGRY1',		
            	type:'output',  	
            	width:'150px',  	
            	style:'text-align:left', 
            },            
            {
            	caption : ["분류2"],				
            	ref: 'DPMNY_CTGRY2',		
            	type:'output',  	
            	width:'150px',  	
            	style:'text-align:left', 
            },
        ];
        grdSvgGnlgr = _SBGrid.create(SBGridProperties);
        grdSvgGnlgr.bind('rowchanged', fn_grdSvgGnlgrRowChanged);
	}
    
	const fn_grdSvgGnlgrRowChanged = async function() {
		const nRow = grdSvgGnlgr.getRow();
    	
    	if (nRow < 1) {
    		return;
    	}
    	
    	const _rowData = grdSvgGnlgr.getRowData(nRow);
    	
		await fn_setDetail(_rowData);
		
	}
	
	/**
     * @name fn_createGridTngtrn
     * @description 회차정보 그리드 생성	sb-area-grdTngtrn
     * @function
     */
	const fn_createGridTngtrn = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdTngtrn';
        SBGridProperties.id = 'grdTngtrn';
        SBGridProperties.jsonref = 'jsonTngtrn';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
        	{
            	caption : ["회차"],				
            	ref: 'ITEM_SEQ',		
            	type:'input',  	
            	width:'100px',  	
            	style:'text-align:left', 
            },
            {
            	caption: ["개시일"], 
            	ref: 'OPN_YMD', 
            	type:'output',  
            	width:'120px', 
            	style: 'text-align:center',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', 
            		origin:'yyyymmdd'
            	}
            },
            {
            	caption: ["만기일"], 
            	ref: 'MTRY_YMD', 
            	type:'output',  
            	width:'120px', 
            	style: 'text-align:center',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', 
            		origin:'yyyymmdd'
            	}
            },
            {
            	caption : ["통화"],
            	ref : 'CRN_CD', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo', 
            	typeinfo : {
                    ref : 'jsonCurrencyCode',
                    label : 'label',
                    value : 'value'
                },
            	disabled: true
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHRT',
            	datatype: 'number',
            	width : '50px',
            	style : 'text-align:right',
            	type : 'output',
                format : {type:'number', rule:'0,000.00'}
            },
            {
            	caption : ['금액(통화)'],          
            	ref : 'ORGNL_AMT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'output',
            	format : {type:'number', rule:'#,###.##'}
            },
            {
            	caption : ['금액(전표)'],          
            	ref : 'CTRT_KRW_AMT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'output',
            	format : {type:'number', rule:'#,###.##'}
            },
            {
            	caption : ['이자율(%)'],
            	ref : 'INT_RT',
            	datatype: 'number',
            	width : '50px',
            	style : 'text-align:right',
            	type : 'output',
                format : {type:'number', rule:'0,000.00'},
            },
            {
            	caption : ['법인세율(%)'],
            	ref : 'CORP_TX_RT',
            	datatype: 'number',
            	width : '50px',
            	style : 'text-align:right',
            	type : 'output',
                format : {type:'number', rule:'0,000.00'},
            },
            {
            	caption : ['지방소득세율(%)'],
            	ref : 'LCLTX_INCTX_RT',
            	datatype: 'number',
            	width : '50px',
            	style : 'text-align:right',
            	type : 'output',
                format : {type:'number', rule:'0,000.00'},
            },
            {
            	caption : ["자금상태"],
            	ref : 'DPMNY_STTS', 
            	width : '80px', 
            	style : 'text-align:center', 
            	type : 'combo', 
                typeinfo : {
                    ref : 'jsonDepositStatus',
                    label : 'label',
                    value : 'value'
                },
            	disabled: true
            },
            {
            	caption : ["적요"],				
            	ref: 'DSCTN',		
            	type:'output',  	
            	width:'200px',  	
            	style:'text-align:left', 
            },
        ];
        grdTngtrn = _SBGrid.create(SBGridProperties);
	}
    
	const fn_clearDetail = function() {
		
		fn_setDetailElmt(null);
		
		jsonTngtrn.length = 0;
		grdTngtrn.refresh();
	}
	
	const fn_setElmtDisabled = function(bDisabled) {
		
		elements.forEach((el) => {
			
			if (_.isEqual(el.elmt, 'dtl-inp-depositCode')) {
				return;
			}
			
			const strDisabled = bDisabled ? 'true' : 'false';
			SBUxMethod.attr(el.elmt, 'disabled', strDisabled)
		});
	}
	
	const fn_getElmtByCol = function(_col) {
		
		const elmt = _.find(elements, {col: _col});
		
		if (gfn_isEmpty(elmt)) {
			console.error("invalid el", _col);
			return null;
		}
		
		let elValue = '';
		
		try {
			elValue = SBUxMethod.get(elmt.elmt);
			
			if (typeof elValue === 'object') {
				elValue = elValue[elmt.elmt];
			}
			
			if (gfn_isEmpty(elValue)) {
				elValue = '';
			} else {
				const elType = elmt.type;
				switch (elType) {
					case "string":
						elValue = '';
						break;
					case "number":
						elValue = parseInt(elValue) || '';
						break;
				}
			}
			
		} catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            console.error("_col", _col);
            elValue = '';
        }
 
		console.log("_col", _col);
		console.log("elValue", elValue);
		
		return elValue;
	}
	
	const fn_setDetailElmt = function(_data) {
		
		if (gfn_isEmpty(_data)) {
			_data = {}
			fn_setElmtDisabled(true);
		} else {
			fn_setElmtDisabled(false);
		}
		
		SBUxMethod.set("dtl-inp-depositId", gfn_nvl(_data["depositCode"]));
		
		elements.forEach((el) => {
			const elType = el.type;
			
			if (_.isEqual(elType, "string")) {
				//SBUxMethod.set(el.elmt, gfn_nvl(_data[el.id]), gfn_isEmpty(el['default']) ? "" : el['default']);
				SBUxMethod.set(el.elmt, gfn_nvl(_data[el.col]), gfn_isEmpty(el['default']) ? "" : el['default']);
			} else {
				//SBUxMethod.set(el.elmt, _data[el.id]);
				SBUxMethod.set(el.elmt, _data[el.col]);
			}
		});
	}
	
	/**
     * @name fn_setDetail
     * @description 예적금원장 그리드 생성	sb-area-grdSvgGnlgr
     * @function
     */
	const fn_setDetail = async function(_rowData) {
		
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                V_P_FI_ORG_CODE 	: gfn_nvl(_rowData.ACNTG_OGNZ_CD),
                V_P_BASE_DATE		: '',
                V_P_ALL_YN			: '',
                V_P_DEPOSIT_TYPE	: '',
                V_P_BANK_CS_CODE	: '',
                V_P_ACCOUNT_NUM		: '',
                V_P_DEPOSIT_CODE	: gfn_nvl(_rowData.DPMNY_CD),
                
                V_P_FORM_ID			: p_formId,
                V_P_MENU_ID			: p_menuId,
                V_P_PROC_ID			: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };
        	console.log("paramObj", paramObj);
        	
        const postJsonPromiseForList = gfn_postJSON("/fi/ftr/tri/selectFim5300List.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });
 
        const listData = await postJsonPromiseForList;
 
        try {
            if (_.isEqual("S", listData.resultStatus)) {
            	
            	jsonDetail.length = 0;
            	jsonTngtrn.length = 0;
                
            	fn_setDetailElmt(null);
            	
            	console.log("listData.cv_2", listData.cv_2);
            	
                listData.cv_2.forEach((item, index) => {
					/*
                    const obj = {
                    		FI_ORG_CODE: item.ACNTG_OGNZ_CD,
                    		DEPOSIT_TYPE: item.DPMNY_TYPE,
                    		ACCOUNT_OWNER: item.DPSTR_NM,
                    		DEPOSIT_CODE: item.DPMNY_CD,
                    		DEPOSIT_NAME: item.DPMNY_NM,
                    		ACCOUNT_NUM: item.ACTNO,
                    		CURRENCY_CODE: item.CRN_CD,
                    		BANK_CS_CODE: item.BANK_CNPT_CD,
                    		BANK_CS_NAME: item.BANK_CS_NAME,
                    		BANK_CODE: item.BANK_CD,
                    		BANK_NAME: item.BANK_NM,
                    		DEPOSIT_CATEGORY1: item.DPMNY_CTGRY1,
                    		DEPOSIT_CATEGORY2: item.DPMNY_CTGRY2,
                    		DEPOSIT_CATEGORY3: item.DPMNY_CTGRY3,
                    		BRANCH: item.BRNCH,
                    		DEPOSIT_STATUS: item.DPMNY_STTS,
                    		LIMIT1: item.PONE_LMT1,
                    		LIMIT2: item.PONE_LMT2,
                    		DESCR: item.DSCTN,
                    		DEPT_CODE: item.DEPT_CD,
                    		DEPT_NAME: item.DEPT_NM,
                    		COST_CENTER_CODE: item.CSTCD_CD,
                    		COST_CENTER_NAME: item.CSTCD_NM,
                    		DEPOSIT_ACCOUNT: item.DPMNY_ACNT,
                    		DEPOSIT_ACCOUNT_NAME: item.DEPOSIT_ACCOUNT_NAME,
                    		INTEREST_INCOME_ACCOUNT: item.INTRV_ACNT_CD,
                    		INTEREST_INCOME_ACCOUNT_NAME: item.INTEREST_INCOME_ACCOUNT_NAME,
                    		ADVANCED_INCOME_ACCOUNT: item.UNRV_ACNTL_CD,
                    		ADVANCED_INCOME_ACCOUNT_NAME: item.ADVANCED_INCOME_ACCOUNT_NAME,
                    		ACCRUED_INCOME_ACCOUNT: item.UCRV,
                    		ACCRUED_INCOME_ACCOUNT_NAME: item.ACCRUED_INCOME_ACCOUNT_NAME,
                    		CTAX_WITHHOLD_ACCOUNT: item.ADPY_COTX_ACNTL_CD,
                    		CTAX_WITHHOLD_ACCOUNT_NAME: item.CTAX_WITHHOLD_ACCOUNT_NAME,
                    		PTAX_WITHHOLD_ACCOUNT: item.LCLTX_WTHD_ACNT_CD,
                    		PTAX_WITHHOLD_ACCOUNT_NAME: item.PTAX_WITHHOLD_ACCOUNT_NAME,
                    		BILL_ACCOUNT: item.PRMNT_ACNT,
                    		BILL_ACCOUNT_NAME: item.BILL_ACCOUNT_NAME,
                    		DEPOSIT_IN_TR_TYPE: item.DPMNY_INT_MTRY_FUND_TYPE,
                    		DEPOSIT_IN_TR_NAME: item.DEPOSIT_IN_TR_NAME,
                    		DEPOSIT_OUT_TR_TYPE: item.DPMNY_TKMNY_FUND_TYPE,
                    		DEPOSIT_OUT_TR_NAME: item.DEPOSIT_OUT_TR_NAME,
                    		BILL_IN_TR_TYPE: item.PRMNT_PBNCN_FUND_TYPE,
                    		BILL_IN_TR_NAME: item.BILL_IN_TR_NAME,
                    		BILL_OUT_TR_TYPE: item.PRMNT_MTRY_FUND_TYPE,
                    		BILL_OUT_TR_NAME: item.BILL_OUT_TR_NAME,
                    		INTEREST_IN_TR_TYPE: item.SVG_MTRY_FUND_TYPE,
                    		INTEREST_IN_TR_NAME: item.INTEREST_IN_TR_NAME,
                    		CTAX_WITHHOLD_TR_TYPE: item.COTX_WTHD_FUND_TYPE,
                    		CTAX_WITHHOLD_TR_NAME: item.CTAX_WITHHOLD_TR_NAME,
                    		PTAX_WITHHOLD_TR_TYPE: item.RSDTX_WTHD_FUND_TYPE,
                    		PTAX_WITHHOLD_TR_NAME: item.PTAX_WITHHOLD_TR_NAME,
                    		OPEN_DATE: item.OPN_YMD,
                    		EXPIRE_DATE: item.MTRY_YMD,
                    		CURRENCY_CODE: item.CRN_CD,
                    		EXCHANGE_RATE: item.EXCHRT,
                    		CONTRACT_AMT: item.CTRT_AMT,
                    		CONTRACT_AMT_KRW: item.CTRT_AMT_KRW,
                    		PAYIN_CYCLE: item.PAYN_CYCL,
                    		PAYIN_DATE: item.PAYN_YMD,
                    		TOTAL_PAYIN_COUNT: item.TOT_PAYN_CNT,
                    		MONEY_PER_AMT: item.PONE_PAYN_AMT,
                    		INTEREST_RATE: item.INT_RT,
                    		CORPORATE_TAX_RATE: item.CORP_TX_RT,
                    		TXN_BANK_CODE: item.TRSC_BANK_CD,
                    		TXN_BANK_NAME: item.TXN_BANK_NAME,
                    		TXN_ACCOUNT_NUM: item.TRSC_ACTNO,
                    		TXN_ACCOUNT_OWNER: item.TRSC_BACNT_OWNR,
                    		CANCEL_DATE: item.CNCL_YMD,
                    		CANCEL_REASON: item.CNCL_RSN,
                    		CANCEL_EXCHANGE_RATE: item.CNCL_EXCHRT,
                    		CANCEL_AMT: item.CNCL_AMT,
                    		CANCEL_AMT_KRW: item.CNCL_AMT_KRW,
                    		CANCEL_INTEREST_AMT: item.CNCL_INT,
                    		CANCEL_INTEREST_AMT_KRW: item.CNCL_INT_KRW,
                    		WITHDRAW_ACC_YN: item.WHDWL_ACNT_YN,
                    		WITHDRAW_TYPE: item.WHDWL_TYPE,
                    		FBS_YN: item.FBS_YN,
                    		SEQ_YN: item.SEQ_YN,
                    		TAX_FBS_YN: item.TX_FBS_YN,
                    		EXCHANGE_GAIN_ACCOUNT: item.EXCHRT_PRF_ACNT,
                    		EXCHANGE_GAIN_ACCOUNT_NAME: item.EXCHANGE_GAIN_ACCOUNT_NAME,
                    		EXCHANGE_LOSS_ACCOUNT: item.EXCHRT_LOSS_ACNT,
                    		EXCHANGE_LOSS_ACCOUNT_NAME: item.EXCHANGE_LOSS_ACCOUNT_NAME,
                    		VAL_GAIN_ACCOUNT: item.CNVRT_PRF_ACNT_CD,
                    		VAL_GAIN_ACCOUNT_NAME: item.VAL_GAIN_ACCOUNT_NAME,
                    		VAL_LOSS_ACCOUNT: item.CNVRT_LOSS_ACNT_CD,
                    		VAL_LOSS_ACCOUNT_NAME: item.VAL_LOSS_ACCOUNT_NAME,
                    		EXCHANGE_GAIN_TR_TYPE: item.EXCHRT_PRF_FUND_TYPE,
                    		EXCHANGE_GAIN_TR_NAME: item.EXCHANGE_GAIN_TR_NAME,
                    		EXCHANGE_LOSS_TR_TYPE: item.EXCHRT_LOSS_FUND_TYPE,
                    		EXCHANGE_LOSS_TR_NAME: item.EXCHANGE_LOSS_TR_NAME,
                    		RECEIPT_TR_TYPE: item.RCPT_FUND_TYPE,
                    		RECEIPT_TR_NAME: item.RECEIPT_TR_NAME,
                    		RECEIPT_ACCOUNT: item.RCPT_ACNT_CD,
                    		RECEIPT_ACCOUNT_NAME: item.RECEIPT_ACCOUNT_NAME,
                    		FEE_ACCOUNT: item.FEE_AMT,
                    		FEE_ACCOUNT_NAME: item.FEE_ACCOUNT_NAME,
                    		FEE_TR_TYPE: item.FEE_FUND_TYPE,
                    		FEE_TR_NAME: item.FEE_TR_NAME,
 
                    		fiOrgCode: item.ACNTG_OGNZ_CD,
                    		depositType: item.DPMNY_TYPE,
                    		accountOwner: item.DPSTR_NM,
                    		depositCode: item.DPMNY_CD,
                    		depositName: item.DPMNY_NM,
                    		accountNum: item.ACTNO,
                    		currencyCode: item.CRN_CD,
                    		bankCsCode: item.BANK_CNPT_CD,
                    		bankCsName: item.BANK_CS_NAME,
                    		bankCode: item.BANK_CD,
                    		bankName: item.BANK_NM,
                    		depositCategory1: item.DPMNY_CTGRY1,
                    		depositCategory2: item.DPMNY_CTGRY2,
                    		depositCategory3: item.DPMNY_CTGRY3,
                    		branch: item.BRNCH,
                    		depositStatus: item.DPMNY_STTS,
                    		limit1: item.PONE_LMT1,
                    		limit2: item.PONE_LMT2,
                    		descr: item.DSCTN,
                    		deptCode: item.DEPT_CD,
                    		deptName: item.DEPT_NM,
                    		costCenterCode: item.CSTCD_CD,
                    		costCenterName: item.CSTCD_NM,
                    		depositAccount: item.DPMNY_ACNT,
                    		depositAccountName: item.DEPOSIT_ACCOUNT_NAME,
                    		interestIncomeAccount: item.INTRV_ACNT_CD,
                    		interestIncomeAccountName: item.INTEREST_INCOME_ACCOUNT_NAME,
                    		advancedIncomeAccount: item.UNRV_ACNTL_CD,
                    		advancedIncomeAccountName: item.ADVANCED_INCOME_ACCOUNT_NAME,
                    		accruedIncomeAccount: item.UCRV,
                    		accruedIncomeAccountName: item.ACCRUED_INCOME_ACCOUNT_NAME,
                    		ctaxWithholdAccount: item.ADPY_COTX_ACNTL_CD,
                    		ctaxWithholdAccountName: item.CTAX_WITHHOLD_ACCOUNT_NAME,
                    		ptaxWithholdAccount: item.LCLTX_WTHD_ACNT_CD,
                    		ptaxWithholdAccountName: item.PTAX_WITHHOLD_ACCOUNT_NAME,
                    		billAccount: item.PRMNT_ACNT,
                    		billAccountName: item.BILL_ACCOUNT_NAME,
                    		depositInTrType: item.DPMNY_INT_MTRY_FUND_TYPE,
                    		depositInTrName: item.DEPOSIT_IN_TR_NAME,
                    		depositOutTrType: item.DPMNY_TKMNY_FUND_TYPE,
                    		depositOutTrName: item.DEPOSIT_OUT_TR_NAME,
                    		billInTrType: item.PRMNT_PBNCN_FUND_TYPE,
                    		billInTrName: item.BILL_IN_TR_NAME,
                    		billOutTrType: item.PRMNT_MTRY_FUND_TYPE,
                    		billOutTrName: item.BILL_OUT_TR_NAME,
                    		interestInTrType: item.SVG_MTRY_FUND_TYPE,
                    		interestInTrName: item.INTEREST_IN_TR_NAME,
                    		ctaxWithholdTrType: item.COTX_WTHD_FUND_TYPE,
                    		ctaxWithholdTrName: item.CTAX_WITHHOLD_TR_NAME,
                    		ptaxWithholdTrType: item.RSDTX_WTHD_FUND_TYPE,
                    		ptaxWithholdTrName: item.PTAX_WITHHOLD_TR_NAME,
                    		openDate: item.OPN_YMD,
                    		expireDate: item.MTRY_YMD,
                    		currencyCode: item.CRN_CD,
                    		exchangeRate: item.EXCHRT,
                    		contractAmt: item.CTRT_AMT,
                    		contractAmtKrw: item.CTRT_AMT_KRW,
                    		payinCycle: item.PAYN_CYCL,
                    		payinDate: item.PAYN_YMD,
                    		totalPayinCount: item.TOT_PAYN_CNT,
                    		moneyPerAmt: item.PONE_PAYN_AMT,
                    		interestRate: item.INT_RT,
                    		corporateTaxRate: item.CORP_TX_RT,
                    		txnBankCode: item.TRSC_BANK_CD,
                    		txnBankName: item.TXN_BANK_NAME,
                    		txnAccountNum: item.TRSC_ACTNO,
                    		txnAccountOwner: item.TRSC_BACNT_OWNR,
                    		cancelDate: item.CNCL_YMD,
                    		cancelReason: item.CNCL_RSN,
                    		cancelExchangeRate: item.CNCL_EXCHRT,
                    		cancelAmt: item.CNCL_AMT,
                    		cancelAmtKrw: item.CNCL_AMT_KRW,
                    		cancelInterestAmt: item.CNCL_INT,
                    		cancelInterestAmtKrw: item.CNCL_INT_KRW,
                    		withdrawAccYn: item.WHDWL_ACNT_YN,
                    		withdrawType: item.WHDWL_TYPE,
                    		fbsYn: item.FBS_YN,
                    		seqYn: item.SEQ_YN,
                    		taxFbsYn: item.TX_FBS_YN,
                    		exchangeGainAccount: item.EXCHRT_PRF_ACNT,
                    		exchangeGainAccountName: item.EXCHANGE_GAIN_ACCOUNT_NAME,
                    		exchangeLossAccount: item.EXCHRT_LOSS_ACNT,
                    		exchangeLossAccountName: item.EXCHANGE_LOSS_ACCOUNT_NAME,
                    		valGainAccount: item.CNVRT_PRF_ACNT_CD,
                    		valGainAccountName: item.VAL_GAIN_ACCOUNT_NAME,
                    		valLossAccount: item.CNVRT_LOSS_ACNT_CD,
                    		valLossAccountName: item.VAL_LOSS_ACCOUNT_NAME,
                    		exchangeGainTrType: item.EXCHRT_PRF_FUND_TYPE,
                    		exchangeGainTrName: item.EXCHANGE_GAIN_TR_NAME,
                    		exchangeLossTrType: item.EXCHRT_LOSS_FUND_TYPE,
                    		exchangeLossTrName: item.EXCHANGE_LOSS_TR_NAME,
                    		receiptTrType: item.RCPT_FUND_TYPE,
                    		receiptTrName: item.RECEIPT_TR_NAME,
                    		receiptAccount: item.RCPT_ACNT_CD,
                    		receiptAccountName: item.RECEIPT_ACCOUNT_NAME,
                    		feeAccount: item.FEE_AMT,
                    		feeAccountName: item.FEE_ACCOUNT_NAME,
                    		feeTrType: item.FEE_FUND_TYPE,
                    		feeTrName: item.FEE_TR_NAME,
                    }
                    jsonDetail.push(obj);

					 */
					jsonDetail.push(item);
                });
                
				console.log("listData.cv_3", listData.cv_3);
            	
                listData.cv_3.forEach((item, index) => {
					/*
                    const obj = {
                   		TXN_ID: item.TRSC_ID,
                   		DEPOSIT_CODE: item.DPMNY_CD,
                   		ITEM_SEQ: item.ITEM_SEQ,
                   		OPEN_DATE: item.OPN_YMD,
                   		EXPIRE_DATE: item.MTRY_YMD,
                   		CURRENCY_CODE: item.CRN_CD,
                   		EXCHANGE_RATE: item.EXCHRT,
                   		CONTRACT_ORIGINAL_AMOUNT: item.CTRT_ORGNL_AMT,
                   		CONTRACT_FUNCTIONAL_AMOUNT: item.CTRT_KRW_AMT,
                   		INTEREST_RATE: item.INT_RT,
                   		CORPORATE_TAX_RATE: item.CORP_TX_RT,
                   		PROVANCE_TAX_RATE: item.LCLTX_INCTX_RT,
                   		DEPOSIT_STATUS: item.DPMNY_STTS,
                   		DESCR: item.DSCTN,
                    }
                    
                    jsonTngtrn.push(obj);

					 */
                    jsonTngtrn.push(item);

                });
                
                grdTngtrn.rebuild();
                
                if (jsonDetail.length > 0) {
                	fn_setDetailElmt(jsonDetail[0]);
                }
                
            } else {
                alert(listData.resultMessage);
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
	 * 공통팝업
	 * 공통은행정보 공통팝업
	 */ 
	const fn_compopupComBankH = function() {
		fn_compopupComBank('srch-inp-bankNoH', 'srch-inp-bankNameH');
	}
	const fn_compopupComBankD = function() {
		fn_compopupComBank('dtl-inp-bankCsCode', 'dtl-inp-bankCsName');
	}
	const fn_compopupComBank = function(_codeObj, _nameObj) {
	    var searchCode 		= gfn_nvl(SBUxMethod.get(_codeObj));
	    var searchName 		= gfn_nvl(SBUxMethod.get(_nameObj));
	    var replaceText0 	= "_SBSD_CD_";
	    var replaceText1 	= "_CD_NM_";
	    var strWhereClause 	= "AND SUB_CODE LIKE '%" + replaceText0 + "%' AND CODE_NAME LIKE '%" + replaceText1 + "%' ";
		
		SBUxMethod.attr('modal-compopup1', 'header-title', '공통은행정보 조회');
		compopup1({
			compCode				: gv_ma_selectedCorpCd
			,clientCode				: gv_ma_selectedClntCd
			,bizcompId				: 'P_COM027'
	    	,popupType				: 'A'
			,whereClause			: strWhereClause
				,searchCaptions			: ["코드", 	"명칭"]
				,searchInputFields		: ["SBSD_CD", 	"CD_NM"]
				,searchInputValues		: [searchCode, 	searchName]
			,width					: '500px'
			,height					: '400px'
				,tableHeader			: ["코드", 		 "명칭"]
				,tableColumnNames		: ["SBSD_CD", 	 "CD_NM"]
				,tableColumnWidths		: ["80px", 		 "80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set(_codeObj,	data.SBSD_CD);
				SBUxMethod.set(_nameObj, 	data.CD_NM);
			},
		});
	}
	
	
	/**
	 * 공통팝업
	 * 은행정보 공통팝업
	 */ 
	const fn_compopupBankD = function() {
		fn_compopupBank('dtl-inp-bankCode', 'dtl-inp-bankName');
	}
	const fn_compopupBankEstbl = function() {
		fn_compopupBank('estbl-inp-txnBankCode', 'estbl-inp-txnBankName');
	}
	const fn_compopupBank = function(_codeObj, _nameObj) {
        var searchCode 		= gfn_nvl(SBUxMethod.get(_codeObj));
        var searchName 		= gfn_nvl(SBUxMethod.get(_nameObj));
        var replaceText0 	= "_BANK_CD_";
        var replaceText1 	= "_BANK_NM_";
        var strWhereClause 	= "AND a.BANK_CD LIKE '%" + replaceText0 + "%' AND a.BANK_NM LIKE '%" + replaceText1 + "%'";
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '은행 정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM003'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "명칭"]
            ,searchInputFields		: ["BANK_CD", "BANK_NM"]
            ,searchInputValues		: [searchCode, searchName]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명"]
            ,tableColumnNames		: ["BANK_CD" , "BANK_NM"]
            ,tableColumnWidths		: ["80px", "150px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set(_codeObj, data.BANK_CD);
                SBUxMethod.set(_nameObj, data.BANK_NM);
            },
        });
    }
 
	
	/**
	 * 공통팝업
	 * 계정
	 */	 
    const fn_compopupAccountCode = function(_codeObj, _nameObj) {
    	
        var replaceText0 	= "_ACNTL_CD_";
        var replaceText1 	= "_ACNT_NM_"; 
        var searchText0		= gfn_nvl(SBUxMethod.get("APS_ACNT_CD"));
        var searchText1		= gfn_nvl(SBUxMethod.get("AP_ACC_NAME"));
        
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정 과목');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 			"명칭"]
   			,searchInputFields		: ["ACNTL_CD", 	"ACNT_NM"]
   			,searchInputValues		: [searchText0, 	searchText1]
			,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드",		"계정명",		]
   			,tableColumnNames		: ["ACNTL_CD", 	"ACNT_NM"]
   			,tableColumnWidths		: ["100px", 		"300px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set(_codeObj, gfn_nvl(data.ACNTL_CD));
				SBUxMethod.set(_nameObj, gfn_nvl(data.ACNT_NM));
			}
    	});
		SBUxMethod.openModal('modal-compopup1');
    }
	
	/**
	 * 공통팝업
	 * FUND
	 */	 
    const fn_compopupFundCode = function(_codeObj, _nameObj) {
        var searchCode 		= gfn_nvl(SBUxMethod.get(_codeObj));
        var searchName 		= gfn_nvl(SBUxMethod.get(_nameObj));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_FAM_NM_";
        var strWhereClause 	= "AND a.CODE LIKE '%" + replaceText0 + "%' AND a.FAM_NM LIKE '%" + replaceText1 + "%'";
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '자금수지항목 정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FUND_CODE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "명칭"]
            ,searchInputFields		: ["CODE", "FAM_NM"]
            ,searchInputValues		: [searchCode, searchName]
            ,height					: '400px'
            ,tableHeader			: ["코드", "명칭", "GROUP1", "GROUP2", "GROUP3", "GROUP4"]
            ,tableColumnNames		: ["CODE", "FAM_NM", "GROUP1", "GROUP2", "GROUP3", "GROUP4"]
            ,tableColumnWidths		: ["100px", "200px", "100px", "150px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set(_codeObj, data.CODE);
                SBUxMethod.set(_nameObj, data.FAM_NM);
            },
        });
    }
    
	
	/**
	 * 공통팝업
	 * 원가중심점
	 */	 
    const fn_compopupCostCenterCode = function(_codeObj, _nameObj) {
        var searchCode 		= gfn_nvl(SBUxMethod.get(_codeObj));
        var searchName 		= gfn_nvl(SBUxMethod.get(_nameObj));
        var replaceText0 	= "_CSTCD_CD_";
        var replaceText1 	= "_CSTCD_NM_";
        var strWhereClause 	= "AND A.CSTCD_CD  LIKE '%" + replaceText0 + "%' AND A.CSTCD_NM  LIKE '%" + replaceText1 + "%'";
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CC_INPUT'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["계정코드", "계정명"]
            ,searchInputFields		: ["CSTCD_CD", 	"CSTCD_NM"]
            ,searchInputValues		: [searchCode, searchName]
            ,width					: '800px'
        	,height					: '400px'
            ,tableHeader			: ["코드", "명칭", "부서코드", "부서명", "원가유형", "사업장", "여신영역"]
            ,tableColumnNames		: ["CSTCD_CD", "CSTCD_NM", "DEPT_CD", "CSTCD_NM", "CST_CLSF", "SITE_CD", "CRDT_SECT"]
            ,tableColumnWidths		: ["80px", "120px", "80px", "120px", "80px", "80px","80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set(_codeObj, data.CSTCD_CD);
                SBUxMethod.set(_nameObj, data.CSTCD_NM);
            },
        });
    }
	
	/**
	 * 공통팝업
	 * 부서정보
	 */	 
    const fn_compopupDeptCode = function(_codeObj, _nameObj) {
        var searchCode 	= gfn_nvl(SBUxMethod.get(_codeObj));
        var searchName 	= gfn_nvl(SBUxMethod.get(_nameObj));
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '부서 정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FI_DEPT'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: [searchCode, 	searchName,	gfn_dateToYmd(new Date())]
            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
            ,width					: '700px'
            ,height					: '300px'
            ,tableHeader			: ["부서코드", 		"부서명"]
            ,tableColumnNames		: ["DEPT_CD", 	"DEPT_NM"]
            ,tableColumnWidths		: ["150px", 		"250px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set(_codeObj, 	data.DEPT_CD);
                SBUxMethod.set(_nameObj, 	data.DEPT_NM);
            },
        });
    }
 
	/** resizer set **/
 
	const resizer = document.getElementById('resizer');
	const leftSide = resizer.previousElementSibling;
	const rightSide = resizer.nextElementSibling;
 
	let x = 0;
	let y = 0;
 
	let leftWidth = 0;
 
	const mouseDownHandler = function (e) {
		x = e.clientX;
		y = e.clientY;
		leftWidth = leftSide.getBoundingClientRect().width;
 
		document.addEventListener('mousemove', mouseMoveHandler);
		document.addEventListener('mouseup', mouseUpHandler);
	};
 
	const mouseMoveHandler = function (e) {
		const dx = e.clientX - x;
		const dy = e.clientY - y;
 
		document.body.style.cursor = 'col-resize';
 
		leftSide.style.userSelect = 'none';
		leftSide.style.pointerEvents = 'none';
 
		rightSide.style.userSelect = 'none';
		rightSide.style.pointerEvents = 'none';
 
		const newLeftWidth = ((leftWidth + dx) * 100) / resizer.parentNode.getBoundingClientRect().width;
		leftSide.style.width = `${'${newLeftWidth}'}%`;
		grdSvgGnlgr.resize();
		grdTngtrn.resize();
	};
 
	const mouseUpHandler = function () {
		resizer.style.removeProperty('cursor');
		document.body.style.removeProperty('cursor');
 
		leftSide.style.removeProperty('user-select');
		leftSide.style.removeProperty('pointer-events');
 
		rightSide.style.removeProperty('user-select');
		rightSide.style.removeProperty('pointer-events');
 
		document.removeEventListener('mousemove', mouseMoveHandler);
		document.removeEventListener('mouseup', mouseUpHandler);
	};
 
	resizer.addEventListener('mousedown', mouseDownHandler);
 
 
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
