<%
 /**
  * @Class Name : fcltUnityMngInfoReg.jsp
  * @Description : 4.3.통합고나리시스템 활용현황 화면
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
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 통합관리시스템 활용현황 -->
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
							<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_selectUniMnIfList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
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

			<div><label style="font-weight: bold;">통합관리시스템활용 상세내역</label></div>
			<div><label>- 활용하신다면 어떤 작업단계까지 활용하고 계십니까? 해당하는 곳에 체크해 주십시오</label></div>

			<div>
				<table class="table table-bordered tbl_row tbl_fixed" style="width: 800px">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 5%">
						<col style="width: 20%">
						<col style="width: 5%">
						<col style="width: 20%">
						<col style="width: 5%">
						<col style="width: 20%">
						<col style="width: 5%">
					</colgroup>
						<tbody>
							<tr>
								<th>생산정보</th>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="dtl-inp-umsPrdctnInfo" name="dtl-inp-umsPrdctnInfo" uitype="normal" true-value = "Y" false-value = "N"></sbux-checkbox>
										<label class="check_label" for="dtl-inp-umsPrdctnInfo" ></label>
									</p>
								</td>
								<th>계량정보</th>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="dtl-inp-umsWghInfo" name="dtl-inp-umsWghInfo" uitype="normal" true-value = "Y" false-value = "N"></sbux-checkbox>
										<label class="check_label" for="dtl-inp-umsWghInfo" ></label>
									</p>
								</td>
								<th>입고정보</th>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="dtl-inp-umsWrhsInfo" name="dtl-inp-umsWrhsInfo" uitype="normal" true-value = "Y" false-value = "N"></sbux-checkbox>
										<label class="check_label" for="dtl-inp-umsWrhsInfo" ></label>
									</p>
								</td>
								<th>선별정보</th>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="dtl-inp-umsSortInfo" name="dtl-inp-umsSortInfo" uitype="normal" true-value = "Y" false-value = "N"></sbux-checkbox>
										<label class="check_label" for="dtl-inp-umsSortInfo" ></label>
									</p>
								</td>

							</tr>
							<tr>
								<th>저장정보</th>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="dtl-inp-umsStrgInfo" name="dtl-inp-umsStrgInfo" uitype="normal" true-value = "Y" false-value = "N"></sbux-checkbox>
										<label class="check_label" for="dtl-inp-umsStrgInfo" ></label>
									</p>
								</td>
								<th>포장정보</th>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="dtl-inp-umsPckgInfo" name="dtl-inp-umsPckgInfo" uitype="normal" true-value = "Y" false-value = "N"></sbux-checkbox>
										<label class="check_label" for="dtl-inp-umsPckgInfo" ></label>
									</p>
								</td>
								<th>출고정보</th>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="dtl-inp-umsSpmtInfo" name="dtl-inp-umsSpmtInfo" uitype="normal" true-value = "Y" false-value = "N"></sbux-checkbox>
										<label class="check_label" for="dtl-inp-umsSpmtInfo" ></label>
									</p>
								</td>
								<th>정산정보</th>
								<td>
									<p class="ad_input_row">
										<sbux-checkbox id="dtl-inp-umsClclnInfo" name="dtl-inp-umsClclnInfo" uitype="normal" true-value = "Y" false-value = "N"></sbux-checkbox>
										<label class="check_label" for="dtl-inp-umsClclnInfo" ></label>
									</p>
								</td>

							</tr>
						</tbody>
					</table>
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
		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			return;
		}
		await fn_clearForm();

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

	const fn_clearForm = async function() {
		SBUxMethod.set('dtl-inp-umsPrdctnInfo',"N");
		SBUxMethod.set('dtl-inp-umsWghInfo',"N");
		SBUxMethod.set('dtl-inp-umsWrhsInfo',"N");
		SBUxMethod.set('dtl-inp-umsSortInfo',"N");
		SBUxMethod.set('dtl-inp-umsStrgInfo',"N");
		SBUxMethod.set('dtl-inp-umsPckgInfo',"N");
		SBUxMethod.set('dtl-inp-umsSpmtInfo',"N");
		SBUxMethod.set('dtl-inp-umsClclnInfo',"N");
	}

	const fn_search = async function() {
		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			alert('APC를 선택해주세요');
			return;
		}
		await fn_clearForm();
		await fn_selectUniMnIfList();
	}

	const fn_selectUniMnIfList = async function(copy_chk) {
		 console.log("******************fn_pagingUniMnIfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		//전년도 데이터
		if(!gfn_isEmpty(copy_chk)){
			crtrYr = parseFloat(crtrYr) - parseFloat(copy_chk);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltUnityMngInfoList.do", {
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
				SBUxMethod.set('dtl-inp-umsPrdctnInfo',item.umsPrdctnInfo);
				SBUxMethod.set('dtl-inp-umsWghInfo',item.umsWghInfo);
				SBUxMethod.set('dtl-inp-umsWrhsInfo',item.umsWrhsInfo);
				SBUxMethod.set('dtl-inp-umsSortInfo',item.umsSortInfo);
				SBUxMethod.set('dtl-inp-umsStrgInfo',item.umsStrgInfo);
				SBUxMethod.set('dtl-inp-umsPckgInfo',item.umsPckgInfo);
				SBUxMethod.set('dtl-inp-umsSpmtInfo',item.umsSpmtInfo);
				SBUxMethod.set('dtl-inp-umsClclnInfo',item.umsClclnInfo);
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

		fn_subInsert(confirm("등록 하시겠습니까?") , 'N');
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
		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltUnityMngInfo.do", {
			crtrYr : SBUxMethod.get('srch-inp-crtrYr')
			,apcCd : SBUxMethod.get('srch-inp-apcCd')
			, prgrsYn : 'Y' //진척도 갱신 여부
			, tmprStrgYn : tmpChk//임시저장 여부

			,umsPrdctnInfo : $('#dtl-inp-umsPrdctnInfo').val()
			,umsWghInfo : $('#dtl-inp-umsWghInfo').val()
			,umsWrhsInfo : $('#dtl-inp-umsWrhsInfo').val()
			,umsSortInfo : $('#dtl-inp-umsSortInfo').val()
			,umsStrgInfo : $('#dtl-inp-umsStrgInfo').val()
			,umsPckgInfo : $('#dtl-inp-umsPckgInfo').val()
			,umsSpmtInfo : $('#dtl-inp-umsSpmtInfo').val()
			,umsClclnInfo : $('#dtl-inp-umsClclnInfo').val()
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

</script>
</html>