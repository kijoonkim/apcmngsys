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
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set><h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
					<!-- 온라인 도매시장 실적 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<table class="table table-bordered tbl_fixed">
					<caption>사용자 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe"></sbux-input>
							<sbux-input uitype="hidden" id="dtl-input-yr" name="dtl-input-yr"></sbux-input>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-corpNm"
									name="dtl-input-corpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							<th scope="row" class="th_bg th_border_right">사업자번호</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-brno"
									name="dtl-input-brno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							</td>
							<th scope="row" class="th_bg th_border_right">법인등록번호</th>
							<td colspan="2" class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-crno"
									name="dtl-input-crno"
									class="form-control input-sm"
									mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<td class="td_input"  style="border-left: hidden;">
						</tr>
					</tbody>
				</table>
				<br>
				<br>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">▶온라인도매시장 판매목표</span>
						</li>
					</ul>
				</div>
				<table class="table table-bordered tbl_fixed" style="border: none">
					<caption>온라인도매시장 판매목표</caption>
						<!--
						<col style="width: 20%">
						-->
					<tbody>
						<tr>
							<th scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;">직접판매 실적</th>
							<th colspan="2" scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;">위탁판매 실적</th>
							<th rowspan="2" scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;">총 목표액(천원)<br>(C = A+B)</th>
							<th rowspan="2" scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;">통합조직 전문품목<br>총취급액(천원)(D)</th>
							<th rowspan="2" scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;">전문품목 총취급액 대비<br>온라인도매시장 목표 비율(%)<br>(E = C/D)</th>
						</tr>
						<tr>
							<th scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;"><span class="setYr">2024</span>년<br>목표액(천원)(A)</th>
							<th scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;"><span class="setYr">2024</span>년 목표액(천원)</th>
							<th scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;">인정 목표액(천원)(80%)(A)</th>
						</tr>
						<tr>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-trgtTrmtAmt"
									name="dtl-input-trgtTrmtAmt"
									class="form-control input-sm"
									placeholder="숫자를 입력 해주세요"
									mask="{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_calTotRt"
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-consignTrgtAmt"
									name="dtl-input-consignTrgtAmt"
									class="form-control input-sm"
									placeholder="숫자를 입력 해주세요"
									mask="{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_calTotRt"
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-consignCrtdTrgtAmt"
									name="dtl-input-consignCrtdTrgtAmt"
									class="form-control input-sm"
									placeholder="자동산출"
									mask="{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-totTrgtTrmtAmt"
									name="dtl-input-totTrgtTrmtAmt"
									class="form-control input-sm"
									placeholder="자동산출"
									mask="{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-uoTotTrgtTrmtAmt"
									name="dtl-input-uoTotTrgtTrmtAmt"
									class="form-control input-sm"
									placeholder="자동산출"
									mask="{ 'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									readonly
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-input-trgtTrmtRt"
									name="dtl-input-trgtTrmtRt"
									class="form-control input-sm"
									placeholder="자동산출"
									mask="{ 'alias': 'numeric'}"
									readonly
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
					<p>o 산지유통활성화자금 평가에 "온라인도매 확대 노력" 지표 신설로, 목표액 작성 필요</p>
					<p> - '26년 자금배정 시에는 온라인도매시장 판매실적 중 직접판매 실적은 100%, 공판장, 도매법인 등을 통한 위탁판매 실적은 80% 인정</p>
					<p> - 통합조직이 소속 출자출하조직의 직접판매 또는 위탁판매 목표액까지 확인하여 통합조직의(출자출하조직 목표액 포함) 총괄 목표액 작성</p>
					<p> - 목표액에는 전문/육성품목 외 기타품목까지 원예농산물 취급실적 포함하여 입력</p>
				</div>
			</div>
		</div>
	</section>

</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();

	})

	/* 초기세팅 */
	const fn_init = async function() {
		await fn_setYear();//기본년도 세팅
		await fn_dtlSearch();
	}

	/* 기본 년도값 세팅 */
	const fn_setYear = async function() {
		let cdId = "SET_YEAR";
		//SET_YEAR 공통코드의 1첫번쨰 순서의 값 불러오기
		let postJsonPromise = gfn_postJSON("/pd/bsm/selectSetYear.do", {
			cdId : cdId
		});
		let data = await postJsonPromise;
		//현재 년도(세팅값이 없는경우 현재년도로)
		let now = new Date();
		let year = now.getFullYear();
		try{
			if(!gfn_isEmpty(data.setYear)){
				year = data.setYear;
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
		//기본년도 세팅
		//SBUxMethod.set("srch-input-yr",year);
		SBUxMethod.set("dtl-input-yr",year);
		$(".setYr").text(year);
	}


	/* Grid Row 조회 기능*/
	const fn_dtlSearch = async function(){

		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;

		let year = SBUxMethod.get('dtl-input-yr');

		let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
			brno : brno
			,yr : year
		});
		let data = await postJsonPromise;
		try{
			data.resultList.forEach((item, index) => {
				SBUxMethod.set('dtl-input-corpNm',gfn_nvl(item.corpNm))
				SBUxMethod.set('dtl-input-brno',gfn_nvl(item.brno))
				SBUxMethod.set('dtl-input-crno',gfn_nvl(item.crno))
			});
			fn_search();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/* 온라인도매시장 판매목표 조회 기능*/
	const fn_search = async function(){

		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;

		let yr = SBUxMethod.get('dtl-input-yr');

		let postJsonPromise = gfn_postJSON("/pd/pcom/selectPrdcrCrclOgnOnlnWhlslMrkt.do", {
			brno : brno
			,yr : yr
		});

		let data = await postJsonPromise;
		try{
			let item = data.resultMap;
			SBUxMethod.set('dtl-input-trgtTrmtAmt',item.trgtTrmtAmt);
			SBUxMethod.set('dtl-input-consignTrgtAmt',item.consignTrgtAmt);
			//SBUxMethod.set('dtl-input-consignCrtdTrgtAmt',item.consignCrtdTrgtAmt);
			//SBUxMethod.set('dtl-input-totTrgtTrmtAmt',item.totTrgtTrmtAmt);
			SBUxMethod.set('dtl-input-uoTotTrgtTrmtAmt',item.uoTotTrgtTrmtAmt);
			//SBUxMethod.set('dtl-input-trgtTrmtRt',item.trgtTrmtRt);
			fn_calTotRt();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//저장
	async function fn_save(){

		let brno = SBUxMethod.get("dtl-input-brno");
		if(gfn_isEmpty(brno)) return;

		let yr = SBUxMethod.get('dtl-input-yr');


		let postJsonPromise = gfn_postJSON("/pd/pcom/insertPrdcrCrclOgnOnlnWhlslMrkt.do", {
			brno : brno
			,yr : yr
			,trgtTrmtAmt : SBUxMethod.get('dtl-input-trgtTrmtAmt')
			,consignTrgtAmt : SBUxMethod.get('dtl-input-consignTrgtAmt')
			,consignCrtdTrgtAmt : SBUxMethod.get('dtl-input-consignCrtdTrgtAmt')
			,totTrgtTrmtAmt : SBUxMethod.get('dtl-input-totTrgtTrmtAmt')
			,uoTotTrgtTrmtAmt : SBUxMethod.get('dtl-input-uoTotTrgtTrmtAmt')
			,trgtTrmtRt : SBUxMethod.get('dtl-input-trgtTrmtRt')
		});
		let data = await postJsonPromise;

		try{
			fn_search();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	function fn_calTotRt(){
		//직접판매 목표액
		let trgtTrmtAmt = parseFloat(SBUxMethod.get('dtl-input-trgtTrmtAmt'));
		//위탁판매 목표액
		let consignTrgtAmt = parseFloat(SBUxMethod.get('dtl-input-consignTrgtAmt'));
		//통합조직 전문품목 총취급액
		let uoTotTrgtTrmtAmt = parseFloat(SBUxMethod.get('dtl-input-uoTotTrgtTrmtAmt'));

		trgtTrmtAmt = gfn_isEmpty(trgtTrmtAmt) ? 0 : trgtTrmtAmt;
		consignTrgtAmt = gfn_isEmpty(consignTrgtAmt) ? 0 : consignTrgtAmt;
		uoTotTrgtTrmtAmt = gfn_isEmpty(uoTotTrgtTrmtAmt) ? 0 : uoTotTrgtTrmtAmt;

		//위탁판매 인정 목표액 = 위탁판매 목표액 의 80%
		let consignCrtdTrgtAmt = (parseFloat(consignTrgtAmt) * 0.8).toFixed(0) ;
		SBUxMethod.set('dtl-input-consignCrtdTrgtAmt',consignCrtdTrgtAmt);
		//총 목표액 = 직접판매 목표액 + 위탁판매 인정 목표액
		let totTrgtTrmtAmt = parseFloat(trgtTrmtAmt) + parseFloat(consignCrtdTrgtAmt);
		SBUxMethod.set('dtl-input-totTrgtTrmtAmt',totTrgtTrmtAmt);
		//목표 비율
		let trgtTrmtRt = uoTotTrgtTrmtAmt == 0 ? 0 : (parseFloat(totTrgtTrmtAmt) / parseFloat(uoTotTrgtTrmtAmt) * 100).toFixed(2) ;
		SBUxMethod.set('dtl-input-trgtTrmtRt',trgtTrmtRt);
	}

</script>
</html>