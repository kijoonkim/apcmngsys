<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>통합조직 총 매입매출 과거조회 팝업</title>
	<!--
		새창으로 열기 기준
		SBUx openModal은 메인 페이지 에서 css js include 해오지만
		새창으로 열면 해당 부분이 없어서 추가 함
	-->
	<%@ include file="../../../frame/inc/headerScriptPopup.jsp" %>

</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold; font-size: 20px">통합조직 총 매입매출을 조회합니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="prdcrOgnHis-btnSearch" name="prdcrOgnHis-btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 15%">
						<col style="width: 30%">
						<col style="width: 15%">
						<col style="width: 30%">
						<col style="width: 15%">
						<col style="width: 30%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">등록년도</th>
							<td>
								<sbux-spinner
									id="srch-inp-yr"
									name="srch-inp-yr"
									uitype="normal"
									step-value="1"
									onchange="fn_yrChange(input_text)"
								></sbux-spinner>
							</td>
							<th scope="row">법인선택</th>
							<td>
								<div id = "srch-corpNm"></div>
							</td>
							<th scope="row">사업자번호</th>
							<td>
								<sbux-input
									uitype="text"
									id="srch-inp-brno"
									name="srch-inp-brno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->

				<!-- 통합조직 정보 영역 -->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="prdcrOgnHis-btnSearch-prdcrOgnz" name="prdcrOgnHis-btnSearch-prdcrOgnz" uitype="normal" text="총매입매출 조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlSearch"></sbux-button>
					</div>
				</div>
				<table class="table table-bordered tbl_fixed">
					<caption>통합조직 표기</caption>
					<colgroup>
						<col style="width: 15%">
						<col style="width: 30%">

						<col style="width: 15%">
						<col style="width: 17%">

						<col style="width: 15%">
						<col style="width: 17%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-corpNm"
									name="dtl-inp-corpNm"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<th scope="row" class="th_bg th_border_right">조직구분</th>
							<td class="td_input">
								<sbux-input uitype="hidden" id="dtl-inp-yr" name="dtl-inp-yr"></sbux-input>
								<sbux-select
									id="dtl-inp-apoSe"
									name="dtl-inp-apoSe"
									uitype="single"
									jsondata-ref="jsonComApoSe"
									unselected-text="선택"
									class="form-control input-sm"
									readonly
								></sbux-select>
							</td>
							<th scope="row" class="th_bg th_border_right">사업자번호</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-brno"
									name="dtl-inp-brno"
									class="form-control input-sm"
									mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- 매입 리스트 그리드 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶매입 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCntPrchs">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrchs" style="height:400px; width: 100%;"></div>
				</div>
				<br>

				<!-- 매출 리스트 그리드 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶매출 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCntSls">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdSls" style="height:400px; width: 100%;"></div>
				</div>

				<!-- 매출 리스트 그리드 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶출하처별 출하실적 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCntSpmt">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdSpmt" style="height:400px; width: 100%;"></div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	})

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_setYear();//기본년도 세팅
		fn_initSBSelect();

		let data = opener.fn_getData();
		let brno = data.brno;
		let corpNm = data.corpNm;
		let year = SBUxMethod.get("srch-inp-yr");

		await fn_createGridPrchs(year); //매입 그리드
		await fn_createGridSls(year); //매출 그리드
		await fn_createGridSpmt(year); //출하처별 출하실적 그리드


		await fn_searchUserInfo(brno,corpNm);
		await fn_search();//조회
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
		year = Number(year) - 1 ;
		SBUxMethod.set("srch-inp-yr",year);
	}

	/* 콤보박스 세팅 */

	//통합조직,출하조직
	var jsonComApoSe = [
		{'text': '통합조직','label': '통합조직', 'value': '1'},
		{'text': '출자출하조직','label': '출자출하조직', 'value': '2'}
	];
	//속한 통합조직 리스트
	var comUoBrno = [];
	var jsonComDtlTrmtType = [];

	/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		//console.log("============fn_initSBSelect============");
		// 검색 SB select
		let rst = await Promise.all([
			//gfn_setComCdSBSelect('dtl-inp-trmtType', 		jsonComDtlTrmtType, 	'TRMT_TYPE'), //취급유형
		]);
	}

	//변경된 사업자 리스트
	var jsonComHisBrno = [];

	/* 변경된 사업자번호 조회*/
	const fn_searchUserInfo = async function(_brno,_corpNm){
		//비이 있으면 동작하지 않게
		if(gfn_isEmpty(_brno)){
			return;
		}
		let postJsonPromise = gfn_postJSON("/pd/hisPopup/selectHisBrnoMngList.do", {
			brno : _brno
		});

		let data = await postJsonPromise ;
		try{
			jsonComHisBrno.length = 0;
			data.resultList.forEach((item, index) => {
				let ItemVO = {
						text: item.corpNm
						,value: item.brno
						,label: item.corpNm
				}
				jsonComHisBrno.push(ItemVO);
			});

			if(jsonComHisBrno.length == 0){
				$('#srch-corpNm').sbInput({
						id : "srch-inp-corpNm",
						name : "srch-inp-corpNm",
						uitype : "text",
						class : "form-control input-sm",
						readonly : true
					});
				SBUxMethod.set("srch-inp-corpNm",_corpNm);
				SBUxMethod.set("srch-inp-brno",_brno);
			}else{
				$('#srch-corpNm').sbSelect({
						id : "srch-inp-corpNm",
						name : "srch-inp-corpNm",
						uitype : "single",
						jsondataRef : "jsonComHisBrno",
						unselectedText : "전체",
						class : "form-control input-sm",
						onchange : "fn_chagneCorpNm"
					});
				SBUxMethod.set("srch-inp-corpNm",_brno);
				SBUxMethod.set("srch-inp-brno",_brno);
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}
	//법인명 변경 이벤트
	const fn_chagneCorpNm = async function(){
		let brno = SBUxMethod.get("srch-inp-corpNm");
		SBUxMethod.set("srch-inp-brno",brno);
	}

	var jsonPrchs = []; // 그리드의 참조 데이터 주소 선언
	var grdPrchs;

	const objMenuList02 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld02,			//콜백함수명
			}
		};

	//그리드 우클릭 엑셀다운로드
	function fn_excelDwnld02() {
		const currentDate = new Date();
		const year = currentDate.getFullYear().toString().padStart(4, '0');
		const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
		const day = currentDate.getDate().toString().padStart(2, '0');
		let formattedDate = year + month + day;
		let fileNm = formattedDate + "총매입매출 매입 리스트";
		grdPrdcrOgnz.exportLocalExcel( fileNm, {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* 매입 그리드 생성 */
	const fn_createGridPrchs = async function(_year) {
		// 년도에 따른 설정 가져오기
		const { columnsPrchs } = yrSettings[_year] || defaultSettings;

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrchs';
		SBGridProperties.id = 'grdPrchs';
		SBGridProperties.jsonref = 'jsonPrchs';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList02;	// 우클릭 메뉴 리스트
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.rowheader="seq";
		SBGridProperties.fixedrowheight=36;
		//부류 차이
		if(_year == '2024'){
			SBGridProperties.frozencols=3;
		}else{
			SBGridProperties.frozencols=4;
		}
		SBGridProperties.frozenbottomrows=1;

		SBGridProperties.columns = columnsPrchs;

		grdPrchs = _SBGrid.create(SBGridProperties);
		//클릭 이벤트 바인드
		//grdPrdcrOgnz.bind('click','fn_viewPrdcrOgnz');
		//grdPrdcrOgnz.bind('keyup','fn_keyupPrdcrOgnz');
	}

	var jsonSls = []; // 그리드의 참조 데이터 주소 선언
	var grdSls;

	const objMenuList03 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld03,			//콜백함수명
			}
		};

	//그리드 우클릭 엑셀다운로드
	function fn_excelDwnld03() {
		const currentDate = new Date();
		const year = currentDate.getFullYear().toString().padStart(4, '0');
		const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
		const day = currentDate.getDate().toString().padStart(2, '0');
		let formattedDate = year + month + day;
		let fileNm = formattedDate + "총매입매출 매출 리스트";
		grdCltvtnLand.exportLocalExcel( fileNm, {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* 공제 그리드 생성 */
	const fn_createGridSls = async function(_year) {
		// 년도에 따른 설정 가져오기
		const { columnsSls } = yrSettings[_year] || defaultSettings;

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdSls';
		SBGridProperties.id = 'grdSls';
		SBGridProperties.jsonref = 'jsonSls';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList03;	// 우클릭 메뉴 리스트
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.rowheader="seq";
		SBGridProperties.fixedrowheight=36;
		//부류 차이
		if(_year == '2024'){
			SBGridProperties.frozencols=3;
		}else{
			SBGridProperties.frozencols=4;
		}

		SBGridProperties.frozenbottomrows=1;

		SBGridProperties.columns = columnsSls;

		grdSls = _SBGrid.create(SBGridProperties);
	}

	var jsonSpmt = []; // 그리드의 참조 데이터 주소 선언
	var grdSpmt;

	const objMenuList04 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld04,			//콜백함수명
			}
		};

	//그리드 우클릭 엑셀다운로드
	function fn_excelDwnld04() {
		const currentDate = new Date();
		const year = currentDate.getFullYear().toString().padStart(4, '0');
		const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
		const day = currentDate.getDate().toString().padStart(2, '0');
		let formattedDate = year + month + day;
		let fileNm = formattedDate + "총매입매출 출하처별 출하실적 리스트";
		grdCltvtnLand.exportLocalExcel( fileNm, {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* 공제 그리드 생성 */
	const fn_createGridSpmt = async function(_year) {
		// 년도에 따른 설정 가져오기
		const { columnsSpmt } = yrSettings[_year] || defaultSettings;

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdSpmt';
		SBGridProperties.id = 'grdSpmt';
		SBGridProperties.jsonref = 'jsonSpmt';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList04;	// 우클릭 메뉴 리스트
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.rowheader="seq";
		SBGridProperties.fixedrowheight=36;
		//부류 차이
		if(_year == '2024'){
			SBGridProperties.frozencols=3;
		}else{
			SBGridProperties.frozencols=4;
		}

		SBGridProperties.frozenbottomrows=1;

		SBGridProperties.columns = columnsSpmt;

		grdSpmt = _SBGrid.create(SBGridProperties);
	}

	//조직 정보 초기화
	const fn_clearInfoOgnz = async function() {
		SBUxMethod.set('dtl-inp-yr',null);
		SBUxMethod.set('dtl-inp-apoSe',null);
		SBUxMethod.set('dtl-inp-corpNm',null);
		SBUxMethod.set('dtl-inp-brno',null);
	}

	//생산자조직 정보 초기화
	const fn_clearInfoPrdcrOgnz = async function() {
		SBUxMethod.set('dtl-inp-prdcrOgnzSn',null);
		SBUxMethod.set('dtl-inp-prdcrOgnzNm',null);
		SBUxMethod.set('dtl-inp-itemNm',null);
		SBUxMethod.set('dtl-inp-trmtType',null);
	}
	//조직 그리드 초기화
	const fn_clearGridOgnz = async function() {
		$('#ognzGrid').hide();
		jsonOgnz.length = 0;
		grdOgnz.rebuild();
		document.querySelector('#listCntOgnz').innerText = 0;
	}
	//매입 그리드 초기화
	const fn_clearGridPrchs = async function() {
		jsonPrchs.length = 0;
		grdPrchs.rebuild();
		document.querySelector('#listCntPrchs').innerText = 0;
	}
	//매출 그리드 초기화
	const fn_clearGridSls = async function() {
		jsonSls.length = 0;
		grdSls.rebuild();
		document.querySelector('#listCntSls').innerText = 0;
	}

	//출하처별 출하실적 그리드 초기화
	const fn_clearGridSpmt = async function() {
		jsonSpmt.length = 0;
		grdSpmt.rebuild();
		document.querySelector('#listCntSpmt').innerText = 0;
	}

	//사업자정보 조회
	const fn_search = async function() {
		//전체 조회 정보 초기화
		fn_clearInfoOgnz();//조직 정보 초기화
		fn_clearGridPrchs();//매입 그리드 초기화
		fn_clearGridSls();//매출 그리드 초기화
		fn_clearGridSpmt();//출하처별 출하실적 그리드 초기화

		let yr = SBUxMethod.get('srch-inp-yr');
		let brno = SBUxMethod.get('srch-inp-brno');

		//년도에 따른 그리드 변경 처리
		await fn_createGridPrchs(yr); //매입 그리드
		await fn_createGridSls(yr); //매출 그리드
		await fn_createGridSpmt(yr); //출하처별 출하실적 그리드

		if(gfn_isEmpty(brno)){
			return;
		}

		let postJsonPromise = gfn_postJSON("/pd/hisPopup/selectHisBrnoInfo.do", {
			brno : brno
			,yr : yr
		});

		let data = await postJsonPromise ;

		try{
			let item = data.brnoInfo;
			if(item != null){
				SBUxMethod.set('dtl-inp-yr',yr);
				//통합조직 ,출자출하조직 여부
				//하위 출자출하조직 존재 여부, 출자출하조직 리스트
				if(item.apoSe == '1'){
					//하위 출자출하조직 존재 여부
					SBUxMethod.set('dtl-inp-brno',item.brno);
					SBUxMethod.set('dtl-inp-apoSe',item.apoSe);
					SBUxMethod.set('dtl-inp-corpNm',item.corpNm);
				}else if(item.apoSe == '2'){
					alert('통합조직이 아닙니다');
				}
			}else{
				alert('해당년도 실적 정보가 없습니다');
			}

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/* 총매입매출 리스트 조회 */
	const fn_dtlSearch = async function() {
		let yr = SBUxMethod.get('dtl-inp-yr');
		let brno = SBUxMethod.get('dtl-inp-brno');

		if(gfn_isEmpty(brno)){
			return;
		}

		// 년도에 따른 설정 가져오기
		const { urlUoPurSal } = yrSettings[yr] || defaultSettings;

		let postJsonPromise = gfn_postJSON(urlUoPurSal, {
			yr : yr
			,brno : brno
		});
		let data = await postJsonPromise;
		try{
			jsonPrchs.length = 0;
			jsonSls.length = 0;
			data.resultList.forEach((item, index) => {
				//년도별 차이와 관계없이 전부 넣기
				if(item.prchsSlsSe === '1'){
					let itemVo = {
							apoCd: 	item.apoCd
							,apoSe: item.apoSe
							,brno: 	item.brno
							,crno: 	item.crno
							,delYn: item.delYn
							,yr: item.yr

							,sttgUpbrItemSe: item.sttgUpbrItemSe
							,sttgUpbrItemNm: item.sttgUpbrItemNm

							,ctgryCd: 		item.ctgryCd
							,ctgryNm: 		item.ctgryNm
							,clsfCd: 		item.clsfCd
							,clsfNm: 		item.clsfNm
							,itemCd: 		item.itemCd
							,itemNm: 		item.itemNm

							,prchsSlsSe: 	item.prchsSlsSe

							/* 매입 수탁 */
							,prchsSortTrstVlm: 		item.prchsSortTrstVlm
							,prchsSortTrstAmt: 		item.prchsSortTrstAmt
							,prchsSpmtTrstVlm: 		item.prchsSpmtTrstVlm
							,prchsSpmtTrstAmt: 		item.prchsSpmtTrstAmt
							,prchsSmplTrstVlm: 		item.prchsSmplTrstVlm
							,prchsSmplTrstAmt: 		item.prchsSmplTrstAmt
							/* 매입 수탁 소계 */
							,prchsTrstVlm: 			item.prchsTrstVlm
							,prchsTrstAmt: 			item.prchsTrstAmt
							/* 매입 매취 */
							,prchsSortEmspapVlm: 	item.prchsSortEmspapVlm
							,prchsSortEmspapAmt: 	item.prchsSortEmspapAmt
							,prchsSmplEmspapVlm: 	item.prchsSmplEmspapVlm
							,prchsSmplEmspapAmt: 	item.prchsSmplEmspapAmt
							/* 매입 매취 소계 */
							,prchsEmspapVlm: 		item.prchsEmspapVlm
							,prchsEmspapAmt: 		item.prchsEmspapAmt

							/* 매입 합계 */
							,prchsTotVlm: 	item.prchsTotVlm
							,prchsTotAmt: 	item.prchsTotAmt

					};
					jsonPrchs.push(itemVo);
				}else if (item.prchsSlsSe === '2'){
					let itemVo = {
							apoCd: 	item.apoCd
							,apoSe: item.apoSe
							,brno: 	item.brno
							,crno: 	item.crno
							,delYn: item.delYn
							,yr: item.yr

							,sttgUpbrItemSe: item.sttgUpbrItemSe
							,sttgUpbrItemNm: item.sttgUpbrItemNm

							,ctgryCd: 		item.ctgryCd
							,ctgryNm: 		item.ctgryNm
							,clsfCd: 		item.clsfCd
							,clsfNm: 		item.clsfNm
							,itemCd: 		item.itemCd
							,itemNm: 		item.itemNm

							,prchsSlsSe: 		item.prchsSlsSe

							/* 매출 수탁 */
							,slsCprtnTrstVlm: 			item.slsCprtnTrstVlm
							,slsCprtnTrstAmt: 			item.slsCprtnTrstAmt
							,slsCprtnSortTrstVlm: 		item.slsCprtnSortTrstVlm
							,slsCprtnSortTrstAmt: 		item.slsCprtnSortTrstAmt
							,slsSmplTrstVlm: 			item.slsSmplTrstVlm
							,slsSmplTrstAmt: 			item.slsSmplTrstAmt
							/* 매출 수탁 합계 */
							,slsTrstVlm: 				item.slsTrstVlm
							,slsTrstAmt: 				item.slsTrstAmt
							/* 매출 매취 */
							,slsCprtnSortEmspapVlm: 	item.slsCprtnSortEmspapVlm
							,slsCprtnSortEmspapAmt: 	item.slsCprtnSortEmspapAmt
							,slsSmplEmspapVlm: 			item.slsSmplEmspapVlm
							,slsSmplEmspapAmt: 			item.slsSmplEmspapAmt
							/* 매출 매취 소계 */
							,slsEmspapVlm: 				item.slsEmspapVlm
							,slsEmspapAmt: 				item.slsEmspapAmt
							/* 매출 합계 */
							,slsTotVlm: 	item.slsTotVlm
							,slsTotAmt: 	item.slsTotAmt
							/* 20241215 기타 제외 요청 */
							,ddcVlm: 		item.ddcVlm
							,ddcAmt: 		item.ddcAmt
					};
					jsonSls.push(itemVo);
					let itemSpmtVo = {
							apoCd: 	item.apoCd
							,apoSe: item.apoSe
							,brno: 	item.brno
							,crno: 	item.crno
							,delYn: item.delYn
							,yr: item.yr

							,sttgUpbrItemSe: item.sttgUpbrItemSe
							,sttgUpbrItemNm: item.sttgUpbrItemNm

							,ctgryCd: 		item.ctgryCd
							,ctgryNm: 		item.ctgryNm
							,clsfCd: 		item.clsfCd
							,clsfNm: 		item.clsfNm
							,itemCd: 		item.itemCd
							,itemNm: 		item.itemNm

							,prchsSlsSe: 		item.prchsSlsSe

							,slsTotVlm: 	item.slsTotVlm
							,slsTotAmt: 	item.slsTotAmt

							,pblcWhlslMrktVlm: 	item.pblcWhlslMrktVlm
							,pblcWhlslMrktAmt: 	item.pblcWhlslMrktAmt
							/* 20241217 온라인도매시장 제외 요청 */
							/* 별도의 화면에서 받고 해당값은 기타에 들어가도 된다함 */
							,onlnWhlslMrktVlm: 	item.onlnWhlslMrktVlm
							,onlnWhlslMrktAmt: 	item.onlnWhlslMrktAmt

							,lgszRtlVlm: 		item.lgszRtlVlm
							,lgszRtlAmt: 		item.lgszRtlAmt
							,armyDlvgdsVlm: 	item.armyDlvgdsVlm
							,armyDlvgdsAmt: 	item.armyDlvgdsAmt

							,eatoutMtrlMlsrVlm:	item.eatoutMtrlMlsrVlm
							,eatoutMtrlMlsrAmt:	item.eatoutMtrlMlsrAmt
							,mnfcRtlVlm: 		item.mnfcRtlVlm
							,mnfcRtlAmt: 		item.mnfcRtlAmt

							,exprtVlm: 			item.exprtVlm
							,exprtAmt: 			item.exprtAmt
							,onlnDlngPrfmncVlm:	item.onlnDlngPrfmncVlm
							,onlnDlngPrfmncAmt:	item.onlnDlngPrfmncAmt

							,etcVlm: 			item.etcVlm
							,etcAmt: 			item.etcAmt
						};
					jsonSpmt.push(itemSpmtVo);
				}
			});
			document.querySelector('#listCntPrchs').innerText = jsonPrchs.length;
			document.querySelector('#listCntSls').innerText = jsonSls.length;
			document.querySelector('#listCntSpmt').innerText = jsonSpmt.length;
			//소계 추가
			grdPrchs.addRow();
			grdSls.addRow();
			grdSpmt.addRow();

			fn_grdTot01();
			fn_grdTot02();
			fn_grdTot03();

			grdPrchs.rebuild();
			grdSls.rebuild();
			grdSpmt.rebuild();
			fn_gridCustom();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//그리드 커스텀 배경 및 disabled 처리
	const fn_gridCustom = async function(){
		//console.log("=========fn_gridCustom================");
		let yr = SBUxMethod.get('dtl-inp-yr');

		//매입 그리드
		let objGrid01 = grdPrchs;

		let prchsSortTrstAmt = objGrid01.getColRef("prchsSortTrstAmt");//
		let prchsSpmtTrstAmt = objGrid01.getColRef("prchsSpmtTrstAmt");//
		let prchsSmplTrstAmt = objGrid01.getColRef("prchsSmplTrstAmt");//

		let prchsSortTrstVlm = objGrid01.getColRef("prchsSortTrstVlm");//
		let prchsSpmtTrstVlm = objGrid01.getColRef("prchsSpmtTrstVlm");//
		let prchsSmplTrstVlm = objGrid01.getColRef("prchsSmplTrstVlm");//

		let prchsSortEmspapAmt = objGrid01.getColRef("prchsSortEmspapAmt");//
		let prchsSmplEmspapAmt = objGrid01.getColRef("prchsSmplEmspapAmt");//

		let prchsSortEmspapVlm = objGrid01.getColRef("prchsSortEmspapVlm");//
		let prchsSmplEmspapVlm = objGrid01.getColRef("prchsSmplEmspapVlm");//

		let prchsTrstVlm = objGrid01.getColRef("prchsTrstVlm");//
		let prchsTrstAmt = objGrid01.getColRef("prchsTrstAmt");//
		let prchsEmspapVlm = objGrid01.getColRef("prchsEmspapVlm");//
		let prchsEmspapAmt = objGrid01.getColRef("prchsEmspapAmt");//

		let prchsTotVlm = objGrid01.getColRef("prchsTotVlm");//
		let prchsTotAmt = objGrid01.getColRef("prchsTotAmt");//

		let sttgUpbrItemNm01 = objGrid01.getColRef("sttgUpbrItemNm");//

		let gridData01 = objGrid01.getGridDataAll();
		//그리드 해더 row수
		let captionRow01 = objGrid01.getFixedRows();
		for(var i = captionRow01; i < gridData01.length + captionRow01; i++){
			let rowData = objGrid01.getRowData(i);
			if(rowData.sttgUpbrItemSe == '1' || rowData.sttgUpbrItemSe == '2'){
				if(yr == '2024'){
					//배경 속성 추가
					objGrid01.setCellStyle('background-color', i, prchsTrstAmt, i, prchsTrstAmt, 'lightgray');
					objGrid01.setCellStyle('background-color', i, prchsEmspapAmt, i, prchsEmspapAmt, 'lightgray');
				}else{
					//배경 속성 추가
					objGrid01.setCellStyle('background-color', i, prchsSortTrstVlm, i, prchsSortTrstAmt, 'lightgray');
					objGrid01.setCellStyle('background-color', i, prchsSpmtTrstVlm, i, prchsSpmtTrstAmt, 'lightgray');
					objGrid01.setCellStyle('background-color', i, prchsSortEmspapVlm, i, prchsSortEmspapAmt, 'lightgray');

					objGrid01.setCellStyle('background-color', i, prchsTrstVlm, i, prchsTrstAmt, 'lightgray');
					objGrid01.setCellStyle('background-color', i, prchsEmspapVlm, i, prchsEmspapAmt, 'lightgray');
				}
				objGrid01.setCellStyle('background-color', i, prchsTotVlm, i, prchsTotVlm, 'lightgray');
				objGrid01.setCellStyle('background-color', i, prchsTotAmt, i, prchsTotAmt, 'lightgray');
			}else if (rowData.sttgUpbrItemSe == '3') {
				if(yr == '2024'){
					objGrid01.setCellStyle('background-color', i, prchsTrstVlm, i, prchsTrstAmt, 'wihte');
					objGrid01.setCellStyle('background-color', i, prchsEmspapVlm, i, prchsEmspapAmt, 'wihte');
				}else{
					objGrid01.setCellStyle('background-color', i, prchsTrstVlm, i, prchsTrstAmt, 'lightgray');
					objGrid01.setCellStyle('background-color', i, prchsEmspapVlm, i, prchsEmspapAmt, 'lightgray');
				}
				objGrid01.setCellStyle('background-color', i, prchsTotVlm, i, prchsTotVlm, 'lightgray');
				objGrid01.setCellStyle('background-color', i, prchsTotAmt, i, prchsTotAmt, 'lightgray');
			}else{
				objGrid01.setCellStyle('background-color', i, sttgUpbrItemNm01, i, prchsTotAmt, 'lightgray');
			}
		}

		let objGrid02 = grdSls;

		let ddcAmt = objGrid02.getColRef("ddcAmt");//
		let sttgUpbrItemNm02 = objGrid02.getColRef("sttgUpbrItemNm");//

		let gridData02 = objGrid02.getGridDataAll();
		//그리드 해더 row수
		let captionRow02 = objGrid02.getFixedRows();
		for(var i = captionRow02; i < gridData02.length + captionRow02; i++){
			let rowData = objGrid02.getRowData(i);

			if(rowData.sttgUpbrItemSe == '1' || rowData.sttgUpbrItemSe == '2'){
				//배경색
				//objGrid02.setCellStyle('background-color', i, totTrmtPrfmncVlm, i, totTrmtPrfmncAmt, 'lightgray');

			}else if(rowData.sttgUpbrItemSe == '3'){
				//기타품목
				//배경색
				//objGrid02.setCellStyle('background-color', i, ddcExprtVlm, i, ajmtAmt, 'lightgray');
			}else{
				//소계
				//배경색
				objGrid02.setCellStyle('background-color', i, sttgUpbrItemNm02, i, ddcAmt, 'lightgray');
			}
		}
		//출하처별 출하실적
		let objGrid03 = grdSpmt;

		let etcAmt = objGrid03.getColRef("etcAmt");//
		let sttgUpbrItemNm03 = objGrid03.getColRef("sttgUpbrItemNm");//

		let gridData03 = objGrid03.getGridDataAll();
		//그리드 해더 row수
		let captionRow03 = objGrid03.getFixedRows();
		for(var i = captionRow03; i < gridData03.length + captionRow03; i++){
			let rowData = objGrid03.getRowData(i);

			if(rowData.sttgUpbrItemSe == '1' || rowData.sttgUpbrItemSe == '2'){
				//배경색

			}else if(rowData.sttgUpbrItemSe == '3'){
				//기탚품목
				//배경색

			}else{
				//소계
				//배경색
				objGrid03.setCellStyle('background-color', i, sttgUpbrItemNm03, i, etcAmt, 'lightgray');
			}
		}
	}

	//소계 추가를 위해 조정
	function fn_grdTot01(){
		// 계산할 열 이름 배열
		const columnsToSum = [
			"prchsTrstVlm", "prchsTrstAmt"
			,"prchsEmspapVlm", "prchsEmspapAmt"
			,"prchsTotVlm", "prchsTotAmt"
			,"prchsSortTrstVlm","prchsSortTrstAmt"
			,"prchsSpmtTrstVlm","prchsSpmtTrstAmt"
			,"prchsSmplTrstVlm","prchsSmplTrstAmt"
			,"prchsSortEmspapVlm","prchsSortEmspapAmt"
			,"prchsSmplEmspapVlm","prchsSmplEmspapAmt"
		];
		//그리드 추가 용 1줄 합계용 1줄
		let objGrid = grdPrchs;
		let grdJson = jsonPrchs;

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

	//소계 추가를 위해 조정
	function fn_grdTot02(){
		// 계산할 열 이름 배열
		const columnsToSum = [
			"slsCprtnSortTrstVlm",
			"slsCprtnSortTrstAmt",
			"slsCprtnTrstVlm",
			"slsCprtnTrstAmt",
			"slsSmplTrstVlm",
			"slsSmplTrstAmt",
			"slsTrstVlm",
			"slsTrstAmt",
			"slsCprtnSortEmspapVlm",
			"slsCprtnSortEmspapAmt",
			"slsSmplEmspapVlm",
			"slsSmplEmspapAmt",
			"slsEmspapVlm",
			"slsEmspapAmt",
			"slsTotVlm",
			"slsTotAmt",
			"ddcVlm",
			"ddcAmt"
		];

		//그리드 추가 용 1줄 합계용 1줄
		let objGrid = grdSls;
		let grdJson = jsonSls;

		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		//그리드 내용 row수
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

		fn_gridCustom();
	}

	//소계 계산
	function fn_grdTot03(){
		// 계산할 열 이름 배열
		const columnsToSum = [
			"slsTotVlm",
			"slsTotAmt",
			"pblcWhlslMrktVlm",
			"pblcWhlslMrktAmt",
			"onlnWhlslMrktVlm",
			"onlnWhlslMrktAmt",
			"lgszRtlVlm",
			"lgszRtlAmt",
			"armyDlvgdsVlm",
			"armyDlvgdsAmt",
			"eatoutMtrlMlsrVlm",
			"eatoutMtrlMlsrAmt",
			"mnfcRtlVlm",
			"mnfcRtlAmt",
			"exprtVlm",
			"exprtAmt",
			"onlnDlngPrfmncVlm",
			"onlnDlngPrfmncAmt",
			"etcVlm",
			"etcAmt"
		];

		let objGrid = grdSpmt;
		let grdJson = jsonSpmt;

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
		objGrid.setCellData(grdLength + captionRow - 1, objGrid.getColRef("sttgUpbrItemNm"), "소계", true);

		objGrid.refresh();
	}

	/* 년도별 컬럼 세팅 */
	/* 매입 */
	const columnsPrchs2024 = [
		{caption: ["품목","품목"], 	ref: 'sttgUpbrItemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["품목분류","품목분류"], 	ref: 'ctgryNm',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},

		{caption: ["수탁","물량(톤)"], 		ref: 'prchsTrstVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","금액(천원)"], 		ref: 'prchsTrstAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","물량(톤)"], 		ref: 'prchsEmspapVlm',   type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","금액(천원)"], 		ref: 'prchsEmspapAmt',   type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["합계","물량(톤)"], 		ref: 'prchsTotVlm',   		type:'output',  width:'90px',    style:'text-align:center; background-color: lightgray'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["합계","금액(천원)"], 		ref: 'prchsTotAmt',   		type:'output',  width:'100px',    style:'text-align:center; background-color: lightgray'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

		{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
		{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	];

	const columnsPrchs2025 = [
		{caption: ["구분","구분","구분"], 			ref: 'sttgUpbrItemNm',		type:'output',  width:'55px',    style:'text-align:center'},
		{caption: ["부류","부류","부류"], 			ref: 'clsfNm',		type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["평가부류","평가부류","평가부류"], 	ref: 'ctgryNm',		type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["품목","품목","품목"], 			ref: 'itemNm',		type:'output',  width:'80px',    style:'text-align:center; border-right-color: black !important;'},

		/*수탁*/
		{caption: ["수탁","공동선별수탁","물량(톤)"], 	ref: 'prchsSortTrstVlm',   	type:'output',  width:'50px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","공동선별수탁","금액(천원)"], 	ref: 'prchsSortTrstAmt',   	type:'output',  width:'80px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","공동출하수탁","물량(톤)"], 	ref: 'prchsSpmtTrstVlm',   type:'output',  width:'50px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","공동출하수탁","금액(천원)"], 	ref: 'prchsSpmtTrstAmt',   type:'output',  width:'80px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","단순수탁","물량(톤)"], 		ref: 'prchsSmplTrstVlm',   type:'output',  width:'50px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","단순수탁","금액(천원)"], 	ref: 'prchsSmplTrstAmt',   type:'output',  width:'80px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","수탁소계","물량(톤)"], 		ref: 'prchsTrstVlm',   type:'output',  width:'50px',    style:'text-align:center; background-color: lightgray'
			//, calc : 'fn_prchsTrstVlmSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","수탁소계","금액(천원)"], 	ref: 'prchsTrstAmt',   type:'output',  width:'80px',    style:'text-align:center; background-color: lightgray; border-right-color: black !important;'
			//, calc : 'fn_prchsTrstAmtSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		/*매취*/
		{caption: ["매취","공동선별매취","물량(톤)"], 	ref: 'prchsSortEmspapVlm',   type:'output',  width:'50px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","공동선별매취","금액(천원)"], 	ref: 'prchsSortEmspapAmt',   type:'output',  width:'80px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","단순매취","물량(톤)"], 		ref: 'prchsSmplEmspapVlm',   type:'output',  width:'50px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","단순매취","금액(천원)"], 	ref: 'prchsSmplEmspapAmt',   type:'output',  width:'80px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","매취 소계","물량(톤)"], 		ref: 'prchsEmspapVlm',   type:'output',  width:'50px',    style:'text-align:center; background-color: lightgray'
			//, calc : 'fn_prchsEmspapVlmSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","매취 소계","금액(천원)"], 	ref: 'prchsEmspapAmt',   type:'output',  width:'80px',    style:'text-align:center; background-color: lightgray; border-right-color: black !important;'
			//, calc : 'fn_prchsEmspapAmtSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		/*합계*/
		{caption: ["합계","합계","물량(톤)"], 		ref: 'prchsTotVlm',   		type:'output',  width:'50px',    style:'text-align:center; background-color: lightgray'
			//, calc : 'fn_prchsVlmSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["합계","합계","금액(천원)"], 		ref: 'prchsTotAmt',   		type:'output',  width:'80px',    style:'text-align:center; background-color: lightgray'
			//, calc : 'fn_prchsAmtSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

		{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'crno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
		{caption: ["상세내역"], 	ref: 'clsfCd',		hidden : true},
		{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'delYn',		hidden : true},
	];

	const columnsSls2024 = [
		{caption: ["품목","품목"], 	ref: 'sttgUpbrItemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["품목분류","품목분류"], 	ref: 'ctgryNm',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},

		{caption: ["수탁","물량(톤)"], 		ref: 'slsEmspapVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","금액(천원)"], 		ref: 'slsEmspapAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","물량(톤)"], 		ref: 'slsTrstVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","금액(천원)"], 		ref: 'slsTrstAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["합계","물량(톤)"], 		ref: 'slsTotVlm',   	type:'output',  width:'90px',    style:'text-align:center; background-color: lightgray'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["합계","금액(천원)"], 		ref: 'slsTotAmt',   	type:'output',  width:'100px',    style:'text-align:center; background-color: lightgray'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

		{caption: ["자체공판장 매출액","물량(톤)"], 	ref: 'ddcVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["자체공판장 매출액","금액(천원)"], 	ref: 'ddcAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

		{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
		{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	];

	const columnsSls2025 = [
		{caption: ["구분","구분","구분"], 			ref: 'sttgUpbrItemNm',		type:'output',  width:'55px',    style:'text-align:center'},
		{caption: ["부류","부류","부류"], 			ref: 'clsfNm',		type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["평가부류","평가부류","평가부류"], 	ref: 'ctgryNm',		type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["품목","품목","품목"], 			ref: 'itemNm',		type:'output',  width:'80px',    style:'text-align:center; border-right-color: black !important;'},

		/*수탁*/
		{caption: ["수탁","공동선별수탁","물량(톤)"], 	ref: 'slsCprtnSortTrstVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","공동선별수탁","금액(천원)"], 	ref: 'slsCprtnSortTrstAmt',   	type:'output',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","공동출하수탁","물량(톤)"], 	ref: 'slsCprtnTrstVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","공동출하수탁","금액(천원)"], 	ref: 'slsCprtnTrstAmt',   	type:'output',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","단순수탁","물량(톤)"], 		ref: 'slsSmplTrstVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","단순수탁","금액(천원)"], 	ref: 'slsSmplTrstAmt',   	type:'output',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","수탁 소계","물량(톤)"], 		ref: 'slsTrstVlm',   	type:'output',  width:'50px',    style:'text-align:right; background-color: lightgray'
			//, calc : 'fn_slsTrstVlm'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","수탁 소계","금액(천원)"], 	ref: 'slsTrstAmt',   	type:'output',  width:'80px',    style:'text-align:right; background-color: lightgray; border-right-color: black !important;'
			//, calc : 'fn_slsTrstAmt'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		/*매취*/
		{caption: ["매취","공동선별매취","물량(톤)"], 	ref: 'slsCprtnSortEmspapVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","공동선별매취","금액(천원)"], 	ref: 'slsCprtnSortEmspapAmt',   	type:'output',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","단순매취","물량(톤)"], 		ref: 'slsSmplEmspapVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","단순매취","금액(천원)"], 	ref: 'slsSmplEmspapAmt',   	type:'output',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","매취 소계","물량(톤)"], 		ref: 'slsEmspapVlm',   	type:'output',  width:'50px',    style:'text-align:right; background-color: lightgray'
			//, calc : 'fn_slsEmspapVlm'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","매취 소계","금액(천원)"], 	ref: 'slsEmspapAmt',   	type:'output',  width:'80px',    style:'text-align:right; background-color: lightgray; border-right-color: black !important;'
			//, calc : 'fn_slsEmspapAmt'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		//합계
		{caption: ["합계","합계","물량(톤)"], 	ref: 'slsTotVlm',   	type:'output',  width:'50px',    style:'text-align:right; background-color: lightgray'
			//, calc : 'fn_slsVlmSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["합계","합계","금액(천원)"], 	ref: 'slsTotAmt',   	type:'output',  width:'80px',    style:'text-align:right; background-color: lightgray'
			//, calc : 'fn_slsAmtSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		/*자체공판장 매출*/
		{caption: ["자체공판장 매출액","자체공판장 매출액","물량(톤)"], 	ref: 'ddcVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["자체공판장 매출액","자체공판장 매출액","금액(천원)"], 	ref: 'ddcAmt',   	type:'output',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},


		{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
		{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'crno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
		{caption: ["상세내역"], 	ref: 'clsfCd',		hidden : true},
		{caption: ["상세내역"], 	ref: 'delYn',		hidden : true},
	];

	const columnsSpmt2024 = [
		{caption: ["품목","품목"], 	ref: 'sttgUpbrItemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["품목분류","품목분류"], 	ref: 'ctgryNm',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},

		{caption: ["합계","물량(톤)"], 		ref: 'slsTotVlm',   	type:'output',  width:'90px',    style:'text-align:center; background-color: lightgray'
			//, calc : 'fn_slsTotVlmSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["합계","금액(천원)"], 		ref: 'slsTotAmt',   	type:'output',  width:'100px',    style:'text-align:center; background-color: lightgray'
			//, calc : 'fn_slsTotAmtSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

		{caption: ["공영\n도매시장","물량(톤)"], 		ref: 'pblcWhlslMrktVlm',   	type:'output',  width:'90px',    style:'text-align:center' 				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["공영\n도매시장","금액(천원)"], 		ref: 'pblcWhlslMrktAmt',   	type:'output',  width:'100px',    style:'text-align:center' 				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["온라인\n도매시장","물량(톤)"], 		ref: 'onlnWhlslMrktVlm',   	type:'output',  width:'90px',    style:'text-align:center' 				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["온라인\n도매시장","금액(천원)"], 		ref: 'onlnWhlslMrktAmt',   	type:'output',  width:'100px',    style:'text-align:center' 			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["대형\n유통업체","물량(톤)"], 		ref: 'lgszRtlVlm',   	type:'output',  width:'90px',    style:'text-align:center' 					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["대형\n유통업체","금액(천원)"], 		ref: 'lgszRtlAmt',   	type:'output',  width:'100px',    style:'text-align:center' 					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["군납","물량(톤)"], 		ref: 'armyDlvgdsVlm',   	type:'output',  width:'90px',    style:'text-align:center' 						,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["군납","금액(천원)"], 		ref: 'armyDlvgdsAmt',   	type:'output',  width:'100px',    style:'text-align:center' 					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["외식, 식자재\n및 단체급식","물량(톤)"], 		ref: 'eatoutMtrlMlsrVlm',   	type:'output',  width:'90px',    style:'text-align:center' 	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["외식, 식자재\n및 단체급식","금액(천원)"], 		ref: 'eatoutMtrlMlsrAmt',   	type:'output',  width:'100px',    style:'text-align:center' 	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["가공업체","물량(톤)"], 		ref: 'mnfcRtlVlm',   	type:'output',  width:'90px',    style:'text-align:center' 						,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["가공업체","금액(천원)"], 		ref: 'mnfcRtlAmt',   	type:'output',  width:'100px',    style:'text-align:center' 						,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["수출","물량(톤)"], 		ref: 'exprtVlm',   	type:'output',  width:'90px',    style:'text-align:center' 								,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["수출","금액(천원)"], 	ref: 'exprtAmt',   	type:'output',  width:'100px',    style:'text-align:center' 							,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["온라인 거래실적\n(e커머스, TV홈쇼핑 등 포함)","물량(톤)"], 		ref: 'onlnDlngPrfmncVlm',   	type:'output',  width:'90px',    style:'text-align:center' 		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["온라인 거래실적\n(e커머스, TV홈쇼핑 등 포함)","금액(천원)"], 	ref: 'onlnDlngPrfmncAmt',   	type:'output',  width:'100px',    style:'text-align:center' 	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["기타","물량(톤)"], 		ref: 'etcVlm',   	type:'output',  width:'90px',    style:'text-align:center; background-color: lightgray'
			//, calc : 'fn_etcVlm'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["기타","금액(천원)"], 	ref: 'etcAmt',   	type:'output',  width:'100px',    style:'text-align:center; background-color: lightgray'
			//, calc : 'fn_etcAmt'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
		{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	];

	const columnsSpmt2025 = [
		{caption: ["구분","구분"], 			ref: 'sttgUpbrItemNm',		type:'output',  width:'55px',    style:'text-align:center'},
		{caption: ["부류","부류"], 			ref: 'clsfNm',		type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["평가부류","평가부류"], 	ref: 'ctgryNm',		type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["품목","품목"], 			ref: 'itemNm',		type:'output',  width:'80px',    style:'text-align:center; border-right-color: black !important;'},
		//합계는 고정에 기타 값을 조정 하는 방향으로 변경
		//구분 기타의 경우만 합산
		{caption: ["합계","물량(톤)"], 		ref: 'slsTotVlm',   	type:'output',  width:'50px',    style:'text-align:right; background-color: lightgray'
			//, calc : 'fn_slsTotVlmSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["합계","금액(천원)"], 		ref: 'slsTotAmt',   	type:'output',  width:'80px',    style:'text-align:right; background-color: lightgray; border-right-color: black !important;'
			//, calc : 'fn_slsTotAmtSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},

		{caption: ["공영\n도매시장","물량(톤)"], 		ref: 'pblcWhlslMrktVlm',   	type:'output',  width:'50px',    style:'text-align:right' 				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["공영\n도매시장","금액(천원)"], 		ref: 'pblcWhlslMrktAmt',   	type:'output',  width:'80px',    style:'text-align:right' 				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		/* 20241215 온라인 도매시장 제외 요청 */
		//{caption: ["온라인\n도매시장","물량(톤)"], 		ref: 'onlnWhlslMrktVlm',   	type:'input',  width:'50px',    style:'text-align:right' 				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		//{caption: ["온라인\n도매시장","금액(천원)"], 		ref: 'onlnWhlslMrktAmt',   	type:'input',  width:'100px',    style:'text-align:right' 			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["대형\n유통업체","물량(톤)"], 		ref: 'lgszRtlVlm',   	type:'output',  width:'50px',    style:'text-align:right' 					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["대형\n유통업체","금액(천원)"], 		ref: 'lgszRtlAmt',   	type:'output',  width:'80px',    style:'text-align:right' 					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["군납","물량(톤)"], 		ref: 'armyDlvgdsVlm',   	type:'output',  width:'50px',    style:'text-align:right' 						,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["군납","금액(천원)"], 	ref: 'armyDlvgdsAmt',   	type:'output',  width:'80px',    style:'text-align:right' 					,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["외식, 식자재\n및 단체급식","물량(톤)"], 		ref: 'eatoutMtrlMlsrVlm',   	type:'output',  width:'50px',    style:'text-align:right' 	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["외식, 식자재\n및 단체급식","금액(천원)"], 		ref: 'eatoutMtrlMlsrAmt',   	type:'output',  width:'80px',    style:'text-align:right' 	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["가공업체","물량(톤)"], 		ref: 'mnfcRtlVlm',   	type:'output',  width:'50px',    style:'text-align:right' 						,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["가공업체","금액(천원)"], 		ref: 'mnfcRtlAmt',   	type:'output',  width:'80px',    style:'text-align:right' 						,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["수출","물량(톤)"], 		ref: 'exprtVlm',   	type:'output',  width:'50px',    style:'text-align:right' 								,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["수출","금액(천원)"], 	ref: 'exprtAmt',   	type:'output',  width:'80px',    style:'text-align:right' 							,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["온라인 거래실적\n(e커머스, TV홈쇼핑 등 포함)","물량(톤)"], 		ref: 'onlnDlngPrfmncVlm',   	type:'output',  width:'50px',    style:'text-align:right' 		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["온라인 거래실적\n(e커머스, TV홈쇼핑 등 포함)","금액(천원)"], 	ref: 'onlnDlngPrfmncAmt',   	type:'output',  width:'80px',    style:'text-align:right; border-right-color: black !important;' 	,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		//기타값은 합계 - 기타를 제외 한 값의 합
		//구분 기타의 경우는 계산하지 않음
		{caption: ["기타","물량(톤)"], 		ref: 'etcVlm',   	type:'output',  width:'50px',    style:'text-align:right; background-color: lightgray'
			//, calc : 'fn_etcVlm'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["기타","금액(천원)"], 		ref: 'etcAmt',   	type:'output',  width:'80px',    style:'text-align:right; background-color: lightgray'
			//, calc : 'fn_etcAmt'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
		{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'crno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
		{caption: ["상세내역"], 	ref: 'clsfCd',		hidden : true},
		{caption: ["상세내역"], 	ref: 'delYn',		hidden : true},
	];

	//년도별 설정 객체 생성
	//없으면 null 이고 그리드에서 쓰지 않으면 표기도 안됨
	//변경 사항이 쭉없을 것으로 판단되면 defaultSettings 에 세팅 해주면 됨
	const yrSettings = {
		"2024": {
			columnsPrchs : columnsPrchs2024
			, columnsSls : columnsSls2024
			, columnsSpmt : columnsSpmt2024
			, urlUoPurSal : '/pd/hisPopup/selectHisUoPurSal2024.do'
		},
		"2025": {
			columnsPrchs : columnsPrchs2025
			, columnsSls : columnsSls2025
			, columnsSpmt : columnsSpmt2025
			, urlUoPurSal : '/pd/hisPopup/selectHisUoPurSal2025.do'
		},
	};
	//기본 설정
	const defaultSettings = {
			columnsPrchs : columnsPrchs2025
			, columnsSls : columnsSls2025
			, columnsSpmt : columnsSpmt2025
			, urlUoPurSal : '/pd/hisPopup/selectHisUoPurSal2025.do'
		}

</script>
</html>