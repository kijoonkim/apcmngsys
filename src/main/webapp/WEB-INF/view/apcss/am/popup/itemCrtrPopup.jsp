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
						<sbux-button id="btnSearchItem" name="btnSearchItem" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchItem"></sbux-button>
						<sbux-button id="btnEndItem" name="btnEndItem" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-itemCrtr')"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 15%">
						<col style="width: 30%">
						<col style="width: 15%">
						<col style="width: 30%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="item-inp-apcNm" name="item-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">품목명</th>
							<th class="td_input">
								<sbux-input id="item-inp-itemNm" name="item-inp-itemNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdItem" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonItem = [];
	function fn_createItemGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdItem';
	    SBGridProperties.id = 'grdItem';
	    SBGridProperties.jsonref = 'jsonItem';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ['순번'], ref: 'rowSeq', width: '100px', type: 'output'},
	        {caption: ['품목코드'], ref: 'itemCd', width: '100px', type: 'output'},
	        {caption: ['품목명'], ref: 'itemNm', width: '100px', type: 'output'},
	        {caption: ['APC코드'], ref: 'apcCd', hidden : true},

	    ];
	    grdItem = _SBGrid.create(SBGridProperties);
	}

	function fn_modalItem(){
		fn_createItemGrid();
	}

</script>
</html>