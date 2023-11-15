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
							<span>원물입고 내역</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSaveRawMtrWrhsPopup" name="btnSaveRawMtrWrhsPopup" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveRawMtrWrhsPopup"></sbux-button>
						<sbux-button id="btnEndRawMtrWrhsPopup" name="btnEndRawMtrWrhsPopup" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-excel')"></sbux-button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="sb-area-excelRawMtrWrhsPopup" style="height:380px;"></div>
					</div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonEGPApcItem = [];
	var jsonEGPApcVrty = [];
	var jsonEGPApcPrdcr = [];
	var jsonEGPWrhsSeCd = [];
	var jsonEGPGdsSeCd = [];
	var jsonEGPTrsprtSeCd = [];
	var jsonEGPWarehouseSeCd = [];
	var jsonEGPPltBxCd = [];

	var grdExcelRawMtrWrhsPopup;
	var jsonExcelRawMtrWrhsPopup =[];

	const fn_initSBExcelSelectPopup = async function() {
		// 검색 SB select
		let result = await Promise.all([
			 	gfn_setPltBxSBSelect('grdExcelRawMtrWrhsPopup', 	jsonEGPPltBxCd, 	gv_selectedApcCd, 'B'),	// 박스
			 	gfn_setApcItemSBSelect('grdExcelRawMtrWrhsPopup', 	jsonEGPApcItem, 	gv_selectedApcCd),		// 품목
			 	gfn_setApcVrtySBSelect('grdExcelRawMtrWrhsPopup', 	jsonEGPApcVrty, 	gv_selectedApcCd),		// 품종
			 	gfn_setComCdSBSelect('grdExcelRawMtrWrhsPopup',		jsonEGPWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			 	gfn_setComCdSBSelect('grdExcelRawMtrWrhsPopup', 	jsonEGPWrhsSeCd, 		'WRHS_SE_CD'), 		// 입고구분
				gfn_setComCdSBSelect('grdExcelRawMtrWrhsPopup', 	jsonEGPGdsSeCd, 			'GDS_SE_CD', gv_selectedApcCd), 		// 상품구분
				gfn_setComCdSBSelect('grdExcelRawMtrWrhsPopup', 	jsonEGPTrsprtSeCd, 		'TRSPRT_SE_CD'), 	// 운송구분
				gfn_setPrdcrSBSelect('grdExcelRawMtrWrhsPopup', 	jsonEGPApcPrdcr,  gv_selectedApcCd), 	// 생산자 등록
			]);
		grdExcelRawMtrWrhsPopup.refresh({"combo":true});
	}


	const fn_createGridPopup = async function(){

		var SBGridPropertiesRawMtrWrhsPopup = {};
		SBGridPropertiesRawMtrWrhsPopup.parentid = 'sb-area-excelRawMtrWrhsPopup';
		SBGridPropertiesRawMtrWrhsPopup.id = 'grdExcelRawMtrWrhsPopup';
		SBGridPropertiesRawMtrWrhsPopup.jsonref = 'jsonExcelRawMtrWrhsPopup';
		SBGridPropertiesRawMtrWrhsPopup.emptyrecords = '데이터가 없습니다.';
		SBGridPropertiesRawMtrWrhsPopup.selectmode = 'byrow';
		SBGridPropertiesRawMtrWrhsPopup.extendlastcol = 'scroll';
		SBGridPropertiesRawMtrWrhsPopup.oneclickedit = true;
		SBGridPropertiesRawMtrWrhsPopup.columns = [
			{caption: ["입고일자"],		ref: 'wrhsYmd',      type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["품목"], 	ref: 'itemCd',   	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEGPApcItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["품종"], 	ref: 'vrtyCd',   	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEGPApcVrty', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["생산자"], 	ref: 'prdcrCd',   	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEGPApcPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["입고구분"], 	ref: 'wrhsSeCd',   	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEGPWrhsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["상품구분"], 	ref: 'gdsSeCd',   	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEGPGdsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["운송구분"], 	ref: 'trsprtSeCd',   	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEGPTrsprtSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["보관창고"],		ref: 'warehouseSeCd',	type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonEGPWarehouseSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["박스"],		ref: 'pltBxCd',	type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonEGPPltBxCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["생산연도"],		ref: 'prdctnYr',    	type:'input',  width:'80px',    style:'text-align:center'},
	        {caption: ["등급"],			ref: 'stdGrd',    	type:'input',  width:'80px',    style:'text-align:left'},
	        {caption: ["상세"],			ref: 'stdGrdDtl',    	type:'input',  width:'80px',    style:'text-align:left'},
	        {caption: ["차량번호"],		ref: 'vhclno',      type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["박스수량"],		ref: 'bxQntt',      type:'input',  width:'60px',    style:'text-align:right'},
	        {caption: ["중량 Kg"],	ref: 'wrhsWght',    type:'input',  width:'60px',    style:'text-align:right'},
	        {caption: ["비고"],		ref: 'rmrk',      	type:'input',  width:'100px',    style:'text-align:left'},

	    ];

		grdExcelRawMtrWrhsPopup = _SBGrid.create(SBGridPropertiesRawMtrWrhsPopup);
		grdExcelRawMtrWrhsPopup.addRow(true);
	    fn_initSBExcelSelectPopup();
	}

	const fn_saveRawMtrWrhsPopup = async function(){
		let allData = grdExcelRawMtrWrhsPopup.getGridDataAll();

		let insertCnt = 0;
		const insertList = [];

		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdExcelRawMtrWrhsPopup.getRowData(i);
			const rowSts = grdExcelRawMtrWrhsPopup.getRowStatus(i);

			const itemCd = rowData.itemCd;
			const vrtyCd = rowData.vrtyCd;
			const prdcrCd = rowData.prdcrCd;
			const wrhsSeCd = rowData.wrhsSeCd;
			const gdsSeCd = rowData.gdsSeCd;
			const trsprtSeCd = rowData.trsprtSeCd;

			if(rowSts === 0 || rowSts === 1 || rowSts === 2 ){
				if(gfn_comboValidation(jsonEGPApcItem, itemCd) != "Y" || gfn_isEmpty(itemCd)){
					gfn_comAlert("W0005", "품목") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEGPApcVrty, vrtyCd) != "Y" || gfn_isEmpty(vrtyCd)){
					gfn_comAlert("W0005", "품종") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEGPApcPrdcr, prdcrCd) != "Y" || gfn_isEmpty(prdcrCd)){
					gfn_comAlert("W0005", "생산자") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEGPWrhsSeCd, wrhsSeCd) != "Y" || gfn_isEmpty(wrhsSeCd)){
					gfn_comAlert("W0005", "입고구분") 	// W0005	{0}이/가 없습니다.
					return;
				}

				if(gfn_comboValidation(jsonEGPGdsSeCd, gdsSeCd) != "Y" || gfn_isEmpty(gdsSeCd)){
					gfn_comAlert("W0005", "상품구분") 	// W0005	{0}이/가 없습니다.
					return;
				}

				if(gfn_comboValidation(jsonEGPTrsprtSeCd, trsprtSeCd) != "Y" || gfn_isEmpty(trsprtSeCd)){
					gfn_comAlert("W0005", "운송구분") 	// W0005	{0}이/가 없습니다.
					return;
				}

				rowData.apcCd = gv_selectedApcCd;
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
    	}

		console.log(insertList);

    	/* const postJsonPromise = gfn_postJSON("/am/wrhs/insertRawMtrWrhsPlanList.do", insertList);

		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_setGrdWrhsPlan();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
        */
	}


</script>
</html>