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
						<sbux-button id="btnSearchVhcl" name="btnSearchVhcl" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_sarchVhcl"></sbux-button>
						<sbux-button id="btnInsertVhcl" name="btnInsertVhcl" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertVhcl"></sbux-button>
						<sbux-button id="btnEndVhcl" name="btnEndVhcl" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('modal-vhcl')"></sbux-button>
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
								<sbux-input id="vhcl-inp-apcNm" name="vhcl-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">차량번호</th>
							<th class="td_input">
								<sbux-input id="vhcl-inp-vhclNm" name="vhcl-inp-vhclNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdVhcl" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonComBankCd 		= [];	// 은행 bankCd		Grid

	const fn_initSBSelectPrdcr = async function() {

		// 그리드 SB select
	 	gfn_setComCdGridSelect('grdVhcl', jsonComBankCd, 'BANK_CD');		// 은행

	}


	var jsonVhcl = [];
	function fn_createVhclGrid() {
		jsonVhcl = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdVhcl';
	    SBGridProperties.id = 'grdVhcl';
	    SBGridProperties.jsonref = 'jsonVhcl';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ['차량번호'], 	ref: 'vhclno', 	width: '100px', type: 'output'},
	        {caption: ['기사명'], 		ref: 'drvrNm', 	width: '100px', type: 'output'},
	        {caption: ['예금주명'], 	ref: 'dpstr', 	width: '100px', type: 'output'},
	        {caption: ['은행'], 		ref: 'bankCd', 	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonComBankCd', 	label:'label', value:'value', unselect: {label : '선택', value: ''}, displayui : true}},
	        {caption: ['계좌번호'], 	ref: 'actno', 	width: '100px', type: 'output'},
	        {caption: ['비고'], 		ref: 'rmrk', 	width: '150px', type: 'input'},
	        {caption: ['최종처리일시'], ref: 'sysLastChgDt', 	width: '100px', type: 'input'},
	        {caption: ["처리"], 		ref: 'delYn',   type:'button', width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowVhcl(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowVhcl(\"DEL\", " + nRow + ")'>삭제</button>";
            	}
		    }},
	        {caption: ['APC코드'], 		ref: 'apcCd', 		hidden : true},

	    ];
	    grdVhcl = _SBGrid.create(SBGridProperties);
	    grdVhcl.addRow(true);
	}


	function fn_procRowVhcl(gubun, nRow, nCol){
		if (gubun === "ADD") {
			grdVhcl.setCellData(nRow, nCol, "N", true);
			grdVhcl.addRow(true);
		}
		else if(gubun === "DEL"){
			if(grdVhcl.getRowStatus(nRow) == 0 || grdVhcl.getRowStatus(nRow) == 2){
        		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
        		if(confirm(delMsg)){
        			var vhclVO = grdVhcl.getRowData(nRow);
        			//fn_deleteVhcl(vhclVO);
        			grdVhcl.deleteRow(nRow);
        		}
        	}else{
        		grdVhcl.deleteRow(nRow);
        	}
		}
	}

	function fn_modalVhcl(){
		fn_createVhclGrid();
	}

	async function fn_insertVhcl(){

	}
</script>
</html>