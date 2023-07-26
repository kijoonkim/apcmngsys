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
						<sbux-button id="btnSearchPltBx" name="btnSearchPltBx" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertPltBxList"></sbux-button>
						<sbux-button id="btnEndPltBx" name="btnEndPltBx" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('modal-pltBx')"></sbux-button>
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
					<div class="table-responsive tbl_scroll_sm">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>출하포장단위</span></li>
							</ul>
						</div>
						<div id="sb-area-grdPckg" style="height:213px; width: 100%"></div>
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
	    fn_selectPltbxList("P");
	}

	async function fn_selectPltbxList(pltBxSeCd){
		fn_callSelectPltbxList(pltBxSeCd);
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
	    fn_selectPltbxList("B");
	}

	// 팔레트/박스 목록 조회
	async function fn_callSelectPltbxList(pltBxSeCd){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectPltBxList.do", {apcCd : apcCd, pltBxSeCd : pltBxSeCd});
        let data = await postJsonPromise;
        let newJsonPltBx = [];
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
				newJsonPltBx.push(pltBxVO);
			});
        	if(pltBxSeCd === "P"){
        		jsonPlt = newJsonPltBx;
        		grdPlt.rebuild();
        		grdPlt.addRow();
        	}
        	if(pltBxSeCd === "B"){
        		jsonBx = newJsonPltBx;
        		grdBx.rebuild();
        		grdBx.addRow(true);
        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	// 출하포장단위 Grid 생성
	var jsonPckg = []; // 그리드의 참조 데이터 주소 선언
	async function fn_pckgMngCreateGrid() {
		pckgMngGridData = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckg';
	    SBGridProperties.id = 'grdPckg';
	    SBGridProperties.jsonref = 'jsonPckg';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["코드"], 				ref: 'cdVl',  		type:'output',  hidden : true},
	        {caption: ["출하 포장단위 명"], 	ref: 'cdVlNm',  	type:'input',  width:'350px',    style:'text-align:center'},
	        {caption: ["비고"], 				ref: 'cdVlExpln',   type:'input',  width:'400px',    style:'text-align:center'},
	        {caption: ["사용유무"], 			ref: 'delYn',   	type:'combo',  	width:'100px',    style:'text-align:center',
						typeinfo : {ref:'comboReverseYnJsData', 	label:'label', value:'value', displayui : true}},
			{caption: ["처리"], 				ref: 'delYn',   	type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdPckg\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdPckg\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
		    {caption: ["APC코드"], 		ref: 'apcCd',   	hidden : true},
	        {caption: ["공통ID"], 		ref: 'cdId',   		hidden : true}
	    ];
	    window.grdPckg = _SBGrid.create(SBGridProperties);
	    fn_selectPckgList();
	}

	async function fn_selectPckgList(){
		fn_callSelectPckgList();
	}

	// 출하단위포장 목록 조회
	async function fn_callSelectPckgList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/co/cd/comCdDtls", {apcCd : apcCd, cdId : 'PCKG_SE_CD'});
        let data = await postJsonPromise;
        let newJsonPckg = [];
        try{
        	data.resultList.forEach((item, index) => {
				let pckgList = {
					rowSeq : 	item.rowSeq
				  , cdVl :	 	item.cdVl
				  , cdVlNm : 	item.cdVlNm
				  , cdVlExpln : item.cdVlExpln
				  , delYn : 	item.delYn
				  , apcCd : 	item.apcCd
				  , cdId : 		item.cdId
				}
				newJsonPckg.push(pckgList);
			});
        	jsonPckg = newJsonPckg;
        	grdPckg.rebuild();
        	grdPckg.addRow(true);
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
		// 출하포장단위 전체 Data
		let pckgGridData = grdPckg.getGridDataAll();

		let insertPltList = [];			// 팔레트 insertList
		let updatePltList = [];			// 팔레트 updateList
		let insertBxList = [];			// 박스 insrtList
		let updateBxList = [];			// 박스 updateList
		let insertPckgList = [];		// 출하포장단위 insertList
		let updatePckgList = [];		// 출하포장단위 updateList

		let insertPltCnt = 0;		// 팔레트 insert 결과값
		let updatePltCnt = 0;		// 팔레트 update 결과값
		let insertBxCnt = 0;		// 박스 isnert 결과값
		let updateBxCnt = 0;		// 박스 update 결과값
		let insertPckgCnt = 0;		// 출하포장단위 insert 결과값
		let updatePckgCnt = 0;		// 출하포장단위 update 결과값

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

				if(grdPlt.getRowStatus(i) === 3){
					insertPltList.push(grdPlt.getRowData(i));
				}
				if(grdPlt.getRowStatus(i) === 2){
					updatePltList.push(grdPlt.getRowData(i));
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

				if(grdBx.getRowStatus(i) === 3){
					insertBxList.push(grdBx.getRowData(i));
				}
				if(grdBx.getRowStatus(i) === 2){
					updateBxList.push(grdBx.getRowData(i));
				}
			}
		}


		// 출하포장단위 등록 data 분류
		for(var i=1; i<=pckgGridData.length; i++ ){
			if(!(grdPckg.getRowData(i).delYn == "" || grdPckg.getRowData(i).delYn == null)){

				if(grdPckg.getRowData(i).cdVlNm == null || grdPckg.getRowData(i).cdVlNm == ""){
					alert("포장단위 명은 필수 값 입니다.");
					return;
				}

				if(grdPckg.getRowStatus(i) === 3){
					insertPckgList.push(grdPckg.getRowData(i));
				}
				if(grdPckg.getRowStatus(i) === 2){
					updatePckgList.push(grdPckg.getRowData(i));
				}
			}
		}

		if(insertPltList.length + updatePltList.length + insertBxList.length + updateBxList.length + insertPckgList.length + updatePckgList.length == 0){
			alert("등록 할 내용이 없습니다.");
			return;
		}
		let regMsg = "등록 하시겠습니까?";
		if(confirm(regMsg)){
			if(insertPltList.length > 0){
				insertPltCnt = await fn_callInsertPltBxList(insertPltList);
			}
			if(updatePltList.length > 0){
				updatePltCnt = await fn_callUpdatePltBxList(updatePltList);
			}

			if(insertBxList.length > 0){
				insertBxCnt = await fn_callInsertPltBxList(insertBxList);
			}
			if(updateBxList.length > 0){
				updateBxCnt = await fn_callUpdatePltBxList(updateBxList);
			}

			if(insertPckgList.length > 0){
				insertPckgCnt = await fn_callInsertRsrcList(insertPckgList);
			}
			if(updatePckgList.length > 0){
				updatePckgCnt = await fn_callUpdateRsrcList(updatePckgList);
			}

			if(insertPltCnt + updatePltCnt > 0){
				fn_selectPltbxList("P");
			}

			if(insertBxCnt + updateBxCnt > 0){
				fn_selectPltBxList("B");
			}

			if(insertPckgCnt + updatePckgCnt > 0){
				fn_selectPckgList();
			}

			if(insertPltCnt + updatePltCnt + insertBxCnt + updateBxCnt + insertPckgCnt + updatePckgCnt > 0){
				alert("등록 되었습니다.");
			}
		}
	}

	// 팔레트/박스 등록 호출
	async function fn_callInsertPltBxList(pltBxList){
		console.log("call >> ")
		let postJsonPromise = gfn_postJSON("/am/cmns/insertPltBxList.do", pltBxList);
        let data = await postJsonPromise;

        try{
        	console.log("data >>> "+ data.result);
       		return data.result;

        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}
	}

	// 팔레트/박스 변경 호출
	async function fn_callUpdatePltBxList(pltBxList){
		let postJsonPromise = gfn_postJSON("/am/cmns/updatePltBxList.do", pltBxList);
        let data = await postJsonPromise;

        try{
        	console.log("data >>> "+ data.result);
       		return data.result;

        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}
	}

	// 팔레트/박스 삭제 호출
	async function fn_deletepltBx(pltBxVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/deletePltBx.do", pltBxVO);
        let data = await postJsonPromise;

        try{
        	if(data.result > 0){
        		alert("삭제 되었습니다.");
        	}else{
        		alert("삭제 도중 오류가 발생 되었습니다.");
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