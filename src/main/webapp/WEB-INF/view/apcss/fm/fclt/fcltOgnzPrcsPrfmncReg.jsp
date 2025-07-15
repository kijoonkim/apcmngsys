<%
 /**
  * @Class Name : fcltOgnzPrcsPrfmncReg.jsp
  * @Description : 5.1.유통조직 처리실적 화면
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 유통조직처리실적 -->
			</div>
			<div style="margin-left: auto;">
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
					<col style="width: 187px">
					<col style="width: 100px">
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
						<td class="td_input" style="border-right: hidden;">
							<!--
							<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_selectOgPcList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							-->
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
				<label style="font-weight: bold;">○유통조직처리실적 상세 내역</label><br>
				<label>- APC 운영자인 산지유통조직의 원예농산물 총취급액을 기재(APC에서 처리한 원예농산물 취급액 + APC에서 처리하지 않은 원예농산물 취급액)</label><br>
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
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 10%">
						<col style="width: 58px">
						<col style="width: 7%">
						<col style="width: 28px">
					</colgroup>
						<thead>
							<tr>
								<th class="text-center" style="border-right: 1px solid white !important;" rowspan="2">구분</th>
								<th class="text-center" style="border-right: 1px solid white !important;" rowspan="2" colspan="2">총취급액</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="6">일반취급</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="6">조직화취급</th>
								<th class="text-center" style="border-right: 1px solid white !important;" rowspan="2" colspan="2">취급 물량</th>
							</tr>
							<tr>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">계</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">단순수탁</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">단순매취</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">계</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">공선수탁</th>
								<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">계약매취</th>
							</tr>
							<tr>
								<th class="text-center">
									<span id="itemNm1">품목1</span>
									<sbux-input id="dtl-inp-itemChk1" name="dtl-inp-itemChk1" uitype="hidden"></sbux-input>
								</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtAmt1"
										name="dtl-inp-rtlOgnzTotTrmtAmt1"
										uitype="text" class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSum1"
										name="dtl-inp-rtlOgnzGnrlSum1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplTrst1"
										name="dtl-inp-rtlOgnzGnrlSmplTrst1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group1"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplEmspap1"
										name="dtl-inp-rtlOgnzGnrlSmplEmspap1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group1"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOGnzSum1"
										name="dtl-inp-rtlOgnzOGnzSum1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCprtnSortTrst1"
										name="dtl-inp-rtlOgnzOgnzCprtnSortTrst1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group1"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCtrtEmspap1"
										name="dtl-inp-rtlOgnzOgnzCtrtEmspap1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group1"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtVlm1"
										name="dtl-inp-rtlOgnzTotTrmtVlm1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group1"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>톤</td>
							</tr>
							<tr>
								<th class="text-center">
									<span id="itemNm2">품목2</span>
									<sbux-input id="dtl-inp-itemChk2" name="dtl-inp-itemChk2" uitype="hidden"></sbux-input>
								</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtAmt2"
										name="dtl-inp-rtlOgnzTotTrmtAmt2"
										uitype="text" class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSum2"
										name="dtl-inp-rtlOgnzGnrlSum2"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplTrst2"
										name="dtl-inp-rtlOgnzGnrlSmplTrst2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group2"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplEmspap2"
										name="dtl-inp-rtlOgnzGnrlSmplEmspap2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group2"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOGnzSum2"
										name="dtl-inp-rtlOgnzOGnzSum2"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCprtnSortTrst2"
										name="dtl-inp-rtlOgnzOgnzCprtnSortTrst2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group2"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCtrtEmspap2"
										name="dtl-inp-rtlOgnzOgnzCtrtEmspap2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group2"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtVlm2"
										name="dtl-inp-rtlOgnzTotTrmtVlm2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group2"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>톤</td>
							</tr>
							<tr>
								<th class="text-center">
									<span id="itemNm3">품목3</span>
									<sbux-input id="dtl-inp-itemChk3" name="dtl-inp-itemChk3" uitype="hidden"></sbux-input>
								</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtAmt3"
										name="dtl-inp-rtlOgnzTotTrmtAmt3"
										uitype="text" class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSum3"
										name="dtl-inp-rtlOgnzGnrlSum3"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplTrst3"
										name="dtl-inp-rtlOgnzGnrlSmplTrst3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group3"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplEmspap3"
										name="dtl-inp-rtlOgnzGnrlSmplEmspap3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group3"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOGnzSum3"
										name="dtl-inp-rtlOgnzOGnzSum3"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCprtnSortTrst3"
										name="dtl-inp-rtlOgnzOgnzCprtnSortTrst3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group3"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCtrtEmspap3"
										name="dtl-inp-rtlOgnzOgnzCtrtEmspap3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group3"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtVlm3"
										name="dtl-inp-rtlOgnzTotTrmtVlm3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group3"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>톤</td>
							</tr>
							<tr>
								<th class="text-center">
									<span id="itemNm4">기타</span>
									<sbux-input id="dtl-inp-itemChk4" name="dtl-inp-itemChk4" uitype="hidden"></sbux-input>
								</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtAmt4"
										name="dtl-inp-rtlOgnzTotTrmtAmt4"
										uitype="text" class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSum4"
										name="dtl-inp-rtlOgnzGnrlSum4"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplTrst4"
										name="dtl-inp-rtlOgnzGnrlSmplTrst4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group4"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplEmspap4"
										name="dtl-inp-rtlOgnzGnrlSmplEmspap4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group4"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOGnzSum4"
										name="dtl-inp-rtlOgnzOGnzSum4"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCprtnSortTrst4"
										name="dtl-inp-rtlOgnzOgnzCprtnSortTrst4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group4"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCtrtEmspap4"
										name="dtl-inp-rtlOgnzOgnzCtrtEmspap4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group4"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtVlm4"
										name="dtl-inp-rtlOgnzTotTrmtVlm4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										onkeyup="fn_sum(this)"
										style="text-align: right;"
										group-id="group4"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>톤</td>
							</tr>
							<tr>
								<th class="text-center">계</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtAmtTot"
										name="dtl-inp-rtlOgnzTotTrmtAmtTot"
										uitype="text" class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSumTot"
										name="dtl-inp-rtlOgnzGnrlSumTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplTrstTot"
										name="dtl-inp-rtlOgnzGnrlSmplTrstTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplEmspapTot"
										name="dtl-inp-rtlOgnzGnrlSmplEmspapTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOGnzSumTot"
										name="dtl-inp-rtlOgnzOGnzSumTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCprtnSortTrstTot"
										name="dtl-inp-rtlOgnzOgnzCprtnSortTrstTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCtrtEmspapTot"
										name="dtl-inp-rtlOgnzOgnzCtrtEmspapTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtVlmTot"
										name="dtl-inp-rtlOgnzTotTrmtVlmTot"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										readonly
									></sbux-input>
								</td>
								<td>톤</td>
							</tr>
							<tr>
								<th class="text-center">계</th>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzTotTrmtAmtTot1"
										name="dtl-inp-rtlOgnzTotTrmtAmtTot1"
										uitype="text" class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSumTot1"
										name="dtl-inp-rtlOgnzGnrlSumTot1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										readonly
										style="text-align: right;"
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplTrstTot1"
										name="dtl-inp-rtlOgnzGnrlSmplTrstTot1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										readonly
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzGnrlSmplEmspapTot1"
										name="dtl-inp-rtlOgnzGnrlSmplEmspapTot1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										readonly
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzOGnzSumTot1"
										name="dtl-inp-rtlOgnzOGnzSumTot1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										readonly
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCprtnSortTrstTot1"
										name="dtl-inp-rtlOgnzOgnzCprtnSortTrstTot1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
										readonly
									></sbux-input>
								</td>
								<td colspan="2">
									<sbux-input
										id="dtl-inp-rtlOgnzOgnzCtrtEmspapTot1"
										name="dtl-inp-rtlOgnzOgnzCtrtEmspapTot1"
										uitype="text"
										class="form-control input-sm"
										placeholder="자동계산"
										style="text-align: right;"
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
	}


	/* 선택가능한 APC리스트 조회 */
	const fn_selectUserApcList = async function(){

		let postJsonPromise = gfn_postJSON("/fm/fclt/selectUserApcList.do", {

		});

		let data = await postJsonPromise;
		try{
			console.log(data);
			let apcListLength = data.resultList.length;
			console.log(apcListLength);
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
		for (var sn = 1; sn < 5; sn++) {
			//SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplTrst'+sn,null);
			//SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplEmspap'+sn,null);
			//SBUxMethod.set('dtl-inp-rtlOgnzOgnzCprtnSortTrst'+sn,null);
			//SBUxMethod.set('dtl-inp-rtlOgnzOgnzCtrtEmspap'+sn,null);
			//SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtVlm'+sn,null);

			//그룹 비활성화
			SBUxMethod.changeGroupAttr('group'+sn,'disabled','true');
			//그룹 초기화
			SBUxMethod.clearGroupData('group'+sn);
		}
		fn_sum();
		$('#itemNm1').text("품목1");
		$('#itemNm2').text("품목2");
		$('#itemNm3').text("품목3");
		$('#itemNm4').text("기타");
	}

	const fn_search = async function() {
		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			alert('APC를 선택해주세요');
			return;
		}
		await fn_clearForm();

		//진척도
		await cfn_selectPrgrs();

		await fn_selectOgPcList();
	}

	const fn_selectOgPcList = async function(copy_chk) {
		 console.log("******************fn_pagingOgPcList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-slt-crtrYr");

		//전년도 데이터
		if(!gfn_isEmpty(copy_chk)){
			crtrYr = parseFloat(crtrYr) - parseFloat(copy_chk);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOgnzPrcsPrfmncList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr
		});

		const data = await postJsonPromise;
		//await 오류시 확인
		//예외처리
		try {

			data.resultList.forEach((item, index) => {
				let sn = item.sn;

				SBUxMethod.set('dtl-inp-itemChk'+sn,'Y');//품목 존재 여부 확인
				if(sn == '4'){
					$('#itemNm'+sn).text("기타품목 : "+item.itemNm);
				}else{
					$('#itemNm'+sn).text("품목"+sn+" : "+item.itemNm);
				}

				//그룹 비활성화
				SBUxMethod.changeGroupAttr('group'+sn,'disabled','false');

				SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplTrst'+sn,item.rtlOgnzGnrlSmplTrst);
				SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplEmspap'+sn,item.rtlOgnzGnrlSmplEmspap);
				SBUxMethod.set('dtl-inp-rtlOgnzOgnzCprtnSortTrst'+sn,item.rtlOgnzOgnzCprtnSortTrst);
				SBUxMethod.set('dtl-inp-rtlOgnzOgnzCtrtEmspap'+sn,item.rtlOgnzOgnzCtrtEmspap);

				SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtVlm'+sn,item.rtlOgnzTotTrmtVlm);
			});
			fn_sum();

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

		fn_subInsert(confirm("등록 하시겠습니까?") , "N");
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
		 console.log("******************fn_subInsert**********************************");
		 if (!isConfirmed) return;

		 let saveList = [];

		 for (var i = 1; i < 5; i++) {
			let item = {
					crtrYr : SBUxMethod.get('srch-slt-crtrYr')
					,apcCd : SBUxMethod.get('srch-inp-apcCd')
					, prgrsYn : 'Y' //진척도 갱신 여부
					, tmprStrgYn : tmpChk//임시저장 여부
					,sn : i
					,rtlOgnzTotTrmtAmt : gfn_nvl(SBUxMethod.get('dtl-inp-rtlOgnzTotTrmtAmt'+i))
					,rtlOgnzTotTrmtVlm : gfn_nvl(SBUxMethod.get('dtl-inp-rtlOgnzTotTrmtVlm'+i))
					,rtlOgnzGnrlSum : gfn_nvl(SBUxMethod.get('dtl-inp-rtlOgnzGnrlSum'+i))
					,rtlOgnzGnrlSmplTrst : gfn_nvl(SBUxMethod.get('dtl-inp-rtlOgnzGnrlSmplTrst'+i))
					,rtlOgnzGnrlSmplEmspap : gfn_nvl(SBUxMethod.get('dtl-inp-rtlOgnzGnrlSmplEmspap'+i))
					,rtlOgnzOGnzSum : gfn_nvl(SBUxMethod.get('dtl-inp-rtlOgnzOGnzSum'+i))
					,rtlOgnzOgnzCprtnSortTrst : gfn_nvl(SBUxMethod.get('dtl-inp-rtlOgnzOgnzCprtnSortTrst'+i))
					,rtlOgnzOgnzCtrtEmspap : gfn_nvl(SBUxMethod.get('dtl-inp-rtlOgnzOgnzCtrtEmspap'+i))
			}
			saveList.push(item);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/multiSaveFcltOgnzPrcsPrfmnc.do", saveList);

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
		// 결과 확인 후 재조회
		console.log("insert result", data);
	}


	//처리실적 자동계산
	function fn_sum(e){
		if(e != null){
			extractNumbers2(e.name);
		}


		let rtlOgnzGnrlSmplTrstArr = [];
		let rtlOgnzGnrlSmplEmspapArr = [];

		let rtlOgnzOgnzCprtnSortTrstArr = [];
		let rtlOgnzOgnzCtrtEmspapArr = [];

		let rtlOgnzTotTrmtVlmArr = [];

		for (var i = 0; i < 4; i++) {
			rtlOgnzGnrlSmplTrstArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-rtlOgnzGnrlSmplTrst'+(i+1)));
			rtlOgnzGnrlSmplEmspapArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-rtlOgnzGnrlSmplEmspap'+(i+1)));

			rtlOgnzOgnzCprtnSortTrstArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-rtlOgnzOgnzCprtnSortTrst'+(i+1)));
			rtlOgnzOgnzCtrtEmspapArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-rtlOgnzOgnzCtrtEmspap'+(i+1)));

			rtlOgnzTotTrmtVlmArr[i] = convertToNumberOrZero(SBUxMethod.get('dtl-inp-rtlOgnzTotTrmtVlm'+(i+1)));
		}

		SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplTrstTot',rtlOgnzGnrlSmplTrstArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplEmspapTot',rtlOgnzGnrlSmplEmspapArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-rtlOgnzOgnzCprtnSortTrstTot',rtlOgnzOgnzCprtnSortTrstArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-rtlOgnzOgnzCtrtEmspapTot',rtlOgnzOgnzCtrtEmspapArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtVlmTot',rtlOgnzTotTrmtVlmArr.reduce((acc, cur) => {return acc + cur;}, 0));

		//한글 단위 표시
		SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplTrstTot1',fn_numberToKorean( rtlOgnzGnrlSmplTrstArr.reduce((acc, cur) => {return acc + cur;}, 0) ));
		SBUxMethod.set('dtl-inp-rtlOgnzGnrlSmplEmspapTot1',fn_numberToKorean( rtlOgnzGnrlSmplEmspapArr.reduce((acc, cur) => {return acc + cur;}, 0) ));
		SBUxMethod.set('dtl-inp-rtlOgnzOgnzCprtnSortTrstTot1',fn_numberToKorean( rtlOgnzOgnzCprtnSortTrstArr.reduce((acc, cur) => {return acc + cur;}, 0) ));
		SBUxMethod.set('dtl-inp-rtlOgnzOgnzCtrtEmspapTot1',fn_numberToKorean( rtlOgnzOgnzCtrtEmspapArr.reduce((acc, cur) => {return acc + cur;}, 0) ));

		let rtlOgnzTotTrmtAmt = [];
		let rtlOgnzGnrlSum = [];
		let rtlOgnzOGnzSum = [];

		for (var i = 0; i < 4; i++) {
			let sum1 = rtlOgnzGnrlSmplTrstArr[i] + rtlOgnzGnrlSmplEmspapArr[i];
			let sum2 = rtlOgnzOgnzCprtnSortTrstArr[i] + rtlOgnzOgnzCtrtEmspapArr[i];
			let sum3 = sum1 + sum2;

			rtlOgnzTotTrmtAmt[i] = sum3;
			rtlOgnzGnrlSum[i] = sum1;
			rtlOgnzOGnzSum[i] = sum2;

			SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmt'+(i+1),sum3);
			SBUxMethod.set('dtl-inp-rtlOgnzGnrlSum'+(i+1),sum1);
			SBUxMethod.set('dtl-inp-rtlOgnzOGnzSum'+(i+1),sum2);
		}

		SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmtTot',rtlOgnzTotTrmtAmt.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-rtlOgnzGnrlSumTot',rtlOgnzGnrlSum.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-rtlOgnzOGnzSumTot',rtlOgnzOGnzSum.reduce((acc, cur) => {return acc + cur;}, 0));

		//한글 단위 표시
		SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmtTot1',fn_numberToKorean( rtlOgnzTotTrmtAmt.reduce((acc, cur) => {return acc + cur;}, 0) ));
		SBUxMethod.set('dtl-inp-rtlOgnzGnrlSumTot1',fn_numberToKorean( rtlOgnzGnrlSum.reduce((acc, cur) => {return acc + cur;}, 0) ));
		SBUxMethod.set('dtl-inp-rtlOgnzOGnzSumTot1',fn_numberToKorean( rtlOgnzOGnzSum.reduce((acc, cur) => {return acc + cur;}, 0) ));
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
		const numericValue = parseFloat(value);
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
		//진척도
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
		console.log("prgrsLast = " + prgrsLast);
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
</script>
</html>