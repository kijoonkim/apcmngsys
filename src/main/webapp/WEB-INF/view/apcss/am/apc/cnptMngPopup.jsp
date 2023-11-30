<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 거래처/발주수신 등록</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">상품 출하 시 관리하고 있는 거래처 정보를 등록하세요.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">대형마트 발주서 접수관리는 발주정보를 자동으로 수집하기 위한 입력정보 입니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCnptSech" name="btnCnptSech" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectCnptList()"></sbux-button>
					<sbux-button id="btnCnptReg" name="btnCnptReg" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveCnptList"></sbux-button>
					<sbux-button id="btnCnptEnd" name="btnCnptEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-cnpt')"></sbux-button>
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
								<sbux-input id=cnpt-inp-apcNm name="cnpt-inp-apcNm" uitype="text" class="form-control pull-right input-sm" disabled></sbux-input>
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
							<li><span>거래처 정보</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<div id="cnptMngGridArea" style="height:150px; width: 100%;"></div>
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li><span>대형마트 발주서 접수관리</span></li>
							</ul>
						</div>
						<div id="lgszMrktMngGridArea" style="height:220px; width: 100%;"></div>
					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var cnptMngGridData = [
    ]; // 그리드의 참조 데이터 주소 선언
    function fn_cnptMngCreateGrid() {
    	SBUxMethod.set("cnpt-inp-apcNm", SBUxMethod.get("inp-apcNm"));
    	cnptMngGridData = [];
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'cnptMngGridArea';
	    SBGridProperties.id = 'cnptMngDatagrid';
	    SBGridProperties.jsonref = 'cnptMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
	    SBGridProperties.contextmenulist = objMenuListCnptMng;		// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.scrollbubbling = false;
        SBGridProperties.columns = [
            {caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"cnptMngDatagrid\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"cnptMngDatagrid\", " + nRow + ")'>삭제</button>";
            	}
		    }},
            {caption: ["코드"], 		ref: 'cnptCd',  	type:'output', width:'80px',     style:'text-align:center',  hidden : true},
            {caption: ["거래처명"], 	ref: 'cnptNm',  	type:'input',  width:'125px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100}), typeinfo : {maxlength : 33}},
            {caption: ["유형"], 		ref: 'cnptType',   	type:'combo',  width:'125px',    style:'text-align:center',
				typeinfo : {ref:'comboGridCnptTypeJsData', label:'label', value:'value', displayui : false, itemcount: 10}},
            {caption: ["사업자번호"], 	ref: 'brno',  		type:'input',  width:'135px',    style:'text-align:center', typeinfo : {mask : {alias : '#-', repeat: '*'}, maxlength : 20}, validate : gfn_chkByte.bind({byteLimit: 20})},
            {caption: ["담당자"], 		ref: 'picNm',  		type:'input',  width:'90px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 20}), typeinfo : {mask : {alias : 'k'}, maxlength : 20}},
            {caption: ["전화번호"], 	ref: 'telno',  		type:'input',  width:'120px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 20}), typeinfo : {mask : {alias : '#-', repeat: '*'}, maxlength : 20}},
            {caption: ["이메일"], 		ref: 'eml',  		type:'input',  width:'140px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 320}), typeinfo : {maxlength : 320}},
            {caption: ["업태"], 		ref: 'bzstat',  	type:'input',  width:'140px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 300}), typeinfo : {maxlength : 300}},
            {caption: ["종목"], 		ref: 'cls',  		type:'input',  width:'140px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 300}), typeinfo : {maxlength : 300}},
            {caption: ["비고"], 		ref: 'rmrk',  		type:'input',  width:'120px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 1000}), typeinfo : {maxlength : 1000}},
        ];
        window.cnptMngDatagrid = _SBGrid.create(SBGridProperties);
        fn_selectCnptList();
    }
    
    /**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListCnptMng = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldCnptMng,			//콜백함수명
        }
    };
    // 엑셀 다운로드
    function fn_excelDwnldCnptMng() {
    	cnptMngDatagrid.exportLocalExcel("거래처 정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    async function fn_selectCnptList(){
		fn_callSelectCnptList();
		fn_callSelectLgszMrktList();
	}


    let newCnptGridData = [];
	async function fn_callSelectCnptList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectCnptList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
	    newCnptGridData = [];
	    cnptMngGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let cnpt = {
					cnptCd 		: item.cnptCd
				  , cnptNm 		: item.cnptNm
				  , cnptType 	: item.cnptType
				  , brno 		: item.brno
				  , picNm 		: item.picNm
				  , telno 		: item.telno
				  , rmrk 		: item.rmrk
				  , delYn 		: item.delYn
				  , apcCd 		: item.apcCd
				  , eml 		: item.eml
				  , bzstat		: item.bzstat
				  , cls			: item.cls
				}
				cnptMngGridData.push(Object.assign({}, cnpt));
				newCnptGridData.push(Object.assign({}, cnpt));
			});
        	cnptMngDatagrid.rebuild();
         	cnptMngDatagrid.addRow();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	async function fn_saveCnptList(){
		let gridData = cnptMngDatagrid.getGridDataAll();
		let insertList = [];
		let updateList = [];
		let insertCnt = 0;
		let updateCnt = 0;
		for(var i=1; i<=gridData.length; i++ ){
			if(cnptMngDatagrid.getRowData(i).delYn == 'N'){

				if(cnptMngDatagrid.getRowData(i).cnptNm == null || cnptMngDatagrid.getRowData(i).cnptNm == ""){
					alert("거래처명은 필수 값 입니다.");
					return;
				}

				if(cnptMngDatagrid.getRowData(i).cnptType == null || cnptMngDatagrid.getRowData(i).cnptType == ""){
					alert("유형을 선택해주세요");
					return;
				}

				if(cnptMngDatagrid.getRowStatus(i) === 3){
					insertList.push(cnptMngDatagrid.getRowData(i));
				}
				if(cnptMngDatagrid.getRowStatus(i) === 2){
					updateList.push(cnptMngDatagrid.getRowData(i));
				}
			}
		}

		let gridData2 = lgszMrktMngDatagrid.getGridDataAll();
		let updateList2 = [];
		let updateCnt2 = 0;
		for(var i=1; i<=gridData2.length; i++ ){
			if(lgszMrktMngDatagrid.getRowStatus(i) === 2){
				updateList2.push(lgszMrktMngDatagrid.getRowData(i));
			}
		}

		if(insertList.length == 0 && updateList.length == 0 && updateList2.length == 0){
			alert("저장 할 내용이 없습니다.");
			return;
		}
		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){
			totalCnt = 0;
			if(insertList.length > 0){
				const postJsonPromise = gfn_postJSON("/am/cmns/insertCnptList.do", insertList);
		    	const data = await postJsonPromise;
		    	totalCnt += data.insertedCnt;
			}
			if(updateList.length > 0){
				const postJsonPromise = gfn_postJSON("/am/cmns/updateCnptList.do", updateList);
		    	const data = await postJsonPromise;
		    	totalCnt += data.updatedCnt;
// 				updateCnt = await fn_callUpdateCnptList(updateList);
			}
			if(updateList2.length > 0){
				const postJsonPromise = gfn_postJSON("/am/cmns/updateLgszMrktList.do", updateList2);
		    	const data = await postJsonPromise;
		    	totalCnt += data.updatedCnt;
// 				updateCnt2 = await fn_callUpdateLgszMrktList(updateList2);
			}
			if(totalCnt > 0 ){
				fn_selectCnptList();
				alert("저장 되었습니다.");
			}
		}
	}

	async function fn_callInsertCnptList(insertList){
		let postJsonPromise = gfn_postJSON("/am/cmns/insertCnptList.do", insertList);
        let data = await postJsonPromise;

        try{
       		return data.result;

        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}
	}

	async function fn_callUpdateCnptList(updateList){
		let postJsonPromise = gfn_postJSON("/am/cmns/updateCnptList.do", updateList);
        let data = await postJsonPromise;
        try{
       		return data.result;

        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}
	}

	async function fn_callUpdateLgszMrktList(updateList){
		let postJsonPromise = gfn_postJSON("/am/cmns/updateLgszMrktList.do", updateList);
        let data = await postJsonPromise;
        try{
       		return data.result;

        }catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
		}
	}


	async function fn_deleteCnptList(cnpt){
		let postJsonPromise1 = gfn_postJSON("/am/cmns/deleteCnptList.do", cnpt);
	}

    var lgszMrktMngGridData =[];
    function fn_lgszMrktMngCreateGrid() {
        let SBGridProperties = {};
	    SBGridProperties.parentid = 'lgszMrktMngGridArea';
	    SBGridProperties.id = 'lgszMrktMngDatagrid';
	    SBGridProperties.jsonref = 'lgszMrktMngGridData';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
        SBGridProperties.columns = [
            {caption: ["대형마트 코드"], 		ref: 'lgszMrktCd',  	type:'output',  width:'100px',     style:'text-align:center'},
            {caption: ["대형마트 명"], 		ref: 'lgszMrktNm',  	type:'input',  width:'100px',     style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 100}), typeinfo : {maxlength : 33}},
            {caption: ["발주정보 URL"], 	ref: 'outordrInfoUrl',  	type:'input',  width:'300px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 2000}), typeinfo : {maxlength : 2000}},
            {caption: ["사용자ID"], 		ref: 'userId',  	type:'input',  width:'100px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 200}), typeinfo : {maxlength : 40}},
            {caption: ["패스워드"], 		ref: 'pswd',  	type:'input',  width:'120px',    style:'text-align:center', validate : gfn_chkByte.bind({byteLimit: 40}), typeinfo : {maxlength : 256}},
            {caption: ["사용유무"], 		ref: 'useYn',   	type:'combo',  	width:'100px',    style:'text-align:center',
						typeinfo : {ref:'comboReverseYnJsData', label:'label', value:'value', displayui : false, itemcount: 10}},
            {caption: ["최종처리일시"], 	ref: 'lastPrcsDt',  	type:'output',  width:'280px',    style:'text-align:center'}
        ];
        window.lgszMrktMngDatagrid = _SBGrid.create(SBGridProperties);
		fn_callSelectLgszMrktList();
    }

    let newLgszMrktMngGridData = [];
	async function fn_callSelectLgszMrktList(){
		let apcCd = SBUxMethod.get("inp-apcCd");
    	let postJsonPromise = gfn_postJSON("/am/cmns/selectLgszMrktList.do", {apcCd : apcCd});
        let data = await postJsonPromise;
        newLgszMrktMngGridData = [];
        lgszMrktMngGridData = [];
        try{
        	data.resultList.forEach((item, index) => {
				let LgszMrkt = {
					apcCd 					: item.apcCd
					, lgszMrktCd 			: item.lgszMrktCd
					, lgszMrktNm 			: item.lgszMrktNm
					, outordrInfoUrl 		: item.outordrInfoUrl
					, userId 				: item.userId
					, pswd 					: item.pswd
					, useYn 				: item.useYn
					, lastPrcsDt 			: item.lastPrcsDt
				}
				lgszMrktMngGridData.push(Object.assign({}, LgszMrkt));
				newLgszMrktMngGridData.push(Object.assign({}, LgszMrkt));
			});
        	lgszMrktMngDatagrid.rebuild();
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
</script>
</html>