<%
 /**
  * @Class Name : fcltInfo.jsp
  * @Description : 사설현황 화면
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>title : 시설현황</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<style type="text/css">
		#body-modal-apcSelect_back { width:150px;height:150px;padding:0.5em; }
	</style>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid" style="height: 100vh">
			<div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background-color: white; z-index: 99" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
				<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 시설 장비 인력 현황 -->
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
			<p>* 복수동으로 분리된 경우 합산하여 기재</p>
			<sbux-input uitype="hidden" id="dtl-inp-apcCd" name="dtl-inp-apcCd"></sbux-input>
			<sbux-input uitype="hidden" id="dtl-inp-crtrYr" name="dtl-inp-crtrYr"></sbux-input>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>시설현황</caption>
				<colgroup>
					<col style="width: 15%">
					<col style="width: 15%">
					<col style="width: 28px">
					<col style="width: 15%">
					<col style="width: 28px">
				</colgroup>
				<tbody>
					<tr>
						<th style="border-right: 1px solid white !important; text-align: center;">구분</th>
						<th colspan="2" style="border-right: 1px solid white !important; text-align: center;">면적(㎡)</th>
						<th colspan="2" style="border-right: 1px solid white !important; text-align: center;">평(평)</th>
						<th style="border-right: 1px solid white !important; text-align: center;">비고</th>
					</tr>
					<tr>
						<th>총 건축면적</th>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-cspTotArea"
								name="dtl-inp-cspTotArea"
								uitype="text"
								class="form-control input-sm"
								placeholder="자동계산"
								data-info="total"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
								readonly
							></sbux-input>
						</td>
						<td>㎡</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-cspTotAreaPy"
								name="dtl-inp-cspTotAreaPy"
								uitype="text"
								class="form-control input-sm"
								placeholder="자동계산"
								data-info="total"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 1}"
								readonly
							></sbux-input>
						</td>
						<td>평</td>
						<td>
							<sbux-input id="dtl-inp-cspTotRmrk" name="dtl-inp-cspTotRmrk" uitype="text" class="form-control input-sm" placeholder="예) 1개 동" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>집하선별포장장</th>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-cspCfppArea"
								name="dtl-inp-cspCfppArea"
								uitype="text"
								class="form-control input-sm sum"
								onkeyup="fn_sumNumbers(this)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>㎡</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-cspCfppAreaPy"
								name="dtl-inp-cspCfppAreaPy"
								uitype="text"
								class="form-control input-sm"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 1}"
								readonly
							></sbux-input>
						</td>
						<td>평</td>
						<td>
							<sbux-input id="dtl-inp-cspCfppRmrk" name="dtl-inp-cspCfppRmrk" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>세척․가공 등 처리</th>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-cspClnOprtngPrcsArea"
								name="dtl-inp-cspClnOprtngPrcsArea"
								uitype="text"
								class="form-control input-sm sum"
								onkeyup="fn_sumNumbers(this)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>㎡</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-cspClnOprtngPrcsAreaPy"
								name="dtl-inp-cspClnOprtngPrcsAreaPy"
								uitype="text"
								class="form-control input-sm"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 1}"
								readonly
							></sbux-input>
						</td>
						<td>평</td>
						<td>
							<sbux-input id="dtl-inp-cspClnOprtngPrcsRmrk" name="dtl-inp-cspClnOprtngPrcsRmrk" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>비상품화시설</th>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-cspNgdsFcltArea"
								name="dtl-inp-cspNgdsFcltArea"
								uitype="text"
								class="form-control input-sm sum"
								onkeyup="fn_sumNumbers(this)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>㎡</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-cspNgdsFcltAreaPy"
								name="dtl-inp-cspNgdsFcltAreaPy"
								uitype="text"
								class="form-control input-sm"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 1}"
								readonly
							></sbux-input>
						</td>
						<td>평</td>
						<td>
							<sbux-input id="dtl-inp-cspNgdsFcltRmrk" name="dtl-inp-cspNgdsFcltRmrk" uitype="text" class="form-control input-sm"placeholder="사무실, 회의실, 화장실 등"></sbux-input>
						</td>
					</tr>
					<tr>
						<th>폐기물 처리</th>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-cspDtpArea"
								name="dtl-inp-cspDtpArea"
								uitype="text"
								class="form-control input-sm sum"
								onkeyup="fn_sumNumbers(this)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>㎡</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-cspDtpAreaPy"
								name="dtl-inp-cspDtpAreaPy"
								uitype="text"
								class="form-control input-sm"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 1}"
								readonly
							></sbux-input>
						</td>
						<td>평</td>
						<td>
							<sbux-input id="dtl-inp-cspDtpRmrk" name="dtl-inp-cspDtpRmrk" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>예냉고</th>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcPrcPlcArea"
								name="dtl-inp-strgPlcPrcPlcArea"
								uitype="text"
								class="form-control input-sm sum"
								onkeyup="fn_sumNumbers(this)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>㎡</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcPrcPlcAreaPy"
								name="dtl-inp-strgPlcPrcPlcAreaPy"
								uitype="text"
								class="form-control input-sm"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 1}"
								readonly
							></sbux-input>
						</td>
						<td>평</td>
						<td>
							<sbux-input id="dtl-inp-strgPlcPrcPlcRmrk" name="dtl-inp-strgPlcPrcPlcRmrk" uitype="text" class="form-control input-sm" placeholder="예시) 3칸 ✕ 100m²"></sbux-input>
						</td>
					</tr>
					<tr>
						<th>저온저장</th>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcLwtpStrgArea"
								name="dtl-inp-strgPlcLwtpStrgArea"
								uitype="text"
								class="form-control input-sm sum"
								onkeyup="fn_sumNumbers(this)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>㎡</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcLwtpStrgAreaPy"
								name="dtl-inp-strgPlcLwtpStrgAreaPy"
								uitype="text"
								class="form-control input-sm"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 1}"
								readonly
							></sbux-input>
						</td>
						<td>평</td>
						<td>
							<sbux-input id="dtl-inp-strgPlcLwtpStrgRmrk" name="dtl-inp-strgPlcLwtpStrgRmrk" uitype="text" class="form-control input-sm"
							" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>CA저장고</th>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcCaStrgPlcArea"
								name="dtl-inp-strgPlcCaStrgPlcArea"
								uitype="text"
								class="form-control input-sm sum"
								onkeyup="fn_sumNumbers(this)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>㎡</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcCaStrgPlcAreaPy"
								name="dtl-inp-strgPlcCaStrgPlcAreaPy"
								uitype="text"
								class="form-control input-sm"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 1}"
								readonly
							></sbux-input>
						</td>
						<td>평</td>
						<td>
							<sbux-input id="dtl-inp-strgPlcCaStrgPlcRmrk" name="dtl-inp-strgPlcCaStrgPlcRmrk" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>큐어링</th>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcCurnArea"
								name="dtl-inp-strgPlcCurnArea"
								uitype="text"
								class="form-control input-sm sum"
								onkeyup="fn_sumNumbers(this)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>㎡</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcCurnAreaPy"
								name="dtl-inp-strgPlcCurnAreaPy"
								uitype="text"
								class="form-control input-sm"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 1}"
								readonly
							></sbux-input>
						</td>
						<td>평</td>
						<td>
							<sbux-input id="dtl-inp-strgPlcCurnRmrk" name="dtl-inp-strgPlcCurnRmrk" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>일반저장</th>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcGnrlStrgArea"
								name="dtl-inp-strgPlcGnrlStrgArea"
								uitype="text"
								class="form-control input-sm sum"
								onkeyup="fn_sumNumbers(this)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>㎡</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcGnrlStrgAreaPy"
								name="dtl-inp-strgPlcGnrlStrgAreaPy"
								uitype="text"
								class="form-control input-sm"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 1}"
								readonly
							></sbux-input>
						</td>
						<td>평</td>
						<td>
							<sbux-input id="dtl-inp-strgPlcGnrlStrgRmrk" name="dtl-inp-strgPlcGnrlStrgRmrk" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>
					<tr>
						<th>기타사항</th>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcEtcArea"
								name="dtl-inp-strgPlcEtcArea"
								uitype="text"
								class="form-control input-sm sum"
								onkeyup="fn_sumNumbers(this)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>㎡</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcEtcAreaPy"
								name="dtl-inp-strgPlcEtcAreaPy"
								uitype="text"
								class="form-control input-sm"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 1}"
								readonly
							></sbux-input>
						</td>
						<td>평</td>
						<td>
							<sbux-input id="dtl-inp-strgPlcEtcRmrk" name="dtl-inp-strgPlcEtcRmrk" uitype="text" class="form-control input-sm" ></sbux-input>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button id="btnSave1" name="btnSave1" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				</div>
			</div>
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
		<jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/apcSelectPopup.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let date = new Date();
		let year  = date.getFullYear();
		SBUxMethod.set("srch-inp-crtrYr", year);//trgtYr -> crtrYr 변경
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


	/**
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_selectFcltInfoList = async function(copy_chk) {
		//console.log("******************fn_pagingFcltInfoList**********************************");

		let apcCd = SBUxMethod.get("dtl-inp-apcCd");
		let crtrYr = SBUxMethod.get("dtl-input-crtrYr");

		//전년도 데이터
		if(!gfn_isEmpty(copy_chk)){
			crtrYr = parseFloat(crtrYr) - parseFloat(copy_chk);
		}

		//비동기 포스트타입 url 데이터연결 페이징처리 글로벌
		//gfn_postJSON 는 ajax고 post통신의 데이터를 json 타입으로 보내는것이다
		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltInfoList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr
		});

		const data = await postJsonPromise;
		//await 오류시 확인
		//예외처리
		try {
			//console.log(data);
			data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-inp-cspTotArea',gfn_nvl(item.cspTotArea));
				SBUxMethod.set('dtl-inp-cspTotRmrk',gfn_nvl(item.cspTotRmrk));
				SBUxMethod.set('dtl-inp-cspCfppArea',gfn_nvl(item.cspCfppArea));
				SBUxMethod.set('dtl-inp-cspCfppRmrk',gfn_nvl(item.cspCfppRmrk));
				SBUxMethod.set('dtl-inp-cspClnOprtngPrcsArea',gfn_nvl(item.cspClnOprtngPrcsArea));
				SBUxMethod.set('dtl-inp-cspClnOprtngPrcsRmrk',gfn_nvl(item.cspClnOprtngPrcsRmrk));
				SBUxMethod.set('dtl-inp-cspDtpArea',gfn_nvl(item.cspDtpArea));
				SBUxMethod.set('dtl-inp-cspDtpRmrk',gfn_nvl(item.cspDtpRmrk));
				SBUxMethod.set('dtl-inp-cspNgdsFcltArea',gfn_nvl(item.cspNgdsFcltArea));
				SBUxMethod.set('dtl-inp-cspNgdsFcltRmrk',gfn_nvl(item.cspNgdsFcltRmrk));
				SBUxMethod.set('dtl-inp-strgPlcPrcPlcArea',gfn_nvl(item.strgPlcPrcPlcArea));
				SBUxMethod.set('dtl-inp-strgPlcPrcPlcRmrk',gfn_nvl(item.strgPlcPrcPlcRmrk));
				SBUxMethod.set('dtl-inp-strgPlcLwtpStrgArea',gfn_nvl(item.strgPlcLwtpStrgArea));
				SBUxMethod.set('dtl-inp-strgPlcLwtpStrgRmrk',gfn_nvl(item.strgPlcLwtpStrgRmrk));
				SBUxMethod.set('dtl-inp-strgPlcCaStrgPlcArea',gfn_nvl(item.strgPlcCaStrgPlcArea));
				SBUxMethod.set('dtl-inp-strgPlcCaStrgPlcRmrk',gfn_nvl(item.strgPlcCaStrgPlcRmrk));
				SBUxMethod.set('dtl-inp-strgPlcCurnArea',gfn_nvl(item.strgPlcCurnArea));
				SBUxMethod.set('dtl-inp-strgPlcCurnRmrk',gfn_nvl(item.strgPlcCurnRmrk));
				SBUxMethod.set('dtl-inp-strgPlcGnrlStrgArea',gfn_nvl(item.strgPlcGnrlStrgArea));
				SBUxMethod.set('dtl-inp-strgPlcGnrlStrgRmrk',gfn_nvl(item.strgPlcGnrlStrgRmrk));
				SBUxMethod.set('dtl-inp-strgPlcEtcArea',gfn_nvl(item.strgPlcEtcArea));
				SBUxMethod.set('dtl-inp-strgPlcEtcRmrk',gfn_nvl(item.strgPlcEtcRmrk));
			});

			fn_sumAll();//자동계산 부분 처리
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			//console.error("failed", e.message);
		}
	}

	//입력폼 초기화
	const fn_clearForm = function() {
		SBUxMethod.set('dtl-inp-cspTotArea',null);
		SBUxMethod.set('dtl-inp-cspTotRmrk',null);
		SBUxMethod.set('dtl-inp-cspCfppArea',null);
		SBUxMethod.set('dtl-inp-cspCfppRmrk',null);
		SBUxMethod.set('dtl-inp-cspClnOprtngPrcsArea',null);
		SBUxMethod.set('dtl-inp-cspClnOprtngPrcsRmrk',null);
		SBUxMethod.set('dtl-inp-cspDtpArea',null);
		SBUxMethod.set('dtl-inp-cspDtpRmrk',null);
		SBUxMethod.set('dtl-inp-cspNgdsFcltArea',null);
		SBUxMethod.set('dtl-inp-cspNgdsFcltRmrk',null);
		SBUxMethod.set('dtl-inp-strgPlcPrcPlcArea',null);
		SBUxMethod.set('dtl-inp-strgPlcPrcPlcRmrk',null);
		SBUxMethod.set('dtl-inp-strgPlcLwtpStrgArea',null);
		SBUxMethod.set('dtl-inp-strgPlcLwtpStrgRmrk',null);
		SBUxMethod.set('dtl-inp-strgPlcCaStrgPlcArea',null);
		SBUxMethod.set('dtl-inp-strgPlcCaStrgPlcRmrk',null);
		SBUxMethod.set('dtl-inp-strgPlcCurnArea',null);
		SBUxMethod.set('dtl-inp-strgPlcCurnRmrk',null);
		SBUxMethod.set('dtl-inp-strgPlcGnrlStrgArea',null);
		SBUxMethod.set('dtl-inp-strgPlcGnrlStrgRmrk',null);
		SBUxMethod.set('dtl-inp-strgPlcEtcArea',null);
		SBUxMethod.set('dtl-inp-strgPlcEtcRmrk',null);
		fn_sumAll();//자동계산 부분 처리
	}

	//등록
	const fn_save = async function() {
		//console.log("******************fn_save**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		if (gfn_isEmpty(apcCd)) {
			alert("apc를 선택해주세요");
			return;
		}
		if (gfn_isEmpty(crtrYr)) {
			alert("대상연도를 작성해주세요");
			return;
		}
		/*
		let yearArr = document.querySelectorAll("input[data-year='0']");
		yearArr.forEach(e => {
			if(e.value != "" && e.value.length != 4){
				alert("사업연도는 네자리로 작성해주세요. 예) 2023");
				result++;
				return e.focus();
			}
		});
		*/
		fn_subInsert(confirm("등록 하시겠습니까?"));
	}




	//신규등록
	const fn_subInsert = async function (isConfirmed){
		//console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

		let apcCd = SBUxMethod.get("dtl-inp-apcCd");
		let crtrYr = SBUxMethod.get("dtl-inp-crtrYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltInfo.do", {
			crtrYr: crtrYr
			, apcCd: apcCd
			, prgrsYn : 'N' //진척도 갱신 여부
			, cspTotArea: SBUxMethod.get('dtl-inp-cspTotArea')
			, cspTotRmrk: SBUxMethod.get('dtl-inp-cspTotRmrk')
			, cspCfppArea: SBUxMethod.get('dtl-inp-cspCfppArea')
			, cspCfppRmrk: SBUxMethod.get('dtl-inp-cspCfppRmrk')
			, cspClnOprtngPrcsArea: SBUxMethod.get('dtl-inp-cspClnOprtngPrcsArea')
			, cspClnOprtngPrcsRmrk: SBUxMethod.get('dtl-inp-cspClnOprtngPrcsRmrk')
			, cspDtpArea: SBUxMethod.get('dtl-inp-cspDtpArea')
			, cspDtpRmrk: SBUxMethod.get('dtl-inp-cspDtpRmrk')
			, cspNgdsFcltArea: SBUxMethod.get('dtl-inp-cspNgdsFcltArea')
			, cspNgdsFcltRmrk: SBUxMethod.get('dtl-inp-cspNgdsFcltRmrk')
			, strgPlcPrcPlcArea: SBUxMethod.get('dtl-inp-strgPlcPrcPlcArea')
			, strgPlcPrcPlcRmrk: SBUxMethod.get('dtl-inp-strgPlcPrcPlcRmrk')
			, strgPlcLwtpStrgArea: SBUxMethod.get('dtl-inp-strgPlcLwtpStrgArea')
			, strgPlcLwtpStrgRmrk: SBUxMethod.get('dtl-inp-strgPlcLwtpStrgRmrk')
			, strgPlcCaStrgPlcArea: SBUxMethod.get('dtl-inp-strgPlcCaStrgPlcArea')
			, strgPlcCaStrgPlcRmrk: SBUxMethod.get('dtl-inp-strgPlcCaStrgPlcRmrk')
			, strgPlcCurnArea: SBUxMethod.get('dtl-inp-strgPlcCurnArea')
			, strgPlcCurnRmrk: SBUxMethod.get('dtl-inp-strgPlcCurnRmrk')
			, strgPlcGnrlStrgArea: SBUxMethod.get('dtl-inp-strgPlcGnrlStrgArea')
			, strgPlcGnrlStrgRmrk: SBUxMethod.get('dtl-inp-strgPlcGnrlStrgRmrk')
			, strgPlcEtcArea: SBUxMethod.get('dtl-inp-strgPlcEtcArea')
			, strgPlcEtcRmrk: SBUxMethod.get('dtl-inp-strgPlcEtcRmrk')
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
		//console.log("insert result", data);
	}

	//면적 합산
	function fn_sumNumbers(e) {
		//extractNumbers2(e);
		//console.log(e);
		fn_pyCal(e);
		let sum = 0;
		let sumStr = "";
		document.querySelectorAll(".sum").forEach(e =>{
			// , 마스킹 제거 후 숫자 타입 변환
			let eVal = parseFloat(e.value.replaceAll(',',''));
			if(!isNaN(eVal)){
				sumStr += eVal+" , "
				sum += eVal;
			}
		});
		//console.log(sumStr);
		let pyVal = sum*0.3025;
		//console.log(sum.toFixed(1));
		//$("sbux-input[data-info='total']").val(sum.toFixed(1));
		SBUxMethod.set("dtl-inp-cspTotArea", sum.toFixed(1));
		SBUxMethod.set("dtl-inp-cspTotAreaPy", pyVal.toFixed(2));
		//data-info="total"
	}

	//조회 후 전체 평계산,합산
	function fn_sumAll() {

		let sumArr = $('.sum');
		for (var i = 0; i < sumArr.length; i++) {
			fn_pyCal(sumArr[i]);
		}

		let sum = 0;
		let sumStr = "";
		document.querySelectorAll(".sum").forEach(e =>{
			// , 마스킹 제거 후 숫자 타입 변환
			let eVal = parseFloat(e.value.replaceAll(',',''));
			if(!isNaN(eVal)){
				sumStr += eVal+" , "
				sum += eVal;
			}
		});

		let pyVal = sum*0.3025;
		//console.log(sum.toFixed(1));
		//$("sbux-input[data-info='total']").val(sum.toFixed(1));
		SBUxMethod.set("dtl-inp-cspTotArea", sum.toFixed(1));
		SBUxMethod.set("dtl-inp-cspTotAreaPy", pyVal.toFixed(2));
	}

	// 숫자(소숫점 가능)만 입력
	function extractNumbers2(e) {
		let chkVal = $(e).val().replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
		$(e).val(chkVal);
	}
	//평계산
	function fn_pyCal(e){
		//1제곱미터 = 약 0.3025 평
		let target = SBUxMethod.get(e.name);
		if(gfn_isEmpty(target)){
			SBUxMethod.set(e.name+"Py","");
			return;
		}

		let resultVal = parseFloat(target) * 0.3025;
		SBUxMethod.set(e.name+"Py",resultVal);
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

		fn_selectFcltInfoList();
	}

	//시도 변경 이벤트
	const fn_ctpvChange = async function(){
		SBUxMethod.set("srch-inp-sgg", "");
	}

</script>
</html>