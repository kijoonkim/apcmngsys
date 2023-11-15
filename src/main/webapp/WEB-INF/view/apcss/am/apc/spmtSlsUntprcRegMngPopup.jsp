<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 출하 매출단가 등록</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">상품출하매출단가 정보를 관리합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">매출 단가정보는 적용기준일 별로 적용단가를 관리할 수 있습니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchSpmtSlsUntprcReg" name="btnSearchSpmtSlsUntprcReg" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectSmptSlsUntprcReg"></sbux-button>
					<sbux-button id="btnSaveSpmtSlsUntprcReg" name="btnSaveSpmtSlsUntprcReg" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveSpmtSlsUntprcReg"></sbux-button>
					<sbux-button id="btnEndSpmtSlsUntprcReg" name="btnEndSpmtSlsUntprcReg" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-spmtSlsUntprcReg')"></sbux-button>
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
									<sbux-input id="spmtSlsUntprcReg-inp-apcNm" name="spmtSlsUntprcReg-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row">포장단위명</th>
								<th>
									<sbux-input id="spmtSlsUntprcReg-inp-spmtPckgUnitNm" name="spmtSlsUntprcReg-inp-spmtPckgUnitNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
									<sbux-input id="spmtSlsUntprcReg-inp-spmtPckgUnitCd" name="spmtSlsUntprcReg-inp-spmtPckgUnitCd" uitype="hidden" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th></th>
								<th></th>
							</tr>
							<tr>
								<th scope="row">품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id="spmtSlsUntprcReg-inp-itemNm" name="spmtSlsUntprcReg-inp-itemNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
									<sbux-input id="spmtSlsUntprcReg-hin-itemCd" name="spmtSlsUntprcReg-hin-itemCd" uitype="hidden" class="form-control input-sm"></sbux-input>
								</th>
								<th scope="row">품종명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id="spmtSlsUntprcReg-inp-vrtyNm" name="spmtSlsUntprcReg-inp-vrtyNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
									<sbux-input id="spmtSlsUntprcReg-hin-vrtyCd" name="spmtSlsUntprcReg-hin-vrtyCd" uitype="hidden" class="form-control input-sm"></sbux-input>
								</th>
								<th scope="row">규격명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id="spmtSlsUntprcReg-inp-spcfctNm" name="spmtSlsUntprcReg-inp-spcfctNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
									<sbux-input id="spmtSlsUntprcReg-hin-spcfctCd" name="spmtSlsUntprcReg-hin-spcfctCd" uitype="hidden" class="form-control input-sm"></sbux-input>
								</th>
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
							<li><span>매출단가 내역</span></li>
						</ul>
					</div>
					<div>
						<div id="sb-area-grdSpmtSlsUntprcReg" style="height:223px; width: 100%;"></div>
					</div>
				</div>

			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">

	let slsUnitPrcParam;

	var jsonSpmtSlsUntprcReg = [];

	const fn_createSpmtSlsUntprcRegGrid = async function() {

		SBUxMethod.set("spmtPckgUnit-inp-apcNm", SBUxMethod.get("inp-apcNm"));
   		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtSlsUntprcReg';
	    SBGridProperties.id = 'grdSpmtSlsUntprcReg';
	    SBGridProperties.jsonref = 'jsonSpmtSlsUntprcReg';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["처리"], 		ref: 'delYn',  			type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdSpmtSlsUntprcReg\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdSpmtSlsUntprcReg\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["적용기준일자"], ref: 'aplcnCrtrYmd', 	type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'},  width:'200px',    style:'text-align:center'},
	        {caption: ["매출단가"],     ref: 'spmtSlsUntprc',  	type:'input',  width:'150px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###원'}},
	        {caption: ["비고"],     	ref: 'rmrk',  			type:'input',  width:'500px',    style:'text-align:center'},
	        {caption: ["출하포장단위코드"], ref: 'spmtPckgUnitCd',	type:'input',  hidden : true},
	        {caption: ["APC코드"], 			ref: 'apcCd',   		type:'input',  hidden : true},
	        {caption: ["출하매출단가코드"], ref: 'spmtSlsUntprcCd',	type:'input',  hidden : true},
	    ];
	    grdSpmtSlsUntprcReg = _SBGrid.create(SBGridProperties);
	}

	const fn_selectSmptSlsUntprcReg = async function(){
		fn_selectSpmtSlsUntprcRegList(slsUnitPrcParam);
	}

	const fn_selectSpmtSlsUntprcRegList = async function(rowData){

		slsUnitPrcParam = rowData;

		let apcCd = gv_apcCd;
		let itemCd = rowData.itemCd;
		let vrtyCd = rowData.vrtyCd;
		let spcfctCd = rowData.spcfctCd;
		let postJsonPromise = gfn_postJSON("/am/cmns/selectSpmtSlsUntprcRegList.do", {apcCd : apcCd, itemCd : itemCd, vrtyCd : vrtyCd, spcfctCd : spcfctCd});
	    let data = await postJsonPromise;
	    try{
	    	jsonSpmtSlsUntprcReg.length = 0;
	    	data.resultList.forEach((item, index) => {
				let spmtSlsUntprcRegVO = {
					aplcnCrtrYmd 	: item.aplcnCrtrYmd
				  , spmtSlsUntprc 	: item.spmtSlsUntprc
				  , spmtSlsUntprcCd : item.spmtSlsUntprcCd
				  , rmrk			: item.rmrk
				  , spmtPckgUnitCd	: item.spmtPckgUnitCd
				  , delYn			: item.delYn
				  , apcCd			: item.apcCd
				}
				jsonSpmtSlsUntprcReg.push(spmtSlsUntprcRegVO);
			});
	    	grdSpmtSlsUntprcReg.rebuild();
	    	grdSpmtSlsUntprcReg.addRow(true);
	    	grdSpmtSlsUntprcReg.setCellDisabled(grdSpmtSlsUntprcReg.getRows() -1, 0, grdSpmtSlsUntprcReg.getRows() -1, grdSpmtSlsUntprcReg.getCols() -1, true);
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}

	const fn_saveSpmtSlsUntprcReg = async function(){
		let saveList = [];
		let gridData = grdSpmtSlsUntprcReg.getGridDataAll();

		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdSpmtSlsUntprcReg.getRowData(i);
			let rowSts = grdSpmtSlsUntprcReg.getRowStatus(i);
			let delYn = rowData.delYn;
			let aplcnCrtrYmd = rowData.aplcnCrtrYmd;
			if(delYn == 'N'){
				if (gfn_isEmpty(aplcnCrtrYmd)) {
		  			gfn_comAlert("W0001", "적용기준일자");		//	W0001	{0}을/를 선택하세요.
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
		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise = gfn_postJSON("/am/cmns/multiSaveSpmtSlsUniprcRegList.do", saveList);
	        let data = await postJsonPromise;

	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_selectSpmtSlsUntprcRegList(slsUnitPrcParam);
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

	const fn_deleteSpmtSlsUntprcReg = async function(spmtPckgUnitVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteSpmtSlsUntprcReg.do", spmtPckgUnitVO);
        let data = await postJsonPromise;
        try {
        	if(data.deletedCnt > 0){
        		gfn_comAlert("I0001") 					// I0001 	처리 되었습니다.
        		fn_selectSpmtSlsUntprcRegList(slsUnitPrcParam);
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