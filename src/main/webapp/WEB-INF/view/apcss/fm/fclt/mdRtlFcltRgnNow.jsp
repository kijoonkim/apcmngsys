
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
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
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
				<div id="sb-area-grdMdRtlOgnzType" style="height:311px;"></div>
				
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
				<div id="sb-area-grdRgnOperPrsn" style="height:311px;"></div>
			</div>
			<div style="height: 1px"></div>
			<div class="col-sm-6">
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
				<div id="sb-area-grdLgstcsGdsFclt" style="height:311px;"></div>
				<span style="font-size:8px;">*물류·상품화 시설: 집출하, 선별, 포장, 신선편의, 반가공 등 처리시설</span>
				<br/>
				<span style="font-size:8px;">*전체면적: APC 전체 물류 및 상품화 시설</span>
				<br/>
				<span style="font-size:8px;">*평균면적: APC 개소당 물류 및 상품화 시설</span>
				<div style="height: 310px;"></div>
			</div>
			
			<div class="col-sm-6">
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
				<div id="sb-area-grdMdLwtpStrg" style="height:311px;"></div>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<br/>
							<span style="font-size:12px">예냉시설</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,m²)</span>
							<br/>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdRgnPrprtnClngFclt" style="height:311px; margin-top: 50px"></div>
				<span style="font-size:8px;">*예냉시설:  수확 후 또는 운송 이전에 농산물의 품온을 짧은 시간 내에 적정온도로 냉각하는 시설</span>
				<br/>
				<span style="font-size:8px;"></span>
				<br/>
				<span style="font-size:8px;"></span>
				<br/>
			</div>
			<div class="col-sm-6">
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">CA 저장시설</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,m²)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdRgnStrgFclt" style="height:311px;"></div>
				<span style="font-size:8px;">*CA저장 시설 : Controlled Atmosphere Storage(기체조절 저장고)로 장기저장 과일의 신선도 유지 시설</span>
				
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
				<div id="sb-area-grdRgnFcltMsrmtEqpmnt" style="height:311px;"></div>
				<span style="font-size:8px;">*선별기 : 선별(grading&sorting)시설 본체</span>
				<br/>
				<span style="font-size:8px;">*측정장비 : 당도•색택•내부손상 등 세부 품질 측정장비(선별기에 부착)</span>
				<br/>
				<span style="font-size:8px;">*반가공시설 : 신선편의처리, 마늘건조, 깐마늘, 고추건조 등</span>
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
				<div id="sb-area-grdRgnInvstAtmAll" style="height:311px;"></div>
				
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
				<div id="sb-area-grdRgnInvstAtmOwnr" style="height:311px;"></div>
			</div>
			<div class="col-sm-6">
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
				<div id="sb-area-grdRgnInvstOperPrsn" style="height:311px;"></div>
				<div style="height: 370px;"></div>
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
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["통합조직 운영 APC","민간"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["통합조직 운영 APC","공공"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["개발조직 운영 APC","민간"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["개발조직 운영 APC","공공"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["소 개","민간"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["소 개","공공"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["합계","합계"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
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
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["통합조직 운영 APC","농 협"], ref: 'v1', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["통합조직 운영 APC","농업법인"], ref: 'v2', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["개발조직 운영 APC","농 협"], ref: 'v3', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["개발조직 운영 APC","농업법인"], ref: 'v4', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["소 개","농 협"], ref: 'v5', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["소 개","농업법인"], ref: 'v6', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["합계","합계"], ref: 'v7', type: 'output',  width:'105px', style: 'text-align:center'}
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
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["통합조직 운영 APC","전체면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["통합조직 운영 APC","평균면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["개발조직 운영 APC","전체면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["개발조직 운영 APC","평균면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["전체","전체면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["전체","평균면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
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
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["설치현황","전체 개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["설치현황","설치 개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["저온저장시(면적)","전체면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["저온저장시(면적)","평균면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
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
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["설치현황","전체 개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["설치현황","설치 개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["예냉시설(면적)","전체면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["예냉시설(면적)","평균면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
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
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["설치현황","전체 개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["설치현황","설치 개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["예냉시설(면적)","전체면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["예냉시설(면적)","평균면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
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
    SBGridProperties.columns = [
    	{caption : ["구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["전체 <br/> 개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["선별기 <br/> 설치 개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["측정장비 <br/> 설치 개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["반가공 시설 <br/> 설치 개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["로봇팔레타이저 <br/> 설치 개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
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
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["개소수","개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["투자금액","국비"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["투자금액","지방비"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["투자금액","자부담"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["투자금액","계"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["평균투자금액","평균투자금액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
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
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["민간 APC","개소 수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["민간 APC","투자금액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["민간 APC","평균투자액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["공공 APC","개소 수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["공공 APC","투자금액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["공공 APC","평균투자액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
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
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농 협","개소 수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농 협","투자금액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농 협","개소 수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농업법인","개소 수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농업법인","투자금액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농업법인","평균투자액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdRgnInvstOperPrsn = _SBGrid.create(SBGridProperties);
}

const fn_cellMdRtlFcltRgnNowGrid = async function() {
	
	const postJsonPromise = gfn_postJSON("/fm/fclt/selectMdRtlFcltRgnNowGridList.do", {s0 : ""});
	
	let data = await postJsonPromise;
	try {
		
		mdRtlFcltRgnNowJsonLengthReset();
		
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