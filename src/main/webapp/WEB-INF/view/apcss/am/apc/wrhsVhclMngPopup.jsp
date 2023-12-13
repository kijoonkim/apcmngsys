<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 입고차량정보 등록</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">원물입고 시 차량번호를 관리하는 경우 차량번호를 입력하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold">지역별 운임비용을 관리하는 경우 운임비용 기준정보를 등록하세요.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnWrhsVhclSech" name="btnWrhsVhclSech" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnWrhsVhclReg" name="btnWrhsVhclReg" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_insertWrhsVhclList()"></sbux-button>
					<sbux-button id="btnWrhsVhclEnd" name="btnWrhsVhclEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-wrhsVhcl')"></sbux-button>
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
								<sbux-input id=wrhsVhcl-inp-apcNm name="wrhsVhcl-inp-apcNm" uitype="text" class="form-control pull-right input-sm" disabled></sbux-input>
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
							<li><span>차량정보</span></li>
						</ul>
					</div>
					<div id="sb-area-wrhsVhcl" style="height:157px; width: 100%;"></div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>운송지역별 운임비용 등록</span></li>
						</ul>
					</div>
					<div id="sb-area-rgnTrsprtCst" style="height:157px; width: 100%;"></div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">
	//입고차량정보 등록
	var jsonWrhsVhcl = []; // 그리드의 참조 데이터 주소 선언
	async function fn_wrhsVhclMngCreateGrid() {
		SBUxMethod.set("wrhsVhcl-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		jsonWrhsVhcl = [];
	    let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-wrhsVhcl';
	    SBGridProperties.id = 'grdWrhsVhcl';
	    SBGridProperties.jsonref = 'jsonWrhsVhcl';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.explorerbar = 'move';					// 개인화 컬럼 이동 가능
	    SBGridProperties.contextmenu = true;					// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuListWrhsVhcl;	// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [
	        {caption: ["처리"], 		ref: 'delYn',   type:'button',  width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdWrhsVhcl\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdWrhsVhcl\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["차량번호"], 	ref: 'vhclno',  type:'input', width:'120px',    style:'text-align:center',
  	            validate : gfn_chkByte.bind({byteLimit: 40}), typeinfo : {mask : {alias : '#'}, maxlength : 17 }},
	        {caption: ["기사명"], 		ref: 'drvrNm',  type:'input',  width:'80px',    style:'text-align:center',
	        	validate : gfn_chkByte.bind({byteLimit: 20}), typeinfo : {mask : {alias : 'k'}, maxlength : 20}},
	        {caption: ["은행"], 		ref: 'bankCd',  type:'inputcombo',  width:'120px',    style:'text-align:center',
    			typeinfo : {ref:'comboGridBankCdJsData', label:'label', value:'value', displayui : false, itemcount: 10}},
	        {caption: ["계좌번호"], 	ref: 'actno',  	type:'input',  width:'180px',    style:'text-align:center',
	        	validate : gfn_chkByte.bind({byteLimit: 256}), typeinfo : {mask : {alias : '#-', repeat: '*'}, maxlength : 256}},
	        {caption: ["예금주"], 		ref: 'dpstr',  	type:'input',  width:'80px',    style:'text-align:center',
	        	validate : gfn_chkByte.bind({byteLimit: 20}), typeinfo : {mask : {alias : 'k'}, maxlength : 20}},
	        {caption: ["비고"], 		ref: 'rmrk',  	type:'input',  width:'280px',    style:'text-align:center',
	        	validate : gfn_chkByte.bind({byteLimit: 1000}), typeinfo : {maxlength : 333}},
		    {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}
	    ];
	    grdWrhsVhcl = _SBGrid.create(SBGridProperties);
	    fn_selectWrhsVhclList();
	}
	
	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListWrhsVhcl = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldWrhsVhcl,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldWrhsVhcl() {
    	grdWrhsVhcl.exportLocalExcel("압고차량 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	async function fn_selectWrhsVhclList(){
		fn_callSelectWrhsVhclList();
	}

	async function fn_callSelectWrhsVhclList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectWrhsVhclList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        jsonWrhsVhcl.length = 0;
        try{
        	data.resultList.forEach((item, index) => {
				let wrhsVhcl = {
					vhclno 	: item.vhclno
				  , drvrNm 	: item.drvrNm
				  , bankCd 	: item.bankCd
				  , actno 	: item.actno
				  , dpstr 	: item.dpstr
				  , rmrk 	: item.rmrk
				  , delYn 	: item.delYn
				  , apcCd	: item.apcCd
				}
				jsonWrhsVhcl.push(wrhsVhcl);
			});
        	grdWrhsVhcl.rebuild();
        	grdWrhsVhcl.setCellDisabled(0, 1, grdWrhsVhcl.getRows() -1, 1, true);
        	grdWrhsVhcl.addRow(true);
        	grdWrhsVhcl.setCellDisabled(grdWrhsVhcl.getRows() -1, 0, grdWrhsVhcl.getRows() -1, grdWrhsVhcl.getCols() -1, true);

        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	// 운송지역별 운임비용 등록
    var jsonRgnTrsprtCst = []; // 그리드의 참조 데이터 주소 선언
    async function fn_rgnTrsprtCstMngCreateGrid() {
    	jsonRgnTrsprtCst.length = 0;
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-rgnTrsprtCst';
	    SBGridProperties.id = 'grdRgnTrsprtCst';
	    SBGridProperties.jsonref = 'jsonRgnTrsprtCst';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuListRgnTrsprtCst;		// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.scrollbubbling = false;
        SBGridProperties.columns = [
            {caption: ["처리"], 			ref: 'delYn',   		type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdRgnTrsprtCst\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdRgnTrsprtCst\", " + nRow + ")'>삭제</button>";
            	}
		    }},
            {caption: ["코드"], 			ref: 'trsprtRgnCd',  	type:'output',  width:'100px',     style:'text-align:center', hidden : true},
            {caption: ["운송지역"], 		ref: 'trsprtRgnNm',  	type:'input',  width:'150px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100})},
            {caption: ["운송비용(원)"], 	ref: 'trsprtCst',  		type:'input',  width:'120px',    style:'text-align:right', format : {type:'number', rule:'#,### 원'}, typeinfo : {mask : {alias : 'numeric'}} },
            {caption: ["비고"], 			ref: 'rmrk',  			type:'input',  width:'600px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 1000})},
		    {caption: ["APC코드"], 		ref: 'apcCd',   	type:'input',  hidden : true}
        ];
        grdRgnTrsprtCst = _SBGrid.create(SBGridProperties);
        fn_selectRgnTrsprtCstList();
    }
    
    /**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListRgnTrsprtCst = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldRgnTrsprtCst,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldRgnTrsprtCst() {
    	grdRgnTrsprtCst.exportLocalExcel("운송지역별 운임비용 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	// 출하지시 목록 조회 (조회 버튼)
    async function fn_search() {
    	fn_selectRgnTrsprtCstList();
    	fn_selectWrhsVhclList();
    }

    async function fn_selectRgnTrsprtCstList(){
		fn_callSelectRgnTrsprtCstList();
	}

	async function fn_callSelectRgnTrsprtCstList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectRgnTrsprtCstList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        jsonRgnTrsprtCst.length = 0;
        try{
        	data.resultList.forEach((item, index) => {
				let rgnTrsprtCst = {
				    trsprtRgnCd 	: item.trsprtRgnCd
				  , trsprtRgnNm 	: item.trsprtRgnNm
				  , trsprtCst 		: item.trsprtCst
				  , rmrk 			: item.rmrk
				  , delYn 			: item.delYn
				  , apcCd			: item.apcCd
				}
				jsonRgnTrsprtCst.push(rgnTrsprtCst);
			});
        	grdRgnTrsprtCst.rebuild();
        	grdRgnTrsprtCst.addRow(true);
        	grdRgnTrsprtCst.setCellDisabled(grdRgnTrsprtCst.getRows() -1, 0, grdRgnTrsprtCst.getRows() -1, grdRgnTrsprtCst.getCols() -1, true);
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_insertWrhsVhclList(){
		let wrhsVhclAllData = grdWrhsVhcl.getGridDataAll();
		var wrhsVhclList = [];
		for(var i=1; i<wrhsVhclAllData.length; i++){
			const rowData = grdWrhsVhcl.getRowData(i);
			if(rowData.delYn != 'N')
				continue;
			const rowSts = grdWrhsVhcl.getRowStatus(i);

    		if(gfn_isEmpty(rowData.vhclno)){
				gfn_comAlert("W0002", "차량번호");			//	W0002	{0}을/를 입력하세요.
				return;
    		} else {
	    		if(!(/^\d{2,3}[가-힣]\d{4}/.exec(rowData.vhclno))){
		    		gfn_comAlert("W0011", "차량번호");			//	W0001	{0}이/가 아닙니다.
	    			return;
	    		}
	    	}

			if (rowSts === 3){
				rowData.rowSts = "I";
				wrhsVhclList.push(rowData);
			} else if (rowSts === 2){
				rowData.rowSts = "U";
				wrhsVhclList.push(rowData);
			} else {
				continue;
			}
		}

		let rgnTrsprtCstAllData = grdRgnTrsprtCst.getGridDataAll();
		var rgnTrsprtCstList = [];
		for(var i=1; i<rgnTrsprtCstAllData.length; i++){
			const rowData = grdRgnTrsprtCst.getRowData(i);
			if(rowData.delYn != 'N')
				continue;
			const rowSts = grdRgnTrsprtCst.getRowStatus(i);

			if (rowSts === 3){
				rowData.rowSts = "I";
				rgnTrsprtCstList.push(rowData);
			} else if (rowSts === 2){
				rowData.rowSts = "U";
				rgnTrsprtCstList.push(rowData);
			} else {
				continue;
			}
		}

		if(wrhsVhclList.length == 0 && rgnTrsprtCstList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
			return;
		}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
    	const postJsonPromise = gfn_postJSON("/am/cmns/multiVhclList.do", wrhsVhclList);	// 프로그램id 추가
    	const postJsonPromise2 = gfn_postJSON("/am/cmns/multiRgnTrsprtCstList.do", rgnTrsprtCstList);	// 프로그램id 추가

		const data = await postJsonPromise;
		const data2 = await postJsonPromise2;
        try {
        	if (_.isEqual("S", data.resultStatus) && _.isEqual("S", data2.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
    			fn_callSelectWrhsVhclList();
    			fn_callSelectRgnTrsprtCstList();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
	}
	async function fn_deleteWrhsVhclList(wrhsVhclVo){
		let postJsonPromise1 = gfn_postJSON("/am/cmns/deleteWrhsVhclList.do", wrhsVhclVo);
	}
	async function fn_deleteRgnTrsprtCstList(rgnTrsprtCst){
		let postJsonPromise1 = gfn_postJSON("/am/cmns/deleteRgnTrsprtCstList.do", rgnTrsprtCst);
	}
</script>
</html>