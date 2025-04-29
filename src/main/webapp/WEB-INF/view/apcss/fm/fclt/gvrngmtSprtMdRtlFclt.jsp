
<%
	/**
	 * @Class Name : gvrngmtSprtMdRtlFclt.jsp
	 * @Description : APC전수조사 현황 - 3. 정부지원 산지유통시설현황
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
    <title>title : 3. 정부지원 산지유통시설 현황</title>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
	<div id="print-area" class="box box-solid">
		<div class="box-body">
			<div class="box-header no-print" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> 3. 정부지원 산지유통시설 현황</h3>
				</div>
			</div>
			<div class="box-header no-print" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<span style="font-weight: 600; font-size:15px; color:black;">3.1. 정부지원 산지유통시설 개소수</span>
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

					<div id="sb-area-grdGovApcSpot" style="height:258px;"></div>
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
					<div id="sb-area-grdGovApcSpotByOwnerOper" style="height:137px;"></div>
					<span style="font-size:11px;">*민간: 농협, 농업법인, 재단법인 등 민간 사업자</span><br/>
					<span style="font-size:11px;">*공공: 시ㆍ군 지방자치단체</span>
				</div>
			</div>
			<div class="box-header no-print" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<span style="font-weight: 600; font-size:15px; color:black;">3.2. 정부지원 산지유통시설 시설ㆍ장비</span>
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
					<div id="sb-area-grdGovApcAreaSize" style="height:137px;"></div>
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
					<div id="sb-area-grdGovApcLgstcsGds" style="height:137px;"></div>
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
					<div id="sb-area-grdGovApcStrgLwtp" style="height:137px;"></div>
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
					<div id="sb-area-grdGovApcStrgPrcPlc" style="height:137px;"></div>
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
					<div id="sb-area-grdGovApcStrgCa" style="height:137px;"></div>
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
					<div id="sb-area-grdGovApcInstalledEquipment" style="height:137px;"></div>
					<span style="font-size:11px;">*선별기 : 선별(grading&sorting)시설 본체</span><br/>
					<span style="font-size:11px;">*측정장비 : 당도·색택·내부손상 등 세부 품질 측정장비(선별기에 부착)</span><br/>
					<span style="font-size:11px;">*반가공시설 : 신선편의처리, 마늘건조, 깐마늘, 고추건조 등</span>
				</div>
			</div>
			<div class="box-header no-print" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<span style="font-weight: 600; font-size:15px; color:black;">3.3. 투자금액</span>
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
					<div id="sb-area-grdGovApcInvestment" style="height:137px;"></div>
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
					<div id="sb-area-grdGovApcInvestmentByType" style="height:137px;"></div>
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
					<div id="sb-area-grdGovApcInvestmentByOwner" style="height:137px;"></div>
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
					<div id="sb-area-grdGovApcInvestmentByOper" style="height:137px;"></div>
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
	var grdGovApcSpot = null;
	var grdGovApcSpotByOwnerOper = null;
	var grdGovApcAreaSize = null;
	var grdGovApcLgstcsGds = null;
	var grdGovApcStrgLwtp = null;
	var grdGovApcStrgPrcPlc = null;
	var grdGovApcStrgCa = null;
	var grdGovApcInstalledEquipment = null;
	var grdGovApcInvestment = null;
	var grdGovApcInvestmentByType = null;
	var grdGovApcInvestmentByOwner = null;
	var grdGovApcInvestmentByOper = null;

	/**
	 * JSON DATA
	 */
	var jsonGovApcSpot 				= [];
	var jsonGovApcSpotByOwnerOper 		= [];
	var jsonGovApcAreaSize 			= [];
	var jsonGovApcInstalledEquipment 	= [];
	var jsonGovApcInvestment 			= [];

	/**
	 * @name fn_clearGovApcFcltTotJson
	 * @description 3. 정부지원 APC 시설 집계 조회 그리드 데이터 정리
	 * @function
	 */
	const fn_clearGovApcFcltTotJson = function() {
		jsonGovApcSpot.length = 0;
		jsonGovApcSpotByOwnerOper.length = 0;
		jsonGovApcAreaSize.length = 0;
		jsonGovApcInstalledEquipment.length = 0;
		jsonGovApcInvestment.length = 0;
	}

	/**
	 * @name fn_rebuildGovApcFcltTotGrid
	 * @description 3. 정부지원 APC 시설 집계 조회 그리드 Rebuild
	 * @function
	 */
	const fn_rebuildGovApcFcltTotGrid = function() {
		grdGovApcSpot.rebuild();
		grdGovApcSpotByOwnerOper.rebuild();
		grdGovApcAreaSize.rebuild();
		grdGovApcLgstcsGds.rebuild();
		grdGovApcStrgLwtp.rebuild();
		grdGovApcStrgPrcPlc.rebuild();
		grdGovApcStrgCa.rebuild();
		grdGovApcInstalledEquipment.rebuild();
		grdGovApcInvestment.rebuild();
		grdGovApcInvestmentByType.rebuild();
		grdGovApcInvestmentByOwner.rebuild();
		grdGovApcInvestmentByOper.rebuild();

		fn_setDetailGovApcFcltTotGrid();
	}

	const fn_setDetailGovApcFcltTotGrid = function() {
		grdGovApcSpot.setCellStyle('background-color',0,0,8,2,'#F5FBFF');
		grdGovApcSpot.setRowStyles(9, 'background-color: #CEEBFF; font-weight: bold; color: #0060b3', 'all', true);
	}

	/**
	 * @name fn_createGridGovApcFcltTot
	 * @description 3. 정부지원 APC 시설 집계 그리드 생성
	 * @function
	 */
	const fn_createGridGovApcFcltTot = function() {
		fn_createGridGovApcSpot();
		fn_createGridGovApcSpotByOwnerOper();
		fn_createGridGovApcAreaSize();
		fn_createGridGovApcLgstcsGds();
		fn_createGridGovApcStrgLwtp();
		fn_createGridGovApcStrgPrcPlc();
		fn_createGridGovApcStrgCa();
		fn_createGridGovApcInstalledEquipment();
		fn_createGridGovApcInvestment();
		fn_createGridGovApcInvestmentByType();
		fn_createGridGovApcInvestmentByOwner();
		fn_createGridGovApcInvestmentByOper();
	}

	/**
	 * @name fn_setGovApcFcltTotGrid
	 * @description 3. 정부지원 APC 시설 집계 조회
	 * @function
	 */
	const fn_setGovApcFcltTotGrid = async function() {

		try {
			const crtrYr = SBUxMethod.get("srch-slt-crtrYr");
			const postUrl = "/fm/fclt/selectGovApcFcltTotList.do";

			fn_clearGovApcFcltTotJson();

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
					jsonGovApcSpot.push(item);
				});
			}
			if (!gfn_isEmpty(data.apcSpotListByOwnerOper)) {
				data.apcSpotListByOwnerOper.forEach(item => {
					jsonGovApcSpotByOwnerOper.push(item);
				});
			}
			if (!gfn_isEmpty(data.apcAreaSizeList)) {
				data.apcAreaSizeList.forEach(item => {
					jsonGovApcAreaSize.push(item);
				});
			}
			if (!gfn_isEmpty(data.apcInstalledEquipmentList)) {
				data.apcInstalledEquipmentList.forEach(item => {
					jsonGovApcInstalledEquipment.push(item);
				});
			}
			if (!gfn_isEmpty(data.apcInvestmentList)) {
				data.apcInvestmentList.forEach(item => {
					jsonGovApcInvestment.push(item);
				});
			}
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		} finally {
			fn_rebuildGovApcFcltTotGrid();
		}
	}

	/**
	 * @name fn_createGridGovApcSpot
	 * @description 3.1. 산지유통시설 개소수:산지유통조직 유형
	 * @function
	 */
	const fn_createGridGovApcSpot = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovApcSpot';
		SBGridProperties.id = 'grdGovApcSpot';
		SBGridProperties.jsonref = 'jsonGovApcSpot';
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
		grdGovApcSpot = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridGovApcSpotByOwnerOper
	 * @description 3.1. 산지유통시설 개소수:소유자및운영자
	 * @function
	 */
	const fn_createGridGovApcSpotByOwnerOper = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovApcSpotByOwnerOper';
		SBGridProperties.id = 'grdGovApcSpotByOwnerOper';
		SBGridProperties.jsonref = 'jsonGovApcSpotByOwnerOper';
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
		grdGovApcSpotByOwnerOper = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridGovApcAreaSize
	 * @description 3.2. 산지유통시설 시설ㆍ장비 - 면적
	 * @function
	 */
	const fn_createGridGovApcAreaSize = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovApcAreaSize';
		SBGridProperties.id = 'grdGovApcAreaSize';
		SBGridProperties.jsonref = 'jsonGovApcAreaSize';
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
		grdGovApcAreaSize = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridGovApcLgstcsGds
	 * @description 3.2. 산지유통시설 시설ㆍ장비 - 물류ㆍ상품화 시설(건축면적)
	 * @function
	 */
	const fn_createGridGovApcLgstcsGds = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovApcLgstcsGds';
		SBGridProperties.id = 'grdGovApcLgstcsGds';
		SBGridProperties.jsonref = 'jsonGovApcAreaSize';
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
		grdGovApcLgstcsGds = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridGovApcStrgLwtp
	 * @description 3.2. 산지유통시설 시설ㆍ장비 - 저온저장고
	 * @function
	 */
	const fn_createGridGovApcStrgLwtp = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovApcStrgLwtp';
		SBGridProperties.id = 'grdGovApcStrgLwtp';
		SBGridProperties.jsonref = 'jsonGovApcAreaSize';
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
		grdGovApcStrgLwtp = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridGovApcStrgPrcPlc
	 * @description 3.2. 산지유통시설 시설ㆍ장비 - 예냉시설
	 * @function
	 */
	const fn_createGridGovApcStrgPrcPlc = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovApcStrgPrcPlc';
		SBGridProperties.id = 'grdGovApcStrgPrcPlc';
		SBGridProperties.jsonref = 'jsonGovApcAreaSize';
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
		grdGovApcStrgPrcPlc = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridGovApcStrgCa
	 * @description 3.2. 산지유통시설 시설ㆍ장비 - CA 저장시설
	 * @function
	 */
	const fn_createGridGovApcStrgCa = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovApcStrgCa';
		SBGridProperties.id = 'grdGovApcStrgCa';
		SBGridProperties.jsonref = 'jsonGovApcAreaSize';
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
		grdGovApcStrgCa = _SBGrid.create(SBGridProperties);
	}


	/**
	 * @name fn_createGridGovApcInstalledEquipment
	 * @description 3.2. 산지유통시설 시설ㆍ장비 - 선별기·측정장비 설치 개소 수
	 * @function
	 */
	const fn_createGridGovApcInstalledEquipment = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovApcInstalledEquipment';
		SBGridProperties.id = 'grdGovApcInstalledEquipment';
		SBGridProperties.jsonref = 'jsonGovApcInstalledEquipment';
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
		grdGovApcInstalledEquipment = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridGovApcInvestment
	 * @description 3.3.투자금액 - 전체
	 * @function
	 */
	const fn_createGridGovApcInvestment = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovApcInvestment';
		SBGridProperties.id = 'grdGovApcInvestment';
		SBGridProperties.jsonref = 'jsonGovApcInvestment';
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
		grdGovApcInvestment = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridGovApcInvestmentByType
	 * @description 3.3.투자금액 - 자금 유형
	 * @function
	 */
	const fn_createGridGovApcInvestmentByType = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovApcInvestmentByType';
		SBGridProperties.id = 'grdGovApcInvestmentByType';
		SBGridProperties.jsonref = 'jsonGovApcInvestment';
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
		grdGovApcInvestmentByType = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridGovApcInvestmentByOwner
	 * @description 3.3.투자금액 - 소유자
	 * @function
	 */
	const fn_createGridGovApcInvestmentByOwner = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovApcInvestmentByOwner';
		SBGridProperties.id = 'grdGovApcInvestmentByOwner';
		SBGridProperties.jsonref = 'jsonGovApcInvestment';
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
		grdGovApcInvestmentByOwner = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridGovApcInvestmentByOper
	 * @description 3.3.투자금액 - 운영자
	 * @function
	 */
	const fn_createGridGovApcInvestmentByOper = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdGovApcInvestmentByOper';
		SBGridProperties.id = 'grdGovApcInvestmentByOper';
		SBGridProperties.jsonref = 'jsonGovApcInvestment';
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
		grdGovApcInvestmentByOper = _SBGrid.create(SBGridProperties);
	}

</script>
</html>