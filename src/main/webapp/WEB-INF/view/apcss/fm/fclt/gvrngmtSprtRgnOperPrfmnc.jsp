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
					<h3 class="box-title" style="line-height: 30px;"> 2. 정부지원 지역별 운영실적</h3>
				</div>
			</div>
				<div class="col-sm-6">
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<span style="font-size:15px; color:black;">2.1. 운영조직 취급 및 APC 처리 실적</span>
								<br/>
								<span style="font-size:12px">운영조직 취급실적</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdGvrngmtSprtOperOgnzTrmtPrfmnc" style="height:311px;"></div>
					<span style="font-size:8px;">*조직화취급액 : 공동선별(수탁) 및 계약재배(매취) 금액</span>
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">산지유통시설 평균 처리실적(평균)</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdMdRtlFcltPrcsPrfmncAvg" style="height:311px;"></div>
					
					<div style="height: 50px;"></div>
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<span style="font-size:15px; color:black;">2.2. 지역별 운영조직 취급 및 APC 처리 실적</span>
								<br/>
								<span style="font-size:12px">지역별 운영조직 취급실적</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdRgnOperOgnzTrmtPrfmnc" style="height:311px;"></div>
					
					
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">지역별 APC 처리실적</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdRgnOperOgnzApcPrcsPrfmnc" style="height:311px;"></div>
				</div>
				<div class="col-sm-6">
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">산지유통시설 처리실적</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdMdRtlFcltPrcsPrfmnc" style="height:311px;"></div>
					
					<div style="height: 440px;"></div>
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">지역별 운영조직 취급실적(평균)</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdRgnOperOgnzTrmtPrfmncAvg" style="height:311px;"></div>
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">지역별 APC 처리실적(평균)</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdRgnOperOgnzApcPrcsPrfmncAvg" style="height:311px;"></div>
					
					
				</div>
			</div>
		</div>
	</div>
	</section>
</body>
<script type="text/javascript">

window.addEventListener('DOMContentLoaded', function(e) {
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
});
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
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","총취급액 "], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","평균취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","조직화취급액 "], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","평균조직화취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdGvrngmtSprtOperOgnzTrmtPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createMdRtlFcltPrcsPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdRtlFcltPrcsPrfmnc';
    SBGridProperties.id = 'grdMdRtlFcltPrcsPrfmnc';
    SBGridProperties.jsonref = 'jsonMdRtlFcltPrcsPrfmnc';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["APC취급액","APC취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["일반취급액","일반취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","공동선별(수탁) "], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","계약재배(매취)"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdMdRtlFcltPrcsPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createMdRtlFcltPrcsPrfmncAvgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdRtlFcltPrcsPrfmncAvg';
    SBGridProperties.id = 'grdMdRtlFcltPrcsPrfmncAvg';
    SBGridProperties.jsonref = 'jsonMdRtlFcltPrcsPrfmncAvg';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["APC취급액","APC취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["일반취급액","일반취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","공동선별(수탁)"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","계약재배(매취)"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdMdRtlFcltPrcsPrfmncAvg = _SBGrid.create(SBGridProperties);
}

const fn_createRgnOperOgnzTrmtPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnOperOgnzTrmtPrfmnc';
    SBGridProperties.id = 'grdRgnOperOgnzTrmtPrfmnc';
    SBGridProperties.jsonref = 'jsonRgnOperOgnzTrmtPrfmnc';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","계"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","계"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdRgnOperOgnzTrmtPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createRgnOperOgnzTrmtPrfmncAvgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnOperOgnzTrmtPrfmncAvg';
    SBGridProperties.id = 'grdRgnOperOgnzTrmtPrfmncAvg';
    SBGridProperties.jsonref = 'jsonRgnOperOgnzTrmtPrfmncAvg';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","전체"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화금액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화금액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화금액","전체"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdRgnOperOgnzTrmtPrfmncAvg = _SBGrid.create(SBGridProperties);
}

const fn_createRgnOperOgnzApcPrcsPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnOperOgnzApcPrcsPrfmnc';
    SBGridProperties.id = 'grdRgnOperOgnzApcPrcsPrfmnc';
    SBGridProperties.jsonref = 'jsonRgnOperOgnzApcPrcsPrfmnc';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","계"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","계"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdRgnOperOgnzApcPrcsPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createRgnOperOgnzApcPrcsPrfmncAvgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdRgnOperOgnzApcPrcsPrfmncAvg';
    SBGridProperties.id = 'grdRgnOperOgnzApcPrcsPrfmncAvg';
    SBGridProperties.jsonref = 'jsonRgnOperOgnzApcPrcsPrfmncAvg';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","전체"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화금액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화금액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화금액","전체"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdRgnOperOgnzApcPrcsPrfmncAvg = _SBGrid.create(SBGridProperties);
}
</script>
</html>