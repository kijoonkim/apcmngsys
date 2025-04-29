<%
	/**
	 * @Class Name : map.jsp
	 * @Description : APC전수조사 현황 - 요약
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
	<title>title : SBUx2.6</title>
	<style>
		.boxbox {
			display: flex;
			width: 100%;
		}

		.box1 {
			flex: 8;
		}

		.box2 {
			flex: 2;
			padding-right: 30px;
		}

	</style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-body">
			<div class ="row">
				<div class="col-sm-8 col-md-9">
					<div class="ad_tbl_top" style="padding-right: 60px;">
						<ul class="ad_tbl_count">
							<li><span>전수조사 집계현황</span></li>
						</ul>
						<!--<sbux-radio id="rdo_json" name="rdo_json" uitype="hidden" jsondata-ref="radioJsonData" >
                        </sbux-radio>
                        -->
					</div>
					<div id="sb-area-grdApcTot" style="width:97.5%;height:310px;"></div>
				</div>
				<div class="col-sm-4 col-md-3">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>지역별현황</span></li>
						</ul>
					</div>
					<div id="sb-area-grdApcTotByCtpv" style="width:97.5%;height:310px;"></div>
				</div>
			</div>
			<div class ="row no-print">
				<div class="col-sm-6">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>APC현황</span></li>
						</ul>
					</div>
					<div class ="row">
						<div id="mapchart" style="width:98%;height:610px;"></div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>APC지역현황</span></li>
						</ul>
					</div>
					<div id="sb-area-grdApcAreaByCtpv" style="width:95%;height:610px;"></div>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
<script type="text/javascript">

	var mapApcSttn = [];

	var grdApcTot = null;
	var grdApcTotByCtpv = null;
	var grdApcAreaByCtpv = null;

	var jsonApcTot = [];
	var jsonApcTotByCtpv = [];
	var jsonApcAreaByCtpv = [];
	var jsonApcArea = [];


	var radioJsonData = [
		{ text : "개소"  , value : "01", checked : "checked"},
		{ text : "면적"  , value : "02"  },
		{ text : "취급액"  , value : "03"   }
	];

	/**
	 * @name fn_createGridApc
	 * @description APC 그리드 생성
	 * @function
	 */
	const fn_createGridApc = function() {
		fn_createGridApcTot();
		fn_createGridApcTotByCtpv();
		fn_createGridApcAreaByCtpv();
	}

	const fn_setApcTot = async function() {
		let rst = await Promise.all([
			fn_setApcTotGrid(),
			fn_setApcTotByCtpv(),
			fn_setApcAreaByCtpv(),
		]);
	}

	/**
	 * @name fn_setApcTotGrid
	 * @description APC 집계현황 그리드 데이터 설정
	 * @function
	 */
	const fn_setApcTotGrid = async function(){
		jsonApcTot.length = 0;
		try {
			const crtrYr = SBUxMethod.get("srch-slt-crtrYr");
			const postUrl = "/fm/fclt/selectApcTotSmmryList.do";
			const postJsonPromise = gfn_postJSON(postUrl, {
				crtrYr			: crtrYr
			});
			const data = await postJsonPromise;
			if (!_.isEqual("S", data.resultStatus)) {
				gfn_comAlert(data.resultCode, data.resultMessage);
				return;
			}

			if (!gfn_isEmpty(data.resultList)) {
				data.resultList.forEach(item => {
					jsonApcTot.push(item);
				});
			}
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
		grdApcTot.rebuild();
	}

	/**
	 * @name fn_setApcTotByCtpv
	 * @description APC 지역별 개소수
	 * @function
	 */
	const fn_setApcTotByCtpv = async function(){

		jsonApcArea.length = 0;
		jsonApcTotByCtpv.length = 0;

		try {
			let crtrYr = SBUxMethod.get("srch-slt-crtrYr");
			const postUrl = "/fm/fclt/selectApcTotSmmryListByCtpv.do";
			const postJsonPromise = gfn_postJSON(postUrl, {
				crtrYr			: crtrYr
			});

			const data = await postJsonPromise;
			if (!_.isEqual("S", data.resultStatus)) {
				gfn_comAlert(data.resultCode, data.resultMessage);
				return;
			}

			if (!gfn_isEmpty(data.resultList)) {
				data.resultList.forEach(item => {
					jsonApcArea.push(item);
				});
			}

		} catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}

			console.error("failed", e.message);
		}

		jsonApcArea.forEach(item => {
			let existCtpv = false;
			for ( let i=0; i<jsonApcTotByCtpv.length; i++) {
				if (_.isEqual(item.ctpvNm, jsonApcTotByCtpv[i].ctpvNm)) {
					jsonApcTotByCtpv[i].cntApc += item.cntApc;
					existCtpv = true;
					break;
				}
			}
			if (!existCtpv) {
				jsonApcTotByCtpv.push(item);
			}
		});

		fn_createMapChart();
		grdApcTotByCtpv.rebuild();
	}

	/**
	 * @name fn_setApcAreaByCtpv
	 * @description APC 지역현황 그리드 데이터 설정
	 * @param {String} _extrCtpvCd
	 * @function
	 */
	const fn_setApcAreaByCtpv = async function(_extrCtpvCd){

		jsonApcAreaByCtpv.length = 0;

		try {
			const ctpvCd = fn_convertCtpv(_extrCtpvCd);
			const crtrYr = SBUxMethod.get("srch-slt-crtrYr");
			const postUrl = "/fm/fclt/selectApcListByCtpv.do";
			const postJsonPromise = gfn_postJSON(postUrl, {
				crtrYr: crtrYr,
				ctpvCd: ctpvCd
			});

			const data = await postJsonPromise;
			if (!_.isEqual("S", data.resultStatus)) {
				gfn_comAlert(data.resultCode, data.resultMessage);
				return;
			}

			if (!gfn_isEmpty(data.resultList)) {
				data.resultList.forEach(item => {
					jsonApcAreaByCtpv.push(item);
				});
			}
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
		grdApcAreaByCtpv.rebuild();
	}

	/**
	 * @name fn_createGridApcTot
	 * @description APC 집계현황
	 * @function
	 */
	const fn_createGridApcTot = function(){
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcTot';
		SBGridProperties.id = 'grdApcTot';
		SBGridProperties.jsonref = 'jsonApcTot';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.allowcopy = true;
		SBGridProperties.mergecells = 'byrow';
		SBGridProperties.columns = [
			{
				caption: ['구분','구분','구분'],
				ref: 'cmsuTotArtclSeNm',
				width: '10%',
				type: 'output',
				style:'text-align: center'
			},
			{
				caption: ['통합조직','농협','승인형'],
				ref: 'cntUoCooAprv',
				width: '10%',
				type: 'output',
				datatype: 'number',
				style:'text-align: center',
				format : {type:'number', rule:'#,###'},
				merge :  false
			},
			{
				caption: ['통합조직','농협','육성형'],
				ref: 'cntUoCooUpbr',
				width: '10%',
				type: 'output',
				datatype: 'number',
				style:'text-align: center',
				format : {type:'number', rule:'#,###'},
				merge :  false
			},
			{
				caption: ['통합조직','농업법인','승인형'],
				ref: 'cntUoCmpAprv',
				width: '10%',
				type: 'output',
				datatype: 'number',
				style:'text-align: center',
				format : {type:'number', rule:'#,###'},
				merge :  false
			},
			{
				caption: ['통합조직','농업법인','육성형'],
				ref: 'cntUoCmpUpbr',
				width: '10%',
				type: 'output',
				datatype: 'number',
				style:'text-align: center',
				format : {type:'number', rule:'#,###'},
				merge :  false
			},
			{
				caption: ['개별조직','농협','승인형'],
				ref: 'cntPoCooAprv',
				width: '10%',
				type: 'output',
				datatype: 'number',
				style:'text-align: center',
				format : {type:'number', rule:'#,###'},
				merge :  false
			},
			{
				caption: ['개별조직','농협','육성형'],
				ref: 'cntPoCooUpbr',
				width: '10%',
				type: 'output',
				datatype: 'number',
				style:'text-align: center',
				format : {type:'number', rule:'#,###'},
				merge :  false
			},
			{
				caption: ['개별조직','농업법인','승인형'],
				ref: 'cntPoCmpAprv',
				width: '10%',
				type: 'output',
				datatype: 'number',
				style:'text-align: center',
				format : {type:'number', rule:'#,###'},
				merge :  false
			},
			{
				caption: ['개별조직','농업법인','육성형'],
				ref: 'cntPoCmpUpbr',
				width: '10%',
				type: 'output',
				style:'text-align: center',
				format : {type:'number', rule:'#,###'},
				merge :  false
			},
			{
				caption: ['합계','합계','합계'],
				ref: 'cntApc',
				width: '10%',
				type: 'output',
				style:'text-align: center',
				format : {type:'number', rule:'#,###'},
				merge :  false
			},
		];
		grdApcTot = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridApcTotByCtpv
	 * @description APC 지역별현황
	 * @function
	 */
	const fn_createGridApcTotByCtpv = function(){
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcTotByCtpv';
		SBGridProperties.id = 'grdApcTotByCtpv';
		SBGridProperties.jsonref = 'jsonApcTotByCtpv';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.allowcopy = true;
		SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
				standard: [0],
				sum: [1],
			},
			grandtotalrow : {
				titlecol: 0,
				titlevalue: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol: 0
			},
			totalformat: {
				1: '#,###'
			}
		};
		SBGridProperties.columns = [
			{
				caption: ['시도명'],
				ref: 'ctpvNm',
				width: '60%',
				type: 'output',
				style:'text-align: center'
			},
			{
				caption: ['개소 수'],
				ref: 'cntApc',
				width: '40%',
				type: 'output',
				datatype: 'number',
				style:'text-align: center'
			}
		];
		grdApcTotByCtpv = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createGridApcAreaByCtpv
	 * @description APC 지역현황
	 * @function
	 */
	const fn_createGridApcAreaByCtpv = function(){
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdApcAreaByCtpv';
		SBGridProperties.id = 'grdApcAreaByCtpv';
		SBGridProperties.jsonref = 'jsonApcAreaByCtpv';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.allowcopy = true;
		SBGridProperties.columns = [
			{
				caption: ['APC명'],
				ref: 'apcNm',
				width: '200px',
				type: 'output',
				style:'text-align: left'
			},
			{
				caption: ['운영조직명'],
				ref: 'operOgnzNm',
				width: '200px',
				type: 'output',
				style:'text-align: left'
			},
			{
				caption: ['시군'],
				ref: 'sigunNm',
				width: '100px',
				type: 'output',
				style:'text-align: center'
			},
			{
				caption: ['조직유형'],
				ref: 'ognzTypeNm',
				width: '200px',
				type: 'output',
				style:'text-align: left'
			},
			{
				caption: ['유형명'],
				ref: 'cmsuTypeNm',
				width: '100px',
				type: 'output',
				style:'text-align: center'
			},
		];
		grdApcAreaByCtpv = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createMapChart
	 * @description MAP차트 그리기
	 * @function
	 */
	const fn_createMapChart = function() {

		const chart = new sb.chart.render("#mapchart",{
			"global":{
				"svg":{
					"classname":"sbchart",      		//svg 엘리먼트의 css클래스명 정의
					"accessibility":{
						"use":false                         //웹 접근성 관련 항목의 사용 여부 설정
					}
				},
				"export":{
					"show":true                            //이미지 다운로드 기능 사용 여부 설정
				},
				"size":{
					"width":800,                            //맵차트 너비 지정
					"height":535,                           //맵차트 높이 지정
				}
			},
			"data":{
				"type":"map",                       // 차트 타입을 설정
				"json": jsonApcArea,
				"keys":{
					"x":"extrCtpvCd",				// 각 지역 코드 데이터에 매핑되는 속성명을 지정
					"value":["cntApc"]              // 차트에 사용될 사용자 데이터 속성을 지정
				}
			},
			"extend":{
				"map":{
					mapUrl: "/resource/json/res/SIGUNGU.json",  //맵차트를 그리는 데이터의 경로를 설정
					theme: "leaf",
					onclick : async function(ctpv) {
						await fn_setApcAreaByCtpv(ctpv);
					},
					showDefaultLabel: jsonApcArea.length === 0,
					/*
                    drillDown : true,
                    panel : {
                        type : "vlabel"
                    }
                     */
				},
			}
		})
	}

	/**
	 * @name fn_convertCtpv
	 * @description 시도 코드를 맵차트에 맞게 변환한다
	 * @param {String} _ctpvCd
	 * @function
	 */
	const fn_convertCtpv = function(_ctpvCd) {
		const crtrYr = SBUxMethod.get("srch-slt-crtrYr");
		let newCode = "";
		switch(_ctpvCd) {
			case "21":
				newCode = "26";
				break;
			case "22":
				newCode = "27";
				break;
			case "23":
				newCode = "28";
				break;
			case "24":
				newCode = "29";
				break;
			case "25":
				newCode = "30";
				break;
			case "26":
				newCode = "31";
				break;
			case "29":
				newCode = "36";
				break;
			case "31":
				newCode = "41";
				break;
			case "33":
				newCode = "43";
				break;
			case "34":
				newCode = "44";
				break;
			case "35":
				if (crtrYr  >= "2024") {
					newCode = "52"
				} else{
					newCode = "45"
				}
				break;
			case "36":
				newCode = "46";
				break;
			case "37":
				newCode = "47";
				break;
			case "38":
				newCode = "48";
				break;
			case "39":
				newCode = "50";
				break;
			case "32":
				newCode = "51";
				break;
			default:
				newCode = _ctpvCd;
				break;
		}

		return newCode;
	}


</script>
</html>
