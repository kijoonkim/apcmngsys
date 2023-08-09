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
						<sbux-button id="btnSearchTrsprtCst" name="btnSearchTrsprtCst" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchTrsprtCst"></sbux-button>
						<sbux-button id="btnSaveTrsprtCst" name="btnSaveTrsprtCst" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_insertTrsprtCst"></sbux-button>
						<sbux-button id="btnEndTrsprtCst" name="btnEndTrsprtCst" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-trsprtCst')"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="trsprtCst-inp-prdcrCd" name="trsprtCst-inp-prdcrCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 12%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 12%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 12%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th class="td_input">
								<sbux-input id="trsprtCst-inp-apcNm" name="trsprtCst-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</th>
							<th colspan="7"></th>
						</tr>
						<tr>
							<th scope="row">운송일자</th>
							<th class="td_input">
								<sbux-datepicker id="trsprtCst-dtp-trsprtYmd" name="trsprtCst-dtp-trsprtYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</th>
							<th></th>
							<th scope="row">생산자명</th>
							<th class="td_input">
								<sbux-input
									id="trsprtCst-inp-prdcrNm"
									name="trsprtCst-inp-prdcrNm"
									uitype="text"
									class="form-control input-sm" 
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(trsprtCst-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
    							></sbux-input>
							</th>
							<th class="td_input">
								<sbux-button
									id="btnSrchPrdcrTrsprtCst"
									name="btnSrchPrdcrTrsprtCst"
									class="btn btn-xs btn-outline-dark" 
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</th>
							<th scope="row">차량번호</th>
							<th class="td_input">
								<sbux-input
									id="trsprtCst-inp-vhclno"
									name="trsprtCst-inp-vhclno"
									uitype="text"
									class="form-control input-sm" 
									autocomplete-ref="jsonVhclAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpVhclno(trsprtCst-inp-vhclno)"
    								autocomplete-select-callback="fn_onSelectVhclno"
    							></sbux-input>
							</th>
							<th class="td_input">
								<sbux-button
									id="btnSrchVhclNoTrsprtCst"
									name="btnSrchVhclNoTrsprtCst"
									class="btn btn-xs btn-outline-dark" 
									text="찾기" uitype="modal"
									target-id="modal-vhcl"
									onclick="fn_choiceVhcl"
								></sbux-button>
							</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdTrsprtCst" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonTrsprtCst = [];
	
	var jsonComTrsprtSeCd 		= [];	// 운송구분 trsprtSeCd		Grid
	var jsonComTrsprtRgnCd		= [];	// 운송지역	trsprtRgnCd		Grid

    var jsonDataPrdcr = [];
    var jsonPrdcr = [];
    var jsonPrdcrAutocomplete = [];
    
    var jsonDataVhcl = [];
    var jsonVhcl = [];
    var jsonVhclAutocomplete = [];

	const fn_initSBSelectTrsprtCst = async function() {

		// 그리드 SB select
	 	gfn_setComCdGridSelect('grdTrsprtCst', jsonComTrsprtSeCd, 	'TRSPRT_SE_CD');	// 운송구분
	 	gfn_setComCdGridSelect('grdTrsprtCst', jsonComTrsprtRgnCd, 	'TRSPRT_RGN_CD');	// 운송지역

	}
	
	// APC별 생산자 목록 및 초성 가져오기(?)
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_apcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("trsprtCst-dtp-trsprtYmd", year+month+day);
		SBUxMethod.set("trsprtCst-inp-apcNm", gv_apcNm);
		fn_initSBSelectTrsprtCst();
		fn_getPrdcrs();
	})

	var jsonTrsprtCst = [];
	function fn_createTrsprtCstGrid() {
		jsonTrsprtCst = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdTrsprtCst';
	    SBGridProperties.id = 'grdTrsprtCst';
	    SBGridProperties.jsonref = 'jsonTrsprtCst';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.columns = [
	        {caption: ['생산자','생산자'], 		ref: 'prdcrNm', 	width: '70px',	style: 'text-align:center',		type: 'output'},
		    {caption: ['생산자','생산자'], 		ref: 'btnPrdcrNm', 	width: '60px',	style: 'text-align:center',		type: 'button', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
        		return "<button type='button' class='btn btn-xs btn-outline-danger' onclick='fn_modalPrdcr'>찾기</button>";
		    }},
	        {caption: ['운송일자','운송일자'], 	ref: 'trsprtYmd', 	width: '100px',	style: 'text-align:center',		type: 'input'},
	        {caption: ['운송구분','운송구분'], 	ref: 'trsprtSeCd', 	width: '100px',	style: 'text-align:center',		type: 'combo',
				typeinfo : {ref:'jsonComTrsprtSeCd', label:'label', value:'value', displayui : true}},
	        {caption: ['차량번호','차량번호'], 	ref: 'vhclno',		width: '100px',	style: 'text-align:center',		type: 'output'},
	        {caption: ['차량번호','차량번호'], 	ref: 'btnVhclno', 	width: '60px',	style: 'text-align:center',		type: 'button', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
        		return "<button type='button' class='btn btn-xs btn-outline-danger' onclick='fn_modalVhcl'>찾기</button>";
		    }},
	        {caption: ['기사명','기사명'], 		ref: 'drvrNm',		width: '100px',	style: 'text-align:center',		type: 'output'},
	        {caption: ['운송지역','운송지역'], 	ref: 'trsprtRgnCd', width: '100px', style: 'text-align:center', 	type: 'combo',
				typeinfo : {ref:'jsonComTrsprtRgnCd', label:'label', value:'value', displayui : true}},
	        {caption: ['중량','중량'], 		ref: 'wrhsWght', 	width: '100px',	style: 'text-align:center',		type: 'output'},
	        {caption: ['운임비용','운임비용'],	ref: 'trsprtCst', 	width: '100px',	style: 'text-align:center',		type: 'input'},
	        {caption: ['은행','은행'],			ref: 'bankCd', 		width: '100px',	style: 'text-align:center',		type: 'output'},
	        {caption: ['계좌','계좌'],			ref: 'actno', 		width: '100px',	style: 'text-align:center',		type: 'output'},
	        {caption: ['예금주','예금주'],	 	ref: 'dpstr', 		width: '80px',	style: 'text-align:center',		type: 'output'},
	        {caption: ['비고','비고'],			ref: 'rmrk', 		width: '240px',									type: 'input'},
	        {caption: ["처리","처리"],	 		ref: 'delYn',  		width:'80px',	style: 'text-align:center', 	type: 'button', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowTrsprtCst(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowTrsprtCst(\"DEL\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ['APC코드'], ref: 'apcCd', hidden : true},
	        {caption: ['순번'], ref: 'sn', hidden : true}
	    ];
	    grdTrsprtCst = _SBGrid.create(SBGridProperties);
	    //grdTrsprtCst.setColStatus(0, false);
	    grdTrsprtCst.addRow(true);
	}
	
	// 행 추가 및 삭제
	function fn_procRowTrsprtCst(gubun, nRow, nCol){
		if (gubun === "ADD") {
			grdTrsprtCst.setCellData(nRow, nCol, "N", true);
			grdTrsprtCst.setCellData(nRow, 15, gv_apcCd, true);
			grdTrsprtCst.addRow(true);
		}
		else if(gubun === "DEL"){
			if(grdTrsprtCst.getRowStatus(nRow) == 0 || grdTrsprtCst.getRowStatus(nRow) == 2){
        		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
        		if(confirm(delMsg)){
        			var rawMtrTrsprtCstVO = grdTrsprtCst.getRowData(nRow);
        			fn_deleteTrsprtCst(rawMtrTrsprtCstVO);
        			grdTrsprtCst.deleteRow(nRow);
        		}
        	}else{
        		grdTrsprtCst.deleteRow(nRow);
        	}
		}
	}
	
	// 원물운임비용 목록 조회 호출 (조회 버튼)
	let newjsonTrsprtCst = [];
	async function fn_searchTrsprtCst(){
		jsonTrsprtCst = [];
		let apcCd = gv_apcCd;
		let prdcrCd = SBUxMethod.get("trsprtCst-inp-prdcrCd");
		let trsprtYmd = SBUxMethod.get("trsprtCst-dtp-trsprtYmd");
		let vhclno = SBUxMethod.get("trsprtCst-inp-vhclno");
		let RawMtrTrsprtCstVO = {apcCd : apcCd, prdcrCd : prdcrCd, trsprtYmd : trsprtYmd, vhclno : vhclno};
		console.log(RawMtrTrsprtCstVO);
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectRawMtrTrsprtCstList.do", RawMtrTrsprtCstVO);
        let data = await postJsonPromise;
        newjsonTrsprtCst = [];
        try{
        	data.resultList.forEach((item, index) => {
				let trsprtCstList = {
				    trsprtYmd 	: item.trsprtYmd
				  , trsprtSeCd 	: item.trsprtSeCd
				  , vhclno 		: item.vhclno
				  , drvrNm 		: item.drvrNm
				  , trsprtRgnCd : item.trsprtRgnCd
				  , wrhsWght	: item.wrhsWght
				  , trsprtCst 	: item.trsprtCst
				  , bankCd 		: item.bankCd
				  , actno 		: item.actno
				  , dpstr 		: item.dpstr
				  , rmrk 		: item.rmrk
				  , delYn		: item.delYn
				  , apcCd		: item.apcCd
				  , sn			: item.sn
				}
				jsonTrsprtCst.push(Object.assign({}, trsprtCstList));
				newjsonTrsprtCst.push(Object.assign({}, trsprtCstList));
			});
        	grdTrsprtCst.rebuild();
    	    //grdTrsprtCst.setColStatus(0, false);
        	grdTrsprtCst.addRow();
		}catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}
	
	// 원물운임비용 등록 (등록 버튼)
// 	async function fn_insertTrsprtCst(){
// 		for(var i=0; i<jsonTrsprtCst.length; i++){
// 			if(jsonTrsprtCst[i].delYn == 'N'){
// 				if(jsonTrsprtCst[i].trsprtYmd == null || jsonTrsprtCst[i].trsprtYmd == ""){
// 					alert("운송일자는 필수 값 입니다.");
// 					return
// 				}
// 				if(jsonTrsprtCst[i].vhclno == null || jsonTrsprtCst[i].vhclno == ""){
// 					alert("차량번호는 필수 값 입니다.");
// 					return
// 				}
// 			}
// 		}
		
// 		var isEqual1 = await fn_chkGridDataModified(apcInfoMngData, newApcInfoMngData);
// 		console.log(isEqual1);
// 		if (isEqual1){
// 			alert("등록 할 내용이 없습니다.");
// 			return;
// 		}
		
// 		let regMsg = "등록 하시겠습니까?";
// 		if(confirm(regMsg)){
// 			let postJsonPromise = gfn_postJSON("/am/apc/updateApcDsctnList.do", {origin : newApcInfoMngData, modified : apcInfoMngData});
// 			let data = await postJsonPromise;
// 	        try{
// 	        	if(data.insertedCnt > 0){
// 	        		fn_callSelectApcDsctnList();
// 	        		alert("등록 되었습니다.");
// 	        	}else{
// 	        		alert("등록 실패 하였습니다.");
// 	        	}
	
// 	        }catch (e) {
// 	        	if (!(e instanceof Error)) {
// 	    			e = new Error(e);
// 	    		}
// 	    		console.error("failed", e.message);
// 			}
// 		}
// 	}
	
// 	async function fn_chkGridDataModified(obj1, obj2){
// 		console.log("modified", obj1);
// 		console.log("origin", obj2);

// 		var obj1Len = obj1.filter(e => e["delYn"] == "N").length;
// 		var obj2Len = obj2.filter(e => e["delYn"] == "N").length;

// 		if (obj1Len != obj2Len)
// 			return false;

// 		var obj1keys = Object.keys(obj1[0]);
// 		obj1keys.sort();
// 		var obj2keys = Object.keys(obj2[0]);
// 		obj2keys.sort();

// 		if (JSON.stringify(obj1keys) != JSON.stringify(obj2keys))
// 			return false;

// 		for(var i=0; i<obj1Len; i++){
// 			for(var j=0; j<obj1keys.length; j++){
// 				if(obj1[i][obj1keys[j]] != obj2[i][obj1keys[j]])
// 					return false;
// 			}
// 		}
// 		return true;
// 	}

	async function fn_insertTrsprtCst(){
		let gridData = grdTrsprtCst.getGridDataAll();
		let insertList = [];
		let updateList = [];
		let insertCnt = 0;
		let updateCnt = 0;
		for(var i=2; i<gridData.length; i++){
			if(grdTrsprtCst.getRowData(i).delYn == 'N'){
				if(grdTrsprtCst.getRowData(i).trsprtYmd == null || grdTrsprtCst.getRowData(i).trsprtYmd == ""){
					alert("운송일자는 필수 값 입니다.");
					return
				}
				if(grdTrsprtCst.getRowData(i).vhclno == null || grdTrsprtCst.getRowData(i).vhclno == ""){
					alert("차량번호는 필수 값 입니다.");
					return
				}

				if(grdTrsprtCst.getRowStatus(i) === 3){
					insertList.push(grdTrsprtCst.getRowData(i));
				}
				if(grdTrsprtCst.getRowStatus(i) === 1 && grdTrsprtCst.getRowData(i).sn == null){
					insertList.push(grdTrsprtCst.getRowData(i));
				}
				if(grdTrsprtCst.getRowStatus(i) === 2){
					updateList.push(grdTrsprtCst.getRowData(i));
				}
			}
		}
		if(insertList.length == 0 && updateList.length == 0){
			alert("저장 할 내용이 없습니다.");
			return;
		}
		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			if(insertList.length > 0){
				insertCnt = await fn_callInsertRawMtrTrsprtCstList(insertList);
			}
			if(updateList.length > 0){
				updateCnt = await fn_callUpdateRawMtrTrsprtCstList(updateList);
			}
			if(insertCnt + updateCnt > 0 ){
				fn_searchTrsprtCst();
				alert("저장 되었습니다.");
			}
		}
	}

	async function fn_callInsertRawMtrTrsprtCstList(rawMtrTrsprtCstList){
		let postJsonPromise = gfn_postJSON("/am/cmns/insertRawMtrTrsprtCstList.do", rawMtrTrsprtCstList);
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

	async function fn_callUpdateRawMtrTrsprtCstList(rawMtrTrsprtCstList){
		let postJsonPromise = gfn_postJSON("/am/cmns/updateRawMtrTrsprtCstList.do", rawMtrTrsprtCstList);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		return data.updatedCnt;
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
	}
	
	// 원물운임비용 삭제
	async function fn_deleteTrsprtCst(RawMtrTrsprtCstVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteRawMtrTrsprtCstList.do", RawMtrTrsprtCstVO);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.deletedCnt > 0){
        			fn_searchTrsprtCst();
        		}
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
	}
	
	async function fn_setJsonTrsprtCst(i, gridData){
		if(gridData != null || gridData != ""){
			grdTrsprtCst.setCellData(2, i, gridData);
		}
	}
	
	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('trsprtCst-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("trsprtCst-inp-prdcrCd", null);
		SBUxMethod.attr("trsprtCst-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("trsprtCst-inp-prdcrCd", value);
		SBUxMethod.attr("trsprtCst-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
	}


    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_apcCd, gv_apcNm, fn_setPrdcr);
	}

	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("trsprtCst-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("trsprtCst-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("trsprtCst-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}
	
	/**
	 * @name fn_onKeyUpVhclno
	 * @description 차량번호 입력 시 event : autocomplete
	 */
	const fn_onKeyUpVhclno = function(prdcrNm){
		fn_clearVhcl();
		jsonVhclAutocomplete = gfn_filterFrst(prdcrNm, jsonVhcl);
    	SBUxMethod.changeAutocompleteData('trsprtCst-inp-vhclno', true);
    }

	/**
	 * @name fn_clearVhcl
	 * @description 차량번호 폼 clear
	 */
	const fn_clearVhcl = function() {
		SBUxMethod.set("trsprtCst-inp-vhclno", null);
		SBUxMethod.attr("trsprtCst-inp-vhclno", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectVhclno
	 * @description 차량번호 autocomplete 선택 callback
	 */
	function fn_onSelectVhclno(value, label, item) {
		SBUxMethod.set("trsprtCst-inp-vhclno", value);
		SBUxMethod.attr("trsprtCst-inp-vhclno", "style", "background-color:aquamarine");	//skyblue
	}


    const fn_choiceVhcl = function() {
    	console.log("apcCd: ", gv_apcCd, " apcNm: ", gv_apcNm);
		popVhcl.init(gv_apcCd, gv_apcNm, fn_setVhcl);
	}

	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("trsprtCst-inp-vhclno", vhcl.vhclno);
			SBUxMethod.attr("trsprtCst-inp-vhclno", "style", "background-color:aquamarine");	//skyblue
		}
	}
	
	// 모달 호출
	function fn_modalTrsprtCst(){
		fn_createTrsprtCstGrid();
		
		let prdcrNm = "구만석";
		let trsprtYmd = "20230803"
		let trsprtSeCd = "1";
		let vhclno = "224누3212";
		let wrhsWght  = 45;
		let newPrdcrNm = "이만석";

		fn_setJsonTrsprtCst(0, prdcrNm);
		fn_setJsonTrsprtCst(2, trsprtYmd);
		fn_setJsonTrsprtCst(3, trsprtSeCd);
		fn_setJsonTrsprtCst(4, vhclno);
		fn_setJsonTrsprtCst(8, wrhsWght);
		fn_setJsonTrsprtCst(15, "9999");
	}

	// 모달 종료
	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>