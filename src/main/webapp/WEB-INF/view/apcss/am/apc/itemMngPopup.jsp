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
				<h3 class="box-title"> ▶ 품목 등록 (팝업)</h3>
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnItemSech" name="btnItemSech" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectItemList()"></sbux-button>
						<sbux-button id="btnItemReg" name="btnItemReg" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertItemList"></sbux-button>
						<sbux-button id="btnItemEnd" name="btnItemEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('itemMngModal')"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<div>
					<!--[pp] 검색 -->
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 7%">
							<col style="width: 20%">
							<col style="width: 5%">
							<col style="width: 15%">
							<col style="width: auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">APC명</th>
								<td>
									<sbux-input id=itemApcNm name="itemApcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</td>
								<th scope="row">품목명</th>
								<td  style="border-right-style: hidden;">
									<sbux-input id=itemNm name="itemNm" uitype="text" class="form-control input-sm"></sbux-input>
								</td>
								<td>&nbsp;</td>
							</tr>
						</tbody>
					</table>

				</div>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<b>&nbsp;</b>

				<div class="row">

					<div class="col-sm-4">
						<div>
							<div id="itemGridArea" style="height:150px; width: 100%;"></div>
						</div>
					</div>


					<div class="col-sm-8">
						<div>
							<div id="apcItemGridArea" style="height:150px; width: 100%;"></div>
						</div>
					</div>
					<b>&nbsp;</b>
				</div>
				<div class="">
					<table class="table table-bordered tbl_row tbl_fixed mg_t10">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 7%">
							<col style="width: 20%">
							<col style="width: 5%">
							<col style="width: 15%">
							<col style="width: auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">품목명</th>
								<td style="border-right-style: hidden;">
									<input type="text" class="form-control input-sm" placeholder="" disabled>
								</td>
								<td colspan="3" scope="row"></td>

							</tr>
						</tbody>
					</table>
				</div>

				<div class="row">
					<div class="col-sm-6">
							<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span class="font_default" >품종등록</span></li>
								</ul>

							</div>

						<table class="table table-bordered tbl_col tbl_fixed mg_t10">
							<colgroup>
								<col style="width: 25%">
								<col style="width: 50%">
								<col style="width: 25%">
							</colgroup>
							<thead>
								<tr>
									<th>코드</th>
									<th>명칭</th>
									<th>선택</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td class="ta_c"><button type="button" class="btn btn-xs btn-outline-danger"  style="font-size: xx-small;">선택</button></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-sm-6">
						<div class="ad_tbl_top"  style="width: 98%;">
								<ul class="ad_tbl_count">
									<li><span class="font_default" >&nbsp;</span></li>
								</ul>
						</div>

						<table class="table table-bordered tbl_col tbl_fixed mg_t10">
							<colgroup>
								<col style="width: 25%">
								<col style="width: 50%">
								<col style="width: 25%">
							</colgroup>
							<thead>
								<tr>
									<th>코드</th>
									<th>명칭</th>
									<th>처리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td class="ta_c"><button type="button" class="btn btn-xs btn-outline-danger"  style="font-size: xx-small;">삭제</button></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td class="ta_c"><button type="button" class="btn btn-xs btn-outline-danger"  style="font-size: xx-small;">추가</button></td>
								</tr>
								<tr>
									<td></td>
									<td>&nbsp;</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>

	</section>
</body>
<script type="text/javascript">

	var itemGridData = []; // 그리드의 참조 데이터 주소 선언
	async function fn_itemCreateGrid() {
		SBUxMethod.set("itemApcNm", SBUxMethod.get("apcNm"));

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'itemGridArea';
	    SBGridProperties.id = 'itemDataGrid';
	    SBGridProperties.jsonref = 'itemGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["코드"],     ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],     ref: 'itemNm',  type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["선택"], 	ref: 'empty',   type:'output',  width:'100PX',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_addItem(" + nRow + ")'>선택</button>";
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}

	    ];
	    itemDataGrid = _SBGrid.create(SBGridProperties);
	    fn_selectItemList();
	}

	async function fn_selectItemList(){
		fn_callSelectItemList()
	}

	async function fn_callSelectItemList(){
		let apcCd = SBUxMethod.get("apcCd");
		let itemNm = SBUxMethod.get("itemNm");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectCmnsItemList.do", {apcCd : apcCd, itemNm : itemNm});
        let data = await postJsonPromise;
        let newItemGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let itemVO = {
					itemCd 		: item.itemCd
				  , itemNm 		: item.itemNm
				  , apcCd		: apcCd
				}
				newItemGridData.push(itemVO);
			});
        	itemGridData = newItemGridData;
        	itemDataGrid.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_addItem(nRow){
		let itemVO = itemDataGrid.getRowData(nRow);
		fn_callInsertApcItem(itemVO);
	}

	async function fn_callInsertApcItem(cmnsItemVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/insertApcCmnsItem.do", cmnsItemVO);
        let data = await postJsonPromise;
        let newItemGridData = [];
        try{
        	if(data.result > 0){
        		fn_selectApcItemList();
        		fn_selectItemList()
        	}else{
        		alert("등록 중 실패하였습니다.")
        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}


	var apcItemGridData = []; // 그리드의 참조 데이터 주소 선언
	async function fn_apcItemCreateGrid() {

		let SBGridProperties = {};
	    SBGridProperties.parentid = 'apcItemGridArea';
	    SBGridProperties.id = 'apcItemDataGrid';
	    SBGridProperties.jsonref = 'apcItemGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["코드"],     	ref: 'itemCd',  	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["명칭"],     	ref: 'itemNm',  	type:'output',  width:'150px',    style:'text-align:center'},
	        {caption: ["품종등록"],     ref: 'vrtrCnt',  	type:'output',  width:'150px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue === '0'){
            		return "";
            	}else{
			        return "등록";
            	}
		    }},
	        {caption: ["규격등록"],     ref: 'spcfctCnt',  	type:'output',  width:'150px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue === '0'){
            		return "";
            	}else{
			        return "등록";
            	}
		    }},
	        {caption: ["등급등록"],     ref: 'grdCnt',  	type:'output',  width:'150px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue === '0'){
            		return "";
            	}else{
			        return "등록";
            	}
		    }},
	        {caption: ["삭제"], 	ref: 'empty',   type:'output',  width:'100PX',    style:'text-align:center',
	            renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	                return "<button type='button' class='btn btn-xs btn-outline-danger'  onClick='fn_deleteItem(" + nRow + ")'>삭제</button>";
	        }},
	        {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}

	    ];
	    apcItemDataGrid = _SBGrid.create(SBGridProperties);
	    fn_selectApcItemList();
	}

	async function fn_selectApcItemList(){
		fn_callSelectApcItemList()
	}

	async function fn_callSelectApcItemList(){
		let apcCd = SBUxMethod.get("apcCd");
		let itemNm = SBUxMethod.get("itemNm");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectApcCmnsItemList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        let newApcItemGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let itemVO = {
					itemCd 		: item.itemCd
				  , itemNm 		: item.itemNm
				  , apcCd		: apcCd
				  , vrtrCnt 	: item.vrtrCnt
				  , spcfctCnt	: item.spcfctCnt
				  , grdCnt		: item.grdCnt
				}
				newApcItemGridData.push(itemVO);
			});
        	apcItemGridData = newApcItemGridData;
        	apcItemDataGrid.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_deleteItem(nRow){
		let itemVO = apcItemDataGrid.getRowData(nRow);
		fn_callDeleteItem(itemVO)
	}

	async function fn_callDeleteItem(cmnsItemVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/deleteApcCmnsItem.do", cmnsItemVO);
        let data = await postJsonPromise;
        let newItemGridData = [];
        try{
        	if(data.result > 0){
        		fn_selectApcItemList();
        		fn_selectItemList();
        	}else{
        		alert("삭제 중 실패하였습니다.")
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