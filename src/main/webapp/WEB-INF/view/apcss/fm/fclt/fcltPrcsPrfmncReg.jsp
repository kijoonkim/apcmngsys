<%
 /**
  * @Class Name : fcltPrcsPrfmncReg.jsp
  * @Description : 5.3.산지유통시설처리실적 화면
  * @author SI개발부
  * @since 2023.12.12
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.12.12   	김현호		최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>title : SBUx2.6</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid" style="height: 100vh">
			<div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background-color: white; z-index: 99" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 산지유통처리실적 -->
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnSearchPy" name="btnSearchPy" uitype="normal" text="전년도 데이터" class="btn btn-sm btn-outline-danger" onclick="fn_pySearch"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-primary" onclick="fn_search"></sbux-button>
				<sbux-button id="btnTmprStrg" name="btnTmprStrg" uitype="normal" text="임시저장" class="btn btn-sm btn-outline-danger" onclick="fn_tmprStrg"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[pp] 검색 -->
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
					<col style="width: 11%">
					<col style="width: 22%">
					<col style="width: 50px">
					<col style="width: 11%">
					<col style="width: 22%">
				<tbody>
					<tr>
						<th scope="row" style="border-bottom:1px solid white " >APC명</th>
						<td class="td_input" style="border-right:hidden;">
							<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="hidden" class="form-control input-sm" placeholder="" disabled></sbux-input>
							<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td>
							<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-apcSelect" onclick="fn_modalApcSelect" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>

						<th scope="row">조사연도</th>
						<td class="td_input"  style="border-right: hidden;">
							<%--<sbux-spinner
									id="srch-inp-crtrYr"
									name="srch-inp-crtrYr"
									uitype="normal"
									step-value="1"
									disabled
								></sbux-spinner>--%>
							<sbux-select
									id="srch-slt-crtrYr"
									name= "srch-slt-crtrYr"
									uitype="single"
									jsondata-ref="jsonCrtrYr"
									class="form-control input-sm"
							></sbux-select>
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			</div>

			<br>
			<!-- 진척도 추가 -->
			<%@ include file="prgrs/apcPrgrs.jsp" %>
			<br>

			<div>
				<label style="font-weight: bold;">○산지유통처리실적상세 상세내역 </label>
				<br>

				<label style="font-weight: bold;">- (산지유통시설 처리실적) </label>
				<label> 유통조직의 취급액 실적 중 APC에서 선별‧포장 등의 상품화 및/ 또는 장기저장 과정을 실시하여 판매한 실적을 기재</label>
				<br>

				<label>- APC에서 처리한 상품 : 원물 집하, 저온저장, 선별, 신선처리, 포장 등의 단계를 필수 또는 선택적으로 거친 상품을 말함</label>
				<label style="text-decoration: underline;">(단, 농가 개별선별 상품의 운송을 위한 단순수탁 실적은 제외)</label>
				<br>

				<label style="font-weight: bold;">(일반취급)</label>
				<label> 단순 매취 등의 물량 중 APC에서 저온저장, 신선처리, 포장 등의 처리를 거친 물량만 기재</label>
				<br>

				<label>* 데이터 입력 시 조사연도의 직전년도 기준으로 작성해주시기 바랍니다.</label>
			</div>
			<div>
				<table class="table table-bordered table-hover tbl_col tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 10%">
						<col style="width: 58px">

						<col style="width: 7%">
						<col style="width: 28px">
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 7%">
						<col style="width: 28px">
					</colgroup>
						<thead>
							<tr>
								<th class="text-center" rowspan="2">구분</th>
								<th class="text-center" rowspan="2" colspan="2">APC 일반취급<br>(단순 매취 등)</th>
								<th class="text-center" colspan="4">APC 조직화취급</th>
								<th class="text-center" rowspan="2" colspan="2">APC 취급액(A)</th>
								<th class="text-center" rowspan="2" colspan="2">APC 취급물량</th>
								<th class="text-center" rowspan="2" colspan="2">APC 취급액 중<br>산지유통통합조직 출하액(B)</th>
								<th class="text-center" rowspan="2" colspan="2">전속출하 비율(B/A*100)</th>
							</tr>
							<tr>
								<th style="text-align: center;" colspan="2">공선수탁</th>
								<th style="text-align: center;" colspan="2">계약매취</th>
							</tr>
							<tr>
								<th class="text-center">
									<span id="itemNm1">품목1</span>
									<sbux-input id="dtl-inp-itemChk1" name="dtl-inp-itemChk1" uitype="hidden"></sbux-input>
									<sbux-input id="dtl-inp-itemCd1" name="dtl-inp-itemCd1" uitype="hidden"></sbux-input>
									<div class="div-item-msg" id="div-item-msg1" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcGnrlTrmtAmt1"
										name="dtl-inp-apcGnrlTrmtAmt1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group1"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcGnrlTrmtAmt1')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcOgnzCprtnSortTrst1"
										name="dtl-inp-apcOgnzCprtnSortTrst1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group1"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcOgnzCprtnSortTrst1')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcCtrtEmspap1"
										name="dtl-inp-apcCtrtEmspap1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group1"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcCtrtEmspap1')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTrmtAmt1"
										name="dtl-inp-apcTrmtAmt1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTrmtVlm1"
										name="dtl-inp-apcTrmtVlm1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group1"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcTrmtVlm1')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>톤</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtAmt1"
										name="dtl-inp-apcTmSpmtAmt1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group1"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcTmSpmtAmt1')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtRt1"
										name="dtl-inp-apcTmSpmtRt1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>%</td>
							</tr>
							<tr>
								<th class="text-center">
									<span id="itemNm2">품목2</span>
									<sbux-input id="dtl-inp-itemChk2" name="dtl-inp-itemChk2" uitype="hidden"></sbux-input>
									<sbux-input id="dtl-inp-itemCd2" name="dtl-inp-itemCd2" uitype="hidden"></sbux-input>
									<div class="div-item-msg" id="div-item-msg2" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcGnrlTrmtAmt2"
										name="dtl-inp-apcGnrlTrmtAmt2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group2"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcGnrlTrmtAmt2')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcOgnzCprtnSortTrst2"
										name="dtl-inp-apcOgnzCprtnSortTrst2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group2"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcOgnzCprtnSortTrst2')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcCtrtEmspap2"
										name="dtl-inp-apcCtrtEmspap2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group2"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcCtrtEmspap2')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTrmtAmt2"
										name="dtl-inp-apcTrmtAmt2"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTrmtVlm2"
										name="dtl-inp-apcTrmtVlm2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group2"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcTrmtVlm2')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>톤</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtAmt2"
										name="dtl-inp-apcTmSpmtAmt2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group2"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcTmSpmtAmt2')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtRt2"
										name="dtl-inp-apcTmSpmtRt2"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>%</td>
							</tr>
							<tr>
								<th class="text-center">
									<span id="itemNm3">품목3</span>
									<sbux-input id="dtl-inp-itemChk3" name="dtl-inp-itemChk3" uitype="hidden"></sbux-input>
									<sbux-input id="dtl-inp-itemCd3" name="dtl-inp-itemCd3" uitype="hidden"></sbux-input>
									<div class="div-item-msg" id="div-item-msg3" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcGnrlTrmtAmt3"
										name="dtl-inp-apcGnrlTrmtAmt3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group3"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcGnrlTrmtAmt3')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcOgnzCprtnSortTrst3"
										name="dtl-inp-apcOgnzCprtnSortTrst3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group3"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcOgnzCprtnSortTrst3')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcCtrtEmspap3"
										name="dtl-inp-apcCtrtEmspap3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group3"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcCtrtEmspap3')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTrmtAmt3"
										name="dtl-inp-apcTrmtAmt3"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTrmtVlm3"
										name="dtl-inp-apcTrmtVlm3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group3"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcTrmtVlm3')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>톤</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtAmt3"
										name="dtl-inp-apcTmSpmtAmt3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group3"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcTmSpmtAmt3')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtRt3"
										name="dtl-inp-apcTmSpmtRt3"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>%</td>
							</tr>
							<tr>
								<th class="text-center">
									<span id="itemNm4">기타</span>
									<sbux-input id="dtl-inp-itemChk4" name="dtl-inp-itemChk4" uitype="hidden"></sbux-input>
									<sbux-input id="dtl-inp-itemCd4" name="dtl-inp-itemCd4" uitype="hidden"></sbux-input>
									<div class="div-item-msg" id="div-item-msg4" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcGnrlTrmtAmt4"
										name="dtl-inp-apcGnrlTrmtAmt4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group4"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcGnrlTrmtAmt4')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcOgnzCprtnSortTrst4"
										name="dtl-inp-apcOgnzCprtnSortTrst4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group4"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcOgnzCprtnSortTrst4')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcCtrtEmspap4"
										name="dtl-inp-apcCtrtEmspap4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group4"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcCtrtEmspap4')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTrmtAmt4"
										name="dtl-inp-apcTrmtAmt4"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTrmtVlm4"
										name="dtl-inp-apcTrmtVlm4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group4"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcTrmtVlm4')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>톤</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtAmt4"
										name="dtl-inp-apcTmSpmtAmt4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										group-id="group4"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
										onchange="fn_changeValue('dtl-inp-apcTmSpmtAmt4')"
										autocomplete="off"
									></sbux-input>
									<div class="div-msg" style="width:100%; font-size:0rem; text-wrap:nowrap;visibility:hidden"></div>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtRt4"
										name="dtl-inp-apcTmSpmtRt4"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>%</td>
							</tr>
							<tr class="extra-row">
								<th class="text-center">
									<span id="itemNmExtra">조정품목</span>
									<sbux-input id="dtl-inp-itemCdExtra" name="dtl-inp-extraItemCd" uitype="hidden"></sbux-input>
								</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
											id="dtl-inp-apcGnrlTrmtAmtExtra"
											name="dtl-inp-apcGnrlTrmtAmtExtra"
											uitype="text"
											class="form-control input-sm"
											placeholder=""
											group-id="groupExtra"
											mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
											onkeyup="fn_cal(this)"
											onchange="fn_changeValue('dtl-inp-apcGnrlTrmtAmtExtra')"
											autocomplete="off"
											readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
											id="dtl-inp-apcOgnzCprtnSortTrstExtra"
											name="dtl-inp-apcOgnzCprtnSortTrstExtra"
											uitype="text"
											class="form-control input-sm"
											placeholder=""
											group-id="groupExtra"
											mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
											onkeyup="fn_cal(this)"
											onchange="fn_changeValue('dtl-inp-apcOgnzCprtnSortTrstExtra')"
											autocomplete="off"
											readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
											id="dtl-inp-apcCtrtEmspapExtra"
											name="dtl-inp-apcCtrtEmspapExtra"
											uitype="text"
											class="form-control input-sm"
											placeholder=""
											group-id="groupExtra"
											mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
											onkeyup="fn_cal(this)"
											onchange="fn_changeValue('dtl-inp-apcCtrtEmspapExtra')"
											autocomplete="off"
											readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
											id="dtl-inp-apcTrmtAmtExtra"
											name="dtl-inp-apcTrmtAmtExtra"
											uitype="text"
											class="form-control input-sm"
											placeholder="자동계산"
											mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
											readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
											id="dtl-inp-apcTrmtVlmExtra"
											name="dtl-inp-apcTrmtVlmExtra"
											uitype="text"
											class="form-control input-sm"
											placeholder=""
											group-id="groupExtra"
											mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
											onkeyup="fn_cal(this)"
											onchange="fn_changeValue('dtl-inp-apcTrmtVlmExtra')"
											autocomplete="off"
											readonly
									></sbux-input>
								</td>
								<td>톤</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
											id="dtl-inp-apcTmSpmtAmtExtra"
											name="dtl-inp-apcTmSpmtAmtExtra"
											uitype="text"
											class="form-control input-sm"
											placeholder=""
											group-id="groupExtra"
											mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
											onkeyup="fn_cal(this)"
											onchange="fn_changeValue('dtl-inp-apcTmSpmtAmtExtra')"
											autocomplete="off"
											readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
											id="dtl-inp-apcTmSpmtRtExtra"
											name="dtl-inp-apcTmSpmtRtExtra"
											uitype="text"
											class="form-control input-sm"
											placeholder="자동계산"
											mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
											readonly
									></sbux-input>
								</td>
								<td>%</td>
							</tr>
							<tr>
								<th class="text-center">계</th>

								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcGnrlTrmtAmtTot"
										name="dtl-inp-apcGnrlTrmtAmtTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcOgnzCprtnSortTrstTot"
										name="dtl-inp-apcOgnzCprtnSortTrstTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcCtrtEmspapTot"
										name="dtl-inp-apcCtrtEmspapTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTrmtAmtTot"
										name="dtl-inp-apcTrmtAmtTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTrmtVlmTot"
										name="dtl-inp-apcTrmtVlmTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>톤</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtAmtTot"
										name="dtl-inp-apcTmSpmtAmtTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtRtTot"
										name="dtl-inp-apcTmSpmtRtTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>%</td>
							</tr>
							<tr>
								<th class="text-center">계</th>

								<td colspan="2">
									<sbux-input
										id="dtl-inp-apcGnrlTrmtAmtTot1"
										name="dtl-inp-apcGnrlTrmtAmtTot1"
										uitype="text"
										class="form-control input-sm"
										style="text-align: right;"
										placeholder="자동계산"
										readonly
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-apcOgnzCprtnSortTrstTot1"
										name="dtl-inp-apcOgnzCprtnSortTrstTot1"
										uitype="text"
										class="form-control input-sm"
										style="text-align: right;"
										placeholder="자동계산"
										readonly
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-apcCtrtEmspapTot1"
										name="dtl-inp-apcCtrtEmspapTot1"
										uitype="text"
										class="form-control input-sm"
										style="text-align: right;"
										placeholder="자동계산"
										readonly
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-apcTrmtAmtTot1"
										name="dtl-inp-apcTrmtAmtTot1"
										uitype="text"
										class="form-control input-sm"
										style="text-align: right;"
										placeholder="자동계산"
										readonly
									></sbux-input>
								</td>
								<td colspan="2">
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-apcTmSpmtAmtTot1"
										name="dtl-inp-apcTmSpmtAmtTot1"
										uitype="text"
										class="form-control input-sm"
										style="text-align: right;"
										placeholder="자동계산"
										readonly
									></sbux-input>
								</td>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- apc 선택 Modal -->
	<div>
		<sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:600px; z-index: 10000;"></sbux-modal>
	</div>
	<div id="body-modal-apcSelect">
		<jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/apcSelectPopup.jsp"></jsp:include>
	</div>

</body>
<script type="text/javascript">

	// 기준연도
	var jsonCrtrYr = [];
	// 전년도 데이터
	var jsonPrevData = [];
	// APC전수조사검증코드
	var jsonApcCmsuVrfcCd = [];

	window.addEventListener('DOMContentLoaded', function(e) {
		let date = new Date();
		let year  = date.getFullYear();
		SBUxMethod.set("srch-inp-crtrYr", year);
		/*
		if(gv_apcCd != 0000 || gv_apcCd != null || gv_apcCd != ""){
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};
		*/

		<c:if test="${loginVO.id eq 'admin'}">
		/*테스트*/
		let crtrYr = '2024';
		let apcCd = '0861';
		let apcNm = 'test';
		//SBUxMethod.set("srch-inp-crtrYr", crtrYr);
		//SBUxMethod.set("srch-inp-apcCd", apcCd);
		//SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		fn_init();

	});

	/* 초기세팅 */
	const fn_init = async function() {
		await fn_initSBSelect();

		await fn_selectUserApcList();//선택가능한 APC리스트 조회

		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			return;
		}
		await fn_search();
		//진척도
		await cfn_selectPrgrs();

	}

	const fn_initSBSelect = async function() {
		gfn_getApcSurveyCrtrYr('srch-slt-crtrYr',jsonCrtrYr); // 연도
		jsonApcCmsuVrfcCd =  await gfn_getComCdDtls('APC_CMSU_VRFC_CD'); // APC전수조사 검증 코드
	}

	/* 선택가능한 APC리스트 조회 */
	const fn_selectUserApcList = async function(){

		let postJsonPromise = gfn_postJSON("/fm/fclt/selectUserApcList.do", {

		});

		let data = await postJsonPromise;
		try{
			let apcListLength = data.resultList.length;
			if(apcListLength == 1){
				SBUxMethod.set("srch-inp-apcCd", data.resultList[0].apcCd);
				SBUxMethod.set("srch-inp-apcNm", data.resultList[0].apcNm);
			}else if (apcListLength > 1){
				//APC선택 팝업 열기
				fn_modalApcSelect();
				SBUxMethod.openModal("modal-apcSelect");
			}


		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	const fn_clearForm = async function() {

		const extraRow = document.querySelector('.extra-row');
		extraRow.style.display = 'none';
		SBUxMethod.clearGroupData('groupExtra');

		for (var sn = 1; sn < 5; sn++) {
			//SBUxMethod.set('dtl-inp-apcTrmtVlm'+sn,null);
			//SBUxMethod.set('dtl-inp-apcGnrlTrmtAmt'+sn,null);
			//SBUxMethod.set('dtl-inp-apcOgnzCprtnSortTrst'+sn,null);
			//SBUxMethod.set('dtl-inp-apcCtrtEmspap'+sn,null);
			//SBUxMethod.set('dtl-inp-apcTmSpmtAmt'+sn,null);

			//그룹 비활성화
			SBUxMethod.changeGroupAttr('group'+sn,'disabled','true');
			//그룹 초기화
			SBUxMethod.clearGroupData('group'+sn);

			// 아이템
			SBUxMethod.set('dtl-inp-itemChk'+sn,null);
			SBUxMethod.set('dtl-inp-itemCd'+sn,null);
		}
		fn_cal();
		$('#itemNm1').text("품목1");
		$('#itemNm2').text("품목2");
		$('#itemNm3').text("품목3");
		$('#itemNm4').text("기타");

		// 데이터 검증 메세지 초기화
		const msgDivs = document.getElementsByClassName('div-msg');
		for (let i = 0; i < msgDivs.length; i++) {
			msgDivs[i].style.visibility = 'hidden';
			msgDivs[i].style.fontSize = '0rem';
		}
		const tr = $('.div-msg').closest('tr');
		tr.find('td, th').css('vertical-align', 'middle');
		// 품목메세지
		const itemMsgDivs = document.getElementsByClassName('div-item-msg');
		for (let i = 0; i < itemMsgDivs.length; i++) {
			itemMsgDivs[i].style.visibility = 'hidden';
			itemMsgDivs[i].style.fontSize = '0rem';
		}
	}

	const fn_search = async function() {
		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			alert('APC를 선택해주세요');
			return;
		}
		await fn_clearForm();

		//진척도
		await cfn_selectPrgrs();

		// 전년도
		await fn_selectAtMcIfList(true);
		await fn_selectAtMcIfList();
	}

	/**
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_selectAtMcIfList = async function(isPrev = false) {

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-slt-crtrYr");

		//전년도 데이터
		if (isPrev === true) {
			jsonPrevData.length = 0;
			crtrYr = parseFloat(crtrYr) - 1;
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltPrcsPrfmncList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr,

			// pagination
			pagingYn : 'N',
			//currentPageNo : pageNo,
			//recordCountPerPage : pageSize
		});

		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {

			const extraRow = document.querySelector('.extra-row');
			extraRow.style.display = 'none';

			if (isPrev === true) {
				data.resultList.forEach(item => {
					const vo = {
						apcCd : item.apcCd
						, apcNm : item.apcNm
						, crtrYr : item.crtrYr
						, sn : item.sn
						, itemCd : item.itemCd
						, itemNm : item.itemNm

						, apcTrmtAmt : item.apcTrmtAmt
						, apcTrmtVlm : item.apcTrmtVlm
						, apcTmSpmtAmt :item.tmSpmtAmt
						, apcTmSpmtRt :item.tmSpmtRt
						, apcGnrlTrmtAmt : item.apcGnrlTrmtAmt
						, apcOgnzCprtnSortTrst : item.apcOgnzCprtnSortTrst
						, apcCtrtEmspap :item.apcCtrtEmspap
					}
					jsonPrevData.push(vo);
				});
			} else {
				data.resultList.forEach((item, index) => {

					if (_.isEqual("XC01", item.itemCd)) {

						extraRow.style.display = '';

						SBUxMethod.set('dtl-inp-apcTrmtVlmExtra', item.apcTrmtVlm);
						SBUxMethod.set('dtl-inp-apcGnrlTrmtAmtExtra', item.apcGnrlTrmtAmt);
						SBUxMethod.set('dtl-inp-apcOgnzCprtnSortTrstExtra', item.apcOgnzCprtnSortTrst);
						SBUxMethod.set('dtl-inp-apcCtrtEmspapExtra', item.apcCtrtEmspap);
						SBUxMethod.set('dtl-inp-apcTmSpmtAmtExtra', item.tmSpmtAmt);
					} else {
						let sn = item.sn;
						SBUxMethod.set('dtl-inp-itemChk' + sn, 'Y');//품목 존재 여부 확인
						if (sn == '4') {
							$('#itemNm' + sn).text("기타품목 : " + item.itemNm);
							SBUxMethod.set('dtl-inp-itemCd' + sn, item.itemNm); // 품목명
						} else {
							$('#itemNm' + sn).text("품목" + sn + " : " + item.itemNm);
							SBUxMethod.set('dtl-inp-itemCd' + sn, item.itemCd); // 품목코드
						}
						SBUxMethod.changeGroupAttr('group' + sn, 'disabled', 'false');

						SBUxMethod.set('dtl-inp-apcTrmtVlm' + sn, item.apcTrmtVlm);
						SBUxMethod.set('dtl-inp-apcGnrlTrmtAmt' + sn, item.apcGnrlTrmtAmt);
						SBUxMethod.set('dtl-inp-apcOgnzCprtnSortTrst' + sn, item.apcOgnzCprtnSortTrst);
						SBUxMethod.set('dtl-inp-apcCtrtEmspap' + sn, item.apcCtrtEmspap);
						SBUxMethod.set('dtl-inp-apcTmSpmtAmt' + sn, item.tmSpmtAmt);
					}
				});

				fn_cal();
				fn_itemChk();
			}
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			//console.error("failed", e.message);
		}
	}

	//등록
	const fn_save = async function() {
		const apcCd = SBUxMethod.get("srch-inp-apcCd");
		const crtrYr = SBUxMethod.get("srch-slt-crtrYr");
		if (gfn_isEmpty(apcCd)) {
			alert("apc를 선택해주세요");
			return;
		}

		if (gfn_isEmpty(crtrYr)) {
			gfn_comAlert("W0002", "조사연도");	//	W0002	{0}을/를 입력하세요.
			return;
		}

		const canInsert = await gfn_apcSurveyInsertCheck(crtrYr, true);
		if (!canInsert) {
			return;
		}

		fn_subInsert(confirm("등록 하시겠습니까?") ,"N");
	}

	//임시저장
	const fn_tmprStrg = async function(tmpChk) {
		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			alert('APC를 선택해주세요');
			return;
		}

		const crtrYr = SBUxMethod.get("srch-slt-crtrYr");

		if (gfn_isEmpty(crtrYr)) {
			gfn_comAlert("W0002", "조사연도");	//	W0002	{0}을/를 입력하세요.
			return;
		}

		const canInsert = await gfn_apcSurveyInsertCheck(crtrYr, true);
		if (!canInsert) {
			return;
		}

		fn_subInsert(confirm("임시저장 하시겠습니까?") , 'Y');
	}


	//신규 등록
	const fn_subInsert = async function (isConfirmed , tmpChk){
		 if (!isConfirmed) return;
		 let crtrYr = SBUxMethod.get('srch-slt-crtrYr');
		 let apcCd = SBUxMethod.get('srch-inp-apcCd');
		 let saveList = [];

		 for (var i = 1; i < 5; i++) {
			let itemVo = {
					crtrYr : crtrYr
					,apcCd : apcCd
					,sn  : i
					, prgrsYn : 'Y' //진척도 갱신 여부
					, tmprStrgYn : tmpChk//임시저장 여부
					,apcGnrlTrmtAmt : gfn_nvl(SBUxMethod.get('dtl-inp-apcGnrlTrmtAmt'+i))
					,apcOgnzCprtnSortTrst : gfn_nvl(SBUxMethod.get('dtl-inp-apcOgnzCprtnSortTrst'+i))
					,apcCtrtEmspap : gfn_nvl(SBUxMethod.get('dtl-inp-apcCtrtEmspap'+i))

					,apcTrmtAmt : gfn_nvl(SBUxMethod.get('dtl-inp-apcTrmtAmt'+i))//apc취급액
					,apcTrmtVlm : gfn_nvl(SBUxMethod.get('dtl-inp-apcTrmtVlm'+i))//apc물량
					,tmSpmtAmt : gfn_nvl(SBUxMethod.get('dtl-inp-apcTmSpmtAmt'+i))//APC 취급액 중 산지유통통합조직 출하액
					,tmSpmtRt : gfn_nvl(SBUxMethod.get('dtl-inp-apcTmSpmtRt'+i))//전속출하 비율
			}
			saveList.push(itemVo);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/multiSaveFcltPrcsPrfmnc.do", saveList);

		const data = await postJsonPromise;

		try {
		if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
				//fn_search();
				//열려있는 탭이 APC전수조사 인 경우 진척도 갱신
				cfn_allTabPrgrsRefrash();
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
		}
	}


	//자동계산
	function fn_cal(e){
		//extractNumbers2(e.name);

		let apcGnrlTrmtAmtArr = [];
		let apcOgnzCprtnSortTrstArr = [];
		let apcCtrtEmspapArr = [];

		let apcTrmtVlmArr = [];
		let apcTmSpmtAmtArr = [];

		for (var i = 0; i < 4; i++) {
			apcGnrlTrmtAmtArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcGnrlTrmtAmt'+(i+1)));
			apcOgnzCprtnSortTrstArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcOgnzCprtnSortTrst'+(i+1)));
			apcCtrtEmspapArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcCtrtEmspap'+(i+1)));

			apcTrmtVlmArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtVlm'+(i+1)));
			apcTmSpmtAmtArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTmSpmtAmt'+(i+1)));
		}

		// 조정값
		const apcGnrlTrmtAmtExtra = parseInt(SBUxMethod.get('dtl-inp-apcGnrlTrmtAmtExtra')) || 0;
		const apcOgnzCprtnSortTrstExtra = parseInt(SBUxMethod.get('dtl-inp-apcOgnzCprtnSortTrstExtra')) || 0;
		const apcCtrtEmspapExtra = parseInt(SBUxMethod.get('dtl-inp-apcCtrtEmspapExtra')) || 0;
		const apcTrmtVlmExtra = parseInt(SBUxMethod.get('dtl-inp-apcTrmtVlmExtra')) || 0;
		const apcTmSpmtAmtExtra = parseInt(SBUxMethod.get('dtl-inp-apcTmSpmtAmtExtra')) || 0;

		apcGnrlTrmtAmtArr.push(apcGnrlTrmtAmtExtra);
		apcOgnzCprtnSortTrstArr.push(apcOgnzCprtnSortTrstExtra);
		apcCtrtEmspapArr.push(apcCtrtEmspapExtra);
		apcTrmtVlmArr.push(apcTrmtVlmExtra);
		apcTmSpmtAmtArr.push(apcTmSpmtAmtExtra);

		SBUxMethod.set('dtl-inp-apcGnrlTrmtAmtTot',apcGnrlTrmtAmtArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-apcOgnzCprtnSortTrstTot',apcOgnzCprtnSortTrstArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-apcCtrtEmspapTot',apcCtrtEmspapArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-apcTrmtVlmTot',apcTrmtVlmArr.reduce((acc, cur) => {return acc + cur;}, 0));

		//한글 단위 표시
		SBUxMethod.set('dtl-inp-apcGnrlTrmtAmtTot1', fn_numberToKorean( apcGnrlTrmtAmtArr.reduce((acc, cur) => {return acc + cur;}, 0) ));
		SBUxMethod.set('dtl-inp-apcOgnzCprtnSortTrstTot1', fn_numberToKorean( apcOgnzCprtnSortTrstArr.reduce((acc, cur) => {return acc + cur;}, 0) ));
		SBUxMethod.set('dtl-inp-apcCtrtEmspapTot1', fn_numberToKorean( apcCtrtEmspapArr.reduce((acc, cur) => {return acc + cur;}, 0) ));

		let apcTrmtAmtArr = [];

		for (var i = 0; i < 4; i++) {
			let sum1 = apcGnrlTrmtAmtArr[i] + apcOgnzCprtnSortTrstArr[i] + apcCtrtEmspapArr[i];
			let rt1;
			if(sum1 === 0){
				rt1 = 0;
			}else{
				rt1 = apcTmSpmtAmtArr[i] / sum1 * 100;
			}
			apcTrmtAmtArr[i] = sum1;

			SBUxMethod.set('dtl-inp-apcTrmtAmt'+(i+1),sum1);
			SBUxMethod.set('dtl-inp-apcTmSpmtRt'+(i+1),rt1.toFixed(0));
		}

		const sumExtra = apcGnrlTrmtAmtExtra + apcOgnzCprtnSortTrstExtra + apcCtrtEmspapExtra;
		const rtExtra = sumExtra === 0 ? 0 : rtExtra / sumExtra * 100;
		SBUxMethod.set('dtl-inp-apcTrmtAmtExtra', sumExtra);
		SBUxMethod.set('dtl-inp-apcTmSpmtRtExtra', rtExtra.toFixed(0));


		let apcTrmtAmtTot = apcTrmtAmtArr.reduce((acc, cur) => {return acc + cur;}, 0);
		SBUxMethod.set('dtl-inp-apcTrmtAmtTot',apcTrmtAmtTot);
		let apcTmSpmtAmtTot = apcTmSpmtAmtArr.reduce((acc, cur) => {return acc + cur;}, 0);
		SBUxMethod.set('dtl-inp-apcTmSpmtAmtTot',apcTmSpmtAmtTot);

		//한글 단위 표시
		SBUxMethod.set('dtl-inp-apcTrmtAmtTot1',fn_numberToKorean( apcTrmtAmtTot ));
		SBUxMethod.set('dtl-inp-apcTmSpmtAmtTot1',fn_numberToKorean( apcTmSpmtAmtTot ));

		let totRt;
		if (apcTrmtAmtTot === 0){
			totRt = 0;
		} else {
			totRt = apcTmSpmtAmtTot / apcTrmtAmtTot * 100 ;
		}
		SBUxMethod.set('dtl-inp-apcTmSpmtRtTot',totRt.toFixed(0));

		// 취급액합계, 비율
		if (!gfn_isEmpty(e)) {
			const name = e.getAttribute("name");
			const sn = parseInt(name.charAt(name.length - 1));
			fn_changeValue('dtl-inp-apcTmSpmtRt'+ sn);
			fn_changeValue('dtl-inp-apcTrmtAmt'+ sn);
		}
	}

	// 숫자(소숫점 가능)만 입력
	function extractNumbers2(input) {
		let inputValue = SBUxMethod.get(input);
		if(inputValue != null || inputValue != ""){
			SBUxMethod.set(input,inputValue.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
		}
	}
	// 숫자만 입력
	function extractNumbers(input) {
		//document.querySelector("sbux-input[name='"+input+"']").value = document.querySelector("sbux-input[name='"+input+"']").value.replace(/\D/g, "");
		let inputValue = SBUxMethod.get(input);
		if(inputValue != null || inputValue != ""){
			SBUxMethod.set(input,inputValue.replace(/\D/g, ""));
		}
	}

	//값이 없는 경우 0 있는 경우 숫자로 반환
	function convertToNumberOrZero(value) {
		// 값이 없는 경우 0으로 설정
		if (value === undefined || value === null) {
			return 0;
		}

	// 값이 있는 경우 숫자로 변환하고 반환
	const numericValue = Number(value);
		if (isNaN(numericValue)) {
			return 0; // 변환 실패 시 0 반환
		} else {
			return numericValue;
		}
	}

	// apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setApc = async function(apc) {
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
		//진척도 갱신
		await cfn_selectPrgrs();
		await fn_search();
	}

	function fn_numberToKorean(number) {
		if(number == null){
			return "";
		}
		if(typeof number == "string"){
			number = parseFloat(number);
		}
		//기본 단위 100만원  100 0000
		number = number * 100
		var inputNumber = number < 0 ? false : number;
		var unitWords = ["만", "억", "조", "경"];
		var splitUnit = 10000;
		var splitCount = unitWords.length;
		var resultArray = [];
		var resultString = "";

		for (var i = 0; i < splitCount; i++) {
			var unitResult = (inputNumber % Math.pow(splitUnit, i + 1)) / Math.pow(splitUnit, i);
			unitResult = Math.floor(unitResult);
			if (unitResult > 0) {
				resultArray[i] = unitResult;
			}
		}
		for (var i = 0; i < resultArray.length; i++) {
			if (!resultArray[i]) continue;
			resultString = String(resultArray[i]) + unitWords[i] + resultString;
		}
		return resultString + "원";
	}

	//최종제출 여부 체크
	function fn_prgrsLastChk(){
		//최종제출 여부
		let prgrsLast = SBUxMethod.get('dtl-inp-prgrsLast');
		if(prgrsLast  == 'Y'){
			SBUxMethod.attr("btnInsert",'disabled','true'); // 저장버튼 비활성화
			//SBUxMethod.attr("btnInsert1",'disabled','true'); // 저장버튼 비활성화

			SBUxMethod.attr("btnTmprStrg",'disabled','true'); // 임시저장버튼 비활성화

		} else {
			SBUxMethod.attr("btnInsert",'disabled','false'); // 저장버튼 활성화
			//SBUxMethod.attr("btnInsert1",'disabled','false'); // 저장버튼 활성화

			SBUxMethod.attr("btnTmprStrg",'disabled','false'); // 임시저장버튼 활성화
		}
	}

	// 전년도 데이터 set
	function fn_pySearch() {
		// 데이터 검증 메세지 초기화
		const msgDivs = document.getElementsByClassName('div-msg');
		for (let i = 0; i < msgDivs.length; i++) {
			msgDivs[i].style.visibility = 'hidden';
			msgDivs[i].style.fontSize = '0rem';
		}
		const tr = $('.div-msg').closest('tr');
		tr.find('td, th').css('vertical-align', 'middle');

		if (gfn_isEmpty(jsonPrevData)) {
			gfn_comAlert("W0005", "전년도 데이터"); // W0005  {0}이/가 없습니다.
			return;
		}

		let itemCount = 0;
		for (let i = 1; i <= 4; i++) {
			SBUxMethod.clearGroupData('group'+i);
			if (SBUxMethod.get('dtl-inp-itemChk' + i) === 'Y') {
				SBUxMethod.changeGroupAttr('group' + i, 'disabled', 'false');
				itemCount++;
			}
		}

		// 등록된 품목이 하나도 없을 때
		if (itemCount === 0) {
			gfn_comAlert("W0005", "현재 조사연도 1.운영자 개요에서 등록된 품목"); // W0005  {0}이/가 없습니다.
			return;
		}

		const extraRow = document.querySelector('.extra-row');
		extraRow.style.display = 'none';

		let matchedCount = 0;
		jsonPrevData.forEach(item => {
			if (_.isEqual("XC01", item.itemCd)) {
				extraRow.style.display = '';
				SBUxMethod.set('dtl-inp-apcTrmtVlmExtra', item.apcTrmtVlm);
				SBUxMethod.set('dtl-inp-apcGnrlTrmtAmtExtra', item.apcGnrlTrmtAmt);
				SBUxMethod.set('dtl-inp-apcOgnzCprtnSortTrstExtra', item.apcOgnzCprtnSortTrst);
				SBUxMethod.set('dtl-inp-apcCtrtEmspapExtra', item.apcCtrtEmspap);
				SBUxMethod.set('dtl-inp-apcTmSpmtAmtExtra', item.tmSpmtAmt);
			} else {
				let sn = item.sn;
				const itemCd = SBUxMethod.get('dtl-inp-itemCd'+sn);
				if (_.isEqual(SBUxMethod.get('dtl-inp-itemChk' + sn), "Y") && (
						(sn === 4 && _.isEqual(itemCd, item.itemNm)) ||
						(sn !== 4 && _.isEqual(itemCd, item.itemCd)))) {
					matchedCount++;
					SBUxMethod.set('dtl-inp-apcTrmtVlm' + sn, item.apcTrmtVlm);
					SBUxMethod.set('dtl-inp-apcGnrlTrmtAmt' + sn, item.apcGnrlTrmtAmt);
					SBUxMethod.set('dtl-inp-apcOgnzCprtnSortTrst' + sn, item.apcOgnzCprtnSortTrst);
					SBUxMethod.set('dtl-inp-apcCtrtEmspap' + sn, item.apcCtrtEmspap);
					SBUxMethod.set('dtl-inp-apcTmSpmtAmt' + sn, item.tmSpmtAmt);
				}
			}
		});

		// 일치하는 전년도 데이터가 하나도 없을 때
		if (matchedCount === 0) {
			gfn_comAlert("W0005", "현재 조사연도와 일치하는 전년도 품목"); // W0005  {0}이/가 없습니다.
			return;
		}

		fn_cal();
	}


	// 값 변경 시 실행 함수
	function fn_changeValue(args) {
		if (!args) return;
		const inputEl = document.getElementById(args);

		const name = inputEl.getAttribute("name");
		const sn = parseInt(name.charAt(name.length - 1));
		const itemCd = SBUxMethod.get('dtl-inp-itemCd' + sn);
		const key = name.replace(/^dtl-inp-/, '').replace(/\d+$/, '');

		// 초기화 (경고 메시지 숨기기)
		const nextDiv = $(`#${'${name}'}`).closest('span').next();
		nextDiv.text('');
		nextDiv.css({
			fontSize: '0rem',
			visibility: 'hidden',
		});


		// tr 내 div가 모두 안 보일 경우 vertical-align: middle
		const tr = $(`#${'${name}'}`).closest('tr');
		const divs = tr.find('div');
		const noVisibleDiv = divs.length === 0 || divs.filter(function () {
			return $(this).css('visibility') === 'visible';
		}).length === 0;

		if (noVisibleDiv) {
			tr.find('td, th').css('vertical-align', 'middle');
		}

		if (gfn_isEmpty(jsonPrevData)) return;

		// 전년도 데이터에서 일치하는 항목 찾기
		const prevObj = jsonPrevData.find(item => item.sn === sn && item.itemCd === itemCd);

		// 전년도에 없는 품목인 경우 메시지 표시
		/*if (gfn_isEmpty(prevObj) && !gfn_isEmpty(itemCd)) {
			const div = $(`#div-msg${'${sn}'}`);
			console.log(div);
			div.text("전년도에 없는 품목입니다.");
			div.css({
				fontSize: "1.2rem",
				visibility: "visible",
				fontWeight: "bold",
				color: "#be0000",
				textAlign: "right"
			});
			return;
		}*/
		if (gfn_isEmpty(prevObj)) return;

		// 값 비교
		const pyValue = Number(prevObj[key]);
		const currValue = Number(SBUxMethod.get(name));
		if (currValue === 0) return;

		let msg = '';
		let diff = 0;

		if (pyValue === 0) {
			msg = jsonApcCmsuVrfcCd.find(obj => obj.cdVl === 'PY_INPT').cdVlExpln;
		} else {
			diff = Math.abs((currValue - pyValue) / pyValue * 100);

			if (diff >= 20 && diff < 50) {
				msg = jsonApcCmsuVrfcCd.find(obj => obj.cdVl === 'PV_DIFF_RT_20').cdVlExpln;
			} else if (diff >= 50 && diff < 200) {
				msg = jsonApcCmsuVrfcCd.find(obj => obj.cdVl === 'PV_DIFF_RT_50').cdVlExpln;
			} else if (diff >= 200) {
				msg = jsonApcCmsuVrfcCd.find(obj => obj.cdVl === 'PV_DIFF_RT_200').cdVlExpln;
			}
		}

		// 안내 메시지가 있으면 출력
		if (!gfn_isEmpty(msg)) {
			nextDiv.text(msg);
			nextDiv.css({
				fontSize: "1.2rem",
				visibility: "visible",
				fontWeight: "bold",
				color: "#be0000",
				textAlign: "left"
			});
			tr.find('td, th').css('vertical-align', 'top');
		}
	}

	// 품목확인
	function fn_itemChk() {
		const itemList = [];
		for (let i = 1; i <5; i++) {
			const itemCd = SBUxMethod.get('dtl-inp-itemCd'+i);
			itemList.push(itemCd);
		}
		if (gfn_isEmpty(itemList)) return;

		for (let i = 0; i < itemList.length; i++) {
			const currItemCd = itemList[i];
			if (gfn_isEmpty(currItemCd)) continue;
			const prevItemCd = jsonPrevData[i]?.itemCd;

			const div = $(`#div-item-msg${'${i+1}'}`);

			if (_.isEmpty(prevItemCd) || !_.isEqual(currItemCd, prevItemCd)) {
				div.text("전년도에 없거나 다른 품목");
				div.css({
					fontSize: "1.2rem",
					visibility: "visible",
					fontWeight: "bold",
					color: "#be0000",
					textAlign: "center"
				});
			}
		}
	}

</script>
</html>