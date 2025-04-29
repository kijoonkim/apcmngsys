<%
	/**
	 * @Class Name : mdRtlFcltRgnNow.jsp
	 * @Description : APC전수조사 현황 - 2. 지역별 산지유통시설현황
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
    <title>title : 2. 산지유통시설 지역별 현황</title>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-body">
			<div class="box-header" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> 2. 산지유통시설 지역별 현황</h3>
				</div>
			</div>
			<div class="box-header no-print" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<span style="font-weight: 600; font-size:15px; color:black;">2.1. 산지유통시설 개소수</span>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">지역별 개소수 : 산지유통조직 유형</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소)</span>
						</div>
					</div>
					<div id="sb-area-grdApcSpotByCtpv" style="height:338px;"></div>
				</div>
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">지역별 개소수 : 운영자</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소)</span>
						</div>
					</div>
					<div id="sb-area-grdApcSpotByOperByCtpv" style="height:338px;"></div>
				</div>
			</div>
			<div class="box-header no-print" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<span style="font-weight: 600; font-size:15px; color:black;">2.2. 산지유통시설 시설·장비</span>
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
					<div id="sb-area-grdApcAreaSizeByCtpv" style="height:338px;"></div>
					<span style="font-size:11px;">*물류시설, 상품회사설, 저장고 등 건축면적의 합계</span><br/>
					<span style="font-size:11px;">*면적 소수점 이하 미표기</span>
				</div>
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">물류·상품화 시설</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소,m²)</span>
						</div>
					</div>
					<div id="sb-area-grdApcLgstcsGdsByCtpv" style="height:338px;"></div>
					<span style="font-size:11px;">*물류ㆍ상품화 시설: 집출하, 선별, 포장, 신선편의, 반가공 등 처리시설</span><br/>
					<span style="font-size:11px;">*전체면적: APC 전체 물류 및 상품화 시설</span><br/>
					<span style="font-size:11px;">*평균면적: APC 개소당 물류 및 상품화 시설</span>
				</div>
			</div>
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
					<div id="sb-area-grdApcStrgLwtpByCtpv" style="height:338px;"></div>
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
					<div id="sb-area-grdApcStrgPrcPlcByCtpv" style="height:338px;"></div>
					<span style="font-size:11px;">*예냉시설:  수확 후 또는 운송 이전에 농산물의 품온을 짧은 시간 내에 적정온도로 냉각하는 시설</span>
				</div>
			</div>
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
					<div id="sb-area-grdApcStrgCaByCtpv" style="height:338px;"></div>
					<span style="font-size:11px;">*CA저장 시설 : Controlled Atmosphere Storage(기체조절 저장고)로 장기저장 과일의 신선도 유지 시설</span>
				</div>
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">선별기·측정장비 설치 개소 수</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소,m²)</span>
						</div>
					</div>
					<div id="sb-area-grdApcInstalledEquipmentByCtpv" style="height:338px;"></div>
					<span style="font-size:11px;">*선별기 : 선별(grading&sorting)시설 본체</span><br/>
					<span style="font-size:11px;">*측정장비 : 당도·색택·내부손상 등 세부 품질 측정장비(선별기에 부착)</span><br/>
					<span style="font-size:11px;">*반가공시설 : 신선편의처리, 마늘건조, 깐마늘, 고추건조 등</span>
				</div>
			</div>
			<div class="box-header no-print" style="display:flex; justify-content: flex-start; padding-left:5px;" >
				<div>
					<span style="font-weight: 600; font-size:15px; color:black;">2.3. 지역별 투자금액</span>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">지역별 투자금액 : 전체</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소,백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdApcInvestmentByCtpv" style="height:338px;"></div>
				</div>
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">지역별 투자금액 : 소유자</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소,백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdApcInvestmentByOwnerByCtpv" style="height:338px;"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="_grid_header">
						<div class="_grid_header_l">
							<span class="_grid_header_hl">지역별 투자금액 : 운영자</span>
						</div>
						<div class="_grid_header_r">
							<span>(단위:개소,백만원)</span>
						</div>
					</div>
					<div id="sb-area-grdApcInvestmentByOperByCtpv" style="height:338px;"></div>
				</div>
				<div class="col-sm-6">
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
	var grdApcSpotByCtpv = null;
	var grdApcSpotByOperByCtpv = null;
	var grdApcAreaSizeByCtpv = null;
	var grdApcLgstcsGdsByCtpv = null;
	var grdApcStrgLwtpByCtpv = null;
	var grdApcStrgPrcPlcByCtpv = null;
	var grdApcStrgCaByCtpv = null;
	var grdApcInstalledEquipmentByCtpv = null;

	var grdApcInvestmentByCtpv = null;
	var grdApcInvestmentByOwnerByCtpv = null;
	var grdApcInvestmentByOperByCtpv = null;

	/**
	 * JSON DATA
	 */
	var jsonApcSpotByCtpv 				= [];
	var jsonApcAreaSizeByCtpv 			= [];
	var jsonApcInstalledEquipmentByCtpv = [];
	var jsonApcInvestmentByCtpv 		= [];

	/**
	 * @name fn_clearApcFcltTotJsonByCtpv
	 * @description 2. 지역별 APC 시설 집계 조회 그리드 데이터 정리
	 * @function
	 */
	const fn_clearApcFcltTotJsonByCtpv = function() {
		jsonApcSpotByCtpv.length = 0;
		jsonApcAreaSizeByCtpv.length = 0;
		jsonApcInstalledEquipmentByCtpv.length = 0;
		jsonApcInvestmentByCtpv.length = 0;
	}

	/**
	 * @name fn_rebuildApcFcltTotGridByCtpv
	 * @description 2. 지역별 시설 집계 조회 그리드 Rebuild
	 * @function
	 */
	const fn_rebuildApcFcltTotGridByCtpv = function() {
		grdApcSpotByCtpv.rebuild();
		grdApcSpotByOperByCtpv.rebuild();
		grdApcAreaSizeByCtpv.rebuild();
		grdApcLgstcsGdsByCtpv.rebuild();
		grdApcStrgLwtpByCtpv.rebuild();
		grdApcStrgPrcPlcByCtpv.rebuild();
		grdApcStrgCaByCtpv.rebuild();
		grdApcInstalledEquipmentByCtpv.rebuild();
		grdApcInvestmentByCtpv.rebuild();
		grdApcInvestmentByOwnerByCtpv.rebuild();
		grdApcInvestmentByOperByCtpv.rebuild();
	}

	/**
	 * @name fn_createGridApcFcltTotByCtpv
	 * @description 2. 지역별 APC 시설 집계 그리드 생성
	 * @function
	 */
	const fn_createGridApcFcltTotByCtpv = function() {
		fn_createGridApcSpotByCtpv();
		fn_createGridApcSpotByOperByCtpv();
		fn_createGridApcAreaSizeByCtpv();
		fn_createGridApcLgstcsGdsByCtpv();
		fn_createGridApcStrgLwtpByCtpv();
		fn_createGridApcStrgPrcPlcByCtpv();
		fn_createGridApcStrgCaByCtpv();
		fn_createGridApcInstalledEquipmentByCtpv();
		fn_createGridApcInvestmentByCtpv();
		fn_createGridApcInvestmentByOwnerByCtpv();
		fn_createGridApcInvestmentByOperByCtpv();
	}

	/**
	 * @name fn_setApcFcltTotGridByCtpv
	 * @description 2. 지역별 APC 시설 집계 조회
	 * @function
	 */
	const fn_setApcFcltTotGridByCtpv = async function() {

		try {
			const crtrYr = SBUxMethod.get("srch-slt-crtrYr");
			const postUrl = "/fm/fclt/selectApcFcltTotListByCtpv.do";

			fn_clearApcFcltTotJsonByCtpv();

			const postJsonPromise = gfn_postJSON(postUrl, {crtrYr: crtrYr});
			const data = await postJsonPromise;

			if (!_.isEqual("S", data.resultStatus)) {
				gfn_comAlert(data.resultCode, data.resultMessage);
				return;
			}

			/**
			 * 	apcSpotListByCtpv
			 * 	apcAreaSizeListByCtpv
			 * 	apcInstalledEquipmentListByCtpv
			 * 	apcInvestmentListByCtpv
			 */

			if (!gfn_isEmpty(data.apcSpotListByCtpv)) {
				data.apcSpotListByCtpv.forEach(item => {
					jsonApcSpotByCtpv.push(item);
				});
			}
			if (!gfn_isEmpty(data.apcAreaSizeListByCtpv)) {
				data.apcAreaSizeListByCtpv.forEach(item => {
					jsonApcAreaSizeByCtpv.push(item);
				});
			}
			if (!gfn_isEmpty(data.apcInstalledEquipmentListByCtpv)) {
				data.apcInstalledEquipmentListByCtpv.forEach(item => {
					jsonApcInstalledEquipmentByCtpv.push(item);
				});
			}
			if (!gfn_isEmpty(data.apcInvestmentListByCtpv)) {
				data.apcInvestmentListByCtpv.forEach(item => {
					jsonApcInvestmentByCtpv.push(item);
				});
			}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		} finally {
			fn_rebuildApcFcltTotGridByCtpv();
		}
	}

	/**
	 * @name fn_createGridApcSpotByCtpv
	 * @description 2.1. 산지유통시설 개소수- 지역별 개소수 : 산지유통조직 유형
	 * @function
	 */
	const fn_createGridApcSpotByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcSpotByCtpv';
		SBGridProperties.id = 'grdApcSpotByCtpv';
		SBGridProperties.jsonref = 'jsonApcSpotByCtpv';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.allowcopy = true;
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
				stylestartcol: 0
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
			{
				caption : ["구분","구분"],
				ref: 'ctpvNm',
				type: 'output',
				width:'13%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
			},
			{
				caption : ["통합조직 운영 APC","민간"],
				ref: 'cntUoPrivate',
				type: 'output',
				datatype: 'number',
				width:'12%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["통합조직 운영 APC","공공"],
				ref: 'cntUoPublic',
				type: 'output',
				datatype: 'number',
				width:'12%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["개발조직 운영 APC","민간"],
				ref: 'cntPoPrivate',
				type: 'output',
				datatype: 'number',
				width:'12%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["개발조직 운영 APC","공공"],
				ref: 'cntPoPublic',
				type: 'output',
				datatype: 'number',
				width:'12%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["소 계","민간"],
				ref: 'cntPrivate',
				type: 'output',
				datatype: 'number',
				width:'12%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["소 계","공공"],
				ref: 'cntPublic',
				type: 'output',
				datatype: 'number',
				width:'12%',
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
		grdApcSpotByCtpv = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridApcSpotByOperByCtpv
	 * @description 2.1.산지유통시설 - 개소수: 운영자
	 * @function
	 */
	const fn_createGridApcSpotByOperByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcSpotByOperByCtpv';
		SBGridProperties.id = 'grdApcSpotByOperByCtpv';
		SBGridProperties.jsonref = 'jsonApcSpotByCtpv';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.allowcopy = true;
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
				stylestartcol: 0
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
			{
				caption : ["구분","구분"],
				ref: 'ctpvNm',
				type: 'output',
				width:'13%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'},
			{
				caption : ["통합조직 운영 APC","농 협"],
				ref: 'cntUoCoo',
				type: 'output',
				datatype: 'number',
				width:'12%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["통합조직 운영 APC","농업법인"],
				ref: 'cntUoCmp',
				type: 'output',
				datatype: 'number',
				width:'12%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["개발조직 운영 APC","농 협"],
				ref: 'cntPoCoo',
				type: 'output',
				datatype: 'number',
				width:'12%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["개발조직 운영 APC","농업법인"],
				ref: 'cntPoCmp',
				type: 'output',
				datatype: 'number',
				width:'12%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["소 계","농 협"],
				ref: 'cntCoo',
				type: 'output',
				width:'12%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["소 계","농업법인"],
				ref: 'cntCmp',
				type: 'output',
				datatype: 'number',
				width:'12%',
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
		grdApcSpotByOperByCtpv = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridApcAreaSizeByCtpv
	 * @description 2.2. 산지유통시설 시설ㆍ장비 - 총 건축면적
	 * @function
	 */
	const fn_createGridApcAreaSizeByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcAreaSizeByCtpv';
		SBGridProperties.id = 'grdApcAreaSizeByCtpv';
		SBGridProperties.jsonref = 'jsonApcAreaSizeByCtpv';
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
				custom: [2,4,6],
				customFunc: function(colId, row) {

					let sumCol = "";
					let cntCol = "";

					switch (colId) {
						case "cspTotAreaAvgUo":
							sumCol = "cspTotAreaUo";
							cntCol = "cntUo";
							break;

						case "cspTotAreaAvgPo":
							sumCol = "cspTotAreaPo";
							cntCol = "cntPo";
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
				ref: 'ctpvNm',
				type: 'output',
				width:'16%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
			},
			{
				caption : ["통합조직 운영 APC","전체면적"],
				ref: 'cspTotAreaUo',
				type: 'output',
				datatype: 'number',
				width:'14%',
				tyle: 'text-align:right; padding-right:5px;' ,
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["통합조직 운영 APC","평균면적"],
				ref: 'cspTotAreaAvgUo',
				type: 'output',
				datatype: 'number',
				width:'14%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["개별조직 운영 APC","전체면적"],
				ref: 'cspTotAreaPo',
				type: 'output',
				datatype: 'number',
				width:'14%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["개별조직 운영 APC","평균면적"],
				ref: 'cspTotAreaAvgPo',
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
				ref: 'cntUo',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format: {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				ref: 'cntPo',
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
		grdApcAreaSizeByCtpv = _SBGrid.create(SBGridProperties);
	}
	/**
	 * @name fn_createGridApcLgstcsGdsByCtpv
	 * @description 2.2. 산지유통시설 시설·장비 - 물류·상품화 시설
	 * @function
	 */
	const fn_createGridApcLgstcsGdsByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcLgstcsGdsByCtpv';
		SBGridProperties.id = 'grdApcLgstcsGdsByCtpv';
		SBGridProperties.jsonref = 'jsonApcAreaSizeByCtpv';
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
				//avg: [2,4,6]
				custom: [2,4,6],
				customFunc: function(colId, row) {
					let sumCol = "";
					let cntCol = "";
					switch (colId) {
						case "cspGdsAreaAvgUo":
							sumCol = "cspGdsAreaUo";
							cntCol = "cntUo";
							break;
						case "cspGdsAreaAvgPo":
							sumCol = "cspGdsAreaPo";
							cntCol = "cntPo";
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
				6: '#,###'
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'ctpvNm',
				type: 'output',
				width:'13%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
			},
			{
				caption : ["통합조직 운영 APC","전체면적"],
				ref: 'cspGdsAreaUo',
				type: 'output',
				width:'13%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["통합조직 운영 APC","평균면적"],
				ref: 'cspGdsAreaAvgUo',
				type: 'output',
				width:'13%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["개발조직 운영 APC","전체면적"],
				ref: 'cspGdsAreaPo',
				type: 'output',
				width:'13%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["개발조직 운영 APC","평균면적"],
				ref: 'cspGdsAreaAvgPo',
				type: 'output',
				width:'13%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["전체","전체면적"],
				ref: 'cspGdsArea',
				type: 'output',
				width:'17.5%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["전체","평균면적"],
				ref: 'cspGdsAreaAvg',
				type: 'output',
				width:'17.5%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				ref: 'cntUo',
				type: 'output',
				datatype: 'number',
				style: 'text-align:right; padding-right:5px;',
				format: {type:'number', rule:'#,###'},
				hidden: true
			},
			{
				ref: 'cntPo',
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
		grdApcLgstcsGdsByCtpv = _SBGrid.create(SBGridProperties);
	}
	/**
	 * @name fn_createGridApcStrgLwtpByCtpv
	 * @description 2.2. 산지유통시설 시설·장비 - 저온저장고
	 * @function
	 */
	const fn_createGridApcStrgLwtpByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcStrgLwtpByCtpv';
		SBGridProperties.id = 'grdApcStrgLwtpByCtpv';
		SBGridProperties.jsonref = 'jsonApcAreaSizeByCtpv';
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
				//avg: [4]
				custom: [4],
				customFunc: function(colId, row) {

					let sumCol = "strgLwtpArea";
					let cntCol = "strgLwtpCnt";

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
				4: '#,###'
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'ctpvNm',
				type: 'output',
				width:'13%', style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
			},
			{
				caption : ["설치현황","전체 개소수"],
				ref: 'cntApc',
				type: 'output',
				datatype: 'number',
				width:'21.75%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["설치현황","설치 개소수"],
				ref: 'strgLwtpCnt',
				type: 'output',
				datatype: 'number',
				width:'21.75%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["저온저장고(면적)","전체면적"],
				ref: 'strgLwtpArea',
				type: 'output',
				datatype: 'number',
				width:'21.75%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["저온저장고(면적)","평균면적"],
				ref: 'strgLwtpAreaAvg',
				type: 'output',
				datatype: 'number',
				width:'21.75%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			}
		];
		grdApcStrgLwtpByCtpv = _SBGrid.create(SBGridProperties);
	}
	/**
	 * @name fn_createGridApcStrgPrcPlcByCtpv
	 * @description 2.2. 지역별 산지유통시설 시설·장비 - 예냉시설
	 * @function
	 */
	const fn_createGridApcStrgPrcPlcByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcStrgPrcPlcByCtpv';
		SBGridProperties.id = 'grdApcStrgPrcPlcByCtpv';
		SBGridProperties.jsonref = 'jsonApcAreaSizeByCtpv';
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

					let sumCol = "strgPrcPlcArea";
					let cntCol = "strgPrcPlcCnt";

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
				4: '#,###'
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'ctpvNm',
				type: 'output',
				width:'20%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
			},
			{
				caption : ["설치현황","전체 개소수"],
				ref: 'cntApc',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}},
			{
				caption : ["설치현황","설치 개소수"],
				ref: 'strgPrcPlcCnt',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}},
			{
				caption : ["예냉시설(면적)","전체면적"],
				ref: 'strgPrcPlcArea',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}},
			{
				caption : ["예냉시설(면적)","평균면적"],
				ref: 'strgPrcPlcAreaAvg',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}}
		];
		grdApcStrgPrcPlcByCtpv = _SBGrid.create(SBGridProperties);
	}
	/**
	 * @name fn_createGridApcStrgCaByCtpv
	 * @description 2.2. 지역별 산지유통시설 시설·장비 - CA저장시설
	 * @function
	 */
	const fn_createGridApcStrgCaByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcStrgCaByCtpv';
		SBGridProperties.id = 'grdApcStrgCaByCtpv';
		SBGridProperties.jsonref = 'jsonApcAreaSizeByCtpv';
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

					let sumCol = "strgCaArea";
					let cntCol = "strgCaCnt";

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
				4: '#,###'
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'ctpvNm',
				type: 'output',
				width:'20%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'},
			{
				caption : ["설치현황","전체 개소수"],
				ref: 'cntApc',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["설치현황","설치 개소수"],
				ref: 'strgCaCnt',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["CA저장고(면적)","전체면적"],
				ref: 'strgCaArea',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["CA저장고(면적)","평균면적"],
				ref: 'strgCaAreaAvg',
				type: 'output',
				datatype: 'number',
				width:'20%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			}
		];
		grdApcStrgCaByCtpv = _SBGrid.create(SBGridProperties);
	}
	/**
	 * @name fn_createGridApcInstalledEquipmentByCtpv
	 * @description 2.2. 지역별 산지유통시설 시설·장비 - 선별기·측정장비 설치 개소 수
	 * @function
	 */
	const fn_createGridApcInstalledEquipmentByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcInstalledEquipmentByCtpv';
		SBGridProperties.id = 'grdApcInstalledEquipmentByCtpv';
		SBGridProperties.jsonref = 'jsonApcInstalledEquipmentByCtpv';
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
				ref: 'ctpvNm',
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
		grdApcInstalledEquipmentByCtpv = _SBGrid.create(SBGridProperties);
	}
	/**
	 * @name fn_createGridApcInvestmentByCtpv
	 * @description 2.3. 지역별 투자금액 - 전체
	 * @function
	 */
	const fn_createGridApcInvestmentByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcInvestmentByCtpv';
		SBGridProperties.id = 'grdApcInvestmentByCtpv';
		SBGridProperties.jsonref = 'jsonApcInvestmentByCtpv';
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
				//avg: [6]
				custom: [6],
				customFunc: function(colId, row) {

					let sumCol = "ivstAmt";
					let cntCol = "cntApc";

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
				6: '#,###'
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'ctpvNm',
				type: 'output',
				width:'14%',
				style: 'text-align:center; padding-right:5px; background-color:#F5FBFF'
			},
			{
				caption : ["개소수","개소수"],
				ref: 'cntApc',
				type: 'output',
				datatype: 'number',
				width:'14%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["투자금액","국비"],
				ref: 'ne',
				type: 'output',
				datatype: 'number',
				width:'14%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["투자금액","지방비"],
				ref: 'lcltExpnd',
				type: 'output',
				datatype: 'number',
				width:'14%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["투자금액","자부담"],
				ref: 'slfBrdn',
				type: 'output',
				datatype: 'number',
				width:'14%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["투자금액","계"],
				ref: 'ivstAmt',
				type: 'output',
				datatype: 'number',
				width:'14%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["평균투자금액","평균투자금액"],
				ref: 'ivstAvg',
				type: 'output',
				datatype: 'number',
				width:'16%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			}
		];
		grdApcInvestmentByCtpv = _SBGrid.create(SBGridProperties);
	}
	/**
	 * @name fn_createGridApcInvestmentByOwnerByCtpv
	 * @description 2.3. 지역별 투자금액 - 소유자
	 * @function
	 */
	const fn_createGridApcInvestmentByOwnerByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcInvestmentByOwnerByCtpv';
		SBGridProperties.id = 'grdApcInvestmentByOwnerByCtpv';
		SBGridProperties.jsonref = 'jsonApcInvestmentByCtpv';
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
				6: '#,###'
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'ctpvNm',
				type: 'output',
				width:'14%',
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
				width:'15%',
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
				width:'15%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			}
		];
		grdApcInvestmentByOwnerByCtpv = _SBGrid.create(SBGridProperties);
	}
	/**
	 * @name fn_createGridApcInvestmentByOperByCtpv
	 * @description 2.3. 지역별 투자금액 - 운영자
	 * @function
	 */
	const fn_createGridApcInvestmentByOperByCtpv = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcInvestmentByOperByCtpv';
		SBGridProperties.id = 'grdApcInvestmentByOperByCtpv';
		SBGridProperties.jsonref = 'jsonApcInvestmentByCtpv';
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
				6: '#,###'
			}
		};
		SBGridProperties.columns = [
			{
				caption : ["구분","구분"],
				ref: 'ctpvNm',
				type: 'output',
				width:'14%',
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
				width:'15%',
				style: 'text-align:right; padding-right:6px;', merge: false,
				format : {type:'number', rule:'#,###'}
			},
			{
				caption : ["농업법인"," 개소 수 "],
				ref: 'cntCmp',
				type: 'output',
				datatype: 'number',
				width:'14%',
				style: 'text-align:right; padding-right:5px;', merge: false,
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
				width:'15%',
				style: 'text-align:right; padding-right:5px;',
				format : {type:'number', rule:'#,###'}
			}
		];
		grdApcInvestmentByOperByCtpv = _SBGrid.create(SBGridProperties);
	}

</script>
</html>