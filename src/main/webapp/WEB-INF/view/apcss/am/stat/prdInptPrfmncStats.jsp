<%
	/**
	 * @Class Name : prdInptPrfmncStats.jsp
	 * @Description : 기간별 투입실적 조회
	 * @author SI개발부
	 * @since 2024.10.23
	 * @version 1.0
	 * @Modification Information
	 * @
	 * @ 수정일       	수정자      	수정내용
	 * @ ----------	----------	---------------------------
	 * @ 2024.10.23   	박승진			최초 생성
	 * @see
	 *
	 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 기간별 입고통계 조회</title>
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
				<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 기간별 입고통계 조회 -->
			</div>
			<div style="margin-left: auto;">
				<sbux-button
						id="btnDoc"
						name="btnDoc"
						uitype="normal"
						text="리포트"
						class="btn btn-sm btn-success"
						onclick="fn_doc"
				></sbux-button>
				<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						text="조회"
						class="btn btn-sm btn-outline-dark"
						onclick="fn_search"
				></sbux-button>
			</div>
		</div>
		<div class="box-body">
			<!--[APC] START -->
			<%@ include file="../../../frame/inc/apcSelect.jsp" %>
			<!--[APC] END -->
			<table class="table table-bordered tbl_fixed">
				<colgroup>
					<col style="width: 7%">
					<col style="width: 6%">
					<col style="width: 6%">
					<col style="width: 3%">
					<col style="width: 7%">
					<col style="width: 6%">
					<col style="width: 3%">
					<col style="width: 3%">
					<col style="width: 3%">
					<col style="width: 7%">
					<col style="width: 6%">
					<col style="width: 3%">
					<col style="width: 6%">
				</colgroup>
				<tbody>
				<tr>
					<th scope="row" class="th_bg">기준일자</th>
					<td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
						<div style="display: flex;gap: 5px">
							<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wrhsYmdFrom"
									name="srch-dtp-wrhsYmdFrom"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)"
							></sbux-datepicker>
							<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wrhsYmdTo"
									name="srch-dtp-wrhsYmdTo"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)"
							></sbux-datepicker>
						</div>
					</td>
					<th scope="row" class="th_bg">품목/품종</th>
					<td class="td_input" colspan="4" style="border-top: hidden;border-right: hidden">
						<div style="display: flex; gap: 5px">
							<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm-ast"
									jsondata-ref="jsonApcItem"
									onchange="fn_onChangeSrchItemCd(this)">
							</sbux-select>
							<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									jsondata-ref="jsonApcVrty"
									jsondata-value="itemVrtyCd"
									onchange="fn_onChangeSrchVrtyCd(this)">
							</sbux-select>
						</div>
					</td>
					<td colspan="4" style="border-top: hidden"></td>
				</tr>
				</tbody>
			</table>

			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<div style="display: flex;height: 100%; gap: 3vw; margin-top: 5vh">
				<div style="flex: 1;display: flex; flex-direction: column; height: 80%">
					<div style="flex:1">
						<ul class="ad_tbl_count" style="left: auto;top: 19vh">
							<li>
								<span>품목별 투입량</span>
							</li>
						</ul>
						<div id="sb-area-itemWrhs" style="height: 500px;"></div>
					</div>
				</div>
				<div style="flex: 1">
					<ul class="ad_tbl_count" style="left: auto;top: 19vh">
						<li>
							<span>투입 상세</span>
						</li>
					</ul>
					<div id="sb-area-dtlWrhs" style="height: 500px"></div>
				</div>
			</div>

			<!--[pp] //검색결과 -->
		</div>
	</div>
</section>
<!--  품목 선택 Modal -->
<div>
	<sbux-modal id="modal-itemCrtr" name="modal-itemCrtr" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:600px"></sbux-modal>
</div>
<div id="body-modal-itemCrtr">
	<jsp:include page="/WEB-INF/view/apcss/am/popup/itemCrtrPopup.jsp"></jsp:include>
</div>
<!-- 품종 선택 Modal -->
<div>
	<sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:800px"></sbux-modal>
</div>
<div id="body-modal-vrtyCrtr">
	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">
	let jsonItemWrhs = [];
	let jsonCnptWrhs = [];
	let jsonDtlWrhs = [];

	let gridItemWrhs;
	let gridCnptWrhs;
	let gridDtlWrhs;

	const fn_initSBSelect = async function() {
		let result = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_apcCd),		// 품목
			gfn_setApcVrtySBSelect("srch-slt-vrtyCd", 		jsonApcVrty, 	gv_apcCd),			// APC 품종(저장)
			await fn_statCrtrInfoTermList("WRHS","STAT_TERM_KND"),
			await fn_statCrtrElmtInfoList("WRHS","STAT_ELMT_KND")
		]);

		//
		// let  jsonTermKndTest  = await gfn_getComCdDtls('STAT_TERM_KND');
		// jsonTermKndTest[0]['checked'] = "checked";
		// jsonTermKnd = jsonTermKndTest;

	}

	const fn_modalVrty = function() {
		popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

	const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			//gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, vrty.itemCd);
		}
	}

	const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyNms = [];
			var _vrtyCds = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtyNms.push(vrtys[i].vrtyNm);
				_vrtyCds.push(vrtys[i].vrtyCd);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
				//gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, '');
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
				//gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNms.join(','));
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCds.join(','));
		}
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-wrhsYmdFrom",gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-wrhsYmdTo",gfn_dateToYmd(new Date()));
		fn_init();
	});

	const fn_init = async function() {
		await fn_initSBSelect();
		await fn_create_itemWrhs();
		await fn_create_dtlWrhs();
		// radioJsonData = jsonStatCrtrDtlTermList;
		// SBUxMethod.refresh("srch-rdo-json");
		//
		// let radio = SBUxMethod.get("srch-rdo-json");
		// fn_radioChange(radio);
		await fn_search();
	}

	var radioJsonData = [];
	//품목
	var jsonApcItem = [];
	//품종
	var jsonApcVrty = [];

	//기간 저장용
	var dateSaveList = [];

	//통계기간상세
	var jsonStatCrtrDtlTermList = [];

	//통계기간상세
	var jsonStatCrtrDtlElmtList = [];

	//기간
	var jsonTermKnd = [];

	// grid
	// 원물재고통계 현황
	var grdRawMtrInvntrStat;
	var jsonRawMtrInvntrStat = [];



	const fn_createRawMtrInvntrStat = function(columns) {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdRawMtrInvntrStat';
		SBGridProperties.id = 'grdRawMtrInvntrStat';
		SBGridProperties.jsonref = 'jsonRawMtrInvntrStat';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.allowcopy = true;
		SBGridProperties.extendlastcol = 'scroll';
		//SBGridProperties.mergecells = 'byrow';

		SBGridProperties.columns = [
			{caption: ["품목"],  ref: 'itemNm', type:'input', width:'10%',  style:'text-align:center'},
			{caption: ["품종"],  ref: 'vrtyNm', type:'input', width:'10%',  style:'text-align:center'},
		];

		if(gfn_nvl(columns)!==""){
			columns.forEach(item => {
				SBGridProperties.columns.push(item);
			})
		}


		SBGridProperties.columns.push({caption: ["총수량"],  ref: 'statQntt', type:'input', width:'10%',  style:'text-align:center'});
		SBGridProperties.columns.push({caption: ["현재고"],  ref: 'sttnInvntrQntt', type:'input', width:'10%',  style:'text-align:center'});

		grdRawMtrInvntrStat = _SBGrid.create(SBGridProperties);
		//grdStatCrtrList.bind('click', 'fn_grdStatCrtrClick');

	}

	const fn_dtpChange = function(obj){
		let radio = SBUxMethod.get("srch-rdo-json");
		fn_radioChange(radio);
	}

	const fn_radioChange = function(obj){
		let columns = [];
		dateSaveList = [];
		jsonRawMtrInvntrStat.length = 0;
		let crtrYmd = SBUxMethod.get("dtl-dtp-crtrYmd");
		let dateCrtrYmd = stringToDate(crtrYmd);
		if(obj === "day"){
			let dates = getWeeklyDates(dateCrtrYmd);
			dates.forEach((item,index) => {
				let replaceItem = item.replaceAll("-","");
				let col = {type:'input', width:'10%',  style:'text-align:center; border-right-width: 10px;'}
				col["caption"] = replaceItem;
				col["ref"] = replaceItem;
				dateSaveList.push(replaceItem);
				columns.push(col);
			})

		}else if(obj === "week"){
			let dates = getMonthlyWeeks(dateCrtrYmd);
			dates.forEach((item,index) => {
				let col = {type:'input', width:'10%',  style:'text-align:center; border-right-width: 10px;'}
				col["caption"] = (index + 1) + "주차"
				col["ref"] = "col" + (index + 1);
				dateSaveList.push(item);
				columns.push(col);
			})

		}else if(obj === "MM"){
			//월별
			let dates = getLastTwelveMonths(dateCrtrYmd);
			dates.forEach((item,index) => {
				let col = {type:'input', width:'10%',  style:'text-align:center; border-right-width: 10px;'}
				col["caption"] = item
				col["ref"] = "col" + (index+1);
				dateSaveList.push(item);
				columns.push(col);
			})

		}else if(obj === "QY"){
			//분기별
			let dates = getQuarterDates(dateCrtrYmd);
			dates.forEach((item,index) => {
				let col = {type:'input', width:'10%',  style:'text-align:center; border-right-width: 10px;'}
				col["caption"] = (index + 1) + "/4 분기"
				col["ref"] = "col" + (index+1);
				dateSaveList.push(item);
				columns.push(col);
			})
		}else if(obj === "YY"){
			//연도별
			let dates = getLastFourYears(dateCrtrYmd);
			dates.forEach((item,index) => {
				let col = {type:'input', width:'10%',  style:'text-align:center; border-right-width: 10px;'}
				col["caption"] = item.toString()
				col["ref"] = "col" + (index+1);
				dateSaveList.push(item.toString());
				columns.push(col);
			})
		}else if(obj === "HY"){
			//반기
			let dates = getHalfDates(dateCrtrYmd);
			dates.forEach((item,index) => {
				let col = {type:'input', width:'10%',  style:'text-align:center; border-right-width: 10px;'}
				col["caption"] = item.nm;
				col["ref"] = "h" + (index+1);
				dateSaveList.push(item.toString());
				columns.push(col);
			})
		}
		grdRawMtrInvntrStat.destroy();
		fn_createRawMtrInvntrStat(columns);
	}



	/**
	 * @name fn_search
	 * @description 조회 버튼
	 */
	const fn_search = async function() {
		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
		if(gfn_isEmpty(wrhsYmdFrom)){
			gfn_comAlert("W0005","기준일자");
			return;
		}
		if(gfn_isEmpty(wrhsYmdTo)){
			gfn_comAlert("W0005","기준일자");
			return;
		}

		let itemCd = SBUxMethod.get("srch-slt-itemCd") || '';
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd") || '';
		vrtyCd = vrtyCd.substring(4);
		let param = {
			apcCd: gv_selectedApcCd,
			wrhsYmdFrom : wrhsYmdFrom,
			wrhsYmdTo : wrhsYmdTo,
			itemCd : itemCd,
			vrtyCd : vrtyCd
		}
		const postJsonPromise = gfn_postJSON("/am/stat/selectPrdInptList.do",param);
		const data = await postJsonPromise;

		if (!_.isEqual("S", data.resultStatus)) {
			gfn_comAlert(data.resultCode, data.resultMessage);
			return;
		}
		jsonItemWrhs = data.ITEM;
		gridItemWrhs.rebuild();
		jsonDtlWrhs = data.DTL;
		gridDtlWrhs.rebuild();
	}


	/**
	 * @name fn_statCrtrInfoTermList
	 * @description 통계기간 버튼
	 */
	const fn_statCrtrInfoTermList = async function(statCrtrType,crtrCd) {


		const postJsonPromise = gfn_postJSON("/am/stat/selectStatCrtrInfoDtlList.do", {
			apcCd: gv_selectedApcCd,
			statCrtrType : statCrtrType,
			crtrCd : crtrCd
		});

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {

				/** @type {number} **/
				let statalRecordCount = 0;
				jsonStatCrtrDtlTermList.length = 0;
				jsonStatCrtrDtlTermList = data.resultList;
			}
		}
		catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	/**
	 * @name fn_statCrtrElmtInfoList
	 * @description 통계요소종류 버튼
	 */
	const fn_statCrtrElmtInfoList = async function(statCrtrType,crtrCd) {


		const postJsonPromise = gfn_postJSON("/am/stat/selectStatCrtrInfoDtlList.do", {
			apcCd: gv_selectedApcCd,
			statCrtrType : statCrtrType,
			crtrCd : crtrCd
		});

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {

				/** @type {number} **/
				let statalRecordCount = 0;
				jsonStatCrtrDtlElmtList.length = 0;
				jsonStatCrtrDtlElmtList = data.resultList;
			}
		}
		catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	function getWeeklyDates(date) {
		const today = date;
		const dayOfWeek = today.getDay(); // 0 (일요일) ~ 6 (토요일)
		const startOfWeek = date;
		startOfWeek.setDate(today.getDate() - dayOfWeek); // 이번 주의 첫 날 (일요일)

		const dates = [];
		for (let i = 0; i < 7; i++) {
			const currentDate = new Date(startOfWeek);
			currentDate.setDate(startOfWeek.getDate() + i);
			dates.push(currentDate.toISOString().split('T')[0]); // YYYY-MM-DD 형식으로 추가
		}

		return dates;
	}



	function getMonthlyWeeks(date) {
		const today = date;
		const year = today.getFullYear();
		const month = today.getMonth(); // 현재 월 (0: 1월, 11: 12월)

		const firstDayOfMonth = new Date(year, month, 1);
		const lastDayOfMonth = new Date(year, month + 1, 0); // 해당 월의 마지막 날

		const weeks = [];
		let startOfWeek = new Date(firstDayOfMonth);

		while (startOfWeek <= lastDayOfMonth) {
			const endOfWeek = new Date(startOfWeek);
			endOfWeek.setDate(startOfWeek.getDate() + 6); // 시작일로부터 6일 후

			// 종료일이 월의 마지막 날을 초과하면 월의 마지막 날로 설정
			if (endOfWeek > lastDayOfMonth) {
				endOfWeek.setTime(lastDayOfMonth.getTime());
			}

			weeks.push({
				startOfWeek: startOfWeek.toISOString().split('T')[0],
				endOfWeek: endOfWeek.toISOString().split('T')[0],
			});

			// 다음 주의 시작일로 이동
			startOfWeek.setDate(startOfWeek.getDate() + 7);
		}

		return weeks;
	}


	function getLastTwelveMonths(date) {
		const today = date;
		const months = [];

		for (let i = 0; i < 12; i++) {
			const pastMonth = new Date(today.getFullYear(), today.getMonth()+1 - i, 1);
			months.push(pastMonth.toISOString().split('T')[0].slice(0, 7)); // YYYY-MM 형식
		}

		return months.reverse(); // 과거부터 현재까지 정렬
	}


	function getHalfDates(date) {
		const today = date;
		const year = today.getFullYear();
		const half = [];

		const startMonth = 1;
		const startOfQuarter = new Date(year, 0, 1); //1월 1일
		const middleOfQuarter = new Date(year, 5, 30); // 6월 30일
		const endOfQuarter = new Date(year, 11, 31); // 12월31일

		half.push({
			nm : "상반기",
			start: startOfQuarter.toISOString().split('T')[0],
			end: middleOfQuarter.toISOString().split('T')[0]
		});

		half.push({
			nm : "하반기",
			start: middleOfQuarter.toISOString().split('T')[0],
			end: endOfQuarter.toISOString().split('T')[0]
		});
		return half;
	}

	function getQuarterDates(date) {
		const today = date;
		const year = today.getFullYear();
		const quarters = [];

		for (let i = 0; i < 4; i++) {
			const startMonth = i * 3;
			const startOfQuarter = new Date(year, startMonth, 1);
			const endOfQuarter = new Date(year, startMonth + 3, 0); // 0은 이전 달의 마지막 날

			quarters.push({
				startOfQuarter: startOfQuarter.toISOString().split('T')[0],
				endOfQuarter: endOfQuarter.toISOString().split('T')[0],
			});
		}
		return quarters;
	}


	function getLastFourYears(date) {
		const thisYear = date.getFullYear();
		const years = [];

		for (let i = 3; i >= 0; i--) {
			years.push(thisYear - i);
		}

		return years;
	}

	function stringToDate(dateString) {
		const year = parseInt(dateString.slice(0, 4), 10);
		const month = parseInt(dateString.slice(4, 6), 10) - 1; // 월은 0부터 시작
		const day = parseInt(dateString.slice(6, 8), 10);

		return new Date(year, month, day);
	}

	/** camelCase FN **/
	function toCamelCase(snakeStr) {
		return snakeStr.toLowerCase().replace(/_([a-z])/g, (match, letter) => letter.toUpperCase());
	}

	function convertArrayToCamelCase(array) {
		return array.map(obj => {
			return Object.keys(obj).reduce((acc, key) => {
				const camelKey = toCamelCase(key);
				acc[camelKey] = obj[key];
				return acc;
			}, {});
		});
	}

	/**
	 * @name fn_doc
	 * @description 리포트 발행
	 */
	const fn_doc = async function() {
			//기준일자
			const ymdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
			const ymdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
			let itemCd = SBUxMethod.get("srch-slt-itemCd") || '';
			let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd") || '';
			vrtyCd = vrtyCd.substring(4);

			let conn = {
				apcCd : gv_apcCd
				, ymdFrom : ymdFrom
				, ymdTo : ymdTo
				, itemCd : itemCd
				, vrtyCd : vrtyCd
			}
			gfn_popClipReport("기간별 투입실적 조회", "am/prdInptPrfmncTot.crf", conn);
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;
		const itemInfo = _.find(jsonApcItem, {value: itemCd});
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),
		]);
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		const itemCd = vrtyCd.substring(0,4);

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if(!gfn_isEmpty(vrtyCd)){
			if (itemCd != prvItemCd) {
				SBUxMethod.set("srch-slt-itemCd", itemCd);
				await fn_onChangeSrchItemCd({value: itemCd});
				SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
			} else{
				SBUxMethod.set("srch-slt-itemCd", itemCd);
				await fn_onChangeSrchItemCd({value: itemCd});
				SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
			}
		}
	}
	const fn_create_itemWrhs = async function(){
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-itemWrhs';
		SBGridProperties.id = 'gridItemWrhs';
		SBGridProperties.jsonref = 'jsonItemWrhs';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.datamergefalseskip = true;
		SBGridProperties.columns = [
			{caption: ["품목"],	ref: 'ITEM_NM',		type:'output',  width:'25%', style: 'text-align:center;'},
			{caption: ["품종"],	ref: 'VRTY_NM',		type:'output',  width:'25%', style: 'text-align:center;'},
			{caption: ["입고수량"],	ref: 'QNTT',		type:'output',  width:'25%', style: 'text-align:center;'},
			{caption: ["입고중량"],	ref: 'WGHT',		type:'output',  width:'25%', style: 'text-align:center;'},
			{caption: ["투입수량"],	ref: 'WGHT',		type:'output',  width:'25%', style: 'text-align:center;'},
			{caption: ["투입중량"],	ref: 'WGHT',		type:'output',  width:'25%', style: 'text-align:center;'},
		]
		gridItemWrhs = _SBGrid.create(SBGridProperties);
	}
	const fn_create_cnptWrhs = async function(){
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-cnptWrhs';
		SBGridProperties.id = 'gridCnptWrhs';
		SBGridProperties.jsonref = 'jsonCnptWrhs';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.datamergefalseskip = true;
		SBGridProperties.columns = [
			{caption: ["품목"],	ref: 'PRDCR_NM',		type:'output',  width:'20%', style: 'text-align:center;'},
			{caption: ["품종"],	ref: 'ITEM_NM',		type:'output',  width:'20%', style: 'text-align:center;'},
			{caption: ["투입수량"],	ref: 'VRTY_NM',		type:'output',  width:'20%', style: 'text-align:center;'},
			{caption: ["투입중량"],	ref: 'VRTY_NM',		type:'output',  width:'20%', style: 'text-align:center;'},
			{caption: ["선별수량"],	ref: 'QNTT',		type:'output',  width:'20%', style: 'text-align:center;'},
			{caption: ["선별중량"],	ref: 'WGHT',		type:'output',  width:'20%', style: 'text-align:center;'},
		]
		gridCnptWrhs = _SBGrid.create(SBGridProperties);
	}
	const fn_create_dtlWrhs = async function(){
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-dtlWrhs';
		SBGridProperties.id = 'gridDtlWrhs';
		SBGridProperties.jsonref = 'jsonDtlWrhs';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.datamergefalseskip = true;
		SBGridProperties.columns = [
			{caption: ["품목"],	ref: 'ITEM_NM',		type:'output',  width:'20%', style: 'text-align:center;'},
			{caption: ["품종"],	ref: 'VRTY_NM',		type:'output',  width:'20%', style: 'text-align:center;'},
			{caption: ["투입수량"],	ref: 'QNTT',		type:'output',  width:'20%', style: 'text-align:center;'},
			{caption: ["투입중량"],	ref: 'WGHT',		type:'output',  width:'20%', style: 'text-align:center;'},
			{caption: ["선별수량"],	ref: 'SORT_QNTT',		type:'output',  width:'20%', style: 'text-align:center;'},
			{caption: ["선별중량"],	ref: 'SORT_WGHT',		type:'output',  width:'20%', style: 'text-align:center;'},
		]
		gridDtlWrhs = _SBGrid.create(SBGridProperties);
	}



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>