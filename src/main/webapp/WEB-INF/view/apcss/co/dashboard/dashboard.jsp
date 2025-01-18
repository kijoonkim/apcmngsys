<%
/**
 * @Class Name : dashboard.jsp
 * @Description : 업무게시판 화면
 * @author SI개발부
 * @since 2023.12.12
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.12.12 김현호		최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>메인</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<style>
		.dash_top{
			display: flex;
			background-color: rgba(128, 128, 128, 0.15);
			border-radius: 5px;
			width: 100%;
			height: 100%;
			gap: 5px;
		}
		.dash_top_span{
			align-content: center;
			color: black;
			margin-left: 3vw;
		}
		.dash_body{
			display: grid;
			grid-template-columns: 1.6fr 1fr;
			grid-template-rows: 30px 1.6fr 30px 30px 1fr;
			height: 100%;
		}
		.dash_area{
			border-radius: 8px;
		}
		.dash_area.char_donut{
			display: flex;
			gap: 5px;
			justify-content: center;
			align-items: center;
		}
		.dash_area.char_donut div{
			flex: 1;
			width: 100%;
			height: 70%;
			display: flex;
			align-items: center;
		}
		.dash_area.char_combi{
			display: flex;
			gap: 5px;
			justify-content: center;
			align-items: center;
		}
		.dash_area.char_combi div{
			flex: 1;
			width: 100%;
			height: 85%;
			display: flex;
			align-items: center;
			padding-bottom: 2vh;
		}
		.summary_box{
			border: 1px solid #D8D8D8;
			flex: 1;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.summary_box.box_b{
			border-bottom: 10px solid #4073C0;
		}
		.color_b{
			color: #4073C0;
			font-size: large;
		}
		.summary_box.box_g{
			border-bottom: 10px solid #1bb394;
		}
		.color_g{
			color: #1bb394;
			font-size: large;
		}
		.summary_box.box_p{
			border-bottom: 10px solid #eb5c87;
		}
		.color_p{
			color: #eb5c87;
			font-size: large;
		}
		.ad_tbl_count li span{
			color: black !important;
			font-weight: bold !important;
			font-size: 2rem;
		}
		table th{
			background-color: color(srgb 0.9629 0.9729 0.9728);
			font-weight: initial;
			text-align: center;
			border: 1px solid;
			border-bottom: initial;
		}
		table td{
			border: 1px solid;
			padding-left: 5px;
			width: 150px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}
		.ad_tbl_top2{
			display: flex;
		}
		.summary_box.box_b > div{
			display: flex;
			flex-direction: column;
			gap: 3px;
		}
		.box_aling {
			display: flex;
			gap: 5px;
			align-items: end;
		}
		.ellipsis-text {
			width: 200px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}
		.sbchart-title{
			font-weight: bold;
			font-size: large;
		}
	</style>
</head>
<body oncontextmenu="return false;">
<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="text-align:right; height: 10vh" >
			<div class="dash_top">
				<span class="dash_top_span">조회 APC</span>
				<div style="display: flex; align-items: center">
					<sbux-select
							id="srch-slt-apcCd"
							name="srch-slt-apcCd"
							uitype="single"
							jsondata-ref="jsonApcItem"
							unselected-text="선택"
							class="form-control input-sm"
							style="background-color: white"
							onchange=""
					></sbux-select>
				</div>
				<span class="dash_top_span">기준일자</span>
				<div style="display: flex; align-items: center">
					<sbux-select
							id="srch-slt-ymd"
							name="srch-slt-ymd"
							uitype="single"
							jsondata-ref="jsonApcItem"
							unselected-text="선택"
							class="form-control input-sm"
							style="background-color: white"
							onchange=""
					></sbux-select>
				</div>
				<span class="dash_top_span">조회구분</span>
				<div style="display: flex; align-items: center">
					 <sbux-select
							  id="srch-slt-type"
							  name="srch-slt-type"
							  uitype="single"
							  jsondata-ref="jsonApcItem"
							  unselected-text="선택"
							  class="form-control input-sm"
							  style="background-color: white"
							  onchange=""
					 ></sbux-select>
				</div>
			</div>
		</div>
		<div class="box-body" style="height: calc(100% - 10vh)">
			<div class="dash_body">
				<div class="dash_area">
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>품목별 현황</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="dash_area">
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>APC 요약정보</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="dash_area char_donut" style="border: 1px solid #D8D8D8;margin-right: 2vw">
<%--					donut 그래프 --%>
					<div id="wrhs"></div>
					<div id="sort"></div>
					<div id="spmt"></div>
				</div>
				<div class="dash_area" style="display: flex; flex-direction: column">
<%--					환경설정 Table --%>
					<table style="flex: 1">
						<colgroup>
							<col style="width: 20%">
							<col style="width: 30%">
							<col style="width: 20%">
							<col style="width: 30%">
						</colgroup>
						<tbody>
						<tr>
							<th>법인명</th>
							<td></td>
							<th>APC명</th>
							<td id="apcNm"></td>
						</tr>
						<tr>
							<th>업태</th>
							<td id="bzstat"></td>
							<th>종목</th>
							<td id="cls"></td>
						</tr>
						<tr>
							<th>대표자명</th>
							<td colspan="3" id="apcRprsvNm"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td id="telno"></td>
							<th>팩스번호</th>
							<td id="fxno"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td colspan="3" id="addr"></td>
						</tr>
						<tr>
							<th>사업자번호</th>
							<td colspan="3" id="actno"></td>
						</tr>
						<tr>
							<th>품목</th>
							<td colspan="3">
								<div id="itemNm" class="ellipsis-text">

								</div>
							</td>
						</tr>
						<tr>
							<th>생산자</th>
							<td id="prdcr"></td>
							<th>작업자</th>
							<td id="oprtr"></td>
						</tr>
						<tr>
							<th>관리자</th>
							<td></td>
							<th>직거래</th>
							<td></td>
						</tr>
						</tbody>
					</table>
				</div>
				<div></div>
				<div></div>
				<div class="dash_area">
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>품목별 추이</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="dash_area">
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>요약 실적</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="dash_area char_combi" style="border: 1px solid #D8D8D8; margin-right: 2vw">
<%--					bar 그래프 --%>
					<div id="trend"></div>
				</div>
				<div class="dash_area" style="display: flex">
<%--					박스 세개 --%>
					<div style="display: flex; gap: 5px; flex: 1">
						<div class="summary_box box_b">
							<div>
								<div style="font-size: 1.5rem">입고량</div>
								<div class="box_aling"><span class="color_b">2,230</span>ton</div>
							</div>
						</div>
						<div class="summary_box box_g">
							<div>
								<div style="font-size: 1.5rem">선별량</div>
								<div class="box_aling"><span class="color_g">2,230</span>ton</div>
							</div>
						</div>
						<div class="summary_box box_p">
							<div>
								<div style="font-size: 1.5rem">출하량</div>
								<div class="box_aling"><span class="color_p">2,230</span>ton</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



	</div>
</section>
<script type="text/javascript">
	/** 차트 테스트용 json **/
	// let columnsData = [
	// 	["양파", 90, 40, 50, 120, 80, 90],
	// 	["마늘", 120, 160, 200, 160, 130, 220],
	// 	["감자",300, 240, 290, 230, 300, 320],
	// 	["기타",300, 240, 290, 230, 300, 320]
	// ];
	let columnsData = [
		["양파", 90],
		["마늘", 120],
		["감자",180],
		["기타",300]
	];

	window.addEventListener("DOMContentLoaded", function(e){
		selectApcEvrmntStng();
		getItemList();
		getPrdcrList();
		getOprtrList();
		fn_createChar();
	});
	const fn_createChar = async function(){
		await fn_createWrhs();
		await fn_createSort();
		await fn_createSpmt();
		await fn_createTrend();
	}

	const fn_createWrhs = async function(){
		sb.chart.render("#wrhs", {
			global: {
				animation: {
					show: true,
					delay: 1000
				},
				color: {
					pattern: ['#f45d8b','#19b394','#1956b3','#edebeb']
				},
			},
			data: {
				type:'pie',
				columns: columnsData
			},
			legend: {
				position: "bottom",
				item: {
					tile: {
						point: "circle"
					}
				}
			},
			title: {
				text: "입고",
				padding: {
					bottom: 20
				}
			},
			extend: {
				pie: {
					label: {
						show: false
					}
				}
			}
		});
	}
	const fn_createSort = async function(){
		sb.chart.render("#sort", {
			global: {
				animation: {
					show: true,
					delay: 1000
				},
				color: {
					pattern: ['#f45d8b','#19b394','#1956b3','#edebeb']
				},
			},
			data: {
				type:'pie',
				columns: columnsData
			},
			legend: {
				position: "bottom",
				item: {
					tile: {
						point: "circle"
					}
				}
			},
			title: {
				text: "생산",
				padding: {
					bottom: 20
				}
			},
			extend: {
				pie: {
					label: {
						show: false
					}
				}
			}
		});
	}
	const fn_createSpmt = async function(){
		sb.chart.render("#spmt", {
			global: {
				animation: {
					show: true,
					delay: 1000
				},
				color: {
					pattern: ['#f45d8b','#19b394','#1956b3','#edebeb']
				},
			},
			data: {
				type:'pie',
				columns: columnsData
			},
			legend: {
				position: "bottom",
				item: {
					tile: {
						point: "circle"
					}
				}
			},
			title: {
				text: "출하",
				padding: {
					bottom: 20
				}
			},
			extend: {
				pie: {
					label: {
						show: false
					}
				}
			}
		});
	}
	const fn_createTrend = async function(){
		sb.chart.render("#trend", {
			global: {
				animation: {
					show: true,
					delay: 1000,
					types: {
						양파: "rise",
						마늘: "rise",
						감자: "rise",
						기타: "fill"
					}
				},
				color: {
					pattern: ['#f45d8b','#19b394','#1956b3','#aeb0b3']
				},
			},
			data: {
				columns:[
					['양파', 40, 20, 50, 80, 80, 90, 70, 120, 150, 100, 120, 80],
					['마늘', 50, 160, 40, 60, 70, 120, 90, 50, 40, 30, 100, 120],
					['감자', 40, 20, 50, 80, 80, 90, 70, 10, 70, 40, 20, 80],
					['기타', 70, 70, 80, 90, 50, 30, 10, 120, 180, 250, 100, 70],
				],
				types: { 양파 : "bar", 마늘 : "bar", 감자 : "bar", 기타:"line" },
			},
			legend: {
				show: false
			},
			axis: {
				x: {
					show: false
				},
				y: {
					show: false
				}
			},
			grid: {
				x: {
					show: false
				},
				y: {
					show: false
				}
			},
			extend: {
				line: {
					hideCircle: true,
					setLinesWidthAll: 8,
					linecap: 'square',
				},
				bar:{
					width: {
						ratio: 0.5
					}
				}
			}
		});
	}

	const selectApcEvrmntStng = async function(){
		let postJsonPromise = gfn_postJSON("/am/apc/selectApcEvrmntStng.do", {apcCd : gv_selectedApcCd});
		let data = await postJsonPromise;
		let resultVO = data.resultVO;
		// console.log(resultVO);
		let tds = $('table td[id]');
		$('table td[id]').each(function() {
			// 현재 요소의 id를 가져옴
			const id = $(this).attr('id');
			$(this).text(resultVO[id]);
		});
	}
	const getItemList = async function(){
		let itemList = await gfn_getApcItem(gv_selectedApcCd);
		let items = '';
		itemList.forEach(function(item,idx){
			if(item.itemNm){
				items += item.itemNm + ",";
			}
		});
		$("#itemNm").text(items);
	}
	const getPrdcrList = async function(){
		let prdcrList = await gfn_getPrdcrs(gv_selectedApcCd);
		$("#prdcr").text(prdcrList.length + '명');
	}
	const getOprtrList = async function(){
		let postJsonPromise = gfn_postJSON("/am/oprtr/selectOprtrList.do", {
			apcCd 		: gv_selectedApcCd
		});
		let data = await postJsonPromise;
		$("#oprtr").text(data.resultList.length + '명');
	}

</script>

<!-- 아래부터 차트 -->
<script type="text/javascript">
	var jsonDashboard = [];

	//only document
	window.addEventListener('DOMContentLoaded', function(e) {
		// var title = gv_apcNm + " 월별 실적 통계"
		// SBUxMethod.set("lbl-apcNm", title);
		// fn_createDashboardGrid();
		// postJsonDashboard();
	});

	async function postJsonDashboard() {
		let apcCd = gv_apcCd;
		if(gv_userType == '01' || gv_userType == '00'){
			apcCd ='';
		}

		let postJsonPromise = gfn_postJSON("/co/dashboard/selectStats.do", {'gv_apcCd': apcCd});
		let data = await postJsonPromise;

        try{
  			if (_.isEqual("S", data.resultStatus)) {

  	        	jsonDashboard.length = 0;
  	        	data.result[0].dayPrcsSttn.forEach((item, index) => {
  					let dashboard = {
  					    itemNm 		: item.itemNm
  					  , wgt1 		: item.wgt1
  					  , wgt2 		: item.wgt2
  					  , wgt3 		: item.wgt3
  					  , wgt4 		: item.wgt4
  					  , wgt5		: item.wgt5
  					}
  					jsonDashboard.push(dashboard);
  				});
  	        	grdDashboard.rebuild();

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

		for (let i = 0; i < data.result.length; i++) {
			let nowData = data.result[i];
			let date = dateGetMonth(nowData.wrhsSttn.wsDate);
			chartDataWrhs.push({month:date, wrhs: nowData.wrhsSttn.wgt,wrhsLine: nowData.wrhsSttn.wgt});
			chartDataSort.push({month:date, sort: nowData.prdctnSttn.sort,pckg: nowData.prdctnSttn.pckg,pckgLine:nowData.prdctnSttn.pckg});
			chartDataSpmt.push({month:date, spmt: nowData.spmtPrfmnc.wgt,spmtLine: nowData.spmtPrfmnc.wgt});
			yearList.push(parseInt(nowData.wrhsSttn.wsDate.substring(0,4),10))
		}

		if(yearList[0] == yearList[yearList.length-1]){
			chartYear = yearList[0]
		}else{
			chartYear = yearList[0] + " ~ " + yearList[yearList.length-1]
		}

		createChartWrhs();
		createChartSort();
		createChartSpmt();
	}
	//dashBoard dateFormat
	function dateGetMonth(date){
		let year = parseInt(date.substring(0,4),10);
		let month = parseInt(date.substring(4,6),10);
		let monthDate = new Date(year,month -1);
		return (monthDate.getMonth()+1)+"월";
	}

	var chartWrhs;
	var chartSort;
	var chartSpmt;
	var chartYear;

	var chartDataWrhs = [];
	var chartDataSort = [];
	var chartDataSpmt = [];
	var yearList = [];

	// 차트 생성
	const createChartWrhs = async function (){
		var chartConfig = {
			global: { // 전역 설정들
				color: {
					pattern: ['#8995E1', 'red']
				},
			},
			grid: {
				y: {
					show: false
				},
				x: {
					show: false
				}
			},
			data: {
				types: {wrhs: 'bar', wrhsLine: 'spline'},
				json: chartDataWrhs,
				keys: { // data 타입을 json 형태로 받아올 때에만 사용
					x: "month",
					value: ["wrhs", "wrhsLine"]
				},
			},
			extend: {
				line: {
					setLinesWidth: [
						{"key":"wrhsLine", "width":2}
					],
				}
			},
			axis: {
				x: {
					type: 'category',
					label: {
						text: chartYear,
						position: "outer-center"
					}
				},
				y: {
					tick: {
					multiline: false,
					}
				}

			},
			tooltip: {
				custom: function(data) {
					return '<div style="color: white; border: 3px solid black;">'
							+ chartDataWrhs[data[0].x].month
							+ '<br>'
							+ '입고 : ' + addCommasToNumber(data[0].value)
							+ '</div>';
				}
			},
			legend: {
				show: false
			}


		};
		chartWrhs = new sb.chart("#chart-area-wrhs", chartConfig).render();
	};
	const createChartSort = async function (){
		var chartConfig = {
			global: { // 전역 설정들
				color: {
					pattern: ['#4458DB', '#8995E1', 'red']
				},
			},
			grid: {
				y: {

					show: false
				},
				x: {
					show: false
				}
			},
			data: {
				types: {sort: 'bar', pckg: 'bar', pckgLine: 'spline'},
				json: chartDataSort,
				keys: { // data 타입을 json 형태로 받아올 때에만 사용
					x: "month",
					value: ["sort", "pckg", "pckgLine"]
				},
			},
			extend: {
				line: {
					setLinesWidth: [
						{"key":"pckgLine", "width":2}
					],
				}
			},
			axis: {
				x: {
					type: 'category',
					label: {
						text: chartYear,
						position: "outer-center"
					}
				},
				y: {
					tick: {
					multiline: false,
					}
				}
			},
			tooltip: {
				custom: function(data) {
					return '<div style="color: white; border: 3px solid black;">'
							+ chartDataSort[data[0].x].month
							+ '<br>'
							+ '선별 : ' + addCommasToNumber(data[0].value)
							+ '<br>'
							+ "포장 : " + addCommasToNumber(data[2].value)
							+	'</div>';
				}
			},
			legend: {
				show: false
			}


		};
		chartSort = new sb.chart("#chart-area-sort", chartConfig).render();
	};
	const createChartSpmt = async function (){
		var chartConfig = {
			global: { // 전역 설정들
				color: {
					pattern: ['#8995E1', 'red']
				},
			},
			grid: {
				y: {
					show: false
				},
				x: {
					show: false
				}
			},
			data: {
				types: {spmt: 'bar', spmtLine: 'spline'},
				json: chartDataSpmt,
				keys: { // data 타입을 json 형태로 받아올 때에만 사용
					x: "month",
					value: ["spmt", "spmtLine"]
				},
			},
			extend: {
				line: {
					setLinesWidth: [
						{"key":"spmtLine", "width":2}
					],
				}
			},
			axis: {
				x: {
					type: 'category',
					label: {
						text: chartYear,
						position: "outer-center"
					}
				},
				y: {
					tick: {
					multiline: false,
					}
				}
			},
			tooltip: {
				custom: function(data) {
					return '<div style="color: white; border: 3px solid black;">'
							+ chartDataSpmt[data[0].x].month
							+ '<br>'
							+ '출고 : ' + addCommasToNumber(data[0].value)
							+ '</div>';
				}
			},
			legend: {
				show: false
			}


		};
		chartSpmt = new sb.chart("#chart-area-spmt", chartConfig).render();
	};

	// 그리드 생성
	function fn_createDashboardGrid() {
		let date = new Date();
		let year  = date.getFullYear();
		let month = ('0' + (date.getMonth() + 1)).slice(-2);
		let day   = ('0' + date.getDate()).slice(-2);

		let strYmd = year + "년 " + month + "월 " + day + "일 작업 실적";

        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdDashboard';
	    SBGridProperties.id = 'grdDashboard';
	    SBGridProperties.jsonref = 'jsonDashboard';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
        SBGridProperties.columns = [
        	{caption: [strYmd,"대표품목"], 	ref: 'itemNm', 	type: 'output', width: '17%',	style: 'text-align: center'},
            {caption: [strYmd,'원물입고 (Kg)'], 	ref: 'wgt1', 	type: 'output',	width: '17%',	style: 'text-align: right; padding-right: 5px;',
    		    typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: [strYmd,'선별실적 (Kg)'], 	ref: 'wgt2', 	type: 'output',	width: '17%',	style: 'text-align: right; padding-right: 5px;',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: [strYmd,'포장실적 (Kg)'], 	ref: 'wgt3',	type: 'output',	width: '17%',	style: 'text-align: right; padding-right: 5px;',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: [strYmd,'발주서 접수 (Kg)'], 	ref: 'wgt4', 	type: 'output',	width: '17%',	style: 'text-align: right; padding-right: 5px;',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: [strYmd,'출하실적 (Kg)'], 	ref: 'wgt5', 	type: 'output',	width: '17%',	style: 'text-align: right; padding-right: 5px;',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}}
        ];
        grdDashboard = _SBGrid.create(SBGridProperties);
    }

	// 조회 버튼
	function fn_search(){
		chartDataSort = [];
		chartDataWrhs = [];
		chartDataSpmt = [];

		grdDashboard.rebuild();

    	// grid clear
    	jsonDashboard.length = 0;
		grdDashboard.refresh();
		postJsonDashboard();
	}

	function addCommasToNumber(number) {
	    // 숫자를 문자열로 변환
	    let strNumber = number.toString();

	    // 정규식을 사용하여 숫자 포맷 변경
	    strNumber = strNumber.replace(/\B(?=(\d{3})+(?!\d))/g, ",");

	    return strNumber;
	}
</script>
</body>
</html>