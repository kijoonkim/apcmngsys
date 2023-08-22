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
						<span style="font-weight:bold;">상품출하매출단가 정보를 관리합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">매출 단가정보는 적용기준일 별로 적용단가를 관리할 수 있습니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchSpmtSlsUntprcReg" name="btnSearchSpmtSlsUntprcReg" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectSpmtSlsUntprcRegList"></sbux-button>
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

	async function fn_createSpmtSlsUntprcRegGrid() {

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
	        {caption: ["적용기준일자"], ref: 'aplcnCrtrYmd', 	type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'},  width:'200px',    style:'text-align:center'},
	        {caption: ["매출단가"],     ref: 'spmtSlsUntprc',  	type:'input',  width:'150px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###원'}},
	        {caption: ["비고"],     	ref: 'rmrk',  			type:'input',  width:'500px',    style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'delYn',  			type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdSpmtSlsUntprcReg\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdSpmtSlsUntprcReg\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["출하포장단위코드"], ref: 'spmtPckgUnitCd',	type:'input',  hidden : true},
	        {caption: ["APC코드"], 			ref: 'apcCd',   		type:'input',  hidden : true},
	        {caption: ["출하매출단가코드"], ref: 'spmtSlsUntprcCd',	type:'input',  hidden : true},
	    ];
	    grdSpmtSlsUntprcReg = _SBGrid.create(SBGridProperties);
	}

	async function fn_selectSpmtSlsUntprcRegList(){
		fn_callSelectSpmtSlsUntprcRegList(slsUnitPrcParam);
	}

	async function fn_callSelectSpmtSlsUntprcRegList(rowData){

		slsUnitPrcParam = rowData;

		console.log("roaData",rowData);
		let apcCd = gv_apcCd;
		let itemCd = rowData.itemCd;
		let vrtyCd = rowData.vrtyCd;
		let spcfctCd = rowData.spcfctCd;
		let postJsonPromise = gfn_postJSON("/am/cmns/selectSpmtSlsUntprcRegList.do", {apcCd : apcCd, itemCd : itemCd, vrtyCd : vrtyCd, spcfctCd : spcfctCd});
	    let data = await postJsonPromise;
	    let newSpmtSlsUntprcRegGridData = [];
	    console.log(data);
	    try{
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
				newSpmtSlsUntprcRegGridData.push(spmtSlsUntprcRegVO);
			});
	    	jsonSpmtSlsUntprcReg = newSpmtSlsUntprcRegGridData;
	    	grdSpmtSlsUntprcReg.rebuild();
	    	grdSpmtSlsUntprcReg.addRow(true);
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}


	async function fn_saveSpmtSlsUntprcReg(){
		let gridData = grdSpmtSlsUntprcReg.getGridDataAll();
		let insertList = [];
		let updateList = [];
		let insertCnt = 0;
		let updateCnt = 0;
		for(var i=1; i<=gridData.length; i++ ){
			if(grdSpmtSlsUntprcReg.getRowData(i).delYn == 'N'){

				if(grdSpmtSlsUntprcReg.getRowData(i).aplcnCrtrYmd == null || grdSpmtSlsUntprcReg.getRowData(i).aplcnCrtrYmd == ""){
					alert("적용기준일자는 필수 값 입니다.");
					return;
				}

				if(grdSpmtSlsUntprcReg.getRowStatus(i) == 3){
					insertList.push(grdSpmtSlsUntprcReg.getRowData(i));
				}
				if(grdSpmtSlsUntprcReg.getRowStatus(i) == 2){
					updateList.push(grdSpmtSlsUntprcReg.getRowData(i));
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
				insertCnt = await fn_callInsertSpmtSlsUntprcRegList(insertList);
			}
			if(updateList.length > 0){
				updateCnt = await fn_callUpdateSpmtSlsUntprcRegList(updateList);
			}
			if(insertCnt + updateCnt > 0 ){
				fn_selectSpmtPckgUnitList();
				alert("저장 되었습니다.");
			}
		}
	}


	async function fn_callInsertSpmtSlsUntprcRegList(spmtSlsUntprcRegList){
		let postJsonPromise = gfn_postJSON("/am/cmns/insertSpmtSlsUntprcRegList.do", spmtSlsUntprcRegList);
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

	async function fn_callUpdateSpmtSlsUntprcRegList(spmtSlsUntprcRegList){
		let postJsonPromise = gfn_postJSON("/am/cmns/updateSpmtSlsUntprcRegList.do", spmtSlsUntprcRegList);
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

	async function fn_deleteSpmtSlsUntprcReg(spmtPckgUnitVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteSpmtSlsUntprcReg.do", spmtPckgUnitVO);
        let data = await postJsonPromise;
        try{
       		if(data.deletedCnt > 0){
       			fn_selectSpmtSlsUntprcRegList();
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