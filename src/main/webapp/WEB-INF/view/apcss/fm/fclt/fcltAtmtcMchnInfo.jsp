<%
 /**
  * @Class Name : fcltAtmtcMchnInfo.jsp
  * @Description : 스마트자동화 화면
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
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-primary" onclick="fn_search"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
			</div>
		</div>
		<!-- apc리스트 -->
		<div class="box-body">
			<!--[pp] 검색 -->
			<table class="table table-bordered tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 7%">
					<col style="width: 6%">
					<col style="width: 2%">
					<col style="width: 5%">
					<col style="width: 2%">

					<col style="width: 7%">
					<col style="width: 4%">
					<col style="width: 2%">
					<col style="width: 3%">
					<col style="width: 3%">
					<col style="width: 3%">

					<col style="width: 7%">
					<col style="width: 6%">
					<col style="width: 3%">
					<col style="width: 3%">
					<col style="width: 3%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="th_bg">년도</th>
						<td colspan="2" class="td_input" style="border-right:hidden;">
							<sbux-spinner
									id="srch-inp-crtrYr"
									name="srch-inp-crtrYr"
									uitype="normal"
									step-value="1"
								></sbux-spinner>
						</td>
						<td colspan="2" style="border-right: hidden;">&nbsp;</td>
						<th scope="row" class="th_bg">시도</th>
						<td colspan="3" class="td_input" style="border-right:hidden;">
							<sbux-select
								id="srch-inp-ctpv"
								name="srch-inp-ctpv"
								uitype="single"
								jsondata-ref="jsonComCtpv"
								unselected-text="전체"
								class="form-control input-sm"
								onchange="fn_ctpvChange"
							></sbux-select>
						</td>
						<td colspan="2" class="td_input" style="border-right: hidden;">
						</td>
						<th scope="row" class="th_bg">시군구</th>
						<td colspan="2" class="td_input" style="border-right: hidden;">
							<sbux-select
								id="srch-inp-sgg"
								name="srch-inp-sgg"
								uitype="single"
								jsondata-ref="jsonComSgg"
								unselected-text="전체"
								class="form-control input-sm"
								filter-source-name="srch-inp-ctpv"
								jsondata-filter="mastervalue"
							></sbux-select>
						</td>
						<td colspan="" class="td_input" style="border-right: hidden;">
						</td>
					</tr>
					<tr>
						<th scope="row" class="th_bg">APC명</th>
						<td colspan="2" class="td_input" style="border-right:hidden;">
							<sbux-input
								uitype="text"
								id="srch-inp-apcNm"
								name="srch-inp-apcNm"
								class="form-control input-sm srch-keyup-area"
								autocomplete="off"
							></sbux-input>
						</td>
						<td colspan="2" style="border-right: hidden;">&nbsp;</td>
						<th scope="row" class="th_bg">품목명</th>
						<td colspan="3" class="td_input" style="border-right:hidden;">
							<sbux-input
								uitype="text"
								id="srch-inp-itemNm"
								name="srch-inp-itemNm"
								class="form-control input-sm srch-keyup-area"
								autocomplete="off"
							></sbux-input>
						</td>
						<td colspan="2" class="td_input" style="border-right: hidden;">
						</td>
						<th scope="row" class="th_bg">부류</th>
						<td colspan="2" class="td_input" style="border-right: hidden;">
							<sbux-select
								id="srch-inp-srchLclsfCd"
								name="srch-inp-srchLclsfCd"
								uitype="single"
								jsondata-ref="jsonComSrchLclsfCd"
								unselected-text="전체"
								class="form-control input-sm"
							></sbux-select>
						</td>
						<td colspan="" class="td_input" style="border-right: hidden;">
						</td>
					</tr>
				</tbody>
			</table>
			<!--[pp] //검색 -->
			<div class="ad_section_top">
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">▶검색리스트</span>
							<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
						</li>
					</ul>
				</div>
				<!-- SBGrid를 호출합니다. -->
				<div id="sb-area-grdFcltApcInfo" style="height:350px; width: 100%;"></div>
			</div>
		</div>
		<div class="box-body">
			<sbux-input uitype="hidden" id="dtl-inp-apcCd" name="dtl-inp-apcCd"></sbux-input>
			<sbux-input uitype="hidden" id="dtl-inp-crtrYr" name="dtl-inp-crtrYr"></sbux-input>
			<!--[pp] 검색 -->
			<div><label>스마트자동화 상세내역</label></div>
			<div>
					<table class="table table-bordered tbl_row tbl_fixed" style="width: 640px">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 32%">
							<col style="width: 15%">
							<col style="width: 15%">
							<col style="width: 15%">
						</colgroup>
						<tbody>
							<tr>
								<th rowspan="2" style="border-right: 1px solid white !important; text-align: center;">설비</th>
								<th style="border-right: 1px solid white !important; text-align: center;">품목1</th>
								<th style="border-right: 1px solid white !important; text-align: center;">품목2</th>
								<th style="border-right: 1px solid white !important; text-align: center;">품목3</th>
							</tr>
							<tr>
								<th style="border-right: 1px solid white !important; text-align: center;">
									<sbux-button id="srch-btn-allItem1" name="srch-btn-allItem1" uitype="normal" onclick="fn_allSel(1)" text="전체 미설치" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</th>
								<th style="border-right: 1px solid white !important; text-align: center;">
									<sbux-button id="srch-btn-allItem2" name="srch-btn-allItem2" uitype="normal" onclick="fn_allSel(2)" text="전체 미설치" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</th>
								<th style="border-right: 1px solid white !important; text-align: center;">
									<sbux-button id="srch-btn-allItem3" name="srch-btn-allItem3" uitype="normal" onclick="fn_allSel(3)" text="전체 미설치" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
								</th>
							</tr>
							<tr>
								<th>(입고)계근대</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wbg1_1" name="dtl-rdo-wbg1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wbg1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wbg1_2" name="dtl-rdo-wbg1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wbg1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wbg2_1" name="dtl-rdo-wbg2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wbg2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wbg2_2" name="dtl-rdo-wbg2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wbg2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wbg3_1" name="dtl-rdo-wbg3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wbg3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wbg3_2" name="dtl-rdo-wbg3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wbg3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>(입고)바코드 /QR 시스템</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsBrQr1_1" name="dtl-rdo-wrhsBrQr1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsBrQr1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsBrQr1_2" name="dtl-rdo-wrhsBrQr1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsBrQr1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsBrQr2_1" name="dtl-rdo-wrhsBrQr2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsBrQr2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsBrQr2_2" name="dtl-rdo-wrhsBrQr2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsBrQr2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsBrQr3_1" name="dtl-rdo-wrhsBrQr3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsBrQr3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsBrQr3_2" name="dtl-rdo-wrhsBrQr3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsBrQr3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>(입고)키오스크·태블릿</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-kskTblt1_1" name="dtl-rdo-kskTblt1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-kskTblt1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-kskTblt1_2" name="dtl-rdo-kskTblt1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-kskTblt1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-kskTblt2_1" name="dtl-rdo-kskTblt2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-kskTblt2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-kskTblt2_2" name="dtl-rdo-kskTblt2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-kskTblt2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-kskTblt3_1" name="dtl-rdo-kskTblt3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-kskTblt3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-kskTblt3_2" name="dtl-rdo-kskTblt3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-kskTblt3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>(선별)디팔렛타이저</th>
								<td>
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
								<th>(선별)자동덤핑기</th>
								<td>
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
								<th>(선별)전자식 중량 선별기</th>
								<td>
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
								<th>(선별)비파괴 당도 선별기</th>
								<td>
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
								<th>(선별)등급별 원물 자동 이송 장치</th>
								<td>
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
								<th>(선별)전자식 대시보드(모니터)</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dshbrd1_1" name="dtl-rdo-dshbrd1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dshbrd1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dshbrd1_2" name="dtl-rdo-dshbrd1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dshbrd1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dshbrd2_1" name="dtl-rdo-dshbrd2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dshbrd2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dshbrd2_2" name="dtl-rdo-dshbrd2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dshbrd2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dshbrd3_1" name="dtl-rdo-dshbrd3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dshbrd3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-dshbrd3_2" name="dtl-rdo-dshbrd3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-dshbrd3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>(포장)공박스(망․톤백 등) 자동 배출 장치</th>
								<td>
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
								<th>(포장)자동 박스(망․톤백 등) 포장기</th>
								<td>
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
								<th>(포장)자동 소포장기</th>
								<td>
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
								<th>(포장)자동랩핑기</th>
								<td>
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
								<th>(포장)자동 중량체크기(포장 시)</th>
								<td>
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
								<th>(출고)팔렛타이저(로봇팔 등)</th>
								<td>
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
							<tr>
								<th>(출고) 바코드 /QR 시스템</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtBrQr1_1" name="dtl-rdo-spmtBrQr1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtBrQr1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtBrQr1_2" name="dtl-rdo-spmtBrQr1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtBrQr1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtBrQr2_1" name="dtl-rdo-spmtBrQr2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtBrQr2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtBrQr2_2" name="dtl-rdo-spmtBrQr2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtBrQr2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtBrQr3_1" name="dtl-rdo-spmtBrQr3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtBrQr3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtBrQr3_2" name="dtl-rdo-spmtBrQr3" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtBrQr3_2">미설치</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>(저장) 온습도 자동제어기</th>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-thAc1_1" name="dtl-rdo-thAc1" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-thAc1_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-thAc1_2" name="dtl-rdo-thAc1" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-thAc1_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-thAc2_1" name="dtl-rdo-thAc2" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-thAc2_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-thAc2_2" name="dtl-rdo-thAc2" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-thAc2_2">미설치</label>
									</p>
								</td>
								<td>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-thAc3_1" name="dtl-rdo-thAc3" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-thAc3_1">설치</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-thAc3_2" name="dtl-rdo-thAc3" uitype="normal" value="2" class="radio_label"></sbux-radio>
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
								<th colspan="6" style="border-right: 1px solid white !important; text-align: center;">품목1</th>
								<th colspan="6" style="border-right: 1px solid white !important; text-align: center;">품목2</th>
								<th colspan="6" style="border-right: 1px solid white !important; text-align: center;">품목3</th>
							</tr>
							<tr>
								<th>규격<br>(예시: 2대x1조 32등급)</th>

								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input id="dtl-inp-spcfctCnt1" name="dtl-inp-spcfctCnt1" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									대
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input id="dtl-inp-spcfctGrp1" name="dtl-inp-spcfctGrp1" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									조
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input id="dtl-inp-spcfctGrd1" name="dtl-inp-spcfctGrd1" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td>등급</td>

								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input id="dtl-inp-spcfctCnt2" name="dtl-inp-spcfctCnt2" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									대
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input id="dtl-inp-spcfctGrp2" name="dtl-inp-spcfctGrp2" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									조
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input id="dtl-inp-spcfctGrd2" name="dtl-inp-spcfctGrd2" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td>등급</td>

								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input id="dtl-inp-spcfctCnt3" name="dtl-inp-spcfctCnt3" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									대
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input id="dtl-inp-spcfctGrp3" name="dtl-inp-spcfctGrp3" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									조
								</td>
								<td style="border-right:hidden; padding-right: 0px !important;">
									<sbux-input id="dtl-inp-spcfctGrd3" name="dtl-inp-spcfctGrd3" uitype="text" class="form-control input-sm"></sbux-input>
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
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button id="btnSave1" name="btnSave1" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				</div>
			</div>
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
		//SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		fn_init();

	});

	/* 초기세팅 */
	const fn_init = async function() {
		await fn_initSBSelect();
		await fn_fcltApcInfoCreateGrid();

		await fn_search();

	}

	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군구

	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			gfn_setComCdSBSelect('srch-inp-ctpv', 	jsonComCtpv, 	'UNTY_CTPV'), 	//시도
			gfn_setComCdSBSelect('srch-inp-sgg', 	jsonComSgg, 	'UNTY_SGG'), 	//시군구
		]);
	}

	const fn_selectAtMcIfList = async function(copy_chk) {
		 console.log("******************fn_pagingAtMcIfList**********************************");

		let apcCd = SBUxMethod.get("dtl-inp-apcCd");
		let crtrYr = SBUxMethod.get("dtl-inp-crtrYr");

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

				SBUxMethod.set('dtl-inp-rprsItemSpcfct',item.rprsItemSpcfct);
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
					crtrYr : SBUxMethod.get('dtl-inp-crtrYr')
					,apcCd : SBUxMethod.get('dtl-inp-apcCd')
					,sn : i
					, prgrsYn : 'N' //진척도 갱신 여부
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

	/*
	 * APC 리스트 추가
	 */

	var jsonFcltApcInfo = []; // 그리드의 참조 데이터 주소 선언
	var grdFcltApcInfo;


	const objMenuList01 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld01,			//콜백함수명
			}
		};


	function fn_excelDwnld01() {
		grdFcltApcInfo.exportLocalExcel("시설설치보완", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* Grid 화면 그리기 기능*/
	//apc 리스트
	const fn_fcltApcInfoCreateGrid = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdFcltApcInfo';
		SBGridProperties.id = 'grdFcltApcInfo';
		SBGridProperties.jsonref = 'jsonFcltApcInfo';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
		//SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
		//SBGridProperties.fixedrowheight=45;
		SBGridProperties.rowheader="seq";
		SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
			};
		SBGridProperties.columns = [
			{caption: ["APC명"],		ref: 'apcNm',		type:'input',  width:'200px',    style:'text-align:center'},
			{caption: ["대표품목1"],	ref: 'itemNm1',		type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["대표품목2"],	ref: 'itemNm2',		type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["대표품목3"],	ref: 'itemNm3',		type:'input',  width:'100px',    style:'text-align:center'},

			{caption: ["시도"],	ref: 'ctpvNm',		type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["시군구"],	ref: 'sigunNm',		type:'input',  width:'100px',    style:'text-align:center'},

			{caption: ["시도"],		ref: 'ctpvCd',		hidden : true},
			{caption: ["시군구"],		ref: 'sigunCd',		hidden : true},

			{caption: ["대표품목1"],		ref: 'itemCd1',		hidden : true},
			{caption: ["대표품목2"],		ref: 'itemCd2',		hidden : true},
			{caption: ["대표품목3"],		ref: 'itemCd3',		hidden : true},

			{caption: ["apcCd"],	ref: 'apcCd',	hidden : true},
			{caption: ["crtrYr"],	ref: 'crtrYr',	hidden : true},
		];

		grdFcltApcInfo = _SBGrid.create(SBGridProperties);

		//클릭 이벤트 바인드
		grdFcltApcInfo.bind('click','fn_view');
		grdFcltApcInfo.bind('beforepagechanged', 'fn_pagingBbsList');

	}

	const fn_pagingBbsList = async function() {
		let recordCountPerPage = grdFcltApcInfo.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdFcltApcInfo.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		fn_searchApcList(recordCountPerPage, currentPageNo);
	}

	/**
     * 목록 조회
     */
	const fn_search = async function() {
		//console.log("fn_search");
		// set pagination
		let pageSize = grdFcltApcInfo.getPageSize();
		let pageNo = 1;
		//입력폼 초기화
		//fn_clearForm();

		fn_searchApcList(pageSize, pageNo);
	}

	const fn_searchApcList = async function(pageSize, pageNo) {
		console.log("******************fn_setGrdFcltInstlInfoList**********************************");

		//let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let apcNm = SBUxMethod.get("srch-inp-apcNm");//
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");
		let ctpvCd = SBUxMethod.get("srch-inp-ctpv");//
		let sigunCd = SBUxMethod.get("srch-inp-sgg");//

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectApcList.do", {
			//apcCd: apcCd,
			apcNm: apcNm,
			crtrYr: crtrYr,
			ctpvCd: ctpvCd,
			sigunCd: sigunCd,

			// pagination
			pagingYn : 'Y',
			currentPageNo : pageNo,
			recordCountPerPage : pageSize
		});
		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			jsonFcltApcInfo.length = 0;
			let totalRecordCount = 0;
			data.resultList.forEach((item, index) => {
				//console.log(item);
				let itemVO = {
						apcCd			:item.apcCd
						,apcNm			:item.apcNm
						,crtrYr			:item.crtrYr

						,itemCd1		:item.itemCd1
						,itemNm1		:item.itemNm1
						,itemCd2		:item.itemCd2
						,itemNm2		:item.itemNm2
						,itemCd3		:item.itemCd3
						,itemNm3		:item.itemNm3

						,ctpvCd			:item.ctpvCd
						,ctpvNm			:item.ctpvNm
						,sigunCd		:item.sigunCd
						,sigunNm		:item.sigunNm
				}
				jsonFcltApcInfo.push(itemVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonFcltApcInfo.length > 0) {

				if(grdFcltApcInfo.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdFcltApcInfo.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdFcltApcInfo.rebuild();
				}else{
					grdFcltApcInfo.refresh()
				}
			} else {
				grdFcltApcInfo.setPageTotalCount(totalRecordCount);
				grdFcltApcInfo.rebuild();
			}
			document.querySelector('#listApcCount').innerText = totalRecordCount;

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			//console.error("failed", e.message);
		}
	}

	//그리드 클릭시 상세보기 이벤트
	const fn_view = async function (){
		console.log("******************fn_view**********************************");
		//fn_clearForm();
		//데이터가 존재하는 그리드 범위 확인
		var nCol = grdFcltApcInfo.getCol();
		if (nCol < 1) {
			return;
		}
		var nRow = grdFcltApcInfo.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}

		//서치폼에서 클릭시 디테일폼에 데이터출력
		let rowData = grdFcltApcInfo.getRowData(nRow);

		SBUxMethod.set('dtl-inp-apcCd',gfn_nvl(rowData.apcCd));
		SBUxMethod.set('dtl-inp-apcNm',gfn_nvl(rowData.apcNm));
		SBUxMethod.set('dtl-inp-crtrYr',gfn_nvl(rowData.crtrYr));
		//console.log(SBUxMethod.get('dtl-inp-apcCd'));
		//console.log(SBUxMethod.get('dtl-inp-crtrYr'));

		fn_selectAtMcIfList();
	}

	//시도 변경 이벤트
	const fn_ctpvChange = async function(){
		SBUxMethod.set("srch-inp-sgg", "");
	}
</script>
</html>