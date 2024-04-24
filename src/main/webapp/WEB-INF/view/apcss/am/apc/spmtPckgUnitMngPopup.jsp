<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 상품 등록</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">상품출하시 운용하고 있는 상품코드 정보를 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">출하처리 시 필요한 정보입니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchSpmtPckgUnit" name="btnSearchSpmtPckgUnit" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectSpmtPckgUnit"></sbux-button>
					<sbux-button id="btnSaveSpmtPckgUnit" name="btnSaveSpmtPckgUnit" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveSpmtPckgUnit"></sbux-button>
					<sbux-button id="btnEndSpmtPckgUnit" name="btnEndSpmtPckgUnit" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-spmtPckgUnit')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<div>
					<!--[pp] 검색 -->
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 100px">
							<col style="width: 200px">
							<col style="width: 100px">
							<col style="width: 200px">
							<col style="width: 100px">
							<col style="width: 200px">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">APC명</th>
								<th>
									<sbux-input id="spmtPckgUnit-inp-apcNm" name="spmtPckgUnit-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row"><span class="data_required"></span>품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-select id="spmtPckgUnit-slt-itemCd"
									name="spmtPckgUnit-slt-itemCd"
									style="background-color:#ffffff;"
									uitype="single"
									jsondata-ref="jsonSPUItemCd"
									unselected-text="선택"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_selectItemSpmtPckgUnit"></sbux-select>
								</th>
								<th></th>
								<th></th>
							</tr>
						</tbody>
					</table>

				</div>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<b>&nbsp;</b>

				<div class="row">
					<div class="ad_tbl_top"  style="width: 98%;">
						<ul class="ad_tbl_count">
							<li><span>상품코드</span></li>
						</ul>
					</div>
					<div>
						<div id="sb-area-grdSpmtPckgUnit" style="height:223px; width: 100%;"></div>
					</div>
				</div>

			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
	<sbux-button id="btnSpmtSlsUntprcReg" name="btnSpmtSlsUntprcReg" uitype="modal" text="거래처 등록" style="width:100%; display:none" class="btn btn-sm btn-outline-dark" target-id="modal-spmtSlsUntprcReg" onclick="fn_modal('btnSpmtSlsUntprcReg')"></sbux-button>
</body>
<script type="text/javascript">

	var jsonSpmtPckgUnit = [];
	var jsonSPUItemCd = [];
	var jsonSPUGrdItemCd = [];
	var jsonSPUGrdVrtyCd = [];
	var jsonSPUGrdSpcfctCd = [];
	var jsonSPUGdsGrd = [];

	const fn_initSBSelectSpmtPckgUnit = async function() {

		let rst = await Promise.all([
			gfn_setApcItemSBSelect("spmtPckgUnit-slt-itemCd", 	jsonSPUItemCd, 		gv_apcCd), 	// APC 품목(검색)
			gfn_setApcItemSBSelect("grdSpmtPckgUnit", 			jsonSPUGrdItemCd, 	gv_apcCd),	// APC 품목(저장)
			//gfn_setComCdSBSelect("grdSpmtPckgUnit", 			jsonSPUGdsGrd, 		"GDS_GRD"),	// 상품등급(출하)
		]);
		jsonSpmtPckgUnit.length = 0;
		grdSpmtPckgUnit.refresh({"combo":true});
	}

	const fn_selectItemSpmtPckgUnit = async function(){
		let itemCd = SBUxMethod.get("spmtPckgUnit-slt-itemCd");
		let rst = await Promise.all([
			gfn_setApcVrtySBSelect("grdSpmtPckgUnit", 			jsonSPUGrdVrtyCd, 	gv_apcCd, itemCd),	// APC 품종(저장)
			gfn_setApcSpcfctsSBSelect("grdSpmtPckgUnit", 		jsonSPUGrdSpcfctCd, gv_apcCd, itemCd),	// APC 규격(저장)
			fn_selectSpmtPckgUnit(),
			gStdGrdObj.init(gv_apcCd, _GRD_SE_CD_SORT, itemCd)
		])
		grdSpmtPckgUnit.refresh({"combo":true});
	}

	const fn_modalClick = async function (nRow){
		SBUxMethod.openModal('modal-spmtSlsUntprcReg');

		let rowData = grdSpmtPckgUnit.getRowData(nRow);
		SBUxMethod.set("spmtSlsUntprcReg-inp-apcNm", SBUxMethod.get("inp-apcNm"));
		SBUxMethod.set("spmtSlsUntprcReg-inp-spmtPckgUnitNm", rowData.spmtPckgUnitNm);
		SBUxMethod.set("spmtSlsUntprcReg-inp-spmtPckgUnitCd", rowData.spmtPckgUnitCd);
		SBUxMethod.set("spmtSlsUntprcReg-inp-itemNm", rowData.itemNm);
		SBUxMethod.set("spmtSlsUntprcReg-hin-itemCd", rowData.itemCd);
		SBUxMethod.set("spmtSlsUntprcReg-inp-vrtyNm", rowData.vrtyNm);
		SBUxMethod.set("spmtSlsUntprcReg-hin-vrtyCd", rowData.vrtyCd);
		SBUxMethod.set("spmtSlsUntprcReg-inp-spcfctNm", rowData.spcfctNm);
		SBUxMethod.set("spmtSlsUntprcReg-hin-spcfctCd", rowData.spcfctCd);

		fn_createSpmtSlsUntprcRegGrid();
		fn_selectSpmtSlsUntprcRegList(rowData);
	}


	const fn_createSpmtPckgUnitGrid = async function() {
		jsonSpmtPckgUnit = [];
		SBUxMethod.set("spmtPckgUnit-inp-apcNm", SBUxMethod.get("inp-apcNm"));
   		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtPckgUnit';
	    SBGridProperties.id = 'grdSpmtPckgUnit';
	    SBGridProperties.jsonref = 'jsonSpmtPckgUnit';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdSmptPckgUnit\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdSmptPckgUnit\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["품목"], 			ref: 'itemCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonSPUGrdItemCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["품종"], 			ref: 'vrtyCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonSPUGrdVrtyCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["규격"], 			ref: 'spcfctCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonSPUGrdSpcfctCd', 	displayui : false, 	itemcount: 10, label:'label', value:'value'}},
 	        {
				caption: ["선별등급"],
				ref: 'gdsGrd',
				type:'combo',
				width:'80px',
				style:'text-align:center',
 				typeinfo : {
 					ref:'gjsonStdGrdObj_1',
 					displayui : false,
 					itemcount: 10,
 					label:'grdNm',
 					value:'grdCd'
 				}
			},
	        {caption: ["상품 명"], 			ref: 'spmtPckgUnitNm',  type:'input',  width:'160px',    style:'text-align:center',
				typeinfo : {maxlength : 30}},
			{caption: ["설비연계"], ref: 'extrnlLnkgCd',  	type:'input',  width:'80px',    style:'text-align:center'},
	        {caption: ["브랜드 명"], ref: 'brndNm',  	type:'input',  width:'140px',    style:'text-align:center', typeinfo : {maxlength : 33}},
	        {caption: ["원산지 코드"], ref: 'plorCd',  	type:'outputbutton',  width:'220px',    style:'text-align:center',
	        	typeinfo : {callback: fn_grdChoicePlor}
	        },
	        {caption: ["판매단가"],     	ref: 'ntslUntprc',  type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### 원'}},
	        {caption: ["변경"], 		ref: 'delYn',  type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if((grdSpmtPckgUnit.getRowStatus(nRow) == 0 || grdSpmtPckgUnit.getRowStatus(nRow) == 2) && !(strValue== null || strValue == "")){
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_modalClick(" + nRow + ")'>단가</button>";
	        	}else{
	        		return ;
	        	}
		    }},
	        {caption: ["출하포장단위코드"], ref: 'spmtPckgUnitCd',	type:'input',  hidden : true},
	        {caption: ["APC코드"], 			ref: 'apcCd',   		type:'input',  hidden : true},
	        {caption: ["품목명"], 			ref: 'itemNm',   		type:'input',  hidden : true},
	        {caption: ["품종명"], 			ref: 'vrtyNm',   		type:'input',  hidden : true},
	        {caption: ["규격명"], 			ref: 'spcfctNm',   		type:'input',  hidden : true},
	        {caption: ["등급명"], 			ref: 'gdsGrdNm',   		type:'input',  hidden : true},
	        {caption: ["추가여부"], 		ref: 'addRow',   		type:'input',  hidden : true},
	    ];
	    grdSpmtPckgUnit = _SBGrid.create(SBGridProperties);
	    grdSpmtPckgUnit.bind('valuechanged', 'fn_grdValueChanged');
	    await fn_initSBSelectSpmtPckgUnit();
	}

	const fn_grdValueChanged = function(){

		let nCol 				= grdSpmtPckgUnit.getCol();
		let nRow 				= grdSpmtPckgUnit.getRow();
		let spcfctCdCol	 		= grdSpmtPckgUnit.getColRef("spcfctCd");
		let vrtyCdCol	 		= grdSpmtPckgUnit.getColRef("vrtyCd");

		switch (nCol) {
		case spcfctCdCol:
			fn_checkSpcfct(nRow);
			break;
		case vrtyCdCol:
			fn_checkVrty(nRow);
			break;
		default:
			return;
		}
	}

	const fn_checkVrty = function(nRow){
		let vrtyCdCol = grdSpmtPckgUnit.getColRef("vrtyCd");
    	let rowData = grdSpmtPckgUnit.getRowData(nRow);
    	let itemCd = rowData.itemCd;
    	let vrtyCd = rowData.vrtyCd;

    	let choiceItemCd = "";
    	if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0005", nRow+"행의 품목") 	// W0005	{0}이/가 없습니다.
    		grdSpmtPckgUnit.setCellData(nRow, vrtyCdCol, "");
			return false;
    	}

   		for(var i=0; i<jsonSPUGrdVrtyCd.length; i++){
			let row  = jsonSPUGrdVrtyCd[i];
   			if(vrtyCd == row.vrtyCd){
   				choiceItemCd = row.itemCd;
   			}
   		}
   		if(itemCd != choiceItemCd){
   			gfn_comAlert("W0006", nRow+"행의 품목의 품종", "선택한 품종") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdSpmtPckgUnit.setCellData(nRow, vrtyCdCol, "");
   			return false;
   		}

   		return true;
	}
	const fn_checkSpcfct = function(nRow){
		let spcfctCdCol = grdSpmtPckgUnit.getColRef("spcfctCd");
    	let rowData = grdSpmtPckgUnit.getRowData(nRow);
    	let itemCd = rowData.itemCd;
    	let spcfctCd = rowData.spcfctCd;

    	let choiceItemCd = "";
    	if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0005", nRow+"행의 품목") 	// W0005	{0}이/가 없습니다.
    		grdSpmtPckgUnit.setCellData(nRow, spcfctCdCol, "");
			return false;
    	}

   		for(var i=0; i<jsonSPUGrdSpcfctCd.length; i++){
			let row  = jsonSPUGrdSpcfctCd[i];
   			if(spcfctCd == row.spcfctCd){
   				choiceItemCd = row.itemCd;
   			}
   		}
   		if(itemCd != choiceItemCd){
   			gfn_comAlert("W0006", nRow+"행의 품목의 규격", "선택한 규격") 	// W0006	{0}와/과 {1}이/가 서로 다릅니다.
   			grdSpmtPckgUnit.setCellData(nRow, spcfctCdCol, "");
   			return false;
   		}

   		return true;
	}

	const fn_selectSpmtPckgUnit = async function(){
		let apcCd = gv_apcCd;
		let itemCd = SBUxMethod.get("spmtPckgUnit-slt-itemCd");
		if(gfn_isEmpty(itemCd)){
			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		let postJsonPromise = gfn_postJSON("/am/cmns/selectSpmtPckgUnitList.do", {apcCd : apcCd, itemCd : itemCd});
	    let data = await postJsonPromise;
	    try{
  			if (_.isEqual("S", data.resultStatus)) {
  		    	jsonSpmtPckgUnit.length = 0;
  		    	data.resultList.forEach((item, index) => {
  					let spmtPckgUnitVO = {
  						itemCd 			: item.itemCd
  					  , vrtyCd 			: item.vrtyCd
  					  , spcfctCd		: item.spcfctCd
  					  , spmtPckgUnitNm	: item.spmtPckgUnitNm
  					  , ntslUntprc		: item.ntslUntprc
  					  , brndNm			: item.brndNm
  					  , delYn			: item.delYn
  					  , apcCd			: item.apcCd
  					  , spmtPckgUnitCd	: item.spmtPckgUnitCd
  					  , itemNm			: item.itemNm
  					  , vrtyNm			: item.vrtyNm
  					  , spcfctNm		: item.spcfctNm
  					  , gdsGrd			: item.gdsGrd
  					  , gdsGrdNm		: item.gdsGrdNm
					  , extrnlLnkgCd	: item.extrnlLnkgCd
					  , plorCd			: item.plorCd
					  , addRow			: "N"
  					}
  					jsonSpmtPckgUnit.push(spmtPckgUnitVO);
  				});
  		    	grdSpmtPckgUnit.rebuild();
  		    	grdSpmtPckgUnit.addRow(true);
  		    	grdSpmtPckgUnit.setCellDisabled(grdSpmtPckgUnit.getRows() -1, 0, grdSpmtPckgUnit.getRows() -1, grdSpmtPckgUnit.getCols() -1, true);

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	const fn_saveSpmtPckgUnit = async function(){

		let saveList = [];
		let gridData = grdSpmtPckgUnit.getGridDataAll();

		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdSpmtPckgUnit.getRowData(i);
			let rowSts = grdSpmtPckgUnit.getRowStatus(i);
			let delYn = rowData.delYn;
			let itemCd = rowData.itemCd;
			let vrtyCd = rowData.vrtyCd;
			let spcfctCd = rowData.spcfctCd;
			let spmtPckgUnitNm = rowData.spmtPckgUnitNm;
			let gdsGrd = rowData.gdsGrd;
			let ntslUntprc = rowData.ntslUntprc;
			let brndNm  = rowData.brndNm;
			if(delYn == 'N'){
				if (gfn_isEmpty(itemCd)) {
		  			gfn_comAlert("W0001", "품목");		//	W0001	{0}을/를 선택하세요.
		            return;
		  		}
				if (gfn_isEmpty(vrtyCd)) {
		  			gfn_comAlert("W0001", "품종");		//	W0001	{0}을/를 선택하세요.
		            return;
		  		}
				if (gfn_isEmpty(spcfctCd)) {
		  			gfn_comAlert("W0001", "품종");		//	W0001	{0}을/를 선택하세요.
		            return;
		  		}
				if (gfn_isEmpty(spmtPckgUnitNm)) {
		  			gfn_comAlert("W0002", "상품명");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}
				if (gfn_isEmpty(ntslUntprc)) {
		  			gfn_comAlert("W0002", "단가");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}
				if (rowSts === 3){
					rowData.rowSts = "I";
					saveList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					saveList.push(rowData);
				} else {
					continue;
				}
			}
		}

		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		if(gfn_comConfirm("Q0001", "저장")){

			let postJsonPromise = gfn_postJSON("/am/cmns/multiSaveSpmtPckgUnitList.do", saveList);
	        let data = await postJsonPromise;

	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_selectSpmtPckgUnit();
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
	        	}
	        } catch(e) {
	        	console.error("failed", e.message);
	        }

		}
	}

	const fn_deleteSpmtPckgUnit = async function(spmtPckgUnitVO, nRow){
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteSpmtPckgUnit.do", spmtPckgUnitVO);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
        		grdSpmtPckgUnit.deleteRow(nRow);
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch(e) {
        	console.error("failed", e.message);
        }
	}
	
	const fn_grdChoicePlor = async function(){
		SBUxMethod.openModal('modal-plor');

		await fn_plorStdMngCreateGrid();
		await fn_selectAllPlor();
	}
	
	const fn_callbackFncPlor = async function(rowData){
		let nRow = grdSpmtPckgUnit.getRow();
		let nRowData = grdSpmtPckgUnit.getRowData(nRow);
		let plorCd = rowData.cdVl;
		grdSpmtPckgUnit.setCellData(nRow, 8, plorCd);
		if(nRowData.addRow=="Y"){
			grdSpmtPckgUnit.setRowStatus(nRow, 1);
		}else{
			grdSpmtPckgUnit.setRowStatus(nRow, 2);
		}
	}


</script>
</html>