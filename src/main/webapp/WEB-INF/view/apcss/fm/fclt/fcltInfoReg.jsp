<%
 /**
  * @Class Name : fcltInfoReg.jsp
  * @Description : 3.1.시설 장비 인력 현황 화면
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
				<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 시설 장비 인력 현황 -->
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
			</div>
		</div>

		<div class="box-body">
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
								<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_selectFcltInfoList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<!-- 진척도 추가 -->
			<%@ include file="prgrs/apcPrgrs.jsp" %>

			<div class="table-responsive tbl_scroll_sm">
				<div id="sb-area-spmtDsctn" style="height:0px;"></div>
			</div>
			<br>
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
			 <p>* 복수동으로 분리된 경우 합산하여 기재</p>
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
		SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		//fn_init();
	});

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_selectFcltInfoList();
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
	const fn_selectFcltInfoList = async function(copy_chk) {
		//console.log("******************fn_pagingFcltInfoList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-input-crtrYr");

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
		fn_subInsert(confirm("등록 하시겠습니까?") , "N");
	}

	//임시저장
	const fn_tmprStrg = async function(tmpChk) {
		fn_subInsert(confirm("임시저장 하시겠습니까?") , 'Y');
	}



	//신규등록
	const fn_subInsert = async function (isConfirmed , tmpChk){
		//console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltInfo.do", {
			crtrYr: crtrYr
			, apcCd: apcCd
			, prgrsYn : 'Y' //진척도 갱신 여부
			, tmprStrgYn : tmpChk//임시저장 여부
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
				//열려있는 탭이 APC전수조사 인 경우 진척도 갱신
				cfn_allTabPrgrsRefrash();
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

</script>
</html>