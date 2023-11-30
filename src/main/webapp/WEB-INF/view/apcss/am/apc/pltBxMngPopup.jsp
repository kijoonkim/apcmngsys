<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 팔레트/박스 등록</title>
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
						<sbux-button id="btnSearchPltBx" name="btnSearchPltBx" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchPltBxList"></sbux-button>
						<sbux-button id="btnSavePltBx" name="btnSavePltBx" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_savePltBxList"></sbux-button>
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
		SBUxMethod.set("pltBx-inp-apcNm", SBUxMethod.get("inp-apcNm"));
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPlt';
	    SBGridProperties.id = 'grdPlt';
	    SBGridProperties.jsonref = 'jsonPlt';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuListPlt;	// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [
	        {caption: ["팔레트 정보","처리"], 			ref: 'delYn',   			type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdPlt\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdPlt\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["팔레트 정보","코드"], 			ref: 'pltBxCd',  		type:'output',  width:'100px',     style:'text-align:center', hidden : true},
	        {caption: ["팔레트 정보","팔레트 명"], 		ref: 'pltBxNm',  		type:'input',  width:'230px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100}), typeinfo : {maxlength : 33}},
	        {caption: ["팔레트 정보","대여업체"], 		ref: 'rmrk',  type:'inputcombo',  width:'150px',    style:'text-align:center',
    			typeinfo : {ref:'comboGridPltCnptJsData', displayui : false,	itemcount: 10, label:'label', value:'value', maxlength : 33}},
	        {caption: ["팔레트 정보","단중"], 			ref: 'unitWght',   		type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["팔레트 정보","단위"], 			ref: 'unitCd',   		type:'combo',  width:'130px',    style:'text-align:center',
				typeinfo : {ref:'comboUnitCdJsData', label:'label', value:'value', displayui : false, itemcount: 10}},
	        {caption: ["팔레트 정보","기초재고수량"], 	ref: 'bssInvntrQntt',  	type:'input',  width:'130px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["팔레트 정보","사용유무"], 		ref: 'useYn',   		type:'combo',  width:'130px',    style:'text-align:center',
	        			typeinfo : {ref:'comboUesYnJsData', label:'label', value:'value', displayui : false, itemcount: 10}},
		    {caption: ["팔레트 정보","팔레트/박스 구분코드"], 	ref: 'pltBxSeCd',  	hidden : true},
		    {caption: ["팔레트 정보","APC코드"], 				ref: 'apcCd',  		hidden : true}
	    ];
	    grdPlt = _SBGrid.create(SBGridProperties);
	    fn_callSelectPltList();
	}
	
	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListPlt = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldPlt,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldPlt() {
    	grdPlt.exportLocalExcel("팔레트 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	// 박스 정보 Grid 생성
	var jsonBx = []; // 그리드의 참조 데이터 주소 선언
	async function fn_bxMngCreateGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdBx';
	    SBGridProperties.id = 'grdBx';
	    SBGridProperties.jsonref = 'jsonBx';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuListBx;	// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [
			{caption: ["박스 정보","처리"], 		ref: 'delYn',   	type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdBx\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdBx\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["박스 정보","코드"], 		ref: 'pltBxCd',  		type:'output',  width:'100px',     style:'text-align:center', hidden : true},
	        {caption: ["박스 정보","박스 명"], 		ref: 'pltBxNm',  		type:'input',  width:'230px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100}),typeinfo : {maxlength : 33}},
	        {caption: ["박스 정보","대여업체"], 		ref: 'rmrk',  type:'inputcombo',  width:'150px',    style:'text-align:center',
    			typeinfo : {ref:'comboGridPltCnptJsData', displayui : false,	itemcount: 10, label:'label', value:'value', maxlength : 33}},
	        {caption: ["박스 정보","단중"], 		ref: 'unitWght',   		type:'input',  width:'100px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["박스 정보","단위"], 		ref: 'unitCd',   		type:'combo',  width:'130px',    style:'text-align:center',
				typeinfo : {ref:'comboUnitCdJsData', label:'label', value:'value', displayui : false, itemcount: 10}},
	        {caption: ["박스 정보","기초재고수량"], ref: 'bssInvntrQntt',  	type:'input',  width:'130px',    style:'text-align:center', typeinfo : {mask : {alias : 'numeric'}}},
	        {caption: ["박스 정보","사용유무"], 	ref: 'useYn',   		type:'combo',  width:'130px',    style:'text-align:center',
						typeinfo : {ref:'comboUesYnJsData', label:'label', value:'value', displayui : false, itemcount: 10}},
		    {caption: ["박스 정보","팔레트/박스 구분코드"], 	ref: 'pltBxSeCd',  	hidden : true},
		    {caption: ["박스 정보","APC코드"], 					ref: 'apcCd',  		hidden : true}

	    ];
	    grdBx = _SBGrid.create(SBGridProperties);
	    fn_callSelectBxList();
	}
	
	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListBx = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldBx,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldBx() {
    	grdBx.exportLocalExcel("박스 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	// 팔레트 목록 조회
	async function fn_callSelectPltList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectPltBxList.do", {apcCd : apcCd, pltBxSeCd : "P"});
        let data = await postJsonPromise;
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
				  , rmrk			: item.rmrk
				}
				jsonPlt.push(Object.assign({}, pltBxVO));
			});
        	grdPlt.rebuild();
        	grdPlt.addRow(true);
        	grdPlt.setCellDisabled(grdPlt.getRows() -1, 0, grdPlt.getRows() -1, grdPlt.getCols() -1, true);
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	// 박스 목록 조회
	async function fn_callSelectBxList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectPltBxList.do", {apcCd : apcCd, pltBxSeCd : "B"});
        let data = await postJsonPromise;
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
				  , rmrk			: item.rmrk
				}
				jsonBx.push(Object.assign({}, pltBxVO));
			});
        	grdBx.rebuild();
        	grdBx.addRow(true);
        	grdBx.setCellDisabled(grdBx.getRows() -1, 0, grdBx.getRows() -1, grdBx.getCols() -1, true);
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	async function fn_searchPltBxList(){
		fn_callSelectPltList();
		fn_callSelectBxList();
	}
	async function fn_savePltBxList(){

		// 팔레트 전체 Data
		let pltGridData = grdPlt.getGridDataAll();
		// 박스 전체 Data
		let bxGridData = grdBx.getGridDataAll();

		var pltBxList = [];

		// 팔레트 등록 data 분류
		for(var i=2; i<=pltGridData.length+1; i++ ){
			const rowData = grdPlt.getRowData(i);
			if(rowData.delYn != 'N')
				continue;
			const rowSts = grdPlt.getRowStatus(i);



    		if(gfn_isEmpty(rowData.pltBxNm)){
				gfn_comAlert("W0002", "팔레트 명");			//	W0002	{0}을/를 입력하세요.
				return;
    		}
    		if(gfn_isEmpty(rowData.unitWght)){
				gfn_comAlert("W0002", "단중");			//	W0002	{0}을/를 입력하세요.
				return;
    		}
    		if(gfn_isEmpty(rowData.unitCd)){
				gfn_comAlert("W0001", "단위");			//	W0001	{0}을/를 선택하세요.
				return;
    		}

			if (rowSts === 3){
				rowData.rowSts = "I";
				pltBxList.push(rowData);
			} else if (rowSts === 2){
				rowData.rowSts = "U";
				pltBxList.push(rowData);
			} else {
				continue;
			}
		}

		// 박스 등록 data 분류
		for(var i=2; i<=bxGridData.length+1; i++ ){
			const rowData = grdBx.getRowData(i);
			if(rowData.delYn != 'N')
				continue;
			const rowSts = grdBx.getRowStatus(i);
    		if(gfn_isEmpty(rowData.pltBxNm)){
				gfn_comAlert("W0002", "박스 명");			//	W0002	{0}을/를 입력하세요.
				return;
    		}
    		if(gfn_isEmpty(rowData.unitWght)){
				gfn_comAlert("W0002", "단중");			//	W0002	{0}을/를 입력하세요.
				return;
    		}
    		if(gfn_isEmpty(rowData.unitCd)){
				gfn_comAlert("W0001", "단위");			//	W0001	{0}을/를 선택하세요.
				return;
    		}

			if (rowSts === 3){
				rowData.rowSts = "I";
				pltBxList.push(rowData);
			} else if (rowSts === 2){
				rowData.rowSts = "U";
				pltBxList.push(rowData);
			} else {
				continue;
			}
		}

		if(pltBxList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
			return;
		}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
    	const postJsonPromise = gfn_postJSON("/am/cmns/multiPltBxList.do", pltBxList);	// 프로그램id 추가

		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_callSelectPltList();
        		fn_callSelectBxList();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
	}

	async function fn_deletepltBx(pltBxVO){
		let postJsonPromise2 = await gfn_postJSON("/am/cmns/deletePltBx.do", pltBxVO);
	}

</script>
</html>