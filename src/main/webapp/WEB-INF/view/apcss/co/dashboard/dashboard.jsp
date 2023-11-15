<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="text-align:right;" >
			<h3 class="box-title" style="line-height: 30px; float:left;"><sbux-label id="lbl-apcNm" name="lbl-apcNm" style="font-weight:bold;"></sbux-label></h3>
			 <span style="display:inline-block;">
            <button type="button" class="btn btn-sm btn-outline-danger" style="float:left; margin-left:20px;" onclick="fn_search()">조회</button>
            </span>

		</div>
		<!--==========그래프=============-->
		<div class="box-body">
			<div class="box box-solid" style="width:30%; height:395px; float:left; margin-right:5%;">
				<h1 class="box-title" style="margin-top: 10px;margin-left: 10px;">입고 현황</h1>
				<div id="chart-area-wrhs" style="height: 345px;"></div>
			</div>
			<div class="box box-solid" style="width:30%; height:395px; float:left; margin-right:5%;">
				<h1 class="box-title" style="margin-top: 10px;margin-left: 10px;">생산 현황</h1>
				<div id="chart-area-sort" style="height: 345px;"></div>
			</div>
			<div class="box box-solid" style="width:30%; height:395px; float:right;">
				<h1 class="box-title" style="margin-top: 10px;margin-left: 10px;">출고 현황</h1>
				<div id="chart-area-spmt" style="height: 345px;"></div>
			</div>

		</div>
		<div class="box-body">

			<!-- 1번째 그리드-->
			<table class="table table-bordered table-hover tbl_col tbl_row tbl_fixed"  id="dayPrcsSttnTable">
				<colgroup>
					<col style="width: 10%">
				</colgroup>
				<thead>
				<tr>
					<th colspan="100%"><p style="text-align:center;"><sbux-label id="lbl-today" name="lbl-today" style="font-weight:bold;"></sbux-label></th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<th>대표 품목</th>

				</tr>
				<tr>
					<th>원물 입고</th>
				</tr>
				<tr>
					<th>선별 실적</th>
				</tr>
				<tr>
					<th>포장 실적</th>
				</tr>
				<tr>
					<th>발주서 접수</th>
				</tr>
				<tr>
					<th>출하 실적</th>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
</section>


<script type="text/javascript">

	//only document
	window.addEventListener('DOMContentLoaded', function(e) {
		var title = gv_apcNm + " 월별 실적 통계"
		SBUxMethod.set("lbl-apcNm", title);
		postJsonDashboard();


		let date = new Date();
		let year  = date.getFullYear();
		let month = ('0' + (date.getMonth() + 1)).slice(-2);
		let day   = ('0' + date.getDate()).slice(-2);

		let strYmd = year + "년 " + month + "월 " + day + "일 작업 실적";
		SBUxMethod.set("lbl-today", strYmd);


	});
	async function postJsonDashboard() {
		let apcCd = gv_apcCd;
		if(gv_userType == '01' || gv_userType == '00'){
			apcCd ='';
		}

		let postJsonPromise = gfn_postJSON("/co/dashboard/selectStats.do", {'gv_apcCd': apcCd});
		let data = await postJsonPromise;


		//변수세팅 dayPrcsSttnTable
		var itemQntt = data.result[0].dayPrcsSttn.length;
		var widthSize = 90 / data.result[0].dayPrcsSttn.length;
		var colEl = '<col style="width:' + widthSize + '%">';
		var colgroupEl = $('#dayPrcsSttnTable').children('colgroup');
		var tbodyTr = $("#dayPrcsSttnTable > tbody > tr");

		for (let i = 0; i < data.result.length; i++) {
			if (i == 0) {
				//1.colgroup 세우기
				for (let i = 0; i < itemQntt; i++) {
					colgroupEl.append(colEl);
				}
				//2.메뉴들 탐색 >>
				for (let i = 0; i < tbodyTr.length; i++) {
					if (i == 0) { //2-1 품목 세팅
						data.result[0].dayPrcsSttn.forEach(function (item, index) {
							var bodyEl = '<th style="background-color: transparent;"><p style="text-align:center;font-weight:100;">' + item.itemNm + '</th>';
							$(tbodyTr[0]).append((bodyEl));
						})
						continue;
					}
					data.result[0].dayPrcsSttn.forEach(function (item, index) {
						var bodyEl = '<th style="background-color: transparent;"><p style="text-align:center;font-weight:100;">' + item['wgt' +i]+ '</th>';
						$(tbodyTr[i]).append((bodyEl));
					})
				}
			}
			let nowData = data.result[i];
			let date = dateGetMonth(nowData.wrhsSttn.wsDate);
			chartDataWrhs.push({month:date, wrhs: nowData.wrhsSttn.wgt,wrhsLine: nowData.wrhsSttn.wgt});
			chartDataSort.push({month:date, sort: nowData.prdctnSttn.sort,pckg: nowData.prdctnSttn.pckg,pckgLine:nowData.prdctnSttn.pckg});
			chartDataSpmt.push({month:date, spmt: nowData.spmtPrfmnc.wgt,spmtLine: nowData.spmtPrfmnc.wgt});
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

	var chartDataWrhs = []
	var chartDataSort = []
	var chartDataSpmt = []
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
						text: "2023",
						position: "outer-center"
					}
				}

			},
			tooltip: {
				custom: function(data) {
					return '<div style="color: white; border: 3px solid black;">'
							+ chartDataWrhs[data[0].x].month
							+ '<br>'
							+ '입고 : ' + data[0].value
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
						text: "2023",
						position: "outer-center"
					}
				}
			},
			tooltip: {
				custom: function(data) {
					return '<div style="color: white; border: 3px solid black;">'
							+ chartDataSort[data[0].x].month
							+ '<br>'
							+ '선별 : ' + data[0].value
							+ '<br>'
							+ "포장 : " + data[2].value
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
						text: "2023",
						position: "outer-center"
					}
				}
			},
			tooltip: {
				custom: function(data) {
					return '<div style="color: white; border: 3px solid black;">'
							+ chartDataSpmt[data[0].x].month
							+ '<br>'
							+ '출고 : ' + data[0].value
							+ '</div>';
				}
			},
			legend: {
				show: false
			}


		};
		chartSpmt = new sb.chart("#chart-area-spmt", chartConfig).render();
	};
	function fn_search(){
		 chartDataSort = []
		 chartDataWrhs = []
		 chartDataSpmt = []
		$('#dayPrcsSttnTable > colgroup > col').not(':first').remove();
		var resetData = $("#dayPrcsSttnTable > tbody > tr");
		for(let i  = 0 ; i < resetData.length; i++){
		$(resetData[i]).children().not(':first').remove();
		}
		postJsonDashboard();
	}

</script>
</body>
</html>