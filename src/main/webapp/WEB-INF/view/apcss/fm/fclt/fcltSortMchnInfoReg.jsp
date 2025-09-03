<%
 /**
  * @Class Name : fcltSortMchnInfoReg.jsp
  * @Description : 3.3.선별기운영 화면
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별기운영 -->
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
							<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_selectFcltInfoList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
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
				<label style="font-weight: bold;">○선별기현황 상세내역</label><br>
				<label>* 데이터 입력 시 조사연도의 직전년도 기준으로 작성해주시기 바랍니다.</label>
			</div>
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 10%">
					<col style="width: 85px">
					<col style="width: 20%">
					<col style="width: 28px">
					<col style="width: 20%">
					<col style="width: 28px">
					<col style="width: 20%">
					<col style="width: 40px">
					<col style="width: 20%">
					<col style="width: 28px">
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center" style="border-right: 1px solid white !important;">선별기</th>
						<th class="text-center" style="border-right: 1px solid white !important;">보유현황</th>
						<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">１일(8시간) 최대 처리 능력(톤)</th>
						<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">연간 처리 물량(톤)</th>
						<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">연간가동시간(시간)</th>
						<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">평균가동일수<br>
							<p>*연간가동시간/4시간</p>
						</th>
					</tr>
					<tr>
						<th class="text-center">
							<span id="itemNm1">품목1</span>
						</th>
						<td class="text-center">
							<sbux-input id="dtl-inp-itemChk1" name="dtl-inp-itemChk1" uitype="hidden"></sbux-input>
							<sbux-input id="dtl-inp-itemCd1" name="dtl-inp-itemCd1" uitype="hidden"></sbux-input>
							<sbux-checkbox
								id="dtl-inp-sortMchnHoldYn1"
								name="dtl-inp-sortMchnHoldYn1"
									uitype="normal"
									text=""
									true-value="Y"
									false-value="N"
									class="check"
									onchange ="fn_selectOnchange(this,'group1')"
									></sbux-checkbox>
						</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortPrcsAblt1"
								name="dtl-inp-sortPrcsAblt1"
								uitype="text"
								class="form-control input-sm"
								group-id="group1"
								placeholder="35  1일(8h)처리능력"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>톤</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortPrcsPrfmnc1"
								name="dtl-inp-sortPrcsPrfmnc1"
								uitype="text"
								class="form-control input-sm"
								group-id="group1"
								placeholder="2,200 연간처리실적"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>톤</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortOprtngHr1"
								name="dtl-inp-sortOprtngHr1"
								uitype="text"
								class="form-control input-sm"
								group-id="group1"
								placeholder=""
								onchange="fn_calSortAvgOprtngDcnt(1)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>시간</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortAvgOprtngDcnt1"
								name="dtl-inp-sortAvgOprtngDcnt1"
								uitype="text"
								class="form-control input-sm"
								group-id="group1"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
								readonly
							></sbux-input>
						</td>
						<td>일</td>
						<td></td>
					</tr>
					<tr>
						<th class="text-center">
							<span id="itemNm2">품목2</span>
						</th>
						<td class="text-center">
							<sbux-input id="dtl-inp-itemChk2" name="dtl-inp-itemChk2" uitype="hidden"></sbux-input>
							<sbux-input id="dtl-inp-itemCd2" name="dtl-inp-itemCd2" uitype="hidden"></sbux-input>
							<sbux-checkbox
								id="dtl-inp-sortMchnHoldYn2"
								name="dtl-inp-sortMchnHoldYn2"
								uitype="normal"
								text=""
								true-value="Y"
								false-value="N"
								class="check"
								onchange ="fn_selectOnchange(this,'group2')"
							></sbux-checkbox>
						</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortPrcsAblt2"
								name="dtl-inp-sortPrcsAblt2"
								uitype="text"
								class="form-control input-sm"
								group-id="group2"
								placeholder=""
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>톤</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortPrcsPrfmnc2"
								name="dtl-inp-sortPrcsPrfmnc2"
								uitype="text"
								class="form-control input-sm"
								group-id="group2"
								placeholder=""
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>톤</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortOprtngHr2"
								name="dtl-inp-sortOprtngHr2"
								uitype="text"
								class="form-control input-sm"
								group-id="group2"
								placeholder=""
								onchange="fn_calSortAvgOprtngDcnt(2)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>시간</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortAvgOprtngDcnt2"
								name="dtl-inp-sortAvgOprtngDcnt2"
								uitype="text"
								class="form-control input-sm"
								group-id="group2"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
								readonly
							></sbux-input>
						</td>
						<td>일</td>
						<td></td>
					</tr>
					<tr>
						<th class="text-center">
							<span id="itemNm3">품목3</span>
						</th>
						<td class="text-center">
							<sbux-input id="dtl-inp-itemChk3" name="dtl-inp-itemChk3" uitype="hidden"></sbux-input>
							<sbux-input id="dtl-inp-itemCd3" name="dtl-inp-itemCd3" uitype="hidden"></sbux-input>
							<sbux-checkbox
								id="dtl-inp-sortMchnHoldYn3"
								name="dtl-inp-sortMchnHoldYn3"
								uitype="normal"
								text=""
								true-value="Y"
								false-value="N"
								class="check"
								onchange ="fn_selectOnchange(this,'group3')"
							></sbux-checkbox>
						</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortPrcsAblt3"
								name="dtl-inp-sortPrcsAblt3"
								uitype="text"
								class="form-control input-sm"
								group-id="group3"
								placeholder=""
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>톤</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortPrcsPrfmnc3"
								name="dtl-inp-sortPrcsPrfmnc3"
								uitype="text"
								class="form-control input-sm"
								group-id="group3"
								placeholder=""
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>톤</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortOprtngHr3"
								name="dtl-inp-sortOprtngHr3"
								uitype="text"
								class="form-control input-sm"
								group-id="group3"
								placeholder=""
								onchange="fn_calSortAvgOprtngDcnt(3)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>시간</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortAvgOprtngDcnt3"
								name="dtl-inp-sortAvgOprtngDcnt3"
								uitype="text"
								class="form-control input-sm"
								group-id="group3"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
								readonly
							></sbux-input>
						</td>
						<td>일</td>
						<td></td>
					</tr>
					<tr>
						<th class="text-center">
							<span id="itemNm4">기타</span>
						</th>
						<td class="text-center">
							<sbux-input id="dtl-inp-itemChk4" name="dtl-inp-itemChk4" uitype="hidden"></sbux-input>
							<sbux-input id="dtl-inp-itemCd4" name="dtl-inp-itemCd4" uitype="hidden"></sbux-input>
							<sbux-checkbox
								id="dtl-inp-sortMchnHoldYn4"
								name="dtl-inp-sortMchnHoldYn4"
								uitype="normal"
								text=""
								true-value="Y"
								false-value="N"
								class="check"
								onchange ="fn_selectOnchange(this,'group4')"
							></sbux-checkbox>
						</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortPrcsAblt4"
								name="dtl-inp-sortPrcsAblt4"
								uitype="text"
								class="form-control input-sm"
								group-id="group4"
								placeholder=""
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>톤</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortPrcsPrfmnc4"
								name="dtl-inp-sortPrcsPrfmnc4"
								uitype="text"
								class="form-control input-sm"
								group-id="group4"
								placeholder=""
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>톤</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortOprtngHr4"
								name="dtl-inp-sortOprtngHr4"
								uitype="text"
								class="form-control input-sm"
								group-id="group4"
								placeholder=""
								onchange="fn_calSortAvgOprtngDcnt(4)"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>시간</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-sortAvgOprtngDcnt4"
								name="dtl-inp-sortAvgOprtngDcnt4"
								uitype="text"
								class="form-control input-sm"
								group-id="group4"
								placeholder="자동계산"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
								readonly
							></sbux-input>
						</td>
						<td>일</td>
						<td></td>
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
	})

	const fn_init = async function() {
		await fn_initSBSelect();

		await fn_selectUserApcList();//선택가능한 APC리스트 조회

		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			return;
		}
		await fn_clearForm();//전체 비활성화

		await fn_search();//데이터 조회

		await cfn_selectPrgrs();//진척도

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

	//전체 데이터 초기화 및 비활성화
	function fn_clearForm() {
		for (var i = 1; i < 5; i++) {
			SBUxMethod.changeGroupAttr('group'+i,'disabled','true');
			SBUxMethod.clearGroupData('group'+i);
			SBUxMethod.attr('dtl-inp-sortMchnHoldYn'+i,'disabled','true');
			SBUxMethod.set('dtl-inp-sortMchnHoldYn'+i,'N');
			SBUxMethod.set('dtl-inp-itemCd'+i,null);
			SBUxMethod.set('dtl-inp-itemChk'+i,null);
		}
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

		await fn_setGrdStMcInfList();
		// 전년도
		await fn_setGrdStMcInfList(true);
	}

	/**
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdStMcInfList = async function(isPrev = false) {

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-slt-crtrYr");

		jsonPrevData.length = 0;
		//전년도 데이터
		if (isPrev === true) {
			crtrYr = parseFloat(crtrYr) - 1;
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltSortMchnInfoList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr
		});

		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			if (isPrev === true) {
				jsonPrevData = data.resultList;
			} else {
				data.resultList.forEach((item, index) => {
					//item.sn 1~4
					//itemChk 품목 존재 여부
					SBUxMethod.set('dtl-inp-itemChk' + item.sn, 'Y');
					let sn = item.sn;
					if (sn == '4') {
						$('#itemNm' + sn).text("기타품목 : " + item.itemNm);
						SBUxMethod.set('dtl-inp-itemCd' + item.sn, item.itemNm);
					} else {
						$('#itemNm' + sn).text("품목" + sn + " : " + item.itemNm);
						SBUxMethod.set('dtl-inp-itemCd' + item.sn, item.itemCd);
					}

					let sortMchnHoldYn = item.sortMchnHoldYn;
					//품목이 없는경우 해당 행자체가 존재 하지 않아 조회가 안되므로 여기서 활성화
					SBUxMethod.attr('dtl-inp-sortMchnHoldYn' + item.sn, 'disabled', 'false');
					if (gfn_isEmpty(sortMchnHoldYn)) {
						SBUxMethod.set('dtl-inp-sortMchnHoldYn' + item.sn, 'N');
					}

					if (sortMchnHoldYn == 'Y') {
						SBUxMethod.changeGroupAttr('group' + item.sn, 'disabled', 'false');//선별기보유 할경우 해당 그룹 활성화
						SBUxMethod.set('dtl-inp-sortMchnHoldYn' + item.sn, 'Y');
						SBUxMethod.set('dtl-inp-sortPrcsAblt' + item.sn, item.sortPrcsAblt);
						SBUxMethod.set('dtl-inp-sortPrcsPrfmnc' + item.sn, item.sortPrcsPrfmnc);
						SBUxMethod.set('dtl-inp-sortOprtngHr' + item.sn, item.sortOprtngHr);
						SBUxMethod.set('dtl-inp-sortAvgOprtngDcnt' + item.sn, item.sortAvgOprtngDcnt);
					} else if (sortMchnHoldYn == 'N') {
						SBUxMethod.changeGroupAttr('group' + item.sn, 'disabled', 'true');
					}
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

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-slt-crtrYr");
		if (gfn_isEmpty(apcCd)) {
			alert("apc를 선택해주세요");
			return;
		}

		if (gfn_isEmpty(crtrYr)) {
			gfn_comAlert("W0001", "조사연도");	//	W0001	{0}을/를 선택하세요.
			return;
		}

		const canInsert = await gfn_apcSurveyInsertCheck(crtrYr, true);
		if (!canInsert) {
			return;
		}

		// 저장시 선별기 보유현황 체크시 처리능력, 처리물량 입력 필요
		for (let i = 1; i < 5; i++) {
			const itemChk = SBUxMethod.get('dtl-inp-itemChk' + i);
			if (itemChk === "Y") {
				const sortMchnHoldYn = $('#dtl-inp-sortMchnHoldYn' + i).val();
				if (sortMchnHoldYn === "Y") {
					let msg;
					if (i !== 4) {
						msg = "품목" + i;
					} else {
						msg = "기타품목"
					}
					const prcsAblt = SBUxMethod.get('dtl-inp-sortPrcsAblt' + i); // 처리능력
					if (gfn_isEmpty(prcsAblt)) {
						gfn_comAlert("W0002", msg + " 처리 능력"); // W0002  {0}을/를 입력하세요.
						return;
					}
					const prcsVlm = SBUxMethod.get('dtl-inp-sortPrcsPrfmnc' + i); // 처리물량
					if (gfn_isEmpty(prcsVlm)) {
						gfn_comAlert("W0002", msg + " 처리 물량"); // W0002  {0}을/를 입력하세요.
						return;
					}
				}
			}
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

		let crtrYr = SBUxMethod.get('srch-slt-crtrYr');
		let apcCd = SBUxMethod.get('srch-inp-apcCd');

		let saveList = [];

		for (var i = 1; i < 5; i++) {
			let itemChk = SBUxMethod.get('dtl-inp-itemChk'+i);
			//품목이 존재하는경우만 저장
			if(itemChk == 'Y'){
				let sortMchnHoldYn = $('#dtl-inp-sortMchnHoldYn'+i).val();
				let itemVo = {
						crtrYr : crtrYr
						, apcCd : apcCd
						, sn : i
						, sortMchnHoldYn : sortMchnHoldYn
						, prgrsYn : 'Y' //진척도 갱신 여부
						, tmprStrgYn : tmpChk//임시저장 여부
				}
				if(sortMchnHoldYn == 'Y'){
					itemVo.sortPrcsAblt = gfn_nvl(SBUxMethod.get('dtl-inp-sortPrcsAblt'+i));
					itemVo.sortPrcsPrfmnc = gfn_nvl(SBUxMethod.get('dtl-inp-sortPrcsPrfmnc'+i));
					itemVo.sortOprtngHr = gfn_nvl(SBUxMethod.get('dtl-inp-sortOprtngHr'+i));
					itemVo.sortAvgOprtngDcnt = gfn_nvl(SBUxMethod.get('dtl-inp-sortAvgOprtngDcnt'+i));
				}

				saveList.push(itemVo);
			}
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/multiSaveFcltSortMchnInfo.do", saveList);

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

	function fn_convertToZero(value) {
		if (value === '' || value === undefined || value === null) {
			return 0;
		} else {
			return value;
		}
	}

	//품종 유무 선택시 작성가능 아닐시 데이테 리셋
	function fn_selectOnchange(e,groupId){

		if($(e).val() == 'Y'){
			SBUxMethod.changeGroupAttr(groupId,'disabled','false');
		}else{
			SBUxMethod.changeGroupAttr(groupId,'disabled','true');
			SBUxMethod.clearGroupData(groupId);
		}
	}

	 // apc 선택 팝업 호출
	const fn_modalApcSelect = function() {
		popApcSelect.init(fn_setApc);
	}
	// apc 선택 팝업 콜백 함수
	const fn_setApc = async function(apc) {
		fn_clearForm();
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
		//진척도 갱신
		await cfn_selectPrgrs();
		await fn_search();
	}
	// 평균가동일수 계산
	const fn_calSortAvgOprtngDcnt = function(groupNum) {
		//let sortPrcsAblt = SBUxMethod.get('dtl-inp-sortPrcsAblt'+groupNum);
		//let sortPrcsPrfmnc = SBUxMethod.get('dtl-inp-sortPrcsPrfmnc'+groupNum);
		let sortOprtngHr = parseFloat(SBUxMethod.get('dtl-inp-sortOprtngHr'+groupNum));
		let resultVal = sortOprtngHr/4;
		SBUxMethod.set('dtl-inp-sortAvgOprtngDcnt'+groupNum , resultVal);
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

	/** 전년도 데이터 set **/
	function fn_pySearch() {

		if (gfn_isEmpty(jsonPrevData)) {
			gfn_comAlert("W0005","전년도 데이터"); // W0005  {0}이/가 없습니다.
			return;
		}
		let itemCount = 0;

		// 초기화
		for (let i = 1; i < 5; i++) {
			SBUxMethod.changeGroupAttr('group'+i,'disabled','true');
			SBUxMethod.clearGroupData('group'+i);
			SBUxMethod.attr('dtl-inp-sortMchnHoldYn'+i,'disabled','true');
			SBUxMethod.set('dtl-inp-sortMchnHoldYn'+i,'N');

			if (SBUxMethod.get('dtl-inp-itemChk' + i) === 'Y') {
				// SBUxMethod.changeGroupAttr('group' + i, 'disabled', 'false');
				SBUxMethod.attr('dtl-inp-sortMchnHoldYn' + i, 'disabled', 'false');
				itemCount++;
			}
		}

		// 등록된 품목이 하나도 없을 때
		if (itemCount === 0) {
			gfn_comAlert("W0005", "현재 조사연도 1.운영자 개요에서 등록된 품목"); // W0005  {0}이/가 없습니다.
			return;
		}

		let matchedCount = 0;

		jsonPrevData.forEach(item => {
			const sn = item.sn;
			const itemCd = SBUxMethod.get('dtl-inp-itemCd'+sn);

			if (_.isEqual(SBUxMethod.get('dtl-inp-itemChk' + sn), "Y") && (
					(sn === 4 && _.isEqual(itemCd, item.itemNm)) ||
					(sn !== 4 && _.isEqual(itemCd, item.itemCd)))) {

				let sortMchnHoldYn = item.sortMchnHoldYn;
				SBUxMethod.attr('dtl-inp-sortMchnHoldYn' + item.sn, 'disabled', 'false');

				if (sortMchnHoldYn == 'Y') {
					SBUxMethod.changeGroupAttr('group' + item.sn, 'disabled', 'false');//선별기보유 할경우 해당 그룹 활성화
					SBUxMethod.set('dtl-inp-sortMchnHoldYn' + item.sn, 'Y');
					SBUxMethod.set('dtl-inp-sortPrcsAblt' + item.sn, item.sortPrcsAblt);
					SBUxMethod.set('dtl-inp-sortPrcsPrfmnc' + item.sn, item.sortPrcsPrfmnc);
					SBUxMethod.set('dtl-inp-sortOprtngHr' + item.sn, item.sortOprtngHr);
					SBUxMethod.set('dtl-inp-sortAvgOprtngDcnt' + item.sn, item.sortAvgOprtngDcnt);
				}
			}
		});

		// 일치하는 전년도 데이터가 하나도 없을 때
		if (matchedCount === 0) {
			gfn_comAlert("W0005", "현재 조사연도와 일치하는 전년도 품목"); // W0005  {0}이/가 없습니다.
			return;
		}
	}

</script>
</html>