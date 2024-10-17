<%
 /**
  * @Class Name : fcltPrcsNtslInfo.jsp
  * @Description : 5.3 산지유통시설처리상품주요판매처 화면
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
		<div class="box box-solid" style="height: 100vh">
			<div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background-color: white; z-index: 99" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 산지유통판매처 -->
			</div>
			<div style="margin-left: auto;">
				<!--
				-->
				<sbux-button id="btnRowData" name="btnRowData" uitype="normal" text="로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect"></sbux-button>
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
						<th scope="row" class="th_bg">조사연도</th>
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
								onkeyenter="fn_selectEnterKey"
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
								onkeyenter="fn_selectEnterKey"
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
			<div style="display: flex;">
				<div>
					<label style="font-weight: bold;">◦처리실적 총취급액</label>
					<br>
					<label> - 총취급액은 '5.1 유통조직 처리실적' , '5.2 APC 처리실적' 메뉴의 총취급액 데이터</label><br>
				</div>
				<div style="margin-left:auto; font-size: x-small;">
					<span style="position: relative; bottom: -24px;">(금액: 백만원)</span>
				</div>
			</div>
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>품목별 총취급액</caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 60px">
						<col style="width: 20%">
						<col style="width: 60px">
						<col style="width: 20%">
						<col style="width: 60px">
						<col style="width: 20%">
						<col style="width: 60px">
						<col style="width: 20%">
						<col style="width: 60px">
						<col style="width: 20%">
					</colgroup>
					<tbody>
						<tr>
							<th style="border-right: 1px solid white !important;"></th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;"><span id="itemNm1">품목1</span></th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;"><span id="itemNm2">품목2</span></th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;"><span id="itemNm3">품목3</span></th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;"><span id="itemNm4">기타</span></th>
							<th class="text-center" colspan="3">계</th>
						</tr>
						<tr>
							<th>유통조직 처리실적</th>
							<td style="border-right:hidden; padding-right: 0px !important;">
								<sbux-input
									id="dtl-inp-rtlOgnzTotTrmtAmt1"
									name="dtl-inp-rtlOgnzTotTrmtAmt1"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									readonly
								></sbux-input>
							</td>
							<td>(백만원)</td>
							<td style="border-right:hidden; padding-right: 0px !important;">
								<sbux-input
									id="dtl-inp-rtlOgnzTotTrmtAmt2"
									name="dtl-inp-rtlOgnzTotTrmtAmt2"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									readonly
								></sbux-input>
							</td>
							<td>(백만원)</td>
							<td style="border-right:hidden; padding-right: 0px !important;">
								<sbux-input
									id="dtl-inp-rtlOgnzTotTrmtAmt3"
									name="dtl-inp-rtlOgnzTotTrmtAmt3"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									readonly
								></sbux-input>
							</td>
							<td>(백만원)</td>
							<td style="border-right:hidden; padding-right: 0px !important;">
								<sbux-input
									id="dtl-inp-rtlOgnzTotTrmtAmt4"
									name="dtl-inp-rtlOgnzTotTrmtAmt4"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									readonly
								></sbux-input>
							</td>
							<td>(백만원)</td>
							<td style="border-right:hidden; padding-right: 0px !important;">
								<sbux-input
									id="dtl-inp-rtlOgnzTotTrmtAmtTot"
									name="dtl-inp-rtlOgnzTotTrmtAmtTot"
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
									id="dtl-inp-rtlOgnzTotTrmtAmtTot1"
									name="dtl-inp-rtlOgnzTotTrmtAmtTot1"
									uitype="text"
									class="form-control input-sm"
									style="text-align: right"
									placeholder="자동계산"
									readonly
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th style="border-right: 1px solid white !important;"></th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;"><span id="apcItemNm1">품목1</span></th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;"><span id="apcItemNm2">품목2</span></th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;"><span id="apcItemNm3">품목3</span></th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;"><span id="apcItemNm4">기타</span></th>
							<th class="text-center" colspan="3">계</th>
						</tr>
						<tr>
							<th>APC 처리실적</th>
							<td style="border-right:hidden; padding-right: 0px !important;">
								<sbux-input
									id="dtl-inp-apcTrmtAmt1"
									name="dtl-inp-apcTrmtAmt1"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									readonly
								></sbux-input>
							</td>
							<td>(백만원)</td>
							<td style="border-right:hidden; padding-right: 0px !important;">
								<sbux-input
									id="dtl-inp-apcTrmtAmt2"
									name="dtl-inp-apcTrmtAmt2"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									readonly
								></sbux-input>
							</td>
							<td>(백만원)</td>
							<td style="border-right:hidden; padding-right: 0px !important;">
								<sbux-input
									id="dtl-inp-apcTrmtAmt3"
									name="dtl-inp-apcTrmtAmt3"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									readonly
								></sbux-input>
							</td>
							<td>(백만원)</td>
							<td style="border-right:hidden; padding-right: 0px !important;">
								<sbux-input
									id="dtl-inp-apcTrmtAmt4"
									name="dtl-inp-apcTrmtAmt4"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
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
									id="dtl-inp-apcTrmtAmtTot1"
									name="dtl-inp-apcTrmtAmtTot1"
									uitype="text"
									class="form-control input-sm"
									style="text-align: right"
									placeholder="자동계산"
									readonly
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<br>
			<div style="display: flex;">
				<div>
					<label style="font-weight: bold;">○산지유통판매처 상세내역(산지유통시설 처리상품 주요 판매처)</label><br>
					<label> - 출자·출하조직은 생산유통통합조직 통해서 판매한 실적 및 직접 판매한 실적을 합산하여 기재.</label><br>
					<label> - 기타항목은 다른 유통조직에 판매한 금액</label><br>
					<label>* 데이터 입력 시 조사연도의 직전년도 기준으로 작성해주시기 바랍니다.</label>
				</div>
				<div style="margin-left:auto; font-size: x-small;">
					<span style="position: relative; bottom: -64px;">(금액: 백만원)</span>
				</div>
			</div>
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>APC 처리상품 주요판매처</caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 60px">
						<col style="width: 20%">
						<col style="width: 60px">
						<col style="width: 20%">
						<col style="width: 60px">
						<col style="width: 20%">
						<col style="width: 60px">
						<col style="width: 20%">
						<col style="width: 60px">
						<col style="width: 20%">
						<col style="width: 60px">
					</colgroup>
					<tbody>
						<tr>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;">대형유통업체(백화점 포함)</th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;">식자재업체<br>(학교급식, 가공업체 포함)</th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;">도매시장<br>(공판장 포함)</th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;">aT온라인 도매시장</th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;">소매업체 직판</th>
							<th class="text-center" colspan="2">계</th>
						</tr>
						<tr>
							<td style="border-right:hidden; padding-right: 0px !important;">
								<sbux-input
									id="dtl-inp-apcNtslAmtLgszRtl"
									name="dtl-inp-apcNtslAmtLgszRtl"
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
									id="dtl-inp-apcNtslAmtFoodMtrl"
									name="dtl-inp-apcNtslAmtFoodMtrl"
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
									id="dtl-inp-apcNtslAmtWhlslMrkt"
									name="dtl-inp-apcNtslAmtWhlslMrkt"
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
									id="dtl-inp-apcNtslAmtOnlnWhlslMrkt"
									name="dtl-inp-apcNtslAmtOnlnWhlslMrkt"
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
									id="dtl-inp-apcNtslAmtBzenty"
									name="dtl-inp-apcNtslAmtBzenty"
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
									id="dtl-inp-apcNtslAmtTot"
									name="dtl-inp-apcNtslAmtTot"
									uitype="text"
									class="form-control input-sm"
									placeholder="자동계산"
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									readonly
								></sbux-input>
							</td>
							<td>(백만원)</td>
						</tr>
						<tr>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;">수출</th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;">홈쇼핑(TV매체)</th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;">온라인(B2B)</th>
							<th class="text-center" colspan="2" style="border-right: 1px solid white !important;">온라인(B2C)</th>
							<th class="text-center" colspan="2">기타</th>
							<td colspan="2" style="border-top: hidden !important;">
								<sbux-input
									id="dtl-inp-apcNtslAmtTot1"
									name="dtl-inp-apcNtslAmtTot1"
									uitype="text"
									class="form-control input-sm"
									style="text-align: right"
									placeholder="자동계산"
									readonly
								></sbux-input>
							</td>
						</tr>
						<tr>
							<td style="border-right:hidden; padding-right: 0px !important;">
								<sbux-input
									id="dtl-inp-apcNtslAmtExprt"
									name="dtl-inp-apcNtslAmtExprt"
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
									id="dtl-inp-apcNtslAmtHmsp"
									name="dtl-inp-apcNtslAmtHmsp"
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
									id="dtl-inp-apcNtslAmtOnlnB2b"
									name="dtl-inp-apcNtslAmtOnlnB2b"
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
									id="dtl-inp-apcNtslAmtOnlnB2c"
									name="dtl-inp-apcNtslAmtOnlnB2c"
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
									id="dtl-inp-apcNtslAmtEtc"
									name="dtl-inp-apcNtslAmtEtc"
									uitype="text"
									class="form-control input-sm"
									placeholder=""
									mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
									onkeyup="fn_cal(this)"
								></sbux-input>
							</td>
							<td>(백만원)</td>
							<td colspan="2" style="border-top: hidden !important;">
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!--[pp] //검색결과 -->
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div style="margin-left: auto;">
				<sbux-button id="btnInsert1" name="btnInsert1" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
			</div>
		</div>
		<div id="sb-area-hiddenGrd" style="height:400px; width: 100%; display: none;"></div>
	</div>
	</section>
	<!-- apc 선택 Modal -->
	<div>
		<sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:1000px"></sbux-modal>
	</div>
	<div id="body-modal-apcSelect">
		<jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/apcSelectPopup.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">

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
		let apcCd = '0861';
		let crtrYr = '2024';
		//let apcNm = 'test';
		//SBUxMethod.set("srch-inp-apcCd", apcCd);
		//SBUxMethod.set("srch-inp-crtrYr", crtrYr);
		//SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		<c:if test="${loginVO.userType eq '27' || loginVO.userType eq '28'}">
		//지자체인경우 올해만 볼수 있게 수정
		SBUxMethod.attr('srch-inp-crtrYr', 'readonly', 'true')
		</c:if>

		fn_init();

	});

	function fn_selectEnterKey() {
		if(window.event.keyCode == 13) {
			fn_search();
		}
	}

	/* 초기세팅 */
	const fn_init = async function() {
		await fn_initSBSelect();
		await fn_fcltApcInfoCreateGrid();

		await fn_search();

	}

	var jsonComCtpv = [];//시도
	var jsonComSgg = [];//시군구
	var jsonComSrchLclsfCd = [];//조회용 부류

	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			gfn_setComCdSBSelect('srch-inp-ctpv', 	jsonComCtpv, 	'UNTY_CTPV'), 	//시도
			gfn_setComCdSBSelect('srch-inp-sgg', 	jsonComSgg, 	'UNTY_SGG'), 	//시군구
			gfn_setComCdSBSelect('srch-inp-srchLclsfCd', 	jsonComSrchLclsfCd, 	'SRCH_LCLSF_CD'), 	//조회용 부류
		]);
	}

	//입력폼 초기화
	const fn_clearForm = async function() {
		$('#itemNm1').text("품목1");
		$('#itemNm2').text("품목2");
		$('#itemNm3').text("품목3");
		$('#itemNm4').text("기타");

		$('#apcItemNm1').text("품목1");
		$('#apcItemNm2').text("품목2");
		$('#apcItemNm3').text("품목3");
		$('#apcItemNm4').text("기타");

		SBUxMethod.set('dtl-inp-apcNtslAmtLgszRtl',null);
		SBUxMethod.set('dtl-inp-apcNtslAmtFoodMtrl',null);
		SBUxMethod.set('dtl-inp-apcNtslAmtWhlslMrkt',null);
		SBUxMethod.set('dtl-inp-apcNtslAmtBzenty',null);
		SBUxMethod.set('dtl-inp-apcNtslAmtExprt',null);

		SBUxMethod.set('dtl-inp-apcNtslAmtHmsp',null);
		SBUxMethod.set('dtl-inp-apcNtslAmtOnlnB2b',null);
		SBUxMethod.set('dtl-inp-apcNtslAmtOnlnB2c',null);
		SBUxMethod.set('dtl-inp-apcNtslAmtEtc',null);
		SBUxMethod.set('dtl-inp-apcNtslAmtOnlnWhlslMrkt',null);

		SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmt1',null);
		SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmt2',null);
		SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmt3',null);
		SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmt4',null);
		SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmtTot',null);
		SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmtTot1',null);

		SBUxMethod.set('dtl-inp-apcTrmtAmt1',null);
		SBUxMethod.set('dtl-inp-apcTrmtAmt2',null);
		SBUxMethod.set('dtl-inp-apcTrmtAmt3',null);
		SBUxMethod.set('dtl-inp-apcTrmtAmt4',null);
		SBUxMethod.set('dtl-inp-apcTrmtAmtTot',null);
		SBUxMethod.set('dtl-inp-apcTrmtAmtTot1',null);
	}

	const fn_selectItmPrfList = async function(copy_chk) {
		 console.log("******************fn_pagingItmPrfList**********************************");

		let apcCd = SBUxMethod.get("dtl-inp-apcCd");
		let crtrYr = SBUxMethod.get("dtl-inp-crtrYr");

		//전년도 데이터
		if(!gfn_isEmpty(copy_chk)){
			crtrYr = parseFloat(crtrYr) - parseFloat(copy_chk);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltPrcsNtslInfoList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr
		});

		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-inp-apcNtslAmtLgszRtl',item.apcNtslAmtLgszRtl);
				SBUxMethod.set('dtl-inp-apcNtslAmtFoodMtrl',item.apcNtslAmtFoodMtrl);
				SBUxMethod.set('dtl-inp-apcNtslAmtWhlslMrkt',item.apcNtslAmtWhlslMrkt);
				SBUxMethod.set('dtl-inp-apcNtslAmtBzenty',item.apcNtslAmtBzenty);
				SBUxMethod.set('dtl-inp-apcNtslAmtExprt',item.apcNtslAmtExprt);

				SBUxMethod.set('dtl-inp-apcNtslAmtHmsp',item.apcNtslAmtHmsp);
				SBUxMethod.set('dtl-inp-apcNtslAmtOnlnB2b',item.apcNtslAmtOnlnB2b);
				SBUxMethod.set('dtl-inp-apcNtslAmtOnlnB2c',item.apcNtslAmtOnlnB2c);
				SBUxMethod.set('dtl-inp-apcNtslAmtEtc',item.apcNtslAmtEtc);
				SBUxMethod.set('dtl-inp-apcNtslAmtOnlnWhlslMrkt',item.apcNtslAmtOnlnWhlslMrkt);

				SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmt1',item.rtlOgnzTotTrmtAmt1);
				SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmt2',item.rtlOgnzTotTrmtAmt2);
				SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmt3',item.rtlOgnzTotTrmtAmt3);
				SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmt4',item.rtlOgnzTotTrmtAmt4);
				SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmtTot',item.rtlOgnzTotTrmtAmtTot);
				SBUxMethod.set('dtl-inp-rtlOgnzTotTrmtAmtTot1',fn_numberToKorean(item.rtlOgnzTotTrmtAmtTot));

				SBUxMethod.set('dtl-inp-apcTrmtAmt1',item.apcTrmtAmt1);
				SBUxMethod.set('dtl-inp-apcTrmtAmt2',item.apcTrmtAmt2);
				SBUxMethod.set('dtl-inp-apcTrmtAmt3',item.apcTrmtAmt3);
				SBUxMethod.set('dtl-inp-apcTrmtAmt4',item.apcTrmtAmt4);
				SBUxMethod.set('dtl-inp-apcTrmtAmtTot',item.apcTrmtAmtTot);
				SBUxMethod.set('dtl-inp-apcTrmtAmtTot1',fn_numberToKorean(item.apcTrmtAmtTot));

				$('#itemNm1').text("품목1:"+gfn_nvl(item.itemNm1));
				$('#itemNm2').text("품목2:"+gfn_nvl(item.itemNm2));
				$('#itemNm3').text("품목3:"+gfn_nvl(item.itemNm3));
				$('#itemNm4').text("기타품목:"+gfn_nvl(item.itemNm4));

				$('#apcItemNm1').text("품목1:"+gfn_nvl(item.apcItemNm1));
				$('#apcItemNm2').text("품목2:"+gfn_nvl(item.apcItemNm2));
				$('#apcItemNm3').text("품목3:"+gfn_nvl(item.apcItemNm3));
				$('#apcItemNm4').text("기타품목:"+gfn_nvl(item.apcItemNm4));
			});
			fn_cal();

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
		let apcCd = SBUxMethod.get("dtl-inp-apcCd");
		let crtrYr = SBUxMethod.get("dtl-inp-crtrYr");
		if (gfn_isEmpty(apcCd)) {
			alert("apc를 선택해주세요");
			return;
		}
		if (gfn_isEmpty(crtrYr)) {
			alert("조사연도를 작성해주세요");
			return;
		}

		fn_subInsert(confirm("등록 하시겠습니까?"));
	}


	//신규 등록
	const fn_subInsert = async function (isConfirmed){
		 console.log("******************fn_subInsert**********************************");
		 if (!isConfirmed) return;

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltPrcsNtslInfo.do", {
			crtrYr : SBUxMethod.get('dtl-inp-crtrYr')
			,apcCd : SBUxMethod.get('dtl-inp-apcCd')
			,prgrsYn : 'N' //진척도 갱신 여부
			,apcNtslAmtLgszRtl : SBUxMethod.get('dtl-inp-apcNtslAmtLgszRtl')
			,apcNtslAmtFoodMtrl : SBUxMethod.get('dtl-inp-apcNtslAmtFoodMtrl')
			,apcNtslAmtWhlslMrkt : SBUxMethod.get('dtl-inp-apcNtslAmtWhlslMrkt')
			,apcNtslAmtBzenty : SBUxMethod.get('dtl-inp-apcNtslAmtBzenty')
			,apcNtslAmtExprt : SBUxMethod.get('dtl-inp-apcNtslAmtExprt')
			,apcNtslAmtHmsp : SBUxMethod.get('dtl-inp-apcNtslAmtHmsp')
			,apcNtslAmtOnlnB2b : SBUxMethod.get('dtl-inp-apcNtslAmtOnlnB2b')
			,apcNtslAmtOnlnB2c : SBUxMethod.get('dtl-inp-apcNtslAmtOnlnB2c')
			,apcNtslAmtEtc : SBUxMethod.get('dtl-inp-apcNtslAmtEtc')
			,apcNtslAmtOnlnWhlslMrkt : SBUxMethod.get('dtl-inp-apcNtslAmtOnlnWhlslMrkt')
		});

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


	//자동계산
	function fn_cal(e){
		if(!gfn_isEmpty(e)){
			//extractNumbers2(e.name);
		}

		let sum = convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcNtslAmtLgszRtl'))
					+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcNtslAmtFoodMtrl'))
					+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcNtslAmtWhlslMrkt'))
					+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcNtslAmtOnlnWhlslMrkt'))
					+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcNtslAmtBzenty'))
					+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcNtslAmtExprt'))

					+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcNtslAmtHmsp'))
					+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcNtslAmtOnlnB2b'))
					+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcNtslAmtOnlnB2c'))
					+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcNtslAmtEtc'));
		SBUxMethod.set('dtl-inp-apcNtslAmtTot',sum);
		SBUxMethod.set('dtl-inp-apcNtslAmtTot1',fn_numberToKorean(sum));

	}


	// 숫자(소숫점 가능)만 입력
	function extractNumbers2(input) {
		let inputValue = SBUxMethod.get(input);
		if(!inputValue === null || !inputValue === undefined || !inputValue === ''){
			SBUxMethod.set(input,inputValue.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'));
		}
	}
    // 숫자만 입력
	function extractNumbers(input) {
		//document.querySelector("sbux-input[name='"+input+"']").value = document.querySelector("sbux-input[name='"+input+"']").value.replace(/\D/g, "");
		let inputValue = SBUxMethod.get(input);
		if(!inputValue === null || !inputValue === undefined || !inputValue === ''){
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
		SBGridProperties.explorerbar = 'sort';
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

			{caption: ["담당자명"],	ref: 'picNm',		type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["직위"],	ref: 'jbps',		type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["연락처"],	ref: 'coTelno',		type:'input',  width:'100px',    style:'text-align:center'},

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
		fn_clearForm();

		fn_searchApcList(pageSize, pageNo);
	}

	const fn_searchApcList = async function(pageSize, pageNo) {
		console.log("******************fn_setGrdFcltInstlInfoList**********************************");

		//let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let apcNm = SBUxMethod.get("srch-inp-apcNm");//
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");
		let ctpvCd = SBUxMethod.get("srch-inp-ctpv");//
		let sigunCd = SBUxMethod.get("srch-inp-sgg");//
		let itemNm = SBUxMethod.get("srch-inp-itemNm");//
		let srchLclsfCd = SBUxMethod.get("srch-inp-srchLclsfCd");//

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectApcList.do", {
			//apcCd: apcCd,
			apcNm: apcNm,
			crtrYr: crtrYr,
			ctpvCd: ctpvCd,
			sigunCd: sigunCd,
			itemNm: itemNm,
			srchLclsfCd: srchLclsfCd,

			// pagination
			//pagingYn : 'Y',
			//currentPageNo : pageNo,
			//recordCountPerPage : pageSize
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

						,coTelno		:item.coTelno
						,jbps			:item.jbps
						,picNm			:item.picNm
				}
				jsonFcltApcInfo.push(itemVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});
			//페이징 처리가 빠진경우
			if(totalRecordCount < data.resultList.length){
				totalRecordCount = data.resultList.length;
			}

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
		fn_clearForm();
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
		console.log(SBUxMethod.get('dtl-inp-apcCd'));
		console.log(SBUxMethod.get('dtl-inp-crtrYr'));

		fn_selectItmPrfList();
	}

	//시도 변경 이벤트
	const fn_ctpvChange = async function(){
		SBUxMethod.set("srch-inp-sgg", "");
	}

	/* 로우데이터 요청 */

	var jsonHiddenGrd = []; // 그리드의 참조 데이터 주소 선언
	var hiddenGrd;

	/* Grid 화면 그리기 기능*/
	const fn_hiddenGrd = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-hiddenGrd';
		SBGridProperties.id = 'hiddenGrd';
		SBGridProperties.jsonref = 'jsonHiddenGrd';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["APC코드"],	ref:'apcCd',	type:'output',width:'70px',style:'text-align:center'},
			{caption: ["APC명"],		ref:'apcNm',	type:'output',width:'70px',style:'text-align:center'},

			{caption: ["시도"],			ref:'ctpvNm',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["시군구"],			ref:'sigunNm',			type:'output',width:'70px',style:'text-align:center'},

			{caption: ["대형유통업체(백화점 포함)(백만원)"],		ref:'apcNtslAmtLgszRtl',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["식자재업체(학교급식, 가공업체 포함)(백만원)"],	ref:'apcNtslAmtFoodMtrl',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["도매시장(공판장 포함)(백만원)"],			ref:'apcNtslAmtWhlslMrkt',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["aT온라인 도매시장(백만원)"],			ref:'apcNtslAmtOnlnWhlslMrkt',	type:'output',width:'70px',style:'text-align:center'},
			{caption: ["소매업체 직판(백만원)"],				ref:'apcNtslAmtBzenty',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["수출(백만원)"],						ref:'apcNtslAmtExprt',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["홈쇼핑(TV매체)(백만원)"],				ref:'apcNtslAmtHmsp',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["온라인(B2B)(백만원)"],				ref:'apcNtslAmtOnlnB2b',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["온라인(B2C)(백만원)"],				ref:'apcNtslAmtOnlnB2c',		type:'output',width:'70px',style:'text-align:center'},
			{caption: ["기타(백만원)"],						ref:'apcNtslAmtEtc',			type:'output',width:'70px',style:'text-align:center'},
			{caption: ["계(백만원)"],						ref:'apcNtslAmtTot',			type:'output',width:'70px',style:'text-align:center'},

		];

		hiddenGrd = _SBGrid.create(SBGridProperties);
	}

	const fn_hiddenGrdSelect = async function(){
		await fn_hiddenGrd();//그리드 생성

		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");
		if (gfn_isEmpty(crtrYr)) {
			let now = new Date();
			let year = now.getFullYear();
			crtrYr = year;
		}

		//userId로 지자체 시도 시군구 값 알아내서 처리
		let postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltPrcsNtslInfoRawDataList.do", {
			crtrYr : crtrYr
		});

		let data = await postJsonPromise;
		try{
			jsonHiddenGrd.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO = {
					apcCd				:item.apcCd
					,apcNm				:item.apcNm

					,ctpvNm				:item.ctpvNm
					,sigunNm			:item.sigunNm

					, apcNtslAmtLgszRtl			: item.apcNtslAmtLgszRtl
					, apcNtslAmtFoodMtrl		: item.apcNtslAmtFoodMtrl
					, apcNtslAmtWhlslMrkt		: item.apcNtslAmtWhlslMrkt
					, apcNtslAmtBzenty			: item.apcNtslAmtBzenty
					, apcNtslAmtExprt			: item.apcNtslAmtExprt
					, apcNtslAmtHmsp			: item.apcNtslAmtHmsp
					, apcNtslAmtOnlnB2b			: item.apcNtslAmtOnlnB2b
					, apcNtslAmtOnlnB2c			: item.apcNtslAmtOnlnB2c
					, apcNtslAmtEtc				: item.apcNtslAmtEtc
					, apcNtslAmtOnlnWhlslMrkt	: item.apcNtslAmtOnlnWhlslMrkt

					, apcNtslAmtTot				: item.apcNtslAmtTot

				}
				jsonHiddenGrd.push(hiddenGrdVO);
			});

			await hiddenGrd.rebuild();

			await fn_excelDown();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//로우 데이터 엑셀 다운로드
	function fn_excelDown(){
		const currentDate = new Date();

		const year = currentDate.getFullYear().toString().padStart(4, '0');
		const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
		const day = currentDate.getDate().toString().padStart(2, '0');
		let formattedDate = year + month + day;

		let fileName = formattedDate + "_5.3APC처리상품주요판매처_로우데이터";

		/*
		datagrid.exportData(param1, param2, param3, param4);
		param1(필수)[string]: 다운 받을 파일 형식
		param2(필수)[string]: 다운 받을 파일 제목
		param3[boolean]: 다운 받을 그리드 데이터 기준 (default:'false')
		→ true : csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 다운로드
		→ false : csv/xls/xlsx 형식의 데이터 다운로드를 jsonref 기준으로 다운로드
		param4[object]: 다운 받을 그리드 데이터 기준 (default:'false')
		→ arrRemoveCols(선택): csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 할 때 다운로드에서 제외할 열
		→ combolabel(선택) : csv/xls/xlsx combo/inputcombo 일 때 label 값으로 저장
		→ true : label 값으로 저장
		→ false : value 값으로 저장
		→ sheetName(선택) : xls/xlsx 형식의 데이터 다운로드시 시트명을 설정
		 */
		//console.log(hiddenGrd.exportData);
		hiddenGrd.exportData("xlsx" , fileName , true , true);
	}

</script>
</html>