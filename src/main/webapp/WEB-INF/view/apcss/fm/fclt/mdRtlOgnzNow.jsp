<%
	/**
	 * @Class Name : mdRtlOgnzNow.jsp
	 * @Description : APC전수조사 현황 - 1. 산지유통시설현황
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
    <title>title : 1. 산지유통시설현황</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/print-js/1.6.0/print.js"></script>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
	<div id="print-area" class="box box-solid">
		<div class="box-body">
			<div class="box-header no-print" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> 1. 산지유통시설현황</h3>
				</div>
			</div>
			<div class="box-header no-print" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<span style="font-weight: 600; font-size:15px; color:black;">1.1. 산지유통시설 개소수</span>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">개소수 : 산지유통조직 유형</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소)</span>
						</div>
					</div>

					<div id="sb-area-grdApcSpot" style="height:258px;"></div>
					<span style="font-size:11px;">*출자출하조직 또는 참여조직 중 전년도 선정에서 탈락한 조직 포함</span>

					<div style="height: 20px"></div>
				</div>
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">개소수 : 소유자 및 운영자</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소)</span>
						</div>
					</div>
					<div id="sb-area-grdApcSpotByOwnerOper" style="height:137px;"></div>
					<span style="font-size:11px;">*민간: 농협, 농업법인, 재단법인 등 민간 사업자</span><br/>
					<span style="font-size:11px;">*공공: 시ㆍ군 지방자치단체</span>
				</div>
			</div>
			<div class="box-header no-print" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<span style="font-weight: 600; font-size:15px; color:black;">1.2. 산지유통시설 시설ㆍ장비</span>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">총 건축면적</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:m²)</span>
						</div>
					</div>
					<div id="sb-area-grdApcAreaSize" style="height:137px;"></div>
					<span style="font-size:11px;">*물류시설, 상품회사설, 저장고 등 건축면적의 합계</span><br/>
					<span style="font-size:11px;">*면적 소수점 이하 미표기</span>
				</div>
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">물류ㆍ상품화 시설(건축면적)</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:m²)</span>
						</div>
					</div>
					<div id="sb-area-grdApcLgstcsGds" style="height:137px;"></div>
					<span style="font-size:11px;">*물류ㆍ상품화 시설: 집출하, 선별, 포장, 신선편의, 반가공 등 처리시설</span><br/>
					<span style="font-size:11px;">*전체면적: APC 전체 물류 및 상품화 시설</span><br/>
					<span style="font-size:11px;">*평균면적: APC 개소당 물류 및 상품화 시설</span>
				</div>
			</div>
			<div style="height: 20px"></div>
			<div class="row">
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">저온저장고</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소,m²)</span>
						</div>
					</div>
					<div id="sb-area-grdApcStrgLwtp" style="height:137px;"></div>
					<span style="font-size:11px;">*면적 소수점 이하 미표기</span>
				</div>
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">예냉시설</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소,m²)</span>
						</div>
					</div>
					<div id="sb-area-grdApcStrgPrcPlc" style="height:137px;"></div>
					<span style="font-size:11px;">*예냉시설:  수확 후 또는 운송 이전에 농산물의 품온을 짧은 시간 내에 적정온도로 냉각하는 시설</span>
				</div>
			</div>
			<div style="height: 20px"></div>
			<div class="row">
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">CA 저장시설</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소,m²)</span>
						</div>
					</div>
					<div id="sb-area-grdApcStrgCa" style="height:137px;"></div>
					<span style="font-size:11px;">*CA저장 시설 : Controlled Atmosphere Storage(기체조절 저장고)로 장기저장 과일의 신선도 유지 시설</span>
				</div>
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">선별기·측정장비 설치 개소 수</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소)</span>
						</div>
					</div>
					<div id="sb-area-grdApcInstalledEquipment" style="height:137px;"></div>
					<span style="font-size:11px;">*선별기 : 선별(grading&sorting)시설 본체</span><br/>
					<span style="font-size:11px;">*측정장비 : 당도·색택·내부손상 등 세부 품질 측정장비(선별기에 부착)</span><br/>
					<span style="font-size:11px;">*반가공시설 : 신선편의처리, 마늘건조, 깐마늘, 고추건조 등</span>
				</div>
			</div>
			<div class="box-header no-print" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<span style="font-weight: 600; font-size:15px; color:black;">1.3. 투자금액</span>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">투자금액 : 전체</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소,백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdApcInvestment" style="height:137px;"></div>
				</div>
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">투자금액 : 자금 유형</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdApcInvestmentByType" style="height:137px;"></div>
				</div>
			</div>
			<div style="height: 20px"></div>
			<div class="row">
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">투자금액 : 소유자</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소,백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdApcInvestmentByOwner" style="height:137px;"></div>
				</div>
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">투자금액 : 운영자</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소,백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdApcInvestmentByOper" style="height:137px;"></div>
				</div>
			</div>
		</div>
	</div>
	</section>
</body>
<script type="text/javascript">


	/**
	 * SBGrid Object
	 */
	var grdApcSpot = null;
	var grdApcSpotByOwnerOper = null;
	var grdApcAreaSize = null;
	var grdApcLgstcsGds = null;
	var grdApcStrgLwtp = null;
	var grdApcStrgPrcPlc = null;
	var grdApcStrgCa = null;
	var grdApcInstalledEquipment = null;
	var grdApcInvestment = null;
	var grdApcInvestmentByType = null;
	var grdApcInvestmentByOwner = null;
	var grdApcInvestmentByOper = null;

	/**
	 * JSON DATA
	 */
	var jsonApcSpot 				= [];
	var jsonApcSpotByOwnerOper 		= [];
	var jsonApcAreaSize 			= [];
	var jsonApcInstalledEquipment 	= [];
	var jsonApcInvestment 			= [];


	/**
	 * @name fn_clearApcFcltTotJson
	 * @description 1.APC 시설 집계 조회 그리드 데이터 정리
	 * @function
	 */
	const fn_clearApcFcltTotJson = function() {
		jsonApcSpot.length = 0;
		jsonApcSpotByOwnerOper.length = 0;
		jsonApcAreaSize.length = 0;
		jsonApcInstalledEquipment.length = 0;
		jsonApcInvestment.length = 0;
	}

	/**
	 * @name fn_rebuildApcFcltTotGrid
	 * @description 1.APC 시설 집계 조회 그리드 Rebuild
	 * @function
	 */
	const fn_rebuildApcFcltTotGrid = function() {
		grdApcSpot.rebuild();
		grdApcSpotByOwnerOper.rebuild();
		grdApcAreaSize.rebuild();
		grdApcLgstcsGds.rebuild();
		grdApcStrgLwtp.rebuild();
		grdApcStrgPrcPlc.rebuild();
		grdApcStrgCa.rebuild();
		grdApcInstalledEquipment.rebuild();
		grdApcInvestment.rebuild();
		grdApcInvestmentByType.rebuild();
		grdApcInvestmentByOwner.rebuild();
		grdApcInvestmentByOper.rebuild();

		fn_setDetailApcFcltTotGrid();
	}

	const fn_setDetailApcFcltTotGrid = function() {
		grdApcSpot.setCellStyle('background-color',0,0,8,2,'#F5FBFF');
		grdApcSpot.setRowStyles(9, 'background-color: #CEEBFF; font-weight: bold; color: #0060b3', 'all', true);
	}

	/**
	 * @name fn_createGridApcFcltTot
	 * @description 1.APC 시설 집계 그리드 생성
	 * @function
	 */
	const fn_createGridApcFcltTot = function() {
		fn_createGridApcSpot();
		fn_createGridApcSpotByOwnerOper();
		fn_createGridApcAreaSize();
		fn_createGridApcLgstcsGds();
		fn_createGridApcStrgLwtp();
		fn_createGridApcStrgPrcPlc();
		fn_createGridApcStrgCa();
		fn_createGridApcInstalledEquipment();
		fn_createGridApcInvestment();
		fn_createGridApcInvestmentByType();
		fn_createGridApcInvestmentByOwner();
		fn_createGridApcInvestmentByOper();

		//fn_setApcFcltTotGrid();
	}

	/**
	 * @name fn_setApcFcltTotGrid
	 * @description 1.APC 시설 집계 조회
	 * @function
	 */
	const fn_setApcFcltTotGrid = async function() {

		try {
			const crtrYr = SBUxMethod.get("srch-slt-crtrYr");
			const postUrl = "/fm/fclt/selectApcFcltTotList.do";

			fn_clearApcFcltTotJson();

			const postJsonPromise = gfn_postJSON(postUrl, {crtrYr: crtrYr});
			const data = await postJsonPromise;

			if (!_.isEqual("S", data.resultStatus)) {
				gfn_comAlert(data.resultCode, data.resultMessage);
				return;
			}
			/**
			 * 	apcSpotList
			 * 	apcSpotListByOwnerOper
			 * 	apcAreaSizeList
			 * 	apcInstalledEquipmentList
			 * 	apcInvestmentList
			 */

			if (!gfn_isEmpty(data.apcSpotList)) {
				data.apcSpotList.forEach(item => {
					jsonApcSpot.push(item);
				});
			}
			if (!gfn_isEmpty(data.apcSpotListByOwnerOper)) {
				data.apcSpotListByOwnerOper.forEach(item => {
					jsonApcSpotByOwnerOper.push(item);
				});
			}
			if (!gfn_isEmpty(data.apcAreaSizeList)) {
				data.apcAreaSizeList.forEach(item => {
					jsonApcAreaSize.push(item);
				});
			}
			if (!gfn_isEmpty(data.apcInstalledEquipmentList)) {
				data.apcInstalledEquipmentList.forEach(item => {
					jsonApcInstalledEquipment.push(item);
				});
			}
			if (!gfn_isEmpty(data.apcInvestmentList)) {
				data.apcInvestmentList.forEach(item => {
					jsonApcInvestment.push(item);
				});
			}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		} finally {
			fn_rebuildApcFcltTotGrid();
		}
	}


	function fn_rowStyleCssMdRtlOgnz() {
		grdMdRtlOgnz.setCellStyle('background-color',0,0,8,2,'#F5FBFF');
		grdMdRtlOgnz.setRowStyles(9, 'background-color: #CEEBFF; font-weight: bold; color: #0060b3', 'all', true);
	}


/**
 * @name fn_cellCreateMdRtlOgnzNowGrid
 * @description 1.산지유통시설현황 그리드 생성 호출용
 * @function
 */
const fn_cellCreateMdRtlOgnzNowGrid = function() {
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

	fn_cellMdRtlOgnzNowGrid();

}

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


/**
 * @name fn_createGridApcSpot
 * @description 1.1. 산지유통시설 개소수:산지유통조직 유형
 * @function
 */
const fn_createGridApcSpot = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdApcSpot';
    SBGridProperties.id = 'grdApcSpot';
    SBGridProperties.jsonref = 'jsonApcSpot';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.mergecells = 'bycolrec';
    SBGridProperties.allowcopy = true;
    SBGridProperties.columns = [
    	{
			caption : ["산지유통조직유형"],
			ref: 'totOgnzTypeNm',
			type: 'output',
			width:'28%',
			style: 'text-align:center; padding-right:5px; '
		},
    	{
			caption : ["산지유통조직유형"],
			ref: 'totOgnzKndNm',
			type: 'output',
			width:'28%',
			style: 'text-align:center; padding-right:5px;'
		},
    	{
			caption : ["산지유통조직유형"],
			ref: 'cmsuTotOgnzSeNm',
			type: 'output',
			width:'28%',
			style: 'text-align:center; padding-right:5px;'
		},
    	{
			caption : ["APC 개소수"],
			ref: 'cntApc',
			type: 'output',
			datatype: 'number',
			width:'16%',
			style: 'text-align:right; padding-right:5px;',
			merge : false,
			format : {type:'number', rule:'#,###'}
		}
    ];
	grdApcSpot = _SBGrid.create(SBGridProperties);
}

/**
 * @name fn_createGridApcSpotByOwnerOper
 * @description 1.1. 산지유통시설 개소수:소유자및운영자
 * @function
 */
const fn_createGridApcSpotByOwnerOper = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdApcSpotByOwnerOper';
    SBGridProperties.id = 'grdApcSpotByOwnerOper';
    SBGridProperties.jsonref = 'jsonApcSpotByOwnerOper';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.allowcopy = true;
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
			ref: 'totOgnzTypeNm',
			type: 'output',
			width:'25%',
			style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
		},
    	{
			caption : ["소유자","민간"],
			ref: 'cntPrivate',
			type: 'output',
			datatype: 'number',
			width:'15%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["소유자","공공"],
			ref: 'cntPublic',
			type: 'output',
			datatype: 'number',
			width:'15%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["운영자","농협"],
			ref: 'cntCoo',
			type: 'output',
			datatype: 'number',
			width:'15%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["운영자","농업법인"],
			ref: 'cntCmp',
			type: 'output',
			datatype: 'number',
			width:'15%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["합계","합계"],
			ref: 'cntApc',
			type: 'output',
			datatype: 'number',
			width:'15%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		}
    ];
	grdApcSpotByOwnerOper = _SBGrid.create(SBGridProperties);
}

/**
 * @name fn_createGridApcAreaSize
 * @description 1.2. 산지유통시설 시설ㆍ장비 - 면적
 * @function
 */
const fn_createGridApcAreaSize = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdApcAreaSize';
    SBGridProperties.id = 'grdApcAreaSize';
    SBGridProperties.jsonref = 'jsonApcAreaSize';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.allowcopy = true;
    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
			standard: [0],
			sum: [1,3,5,7,8,9],
			//avg: [2,4,6],
			custom: [2,4,6],
			customFunc: function(colId, row) {
				let sumCol = "";
				let cntCol = "";

				switch (colId) {
					case "cspTotAreaAvgCoo":
						sumCol = "cspTotAreaCoo";
						cntCol = "cntCoo";
						break;

					case "cspTotAreaAvgCmp":
						sumCol = "cspTotAreaCmp";
						cntCol = "cntCmp";
						break;

					case "cspTotAreaAvg":
						sumCol = "cspTotArea";
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
		}
	};
    SBGridProperties.columns = [
    	{
			caption : ["구분","구분"],
			ref: 'totOgnzTypeNm',
			type: 'output',
			width:'16%',
			style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
		},
    	{
			caption : ["농협","전체면적"],
			ref: 'cspTotAreaCoo',
			type: 'output',
			datatype: 'number',
			width:'14%',
			tyle: 'text-align:right; padding-right:5px;' ,
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["농협","평균면적"],
			ref: 'cspTotAreaAvgCoo',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["농업법인","전체면적"],
			ref: 'cspTotAreaCmp',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["농업법인","평균면적"],
			ref: 'cspTotAreaAvgCmp',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["전체","전체면적"],
			ref: 'cspTotArea',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["전체","평균면적"],
			ref: 'cspTotAreaAvg',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
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
		{
			ref: 'cntApc',
			type: 'output',
			datatype: 'number',
			style: 'text-align:right; padding-right:5px;',
			format: {type:'number', rule:'#,###'},
			hidden: true
		},

    ];
	grdApcAreaSize = _SBGrid.create(SBGridProperties);
}

/**
 * @name fn_createGridApcLgstcsGds
 * @description 1.2. 산지유통시설 시설ㆍ장비 - 물류ㆍ상품화 시설(건축면적)
 * @function
 */
const fn_createGridApcLgstcsGds = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdApcLgstcsGds';
    SBGridProperties.id = 'grdApcLgstcsGds';
    SBGridProperties.jsonref = 'jsonApcAreaSize';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.allowcopy = true;
    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
			standard: [0],
			sum: [1,3,5,7,8,9],
			//avg: [2,4,6],
			custom: [2,4,6],
			customFunc: function(colId, row) {



				let sumCol = "";
				let cntCol = "";
				switch (colId) {
					case "cspGdsAreaAvgCoo":
						sumCol = "cspGdsAreaCoo";
						cntCol = "cntCoo";
						break;
					case "cspGdsAreaAvgCmp":
						sumCol = "cspGdsAreaCmp";
						cntCol = "cntCmp";
						break;
					case "cspGdsAreaAvg":
						sumCol = "cspGdsArea";
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
		}
	};
    SBGridProperties.columns = [
    	{
			caption : ["구분","구분"],
			ref: 'totOgnzTypeNm',
			type: 'output',
			width:'16%',
			style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
		},
    	{
			caption : ["농협","전체면적"],
			ref: 'cspGdsAreaCoo',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["농협","평균면적"],
			ref: 'cspGdsAreaAvgCoo',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["농업법인","전체면적"],
			ref: 'cspGdsAreaCmp',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["농업법인","평균면적"],
			ref: 'cspGdsAreaAvgCmp',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["전체","전체면적"],
			ref: 'cspGdsArea',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["전체","평균면적"],
			ref: 'cspGdsAreaAvg',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
		{
			caption : ["농협","개소수"],
			ref: 'cntCoo',
			datatype: 'number',
			hidden: true
		},
		{
			caption : ["농업법인","개소수"],
			ref: 'cntCmp',
			datatype: 'number',
			hidden: true
		},
		{
			caption : ["전체","개소수"],
			ref: 'cntApc',
			datatype: 'number',
			hidden: true
		},
    ];
	grdApcLgstcsGds = _SBGrid.create(SBGridProperties);
}

/**
 * @name fn_createGridApcStrgLwtp
 * @description 1.2. 산지유통시설 시설ㆍ장비 - 저온저장고
 * @function
 */
const fn_createGridApcStrgLwtp = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdApcStrgLwtp';
    SBGridProperties.id = 'grdApcStrgLwtp';
    SBGridProperties.jsonref = 'jsonApcAreaSize';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.allowcopy = true;
    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
			standard: [0],
			sum: [1,2,3],
			custom: [4],
			customFunc: function(colId, row) {
				let sum = parseInt(row['strgLwtpArea']) || 0;
				let cnt = parseInt(row['strgLwtpCnt']) || 0;

				if (cnt <= 0) {
					return 0;
				}

				return (sum / cnt).toFixed(0);
				/*
				let sum = 0;
				let cnt = 0;
				let avg = 0;

				jsonApcAreaSize.forEach(area => {
					if (area['grandtotal']) {
						return;
					}

					switch (colId) {
						case "strgLwtpAreaAvg":
							sum += area.strgLwtpArea;
							cnt += area.strgLwtpCnt;
							break;
					}
				});

				if (cnt <= 0) {
					return avg;
				}

				avg = (sum / cnt).toFixed([0]);

				return avg;
				*/
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
			4: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{
			caption : ["구분","구분"],
			ref: 'totOgnzTypeNm',
			type: 'output',
			width:'16%',
			style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
		},
    	{
			caption : ["APC 개소수","APC 개소수"],
			ref: 'cntApc',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["저온저장고 <br/> 개소수","저온저장고 <br/> 개소수"],
			ref: 'strgLwtpCnt',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["저온저장시(면적)","전체면적"],
			ref: 'strgLwtpArea',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["저온저장시(면적)","평균면적"],
			ref: 'strgLwtpAreaAvg',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		}
    ];
	grdApcStrgLwtp = _SBGrid.create(SBGridProperties);
}

/**
 * @name fn_createGridApcStrgPrcPlc
 * @description 1.2. 산지유통시설 시설ㆍ장비 - 예냉시설
 * @function
 */
const fn_createGridApcStrgPrcPlc = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdApcStrgPrcPlc';
    SBGridProperties.id = 'grdApcStrgPrcPlc';
    SBGridProperties.jsonref = 'jsonApcAreaSize';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.allowcopy = true;
    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
			standard: [0],
			sum: [1,2,3],
			custom: [4],
			customFunc: function(colId, row) {
				let sum = parseInt(row['strgPrcPlcArea']) || 0;
				let cnt = parseInt(row['strgPrcPlcCnt']) || 0;

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
			4: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{
			caption : ["구분","구분"],
			ref: 'totOgnzTypeNm',
			type: 'output',
			width:'16%',
			style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
		},
    	{
			caption : ["APC 개소수","APC 개소수"],
			ref: 'cntApc',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["예냉시설 <br/> 개소수","예냉시설 <br/> 개소수"],
			ref: 'strgPrcPlcCnt',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["예냉시설(면적)","전체면적"],
			ref: 'strgPrcPlcArea',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["예냉시설(면적)","평균면적"],
			ref: 'strgPrcPlcAreaAvg',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		}
    ];
	grdApcStrgPrcPlc = _SBGrid.create(SBGridProperties);
}

/**
 * @name fn_createGridApcStrgCa
 * @description 1.2. 산지유통시설 시설ㆍ장비 - CA 저장시설
 * @function
 */
const fn_createGridApcStrgCa = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdApcStrgCa';
    SBGridProperties.id = 'grdApcStrgCa';
    SBGridProperties.jsonref = 'jsonApcAreaSize';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.allowcopy = true;
    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
			standard: [0],
			sum: [1,2,3],
			custom: [4],
			customFunc: function(colId, row) {
				let sum = parseInt(row['strgCaArea']) || 0;
				let cnt = parseInt(row['strgCaCnt']) || 0;

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
			4: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{
			caption : ["구분","구분"],
			ref: 'totOgnzTypeNm',
			type: 'output',
			width:'16%',
			style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
		},
    	{
			caption : ["설치현황","전체 개소수"],
			ref: 'cntApc',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["설치현황","설치 개소수"],
			ref: 'strgCaCnt',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["CA저장시설(면적)","전체면적"],
			ref: 'strgCaArea',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["CA저장시설(면적)","평균면적"],
			ref: 'strgCaAreaAvg',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		}
    ];
	grdApcStrgCa = _SBGrid.create(SBGridProperties);
}


/**
 * @name fn_createGridApcInstalledEquipment
 * @description 1.2. 산지유통시설 시설ㆍ장비 - 선별기·측정장비 설치 개소 수
 * @function
 */
const fn_createGridApcInstalledEquipment = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdApcInstalledEquipment';
    SBGridProperties.id = 'grdApcInstalledEquipment';
    SBGridProperties.jsonref = 'jsonApcInstalledEquipment';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.allowcopy = true;
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
			stylestartcol: 0
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
    	{
			caption : ["구분","구분"],
			ref: 'totOgnzTypeNm',
			type: 'output',
			width:'16%',
			style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
		},
    	{
			caption : ["APC개소수","APC개소수"],
			ref: 'cntApc',
			type: 'output',
			datatype: 'number',
			width:'16.8%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["선별기 <br/> 설치 개소수","선별기 <br/> 설치 개소수"],
			ref: 'cntSortMchn',
			type: 'output',
			datatype: 'number',
			width:'16.8%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["당도선별기 <br/> 설치개소수","당도선별기 <br/> 설치개소수"],
			ref: 'cntBrckMchn',
			type: 'output',
			datatype: 'number',
			width:'16.8%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["색택선별기 <br/> 설치개소수","색택선별기 <br/> 설치개소수"],
			ref: 'cntColorMchn',
			type: 'output',
			datatype: 'number',
			width:'16.8%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["가공설비 <br/> 설치개소수","가공설비 <br/> 설치개소수"],
			ref: 'cntMnfcMchn',
			type: 'output',
			datatype: 'number',
			width:'16.8%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		}
    ];
	grdApcInstalledEquipment = _SBGrid.create(SBGridProperties);
}

/**
 * @name fn_createGridApcInvestment
 * @description 1.3.투자금액 - 전체
 * @function
 */
const fn_createGridApcInvestment = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdApcInvestment';
    SBGridProperties.id = 'grdApcInvestment';
    SBGridProperties.jsonref = 'jsonApcInvestment';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.allowcopy = true;
    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
			standard: [0],
			sum: [1,2],
			//avg: [3]
			custom: [3],
			customFunc: function(colId, row) {
				let sum = parseInt(row['ivstAmt']) || 0;
				let cnt = parseInt(row['cntApc']) || 0;

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
			3: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{
			caption : ["구분","구분"],
			ref: 'totOgnzTypeNm',
			type: 'output',
			width:'25%',
			style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
		},
    	{
			caption : ["개소 수","개소 수"],
			ref: 'cntApc',
			type: 'output',
			datatype: 'number',
			width:'25%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["투자금액","투자금액"],
			ref: 'ivstAmt',
			type: 'output',
			datatype: 'number',
			width:'25%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["평균투자금액","평균투자금액"],
			ref: 'ivstAvg',
			type: 'output',
			datatype: 'number',
			width:'25%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		}
    ];
	grdApcInvestment = _SBGrid.create(SBGridProperties);
}

/**
 * @name fn_createGridApcInvestmentByType
 * @description 1.3. 투자금액 - 자금 유형
 * @function
 */
const fn_createGridApcInvestmentByType = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdApcInvestmentByType';
    SBGridProperties.id = 'grdApcInvestmentByType';
    SBGridProperties.jsonref = 'jsonApcInvestment';
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
			ref: 'totOgnzTypeNm',
			type: 'output',
			width:'16%',
			style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
		},
    	{
			caption : ["국비","국비"],
			ref: 'ne',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["지방비","지방비"],
			ref: 'lcltExpnd',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["자부담","자부담"],
			ref: 'slfBrdn',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["합 계","합 계"],
			ref: 'ivstAmt',
			type: 'output',
			datatype: 'number',
			width:'21%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		}
    ];
	grdApcInvestmentByType = _SBGrid.create(SBGridProperties);
}

/**
 * @name fn_createGridApcInvestmentByOwner
 * @description 1.3.투자금액 - 소유자
 * @function
 */
const fn_createGridApcInvestmentByOwner = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdApcInvestmentByOwner';
    SBGridProperties.id = 'grdApcInvestmentByOwner';
    SBGridProperties.jsonref = 'jsonApcInvestment';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.allowcopy = true;
    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
			standard: [0],
			sum: [1,2,4,5],
			//avg: [3,6]
			custom: [3,6],
			customFunc: function(colId, row) {

				let sumCol = "";
				let cntCol = "";
				switch (colId) {
					case "ivstAvgPrivate":
						sumCol = "ivstAmtPrivate";
						cntCol = "cntPrivate";
						break;
					case "ivstAvgPublic":
						sumCol = "ivstAmtPublic";
						cntCol = "cntPublic";
						break;
				}

				let sum = parseInt(row[sumCol]) || 0;
				let cnt = parseInt(row[cntCol]) || 0;

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
			6: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{
			caption : ["구분","구분"],
			ref: 'totOgnzTypeNm',
			type: 'output',
			width:'16%',
			style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
		},
    	{
			caption : ["민간 APC","개소 수"],
			ref: 'cntPrivate',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["민간 APC","투자금액"],
			ref: 'ivstAmtPrivate',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["민간 APC","평균투자액"],
			ref: 'ivstAvgPrivate',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["공공 APC","개소 수"],
			ref: 'cntPublic',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["공공 APC","투자금액"],
			ref: 'ivstAmtPublic',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["공공 APC","평균투자액"],
			ref: 'ivstAvgPublic',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		}
    ];
	grdApcInvestmentByOwner = _SBGrid.create(SBGridProperties);
}

/**
 * @name fn_createGridApcInvestmentByOper
 * @description 1.3.투자금액 - 운영자
 * @function
 */
const fn_createGridApcInvestmentByOper = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdApcInvestmentByOper';
    SBGridProperties.id = 'grdApcInvestmentByOper';
    SBGridProperties.jsonref = 'jsonApcInvestment';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.allowcopy = true;
    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
			standard: [0],
			sum: [1,2,4,5],
			//avg: [3,6]
			custom: [3,6],
			customFunc: function(colId, row) {

				let sumCol = "";
				let cntCol = "";
				switch (colId) {
					case "ivstAvgCoo":
						sumCol = "ivstAmtCoo";
						cntCol = "cntCoo";
						break;
					case "ivstAvgCmp":
						sumCol = "ivstAmtCmp";
						cntCol = "cntCmp";
						break;
				}

				let sum = parseInt(row[sumCol]) || 0;
				let cnt = parseInt(row[cntCol]) || 0;

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
			6: '#,###'
		}
	};
    SBGridProperties.columns = [
    	{
			caption : ["구분","구분"],
			ref: 'totOgnzTypeNm',
			type: 'output',
			width:'16%',
			style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
		},
    	{
			caption : ["농 협","개소 수"],
			ref: 'cntCoo',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["농 협","투자금액"],
			ref: 'ivstAmtCoo',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["농 협","평균투자액"],
			ref: 'ivstAvgCoo',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["농업법인","개소 수"],
			ref: 'cntCmp',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["농업법인","투자금액"],
			ref: 'ivstAmtCmp',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		},
    	{
			caption : ["농업법인","평균투자액"],
			ref: 'ivstAvgCmp',
			type: 'output',
			datatype: 'number',
			width:'14%',
			style: 'text-align:right; padding-right:5px;',
			format : {type:'number', rule:'#,###'}
		}
    ];
	grdApcInvestmentByOper = _SBGrid.create(SBGridProperties);
}
</script>
</html>