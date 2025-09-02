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
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid" style="height: 100vh">
			<div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background-color: white; z-index: 99" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 스마트자동화 -->
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
							<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_selectAtMcIfList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
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
				<label style="font-weight: bold;">○스마트자동화 상세내역</label><br>
				<label>* 데이터 입력 시 조사연도의 직전년도 기준으로 작성해주시기 바랍니다.</label>
			</div>
			<div>
					<table class="table table-bordered tbl_row tbl_fixed" style="width: 685px">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 5%">
							<col style="width: 32%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 15%">
						</colgroup>
						<tbody>
							<tr>
								<th colspan="2" style="border-right: 1px solid white !important; text-align: center;">설비</th>
								<th style="border-right: 1px solid white !important; text-align: center;">
									<span id="itemNm1">품목1</span>
									<sbux-input id="dtl-inp-itemChk1" name="dtl-inp-itemChk1" uitype="hidden"></sbux-input>
									<sbux-input id="dtl-inp-itemCd1" name="dtl-inp-itemCd1" uitype="hidden"></sbux-input>
								</th>
								<th style="border-right: 1px solid white !important; text-align: center;">
									<span id="itemNm2">품목2</span>
									<sbux-input id="dtl-inp-itemChk2" name="dtl-inp-itemChk2" uitype="hidden"></sbux-input>
									<sbux-input id="dtl-inp-itemCd2" name="dtl-inp-itemCd2" uitype="hidden"></sbux-input>
								</th>
								<th style="border-right: 1px solid white !important; text-align: center;">
									<span id="itemNm3">품목3</span>
									<sbux-input id="dtl-inp-itemChk3" name="dtl-inp-itemChk3" uitype="hidden"></sbux-input>
									<sbux-input id="dtl-inp-itemCd3" name="dtl-inp-itemCd3" uitype="hidden"></sbux-input>
								</th>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important; text-align: center;">구분</th>
								<th style="border-right: 1px solid white !important; text-align: center;">설비명</th>
								<th style="border-right: 1px solid white !important; text-align: center;">
									<sbux-button id="srch-btn-allItem1" name="srch-btn-allItem1" uitype="normal" onclick="fn_allChk(1)" text="전체 미설치" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</th>
								<th style="border-right: 1px solid white !important; text-align: center;">
									<sbux-button id="srch-btn-allItem2" name="srch-btn-allItem2" uitype="normal" onclick="fn_allChk(2)" text="전체 미설치" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</th>
								<th style="border-right: 1px solid white !important; text-align: center;">
									<sbux-button id="srch-btn-allItem3" name="srch-btn-allItem3" uitype="normal" onclick="fn_allChk(3)" text="전체 미설치" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</th>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">입고</th>
								<th style="text-align: center;">계근대</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wbg1_1" name="dtl-rdo-wbg1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wbg1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wbg1_2" name="dtl-rdo-wbg1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wbg1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wbg2_1" name="dtl-rdo-wbg2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wbg2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wbg2_2" name="dtl-rdo-wbg2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wbg2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wbg3_1" name="dtl-rdo-wbg3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wbg3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wbg3_2" name="dtl-rdo-wbg3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wbg3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">입고</th>
								<th style="text-align: center;">바코드 /QR 시스템</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsBrQr1_1" name="dtl-rdo-wrhsBrQr1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsBrQr1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsBrQr1_2" name="dtl-rdo-wrhsBrQr1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsBrQr1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsBrQr2_1" name="dtl-rdo-wrhsBrQr2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsBrQr2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsBrQr2_2" name="dtl-rdo-wrhsBrQr2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsBrQr2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsBrQr3_1" name="dtl-rdo-wrhsBrQr3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsBrQr3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsBrQr3_2" name="dtl-rdo-wrhsBrQr3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsBrQr3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">입고</th>
								<th style="text-align: center;">키오스크·태블릿</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-kskTblt1_1" name="dtl-rdo-kskTblt1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-kskTblt1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-kskTblt1_2" name="dtl-rdo-kskTblt1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-kskTblt1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-kskTblt2_1" name="dtl-rdo-kskTblt2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-kskTblt2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-kskTblt2_2" name="dtl-rdo-kskTblt2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-kskTblt2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-kskTblt3_1" name="dtl-rdo-kskTblt3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-kskTblt3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-kskTblt3_2" name="dtl-rdo-kskTblt3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-kskTblt3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">선별</th>
								<th style="text-align: center;">디팔렛타이저</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dptz1_1" name="dtl-rdo-dptz1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dptz1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dptz1_2" name="dtl-rdo-dptz1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dptz1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dptz2_1" name="dtl-rdo-dptz2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dptz1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dptz2_2" name="dtl-rdo-dptz2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dptz1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dptz3_1" name="dtl-rdo-dptz3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dptz1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dptz3_2" name="dtl-rdo-dptz3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dptz1_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">선별</th>
								<th style="text-align: center;">자동덤핑기</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-apm1_1" name="dtl-rdo-apm1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-apm1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-apm1_2" name="dtl-rdo-apm1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-apm1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-apm2_1" name="dtl-rdo-apm2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-apm2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-apm2_2" name="dtl-rdo-apm2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-apm2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-apm3_1" name="dtl-rdo-apm3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-apm3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-apm3_2" name="dtl-rdo-apm3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-apm3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">선별</th>
								<th style="text-align: center;">전자식 중량 선별기</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-elctrnWghtSortMchn1_1" name="dtl-rdo-elctrnWghtSortMchn1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-elctrnWghtSortMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-elctrnWghtSortMchn1_2" name="dtl-rdo-elctrnWghtSortMchn1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-elctrnWghtSortMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-elctrnWghtSortMchn2_1" name="dtl-rdo-elctrnWghtSortMchn2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-elctrnWghtSortMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-elctrnWghtSortMchn2_2" name="dtl-rdo-elctrnWghtSortMchn2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-elctrnWghtSortMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-elctrnWghtSortMchn3_1" name="dtl-rdo-elctrnWghtSortMchn3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-elctrnWghtSortMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-elctrnWghtSortMchn3_2" name="dtl-rdo-elctrnWghtSortMchn3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-elctrnWghtSortMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">선별</th>
								<th style="text-align: center;">비파괴 당도 선별기</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ndstBrckSortMchn1_1" name="dtl-rdo-ndstBrckSortMchn1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ndstBrckSortMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ndstBrckSortMchn1_2" name="dtl-rdo-ndstBrckSortMchn1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ndstBrckSortMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ndstBrckSortMchn2_1" name="dtl-rdo-ndstBrckSortMchn2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ndstBrckSortMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ndstBrckSortMchn2_2" name="dtl-rdo-ndstBrckSortMchn2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ndstBrckSortMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ndstBrckSortMchn3_1" name="dtl-rdo-ndstBrckSortMchn3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ndstBrckSortMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ndstBrckSortMchn3_2" name="dtl-rdo-ndstBrckSortMchn3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ndstBrckSortMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">선별</th>
								<th style="text-align: center;">등급별 원물 자동 이송 장치</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-grdRawMtrAtmtcTrnsfMchn1_1" name="dtl-rdo-grdRawMtrAtmtcTrnsfMchn1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-grdRawMtrAtmtcTrnsfMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-grdRawMtrAtmtcTrnsfMchn1_2" name="dtl-rdo-grdRawMtrAtmtcTrnsfMchn1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-grdRawMtrAtmtcTrnsfMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-grdRawMtrAtmtcTrnsfMchn2_1" name="dtl-rdo-grdRawMtrAtmtcTrnsfMchn2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-grdRawMtrAtmtcTrnsfMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-grdRawMtrAtmtcTrnsfMchn2_2" name="dtl-rdo-grdRawMtrAtmtcTrnsfMchn2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-grdRawMtrAtmtcTrnsfMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-grdRawMtrAtmtcTrnsfMchn3_1" name="dtl-rdo-grdRawMtrAtmtcTrnsfMchn3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-grdRawMtrAtmtcTrnsfMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-grdRawMtrAtmtcTrnsfMchn3_2" name="dtl-rdo-grdRawMtrAtmtcTrnsfMchn3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-grdRawMtrAtmtcTrnsfMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">선별</th>
								<th style="text-align: center;">전자식 대시보드(모니터)</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dshbrd1_1" name="dtl-rdo-dshbrd1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dshbrd1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dshbrd1_2" name="dtl-rdo-dshbrd1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dshbrd1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dshbrd2_1" name="dtl-rdo-dshbrd2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dshbrd2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dshbrd2_2" name="dtl-rdo-dshbrd2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dshbrd2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dshbrd3_1" name="dtl-rdo-dshbrd3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dshbrd3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dshbrd3_2" name="dtl-rdo-dshbrd3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dshbrd3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">포장</th>
								<th style="text-align: center;">공박스(망․톤백 등) 자동 배출 장치</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-emptBxAtmtcExhstMchn1_1" name="dtl-rdo-emptBxAtmtcExhstMchn1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-emptBxAtmtcExhstMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-emptBxAtmtcExhstMchn1_2" name="dtl-rdo-emptBxAtmtcExhstMchn1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-emptBxAtmtcExhstMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-emptBxAtmtcExhstMchn2_1" name="dtl-rdo-emptBxAtmtcExhstMchn2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-emptBxAtmtcExhstMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-emptBxAtmtcExhstMchn2_2" name="dtl-rdo-emptBxAtmtcExhstMchn2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-emptBxAtmtcExhstMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-emptBxAtmtcExhstMchn3_1" name="dtl-rdo-emptBxAtmtcExhstMchn3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-emptBxAtmtcExhstMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-emptBxAtmtcExhstMchn3_2" name="dtl-rdo-emptBxAtmtcExhstMchn3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-emptBxAtmtcExhstMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">포장</th>
								<th style="text-align: center;">자동 박스(망․톤백 등) 포장기</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcBxPckgMchn1_1" name="dtl-rdo-atmtcBxPckgMchn1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcBxPckgMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcBxPckgMchn1_2" name="dtl-rdo-atmtcBxPckgMchn1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcBxPckgMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcBxPckgMchn2_1" name="dtl-rdo-atmtcBxPckgMchn2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcBxPckgMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcBxPckgMchn2_2" name="dtl-rdo-atmtcBxPckgMchn2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcBxPckgMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcBxPckgMchn3_1" name="dtl-rdo-atmtcBxPckgMchn3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcBxPckgMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcBxPckgMchn3_2" name="dtl-rdo-atmtcBxPckgMchn3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcBxPckgMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">포장</th>
								<th style="text-align: center;">자동 소포장기</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcSsMchn1_1" name="dtl-rdo-atmtcSsMchn1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcSsMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcSsMchn1_2" name="dtl-rdo-atmtcSsMchn1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcSsMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcSsMchn2_1" name="dtl-rdo-atmtcSsMchn2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcSsMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcSsMchn2_2" name="dtl-rdo-atmtcSsMchn2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcSsMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcSsMchn3_1" name="dtl-rdo-atmtcSsMchn3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcSsMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcSsMchn3_2" name="dtl-rdo-atmtcSsMchn3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcSsMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">포장</th>
								<th style="text-align: center;">자동랩핑기</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWrapMchn1_1" name="dtl-rdo-atmtcWrapMchn1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWrapMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWrapMchn1_2" name="dtl-rdo-atmtcWrapMchn1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWrapMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWrapMchn2_1" name="dtl-rdo-atmtcWrapMchn2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWrapMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWrapMchn2_2" name="dtl-rdo-atmtcWrapMchn2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWrapMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWrapMchn3_1" name="dtl-rdo-atmtcWrapMchn3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWrapMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWrapMchn3_2" name="dtl-rdo-atmtcWrapMchn3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWrapMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">포장</th>
								<th style="text-align: center;">자동 중량체크기(포장 시)</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWghtChckMchn1_1" name="dtl-rdo-atmtcWghtChckMchn1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWghtChckMchn1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWghtChckMchn1_2" name="dtl-rdo-atmtcWghtChckMchn1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWghtChckMchn1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWghtChckMchn2_1" name="dtl-rdo-atmtcWghtChckMchn2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWghtChckMchn2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWghtChckMchn2_2" name="dtl-rdo-atmtcWghtChckMchn2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWghtChckMchn2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWghtChckMchn3_1" name="dtl-rdo-atmtcWghtChckMchn3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWghtChckMchn3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-atmtcWghtChckMchn3_2" name="dtl-rdo-atmtcWghtChckMchn3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-atmtcWghtChckMchn3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">출고</th>
								<th style="text-align: center;">팔렛타이저(로봇팔 등)</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ptz1_1" name="dtl-rdo-ptz1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ptz1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ptz1_2" name="dtl-rdo-ptz1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ptz1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ptz2_1" name="dtl-rdo-ptz2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ptz2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ptz2_2" name="dtl-rdo-ptz2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ptz2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ptz3_1" name="dtl-rdo-ptz3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ptz3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-ptz3_2" name="dtl-rdo-ptz3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-ptz3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">출고</th>
								<th style="text-align: center;">바코드 /QR 시스템</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtBrQr1_1" name="dtl-rdo-spmtBrQr1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtBrQr1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtBrQr1_2" name="dtl-rdo-spmtBrQr1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtBrQr1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtBrQr2_1" name="dtl-rdo-spmtBrQr2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtBrQr2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtBrQr2_2" name="dtl-rdo-spmtBrQr2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtBrQr2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtBrQr3_1" name="dtl-rdo-spmtBrQr3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtBrQr3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtBrQr3_2" name="dtl-rdo-spmtBrQr3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtBrQr3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important;">저장</th>
								<th style="text-align: center;">온습도 자동제어기</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-thAc1_1" name="dtl-rdo-thAc1" uitype="normal" value="1" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-thAc1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-thAc1_2" name="dtl-rdo-thAc1" uitype="normal" value="2" class="radio_label" group-id="group1"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-thAc1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-thAc2_1" name="dtl-rdo-thAc2" uitype="normal" value="1" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-thAc2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-thAc2_2" name="dtl-rdo-thAc2" uitype="normal" value="2" class="radio_label" group-id="group2"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-thAc2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-thAc3_1" name="dtl-rdo-thAc3" uitype="normal" value="1" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-thAc3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-thAc3_2" name="dtl-rdo-thAc3" uitype="normal" value="2" class="radio_label" group-id="group3"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-thAc3_2">미설치</label>
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

							<col style="width: 7%">
							<col style="width: 28px">
							<col style="width: 7%">
							<col style="width: 28px">
							<col style="width: 7%">
							<col style="width: 40px">

							<col style="width: 7%">
							<col style="width: 28px">
							<col style="width: 7%">
							<col style="width: 28px">
							<col style="width: 7%">
							<col style="width: 40px">

							<col style="width: 7%">
							<col style="width: 28px">
							<col style="width: 7%">
							<col style="width: 28px">
							<col style="width: 7%">
							<col style="width: 40px">
							<col style="width: 0%">
						</colgroup>
						<tbody>
							<tr>
								<th style="border-right: 1px solid white !important; text-align: center;">설비</th>
								<th colspan="6" style="border-right: 1px solid white !important; text-align: center;"><span id="subItemNm1">품목1</span></th>
								<th colspan="6" style="border-right: 1px solid white !important; text-align: center;"><span id="subItemNm2">품목2</span></th>
								<th colspan="6" style="border-right: 1px solid white !important; text-align: center;"><span id="subItemNm3">품목3</span></th>
							</tr>
							<tr>
								<th>규격<br>(예시: 2대x1조 32등급)</th>

								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-spcfctCnt1"
										name="dtl-inp-spcfctCnt1"
										uitype="text"
										class="form-control input-sm"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										maxlength="10"
									></sbux-input>
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									대
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-spcfctGrp1"
										name="dtl-inp-spcfctGrp1"
										uitype="text"
										class="form-control input-sm"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										maxlength="10"
									></sbux-input>
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									조
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-spcfctGrd1"
										name="dtl-inp-spcfctGrd1"
										uitype="text"
										class="form-control input-sm"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										maxlength="10"
									></sbux-input>
								</td>
								<td>등급</td>

								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-spcfctCnt2"
										name="dtl-inp-spcfctCnt2"
										uitype="text"
										class="form-control input-sm"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										maxlength="10"
									></sbux-input>
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									대
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-spcfctGrp2"
										name="dtl-inp-spcfctGrp2"
										uitype="text"
										class="form-control input-sm" mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										maxlength="10"
									></sbux-input>
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									조
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-spcfctGrd2"
										name="dtl-inp-spcfctGrd2"
										uitype="text"
										class="form-control input-sm"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										maxlength="10"
									></sbux-input>
								</td>
								<td>등급</td>

								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-spcfctCnt3"
										name="dtl-inp-spcfctCnt3"
										uitype="text"
										class="form-control input-sm"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										maxlength="10"
									></sbux-input>
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									대
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-spcfctGrp3"
										name="dtl-inp-spcfctGrp3"
										uitype="text"
										class="form-control input-sm"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										maxlength="10"
									></sbux-input>
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									조
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input
										id="dtl-inp-spcfctGrd3"
										name="dtl-inp-spcfctGrd3"
										uitype="text"
										class="form-control input-sm"
										mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
										maxlength="10"
									></sbux-input>
								</td>
								<td>등급</td>
							</tr>
							<!--
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
							-->
						</tbody>
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
	// 전년도
	var jsonPrevData = [];

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
		await gfn_getApcSurveyCrtrYr('srch-slt-crtrYr',jsonCrtrYr); // 연도
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

	//입력폼 초기화
	const fn_clearForm = async function() {
		for (var i = 1; i < 4; i++) {
			SBUxMethod.set('dtl-inp-itemChk'+i,null);//품목 존재 여부
			$('#itemNm'+i).text("품목"+i);
			$('#subItemNm'+i).text("품목"+i);

			//그룹 비활성화
			SBUxMethod.changeGroupAttr('group'+i,'disabled','true');
			//그룹 초기화
			SBUxMethod.clearGroupData('group'+i);

			SBUxMethod.attr('dtl-inp-spcfctCnt'+i,'disabled','true');
			SBUxMethod.attr('dtl-inp-spcfctGrp'+i,'disabled','true');
			SBUxMethod.attr('dtl-inp-spcfctGrd'+i,'disabled','true');

			SBUxMethod.set('dtl-inp-spcfctCnt'+i,null);
			SBUxMethod.set('dtl-inp-spcfctGrp'+i,null);
			SBUxMethod.set('dtl-inp-spcfctGrd'+i,null);

			SBUxMethod.set('dtl-inp-itemCd'+i,null);
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

		await fn_selectAtMcIfList();
		// 전년도 데이터
		await fn_selectAtMcIfList("Y");
	}

	const fn_selectAtMcIfList = async function(prevData) {

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-slt-crtrYr");

		jsonPrevData.length = 0;
		//전년도 데이터
		if(!gfn_isEmpty(prevData) && _.isEqual(prevData,"Y")){
			crtrYr = parseFloat(crtrYr) - 1;
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltAtmtcMchnInfoList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr
		});

		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			if (_.isEqual(prevData,"Y")) {
				jsonPrevData = data.resultList;
			} else {
				data.resultList.forEach((item, index) => {
					//SBUxMethod.set('dtl-inp-rprsItemSpcfct',item.rprsItemSpcfct);
					let sn = item.sn;
					//20240820 추가
					//WBG wbg , WRHS_BR_QR wrhsBrQr , KSK_TBLT kskTblt , DSHBRD dshbrd , SPMT_BR_QR spmtBrQr , TH_AC thAc
					SBUxMethod.set('dtl-inp-itemChk' + sn, 'Y');//품목 존재 여부
					SBUxMethod.set('dtl-inp-itemCd' + sn, item.itemCd); // 품목코드

					$('#itemNm' + sn).text("품목" + sn + " : " + item.itemNm);
					$('#subItemNm' + sn).text("품목" + sn + " : " + item.itemNm);

					//품목이 없는경우 해당 행자체가 존재 하지 않아 조회가 안되므로 여기서 활성화
					SBUxMethod.changeGroupAttr('group' + sn, 'disabled', 'false');
					SBUxMethod.attr('dtl-inp-spcfctCnt' + sn, 'disabled', 'false');
					SBUxMethod.attr('dtl-inp-spcfctGrp' + sn, 'disabled', 'false');
					SBUxMethod.attr('dtl-inp-spcfctGrd' + sn, 'disabled', 'false');


					SBUxMethod.set('dtl-rdo-wbg' + sn, item.wbg);
					SBUxMethod.set('dtl-rdo-wrhsBrQr' + sn, item.wrhsBrQr);
					SBUxMethod.set('dtl-rdo-kskTblt' + sn, item.kskTblt);

					SBUxMethod.set('dtl-rdo-dptz' + sn, item.dptz);
					SBUxMethod.set('dtl-rdo-apm' + sn, item.apm);
					SBUxMethod.set('dtl-rdo-elctrnWghtSortMchn' + sn, item.elctrnWghtSortMchn);
					SBUxMethod.set('dtl-rdo-ndstBrckSortMchn' + sn, item.ndstBrckSortMchn);
					SBUxMethod.set('dtl-rdo-grdRawMtrAtmtcTrnsfMchn' + sn, item.grdRawMtrAtmtcTrnsfMchn);

					SBUxMethod.set('dtl-rdo-dshbrd' + sn, item.dshbrd);

					SBUxMethod.set('dtl-rdo-emptBxAtmtcExhstMchn' + sn, item.emptBxAtmtcExhstMchn);
					SBUxMethod.set('dtl-rdo-atmtcBxPckgMchn' + sn, item.atmtcBxPckgMchn);
					SBUxMethod.set('dtl-rdo-atmtcSsMchn' + sn, item.atmtcSsMchn);
					SBUxMethod.set('dtl-rdo-atmtcWrapMchn' + sn, item.atmtcWrapMchn);
					SBUxMethod.set('dtl-rdo-atmtcWghtChckMchn' + sn, item.atmtcWghtChckMchn);
					SBUxMethod.set('dtl-rdo-ptz' + sn, item.ptz);

					SBUxMethod.set('dtl-rdo-spmtBrQr' + sn, item.spmtBrQr);
					SBUxMethod.set('dtl-rdo-thAc' + sn, item.thAc);

					//SBUxMethod.set('dtl-rdo-etcMnfcMchn'+sn,item.etcMnfcMchn);

					SBUxMethod.set('dtl-inp-spcfctCnt' + sn, item.spcfctCnt);
					SBUxMethod.set('dtl-inp-spcfctGrp' + sn, item.spcfctGrp);
					SBUxMethod.set('dtl-inp-spcfctGrd' + sn, item.spcfctGrd);
				});
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

	//신규등록
	const fn_subInsert = async function (isConfirmed , tmpChk){
		if (!isConfirmed) return;

		let saveList = [];

		for (var i = 1; i < 4; i++) {

			let item = {
					crtrYr : SBUxMethod.get('srch-slt-crtrYr')
					,apcCd : SBUxMethod.get('srch-inp-apcCd')
					,sn : i
					, prgrsYn : 'Y' //진척도 갱신 여부
					, tmprStrgYn : tmpChk//임시저장 여부
					//,rprsItemSpcfct : SBUxMethod.get('dtl-inp-rprsItemSpcfct'+i)

					,wbg : gfn_nvl(SBUxMethod.get('dtl-rdo-wbg'+i))
					,wrhsBrQr : gfn_nvl(SBUxMethod.get('dtl-rdo-wrhsBrQr'+i))
					,kskTblt : gfn_nvl(SBUxMethod.get('dtl-rdo-kskTblt'+i))

					,dptz : gfn_nvl(SBUxMethod.get('dtl-rdo-dptz'+i))
					,apm : gfn_nvl(SBUxMethod.get('dtl-rdo-apm'+i))
					,elctrnWghtSortMchn : gfn_nvl(SBUxMethod.get('dtl-rdo-elctrnWghtSortMchn'+i))
					,ndstBrckSortMchn : gfn_nvl(SBUxMethod.get('dtl-rdo-ndstBrckSortMchn'+i))
					,grdRawMtrAtmtcTrnsfMchn : gfn_nvl(SBUxMethod.get('dtl-rdo-grdRawMtrAtmtcTrnsfMchn'+i))

					,dshbrd : gfn_nvl(SBUxMethod.get('dtl-rdo-dshbrd'+i))

					,emptBxAtmtcExhstMchn : gfn_nvl(SBUxMethod.get('dtl-rdo-emptBxAtmtcExhstMchn'+i))
					,atmtcBxPckgMchn : gfn_nvl(SBUxMethod.get('dtl-rdo-atmtcBxPckgMchn'+i))
					,atmtcSsMchn : gfn_nvl(SBUxMethod.get('dtl-rdo-atmtcSsMchn'+i))
					,atmtcWrapMchn : gfn_nvl(SBUxMethod.get('dtl-rdo-atmtcWrapMchn'+i))
					,atmtcWghtChckMchn : gfn_nvl(SBUxMethod.get('dtl-rdo-atmtcWghtChckMchn'+i))
					,ptz : gfn_nvl(SBUxMethod.get('dtl-rdo-ptz'+i))

					,spmtBrQr : gfn_nvl(SBUxMethod.get('dtl-rdo-spmtBrQr'+i))
					,thAc : gfn_nvl(SBUxMethod.get('dtl-rdo-thAc'+i))

					//,etcMnfcMchn : gfn_nvl(SBUxMethod.get('dtl-rdo-etcMnfcMchn'+i))

					,spcfctCnt : gfn_nvl(SBUxMethod.get('dtl-inp-spcfctCnt'+i))
					,spcfctGrp : gfn_nvl(SBUxMethod.get('dtl-inp-spcfctGrp'+i))
					,spcfctGrd : gfn_nvl(SBUxMethod.get('dtl-inp-spcfctGrd'+i))
			};

			saveList.push(item);
		}
		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltAtmtcMchnInfo.do",saveList);

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
				//fn_search();
				cfn_allTabPrgrsRefrash();
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
		}
	}

	// apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setApc = async function(apc) {
		await fn_clearForm();
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
		//진척도 갱신
		await cfn_selectPrgrs();
		await fn_search();
	}

	// 전체 미설치 체크
	const fn_allChk = function(groupNum) {
		let groupArr = SBUxMethod.getGroupData("group"+groupNum);
		for (var i = 0; i < groupArr.length; i++) {
			SBUxMethod.set(groupArr[i].component_name.toString(), '2');
		}
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

	function fn_pySearch() {

		if (gfn_isEmpty(jsonPrevData)) return;

		// 초기화
		for (let i =1; i < 4; i++) {
			//그룹 비활성화
			SBUxMethod.changeGroupAttr('group'+i,'disabled','true');
			//그룹 초기화
			SBUxMethod.clearGroupData('group'+i);

			SBUxMethod.attr('dtl-inp-spcfctCnt'+i,'disabled','true');
			SBUxMethod.attr('dtl-inp-spcfctGrp'+i,'disabled','true');
			SBUxMethod.attr('dtl-inp-spcfctGrd'+i,'disabled','true');

			SBUxMethod.set('dtl-inp-spcfctCnt'+i,null);
			SBUxMethod.set('dtl-inp-spcfctGrp'+i,null);
			SBUxMethod.set('dtl-inp-spcfctGrd'+i,null);

			// 활성화
			const itemChk = SBUxMethod.get('dtl-inp-itemChk'+i);
			if (_.isEqual(itemChk,"Y")) {
				SBUxMethod.changeGroupAttr('group' + i, 'disabled', 'false');
				SBUxMethod.attr('dtl-inp-spcfctCnt' + i, 'disabled', 'false');
				SBUxMethod.attr('dtl-inp-spcfctGrp' + i, 'disabled', 'false');
				SBUxMethod.attr('dtl-inp-spcfctGrd' + i, 'disabled', 'false');
			}
		}

		jsonPrevData.forEach(item =>{
			const sn = item.sn;
			const itemChk = SBUxMethod.get('dtl-inp-itemChk'+sn);
			const itemCd = SBUxMethod.get('dtl-inp-itemCd'+sn);
			if (_.isEqual(itemChk,"Y") && _.isEqual(itemCd, item.itemCd) ) {

				// 입고
				SBUxMethod.set('dtl-rdo-wbg' + sn, item.wbg);
				SBUxMethod.set('dtl-rdo-wrhsBrQr' + sn, item.wrhsBrQr);
				SBUxMethod.set('dtl-rdo-kskTblt' + sn, item.kskTblt);

				// 선별
				SBUxMethod.set('dtl-rdo-dptz' + sn, item.dptz);
				SBUxMethod.set('dtl-rdo-apm' + sn, item.apm);
				SBUxMethod.set('dtl-rdo-elctrnWghtSortMchn' + sn, item.elctrnWghtSortMchn);
				SBUxMethod.set('dtl-rdo-ndstBrckSortMchn' + sn, item.ndstBrckSortMchn);
				SBUxMethod.set('dtl-rdo-grdRawMtrAtmtcTrnsfMchn' + sn, item.grdRawMtrAtmtcTrnsfMchn);
				SBUxMethod.set('dtl-rdo-dshbrd' + sn, item.dshbrd);

				//포장
				SBUxMethod.set('dtl-rdo-emptBxAtmtcExhstMchn' + sn, item.emptBxAtmtcExhstMchn);
				SBUxMethod.set('dtl-rdo-atmtcBxPckgMchn' + sn, item.atmtcBxPckgMchn);
				SBUxMethod.set('dtl-rdo-atmtcSsMchn' + sn, item.atmtcSsMchn);
				SBUxMethod.set('dtl-rdo-atmtcWrapMchn' + sn, item.atmtcWrapMchn);
				SBUxMethod.set('dtl-rdo-atmtcWghtChckMchn' + sn, item.atmtcWghtChckMchn);

				// 출고
				SBUxMethod.set('dtl-rdo-ptz' + sn, item.ptz);
				SBUxMethod.set('dtl-rdo-spmtBrQr' + sn, item.spmtBrQr);

				// 저장
				SBUxMethod.set('dtl-rdo-thAc' + sn, item.thAc);

				// 설비
				SBUxMethod.set('dtl-inp-spcfctCnt' + sn, item.spcfctCnt);
				SBUxMethod.set('dtl-inp-spcfctGrp' + sn, item.spcfctGrp);
				SBUxMethod.set('dtl-inp-spcfctGrd' + sn, item.spcfctGrd);
			}
		});
	}
</script>
</html>