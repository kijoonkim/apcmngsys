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
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">원물입고 차량번호를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">편집 버튼을 통해 차량정보를 등록/수정 할수 있습니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchVhcl" name="btnSearchVhcl" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_sarchVhcl"></sbux-button>
					<sbux-button id="btnEditorVhcl" name="btnEditorVhcl" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="fn_editorVhcl"></sbux-button>
					<sbux-button id="btnCancelVhcl" name="btnCancelVhcl" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" style="display : none" onclick="fn_cancelVhcl"></sbux-button>
					<sbux-button id="btnSaveVhcl" name="btnSaveVhcl" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_insertVhcl" disabled></sbux-button>
					<sbux-button id="btnEndVhcl" name="btnEndVhcl" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-vhcl')"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 12%">
						<col style="width: 24%">
						<col style="width: 12%">
						<col style="width: 24%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="vhcl-inp-apcNm" name="vhcl-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">차량번호</th>
							<th class="td_input">
								<sbux-input id="vhcl-inp-vhclno" name="vhcl-inp-vhclno" uitype="text" class="form-control input-sm" ></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdVhcl" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonComBankCd 		= [];	// 은행 bankCd		Grid

	const fn_initSBSelectVhcl = async function() {

		// 그리드 SB select
	 	await gfn_setComCdGridSelect('grdVhcl', jsonComBankCd, 'BANK_CD');	// 은행

	}


	var jsonVhcl = [];
	function fn_createVhclGrid() {

		SBUxMethod.set("vhcl-inp-apcNm", gv_apcNm);
		fn_initSBSelectVhcl();

		jsonVhcl = [];
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdVhcl';
	    SBGridProperties.id = 'grdVhcl';
	    SBGridProperties.jsonref = 'jsonVhcl';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ['차량번호'], 	ref: 'vhclno', 	width: '100px', type: 'input', style:'text-align:center'},
	        {caption: ['기사명'], 		ref: 'drvrNm', 	width: '100px', type: 'input', style:'text-align:center'},
	        {caption: ['예금주명'], 	ref: 'dpstr', 	width: '100px', type: 'input', style:'text-align:center'},
	        {caption: ['은행'], 		ref: 'bankCd', 	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonComBankCd', 	label:'label', value:'value', displayui : false}},
	        {caption: ['계좌번호'], 	ref: 'actno', 	width: '120px', type: 'input', style:'text-align:center'},
	        {caption: ['비고'], 		ref: 'rmrk', 	width: '200px', type: 'input'},
	        {caption: ['최종처리일시'], ref: 'sysLastChgDt', 	width: '140px', type: 'output',  style:'text-align:center'},
	        {caption: ["처리"], 		ref: 'delYn',   type:'button', width:'80px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            	if(strValue== null || strValue == ""){
            		return "<button type='button' class='btn btn-xs btn-outline-danger btnDisabled' onClick='fn_procRowVhcl(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
            	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger btnDisabled' onClick='fn_procRowVhcl(\"DEL\", " + nRow + ")'>삭제</button>";
            	}
		    }},
	        {caption: ['APC코드'], 		ref: 'apcCd', 		hidden : true},

	    ];
	    grdVhcl = _SBGrid.create(SBGridProperties);
	    fn_sarchVhcl();

	}

	async function fn_sarchVhcl(){
		callSelectVhclList();
	}

	async function callSelectVhclList(){
		let apcCd 	= gv_apcCd;
		let vhclno	= SBUxMethod.get("vhcl-inp-vhclno");
		let postJsonPromise = gfn_postJSON("/am/cmns/selectWrhsVhclList.do", {apcCd : apcCd, vhclno : vhclno});
        let data = await postJsonPromise;
        let newJsonVhcl = [];
        try{
        	data.resultList.forEach((item, index) => {
				let vhclVO = {
					vhclno		: item.vhclno
				  , drvrNm 		: item.drvrNm
				  , dpstr 		: item.dpstr
				  , bankCd 		: item.bankCd
				  , actno 		: item.actno
				  , sysLastChgDt : item.sysLastChgDt
				  , delYn 		: item.delYn
				  , rmrk 		: item.rmrk
				  , apcCd 		: item.apcCd
				}
				newJsonVhcl.push(vhclVO);
			});
        	jsonVhcl = newJsonVhcl;
        	grdVhcl.rebuild();
        	grdVhcl.setCellDisabled(0, 0, grdVhcl.getRows() - 1, grdVhcl.getCols() - 1, true);
    	    SBUxMethod.attr('btnSaveVhcl', 'disabled', true);
    	    $('.btnDisabled').css('display', 'none');
    	    $('#btnEditorVhcl').css('display', '');
    	    $('#btnCancelVhcl').css('display', 'none');
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}


	function fn_procRowVhcl(gubun, nRow, nCol){
		if (gubun === "ADD") {
			grdVhcl.setCellData(nRow, nCol, "N", true);
			grdVhcl.setCellData(nRow, 8, gv_apcCd, true);
			grdVhcl.addRow(true);
		}
		else if(gubun === "DEL"){
			if(grdVhcl.getRowStatus(nRow) == 0 || grdVhcl.getRowStatus(nRow) == 2){
        		var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
        		if(confirm(delMsg)){
        			var vhclVO = grdVhcl.getRowData(nRow);
        			fn_deleteVhcl(vhclVO);
        			grdVhcl.deleteRow(nRow);
        		}
        	}else{
        		grdVhcl.deleteRow(nRow);
        	}
		}
	}

	function fn_editorVhcl(){
		grdVhcl.setCellDisabled(0, 0, grdVhcl.getRows() - 1, grdVhcl.getCols() - 1, false);
		grdVhcl.setCellDisabled(0, 0, grdVhcl.getRows() - 1, 0, true);
	    $('.btnDisabled').css('display', '');
	    $('#btnEditorVhcl').css('display', 'none');
	    $('#btnCancelVhcl').css('display', '');
	    SBUxMethod.attr('btnSaveVhcl', 'disabled', false);
	    grdVhcl.addRow(true);
	}

	function fn_cancelVhcl(){
		fn_sarchVhcl();
	}

	function fn_modalVhcl(){
		fn_createVhclGrid();
	}

	async function fn_insertVhcl(){
		let gridData = grdVhcl.getGridDataAll();
		let insertList = [];
		let updateList = [];
		let insertCnt = 0;
		let updateCnt = 0;
		for(var i=1; i<=gridData.length; i++ ){
			if(grdVhcl.getRowData(i).delYn == 'N'){

				if(grdVhcl.getRowData(i).vhclno == null || grdVhcl.getRowData(i).vhclno == ""){
					alert("차량번호는 필수 값 입니다.");
					return;
				}
				if(grdVhcl.getRowData(i).drvrNm == null || grdVhcl.getRowData(i).drvrNm == ""){
					alert("기사명은 필수 값 입니다.");
					return;
				}

				if(grdVhcl.getRowStatus(i) === 3){
					insertList.push(grdVhcl.getRowData(i));
				}
				if(grdVhcl.getRowStatus(i) === 2){
					updateList.push(grdVhcl.getRowData(i));
				}
			}
		}
		console.log("insertList >> ",insertList)
		if(insertList.length == 0 && updateList.length == 0){
			alert("저장 할 내용이 없습니다.");
			return;
		}
		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			if(insertList.length > 0){
				insertCnt = await fn_callInsertVhclList(insertList);
			}
			if(updateList.length > 0){
				updateCnt = await fn_callUpdateVhclList(updateList);
			}
			if(insertCnt + updateCnt > 0 ){
				fn_sarchVhcl();
				alert("저장 되었습니다.");
			}
		}
	}

	async function fn_callInsertVhclList(wrhsVhclList){
		let postJsonPromise = gfn_postJSON("/am/cmns/insertWrhsVhclList.do", wrhsVhclList);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		return data.insertedCnt;
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
	}

	async function fn_callUpdateVhclList(wrhsVhclList){
		let postJsonPromise = gfn_postJSON("/am/cmns/updateWrhsVhclList.do", wrhsVhclList);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		return data.updatedCnt;
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
	}

	async function fn_deleteVhcl(wrhsVhclVO){
		let postJsonPromise = gfn_postJSON("/am/cmns/updateWrhsVhclList.do", wrhsVhclVO);
        let data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.deletedCnt > 0){
        			fn_sarchVhcl();
        		}
        	} else {
        		alert(data.resultMessage);
        	}
        } catch(e) {
        }
	}
</script>
</html>