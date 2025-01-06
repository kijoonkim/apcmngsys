 
<%
/**
 * @Class Name 		: fia4300.jsp
 * @Description 	: 매각/폐기내역 등록
 * @author 			:
 * @since 			: 2024.06.28
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.06.28   	장성주		최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>title : 매각/폐기내역 등록</title>
<%@ include file="../../../../frame/inc/headerMeta.jsp"%>
<%@ include file="../../../../frame/inc/headerScriptMa.jsp"%>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header"
				style="display: flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title">
						▶
						<c:out value='${menuNm}'></c:out>
					</h3>
					<!-- 매각/폐기내역 등록  -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCreateAccount" name="btnCreateAccount"
						uitype="normal" text="전표생성" class="btn btn-sm btn-outline-danger"
						onclick="btnAccountClick"></sbux-button>
					<sbux-button id="btnCancelAccount" name="btnCancelAccount"
						uitype="normal" text="전표취소" class="btn btn-sm btn-outline-danger"
						onclick="btnCancelClick"></sbux-button>
					<sbux-button id="btnDisposalSearch" name="btnDisposalSearch"
						uitype="normal" text="처분 전표 조회"
						class="btn btn-sm btn-outline-danger" onclick="btnDisposalClick"></sbux-button>
					<sbux-button id="btnExpenseSearch" name="btnExpenseSearch"
						uitype="normal" text="비용 전표 조회"
						class="btn btn-sm btn-outline-danger" onclick="fn_expenseSearch"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<div class="box-search-ma">
				<!--[pp] 검색 -->
				<!--[APC] START -->
				<div>
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp"%>
				</div>
				<!--[APC] END -->
 
				<table id="topTable" class="table table-bordered tbl_fixed table-search-ma">
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
							<th scope="row" class="th_bg_search">APC</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-fiOrgCode" uitype="single" jsondata-ref="jsonAcntgUnit" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg_search">사업장</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
 
								<div class="dropdown">
									<button style="width: 160px; text-align: left"
										class="btn btn-sm btn-light dropdown-toggle " type="button"
										id="srch-slt-siteCode" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">
										<font>선택</font> <i style="padding-left: 10px"
											class="sbux-sidemeu-ico fas fa-angle-down"></i>
									</button>
									<div class="dropdown-menu bplc"
										aria-labelledby="srch-slt-siteCode"
										style="width: 250px; height: 150px; padding-top: 0px; overflow: auto">
									</div>
								</div>
							</td>
							<td></td>
 
						</tr>
						<tr>
							<th scope="row" class="th_bg_search">처분일</th>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-disposalDateFrom"
									name="srch-dtp-disposalDateFrom" uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast table-datepicker-ma"
									onchange="fn_dtpChange(srch-dtp-disposalDateFrom)"></sbux-datepicker>
							</td>
							<td>-</td>
							<td colspan="1" class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-disposalDateTo"
									name="srch-dtp-disposalDateTo" uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast table-datepicker-ma"
									onchange="fn_dtpChange(srch-dtp-disposalDateTo)"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg_search">처분유형</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-disposalType"
									name="srch-slt-disposalType" class="form-control input-sm"
									uitype="single" jsondata-ref="jsonDspsUnit"
									onchange="cbodisposal_type_EditValueChanged(srch-slt-disposalType)"></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg_search">회계기준</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-acctRuleCodeP"
									name="srch-slt-acctRuleCodeP" class="form-control input-sm"
									uitype="single" jsondata-ref="jsonAcntgCrtr"></sbux-select>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg_search">거래처</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<div style="display:flex;float:left;vertical-align:middle;width:100%">
									<sbux-input uitype="text" id="srch-inp-csCode"
										name="srch-inp-csCode" class="form-control input-sm"></sbux-input>
									<font style="width:5px"></font>
									<sbux-button
										id="BTN_POP1"
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_cnptPopup('srch-inp-csName')">
									</sbux-button>
									<font style="width:5px"></font>
									<sbux-input style="width:100%" id="srch-inp-csName" uitype="text" class="form-control input-sm"></sbux-input>
								</div>
							</td>
 
							<td></td>
							<th scope="row" class="th_bg_search">담당부서</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<div style="display:flex;float:left;vertical-align:middle;width:100%">
									<sbux-input uitype="text" id="srch-inp-deptCode"
										name="srch-inp-deptCode" class="form-control input-sm"></sbux-input>
									<font style="width:5px"></font>
									<sbux-button
										id="BTN_POP2"
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_tkcgDeptPopup('srch-inp-deptName')">
									</sbux-button>
									<font style="width:5px"></font>
									<sbux-input style="width:100%" id="srch-inp-deptName" uitype="text" class="form-control input-sm"></sbux-input>
								</div>
							</td>
 
							<td></td>
							<th scope="row" class="th_bg_search">담당자</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<div style="display:flex;float:left;vertical-align:middle;width:100%">
									<sbux-input uitype="text" id="srch-inp-deptCode"
										name="srch-inp-empCode" class="form-control input-sm"></sbux-input>
									<font style="width:5px"></font>
									<sbux-button
										id="BTN_POP3"
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_picPopup('srch-inp-empName')">
									</sbux-button>
									<font style="width:5px"></font>
									<sbux-input style="width:100%" id="srch-inp-empName" uitype="text" class="form-control input-sm"></sbux-input>
								</div>
							</td>
 
 
						</tr>
					</tbody>
				</table>
			</div>
 
				<div class="row">
					<div class="ad_tbl_top">
						<div class="ad_tbl_count">
							<li><span>자산처분 리스트</span></li>
						</div>
					</div>
 
 
					<div id="sb-area-grdAstDsps" style="height: 258px; width: 100%"></div>
 
				</div>
				<sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="webacc"
					is-scrollable="false" jsondata-ref="tabJsonData"> </sbux-tabs>
 
				<div class="tab-content">
					<div id="astTab">
						<table id="astTable" class="table table-bordered tbl_fixed">
							<caption>자산내역</caption>
							<colgroup>
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
 
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
 
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
 
								<col style="width: 8%">
								<col style="width: 8%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="th_bg">처분번호</th>
									<td class="td_input" style="border-right: hidden;"><sbux-input
											id="srch-ast-assetDisposalNo" name="srch-ast-assetDisposalNo"
											class="form-control input-sm" uitype="text"
											onchange="fn_dspsNoChange(srch-ast-assetDisposalNo)" group-id="group1"></sbux-input>
									</td>
 
									<th scope="row" class="th_bg">회계기준</th>
									<td class="td_input" style="border-right: hidden;"><sbux-select
											id="srch-ast-acctRuleCode" name="srch-ast-acctRuleCode"
											class="form-control input-sm inpt_data_reqed" uitype="single"
											jsondata-ref="jsonAcntgCrtr" group-id="group1">
										</sbux-input></td>
									<th scope="row" class="th_bg acqsAmt1">취득가액</th>
									<td class="td_input acqsAmt1" style="border-right: hidden;">
										<sbux-input id="srch-ast-acquisitionAmount1"
											name="srch-ast-acquisitionAmount1"
											class="form-control input-sm inpt_data_reqed"
											init="0"
											uitype="text" group-id="group1"></sbux-input>
									</td>
 
									<th scope="row" class="th_bg">상각누계액</th>
									<td class="td_input" style="border-right: hidden;"><sbux-input
											id="srch-ast-accumDepr" name="srch-ast-accumDepr"
											class="form-control input-sm"
											uitype="text"
											init="0"
											group-id="group1"></sbux-input></td>
									<th scope="row" class="th_bg group2" hidden>취득가액</th>
									<td class="td_input group2" style="border-right: hidden;"hidden>
										<sbux-input id="srch-ast-acquisitionAmount2"
											name="srch-ast-acquisitionAmount2"
											class="form-control input-sm"
											init="0"
											uitype="text" group-id="group1"></sbux-input></td>
 
									<th scope="row" class="th_bg group2" hidden>기초취득가액</th>
									<td class="td_input group2" style="border-right: hidden;" hidden>
										<sbux-input id="srch-ast-beginAcquisitionAmount"
											name="srch-ast-beginAcquisitionAmount"
											class="form-control input-sm"
											init="0"
											uitype="text" group-id="group1"></sbux-input></td>
 
								</tr>
								<tr>
									<th scope="row" class="th_bg">처분유형</th>
									<td class="td_input" style="border-right: hidden;"><sbux-select
											id="srch-ast-disposalType" name="srch-ast-disposalType"
											class="form-control input-sm inpt_data_reqed" uitype="single"
											jsondata-ref="jsonDspsUnit" group-id="group1"
											onchange="fn_cbodisposalTypeEditValueChanged(srch-slt-disposalType)">
										</sbux-input></td>
 
									<th scope="row" class="th_bg">처분일</th>
									<td class="td_input" style="border-right: hidden;"><sbux-datepicker
											id="srch-dtp-disposalDate" name="srch-dtp-disposalDate"
											uitype="popup" date-format="yyyy-mm-dd"
											class="form-control input-sm input-sm-ast table-datepicker-ma inpt_data_reqed"
											callback-after-close="fn_dspsCloseAfter()" group-id="group1"
											onchange="ymddisposal_date_Closed(srch-dtp-disposalDate)"></sbux-datepicker>
 
									</td>
									<th scope="row" class="th_bg ntAsstncAmt2">국고보조금</th>
									<td class="td_input ntAsstncAmt2" style="border-right: hidden;">
										<sbux-input id="srch-out-subsidiesAmount"
											init="0"
											name="srch-out-subsidiesAmount" class="form-control input-sm"
											uitype="text" group-id="group1"></sbux-input>
									</td>
 
									<th scope="row" class="th_bg asstncDprcAtAmt">보조금상각누계액</th>
									<td class="td_input asstncDprcAtAmt"
										style="border-right: hidden;"><sbux-input
											id="srch-ast-subsidiesAccDepr"
											name="srch-ast-subsidiesAccDepr"
											init="0"
											class="form-control input-sm" uitype="text" group-id="group1"></sbux-input>
									</td>
									<th scope="row" class="th_bg group2" hidden>국고보조금</th>
									<td class="td_input group2" style="border-right: hidden;"
										hidden><sbux-input id="srch-num-subsidiesAmount"
											name="srch-num-subsidiesAmount" class="form-control input-sm"
											uitype="text"
											init="0"
											uitype="text" group-id="group1"></sbux-input></td>
 
									<th scope="row" class="th_bg group2" hidden>기초국고보조금</th>
									<td class="td_input group2" style="border-right: hidden;"
										hidden><sbux-input id="srch-ast-beginSubsidiesAmount"
											name="srch-ast-beginSubsidiesAmount"
											class="form-control input-sm" uitype="text"
											init="0"
											uitype="text" group-id="group1"></sbux-input></td>
 
								</tr>
								<tr>
									<th scope="row" class="th_bg">자산</th>
									<td colspan="3" class="td_input" style="border-right: hidden;">
										<div style="display:flex;float:left;vertical-align:middle;width:100%">
											<sbux-input uitype="text" id="srch-ast-assetNo"
												name="srch-ast-assetNo" class="form-control input-sm inpt_data_reqed" group-id="group1"></sbux-input>
											<font style="width:5px"></font>
											<sbux-button
												id="BTN_POP4"
												class="btn btn-xs btn-outline-dark"
												text="…" uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_astPopup">
											</sbux-button>
											<font style="width:5px"></font>
											<sbux-input style="width:100%" id="srch-ast-assetName" uitype="text" class="form-control input-sm inpt_data_reqed"></sbux-input>
										</div>
									</td>
 
 
									<th scope="row" class="th_bg">감가상각비</th>
									<td class="td_input" style="border-right: hidden;"><sbux-input
											id="srch-ast-depreciationAmount"
											name="srch-ast-depreciationAmount"
											class="form-control input-sm" uitype="text"
											init="0"
											group-id="group1">
											</sbux-input>
									</td>
									<th scope="row" class="th_bg">장부가액</th>
									<td class="td_input" style="border-right: hidden;"><sbux-input
											id="srch-ast-bookValue" name="srch-ast-bookValue"
											class="form-control input-sm inpt_data_reqed"
											init="0"
											uitype="text" group-id="group1" required></sbux-input></td>
									<th scope="row" class="th_bg group2" hidden>감가상각누계액</th>
									<td class="td_input group2" style="border-right: hidden;"
										hidden><sbux-input id="srch-ast-accumulatedDepreciation"
											name="srch-ast-accumulatedDepreciation"
											class="form-control input-sm" uitype="text"
											init="0"
											uitype="text"
											group-id="group1"></sbux-input></td>
 
									<th scope="row" class="th_bg group2" hidden>처분비율</th>
									<td class="td_input group2" style="border-right: hidden;"
										hidden><sbux-input id="srch-ast-acquisitionRate"
											name="srch-ast-acquisitionRate" class="form-control input-sm"
											init="0"
											uitype="text"
											group-id="group1" ></sbux-input></td>
 
								</tr>
 
								<tr>
									<th scope="row" class="th_bg">사업장</th>
									<td colspan="2" class="td_input" style="border-right: hidden;">
										<div class="dropdown">
											<button style="width: 160px; text-align: left"
												class="btn btn-sm btn-light dropdown-toggle " type="button"
												id="srch-ast-siteCode" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false">
												<font>선택</font> <i style="padding-left: 10px"
													class="sbux-sidemeu-ico fas fa-angle-down"></i>
											</button>
											<div class="dropdown-menu bplc"
												aria-labelledby="srch-ast-siteCode"
												style="width: 150px; height: 150px; padding-top: 0px; overflow: auto">
											</div>
										</div>
									</td>
 
									<th scope="row" class="th_bg intlDspsNo" hidden>당초처분번호</th>
									<td class="td_input intlDspsNo" style="border-right: hidden;"
										hidden><sbux-input id="srch-ast-originalAssetDispNo"
											name="srch-ast-originalAssetDispNo"
											class="form-control input-sm" uitype="hidden" group-id="group1"></sbux-input>
									</td>
 
									<th scope="row" class="th_bg">국고보조금상각</th>
									<td class="td_input" style="border-right: hidden;"><sbux-input
											id="srch-ast-subsidiesDepr" name="srch-ast-subsidiesDepr"
											class="form-control input-sm" uitype="text" init="0" group-id="group1"></sbux-input></td>
									<td colspan="2" class="td_input" style="border-right: hidden;"
										hidden><sbux-input id="srch-ast-subsidiesDeprName"
											name="srch-ast-subsidiesDeprName"
											class="form-control input-sm" uitype="hidden" group-id="group1"></sbux-input>
									</td>
 
									<th scope="row" class="th_bg group2" hidden>보조금상각누계액</th>
									<td class="td_input group2" style="border-right: hidden;"
										hidden><sbux-input id="srch-ast-subsidiesAccDepreciation"
											name="srch-ast-subsidiesAccDepreciation"
											class="form-control input-sm" uitype="text"
											init="0"
											group-id="group1"></sbux-input></td>
 
									<th scope="row" class="th_bg group2" hidden>처분금액</th>
									<td class="td_input group2" style="border-right: hidden;"
										hidden><sbux-input id="srch-ast-acquisitionAmountEvent"
											name="srch-ast-acquisitionAmountEvent"
											class="form-control input-sm" uitype="text"
											onchange="numout_acquisition_amount_event_EditValueModified(srch-ast-acquisitionAmountEvent)"
											init="0"
											group-id="group1"></sbux-input></td>
 
								</tr>
								<tr>
									<th scope="row" class="th_bg">비고</th>
									<td colspan="6" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-ast-memomemo"
											name="srch-ast-memomemo" class="form-control input-sm"
											uitype="text" group-id="group1"></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">처분 ▶ 소스ID</th>
									<td class="td_input" style="border-right: hidden;"><sbux-input
											id="srch-ast-sourceId" name="srch-ast-sourceId"
											class="form-control input-sm" uitype="text" group-id="group1"></sbux-input></td>
									<th scope="row" class="th_bg">전표명</th>
									<td colspan="4" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-ast-docName" name="srch-ast-docName"
											class="form-control input-sm" uitype="text" group-id="group1"
											wrap-style="width:100%"></sbux-input>
									</td>
									<th scope="row" class="th_bg">작성자</th>
									<td class="td_input" style="border-right: hidden;"><sbux-input
											id="srch-ast-insetUserName" name="srch-ast-insetUserName"
											class="form-control input-sm" uitype="text" group-id="group1"></sbux-input></td>
									<th scope="row" class="th_bg" hidden>전표명</th>
									<td class="td_input" style="border-right: hidden;"><sbux-input
											id="srch-ast-docBatchNo1" name="srch-ast-docBatchNo1"
											class="form-control input-sm" uitype="hidden" group-id="group1"></sbux-input>
									</td>
 
								</tr>
								<tr>
									<th scope="row" class="th_bg">처분 ▶ 소스ID</th>
									<td class="td_input" style="border-right: hidden;"><sbux-input
											id="srch-ast-sourceIdDisposal"
											name="srch-ast-sourceIdDisposal"
											class="form-control input-sm" uitype="text" group-id="group1"></sbux-input></td>
									<th scope="row" class="th_bg">전표명</th>
									<td colspan="4" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-ast-docNameDisposal"
											name="srch-ast-docNameDisposal" class="form-control input-sm"
											uitype="text" wrap-style="width:100%" group-id="group1"></sbux-input>
									</td>
									<th scope="row" class="th_bg">작성자</th>
									<td class="td_input" style="border-right: hidden;"><sbux-input
											id="srch-ast-insetUserNameDisposal"
											name="srch-ast-insetUserNameDisposal"
											class="form-control input-sm" uitype="text" group-id="group1"></sbux-input></td>
									<th scope="row" class="th_bg" hidden>전표명</th>
									<td class="td_input" style="border-right: hidden;"><sbux-input
											id="srch-ast-docBatchNo2" name="srch-ast-docBatchNo2"
											class="form-control input-sm" uitype="hidden" group-id="group1"></sbux-input>
									</td>
 
								</tr>
 
							</tbody>
						</table>
					</div>
					<div id="dspsTab">
						<table id="dspsTable" class="table table-bordered tbl_fixed">
							<caption>처분내역</caption>
							<colgroup>
 
 
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
 
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
 
								<col style="width: 8%">
								<col style="width: 8%">
								<col style="width: 8%">
 
								<col style="width: 8%">
								<col style="width: 8%">
 
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="th_bg">거래처</th>
 
 
									<td colspan="3" class="td_input" style="border-right: hidden;">
										<div style="display:flex;float:left;vertical-align:middle;width:100%">
											<sbux-input uitype="text" id="srch-dsps-csCode"
												name="srch-dsps-csCode" class="form-control input-sm inpt_data_reqed" group-id="dsps1"></sbux-input>
											<font style="width:5px"></font>
											<sbux-button
												id="BTN_POP5"
												class="btn btn-xs btn-outline-dark"
												text="…" uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_cnptPopup('srch-dsps-csName')">
											</sbux-button>
											<font style="width:5px"></font>
											<sbux-input style="width:100%" id="srch-dsps-csName" uitype="text" class="form-control input-sm inpt_data_reqed" group-id="dsps1"></sbux-input>
										</div>
									</td>
 
									<th scope="row" class="th_bg">통화</th>
									<td colspan="2" class="td_input" style="border-right: hidden;">
										<div class="dropdown">
											<button style="width: 160px; text-align: left"
												class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed"
												type="button" id="srch-dsps-currencyCode"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<font>선택</font> <i style="padding-left: 10px"
													class="sbux-sidemeu-ico fas fa-angle-down"></i>
											</button>
											<div class="dropdown-menu currency"
												aria-labelledby="srch-dsps-currencyCode"
													style="width: 250px; height: 150px; padding-top: 0px; overflow: auto">
											</div>
										</div>
									</td>
 
 
									<th scope="row" class="th_bg">신고사업장</th>
									<td colspan="2" class="td_input" style="border-right: hidden;">
										<sbux-select id="srch-dsps-taxSiteCode"
											name="srch-dsps-taxSiteCode" class="form-control input-sm inpt_data_reqed"
											uitype="single" jsondata-ref="jsonDclrBplc" group-id="dsps1"
											required></sbux-select>
									</td>
 
									<th scope="row" class="th_bg">장부가액</th>
									<td colspan="3" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-dsps-bookValueCopy"
											name="srch-dsps-bookValueCopy" class="form-control input-sm"
											init="0"
											uitype="text"></sbux-input>
									</td>
								</tr>
 
								<tr>
									<th scope="row" class="th_bg">담당부서</th>
 
									<td colspan="3" class="td_input" style="border-right: hidden;">
										<div style="display:flex;float:left;vertical-align:middle;width:100%">
											<sbux-input uitype="text" id="srch-dsps-deptCode"
												name="srch-dsps-deptCode" class="form-control input-sm inpt_data_reqed" group-id="dsps1"></sbux-input>
											<font style="width:5px"></font>
											<sbux-button
												id="BTN_POP6"
												class="btn btn-xs btn-outline-dark"
												text="…" uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_tkcgDeptPopup('srch-dsps-deptName')">
											</sbux-button>
											<font style="width:5px"></font>
											<sbux-input style="width:100%" id="srch-dsps-deptName" uitype="text" class="form-control input-sm inpt_data_reqed" group-id="dsps1"></sbux-input>
										</div>
									</td>
 
									<th scope="row" class="th_bg">환율</th>
									<td colspan="2" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-dsps-exchangeRate"
											name="srch-dsps-exchangeRate"
											class="form-control input-sm inpt_data_reqed inpt_data_reqed" uitype="text"
											group-id="dsps1"
											onchage="numexchange_rate_EditValueChanged(srch-dsps-exchangeRate)">
										</sbux-select>
									</td>
 
 
									<th scope="row" class="th_bg">부가세유형</th>
									<td class="td_input" style="border-right: hidden;">
										<div class="dropdown">
											<button
												style="width: 100px; text-align: left; overflow: hidden"
												class="btn btn-sm btn-light dropdown-toggle" type="button"
												id="srch-dsps-vatType" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false">
												<font>선택</font> <i style="padding-left: 10px"
													class="sbux-sidemeu-ico fas fa-angle-down"></i>
											</button>
											<div class="dropdown-menu vat"
												aria-labelledby=srch-dsps-vatType
												style="width: 100px; height: 150px; padding-top: 0px; overflow: auto">
											</div>
										</div>
									</td>
									<td class="td_input" style="border-right: hidden;">
									<sbux-input
											id="srch-dsps-vatRate" name="srch-dsps-vatRate"
											class="form-control input-sm" uitype="text" readonly></sbux-input>
									</td>
 
									<th scope="row" class="th_bg">처분손익</th>
									<td colspan="3" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-dsps-disposalPl"
											name="srch-dsps-disposalPl"
											class="form-control input-sm inpt_data_reqed" uitype="text"
											init="0"
											group-id="dsps1"></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg">담당자</th>
									<td colspan="3" class="td_input" style="border-right: hidden;">
										<div style="display:flex;float:left;vertical-align:middle;width:100%">
											<sbux-input uitype="text" id="srch-dsps-empCode"
												name="srch-dsps-empCode" class="form-control input-sm inpt_data_reqed" group-id="dsps1"></sbux-input>
											<font style="width:5px"></font>
											<sbux-button
												id="BTN_POP8"
												class="btn btn-xs btn-outline-dark"
												text="…" uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_picPopup('srch-dsps-empName')">
											</sbux-button>
											<font style="width:5px"></font>
											<sbux-input style="width:100%" id="srch-dsps-empName" uitype="text" class="form-control input-sm inpt_data_reqed" group-id="dsps1"></sbux-input>
										</div>
									</td>
									<th scope="row" class="th_bg">매각금액</th>
									<td colspan="2" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-dsps-disposalOriginalAmount"
											name="srch-dsps-disposalOriginalAmount"
											class="form-control input-sm inpt_data_reqed"
											init="0"
											uitype="text" group-id="dsps1">
										</sbux-select>
									</td>
 
 
									<th scope="row" class="th_bg">부가세</th>
									<td colspan="2" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-dsps-vatAmount"
											name="srch-dsps-vatAmount"
											class="form-control input-sm inpt_data_reqed" uitype="text"
											init="0"
											group-id="dsps1"></sbux-input>
									</td>
 
									<th scope="row" class="th_bg">처분수량</th>
									<td colspan="3" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-dsps-disposalQty"
											name="srch-dsps-disposalQty" class="form-control input-sm"
											init="0"
											uitype="text"></sbux-input>
									</td>
 
								</tr>
 
								<tr>
									<th scope="row" class="th_bg">원가중심점명</th>
									<td colspan="3" class="td_input" style="border-right: hidden;">
										<div style="display:flex;float:left;vertical-align:middle;width:100%">
											<sbux-input uitype="text" id="srch-dsps-costCenterCode"
												name="srch-dsps-costCenterCode" class="form-control input-sm inpt_data_reqed" group-id="dsps1"></sbux-input>
											<font style="width:5px"></font>
											<sbux-button
												id="BTN_POP9"
												class="btn btn-xs btn-outline-dark"
												text="…" uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_costCenterPopup">
											</sbux-button>
											<font style="width:5px"></font>
											<sbux-input style="width:100%" id="srch-dsps-costCenterName" uitype="text" class="form-control input-sm inpt_data_reqed" group-id="dsps1"></sbux-input>
										</div>
									</td>
 
									<th scope="row" class="th_bg">환산금액</th>
									<td colspan="2" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-dsps-dispFunctionalAmt"
											name="srch-dsps-dispFunctionalAmt"
											class="form-control input-sm inpt_data_reqed"
											init="0"
											uitype="text" group-id="dsps1"></sbux-input>
									</td>
									<th scope="row" class="th_bg">금액합계</th>
									<td colspan="2" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-dsps-totalAmount"
											name="srch-dsps-totalAmount"
											class="form-control input-sm inpt_data_reqed"
											init="0"
											uitype="text" group-id="dsps1"></sbux-input>
									</td>
								</tr>
 
								<tr>
									<th scope="row" class="th_bg">비용거래처</th>
 
									<td colspan="3" class="td_input" style="border-right: hidden;">
										<div style="display:flex;float:left;vertical-align:middle;width:100%">
											<sbux-input uitype="text" id="srch-dsps-expenseCsCode"
												name="srch-dsps-expenseCsCode" class="form-control input-sm" ></sbux-input>
											<font style="width:5px"></font>
											<sbux-button
												id="BTN_POP10"
												class="btn btn-xs btn-outline-dark"
												text="…" uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_cstCnptPopup">
											</sbux-button>
											<font style="width:5px"></font>
											<sbux-input style="width:100%" id="srch-dsps-expenseCsName" uitype="text" class="form-control input-sm" ></sbux-input>
										</div>
									</td>
 
 
									<th scope="row" class="th_bg">통화</th>
									<td colspan="2" class="td_input" style="border-right: hidden;">
										<div class="dropup">
											<button style="width: 160px; text-align: left"
												class="btn btn-sm btn-light dropdown-toggle " type="button"
												id="srch-dsps-expenseCurrencyCode" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false">
												<font>선택</font> <i style="padding-left: 10px"
													class="sbux-sidemeu-ico fas fa-angle-down"></i>
											</button>
											<div class="dropdown-menu"
												aria-labelledby="srch-dsps-expenseCurrencyCode"
												style="width: 250px; height: 150px; padding-top: 0px; overflow: auto">
											</div>
										</div>
									</td>
									<th scope="row" class="th_bg">비용부가세유형</th>
									<td class="td_input" style="border-right: hidden;">
										<div class="dropdown">
											<button
												style="width: 100px; text-align: left; overflow: hidden"
												class="btn btn-sm btn-light dropdown-toggle " type="button"
												id="srch-dsps-expenseVatType" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false">
												<font>선택</font> <i style="padding-left: 10px"
													class="sbux-sidemeu-ico fas fa-angle-down"></i>
											</button>
											<div class="dropdown-menu cstVat"
												aria-labelledby="srch-dsps-expenseVatType"
												style="width: 250px; height: 150px; padding-top: 0px; overflow: auto">
											</div>
										</div>
									</td>
									<td class="td_input" style="border-right: hidden;"><sbux-input
											id="srch-dsps-expenseVatRate" name="srch-dsps-expenseVatRate"
											class="form-control input-sm" uitype="text" readonly></sbux-input>
									</td>
								</tr>
 
								<tr>
									<th scope="row" class="th_bg">처분비용계정</th>
 
									<td colspan="3" class="td_input" style="border-right: hidden;">
										<div style="display:flex;float:left;vertical-align:middle;width:100%">
											<sbux-input uitype="text" id="srch-dsps-expenseAccount"
												name="srch-dsps-expenseAccount" class="form-control input-sm" ></sbux-input>
											<font style="width:5px"></font>
											<sbux-button
												id="BTN_POP11"
												class="btn btn-xs btn-outline-dark"
												text="…" uitype="modal"
												target-id="modal-compopup1"
												onclick="fn_dspsCstCnptPopup">
											</sbux-button>
											<font style="width:5px"></font>
											<sbux-input style="width:100%" id="srch-dsps-expenseAccountName" uitype="text" class="form-control input-sm" ></sbux-input>
										</div>
									</td>
									<th scope="row" class="th_bg">환율</th>
									<td colspan="2" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-dsps-expenseExchangeRate"
											name="srch-dsps-expenseExchangeRate"
											init="0"
											class="form-control input-sm" uitype="text">
										</sbux-select>
									</td>
									<th scope="row" class="th_bg">처분비용</th>
									<td colspan="2" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-dsps-expenseAmount"
											name="srch-dsps-expenseAmount" class="form-control input-sm"
											init="0"
											uitype="text"></sbux-input>
									</td>
									<th scope="row" class="th_bg">처분비용부가세</th>
									<td colspan="3" class="td_input" style="border-right: hidden;">
										<sbux-input id="srch-dsps-expenseVatAmount"
											name="srch-dsps-expenseVatAmount"
											init="0"
											class="form-control input-sm" uitype="text"></sbux-input>
									</td>
								</tr>
 
							</tbody>
						</table>
 
					</div>
 
				</div>
 
			</div>
		</div>
	</section>
 
	<!-- 팝업 Modal -->
	<div>
		<sbux-modal style="width:800px" id="modal-compopup1"
			name="modal-compopup1" uitype="middle" header-title=""
			body-html-id="body-modal-compopup1" header-is-close-button="true"
			footer-is-close-button="false"></sbux-modal>
	</div>
	<div id="body-modal-compopup1">
		<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
	</div>
 
</body>
 
<!-- inline scripts related to this page -->
<script type="text/javascript">
	// 신규
	function cfn_add() {
		fn_hiddenChange(false);
		SBUxMethod.clearGroupData('group1');
		SBUxMethod.clearGroupData('group2');
		//SBUxMethod.refreshAll(); //refreshall을 하면 고장나버림..
	}
 
	// 그룹코드 내역, 세부코드 정보 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
			saveClick();
		}
    }
 
 
	// 마스터 그리드 삭제
	function cfn_del() {
		deleteClick()
	}
 
	// 조회
	function cfn_search() {
		fnQRY_P_FIA4300_Q();
 
	}
 
	// 조회
	function cfn_init() {
		fn_hiddenChange(true);
		SBUxMethod.clearGroupData('group1');
		SBUxMethod.clearGroupData('group2');
		//SBUxMethod.refreshAll(); //refreshall을 하면 고장나버림..
	}
 
	// ${comMenuVO.menuId}
 
 
 
	var editType			= "N";
 
	var jsonRegionCode		= [];	// 지역
 
	// common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
 
    var p_ss_languageID			= '${loginVO.maLanguageID}';
	var p_ss_defaultAcctRule 	= '${loginVO.maDefaultAcctRule}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	var p_ss_siteCode			= '${loginVO.maSiteCode}';
    //-----------------------------------------------------------
	var saveButton = true;
 
	var addButton = false;
    var deleteRowButton = false;
    var deleteButton = false;
    var previewButton = false;
    var printButton = false;
 
	var tabJsonData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "자산내역", "targetid" : "astTab", "targetvalue" : "자산내역" },
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "처분내역", "targetid" : "dspsTab", "targetvalue" : "처분내역" },
	];
 
	 $(document).ready(function () {
	      // 클릭 가능한 행에 대해 클릭 이벤트를 바인딩합니다.
	      $('.dropdown-menu.vat').on('click', '.clickable-row', function () {
	        const vatRate = $(this).find('td[cu-code="VAT_RT"]').text();
	        SBUxMethod.set("srch-dsps-vatRate",vatRate);
	      });
 
	      $('.dropdown-menu.cstVat').on('click', '.clickable-row', function () {
		        //let dropdownMenu = document.querySelector('.dropdown-menu.c');
				//let ariaLabelledBy = dropdownMenu.getAttribute('aria-labelledby');
		        const vatRate = $(this).find('td[cu-code="VAT_RT"]').text();
		        SBUxMethod.set("srch-dsps-expenseVatRate",vatRate);
	      });
 
	      $(' .dropdown-menu.currency').on('click', '.clickable-row', function () {
		        const currencyName = $(this).find('td[cu-code="CRN_CD"]').text();
		        let currency = jsonCurrency.find(item => item.value === currencyName)
 
		        let formatted = currency.BASE_SCALE.toFixed(2);
		        SBUxMethod.set("srch-dsps-exchangeRate",formatted);
	      });
 
 
	    });
 
	const onLoad = function(){
 
            fnVisivleControl(false);
            //바탕화면 설정
    //        panBase.BackColor = colpanBaseBackColor;
    //        panBase.Padding = new Padding(intpanBaseLeft, intpanBaseTop, intpanBaseRight, intpanBaseRight);
    //        panHeader.BackColor = colpanHeaderBackColor;
    //        tabInfo.BackColor = Color.Transparent;
    //        tpgInfo1.BackColor = colpanBaseBackColor;
    //        tpgInfo2.BackColor = colpanBaseBackColor;
 
 
    		  // from은 현재일 기준으로 month -1
    	      SBUxMethod.set("srch-dtp-disposalDateFrom", gfn_dateFirstYmd(new Date()));
    	      SBUxMethod.set("srch-dtp-disposalDateTo", gfn_dateToYmd(new Date()));
 
    	      // 세션정보 바인드
    //        cbocomp_code1.EditValue = SessionInfo.CompCode; 법인
    //        cbofi_org_code1.EditValue = SessionInfo.FIOrgCode;  회계단위
    //        cbosite_code.EditValue = SessionInfo.SiteCode; 사업장
    //        cbosite_code1.EditValue = SessionInfo.SiteCode; 사업장
    //        cboacct_rule_code_p.EditValue = SessionInfo.DefaultAcctRule; 회계기준
 
    //        lblorig_asset_disp_no.Visible = false; 당초처분번호
    //        txtoriginal_asset_disp_no.Visible = false;
    		 $('.td_input.intlDspsNo').hide();
	    	 $('.th_bg.intlDspsNo').hide();
 
	//        코스트센터 hidden으로 있는거 팝업 처리하는 부분이 있나봄
    //        txtcost_center_code.Properties.Popup.WhereQuery = "COST_CLASS = '2'";
    //        txtcost_center_name.Properties.Popup.WhereQuery = "COST_CLASS = '2'";
              queryClick();
 
    //        tabInfo.SelectedTabPage = tpgInfo1;
	}
 
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//법인
			gfnma_setComSelect(['srch-slt-compCode'], jsonCorp, 'L_ORG000', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CO_CD', 'CORP_NM', 'Y', ''),
			//회계기준
			gfnma_setComSelect(['srch-slt-acctRuleCodeP','srch-ast-acctRuleCode'], jsonAcntgCrtr, 'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			//gfnma_setComSelect(['srch-slt-siteCode'], jsonBplc, 'L_FIT001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			//신고사업장
			gfnma_setComSelect(['srch-dsps-taxSiteCode'], jsonDclrBplc, 'L_ORG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TX_SITE_CD', 'TX_SITE_NM', 'Y', ''),
			//부가세유형
			gfnma_setComSelect(['grdAstDsps'], jsonVatType, 'L_ORG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TX_SITE_CD', 'TX_SITE_NM', 'Y', ''),
			//사업장
			gfnma_multiSelectInit({
				target			: ['#srch-slt-siteCode','#srch-ast-siteCode']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_ORG001'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'SITE_CD'
				,colLabel		: 'SITE_NM'
				,columns		:[
		            {caption: "사업장코드",	ref: 'SITE_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "사업장명", 		ref: 'SITE_NM',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//처분유형
			gfnma_setComSelect(['srch-slt-disposalType','srch-ast-disposalType'], jsonDspsUnit, 'L_FIA009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			//gfnma_setComSelect(['srch-slt-dspsTab-currency'], jsonCurrency, 'L_FIF045', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			// 주소 ~ 매핑이력 - 자금정보 탭 통화
            gfnma_setComSelect(['srch-slt-dspsTab-currency'], jsonCurrency, 'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CRN_CD', 'CRN_NM', 'Y', ''),
			//회계단위
			gfnma_setComSelect(['srch-slt-fiOrgCode'], jsonAcntgUnit, 'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACNTG_OGNZ_CD', 'ACNTG_OGNZ_NM', 'Y', '1100'),
			//회계단위
			/* gfnma_multiSelectInit({
				target			: ['#srch-slt-fiOrgCode']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM022'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'ACNTG_OGNZ_CD'
				,colLabel		: 'ACNTG_OGNZ_NM'
				,columns		:[
		            {caption: "코드",	ref: 'ACNTG_OGNZ_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명", 		ref: 'ACNTG_OGNZ_NM',    		width:'150px',  	style:'text-align:left'}
				]
			}), */
			//통화
			gfnma_multiSelectInit({
				target			: ['#srch-dsps-expenseCurrencyCode','#srch-dsps-currencyCode']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM001'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'CRN_CD'
				,colLabel		: 'CRN_NM'
				,columns		:[
		            {caption: "통화명",	ref: 'CRN_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "비고", 		ref: 'CRN_NM',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//부가세유형
			gfnma_multiSelectInit({
				target			: ['#srch-dsps-vatType']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_SALES_VAT_TYPE'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'VAT_CD'
				,colLabel		: 'VAT_NM'
				,columns		:[
		            {caption: "코드",	ref: 'VAT_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명", 		ref: 'VAT_NM',    		width:'150px',  	style:'text-align:left'},
		            {caption: "유형", 		ref: 'VAT_TMPLT_NM',    		width:'150px',  	style:'text-align:left'},
		            {caption: "비율", 		ref: 'VAT_RT',    		width:'150px',  	style:'text-align:left'},
				]
			}),
			//비용부가세유형
			gfnma_multiSelectInit({
				target			: ['#srch-dsps-expenseVatType']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_PUR_VAT_TYPE'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'VAT_CD'
				,colLabel		: 'VAT_NM'
				,columns		:[
		            {caption: "코드",	ref: 'VAT_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "명", 		ref: 'VAT_NM',    		width:'150px',  	style:'text-align:left'},
		            {caption: "유형", 		ref: 'VAT_TMPLT_NM',    		width:'150px',  	style:'text-align:left'},
		            {caption: "비율", 		ref: 'VAT_RT',    		width:'150px',  	style:'text-align:left'},
				]
			}),
			//법인
			gfnma_multiSelectInit({
				target			: ['#srch-slt-compCode']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_ORG000'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'CO_CD'
				,colLabel		: 'CORP_NM'
				,columns		:[
		            {caption: "법인코드",	ref: 'CO_CD', 		width:'100px',  	style:'text-align:left'},
		            {caption: "법인명", 		ref: 'CORP_NM',    		width:'150px',  	style:'text-align:left'}
				]
			})
 
 
 
		]);
 
		SBUxMethod.refresh('srch-slt-disposalType');
		SBUxMethod.refresh('srch-slt-acctRuleCode');
		SBUxMethod.set("srch-dtp-disposalDateFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-disposalDateTo", gfn_dateLastYmd(new Date()));
 
 
		//초기값 IFRS
		SBUxMethod.set("srch-slt-acctRuleCodeP",p_ss_defaultAcctRule);
		SBUxMethod.set("srch-slt-acctRuleCode",p_ss_defaultAcctRule)
		SBUxMethod.set("srch-slt-fiOrgCode",p_ss_fiOrgCode)
	}
 
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
 
    	fn_initSBSelect();
    	fn_createGrid();
    	//fn_search();
 
		//재직상태
		//gfnma_getComSelectList('L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM',
		//	function(list){
		//		$('#SRCH_EMP_BTN').click(function(){
		//			fn_compopup1(list);
		//		});
		//	}
		//)
    });
 
    //grid 초기화
    var grdAstDsps; 			// 그리드를 담기위한 객체 선언
    var jsonAstDsps = []; 	// 그리드의 참조 데이터 주소 선언
 
    //json
    var jsonCorp = []; //법인
	var jsonAcntgUnit = []; //회계단위
	var jsonBplc = []; // 사업장
	var jsonDspsUnit = []; //처분유형
	var jsonAcntgCrtr = []; // 회계기준
	var jsonVatType = []; //부가세유형
	var jsonCurrency = []; //통화
	var jsonDclrBplc = []; //신고사업장
 
    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdAstDsps';
	    SBGridProperties.id 				= 'grdAstDsps';
	    SBGridProperties.jsonref 			= 'jsonAstDsps';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.total = {
				type: 'grand',
				position: 'bottom',
				columns: {
					standard: [7],
					sum: [8,9,10,11,12,13,14,15,16,17,18,19,20]
				},
			grandtotalrow: {
				titlecol: 7,
				titlevalue: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				8: '#,###',
				9: '#,###',
				10: '#,###',
				11: '#,###',
				12: '#,###',
				13: '#,###',
				14: '#,###',
				15: '#,###',
				16: '#,###',
				17: '#,###',
				16 : '#,###',
				17 : '#,###',
				18 : '#,###',
				19 : '#,###',
				20 : '#,###',
 
			}
		};
        SBGridProperties.columns = [
            {caption: ["처분일"],			ref: 'disposalDate', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["처분유형"], 		ref: 'disposalType',    	type : 'combo' , typeinfo : {ref:'jsonDspsUnit', label:'label', value:'value'},  	width:'100px',  	style:'text-align:left'},
            {caption: ["거래처"],  			ref: 'csName',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부가세율"],      	ref: 'vatType', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["통화"],			ref: 'currencyCode',	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환율"],			ref: 'exchangeRate',	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["매각금액"],			ref: 'disposalOriginalAmount',	type:'output',  	width:'100px',format : {type:'number', rule:'#,###'},  	style:'text-align:left'},
            {caption: ["환산금액"], 		ref: 'dispFunctionalAmt', 				type:'output',  	width:'100px',format : {type:'number', rule:'#,###'},  	style:'text-align:left'},
            {caption: ["부가세"], 			ref: 'vatAmount',  			type:'output',  	width:'100px',format : {type:'number', rule:'#,###'},  	style:'text-align:left'},
        	{caption: ["금액합계"], 		ref: 'totalAmount', 				type:'output',		width:'80px',format : {type:'number', rule:'#,###'},		style:'text-align:center'},
            {caption: ["취득가액"], 		ref: 'outAcquisitionAmount', 				type:'output',		width:'80px',format : {type:'number', rule:'#,###'},		style:'text-align:center'},
            {caption: ["국고보조금"], 		ref: 'outSubsidiesAmount', 				type:'output',		width:'80px',format : {type:'number', rule:'#,###'},		style:'text-align:center'},
            {caption: ["감가상각비"], 		ref: 'outDepreciationAmount', 				type:'output',		width:'80px',format : {type:'number', rule:'#,###'},		style:'text-align:center'},
            {caption: ["국고보조금상각비"],ref: 'outSubsidiesDepr', 				type:'output',		width:'80px',format : {type:'number', rule:'#,###'},		style:'text-align:center'},
            {caption: ["감가상각누계액"], 	ref: 'outAccumDepr', 				type:'output',		width:'80px',format : {type:'number', rule:'#,###'},		style:'text-align:center'},
            {caption: ["국고보조금상각누계액"], 		ref: 'outSubsidiesAccDepr', 				type:'output',	format : {type:'number', rule:'#,###'},	width:'80px',		style:'text-align:center'},
            {caption: ["장부가액"], 		ref: 'bookValue', 				type:'output',		width:'80px',format : {type:'number', rule:'#,###'},		style:'text-align:center'},
            {caption: ["매각(폐기)손익"], 	ref: 'disposalPl', 				type:'output',		width:'80px',format : {type:'number', rule:'#,###'},		style:'text-align:center'},
            {caption: ["처분비용"], 		ref: 'expenseAmount', 				type:'output',		width:'80px',format : {type:'number', rule:'#,###'},		style:'text-align:center'},
            {caption: ["처분비용부가세"], 	ref: 'expenseVatAmount', 				type:'output',		width:'80px',format : {type:'number', rule:'#,###'},		style:'text-align:center'},
            {caption: ["비용거래처"], 		ref: 'expenseCsCode', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용거래처명"], 	ref: 'expenseCsName', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용부가세유형"], 	ref: 'expenseVatType', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용부가세비율"], 	ref: 'expenseVatRate', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용부가세계정"], 	ref: 'expenseAccount', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용부가세계정명"], 	ref: 'expenseAccountName', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용통화"], 		ref: 'expensCurrencyCode', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["비용환율"], 		ref: 'costExchRt', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["회계기준"], 		ref: 'expenseExchangeRate', 				type:'output',		width:'80px',		style:'text-align:center'},
            {caption: ["처분수량"], 		ref: 'disposalQty', 				type:'output',		width:'80px',		style:'text-align:center'},
        ];
 
        grdAstDsps = _SBGrid.create(SBGridProperties);
        grdAstDsps.bind('click', 'fnFocuseRowChanged');
    }
 
 
    // fnQRY_P_FIA4300_Q
    //workType = DISP / LIST /SAVE /DETAIL
    const fnQRY_P_FIA4300_Q = async function(workType){
 
    	var acntgUnit = gfnma_nvl(SBUxMethod.get("srch-slt-fiOrgCode")); // 회계단위 cbofi_org_code1
    	var acntgCrtr = gfnma_nvl(SBUxMethod.get("srch-slt-acctRuleCodeP")); // 회계기준 cboacct_rule_code_p
    	var intlDspsNo = gfnma_nvl(SBUxMethod.get("srch-ast-originalAssetDispNo")); //자산내역 : 당초처분번호  txtoriginal_asset_disp_no
    	var dspsNo = gfnma_nvl(SBUxMethod.get("srch-ast-assetDisposalNo"));  // 자산내역 : 처분번호 txtasset_disposal_no
    	var dspsYmdFrom = gfnma_nvl(SBUxMethod.get("srch-dtp-disposalDateFrom")); //처분일 from ymddisposal_date_fr
    	var dspsYmdTo = gfnma_nvl(SBUxMethod.get("srch-dtp-disposalDateTo")); //처분일 to ymddisposal_date_to
    	var tkcgdept = gfnma_nvl(SBUxMethod.get("srch-inp-deptCode")); // 담당부서 txtdept_code1
    	var pic = gfnma_nvl(SBUxMethod.get("srch-inp-empCode")); // 담당자 txtemp_code1
    	var cnpt = gfnma_nvl(SBUxMethod.get("srch-inp-csCode")); //거래처 txtcs_code1
    	var astno = gfnma_nvl(SBUxMethod.get("srch-ast-assetNo"));//자산내역 자산 txtasset_no
        var dspsType = gfnma_nvl(SBUxMethod.get("srch-slt-disposalType"));//cbodisposal_type 자산내역 처분유형
    	var dspsType1 = gfnma_nvl(SBUxMethod.get("srch-slt-disposalType1"));//cbodisposal_type1 검색조건 처분유형
		var bplc = gfnma_nvl(SBUxMethod.get("srch-slt-siteCode"));//cbosite_code1 검색조건 사업장
 
		if(workType === "LIST" || workType === "SAVE" || workType === "DISP" ){
    		if(!SBUxMethod.validateRequired({group_id: 'search1'})){
    			return false;
    		}
    	}else if (workType === "DETAIL"){
    		if(!SBUxMethod.validateRequired({group_id: 'ast1'})){
    			return false;
    		}
    	}
 
		var paramObj = {
			    V_P_DEBUG_MODE_YN         : ''
			    ,V_P_LANG_ID : ''
			    ,V_P_COMP_CODE  : gv_ma_selectedCorpCd
			    ,V_P_CLIENT_CODE : gv_ma_selectedClntCd
		  	    ,V_P_FI_ORG_CODE : acntgUnit
			    ,V_P_ACCT_RULE_CODE : acntgCrtr
			    ,V_P_ASSET_DISPOSAL_NO : workType == "DISP" ? intlDspsNo : dspsNo
			    ,V_P_DISPOSAL_SEQ : 0
			    ,V_P_SITE_CODE : bplc
			    ,V_P_DISPOSAL_TYPE : workType == "INFO" ?  dspsType : dspsType1
			    ,V_P_DISPOSAL_DATE_FROM : dspsYmdFrom
			    ,V_P_DISPOSAL_DATE_TO     : dspsYmdTo
			    ,V_P_DEPT_CODE  : tkcgdept
			    ,V_P_EMP_CODE  :  pic
			    ,V_P_CS_CODE   : cnpt
			    ,V_P_ASSET_NO : astno
			    ,V_P_FORM_ID   : p_formId
			    ,V_P_MENU_ID   : p_menuId
			    ,V_P_PROC_ID   : ''
			    ,V_P_USERID     : ''
			    ,V_P_PC           : ''
		    };
 
 
        const postJsonPromise = gfn_postJSON("/fi/fia/selectFia4300Q.do", {
        	getType				: 'json',
        	workType			: 'LIST',
        	cv_count			: '5',
        	params				: gfnma_objectToString(paramObj)
		});
 
        const data = await postJsonPromise;
		//console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {
 
  				jsonAstDsps.length = 0;
	        	var msg = convertArrayToCamelCase(data.cv_1)
    			jsonAstDsps = msg;
  	        	grdAstDsps.rebuild();
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
 
    const fnQRY_P_FIA4300_Q1 = async function(workType,strSearchType){
 
    	var dspsYmd = SBUxMethod.get("srch-dtp-astTab-dspsYmd");
    	var dspsRt = SBUxMethod.get("srch-inp-astTab-dspsRt");//처분비율
    	var dspsAmt =  SBUxMethod.get("srch-inp-astTab-dspsAmt");
    	var acntgCrtr = SBUxMethod.get("srch-slt-acctRuleCodeP"); //회계기준
    	var bssAcqsAmt = SBUxMethod.get("srch-inp-astTab-bssAcqsAmt");
    	var astNo = SBUxMethod.get("srch-inp-assetNo"); // 자산번호
 
        var paramObj = {
    		    V_P_DEBUG_MODE_YN  : ''
    		    ,V_P_LANG_ID         :     ''
	   		    ,V_P_COMP_CODE       :     gv_ma_selectedCorpCd
    		    ,V_P_CLIENT_CODE     :     gv_ma_selectedClntCd
			    ,V_P_ACCT_RULE_CODE  : ''
			    ,V_P_ASSET_NO        : ''
			    ,V_P_DISPOSAL_DATE   : ''
			    ,V_P_ACQUISITION_AMOUNT  : ''
			    ,V_P_BEGIN_ACQUISITION_AMOUNT : ''
			    ,IV_P_OUT_ACQUISITION_RATE    : ''
			    ,V_P_OUT_ACQUISITION_AMOUNT   : ''
 
    		    ,V_P_FORM_ID      : p_formId
    		    ,V_P_MENU_ID     :  p_menuId
    		    ,V_P_PROC_ID     :   ''
    		    ,V_P_USERID       :   ''
    		    ,V_P_PC             :   ''
    			};
 
    	try{
			const postJsonPromise = gfn_postJSON("/fi/fia/selectFia4300Q1.do", {
	         	getType				: 'json',
	         	workType			: workType,
	         	cv_count			: '2',
	         	params				: gfnma_objectToString(paramObj)
			});
        	const data = await postJsonPromise;
        	const rs = data.cv1
                if (rs != null){
                    if (!rs.ErrorCode.StartsWith("P") && !rs.ErrorCode.StartsWith("E")){
                        if (strWorkType == "ASSET")
                        {
                            if (rs.ResultDataSet.length > 0)
                            {
                                if (rs.ResultDataSet.Tables[0].Rows.Count > 0)
                                {
                                    //numout_acquisition_amount_event.EditValueModified -= new EditValueModifiedEvent(numout_acquisition_amount_event_EditValueModified);
                                    //numout_acquisition_rate.EditValueModified -= new EditValueModifiedEvent(numout_acquisition_rate_EditValueModified);
 
                                    //numacquisition_amount.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0].Rows[0]["acquisition_amount"].ToString());
                                    SBUxMethod.set("srch-dsps-acquisitionAmount","");
                                    //numsubsidies_amount.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0].Rows[0]["subsidies_amount"].ToString());
                                    SBUxMethod.set("srch-dsps-subsidiesAmount","");
                                    //numaccumulated_depreciation.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0].Rows[0]["accumulated_depreciation"].ToString());
                                    SBUxMethod.set("srch-dsps-accumulatedDepreciation","");
                                    //numsubsidies_acc_depreciation.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0].Rows[0]["subsidies_acc_depreciation"].ToString());
									SBUxMethod.set("srch-ast-accDepreciation","");
                                    //numbegin_acquisition_amount.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0].Rows[0]["begin_acquisition_amount"].ToString());
                                    SBUxMethod.set("srch-ast-beginAcquisitionAmount","");
                                    //numbegin_subsidies_amount.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0].Rows[0]["begin_subsidies_amount"].ToString());
                                    SBUxMethod.set("srch-ast-subsidiesAmount","");
 
                                    //numout_acquisition_rate.Value = 0;
                                    SBUxMethod.set("srch-ast-acquisitionRate",0);
                                    //numout_acquisition_amount_event.Value = 0;
                                    SBUxMethod.set("srch-ast-acquisitionAmountEvent",0);
                                    //numout_acquisition_amount.Value = 0;
                                    SBUxMethod.set("srch-ast-acquisitionAmount",0);
                                    //numout_subsidies_amount.Value = 0;
                                    SBUxMethod.set("srch-ast-subsidiesAmount",0);
                                    //numout_depreciation_amount.Value = 0;
                                    SBUxMethod.set("srch-ast-depreciationAmount",0);
                                    //numout_accum_depr.Value = 0;
                                    SBUxMethod.set("srch-ast-accumDepr",0);
                                    //numout_subsidies_depr.Value = 0;
                                    SBUxMethod.set("srch-ast-subsidiesDepr",0);
                                    //numout_subsidies_acc_depr.Value = 0;
                                    SBUxMethod.set("srch-ast-subsidiesAccDepr",0);
                                    //numbook_value.Value = 0;
                                    SBUxMethod.set("srch-ast-numBook",0);
                                    //numdisposal_pl.Value = 0;
                                    SBUxMethod.set("srch-dsps-numDisposalPl",0);
 
 
                                    //numout_acquisition_amount_event.EditValueModified += new EditValueModifiedEvent(numout_acquisition_amount_event_EditValueModified);
                                    //numout_acquisition_rate.EditValueModified += new EditValueModifiedEvent(numout_acquisition_rate_EditValueModified);
 
                                }
                            }
                        }
                        else if (strWorkType == "ASSET_IFRS")
                        {
                            if (rs.ResultDataSet.length > 0)
                            {
                                if (rs.ResultDataSet.Tables[0].Rows.Count > 0)
                                {
                                    //numout_acquisition_amount_event.EditValueModified -= new EditValueModifiedEvent(numout_acquisition_amount_event_EditValueModified);
                                    //numout_acquisition_rate.EditValueModified -= new EditValueModifiedEvent(numout_acquisition_rate_EditValueModified);
									//numacquisition_amount.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0].Rows[0]["acquisition_amount"].ToString());
                                    SBUxMethod.set("srch-dsps-acquisitionAmount","");
                                    //numsubsidies_amount.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0].Rows[0]["subsidies_amount"].ToString());
                                    SBUxMethod.set("srch-dsps-subsidiesAmount","");
                                    //numaccumulated_depreciation.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0].Rows[0]["accumulated_depreciation"].ToString());
                                    SBUxMethod.set("srch-dsps-accumulatedDepreciation","");
                                    //numsubsidies_acc_depreciation.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0].Rows[0]["subsidies_acc_depreciation"].ToString());
									SBUxMethod.set("srch-ast-accDepreciation","");
                                    //numbegin_acquisition_amount.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0].Rows[0]["begin_acquisition_amount"].ToString());
                                    SBUxMethod.set("srch-ast-beginAcquisitionAmount","");
                                    //numbegin_subsidies_amount.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0].Rows[0]["begin_subsidies_amount"].ToString());
                                    SBUxMethod.set("srch-ast-subsidiesAmount","");
                                   //numout_acquisition_rate.Value = 0;
                                    SBUxMethod.set("srch-ast-acquisitionRate",0);
                                    //numout_acquisition_amount_event.Value = 0;
                                    SBUxMethod.set("srch-ast-acquisitionAmountEvent",0);
                                    //numout_acquisition_amount.Value = 0;
                                    SBUxMethod.set("srch-ast-acquisitionAmount",0);
                                    //numout_subsidies_amount.Value = 0;
                                    SBUxMethod.set("srch-ast-subsidiesAmount",0);
                                    //numout_depreciation_amount.Value = 0;
                                    SBUxMethod.set("srch-ast-depreciationAmount",0);
                                    //numout_accum_depr.Value = 0;
                                    SBUxMethod.set("srch-ast-accumDepr",0);
                                    //numout_subsidies_depr.Value = 0;
                                    SBUxMethod.set("srch-ast-subsidiesDepr",0);
                                    //numout_subsidies_acc_depr.Value = 0;
                                    SBUxMethod.set("srch-ast-subsidiesAccDepr",0);
                                    //numbook_value.Value = 0;
                                    SBUxMethod.set("srch-ast-numBook",0);
                                    //numdisposal_pl.Value = 0;
                                    SBUxMethod.set("srch-dsps-numDisposalPl",0);
 
 
                                    numout_acquisition_amount_event.EditValueModified += new EditValueModifiedEvent(numout_acquisition_amount_event_EditValueModified);
                                    numout_acquisition_rate.EditValueModified += new EditValueModifiedEvent(numout_acquisition_rate_EditValueModified);
 
                                }
                            }
                        }
                        else if (strWorkType == "ASSET_DEPR")
                        {
                            if (rs.ResultDataSet.length > 0)
                            {
                                if (rs.ResultDataSet.Tables[0].length > 0)
                                {
                                    if (rs.ResultDataSet.Tables[0][0]["out_acquisition_amount"] != ""){
                                        SBUxMethod.set("srch-ast-",rs.ResultDataSet.Tables[0].Rows[0]["out_acquisition_amount"]);
                                    }
                                    if (rs.ResultDataSet.Tables[0][0]["out_subsidies_amount"] != ""){
                                        SBUxMethod.set("srch-ast-",rs.ResultDataSet.Tables[0][0]["out_subsidies_amount"]);
                                    }
                                    if (rs.ResultDataSet.Tables[0][0]["out_depreciation_amount"] != ""){
                                        SBUxMethod.set("srch-ast-",rs.ResultDataSet.Tables[0][0]["out_depreciation_amount"]);
                                    }
                                    if (rs.ResultDataSet.Tables[0][0]["out_accumulated_depreciation"] != ""){
                                        SBUxMethod.set("srch-ast-",rs.ResultDataSet.Tables[0][0]["out_accumulated_depreciation"]);
                                    }
                                    if (rs.ResultDataSet.Tables[0][0]["out_subsidies_depreciation"] != ""){
                                        SBUxMethod.set("srch-ast-",rs.ResultDataSet.Tables[0][0]["out_subsidies_depreciation"]);
                                    }
                                    if (rs.ResultDataSet.Tables[0][0]["out_subsidies_acc_depreciation"] != ""){
                                        SBUxMethod.set("srch-ast-",rs.ResultDataSet.Tables[0][0]["out_subsidies_acc_depreciation"]);
                                    }
 
                                    fnCalBookValue();
                                    fnCalDisposal_pl();
                                }
                            }
                        }
                        else if (strWorkType == "ASSET_DEPR_IFRS")
                        {
                            if (rs.ResultDataSet.Tables.Count > 0)
                            {
                                if (rs.ResultDataSet.Tables[0].Rows.Count > 0)
                                {
                                    if (rs.ResultDataSet.Tables[0][0]["out_acquisition_amount"].ToString() != "")
                                    {
                                        numout_acquisition_amount.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0][0]["out_acquisition_amount"].ToString());
                                    }
                                    if (rs.ResultDataSet.Tables[0][0]["out_subsidies_amount"].ToString() != "")
                                    {
                                        numout_subsidies_amount.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0][0]["out_subsidies_amount"].ToString());
                                    }
                                    if (rs.ResultDataSet.Tables[0][0]["out_depreciation_amount"].ToString() != "")
                                    {
                                        numout_depreciation_amount.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0][0]["out_depreciation_amount"].ToString());
                                    }
                                    if (rs.ResultDataSet.Tables[0][0]["out_accumulated_depreciation"].ToString() != "")
                                    {
                                        numout_accum_depr.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0][0]["out_accumulated_depreciation"].ToString());
                                    }
                                    if (rs.ResultDataSet.Tables[0][0]["out_subsidies_depreciation"].ToString() != "")
                                    {
                                        numout_subsidies_depr.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0][0]["out_subsidies_depreciation"].ToString());
                                    }
                                    if (rs.ResultDataSet.Tables[0][0]["out_subsidies_acc_depreciation"].ToString() != "")
                                    {
                                        numout_subsidies_acc_depr.EditValue = Decimal.Parse(rs.ResultDataSet.Tables[0][0]["out_subsidies_acc_depreciation"].ToString());
                                    }
 
                                    fnCalBookValue();
                                    fnCalDisposal_pl();
                                }
                            }
                        }
                        }
                    else{
                        //SetErrorMessage(rs.ErrorCode, rs.ErrorStr);
                    }
                }
				cProc = null;
				return true;
			}
			catch (e){
				if (!(e instanceof Error)) {
               	 e = new Error(e);
	            }
	            console.error("failed", e.message);
	            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
    	}
 
 
 
    const fnCalBookValue = function(){
    	let acquisitionAmount = SBUxMethod.get("srch-ast-acquisitionAmount");
    	let subsidiesAmount = SBUxMethod.get("srch-ast-subsidiesAmount");
    	let accumDepr = SBUxMethod.get("srch-ast-accumDepr");
 
    	let sum = acquisitionAmount - subsidiesAmount - accumDepr;
 
    	SBUxMethod.set("srch-ast-bookValue",sum);
    	SBUxMethod.set("srch-dsps-bookValueCopy",sum);
    }
 
    const fnCalDisposal_pl = function(){
    	let functionalAmt = SBUxMethod.get("srch-ast-functionalAmt");
    	let acquisitionAmount = SBUxMethod.get("srch-ast-acquisitionAmount");
    	let subsidiesAmount = SBUxMethod.get("srch-ast-subsidiesAmount");
    	let accumDepr = SBUxMethod.get("srch-ast-accumDepr");
    	let subsidiesAccDepr = SBUxMethod.get("srch-ast-subsidiesAccDepr");
 
    	let sum = functionalAmt - (acquisitionAmount + subsidiesAmount) - (accumDepr + subsidiesAccDepr);
 
    	SBUxMethod.set("srch-dsps-disposalPl",sum);
    }
 
    /**
     * 비용전표조회
     */
		const fn_expenseSearch = async function() {
 
 
    	let sourceId = SBUxMethod.get("srch-inp-astTab-dspsSourceId");
    	let disposalType = SBUxMethod.get("srch-slt-disposalType");
    	let compCode = gfnma_multiSelectGet("#srch-slt-compCode");
 
    	if(disposalType === "DISUSE"){
    		return;
    	}
 
    	//  처분 ▶ 소스 ID 없을 경우 return
		if(sourceId === ""){
			return;
		}
 
		var paramObj = {
				docBatchNo : ''
				, sourceType : 'AP'
				, txnFromDate : ''
				, txnToDate : ''
				, compCode : gv_ma_selectedCorpCd
				, fiOrgCode : ''
				, voucherType : ''
				, voucherNo : ''
				, asave : ''
				, aprint : ''
 
		    };
 
		    //object objResult = OpenChildForm("FIG3510_AP", ht, OpenType.Tab);
			//FIG3510_AP : 매출송장등록으로 이동
 
        //
    }
 
    const fnFocuseRowChanged = function(){
    	let rowNo = grdAstDsps.getRow();
    	let rowData = grdAstDsps.getRowData(rowNo);
    	if(rowNo < 0){
    		return;
    	}
 
 
 
    	//이벤트 제거
        //fnTpg2EventRemove();
 
        fnVisivleControl(false);
        //InitControls(grdDetail);
        SBUxMethod.refreshGroup("group1");
 
        //그리드 데이터를 기반으로 하단 패널 두개 setting 해주는듯
        //SetPanelFromGrid(grdHeader, panMaster);
        //SetPanelFromGrid(grdHeader, panTpg2);
        fn_setPanelFromGrid(rowData);
 
 
 
        //fnQRY_P_FIA4300_Q("INFO");
        //fnQRY_P_FIA4300_Q("DETAIL");
 
        //numbook_value_copy.Value = numbook_value.Value;
        let numbookValue = SBUxMethod.get("srch-ast-bookValue")
        SBUxMethod.set("srch-ast-bookValueCopy",numbookValue);
 
        //이벤트연결
        fnTpg2EventAdd();
 
        fnSetPanMasterReadOnly(true);
    }
 
 
    const fn_setPanelFromGrid = function(rowData){
		if(gfn_nvl(rowData) === "")
			return;
    	//자산내역
    	SBUxMethod.set("srch-ast-assetDisposalNo",rowData.assetDisposalNo);
    	SBUxMethod.set("srch-ast-acctRuleCode",rowData.acctRuleCode);
    	SBUxMethod.set("srch-ast-disposalType",rowData.disposalType);
    	SBUxMethod.set("srch-dtp-disposalDate",rowData.disposalDate);
    	SBUxMethod.set("srch-ast-assetNo",rowData.assetNo);
    	SBUxMethod.set("srch-ast-assetName",rowData.assetName);
    	SBUxMethod.set("srch-ast-siteCode",rowData.siteCode);
    	SBUxMethod.set("srch-ast-acquisitionAmount1",rowData.outAcquisitionAmount);
    	SBUxMethod.set("srch-ast-bookValue",rowData.bookValue);
 
    	//처분내역
    	SBUxMethod.set("srch-dsps-csCode",rowData.csCode);
    	SBUxMethod.set("srch-dsps-csName",rowData.csName);
    	gfnma_multiSelectSet("#srch-dsps-currencyCode",		"SBSD_CD", 		"CD_NM", 	gfnma_nvl(rowData.currencyCode));//통화
    	SBUxMethod.set("srch-dsps-deptCode",rowData.deptCode);
    	SBUxMethod.set("srch-dsps-deptName",rowData.deptName);
    	gfnma_multiSelectSet("#srch-dsps-vatType",		"VAT_CD", 		"VAT_NM", 	gfnma_nvl(rowData.vatType));//부가세유형
    	SBUxMethod.set("srch-dsps-vatRate",gfnma_nvl(rowData.vatRate));
    	SBUxMethod.set("srch-dsps-empCode",rowData.empCode);
    	SBUxMethod.set("srch-dsps-empName",rowData.empName);
    	SBUxMethod.set("srch-dsps-costCenterCode",rowData.costCenterCode);
    	SBUxMethod.set("srch-dsps-costCenterName",rowData.costCenterName);
    	SBUxMethod.set("srch-dsps-exchangeRate",rowData.exchangeRate);
    	SBUxMethod.set("srch-dsps-disposalOriginalAmount",rowData.disposalOriginalAmount);
    	SBUxMethod.set("srch-dsps-dispFunctionalAmt",rowData.dispFunctionalAmt);
    	SBUxMethod.set("srch-dsps-vatAmount",rowData.vatAmount);
    	SBUxMethod.set("srch-dsps-totalAmount",rowData.totalAmount);
    	//
    	//SBUxMethod.set("srch-dsps-",rowData.);
 
    };
 
    const numexchange_rate_EditValueChanged = function(args){
    	let dispFunctionalAmt = SBUxMethod.get("srch-dsps-dispFunctionalAmt");
    	let disposalOriginalAmount = SBUxMethod.get("srch-dsps-disposalOriginalAmount");
    	let exchangeRate = SBUxMethod.get("srch-dsps-exchangeRate");
    	let val = disposalOriginalAmount * exchangeRate;
    	SBUxMethod.set("srch-dsps-dispFunctionalAmt",val);
 
    	//numdisp_functional_amt.Value = Math.Round(Decimal.Parse(numdisposal_original_amount.Value.ToString()) * Decimal.Parse(numexchange_rate.Value.ToString()),SessionInfo.CurrUnit);
    }
 
  //부가세유형 이벤트
    const cbovat_type_EditValueChanged = function(args){
    	let vatType = gfnma_multiSelectGet("#srch-dsps-vatType");
 
        if (vatType == ""){
        	return;
        }
		//cbovat_type.GetColumnValue("vat_rate").ToString() == ""
        //if (cbovat_type.GetColumnValue("vat_rate").ToString() == ""){
 
            //gfnma_multiSelectSet("#CNPT_GROUP", 			"SBSD_CD", 		"CD_NM",	gfnma_nvl(cv_1.CNPT_GROUP));
        //}else{
        //    numvat_rate.Value = Decimal.Parse(cbovat_type.GetColumnValue("vat_rate").ToString());
        //}
 
    }
 
    //부가세유형에서 계산하는 이벤트
    const numvat_rate_EditValueChanged = function(args){
 
    	let dispFunctionalAmt = SBUxMethod.get("srch-dsps-dispFunctionalAmt");
    	let vatRate = SBUxMethod.get("srch-dsps-vatRate");
    	let val = dispFunctionalAmt * vatRate;
 
    	SBUxMethod.set("srch-dsps-vatAmount",val);
        //numvat_amount.Value = Math.Round(Decimal.Parse(numdisp_functional_amt.Value.ToString()) * Decimal.Parse(numvat_rate.Value.ToString()) / 100,SessionInfo.CurrUnit);
 
    }
 
    //부가세 이벤트
    const numvat_amount_EditValueChanged = function(args){
    	let vatAmount = SBUxMethod.get("srch-dsps-vatAmount")
    	let totalAmount = SBUxMethod.get("srch-dsps-totalAmount")
    	let val =  totalAmount + vatAmount
    	SBUxMethod.set("srch-dsps-totalAmount",val);
        // 금액합계 = 금액 + 부가세
        //numtotal_amount.Value = numtotal_amount.Value + numvat_amount.Value;
 
    }
 
 
    //매각금액 이벤트(환산금액 계산)
    const numdisposal_original_amount_EditValueChanged = function(args){
 
 
    	let disposalOriginalAmount = SBUxMethod.get("srch-dsps-disposalOriginalAmount"); ;
    	let exchangeRate = SBUxMethod.get("srch-dsps-exchangeRate"); ;
    	let val = disposalOriginalAmount * exchangeRate;
    	SBUxMethod.set(dispFunctionalAmt,val);
        //numdisp_functional_amt.Value = Math.Round(Decimal.Parse(numdisposal_original_amount.Value.ToString()) * Decimal.Parse(numexchange_rate.Value.ToString()),SessionInfo.CurrUnit);
 
    }
 
    //환산금액 이벤트
    const numdisposal_functional_amount_EditValueChanged = function(args){
    	let vatRate = SBUxMethod.get("srch-dsps-vatRate");
    	let dispFunctionalAmt = SBUxMethod.get("srch-dsps-dispFunctionalAmt");
 
    	let val = (dispFunctionalAmt * vatRate) / 100;
 
    	SBUxMethod.set("srch-dsps-vatAmount",val);
 
    	let vatAmount = SBUxMethod.get("srch-dsps-vatAmount");
    	let val2 = dispFunctionalAmt + vatAmount
    	SBUxMethod.set("srch-dsps-totalAmount",val2);
 
 
    	//numvat_amount.Value = Math.Round(Decimal.Parse(numdisp_functional_amt.Value.ToString()) * Decimal.Parse(numvat_rate.Value.ToString()) / 100,SessionInfo.CurrUnit);
        // 환산합계 = 환산금액 + 환산부가세
 
        //numtotal_amount.Value = numdisp_functional_amt.Value + numvat_amount.Value;
 
        fnCalDisposal_pl();
    }
 
 
    //처분비용 이벤트
    const numexpense_amount_EditValueChanged = function(args){
 
    	let expenseAmount = SBUxMethod.get("srch-dsps-expenseAmount");
    	let expenseVatRate = SBUxMethod.get("srch-dsps-expenseVatRate");
    	let val = expenseAmount * (expenseVatRate / 100)
    	SBUxMethod.set("srch-dsps-expenseVatAmount",val);
 
        //numexpense_vat_amount.Value = Math.Round(numexpense_amount.Value * (numexpense_vat_rate.Value / 100),SessionInfo.CurrUnit);
    }
 
    //비용부가세유형
    const cboexpense_vat_type_EditValueChanged = function(args){
    	let expenseVatType =  gfnma_multiSelectGet("#srch-dsps-expenseVatType");
        if (expenseVatType === ""){
        	return;
        }
 
        SBUxMethod.set("srch-dsps-expenseVatRate",expenseVatType);
        //numexpense_vat_rate.Value = Decimal.Parse(cboexpense_vat_type.GetColumnValue("vat_rate").ToString());
    }
    //부가세율 이벤트
    const numexpense_vat_rate_EditValueChanged = function(args){
    	let expenseAmount = SBUxMethod.get("srch-dsps-expenseAmount");
    	let expenseVatRate = SBUxMethod.get("srch-dsps-expenseVatRate");
    	let val = (expenseAmount * expenseVatRate) / 100;
    	SBUxMethod.set("srch-dsps-expenseVatAmount",val);
    	numexpense_vat_amount.Value = Math.Round(Decimal.Parse(numexpense_amount.Value.ToString()) * Decimal.Parse(numexpense_vat_rate.Value.ToString()) / 100,SessionInfo.CurrUnit);
    }
 
    const fnTpg2EventAdd = function(){
        //numexchange_rate.EditValueChanged += new EventHandler(numexchange_rate_EditValueChanged);
        //cbovat_type.EditValueChanged += new EventHandler(cbovat_type_EditValueChanged);
        //numvat_rate.EditValueChanged += new EventHandler(numvat_amount_EditValueChanged);
        //numvat_amount.EditValueChanged += new EventHandler(numvat_amount_EditValueChanged);
        //numdisposal_original_amount.EditValueChanged += new EventHandler(numdisposal_original_amount_EditValueChanged);
        //numdisp_functional_amt.EditValueChanged += new EventHandler(numdisposal_functional_amount_EditValueChanged);
        //numexpense_amount.EditValueChanged += new EventHandler(numexpense_amount_EditValueChanged);
        //cboexpense_vat_type.EditValueChanged += new EventHandler(cboexpense_vat_type_EditValueChanged);
        //numexpense_vat_rate.EditValueChanged += new EventHandler(numexpense_vat_rate_EditValueChanged);
 
    }
 
    const fnTpg2EventRemove = function(){
        //numexchange_rate.EditValueChanged -= new EventHandler(numexchange_rate_EditValueChanged);
        //cbovat_type.EditValueChanged -= new EventHandler(cbovat_type_EditValueChanged);
        //numvat_rate.EditValueChanged -= new EventHandler(numvat_amount_EditValueChanged);
        //numvat_amount.EditValueChanged -= new EventHandler(numvat_amount_EditValueChanged);
        //numdisposal_original_amount.EditValueChanged -= new EventHandler(numdisposal_original_amount_EditValueChanged);
        //numdisp_functional_amt.EditValueChanged -= new EventHandler(numdisposal_functional_amount_EditValueChanged);
        //numexpense_amount.EditValueChanged -= new EventHandler(numexpense_amount_EditValueChanged);
        //cboexpense_vat_type.EditValueChanged -= new EventHandler(cboexpense_vat_type_EditValueChanged);
        //numexpense_vat_rate.EditValueChanged -= new EventHandler(numexpense_vat_rate_EditValueChanged);
    }
 
    const gvwHeader_BeforeLeaveRow = function(sender, e){
        if (e.RowHandle < 0)
            return;
 
        if (saveButton){
            //DialogResult dr = SetYesNoMessageBox(GetFormMessage("FIA4300_002"), IconType.Question);    // 작업 중 저장하지 않은 데이터가 존재합니다. 저장 후 이동하시겠습니까?
            if (gfn_comConfirm("Q0001", "작업 중 저장하지 않은 데이터가 존재합니다. 저장 후 이동하시겠습니까?")){
               /*  if (fnDataValidation()){
                	saveClick();
                }else{
                	e.Allow = false;
                } */
            }
        }
    }
 
 
    // 그리드에 특정 컬럼명 합계 구해서 패널에다가 값 할당해주는듯 -> 다시 만드셈
    const gvwDetail_CellValueChanged = function(columnName){
        //if (e.RowHandle < 0){
        //	return;
        //}
        let column = "";
        let htmlCol = "";
        let allData = grdAstDsps.getGridDataAll();
        if (columnName == "acquisition_amount"){
            column = "";
            htmlCol = "";
        }
        let dSum = 0;
        allData.forEach(item =>{
        	dSum += item[column];
        })
        SBUxMethod.set(htmlCol,dSum);
    }
 
    const txtasset_no_EditValueChanged = function(args){
    	let assetNo = SBUxMethod.get("srch-inp-assetNo");
    	let assetDisposalNo = SBUxMethod.get("srch-ast-assetDisposalNo");
        if (assetNo != "" && assetDisposalNo === ""){
            fnQRY_P_FIA4300_Q("ASSETLIST");
        }
    }
 
    const fn_cbodisposalTypeEditValueChanged = function(disposalType){
 
		//처분유형에 따라서 readonly, 색변경 , 값 변경 ...
		// SBUxMethod.attr("","readonly",true)
 
        if (disposalType == "DISPOSAL"){    // DISPOSAL : 매각
        	//allowBlank가 뭔지 모르겠음 확인해야함
            //txtcs_code.Properties.AllowBlank = false;
            //txtcs_name.Properties.AllowBlank = false;
            //cbotax_site_code.Properties.AllowBlank = false;
            //cbovat_type.Properties.AllowBlank = false;
 
            //cbotax_site_code.Properties.ReadOnly = false;
            //cbovat_type.Properties.ReadOnly = false;
 
            //txtcs_code.Properties.Appearance.BackColor = AllowBlankColor;
            //txtcs_name.Properties.Appearance.BackColor = AllowBlankColor;
            //cbotax_site_code.Properties.Appearance.BackColor = AllowBlankColor;
            //cbovat_type.Properties.Appearance.BackColor = AllowBlankColor;
        }
        else if (disposalType == "DISUSE"){     // DISUSE : 폐기
 
            /* txtcs_code.Properties.AllowBlank = true;
            txtcs_name.Properties.AllowBlank = true;
            cbotax_site_code.Properties.AllowBlank = true;
            cbovat_type.Properties.AllowBlank = true;
 
            cbotax_site_code.EditValue = "";
            cbovat_type.EditValue = "";
            numvat_rate.Value = 0;
            cbotax_site_code.Properties.ReadOnly = true;
            cbovat_type.Properties.ReadOnly = true;
 
            txtcs_code.Properties.Appearance.BackColor = AppearanceBackColor;
            txtcs_name.Properties.Appearance.BackColor = AppearanceBackColor;
            cbotax_site_code.Properties.Appearance.BackColor = AppearanceBackColor;
            cbovat_type.Properties.Appearance.BackColor = AppearanceBackColor; */
        }
    }
 
    const txtasset_no_event_EditValueChanged = function(){
    	let assetNoEvent = SBUxMethod.get("srch-slt-assetNoEvent");
    	let ymddisposalDate = SBUxMethod.get("srch-slt-disposalDate");
    	let acctRuleCodeP = SBUxMethod.get("srch-slt-acctRuleCodeP");
 
        if (assetNoEvent != "" && ymddisposalDate!= ""){
            let strWrkType = "ASSET";
            if (acctRuleCodeP === "2"){
                strWrkType = strWrkType + "_IFRS";
            }
 
            fnQRY_P_FIA4300_Q1(strWrkType, "");
        }
    }
	// onchage로 쓰면 될듯?
    const ymddisposal_date_Closed = function(args){
        let assetNoEvent = SBUxMethod.get("assetNoEvent");
        let acctRuleCodeP = SBUxMethod.get("srch-slt-acctRuleCodeP");
            if (assetNoEvent != ""){
                let strWrkType = "ASSET";
 
                if (acctRuleCodeP === "2"){
                    strWrkType = strWrkType + "_IFRS";
                }
 
                fnQRY_P_FIA4300_Q1(strWrkType, "");
            }
 
            saveButton = true;
       }
 
 
 
    const numout_acquisition_rate_EditValueModified = function(args){
    	let acquisitionRate = SBUxMethod.get("srch-ast-acquisitionRate");
    	let acquisitionAmount = SBUxMethod.get("srch-ast-acquisitionAmount");
    	let acctRuleCodeP = SBUxMethod.get("srch-slt-acctRuleCodeP");
        if (acquisitionRate === 0){
            //SetMessageBox("처분비율이 0 이 아닌 수를 입력해 주세요.");
 
            //numout_acquisition_rate.Focus();
            SBUxMethod.focus("srch-ast-acquisitionRate");
            return;
        }
 
        //numout_acquisition_amount_event.EditValueModified -= new EditValueModifiedEvent(numout_acquisition_amount_event_EditValueModified);
        //numout_acquisition_amount_event.Value = Math.Round(numacquisition_amount.Value * (numout_acquisition_rate.Value / 100),SessionInfo.CurrUnit);
        let acquisitionAmountEvent = acquisitionAmount * (acquisitionRate / 100);
		SBUxMethod.set("srch-ast-acquisitionAmountEvent","");
        let strWrkType = "ASSET_DEPR";
 
        if (acctRuleCodeP === "2"){
            strWrkType = strWrkType + "_IFRS";
        }
 
        fnQRY_P_FIA4300_Q1(strWrkType, "RATE");
 
        //numout_acquisition_amount_event.EditValueModified += new EditValueModifiedEvent(numout_acquisition_amount_event_EditValueModified);
    }
 
    const numout_acquisition_amount_event_EditValueModified = function(args){
    	let acquisitionAmountEvent = SBUxMethod.get("srch-ast-acquisitionAmountEvent");
    	let acquisitionRate = SBUxMethod.get("srch-ast-acquisitionRate");
    	let acquisitionAmount = SBUxMethod.get("srch-ast-acquisitionAmount");
 
 
        if (acquisitionAmountEvent === 0){
        	gfn_comAlert("E0001");	//	처분금액을 입력해 주세요.
        	SBUxMethod.get("srch-ast-acquisitionAmountEvent").focus();
            return;
        }
 
        //numout_acquisition_rate.EditValueModified -= new EditValueModifiedEvent(numout_acquisition_rate_EditValueModified);
		let val = (acquisitionAmountEvent / acquisitionAmount) * 100;
		SBUxMethod.set("srch-ast-acquisitionRate",val);
 
		let acctRuleCodeP = SBUxMethod.get("srch-slt-acctRuleCodeP");
        let strWrkType = "ASSET_DEPR";
 
        if (acctRuleCodeP === "2"){
            strWrkType = strWrkType + "_IFRS";
        }
 
        fnQRY_P_FIA4300_Q1(strWrkType, "AMT");
 
        //numout_acquisition_rate.EditValueModified += new EditValueModifiedEvent(numout_acquisition_rate_EditValueModified);
    }
 
    const ymddisposal_date_EditValueModified = function(args){
    	let assetNoEvent = SBUxMethod.get("srch-slt-assetNoEvent");
    	let ymddisposalDate = SBUxMethod.get("srch-slt-disposalDate");
    	let acctRuleCodeP = SBUxMethod.get("srch-slt-acctRuleCodeP");
 
        if (assetNoEvent != "" && ymddisposalDate != ""){
            let strWrkType = "ASSET";
            if (acctRuleCodeP === "2"){
                strWrkType = strWrkType + "_IFRS";
            }
            fnQRY_P_FIA4300_Q1(strWrkType, "");
        }
    }
 
    /**
     * 전표 생성 리포트?
     */
    const btnAccountClick = async function() {
 
    	//  그리드에 선택된 행 없을 시 return
		if(grdAstDsps.getRow() == -1){
			return;
		}
 
		let chk1 = await fn_setFia4300S2("ACCOUNT");
 
		if(chk1){
			let chk2 = await fn_setFia4300S2("ACCOUNT2");
			if(chk2){
				//var strKey = grdAstDsps.getRowData(1).astDspsNo // 자산처분번호를 가지고 로우 찾아서 포커스 ㄱㄱ
				//var rowIndex = grdAstDsps.getRow();
				queryClick();
 
				//grdAstDsps.setRow(rowIndex);
			}
		}
 
 
    }
    /**
     * 전표취소
     */
    const btnCancelClick = function(){
    //  그리드에 선택된 행 없을 시 return
		if(grdAstDsps.getRow() == -1){
			return;
		}
 
 
		if(fn_setFia4300S2("CANCLE")){
			if(fn_setFia4300S2("ACCOUNT2")){
				//var strKey = grdAstDsps.getRowData(1).astDspsNo // 자산처분번호를 가지고 로우 찾아서 포커스 ㄱㄱ
				//var rowIndex = grdAstDsps.getRow();
				queryClick();
 
				//grdAstDsps.setRow(rowIndex);
			}
		}
    }
    /**
     * 처분 전표 조회
     */
    const btnDisposalClick = function(){
    	let sourceId = gfnma_nvl(SBUxMethod.get("srch-ast-sourceId"));
    	let disposalType = SBUxMethod.get("srch-slt-disposalType");
    	let docBatchNo1 = SBUxMethod.get("srch-ast-docBatchNo1");
    	let fiOrgCode = SBUxMethod.get("srch-slt-fiOrgCode");
        if (sourceId === ""){
            //SetMessageBox("전표생성후 사용하세요.");
            alert("전표생성후 사용하세요.");
            return;
        }
 
 
        if (disposalType === "DISPOSAL"){ //매각
           /*  Hashtable ht = new Hashtable();
 
            ht.Add("doc_batch_no", txtdoc_batch_no.Text);
         //   ht.Add("invoice_line_num", 0);
            ht.Add("source_type", "AR");
            ht.Add("doc_num", 0);
            ht.Add("txn_from_date", "");
            ht.Add("txn_to_date", "");
            ht.Add("comp_code", cbocomp_code1.EditValue.ToString());
            ht.Add("fi_org_code", txtfi_org_code.Text);
            ht.Add("voucher_type", "");
            ht.Add("voucher_no", "");
            ht.Add("asave", this.FormAccessInfo.AllowSave == true ? "Y" : "N");
            ht.Add("aprint", this.FormAccessInfo.AllowPrint == true ? "Y" : "N");
 
            object objResult = OpenChildForm("FIG3510_AR", ht, OpenType.Tab);
 			*/
        	//FIG3510_AR :
 
 
    		var data = {
				docBatchNo : docBatchNo1
				, sourceType : 'AR'
				, docNum : 0
				, txnFromDate : ''
				, txnToDate : ''
				, compCode : gv_ma_selectedCorpCd
				, fiOrgCode : fiOrgCode
				, voucherType : ''
				, voucherNo : ''
				, asave : ''
				, aprint : ''
 
		    };
    		/** 전달하고자하는 TAB의 아이디를 객체 필드에 담아서 전달 **/
    		data.target = 'MA_A20_010_010_030' //FIG3510_AR 매출송장등록으로 이동
    		let json = JSON.stringify(data);
    		/** main에 선언되어있는 fn **/
    		window.parent.cfn_openTabSearch(json);
        }
        else if (disposalType === "DISUSE"){ //폐기
            /* Hashtable htparam = new Hashtable();
            htparam.Add("WORK_TYPE", "VIEW");
            htparam.Add("doc_id", txtsource_id.Text);
            object objResult = OpenChildForm("FIG2210_92", htparam, OpenType.Tab);*/
            //FIG2210_92 : 전표전기처리로 이동
 
 
    		var data = {
				docBatchNo : ''
				, sourceType : 'AP'
				, txnFromDate : ''
				, txnToDate : ''
				, compCode : gv_ma_selectedCorpCd
				, fiOrgCode : ''
				, voucherType : ''
				, voucherNo : ''
				, asave : ''
				, aprint : ''
 
		    };
    		/** 전달하고자하는 TAB의 아이디를 객체 필드에 담아서 전달 **/
    		data.target = '' //FIG2210_92 전표전기처리 이동
    		let json = JSON.stringify(data);
    		/** main에 선언되어있는 fn **/
    		//window.parent.cfn_openTabSearch(json);
 
 
 
        }
    }
 
	const queryClick = async function(){
		// saveButton은 처분일자가 닫히면서 true로 바뀜...?
		if(saveButton){
			if(gfn_comConfirm("Q0001", "작업중 저장하지 않은 데이터가 존재합니다. 저장")){
				/* if(fnDataValidation()){
					saveClick()
				}else{
					return;
				} */
			}
		}
 
		if(!fnQRY_P_FIA4300_Q("LIST")){
			return;
		}
 
 
		let iBeforeFocus = grdAstDsps.getRow();
 
		if(grdAstDsps.getRow() <0){
			newClick();
		}else{
			deleteButton = true;
		}
 
		//tabInfo.SelectedTabPage = tpgInfo2;
		SBUxMethod.selectTab("idxTab_norm", 'dspsTab');
        //lblacquisition_amount.Visible = false;
        //numacquisition_amount.Visible = false;
        $('.td_input.acqsAmt2').hide();
   	    $('.th_bg.acqsAmt2').hide();
 
        //lblbegin_acquisition_amount.Visible = false;
        //numbegin_acquisition_amount.Visible = false;
        $('.td_input.bssAcqsAmt').hide();
   	    $('.th_bg.bssAcqsAmt').hide();
 
         //lblsubsidies_amount.Visible = false;
        //numsubsidies_amount.Visible = false;
        $('.td_input.ntAsstncAmt2').hide();
    	$('.th_bg.ntAsstncAmt2').hide();
 
        //lblbegin_subsidies_amount.Visible = false;
        //numbegin_subsidies_amount.Visible = false;
        $('.td_input.bssNtAsstncAmt').hide();
    	$('.th_bg.bssNtAsstncAmt').hide();
 
        //lblaccumulated_depreciation.Visible = false;
        //numaccumulated_depreciation.Visible = false;
        $('.td_input.dprcAtAmt2').hide();
    	$('.th_bg.dprcAtAmt2').hide();
 
        //lblsubsidies_acc_depreciation.Visible = false;
        //numsubsidies_acc_depreciation.Visible = false;
        $('.td_input.asstncAmtDprcTotAmt').hide();
	    $('.th_bg.asstncAmtDprcTotAmt').hide();
 
        //lblout_acquisition_rate.Visible = false;
        //numout_acquisition_rate.Visible = false;
        $('.td_input.dspsRt').hide();
	    $('.th_bg.dspsRt').hide();
 
        //lblout_acquisition_amount_event.Visible = false;
        //numout_acquisition_amount_event.Visible = false;
        $('.td_input.dprcAtAmt2').hide();
	    $('.th_bg.dprcAtAmt2').hide();
 
        //txtcost_center_code.Properties.Popup.WhereQuery = "COST_CLASS = '2'";
        //txtcost_center_name.Properties.Popup.WhereQuery = "COST_CLASS = '2'";
 
	}
 
 
	const fnSET_P_FIA4300_S = async function(workType) {
    	var rowNo    = grdAstDsps.getRow();
    	var rowData = grdAstDsps.getRowData(rowNo);
 
    	var dspsNo = SBUxMethod.get("srch-ast-assetDisposalNo");// 처분번호
		var rmrk = SBUxMethod.get("srch-ast-memomemo"); //비고
		var astNm = SBUxMethod.get("srch-ast-assetName"); //자산명
		var astQntt = SBUxMethod.get("srch-dsps-disposalQty"); //처분수량
		var acntgCrtr = SBUxMethod.get("srch-slt-acctRuleCodeP"); // 회계기준 cboacct_rule_code_p
		var bplc = gfnma_multiSelectGet("#srch-slt-siteCode");//cbosite_code1 검색조건 사업장
		var dspsYmdFrom = SBUxMethod.get("srch-dtp-disposalDateFrom"); //처분일 from ymddisposal_date_fr
    	var dspsYmdTo = SBUxMethod.get("srch-dtp-disposalDateTo"); //처분일 to ymddisposal_date_to
    	var astno = SBUxMethod.get("srch-ast-assetNo");//자산내역 자산 txtasset_no
    	var cnpt = SBUxMethod.get("srch-dsps-csCode"); //거래처 txtcs_code1
    	var tkcgdept = SBUxMethod.get("srch-dsps-deptCode"); // 담당부서 txtdept_code1
    	var pic = SBUxMethod.get("srch-dsps-empCode"); // 담당자 txtemp_code1
    	var costCenter = SBUxMethod.get("srch-dsps-costCenterCode"); // 원가중심점
 
    	var ntAsstncAmt = SBUxMethod.get("srch-num-subsidiesAmount"); // 원가중심점
    	var bookValue = SBUxMethod.get("srch-ast-bookValue"); //장부가액
    	var disposalPl = SBUxMethod.get("srch-dsps-disposalPl");//처분손익
    	var taxSiteCode = SBUxMethod.get("srch-dsps-taxSiteCode");//장부가액
    	var vatType = gfnma_multiSelectGet("#srch-dsps-vatType") ;//부가세유형
    	var vatRate = SBUxMethod.get("srch-dsps-vatRate"); // 부가세비율
    	var exchangeRate = parseInt(SBUxMethod.get("srch-dsps-exchangeRate")); //환율
    	var disposalOriginalAmount = SBUxMethod.get("srch-dsps-disposalOriginalAmount"); //매각금액
    	var dispFunctionalAmt = SBUxMethod.get("srch-dsps-dispFunctionalAmt");//환산금액
    	var vatAmount = SBUxMethod.get("srch-dsps-vatAmount"); //부가세
    	var expenseCsCode = SBUxMethod.get("srch-dsps-expenseCsCode");//비용거래처
    	var expenseVatType = gfnma_multiSelectGet("#srch-dsps-expenseVatType") ;//비용부가세유형
    	var expenseVatRate = SBUxMethod.get("srch-dsps-expenseVatRate"); // 비용부가세비율
    	var expenseAccount = SBUxMethod.get("srch-dsps-expenseAccount"); //
    	var expenseCurrencyCode = gfnma_multiSelectGet("#srch-dsps-expenseCurrencyCode"); //통화
    	var expenseExchangeRate = SBUxMethod.get("srch-dsps-expenseExchangeRate"); //환율 //
    	var expenseAmount = SBUxMethod.get("srch-dsps-expenseAmount"); //
    	var expenseVatAmount = SBUxMethod.get("srch-dsps-expenseVatAmount"); //
    	var memomemo = SBUxMethod.get("srch-ast-memomemo"); //비고
    	var currencyCode = gfnma_multiSelectGet("#srch-dsps-currencyCode")
    	var originalAssetDispNo = SBUxMethod.get("srch-ast-originalAssetDispNo"); //
    	var disposalQty = SBUxMethod.get("srch-dsps-disposalQty"); //
    	var disposalType = SBUxMethod.get("srch-ast-disposalType"); // 처분유형
 
    	var outAcquisitionAmount = SBUxMethod.get("srch-ast-acquisitionAmount1"); // 취득가액
    	var outSubsidiesAmount = SBUxMethod.get("srch-out-subsidiesAmount"); //국고보조금
    	var outDepreciationAmount = SBUxMethod.get("srch-ast-depreciationAmount"); //감가상각비
    	var outSubsidiesDepr = SBUxMethod.get("srch-ast-subsidiesDepr"); //국고보조금상각
    	var outAccumDepr = SBUxMethod.get("srch-ast-accumDepr"); //상각누계액
    	var outSubsidiesAccDepr = SBUxMethod.get("srch-ast-subsidiesAccDepr"); //보조금상각누계액
 
    	//var  = gfnma_nvl(SBUxMethod.get("")); //
 
		var paramObj = {
    		    V_P_DEBUG_MODE_YN  : ''
    		    ,V_P_LANG_ID         :     ''
	   		    ,V_P_COMP_CODE       :     gfnma_nvl(gv_ma_selectedCorpCd)
    		    ,V_P_CLIENT_CODE     :     gfnma_nvl(gv_ma_selectedClntCd)
 
    		    ,V_P_ACCT_RULE_CODE  :    gfnma_nvl(acntgCrtr)
    		    ,IV_P_ASSET_DISPOSAL_NO : gfnma_nvl(dspsNo)
    		    ,V_P_SITE_CODE       :  gfnma_nvl(bplc)
    		    ,V_P_DISPOSAL_DATE   : gfnma_nvl(dspsYmdFrom)
    		    ,V_P_DISPOSAL_TYPE   : gfnma_nvl(disposalType)
    		    ,V_P_ASSET_NO        : gfnma_nvl(astno)
    		    ,V_P_CS_CODE         : gfnma_nvl(cnpt)
    		    ,V_P_DEPT_CODE       : gfnma_nvl(tkcgdept)
    		    ,V_P_EMP_CODE        : gfnma_nvl(pic)
    		    ,V_P_COST_CENTER_CODE  : gfnma_nvl(costCenter)
    		    ,V_P_OUT_ACQUISITION_AMOUNT : gfnma_nvl(outAcquisitionAmount)
    		    ,V_P_OUT_SUBSIDIES_AMOUNT   : gfnma_nvl(outSubsidiesAmount)
    		    ,V_P_OUT_DEPRECIATION_AMOUNT : gfnma_nvl(outDepreciationAmount)
    		    ,V_P_OUT_SUBSIDIES_DEPR      : gfnma_nvl(outSubsidiesDepr)
    		    ,V_P_OUT_ACCUM_DEPR          : gfnma_nvl(outAccumDepr)
    		    ,V_P_OUT_SUBSIDIES_ACC_DEPR  : gfnma_nvl(outSubsidiesAccDepr)
    		    ,V_P_BOOK_VALUE              : gfnma_nvl(bookValue)
    		    ,V_P_DISPOSAL_PL             : gfnma_nvl(disposalPl)
    		    ,V_P_TAX_SITE_CODE           : gfnma_nvl(taxSiteCode)
    		    ,V_P_VAT_TYPE                : gfnma_nvl(vatType)
    		    ,V_P_VAT_RATE                : gfnma_nvl(vatRate)
    		    ,V_P_CURRENCY_CODE           : gfnma_nvl(currencyCode)
    		    ,V_P_EXCHANGE_RATE           : gfnma_nvl(exchangeRate)
    		    ,V_P_DISPOSAL_ORIGINAL_AMOUNT: gfnma_nvl(disposalOriginalAmount)
    		    ,V_P_DISP_FUNCTIONAL_AMT     : gfnma_nvl(dispFunctionalAmt)
    		    ,V_P_VAT_AMOUNT              : gfnma_nvl(vatAmount)
    		    ,V_P_EXPENSE_CS_CODE         : gfnma_nvl(expenseCsCode)
    		    ,V_P_EXPENSE_VAT_TYPE        : gfnma_nvl(expenseVatType)
    		    ,V_P_EXPENSE_VAT_RATE        : gfnma_nvl(expenseVatRate)
    		    ,V_P_EXPENSE_ACCOUNT         : gfnma_nvl(expenseAccount)
    		    ,V_P_EXPENSE_CURRENCY_CODE   : gfnma_nvl(expenseCurrencyCode)
    		    ,V_P_EXPENSE_EXCHANGE_RATE   : gfnma_nvl(expenseExchangeRate)
    		    ,V_P_EXPENSE_AMOUNT          : gfnma_nvl(expenseAmount)
    		    ,V_P_EXPENSE_VAT_AMOUNT      : gfnma_nvl(expenseVatAmount)
    		    ,V_P_MEMO                    : gfnma_nvl(memomemo)
    		    ,V_P_ORIG_ASSET_DISP_NO      : gfnma_nvl(originalAssetDispNo)
    		    ,V_P_DISPOSAL_QTY            : gfnma_nvl(disposalQty)
 
    		    ,V_P_FORM_ID      : p_formId
    		    ,V_P_MENU_ID     :  p_menuId
    		    ,V_P_PROC_ID     :   ''
    		    ,V_P_USERID       :   ''
    		    ,V_P_PC             :   ''
    	}
 
    	 const postJsonPromise = gfn_postJSON("/fi/fia/selectFia4300S.do", {
         	getType				: 'json',
         	workType			: workType,
         	cv_count			: '0',
         	params				: gfnma_objectToString(paramObj)
 		});
 
    	const data = await postJsonPromise;
    	try{
    		let resultStatus = data.resultStatus;
    		if(resultStatus === "S"){
    			return true;
    		}else if (resultStatus === "P" || resultStatus === "E"){
    			alert(data.resultMessage)
    			return false;
    		}
 
    	}catch{
    		 if (!(e instanceof Error)) {
                 e = new Error(e);
             }
             console.error("failed", e.message);
             gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    	}
 
 
    }
 
 
	const fnSET_P_FIA4300_S1 = async function(workType) {
    	var rowNo    = grdAstDsps.getRow();
    	var rowData = grdAstDsps.getRowData(rowNo);
    	var dspsNo = gfnma_nvl(SBUxMethod.get("srch-ast-assetDisposalNo"));// 처분번호
    	var acntgCrtr = gfnma_nvl(SBUxMethod.get("srch-ast-acctRuleCode")); //회계기준
		var rmrk = gfnma_nvl(SBUxMethod.get("srch-inp-astTab-rmrk1")); //비고
		var astNm = gfnma_nvl(SBUxMethod.get("srch-ast-assetName")); //자산명
		var astQntt = gfnma_nvl(SBUxMethod.get("srch-dsps-disposalQty")); //처분수량
		var bookValue = gfnma_nvl(SBUxMethod.get("srch-ast-bookValue"));
		var memomemo = gfnma_nvl(SBUxMethod.get("srch-ast-memomemo"));
		var acquisitionAmount = gfnma_nvl(SBUxMethod.get("srch-dsps-acquisitionAmount"));
		var accumulatedDepreciation = gfnma_nvl(SBUxMethod.get("srch-ast-accumulatedDepreciation"));
 
		var paramObj = {
 
    		    V_P_DEBUG_MODE_YN  : 'N'
    		    ,V_P_LANG_ID            :     'KOR'
    		    ,V_P_COMP_CODE       :     gv_ma_selectedCorpCd
    		    ,V_P_CLIENT_CODE     :     gv_ma_selectedClntCd
    		    ,V_P_ASSET_DISPOSAL_NO       : dspsNo
    		    ,V_P_DISPOSAL_SEQ             : ''
    		    ,V_P_ASSET_NAME               : astNm
    		    ,V_P_ASSET_SPEC               : ''
    		    ,V_P_ASSET_QTY                : astQntt
    		    ,V_P_UNIT_CODE                : ''
    		    ,V_P_ACQUISITION_AMOUNT       : acquisitionAmount
    		    ,V_P_GOVERNMENT_SUBSIDIES    : ''
    		    ,V_P_ACCUMULATED_DEPRECIATION :  accumulatedDepreciation
    		    ,V_P_BOOK_VALUE               : bookValue
    		    ,V_P_MEMO                     : memomemo
    		    ,V_P_FORM_ID      : p_formId
    		    ,V_P_MENU_ID     :  p_menuId
    		    ,V_P_PROC_ID     :   ''
    		    ,V_P_USERID       :   p_userId
    		    ,V_P_PC             :   ''
    	}
 
    	 const postJsonPromise = gfn_postJSON("/fi/fia/selectFia4300S1.do", {
         	getType				: 'json',
         	workType			: workType,
         	cv_count			: '0',
         	params				: gfnma_objectToString(paramObj)
 		});
 
    	const data = await postJsonPromise;
    	try{
    		let resultStatus = data.resultStatus;
    		if(resultStatus === "S"){
    			return true;
    		}else if (resultStatus === "P" || resultStatus === "E"){
    			return false;
    		}
 
    	}catch{
    		 if (!(e instanceof Error)) {
                 e = new Error(e);
             }
             console.error("failed", e.message);
             gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    	}
 
    	return data;
 
    }
 
 
    const fn_setFia4300S2 = async function(workType) {
    	var rowNo    = grdAstDsps.getRow();
    	var rowData = grdAstDsps.getRowData(rowNo);
 
    	var dspsNo = SBUxMethod.get("srch-ast-assetDisposalNo");// 처분번호
    	var acntgCrtr = SBUxMethod.get("srch-ast-acctRuleCode"); //회계기준
		var bResult = true;
    	var paramObj = {
    		    V_P_DEBUG_MODE_YN  : ''
    		    ,V_P_LANG_ID            :     ''
    		    ,V_P_COMP_CODE       :     gv_ma_selectedCorpCd
    		    ,V_P_CLIENT_CODE     :     gv_ma_selectedClntCd
    		    ,V_P_ACCT_RULE_CODE  : gfnma_nvl(acntgCrtr)
    		    ,V_P_ASSET_DISPOSAL_NO : gfnma_nvl(rowData.assetDisposalNo)
    		    ,V_P_ASSET_NO : gfnma_nvl(rowData.assetNo)
    		    ,V_P_DISPOSAL_TYPE     : gfnma_nvl(rowData.disposalType)
    		    ,V_P_DISPOSAL_DATE  : gfnma_nvl(rowData.disposalDate)
    		    ,V_P_FORM_ID      : p_formId
    		    ,V_P_MENU_ID     :  p_menuId
    		    ,V_P_PROC_ID     :   ''
    		    ,V_P_USERID       :   ''
    		    ,V_P_PC             :   ''
    	}
 
    	 const postJsonPromise = gfn_postJSON("/fi/fia/selectFia4300S2.do", {
         	getType				: 'json',
         	workType			: workType,
         	cv_count			: '0',
         	params				: gfnma_objectToString(paramObj)
 		});
 
    	const data = await postJsonPromise;
    	try{
    		if(data.resultStatus.startsWith("P") && data.resultStatus.startsWith("E")){
    			bResult = false;
    			//gfn_comAlert(data.resultMessage);//"해당월 마감 등 에러메시지 출력"
    			alert(data.resultMessage);
    		}else{
    			bResult = true;
    		}
 
    	}catch{
    		 if (!(e instanceof Error)) {
                 e = new Error(e);
             }
             console.error("failed", e.message);
             gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    	}
 
    	return bResult;
 
    }
 
    const newClick = function(){
    	//InitControls(panMaster);
        //InitControls(panTpg2);
        //InitControls(grdDetail);
        SBUxMethod.refreshGroup("dsps1");
        SBUxMethod.refreshGroup("ast1");
        SBUxMethod.refreshGroup("group1");
 
        //ymddisposal_date.EditValue = CurrentDate("");
        //cbocurrency_code.EditValue = SessionInfo.BaseCurrCode;
        SBUxMethod.set("srch-dtp-disposalDateTo","");
 
 
        //cbodisposal_type.Focus();
        SBUxMethod.focus("srch-slt-disposalType");
 
        saveButton = false;
        deleteButton = false;
 
        fnVisivleControl(true);
 
        //fnSetPanMasterReadOnly(false);
 
        //lblacquisition_amount.Visible = true;
        //numacquisition_amount.Visible = true;
        $('.td_input.acqsAmt2').show();
   	    $('.th_bg.acqsAmt2').show();
 
        //lblbegin_acquisition_amount.Visible = true;
        //numbegin_acquisition_amount.Visible = true;
        $('.td_input.bssAcqsAmt').show();
   	    $('.th_bg.bssAcqsAmt').show();
 
 
        //lblsubsidies_amount.Visible = true;
        //numsubsidies_amount.Visible = true;
        $('.td_input.ntAsstncAmt2').show();
    	$('.th_bg.ntAsstncAmt2').show();
 
        //lblbegin_subsidies_amount.Visible = true;
        //numbegin_subsidies_amount.Visible = true;
        $('.td_input.bssNtAsstncAmt').show();
    	$('.th_bg.bssNtAsstncAmt').show();
 
        //lblaccumulated_depreciation.Visible = true;
        //numaccumulated_depreciation.Visible = true;
        $('.td_input.dprcAtAmt2').show();
    	$('.th_bg.dprcAtAmt2').show();
 
        //lblsubsidies_acc_depreciation.Visible = true;
        //numsubsidies_acc_depreciation.Visible = true;
        $('.td_input.asstncAmtDprcTotAmt').show();
	    $('.th_bg.asstncAmtDprcTotAmt').show();
 
        //lblout_acquisition_rate.Visible = true;
        //numout_acquisition_rate.Visible = true;
        $('.td_input.dspsRt').show();
	    $('.th_bg.dspsRt').show();
 
        //lblout_acquisition_amount_event.Visible = true;
        //numout_acquisition_amount_event.Visible = true;
        $('.td_input.dprcAtAmt2').show();
	    $('.th_bg.dprcAtAmt2').show();
 
        //txtcost_center_code.Properties.Popup.WhereQuery = "COST_CLASS = '2'";
        //txtcost_center_name.Properties.Popup.WhereQuery = "COST_CLASS = '2'";
    }
	const saveClick = async function(){
          if (!fnDataValidation())
              return;
 
		  // gvwDetail의 값이 언제 셋팅되는지 확인하고 어떤 값인지도 확인해야함 (숨어있음) -> 처분 그리드인듯...?
          //  for (int i = 0; i < gvwDetail.RowCount; i++){
          //      if (double.Parse(gvwDetail.GetValue(i, "stock_qty").ToString()) < double.Parse(gvwDetail.GetValue(i, "asset_qty").ToString())){
          //          SetMessageBox(gvwDetail.GetValue(i, "asset_name").ToString() + GetFormMessage("FIA4300_003"), IconType.Error);
          //          // 의 처분수량이 재고수량보다 많습니다. 처분수량을 확인해 주시기 바랍니다.
          //          return;
          //      }
          //  }
 
          	grdAstDsps.getGridDataAll().forEach((item,i)=>{
          		if(item.stockQty < item.assetQty ){
          			return;
          		}
          	})
 
 
            let strStatus = "";
			let dspsNo = gfnma_nvl(SBUxMethod.get("srch-ast-assetDisposalNo"));
            if (dspsNo  == ""){
            	strStatus = "N";
            }else{
                strStatus = "U";
            }
            let chk = await fnSET_P_FIA4300_S(strStatus);
            if (!chk)
                return;
			let chk2 = await fnSET_P_FIA4300_S1("");
 
            if (chk2){
                //let strFocus = txtasset_disposal_no.Text;
                //queryClick();
                //gvwHeader.FocusedRowHandle = GetGridRowIndex(grdHeader, "asset_disposal_no", strFocus);
            }
 	}
 
    //선택 삭제
    function deleteClick() {
		if(gfn_comConfirm("Q0001", "삭제")){ //{0} 하시겠습니까?
			if (fnSET_P_FIA4300_S("D")){
                    queryClick();
                }
		}
    }
 
	const fnSetPanMasterReadOnly = function(chk){
		//txtasset_no.Properties.ReadOnly = bReadOnly;
        //txtasset_name.Properties.ReadOnly = bReadOnly;
        SBUxMethod.attr('srch-inp-assetNo', 'readonly', 'true');
        SBUxMethod.attr('srch-ast-assetName', 'readonly', 'true');
 
        //cbodisposal_type.Properties.ReadOnly = bReadOnly;
        //ymddisposal_date.Properties.ReadOnly = bReadOnly;
        //cbosite_code.Properties.ReadOnly = bReadOnly;
 
        SBUxMethod.attr('srch-slt-disposalType', 'readonly', 'true');
        SBUxMethod.attr('srch-dtp-disposalDate', 'readonly', 'true');
        SBUxMethod.attr('srch-slt-siteCode', 'readonly', 'true');
 
		if(chk){
			//txtasset_no.Properties.Popup.BizComponentID = "";
            //txtasset_name.Properties.Popup.BizComponentID = "";
		}else{
			//txtasset_no.Properties.Popup.BizComponentID = "P_ASSET_LIST";
            //txtasset_name.Properties.Popup.BizComponentID = "P_ASSET_LIST";
		}
	}
 
    const fn_dtpChange = async function(){
    	let inptYmdFrom = SBUxMethod.get("srch-dtp-disposalDateFrom");
    	let inptYmdTo = SBUxMethod.get("srch-dtp-disposalDateTo");
 
    	//if(inptYmdFrom > inptYmdTo){
    	//	gfn_comAlert("W0014", "시작일자", "종료일자");//W0014 {0}이/가 {1} 보다 큽니다.
    	//	SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
    	//	SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
    	//	return;
    	//}
 
     }
 
 
 
    const fn_dspsCloseAfter = async function(){
    	var ast = SBUxMethod.get("srch-inp-assetNo"); //자산내역 자산 ->
    	var acntgCrtr = SBUxMethod.get("srch-ast-acctRuleCode");// 회계기준
    	var strWrkType = "";
    	if( ast != ""){
    		strWrkType = "ASSET";
 
    		if(acntgCrtr === "2"){
    			strWrkType += "_IFRS";
    		}
    		fnQRY_P_FIA4300_Q1(strWrkType,"");
    	}
    	saveButton = true;
    	var strWrkType = "";
    	if( ast != ""){
    		strWrkType = "ASSET";
 
    		if(acntgCrtr === "2"){
    			strWrkType += "_IFRS";
    		}
    		fnQRY_P_FIA4300_Q1(strWrkType,"");
    	}
    	saveButton = true;
 
    }
 
    const fn_dspsNoChange = async function(){
    	var dspsNo = SBUxMethod.get("srch-ast-assetDisposalNo"); //처분번호
    	var astNo = SBUxMethod.get("srch-inp-assetNo"); // 자산번호
    	if( dspsNo === "" & astNo != ""){
    		fn_fia4300Q("ASSETLIST");
    	}
    }
 
    const fnVisivleControl = function(chk){
		 if(chk){
			 //lblacquisition_amount.Visible = bVisible; 취득가액
	    	 $('.td_input.acqsAmt2').hide();
	    	 $('.th_bg.acqsAmt2').hide();
	         //lblsubsidies_amount.Visible = bVisible; 국고보조금
	         $('.td_input.ntAsstncAmt2').hide();
	    	 $('.th_bg.ntAsstncAmt2').hide();
	         //lblaccumulated_depreciation.Visible = bVisible; 감가상각누계액
	         $('.td_input.dprcAtAmt2').hide();
	    	 $('.th_bg.dprcAtAmt2').hide();
	         //lblsubsidies_acc_depreciation.Visible = bVisible; 보조금감가상각누계액
	         $('.td_input.asstncAmtDprcTotAmt').hide();
	    	 $('.th_bg.asstncAmtDprcTotAmt').hide();
	         //lblout_acquisition_rate.Visible = bVisible; 처분비율
	         $('.td_input.dspsRt').hide();
	    	 $('.th_bg.dspsRt').hide();
	         //lblout_acquisition_amount_event.Visible = bVisible;처분금액
	         $('.td_input.dprcAtAmt2').hide();
	    	 $('.th_bg.dprcAtAmt2').hide();
		 }else{
		 	 //lblacquisition_amount.Visible = bVisible; 취득가액
	    	 $('.td_input.acqsAmt2').show();
	    	 $('.th_bg.acqsAmt2').show();
	         //lblsubsidies_amount.Visible = bVisible; 국고보조금
	         $('.td_input.ntAsstncAmt2').show();
	    	 $('.th_bg.ntAsstncAmt2').show();
	         //lblaccumulated_depreciation.Visible = bVisible; 감가상각누계액
	         $('.td_input.dprcAtAmt2').show();
	    	 $('.th_bg.dprcAtAmt2').show();
	         //lblsubsidies_acc_depreciation.Visible = bVisible; 보조금감가상각누계액
	         $('.td_input.asstncAmtDprcTotAmt').show();
	    	 $('.th_bg.asstncAmtDprcTotAmt').show();
	         //lblout_acquisition_rate.Visible = bVisible; 처분비율
	         $('.td_input.dspsRt').show();
	    	 $('.th_bg.dspsRt').show();
	         //lblout_acquisition_amount_event.Visible = bVisible;처분금액
	         $('.td_input.dprcAtAmt2').show();
	    	 $('.th_bg.dprcAtAmt2').show();
 
		 }
    }
 
    const fnDataValidation = function(){
 		//component_value 값이 undefined or null or "" 인경우 return 되도록
		let astData = SBUxMethod.getGroupData("ast1");
		let dspsData = SBUxMethod.getGroupData("dsps1");
 		let chkValidation1 = true;
 		let chkValidation2 = true;
 
 		astData.some(x => {
			let chk = x.component_value;
			if(chk === undefined || chk === null || chk === ""){
				chkValidation1 = false;
				return true;
			}
		})
 
		dspsData.some(x => {
			let chk = x.component_value;
			if(chk === undefined || chk === null || chk === ""){
				chkValidation2 = false;
				return true;
			}
		})
		if(chkValidation1 && chkValidation2){
			return true;
		}else{
			return false;
		}
 
 	}
 
 
 
    /**
     * 공통팝업
     * 거래처코드
     */
     //
    var fn_cnptPopup = function(id) {
 
    	var cdId = "";
    	var nmId = "";
 
    	if(id === "srch-inp-csName"){
    		cdId = "srch-inp-csCode";
    		nmId = "srch-inp-csName";
    	}else if (id === "srch-dsps-csName"){
    		cdId = "srch-dsps-csCode";
    		nmId = "srch-dsps-csName";
    	}
 
        var searchCode 		= gfnma_nvl(SBUxMethod.get(cdId));
        var searchName 		= gfnma_nvl(SBUxMethod.get(nmId));
 
 
 
        var replaceText0 	= "_CNPT_CD_";
        var replaceText1 	= "_CNPT_NM_";
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%' ";
 
        //var strWhereClause 	= "AND x.CNPT_CD LIKE '%" + replaceText0 + "%' AND x.CNPT_NM LIKE '%" + replaceText1 + "%'";
 
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COM008'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["CNPT_CD", 	"CNPT_NM"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["거래처코드", 	"거래처명"]
   			,tableColumnNames		: ["CNPT_CD",	"CNPT_NM"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set(cdId, 		data.CNPT_CD);
				SBUxMethod.set(nmId,		data.CNPT_NM);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}
 
    /**
     * 공통팝업
     * 담당부서
     */
     //
    var fn_tkcgDeptPopup = function(id) {
 
    	var cdId = "";
    	var nmId = "";
 
    	if(id === "srch-inp-deptName"){
    		cdId = "srch-inp-deptCode";
    		nmId = "srch-inp-deptName";
    	}else if (id === "srch-dsps-deptName"){
    		cdId = "srch-dsps-deptCode";
    		nmId = "srch-dsps-deptName";
    	}
 
        var searchCode 		= gfnma_nvl(SBUxMethod.get(cdId));
        var searchName 		= gfnma_nvl(SBUxMethod.get(nmId));
        var replaceText0 	= "_DEPT_CD_";
        var replaceText1 	= "_DEPT_NM_";
 
 
 
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 정보 팝업');
    	var addParams = [searchCode|searchName|null];
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FI_DEPT'
        	,popupType				: 'B'
    		,whereClause			: addParams
   			,searchCaptions			: ["부서코드", 				"부서명"]
   			,searchInputFields		: ["DEPT_CD", 	"DEPT_NM"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,searchInputTypes		: ["input", 			"input"]
    		,height					: '400px'
   			,tableHeader			: ["부서코드", 	"부서명","부서장","부서장명"]
   			,tableColumnNames		: ["DEPT_CD",	"DEPT_NM","DEPT_TMLDR","DEPT_LEADER_NAME"]
   			,tableColumnWidths		: ["120px", 	"120px","120px","120px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set(cdId, 		data.DEPT_CD);
				SBUxMethod.set(nmId,		data.DEPT_NM);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}
 
 
 
    /**
     * 공통팝업
     * 담당자
     */
     //
    var fn_picPopup= function(id) {
 
    	var cdId = "";
    	var nmId = "";
 
    	if(id === "srch-inp-empName"){
    		cdId = "srch-inp-empCode";
    		nmId = "srch-inp-empName";
    	}else if (id === "srch-dsps-empName"){
    		cdId = "srch-dsps-empCode";
    		nmId = "srch-dsps-empName";
    	}
 
        var searchCode 		= gfnma_nvl(SBUxMethod.get(cdId));
        var searchName 		= gfnma_nvl(SBUxMethod.get(nmId));
        var replaceText0 	= "_EMP_CD_";
        var replaceText1 	= "_EMP_NM_";
        var strWhereClause 	= "AND EMP_CODE LIKE '%" + replaceText0 + "%' AND EMP_NAME LIKE '%" + replaceText1 + "%' ";
 
 
    	SBUxMethod.attr('modal-compopup1', 'header-title', '담당자정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_HRI001'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["EMP_CD", 	"EMP_NM"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["담당자코드", 	"담당자명"]
   			,tableColumnNames		: ["EMP_CD",	"EMP_NM"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set(cdId, 		data.EMP_CD);
				SBUxMethod.set(nmId,		data.EMP_NM);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}
 
 
    /**
     * 공통팝업
     * 자산
     */
     //
    var fn_astPopup= function() {
 
        var searchCode 		= gfnma_nvl(SBUxMethod.get("srch-ast-assetNo"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-ast-assetName"));
        var replaceText0 	= "_ASST_NO_";
        var replaceText1 	= "_ASST_NM_";
        var strWhereClause 	= "AND ASST_NO LIKE '%" + replaceText0 + "%' AND ASST_NM LIKE '%" + replaceText1 + "%' ";
 
 
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산정보');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ASSET_LIST'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["번호", 				"명칭"]
   			,searchInputFields		: ["ASST_NO", 	"ASST_NM"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["자산번호", 	"자산명"]
   			,tableColumnNames		: ["ASST_NO",	"ASST_NM"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-ast-assetNo', 		data.ASST_NO);
				SBUxMethod.set('srch-ast-assetName',		data.ASST_NM);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}
 
    /**
     * 공통팝업
     * 코스트센터 (원가중심점)
     */
     //
    var fn_costCenterPopup= function() {
 
        var searchCode 		= gfnma_nvl(SBUxMethod.get("srch-dsps-costCenterCode"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-dsps-costCenterName"));
        var replaceText0 	= "_CSTCD_CD_";
        var replaceText1 	= "_CSTCD_NM_";
 
        var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";
 
    	SBUxMethod.attr('modal-compopup1', 'header-title', '코스트센터');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COST_CENTER'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["CSTCD_CD", 	"CSTCD_NM"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["코스트센터코드", 	"코스트센터명"]
   			,tableColumnNames		: ["CSTCD_CD", 	"CSTCD_NM"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-dsps-costCenterCode', 		data.CSTCD_CD);
				SBUxMethod.set('srch-dsps-costCenterName',		data.CSTCD_NM);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}
 
    /**
     * 공통팝업
     * 비용거래처
     */
     //
    var fn_cstCnptPopup= function() {
 
        var searchCode 		= gfnma_nvl(SBUxMethod.get("srch-dsps-expenseCsCode"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-dsps-expenseCsName"));
        var replaceText0 	= "_CNPT_CD_";
        var replaceText1 	= "_CNPT_NM_";
        var strWhereClause 	= "AND CS_CODE LIKE '%" + replaceText0 + "%' AND CS_NAME LIKE '%" + replaceText1 + "%' ";
 
    	SBUxMethod.attr('modal-compopup1', 'header-title', '비용거래처');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_CS_PURCHASE'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["CNPT_CD", 	"CNPT_NM"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["비용거래처코드", 	"비용거래처명"]
   			,tableColumnNames		: ["CNPT_CD", 	"CNPT_NM"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-dsps-expenseCsCode', 		data.CNPT_CD);
				SBUxMethod.set('srch-dsps-expenseCsName',		data.CNPT_NM);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}
 
    /**
     * 공통팝업
     * 처분비용계정
     */
     //
    var fn_dspsCstCnptPopup= function() {
 
        var searchCode 		= gfnma_nvl(SBUxMethod.get("srch-dsps-expenseAccount"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-dsps-expenseAccountName"));
        var replaceText0 	= "_ACNTL_CD_";
        var replaceText1 	= "_ACNT_NM_";
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
 
    	SBUxMethod.attr('modal-compopup1', 'header-title', '처분비용계정');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["ACNTL_CD", 	"ACNT_NM"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["처분계정코드", 	"처분계정명"]
   			,tableColumnNames		: ["ACNTL_CD", 	"ACNT_NM"]
   			,tableColumnWidths		: ["80px", 	"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-dsps-expenseAccount', 		data.ACNTL_CD);
				SBUxMethod.set('srch-dsps-expenseAccountName',		data.ACNT_NM);
			},
    	});
    	SBUxMethod.setModalCss('modal-compopup1', {width:'800px'});
    	SBUxMethod.openModal('modal-compopup1');
  	}
 
    /** camelCase FN **/
    function toCamelCase(snakeStr) {
        return snakeStr.toLowerCase().replace(/_([a-z])/g, (match, letter) => letter.toUpperCase());
    }
 
    function convertArrayToCamelCase(array) {
        return array.map(obj => {
            return Object.keys(obj).reduce((acc, key) => {
                const camelKey = toCamelCase(key);
                acc[camelKey] = obj[key];
                return acc;
            }, {});
        });
    }
 
    function fn_hiddenChange(chk){
    	let tdElements = document.querySelectorAll('.th_bg.group2');
    	let tdElements2 = document.querySelectorAll('.td_input.group2');
 
    	tdElements.forEach(td => {
    		  td.hidden = chk; // hidden 속성을 false로 설정
    		});
    	tdElements2.forEach(td => {
  		  td.hidden = chk; // hidden 속성을 false로 설정
  		});
 
    	//SBUxMethod.changeGroupAttr('group2', 'readonly', chk.toString());
    }
 
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp"%>
</html>
