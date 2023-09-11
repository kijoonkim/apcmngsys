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
						<span style="font-weight:bold;">선택한 품목별로 APC에서 관리하는 등급을 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">등급 등록은 정산에 적용되는 정산기준 등급과 단가를 등록하세요.</span>
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
									unselected-text="선택" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-select>
								</th>
								<th scope="row">등급구분</th>
								<th>
									<sbux-radio id="grd-rdo-grdSeCd" name="grd-rdo-grdSeCd" uitype="normal"
									jsondata-ref="jsonGGrdSeCd"
									text-right-padding="10px"
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

			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonGItemCd 	= [];
	var jsonGGrdSeCd 	= [];
	var jsonGJgmtType 	= [];

	var jsonStdGrd = [];
	var jsonStdGrdDtl = [];

	const fn_initSBSelectStdGrd = async function() {
		let rst = await Promise.all([
			gfn_setApcItemSBSelect("grd-slt-itemCd", 	jsonGItemCd, gv_apcCd),			// APC 품목
			gfn_setComCdSBSelect("grd-rdo-grdSeCd", 	jsonGGrdSeCd, "GRD_SE_CD")		// 등급구분코드(출하)
			//gfn_setComCdSBSelect("grdJgmtGrd", 			jsonJGJgmtType, "JGMT_TYPE")		// 등급구분코드(출하)

		]);
		SBUxMethod.set("grd-rdo-grdSeCd", "01");
		grdStdGrd.refresh({"combo":true});
		grdStdGrdDtl.refresh({"combo":true});
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
   		SBGridPropertiesStdGrd.frozenrows = 1
   		SBGridPropertiesStdGrd.columns = [
	        {caption: ["명칭"],     	ref: 'grdKndNm',  type:'input',  width:'180px',    style:'text-align:center',
	        		typeinfo : {maxlength : 30}},
	        {caption: ["순번"],     ref: 'sn',  type:'input',  width:'80px',    style:'text-align:center',
					typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}},
	        {caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdStdGrd\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdStdGrd\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
		    {caption: ["상세"], 		ref: 'grdKnd',  type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(!gfn_isEmpty(strValue)){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_grdDtl(" + nRow + ")'>상세</button>";
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
	    SBGridPropertiesStdGrdDtl.frozenrows = 1;
	    SBGridPropertiesStdGrdDtl.columns = [
	    	{caption: ["등급종류명"],     	ref: 'grdNm',  type:'input',  width:'180px',    style:'text-align:center',
        			typeinfo : {maxlength : 30}},
       		{caption: ["등급값"],     ref: 'grdVl',  type:'input',  width:'80px',    style:'text-align:right',
					typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 10}, format : {type:'number', rule:'#,###'}},
       		{caption: ["순서"],     ref: 'sn',  type:'input',  width:'80px',    style:'text-align:center',
					typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}, format : {type:'number', rule:'#,###'}},
			{caption: ["처리"], 		ref: 'delYn',  type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdStdGrdDtl\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdStdGrdDtl\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["APC코드"], 	ref: 'apcCd',   	type:'input',  hidden : true},
	        {caption: ["품목코드"], 	ref: 'itemCd',   	type:'input',  hidden : true},
	        {caption: ["등급구분코드"], ref: 'grdSeCd',   	type:'input',  hidden : true},
	        {caption: ["등급종류"], 	ref: 'grdKnd',   	type:'input',  hidden : true},
	        {caption: ["등급코드"], 	ref: 'grdCd',   	type:'input',  hidden : true}
	    ];
	    grdStdGrdDtl = _SBGrid.create(SBGridPropertiesStdGrdDtl);
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
				  , sn			: item.sn
				  , adtnRt		: item.adtnRt
				  , delYn		: item.delYn
				}
				jsonStdGrd.push(stdGrdVO);
			});
	    	grdStdGrd.rebuild();
	    	grdStdGrd.addRow(true);
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	const fn_grdDtl = async function(nRow){
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
		let gridData = grdStdGrd.getGridDataAll();
		let gridDtlData = grdStdGrdDtl.getGridDataAll();

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

		if(saveList.length == 0 && saveDtlList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}
		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){
			let saveLists = [{
				stdGrdList : saveList,
				stdGrdDtlList : saveDtlList
			}]

			console.log(saveLists);
			let postJsonPromise = gfn_postJSON("/am/cmns/multiStdGrdList.do", saveLists);
	        let data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		//fn_searchAll();
	        		//fn_searchVrtyAll();
	        	} else {
	        		alert(data.resultMessage);
	        	}
	        } catch(e) {
	        }
		}
	}

</script>
</html>