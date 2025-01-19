<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>통합조직 전문품목 매입매출 과거조회 팝업</title>
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
						<span style="font-weight:bold; font-size: 20px">통합조직 전문품목 매입매출을 조회합니다.</span>
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

				<!-- 통합조직 전문품목 매입매출 영역 -->
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div style="margin-left: auto;">
						<sbux-button id="prdcrOgnHis-btnSearch-prdcrOgnz" name="prdcrOgnHis-btnSearch-prdcrOgnz" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchUoSpItmPurSalN"></sbux-button>
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

				<!-- 통합조직 전문품목 매입매출 리스트 그리드 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶판매위임[매입] 및 출하[매출] 실적</span>
								<!--
								<span style="font-size:12px">(조회건수 <span id="listCntUoSpItmPurSalN">0</span>건)</span>
								-->
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdUoSpItmPurSalN" style="height:650px; width: 100%;"></div>
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

		await fn_createGridUoSpItmPurSalN(year); //통합조직 전문품목 리스트 그리드

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
		{'text': '통합조직','label': '통합조직', 'value': '2'}
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

	var jsonUoSpItmPurSalN = []; // 그리드의 참조 데이터 주소 선언
	var grdUoSpItmPurSalN;

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
		let fileNm = formattedDate + "통합조직 전문품목 매입매출";
		grdUoSpItmPurSalN.exportLocalExcel( fileNm, {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
	}

	/* 통합조직 전문품목 매입매출 그리드 생성 */
	const fn_createGridUoSpItmPurSalN = async function(_year) {
		// 년도에 따른 설정 가져오기
		const { columnsUoSpItmPurSalN } = yrSettings[_year] || defaultSettings;

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdUoSpItmPurSalN';
		SBGridProperties.id = 'grdUoSpItmPurSalN';
		SBGridProperties.jsonref = 'jsonUoSpItmPurSalN';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.mergecells = 'bycol';//동일한 열 병합처리
		SBGridProperties.datamergefalseskip = true;// merge false 된 열 병합 제외
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList02;	// 우클릭 메뉴 리스트
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.fixedrowheight=36;

		SBGridProperties.columns = columnsUoSpItmPurSalN;

		grdUoSpItmPurSalN = _SBGrid.create(SBGridProperties);
		//클릭 이벤트 바인드
		//grdUoSpItmPurSalN.bind('click','fn_viewUoSpItmPurSalN');
		//grdUoSpItmPurSalN.bind('keyup','fn_keyupUoSpItmPurSalN');
	}

	//조직 정보 초기화
	const fn_clearInfoOgnz = async function() {
		SBUxMethod.set('dtl-inp-yr',null);
		SBUxMethod.set('dtl-inp-apoSe',null);
		SBUxMethod.set('dtl-inp-corpNm',null);
		SBUxMethod.set('dtl-inp-brno',null);
	}

	//통합조직 전문품목 매입매출 그리드 초기화
	const fn_clearGridUo = async function() {
		jsonUoSpItmPurSalN.length = 0;
		grdUoSpItmPurSalN.rebuild();
		//document.querySelector('#listCntUoSpItmPurSalN').innerText = 0;
	}

	//사업자정보 조회
	const fn_search = async function() {
		//전체 조회 정보 초기화
		fn_clearInfoOgnz();//조직 정보 초기화
		fn_clearGridUo();//통합조직 전문품목 매입매출 그리드 초기화

		let yr = SBUxMethod.get('srch-inp-yr');
		let brno = SBUxMethod.get('srch-inp-brno');

		//년도에 따른 그리드 변경 처리
		await fn_createGridUoSpItmPurSalN(yr); //생산자조직 리스트

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
				//통합조직 ,통합조직 여부
				//하위 통합조직 존재 여부, 통합조직 리스트
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

	/* 통합조직 전문품목 매입매출 리스트 조회 */
	const fn_searchUoSpItmPurSalN = async function() {

		let yr = SBUxMethod.get('dtl-inp-yr');
		let brno = SBUxMethod.get('dtl-inp-brno');

		if(gfn_isEmpty(brno)){
			return;
		}

		// 년도에 따른 설정 가져오기
		const { urlUoSpItmPurSalN } = yrSettings[yr] || defaultSettings;

		let postJsonPromise = gfn_postJSON(urlUoSpItmPurSalN, {
			yr : yr
			,brno : brno
		});
		let data = await postJsonPromise;
		try{
			jsonUoSpItmPurSalN.length = 0;
			//console.log(data);
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

						,slsCnsgnSlsAmt: item.slsCnsgnSlsAmt
						,slsCnsgnSlsVlm: item.slsCnsgnSlsVlm

						,rmrk: item.rmrk
					}
				jsonUoSpItmPurSalN.push(itemVo);

			});
			//document.querySelector('#listCntUoSpItmPurSalN').innerText = jsonUoSpItmPurSalN.length;
			grdUoSpItmPurSalN.rebuild();
			fn_gridCustom();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	//그리드 커스텀 배경
	const fn_gridCustom = async function(){
		let objGrid = grdUoSpItmPurSalN;

		// 컬럼 레퍼런스 설정
		const columnRefs = {
				slsCnsgnPrchsAmt	: objGrid.getColRef("slsCnsgnPrchsAmt"),
				slsCnsgnSlsAmt		: objGrid.getColRef("slsCnsgnSlsAmt"),
				slsCnsgnPrchsVlm	: objGrid.getColRef("slsCnsgnPrchsVlm"),
				slsCnsgnSlsVlm		: objGrid.getColRef("slsCnsgnSlsVlm"),
				seNm				: objGrid.getColRef("seNm"),
				prchsNm				: objGrid.getColRef("prchsNm"),
				trmtTypeNm			: objGrid.getColRef("trmtTypeNm"),
				rmrk				: objGrid.getColRef("rmrk"),
			};

		const gridData01 = objGrid.getGridDataAll();
		// 행 데이터 처리
		let captionRow = objGrid.getFixedRows();
		for (let i = captionRow; i < gridData01.length + captionRow; i++) {
			const rowData01 = objGrid.getRowData(i);
			const typeSeNo = rowData01.typeSeNo;
			switch (typeSeNo) {
				case '5': // 생산자조직
					objGrid.setCellDisabled(i, columnRefs.slsCnsgnPrchsVlm, i, columnRefs.slsCnsgnPrchsAmt, true);
					// 배경 속성 추가
					objGrid.setCellStyle('background-color', i, columnRefs.slsCnsgnPrchsVlm, i, columnRefs.slsCnsgnPrchsAmt, 'lightgreen');

					objGrid.setCellStyle('background-color', i, columnRefs.slsCnsgnPrchsVlm, i, columnRefs.slsCnsgnPrchsAmt, '#e1e1e1');
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

	//출자출하조직이 있는 경우 합계의 차이 발생
	function fn_grdTot(){
		// 계산할 열 이름 배열
		const columnsToSum = [
			'slsCnsgnPrchsAmt','slsCnsgnPrchsVlm'
			,'slsCnsgnSlsAmt','slsCnsgnSlsVlm'
		];

		//그리드 추가 용 1줄 합계용 1줄
		let objGrid = grdUoSpItmPurSalN;
		let grdJson = jsonUoSpItmPurSalN;

		//그리드 해더 row수
		let captionRow = objGrid.getFixedRows();
		//그리드 내용 row수
		let grdLength = grdJson.length;
	}

	//판매위임 합계 함수
	function fn_totalTotSum() {
		let objGrid = grdUoSpItmPurSalN;

		let gridData = objGrid.getGridDataAll();
		if(gridData.length == 0) return;

		let itemCd = objGrid.getColRef("itemCd");//품목코드
		let itemCdVal = objGrid.getCellData(Number(nRow), itemCd);

		// 합계를 저장할 변수 초기화
		let totalSum = {
			slsCnsgnPrchsAmt: 0,
			slsCnsgnSlsAmt: 0,
			slsCnsgnPrchsVlm: 0,
			slsCnsgnSlsVlm: 0,
		};

		let targetRow = null; // 합계가 설정될 행 번호
		let captionRow = objGrid.getFixedRows();
		for (let i = captionRow; i < gridData.length + captionRow; i++) {
			// 현재 행 데이터 가져오기
			let rowData01 = objGrid.getRowData(i);

			// itemCd가 일치하는 경우만 처리
			if (rowData01.itemCd === itemCdVal) {
				// typeSeNo에 따른 합계 계산
				if (rowData01.typeSeNo === '5' || rowData01.typeSeNo === '7') {
					totalSum.slsCnsgnPrchsAmt 	+= Number(rowData01.slsCnsgnPrchsAmt || 0);
					totalSum.slsCnsgnPrchsVlm 	+= Number(rowData01.slsCnsgnPrchsVlm || 0);
					totalSum.slsCnsgnSlsAmt 	+= Number(rowData01.slsCnsgnSlsAmt || 0);
					totalSum.slsCnsgnSlsVlm 	+= Number(rowData01.slsCnsgnSlsVlm || 0);
				}

				// 합계 위치 행 번호 저장
				if (rowData01.typeSeNo === '8') {
					targetRow = i;
				}
			}
		}

		// 합계 데이터를 objGrid에 설정
		if (targetRow !== null) {
			Object.keys(totalSum).forEach((key) => {
				objGrid.setCellData(targetRow, objGrid.getColRef(key), totalSum[key]);
			});
		}
	}

	/* 통합조직 전문품목 매입매출 년도별 컬럼 세팅 */
	const columnsUoSpItmPurSalN2024 = [
		{caption : ['품목명','품목명'],
			ref : "itemNm",   width : '100px',        style : 'text-align:center',     type : 'output'},
		{caption : ['판매위임(매입)현황','구분'],
			ref : "seNm",   width : '150px',        style : 'text-align:center',     type : 'output'},
		//{caption : ['판매위임(매입)금액(천원)','구분'],
			//ref : "seDtlNm",   width : '150px',        style : 'text-align:center',     type : 'output'},
		//{caption : ['판매위임(매입)금액(천원)','품목구분'],
			//ref : "sttgUpbrItemNm",   width : '80px',        style : 'text-align:center',     type : 'output' , merge:false},
		{caption : ['판매위임(매입)현황','취급유형'],
			ref : "trmtTypeNm",   width : '80px',        style : 'text-align:center',     type : 'output' , merge:false},
		{caption : ['판매위임(매입)현황','매입처'],
			ref : "prchsNm",   width : '150px',        style : 'text-align:center',     type : 'output', merge:false},

		{caption : ['판매위임(매입)현황','금액']
			,ref : "slsCnsgnPrchsVlm",   width : '100px',        style : 'text-align:right',      type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['판매위임(매입)현황','금액']
			,ref : "slsCnsgnPrchsAmt",   width : '100px',        style : 'text-align:right',      type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false},


		{caption : ['판매(매출)현황','물량(톤)']
			,ref : "slsCnsgnSlsVlm",   width : '100px',        style : 'text-align:right',      type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['판매(매출)현황','금액(천원)']
			,ref : "slsCnsgnSlsAmt",   width : '100px',        style : 'text-align:right',      type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['비고','비고']
			,ref : "rmrk",   width : '150px',        style : 'text-align:right',      type : 'output', merge:false},

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
		{caption: ["상세내역"], 	ref: 'isoBrno',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'typeSeNo',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
	];

	const columnsUoSpItmPurSalN2025 = [
		{caption : ['품목명','품목명'],
			ref : "itemNm",   width : '100px',			style : 'text-align:center',     type : 'output'},
		{caption : ['판매위임(매입)현황','구분'],
			ref : "seNm",   width : '150px',			style : 'text-align:center',     type : 'output'},
		{caption : ['판매위임(매입)현황','취급유형'],
			ref : "trmtTypeNm",   width : '80px',		style : 'text-align:center',     type : 'output' , merge:false},
		{caption : ['판매위임(매입)현황','매입처'],
			ref : "prchsNm",   width : '150px',			style : 'text-align:center',     type : 'output', merge:false},

		{caption : ['판매위임(매입)현황','물량(톤)']
			,ref : "slsCnsgnPrchsVlm",   width : '100px',	style : 'text-align:right',      type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['판매위임(매입)현황','금액(천원)']
			,ref : "slsCnsgnPrchsAmt",   width : '100px',        style : 'text-align:right',      type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false},


		{caption : ['판매(매출)현황','물량(톤)']
			,ref : "slsCnsgnSlsVlm",   width : '100px',		style : 'text-align:right',      type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['판매(매출)현황','금액(천원)']
			,ref : "slsCnsgnSlsAmt",   width : '100px',        style : 'text-align:right',      type : 'output'
			,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10}, format : { type:'number' , rule:'#,###' }, merge:false},
		{caption : ['비고','비고']
			,ref : "rmrk",   width : '150px',        style : 'text-align:right',      type : 'output', merge:false},

		{caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
		{caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
		{caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
		{caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'prdcrOgnzSn',   	hidden : true},
		{caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
		{caption: ["상세내역"], 	ref: 'isoBrno',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'typeSeNo',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
		{caption: ["상세내역"], 	ref: 'ognzStbltYn',		hidden : true},
	];

	//년도별 설정 객체 생성
	//없으면 null 이고 그리드에서 쓰지 않으면 표기도 안됨
	//변경 사항이 쭉없을 것으로 판단되면 defaultSettings 에 세팅 해주면 됨
	const yrSettings = {
		"2024": {
			columnsUoSpItmPurSalN : columnsUoSpItmPurSalN2024
			, urlUoSpItmPurSalN : '/pd/hisPopup/selectHisUoSpItmPurSalN2024.do'
		},
		"2025": {
			columnsUoSpItmPurSalN : columnsUoSpItmPurSalN2025
			, urlUoSpItmPurSalN : '/pd/hisPopup/selectHisUoSpItmPurSalN2025.do'
		},
	};
	//기본 설정
	const defaultSettings = {
			columnsUoSpItmPurSalN : columnsUoSpItmPurSalN2025
			, urlUoSpItmPurSalN : '/pd/hisPopup/selectHisUoSpItmPurSalN2025.do'
		}

</script>
</html>