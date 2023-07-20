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
						<sbux-button id="btnSearchVrty" name="btnSearchVrty" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchVrty">조회</sbux-button>
						<sbux-button id="btnChoiceVrty" name="btnChoiceVrty" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="fn_chcVrty">선택</sbux-button>
						<sbux-button id="btnEndVrty" name="btnEndVrty" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('modal-vrtyCrtr')">종료</sbux-button>
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
								<sbux-input id="vrty-inp-apcNm" name="vrty-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">품종명</th>
							<th class="td_input">
								<sbux-input id="vrty-inp-vrtyNm" name="vrty-inp-vrtyNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdVrty" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonVrty = [];
	function fn_createVrtyGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdVrty';
	    SBGridProperties.id = 'grdVrty';
	    SBGridProperties.jsonref = 'jsonVrty';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	    	{caption : ["선택"],
                ref: 'checked', type: 'checkbox', width: '50px', style: 'text-align:center', sortable: false,
                typeinfo : {ignoreupdate : true}
            },
	        {caption: ['품목코드'], ref: 'itemCd', width: '100px', type: 'output'},
	        {caption: ['품목명'], ref: 'itemNm', width: '150px', type: 'output'},
	        {caption: ['품종코드'], ref: 'vrtrCd', width: '100px', type: 'output'},
	        {caption: ['품종명'], ref: 'vrtrNm', width: '150px', type: 'output'},
	        {caption: ['APC코드'], ref: 'apcCd', hidden : true},

	    ];
	    grdVrty = _SBGrid.create(SBGridProperties);
	}

	function fn_modalVrty(){
		fn_createVrtyGrid();
	}

</script>
</html>