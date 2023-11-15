<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 포장실적등록 엑셀 올리기</title>
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
							<span>실적 등록 내역</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSavePckgPrfmncPopup" name="btnSavePckgPrfmncPopup" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_savePckgPrfmncPopup"></sbux-button>
						<sbux-button id="btnEndPckgPrfmncPopup" name="btnEndPckgPrfmncPopup" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-excel-pckgPrfmnc')"></sbux-button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="sb-area-excelPckgPrfmncPopup" style="height:380px;"></div>
					</div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonEPSApcItem 			= [];	// 품목
	var jsonEPSApcVrty 			= [];	// 품종
	var jsonEPSApcPrdcr 		= [];	// 생산자
	var jsonEPSGdsGrd 			= [];	// 등급(상품)
	var jsonEPSSpcfct 			= [];	// 규격
	var jsonEPSSpmtPckgUnit 	= [];	// 포장구분
	var jsonEPSPckgFclt			= [];	// 포장기
	var jsonEPSWarehouseSeFrom	= [];	// 선별창고
	var jsonEPSWarehouseSeTo	= [];	// 보관창고

	var grdExcelPckgPrfmncPopup;
	var jsonExcelPckgPrfmncPopup =[];

	const fn_initSBExcelSelectPckgPrfmncPopup = async function() {

		// 검색 SB select
		let result = await Promise.all([
			 	gfn_setApcItemSBSelect('grdExcelPckgPrfmncPopup', 		jsonEPSApcItem, 		gv_selectedApcCd),						// 품목
			 	gfn_setApcVrtySBSelect('grdExcelPckgPrfmncPopup', 		jsonEPSApcVrty, 		gv_selectedApcCd),						// 품종
				gfn_setPrdcrSBSelect('grdExcelPckgPrfmncPopup', 		jsonEPSApcPrdcr, 	 	gv_selectedApcCd), 						// 생산자 등록
			 	gfn_setComCdSBSelect('grdExcelPckgPrfmncPopup',			jsonEPSWarehouseSeFrom, 'WAREHOUSE_SE_CD', 	gv_selectedApcCd),	// 선별창고
				gfn_setApcSpcfctsSBSelect('grdExcelPckgPrfmncPopup',	jsonEPSSpcfct, 			gv_selectedApcCd),						// 규격
			 	gfn_setComCdSBSelect('grdExcelPckgPrfmncPopup',			jsonEPSGdsGrd, 			'GDS_GRD'),								// 등급
			 	gfn_setComCdSBSelect('grdExcelPckgPrfmncPopup',			jsonEPSPckgFclt, 		'PCKG_FCLT_CD', 	gv_selectedApcCd),	// 포장기
			 	gfn_setComCdSBSelect('grdExcelPckgPrfmncPopup',			jsonEPSWarehouseSeTo, 	'WAREHOUSE_SE_CD', 	gv_selectedApcCd),	// 보관창고
				gfn_setSpmtPckgUnitSBSelect('grdExcelPckgPrfmncPopup',	jsonEPSSpmtPckgUnit, 	gv_selectedApcCd),						// 포장구분
		]);
		grdExcelPckgPrfmncPopup.refresh({"combo":true});
		grdExcelPckgPrfmncPopup.rebuild();

		console.log("jsonEPSSpcfct",jsonEPSSpcfct);
	}


	const fn_createGridPckgPrfmncPopup = async function(){

		var SBGridPropertiesPckgPrfmncPopup = {};
		SBGridPropertiesPckgPrfmncPopup.parentid = 'sb-area-excelPckgPrfmncPopup';
		SBGridPropertiesPckgPrfmncPopup.id = 'grdExcelPckgPrfmncPopup';
		SBGridPropertiesPckgPrfmncPopup.jsonref = 'jsonExcelPckgPrfmncPopup';
		SBGridPropertiesPckgPrfmncPopup.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesPckgPrfmncPopup.selectmode = 'byrow';
		SBGridPropertiesPckgPrfmncPopup.extendlastcol = 'scroll';
		SBGridPropertiesPckgPrfmncPopup.oneclickedit = true;

		const popupColumns = [
				{caption: ["포장일자"],		ref: 'pckgYmd',      	type:'input',  width:'100px',    style:'text-align:center',
					format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
				{caption: ["품목"], 		ref: 'itemCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSApcItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["품종"], 		ref: 'vrtyCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSApcVrty', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["생산자"], 		ref: 'prdcrCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSApcPrdcr', 	displayui : false,	itemcount: 10, label:'prdcrNm', value:'prdcrCd'}},
				{caption: ["선별창고"],		ref: 'warehouseSeCdFrom',	type:'combo',  width:'120px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSWarehouseSeFrom', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["등급"], 		ref: 'gdsGrd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSGdsGrd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["규격"], 		ref: 'spcfctCd',   		type:'combo',  width:'100px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSSpcfct', displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["포장구분"], 	ref: 'spmtPckgUnitCd', 	type:'combo',  width:'140px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSSpmtPckgUnit', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["포장기"], 		ref: 'pckgFcltCd',   		type:'combo',  width:'100px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSPckgFclt', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["보관창고"],		ref: 'warehouseSeCdTo',	type:'combo',  width:'120px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSWarehouseSeTo', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["수량"],			ref: 'pckgQntt',      	type:'input',  width:'60px',    style:'text-align:right; background:#FFF8DC;',
		        	format : {type:'number', rule:'#,###'}},
		        {caption: ["중량 Kg"],		ref: 'pckgWght',    	type:'input',  width:'80px',    style:'text-align:right; background:#FFF8DC;',
			        format : {type:'number', rule:'#,### Kg'}},
		        {caption: ["비고"],			ref: 'rmrk',      		type:'input',  width:'300px',    style:'text-align:center'},
		];

		SBGridPropertiesPckgPrfmncPopup.columns = popupColumns;

		grdExcelPckgPrfmncPopup = _SBGrid.create(SBGridPropertiesPckgPrfmncPopup);
		grdExcelPckgPrfmncPopup.bind('valuechanged', 'fn_grdValueChanged');
	    fn_initSBExcelSelectPckgPrfmncPopup();
	}

	const fn_grdValueChanged = function(){

		let nCol 				= grdExcelPckgPrfmncPopup.getCol();
		let nRow 				= grdExcelPckgPrfmncPopup.getRow();
		let prdcrCdCol 			= grdExcelPckgPrfmncPopup.getColRef("prdcrCd");
		let spcfctCdCol	 		= grdExcelPckgPrfmncPopup.getColRef("spcfctCd");
		let vrtyCdCol	 		= grdExcelPckgPrfmncPopup.getColRef("vrtyCd");
		let spmtPckgUnitCdCol 	= grdExcelPckgPrfmncPopup.getColRef("spmtPckgUnitCd");
		let pckgQnttCol			= grdExcelPckgPrfmncPopup.getColRef("pckgQntt");

		switch (nCol) {
		case prdcrCdCol:
			fn_checkPrdcr(nRow);
			break;
		case spcfctCdCol:
			fn_checkSpcfct(nRow);
			break;
		case spmtPckgUnitCdCol:
			fn_checkSpmtPckgUnit(nRow);
			break;
		case vrtyCdCol:
			fn_checkVrty(nRow);
			break;
		case pckgQnttCol:
			fn_checkQntt(nRow);
			break;
		default:
			return;
		}
	}

	const fn_checkQntt = function(nRow){

		let spcfctCdCol = grdExcelPckgPrfmncPopup.getColRef("spcfctCd");
		let pckgQnttCol = grdExcelPckgPrfmncPopup.getColRef("pckgQntt");
		let pckgWghtCol = grdExcelPckgPrfmncPopup.getColRef("pckgWght");
    	let rowData = grdExcelPckgPrfmncPopup.getRowData(nRow);
    	let spcfctCd = rowData.spcfctCd;
    	let pckgQntt = rowData.pckgQntt;
    	let pckgWght = rowData.pckgWght;

    	let choiceWght;

   		for(var i=0; i<jsonEPSSpcfct.length; i++){
			let row  = jsonEPSSpcfct[i];
   			if(spcfctCd == row.spcfctCd){
   				choiceWght = row.wght;
   			}
   		}

   		if(pckgQntt > 0){
   			grdExcelPckgPrfmncPopup.setCellData(nRow, pckgWghtCol, parseInt(pckgQntt) * choiceWght);
   		}else {
   			grdExcelPckgPrfmncPopup.setCellData(nRow, pckgQnttCol, 0);
   			grdExcelPckgPrfmncPopup.setCellData(nRow, pckgWghtCol, 0);
   		}

	}

	const fn_checkPrdcr = function(nRow){
		let prdcrCol = grdExcelPckgPrfmncPopup.getColRef("prdcrCd");
    	let rowData = grdExcelPckgPrfmncPopup.getRowData(nRow);
    	let itemCd = rowData.itemCd;
    	let vrtyCd = rowData.vrtyCd;
    	let prdcrCd = rowData.prdcrCd;

    	let choiceItemCd = "";
    	let choiceVrtyCd = "";
    	if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0005", nRow+"행의 품목") 	// W0005	{0}이/가 없습니다.
    		grdExcelPckgPrfmncPopup.setCellData(nRow, prdcrCol, "");
			return false;
    	}
    	if(gfn_isEmpty(vrtyCd)){
    		gfn_comAlert("W0005", nRow+"행의 품종") 	// W0005	{0}이/가 없습니다.
    		grdExcelPckgPrfmncPopup.setCellData(nRow, prdcrCol, "");
			return false;
    	}

   		for(var i=0; i<jsonEPSApcPrdcr.length; i++){
			let row  = jsonEPSApcPrdcr[i];
   			if(prdcrCd == row.prdcrCd){
   				choiceItemCd = row.rprsItemCd;
   				choiceVrtyCd = row.rprsVrtyCd;
   			}
   		}
   		if(itemCd != choiceItemCd){
   			gfn_comAlert("W0006", nRow+"행의 선택한 품목", "선택한 생산자의 품목") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelPckgPrfmncPopup.setCellData(nRow, prdcrCol, "");
   			return false;
   		}
   		if(vrtyCd != choiceVrtyCd){
   			gfn_comAlert("W0006", nRow+"행의 선택한 품종", "선택한 생산자의 품종") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelPckgPrfmncPopup.setCellData(nRow, prdcrCol, "");
   			return false;
   		}

   		return true;

	}
	const fn_checkVrty = function(nRow){
		let vrtyCdCol = grdExcelPckgPrfmncPopup.getColRef("vrtyCd");
    	let rowData = grdExcelPckgPrfmncPopup.getRowData(nRow);
    	let itemCd = rowData.itemCd;
    	let vrtyCd = rowData.vrtyCd;

    	let choiceItemCd = "";
    	if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0005", nRow+"행의 품목") 	// W0005	{0}이/가 없습니다.
    		grdExcelPckgPrfmncPopup.setCellData(nRow, vrtyCdCol, "");
			return false;
    	}

   		for(var i=0; i<jsonEPSApcVrty.length; i++){
			let row  = jsonEPSApcVrty[i];
   			if(vrtyCd == row.vrtyCd){
   				choiceItemCd = row.itemCd;
   			}
   		}
   		if(itemCd != choiceItemCd){
   			gfn_comAlert("W0006", nRow+"행의 품목의 품종", "선택한 품종") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelPckgPrfmncPopup.setCellData(nRow, vrtyCdCol, "");
   			return false;
   		}

   		return true;
	}
	const fn_checkSpcfct = function(nRow){
		let spcfctCdCol = grdExcelPckgPrfmncPopup.getColRef("spcfctCd");
    	let rowData = grdExcelPckgPrfmncPopup.getRowData(nRow);
    	let itemCd = rowData.itemCd;
    	let spcfctCd = rowData.spcfctCd;

    	let choiceItemCd = "";
    	if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0005", nRow+"행의 품목") 	// W0005	{0}이/가 없습니다.
    		grdExcelPckgPrfmncPopup.setCellData(nRow, spcfctCdCol, "");
			return false;
    	}

   		for(var i=0; i<jsonEPSSpcfct.length; i++){
			let row  = jsonEPSSpcfct[i];
   			if(spcfctCd == row.spcfctCd){
   				choiceItemCd = row.itemCd;
   			}
   		}
   		if(itemCd != choiceItemCd){
   			gfn_comAlert("W0006", nRow+"행의 품목의 규격", "선택한 규격") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelPckgPrfmncPopup.setCellData(nRow, spcfctCdCol, "");
   			return false;
   		}

   		return true;
	}
	const fn_checkSpmtPckgUnit = function(nRow){

		let spmtPckgUnitCdCol = grdExcelPckgPrfmncPopup.getColRef("spmtPckgUnitCd");
    	let rowData = grdExcelPckgPrfmncPopup.getRowData(nRow);
    	let itemCd = rowData.itemCd;
    	let vrtyCd = rowData.vrtyCd;
    	let spcfctCd = rowData.spcfctCd;
    	let spmtPckgUnitCd = rowData.spmtPckgUnitCd;

    	let choiceItemCd;
    	let choiceVrtyCd;
    	let choiceSpcfctCd;

    	if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0005", nRow+"행의 품목") 	// W0005	{0}이/가 없습니다.
    		grdExcelPckgPrfmncPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
			return false;
    	}
    	if(gfn_isEmpty(vrtyCd)){
    		gfn_comAlert("W0005", nRow+"행의 품종") 	// W0005	{0}이/가 없습니다.
    		grdExcelPckgPrfmncPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
			return false;
    	}
    	if(gfn_isEmpty(spcfctCd)){
    		gfn_comAlert("W0005", nRow+"행의 규격") 	// W0005	{0}이/가 없습니다.
    		grdExcelPckgPrfmncPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
			return false;
    	}

   		for(var i=0; i<jsonEPSSpmtPckgUnit.length; i++){
			let row  = jsonEPSSpmtPckgUnit[i];
   			if(spmtPckgUnitCd == row.spmtPckgUnitCd){
   				choiceItemCd = row.itemCd;
   				choiceVrtyCd = row.vrtyCd;
   				choiceSpcfctCd = row.spcfctCd;
   			}
   		}
   		if(itemCd != choiceItemCd){
   			gfn_comAlert("W0006", nRow+"행의 품목의 포장구분", "선택한 포장구분") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelPckgPrfmncPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
   			return false;
   		}
   		if(vrtyCd != choiceVrtyCd){
   			gfn_comAlert("W0006", nRow+"행의 품종의 포장구분", "선택한 포장구분") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelPckgPrfmncPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
   			return false;
   		}
   		if(spcfctCd != choiceSpcfctCd){
   			gfn_comAlert("W0006", nRow+"행의 규격의 포장구분", "선택한 포장구분") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelPckgPrfmncPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
   			return false;
   		}

   		return true;

	}

	const fn_savePckgPrfmncPopup = async function(){

		let allData = grdExcelPckgPrfmncPopup.getGridDataAll();

		let insertCnt = 0;
		const insertList = [];

		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdExcelPckgPrfmncPopup.getRowData(i);
			const rowSts = grdExcelPckgPrfmncPopup.getRowStatus(i);

			const pckgYmd 			= rowData.pckgYmd;				// 포장날자
			const itemCd 			= rowData.itemCd;				// 품목
			const vrtyCd 			= rowData.vrtyCd;				// 품종
			const prdcrCd 			= rowData.prdcrCd;				// 생산자
			const warehouseSeCdFrom = rowData.warehouseSeCdFrom		// 선별창고
			const spcfctCd 			= rowData.spcfctCd;				// 규격
			const gdsGrd 			= rowData.gdsGrd;				// 등급
			const spmtPckgUnitCd 	= rowData.spmtPckgUnitCd;		// 포장단위
			const pckgFcltCd 		= rowData.pckgFcltCd;			// 포장기
			const warehouseSeCdTo 	= rowData.warehouseSeCdTo		// 보관창고
			const pckgQntt 			= rowData.pckgQntt;				// 수량
			const pckgWght 			= rowData.pckgWght;				// 중량

			if(rowSts === 0 || rowSts === 1 || rowSts === 2 ){
				if(gfn_comboValidation(jsonEPSApcItem, itemCd) != "Y" || gfn_isEmpty(itemCd)){
					gfn_comAlert("W0005", "품목") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEPSApcVrty, vrtyCd) != "Y" || gfn_isEmpty(vrtyCd)){
					gfn_comAlert("W0005", "품종") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(!fn_checkVrty(i)){
					return;
				}
				if(gfn_comboValidation(jsonEPSApcPrdcr, prdcrCd) != "Y" || gfn_isEmpty(prdcrCd)){
					gfn_comAlert("W0005", "생산자") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(!fn_checkPrdcr(i)){
					return;
				}
				if(gfn_comboValidation(jsonEPSWarehouseSeFrom, warehouseSeCdFrom) != "Y" || gfn_isEmpty(warehouseSeCdFrom)){
					gfn_comAlert("W0005", "선별창고") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEPSSpcfct, spcfctCd) != "Y" || gfn_isEmpty(spcfctCd)){
					gfn_comAlert("W0005", "규격") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(!fn_checkSpcfct(i)){
					return;
				}
				if(gfn_comboValidation(jsonEPSGdsGrd, gdsGrd) != "Y" || gfn_isEmpty(gdsGrd)){
					gfn_comAlert("W0005", "등급") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEPSSpmtPckgUnit, spmtPckgUnitCd) != "Y" || gfn_isEmpty(spmtPckgUnitCd)){
					gfn_comAlert("W0005", "포장구분") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(!fn_checkSpmtPckgUnit(i)){
					return;
				}
				if(gfn_comboValidation(jsonEPSPckgFclt, pckgFcltCd) != "Y" || gfn_isEmpty(pckgFcltCd)){
					gfn_comAlert("W0005", "포장기") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEPSWarehouseSeTo, warehouseSeCdTo) != "Y" || gfn_isEmpty(warehouseSeCdTo)){
					gfn_comAlert("W0005", "보관창고") 	// W0005	{0}이/가 없습니다.
					return;
				}

				if(pckgQntt == 0){
					gfn_comAlert("W0005", "수량") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(pckgWght == 0){
					gfn_comAlert("W0005", "중량") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_isEmpty(pckgYmd)){
					rowData.pckgYmd = gfn_dateToYmd(new Date());
				}
				rowData.apcCd = gv_selectedApcCd;
				rowData.rowSts = "I"
				rowData.excelYn = "Y"
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

    		const postJsonPromise = gfn_postJSON("", insertList);

			const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	    			gfn_closeModal('modal-excel-pckgPrfmnc')
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	        	} else {
	        		alert(data.resultMessage);
	        	}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
    	}
	}

</script>
</html>