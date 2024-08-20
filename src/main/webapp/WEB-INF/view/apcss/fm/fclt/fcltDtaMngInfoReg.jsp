<%
 /**
  * @Class Name : fcltDtaMngInfoReg.jsp
  * @Description : 4.2.데이터화 화면
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
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 스마트데이터화 -->
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
							<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_selectAtMcIfList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
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
				<li><label>작업단계별 데이터 관리현황</label></li>
				<li><label style="font-size: x-small;">-어떤 작업단계까지 생산하는 데이터를 농가별로 연계하고 있습니까?</label></li>
				<li><label style="font-size: x-small;">-데이터를 관리하는 방법은 무엇입니까?</label></li>
			</div>
			<div>
				<table class="table table-bordered tbl_row tbl_fixed" style="width: 50%">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 30%">
						<col style="width: 70%">
					</colgroup>
						<tbody>
							<tr>
								<th class="text-center">구분</th>
								<th class="text-center">관리방법</th>
							</tr>
							<tr>
								<th>생산정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-prdctnInfoMngMthd_1" name="dtl-rdo-prdctnInfoMngMthd" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-prdctnInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-prdctnInfoMngMthd_2" name="dtl-rdo-prdctnInfoMngMthd" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-prdctnInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-prdctnInfoMngMthd_3" name="dtl-rdo-prdctnInfoMngMthd" uitype="normal" value="3" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-prdctnInfoMngMthd_3">시스템</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>입고정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsInfoMngMthd_1" name="dtl-rdo-wrhsInfoMngMthd" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsInfoMngMthd_2" name="dtl-rdo-wrhsInfoMngMthd" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsInfoMngMthd_3" name="dtl-rdo-wrhsInfoMngMthd" uitype="normal" value="3" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsInfoMngMthd_3">시스템</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>선별정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-sortInfoMngMthd_1" name="dtl-rdo-sortInfoMngMthd" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-sortInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-sortInfoMngMthd_2" name="dtl-rdo-sortInfoMngMthd" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-sortInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-sortInfoMngMthd_3" name="dtl-rdo-sortInfoMngMthd" uitype="normal" value="3" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-sortInfoMngMthd_3">시스템</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>저장정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-strgInfoMngMthd_1" name="dtl-rdo-strgInfoMngMthd" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-strgInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-strgInfoMngMthd_2" name="dtl-rdo-strgInfoMngMthd" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-strgInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-strgInfoMngMthd_3" name="dtl-rdo-strgInfoMngMthd" uitype="normal" value="3" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-strgInfoMngMthd_3">시스템</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>포장정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-pckgInfoMngMthd_1" name="dtl-rdo-pckgInfoMngMthd" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-pckgInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-pckgInfoMngMthd_2" name="dtl-rdo-pckgInfoMngMthd" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-pckgInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-pckgInfoMngMthd_3" name="dtl-rdo-pckgInfoMngMthd" uitype="normal" value="3" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-pckgInfoMngMthd_3">시스템</label>
									</p>
								</td>
							</tr>
							<tr>
								<th>출고정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtInfoMngMthd_1" name="dtl-rdo-spmtInfoMngMthd" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtInfoMngMthd_2" name="dtl-rdo-spmtInfoMngMthd" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtInfoMngMthd_3" name="dtl-rdo-spmtInfoMngMthd" uitype="normal" value="3" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtInfoMngMthd_3">시스템</label>
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div><li><label style="font-size: x-small;">* (시스템) 전산시스템으로 관리 / (수동) 수기 또는 엑셀 등으로 직접 연결</label></li></div>

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

	});

	/* 초기세팅 */
	const fn_init = async function() {
		await fn_selectAtMcIfList();
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

	const fn_selectAtMcIfList = async function(copy_chk) {
		 console.log("******************fn_pagingAtMcIfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		/*테스트*/
		apcCd = '0122';
		crtrYr = '2023';

		//전년도 데이터
		if(!gfn_isEmpty(copy_chk)){
			crtrYr = parseFloat(crtrYr) - parseFloat(copy_chk);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltDtaMngInfoList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr
		});

		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-rdo-prdctnInfoMngMthd',item.prdctnInfoMngMthd);
				SBUxMethod.set('dtl-rdo-wrhsInfoMngMthd',item.wrhsInfoMngMthd);
				SBUxMethod.set('dtl-rdo-sortInfoMngMthd',item.sortInfoMngMthd);
				SBUxMethod.set('dtl-rdo-strgInfoMngMthd',item.strgInfoMngMthd);
				SBUxMethod.set('dtl-rdo-pckgInfoMngMthd',item.pckgInfoMngMthd);
				SBUxMethod.set('dtl-rdo-spmtInfoMngMthd',item.spmtInfoMngMthd);
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
		 console.log("******************fn_subInsert**********************************");
		 if (!isConfirmed) return;
		 console.log(SBUxMethod.get('srch-inp-crtrYr'));
		 const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltDtaMngInfo.do", {
			 crtrYr : SBUxMethod.get('srch-inp-crtrYr')
			,apcCd : SBUxMethod.get('srch-inp-apcCd')
			, prgrsYn : 'Y' //진척도 갱신 여부

			,prdctnInfoMngMthd : SBUxMethod.get('dtl-rdo-prdctnInfoMngMthd')
			,wrhsInfoMngMthd : SBUxMethod.get('dtl-rdo-wrhsInfoMngMthd')
			,sortInfoMngMthd : SBUxMethod.get('dtl-rdo-sortInfoMngMthd')
			,strgInfoMngMthd : SBUxMethod.get('dtl-rdo-strgInfoMngMthd')
			,pckgInfoMngMthd : SBUxMethod.get('dtl-rdo-pckgInfoMngMthd')
			,spmtInfoMngMthd : SBUxMethod.get('dtl-rdo-spmtInfoMngMthd')
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
	//탭열린 상태에서 해당 페이지 다시 왔을떄 이벤트
	window.addEventListener('message',function(event){
		console.log('1. 탭호출');
		console.log(event);
		let chkVal = event.data.chkVal;
		if(chkVal == "selTab"){
			//진척도 조회
			cfn_selectPrgrs();
		}
	});

</script>
</html>