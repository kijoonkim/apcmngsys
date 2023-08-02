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
			<div class="box-header">
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSearchPrdcr" name="btnSearchPrdcr" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchPrdcr"></sbux-button>
						<sbux-button id="btnEditorPrdcr" name="btnEditorPrdcr" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="fn_editorPrdcr"></sbux-button>
						<sbux-button id="btnSavePrdcr" name="btnSavePrdcr" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_insertPrdcr"disabled></sbux-button>
						<sbux-button id="btnEndPrdcr" name="btnEndPrdcr" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-prdcr')"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="prdcr-inp-apcNm" name="prdcr-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">생산자명</th>
							<th class="td_input">
								<sbux-input uitype="text" id="prdcr-inp-prdcrNm" name="prdcr-inp-prdcrNm" class="form-control input-sm"
								placeholder="초성검색 기능입니다." autocomplete-ref="autoCompleteDataJsonPopup" autocomplete-text="name"
    							onkeyup="keyUpInp(prdcr-inp-prdcrNm, 'prdcr-inp-prdcrNm', 'true')"></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdPrdcr" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonItem 		= [];	// 대표품종 rprsItemCd	Grid
	var jsonVrty 		= [];	// 대표품종 rprsVrtyCd	Grid
	var jsonComGdsSeCd 		= [];	// 상품구분 gdsSeCd		Grid
	var jsonComWrhsSeCd 	= [];	// 입고구분 wrhsSeCd	Grid
	var jsonComTrsprtSeCd 	= [];	// 운송구분 trsprtSeCd	Grid
	var jsonComClclnCrtr 	= [];	// 정산기준 clclnCrtr	Grid
	var autoCompleteDataJsonPopup = [];	// 초성검색
	var jsonDataPrdcrPopup = [];	// 초성검색 리스트

	const fn_initSBSelectPrdcr = async function() {

		// 그리드 SB select
		await gfn_setApcItemSBSelect('grdPrdcr', 	jsonItem, gv_apcCd);		// 품목
		await gfn_setApcVrtySBSelect('grdPrdcr', 	jsonVrty, gv_apcCd);		// 품종
		await gfn_setComCdGridSelect('grdPrdcr', jsonComGdsSeCd, 		'GDS_SE_CD');		// 상품구분
		await gfn_setComCdGridSelect('grdPrdcr', jsonComWrhsSeCd, 	'WRHS_SE_CD');		// 입고구분
		await gfn_setComCdGridSelect('grdPrdcr', jsonComTrsprtSeCd, 	'TRSPRT_SE_CD');	// 운송구분
		await gfn_setComCdGridSelect('grdPrdcr', jsonComClclnCrtr, 	'CLCLN_CRTR');		// 정산기준

	 	jsonDataPrdcrPopup =  await gfn_getPrdcrs(gv_apcCd);

	}


	function keyUpInp(prdcrNm, modulId, popupYn){
		if(popupYn == 'true'){
			console.log("jsonDataPrdcrPopup", jsonDataPrdcrPopup);
			autoCompleteDataJsonPopup = gfn_getFrst(prdcrNm, jsonDataPrdcrPopup, autoCompleteDataJsonPopup);
			console.log("autoCompleteDataJsonPopup", autoCompleteDataJsonPopup);
		}else{
	    	autoCompleteDataJson = gfn_getFrst(prdcrNm, jsonDataPrdcr, autoCompleteDataJson);
	    	console.log("jsonDataPrdcr", jsonDataPrdcr);
	    	console.log("autoCompleteDataJson", autoCompleteDataJson);
		}
    	SBUxMethod.changeAutocompleteData(modulId, true);
    }



	var jsonPrdcr = [];
	async function fn_createPrdcrGrid() {
		SBUxMethod.attr('btnInsertPrdcr', 'disabled', true);
		SBUxMethod.set("prdcr-inp-apcNm", gv_apcNm);
		await fn_initSBSelectPrdcr();
		jsonPrdcr = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcr';
	    SBGridProperties.id = 'grdPrdcr';
	    SBGridProperties.jsonref = 'jsonPrdcr';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ['생산자명'], 	ref: 'prdcrNm', 	width: '100px', type: 'input', style:'text-align:center'},
	        {caption: ['대표품목'], 	ref: 'rprsItemCd', 	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonItem', label:'label', value:'value', displayui : true}},
	        {caption: ['대표품종'], 	ref: 'rprsVrtyCd', 	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonVrty', label:'label', value:'value', displayui : true}},
	        {caption: ['상품구분'], 	ref: 'gdsSeCd', 	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonComGdsSeCd', label:'label', value:'value',  displayui : true}},
	        {caption: ['입고구분'], 	ref: 'wrhsSeCd', 	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonComWrhsSeCd', label:'label', value:'value',  displayui : true}},
	        {caption: ['운송구분'], 	ref: 'trsprtSeCd', 	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonComTrsprtSeCd', label:'label', value:'value', displayui : true}},
	        {caption: ['정산기준'], 	ref: 'clclnCrtr', 	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonComClclnCrtr', label:'label', value:'value', displayui : true}},
	        {caption: ['차량번호'], 	ref: 'vhclno', 		width: '100px', type: 'input', style:'text-align:center'},
	        {caption: ['비고'], 		ref: 'rmrk', 		width: '200px', type: 'input', style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger btnDisabled' onClick='fn_procRowPrdcr(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger btnDisabled' onClick='fn_procRowPrdcr(\"DEL\", " + nRow + ")'>삭제</button>";
            	}
		    }},
	        {caption: ['APC코드'], 		ref: 'apcCd', 		hidden : true},
	        {caption: ['생산자코드'], 	ref: 'prdcrCd', 	hidden : true},

	    ];
	    grdPrdcr = _SBGrid.create(SBGridProperties);
	    fn_searchPrdcr();
	}


	async function fn_searchPrdcr(){
		fn_callSelectPrdcrList();
	}

	async function fn_callSelectPrdcrList(){
		let apcCd 	= gv_apcCd;
		let prdcrNm	= SBUxMethod.get("prdcr-inp-prdcrNm");
		let postJsonPromise = gfn_postJSON("/am/cmns/selectPrdcrList.do", {apcCd : apcCd, prdcrNm : prdcrNm});
        let data = await postJsonPromise;
        let newJsonPrdcr = [];
        try{
        	data.resultList.forEach((item, index) => {
				let prdcrVO = {
					prdcrCd		: item.prdcrCd
				  , prdcrNm 	: item.prdcrNm
				  , rprsItemCd 	: item.rprsItemCd
				  , rprsVrtyCd 	: item.rprsVrtyCd
				  , gdsSeCd 	: item.gdsSeCd
				  , wrhsSeCd 	: item.wrhsSeCd
				  , trsprtSeCd 	: item.trsprtSeCd
				  , clclnCrtr 	: item.clclnCrtr
				  , vhclno 		: item.vhclno
				  , delYn 		: item.delYn
				  , rmrk 		: item.rmrk
				  , apcCd 		: item.apcCd
				}
				newJsonPrdcr.push(prdcrVO);
			});
        	jsonPrdcr = newJsonPrdcr;
        	grdPrdcr.rebuild();
        	grdPrdcr.setCellDisabled(0, 0, grdPrdcr.getRows() - 1, grdPrdcr.getCols() - 1, true);
        	$('.btnDisabled').attr('disabled', true);
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}


	function fn_procRowPrdcr(gubun, nRow, nCol){
		if (gubun === "ADD") {
			grdPrdcr.setCellData(nRow, nCol, "N", true);
			grdPrdcr.setCellData(nRow, 5, gv_apcCd, true);
			grdPrdcr.addRow(true);
		}
		else if(gubun === "DEL"){
			if(grdPrdcr.getRowStatus(nRow) == 0 || grdPrdcr.getRowStatus(nRow) == 2){
        		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
        		if(confirm(delMsg)){
        			var prdcrVO = grdPrdcr.getRowData(nRow);
        			fn_deletePrdcr(prdcrVO);
        			grdPrdcr.deleteRow(nRow);
        		}
        	}else{
        		grdPrdcr.deleteRow(nRow);
        	}
		}
	}

	function fn_editorPrdcr(){
    	$('.btnDisabled').attr('disabled', false);
		grdPrdcr.setCellDisabled(0, 0, grdPrdcr.getRows() - 1, grdPrdcr.getCols() - 1, false);
		grdPrdcr.addRow(true);
		SBUxMethod.attr('btnInsertPrdcr', 'disabled', false);
	}

	async function fn_insertPrdcr(){
		let gridData = grdPrdcr.getGridDataAll();
		let insertList = [];
		let updateList = [];
		let insertCnt = 0;
		let updateCnt = 0;
		for(var i=1; i<=gridData.length; i++ ){
			if(grdFclt.getRowData(i).delYn == 'N'){

				if(grdPrdcr.getRowData(i).prdcrNm == null || grdPrdcr.getRowData(i).prdcrNm == ""){
					alert("생산자 명은 필수 값 입니다.");
					return;
				}

				if(grdPrdcr.getRowData(i).prdcrNm == null || grdPrdcr.getRowData(i).prdcrNm == ""){
					alert("생산자 명은 필수 값 입니다.");
					return;
				}

				if(grdPrdcr.getRowStatus(i) === 3){
					insertList.push(grdPrdcr.getRowData(i));
				}
				if(grdPrdcr.getRowStatus(i) === 2){
					updateList.push(grdPrdcr.getRowData(i));
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
				insertCnt = await fn_callInsertPrdcrList(insertList);
			}
			if(updateList.length > 0){
				updateCnt = await fn_callUpdatePrdcrList(updateList);
			}
			if(insertCnt + updateCnt > 0 ){
				fn_searchPrdcr();
				alert("등록 되었습니다.");
			}
		}
	}

	async function fn_callInsertPrdcrList(procrList){
		let postJsonPromise = gfn_postJSON("/am/cmns/insertPrdcrList.do", procrList);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		return data.insertedCnt;
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_callUpdatePrdcrList(procrList){
		let postJsonPromise = gfn_postJSON("/am/cmns/updatePrdcrList.do", procrList);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		return data.updatedCnt;
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_deletePrdcr(prdcrVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/deletePrdcr.do", prdcrVO);
        let data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		alert("삭제 되었습니다.");
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	function fn_modalPrdcr(){
		fn_createPrdcrGrid();
	}
</script>
</html>