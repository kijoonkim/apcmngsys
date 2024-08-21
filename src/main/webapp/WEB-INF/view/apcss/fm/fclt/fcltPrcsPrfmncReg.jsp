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
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 산지유통처리실적 -->
			</div>
			<div style="margin-left: auto;">
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

						<th scope="row">대상연도</th>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-spinner
									id="srch-inp-crtrYr"
									name="srch-inp-crtrYr"
									uitype="normal"
									step-value="1"
								></sbux-spinner>
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

			<div><label>산지유통처리실적상세 상세내역 </label></div>
			<div>
				<label style="font-size: x-small; font-weight: bold;">◦ (산지유통시설 처리실적) </label>
				<label style="font-size: x-small;"> 유통조직의 취급액 실적 중 APC에서 선별‧포장 등의 상품화 및/ 또는 장기저장 과정을 실시하여 판매한 실적을 기재</label>
			</div>
			<div>
				<label style="font-size: x-small;">- APC에서 처리한 상품 : 원물 집하, 저온저장, 선별, 신선처리, 포장 등의 단계를 필수 또는 선택적으로 거친 상품을 말함</label>
				<label style="font-size: x-small; text-decoration: underline;">(단, 농가 개별선별 상품의 운송을 위한 단순수탁 실적은 제외)</label>
			</div>
			<div>
				<label style="font-size: x-small; font-weight: bold;">․ (일반취급)  </label>
				<label style="font-size: x-small;"> 단순 매취 등의 물량 중 APC에서 저온저장, 신선처리, 포장 등의 처리를 거친 물량만 기재</label>
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
								<th class="text-center">품목1</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcGnrlTrmtAmt1"
										name="dtl-inp-apcGnrlTrmtAmt1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcOgnzCprtnSortTrst1"
										name="dtl-inp-apcOgnzCprtnSortTrst1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcCtrtEmspap1"
										name="dtl-inp-apcCtrtEmspap1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
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
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTrmtVlm1"
										name="dtl-inp-apcTrmtVlm1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
								</td>
								<td>톤</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtAmt1"
										name="dtl-inp-apcTmSpmtAmt1"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
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
								</td>
								<td>%</td>
							</tr>
							<tr>
								<th class="text-center">품목2</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcGnrlTrmtAmt2"
										name="dtl-inp-apcGnrlTrmtAmt2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcOgnzCprtnSortTrst2"
										name="dtl-inp-apcOgnzCprtnSortTrst2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcCtrtEmspap2"
										name="dtl-inp-apcCtrtEmspap2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
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
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
								</td>
								<td>톤</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtAmt2"
										name="dtl-inp-apcTmSpmtAmt2"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
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
								<th class="text-center">품목3</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcGnrlTrmtAmt3"
										name="dtl-inp-apcGnrlTrmtAmt3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcOgnzCprtnSortTrst3"
										name="dtl-inp-apcOgnzCprtnSortTrst3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcCtrtEmspap3"
										name="dtl-inp-apcCtrtEmspap3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
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
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
								</td>
								<td>톤</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtAmt3"
										name="dtl-inp-apcTmSpmtAmt3"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
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
								<th class="text-center">기타</th>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcGnrlTrmtAmt4"
										name="dtl-inp-apcGnrlTrmtAmt4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcOgnzCprtnSortTrst4"
										name="dtl-inp-apcOgnzCprtnSortTrst4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
								</td>
								<td>(백만원)</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcCtrtEmspap4"
										name="dtl-inp-apcCtrtEmspap4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
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
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
								</td>
								<td>톤</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-apcTmSpmtAmt4"
										name="dtl-inp-apcTmSpmtAmt4"
										uitype="text"
										class="form-control input-sm"
										placeholder=""
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										onkeyup="fn_cal(this)"
									></sbux-input>
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
						</thead>
					</table>
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- apc 선택 Modal -->
	<div>
		<sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:1000px"></sbux-modal>
	</div>
	<div id="body-modal-apcSelect">
		<jsp:include page="/WEB-INF/view/apcss/fm/popup/apcSelectPopup.jsp"></jsp:include>
	</div>

</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let date = new Date();
		let year  = date.getFullYear();
		SBUxMethod.set("srch-inp-crtrYr", year);
		if(gv_apcCd != 0000 || gv_apcCd != null || gv_apcCd != ""){
			SBUxMethod.set("srch-inp-apcCd", '0122');
			//SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};

	});

	/* 초기세팅 */
	const fn_init = async function() {

		await fn_selectAtMcIfList();
		//진척도
		await cfn_selectPrgrs();
		//최종제출 여부
		let prgrsLast = SBUxMethod.get('dtl-inp-prgrsLast');
		if(prgrsLast  == 'Y'){
			await SBUxMethod.attr("btnInsert",'disabled','true'); // 저장버튼 비활성화
		} else {
			await SBUxMethod.attr("btnInsert",'disabled','false'); // 저장버튼 활성화
		}
	}

	/**
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_selectAtMcIfList = async function(pageSize, pageNo) {
		 console.log("******************fn_pagingAtMcIfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltPrcsPrfmncList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr,

			// pagination
			pagingYn : 'N',
			currentPageNo : pageNo,
			recordCountPerPage : pageSize
		});

		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			data.resultList.forEach((item, index) => {
				let sn = item.sn;
				//SBUxMethod.set('srch-inp-apcTrmtAmt'+sn,item.apcTrmtAmt);

				SBUxMethod.set('srch-inp-apcTrmtVlm'+sn,item.apcTrmtAmt);
				SBUxMethod.set('srch-inp-apcGnrlTrmtAmt'+sn,item.apcGnrlTrmtAmt);
				SBUxMethod.set('srch-inp-apcOgnzCprtnSortTrst'+sn,item.apcOgnzCprtnSortTrst);
				SBUxMethod.set('srch-inp-apcCtrtEmspap'+sn,item.apcCtrtEmspap);
				SBUxMethod.set('srch-inp-apcTmSpmtAmt'+sn,item.tmSpmtAmt);
			});
			fn_cal('dtl-inp-apcOgnzCprtnSortTrst1');
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			//console.error("failed", e.message);
		}
	}

	//등록
	const fn_save = async function() {
		console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let trgtYr = SBUxMethod.get("srch-inp-crtrYr");
		if (gfn_isEmpty(apcCd)) {
			alert("apc를 선택해주세요");
			return;
		}
		if (gfn_isEmpty(crtrYr)) {
			alert("대상연도를 작성해주세요");
			return;
		}

		fn_subInsert(confirm("등록 하시겠습니까?"));
	}


	//신규 등록
	const fn_subInsert = async function (isConfirmed){
		 console.log("******************fn_subInsert**********************************");
		 if (!isConfirmed) return;
		 let crtrYr = SBUxMethod.get('srch-inp-crtrYr');
		 let apcCd = SBUxMethod.get('srch-inp-apcCd');
		 let saveList = [];

		 for (var i = 1; i < 5; i++) {
			let itemVo = {
					crtrYr : crtrYr
					,apcCd : apcCd
					,sn  : i
					, prgrsYn : 'Y' //진척도 갱신 여부
					,apcGnrlTrmtAmt : SBUxMethod.get('dtl-inp-apcGnrlTrmtAmt'+i)
					,apcOgnzCprtnSortTrst : SBUxMethod.get('dtl-inp-apcOgnzCprtnSortTrst'+i)
					,apcCtrtEmspap : SBUxMethod.get('dtl-inp-apcCtrtEmspap'+i)

					,apcTrmtAmt : SBUxMethod.get('dtl-inp-apcTrmtAmt'+i)//apc취급액
					,apcTrmtVlm : SBUxMethod.get('dtl-inp-apcTrmtVlm'+i)//apc물량
					,tmSpmtAmt : SBUxMethod.get('dtl-inp-apcTmSpmtAmt'+i)//APC 취급액 중 산지유통통합조직 출하액
					,tmSpmtRt : SBUxMethod.get('dtl-inp-apcTmSpmtRt'+i)//전속출하 비율
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
		// 결과 확인 후 재조회
		console.log("insert result", data);
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


		SBUxMethod.set('dtl-inp-apcGnrlTrmtAmtTot',apcGnrlTrmtAmtArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-apcOgnzCprtnSortTrstTot',apcOgnzCprtnSortTrstArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-apcCtrtEmspapTot',apcCtrtEmspapArr.reduce((acc, cur) => {return acc + cur;}, 0));
		SBUxMethod.set('dtl-inp-apcTrmtVlmTot',apcTrmtVlmArr.reduce((acc, cur) => {return acc + cur;}, 0));

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
		let apcTrmtAmtTot = apcTrmtAmtArr.reduce((acc, cur) => {return acc + cur;}, 0);

		SBUxMethod.set('dtl-inp-apcTrmtAmtTot',apcTrmtAmtTot );
		let apcTmSpmtAmtTot = apcTmSpmtAmtArr.reduce((acc, cur) => {return acc + cur;}, 0);
		SBUxMethod.set('dtl-inp-apcTmSpmtAmtTot',apcTmSpmtAmtTot);

		let totRt;
		if(apcTrmtAmtTot === 0){
			totRt = 0;
		}else{
			totRt = apcTmSpmtAmtTot / apcTrmtAmtTot * 100 ;
		}
		SBUxMethod.set('dtl-inp-apcTmSpmtRtTot',totRt.toFixed(0));
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
	const fn_setApc = function(apc) {
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
	}

</script>
</html>