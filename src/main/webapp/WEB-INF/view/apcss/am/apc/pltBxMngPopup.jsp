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
						<sbux-button id="btnPltbxReg" name="btnPltbxReg" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger" onclick="fn_insertPltBxList"></sbux-button>
						<sbux-button id="btnPltbxEnd" name="btnPltbxEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="fn_closeModal('pltBxMngModal')"></sbux-button>
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
							<col style="width: auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">APC명</th>
								<th>
									<sbux-input id=pltbxApcNm name="pltbxApcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
								</th>
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
						<div id="pltMngGridArea" style="height:200px; width: 100%;"></div>
						<div id="bxMngGridArea" style="height:200px; width: 100%"></div>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>출하포장단위</span></li>
							</ul>
						</div>
						<div id="pckgMngGridArea" style="height:200px; width: 100%"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	// 팔레트/박스 등록
	// 팔레트 정보 Grid 생성
	var pltMngGridData = []; // 그리드의 참조 데이터 주소 선언
	async function fn_pltMngCreateGrid() {

		SBUxMethod.set("pltbxApcNm", SBUxMethod.get("apcNm"));

		pltMngGridData = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'pltMngGridArea';
	    SBGridProperties.id = 'pltMngDatagrid';
	    SBGridProperties.jsonref = 'pltMngGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["팔레트 정보","코드"], 			ref: 'pltBxCd',  		type:'output',  width:'100px',     style:'text-align:center'},
	        {caption: ["팔레트 정보","팔레트 명"], 		ref: 'pltBxNm',  		type:'input',  width:'250px',    style:'text-align:center'},
	        {caption: ["팔레트 정보","단중"], 			ref: 'unitWght',   		type:'input',  width:'150px',    style:'text-align:center'},
	        {caption: ["팔레트 정보","단위"], 			ref: 'unitCd',   		type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'comboUnitCdJsData', label:'label', value:'value', unselect: {label : '선택', value: ''}, displayui : true}},
	        {caption: ["팔레트 정보","기초재고수량"], 	ref: 'bssInvntrQntt',  	type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["팔레트 정보","사용유무"], 		ref: 'useYn',   		type:'combo',  width:'100px',    style:'text-align:center',
	        			typeinfo : {ref:'comboUesYnJsData', label:'label', value:'value', unselect: {label : '선택', value: ''}, displayui : true}},
	        {caption: ["팔레트 정보","처리"], 			ref: 'delYn',   			type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' style='font-size: x-small;' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"pltMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' style='font-size: x-small;' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"pltMngDatagrid\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
		    {caption: ["팔레트 정보","팔레트/박스 구분코드"], 	ref: 'pltBxSeCd',  	hidden : true},
		    {caption: ["팔레트 정보","APC코드"], 				ref: 'apcCd',  		hidden : true}
	    ];
	    pltMngDatagrid = _SBGrid.create(SBGridProperties);
	    fn_selectPltbxList("P");
	}

	async function fn_selectPltbxList(pltBxSeCd){
		fn_callSelectPltbxList(pltBxSeCd);
	}

	// 박스 정보 Grid 생성
	var bxMngGridData = []; // 그리드의 참조 데이터 주소 선언
	async function fn_bxMngCreateGrid() {
		bxMngGridData = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'bxMngGridArea';
	    SBGridProperties.id = 'bxMngDatagrid';
	    SBGridProperties.jsonref = 'bxMngGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["박스 정보","코드"], 		ref: 'pltBxCd',  		type:'output',  width:'100px',     style:'text-align:center'},
	        {caption: ["박스 정보","박스 명"], 		ref: 'pltBxNm',  		type:'input',  width:'250px',    style:'text-align:center'},
	        {caption: ["박스 정보","단중"], 		ref: 'unitWght',   		type:'input',  width:'150px',    style:'text-align:center'},
	        {caption: ["박스 정보","단위"], 		ref: 'unitCd',   		type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'comboUnitCdJsData', label:'label', value:'value', displayui : true}},
	        {caption: ["박스 정보","기초재고수량"], ref: 'bssInvntrQntt',  	type:'input',  width:'100px',    style:'text-align:center'},
	        {caption: ["박스 정보","사용유무"], 	ref: 'useYn',   		type:'combo',  width:'100px',    style:'text-align:center',
						typeinfo : {ref:'comboUesYnJsData', label:'label', value:'value', unselect: {label : '선택', value: ''}, displayui : true}},
			{caption: ["박스 정보","처리"], 		ref: 'delYn',   	type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' style='font-size: x-small;' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"bxMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' style='font-size: x-small;' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"bxMngDatagrid\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
		    {caption: ["박스 정보","팔레트/박스 구분코드"], 	ref: 'pltBxSeCd',  	hidden : true},
		    {caption: ["박스 정보","APC코드"], 					ref: 'apcCd',  		hidden : true}

	    ];
	    bxMngDatagrid = _SBGrid.create(SBGridProperties);
	    fn_selectPltbxList("B");
	}

	// 팔레트/박스 목록 조회
	async function fn_callSelectPltbxList(pltBxSeCd){
		let apcCd = SBUxMethod.get("apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectPltBxList.do", {apcCd : apcCd, pltBxSeCd : pltBxSeCd});
        let data = await postJsonPromise;
        let newPltbxGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let pltbxList = {
				    pltBxCd 		: item.pltBxCd
				  , pltBxNm 		: item.pltBxNm
				  , unitWght 		: item.unitWght
				  , bssInvntrQntt 	: item.bssInvntrQntt
				  , useYn 			: item.useYn
				  , delYn 			: item.delYn
				  , pltBxSeCd 		: item.pltBxSeCd
				  , apcCd 			: item.apcCd
				}
				newPltbxGridData.push(pltbxList);
			});
        	if(pltBxSeCd === "P"){
        		pltMngGridData = newPltbxGridData;
	        	pltMngDatagrid.rebuild();
	        	pltMngDatagrid.addRow();
        	}
        	if(pltBxSeCd === "B"){
        		bxMngGridData = newPltbxGridData;
        		bxMngDatagrid.rebuild();
        		bxMngDatagrid.addRow(true);
        	}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	// 출하포장단위 Grid 생성
	var pckgMngGridData = []; // 그리드의 참조 데이터 주소 선언
	async function fn_pckgMngCreateGrid() {
		pckgMngGridData = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'pckgMngGridArea';
	    SBGridProperties.id = 'pckgMngDatagrid';
	    SBGridProperties.jsonref = 'pckgMngGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["코드"], 				ref: 'cdVl',  		type:'output',  hidden : true},
	        {caption: ["출하 포장단위 명"], 	ref: 'cdVlNm',  	type:'input',  width:'350px',    style:'text-align:center'},
	        {caption: ["비고"], 				ref: 'cdVlExpln',   type:'input',  width:'300px',    style:'text-align:center'},
	        {caption: ["사용유무"], 			ref: 'delYn',   	type:'combo',  	width:'100px',    style:'text-align:center',
						typeinfo : {ref:'comboReverseYnJsData', 	label:'label', value:'value', displayui : true}},
			{caption: ["처리"], 				ref: 'delYn',   	type:'button',  width:'100px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' style='font-size: x-small;' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"pckgMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' style='font-size: x-small;' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"pckgMngDatagrid\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
		    {caption: ["APC코드"], 		ref: 'apcCd',   	hidden : true},
	        {caption: ["공통ID"], 		ref: 'cdId',   		hidden : true}
	    ];
	    window.pckgMngDatagrid = _SBGrid.create(SBGridProperties);
	    fn_selectPckgList();
	}

	async function fn_selectPckgList(){
		fn_callSelectPckgList();
	}

	// 출하단위포장 목록 조회
	async function fn_callSelectPckgList(){
		let apcCd = SBUxMethod.get("apcCd");
    	let postJsonPromise = gfn_postJSON("/co/cd/comCdDtls", {apcCd : apcCd, cdId : 'PCKG_SE_CD'});
        let data = await postJsonPromise;
        let newPckgGridData = [];
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
				newPckgGridData.push(pckgList);
			});
        	pckgMngGridData = newPckgGridData;
        	pckgMngDatagrid.rebuild();
        	pckgMngDatagrid.addRow(true);
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_insertPltBxList(){

		// 팔레트 전체 Data
		let pltGridData = pltMngDatagrid.getGridDataAll();
		// 박스 전체 Data
		let bxGridData = bxMngDatagrid.getGridDataAll();
		// 출하포장단위 전체 Data
		let pckgGridData = pckgMngDatagrid.getGridDataAll();

		let insertPltList = [];			// 팔레트 insertList
		let updatePltList = [];			// 팔레트 updateList
		let insertBxList = [];			// 박스 insrtList
		let updateBxList = [];			// 박스 updateList
		let insertPckgList = [];		// 출하포장단위 insertList
		let updatePckgList = [];		// 출하포장단위 updateList

		let insertPltListCnt = 0;		// 팔레트 insert 결과값
		let updatePltListCnt = 0;		// 팔레트 update 결과값
		let insertbxListCnt = 0;		// 박스 isnert 결과값
		let updatebxListCnt = 0;		// 박스 update 결과값
		let insertPckgListCnt = 0;		// 출하포장단위 insert 결과값
		let updatePckgListCnt = 0;		// 출하포장단위 update 결과값

		// 팔레트 등록 data 분류
		for(var i=2; i<=pltGridData.length+1; i++ ){
			if(!(pltMngDatagrid.getRowData(i).delYn == "" || pltMngDatagrid.getRowData(i).delYn == null)){
				if(pltMngDatagrid.getRowData(i).pltBxCd == null || pltMngDatagrid.getRowData(i).pltBxCd == ""){
					alert("팔레트 코드는 필수 값 입니다.");
					return;
				}
				if(pltMngDatagrid.getRowData(i).pltBxNm == null || pltMngDatagrid.getRowData(i).pltBxNm == ""){
					alert("팔레트 명은 필수 값 입니다.");
					return;
				}
				if(pltMngDatagrid.getRowData(i).unitWght == null || pltMngDatagrid.getRowData(i).unitWght == ""){
					alert("단중은 필수 값 입니다.");
					return;
				}
				if(pltMngDatagrid.getRowData(i).unitCd == null || pltMngDatagrid.getRowData(i).unitCd == ""){
					alert("단위는 필수 선택 입니다.");
					return;
				}

				if(pltMngDatagrid.getRowStatus(i) === 3){
					insertPltList.push(pltMngDatagrid.getRowData(i));
				}
				if(pltMngDatagrid.getRowStatus(i) === 2){
					updatePltList.push(pltMngDatagrid.getRowData(i));
				}
			}
		}

		// 박스 등록 data 분류
		for(var i=2; i<=pltGridData.length+1; i++ ){
			if(!(bxMngDatagrid.getRowData(i).delYn == "" || bxMngDatagrid.getRowData(i).delYn == null)){

				if(bxMngDatagrid.getRowData(i).pltBxCd == null || bxMngDatagrid.getRowData(i).pltBxCd == ""){
					alert("박스 코드는 필수 값 입니다.");
					return;
				}
				if(bxMngDatagrid.getRowData(i).pltBxNm == null || bxMngDatagrid.getRowData(i).pltBxNm == ""){
					alert("박스 명은 필수 값 입니다.");
					return;
				}
				if(bxMngDatagrid.getRowData(i).unitWght == null || bxMngDatagrid.getRowData(i).unitWght == ""){
					alert("단중은 필수 값 입니다.");
					return;
				}
				if(bxMngDatagrid.getRowData(i).unitCd == null || bxMngDatagrid.getRowData(i).unitCd == ""){
					alert("단위는 필수 선택 입니다.");
					return;
				}

				if(bxMngDatagrid.getRowStatus(i) === 3){
					insertBxList.push(bxMngDatagrid.getRowData(i));
				}
				if(bxMngDatagrid.getRowStatus(i) === 2){
					updateBxList.push(bxMngDatagrid.getRowData(i));
				}
			}
		}


		// 출하포장단위 등록 data 분류
		for(var i=1; i<=pckgGridData.length; i++ ){
			if(!(pckgMngDatagrid.getRowData(i).delYn == "" || pckgMngDatagrid.getRowData(i).delYn == null)){

				if(pckgMngDatagrid.getRowData(i).cdVlNm == null || pckgMngDatagrid.getRowData(i).cdVlNm == ""){
					alert("포장단위 명은 필수 값 입니다.");
					return;
				}

				if(pckgMngDatagrid.getRowStatus(i) === 3){
					insertPckgList.push(pckgMngDatagrid.getRowData(i));
				}
				if(pckgMngDatagrid.getRowStatus(i) === 2){
					updatePckgList.push(pckgMngDatagrid.getRowData(i));
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
				insertPltListCnt = await fn_callInsertPltBxList(insertPltList);
			}
			if(updatePltList.length > 0){
				updatePltListCnt = await fn_callUpdatePltBxList(updatePltList);
			}

			if(insertBxList.length > 0){
				insertBxListCnt = await fn_callInsertPltBxList(insertBxList);
			}
			if(updateBxList.length > 0){
				updateBxListCnt = await fn_callUpdatePltBxList(updateBxList);
			}

			if(insertPckgList.length > 0){
				insertPckgListCnt = await fn_callInsertRsrcList(insertPckgList);
			}
			if(updatePckgList.length > 0){
				updatePckgListCnt = await fn_callUpdateRsrcList(updatePckgList);
			}

			if(insertPltListCnt + updatePltListCnt > 0){
				fn_selectPltbxList("P");
			}

			if(insertBxListCnt + updateBxListCnt > 0){
				fn_selectPltBxList("B");
			}

			if(insertPckgListCnt + updatePckgListCnt > 0){
				fn_selectPckgList();
			}

			if(insertPltListCnt + updatePltListCnt + insertBxListCnt + updateBxListCnt + insertPckgListCnt + updatePckgListCnt > 0){
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