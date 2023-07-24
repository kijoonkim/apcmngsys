<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header">
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnItemSech" name="btnItemSech" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectItemList()"></sbux-button>
						<sbux-button id="btnItemReg" name="btnItemReg" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertApcVrtyList"></sbux-button>
						<sbux-button id="btnItemEnd" name="btnItemEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('itemMngModal')"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<div>
					<!--[pp] 검색 -->
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 10%">
							<col style="width: 20%">
							<col style="width: 10%">
							<col style="width: 20%">
							<col style="width: 10%">
							<col style="width: 20%">
							<col style="width: auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">APC명</th>
								<th>
									<sbux-input id=itemApcNm name="itemApcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row">품목명</th>
								<th  style="border-right-style: hidden;">
									<sbux-input id=itemNm name="itemNm" uitype="text" class="form-control input-sm"></sbux-input>
								</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
							</tr>
						</tbody>
					</table>

				</div>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<b>&nbsp;</b>

				<div class="row">

					<div class="col-sm-4">
						<div>
							<div id="itemGridArea" style="height:159px; width: 100%;"></div>
						</div>
					</div>


					<div class="col-sm-8">
						<div>
							<div id="apcItemGridArea" style="height:159px; width: 100%;"></div>
						</div>
					</div>
					<b>&nbsp;</b>
				</div>
				<div class="">
					<table class="table table-bordered tbl_row tbl_fixed mg_t10">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 10%">
							<col style="width: 20%">
							<col style="width: 10%">
							<col style="width: 20%">
							<col style="width: 10%">
							<col style="width: 20%">
							<col style="width: auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id=vrtyItemNm name="vrtyItemNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
									<sbux-input id=vrtyItemCd name="vrtyItemCd" uitype="hidden" class="form-control input-sm"></sbux-input>
								</th>
								<th scope="row">품종명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id=vrtyNm name="vrtyNm" uitype="text" class="form-control input-sm"></sbux-input>
								</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="row">
					<div class="col-sm-6">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>품종등록</span></li>
							</ul>
						</div>
						<div>
							<div id="vrtyGridArea" style="height:157px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span class="font_default" >&nbsp;</span></li>
								</ul>
						</div>
						<div>
							<div id="apcVrtyGridArea" style="height:157px; width: 100%;"></div>
						</div>
					</div>
				</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>

	</section>
</body>
<script type="text/javascript">

	var itemGridData = []; // 그리드의 참조 데이터 주소 선언
	async function fn_itemCreateGrid() {
		SBUxMethod.set("itemApcNm", SBUxMethod.get("apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'itemGridArea';
	    SBGridProperties.id = 'itemDataGrid';
	    SBGridProperties.jsonref = 'itemGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["코드"],     ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],     ref: 'itemNm',  type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["선택"], 	ref: 'empty',   type:'output',  width:'100PX',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_addItem(" + nRow + ")'>선택</button>";
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}

	    ];
	    itemDataGrid = _SBGrid.create(SBGridProperties);
	    fn_selectItemList();
	}

	async function fn_selectItemList(){
		fn_callSelectItemList()
	}

	async function fn_callSelectItemList(){
		let apcCd = SBUxMethod.get("apcCd");
		let itemNm = SBUxMethod.get("itemNm");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectCmnsItemList.do", {apcCd : apcCd, itemNm : itemNm});
        let data = await postJsonPromise;
        let newItemGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let itemVO = {
					itemCd 		: item.itemCd
				  , itemNm 		: item.itemNm
				  , apcCd		: apcCd
				}
				newItemGridData.push(itemVO);
			});
        	itemGridData = newItemGridData;
        	itemDataGrid.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	var apcItemGridData = []; // 그리드의 참조 데이터 주소 선언
	async function fn_apcItemCreateGrid() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'apcItemGridArea';
	    SBGridProperties.id = 'apcItemDataGrid';
	    SBGridProperties.jsonref = 'apcItemGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.clickeventarea = {empty: true, fixed: true};
	    SBGridProperties.columns = [
	        {caption: ["코드"],     	ref: 'itemCd',  	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],     	ref: 'itemNm',  	type:'output',  width:'200px',    style:'text-align:center'},
	        {caption: ["품종등록"],     ref: 'vrtrCnt',  	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["규격등록"],     ref: 'spcfctCnt',  	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["등급등록"],     ref: 'grdCnt',  	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["삭제"], 	ref: 'empty',   type:'output',  width:'100PX',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_deleteItem(" + nRow + ")'>삭제</button>";
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}

	    ];
	    apcItemDataGrid = _SBGrid.create(SBGridProperties);
	    apcItemDataGrid.bind('click', fn_apcVrtyList);
	    fn_selectApcItemList();
	}

	async function fn_selectApcItemList(){
		fn_callSelectApcItemList();
	}

	async function fn_callSelectApcItemList(){

		let apcCd = SBUxMethod.get("apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectApcCmnsItemList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        let newApcItemGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let itemVO = {
					itemCd 		: item.itemCd
				  , itemNm 		: item.itemNm
				  , apcCd		: apcCd
				  , vrtrCnt 	: item.vrtrCnt
				  , spcfctCnt	: item.spcfctCnt
				  , grdCnt		: item.grdCnt
				}
				newApcItemGridData.push(itemVO);
			});
        	apcItemGridData = newApcItemGridData;
        	apcItemDataGrid.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_addItem(nRow){
		let itemVO = itemDataGrid.getRowData(nRow);
		fn_callInsertApcItem(itemVO);
	}

	async function fn_callInsertApcItem(cmnsItemVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/insertApcCmnsItem.do", cmnsItemVO);
        let data = await postJsonPromise;
        try{
        	if(data.result > 0){
        		fn_selectApcItemList();
        		fn_selectItemList()
        	}else{
        		alert("등록 중 실패하였습니다.")
        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_deleteItem(nRow){
		let itemVO = apcItemDataGrid.getRowData(nRow);
		fn_callDeleteItem(itemVO)
	}

	async function fn_callDeleteItem(cmnsItemVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteApcCmnsItem.do", cmnsItemVO);
        let data = await postJsonPromise;
        try{
        	if(data.result > 0){
        		fn_selectApcItemList();
        		fn_selectItemList();
        	}else{
        		alert("삭제 중 실패하였습니다.")
        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	// 품종 목록 조회
	var vrtyGridData = []; // 그리드의 참조 데이터 주소 선언
	async function fn_vrtyCreateGrid() {
		vrtyGridData = [];
		let SBGridProperties = {};
	    SBGridProperties.parentid = 'vrtyGridArea';
	    SBGridProperties.id = 'vrtyDataGrid';
	    SBGridProperties.jsonref = 'vrtyGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["코드"],     ref: 'vrtyCd',  type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["명칭"],     ref: 'vrtyNm',  type:'output',  width:'300px',    style:'text-align:center'},
	        {caption: ["선택"], 	ref: 'empty',   type:'output',  width:'100PX',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_addVrty(" + nRow + ")'>선택</button>";
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 	ref: 'itemCd',   	type:'input',  hidden : true}

	    ];
	    vrtyDataGrid = _SBGrid.create(SBGridProperties);
	    fn_selectVrtyList();
	}

	async function fn_selectVrtyList(){
		fn_callSelectVrtyList();
	}

	async function fn_callSelectVrtyList(){

		let nRow = apcItemDataGrid.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = apcItemDataGrid.getRowData(nRow);
		SBUxMethod.set("vrtyItemNm", rowData.itemNm);
		let apcCd = SBUxMethod.get("apcCd");
		let itemCd = rowData.itemCd;
		let vrtyNm = SBUxMethod.get("vrtyNm");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectCmnsVrtyList.do", {apcCd : apcCd, itemCd : itemCd, vrtyNm : vrtyNm});
        let data = await postJsonPromise;
        let newVrtyGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let vrtyVO = {
					vrtyCd 		: item.vrtyCd
				  , vrtyNm 		: item.vrtyNm
				  , apcCd		: apcCd
				  , itemCd		: item.itemCd
				}
				newVrtyGridData.push(vrtyVO);
			});
        	vrtyGridData = newVrtyGridData;
        	vrtyDataGrid.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }

        //fn_selectApcVrtyList();
	}

	// APC 품종 목록 조회
	var apcVrtyGridData = []; // 그리드의 참조 데이터 주소 선언
	async function fn_apcVrtyCreateGrid() {
		let SBGridProperties = {};
	    SBGridProperties.parentid = 'apcVrtyGridArea';
	    SBGridProperties.id = 'apcVrtyDataGrid';
	    SBGridProperties.jsonref = 'apcVrtyGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["코드"],     ref: 'vrtyCd',  type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["명칭"],     ref: 'vrtyNm',  type:'input',  	width:'300px',    style:'text-align:center'},
	        {caption: ["선택"], 	ref: 'delYn',   type:'output',  width:'100PX',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if(strValue== null || strValue == ""){
		        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"apcVrtyDataGrid\", " + nRow + ", " + nCol + ")'>추가</button>";
		        	}else{
		                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_deleteVrty(" + nRow + ")'>삭제</button>";
		        	}
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 	ref: 'itemCd',   	type:'input',  hidden : true}

	    ];
	    apcVrtyDataGrid = _SBGrid.create(SBGridProperties);
	    fn_selectApcVrtyList();
	}

	async function fn_selectApcVrtyList(){
		fn_callSelectApcVrtyList();
	}

	async function fn_callSelectApcVrtyList(){

		let nRow = apcItemDataGrid.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = apcItemDataGrid.getRowData(nRow);
		SBUxMethod.set("vrtyItemNm", rowData.itemNm);
		let apcCd = SBUxMethod.get("apcCd");
		let itemCd = rowData.itemCd;
		let vrtyNm = SBUxMethod.get("vrtyNm");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectApcVrtyList.do", {apcCd : apcCd, itemCd : itemCd, vrtyNm : vrtyNm});
        let data = await postJsonPromise;
        let newApvVrtyGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let vrtyVO = {
					vrtyCd 		: item.vrtyCd
				  , vrtyNm 		: item.vrtyNm
				  , apcCd		: apcCd
				  , delYn 		: item.delYn
				  , itemCd		: item.itemCd
				}
				newApvVrtyGridData.push(vrtyVO);
			});
        	apcVrtyGridData = newApvVrtyGridData;
        	apcVrtyDataGrid.rebuild();
        	apcVrtyDataGrid.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_apcVrtyList(){
		await fn_selectVrtyList();
		fn_selectApcVrtyList();
	}

	async function fn_addVrty(nRow){
		let vrtyVO = vrtyDataGrid.getRowData(nRow);
		fn_callInsertApcVrty(vrtyVO);
	}

	async function fn_callInsertApcVrty(cmnsVrtyVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/insertApcVrty.do", cmnsVrtyVO);
        let data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		fn_apcVrtyList();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
	}

	async function fn_deleteVrty(nRow){
		let vrtyVO = apcVrtyDataGrid.getRowData(nRow);
		fn_callDeleteVrty(vrtyVO)
	}

	async function fn_callDeleteVrty(cmnsVrtyVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteApcVrty.do", cmnsVrtyVO);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		fn_apcVrtyList();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
	}

	async function fn_insertApcVrtyList(){

	}

	async function fn_callInsertApcVrtyList(vrtyList){

	}

</script>
</html>