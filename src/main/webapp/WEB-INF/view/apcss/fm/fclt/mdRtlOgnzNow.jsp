
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
					<h3 class="box-title" style="line-height: 30px;"> 1. 산지유통시설현황</h3>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<span style="font-size:15px; color:black;">1.1. 산지유통시설 개소수</span>
							<br/>
							<span style="font-size:12px">개소수 : 산지유통조직 유형</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdMdRtlOgnz" style="height:258px;"></div>
				<span style="font-size:8px;">*출자출하조직 또는 참영조직 중 전년도 선정에서 탈락한 조직 포함</span>
				
				<div style="height: 50px"></div>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<span style="font-size:15px; color:black;">1.2. 산지유통시설 시설ㆍ장비</span>
							<br/>
							<span style="font-size:12px">총 건축면적</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:m²)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdAllBdar" style="height:137px;"></div>
				<span style="font-size:8px;">*물류시설, 상품회사설, 저장고 등 건축면적의 합계</span><br/>
				<span style="font-size:8px;">*면적 소수점 이하 미표기</span>
				
				<div style="height: 20px"></div>
				
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
				<div id="sb-area-grdLwtpStrg" style="height:137px;"></div>
				<span style="font-size:8px;">*면적 소수점 이하 미표기</span>
				
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
				<div id="sb-area-grdStrgFclt" style="height:137px;"></div>
				<span style="font-size:8px;">*CA저장 시설 : Controlled Atmosphere Storage(기체조절 저장고)로 장기저장 과일의 신선도 유지 시설</span>
				
				<div style="height: 40px"></div>
				<div style="height: 50px"></div>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<span style="font-size:15px; color:black;">1.3.투자금액</span>
							<br/>
							<span style="font-size:12px">투자금액 : 전체</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,백만원)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdInvstAtmAll" style="height:137px;"></div>
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">투자금액 : 소유자</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,백만원)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdInvstAtmOwnr" style="height:137px;"></div>
			</div>
			<div class="col-sm-6">
			<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">개소수:소유자 및 운영자</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdOwnrAndOper" style="height:137px;"></div>
				<span style="font-size:8px;">*민간: 농협, 농업법인, 재단버인 등 민간 사업자</span><br/>
				<span style="font-size:8px;">*공공: 시ㆍ군 지방자치단체</span>
				
				<div style="height:101px;"></div>
				<div style="height: 50px"></div>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">물류ㆍ상품화 시설(건축면적)</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:m²)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdLgstcsGds" style="height:137px;"></div>
				<span style="font-size:8px;">*물류ㆍ상품화 시설: 집출하, 선별, 포장, 신선편의, 반가공 등 처리시설</span><br/>
				<span style="font-size:8px;">*전체면적: APC 전체 물류 및 상품화 시설</span><br/>
				<span style="font-size:8px;">*평균면적: APC 개소당 물류 및 상품화 시설</span>
				
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
				<div id="sb-area-grdPrprtnClngFclt" style="height:137px;"></div>
				<span style="font-size:8px;">*예냉시설:  수확 후 또는 운송 이전에 농산물의 품온을 짧은 시간 내에 적정온도로 냉각하는 시설</span>
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
				<div id="sb-area-grdFcltMsrmtEqpmnt" style="height:137px;"></div>
				<span style="font-size:8px;">*선별기 : 선별(grading&sorting)시설 본체</span><br/>
				<span style="font-size:8px;">*측정장비 : 당도·색택·내부손상 등 세부 품질 측정장비(선별기에 부착)</span><br/>
				<span style="font-size:8px;">*반가공시설 : 신선편의처리, 마늘건조, 깐마늘, 고추건조 등</span>
				
				<div style="height: 50px"></div>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">투자금액 : 자금 유형</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:백만원)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdInvstAtmFundType" style="height:137px;"></div>
				
				<div class="ad_tbl_top" style="margin-bottom: 30px;">
					<ul class="ad_tbl_count" style="width: 100%">
						<li>
							<br/>
							<span style="font-size:12px">투자금액 : 운영자</span>
							<br/>
							<span style="font-size:12px; text-align: right; display: block;">(단위:개소,백만원)</span>
						</li>
					</ul>
				</div>
				<div id="sb-area-grdInvstAtmOperPrsn" style="height:137px;"></div>
			</div>
		</div>
	</div>
	</section>
</body>
<script type="text/javascript">

window.addEventListener('DOMContentLoaded', function(e) {
	// 개소수 : 산지유통조직유형
	fn_createMdRtlOgnzGrid();
	// 개소수 : 소유자 및 운영자
	fn_createOwnrAndOperGrid();
	// 총 건축면적
	fn_createAllBdarGrid();
	// 물류·상품화 시설(건축면적)
	fn_createLgstcsGdsGrid();
	// 저온저장고
	fn_createLwtpStrgGrid();
	// 예냉시설
	fn_createPrprtnClngFcltGrid();
	// CA 저장시설
	fn_createStrgFcltGrid();
	// 선별기·측정장비 설치 개소 수
	fn_createFcltMsrmtEqpmntGrid();
	// 투자금액 : 전체
	fn_createInvstAtmAllGrid();
	// 투자금액 : 자금 유형
	fn_createInvstAtmFundTypeGrid();
	// 투자금액 : 소유자
	fn_createInvstAtmOwnrGrid();
	// 투자금액 : 운영자
	fn_createInvstAtmOperPrsnGrid();
	
	
	// 검색
	fn_cellMdRtlOgnzNowGrid();
});
//그리드 id, 그리드 json

//개소수 : 산지유통조직유형
var grdMdRtlOgnz;
//개소수 : 소유자 및 운영자
var grdAllBdar;
//총 건축면적
var grdOwnrAndOper;
//물류·상품화 시설(건축면적)
var grdLgstcsGds;
//예냉시설
var grdPrprtnClngFclt;
//저온저장고
var grdLwtpStrg;
//CA 저장시설
var grdStrgFclt;
//선별기·측정장비 설치 개소 수
var grdFcltMsrmtEqpmnt;
//투자금액 : 전체
var grdInvstAtmAll;
//투자금액 : 자금 유형
var grdInvstAtmFundType;
//투자금액 : 소유자
var grdInvstAtmOwnr;
//투자금액 : 운영자
var grdInvstAtmOperPrsn;



//개소수 : 산지유통조직유형
var jsonMdRtlOgnz = [];
 // 개소수 : 소유자 및 운영자
var jsonOwnrAndOper = [];
// 총 건축면적
var jsonAllBdar = [];
// 물류·상품화 시설(건축면적)
var jsonLgstcsGds = [];
// 저온저장고
var jsonLwtpStrg = [];
// 예냉시설
var jsonPrprtnClngFclt = [];
// CA 저장시설
var jsonStrgFclt = [];
// 선별기·측정장비 설치 개소 수
var jsonFcltMsrmtEqpmnt = [];
// 투자금액 : 전체
var jsonInvstAtmAll = [];
// 투자금액 : 자금 유형
var jsonInvstAtmFundType = [];
// 투자금액 : 소유자
var jsonInvstAtmOwnr = [];
// 투자금액 : 운영자
var jsonInvstAtmOperPrsn = [];



const fn_createMdRtlOgnzGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdMdRtlOgnz';
    SBGridProperties.id = 'grdMdRtlOgnz';
    SBGridProperties.jsonref = 'jsonMdRtlOgnz';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.mergecells = 'bycolrec';
    SBGridProperties.columns = [
    	{caption : ["산지유통조직유형"], ref: 'title', type: 'output',  width:'160px', style: 'text-align:center'},
    	{caption : ["산지유통조직유형"], ref: 'subTitle', type: 'output',  width:'160px', style: 'text-align:center'},
    	{caption : ["산지유통조직유형"], ref: 's0', type: 'output',  width:'200px', style: 'text-align:center'},
    	{caption : ["APC 개소수"], ref: 's1', type: 'output',  width:'160px', style: 'text-align:right', format : {type:'number', rule:'#,###'}}
    ];
    grdMdRtlOgnz = _SBGrid.create(SBGridProperties);
}

const fn_createOwnrAndOperGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdOwnrAndOper';
    SBGridProperties.id = 'grdOwnrAndOper';
    SBGridProperties.jsonref = 'jsonOwnrAndOper';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
			standard: [0],
			sum: [1,2,3,4,5],
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
		}
	};
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 's0', type: 'output',  width:'160px', style: 'text-align:center'},
    	{caption : ["소유자","민간"], ref: 's1', type: 'output',  width:'120px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["소유자","공공"], ref: 's2', type: 'output',  width:'120px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["운영자","농협"], ref: 's3', type: 'output',  width:'120px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["운영자","농업법인"], ref: 's4', type: 'output',  width:'120px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["합계","합계"], ref: 's5', type: 'output',  width:'150px', style: 'text-align:right', format : {type:'number', rule:'#,###'}}
    ];
    grdOwnrAndOper = _SBGrid.create(SBGridProperties);
}

const fn_createAllBdarGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdAllBdar';
    SBGridProperties.id = 'grdAllBdar';
    SBGridProperties.jsonref = 'jsonAllBdar';
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
			6: '#,###',
		}
	};
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'160px', style: 'text-align:center'},
    	{caption : ["농협","전체면적"], ref: 'v1', type: 'output',  width:'110px', style: 'text-align:right' , format : {type:'number', rule:'#,###'}},
    	{caption : ["농협","평균면적"], ref: 'v2', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["농업법인","전체면적"], ref: 'v3', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["농업법인","평균면적"], ref: 'v4', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["전체","전체면적"], ref: 'v5', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["전체","평균면적"], ref: 'v6', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}}
    ];
    grdAllBdar = _SBGrid.create(SBGridProperties);
}

const fn_createLgstcsGdsGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdLgstcsGds';
    SBGridProperties.id = 'grdLgstcsGds';
    SBGridProperties.jsonref = 'jsonLgstcsGds';
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
			5: '#,###',
		}
	};
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'160px', style: 'text-align:center'},
    	{caption : ["농협","전체면적"], ref: 'v1', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["농협","평균면적"], ref: 'v2', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["농업법인","전체면적"], ref: 'v3', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["농업법인","평균면적"], ref: 'v4', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["전체","전체면적"], ref: 'v5', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["전체","평균면적"], ref: 'v6', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}}
    ];
    grdLgstcsGds = _SBGrid.create(SBGridProperties);
}

const fn_createLwtpStrgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdLwtpStrg';
    SBGridProperties.id = 'grdLwtpStrg';
    SBGridProperties.jsonref = 'jsonLwtpStrg';
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'160px', style: 'text-align:center'},
    	{caption : ["설치현황","전체 개소수"], ref: 'v1', type: 'output',  width:'160px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["설치현황","선택 개소수"], ref: 'v2', type: 'output',  width:'160px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["저온저장시(면적)","전체면적"], ref: 'v3', type: 'output',  width:'160px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["저온저장시(면적)","평균면적"], ref: 'v4', type: 'output',  width:'160px', style: 'text-align:right', format : {type:'number', rule:'#,###'}}
    ];
    grdLwtpStrg = _SBGrid.create(SBGridProperties);
}

const fn_createPrprtnClngFcltGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdPrprtnClngFclt';
    SBGridProperties.id = 'grdPrprtnClngFclt';
    SBGridProperties.jsonref = 'jsonPrprtnClngFclt';
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'160px', style: 'text-align:center'},
    	{caption : ["설치현황","전체 개소수"], ref: 'v1', type: 'output',  width:'160px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["설치현황","설치 개소수"], ref: 'v2', type: 'output',  width:'160px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["예냉시설(면적)","전체면적"], ref: 'v3', type: 'output',  width:'160px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["예냉시설(면적)","평균면적"], ref: 'v4', type: 'output',  width:'160px', style: 'text-align:right', format : {type:'number', rule:'#,###'}}
    ];
    grdPrprtnClngFclt = _SBGrid.create(SBGridProperties);
}

const fn_createStrgFcltGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdStrgFclt';
    SBGridProperties.id = 'grdStrgFclt';
    SBGridProperties.jsonref = 'jsonStrgFclt';
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'160px', style: 'text-align:center'},
    	{caption : ["설치현황","전체 개소수"], ref: 'v1', type: 'output',  width:'160px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["설치현황","설치 개소수"], ref: 'v2', type: 'output',  width:'160px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["예냉시설(면적)","전체면적"], ref: 'v3', type: 'output',  width:'160px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["예냉시설(면적)","평균면적"], ref: 'v4', type: 'output',  width:'160px', style: 'text-align:right', format : {type:'number', rule:'#,###'}}
    ];
    grdStrgFclt = _SBGrid.create(SBGridProperties);
}

const fn_createFcltMsrmtEqpmntGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdFcltMsrmtEqpmnt';
    SBGridProperties.id = 'grdFcltMsrmtEqpmnt';
    SBGridProperties.jsonref = 'jsonFcltMsrmtEqpmnt';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
			standard: [0],
			sum: [1,2,3,4,5],
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
			5: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'160px', style: 'text-align:center'},
    	{caption : ["전체 <br/> 개소수","전체 <br/> 개소수"], ref: 'v1', type: 'output',  width:'120px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["선별기 <br/> 설치 개소수","선별기 <br/> 설치 개소수"], ref: 'v2', type: 'output',  width:'120px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["측정장비 <br/> 설치 개소수","측정장비 <br/> 설치 개소수"], ref: 'v3', type: 'output',  width:'120px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["반가공 시설 <br/> 설치 개소수","반가공 시설 <br/> 설치 개소수"], ref: 'v4', type: 'output',  width:'120px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["로봇팔레타이저 <br/> 설치 개소수","로봇팔레타이저 <br/> 설치 개소수"], ref: 'v5', type: 'output',  width:'120px', style: 'text-align:right', format : {type:'number', rule:'#,###'}}
    ];
    grdFcltMsrmtEqpmnt = _SBGrid.create(SBGridProperties);
}

const fn_createInvstAtmAllGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdInvstAtmAll';
    SBGridProperties.id = 'grdInvstAtmAll';
    SBGridProperties.jsonref = 'jsonInvstAtmAll';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
			standard: [0],
			sum: [1,2,3],
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
			3: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'160px', style: 'text-align:center'},
    	{caption : ["개소 수","개소 수"], ref: 'v1', type: 'output',  width:'230px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["투자금액","투자금액"], ref: 'v2', type: 'output',  width:'230px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["평균투자금액","평균투자금액"], ref: 'v3', type: 'output',  width:'230px', style: 'text-align:right', format : {type:'number', rule:'#,###'}}
    ];
    grdInvstAtmAll = _SBGrid.create(SBGridProperties);
}

const fn_createInvstAtmFundTypeGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdInvstAtmFundType';
    SBGridProperties.id = 'grdInvstAtmFundType';
    SBGridProperties.jsonref = 'jsonInvstAtmFundType';
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'160px', style: 'text-align:center'},
    	{caption : ["국비","국비"], ref: 'v1', type: 'output',  width:'140px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["지방비","지방비"], ref: 'v2', type: 'output',  width:'140px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["지부당","지부당"], ref: 'v3', type: 'output',  width:'140px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["합 계","합 계"], ref: 'v4', type: 'output',  width:'140px', style: 'text-align:right', format : {type:'number', rule:'#,###'}}
    ];
    grdInvstAtmFundType = _SBGrid.create(SBGridProperties);
}

const fn_createInvstAtmOwnrGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdInvstAtmOwnr';
    SBGridProperties.id = 'grdInvstAtmOwnr';
    SBGridProperties.jsonref = 'jsonInvstAtmOwnr';
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'160px', style: 'text-align:center'},
    	{caption : ["민간 APC","개소 수"], ref: 'v1', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["민간 APC","투자금액"], ref: 'v2', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["민간 APC","평균투자액"], ref: 'v3', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["공공 APC","개소 수"], ref: 'v4', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["공공 APC","투자금액"], ref: 'v5', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["공공 APC","평균투자액"], ref: 'v6', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}}
    ];
    grdInvstAtmOwnr = _SBGrid.create(SBGridProperties);
}

const fn_createInvstAtmOperPrsnGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdInvstAtmOperPrsn';
    SBGridProperties.id = 'grdInvstAtmOperPrsn';
    SBGridProperties.jsonref = 'jsonInvstAtmOperPrsn';
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
    	{caption : ["구분","구분"], ref: 'v0', type: 'output',  width:'160px', style: 'text-align:center'},
    	{caption : ["농 협","개소 수"], ref: 'v1', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["농 협","투자금액"], ref: 'v2', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["농 협","평균투자액"], ref: 'v3', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["농업법인","개소 수"], ref: 'v4', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["농업법인","투자금액"], ref: 'v5', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
    	{caption : ["농업법인","평균투자액"], ref: 'v6', type: 'output',  width:'110px', style: 'text-align:right', format : {type:'number', rule:'#,###'}}
    ];
    grdInvstAtmOperPrsn = _SBGrid.create(SBGridProperties);
}

const fn_cellMdRtlOgnzNowGrid = async function() {
	
	const postJsonPromise = gfn_postJSON("/fm/fclt/selectMdRtlOgnzNowGridList.do", {s0 : ""});
	
	let data = await postJsonPromise;
	try {
		
		mdRtlOgnzNowJsonLengthReset();
		
	  	data.resultMdRtlOgnz.forEach((item, index) => {
	  		const mdRtlOgnz = {
	  				  title : item.title,
	  				  subTitle : item.subTitle,
	  				  s0 : item.s0,
	  				  s1 : item.s1
			}
	  		jsonMdRtlOgnz.push(mdRtlOgnz);
	  	});
	  	data.resultOwnrAndOper.forEach((item, index) => {
	  		const ownrAndOper = {
	  				  s0 : item.s0,
	  				  s1 : item.s1,
	  				  s2 : item.s2,
	  				  s3 : item.s3,
	  				  s4 : item.s4,
	  				  s5 : item.s5
			}
	  		jsonOwnrAndOper.push(ownrAndOper);
	  	});
	  	data.resultAllBdar.forEach((item, index) => {
	  		const allBdar = {
	  				v0 : item.v0,
	  				v1 : item.v1,
	  				v2 : item.v2,
	  				v3 : item.v3,
	  				v4 : item.v4,
	  				v5 : item.v5,
	  				v6 : item.v6
	  		}
	  		jsonAllBdar.push(allBdar);
	  	});
	  	
	  	data.resultLgstcsGds.forEach((item, index) => {
	  		const lgstcsGds = {
	  				v0 : item.v0,
	  				v1 : item.v1,
	  				v2 : item.v2,
	  				v3 : item.v3,
	  				v4 : item.v4,
	  				v5 : item.v5,
	  				v6 : item.v6
	  		}
	  		jsonLgstcsGds.push(lgstcsGds);
	  	});
	  	
	  	data.resultLwtpStrg.forEach((item, index) => {
	  		const lwtpStrg = {
	  				v0 : item.v0,
	  				v1 : item.v1,
	  				v2 : item.v2,
	  				v3 : item.v3,
	  				v4 : item.v4
	  		}
	  		jsonLwtpStrg.push(lwtpStrg);
	  	});
	  	
	  	data.resultPrprtnClngFclt.forEach((item, index) => {
	  		const prprtnClngFclt = {
	  				v0 : item.v0,
	  				v1 : item.v1,
	  				v2 : item.v2,
	  				v3 : item.v3,
	  				v4 : item.v4
	  		}
	  		jsonPrprtnClngFclt.push(prprtnClngFclt);
	  	});
	  	
	  	data.resultStrgFclt.forEach((item, index) => {
	  		const strgFclt = {
	  				v0 : item.v0,
	  				v1 : item.v1,
	  				v2 : item.v2,
	  				v3 : item.v3,
	  				v4 : item.v4
	  		}
	  		jsonStrgFclt.push(strgFclt);
	  	});
	  	
	  	data.resultFcltMsrmtEqpmnt.forEach((item, index) => {
	  		const fcltMsrmtEqpmnt = {
	  				v0 : item.v0,
	  				v1 : item.v1,
	  				v2 : item.v2,
	  				v3 : item.v3,
	  				v4 : item.v4,
	  				v5 : item.v5
	  		}
	  		jsonFcltMsrmtEqpmnt.push(fcltMsrmtEqpmnt);
	  	});
	  	
	  	data.resultInvstAtmAll.forEach((item, index) => {
	  		const invstAtmAll = {
	  				v0 : item.v0,
	  				v1 : item.v1,
	  				v2 : item.v2,
	  				v3 : item.v3
	  		}
	  		jsonInvstAtmAll.push(invstAtmAll);
	  	});
	  	
	  	data.resultInvstAtmFundType.forEach((item, index) => {
	  		const invstAtmFundType = {
	  				v0 : item.v0,
	  				v1 : item.v1,
	  				v2 : item.v2,
	  				v3 : item.v3,
	  				v4 : item.v4
	  		}
	  		jsonInvstAtmFundType.push(invstAtmFundType);
	  	});
	  	
	  	data.resultInvstAtmOwnr.forEach((item, index) => {
	  		const invstAtmOwnr = {
	  				v0 : item.v0,
	  				v1 : item.v1,
	  				v2 : item.v2,
	  				v3 : item.v3,
	  				v4 : item.v4,
	  				v5 : item.v5,
	  				v6 : item.v6
	  		}
	  		jsonInvstAtmOwnr.push(invstAtmOwnr);
	  	});
	  	
	  	data.resultInvstAtmOperPrsn.forEach((item, index) => {
	  		const invstAtmOperPrsn = {
	  				v0 : item.v0,
	  				v1 : item.v1,
	  				v2 : item.v2,
	  				v3 : item.v3,
	  				v4 : item.v4,
	  				v5 : item.v5,
	  				v6 : item.v6
	  		}
	  		jsonInvstAtmOperPrsn.push(invstAtmOperPrsn);
	  	});
	  	
	  	mdRtlOgnzNowGridRebuild();
	  		
	  }	catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
	  return true;
}

const mdRtlOgnzNowJsonLengthReset = function() {
	jsonMdRtlOgnz.length = 0;
	jsonOwnrAndOper.length = 0;
	jsonAllBdar.length = 0;
	jsonLgstcsGds.length = 0;
	jsonLwtpStrg.length = 0;
	jsonPrprtnClngFclt.length = 0;
	jsonStrgFclt.length = 0;
	jsonFcltMsrmtEqpmnt.length = 0;
	jsonInvstAtmAll.length = 0;
	jsonInvstAtmFundType.length = 0;
	jsonInvstAtmOwnr.length = 0;
	jsonInvstAtmOperPrsn.length = 0;
}

const mdRtlOgnzNowGridRebuild = function() {
	grdMdRtlOgnz.rebuild();
	grdOwnrAndOper.rebuild();
	grdAllBdar.rebuild();
	grdLgstcsGds.rebuild();
	grdLwtpStrg.rebuild();
	grdPrprtnClngFclt.rebuild();
	grdStrgFclt.rebuild();
	grdFcltMsrmtEqpmnt.rebuild();
	grdInvstAtmAll.rebuild();
	grdInvstAtmFundType.rebuild();
	grdInvstAtmOwnr.rebuild();
	grdInvstAtmOperPrsn.rebuild();
}
</script>
</html>