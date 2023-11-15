
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
					<sbux-button id="btnGdsInvntrChgHstry3" name="btnLogMap" uitype="normal" text="지도" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnLogCntnHstry3" name="btnLogCntnHstry" uitype="normal" text="산지유통시설현황" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnLogMenuHstry3" name="btnLogMenuHstry" uitype="normal" text="산지유통시설지역별현황" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnLogTrsmHstry3" name="btnLogTrsmHstry" uitype="normal" text="정부지원산지유통시설현황" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnLogBatchHstry3" name="btnLogBatchHstry" uitype="normal" text="정부지원산지유통시설지역별현황" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnRawMtrChgHstry3" name="btnRawMtrChgHstry" uitype="normal" text="산지유통시설운영실적" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
					<sbux-button id="btnSortInvntrChgHstry3" name="btnSortInvntrChgHstry" uitype="normal" text="정부지원지역별운영실적" class="btn btn-sm btn-outline-danger"><a href="#"></a></sbux-button>
				</div>
				<div class="box-header" style="display:flex; justify-content: flex-start; width: 100%;" >
					<div>
						<h3 class="box-title" style="line-height: 30px;"> 3. 정부지원 산지유통시설 현황</h3>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<span style="font-size:15px; color:black;">3.1. 정부지원 산지유통시설 개소수</span>
								<br/>
								<span style="font-size:12px">개소수 : 산지유통조직 유형</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:개소)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdBzeatCntMdRtlOgnzType" style="height:386px;"></div>
					<span style="font-size:8px;">*출자출하조직 또는 참여조직 중 전년도 선정에서 탈락한 조직 포함</span>
					<span style="font-size:8px;">ㅤ</span>
					
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
					<div id="sb-area-grdBzeatCntOwnrAndOper" style="height:136px;"></div>
					<span style="font-size:8px;">*민간: 농협, 농업법인, 재단버인 등 민간 사업자</span><br/>
					<span style="font-size:8px;">*공공: 시ㆍ군 지방자치단체</span><br/>
				</div>
				<div class="col-sm-6">
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<span style="font-size:15px; color:black;">3.2. 정부지원 산지유통시설 시설·장비</span>
								<br/>
								<span style="font-size:12px">총 건축면적</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:m²)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdFcltEqpmntAllBdar" style="height:136px;"></div>
					<span style="font-size:8px;">*물류시설, 상품화시설, 저장고 등 건축면적의 합계</span>
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">물류·상품화 시설(건축면적)</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:m²)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdLgstcsGdsFcltBdar" style="height:136px ;"></div>
					<span style="font-size:8px;">*물류·상품화 시설: 집출하, 선별, 포장, 신선편의, 반가공 등 처리시설</span>
					<br/>
					<span style="font-size:8px;">*전체면적: APC 전체 물류 및 상품화 시설</span>
					<br/>
					<span style="font-size:8px;">*평균면적: APC 개소당 물류 및 상품화 시설</span>
					
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
					<div id="sb-area-grdBzeatCntLwtpStrg" style="height:136px;"></div>
					<span style="font-size:8px;">*예냉시설 : 수확 후 또는 운송 이전에 농산물의 품온을 짧은 시간 내에 적정온도로 냉각하는 시설</span>
					<br/>
					<br/>
				</div>
				
				<div class="col-sm-6">
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
					<div id="sb-area-grdBzeatCntPrprtnClngFclt" style="height:136px;"></div>
					<span style="font-size:8px;">*예냉시설:  수확 후 또는 운송 이전에 농산물의 품온을 짧은 시간 내에 적정온도로 냉각하는 시설</span>
					
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
					<div id="sb-area-grdBzeatCntStrgFclt" style="height:136px;"></div>
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
					<div id="sb-area-grdBzeatCntFcltMsrmtEqpmnt" style="height:136px;"></div>
					<span style="font-size:8px;">*선별기 : 선별(grading&sorting)시설 본체</span><br/>
					<span style="font-size:8px;">*측정장비 : 당도·색택·내부손상 등 세부 품질 측정장비(선별기에 부착)</span><br/>
					<span style="font-size:8px;">*반가공시설 : 신선편의처리, 마늘건조, 깐마늘, 고추건조 등</span>
				</div>
				<div class="col-sm-6">
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<span style="font-size:15px; color:black;">3.3. 투자금액</span>
								<br/>
								<span style="font-size:12px">투자금액: 전체</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:개소, 백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdBzeatCntInvstAtmAll" style="height:136px;"></div>
					<span style="font-size:8px;">ㅤ</span>
					
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
					<div id="sb-area-grdBzeatCntInvstAtmFundType" style="height:136px;"></div><br/>
					
					<div class="ad_tbl_top" style="margin-bottom: 30px;">
						<ul class="ad_tbl_count" style="width: 100%">
							<li>
								<br/>
								<span style="font-size:12px">투자금액 : 소유자</span>
								<br/>
								<span style="font-size:12px; text-align: right; display: block;">(단위:개소, 백만원)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdBzeatCntInvstAtmOwnr" style="height:136px;"></div>
					<span style="font-size:8px;"><br/><br/><br/></span>
					
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
					<div id="sb-area-grdBzeatCntInvstOperPrsn" style="height:136px;"></div>
				</div>
			</div>
		</div>
	</div>
	</section>
</body>
<script type="text/javascript">

window.addEventListener('DOMContentLoaded', function(e) {
	// 정부지원 산지유통시설 개소수 - 개소수 : 산지유통조직 유형
	fn_createBzeatCntMdRtlOgnzTypeGrid();
	// 정부지원 산지유통시설 개소수 - 개소수 : 소유자 및 운영자
	fn_createBzeatCntOwnrAndOperGrid();
	// 정부지원산지유통시설 시설·장비 - 총 건축면적
	fn_createFcltEqpmntAllBdarGrid();
	// 정부지원산지유통시설 시설 - 물류·상품화 시설(건축면적)
	fn_createLgstcsGdsFcltBdarGrid();
	// 정부지원산지유통시설 시설 - 저온저장고
	fn_createBzeatCntLwtpStrgGrid();
	// 정부지원산지유통시설 시설 - 예냉시설
	fn_createBzeatCntPrprtnClngFcltGrid();
	// 정부지원산지유통시설 시설 - CA 저장시설
	fn_createBzeatCntStrgFcltGrid();
	// 정부지원산지유통시설 시설 - 선별기·측정장비 설치 개소 수
	fn_createBzeatCntFcltMsrmtEqpmntGrid();
	// 정부지원산지유통시설 시설 - 투자금액 : 전체
	fn_createBzeatCntInvstAtmAllGrid();
	// 정부자원산지유통시설 시설 - 투자금액 : 자금 유형
	fn_createBzeatCntInvstAtmFundTypeGrid();
	// 정부자원산지유통시설 시설 - 투자금액 : 소유자
	fn_createBzeatCntInvstAtmOwnrGrid();
	// 정부자원산지유통시설 시설 - 투자금액 : 운영자
	fn_createBzeatCntInvstAtmOperPrsnGrid();
});
//그리드 id, 그리드 json

//정부지원 산지유통시설 개소수 - 개소수 : 산지유통조직 유형
var grdBzeatCntMdRtlOgnzType;
//정부지원 산지유통시설 개소수 - 개소수 : 소유자 및 운영자
var grdBzeatCntOwnrAndOper;
//정부지원산지유통시설 시설·장비 - 총 건축면적
var grdFcltEqpmntAllBdar;
//정부지원산지유통시설 시설 - 물류·상품화 시설(건축면적)
var grdLgstcsGdsFcltBdar;
//정부지원산지유통시설 시설 - 저온저장고
var grdBzeatCntLwtpStrg;
//정부지원산지유통시설 시설 - 예냉시설
var grdBzeatCntPrprtnClngFclt;
//정부지원산지유통시설 시설 - CA 저장시설
var grdBzeatCntStrgFclt;
//정부지원산지유통시설 시설 - 선별기·측정장비 설치 개소 수
var grdBzeatCntFcltMsrmtEqpmnt;
//정부지원산지유통시설 시설 - 투자금액 : 전체
var grdBzeatCntInvstAtmAll;
//정부자원산지유통시설 시설 - 투자금액 : 자금 유형
var grdBzeatCntInvstAtmFundType;
//정부자원산지유통시설 시설 - 투자금액 : 소유자
var grdBzeatCntInvstAtmOwnr;
//정부자원산지유통시설 시설 - 투자금액 : 운영자
var grdBzeatCntInvstOperPrsn;



// 정부지원 산지유통시설 개소수 - 개소수 : 산지유통조직 유형
var jsonBzeatCntMdRtlOgnzType = [];
// 정부지원 산지유통시설 개소수 - 개소수 : 소유자 및 운영자
var jsonBzeatCntOwnrAndOper = [];
// 정부지원산지유통시설 시설·장비 - 총 건축면적
var jsonFcltEqpmntAllBdar = [];
// 정부지원산지유통시설 시설 - 물류·상품화 시설(건축면적)
var jsonLgstcsGdsFcltBdar = [];
// 정부지원산지유통시설 시설 - 저온저장고
var jsonBzeatCntLwtpStrg = [];
// 정부지원산지유통시설 시설 - 예냉시설
var jsonBzeatCntPrprtnClngFclt = [];
// 정부지원산지유통시설 시설 - CA 저장시설
var jsonBzeatCntStrgFclt = [];
// 정부지원산지유통시설 시설 - 선별기·측정장비 설치 개소 수
var jsonBzeatCntFcltMsrmtEqpmnt = [];
// 정부지원산지유통시설 시설 - 투자금액 : 전체
var jsonBzeatCntInvstAtmAll = [];
// 정부자원산지유통시설 시설 - 투자금액 : 자금 유형
var jsonBzeatCntInvstAtmFundType = [];
// 정부자원산지유통시설 시설 - 투자금액 : 소유자
var jsonBzeatCntInvstAtmOwnr = [];
// 정부자원산지유통시설 시설 - 투자금액 : 운영자
var jsonBzeatCntInvstOperPrsn = [];




const fn_createBzeatCntMdRtlOgnzTypeGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdBzeatCntMdRtlOgnzType';
    SBGridProperties.id = 'grdBzeatCntMdRtlOgnzType';
    SBGridProperties.jsonref = 'jsonBzeatCntMdRtlOgnzType';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["산지유통조직유형"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["APC 개소수"], ref: 'apcSe', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["비고"], ref: 'rmrk', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdBzeatCntMdRtlOgnzType = _SBGrid.create(SBGridProperties);
}

const fn_createBzeatCntOwnrAndOperGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdBzeatCntOwnrAndOper';
    SBGridProperties.id = 'grdBzeatCntOwnrAndOper';
    SBGridProperties.jsonref = 'jsonBzeatCntOwnrAndOper';
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
    grdBzeatCntOwnrAndOper = _SBGrid.create(SBGridProperties);
}

const fn_createFcltEqpmntAllBdarGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdFcltEqpmntAllBdar';
    SBGridProperties.id = 'grdFcltEqpmntAllBdar';
    SBGridProperties.jsonref = 'jsonFcltEqpmntAllBdar';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농협","전체면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농협","평균면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농업법인","전체면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농업법인","평균면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["전체","전체면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["전체","평균면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdFcltEqpmntAllBdar = _SBGrid.create(SBGridProperties);
}

const fn_createLgstcsGdsFcltBdarGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdLgstcsGdsFcltBdar';
    SBGridProperties.id = 'grdLgstcsGdsFcltBdar';
    SBGridProperties.jsonref = 'jsonLgstcsGdsFcltBdar';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분","구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농협","전체면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농협","평균면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농업법인","전체면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["농업법인","평균면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["전체","전체면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["전체","평균면적"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdLgstcsGdsFcltBdar = _SBGrid.create(SBGridProperties);
}

const fn_createBzeatCntLwtpStrgGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdBzeatCntLwtpStrg';
    SBGridProperties.id = 'grdBzeatCntLwtpStrg';
    SBGridProperties.jsonref = 'jsonBzeatCntLwtpStrg';
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
    grdBzeatCntLwtpStrg = _SBGrid.create(SBGridProperties);
}

const fn_createBzeatCntPrprtnClngFcltGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdBzeatCntPrprtnClngFclt';
    SBGridProperties.id = 'grdBzeatCntPrprtnClngFclt';
    SBGridProperties.jsonref = 'jsonBzeatCntPrprtnClngFclt';
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
    grdBzeatCntPrprtnClngFclt = _SBGrid.create(SBGridProperties);
}

const fn_createBzeatCntStrgFcltGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdBzeatCntStrgFclt';
    SBGridProperties.id = 'grdBzeatCntStrgFclt';
    SBGridProperties.jsonref = 'jsonBzeatCntStrgFclt';
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
    grdBzeatCntStrgFclt = _SBGrid.create(SBGridProperties);
}

const fn_createBzeatCntFcltMsrmtEqpmntGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdBzeatCntFcltMsrmtEqpmnt';
    SBGridProperties.id = 'grdBzeatCntFcltMsrmtEqpmnt';
    SBGridProperties.jsonref = 'jsonBzeatCntFcltMsrmtEqpmnt';
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
    grdBzeatCntFcltMsrmtEqpmnt = _SBGrid.create(SBGridProperties);
}

const fn_createBzeatCntInvstAtmAllGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdBzeatCntInvstAtmAll';
    SBGridProperties.id = 'grdBzeatCntInvstAtmAll';
    SBGridProperties.jsonref = 'jsonBzeatCntInvstAtmAll';
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
    grdBzeatCntInvstAtmAll = _SBGrid.create(SBGridProperties);
}

const fn_createBzeatCntInvstAtmFundTypeGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdBzeatCntInvstAtmFundType';
    SBGridProperties.id = 'grdBzeatCntInvstAtmFundType';
    SBGridProperties.jsonref = 'jsonBzeatCntInvstAtmFundType';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
    	{caption : ["구분"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["국비"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["지방비"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["지부당"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'},
    	{caption : ["합 계"], ref: 'fcltType', type: 'output',  width:'105px', style: 'text-align:center'}
    ];
    grdBzeatCntInvstAtmFundType = _SBGrid.create(SBGridProperties);
}

const fn_createBzeatCntInvstAtmOwnrGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdBzeatCntInvstAtmOwnr';
    SBGridProperties.id = 'grdBzeatCntInvstAtmOwnr';
    SBGridProperties.jsonref = 'jsonBzeatCntInvstAtmOwnr';
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
    grdBzeatCntInvstAtmOwnr = _SBGrid.create(SBGridProperties);
}

const fn_createBzeatCntInvstAtmOperPrsnGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdBzeatCntInvstOperPrsn';
    SBGridProperties.id = 'grdBzeatCntInvstOperPrsn';
    SBGridProperties.jsonref = 'jsonBzeatCntInvstOperPrsn';
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
    grdBzeatCntInvstOperPrsn = _SBGrid.create(SBGridProperties);
}

</script>
</html>