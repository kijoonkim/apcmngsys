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
						<span style="font-weight:bold;">상품 거래처 등록.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">상품 거래처 등록 테스트.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchSpmtPckgUnitCnpt" name="btnSearchSpmtPckgUnitCnpt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectSmptPckgUnitCnpt"></sbux-button>
					<sbux-button id="btnSaveSpmtPckgUnitCnpt" name="btnSaveSpmtPckgUnitCnpt" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveSpmtPckgUnitCnpt"></sbux-button>
					<sbux-button id="btnEndSpmtPckgUnitCnpt" name="btnEndSpmtPckgUnitCnpt" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-spmtPckgUnitCnpt')"></sbux-button>
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
									<sbux-input id="spmtPckgUnitCnpt-inp-apcNm" name="spmtPckgUnitCnpt-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th scope="row">포장단위명</th>
								<th>
									<sbux-input id="spmtPckgUnitCnpt-inp-spmtPckgUnitNm" name="spmtPckgUnitCnpt-inp-spmtPckgUnitNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
									<sbux-input id="spmtPckgUnitCnpt-inp-spmtPckgUnitCd" name="spmtPckgUnitCnpt-inp-spmtPckgUnitCd" uitype="hidden" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th></th>
								<th></th>
							</tr>
							<tr>
								<th scope="row">품목명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id="spmtPckgUnitCnpt-inp-itemNm" name="spmtPckgUnitCnpt-inp-itemNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
									<sbux-input id="spmtPckgUnitCnpt-hin-itemCd" name="spmtPckgUnitCnpt-hin-itemCd" uitype="hidden" class="form-control input-sm"></sbux-input>
								</th>
								<th scope="row">품종명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id="spmtPckgUnitCnpt-inp-vrtyNm" name="spmtPckgUnitCnpt-inp-vrtyNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
									<sbux-input id="spmtPckgUnitCnpt-hin-vrtyCd" name="spmtPckgUnitCnpt-hin-vrtyCd" uitype="hidden" class="form-control input-sm"></sbux-input>
								</th>
								<th scope="row">규격명</th>
								<th style="border-right-style: hidden;">
									<sbux-input id="spmtPckgUnitCnpt-inp-spcfctNm" name="spmtPckgUnitCnpt-inp-spcfctNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
									<sbux-input id="spmtPckgUnitCnpt-hin-spcfctCd" name="spmtPckgUnitCnpt-hin-spcfctCd" uitype="hidden" class="form-control input-sm"></sbux-input>
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
							<li><span>상품 거래처 내역</span></li>
						</ul>
					</div>
					<div>
						<div id="sb-area-grdSpmtPckgUnitCnpt" style="height:223px; width: 100%;"></div>
					</div>
				</div>

			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">

	let gdsCnptParam;

	var jsonSpmtPckgUnitCnpt = [];
	var comboCnptList = [];

	const fn_initSBSelectSpmtPckgUnitCnpt = async function() {

		let rst = await Promise.all([
			gfn_setCpntSBSelect('grdSpmtPckgUnitCnpt', comboCnptList, gv_selectedApcCd)
		]);
	}

	const fn_createSpmtPckgUnitCnptGrid = async function() {

		SBUxMethod.set("spmtPckgUnit-inp-apcNm", SBUxMethod.get("inp-apcNm"));
   		var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtPckgUnitCnpt';
	    SBGridProperties.id = 'grdSpmtPckgUnitCnpt';
	    SBGridProperties.jsonref = 'jsonSpmtPckgUnitCnpt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["처리"], 		ref: 'delYn',  			type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
				if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdSpmtPckgUnitCnpt\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdSpmtPckgUnitCnpt\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["거래처"],     ref: 'cnptCd',  	type:'combo',  width:'150px',    style:'text-align:center',
				typeinfo : {
					ref : 'comboCnptList',
					oneclickedit:true,
					label : 'label',
					value : 'value'
				}
			},
			{caption: ["사용여부"], ref: 'useYn', type:'multiradio',width:'100px',style:'text-align:center',typeinfo : {radiolabel : ['사용', '미사용'], radiovalue : ['Y', 'N']}},
			{caption: ["비고"],     	ref: 'rmrk',  			type:'input',  width:'500px',    style:'text-align:center'},
	        {caption: ["출하포장단위코드"], ref: 'spmtPckgUnitCd',	type:'input',  hidden : true},
	        {caption: ["APC코드"], 			ref: 'apcCd',   		type:'input',  hidden : true},
	        // {caption: ["거래처코드"], ref: 'cnptCd',	type:'input',  hidden : true},
	    ];
	    grdSpmtPckgUnitCnpt = _SBGrid.create(SBGridProperties);
	}

	const fn_selectSmptPckgUnitCnpt = async function(){
		fn_selectSpmtPckgUnitCnptList(gdsCnptParam);
	}

	const fn_selectSpmtPckgUnitCnptList = async function(rowData){
		gdsCnptParam = rowData;

		let apcCd = gv_apcCd;
		let itemCd = rowData.itemCd;
		let vrtyCd = rowData.vrtyCd;
		let spmtPckgUnitCd = rowData.spmtPckgUnitCd;
		let spcfctCd = rowData.spcfctCd;
		let postJsonPromise = gfn_postJSON("/am/cmns/selectSpmtPckgUnitCnptList.do", {apcCd : apcCd, itemCd : itemCd, vrtyCd : vrtyCd, spmtPckgUnitCd: spmtPckgUnitCd, spcfctCd : spcfctCd});
	    let data = await postJsonPromise;
	    try{
  			if (_.isEqual("S", data.resultStatus)) {
  		    	jsonSpmtPckgUnitCnpt.length = 0;
  		    	data.resultList.forEach((item, index) => {
  					let spmtPckgUnitCnptVO = {
						apcCd			: item.apcCd
  					  , spmtPckgUnitCd	: item.spmtPckgUnitCd
  					  ,	cnptCd		 	: item.cnptCd
  					  , rmrk			: item.rmrk
					  , useYn			: item.useYn
  					  , delYn			: item.delYn
  					}
  					jsonSpmtPckgUnitCnpt.push(spmtPckgUnitCnptVO);
  				});
  		    	grdSpmtPckgUnitCnpt.rebuild();
  		    	grdSpmtPckgUnitCnpt.addRow(true);
  		    	grdSpmtPckgUnitCnpt.setCellDisabled(grdSpmtPckgUnitCnpt.getRows() -1, 0, grdSpmtPckgUnitCnpt.getRows() -1, grdSpmtPckgUnitCnpt.getCols() -1, true);

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

	const fn_saveSpmtPckgUnitCnpt = async function(){
		let saveList = [];
		let gridData = grdSpmtPckgUnitCnpt.getGridDataAll();

		for(var i=1; i<=gridData.length; i++ ){
			let rowData = grdSpmtPckgUnitCnpt.getRowData(i);
			let delYn = rowData.delYn;
			if(delYn == 'N'){
				saveList.push(rowData);
			}
		}

		if(saveList.length == 0){
			gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
			return;
		}

		if(gfn_comConfirm("Q0001", "저장")){

			let postJsonPromise = gfn_postJSON("/am/cmns/multiSaveSpmtPckgUnitCnptList.do", saveList);
	        let data = await postJsonPromise;

	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_selectSpmtPckgUnitCnptList(gdsCnptParam);
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

	const fn_deleteSpmtPckgUnitCnpt = async function(spmtPckgUnitVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteSpmtPckgUnitCnpt.do", spmtPckgUnitVO);
        let data = await postJsonPromise;
        try {
        	if(_.isEqual("S", data.resultStatus)){
        		gfn_comAlert("I0001") 					// I0001 	처리 되었습니다.
        		fn_selectSpmtPckgUnitCnptList(gdsCnptParam);
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