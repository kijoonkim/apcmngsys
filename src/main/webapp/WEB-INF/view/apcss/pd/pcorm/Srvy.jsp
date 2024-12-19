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
					<!-- 사업계획서 등록 관리 -->
					<sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
					</sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnRowData" name="btnRowData" uitype="normal" text="로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 15%">
						<col style="width: 15%">
						<col style="width: 5%">
						<col style="width: 15%">
						<col style="width: 15%">
						<col style="width: 35%">
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
							<td style="border-right: hidden;"></td>

							<th scope="row" class="th_bg" >조직구분</th>
							<td class="td_input" style="border-right:hidden;" >
								<sbux-select
									id="srch-input-aprv"
									name="srch-input-aprv"
									uitype="single"
									jsondata-ref="jsonComAprv"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div style="">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="font-size:14px">▶조직 리스트</span>
								<span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
							</li>
						</ul>
					</div>
					<!-- SBGrid를 호출합니다. -->
					<div id="sb-area-grdSrvy" style="height:550px; width: 100%;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
			<div id="sb-area-hiddenGrd" style="height:400px; width: 100%; display: none;"></div>
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
					fn_searchBizPlan();
				}
				//key	Enter
				//keyCode
			});
		}
	})

	//var jsonComCmptnInst = [];//관할기관
	var jsonComAprv = [];//조직구분
		/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			//gfn_setComCdSBSelect('srch-input-cmptnInst', 	jsonComCmptnInst, 	'CMPTNC_INST'), //관할기관
			gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 	'APRV_UPBR_SE_CD'), //통합조직여부
		]);
	}

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		fn_setYear()//기본년도 세팅

		await fn_srvyCreateGrid();

		await fn_initSBSelect();

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
		SBUxMethod.set("srch-input-yr",year);
		SBUxMethod.set("dtl-input-yr",year);
	}


	/* 설문조사 그리드 */

	//그리드 변수
	var jsonSrvy = []; // 그리드의 참조 데이터 주소 선언
	var grdSrvy;


	/* Grid 화면 그리기 기능*/
	const fn_srvyCreateGrid = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdSrvy';
		SBGridProperties.id = 'grdSrvy';
		SBGridProperties.jsonref = 'jsonSrvy';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.rowheader="seq";
		SBGridProperties.rowheight = '55';
		SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
			};

		SBGridProperties.columns = [
			{caption: ["등록년도"], 	ref: 'yr',			type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["유저 아이디"], 	ref: 'userId',		type:'output',  width:'100px',	style:'text-align:center'},
			{caption: ["법인명"], 		ref: 'corpNm',		type:'output',  width:'185px',	style:'text-align:center'},
			{caption: ["조직구분"], 	ref: 'aprv',		type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["설문내용"], 	ref: 'srvyCn',		type:'output',  width:'500px',	style:'text-align:center'},
			{caption: ["응답내용"], 	ref: 'rspnsCn',	 typeinfo : {textareascroll : true},	type:'textarea',  width:'500px' ,disabled:true },
			{caption: ["설문 종류"], 	ref: 'srvyKnd',   	hidden : true},
			{caption: ["설문 일련번호"], 	ref: 'srvySn',   	hidden : true},
		];

		grdSrvy = _SBGrid.create(SBGridProperties);
		//클릭 이벤트 바인드
		//grdSrvy.bind('click','fn_view');
		grdSrvy.bind('beforepagechanged', 'fn_pagingSrvyList');
	}

	/* 설문조사 리스트 조회 */

	/**
	 * 목록 조회
	 */
	const fn_search = async function() {

		// set pagination
		let pageSize = grdSrvy.getPageSize();
		let pageNo = 1;

		fn_setGrdSrvyList(pageSize, pageNo);
	}

	const fn_pagingSrvyList = async function() {
		let recordCountPerPage = grdSrvy.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let currentPageNo = grdSrvy.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		fn_setGrdSrvyList(recordCountPerPage, currentPageNo);
	}

	/* Grid Row 조회 기능*/
	const fn_setGrdSrvyList = async function(pageSize, pageNo){

		let yr = SBUxMethod.get("srch-input-yr");//

		let aprv = SBUxMethod.get("srch-input-aprv");//

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectSrvyList.do", {
			yr : yr

			,aprv : aprv

			//페이징
			,pagingYn : 'Y'
			,currentPageNo : pageNo
	 		,recordCountPerPage : pageSize
		});
		let data = await postJsonPromise;
		try{
			jsonSrvy.length = 0;
			let totalRecordCount = 0;
			//console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let SrvyReqMngVO = {
						yr			: item.yr
						,userId		: item.userId
						,srvyKnd	: item.srvyKnd
						,srvySn		: item.srvySn
						,srvyCn		: item.srvyCn
						,rspnsCn	: item.rspnsCn
						,aprv		: item.aprv
						,corpNm		: item.corpNm
				}
				jsonSrvy.push(SrvyReqMngVO);
				if (index === 0) {
					totalRecordCount = item.totalRecordCount;
				}
			});

			if (jsonSrvy.length > 0) {

				if(grdSrvy.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdSrvy.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdSrvy.rebuild();
				}else{
					grdSrvy.refresh()
				}
			} else {
				grdSrvy.setPageTotalCount(totalRecordCount);
				grdSrvy.rebuild();
			}
			document.querySelector('#listCount').innerText = totalRecordCount;

			//grdSrvy.rebuild();

			//조회후 포커스가 이상한곳으로 가있는 경우가 있어서 추가
			window.scrollTo(0, 0);
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	/* 로우데이터 요청 */

	var jsonHiddenGrd = []; // 그리드의 참조 데이터 주소 선언
	var hiddenGrd;

	/* Grid 화면 그리기 기능*/
	const fn_hiddenGrd = async function() {

		let SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-hiddenGrd';
		SBGridProperties.id = 'hiddenGrd';
		SBGridProperties.jsonref = 'jsonHiddenGrd';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.rowheader="seq";
		SBGridProperties.columns = [
			{caption: ["등록년도"], 	ref: 'yr',			type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["유저 아이디"], 	ref: 'userId',		type:'output',  width:'100px',	style:'text-align:center'},
			{caption: ["법인명"], 		ref: 'corpNm',		type:'output',  width:'100px',	style:'text-align:center'},
			{caption: ["조직구분"], 	ref: 'aprv',		type:'output',  width:'80px',	style:'text-align:center'},
			{caption: ["설문내용"], 	ref: 'srvyCn',		type:'output',  width:'500px',	style:'text-align:center'},
			{caption: ["응답내용"], 	ref: 'rspnsCn',	 	type:'output',  width:'500px',	style:'text-align:center'},
		];

		hiddenGrd = _SBGrid.create(SBGridProperties);

	}
	const fn_hiddenGrdSelect = async function(){
		await fn_hiddenGrd();
		let yr = SBUxMethod.get("srch-input-yr");
		if (gfn_isEmpty(yr)) {
			let now = new Date();
			let year = now.getFullYear();
			yr = year;
		}

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectSrvyList.do", {
			yr : yr
		});

		let data = await postJsonPromise;
		try{
			jsonHiddenGrd.length = 0;
			console.log("data==="+data);
			data.resultList.forEach((item, index) => {
				let hiddenGrdVO = {
						yr			: item.yr
						,userId		: item.userId
						,srvyKnd	: item.srvyKnd
						,srvySn		: item.srvySn
						,srvyCn		: item.srvyCn
						,rspnsCn	: item.rspnsCn
						,aprv		: item.aprv
						,corpNm		: item.corpNm
				}
				jsonHiddenGrd.push(hiddenGrdVO);
			});

			await hiddenGrd.rebuild();

			await fn_excelDown();

		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}
	//로우 데이터 엑셀 다운로드
	function fn_excelDown(){
		const currentDate = new Date();

		const year = currentDate.getFullYear().toString().padStart(4, '0');
		const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');// 월은 0부터 시작하므로 1을 더합니다.
		const day = currentDate.getDate().toString().padStart(2, '0');
		let formattedDate = year + month + day;

		let fileName = formattedDate + "_설문조사_로우데이터";

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
		console.log(hiddenGrd.exportData);
		hiddenGrd.exportData("xlsx" , fileName , true , true);
	}
</script>
</html>