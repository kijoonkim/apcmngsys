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
					<!-- 온라인 도매시장 실적관리 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnRowData1" name="btnRowData1" uitype="normal" text="출하실적 로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect(1)"></sbux-button>
					<sbux-button id="btnRowData2" name="btnRowData2" uitype="normal" text="판매목표 로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect(2)"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 5%">

						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 5%">

						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 5%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" >신청년도</th>
							<td class="td_input" style="border-right:hidden;" >
								<sbux-spinner
									id="srch-input-yr"
									name="srch-input-yr"
									uitype="normal"
									step-value="1"
								></sbux-spinner>
							</td>
							<td class="td_input">

							<th scope="row" class="th_bg">사업자번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-input-brno"
									name="srch-input-brno"
									class="form-control input-sm srch-keyup-area"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input">

							<th scope="row" class="th_bg">법인명</th>
							<td class="td_input" style="border-right:hidden;" >
								<sbux-input
									uitype="text"
									id="srch-input-corpNm"
									name="srch-input-corpNm"
									class="form-control input-sm srch-keyup-area"
									autocomplete="off"
								></sbux-input>
							</td>
							<td class="td_input">
						</tr>
					</tbody>
				</table>

				<!-- 조직 리스트 -->
				<div class="prfmncChck">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶조직 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdUoList" style="height:350px; width: 100%; overflow-x: hidden"></div>
					<br>
				</div>

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
				<div class="ad_section_top" id="grid3">
					<div style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
						<p><b>&lt;작성 시 유의사항 및 산지유통활성화자금 인센티브 인정요건&gt;</b></p>
						<p>o 전문품목 매입매출 화면에서 입력한 수치가 총매입매출 화면으로 자동 연계</p>
						<p>o 통합조직 및 출자출하조직의 온라인도매시장 출하실적 입력(★ 아래 증빙자료를 실적점검/현장실사 시 제출 필요)</p>
						<!--
						<p>　 - 통합조직이 직접판매자/위탁판매 시 출하자인 경우 : "출자출하조직명"에 해당없음 선택 후 입력</p>
						<p>　 - 출자출하조직이 직접판매자/위탁판매 시 출하자인 경우 : 해당 "출자출하조직명"을 검색한 후 입력</p>
						-->
						<p>　 - 직접판매 실적 : aT 온라인도매시장에 증빙을 요청하시어 확인 후 입력</p>
						<p>　 - 위탁판매 실적 : 출하를 위탁한 도매법인에게 출하내역서 증빙을 요청하시어 확인 후 입력</p>
						<p>o 사업신청 시 등록한 품목을 검색하여 품목별 실적 입력</p>
						<p>　  - 기 등록한 부류(과실류/시설원예/노지채소)를 기준으로 평가할 예정이므로 부류 확인 필수</p>
						<p>o 최종 실적평가 시, 1) '25년 선정된 통합조직 및 출자출하조직에 한하여, 2) 품목은 원예농산물에 한하여, 3) 품목기준이 아닌 부류별 실적을 기준으로 산정할 예정임</p>
						<p>　 - 평가 시 탈락한 출자출하조직 실적, 원예농산물 외 품목의 출하실적은 온라인도매시장 출하실적으로 미인정</p>

					</div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶온라인도매시장 - 출하실적</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdOnln" style="height:300px; width: 100%;"></div>
				</div>
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSaveFclt3" name="btnSaveFclt3" uitype="normal" text="출하실적 저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveOnln"></sbux-button>
					</div>
				</div>


				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span style="font-size:14px">▶온라인도매시장 - 판매목표</span>
						</li>
					</ul>
				</div>
				<table class="table table-bordered tbl_fixed" style="border: none">
					<caption>▶온라인도매시장 - 판매목표</caption>
						<!--
						<col style="width: 20%">
						-->
					<tbody>
						<tr>
							<th scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;">직접판매 실적</th>
							<th colspan="2" scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;">위탁판매 실적</th>
							<th rowspan="2" scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;">총 목표액(천원)<br>(C = A+B)</th>
							<th rowspan="2" scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;">통합조직 전문품목<br>총취급액(천원)(D)</th>
							<th rowspan="2" scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;">(참고)기준거래액<br>(통합조직 전문품목 총취급액의2%)<br>(E = D*0.02)</th>
							<th rowspan="2" scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;">온라인도매시장<br>판매 확대 목표(%)<br>[F=(C-K)/K*100 또는<br>F=(C-E)/E*100]</th>
						</tr>
						<tr>
							<th scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;"><span class="setYr">2024</span>년<br>목표액(천원)(A)</th>
							<th scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;"><span class="setYr">2024</span>년 목표액(천원)</th>
							<th scope="row" class="th_bg text-center" style="border: 1px solid #ffffff !important;">인정 목표액(천원)<br>(위탁판매는 80%만 인정)(B)</th>
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
								<sbux-input uitype="hidden" id="dtl-input-trmtAmtTot" name="dtl-input-trmtAmtTot"></sbux-input>
								<sbux-input
									uitype="text"
									id="dtl-input-crtrAmt"
									name="dtl-input-crtrAmt"
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
					<p>&nbsp;- '26년 자금배정 시에는 온라인도매시장 판매실적 중 직접판매 실적은 100%, 공판장, 도매법인 등을 통한 위탁판매 실적은 80% 인정</p>
					<p>&nbsp;- 통합조직이 소속 출자출하조직의 직접판매 또는 위탁판매 목표액까지 확인하여 통합조직의(출자출하조직 목표액 포함) 총괄 목표액 작성</p>
					<p>&nbsp;- 목표액에는 전문/육성품목 외 기타품목까지 원예농산물 취급실적 포함하여 입력</p>

					<p>o 온라인도매시장 확대 노력 산식 : (내년도 온라인도매시장 판매액 목표-금년도 판매액(또는 기준거래액)) ÷ 금년도 판매액(또는 기준거래액) × 100</p>
					<p>&nbsp;* 판매액 : 온라인도매시장 직접 판매액(100%), 위탁 판매액(80%)</p>
					<p>&nbsp;* 기준거래액 : 생산유통통합조직의 금년도 전문품목 총취급액의 2%</p>
					<p>&nbsp;- 금년도 판매액이 기준거래액 미만인 경우 금년도 판매액이 아닌 기준거래액 적용</p>
					<p>&nbsp;- (사례1 K&lt;E):(C-E)/E*100</p>
					<p>&nbsp;- (사례2 K&gt;E):(C-K)/K*100</p>
				</div>
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="btnSaveFclt" name="btnSaveFclt" uitype="normal" text="판매목표 저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					</div>
				</div>
			</div>
		</div>
		<!-- 로우데이터 그리드 -->
		<div id="sb-area-hiddenGrd" style="height:400px; width: 100%; display: none;"></div>
	</section>
	<!-- 품목 팝업 -->
	<div>
		<sbux-modal
			id="modal-gpcList"
			name="modal-gpcList"
			uitype="middle"
			header-title="품목 선택"
			body-html-id="body-modal-gpcList"
			footer-is-close-button="false"
			style="width:800px"
		></sbux-modal>
	</div>
	<div id="body-modal-gpcList">
		<jsp:include page="/WEB-INF/view/apcss/pd/popup/gpcSelectPopup.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();

	})

	/* 초기세팅 */
	const fn_init = async function() {
		await fn_setYear();//기본년도 세팅
		await fn_initSBSelect();
		await fn_createUoListGrid();//통합조직 리스트 그리드 생성
		await fn_createGridOnln();//온라인도매시장 출하실적 그리드 생성
		await fn_search();//정보 조회
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
		SBUxMethod.set("srch-input-yr",year);
		//SBUxMethod.set("dtl-input-yr",year);
		$(".setYr").text(year);
	}

	var jsonGrdCtgryCd = [];//평가부류
	var jsonGrdClsfCd = [];//부류

	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdOnln', jsonGrdCtgryCd, 'CTGRY_CD'), //평가부류
			gfn_setComCdSBSelect('grdOnln', jsonGrdClsfCd, 	'CLSF_CD'), //부류

		]);
	}

	//그리드 변수
	var jsonUoList = []; // 그리드의 참조 데이터 주소 선언
	var grdUoList;

	/* Grid 화면 그리기 기능*/
	const fn_createUoListGrid = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdUoList';
		SBGridProperties.id = 'grdUoList';
		SBGridProperties.jsonref = 'jsonUoList';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.explorerbar = 'sort';//정렬
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["신청년도"], 	ref: 'yr',			type:'output',  width:'60px',	style:'text-align:center'},
			{caption: ["승인연도"], 	ref: 'slctnYr',		type:'output',  width:'60px',	style:'text-align:center'},
			{caption: ["법인명"], 		ref: 'corpNm',		type:'output',  width:'200px',	style:'text-align:center'},
			{caption: ["사업자번호"], 	ref: 'brno',		type:'output',  width:'90px',	style:'text-align:center'},
			{caption: ["법인등록번호"], 	ref: 'crno',		type:'output',  width:'110px',	style:'text-align:center'},
			{caption: ["작성여부"], 	ref: 'chk',			type:'output',  width:'60px',	style:'text-align:center'},
			{caption: ["품목리스트"], 	ref: 'itemNmList',	type:'output',  width:'150px',	style:'text-align:left'},
			{caption: ["비고"], 		ref: 'rmrk',		type:'output',  width:'80px',	style:'text-align:left'},

		];
		grdUoList = _SBGrid.create(SBGridProperties);

		//클릭 이벤트 바인드
		grdUoList.bind('click','fn_view');
	}

	//그리드 클릭시 상세보기 이벤트
	const fn_view = async function (){
		fn_clearForm();

		let objGrid = grdUoList;

		//데이터가 존재하는 그리드 범위 확인
		var nCol = objGrid.getCol();
		if (nCol < 1) {
			return;
		}
		var nRow = objGrid.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}

		//서치폼에서 클릭시 디테일폼에 데이터출력
		let rowData = objGrid.getRowData(nRow);

		SBUxMethod.set('dtl-input-crno'		,gfn_nvl(rowData.crno))		//법인등록번호
		SBUxMethod.set('dtl-input-brno'		,gfn_nvl(rowData.brno))		//사업자번호
		SBUxMethod.set('dtl-input-corpNm'	,gfn_nvl(rowData.corpNm))	//법인명
		SBUxMethod.set('dtl-input-yr'		,gfn_nvl(rowData.yr))		//등록년도

		await fn_searchComboList();//조직 리스트, 품목 리스트 콤보박스 데이터
		await grdOnln.rebuild();
		await fn_dtlSearch();
	}


	/* 상세 초기화 */
	const fn_clearForm = async function(){
		SBUxMethod.set('dtl-input-crno'		,null);		//법인등록번호
		SBUxMethod.set('dtl-input-brno'		,null);		//사업자번호
		SBUxMethod.set('dtl-input-corpNm'	,null);		//법인명
		SBUxMethod.set('dtl-input-yr'		,null);		//등록년도

		SBUxMethod.set('dtl-input-trgtTrmtAmt',null);
		SBUxMethod.set('dtl-input-consignTrgtAmt',null);
		SBUxMethod.set('dtl-input-consignCrtdTrgtAmt',null);
		SBUxMethod.set('dtl-input-totTrgtTrmtAmt',null);
		SBUxMethod.set('dtl-input-uoTotTrgtTrmtAmt',null);
		SBUxMethod.set('dtl-input-trgtTrmtRt',null);
	}

	/* 조직 조회*/
	const fn_search = async function(){
		fn_clearForm();

		let brno = SBUxMethod.get('srch-input-brno');
		let yr = SBUxMethod.get('srch-input-yr');
		let corpNm = SBUxMethod.get('srch-input-corpNm');

		let postJsonPromise = gfn_postJSON("/pd/pcom/selectPrdcrCrclOgnOnlnWhlslMrktUoList.do", {
			brno : brno
			,yr : yr
			,corpNm : corpNm
		});
		let data = await postJsonPromise;
		try{
			jsonUoList.length = 0;
			let totalRecordCount = 0;
			data.resultList.forEach((item, index) => {
				let itemVO = {
						yr			: item.yr
						,apoCd		: item.apoCd
						,brno		: item.brno
						,crno		: item.crno
						,corpNm		: item.corpNm
						,slctnYr	: item.slctnYr
						,itemNmList	: item.itemNmList
						,chk		: item.chk
				}
				jsonUoList.push(itemVO);
			});
			grdUoList.rebuild();
			document.querySelector('#listCount').innerText = jsonUoList.length;

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/* 온라인도매시장 판매목표 조회 기능*/
	const fn_dtlSearch = async function(){

		let brno = SBUxMethod.get('dtl-input-brno');
		if(gfn_isEmpty(brno)) return;

		let yr = SBUxMethod.get('dtl-input-yr');

		let postJsonPromise = gfn_postJSON("/pd/pcom/selectPrdcrCrclOgnOnlnWhlslMrkt.do", {
			brno : brno
			,yr : yr
		});

		let data = await postJsonPromise;
		try{
			/* 온라인도매시장 판매목표 */
			let item = data.resultMap;
			if(data.resultMap != null){
				SBUxMethod.set('dtl-input-trgtTrmtAmt',gfn_nvl(item.trgtTrmtAmt));
				SBUxMethod.set('dtl-input-consignTrgtAmt',gfn_nvl(item.consignTrgtAmt));
				//SBUxMethod.set('dtl-input-consignCrtdTrgtAmt',gfn_nvl(item.consignCrtdTrgtAmt));
				//SBUxMethod.set('dtl-input-totTrgtTrmtAmt',gfn_nvl(item.totTrgtTrmtAmt));
				SBUxMethod.set('dtl-input-uoTotTrgtTrmtAmt',gfn_nvl(item.uoTotTrgtTrmtAmt));
				SBUxMethod.set('dtl-input-trmtAmtTot',gfn_nvl(item.trmtAmtTot));
				SBUxMethod.set('dtl-input-crtrAmt',gfn_nvl(item.crtrAmt));
				//SBUxMethod.set('dtl-input-trgtTrmtRt',item.trgtTrmtRt);
			}
			fn_calTotRt();

			/* 온라인도매시장 출하실적 */
			jsonOnln.length = 0;
			if(data.resultList != null){
				data.resultList.forEach((item, index) => {
					let itemVo = {
							yr: item.yr
							,apoSe: item.apoSe
							,apoSeNm: item.apoSeNm
							,brno: item.brno
							,uoBrno: item.uoBrno
							,itemCd: item.itemCd
							,ctgryCd: item.ctgryCd
							,clsfCd: item.clsfCd

							,itemNm: item.itemNm
							,ctgryNm: item.ctgryNm
							,clsfNm: item.clsfNm

							,trmtAmt: item.trmtAmt
							,consignTrmtAmt: item.consignTrmtAmt

							,trmtAmtTot: item.trmtAmtTot
							,consignTrmtAmtTot: item.consignTrmtAmtTot

							,delYn: item.delYn
					}
					jsonOnln.push(itemVo);
				});
				grdOnln.rebuild();
			}

			grdOnln.addRow(true);
			grdOnln.addRow(true);

			fn_grdTot();//합계

			let nRow = jsonOnln.length;
			let delYnCol = grdOnln.getColRef('delYn');//처리
			let brnoCol = grdOnln.getColRef('brno');//사업자번호
			let itemCdCol = grdOnln.getColRef('itemCd');//품목
			let trmtAmtCol = grdOnln.getColRef('trmtAmt');//직접판매 실적
			let consignTrmtAmtCol = grdOnln.getColRef('consignTrmtAmt');//위탁판매 실적
			//추가 row 비활성화
			grdOnln.setCellDisabled(nRow-1, brnoCol, nRow-1, itemCdCol, true);
			grdOnln.setCellDisabled(nRow, brnoCol, nRow, itemCdCol, true);
			grdOnln.setCellDisabled(nRow-1, trmtAmtCol, nRow-1, consignTrmtAmtCol, true);
			grdOnln.setCellDisabled(nRow, trmtAmtCol, nRow, consignTrmtAmtCol, true);
			grdOnln.setCellStyle('background-color', nRow-1, delYnCol, nRow-1, consignTrmtAmtCol, 'lightgray');
			grdOnln.setCellStyle('background-color', nRow, delYnCol, nRow, consignTrmtAmtCol, 'lightgray');

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//판매목표 저장
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
			,crtrAmt : SBUxMethod.get('dtl-input-crtrAmt')
			,trgtTrmtRt : SBUxMethod.get('dtl-input-trgtTrmtRt')
		});

		let data = await postJsonPromise;
		try{

			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
				fn_dtlSearch();
			} else {
				alert(data.resultMessage);
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//출하실적 저장
	async function fn_saveOnln(){

		let brno = SBUxMethod.get("dtl-input-brno");
		if(gfn_isEmpty(brno)) return;

		let yr = SBUxMethod.get('dtl-input-yr');
		if(gfn_isEmpty(yr)) return;

		let objGrid = grdOnln;
		let gridData = objGrid.getGridDataAll();
		let saveList = [];

		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		for(var i = captionRow; i < gridData.length + captionRow; i++ ){
			let rowData = objGrid.getRowData(i);
			let rowSts = objGrid.getRowStatus(i);
			if(rowData.delYn === 'N'){
				rowData.uoBrno = brno;

				if(gfn_isEmpty(rowData.brno)){
					alert('조직을 선택해주세요');
					objGrid.selectRow(i);
					return;
				}

				if(gfn_isEmpty(rowData.itemCd)){
					alert('품목을 선택해주세요');
					objGrid.selectRow(i);
					return;
				}

				if(gfn_isEmpty(rowData.clsfCd)){
					alert('부류를 선택해주세요');
					objGrid.selectRow(i);
					return;
				}

				if(gfn_isEmpty(rowData.ctgryCd)){
					alert('평가부류를 선택해주세요');
					objGrid.selectRow(i);
					return;
				}

				if(gfn_isEmpty(rowData.trmtAmt)){
					alert('직접판매 실적을 입력해주세요');
					objGrid.selectRow(i);
					return;
				}

				if(gfn_isEmpty(rowData.consignTrmtAmt)){
					alert('위탁판매 실적을 입력해주세요');
					objGrid.selectRow(i);
					return;
				}

				rowData.rowSts = "I";
				saveList.push(rowData);
			}
		}
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(!confirm(regMsg)){
			return;
		}

		let postJsonPromise = gfn_postJSON("/pd/pcom/multiSaveOnlnDtl.do", saveList);

		let data = await postJsonPromise;
		try{
			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
				fn_dtlSearch();
			} else {
				alert(data.resultMessage);
			}
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

		SBUxMethod.set('dtl-input-uoTotTrgtTrmtAmt',uoTotTrgtTrmtAmt);

		//위탁판매 인정 목표액 = 위탁판매 목표액 의 80%
		let consignCrtdTrgtAmt = (parseFloat(consignTrgtAmt) * 0.8).toFixed(0) ;
		SBUxMethod.set('dtl-input-consignCrtdTrgtAmt',consignCrtdTrgtAmt);
		//총 목표액 = 직접판매 목표액 + 위탁판매 인정 목표액
		let totTrgtTrmtAmt = parseFloat(trgtTrmtAmt) + parseFloat(consignCrtdTrgtAmt);
		SBUxMethod.set('dtl-input-totTrgtTrmtAmt',totTrgtTrmtAmt);

		//기준거래액
		let crtrAmt = (parseFloat(uoTotTrgtTrmtAmt)*0.02).toFixed(0);
		SBUxMethod.set('dtl-input-crtrAmt',crtrAmt);

		//목표 비율
		let trgtTrmtRt = 0;
		//let trgtTrmtRt = uoTotTrgtTrmtAmt == 0 ? 0 : (parseFloat(totTrgtTrmtAmt) / parseFloat(uoTotTrgtTrmtAmt) * 100).toFixed(2) ;
		//온라인 도매시장 출하실적 합계 (조회 할떄 저장된 출하실적 그리드 합계를 불러옴)
		let trmtAmtTot = parseFloat(SBUxMethod.get('dtl-input-trmtAmtTot'));
		trmtAmtTot = gfn_isEmpty(trmtAmtTot) ? 0 : trmtAmtTot;
		//E 기준거래액 ,K 온라인도매시장 출하실적 합계
		//E > K --> F=(C-E)/E*100
		//E <= K --> F=(C-K)/K*100
		if(crtrAmt > trmtAmtTot){
			trgtTrmtRt = ( (parseFloat(totTrgtTrmtAmt) - parseFloat(crtrAmt)) / parseFloat(crtrAmt) * 100 ).toFixed(2);
		}else{
			trgtTrmtRt = ( (parseFloat(totTrgtTrmtAmt) - parseFloat(trmtAmtTot)) / parseFloat(trmtAmtTot) * 100 ).toFixed(2);
		}

		SBUxMethod.set('dtl-input-trgtTrmtRt',trgtTrmtRt);
	}

	/* 20250115 온라인도매시장 출하실적 그리드 추가 */

	//그리드 변수
	var jsonOnln = []; // 그리드의 참조 데이터 주소 선언
	var grdOnln;

	/* Grid 화면 그리기 기능*/
	const fn_createGridOnln = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdOnln';
		SBGridProperties.id = 'grdOnln';
		SBGridProperties.jsonref = 'jsonOnln';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		//SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		//SBGridProperties.explorerbar = 'sort';//정렬
		SBGridProperties.fixedrowheight=88;
		SBGridProperties.frozenbottomrows=1;
		SBGridProperties.columns = [
			{caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
				<c:if test="${loginVO.userType ne '02'}">
				//그리드 메인 길이
				let grdLength = jsonOnln.length;
				if(strValue== null || strValue == ""){
					//마지막줄은 합계 줄
					if(grdLength===nRow){
						return "";
					}else{
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\" , \"grdOnln\", " + nRow + ", " + nCol + ")'>추가</button>";
					}
				}else{
					return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\" , \"grdOnln\", " + nRow + ")'>삭제</button>";
				}
				</c:if>
				return "";
			}},
			{caption: ["등록년도"],		ref: 'yr',	type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["조직구분"],		ref: 'apoSeNm',	type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["조직선택"],		ref: 'brno',	type:'combo',  width:'200px',	style:'text-align:center'
				,typeinfo : {ref:'jsonOgnz', label:'label', value:'value', displayui : true, itemcount : 5, position : 'bottom'}},
			/* 20250122 기존 품목 연계에서 품목 자유선택으로 변경 요청 */
			{caption: ["품목선택"], 				ref: 'sel',   	type:'button', width:'60px',	style:'text-align:center'
				, renderer: function(objGrid, nRow, nCol, strValue, objRowData){
					let corpDdlnSeCd = SBUxMethod.get("dtl-input-corpDdlnSeCd");
					let delYnCol = objGrid.getColRef('delYn');
					let delYnVal = objGrid.getCellData(nRow,delYnCol);
					//console.log(delYnVal);
					if(corpDdlnSeCd != 'Y'){
						if(delYnVal == 'N'){
							return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_openMaodalGpcSelect(" + nRow + ")'>선택</button>";
						}
					}
					return "";
				}},
			{caption: ["품목명"],		ref: 'itemNm',	type:'output',  width:'100px',	style:'text-align:center'},
			{caption: ["부류"],		ref: 'clsfCd',	type:'combo',  width:'80px',	style:'text-align:center'
				,typeinfo : {ref:'jsonGrdClsfCd', label:'label', value:'value', displayui : true, itemcount : 5, position : 'bottom'}},
			{caption: ["평가부류"],		ref: 'ctgryCd',	type:'combo',  width:'80px',	style:'text-align:center'
				,typeinfo : {ref:'jsonGrdCtgryCd', label:'label', value:'value', displayui : true, itemcount : 5, position : 'bottom'}},

			{caption: ["직접판매 실적\n금액(천원)"],	ref: 'trmtAmt',	type:'input',  width:'120px',	style:'text-align:right', merge: false
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}
			},
			{caption: ["위탁판매 실적\n금액(천원)"],	ref: 'consignTrmtAmt',	type:'input',  width:'120px',	style:'text-align:right'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}
			},
			{caption: ["소계"],	ref: 'trmtAmtTot',	type:'output',  width:'140px',	style:'text-align:right; background-color: lightgray'
				,calc : 'fn_trmtAmtTot'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}
			},
			{caption: ["참고\n*온라인도매시장 판매 확대\n목표 산출시 적용될 판매실적\n(직접판매100%,위탁판매80%\n고려 실적)(K)"],	ref: 'consignTrmtAmtTot',	type:'output',  width:'200px',	style:'text-align:right; background-color: lightgray'
				,calc : 'fn_consignTrmtAmtTot'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}
			},

			{caption: ["상세내역"], 	ref: 'uoBrno',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
			{caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
		];

		grdOnln = _SBGrid.create(SBGridProperties);
		grdOnln.bind('valuechanged','fn_valuechanged');
		grdOnln.bind('dblclick','gridClick');
	}

	/* 조직 콤보박스 , 품목 콤보박스 추가 */
	var jsonOgnz = [];
	var jsonItem = [];

	/* 콤보박스 조회*/
	const fn_searchComboList = async function(){
		let brno = SBUxMethod.get('dtl-input-brno');
		let yr = SBUxMethod.get('dtl-input-yr');

		let postJsonPromise = gfn_postJSON("/pd/pcom/selectOnlnComboList.do", {
			yr : yr
			,brno : brno
		});

		let data = await postJsonPromise ;
		try{
			jsonOgnz.length = 0;
			data.resultOgnzList.forEach((item, index) => {
				let ItemVO = {
						text: item.corpNm
						,value: item.brno
						,apoSe: item.apoSe
						,apoSeNm: item.apoSeNm
						,label: item.corpNm
				}
				jsonOgnz.push(ItemVO);
			});

			jsonItem.length = 0;
			data.resultItemList.forEach((item, index) => {
				let ItemVO = {
						text: item.itemNm
						,value: item.itemCd
						,label: item.itemNm
						,brno: item.brno
						,ctgryNm: item.ctgryNm
						,clsfNm: item.clsfNm
				}
				jsonItem.push(ItemVO);
			});

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//출하실적 소계
	function fn_trmtAmtTot(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//추가를 위한 row제외
		if(nRow == (jsonOnln.length-1)){
			sumVal = "";
		}else{
			sumVal = Number(gfn_nvl(rowData.trmtAmt)) + Number(gfn_nvl(rowData.consignTrmtAmt));
		}
		return sumVal;
	}

	//출하실적 참고 판매실적
	function fn_consignTrmtAmtTot(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		//추가를 위한 row제외
		if(nRow == (jsonOnln.length-1)){
			sumVal = "";
		}else{
			let treatmentAmount = parseFloat(rowData.trmtAmt) || 0;
			let consignmentAmount = parseFloat(rowData.consignTrmtAmt) || 0;
			let adjustedConsignmentAmount = consignmentAmount * 0.8;
			sumVal = treatmentAmount + Math.round(adjustedConsignmentAmount);
		}
		return sumVal;
	}

	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh = [
		'trmtAmt', 'consignTrmtAmt'
	];
	//콤보박스 컬럼 리스트
	const comboList = [
		'brno', 'itemCd'
	];
	//입력값 확인 후 합계 처리
	function fn_valuechanged(){
		let objGrid = grdOnln;
		let nCol = objGrid.getCol();
		let nRef = objGrid.getRefOfCol(nCol);
		if(columnsToRefresh.includes(nRef)){
			objGrid.refresh();
			fn_grdTot();
		}else if(comboList.includes(nRef)){
			fn_dtlValSet(nRef);//콤보박스 변경에 따른 값 세팅
		}
	}
	//합계
	function fn_grdTot(){
		// 계산할 열 이름 배열
		const columnsToSum = [
			"trmtAmt",
			"consignTrmtAmt"
		];

		let objGrid = grdOnln;
		let grdJson = jsonOnln;

		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		//그리드 메인 길이
		let grdLength = grdJson.length;

		//마지막 줄은 소계라서 제외
		grdJson = grdJson.slice(0, -1);
		// 각 열의 합계 계산
		const subtotals = columnsToSum.reduce((acc, col) => {
			acc[col] = grdJson.reduce((sum, row) => sum + Number(gfn_nvl(row[col])), 0);
			return acc;
		}, {});

		columnsToSum.forEach(col => {
			objGrid.setCellData(grdLength + captionRow - 1, objGrid.getColRef(col), subtotals[col]);
		});

		objGrid.refresh();
	}

	//fn_valSet
	function fn_dtlValSet(nRef){
		let objGrid = grdOnln;
		let nRow = objGrid.getRow();
		let rowData = objGrid.getRowData(nRow);
		if(nRef == "brno"){
			let brnoArr = _.find(jsonOgnz, {value : rowData.brno});
			let apoSeCol = objGrid.getColRef("apoSe");//조직구분
			let apoSeNmCol = objGrid.getColRef("apoSeNm");//조직구분
			objGrid.setCellData(nRow, apoSeCol, brnoArr.apoSe);
			objGrid.setCellData(nRow, apoSeNmCol, brnoArr.apoSeNm);
		}else if(nRef == "itemCd"){
			let clsfNmCol = objGrid.getColRef("clsfNm");//부류
			let ctgryNmCol = objGrid.getColRef("ctgryNm");//평가부류
			let itemCdCol = objGrid.getColRef("itemCd");//평가부류

			let gridData = objGrid.getGridDataAll();
			let captionRow = objGrid.getFixedRows();
			for(var i = captionRow; i < gridData.length + captionRow; i++ ){
				let rowData01 = objGrid.getRowData(i);
				//console.log(rowData.itemCd , rowData01.itemCd , rowData.brno , rowData01.brno);
				if(nRow != i && rowData.itemCd == rowData01.itemCd && rowData.brno == rowData01.brno){
					let brnoArr = _.find(jsonOgnz, {value : rowData.brno});
					objGrid.setCellData(nRow, clsfNmCol, '');
					objGrid.setCellData(nRow, ctgryNmCol, '');
					objGrid.setCellData(nRow, itemCdCol, '');
					alert(brnoArr.text+" 조직에 중복된 품목이 있습니다");
					return;
				}
			}

			let itemArr = _.find(jsonItem, {value : rowData.itemCd});
			objGrid.setCellData(nRow, clsfNmCol, itemArr.clsfNm);
			objGrid.setCellData(nRow, ctgryNmCol, itemArr.ctgryNm);
		}
	}

	/* Grid Row 추가 및 삭제 기능*/
	function fn_procRow(gubun, grid, nRow, nCol) {
		let objGrid = grdOnln;
		if (gubun === "ADD") {
			if (grid === "grdOnln") {
				//행추가
				objGrid.addRow(true);

				let yrCol = objGrid.getColRef('yr');//등록년도
				let brnoCol = objGrid.getColRef('brno');//사업자번호
				let trmtAmtCol = objGrid.getColRef('trmtAmt');//직접판매 실적
				let consignTrmtAmtCol = objGrid.getColRef('consignTrmtAmt');//위탁판매 실적

				//값 수정
				objGrid.setCellData(nRow, yrCol, SBUxMethod.get('dtl-input-yr'), true);
				objGrid.setCellData(nRow, nCol, "N", true);

				objGrid.refresh();

				//기존 row 활성화
				objGrid.setCellDisabled(nRow, brnoCol, nRow, consignTrmtAmtCol, false);
				objGrid.setCellStyle('background-color', nRow, nCol, nRow, consignTrmtAmtCol, 'white');
				//추가 row 비활성화
				objGrid.setCellDisabled(nRow+2, brnoCol, nRow+2, consignTrmtAmtCol, true);
				objGrid.setCellStyle('background-color', nRow+2, nCol, nRow+2, consignTrmtAmtCol, 'lightgray');
			}
		}else if (gubun === "DEL") {
			if (grid === "grdOnln") {
				if(objGrid.getRowStatus(nRow) == 0 || objGrid.getRowStatus(nRow) == 2){
					var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
					if(confirm(delMsg)){
						var rowVal = objGrid.getRowData(nRow);
						fn_deleteRsrc(rowVal);
						fn_search();
					}
				}else{
					objGrid.deleteRow(nRow);
				}
			}
		}
	}

	//생산자조직 리스트 선택 데이터 삭제
	async function fn_deleteRsrc(itemVO){

		let postJsonPromise = gfn_postJSON("/pd/pcom/deleteOnlnDtl.do", itemVO);
		let data = await postJsonPromise;

		try{
			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
				fn_dtlSearch();
			} else {
				//alert(data.resultMessage);
				alert("삭제 도중 오류가 발생 되었습니다.");
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}


	/* 품목 팝업 추가 */

	//그리드 클릭이벤트
	function gridClick(){
		let objGrid = grdOnln;

		//objGrid 그리드 객체
		let selGridRow = objGrid.getRow();
		let selGridCol = objGrid.getCol();


		let delYnCol = objGrid.getColRef('delYn');
		let delYnValue = objGrid.getCellData(selGridRow,delYnCol);

		//입력할 데이터 인지 확인
		//추가 행의 경우 DEL_YN을 N 로 변경한 빈 행임
		//fn_procRow 의 ADD 확인
		if(delYnValue != 'N'){
			return;
		}

		//분류,품목,
		//let ctgryNmCol = objGrid.getColRef('ctgryNm');
		let itemNmCol = objGrid.getColRef('itemNm');

		if(selGridRow == '-1'){
			return;
		} else {
			if (selGridCol == itemNmCol){
				//팝업창 오픈
				//통합조직 팝업창 id : modal-gpcList
				//popGpcSelect.init(fn_setGridItem);
				//SBUxMethod.openModal('modal-gpcList');
				fn_openMaodalGpcSelect(selGridRow);
			}
		}
	}
	//품목선택 팝업 버튼
	function fn_openMaodalGpcSelect(nRow){
		let objGrid = grdOnln;

		let delYnCol = objGrid.getColRef('delYn');
		let delYnValue = objGrid.getCellData(nRow,delYnCol);
		if(delYnValue == '' || delYnValue == null){
			return
		}
		objGrid.setRow(nRow);
		popGpcSelect.init(fn_setGridItem , 'N');
		SBUxMethod.openModal('modal-gpcList');
	}


	// 그리드의 품목 선택 팝업 콜백 함수
	const fn_setGridItem = function(rowData) {
		let objGrid = grdOnln;

		if (!gfn_isEmpty(rowData)) {
			//setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
			//selGridRow : 선택된 행 값

			let selGridRow = objGrid.getRow();

			let itemCdCol = objGrid.getColRef("itemCd");//품목코드 인덱스
			let itemNmCol = objGrid.getColRef("itemNm");//품목명 인덱스

			/*
			let gridData = objGrid.getGridDataAll();
			let captionRow = objGrid.getFixedRows();
			for(var i=captionRow; i < gridData.length + captionRow; i++ ){
				let orgRowData = objGrid.getRowData(i);
				if ($.trim(rowData.itemCd) === $.trim(orgRowData.itemCd)){
					gfn_comAlert("E0000", "동일한 품목이 있습니다.");
					return false;
				}
			}
			*/

			let selRowData = objGrid.getRowData(selGridRow);

			//그리드 값 세팅
			objGrid.setCellData(selGridRow,itemCdCol,rowData.itemCd,true);
			objGrid.setCellData(selGridRow,itemNmCol,rowData.itemNm,true);

			let grdStatus = objGrid.getRowStatus(selGridRow);
		 	if(grdStatus != '1'){
		 		objGrid.setRowStatus(selGridRow,'update');
		 	}
		}
	}

	/* 로우데이터 요청 */

	var jsonHiddenGrd = []; // 그리드의 참조 데이터 주소 선언
	var hiddenGrd;

	/* Grid 화면 그리기 기능*/
	const fn_hiddenGrd = async function(_gridSe) {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-hiddenGrd';
		SBGridProperties.id = 'hiddenGrd';
		SBGridProperties.jsonref = 'jsonHiddenGrd';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.rowheader="seq";
		/* _gridSe 1 출하실적 , 2 판매목표 */
		if(_gridSe == '1'){
			SBGridProperties.columns = columnsGrid1;
		}else if(_gridSe == '2'){
			SBGridProperties.columns = columnsGrid2;
		}

		hiddenGrd = _SBGrid.create(SBGridProperties);
	}

	const columnsGrid1 = [
		{caption: ["등록년도"],		ref: 'yr',	type:'output',  width:'80px',	style:'text-align:center'},
		{caption: ["사업자번호"],	ref: 'uoBrno',	type:'output',  width:'80px',	style:'text-align:center'},
		{caption: ["법인명"],		ref: 'uoCorpNm',	type:'output',  width:'80px',	style:'text-align:center'},

		{caption: ["조직구분"],		ref: 'apoSeNm',	type:'output',  width:'80px',	style:'text-align:center'},
		{caption: ["사업자번호"],	ref: 'brno',	type:'output',  width:'200px',	style:'text-align:center'},
		{caption: ["법인명"],		ref: 'corpNm',	type:'output',  width:'200px',	style:'text-align:center'},

		{caption: ["품목명"],		ref: 'itemNm',	type:'output',  width:'100px',	style:'text-align:center'},
		{caption: ["부류"],		ref: 'clsfNm',	type:'output',  width:'80px',	style:'text-align:center'},
		{caption: ["평가부류"],		ref: 'ctgryNm',	type:'output',  width:'80px',	style:'text-align:center'},

		{caption: ["직접판매 실적 금액(천원)"],	ref: 'trmtAmt',	type:'output',  width:'120px',	style:'text-align:right'},
		{caption: ["위탁판매 실적 금액(천원)"],	ref: 'consignTrmtAmt',	type:'output',  width:'120px',	style:'text-align:right'},
		{caption: ["소계"],	ref: 'trmtAmtTot',	type:'output',  width:'140px',	style:'text-align:right;'},
		{caption: ["참고 *온라인도매시장 판매 확대 목표 산출시 적용될 판매실적 (직접판매100%,위탁판매80% 고려 실적)(K)"]
			,ref: 'consignTrmtAmtTot',	type:'output',  width:'200px',	style:'text-align:right; background-color: lightgray'},
	];

	const columnsGrid2 = [
		{caption: ["등록년도"],		ref: 'yr',	type:'output',  width:'80px',	style:'text-align:center'},
		{caption: ["사업자번호"],	ref: 'brno',	type:'output',  width:'80px',	style:'text-align:center'},
		{caption: ["법인명"],		ref: 'corpNm',	type:'output',  width:'80px',	style:'text-align:center'},

		{caption: ["직접판매 실적 2025년 목표액(천원)(A)"],	ref: 'trgtTrmtAmt',	type:'output',  width:'120px',	style:'text-align:right'},
		{caption: ["위탁판매 실적 2025년 목표액(천원)"],	ref: 'consignTrgtAmt',	type:'output',  width:'120px',	style:'text-align:right'},
		{caption: ["위탁판매 실적 인정 목표액(천원)(위탁판매는 80%만 인정)(B)"],	ref: 'consignCrtdTrgtAmt',	type:'output',  width:'120px',	style:'text-align:right'},
		{caption: ["총 목표액(천원)(C = A+B)"],	ref: 'totTrgtTrmtAmt',	type:'output',  width:'120px',	style:'text-align:right'},
		{caption: ["통합조직 전문품목 총취급액(천원)(D)"],	ref: 'uoTotTrgtTrmtAmt',	type:'output',  width:'120px',	style:'text-align:right'},
		{caption: ["(참고)기준거래액 (통합조직 전문품목 총취급액의2%) (E = D*0.02)"],	ref: 'crtrAmt',	type:'output',  width:'120px',	style:'text-align:right'},
		{caption: ["출하실적 합계"],	ref: 'trmtAmtTot',	type:'output',  width:'120px',	style:'text-align:right'},
		{caption: ["온라인도매시장 판매 확대 목표(%) [F=(C-K)/K*100 또는 F=(C-E)/E*100]"],		ref: 'trgtTrmtRt',	type:'output',  width:'120px',	style:'text-align:right'},
	];

	const fn_hiddenGrdSelect = async function(_gridSe){
		console.log('_gridSe',_gridSe);
		/* _gridSe 1 출하실적 , 2 판매목표 */
		await fn_hiddenGrd(_gridSe);
		let yr = SBUxMethod.get("srch-input-yr");
		if (gfn_isEmpty(yr)) {
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		/* _gridSe 1 출하실적 , 2 판매목표 */
		let rowDataUrl;
		if(_gridSe == '1'){
			rowDataUrl = "/pd/pcom/selectRawDataOnlnDtl.do";
		}else if(_gridSe == '2'){
			rowDataUrl = "/pd/pcom/selectRawDataOnln.do";
		}

		let postJsonPromise = gfn_postJSON(rowDataUrl, {
			yr : yr
		});

		let data = await postJsonPromise;
		try{
			jsonHiddenGrd.length = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO;
				if(_gridSe == '1'){
					console.log('1');
					hiddenGrdVO = {
							yr					:item.yr
							,uoBrno				:item.uoBrno
							,uoCorpNm			:item.uoCorpNm

							,apoSeNm			:item.apoSeNm
							,brno				:item.brno
							,corpNm				:item.corpNm

							,itemNm				:item.itemNm
							,clsfNm				:item.clsfNm
							,ctgryNm			:item.ctgryNm

							,trmtAmt			:item.trmtAmt
							,consignTrmtAmt		:item.consignTrmtAmt
							,trmtAmtTot			:item.trmtAmtTot
							,consignTrmtAmtTot	:item.consignTrmtAmtTot
						};
				}else if(_gridSe == '2'){
					console.log('2');
					hiddenGrdVO = {
							yr: item.yr
							,brno: item.brno
							,corpNm: item.corpNm

							,trgtTrmtAmt: item.trgtTrmtAmt
							,consignTrgtAmt: item.consignTrgtAmt
							,consignCrtdTrgtAmt: item.consignCrtdTrgtAmt

							,totTrgtTrmtAmt: item.totTrgtTrmtAmt
							,uoTotTrgtTrmtAmt: item.uoTotTrgtTrmtAmt

							,trmtAmtTot: item.trmtAmtTot
							,crtrAmt: (Number(item.uoTotTrgtTrmtAmt)*0.02).toFixed(2)

							,trgtTrmtRt: item.trgtTrmtRt
						};
					console.log(hiddenGrdVO);
				}
				jsonHiddenGrd.push(hiddenGrdVO);
			});

			await hiddenGrd.rebuild();

			await fn_excelDown(_gridSe);

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}
	//로우 데이터 엑셀 다운로드
	function fn_excelDown(_gridSe){
		const currentDate = new Date();

		const year = currentDate.getFullYear().toString().padStart(4, '0');
		const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
		const day = currentDate.getDate().toString().padStart(2, '0');
		let formattedDate = year + month + day;
		let fileName = formattedDate;
		/* _gridSe 1 출하실적 , 2 판매목표 */
		if(_gridSe == '1'){
			fileName += "_온라인도매시장_출하실적_로우데이터";
		}else if(_gridSe == '2'){
			fileName += "_온라인도매시장_판매목표_로우데이터";
		}


		/*
		datagrid.exportData(param1, param2, param3, param4);
		param1(필수)[string]: 다운 받을 파일 형식
		param2(필수)[string]: 다운 받을 파일 제목
		param3[boolean]: 다운 받을 그리드 데이터 기준 (default:'false')
		→ true : csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 다운로드
		→ false : csv/xls/xlsx 형식의 데이터 다운로드를 jsonref 기준으로 다운로드
		param4[object]: 다운 받을 그리드 데이터 기준 (default:'false')
		→ arrRemoveCols(선택): csv/xls/xlsx 형식의 데이터 다운로드를 그리드에 보이는 기준으로 할 때 다운로드에서 제외할 열
		→ combolabel(선택) : csv/xls/xlsx combo/inputcombo 일 때 label 값으로 저장
		→ true : label 값으로 저장
		→ false : value 값으로 저장
		→ sheetName(선택) : xls/xlsx 형식의 데이터 다운로드시 시트명을 설정
		 */
		//console.log(hiddenGrd.exportData);
		hiddenGrd.exportData("xlsx" , fileName , true , true);
	}

</script>
</html>