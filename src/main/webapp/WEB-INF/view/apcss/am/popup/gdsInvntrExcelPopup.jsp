<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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

	var jsonEGIApcItem = [];
	var jsonEGIApcVrty = [];
	var jsonEGIApcPrdcr = [];
	var jsonEGIWarehouseSeCd = [];
	var jsonEGIGdsGrd = [];
	var jsonEGISpcfct = [];
	var jsonEGISpmtPckgUnit = [];

	var grdExcelGdsInvntrPopup;
	var jsonExcelGdsInvntrPopup =[];

	const fn_initSBExcelSelectGdsPopup = async function() {

		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		// 검색 SB select
		let result = await Promise.all([
			 	gfn_setApcItemSBSelect('grdExcelGdsInvntrPopup', 		jsonEGIApcItem, 		gv_selectedApcCd),				// 품목
			 	gfn_setApcVrtySBSelect('grdExcelGdsInvntrPopup', 		jsonEGIApcVrty, 		gv_selectedApcCd, itemCd),		// 품종
			 	gfn_setComCdSBSelect('grdExcelGdsInvntrPopup',			jsonEGIWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			 	gfn_setComCdSBSelect('grdExcelGdsInvntrPopup',			jsonEGIGdsGrd, 			'GDS_GRD'),						// 등급
				gfn_setPrdcrSBSelect('grdExcelGdsInvntrPopup', 			jsonEGIApcPrdcr, 	 	gv_selectedApcCd), 				// 생산자 등록
				gfn_setApcSpcfctsSBSelect('grdExcelGdsInvntrPopup',		jsonEGISpcfct, 			gv_selectedApcCd, itemCd),		// 규격
				gfn_setSpmtPckgUnitSBSelect('grdExcelGdsInvntrPopup',	jsonEGISpmtPckgUnit, 	gv_selectedApcCd, itemCd),		// 포장구분
			]);
		console.log("jsonEGIGdsGrd", jsonEGIGdsGrd)
		grdExcelGdsInvntrPopup.refresh({"combo":true});
	}


	const fn_createGridGdsPopup = async function(){

		var SBGridPropertiesGdsInvntrPopup = {};
		SBGridPropertiesGdsInvntrPopup.parentid = 'sb-area-excelGdsInvntrPopup';
		SBGridPropertiesGdsInvntrPopup.id = 'grdExcelGdsInvntrPopup';
		SBGridPropertiesGdsInvntrPopup.jsonref = 'jsonExcelGdsInvntropup';
		SBGridPropertiesGdsInvntrPopup.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesGdsInvntrPopup.selectmode = 'byrow';
		SBGridPropertiesGdsInvntrPopup.extendlastcol = 'scroll';
		SBGridPropertiesGdsInvntrPopup.oneclickedit = true;
		SBGridPropertiesGdsInvntrPopup.columns = [
			{caption: ["품목"], 		ref: 'itemCd',   	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEGIApcItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["품종"], 		ref: 'vrtyCd',   	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEGIApcVrty', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["규격"], 		ref: 'spcfctCd',   	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEGISpcfct', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["등급"], 		ref: 'gdsGrd',   	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEGIGdsGrd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["포장구분"], 	ref: 'spmtPckgUnitCd', 	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEGISpmtPckgUnit', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["생산자"], 		ref: 'prdcrCd',   	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEGIApcPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["보관창고"],		ref: 'warehouseSeCd',	type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonEGIWarehouseSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["수량"],			ref: 'invntrQntt',      type:'input',  width:'60px',    style:'text-align:right'},
	        {caption: ["중량 Kg"],		ref: 'invntrWght',    type:'input',  width:'60px',    style:'text-align:right'},
	        {caption: ["비고"],			ref: 'rmrk',      	type:'input',  width:'100px',    style:'text-align:left'},

	    ];

		grdExcelGdsInvntrPopup = _SBGrid.create(SBGridPropertiesGdsInvntrPopup);
		grdExcelGdsInvntrPopup.addRow(true);
	    fn_initSBExcelSelectGdsPopup();
	}

	const fn_saveGdsInvntrPopup = async function(){
		let allData = grdExcelGdsInvntrPopup.getGridDataAll();

		let insertCnt = 0;
		const insertList = [];

		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdExcelGdsInvntrPopup.getRowData(i);
			const rowSts = grdExcelGdsInvntrPopup.getRowStatus(i);

			const itemCd = rowData.itemCd;
			const vrtyCd = rowData.vrtyCd;
			const spcfctCd = rowData.spcfctCd;
			const gdsGrd = rowData.gdsGrd;
			const prdcrCd = rowData.prdcrCd;
			const warehouseSeCd	= rowData.warehouseSeCd;
			const invntrQntt = rowData.invntrQntt;
			const invntrWght = rowData.invntrWght;

			if(rowSts === 0 || rowSts === 1 || rowSts === 2 ){
				if(gfn_comboValidation(jsonEGIApcItem, itemCd) != "Y" || gfn_isEmpty(itemCd)){
					gfn_comAlert("W0005", "품목") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEGIApcVrty, vrtyCd) != "Y" || gfn_isEmpty(vrtyCd)){
					gfn_comAlert("W0005", "품종") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEGISpcfct, spcfctCd) != "Y" || gfn_isEmpty(spcfctCd)){
					gfn_comAlert("W0005", "규격") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEGIGdsGrd, gdsGrd) != "Y" || gfn_isEmpty(gdsGrd)){
					gfn_comAlert("W0005", "등급") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEGIApcPrdcr, prdcrCd) != "Y" || gfn_isEmpty(prdcrCd)){
					gfn_comAlert("W0005", "생산자") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEGIWarehouseSeCd, warehouseSeCd) != "Y" || gfn_isEmpty(warehouseSeCd)){
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
				rowData.pckgYmd = gfn_dateToYmd(new Date());

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

    	}
	}


</script>
</html>