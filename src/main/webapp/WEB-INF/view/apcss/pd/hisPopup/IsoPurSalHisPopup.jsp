<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>출자출하조직 총 매입매출 과거조회 팝업</title>
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
						<span style="font-weight:bold; font-size: 20px">출자출하조직 총 매입매출을 조회합니다.</span>
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
				<!--[pp] 검색결과 -->
				<div id = "ognzGrid" class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">사업자번호 목록</span>
								<span style="font-size:12px">(조회건수 <span id="listCntOgnz">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdOgnz" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->

				<!-- 생산자 조직 영역 -->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="prdcrOgnHis-btnSearch-prdcrOgnz" name="prdcrOgnHis-btnSearch-prdcrOgnz" uitype="normal" text="총매입매출 조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlSearch"></sbux-button>
					</div>
				</div>
				<table class="table table-bordered tbl_fixed">
					<caption>출하조직 표기</caption>
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
								<!--
								<sbux-input uitype="hidden" id="dtl-inp-uoBrno" name="dtl-inp-uoBrno"></sbux-input>
								-->
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
								<span style="font-size:12px">(조회건수 <span id="listCntDdc">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdDdc" style="height:400px; width: 100%;"></div>
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

		await fn_createGridOgnz(); //출자출하조직을 포함한 리스트
		await fn_createGridPrchs(year); //매입 리스트
		await fn_createGridDdc(year); //매출 리스트


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
	const fn_chagneCorpNm = async function(a,b,c){
		let brno = SBUxMethod.get("srch-inp-corpNm");
		SBUxMethod.set("srch-inp-brno",brno);
	}
	var jsonOgnz = []; // 그리드의 참조 데이터 주소 선언
	var grdOgnz;

	const objMenuList01 = {
			"excelDwnld": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": fn_excelDwnld01,			//콜백함수명
			}
		};

	//그리드 우클릭 엑셀다운로드
	function fn_excelDwnld01() {
		const currentDate = new Date();
		const year = currentDate.getFullYear().toString().padStart(4, '0');
		const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
		const day = currentDate.getDate().toString().padStart(2, '0');
		let formattedDate = year + month + day;
		let fileNm = formattedDate + "조직 리스트";
		grdOgnz.exportLocalExcel( fileNm, {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* 조직 그리기 생성 */
	const fn_createGridOgnz = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdOgnz';
		SBGridProperties.id = 'grdOgnz';
		SBGridProperties.jsonref = 'jsonOgnz';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.rowheader="seq";
		SBGridProperties.explorerbar = 'sort';//정렬
		SBGridProperties.columns = [
			{caption: ["등록년도"], 		ref: 'yr',			type:'output',  width:'60px',	style:'text-align:center'},
			//{caption: ["조직구분"], 		ref: 'apoSeNm',		type:'output',  width:'90px',	style:'text-align:center'},
			//{caption: ["통합조직여부"], 		ref: 'aprvNm',		type:'output',  width:'90px',	style:'text-align:center'},
			{caption: ["법인명"], 			ref: 'corpNm',		type:'output',  width:'250px',	style:'text-align:center'},
			{caption: ["사업자번호"], 		ref: 'brno',		type:'output',  width:'90px',	style:'text-align:center'},
			{caption: ["적합품목"], 		ref: 'stbltYnNm',	type:'output',  width:'200px',	style:'text-align:center'},
			{caption: ["비고"], 			ref: 'rmrk',		type:'output',  width:'200px',	style:'text-align:center'},

			{caption: ["조직구분"], 		ref: 'apoSe',		hidden : true},
			{caption: ["통합조직여부"], 		ref: 'aprv',		hidden : true},
		];

		grdOgnz = _SBGrid.create(SBGridProperties);
		//클릭 이벤트 바인드
		grdOgnz.bind('click','fn_viewOgnz');
		grdOgnz.bind('keyup','fn_keyupOgnz');
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
		SBGridProperties.frozencols=4;
		SBGridProperties.frozenbottomrows=1;

		SBGridProperties.columns = columnsPrchs;

		grdPrchs = _SBGrid.create(SBGridProperties);
		//클릭 이벤트 바인드
		//grdPrdcrOgnz.bind('click','fn_viewPrdcrOgnz');
		//grdPrdcrOgnz.bind('keyup','fn_keyupPrdcrOgnz');
	}

	var jsonDdc = []; // 그리드의 참조 데이터 주소 선언
	var grdDdc;

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
		let fileNm = formattedDate + "총매입매출 공제 리스트";
		grdCltvtnLand.exportLocalExcel( fileNm, {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* 공제 그리드 생성 */
	const fn_createGridDdc = async function(_year) {
		// 년도에 따른 설정 가져오기
		const { columnsDdc } = yrSettings[_year] || defaultSettings;

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdDdc';
		SBGridProperties.id = 'grdDdc';
		SBGridProperties.jsonref = 'jsonDdc';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList03;	// 우클릭 메뉴 리스트
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.rowheader="seq";
		SBGridProperties.fixedrowheight=36;
		SBGridProperties.frozencols=4;
		SBGridProperties.frozenbottomrows=1;

		SBGridProperties.columns = columnsDdc;

		grdDdc = _SBGrid.create(SBGridProperties);
	}

	//조직 그리드 상세
	const fn_viewOgnz = async function(){
		let objGrid = grdOgnz;
		//데이터가 존재하는 그리드 범위 확인
		var nCol = objGrid.getCol();
		if (nCol < 0) {
			return;
		}
		var nRow = objGrid.getRow();
		if (nRow < 1) {
			return;
		}
		if(nRow == null){
			nRow = 1;
		}

		fn_clearInfoOgnz();//조직 정보 초기화
		fn_clearGridPrchs();//매입 그리드 초기화
		fn_clearGridDdc();//매출 그리드 초기화

		let rowData = objGrid.getRowData(nRow);

		SBUxMethod.set('dtl-inp-apoSe',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-inp-corpNm',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-inp-crno',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-inp-brno',gfn_nvl(rowData.brno))//사업자등록번호
		SBUxMethod.set('dtl-inp-yr',gfn_nvl(rowData.yr))//사업자등록번호

	}

	//조직 그리드 키보드로 이동시 이벤트
	const fn_keyupOgnz = async function(event) {
		console.log(event);
		if(event.keyCode == 38 || event.keyCode == 40) {
			fn_view();
		}
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
	const fn_clearGridDdc = async function() {
		jsonDdc.length = 0;
		grdDdc.rebuild();
		document.querySelector('#listCntDdc').innerText = 0;
	}

	//사업자정보 조회
	const fn_search = async function() {
		//전체 조회 정보 초기화
		fn_clearGridOgnz();//조직 그리드 초기화
		fn_clearInfoOgnz();//조직 정보 초기화
		fn_clearGridPrchs();//매입 그리드 초기화
		fn_clearGridDdc();//매출 그리드 초기화

		let yr = SBUxMethod.get('srch-inp-yr');
		let brno = SBUxMethod.get('srch-inp-brno');

		//년도에 따른 그리드 변경 처리
		await fn_createGridPrchs(yr); //생산자조직 리스트
		await fn_createGridDdc(yr); //농가 리스트

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
					if(data.resultList == null){
						SBUxMethod.set('dtl-inp-brno',item.brno);
						SBUxMethod.set('dtl-inp-apoSe',item.apoSe);
						SBUxMethod.set('dtl-inp-corpNm',item.corpNm);
						$('#ognzGrid').hide();//조직 리스트 영역 숨기기
					}else{
						$('#ognzGrid').show();//조직 리스트 영역 보이기
						jsonOgnz.length = 0;
						data.resultList.forEach((item, index) => {
							//출자출하조직만 표기
							if(item.apoSe === '2'){
								let itemVo = {
										apoCd: 		item.apoCd
										,yr: 		item.yr
										,apoSe: 	item.apoSe
										,apoSeNm: 	item.apoSeNm
										,aprv: 		item.aprv
										,corpNm: 	item.corpNm
										,brno: 		item.brno
										,uoBrno: 	item.uoBrno
										,frmhsCnt: 	item.frmhsCnt
										,corpSeCd: 	item.corpSeCd
										,ctpv: 		item.ctpv
										,sgg: 		item.sgg
										,rmrk: 		item.rmrk
										,stbltYnNm:	item.stbltYnNm
									}
								jsonOgnz.push(itemVo);
							}
						});
						document.querySelector('#listCntOgnz').innerText = jsonOgnz.length;
						grdOgnz.rebuild();
					}
				}else if(item.apoSe == '2'){
					//출자출하조직 세팅
					jsonOgnz.length = 0;
					grdOgnz.rebuild();
					$('#ognzGrid').hide();//조직 리스트 영역 숨기기

					SBUxMethod.set('dtl-inp-brno',item.brno);
					SBUxMethod.set('dtl-inp-apoSe',item.apoSe);
					SBUxMethod.set('dtl-inp-corpNm',item.corpNm);

					let uoBrno = "";
					if(data.uoList != null){
						comUoBrno.length = 0;
						data.uoList.forEach((item, index) => {
							uoBrno = item.uoBrno;
							let uoListVO = {
									'text'		: item.uoCorpNm
									, 'label'	: item.uoCorpNm
									, 'value'	: item.uoBrno
									, 'uoApoCd' : item.uoApoCd
							}
							comUoBrno.push(uoListVO);
						});
						SBUxMethod.refresh('dtl-inp-selUoBrno');

						//속한 통합조직이 한곳 일경우
						if(comUoBrno.length == 1){
							$("#dtl-inp-uoBrno").show();
							$("#dtl-inp-selUoBrno").hide();
							SBUxMethod.set('dtl-inp-uoBrno',uoBrno);
						}
					}else{
						//출자출하조직인데 소속 통합조직이 없는 경우
						$("#dtl-inp-uoBrno").show();
						$("#dtl-inp-selUoBrno").hide();
						SBUxMethod.set('dtl-inp-uoBrno',uoBrno);
					}
				}
			}else{
				alert('해당 사업자 정보가 없습니다');
			}

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/* 출자출하조직이 속한 통합조직 리스트 조회 */
	const fn_searchUoList = async function(){
		comUoBrno.length = 0;
		let brno = SBUxMethod.get('dtl-inp-brno');

		if(gfn_isEmpty(brno)){
			return;
		}

		let postJsonPromise = gfn_postJSON("/pd/hisPopup/selectHisUoList.do", {
			brno : brno
		});
		let data = await postJsonPromise;
		try{
			let uoBrno;
			data.resultList.forEach((item, index) => {
				uoBrno = item.uoBrno
				let uoListVO = {
						'text'		: item.uoCorpNm
						, 'label'	: item.uoCorpNm
						, 'value'	: item.uoBrno
						, 'uoApoCd' : item.uoApoCd

				}
				comUoBrno.push(uoListVO);
			});
			SBUxMethod.refresh('dtl-inp-selUoBrno');
			//console.log(comUoBrno);
			if(comUoBrno.length == 1){
				$("#dtl-inp-uoBrno").show();
				$("#dtl-inp-selUoBrno").hide();
				SBUxMethod.set('dtl-inp-selUoBrno' , uoBrno);
				SBUxMethod.set('dtl-inp-uoBrno',uoBrno);
			}else{
				$("#dtl-inp-uoBrno").hide();
				$("#dtl-inp-selUoBrno").show();
			}
			SBUxMethod.closeProgress("loadingOpen");
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
		let uoBrno = SBUxMethod.get('dtl-inp-uoBrno');

		if(gfn_isEmpty(brno)){
			return;
		}

		// 년도에 따른 설정 가져오기
		const { urlIsoPurSal } = yrSettings[yr] || defaultSettings;

		let postJsonPromise = gfn_postJSON(urlIsoPurSal, {
			yr : yr
			,brno : brno
			,uoBrno : uoBrno
		});
		let data = await postJsonPromise;
		try{
			jsonPrchs.length = 0;
			jsonDdc.length = 0;
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
							,uoBrno: item.uoBrno
							,corpNm: item.corpNm
							,uoCorpNm: item.uoCorpNm

							,sttgUpbrItemSe: item.sttgUpbrItemSe
							,sttgUpbrItemNm: item.sttgUpbrItemNm

							,itemCd: 		item.itemCd
							,itemNm: 		item.itemNm
							,ctgryCd: 		item.ctgryCd
							,ctgryNm: 		item.ctgryNm
							,clsfCd: 		item.clsfCd
							,clsfNm: 		item.clsfNm
							,prchsSlsSe: 	item.prchsSlsSe

							,prchsSortTrstVlm: 		item.prchsSortTrstVlm
							,prchsSortTrstAmt: 		item.prchsSortTrstAmt
							,prchsSpmtTrstVlm: 		item.prchsSpmtTrstVlm
							,prchsSpmtTrstAmt: 		item.prchsSpmtTrstAmt
							,prchsSmplTrstVlm: 		item.prchsSmplTrstVlm
							,prchsSmplTrstAmt: 		item.prchsSmplTrstAmt

							,prchsTrstVlm: 			item.prchsTrstVlm
							,prchsTrstAmt: 			item.prchsTrstAmt

							,prchsSortEmspapVlm: 	item.prchsSortEmspapVlm
							,prchsSortEmspapAmt: 	item.prchsSortEmspapAmt
							,prchsSmplEmspapVlm: 	item.prchsSmplEmspapVlm
							,prchsSmplEmspapAmt: 	item.prchsSmplEmspapAmt

							,prchsEmspapVlm: 		item.prchsEmspapVlm
							,prchsEmspapAmt: 		item.prchsEmspapAmt

							,prchsTotVlm: 			item.prchsTotVlm
							,prchsTotAmt: 			item.prchsTotAmt
							,etcVlm: 				item.etcVlm
							,etcAmt: 				item.etcAmt

					};
					jsonPrchs.push(itemVo);
				}else if (item.prchsSlsSe === '2'){
					let itemVo = {
							apoCd: 	item.apoCd
							,apoSe: item.apoSe
							,brno: 	item.brno
							,crno: 	item.crno
							,delYn: item.delYn
							,yr: 	item.yr
							,uoBrno: item.uoBrno
							,corpNm: item.corpNm
							,uoCorpNm: item.uoCorpNm

							,sttgUpbrItemSe: item.sttgUpbrItemSe
							,sttgUpbrItemNm: item.sttgUpbrItemNm

							,itemCd: 		item.itemCd
							,itemNm: 		item.itemNm
							,ctgryCd: 		item.ctgryCd
							,ctgryNm: 		item.ctgryNm
							,clsfCd: 		item.clsfCd
							,clsfNm: 		item.clsfNm
							,prchsSlsSe: 	item.prchsSlsSe

							,slsSmplTrstVlm: 	item.slsSmplTrstVlm
							,slsSmplTrstAmt: 	item.slsSmplTrstAmt
							,slsSmplEmspapVlm: 	item.slsSmplEmspapVlm
							,slsSmplEmspapAmt: 	item.slsSmplEmspapAmt

							,slsEmspapVlm: 		item.slsEmspapVlm
							,slsEmspapAmt: 		item.slsEmspapAmt
							,slsTrstVlm: 		item.slsTrstVlm
							,slsTrstAmt: 		item.slsTrstAmt

							,totTrmtPrfmncVlm: 		item.totTrmtPrfmncVlm
							,totTrmtPrfmncAmt: 		item.totTrmtPrfmncAmt

							,ddcExprtVlm: 		item.ddcExprtVlm
							,ddcExprtAmt: 		item.ddcExprtAmt
							,ddcVlm: 			item.ddcVlm
							,ddcAmt: 			item.ddcAmt
							,ddcArmyDlvgdsVlm: 	item.ddcArmyDlvgdsVlm
							,ddcArmyDlvgdsAmt: 	item.ddcArmyDlvgdsAmt
							,ddcMlsrVlm: 		item.ddcMlsrVlm
							,ddcMlsrAmt: 		item.ddcMlsrAmt

							,ddcTotVlm: 		item.ddcTotVlm
							,ddcTotAmt: 		item.ddcTotAmt

							,ajmtVlm: 		item.ajmtVlm
							,ajmtAmt: 		item.ajmtAmt

							,slsTotVlm: 		item.slsTotVlm
							,slsTotAmt: 		item.slsTotAmt

							,totSpmtPrfmncVlm: 		item.totSpmtPrfmncVlm
							,totSpmtPrfmncAmt: 		item.totSpmtPrfmncAmt

							,smplInptVlm: 			item.smplInptVlm
							,smplInptAmt: 			item.smplInptAmt
							,spmtPrfmncVlm: 		item.spmtPrfmncVlm
							,spmtPrfmncAmt: 		item.spmtPrfmncAmt

							,slsCprtnSortTrstVlm: 		item.slsCprtnSortTrstVlm
							,slsCprtnSortTrstAmt: 		item.slsCprtnSortTrstAmt
							,slsCprtnSortEmspapVlm: 	item.slsCprtnSortEmspapVlm
							,slsCprtnSortEmspapAmt: 	item.slsCprtnSortEmspapAmt
							,slsCprtnTrstVlm: 			item.slsCprtnTrstVlm
							,slsCprtnTrstAmt: 			item.slsCprtnTrstAmt

							,slsCprtnTotVlm: 			item.slsCprtnTotVlm
							,slsCprtnTotAmt: 			item.slsCprtnTotAmt

							,spmtRtAmt: 			item.spmtRtAmt
					};
					jsonDdc.push(itemVo);
				}
			});
			document.querySelector('#listCntPrchs').innerText = jsonPrchs.length;
			document.querySelector('#listCntDdc').innerText = jsonDdc.length;
			//소계 추가
			grdPrchs.addRow();
			grdDdc.addRow();

			fn_grdTot01();
			fn_grdTot02();

			grdPrchs.rebuild();
			grdDdc.rebuild();
			fn_gridCustom();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//통합조직 콤보박스 선택시 값 변경
	function fn_changeSelUoBrno(){
		let selVal = SBUxMethod.get('dtl-inp-selUoBrno');
		let selCombo = _.find(comUoBrno, {value : selVal});
		if( typeof selCombo == "undefined" || selCombo == null || selCombo == "" ){
			SBUxMethod.set('dtl-inp-uoBrno' , null);
		}else{
			SBUxMethod.set('dtl-inp-uoBrno' , selCombo.value);
		}
		fn_clearForm();
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

		let objGrid02 = grdDdc;

		let totTrmtPrfmncVlm = objGrid02.getColRef("totTrmtPrfmncVlm");//총취급물량
		let totTrmtPrfmncAmt = objGrid02.getColRef("totTrmtPrfmncAmt");//총취급실적
		let ddcTotVlm = objGrid02.getColRef("ddcTotVlm");//
		let ddcTotAmt = objGrid02.getColRef("ddcTotAmt");//
		let ajmtVlm = objGrid02.getColRef("ajmtVlm");//
		let ajmtAmt = objGrid02.getColRef("ajmtAmt");//

		let totSpmtPrfmncVlm = objGrid02.getColRef("totSpmtPrfmncVlm");//
		let totSpmtPrfmncAmt = objGrid02.getColRef("totSpmtPrfmncAmt");//

		let spmtPrfmncVlm = objGrid02.getColRef("spmtPrfmncVlm");//
		let spmtPrfmncAmt = objGrid02.getColRef("spmtPrfmncAmt");//

		let slsCprtnTrstAmt = objGrid02.getColRef("slsCprtnTrstAmt");//
		let slsCprtnSortEmspapAmt = objGrid02.getColRef("slsCprtnSortEmspapAmt");//
		let slsCprtnSortTrstAmt = objGrid02.getColRef("slsCprtnSortTrstAmt");//
		let slsCprtnTotVlm = objGrid02.getColRef("slsCprtnTotVlm");//

		let smplInptVlm = objGrid02.getColRef("smplInptVlm");//
		let spmtRtAmt = objGrid02.getColRef("spmtRtAmt");//

		let ddcExprtVlm = objGrid02.getColRef("ddcExprtVlm");//자체수출 물량

		let sttgUpbrItemNm02 = objGrid02.getColRef("sttgUpbrItemNm");//

		let gridData02 = objGrid02.getGridDataAll();
		//그리드 해더 row수
		let captionRow02 = objGrid02.getFixedRows();
		for(var i = captionRow02; i < gridData02.length + captionRow02; i++){
			let rowData = objGrid02.getRowData(i);

			if(rowData.sttgUpbrItemSe == '1' || rowData.sttgUpbrItemSe == '2'){
				//배경색
				objGrid02.setCellStyle('background-color', i, totTrmtPrfmncVlm, i, totTrmtPrfmncAmt, 'lightgray');
				objGrid02.setCellStyle('background-color', i, ddcTotVlm, i, ddcTotAmt, 'lightgray');
				objGrid02.setCellStyle('background-color', i, ajmtVlm, i, ajmtAmt, 'lightgray');

				objGrid02.setCellStyle('background-color', i, totSpmtPrfmncAmt, i, totSpmtPrfmncAmt, 'lightgray');
				objGrid02.setCellStyle('background-color', i, spmtPrfmncVlm, i, spmtPrfmncAmt, 'lightgray');
				objGrid02.setCellStyle('background-color', i, slsCprtnTrstAmt, i, slsCprtnTrstAmt, 'lightgray');
				objGrid02.setCellStyle('background-color', i, slsCprtnSortEmspapAmt, i, slsCprtnSortEmspapAmt, 'lightgray');
				objGrid02.setCellStyle('background-color', i, slsCprtnSortTrstAmt, i, slsCprtnSortTrstAmt, 'lightgray');
				objGrid02.setCellStyle('background-color', i, slsCprtnTotVlm, i, spmtRtAmt, 'lightgray');

			}else if(rowData.sttgUpbrItemSe == '3'){
				//기타

				//배경색
				objGrid02.setCellStyle('background-color', i, ddcExprtVlm, i, ajmtAmt, 'lightgray');

				objGrid02.setCellStyle('background-color', i, smplInptVlm, i, spmtRtAmt, 'lightgray');
			}else{
				//소계
				//비활성화
				objGrid02.setCellDisabled(i, sttgUpbrItemNm02, i, ajmtAmt, true);
				//배경색
				objGrid02.setCellStyle('background-color', i, sttgUpbrItemNm02, i, ajmtAmt, 'lightgray');
				objGrid02.setCellStyle('background-color', i, totSpmtPrfmncVlm, i, spmtRtAmt, 'lightgray');
			}
		}
	}

	//소계 추가를 위해 조정
	function fn_grdTot01(){
		// 계산할 열 이름 배열
		const columnsToSum = [
			'prchsSortTrstVlm', 'prchsSortTrstAmt'
			,'prchsSpmtTrstVlm', 'prchsSpmtTrstAmt'
			,'prchsSmplTrstVlm', 'prchsSmplTrstAmt'

			,'prchsSortEmspapVlm', 'prchsSortEmspapAmt'
			,'prchsSmplEmspapVlm', 'prchsSmplEmspapAmt'

			,'prchsTrstVlm', 'prchsTrstAmt'
			,'prchsEmspapVlm', 'prchsEmspapAmt'
			,'prchsTotVlm', 'prchsTotAmt'

			,'etcVlm', 'etcAmt'
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
			'totTrmtPrfmncVlm', 'totTrmtPrfmncAmt'

			,'ddcExprtVlm', 'ddcExprtAmt'
			,'ddcVlm', 'ddcAmt'
			,'ddcArmyDlvgdsVlm', 'ddcArmyDlvgdsAmt'
			,'ddcMlsrVlm', 'ddcMlsrAmt'

			,'ddcTotVlm', 'ddcTotAmt'

			,'ajmtVlm', 'ajmtAmt'

			, 'totSpmtPrfmncVlm','totSpmtPrfmncAmt'

			, 'smplInptVlm', 'smplInptAmt',

			, 'spmtPrfmncVlm', 'spmtPrfmncAmt'

			, 'slsCprtnSortTrstVlm', 'slsCprtnSortTrstAmt'
			, 'slsCprtnSortEmspapVlm','slsCprtnSortEmspapAmt'
			, 'slsCprtnTrstVlm', 'slsCprtnTrstAmt'

			, 'slsCprtnTotVlm', 'slsCprtnTotAmt'
		];

		//그리드 추가 용 1줄 합계용 1줄
		let objGrid = grdDdc;
		let grdJson = jsonDdc;

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

	/* 년도별 컬럼 세팅 */
	/* 매입 */
	const columnsPrchs2024 = [
		{caption: ["품목","품목"], 		ref: 'sttgUpbrItemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["품목분류","품목분류"], 	ref: 'ctgryNm',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["통합조직","통합조직명"], 		ref: 'uoCorpNm',   	type:'output',  width:'200px',    style:'text-align:center'},
		{caption: ["통합조직","사업자번호"], 		ref: 'uoBrno',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["공동선별수탁·공동출하수탁","물량(톤)"], ref: 'prchsTrstVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["공동선별수탁·공동출하수탁","금액(천원)"], ref: 'prchsTrstAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["공동선별매취","물량(톤)"], 	ref: 'prchsEmspapVlm',   type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["공동선별매취","금액(천원)"], 	ref: 'prchsEmspapAmt',   type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["기타","물량(톤)"], 		ref: 'etcVlm',   type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["기타","금액(천원)"], 	ref: 'etcAmt',   type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["합계","물량(톤)"], 		ref: 'prchsTotVlm',   		type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["합계","금액(천원)"], 	ref: 'prchsTotAmt',   		type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
		{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'uoBrno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	];

	const columnsPrchs2025 = [
		{caption: ["구분","구분","구분"], 			ref: 'sttgUpbrItemNm',	type:'output',  width:'60px',    style:'text-align:center'},
		{caption: ["부류","부류","부류"], 			ref: 'clsfNm',   	type:'output',  width:'70px',    style:'text-align:center'},
		{caption: ["평가부류","평가부류","평가부류"], 	ref: 'ctgryNm',   	type:'output',  width:'60px',    style:'text-align:center'},
		{caption: ["품목","품목","품목"], 			ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["소속된 통합조직","소속된 통합조직","통합조직명"], 		ref: 'uoCorpNm',   	type:'output',  width:'200px',    style:'text-align:center'},
		{caption: ["소속된 통합조직","소속된 통합조직","사업자번호"], 		ref: 'uoBrno',   	type:'output',  width:'80px',    style:'text-align:center;border-right-color: black !important;'},

		/*= 수탁 =*/
		{caption: ["수탁","공동선별수탁","물량(톤)"], ref: 'prchsSortTrstVlm',   	type:'input',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","공동선별수탁","금액(천원)"], ref: 'prchsSortTrstAmt',   	type:'input',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		{caption: ["수탁","공동출하수탁","물량(톤)"], ref: 'prchsSpmtTrstVlm',   	type:'input',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","공동출하수탁","금액(천원)"], ref: 'prchsSpmtTrstAmt',   	type:'input',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		{caption: ["수탁","단순수탁","물량(톤)"], ref: 'prchsSmplTrstVlm',   	type:'input',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","단순수탁","금액(천원)"], ref: 'prchsSmplTrstAmt',   	type:'input',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		{caption: ["수탁","수탁소계","물량(톤)"], ref: 'prchsTrstVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			//,calc : 'fn_trstVlmSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["수탁","수탁소계","금액(천원)"], ref: 'prchsTrstAmt',   	type:'output',  width:'80px',    style:'text-align:right;border-right-color: black !important;'
			//,calc : 'fn_trstAmtSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		/*= 매취 =*/
		{caption: ["매취","공동선별매취","물량(톤)"], 	ref: 'prchsSortEmspapVlm',   type:'input',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","공동선별매취","금액(천원)"], 	ref: 'prchsSortEmspapAmt',   type:'input',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","단순매취","물량(톤)"], 	ref: 'prchsSmplEmspapVlm',   type:'input',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","단순매취","금액(천원)"], 	ref: 'prchsSmplEmspapAmt',   type:'input',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		{caption: ["매취","매취소계","물량(톤)"], 	ref: 'prchsEmspapVlm',   type:'output',  width:'50px',    style:'text-align:right'
			//,calc : 'fn_emspapVlmSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["매취","매취소계","금액(천원)"], ref: 'prchsEmspapAmt',   type:'output',  width:'80px',    style:'text-align:right;border-right-color: black !important;'
			//,calc : 'fn_emspapAmtSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		/*= 매입 합계 =*/
		{caption: ["합계","합계","물량(톤)"], 	ref: 'prchsTotVlm',   		type:'output',  width:'50px',    style:'text-align:right'
			//,calc : 'fn_prchsVlmSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["합계","합계","금액(천원)"], 	ref: 'prchsTotAmt',   		type:'output',  width:'80px',    style:'text-align:right'
			//,calc : 'fn_prchsAmtSum'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'clsfCd',  	hidden : true},
		{caption: ["상세내역"], 	ref: 'ctgryCd',  	hidden : true},
		{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
		{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'crno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'delYn',		hidden : true}
	];

	const columnsDdc2024 = [
		{caption: ["품목","품목","품목","품목"], 		ref: 'sttgUpbrItemNm',   	type:'output',  width:'55px',    style:'text-align:center'},
		{caption: ["품목","품목","품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["품목분류","품목분류","품목분류","품목분류"], 	ref: 'ctgryNm',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["통합조직","통합조직","통합조직","통합조직명"], 		ref: 'uoCorpNm',   	type:'output',  width:'200px',    style:'text-align:center'},
	    {caption: ["통합조직","통합조직","통합조직","사업자번호"], 		ref: 'uoBrno',   	type:'output',  width:'80px',    style:'text-align:center'},
		{caption: ["출자출하조직 취급실적","총취급실적","총취급실적","물량(톤)"]
			,ref: 'totTrmtPrfmncVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			//,calc : 'fn_totTrmtPrfmncVlm'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","총취급실적","총취급실적","금액(천원)"]
			,ref: 'totTrmtPrfmncAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			//,calc : 'fn_totTrmtPrfmncAmt'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체수출","물량(톤)"]
			,ref: 'ddcExprtVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체수출","금액(천원)"]
			,ref: 'ddcExprtAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체공판장","물량(톤)"]
			,ref: 'ddcVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체공판장","금액(천원)"]
			,ref: 'ddcAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","군납","물량(톤)"]
			,ref: 'ddcArmyDlvgdsVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","군납","금액(천원)"]
			,ref: 'ddcArmyDlvgdsAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","학교급식","물량(톤)"]
			,ref: 'ddcMlsrVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","학교급식","금액(천원)"]
			,ref: 'ddcMlsrAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","공제대상 소계","물량(톤)"]
			,ref: 'ddcTotVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			//, calc : 'fn_ddcTotVlm'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","공제대상 소계","금액(천원)"]
			,ref: 'ddcTotAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			//, calc : 'fn_ddcTotAmt'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},


		{caption: ["출자출하조직 취급실적","조정 취급실적","조정 취급실적","물량(톤)"]
			,ref: 'ajmtVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			//, calc : 'fn_ajmtVlm'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","조정 취급실적","조정 취급실적","금액(A)"]//전문품목 매입매출 화면의 매출 총합
			,ref: 'ajmtAmt',   	type:'output',  width:'100px',    style:'text-align:center;border-right-color: black !important;' , fixedstyle:'border-right-color: black !important;'
			//, calc : 'fn_ajmtAmt'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},


		{caption: ["출자출하조직의 통합조직 출하실적","총 출하실적","총 출하실적","물량(톤)"]
			,ref: 'totSpmtPrfmncVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직의 통합조직 출하실적","총 출하실적","총 출하실적","금액(천원)"]//전문품목 매입매출 화면의 매입 총합
			,ref: 'totSpmtPrfmncAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직의 통합조직 출하실적","단순기표","단순기표","물량(톤)"]
			,ref: 'smplInptVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직의 통합조직 출하실적","단순기표","단순기표","금액(천원)"]
			,ref: 'smplInptAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직의 통합조직 출하실적","출하실적","출하실적","물량(톤)"]
			,ref: 'spmtPrfmncVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			//,calc: 'fn_spmtPrfmncVlm'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직의 통합조직 출하실적","출하실적","출하실적","금액(B)"]
			,ref: 'spmtPrfmncAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			//,calc: 'fn_spmtPrfmncAmt'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동선별수탁","물량(톤)"]
			,ref: 'slsCprtnSortTrstVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동선별수탁","금액(천원)"]
			,ref: 'slsCprtnSortTrstAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동선별매취","물량(톤)"]
			,ref: 'slsCprtnSortEmspapVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동선별매취","금액(천원)"]
			,ref: 'slsCprtnSortEmspapAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동출하수탁","물량(톤)"]
			,ref: 'slsCprtnTrstVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","공동출하수탁","금액(천원)"]
			,ref: 'slsCprtnTrstAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","합계","물량(톤)"]
			,ref: 'slsCprtnTotVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			//,calc: 'fn_slsCprtnTotVlm'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직의 통합조직 출하실적","생산자조직 약정(전속)출하 실적","합계","금액(천원)"]
			,ref: 'slsCprtnTotAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			//,calc: 'fn_slsCprtnTotAmt'
		,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		//{caption: ["출자출하조직\n출하율\n(B/A)","출자출하조직\n출하율\n(B/A)","출자출하조직\n출하율\n(B/A)","출자출하조직\n출하율\n(B/A)"]
			//,ref: 'spmtRtVlm',   	type:'output',  width:'90px',    style:'text-align:center'
			//,calc: 'fn_spmtRtVlm'
			//,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직\n출하율\n(B/A)","출자출하조직\n출하율\n(B/A)","출자출하조직\n출하율\n(B/A)","출자출하조직\n출하율\n(B/A)"]
			,ref: 'spmtRtAmt',   	type:'output',  width:'100px',    style:'text-align:center'
			//,calc: 'fn_spmtRtAmt'
			//,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}}, format : {type:'number', rule:'#,###'}
		},

		{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
		{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'uoBrno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'crno',		hidden : true}
	];

	const columnsDdc2025 = [
		{caption: ["구분","구분","구분","구분"], 		ref: 'sttgUpbrItemNm',   	type:'output',  width:'60px',    style:'text-align:center'},
		{caption: ["부류","부류","부류","부류"], 		ref: 'clsfNm',   	type:'output',  width:'70px',    style:'text-align:center'},
		{caption: ["평가부류","평가부류","평가부류","평가부류"], 	ref: 'ctgryNm',   	type:'output',  width:'60px',    style:'text-align:center'},
		{caption: ["품목","품목","품목","품목"], 		ref: 'itemNm',   	type:'output',  width:'80px',    style:'text-align:center'},

		{caption: ["소속된 통합조직","소속된 통합조직","소속된 통합조직","통합조직명"], 		ref: 'uoCorpNm',   	type:'output',  width:'200px',    style:'text-align:center'},
		{caption: ["소속된 통합조직","소속된 통합조직","소속된 통합조직","사업자번호"], 		ref: 'uoBrno',   	type:'output',  width:'80px',    style:'text-align:center;border-right-color: black !important;'},
		/*총취급실적*/
		{caption: ["출자출하조직 취급실적","총취급실적","총취급실적","물량(톤)"]
			,ref: 'totTrmtPrfmncVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			//,calc : 'fn_totTrmtPrfmncVlm'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","총취급실적","총취급실적","금액(천원)"]
			,ref: 'totTrmtPrfmncAmt',   	type:'output',  width:'80px',    style:'text-align:right;border-right-color: black !important;'
			//,calc : 'fn_totTrmtPrfmncAmt'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		/*취급액 공제 실적*/
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체수출","물량(톤)"]
			,ref: 'ddcExprtVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체수출","금액(천원)"]
			,ref: 'ddcExprtAmt',   	type:'output',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체공판장","물량(톤)"]
			,ref: 'ddcVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","자체공판장","금액(천원)"]
			,ref: 'ddcAmt',   	type:'output',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","군납","물량(톤)"]
			,ref: 'ddcArmyDlvgdsVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","군납","금액(천원)"]
			,ref: 'ddcArmyDlvgdsAmt',   	type:'output',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","학교급식","물량(톤)"]
			,ref: 'ddcMlsrVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","학교급식","금액(천원)"]
			,ref: 'ddcMlsrAmt',   	type:'output',  width:'80px',    style:'text-align:right'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","공제대상 소계","물량(톤)"]
			,ref: 'ddcTotVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			//, calc : 'fn_ddcTotVlm'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","취급액 공제 실적","공제대상 소계","금액(천원)"]
			,ref: 'ddcTotAmt',   	type:'output',  width:'80px',    style:'text-align:right;border-right-color: black !important;'
			//, calc : 'fn_ddcTotAmt'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		/*조정 취급실적*/
		{caption: ["출자출하조직 취급실적","조정 취급실적","조정 취급실적","물량(톤)"]
			,ref: 'ajmtVlm',   	type:'output',  width:'50px',    style:'text-align:right'
			//, calc : 'fn_ajmtVlm'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
		{caption: ["출자출하조직 취급실적","조정 취급실적","조정 취급실적","금액(A)"]//전문품목 매입매출 화면의 매출 총합
			,ref: 'ajmtAmt',   	type:'output',  width:'80px',    style:'text-align:right;border-right-color: black !important;' , fixedstyle:'border-right-color: black !important;'
			//, calc : 'fn_ajmtAmt'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : {type:'number', rule:'#,###'}},

		{caption: ["상세내역"], 	ref: 'prchsSlsSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'yr',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'itemCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'ctgryCd',		hidden : true},
		{caption: ["상세내역"], 	ref: 'clsfCd',		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoSe',		hidden : true},
		{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
		//{caption: ["상세내역"], 	ref: 'uoBrno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'crno',		hidden : true},
		{caption: ["상세내역"], 	ref: 'delYn',		hidden : true}
	];


	//년도별 설정 객체 생성
	//조회 했을 떄 사용하는 객체의 경우 년도별 차이와 관계 없이 전부 표기하는게 편함
	//없으면 null 이고 그리드에서 쓰지 않으면 표기도 안됨
	//변경 사항이 쭉없을 것으로 판단되면 defaultSettings 에 세팅 해주면 됨
	const yrSettings = {
		"2024": {
			columnsPrchs : columnsPrchs2024
			, columnsDdc : columnsDdc2024
			, urlIsoPurSal : '/pd/hisPopup/selectHisIsoPurSal2024.do'
		},
		"2025": {
			columnsPrchs : columnsPrchs2025
			, columnsDdc : columnsDdc2025
			, urlIsoPurSal : '/pd/hisPopup/selectHisIsoPurSal2025.do'
		},
	};
	//기본 설정
	const defaultSettings = {
			columnsPrchs : columnsPrchs2025
			, columnsDdc : columnsDdc2025
			, urlIsoPurSal : '/pd/hisPopup/selectHisIsoPurSal2025.do'
		}

</script>
</html>