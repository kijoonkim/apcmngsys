<%
/**
 * @Class Name 		: COM3400.jsp
 * @Description 	: 거래처 정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.08.26
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.08.26   	천용진		최초 생성
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
	<title>title : 거래처 정보</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <style>
		.table-search-ma > tbody > tr > th {
 			padding-top : 0px; 
 			padding-bottom : 0px; 
 			padding-left : 0px;
		}
		.table-search-ma > tbody > tr > td {
			padding: 0px;;
		}
    </style>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start; padding-bottom:0px;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3>
                </div>
                <div style="margin-left: auto;">
					<sbux-button id="btnEmp" name="btnEmp" uitype="normal" text="직원거래처 생성" class="btn btn-sm btn-outline-danger" onclick="fn_Emp" style="float: right;" ></sbux-button>
					<sbux-button id="btnSubmit" name="btnSubmit" uitype="normal" text="결재" class="btn btn-sm btn-outline-danger" onclick="fn_submit" style="float: right;margin-right:1rem;" ></sbux-button>
					<sbux-button id="btnSubmitHis" name="btnSubmitHis" uitype="normal" text="결재이력" class="btn btn-sm btn-outline-danger" onclick="fn_submitHis" style="float: right;margin-right:1rem;" ></sbux-button>
					<sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" onclick="fn_confirm" style="float: right;margin-right:1rem;" ></sbux-button>
					<sbux-button id="btnUnconfirm" name="btnUnconfirm" uitype="normal" text="미확정" class="btn btn-sm btn-outline-danger" onclick="fn_unconfirm" style="float: right;margin-right:1rem;" ></sbux-button>
					<sbux-button id="btnErrorSearch" name="btnErrorSearch" uitype="normal" text="오류 조회" class="btn btn-sm btn-outline-danger" onclick="fn_errorSearch" style="float: right;margin-right:1rem;" ></sbux-button>
					<sbux-button id="btnList" name="btnList" uitype="normal" text="리스트 조회" class="btn btn-sm btn-outline-danger" onclick="fn_list" style="float: right;margin-right:1rem;" ></sbux-button>
					<sbux-button id="btnOld" name="btnOld" uitype="normal" text="이력 조회" class="btn btn-sm btn-outline-danger" onclick="fn_old" style="float: right;margin-right:1rem;" ></sbux-button>
                </div>
            </div>
			<div class="box-body">
				<div class="box-search-ma">
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
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
								<th scope="row" class="th_bg_search">거래처유형</th>
								<td class="td_input" colspan="3" style="border-right:hidden;">
									<div class="dropdown btn-group">
										<button
											class="btn btn-sm btn-light dropdown-toggle " 
											style="width:160px;text-align:left" 
											type="button"
											id="SRCH_CS_GROUP_P" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false"
											data-bs-reference="parent">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=SRCH_CS_GROUP_P style="width:450px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>
								</td>
								<td></td>
								<th scope="row" class="th_bg_search">사업자번호</th>
								<td class="td_input" colspan="3" style="border-right: hidden;">
									<sbux-input id="SRCH_BIZ_REGNO1" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>                            
								</td>
								<td></td>
								<th scope="row" class="th_bg_search">대표자명</th>
								<td class="td_input" colspan="3" style="border-right: hidden;">
									<sbux-input id="SRCH_CHIEF_NAME1" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>                            
								</td>
								<td></td>     
								<th scope="row" class="th_bg_search">복수선택</th>
								<td class="td_input" colspan="" style="border-right:hidden;">
									<sbux-checkbox uitype="normal" id="SRCH_MULTI_YN" class="form-control input-sm check" text="사용여부" true-value="Y" false-value="N"/>
								</td>
								<td></td>
								<td style="border-right: hidden;">
									<sbux-button uitype="normal" text="복수선택 팝업" class="btn btn-sm btn-outline-danger" onclick="fn_multiSelect"></sbux-button>
								</td>                       
							</tr>
							<tr>
								<th scope="row" class="th_bg_search">거래처구분</th>
								<td class="td_input" colspan="3" style="border-right:hidden;">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="SRCH_CS_TYPE" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=SRCH_CS_TYPE style="width:250px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>                              
								</td>
								<td></td>
								<th scope="row" class="th_bg_search">거래처코드</th>
								<td class="td_input" style="border-right:hidden;">
									<sbux-input id="SRCH_CS_CODE_FR" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
								</td>
								<td style="text-align:center;">~</td>
								<td style="border-right: hidden;">
									<sbux-input id="SRCH_CS_CODE_TO" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
								</td>
								<td></td>
								<th scope="row" class="th_bg_search">거래처명</th>
								<td class="td_input" colspan="3" style="border-right:hidden;">
									<sbux-input id="SRCH_CS_NAME1" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>                          
								</td>                            
								<td></td>
							</tr>
							<tr>
								<th scope="row" class="th_bg_search">확정여부</th>
								<td class="td_input" colspan="3" style="border-right:hidden;">
									<sbux-select id="SRCH_USE_YN1" uitype="single" jsondata-ref="jsonUseYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
								<td></td>
								<th scope="row" class="th_bg_search">거래중지여부</th>
								<td class="td_input" colspan="3" style="border-right:hidden;">
									<sbux-select id="SRCH_USE_YN2" uitype="single" jsondata-ref="jsonUseYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
								<td></td>
								<th scope="row" class="th_bg_search">삭제여부</th>
								<td class="td_input" colspan="3" style="border-right:hidden;">
									<sbux-select id="SRCH_DELETE_YN" uitype="single" jsondata-ref="jsonUseYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>    
               <div class="row">
                   <div class="col-sm-4">
                       <div class="ad_tbl_top">
                           <ul class="ad_tbl_count">
                               <li>
                                   <span>◎ 거래처 리스트</span>
                                   <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                               </li>
                           </ul>
                       </div>
                       <div>
                           <div id="sb-area-grdCom3400" style="height:65vh; width:100%;"></div>
                       </div>
                   </div>
                   <div style="display:flex">
                       <sbux-tabs id="idxTab_detail" name="idxTab_detail" uitype="normal"
                           is-scrollable="false"
                           title-target-id-array="tabInfo^tabAddress^tabFinance^tabPurchase^tabSales^tabSalesShipTo^tabSalesCategory^tabTax^tabHistory^tabMapping"
                           title-text-array="거래처 기본정보 편집^주소/연락처^자금정보^구매정보^판매정보^판매납품처^판매처분류^세금 등^변경이력관리^매핑이력">
                       </sbux-tabs>   
                   </div>
                   <div class="col-sm-8 tab-content">
                       <div id="tabInfo" style="height:60vh;">
                    	<table id="dataArea1" class="table table-bordered tbl_fixed">
							<colgroup>
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:15%">
								<col style="width:10%">
								<col style="width:15%">
								<col style="width:10%">
								<col style="width:15%">
								<col style="width:15%">
							</colgroup>
							<tr>
								<th scope="row" class="th_bg">거래처 코드</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input id="CS_CODE" class="form-control input-sm"  uitype="text"  style="width:100%" readonly></sbux-input>
								</td>	                                    
								<td class="td_input" style="border-right: hidden;">
									<sbux-checkbox uitype="normal" id="USE_YN" class="form-control input-sm check" text="코드확정" true-value="Y" false-value="N"/>
								</td>	                                    
								<th scope="row" class="th_bg">약칭</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input id="CS_ABBR_NAME" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
								</td>	                                    
								<th scope="row" class="th_bg">대표 거래처 코드</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-input id="REF_CS_CODE" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
								</td>	                                    
							</tr>    
							<tr>
								<th scope="row" class="th_bg">거래처명</th>
								<td class="td_input" colspan="4">
									<sbux-input id="CS_NAME" class="form-control input-sm inpt_data_reqed"  uitype="text"  style="width:100%"></sbux-input>
								</td>
								<th scope="row" class="th_bg">통화</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
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
										<div class="dropdown-menu" aria-labelledby=CURRENCY_CODE style="width:250px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>   	
								</td>
							</tr>    
							<tr>
								<th scope="row" class="th_bg">거래처정식명</th>
								<td colspan="4" class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="CS_FULLNAME" class="form-control input-sm" ></sbux-input>
								</td>
								<th id='EMP_TH' scope="row" class="th_bg">사번</th>
								<td id='EMP_TD' class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="EMP_CODE" class="form-control input-sm" ></sbux-input>
								</td>	
								<td id='EMP_BTN'class="td_input">
									<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupEmpCode" ></sbux-button>
								</td>								
							</tr>                                   
							<tr>
								<th scope="row" class="th_bg">영문 거래처명</th>
								<td colspan="4" class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="CS_NAME_ENG" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input" style="border-right: hidden;">
								</td>	
								<td class="td_input" style="border-right: hidden;">
								</td>										
								<td class="td_input" style="border-right: hidden;">
								</td>
							</tr>
							<tr>
								<th scope="row" class="th_bg">거래처유형</th>
								<td id="TD_CS_GROUP" class="td_input" style="border-right: hidden;">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" 
											type="button"
											id="CS_GROUP" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=CS_GROUP style="width:600px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>
								</td>
								<td class="td_input" style="border-right: hidden;text-align:right !important;">
									<sbux-checkbox uitype="normal" id="FOREIGN_YN" class="form-control input-sm check" text="해외여부" true-value="Y" false-value="N" style="margin-right:1rem;"/>
								</td>
								<th scope="row" class="th_bg">금융기관코드</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="BANK_NO_H" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-input uitype="text" id="BANK_NAME_H" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input">
									<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupBank" ></sbux-button>
								</td>
							</tr>   
							<tr>
								<th scope="row" class="th_bg">국가</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle" 
											type="button"
											id="NATION_CODE" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=NATION_CODE style="width:250px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>                                    
								</td>
								<th scope="row" class="th_bg">지역</th>
								<td class="td_input" style="border-right: hidden;">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle" 
											type="button"
											id="REGION_CODE" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=REGION_CODE style="width:250px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>  									
								</td>		
								<td class="td_input" style="border-right: hidden;">	
								</td>		
								<td class="td_input" style="border-right: hidden; text-align:center !important;">	
									<sbux-checkbox uitype="normal" id="PURCHASE_YN" class="form-control input-sm check" text="매입처여부" true-value="Y" false-value="N"/>
								</td>		
								<td class="td_input" style="border-right: hidden;">	
									<sbux-checkbox uitype="normal" id="SALE_YN" class="form-control input-sm check" text="매출처여부" true-value="Y" false-value="N"/>
								</td>		
							</tr>
							<tr>
								<th scope="row" class="th_bg">법인구분</th>
								<td class="td_input " colspan="2" id="rdotd">
									<p class="ad_input_row">
										<sbux-radio id="BIZ_TYPE1" name="BIZ_TYPE" uitype="normal" value="C" class="radio_label" checked></sbux-radio>
										<label class="radio_label" for-id="BIZ_TYPE1">법인</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="BIZ_TYPE2" name="BIZ_TYPE" uitype="normal" value="P" class="radio_label"></sbux-radio>
										<label class="radio_label" for-id="BIZ_TYPE2">개인</label>
									</p>
								</td>						
								<th scope="row" class="th_bg">법인번호</th>
								<td class="td_input" style="border-right: hidden;" >
									<sbux-input uitype="text" id="COMP_REGNO" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input" style="border-right: hidden;">	
								</td>										
								<td class="td_input" style="border-right: hidden;  text-align:center !important;">	
									<sbux-checkbox uitype="normal" id="RESIDENT_YN" class="form-control input-sm check" text="주민분여부" true-value="Y" false-value="N"/>
								</td>										
								<td class="td_input" style="border-right: hidden;">	
									<sbux-checkbox uitype="normal" id="OSP_YN" class="form-control input-sm check" text="외주사여부" true-value="Y" false-value="N" readonly/>
								</td>										
							</tr>
							<tr>
								<th scope="row" class="th_bg">기업규모</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="COM_TYPE" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=COM_TYPE style="width:250px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>                                    
								</td>
								<th scope="row" class="th_bg">과세유형</th>
								<td class="td_input" style="border-right: hidden;">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="TAX_TYPE" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=TAX_TYPE style="width:250px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>                                    
								</td>
								<td class="td_input" style="border-right: hidden;text-align:right !important;"><b>기업분류</b></td>
								<td class="td_input" style="border-right: hidden;">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="CS_CATEGORY" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=CS_CATEGORY style="width:250px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>                                    
								</td>
								<td class="td_input" style="border-right: hidden;">
								</td>
							</tr>
							<tr>
								<th scope="row" class="th_bg">사업자번호</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-input uitype="text" id="BIZ_REGNO" class="form-control input-sm" ></sbux-input>
								</td>
								<th scope="row" class="th_bg">종사업장번호</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="SUB_NO" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input hidden-td" style="border-right: hidden; text-align:right !important;"><b>(</b>
									<sbux-checkbox uitype="normal" id="OSP_YN1" class="form-control input-sm check hidden-check" text="가공업체" true-value="Y" false-value="N"/>
								</td>									
								<td class="td_input hidden-td" style="border-right: hidden;  text-align:center !important;">	
									<sbux-checkbox uitype="normal" id="OSP_YN2" class="form-control input-sm check hidden-check" text="열처리업체" true-value="Y" false-value="N"/>
								</td>									
								<td class="td_input hidden-td" style="border-right: hidden;">
									<sbux-checkbox uitype="normal" id="OSP_YN3" class="form-control input-sm check hidden-check" text="포장업체 )" true-value="Y" false-value="N"/>
								</td>									
							</tr>
							<tr>
								<th scope="row" class="th_bg">대표자</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-input uitype="text" id="CHIEF_NAME" class="form-control input-sm inpt_data_reqed"></sbux-input>
								</td>
								<th scope="row" class="th_bg">주민번호</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-input uitype="text" id="CHIEF_SOCIALNO" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input" style="border-right: hidden;">	
								</td>									
								<td class="td_input hidden-td" style="border-right: hidden;">
									<sbux-checkbox uitype="normal" id="SHIPPING_YN" class="form-control input-sm check hidden-check" text="해운사여부" true-value="Y" false-value="N"/>
								</td>									
							</tr>
							<tr>
								<th scope="row" class="th_bg">업태</th>
								<td class="td_input" style="border-right: hidden;" colspan="2" >
									<sbux-input uitype="text" id="BIZ_CATEGORY" class="form-control input-sm inpt_data_reqed" ></sbux-input>
								</td>								
								<th scope="row" class="th_bg">종목</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-input uitype="text" id="BIZ_ITEMS" class="form-control input-sm inpt_data_reqed" ></sbux-input>
								</td>								
								<td class="td_input hidden-td" style="border-right: hidden;  text-align:center !important;">	
									<sbux-checkbox uitype="normal" id="TRANSPORT_YN" class="form-control input-sm check hidden-check" text="운송사여부" true-value="Y" false-value="N"/>
								</td>										
								<td class="td_input hidden-td" style="border-right: hidden;">	
									<sbux-checkbox uitype="normal" id="BANKRUPTCY_YN" class="form-control input-sm check hidden-check" text="신용시스템전송여부" true-value="Y" false-value="N"/>
								</td>										
							</tr>		
							<tr>
								<th scope="row" class="th_bg">지급보류여부</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-checkbox uitype="normal" id="DEFER_YN" class="form-control input-sm check" text="예" true-value="Y" false-value="N"/>
								</td>
								<td class="td_input" style="border-right: hidden;">
									<div class="dropdown">
										<button 
											style="width:130px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="DEFER_REASON" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=DEFER_REASON style="width:250px;height:200px;padding-top:0px;overflow:auto">
										</div>
									</div>   									
								</td>
								<th scope="row" class="th_bg">상태</th>
								<td class="td_input" style="border-right: hidden;">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="STATUS_CODE" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=STATUS_CODE style="width:250px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>  									
								</td>
								<td class="td_input" style="border-right: hidden;">	
								</td>
								<td class="td_input hidden-td" style="border-right: hidden;  text-align:center !important;">	
									<sbux-checkbox uitype="normal" id="CARGO_YN" class="form-control input-sm check hidden-check" text="하역사여부" true-value="Y" false-value="N"/>
								</td>
								<td class="td_input hidden-td" style="border-right: hidden;">	
									<sbux-checkbox uitype="normal" id="STEEL_SCRAP_PAY_YN" class="form-control input-sm check hidden-check" text="철스크랩거래여부" true-value="Y" false-value="N"/>
								</td>
							</tr>  													
							<tr>
								<th scope="row" class="th_bg">거래중지여부</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-checkbox uitype="normal" id="TXN_STOP_YN" class="form-control input-sm check" text="예" true-value="Y" false-value="N"/>
								</td>
								<td class="td_input" style="border-right: hidden;">
									<div class="dropdown">
										<button 
											style="width:130px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle"
											type="button"
											id="TXN_STOP_REASON" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=TXN_STOP_REASON style="width:350px;height:200px;padding-top:0px;overflow:auto">
										</div>
									</div>   									
								</td>
								<td class="td_input" style="border-right: hidden;">
									<sbux-datepicker id="TXN_STOP_DATE" name="TXN_STOP_DATE" uitype="popup" style="width:100px;height: 3.6vh;" placement="top" date-format="yyyy-mm-dd" class="table-datepicker-ma"></sbux-datepicker>
								</td>
								<td class="td_input" style="border-right: hidden;" colspan="2">
								</td>
								<td class="td_input hidden-td" style="border-right: hidden;  text-align:center !important;">
									<sbux-checkbox uitype="normal" id="LIQUOR_YN" class="form-control input-sm check hidden-check" text="주류업여부" true-value="Y" false-value="N"/>
								</td>
								<td class="td_input hidden-td" style="border-right: hidden;">	
									<sbux-checkbox uitype="normal" id="EXPECTED_CUSTOMER_YN" class="form-control input-sm check hidden-check" text="잠재고객" true-value="Y" false-value="N"/>
								</td>
							</tr>
                    	</table>
                   	</div>
                       <!-- 주소 ~ 매핑이력 - 주소/연락처 -->
					<div id="tabAddress" style="height:60vh;">
						<table id="addressTable" class="table table-bordered tbl_fixed">
							<colgroup>
								<col style="width:15%">
								<col style="width:10%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
							</colgroup>
							<tr>
								<th scope="row" class="th_bg">우편번호</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input id="ZIP_CODE" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
								</td>	
								<td class="td_input" style="border-right: hidden;">
									<sbux-button id="srch-btn-addr" name="srch-btn-addr" uitype="modal" target-id="" onclick="fn_goPopup" text="…" class="btn btn-xs btn-outline-dark"></sbux-button>
								</td>	                                    
								<th scope="row" class="th_bg">거래시작일</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-datepicker id="START_DATE" name="START_DATE" uitype="popup" style="width:100px;height: 3.6vh;" date-format="yyyy-mm-dd" class="table-datepicker-ma"></sbux-datepicker>
								</td>	                                    
								<th scope="row" class="th_bg">거래종료일</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-datepicker id="END_DATE" name="END_DATE" uitype="popup" style="width:100px;height: 3.6vh;" date-format="yyyy-mm-dd" class="table-datepicker-ma"></sbux-datepicker> 
								</td>	                                    
							</tr>    
							<tr>
								<th scope="row" class="th_bg">주소</th>
								<td class="td_input" style="border-right: hidden;" colspan="6">
									<sbux-input id="ADDRESS" class="form-control input-sm "  uitype="text"  style="width:100%"></sbux-input>
								</td>
							</tr>    
							<tr>
								<th scope="row" class="th_bg">대표전화</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-input id="TEL" class="form-control input-sm"  uitype="text"  style="width:100%" ></sbux-input>
								</td>	
								<th scope="row" class="th_bg">팩스</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input id="FAX" class="form-control input-sm"  uitype="text"  style="width:100%" ></sbux-input>
								</td>	                                    
								<th scope="row" class="th_bg">이메일</th>
								<td class="td_input" style="border-right: hidden;" colspan="">
									<sbux-input id="EMAIL_ID" class="form-control input-sm"  uitype="text"  style="width:100%"></sbux-input>
								</td>	 
							</tr>    
							<tr>
								<th scope="row" class="th_bg">홈페이지</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-input id="WEB_URL" class="form-control input-sm"  uitype="text"  style="width:100%"></sbux-input>
								</td>	
								<th scope="row" class="th_bg">채권채무조회서 Email</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-input id="RESULT1" class="form-control input-sm"  uitype="text"  style="width:100%"></sbux-input>
								</td>	 
								<td class="td_input" style="border-right: hidden;"></td>	 
							</tr>    
							<tr>
								<th scope="row" class="th_bg">비고</th>
								<td class="td_input" style="border-right: hidden;" colspan="6">
									<sbux-textarea id="MEMO" name="MEMO" uitype="normal" style="width:100%";></sbux-textarea>											
								</td>	
							</tr> 
							<tr>
								<th scope="row" class="th_bg">SAP 고객사코드</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-input id="SAP_CUSTOMER_CODE" class="form-control input-sm"  uitype="text"  style="width:100%"></sbux-input>
								</td>	
								<th scope="row" class="th_bg">SAP 공급사코드</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input id="SAP_VENDOR_CODE" class="form-control input-sm"  uitype="text"  style="width:100%"></sbux-input>
								
								</td>	                                    
								<td class="td_input" style="border-right: hidden;" colspan="2"></td>	 
							</tr>    										   
						</table>									
					</div>
					<!-- 주소 ~ 매핑이력 - 자금정보 -->
					<div id="tabFinance" style="height:60vh;">
						<div class="ad_tbl_toplist">
							<div style="display:ruby;float: right;">
								<span style="vertical-align:middle; text-align:center;">FBS 서비스</span>
								<div class="dropdown">
									<button 
										style="width:160px;text-align:left" 
										class="btn btn-sm btn-light dropdown-toggle " 
										type="button"
										id="FBS_SERVICE" 
										data-toggle="dropdown" 
										aria-haspopup="true" 
										aria-expanded="false">
										<font>선택</font>
										<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
									</button>
									<div class="dropdown-menu" aria-labelledby=FBS_SERVICE style="width:250px;height:250px;padding-top:0px;overflow:auto">
									</div>
								</div>   			                        	
								<sbux-button id="btnDelFinanceRow" name="btnDelFinanceRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delFinanceRow" style="float: right;"></sbux-button>
								<sbux-button id="btnAddFinanceRow" name="btnAddFinanceRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addFinanceRow" style="float: right;"></sbux-button>
								<sbux-button id="btnFinanceName" name="btnFinanceName" uitype="normal" text="수취인확인" class="btn btn-sm btn-outline-danger" onclick="fn_FinanceName" style="float: right;"></sbux-button>
							</div>
						</div>									
						<div>
							<div id="sb-area-grdFinance" style="height:60vh; width:100%;"></div>
						</div>
					</div>
					<!-- 주소 ~ 매핑이력 - 구매정보 -->
					<div id="tabPurchase" style="height:60vh;">
						<div class="ad_tbl_toplist">
							<div style="display:flex;float: right;">
								<sbux-button id="btnAddPurchaseRow" name="btnAddPurchaseRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addPurchaseRow" style="float: right;"></sbux-button>
								<sbux-button id="btnDelPurchaseRow" name="btnDelPurchaseRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delPurchaseRow" style="float: right;"></sbux-button>
							</div>
						</div>										
						<table id="addressTable" class="table table-bordered tbl_fixed">
							<colgroup>
								<col style="width:12%">
								<col style="width:12%">
								<col style="width:16%">
								<col style="width:8%">
								<col style="width:12%">
								<col style="width:16%">
								<col style="width:16%">
								<col style="width:8%">
							</colgroup>
							<tr>
								<th scope="row" class="th_bg">부가세</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="TAX_CODE" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=TAX_CODE style="width:730px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>       											
								</td>	
								<td class="td_input" style="border-right: hidden;">
								</td>
								<th scope="row" class="th_bg">업체전표마감구분</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="SLIP_CLS" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=SLIP_CLS style="width:250px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>       											
								</td>	
								<td class="td_input" style="border-right: hidden;">
								</td>
							</tr>    
							<tr>
								<th scope="row" class="th_bg">지급조건</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="PAY_DATE_RULE" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=PAY_DATE_RULE style="width:710px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>       											
								</td>	
								<td class="td_input" style="border-right: hidden;">
								</td>												
								<td class="td_input" style="border-right: hidden;">
									<sbux-checkbox uitype="normal" id="TAX_SEND" class="form-control input-sm check" text="정발행대상여부" true-value="Y" false-value="N"/>
								</td>												
								<td class="td_input" style="border-right: hidden;">
									<sbux-checkbox uitype="normal" id="INTERNAL_PAY_RULE_YN" class="form-control input-sm check" text="회사기준지급대상여부" true-value="Y" false-value="N"/>
								</td>												
							</tr>    
							<tr>
								<th scope="row" class="th_bg">인도조건</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="PUR_HANDOV_CNDT_CD" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=PUR_HANDOV_CNDT_CD style="width:250px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>    
								</td>	
								<td class="td_input" style="border-right: hidden;">
								</td>	
								<th scope="row" class="th_bg">CHECK한도(%)</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<sbux-input id="RCPT_CHK_RANGE" class="form-control input-sm"  uitype="text"  style="width:100%"></sbux-input>
								
								</td>	                                    
							</tr>    
							<tr>
								<th scope="row" class="th_bg">채무계정코드</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="AP_ACC_CODE" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="AP_ACC_NAME" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input">
									<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccountCode('AP_ACC')" ></sbux-button>
								</td>
								<th scope="row" class="th_bg">채무정산계정</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="AP_CLR_ACC" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="AP_CLR_ACC_NAME" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input">
									<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccountCode('AP_CLR')" ></sbux-button>
								</td> 
							</tr>    
							<tr>
								<th scope="row" class="th_bg">채무계정코드외화</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="AP_ACC_CODE_FOREIGN" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="AP_ACC_NAME_FOREIGN" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input">
									<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccountCode('FOREIGN')" ></sbux-button>
								</td>
								<th scope="row" class="th_bg">선급금계정</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="PREPAY_ACC_CODE" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="PREPAY_ACC_NAME" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input">
									<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccountCode('PREPAY')" ></sbux-button>
								</td> 
							</tr>    
						</table>		
						<div>
							<div id="sb-area-grdPurchase" style="height:350px; width:100%;"></div>
						</div>
					</div>
					<!-- 주소 ~ 매핑이력 - 판매정보 -->
					<div id="tabSales" style="height:60vh;">
						<div class="ad_tbl_toplist">
							<div style="display:flex;float: right;">
								<sbux-button id="btnAddSalesRow" name="btnAddSalesRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addSalesRow" style="float: right;"></sbux-button>
								<sbux-button id="btnDelSalesRow" name="btnDelSalesRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delSalesRow" style="float: right;"></sbux-button>
							</div>
						</div>										
						<table id="salesTable" class="table table-bordered tbl_fixed">
							<colgroup>
								<col style="width:15%">
								<col style="width:17%">
								<col style="width:17%">
								<col style="width:17%">
								<col style="width:17%">
								<col style="width:17%">
							</colgroup>
							<tr>
								<th scope="row" class="th_bg">인도조건</th>
								<td class="td_input" style="border-right: hidden;">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="DELIVERY_TYPE" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=DELIVERY_TYPE style="width:250px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>       											
								</td>	
								<th scope="row" class="th_bg">수금조건</th>
								<td class="td_input" style="border-right: hidden;">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="RECEIPT_DATE_RULE" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=RECEIPT_DATE_RULE style="width:400px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>       											
								</td>	
								<th scope="row" class="th_bg">세금계산서발행조건</th>
								<td class="td_input" style="border-right: hidden;">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="VAT_ISSUE_COND" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=VAT_ISSUE_COND style="width:250px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>       											
								</td>	
							</tr>    
							<tr>
								<th scope="row" class="th_bg">출하조건</th>
								<td class="td_input" style="border-right: hidden;">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="SHIPPING_TYPE" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=SHIPPING_TYPE style="width:250px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>       											
								</td>	
								<th scope="row" class="th_bg">역발행</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-checkbox uitype="normal" id="SALES_TAX_SEND" class="form-control input-sm check" text="역발행대상" true-value="Y" false-value="N"/>
								</td>												
							</tr>    
						</table>		
						<div>
							<div id="sb-area-grdSales" style="height:350px; width:100%;"></div>
						</div>									
					</div>
					<!-- 주소 ~ 매핑이력 - 판매납품처 -->
					<div id="tabSalesShipTo" style="height:60vh;">
						<div class="ad_tbl_toplist">
							<div style="display:flex;float: right;">
								<sbux-button id="btnAddSalesShipToRow" name="btnAddSalesShipToRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addSalesShipToRow" style="float: right;"></sbux-button>
								<sbux-button id="btnDelSalesShipToRow" name="btnDelSalesShipToRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delSalesShipToRow" style="float: right;"></sbux-button>
							</div>
						</div>										
						<div>
							<div id="sb-area-grdSalesShipTo" style="height:60vh; width:100%;"></div>
						</div>										
					</div>
					<!-- 주소 ~ 매핑이력 - 판매처분류 -->
					<div id="tabSalesCategory" style="height:60vh;">
						<div class="ad_tbl_toplist">
							<div style="display:flex;float: right;">
								<sbux-button id="btnAddSalesCategoryRow" name="btnAddSalesCategoryRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addSalesCategoryRow" style="float: right;"></sbux-button>
								<sbux-button id="btnDelSalesCategoryRow" name="btnDelSalesCategoryRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delSalesCategoryRow" style="float: right;"></sbux-button>
							</div>
						</div>										
						<table id="salesCategoryTable" class="table table-bordered tbl_fixed">
							<colgroup>
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
							</colgroup>
							<tr>
								<th scope="row" class="th_bg">채권계정코드</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="AR_ACC_CODE" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="AR_ACC_NAME" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input">
									<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccountCode('AR_ACC')" ></sbux-button>
								</td>
								<th scope="row" class="th_bg">채권계정코드외화</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="AR_ACC_CODE_FOREIGN" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="AR_ACC_NAME_FOREIGN" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input">
									<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccountCode('AR_ACC_FOREIGN')" ></sbux-button>
								</td> 
							</tr>  										
							<tr>
								<th scope="row" class="th_bg">선수금계정</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="ADVANCE_ACC_CODE" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="ADVANCE_ACC_NAME" class="form-control input-sm" ></sbux-input>
								</td>
								<td class="td_input">
									<sbux-button class="btn btn-xs btn-outline-dark" text="…" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAccountCode('ADVANCE_ACC')"></sbux-button>
								</td>
							</tr>  										
						</table>		
						<div>
							<div id="sb-area-grdSalesCategory" style="height:300px; width:100%;"></div>
						</div>										
					</div>
					<!-- 주소 ~ 매핑이력 - 세금 등 -->
					<div id="tabTax" style="height:60vh;">
						<table id="taxTable" class="table table-bordered tbl_fixed">
							<colgroup>
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
							</colgroup>
							<tr>
								<th scope="row" class="th_bg">원천세대상여부</th>
								<td class="td_input" style="border-right: hidden;">
									<sbux-checkbox uitype="normal" id="WITHHOLD_TAX_YN" class="form-control input-sm check" text="대    상" true-value="Y" false-value="N"/>
								</td>
							</tr>  										
							<tr>
								<th scope="row" class="th_bg">원천세납부세무서</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle " 
											type="button"
											id="WITHHOLD_TAX_OFFICE" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=WITHHOLD_TAX_OFFICE style="width:700px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>  											
								</td>
								<th scope="row" class="th_bg">원천세납부구청</th>
								<td class="td_input" style="border-right: hidden;">
									<div class="dropdown">
										<button 
											style="width:160px;text-align:left" 
											class="btn btn-sm btn-light dropdown-toggle"
											type="button"
											id="WITHHOLD_TAX_OFFICE2" 
											data-toggle="dropdown" 
											aria-haspopup="true" 
											aria-expanded="false">
											<font>선택</font>
											<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										</button>
										<div class="dropdown-menu" aria-labelledby=WITHHOLD_TAX_OFFICE2 style="width:700px;height:250px;padding-top:0px;overflow:auto">
										</div>
									</div>  											
								</td>
							</tr>  										
							<tr>
								<th scope="row" class="th_bg">원천세유형</th>
								<td class="td_input" style="border-right: hidden;" colspan="2">
									<div style="display:flex">
										<div class="dropdown">
											<button 
												style="width:260px;text-align:left" 
												class="btn btn-sm btn-light dropdown-toggle " 
												type="button"
												id="WITHHOLD_TAX_TYPE" 
												data-toggle="dropdown" 
												aria-haspopup="true" 
												aria-expanded="false">
												<font>선택</font>
												<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
											</button>
											<div class="dropdown-menu" aria-labelledby=WITHHOLD_TAX_TYPE style="width:600px;height:250px;padding-top:0px;overflow:auto">
											</div>
										</div>  											
									</div>
								</td>
								<td class="td_input" style="border-right: hidden;" >
									<sbux-input uitype="text" id="TAX_RATE" class="form-control input-xs" readonly></sbux-input>
								</td>
							</tr>  										
						</table>											
					</div>
					<!-- 주소 ~ 매핑이력 - 변경이력관리 -->
					<div id="tabHistory" style="height:60vh;">
						<div class="ad_tbl_toplist">
							<div style="display:flex;float: right;">
								<sbux-button id="btnAddHistoryRow" name="btnAddHistoryRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addHistoryRow" style="float: right;"></sbux-button>
								<sbux-button id="btnDelHistoryRow" name="btnDelHistoryRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delHistoryRow" style="float: right;"></sbux-button>
							</div>
						</div>										
						<div>
							<div id="sb-area-grdHistory" style="height:60vh; width:100%;"></div>
						</div>										
					</div>
					<!-- 주소 ~ 매핑이력 - 매핑이력 -->
					<div id="tabMapping" style="height:60vh;">
						<div class="ad_tbl_toplist">
							<div style="display:flex;float: right;">
								<sbux-button id="btnAddMappingRow" name="btnAddMappingRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addMappingRow" style="float: right;"></sbux-button>
								<sbux-button id="btnDelMappingRow" name="btnDelMappingRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delMappingRow" style="float: right;"></sbux-button>
							</div>
						</div>										
						<div>
							<div id="sb-area-grdMapping" style="height:60vh; width:100%;"></div>
						</div>										
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
    
    <!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:700px" id="modal-compopup3" name="modal-compopup3" uitype="middle" header-title="" body-html-id="body-modal-compopup3" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup3">
    	<jsp:include page="../../../com/popup/comPopup3.jsp"></jsp:include>
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
        <sbux-modal style="width:1400px" id="modal-compopcom3410" name="modal-compopcom3410" uitype="middle" header-title="" body-html-id="body-modal-compopcom3410" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopcom3410">
    	<jsp:include page="../../../com/popup/comPopCom3410.jsp"></jsp:include>
    </div>
    
<!--     팝업 Modal -->
    <div>
        <sbux-modal style="width:1400px" id="modal-compopcom3420" name="modal-compopcom3420" uitype="middle" header-title="" body-html-id="body-modal-compopcom3420" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopcom3420">
    	<jsp:include page="../../../com/popup/comPopCom3420.jsp"></jsp:include>
    </div>

<!--     팝업 Modal -->    
    <div>
        <sbux-modal style="width:1400px" id="modal-compopcom3430" name="modal-compopcom3430" uitype="middle" header-title="" body-html-id="body-modal-compopcom3430" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopcom3430">
    	<jsp:include page="../../../com/popup/comPopCom3430.jsp"></jsp:include>
    </div>
    
</body>

<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.id}';
	//-----------------------------------------------------------
	var workType 			= 'N';
	var strEmpCode_d 		= '';
	var strBankCode_d 		= '';
	var strBankAccount_d 	= '';
	
	var multiSelectData 		= ''; // 복수선택 데이터
	var jsonWithholdTaxType		= []; // 원천세유형
	var jsonUseYn				= []; //확정여부, 거래중지여부, 삭제여부
	var jsonStatusCode			= []; // 거래처 리스트 - 상태
	var jsonNoteType 			= []; // 주소 ~ 매핑이력 - 자금정보 탭 어음상품종류
	var jsonPayReason 			= []; // 주소 ~ 매핑이력 - 자금정보 탭 지급사유
	var jsonSendReason 			= []; // 주소 ~ 매핑이력 - 자금정보 탭 송금사유
	var jsonFeeCharger 			= []; // 주소 ~ 매핑이력 - 자금정보 탭 수수료부담자
	var jsonCurrencyCode 		= []; // 주소 ~ 매핑이력 - 자금정보 탭 통화
	var jsonVatAccountYN 		= []; // 주소 ~ 매핑이력 - 자금정보 탭 부가세전용계좌여부
	var jsonPurContactType 		= []; // 주소 ~ 매핑이력 - 구매정보 탭 용도
	var jsonSaleContactType 	= []; // 주소 ~ 매핑이력 - 판매정보 탭 용도
	var jsonCreditArea	 		= []; // 주소 ~ 매핑이력 - 판매처분류 탭 여신관리영역
	var jsonCsCategory1 		= []; // 주소 ~ 매핑이력 - 판매처분류 탭 분류1
	var jsonCsCategory2 		= []; // 주소 ~ 매핑이력 - 판매처분류 탭 분류2
	var jsonCsCategory3 		= []; // 주소 ~ 매핑이력 - 판매처분류 탭 분류3
	var jsonCsCategory4 		= []; // 주소 ~ 매핑이력 - 판매처분류 탭 분류4
	var jsonCsCategory5 		= []; // 주소 ~ 매핑이력 - 판매처분류 탭 분류5
	var jsonCsCategory6 		= []; // 주소 ~ 매핑이력 - 판매처분류 탭 분류6
	var jsonCsCategory7 		= []; // 주소 ~ 매핑이력 - 판매처분류 탭 분류7
	var jsonCsCategory8 		= []; // 주소 ~ 매핑이력 - 판매처분류 탭 분류8
	var jsonCsCategory9 		= []; // 주소 ~ 매핑이력 - 판매처분류 탭 분류9
	var jsonCsCategory10 		= []; // 주소 ~ 매핑이력 - 판매처분류 탭 분류10
	var jsonMapType 			= []; // 주소 ~ 매핑이력 - 매핑이력 탭 매칭유형
	var jsonEmpState				= [];
	var jsonCOM011				= [];
	const fn_initSBSelect = async function() {
		
		let rst = await Promise.all([
			//버튼 숨김처리
			$('.hidden-td').hide(),
			gfnma_setComSelect([], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([], jsonCOM011, 'L_COM011', "AND A.COMP_CODE = '" + gv_ma_selectedCorpCd + "'", gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//원천세 유형
            gfnma_setComSelect([], jsonWithholdTaxType, 'L_WITHHOLD_TAX_TYPE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TAX_TYPE_CODE', 'TAX_TYPE_NAME', 'Y', ''),
			// 주소 ~ 매핑이력 - 자금정보 탭 어음상품종류
            gfnma_setComSelect(['masterGrid','STATUS_CODE'], jsonStatusCode, 'L_FIG002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			// 주소 ~ 매핑이력 - 자금정보 탭 어음상품종류
            gfnma_setComSelect(['financeGrid','NOTE_TYPE'], jsonNoteType, 'L_FIF044', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			// 주소 ~ 매핑이력 - 자금정보 탭 지급사유
            gfnma_setComSelect(['financeGrid','PAY_REASON'], jsonPayReason, 'L_COM062', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			// 주소 ~ 매핑이력 - 자금정보 탭 송금사유
            gfnma_setComSelect(['financeGrid','SEND_REASON'], jsonSendReason, 'L_COM063', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			// 주소 ~ 매핑이력 - 자금정보 탭 수수료부담자
            gfnma_setComSelect(['financeGrid','FEE_CHARGER'], jsonFeeCharger, 'L_COM064', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			// 주소 ~ 매핑이력 - 자금정보 탭 통화
            gfnma_setComSelect(['financeGrid','CURRENCY_CODE'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
			// 주소 ~ 매핑이력 - 자금정보 탭 통화
            gfnma_setComSelect(['financeGrid','VAT_ACCOUNT_YN'], jsonVatAccountYN, 'L_COM036', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			// 주소 ~ 매핑이력 - 구매정보 탭 용도
            gfnma_setComSelect(['purchaseGrid','PUR_CONTACT_TYPE'], jsonPurContactType, 'L_COM049', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			// 주소 ~ 매핑이력 - 구매정보 탭 용도
            gfnma_setComSelect(['salesGrid','SALE_CONTACT_TYPE'], jsonSaleContactType, 'L_COM049', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
         	// 주소 ~ 매핑이력 - 판매처분류 탭 여신관리영역
            gfnma_setComSelect(['salesCategoryGrid','CREDIT_AREA'], jsonCreditArea, 'L_ORG020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
         	// 주소 ~ 매핑이력 - 판매처분류 탭 분류1
            gfnma_setComSelect(['salesCategoryGrid','CS_CATEGORY1'], jsonCsCategory1, 'L_COM051', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
         	// 주소 ~ 매핑이력 - 판매처분류 탭 분류2
            gfnma_setComSelect(['salesCategoryGrid','CS_CATEGORY2'], jsonCsCategory2, 'L_COM052', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
         	// 주소 ~ 매핑이력 - 판매처분류 탭 분류3
            gfnma_setComSelect(['salesCategoryGrid','CS_CATEGORY3'], jsonCsCategory3, 'L_COM053', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
         	// 주소 ~ 매핑이력 - 판매처분류 탭 분류4
            gfnma_setComSelect(['salesCategoryGrid','CS_CATEGORY4'], jsonCsCategory4, 'L_COM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
         	// 주소 ~ 매핑이력 - 판매처분류 탭 분류5
            gfnma_setComSelect(['salesCategoryGrid','CS_CATEGORY5'], jsonCsCategory5, 'L_COM055', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
         	// 주소 ~ 매핑이력 - 판매처분류 탭 분류6
            gfnma_setComSelect(['salesCategoryGrid','CS_CATEGORY6'], jsonCsCategory6, 'L_COM056', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
         	// 주소 ~ 매핑이력 - 판매처분류 탭 분류7
            gfnma_setComSelect(['salesCategoryGrid','CS_CATEGORY7'], jsonCsCategory7, 'L_COM057', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
         	// 주소 ~ 매핑이력 - 판매처분류 탭 분류8
            gfnma_setComSelect(['salesCategoryGrid','CS_CATEGORY8'], jsonCsCategory8, 'L_COM058', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
         	// 주소 ~ 매핑이력 - 판매처분류 탭 분류9
            gfnma_setComSelect(['salesCategoryGrid','CS_CATEGORY9'], jsonCsCategory9, 'L_COM059', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
         	// 주소 ~ 매핑이력 - 판매처분류 탭 분류10
            gfnma_setComSelect(['salesCategoryGrid','CS_CATEGORY10'], jsonCsCategory10,'L_COM060', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
         	// 주소 ~ 매핑이력 - 매핑이력 탭 매칭유형
            gfnma_setComSelect(['mappingGrid','MAP_TYPE'], jsonMapType	,'L_COM111_G', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'MAP_TYPE', 'MAP_TYPE_NAME', 'Y', ''),
			//거래처유형
			gfnma_multiSelectInit({
				target			: ['#SRCH_CS_GROUP_P']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM011'
				,whereClause	: "AND A.COMP_CODE = '" + gv_ma_selectedCorpCd + "'"
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "거래처유형코드",		ref: 'SUB_CODE', 		width:'150px',  	style:'text-align:left'},
		            {caption: "거래처유형명", 			ref: 'CODE_NAME',    	width:'250px',  	style:'text-align:left'},
		            {caption: "사업자등록번호", 	ref: 'EXTRA_FIELD3',    width:'200px',  	style:'text-align:left'}
				]
			}),
			//거래처구분
			gfnma_multiSelectInit({
				target			: ['#SRCH_CS_TYPE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM101'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "코드명",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),
			//확정여부
            gfnma_setComSelect(['SRCH_USE_YN1'], jsonUseYn, 'L_COM036', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', 'Y'),
			//거래중지여부
            gfnma_setComSelect(['SRCH_USE_YN2'], jsonUseYn, 'L_COM036', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', 'N'),
			//삭제여부
            gfnma_setComSelect(['SRCH_DELETE_YN'], jsonUseYn, 'L_COM036', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', 'N'),
			//통화
			gfnma_multiSelectInit({
				target			: ['#CURRENCY_CODE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM001'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'CURRENCY_CODE'
				,colLabel		: 'CURRENCY_NAME'
				,columns		:[
		            {caption: "통화코드",	ref: 'CURRENCY_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "통화명",	ref: 'CURRENCY_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),
		    //거래처유형
			gfnma_multiSelectInit({
				target			: ['#CS_GROUP']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM011'
				,whereClause	: "AND A.COMP_CODE = '" + gv_ma_selectedCorpCd + "'"
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "거래처유형코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
		            {caption: "거래처유형명", 			ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'},
		            {caption: "해외여부",				ref: 'EXTRA_FIELD2', 		width:'150px',  	style:'text-align:left'},
		            {caption: "사업자등록번호필수",		ref: 'EXTRA_FIELD3',    	width:'150px',  	style:'text-align:left'},
				]
			}),
			//국가
			gfnma_multiSelectInit({
				target			: ['#NATION_CODE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM015'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'NATION_CODE'
				,colLabel		: 'NATION_NAME'
				,columns		:[
		            {caption: "국가코드",		ref: 'NATION_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "국가명", 		ref: 'NATION_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//지역
	 		gfnma_multiSelectInit({
				target			: ['#REGION_CODE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM003'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  		style:'text-align:left'},
		            {caption: "지역(국내)",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
	 		}),
			//기업규모
			gfnma_multiSelectInit({
				target			: ['#COM_TYPE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM030'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명칭",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),
			//과세유형
			gfnma_multiSelectInit({
				target			: ['#TAX_TYPE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM029'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명칭",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),
			//기업분류
			gfnma_multiSelectInit({
				target			: ['#CS_CATEGORY']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM069'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명칭",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),
			//지급보류여부
			gfnma_multiSelectInit({
				target			: ['#DEFER_REASON']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM107'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'up' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "사유명",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'},
		            {caption: "초기값",	ref: 'DEFAULT_FLAG',   	width:'150px',  	style:'text-align:left'}
				]
			}),
			//거래중지여부
			gfnma_multiSelectInit({
				target			: ['#TXN_STOP_REASON']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM048'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'up' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "사유",	ref: 'CODE_NAME',    	width:'250px',  	style:'text-align:left'}
				]
			}),

			//상태
			gfnma_multiSelectInit({
				target			: ['#STATUS_CODE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIG002'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'up' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "전표상태",		ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),

			//구매정보 - 부가세
			gfnma_multiSelectInit({
				target			: ['#TAX_CODE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_VAT_INFO_P'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'VAT_CODE'
				,colLabel		: 'VAT_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'VAT_CODE', 		width:'80px',  	style:'text-align:left'},
		            {caption: "코드명",		ref: 'VAT_NAME',    	width:'250px',  	style:'text-align:left'},
		            {caption: "유형코드",		ref: 'VAT_TYPE_CODE',   width:'100px',  	style:'text-align:left'},
		            {caption: "유형명",		ref: 'VAT_TYPE_NAME',   width:'250px',  	style:'text-align:left'},
		            {caption: "세율",		ref: 'VAT_RATE',    	width:'50px',  	style:'text-align:left'},
				]
			}),

			//자금정보 - FBS서비스
			gfnma_multiSelectInit({
				target			: ['#FBS_SERVICE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FBS019'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명",		ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),

			//구매정보 - 업체전표마감구분
			gfnma_multiSelectInit({
				target			: ['#SLIP_CLS']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM112'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "코드명",		ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]
			}),
			
			//구매정보 - 지급조건
			gfnma_multiSelectInit({
				target			: ['#PAY_DATE_RULE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM012_P'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'PAY_TERM_CODE'
				,colLabel		: 'PAY_TERM_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'PAY_TERM_CODE', 		width:'80px',  	style:'text-align:left'},
		            {caption: "명칭",		ref: 'PAY_TERM_NAME',    	width:'250px',  style:'text-align:left'},
		            {caption: "명칭2",		ref: 'PAY_TERM_NAME2', 		width:'250px',  style:'text-align:left'},
		            {caption: "지급방법",		ref: 'PAY_METHOD',    		width:'80px',  	style:'text-align:left'},
		            {caption: "지급방법명",	ref: 'PAY_METHOD_NAME', 	width:'150px',  style:'text-align:left'}
				]
			}),
			
			//구매정보 - 지급조건
			gfnma_multiSelectInit({
				target			: ['#PUR_HANDOV_CNDT_CD']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM038_1'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "코드명",		ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]				
			}),
			
			//판매정보 - 인도조건
			gfnma_multiSelectInit({
				target			: ['#DELIVERY_TYPE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM038_1'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "코드명",		ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]				
			}),
			
			
			//판매정보 - 수금조건
			gfnma_multiSelectInit({
				target			: ['#RECEIPT_DATE_RULE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM012_S'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'PAY_TERM_CODE'
				,colLabel		: 'PAY_TERM_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'PAY_TERM_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명칭",		ref: 'PAY_TERM_NAME',    	width:'150px',  	style:'text-align:left'},
		            {caption: "명칭2",		ref: 'PAY_TERM_NAME2',    	width:'150px',  	style:'text-align:left'}
				]				
			}),
			
			//판매정보 - 세금계산서발행조건
			gfnma_multiSelectInit({
				target			: ['#VAT_ISSUE_COND']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM061'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "코드명",		ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]	
			}),
			
			//판매정보 - 출하조건
			gfnma_multiSelectInit({
				target			: ['#SHIPPING_TYPE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM039_1'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "코드명",		ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
				]	
			}),
			
			//세금 등 - 원천세납부세무서
			gfnma_multiSelectInit({
				target			: ['#WITHHOLD_TAX_OFFICE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_CS_GOVERNMENT'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'CS_CODE'
				,colLabel		: 'CS_NAME'
				,columns		:[
		            {caption: "거래처코드",		ref: 'CS_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "거래처명",			ref: 'CS_NAME',    		width:'150px',  	style:'text-align:left'},
		            {caption: "사업자번호",		ref: 'BIZ_REGNO', 		width:'150px',  	style:'text-align:left'},
		            {caption: "주소",			ref: 'ADDRESS',    		width:'300px',  	style:'text-align:left'}
				]	
			}),
			
			//세금 등 - 원천세납부구청
			gfnma_multiSelectInit({
				target			: ['#WITHHOLD_TAX_OFFICE2']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_CS_GOVERNMENT'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'CS_CODE'
				,colLabel		: 'CS_NAME'
				,columns		:[
		            {caption: "거래처코드",		ref: 'CS_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "거래처명",			ref: 'CS_NAME',    		width:'150px',  	style:'text-align:left'},
		            {caption: "사업자번호",		ref: 'BIZ_REGNO', 		width:'150px',  	style:'text-align:left'},
		            {caption: "주소",			ref: 'ADDRESS',    		width:'300px',  	style:'text-align:left'}
				]	
			}),
			//세금 등 - 원천세유형
			gfnma_multiSelectInit({
				target			: ['#WITHHOLD_TAX_TYPE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_WITHHOLD_TAX_TYPE'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'TAX_TYPE_CODE'
				,colLabel		: 'TAX_TYPE_NAME'
				,columns		:[
		            {caption: "원천세코드",		ref: 'TAX_TYPE_CODE', 		width:'150px',  	style:'text-align:left'},
		            {caption: "원천세명",			ref: 'TAX_TYPE_NAME',    	width:'150px',  	style:'text-align:left'},
		            {caption: "세율구분",			ref: 'TAX_GROUP', 			width:'150px',  	style:'text-align:left'},
		            {caption: "구분명",			ref: 'TAX_GROUP_NAME',    	width:'150px',  	style:'text-align:left'}
				]	
	            ,callback	:function (data){
	                if(data == ''){
	                	SBUxMethod.set("TAX_RATE", '0.0');
	                	return;
	                }
					for(var i=0; jsonWithholdTaxType.length > i; i++){
						if(data == jsonWithholdTaxType[i].value){
						    const strData = jsonWithholdTaxType[i].TAX_RATE.toString();
						    const decimalIndex = strData.indexOf('.');
						    if (decimalIndex === -1) {
						    	SBUxMethod.set("TAX_RATE", strData + '.000');
						    }else{
						        const decimal = strData.substring(decimalIndex + 1);
						        if(decimal.length < 3) {
						            SBUxMethod.set("TAX_RATE", strData + '0'.repeat(3 - decimal.length));
						            return;
						        }else{
						            SBUxMethod.set("TAX_RATE", strData.substring(0, decimalIndex + 4));
						            return;
						        }
						    }
						}
					}
	        	}
			}),
		]);

	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	//사번열 안보이게 수정
		$('#EMP_TH').hide();
		$('#EMP_TD').hide();
		$('#EMP_BTN').hide();
   		SBUxMethod.set("SRCH_DELETE_YN", 'N');
		SBUxMethod.set('SRCH_USE_YN1', 'Y');
		SBUxMethod.set('SRCH_USE_YN2', 'N');
    	fn_init();
    	
    });
    
    const fn_init = async function () {
    	await fn_initSBSelect();
    	await fn_createGrid();
    	await fn_createFinanceGrid();
    	await fn_createPurchaseGrid();
    	await fn_createSalesGrid();
    	await fn_createSalesShipToGrid();
    	await fn_createSalesCategoryGrid();
    	await fn_createHistoryGrid();
    	await fn_createMappingGrid();
    	cfn_search();
    	fn_event();

    }
    
    /**
     * 파일첨부
     */
    var cfn_attach = function() {
    	
    	const nRow = masterGrid.getRow();
	    if (nRow == -1) {
            gfn_comAlert("W0001", "파일첨부할 대상"); 				// W0003 >> {0}을/를 선택하세요.
	        return;
	    }
	    const selectRowVal = masterGrid.getRowData(nRow);
        // 파일첨부시 필요 변수
		var sourceType = 'COMCUSTOMER';	 						// 화면(업무)마다 소스타입이 다르다.
		var sourceCode = gfn_nvl(selectRowVal.CS_CODE);     	// 소스코드는 신규 저장 후 리턴되는 값을 지정하여야 한다.
    	
    	if( (sourceType) && (sourceCode) ){
			compopfilemng({
	    		compCode		: gv_ma_selectedCorpCd
	    		,clientCode		: gv_ma_selectedClntCd
	    		,sourceType		: sourceType
	    		,sourceCode		: sourceCode
	   			,formID			: p_formId
	   			,menuId			: p_menuId    		
			});
    	}
    }
    
    var fn_submit = function() {
    	const nRow = masterGrid.getRow();
	    if (nRow == -1) {
            gfn_comAlert("W0001", "결재 대상"); 				// W0003 >> {0}을/를 선택하세요.
	        return;
	    }
	    const selectRowVal = masterGrid.getRowData(nRow);
        // 결재처리 필요 변수
    	var apprId		= gfn_nvl(selectRowVal.APPR_ID) == "" ? "0" : gfn_nvl(selectRowVal.APPR_ID);    	// 상신시:0, 승인(반려): 부모에서 온 값
    	var sourceNo	= gfn_nvl(selectRowVal.CS_CODE);    	// 부모에서 온값
    	var sourceType 	= "CUSTOMER";							// 부모에서 온값
    	var p_empCd 	= '${loginVO.empCd}';	
    	//본인이 상신하는 경우
    	compopappvmng({
    		workType		: 'TEMPLATE'	// 상신:TEMPLATE , 승인(반려):APPR
    		,compCode		: gv_ma_selectedCorpCd
    		,compCodeNm		: gv_ma_selectedCorpNm
    		,clientCode		: gv_ma_selectedClntCd
    		,apprId			: apprId
    		,sourceNo		: sourceNo
    		,sourceType		: sourceType
   			,empCode		: p_empCd
   			,formID			: p_formId
   			,menuId			: p_menuId    		
		});
    }
    
    /**
     * 결재이력
     */
    var fn_submitHis = function() {
    	
    	const nRow = masterGrid.getRow();
	    if (nRow == -1) {
            gfn_comAlert("W0001", "결재이력 대상"); 				// W0003 >> {0}을/를 선택하세요.
	        return;
	    }
	    const selectRowVal = masterGrid.getRowData(nRow);

    	var apprId		= gfn_nvl(selectRowVal.APPR_ID) == "" ? "0" : gfn_nvl(selectRowVal.APPR_ID);    	// 상신시:0, 승인(반려): 부모에서 온 값
    	var docId		= gfn_nvl(selectRowVal.CS_CODE);    	// 부모에서 온값
    	var docType 	= "CUSTOMER";							// 부모에서 온값

    	
    	SBUxMethod.attr('modal-compopfim3420', 'header-title', '승인결과조회');
		SBUxMethod.openModal('modal-compopfim3420');
		
		compopfim3420({
    		height			: '600px'
    		,param			: {
    			p_appr_id	: apprId		//'23'
    			,p_doc_id	: docId		//'584'
    			,p_doc_type	: docType	//'AP'
    		}
   			,callbackEvent	: function (data){
   			},
    	});
  	}     
    
    /**
     * 오류조회
     */
    var fn_errorSearch = function() {
    	
    	SBUxMethod.attr('modal-compopcom3410', 'header-title', '오류 조회');
		SBUxMethod.openModal('modal-compopcom3410');
		
		compopcom3410({
    		height			: '600px'
    		,width			: '1000px'
       		,param			: {}
   			,callbackEvent	: function (data){
   			}
    	});
  	}     
    
    /**
     * 리스트조회
     */
    var fn_list = function() {
    	SBUxMethod.attr('modal-compopcom3420', 'header-title', '리스트 조회');
		SBUxMethod.openModal('modal-compopcom3420');
		compopcom3420({
    		height			: '600px'
    		,width			: '1400px'
       		,param			: {}
   			,callbackEvent	: function (data){
   			}
    	});
  	}     
	
    /**
     * 이력 조회
     */
    var fn_old = function() {
    	SBUxMethod.attr('modal-compopcom3430', 'header-title', '이력 조회');
		SBUxMethod.openModal('modal-compopcom3430');
		compopcom3430({
    		height			: '600px'
    		,width			: '1400px'
       		,param			: {}
   			,callbackEvent	: function (data){
   			}
    	});
  	}     
	
	// 신규
	function cfn_add() {
		workType = 'N';
		fn_clearSubForm();
		
		//신규 작성시 거래처 기본정보 편집 탭 제외한 나머지탭으로 이동하지 못하게 수정
		SBUxMethod.disableTab('tabAddress');
		SBUxMethod.disableTab('tabFinance');
		SBUxMethod.disableTab('tabPurchase');
		SBUxMethod.disableTab('tabSales');
		SBUxMethod.disableTab('tabSalesShipTo');
		SBUxMethod.disableTab('tabSalesCategory');
		SBUxMethod.disableTab('tabTax');
		SBUxMethod.disableTab('tabHistory');
		SBUxMethod.disableTab('tabMapping');
	
	    financeGrid.rebuild(); 			// 자금정보관리 그리드 초기화
	    purchaseGrid.rebuild(); 		// 구매정보 그리드 초기화
	    salesGrid.rebuild(); 			// 판매정보 그리드 초기화
	    salesShipToGrid.rebuild(); 		// 판매납품처관리 그리드 초기화
	    salesCategoryGrid.rebuild(); 	// 판매처분류 그리드 초기화
	    historyGrid.rebuild(); 			// 변경이력관리 그리드 초기화
	    mappingGrid.rebuild(); 			// 매핑이력관리 그리드 초기화
	}
	
    // 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
			fn_setSave();
		}
    }
    
    const fn_setSave = async function(){
    	
		if(SBUxMethod.get("CHIEF_SOCIALNO") != ''){
			if( !fn_socialRegex(SBUxMethod.get("CHIEF_SOCIALNO")) ){
				gfn_comAlert("E0000", "주민번호 형식이 올바르지 않습니다.");
				return; 
			}
		}
		if(SBUxMethod.get("BIZ_REGNO") != ''){
			if( !fn_compRegNoRegex(SBUxMethod.get("BIZ_REGNO")) ){
				gfn_comAlert("E0000", "사업자번호 형식이 올바르지 않습니다.");
				return;
			}
		}
		if(SBUxMethod.get("WITHHOLD_TAX_YN").WITHHOLD_TAX_YN == 'Y'){
			if(SBUxMethod.get("TEL") == ''){
				gfn_comAlert("E0000", "원천세 대상은 대표전화번호가 필수입니다.");
				return;
			}
		}
		if(SBUxMethod.get("DEFER_YN").DEFER_YN == 'Y'){
			if( gfnma_multiSelectGet("#DEFER_REASON") == ''){
				gfn_comAlert("E0000", "지급보류여부란의 항목을 입력하십시오.");
				return;
			}
		}
		if(SBUxMethod.get("TXN_STOP_YN").TXN_STOP_YN == 'Y'){
			if( gfnma_multiSelectGet("#DEFER_REASON") == '' || SBUxMethod.get("TXN_STOP_DATE") == ''){
				gfn_comAlert("E0000", "거래중지여부란의 항목을 입력하십시오.");
				return;
			}
		}
		
		if(await fn_save() == true){
			if(await fn_save_S3() == true){
				if(await fn_save_S4() == true){
					if(await fn_save_S5() == true){
						if(await fn_save_S6() == true){
							if(await fn_save_S7() == true){
								if(await fn_save_S8() == true){
									if(await fn_save_S9() == true){
										//한개 이상의 탭의 정보를 저장했을 경우 알림창이 어려개 떠서 정상적으로 저장이 됐을 경우 처리되었습니다 알림창이 뜨도록
										gfn_comAlert('I0001');
										await fn_search();
									}
								}
							}
						}
					}
				}
			}
		}
    }
    
    //마스터 그리드 삭제
	function cfn_del() {
    	const nRow = masterGrid.getRow();
	    if (masterGrid.getRow() == -1) {
	        gfn_comAlert("W0001", "삭제할 데이터"); 				// W0003 >> {0}을/를 선택하세요.
	        return;
	    }else{
			if(gfn_comConfirm("Q0001", "삭제")){ //{0} 하시겠습니까?
				fn_delete();
			}
	    }
	}
    
    /**
     * 초기화
     */
    function cfn_init() {
    	gfnma_uxDataClear('#srchArea1');
    }
    
	//조회
	function cfn_search() {
		workType = 'N';
		fn_search();
	}

    var masterGrid; 			// 거래처 리스트 그리드를 담기위한 객체 선언
    var financeGrid; 			// 자금정보관리 그리드를 담기위한 객체 선언
    var purchaseGrid; 			// 구매정보 그리드를 담기위한 객체 선언
    var salesGrid; 				// 판매정보 그리드를 담기위한 객체 선언
    var salesShipToGrid; 		// 판매납품처관리 그리드를 담기위한 객체 선언
    var salesCategoryGrid; 		// 판매처분류 그리드를 담기위한 객체 선언
    var historyGrid; 			// 변경이력관리 그리드를 담기위한 객체 선언
    var mappingGrid; 			// 매핑이력관리 그리드를 담기위한 객체 선언
	
    var jsonMasterList			= []; 	// 거래처 리스트 그리드의 참조 데이터 주소 선언
    var jsonFinanceList			= []; 	// 자금정보관리 그리드의 참조 데이터 주소 선언
    var jsonPurchaseList		= []; 	// 구매정보 그리드의 참조 데이터 주소 선언
    var jsonSalesList			= []; 	// 판매정보 그리드의 참조 데이터 주소 선언
    var jsonSalesShipToList		= []; 	// 판매납품처관리 그리드의 참조 데이터 주소 선언
    var jsonSalesCategoryList	= []; 	// 판매처분류 그리드의 참조 데이터 주소 선언
    var jsonHistoryList			= []; 	// 변경이력관리 그리드의 참조 데이터 주소 선언
    var jsonMappingList			= []; 	// 매핑이력관리 그리드의 참조 데이터 주소 선언
    
    const fn_createGrid = async function() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdCom3400';
	    SBGridProperties.id 				= 'masterGrid';
	    SBGridProperties.jsonref 			= 'jsonMasterList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: [''],    			ref: 'CHECK_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'
            },
            {caption : ["거래처코드"],	ref: 'CS_CODE', 	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ["거래처명"],		ref: 'CS_NAME', 	type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ["사업자번호"],	ref: 'PARENT_COST_CENTER',		type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption : ['매입처'],   		ref: 'PURCHASE_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center',
            		disabled : true
            },
            {caption : ['매출처'],			ref: 'SALE_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center',
            		disabled : true
            },
            {caption : ['확정여부'],   		ref: 'USE_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center',
            		disabled : true
            },
            {caption : ['거래중지여부'],		ref: 'TXN_STOP_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center',
            		disabled : true
            },
            {caption : ['삭제여부'],   		ref: 'DELETE_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center',
            		disabled : true
            },
            {caption : ["상태"], 			ref: 'STATUS_CODE', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonStatusCode',
                    disabled : true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ["상신자"],		ref: 'REQUEST_EMP',		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption : ["전승인자"],		ref: 'BEFORE_APPR_EMP',		type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption : ["차승인자"],		ref: 'NEXT_APPR_EMP',		type:'output',  	width:'200px',  	style:'text-align:left'}
        ];
        masterGrid	= _SBGrid.create(SBGridProperties);
        masterGrid.bind('click', 'fn_viewSubTable');
        masterGrid.bind('keyup', 'fn_keyup');
    }
    
    const fn_keyup = async function(event){
    	if(event.keyCode == 38 || event.keyCode == 40 ){
    		await fn_viewSubTable();
    	}
    }
    const fn_createFinanceGrid = async function() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdFinance';
	    SBGridProperties.id 				= 'financeGrid';
	    SBGridProperties.jsonref 			= 'jsonFinanceList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
    	SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
     	SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ['기본계좌'],    			ref: 'MAIN_FLAG',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },
            {caption : ["행번"],					ref: 'SEQ', 	type:'output',  	width:'50px',  	style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;' },
            {caption: ["은행검색 팝업"], 			ref: 'POP_BTN_BANK', type:'button', width:'80px', style:'text-align:center', /*disabled: true,*/
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_gridPopupBank(event, " + nRow + ", " + nCol + ")'>…</button>";
                }
            },
            {caption : ["은행"],					ref: 'BANK_CODE', 	type:'input',  	width:'150px',  	style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;' },
            {caption : ["은행명"],				ref: 'BANK_NAME',		type:'input',  	width:'200px',  	style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;' },
            {caption : ["계좌번호"],				ref: 'BANK_ACCOUNT_NO',		type:'input',  	width:'100px',  	style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;' },
            {caption : ["계좌주"],				ref: 'BANK_ACCOUNT_OWNER',		type:'input',  	width:'100px',  	style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;' },
            {caption : ["어음상품종류"], 			ref: 'NOTE_TYPE', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonNoteType',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ["B2B코드"],				ref: 'BTB_CODE',		type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption : ["CMS코드"],				ref: 'CMS_CODE',		type:'input',  	width:'150px',  	style:'text-align:left'},
            {caption : ["SWIFT_BIC"],			ref: 'PAYER_SWIFT_BIC',		type:'input',  	width:'200px',  	style:'text-align:left'},
            {caption : ["입금은행명및주소"],		ref: 'PAYER_BANK_INFO',		type:'input',  	width:'200px',  	style:'text-align:left'},
            {caption : ["지급사유"], 				ref : 'PAY_REASON', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonPayReason',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ["송금사유"], 				ref : 'SEND_REASON', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonSendReason',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ["수수료부담자"], 			ref : 'FEE_CHARGER', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonFeeCharger',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ["통화"], 				ref : 'CURRENCY_CODE', width : '150px', style : 'text-align:center', type : 'combo', fixedstyle : 'background-color:#f1ffd9;' ,
                typeinfo : {
                    ref : 'jsonCurrencyCode',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ['적용시작일'],			ref : 'EFFECT_START_DATE',	width : '120px',	style : 'text-align:center',	type : 'inputdate',	typeinfo : {dateformat :'yyyy-mm-dd', oneclickedit:true, displayui:true}, fixedstyle : 'background-color:#f1ffd9;' },
            {caption : ['적용종료일'],			ref : 'EFFECT_END_DATE',	width : '120px',	style : 'text-align:center',	type : 'inputdate',	typeinfo : {dateformat :'yyyy-mm-dd', oneclickedit:true, displayui:true}, fixedstyle : 'background-color:#f1ffd9;' },
            {caption : ["부가세전용계좌여부"], 		ref : 'VAT_ACCOUNT_YN', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonVatAccountYN',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ['수취인확인일'],			ref : 'FIRM_PAYEE_DATE',	width : '120px',	style : 'text-align:center',	type : 'inputdate',	typeinfo : {dateformat :'yyyy-mm-dd', oneclickedit:true, displayui:true}},
            {caption : ["수취인확인전문번호"],		ref: 'FIRM_PAYEE_TRF_NO',		type:'input',  	width:'200px',  	style:'text-align:left'},
            {caption : ["수취인조회결과코드"],		ref: 'RESULT_CODE',		type:'input',  	width:'200px',  	style:'text-align:left'},
            {caption : ["예금주확인값"],			ref: 'RESULT_NAME',		type:'input',  	width:'200px',  	style:'text-align:left'},
            {caption : ["비고"],					ref: 'DESCRIPTION',		type:'input',  	width:'200px',  	style:'text-align:left'}
        ];
        financeGrid	= _SBGrid.create(SBGridProperties);
    }
    
    const fn_createPurchaseGrid = async function() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdPurchase';
	    SBGridProperties.id 				= 'purchaseGrid';
	    SBGridProperties.jsonref 			= 'jsonPurchaseList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
    	SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
     	SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption : ["용도"], 		ref : 'PUR_CONTACT_TYPE', width : '150px', style : 'text-align:center', type : 'combo', fixedstyle : 'background-color:#f1ffd9;',
                typeinfo : {
                    ref : 'jsonPurContactType',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            
            },
            {caption : ["구매부서"],		ref: 'PUR_DEPT_NAME', 		type:'input',  	width:'80px',  		style:'text-align:left'},
            {caption : ["담당자"],		ref: 'PUR_CONTACT_NAME', 	type:'input',  	width:'150px',  	style:'text-align:left'},
            {caption : ["전화(회사)"],	ref: 'PUR_CONTACT_TEL',		type:'input',  	width:'200px',  	style:'text-align:left'},
            {caption : ["전화(휴대폰)"],	ref: 'PUR_CONTACT_MOBILE',	type:'input',  	width:'200px',  	style:'text-align:left'},
            {caption : ["이메일"],		ref: 'PUR_CONTACT_EMAIL',	type:'input',  	width:'200px',  	style:'text-align:left'},
            {caption : ["팩스"],			ref: 'PUR_CONTACT_FAX',		type:'input',  	width:'200px',  	style:'text-align:left'},
            {caption : ["주소"],			ref: 'PUR_ADDRESS',			type:'input',  	width:'200px',  	style:'text-align:left'}
        ];
        purchaseGrid = _SBGrid.create(SBGridProperties);
    }
    
    const fn_createSalesGrid = async function() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdSales';
	    SBGridProperties.id 				= 'salesGrid';
	    SBGridProperties.jsonref 			= 'jsonSalesList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
    	SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
     	SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption : ["용도"], 		ref : 'SALE_CONTACT_TYPE', width : '150px', style : 'text-align:center', type : 'combo', fixedstyle : 'background-color:#f1ffd9;',
                typeinfo : {
                    ref : 'jsonSaleContactType',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ["판매부서"],		ref: 'SALE_DEPT_NAME', 		type:'input',  	width:'80px',  		style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;'},
            {caption : ["담당자"],		ref: 'SALE_CONTACT_NAME', 	type:'input',  	width:'100px',  	style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;'},
            {caption : ["전화(회사)"],	ref: 'SALE_CONTACT_TEL',	type:'input',  	width:'150px',  	style:'text-align:left'},
            {caption : ["전화(휴대폰)"],	ref: 'SALE_CONTACT_MOBILE',	type:'input',  	width:'150px',  	style:'text-align:left'},
            {caption : ["이메일"],		ref: 'SALE_CONTACT_EMAIL',	type:'input',  	width:'150px',  	style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;'},
            {caption : ["팩스"],			ref: 'SALE_CONTACT_FAX',	type:'input',  	width:'150px',  	style:'text-align:left'},
            {caption : ["주소"],			ref: 'SALE_ADDRESS',		type:'input',  	width:'150px',  	style:'text-align:left'}
        ];
        salesGrid = _SBGrid.create(SBGridProperties);
    }
    
    const fn_createSalesShipToGrid = async function() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdSalesShipTo';
	    SBGridProperties.id 				= 'salesShipToGrid';
	    SBGridProperties.jsonref 			= 'jsonSalesShipToList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
    	SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
     	SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption : ["납품처코드"],	ref: 'SHIP_TO_CODE', 		type:'input',  	width:'80px',  		style:'text-align:left'},
            {caption : ["납품처명"],		ref: 'SHIP_TO_NAME', 		type:'input',  	width:'80px',  		style:'text-align:left'},
            {caption : ["우편번호"],		ref: 'ZIP_CODE', 			type:'input',  	width:'150px',  	style:'text-align:left'},
            {caption : ["납품처주소"],	ref: 'ADDRESS',				type:'input',  	width:'200px',  	style:'text-align:left'},
            {caption : ["전화번호"],		ref: 'SHIP_TO_TEL',			type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption : ["여신관리영역"],	ref: 'CREDIT_AREA',			type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption : ["영업사원"],		ref: 'SALES_PERSON_NAME',	type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption : ["도착지코드"],	ref: 'DEST_CD',				type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption : ["도착지명"],		ref: 'DEST_NM',				type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption : ["원납품처코드"],	ref: 'SHIP_ORD_CODE',		type:'input',  	width:'100px',  	style:'text-align:left'}
        ];
        salesShipToGrid = _SBGrid.create(SBGridProperties);
    }
    
    const fn_createSalesCategoryGrid = async function() {
    	//코드목록 
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-grdSalesCategory';
        SBGridProperties.id 				= 'salesCategoryGrid';
        SBGridProperties.jsonref 			= 'jsonSalesCategoryList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption : ["여신관리영역"], 	ref: 'CREDIT_AREA', width : '150px', style : 'text-align:center', type : 'combo', fixedstyle : 'background-color:#f1ffd9;',
                typeinfo : {
                    ref : 'jsonCreditArea',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },        	
            {caption : ["분류그룹"],		ref: 'CS_CATEGORY_GROUP', 	type:'input',  	width:'150px', 		style:'text-align:left'},
            {caption: ["분류1"],	ref: 'CS_CATEGORY1', 	type:'combo',  	width:'100px',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonCsCategory1',
					label		: 'label',
					value		: 'value',
					displayui 	: true, 
					oneclickedit: true
            	}
            },
            {caption : ["분류2"], 		ref: 'CS_CATEGORY2', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonCsCategory2',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },        	
            {caption : ["분류3"], 		ref: 'CS_CATEGORY3', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonCsCategory3',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },        	
            {caption : ["분류4"], 		ref: 'CS_CATEGORY4', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonCsCategory4',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },        	
            {caption : ["분류5"], 		ref: 'CS_CATEGORY5', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonCsCategory5',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },        	
            {caption : ["분류6"], 		ref: 'CS_CATEGORY6', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonCsCategory6',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },        	
            {caption : ["분류7"], 		ref: 'CS_CATEGORY7', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonCsCategory7',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },        	
            {caption : ["분류8"], 		ref: 'CS_CATEGORY8', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonCsCategory8',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },        	
            {caption : ["분류9"], 		ref: 'CS_CATEGORY9', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonCsCategory9',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },        	
            {caption : ["분류10"], 		ref: 'CS_CATEGORY10', width : '150px', style : 'text-align:center', type : 'combo',
                typeinfo : {
                    ref : 'jsonCsCategory10',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            }        	
        ];
        salesCategoryGrid = _SBGrid.create(SBGridProperties);
    }

    const fn_createHistoryGrid = async function() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdHistory';
	    SBGridProperties.id 				= 'historyGrid';
	    SBGridProperties.jsonref 			= 'jsonHistoryList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
    	SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
     	SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption : ['적용시작일'],	ref : 'START_DATE',	width : '120px',	style : 'text-align:center',	type : 'inputdate',	typeinfo : {dateformat :'yyyy-mm-dd', oneclickedit:true, displayui:true}, fixedstyle : 'background-color:#f1ffd9;'},
            {caption : ['적용종료일'],	ref : 'END_DATE',	width : '120px',	style : 'text-align:center',	type : 'inputdate',	typeinfo : {dateformat :'yyyy-mm-dd', oneclickedit:true, displayui:true}, fixedstyle : 'background-color:#f1ffd9;'},
            {caption : ["사업자번호"],	ref : 'BIZ_REGNO', 		type:'input',  	width:'150px', 		style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;'},
            {caption : ["업    태"],		ref : 'BIZ_CATEGORY', 	type:'input',  	width:'150px',  	style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;'},
            {caption : ["종    목"],		ref : 'BIZ_ITEMS',		type:'input',  	width:'150px',  	style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;'},
            {caption : ["대 표 자"],		ref : 'CHIEF_NAME',		type:'input',  	width:'150px',  	style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;'}
        ];
        historyGrid = _SBGrid.create(SBGridProperties);
    }

    const fn_createMappingGrid = async function() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdMapping';
	    SBGridProperties.id 				= 'mappingGrid';
	    SBGridProperties.jsonref 			= 'jsonMappingList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
    	SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
     	SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption : ["매칭유형"], 			ref: 'MAP_TYPE', width : '150px', style : 'text-align:center', type : 'combo', fixedstyle : 'background-color:#f1ffd9;',
                typeinfo : {
                    ref : 'jsonMapType',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },    
            {caption : ["SAP거래처코드"],			ref : 'ASIS_CS_CODE', 	type:'input',  	width:'200px', 		style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;'},
            {caption : ["통합IT거래처코드"],		ref : 'CS_CODE', 		type:'input',  	width:'150px',  	style:'text-align:left', fixedstyle : 'background-color:#f1ffd9;'},
            {caption : ["통합IT거래처명"],			ref : 'CS_NAME',		type:'input',  	width:'150px',  	style:'text-align:left'},
            {caption : ["통합IT거래처사업자번호"],	ref : 'BIZ_REGNO',		type:'input',  	width:'150px',  	style:'text-align:left'}
        ];
        mappingGrid = _SBGrid.create(SBGridProperties);
    }
    
    /**
     * 코드목록 조회
     */
    const fn_search = async function() {

    	// 코드목록 그리드 초기화
    	await fn_clearForm();
    	await fn_clearSubForm();
    	
    	let SRCH_MULTI_YN 		= gfn_nvl(SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN);
    	let SRCH_CS_GROUP_P		= gfnma_multiSelectGet("#SRCH_CS_GROUP_P");
    	let SRCH_BIZ_REGNO1 	= gfn_nvl(SBUxMethod.get("SRCH_BIZ_REGNO1"));
    	let SRCH_CHIEF_NAME1 	= gfn_nvl(SBUxMethod.get("SRCH_CHIEF_NAME1"));
    	let SRCH_CS_TYPE 		= gfnma_multiSelectGet("#SRCH_CS_TYPE");
    	let SRCH_CS_CODE_FR 	= gfn_nvl(SBUxMethod.get("SRCH_CS_CODE_FR"));
    	let SRCH_CS_CODE_TO 	= gfn_nvl(SBUxMethod.get("SRCH_CS_CODE_TO"));
    	let SRCH_CS_NAME1 		= gfn_nvl(SBUxMethod.get("SRCH_CS_NAME1"));
    	let SRCH_USE_YN1 		= gfn_nvl(SBUxMethod.get("SRCH_USE_YN1"));
    	let SRCH_USE_YN2 		= gfn_nvl(SBUxMethod.get("SRCH_USE_YN2"));
    	let SRCH_DELETE_YN 		= gfn_nvl(SBUxMethod.get("SRCH_DELETE_YN"));
    	if(SRCH_CS_CODE_TO == ''){
    		SBUxMethod.set("SRCH_CS_CODE_TO", SRCH_CS_CODE_FR);
    		SRCH_CS_CODE_TO = SRCH_CS_CODE_FR;
    	}

    	var paramObj = {
    			  V_P_DEBUG_MODE_YN       : ''
   				  ,V_P_LANG_ID            : ''
   				  ,V_P_COMP_CODE          : gv_ma_selectedCorpCd
   				  ,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
   				  ,V_P_CS_CODE_FR         : SRCH_CS_CODE_FR
   				  ,V_P_CS_CODE_TO         : SRCH_CS_CODE_TO
   				  ,V_P_CS_CODE            : SRCH_MULTI_YN == 'Y' ? multiSelectData : "" 
   				  ,V_P_CS_NAME            : SRCH_CS_NAME1
   				  ,V_P_CS_GROUP_P         : SRCH_CS_GROUP_P
   				  ,V_P_BIZ_REGNO          : SRCH_BIZ_REGNO1
   				  ,V_P_USE_YN1            : SRCH_USE_YN1
   				  ,V_P_USE_YN2            : SRCH_USE_YN2
   				  ,V_P_DELETE_YN          : SRCH_DELETE_YN
   				  ,V_P_CS_TYPE            : SRCH_CS_TYPE
   				  ,V_P_CHIEF_NAME         : SRCH_CHIEF_NAME1
   				  ,V_P_FORM_ID            : p_formId
   				  ,V_P_MENU_ID            : p_menuId
   				  ,V_P_PROC_ID            : ""
   				  ,V_P_USERID             : p_userId
   				  ,V_P_PC                 : ""
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3400.do", {
			getType				: 'json',
			workType			: 'LIST',
			cv_count			: '13',
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
			    			APPR_ID					: gfn_nvl(item.APPR_ID),
			    			BEFORE_APPR_EMP			: gfn_nvl(item.BEFORE_APPR_EMP),
			    			BEFORE_PROXY_EMP		: gfn_nvl(item.BEFORE_PROXY_EMP),
			    			BIZ_REGNO				: gfn_nvl(item.BIZ_REGNO),
			    			CHECK_YN				: gfn_nvl(item.CHECK_YN),
		    				USE_YN					: gfn_nvl(item.USE_YN),
		    				CONFIRM_EMP_CODE		: gfn_nvl(item.CONFIRM_EMP_CODE),
		    				CS_CODE					: gfn_nvl(item.CS_CODE),
		    				CS_NAME					: gfn_nvl(item.CS_NAME),
		    				DELETE_YN				: gfn_nvl(item.DELETE_YN),
		    				FILE_UPLOAD_YN     		: gfn_nvl(item.FILE_UPLOAD_YN),
		    				INSERT_TIME				: gfn_nvl(item.INSERT_TIME),
		    				INSERT_USERID			: gfn_nvl(item.INSERT_USERID),
		    				NEXT_APPR_EMP			: gfn_nvl(item.NEXT_APPR_EMP),
		    				NEXT_PROXY_EMP			: gfn_nvl(item.NEXT_PROXY_EMP),
		    				PROXY_EMP_CODE			: gfn_nvl(item.PROXY_EMP_CODE),
		    				PURCHASE_YN				: gfn_nvl(item.PURCHASE_YN),
		    				REQUEST_EMP				: gfn_nvl(item.REQUEST_EMP),
		    				SALE_YN					: gfn_nvl(item.SALE_YN),
		    				SAP_CUSTOMER_CODE		: gfn_nvl(item.SAP_CUSTOMER_CODE),
		    				SAP_VENDOR_CODE			: gfn_nvl(item.SAP_VENDOR_CODE),
		    				STATUS_CODE				: gfn_nvl(item.STATUS_CODE),
		    				TXN_STOP_YN				: gfn_nvl(item.TXN_STOP_YN),
		    				UPDATE_TIME				: gfn_nvl(item.UPDATE_TIME),
		    				UPDATE_USERID			: gfn_nvl(item.UPDATE_USERID)
		    		}
		    		jsonMasterList.push(msg);
		    		totalRecordCount ++;
		    	});
	    	   	
	    	   	fn_setMasterGridStyle(jsonMasterList);
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
    		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    	}
    	        
    }
    const fn_setMasterGridStyle = async function(list) {
    	masterGrid.rebuild();
      	for (var i = 0; i < list.length; i++) {
      		var obj = list[i];
      		if(obj['DELETE_YN']=='Y'){
      			masterGrid.setRowStyle(i+1, 'data', 'background', '#ff6347');
      		}
      	}
      	masterGrid.clearSelection();
    }
    /**
     * 코드목록 조회
     */
    const fn_viewSubTable = async function() {
    	
    	// 그리드의 빈곳을 눌렀을 때 리턴
    	const nRow = masterGrid.getRow();
	    if (nRow == -1) {
	        return;
	    }

		SBUxMethod.enableTab('tabAddress');
		SBUxMethod.enableTab('tabFinance');
		SBUxMethod.enableTab('tabPurchase');
		SBUxMethod.enableTab('tabSales');
		SBUxMethod.enableTab('tabSalesShipTo');
		SBUxMethod.enableTab('tabSalesCategory');
		SBUxMethod.enableTab('tabTax');
		SBUxMethod.enableTab('tabHistory');
		SBUxMethod.enableTab('tabMapping');
		// 거래처 리스트 선택시 탭 선택 초기화
		SBUxMethod.setTab('idxTab_detail', 'tabInfo');
    	// 코드목록 그리드 초기화
    	await fn_clearSubForm();
	    const selectRowVal = masterGrid.getRowData(nRow);
    	
    	let SRCH_MULTI_YN 		= gfn_nvl(SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN);
    	let SRCH_CHIEF_NAME1 	= gfn_nvl(SBUxMethod.get("SRCH_CHIEF_NAME1"));
    	let SRCH_BIZ_REGNO1 	= gfn_nvl(SBUxMethod.get("SRCH_BIZ_REGNO1"));
    	let SRCH_CS_CODE_FR 	= gfn_nvl(SBUxMethod.get("SRCH_CS_CODE_FR"));
    	let SRCH_CS_CODE_TO 	= gfn_nvl(SBUxMethod.get("SRCH_CS_CODE_TO"));
    	let SRCH_USE_YN1 		= gfn_nvl(SBUxMethod.get("SRCH_USE_YN1"));
    	let SRCH_USE_YN2 		= gfn_nvl(SBUxMethod.get("SRCH_USE_YN2"));
    	let SRCH_DELETE_YN 		= gfn_nvl(SBUxMethod.get("SRCH_DELETE_YN"));
    	let SRCH_CS_GROUP_P		= gfnma_multiSelectGet("#SRCH_CS_GROUP_P");
    	let SRCH_CS_TYPE 		= gfnma_multiSelectGet("#SRCH_CS_TYPE");
    	var paramObj = {
    			V_P_DEBUG_MODE_YN       : ''
   				,V_P_LANG_ID            : ''
   				,V_P_COMP_CODE          : gv_ma_selectedCorpCd
   				,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
   				,V_P_CS_CODE_FR         : gfn_nvl(SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN) == 'N' ? SRCH_CS_CODE_FR : ""
   				,V_P_CS_CODE_TO         : gfn_nvl(SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN) == 'N' ? SRCH_CS_CODE_TO : ""
   				,V_P_CS_CODE            : gfn_nvl(selectRowVal.CS_CODE)
   				,V_P_CS_NAME            : gfn_nvl(selectRowVal.CS_NAME)
   				,V_P_CS_GROUP_P         : SRCH_CS_GROUP_P
   				,V_P_BIZ_REGNO          : SRCH_BIZ_REGNO1
   				,V_P_USE_YN1            : SRCH_USE_YN1
   				,V_P_USE_YN2            : SRCH_USE_YN2
   				,V_P_DELETE_YN          : SRCH_DELETE_YN
   				,V_P_CS_TYPE            : SRCH_CS_TYPE
   				,V_P_CHIEF_NAME         : SRCH_CHIEF_NAME1
   				,V_P_FORM_ID            : p_formId
   				,V_P_MENU_ID            : p_menuId
   				,V_P_PROC_ID            : ""
   				,V_P_USERID             : p_userId
   				,V_P_PC                 : ""
	    };
		const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3400.do", {
			getType				: 'json',
			workType			: 'MASTER',
			cv_count			: '13',
			params				: gfnma_objectToString(paramObj)
		});
    	const data = await postJsonPromise;
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
	    		workType = 'U';
	    		const cv_1 = data.cv_1[0];
	    		const cv_2 = data.cv_2[0];
	    		const cv_4 = data.cv_4[0];
	    		const cv_5 = data.cv_5[0];
	    		const cv_7 = data.cv_7[0];
	    		const cv_8 = data.cv_8[0];
	    		
	    		//거래처 기본정보 편집 데이터 입력
	    		if(data.cv_1.length > 0) {
		        	SBUxMethod.set("BIZ_REGNO",					gfn_nvl(cv_1.BIZ_REGNO));
		        	SBUxMethod.set("CS_CODE",					gfn_nvl(cv_1.CS_CODE));
		        	SBUxMethod.set("CS_ABBR_NAME",		 		gfn_nvl(cv_1.CS_ABBR_NAME));
		        	SBUxMethod.set("REF_CS_CODE",				gfn_nvl(cv_1.REF_CS_CODE));
		        	SBUxMethod.set("CS_NAME",					gfn_nvl(cv_1.CS_NAME));
		        	SBUxMethod.set("CS_FULLNAME",				gfn_nvl(cv_1.CS_FULLNAME));
		        	SBUxMethod.set("CS_NAME_ENG",				gfn_nvl(cv_1.CS_NAME_ENG));
		        	SBUxMethod.set("BANK_NO_H",					gfn_nvl(cv_1.BANK_NO_H));
		        	SBUxMethod.set("BANK_NAME_H",				gfn_nvl(cv_1.BANK_NAME_H));
		        	SBUxMethod.set("COMP_REGNO",				gfn_nvl(cv_1.COMP_REGNO));
		        	SBUxMethod.set("SUB_NO",					gfn_nvl(cv_1.SUB_NO));
		        	SBUxMethod.set("CHIEF_NAME",				gfn_nvl(cv_1.CHIEF_NAME));
		        	SBUxMethod.set("CHIEF_SOCIALNO",			gfn_nvl(cv_1.CHIEF_SOCIALNO));
		        	SBUxMethod.set("BIZ_CATEGORY",				gfn_nvl(cv_1.BIZ_CATEGORY));
		        	SBUxMethod.set("BIZ_ITEMS",					gfn_nvl(cv_1.BIZ_ITEMS));
		        	SBUxMethod.set("TXN_STOP_DATE",				gfn_nvl(cv_1.TXN_STOP_DATE));
		        	SBUxMethod.set("USE_YN", 					gfn_nvl(cv_1.USE_YN));
		        	SBUxMethod.set("FOREIGN_YN", 				gfn_nvl(cv_1.FOREIGN_YN));
		        	SBUxMethod.set("PURCHASE_YN", 				gfn_nvl(cv_1.PURCHASE_YN));
		        	SBUxMethod.set("SALE_YN", 					gfn_nvl(cv_1.SALE_YN));
		        	SBUxMethod.set("RESIDENT_YN", 				gfn_nvl(cv_1.RESIDENT_YN));
		        	SBUxMethod.set("OSP_YN", 					gfn_nvl(cv_1.OSP_YN));
		        	SBUxMethod.set("OSP_YN1", 					gfn_nvl(cv_1.OSP_YN1));
		        	SBUxMethod.set("OSP_YN2", 					gfn_nvl(cv_1.OSP_YN2));
		        	SBUxMethod.set("OSP_YN3", 					gfn_nvl(cv_1.OSP_YN3));
		        	SBUxMethod.set("SHIPPING_YN", 				gfn_nvl(cv_1.SHIPPING_YN));
		        	SBUxMethod.set("TRANSPORT_YN", 				gfn_nvl(cv_1.TRANSPORT_YN));
		        	SBUxMethod.set("CARGO_YN", 					gfn_nvl(cv_1.CARGO_YN));
		        	SBUxMethod.set("STEEL_SCRAP_PAY_YN", 		gfn_nvl(cv_1.STEEL_SCRAP_PAY_YN));
		        	SBUxMethod.set("BANKRUPTCY_YN", 			gfn_nvl(cv_1.BANKRUPTCY_YN));
		        	SBUxMethod.set("EXPECTED_CUSTOMER_YN", 		gfn_nvl(cv_1.EXPECTED_CUSTOMER_YN));
		        	SBUxMethod.set("DEFER_YN", 					gfn_nvl(cv_1.DEFER_YN));
		        	SBUxMethod.set("TXN_STOP_YN",				gfn_nvl(cv_1.TXN_STOP_YN));
		        	SBUxMethod.set("BIZ_TYPE",					gfn_nvl(cv_1.BIZ_TYPE));
		        	gfnma_multiSelectSet("#CS_GROUP", 			"SUB_CODE", 		"CODE_NAME",	gfn_nvl(cv_1.CS_GROUP));
		        	gfnma_multiSelectSet("#REGION_CODE", 		"SUB_CODE", 		"CODE_NAME", 	gfn_nvl(cv_1.REGION_CODE));
		        	gfnma_multiSelectSet("#COM_TYPE", 			"SUB_CODE", 		"CODE_NAME", 	gfn_nvl(cv_1.COM_TYPE));
		        	gfnma_multiSelectSet("#TAX_TYPE", 			"SUB_CODE", 		"CODE_NAME", 	gfn_nvl(cv_1.TAX_TYPE));
		        	gfnma_multiSelectSet("#CS_CATEGORY",		"SUB_CODE", 		"CODE_NAME", 	gfn_nvl(cv_1.CS_CATEGORY));
		        	gfnma_multiSelectSet("#DEFER_REASON",		"SUB_CODE", 		"CODE_NAME", 	gfn_nvl(cv_1.DEFER_REASON));
		        	gfnma_multiSelectSet("#STATUS_CODE",		"SUB_CODE", 		"CODE_NAME", 	gfn_nvl(cv_1.STATUS_CODE));
		        	gfnma_multiSelectSet("#TXN_STOP_REASON",	"SUB_CODE", 		"CODE_NAME", 	gfn_nvl(cv_1.TXN_STOP_REASON));
		        	gfnma_multiSelectSet("#NATION_CODE", 		"NATION_CODE", 		"NATION_NAME", 	gfn_nvl(cv_1.NATION_CODE));
		        	gfnma_multiSelectSet("#CURRENCY_CODE", 		"CURRENCY_CODE", 	"CURRENCY_NAME",gfn_nvl(cv_1.CURRENCY_CODE));
		        	
		            if(gfn_nvl(cv_1.STATUS_CODE) == '5'){
		            	$('#btnSubmit').show();
		            }else{
		            	$('#btnSubmit').hide();
		            }
		            fn_changeTXN_STOP_YN(gfn_nvl(cv_1.TXN_STOP_YN));
		        	//주소 ~ 매핑이력 - 구매정보 -> 업체전표마감구분 데이터
		        	// 구매정보 탭은 cv_4에서 데이터 가져오는데 SLIP_CLS는 CV_1에서 데이터 가져옴
		        	gfnma_multiSelectSet("#SLIP_CLS", 			"SUB_CODE", 		"SUB_CODE",		gfn_nvl(cv_1.SLIP_CLS));
	    		}
	    		if(data.cv_2.length > 0) {
		        	//주소 ~ 매핑이력 - 주소/연락처
		        	SBUxMethod.set("ZIP_CODE", 				gfn_nvl(cv_2.ZIP_CODE));
		        	SBUxMethod.set("START_DATE", 			gfn_nvl(cv_2.START_DATE));
		        	SBUxMethod.set("END_DATE", 				gfn_nvl(cv_2.END_DATE));
		        	SBUxMethod.set("ADDRESS", 				gfn_nvl(cv_2.ADDRESS));
		        	SBUxMethod.set("TEL", 					gfn_nvl(cv_2.TEL));
		        	SBUxMethod.set("FAX", 					gfn_nvl(cv_2.FAX));
		        	SBUxMethod.set("EMAIL_ID", 				gfn_nvl(cv_2.EMAIL_ID));
		        	SBUxMethod.set("WEB_URL", 				gfn_nvl(cv_2.WEB_URL));
		        	SBUxMethod.set("RESULT1", 				gfn_nvl(cv_2.RESULT1));
		        	SBUxMethod.set("MEMO", 					gfn_nvl(cv_2.MEMO));
		        	SBUxMethod.set("SAP_CUSTOMER_CODE", 	gfn_nvl(cv_2.SAP_CUSTOMER_CODE));
		        	SBUxMethod.set("SAP_VENDOR_CODE", 		gfn_nvl(cv_2.SAP_VENDOR_CODE));
	    		}
	        	
	        	//주소 ~ 매핑이력 - 자금정보
	    	   	data.cv_3.forEach((item, index) => {
		    		const cv3_data = {
		    				MAIN_FLAG				: gfn_nvl(item.MAIN_FLAG),
		    				SEQ						: gfn_nvl(item.SEQ),
		    				BANK_CODE				: gfn_nvl(item.BANK_CODE),
		    				BANK_NAME				: gfn_nvl(item.BANK_NAME),
		    				BANK_ACCOUNT_NO			: gfn_nvl(item.BANK_ACCOUNT_NO),
		    				BANK_ACCOUNT_OWNER		: gfn_nvl(item.BANK_ACCOUNT_OWNER),
		    				NOTE_TYPE				: gfn_nvl(item.NOTE_TYPE),
		    				BTB_CODE				: gfn_nvl(item.BTB_CODE),
		    				CMS_CODE				: gfn_nvl(item.CMS_CODE),
		    				PAYER_SWIFT_BIC			: gfn_nvl(item.PAYER_SWIFT_BIC),
		    				PAYER_BANK_INFO			: gfn_nvl(item.PAYER_BANK_INFO),
		    				PAY_REASON				: gfn_nvl(item.PAY_REASON),
		    				SEND_REASON				: gfn_nvl(item.SEND_REASON),
		    				FEE_CHARGER				: gfn_nvl(item.FEE_CHARGER),
		    				CURRENCY_CODE			: gfn_nvl(item.CURRENCY_CODE),
		    				EFFECT_START_DATE		: gfn_nvl(item.EFFECT_START_DATE),
		    				EFFECT_END_DATE			: gfn_nvl(item.EFFECT_END_DATE),
		    				VAT_ACCOUNT_YN			: gfn_nvl(item.VAT_ACCOUNT_YN),
		    				FIRM_PAYEE_DATE			: gfn_nvl(item.FIRM_PAYEE_DATE),
		    				FIRM_PAYEE_TRF_NO		: gfn_nvl(item.FIRM_PAYEE_TRF_NO),
		    				RESULT_CODE				: gfn_nvl(item.RESULT_CODE),
		    				RESULT_NAME				: gfn_nvl(item.RESULT_NAME),
		    				DESCRIPTION				: gfn_nvl(item.DESCRIPTION)
		    		}
		    		jsonFinanceList.push(cv3_data);
		    	});
	    	   	financeGrid.rebuild();
	    	   	
	    		if(data.cv_4.length > 0) {
		    	   	//주소 ~ 매핑이력 - 구매정보
		    	   	SBUxMethod.set("TAX_SEND", 					gfn_nvl(cv_4.TAX_SEND));
		    	   	SBUxMethod.set("INTERNAL_PAY_RULE_YN", 		gfn_nvl(cv_4.INTERNAL_PAY_RULE_YN));
		    	   	SBUxMethod.set("RCPT_CHK_RANGE", 			gfn_nvl(cv_4.RCPT_CHK_RANGE));
		    	   	SBUxMethod.set("AP_ACC_CODE", 				gfn_nvl(cv_4.AP_ACC_CODE));
		    	   	SBUxMethod.set("AP_ACC_NAME", 				gfn_nvl(cv_4.AP_ACC_NAME));
		    	   	SBUxMethod.set("AP_CLR_ACC", 				gfn_nvl(cv_4.AP_CLR_ACC));
		    	   	SBUxMethod.set("AP_CLR_ACC_NAME", 			gfn_nvl(cv_4.AP_CLR_ACC_NAME));
		    	   	SBUxMethod.set("AP_ACC_CODE_FOREIGN", 		gfn_nvl(cv_4.AP_ACC_CODE_FOREIGN));
		    	   	SBUxMethod.set("AP_ACC_NAME_FOREIGN", 		gfn_nvl(cv_4.AP_ACC_NAME_FOREIGN));
		    	   	SBUxMethod.set("PREPAY_ACC_CODE", 			gfn_nvl(cv_4.PREPAY_ACC_CODE));
		    	   	SBUxMethod.set("PREPAY_ACC_NAME", 			gfn_nvl(cv_4.PREPAY_ACC_NAME));
		        	gfnma_multiSelectSet("#TAX_CODE", 			"VAT_CODE", 		"VAT_NAME",		gfn_nvl(cv_4.TAX_CODE));
		        	gfnma_multiSelectSet("#PUR_HANDOV_CNDT_CD", "SUB_CODE", 		"CODE_NAME",	gfn_nvl(cv_4.PUR_HANDOV_CNDT_CD));
		        	gfnma_multiSelectSet("#PAY_DATE_RULE", 		"PAY_TERM_CODE", 	"PAY_TERM_NAME",gfn_nvl(cv_4.PAY_DATE_RULE));
	    		}
	    	   	
	        	data.cv_11.forEach((item, index) => {
		    		const cv11_data = {
		    				PUR_CONTACT_TYPE	: gfn_nvl(item.PUR_CONTACT_TYPE),
		    				PUR_DEPT_NAME		: gfn_nvl(item.PUR_DEPT_NAME),
		    				PUR_CONTACT_NAME	: gfn_nvl(item.PUR_CONTACT_NAME),
		    				PUR_CONTACT_TEL		: gfn_nvl(item.PUR_CONTACT_TEL),
		    				PUR_CONTACT_MOBILE	: gfn_nvl(item.PUR_CONTACT_MOBILE),
		    				PUR_CONTACT_EMAIL	: gfn_nvl(item.PUR_CONTACT_EMAIL),
		    				PUR_CONTACT_FAX		: gfn_nvl(item.PUR_CONTACT_FAX),
		    				PUR_ADDRESS			: gfn_nvl(item.PUR_ADDRESS)
		    		}
		    		jsonPurchaseList.push(cv11_data);
		    	});
	        	purchaseGrid.rebuild();
	    	
	    		if(data.cv_5.length > 0) {
		        	//주소 ~ 매핑이력 - 판매정보
		        	SBUxMethod.set("SALES_TAX_SEND", 				gfn_nvl(cv_4.SALES_TAX_SEND));
		        	gfnma_multiSelectSet("#DELIVERY_TYPE", 			"SUB_CODE", 		"CODE_NAME",		gfn_nvl(cv_5.DELIVERY_TYPE));
		        	gfnma_multiSelectSet("#RECEIPT_DATE_RULE", 		"SUB_CODE", 		"CODE_NAME",		gfn_nvl(cv_5.RECEIPT_DATE_RULE));
		        	gfnma_multiSelectSet("#VAT_ISSUE_COND", 		"SUB_CODE", 		"CODE_NAME",		gfn_nvl(cv_5.VAT_ISSUE_COND));
		        	gfnma_multiSelectSet("#SHIPPING_TYPE", 			"SUB_CODE", 		"CODE_NAME",		gfn_nvl(cv_5.SHIPPING_TYPE));
	    		}
	    	   	
	        	data.cv_12.forEach((item, index) => {
		    		const cv12_data = {
		    				SALE_CONTACT_TYPE		: gfn_nvl(item.SALE_CONTACT_TYPE),
		    				SALE_DEPT_NAME			: gfn_nvl(item.SALE_DEPT_NAME),
		    				SALE_CONTACT_NAME		: gfn_nvl(item.SALE_CONTACT_NAME),
		    				SALE_CONTACT_TEL		: gfn_nvl(item.SALE_CONTACT_TEL),
		    				SALE_CONTACT_MOBILE		: gfn_nvl(item.SALE_CONTACT_MOBILE),
		    				SALE_CONTACT_EMAIL		: gfn_nvl(item.SALE_CONTACT_EMAIL),
		    				SALE_CONTACT_FAX		: gfn_nvl(item.SALE_CONTACT_FAX),
		    				SALE_ADDRESS			: gfn_nvl(item.SALE_ADDRESS)
		    		}
		    		jsonSalesList.push(cv12_data);
		    	});
	        	salesGrid.rebuild();
	        	
	        	//주소 ~ 매핑이력 - 판매납품처
	        	data.cv_6.forEach((item, index) => {
		    		const cv6_data = {
		    				SHIP_TO_CODE		: gfn_nvl(item.SHIP_TO_CODE),
		    				SHIP_TO_NAME		: gfn_nvl(item.SHIP_TO_NAME),
		    				ZIP_CODE			: gfn_nvl(item.ZIP_CODE),
		    				ADDRESS				: gfn_nvl(item.ADDRESS),
		    				SHIP_TO_TEL			: gfn_nvl(item.SHIP_TO_TEL),
		    				CREDIT_AREA			: gfn_nvl(item.CREDIT_AREA),
		    				SALES_PERSON_NAME	: gfn_nvl(item.SALES_PERSON_NAME),
		    				DEST_CD				: gfn_nvl(item.DEST_CD),
		    				DEST_NM				: gfn_nvl(item.DEST_NM),
		    				SHIP_ORD_CODE		: gfn_nvl(item.SHIP_ORD_CODE)
		    		}
		    		jsonSalesShipToList.push(cv5_data);
		    	});
	        	salesShipToGrid.rebuild();
	        	
	        	if(data.cv_7.length > 0) {
		        	//주소 ~ 매핑이력 - 판매처분류
		        	SBUxMethod.set("AR_ACC_CODE",				gfn_nvl(cv_7.AR_ACC_CODE));
		        	SBUxMethod.set("AR_ACC_NAME",				gfn_nvl(cv_7.AR_ACC_NAME));
		        	SBUxMethod.set("AR_ACC_CODE_FOREIGN",		gfn_nvl(cv_7.AR_ACC_CODE_FOREIGN));
		        	SBUxMethod.set("AR_ACC_NAME_FOREIGN",		gfn_nvl(cv_7.AR_ACC_NAME_FOREIGN));
		        	SBUxMethod.set("ADVANCE_ACC_CODE",			gfn_nvl(cv_7.ADVANCE_ACC_CODE));
		        	SBUxMethod.set("ADVANCE_ACC_NAME",			gfn_nvl(cv_7.ADVANCE_ACC_NAME));
	        	}
	        	data.cv_13.forEach((item, index) => {
		    		const cv13_data = {
		    				CREDIT_AREA			: gfn_nvl(item.CREDIT_AREA),
		    				CS_CATEGORY_GROUP	: gfn_nvl(item.CS_CATEGORY_GROUP),
		    				CS_CATEGORY1		: gfn_nvl(item.CS_CATEGORY1),
		    				CS_CATEGORY2		: gfn_nvl(item.CS_CATEGORY2),
		    				CS_CATEGORY3		: gfn_nvl(item.CS_CATEGORY3),
		    				CS_CATEGORY4		: gfn_nvl(item.CS_CATEGORY4),
		    				CS_CATEGORY5		: gfn_nvl(item.CS_CATEGORY5),
		    				CS_CATEGORY6		: gfn_nvl(item.CS_CATEGORY6),
		    				CS_CATEGORY7		: gfn_nvl(item.CS_CATEGORY7),
		    				CS_CATEGORY8		: gfn_nvl(item.CS_CATEGORY8),
		    				CS_CATEGORY9		: gfn_nvl(item.CS_CATEGORY9),
		    				CS_CATEGORY10		: gfn_nvl(item.CS_CATEGORY10)
		    		}
		    		jsonSalesCategoryList.push(cv13_data);
		    	});
	        	salesCategoryGrid.rebuild();
	        	
	        	//주소 ~ 매핑이력 - 세금 등
	        	if(data.cv_8.length > 0) {
		        	SBUxMethod.set("WITHHOLD_TAX_YN",	gfn_nvl(cv_8.WITHHOLD_TAX_YN));
		        	SBUxMethod.set("TAX_RATE",			gfn_nvl(cv_8.TAX_RATE));
		        	gfnma_multiSelectSet("#WITHHOLD_TAX_OFFICE", 	"SUB_CODE", "CODE_NAME", gfn_nvl(cv_8.WITHHOLD_TAX_OFFICE));
		        	gfnma_multiSelectSet("#WITHHOLD_TAX_OFFICE2", 	"SUB_CODE", "CODE_NAME", gfn_nvl(cv_8.WITHHOLD_TAX_OFFICE2));
		        	gfnma_multiSelectSet("#WITHHOLD_TAX_TYPE", 		"SUB_CODE", "CODE_NAME", gfn_nvl(cv_8.WITHHOLD_TAX_TYPE));
	        	}
	        	
	        	//주소 ~ 매핑이력 - 변경이력관리
	        	data.cv_9.forEach((item, index) => {
		    		const cv9_data = {
		    				START_DATE		: gfn_nvl(item.START_DATE),
		    				END_DATE		: gfn_nvl(item.END_DATE),
		    				BIZ_REGNO		: gfn_nvl(item.BIZ_REGNO),
		    				BIZ_ITEMS		: gfn_nvl(item.BIZ_ITEMS),
		    				CHIEF_NAME		: gfn_nvl(item.CHIEF_NAME)
		    		}
		    		jsonHistoryList.push(cv9_data);
		    	});
	        	historyGrid.rebuild();
	        	
	        	//주소 ~ 매핑이력 - 매핑이력
	        	data.cv_10.forEach((item, index) => {
		    		const cv10_data = {
		    				MAP_TYPE		: gfn_nvl(item.MAP_TYPE),
		    				ASIS_CS_CODE	: gfn_nvl(item.ASIS_CS_CODE),
		    				CS_CODE			: gfn_nvl(item.CS_CODE),
		    				CS_NAME			: gfn_nvl(item.CS_NAME),
		    				BIZ_REGNO		: gfn_nvl(item.BIZ_REGNO)
		    		}
		    		jsonMappingList.push(cv10_data);
		    	});
	        	mappingGrid.rebuild();
	        	
				const obj = data.cv_1[0]
				if(obj.PURCHASE_YN == 'Y'){
					SBUxMethod.enableTab('tabFinance');
					SBUxMethod.enableTab('tabPurchase');
				}else{
					SBUxMethod.disableTab('tabFinance');
					SBUxMethod.disableTab('tabPurchase');
				}
				
				if(obj.SALE_YN == 'Y'){
					SBUxMethod.enableTab('tabSales');
					SBUxMethod.enableTab('tabSalesShipTo');
					SBUxMethod.enableTab('tabSalesCategory');
				}else{
					SBUxMethod.disableTab('tabSales');
					SBUxMethod.disableTab('tabSalesShipTo');
					SBUxMethod.disableTab('tabSalesCategory');
				}
				
	    		if(obj.RESIDENT_YN == 'Y'){
	    			if(obj.CS_GROUP != '6000'){
		    			$('#CHIEF_SOCIALNO').addClass('inpt_data_reqed');
	    			}
				}else{
	    			$('#CHIEF_SOCIALNO').removeClass('inpt_data_reqed');
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
    const fn_event = async function() {
    	
    	$('#idxTab_detail').click(function(){
    		var tabID = SBUxMethod.get('idxTab_detail');
    	})
    	
    	//매입처여부 체크박스
    	$('#PURCHASE_YN').change(function(){
   			SBUxMethod.setTab('idxTab_detail', 'tabAddress');
    		if($(this).val() == 'Y'){
				SBUxMethod.enableTab('tabFinance');
				SBUxMethod.enableTab('tabPurchase');
			}else{
				SBUxMethod.disableTab('tabFinance');
				SBUxMethod.disableTab('tabPurchase');
			}
    	}) 
    	//매출처여부 체크박스
    	$('#SALE_YN').change(function(){
    		SBUxMethod.setTab('idxTab_detail', 'tabAddress');
    		if($(this).val() == 'Y'){
				SBUxMethod.enableTab('tabSales');
				SBUxMethod.enableTab('tabSalesShipTo');
				SBUxMethod.enableTab('tabSalesCategory');
			}else{
				SBUxMethod.disableTab('tabSales');
				SBUxMethod.disableTab('tabSalesShipTo');
				SBUxMethod.disableTab('tabSalesCategory');
			}
		})
    	//주민분여부 체크박스
    	$('#RESIDENT_YN').change(function(){
    		if($(this).val() == 'Y'){
    			if(gfnma_multiSelectGet('#CS_GROUP' != '6000')){
	    			$('#CHIEF_SOCIALNO').addClass('inpt_data_reqed');
    			}
			}else{
    			$('#CHIEF_SOCIALNO').removeClass('inpt_data_reqed');
			}
		})
		//법인구분 라디오 버튼
    	$('#rdotd').change(function(){
    		//법인
    		if(SBUxMethod.get('BIZ_TYPE') == 'C'){
    			SBUxMethod.attr('COMP_REGNO', 'readonly', 'false');
    			$('#COM_TYPE').prop('disabled', false);
    		//개인
    		}else if(SBUxMethod.get('BIZ_TYPE') == 'P'){
    			SBUxMethod.set('COMP_REGNO', '');
    			SBUxMethod.attr('COMP_REGNO', 'readonly', 'true');
    			gfnma_multiSelectSet("#COM_TYPE", "", "", "");
    			$('#COM_TYPE').prop('disabled', true);
    		}
    	})
    	
    	$('#SRCH_DELETE_YN').change(function(){
    		if(SBUxMethod.get('SRCH_DELETE_YN') == ''){
    			return;
    			
			}else if(SBUxMethod.get('SRCH_DELETE_YN') == 'Y'){
				SBUxMethod.set('SRCH_USE_YN1', '');
				SBUxMethod.set('SRCH_USE_YN2', '');
			}else if(SBUxMethod.get('SRCH_DELETE_YN') == 'N'){
				SBUxMethod.set('SRCH_USE_YN1', 'Y');
				SBUxMethod.set('SRCH_USE_YN2', 'N');
			}
		})
    	
    	$('#OSP_YN1').change(function(){
    		if(SBUxMethod.get('OSP_YN1').OSP_YN1 == 'Y'){
    			SBUxMethod.set('OSP_YN', 'Y');
			}else{
				if(SBUxMethod.get('OSP_YN2').OSP_YN2 == 'N' && SBUxMethod.get('OSP_YN3').OSP_YN3 == 'N'){
	    			SBUxMethod.set('OSP_YN', 'N');
				}
			}
		})
    	$('#OSP_YN2').change(function(){
    		if(SBUxMethod.get('OSP_YN2').OSP_YN2 == 'Y'){
    			SBUxMethod.set('OSP_YN', 'Y');
			}else{
				if(SBUxMethod.get('OSP_YN1').OSP_YN1 == 'N' && SBUxMethod.get('OSP_YN3').OSP_YN3 == 'N'){
	    			SBUxMethod.set('OSP_YN', 'N');
				}
			}
		})
    	$('#OSP_YN3').change(function(){
    		if(SBUxMethod.get('OSP_YN3').OSP_YN3 == 'Y'){
    			SBUxMethod.set('OSP_YN', 'Y');
			}else{
				if(SBUxMethod.get('OSP_YN1').OSP_YN1 == 'N' && SBUxMethod.get('OSP_YN2').OSP_YN2 == 'N'){
	    			SBUxMethod.set('OSP_YN', 'N');
				}
			}
		})
		
		$("#TD_CS_GROUP > div > div > table > tbody > tr").click(function(){
            const CS_GROUP = gfnma_multiSelectGet('#CS_GROUP');
            if(CS_GROUP == ''){
            	return;
            }
            
            let ADVANCE_ACC_CODE = '';
            let ADVANCE_ACC_NAME = '';
            let AP_ACC_CODE = '';
            let AP_ACC_CODE_FOREIGN = '';
            let AP_ACC_NAME = '';
            let AP_ACC_NAME_FOREIGN = '';
            let AR_ACC_CODE = '';
            let AR_ACC_CODE_FOREIGN = '';
            let AR_ACC_NAME = '';
            let AR_ACC_NAME_FOREIGN = '';
            let CODE_NAME = '';
            let EXTRA_FIELD2 = '';
            let EXTRA_FIELD3 = '';
            let NATION_CODE = '';
            let PAY_DATE_RULE = '';
            let PREPAY_ACC_CODE = '';
            let PREPAY_ACC_NAME = '';
            let CS_CODE = gfn_nvl(SBUxMethod.get('CS_CODE'));
            let USE_YN = gfn_nvl(SBUxMethod.get('USE_YN').USE_YN);

            for(var i=0; jsonCOM011.length > i; i++){
            	if(CS_GROUP == jsonCOM011[i].SUB_CODE){
            		ADVANCE_ACC_CODE = gfn_nvl(jsonCOM011[i].ADVANCE_ACC_CODE);
            		ADVANCE_ACC_NAME = gfn_nvl(jsonCOM011[i].ADVANCE_ACC_NAME);
            		AP_ACC_CODE = gfn_nvl(jsonCOM011[i].AP_ACC_CODE);
            		AP_ACC_CODE_FOREIGN = gfn_nvl(jsonCOM011[i].AP_ACC_CODE_FOREIGN);
            		AP_ACC_NAME = gfn_nvl(jsonCOM011[i].AP_ACC_NAME);
            		AP_ACC_NAME_FOREIGN = gfn_nvl(jsonCOM011[i].AP_ACC_NAME_FOREIGN);
            		AR_ACC_CODE = gfn_nvl(jsonCOM011[i].AR_ACC_CODE);
            		AR_ACC_CODE_FOREIGN = gfn_nvl(jsonCOM011[i].AR_ACC_CODE_FOREIGN);
            		AR_ACC_NAME = gfn_nvl(jsonCOM011[i].AR_ACC_NAME);
            		AR_ACC_NAME_FOREIGN = gfn_nvl(jsonCOM011[i].AR_ACC_NAME_FOREIGN);
            		CODE_NAME = gfn_nvl(jsonCOM011[i].CODE_NAME);
            		EXTRA_FIELD2 = gfn_nvl(jsonCOM011[i].EXTRA_FIELD2);
            		EXTRA_FIELD3 = gfn_nvl(jsonCOM011[i].EXTRA_FIELD3);
            		NATION_CODE = gfn_nvl(jsonCOM011[i].NATION_CODE);
            		PAY_DATE_RULE = gfn_nvl(jsonCOM011[i].PAY_DATE_RULE);
            		PREPAY_ACC_CODE = gfn_nvl(jsonCOM011[i].PREPAY_ACC_CODE);
            		PREPAY_ACC_NAME = gfn_nvl(jsonCOM011[i].PREPAY_ACC_NAME);
            	}
            }
            
            if(EXTRA_FIELD2 == "N" || EXTRA_FIELD2 == ""){
                SBUxMethod.set('FOREIGN_YN', 'N');
   		 		gfnma_multiSelectInit({
   					target			: ['#REGION_CODE']
   					,compCode		: gv_ma_selectedCorpCd
   					,clientCode		: gv_ma_selectedClntCd
   					,bizcompId		: 'L_COM003'
   					,whereClause	: ''
   					,formId			: p_formId
   					,menuId			: p_menuId
   					,selectValue	: ''
   					,dropType		: 'down' 	// up, down
   					,dropAlign		: 'left' 	// left, right
   					,colValue		: 'SUB_CODE'
   					,colLabel		: 'CODE_NAME'
   					,columns		:[
   			            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  		style:'text-align:left'},
   			            {caption: "지역(국내)",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
   					]
   		 		});
            }else{
            	SBUxMethod.set('FOREIGN_YN', EXTRA_FIELD2);
		 		gfnma_multiSelectInit({
					target			: ['#REGION_CODE']
					,compCode		: gv_ma_selectedCorpCd
					,clientCode		: gv_ma_selectedClntCd
					,bizcompId		: 'L_COM002'
					,whereClause	: ''
					,formId			: p_formId
					,menuId			: p_menuId
					,selectValue	: ''
					,dropType		: 'down' 	// up, down
					,dropAlign		: 'left' 	// left, right
					,colValue		: 'SUB_CODE'
					,colLabel		: 'CODE_NAME'
					,columns		:[
			            {caption: "코드",		ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
			            {caption: "지역(글로벌)",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
					]
				});
            }
            
            if(SBUxMethod.get('FOREIGN_YN').FOREIGN_YN == "Y"){ 
				$('#CHIEF_NAME').removeClass('inpt_data_reqed');
            }else{
                if(CS_GROUP == "4000" || CS_GROUP == "5000" || CS_GROUP == "6000" || CS_GROUP == "6100" || CS_GROUP == "7000" || CS_GROUP == "9000"){
                    $('#CHIEF_NAME').removeClass('inpt_data_reqed');
                }else{
	    			$('#CHIEF_SOCIALNO').addClass('inpt_data_reqed');
                }
            }
            
            if(CS_GROUP == "1000" || CS_GROUP == "2000" || CS_GROUP == "4000"){
                $('#BIZ_CATEGORY').addClass('inpt_data_reqed');
                $('#BIZ_ITEMS').addClass('inpt_data_reqed');
            }else{
                $('#BIZ_CATEGORY').removeClass('inpt_data_reqed');
                $('#BIZ_ITEMS').removeClass('inpt_data_reqed');
            }
            
            if(AP_ACC_CODE != ''){
            	SBUxMethod.set('AP_ACC_CODE', AP_ACC_CODE);
            	SBUxMethod.set('AP_ACC_NAME', AP_ACC_NAME);
            }
            if(AP_ACC_CODE_FOREIGN != ''){
            	SBUxMethod.set('AP_ACC_CODE_FOREIGN', AP_ACC_CODE_FOREIGN);
            	SBUxMethod.set('AP_ACC_NAME_FOREIGN', AP_ACC_NAME_FOREIGN);
            }
            if(PREPAY_ACC_CODE != ''){
            	SBUxMethod.set('PREPAY_ACC_CODE', PREPAY_ACC_CODE);
            	SBUxMethod.set('PREPAY_ACC_NAME', PREPAY_ACC_NAME);
            }
            if(AR_ACC_CODE != ''){
            	SBUxMethod.set('AR_ACC_CODE', AR_ACC_CODE);
            	SBUxMethod.set('AR_ACC_NAME', AR_ACC_NAME);
            }
            if(AR_ACC_CODE_FOREIGN != ''){
            	SBUxMethod.set('AR_ACC_CODE_FOREIGN', AR_ACC_CODE_FOREIGN);
            	SBUxMethod.set('AR_ACC_NAME_FOREIGN', AR_ACC_NAME_FOREIGN);
            }
            if(ADVANCE_ACC_CODE != ''){
            	SBUxMethod.set('ADVANCE_ACC_CODE', ADVANCE_ACC_CODE);
            	SBUxMethod.set('ADVANCE_ACC_NAME', ADVANCE_ACC_NAME);
            }
            if(NATION_CODE != ''){
            	gfnma_multiSelectSet("#NATION_CODE", "NATION_CODE", "NATION_NAME", 	NATION_CODE);
            	if(NATION_CODE == 'KOR'){
	            	gfnma_multiSelectSet("#NATION_CODE", "NATION_CODE", "NATION_NAME", 	'KRW');
            	}
            }
            
            if(CS_CODE == ""){
            	gfnma_multiSelectSet("#PAY_DATE_RULE", "PAY_TERM_CODE", "PAY_TERM_NAME", PAY_DATE_RULE);
            }
            
            if(CS_GROUP == "6000" || CS_GROUP == "6100" || CS_GROUP == "7000"){
            	if(USE_YN == "Y"){
            		 if(CS_GROUP == "6000" || CS_GROUP == "6100"){
	            		$('#EMP_TH').show();
	            		$('#EMP_TD').show();
	            		$('#EMP_BTN').show();
	            	}
            	}
            }else{
        		$('#EMP_TH').hide();
        		$('#EMP_TD').hide();
        		$('#EMP_BTN').hide();
        		
                $('#BIZ_CATEGORY').removeClass('inpt_data_reqed');
                $('#BIZ_ITEMS').removeClass('inpt_data_reqed');
            }
            if(gfnma_multiSelectGet('#STATUS_CODE') == '5'){
            	$('#btnSubmit').show();
            }else{
            	$('#btnSubmit').hide();
            }
		})
		
		$('#FOREIGN_YN').change(function(){
			if($(this).val() == 'Y'){
		 		gfnma_multiSelectInit({
					target			: ['#REGION_CODE']
					,compCode		: gv_ma_selectedCorpCd
					,clientCode		: gv_ma_selectedClntCd
					,bizcompId		: 'L_COM002'
					,whereClause	: ''
					,formId			: p_formId
					,menuId			: p_menuId
					,selectValue	: ''
					,dropType		: 'down' 	// up, down
					,dropAlign		: 'left' 	// left, right
					,colValue		: 'SUB_CODE'
					,colLabel		: 'CODE_NAME'
					,columns		:[
			            {caption: "코드",		ref: 'SUB_CODE', 		width:'100px',  	style:'text-align:left'},
			            {caption: "지역(글로벌)",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
					]
				});
			}else{
		 		gfnma_multiSelectInit({
					target			: ['#REGION_CODE']
					,compCode		: gv_ma_selectedCorpCd
					,clientCode		: gv_ma_selectedClntCd
					,bizcompId		: 'L_COM003'
					,whereClause	: ''
					,formId			: p_formId
					,menuId			: p_menuId
					,selectValue	: ''
					,dropType		: 'down' 	// up, down
					,dropAlign		: 'left' 	// left, right
					,colValue		: 'SUB_CODE'
					,colLabel		: 'CODE_NAME'
					,columns		:[
			            {caption: "코드",	ref: 'SUB_CODE', 		width:'100px',  		style:'text-align:left'},
			            {caption: "지역(국내)",	ref: 'CODE_NAME',    	width:'150px',  	style:'text-align:left'}
					]
		 		});
			}
		});
		
		$('#DEFER_YN').change(function(){
			if($(this).val() == 'Y'){
                $('#DEFER_REASON').addClass('inpt_data_reqed');
			}else{
                $('#DEFER_REASON').removeClass('inpt_data_reqed');
			}
		});
		
		$('#TXN_STOP_YN').change(function(){
			fn_changeTXN_STOP_YN($(this).val());
		});
    }
    
    const fn_changeTXN_STOP_YN = async function(val){
		if(val == 'Y'){
            $('#TXN_STOP_REASON').addClass('inpt_data_reqed');
            $('#TXN_STOP_DATE').addClass('inpt_data_reqed');
            $('#TXN_STOP_REASON').prop('disabled', false);
            SBUxMethod.attr('TXN_STOP_DATE','disabled','false');
		}else{
            $('#TXN_STOP_REASON').removeClass('inpt_data_reqed');
            $('#TXN_STOP_DATE').removeClass('inpt_data_reqed');
            $('#TXN_STOP_REASON').prop('disabled', true);
            SBUxMethod.attr('TXN_STOP_DATE','disabled','true');
            gfnma_multiSelectSet("#TXN_STOP_REASON", "", "", "");
            SBUxMethod.set('TXN_STOP_DATE','');
		}
    }
    
    /**
     * @name fn_clearForm
     * @description 그리드 및 화면 초기화
     * @param 
     */
    const fn_clearForm = async function() {
    	//거래처 리스트 
    	jsonMasterList = [];
    }
    
    /**
     * @name fn_clearSubForm
     * @description 거래처 기본정보 편집, 주소 ~ 매핑이력 화면 초기화
     * @param 
     */
    const fn_clearSubForm = async function() {
    	
        jsonFinanceList			= [];
        jsonPurchaseList		= [];
        jsonSalesList			= [];
        jsonSalesShipToList		= [];
        jsonSalesCategoryList	= []; 
        jsonHistoryList			= []; 
        jsonMappingList			= []; 
    	
    	//거래처 기본정보 편집
    	SBUxMethod.set("BIZ_REGNO",					"");
    	SBUxMethod.set("CS_CODE",					"");
    	SBUxMethod.set("CS_ABBR_NAME",		 		"");
    	SBUxMethod.set("REF_CS_CODE",				"");
    	SBUxMethod.set("CS_NAME",					"");
    	SBUxMethod.set("CS_FULLNAME",				"");
    	SBUxMethod.set("CS_NAME_ENG",				"");
    	SBUxMethod.set("BANK_NO_H",					"");
    	SBUxMethod.set("BANK_NAME_H",				"");
    	SBUxMethod.set("COMP_REGNO",				"");
    	SBUxMethod.set("BIZ_REGNO",					"");
    	SBUxMethod.set("SUB_NO",					"");
    	SBUxMethod.set("CHIEF_NAME",				"");
    	SBUxMethod.set("CHIEF_SOCIALNO",			"");
    	SBUxMethod.set("BIZ_CATEGORY",				"");
    	SBUxMethod.set("BIZ_ITEMS",					"");
    	SBUxMethod.set("TXN_STOP_DATE",				"");
    	//주소 ~ 매핑이력 - 주소/연락처 탭
    	SBUxMethod.set("ZIP_CODE",					"");
    	SBUxMethod.set("START_DATE",				"");
    	SBUxMethod.set("END_DATE",					"");
    	SBUxMethod.set("ADDRESS",					"");
    	SBUxMethod.set("TEL",						"");
    	SBUxMethod.set("FAX",						"");
    	SBUxMethod.set("EMAIL_ID",					"");
    	SBUxMethod.set("WEB_URL",					"");
    	SBUxMethod.set("RESULT1",					"");
    	SBUxMethod.set("MEMO",						"");
    	SBUxMethod.set("SAP_CUSTOMER_CODE",			"");
    	SBUxMethod.set("SAP_VENDOR_CODE",			"");
    	//주소 ~ 매핑이력 - 구매정보
    	SBUxMethod.set("AP_ACC_CODE",				"");
    	SBUxMethod.set("AP_ACC_NAME",				"");
    	SBUxMethod.set("AP_CLR_ACC",				"");
    	SBUxMethod.set("AP_CLR_ACC_NAME",			"");
    	SBUxMethod.set("AP_ACC_CODE_FOREIGN",		"");
    	SBUxMethod.set("AP_ACC_NAME_FOREIGN",		"");
    	SBUxMethod.set("PREPAY_ACC_CODE",			"");
    	SBUxMethod.set("PREPAY_ACC_NAME",			"");
    	SBUxMethod.set("RCPT_CHK_RANGE",			"");
    	//주소 ~ 매핑이력 - 구매정보
    	SBUxMethod.set("AR_ACC_CODE",				"");
    	SBUxMethod.set("AR_ACC_NAME",				"");
    	SBUxMethod.set("AR_ACC_CODE_FOREIGN",		"");
    	SBUxMethod.set("AR_ACC_NAME_FOREIGN",		"");
    	SBUxMethod.set("ADVANCE_ACC_CODE",			"");
    	SBUxMethod.set("ADVANCE_ACC_NAME",			"");
    	
    	SBUxMethod.set("USE_YN", 					"N");
    	SBUxMethod.set("FOREIGN_YN", 				"N");
    	SBUxMethod.set("PURCHASE_YN", 				"N");
    	SBUxMethod.set("SALE_YN", 					"N");
    	SBUxMethod.set("RESIDENT_YN", 				"N");
    	SBUxMethod.set("OSP_YN", 					"N");
    	SBUxMethod.set("OSP_YN1", 					"N");
    	SBUxMethod.set("OSP_YN2", 					"N");
    	SBUxMethod.set("OSP_YN3", 					"N");
    	SBUxMethod.set("SHIPPING_YN", 				"N");
    	SBUxMethod.set("TRANSPORT_YN", 				"N");
    	SBUxMethod.set("CARGO_YN", 					"N");
    	SBUxMethod.set("STEEL_SCRAP_PAY_YN", 		"N");
    	SBUxMethod.set("BANKRUPTCY_YN", 			"N");
    	SBUxMethod.set("EXPECTED_CUSTOMER_YN", 		"N");
    	SBUxMethod.set("DEFER_YN", 					"N");
    	SBUxMethod.set("TXN_STOP_YN",				"N");
    	fn_changeTXN_STOP_YN("N");
    	SBUxMethod.set("TAX_SEND", 					"N");
    	SBUxMethod.set("INTERNAL_PAY_RULE_YN",		"N");
    	SBUxMethod.set("LIQUOR_YN", 				"N");
    	SBUxMethod.set("WITHHOLD_TAX_YN", 			"N");
    	SBUxMethod.set("SALES_TAX_SEND", 			"N");

    	gfnma_multiSelectSet("#CS_GROUP", 				"", "", "");
    	gfnma_multiSelectSet("#NATION_CODE", 			"", "", "");
    	gfnma_multiSelectSet("#REGION_CODE", 			"", "", "");
    	gfnma_multiSelectSet("#CURRENCY_CODE", 			"", "", "");
    	gfnma_multiSelectSet("#COM_TYPE", 				"", "", "");
    	gfnma_multiSelectSet("#TAX_TYPE", 				"", "", "");
    	gfnma_multiSelectSet("#CS_CATEGORY",			"", "", "");
    	gfnma_multiSelectSet("#DEFER_REASON",			"", "", "");
    	gfnma_multiSelectSet("#STATUS_CODE",			"", "", "");
    	gfnma_multiSelectSet("#TXN_STOP_REASON",		"", "", "");
    	
    	gfnma_multiSelectSet("#TAX_CODE",				"", "", "");
    	gfnma_multiSelectSet("#SLIP_CLS",				"", "", "");
    	gfnma_multiSelectSet("#PAY_DATE_RULE",			"", "", "");
    	gfnma_multiSelectSet("#PUR_HANDOV_CNDT_CD",		"", "", "");
    	gfnma_multiSelectSet("#DELIVERY_TYPE",			"",	"", "");
    	gfnma_multiSelectSet("#RECEIPT_DATE_RULE",		"", "", "");
    	gfnma_multiSelectSet("#VAT_ISSUE_COND",			"", "", "");
    	gfnma_multiSelectSet("#SHIPPING_TYPE",			"", "", "");
    	gfnma_multiSelectSet("#WITHHOLD_TAX_OFFICE",	"", "", "");
    	gfnma_multiSelectSet("#WITHHOLD_TAX_OFFICE2",	"", "", "");
    	gfnma_multiSelectSet("#WITHHOLD_TAX_TYPE",		"", "", "");
    	
    	
    }
    
    //기본정보, 관리항목 탭 내역 저장
    const fn_delete = async function() {
  	    var paramObj = {
       		    V_P_DEBUG_MODE_YN        : ""
   			   ,V_P_LANG_ID              : ""
   			   ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
   			   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
			   ///////////////////////////////////////////////////////////////////////////
			   ,IV_P_CS_CODE             : gfn_nvl(SBUxMethod.get("CS_CODE"))
			   ,V_P_CS_NAME              : gfn_nvl(SBUxMethod.get("CS_NAME"))
			   ,V_P_CS_FULLNAME          : gfn_nvl(SBUxMethod.get("CS_FULLNAME"))
			   ,V_P_CS_ABBR_NAME         : gfn_nvl(SBUxMethod.get("CS_ABBR_NAME"))
			   ,V_P_CS_NAME_ENG          : gfn_nvl(SBUxMethod.get("CS_NAME_ENG"))
			   ,V_P_CS_GROUP             : gfnma_multiSelectGet("#CS_GROUP")
			   ,V_P_BANK_NO              : gfn_nvl(SBUxMethod.get("BANK_NO"))
			   ,IV_P_FOREIGN_YN          : gfn_nvl(SBUxMethod.get("FOREIGN_YN").FOREIGN_YN)
			   ,V_P_NATION_CODE          : gfnma_multiSelectGet("#NATION_CODE")
			   ,V_P_REGION_CODE          : gfnma_multiSelectGet("#REGION_CODE")
			   ,V_P_BIZ_REGNO            : gfn_nvl(SBUxMethod.get("BIZ_REGNO")).replaceAll('-', '')
			   ,V_P_TAX_TYPE             : gfnma_multiSelectGet("#TAX_TYPE")
			   ,V_P_COM_TYPE             : gfnma_multiSelectGet("#COM_TYPE")
			   ,V_P_BIZ_TYPE             : gfn_nvl(SBUxMethod.get("BIZ_TYPE"))
			   ,V_P_COMP_REGNO           : gfn_nvl(SBUxMethod.get("COMP_REGNO")).replaceAll('-', '')
			   ,V_P_CHIEF_NAME           : gfn_nvl(SBUxMethod.get("CHIEF_NAME"))
			   ,V_P_CHIEF_SOCIALNO       : gfn_nvl(SBUxMethod.get("CHIEF_SOCIALNO")).replaceAll('-', '')
			   ,V_P_RESIDENT_YN          : gfn_nvl(SBUxMethod.get("RESIDENT_YN").RESIDENT_YN)
			   ,V_P_BIZ_CATEGORY         : gfn_nvl(SBUxMethod.get("BIZ_CATEGORY"))
			   ,V_P_BIZ_ITEMS            : gfn_nvl(SBUxMethod.get("BIZ_ITEMS"))
			   ,V_P_PURCHASE_YN          : gfn_nvl(SBUxMethod.get("PURCHASE_YN").PURCHASE_YN)
			   ,V_P_SALE_YN              : gfn_nvl(SBUxMethod.get("SALE_YN").SALE_YN)
			   ,V_P_TRANSPORT_YN         : gfn_nvl(SBUxMethod.get("TRANSPORT_YN").TRANSPORT_YN)
			   ,V_P_CARGO_YN             : gfn_nvl(SBUxMethod.get("CARGO_YN").CARGO_YN)
			   ,V_P_SHIPPING_YN          : gfn_nvl(SBUxMethod.get("SHIPPING_YN").SHIPPING_YN)
			   ,V_P_CURRENCY_CODE        : gfnma_multiSelectGet("#CURRENCY_CODE")
			   ,V_P_SUB_NO               : gfn_nvl(SBUxMethod.get("SUB_NO"))
			   ,V_P_USE_YN               : gfn_nvl(SBUxMethod.get("USE_YN").USE_YN)
			   ,V_P_LIQUOR_YN            : gfn_nvl(SBUxMethod.get("LIQUOR_YN").LIQUOR_YN)
			   ,V_P_OSP_YN               : gfn_nvl(SBUxMethod.get("OSP_YN").OSP_YN)
			   ,V_P_OSP_YN1              : gfn_nvl(SBUxMethod.get("OSP_YN1").OSP_YN1)
			   ,V_P_OSP_YN2              : gfn_nvl(SBUxMethod.get("OSP_YN2").OSP_YN2)
			   ,V_P_OSP_YN3              : gfn_nvl(SBUxMethod.get("OSP_YN3").OSP_YN3)
			   ,V_P_REF_CS_CODE          : gfn_nvl(SBUxMethod.get("REF_CS_CODE"))
			   ,V_P_ZIP_CODE             : gfn_nvl(SBUxMethod.get("ZIP_CODE"))
			   ,V_P_ADDRESS              : gfn_nvl(SBUxMethod.get("ADDRESS"))
			   ,V_P_TEL                  : gfn_nvl(SBUxMethod.get("TEL"))
			   ,V_P_FAX                  : gfn_nvl(SBUxMethod.get("FAX"))
			   ,V_P_WEB_URL              : gfn_nvl(SBUxMethod.get("WEB_URL"))
			   ,V_P_START_DATE           : gfn_nvl(SBUxMethod.get("START_DATE"))
			   ,V_P_END_DATE             : gfn_nvl(SBUxMethod.get("END_DATE"))
			   ,V_P_MEMO                 : gfn_nvl(SBUxMethod.get("MEMO"))
			   ,V_P_DEFER_YN             : gfn_nvl(SBUxMethod.get("DEFER_YN").DEFER_YN)
			   ,IV_P_AP_ACC_CODE         : gfn_nvl(SBUxMethod.get("AP_ACC_CODE"))
			   ,IV_P_AR_ACC_CODE         : gfn_nvl(SBUxMethod.get("AR_ACC_CODE"))
			   ,V_P_EMP_CODE             : gfn_nvl(SBUxMethod.get("EMP_CODE"))
			   ,V_P_TXN_STOP_YN          : gfn_nvl(SBUxMethod.get("TXN_STOP_YN").TXN_STOP_YN)
			   ,V_P_TXN_STOP_REASON      : gfnma_multiSelectGet("#TXN_STOP_REASON")
			   ,V_P_TXN_STOP_DATE        : gfn_nvl(SBUxMethod.get("TXN_STOP_DATE"))
			   ,V_P_BANKRUPTCY_YN        : gfn_nvl(SBUxMethod.get("BANKRUPTCY_YN").BANKRUPTCY_YN)
			   ,IV_P_PREPAY_ACC_CODE     : gfn_nvl(SBUxMethod.get("PREPAY_ACC_CODE"))
			   ,IV_P_ADVANCE_ACC_CODE    : gfn_nvl(SBUxMethod.get("ADVANCE_ACC_CODE"))
			   ,V_P_DELIVERY_TYPE        : gfnma_multiSelectGet("#DELIVERY_TYPE")
			   ,V_P_PAY_DATE_RULE        : gfnma_multiSelectGet("#PAY_DATE_RULE")
			   ,V_P_SHIPPING_TYPE        : gfnma_multiSelectGet("#SHIPPING_TYPE")
			   ,V_P_TRANSPORT_ROUTE      : gfnma_multiSelectGet("#TRANSPORT_ROUTE")
			   ,V_P_EMAIL_ID             : gfn_nvl(SBUxMethod.get("EMAIL_ID"))
			   ,V_P_RECEIPT_DATE_RULE    : gfnma_multiSelectGet("#RECEIPT_DATE_RULE")
			   ,V_P_DEFER_REASON         : gfnma_multiSelectGet("#DEFER_REASON")
			   ,V_P_PUR_HANDOV_CNDT_CD   : gfnma_multiSelectGet("#PUR_HANDOV_CNDT_CD")
			   ,IV_P_AP_ACC_CODE_FOREIGN : gfn_nvl(SBUxMethod.get("AP_ACC_CODE_FOREIGN"))
			   ,IV_P_AR_ACC_CODE_FOREIGN : gfn_nvl(SBUxMethod.get("AR_ACC_CODE_FOREIGN"))
			   ,V_P_AP_CLR_ACC           : gfn_nvl(SBUxMethod.get("AP_CLR_ACC"))
			   ,V_P_EXPECTED_CUSTOMER_YN : gfn_nvl(SBUxMethod.get("EXPECTED_CUSTOMER_YN").EXPECTED_CUSTOMER_YN)
			   ,V_P_WITHHOLD_TAX_YN      : gfn_nvl(SBUxMethod.get("WITHHOLD_TAX_YN").WITHHOLD_TAX_YN)
			   ,V_P_WITHHOLD_TAX_OFFICE  : gfnma_multiSelectGet("#WITHHOLD_TAX_OFFICE")
			   ,V_P_WITHHOLD_TAX_OFFICE2 : gfnma_multiSelectGet("#WITHHOLD_TAX_OFFICE2")
			   ,V_P_WITHHOLD_TAX_TYPE    : gfnma_multiSelectGet("#WITHHOLD_TAX_TYPE")
			   ,V_P_TAX_CODE             : gfnma_multiSelectGet("#TAX_CODE")
			   ,V_P_TAX_SEND             : gfn_nvl(SBUxMethod.get("TAX_SEND").TAX_SEND)
			   ,V_P_INTERNAL_PAY_RULE_YN : gfn_nvl(SBUxMethod.get("INTERNAL_PAY_RULE_YN").INTERNAL_PAY_RULE_YN)
			   ,V_P_LOAN_LIMIT_DAY       : 0
			   ,V_P_CREDIT_LIMIT_DAY     : 0
			   ,V_P_BILL_LIMIT_DAY       : 0
			   ,V_P_SALES_TAX_SEND       : gfn_nvl(SBUxMethod.get("SALES_TAX_SEND").SALES_TAX_SEND)
			   ,V_P_SAP_CUSTOMER_CODE    : gfn_nvl(SBUxMethod.get("SAP_CUSTOMER_CODE"))
			   ,V_P_SAP_VENDOR_CODE      : gfn_nvl(SBUxMethod.get("SAP_VENDOR_CODE"))
			   ,V_P_RCPT_CHK_RANGE       : gfn_nvl(SBUxMethod.get("RCPT_CHK_RANGE"))
			   ,V_P_STEEL_SCRAP_PAY_YN   : gfn_nvl(SBUxMethod.get("STEEL_SCRAP_PAY_YN").STEEL_SCRAP_PAY_YN)
			   ,V_P_RESULT1              : gfn_nvl(SBUxMethod.get("RESULT1"))
			   ,V_P_VAT_ISSUE_COND       : gfnma_multiSelectGet("#VAT_ISSUE_COND")
			   ,V_P_SLIP_CLS       		 : gfnma_multiSelectGet("#SLIP_CLS")
			   ,V_P_CS_CATEGORY          : gfnma_multiSelectGet("#CS_CATEGORY")
   			   ///////////////////////////////////////////////////////////////////////////
   			   ,V_P_FORM_ID              : p_formId
   			   ,V_P_MENU_ID              : p_menuId
   			   ,V_P_PROC_ID              : ''
   			   ,V_P_USERID               : p_userId
   			   ,V_P_PC                   : ''
  	    };	
        const postJsonPromise = gfn_postJSON("/co/sys/com/deleteCom3400.do", {
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
        			cfn_search();
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
    //기본정보, 관리항목 탭 내역 저장
    const fn_save = async function() {
  	    var paramObj = {
       		    V_P_DEBUG_MODE_YN        : ""
   			   ,V_P_LANG_ID              : ""
   			   ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
   			   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
			   ///////////////////////////////////////////////////////////////////////////
			   ,IV_P_CS_CODE             : gfn_nvl(SBUxMethod.get("CS_CODE"))
			   ,V_P_CS_NAME              : gfn_nvl(SBUxMethod.get("CS_NAME"))
			   ,V_P_CS_FULLNAME          : gfn_nvl(SBUxMethod.get("CS_FULLNAME"))
			   ,V_P_CS_ABBR_NAME         : gfn_nvl(SBUxMethod.get("CS_ABBR_NAME"))
			   ,V_P_CS_NAME_ENG          : gfn_nvl(SBUxMethod.get("CS_NAME_ENG"))
			   ,V_P_CS_GROUP             : gfnma_multiSelectGet("#CS_GROUP")
			   ,V_P_BANK_NO              : gfn_nvl(SBUxMethod.get("BANK_NO"))
			   ,IV_P_FOREIGN_YN          : gfn_nvl(SBUxMethod.get("FOREIGN_YN").FOREIGN_YN)
			   ,V_P_NATION_CODE          : gfnma_multiSelectGet("#NATION_CODE")
			   ,V_P_REGION_CODE          : gfnma_multiSelectGet("#REGION_CODE")
			   ,V_P_BIZ_REGNO            : gfn_nvl(SBUxMethod.get("BIZ_REGNO")).replaceAll('-', '')
			   ,V_P_TAX_TYPE             : gfnma_multiSelectGet("#TAX_TYPE")
			   ,V_P_COM_TYPE             : gfnma_multiSelectGet("#COM_TYPE")
			   ,V_P_BIZ_TYPE             : gfn_nvl(SBUxMethod.get("BIZ_TYPE"))
			   ,V_P_COMP_REGNO           : gfn_nvl(SBUxMethod.get("COMP_REGNO")).replaceAll('-', '')
			   ,V_P_CHIEF_NAME           : gfn_nvl(SBUxMethod.get("CHIEF_NAME"))
			   ,V_P_CHIEF_SOCIALNO       : gfn_nvl(SBUxMethod.get("CHIEF_SOCIALNO")).replaceAll('-', '')
			   ,V_P_RESIDENT_YN          : gfn_nvl(SBUxMethod.get("RESIDENT_YN").RESIDENT_YN)
			   ,V_P_BIZ_CATEGORY         : gfn_nvl(SBUxMethod.get("BIZ_CATEGORY"))
			   ,V_P_BIZ_ITEMS            : gfn_nvl(SBUxMethod.get("BIZ_ITEMS"))
			   ,V_P_PURCHASE_YN          : gfn_nvl(SBUxMethod.get("PURCHASE_YN").PURCHASE_YN)
			   ,V_P_SALE_YN              : gfn_nvl(SBUxMethod.get("SALE_YN").SALE_YN)
			   ,V_P_TRANSPORT_YN         : gfn_nvl(SBUxMethod.get("TRANSPORT_YN").TRANSPORT_YN)
			   ,V_P_CARGO_YN             : gfn_nvl(SBUxMethod.get("CARGO_YN").CARGO_YN)
			   ,V_P_SHIPPING_YN          : gfn_nvl(SBUxMethod.get("SHIPPING_YN").SHIPPING_YN)
			   ,V_P_CURRENCY_CODE        : gfnma_multiSelectGet("#CURRENCY_CODE")
			   ,V_P_SUB_NO               : gfn_nvl(SBUxMethod.get("SUB_NO"))
			   ,V_P_USE_YN               : gfn_nvl(SBUxMethod.get("USE_YN").USE_YN)
			   ,V_P_LIQUOR_YN            : gfn_nvl(SBUxMethod.get("LIQUOR_YN").LIQUOR_YN)
			   ,V_P_OSP_YN               : gfn_nvl(SBUxMethod.get("OSP_YN").OSP_YN)
			   ,V_P_OSP_YN1              : gfn_nvl(SBUxMethod.get("OSP_YN1").OSP_YN1)
			   ,V_P_OSP_YN2              : gfn_nvl(SBUxMethod.get("OSP_YN2").OSP_YN2)
			   ,V_P_OSP_YN3              : gfn_nvl(SBUxMethod.get("OSP_YN3").OSP_YN3)
			   ,V_P_REF_CS_CODE          : gfn_nvl(SBUxMethod.get("REF_CS_CODE"))
			   ,V_P_ZIP_CODE             : gfn_nvl(SBUxMethod.get("ZIP_CODE"))
			   ,V_P_ADDRESS              : gfn_nvl(SBUxMethod.get("ADDRESS"))
			   ,V_P_TEL                  : gfn_nvl(SBUxMethod.get("TEL"))
			   ,V_P_FAX                  : gfn_nvl(SBUxMethod.get("FAX"))
			   ,V_P_WEB_URL              : gfn_nvl(SBUxMethod.get("WEB_URL"))
			   ,V_P_START_DATE           : gfn_nvl(SBUxMethod.get("START_DATE"))
			   ,V_P_END_DATE             : gfn_nvl(SBUxMethod.get("END_DATE"))
			   ,V_P_MEMO                 : gfn_nvl(SBUxMethod.get("MEMO"))
			   ,V_P_DEFER_YN             : gfn_nvl(SBUxMethod.get("DEFER_YN").DEFER_YN)
			   ,IV_P_AP_ACC_CODE         : gfn_nvl(SBUxMethod.get("AP_ACC_CODE"))
			   ,IV_P_AR_ACC_CODE         : gfn_nvl(SBUxMethod.get("AR_ACC_CODE"))
			   ,V_P_EMP_CODE             : gfn_nvl(SBUxMethod.get("EMP_CODE"))
			   ,V_P_TXN_STOP_YN          : gfn_nvl(SBUxMethod.get("TXN_STOP_YN").TXN_STOP_YN)
			   ,V_P_TXN_STOP_REASON      : gfnma_multiSelectGet("#TXN_STOP_REASON")
			   ,V_P_TXN_STOP_DATE        : gfn_nvl(SBUxMethod.get("TXN_STOP_DATE"))
			   ,V_P_BANKRUPTCY_YN        : gfn_nvl(SBUxMethod.get("BANKRUPTCY_YN").BANKRUPTCY_YN)
			   ,IV_P_PREPAY_ACC_CODE     : gfn_nvl(SBUxMethod.get("PREPAY_ACC_CODE"))
			   ,IV_P_ADVANCE_ACC_CODE    : gfn_nvl(SBUxMethod.get("ADVANCE_ACC_CODE"))
			   ,V_P_DELIVERY_TYPE        : gfnma_multiSelectGet("#DELIVERY_TYPE")
			   ,V_P_PAY_DATE_RULE        : gfnma_multiSelectGet("#PAY_DATE_RULE")
			   ,V_P_SHIPPING_TYPE        : gfnma_multiSelectGet("#SHIPPING_TYPE")
			   ,V_P_TRANSPORT_ROUTE      : gfnma_multiSelectGet("#TRANSPORT_ROUTE")
			   ,V_P_EMAIL_ID             : gfn_nvl(SBUxMethod.get("EMAIL_ID"))
			   ,V_P_RECEIPT_DATE_RULE    : gfnma_multiSelectGet("#RECEIPT_DATE_RULE")
			   ,V_P_DEFER_REASON         : gfnma_multiSelectGet("#DEFER_REASON")
			   ,V_P_PUR_HANDOV_CNDT_CD   : gfnma_multiSelectGet("#PUR_HANDOV_CNDT_CD")
			   ,IV_P_AP_ACC_CODE_FOREIGN : gfn_nvl(SBUxMethod.get("AP_ACC_CODE_FOREIGN"))
			   ,IV_P_AR_ACC_CODE_FOREIGN : gfn_nvl(SBUxMethod.get("AR_ACC_CODE_FOREIGN"))
			   ,V_P_AP_CLR_ACC           : gfn_nvl(SBUxMethod.get("AP_CLR_ACC"))
			   ,V_P_EXPECTED_CUSTOMER_YN : gfn_nvl(SBUxMethod.get("EXPECTED_CUSTOMER_YN").EXPECTED_CUSTOMER_YN)
			   ,V_P_WITHHOLD_TAX_YN      : gfn_nvl(SBUxMethod.get("WITHHOLD_TAX_YN").WITHHOLD_TAX_YN)
			   ,V_P_WITHHOLD_TAX_OFFICE  : gfnma_multiSelectGet("#WITHHOLD_TAX_OFFICE")
			   ,V_P_WITHHOLD_TAX_OFFICE2 : gfnma_multiSelectGet("#WITHHOLD_TAX_OFFICE2")
			   ,V_P_WITHHOLD_TAX_TYPE    : gfnma_multiSelectGet("#WITHHOLD_TAX_TYPE")
			   ,V_P_TAX_CODE             : gfnma_multiSelectGet("#TAX_CODE")
			   ,V_P_TAX_SEND             : gfn_nvl(SBUxMethod.get("TAX_SEND").TAX_SEND)
			   ,V_P_INTERNAL_PAY_RULE_YN : gfn_nvl(SBUxMethod.get("INTERNAL_PAY_RULE_YN").INTERNAL_PAY_RULE_YN)
			   ,V_P_LOAN_LIMIT_DAY       : 0
			   ,V_P_CREDIT_LIMIT_DAY     : 0
			   ,V_P_BILL_LIMIT_DAY       : 0
			   ,V_P_SALES_TAX_SEND       : gfn_nvl(SBUxMethod.get("SALES_TAX_SEND").SALES_TAX_SEND)
			   ,V_P_SAP_CUSTOMER_CODE    : gfn_nvl(SBUxMethod.get("SAP_CUSTOMER_CODE"))
			   ,V_P_SAP_VENDOR_CODE      : gfn_nvl(SBUxMethod.get("SAP_VENDOR_CODE"))
			   ,V_P_RCPT_CHK_RANGE       : gfn_nvl(SBUxMethod.get("RCPT_CHK_RANGE"))
			   ,V_P_STEEL_SCRAP_PAY_YN   : gfn_nvl(SBUxMethod.get("STEEL_SCRAP_PAY_YN").STEEL_SCRAP_PAY_YN)
			   ,V_P_RESULT1              : gfn_nvl(SBUxMethod.get("RESULT1"))
			   ,V_P_VAT_ISSUE_COND       : gfnma_multiSelectGet("#VAT_ISSUE_COND")
			   ,V_P_SLIP_CLS       		 : gfnma_multiSelectGet("#SLIP_CLS")
			   ,V_P_CS_CATEGORY          : gfnma_multiSelectGet("#CS_CATEGORY")
   			   ///////////////////////////////////////////////////////////////////////////
   			   ,V_P_FORM_ID              : p_formId
   			   ,V_P_MENU_ID              : p_menuId
   			   ,V_P_PROC_ID              : ''
   			   ,V_P_USERID               : p_userId
   			   ,V_P_PC                   : ''
  	    };	
        const postJsonPromise = gfn_postJSON("/co/sys/com/insertCom3400.do", {
        	getType				: 'json',
        	workType			: workType,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});   
        const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
          		return true;
        	} else {
          		alert(data.resultMessage);
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
    
    //직원 거래처 생성
    const fn_Emp = async function(){
    	await fn_emp_Q();
    	await fn_emp_S();
    }
    
    const fn_emp_Q = async function(){
  	    var paramObj = {
  	    		 V_P_DEBUG_MODE_YN      : ''
	  			,V_P_LANG_ID            : ''
	  			,V_P_COMP_CODE          : gv_ma_selectedCorpCd
	  			,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
	  			,V_P_EMP_CODE           : ''
	  			,V_P_FORM_ID            : p_formId
	  			,V_P_MENU_ID            : p_menuId
	  			,V_P_PROC_ID            : ''
	  			,V_P_USERID             : p_userId
	  			,V_P_PC                 : ''
 	    };	
        const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3400_IF_Q.do", {
	        getType				: 'json',
	        workType			: 'EMP',
	        cv_count			: '1',
	        params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
       
		try {
	       	if (_.isEqual("S", data.resultStatus)) {
	       		strEmpCode_d 		= "";
	       		strBankCode_d 		= "";
	       		strBankAccount_d 	= "";
	    	   	data.cv_1.forEach((item, index) => {
	                strEmpCode_d 		+= gfn_nvl(item.EMP_CODE) + "|";
	                strBankCode_d 		+= gfn_nvl(item.BANK_CODE) + "|";
	                strBankAccount_d	+= gfn_nvl(item.BANK_ACCOUNT) + "|"; 
	    	   	});
	    	   	strEmpCode_d 		= strEmpCode_d.substring(0, strEmpCode_d.length -1);
	    	   	strBankCode_d 		= strBankCode_d.substring(0, strBankCode_d.length -1);
	    	   	strBankAccount_d 	= strBankAccount_d.substring(0, strBankAccount_d.length -1);
	       	}
        } catch (e) {
	   		if (!(e instanceof Error)) {
	   			e = new Error(e);
	   		}
   		console.error("failed", e.message);
       	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
       }
    }
    
    const fn_emp_S = async function(){
  	    var paramObj = {
  	    		 V_P_DEBUG_MODE_YN      : ''
	   			,V_P_LANG_ID            : ''
	   			,V_P_COMP_CODE          : gv_ma_selectedCorpCd
	   			,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
	   			,V_P_EMP_CODE           : ''
	   			,V_P_EMP_CODE_D         : strEmpCode_d
	   			,V_P_BANK_CODE_D        : strBankCode_d
	   			,V_P_BANK_ACCOUNT_D     : strBankAccount_d
	   			,V_P_FORM_ID            : p_formId
	   			,V_P_MENU_ID            : p_menuId
	   			,V_P_PROC_ID            : ''
	   			,V_P_USERID             : p_userId
	   			,V_P_PC                 : ''
 	    };	
        const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3400_IF_S.do", {
	       	getType				: 'json',
	       	workType			: 'EMP',
	       	cv_count			: '0',
	       	params				: gfnma_objectToString(paramObj)
		});    	 
       const data = await postJsonPromise;
       
		try {
	       	if (_.isEqual("S", data.resultStatus)) {
	       		gfn_comAlert("I0002", '직원 거래처', '생성'); // {0}을/를 {1} 하였습니다.
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
	 * 상위거래처 공통팝업
	 */
    var fn_compopupBank = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get('BANK_NO_H'));
        var searchName 		= gfn_nvl(SBUxMethod.get("BANK_NAME_H"));
        var replaceText0 	= "_SUB_CODE_";
        var replaceText1 	= "_CODE_NAME_";
        var strWhereClause 	= "AND SUB_CODE LIKE '%" + replaceText0 + "%' AND CODE_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '공통은행정보 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COM027'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["코드", 	"명칭"]
  			,searchInputFields		: ["SUB_CODE", 	"CODE_NAME"]
  			,searchInputValues		: [searchCode, 	searchName]
    		,width					: '500px'
    		,height					: '400px'
  			,tableHeader			: ["코드", 		 "명칭"]
  			,tableColumnNames		: ["SUB_CODE", 	 "CODE_NAME"]
  			,tableColumnWidths		: ["80px", 		 "80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('BANK_NO_H',		data.SUB_CODE);
				SBUxMethod.set('BANK_NAME_H', 	data.CODE_NAME);
			},
    	});
  	}

	/**
	 * 공통팝업
	 * 상위거래처 공통팝업
	 */
    var fn_compopupParent = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get('PARENT_COST_CENTER'));
        var searchName 		= gfn_nvl(SBUxMethod.get("PARENT_COST_CENTER_NAME"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '본지점계정 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_PARENT_COSTCENTER'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["코드", 	"명칭"]
  			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
  			,searchInputValues		: [searchCode, 	searchName]
    		,width					: '500px'
    		,height					: '400px'
  			,tableHeader			: ["코드", 		 "명칭"]
  			,tableColumnNames		: ["COST_CENTER_CODE", 	 "COST_CENTER_NAME"]
  			,tableColumnWidths		: ["80px", 			 "80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('PARENT_COST_CENTER',		data.COST_CENTER_CODE);
				SBUxMethod.set('PARENT_COST_CENTER_NAME', 	data.COST_CENTER_NAME);
			},
    	});
  	}
    
    /**
     * 공통팝업
     * 부서
     */
    var fn_compopupDept = function() {
    	
        var searchText1 	= gfn_nvl(SBUxMethod.get("DEPT_CODE"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("DEPT_NAME"));
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
				SBUxMethod.set('DEPT_CODE', 	data.DEPT_CODE);
				SBUxMethod.set('DEPT_NAME', 	data.DEPT_NAME);
			},
    	});
  	}
    /**
     * 공통팝업
     * 손익사업장
     */
    var fn_compopupSite = function() {
    	
        var searchText1 	= gfn_nvl(SBUxMethod.get("SITE_CODE"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("SITE_NAME"));
        var replaceText0 	= "_SITE_CODE_";
        var replaceText1 	= "_SITE_NAME_";
        var strWhereClause 	= "AND AA.SITE_CODE LIKE '%" + replaceText0 + "%' AND AA.SITE_NAME LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '손익사업장');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG201'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["사업장코드", 		"사업장명"]
   			,searchInputFields		: ["SITE_CODE", 	"SITE_NAME"]
   			,searchInputValues		: [searchText1, 	searchText2]
			,searchInputTypes		: ["input", 		"input"]
    		,width					: '600px'
    		,height					: '400px'
   			,tableHeader			: ["부서코드", 		"부서명"]
   			,tableColumnNames		: ["SITE_CODE", 	"SITE_NAME"]
   			,tableColumnWidths		: ["150px", 		"250px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('SITE_CODE', 	data.SITE_CODE);
				SBUxMethod.set('SITE_NAME', 	data.SITE_NAME);
			},
    	});
  	}
    /**
     * 공통팝업
     * 대체거래처
     */
    var fn_compopupTrans = function() {
    	
        var searchText1 	= gfn_nvl(SBUxMethod.get("TRANS_COST_CENTER"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("TRANS_COST_CENTER_NAME"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '대체거래처 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COST_CENTER'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["코드", 	"명칭"]
  			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
  			,searchInputValues		: [searchText1, 		searchText2]
    		,width					: '600px'
    		,height					: '400px'
  			,tableHeader			: ["코드", 		 "명칭"]
  			,tableColumnNames		: ["COST_CENTER_CODE", 	 "COST_CENTER_NAME"]
  			,tableColumnWidths		: ["80px", 			 "80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('TRANS_COST_CENTER',		data.COST_CENTER_CODE);
				SBUxMethod.set('TRANS_COST_CENTER_NAME', 	data.COST_CENTER_NAME);
			},
    	});
  	}
    /**
     * 공통팝업
     * 센터장
     */
    var fn_compopupLeader = function() {
    	
        var searchText1 	= gfn_nvl(SBUxMethod.get("COST_CENTER_LEADER"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("COST_CENTER_LEADER_NAME"));
        var param		 	= [null];
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FI_DEPT'
       		,popupType				: 'B'
    		,whereClause			: param
       		,searchCaptions			: ["사번", 			"센터장"]
   			,searchInputFields		: ["DEPT_LEADER", 	"DEPT_LEADER_NAME"]
   			,searchInputValues		: [searchText1, 	searchText2]
			,searchInputTypes		: ["input", 		"input"]		//input, datepicker가 있는 경우
    		,width					: '600px'
    		,height					: '400px'
   			,tableHeader			: ["부서", 		"사번", 			"센터장"]
   			,tableColumnNames		: ["DEPT_NAME", "DEPT_LEADER", 	"DEPT_LEADER_NAME"]
   			,tableColumnWidths		: ["150px", 	"150px",		"150px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('COST_CENTER_LEADER', 	data.DEPT_LEADER);
				SBUxMethod.set('COST_CENTER_LEADER_NAME', 	data.DEPT_LEADER_NAME);
			},
    	});
  	}
    /**
     * 공통팝업
     * 예산C/C
     */
    var fn_compopupBudget = function() {
    	
        var searchText1 	= gfn_nvl(SBUxMethod.get("BUDGET_COST_CENTER"));
        var searchText2 	= gfn_nvl(SBUxMethod.get("BUDGET_COST_CENTER_NAME"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '대체거래처 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COST_CENTER'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["코드", 	"명칭"]
  			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
  			,searchInputValues		: [searchText1, 		searchText2]
    		,width					: '500px'
    		,height					: '400px'
  			,tableHeader			: ["코드", 		 "명칭"]
  			,tableColumnNames		: ["COST_CENTER_CODE", 	 "COST_CENTER_NAME"]
  			,tableColumnWidths		: ["100px", 			 "100px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('BUDGET_COST_CENTER',		data.COST_CENTER_CODE);
				SBUxMethod.set('BUDGET_COST_CENTER_NAME', 	data.COST_CENTER_NAME);
			},
    	});
  	}
    /**
     * 복수코드 팝업
     */
    const fn_multiSelect = function() {
    	
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
		SBUxMethod.openModal('modal-compopup3');
		
    	compopup3({
    		height			: '400px'
   			,callbackEvent	: function (data){
   				
   				multiSelectData = "";
                for(var i=0; data.length > i; i++){
                	multiSelectData += data[i] + "|";
                }
   				if(multiSelectData.length > 0){
   					SBUxMethod.set('SRCH_MULTI_YN', 'Y');
   					multiSelectData = multiSelectData.substring(0, multiSelectData.length-1);
   				}else{
   					SBUxMethod.set('SRCH_MULTI_YN', 'N');
   				}
   			},
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
  	}    
    
    
    
	/* 주소 팝업 */
	//팝업 실행
	var fn_goPopup = function(){
		w = 520;
		h = 620;
		LeftPosition = (screen.width) ? (screen.width - w) / 2 : 0;
		TopPosition = (screen.height) ? (screen.height - h) / 2 : 0;

		settings = "height=" + h
				   + ",width=" + w
				   + ",top=" + TopPosition
				   + ",left=" + LeftPosition
				   + ",scrollbars=yes, resizable=yes";
		window.open( "/fm/popup/jusoPopup.do", "zipCodeSearchWin", settings );

	}

	/* 주소 팝업 */
	//팝업 콜백
	var jusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo){
		/*
			roadFullAddr 	전체 도로명주소
			roadAddrPart1 	도로명주소(참고항목 제외)
			roadAddrPart2 	도로명주소 참고항목
			addrDetail 		상세주소
			engAddr 		도로명 주소 영문
			jibunAddr 		지번 정보
			zipNo 			우편번호
		*/
		if(addrDetail.length>30){
			alert('상세주소가 너무 길어 다시 입력해야 합니다.');
			return;
		}
		SBUxMethod.set("ZIP_CODE", zipNo);//우편번호
		SBUxMethod.set("ADDRESS", roadFullAddr );// 도로명주소
	}
	
	
    /**
     * 그리드내 은행 검색 팝업 조회
     */
    function fn_gridPopupBank(event, row, col) {

        let rowData = financeGrid.getRowData(row);
        let rowStatus = financeGrid.getRowStatus(row);
        if (_.isEqual(rowStatus, 1) || _.isEqual(rowStatus, 3)){
            let searchText = '';
            if (!_.isEmpty(rowData)){
                searchText = rowData.BANK_CODE;
            }
            event.stopPropagation();	//이벤트가 그리드에 전파되는것 중지
            fn_gridPopupBank2(row, col, searchText);
        }else{
            return false;
        }
    }
    /**
     * 그리드내 공통팝업 오픈
     */
    var fn_gridPopupBank2 = function(row, col, searchTt) {

        SBUxMethod.attr('modal-compopup1', 'header-title', '은행 조회');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= searchTt;
        var replaceText0 	= "_BANK_CODE_";
        var replaceText1 	= "_BANK_NAME_";
        var strWhereClause 	= "AND SUB_CODE  LIKE '%" + replaceText0 + "%' AND CODE_NAME LIKE '%" + replaceText1 + "%'";

        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM027'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["사번", 		"사원명"]
            ,searchInputFields		: ["SUB_CODE", 	"CODE_NAME"]
            ,searchInputValues		: [searchText, 	""]
            ,height					: '400px'
            ,tableHeader			: ["코드", "은행명"]
            ,tableColumnNames		: ["SUB_CODE", "CODE_NAME"]
            ,tableColumnWidths		: ["80px", "80px"]
            ,itemSelectEvent		: function (data){
                //그리드내 원하는 위치에 값 셋팅하기
                financeGrid.setCellData(row, (col+1), data['SUB_CODE']);
                financeGrid.setCellData(row, (col+2), data['CODE_NAME']);
            }
        });
    }
    
    
    
    
    var fn_compopupEmpCode = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("EMP_CODE"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI0001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", "부서명", "사원코드", "사원명", "재직구분"]
            ,searchInputFields		: ["DEPT_CODE", "DEPT_NAME", "EMP_CODE", "EMP_NAME", "EMP_STATE"]
            ,searchInputValues		: ["", "", searchText, "", ""]
            ,searchInputTypes		: ["input", "input", "input", "input", "select"]		//input, datepicker가 있는 경우
            ,searchInputTypeValues	: ["", "", "", "", jsonEmpState]
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서명", "사업장명", "재직구분", "직위", "직책", "직급"]
            ,tableColumnNames		: ["EMP_CODE", "EMP_FULL_NAME", "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME", "POSITION_CODE", "DUTY_CODE", "JOB_RANK"]
            ,tableColumnWidths		: ["80px", "80px", "80px", "120px", "80px", "80px", "80px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('EMP_CODE', data.EMP_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }
    	
    
    /**
     * 주소 ~ 매핑이력 - 구매정보 채무계정코드, 채무정산계정, 채무계정 코드외화, 선급금계정 오픈
     * 주소 ~ 매핑이력 - 판매처분류 채권계정코드, 채권계정코드외화, 선수금계정 오픈
     */
    var fn_compopupAccountCode = function(type) {
    	
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_"; 
        var searchText0		= "";
        var searchText1		= "";
        
        if(type == 'AP_ACC' ){
        	searchText0 = gfn_nvl(SBUxMethod.get("AP_ACC_CODE"));
        	searchText1 = gfn_nvl(SBUxMethod.get("AP_ACC_NAME"));
        }else if(type == 'AP_CLR' ){
        	searchText0 = gfn_nvl(SBUxMethod.get("AP_CLR_ACC"));
        	searchText1 = gfn_nvl(SBUxMethod.get("AP_CLR_NAME"));
        }else if(type == 'FOREIGN' ){
        	searchText0 = gfn_nvl(SBUxMethod.get("AP_ACC_CODE_FOREIGN"));
        	searchText1 = gfn_nvl(SBUxMethod.get("AP_ACC_NAME_FOREIGN"));
        }else if(type == 'PREPAY' ){
        	searchText0 = gfn_nvl(SBUxMethod.get("PREPAY_ACC_CODE"));
        	searchText1 = gfn_nvl(SBUxMethod.get("PREPAY_ACC_NAME"));
        }else if(type == 'AR_ACC' ){
        	searchText0 = gfn_nvl(SBUxMethod.get("AR_ACC_CODE"));
        	searchText1 = gfn_nvl(SBUxMethod.get("AR_ACC_NAME"));
        }else if(type == 'AR_ACC_FOREIGN' ){
        	searchText0 = gfn_nvl(SBUxMethod.get("AR_ACC_CODE_FOREIGN"));
        	searchText1 = gfn_nvl(SBUxMethod.get("AR_ACC_NAME_FOREIGN"));
        }else if(type == 'ADVANCE_ACC' ){
        	searchText0 = gfn_nvl(SBUxMethod.get("ADVANCE_ACC_CODE"));
        	searchText1 = gfn_nvl(SBUxMethod.get("ADVANCE_ACC_NAME"));
        }
        
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND ACCOUNT_NAME LIKE '%" + replaceText1 + "%' " +"AND A.COMP_CODE LIKE '%" + gv_ma_selectedCorpCd + "%'";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정 과목');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 			"명칭"]
   			,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,searchInputValues		: [searchText0, 	searchText1]
			,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드",		"계정명",		]
   			,tableColumnNames		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,tableColumnWidths		: ["100px", 		"300px"]
			,itemSelectEvent		: function (data){
				//그리드내 원하는 위치에 값 셋팅하기
		        if(type == 'AP_ACC' ){
					SBUxMethod.set("AP_ACC_CODE", gfn_nvl(data.ACCOUNT_CODE));
					SBUxMethod.set("AP_ACC_NAME", gfn_nvl(data.ACCOUNT_NAME));
		        }else if(type == 'AP_CLR' ){
					SBUxMethod.set("AP_CLR_ACC", gfn_nvl(data.ACCOUNT_CODE));
					SBUxMethod.set("AP_CLR_ACC_NAME", gfn_nvl(data.ACCOUNT_NAME));
		        }else if(type == 'FOREIGN' ){
					SBUxMethod.set("AP_ACC_CODE_FOREIGN", gfn_nvl(data.ACCOUNT_CODE));
					SBUxMethod.set("AP_ACC_NAME_FOREIGN", gfn_nvl(data.ACCOUNT_NAME));
		        }else if(type == 'PREPAY' ){
					SBUxMethod.set("PREPAY_ACC_CODE", gfn_nvl(data.ACCOUNT_CODE));
					SBUxMethod.set("PREPAY_ACC_NAME", gfn_nvl(data.ACCOUNT_NAME));
		        }else if(type == 'AR_ACC' ){
					SBUxMethod.set("AR_ACC_CODE", gfn_nvl(data.ACCOUNT_CODE));
					SBUxMethod.set("AR_ACC_NAME", gfn_nvl(data.ACCOUNT_NAME));
		        }else if(type == 'AR_ACC_FOREIGN' ){
					SBUxMethod.set("AR_ACC_CODE_FOREIGN", gfn_nvl(data.ACCOUNT_CODE));
					SBUxMethod.set("AR_ACC_NAME_FOREIGN", gfn_nvl(data.ACCOUNT_NAME));
		        }else if(type == 'ADVANCE_ACC' ){
					SBUxMethod.set("ADVANCE_ACC_CODE", gfn_nvl(data.ACCOUNT_CODE));
					SBUxMethod.set("ADVANCE_ACC_NAME", gfn_nvl(data.ACCOUNT_NAME));
		        }
			}
    	});
		SBUxMethod.openModal('modal-compopup1');
    }        

    // 행 추가
     const fn_addFinanceRow = function () {
         let rowLen = financeGrid.getRows();
         financeGrid.addRow(true,
     			{
        	 MAIN_FLAG:""
					,SEQ :					rowLen
					,POP_BTN_BANK :			""
					,BANK_CODE :			""
					,BANK_NAME :			""
					,BANK_ACCOUNT_NO :		""
					,BANK_ACCOUNT_OWNER :	""
					,NOTE_TYPE :			""
					,BTB_CODE :				""
					,CMS_CODE :				""
					,PAYER_SWIFT_BIC :		""
					,PAYER_BANK_INFO :		""
					,PAY_REASON :			""
					,SEND_REASON :			""
					,FEE_CHARGER :			""
					,CURRENCY_CODE :		""
					,EFFECT_START_DATE :	""
					,EFFECT_END_DATE :		""
	  				,VAT_ACCOUNT_YN :		""
	  				,FIRM_PAYEE_DATE :		""
	  				,FIRM_PAYEE_TRF_NO :	"0"
	  				,RESULT_CODE :			""
	  				,RESULT_NAME :			""
	  				,DESCRIPTION :			""
			});
     }

    // 행삭제
    const fn_delFinanceRow = async function() {
        let rowVal = financeGrid.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제"); // W0003	{0}할 대상이 없습니다.
            return;
        } else {
        	financeGrid.deleteRow(rowVal);
        }
    }
    
    
    
    const fn_FinanceName = async function() {
        let financeGridRowVal = financeGrid.getRow();
        let financeGridRowLength = financeGrid.getRows();
        
        if (financeGridRowLength == 0) {
            gfn_comAlert("W0003", "수취인확인 데이터"); // W0005	{0}이/가 없습니다.
            return;
        }
        if (financeGridRowVal == -1) {
            gfn_comAlert("W0001", "수취인확인할 데이터"); // W0001	{0}을/를 선택하세요.
            return;
        }
        if (gfnma_multiSelectGet('#FBS_SERVICE') == ''){
            gfn_comAlert("W0001", "FBS 서비스"); // W0001	{0}을/를 선택하세요.
            return;
        }
        
        let financeGridRowData = financeGrid.getRowData(financeGridRowVal);
        let fbsService				= "";
        let socialNum 				= "";
        let payerBankCode			= gfn_nvl(financeGridRowData.BANK_CODE);
        let payerBankAccount		= gfn_nvl(financeGridRowData.BANK_ACCOUNT_NO);
        let payerBankAccountOwner	= gfn_nvl(financeGridRowData.BANK_ACCOUNT_OWNER);
        let currencyCode 			= gfn_nvl(financeGridRowData.CURRENCY_CODE);
        let fbsNo 					= gfn_nvl(financeGridRowData.SEQ);

        if(currencyCode == 'KRW'){
        	fbsService = 'ECBANK';
        }else{
        	fbsService = 'ECBANKFC';
        }
    	
    	var paramObj = {
  			  V_P_DEBUG_MODE_YN       	: ''
			  ,V_P_LANG_ID            	: ''
			  ,V_P_COMP_CODE          	: gv_ma_selectedCorpCd
			  ,V_P_CLIENT_CODE        	: gv_ma_selectedClntCd
			  ,V_P_BANK_CODE        	: ''
			  ,V_P_FBS_SERVICE         	: fbsService
			  ,V_P_FBS_WORK_TYPE        : "NAME"
			  ,V_P_ACCOUNT_BANK         : payerBankCode
			  ,V_P_ACCOUNT_NO         	: payerBankAccount
			  ,V_P_SOCIALNUM          	: socialNum
			  ,V_P_ACCOUNT_OWNER        : payerBankAccountOwner
			  ,V_P_CURRENCY_CODE        : currencyCode
			  ,V_P_FBS_NO          		: fbsNo
			  ,V_P_INTERFACEID       	: ""
			  ,V_P_FORM_ID            	: p_formId
			  ,V_P_MENU_ID            	: p_menuId
			  ,V_P_PROC_ID            	: ""
			  ,V_P_USERID             	: p_userId
			  ,V_P_PC                 	: ""
	    };
		const postJsonPromise = gfn_postJSON("/co/sys/com/financeName.do", {
			getType				: 'json',
			workType			: 'Q',
			cv_count			: '1',
			params				: gfnma_objectToString(paramObj)
		});
  		const data = await postJsonPromise;
		try {
	    	if (_.isEqual("S", data.resultStatus)) {
	    		if(data.resultMessage){
	    			alert(data.resultMessage);
	    		}
	    	}else{
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
    
	// 행 추가
     const fn_addPurchaseRow = function () {
         purchaseGrid.addRow(true);
     }

    // 행삭제
    const fn_delPurchaseRow = async function() {
        let rowVal = purchaseGrid.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제"); // W0003	{0}할 대상이 없습니다.
            return;
        } else {
        	purchaseGrid.deleteRow(rowVal);
        }
    }
	// 행 추가
     const fn_addSalesRow = function () {
    	salesGrid.addRow(true);
     }

    // 행삭제
    const fn_delSalesRow = async function() {
        let rowVal = salesGrid.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제"); // W0003	{0}할 대상이 없습니다.
            return;
        } else {
        	salesGrid.deleteRow(rowVal);
        }
    }
	// 행 추가
     const fn_addSalesShipToRow = function () {
    	salesShipToGrid.addRow(true);
     }

    // 행삭제
    const fn_delSalesShipToRow = async function() {
        let rowVal = salesShipToGrid.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제"); // W0003	{0}할 대상이 없습니다.
            return;
        } else {
        	salesShipToGrid.deleteRow(rowVal);
        }
    }
	// 행 추가
    const fn_addSalesCategoryRow = function () {
		salesCategoryGrid.refresh();
		salesCategoryGrid.addRow(true);
    }

    // 행삭제
    const fn_delSalesCategoryRow = async function() {
        let rowVal = salesCategoryGrid.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제"); // W0003	{0}할 대상이 없습니다.
            return;
        } else {
        	salesCategoryGrid.deleteRow(rowVal);
        }
    }
	// 행 추가
     const fn_addHistoryRow = function () {
    	 historyGrid.addRow(true);
     }

    // 행삭제
    const fn_delHistoryRow = async function() {
        let rowVal = historyGrid.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제"); // W0003	{0}할 대상이 없습니다.
            return;
        } else {
        	historyGrid.deleteRow(rowVal);
        }
    }
	// 행 추가
     const fn_addMappingRow = function () {
   	    mappingGrid.addRows([{MAP_TYPE: "", ASIS_CS_CODE: "", CS_CODE: gfn_nvl(SBUxMethod.get("CS_CODE")), CS_NAME: "", BIZ_REGNO: "" }]);
    }

    // 행삭제
    const fn_delMappingRow = async function() {
        let rowVal = mappingGrid.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제"); // W0003	{0}할 대상이 없습니다.
            return;
        } else {
        	mappingGrid.deleteRow(rowVal);
        }
    }
    
    // 확정
    const fn_confirm = async function() {
        let masterGridRowVal 	= masterGrid.getRow();
        let masterGridRowLength = masterGrid.getRows();
        let masterGridChkRow 	= masterGrid.getCheckedRowData(masterGrid.getColRef('CHECK_YN'));
        let cnt = 0;
        if (masterGridRowVal == -1) {
            gfn_comAlert("W0003", "확정"); // W0003	{0}할 대상이 없습니다.
            return;
        }
        if (masterGridRowLength == 0) {
            gfn_comAlert("W0003", "확정"); // W0003	{0}할 대상이 없습니다.
            return;
        }
       	if(masterGridChkRow.length == 0){
       		gfn_comAlert("W0001", "거래처 리스트에서 체크박스"); //{0}을/를 선택하세요.
       		return;
       	}
        let listData = [];
		masterGridChkRow.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: 'CONFIRM',
                params: gfnma_objectToString({
                	 V_P_DEBUG_MODE_YN      : ''
               		,V_P_LANG_ID            : ''
               		,V_P_COMP_CODE          : gv_ma_selectedCorpCd
               		,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
               		,IV_P_CS_CODE           : gfn_nvl(item.data.CS_CODE)
               		,V_P_DEFER_YN           : ''
               		,V_P_DEFER_REASON       : ''
               		,V_P_TXN_STOP_YN        : gfn_nvl(item.data.TXN_STOP_YN)
               		,V_P_TXN_STOP_REASON    : ''
               		,V_P_USE_YN             : gfn_nvl(item.data.USE_YN)
               		,V_P_FORM_ID            : p_formId
               		,V_P_MENU_ID            : p_menuId
               		,V_P_PROC_ID            : ''
               		,V_P_USERID             : p_userId
               		,V_P_PC                 : ''
                })
            }
            listData.push(param);
        });
        const postJsonPromise = gfn_postJSON("/co/sys/com/insertCom3400_S2.do", {listData: listData});
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");
                fn_init();
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
    
    // 미확정
    const fn_unconfirm = async function() {
        let masterGridRowVal 	= masterGrid.getRow();
        let masterGridRowLength = masterGrid.getRows();
        let masterGridChkRow 	= masterGrid.getCheckedRowData(masterGrid.getColRef('CHECK_YN'));
        let cnt = 0;
        if (masterGridRowVal == -1) {
            gfn_comAlert("W0003", "확정"); // W0003	{0}할 대상이 없습니다.
            return;
        }
        if (masterGridRowLength == 0) {
            gfn_comAlert("W0003", "확정"); // W0003	{0}할 대상이 없습니다.
            return;
        }
       	if(masterGridChkRow.length == 0){
       		gfn_comAlert("W0001", "거래처 리스트에서 체크박스"); //{0}을/를 선택하세요.
       		return;
       	}
        let listData = [];
		masterGridChkRow.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: 'UNCONFIRM',
                params: gfnma_objectToString({
                	 V_P_DEBUG_MODE_YN      : ''
               		,V_P_LANG_ID            : ''
               		,V_P_COMP_CODE          : gv_ma_selectedCorpCd
               		,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
               		,IV_P_CS_CODE           : gfn_nvl(item.data.CS_CODE)
               		,V_P_DEFER_YN           : ''
               		,V_P_DEFER_REASON       : ''
               		,V_P_TXN_STOP_YN        : gfn_nvl(item.data.TXN_STOP_YN)
               		,V_P_TXN_STOP_REASON    : ''
               		,V_P_USE_YN             : gfn_nvl(item.data.USE_YN)
               		,V_P_FORM_ID            : p_formId
               		,V_P_MENU_ID            : p_menuId
               		,V_P_PROC_ID            : ''
               		,V_P_USERID             : p_userId
               		,V_P_PC                 : ''
                })
            }
            listData.push(param);
        });
        const postJsonPromise = gfn_postJSON("/co/sys/com/insertCom3400_S2.do", {listData: listData});
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");
                fn_init();
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
    
    // 변경이력관리탭 그리드 저장
    const fn_save_S3 = async function() {
        let historyGridRowVal 		= historyGrid.getRow();
        let historyGridLength 		= historyGrid.getUpdateData(true, 'all').length;
        let historyGridUpdateData 	= historyGrid.getUpdateData(true, 'all');
        if(historyGridLength <= 0){
            return true;
        }
        let listData = [];
		historyGridUpdateData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                	 V_P_DEBUG_MODE_YN      : ''
               		,V_P_LANG_ID            : ''
               		,V_P_COMP_CODE          : gv_ma_selectedCorpCd
               		,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
               		,V_P_CS_CODE           	: gfn_nvl(SBUxMethod.get('CS_CODE'))
               		,V_P_START_DATE         : gfn_nvl(item.data.START_DATE).replaceAll('-', '')
               		,V_P_END_DATE       	: gfn_nvl(item.data.END_DATE).replaceAll('-', '')
               		,V_P_CS_NAME        	: gfn_nvl(item.data.CS_NAME)
               		,V_P_BIZ_REGNO    		: gfn_nvl(item.data.BIZ_REGNO)
               		,V_P_BIZ_CATEGORY       : gfn_nvl(item.data.BIZ_CATEGORY)
               		,V_P_BIZ_ITEMS          : gfn_nvl(item.data.BIZ_ITEMS)
               		,V_P_CHIEF_NAME         : gfn_nvl(item.data.CHIEF_NAME)
               		,V_P_FORM_ID            : p_formId
               		,V_P_MENU_ID            : p_menuId
               		,V_P_PROC_ID            : ''
               		,V_P_USERID             : p_userId
               		,V_P_PC                 : ''
                })
            }
            listData.push(param);
        });
        const postJsonPromise = gfn_postJSON("/co/sys/com/insertCom3400_S3.do", {listData: listData});
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
	        	return true;
            } else {
                alert(data.resultMessage);
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
    
    // 자금정보 그리드 저장
    const fn_save_S4 = async function() {
        let financeGridRowVal 		= financeGrid.getRow();
        let financeGridLength 		= financeGrid.getUpdateData(true, 'all').length;
        let financeGridUpdateData 	= financeGrid.getUpdateData(true, 'all');
        if(financeGridLength <= 0){
        	return true;
        }
        let listData = [];
		financeGridUpdateData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                	 V_P_DEBUG_MODE_YN      : ''
               		,V_P_LANG_ID            : ''
               		,V_P_COMP_CODE          : gv_ma_selectedCorpCd
               		,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
				    ,V_P_CS_CODE            : gfn_nvl(SBUxMethod.get('CS_CODE'))
				    ,V_P_MAIN_FLAG          : gfn_nvl(item.data.MAIN_FLAG)
				    ,V_P_SEQ                : gfn_nvl(item.data.SEQ)
				    ,V_P_BANK_CODE          : gfn_nvl(item.data.BANK_CODE)
				    ,V_P_BANK_ACCOUNT_NO    : gfn_nvl(item.data.BANK_ACCOUNT_NO)
				    ,V_P_BANK_ACCOUNT_OWNER : gfn_nvl(item.data.BANK_ACCOUNT_OWNER)
				    ,V_P_NOTE_TYPE          : gfn_nvl(item.data.NOTE_TYPE)
				    ,V_P_BTB_CODE           : gfn_nvl(item.data.BTB_CODE)
				    ,V_P_CMS_CODE           : gfn_nvl(item.data.CMS_CODE)
				    ,V_P_PAYER_SWIFT_BIC    : gfn_nvl(item.data.PAYER_SWIFT_BIC)
				    ,V_P_PAYER_BANK_INFO    : gfn_nvl(item.data.PAYER_BANK_INFO)
				    ,V_P_PAY_REASON    	    : gfn_nvl(item.data.PAY_REASON)
				    ,V_P_SEND_REASON    	: gfn_nvl(item.data.SEND_REASON)
				    ,V_P_FEE_CHARGER    	: gfn_nvl(item.data.FEE_CHARGER)
				    ,V_P_VAT_ACCOUNT_YN     : gfn_nvl(item.data.VAT_ACCOUNT_YN)
				    ,V_P_DESCRIPTION        : gfn_nvl(item.data.DESCRIPTION)
				    ,V_P_EFFECT_START_DATE  : gfn_nvl(item.data.EFFECT_START_DATE).replaceAll('-', '')
				    ,V_P_EFFECT_END_DATE    : gfn_nvl(item.data.EFFECT_END_DATE).replaceAll('-', '')
				    ,V_P_CURRENCY_CODE	   	: gfn_nvl(item.data.CURRENCY_CODE)
               		,V_P_FORM_ID            : p_formId
               		,V_P_MENU_ID            : p_menuId
               		,V_P_PROC_ID            : ''
               		,V_P_USERID             : p_userId
               		,V_P_PC                 : ''
                })
            }
            listData.push(param);
        });
        const postJsonPromise = gfn_postJSON("/co/sys/com/insertCom3400_S4.do", {listData: listData});
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
            	return true;
            } else {
                alert(data.resultMessage);
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
    
    // 구매정보 그리드 저장
    const fn_save_S5 = async function() {
        let purchaseGridRowVal 		= purchaseGrid.getRow();
        let purchaseGridLength 		= purchaseGrid.getUpdateData(true, 'all').length;
        let purchaseGridUpdateData 	= purchaseGrid.getUpdateData(true, 'all');
        if(purchaseGridLength <= 0){
        	return true;
        }
        let listData = [];
		purchaseGridUpdateData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                	 V_P_DEBUG_MODE_YN      : ''
               		,V_P_LANG_ID            : ''
               		,V_P_COMP_CODE          : gv_ma_selectedCorpCd
               		,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
				    ,V_P_CS_CODE            : gfn_nvl(SBUxMethod.get('CS_CODE'))
				    ,V_P_PUR_CONTACT_TYPE   : gfn_nvl(item.data.PUR_CONTACT_TYPE)
				    ,V_P_PUR_DEPT_NAME    	: gfn_nvl(item.data.PUR_DEPT_NAME)
				    ,V_P_PUR_ADDRESS    	: gfn_nvl(item.data.PUR_ADDRESS)
				    ,V_P_PUR_CONTACT_NAME   : gfn_nvl(item.data.PUR_CONTACT_NAME)
				    ,V_P_PUR_CONTACT_TEL    : gfn_nvl(item.data.PUR_CONTACT_TEL)
				    ,V_P_PUR_CONTACT_EMAIL  : gfn_nvl(item.data.PUR_CONTACT_EMAIL)
				    ,V_P_PUR_CONTACT_MOBILE : gfn_nvl(item.data.PUR_CONTACT_MOBILE)
				    ,V_P_PUR_CONTACT_FAX	: gfn_nvl(item.data.PUR_CONTACT_FAX)
               		,V_P_FORM_ID            : p_formId
               		,V_P_MENU_ID            : p_menuId
               		,V_P_PROC_ID            : ''
               		,V_P_USERID             : p_userId
               		,V_P_PC                 : ''
                })
            }
            listData.push(param);
        });
        const postJsonPromise = gfn_postJSON("/co/sys/com/insertCom3400_S5.do", {listData: listData});
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
            	return true;
            } else {
                alert(data.resultMessage);
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
    
    // 판매정보 그리드 저장
    const fn_save_S6 = async function() {
        let salesGridRowVal 		= salesGrid.getRow();
        let salesGridLength 		= salesGrid.getUpdateData(true, 'all').length;
        let salesGridUpdateData 	= salesGrid.getUpdateData(true, 'all');
        if(salesGridLength <= 0){
        	return true;
        }
        let listData = [];
        salesGridUpdateData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                	 V_P_DEBUG_MODE_YN      		: ''
               		,V_P_LANG_ID            		: ''
               		,V_P_COMP_CODE          		: gv_ma_selectedCorpCd
               		,V_P_CLIENT_CODE        		: gv_ma_selectedClntCd
				    ,V_P_CS_CODE            		: gfn_nvl(SBUxMethod.get('CS_CODE'))
				    ,V_P_SALE_CONTACT_TYPE   		: gfn_nvl(item.data.SALE_CONTACT_TYPE)
				    ,V_P_SALE_DEPT_NAME    			: gfn_nvl(item.data.SALE_DEPT_NAME)
				    ,V_P_SALE_ADDRESS    			: gfn_nvl(item.data.SALE_ADDRESS)
				    ,V_P_SALE_CONTACT_NAME   		: gfn_nvl(item.data.SALE_CONTACT_NAME)
				    ,V_P_SALE_CONTACT_TEL    		: gfn_nvl(item.data.SALE_CONTACT_TEL)
				    ,V_P_SALE_CONTACT_EMAIL  		: gfn_nvl(item.data.SALE_CONTACT_EMAIL)
				    ,V_P_SALE_CONTACT_MOBILE 		: gfn_nvl(item.data.SALE_CONTACT_MOBILE)
				    ,V_P_SALE_CONTACT_FAX			: gfn_nvl(item.data.SALE_CONTACT_FAX)
				    ,V_P_KEY_SALE_CONTACT_TYPE		: gfn_nvl(item.data.KEY_SALE_CONTACT_TYPE)
				    ,V_P_KEY_SALE_DEPT_NAME			: gfn_nvl(item.data.KEY_SALE_DEPT_NAME)
				    ,V_P_KEY_SALE_CONTACT_EMAIL		: gfn_nvl(item.data.KEY_SALE_CONTACT_EMAIL)
               		,V_P_FORM_ID            		: p_formId
               		,V_P_MENU_ID            		: p_menuId
               		,V_P_PROC_ID            		: ''
               		,V_P_USERID             		: p_userId
               		,V_P_PC                 		: ''
                })		
            }
            listData.push(param);
        });
        const postJsonPromise = gfn_postJSON("/co/sys/com/insertCom3400_S6.do", {listData: listData});
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
            	return true;
            } else {
                alert(data.resultMessage);
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
    
    // 판매처분류 그리드 저장 
    const fn_save_S7 = async function() {
        let salesCategoryGridRowVal 		= salesCategoryGrid.getRow();
        let salesCategoryGridLength 		= salesCategoryGrid.getUpdateData(true, 'all').length;
        let salesCategoryGridUpdateData 	= salesCategoryGrid.getUpdateData(true, 'all');
        if(salesCategoryGridLength <= 0){
        	return true;
        }
        let listData = [];
		salesCategoryGridUpdateData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                	 V_P_DEBUG_MODE_YN      	: ''
               		,V_P_LANG_ID            	: ''
               		,V_P_COMP_CODE          	: gv_ma_selectedCorpCd
               		,V_P_CLIENT_CODE        	: gv_ma_selectedClntCd
				    ,V_P_CS_CODE            	: gfn_nvl(SBUxMethod.get('CS_CODE'))
				    ,V_P_CREDIT_AREA   			: gfn_nvl(item.data.CREDIT_AREA)
				    ,V_P_CS_CATEGORY_GROUP    	: gfn_nvl(item.data.CS_CATEGORY_GROUP)
				    ,V_P_CS_CATEGORY1    		: gfn_nvl(item.data.CS_CATEGORY1)
				    ,V_P_CS_CATEGORY2   		: gfn_nvl(item.data.CS_CATEGORY2)
				    ,V_P_CS_CATEGORY3    		: gfn_nvl(item.data.CS_CATEGORY3)
				    ,V_P_CS_CATEGORY4  			: gfn_nvl(item.data.CS_CATEGORY4)
				    ,V_P_CS_CATEGORY5 			: gfn_nvl(item.data.CS_CATEGORY5)
				    ,V_P_CS_CATEGORY6			: gfn_nvl(item.data.CS_CATEGORY6)
				    ,V_P_CS_CATEGORY7			: gfn_nvl(item.data.CS_CATEGORY7)
				    ,V_P_CS_CATEGORY8			: gfn_nvl(item.data.CS_CATEGORY8)
				    ,V_P_CS_CATEGORY9			: gfn_nvl(item.data.CS_CATEGORY9)
				    ,V_P_CS_CATEGORY10			: gfn_nvl(item.data.CS_CATEGORY10)
               		,V_P_FORM_ID            	: p_formId
               		,V_P_MENU_ID            	: p_menuId
               		,V_P_PROC_ID            	: ''
               		,V_P_USERID             	: p_userId
               		,V_P_PC                 	: ''
                })
            }
            listData.push(param);
        });
        const postJsonPromise = gfn_postJSON("/co/sys/com/insertCom3400_S7.do", {listData: listData});
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
            	return true;
            } else {
                alert(data.resultMessage);
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
    
    // 판매납품처 그리드 저장 
    const fn_save_S8 = async function() {
        let salesShipToGridRowVal 		= salesShipToGrid.getRow();
        let salesShipToGridLength 		= salesShipToGrid.getUpdateData(true, 'all').length;
        let salesShipToGridUpdateData 	= salesShipToGrid.getUpdateData(true, 'all');
        if(salesShipToGridLength <= 0){
        	return true;
        }
        let listData = [];
		salesShipToGridUpdateData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                	 V_P_DEBUG_MODE_YN      	: ''
               		,V_P_LANG_ID            	: ''
               		,V_P_COMP_CODE          	: gv_ma_selectedCorpCd
               		,V_P_CLIENT_CODE        	: gv_ma_selectedClntCd
				    ,V_P_CS_CODE            	: gfn_nvl(SBUxMethod.get('CS_CODE'))
				    ,IV_P_SHIP_TO_CODE   		: gfn_nvl(item.data.SHIP_TO_CODE)
				    ,V_P_SHIP_TO_NAME    		: gfn_nvl(item.data.SHIP_TO_NAME)
				    ,V_P_CREDIT_AREA    		: gfn_nvl(item.data.CREDIT_AREA)
				    ,V_P_SALES_PERSON   		: gfn_nvl(item.data.SALES_PERSON)
				    ,V_P_ZIP_CODE    			: gfn_nvl(item.data.ZIP_CODE)
				    ,V_P_ADDRESS  				: gfn_nvl(item.data.ADDRESS)
				    ,V_P_SHIP_TO_TEL 			: gfn_nvl(item.data.SHIP_TO_TEL)
				    ,V_P_TRANS_PATH_CD			: gfn_nvl(item.data.TRANS_PATH_CD)
				    ,V_P_DEST_CD				: gfn_nvl(item.data.DEST_CD)
				    ,IV_P_SHIP_ORD_CODE			: gfn_nvl(item.data.SHIP_ORD_CODE)
               		,V_P_FORM_ID            	: p_formId
               		,V_P_MENU_ID            	: p_menuId
               		,V_P_PROC_ID            	: ''
               		,V_P_USERID             	: p_userId
               		,V_P_PC                 	: ''
                })
            }
            listData.push(param);
        });
        const postJsonPromise = gfn_postJSON("/co/sys/com/insertCom3400_S8.do", {listData: listData});
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
            	return true;
            } else {
                alert(data.resultMessage);
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
    
    // 매핑이력 그리드 저장 
    const fn_save_S9 = async function() {
        let mappingGridRowVal 		= mappingGrid.getRow();
        let mappingGridLength 		= mappingGrid.getUpdateData(true, 'all').length;
        let mappingGridUpdateData 	= mappingGrid.getUpdateData(true, 'all');
        if(mappingGridLength <= 0){
        	return true;
        }
        let listData = [];
        mappingGridUpdateData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                	 V_P_DEBUG_MODE_YN      	: ''
               		,V_P_LANG_ID            	: ''
               		,V_P_COMP_CODE          	: gv_ma_selectedCorpCd
               		,V_P_CLIENT_CODE        	: gv_ma_selectedClntCd
				    ,V_P_MAP_TYPE   			: gfn_nvl(item.data.MAP_TYPE)
				    ,V_P_ASIS_CS_CODE    		: gfn_nvl(item.data.ASIS_CS_CODE)
				    ,V_P_CS_CODE    			: gfn_nvl(item.data.CS_CODE)
				    ,V_P_CS_NAME   				: gfn_nvl(item.data.CS_NAME)
				    ,V_P_BIZ_REGNO    			: gfn_nvl(item.data.BIZ_REGNO)
               		,V_P_FORM_ID            	: p_formId
               		,V_P_MENU_ID            	: p_menuId
               		,V_P_PROC_ID            	: ''
               		,V_P_USERID             	: p_userId
               		,V_P_PC                 	: ''
                })
            }
            listData.push(param);
        });
        const postJsonPromise = gfn_postJSON("/co/sys/com/insertCom3400_S9.do", {listData: listData});
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
            	return true;
            }else{
                alert(data.resultMessage);
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
     * 주민번호 정규식
     */
    function fn_socialRegex(regexString) {
    	
    	regexString = regexString.replaceAll('-', '');
        if(regexString.length != 13) {
        	return false;
        }
        
        const regex 		= /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])\d{7}$/;
        const todayYear		= gfn_dateToYear(new Date()).toString().substr(-2);
        const yearNum		= regexString.substr(0, 2);
        const gender 		= regexString.substr(6, 1);
        
        if (gender == '1' || gender == '2') {
        	if (yearNum < todayYear) {
        		return false;
        	}
        } else if (gender == '3' || gender == '4') {
        	if (yearNum > todayYear) {
        		return false;
        	}
        } else {
        	return false;
        }

        if (!regex.test(regexString)) {
        	return false;
        }
        return true;
	}   
    
    /**
     * 사업자번호 정규식
     */
    function fn_compRegNoRegex(regexString) {
   	    const regex = /^\d{3}-\d{2}-\d{5}$/;

   	    if (!regex.test(regexString)) {
   	        return false;
   	    }
   	    regexString = regexString.replace(/-/g, '');

   	    const weight = [1, 3, 7, 1, 3, 7, 1, 3, 5];
   	    let sum = 0;
   	    for (let i = 0; i < 9; i++) {
   	        sum += parseInt(regexString[i]) * weight[i];
   	    }
   	    const checkDigit = (10 - ((sum + Math.floor((parseInt(regexString[8]) * 5) / 10)) % 10)) % 10;
   	    
   	    if(checkDigit === parseInt(regexString[9])){
   	    	return true;
   	    }else{
   	    	return false;
   	    }
   	}
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>