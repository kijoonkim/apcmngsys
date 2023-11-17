
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
			<div class="box-header" style="display:flex; justify-content: flex-start; width: 100%;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> 4. 정부지원 산지유통시설 지역별 현황</h3>
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<span style="font-size:15px; color:black;">4.1. 정부지원 산지유통시설 개소수</span>
							<br/>
							<span style="font-size:12px">지역별 개소수 : 산지유통조직 유형</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdGvrngmtSprtMdRtlOgnzType" style="height:311px;"></div>
				<span style="font-size:8px;"><br/><br/><br/></span>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">지역별 개소수 : 운영자</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdGvrngmtSprtRgnOperPrsn" style="height:311px;"></div>
			</div>
			<div class="col-sm-6">
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<span style="font-size:15px; color:black;">4.2. 산지우통시설 시설·장비</span>
							<br/>
							<span style="font-size:12px">물류·상품화 시설</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,m²)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdGvrngmtSprtLgstcsGdsFclt" style="height:311px;"></div>
				<span style="font-size:8px;">*물류·상품화 시설: 집출하, 선별, 포장, 신선편의, 반가공 등 처리시설</span>
				<br/>
				<span style="font-size:8px;">*전체면적: APC 전체 물류 및 상품화 시설</span>
				<br/>
				<span style="font-size:8px;">*평균면적: APC 개소당 물류 및 상품화 시설</span>
				<div style="height: 371px"></div>
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
				<div id="sb-area-grdGvrngmtSprtLwtpStrg" style="height:311px;"></div>
				<span style="font-size:8px;">ㅤ</span>
				
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
				<div id="sb-area-grdGvrngmtSprtPrprtnClngFclt" style="height:311px;"></div>
				<span style="font-size:8px;">*예냉시설:  수확 후 또는 운송 이전에 농산물의 품온을 짧은 시간 내에 적정온도로 냉각하는 시설</span>
				<span style="font-size:8px;"><br/>ㅤ<br/>ㅤ</span>
			</div>
			<div class="col-sm-6">
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
				<div id="sb-area-grdGvrngmtSprtStrgFclt" style="height:311px;"></div>
				<span style="font-size:8px;">*CA저장 시설 : Controlled Atmosphere Storage(기체조절 저장고)로 장기저장 과일의 신선도 유지 시설</span>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">선별기·측정장비 설치 개소 수</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdGvrngmtSprtFcltMsrmtEqpmnt" style="height:311px;"></div>
				<span style="font-size:8px;">*선별기 : 선별(grading&sorting)시설 본체</span><br/>
				<span style="font-size:8px;">*측정장비 : 당도·색택·내부손상 등 세부 품질 측정장비(선별기에 부착)</span><br/>
				<span style="font-size:8px;">*반가공시설 : 신선편의처리, 마늘건조, 깐마늘, 고추건조 등</span>
			</div>
			<div class="col-sm-6">
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<span style="font-size:15px; color:black;">4.3. 지역별 투자금액</span>
							<br/>
							<span style="font-size:12px">지역별 투자금액 전체</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,백만원)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdGvrngmtSprtRgnInvstAtmAll" style="height:311px;"></div><br/>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">지역별 투자금액 : 소유자</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,백만원)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdMdInvstAtmOwnr" style="height:311px;"></div><br/>
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
				<div id="sb-area-grdMdInvstAtmOperPrsn" style="height:311px;"></div><br/>
			</div>
		</div>
	</div>
	</section>
</body>
<script type="text/javascript">

window.addEventListener('DOMContentLoaded', function(e) {
	// 정부지원 산지유통시설 개소수 - 지역별 개소수 : 산지유통조직 유형
	fn_createGvrngmtSprtMdRtlOgnzTypeGrid();
	// 정부지원 산지유통시설 개소수 - 지역별 개소수 : 운영자
	fn_createGvrngmtSprtRgnOperPrsnGrid();
	// 산지유통시설 시설·장비 - 물류·상품화 시설
	fn_createGvrngmtSprtLgstcsGdsFcltGrid();
	// 산지유통시설 시설·장비 - 저온저장고
	fn_createGvrngmtSprtLwtpStrgGrid();
	// 산지유통시설 시설·장비 - 예냉시설
	fn_createGvrngmtSprtPrprtnClngFcltGrid();
	// 산지유통시설 시설·장비 - CA 저장고
	fn_createGvrngmtSprtStrgFcltGrid();
	// 산지유통시설 시설·장비 - 선별기·측정장비 설치 개소 수
	fn_createGvrngmtSprtFcltMsrmtEqpmntGrid();
	// 산지유통시설 시설·장비 - 지역별 투자금액 전체
	fn_createGvrngmtSprtRgnInvstAtmAllGrid();
	// 산지유통시설 시설·장비 - 지역별 투자금액 : 소유자
	fn_createMdInvstAtmOwnrGrid();
	// 산지유통시설 시설·장비 - 지역별 투자금액 : 운영자
	fn_createMdInvstAtmOperPrsnGrid();
});
//그리드 id, 그리드 json

//정부지원 산지유통시설 개소수 - 지역별 개소수 : 산지유통조직 유형
var grdGvrngmtSprtMdRtlOgnzType;
//정부지원 산지유통시설 개소수 - 지역별 개소수 : 운영자
var grdGvrngmtSprtRgnOperPrsn;
//산지유통시설 시설·장비 - 물류·상품화 시설
var grdGvrngmtSprtLgstcsGdsFclt;
//산지유통시설 시설·장비 - 저온저장고
var grdGvrngmtSprtLwtpStrg;
//산지유통시설 시설·장비 - 예냉시설
var grdGvrngmtSprtPrprtnClngFclt;
//산지유통시설 시설·장비 - CA 저장고
var grdGvrngmtSprtStrgFclt;
//산지유통시설 시설·장비 - 선별기·측정장비 설치 개소 수
var grdGvrngmtSprtFcltMsrmtEqpmnt;
//산지유통시설 시설·장비 - 지역별 투자금액 전체
var grdGvrngmtSprtRgnInvstAtmAll;
//산지유통시설 시설·장비 - 지역별 투자금액 : 소유자
var grdMdInvstAtmOwnr;
//산지유통시설 시설·장비 - 지역별 투자금액 : 운영자
var grdMdInvstAtmOperPrsn;



// 정부지원 산지유통시설 개소수 - 지역별 개소수 : 산지유통조직 유형
var jsonGvrngmtSprtMdRtlOgnzType = [];
// 정부지원 산지유통시설 개소수 - 지역별 개소수 : 운영자
var jsonGvrngmtSprtRgnOperPrsn = [];
// 산지유통시설 시설·장비 - 물류·상품화 시설
var jsonGvrngmtSprtLgstcsGdsFclt = [];
// 산지유통시설 시설·장비 - 저온저장고
var jsonGvrngmtSprtLwtpStrg = [];
// 산지유통시설 시설·장비 - 예냉시설
var jsonGvrngmtSprtPrprtnClngFclt = [];
// 산지유통시설 시설·장비 - CA 저장고
var jsonGvrngmtSprtStrgFclt = [];
// 산지유통시설 시설·장비 - 선별기·측정장비 설치 개소 수
var jsonGvrngmtSprtFcltMsrmtEqpmnt = [];
// 산지유통시설 시설·장비 - 지역별 투자금액 전체
var jsonGvrngmtSprtRgnInvstAtmAll = [];
// 산지유통시설 시설·장비 - 지역별 투자금액 : 소유자
var jsonMdInvstAtmOwnr = [];
// 산지유통시설 시설·장비 - 지역별 투자금액 : 운영자
var jsonMdInvstAtmOperPrsn = [];



const fn_createGvrngmtSprtMdRtlOgnzTypeGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdGvrngmtSprtMdRtlOgnzType';
    SBGridProperties.id = 'grdGvrngmtSprtMdRtlOgnzType';
    SBGridProperties.jsonref = 'jsonGvrngmtSprtMdRtlOgnzType';
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
    	{caption : ["합 계","합 계"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdGvrngmtSprtMdRtlOgnzType = _SBGrid.create(SBGridProperties);
}

const fn_createGvrngmtSprtRgnOperPrsnGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdGvrngmtSprtRgnOperPrsn';
    SBGridProperties.id = 'grdGvrngmtSprtRgnOperPrsn';
    SBGridProperties.jsonref = 'jsonGvrngmtSprtRgnOperPrsn';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["통합조직 운영 APC","농 협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["통합조직 운영 APC","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["개별조직 운영 APC","농 협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["개별조직 운영 APC","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["소계","농 협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["소계","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["합계","합계"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdGvrngmtSprtRgnOperPrsn = _SBGrid.create(SBGridProperties);
}

const fn_createGvrngmtSprtLgstcsGdsFcltGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdGvrngmtSprtLgstcsGdsFclt';
    SBGridProperties.id = 'grdGvrngmtSprtLgstcsGdsFclt';
    SBGridProperties.jsonref = 'jsonGvrngmtSprtLgstcsGdsFclt';
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
    grdGvrngmtSprtLgstcsGdsFclt = _SBGrid.create(SBGridProperties);
}

const fn_createGvrngmtSprtLwtpStrgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdGvrngmtSprtLwtpStrg';
    SBGridProperties.id = 'grdGvrngmtSprtLwtpStrg';
    SBGridProperties.jsonref = 'jsonGvrngmtSprtLwtpStrg';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["설치현황","전체 개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["설치현황","전체 개소수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["저온저장시(면적)","전체면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["저온저장시(면적)","평균면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdGvrngmtSprtLwtpStrg = _SBGrid.create(SBGridProperties);
}

const fn_createGvrngmtSprtPrprtnClngFcltGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdGvrngmtSprtPrprtnClngFclt';
    SBGridProperties.id = 'grdGvrngmtSprtPrprtnClngFclt';
    SBGridProperties.jsonref = 'jsonGvrngmtSprtPrprtnClngFclt';
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
    grdGvrngmtSprtPrprtnClngFclt = _SBGrid.create(SBGridProperties);
}

const fn_createGvrngmtSprtStrgFcltGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdGvrngmtSprtStrgFclt';
    SBGridProperties.id = 'grdGvrngmtSprtStrgFclt';
    SBGridProperties.jsonref = 'jsonGvrngmtSprtStrgFclt';
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
    grdGvrngmtSprtStrgFclt = _SBGrid.create(SBGridProperties);
}

const fn_createGvrngmtSprtFcltMsrmtEqpmntGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdGvrngmtSprtFcltMsrmtEqpmnt';
    SBGridProperties.id = 'grdGvrngmtSprtFcltMsrmtEqpmnt';
    SBGridProperties.jsonref = 'jsonGvrngmtSprtFcltMsrmtEqpmnt';
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
    grdGvrngmtSprtFcltMsrmtEqpmnt = _SBGrid.create(SBGridProperties);
}

const fn_createGvrngmtSprtRgnInvstAtmAllGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdGvrngmtSprtRgnInvstAtmAll';
    SBGridProperties.id = 'grdGvrngmtSprtRgnInvstAtmAll';
    SBGridProperties.jsonref = 'jsonGvrngmtSprtRgnInvstAtmAll';
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
    grdGvrngmtSprtRgnInvstAtmAll = _SBGrid.create(SBGridProperties);
}

const fn_createMdInvstAtmOwnrGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdInvstAtmOwnr';
    SBGridProperties.id = 'grdMdInvstAtmOwnr';
    SBGridProperties.jsonref = 'jsonMdInvstAtmOwnr';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["소유자","민간"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["소유자","공공"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["운영자","농협"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["운영자","농업법인"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["합계","합계"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdMdInvstAtmOwnr = _SBGrid.create(SBGridProperties);
}

const fn_createMdInvstAtmOperPrsnGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdInvstAtmOperPrsn';
    SBGridProperties.id = 'grdMdInvstAtmOperPrsn';
    SBGridProperties.jsonref = 'jsonMdInvstAtmOperPrsn';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농 협","개소 수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농 협","투자금액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농 협","평균투자액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농업법인","개소 수"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농업법인","투자금액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농업법인","평균투자액"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdMdInvstAtmOperPrsn = _SBGrid.create(SBGridProperties);
}
</script>
</html>