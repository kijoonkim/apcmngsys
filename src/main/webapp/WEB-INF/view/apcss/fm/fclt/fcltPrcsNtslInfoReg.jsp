<%
 /**
  * @Class Name : fcltPrcsNtslInfoReg.jsp
  * @Description : 5.5.산지유통시설처리상품주요판매처 화면
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
							<!--
							<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_selectItmPrfList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
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

			<div style="display: flex;">
				<div>
					<label style="font-weight: bold;">○처리실적 총취급액</label>
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
							<th></th>
							<th class="text-center" colspan="2">품목1</th>
							<th class="text-center" colspan="2">품목2</th>
							<th class="text-center" colspan="2">품목3</th>
							<th class="text-center" colspan="2">기타</th>
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
					<label> - 기타항목은 다른 유통조직에 판매한 금액</label>
				</div>
				<div style="margin-left:auto; font-size: x-small;">
					<span style="position: relative; bottom: -44px;">(금액: 백만원)</span>
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
							<th class="text-center" colspan="2">대형유통업체(백화점 포함)</th>
							<th class="text-center" colspan="2">식자재업체<br>(학교급식, 가공업체 포함)</th>
							<th class="text-center" colspan="2">도매시장<br>(공판장 포함)</th>
							<th class="text-center" colspan="2">aT온라인 도매시장</th>
							<th class="text-center" colspan="2">소매업체 직판</th>
							<th class="text-center" colspan="2">계(백만원)</th>
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
							<th class="text-center" colspan="2">수출</th>
							<th class="text-center" colspan="2">홈쇼핑(TV매체)</th>
							<th class="text-center" colspan="2">온라인(B2B)</th>
							<th class="text-center" colspan="2">온라인(B2C)</th>
							<th class="text-center" colspan="2">기타</th>
							<th class="text-center" colspan="2">계(한글단위)</th>
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
							<td style="border-right:hidden; padding-right: 0px !important;">
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
							<td>(백만원)</td>
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
		<jsp:include page="/WEB-INF/view/apcss/fm/fclt/popup/apcSelectPopup.jsp"></jsp:include>
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
		let apcCd = '0861';
		let crtrYr = '2024';
		let apcNm = 'test';
		SBUxMethod.set("srch-inp-apcCd", apcCd);
		SBUxMethod.set("srch-inp-crtrYr", crtrYr);
		SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		fn_init();

	});

	/* 초기세팅 */
	const fn_init = async function() {
		await fn_search();
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

	const fn_search = async function() {
		fn_selectItmPrfList();
	}

	const fn_selectItmPrfList = async function(copy_chk) {
		 console.log("******************fn_pagingItmPrfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

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
			//console.log(data);
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

		fn_subInsert(confirm("등록 하시겠습니까?") , "N");
	}

	//임시저장
	const fn_tmprStrg = async function(tmpChk) {

		fn_subInsert(confirm("임시저장 하시겠습니까?") , 'Y');
	}

	//신규 등록
	const fn_subInsert = async function (isConfirmed , tmpChk){
		 console.log("******************fn_subInsert**********************************");
		 if (!isConfirmed) return;

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltPrcsNtslInfo.do", {
			crtrYr : SBUxMethod.get('srch-inp-crtrYr')
			,apcCd : SBUxMethod.get('srch-inp-apcCd')
			,prgrsYn : 'Y' //진척도 갱신 여부
			, tmprStrgYn : tmpChk//임시저장 여부
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
</script>
</html>