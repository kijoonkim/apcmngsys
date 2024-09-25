<%
 /**
  * @Class Name : fcltDtaMngInfoReg.jsp
  * @Description : 4.2 작업단계별 데이터 관리현황 화면
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
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 스마트데이터화 -->
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
						<th scope="row">조사연도</th>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-spinner
									id="srch-inp-crtrYr"
									name="srch-inp-crtrYr"
									uitype="normal"
									step-value="1"
									disabled
								></sbux-spinner>
						</td>
						<td class="td_input" style="border-right: hidden;">
							<!--
							<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_selectAtMcIfList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
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
				<label style="font-weight: bold;">○작업단계별 데이터 관리현황</label><br>
				<label>- 데이터를 관리하는 방법은 무엇입니까?</label><br>
				<label>* (시스템) 전산시스템으로 관리 / (수동) 수기 또는 엑셀 등으로 직접 연결</label><br>
				<label>* 데이터 입력 시 조사연도의 직전년도 기준으로 작성해주시기 바랍니다.</label>
			</div>
			<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 40%">
						<col style="width: 50%">
					</colgroup>
						<tbody>
							<tr>
								<th class="text-center">구분</th>
								<th class="text-center">관리방법</th>
								<th class="text-center">데이터관리 항목(다수 선택)</th>
							</tr>
							<tr>
								<th>생산정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-prdctnInfoMngMthd_1" name="dtl-rdo-prdctnInfoMngMthd" uitype="normal" value="1" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'PRDCTN')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-prdctnInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-prdctnInfoMngMthd_2" name="dtl-rdo-prdctnInfoMngMthd" uitype="normal" value="2" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'PRDCTN')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-prdctnInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-prdctnInfoMngMthd_3" name="dtl-rdo-prdctnInfoMngMthd" uitype="normal" value="3" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'PRDCTN')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-prdctnInfoMngMthd_3">시스템</label>
									</p>
								</td>
								<td id="PRDCTN">
								</td>
							</tr>
							<tr>
								<th>입고정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsInfoMngMthd_1" name="dtl-rdo-wrhsInfoMngMthd" uitype="normal" value="1" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'WRHS')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsInfoMngMthd_2" name="dtl-rdo-wrhsInfoMngMthd" uitype="normal" value="2" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'WRHS')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-wrhsInfoMngMthd_3" name="dtl-rdo-wrhsInfoMngMthd" uitype="normal" value="3" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'WRHS')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-wrhsInfoMngMthd_3">시스템</label>
									</p>
								</td>
								<td id="WRHS">
								</td>
							</tr>
							<tr>
								<th>선별정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-sortInfoMngMthd_1" name="dtl-rdo-sortInfoMngMthd" uitype="normal" value="1" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'SORT')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-sortInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-sortInfoMngMthd_2" name="dtl-rdo-sortInfoMngMthd" uitype="normal" value="2" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'SORT')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-sortInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-sortInfoMngMthd_3" name="dtl-rdo-sortInfoMngMthd" uitype="normal" value="3" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'SORT')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-sortInfoMngMthd_3">시스템</label>
									</p>
								</td>
								<td id="SORT">
								</td>
							</tr>
							<tr>
								<th>저장정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-strgInfoMngMthd_1" name="dtl-rdo-strgInfoMngMthd" uitype="normal" value="1" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'STRG')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-strgInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-strgInfoMngMthd_2" name="dtl-rdo-strgInfoMngMthd" uitype="normal" value="2" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'STRG')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-strgInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-strgInfoMngMthd_3" name="dtl-rdo-strgInfoMngMthd" uitype="normal" value="3" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'STRG')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-strgInfoMngMthd_3">시스템</label>
									</p>
								</td>
								<td id="STRG">
								</td>
							</tr>
							<tr>
								<th>포장정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-pckgInfoMngMthd_1" name="dtl-rdo-pckgInfoMngMthd" uitype="normal" value="1" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'PCKG')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-pckgInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-pckgInfoMngMthd_2" name="dtl-rdo-pckgInfoMngMthd" uitype="normal" value="2" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'PCKG')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-pckgInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-pckgInfoMngMthd_3" name="dtl-rdo-pckgInfoMngMthd" uitype="normal" value="3" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'PCKG')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-pckgInfoMngMthd_3">시스템</label>
									</p>
								</td>
								<td id="PCKG">
								</td>
							</tr>
							<tr>
								<th>작업정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-jobInfoMngMthd_1" name="dtl-rdo-jobInfoMngMthd" uitype="normal" value="1" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'JOB')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-jobInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-jobInfoMngMthd_2" name="dtl-rdo-jobInfoMngMthd" uitype="normal" value="2" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'JOB')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-jobInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-jobInfoMngMthd_3" name="dtl-rdo-jobInfoMngMthd" uitype="normal" value="3" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'JOB')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-jobInfoMngMthd_3">시스템</label>
									</p>
								</td>
								<td id="JOB">
								</td>
							</tr>
							<tr>
								<th>출고정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtInfoMngMthd_1" name="dtl-rdo-spmtInfoMngMthd" uitype="normal" value="1" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'SPMT')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtInfoMngMthd_2" name="dtl-rdo-spmtInfoMngMthd" uitype="normal" value="2" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'SPMT')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-spmtInfoMngMthd_3" name="dtl-rdo-spmtInfoMngMthd" uitype="normal" value="3" class="radio_label" group-id="group1" onchange="fn_rdoChange(this,'SPMT')"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-spmtInfoMngMthd_3">시스템</label>
									</p>
								</td>
								<td id="SPMT">
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
		<sbux-modal id="modal-apcSelect" name="modal-apcSelect" uitype="middle" header-title="apc 선택" body-html-id="body-modal-apcSelect" footer-is-close-button="false" style="width:600px; z-index: 10000;"></sbux-modal>
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
		let crtrYr = '2024';
		let apcCd = '0861';
		let apcNm = 'test';
		//SBUxMethod.set("srch-inp-crtrYr", crtrYr);
		//SBUxMethod.set("srch-inp-apcCd", apcCd);
		//SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		<c:if test="${loginVO.userType eq '27' || loginVO.userType eq '28'}">
		//지자체인경우 올해만 볼수 있게 수정
		SBUxMethod.attr('srch-inp-crtrYr', 'readonly', 'true')
		</c:if>

		fn_init();

	});

	/* 초기세팅 */
	const fn_init = async function() {
		await fn_setChkList();//체크박스 세팅

		await fn_clearForm();

		await fn_selectUserApcList();//선택가능한 APC리스트 조회

		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			return;
		}

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

	/* 선택가능한 APC리스트 조회 */
	const fn_selectUserApcList = async function(){

		let postJsonPromise = gfn_postJSON("/fm/fclt/selectUserApcList.do", {

		});

		let data = await postJsonPromise;
		try{
			console.log(data);
			let apcListLength = data.resultList.length;
			console.log(apcListLength);
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

	//입력폼 초기화
	const fn_clearForm = async function() {
		SBUxMethod.clearGroupData("group1");
		jsonComDataMngType.forEach((item) => {
			SBUxMethod.clearGroupData(item.value);
			SBUxMethod.set("dtl-chk-all"+item.value , "N");
			SBUxMethod.set("dtl-inp-"+item.value ,null);
		});
	}

	const fn_search = async function() {
		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			alert('APC를 선택해주세요');
			return;
		}
		await fn_clearForm();
		await fn_selectDtMnIfList();
	}

	const fn_selectDtMnIfList = async function(copy_chk) {
		 console.log("******************fn_pagingAtMcIfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

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

			await data.resultDtlList.forEach((item, index) => {
				SBUxMethod.set('dtl-chk-'+item.dataMngTypeDtl,item.dataMngYn);
				if(!gfn_isEmpty(item.dataMngEtc)){
					SBUxMethod.set('dtl-inp-'+item.dataMngType,item.dataMngEtc);
				}
			});

			await jsonComDataMngType.forEach((item) => {
				fn_selDataMngChk(item.value);
			});

			await data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-rdo-prdctnInfoMngMthd',item.prdctnInfoMngMthd);
				fn_rdoChange(item.prdctnInfoMngMthd,'PRDCTN');
				SBUxMethod.set('dtl-rdo-wrhsInfoMngMthd',item.wrhsInfoMngMthd);
				fn_rdoChange(item.wrhsInfoMngMthd,'WRHS');
				SBUxMethod.set('dtl-rdo-sortInfoMngMthd',item.sortInfoMngMthd);
				fn_rdoChange(item.sortInfoMngMthd,'SORT');
				SBUxMethod.set('dtl-rdo-strgInfoMngMthd',item.strgInfoMngMthd);
				fn_rdoChange(item.strgInfoMngMthd,'STRG');
				SBUxMethod.set('dtl-rdo-pckgInfoMngMthd',item.pckgInfoMngMthd);
				fn_rdoChange(item.pckgInfoMngMthd,'PCKG');
				SBUxMethod.set('dtl-rdo-jobInfoMngMthd',item.jobInfoMngMthd);
				fn_rdoChange(item.jobInfoMngMthd,'JOB');
				SBUxMethod.set('dtl-rdo-spmtInfoMngMthd',item.spmtInfoMngMthd);
				fn_rdoChange(item.spmtInfoMngMthd,'SPMT');
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
			alert("조사연도를 작성해주세요");
			return;
		}

		let prdctnInfoMngMthd = SBUxMethod.get('dtl-rdo-prdctnInfoMngMthd');
		if (gfn_isEmpty(prdctnInfoMngMthd)) {
			alert("생산정보 관리방법을 선택해주세요");
			return;
		}
		let wrhsInfoMngMthd = SBUxMethod.get('dtl-rdo-wrhsInfoMngMthd');
		if (gfn_isEmpty(wrhsInfoMngMthd)) {
			alert("입고정보 관리방법을 선택해주세요");
			return;
		}
		let sortInfoMngMthd = SBUxMethod.get('dtl-rdo-sortInfoMngMthd');
		if (gfn_isEmpty(sortInfoMngMthd)) {
			alert("선별정보 관리방법을 선택해주세요");
			return;
		}
		let strgInfoMngMthd = SBUxMethod.get('dtl-rdo-strgInfoMngMthd');
		if (gfn_isEmpty(strgInfoMngMthd)) {
			alert("저장정보 관리방법을 선택해주세요");
			return;
		}
		let pckgInfoMngMthd = SBUxMethod.get('dtl-rdo-pckgInfoMngMthd');
		if (gfn_isEmpty(pckgInfoMngMthd)) {
			alert("포장정보 관리방법을 선택해주세요");
			return;
		}
		let jobInfoMngMthd = SBUxMethod.get('dtl-rdo-jobInfoMngMthd');
		if (gfn_isEmpty(jobInfoMngMthd)) {
			alert("작업정보 관리방법을 선택해주세요");
			return;
		}
		let spmtInfoMngMthd = SBUxMethod.get('dtl-rdo-spmtInfoMngMthd');
		if (gfn_isEmpty(spmtInfoMngMthd)) {
			alert("출고정보 관리방법을 선택해주세요");
			return;
		}

		console.log(prdctnInfoMngMthd , wrhsInfoMngMthd , sortInfoMngMthd , strgInfoMngMthd , pckgInfoMngMthd , jobInfoMngMthd , spmtInfoMngMthd);

		fn_subInsert(confirm("등록 하시겠습니까?") , "N");
	}

	//임시저장
	const fn_tmprStrg = async function(tmpChk) {
		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			alert('APC를 선택해주세요');
			return;
		}
		fn_subInsert(confirm("임시저장 하시겠습니까?") , 'Y');
	}

	//신규등록
	const fn_subInsert = async function (isConfirmed , tmpChk){
		console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;
		//console.log(SBUxMethod.get('srch-inp-crtrYr'));

		let fcltDataMngVOList = [];

		let crtrYr = SBUxMethod.get('srch-inp-crtrYr');
		let apcCd = SBUxMethod.get('srch-inp-apcCd');

		await jsonComDataMngTypeDtl.forEach((item) => {
			let dataVO = {
				crtrYr : crtrYr
				, apcCd : apcCd
				, dataMngType : item.mastervalue
				, dataMngTypeDtl : item.value
				, dataMngYn : $("#dtl-chk-"+item.value).val()
			}
			if(item.text == "기타"){
				dataVO.dataMngEtc = SBUxMethod.get('dtl-inp-'+item.mastervalue);
			}
			fcltDataMngVOList.push(dataVO);
		});

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltDtaMngInfo.do", {
			crtrYr : crtrYr
			,apcCd : apcCd
			, prgrsYn : 'Y' //진척도 갱신 여부
			, tmprStrgYn : tmpChk

			,prdctnInfoMngMthd : SBUxMethod.get('dtl-rdo-prdctnInfoMngMthd')
			,wrhsInfoMngMthd : SBUxMethod.get('dtl-rdo-wrhsInfoMngMthd')
			,sortInfoMngMthd : SBUxMethod.get('dtl-rdo-sortInfoMngMthd')
			,strgInfoMngMthd : SBUxMethod.get('dtl-rdo-strgInfoMngMthd')
			,pckgInfoMngMthd : SBUxMethod.get('dtl-rdo-pckgInfoMngMthd')
			,jobInfoMngMthd : SBUxMethod.get('dtl-rdo-jobInfoMngMthd')
			,spmtInfoMngMthd : SBUxMethod.get('dtl-rdo-spmtInfoMngMthd')
			,fcltDataMngVOList : fcltDataMngVOList
		});

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
				alert("처리 되었습니다.");
				//fn_search();
				//열려있는 탭이 APC전수조사 인 경우 진척도 갱신
				cfn_allTabPrgrsRefrash();
			} else {
				console.log(data);
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
	const fn_setApc = async function(apc) {
		await fn_clearForm();
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
		//진척도 갱신
		await cfn_selectPrgrs();
		await fn_search();
	}

	//공통코드 DATA_MNG_TYPE 데이터 관리 타입 , DATA_MNG_TYPE_DTL 데이터 관리 타입 상세
	let jsonComDataMngTypeDtl = [];
	let jsonComDataMngType = [];

	const fn_setChkList = async function() {
		let result1 = gfn_getComCdDtls('DATA_MNG_TYPE_DTL');
		jsonComDataMngTypeDtl.length=0;
		await result1.then((arr) => {
			arr.forEach((item) => {
				const cdVl = {
					text: item.cdVlNm,
					label: item.cdVlNm,
					value: item.cdVl,
					mastervalue : item.upCdVl,
					useYn : item.useYn
				}
				jsonComDataMngTypeDtl.push(cdVl);
			})
		})

		let result2 = gfn_getComCdDtls('DATA_MNG_TYPE');
		jsonComDataMngType.length=0;
		await result2.then((arr) => {
			arr.forEach((item) => {
				const cdVl = {
					text: item.cdVlNm,
					label: item.cdVlNm,
					value: item.cdVl,
					mastervalue : item.upCdVl,
					useYn : item.useYn
				}
				jsonComDataMngType.push(cdVl);
			})
		})
		//console.log(jsonComDataMngTypeDtl);

		await jsonComDataMngType.forEach((item) => {
			if(!gfn_isEmpty(item.value)){
				//console.log(item);
				let $targetTd = $('#'+item.value);
				let $newP = $('<p>').addClass('ad_input_row');
				$targetTd.append($newP);
				$newP.sbCheckbox({
					id:"dtl-chk-all"+item.value,
					name:"dtl-chk-all"+item.value,
					uitype:"normal",
					text:"전체선택",
					trueValue:"Y",
					falseValue:"N",
					itemBottomPadding:"5px",
					textRightPadding:"5px",
					onchange:"fn_allDataMngChk('"+item.value+"')",
					textStyle:"font-weight: normal;",
				});
			}
		})

		await jsonComDataMngTypeDtl.forEach((item) => {
			if(!gfn_isEmpty(item.mastervalue)){
				//console.log(item);
				let $targetTd = $('#'+item.mastervalue);
				//기타인경우 줄바꿈
				if(item.text == "기타"){
					let $br = $('<br>');
					$targetTd.append($br);
				}
				let $newP = $('<p>').addClass('ad_input_row');
				$targetTd.append($newP);
				$newP.sbCheckbox({
					id:"dtl-chk-"+item.value,
					name:"dtl-chk-"+item.value,
					uitype:"normal",
					text:item.text,
					trueValue:"Y",
					falseValue:"N",
					itemBottomPadding:"5px",
					textRightPadding:"5px",
					groupId:item.mastervalue,
					textStyle:"font-weight: normal;",
					onchange:"fn_selDataMngChk('"+item.mastervalue+"')",
				});
				if(item.text == "기타"){
					let $newP1 = $('<p>').addClass('ad_input_row');
					$targetTd.append($newP1);
					$newP1.sbInput({
						id:"dtl-inp-"+item.mastervalue,
						name:"dtl-inp-"+item.mastervalue,
						uitype : 'text',
						text:item.text,
						style:"height: 20px;"
					});
				}
			}
		})
	}
	// 데이터관리 항목 전체선택 값 변경시
	const fn_allDataMngChk = function(groupId) {
		//let selVal = SBUxMethod.get("dtl-chk-all"+groupId);
		let selVal = $("#dtl-chk-all"+groupId).val();
		//console.log(groupId,selVal);
		if (!gfn_isEmpty(groupId)) {
			let targetGroup = jsonComDataMngTypeDtl.filter((item) => item.mastervalue == groupId);
			targetGroup.forEach((item) => {
				SBUxMethod.set("dtl-chk-"+item.value,selVal);
			})
		}
	}

	// 데이터관리 항목 일반 값 변경시
	const fn_selDataMngChk = function(groupId) {
		if (!gfn_isEmpty(groupId)) {
			//group 길이 랑 'Y' 값 갯수 비교
			let group = SBUxMethod.getGroupData(groupId);
			let trueCnt = 0;
			for (var i = 0; i < group.length; i++) {
				let chkVal = Object.values(group[i].component_value);
				if(chkVal[0] == "Y"){
					trueCnt++;
				}
			}
			SBUxMethod.set("dtl-chk-all"+groupId , group.length == trueCnt ? 'Y' : 'N');
		}
	}

	// 관리방법 값 변경시
	const fn_rdoChange = function(target,groupId) {
		let chkVal;
		if(typeof target == 'object'){
			chkVal = target.value;
		}else{
			chkVal = target;
		}
		if (!gfn_isEmpty(groupId)) {
			if(chkVal == '1'){
				SBUxMethod.clearGroupData(groupId);
				SBUxMethod.changeGroupAttr(groupId,'disabled','true');
				SBUxMethod.set("dtl-chk-all"+groupId, "N");
				SBUxMethod.attr("dtl-chk-all"+groupId,'disabled','true');
				SBUxMethod.attr("dtl-inp-"+groupId,'disabled','true');
			}else{
				//SBUxMethod.clearGroupData(groupId);
				SBUxMethod.changeGroupAttr(groupId,'disabled','false');
				//SBUxMethod.set("dtl-chk-all"+groupId, "N");
				SBUxMethod.attr("dtl-chk-all"+groupId,'disabled','false');
				SBUxMethod.attr("dtl-inp-"+groupId,'disabled','false');
			}
		}
	}
</script>
</html>