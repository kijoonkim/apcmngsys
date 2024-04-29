<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 등급 등록</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">선택한 품목별로 APC에서 관리하는 육안선별등급을 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">품목별 육안선별등급을 관리할 수 있습니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearcBffaGrd" name="btnSearchBffaGrd" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectBffaGrd"></sbux-button>
					<sbux-button id="btnSaveBffaGrd" name="btnSaveBffaGrd" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveBffaGrd"></sbux-button>
					<sbux-button id="btnEndBffaGrd" name="btnEndBffaGrd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-bffaSortReg')"></sbux-button>
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
							<col style="width: 250px">
							<col style="width: 100px">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">APC명</th>
								<th>
									<sbux-input id="grd-inp-apcNm" name="grd-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row"><span class="data_required"></span>품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-select id="grd-slt-BitemCd" name="grd-slt-BitemCd" style="background-color:#ffffff;"  uitype="single"
									jsondata-ref="jsonGItemCd"
									onchange="fn_searchBffaGrd"
									unselected-text="선택" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-select>
								</th>
								
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
							</tr>
							

						</tbody>
					</table>

				</div>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="row">
					<div class="col-sm-4">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>등급유형</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdBffaGrdType" style="height:158px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li>
									<span>등급종류</span>
									<sbux-label id="idxLabel_grdType" name="idxLabel_grdType" uitype="normal" style="color:black"></sbux-label>
								</li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdBffaGrdKnd" style="height:158px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li>
									<span>등급</span>
									<sbux-label id="idxLabel_grdDtl" name="idxLabel_grdDtl" uitype="normal"  style="color:black"></sbux-label>
								</li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdBffaGrdDtl" style="height:158px; width: 100%;"></div>
						</div>
					</div>
					<sbux-input id="inpt-bbfa-grd-type" name="inpt-bbfa-grd-type" uitype="hidden" ></sbux-input>
				</div>
				

			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">
	var grdBffaGrdType;
	var grdBffaGrdKnd;
	var grdBffaGrdDtl;
	
	var jsonGItemCd 	= [];
	
	
	var jsonBffaGrdType = [];
	var jsonBffaGrdKnd  = [];
	var jsonBffaGrdDtl     = [];


	const fn_initSBSelectBffaGrd = async function() {
		jsonBffaGrdType.length = 0;
		jsonBffaGrdKnd.length = 0;
		jsonBffaGrdDtl.length = 0;
		grdBffaGrdType.rebuild();
		grdBffaGrdKnd.rebuild();
		grdBffaGrdDtl.rebuild();
		let rst = await Promise.all([
			gfn_setApcItemSBSelect("grd-slt-BitemCd", 	jsonGItemCd, gv_apcCd),			// APC 품목
			gfn_setComCdSBSelect("grdBffaGrd", 		jsonBffaGrdType, gv_selectedApcCd)		// 등급유형			
		]);
		SBUxMethod.set("grd-inp-apcNm", gv_apcNm);
		
	}
	
	const fn_createBffaGrdGrid = async function() {

		

   		var SBGridPropertiesBffaGrdType = {};
   		SBGridPropertiesBffaGrdType.parentid = 'sb-area-grdBffaGrdType';
   		SBGridPropertiesBffaGrdType.id = 'grdBffaGrdType';
   		SBGridPropertiesBffaGrdType.jsonref = 'jsonBffaGrdType';
   		SBGridPropertiesBffaGrdType.emptyrecords = '데이터가 없습니다.';
   		SBGridPropertiesBffaGrdType.selectmode = 'byrow';
   		SBGridPropertiesBffaGrdType.extendlastcol = 'scroll';
   		SBGridPropertiesBffaGrdType.oneclickedit = true;
   		SBGridPropertiesBffaGrdType.columns = [
	        {caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'50px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_bffaGrdProcAddRow(\"ADD\", \"grdBffaGrdType\", " + nRow + ", " + nCol + ")'>추가</button>";	        
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_bffaGrdProcDelRow(\"DEL\", \"grdBffaGrdType\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["등급종류"],     	ref: 'grdType',  type:'input',  width:'100px',    style:'text-align:center',
	        		typeinfo : {maxlength : 30}
		    },
	        {caption: ["순번"],     ref: 'sn',  type:'input',  width:'50px',    style:'text-align:center',
					typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 		ref: 'itemCd',   	type:'input',  hidden : true},
	        {caption: ["등급구분코드"], 	ref: 'grdSeCd',   	type:'input',  hidden : true},
	        {caption: ["등급종류"], 		ref: 'grd',   	type:'input',  hidden : true}
	        
	    ];
   		grdBffaGrdType = _SBGrid.create(SBGridPropertiesBffaGrdType);
   		grdBffaGrdType.bind('click', fn_selectBffaGrdKnd)
   		
   		
   		var SBGridPropertiesBffaGrdKnd = {};
   		SBGridPropertiesBffaGrdKnd.parentid = 'sb-area-grdBffaGrdKnd';
   		SBGridPropertiesBffaGrdKnd.id = 'grdBffaGrdKnd';
   		SBGridPropertiesBffaGrdKnd.jsonref = 'jsonBffaGrdKnd';
   		SBGridPropertiesBffaGrdKnd.emptyrecords = '데이터가 없습니다.';
   		SBGridPropertiesBffaGrdKnd.selectmode = 'byrow';
   		SBGridPropertiesBffaGrdKnd.extendlastcol = 'scroll';
   		SBGridPropertiesBffaGrdKnd.oneclickedit = true;
   		SBGridPropertiesBffaGrdKnd.columns = [
	        {caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'50px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_bffaGrdProcAddRow(\"ADD\", \"grdBffaGrdKnd\", " + nRow + ", " + nCol + ")'>추가</button>";	        	
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_bffaGrdProcDelRow(\"DEL\", \"grdBffaGrdKnd\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["등급종류"],     	ref: 'grdKndNm',  type:'input',  width:'100px',    style:'text-align:center',
	        		typeinfo : {maxlength : 30}
		    },
	        {caption: ["순번"],     ref: 'sn',  type:'input',  width:'50px',    style:'text-align:center',
					typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 		ref: 'itemCd',   	type:'input',  hidden : true},
	        {caption: ["등급구분코드"], 	ref: 'grdSeCd',   	type:'input',  hidden : true},
	        {caption: ["등급종류"], 		ref: 'grdKnd',   	type:'input',  hidden : true},
	        {caption: ["육안등급유형"], 		ref: 'bffaGrdType',   	type:'input',  hidden : true},
	    ];
   		grdBffaGrdKnd = _SBGrid.create(SBGridPropertiesBffaGrdKnd);   		
   		grdBffaGrdKnd.bind('click', fn_selectBffaGrdDtl);
   		
   		
   		
   		var SBGridPropertiesBffaGrdDtl = {};
   		SBGridPropertiesBffaGrdDtl.parentid = 'sb-area-grdBffaGrdDtl';
   		SBGridPropertiesBffaGrdDtl.id = 'grdBffaGrdDtl';
   		SBGridPropertiesBffaGrdDtl.jsonref = 'jsonBffaGrdDtl';
   		SBGridPropertiesBffaGrdDtl.emptyrecords = '데이터가 없습니다.';
   		SBGridPropertiesBffaGrdDtl.selectmode = 'byrow';
   		SBGridPropertiesBffaGrdDtl.extendlastcol = 'scroll';
   		SBGridPropertiesBffaGrdDtl.oneclickedit = true;
   		SBGridPropertiesBffaGrdDtl.columns = [
	        {caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'50px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_bffaGrdProcAddRow(\"ADD\", \"grdBffaGrdDtl\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{	        	
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_bffaGrdProcDelRow(\"DEL\", \"grdBffaGrdDtl\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["등급종류"],     	ref: 'grdNm',  type:'input',  width:'100px',    style:'text-align:center',
	        		typeinfo : {maxlength : 30}
		    },
	        {caption: ["순번"],     ref: 'sn',  type:'input',  width:'50px',    style:'text-align:center',
					typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 		ref: 'itemCd',   	type:'input',  hidden : true},
	        {caption: ["등급구분코드"], 	ref: 'grdSeCd',   	type:'input',  hidden : true},
	        {caption: ["등급종류"], 		ref: 'grdKnd',   	type:'input',  hidden : true},
	        {caption: ["등급코드"], 		ref: 'grdCd',   	type:'input',  hidden : true},
	        {caption: ["육안등급유형"], 		ref: 'bffaGrdType',   	type:'input',  hidden : true}
	    ];
   		grdBffaGrdDtl = _SBGrid.create(SBGridPropertiesBffaGrdDtl);
   		
	    
   		
	    await fn_initSBSelectBffaGrd();
	}

	
	

	
	const fn_selectBffaGrd = async function(){
		
		
		let rst = await Promise.all([
			fn_selectBffaGrdType()			
		]);
	}
	
	
	const fn_selectBffaGrdType = async function(){
		jsonBffaGrdType.length = 0;
		let lastRowIndex = 0;
		
		let apcCd = gv_apcCd;
		let itemCd = SBUxMethod.get('grd-slt-BitemCd');
		
		let nRow = grdBffaGrdType.getRow();
		let rowData = grdBffaGrdType.getRowData(nRow);
		SBUxMethod.set("idxLabel_grdType","");
		SBUxMethod.set("inpt-bbfa-grd-type",nRow.cdVl);
		
		let postJsonPromise = gfn_postJSON("/am/cmns/selectBffaSortTypeList.do", {apcCd : apcCd, itemCd : itemCd});
	    let data = await postJsonPromise;
	    try{
  			if (_.isEqual("S", data.resultStatus)) {
  				grdBffaGrdType.length = 0;
  		    	data.resultList.forEach((item, index) => {
  					let stdGrdVO = {
  						delYn         : item.delYn
					  , grdType 		: item.cdVlNm
  					  ,	cdVl			: item.cdVl
  					  , sn				: item.sn
  					}
  					lastRowIndex = index;
  					jsonBffaGrdType.push(stdGrdVO);
  				});
  		    	grdBffaGrdType.addRow(true);
  		    	grdBffaGrdType.setRowStatus(lastRowIndex + 1, "i");
  		    	
  		    	grdBffaGrdType.rebuild();
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
	
	const fn_selectBffaGrdKnd = async function(){
		jsonBffaGrdDtl.length = 0;
		grdBffaGrdDtl.rebuild();		
		
		let apcCd = gv_apcCd;
		
		let nRow = grdBffaGrdType.getRow();
		let rowData = grdBffaGrdType.getRowData(nRow);
		let cdVl = grdBffaGrdType.getRowData(grdBffaGrdType.getRow()).cdVl;
		let itemCd = SBUxMethod.get('grd-slt-BitemCd');
		SBUxMethod.set("idxLabel_grdDtl","");
		SBUxMethod.set("idxLabel_grdType",rowData.grdType);
		
		
		
		
		let lastRowIndex = 0;
		if(rowData.sn === "" || rowData.sn === undefined){
			return
		}
		let postJsonPromise = gfn_postJSON("/am/cmns/selectBffaSortKndList.do", {apcCd : apcCd, itemCd : itemCd, bffaGrdType : cdVl });
	    let data = await postJsonPromise;
	    
	    try{
  			if (_.isEqual("S", data.resultStatus)) {
  				jsonBffaGrdKnd.length = 0;
  				
  		    	data.resultList.forEach((item, index) => {
  					let stdGrdVO = {
						delYn         : item.delYn
  					  , grdKndNm 	: item.grdKndNm
  					  ,	grdKnd		: item.grdKnd
  					  , sn				: item.sn
  					  , itemCd      : item.itemCd
  					  , bffaGrdType : item.bffaGrdType
  					}
  					lastRowIndex = index;
  					jsonBffaGrdKnd.push(stdGrdVO);
  				});
  		    	grdBffaGrdKnd.addRow(true);
  		    	grdBffaGrdKnd.setRowStatus(lastRowIndex + 1, "i");
  		    	grdBffaGrdKnd.rebuild();
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
	
	const fn_selectBffaGrdDtl = async function(){
		let apcCd = gv_apcCd;
		let itemCd = SBUxMethod.get('grd-slt-BitemCd');
		let lastRowIndex = 0;
		let nRow = grdBffaGrdKnd.getRow();
		let rowData = grdBffaGrdKnd.getRowData(nRow);
		
		SBUxMethod.set("idxLabel_grdDtl",rowData.grdKndNm);
		if(rowData.sn === "" || rowData.sn === undefined){
			return
		}
		
		let postJsonPromise = gfn_postJSON("/am/cmns/selectBffaSortDtlList.do", {apcCd : apcCd, itemCd : itemCd,bffaGrdType : rowData.bffaGrdType, grdKnd : rowData.grdKnd});
	    let data = await postJsonPromise;
	    try{
  			if (_.isEqual("S", data.resultStatus)) {
  				jsonBffaGrdDtl.length = 0;
  		    	data.resultList.forEach((item, index) => {
  					let stdGrdVO = {
  					   delYn         : item.delYn
  					  , grdKndNm 		: item.grdKndNm
  					  , grdCd			: item.grdCd
  					  , grdVl			: item.grdVl
  					  , bffaGrdType	: item.bffaGrdType
  					  , sn				: item.sn
  					  , grdNm			: item.grdNm
  					}
  					lastRowIndex = index;
  					jsonBffaGrdDtl.push(stdGrdVO);
  				});
  		    	grdBffaGrdDtl.addRow(true);
  		    	grdBffaGrdKnd.setRowStatus(lastRowIndex + 1, "i");
  		    	grdBffaGrdDtl.rebuild();
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
	
	const fn_saveBffaGrd = async function(){
		let apcCd = gv_apcCd;
		let itemCd = SBUxMethod.get('grd-slt-BitemCd');
		let bffaGrdType = grdBffaGrdType.getRowData(grdBffaGrdType.getRow()).cdVl;
		let lastRowIndex = 0;
		
		
		let kndAllData = grdBffaGrdKnd.getGridDataAll();
		let dtlAllData = grdBffaGrdDtl.getGridDataAll();
		let sortParamList = [];
		
		kndAllData.forEach((item,index) => {
			let status = grdBffaGrdKnd.getRowStatus(index+1);
			sortParamList.push({apcCd : gv_apcCd, itemCd : itemCd, bffaGrdType : bffaGrdType,grdKnd : item.grdKnd ,grdKndNm : item.grdKndNm,sn : item.sn, rmrk : '',status : status,type : "knd" });
		});
		
		dtlAllData.forEach((item,index) => {
			let status = grdBffaGrdDtl.getRowStatus(index+1);
			let grdKnd = grdBffaGrdKnd.getRowData(grdBffaGrdKnd.getRow()).grdKnd;
			sortParamList.push({apcCd : gv_apcCd, itemCd : itemCd, bffaGrdType : bffaGrdType, grdKnd : grdKnd  ,grdNm : item.grdNm,sn : item.sn, rmrk : '',status : status, type : "dtl" });
		});
		
	    try{
	    	let postJsonPromise = gfn_postJSON("/am/cmns/saveBffaSort.do", sortParamList);
		    let data = await postJsonPromise;
		    
  			if (_.isEqual("S", data.resultStatus)) {
  				fn_selectBffaGrdKnd();
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
	
	


	




	const fn_bffaGrdProcAddRow = async function (gubun, grid, nRow, nCol) {
		if(grid ==="grdBffaGrdType"){
			grdBffaGrdType.setCellData(nRow, nCol, "N", true);
			grdBffaGrdType.addRow(true);
			grdBffaGrdType.setCellDisabled(0, 0, grdBffaGrdType.getRows() -1, grdBffaGrdType.getCols() -1, false);
			grdBffaGrdType.setCellDisabled(grdBffaGrdType.getRows() -1, 0, grdBffaGrdType.getRows() -1, grdBffaGrdType.getCols() -1, true);
			
		}else if(grid ==="grdBffaGrdKnd"){
			grdBffaGrdKnd.setCellData(nRow, nCol, "N", true);
			grdBffaGrdKnd.addRow(true);
			grdBffaGrdKnd.setCellDisabled(0, 0, grdBffaGrdKnd.getRows() -1, grdBffaGrdKnd.getCols() -1, false);
			grdBffaGrdKnd.setCellDisabled(grdBffaGrdKnd.getRows() -1, 0, grdBffaGrdKnd.getRows() -1, grdBffaGrdKnd.getCols() -1, true);
			
		}else if(grid ==="grdBffaGrdDtl"){
			grdBffaGrdDtl.setCellData(nRow, nCol, "N", true);
			grdBffaGrdDtl.addRow(true);
			grdBffaGrdDtl.setCellDisabled(0, 0, grdBffaGrdDtl.getRows() -1, grdBffaGrdDtl.getCols() -1, false);
			grdBffaGrdDtl.setCellDisabled(grdBffaGrdDtl.getRows() -1, 0, grdBffaGrdDtl.getRows() -1, grdBffaGrdDtl.getCols() -1, true);
		}		
		
	}
	
	const fn_bffaGrdProcDelRow = async function (gubun, grid, nRow, nCol) {
		
		
		if(grid ==="grdBffaGrdType"){
			if(grdBffaGrdType.getRowStatus(nRow) == 0 || grdBffaGrdType.getRowStatus(nRow) == 2){
				if(gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")){
					var bffaGrdType = grdBffaGrdType.getRowData(nRow);
					fn_deleteBffaGrdType(bffaGrdType, nRow);
				}
			}else{
				grdBffaGrdType.deleteRow(nRow);
			}
		}else if(grid ==="grdBffaGrdKnd"){
			if(grdBffaGrdKnd.getRowStatus(nRow) == 0 || grdBffaGrdKnd.getRowStatus(nRow) == 2){
				if(gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")){
					var bffaGrdKnd = grdBffaGrdKnd.getRowData(nRow);
					fn_deleteBffaGrdKnd(bffaGrdKnd, nRow);
				}
			}else{
				grdBffaGrdKnd.deleteRow(nRow);
			}
			
		}else if(grid ==="grdBffaGrdDtl"){
			if(grdBffaGrdDtl.getRowStatus(nRow) == 0 || grdBffaGrdDtl.getRowStatus(nRow) == 2){
				if(gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")){
					var bffaGrdDtl = grdBffaGrdDtl.getRowData(nRow);
					fn_deleteBffaGrdDtl(bffaGrdDtl, nRow);
				}
			}else{
				grdBffaGrdDtl.deleteRow(nRow);
			}
		}	
		
	}
	
	const fn_deleteBffaGrdKnd = async function(data, nRow){
		let apcCd = gv_apcCd;
		let itemCd = SBUxMethod.get('grd-slt-BitemCd');
		
		let kndParam = {apcCd:apcCd, itemCd : itemCd, bffaGrdType : data.bffaGrdType, grdKnd : data.grdKnd};
	    try{
	    	let postJsonPromise = gfn_postJSON("/am/cmns/deleteBffaSortKnd.do", kndParam);
		    let data = await postJsonPromise;
		    
  			if (_.isEqual("S", data.resultStatus)) {
  				fn_selectBffaGrdKnd();
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
	
	const fn_deleteBffaGrdDtl = async function(data, nRow){
		let apcCd = gv_apcCd;
		let itemCd = SBUxMethod.get('grd-slt-BitemCd');
		let grdKnd = grdBffaGrdKnd.getRowData(grdBffaGrdKnd.getRow()).grdKnd;
		let kndParam = {apcCd:apcCd, itemCd : itemCd, bffaGrdType : data.bffaGrdType, grdKnd : grdKnd, grdCd : data.grdCd};
	    try{
	    	let postJsonPromise = gfn_postJSON("/am/cmns/deleteBffaSortDtl.do", kndParam);
		    let data = await postJsonPromise;
		    
  			if (_.isEqual("S", data.resultStatus)) {
  				fn_selectBffaGrdDtl();
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

</script>
</html>