<%
	/**
	 * @Class Name : gvrngmtSprtRgnOperPrfmnc.jsp
	 * @Description : APC전수조사 현황 - 6. 정부지원 지역별 운영실적
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : 6. 정부지원 지역별 운영실적</title>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-body">
			<div class="box-header" style="display:flex; justify-content: flex-start; width: 100%; padding-left:5px;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> 6. 정부지원 지역별 운영실적</h3>
				</div>
			</div>
			<div class="box-header no-print" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<span style="font-weight: 600; font-size:15px; color:black;">6.1. 운영조직 취급 및 APC 처리 실적</span>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">운영조직 취급실적</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdGovOperOgnzTrmt" style="height:187px;"></div>
					<span style="font-size:11px;">*조직화취급액 : 공동선별(수탁) 및 계약재배(매취) 금액</span>
				</div>
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">산지유통시설 처리실적</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdGovOperOgnzPrcs" style="height:187px;"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">산지유통시설 처리실적(평균)</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdGovOperOgnzPrcsAvg" style="height:187px;"></div>
				</div>
				<div class="col-sm-6">
				</div>
			</div>

			<div class="box-header no-print" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<span style="font-weight: 600; font-size:15px; color:black;">6.2. 지역별 운영조직 취급 및 APC 처리 실적</span>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">지역별 운영조직 취급실적</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdGovOperOgnzTrmtByCtpv" style="height:337px;"></div>
				</div>
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">지역별 운영조직 취급실적(평균)</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdGovOperOgnzTrmtAvgByCtpv" style="height:337px;"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">지역별 APC 처리실적</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdGovOperOgnzPrcsByCtpv" style="height:337px;"></div>
				</div>
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">지역별 APC 처리실적(평균)</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdGovOperOgnzPrcsAvgByCtpv" style="height:337px;"></div>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
<script type="text/javascript">

	// 그리드
	var grdGovOperOgnzTrmt = null;
	var grdGovOperOgnzPrcs = null;
	var grdGovOperOgnzPrcsAvg = null;
	var grdGovOperOgnzTrmtByCtpv = null;
	var grdGovOperOgnzTrmtAvgByCtpv = null;
	var grdGovOperOgnzPrcsByCtpv = null;
	var grdGovOperOgnzPrcsAvgByCtpv = null;
	// JSON
	var jsonGovOperOgnzTrmt = [];
	var jsonGovOperOgnzTrmtByCtpv = [];

	/**
	 * @name fn_clearGovOperOgnzTotJson
	 * @description 6. 정부지원 APC 운영조직 집계 조회 그리드 데이터 정리
	 * @function
	 */
	const fn_clearGovOperOgnzTotJson = function() {
		jsonGovOperOgnzTrmt.length = 0;
		jsonGovOperOgnzTrmtByCtpv.length = 0;
	}

	/**
	 * @name fn_rebuildGovOperOgnzTotGrid
	 * @description 6. 정부지원 APC 운영조직 집계 조회 그리드 Rebuild
	 * @function
	 */
	const fn_rebuildGovOperOgnzTotGrid = function() {
		grdGovOperOgnzTrmt.rebuild();
		grdGovOperOgnzPrcs.rebuild();
		grdGovOperOgnzPrcsAvg.rebuild();
		grdGovOperOgnzTrmtByCtpv.rebuild();
		grdGovOperOgnzTrmtAvgByCtpv.rebuild();
		grdGovOperOgnzPrcsByCtpv.rebuild();
		grdGovOperOgnzPrcsAvgByCtpv.rebuild();
	}

	/**
	 * @name fn_createGridGovOperOgnzTot
	 * @description 6. 정부지원 APC 운영조직 집계 그리드 생성
	 * @function
	 */
	const fn_createGridGovOperOgnzTot = function() {
		fn_createGridGovOperOgnzTrmt();
		fn_createGridGovOperOgnzPrcs();
		fn_createGridGovOperOgnzPrcsAvg();
		fn_createGridGovOperOgnzTrmtByCtpv();
		fn_createGridGovOperOgnzTrmtAvgByCtpv();
		fn_createGridGovOperOgnzPrcsByCtpv();
		fn_createGridGovOperOgnzPrcsAvgByCtpv();
	}
	/**
	 * @name fn_setGovOperOgnzTotGrid
	 * @description 6. 정부지원 운영조직 집계 조회
	 * @function
	 */
	const fn_setGovOperOgnzTotGrid = async function() {

		try {
			const crtrYr = SBUxMethod.get("srch-slt-crtrYr");
			const postUrl = "/fm/fclt/selectGovOperOgnzTrmtTotList.do";

			fn_clearGovOperOgnzTotJson();

			const postJsonPromise = gfn_postJSON(postUrl, {crtrYr: crtrYr});
			const data = await postJsonPromise;

			if (!_.isEqual("S", data.resultStatus)) {
				gfn_comAlert(data.resultCode, data.resultMessage);
				return;
			}
			/**
			 * 	operOgnzTrmtList
			 * 	operOgnzTrmtListByCtpv
			 */

			if (!gfn_isEmpty(data.operOgnzTrmtList)) {
				data.operOgnzTrmtList.forEach(item => {
					jsonGovOperOgnzTrmt.push(item);
				});
			}
			if (!gfn_isEmpty(data.operOgnzTrmtListByCtpv)) {
				data.operOgnzTrmtListByCtpv.forEach(item => {
					jsonGovOperOgnzTrmtByCtpv.push(item);
				});
			}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		} finally {
			fn_rebuildGovOperOgnzTotGrid();
		}
	}

	/**
	 * @name fn_createGridGovOperOgnzTrmt
	 * @description 운영조직 취급실적 그리드 생성
	 * @function
	 */
	const fn_createGridGovOperOgnzTrmt = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovOperOgnzTrmt';
		SBGridProperties.id = 'grdGovOperOgnzTrmt';
		SBGridProperties.jsonref = 'jsonGovOperOgnzTrmt';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.allowcopy = true;
		SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
				standard: [0],
				sum: [1,3,5],
				//avg: [2,4],
				custom: [2,4],
				customFunc: function(colId, row) {
					let sumCol = "";
					let cntCol = "cntApc";
					switch (colId) {
						case "ognzTotTrmtAmtAvg":
							sumCol = "ognzTotTrmtAmt";
							break;
						case "ognzOgnzSumAvg":
							sumCol = "ognzOgnzSum";
							break;
					}

					const sum = parseInt(row[sumCol]) || 0;
					const cnt = parseInt(row[cntCol]) || 0;

					if (cnt <= 0) {
						return 0;
					}

					return (sum / cnt).toFixed(0);
				}
			},
			grandtotalrow : {
				titlecol: 0,
				titlevalue: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				1: '#,###',
				2: '#,###',
				3: '#,###',
				4: '#,###',
				5: '#,###',
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'cmsuApcSeNm',
				type: 'output',
				width:'20%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
			},
			{
				caption : ["총취급액"," 총취급액 "],
				ref: 'ognzTotTrmtAmt',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["총취급액","평균취급액"],
				ref: 'ognzTotTrmtAmtAvg',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["조직화취급액"," 조직화취급액 "],
				ref: 'ognzOgnzSum',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["조직화취급액","평균조직화취급액"],
				ref: 'ognzOgnzSumAvg',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				ref: 'cntApc',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format: {type:'number', rule:'#,###'},
				hidden: true
			},
		];
		grdGovOperOgnzTrmt = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridGovOperOgnzPrcs
	 * @description 운영조직 처리실적 그리드 생성
	 * @function
	 */
	const fn_createGridGovOperOgnzPrcs = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovOperOgnzPrcs';
		SBGridProperties.id = 'grdGovOperOgnzPrcs';
		SBGridProperties.jsonref = 'jsonGovOperOgnzTrmt';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.allowcopy = true;
		SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
				standard: [0],
				sum: [1,2,3,4],
			},
			grandtotalrow : {
				titlecol: 0,
				titlevalue: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				1: '#,###',
				2: '#,###',
				3: '#,###',
				4: '#,###'
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'cmsuApcSeNm',
				type: 'output',
				width:'20%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
			},
			{
				caption : ["APC 취급액","APC 취급액"],
				ref: 'apcTrmtAmt',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["일반취급액","일반취급액"],
				ref: 'apcGnrlTrmtAmt',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["조직화취급액","공동선별(수탁)"],
				ref: 'apcOgnzCprtnSortTrst',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["조직화취급액","계약재배(매취)"],
				ref: 'apcCtrtEmspap',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			}
		];
		grdGovOperOgnzPrcs = _SBGrid.create(SBGridProperties);
	}
	/**
	 * @name fn_createGridGovOperOgnzTrmtAvg
	 * @description 운영조직 처리실적 평균 그리드 생성
	 * @function
	 */
	const fn_createGridGovOperOgnzPrcsAvg = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovOperOgnzPrcsAvg';
		SBGridProperties.id = 'grdGovOperOgnzPrcsAvg';
		SBGridProperties.jsonref = 'jsonGovOperOgnzTrmt';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.allowcopy = true;
		SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
				standard: [0],
				sum: [5,6,7,8,9],
				//avg: [1,2,3,4]
				custom: [1,2,3,4],
				customFunc: function(colId, row) {
					let sumCol = "";
					let cntCol = "cntApc";
					switch (colId) {
						case "apcTrmtAmtAvg":
							sumCol = "apcTrmtAmt";
							break;
						case "apcGnrlTrmtAmtAvg":
							sumCol = "apcGnrlTrmtAmt";
							break;
						case "apcOgnzCprtnSortTrstAvg":
							sumCol = "apcOgnzCprtnSortTrst";
							break;
						case "apcCtrtEmspapAvg":
							sumCol = "apcCtrtEmspap";
							break;
					}

					const sum = parseInt(row[sumCol]) || 0;
					const cnt = parseInt(row[cntCol]) || 0;

					if (cnt <= 0) {
						return 0;
					}

					return (sum / cnt).toFixed(0);
				}
			},
			grandtotalrow : {
				titlecol: 0,
				titlevalue: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				1: '#,###',
				2: '#,###',
				3: '#,###',
				4: '#,###',
				5: '#,###',
				6: '#,###',
				7: '#,###',
				8: '#,###',
				9: '#,###'
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'cmsuApcSeNm',
				type: 'output',
				width:'20%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
			},
			{
				caption : ["APC 평균 취급액","APC 평균 취급액"],
				ref: 'apcTrmtAmtAvg',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["평균 일반취급액","평균 일반취급액"],
				ref: 'apcGnrlTrmtAmtAvg',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["평균 조직화취급액"," 공동선별(수탁) "],
				ref: 'apcOgnzCprtnSortTrstAvg',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["평균 조직화취급액","계약재배(매취)"],
				ref: 'apcCtrtEmspapAvg',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["APC 취급액","APC 취급액"],
				ref: 'apcTrmtAmt',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				caption : ["일반취급액","일반취급액"],
				ref: 'apcGnrlTrmtAmt',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				caption : ["조직화취급액","공동선별(수탁)"],
				ref: 'apcOgnzCprtnSortTrst',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				caption : ["조직화취급액","계약재배(매취)"],
				ref: 'apcCtrtEmspap',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				ref: 'cntApc',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format: {type:'number', rule:'#,###'},
				hidden: true
			},


		];
		grdGovOperOgnzPrcsAvg = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridGovOperOgnzTrmtByCtpv
	 * @description 지역별 운영조직 취급실적 그리드 생성
	 * @function
	 */
	const fn_createGridGovOperOgnzTrmtByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovOperOgnzTrmtByCtpv';
		SBGridProperties.id = 'grdGovOperOgnzTrmtByCtpv';
		SBGridProperties.jsonref = 'jsonGovOperOgnzTrmtByCtpv';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.allowcopy = true;
		SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
				standard: [0],
				sum: [1,2,3,4,5,6],
			},
			grandtotalrow : {
				titlecol: 0,
				titlevalue: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				1: '#,###',
				2: '#,###',
				3: '#,###',
				4: '#,###',
				5: '#,###',
				6: '#,###'
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'ctpvNm',
				type: 'output',
				width:'13%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
			},
			{
				caption : ["총취급액","농협"],
				ref: 'ognzTotTrmtAmtCoo',
				type: 'output',
				datatype: 'number',
				width:'13%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["총취급액","농업법인"],
				ref: 'ognzTotTrmtAmtCmp',
				type: 'output',
				datatype: 'number',
				width:'13%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["총취급액","합계"],
				ref: 'ognzTotTrmtAmt',
				type: 'output',
				datatype: 'number',
				width:'17.5%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["조직화취급액"," 농협 "],
				ref: 'ognzOgnzSumCoo',
				type: 'output',
				datatype: 'number',
				width:'13%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["조직화취급액","농협법인"],
				ref: 'ognzOgnzSumCmp',
				type: 'output',
				datatype: 'number',
				width:'13%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["조직화취급액","합계"],
				ref: 'ognzOgnzSum',
				type: 'output',
				datatype: 'number',
				width:'17.5%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			}
		];
		grdGovOperOgnzTrmtByCtpv = _SBGrid.create(SBGridProperties);
	}
	/**
	 * @name fn_createGridGovOperOgnzTrmtAvgByCtpv
	 * @description 지역별 운영조직 취급실적 평균 그리드 생성
	 * @function
	 */
	const fn_createGridGovOperOgnzTrmtAvgByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovOperOgnzTrmtAvgByCtpv';
		SBGridProperties.id = 'grdGovOperOgnzTrmtAvgByCtpv';
		SBGridProperties.jsonref = 'jsonGovOperOgnzTrmtByCtpv';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.allowcopy = true;
		SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
				standard: [0],
				sum: [7,8,9,10,11,12,13,14,15],
				//sum: [1,2,3,4,5,6],
				custom: [1,2,3,4,5,6],
				customFunc: function(colId, row) {
					let sumCol = "";
					let cntCol = "";
					switch (colId) {
						case "ognzTotTrmtAmtAvgCoo":
							sumCol = "ognzTotTrmtAmtCoo";
							cntCol = "cntCoo";
							break;
						case "ognzTotTrmtAmtAvgCmp":
							sumCol = "ognzTotTrmtAmtCmp";
							cntCol = "cntCmp";
							break;
						case "ognzTotTrmtAmtAvg":
							sumCol = "ognzTotTrmtAmt";
							cntCol = "cntApc";
							break;

						case "ognzOgnzSumAvgCoo":
							sumCol = "ognzOgnzSumCoo";
							cntCol = "cntCoo";
							break;
						case "ognzOgnzSumAvgCmp":
							sumCol = "ognzOgnzSumCmp";
							cntCol = "cntCmp";
							break;
						case "ognzOgnzSumAvg":
							sumCol = "ognzOgnzSum";
							cntCol = "cntApc";
							break;
					}

					const sum = parseInt(row[sumCol]) || 0;
					const cnt = parseInt(row[cntCol]) || 0;

					if (cnt <= 0) {
						return 0;
					}

					return (sum / cnt).toFixed(0);
				}
			},
			grandtotalrow : {
				titlecol: 0,
				titlevalue: '합계(평균)',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				1: '#,###',
				2: '#,###',
				3: '#,###',
				4: '#,###',
				5: '#,###',
				6: '#,###',
				7: '#,###',
				8: '#,###',
				9: '#,###',
				10: '#,###',
				11: '#,###',
				12: '#,###',
				13: '#,###',
				14: '#,###',
				15: '#,###'
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'ctpvNm',
				type: 'output',
				width:'13%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
			},
			{
				caption : ["총취급액(평균)","농협"],
				ref: 'ognzTotTrmtAmtAvgCoo',
				type: 'output',
				datatype: 'number',
				width:'13%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["총취급액(평균)","농업법인"],
				ref: 'ognzTotTrmtAmtAvgCmp',
				type: 'output',
				datatype: 'number',
				width:'13%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["총취급액(평균)","합계"],
				ref: 'ognzTotTrmtAmtAvg',
				type: 'output',
				datatype: 'number',
				width:'17.5%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["조직화취급액(평균)","농협"],
				ref: 'ognzOgnzSumAvgCoo',
				type: 'output',
				datatype: 'number',
				width:'13%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["조직화취급액(평균)","농업법인"],
				ref: 'ognzOgnzSumAvgCmp',
				type: 'output',
				datatype: 'number',
				width:'13%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["조직화취급액(평균)","합계"],
				ref: 'ognzOgnzSumAvg',
				type: 'output',
				datatype: 'number',
				width:'17.5%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["총취급액","농협"],
				ref: 'ognzTotTrmtAmtCoo',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden : true
			},
			{
				caption : ["총취급액","농업법인"],
				ref: 'ognzTotTrmtAmtCmp',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden : true
			},
			{
				caption : ["총취급액","합계"],
				ref: 'ognzTotTrmtAmt',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden : true
			},
			{
				caption : ["조직화취급액","농협"],
				ref: 'ognzOgnzSumCoo',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden : true
			},
			{
				caption : ["조직화취급액","농협법인"],
				ref: 'ognzOgnzSumCmp',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden : true
			},
			{
				caption : ["조직화취급액","합계"],
				ref: 'ognzOgnzSum',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden : true
			},
			{
				ref: 'cntApc',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format: {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				ref: 'cntCoo',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format: {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				ref: 'cntCmp',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format: {type:'number', rule:'#,###'},
				hidden: true
			},
		];
		grdGovOperOgnzTrmtAvgByCtpv = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridGovOperOgnzPrcsByCtpv
	 * @description 지역별 운영조직 APC 처리실적 그리드 생성
	 * @function
	 */
	const fn_createGridGovOperOgnzPrcsByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovOperOgnzPrcsByCtpv';
		SBGridProperties.id = 'grdGovOperOgnzPrcsByCtpv';
		SBGridProperties.jsonref = 'jsonGovOperOgnzTrmtByCtpv';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.allowcopy = true;
		SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
				standard: [0],
				sum: [1,2,3,4,5,6,7,8],
			},
			grandtotalrow : {
				titlecol: 0,
				titlevalue: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				1: '#,###',
				2: '#,###',
				3: '#,###',
				4: '#,###',
				5: '#,###',
				6: '#,###',
				7: '#,###',
				8: '#,###'
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'ctpvNm',
				type: 'output',
				width:'12%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
			},
			{
				caption : ["APC취급액","농협"],
				ref: 'apcTrmtAmtCoo',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["APC취급액","농업법인"],
				ref: 'apcTrmtAmtCmp',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["일반취급액","농협"],
				ref: 'apcGnrlTrmtAmtCoo',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["일반취급액","농업법인"],
				ref: 'apcGnrlTrmtAmtCmp',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["공동선별(수탁)","농협"],
				ref: 'apcOgnzCprtnSortTrstCoo',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["공동선별(수탁)","농업법인"],
				ref: 'apcOgnzCprtnSortTrstCmp',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["계약재배(매취)","농협"],
				ref: 'apcCtrtEmspapCoo',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["계약재배(매취)","농업법인"],
				ref: 'apcCtrtEmspapCmp',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
		];
		grdGovOperOgnzPrcsByCtpv = _SBGrid.create(SBGridProperties);
	}
	/**
	 * @name fn_createGridGovOperOgnzPrcsAvgByCtpv
	 * @description 지역별 운영조직 APC 처리실적(평균) 그리드 생성
	 * @function
	 */
	const fn_createGridGovOperOgnzPrcsAvgByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovOperOgnzPrcsAvgByCtpv';
		SBGridProperties.id = 'grdGovOperOgnzPrcsAvgByCtpv';
		SBGridProperties.jsonref = 'jsonGovOperOgnzTrmtByCtpv';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.allowcopy = true;
		SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
				standard: [0],
				//avg: [1,2,3,4,5,6],
				sum: [9,10,11,12,13,14,15,16,17,18,19],
				custom: [1,2,3,4,5,6,7,8],
				customFunc: function(colId, row) {
					let sumCol = "";
					let cntCol = "";
					switch (colId) {
						case "apcTrmtAmtAvgCoo":
							sumCol = "apcTrmtAmtCoo";
							cntCol = "cntCoo";
							break;
						case "apcTrmtAmtAvgCmp":
							sumCol = "apcTrmtAmtCmp";
							cntCol = "cntCmp";
							break;
						case "apcGnrlTrmtAmtAvgCoo":
							sumCol = "apcGnrlTrmtAmtCoo";
							cntCol = "cntCoo";
							break;
						case "apcGnrlTrmtAmtAvgCmp":
							sumCol = "apcGnrlTrmtAmtCmp";
							cntCol = "cntCmp";
							break;
						case "apcOgnzCprtnSortTrstAvgCoo":
							sumCol = "apcOgnzCprtnSortTrstCoo";
							cntCol = "cntCoo";
							break;
						case "apcOgnzCprtnSortTrstAvgCmp":
							sumCol = "apcOgnzCprtnSortTrstCmp";
							cntCol = "cntCmp";
							break;
						case "apcCtrtEmspapAvgCoo":
							sumCol = "apcCtrtEmspapCoo";
							cntCol = "cntCoo";
							break;
						case "apcCtrtEmspapAvgCmp":
							sumCol = "apcCtrtEmspapCmp";
							cntCol = "cntCmp";
							break;
					}

					const sum = parseInt(row[sumCol]) || 0;
					const cnt = parseInt(row[cntCol]) || 0;

					if (cnt <= 0) {
						return 0;
					}

					return (sum / cnt).toFixed(0);
				}
			},
			grandtotalrow : {
				titlecol: 0,
				titlevalue: '합계(평균)',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				1: '#,###',
				2: '#,###',
				3: '#,###',
				4: '#,###',
				5: '#,###',
				6: '#,###',
				7: '#,###',
				8: '#,###',
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'ctpvNm',
				type: 'output',
				width:'12%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
			},
			{
				caption : ["APC취급액","농협"],
				ref: 'apcTrmtAmtAvgCoo',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["APC취급액","농업법인"],
				ref: 'apcTrmtAmtAvgCmp',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["일반취급액","농협"],
				ref: 'apcGnrlTrmtAmtAvgCoo',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["일반취급액","농업법인"],
				ref: 'apcGnrlTrmtAmtAvgCmp',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["공동선별(수탁)","농협"],
				ref: 'apcOgnzCprtnSortTrstAvgCoo',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["공동선별(수탁)","농업법인"],
				ref: 'apcOgnzCprtnSortTrstAvgCmp',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["계약재배(매취)","농협"],
				ref: 'apcCtrtEmspapAvgCoo',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["계약재배(매취)","농업법인"],
				ref: 'apcCtrtEmspapAvgCmp',
				type: 'output',
				datatype: 'number',
				width:'11%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["APC취급액","농협"],
				ref: 'apcTrmtAmtCoo',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format: {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				caption : ["APC취급액","농업법인"],
				ref: 'apcTrmtAmtCmp',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				caption : ["일반취급액","농협"],
				ref: 'apcGnrlTrmtAmtCoo',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				caption : ["일반취급액","농업법인"],
				ref: 'apcGnrlTrmtAmtCmp',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				caption : ["공동선별(수탁)","농협"],
				ref: 'apcOgnzCprtnSortTrstCoo',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				caption : ["공동선별(수탁)","농업법인"],
				ref: 'apcOgnzCprtnSortTrstCmp',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				caption : ["계약재배(매취)","농협"],
				ref: 'apcCtrtEmspapCoo',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				caption : ["계약재배(매취)","농업법인"],
				ref: 'apcCtrtEmspapCmp',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				ref: 'cntApc',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format: {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				ref: 'cntCoo',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format: {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				ref: 'cntCmp',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format: {type:'number', rule:'#,###'},
				hidden: true
			},
		];
		grdGovOperOgnzPrcsAvgByCtpv = _SBGrid.create(SBGridProperties);
	}

</script>
</html>