<%
 /**
  * @Class Name : fcltLwtpStrgMchnInfoReg.jsp
  * @Description : 3.5.저온저장고운영 화면
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
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 저온저장고운영 -->
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
							<sbux-button id="srch-btn-dataCopy" name="srch-btn-dataCopy" uitype="normal" text="작년 데이터 복사" onclick="fn_setGrdLtMcIfList(1)" style="font-size: small;" class="btn btn-xs btn-outline-dark"></sbux-button>
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
				<label style="font-weight: bold;">○저온저장고운영 상세내역</label><br>
				<label>* 데이터 입력 시 조사연도의 직전년도 기준으로 작성해주시기 바랍니다.</label>
			</div>
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 10%">
					<col style="width: 125px">
					<col style="width: 21%">
					<col style="width: 28px">
					<col style="width: 21%">
					<col style="width: 28px">
					<col style="width: 21%">
					<col style="width: 28px">
					<col style="width: 21%">
					<col style="width: 28px">
				</colgroup>
				<tbody>
					<tr>
						<th></th>
						<th class="text-center" style="border-right: 1px solid white !important;">보유여부</th>
						<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">
							저장능력(톤)<br>
							*최대저장<br>
						</th>
						<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">
							단기저장실적(톤)<br>
							*단순 출하대기<br>
						</th>
						<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">
							장기저장실적(톤)<br>
							*1개월 이상<br>
						</th>
						<th class="text-center" style="border-right: 1px solid white !important;" colspan="2">
							저장가동률(%)<br>
							*(단기+장기실적)/능력*100<br>
						</th>
					</tr>
					<tr>
						<th style="text-align: center;"><p>저온저장고</p></th>
						<td class="text-center">
							<p class="ad_input_row">
								<sbux-radio id="dtl-rdo-itemChk1" name="dtl-rdo-itemChk" uitype="normal" value="Y" class="radio_label" onchange ="fn_selectOnchange(this)"></sbux-radio>
								<label class="radio_label" for="dtl-rdo-itemChk1">보유</label>
							</p>
							<p class="ad_input_row">
								<sbux-radio id="dtl-rdo-itemChk2" name="dtl-rdo-itemChk" uitype="normal" value="N" class="radio_label" onchange ="fn_selectOnchange(this)"></sbux-radio>
								<label class="radio_label" for="dtl-rdo-itemChk2">미보유</label>
							</p>
							<sbux-checkbox
								id="dtl-inp-itemChk"
								name="dtl-inp-itemChk"
								uitype="hidden"
								text=""
								true-value="Y"
								false-value="N"
								class="check"
								onkeyup ="fn_selectOnchange(this)"
							></sbux-checkbox>
						</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcStrgAblt"
								name="dtl-inp-strgPlcStrgAblt"
								uitype="text"
								class="form-control input-sm"
								group-id="group1"
								placeholder=""
								onkeyup="fn_strgPlcOprtngRt"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>톤</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcStrmStrgAblt"
								name="dtl-inp-strgPlcStrmStrgAblt"
								uitype="text"
								class="form-control input-sm"
								group-id="group1"
								placeholder=""
								onkeyup="fn_strgPlcOprtngRt"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>톤</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcLtrmStrgAblt"
								name="dtl-inp-strgPlcLtrmStrgAblt"
								uitype="text"
								class="form-control input-sm"
								group-id="group1"
								placeholder=""
								onkeyup="fn_strgPlcOprtngRt"
								mask = "{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true, 'digits': 0}"
							></sbux-input>
						</td>
						<td>톤</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcOprtngRt"
								name="dtl-inp-strgPlcOprtngRt"
								uitype="text"
								class="form-control input-sm"
								group-id="group1"
								placeholder=""
								readonly
							></sbux-input>
						</td>
						<td>%</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			</div>
				<br>
				<div>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 22%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">


						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">

						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th></th>
							<th class="text-center">운영안함</th>
							<th class="text-center">전체선택</th>
							<th class="text-center">1월</th>
							<th class="text-center">2월</th>
							<th class="text-center">3월</th>
							<th class="text-center">4월</th>
							<th class="text-center">5월</th>
							<th class="text-center">6월</th>
							<th class="text-center">7월</th>
							<th class="text-center">8월</th>
							<th class="text-center">9월</th>
							<th class="text-center">10월</th>
							<th class="text-center">11월</th>
							<th class="text-center">12월</th>
						</tr>
						<tr>
							<th>저온저장고<br>운영기간
							</th>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_non" name="warehouseSeCd_chk_mon_2_non" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelectNon(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_1" name="warehouseSeCd_chk_mon_2_1" uitype="normal" true-value = "Y" false-value = "N" group-id="group1" onchange="fn_checkSelectAll(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_2" name="warehouseSeCd_chk_mon_2_2" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_3" name="warehouseSeCd_chk_mon_2_3" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_4" name="warehouseSeCd_chk_mon_2_4" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_5" name="warehouseSeCd_chk_mon_2_5" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_6" name="warehouseSeCd_chk_mon_2_6" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_7" name="warehouseSeCd_chk_mon_2_7" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_8" name="warehouseSeCd_chk_mon_2_8" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_9" name="warehouseSeCd_chk_mon_2_9" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_10" name="warehouseSeCd_chk_mon_2_10" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_11" name="warehouseSeCd_chk_mon_2_11" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_12" name="warehouseSeCd_chk_mon_2_12" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
							</td>
							<td class="text-center">
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd_chk_mon_2_13" name="warehouseSeCd_chk_mon_2_13" uitype="normal" true-value = "Y" false-value = "N" group-id="group2" onchange="fn_checkSelect(this,2)"></sbux-checkbox>
									<label class="check_label" for="check_default" ></label>
								</p>
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

		fn_init();
	})

	/* 초기세팅 */
	const fn_init = async function() {

		await fn_selectUserApcList();//선택가능한 APC리스트 조회

		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			return;
		}
		await fn_search();//데이터 조회

		await cfn_selectPrgrs();//진척도

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
		SBUxMethod.changeGroupAttr('group1','disabled','true');
		SBUxMethod.changeGroupAttr('group2','disabled','true');
		SBUxMethod.clearGroupData('group1');
		SBUxMethod.clearGroupData('group2');
		SBUxMethod.set('dtl-rdo-itemChk',null);
	}

	const fn_search = async function() {
		if(gfn_isEmpty(SBUxMethod.get("srch-inp-apcCd"))){
			alert('APC를 선택해주세요');
			return;
		}
		fn_clearForm();
		fn_setGrdLtMcIfList();
	}

	const fn_setGrdLtMcIfList = async function(copy_chk) {
		 console.log("******************fn_setGrdLtMcIfList**********************************");

		let apcCd = SBUxMethod.get("srch-inp-apcCd");
		let crtrYr = SBUxMethod.get("srch-inp-crtrYr");

		//전년도 데이터
		if(!gfn_isEmpty(copy_chk)){
			crtrYr = parseFloat(crtrYr) - parseFloat(copy_chk);
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/selectFcltLwtpStrgMchnInfoList.do", {
			apcCd: apcCd,
			crtrYr: crtrYr
		});

		const data = await postJsonPromise;
		//await 오류시 확인

		//예외처리
		try {
			console.log(data);
			data.resultList.forEach((item, index) => {
				let lwtpStrgPlcHldYn = item.lwtpStrgPlcHldYn;//보유현황

				if(lwtpStrgPlcHldYn == 'N'){
					SBUxMethod.changeGroupAttr('group1','disabled','true');
					SBUxMethod.changeGroupAttr('group2','disabled','true');
					SBUxMethod.set('dtl-rdo-itemChk','N');
				}else if(lwtpStrgPlcHldYn == 'Y'){
					SBUxMethod.changeGroupAttr('group1','disabled','false');
					SBUxMethod.changeGroupAttr('group2','disabled','false');
					SBUxMethod.set('dtl-rdo-itemChk','Y');
					SBUxMethod.set('dtl-inp-strgPlcStrgAblt',item.strgPlcStrgAblt);
					SBUxMethod.set('dtl-inp-strgPlcStrmStrgAblt',item.strgPlcStrmStrgAblt);
					SBUxMethod.set('dtl-inp-strgPlcLtrmStrgAblt',item.strgPlcLtrmStrgAblt);
					//SBUxMethod.set('dtl-inp-strgPlcOprtngRt',item.strgPlcOprtngRt);

					//저장 가동률 계산
					fn_strgPlcOprtngRt();

					//운영 안함 여부
					let operNonYn = item.operYn == "Y" ? "N" : "Y";
					SBUxMethod.set('warehouseSeCd_chk_mon_2_non', operNonYn);
					//SBUxMethod.set('warehouseSeCd_chk_mon_2_1',item.operPeriodYn);

					if(item.operYn == 'Y'){
						SBUxMethod.set('warehouseSeCd_chk_mon_2_2',item.operPeriodYn1);
						SBUxMethod.set('warehouseSeCd_chk_mon_2_3',item.operPeriodYn2);
						SBUxMethod.set('warehouseSeCd_chk_mon_2_4',item.operPeriodYn3);
						SBUxMethod.set('warehouseSeCd_chk_mon_2_5',item.operPeriodYn4);
						SBUxMethod.set('warehouseSeCd_chk_mon_2_6',item.operPeriodYn5);
						SBUxMethod.set('warehouseSeCd_chk_mon_2_7',item.operPeriodYn6);
						SBUxMethod.set('warehouseSeCd_chk_mon_2_8',item.operPeriodYn7);
						SBUxMethod.set('warehouseSeCd_chk_mon_2_9',item.operPeriodYn8);
						SBUxMethod.set('warehouseSeCd_chk_mon_2_10',item.operPeriodYn9);
						SBUxMethod.set('warehouseSeCd_chk_mon_2_11',item.operPeriodYn10);
						SBUxMethod.set('warehouseSeCd_chk_mon_2_12',item.operPeriodYn11);
						SBUxMethod.set('warehouseSeCd_chk_mon_2_13',item.operPeriodYn12);

						//fn_checkSelect(null,2);
					}
				}
			});
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
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

		fn_subInsert(confirm("등록 하시겠습니까?") , "N");
	};

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

		let itemChk = SBUxMethod.get('dtl-rdo-itemChk');

		let saveList = {
				crtrYr : SBUxMethod.get('srch-inp-crtrYr')
				,apcCd : SBUxMethod.get('srch-inp-apcCd')
				, prgrsYn : 'Y' //진척도 갱신 여부
				, tmprStrgYn : tmpChk//임시저장 여부
				,lwtpStrgPlcHldYn: itemChk
				,strgPlcStrgAblt: gfn_nvl(SBUxMethod.get('dtl-inp-strgPlcStrgAblt'))
				,strgPlcStrmStrgAblt: gfn_nvl(SBUxMethod.get('dtl-inp-strgPlcStrmStrgAblt'))
				,strgPlcLtrmStrgAblt: gfn_nvl(SBUxMethod.get('dtl-inp-strgPlcLtrmStrgAblt'))
				,strgPlcOprtngRt: gfn_nvl(SBUxMethod.get('dtl-inp-strgPlcOprtngRt'))
		};

		if(itemChk == 'Y'){
			let operYn = $('#warehouseSeCd_chk_mon_2_non').val() == "Y" ? "N" : "Y";//운영안함 여부
			saveList.operYn = operYn;
			if(operYn == 'Y'){
				//saveList.operPeriodYn = $('#warehouseSeCd_chk_mon_2_1').val();//전체선택
				saveList.operPeriodYn1 = $('#warehouseSeCd_chk_mon_2_2').val();
				saveList.operPeriodYn2 = $('#warehouseSeCd_chk_mon_2_3').val();
				saveList.operPeriodYn3 = $('#warehouseSeCd_chk_mon_2_4').val();
				saveList.operPeriodYn4 = $('#warehouseSeCd_chk_mon_2_5').val();
				saveList.operPeriodYn5 = $('#warehouseSeCd_chk_mon_2_6').val();
				saveList.operPeriodYn6 = $('#warehouseSeCd_chk_mon_2_7').val();
				saveList.operPeriodYn7 = $('#warehouseSeCd_chk_mon_2_8').val();
				saveList.operPeriodYn8 = $('#warehouseSeCd_chk_mon_2_9').val();
				saveList.operPeriodYn9 = $('#warehouseSeCd_chk_mon_2_10').val();
				saveList.operPeriodYn10 = $('#warehouseSeCd_chk_mon_2_11').val();
				saveList.operPeriodYn11 = $('#warehouseSeCd_chk_mon_2_12').val();
				saveList.operPeriodYn12 = $('#warehouseSeCd_chk_mon_2_13').val();
			}
		}

		const postJsonPromise = gfn_postJSON("/fm/fclt/insertFcltLwtpStrgMchnInfo.do", saveList);

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

	function fn_selectOnchange(e){
		//console.log(e);
		if($(e).val() == 'Y'){
			SBUxMethod.changeGroupAttr("group1",'disabled','false');
			SBUxMethod.changeGroupAttr("group2",'disabled','false');
		}else{
			SBUxMethod.changeGroupAttr("group1",'disabled','true');
			SBUxMethod.changeGroupAttr("group2",'disabled','true');
			SBUxMethod.clearGroupData("group1");
			SBUxMethod.clearGroupData("group2");
		}
	}

	// 전체선택 체크박스
	const fn_checkSelectAll = function(e,num) {
		//let targetVal = SBUxMethod.get(e.name).e.name;
		let targetVal = $('#'+e.name).val();
		if(targetVal == 'Y'){
			SBUxMethod.set('warehouseSeCd_chk_mon_'+num+'_non','N');
		}

		//sbux-checkbox id에 '-' 빼기 기호 사용시 문제가 생김 '_' 언더바 사용
		for (var i = 1; i < 14; i++) {
			SBUxMethod.set('warehouseSeCd_chk_mon_'+num+'_'+i,targetVal);
		}
	}

	// 운영안함 체크박스
	const fn_checkSelectNon = function(e,num) {
		//let targetVal = SBUxMethod.get(e.name).e.name;
		let targetVal = $('#'+e.name).val();
		if(targetVal == 'Y'){
			//sbux-checkbox id에 '-' 빼기 기호 사용시 문제가 생김 '_' 언더바 사용
			for (var i = 1; i < 14; i++) {
				SBUxMethod.set('warehouseSeCd_chk_mon_'+num+'_'+i,'N');
			}
		}
	}


	// 체크박스 선택시 전체선택 변경
	const fn_checkSelect = function(e,num) {

		let targetVal = $('#'+e.name).val();
		if(targetVal == 'Y'){
			SBUxMethod.set('warehouseSeCd_chk_mon_'+num+'_non','N');
		}

		//group 길이 랑 'Y' 값 갯수 비교
		let group = SBUxMethod.getGroupData('group'+num);
		let trueCnt = 0;
		for (var i = 0; i < group.length; i++) {
			let chkVal = Object.values(group[i].component_value);
			if(chkVal[0] == 'Y'){
				trueCnt++;
			}
		}
		//let allChkVal = ;
		SBUxMethod.set('warehouseSeCd_chk_mon_'+num+'_1',group.length == trueCnt ? 'Y' : 'N');
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

	const fn_strgPlcOprtngRt = async function() {
		let strgPlcStrgAblt = gfn_nvl(SBUxMethod.get('dtl-inp-strgPlcStrgAblt')) == "" ? 0 : parseFloat(SBUxMethod.get('dtl-inp-strgPlcStrgAblt'));
		let strgPlcStrmStrgAblt = gfn_nvl(SBUxMethod.get('dtl-inp-strgPlcStrmStrgAblt')) == "" ? 0 : parseFloat(SBUxMethod.get('dtl-inp-strgPlcStrmStrgAblt'));
		let strgPlcLtrmStrgAblt = gfn_nvl(SBUxMethod.get('dtl-inp-strgPlcLtrmStrgAblt')) == "" ? 0 : parseFloat(SBUxMethod.get('dtl-inp-strgPlcLtrmStrgAblt'));

		let result = ( ( strgPlcStrmStrgAblt + strgPlcLtrmStrgAblt ) / strgPlcStrgAblt) * 100 ;
		SBUxMethod.set('dtl-inp-strgPlcOprtngRt',result.toFixed(2));
	}

	//최종제출 여부 체크
	function fn_prgrsLastChk(){
		//최종제출 여부
		let prgrsLast = SBUxMethod.get('dtl-inp-prgrsLast');
		console.log("prgrsLast = " + prgrsLast);
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

</script>
</html>