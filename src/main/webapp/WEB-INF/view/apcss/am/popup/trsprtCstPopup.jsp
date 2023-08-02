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
			<div class="box-header">
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSearchTrsprtCst" name="btnSearchTrsprtCst" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searctTrsprtCst"></sbux-button>
						<sbux-button id="btnSaveTrsprtCst" name="btnSaveTrsprtCst" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_insertTrsprtCst"></sbux-button>
						<sbux-button id="btnEndTrsprtCst" name="btnEndTrsprtCst" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-trsprtCst')"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 12%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 12%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 12%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th class="td_input">
								<sbux-input id="trsprtCst-inp-apcNm" name="trsprtCst-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th colspan="7">&nbsp;</th>
						</tr>
						<tr>
							<th scope="row">운송일자</th>
							<th class="td_input">
								<sbux-datepicker id="trsprtCst-dtp-trsprtYmd" name="trsprtCst-dtp-trsprtYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</th>
							<th>&nbsp;</th>
							<th scope="row">생산자명</th>
							<th class="td_input">
								<sbux-input id="trsprtCst-inp-prdcrNm" name="trsprtCst-inp-prdcrNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</th>
							<th class="td_input">
								<sbux-button id="btnSrchPrdcrTrsprtCst" name="btnSrchPrdcrTrsprtCst" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"></sbux-button>
							</th>
							<th scope="row">차량번호</th>
							<th class="td_input">
								<sbux-input id="trsprtCst-inp-vhclno" name="trsprtCst-inp-vhclno" uitype="text" class="form-control input-sm" ></sbux-input>
							</th>
							<th class="td_input">
								<sbux-button id="btnSrchVhclNoTrsprtCst" name="btnSrchVhclNoTrsprtCst" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_modalVhcl"></sbux-button>
							</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdTrsprtCst" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonComTrsprtSeCd 		= [];	// 운송구분 trsprtSeCd		Grid
	var jsonComTrsprtRgnCd		= [];	// 운송지역	trsprtRgnCd		Grid
	var jsonComBankCd			= [];	// 은행코드	bankCd			Grid
	const fn_initSBSelectTrsprtCst = async function() {

		// 그리드 SB select
	 	gfn_setComCdGridSelect('grdTrsprtCst', jsonComTrsprtSeCd, 	'TRSPRT_SE_CD');	// 운송구분
	 	gfn_setComCdGridSelect('grdTrsprtCst', jsonComTrsprtRgnCd, 	'TRSPRT_RGN_CD');	// 운송지역
	 	gfn_setComCdGridSelect('grdTrsprtCst', jsonComBankCd, 		'BANK_CD');			// 은행코드

	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("trsprtCst-inp-apcNm", gv_apcNm);
		fn_initSBSelectTrsprtCst();
	})

	var jsonTrsprtCst = [];
	function fn_createTrsprtCstGrid() {
		jsonTrsprtCst = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdTrsprtCst';
	    SBGridProperties.id = 'grdTrsprtCst';
	    SBGridProperties.jsonref = 'jsonTrsprtCst';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ['생산자'], 		ref: 'prdcrNm', 	width: '100px', type: 'output'},
	        {caption: ['운송일자'], 	ref: 'trsprtYmd', 	width: '100px', type: 'output'},
	        {caption: ['운송구분'], 	ref: 'trsprtSeCd', 	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonComTrsprtSeCd', label:'label', value:'value', displayui : true}},
	        {caption: ['차량번호'], 	ref: 'vhclno', 		width: '100px', type: 'output'},
	        {caption: ['운송지역'], 	ref: 'trsprtRgnCd', 	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonComTrsprtRgnCd', label:'label', value:'value', displayui : true}},
	        {caption: ['중량'], 		ref: 'wrhsWght', 	width: '100px', type: 'output'},
	        {caption: ['운임비용'], 	ref: 'bankCd', 	width: '100px', type: 'output'},
	        {caption: ['은행'], 	ref: 'trsprtRgnCd', 	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonComBankCd', label:'label', value:'value', displayui : true}},
	        {caption: ['계좌'], 		ref: 'actno', 		width: '100px', type: 'output'},
	        {caption: ['예금주'], 		ref: 'dpstr', 		width: '80px', type: 'output'},
	        {caption: ['비고'], 		ref: 'RMRK', 		width: '240px', type: 'output'},
	        {caption: ["처리"], 		ref: 'delYn',   	type:'button',  width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowTrsprtCst(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRowTrsprtCst(\"DEL\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ['APC코드'], ref: 'apcCd', hidden : true},

	    ];
	    grdTrsprtCst = _SBGrid.create(SBGridProperties);
	    grdTrsprtCst.addRow(true);
	}

	function fn_modalTrsprtCst(){
		fn_createTrsprtCstGrid();
	}

	function fn_procRowTrsprtCst(gubun, nRow, nCol){
		if (gubun === "ADD") {
			grdTrsprtCst.setCellData(nRow, nCol, "N", true);
			grdTrsprtCst.setCellData(nRow, 12, SBUxMethod.get("apcCd"), true);
			grdTrsprtCst.addRow(true);
		}
		else if(gubun === "DEL"){
			if(grdTrsprtCst.getRowStatus(nRow) == 0 || grdTrsprtCst.getRowStatus(nRow) == 2){
        		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
        		if(confirm(delMsg)){
        			var rawMtrTrsprtCstVO = grdTrsprtCst.getRowData(nRow);
        			//fn_deleteTrsprtCst(rawMtrTrsprtCstVO);
        			grdTrsprtCst.deleteRow(nRow);
        		}
        	}else{
        		grdTrsprtCst.deleteRow(nRow);
        	}
		}
	}

</script>
</html>