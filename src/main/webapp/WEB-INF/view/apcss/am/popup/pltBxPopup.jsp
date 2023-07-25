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
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSearchPltBx" name="btnSearchPltBx" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_sarchPltBx">조회</sbux-button>
						<sbux-button id="btnInsertPltBx" name="btnInsertPltBx" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertPltBx">등록</sbux-button>
						<sbux-button id="btnEndPltBx" name="btnEndPltBx" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('modal-pltBx')">종료</sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="pltBx-inp-apcNm" name="pltBx-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">계량번호</th>
							<th class="td_input">
								<sbux-input id="pltBx-inp-vhclNm" name="pltBx-inp-vhclNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="col-sm-6">
					<div class="ad_section_top">
						<div id="sb-area-grdPlt" style="width:100%;height:300px;"></div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="ad_section_top">
						<div id="sb-area-grdBx" style="width:100%;height:300px;"></div>
					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonComUnitCd 		= [];	// 대표품종 unitCd		Grid
	var jsonComPltBxNm		= [];
	const fn_initSBSelectPltBx = async function() {

		// 그리드 SB select
	 	gfn_setComCdGridSelect('grdPlt', jsonComUnitCd, 	'UNIT_CD');			// 단위

	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("pltBx-inp-apcNm", gv_apcNm);
		fn_initSBSelectPltBx();
	})


	var jsonPlt = [];
	function fn_createPltGrid() {
		jsonPlt = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPlt';
	    SBGridProperties.id = 'grdPlt';
	    SBGridProperties.jsonref = 'jsonPlt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["팔레트","종류"], 		ref: 'pltBxNm',   		type:'combo',  width:'170px',    style:'text-align:center',
				typeinfo : {ref:'jsonComPltBxNm', label:'label', value:'value', displayui : true}},
	        {caption: ["팔레트","수량"], 		ref: 'bssInvntrQntt',  	type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["팔레트","단중"], 		ref: 'unitWght',   		type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["팔레트","단위"], 		ref: 'unitCd',   		type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonComUnitCd', label:'label', value:'value', displayui : true}},
			{caption: ["팔레트","처리"], 		ref: 'delYn',   	type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowPltBx(\"ADD\", \"grdPlt\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowPltBx(\"DEL\", \"grdPlt\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	    	{caption: ["박스 정보","코드"], 					ref: 'pltBxCd',  	hidden : true},
		    {caption: ["박스 정보","팔레트/박스 구분코드"], 	ref: 'pltBxSeCd',  	hidden : true},
		    {caption: ["박스 정보","APC코드"], 					ref: 'apcCd',  		hidden : true}

	    ];
	    grdPlt = _SBGrid.create(SBGridProperties);
	    grdPlt.addRow(true);
	}


	var jsonBx = [];
	function fn_createBxGrid() {
		jsonBx = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdBx';
	    SBGridProperties.id = 'grdBx';
	    SBGridProperties.jsonref = 'jsonBx';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	    	{caption: ["박스","종류"], 		ref: 'pltBxNm',   		type:'combo',  width:'170px',    style:'text-align:center',
				typeinfo : {ref:'jsonComPltBxNm', label:'label', value:'value', displayui : true}},
	        {caption: ["박스","수량"], 		ref: 'bssInvntrQntt',  	type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["박스","단중"], 		ref: 'unitWght',   		type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["박스","단위"], 		ref: 'unitCd',   		type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonComUnitCd', label:'label', value:'value', displayui : true}},
			{caption: ["박스","처리"], 		ref: 'delYn',   	type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowPltBx(\"ADD\", \"grdBx\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowPltBx(\"DEL\", \"grdBx\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	    	{caption: ["박스","코드"], 					ref: 'pltBxCd',  	hidden : true},
		    {caption: ["박스","팔레트/박스 구분코드"], 	ref: 'pltBxSeCd',  	hidden : true},
		    {caption: ["박스","APC코드"], 				ref: 'apcCd',  	hidden : true}

	    ];
	    grdBx = _SBGrid.create(SBGridProperties);
	    grdBx.addRow(true);
	}


	function fn_procRowPltBx(gubun, grid ,nRow, nCol){
		if (gubun === "ADD") {
			if(grid === "grdPlt"){
				grdPlt.setCellData(nRow, nCol, "N", true);
				grdPlt.setCellData(nRow, 6, "P", true);
				grdPlt.setCellData(nRow, 7, SBUxMethod.get("apcCd"), true);
				grdPlt.addRow(true);
			}else if(grid ==="grdBx"){
				grdBx.setCellData(nRow, nCol, "N", true);
				grdBx.setCellData(nRow, 6, "B", true);
				grdBx.setCellData(nRow, 7, SBUxMethod.get("apcCd"), true);
				grdBx.addRow(true);
			}
		}
		else if(gubun === "DEL"){
			if(grid === "grdPlt"){

				if(grdPlt.getRowStatus(nRow) == 0 || grdPlt.getRowStatus(nRow) == 2){
	        		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
	        		if(confirm(delMsg)){
	        			var pltBxVO = grdPlt.getRowData(nRow);
	        			//fn_deletePltBx(pltBxVO);
	        			grdPlt.deleteRow(nRow);
	        		}
	        	}else{
	        		grdPlt.deleteRow(nRow);
	        	}
			}else if(grid === "grdBx"){
				if(grdBx.getRowStatus(nRow) == 0 || grdBx.getRowStatus(nRow) == 2){
	        		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
	        		if(confirm(delMsg)){
	        			var pltBxVO = grdBx.getRowData(nRow);
	        			//fn_deletePltBx(pltBxVO);
	        			grdBx.deleteRow(nRow);
	        		}
	        	}else{
	        		grdBx.deleteRow(nRow);
	        	}
			}
		}
	}

	function fn_modalPltBx(){
		fn_createPltGrid();
		fn_createBxGrid();
	}
</script>
</html>