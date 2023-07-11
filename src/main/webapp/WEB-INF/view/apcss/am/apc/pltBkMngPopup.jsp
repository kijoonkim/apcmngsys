<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section class="content container-fluid">
		<div class="row">
			<div class="box box-solid">
				<div class="box-header">
					<h3 class="box-title"> ▶ 팔레트/박스 등록 (팝업)</h3>
					<div class="ad_tbl_top">
						<div class="ad_tbl_toplist">
							<button type="button" class="btn btn-sm btn-outline-danger">등록</button>
							<button type="button" class="btn btn-sm btn-outline-danger">종료</button>
						</div>
					</div>
				</div>
				<div class="box-body">
					<!--[pp] 검색 -->
					<table class="table table-bordered tbl_row tbl_fixed">
						<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: 10%">
							<col style="width: 40%">
							<col style="width: 60%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">APC명</th>

								<th>
									<input type="text" class="form-control input-sm" placeholder="" disabled>
								</th>
								<th>&nbsp;</th>
							</tr>
						</tbody>
					</table>

					<!--[pp] //검색 -->
					<!--[pp] 검색결과 -->
					<div class="table-responsive tbl_scroll_sm">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>원물입고</span></li>
							</ul>
						</div>
						<div id="pltMngGridArea" style="height:150px; width: 100%;"></div>
						<div id="bkMngGridArea" style="height:150px; width: 100%"></div>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>상품출하</span></li>
							</ul>
						</div>
						<div id="pckgMngGridArea" style="height:150px; width: 100%"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	// 팔레트/박스 등록
	// 팔레트 정보
	var pltMngGridData = []; // 그리드의 참조 데이터 주소 선언
	function fn_pltMngCreateGrid() {
		pltMngGridData = [];
	    let SBGridProperties = {};
	    SBGridProperties.parentid = 'pltMngGridArea';
	    SBGridProperties.id = 'pltMngDatagrid';
	    SBGridProperties.jsonref = 'pltMngGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["팔레트 정보","코드"], 		ref: 'cd',  		type:'input',  width:'100px',     style:'text-align:center'},
	        {caption: ["팔레트 정보","팔레트 명"], 	ref: 'pltNm',  		type:'input',  width:'250px',    style:'text-align:center'},
	        {caption: ["팔레트 정보","단중 (KG)"], 	ref: 'unitWght',   	type:'input',  width:'150px',    style:'text-align:center'},
	        {caption: ["팔레트 정보","사용유무"], 	ref: 'useYn',   	type:'combo',  width:'100px',    style:'text-align:center',
	        			typeinfo : {ref:'comboUesYnJsData', label:'label', value:'value', unselect: {label : '선택', value: ''}, displayui : true}},
	        {caption: ["팔레트 정보","처리"], 		ref: 'delYn',   	type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"pltMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"pltMngDatagrid\", " + nRow + ")'>삭제</button>";
	        	}
		    }}
	    ];
	    window.pltMngDatagrid = _SBGrid.create(SBGridProperties);
	    pltMngDatagrid.addRow();
	}

	// 박스 정보
	var bkMngGridData = []; // 그리드의 참조 데이터 주소 선언
	function fn_bkMngCreateGrid() {
		bkMngGridData = [];
	    let SBGridProperties = {};
	    SBGridProperties.parentid = 'bkMngGridArea';
	    SBGridProperties.id = 'bkMngDatagrid';
	    SBGridProperties.jsonref = 'bkMngGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["박스 정보","코드"], 		ref: 'PLT_BX_CD',  		type:'input',  width:'100px',     style:'text-align:center'},
	        {caption: ["박스 정보","박스 명"], 		ref: 'pltNm',  		type:'input',  width:'250px',    style:'text-align:center'},
	        {caption: ["박스 정보","단중 (KG)"], 	ref: 'unitWght',   	type:'input',  width:'150px',    style:'text-align:center'},
	        {caption: ["박스 정보","사용유무"], 	ref: 'useYn',   	type:'combo',  width:'100px',    style:'text-align:center',
						typeinfo : {ref:'comboUesYnJsData', label:'label', value:'value', displayui : true}},
				{caption: ["박스 정보","처리"], 		ref: 'delYn',   	type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"bkMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"bkMngDatagrid\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
		    
	    ];
	    window.bkMngDatagrid = _SBGrid.create(SBGridProperties);
	    bkMngDatagrid.addRow();
	}

	// 상품출하
	var pckgMngGridData = []; // 그리드의 참조 데이터 주소 선언
	function fn_pckgMngCreateGrid() {
		pckgMngGridData = [];
	    let SBGridProperties = {};
	    SBGridProperties.parentid = 'pckgMngGridArea';
	    SBGridProperties.id = 'pckgMngDatagrid';
	    SBGridProperties.jsonref = 'pckgMngGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["코드"], 				ref: 'cd',  		type:'input',  width:'150px',    style:'text-align:center'},
	        {caption: ["출하 포장단위 명"], 	ref: 'pckgNm',  	type:'input',  width:'350px',    style:'text-align:center'},
	        {caption: ["사용유무"], 			ref: 'useYn',   	type:'combo',  	width:'100px',    style:'text-align:center',
						typeinfo : {ref:'comboUesYnJsData', label:'label', value:'value', displayui : true}},
				{caption: ["처리"], 				ref: 'delYn',   	type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"pckgMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"pckgMngDatagrid\", " + nRow + ")'>삭제</button>";
	        	}
		    }}
	    ];
	    window.pckgMngDatagrid = _SBGrid.create(SBGridProperties);
	    pckgMngDatagrid.addRow();
	}
</script>
</html>