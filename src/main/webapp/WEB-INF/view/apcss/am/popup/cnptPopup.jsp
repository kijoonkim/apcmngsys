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
						<sbux-button id="btnSearchCnpt" name="btnSearchCnpt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchCnpt"></sbux-button>
						<sbux-button id="btnEndCnpt" name="btnEndCnpt" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-cnpt')"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 12%">
						<col style="width: 24%">
						<col style="width: 12%">
						<col style="width: 24%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="cnpt-inp-apcNm" name="cnpt-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">거래처명</th>
							<th class="td_input">
								<sbux-input id="cnpt-inp-cnptNm" name="cnpt-inp-cnptNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdCnpt" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("cnpt-inp-apcNm", gv_apcNm);
	})
	var jsonCnpt = [];
	function fn_createCnptGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdCnpt';
	    SBGridProperties.id = 'grdCnpt';
	    SBGridProperties.jsonref = 'jsonCnpt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ['거래처명'], 	ref: 'CnptNm',		width: '150px', type: 'output'},
	        {caption: ['유형'], 		ref: 'cnptTypeNm', 	width: '100px', type: 'output'},
	        {caption: ['사업자번호'], 	ref: 'brno', 		width: '100px', type: 'output'},
	        {caption: ['담당자'], 		ref: 'picNm',		width: '80px', 	type: 'output'},
	        {caption: ['전화번호'], 	ref: 'telno', 		width: '100px', type: 'output'},
	        {caption: ['비고'], 		ref: 'rmrk', 		width: '200px', type: 'output'},
	        {caption: ['APC코드'], 		ref: 'apcCd', 		hidden : true},
	    ];
	    grdCnpt = _SBGrid.create(SBGridProperties);
	}

	function fn_modalCnpt(){
		fn_createCnptGrid();
	}

</script>
</html>