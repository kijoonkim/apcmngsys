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
						<span style="font-weight:bold;">선택한 품목별로 APC에서 관리하는 등급과 규격을 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">등급 등록은 정산에 적용되는 정산기준 등급과 단가를 등록하세요.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchGrd" name="btnSearchGrd" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectGrdSpcfctList()"></sbux-button>
					<sbux-button id="btnSaveGrd" name="btnSaveGrd" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveApcGrdList"></sbux-button>
					<sbux-button id="btnEndGrd" name="btnEndGrd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-grdSpcfct')"></sbux-button>
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
									<sbux-input id=spcfct-inp-apcNm name="spcfct-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row">품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-select id="spcfct-select-itemCd" style="background-color:#ffffff;" name="spcfct-select-itemCd" uitype="single" jsondata-ref="jsonComItemCd" unselected-text="선택" class="form-control input-sm"></sbux-select>
								</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
							</tr>
						</tbody>
					</table>

				</div>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="row">

					<div class="col-sm-8">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>규격등록</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdApcSpcfct" style="height:283px; width: 100%;"></div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="ad_tbl_top"  style="width: 98%;">
							<ul class="ad_tbl_count">
								<li><span>등급등록</span></li>
							</ul>
						</div>
						<div>
							<div id="sb-area-grdGrd" style="height:283px; width: 100%;"></div>
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
	var jsonApcSpcfct = [];
	var jsonSpcfctUnitCd = [];
	var jsonSpcfctPckgSttsCd = [];
	var jsonUseYn = [];

	const fn_initSBSelectItem = async function() {
		await gfn_setComCdGridSelect('grdApcSpcfct', jsonSpcfctUnitCd, 		'UNIT_CD', '0000');			// 단위
		await gfn_setComCdGridSelect('grdApcSpcfct', jsonSpcfctPckgSttsCd, 	'PCKG_STTS_CD', '0000');	// 포장구분
		await gfn_setComCdGridSelect('grdApcSpcfct', jsonUseYn, 			'REVERSE_YN', '0000');		// 포장구분
		await gfn_setApcItemSBSelect("spcfct-select-itemCd", jsonComItemCd, gv_apcCd);	// APC 품목
	}
	function fn_createGrdGrid() {

		SBUxMethod.set("spcfct-inp-apcNm", SBUxMethod.get("inp-apcNm"));

   		 var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdGrd';
	    SBGridProperties.id = 'grdGrd';
	    SBGridProperties.jsonref = 'jsonGrd';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.frozenrows = 1
	    SBGridProperties.columns = [
	        {caption: ["명칭"],     	ref: 'grdNm',  type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["사용유무"], 	ref: 'delYn',  type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonUseYn', label:'label', value:'value',  displayui : false}},
	        {caption: ["순번"],     	ref: 'sn',  type:'input',  width:'60px',    style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
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
		let apcCd = gv_apcCd;
		let itemCd = SBUxMethod.get("spcfct-select-itemCd");
		let postJsonPromise = gfn_postJSON("/am/cmns/selectApcGrdList.do", {apcCd : apcCd, itemCd : itemCd});
	    let data = await postJsonPromise;
	    let newGrdGridData = [];
	    try{
	    	data.resultList.forEach((item, index) => {
				let grdVO = {
					grdCd 		: item.grdCd
				  , grdNm 		: item.grdNm
				  , sn			: item.sn
				  , apcCd		: apcCd
				  , itemCd		: item.itemCd
				  , delYn		: item.delYn
				}
				newGrdGridData.push(grdVO);
			});
	    	jsonGrd = newGrdGridData;
	    	grdGrd.rebuild();
	    	grdGrd.addRow(true);
	    	console.log("asdasdsd");
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	function fn_createGrdApcSpcfct() {
		fn_initSBSelectItem();
   		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdApcSpcfct';
	    SBGridProperties.id = 'grdApcSpcfct';
	    SBGridProperties.jsonref = 'jsonApcSpcfct';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.frozenrows = 1;
	    SBGridProperties.columns = [
	        {caption: ["규격명"],   ref: 'spcfctNm',  	type:'input',  width:'150px',    style:'text-align:center'},
	        {caption: ["중량단위"], ref: 'unitCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonSpcfctUnitCd', 	itemcount: 3, label:'label', value:'value', displayui : false}},
	        {caption: ["포장구분"], ref: 'pckgSttsCd',   	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonSpcfctPckgSttsCd', itemcount: 10, label:'label', value:'value', displayui : false}},
	        {caption: ["평균입수"],	ref: 'bxGdsQntt',  	type:'input',  width:'70px',    style:'text-align:center'},
	        {caption: ["단중"],     ref: 'wght',  		type:'input',  width:'70px',    style:'text-align:center'},
	        {caption: ["사용유무"], 	ref: 'delYn',  type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonUseYn', label:'label', value:'value',  displayui : false}},
			{caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdApcSpcfct\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdApcSpcfct\", " + nRow + ")'>삭제</button>";
	        	}
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
		let apcCd = SBUxMethod.get("inp-apcCd");
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
				  , unitCd		: item.unitCd
				  , pckgSttsCd	: item.pckgSttsCd
				  , bxGdsQntt	: item.bxGdsQntt
				  , wght		: item.wght
				  , useYn		: item.delYn
				  , delYn		: item.delYn
				}
				newApcSpcfctGridData.push(spcfctVO);
			});
	    	jsonApcSpcfct = newApcSpcfctGridData;
	    	grdApcSpcfct.rebuild();
	    	grdApcSpcfct.addRow(true);
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

		fn_selectApcSpcfctList();
		fn_selectGrdList();
	}

	async function fn_apcSpcfctList(){
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
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
	}

	async function fn_saveApcGrdList(){
		let spcfctGridData = grdApcSpcfct.getGridDataAll();
		let GrdGridData = grdGrd.getGridDataAll();
		let insertSpcfctList = [];
		let updateSpcfctList = [];
		let insertGrdList = [];
		let updateGrdList = [];
		let insertSpcfctCnt = 0;
		let updateSpcfctCnt = 0;
		let insertGrdCnt = 0;
		let updateGrdCnt = 0;

		for(var i=1; i<=spcfctGridData.length; i++ ){
			if(grdApcSpcfct.getRowData(i).delYn == 'N'){

				if(grdApcSpcfct.getRowData(i).spcfctNm == null || grdApcSpcfct.getRowData(i).spcfctNm == ""){
					alert("규격 명은 필수 값 입니다.");
					return;
				}
				if(grdApcSpcfct.getRowData(i).unitCd == null || grdApcSpcfct.getRowData(i).unitCd == ""){
					alert("단위는 필수 선택 입니다.");
					return;
				}
				if(grdApcSpcfct.getRowData(i).pckgSttsCd == null || grdApcSpcfct.getRowData(i).pckgSttsCd == ""){
					alert("포장구분은 필수 선택 입니다.");
					return;
				}

				if(grdApcSpcfct.getRowStatus(i) === 3){
					insertSpcfctList.push(grdApcSpcfct.getRowData(i));
				}
				if(grdApcSpcfct.getRowStatus(i) === 2){
					updateSpcfctList.push(grdApcSpcfct.getRowData(i));
				}
			}
		}

		for(var i=1; i<=GrdGridData.length; i++ ){
			if(grdGrd.getRowData(i).delYn == 'N'){

				if(grdGrd.getRowData(i).grdNm == null || grdGrd.getRowData(i).grdNm == ""){
					alert("등급 명은 필수 값 입니다.");
					return;
				}

				if(grdGrd.getRowStatus(i) === 3){
					insertGrdList.push(grdGrd.getRowData(i));
				}
				if(grdGrd.getRowStatus(i) === 2){
					updateGrdList.push(grdGrd.getRowData(i));
				}
			}
		}
		if(insertSpcfctList.length == 0 && updateSpcfctList.length == 0 && insertGrdList.length == 0 && updateGrdList.length == 0){
			alert("저장 할 내용이 없습니다.");
			return;
		}
		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			if(insertSpcfctList.length > 0){
				insertSpcfctCnt = await fn_callInsertSpcfctList(insertSpcfctList);
			}
			if(updateSpcfctList.length > 0){
				updateSpcfctCnt = await fn_callUpdateSpcfctList(updateSpcfctList);
			}
			if(insertGrdList.length > 0){
				insertGrdCnt = await fn_callInsertGrdList(insertGrdList);
			}
			if(updateGrdList.length > 0){
				updateGrdCnt = await fn_callUpdateGrdList(updateGrdList);
			}
			console.log(insertSpcfctCnt + updateSpcfctCnt + insertGrdCnt + updateGrdCnt)
			if(insertSpcfctCnt + updateSpcfctCnt + insertGrdCnt + updateGrdCnt > 0 ){
				alert("저장 되었습니다.");
				fn_selectApcSpcfctList();
				fn_selectGrdList();
			}
		}
	}



	async function fn_callInsertSpcfctList(cmnsSpcfctList){
		let postJsonPromise = gfn_postJSON("/am/cmns/insertApcSpcfctList.do", cmnsSpcfctList);
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

	async function fn_callUpdateSpcfctList(cmnsSpcfctList){
		let postJsonPromise = gfn_postJSON("/am/cmns/updateApcSpcfctList.do", cmnsSpcfctList);
        let data = await postJsonPromise;
        try{
       		return data.updatedCnt;

        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
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
       		return data.updatedCnt;

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