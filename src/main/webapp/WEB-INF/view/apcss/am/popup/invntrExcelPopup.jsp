<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 재고정보등록 엑셀 올리기</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
				</div>
			</div>
			<div class="box-body">
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>재고 등록 내역</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSaveGdsInvntrPopup" name="btnSaveGdsInvntrPopup" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveGdsInvntrPopup"></sbux-button>
						<sbux-button id="btnEndGdsInvntrPopup" name="btnEndGdsInvntrPopup" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-excel-gdsInvntr')"></sbux-button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="sb-area-excelGdsInvntrPopup" style="height:380px;"></div>
					</div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonEPIApcItem 			= [];	// 품목
	var jsonEPIApcVrty 			= [];	// 품종
	var jsonEPIApcPrdcr 		= [];	// 생산자
	var jsonEPIWarehouseSeCd 	= [];	// 창고
	var jsonEPIGdsGrd 			= [];	// 등급(상품)
	var jsonEPISpcfct 			= [];	// 규격
	var jsonEPISpmtPckgUnit 	= [];	// 포장구분

	var jsonEPIGdsSeCd			= [];	// 상품구분
	var jsonEPIWrhsSeCd			= [];	// 입고구분
	var jsonEPITrsprtSeCd		= [];	// 운송구분

	var grdExcelGdsInvntrPopup;
	var jsonExcelGdsInvntrPopup =[];

	const fn_initSBExcelSelectGdsPopup = async function() {

		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		// 검색 SB select
		let result = await Promise.all([
			 	gfn_setApcItemSBSelect('grdExcelGdsInvntrPopup', 		jsonEPIApcItem, 		gv_selectedApcCd),						// 품목
			 	gfn_setApcVrtySBSelect('grdExcelGdsInvntrPopup', 		jsonEPIApcVrty, 		gv_selectedApcCd, 	itemCd),			// 품종
			 	gfn_setComCdSBSelect('grdExcelGdsInvntrPopup',			jsonEPIWarehouseSeCd, 	'WAREHOUSE_SE_CD', 	gv_selectedApcCd),	// 창고
			 	gfn_setComCdSBSelect('grdExcelGdsInvntrPopup',			jsonEPIGdsSeCd, 		'GDS_SE_CD', 		gv_selectedApcCd),	// 상품구분
			 	gfn_setComCdSBSelect('grdExcelGdsInvntrPopup',			jsonEPIGdsGrd, 			'GDS_GRD'),								// 등급
			 	gfn_setComCdSBSelect('grdExcelGdsInvntrPopup',			jsonEPIWrhsSeCd, 		'WRHS_SE_CD'),							// 입고구분
			 	gfn_setComCdSBSelect('grdExcelGdsInvntrPopup',			jsonEPITrsprtSeCd, 		'TRSPRT_SE_CD'),						// 운송구분
				gfn_setPrdcrSBSelect('grdExcelGdsInvntrPopup', 			jsonEPIApcPrdcr, 	 	gv_selectedApcCd), 						// 생산자 등록
				gfn_setApcSpcfctsSBSelect('grdExcelGdsInvntrPopup',		jsonEPISpcfct, 			gv_selectedApcCd, 	itemCd),			// 규격
				gfn_setSpmtPckgUnitSBSelect('grdExcelGdsInvntrPopup',	jsonEPISpmtPckgUnit, 	gv_selectedApcCd, 	itemCd),			// 포장구분
			]);
		grdExcelGdsInvntrPopup.refresh({"combo":true});
		grdExcelGdsInvntrPopup.rebuild();

		let allData = grdExcelGdsInvntrPopup.getGridDataAll();

		let invntrSeCd = SBUxMethod.get("dtl-slt-invntrSeCd")

		for(var i=1; i<=allData.length; i++){

			let rowData = grdExcelGdsInvntrPopup.getRowData(i, false) // deep copy;

			let itemCd 			= $.trim(rowData.itemCd);
			let vrtyCd 			= $.trim(rowData.vrtyCd);
			let trsprtSeCd 		= $.trim(rowData.trsprtSeCd);
			let wrhsSeCd 		= $.trim(rowData.wrhsSeCd);
			let gdsSeCd 		= $.trim(rowData.gdsSeCd);
			let spcfctCd	 	= $.trim(rowData.spcfctCd);
			let gdsGrd 			= $.trim(rowData.gdsGrd);
			let grdCd 			= $.trim(rowData.grdCd);
			let spmtPckgUnitCd 	= $.trim(rowData.spmtPckgUnitCd);
			let rprsPrdcrCd 	= $.trim(rowData.rprsPrdcrCd);
			let prdcrCd 		= $.trim(rowData.prdcrCd);
			let warehouseSeCd 	= $.trim(rowData.warehouseSeCd);

			if(invntrSeCd == "1"){
				// 운송구분 명 or 코드 일치 검사
				for(var j=0; j<jsonEPITrsprtSeCd.length; j++){
					if(jsonEPITrsprtSeCd[j].text == trsprtSeCd || jsonEPITrsprtSeCd[j].value == trsprtSeCd){
						rowData.trsprtSeCd = jsonEPITrsprtSeCd[j].value;
						break;
					}
				}
				// 생산자 명 or 코드 일치 검사
				for(var j=0; j<jsonEPIApcPrdcr.length; j++){
					if(jsonEPIApcPrdcr[j].prdcrNm == prdcrCd || jsonEPIApcPrdcr[j].prdcrCd == prdcrCd){
						rowData.prdcrCd = jsonEPIApcPrdcr[j].prdcrCd;
						break;
					}
				}
				const grdList = [];
				// 상세등급
				gjsonStdGrdObjKnd.forEach((item, index) => {
					let colNm = gStdGrdObj.colPrfx + item.grdKnd;
					const id = gStdGrdObj.idList[index];
					let jsonObj = gStdGrdObj.getGrdJson(id);

					if (!gfn_isEmpty(rowData[colNm])) {
						let grdInfo = _.find(jsonObj, {grdCd: rowData[colNm]});
						if (gfn_isEmpty(grdInfo)) {
							grdInfo = _.find(jsonObj, {grdNm: rowData[colNm]});
							if (!gfn_isEmpty(grdInfo)) {
								rowData[colNm] = grdInfo.grdCd;
							}
						}
					}

					grdList.push(rowData[colNm]);
				});

				// 판정등급
				if (gjsonStdGrdObjKnd.length > 1 && gjsonStdGrdObjJgmt.length > 0) {

					if (grdList.length > 0) {
						let jgmtGrdCd = stdGrdSelect.getJgmtGrdCd(grdList);
						rowData.jgmtGrdCd = jgmtGrdCd;
					} else {
						if (!gfn_isEmpty(rowData.jgmtGrdCd)) {
							let jgmtGrdInfo = _.find(gjsonStdGrdObjJgmt, {grdCd: rowData.jgmtGrdCd});
							if (gfn_isEmpty(jgmtGrdInfo)) {
								jgmtGrdInfo = _.find(gjsonStdGrdObjJgmt, {grdNm: rowData.jgmtGrdCd});
								if (!gfn_isEmpty(jgmtGrdInfo)) {
									rowData.jgmtGrdCd = jgmtGrdInfo.grdCd;
								}
							}
						}
					}
				}
			}
			if(invntrSeCd == "1" || invntrSeCd == "2"){
				// 입고구분 명 or 코드 일치 검사
				for(var j=0; j<jsonEPIWrhsSeCd.length; j++){
					if(jsonEPIWrhsSeCd[j].text == wrhsSeCd || jsonEPIWrhsSeCd[j].value == wrhsSeCd){
						rowData.wrhsSeCd = jsonEPIWrhsSeCd[j].value;
						break;
					}
				}
				// 상품구분 명 or 코드 일치 검사
				for(var j=0; j<jsonEPIGdsSeCd.length; j++){
					if(jsonEPIGdsSeCd[j].text == gdsSeCd || jsonEPIGdsSeCd[j].value == gdsSeCd){
						rowData.gdsSeCd = jsonEPIGdsSeCd[j].value;
						break;
					}
				}
			}
			// 품목 명 or 코드 일치 검사
			for(var j=0; j<jsonEPIApcItem.length; j++){
				if(jsonEPIApcItem[j].itemCd == itemCd || jsonEPIApcItem[j].itemNm == itemCd){
					rowData.itemCd = jsonEPIApcItem[j].itemCd;
					break;
				}
			}
			// 품종 명 or 코드 일치 검사
			for(var j=0; j<jsonEPIApcVrty.length; j++){
				if(jsonEPIApcVrty[j].itemCd == rowData.itemCd && (jsonEPIApcVrty[j].vrtyNm == vrtyCd || jsonEPIApcVrty[j].vrtyCd == vrtyCd ) ){
					rowData.vrtyCd = jsonEPIApcVrty[j].vrtyCd;
					break;
				}
			}

			if(invntrSeCd == "3" || invntrSeCd == "2"){
				// 규격 명 or 코드 일치 검사
				for(var j=0; j<jsonEPISpcfct.length; j++){
					if(jsonEPISpcfct[j].itemCd == rowData.itemCd && (jsonEPISpcfct[j].spcfctNm == spcfctCd || jsonEPISpcfct[j].spcfctCd == spcfctCd ) ){
						rowData.spcfctCd = jsonEPISpcfct[j].spcfctCd;
						break;
					}
				}
				// 포장구분 명 or 코드 일치 검사
				for(var j=0; j<jsonEPISpmtPckgUnit.length; j++){
					if(jsonEPISpmtPckgUnit[j].itemCd == rowData.itemCd
					&& jsonEPISpmtPckgUnit[j].vrtyCd == rowData.vrtyCd
					&& jsonEPISpmtPckgUnit[j].spcfctCd == rowData.spcfctCd
					&& (jsonEPISpmtPckgUnit[j].spmtPckgUnitNm == spmtPckgUnitCd || jsonEPISpmtPckgUnit[j].spmtPckgUnitCd == spmtPckgUnitCd ) ){
						rowData.spmtPckgUnitCd = jsonEPISpmtPckgUnit[j].spmtPckgUnitCd;
						break;
					}
				}

				if(invntrSeCd == "3"){
					// 등급(공통코드) 명 or 코드 일치 검사 - 상품재고
					for(var j=0; j<jsonEPIGdsGrd.length; j++){
						if(jsonEPIGdsGrd[j].text == gdsGrd || jsonEPIGdsGrd[j].value == gdsGrd){
							rowData.gdsGrd = jsonEPIGdsGrd[j].value;
							break;
						}
					}
				}
				if(invntrSeCd == "2"){
					// 등급(공통코드) 명 or 코드 일치 검사 - 선별재고
					for(var j=0; j<jsonEPIGdsGrd.length; j++){
						if(jsonEPIGdsGrd[j].text == grdCd || jsonEPIGdsGrd[j].value == grdCd){
							rowData.grdCd = jsonEPIGdsGrd[j].value;
							break;
						}
					}
				}
				// 생산자 명 or 코드 일치 검사 (선별, 상품)
				for(var j=0; j<jsonEPIApcPrdcr.length; j++){
					if(jsonEPIApcPrdcr[j].prdcrNm == rprsPrdcrCd || jsonEPIApcPrdcr[j].prdcrCd == rprsPrdcrCd){
						rowData.rprsPrdcrCd = jsonEPIApcPrdcr[j].prdcrCd;
						break;
					}
				}
			}
			// 창고 명 or 코드 일치 검사
			for(var j=0; j<jsonEPIWarehouseSeCd.length; j++){
				if(jsonEPIWarehouseSeCd[j].text == warehouseSeCd || jsonEPIWarehouseSeCd[j].value == warehouseSeCd){
					rowData.warehouseSeCd = jsonEPIWarehouseSeCd[j].value;
					break;
				}
			}
		}

		grdExcelGdsInvntrPopup.rebuild();

	}


	const fn_createGridGdsPopup = async function(){

		var SBGridPropertiesGdsInvntrPopup = {};
		SBGridPropertiesGdsInvntrPopup.parentid = 'sb-area-excelGdsInvntrPopup';
		SBGridPropertiesGdsInvntrPopup.id = 'grdExcelGdsInvntrPopup';
		SBGridPropertiesGdsInvntrPopup.jsonref = 'jsonExcelGdsInvntrPopup';
		SBGridPropertiesGdsInvntrPopup.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesGdsInvntrPopup.selectmode = 'byrow';
		SBGridPropertiesGdsInvntrPopup.extendlastcol = 'scroll';
		SBGridPropertiesGdsInvntrPopup.oneclickedit = true;

		const popupColumns = [];


		let invntrSeCd = SBUxMethod.get("dtl-slt-invntrSeCd")
		if(invntrSeCd == "1"){
			popupColumns.push(
					{caption: ["운송구분"], 		ref: 'trsprtSeCd',   		type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonEPIGdsSeCd', displayui : false,	itemcount: 10, label:'label', value:'value'}},
				);
		}
		if(invntrSeCd == "1" || invntrSeCd == "2"){
			popupColumns.push(
					{caption: ["입고구분"], 		ref: 'wrhsSeCd',   		type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonEPIWrhsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
					{caption: ["상품구분"], 		ref: 'gdsSeCd',   		type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonEPIGdsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				);
		}
		popupColumns.push(
			{caption: ["품목"], 		ref: 'itemCd',   		type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonEPIApcItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["품종"], 		ref: 'vrtyCd',   		type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonEPIApcVrty', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
		);

		if(invntrSeCd == "2" || invntrSeCd == "3"){
			popupColumns.push(
					{caption: ["규격"], 		ref: 'spcfctCd',   		type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonEPISpcfct', displayui : false,	itemcount: 10, label:'label', value:'value'}},
				);
		}

		if(invntrSeCd == "1"){
			const popUpColumnsStdGrd = [];
		    gjsonStdGrdObjKnd.forEach((item, index) => {
				const grd = {
					caption: ["등급:" + item.grdKndNm],
					ref: gStdGrdObj.colPrfx + item.grdKnd,
					type:'combo',
					width:'80px',
					style: 'text-align:center;background-color:#FFF8DC;',
					userattr: {colNm: "stdGrd"},
					typeinfo: {ref: item.jsonId, label:'grdNm', value:'grdCd', displayui : false, oneclickedit: true}
				}
				popUpColumnsStdGrd.push(grd);
			});

		    popUpColumnsStdGrd.forEach((item) => {
		    	popupColumns.push(item);
			});
			popupColumns.push(
					{caption: ["생산자"], 		ref: 'prdcrCd',   	type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonEPIApcPrdcr', 	displayui : false,	itemcount: 10, label:'prdcrNm', value:'prdcrCd'}},
			);

		}
		if(invntrSeCd == "2"){
			popupColumns.push(
					{caption: ["등급"], 		ref: 'grdCd',   	type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonEPIGdsGrd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			);
		}
		if(invntrSeCd == "3"){
			popupColumns.push(
					{caption: ["등급"], 		ref: 'gdsGrd',   	type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonEPIGdsGrd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			);
		}

		if(invntrSeCd == "2" || invntrSeCd == "3"){

			popupColumns.push(
					{caption: ["포장구분"], 	ref: 'spmtPckgUnitCd', 	type:'combo',  width:'150px',    style:'text-align:center',
						typeinfo : {ref:'jsonEPISpmtPckgUnit', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
					{caption: ["생산자"], 		ref: 'rprsPrdcrCd',   	type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonEPIApcPrdcr', 	displayui : false,	itemcount: 10, label:'prdcrNm', value:'prdcrCd'}},
			);
		}

		popupColumns.push(
		        {caption: ["보관창고"],		ref: 'warehouseSeCd',	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEPIWarehouseSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
		        {caption: ["수량"],			ref: 'invntrQntt',      type:'input',  width:'60px',    style:'text-align:right',
		        	format : {type:'number', rule:'#,###'}},
		        {caption: ["중량 Kg"],		ref: 'invntrWght',    	type:'input',  width:'60px',    style:'text-align:right',
			        format : {type:'number', rule:'#,### Kg'}},
		        {caption: ["비고"],			ref: 'rmrk',      		type:'input',  width:'300px',    style:'text-align:center'},
			);
		SBGridPropertiesGdsInvntrPopup.columns = popupColumns;

		grdExcelGdsInvntrPopup = _SBGrid.create(SBGridPropertiesGdsInvntrPopup);
		grdExcelGdsInvntrPopup.bind('valuechanged', 'fn_grdValueChanged');
	    fn_initSBExcelSelectGdsPopup();
	}

	const fn_grdValueChanged = function(){

		let nCol 				= grdExcelGdsInvntrPopup.getCol();
		let nRow 				= grdExcelGdsInvntrPopup.getRow();
		let invntrSeCd 			= SBUxMethod.get("dtl-slt-invntrSeCd")
		let spcfctCdCol	 		= grdExcelGdsInvntrPopup.getColRef("spcfctCd");
		let vrtyCdCol	 		= grdExcelGdsInvntrPopup.getColRef("vrtyCd");
		let spmtPckgUnitCdCol	= grdExcelGdsInvntrPopup.getColRef("spmtPckgUnitCd");

		switch (nCol) {
		case spcfctCdCol:
			fn_checkSpcfct(nRow);
			break;
		case vrtyCdCol:
			fn_checkVrty(nRow);
			break;
		case spmtPckgUnitCdCol:
			fn_checkSpmtPckgUnit(nRow);
			break;
		default:
			return;
		}
	}

	const fn_checkVrty = function(nRow){
		let vrtyCdCol = grdExcelGdsInvntrPopup.getColRef("vrtyCd");
    	let rowData = grdExcelGdsInvntrPopup.getRowData(nRow);
    	let itemCd = rowData.itemCd;
    	let vrtyCd = rowData.vrtyCd;
    	let spmtPckgUnitCd = rowData.spmtPckgUnitCd;
    	let prdcrCd = rowData.prdcrCd;

    	let choiceItemCd = "";
    	if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0005", nRow+"행의 품목") 	// W0005	{0}이/가 없습니다.
    		grdExcelGdsInvntrPopup.setCellData(nRow, vrtyCdCol, "");
			return false;
    	}

   		for(var i=0; i<jsonEPIApcVrty.length; i++){
			let row  = jsonEPIApcVrty[i];
   			if(vrtyCd == row.vrtyCd){
   				choiceItemCd = row.itemCd;
   			}
   		}
   		if(itemCd != choiceItemCd){
   			gfn_comAlert("W0006", nRow+"행의 품목의 품종", "선택한 품종") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelGdsInvntrPopup.setCellData(nRow, vrtyCdCol, "");
   			return false;
   		}

   		if(!gfn_isEmpty(spmtPckgUnitCd)){
   			fn_checkSpmtPckgUnit(nRow)
   		}

   		return true;
	}

	const fn_checkSpcfct = function(nRow){
		let spcfctCdCol = grdExcelGdsInvntrPopup.getColRef("spcfctCd");
    	let rowData = grdExcelGdsInvntrPopup.getRowData(nRow);
    	let itemCd = rowData.itemCd;
    	let spcfctCd = rowData.spcfctCd;
    	let spmtPckgUnitCd = rowData.spmtPckgUnitCd;

    	let choiceItemCd = "";
    	if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0005", nRow+"행의 품목") 	// W0005	{0}이/가 없습니다.
    		grdExcelGdsInvntrPopup.setCellData(nRow, spcfctCdCol, "");
			return false;
    	}

   		for(var i=0; i<jsonEPISpcfct.length; i++){
			let row  = jsonEPISpcfct[i];
   			if(spcfctCd == row.spcfctCd){
   				choiceItemCd = row.itemCd;
   			}
   		}
   		if(itemCd != choiceItemCd){
   			gfn_comAlert("W0006", nRow+"행의 품목의 규격", "선택한 규격") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelGdsInvntrPopup.setCellData(nRow, spcfctCdCol, "");
   			return false;
   		}
   		if(!gfn_isEmpty(spmtPckgUnitCd)){
   			fn_checkSpmtPckgUnit(nRow)
   		}
   		return true;
	}

	const fn_checkSpmtPckgUnit = function(nRow){
		let spmtPckgUnitCdCol = grdExcelGdsInvntrPopup.getColRef("spmtPckgUnitCd");
    	let rowData = grdExcelGdsInvntrPopup.getRowData(nRow);
    	let itemCd = rowData.itemCd;
    	let vrtyCd = rowData.vrtyCd;
    	let spcfctCd = rowData.spcfctCd;
    	let spmtPckgUnitCd = rowData.spmtPckgUnitCd;

    	let choiceItemCd;
    	let choiceVrtyCd;
    	let choiceSpcfctCd;

    	if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0005", nRow+"행의 품목") 	// W0005	{0}이/가 없습니다.
    		grdExcelGdsInvntrPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
			return false;
    	}
    	if(gfn_isEmpty(vrtyCd)){
    		gfn_comAlert("W0005", nRow+"행의 품종") 	// W0005	{0}이/가 없습니다.
    		grdExcelGdsInvntrPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
			return false;
    	}
    	if(gfn_isEmpty(spcfctCd)){
    		gfn_comAlert("W0005", nRow+"행의 규격") 	// W0005	{0}이/가 없습니다.
    		grdExcelGdsInvntrPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
			return false;
    	}

   		for(var i=0; i<jsonEPISpmtPckgUnit.length; i++){
			let row  = jsonEPISpmtPckgUnit[i];
   			if(spmtPckgUnitCd == row.spmtPckgUnitCd){
   				choiceItemCd = row.itemCd;
   				choiceVrtyCd = row.vrtyCd;
   				choiceSpcfctCd = row.spcfctCd;
   			}
   		}
   		if(itemCd != choiceItemCd){
   			gfn_comAlert("W0006", nRow+"행의 품목의 포장구분", "선택한 포장구분") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelGdsInvntrPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
   			return false;
   		}
   		if(vrtyCd != choiceVrtyCd){
   			gfn_comAlert("W0006", nRow+"행의 품종의 포장구분", "선택한 포장구분") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelGdsInvntrPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
   			return false;
   		}
   		if(spcfctCd != choiceSpcfctCd){
   			gfn_comAlert("W0006", nRow+"행의 규격의 포장구분", "선택한 포장구분") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelGdsInvntrPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
   			return false;
   		}

   		return true;
	}

	const fn_saveGdsInvntrPopup = async function(){

		let invntrSeCd = SBUxMethod.get("dtl-slt-invntrSeCd");
		let allData = grdExcelGdsInvntrPopup.getGridDataAll();

		let insertCnt = 0;
		let ymd = gfn_dateToYmd(new Date());
		const insertList = [];

		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdExcelGdsInvntrPopup.getRowData(i);
			const rowSts = grdExcelGdsInvntrPopup.getRowStatus(i);

			const itemCd = rowData.itemCd;
			const vrtyCd = rowData.vrtyCd;
			const spcfctCd = rowData.spcfctCd;
			const gdsGrd = rowData.gdsGrd;
			const grdCd = rowData.grdCd;
			const rprsPrdcrCd = rowData.rprsPrdcrCd;
			const prdcrCd = rowData.prdcrCd;
			const warehouseSeCd	= rowData.warehouseSeCd;
			const invntrQntt = rowData.invntrQntt;
			const invntrWght = rowData.invntrWght;

			const trsprtSeCd = rowData.trsprtSeCd;
			const wrhsSeCd = rowData.wrhsSeCd;
			const gdsSeCd = rowData.gdsSeCd;


			if(rowSts === 0 || rowSts === 1 || rowSts === 2 ){
				if(gfn_comboValidation(jsonEPIApcItem, itemCd) != "Y" || gfn_isEmpty(itemCd)){
					gfn_comAlert("W0005", "품목") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEPIApcVrty, vrtyCd) != "Y" || gfn_isEmpty(vrtyCd)){
					gfn_comAlert("W0005", "품종") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(!fn_checkVrty(i)){
					return;
				}

				if(invntrSeCd == "1"){
					if(gfn_comboValidation(jsonEPIGdsSeCd, trsprtSeCd) != "Y" || gfn_isEmpty(trsprtSeCd)){
						gfn_comAlert("W0005", "운송구분") 	// W0005	{0}이/가 없습니다.
						return;
					}
					if(gfn_comboValidation(jsonEPIApcPrdcr, prdcrCd) != "Y" || gfn_isEmpty(prdcrCd)){
						gfn_comAlert("W0005", "생산자") 	// W0005	{0}이/가 없습니다.
						return;
					}
					gjsonStdGrdObjKnd.forEach((item, index) => {
						let grdCd = item.grdKnd;
						let key = "std__"+grdCd;
						let grdKnd = rowData[key];

						if(gfn_isEmpty(grdKnd)){
							gfn_comAlert("W0005", "등급") 	// W0005	{0}이/가 없습니다.
							return false;
						}
					})

				}
				if(invntrSeCd == "1" || invntrSeCd == "2"){
					if(gfn_comboValidation(jsonEPIWrhsSeCd, wrhsSeCd) != "Y" || gfn_isEmpty(wrhsSeCd)){
						gfn_comAlert("W0005", "입고구분") 	// W0005	{0}이/가 없습니다.
						return;
					}
					if(gfn_comboValidation(jsonEPIGdsSeCd, gdsSeCd) != "Y" || gfn_isEmpty(gdsSeCd)){
						gfn_comAlert("W0005", "상품구분") 	// W0005	{0}이/가 없습니다.
						return;
					}
				}

				if(invntrSeCd == "2"){
					if(gfn_comboValidation(jsonEPIGdsGrd, grdCd) != "Y" || gfn_isEmpty(grdCd)){
						gfn_comAlert("W0005", "등급") 	// W0005	{0}이/가 없습니다.
						return;
					}
				}
				if(invntrSeCd == "3"){
					if(gfn_comboValidation(jsonEPIGdsGrd, gdsGrd) != "Y" || gfn_isEmpty(gdsGrd)){
						gfn_comAlert("W0005", "등급") 	// W0005	{0}이/가 없습니다.
						return;
					}
				}

				if(invntrSeCd == "2" || invntrSeCd == "3"){
					if(gfn_comboValidation(jsonEPISpcfct, spcfctCd) != "Y" || gfn_isEmpty(spcfctCd)){
						gfn_comAlert("W0005", "규격") 	// W0005	{0}이/가 없습니다.
						return;
					}
					if(!fn_checkSpcfct(i)){
						return;
					}
					if(gfn_comboValidation(jsonEPIApcPrdcr, rprsPrdcrCd) != "Y" || gfn_isEmpty(rprsPrdcrCd)){
						gfn_comAlert("W0005", "생산자") 	// W0005	{0}이/가 없습니다.
						return;
					}
					if(!fn_checkSpmtPckgUnit(i)){
						return;
					}

				}

				if(gfn_comboValidation(jsonEPIWarehouseSeCd, warehouseSeCd) != "Y" || gfn_isEmpty(warehouseSeCd)){
					gfn_comAlert("W0005", "보관창고") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(invntrQntt == 0){
					gfn_comAlert("W0005", "수량") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(invntrWght == 0){
					gfn_comAlert("W0005", "수량") 	// W0005	{0}이/가 없습니다.
					return;
				}
				rowData.apcCd = gv_selectedApcCd;
				rowData.rowSts = "I"

				if(invntrSeCd == "1"){
					rowData.wrhsYmd  = ymd;
					rowData.prdctnYr = ymd.substr(0,4);

					let postJsonPromise = gfn_getStdGrdDtls(gv_selectedApcCd, "01", itemCd)
					let data = await postJsonPromise;

					let jgmtGrdVl = 0;
					let stdGrdList = [];
					gjsonStdGrdObjKnd.forEach((item, index) => {
						let grdCd = item.grdKnd;
						let key = "std__"+grdCd;
						let grdKnd = rowData[key];
						data.forEach((item, index) => {
							if(item.grdCd == grdCd){
								if(item.grdKnd == grdKnd){
									jgmtGrdVl += parseInt(item.grdVl);
									stdGrdList.push({
										apcCd : gv_selectedApcCd
									  , grdSeCd : "01"
									  , itemCd : itemCd
									  , grdKnd : grdKnd
									  , grdCd : grdCd
									})
								}
							}
						})
					});

					let jgmtGrdCd = "";
					let jgmtGrdNm = "";

					gjsonStdGrdObjJgmt.forEach((item, index) => {

						let jgmtMinVl = parseInt(item.jgmtMinVl) || 0;
						let jgmtMaxVl = parseInt(item.jgmtMaxVl) || 9999999999;

						switch (item.jgmtType) {
							case _JGMT_TYPE_VAL:	// 값
								if (jgmtGrdVl === jgmtMinVl) {
									jgmtGrdCd = item.grdCd;
									jgmtGrdNm = item.grdNm;
								}
								return false;
							case _JGMT_TYPE_UEL:	// 이상 미만
								if (jgmtGrdVl >= jgmtMinVl && jgmtGrdVl < jgmtMaxVl) {
									jgmtGrdCd = item.grdCd;
									jgmtGrdNm = item.grdNm;
								}
								return false;
							case _JGMT_TYPE_ULE:	// 초과 이하
								if (jgmtGrdVl > jgmtMinVl && jgmtGrdVl <= jgmtMaxVl) {
									jgmtGrdCd = item.grdCd;
									jgmtGrdNm = item.grdNm;
								}
								return false;
							case _JGMT_TYPE_UELE:	// 이상 이하
								if (jgmtGrdVl >= jgmtMinVl && jgmtGrdVl <= jgmtMaxVl) {
									jgmtGrdCd = item.grdCd;
									jgmtGrdNm = item.grdNm;
								}
								return false;
							case _JGMT_TYPE_UL:		// 초과 미만
								if (jgmtGrdVl > jgmtMinVl && jgmtGrdVl < jgmtMaxVl) {
									jgmtGrdCd = item.grdCd;
									jgmtGrdNm = item.grdNm;
								}
								return false;
							default:
								break;
						}
					});
					rowData.stdGrdList = stdGrdList
					rowData.grdCd = jgmtGrdCd;

				}
				if(invntrSeCd == "2"){
					rowData.inptYmd  = ymd;
				}
				if(invntrSeCd == "3"){
					rowData.pckgYmd  = ymd;
				}

				insertList.push(rowData);
			}else{
				continue;
			}
		}

		if (insertList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}else{

    		let postJsonPromise;

			if(invntrSeCd == "1"){
				postJsonPromise = gfn_postJSON("/am/invntr/mulitSaveRawMtrInvntrList.do", insertList);
			}
			if(invntrSeCd == "2"){
				postJsonPromise = gfn_postJSON("/am/invntr/multiSaveSortInvntrList.do", insertList);
			}
			if(invntrSeCd == "3"){
				postJsonPromise = gfn_postJSON("/am/invntr/multiSaveGdsInvntrList.do", insertList);
			}

			const data = await postJsonPromise;

	    	try{
	       		if(data.errMsg == null){
	       			gfn_closeModal('modal-excel-gdsInvntr')
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.

	       		}else{
	       			gfn_comAlert("E0001");					// E0001 오류가 발생하였습니다.
	       		}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
    	}
	}

</script>
</html>