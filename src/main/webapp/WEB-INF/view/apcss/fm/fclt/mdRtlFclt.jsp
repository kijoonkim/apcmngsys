<%
	/**
	 * @Class Name : mdRtlFclt.jsp
	 * @Description : APC전수조사 현황 parent
	 * @author SI개발부
	 * @since 2024.09.10
	 * @version 1.0
	 * @Modification Information
	 * @
	 * @ 수정일       	수정자      	수정내용
	 * @ ----------	----------	---------------------------
	 * @ 2024.09.10   	박승진		최초 생성
	 * @ 2025.04.26   	신정철		화면 개선 (평균 오류 등 전체 변경)
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
	<title>title : APC전수조사현황</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<style>
		@media print {
			.no-print {
				display: none!important;
			}
			.break {
				page-break-before: always !important;
			}
			* {
				color: inherit !important;  /* 색상 리셋을 피하고, 기본 색상 상속 */
				background: inherit !important;  /* 배경 색상 상속 */
				box-shadow: inherit !important;  /* 그림자 상속 */
				text-shadow: inherit !important;  /* 텍스트 그림자 상속 */
			}
			.sbgrid_FHT_st{
				background-color: rgb(245, 251, 255);
			}
			@page {
				size: A4 landscape; /* A4 가로모드 설정 */
				margin: 0; /* 페이지 여백 설정 */
			}

			/*body {*/
			/*	transform: scale(0.74); !* 74%로 크기 축소 *!*/
			/*	transform-origin: top left; !* 왼쪽 상단 기준으로 크기 조정 *!*/
			/*	width: 100%; !* 전체 너비에 맞게 조정 *!*/
			/*	height: auto; !* 높이는 자동으로 설정 *!*/
			/*}*/

			#tab_content {
				width: 100%;
				height: auto;
				page-break-inside: avoid; /* 페이지 중간에서 잘리지 않도록 설정 */
			}
		}

		._grid_header {
			display: flex;
			justify-content: space-between;
			width: 100%;
			height: 30px;
			box-sizing: border-box;
		}
		._grid_header_l {
			text-align: left;
			padding: 5px;
			width: 60%;
		}
		._grid_header_r {
			text-align: right;
			padding: 5px;
			width: 40%;
		}
		._grid_header_r span {
			font-size:11px;
			font-weight: normal;
		}
		._grid_header_hl {
			font-size: 12px;
			margin-right: 3px;
			font-weight: 600;
			color: #3c6dbc;
		}

	</style>
</head>
<body oncontextmenu="return false">
<section>
	<div class="box box-solid">
		<div class="box-header no-print" style="display:flex; justify-content: flex-start;" >

			<div class="ad_tbl_toplist btn_list">
				<sbux-button id="btnMap" name="btnMap" uitype="normal" text="APC전수조사" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
				<sbux-button id="btnMdRtlOgnzNow" name="btnMdRtlOgnzNow" uitype="normal" text="산지유통시설" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
				<sbux-button id="btnMdRtlFcltRgnNow" name="btnMdRtlFcltRgnNow" uitype="normal" text="산지유통시설지역별" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
				<sbux-button id="btnGvrngmtSprtMdRtlFclt" name="btnGvrngmtSprtMdRtlFclt" uitype="normal" text="정부지원산지유통시설" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
				<sbux-button id="btnGvrngmtSprtMdRtlFcltRgn" name="btnGvrngmtSprtMdRtlFcltRgn" uitype="normal" text="정부지원산지유통시설지역별" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
				<sbux-button id="btnMdRtlFcltOperPrfmnc" name="btnMdRtlFcltOperPrfmnc" uitype="normal" text="산지유통시설운영실적" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
				<sbux-button id="btnGvrngmtSprtRgnOperPrfmnc" name="btnGvrngmtSprtRgnOperPrfmnc" uitype="normal" text="정부지원지역별운영실적" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
			</div>

			<div style="margin-left: auto;">
				<table style="border: 0px; margin-bottom: 6px">
					<tr>
						<td style="text-align: right; line-height: 32px">
							<span> 연도 : </span>
						</td>
						<td style="padding-left: 10px; padding-right: 15px;">
							<sbux-select
									uitype="single"
									id="srch-slt-crtrYr"
									name="srch-slt-crtrYr"
									class="form-control input-sm input-sm-ast"
									jsondata-ref="jsonCrtrYr"
									style="width: 200px"></sbux-select>
						</td>
						<td style="position: initial">
							<sbux-button
									id="btnSearch"
									name="btnSearch"
									uitype="normal"
									class="btn btn-sm btn-outline-danger"
									text="조회"
									onclick="fn_search()"
							></sbux-button>
							<sbux-button
									id="btnPrintPdf"
									name="btnPrintPdf"
									uitype="normal"
									class="btn btn-sm btn-outline-danger"
									text="일괄조회"
									onclick="fn_print()"
							></sbux-button>
							<sbux-button
									id="btn-exportExcel"
									name="btn-exportExcel"
									uitype="normal"
									class="btn btn-sm btn-primary"
									text="엑셀출력"
									onclick="fn_downloadExcel()"
							></sbux-button>
							<!--
                            <sbux-button id="btnPrintPdf1" name="btnPrintPdf1" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_print1()"></sbux-button>
                            <div style="position: absolute; right: 15px; bottom: 0;">출력옵션 안내 > 레이아웃: 가로모드, 배율: 맞춤설정(미리보기 확인[70~79])</div>
                            -->
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="box-body">
			<div id="tab_content">
				<!-- 지도 탭 화면 -->
				<div id="Map">
					<jsp:include page="../../fm/fclt/map.jsp"></jsp:include>
				</div>
				<!-- 산지유통시설현황 탭 화면 -->
				<div id="MdRtlOgnzNow">
					<jsp:include page="../../fm/fclt/mdRtlOgnzNow.jsp"></jsp:include>
				</div>
				<!-- 산지유통시설지역별현황 탭 화면 -->
				<div id="MdRtlFcltRgnNow" class="break">
					<jsp:include page="../../fm/fclt/mdRtlFcltRgnNow.jsp"></jsp:include>
				</div>
				<!-- 정부지원산지유통시설현황 탭 화면 -->
				<div id="GvrngmtSprtMdRtlFclt" class="break">
					<jsp:include page="../../fm/fclt/gvrngmtSprtMdRtlFclt.jsp"></jsp:include>
				</div>
				<!-- 정부지원산지유통시설지역별현황 탭 화면 -->
				<div id="GvrngmtSprtMdRtlFcltRgn" class="break">
					<jsp:include page="../../fm/fclt/gvrngmtSprtMdRtlFcltRgn.jsp"></jsp:include>
				</div>
				<!-- 산지유통시설운영실적 탭 화면 -->
				<div id="MdRtlFcltOperPrfmnc" class="break">
					<jsp:include page="../../fm/fclt/mdRtlFcltOperPrfmnc.jsp"></jsp:include>
				</div>
				<!-- 정부지원지역별운영실적 탭 화면 -->
				<div id="GvrngmtSprtRgnOperPrfmnc" class="break">
					<jsp:include page="../../fm/fclt/gvrngmtSprtRgnOperPrfmnc.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
<script type="text/javascript">
	var searchTarget = "Map";
	var newSearchTarget = "Map";
	$(function(){
		$('.btn_list button').click(function(){
			var btnName = $(this).attr('id');
			$('.ad_tbl_toplist button').css({'background-color':'#FFFFFF', 'border':'1px solid #666666', 'color': '#666666'});
			$('#Map').hide();
			$('#MdRtlOgnzNow').hide();
			$('#MdRtlFcltRgnNow').hide();
			$('#GvrngmtSprtMdRtlFclt').hide();
			$('#GvrngmtSprtMdRtlFcltRgn').hide();
			$('#MdRtlFcltOperPrfmnc').hide();
			$('#GvrngmtSprtRgnOperPrfmnc').hide();
			$('#'+btnName.slice(3)).show();
			$('[name='+btnName+']').css({'background-color':'#149FFF', 'border':'1px solid #149FFF', 'color': '#FFFFFF'});
			searchTarget = btnName.slice(3);
			fn_search();
		});

	});

	window.addEventListener('DOMContentLoaded', async function(e) {
		await fn_init();
	})

	const fn_init = async function() {

		try {
			SBUxMethod.openProgress(gv_loadingOptionsSub);
			await fn_initSBSelect();
			fn_createAllGrid();

		} catch(e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		} finally {
			SBUxMethod.closeProgress(gv_loadingOptionsSub);
		}

		$('[id=btnMap]').click();
	}

	const fn_createAllGrid = function() {
		fn_createGridApc();
		fn_createGridApcFcltTot();
		fn_createGridApcFcltTotByCtpv();
		fn_createGridGovApcFcltTot();
		fn_createGridGovApcFcltTotByCtpv();
		fn_createGridOperOgnzTot();
		fn_createGridGovOperOgnzTot();
	}


	// 이력 조회 (조회 버튼)
	const fn_search = async function() {

		const isTargetChanged = true;	//!_.isEqual(searchTarget, newSearchTarget);

		switch (searchTarget) {
			case "Map":
				if (isTargetChanged){
					fn_createGridApc();
				}
				await fn_setApcTot();
				break;
			case "MdRtlOgnzNow":			// 1. 산지유통시설현황
				if (isTargetChanged){
					fn_createGridApcFcltTot();
				}
				await fn_setApcFcltTotGrid();
				break;
			case "MdRtlFcltRgnNow":			// 2. 산지유통시설 지역별 현황
				if (isTargetChanged){
					fn_createGridApcFcltTotByCtpv();
				}
				await fn_setApcFcltTotGridByCtpv();
				break;
			case "GvrngmtSprtMdRtlFclt":	// 3. 정부지원 산지유통시설 현황
				if (isTargetChanged){
					fn_createGridGovApcFcltTot();
				}
				await fn_setGovApcFcltTotGrid();
				break;
			case "GvrngmtSprtMdRtlFcltRgn":	// 4. 정부지원 산지유통시설 지역별 현황
				if (isTargetChanged){
					fn_createGridGovApcFcltTotByCtpv();
				}
				await fn_setGovApcFcltTotGridByCtpv();
				break;
				break;
			case "MdRtlFcltOperPrfmnc":		// 5. 산지유통시설 운영실적
				if (isTargetChanged){
					fn_createGridOperOgnzTot();
				}
				await fn_setOperOgnzTotGrid();
				break;
			case "GvrngmtSprtRgnOperPrfmnc":
				if (isTargetChanged){
					fn_createGridGovOperOgnzTot();
				}
				await fn_setGovOperOgnzTotGrid();
				break;
			default:
				return;
		}

		newSearchTarget = searchTarget;

		/**

		 if (searchTarget == "MdRtlOgnzNow"){
			if (searchTarget != newSearchTarget){
				//fn_cellCreateMdRtlOgnzNowGrid();
				fn_createGridApcFcltTot();
			}
			await fn_setApcFcltTotGrid();

			newSearchTarget = searchTarget;
		} else if(searchTarget == "MdRtlFcltRgnNow"){
			if(searchTarget != newSearchTarget){
				fn_cellCreateMdRtlFcltRgnNowGrid();
			}else{
				fn_cellMdRtlFcltRgnNowGrid();
			}
			newSearchTarget = searchTarget;
		} else if(searchTarget == "GvrngmtSprtMdRtlFclt"){
			if(searchTarget != newSearchTarget){
				fn_cellCreateGvrngmtSprtMdRtlFcltGrid();
			}else{
				fn_cellGvrngmtSprtMdRtlFcltGrid();
			}
			newSearchTarget = searchTarget;
		} else if(searchTarget == "GvrngmtSprtMdRtlFcltRgn"){
			if(searchTarget != newSearchTarget){
				fn_cellCreateGvrngmtSprtMdRtlFcltRgnGrid();
			}else{
				fn_cellGvrngmtSprtMdRtlFcltRgnGrid();
			}
			newSearchTarget = searchTarget;
		} else if (searchTarget == "MdRtlFcltOperPrfmnc"){
			if(searchTarget != newSearchTarget){
				fn_cellCreateMdRtlFcltOperPrfmncGrid();
			}else{
				fn_cellMdRtlFcltOperPrfmncGrid();
			}
			newSearchTarget = searchTarget;
		} else if(searchTarget == "GvrngmtSprtRgnOperPrfmnc"){
			if(searchTarget != newSearchTarget){
				fn_cellCreateGvrngmtSprtRgnOperPrfmncGrid();
			}else{
				fn_cellGvrngmtSprtRgnOperPrfmncGrid();
			}
			newSearchTarget = searchTarget;
		} else if(searchTarget == "Map"){
			fn_apcSttn();
		}
		 */
	}

	var jsonCrtrYr = [];	// 기준년도 검색

	const fn_initSBSelect = async function() {
		await gfn_setCrtrYr('srch-slt-crtrYr', jsonCrtrYr);		// 기준년도 목록
		SBUxMethod.set("srch-slt-crtrYr", jsonCrtrYr[0].value);
	}

	const fn_print = async function(){
		/** 기존 탭 전부 조회 **/
		const divs = document.querySelectorAll('#tab_content > div');

		try {
			SBUxMethod.openProgress(gv_loadingOptionsSub);
			for (const [idx, div] of divs.entries()) {
				$(div).show();
				searchTarget = $(div).attr('id');
				await fn_search();
			}
		} catch(e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		} finally {
			SBUxMethod.closeProgress(gv_loadingOptionsSub);
		}

		// document.querySelectorAll('#tab_content > div').forEach(function(div,idx) {
		// 	console.log(div,idx,"ㅋㅋㅋ현호잘해");
		// 	$(div).show();
		// 	searchTarget = $(div).attr('id');
		// 	console.log(searchTarget);
		// 	fn_search();
		// });
		//
		// var initBody;
		// window.onbeforeprint = function(){
		// 	document.body.innerHTML =  document.getElementById('tab_content').innerHTML;
		// };
		// window.onafterprint = function(){
		// 	document.body.innerHTML = initBody;
		// };
		// window.print();
	}

	const fn_print1 = async function(){
		let crtrYr = SBUxMethod.get("srch-slt-crtrYr");
		const postJsonPromise = gfn_postJSON("/fm/fclt/selectCtpvAreaList.do", {
			crtrYr	: crtrYr
		});
		const data = await postJsonPromise;

		const now = new Date();
		const formatted = now.toLocaleString('ko-KR', {
			year: '2-digit', month: '2-digit', day: '2-digit',
			hour: '2-digit', minute: '2-digit', hour12: false
		}).replace(/[\.\s:]/g, '');

		jsonApcAreaList = data.resultList;
		grdApcAreaList.rebuild();
		grdApcAreaList.exportLocalExcel(`APC지역현황${'${formatted}'}`,{});

		window.onbeforeprint = function(){
			document.body.innerHTML =  document.getElementById('tab_content').innerHTML;
		};
		window.onafterprint = function(){
			location.reload();
		};
		window.print();
	}

	const fn_downloadExcel = async function(){

		if (!gfn_comConfirm("Q0001", "엑셀출력")) {	//	Q0001	{0} 하시겠습니까?
			return;
		}

		let btns = $(".btn_list")
				.find("button")
				// .find("span")
				.map(function () {
					let body = this.id;
					body = body.slice(3);
					return {
						text: this.innerText,
						body: body
					};
				})
				.get();

		let seetArr = [];

		let first;
		let cnt = 0;
		btns.forEach(function(item){
			let gridNm = $("#" + item.body).find("div[id^='sb-area-']").get();
			gridNm.forEach(function(iner,idx){
				cnt++;
				if (cnt === 1){
					first = iner;
				} else {
					let title = $(iner).prev().find("span").map(function () {
						return $(this).text();
					}).get().join(" ");

					seetArr.push({seetName: item.text, gridNm: iner, title: title});
					// seetArr.push({seetName: item.text + idx, gridNm: iner, title: title});
				}
			});
		});

		var dataList = [];
		var sheetNameList = seetArr.map(item => item.seetName);
		var titleList = seetArr.map(item => item.title);
		var unitList = Array(62).fill("");
		var arrAdditionalData = [];

		var objExcelInfo = {
			strFileName : 'APC전수조사현황.xlsx',
			strAction : "/am/excel/saveMultiGridExcel",
			objTitleInfo : [{
				"title":"전수조사 집계현황",
			}],
			bIsStyle: true,
			bIsMerge: true,
			bUseFormat: false,
			bIncludeData: true,
			bUseCompress: false,
		};

		dataList = seetArr
				// .filter((_, idx) => idx > 0)
				.map(item => {
					console.log("item", item);
					let grid = item.gridNm.id;
					console.log("grid", grid);
					let converted = grid.replace("sb-area-", "");
					let data = window[converted].exportExcel(objExcelInfo, "return");
					return data;
				});

		first = first.id.replace("sb-area-","");

		arrAdditionalData.push(
				{"name": "arrSheetData", "value": JSON.stringify(dataList)},
				{"name": "arrSheetName", "value": JSON.stringify(sheetNameList)},
				{"name": "arrTitle", "value": JSON.stringify(titleList)},
				{"name": "arrUnit", "value": JSON.stringify(unitList)}
		);

		objExcelInfo.arrAdditionalData = arrAdditionalData;
		window[first].exportExcel(objExcelInfo);
	}

</script>
</html>