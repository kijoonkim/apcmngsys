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
						<sbux-button id="btnSearchPrdcr" name="btnSearchPrdcr" uitype="button" class="btn btn-sm btn-outline-danger" onclick="fn_sarchPrdcr">조회</sbux-button>
						<sbux-button id="btnInsertPrdcr" name="btnInsertPrdcr" uitype="button" class="btn btn-sm btn-outline-danger" onclick="fn_insertPrdcr">등록</sbux-button>
						<sbux-button id="btnEndPrdcr" name="btnEndPrdcr" uitype="button" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('modal-prdcr')">종료</sbux-button>
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
								<sbux-input id="prdcr-inp-apcNm" name="prdcr-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">생산자명</th>
							<th class="td_input">
								<sbux-input id="prdcr-inp-prdcrNm" name="prdcr-inp-prdcrNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdPrdcr" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonComRrsItemCd 	= [];	// 대표품종 rprsItemCd	Grid
	var jsonComRprsVrtyCd 	= [];	// 대표품종 rprsVrtyCd	Grid
	var jsonComGdsSeCd 		= [];	// 상품구분 gdsSeCd		Grid
	var jsonComWrhsSeCd 	= [];	// 입고구분 wrhsSeCd	Grid
	var jsonComTrsprtSeCd 	= [];	// 운송구분 trsprtSeCd	Grid
	var jsonComClclnCrtr 	= [];	// 정산기준 clclnCrtr	Grid

	/* const fn_initSBSelectPrdcr = async function() {

		// 그리드 SB select
	 	gfn_setComCdGridSelect('grdPrdcr', jsonComTrsprtSeCd, 'ITEM_CD');		// 품목
	 	gfn_setComCdGridSelect('grdPrdcr', jsonComClclnCrtr, 'VRTY_CD');		// 품종
	 	gfn_setComCdGridSelect('grdPrdcr', jsonComRrsItemCd, 'GDS_SE_CD');		// 상품구분
	 	gfn_setComCdGridSelect('grdPrdcr', jsonComRprsVrtyCd, 'WRHS_SE_CD');	// 입고구분
	 	gfn_setComCdGridSelect('grdPrdcr', jsonComGdsSeCd, 'TRSPRT_SE_CD');		// 운송구분
	 	gfn_setComCdGridSelect('grdPrdcr', jsonComWrhsSeCd, 'CLCLN_CRTR');		// 정산기준

	} */


	var jsonPrdcr = [];
	function fn_createPrdcrGrid() {
		jsonPrdcr = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPrdcr';
	    SBGridProperties.id = 'grdPrdcr';
	    SBGridProperties.jsonref = 'jsonPrdcr';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ['생산자명'], 	ref: 'prdcrNm', 	width: '100px', type: 'output'},
	        {caption: ['대표품목'], 	ref: 'rprsItemCd', 	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonComRrsItemCd', label:'label', value:'value', unselect: {label : '선택', value: ''}, displayui : true}},
	        {caption: ['대표품종'], 	ref: 'rprsVrtyCd', 	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonComRprsVrtyCd', label:'label', value:'value', unselect: {label : '선택', value: ''}, displayui : true}},
	        {caption: ['상품구분'], 	ref: 'gdsSeCd', 	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonComGdsSeCd', label:'label', value:'value', unselect: {label : '선택', value: ''}, displayui : true}},
	        {caption: ['입고구분'], 	ref: 'wrhsSeCd', 	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonComWrhsSeCd', label:'label', value:'value', unselect: {label : '선택', value: ''}, displayui : true}},
	        {caption: ['운송구분'], 	ref: 'trsprtSeCd', 	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonComTrsprtSeCd', label:'label', value:'value', unselect: {label : '선택', value: ''}, displayui : true}},
	        {caption: ['정산기준'], 	ref: 'clclnCrtr', 	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonComClclnCrtr', label:'label', value:'value', unselect: {label : '선택', value: ''}, displayui : true}},
	        {caption: ['차량번호'], 	ref: 'vhclno', 		width: '100px', type: 'output'},
	        {caption: ['비고'], 		ref: 'rmrk', 		width: '100px', type: 'input'},
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowPrdcr(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowPrdcr(\"DEL\", " + nRow + ")'>삭제</button>";
            	}
		    }},
	        {caption: ['APC코드'], 		ref: 'apcCd', 		hidden : true},
	        {caption: ['생산자코드'], 	ref: 'prdcrCd', 	hidden : true},

	    ];
	    grdPrdcr = _SBGrid.create(SBGridProperties);
	    grdPrdcr.addRow(true);
	}


	function fn_procRowPrdcr(gubun, nRow, nCol){
		if (gubun === "ADD") {
			grdPrdcr.setCellData(nRow, nCol, "N", true);
			grdPrdcr.addRow(true);
		}
		else if(gubun === "DEL"){
			if(grdPrdcr.getRowStatus(nRow) == 0 || grdPrdcr.getRowStatus(nRow) == 2){
        		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
        		if(confirm(delMsg)){
        			var prdcrVO = grdPrdcr.getRowData(nRow);
        			//fn_deletePrdcr(prdcrVO);
        			grdPrdcr.deleteRow(nRow);
        		}
        	}else{
        		grdPrdcr.deleteRow(nRow);
        	}
		}
	}

	function fn_modalPrdcr(){
		fn_createPrdcrGrid();
	}
</script>
</html>