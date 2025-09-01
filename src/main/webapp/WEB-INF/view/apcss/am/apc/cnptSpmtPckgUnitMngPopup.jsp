<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 상품 거래처 등록</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">거래처 상품 등록.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">거래처 상품 등록 테스트.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchCnptSpmtPckgUnit" name="btnSearchCnptSpmtPckgUnit" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectCnptSmptPckgUnit"></sbux-button>
					<sbux-button id="btnSaveCnptSpmtPckgUnit" name="btnSaveCnptSpmtPckgUnit" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveCnptSpmtPckgUnit"></sbux-button>
					<sbux-button id="btnEndCnptSpmtPckgUnit" name="btnEndCnptSpmtPckgUnit" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-cnptSpmtPckgUnit')"></sbux-button>
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
									<sbux-input id="cnptSpmtPckgUnit-inp-apcNm" name="cnptSpmtPckgUnit-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row">거래처</th>
								<th>
									<sbux-input id="cnptSpmtPckgUnit-inp-cnptNm" name="cnptSpmtPckgUnit-inp-cnptNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
									<sbux-input id="cnptSpmtPckgUnit-inp-cnptCd" name="cnptSpmtPckgUnit-inp-cnptCd" uitype="hidden" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row"><span class="data_required"></span>품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-select id="cnptSpmtPckgUnit-slt-itemCd"
												 name="cnptSpmtPckgUnit-slt-itemCd"
												 style="background-color:#ffffff;"
												 uitype="single"
												 jsondata-ref="jsonCSPUItemCd"
												 unselected-text="선택"
												 class="form-control input-sm input-sm-ast inpt_data_reqed"
												 onchange="fn_onChangeCSPUItemCd()"></sbux-select>
								</th>
								<th></th>
							</tr>
						</tbody>
					</table>

				</div>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<b>&nbsp;</b>
				<div class="table-responsive tbl_scroll_sm">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>품목별 거래처 상품 내역</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-grdCnptSpmtPckgUnit" style="height:150px; width: 100%;"></div>
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>전체 상품</span></li>
							</ul>
						</div>
						<div id="sb-area-grdTotalCnptSpmtPckgUnit" style="height:220px; width: 100%;"></div>
					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	let cnptSpmtPckgUnit;

	var grdCnptSpmtPckgUnit;
	var grdTotalCnptSpmtPckgUnit;

	var jsonCSPUItemCd = [];
	var jsonCnptSpmtPckgUnit = [];
	var jsonTotalCnptSpmtPckgUnit = [];

	var comboSpmtPckgUnitList = [];

	const fn_initSBSelectCnptSpmtPckgUnit = async function() {
		let rst = await Promise.all([
			gfn_setApcItemSBSelect("cnptSpmtPckgUnit-slt-itemCd", jsonCSPUItemCd, gv_apcCd),	// APC 품목(검색)
		]);
	}


	const fn_createCnptSpmtPckgUnitGrid = async function() {

		SBUxMethod.set("cnptSpmtPckgUnit-inp-apcNm", SBUxMethod.get("inp-apcNm"));
   		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdCnptSpmtPckgUnit';
	    SBGridProperties.id = 'grdCnptSpmtPckgUnit';
	    SBGridProperties.jsonref = 'jsonCnptSpmtPckgUnit';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["처리"], 		ref: 'delYn',  			type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
				if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdCnptSpmtPckgUnit\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdCnptSpmtPckgUnit\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
			{caption: ["품목명"], ref: 'itemCd', type:'output', width:'80px', style:'text-align:center'},
			{caption: ["품종명"], ref: 'vrtyCd', type:'output', width:'80px', style:'text-align:center'},
	        {caption: ["상품"], ref: 'spmtPckgUnitCd', type:'combo', width:'150px', style:'text-align:center',
				typeinfo : {
					ref : 'comboSpmtPckgUnitList',
					oneclickedit:true,
					label : 'label',
					value : 'value'
				}
			},
			{caption: ["사용여부"], ref: 'useYn', type:'multiradio',width:'100px',style:'text-align:center',typeinfo : {radiolabel : ['사용', '미사용'], radiovalue : ['Y', 'N']}},
			{caption: ["비고"],     	ref: 'rmrk',  			type:'input',  width:'500px',    style:'text-align:center'},
			{caption: ["출하포장단위코드"], ref: 'spmtPckgUnitCd',	type:'input',  hidden : true},
			{caption: ["APC코드"], 			ref: 'apcCd',   		type:'input',  hidden : true},
	    ];
	    grdCnptSpmtPckgUnit = _SBGrid.create(SBGridProperties);
		grdCnptSpmtPckgUnit.bind("valuechanged", "fn_valueChanged");

	}

	const fn_createTotalCnptSpmtPckgUnitGrid = async function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdTotalCnptSpmtPckgUnit';
		SBGridProperties.id = 'grdTotalCnptSpmtPckgUnit';
		SBGridProperties.jsonref = 'jsonTotalCnptSpmtPckgUnit';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption: ["품목명"], ref: 'itemCd', type:'output', width:'80px', style:'text-align:center'},
			{caption: ["품종명"], ref: 'vrtyCd', type:'output', width:'80px', style:'text-align:center'},
			{caption: ["상품"], ref: 'spmtPckgUnitCd', type:'output', width:'150px', style:'text-align:center'},
			{caption: ["사용여부"], ref: 'useYn', type:'multiradio',width:'100px',style:'text-align:center',
				typeinfo : {radiolabel : ['사용', '미사용'], radiovalue : ['Y', 'N']}
			},
			{caption: ["비고"],     	ref: 'rmrk',  			type:'input',  width:'500px',    style:'text-align:center'},
			{caption: ["출하포장단위코드"], ref: 'spmtPckgUnitCd',	type:'input',  hidden : true},
			{caption: ["APC코드"], 			ref: 'apcCd',   		type:'input',  hidden : true},
		];
		grdTotalCnptSpmtPckgUnit = _SBGrid.create(SBGridProperties);
	}

	const fn_selectCnptSmptPckgUnit = async function(){
		fn_selectCnptSpmtPckgUnitList(cnptSpmtPckgUnit);
	}

	const fn_selectCnptSpmtPckgUnitList = async function(rowData){
		cnptSpmtPckgUnit = rowData;

		let itemCd = SBUxMethod.get("cnptSpmtPckgUnit-slt-itemCd");
		let param = {
			apcCd : gv_selectedApcCd,
			itemCd : itemCd,
			cnptCd : rowData.cnptCd,
		}

		let postJsonPromise = gfn_postJSON("/am/cmns/selectCnptSpmtPckgUnitList.do", param);
	    let data = await postJsonPromise;
	    try{
  			if (_.isEqual("S", data.resultStatus)) {
  		    	jsonCnptSpmtPckgUnit.length = 0;
  		    	data.resultList.forEach((item, index) => {
  					let cnptSpmtPckgUnitVO = {
						apcCd			: item.apcCd
  					  , spmtPckgUnitCd	: item.spmtPckgUnitCd
  					  ,	cnptCd		 	: item.cnptCd
  					  , rmrk			: item.rmrk
					  , useYn			: item.useYn
  					  , delYn			: item.delYn
  					}
  					jsonCnptSpmtPckgUnit.push(cnptSpmtPckgUnitVO);
  				});
  		    	grdCnptSpmtPckgUnit.rebuild();
  		    	grdCnptSpmtPckgUnit.addRow(true);
  		    	grdCnptSpmtPckgUnit.setCellDisabled(grdCnptSpmtPckgUnit.getRows() -1, 0, grdCnptSpmtPckgUnit.getRows() -1, grdCnptSpmtPckgUnit.getCols() -1, true);

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

	const fn_saveCnptSpmtPckgUnit = async function(){
		let saveList = [];
		let gridData = grdCnptSpmtPckgUnit.getGridDataAll();

		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdCnptSpmtPckgUnit.getRowData(i);
			let delYn = rowData.delYn;
			if(delYn == 'N'){
				saveList.push(rowData);
			}
		}

		// TODO: 내용이 없을 경우 체크
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		console.log("fn_saveCnptSpmtPckgUnit", saveList);
		return;

		if(gfn_comConfirm("Q0001", "저장")){

			let postJsonPromise = gfn_postJSON("/am/cmns/multiSaveCnptSpmtPckgUnitList.do", saveList);
	        let data = await postJsonPromise;

	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_selectCnptSpmtPckgUnitList(spmtPckgUnit);
					fn_selectSpmtPckgUnit();
	        	} else {
	        		gfn_comAlert("E0001");
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
		}
	}

	const fn_deleteCnptSpmtPckgUnit = async function(spmtPckgUnitVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteCnptSpmtPckgUnit.do", spmtPckgUnitVO);
        let data = await postJsonPromise;
        try {
        	if(_.isEqual("S", data.resultStatus)){
        		gfn_comAlert("I0001") 					// I0001 	처리 되었습니다.
        		fn_selectCnptSpmtPckgUnitList(spmtPckgUnit);
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

	const fn_onChangeCSPUItemCd = async function() {
		let itemCd = SBUxMethod.get("cnptSpmtPckgUnit-slt-itemCd");
		await gfn_setSpmtPckgUnitSBSelect('grdCnptSpmtPckgUnit', comboSpmtPckgUnitList, gv_apcCd, itemCd);	// APC 출하포장단위

		grdCnptSpmtPckgUnit.rebuild();
		fn_selectCnptSpmtPckgUnitList(cnptSpmtPckgUnit);
	}

	const fn_valueChanged = function() {
		let nCol 				= grdCnptSpmtPckgUnit.getCol();
		let nRow 				= grdCnptSpmtPckgUnit.getRow();
		let itemCdCol	 		= grdCnptSpmtPckgUnit.getColRef("itemCd");
		let vrtyCdCol	 		= grdCnptSpmtPckgUnit.getColRef("vrtyCd");

		grdCnptSpmtPckgUnit.setCellData();
	}


</script>
</html>