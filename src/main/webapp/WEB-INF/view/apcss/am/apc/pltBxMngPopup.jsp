<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<section>
		<div class="row">
			<div class="box box-solid">
				<div class="box-header" style="display:flex; justify-content: flex-start;" >
					<div>
						<p>
							<span style="font-weight:bold;">APC에서 관리하고 있는 팔레트와 박스의 종류 및 기초 재고수량을 등록하세요.</span>
						</p>
						<p>
							<span style="color:black; font-weight:bold;">계근대를 사용하는 경우는 단중을 입력해야 합니다.</span>
						</p>
					</div>
					<div style="margin-left: auto;">
						<sbux-button id="btnSearchPltBx" name="btnSearchPltBx" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_insertPltBxList"></sbux-button>
						<sbux-button id="btnEndPltBx" name="btnEndPltBx" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-pltBx')"></sbux-button>
					</div>
				</div>
				<div class="box-body">
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
									<sbux-input id=pltBx-inp-apcNm name="pltBx-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
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
						<div id="sb-area-grdPlt" style="height:213px; width: 100%;"></div>
						<div id="sb-area-grdBx" style="height:213px; width: 100%"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	// 팔레트/박스 등록
	// 팔레트 정보 Grid 생성
	var jsonPlt = []; // 그리드의 참조 데이터 주소 선언
	async function fn_pltMngCreateGrid() {

		console.log("comboUnitCdJsData", comboUnitCdJsData);
		SBUxMethod.set("pltBx-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		pltMngGridData = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPlt';
	    SBGridProperties.id = 'grdPlt';
	    SBGridProperties.jsonref = 'jsonPlt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["팔레트 정보","코드"], 			ref: 'pltBxCd',  		type:'output',  width:'100px',     style:'text-align:center'},
	        {caption: ["팔레트 정보","팔레트 명"], 		ref: 'pltBxNm',  		type:'input',  width:'300px',    style:'text-align:center'},
	        {caption: ["팔레트 정보","단중"], 			ref: 'unitWght',   		type:'input',  width:'150px',    style:'text-align:center'},
	        {caption: ["팔레트 정보","단위"], 			ref: 'unitCd',   		type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'comboUnitCdJsData', label:'label', value:'value', displayui : true}},
	        {caption: ["팔레트 정보","기초재고수량"], 	ref: 'bssInvntrQntt',  	type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["팔레트 정보","사용유무"], 		ref: 'useYn',   		type:'combo',  width:'100px',    style:'text-align:center',
	        			typeinfo : {ref:'comboUesYnJsData', label:'label', value:'value', displayui : true}},
	        {caption: ["팔레트 정보","처리"], 			ref: 'delYn',   			type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdPlt\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdPlt\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
		    {caption: ["팔레트 정보","팔레트/박스 구분코드"], 	ref: 'pltBxSeCd',  	hidden : true},
		    {caption: ["팔레트 정보","APC코드"], 				ref: 'apcCd',  		hidden : true}
	    ];
	    grdPlt = _SBGrid.create(SBGridProperties);
	    fn_callSelectPltList();
	}

	// 박스 정보 Grid 생성
	var jsonBx = []; // 그리드의 참조 데이터 주소 선언
	async function fn_bxMngCreateGrid() {
		bxMngGridData = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdBx';
	    SBGridProperties.id = 'grdBx';
	    SBGridProperties.jsonref = 'jsonBx';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["박스 정보","코드"], 		ref: 'pltBxCd',  		type:'output',  width:'100px',     style:'text-align:center'},
	        {caption: ["박스 정보","박스 명"], 		ref: 'pltBxNm',  		type:'input',  width:'300px',    style:'text-align:center'},
	        {caption: ["박스 정보","단중"], 		ref: 'unitWght',   		type:'input',  width:'150px',    style:'text-align:center'},
	        {caption: ["박스 정보","단위"], 		ref: 'unitCd',   		type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'comboUnitCdJsData', label:'label', value:'value', displayui : true}},
	        {caption: ["박스 정보","기초재고수량"], ref: 'bssInvntrQntt',  	type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["박스 정보","사용유무"], 	ref: 'useYn',   		type:'combo',  width:'100px',    style:'text-align:center',
						typeinfo : {ref:'comboUesYnJsData', label:'label', value:'value',  displayui : true}},
			{caption: ["박스 정보","처리"], 		ref: 'delYn',   	type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdBx\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdBx\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
		    {caption: ["박스 정보","팔레트/박스 구분코드"], 	ref: 'pltBxSeCd',  	hidden : true},
		    {caption: ["박스 정보","APC코드"], 					ref: 'apcCd',  		hidden : true}

	    ];
	    grdBx = _SBGrid.create(SBGridProperties);
	    fn_callSelectBxList();
	}

	// 팔레트 목록 조회
	let newJsonPlt = [];
	async function fn_callSelectPltList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectPltBxList.do", {apcCd : apcCd, pltBxSeCd : "P"});
        let data = await postJsonPromise;
   		newJsonPlt = [];
   		jsonPlt = [];
        try{
        	data.resultList.forEach((item, index) => {
				let pltBxVO = {
				    pltBxCd 		: item.pltBxCd
				  , pltBxNm 		: item.pltBxNm
				  , unitWght 		: item.unitWght
				  , unitCd 			: item.unitCd
				  , bssInvntrQntt 	: item.bssInvntrQntt
				  , useYn 			: item.useYn
				  , delYn 			: item.delYn
				  , pltBxSeCd 		: item.pltBxSeCd
				  , apcCd 			: item.apcCd
				}
				jsonPlt.push(Object.assign({}, pltBxVO));
				newJsonPlt.push(Object.assign({}, pltBxVO));
			});
        	console.log("newJsonPlt", newJsonPlt);
        	grdPlt.rebuild();
        	grdPlt.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	
	// 박스 목록 조회
	let newJsonBx = [];
	async function fn_callSelectBxList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectPltBxList.do", {apcCd : apcCd, pltBxSeCd : "B"});
        let data = await postJsonPromise;
    	newJsonBx = [];
    	jsonBx = [];
        try{
        	data.resultList.forEach((item, index) => {
				let pltBxVO = {
				    pltBxCd 		: item.pltBxCd
				  , pltBxNm 		: item.pltBxNm
				  , unitWght 		: item.unitWght
				  , unitCd 			: item.unitCd
				  , bssInvntrQntt 	: item.bssInvntrQntt
				  , useYn 			: item.useYn
				  , delYn 			: item.delYn
				  , pltBxSeCd 		: item.pltBxSeCd
				  , apcCd 			: item.apcCd
				}
				jsonBx.push(Object.assign({}, pltBxVO));
				newJsonBx.push(Object.assign({}, pltBxVO));
			});
        	console.log("newJsonBx", newJsonBx);
        	grdBx.rebuild();
        	grdBx.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_insertPltBxList(){

		// 팔레트 전체 Data
		let pltGridData = grdPlt.getGridDataAll();
		// 박스 전체 Data
		let bxGridData = grdBx.getGridDataAll();

		// 팔레트 등록 data 분류
		for(var i=2; i<=pltGridData.length+1; i++ ){
			if(!(grdPlt.getRowData(i).delYn == "" || grdPlt.getRowData(i).delYn == null)){
				if(grdPlt.getRowData(i).pltBxNm == null || grdPlt.getRowData(i).pltBxNm == ""){
					alert("팔레트 명은 필수 값 입니다.");
					return;
				}
				if(grdPlt.getRowData(i).unitWght == null || grdPlt.getRowData(i).unitWght == ""){
					alert("단중은 필수 값 입니다.");
					return;
				}
				if(grdPlt.getRowData(i).unitCd == null || grdPlt.getRowData(i).unitCd == ""){
					alert("단위는 필수 선택 입니다.");
					return;
				}
			}
		}

		// 박스 등록 data 분류
		for(var i=2; i<=bxGridData.length+1; i++ ){
			if(!(grdBx.getRowData(i).delYn == "" || grdBx.getRowData(i).delYn == null)){

				if(grdBx.getRowData(i).pltBxNm == null || grdBx.getRowData(i).pltBxNm == ""){
					alert("박스 명은 필수 값 입니다.");
					return;
				}
				if(grdBx.getRowData(i).unitWght == null || grdBx.getRowData(i).unitWght == ""){
					alert("단중은 필수 값 입니다.");
					return;
				}
				if(grdBx.getRowData(i).unitCd == null || grdBx.getRowData(i).unitCd == ""){
					alert("단위는 필수 선택 입니다.");
					return;
				}
			}
		}

		
		var isEqual1 = await chkEqualObj(jsonPlt, newJsonPlt);
		var isEqual2 = await chkEqualObj(jsonBx, newJsonBx);

		
		if(isEqual1 && isEqual2){
			alert("등록 할 내용이 없습니다.");
			return;
		}
		let regMsg = "등록 하시겠습니까?";
		if(await confirm(regMsg)){
			let postJsonPromise1 = await gfn_postJSON("/am/cmns/comparePltBx.do", {origin : newJsonPlt, modified : jsonPlt});
			let postJsonPromise2 = await gfn_postJSON("/am/cmns/comparePltBx.do", {origin : newJsonBx, modified : jsonBx});

			
			alert("등록 되었습니다.");
		}
	}

</script>
</html>