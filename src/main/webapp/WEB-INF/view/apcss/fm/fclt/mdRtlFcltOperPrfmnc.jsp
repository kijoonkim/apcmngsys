
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
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-body">
			<div class="row">
				<div class="ad_tbl_toplist">
					<sbux-button id="btnGdsInvntrChgHstry5" name="btnLogMap" uitype="normal" text="지도" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnLogCntnHstry5" name="btnLogCntnHstry" uitype="normal" text="산지유통시설현황" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnLogMenuHstry5" name="btnLogMenuHstry" uitype="normal" text="산지유통시설지역별현황" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnLogTrsmHstry5" name="btnLogTrsmHstry" uitype="normal" text="정부지원산지유통시설현황" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnLogBatchHstry5" name="btnLogBatchHstry" uitype="normal" text="정부지원산지유통시설지역별현황" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnRawMtrChgHstry5" name="btnRawMtrChgHstry" uitype="normal" text="산지유통시설운영실적" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnSortInvntrChgHstry5" name="btnSortInvntrChgHstry" uitype="normal" text="정부지원지역별운영실적" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
				</div>
				<div class="box-header" style="display:flex; justify-content: flex-start; width: 100%;" >
					<div>
						<h3 class="box-title" style="line-height: 30px;"> 1. 산지유통시설 운영실적</h3>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<span style="font-size:12px">1.1. 운영조직 취급 및 APC 처리 실적</span>
								<br/>
								<span style="font-size:12px">운영조직 취급실적</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdOperOgnzTrmtPrfmnc" style="height:236px;"></div>
					<span style="font-size:8px;">*조직화취급액 : 공동선별(수탁) 및 계약재배(매취) 금액</span>
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">운영조직 처리실적</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdOperOgnzPrcsPrfmnc" style="height:236px;"></div>
					
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
					<div id="sb-area-grdMdOperOgnzTrmtPrfmncAvg" style="height:311px;"></div>
					
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
					<div id="sb-area-grdMdApcPrcsPrfmnc" style="height:311px;"></div>
				</div>
				<div class="col-sm-6">
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">산지유통시설 평균 처리실적</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdOperOgnzAvgTrmtPrfmnc" style="height:236px;"></div>
					<span style="font-size:8px;">ㅤ</span>
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<span style="font-size:12px">1.2. 지역별 운영조직 취급 및 APC 처리 실적</span>
								<br/>
								<span style="font-size:12px">지역별 운영조직 취급실적</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdMdOperOgnzTrmtPrfmnc" style="height:311px;"></div>
					
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
					<div id="sb-area-grdMdApcPrcsPrfmncAvg" style="height:311px;"></div>
				</div>
			</div>
		</div>
	</div>
	</section>
</body>
<script type="text/javascript">

window.addEventListener('DOMContentLoaded', function(e) {
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
});
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
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","총취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","평균취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","조직화취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","평균조직화취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    ];
    grdOperOgnzTrmtPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createOperOgnzPrcsPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdOperOgnzPrcsPrfmnc';
    SBGridProperties.id = 'grdOperOgnzPrcsPrfmnc';
    SBGridProperties.jsonref = 'jsonOperOgnzPrcsPrfmnc';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["APC 취급액","APC 취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["일반취급액","일반취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","공동선별(수탁)"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","계약재배(매취)"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdOperOgnzPrcsPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createOperOgnzAvgTrmtPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdOperOgnzAvgTrmtPrfmnc';
    SBGridProperties.id = 'grdOperOgnzAvgTrmtPrfmnc';
    SBGridProperties.jsonref = 'jsonOperOgnzAvgTrmtPrfmnc';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","총취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","평균취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","조직화취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","평균조직화취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    ];
    grdOperOgnzAvgTrmtPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createMdOperOgnzTrmtPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdOperOgnzTrmtPrfmnc';
    SBGridProperties.id = 'grdMdOperOgnzTrmtPrfmnc';
    SBGridProperties.jsonref = 'jsonMdOperOgnzTrmtPrfmnc';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","총취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["총취급액","평균취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","조직화취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["조직화취급액","평균조직화취급액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    ];
    grdMdOperOgnzTrmtPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createMdOperOgnzTrmtPrfmncAvgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdOperOgnzTrmtPrfmncAvg';
    SBGridProperties.id = 'grdMdOperOgnzTrmtPrfmncAvg';
    SBGridProperties.jsonref = 'jsonMdOperOgnzTrmtPrfmncAvg';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","전체"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화취급액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화취급액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화취급액","전체"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdMdOperOgnzTrmtPrfmncAvg = _SBGrid.create(SBGridProperties);
}

const fn_createMdApcPrcsPrfmncGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdApcPrcsPrfmnc';
    SBGridProperties.id = 'grdMdApcPrcsPrfmnc';
    SBGridProperties.jsonref = 'jsonMdApcPrcsPrfmnc';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","전체"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화취급액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화취급액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화취급액","전체"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdMdApcPrcsPrfmnc = _SBGrid.create(SBGridProperties);
}

const fn_createMdApcPrcsPrfmncAvgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdApcPrcsPrfmncAvg';
    SBGridProperties.id = 'grdMdApcPrcsPrfmncAvg';
    SBGridProperties.jsonref = 'jsonMdApcPrcsPrfmncAvg';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균취급액","전체"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화취급액","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화취급액","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균조직화취급액","전체"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdMdApcPrcsPrfmncAvg = _SBGrid.create(SBGridProperties);
}
</script>
</html>