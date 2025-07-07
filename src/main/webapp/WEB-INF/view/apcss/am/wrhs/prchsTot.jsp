
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 수매집계 -->
				</div>
				<div style="margin-left: auto;">
                    <sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
						text="조회"
					></sbux-button>
				</div>
			</div>

			<div class="box-body srch-keyup-area">
				<!--[APC] START -->

				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r th_bg">APC명</th>
							<td colspan="2"  class="td_input">
								<%@ include file="../../../frame/inc/apcSelectComp.jsp" %>
							</td>
							<td></td>
							<th class="ta_r th_bg">연도</th>
							<td colspan="3"  class="td_input">
								<sbux-datepicker
									id="srch-dtp-yr"
									name="srch-dtp-yr"
									uitype="popup"
									datepicker-mode="year"
									onchange="fn_yrChange(srch-dtp-yr)"
									class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"
								></sbux-datepicker>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="table-responsive tbl_scroll_sm">

					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>담당자별 내역</span>
							</li>
						</ul>
						<div class="ad_tbl_toplist">

						</div>
					</div>

					<div class="table-responsive tbl_scroll_sm" style="width:100%">
						<div id="sb-area-prchsPicTot" style="height:200px; width:100%"></div>
					</div>

					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>담당자 지역별 내역</span>
							</li>
						</ul>
						<div class="ad_tbl_toplist">

						</div>
					</div>

					<div class="table-responsive tbl_scroll_sm" style="width:100%">
						<div id="sb-area-prchsPicCtpvTot" style="height:450px; width:100%"></div>
					</div>

					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span>지역별 내역</span>
							</li>
						</ul>
						<div class="ad_tbl_toplist">

						</div>
					</div>

					<div class="table-responsive tbl_scroll_sm" style="width:100%">
						<div id="sb-area-prchsCtpvTot" style="height:420px; width:100%"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonPrchsPicTot = [];
	var jsonPrchsPicCtpvTot = [];
	var jsonPrchsCtpvTot = [];
	var grdPrchsPicTot;
	var grdPrchsPicCtpvTot;
	var grdPrchsCtpvTot;
	const year = gfn_dateToYear(new Date());
	const month = 6;		// 수매월 정의

	const days = ["일", "월", "화", "수", "목", "금", "토"];

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([

		]);

		SBUxMethod.set('srch-dtp-yr', gfn_dateToYear(new Date()));
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSBSelect();
		fn_createPrchsGrid();
		fn_createPrchsPicCtpvGrid();
		fn_createPrchsCtpvGrid();
	})

	/**
	 * @name fn_createPrchsGrid
	 * @description 담당자별 Grid
	 */
	const fn_createPrchsGrid = function () {
		var SBGridProperties = {};
		SBGridProperties.parentid = "sb-area-prchsPicTot";
		SBGridProperties.id = "grdPrchsPicTot";
		SBGridProperties.jsonref = "jsonPrchsPicTot";
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.explorerbar = 'sort';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.allowcopy = true;
		SBGridProperties.scrollbubbling = false;
		SBGridProperties.total = {
			type 		: 'grand',
			position	: 'bottom',
			columns		: {
				standard : [0],
				sum : _.range(1, 5).concat(_.range(6, 36))
			},
			grandtotalrow : {
				titlecol 	: 0,
				titlevalue	: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol	: 0
			},
			datasorting	: true,
			usedecimal : false,
		};

		let columns = [];
		columns.push(
				{caption : ['담당자'], 			ref: 'pic', 		type: 'output', 		width: '140px', style:'text-align:center;'},
				{caption : ['수매계획예상'], 		ref: 'expctQntt', 	type: 'output', 		width: '100px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['잔여'], 			ref: 'rmnd', 		type: 'output', 		width: '60px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['입고누계'], 		ref: 'wrhsWght', 	type: 'output', 		width: '60px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['입고차이'], 		ref: 'minusRmnd', 	type: 'output', 		width: '60px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['입고율'], 			ref: 'wrhsRt', 		type: 'output', 		width: '60px', style: 'text-align:right;', format : {type:'number', rule:'###.##'}},
		)

		let lastDay = (new Date(year, month, 0)).getDate();

		for (let i=1; i<=lastDay; i++) {
			let refId = 'ymd' + i + 'Qntt';
			let captionText = getKoreanDayOfWeek(year, month, i);
			let style = 'text-align:center;';
			let fixedstyle = '';
			if (captionText === '일') {
				fixedstyle = 'color:red;';
			}

			columns.push(
					{caption : [captionText+'<br>'+month+'/'+i], 		ref: refId, 		type: 'output', 		width: '60px', style:style, fixedstyle: fixedstyle},
			)
		}

		SBGridProperties.columns = columns;
		grdPrchsPicTot = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createPrchsPicCtpvGrid
	 * @description 담당자 지역별 Grid
	 */
	const fn_createPrchsPicCtpvGrid = function () {
		var SBGridProperties = {};
		SBGridProperties.parentid = "sb-area-prchsPicCtpvTot";
		SBGridProperties.id = "grdPrchsPicCtpvTot";
		SBGridProperties.jsonref = "jsonPrchsPicCtpvTot";
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.explorerbar = 'sort';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.allowcopy = true;
		SBGridProperties.scrollbubbling = false;
		SBGridProperties.total = {
			type 		: 'grand',
			position	: 'bottom',
			columns		: {
				standard : [0],
				sum : _.range(2, 6).concat(_.range(7, 37))
			},
			grandtotalrow : {
				titlecol 	: 0,
				titlevalue	: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol	: 0
			},
			datasorting	: true,
			usedecimal : false,
		};

		let columns = [];
		columns.push(
				{caption : ['담당자'], 			ref: 'pic', 		type: 'output', 		width: '80px', style:'text-align:center;'},
				{caption : ['지역'], 			ref: 'frmhsCtpv', 	type: 'output', 		width: '60px', style:'text-align:center;'},
				{caption : ['수매계획예상'], 		ref: 'expctQntt', 	type: 'output', 		width: '100px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['잔여'], 			ref: 'rmnd', 		type: 'output', 		width: '60px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['입고누계'], 		ref: 'wrhsWght', 	type: 'output', 		width: '60px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['입고차이'], 		ref: 'minusRmnd', 	type: 'output', 		width: '60px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['입고율'], 			ref: 'wrhsRt', 		type: 'output', 		width: '60px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
		)

		let lastDay = (new Date(year, month, 0)).getDate();

		for (let i=1; i<=lastDay; i++) {
			let refId = 'ymd' + i + 'Qntt';
			let captionText = getKoreanDayOfWeek(year, month, i);
			let style = 'text-align:center;';
			let fixedstyle = '';
			if (captionText === '일') {
				fixedstyle = 'color:red;';
			}

			columns.push(
					{caption : [captionText+'<br>'+month+'/'+i], 		ref: refId, 		type: 'output', 		width: '60px', style:style, fixedstyle: fixedstyle},
			)
		}

		SBGridProperties.columns = columns;
		grdPrchsPicCtpvTot = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createPrchsCtpvGrid
	 * @description 지역별 Grid
	 */
	const fn_createPrchsCtpvGrid = function () {
		var SBGridProperties = {};
		SBGridProperties.parentid = "sb-area-prchsCtpvTot";
		SBGridProperties.id = "grdPrchsCtpvTot";
		SBGridProperties.jsonref = "jsonPrchsCtpvTot";
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.explorerbar = 'sort';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.allowcopy = true;
		SBGridProperties.scrollbubbling = false;
		SBGridProperties.total = {
			type 		: 'grand',
			position	: 'bottom',
			columns		: {
				standard : [0],
				sum : _.range(1, 5).concat(_.range(6, 36))
			},
			grandtotalrow : {
				titlecol 	: 0,
				titlevalue	: '합계',
				style : 'background-color: #ceebff ; font-weight: bold; color: #0060b3;',
				stylestartcol	: 0
			},
			datasorting	: true,
			usedecimal : false,
		};

		let columns = [];
		columns.push(
				{caption : ['지역'], 			ref: 'frmhsCtpv', 	type: 'output', 		width: '140px', style:'text-align:center;'},
				{caption : ['수매계획예상'], 		ref: 'expctQntt', 	type: 'output', 		width: '100px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['잔여'], 			ref: 'rmnd', 		type: 'output', 		width: '60px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['입고누계'], 		ref: 'wrhsWght', 	type: 'output', 		width: '60px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['입고차이'], 		ref: 'minusRmnd', 	type: 'output', 		width: '60px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['입고율'], 			ref: 'wrhsRt', 		type: 'output', 		width: '60px', style: 'text-align:right;', format : {type:'number', rule:'#,###'}},
		)

		let lastDay = (new Date(year, month, 0)).getDate();

		for (let i=1; i<=lastDay; i++) {
			let refId = 'ymd' + i + 'Qntt';
			let captionText = getKoreanDayOfWeek(year, month, i);
			let style = 'text-align:center;';
			let fixedstyle = '';
			if (captionText === '일') {
				fixedstyle = 'color:red;';
			}

			columns.push(
					{caption : [captionText+'<br>'+month+'/'+i], 		ref: refId, 		type: 'output', 		width: '60px', style:style, fixedstyle: fixedstyle},
			)
		}

		SBGridProperties.columns = columns;
		grdPrchsCtpvTot = _SBGrid.create(SBGridProperties);
	}

	const fn_search = async function () {

		let rst = await Promise.all([
			fn_selectPrchsPicTot(),
			fn_selectPrchsPicCtpvTot(),
			fn_selectPrchsCtpvTot(),
		]);

	}

	/**
	 * @name fn_selectPrchsPicTot
	 * @description 수매집계 - 담당자별 목록 조회
	 */
	const fn_selectPrchsPicTot = async function () {

		let yr = SBUxMethod.get("srch-dtp-yr");

		if (gfn_isEmpty(yr)) {
			gfn_comAlert("W0001", "연도");				//	W0002	{0}을/를 선택하세요.
			return;
		}

		const param = {
			  apcCd		: gv_selectedApcCd
			, yr		: yr
		}
		jsonPrchsPicTot.length = 0;
		try {
			const postJsonPromise = gfn_postJSON(
					"/am/wrhs/selectPrchsPicTotList.do",
					param,
					null,
					false
			);
			const data = await postJsonPromise;

			data.resultList.forEach((item, index) => {

				const prchsPicTotVO = {

					  apcCd				  : item.apcCd
					, pic             	  : item.pic
					, frmhsCtpv           : item.frmhsCtpv
					, wrhsWght            : item.wrhsWght
					, wrhsRt           	  : item.wrhsRt
					, rmnd           	  : item.rmnd
					, minusRmnd           : item.rmnd * -1
					, expctQntt           : item.expctQntt
					, yr                  : item.yr
					, ymd1Qntt            : fn_zero(item.ymd1Qntt)
					, ymd2Qntt            : fn_zero(item.ymd2Qntt)
					, ymd3Qntt            : fn_zero(item.ymd3Qntt)
					, ymd4Qntt            : fn_zero(item.ymd4Qntt)
					, ymd5Qntt            : fn_zero(item.ymd5Qntt)
					, ymd6Qntt            : fn_zero(item.ymd6Qntt)
					, ymd7Qntt            : fn_zero(item.ymd7Qntt)
					, ymd8Qntt            : fn_zero(item.ymd8Qntt)
					, ymd9Qntt            : fn_zero(item.ymd9Qntt)
					, ymd10Qntt           : fn_zero(item.ymd10Qntt)
					, ymd11Qntt           : fn_zero(item.ymd11Qntt)
					, ymd12Qntt           : fn_zero(item.ymd12Qntt)
					, ymd13Qntt           : fn_zero(item.ymd13Qntt)
					, ymd14Qntt           : fn_zero(item.ymd14Qntt)
					, ymd15Qntt           : fn_zero(item.ymd15Qntt)
					, ymd16Qntt           : fn_zero(item.ymd16Qntt)
					, ymd17Qntt           : fn_zero(item.ymd17Qntt)
					, ymd18Qntt           : fn_zero(item.ymd18Qntt)
					, ymd19Qntt           : fn_zero(item.ymd19Qntt)
					, ymd20Qntt           : fn_zero(item.ymd20Qntt)
					, ymd21Qntt           : fn_zero(item.ymd21Qntt)
					, ymd22Qntt           : fn_zero(item.ymd22Qntt)
					, ymd23Qntt           : fn_zero(item.ymd23Qntt)
					, ymd24Qntt           : fn_zero(item.ymd24Qntt)
					, ymd25Qntt           : fn_zero(item.ymd25Qntt)
					, ymd26Qntt           : fn_zero(item.ymd26Qntt)
					, ymd27Qntt           : fn_zero(item.ymd27Qntt)
					, ymd28Qntt           : fn_zero(item.ymd28Qntt)
					, ymd29Qntt           : fn_zero(item.ymd29Qntt)
					, ymd30Qntt           : fn_zero(item.ymd30Qntt)
					, ymd31Qntt           : fn_zero(item.ymd31Qntt)
					, tot                 : fn_zero(item.tot)

				}
				jsonPrchsPicTot.push(prchsPicTotVO);
			});

			grdPrchsPicTot.rebuild();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
		let wrhsWght = parseFloat(jsonPrchsPicTot[jsonPrchsPicTot.length -1].wrhsWght);
		let expctQntt = parseFloat(jsonPrchsPicTot[jsonPrchsPicTot.length -1].expctQntt);

		let wrhsRt = Math.round((wrhsWght / expctQntt) * 100).toFixed(2);
		let wrhsRtCol = grdPrchsPicTot.getColRef("wrhsRt");

		grdPrchsPicTot.setCellData(grdPrchsPicTot.getRows() - 1 , wrhsRtCol, wrhsRt);

	}

	/**
	 * @name fn_selectPrchsPicCtpvTot
	 * @description 수매집계 - 담당자 지역별 목록 조회
	 */
	const fn_selectPrchsPicCtpvTot = async function () {

		let yr = SBUxMethod.get("srch-dtp-yr");

		if (gfn_isEmpty(yr)) {
			gfn_comAlert("W0001", "연도");				//	W0002	{0}을/를 선택하세요.
			return;
		}

		const param = {
			apcCd		: gv_selectedApcCd
			, yr		: yr
		}
		jsonPrchsPicCtpvTot.length = 0;
		try {
			const postJsonPromise = gfn_postJSON(
					"/am/wrhs/selectPrchsPicCtpvTotList.do",
					param,
					null,
					false
			);
			const data = await postJsonPromise;

			data.resultList.forEach((item, index) => {

				const prchsPicCtpvTotVO = {

					  apcCd				  : item.apcCd
					, frmhsCtpv           : item.frmhsCtpv
					, pic				  : item.pic
					, wrhsWght            : item.wrhsWght
					, wrhsRt           	  : item.wrhsRt
					, rmnd           	  : item.rmnd
					, minusRmnd           : item.rmnd * -1
					, expctQntt           : item.expctQntt
					, yr                  : item.yr
					, ymd1Qntt            : fn_zero(item.ymd1Qntt)
					, ymd2Qntt            : fn_zero(item.ymd2Qntt)
					, ymd3Qntt            : fn_zero(item.ymd3Qntt)
					, ymd4Qntt            : fn_zero(item.ymd4Qntt)
					, ymd5Qntt            : fn_zero(item.ymd5Qntt)
					, ymd6Qntt            : fn_zero(item.ymd6Qntt)
					, ymd7Qntt            : fn_zero(item.ymd7Qntt)
					, ymd8Qntt            : fn_zero(item.ymd8Qntt)
					, ymd9Qntt            : fn_zero(item.ymd9Qntt)
					, ymd10Qntt           : fn_zero(item.ymd10Qntt)
					, ymd11Qntt           : fn_zero(item.ymd11Qntt)
					, ymd12Qntt           : fn_zero(item.ymd12Qntt)
					, ymd13Qntt           : fn_zero(item.ymd13Qntt)
					, ymd14Qntt           : fn_zero(item.ymd14Qntt)
					, ymd15Qntt           : fn_zero(item.ymd15Qntt)
					, ymd16Qntt           : fn_zero(item.ymd16Qntt)
					, ymd17Qntt           : fn_zero(item.ymd17Qntt)
					, ymd18Qntt           : fn_zero(item.ymd18Qntt)
					, ymd19Qntt           : fn_zero(item.ymd19Qntt)
					, ymd20Qntt           : fn_zero(item.ymd20Qntt)
					, ymd21Qntt           : fn_zero(item.ymd21Qntt)
					, ymd22Qntt           : fn_zero(item.ymd22Qntt)
					, ymd23Qntt           : fn_zero(item.ymd23Qntt)
					, ymd24Qntt           : fn_zero(item.ymd24Qntt)
					, ymd25Qntt           : fn_zero(item.ymd25Qntt)
					, ymd26Qntt           : fn_zero(item.ymd26Qntt)
					, ymd27Qntt           : fn_zero(item.ymd27Qntt)
					, ymd28Qntt           : fn_zero(item.ymd28Qntt)
					, ymd29Qntt           : fn_zero(item.ymd29Qntt)
					, ymd30Qntt           : fn_zero(item.ymd30Qntt)
					, ymd31Qntt           : fn_zero(item.ymd31Qntt)
					, tot                 : fn_zero(item.tot)

				}
				jsonPrchsPicCtpvTot.push(prchsPicCtpvTotVO);
			});
			grdPrchsPicCtpvTot.rebuild();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}

		let wrhsWght = parseFloat(jsonPrchsPicCtpvTot[jsonPrchsPicCtpvTot.length -1].wrhsWght);
		let expctQntt = parseFloat(jsonPrchsPicCtpvTot[jsonPrchsPicCtpvTot.length -1].expctQntt);

		let wrhsRt = Math.round((wrhsWght / expctQntt) * 100).toFixed(2);
		let wrhsRtCol = grdPrchsPicCtpvTot.getColRef("wrhsRt");

		grdPrchsPicCtpvTot.setCellData(grdPrchsPicCtpvTot.getRows() - 1 , wrhsRtCol, wrhsRt);

	}

	/**
	 * @name fn_selectPrchsCtpvTot
	 * @description 수매집계 - 지역별 목록 조회
	 */
	const fn_selectPrchsCtpvTot = async function () {

		let yr = SBUxMethod.get("srch-dtp-yr");

		if (gfn_isEmpty(yr)) {
			gfn_comAlert("W0001", "연도");				//	W0002	{0}을/를 선택하세요.
			return;
		}

		const param = {
			apcCd		: gv_selectedApcCd
			, yr		: yr
		}
		jsonPrchsCtpvTot.length = 0;
		try {
			const postJsonPromise = gfn_postJSON(
					"/am/wrhs/selectPrchsCtpvTotList.do",
					param,
					null,
					false
			);
			const data = await postJsonPromise;

			data.resultList.forEach((item, index) => {

				const prchsCtpvTotVO = {

					  apcCd				  : item.apcCd
					, frmhsCtpv           : item.frmhsCtpv
					, wrhsWght            : item.wrhsWght
					, wrhsRt           	  : item.wrhsRt
					, rmnd           	  : item.rmnd
					, minusRmnd           : item.rmnd * -1
					, expctQntt           : item.expctQntt
					, yr                  : item.yr
					, ymd1Qntt            : fn_zero(item.ymd1Qntt)
					, ymd2Qntt            : fn_zero(item.ymd2Qntt)
					, ymd3Qntt            : fn_zero(item.ymd3Qntt)
					, ymd4Qntt            : fn_zero(item.ymd4Qntt)
					, ymd5Qntt            : fn_zero(item.ymd5Qntt)
					, ymd6Qntt            : fn_zero(item.ymd6Qntt)
					, ymd7Qntt            : fn_zero(item.ymd7Qntt)
					, ymd8Qntt            : fn_zero(item.ymd8Qntt)
					, ymd9Qntt            : fn_zero(item.ymd9Qntt)
					, ymd10Qntt           : fn_zero(item.ymd10Qntt)
					, ymd11Qntt           : fn_zero(item.ymd11Qntt)
					, ymd12Qntt           : fn_zero(item.ymd12Qntt)
					, ymd13Qntt           : fn_zero(item.ymd13Qntt)
					, ymd14Qntt           : fn_zero(item.ymd14Qntt)
					, ymd15Qntt           : fn_zero(item.ymd15Qntt)
					, ymd16Qntt           : fn_zero(item.ymd16Qntt)
					, ymd17Qntt           : fn_zero(item.ymd17Qntt)
					, ymd18Qntt           : fn_zero(item.ymd18Qntt)
					, ymd19Qntt           : fn_zero(item.ymd19Qntt)
					, ymd20Qntt           : fn_zero(item.ymd20Qntt)
					, ymd21Qntt           : fn_zero(item.ymd21Qntt)
					, ymd22Qntt           : fn_zero(item.ymd22Qntt)
					, ymd23Qntt           : fn_zero(item.ymd23Qntt)
					, ymd24Qntt           : fn_zero(item.ymd24Qntt)
					, ymd25Qntt           : fn_zero(item.ymd25Qntt)
					, ymd26Qntt           : fn_zero(item.ymd26Qntt)
					, ymd27Qntt           : fn_zero(item.ymd27Qntt)
					, ymd28Qntt           : fn_zero(item.ymd28Qntt)
					, ymd29Qntt           : fn_zero(item.ymd29Qntt)
					, ymd30Qntt           : fn_zero(item.ymd30Qntt)
					, ymd31Qntt           : fn_zero(item.ymd31Qntt)
					, tot                 : fn_zero(item.tot)

				}
				jsonPrchsCtpvTot.push(prchsCtpvTotVO);
			});

			grdPrchsCtpvTot.rebuild();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}

		let wrhsWght = parseFloat(jsonPrchsCtpvTot[jsonPrchsCtpvTot.length -1].wrhsWght);
		let expctQntt = parseFloat(jsonPrchsCtpvTot[jsonPrchsCtpvTot.length -1].expctQntt);

		let wrhsRt = Math.round((wrhsWght / expctQntt) * 100).toFixed(2);
		let wrhsRtCol = grdPrchsCtpvTot.getColRef("wrhsRt");

		grdPrchsCtpvTot.setCellData(grdPrchsCtpvTot.getRows() - 1 , wrhsRtCol, wrhsRt);
	}

	/**
	 * @name fn_zero
	 * @description 0 일때 빈값 처리
	 */
	const fn_zero = function(val) {

		if (gfn_isEmpty(val)) {
			return "";
		} else {
			if (val == 0) {
				return "";
			} else {
				return val;
			}
		}
	}
	/**
	 * @name getKoreanDayOfWeek
	 * @description 연월일 기준 요일 구하기
	 */
	const getKoreanDayOfWeek = function (year, month, day) {

		// 6월은 30일까지 있습니다.
		if (day < 1 || day > 30) {
			return "유효하지 않은 날짜입니다. 6월은 1일부터 30일까지 있습니다.";
		}

		// JavaScript의 Date 객체에서 월은 0부터 시작합니다 (0: 1월, 1: 2월, ..., 5: 6월).
		const juneDate = new Date(year, month-1, day);

		// getDay() 메서드는 요일을 숫자로 반환합니다 (0: 일요일, 1: 월요일, 등).
		const dayIndex = juneDate.getDay();

		return days[dayIndex];
	}


</script>
</html>