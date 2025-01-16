<%
 /**
  * @Class Name : statCrtrMng.jsp
  * @Description : 통계기준관리
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
	<title>title : 통계기준관리</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<section class="content container-fluid">
	<div class="box box-solid">
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
				<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 통계기준관리 -->
			</div>
			<div style="margin-left: auto;">
				<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						text="저장"
						class="btn btn-sm btn-success"
						onclick="fn_save"
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
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 7%">
					<col style="width: 6%">
					<col style="width: 6%">
					<col style="width: 3%">
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
					<th scope="row" class="th_bg">기준유형</th>
					<td colspan="3" class="td_input" style="border-right: hidden;">
						<sbux-select
								id="srch-slt-crtrType"
								name="srch-slt-crtrType"
								uitype="single"
								class="form-control input-sm"
								unselected-text="전체"
								jsondata-ref="jsonCrtrType"
								jsondata-text="cdVlNm"
								jsondata-value="cdVl"
								style="max-width:80%;"
						></sbux-select>
					</td>
				</tr>

				</tbody>
			</table>

			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<div style="display: flex; flex-direction: column; height: 40vh">
				<div class="row">
					<div class="col-sm-6">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>통계기준 목록</span>
									<span style="font-size:12px">(조회건수 <span id="cnt-crtr">0</span>건)</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdCrtr" style="height:60vh;"></div>
					</div>
					<div class="col-sm-6">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>통계기준 상세정보</span>
									<span style="font-size:12px">(조회건수 <span id="cnt-crtrDtl">0</span>건)</span>
								</li>
							</ul>
							<div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
								<sbux-button
										id="btn-saveDtl"
										name="btn-saveDtl"
										uitype="normal"
										class="btn btn-sm btn-outline-dark"
										onclick="fn_saveDtl"
										text="상세저장"
								></sbux-button>
							</div>
						</div>
						<div id="sb-area-grdCrtrDtl" style="height:60vh;"></div>
					</div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</div>
</section>
<!-- 품종 선택 Modal -->
<div>
	<sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:800px"></sbux-modal>
</div>
<div id="body-modal-vrtyCrtr">
	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
</div>

<div>
	<sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-prdcr">
	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">

	var mergeArray = [];

	var jsonCrtrType = [];
	var jsonCrtrCd = [];
	var jsonDtlCd = [];
	var jsonApcItem	= [];	// 품목 		itemCd

	var jsonYn = [
		{value : 'Y', label : '사용' },
		{value : 'N', label : '미사용' }
	];

	// grid
	// 통계기준목록
	var grdCrtr;
	var jsonCrtr = [];

	// 집계기준상세정보
	var grdCrtrDtl;
	var jsonCrtrDtl= [];

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	const fn_init = async function() {
		await fn_initSBSelect();
		fn_createGrid();
		fn_createGridDtl();

		await fn_search();
	}

	const fn_initSBSelect = async function() {

		let result = await Promise.all([
			gfn_getComCdDtls('STATS_CRTR_TYPE'),
			gfn_getComCdDtls('STATS_CRTR_CD'),
			gfn_getApcItem(gv_selectedApcCd)
		]);

		jsonCrtrType = result[0];
		jsonCrtrCd = result[1];
		jsonApcItem = result[2];

		SBUxMethod.refresh("srch-slt-crtrType");
	}

	const fn_createGrid = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdCrtr';
		SBGridProperties.id = 'grdCrtr';
		SBGridProperties.jsonref = 'jsonCrtr';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.allowcopy = true;
		SBGridProperties.oneclickedit = true;
		SBGridProperties.extendlastcol = 'scroll';

		SBGridProperties.columns = [
			{caption: ["처리"], 		ref: 'delYn', 		type:'button', width:'60px', style: 'text-align:center',
				renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
					if (!gfn_isEmpty(strValue)){
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
					} else {
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", 1)'>추가</button>";
					}
				}},
			{
				caption: ["기준유형"],
				ref : 'statsCrtrType',
				type: 'combo',
				typeinfo : {ref:'jsonCrtrType', label:'cdVlNm', value:'cdVl'},
				width:'200px',
				style:'text-align:center'
			},
			{
				caption: ["기준코드"],
				ref: 'crtrCd',
				type:'combo',
				typeinfo : {ref:'jsonCrtrCd', label:'cdVlNm', value:'cdVl'},
				width:'150px',
				style:'text-align:center',
				userattr: {colNm: "crtrCd"},
			},
			{
				caption: ["기준표시명"],
				ref: 'crtrIndctNm',
				type: 'input',
				width:'140px',
				style: 'text-align:left;',
				userattr: {colNm: "crtrIndctNm"},
			},
			{
				caption: ["표시순서"],
				ref: 'indctSeq',
				type:'input',
				width:'100px',
				style:'text-align:right'
			},
			{
				caption: ["사용여부"],
				ref: 'useYn',
				type:'combo',
				typeinfo : {ref:'jsonYn', label:'label', value:'value', oneclickedit: true},
				width:'100px',
				style:'text-align:center'
			},
		];
		grdCrtr = _SBGrid.create(SBGridProperties);
		grdCrtr.bind('rowchanged', fn_grdCrtrRowChanged);
		grdCrtr.bind('valuechanged', fn_grdCrtrValueChanged);
	}

	const fn_createGridDtl = async function(_crtr) {

		jsonDtlCd.length = 0;

		let dtlCol = 	{
			caption: ["상세코드"],
			ref: 'dtlCd',
			type:'input',
			width:'150px',
			style:'text-align:center'
		}

		let indctNm = "상세표시명";
		let hideIndctNm = false;

		if (!gfn_isEmpty(_crtr)) {
			switch (_crtr['crtrChrVl']) {
				case "COM_CD":
					jsonDtlCd = await gfn_getComCdDtls(_crtr['crtrCd']);
					dtlCol = 	{
						caption: ["상세코드"],
						ref: 'dtlCd',
						type:'combo',
						typeinfo : {ref:'jsonDtlCd', label:'cdVlNm', value:'cdVl', oneclickedit: true},
						width:'150px',
						style:'text-align:center',
						userattr: {colNm: "comCd"},
					}

					hideIndctNm = true;

					break;
				case "ITEM_CD":
					dtlCol = 	{
						caption: ["품목코드"],
						ref: 'dtlCd',
						type:'combo',
						typeinfo : {ref:'jsonApcItem', label:'itemNm', value:'itemCd', oneclickedit: true},
						width:'150px',
						style:'text-align:center',
						userattr: {colNm: "dtlIndctNm"},
					}

					hideIndctNm = true;

					break;
				case "ITEM_VRTY_CD":
					dtlCol = 	{
						caption: ["품종코드"],
						ref: 'dtlCd',
						type:'inputbutton',
						typeinfo : {callback: fn_grdVrtyPopup},
						width:'150px',
						style:'text-align:center',
						userattr: {colNm: "itemVrtyCd"},
					}

					indctNm = "품종명";

					break;
				case "PRDCR_CD":
					dtlCol = 	{
						caption: ["생산자코드"],
						ref: 'dtlCd',
						type:'inputbutton',
						typeinfo : {callback: fn_grdPrdcrPopup},
						width:'150px',
						style:'text-align:center',
						userattr: {colNm: "prdcrCd"},
					}

					indctNm = "생산자명";

					break;

				default:
					break;
			}

		}

		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdCrtrDtl';
		SBGridProperties.id = 'grdCrtrDtl';
		SBGridProperties.jsonref = 'jsonCrtrDtl';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.allowcopy = true;
		SBGridProperties.extendlastcol = 'scroll';

		SBGridProperties.columns = [
			{caption: ["처리"], 		ref: 'delYn', 		type:'button', width:'60px', style: 'text-align:center',
				renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
					if (!gfn_isEmpty(strValue)){
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRowDtl(" + nRow + ")'>삭제</button>";
					} else {
						return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRowDtl(" + nRow + ", 1)'>추가</button>";
					}
				}},
			{
				caption: ["상세순번"],
				ref: 'dtlSn',
				type:'output',
				width:'60px',
				style:'text-align:right'
			},
		];

		SBGridProperties.columns.push(dtlCol);
		SBGridProperties.columns.push(
				{
					caption: [indctNm]
					, ref: 'dtlIndctNm'
					, type:'input'
					, width:'100px'
					, style:'text-align:left'
					, hidden: hideIndctNm
				},
				{
					caption: ["상세값"]
					, ref: 'dtlVl'
					, type:'input'
					, width:'100px'
					, style:'text-align:right'
				},
				{caption: ["사용여부"],
					ref: 'useYn',
					type:'combo',
					typeinfo : {ref:'jsonYn', label:'label', value:'value', oneclickedit: true},
					width:'80px',
					style:'text-align:center'
				},
		);

		grdCrtrDtl = _SBGrid.create(SBGridProperties);
		grdCrtrDtl.bind('valuechanged', fn_grdCrtrDtlValueChanged);
	}

	const fn_grdCrtrRowChanged = async function() {

		const nRow = grdCrtr.getRow();

		if (nRow < 1) {
			return;
		}

		const rowData = grdCrtr.getRowData(nRow);

		if (gfn_isEmpty(rowData) || !_.isEqual("Y", rowData["chkVl"])) {
			jsonCrtrDtl.length = 0;
			grdCrtrDtl.refresh();
			document.querySelector('#cnt-crtrDtl').innerText = 0;
			return;
		}

		await fn_setGrdCrtrDtl(rowData);
	}

	const fn_setGrdCrtrDtl = async function(_crtr) {

		let needsNewRow = true;
		jsonCrtrDtl.length = 0;

		await fn_createGridDtl(_crtr);

		try {

			const postJsonPromise = gfn_postJSON("/am/stat/selectCrtrDtlList.do", {
				apcCd: gv_selectedApcCd,
				statCrtrType: _crtr.statCrtrType,
				crtrCd: _crtr.crtrCd,
			});

			const data = await postJsonPromise;

			if (_.isEqual("S", data.resultStatus)) {

				if (data.resultList.length > 0) {
					needsNewRow = true;
				}

				data.resultList.forEach((item, index) => {
					item.delYn = "N";
					item.chkVl = "Y";
					if (!gfn_isEmpty(item.dtlSn)) {
						jsonCrtrDtl.push(item);
					}
				});

				let totalRecordCount = jsonCrtrDtl.length;
				grdCrtrDtl.rebuild();

				document.querySelector('#cnt-crtrDtl').innerText = totalRecordCount;

				grdCrtrDtl.setCellDisabled(
						0,
						0,
						grdCrtrDtl.getRows() -1,
						3,
						true
				);
				grdCrtrDtl.setCellDisabled(
						0,
						4,
						grdCrtrDtl.getRows() -1,
						grdCrtrDtl.getCols() -1,
						false
				);

				if (needsNewRow) {
					grdCrtrDtl.addRow();
					grdCrtrDtl.setCellDisabled(
							grdCrtrDtl.getRows() -1,
							0,
							grdCrtrDtl.getRows() -1,
							grdCrtrDtl.getCols() -1,
							true
					);
				}

			} else {
				gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
				//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}

	const fn_grdDtlPopup = function() {

		let row = grdCrtrDtl.getRow();

		if (row < 1) {
			return;
		}

		let rowData = grdCrtrDtl.getRowData(row);
	}

	const fn_grdVrtyPopup = function() {

		let row = grdCrtrDtl.getRow();

		if (row < 1) {
			return;
		}

		let rowData = grdCrtrDtl.getRowData(row);

		if (!_.isEqual('ITEM_VRTY_CD', rowData.crtrChrVl)) {
			return;
		}

		popVrty.init(gv_selectedApcCd, gv_selectedApcNm, null, fn_setGrdVrty);
		SBUxMethod.openModal("modal-vrty");
	}

	const fn_setGrdVrty = function(vrty) {

		let row = grdCrtrDtl.getRow()
		let rowData = grdCrtrDtl.getRowData(row, false);

		if (!gfn_isEmpty(vrty)) {
			rowData['dtlCd'] = vrty.itemCd + vrty.vrtyCd;
			rowData['dtlIndctNm'] = vrty.vrtyNm;
		} else {
			rowData['dtlCd'] = "";
			rowData['dtlIndctNm'] = "";
		}

		grdCrtrDtl.refresh()
	}

	/**
	 * @name fn_grdPrdcrPopup
	 * @description 생산자 선택 popup 호출
	 */
	const fn_grdPrdcrPopup = function() {

		let row = grdCrtrDtl.getRow();

		if (row < 1) {
			return;
		}

		let rowData = grdCrtrDtl.getRowData(row);

		if (!_.isEqual('PRDCR_CD', rowData.crtrChrVl)) {
			return;
		}

		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setGrdPrdcr);
		SBUxMethod.openModal("modal-prdcr");
	}

	/**
	 * @name fn_setGrdPrdcr
	 * @description 생산자 선택 popup callback 처리
	 */
	const fn_setGrdPrdcr = async function(prdcr) {

		let row = grdCrtrDtl.getRow()
		let rowData = grdCrtrDtl.getRowData(row, false);

		if (!gfn_isEmpty(prdcr)) {
			rowData['dtlCd'] = prdcr.prdcrCd;
			rowData['dtlIndctNm'] = prdcr.prdcrNm;
		} else {
			rowData['dtlCd'] = "";
			rowData['dtlIndctNm'] = "";
		}

		grdCrtrDtl.refresh()
	}

	/**
	 * @name fn_addRow
	 * @description 행추가
	 * @param {number} nRow
	 */
	const fn_addRow = async function(nRow) {
		const editableRow = grdCrtr.getRowData(nRow, false);	// call by reference(deep copy)
		editableRow.delYn = "N";
		editableRow.useYn = "Y";

		grdCrtr.rebuild();
		grdCrtr.setCellDisabled(nRow, 2, nRow, grdCrtr.getCols() - 1, false);
		nRow++;
		grdCrtr.addRow(true);
		grdCrtr.setCellDisabled(nRow, 0, nRow, grdCrtr.getCols() - 1, true);
	}

	/**
	 * @name fn_delRow
	 * @description 행삭제
	 * @param {number} nRow
	 */
	const fn_delRow = async function(_nRow) {
		const _crtr = grdCrtr.getRowData(_nRow);

		if (_.isEqual("Y", _crtr["chkVl"])) {
			if (!gfn_comConfirm("Q0002", "등록기준", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}
			await fn_deleteCrtr(_crtr);

		} else {
			grdCrtr.deleteRow(_nRow);
		}
	}

	/**
	 * @name fn_addRowDtl
	 * @description 행추가
	 * @param {number} nRow
	 */
	const fn_addRowDtl = async function(nRow) {

		const crtrRow = grdCrtr.getRow();

		if (crtrRow < 1) {
			gfn_comAlert("W0001", "통계기준");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		const _crtr = grdCrtr.getRowData(crtrRow);

		if (gfn_isEmpty(_crtr) || !_.isEqual("Y", _crtr["chkVl"])) {
			gfn_comAlert("W0020", "미등록");		//	W0020	{0} 상태의 {1} 입니다.
			return;
		}

		const editableRow = grdCrtrDtl.getRowData(nRow, false);	// call by reference(deep copy)

		editableRow.statsCrtrType = _crtr.statsCrtrType;
		editableRow.statsCrtrTypeNm = _crtr.statsCrtrTypeNm;
		editableRow.crtrCd = _crtr.crtrCd;
		editableRow.crtrIndctNm = _crtr.crtrIndctNm;
		editableRow.crtrChrVl = _crtr.crtrChrVl;
		editableRow.delYn = "N";
		editableRow.useYn = "Y";

		grdCrtrDtl.rebuild();
		grdCrtrDtl.setCellDisabled(nRow, 3, nRow, grdCrtrDtl.getCols() - 1, false);

		nRow++;
		grdCrtrDtl.addRow(true);
		grdCrtrDtl.setCellDisabled(nRow, 0, nRow, grdCrtrDtl.getCols() - 1, true);
	}

	/**
	 * @name fn_delRowDtl
	 * @description 행삭제
	 * @param {number} nRow
	 */
	const fn_delRowDtl = async function(_nRow) {

		const rowData = grdCrtrDtl.getRowData(_nRow);
		if (_.isEqual("Y", rowData["chkVl"])) {
			if (!gfn_comConfirm("Q0002", "등록기준상세", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}

			await fn_deleteCrtrDtl(rowData);

		} else {
			grdCrtrDtl.deleteRow(_nRow);
		}
	}

	/**
	 * @name fn_search
	 * @description 조회 버튼
	 */
	const fn_search = async function() {

		jsonCrtrDtl.length = 0;
		grdCrtrDtl.refresh();

		await fn_setGrdCrtr();
	}

	const fn_setGrdCrtr = async function() {

		let crtrType = SBUxMethod.get("srch-slt-crtrType");

		const postJsonPromise = gfn_postJSON("/am/stat/selectCrtrList.do", {
			apcCd: gv_selectedApcCd,
			statsCrtrType : crtrType
		});

		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {

				jsonCrtr.length = 0;
				data.resultList.forEach((item, index) => {
					item.delYn = "N";
					item.chkVl = "Y";
					jsonCrtr.push(item);
				});

				/** @type {number} **/
				let totalRecordCount = jsonCrtr.length;
				grdCrtr.rebuild();

				grdCrtr.setCellDisabled(
						0,
						0,
						grdCrtr.getRows() -1,
						2,
						true
				);
				grdCrtr.setCellDisabled(
						0,
						3,
						grdCrtr.getRows() -1,
						grdCrtr.getCols() -1,
						false
				);

				grdCrtr.addRow();
				grdCrtr.setCellDisabled(
						grdCrtr.getRows() -1,
						0,
						grdCrtr.getRows() -1,
						grdCrtr.getCols() -1,
						true
				);
			} else {
				gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
			}
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	const fn_save = async function() {
		await fn_insertCrtr();
	}

	/**
	 * @name fn_insertCrtr
	 * @description 저장 버튼
	 */
	const fn_insertCrtr = async function() {

		const crtrList = [];

		const allData = grdCrtr.getGridDataAll();

		for ( var i=1; i<=allData.length; i++ ){
			const rowData = grdCrtr.getRowData(i);
			const rowSts = grdCrtr.getRowStatus(i);

			if (!_.isEqual("N", rowData.delYn) || rowSts === 0 ) {
				continue;
			}

			if (gfn_isEmpty(rowData.statsCrtrType)) {
				gfn_comAlert("W0005", "기준유형");		//	W0005	{0}이/가 없습니다.
				return;
			}

			if (gfn_isEmpty(rowData.crtrCd)) {
				gfn_comAlert("W0005", "기준코드");		//	W0005	{0}이/가 없습니다.
				return;
			}

			if (gfn_isEmpty(rowData.crtrIndctNm)) {
				gfn_comAlert("W0005", "기준표시명");		//	W0005	{0}이/가 없습니다.
				return;
			}

			crtrList.push({
				statsCrtrType: rowData.statsCrtrType,
				crtrCd: rowData.crtrCd,
				crtrVl: rowData.crtrVl,
				crtrIndctNm: rowData.crtrIndctNm,
				indctSeq: rowData.indctSeq,
				useYn: rowData.useYn,
			});
		}

		if (crtrList.length == 0) {
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
			return;
		}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
			return;
		}

		const param = {
			apcCd: gv_selectedApcCd,
			crtrList: crtrList
		}

		try {
			const postJsonPromise = gfn_postJSON("/am/stat/insertCrtr.do", param);
			const data = await postJsonPromise;

			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001");	// I0001	처리 되었습니다.
				fn_search();
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
	 * @name fn_deleteCrtr
	 * @description 기준 삭제
	 */
	const fn_deleteCrtr = async function(_crtr) {

		const crtrList = [{
			statsCrtrType: _crtr.statsCrtrType,
			crtrCd: _crtr.crtrCd,
		}];

		const param = {
			apcCd: gv_selectedApcCd,
			crtrList: crtrList
		}

		try {
			const postJsonPromise = gfn_postJSON("/am/tot/deleteCrtr.do", param);
			const data = await postJsonPromise;

			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001");	// I0001	처리 되었습니다.
				fn_search();
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
	 * @name fn_saveDtl
	 * @description 상세기준 저장 버튼
	 */
	const fn_saveDtl = async function() {
		await fn_insertCrtrDtl();
	}

	/**
	 * @name fn_insertCrtrDtl
	 * @description 상세기준 저장 버튼
	 */
	const fn_insertCrtrDtl = async function() {

		const crtrDtlList = [];

		const allData = grdCrtrDtl.getGridDataAll();

		const crtrRow = grdCrtr.getRow();
		const crtrInfo = grdCrtr.getRowData(crtrRow);

		for ( var i=1; i<=allData.length; i++ ){

			const rowData = grdCrtrDtl.getRowData(i);
			const rowSts = grdCrtrDtl.getRowStatus(i);

			if (!_.isEqual("N", rowData.delYn)) {
				continue;
			}

			if (gfn_isEmpty(rowData.statsCrtrType)) {
				gfn_comAlert("W0005", "기준유형");		//	W0005	{0}이/가 없습니다.
				return;
			}

			if (gfn_isEmpty(rowData.crtrCd)) {
				gfn_comAlert("W0005", "기준코드");		//	W0005	{0}이/가 없습니다.
				return;
			}

			if (gfn_isEmpty(rowData.dtlIndctNm)) {
				gfn_comAlert("W0005", "상세표시명");		//	W0005	{0}이/가 없습니다.
				return;
			}

			if (gfn_isEmpty(rowData.dtlCd)) {
				gfn_comAlert("W0005", "상세코드");		//	W0005	{0}이/가 없습니다.
				return;
			}

			crtrDtlList.push({
				statsCrtrType: rowData.statsCrtrType,
				crtrCd: rowData.crtrCd,
				dtlSn: rowData.dtlSn,
				dtlCd: rowData.dtlCd,
				dtlVl: rowData.dtlVl,
				dtlIndctNm: rowData.dtlIndctNm,
				indctSeq: rowData.indctSeq,
				useYn: rowData.useYn,
			});
		}

		if (crtrDtlList.length == 0) {
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
			return;
		}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
			return;
		}

		const param = {
			apcCd: gv_selectedApcCd,
			statsCrtrType: crtrInfo.statsCrtrType,
			crtrCd: crtrInfo.crtrCd,
			crtrDtlList: crtrDtlList
		}

		try {
			const postJsonPromise = gfn_postJSON("/am/tot/insertCrtrDtl.do", param);
			const data = await postJsonPromise;

			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001");	// I0001	처리 되었습니다.

				fn_setGrdCrtrDtl(crtrInfo);

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
	 * @name fn_deleteCrtrDtl
	 * @description 상세기준 삭제
	 */
	const fn_deleteCrtrDtl = async function(_crtrDtl) {

		const crtrDtlList = [{
			statsCrtrType: _crtrDtl.statsCrtrType,
			crtrCd: _crtrDtl.crtrCd,
			dtlSn: _crtrDtl.dtlSn,
		}];

		if (crtrDtlList.length == 0) {
			gfn_comAlert("W0003", "삭제");		//	W0003	{0}할 대상이 없습니다.
			return;
		}

		const param = {
			apcCd: gv_selectedApcCd,
			statsCrtrType: _crtrDtl.statsCrtrType,
			crtrCd: _crtrDtl.crtrCd,
			crtrDtlList: crtrDtlList
		}

		try {
			const postJsonPromise = gfn_postJSON("/am/stat/deleteCrtrDtl.do", param);
			const data = await postJsonPromise;

			if (_.isEqual("S", data.resultStatus)) {
				gfn_comAlert("I0001");	// I0001	처리 되었습니다.

				const crtrRow = grdCrtr.getRow();
				const crtrInfo = grdCrtr.getRowData(crtrRow);

				fn_setGrdCrtrDtl(crtrInfo);

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
	 * @name fn_grdCrtrValueChanged
	 * @description 기준 변경 event 처리
	 * @function
	 */
	const fn_grdCrtrValueChanged = function() {
		var nRow = grdCrtr.getRow();
		var nCol = grdCrtr.getCol();

		const usrAttr = grdCrtr.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

			const rowData = grdCrtr.getRowData(nRow, false);	// deep copy

			switch (usrAttr.colNm) {

				case "crtrCd":
					if (!gfn_isEmpty(rowData.crtrCd)) {

						const chkInfo = _.find(jsonCrtrCd, {cdVl: rowData.crtrCd});
						if (!gfn_isEmpty(chkInfo)) {
							rowData.crtrIndctNm = chkInfo.cdVlNm;
							grdCrtr.refresh();
						}
					}
					break;
				default:
					return;
			}
		}
	}

	/**
	 * @name fn_grdCrtrDtlValueChanged
	 * @description 기준 상세 변경 event 처리
	 * @function
	 */
	const fn_grdCrtrDtlValueChanged = function() {
		var nRow = grdCrtrDtl.getRow();
		var nCol = grdCrtrDtl.getCol();

		const usrAttr = grdCrtrDtl.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

			const rowData = grdCrtrDtl.getRowData(nRow, false);	// deep copy

			switch (usrAttr.colNm) {

				case "comCd":
					if (!gfn_isEmpty(rowData.dtlCd)) {
						const chkInfo = _.find(jsonDtlCd, {cdVl: rowData.dtlCd});
						if (!gfn_isEmpty(chkInfo)) {
							rowData.dtlIndctNm = chkInfo.cdVlNm;
							grdCrtrDtl.refresh();
						}
					}
					break;
				case "itemCd":
					if (!gfn_isEmpty(rowData.dtlCd)) {
						const chkInfo = _.find(jsonApcItem, {itemCd: rowData.dtlCd});
						if (!gfn_isEmpty(chkInfo)) {
							rowData.dtlIndctNm = chkInfo.itemNm;
							grdCrtrDtl.refresh();
						}
					}
					break;
				default:
					return;
			}
		}
	}

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>