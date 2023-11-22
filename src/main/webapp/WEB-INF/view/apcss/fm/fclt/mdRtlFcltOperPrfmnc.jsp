
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
			<div class="box-header" style="display:flex; justify-content: flex-start; width: 100%; padding-left:5px;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> 5. 산지유통시설 운영실적</h3>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<span style="font-size:15px; color:black;">5.1. 운영조직 취급 및 APC 처리 실적</span>
							<br/>
							<span style="font-size:12px">운영조직 취급실적</span>
							<br/>
							<span style="font-size:11px; text-align: right; display: block; color:black; font-weight: normal;">(단위:백만원)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdOperOgnzTrmtPrfmnc" style="height:187px;"></div>
				<span style="font-size:11px;">*조직화취급액 : 공동선별(수탁) 및 계약재배(매취) 금액</span>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">산지유통시설 평균 처리실적</span>
							<br/>
							<span style="font-size:11px; text-align: right; display: block; color:black; font-weight: normal;">(단위:백만원)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdOperOgnzAvgTrmtPrfmnc" style="height:187px;"></div>
				
				<div style="height: 50px;"></div>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<span style="font-size:15px; color:black;">5.2. 지역별 운영조직 취급 및 APC 처리 실적</span>
							<br/>
							<span style="font-size:12px">지역별 운영조직 취급실적</span>
							<br/>
							<span style="font-size:11px; text-align: right; display: block; color:black; font-weight: normal;">(단위:백만원)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdMdOperOgnzTrmtPrfmnc" style="height:312px;"></div>
				
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
				<div id="sb-area-grdMdApcPrcsPrfmnc" style="height:312px;"></div>
			</div>
			
			<div class="col-sm-6">
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">운영조직 처리실적</span>
							<br/>
							<span style="font-size:11px; text-align: right; display: block; color:black; font-weight: normal;">(단위:백만원)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdOperOgnzPrcsPrfmnc" style="height:187px;"></div>
				
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
				<div id="sb-area-grdMdOperOgnzTrmtPrfmncAvg" style="height:312px;"></div>		
				
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
				<div id="sb-area-grdMdApcPrcsPrfmncAvg" style="height:312px;"></div>
			</div>
		</div>
	</div>
	</section>
</body>
<script type="text/javascript">

const fn_cellCreateMdRtlFcltOperPrfmncGrid = function() {
	// 운영조직 취급실적
	fn_createOperOgnzTrmtPrfmncGrid();
	// 운영조직 처리실적
	fn_createOperOgnzPrcsPrfmncGrid();
	// 운영조직 평균 처리실적
	fn_createOperOgnzAvgTrmtPrfmncGrid();
	// 지역별 운영조직 취급실적
	fn_createMdOperOgnzTrmtPrfmncGrid();
	// 지역별 운영조직 취급실적(평균)
	fn_createMdOperOgnzTrmtPrfmncAvgGrid();
	// 지역별 APC 처리실적
	fn_createMdApcPrcsPrfmncGrid();
	// 지역별 APC 처리실적(평균)
	fn_createMdApcPrcsPrfmncAvgGrid();
	
	fn_cellMdRtlFcltOperPrfmncGrid();
}

//그리드 id, 그리드 json
// 운영조직 취급실적
var grdOperOgnzTrmtPrfmnc;
// 운영조직 처리실적
var grdOperOgnzPrcsPrfmnc;
// 운영조직 평균 취급실적
var grdOperOgnzAvgTrmtPrfmnc;
// 지역별 운영조직 취급실적
var grdMdOperOgnzTrmtPrfmnc;
// 지역별 운영조직 취급실적(평균)
var grdMdOperOgnzTrmtPrfmncAvg;
// 지역별 APC 처리실적
var grdMdApcPrcsPrfmnc;
// 지역별 APC 처리실적(평균)
var grdMdApcPrcsPrfmncAvg;

// 운영조직 취급실적
var jsonOperOgnzTrmtPrfmnc = [];
// 운영조직 처리실적
var jsonOperOgnzPrcsPrfmnc = [];
// 운영조직 평균 취급실적
var jsonOperOgnzAvgTrmtPrfmnc = [];
// 지역별 운영조직 취급실적
var jsonMdOperOgnzTrmtPrfmnc = [];
// 지역별 운영조직 취급실적(평균)
var jsonMdOperOgnzTrmtPrfmncAvg = [];
// 지역별 APC 처리실적
var jsonMdApcPrcsPrfmnc = [];
// 지역별 APC 처리실적(평균)
var jsonMdApcPrcsPrfmncAvg = [];



const fn_createOperOgnzTrmtPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdOperOgnzTrmtPrfmnc';
    SBGridProperties.id = 'grdOperOgnzTrmtPrfmnc';
    SBGridProperties.jsonref = 'jsonOperOgnzTrmtPrfmnc';
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
    	{caption : ["총취급액"," 총취급액 "], ref: 'v1', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["총취급액","평균취급액"], ref: 'v2', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액"," 조직화취급액 "], ref: 'v3', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","평균조직화취급액"], ref: 'v4', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    ];
    grdOperOgnzTrmtPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createOperOgnzPrcsPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdOperOgnzPrcsPrfmnc';
    SBGridProperties.id = 'grdOperOgnzPrcsPrfmnc';
    SBGridProperties.jsonref = 'jsonOperOgnzPrcsPrfmnc';
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
    	{caption : ["APC 취급액","APC 취급액"], ref: 'v1', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["일반취급액","일반취급액"], ref: 'v2', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","공동선별(수탁)"], ref: 'v3', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","계약재배(매취)"], ref: 'v4', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdOperOgnzPrcsPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createOperOgnzAvgTrmtPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdOperOgnzAvgTrmtPrfmnc';
    SBGridProperties.id = 'grdOperOgnzAvgTrmtPrfmnc';
    SBGridProperties.jsonref = 'jsonOperOgnzAvgTrmtPrfmnc';
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
    	{caption : ["APC 평균 취급액"," APC 평균 취급액 "], ref: 'v1', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균 일반취급액","평균 일반취급액"], ref: 'v2', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균 조직화취급액"," 공동선별(수탁) "], ref: 'v3', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균 조직화취급액","계약재배(매취)"], ref: 'v4', type: 'output',  width:'150px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    ];
    grdOperOgnzAvgTrmtPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createMdOperOgnzTrmtPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdOperOgnzTrmtPrfmnc';
    SBGridProperties.id = 'grdMdOperOgnzTrmtPrfmnc';
    SBGridProperties.jsonref = 'jsonMdOperOgnzTrmtPrfmnc';
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
    	{caption : ["조직화취급액"," 농협 "], ref: 'v4', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","농협법인"], ref: 'v5', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","합계"], ref: 'v6', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdMdOperOgnzTrmtPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createMdOperOgnzTrmtPrfmncAvgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdOperOgnzTrmtPrfmncAvg';
    SBGridProperties.id = 'grdMdOperOgnzTrmtPrfmncAvg';
    SBGridProperties.jsonref = 'jsonMdOperOgnzTrmtPrfmncAvg';
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
    grdMdOperOgnzTrmtPrfmncAvg = _SBGrid.create(SBGridProperties);
}

const fn_createMdApcPrcsPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdApcPrcsPrfmnc';
    SBGridProperties.id = 'grdMdApcPrcsPrfmnc';
    SBGridProperties.jsonref = 'jsonMdApcPrcsPrfmnc';
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
    	{caption : ["총취급액","전체"], ref: 'v3', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","농협"], ref: 'v4', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","농업법인"], ref: 'v5', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["조직화취급액","합계"], ref: 'v6', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdMdApcPrcsPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createMdApcPrcsPrfmncAvgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdApcPrcsPrfmncAvg';
    SBGridProperties.id = 'grdMdApcPrcsPrfmncAvg';
    SBGridProperties.jsonref = 'jsonMdApcPrcsPrfmncAvg';
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
    grdMdApcPrcsPrfmncAvg = _SBGrid.create(SBGridProperties);
}

const fn_cellMdRtlFcltOperPrfmncGrid = async function() {
	let crtrYr = SBUxMethod.get("srch-slt-crtrYr");
	
	const postJsonPromise = gfn_postJSON("/fm/fclt/selectMdRtlFcltOperPrfmncGridList.do", {crtrYr : crtrYr});
	
	let data = await postJsonPromise;
	try {
		
		mdRtlFcltOperPrfmncJsonLengthReset();
		
	  	data.resultOperOgnzTrmtPrfmnc.forEach((item, index) => {
	  		const operOgnzTrmtPrfmnc = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4
			}
	  		jsonOperOgnzTrmtPrfmnc.push(operOgnzTrmtPrfmnc);
	  	});
	  	data.resultOperOgnzPrcsPrfmnc.forEach((item, index) => {
	  		const operOgnzPrcsPrfmnc = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4
			}
	  		jsonOperOgnzPrcsPrfmnc.push(operOgnzPrcsPrfmnc);
	  	});
	  	data.resultOperOgnzAvgTrmtPrfmnc.forEach((item, index) => {
	  		const operOgnzAvgTrmtPrfmnc = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4
			}
	  		jsonOperOgnzAvgTrmtPrfmnc.push(operOgnzAvgTrmtPrfmnc);
	  	});
	  	data.resultMdOperOgnzTrmtPrfmnc.forEach((item, index) => {
	  		const mdOperOgnzTrmtPrfmnc = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6
			}
	  		jsonMdOperOgnzTrmtPrfmnc.push(mdOperOgnzTrmtPrfmnc);
	  	});
	  	data.resultMdOperOgnzTrmtPrfmncAvg.forEach((item, index) => {
	  		const mdOperOgnzTrmtPrfmncAvg = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6
			}
	  		jsonMdOperOgnzTrmtPrfmncAvg.push(mdOperOgnzTrmtPrfmncAvg);
	  	});
	  	data.resultMdApcPrcsPrfmnc.forEach((item, index) => {
	  		const mdApcPrcsPrfmnc = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6
			}
	  		jsonMdApcPrcsPrfmnc.push(mdApcPrcsPrfmnc);
	  	});
	  	data.resultMdApcPrcsPrfmncAvg.forEach((item, index) => {
	  		const mdApcPrcsPrfmncAvg = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6
			}
	  		jsonMdApcPrcsPrfmncAvg.push(mdApcPrcsPrfmncAvg);
	  	});
	  	
	  	mdRtlFcltOperPrfmncRebuild();
	  		
	  }	catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
	  return true;
}

const mdRtlFcltOperPrfmncJsonLengthReset = function() {
	jsonOperOgnzTrmtPrfmnc.length = 0;
	jsonOperOgnzPrcsPrfmnc.length = 0;
	jsonOperOgnzAvgTrmtPrfmnc.length = 0;
	jsonMdOperOgnzTrmtPrfmnc.length = 0;
	jsonMdOperOgnzTrmtPrfmncAvg.length = 0;
	jsonMdApcPrcsPrfmnc.length = 0;
	jsonMdApcPrcsPrfmncAvg.length = 0;
}

const mdRtlFcltOperPrfmncRebuild = function() {
	grdOperOgnzTrmtPrfmnc.rebuild();
	grdOperOgnzPrcsPrfmnc.rebuild();
	grdOperOgnzAvgTrmtPrfmnc.rebuild();
	grdMdOperOgnzTrmtPrfmnc.rebuild();
	grdMdOperOgnzTrmtPrfmncAvg.rebuild();
	grdMdApcPrcsPrfmnc.rebuild();
	grdMdApcPrcsPrfmncAvg.rebuild();
}
</script>
</html>