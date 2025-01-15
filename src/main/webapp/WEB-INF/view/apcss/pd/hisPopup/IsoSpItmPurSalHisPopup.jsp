<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>출자출하조직 전문품목 매입매출 과거조회 팝업</title>
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
						<span style="font-weight:bold; font-size: 20px">출자출하조직 전문품목 매입매출을 조회합니다.</span>
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

				<!-- 출자출하조직 전문품목 매입매출 영역 -->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="prdcrOgnHis-btnSearch-prdcrOgnz" name="prdcrOgnHis-btnSearch-prdcrOgnz" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchIsoSpItmPurSal"></sbux-button>
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
							<th scope="row" class="th_bg th_border_right">통합조직 선택</th>
							<td class="td_input">

								<sbux-select
									id="dtl-inp-selUoBrno"
									name="dtl-inp-selUoBrno"
									uitype="single"
									jsondata-ref="comUoBrno"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_changeSelUoBrno"
								></sbux-select>

								<sbux-input
									uitype="text"
									id="dtl-inp-uoBrno"
									name="dtl-inp-uoBrno"
									class="form-control input-sm"
									autocomplete="off"
									readonly
								></sbux-input>
							</td>
							<!--
							<td class="td_input"  style="border-left: hidden;">
							<td colspan="5" class="td_input"  style="border-left: hidden;">
							</td>
							 -->
						</tr>
					</tbody>
				</table>

				<!-- 출자출하조직 전문품목 매입매출 리스트 그리드 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶판매위임[매입] 및 출하[매출] 실적</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCntIsoSpItmPurSal">0</span>건)</span>
								-->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdIsoSpItmPurSal" style="height:650px; width: 100%;"></div>
				</div>
				<br>
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

		await fn_createGridOgnz(); //출자출하조직 리스트 그리드
		await fn_createGridIsoSpItmPurSal(year); //출자출하조직 전문품목 리스트 그리드


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

	var jsonIsoSpItmPurSal = []; // 그리드의 참조 데이터 주소 선언
	var grdIsoSpItmPurSal;

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
		let fileNm = formattedDate + "출자출하조직 전문품목 매입매출";
		grdIsoSpItmPurSal.exportLocalExcel( fileNm, {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* 출자출하조직 전문품목 매입매출 그리드 생성 */
	const fn_createGridIsoSpItmPurSal = async function(_year) {
		// 년도에 따른 설정 가져오기
		const { columnsIsoSpItmPurSal } = yrSettings[_year] || defaultSettings;

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdIsoSpItmPurSal';
		SBGridProperties.id = 'grdIsoSpItmPurSal';
		SBGridProperties.jsonref = 'jsonIsoSpItmPurSal';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.mergecells = 'bycol';//동일한 열 병합처리
		SBGridProperties.datamergefalseskip = true;// merge false 된 열 병합 제외
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList02;	// 우클릭 메뉴 리스트
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.fixedrowheight=36;

		SBGridProperties.columns = columnsIsoSpItmPurSal;

		grdIsoSpItmPurSal = _SBGrid.create(SBGridProperties);
		//클릭 이벤트 바인드
		//grdIsoSpItmPurSal.bind('click','fn_viewIsoSpItmPurSal');
		//grdIsoSpItmPurSal.bind('keyup','fn_keyupIsoSpItmPurSal');
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
		fn_clearGridIso();//출자출하조직 전문품목 매입매출 그리드 초기화

		let rowData = objGrid.getRowData(nRow);

		SBUxMethod.set('dtl-inp-apoSe',gfn_nvl(rowData.apoSe))//통합조직 구분
		SBUxMethod.set('dtl-inp-corpNm',gfn_nvl(rowData.corpNm))//법인명
		SBUxMethod.set('dtl-inp-crno',gfn_nvl(rowData.crno))//법인등록번호
		SBUxMethod.set('dtl-inp-brno',gfn_nvl(rowData.brno))//사업자등록번호
		SBUxMethod.set('dtl-inp-yr',gfn_nvl(rowData.yr))//사업자등록번호
		$("#dtl-inp-uoBrno").show();
		$("#dtl-inp-selUoBrno").hide();
		console.log(rowData);
		if(rowData.apoSe == '1'){
			//await fn_searchUoList();
			await SBUxMethod.set('dtl-inp-uoBrno',gfn_nvl(rowData.brno))//속한 통합조직 사업자등록번호
		}else{
			await SBUxMethod.set('dtl-inp-uoBrno',gfn_nvl(rowData.uoBrno))//속한 통합조직 사업자등록번호
		}
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
		SBUxMethod.set('dtl-inp-uoBrno',null);
		SBUxMethod.set('dtl-inp-selUoBrno',null);
		$("#dtl-inp-uoBrno").hide();
		$("#dtl-inp-selUoBrno").show();
	}

	//조직 그리드 초기화
	const fn_clearGridOgnz = async function() {
		$('#ognzGrid').hide();
		jsonOgnz.length = 0;
		grdOgnz.rebuild();
		document.querySelector('#listCntOgnz').innerText = 0;
	}

	//출자출하조직 전문품목 매입매출 그리드 초기화
	const fn_clearGridIso = async function() {
		jsonIsoSpItmPurSal.length = 0;
		grdIsoSpItmPurSal.rebuild();
		//document.querySelector('#listCntIsoSpItmPurSal').innerText = 0;
	}

	//사업자정보 조회
	const fn_search = async function() {
		//전체 조회 정보 초기화
		fn_clearGridOgnz();//조직 그리드 초기화
		fn_clearInfoOgnz();//조직 정보 초기화
		fn_clearGridIso();//생산자조직 그리드 초기화

		let yr = SBUxMethod.get('srch-inp-yr');
		let brno = SBUxMethod.get('srch-inp-brno');

		//년도에 따른 그리드 변경 처리
		await fn_createGridIsoSpItmPurSal(yr); //생산자조직 리스트

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
					//통합조직 세팅
					$("#dtl-inp-uoBrno").show();
					$("#dtl-inp-selUoBrno").hide();
					SBUxMethod.set('dtl-inp-uoBrno',brno);
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
				alert('해당년도 실적 정보가 없습니다');
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

	/* 출자출하조직 전문품목 매입매출 리스트 조회 */
	const fn_searchIsoSpItmPurSal = async function() {

		let yr = SBUxMethod.get('dtl-inp-yr');
		let brno = SBUxMethod.get('dtl-inp-brno');
		let uoBrno = SBUxMethod.get('dtl-inp-uoBrno');

		if(gfn_isEmpty(brno)){
			return;
		}

		// 년도에 따른 설정 가져오기
		const { urlIsoSpItmPurSal } = yrSettings[yr] || defaultSettings;

		let postJsonPromise = gfn_postJSON(urlIsoSpItmPurSal, {
			yr : yr
			,brno : brno
			,uoBrno : uoBrno
		});
		let data = await postJsonPromise;
		try{
			jsonIsoSpItmPurSal.length = 0;
			console.log(data);
			data.resultList.forEach((item, index) => {
				//년도별 차이와 관계없이 전부 넣기
				let itemNm;
				if(item.sttgUpbrItemSe == '1'){
					itemNm = item.itemNm + '(전문)';
				}else if(item.sttgUpbrItemSe == '2'){
					itemNm = item.itemNm + '(육성)';
				}
				let itemVo = {
						yr:				item.yr
						,brno:			item.brno
						,uoBrno:		item.uoBrno
						,isoBrno:		item.isoBrno

						,typeSeNo:		item.typeSeNo
						,itemCd:		item.itemCd
						,itemNm:		item.itemNm

						,prdcrOgnzSn:	item.prdcrOgnzSn
						,trmtType:		item.trmtType
						,ognzStbltYn :	item.ognzStbltYn//조직 적합여부 (요건미달 조직 값을 위해 추가)

						,seNm:			item.seNm
						,seDtlNm:		item.seDtlNm
						,prchsNm:		item.prchsNm
						,trmtTypeNm:	item.trmtTypeNm
						,prdcrOgnzNm:	item.prdcrOgnzNm

						,sttgUpbrItemSe: item.sttgUpbrItemSe

						,slsCnsgnPrchsAmt: item.slsCnsgnPrchsAmt
						,slsCnsgnPrchsVlm: item.slsCnsgnPrchsVlm

						,uoSpmtAmt: item.uoSpmtAmt
						,uoSpmtVlm: item.uoSpmtVlm
						,uoOtherSpmtAmt: item.uoOtherSpmtAmt
						,uoOtherSpmtVlm: item.uoOtherSpmtVlm
						,spmtAmtTot: item.spmtAmtTot
						,spmtVlmTot: item.spmtVlmTot

						,rmrk: item.rmrk
					}
				jsonIsoSpItmPurSal.push(itemVo);

			});
			//document.querySelector('#listCntIsoSpItmPurSal').innerText = jsonIsoSpItmPurSal.length;
			grdIsoSpItmPurSal.rebuild();
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
		let objGrid = grdIsoSpItmPurSal;

		// 컬럼 레퍼런스 설정
		const columnRefs = {
			slsCnsgnPrchsAmt: objGrid.getColRef("slsCnsgnPrchsAmt"),
			uoSpmtAmt: objGrid.getColRef("uoSpmtAmt"),
			uoOtherSpmtAmt: objGrid.getColRef("uoOtherSpmtAmt"),
			slsCnsgnPrchsVlm: objGrid.getColRef("slsCnsgnPrchsVlm"),
			uoSpmtVlm: objGrid.getColRef("uoSpmtVlm"),
			uoOtherSpmtVlm: objGrid.getColRef("uoOtherSpmtVlm"),
			seNm: objGrid.getColRef("seNm"),
			prchsNm: objGrid.getColRef("prchsNm"),
			trmtTypeNm: objGrid.getColRef("trmtTypeNm"),
			rmrk: objGrid.getColRef("rmrk"),
		};

		const gridData01 = objGrid.getGridDataAll();
		// 행 데이터 처리
		let captionRow = objGrid.getFixedRows();
		for (let i = captionRow; i < gridData01.length + captionRow; i++) {
			const rowData01 = objGrid.getRowData(i);
			const typeSeNo = rowData01.typeSeNo;

			switch (typeSeNo) {
				case '5': // 생산자조직
					objGrid.setCellStyle('background-color', i, columnRefs.slsCnsgnPrchsVlm, i, columnRefs.slsCnsgnPrchsVlm, '#e1e1e1');
					objGrid.setCellStyle('background-color', i, columnRefs.slsCnsgnPrchsAmt, i, columnRefs.slsCnsgnPrchsAmt, '#e1e1e1');
					break;

				case '6': // 생산자조직 소계
					objGrid.setMergeByFree(i, columnRefs.trmtTypeNm, i, columnRefs.prchsNm, true);
					if (rowData01.trmtType === '0') {
						objGrid.setCellStyle('background-color', i, columnRefs.trmtTypeNm, i, columnRefs.rmrk, 'lightgray');
					} else {
						// 기본 색상
						objGrid.setCellStyle('background-color', i, columnRefs.trmtTypeNm, i, columnRefs.rmrk, '#e1e1e1');
					}
					break;

				case '7': // 생산자조직 외
					// 현재 로직에서 비활성화 처리 생략 (추후 필요시 추가)
					break;

				case '8': // 합계
					objGrid.setCellStyle('background-color', i, columnRefs.seNm, i, columnRefs.rmrk, 'lightgray');
					objGrid.setMergeByFree(i, columnRefs.seNm, i, columnRefs.prchsNm, true);
					break;

				default:
					// 기타 타입에 대한 처리 추가 가능
					break;
			}
		}
	}

	/* 출자출하조직 전문품목 매입매출 년도별 컬럼 세팅 */
	const columnsIsoSpItmPurSal2024 = [
		{caption : ['품목명','품목명'],
			ref : "itemNm",   width : '100px',			style : 'text-align:center',     type : 'output'},
		{caption : ['판매위임(매입)금액(천원)','구분'],
			ref : "seNm",   width : '150px',			style : 'text-align:center',     type : 'output'},
		{caption : ['판매위임(매입)금액(천원)','취급유형'],
			ref : "trmtTypeNm",   width : '80px',		style : 'text-align:center',     type : 'output' , merge:false},
		{caption : ['판매위임(매입)금액(천원)','매입처'],
			ref : "prchsNm",   width : '150px',			style : 'text-align:center',     type : 'output', merge:false},
		{caption : ['판매위임(매입)금액(천원)','금액'],
			ref : "slsCnsgnPrchsAmt",   width : '100px',	style : 'text-align:right',	type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['출하(매출)금액(천원)','통합조직에\n출하(판매)'],
			ref : "uoSpmtAmt",		width : '100px',	style : 'text-align:right',		type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['출하(매출)금액(천원)','통합조직 이외\n출하(판매)'],
			ref : "uoOtherSpmtAmt",	width : '100px',	style : 'text-align:right',		type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['출하(매출)금액(천원)','합계'],
			ref : "spmtAmtTot",   	width : '100px',	style : 'text-align:right; background-color: #e1e1e1',	type : 'output'
			//, calc : 'fn_calcSum'
			,  format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['비고','비고'],
			ref : "rmrk",   width : '150px',        style : 'text-align:right',      type : 'output', merge:false},

		{caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
		{caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
		{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
		{caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'prdcrOgnzSn',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'prdcrOgnzCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'cltvtnLandSn',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'typeSeNo',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'isoBrno',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},

	];

	const columnsIsoSpItmPurSal2025 = [
		{caption : ['품목명','품목명','품목명'],
			ref : "itemNm",   width : '100px',			style : 'text-align:center',     type : 'output'},
		{caption : ['판매위임(매입)현황','구분','구분'],
			ref : "seNm",   width : '150px',			style : 'text-align:center',     type : 'output'},
		{caption : ['판매위임(매입)현황','취급유형','취급유형'],
			ref : "trmtTypeNm",   width : '80px',		style : 'text-align:center',     type : 'output' , merge:false},
		{caption : ['판매위임(매입)현황','매입처','매입처'],
			ref : "prchsNm",   width : '150px',				style : 'text-align:center',     type : 'output', merge:false},
		{caption : ['판매위임(매입)현황','물량(톤)','물량(톤)'],
			ref : "slsCnsgnPrchsVlm",   width : '70px',	style : 'text-align:right',	type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['판매위임(매입)현황','금액(천원)','금액(천원)'],
			ref : "slsCnsgnPrchsAmt",   width : '100px',	style : 'text-align:right',	type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }, merge:false},

		{caption : ['출하(매출)현황','통합조직에 출하(판매)','물량(톤)'],
			ref : "uoSpmtVlm",		width : '70px',	style : 'text-align:right',		type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['출하(매출)현황','통합조직에 출하(판매)','금액(천원)'],
			ref : "uoSpmtAmt",		width : '100px',	style : 'text-align:right',		type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }, merge:false},

		{caption : ['출하(매출)현황','통합조직 이외 출하(판매)','물량(톤)'],
			ref : "uoOtherSpmtVlm",	width : '70px',	style : 'text-align:right',		type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['출하(매출)현황','통합조직 이외 출하(판매)','금액(천원)'],
			ref : "uoOtherSpmtAmt",	width : '100px',	style : 'text-align:right',		type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }, merge:false},


		{caption : ['출하(매출)현황','합계','물량(톤)'],
			ref : "spmtVlmTot",	width : '70px',	style : 'text-align:right; background-color: #e1e1e1',		type : 'output'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['출하(매출)현황','합계','금액(천원)'],
			ref : "spmtAmtTot",		width : '100px',	style : 'text-align:right; background-color: #e1e1e1',	type : 'output'
			//, calc : 'fn_calcSum'
			,  format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['비고','비고','비고'],
			ref : "rmrk",   width : '150px',		style : 'text-align:right',      type : 'output', merge:false},

		{caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
		{caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
		{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
		{caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'prdcrOgnzSn',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'prdcrOgnzCd',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'cltvtnLandSn',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'typeSeNo',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'isoBrno',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true}
	];

	//년도별 설정 객체 생성
	//없으면 null 이고 그리드에서 쓰지 않으면 표기도 안됨
	//변경 사항이 쭉없을 것으로 판단되면 defaultSettings 에 세팅 해주면 됨
	const yrSettings = {
		"2024": {
			columnsIsoSpItmPurSal : columnsIsoSpItmPurSal2024
			, urlIsoSpItmPurSal : '/pd/hisPopup/selectHisIsoSpItmPurSal2024.do'
		},
		"2025": {
			columnsIsoSpItmPurSal : columnsIsoSpItmPurSal2025
			, urlIsoSpItmPurSal : '/pd/hisPopup/selectHisIsoSpItmPurSal2025.do'
		},
	};
	//기본 설정
	const defaultSettings = {
			columnsIsoSpItmPurSal : columnsIsoSpItmPurSal2025
			, urlIsoSpItmPurSal : '/pd/hisPopup/selectHisIsoSpItmPurSal2025.do'
		}

</script>
</html>