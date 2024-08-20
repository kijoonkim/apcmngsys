<%
 /**
  * @Class Name : fcltAtmtcMchnInfoReg.jsp
  * @Description : 4.1.스마트화현황 화면
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
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 스마트자동화 -->
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
						<th scope="row">대상연도</th>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-spinner
									id="srch-inp-crtrYr"
									name="srch-inp-crtrYr"
									uitype="normal"
									step-value="1"
								></sbux-spinner>
						</td>
						<td class="td_input" style="border-right: hidden;">
							<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_selectAtMcIfList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
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
			<div><label>스마트자동화 상세내역</label></div>
			<div>
					<table class="table table-bordered tbl_row tbl_fixed" style="width: 575px">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 24%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 15%">
						</colgroup>
						<tbody>
							<tr>
								<th style="border-right: 1px solid white !important; text-align: center;">설비</th>
								<th style="border-right: 1px solid white !important; text-align: center;">품목1</th>
								<th style="border-right: 1px solid white !important; text-align: center;">품목2</th>
								<th style="border-right: 1px solid white !important; text-align: center;">품목3</th>
							</tr>
							<tr>
								<th>디팔렛타이저</th>
								<td>
									<sbux-checkbox
										id="dtl-inp-dptz1"
										name="dtl-inp-dptz1"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dptz1_1" name="dtl-rdo-dptz1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dptz1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dptz1_2" name="dtl-rdo-dptz1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dptz1_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-dptz2"
										name="dtl-inp-dptz2"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dptz2_1" name="dtl-rdo-dptz2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dptz1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dptz2_2" name="dtl-rdo-dptz2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dptz1_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-dptz3"
										name="dtl-inp-dptz3"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dptz3_1" name="dtl-rdo-dptz3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dptz1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dptz3_2" name="dtl-rdo-dptz3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dptz1_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>자동덤핑기</th>
								<td>
									<sbux-checkbox
										id="dtl-inp-apm1"
										name="dtl-inp-apm1"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-apm1_1" name="dtl-rdo-apm1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-apm1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-apm1_2" name="dtl-rdo-apm1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-apm1_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-apm2"
										name="dtl-inp-apm2"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-apm2_1" name="dtl-rdo-apm2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-apm2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-apm2_2" name="dtl-rdo-apm2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-apm2_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-apm3"
										name="dtl-inp-apm3"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-apm3_1" name="dtl-rdo-apm3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-apm3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-apm3_2" name="dtl-rdo-apm3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-apm3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>전자식 중량 선별기</th>
								<td>
									<sbux-checkbox
										id="dtl-inp-elctrnWghtSortMchn1"
										name="dtl-inp-elctrnWghtSortMchn1"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-elctrnWghtSortMchn1_1" name="dtl-rdo-elctrnWghtSortMchn1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-elctrnWghtSortMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-elctrnWghtSortMchn1_2" name="dtl-rdo-elctrnWghtSortMchn1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-elctrnWghtSortMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-elctrnWghtSortMchn2"
										name="dtl-inp-elctrnWghtSortMchn2"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-elctrnWghtSortMchn2_1" name="dtl-rdo-elctrnWghtSortMchn2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-elctrnWghtSortMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-elctrnWghtSortMchn2_2" name="dtl-rdo-elctrnWghtSortMchn2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-elctrnWghtSortMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-elctrnWghtSortMchn3"
										name="dtl-inp-elctrnWghtSortMchn3"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-elctrnWghtSortMchn3_1" name="dtl-rdo-elctrnWghtSortMchn3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-elctrnWghtSortMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-elctrnWghtSortMchn3_2" name="dtl-rdo-elctrnWghtSortMchn3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-elctrnWghtSortMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>비파괴 당도 선별기</th>
								<td>
									<sbux-checkbox
										id="dtl-inp-ndstBrckSortMchn1"
										name="dtl-inp-ndstBrckSortMchn1"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ndstBrckSortMchn1_1" name="dtl-rdo-ndstBrckSortMchn1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ndstBrckSortMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ndstBrckSortMchn1_2" name="dtl-rdo-ndstBrckSortMchn1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ndstBrckSortMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-ndstBrckSortMchn2"
										name="dtl-inp-ndstBrckSortMchn2"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ndstBrckSortMchn2_1" name="dtl-rdo-ndstBrckSortMchn2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ndstBrckSortMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ndstBrckSortMchn2_2" name="dtl-rdo-ndstBrckSortMchn2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ndstBrckSortMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-ndstBrckSortMchn3"
										name="dtl-inp-ndstBrckSortMchn3"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ndstBrckSortMchn3_1" name="dtl-rdo-ndstBrckSortMchn3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ndstBrckSortMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ndstBrckSortMchn3_2" name="dtl-rdo-ndstBrckSortMchn3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ndstBrckSortMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>등급별 원물 자동 이송 장치</th>
								<td>
									<sbux-checkbox
										id="dtl-inp-grdRawMtrAtmtcTrnsfMchn1"
										name="dtl-inp-grdRawMtrAtmtcTrnsfMchn1"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-grdRawMtrAtmtcTrnsfMchn1_1" name="dtl-rdo-grdRawMtrAtmtcTrnsfMchn1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-grdRawMtrAtmtcTrnsfMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-grdRawMtrAtmtcTrnsfMchn1_2" name="dtl-rdo-grdRawMtrAtmtcTrnsfMchn1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-grdRawMtrAtmtcTrnsfMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-grdRawMtrAtmtcTrnsfMchn2"
										name="dtl-inp-grdRawMtrAtmtcTrnsfMchn2"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-grdRawMtrAtmtcTrnsfMchn2_1" name="dtl-rdo-grdRawMtrAtmtcTrnsfMchn2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-grdRawMtrAtmtcTrnsfMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-grdRawMtrAtmtcTrnsfMchn2_2" name="dtl-rdo-grdRawMtrAtmtcTrnsfMchn2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-grdRawMtrAtmtcTrnsfMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-grdRawMtrAtmtcTrnsfMchn3"
										name="dtl-inp-grdRawMtrAtmtcTrnsfMchn3"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-grdRawMtrAtmtcTrnsfMchn3_1" name="dtl-rdo-grdRawMtrAtmtcTrnsfMchn3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-grdRawMtrAtmtcTrnsfMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-grdRawMtrAtmtcTrnsfMchn3_2" name="dtl-rdo-grdRawMtrAtmtcTrnsfMchn3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-grdRawMtrAtmtcTrnsfMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>공박스(망․톤백 등) 자동 배출 장치</th>
								<td>
									<sbux-checkbox
										id="dtl-inp-emptBxAtmtcExhstMchn1"
										name="dtl-inp-emptBxAtmtcExhstMchn1"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-emptBxAtmtcExhstMchn1_1" name="dtl-rdo-emptBxAtmtcExhstMchn1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-emptBxAtmtcExhstMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-emptBxAtmtcExhstMchn1_2" name="dtl-rdo-emptBxAtmtcExhstMchn1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-emptBxAtmtcExhstMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-emptBxAtmtcExhstMchn2"
										name="dtl-inp-emptBxAtmtcExhstMchn2"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-emptBxAtmtcExhstMchn2_1" name="dtl-rdo-emptBxAtmtcExhstMchn2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-emptBxAtmtcExhstMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-emptBxAtmtcExhstMchn2_2" name="dtl-rdo-emptBxAtmtcExhstMchn2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-emptBxAtmtcExhstMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-emptBxAtmtcExhstMchn3"
										name="dtl-inp-emptBxAtmtcExhstMchn3"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-emptBxAtmtcExhstMchn3_1" name="dtl-rdo-emptBxAtmtcExhstMchn3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-emptBxAtmtcExhstMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-emptBxAtmtcExhstMchn3_2" name="dtl-rdo-emptBxAtmtcExhstMchn3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-emptBxAtmtcExhstMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>자동 박스(망․톤백 등) 포장기</th>
								<td>
									<sbux-checkbox
										id="dtl-inp-atmtcBxPckgMchn1"
										name="dtl-inp-atmtcBxPckgMchn1"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcBxPckgMchn1_1" name="dtl-rdo-atmtcBxPckgMchn1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcBxPckgMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcBxPckgMchn1_2" name="dtl-rdo-atmtcBxPckgMchn1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcBxPckgMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-atmtcBxPckgMchn2"
										name="dtl-inp-atmtcBxPckgMchn2"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcBxPckgMchn2_1" name="dtl-rdo-atmtcBxPckgMchn2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcBxPckgMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcBxPckgMchn2_2" name="dtl-rdo-atmtcBxPckgMchn2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcBxPckgMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-atmtcBxPckgMchn3"
										name="dtl-inp-atmtcBxPckgMchn3"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcBxPckgMchn3_1" name="dtl-rdo-atmtcBxPckgMchn3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcBxPckgMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcBxPckgMchn3_2" name="dtl-rdo-atmtcBxPckgMchn3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcBxPckgMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>자동 소포장기</th>
								<td>
									<sbux-checkbox
										id="dtl-inp-atmtcSsMchn1"
										name="dtl-inp-atmtcSsMchn1"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcSsMchn1_1" name="dtl-rdo-atmtcSsMchn1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcSsMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcSsMchn1_2" name="dtl-rdo-atmtcSsMchn1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcSsMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-atmtcSsMchn2"
										name="dtl-inp-atmtcSsMchn2"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcSsMchn2_1" name="dtl-rdo-atmtcSsMchn2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcSsMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcSsMchn2_2" name="dtl-rdo-atmtcSsMchn2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcSsMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-atmtcSsMchn3"
										name="dtl-inp-atmtcSsMchn3"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcSsMchn3_1" name="dtl-rdo-atmtcSsMchn3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcSsMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcSsMchn3_2" name="dtl-rdo-atmtcSsMchn3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcSsMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>자동랩핑기</th>
								<td>
									<sbux-checkbox
										id="dtl-inp-atmtcWrapMchn1"
										name="dtl-inp-atmtcWrapMchn1"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWrapMchn1_1" name="dtl-rdo-atmtcWrapMchn1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWrapMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWrapMchn1_2" name="dtl-rdo-atmtcWrapMchn1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWrapMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-atmtcWrapMchn2"
										name="dtl-inp-atmtcWrapMchn2"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWrapMchn2_1" name="dtl-rdo-atmtcWrapMchn2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWrapMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWrapMchn2_2" name="dtl-rdo-atmtcWrapMchn2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWrapMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-atmtcWrapMchn3"
										name="dtl-inp-atmtcWrapMchn3"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWrapMchn3_1" name="dtl-rdo-atmtcWrapMchn3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWrapMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWrapMchn3_2" name="dtl-rdo-atmtcWrapMchn3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWrapMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>자동 중량체크기(포장 시)</th>
								<td>
									<sbux-checkbox
										id="dtl-inp-atmtcWghtChckMchn1"
										name="dtl-inp-atmtcWghtChckMchn1"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWghtChckMchn1_1" name="dtl-rdo-atmtcWghtChckMchn1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWghtChckMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWghtChckMchn1_2" name="dtl-rdo-atmtcWghtChckMchn1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWghtChckMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-atmtcWghtChckMchn2"
										name="dtl-inp-atmtcWghtChckMchn2"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWghtChckMchn2_1" name="dtl-rdo-atmtcWghtChckMchn2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWghtChckMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWghtChckMchn2_2" name="dtl-rdo-atmtcWghtChckMchn2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWghtChckMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-atmtcWghtChckMchn3"
										name="dtl-inp-atmtcWghtChckMchn3"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWghtChckMchn3_1" name="dtl-rdo-atmtcWghtChckMchn3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWghtChckMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWghtChckMchn3_2" name="dtl-rdo-atmtcWghtChckMchn3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWghtChckMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>팔렛타이저(로봇팔 등)</th>
								<td>
									<sbux-checkbox
										id="dtl-inp-ptz1"
										name="dtl-inp-ptz1"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ptz1_1" name="dtl-rdo-ptz1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ptz1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ptz1_2" name="dtl-rdo-ptz1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ptz1_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-ptz2"
										name="dtl-inp-ptz2"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ptz2_1" name="dtl-rdo-ptz2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ptz2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ptz2_2" name="dtl-rdo-ptz2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ptz2_2">미설치</label>
									</p>
								</td>
								<td>
									<sbux-checkbox
										id="dtl-inp-ptz3"
										name="dtl-inp-ptz3"
										uitype="hidden"
										text=""
										true-value="Y"
										false-value="N"
										class="check"
										></sbux-checkbox>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ptz3_1" name="dtl-rdo-ptz3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ptz3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ptz3_2" name="dtl-rdo-ptz3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ptz3_2">미설치</label>
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div>
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 20%">
							<col style="width: 30%">
							<col style="width: 30%">
							<col style="width: 30%">
						</colgroup>
						<tbody>
							<tr>
								<th style="border-right: 1px solid white !important; text-align: center;">설비</th>
								<th style="border-right: 1px solid white !important; text-align: center;">품목1</th>
								<th style="border-right: 1px solid white !important; text-align: center;">품목2</th>
								<th style="border-right: 1px solid white !important; text-align: center;">품목3</th>
							</tr>
							<tr>
								<th>규격</th>
								<td>
									<sbux-input id="dtl-inp-rprsItemSpcfct1" name="dtl-inp-rprsItemSpcfct1"dtl-inp-rprsItemSpcfct"" uitype="text" class="form-control input-sm" placeholder="예시) 2대x1조 32등급" ></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-rprsItemSpcfct2" name="dtl-inp-rprsItemSpcfct2"dtl-inp-rprsItemSpcfct"" uitype="text" class="form-control input-sm" placeholder="예시) 2대x1조 32등급" ></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-rprsItemSpcfct3" name="dtl-inp-rprsItemSpcfct3"dtl-inp-rprsItemSpcfct"" uitype="text" class="form-control input-sm" placeholder="예시) 2대x1조 32등급" ></sbux-input>
								</td>
							</tr>
							<tr>
								<th>기타 가공설비</th>
								<td>
									<sbux-input id="dtl-inp-etcMnfcMchn1" name="dtl-inp-etcMnfcMchn1" uitype="text" class="form-control input-sm" placeholder="예시)착즙기, 커팅기 등" ></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-etcMnfcMchn2" name="dtl-inp-etcMnfcMchn2" uitype="text" class="form-control input-sm" placeholder="예시)착즙기, 커팅기 등" ></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-etcMnfcMchn3" name="dtl-inp-etcMnfcMchn3" uitype="text" class="form-control input-sm" placeholder="예시)착즙기, 커팅기 등" ></sbux-input>
								</td>
							</tr>
						</tbody>
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
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};

		<c:if test="${loginVO.id eq 'admin'}">
		/*테스트*/
		let apcCd = '0122';
		let crtrYr = '2023';
		let apcNm = 'test';
		SBUxMethod.set("srch-inp-apcCd", apcCd);
		SBUxMethod.set("srch-inp-crtrYr", crtrYr);
		SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>


		fn_init();

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

	const fn_selectAtMcIfList = async function(copy_chk) {
		 console.log("******************fn_pagingAtMcIfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		//전년도 데이터
		if(!gfn_isEmpty(copy_chk)){
			crtrYr = parseFloat(crtrYr) - parseFloat(copy_chk);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltAtmtcMchnInfoList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr
		});

		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {

			data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-inp-rprsItemSpcfct',item.rprsItemSpcfct);

				SBUxMethod.set('dtl-inp-dptz',item.dptz);
				SBUxMethod.set('dtl-inp-apm',item.apm);
				SBUxMethod.set('dtl-inp-elctrnWghtSortMchn',item.elctrnWghtSortMchn);
				SBUxMethod.set('dtl-inp-ndstBrckSortMchn',item.ndstBrckSortMchn);
				SBUxMethod.set('dtl-inp-grdRawMtrAtmtcTrnsfMchn',item.grdRawMtrAtmtcTrnsfMchn);
				SBUxMethod.set('dtl-inp-emptBxAtmtcExhstMchn',item.emptBxAtmtcExhstMchn);
				SBUxMethod.set('dtl-inp-atmtcBxPckgMchn',item.atmtcBxPckgMchn);
				SBUxMethod.set('dtl-inp-atmtcSsMchn',item.atmtcSsMchn);
				SBUxMethod.set('dtl-inp-atmtcWrapMchn',item.atmtcWrapMchn);
				SBUxMethod.set('dtl-inp-atmtcWghtChckMchn',item.atmtcWghtChckMchn);
				SBUxMethod.set('dtl-inp-ptz',item.ptz);
				SBUxMethod.set('dtl-inp-etcMnfcMchn',item.etcMnfcMchn);
			});

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

		//alert('준비중');
		fn_subInsert(confirm("등록 하시겠습니까?"));
	}

	//신규등록
	const fn_subInsert = async function (isConfirmed){
		console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

		let saveList = [];

		for (var i = 1; i < 4; i++) {

			let item = {
					crtrYr : SBUxMethod.get('srch-inp-crtrYr')
					,apcCd : SBUxMethod.get('srch-inp-apcCd')
					,sn : i
					, prgrsYn : 'Y' //진척도 갱신 여부
					,rprsItemSpcfct : SBUxMethod.get('dtl-inp-rprsItemSpcfct'+i)
					,dptz : SBUxMethod.get('dtl-inp-dptz'+i)
					,apm : SBUxMethod.get('dtl-inp-apm'+i)
					,elctrnWghtSortMchn : SBUxMethod.get('dtl-inp-elctrnWghtSortMchn'+i)
					,ndstBrckSortMchn : SBUxMethod.get('dtl-inp-ndstBrckSortMchn'+i)
					,grdRawMtrAtmtcTrnsfMchn : SBUxMethod.get('dtl-inp-grdRawMtrAtmtcTrnsfMchn'+i)
					,emptBxAtmtcExhstMchn : SBUxMethod.get('dtl-inp-emptBxAtmtcExhstMchn'+i)
					,atmtcBxPckgMchn : SBUxMethod.get('dtl-inp-atmtcBxPckgMchn'+i)
					,atmtcSsMchn : SBUxMethod.get('dtl-inp-atmtcSsMchn'+i)
					,atmtcWrapMchn : SBUxMethod.get('dtl-inp-atmtcWrapMchn'+i)
					,atmtcWghtChckMchn : SBUxMethod.get('dtl-inp-atmtcWghtChckMchn'+i)
					,ptz : SBUxMethod.get('dtl-inp-ptz+i')
					,etcMnfcMchn : SBUxMethod.get('dtl-inp-etcMnfcMchn'+i)
			};

			saveList.push(item);
		}

		 const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltAtmtcMchnInfo.do",saveList);

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
				//fn_search();
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
		}
		// 결과 확인 후 재조회
		console.log("insert result", data);
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

	//탭열린 상태에서 해당 페이지 다시 왔을떄 이벤트
	window.addEventListener('message',function(event){
		//console.log('1. 탭호출');
		//console.log(event);
		let chkVal = event.data.chkVal;
		if(chkVal == "selTab"){
			//진척도 조회
			cfn_selectPrgrs();
		}
	});
</script>
</html>