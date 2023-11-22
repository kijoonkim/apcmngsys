<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 등급 등록</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">선택한 품목별로 APC에서 관리하는 등급을 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">품목별 입고/선별/상품 등급을 등록하세요.(점수배분을 통한 판정등급을 관리할 수 있습니다.)</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchJgmtGrd" name="btnSearchJgmtGrd" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchStdGrd"></sbux-button>
					<sbux-button id="btnSaveJgmtGrd" name="btnSaveJgmtGrd" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveGrd"></sbux-button>
					<sbux-button id="btnEndJgmtGrd" name="btnEndJgmtGrd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-stdGrd')"></sbux-button>
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
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
							</tr>
							<tr>
								<th scope="row"><span class="data_required"></span>품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-select id="grd-slt-itemCd" name="grd-slt-itemCd" style="background-color:#ffffff;"  uitype="single"
									jsondata-ref="jsonGItemCd"
									onchange="fn_searchStdGrd"
									unselected-text="선택" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-select>
								</th>
								<th scope="row">구분</th>
								<th>
									<sbux-radio id="grd-rdo-grdSeCd" name="grd-rdo-grdSeCd" uitype="normal"
									jsondata-ref="jsonGGrdSeCd"
									text-right-padding="10px"
									onchange="fn_searchStdGrd"
									>
								</th>
								<th>&nbsp;</th>
							</tr>

						</tbody>
					</table>

				</div>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="row">
					<div class="col-sm-6">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>등급등록</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdStdGrd" style="height:158px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>등급상세</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdStdGrdDtl" style="height:158px; width: 100%;"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="ad_tbl_top"  style="width: 98%;">
						<ul class="ad_tbl_count">
							<li><span>판정등록</span></li>
						</ul>
					</div>
					<div>
						<div id="sb-area-grdStdGrdJgmt" style="height:158px; width: 100%;"></div>
					</div>
				</div>

			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonGItemCd 	= [];
	var jsonGGrdSeCd 	= [];
	var jsonGJgmtType 	= [];
	var jsonGStdGrdType	= [];
	
	var jsonStdGrd = [];
	var jsonStdGrdDtl = [];

	const fn_initSBSelectStdGrd = async function() {
		let rst = await Promise.all([
			gfn_getComCdDtls('STD_GRD_TYPE'),
			gfn_setApcItemSBSelect("grd-slt-itemCd", 	jsonGItemCd, gv_apcCd),			// APC 품목
			gfn_setComCdSBSelect("grd-rdo-grdSeCd", 	jsonGGrdSeCd, "GRD_SE_CD"),		// 등급구분코드(출하)
			gfn_setComCdSBSelect("grdStdGrdJgmt", 		jsonGJgmtType, "JGMT_TYPE")		// 등급구분코드(출하)
		]);
		
		jsonGStdGrdType = rst[0]; 
		console.log(jsonGStdGrdType);
		
		SBUxMethod.set("grd-rdo-grdSeCd", "01");

		jsonStdGrd.length = 0;
		jsonStdGrdDtl.length = 0;
		jsonStdGrdJgmt.length = 0;
		grdStdGrd.refresh({"combo":true});
		grdStdGrdDtl.refresh({"combo":true});
		grdStdGrdJgmt.refresh({"combo":true});

	}
	const fn_createGrdGrid = async function() {

		SBUxMethod.set("grd-inp-apcNm", SBUxMethod.get("inp-apcNm"));

   		var SBGridPropertiesStdGrd = {};
   		SBGridPropertiesStdGrd.parentid = 'sb-area-grdStdGrd';
   		SBGridPropertiesStdGrd.id = 'grdStdGrd';
   		SBGridPropertiesStdGrd.jsonref = 'jsonStdGrd';
   		SBGridPropertiesStdGrd.emptyrecords = '데이터가 없습니다.';
   		SBGridPropertiesStdGrd.selectmode = 'byrow';
   		SBGridPropertiesStdGrd.extendlastcol = 'scroll';
   		SBGridPropertiesStdGrd.oneclickedit = true;
   		SBGridPropertiesStdGrd.columns = [
	        {caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdStdGrd\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdStdGrd\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["등급분류명"],     	ref: 'grdKndNm',  type:'input',  width:'100px',    style:'text-align:center',
	        		typeinfo : {maxlength : 30}
		    },
		    {caption: ["유형"], 	ref: 'stdGrdType',	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonGStdGrdType', 	displayui : false,	itemcount: 10, label:'cdVlNm', value:'cdVl', unselect: {label : '', value: ''}}
		    },
	        {caption: ["순번"],     ref: 'sn',  type:'input',  width:'80px',    style:'text-align:center',
					typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}},
		    {caption: ["상세"], 		ref: 'grdKnd',  type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(!gfn_isEmpty(strValue)){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_stdGrdDtl(" + nRow + ")'>상세</button>";
	        	}else{
			        return ""
	        	}
		    }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 		ref: 'itemCd',   	type:'input',  hidden : true},
	        {caption: ["등급구분코드"], 	ref: 'grdSeCd',   	type:'input',  hidden : true},
	        {caption: ["등급종류"], 		ref: 'grdKnd',   	type:'input',  hidden : true},
	        {caption: ["가산율"], 		ref: 'adtnRt',   	type:'input',  hidden : true}
	    ];
   		grdStdGrd = _SBGrid.create(SBGridPropertiesStdGrd);

	    var SBGridPropertiesStdGrdDtl = {};
	    SBGridPropertiesStdGrdDtl.parentid = 'sb-area-grdStdGrdDtl';
	    SBGridPropertiesStdGrdDtl.id = 'grdStdGrdDtl';
	    SBGridPropertiesStdGrdDtl.jsonref = 'jsonStdGrdDtl';
	    SBGridPropertiesStdGrdDtl.emptyrecords = '데이터가 없습니다.';
	    SBGridPropertiesStdGrdDtl.selectmode = 'byrow';
	    SBGridPropertiesStdGrdDtl.extendlastcol = 'scroll';
	    SBGridPropertiesStdGrdDtl.oneclickedit = true;
	    SBGridPropertiesStdGrdDtl.columns = [
			{caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdStdGrdDtl\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdStdGrdDtl\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	    	{caption: ["등급상세명"],     	ref: 'grdNm',  type:'input',  width:'180px',    style:'text-align:center',
        			typeinfo : {maxlength : 30}},
       		{caption: ["점수"],     ref: 'grdVl',  type:'input',  width:'80px',    style:'text-align:center',
					typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
       		{caption: ["순서"],     ref: 'sn',  type:'input',  width:'80px',    style:'text-align:center',
					typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}, format : {type:'number', rule:'#,###'}},
	        {caption: ["APC코드"], 	ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 	ref: 'itemCd',   	type:'input',  hidden : true},
	        {caption: ["등급구분코드"], ref: 'grdSeCd',   	type:'input',  hidden : true},
	        {caption: ["등급코드"], 	ref: 'grdKnd',   	type:'input',  hidden : true},
	        {caption: ["등급종류코드"], ref: 'grdCd',   	type:'input',  hidden : true}
	    ];
	    grdStdGrdDtl = _SBGrid.create(SBGridPropertiesStdGrdDtl);

	    var SBGridPropertiesStdGrdJgmt = {};
	    SBGridPropertiesStdGrdJgmt.parentid = 'sb-area-grdStdGrdJgmt';
	    SBGridPropertiesStdGrdJgmt.id = 'grdStdGrdJgmt';
	    SBGridPropertiesStdGrdJgmt.jsonref = 'jsonStdGrdJgmt';
	    SBGridPropertiesStdGrdJgmt.emptyrecords = '데이터가 없습니다.';
	    SBGridPropertiesStdGrdJgmt.selectmode = 'byrow';
	    SBGridPropertiesStdGrdJgmt.extendlastcol = 'scroll';
	    SBGridPropertiesStdGrdJgmt.oneclickedit = true;
	    SBGridPropertiesStdGrdJgmt.columns = [
			{caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdStdGrdJgmt\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdStdGrdJgmt\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	    	{caption: ["등급종류명"],     	ref: 'grdNm',  type:'input',  width:'240px',    style:'text-align:center',
        			typeinfo : {maxlength : 30}},
        	{caption: ["판정유형"], ref: 'jgmtType',   	type:'combo',  width:'220px',    style:'text-align:center',
         			typeinfo : {ref:'jsonGJgmtType', 	itemcount: 10, label:'label', value:'value', displayui : false}},
           	{caption: ["판정최소값"],     ref: 'jgmtMinVl',  type:'input',  width:'100px',    style:'text-align:center',
    				typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
           	{caption: ["판정최대값"],     ref: 'jgmtMaxVl',  type:'input',  width:'100px',    style:'text-align:center',
    				typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
       		{caption: ["등급값"],     ref: 'grdVl',  type:'input',  width:'100px',    style:'text-align:center',
					typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 10}, format : {type:'number', rule:'#,###'}, hidden : true},
       		{caption: ["순서"],     ref: 'sn',  type:'input',  width:'100px',    style:'text-align:center',
					typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}, format : {type:'number', rule:'#,###'}},
	        {caption: ["APC코드"], 	ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 	ref: 'itemCd',   	type:'input',  hidden : true},
	        {caption: ["등급구분코드"], ref: 'grdSeCd',   	type:'input',  hidden : true},
	        {caption: ["등급코드"], 	ref: 'grdCd',   	type:'input',  hidden : true}
	    ];
	    grdStdGrdJgmt = _SBGrid.create(SBGridPropertiesStdGrdJgmt);
	    fn_initSBSelectStdGrd();
	}

	const fn_searchStdGrd = async function(){
		if(jsonGItemCd.length == 0){
			alert("품목 먼저 등록해주세요.");
			return;
		}
		let itemCd = SBUxMethod.get("grd-slt-itemCd");

		if(gfn_isEmpty(itemCd)){
			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		jsonStdGrdDtl.length=0;
		grdStdGrdDtl.rebuild();

		let rst = await Promise.all([
			fn_selectStdGrd(),
			fn_selectStdGrdJgmt()
		])

	}

	const fn_selectStdGrd = async function(){

		let itemCd = SBUxMethod.get("grd-slt-itemCd");
		let grdSeCd = SBUxMethod.get("grd-rdo-grdSeCd");
		let apcCd = gv_apcCd;
		let postJsonPromise = gfn_postJSON("/am/cmns/selectStdGrdList.do", {apcCd : apcCd, itemCd : itemCd, grdSeCd : grdSeCd});
	    let data = await postJsonPromise;
	    try{
	    	jsonStdGrd.length = 0;
	    	data.resultList.forEach((item, index) => {
				let stdGrdVO = {
					apcCd 		: item.apcCd
				  , itemCd 		: item.itemCd
				  ,	grdSeCd		: item.grdSeCd
				  ,	grdKnd  	: item.grdKnd
				  , grdKndNm 	: item.grdKndNm
				  , stdGrdType	: item.stdGrdType
				  , sn			: item.sn
				  , adtnRt		: item.adtnRt
				  , delYn		: item.delYn
				}
				jsonStdGrd.push(stdGrdVO);
			});
	    	grdStdGrd.rebuild();
	    	grdStdGrd.addRow(true);
	    	grdStdGrd.setCellDisabled(grdStdGrd.getRows() -1, 0, grdStdGrd.getRows() -1, grdStdGrd.getCols() -1, true);
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	const fn_selectStdGrdJgmt = async function() {
		let itemCd = SBUxMethod.get("grd-slt-itemCd");
		let grdSeCd = SBUxMethod.get("grd-rdo-grdSeCd");
		let apcCd = gv_apcCd;
		let postJsonPromise = gfn_postJSON("/am/cmns/selectStdGrdJgmtList.do", {apcCd : apcCd, itemCd : itemCd, grdSeCd : grdSeCd});
	    let data = await postJsonPromise;
	    try{
	    	jsonStdGrdJgmt.length = 0;
	    	data.resultList.forEach((item, index) => {
				let stdGrdJgmtVO = {
					apcCd 		: item.apcCd
				  , itemCd 		: item.itemCd
				  ,	grdSeCd		: item.grdSeCd
				  , grdCd		: item.grdCd
				  , grdNm		: item.grdNm
				  , jgmtType    : item.jgmtType
				  , jgmtMinVl	: item.jgmtMinVl
				  , jgmtMaxVl	: item.jgmtMaxVl
				  , grdVl		: item.grdVl
				  , sn			: item.sn
				  , delYn		: item.delYn
				}
				jsonStdGrdJgmt.push(stdGrdJgmtVO);
			});
	    	grdStdGrdJgmt.rebuild();
	    	grdStdGrdJgmt.addRow(true);
	    	grdStdGrdJgmt.setCellDisabled(grdStdGrdJgmt.getRows() -1, 0, grdStdGrdJgmt.getRows() -1, grdStdGrdJgmt.getCols() -1, true);
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	const fn_stdGrdDtl = async function(nRow){
		if(jsonGItemCd.length == 0){
			alert("품목 먼저 등록해주세요.");
			return;
		}
		let itemCd = SBUxMethod.get("grd-slt-itemCd");

		if(gfn_isEmpty(itemCd)){
			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		let grdKnd = grdStdGrd.getRowData(nRow).grdKnd;
		let grdSeCd = SBUxMethod.get("grd-rdo-grdSeCd");
		let apcCd = gv_apcCd;
		let postJsonPromise = gfn_postJSON("/am/cmns/selectStdGrdDtlList.do", {apcCd : apcCd, itemCd : itemCd, grdSeCd : grdSeCd, grdKnd : grdKnd});
	    let data = await postJsonPromise;
	    try{
	    	jsonStdGrdDtl.length = 0;
	    	data.resultList.forEach((item, index) => {
				let stdGrdVO = {
					apcCd 		: item.apcCd
				  , itemCd 		: item.itemCd
				  ,	grdSeCd		: item.grdSeCd
				  ,	grdKnd  	: item.grdKnd
				  , grdCd		: item.grdCd
				  , grdNm		: item.grdNm
				  , grdVl		: item.grdVl
				  , sn			: item.sn
				  , delYn		: item.delYn
				}
				jsonStdGrdDtl.push(stdGrdVO);
			});

	    	grdStdGrdDtl.rebuild();
	    	grdStdGrdDtl.addRow(true);
	    	grdStdGrdDtl.setCellDisabled(grdStdGrdDtl.getRows() -1, 0, grdStdGrdDtl.getRows() -1, grdStdGrdDtl.getCols() -1, true);
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	const fn_saveGrd = async function(){
		let saveList = [];
		let saveDtlList = [];
		let saveJgmtList = [];
		let gridData = grdStdGrd.getGridDataAll();
		let gridDtlData = grdStdGrdDtl.getGridDataAll();
		let gridJgmtData = grdStdGrdJgmt.getGridDataAll();

		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdStdGrd.getRowData(i);
			let rowSts = grdStdGrd.getRowStatus(i);
			let delYn = rowData.delYn;
			let grdKndNm = rowData.grdKndNm;
			if(delYn == 'N'){
				if (gfn_isEmpty(grdKndNm)) {
		  			gfn_comAlert("W0002", "명칭");		//	W0002	{0}을/를 입력하세요.
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

		for(var i=1; i<=gridDtlData.length; i++ ){
			let rowData = grdStdGrdDtl.getRowData(i);
			let rowSts = grdStdGrdDtl.getRowStatus(i);
			let delYn = rowData.delYn;
			let grdNm = rowData.grdNm;
			if(delYn == 'N'){
				if (gfn_isEmpty(grdNm)) {
		  			gfn_comAlert("W0002", "등급종류명");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}
				if (rowSts === 3){
					rowData.rowSts = "I";
					saveDtlList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					saveDtlList.push(rowData);
				} else {
					continue;
				}
			}
		}

		for(var i=1; i<=gridJgmtData.length; i++ ){
			let rowData = grdStdGrdJgmt.getRowData(i);
			let rowSts = grdStdGrdJgmt.getRowStatus(i);
			let delYn = rowData.delYn;
			let grdNm = rowData.grdNm;
			if(delYn == 'N'){
				if (gfn_isEmpty(grdNm)) {
		  			gfn_comAlert("W0002", "등급종류명");		//	W0002	{0}을/를 입력하세요.
		            return;
		  		}
				if (rowSts === 3){
					rowData.rowSts = "I";
					saveJgmtList.push(rowData);
				} else if (rowSts === 2){
					rowData.rowSts = "U";
					saveJgmtList.push(rowData);
				} else {
					continue;
				}
			}
		}

		if(saveList.length == 0 && saveDtlList.length == 0 && saveJgmtList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}
		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){
			let saveLists = [{
				stdGrdList : saveList,
				stdGrdDtlList : saveDtlList,
				stdGrdJgmtList : saveJgmtList
			}]

			let postJsonPromise = gfn_postJSON("/am/cmns/multiStdGrdList.do", saveLists);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_searchStdGrd();
	        	} else {
	        		alert(data.resultMessage);
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
		}
	}

	const fn_deleteGrd = async function(stdGrdVO){
        let postJsonPromise = gfn_postJSON("/am/cmns/deleteStdGrd.do", stdGrdVO);
        let data = await postJsonPromise;
        try {
        	if(data.deletedCnt > 0){
        		gfn_comAlert("I0001");		// I0001	처리 되었습니다.
        		fn_searchStdGrd();
        		return;
        	}else if (data.errMsg != null ){
        		gfn_comAlert("E0000", data.errMsg)		// W0009   {0}이/가 있습니다.
        		return;
        	}else {
        		gfn_comAlert("E0001");
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_deleteGrdDtl = async function(stdGrdDtlVO){
        let postJsonPromise = gfn_postJSON("/am/cmns/deleteStdGrdDtl.do", stdGrdDtlVO);
        let data = await postJsonPromise;
        try {
        	if(data.deletedCnt > 0){
        		gfn_comAlert("I0001");		// I0001	처리 되었습니다.
        		fn_stdGrdDtl(grdStdGrd.getRow());
        		return;
        	}else if (data.errMsg != null ){
        		gfn_comAlert("E0000", data.errMsg)		// W0009   {0}이/가 있습니다.
        		return;
        	}else {
        		gfn_comAlert("E0001");
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	const fn_deleteGrdJgmt = async function(stdGrdJgmtVO){
        let postJsonPromise = gfn_postJSON("/am/cmns/deleteStdGrdJgmt.do", stdGrdJgmtVO);
        let data = await postJsonPromise;
        try {
        	if(data.deletedCnt > 0){
        		gfn_comAlert("I0001");		// I0001	처리 되었습니다.
        		fn_searchStdGrd();
        		return;
        	}else if (data.errMsg != null ){
        		gfn_comAlert("E0000", data.errMsg)		// W0009   {0}이/가 있습니다.
        		return;
        	}else {
        		gfn_comAlert("E0001");
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

</script>
</html>