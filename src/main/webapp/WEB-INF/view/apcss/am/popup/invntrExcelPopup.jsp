<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : SBUx2.6</title>
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
					{caption: ["포장구분"], 	ref: 'spmtPckgUnitCd', 	type:'combo',  width:'80px',    style:'text-align:center',
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
	    fn_initSBExcelSelectGdsPopup();
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
					if(gfn_comboValidation(jsonEPIApcPrdcr, rprsPrdcrCd) != "Y" || gfn_isEmpty(rprsPrdcrCd)){
						gfn_comAlert("W0005", "생산자") 	// W0005	{0}이/가 없습니다.
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