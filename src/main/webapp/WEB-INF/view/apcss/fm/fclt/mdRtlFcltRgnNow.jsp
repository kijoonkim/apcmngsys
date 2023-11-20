
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
			<div class="box-header" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> 2. 산지유통시설 지역별 현황</h3>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<span style="font-size:15px; color:black;">2.1. 산지유통시설 개소수</span>
							<br/>
							<span style="font-size:12px">지역별 개소수 : 산지유통조직 유형</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdMdRtlOgnzType" style="height:313px;"></div>
				
				<div style="height: 50px"></div>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<span style="font-size:15px; color:black;">2.2. 산지우통시설 시설·장비</span>
							<br/>
							<span style="font-size:12px">물류·상품화 시설</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,m²)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdLgstcsGdsFclt" style="height:314px; margin-bottom: 60px"></div>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">예냉시설</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,m²)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdRgnPrprtnClngFclt" style="height:312px;"></div>
				<span style="font-size:8px;">*예냉시설:  수확 후 또는 운송 이전에 농산물의 품온을 짧은 시간 내에 적정온도로 냉각하는 시설</span>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">선별기·측정장비 설치 개소 수</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,m²)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdRgnFcltMsrmtEqpmnt" style="height:313px;"></div>
				<span style="font-size:8px;">*선별기 : 선별(grading&sorting)시설 본체</span>
				<br/>
				<span style="font-size:8px;">*측정장비 : 당도•색택•내부손상 등 세부 품질 측정장비(선별기에 부착)</span>
				<br/>
				<span style="font-size:8px;">*반가공시설 : 신선편의처리, 마늘건조, 깐마늘, 고추건조 등</span>
				
			</div>
			<div style="height: 1px"></div>
			<div class="col-sm-6">
				<div class="ad_tbl_top" style="margin-bottom: 30px; width: 100%;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">지역별 개소수 : 운영자</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdRgnOperPrsn" style="height:313px;"></div>
				
				<div style="height: 50px"></div>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">저온저장고</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,m²)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdMdLwtpStrg" style="height:313px;"></div>
				
				
				<span style="font-size:8px;">*물류·상품화 시설: 집출하, 선별, 포장, 신선편의, 반가공 등 처리시설</span>
				<br/>
				<span style="font-size:8px;">*전체면적: APC 전체 물류 및 상품화 시설</span>
				<br/>
				<span style="font-size:8px;">*평균면적: APC 개소당 물류 및 상품화 시설</span>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">CA 저장고</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,m²)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdRgnStrgFclt" style="height:313px;"></div>
				<span style="font-size:8px;">*CA저장 시설 : Controlled Atmosphere Storage(기체조절 저장고)로 장기저장 과일의 신선도 유지 시설</span>
				
				<div style="height: 500px"></div>
				
			</div>
			<div class="col-sm-6">
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<span style="font-size:15px; color:black;">2.3. 지역별 투자금액</span>
							<br/>
							<span style="font-size:12px">지역별 투자금액 전체</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소, 백만원)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdRgnInvstAtmAll" style="height:313px;"></div>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">지역별 투자금액 : 운영자</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,백만원)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdRgnInvstOperPrsn" style="height:313px;"></div>
			</div>
			<div class="col-sm-6">
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">지역별 투자금액 : 소유자</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소, 백만원)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdRgnInvstAtmOwnr" style="height:313px;"></div>
			</div>
		</div>
	</div>
	</section>
</body>
<script type="text/javascript">

window.addEventListener('DOMContentLoaded', function(e) {
	// 지역별 개소수 : 산지유통조직 유형	
	fn_createMdRtlOgnzTypeGrid();
	// 지역별 개소수 : 운영자
	fn_createRgnOperPrsnGrid();
	// 물류·상품화 시설
	fn_createLgstcsGdsFcltGrid();
	// 산지유통시설 - 저온저장고
	fn_createMdLwtpStrgGrid();
	// 산지유통시설 - 예냉시설
	fn_createRgnPrprtnClngFcltGrid();
	// 산지유통시설 - CA 저장시설
	fn_createRgnStrgFcltGrid();
	// 산지유통시설 - 선별기·측정장비 설치 개소 수
	fn_createRgnFcltMsrmtEqpmntGrid();
	// 지역별 투자금액 - 지역별 투자금액 전체
	fn_createRgnInvstAtmAllGrid();
	// 지역별 투자금액 - 지역별 투자금액 : 소유자
	fn_createRgnInvstAtmOwnrGrid();
	// 지역별 투자금액 - 지역별 투자금액 : 운영자
	fn_createRgnInvstAtmOperPrsnGrid();
});
//그리드 id, 그리드 json

//지역별 개소수 : 산지유통조직 유형
var grdMdRtlOgnzType;
//지역별 개소수 : 운영자
var grdRgnOperPrsn;
//물류·상품화 시설
var grdLgstcsGdsFclt;
//산지유통시설 - 저온저장고
var grdMdLwtpStrg;
//산지유통시설 - 예냉시설
var grdRgnPrprtnClngFclt;
//산지유통시설 - CA 저장시설
var grdRgnStrgFclt;
//산지유통시설 - 선별기·측정장비 설치 개소 수
var grdRgnFcltMsrmtEqpmnt;
//지역별 투자금액 - 지역별 투자금액 전체
var grdRgnInvstAtmAll;
//지역별 투자금액 - 지역별 투자금액 : 소유자
var grdRgnInvstAtmOwnr;
//지역별 투자금액 - 지역별 투자금액 : 운영자
var grdRgnInvstOperPrsn;


// 지역별 개소수 : 산지유통조직 유형
var jsonMdRtlOgnzType = [];
// 지역별 개소수 : 운영자
var jsonRgnOperPrsn = [];
// 물류·상품화 시설
var jsonLgstcsGdsFclt = [];
// 산지유통시설 - 저온저장고
var jsonMdLwtpStrg = [];
// 산지유통시설 - 예냉시설
var jsonRgnPrprtnClngFclt = [];
// 산지유통시설 - CA 저장시설
var jsonRgnStrgFclt = [];
// 산지유통시설 - 선별기·측정장비 설치 개소 수
var jsonRgnFcltMsrmtEqpmnt = [];
// 지역별 투자금액 - 지역별 투자금액 전체
var jsonRgnInvstAtmAll = [];
// 지역별 투자금액 - 지역별 투자금액 : 소유자
var jsonRgnInvstAtmOwnr = [];
// 지역별 투자금액 - 지역별 투자금액 : 운영자
var jsonRgnInvstOperPrsn = [];




const fn_createMdRtlOgnzTypeGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdRtlOgnzType';
    SBGridProperties.id = 'grdMdRtlOgnzType';
    SBGridProperties.jsonref = 'jsonMdRtlOgnzType';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
			standard: [0],
			sum: [1,2,3,4,5,6,7],
		},
		grandtotalrow : {
			titlecol: 0,
			titlevalue: '합계',
			style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
			stylestartcol: 1
		},
		totalformat: {
			1: '#,###',
			2: '#,###',
			3: '#,###',
			4: '#,###',
			5: '#,###',
			6: '#,###',
			7: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["통합조직 운영 APC","민간"], ref: 'v1', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["통합조직 운영 APC","공공"], ref: 'v2', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["개발조직 운영 APC","민간"], ref: 'v3', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["개발조직 운영 APC","공공"], ref: 'v4', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["소 개","민간"], ref: 'v5', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["소 개","공공"], ref: 'v6', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["합계","합계"], ref: 'v7', type: 'output',  width:'190px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdMdRtlOgnzType = _SBGrid.create(SBGridProperties);
}

const fn_createRgnOperPrsnGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnOperPrsn';
    SBGridProperties.id = 'grdRgnOperPrsn';
    SBGridProperties.jsonref = 'jsonRgnOperPrsn';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
			standard: [0],
			sum: [1,2,3,4,5,6,7],
		},
		grandtotalrow : {
			titlecol: 0,
			titlevalue: '합계',
			style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
			stylestartcol: 1
		},
		totalformat: {
			1: '#,###',
			2: '#,###',
			3: '#,###',
			4: '#,###',
			5: '#,###',
			6: '#,###',
			7: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["통합조직 운영 APC","농 협"], ref: 'v1', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["통합조직 운영 APC","농업법인"], ref: 'v2', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["개발조직 운영 APC","농 협"], ref: 'v3', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["개발조직 운영 APC","농업법인"], ref: 'v4', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["소 개","농 협"], ref: 'v5', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["소 개","농업법인"], ref: 'v6', type: 'output',  width:'100px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["합계","합계"], ref: 'v7', type: 'output',  width:'190px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdRgnOperPrsn = _SBGrid.create(SBGridProperties);
}

const fn_createLgstcsGdsFcltGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdLgstcsGdsFclt';
    SBGridProperties.id = 'grdLgstcsGdsFclt';
    SBGridProperties.jsonref = 'jsonLgstcsGdsFclt';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
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
			stylestartcol: 1
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["통합조직 운영 APC","전체면적"], ref: 'v1', type: 'output',  width:'105px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["통합조직 운영 APC","평균면적"], ref: 'v2', type: 'output',  width:'105px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["개발조직 운영 APC","전체면적"], ref: 'v3', type: 'output',  width:'105px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["개발조직 운영 APC","평균면적"], ref: 'v4', type: 'output',  width:'105px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["전체","전체면적"], ref: 'v5', type: 'output',  width:'140px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["전체","평균면적"], ref: 'v6', type: 'output',  width:'140px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdLgstcsGdsFclt = _SBGrid.create(SBGridProperties);
}

const fn_createMdLwtpStrgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdLwtpStrg';
    SBGridProperties.id = 'grdMdLwtpStrg';
    SBGridProperties.jsonref = 'jsonMdLwtpStrg';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
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
			stylestartcol: 1
		},
		totalformat: {
			1: '#,###',
			2: '#,###',
			3: '#,###',
			4: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["설치현황","전체 개소수"], ref: 'v1', type: 'output',  width:'175px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["설치현황","설치 개소수"], ref: 'v2', type: 'output',  width:'175px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["저온저장시(면적)","전체면적"], ref: 'v3', type: 'output',  width:'175px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["저온저장시(면적)","평균면적"], ref: 'v4', type: 'output',  width:'175px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdMdLwtpStrg = _SBGrid.create(SBGridProperties);
}

const fn_createRgnPrprtnClngFcltGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnPrprtnClngFclt';
    SBGridProperties.id = 'grdRgnPrprtnClngFclt';
    SBGridProperties.jsonref = 'jsonRgnPrprtnClngFclt';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
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
			stylestartcol: 1
		},
		totalformat: {
			1: '#,###',
			2: '#,###',
			3: '#,###',
			4: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["설치현황","전체 개소수"], ref: 'v1', type: 'output',  width:'175px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["설치현황","설치 개소수"], ref: 'v2', type: 'output',  width:'175px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["예냉시설(면적)","전체면적"], ref: 'v3', type: 'output',  width:'175px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["예냉시설(면적)","평균면적"], ref: 'v4', type: 'output',  width:'175px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdRgnPrprtnClngFclt = _SBGrid.create(SBGridProperties);
}

const fn_createRgnStrgFcltGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnStrgFclt';
    SBGridProperties.id = 'grdRgnStrgFclt';
    SBGridProperties.jsonref = 'jsonRgnStrgFclt';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
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
			stylestartcol: 1
		},
		totalformat: {
			1: '#,###',
			2: '#,###',
			3: '#,###',
			4: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["설치현황","전체 개소수"], ref: 'v1', type: 'output',  width:'175px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["설치현황","설치 개소수"], ref: 'v2', type: 'output',  width:'175px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["예냉시설(면적)","전체면적"], ref: 'v3', type: 'output',  width:'175px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["예냉시설(면적)","평균면적"], ref: 'v4', type: 'output',  width:'175px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdRgnStrgFclt = _SBGrid.create(SBGridProperties);
}

const fn_createRgnFcltMsrmtEqpmntGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnFcltMsrmtEqpmnt';
    SBGridProperties.id = 'grdRgnFcltMsrmtEqpmnt';
    SBGridProperties.jsonref = 'jsonRgnFcltMsrmtEqpmnt';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
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
			stylestartcol: 1
		},
		totalformat: {
			1: '#,###',
			2: '#,###',
			3: '#,###',
			4: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'120px', style: 'text-align:center'},
    	{caption : ["전체 개소수","전체 개소수"], ref: 'v1', type: 'output',  width:'160px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["설치 개소수","설치 개소수"], ref: 'v2', type: 'output',  width:'160px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["설치 면적","설치 면적"], ref: 'v3', type: 'output',  width:'160px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균 면적","평균 면적"], ref: 'v4', type: 'output',  width:'160px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdRgnFcltMsrmtEqpmnt = _SBGrid.create(SBGridProperties);
}

const fn_createRgnInvstAtmAllGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnInvstAtmAll';
    SBGridProperties.id = 'grdRgnInvstAtmAll';
    SBGridProperties.jsonref = 'jsonRgnInvstAtmAll';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
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
			stylestartcol: 1
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["개소수","개소수"], ref: 'v1', type: 'output',  width:'105px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["투자금액","국비"], ref: 'v2', type: 'output',  width:'105px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["투자금액","지방비"], ref: 'v3', type: 'output',  width:'105px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["투자금액","자부담"], ref: 'v4', type: 'output',  width:'105px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["투자금액","계"], ref: 'v5', type: 'output',  width:'105px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균투자금액","평균투자금액"], ref: 'v6', type: 'output',  width:'105px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdRgnInvstAtmAll = _SBGrid.create(SBGridProperties);
}

const fn_createRgnInvstAtmOwnrGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnInvstAtmOwnr';
    SBGridProperties.id = 'grdRgnInvstAtmOwnr';
    SBGridProperties.jsonref = 'jsonRgnInvstAtmOwnr';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
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
			stylestartcol: 1
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["민간 APC","개소 수"], ref: 'v1', type: 'output',  width:'115px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["민간 APC","투자금액"], ref: 'v2', type: 'output',  width:'115px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["민간 APC","평균투자액"], ref: 'v3', type: 'output',  width:'115px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["공공 APC","개소 수"], ref: 'v4', type: 'output',  width:'115px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["공공 APC","투자금액"], ref: 'v5', type: 'output',  width:'115px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["공공 APC","평균투자액"], ref: 'v6', type: 'output',  width:'115px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdRgnInvstAtmOwnr = _SBGrid.create(SBGridProperties);
}

const fn_createRgnInvstAtmOperPrsnGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnInvstOperPrsn';
    SBGridProperties.id = 'grdRgnInvstOperPrsn';
    SBGridProperties.jsonref = 'jsonRgnInvstOperPrsn';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
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
			stylestartcol: 1
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농 협","개소 수"], ref: 'v1', type: 'output',  width:'115px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["농 협","투자금액"], ref: 'v2', type: 'output',  width:'115px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["농 협","개소 수"], ref: 'v3', type: 'output',  width:'115px', style: 'text-align:right; padding-right:5px;', merge: false, format : {type:'number', rule:'#,###'}},
    	{caption : ["농업법인"," 개소 수 "], ref: 'v4', type: 'output',  width:'115px', style: 'text-align:right; padding-right:5px;', merge: false, format : {type:'number', rule:'#,###'}},
    	{caption : ["농업법인","투자금액"], ref: 'v5', type: 'output',  width:'115px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}},
    	{caption : ["농업법인","평균투자액"], ref: 'v6', type: 'output',  width:'115px', style: 'text-align:right; padding-right:5px;', format : {type:'number', rule:'#,###'}}
    ];
    grdRgnInvstOperPrsn = _SBGrid.create(SBGridProperties);
}

const fn_cellMdRtlFcltRgnNowGrid = async function() {
	
	const postJsonPromise = gfn_postJSON("/fm/fclt/selectMdRtlFcltRgnNowGridList.do", {crtrYn : "2023"});
	
	let data = await postJsonPromise;
	try {
		
		mdRtlFcltRgnNowJsonLengthReset();
		
	  	data.resultMdRtlOgnzType.forEach((item, index) => {
	  		const mdRtlOgnzType = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6,
	  				  v7 : item.v7
			}
	  		jsonMdRtlOgnzType.push(mdRtlOgnzType);
	  	});
	  	data.resultRgnOperPrsn.forEach((item, index) => {
	  		const rgnOperPrsn = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6,
	  				  v7 : item.v7
			}
	  		jsonRgnOperPrsn.push(rgnOperPrsn);
	  	});
	  	data.resultLgstcsGdsFclt.forEach((item, index) => {
	  		const lgstcsGdsFclt = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6,
	  				  v7 : item.v7
			}
	  		jsonLgstcsGdsFclt.push(lgstcsGdsFclt);
	  	});
	  	data.resultMdLwtpStrg.forEach((item, index) => {
	  		const mdLwtpStrg = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4
			}
	  		jsonMdLwtpStrg.push(mdLwtpStrg);
	  	});
	  	data.resultRgnPrprtnClngFclt.forEach((item, index) => {
	  		const rgnPrprtnClngFclt = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4
			}
	  		jsonRgnPrprtnClngFclt.push(rgnPrprtnClngFclt);
	  	});
	  	data.resultRgnStrgFclt.forEach((item, index) => {
	  		const rgnStrgFclt = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4
			}
	  		jsonRgnStrgFclt.push(rgnStrgFclt);
	  	});
	  	data.resultRgnFcltMsrmtEqpmnt.forEach((item, index) => {
	  		const rgnFcltMsrmtEqpmnt = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4
			}
	  		jsonRgnFcltMsrmtEqpmnt.push(rgnFcltMsrmtEqpmnt);
	  	});
	  	data.resultRgnInvstAtmAll.forEach((item, index) => {
	  		const rgnInvstAtmAll = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6
			}
	  		jsonRgnInvstAtmAll.push(rgnInvstAtmAll);
	  	});
	  	data.resultRgnInvstAtmOwnr.forEach((item, index) => {
	  		const rgnInvstAtmOwnr = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6
			}
	  		jsonRgnInvstAtmOwnr.push(rgnInvstAtmOwnr);
	  	});
	  	data.resultRgnInvstOperPrsn.forEach((item, index) => {
	  		const rgnInvstOperPrsn = {
	  				  v0 : item.v0,
	  				  v1 : item.v1,
	  				  v2 : item.v2,
	  				  v3 : item.v3,
	  				  v4 : item.v4,
	  				  v5 : item.v5,
	  				  v6 : item.v6
			}
	  		jsonRgnInvstOperPrsn.push(rgnInvstOperPrsn);
	  	});
	  	
	  	mdRtlFcltRgnNowGridRebuild();
	  		
	  }	catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
	  return true;
}

const mdRtlFcltRgnNowJsonLengthReset = function() {
	jsonMdRtlOgnzType.length = 0;
	jsonRgnOperPrsn.length = 0;
	jsonLgstcsGdsFclt.length = 0;
	jsonMdLwtpStrg.length = 0;
	jsonRgnPrprtnClngFclt.length = 0;
	jsonRgnStrgFclt.length = 0;
	jsonRgnFcltMsrmtEqpmnt.length = 0;
	jsonRgnInvstAtmAll.length = 0;
	jsonRgnInvstAtmOwnr.length = 0;
	jsonRgnInvstOperPrsn.length = 0;
}

const mdRtlFcltRgnNowGridRebuild = function() {
	grdMdRtlOgnzType.rebuild();
	grdRgnOperPrsn.rebuild();
	grdLgstcsGdsFclt.rebuild();
	grdMdLwtpStrg.rebuild();
	grdRgnPrprtnClngFclt.rebuild();
	grdRgnStrgFclt.rebuild();
	grdRgnFcltMsrmtEqpmnt.rebuild();
	grdRgnInvstAtmAll.rebuild();
	grdRgnInvstAtmOwnr.rebuild();
	grdRgnInvstOperPrsn.rebuild();
}

</script>
</html>