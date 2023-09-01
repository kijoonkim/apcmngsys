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
						<span style="font-weight:bold;">상품출하시 운용하고 있는 출하포장단위 정보를 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">출하처리 시 필요한 정보입니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchSpmtPckgUnit" name="btnSearchSpmtPckgUnit" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectSpmtPckgUnitList"></sbux-button>
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
									<sbux-select id="spmtPckgUnit-slt-itemCd" name="spmtPckgUnit-slt-itemCd" style="background-color:#ffffff;"  uitype="single" jsondata-ref="jsonSPUItemCd" unselected-text="선택" class="form-control input-sm input-sm-ast inpt_data_reqed" onchange="fn_selectItem"></sbux-select>
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
							<li><span>출하포장단위</span></li>
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
			gfn_setApcItemSBSelect("spmtPckgUnit-slt-itemCd", jsonSPUItemCd, gv_apcCd), 	// APC 품목(검색)
			gfn_setApcItemSBSelect("grdSpmtPckgUnit", 		jsonSPUGrdItemCd, gv_apcCd),	// APC 품목(저장)
			gfn_setComCdSBSelect("grdSpmtPckgUnit", 		jsonSPUGdsGrd, "GDS_GRD")		// 상품등급(출하)
		]);
		console.log("jsonSPUGdsGrd >> ",jsonSPUGdsGrd);
		
		grdSpmtPckgUnit.refresh({"combo":true});
	}

	function fn_selectItem(){
		let selectItemCd = SBUxMethod.get("spmtPckgUnit-slt-itemCd");
		gfn_setApcVrtySBSelect("grdSpmtPckgUnit", 		jsonSPUGrdVrtyCd, gv_apcCd, selectItemCd);		// APC 품종(저장)
		gfn_setApcSpcfctsSBSelect("grdSpmtPckgUnit", 	jsonSPUGrdSpcfctCd, gv_apcCd, selectItemCd);	// APC 규격(저장)
	}

	function fn_modalClick(nRow){
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
		fn_callSelectSpmtSlsUntprcRegList(rowData);
	}


	async function fn_createSpmtPckgUnitGrid() {
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
	        {caption: ["품목"], 			ref: 'itemCd',   	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonSPUGrdItemCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["품종"], 			ref: 'vrtyCd',   	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonSPUGrdVrtyCd', 	displayui : false,	itemcount: 10, label:'label', value:'value', filtering: {usemode : true, uppercol : 0, attrname : 'mastervalue'}}
	        	},
	        {caption: ["규격"], 			ref: 'spcfctCd',   	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonSPUGrdSpcfctCd', 	displayui : false, 	itemcount: 10, label:'label', value:'value', filtering: {usemode : true, uppercol : 0, attrname : 'mastervalue'}}},
	        {caption: ["등급"], 			ref: 'gdsGrd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonSPUGdsGrd', 	displayui : false, 	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["출하 포장단위 명"], ref: 'spmtPckgUnitNm',  type:'input',  width:'300px',    style:'text-align:center'},
	        {caption: ["판매단가"],     	ref: 'ntslUntprc',  type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###원'}},
	        {caption: ["변경"], 		ref: 'delYn',  type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if((grdSpmtPckgUnit.getRowStatus(nRow) == 0 || grdSpmtPckgUnit.getRowStatus(nRow) == 2) && !(strValue== null || strValue == "")){
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_modalClick(" + nRow + ")'>단가</button>";
	        	}else{
	        		return ;
	        	}
		    }},
	        {caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdSmptPckgUnit\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdSmptPckgUnit\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["출하포장단위코드"], ref: 'spmtPckgUnitCd',	type:'input',  hidden : true},
	        {caption: ["APC코드"], 			ref: 'apcCd',   		type:'input',  hidden : true},
	        {caption: ["품목명"], 			ref: 'itemNm',   		type:'input',  hidden : true},
	        {caption: ["품종명"], 			ref: 'vrtyNm',   		type:'input',  hidden : true},
	        {caption: ["규격명"], 			ref: 'spcfctNm',   		type:'input',  hidden : true},
	        {caption: ["등급명"], 			ref: 'gdsGrdNm',   		type:'input',  hidden : true},
	    ];
	    grdSpmtPckgUnit = _SBGrid.create(SBGridProperties);
	    await fn_initSBSelectSpmtPckgUnit();
	}

	async function fn_selectSpmtPckgUnitList(){
		fn_callSelectSpmtPckgUnitList()
	}

	async function fn_callSelectSpmtPckgUnitList(){
		let apcCd = gv_apcCd;
		let itemCd = SBUxMethod.get("spmtPckgUnit-slt-itemCd");
		if(gfn_isEmpty(itemCd)){
			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		let postJsonPromise = gfn_postJSON("/am/cmns/selectSpmtPckgUnitList.do", {apcCd : apcCd, itemCd : itemCd});
	    let data = await postJsonPromise;
	    let newSpmtPckgUnitGridData = [];
	    try{
	    	data.resultList.forEach((item, index) => {
				let spmtPckgUnitVO = {
					itemCd 			: item.itemCd
				  , vrtyCd 			: item.vrtyCd
				  , spcfctCd		: item.spcfctCd
				  , spmtPckgUnitNm	: item.spmtPckgUnitNm
				  , ntslUntprc		: item.ntslUntprc
				  , delYn			: item.delYn
				  , apcCd			: item.apcCd
				  , spmtPckgUnitCd	: item.spmtPckgUnitCd
				  , itemNm			: item.itemNm
				  , vrtyNm			: item.vrtyNm
				  , spcfctNm		: item.spcfctNm
				  , gdsGrd			: item.gdsGrd
				  , gdsGrdNm		: item.gdsGrdNm
				}
				newSpmtPckgUnitGridData.push(spmtPckgUnitVO);
			});
	    	jsonSpmtPckgUnit = newSpmtPckgUnitGridData;
	    	grdSpmtPckgUnit.rebuild();
	    	grdSpmtPckgUnit.addRow(true);
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}


	async function fn_saveSpmtPckgUnit(){
		let gridData = grdSpmtPckgUnit.getGridDataAll();
		let insertList = [];
		let updateList = [];
		let insertCnt = 0;
		let updateCnt = 0;
		for(var i=1; i<=gridData.length; i++ ){
			if(grdSpmtPckgUnit.getRowData(i).delYn == 'N'){

				if(grdSpmtPckgUnit.getRowData(i).itemCd == null || grdSpmtPckgUnit.getRowData(i).itemCd == ""){
					alert("품목은 필수 값 입니다.");
					return;
				}
				if(grdSpmtPckgUnit.getRowData(i).vrtyCd == null || grdSpmtPckgUnit.getRowData(i).vrtyCd == ""){
					alert("품종은 필수 값 입니다.");
					return;
				}
				if(grdSpmtPckgUnit.getRowData(i).spcfctCd == null || grdSpmtPckgUnit.getRowData(i).spcfctCd == ""){
					alert("규격은 필수 값 입니다.");
					return;
				}
				if(grdSpmtPckgUnit.getRowData(i).spmtPckgUnitNm == null || grdSpmtPckgUnit.getRowData(i).spmtPckgUnitNm == ""){
					alert("출하포장단위 명은 필수 값 입니다.");
					return;
				}
				if(grdSpmtPckgUnit.getRowData(i).ntslUntprc == null || grdSpmtPckgUnit.getRowData(i).ntslUntprc == ""){
					alert("단가는 필수 값 입니다.");
					return;
				}

				if(grdSpmtPckgUnit.getRowStatus(i) == 3){
					insertList.push(grdSpmtPckgUnit.getRowData(i));
				}
				if(grdSpmtPckgUnit.getRowStatus(i) == 2){
					updateList.push(grdSpmtPckgUnit.getRowData(i));
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
				insertCnt = await fn_callInsertSpmtPckgUnitList(insertList);
			}
			if(updateList.length > 0){
				updateCnt = await fn_callUpdateSpmtPckgUnitList(updateList);
			}
			if(insertCnt + updateCnt > 0 ){
				fn_selectSpmtPckgUnitList();
				alert("저장 되었습니다.");
			}
		}
	}


	async function fn_callInsertSpmtPckgUnitList(spmtPckgUnitList){
		let postJsonPromise = gfn_postJSON("/am/cmns/insertSpmtPckgUnitList.do", spmtPckgUnitList);
        let data = await postJsonPromise;

        try{
       		return data.insertedCnt;

        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}

	}

	async function fn_callUpdateSpmtPckgUnitList(spmtPckgUnitList){
		let postJsonPromise = gfn_postJSON("/am/cmns/updateSpmtPckgUnitList.do", spmtPckgUnitList);
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

	async function fn_deleteSpmtPckgUnit(spmtPckgUnitVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteSpmtPckgUnit.do", spmtPckgUnitVO);
        let data = await postJsonPromise;
        try{
       		if(data.deletedCnt > 0){
       			fn_selectSpmtPckgUnitList();
				alert("삭제 되었습니다.");
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