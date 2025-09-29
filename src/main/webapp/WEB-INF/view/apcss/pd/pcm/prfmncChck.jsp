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
					<!-- 실적점검 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<table class="table table-bordered tbl_fixed">
					<caption>사용자 표기</caption>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th_border_right">신청년도</th>
							<td colspan="2" class="td_input">
								<sbux-spinner
									id="dtl-input-yr"
									name="dtl-input-yr"
									uitype="normal"
									step-value="1"
								></sbux-spinner>
							</td>
							<td class="td_input"  style="border-left: hidden;">
							<th scope="row" class="th_bg th_border_right">법인명</th>
							<td colspan="2" class="td_input">
								<sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
								<sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe"></sbux-input>
								<!--
								<sbux-input uitype="hidden" id="dtl-input-yr" name="dtl-input-yr"></sbux-input>
								-->
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

				<!-- 생산유통 통합조직 승인형 총취급액 실적점검 리스트 그리드 -->
				<div class="prfmncChck">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count" style="width:100%; display: flex; justify-content: space-between;">
							<li>
								<span style="font-size:14px">▶생산유통 통합조직 승인형 총취급액 실적점검</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
							<li>
								<span style="font-size:12px">(단위: 백만원)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdPrfmncChckMng" style="height:350px; width: 100%; overflow-x: hidden"></div>
					<br>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
		/**
		 * 엔터시 검색 이벤트
		 */
		const elements = document.querySelectorAll(".srch-keyup-area");
		for (let i = 0; i < elements.length; i++) {
			const el = elements.item(i);
			el.addEventListener("keyup", (event) => {
				if (event.keyCode === 13 && !event.altKey && !event.ctrlKey && !event.shiftKey) {
					fn_dtlSearch();
				}
				//key	Enter
				//keyCode
			});
		}
	})

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_setYear();//기본년도 세팅

		fn_prfmncChckMngGrid();

		await fn_search();
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
	}


	//그리드 변수
	var jsonPrfmncChckMng = []; // 그리드의 참조 데이터 주소 선언
	var grdPrfmncChckMng;


	/* Grid 화면 그리기 기능*/
	const fn_prfmncChckMngGrid = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdPrfmncChckMng';
		SBGridProperties.id = 'grdPrfmncChckMng';
		SBGridProperties.jsonref = 'jsonPrfmncChckMng';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		//SBGridProperties.explorerbar = 'sort';//정렬
		SBGridProperties.fixedrowheight=45;
		//SBGridProperties.rowheight = 72;
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["승인연도","승인연도"], 	ref: 'slctnYr',		type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["통합조직명","통합조직명"], 	ref: 'corpNm',		type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["품목","구분"], 			ref: 'sttgUpbrItemNm',	type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["품목","품목명"], 		ref: 'itemNm',		type:'output',  width:'80px',	style:'text-align:center'},

			{caption: ["통합조직 총취급액(판매액)","1월"], 		ref: 'prfmncAmt1',	type:'input',  width:'100px',	style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},
			{caption: ["통합조직 총취급액(판매액)","2월"], 		ref: 'prfmncAmt2',	type:'input',  width:'100px',	style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},
			{caption: ["통합조직 총취급액(판매액)","3월"], 		ref: 'prfmncAmt3',	type:'input',  width:'100px',	style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},
			{caption: ["통합조직 총취급액(판매액)","4월"], 		ref: 'prfmncAmt4',	type:'input',  width:'100px',	style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},
			{caption: ["통합조직 총취급액(판매액)","5월"], 		ref: 'prfmncAmt5',	type:'input',  width:'100px',	style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},
			{caption: ["통합조직 총취급액(판매액)","6월"], 		ref: 'prfmncAmt6',	type:'input',  width:'100px',	style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},

			{caption: ["통합조직 총취급액(판매액)","상반기 누적 소계\n(백만원)"], 	ref: 'prfmncAmtHalfTot',	type:'output',  width:'105px',	style:'text-align:center; background-color: lightgray;'
				, calc : 'fn_prfmncAmtHalfSum',	format : { type:'number' , rule:'#,###' }},

			{caption: ["통합조직 총취급액(판매액)","7월"], 		ref: 'prfmncAmt7',	type:'input',  width:'100px',	style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},
			{caption: ["통합조직 총취급액(판매액)","8월"], 		ref: 'prfmncAmt8',	type:'input',  width:'100px',	style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},
			{caption: ["통합조직 총취급액(판매액)","9월"], 		ref: 'prfmncAmt9',	type:'input',  width:'100px',	style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},
			{caption: ["통합조직 총취급액(판매액)","10월"], 		ref: 'prfmncAmt10',	type:'input',  width:'100px',	style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},
			{caption: ["통합조직 총취급액(판매액)","11월"], 		ref: 'prfmncAmt11',	type:'input',  width:'100px',	style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},
			{caption: ["통합조직 총취급액(판매액)","12월"], 		ref: 'prfmncAmt12',	type:'input',  width:'100px',	style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},

			{caption: ["통합조직 총취급액(판매액)","누적 소계\n(백만원)"], 		ref: 'prfmncAmtTot',	type:'output',  width:'80px',	style:'text-align:center; background-color: lightgray;'
				, calc : 'fn_prfmncAmtSum',	format : { type:'number' , rule:'#,###' }},

			{caption: ["통합조직 총취급액(판매액)","24년말 실적\n(백만원)"], 		ref: 'prevYrPrfmncAmt',	type:'output',  width:'80px',	style:'text-align:center; background-color: lightgray;'
				,format : { type:'number' , rule:'#,###' }},
			{caption: ["통합조직 총취급액(판매액)","25년말 기준\n(예상치)"], 		ref: 'expctPrfmncAmt',	type:'input',  width:'100px',	style:'text-align:center'
				,typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},
			{caption: ["통합조직 총취급액(판매액)","연말전망치 기준\n증감률(%)"], 	ref: 'prfmncAmtRt',	type:'output',  width:'80px',	style:'text-align:center; background-color: lightgray;'
				, calc : 'fn_prfmncAmtRt',	format: {type: 'string', rule: '@" %"'}},

			{caption: ["상세내역"], 	ref: 'yr',			hidden : true},
			{caption: ["상세내역"], 	ref: 'apoCd',		hidden : true},
			{caption: ["상세내역"], 	ref: 'brno',		hidden : true},
			{caption: ["상세내역"], 	ref: 'itemCd',		hidden : true},

		];

		grdPrfmncChckMng = _SBGrid.create(SBGridProperties);

		grdPrfmncChckMng.bind('valuechanged','fn_valuechanged');
	}

	//해당 컬럼 변경시 리프래시 리스트
	const columnsToRefresh = [
		'prfmncAmt1','prfmncAmt2','prfmncAmt3'
		,'prfmncAmt4','prfmncAmt5','prfmncAmt6'
		,'prfmncAmt7','prfmncAmt8','prfmncAmt9'
		,'prfmncAmt10','prfmncAmt11','prfmncAmt12'
		,'expctPrfmncAmt'
	];

	//그리드 열 속성의 calc 은 그리드 생성시 작동함  refresh() 해서 데이터 변경시로 유사하게 가능
	function fn_valuechanged(){
		let nCol = grdPrfmncChckMng.getCol();
		let nRef = grdPrfmncChckMng.getRefOfCol(nCol);
		if(columnsToRefresh.includes(nRef)){
			grdPrfmncChckMng.refresh();
		}
	}

	//증감률
	function fn_prfmncAmtRt(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(rowData.prfmncAmt1) + Number(rowData.prfmncAmt2) + Number(rowData.prfmncAmt3)
				+ Number(rowData.prfmncAmt4) + Number(rowData.prfmncAmt5) + Number(rowData.prfmncAmt6)
				+ Number(rowData.prfmncAmt7) + Number(rowData.prfmncAmt8) + Number(rowData.prfmncAmt9)
				+ Number(rowData.prfmncAmt10) + Number(rowData.prfmncAmt11) + Number(rowData.prfmncAmt12);
		let resultVal = 0;
		let prevYrPrfmncAmt = Number(rowData.prevYrPrfmncAmt);
		//증감률 공식 올해 매출 - 전년도 매출 / 전년도 매출
		if(!gfn_isEmpty(rowData.prevYrPrfmncAmt)){
			if(prevYrPrfmncAmt > 0){
				resultVal = ( sumVal - prevYrPrfmncAmt ) / prevYrPrfmncAmt * 100 ;
			}
		}
		return resultVal.toFixed(2);
	}

	//소계
	function fn_prfmncAmtSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(rowData.prfmncAmt1) + Number(rowData.prfmncAmt2) + Number(rowData.prfmncAmt3)
				+ Number(rowData.prfmncAmt4) + Number(rowData.prfmncAmt5) + Number(rowData.prfmncAmt6)
				+ Number(rowData.prfmncAmt7) + Number(rowData.prfmncAmt8) + Number(rowData.prfmncAmt9)
				+ Number(rowData.prfmncAmt10) + Number(rowData.prfmncAmt11) + Number(rowData.prfmncAmt12);
		return sumVal;
	}

	//1~6월 소계
	function fn_prfmncAmtHalfSum(objGrid, nRow, nCol){
		let rowData = objGrid.getRowData(Number(nRow));
		let sumVal = 0;
		sumVal = Number(rowData.prfmncAmt1) + Number(rowData.prfmncAmt2) + Number(rowData.prfmncAmt3)
				+ Number(rowData.prfmncAmt4) + Number(rowData.prfmncAmt5) + Number(rowData.prfmncAmt6);
		return sumVal;
	}

	const fn_clearForm = async function (){
		jsonPrfmncChckMng.length=0;
		grdPrfmncChckMng.rebuild();
	}

	/* 승인형 조직 조회*/
	const fn_search = async function(){
		let brno = '${loginVO.brno}';
		if(gfn_isEmpty(brno)) return;

		let postJsonPromise = gfn_postJSON("/pd/pcm/selectUoAprv.do", {
			brno : brno
		});
		let data = await postJsonPromise;
		try{
			console.log(data);
			let item = data.resultList;

			if(!gfn_isEmpty(item)){
				SBUxMethod.set('dtl-input-corpNm',gfn_nvl(item.corpNm));
				SBUxMethod.set('dtl-input-brno',gfn_nvl(item.brno));
				SBUxMethod.set('dtl-input-crno',gfn_nvl(item.crno));
				fn_dtlSearch();
			}else{
				$(".btn").hide();
				alert('승인형 조직만 이용가능한 메뉴입니다');
			}
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/* 승인형 조직 상세실적 조회*/
	const fn_dtlSearch = async function(){
		fn_clearForm();

		let brno = SBUxMethod.get('dtl-input-brno');
		if(gfn_isEmpty(brno)) return;

		let yr = SBUxMethod.get('dtl-input-yr');

		let postJsonPromise = gfn_postJSON("/pd/pcm/selectPrfmncChckMngList.do", {
			brno : brno
			,yr  : yr
		});
		let data = await postJsonPromise;
		try{
			jsonPrfmncChckMng.length = 0;
			let totalRecordCount = 0;
			data.resultList.forEach((item, index) => {
				let itemVO = {
						yr			: item.yr
						,apoCd		: item.apoCd
						,brno		: item.brno
						,corpNm		: item.corpNm
						,itemCd		: item.itemCd
						,itemNm		: item.itemNm

						,slctnYr	: item.slctnYr

						,prfmncAmt1		: item.prfmncAmt1
						,prfmncAmt2		: item.prfmncAmt2
						,prfmncAmt3		: item.prfmncAmt3
						,prfmncAmt4		: item.prfmncAmt4
						,prfmncAmt5		: item.prfmncAmt5
						,prfmncAmt6		: item.prfmncAmt6
						,prfmncAmt7		: item.prfmncAmt7
						,prfmncAmt8		: item.prfmncAmt8
						,prfmncAmt9		: item.prfmncAmt9
						,prfmncAmt10	: item.prfmncAmt10
						,prfmncAmt11	: item.prfmncAmt11
						,prfmncAmt12	: item.prfmncAmt12

						,prevYrPrfmncAmt	: item.prevYrPrfmncAmt
						,expctPrfmncAmt		: item.expctPrfmncAmt
						,prfmncAmtRt		: item.prfmncAmtRt
						/* 20241127 전문 육성 구분 추가*/
						,sttgUpbrItemNm		: item.sttgUpbrItemNm
				}
				jsonPrfmncChckMng.push(itemVO);
			});

			grdPrfmncChckMng.rebuild();
			document.querySelector('#listCount').innerText = jsonPrfmncChckMng.length;

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/**
	 * 저장 버튼
	 */
	const fn_save = async function() {

		//통합조직 정보가 있어야만 가능함
		let brno = SBUxMethod.get("dtl-input-brno");
		if(gfn_isEmpty(brno)) return;

		//필수값 체크
		if(fn_checkRequiredInput()){
			return;
		}

		// 변경 저장
		fn_subUpdate(confirm("저장 하시겠습니까?"));
	}

	//필수값 확인
	function fn_checkRequiredInput(){
		//그리드 필수갑 확인
		//let gridData = grdGpcList.getGridDataAll();

		return false;
	}

	//실적 저장
	const fn_subUpdate = async function(isConfirmed){
		if (!isConfirmed) return;

		let gridData01 = grdPrfmncChckMng.getGridDataAll();
		let saveList = [];

		//그리드의 해드가 두줄이상인경우 for문 시작과 끝을 늘린만큼 늘려야함
		for(var i=2; i<=gridData01.length + 1; i++ ){
			let rowData01 = grdPrfmncChckMng.getRowData(i);
			let rowSts01 = grdPrfmncChckMng.getRowStatus(i);

			rowData01.rowSts = "I";
			saveList.push(rowData01);
		}

		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let postJsonPromise = gfn_postJSON("/pd/pcm/multiSavePrfmncChckMngList.do", saveList);
		let data = await postJsonPromise;
		try {
			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
				fn_dtlSearch();//상세조회
			} else {
				alert(data.resultMessage);
			}
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

</script>
</html>