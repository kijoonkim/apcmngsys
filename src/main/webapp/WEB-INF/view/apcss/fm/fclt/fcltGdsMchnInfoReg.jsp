 <%
 /**
  * @Class Name : fcltGdsMchnInfoReg.jsp
  * @Description : 3.2.상품화설비현황 화면
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 상품화설비현황 -->
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
							<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_setGrdGdsMcList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
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
				<label style="font-weight: bold;">○상품화설비현황 상세내역</label><br>
				<label>* 해당 APC에서 소유하고 있는 품목별 선별기 모두 기재</label><br>
				<label>* 데이터 입력 시 조사연도의 직전년도 기준으로 작성해주시기 바랍니다.</label>
			</div>
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 12%">
					<col style="width: 85px">
					<col style="width: 24%">
					<col style="width: 24%">
					<col style="width: 70px">
					<col style="width: 85px">
					<col style="width: 85px">
					<col style="width: 25%">
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center">선별기</th>
						<th class="text-center">보유여부</th>
						<th class="text-center">규격</th>
						<th class="text-center">제조사</th>
						<th class="text-center">당도기</th>
						<th class="text-center">색택선별</th>
						<th class="text-center">형상선별</th>
						<th class="text-center">가공설비</th>
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
						<td>
							<sbux-input id="dtl-inp-sortMchnSpcfct1" name="dtl-inp-sortMchnSpcfct1" uitype="text" class="form-control input-sm" group-id="group1" placeholder="2대x1조 32등급"></sbux-input>
						</td>
						<td>
							<sbux-input id="dtl-inp-mkrNm1" name="dtl-inp-mkrNm1" uitype="text" class="form-control input-sm" group-id="group1" placeholder=""></sbux-input>
						</td>
						<td class="text-center">
							<sbux-checkbox
									id="dtl-inp-sortBrckMchn1"
									name="dtl-inp-sortBrckMchn1"
									uitype="normal"
									text=""
									true-value="Y"
									false-value="N"
									group-id="group1"
									></sbux-checkbox>
						</td>
						<td class="text-center">
							<sbux-checkbox
									id="dtl-inp-colorSort1"
									name="dtl-inp-colorSort1"
									uitype="normal"
									text=""
									true-value="Y"
									false-value="N"
									group-id="group1"
									></sbux-checkbox>
						</td>
						<td class="text-center">
							<sbux-checkbox
									id="dtl-inp-shapSort1"
									name="dtl-inp-shapSort1"
									uitype="normal"
									text=""
									true-value="Y"
									false-value="N"
									group-id="group1"
									></sbux-checkbox>
						</td>
						<td>
							<sbux-input id="dtl-inp-mnfcMchn1" name="dtl-inp-mnfcMchn1" uitype="text" class="form-control input-sm" group-id="group1" placeholder="착즙기, 커팅기 등" ></sbux-input>
						</td>
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
									onchange ="fn_selectOnchange(this,'group2')"
									></sbux-checkbox>
						</td>
						<td>
							<sbux-input id="dtl-inp-sortMchnSpcfct2" name="dtl-inp-sortMchnSpcfct2" uitype="text" class="form-control input-sm" group-id="group2" placeholder="2대x1조 32등급"></sbux-input>
						</td>
						<td>
							<sbux-input id="dtl-inp-mkrNm2" name="dtl-inp-mkrNm2" uitype="text" class="form-control input-sm" group-id="group2" placeholder="" ></sbux-input>
						</td>
						<td class="text-center">
							<sbux-checkbox
									id="dtl-inp-sortBrckMchn2"
									name="dtl-inp-sortBrckMchn2"
									uitype="normal"
									text=""
									true-value="Y"
									false-value="N"
									group-id="group2"
									></sbux-checkbox>
						</td>
						<td class="text-center">
							<sbux-checkbox
									id="dtl-inp-colorSort2"
									name="dtl-inp-colorSort2"
									uitype="normal"
									text=""
									true-value="Y"
									false-value="N"
									group-id="group2"
									></sbux-checkbox>
						</td>
						<td class="text-center">
							<sbux-checkbox
									id="dtl-inp-shapSort2"
									name="dtl-inp-shapSort2"
									uitype="normal"
									text=""
									true-value="Y"
									false-value="N"
									group-id="group2"
									></sbux-checkbox>
						</td>
						<td>
							<sbux-input id="dtl-inp-mnfcMchn2" name="dtl-inp-mnfcMchn2" uitype="text" class="form-control input-sm" group-id="group2" placeholder="착즙기, 커팅기 등" ></sbux-input>
						</td>
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
									onchange ="fn_selectOnchange(this,'group3')"
									></sbux-checkbox>
						</td>
						<td>
							<sbux-input id="dtl-inp-sortMchnSpcfct3" name="dtl-inp-sortMchnSpcfct3" uitype="text" class="form-control input-sm" group-id="group3" placeholder="2대x1조 32등급" ></sbux-input>
						</td>
						<td>
							<sbux-input id="dtl-inp-mkrNm3" name="dtl-inp-mkrNm3" uitype="text" class="form-control input-sm" group-id="group3" placeholder="" ></sbux-input>
						</td>
						<td class="text-center">
							<sbux-checkbox
									id="dtl-inp-sortBrckMchn3"
									name="dtl-inp-sortBrckMchn3"
									uitype="normal"
									text=""
									true-value="Y"
									false-value="N"
									group-id="group3"
									></sbux-checkbox>
						</td>
						<td class="text-center">
							<sbux-checkbox
									id="dtl-inp-colorSort3"
									name="dtl-inp-colorSort3"
									uitype="normal"
									text=""
									true-value="Y"
									false-value="N"
									group-id="group3"
									></sbux-checkbox>
						</td>
						<td class="text-center">
							<sbux-checkbox
									id="dtl-inp-shapSort3"
									name="dtl-inp-shapSort3"
									uitype="normal"
									text=""
									true-value="Y"
									false-value="N"
									group-id="group3"
									></sbux-checkbox>
						</td>
						<td>
							<sbux-input id="dtl-inp-mnfcMchn3" name="dtl-inp-mnfcMchn3" uitype="text" class="form-control input-sm" group-id="group3" placeholder="착즙기, 커팅기 등" ></sbux-input>
						</td>
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
									onchange ="fn_selectOnchange(this,'group4')"
									></sbux-checkbox>
						</td>
						<td>
							<sbux-input id="dtl-inp-sortMchnSpcfct4" name="dtl-inp-sortMchnSpcfct4" uitype="text" class="form-control input-sm" group-id="group4" placeholder="2대x1조 32등급"></sbux-input>
						</td>
						<td>
							<sbux-input id="dtl-inp-mkrNm4" name="dtl-inp-mkrNm4" uitype="text" class="form-control input-sm" group-id="group4" placeholder=""></sbux-input>
						</td>
						<td class="text-center">
							<sbux-checkbox
									id="dtl-inp-sortBrckMchn4"
									name="dtl-inp-sortBrckMchn4"
									uitype="normal"
									text=""
									true-value="Y"
									false-value="N"
									group-id="group4"
									></sbux-checkbox>
						</td>
						<td class="text-center">
							<sbux-checkbox
									id="dtl-inp-colorSort4"
									name="dtl-inp-colorSort4"
									uitype="normal"
									text=""
									true-value="Y"
									false-value="N"
									group-id="group4"
									></sbux-checkbox>
						</td>
						<td class="text-center">
							<sbux-checkbox
									id="dtl-inp-shapSort4"
									name="dtl-inp-shapSort4"
									uitype="normal"
									text=""
									true-value="Y"
									false-value="N"
									group-id="group4"
									></sbux-checkbox>
						</td>
						<td>
							<sbux-input id="dtl-inp-mnfcMchn4" name="dtl-inp-mnfcMchn4" uitype="text" class="form-control input-sm" group-id="group4" placeholder="착즙기, 커팅기 등" ></sbux-input>
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

	// 기준연도
	var jsonCrtrYr = [];
	// 전년도
	var jsonPrevData = [];

	window.addEventListener('DOMContentLoaded', function(e) {
		let date = new Date();
		let year  = date.getFullYear();
		SBUxMethod.set("srch-inp-crtrYr", year);//trgtYr -> crtrYr 변경

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

	});

	const fn_initSBSelect = async function() {
		await gfn_getApcSurveyCrtrYr('srch-slt-crtrYr',jsonCrtrYr); // 연도
	}

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {

		await fn_initSBSelect();

		await fn_selectUserApcList();//선택가능한 APC리스트 조회

		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			return;
		}

		//진척도
		await cfn_selectPrgrs();
		await fn_search();
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
	const fn_clearForm = async function() {
		for (var i = 1; i < 5; i++) {
			SBUxMethod.changeGroupAttr('group'+i,'disabled','true');
			SBUxMethod.clearGroupData('group'+i);
			SBUxMethod.attr('dtl-inp-sortMchnHoldYn'+i,'disabled','true');

 			SBUxMethod.set('dtl-inp-sortMchnHoldYn'+i,'N');
			SBUxMethod.set('dtl-inp-itemChk'+i ,null);

			SBUxMethod.set("dtl-inp-sortMchnSpcfct"+i, null);
			SBUxMethod.set("dtl-inp-sortBrckMchn"+i, null);
			SBUxMethod.set("dtl-inp-colorSort"+i, null);
			SBUxMethod.set("dtl-inp-shapSort"+i, null);
			SBUxMethod.set("dtl-inp-mnfcMchn"+i, null);
			//제조사 추가
			SBUxMethod.set("dtl-inp-mkrNm"+i, null);

			SBUxMethod.set('dtl-inp-itemCd'+i ,null);
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

		await fn_setGrdGdsMcList();
		// 전년도
		await fn_setGrdGdsMcList("Y");
	}

	/**
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdGdsMcList = async function(prevData) {
		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-slt-crtrYr");

		jsonPrevData.length = 0;
		//전년도 데이터
		if(!gfn_isEmpty(prevData) && _.isEqual(prevData,"Y")){
			crtrYr = parseFloat(crtrYr) - 1;
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltGdsMchnInfoList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr
		});

		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			if (_.isEqual(prevData,"Y")) {
				jsonPrevData = data.resultList;
			} else {
				data.resultList.forEach((item, index) => {
					//품목 번호 item.sn 1~4
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
					SBUxMethod.attr('dtl-inp-sortMchnHoldYn' + sn, 'disabled', 'false');
					SBUxMethod.set('dtl-inp-sortMchnHoldYn' + sn, sortMchnHoldYn);

					if (sortMchnHoldYn == 'Y') {
						SBUxMethod.changeGroupAttr('group' + sn, 'disabled', 'false');//선별기보유 할경우 해당 그룹 활성화
						SBUxMethod.set("dtl-inp-sortMchnSpcfct" + sn, gfn_nvl(item.sortMchnSpcfct));
						SBUxMethod.set("dtl-inp-sortBrckMchn" + sn, gfn_nvl(item.sortBrckMchn));
						SBUxMethod.set("dtl-inp-colorSort" + sn, gfn_nvl(item.colorSort));
						SBUxMethod.set("dtl-inp-shapSort" + sn, gfn_nvl(item.shapSort));
						SBUxMethod.set("dtl-inp-mnfcMchn" + sn, gfn_nvl(item.mnfcMchn));
						//제조사 추가
						SBUxMethod.set("dtl-inp-mkrNm" + sn, gfn_nvl(item.mkrNm));
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
		const apcCd = SBUxMethod.get("srch-inp-apcCd");
		const crtrYr = SBUxMethod.get("srch-slt-crtrYr");
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

		// 저장시 선별기 보유여부 체크시 규격,제조사 입력 필요
		for (var i = 1; i <= 4; i++) {
			let itemChk = SBUxMethod.get('dtl-inp-itemChk'+i);
			if(itemChk == 'Y'){
				let sortMchnHoldYn = $('#dtl-inp-sortMchnHoldYn'+i).val();
				if(sortMchnHoldYn == 'Y'){
					let mag;
					if (i !== 4 ){
						msg = "품목" + i;
					} else {
						msg = "기타품목"
					}
					const spcfct = SBUxMethod.get('dtl-inp-sortMchnSpcfct'+i);
					if (gfn_isEmpty(spcfct)) {
						gfn_comAlert("W0002",msg + " 규격"); // W0002  {0}을/를 입력하세요.
						return;
					}

					const mrkNm = SBUxMethod.get('dtl-inp-mkrNm'+i);
					if (gfn_isEmpty(mrkNm)) {
						gfn_comAlert("W0002",msg + " 제조사"); // W0002  {0}을/를 입력하세요.
						return;
					}
				}
			}
		}

		return;
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

		let saveList = [];

		for (var i = 1; i <= 4; i++) {

			let itemChk = SBUxMethod.get('dtl-inp-itemChk'+i);
			//품목이 존재하는경우만 저장
			if(itemChk == 'Y'){
				let sortMchnHoldYn = $('#dtl-inp-sortMchnHoldYn'+i).val();
				let itemVo = {
						sn : i
						,crtrYr : SBUxMethod.get('srch-slt-crtrYr')
						,apcCd : SBUxMethod.get('srch-inp-apcCd')
						,sortMchnHoldYn : sortMchnHoldYn
						, prgrsYn : 'Y' //진척도 갱신 여부
						, tmprStrgYn : tmpChk//임시저장 여부
				}
				if(sortMchnHoldYn == 'Y'){
					itemVo.sortMchnSpcfct = gfn_nvl(SBUxMethod.get('dtl-inp-sortMchnSpcfct'+i));
					itemVo.sortBrckMchn = $('#dtl-inp-sortBrckMchn'+i).val();
					itemVo.colorSort = $('#dtl-inp-colorSort'+i).val();
					itemVo.shapSort = $('#dtl-inp-shapSort'+i).val();
					itemVo.mnfcMchn = gfn_nvl(SBUxMethod.get('dtl-inp-mnfcMchn'+i));
					itemVo.mkrNm = gfn_nvl(SBUxMethod.get('dtl-inp-mkrNm'+i));
				}
				saveList.push(itemVo);
			}
		}

		if(saveList.length == 0){
			alert("저장할 값이 없습니다");
			return;
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/multiSaveFcltGdsMchnInfo.do",saveList);

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
		await fn_clearForm();
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
		//진척도 갱신
		await cfn_selectPrgrs();
		await fn_search();
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

	function fn_pySearch() {

		if (gfn_isEmpty(jsonPrevData)) return;

		for (let i =1; i < 5; i++) {
			SBUxMethod.changeGroupAttr('group'+i,'disabled','true');
			SBUxMethod.clearGroupData('group'+i);
			SBUxMethod.attr('dtl-inp-sortMchnHoldYn'+i,'disabled','true');
			SBUxMethod.set('dtl-inp-sortMchnHoldYn' + i, "N");
			let isExist = false;
			if (SBUxMethod.get('dtl-inp-itemChk' + i) === 'Y') {
				isExist = true;
			}
			if (isExist) {
				// SBUxMethod.changeGroupAttr('group' + i, 'disabled', 'false');
				SBUxMethod.attr('dtl-inp-sortMchnHoldYn' + i, 'disabled', 'false');
			}
		}

		jsonPrevData.forEach(item => {
			const sn = item.sn;
			const itemCd = SBUxMethod.get('dtl-inp-itemCd'+sn);

			if (_.isEqual(SBUxMethod.get('dtl-inp-itemChk' + sn), "Y") && (
					(sn === 4 && _.isEqual(itemCd, item.itemNm)) ||
					(sn !== 4 && _.isEqual(itemCd, item.itemCd)))) {
				let sortMchnHoldYn = item.sortMchnHoldYn;
				SBUxMethod.set('dtl-inp-sortMchnHoldYn' + sn, sortMchnHoldYn);
				if (sortMchnHoldYn == 'Y') {
					SBUxMethod.changeGroupAttr('group' + sn, 'disabled', 'false');//선별기보유 할경우 해당 그룹 활성화
					SBUxMethod.set("dtl-inp-sortMchnSpcfct" + sn, gfn_nvl(item.sortMchnSpcfct));
					SBUxMethod.set("dtl-inp-sortBrckMchn" + sn, gfn_nvl(item.sortBrckMchn));
					SBUxMethod.set("dtl-inp-colorSort" + sn, gfn_nvl(item.colorSort));
					SBUxMethod.set("dtl-inp-shapSort" + sn, gfn_nvl(item.shapSort));
					SBUxMethod.set("dtl-inp-mnfcMchn" + sn, gfn_nvl(item.mnfcMchn));
					//제조사 추가
					SBUxMethod.set("dtl-inp-mkrNm" + sn, gfn_nvl(item.mkrNm));
				}
			}
		});
	}
</script>
</html>