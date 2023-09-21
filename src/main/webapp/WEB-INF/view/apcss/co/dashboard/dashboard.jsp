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
				<h5 style="float:left; margin:9px 16px 0 0; color:black;">품목</h5>
				<sbux-select
					id="slt-itemCd"
					name="slt-itemCd"
					uitype="single"
					jsondata-ref="jsonComItemCd"
					onchange="fn_searchItem"
					unselected-text="선택"
					class="form-control input-sm input-sm-ast inpt_data_reqed"
					style="width:170px; float:left; margin-left:auto;"
				></sbux-select>
				<button type="button" class="btn btn-sm btn-outline-danger" style="float:left; margin-left:20px;">조회</button>
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
				<table class="table table-bordered table-hover tbl_col tbl_row tbl_fixed" >
					<colgroup>
						<col style="width: 10%">
						<col style="width: 22.5%">
						<col style="width: 22.5%">
						<col style="width: 22.5%">
						<col style="width: 22.5%">
					</colgroup>
					<thead>
						<tr>
							<th colspan="5"><p style="text-align:center;"><sbux-label id="lbl-today" name="lbl-today" style="font-weight:bold;"></sbux-label></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>대표 품목</th>
							<th><p style="text-align:center"><sbux-label id="lbl-rprsItemCd_1" name="lbl-rprsItemCd_1" text="감자"></sbux-label></th>
							<th><p style="text-align:center"><sbux-label id="lbl-rprsItemCd_2" name="lbl-rprsItemCd_2" text="고구마"></sbux-label></th>
							<th><p style="text-align:center"><sbux-label id="lbl-rprsItemCd_3" name="lbl-rprsItemCd_3" text="양파"></sbux-label></th>
							<th><p style="text-align:center"><sbux-label id="lbl-rprsItemCd_4" name="lbl-rprsItemCd_4" text="마늘"></sbux-label></th>
						</tr>
						<tr>
							<th>원물 입고</th>
							<td><p style="text-align:center"><sbux-label id="lbl-wrhs_1" name="lbl-wrhs_1" text="5,000 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-wrhs_2" name="lbl-wrhs_2" text=""></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-wrhs_3" name="lbl-wrhs_3" text="1,200 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-wrhs_4" name="lbl-wrhs_4" text="500 Kg"></sbux-label></td>
						</tr>
						<tr>
							<th>선별 실적</th>
							<td><p style="text-align:center"><sbux-label id="lbl-sort_1" name="lbl-sort_1" text="1,500 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-sort_2" name="lbl-sort_2" text="500 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-sort_3" name="lbl-sort_3" text="1,000 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-sort_4" name="lbl-sort_4" text=""></sbux-label></td>
						</tr>
						<tr>
							<th>포장 실적</th>
							<td><p style="text-align:center"><sbux-label id="lbl-pckg_1" name="lbl-pckg_1" text="1,500 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-pckg_2" name="lbl-pckg_2" text="500 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-pckg_3" name="lbl-pckg_3" text="1,000 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-pckg_4" name="lbl-pckg_4" text=""></sbux-label></td>
						</tr>
						<tr>
							<th>발주서 접수</th>
							<td><p style="text-align:center"><sbux-label id="lbl-outordr_1" name="lbl-outordr_1" text="1,500 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-outordr_2" name="lbl-outordr_2" text="500 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-outordr_3" name="lbl-outordr_3" text="1,000 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-outordr_4" name="lbl-outordr_4" text=""></sbux-label></td>
						</tr>
						<tr>
							<th>출하 실적</th>
							<td><p style="text-align:center"><sbux-label id="lbl-spmt_1" name="lbl-spmt_1" text="1,400 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-spmt_2" name="lbl-spmt_2" text="500 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-spmt_3" name="lbl-spmt_3" text="1,000 Kg"></sbux-label></td>
							<td><p style="text-align:center"><sbux-label id="lbl-spmt_4" name="lbl-spmt_4" text=""></sbux-label></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>


<script type="text/javascript">

	var jsonComItemCd = [];

	//only document
	window.addEventListener('DOMContentLoaded', function(e) {
		var title = gv_apcNm + " 월별 실적 통계"
		SBUxMethod.set("lbl-apcNm", title);

		createChartWrhs();
		createChartSort();
		createChartSpmt();

		gfn_setApcItemSBSelect("slt-itemCd", 	jsonComItemCd, gv_apcCd);			// APC 품목

		let date = new Date();
		let year  = date.getFullYear();
	    let month = ('0' + (date.getMonth() + 1)).slice(-2);
	    let day   = ('0' + date.getDate()).slice(-2);

		let strYmd = year + "년 " + month + "월 " + day + "일 작업 실적";
		SBUxMethod.set("lbl-today", strYmd);

	});

	var chartWrhs;
	var chartSort;
	var chartSpmt;

	var chartDataWrhs = [
		{month: "1월", wrhs: 4000, wrhsLine: 4000},
		{month: "2월", wrhs: 3000, wrhsLine: 3000},
		{month: "3월", wrhs: 3500, wrhsLine: 3500},
		{month: "4월", wrhs: 2000, wrhsLine: 2000},
		{month: "5월", wrhs: 2800, wrhsLine: 2800},
		{month: "6월", wrhs: 5000, wrhsLine: 5000},
		{month: "7월", wrhs: 4000, wrhsLine: 4000},
		{month: "8월", wrhs: 2000, wrhsLine: 2000},
		{month: "9월", wrhs: 3000, wrhsLine: 3000},
	]
	var chartDataSort = [
		{month: "1월", sort: 1500, pckg : 1500, pckgLine : 1500},
		{month: "2월", sort: 2000, pckg : 2000, pckgLine : 2000},
		{month: "3월", sort: 7000, pckg : 6800, pckgLine : 6800},
		{month: "4월", sort: 2500, pckg : 2400, pckgLine : 2400},
		{month: "5월", sort: 2800, pckg : 2700, pckgLine : 2700},
		{month: "6월", sort: 5000, pckg : 4800, pckgLine : 4800},
		{month: "7월", sort: 2000, pckg : 2000, pckgLine : 2000},
		{month: "8월", sort: 2000, pckg : 1900, pckgLine : 1900},
		{month: "9월", sort: 500,  pckg : 400 , pckgLine : 400},
	]
	var chartDataSpmt = [
		{month: "1월", spmt: 3000, spmtLine : 3000},
		{month: "2월", spmt: 2000, spmtLine : 2000},
		{month: "3월", spmt: 1500, spmtLine : 1500},
		{month: "4월", spmt: 5000, spmtLine : 5000},
		{month: "5월", spmt: 4800, spmtLine : 4000},
		{month: "6월", spmt: 2000, spmtLine : 2000},
		{month: "7월", spmt: 3000, spmtLine : 3000},
		{month: "8월", spmt: 2000, spmtLine : 2000},
		{month: "9월", spmt: 3000, spmtLine : 3000},
	]
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

</script>
</body>
</html>