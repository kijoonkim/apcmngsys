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
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 선별기운영 -->
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
			<div><label>선별기현황 상세내역</label></div>
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
								placeholder="440"
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
								placeholder=""
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
								placeholder=""
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
								placeholder=""
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
	})

	const fn_init = async function() {
		await fn_clear();//전체 비활성화

		await fn_setGrdStMcInfList();//데이터 조회

		await cfn_selectPrgrs();//진척도
		//최종제출 여부
		let prgrsLast = SBUxMethod.get('dtl-inp-prgrsLast');
		if(prgrsLast  == 'Y'){
			await SBUxMethod.attr("btnInsert",'disabled','true'); // 저장버튼 비활성화
		} else {
			await SBUxMethod.attr("btnInsert",'disabled','false'); // 저장버튼 활성화
		}
	}

	//전체 데이터 초기화 및 비활성화
	function fn_clear() {
		for (var i = 1; i < 5; i++) {
			SBUxMethod.changeGroupAttr('group'+i,'disabled','true');
			SBUxMethod.clearGroupData('group'+i);
			SBUxMethod.attr('dtl-inp-sortMchnHoldYn'+i,'disabled','true');
			SBUxMethod.set('dtl-inp-sortMchnHoldYn'+i,null);
		}
	}

	/**
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdStMcInfList = async function(copy_chk) {
		 //console.log("******************fn_setGrdStMcInfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		//전년도 데이터
		if(!gfn_isEmpty(copy_chk)){
			crtrYr = parseFloat(crtrYr) - parseFloat(copy_chk);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltSortMchnInfoList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr
		});

		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			console.log(data);
			fn_clear();//전체 초기화 및 비활성화
			data.resultList.forEach((item, index) => {
				//item.sn 1~4
				//itemChk 품목 존재 여부
				SBUxMethod.set('dtl-inp-itemChk'+item.sn ,'Y');

				$('#itemNm'+item.sn).text("품목 : "+item.itemNm);

				let sortMchnHoldYn = item.sortMchnHoldYn;
				//품목이 없는경우 해당 행자체가 존재 하지 않아 조회가 안되므로 여기서 활성화
				SBUxMethod.attr('dtl-inp-sortMchnHoldYn'+item.sn,'disabled','false');
				SBUxMethod.set('dtl-inp-sortMchnHoldYn'+item.sn ,sortMchnHoldYn);

				if(sortMchnHoldYn == 'Y'){
					SBUxMethod.changeGroupAttr('group'+item.sn,'disabled','false');//선별기보유 할경우 해당 그룹 활성화
					SBUxMethod.set('dtl-inp-sortPrcsAblt'+item.sn ,item.sortPrcsAblt);
					SBUxMethod.set('dtl-inp-sortPrcsPrfmnc'+item.sn ,item.sortPrcsPrfmnc);
					SBUxMethod.set('dtl-inp-sortOprtngHr'+item.sn ,item.sortOprtngHr);
					SBUxMethod.set('dtl-inp-sortAvgOprtngDcnt'+item.sn ,item.sortAvgOprtngDcnt);
				}else if(sortMchnHoldYn == 'N'){
					SBUxMethod.changeGroupAttr('group'+item.sn,'disabled','true');
				}
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

		fn_subInsert(confirm("등록 하시겠습니까?"));
	}

	//신규등록
	const fn_subInsert = async function (isConfirmed){
		//console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;
		//console.log(SBUxMethod.get('srch-inp-crtrYr'));

		let crtrYr = SBUxMethod.get('srch-inp-crtrYr');
		let apcCd = SBUxMethod.get('srch-inp-apcCd');

		let saveList = [];

		for (var i = 1; i < 5; i++) {
			let itemChk = SBUxMethod.get('dtl-inp-itemChk'+i);
			//품목이 존재하는경우만 저장
			if(itemChk == 'Y'){
				let sortMchnHoldYn = SBUxMethod.get('dtl-inp-sortMchnHoldYn'+i);
				let itemVo = {
						crtrYr : crtrYr
						, apcCd : apcCd
						, sn : i
						, sortMchnHoldYn : sortMchnHoldYn
						, prgrsYn : 'Y' //진척도 갱신 여부
				}
				if(sortMchnHoldYn == 'Y'){
					itemVo.sortPrcsAblt = SBUxMethod.get('dtl-inp-sortPrcsAblt'+i);
					itemVo.sortPrcsPrfmnc = SBUxMethod.get('dtl-inp-sortPrcsPrfmnc'+i);
					itemVo.sortOprtngHr = SBUxMethod.get('dtl-inp-sortOprtngHr'+i);
					itemVo.sortAvgOprtngDcnt = SBUxMethod.get('dtl-inp-sortAvgOprtngDcnt'+i);
				}

				saveList.push(itemVo);
			}
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/multiSaveFcltGdsMchnInfo.do", saveList);

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

	//품종 유무 선택시 작성가능 아닐시 데이테 리셋
	function fn_selectOnchange(e,groupId){
		//console.log("============fn_selectOnchange==============");

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
	const fn_setApc = function(apc) {
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
	}
	// 평균가동일수 계산
	const fn_calSortAvgOprtngDcnt = function(groupNum) {
		//let sortPrcsAblt = SBUxMethod.get('dtl-inp-sortPrcsAblt'+groupNum);
		//let sortPrcsPrfmnc = SBUxMethod.get('dtl-inp-sortPrcsPrfmnc'+groupNum);
		let sortOprtngHr = parseFloat(SBUxMethod.get('dtl-inp-sortOprtngHr'+groupNum));
		let resultVal = sortOprtngHr/4;
		//console.log(sortOprtngHr,resultVal);
		SBUxMethod.set('dtl-inp-sortAvgOprtngDcnt'+groupNum , resultVal);
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