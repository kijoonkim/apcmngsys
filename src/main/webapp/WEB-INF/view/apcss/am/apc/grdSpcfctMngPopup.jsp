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
						<sbux-button id="btnSearchGrd" name="btnSearchGrd" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectGrdSpcfctList()"></sbux-button>
						<sbux-button id="btnInsertGrd" name="btnInsertGrd" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertApcGrdList"></sbux-button>
						<sbux-button id="btnEndGrd" name="btnEndGrd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('grdSpcfctMngModal')"></sbux-button>

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
									<sbux-input id=spcfct-inp-apcNm name="spcfct-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row">품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-select id="spcfct-select-itemCd" name="spcfct-select-itemCd" uitype="single" jsondata-ref="jsonComItemCd" unselected-text="선택" class="form-control input-sm"></sbux-select>
								</th>
								<th></th>
								<th></th>
								<th></th>
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

					<div class="col-sm-4">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>규격등록</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdSpcfct" style="height:159px; width: 100%;"></div>
						</div>
					</div>


					<div class="col-sm-4">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>&nbsp;</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdApcSpcfct" style="height:159px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>등급등록</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdGrd" style="height:159px; width: 100%;"></div>
						</div>
					</div>
				</div>

			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonComItemCd = [];

	var jsonGrd = [];
	var jsonSpcfct = [];
	var jsonApcSpcfct = [];

	const fn_initSBSelectItem = async function() {
		gfn_setApcItemSBSelect("spcfct-select-itemCd", jsonComItemCd, SBUxMethod.get("apcCd"));
	}
	function fn_createGrdGrid() {

		SBUxMethod.set("spcfct-inp-apcNm", SBUxMethod.get("apcNm"));

   		 var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdGrd';
	    SBGridProperties.id = 'grdGrd';
	    SBGridProperties.jsonref = 'jsonGrd';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["코드"],     	ref: 'grdCd',  type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],     	ref: 'grdNm',  type:'input',  width:'150px',    style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdGrd\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdGrd\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 	ref: 'itemCd',   	type:'input',  hidden : true}

	    ];
	    grdGrd = _SBGrid.create(SBGridProperties);
	}

	async function fn_selectGrdList(){
		fn_callSelectGrdList()
	}


	async function fn_callSelectGrdList(){
		let apcCd = SBUxMethod.get("apcCd");
		let itemCd = SBUxMethod.get("spcfct-select-itemCd");
		let postJsonPromise = gfn_postJSON("/am/cmns/selectApcGrdList.do", {apcCd : apcCd, itemCd : itemCd});
	    let data = await postJsonPromise;
	    let newGrdGridData = [];
	    try{
	    	data.resultList.forEach((item, index) => {
				let grdVO = {
					grdCd 		: item.grdCd
				  , grdNm 		: item.grdNm
				  , apcCd		: apcCd
				  , itemCd		: item.itemCd
				  , delYn		: item.delYn
				}
				newGrdGridData.push(grdVO);
			});
	    	jsonGrd = newGrdGridData;
	    	grdGrd.rebuild();
	    	grdGrd.addRow(true);
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	function fn_createGrdSpcfct() {

   		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpcfct';
	    SBGridProperties.id = 'grdSpcfct';
	    SBGridProperties.jsonref = 'jsonSpcfct';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["코드"],     ref: 'spcfctCd',  type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],     ref: 'spcfctNm',  type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["선택"], 	ref: 'empty',   type:'output',  width:'100PX',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_addSpcfct(" + nRow + ")'>선택</button>";
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 	ref: 'itemCd',   	type:'input',  hidden : true}

	    ];
	    grdSpcfct = _SBGrid.create(SBGridProperties);
	}

	async function fn_selectSpcfctList(){
		fn_callSelectSpcfctList()
	}

	async function fn_callSelectSpcfctList(){
		let apcCd = SBUxMethod.get("apcCd");
		let itemCd = SBUxMethod.get("spcfct-select-itemCd");
		let postJsonPromise = gfn_postJSON("/am/cmns/selectCmnsSpcfctList.do", {apcCd : apcCd, itemCd : itemCd});
	    let data = await postJsonPromise;
	    let newSpcfctGridData = [];
	    try{
	    	data.resultList.forEach((item, index) => {
				let spcfctVO = {
					spcfctCd 	: item.spcfctCd
				  , spcfctNm 	: item.spcfctNm
				  , apcCd		: apcCd
				  , itemCd		: item.itemCd
				}
				newSpcfctGridData.push(spcfctVO);
			});
	    	jsonSpcfct = newSpcfctGridData;
	    	grdSpcfct.rebuild();
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	function fn_createGrdApcSpcfct() {

   		 var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdApcSpcfct';
	    SBGridProperties.id = 'grdApcSpcfct';
	    SBGridProperties.jsonref = 'jsonApcSpcfct';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["코드"],     ref: 'spcfctCd',  type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],     ref: 'spcfctNm',  type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["삭제"], 	ref: 'empty',   type:'output',  width:'100PX',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_deleteSpcfct(" + nRow + ")'>삭제</button>";
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 	ref: 'itemCd',   	type:'input',  hidden : true}

	    ];
	    grdApcSpcfct = _SBGrid.create(SBGridProperties);
	}

	async function fn_selectApcSpcfctList(){
		fn_callSelectApcSpcfctList()
	}

	async function fn_callSelectApcSpcfctList(){
		let apcCd = SBUxMethod.get("apcCd");
		let itemCd = SBUxMethod.get("spcfct-select-itemCd");
		let postJsonPromise = gfn_postJSON("/am/cmns/selectApcSpcfctList.do", {apcCd : apcCd, itemCd : itemCd});
	    let data = await postJsonPromise;
	    let newApcSpcfctGridData = [];
	    try{
	    	data.resultList.forEach((item, index) => {
				let spcfctVO = {
					spcfctCd 	: item.spcfctCd
				  , spcfctNm 	: item.spcfctNm
				  , apcCd		: item.apcCd
				  , itemCd		: item.itemCd
				}
				newApcSpcfctGridData.push(spcfctVO);
			});
	    	jsonApcSpcfct = newApcSpcfctGridData;
	    	grdApcSpcfct.rebuild();
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	function fn_selectGrdSpcfctList(){

		if(jsonComItemCd.length == 0){
			alert("품목 먼저 등록해주세요.");
			return;
		}
		if(SBUxMethod.get("spcfct-select-itemCd") == null || SBUxMethod.get("spcfct-select-itemCd") == ""){
			alert("품목을 선택해주세요.");
			return;
		}

		fn_selectSpcfctList();
		fn_selectApcSpcfctList();
		fn_selectGrdList();
	}

	async function fn_apcSpcfctList(){
		fn_selectSpcfctList();
		fn_selectApcSpcfctList();
	}

	async function fn_addSpcfct(nRow){
		let spcfctVO = grdSpcfct.getRowData(nRow);
		fn_callInsertApcSpcfct(spcfctVO);
	}

	async function fn_callInsertApcSpcfct(cmnsSpcfctVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/insertApcSpcfct.do", cmnsSpcfctVO);
        let data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		fn_apcSpcfctList();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
	}

	async function fn_deleteSpcfct(nRow){
		let spcfctVO = grdApcSpcfct.getRowData(nRow);
		fn_callDeleteSpcfct(spcfctVO)
	}

	async function fn_callDeleteSpcfct(cmnsSpcfctVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteApcSpcfct.do", cmnsSpcfctVO);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		fn_apcSpcfctList();
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
	}

	async function fn_insertApcGrdList(){
		let gridData = grdGrd.getGridDataAll();
		let insertList = [];
		let updateList = [];
		let insertListCnt = 0;
		let updateListCnt = 0;
		for(var i=1; i<=gridData.length; i++ ){
			if(grdGrd.getRowData(i).delYn == 'N'){

				if(grdGrd.getRowData(i).grdNm == null || grdGrd.getRowData(i).grdNm == ""){
					alert("등급 명은 필수 값 입니다.");
					return;
				}

				if(grdGrd.getRowStatus(i) === 3){
					insertList.push(grdGrd.getRowData(i));
				}
				if(grdGrd.getRowStatus(i) === 2){
					updateList.push(grdGrd.getRowData(i));
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
				insertListCnt = await fn_callInsertGrdList(insertList);
			}
			if(updateList.length > 0){
				updateListCnt = await fn_callUpdateGrdList(updateList);
			}
			if(insertListCnt + updateListCnt > 0 ){
				fn_selectGrdList();
				alert("등록 되었습니다.");
			}
		}
	}

	async function fn_callInsertGrdList(cmnsGrdList){
		let postJsonPromise = gfn_postJSON("/am/cmns/insertApcGrdList.do", cmnsGrdList);
        let data = await postJsonPromise;

        try{
        	console.log("data >>> "+ data.insertedCnt);
       		return data.insertedCnt;

        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}

	}

	async function fn_callUpdateGrdList(cmnsGrdList){
		let postJsonPromise = gfn_postJSON("/am/cmns/updateApcGrdList.do", cmnsGrdList);
        let data = await postJsonPromise;
        try{
       		return data.updateCnt;

        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}
	}


	async function fn_deleteGrd(comsGrd){
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteApcGrd.do", comsGrd);
        let data = await postJsonPromise;
        try{
       		return data.deleteCnt;

        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}
	}



</script>
</html>