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
			grid-template-columns: 1fr 10px 1fr;
			grid-template-rows: 30px 1.6fr 30px 30px 1fr;
			height: 100%;
			width: 100%;
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
		.dash_area table th{
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
			justify-content: end;
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
		.sbux-pik-input.sbux-dirty {
			background: #ffffff;
			border-color: #fefefe;
			color: #000;
		}
		.sbchart-no-data{
			left: 88%!important;
		}
		select.form-control.input-sm {
			background-color: #ffffff;
		}
	</style>
</head>
<body oncontextmenu="return false;">
<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="text-align:right; height: 10vh" >
			<div class="dash_top">
				<span class="dash_top_span">조회 APC</span>
				<div style="display: flex; align-items: center; flex-basis: 10%">
					<%@ include file="../../../frame/inc/apcSelectComp.jsp" %>
					<%--<sbux-select
							id="gsb-slt-apcCd"
							name="gsb-slt-apcCd"
							uitype="single"
							jsondata-ref="cjsonApcList"
							jsondata-text="apcNm"
							jsondata-value="apcCd"
							class="form-control input-sm"
							onchange="cfn_onChangeApc(this)"
							style="background-color: white;"
					></sbux-select>--%>
				</div>
				<span class="dash_top_span">기준일자</span>
				<div style="display: flex; align-items: center">
					<sbux-datepicker id="srch-dtl-ymd"
									 name="srch-dtl-ymd"
									 class="form-control pull-right input-sm input-sm-ast"
									 wrap-style="width:80%"
									 onchange="fn_search()"
									 uitype="popup">
					</sbux-datepicker>
				</div>
<%--				<span class="dash_top_span">조회구분</span>--%>
<%--				<div style="display: flex; align-items: center">--%>
<%--					 <sbux-select--%>
<%--							  id="srch-slt-type"--%>
<%--							  name="srch-slt-type"--%>
<%--							  uitype="single"--%>
<%--							  jsondata-ref="jsonApcItem"--%>
<%--							  unselected-text="선택"--%>
<%--							  class="form-control input-sm"--%>
<%--							  style="background-color: white"--%>
<%--							  onchange=""--%>
<%--					 ></sbux-select>--%>
<%--				</div>--%>
			</div>
		</div>
		<div class="box-body" style="height: calc(100% - 10vh)!important;">
			<div class="dash_body">
				<div class="dash_area">
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>품목별 현황</span>
							</li>
						</ul>
						<div id="ymBtn" style="display: flex;gap: 10px">
							<sbux-radio id="idx" name="idx" uitype="normal"
										jsondata-ref="radioJsonData"
										onchange="fn_setYM()">
							</sbux-radio>
						</div>
					</div>
				</div>
				<div></div>
				<div class="dash_area">
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>APC 요약정보</span>
							</li>
						</ul>
					</div>
				</div>

				<div class="dash_area char_donut" style="border: 1px solid #D8D8D8;">
<%--					donut 그래프 --%>
					<div id="wrhs"></div>
					<div id="sort"></div>
					<div id="spmt"></div>
				</div>
				<div></div>
				<div class="dash_area" style="display: flex; flex-direction: column">
<%--					환경설정 Table --%>
					<table style="flex: 1">1
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
							<th>사용자</th>
							<td id="user"></td>
							<th>거래처</th>
							<td id="cnpt"></td>
						</tr>
						</tbody>
					</table>
				</div>

				<div></div>
				<div></div>
				<div></div>

				<div class="dash_area">
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>품목별 추이</span>
							</li>
						</ul>
						<sbux-radio id="trc" name="trc" uitype="normal"
									jsondata-ref="radioTrcJsonData"
									onchange="fn_setTrc()">
						</sbux-radio>
					</div>
				</div>
				<div></div>
				<div class="dash_area">
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>요약 실적</span>
							</li>
						</ul>
					</div>
				</div>

				<div class="dash_area char_combi" style="border: 1px solid #D8D8D8;">
<%--					bar 그래프 --%>
					<div id="trend"></div>
				</div>
				<div></div>
				<div class="dash_area" style="display: flex">
<%--					박스 세개 --%>
					<div style="display: flex; gap: 5px; flex: 1">
						<div class="summary_box box_b">
							<div>
								<div style="font-size: 1.5rem">입고량</div>
								<div class="box_aling"><span id="wrhsCard" class="color_b"></span>kg</div>
							</div>
						</div>
						<div class="summary_box box_g">
							<div>
								<div style="font-size: 1.5rem">선별량</div>
								<div class="box_aling"><span id="sortCard" class="color_g"></span>kg</div>
							</div>
						</div>
						<div class="summary_box box_p">
							<div>
								<div style="font-size: 1.5rem">출하량</div>
								<div class="box_aling"><span id="spmtCard" class="color_p"></span>kg</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



	</div>
</section>
<script type="text/javascript">
	<c:choose>
	<c:when test="${comApcList != null}">
	var cjsonApcList = ${comApcList};
	</c:when>
	<c:otherwise>
	var cjsonApcList = {};
	</c:otherwise>
	</c:choose>

	/*const cfn_onChangeApc = function(obj) {
		gv_selectedApcCd = obj.value;
		fn_search();
	}*/
	/** radio json **/
	var radioJsonData = [
		{ text : "월단위"  , value : "mm", style:'margin-right : 8px',checked : "checked" },
		{ text : "연단위"  , value : "yy" },
	];
	var radioTrcJsonData = [
		{ text : "입고"  , value : "01", style:'margin-right : 8px',checked : "checked" },
		{ text : "생산"  , value : "02", style:'margin-right : 8px'},
		{ text : "출하"  , value : "03" },
	];
	/** 차트용 JSON **/
	let curItemMM = [];
	let curItemYY = [];
	let curSmryMM = [];
	let curSmryYY = [];

	/** 품목별 추이 **/
	let curItemTRC = [];
	let trcTypes = {};
	let trcColumns = [];

	/** charColumns **/
	let columnWrhs = [];
	let columnSort = [];
	let columnSpmt = [];

	let columnTrc = [];

	window.addEventListener("DOMContentLoaded", function(e){
		SBUxMethod.set("srch-dtl-ymd",gfn_dateToYmd(new Date()));
		selectApcEvrmntStng();
		/** 환경설정 정보 **/
		getItemList();
		getPrdcrList();
		getOprtrList();
		getCnptList();
		getUserList();
		/** 최초 진입 data select **/
		fn_search();
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
				columns: columnWrhs,
				noData: "데이터가 없습니다."
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
				columns: columnWrhs,
				noData: "데이터가 없습니다."
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
				columns: columnSpmt,
				noData: "데이터가 없습니다."
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
		let nowMonth = parseInt(SBUxMethod.get('srch-dtl-ymd').substring(4,6));
		let nowYear = parseInt(SBUxMethod.get('srch-dtl-ymd').substring(2,4));

		let range = [];
		for (let i = 0; i < 12 ;i++){
			let month =  (nowMonth + i ) % 12 + 1;
			if (month === 1) {
				range.push("`" + nowYear + "년 " + month + "월");
			} else {
				range.push(month+"월");
			}
		}

		//널병합연산자??
		let title1 = trcColumns[0]?.[0] !== undefined ? trcColumns[0][0] : (trcColumns[0] ?? [])[0];
		let title2 = trcColumns[1]?.[0] !== undefined ? trcColumns[1][0] : (trcColumns[1] ?? [])[0];
		let title3 = trcColumns[2]?.[0] !== undefined ? trcColumns[2][0] : (trcColumns[2] ?? [])[0];
		let title4 = trcColumns[3]?.[0] !== undefined ? trcColumns[3][0] : (trcColumns[3] ?? [])[0];

		sb.chart.render("#trend", {
			global: {
				animation: {
					show: true,
					delay: 1000,
				},
				color: {
					pattern: ['#f45d8b','#19b394','#1956b3','#aeb0b3']
				},
			},
			data: {
				type:'bar',
				columns:trcColumns,
				noData: "데이터가 없습니다."
			},
			legend: {
				show: false
			},
			axis: {
				x: {
					type:'category',
					categories: range
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
	const getCnptList = async function(){
		const postJsonPromise = gfn_postJSON(URL_CNPT_INFO, {apcCd: gv_selectedApcCd, delYn: "N"}, null, true);
		const data = await postJsonPromise;
		$("#cnpt").text(data.resultList.length + '개');
	}
	const getUserList = async function(){
		const postJsonPromise = gfn_postJSON("/co/authrt/selectComUserList.do",{apcCd:gv_selectedApcCd});
		const data = await postJsonPromise;
		if (!_.isEqual("S", data.resultStatus)) {
		        gfn_comAlert(data.resultCode, data.resultMessage);
		        return;
		}
		$("#user").text(data.resultList.length + '명');
	}

	const fn_search = async function(){
		let ymd = SBUxMethod.get("srch-dtl-ymd");
		let param = {
			V_APC_CD : gv_selectedApcCd,
			V_YMD : ymd,
			V_RSLT_TYPE : 'ABC',
			R_CUR_SMRY_APC : '',
			R_CUR_SMRY_YY : '',
			R_CUR_SMRY_MM : '',
			R_CUR_ITEM_YY : '',
			R_CUR_ITEM_MM : '',
			R_CUR_ITEM_TRC : '',
			R_ERR_CD : '',
			R_ERR_MSG : ''
		};

		const postJsonPromise = gfn_postJSON("/co/dashboard/selectData.do",param);
		const data = await postJsonPromise;
		console.log(data,"???");
		if (!_.isEqual("S", data.resultStatus)) {
		        gfn_comAlert(data.resultCode, data.resultMessage);
		        return;
		}
		curItemMM = data.R_CUR_ITEM_MM;
		curItemYY = data.R_CUR_ITEM_YY;
		curSmryMM = data.R_CUR_SMRY_MM;
		curSmryYY = data.R_CUR_SMRY_YY;
		curItemTRC = data.R_CUR_ITEM_TRC;
		await fn_setYM();
		await fn_setTrc();
	}
	const fn_setYM = async function(){
		let ym = SBUxMethod.get('idx');

		if(ym === 'mm'){
			fn_donutFormat(curItemMM);
			fn_cardFormat(curSmryMM);
		}else if(ym ==='yy'){
			fn_donutFormat(curItemYY);
			fn_cardFormat(curSmryYY);
		}
		await fn_createWrhs();
		await fn_createSort();
		await fn_createSpmt();
	}
	const fn_setTrc = async function(){
		fn_trendFormat(curItemTRC);
	}

	const fn_donutFormat= function(arr = []){
		columnWrhs.length = 0;
		columnSort.length = 0;
		columnSpmt.length = 0;

		if(gfn_isEmpty(arr)){
			return;
		}
		let wrhs = [];
		let sort = [];
		let spmt = [];

		arr.forEach(function(item){
			let type = item.RSLT_TYPE;

			switch (type){
				case '01' :
					wrhs.push([item.ITEM_NM,item.WGHT]);
					break;
				case '02' :
					sort.push([item.ITEM_NM,item.WGHT])
					break;
				case '03' :
					spmt.push([item.ITEM_NM,item.WGHT])
					break;
			}
		});
		columnWrhs = wrhs;
		columnSort = sort;
		columnSpmt = spmt;
	}
	const fn_cardFormat = function(arr = []){
		if(gfn_isEmpty(arr)){
			return;
		}
		arr.forEach(function(item){
			let type = item.RSLT_TYPE;
			switch(type){
				case '01' :
					$("#wrhsCard").text(formatCommas(item.WGHT || 0));
					break;
				case '02' :
					$("#sortCard").text(formatCommas(item.WGHT || 0));
					break;
				case '03' :
					$("#spmtCard").text(formatCommas(item.WGHT || 0));
					break;
			}
		});
	}
	const fn_trendFormat = function(arr = []){
		let type = SBUxMethod.get('trc');
		const groupedItems = arr.reduce((acc, item) => {
			if (!acc[item.ITEM_NM]) {
				acc[item.ITEM_NM] = [];
			}
			acc[item.ITEM_NM].push(item);
			return acc;
		}, {});
		trcColumns.length = 0;

		// trcColumns
		Object.entries(groupedItems).forEach(([key, value]) => {
			let arr = [];
			/** 명칭 입력 **/
			arr.push(key);
			let convert = value
					.filter(item => item.RSLT_TYPE === type)
					.map(inner => [
						inner.W_11, inner.W_10, inner.W_9,
						inner.W_8, inner.W_7, inner.W_6,
						inner.W_5, inner.W_4, inner.W_3,
						inner.W_2, inner.W_1, inner.W_0
					]);
			arr = [...arr, ...convert.flat()];
			trcColumns.push(arr);
		});
		fn_createTrend();
	}
	function formatCommas(number) {
		if(gfn_isEmpty(number)){
			return;
		}
		return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

</script>
</body>
</html>