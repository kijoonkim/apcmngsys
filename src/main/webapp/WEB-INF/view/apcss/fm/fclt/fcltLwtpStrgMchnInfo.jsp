<%
 /**
  * @Class Name : fcltLwtpStrgMchnInfo.jsp
  * @Description : 저온저장고운영 화면
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
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 저온저장고운영 -->
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
						<td colspan="12" style="border-right: hidden;">&nbsp;</td>
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
			<div><label>저온저장고운영 상세내역</label></div>
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
								onchange ="fn_selectOnchange(this)"
							></sbux-checkbox>
						</td>
						<td style="border-right:hidden; padding-right: 0px !important;">
							<sbux-input
								id="dtl-inp-strgPlcStrgAblt"
								name="dtl-inp-strgPlcStrgAblt"
								uitype="text"
								class="form-control input-sm"
								group-id="group1"
								placeholder="1,000"
								onchange="fn_strgPlcOprtngRt"
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
								placeholder="100"
								onchange="fn_strgPlcOprtngRt"
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
								placeholder="2,000"
								onchange="fn_strgPlcOprtngRt"
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
								placeholder="210"
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
		//SBUxMethod.set("srch-inp-apcNm", apcNm);
		</c:if>

		fn_init();
	})

	/* 초기세팅 */
	const fn_init = async function() {
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

	const fn_setGrdLtMcIfList = async function(copy_chk) {
		 console.log("******************fn_setGrdLtMcIfList**********************************");

		let apcCd = SBUxMethod.get("dtl-inp-apcCd");
		let crtrYr = SBUxMethod.get("dtl-inp-crtrYr");

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

			data.resultList.forEach((item, index) => {
				let lwtpStrgPlcHldMthd = item.lwtpStrgPlcHldMthd;//보유현황
				if(lwtpStrgPlcHldMthd == '0'){
					SBUxMethod.changeGroupAttr('group1','disabled','true');
					SBUxMethod.changeGroupAttr('group2','disabled','true');
					SBUxMethod.set('dtl-rdo-itemChk','N');
				}else if(lwtpStrgPlcHldMthd == '1'){
					SBUxMethod.changeGroupAttr('group1','disabled','false');
					SBUxMethod.changeGroupAttr('group2','disabled','false');
					SBUxMethod.set('dtl-rdo-itemChk','Y');
					SBUxMethod.set('dtl-inp-strgPlcStrgAblt',item.strgPlcStrgAblt);
					SBUxMethod.set('dtl-inp-strgPlcStrmStrgAblt',item.strgPlcStrmStrgAblt);
					SBUxMethod.set('dtl-inp-strgPlcLtrmStrgAblt',item.strgPlcLtrmStrgAblt);
					SBUxMethod.set('dtl-inp-strgPlcOprtngRt',item.strgPlcOprtngRt);

					SBUxMethod.set('warehouseSeCd_chk_mon_2_non',item.operYn);
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
						fn_checkSelect(null,2);
					}
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
	};



	//신규등록
	const fn_subInsert = async function (isConfirmed){
		console.log("******************fn_subInsert**********************************");
		if (!isConfirmed) return;

		let itemChk = SBUxMethod.get('dtl-rdo-itemChk');

		let saveList = {
				crtrYr : SBUxMethod.get('dtl-inp-crtrYr')
				,apcCd : SBUxMethod.get('dtl-inp-apcCd')
				, prgrsYn : 'Y' //진척도 갱신 여부
				,lwtpStrgPlcHldYn: itemChk
				,storCap: SBUxMethod.get('srch-inp-opera2')
				,stStorPerfm: SBUxMethod.get('srch-inp-opera3')
				,ltStorPerfm: SBUxMethod.get('srch-inp-opera4')
				,storOpRate: SBUxMethod.get('srch-inp-opera5')
		};

		if(itemChk == 'Y'){
			let operYn = $('#warehouseSeCd_chk_mon_2_non').val();//운영안함 여부
			saveList.operYn = operYn;
			if(operYn == 'N'){
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
			} else {
				alert(data.resultMessage);
			}
		} catch(e) {
		}
		// 결과 확인 후 재조회
		console.log("insert result", data);
	}

	function fn_selectOnchange(e){
		console.log(e);
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
	const fn_setApc = function(apc) {
		if (!gfn_isEmpty(apc)) {
			SBUxMethod.set('srch-inp-apcCd', apc.apcCd);
			SBUxMethod.set('srch-inp-apcNm', apc.apcNm);
		}
	}

	const fn_strgPlcOprtngRt = async function() {
		let strgPlcStrgAblt = parseFloat(SBUxMethod.get('dtl-inp-strgPlcStrgAblt'));
		let strgPlcStrmStrgAblt = parseFloat(SBUxMethod.get('dtl-inp-strgPlcStrmStrgAblt'));
		let strgPlcLtrmStrgAblt = parseFloat(SBUxMethod.get('dtl-inp-strgPlcLtrmStrgAblt'));

		let result = ( strgPlcStrmStrgAblt + strgPlcLtrmStrgAblt ) / strgPlcStrgAblt ;
		SBUxMethod.set('dtl-inp-strgPlcOprtngRt',result);
	}

	//탭열린 상태에서 해당 페이지 다시 왔을떄 이벤트
	/*
	window.addEventListener('message',function(event){
		console.log('1. 탭호출');
		console.log(event);
		let chkVal = event.data.chkVal;
		if(chkVal == "selTab"){
			//진척도 조회
			cfn_selectPrgrs();
		}
	});
	*/

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
		console.log(SBUxMethod.get('dtl-inp-apcCd'));
		console.log(SBUxMethod.get('dtl-inp-crtrYr'));

		fn_setGrdLtMcIfList();
	}

	//시도 변경 이벤트
	const fn_ctpvChange = async function(){
		SBUxMethod.set("srch-inp-sgg", "");
	}
</script>
</html>