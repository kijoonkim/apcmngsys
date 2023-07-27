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
				<div>
					<p>
						<span style="font-weight:bold;">APC에서 관리하고 있는 품목과 품종을 선택하세요.(여러가지 품목과 품종을 관리할 수 있습니다.)</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">품목은 농식품부 표준코드를 준수하며, 품종은 APC별 사용자 정의로 등록할 수 있습니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchItem" name="btnSearchItem" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectItemList()"></sbux-button>
					<sbux-button id="btnInsertItem" name="btnInsertItem" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertApcVrtyList"></sbux-button>
					<sbux-button id="btnEndItem" name="btnEndItem" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-item')"></sbux-button>
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
									<sbux-input id=item-inp-apcNm name="item-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row">품목명</th>
								<th  style="border-right-style: hidden;">
									<sbux-input id=item-inp-itemNm name="item-inp-itemNm" uitype="text" class="form-control input-sm"></sbux-input>
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

					<div class="col-sm-6">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>농수축산물표준품목</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdItem" style="height:159px; width: 100%;"></div>
						</div>
					</div>


					<div class="col-sm-6">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>APC관리품목</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdApcItem" style="height:159px; width: 100%;"></div>
						</div>
					</div>
					<b>&nbsp;</b>
				</div>
				<div class="">
					<table class="table table-bordered tbl_row tbl_fixed mg_t10">
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
								<th scope="row">품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id=vrty-inp-itemNm name="vrty-inp-itemNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
									<sbux-input id=vrty-inp-itemCd name="vrty-inp-itemCd" uitype="hidden" class="form-control input-sm"></sbux-input>
								</th>
								<th scope="row">품종명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id=vrty-inp-vrtyNm name="vrty-inp-vrtyNm" uitype="text" class="form-control input-sm"></sbux-input>
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
								<li><span>농수축산물표준품종</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdVrty" style="height:157px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>APC관리품종</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdApcVrty" style="height:157px; width: 100%;"></div>
						</div>
					</div>
				</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>

	</section>
</body>
<script type="text/javascript">

	var jsonItem = []; // 그리드의 참조 데이터 주소 선언
	async function fn_itemCreateGrid() {
		SBUxMethod.set("item-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdItem';
	    SBGridProperties.id = 'grdItem';
	    SBGridProperties.jsonref = 'jsonItem';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["코드"],     ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],     ref: 'itemNm',  type:'output',  width:'280px',    style:'text-align:center'},
	        {caption: ["선택"], 	ref: 'empty',   type:'output',  width:'80PX',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_addItem(" + nRow + ")'>선택</button>";
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}

	    ];
	    grdItem = _SBGrid.create(SBGridProperties);
	    fn_selectItemList();
	}

	async function fn_selectItemList(){
		fn_callSelectItemList()
	}

	async function fn_callSelectItemList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
		let itemNm = SBUxMethod.get("item-inp-itemNm");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectCmnsItemList.do", {apcCd : apcCd, itemNm : itemNm});
        let data = await postJsonPromise;
        let newJsonItem = [];
        try{
        	data.resultList.forEach((item, index) => {
				let itemVO = {
					itemCd 		: item.itemCd
				  , itemNm 		: item.itemNm
				  , apcCd		: apcCd
				}
				newJsonItem.push(itemVO);
			});
        	jsonItem = newJsonItem;
        	grdItem.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	var jsonApcItem = []; // 그리드의 참조 데이터 주소 선언
	async function fn_apcItemCreateGrid() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdApcItem';
	    SBGridProperties.id = 'grdApcItem';
	    SBGridProperties.jsonref = 'jsonApcItem';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["코드"],     	ref: 'itemCd',  	type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["명칭"],     	ref: 'itemNm',  	type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["품종"],     ref: 'vrtrCnt',  	type:'output',  width:'60px',    style:'text-align:center'},
	        {caption: ["규격"],     ref: 'spcfctCnt',  	type:'output',  width:'60px',    style:'text-align:center'},
	        {caption: ["등급"],     ref: 'grdCnt',  	type:'output',  width:'60px',    style:'text-align:center'},
	        {caption: ["삭제"], 	ref: 'empty',   type:'output',  width:'80PX',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_deleteItem(" + nRow + ")'>삭제</button>";
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}

	    ];
	    grdApcItem = _SBGrid.create(SBGridProperties);
	    grdApcItem.bind('click', fn_apcVrtyList);
	    fn_selectApcItemList();
	}

	async function fn_selectApcItemList(){
		fn_callSelectApcItemList();
	}

	async function fn_callSelectApcItemList(){

		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectApcCmnsItemList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        let newJsonApcItem = [];
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
				newJsonApcItem.push(itemVO);
			});
        	jsonApcItem = newJsonApcItem;
        	grdApcItem.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_addItem(nRow){
		let itemVO = grdItem.getRowData(nRow);
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
		let itemVO = grdApcItem.getRowData(nRow);
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
	var jsonVrty = []; // 그리드의 참조 데이터 주소 선언
	async function fn_vrtyCreateGrid() {
		jsonVrty = [];
		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdVrty';
	    SBGridProperties.id = 'grdVrty';
	    SBGridProperties.jsonref = 'jsonVrty';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["코드"],     ref: 'vrtyCd',  type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],     ref: 'vrtyNm',  type:'output',  width:'280px',    style:'text-align:center'},
	        {caption: ["선택"], 	ref: 'empty',   type:'output',  width:'80PX',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_addVrty(" + nRow + ")'>선택</button>";
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 	ref: 'itemCd',   	type:'input',  hidden : true}

	    ];
	    grdVrty = _SBGrid.create(SBGridProperties);
	    fn_selectVrtyList();
	}

	async function fn_selectVrtyList(){
		fn_callSelectVrtyList();
	}

	async function fn_callSelectVrtyList(){

		let nRow = grdApcItem.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = grdApcItem.getRowData(nRow);
		SBUxMethod.set("vrty-inp-itemNm", rowData.itemNm);
		let apcCd = SBUxMethod.get("inp-apcCd");
		let itemCd = rowData.itemCd;
		let vrtyNm = SBUxMethod.get("vrty-inp-vrtyNm");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectCmnsVrtyList.do", {apcCd : apcCd, itemCd : itemCd, vrtyNm : vrtyNm});
        let data = await postJsonPromise;
        let newJsonVrty = [];
        try{
        	data.resultList.forEach((item, index) => {
				let vrtyVO = {
					vrtyCd 		: item.vrtyCd
				  , vrtyNm 		: item.vrtyNm
				  , apcCd		: apcCd
				  , itemCd		: item.itemCd
				}
				newJsonVrty.push(vrtyVO);
			});
        	jsonVrty = newJsonVrty;
        	grdVrty.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }

        //fn_selectApcVrtyList();
	}

	// APC 품종 목록 조회
	var jsonApcVrty = []; // 그리드의 참조 데이터 주소 선언
	async function fn_apcVrtyCreateGrid() {
		let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdApcVrty';
	    SBGridProperties.id = 'grdApcVrty';
	    SBGridProperties.jsonref = 'jsonApcVrty';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["코드"],     ref: 'vrtyCd',  type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],     ref: 'vrtyNm',  type:'input',  	width:'280px',    style:'text-align:center'},
	        {caption: ["선택"], 	ref: 'delYn',   type:'output',  width:'80PX',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if(strValue== null || strValue == ""){
		        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdApcVrty\", " + nRow + ", " + nCol + ")'>추가</button>";
		        	}else{
		                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_deleteVrty(" + nRow + ")'>삭제</button>";
		        	}
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 	ref: 'itemCd',   	type:'input',  hidden : true}

	    ];
	    grdApcVrty = _SBGrid.create(SBGridProperties);
	    fn_selectApcVrtyList();
	}

	async function fn_selectApcVrtyList(){
		fn_callSelectApcVrtyList();
	}

	async function fn_callSelectApcVrtyList(){

		let nRow = grdApcItem.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = grdApcItem.getRowData(nRow);
		SBUxMethod.set("vrtyItemNm", rowData.itemNm);
		let apcCd = SBUxMethod.get("inp-apcCd");
		let itemCd = rowData.itemCd;
		let vrtyNm = SBUxMethod.get("item-inp-vrtyNm");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectApcVrtyList.do", {apcCd : apcCd, itemCd : itemCd, vrtyNm : vrtyNm});
        let data = await postJsonPromise;
        let newJsonApcVrty = [];
        try{
        	data.resultList.forEach((item, index) => {
				let vrtyVO = {
					vrtyCd 		: item.vrtyCd
				  , vrtyNm 		: item.vrtyNm
				  , apcCd		: apcCd
				  , delYn 		: item.delYn
				  , itemCd		: item.itemCd
				}
				newJsonApcVrty.push(vrtyVO);
			});
        	jsonApcVrty = newJsonApcVrty;
        	grdApcVrty.rebuild();
        	grdApcVrty.setCellDisabled(0, 0, grdApcVrty.getRows() - 1, grdApcVrty.getCols() - 1, true);
        	grdApcVrty.addRow();
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
		let vrtyVO = grdVrty.getRowData(nRow);
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
		let vrtyVO = grdApcVrty.getRowData(nRow);
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

		let gridData = grdApcVrty.getGridDataAll();
		let insertList = [];
		let insertedCnt = 0;
		for(var i=1; i<=gridData.length; i++ ){
			if(grdApcVrty.getRowData(i).delYn == 'N'){

				if(grdApcVrty.getRowData(i).vrtyNm == null || grdApcVrty.getRowData(i).vrtyNm == ""){
					alert("품종 명은 필수 값 입니다.");
					return;
				}

				if(grdApcVrty.getRowStatus(i) === 3){
					insertList.push(grdApcVrty.getRowData(i));
				}
			}
		}
		if(insertList.length == 0 && updateList.length == 0){
			alert("등록 할 내용이 없습니다.");
			return;
		}
		let regMsg = "등록 하시겠습니까?";
		if(confirm(regMsg)){

			if(insertList.length > 0){
				insertedCnt = await fn_callInsertApcVrtyList(insertList);
			}
			if(insertedCnt > 0 ){
				fn_apcVrtyList();
				alert("등록 되었습니다.");
			}
		}

	}

	async function fn_callInsertApcVrtyList(vrtyList){
		let postJsonPromise = gfn_postJSON("/am/cmns/insertApcVrtyList.do", vrtyList);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		return data.insertedCnt;
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
	}

</script>
</html>