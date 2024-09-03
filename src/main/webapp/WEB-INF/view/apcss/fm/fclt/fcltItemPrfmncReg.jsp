<%
 /**
  * @Class Name : fcltItemPrfmncReg.jsp
  * @Description : 5.4.산지유통시설품목별 처리실적 화면
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
				<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 산지유통시설품목처리실적 -->
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
			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<br>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:0px;"></div>
				</div>
												<br>
			<div><label>산지유통시설품목처리실적 상세내역</label></div>
			<div><label style="font-size: x-small;">- 품목1+품목2+품목3+기타 의 APC취급액 합계가 산지유통시설 처리실적의 APC취급액과 같아야함</label></div>
			<div style="display: flex;"><label style="font-size: x-small; margin-left: auto;">(단위: 백만원,톤,%)</label></div>
			<br>

			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
					</colgroup>
						<tbody>
							<tr>
								<th>품목명</th>
								<th>APC취급액(A)</th>
								<th>APC취급물량</th>
								<th>APC취급액 중<br>통합마케팅 출하액(B)</th>
								<th>통합마케팅<br>출하비율(B/A*100)</th>
							</tr>
							<tr>
								<th>품목1</th>
								<td>
									<sbux-input id="dtl-inp-apcTrmtAmt1" name="dtl-inp-apcTrmtAmt1" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum(this,1,1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-apcTrmtVlm1" name="dtl-inp-apcTrmtVlm1" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum(this,2)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-tmSpmtAmt1" name="dtl-inp-tmSpmtAmt1" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum(this,3,1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-tmSpmtRt1" name="dtl-inp-tmSpmtRt1" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
							</tr>
							<tr>
								<th>품목2</th>
								<td>
									<sbux-input id="dtl-inp-apcTrmtAmt2" name="dtl-inp-apcTrmtAmt2" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum(this,1,2)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-apcTrmtVlm2" name="dtl-inp-apcTrmtVlm2" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum(this,,2)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-tmSpmtAmt2" name="dtl-inp-tmSpmtAmt2" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum(this,3,2)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-tmSpmtRt2" name="dtl-inp-tmSpmtRt2" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
							</tr>
							<tr>
								<th>품목3</th>
								<td>
									<sbux-input id="dtl-inp-apcTrmtAmt3" name="dtl-inp-apcTrmtAmt3" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum(this,1,3)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-apcTrmtVlm3" name="dtl-inp-apcTrmtVlm3" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum(this,2)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-tmSpmtAmt3" name="dtl-inp-tmSpmtAmt3" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum(this,3,3)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-tmSpmtRt3" name="dtl-inp-tmSpmtRt3" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
							</tr>
							<tr>
								<th>기타</th>
								<td>
									<sbux-input id="dtl-inp-apcTrmtAmt4" name="dtl-inp-apcTrmtAmt4" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum(this,1,4)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-apcTrmtVlm4" name="dtl-inp-apcTrmtVlm4" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum(this,2)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-tmSpmtAmt4" name="dtl-inp-tmSpmtAmt4" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum(this,3,4)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-tmSpmtRt4" name="dtl-inp-tmSpmtRt4" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
							</tr>
							<tr>
								<th>합계</th>
								<td>
									<sbux-input id="dtl-inp-apcTrmtAmtTot" name="dtl-inp-apcTrmtAmtTot" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-apcTrmtVlmTot" name="dtl-inp-apcTrmtVlmTot" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-tmSpmtAmtTot" name="dtl-inp-tmSpmtAmtTot" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-tmSpmtRtTot" name="dtl-inp-tmSpmtRtTot" uitype="text" class="form-control input-sm" placeholder="자동계산" readonly></sbux-input>
								</td>
							</tr>
						</tbody>
					</table>

					</div>
					<div><label style="font-size: x-small;">* 해당 산지유통시설에서 처리하는 전체 품목의 취급액, 취급물량, 통합마케팅 출하액, 통합마케팅 출하비율을 기재.</label><div>
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
			//SBUxMethod.set("srch-inp-apcCd", '0122');
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};
		fn_selectItmPrfList();
	});


	/**
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_selectItmPrfList = async function(pageSize, pageNo) {
		 console.log("******************fn_pagingItmPrfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltItemPrfmncList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr,

			// pagination
			//pagingYn : 'N',
			//currentPageNo : pageNo,
			//recordCountPerPage : pageSize
		});

		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			data.resultList.forEach((item, index) => {
				if(!gfn_isEmpty(item.sn)){
					SBUxMethod.set('dtl-inp-apcTrmtAmt'+item.sn ,item.apcTrmtAmt);
					SBUxMethod.set('dtl-inp-apcTrmtVlm'+item.sn ,item.apcTrmtVlm);
					SBUxMethod.set('dtl-inp-tmSpmtAmt'+item.sn ,item.tmSpmtAmt);
					SBUxMethod.set('dtl-inp-tmSpmtRt'+item.sn ,item.tmSpmtRt);
				}
			});
			/*
			sum('srch-inp-opera1',1,1);
			sum('srch-inp-opera2',2);
			sum('srch-inp-opera5',1,2);
			sum('srch-inp-opera9',1,3);
			sum('srch-inp-opera13',1,4);
			*/
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

		fn_subInsert(confirm("등록 하시겠습니까?"));
	}


	//신규 등록
	const fn_subInsert = async function (isConfirmed){
		 console.log("******************fn_subInsert**********************************");
		 if (!isConfirmed) return;

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltItemPrfmnc.do", {
			crtrYr : SBUxMethod.get('srch-inp-crtrYr')
			,apcCd : SBUxMethod.get('srch-inp-apcCd')

			,fcltItemSpmtAmt : SBUxMethod.get('srch-inp-opera1')


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


	//자동 계산
	function sum(e, idx , idx2){
		//console.log("=========sum==========");
		extractNumbers2(e.name);

		if(idx == 1 ){
			let sum = convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtAmt1'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtAmt2'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtAmt3'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtAmt4'));
			SBUxMethod.set('dtl-inp-apcTrmtAmtTot',sum);
			cal(idx2);
		}else if (idx == 2){
			let sum = convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtVlm1'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtVlm2'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtVlm3'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtVlm4'));
			SBUxMethod.set('dtl-inp-apcTrmtVlmTot',sum);
		}else if (idx ==3){
			let sum = convertToNumberOrZero(SBUxMethod.get('dtl-inp-tmSpmtAmt1'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-tmSpmtAmt2'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-tmSpmtAmt3'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-tmSpmtAmt4'));
			SBUxMethod.set('dtl-inp-tmSpmtAmtTot',sum);
			cal(idx2);
		}
	}

	//통합마케팅 출하비율 계산
	function cal(idx2) {
		//console.log("=========cal==========");
		if(idx2 == 1){
			let calVal = convertToNumberOrZero(SBUxMethod.get('dtl-inp-tmSpmtAmt1')) / convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtAmt1')) * 100;
			SBUxMethod.set('dtl-inp-tmSpmtRt1',calVal.toFixed(2));
		}else if(idx2 == 2){
			let calVal = convertToNumberOrZero(SBUxMethod.get('dtl-inp-tmSpmtAmt2')) / convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtAmt2')) * 100;
			SBUxMethod.set('dtl-inp-tmSpmtRt2',calVal.toFixed(2));
		}else if(idx2 == 3){
			let calVal = convertToNumberOrZero(SBUxMethod.get('dtl-inp-tmSpmtAmt3')) / convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtAmt3')) * 100;
			SBUxMethod.set('dtl-inp-tmSpmtRt3',calVal.toFixed(2));
		}else if(idx2 == 4){
			let calVal = convertToNumberOrZero(SBUxMethod.get('dtl-inp-tmSpmtAmt4')) / convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtAmt4')) * 100;
			SBUxMethod.set('dtl-inp-tmSpmtRt4',calVal.toFixed(2));
		}
		let calVal2 = convertToNumberOrZero(SBUxMethod.get('dtl-inp-tmSpmtAmtTot')) / convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcTrmtAmtTot')) * 100;
		SBUxMethod.set('dtl-inp-tmSpmtRtTot',calVal2.toFixed(2));
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