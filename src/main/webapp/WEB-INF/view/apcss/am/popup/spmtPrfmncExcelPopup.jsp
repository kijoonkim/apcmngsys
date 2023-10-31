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
			 	gfn_setApcVrtySBSelect('grdExcelSpmtPrfmncPopup', 		jsonEPSApcVrty, 		gv_selectedApcCd, 	itemCd),			// 품종
				gfn_setApcSpcfctsSBSelect('grdExcelSpmtPrfmncPopup',	jsonEPSSpcfct, 			gv_selectedApcCd, 	itemCd),			// 규격
			 	gfn_setComCdSBSelect('grdExcelSpmtPrfmncPopup',			jsonEPSGdsGrd, 			'GDS_GRD'),								// 등급
				gfn_setPrdcrSBSelect('grdExcelSpmtPrfmncPopup', 		jsonEPSApcPrdcr, 	 	gv_selectedApcCd), 						// 생산자 등록
				gfn_setSpmtPckgUnitSBSelect('grdExcelSpmtPrfmncPopup',	jsonEPSSpmtPckgUnit, 	gv_selectedApcCd, 	itemCd),			// 포장구분
				gfn_setCpntSBSelect('grdExcelSpmtPrfmncPopup', 			jsonEPSCnpt, 			gv_selectedApcCd),						// 거래처
				gfn_setTrsprtsSBSelect('grdExcelSpmtPrfmncPopup', 		jsonEPSTrsprtCoCd, 		gv_selectedApcCd),						// 운송사
		]);
		console.log("jsonEPSCnpt", jsonEPSCnpt);
		console.log("jsonEPSTrsprtCoCd", jsonEPSTrsprtCoCd);
		grdExcelSpmtPrfmncPopup.refresh({"combo":true});
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
				{caption: ["상품구분"], 		ref: 'gdsSeCd',   		type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEPSGdsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["품목"], 		ref: 'itemCd',   		type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEPSApcItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["품종"], 		ref: 'vrtyCd',   		type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEPSApcVrty', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["규격"], 		ref: 'spcfctCd',   		type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEPSSpcfct', displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["등급"], 		ref: 'gdsGrd',   		type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEPSGdsGrd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["포장구분"], 	ref: 'spmtPckgUnitCd', 	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEPSSpmtPckgUnit', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["생산자"], 		ref: 'prdcrCd',   		type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEPSApcPrdcr', 	displayui : false,	itemcount: 10, label:'prdcrNm', value:'prdcrCd'}},
				{caption: ["거래처"], 		ref: 'cnptCd',   		type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEPSCnpt', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["운송사"], 		ref: 'trsprtCoCd',   	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonEPSTrsprtCoCd', displayui : false,	itemcount: 10, label:'label', value:'value'}},
				{caption: ["차량번호"],		ref: 'vhclno',      	type:'input',  width:'100px',    style:'text-align:right'},
				{caption: ["배송처"],		ref: 'dldtn',      		type:'input',  width:'100px',    style:'text-align:right'},
				{caption: ["운송비용"],		ref: 'trsprtCst',      	type:'input',  width:'100px',    style:'text-align:right',
		        	format : {type:'number', rule:'#,### 원'}},
				{caption: ["수량"],			ref: 'spmtQntt',      	type:'input',  width:'60px',    style:'text-align:right',
		        	format : {type:'number', rule:'#,###'}},
		        {caption: ["중량 Kg"],		ref: 'spmtWght',    	type:'input',  width:'80px',    style:'text-align:right',
			        format : {type:'number', rule:'#,### Kg'}},
		        {caption: ["비고"],			ref: 'rmrk',      		type:'input',  width:'300px',    style:'text-align:center'},
		];

		SBGridPropertiesSpmtPrfmncPopup.columns = popupColumns;

		grdExcelSpmtPrfmncPopup = _SBGrid.create(SBGridPropertiesSpmtPrfmncPopup);
	    fn_initSBExcelSelectSpmtPrfmncPopup();
	}

	const fn_saveSpmtPrfmncPopup = async function(){

		let allData = grdExcelSpmtPrfmncPopup.getGridDataAll();

		let insertCnt = 0;
		const insertList = [];

		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdExcelSpmtPrfmncPopup.getRowData(i);
			const rowSts = grdExcelSpmtPrfmncPopup.getRowStatus(i);

			const gdsSeCd = rowData.gdsSeCd;				// 상품구분
			const itemCd = rowData.itemCd;					// 품목
			const vrtyCd = rowData.vrtyCd;					// 품종
			const spcfctCd = rowData.spcfctCd;				// 규격
			const gdsGrd = rowData.gdsGrd;					// 등급
			const spmtPckgUnitCd = rowData.spmtPckgUnitCd;	// 포장단위
			const prdcrCd = rowData.prdcrCd;				// 생산자
			const cnptCd = rowData.cnptCd;					// 거래처
			const spmtQntt = rowData.spmtQntt;				// 수량
			const spmtWght = rowData.spmtWght;				// 중량

			if(rowSts === 0 || rowSts === 1 || rowSts === 2 ){
				if(gfn_comboValidation(jsonEPSGdsSeCd, gdsSeCd) != "Y" || gfn_isEmpty(gdsSeCd)){
					gfn_comAlert("W0005", "상품구분") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEPSApcItem, itemCd) != "Y" || gfn_isEmpty(itemCd)){
					gfn_comAlert("W0005", "품목") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEPIApcVrty, vrtyCd) != "Y" || gfn_isEmpty(vrtyCd)){
					gfn_comAlert("W0005", "품종") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEPSSpcfct, spcfctCd) != "Y" || gfn_isEmpty(spcfctCd)){
					gfn_comAlert("W0005", "규격") 	// W0005	{0}이/가 없습니다.
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
				if(gfn_comboValidation(jsonEPSApcPrdcr, prdcrCd) != "Y" || gfn_isEmpty(prdcrCd)){
					gfn_comAlert("W0005", "생산자") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(gfn_comboValidation(jsonEPSCnpt, cnptCd) != "Y" || gfn_isEmpty(cnptCd)){
					gfn_comAlert("W0005", "거래처") 	// W0005	{0}이/가 없습니다.
					return;
				}


				if(spmtQntt == 0){
					gfn_comAlert("W0005", "수량") 	// W0005	{0}이/가 없습니다.
					return;
				}
				if(spmtWght == 0){
					gfn_comAlert("W0005", "수량") 	// W0005	{0}이/가 없습니다.
					return;
				}
				rowData.apcCd = gv_selectedApcCd;
				rowData.rowSts = "I"
				rowData.spmtYmd = gfn_dateToYmd(new Date());
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