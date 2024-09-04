<%
 /**
  * @Class Name : fcltDtaMngInfo.jsp
  * @Description : 스마트데이터화 화면
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
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 스마트데이터화 -->
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
			<sbux-input uitype="hidden" id="dtl-inp-apcCd" name="dtl-inp-apcCd"></sbux-input>
			<sbux-input uitype="hidden" id="dtl-inp-crtrYr" name="dtl-inp-crtrYr"></sbux-input>
			<!--[pp] 검색 -->
			<div>
				<li><label>작업단계별 데이터 관리현황</label></li>
				<li><label style="font-size: x-small;">-어떤 작업단계까지 생산하는 데이터를 농가별로 연계하고 있습니까?</label></li>
				<li><label style="font-size: x-small;">-데이터를 관리하는 방법은 무엇입니까?</label></li>
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
								<td id="PRDCTN">
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
								<td id="WRHS">
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
								<td id="SORT">
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
								<td id="STRG">
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
								<td id="PCKG">
								</td>
							</tr>
							<tr>
								<th>작업정보</th>
								<td class="text-center">
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-jobInfoMngMthd_1" name="dtl-rdo-jobInfoMngMthd" uitype="normal" value="1" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-jobInfoMngMthd_1">관리안함</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-jobInfoMngMthd_2" name="dtl-rdo-jobInfoMngMthd" uitype="normal" value="2" class="radio_label"></sbux-radio>
										<label class="radio_label" for="dtl-rdo-jobInfoMngMthd_2">수기/엑셀</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="dtl-rdo-jobInfoMngMthd_3" name="dtl-rdo-jobInfoMngMthd" uitype="normal" value="3" class="radio_label"></sbux-radio>
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
								<td id="SPMT">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div><li><label style="font-size: x-small;">* (시스템) 전산시스템으로 관리 / (수동) 수기 또는 엑셀 등으로 직접 연결</label></li></div>

			</div>
			<!--[pp] //검색결과 -->
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button id="btnSave1" name="btnSave1" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_save"></sbux-button>
				</div>
			</div>
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
		await fn_setChkList();//체크박스 세팅
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

	const fn_selectAtMcIfList = async function(copy_chk) {
		 console.log("******************fn_pagingAtMcIfList**********************************");

		let apcCd = SBUxMethod.get("dtl-inp-apcCd");
		let crtrYr = SBUxMethod.get("dtl-inp-crtrYr");

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
				SBUxMethod.set('dtl-rdo-jobInfoMngMthd',item.jobInfoMngMthd);
				SBUxMethod.set('dtl-rdo-spmtInfoMngMthd',item.spmtInfoMngMthd);
			});

			await data.resultDtlList.forEach((item, index) => {
				SBUxMethod.set('dtl-chk-'+item.dataTypeDtl,item.dataMngYn);
			});

			await jsonComDataMngType.forEach((item) => {
				fn_selDataMngChk(item.value);
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

		let apcCd = SBUxMethod.get("dtl-inp-apcCd");
		let crtrYr = SBUxMethod.get("dtl-inp-crtrYr");
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

	//신규등록
	const fn_subInsert = async function (isConfirmed , tmpChk){
		console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;
		//console.log(SBUxMethod.get('dtl-inp-crtrYr'));

		let fcltDataMngVOList = [];

		let crtrYr = SBUxMethod.get('srch-inp-crtrYr');
		let apcCd = SBUxMethod.get('srch-inp-apcCd');

		await jsonComDataMngTypeDtl.forEach((item) => {
			let fcltDataMngVO = {
				crtrYr : crtrYr
				, apcCd : apcCd
				, dataMngType : item.mastervalue
				, dataMngTypeDtl : item.value
				, dataMngYn : SBUxMethod.get('dtl-chk-'+item.value)
			}
			fcltDataMngVOList.push(fcltDataMngVO);
		})

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltDtaMngInfo.do", {
			crtrYr : crtrYr
			,apcCd : apcCd
			, prgrsYn : 'N' //진척도 갱신 여부
			, tmprStrgYn : tmpChk//임시저장 여부

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
			}
		})
	}
	// 데이터관리 항목 전체선택 값 변경시
	const fn_allDataMngChk = function(groupId) {
		//let selVal = SBUxMethod.get("dtl-chk-all"+groupId);
		let selVal = $("#dtl-chk-all"+groupId).val();
		if (!gfn_isEmpty(groupId)) {
			let targetGroup = jsonComDataMngTypeDtl.filter((item) => item.mastervalue == groupId);
			targetGroup.forEach((item) => {
				SBUxMethod.set("dtl-chk-"+item.value,selVal);
			})
		}
	}

	// 데이터관리 항목 일반 값 변경시
	const fn_selDataMngChk = function(targetId,groupId) {
		//let selVal = SBUxMethod.get("dtl-chk-"+targetId);
		let selVal = $("#dtl-chk-"+targetId).val();
		if (!gfn_isEmpty(targetId)) {
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
		//fn_clearForm();

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
		//fn_clearForm();
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
		//console.log(SBUxMethod.get('dtl-inp-apcCd'));
		//console.log(SBUxMethod.get('dtl-inp-crtrYr'));

		fn_selectAtMcIfList();
	}

	//시도 변경 이벤트
	const fn_ctpvChange = async function(){
		SBUxMethod.set("srch-inp-sgg", "");
	}


</script>
</html>