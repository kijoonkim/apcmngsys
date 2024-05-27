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
						<col style="width: 70%">
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
		</div>
	</section>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		let now = new Date();
		let year = now.getFullYear();
		SBUxMethod.set("srch-input-yr",year);//

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
		/**
	 * combo 설정
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			//검색조건
			//gfn_setComCdSBSelect('srch-input-cmptnInst', 	jsonComCmptnInst, 	'CMPTNC_INST'), //관할기관
		]);
	}

	/* 초기화면 로딩 기능*/
	const fn_init = async function() {
		await fn_srvyCreateGrid();

		await fn_initSBSelect();

		await fn_search();
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

		let postJsonPromise = gfn_postJSON("/pd/pcorm/selectSrvyList.do", {
			yr : yr

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
</script>
</html>