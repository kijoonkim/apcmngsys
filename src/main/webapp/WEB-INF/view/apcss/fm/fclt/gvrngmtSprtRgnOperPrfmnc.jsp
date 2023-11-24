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
    <title>title : SBUx2.6</title>
</head>
<body>
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-body">
			<div class="row">
			<div class="box-header" style="display:flex; justify-content: flex-start; width: 100%; padding-left:5px;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> 6. 정부지원 지역별 운영실적</h3>
				</div>
			</div>
				<div class="col-sm-6">
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<span style="font-size:15px; color:black;">6.1. 운영조직 취급 및 APC 처리 실적</span>
								<br/>
								<span style="font-size:12px">운영조직 취급실적</span>
								<br/>
								<span style="font-size:11px; text-align: right; display: block; color:black; font-weight: normal;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdGvrngmtSprtOperOgnzTrmtPrfmnc" style="height:187px;"></div>
					<span style="font-size:11px;">*조직화취급액 : 공동선별(수탁) 및 계약재배(매취) 금액</span>
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">산지유통시설 처리실적(평균)</span>
								<br/>
								<span style="font-size:11px; text-align: right; display: block; color:black; font-weight: normal;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdMdRtlFcltPrcsPrfmncAvg" style="height:187px;"></div>
					
					<div style="height: 50px;"></div>
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<span style="font-size:15px; color:black;">6.2. 지역별 운영조직 취급 및 APC 처리 실적</span>
								<br/>
								<span style="font-size:12px">지역별 운영조직 취급실적</span>
								<br/>
								<span style="font-size:11px; text-align: right; display: block; color:black; font-weight: normal;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdRgnOperOgnzTrmtPrfmnc" style="height:337px;"></div>
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">지역별 APC 처리실적</span>
								<br/>
								<span style="font-size:11px; text-align: right; display: block; color:black; font-weight: normal;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdRgnOperOgnzApcPrcsPrfmnc" style="height:337px;"></div>
				</div>
				<div class="col-sm-6">
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">산지유통시설 처리실적</span>
								<br/>
								<span style="font-size:11px; text-align: right; display: block; color:black; font-weight: normal;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdMdRtlFcltPrcsPrfmnc" style="height:187px;"></div>
					
					<div style="height: 317px;"></div>
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">지역별 운영조직 취급실적(평균)</span>
								<br/>
								<span style="font-size:11px; text-align: right; display: block; color:black; font-weight: normal;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdRgnOperOgnzTrmtPrfmncAvg" style="height:337px;"></div>
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">지역별 APC 처리실적(평균)</span>
								<br/>
								<span style="font-size:11px; text-align: right; display: block; color:black; font-weight: normal;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdRgnOperOgnzApcPrcsPrfmncAvg" style="height:337px;"></div>
					
				</div>
			</div>
		</div>
	</div>
	</section>
</body>
<script type="text/javascript">

const fn_cellCreateGvrngmtSprtRgnOperPrfmncGrid = function() {
	// 정부지원 지역별 운영실적 - 운영조직 취급실적
	fn_createGvrngmtSprtOperOgnzTrmtPrfmncGrid();
	// 정부지원 지역별 운영실적 - 산지유통시설 처리실적
	fn_createMdRtlFcltPrcsPrfmncGrid();
	// 정부지원 지역별 운영실적 - 산지유통시설 평균 처리실적(평균)
	fn_createMdRtlFcltPrcsPrfmncAvgGrid();
	// 지역별 운영조직 취급 및 APC 처리 실적 - 지역별 운영조직 취급실적
	fn_createRgnOperOgnzTrmtPrfmncGrid();
	// 지역별 운영조직 취급 및 APC 처리 실적 - 지역별 운영조직 취급실적(평균)
	fn_createRgnOperOgnzTrmtPrfmncAvgGrid();
	// 지역별 APC 처리실적
	fn_createRgnOperOgnzApcPrcsPrfmncGrid();
	// 지역별 APC 처리실적(평균)
	fn_createRgnOperOgnzApcPrcsPrfmncAvgGrid();
	
	fn_cellGvrngmtSprtRgnOperPrfmncGrid();
}


//그리드 id, 그리드 json
// 정부지원 지역별 운영실적 - 운영조직 취급실적
var grdGvrngmtSprtOperOgnzTrmtPrfmnc;
// 정부지원 지역별 운영실적 - 산지유통시설 처리실적
var grdMdRtlFcltPrcsPrfmnc;
// 정부지원 지역별 운영실적 - 산지유통시설 평균 처리실적(평균)
var grdMdRtlFcltPrcsPrfmncAvg;
// 지역별 운영조직 취급 및 APC 처리 실적 - 지역별 운영조직 취급실적
var grdRgnOperOgnzTrmtPrfmnc;
// 지역별 운영조직 취급 및 APC 처리 실적 - 지역별 운영조직 취급실적(평균)
var grdRgnOperOgnzTrmtPrfmncAvg;
// 지역별 운영조직 취급 및 APC 처리 실적 - 지역별 APC 처리실적
var grdRgnOperOgnzApcPrcsPrfmnc;
// 지역별 운영조직 취급 및 APC 처리 실적 - 지역별 APC 처리실적(평균)
var grdRgnOperOgnzApcPrcsPrfmncAvg;


// 정부지원 지역별 운영실적 - 운영조직 취급실적
var jsonGvrngmtSprtOperOgnzTrmtPrfmnc = [];
// 정부지원 지역별 운영실적 - 산지유통시설 처리실적
var jsonMdRtlFcltPrcsPrfmnc = [];
// 정부지원 지역별 운영실적 - 산지유통시설 평균 처리실적(평균)
var jsonMdRtlFcltPrcsPrfmncAvg = [];
// 지역별 운영조직 취급 및 APC 처리 실적 - 지역별 운영조직 취급 및 APC 처리 실적
var jsonRgnOperOgnzTrmtPrfmnc = [];
// 지역별 운영조직 취급 및 APC 처리 실적 - 지역별 운영조직 취급 및 APC 처리 실적(평균)
var jsonRgnOperOgnzTrmtPrfmncAvg = [];
// 지역별 운영조직 취급 및 APC 처리 실적 - 지역별 APC 처리실적
var jsonRgnOperOgnzApcPrcsPrfmnc = [];
// 지역별 운영조직 취급 및 APC 처리 실적 - 지역별 APC 처리실적(평균)
var jsonRgnOperOgnzApcPrcsPrfmncAvg = [];



const fn_createGvrngmtSprtOperOgnzTrmtPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdGvrngmtSprtOperOgnzTrmtPrfmnc';
    SBGridProperties.id = 'grdGvrngmtSprtOperOgnzTrmtPrfmnc';
    SBGridProperties.jsonref = 'jsonGvrngmtSprtOperOgnzTrmtPrfmnc';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'},
    	{caption : ["총취급액","총취급액 "], ref: 'v1', type: 'output',  width:'148px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["총취급액","평균취급액"], ref: 'v2', type: 'output',  width:'148px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","조직화취급액 "], ref: 'v3', type: 'output',  width:'148px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","평균조직화취급액"], ref: 'v4', type: 'output',  width:'148px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdGvrngmtSprtOperOgnzTrmtPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createMdRtlFcltPrcsPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdRtlFcltPrcsPrfmnc';
    SBGridProperties.id = 'grdMdRtlFcltPrcsPrfmnc';
    SBGridProperties.jsonref = 'jsonMdRtlFcltPrcsPrfmnc';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'},
    	{caption : ["APC취급액","APC취급액"], ref: 'v1', type: 'output',  width:'148px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["일반취급액","일반취급액"], ref: 'v2', type: 'output',  width:'148px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","공동선별(수탁) "], ref: 'v3', type: 'output',  width:'148px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","계약재배(매취)"], ref: 'v4', type: 'output',  width:'148px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdMdRtlFcltPrcsPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createMdRtlFcltPrcsPrfmncAvgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdRtlFcltPrcsPrfmncAvg';
    SBGridProperties.id = 'grdMdRtlFcltPrcsPrfmncAvg';
    SBGridProperties.jsonref = 'jsonMdRtlFcltPrcsPrfmncAvg';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'},
    	{caption : ["APC취급액평균","APC취급액평균"], ref: 'v1', type: 'output',  width:'148px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["일반취급액평균","일반취급액평균"], ref: 'v2', type: 'output',  width:'148px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["공동선별평균(수탁)","공동선별평균(수탁)"], ref: 'v3', type: 'output',  width:'148px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["계약재배평균(매취)","계약재배평균(매취)"], ref: 'v4', type: 'output',  width:'148px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdMdRtlFcltPrcsPrfmncAvg = _SBGrid.create(SBGridProperties);
}

const fn_createRgnOperOgnzTrmtPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnOperOgnzTrmtPrfmnc';
    SBGridProperties.id = 'grdRgnOperOgnzTrmtPrfmnc';
    SBGridProperties.jsonref = 'jsonRgnOperOgnzTrmtPrfmnc';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'},
    	{caption : ["총취급액","농협"], ref: 'v1', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["총취급액","농업법인"], ref: 'v2', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["총취급액","합계"], ref: 'v3', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","농협"], ref: 'v4', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","농업법인"], ref: 'v5', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","합계"], ref: 'v6', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdRgnOperOgnzTrmtPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createRgnOperOgnzTrmtPrfmncAvgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnOperOgnzTrmtPrfmncAvg';
    SBGridProperties.id = 'grdRgnOperOgnzTrmtPrfmncAvg';
    SBGridProperties.jsonref = 'jsonRgnOperOgnzTrmtPrfmncAvg';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'},
    	{caption : ["평균취급액","농협"], ref: 'v1', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균취급액","농업법인"], ref: 'v2', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균취급액","합계"], ref: 'v3', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균조직화금액","농협"], ref: 'v4', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균조직화금액","농업법인"], ref: 'v5', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균조직화금액","합계"], ref: 'v6', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdRgnOperOgnzTrmtPrfmncAvg = _SBGrid.create(SBGridProperties);
}

const fn_createRgnOperOgnzApcPrcsPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnOperOgnzApcPrcsPrfmnc';
    SBGridProperties.id = 'grdRgnOperOgnzApcPrcsPrfmnc';
    SBGridProperties.jsonref = 'jsonRgnOperOgnzApcPrcsPrfmnc';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'},
    	{caption : ["총취급액","농협"], ref: 'v1', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["총취급액","농업법인"], ref: 'v2', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["총취급액","합계"], ref: 'v3', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","농협"], ref: 'v4', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","농업법인"], ref: 'v5', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","합계"], ref: 'v6', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdRgnOperOgnzApcPrcsPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createRgnOperOgnzApcPrcsPrfmncAvgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnOperOgnzApcPrcsPrfmncAvg';
    SBGridProperties.id = 'grdRgnOperOgnzApcPrcsPrfmncAvg';
    SBGridProperties.jsonref = 'jsonRgnOperOgnzApcPrcsPrfmncAvg';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'200px', style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'},
    	{caption : ["평균취급액","농협"], ref: 'v1', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균취급액","농업법인"], ref: 'v2', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균취급액","합계"], ref: 'v3', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균조직화금액","농협"], ref: 'v4', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균조직화금액","농업법인"], ref: 'v5', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균조직화금액","합계"], ref: 'v6', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdRgnOperOgnzApcPrcsPrfmncAvg = _SBGrid.create(SBGridProperties);
}

const fn_cellGvrngmtSprtRgnOperPrfmncGrid = async function() {
	let crtrYr = SBUxMethod.get("srch-slt-crtrYr");
	
	const postJsonPromise = gfn_postJSON("/fm/fclt/selectGvrngmtSprtRgnOperPrfmncGridList.do", {crtrYr : crtrYr});
	
	let data = await postJsonPromise;
	try {
		
		gvrngmtSprtRgnOperPrfmncJsonLengthReset();
		
	  	data.resultGvrngmtSprtOperOgnzTrmtPrfmnc.forEach((item, index) => {
	  		const gvrngmtSprtOperOgnzTrmtPrfmnc = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4
			}
	  		jsonGvrngmtSprtOperOgnzTrmtPrfmnc.push(gvrngmtSprtOperOgnzTrmtPrfmnc);
	  	});
	  	data.resultMdRtlFcltPrcsPrfmnc.forEach((item, index) => {
	  		const mdRtlFcltPrcsPrfmnc = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4
			}
	  		jsonMdRtlFcltPrcsPrfmnc.push(mdRtlFcltPrcsPrfmnc);
	  	});
	  	data.resultMdRtlFcltPrcsPrfmncAvg.forEach((item, index) => {
	  		const mdRtlFcltPrcsPrfmncAvg = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4
			}
	  		jsonMdRtlFcltPrcsPrfmncAvg.push(mdRtlFcltPrcsPrfmncAvg);
	  	});
	  	
	  	data.resultRgnOperOgnzTrmtPrfmnc.forEach((item, index) => {
	  		const rgnOperOgnzTrmtPrfmnc = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6
			}
	  		jsonRgnOperOgnzTrmtPrfmnc.push(rgnOperOgnzTrmtPrfmnc);
	  	});
	  	data.resultRgnOperOgnzTrmtPrfmncAvg.forEach((item, index) => {
	  		const rgnOperOgnzTrmtPrfmncAvg = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6
			}
	  		jsonRgnOperOgnzTrmtPrfmncAvg.push(rgnOperOgnzTrmtPrfmncAvg);
	  	});
	  	data.resultRgnOperOgnzApcPrcsPrfmnc.forEach((item, index) => {
	  		const rgnOperOgnzApcPrcsPrfmnc = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6
			}
	  		jsonRgnOperOgnzApcPrcsPrfmnc.push(rgnOperOgnzApcPrcsPrfmnc);
	  	});
	  	data.resultRgnOperOgnzApcPrcsPrfmncAvg.forEach((item, index) => {
	  		const rgnOperOgnzApcPrcsPrfmncAvg = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6
			}
	  		jsonRgnOperOgnzApcPrcsPrfmncAvg.push(rgnOperOgnzApcPrcsPrfmncAvg);
	  	});
	  	
	  	gvrngmtSprtRgnOperPrfmncRebuild();
	  		
	  }	catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
	  return true;
}

const gvrngmtSprtRgnOperPrfmncJsonLengthReset = function() {
	jsonGvrngmtSprtOperOgnzTrmtPrfmnc.length = 0;
	jsonMdRtlFcltPrcsPrfmnc.length = 0;
	jsonMdRtlFcltPrcsPrfmncAvg.length = 0;
	jsonRgnOperOgnzTrmtPrfmnc.length = 0;
	jsonRgnOperOgnzTrmtPrfmncAvg.length = 0;
	jsonRgnOperOgnzApcPrcsPrfmnc.length = 0;
	jsonRgnOperOgnzApcPrcsPrfmncAvg.length = 0;
}

const gvrngmtSprtRgnOperPrfmncRebuild = function() {
	grdGvrngmtSprtOperOgnzTrmtPrfmnc.rebuild();
	grdMdRtlFcltPrcsPrfmnc.rebuild();
	grdMdRtlFcltPrcsPrfmncAvg.rebuild();
	grdRgnOperOgnzTrmtPrfmnc.rebuild();
	grdRgnOperOgnzTrmtPrfmncAvg.rebuild();
	grdRgnOperOgnzApcPrcsPrfmnc.rebuild();
	grdRgnOperOgnzApcPrcsPrfmncAvg.rebuild();
}
</script>
</html>