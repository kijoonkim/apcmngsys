
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
										id="srch-dtp-igiYr"
										name="srch-dtp-igiYr"
										uitype="popup"
										datepicker-mode="year"
										class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc"
								></sbux-datepicker>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="row">
					<div class="row">
						<div class="col-sm-8">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li>
										<span>입고 실적</span>
									</li>
								</ul>
							</div>
							<div>
								<div id="sb-area-rawMtrWrhsPrfmncTot" style="height:212px;width:100%; "></div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li>
										<span>수기 입력 누계</span>
									</li>
								</ul>
							</div>
							<div>
								<div id="sb-area-rawMtrWrhsIgiTot" style="height:212px;width:100%; "></div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li>
									<span>시간대별 수매현황</span>
								</li>
							</ul>
						</div>
						<div>
							<div id="sb-area-rawMtrWrhsHr" style="height:82px;width:100%; "></div>
						</div>
					</div>
					<div class="row">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>농가 영농정보</span>
								</li>
							</ul>
						</div>
						<div>
							<table class="table table-bordered tbl_fixed">
								<caption>일반현황</caption>
								<colgroup>
									<col style="width:8%">
									<col style="width:6%">
									<col style="width:6%">
									<col style="width:8%">
									<col style="width:6%">
									<col style="width:6%">
									<col style="width:8%">
									<col style="width:6%">
									<col style="width:6%">
								</colgroup>
								<tbody>
								<tr>
									<th class="ta_r th_bg">농가명</th>
									<td colspan="2"  colspan="2" class="td_input">
										<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
										<sbux-input
												uitype="text"
												id="dtl-inp-prdcrNm"
												name="dtl-inp-prdcrNm"
												class="form-control input-sm"
												readonly
										></sbux-input>
									</td>
									<th scope="row" class="ta_r th_bg" >품질정보</th>
									<td colspan="2"  colspan="2" class="td_input">
										<sbux-input id="dtl-inp-qltEvlNm" name="dtl-inp-qltEvlNm" class="form-control input-sm" uitype="text" readonly></sbux-input>
									</td>
									<th scope="row" class="ta_r th_bg" >연락처</th>
									<td colspan="2"  colspan="2" class="td_input">
										<sbux-input
												id="dtl-inp-frmhsTelno"
												name="dtl-inp-frmhsTelno"
												class="form-control input-sm"
												uitype="text"
												mask = "{ 'mask': '999-9999-9999', 'clearIncomplete': true, 'autoUnmask': true }"
												readonly
										></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg" >지역</th>
									<td colspan="2"  colspan="2" class="td_input">
										<sbux-input
												uitype="text"
												id="dtl-inp-frmhsCtpv"
												name="dtl-inp-frmhsCtpv"
												class="form-control input-sm"
												readonly
										></sbux-input>
									</td>
									<th scope="row" class="th_bg" >정식면적</th>
									<td colspan="2"  colspan="2" class="td_input">
										<sbux-input
												id="dtl-inp-plntngPrcl"
												name="dtl-inp-plntngPrcl"
												class="form-control input-sm"
												uitype="text"
												mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
												readonly
										></sbux-input>
									</td>
									<th scope="row" class="th_bg" >종자</th>
									<td colspan="2"  colspan="2" class="td_input">
										<sbux-input
												id="dtl-inp-seed"
												name="dtl-inp-seed"
												class="form-control input-sm"
												uitype="text"
												readonly
										></sbux-input>
									</td>
								</tr>
								<tr>
									<th scope="row" class="th_bg" >수매예상</th>
									<td colspan="2"  colspan="2" class="td_input">
										<sbux-input
												id="dtl-inp-expctQntt"
												name="dtl-inp-expctQntt"
												class="form-control input-sm"
												uitype="text"
												mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
												readonly
										></sbux-input>
									</td>
									<th scope="row" class="th_bg" >현수매</th>
									<td colspan="2"  colspan="2" class="td_input">
										<sbux-input
												id="dtl-inp-prchsQntt"
												name="dtl-inp-prchsQntt"
												class="form-control input-sm"
												uitype="text"
												mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
												readonly
										></sbux-input>
									</td>
									<th scope="row" class="th_bg" >선수금</th>
									<td colspan="2"  colspan="2" class="td_input">
										<sbux-input
												id="dtl-inp-adpyr"
												name="dtl-inp-adpyr"
												class="form-control input-sm"
												uitype="text"
												mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
												readonly
										></sbux-input>
									</td>
									</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
					<div class="row">
						<div class="col-sm-3">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li>
										<span>재배품질이력</span>
									</li>
								</ul>
							</div>
							<div>
								<div id="sb-area-cltvtnHstry" style="height:800px;width:100%; "></div>
							</div>
						</div>
						<div class="col-sm-9">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li>
										<span>수기입력 내용</span>
									</li>
								</ul>
							</div>
							<div>
								<div id="sb-area-rawMtrWrhsIgi" style="height:800px;width:100%; "></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonRawMtrWrhsIgi = [];
	var jsonRawMtrWrhsIgiTot = [];
	var jsonCltvtnHstry = [];
	var jsonPrchsCtpvTot = [];
	var jsonRawMtrWrhsPrfmncTot = [];
	var jsonRawMtrWrhsHr = [];
	var jsonIgiGrdCd = [];
	var jsonIgiGrdRt = [];

	var grdRawMtrWrhsIgi;
	var grdRawMtrWrhsIgiTot;
	var grdPrchsCtpvTot;
	var grdRawMtrWrhsPrfmncTot;
	var grdRawMtrWrhsHr;

	var jsonWrhsHmCd = [];
	var jsonComSmplYn = [{'label' : "샘플", 'value' : 'Y'}];

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([

		]);

		SBUxMethod.set('srch-dtp-igiYr', gfn_dateToYear(new Date()));
	}



	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSBSelect();
		fn_createRawMtrWrhsIgiGrid();
		fn_createRawMtrWrhsIgiTotGrid();
		fn_createCltvtnHstry();
		fn_createRawMtrWrhsPrfmncTot();
		fn_createRawMtrWrhsTime();
	})

	/**
	 * @name fn_createRawMtrWrhsIgiGrid
	 * @description 수기입력 내용 Grid
	 */
	const fn_createRawMtrWrhsIgiGrid = async function () {
		var SBGridProperties = {};
		SBGridProperties.parentid = "sb-area-rawMtrWrhsIgi";
		SBGridProperties.id = "grdRawMtrWrhsIgi";
		SBGridProperties.jsonref = "jsonRawMtrWrhsIgi";
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.allowcopy = true;
		let columns = [
			{caption : ['일자', '일자'], 						ref: 'igiYmd', 		type : 'output', 	width: '10%', 	style:'text-align:center;',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			{caption : ['검수<br>판정', '검수<br>판정'], 			ref: 'igiJgmtNm', 		type:'output', 	width: '5%',		style:'text-align:center;'},
			{caption : ['샘플링<br>여부', '샘플링<br>여부'], 		ref: 'smplYn', 			type:'combo',  		width: '5%',style:'text-align:center;',
				typeinfo : {ref:'jsonComSmplYn', 	displayui : false,	itemcount: 10, label:'label', value:'value'}, disabled: true},
			{caption : ['입고<br>수량', '입고<br>수량'], 	ref: 'igiGrdQnttTot', 	type:'output', 	width: '5%', 		style:'text-align:right;'},
		]
		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdRawMtrWrhsIgi', 	jsonIgiGrdCd,  		'IGI_GRD_CD', 	gv_selectedApcCd),		// 검수등급
			gfn_setComCdSBSelect('grdRawMtrWrhsIgi', 	jsonIgiGrdRt,  		'IGI_GRD_RT',  	gv_selectedApcCd),		// 검수비율
		]);

		for (var i=1; i<=jsonIgiGrdCd.length; i++) {

			let igiGrdCdCaption = jsonIgiGrdCd[i-1].text;
			let igiGrdQnttRef = 'igiGrdQntt' + i;
			columns.push(
					{
						caption : ['등급별 톤백수량', igiGrdCdCaption],
						ref: igiGrdQnttRef,
						type: 'output',
						width: '5%',
						style:'text-align:right;',
						format : {type:'number', rule:'#,###'}
					},
			)
		}

		for (var j=1; j<=jsonIgiGrdRt.length; j++) {

			let igiGrdRtCaption = jsonIgiGrdRt[j-1].text;
			let igiGrdRtRef = 'igiGrdRt' + j;
			columns.push(
					{
						caption : ['비율 적용', igiGrdRtCaption],
						ref: igiGrdRtRef,
						type: 'output',
						width: '5%',
						style:'text-align:right;',
						format : {type:'number', rule:'#,###'}
					},
			)
		}
		columns.push(
				{caption : ['감량항목', '항목'], 						ref: 'rwArtclNm', 		type: 'output', width: '5%',style:'text-align:center;'},
				{caption : ['감량항목', '%'], 						ref: 'rwRt', 			type: 'output', width: '5%', style:'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['회송<br>톤백수량', '회송<br>톤백수량'], 	ref: 'sndbkQntt', 		type: 'output', width: '5%', style:'text-align:right;', format : {type:'number', rule:'#,###'}},
				{caption : ['검수내용', '검수내용'], 					ref: 'igiRmrk', 		type: 'output', width: '15%', style:'text-align:left;'},
		)

		SBGridProperties.columns = columns;
		grdRawMtrWrhsIgi = _SBGrid.create(SBGridProperties);
		grdRawMtrWrhsIgi.rebuild();

	}

	/**
	 * @name fn_createPrchsPicCtpvGrid
	 * @description 수기 입력 누계 Grid
	 */
	const fn_createRawMtrWrhsIgiTotGrid = async function () {
		var SBGridProperties = {};
		SBGridProperties.parentid = "sb-area-rawMtrWrhsIgiTot";
		SBGridProperties.id = "grdRawMtrWrhsIgiTot";
		SBGridProperties.jsonref = "jsonRawMtrWrhsIgiTot";
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.allowcopy = true;
		SBGridProperties.total = {
			type 		: 'grand',
			position	: 'bottom',
			columns		: {
				standard : [0],
				sum : _.range(1, 7)
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
				{caption : ['검수<br>판정', '검수<br>판정'], 		ref: 'igiJgmtNm', 	type: 'output', 		width: '15%', style:'text-align:center;'},
		)

		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdRawMtrWrhsIgi', 	jsonIgiGrdCd,  		'IGI_GRD_CD', 	gv_selectedApcCd),		// 검수등급
		]);

		for (var i=1; i<=jsonIgiGrdCd.length; i++) {

			let igiGrdCdCaption = jsonIgiGrdCd[i-1].text;
			let igiGrdQnttRef = 'strgLoctnQntt' + i;
			columns.push(
					{
						caption : ['등급별 톤백수량', igiGrdCdCaption],
						ref: igiGrdQnttRef,
						type: 'output',
						width: '14%',
						style:'text-align:right;',
						format : {type:'number', rule:'#,###'}
					},
			)
		}
		columns.push(
				{caption : ['합계', '합계'], 		ref: 'strgLoctnQnttTot', 	type: 'output', 		width: '16%', style:'text-align:right;', format : {type:'number', rule:'#,###'}}
		)

		SBGridProperties.columns = columns;
		grdRawMtrWrhsIgiTot = _SBGrid.create(SBGridProperties);

	}

	/**
	 * @name fn_selectPrchsPicTot
	 * @description 농가 재배품질이력 Grid
	 */
	const fn_createCltvtnHstry = function () {
		var SBGridProperties = {};
		SBGridProperties.parentid = "sb-area-cltvtnHstry";
		SBGridProperties.id = "grdCltvtnHstry";
		SBGridProperties.jsonref = "jsonCltvtnHstry";
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.allowcopy = true;
		SBGridProperties.columns = [
			{caption : ['확인일자'], 		ref: 'cfmtnYmd', 	type : 'output', 	width: '30%', style:'text-align:center;',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			{caption : ['수확 후 관리'], 	ref: 'cn', 			type: 'output', 		width: '70%', style: 'text-align:left;'},

		];
		grdCltvtnHstry = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createRawMtrWrhsPrfmncTot
	 * @description 입고 실적 합계 Grid
	 */
	const fn_createRawMtrWrhsPrfmncTot = async function () {
		var SBGridProperties = {};
		SBGridProperties.parentid = "sb-area-rawMtrWrhsPrfmncTot";
		SBGridProperties.id = "grdRawMtrWrhsPrfmncTot";
		SBGridProperties.jsonref = "jsonRawMtrWrhsPrfmncTot";
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.allowcopy = true;
		SBGridProperties.mergecells = 'bycolrec';
		SBGridProperties.total = {
			type 		: 'grand',
			position	: 'bottom',
			columns		: {
				standard : [0],
				sum : _.range(1, 6)
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
				{caption : ['구분'], 		ref: 'vrtyNm', 	type : 'output', 	width: '10%', style:'text-align:center;', merge : false},
		)

		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdRawMtrWrhsIgi', 	jsonIgiGrdRt,  		'IGI_GRD_RT',  	gv_selectedApcCd),		// 검수등급
		]);

		for (let i=1; i<=jsonIgiGrdRt.length; i++) {

			let igiGrdCdCaption = jsonIgiGrdCd[i-1].text;
			let igiGrdQnttRef = 'grdWght' + i;
			columns.push(
					{
						caption : [igiGrdCdCaption],
						ref: igiGrdQnttRef,
						type: 'output',
						width: '10%',
						style:'text-align:right;',
					    merge : false,
						format : {type:'number', rule:'#,###'}
					},
			)
		}

		columns.push(
				{caption : ['합계'], 			ref: 'grdWghtTot', 		type : 'output', 	width: '10%', style:'text-align:right;', merge : false, format : {type:'number', rule:'#,###'}},
				{caption : ['수매예상량'], 		ref: 'expctQnttTot', 	type : 'output', 	width: '10%', style:'text-align:right;', merge : false, format : {type:'number', rule:'#,###.##'}},
				{caption : ['전일대비'], 		ref: 'bfrCmprn', 		type : 'output', 	width: '10%', style:'text-align:right;', format : {type:'number', rule:'#,###.##'}},
		)


		let toDay = new Date();
		let yesterDay = new Date();
		yesterDay.setDate(yesterDay.getDate() - 1);

		columns.push(
				{caption : [gfn_dateToYmd(toDay).substring(6,4) + "/" + gfn_dateToYmd(toDay).substring(6)], 			ref: 'todayGrdQnttTot', 	type : 'output', 	width: '10%', style:'text-align:right;', merge : false, format : {type:'number', rule:'#,###'}},
				{caption : [gfn_dateToYmd(yesterDay).substring(6,4) + "/" + gfn_dateToYmd(yesterDay).substring(6)], 	ref: 'yesterdayGrdQnttTot', type : 'output', 	width: '10%', style:'text-align:right;', merge : false, format : {type:'number', rule:'#,###'}},
		)

		SBGridProperties.columns = columns;

		grdRawMtrWrhsPrfmncTot = _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_createRawMtrWrhsPrfmncTot
	 * @description 시간대별 수매현황
	 */
	const fn_createRawMtrWrhsTime = async function () {

		var SBGridProperties = {};
		SBGridProperties.parentid = "sb-area-rawMtrWrhsHr";
		SBGridProperties.id = "grdRawMtrWrhsHr";
		SBGridProperties.jsonref = "jsonRawMtrWrhsHr";
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.allowcopy = true;
		let columns = [
			{caption : ['구분'], 		ref: 'dtlNm', 	type : 'output', 	width: '10%', style:'text-align:center;'},
		];


		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdRawMtrWrhsHr', 	jsonWrhsHmCd,  		'WRHS_HM_CD',  	gv_selectedApcCd),		// 입고시간
		]);

		for (let i=1; i<jsonWrhsHmCd.length; i++) {

			let wrhsHmCaption = jsonWrhsHmCd[i-1].text;
			let wrhsHmQnttRef = 'wrhsHmQntt' + i;
			columns.push(
					{
						caption : [wrhsHmCaption],
						ref: wrhsHmQnttRef,
						type: 'output',
						width: '15%',
						style:'text-align:right;',
						merge : false,
						format : {type:'number', rule:'#,###'}
					},
			)
		}

		SBGridProperties.columns = columns;

		grdRawMtrWrhsHr = _SBGrid.create(SBGridProperties);
	}


	const fn_search = async function () {

		let rst = await Promise.all([
			fn_selectRawMtrWrhsIgi(),
		]);

	}
	/**
	* @name fn_selectPrchsPicTot
	* @description 수기입력 대장 목록 조회
	*/
	const fn_selectRawMtrWrhsIgi = async function () {


		let igiYr = SBUxMethod.get('srch-dtp-igiYr');

		if (gfn_isEmpty(igiYr)) {
			gfn_comAlert("W0001", "연도");				//	W0002	{0}을/를 선택하세요.
			return;
		}

		const param = {
			  apcCd			: gv_selectedApcCd
			, prchsSttnYn	: "Y"
			, itemCd		: "1201"
			, igiYr			: igiYr
			, igiYmd 		: gfn_dateToYmd(new Date())
		}
		jsonRawMtrWrhsIgi.length = 0;
		jsonCltvtnHstry.length = 0;
		jsonRawMtrWrhsIgiTot.length = 0;
		try {
			const postJsonPromise = gfn_postJSON(
					"/am/wrhs/selectPrchsSttn.do",
					param,
					null,
					true
			);
			const data = await postJsonPromise;

			let prchsQntt = 0;

			data.resultList.forEach((item, index) => {

				const rawMtrWrhsIgiVO = {

					  apcCd				: item.apcCd
					, igiYmd            : item.igiYmd
					, igiSeq           	: item.igiSeq
					, prdcrCd           : item.prdcrCd
					, prdcrNm           : item.prdcrNm
					, frmhsNm           : item.frmhsNm
					, igiJgmtCd         : item.igiJgmtCd
					, igiJgmtNm         : item.igiJgmtNm
					, smplYn            : item.smplYn
					, rwArtclCd         : item.rwArtclCd
					, rwArtclNm         : item.rwArtclNm
					, wrhsUnitCd        : item.wrhsUnitCd
					, rwRt				: fn_zero(item.rwRt)
					, sndbkQntt         : fn_zero(item.sndbkQntt)
					, igiRmrk           : item.igiRmrk
					, qnttRmrk          : item.qnttRmrk
					, rtRmrk            : item.rtRmrk
					, strgLoctnCd       : item.strgLoctnCd
					, strgLoctnNm       : item.strgLoctnNm
					, igiGrdQnttTot     : fn_zero(item.igiGrdQnttTot)
					, igiGrdQntt1       : fn_zero(item.igiGrdQntt1)
					, igiGrdQntt2       : fn_zero(item.igiGrdQntt2)
					, igiGrdQntt3       : fn_zero(item.igiGrdQntt3)
					, igiGrdQntt4       : fn_zero(item.igiGrdQntt4)
					, igiGrdQntt5       : fn_zero(item.igiGrdQntt5)
					, igiGrdRt1         : fn_zero(item.igiGrdRt1)
					, igiGrdRt2         : fn_zero(item.igiGrdRt2)
					, igiGrdRt3         : fn_zero(item.igiGrdRt3)
					, igiGrdRt4         : fn_zero(item.igiGrdRt4)
					, igiGrdRt5         : fn_zero(item.igiGrdRt5)
					, delYn				: 'N'
				}
				prchsQntt += parseInt(item.igiGrdQnttTot || 0);
				jsonRawMtrWrhsIgi.push(rawMtrWrhsIgiVO);
			});

			grdRawMtrWrhsIgi.rebuild();

			/**
			* 수계 입력 누계
			* */
			data.resultList1.forEach((item, index) => {

				const rawMtrWrhsIgiVO = {

					  apcCd				: item.apcCd
					, igiJgmtCd         : item.igiJgmtCd
					, igiJgmtNm         : item.igiJgmtNm
					, strgLoctnQntt1     : fn_zero(item.strgLoctnQntt1)
					, strgLoctnQntt2     : fn_zero(item.strgLoctnQntt2)
					, strgLoctnQntt3     : fn_zero(item.strgLoctnQntt3)
					, strgLoctnQntt4     : fn_zero(item.strgLoctnQntt4)
					, strgLoctnQntt5     : fn_zero(item.strgLoctnQntt5)
					, strgLoctnQnttTot   : fn_zero(item.strgLoctnQnttTot)

				}
				jsonRawMtrWrhsIgiTot.push(rawMtrWrhsIgiVO);
			});

			grdRawMtrWrhsIgiTot.rebuild();

			/**
			 * 농가 영농 정보
			 * */
			let prdcrInfo = data.resultMap;

			SBUxMethod.set('dtl-inp-prdcrNm', prdcrInfo.prdcrNm);
			SBUxMethod.set('dtl-inp-frmhsTelno', prdcrInfo.telno);
			SBUxMethod.set('dtl-inp-frmhsCtpv', prdcrInfo.frmhsCtpv);
			SBUxMethod.set('dtl-inp-plntngPrcl', prdcrInfo.plntngPrcl);
			SBUxMethod.set('dtl-inp-qltEvlNm', prdcrInfo.qltEvlNm);
			SBUxMethod.set('dtl-inp-prchsQntt', prchsQntt);

			let seeds = [];
			for (let j=1; j<=5; j++) {

				let sdKey = "sd" + (j);

				if (!gfn_isEmpty(prdcrInfo[sdKey])) {
					seeds.push(prdcrInfo[sdKey]);
				}
			}

			let seed = seeds.join(", ");

			SBUxMethod.set('dtl-inp-seed', seed);
			SBUxMethod.set('dtl-inp-expctQntt', prdcrInfo.expctQntt);

			/**
			 * 농가 재배품질이력
			 * */
			data.resultList2.forEach((item, index) => {

				const cltvtnHstryVO = {
					  apcCd 			: item.apcCd
					, cn				: item.cn
					, cfmtnYmd			: item.cfmtnYmd
				}
				jsonCltvtnHstry.push(cltvtnHstryVO);
			});

			grdCltvtnHstry.rebuild();



			/**
			 * 입고실적 누계
			 * */
			let expctQnttTot = 0;
			let grdWghtTot = 0;
			let bfrCmprn = 0;
			jsonRawMtrWrhsPrfmncTot.length = 0;
			data.resultList3.forEach((item, index) => {

				let todayGrdQnttTot = '';
				let yesterdayGrdQnttTot = '';
				if (index == 0) {
					todayGrdQnttTot = item.todayGrdQnttTot;
					yesterdayGrdQnttTot = item.yesterdayGrdQnttTot;
					bfrCmprn = ((todayGrdQnttTot / yesterdayGrdQnttTot) * 100).toFixed(2);
				}

				if (index == 1) {
					todayGrdQnttTot = Math.round((item.todayGrdQnttTot || 0 ) * 21 / 1000);
					yesterdayGrdQnttTot = Math.round((item.yesterdayGrdQnttTot || 0) * 21 / 1000);
				}

				const rawMtrWrhsPrfmncVO = {
					  apcCd 				: item.apcCd
					, vrtyNm				: item.vrtyNm
				    , grdWght1				: fn_zero(item.grdWght1)
				    , grdWght2				: fn_zero(item.grdWght2)
				    , grdWght3				: fn_zero(item.grdWght3)
				    , grdWght4				: fn_zero(item.grdWght4)
				    , grdWght5				: fn_zero(item.grdWght5)
					, grdWghtTot			: fn_zero(item.grdWghtTot)
					, expctQnttTot			: fn_zero(item.expctQnttTot)
					, bfrCmprn				: fn_zero(bfrCmprn)
					, todayGrdQnttTot		: todayGrdQnttTot
					, yesterdayGrdQnttTot 	: yesterdayGrdQnttTot
				}
				jsonRawMtrWrhsPrfmncTot.push(rawMtrWrhsPrfmncVO);
				expctQnttTot = item.expctQnttTot;
				grdWghtTot += item.grdWghtTot || 0;

			})

			if (jsonRawMtrWrhsPrfmncTot.length > 2) {

				let expctQntt = Math.round((jsonRawMtrWrhsPrfmncTot[jsonRawMtrWrhsPrfmncTot.length-1].expctQnttTot || 0) * 21 / 1000)
				jsonRawMtrWrhsPrfmncTot[jsonRawMtrWrhsPrfmncTot.length-2].expctQnttTot = expctQntt;
			}

			grdRawMtrWrhsPrfmncTot.rebuild();
			let expctQnttTotCol = grdRawMtrWrhsPrfmncTot.getColRef("expctQnttTot");

			grdRawMtrWrhsPrfmncTot.setCellData(grdRawMtrWrhsPrfmncTot.getRows() - 1 , expctQnttTotCol, ((grdWghtTot  / (Math.round(expctQnttTot * 21 / 1000))) * 100).toFixed(1));

			/**
			 * 시간별입고실적
			 * */
			jsonRawMtrWrhsHr.length = 0;
			data.resultList4.forEach((item, index) => {
				const rawMtrWrhsHrPrfmncVO = {
					  apcCd 		: item.apcCd
					, dtlNm			: item.dtlNm
					, wrhsHm1		: item.wrhsHm1
					, wrhsHmQntt1	: fn_zero(item.wrhsHmQntt1)
					, wrhsHmWght1	: fn_zero(item.wrhsHmWght1)
					, wrhsHm2		: item.wrhsHm2
					, wrhsHmQntt2	: fn_zero(item.wrhsHmQntt2)
					, wrhsHmWght2	: fn_zero(item.wrhsHmWght2)
					, wrhsHm3		: item.wrhsHm3
					, wrhsHmQntt3	: fn_zero(item.wrhsHmQntt3)
					, wrhsHmWght3	: fn_zero(item.wrhsHmWght3)
					, wrhsHm4		: item.wrhsHm4
					, wrhsHmQntt4	: fn_zero(item.wrhsHmQntt4)
					, wrhsHmWght4	: fn_zero(item.wrhsHmWght4)
					, wrhsHm5		: item.wrhsHm5
					, wrhsHmQntt5	: fn_zero(item.wrhsHmQntt5)
					, wrhsHmWght5	: fn_zero(item.wrhsHmWght5)
					, wrhsHm6		: item.wrhsHm6
					, wrhsHmQntt6	: fn_zero(item.wrhsHmQntt6)
					, wrhsHmWght6	: fn_zero(item.wrhsHmWght6)
					, wrhsHm7		: item.wrhsHm7
					, wrhsHmQntt7	: fn_zero(item.wrhsHmQntt7)
					, wrhsHmWght7	: fn_zero(item.wrhsHmWght7)
					, wrhsHm8		: item.wrhsHm8
					, wrhsHmQntt8	: fn_zero(item.wrhsHmQntt8)
					, wrhsHmWght8	: fn_zero(item.wrhsHmWght8)
					, wrhsHm9		: item.wrhsHm9
					, wrhsHmQntt9	: fn_zero(item.wrhsHmQntt9)
					, wrhsHmWght9	: fn_zero(item.wrhsHmWght9)
					, wrhsHm10		: item.wrhsHm10
					, wrhsHmQntt10	: fn_zero(item.wrhsHmQntt10)
					, wrhsHmWght10	: fn_zero(item.wrhsHmWght10)

				}
				jsonRawMtrWrhsHr.push(rawMtrWrhsHrPrfmncVO);
			})
			grdRawMtrWrhsHr.rebuild();

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}

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

		if (day < 1 || day > 30) {
			return "유효하지 않은 날짜입니다. 6월은 1일부터 30일까지 있습니다.";
		}
		const juneDate = new Date(year, month-1, day);
		const dayIndex = juneDate.getDay();

		return days[dayIndex];
	}

	/**
	 * 임시 2초마다 리플레쉬 걸어 둠 => 추후 소켓으로 변경 예정
	 * */
	setInterval(fn_search, 2000);
	window.onload = fn_search;

</script>
</html>