<%
 /**
  * @Class Name : fcltOgnzItemPrfmncReg.jsp
  * @Description : 5.2.유통조직품목별 처리실적 화면
  * @author SI개발부
  * @since 2023.12.12
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.12.12   	김현호			최초 생성
  * @see
  *
  */
/* fcltOgnzPrcsPrfmncReg.jsp 유통조직 처리실적 화면 에 통합 됨*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 유통조직품목처리실적 -->
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
						<th scope="row" style="border-bottom:1px solid white;">APC명</th>
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
							<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_selectOgItmPrfList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
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
			<div><label>유통조직품목처리실적 상세내역 </label></div>
			<div><label style="font-size: x-small;">- 유통조직 총취급액과 합계가 동일하게 작성</label></div>
			<div><label style="font-size: x-small;">- 품목1+품목2+품목3+기타 의 합계가 유통조직 총취급액의 합과 같아야함</label></div>
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 40%">
						<col style="width: 40%">
					</colgroup>
						<tbody>
							<tr>
								<th>구분</th>
								<th>취급액(백만원)</th>
								<th>취급물량(톤)</th>
							</tr>
							<tr>
								<th>품목1</th>
								<td>
									<sbux-input id="dtl-inp-apcOperAmt1" name="dtl-inp-apcOperAmt1" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum(this,1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-apcOperVlm1" name="dtl-inp-apcOperVlm1" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum(this,2)"></sbux-input>
								</td>
							</tr>
							<tr>
								<th>품목2</th>
								<td>
									<sbux-input id="dtl-inp-apcOperAmt2" name="dtl-inp-apcOperAmt2" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum(this,1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-apcOperVlm2" name="dtl-inp-apcOperVlm2" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum(this,2)"></sbux-input>
								</td>
							</tr>
							<tr>
								<th>품목3</th>
								<td>
									<sbux-input id="dtl-inp-apcOperAmt3" name="dtl-inp-apcOperAmt3" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum(this,1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-apcOperVlm3" name="dtl-inp-apcOperVlm3" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum(this,2)"></sbux-input>
								</td>
							</tr>
							<tr>
								<th>기타</th>
								<td>
									<sbux-input id="dtl-inp-apcOperAmt4" name="dtl-inp-apcOperAmt4" uitype="text" class="form-control input-sm" placeholder="단위: 백만원" onkeyup="sum(this,1)"></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-apcOperVlm4" name="dtl-inp-apcOperVlm4" uitype="text" class="form-control input-sm" placeholder="단위: 톤" onkeyup="sum(this,2)"></sbux-input>
								</td>
							</tr>
							<tr>
								<th>합계</th>
								<td>
									<sbux-input id="dtl-inp-apcOperAmtTot" name="dtl-inp-apcOperAmtTot" uitype="text" class="form-control input-sm" placeholder="상기수치합계" readonly></sbux-input>
								</td>
								<td>
									<sbux-input id="dtl-inp-apcOperVlmTot" name="dtl-inp-apcOperVlmTot" uitype="text" class="form-control input-sm" placeholder="상기수치합계" readonly></sbux-input>
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
			//SBUxMethod.set("srch-inp-apcCd", '0122');
			SBUxMethod.set("srch-inp-apcCd", gv_apcCd);
			SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		};
		fn_selectOgItmPrfList();
	});

	const fn_selectOgItmPrfList = async function(copy_chk) {
		 console.log("******************fn_setGrdOgItmPrfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		//전년도 데이터
		if(!gfn_isEmpty(copy_chk)){
			crtrYr = parseFloat(crtrYr) - parseFloat(copy_chk);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltOgnzItemPrfmncList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr
		});

		const data = await postJsonPromise;
		//await 오류시 확인
		//예외처리
		try {

			data.resultList.forEach((item, index) => {
				if(!gfn_isEmpty(item.sn)){
					SBUxMethod.set('dtl-inp-apcOperAmt'+item.sn , item.apcOperAmt);
					SBUxMethod.set('dtl-inp-apcOperVlm'+item.sn , item.apcOperVlm);
				}
			});

			//sum('srch-inp-opera1',1);
			//sum('srch-inp-opera2',2);

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

		let saveList = [];

		for (var i = 1; i < 5; i++) {
			let arr = {
					sn : i
					,crtrYr : SBUxMethod.get('srch-inp-crtrYr')
					,apcCd : SBUxMethod.get('srch-inp-apcCd')
					,apcOperAmt : SBUxMethod.get('dtl-inp-apcOperAmt'+i)
					,apcOperVlm : SBUxMethod.get('dtl-inp-apcOperVlm'+i)
					//,itemCd :
					//,itemNm :
			}
			saveList.push(arr);
		}
		console.log(saveList);

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltOgnzItemPrfmnc.do", saveList);

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


	//국고 지자체 자부담 합계
	function sum(e, idx){
		extractNumbers2(e.name);

		if(idx == 1 ){
			let sum = convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcOperAmt1'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcOperAmt2'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcOperAmt3'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcOperAmt4'));
			SBUxMethod.set('dtl-inp-apcOperAmtTot',sum);
		}else if (idx == 2){
			let sum = convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcOperVlm1'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcOperVlm2'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcOperVlm3'))
						+ convertToNumberOrZero(SBUxMethod.get('dtl-inp-apcOperVlm4'));
			SBUxMethod.set('dtl-inp-apcOperVlmTot',sum);
		}
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