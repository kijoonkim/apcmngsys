<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 출하운송회사 등록</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">상품 출하 시 운용하고 있는 운송사 정보를 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">출하처리 시 필요한 정보입니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSpmtTrsprtSech" name="btnSpmtTrsprtSech" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectSpmtTrsprtList()"></sbux-button>
					<sbux-button id="btnSpmtTrsprtReg" name="btnSpmtTrsprtReg" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_insertSpmtTrsprtList"></sbux-button>
					<sbux-button id="btnSpmtTrsprtEnd" name="btnSpmtTrsprtEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-spmtTrsprt')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 14%">
						<col style="width: 28%">
						<col style="width: 14%">
						<col style="width: 28%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id=spmtTrsprt-inp-apcNm name="spmtTrsprt-inp-apcNm" uitype="text" class="form-control pull-right input-sm" disabled></sbux-input>
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
							<li><span>운송회사 목록</span></li>
						</ul>
					</div>
					<div id="spmtTrsprtMngGridArea" style="height:300px; width: 100%;"></div>
				</div>
			</div>
		<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script type="text/javascript">
	//출하운송회사 등록
	var spmtTrsprtMngGridData = []; // 그리드의 참조 데이터 주소 선언
	function fn_spmtTrsprtMngCreateGrid() {
		SBUxMethod.set("spmtTrsprt-inp-apcNm", SBUxMethod.get("inp-apcNm"));

		spmtTrsprtMngGridData = [];
	    let SBGridProperties = {};
	    SBGridProperties.parentid = 'spmtTrsprtMngGridArea';
	    SBGridProperties.id = 'grdSpmtTrsprtCo';
	    SBGridProperties.jsonref = 'spmtTrsprtMngGridData';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuListSpmtTrsprtCo;		// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.columns = [
	        {caption: ["처리"], 			ref: 'delYn',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdSpmtTrsprtCo\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdSpmtTrsprtCo\", " + nRow + ")'>삭제</button>";
	        	}
		    }},
	        {caption: ["코드"], 			ref: 'trsprtCoCd',  type:'output',  width:'80px',     style:'text-align:center', hidden : true},
	        {caption: ["운송회사명"], 		ref: 'trsprtCoNm',  type:'input',  width:'145px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100}), typeinfo : {maxlength : 33}},
	        {caption: ["전화번호"], 		ref: 'telno',  		type:'input',  width:'145px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 11}), typeinfo : {mask : {alias : 'numeric'}, maxlength : 20}},
	        {caption: ["팩스번호"], 		ref: 'fxno',  		type:'input',  width:'145px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 20}), typeinfo : {mask : {alias : 'numeric'}, maxlength : 20}},
	        {caption: ["비고"], 			ref: 'rmrk',  		type:'input',  width:'320px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 1000}), typeinfo : {maxlength : 333}},
	        {caption: ["APC코드"], 			ref: 'apcCd',  		hidden:true}
	    ];
	    window.grdSpmtTrsprtCo = _SBGrid.create(SBGridProperties);
	    fn_callSelectSpmtTrsprtList();
	}
	
	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListSpmtTrsprtCo = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldSpmtTrsprtCo,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldSpmtTrsprtCo() {
    	grdSpmtTrsprtCo.exportLocalExcel("운송회사 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	async function fn_selectSpmtTrsprtList(){
		fn_callSelectSpmtTrsprtList();
	}
	async function fn_callSelectSpmtTrsprtList(){
		spmtTrsprtMngGridData = [];
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtTrsprtList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        newSpmtTrsprtGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let spmtTrsprt = {
					trsprtCoCd 	: item.trsprtCoCd
				  , trsprtCoNm 	: item.trsprtCoNm
				  , telno 		: item.telno
				  , fxno 		: item.fxno
				  , rmrk 		: item.rmrk
				  , delYn 		: item.delYn
				  , apcCd		: item.apcCd
				}
				spmtTrsprtMngGridData.push(Object.assign({}, spmtTrsprt));
			});
        	grdSpmtTrsprtCo.rebuild();
        	grdSpmtTrsprtCo.addRow(true);
        	grdSpmtTrsprtCo.setCellDisabled(grdSpmtTrsprtCo.getRows() -1, 0, grdSpmtTrsprtCo.getRows() -1, grdSpmtTrsprtCo.getCols() -1, true);
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_insertSpmtTrsprtList(){
		let spmtTrsprtCoAllData = grdSpmtTrsprtCo.getGridDataAll();
		var spmtTrsprtCoList = [];


		for(var i=1; i<=spmtTrsprtCoAllData.length; i++ ){
			const rowData = grdSpmtTrsprtCo.getRowData(i);
			if(rowData.delYn != 'N')
				continue;
			const rowSts = grdSpmtTrsprtCo.getRowStatus(i);

			if (rowSts === 3){
				rowData.rowSts = "I";
				spmtTrsprtCoList.push(rowData);
			} else if (rowSts === 2){
				rowData.rowSts = "U";
				spmtTrsprtCoList.push(rowData);
			} else {
				continue;
			}
		}

		if(spmtTrsprtCoList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
			return;
		}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
    	const postJsonPromise = gfn_postJSON("/am/cmns/multiSpmtTrsprtList.do", spmtTrsprtCoList);	// 프로그램id 추가

		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_selectSpmtTrsprtList();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
	}
	async function fn_deleteSpmtTrsprtList(grdSpmtTrsprtCo){
		let postJsonPromise1 = gfn_postJSON("/am/cmns/deleteSpmtTrsprtList.do", grdSpmtTrsprtCo);
	}
</script>
</html>