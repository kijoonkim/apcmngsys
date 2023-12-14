<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 출하실적등록 엑셀 올리기</title>
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
						<sbux-button id="btnSaveGdsInvntrPopup" name="btnSaveGdsInvntrPopup" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveSpmtPrfmncPopup"></sbux-button>
						<sbux-button id="btnEndGdsInvntrPopup" name="btnEndGdsInvntrPopup" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-excel-spmtPrfmnc')"></sbux-button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="sb-area-excelSpmtPrfmncPopup" style="height:380px;"></div>
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

	var jsonEPSGdsSeCd			= [];	// 상품구분
	var jsonEPSCnpt				= [];	// 거래처
	var jsonEPSTrsprtCoCd		= [];	// 운송사

	var grdExcelSpmtPrfmncPopup;
	var jsonExcelSpmtPrfmncPopup =[];

	const fn_initSBExcelSelectSpmtPrfmncPopup = async function() {

		let itemCd = SBUxMethod.get("srch-slt-itemCd");

		// 검색 SB select
		let result = await Promise.all([
			 	gfn_setComCdSBSelect('grdExcelSpmtPrfmncPopup',			jsonEPSGdsSeCd, 		'GDS_SE_CD', 		gv_selectedApcCd),	// 상품구분
			 	gfn_setApcItemSBSelect('grdExcelSpmtPrfmncPopup', 		jsonEPSApcItem, 		gv_selectedApcCd),						// 품목
			 	gfn_setApcVrtySBSelect('grdExcelSpmtPrfmncPopup', 		jsonEPSApcVrty, 		gv_selectedApcCd, itemCd),				// 품종
				gfn_setApcSpcfctsSBSelect('grdExcelSpmtPrfmncPopup',	jsonEPSSpcfct, 			gv_selectedApcCd, itemCd),				// 규격
			 	gfn_setApcGdsGrdSBSelect('grdExcelSpmtPrfmncPopup', 	jsonEPSGdsGrd, 			gv_selectedApcCd, itemCd, '03'),		// 등급
				gfn_setPrdcrSBSelect('grdExcelSpmtPrfmncPopup', 		jsonEPSApcPrdcr, 	 	gv_selectedApcCd), 						// 생산자 등록
				gfn_setSpmtPckgUnitSBSelect('grdExcelSpmtPrfmncPopup',	jsonEPSSpmtPckgUnit, 	gv_selectedApcCd, itemCd),				// 포장구분
				gfn_setCpntSBSelect('grdExcelSpmtPrfmncPopup', 			jsonEPSCnpt, 			gv_selectedApcCd),						// 거래처
				gfn_setTrsprtsSBSelect('grdExcelSpmtPrfmncPopup', 		jsonEPSTrsprtCoCd, 		gv_selectedApcCd),						// 운송사
		]);
		grdExcelSpmtPrfmncPopup.refresh({"combo":true});

		let allData = grdExcelSpmtPrfmncPopup.getGridDataAll();

		const today = gfn_dateToYmd(new Date());

		for(var i=1; i<=allData.length; i++){

			let rowData = grdExcelSpmtPrfmncPopup.getRowData(i, false) // deep copy;

			let spmtYmd 		= $.trim(rowData.spmtYmd);

			let itemCd 			= $.trim(rowData.itemCd);
			let vrtyCd 			= $.trim(rowData.vrtyCd);
			let spcfctCd	 	= $.trim(rowData.spcfctCd);
			let gdsSeCd	 		= $.trim(rowData.gdsSeCd);
			let gdsGrd 			= $.trim(rowData.gdsGrd);
			let spmtPckgUnitCd 	= $.trim(rowData.spmtPckgUnitCd);
			let prdcrCd 		= $.trim(rowData.prdcrCd);
			let warehouseSeCd 	= $.trim(rowData.warehouseSeCd);
			let trsprtCoCd 		= $.trim(rowData.trsprtCoCd);
			let cnptCd 			= $.trim(rowData.cnptCd);


			/* if(!gfn_isEmpty(spmtYmd)){
				if((/^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/.exec(spmtYmd))){
					rowData.spmtYmd = "";
	    		}
			} */

			if (gfn_isEmpty(spmtYmd)) {
				spmtYmd = today;
 			} else {
				if (typeof spmtYmd === "string") {
					let len = spmtYmd.length;
					switch (len) {
						case 5:
							let jsDate = gfn_excelSerialDateToJSDate(parseInt(spmtYmd));
							spmtYmd = gfn_dateToYmd(jsDate);
							break;
						case 8:
							spmtYmd = spmtYmd.toString();
							break;
						default:
							spmtYmd = today;
							break;
					}
				} else {
					spmtYmd = today;
				}
			}

			rowData.spmtYmd = spmtYmd;

			// 상품구분 명 or 코드 일치 검사
			for(var j=0; j<jsonEPSGdsSeCd.length; j++){
				if(jsonEPSGdsSeCd[j].text == gdsSeCd || jsonEPSGdsSeCd[j].value == gdsSeCd){
					rowData.gdsSeCd = jsonEPSGdsSeCd[j].value;
					break;
				}
			}

			// 품목 명 or 코드 일치 검사
			for(var j=0; j<jsonEPSApcItem.length; j++){
				if(jsonEPSApcItem[j].itemCd == itemCd || jsonEPSApcItem[j].itemNm == itemCd){
					rowData.itemCd = jsonEPSApcItem[j].itemCd;
					break;
				}
			}
			// 품종 명 or 코드 일치 검사
			for(var j=0; j<jsonEPSApcVrty.length; j++){
				if(jsonEPSApcVrty[j].itemCd == rowData.itemCd && (jsonEPSApcVrty[j].vrtyNm == vrtyCd || jsonEPSApcVrty[j].vrtyCd == vrtyCd ) ){
					rowData.vrtyCd = jsonEPSApcVrty[j].vrtyCd;
					break;
				}
			}

			// 규격 명 or 코드 일치 검사
			for(var j=0; j<jsonEPSSpcfct.length; j++){
				if(jsonEPSSpcfct[j].itemCd == rowData.itemCd && (jsonEPSSpcfct[j].spcfctNm == spcfctCd || jsonEPSSpcfct[j].spcfctCd == spcfctCd ) ){
					rowData.spcfctCd = jsonEPSSpcfct[j].spcfctCd;
					break;
				}
			}
			// 포장구분 명 or 코드 일치 검사
			for(var j=0; j<jsonEPSSpmtPckgUnit.length; j++){
				if(jsonEPSSpmtPckgUnit[j].itemCd == rowData.itemCd
				&& jsonEPSSpmtPckgUnit[j].vrtyCd == rowData.vrtyCd
				&& jsonEPSSpmtPckgUnit[j].spcfctCd == rowData.spcfctCd
				&& (jsonEPSSpmtPckgUnit[j].spmtPckgUnitNm == spmtPckgUnitCd || jsonEPSSpmtPckgUnit[j].spmtPckgUnitCd == spmtPckgUnitCd ) ){
					rowData.spmtPckgUnitCd = jsonEPSSpmtPckgUnit[j].spmtPckgUnitCd;
					break;
				}
			}
			// 등급(공통코드) 명 or 코드 일치 검사 - 상품재고
			for(var j=0; j<jsonEPSGdsGrd.length; j++){
				if(jsonEPSGdsGrd[j].text == gdsGrd || jsonEPSGdsGrd[j].value == gdsGrd){
					rowData.gdsGrd = jsonEPSGdsGrd[j].value;
					break;
				}
			}
			// 생산자 명 or 코드 일치 검사 (선별, 상품)
			for(var j=0; j<jsonEPSApcPrdcr.length; j++){
				if(jsonEPSApcPrdcr[j].prdcrNm == prdcrCd || jsonEPSApcPrdcr[j].prdcrCd == prdcrCd ){
					rowData.prdcrCd = jsonEPSApcPrdcr[j].prdcrCd;
					break;
				}
			}

			// 운송사 명 or 코드 일치 검사 (선별, 상품)
			for(var j=0; j<jsonEPSTrsprtCoCd.length; j++){
				if(jsonEPSTrsprtCoCd[j].trsprtCoNm == trsprtCoCd || jsonEPSTrsprtCoCd[j].trsprtCoCd == trsprtCoCd){
					rowData.trsprtCoCd = jsonEPSTrsprtCoCd[j].trsprtCoCd;
					break;
				}
			}

			// 거래처 명 or 코드 일치 검사 (선별, 상품)
			for(var j=0; j<jsonEPSCnpt.length; j++){
				if(jsonEPSCnpt[j].cnptNm == cnptCd || jsonEPSCnpt[j].cnptCd == cnptCd){
					rowData.cnptCd = jsonEPSCnpt[j].cnptCd;
					break;
				}
			}
		}

		grdExcelSpmtPrfmncPopup.rebuild();
	}


	const fn_createGridSpmtPrfmncPopup = async function(){

		var SBGridPropertiesSpmtPrfmncPopup = {};
		SBGridPropertiesSpmtPrfmncPopup.parentid = 'sb-area-excelSpmtPrfmncPopup';
		SBGridPropertiesSpmtPrfmncPopup.id = 'grdExcelSpmtPrfmncPopup';
		SBGridPropertiesSpmtPrfmncPopup.jsonref = 'jsonExcelSpmtPrfmncPopup';
		SBGridPropertiesSpmtPrfmncPopup.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesSpmtPrfmncPopup.selectmode = 'byrow';
		SBGridPropertiesSpmtPrfmncPopup.extendlastcol = 'scroll';
		SBGridPropertiesSpmtPrfmncPopup.oneclickedit = true;

		const popupColumns = [
				{caption: ["출하일자"],		ref: 'spmtYmd',      	width: '100px', type : 'datepicker', style:'text-align:center',
					format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}},
				{caption: ["상품구분"], 		ref: 'gdsSeCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSGdsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["품목"], 		ref: 'itemCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSApcItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["품종"], 		ref: 'vrtyCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSApcVrty', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["규격"], 		ref: 'spcfctCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSSpcfct', displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["등급"], 		ref: 'gdsGrd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSGdsGrd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["상품명"], 	ref: 'spmtPckgUnitCd', 	type:'combo',  width:'150px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSSpmtPckgUnit', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["생산자"], 		ref: 'prdcrCd',   		type:'combo',  width:'80px',    style:'text-align:center;',
					typeinfo : {ref:'jsonEPSApcPrdcr', 	displayui : false,	itemcount: 10, label:'prdcrNm', value:'prdcrCd'}},
				{caption: ["거래처"], 		ref: 'cnptCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
					typeinfo : {ref:'jsonEPSCnpt', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["운송사"], 		ref: 'trsprtCoCd',   	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEPSTrsprtCoCd', displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["차량번호"],		ref: 'vhclno',      	type:'input',  width:'100px',    style:'text-align:right'},
				{caption: ["배송처"],		ref: 'dldtn',      		type:'input',  width:'100px',    style:'text-align:right'},
				{caption: ["운송비용 (원)"],	ref: 'trsprtCst',      	type:'input',  width:'100px',    style:'text-align:right',
		        	format : {type:'number', rule:'#,###'}},
				{caption: ["수량"],			ref: 'spmtQntt',      	type:'input',  width:'60px',    style:'text-align:right; background:#FFF8DC;',
		        	format : {type:'number', rule:'#,###'}},
		        {caption: ["중량 (Kg)"],		ref: 'spmtWght',    	type:'input',  width:'80px',    style:'text-align:right; background:#FFF8DC;',
			        format : {type:'number', rule:'#,###'}},
		        {caption: ["비고"],			ref: 'rmrk',      		type:'input',  width:'300px',    style:'text-align:center'},
		];

		SBGridPropertiesSpmtPrfmncPopup.columns = popupColumns;

		grdExcelSpmtPrfmncPopup = _SBGrid.create(SBGridPropertiesSpmtPrfmncPopup);
		grdExcelSpmtPrfmncPopup.bind('valuechanged', 'fn_grdValueChanged');
	    fn_initSBExcelSelectSpmtPrfmncPopup();
	}


	const fn_grdValueChanged = function(){

		let nCol = grdExcelSpmtPrfmncPopup.getCol();
		let nRow = grdExcelSpmtPrfmncPopup.getRow();
		let vrtyCdCol = grdExcelSpmtPrfmncPopup.getColRef("vrtyCd");
		let spcfctCdCol = grdExcelSpmtPrfmncPopup.getColRef("spcfctCd");
		let spmtPckgUnitCdCol = grdExcelSpmtPrfmncPopup.getColRef("spmtPckgUnitCd");

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
		let vrtyCdCol = grdExcelSpmtPrfmncPopup.getColRef("vrtyCd");
    	let rowData = grdExcelSpmtPrfmncPopup.getRowData(nRow);
    	let itemCd = rowData.itemCd;
    	let vrtyCd = rowData.vrtyCd;

    	let choiceItemCd = "";
    	if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0005", nRow+"행의 품목") 	// W0005	{0}이/가 없습니다.
    		grdExcelSpmtPrfmncPopup.setCellData(nRow, vrtyCdCol, "");
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
   			grdExcelSpmtPrfmncPopup.setCellData(nRow, vrtyCdCol, "");
   			return false;
   		}

   		return true;
	}
	const fn_checkSpcfct = function(nRow){
		let spcfctCdCol = grdExcelSpmtPrfmncPopup.getColRef("spcfctCd");
    	let rowData = grdExcelSpmtPrfmncPopup.getRowData(nRow);
    	let itemCd = rowData.itemCd;
    	let spcfctCd = rowData.spcfctCd;
    	let spmtPckgUnitCd = rowData.spmtPckgUnitCd;

    	let choiceItemCd = "";
    	if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0005", nRow+"행의 품목") 	// W0005	{0}이/가 없습니다.
    		grdExcelSpmtPrfmncPopup.setCellData(nRow, spcfctCdCol, "");
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
   			grdExcelSpmtPrfmncPopup.setCellData(nRow, spcfctCdCol, "");
   			return false;
   		}
   		if(!gfn_isEmpty(spmtPckgUnitCd)){
   			fn_checkSpmtPckgUnit(nRow)
   		}
   		return true;


	}
	const fn_checkSpmtPckgUnit = function(nRow){

		let spmtPckgUnitCdCol = grdExcelSpmtPrfmncPopup.getColRef("spmtPckgUnitCd");
    	let rowData = grdExcelSpmtPrfmncPopup.getRowData(nRow);
    	let itemCd = rowData.itemCd;
    	let vrtyCd = rowData.vrtyCd;
    	let spcfctCd = rowData.spcfctCd;
    	let spmtPckgUnitCd = rowData.spmtPckgUnitCd;

    	let choiceItemCd;
    	let choiceVrtyCd;
    	let choiceSpcfctCd;

    	if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0005", nRow+"행의 품목") 	// W0005	{0}이/가 없습니다.
    		grdExcelSpmtPrfmncPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
			return false;
    	}
    	if(gfn_isEmpty(vrtyCd)){
    		gfn_comAlert("W0005", nRow+"행의 품종") 	// W0005	{0}이/가 없습니다.
    		grdExcelSpmtPrfmncPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
			return false;
    	}
    	if(gfn_isEmpty(spcfctCd)){
    		gfn_comAlert("W0005", nRow+"행의 규격") 	// W0005	{0}이/가 없습니다.
    		grdExcelSpmtPrfmncPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
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
   			gfn_comAlert("W0006", nRow+"행의 품목의 상품명", "선택한 상품명") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelSpmtPrfmncPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
   			return false;
   		}
   		if(vrtyCd != choiceVrtyCd){
   			gfn_comAlert("W0006", nRow+"행의 품종의 상품명", "선택한 상품명") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelSpmtPrfmncPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
   			return false;
   		}
   		if(spcfctCd != choiceSpcfctCd){
   			gfn_comAlert("W0006", nRow+"행의 규격의 상품명", "선택한 상품명") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdExcelSpmtPrfmncPopup.setCellData(nRow, spmtPckgUnitCdCol, "");
   			return false;
   		}

   		return true;

	}

	const fn_saveSpmtPrfmncPopup = async function(){

		let allData = grdExcelSpmtPrfmncPopup.getGridDataAll();

		let insertCnt = 0;
		let insertList = [];

		for ( let i=1; i<=allData.length; i++ ){
			let rowData = grdExcelSpmtPrfmncPopup.getRowData(i, false);
			let rowSts = grdExcelSpmtPrfmncPopup.getRowStatus(i);

			let spmtYmd 		= rowData.spmtYmd;			// 출하일자
			let gdsSeCd 		= rowData.gdsSeCd;			// 상품구분
			let itemCd 			= rowData.itemCd;			// 품목
			let vrtyCd	 		= rowData.vrtyCd;			// 품종
			let spcfctCd 		= rowData.spcfctCd;			// 규격
			let gdsGrd 			= rowData.gdsGrd;			// 등급
			let spmtPckgUnitCd 	= rowData.spmtPckgUnitCd;	// 포장단위
			let prdcrCd 		= rowData.prdcrCd;			// 생산자
			let cnptCd 			= rowData.cnptCd;			// 거래처
			let vhclno 			= rowData.vhclno;			// 거래처
			let spmtQntt 		= rowData.spmtQntt;			// 수량
			let spmtWght 		= rowData.spmtWght;			// 중량

			if(rowSts === 0 || rowSts === 1 || rowSts === 2 ){

				if(gfn_comboValidation(jsonEPSGdsSeCd, gdsSeCd) != "Y" || gfn_isEmpty(gdsSeCd)){
					gfn_comAlert("W0005", "상품구분") 	// W0005	{0}이/가 없습니다.
					return;
				}
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
					gfn_comAlert("W0005", "상품명") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(!fn_checkSpmtPckgUnit(i)){
					return;
				}
				if(gfn_comboValidation(jsonEPSApcPrdcr, prdcrCd) != "Y" || gfn_isEmpty(prdcrCd)){
					rowData.prdcrCd = "";
				}
				if(gfn_comboValidation(jsonEPSCnpt, cnptCd) != "Y" || gfn_isEmpty(cnptCd)){
					gfn_comAlert("W0005", "거래처") 	// W0005	{0}이/가 없습니다.
					return;
				}

				if(!gfn_isEmpty(vhclno)){
					if(!(/^\d{2,3}[가-힣]\d{4}/.exec(vhclno))){
			    		gfn_comAlert("W0011", "차량번호");			//	W0001	{0}이/가 아닙니다.
		    			return;
		    		}
				}

				if(spmtQntt == 0){
					gfn_comAlert("W0005", "수량") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(spmtWght == 0){
					gfn_comAlert("W0005", "중량") 	// W0005	{0}이/가 없습니다.
					return;
				}

				if(gfn_isEmpty(spmtYmd)){
					rowData.spmtYmd = gfn_dateToYmd(new Date());
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

    		const postJsonPromise = gfn_postJSON("/am/spmt/insertSpmtPrfmncList.do", insertList);

			const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	    			gfn_closeModal('modal-excel-spmtPrfmnc')
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
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