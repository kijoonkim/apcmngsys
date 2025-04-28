<%
 /**
  * @Class Name : sortPrfmncRegJiwooTablet.jsp
  * @Description : 선별실적등록 (지우-테블릿)
  * @author SI개발부
  * @since 2025.03.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2025.03.31   	유민지			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 선별실적등록(지우-테블릿)</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
	<style>
		.displayFlex > .sbux-pik-wrap {
			display: flex;
			gap: 10px;
		}
		.th-mbl {
			text-align: right;
			font-weight: bold;
			font-size: 28px;
		}
		.inpt-mbl {
		//padding: 8px;
			height: 50px;
			font-size: 28px;
			line-height: 1.3;
			color: #555;
			width: 100%;
		}
		.btn-mbl {
			height: 50px;
			font-size: 24px;
			min-width: 100px;
		}
		#gsb-slt-apcCd {
		//padding: 8px;
			height: 50px;
			font-size: 28px;
			line-height: 1.5;
			color: #555;
			width: 100%;
			/*background-color: #FFF8DC;*/
		}
		select.form-control.input-sm {
			background-size: 60px;
		}
		.ad_tbl_count li span {
			font-size: 17px;
		}

	</style>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별실적등록 -->
					<sbux-label id="lbl-wrhsno" name="lbl-wrhsno" uitype="normal" text=""></sbux-label>
				</div>
			</div>
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div style="margin-left: auto;">
					<sbux-button
							id="btnSearch"
							name="btnSearch"
							uitype="normal"
							class="btn btn-outline-danger btn-mbl"
							onclick="fn_search"
							text="조회"
					></sbux-button>
					<sbux-button
							id="btnSave"
							name="btnSave"
							uitype="normal"
							class="btn btn-outline-danger btn-mbl"
							onclick="fn_save"
							text="저장"
					></sbux-button>
					<sbux-button
						id="btnReset"
						name="btnReset"
						uitype="normal"
						class="btn btn-outline-danger btn-mbl"
						onclick="fn_reset"
						text="종료"
					></sbux-button>


				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
				<!--[APC] END -->
				<!--[pp] 검색 -->

				<table class="table table-bordered tbl_fixed" >
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 20%">
						<col style="width: 30%">
						<col style="width: 20%">
						<col style="width: 30%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg th-mbl"><span class="data_required"></span>APC</th>
							<td class="td_input" style="border-right: hidden;">
								<div style="display: flex;">
									<%@ include file="../../../frame/inc/apcSelectComp.jsp" %>
								</div>
							</td>
							<th scope="row" class="th_bg th-mbl"><span class="data_required"></span>품목</th>
							<td class="td_input">
								<sbux-select
										id="srch-slt-itemCd"
										name="srch-slt-itemCd"
										uitype="single"
										jsondata-ref="jsonApcItem"
										class="input-sm-ast inpt_data_reqed inpt-mbl"
										onchange="fn_selectVrtyItemDtl()"
								></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg th-mbl"><span class="data_required"></span>선별일자</th>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker
										id="srch-dtp-sortYmd"
										name="srch-dtp-sortYmd"
										wrap-style="width:100%"
										date-format="yyyy-mm-dd"
										style="width:100%;"
										class="pull-right sbux-pik-group-apc inpt-mbl inpt_data_reqed input-sm-ast"
								></sbux-datepicker>
							</td>
							<th scope="row" class="th_bg th-mbl"><span class="data_required"></span>기본규격</th>
							<td class="td_input">
								<sbux-select
										id="dtl-slt-spcfctCd"
										name="dtl-slt-spcfctCd"
										wrap-style="width:100%"
										style="width:100%;"
										jsondata-ref="jsonApcSpcfct"
										uitype="single"
										class="pull-right sbux-pik-group-apc inpt-mbl inpt_data_reqed input-sm-ast"
										jsondata-text="indctNm"
										jsondata-value="spcfctCd"
										onchange="fn_sortRegUnitWghtAplcn"
								></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg th-mbl"><span class="data_required"></span>선별기</th>
							<td class="td_input"style="border-right: hidden;">
								<sbux-select
										id="dtl-slt-fcltCd"
										name="dtl-slt-fcltCd"
										wrap-style="width:100%"
										style="width:100%;"
										jsondata-ref="jsonComFclt"
										uitype="single"
										class="pull-right sbux-pik-group-apc inpt-mbl inpt_data_reqed input-sm-ast"
								></sbux-select>
							</td>
							<th scope="row" class="th_bg th-mbl"><span class="data_required"></span>창고</th>
							<td class="td_input">
								<sbux-select
										id="srch-slt-warehouseSeCd"
										name="srch-slt-warehouseSeCd"
										uitype="single"
										jsondata-ref="jsonComWarehouse"
										class="input-sm-ast inpt_data_reqed inpt-mbl"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
								></sbux-select>
							</td>
						</tr>

					</tbody>
				</table>

				<sbux-tabs
						id="idxtabTopJson"
						name="idxtabTopJson"
						uitype="normal"
						jsondata-ref="tabJsonData"
						jsondata-css-style="cssstyleKey"
						onclick="fn_clickTab()"
				></sbux-tabs>

				<div class="tab-content">
					<div id="tab_inptReg">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>투입</span></li>
							</ul>
							<div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
								<sbux-button
										id="btn-grd-inptAddRow"
										name="btn-grd-inptAddRow"
										uitype="normal"
										class="btn btn-xs btn-outline-dark"
										style="margin-right:10px"
										image-src="/resource/svg/grdPlus.svg"
										image-style="width:3rem;height:20px"
										image-placement="front"
										onclick="fn_addRow('gridInpt')"
								></sbux-button>
								<sbux-button
										id="btn-grd-inptDelRow"
										name="btn-grd-inptDelRow"
										uitype="normal"
										class="btn btn-xs btn-outline-dark"
										style="margin-right:5px"
										image-src="/resource/svg/grdMinus.svg"
										image-style="width:3rem;height:20px"
										image-placement="front"
										onclick="fn_delRow('gridInpt')"
								></sbux-button>
							</div>
						</div>
						<div id="sb-area-inptReg" style="height: 300px"></div>
					</div>

					<div id="tab_prfmncReg" style="display: flex; gap: 10px">
						<div style="flex: 4">
							<div id="grid-content0" style="display: none;">
								<div class="ad_tbl_top">
									<ul class="ad_tbl_count">
										<li><span id="itemDtlType0"></span></li>
									</ul>
								</div>
								<div id="sb-area-itemDtlType0" style="height: 150px;"></div>
							</div>


							<div id="grid-content1" style="display: none;">
								<div class="ad_tbl_top">
									<ul class="ad_tbl_count">
										<li><span id="itemDtlType1"></span></li>
									</ul>
								</div>
								<div id="sb-area-itemDtlType1" style="height: 150px;"></div>
							</div>

							<div id="grid-content2" style="display: none;">
								<div class="ad_tbl_top">
									<ul class="ad_tbl_count">
										<li><span id="itemDtlType2"></span></li>
									</ul>
								</div>
								<div id="sb-area-itemDtlType2" style="height: 150px;"></div>
							</div>

							<div id="grid-content3" style="display: none;">
								<div class="ad_tbl_top">
									<ul class="ad_tbl_count">
										<li><span id="itemDtlType3"></span></li>
									</ul>
								</div>
								<div id="sb-area-itemDtlType3" style="height: 100px;"></div>
							</div>
							<div id="grid-content4" style="display: none;">
								<div class="ad_tbl_top">
									<ul class="ad_tbl_count">
										<li><span id="itemDtlType4"></span></li>
									</ul>
								</div>
								<div id="sb-area-itemDtlType4" style="height: 100px;"></div>
							</div>
						</div>

						<div style="flex: 1;">
							<div class="ad_tbl_top">
								<ul class="ad_tbl_count">
									<li><span>예외규격</span></li>
								</ul>
								<div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
									<sbux-button
											id="btn-grd-excptAddRow"
											name="btn-grd-excptAddRow"
											uitype="normal"
											class="btn btn-xs btn-outline-dark"
											style="margin-right:10px"
											image-src="/resource/svg/grdPlus.svg"
											image-style="width:3rem;height:20px"
											image-placement="front"
											onclick="fn_addRow('gridSpcfct')"
									></sbux-button>
									<sbux-button
											id="btn-grd-excptDelRow"
											name="btn-grd-excptDelRow"
											uitype="normal"
											class="btn btn-xs btn-outline-dark"
											style="margin-right:5px"
											image-src="/resource/svg/grdMinus.svg"
											image-style="width:3rem;height:20px"
											image-placement="front"
											onclick="fn_delRow('gridSpcfct')"
									></sbux-button>
								</div>
							</div>
							<div id="sb-area-spcfct" style="height: auto"></div>
						</div>

					</div>

					<div id="tab_sortTot">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>집계</span></li>
							</ul>
						</div>
						<div id="sb-area-sortTot" style="height: 400px;"></div>
					</div>

				</div>
			</div>
		</div>

	</section>

<script type="text/javascript">

	/** 품목 **/
	var jsonApcItem = [];
	/** 품종의 품목 상세조회 **/
	 var jsonItemDtl = [];
	/** 등급 **/
	var jsonGrdList = [];
	/** 품종 **/
	var jsonVrtyList = [];
	/** 규격 **/
	var jsonApcSpcfct = [];
	/** tab **/
	var tabJsonData  = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "투입", "targetid" : "tab_inptReg" , "targetvalue" : "inptReg" , "cssstyleKey" : "{margin-right: 5px;width: 8vw;text-align: center;font-weight: bold;border-radius:0}"},
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "등록", "targetid" : "tab_prfmncReg" , "targetvalue" : "prfmncReg" , "cssstyleKey" : "{margin-right: 5px;width: 8vw;text-align: center;font-weight: bold;border-radius:0}"},
		{ "id" : "2", "pid" : "-1", "order" : "3", "text" : "집계", "targetid" : "tab_sortTot" , "targetvalue" : "tot" , "cssstyleKey" : "{margin-right: 5px;width: 8vw;text-align: center;font-weight: bold;border-radius:0}"}]

	/** 선별기 **/
	var jsonComFclt = [];
	/** 창고 **/
	var jsonComWarehouse = [];

	/** grid val set **/
	var gridReg0;
	var gridReg1;
	var gridReg2;
	var gridReg3;
	var gridReg4;

	/** 그리드 json **/
	var jsonItemDtlTypes = [[],[],[],[],[]];

	/** 그리드 컬럼 **/
	var jsonGridColList = [[],[],[],[],[]];

	/** 그리드 객체**/
	//var gridObj = {};

	/** 집계 그리드 **/
	let gridTot;
	var jsonTot = [];

	/** 규격 그리드 **/
	var gridSpcfct;
	var jsonSpcfct = [];

	/** 투입 그리드 **/
	var gridInpt;
	var jsonInpt = [];

	/** 생산자 **/
	var jsonPrdcr = [];


	// only document
	window.addEventListener('DOMContentLoaded', async function(e) {
		document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
			el.style.width = "50px";
			el.style.height = "50px";
		});
		document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
			el.style.fontSize = "24px";
			//sbux-pik-icon
		});
		await fn_init();

	});

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {
		SBUxMethod.set("srch-dtp-sortYmd", gfn_dateToYmd(new Date()));
		await fn_initSBSelect();
		await fn_selectGrdList();
		await fn_selectVrtyItemDtl();
		await fn_selectVrtyByItemCd();
		jsonApcSpcfct = await gfn_getApcSpcfcts(gv_selectedApcCd, SBUxMethod.get('srch-slt-itemCd'));
		SBUxMethod.refresh('dtl-slt-spcfctCd');

		await fn_createInptGrid(); // 투입
		await fn_createGrid(); // 등록
		await fn_createTotGrid(); // 집계

		await fn_createSpcfctGrid();
		/** 예외 규격 그리드 높이 **/
		const height = document.getElementById("tab_prfmncReg").offsetHeight - 35;
		$('#sb-area-spcfct').css('height',height);
		gridSpcfct.resize();

		/** init 등록영역 숨기기**/
		document.getElementById('tab_prfmncReg').style.display = 'none';
	}


	/**
     * @name fn_initSBSelect
     * @description SBSelect JSON 불러오기
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let result = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setComCdSBSelect('dtl-slt-fcltCd', jsonComFclt, 'SORT_FCLT_CD', gv_selectedApcCd),	// 설비
			fn_getWarehouse(),
			]);
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd); // 생산자
	}

	const fn_getWarehouse = async function() {
		jsonComWarehouse = await gfn_getComCdDtls('WAREHOUSE_SE_CD', gv_selectedApcCd);
		SBUxMethod.refresh("srch-slt-warehouseSeCd");
	}


	/**
	 * @name fn_selectVrtyItemDtl
	 * @description 품종의 품목 상세 조회
	 */
	const fn_selectVrtyItemDtl = async function() {
		const itemCd = SBUxMethod.get("srch-slt-itemCd");

		let postJsonPromise = gfn_postJSON("/am/cmns/selectVrtyItemDtlList.do", {
			apcCd: gv_selectedApcCd,
			itemCd : itemCd
		});
		let data = await postJsonPromise;
		try {
			if (!_.isEqual("S", data.resultStatus)) {
				gfn_comAlert(data.resultCode, data.resultMessage);
				return;
			}

			/** 품목상세**/
			data.resultList.forEach((item,index)=>{
				const itemDtl = {
					indctSeq : item.indctSeq,
					itemCd : item.itemCd,
					itemDtlCd : item.itemDtlCd,
					itemDtlNm : item.itemDtlNm,
					itemNm : item.itemNm,
					grdMngCd : item.grdMngCd
				}
				jsonItemDtl.push(itemDtl);
				document.getElementById(`itemDtlType${'${index}'}`).innerHTML  = item.itemDtlNm;
				document.getElementById(`grid-content${'${index}'}`).style.display = 'block';

			});
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	/**
	 * @name fn_createSpcfctGrid
	 * @description 규격 그리드
	 */
	const fn_createSpcfctGrid = function () {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-spcfct';
		SBGridProperties.id = 'gridSpcfct';
		SBGridProperties.jsonref = 'jsonSpcfct';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{
				caption : ["<input type='checkbox' id='allCheckBox' onchange='fn_checkAll(gridSpcfct, this);'>"],
				ref: 'checkedYn', type: 'checkbox',  width:'20%',
				style: 'text-align:center; font-size:15px;',
				fixedstyle: 'font-size:20px;font-weight:bold',
				userattr: {colNm: "checkedYn"},
				typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			{caption: ["등급"],	ref: 'grdCd',	type:'combo',  width:'40%', userattr : {colNm : "grdCd"}, typeinfo : {ref:'jsonGrdList', label:'grdNm', value:'grdCd'},style: 'text-align:center; font-size:15px;', fixedstyle: 'font-size:20px;font-weight:bold'},
			{caption: ["규격"],	ref: 'spcfctCd',	type:'combo', userattr : {colNm : "spcfctCd"}, width:'40%', typeinfo : {ref:'jsonApcSpcfct', label:'spcfctNm', value:'spcfctCd'},style: 'text-align:center; font-size:15px;', fixedstyle: 'font-size:20px;font-weight:bold'},
			{caption: ["규격명"],	ref: 'spcfctNm', type:'output', hidden : true},
		];
		gridSpcfct = _SBGrid.create(SBGridProperties);
		gridSpcfct.bind('valuechanged',fn_spcfctGridValueChange);
	}

	/**
	 * @name fn_addRow
	 * @description 행추가
	 */
	const fn_addRow = function (grid) {
		if (_.isEqual(grid,"gridInpt")) {
			gridInpt.addRow(true,{checkedYn : 'Y'},true);
		} else if (_.isEqual(grid,"gridSpcfct"))
			gridSpcfct.addRow(true,{checkedYn : 'Y'},true);
	}
	/**
	 * @name fn_delRow
	 * @description 행삭제
	 */
	const fn_delRow = function (grid) {
		if (_.isEqual(grid,"gridInpt")) {
			const data = gridInpt.getGridDataAll();
			let deleteIndex = [];
			for (let i =0; i<data.length; i++ ){
				if (_.isEqual(data[i].checkedYn,"Y")) {
					deleteIndex.push(i+1);
				}
			}
			if(gfn_isEmpty(deleteIndex)) {
				gfn_comAlert("W0003", "삭제");    // W0003 {0}할 대상이 없습니다.
				return;
			}
			for(let i = deleteIndex.length-1; i >= 0 ; i--){
				gridInpt.deleteRow(deleteIndex[i]);
			}
		} else if (_.isEqual(grid,"gridSpcfct")) {
			const data = gridSpcfct.getGridDataAll();
			let deleteIndex = [];
			for (let i =0; i<data.length; i++ ){
				if (_.isEqual(data[i].checkedYn,"Y")) {
					deleteIndex.push(i+1);
				}
			}
			if(gfn_isEmpty(deleteIndex)) {
				gfn_comAlert("W0003", "삭제");    // W0003 {0}할 대상이 없습니다.
				return;
			}
			for(let i = deleteIndex.length-1; i >= 0 ; i--){
				gridSpcfct.deleteRow(deleteIndex[i]);
			}
		}
	}

	/**
	 * @name fn_delRow
	 * @description 그리드 체크박스 전체 선택
	 */
	function fn_checkAll(grid, obj) {
		var gridList = grid.getGridDataAll();
		var checkedYn = obj.checked ? "Y" : "N";
		//체크박스 열 index
		var getColRef = grid.getColRef("checkedYn");
		var getRow = grid.getRow();
		var getCol = grid.getCol();
		for (var i=0; i<gridList.length; i++) {
			grid.setCol(getColRef);
			grid.clickCell(i+1, getColRef);
			grid.setCellData(i+1, getColRef, checkedYn, true, false);
		}
		grid.clickCell(getRow, getCol);
	}

	/**
	 * @name fn_selectGrdList
	 * @description 등급조회
	 */
	const fn_selectGrdList = async function () {
		const itemCd = SBUxMethod.get("srch-slt-itemCd");
		if (gfn_isEmpty(itemCd)) {
			return;
		}
		let grdSeCd = '02';
		let grdKnd = '01';

		let postJsonPromise = gfn_postJSON("/am/cmns/selectStdGrdDtlList.do", {
			apcCd: gv_selectedApcCd,
			itemCd: itemCd,
			grdSeCd: grdSeCd,
			grdKnd: grdKnd
		});
		let data = await postJsonPromise;
		if (!_.isEqual("S", data.resultStatus)) {
			gfn_comAlert(data.resultCode, data.resultMessage);
			return;
		}
		jsonGrdList.length = 0;
		data.resultList.forEach((item,index) => {
			const grd = {
				itemCd : item.itemCd,
				itemNm : item.itemNm,
				grdSeCd : item.grdSeCd,
				grdSeNm : item.grdSeNm,
				grdKnd : item.grdKnd,
				grdKndNm : item.grdKndNm,
				grdCd : item.grdCd,
				grdNm : item.grdNm,
				itemGrdCd : item.itemGrdCd,
				sn : item.sn
			}
			jsonGrdList.push(grd);
		});
	}

	/**
	 * @name fn_createGridForSort
	 * @description 선별등급이있는 품목 그리드
	 */
	const fn_createGridForSort = function(
							parentId,	// sb-area
							gridId,		// grid명
							jsonId,		// json명
							gridObj		// grid Object
						) {
		var SBGridProperties = {};
		SBGridProperties.parentid = parentId;
		SBGridProperties.id = gridId;
		SBGridProperties.jsonref = jsonId;
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption: ["품종"],	ref: 'vrtyNm',	type:'output',  width:'15%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
			{caption: ["수량"],	ref: 'sortQntt',	type:'output',  width:'7.5%', userattr:{colNm:"sortQntt"}, style: 'text-align:center; font-size:15px;', fixedstyle: 'font-size:20px;font-weight:bold'},
			{caption: ["중량 (Kg)"],	ref: 'sortWght',	type:'output',  width:'7.5%', userattr:{colNm: "sortWght"}, style: 'text-align:center; font-size:15px;', fixedstyle: 'font-size:20px;font-weight:bold'},
			{caption: ["등급관리코드"],	ref: 'grdMngCd',	type:'output', hidden : true},
		];
		let calc = 70 / jsonGrdList.length;

		jsonGrdList.forEach(item => {
			let grdVO = {
				caption: [item.grdNm]
				, ref: gStdGrdObj.colPrfxQntt + item.grdCd
				, type: 'input'
				, width: `${'${calc}%'}`
				, style: 'text-align:center; font-size:15px; background-color: #FFF8DC;'
				, fixedstyle: 'font-size:20px;font-weight:bold'
				, format : {type:'number', rule:'#,###'}
				, typeinfo :{mask : {alias :'numeric'}}
				, userattr: {colNm: "stdGrdQntt",colCd :item.grdCd}
			}
			SBGridProperties.columns.push(grdVO);
		});

		gridObj = _SBGrid.create(SBGridProperties);
		switch (gridId) {
			case "gridReg0":
				gridObj.bind('valuechanged', fn_gridReg0ValueChanged);
				break;
			case "gridReg1":
				gridObj.bind('valuechanged', fn_gridReg1ValueChanged);
				break;
			case "gridReg2":
				gridObj.bind('valuechanged', fn_gridReg1ValueChanged);
				break;
			case "gridReg3":
				gridObj.bind('valuechanged', fn_gridReg1ValueChanged);
				break;
			case "gridReg4":
				gridObj.bind('valuechanged', fn_gridReg1ValueChanged);
				break;
			default:
				return;
		}

		return gridObj;
	}

	/**
	 * @name fn_createGridForSimpleSort
	 * @description 선별등급이 없는 그리드
	 */
	const fn_createGridForSimpleSort = function(
			parentId,	// sb-area
			gridId,		// grid명
			jsonId,		// json명
			gridObj		// grid Object
	) {
		var SBGridProperties = {};
		SBGridProperties.parentid = parentId;
		SBGridProperties.id = gridId;
		SBGridProperties.jsonref = jsonId;
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption: ["합계","수량"],	ref: 'sortQntt',	type:'output', userattr:{colNm:"sortQntt"} ,width:'7.5%', style: 'text-align:center; font-size:15px;', fixedstyle: 'font-size:20px;font-weight:bold'},
			{caption: ["합계","중량 (Kg)"],	ref: 'sortWght',	type:'output',  userattr:{colNm: "sortWght"},width:'7.5%', style: 'text-align:center; font-size:15px;', fixedstyle: 'font-size:20px;font-weight:bold'},
			{caption: ["등급관리코드"],	ref: 'grdMngCd',	type:'output', hidden : true},
		];

		const index = parseInt(gridId.replace("gridReg", ""));
		const colList = jsonGridColList[index];
		let calc = 85 / colList.length;

		if(!gfn_isEmpty(colList)) {
			colList.forEach(item => {
				let col = {
					caption : [item.vrtyNm,item.vrtyNm],
					ref : gStdGrdObj.colPrfxQntt + item.vrtyCd, // qntt__vrtyCd
					type : 'input',
					width : `${'${calc}%'}`,
					style: 'text-align:center; font-size:15px; background-color: #FFF8DC;',
					fixedstyle: 'font-size:20px;font-weight:bold',
					format : {type:'number', rule:'#,###'},
					typeinfo :{mask : {alias :'numeric'}},
					userattr: {colNm: "stdGrdQntt",colCd :item.vrtyCd}
				}
				SBGridProperties.columns.push(col);
			});
		}

		gridObj =  _SBGrid.create(SBGridProperties);
		gridObj.addRow(true,{grdMngCd :'0000'});

		switch (gridId) {
			case "gridReg0":
				gridObj.bind('valuechanged', fn_gridReg0ValueChanged);
				break;
			case "gridReg1":
				gridObj.bind('valuechanged', fn_gridReg1ValueChanged);
				break;
			case "gridReg2":
				gridObj.bind('valuechanged', fn_gridReg1ValueChanged);
				break;
			case "gridReg3":
				gridObj.bind('valuechanged', fn_gridReg1ValueChanged);
				break;
			case "gridReg4":
				gridObj.bind('valuechanged', fn_gridReg1ValueChanged);
				break;
			default:
				return;
		}

		return gridObj;
	}

	/**
	 * @name fn_createTotGrid
	 * @description 집계탭 그리드
	 */
	const fn_createTotGrid = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-sortTot';
		SBGridProperties.id = 'gridTot';
		SBGridProperties.jsonref = 'jsonTot';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.columns = [
			 {caption: ["등급/품종","등급/품종"],	ref: 'grdVrty',	type:'output',  width:'10%', style: 'text-align:center; font-size:17px;', fixedstyle: 'font-size:20px;font-weight:bold'},
			 {caption: ["등급코드"],	ref: 'grdCd',	type:'output',hidden:true},
		];
		let calc = 80 / jsonVrtyList.length;

		if (!gfn_isEmpty(jsonVrtyList)) {
			jsonVrtyList.forEach((item,index) => {
				let col = {
					caption : [item.vrtyNm,item.vrtyNm]
					, ref : `${'${item.itemCd}'}_${'${item.vrtyCd}'}`
					, type : 'output'
					, width : `${'${calc}%'}`
					, style: 'text-align:center; font-size:17px;'
					, fixedstyle: 'font-size:20px;font-weight:bold'
					, format : {type:'number', rule:'#,###'}
				}
				SBGridProperties.columns.push(col);
			});
		}
		SBGridProperties.columns.push(
				{caption: ["합계","수량"],	ref: 'qnttTot',	type:'output', format : {type:'number', rule:'#,###'}, width:'5%', style: 'text-align:center; font-size:17px;', fixedstyle: 'font-size:20px;font-weight:bold'},
				{caption: ["합계","중량(kg)"],	ref: 'wghtTot',	type:'output', format : {type:'number', rule:'#,###'}, width:'5%', style: 'text-align:center; font-size:17px;', fixedstyle: 'font-size:20px;font-weight:bold'},
		);
		gridTot =  _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_selectVrtyItemDtlCd
	 * @description 품종 조회
	 */
	const fn_selectVrtyByItemCd = async function() {
		const itemCd = SBUxMethod.get("srch-slt-itemCd");
		let postJsonPromise = gfn_postJSON("/am/cmns/selectVrtyByItemCd.do", {
			apcCd: gv_selectedApcCd,
			itemCd : itemCd,
		});

		let data = await postJsonPromise;
		try {
			if (!_.isEqual("S", data.resultStatus)) {
				gfn_comAlert(data.resultCode, data.resultMessage);
				return;
			}
			data.resultList.forEach(item =>{
				const vrtyVO = {
					itemCd : item.itemCd,
					itemNm : item.itemNm,
					itemDtlCd : item.itemDtlCd,
					itemDtlNm : item.itemDtlNm,
					vrtyCd : item.vrtyCd,
					vrtyNm : item.vrtyNm,
					sn : item.sn,
					indctSeq : item.indctSeq
				}
				jsonVrtyList.push(vrtyVO);
			});

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	/**
	 * @name fn_createGrid
	 * @description 등록 그리드 생성
	 */
	const fn_createGrid = function() {
		if (gfn_isEmpty(jsonItemDtl)) {
			return;
		}

		for (let i = 0; i< jsonItemDtl.length ; i++){
			const grdMngCd = jsonItemDtl[i].grdMngCd;
			const itemDtlCd = jsonItemDtl[i].itemDtlCd;

			let parentId = `sb-area-itemDtlType${'${i}'}`;
			let gridId = `gridReg${'${i}'}`;
			let jsonRef = `jsonItemDtlTypes[${'${i}'}]`;

			/** GRD_MNG_CD의 2번째 자리의 값으로 분기**/
			const secondNum = grdMngCd.substring(1,2);

			if (_.isEqual(secondNum,"1")) {	// 선별등급있음
				for (let j = 0; j < jsonVrtyList.length; j++){
					if (_.isEqual(itemDtlCd,jsonVrtyList[j].itemDtlCd)) {
						const vo = {
							...jsonVrtyList[j],
							grdMngCd: grdMngCd
						};
						jsonItemDtlTypes[i].push(vo);
						// jsonItemDtlTypes[i].push(jsonVrtyList[j]);

					}
				}
				window[`gridReg${'${i}'}`] = fn_createGridForSort(parentId,gridId,jsonRef,window[`gridReg${'${i}'}`]);
			} else if (_.isEqual(secondNum,"0")) { //선별등급없음
				for (let j = 0; j < jsonVrtyList.length; j++){
					if (_.isEqual(itemDtlCd,jsonVrtyList[j].itemDtlCd)) {
						jsonGridColList[i].push(jsonVrtyList[j]);
					}
				}
				window[`gridReg${'${i}'}`] = fn_createGridForSimpleSort(parentId,gridId,jsonRef,window[`gridReg${'${i}'}`]);
			}

		}
	}

	/**
	 * @name fn_createInptGrid
	 * @description 투입 그리드 생성
	 */
	const fn_createInptGrid = function () {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-inptReg';
		SBGridProperties.id = 'gridInpt';
		SBGridProperties.jsonref = 'jsonInpt';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{
				caption : ["<input type='checkbox' id='allCheckBox' onchange='fn_checkAll(gridInpt, this);'>"],
				ref: 'checkedYn', type: 'checkbox',  width:'10%',
				style: 'text-align:center; font-size:15px;',
				fixedstyle: 'font-size:20px;font-weight:bold',
				userattr: {colNm: "checkedYn"},
				typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
			},
			{caption: ["품종"],	ref: 'vrtyCd',	type:'combo', typeinfo : {ref :'jsonVrtyList', label :'vrtyNm', value :'vrtyCd',onclickedit :true}, width:'16%', style: 'text-align:center; font-size:20px;', fixedstyle: 'font-size:20px;font-weight:bold'},
			{caption: ["생산자"],	ref: 'prdcrCd',	type:'combo', typeinfo :{ref:'jsonPrdcr', label :'prdcrNm', value :'prdcrCd', oneclickedit :true}, width:'16%', style: 'text-align:center; font-size:20px;', fixedstyle: 'font-size:20px;font-weight:bold'},
			{caption: ["입고일자"],	ref: 'wrhsYmd',	type:'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, width:'16%', style: 'text-align:center; font-size:20px;', fixedstyle: 'font-size:20px;font-weight:bold'},
			{caption: ["중량 (Kg)"],	ref: 'inptWght',	type:'input', format : {type:'number', rule:'#,###'},typeinfo :{mask : {alias :'numeric'}},width:'16%', style: 'text-align:center; font-size:20px;', fixedstyle: 'font-size:20px;font-weight:bold'},
			{caption: ["투입창고"],	ref: 'inptWarehouseSeCd',	type:'combo', typeinfo : {ref : 'jsonComWarehouse', label: 'cdVlNm',value: 'cdVl'} ,width:'16%', style: 'text-align:center; font-size:20px;', fixedstyle: 'font-size:20px;font-weight:bold'},
			{caption: ["재고무시"],	ref: 'allowsMinusInvntrYn',	type:'checkbox',typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},width:'10%', style: 'text-align:center; font-size:20px;', fixedstyle: 'font-size:20px;font-weight:bold'},
		];
		gridInpt =  _SBGrid.create(SBGridProperties);
	}

	/**
	 * @name fn_clickTab
	 * @description 탭 클릭
	 */
	const fn_clickTab = function() {
		const tabModel = SBUxMethod.get("idxtabTopJson");
		if (!tabModel) return;

		// 모든 탭 숨김
		document.getElementById('tab_inptReg').style.display = 'none';
		document.getElementById('tab_prfmncReg').style.display = 'none';
		document.getElementById('tab_sortTot').style.display = 'none';

		if (_.isEqual(tabModel,"tab_prfmncReg")) { // 등록탭
			document.getElementById(tabModel).style.display = 'flex';
		} else if (_.isEqual(tabModel,"tab_sortTot")) { // 집계탭
			document.getElementById(tabModel).style.display = 'block';
			// fn_search();
		} else if (_.isEqual(tabModel,"tab_inptReg")) { // 투입탭
			document.getElementById(tabModel).style.display = 'block';
		}
	}


	/**
	 * @name fn_save
	 * @description 선별실적 저장
	 */
	const fn_save = async function () {
		const itemCd = SBUxMethod.get('srch-slt-itemCd');
		const sortYmd = SBUxMethod.get('srch-dtp-sortYmd');
		const spcfctCd = SBUxMethod.get('dtl-slt-spcfctCd');
		const fcltCd = SBUxMethod.get('dtl-slt-fcltCd');
		const warehouseSeCd = SBUxMethod.get('srch-slt-warehouseSeCd');

		if (gfn_isEmpty(itemCd)) {
			gfn_comAlert("W0005", "품목");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(sortYmd)) {
			gfn_comAlert("W0005", "선별일자");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(spcfctCd)) {
			gfn_comAlert("W0005", "기본규격");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(fcltCd)) {
			gfn_comAlert("W0005", "선별기");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(warehouseSeCd)) {
			gfn_comAlert("W0005", "창고");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// 투입실적등록
		let inptList = [];

		// 투입
		const inptGridDataAll = gridInpt.getGridDataAll();
		for (let i =0; i < inptGridDataAll.length; i++) {
			const rowData = inptGridDataAll[i];
			if (_.isEqual(rowData.checkedYn,"Y")) {
				if (gfn_isEmpty(rowData.vrtyCd)) {
					gfn_comAlert("W0005", "투입-품종 ");		//	W0005	{0}이/가 없습니다.
					return;
				}
				if (gfn_isEmpty(rowData.prdcrCd)) {
					gfn_comAlert("W0005", "투입-생산자 ");		//	W0005	{0}이/가 없습니다.
					return;
				}

				inptList.push({
					itemCd : itemCd,
					vrtyCd : rowData.vrtyCd,
					prdcrCd : rowData.prdcrCd,
					wrhsYmd : rowData.wrhsYmd,
					inptWght : rowData.inptWght,
					warehouseSeCd : rowData.inptWarehouseSeCd,
					allowsMinusInvntrYn : rowData.allowsMinusInvntrYn
				})
			}
		}


		// 선별실적등록
		let sortPrfmncList = [];

		// 기본규격
		const spcfct = parseFloat(SBUxMethod.getText('dtl-slt-spcfctCd')) || 0;

		// 예외 규격
		let spcfctGridDataAll = gridSpcfct.getGridDataAll();
		const excptSpcfct = [];
		for(let i = 0 ; i <spcfctGridDataAll.length; i++) {
			if (_.isEqual(spcfctGridDataAll[i].checkedYn,"Y") && !gfn_isEmpty(spcfctGridDataAll[i].grdCd) && !gfn_isEmpty(spcfctGridDataAll[i].spcfctCd)) {
				excptSpcfct.push(spcfctGridDataAll[i]);
			}
		}

		let getGrids = _SBGrid.getGrids();

		for (let i = 0; i < getGrids.length; i++){
			const gridId = getGrids[i];
			// 등록탭의 그리드
			if (!_.isEqual(gridId,"gridTot") && !_.isEqual(gridId,"gridSpcfct") && !_.isEqual(gridId,"gridInpt")) {
				let getGridDataAll = window[getGrids[i]].getGridDataAll();

				for (let j=0; j < getGridDataAll.length ; j++) { // 해당 그리드 행만큼
					const rowData = getGridDataAll[j];
					const secondNum = rowData.grdMngCd.substring(1,2);

					/** GRD_MNG_CD 2번째 자리가 1이면 선별등급 있음, 0이면 없음 **/
					switch (secondNum) {
						case "1" :
							let nowSpcfctCd = spcfctCd; //규격

							if (excptSpcfct.length > 0) { // 예외규격이 있을 때
								Object.keys(rowData).forEach(key =>{
									if (key.startsWith(gStdGrdObj.colPrfxQntt)) { // "qntt__"
										const grdCd = key.split(gStdGrdObj.colPrfxQntt)[1];
										const qntt = parseFloat(rowData[key]) || 0;
										let wght = spcfct; // 기본규격명으로 초기화
										// 예외 규격이 있으면 해당규격으로 계산
										for (let i = 0; i < excptSpcfct.length; i++) {
											if (excptSpcfct[i].grdCd === grdCd) {
												wght = parseFloat(excptSpcfct[i].spcfctNm);
												nowSpcfctCd = excptSpcfct[i].spcfctCd;
												break;
											}
										}
										if (qntt > 0) {
											const sortPrfmnc = {
												inptYmd: sortYmd,
												fcltCd: fcltCd,
												itemCd: itemCd,
												vrtyCd: rowData.vrtyCd,
												spcfctCd: nowSpcfctCd,
												warehouseSeCd: warehouseSeCd,
												grdCd: grdCd,
												sortQntt: qntt,
												sortWght : qntt * wght,
											};
											sortPrfmncList.push(sortPrfmnc);
										}
									}
								});
							} else { //예외규격이 없을때
								Object.keys(rowData).forEach((key) => {
									if (key.startsWith(gStdGrdObj.colPrfxQntt)) {
										const grdCd = key.split(gStdGrdObj.colPrfxQntt)[1];
										const qntt = parseFloat(rowData[key]) || 0;
										if (qntt > 0) {
											const sortPrfmnc = {
												inptYmd: sortYmd,
												fcltCd: fcltCd,
												itemCd: itemCd,
												vrtyCd: rowData.vrtyCd,
												spcfctCd: nowSpcfctCd,
												warehouseSeCd: warehouseSeCd,
												grdCd: grdCd,
												sortQntt: qntt,
												sortWght : qntt * spcfct,
											};
											sortPrfmncList.push(sortPrfmnc);
										}
									}
								});
							}
							break;

						case "0" :
							Object.keys(rowData).forEach((key) => {
								if (key.startsWith(gStdGrdObj.colPrfxQntt)) { // "qntt__"
									const vrtyCd = key.split("qntt__")[1];
									const qntt = parseFloat(rowData[key]);
									if (qntt > 0) {
										const sortPrfmnc = {
											inptYmd: sortYmd,
											fcltCd: fcltCd,
											itemCd: itemCd,
											vrtyCd: vrtyCd,
											spcfctCd: spcfctCd,
											warehouseSeCd: warehouseSeCd,
											grdCd: 'X0',
											sortQntt: qntt,
											sortWght : qntt * spcfct,
										}
										sortPrfmncList.push(sortPrfmnc);
									}
								}
							});
							break;
					}
				}
			}
		}

		// console.log("저장리스트",sortPrfmncList,"투입",inptList);

		if (gfn_isEmpty(inptList)) {
			gfn_comAlert("W0005", "투입");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(sortPrfmncList)) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (!gfn_comConfirm("Q0001", "선별실적 저장")) {	//	Q0001	{0} 하시겠습니까?
			return;
		}

		const sortMng = {
			apcCd: gv_selectedApcCd,
			sortYmd: sortYmd,
			sortPrfmncList: sortPrfmncList,
			rawMtrInptList : inptList
		}

		try {
			const postJsonPromise = gfn_postJSON("/am/sort/insertSortRsltSimply.do", sortMng);
			const data = await postJsonPromise;

			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001");	// I0001	처리 되었습니다.
				fn_reset();
			} else {
				gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
			}
		} catch(e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}


	}

	/**
	 * @name fn_gridRegValueChanged
	 * @description 그리드 수량 변경
	 */
	const fn_gridRegValueChanged = function(gridObj) {
		var nRow = gridObj.getRow();
		var nCol = gridObj.getCol();
		const userAttr  = gridObj.getColUserAttr(nCol);
		const spcfct = parseFloat(SBUxMethod.getText('dtl-slt-spcfctCd')) || 0; // 기본규격

		if (!gfn_isEmpty(userAttr) && userAttr.hasOwnProperty('colNm') && userAttr.hasOwnProperty('colCd')) {
			const rowData = gridObj.getRowData(nRow, false);
			const secondNum = rowData.grdMngCd.substring(1,2); // 등급관리코드
			const colCd = userAttr.colCd;

			let totQntt = 0;
			let totWght = 0;
			switch (secondNum) {
				case "1": // 선별등급있는 그리드

					const spcfctGridDataAll = gridSpcfct.getGridDataAll(); // 예외규격 그리드
					const excptSpcfct = [];
					for(let i = 0 ; i <spcfctGridDataAll.length; i++) {
						if (_.isEqual(spcfctGridDataAll[i].checkedYn,"Y") && !gfn_isEmpty(spcfctGridDataAll[i].grdCd) && !gfn_isEmpty(spcfctGridDataAll[i].spcfctCd)) {
							excptSpcfct.push(spcfctGridDataAll[i]);
						}
					}

					if (excptSpcfct.length > 0) { // 예외규격이 있을 때
						Object.keys(rowData).forEach((key) => {
							if (key.startsWith(gStdGrdObj.colPrfxQntt)) { // "qntt__"
								const grdCd = key.split(gStdGrdObj.colPrfxQntt)[1];
								const qntt = parseFloat(rowData[key]) || 0;
								let wght = spcfct; // 기본규격으로 초기화

								if (qntt > 0) {
									// 예외 규격이 있으면 해당규격으로 계산
									for (let i = 0; i < excptSpcfct.length; i++) {
										if (excptSpcfct[i].grdCd === grdCd) {
											wght = parseFloat(excptSpcfct[i].spcfctNm);
											break;
										}
									}
									totQntt += qntt;
									totWght += qntt * wght;
								}
							}
						});


					} else { // 예외 규격 없을 때 기본 규격 적용
						Object.keys(rowData).forEach((key) => {
							if (key.startsWith(gStdGrdObj.colPrfxQntt)) {
								const qntt = parseFloat(rowData[key]) || 0;
								totQntt += qntt;
							}
						});
						totWght = spcfct * totQntt;
					}
					break;
				case "0": // 선별등급없는 그리드
					Object.keys(rowData).forEach((key) => {
						if (key.startsWith(gStdGrdObj.colPrfxQntt)) {
							const qntt = parseFloat(rowData[key]) || 0;

							totQntt += qntt;
						}
					});
					totWght = spcfct * totQntt;
					break;
			}

			rowData.sortQntt = totQntt;
			rowData.sortWght = totWght;
			gridObj.refresh();
		}
		gridObj.refresh();

	}

	const fn_gridReg0ValueChanged = function() {
		fn_gridRegValueChanged(gridReg0);
	}
	const fn_gridReg1ValueChanged = function() {
		fn_gridRegValueChanged(gridReg1);
	}
	const fn_gridReg2ValueChanged = function() {
		fn_gridRegValueChanged(gridReg2);
	}
	const fn_gridReg3ValueChanged = function() {
		fn_gridRegValueChanged(gridReg3);
	}
	const fn_gridReg4ValueChanged = function() {
		fn_gridRegValueChanged(gridReg4);
	}

	/**
	 * @name fn_spcfctGridValueChange
	 * @description 규격 그리드 value 변경 함수
	 */
	const fn_spcfctGridValueChange = function (){
		const nRow = gridSpcfct.getRow();
		const nCol = gridSpcfct.getCol();
		const colNm = gridSpcfct.getColUserAttr(nCol).colNm;
		const rowData = gridSpcfct.getRowData(nRow,false); // call by refrence
		if (gfn_isEmpty(rowData)) {
			return;
		}
		const spcfctCd = rowData.spcfctCd;
		const grdCd = rowData.grdCd;
		// 규격명 추가
		if (!gfn_isEmpty(colNm) && _.isEqual(colNm,"spcfctCd")) {
			jsonApcSpcfct.forEach((item) => {
				if (_.isEqual(item.spcfctCd,spcfctCd)) {
					rowData.spcfctNm = item.spcfctNm;
				}
			});
		}
		// 등급 & 규격 선택되면 체크박스 체크
		if (!gfn_isEmpty(spcfctCd) && !gfn_isEmpty(grdCd)) {
			rowData.checkedYn = "Y";
		}
		gridSpcfct.refresh();

		// 예외규격 등급 중복 안되게

		fn_sortRegUnitWghtAplcn(); // 선별등록단위중량적용
	}

	/**
	 * @name fn_sortRegUnitWghtAplcn
	 * @description 선별등록단위중량적용 함수
	 */
	const fn_sortRegUnitWghtAplcn = function () {
		const spcfct = parseFloat(SBUxMethod.getText('dtl-slt-spcfctCd')) || 0; // 기본규격

		const spcfctGridDataAll = gridSpcfct.getGridDataAll(); // 예외규격 그리드
		const excptSpcfct = [];
		for(let i = 0 ; i <spcfctGridDataAll.length; i++) {
			if (_.isEqual(spcfctGridDataAll[i].checkedYn,"Y") && !gfn_isEmpty(spcfctGridDataAll[i].grdCd) && !gfn_isEmpty(spcfctGridDataAll[i].spcfctCd)) {
				excptSpcfct.push(spcfctGridDataAll[i]);
			}
		}

		if (!gfn_isEmpty(jsonItemDtl)){
			for (let i = 0; i < jsonItemDtl.length; i++) { // 그리드 갯수만큼
				const gridData = window[`gridReg${'${i}'}`].getGridDataAll(false); // call by ref

				for (let j = 0; j < gridData.length; j++) { // 해당 그리드 행만큼
					const rowData = gridData[j];
					const secondNum = rowData.grdMngCd.substring(1,2);

					let totQntt = 0; // 수량합계
					let totWght = 0; // 중량합계

					switch (secondNum) {
						case "1" :


							if (excptSpcfct.length > 0) { // 예외규격이 있을 때
								Object.keys(rowData).forEach((key) => {
									if (key.startsWith(gStdGrdObj.colPrfxQntt)) { // "qntt__"
										const grdCd = key.split(gStdGrdObj.colPrfxQntt)[1];
										const qntt = parseFloat(rowData[key]) || 0;

										let wght = spcfct; // 기본규격으로 초기화

										// 예외 규격이 있으면 해당규격으로 계산
										for (let i = 0; i < excptSpcfct.length; i++) {
											if (excptSpcfct[i].grdCd === grdCd) {
												wght = parseFloat(excptSpcfct[i].spcfctNm);
												break;
											}
										}
										totQntt += qntt;
										totWght += qntt * wght;
									}
								});


							} else { // 예외 규격 없을 때 기본 규격 적용
								Object.keys(rowData).forEach((key) => {
									if (key.startsWith(gStdGrdObj.colPrfxQntt)) {
										const qntt = parseFloat(rowData[key]) || 0;
										totQntt += qntt;
									}
								});
								totWght = spcfct * totQntt;
							}

							break;
						case "0" :
							Object.keys(rowData).forEach((key) => {
								if (key.startsWith(gStdGrdObj.colPrfxQntt)) {
									const qntt = parseFloat(rowData[key]) || 0;
									totQntt += qntt;
								}
							});
							totWght = spcfct * totQntt;
							break;
					}
					rowData.sortQntt = totQntt;
					rowData.sortWght = totWght;
				}
				window[`gridReg${'${i}'}`].refresh();
			}
		}

	}

	/**
	 * @name fn_search
	 * @description 선별실적 등급별 조회
	 */
	const fn_search = async function () {
		const sortYmd = SBUxMethod.get('srch-dtp-sortYmd');
		const itemCd = SBUxMethod.get('srch-slt-itemCd');
		const spcfctCd = SBUxMethod.get('dtl-slt-spcfctCd');
		const fcltCd = SBUxMethod.get('dtl-slt-fcltCd');
		const warehouseSeCd = SBUxMethod.get('srch-slt-warehouseSeCd');

		if (gfn_isEmpty(sortYmd)) {
			gfn_comAlert("W0005", "선별일자");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(itemCd)) {
			gfn_comAlert("W0005", "품목");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(fcltCd)) {
			gfn_comAlert("W0005", "선별기");		//	W0005	{0}이/가 없습니다.
			return;
		}
		if (gfn_isEmpty(warehouseSeCd)) {
			gfn_comAlert("W0005", "창고");		//	W0005	{0}이/가 없습니다.
			return;
		}

		const postJsonPromise = gfn_postJSON("/am/sort/selectSortPrfmncList.do", {
			apcCd: gv_selectedApcCd,
			inptYmdFrom: sortYmd,
			inptYmdTo: sortYmd,
			itemCd: itemCd,
			fcltCd: fcltCd,
			warehouseSeCd: warehouseSeCd,
		});

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {

				jsonTot.length = 0;
				// 등급
				if (!gfn_isEmpty(jsonGrdList)) {
					jsonGrdList.forEach(item =>{
						gridTot.addRow(true,{grdVrty : item.grdNm,grdCd : item.grdCd});
					});
					gridTot.addRow(true,{grdVrty : "합계"});
				}

				data.resultList.forEach((item,index) => {
					const vrtyCd = item.vrtyCd;
					const grdCd = item.grdCd;
					const sortQntt = item.sortQntt;
					const sortWght = item.sortWght;

					for (let j = 0; j < jsonTot.length; j++) {
						if (jsonTot[j].grdCd === grdCd) {
							jsonTot[j][`${'${itemCd}'}_${'${vrtyCd}'}`] = (jsonTot[j][`${'${itemCd}'}_${'${vrtyCd}'}`] || 0) + sortQntt;
							jsonTot[j].qnttTot = Number(jsonTot[j].qnttTot) + sortQntt;
							jsonTot[j].wghtTot = Number(jsonTot[j].wghtTot) + sortWght;
							break;
						}
					}
					// 합계 행
					jsonTot[jsonTot.length-1][`${'${itemCd}'}_${'${vrtyCd}'}`] = Number(jsonTot[jsonTot.length-1][`${'${itemCd}'}_${'${vrtyCd}'}`] || 0) + sortQntt
					jsonTot[jsonTot.length-1].qnttTot = Number(jsonTot[jsonTot.length-1].qnttTot) + sortQntt;
					jsonTot[jsonTot.length-1].wghtTot = Number(jsonTot[jsonTot.length-1].wghtTot) + sortWght;
				});

				gridTot.refresh();
				gridTot.setRowStyleEx(jsonTot.length+1, 'background-color: #ceebff ; font-weight: bold; color: #0060b3;', 'data', true);

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
	}
	/**
	 * @name fn_reset
	 * @description 종료버튼 - clear
	 */
	const fn_reset = async function () {
		SBUxMethod.set("srch-dtp-sortYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.refresh('srch-slt-itemCd');
		SBUxMethod.refresh('dtl-slt-spcfctCd');
		SBUxMethod.refresh('dtl-slt-fcltCd');
		SBUxMethod.refresh('srch-slt-warehouseSeCd');
		/** 투입 **/
		jsonInpt.length = 0;
		gridInpt.rebuild();
		/** 등록 **/
		for (let i = 0; i < 5; i++) {
			jsonItemDtlTypes[i].length = 0;
			jsonGridColList[i].length = 0;
		}
		await fn_createGrid();
		/** 예외 규격 **/
		jsonSpcfct.length = 0;
		gridSpcfct.rebuild();
		/** 집계 **/
		fn_search();
		/*jsonTot.length = 0;
		gridTot.rebuild();*/
	}


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>