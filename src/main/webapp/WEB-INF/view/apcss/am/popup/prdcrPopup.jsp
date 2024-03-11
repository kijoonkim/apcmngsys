<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 생산자 선택</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">원물 생산자 정보를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">편집 버튼을 통해 생산자정보를 등록/수정할 수 있습니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSavePrdcr" name="btnSavePrdcr" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popPrdcr.save" disabled></sbux-button>
					<sbux-button id="btnEditPrdcr" name="btnEditPrdcr" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popPrdcr.edit"></sbux-button>
					<sbux-button id="btnCancelPrdcr" name="btnCancelPrdcr" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popPrdcr.cancel"></sbux-button>
					<sbux-button id="btnChoicePrdcr" name="btnChoicePrdcr" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popPrdcr.choice"></sbux-button>
					<sbux-button id="btnSearchPrdcr" name="btnSearchPrdcr" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popPrdcr.search"></sbux-button>
					<sbux-button id="btnEndPrdcr" name="btnEndPrdcr" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popPrdcr.close"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="prdcr-inp-apcCd" name="prdcr-inp-apcCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: 11%">
						<col style="width: 22%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="prdcr-inp-apcNm" name="prdcr-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
							</th>
							<th scope="row">생산자명</th>
							<th class="td_input">
								<sbux-input
									uitype="text" id="prdcr-inp-prdcrNm" name="prdcr-inp-prdcrNm"
									class="form-control input-sm" maxlength="33"
    								onkeyenter="keyUpInp(prdcr-inp-prdcrNm, 'prdcr-inp-prdcrNm', 'true')">
    							</sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="row">
					<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span style="color: black;">생산자 목록</span>
							<span style="font-size:12px">(조회건수 <span id="prdcr-pop-cnt">0</span>건)</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnDwnldPrdcr" name="btnDwnldPrdcr" uitype="normal" text="서식받기" class="btn btn-sm btn-outline-danger" onclick="popPrdcr.dwnld" ></sbux-button>
						<sbux-button id="btnUldPrdcr" name="btnUldPrdcr" uitype="normal" text="올리기" class="btn btn-sm btn-outline-dark" onclick="popPrdcr.uld"></sbux-button>
					</div>
				</div>
					<div>
						<div id="sb-area-grdPrdcrPop" style="height:300px; width: 100%;"></div>
					</div>
				</div>
				<!--[pp] //검색결과 -->

			</div>
		</div>
		<div class="exp-div-excel" style="display: none;width: 1000px;">
			<div id="sbexp-area-grdExpPrdcr" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpGdsSeCd" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpWrhsSeCd" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpTrsprtSeCd" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpClclnCrtrCd" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpItem" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpVrty" style="height:1px; width: 100%;"></div>
			<input type="file" id="btnFileUploadPrdcr" name="btnFileUploadPrdcr" style="visibility: hidden;" onchange="popPrdcr.importExcelDataPrdcr(event)" />
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	var jsonApcItemPrdcrPop			= [];	// 대표품목 rprsItemCd	Grid
	var jsonApcVrtyPrdcrPop			= [];	// 대표품종 rprsVrtyCd	Grid
	var jsonComGdsSeCdPrdcrPop		= [];	// 상품구분 gdsSeCd		Grid
	var jsonComWrhsSeCdPrdcrPop		= [];	// 입고구분 wrhsSeCd	Grid
	var jsonComTrsprtSeCdPrdcrPop	= [];	// 운송구분 trsprtSeCd	Grid
	var jsonComClclnCrtrCdPrdcrPop	= [];	// 정산기준 clclnCrtr	Grid

	var grdPrdcrPop = null;
	var jsonPrdcrPop = [];
	var excelYn = "N";
	var editMode = false;

	const excelDwnldPrdcrPop = function () {
		grdPrdcrPop.exportLocalExcel("생산자 목록", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/**
	 * @description 권한 사용자 선택 팝업
	 */
	const popPrdcr = {
		prgrmId: 'prdcrPopup',
		modalId: 'modal-prdcr',
		gridId: 'grdPrdcrPop',
		jsonId: 'jsonPrdcrPop',
		areaId: "sb-area-grdPrdcrPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		objMenuListPrdcrPop : {
			"excelDwnldPop": {
				"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",					//단축키
				"callback": excelDwnldPrdcrPop,		//콜백함수명
			}
		},
		callbackFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackFnc, _prdcrNm) {

			excelYn = "N";

			// set param
			SBUxMethod.set("prdcr-inp-apcCd", _apcCd);
			SBUxMethod.set("prdcr-inp-apcNm", _apcNm);
			SBUxMethod.set("prdcr-inp-prdcrNm", _prdcrNm);

			SBUxMethod.show('btnEditPrdcr');
			SBUxMethod.hide('btnCancelPrdcr');
			SBUxMethod.attr('btnSavePrdcr', 'disabled', true);
			SBUxMethod.attr('btnSearchPrdcr', 'disabled', false);
			SBUxMethod.attr('btnChoicePrdcr', 'disabled', false);
			SBUxMethod.attr('btnDwnldPrdcr', 'disabled', true);
			SBUxMethod.attr('btnUldPrdcr', 'disabled', true);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			if (grdPrdcrPop === null || this.prvApcCd != _apcCd) {
				let rst = await Promise.all([
					gfn_setApcItemSBSelect('grdPrdcr', jsonApcItemPrdcrPop, _apcCd),				// 품목
					gfn_setApcVrtySBSelect('grdPrdcr', jsonApcVrtyPrdcrPop, _apcCd),				// 품종
					gfn_setComCdSBSelect('grdPrdcr', jsonComGdsSeCdPrdcrPop, 'GDS_SE_CD',_apcCd),			// 상품구분
					gfn_setComCdSBSelect('grdPrdcr', jsonComWrhsSeCdPrdcrPop, 'WRHS_SE_CD'),		// 입고구분
					gfn_setComCdSBSelect('grdPrdcr', jsonComTrsprtSeCdPrdcrPop, 'TRSPRT_SE_CD'),	// 운송구분
					gfn_setComCdSBSelect('grdPrdcr', jsonComClclnCrtrCdPrdcrPop, 'CLCLN_CRTR_CD')		// 정산기준
				]);
				this.createGrid();
				this.search();
			} else {
				grdPrdcrPop.bind('dblclick', popPrdcr.choice);
				this.search();
			}

			this.prvApcCd = _apcCd;
		},
		close: function(_prdcr) {
			if(editMode){
				this.cancel();
			}
			gfn_closeModal(this.modalId, this.callbackFnc, _prdcr);
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdComAuthUserPop';					//'grdComAuthUserPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonComAuthUserPop';		//'jsonComAuthUserPop';
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'free';
		    SBGridProperties.explorerbar = 'move';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.allowcopy = true;
		    SBGridProperties.scrollbubbling = false;
		    SBGridProperties.frozencols = 2;
		    SBGridProperties.contextmenu = true;					// 우클린 메뉴 호출 여부
		    SBGridProperties.contextmenulist = this.objMenuListPrdcrPop;	// 우클릭 메뉴 리스트
		    SBGridProperties.dblclickeventarea = {fixed: false, empty: false};
		    SBGridProperties.columns = [
		    	{caption: ["처리"], 			ref: 'delYn', 			type: 'button', width: '50px', 	style: 'text-align:center', sortable: false,
		        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
						if (!isEditable) {
							return "";
						}

		            	if (gfn_isEmpty(strValue)){
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popPrdcr.add(" + nRow + ", " + nCol + ")'>추가</button>";
		            	} else {
					        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popPrdcr.del(" + nRow + ")'>삭제</button>";
		            	}
			    }},
			    {caption: ['번호'], 			ref: 'prdcrIdentno', 	type: 'input', 	width: '50px', style: 'text-align:center', sortable: false},
		        {caption: ['생산자명'], 		ref: 'prdcrNm', 		type: 'input', 	width: '65px', style: 'text-align:center', sortable: false,
		        	validate : gfn_chkByte.bind({byteLimit: 100})},
	        	{caption: ['생산자코드'], 			ref: 'prdcrCd', 	type: 'input', 	width: '70px', style: 'text-align:center', sortable: false},
		        {caption: ['대표품목'], 		ref: 'rprsItemCd', 		type: 'combo', 	width: '70px', style: 'text-align:center', sortable: false,
					typeinfo: {ref:'jsonApcItemPrdcrPop', 		label:'label', value:'value', itemcount: 10}},
		        {caption: ['대표품종'], 		ref: 'rprsVrtyCd', 		type: 'combo', 	width: '70px', style: 'text-align:center', sortable: false,
					typeinfo: {ref:'jsonApcVrtyPrdcrPop', 		label:'label', value:'value', itemcount: 10, filtering: {usemode : true, uppercol : 'rprsItemCd', attrname : 'itemCd'}}},
		        {caption: ['상품구분'], 		ref: 'gdsSeCd', 		type: 'combo', 	width: '60px', 	style: 'text-align:center', sortable: false,
					typeinfo: {ref:'jsonComGdsSeCdPrdcrPop', 	label:'label', value:'value', itemcount: 10}},
		        {caption: ['입고구분'], 		ref: 'wrhsSeCd', 		type: 'combo', 	width: '65px', 	style: 'text-align:center', sortable: false,
					typeinfo: {ref:'jsonComWrhsSeCdPrdcrPop', 	label:'label', value:'value', itemcount: 10}},
		        {caption: ['운송구분'], 		ref: 'trsprtSeCd', 		type: 'combo', 	width: '60px', 	style: 'text-align:center', sortable: false,
					typeinfo: {ref:'jsonComTrsprtSeCdPrdcrPop', label:'label', value:'value', itemcount: 10}},
		        {caption: ['정산기준'], 		ref: 'clclnCrtrCd', 	type: 'combo', 	width: '60px', 	style: 'text-align:center', sortable: false,
					typeinfo: {ref:'jsonComClclnCrtrCdPrdcrPop', label:'label', value:'value', itemcount: 10}},
		        {caption: ['차량번호'], 		ref: 'vhclno', 			type: 'input', 	width: '90px', style: 'text-align:center', sortable: false,
					validate : gfn_chkByte.bind({byteLimit: 40})},
		        {caption: ['전화번호'], 		ref: 'telno', 			type: 'input', 	width: '90px', style: 'text-align:center', sortable: false,
					validate : gfn_chkByte.bind({byteLimit: 11}), typeinfo : {mask : {alias : '#-', repeat: '*'}}},
		        {caption: ['생산자연계코드'], 	ref: 'prdcrLinkCd', 	type: 'input', 	width: '90px', style: 'text-align:center', sortable: false,
					validate : gfn_chkByte.bind({byteLimit: 20})},
 		        {caption: ['외부연결코드'], 	ref: 'extrnlLnkgCd', 	type: 'input', 	width: '100px', style: 'text-align:center', sortable: false},
		        {caption: ['비고'], 			ref: 'rmrk', 			type: 'input', 	width: '100px', style: 'text-align:center', sortable: false,
		        	validate : gfn_chkByte.bind({byteLimit: 1000})},
		        {caption: ['APC코드'], ref: 'apcCd', hidden : true},
		        {caption: ['ROW STATUS'], ref: 'rowSts', hidden : true},
		    ];
		    grdPrdcrPop = _SBGrid.create(SBGridProperties);
		    grdPrdcrPop.bind("afterimportexcel", popPrdcr.setDataAfterImport);
		    grdPrdcrPop.bind('dblclick', popPrdcr.choice);
		},
		choice: function() {
			let nRow = grdPrdcrPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdPrdcrPop.getRowData(nRow);
				SBUxMethod.set("srch-inp-prdcrCd", rowData.prdcrCd);
				SBUxMethod.set("srch-inp-prdcrNm", rowData.prdcrNm);
				SBUxMethod.set("srch-inp-prdcrIdentno", rowData.prdcrIdentno);
				SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
				gfn_closeModal(popPrdcr.modalId, popPrdcr.callbackFnc, rowData);
			}
		},
		edit: async function() {
			editMode = true;
			SBUxMethod.hide('btnEditPrdcr');
			SBUxMethod.show('btnCancelPrdcr');
			SBUxMethod.attr('btnSavePrdcr', 'disabled', false);
			SBUxMethod.attr('btnSearchPrdcr', 'disabled', true);
			SBUxMethod.attr('btnChoicePrdcr', 'disabled', true);
			SBUxMethod.attr('btnDwnldPrdcr', 'disabled', false);
			SBUxMethod.attr('btnUldPrdcr', 'disabled', false);

			this.createGrid(true);
			grdPrdcrPop.rebuild();
			grdPrdcrPop.setCellDisabled(0, 0, grdPrdcrPop.getRows() - 1, grdPrdcrPop.getCols() - 1, false);

			let nRow = grdPrdcrPop.getRows();
			grdPrdcrPop.addRow(true);
			grdPrdcrPop.setCellDisabled(nRow, 0, nRow, grdPrdcrPop.getCols() - 1, true);
			grdPrdcrPop.unbind('dblclick');
		},
		cancel: function() {
			editMode = false;
			SBUxMethod.show('btnEditPrdcr');
			SBUxMethod.hide('btnCancelPrdcr');
			SBUxMethod.attr('btnSavePrdcr', 'disabled', true);
			SBUxMethod.attr('btnSearchPrdcr', 'disabled', false);
			SBUxMethod.attr('btnChoicePrdcr', 'disabled', false);
			SBUxMethod.attr('btnDwnldPrdcr', 'disabled', true);
			SBUxMethod.attr('btnUldPrdcr', 'disabled', true);

			this.createGrid();
			this.search();
		},
		add: function(nRow, nCol) {
			grdPrdcrPop.setCellData(nRow, nCol, "N", true);
			grdPrdcrPop.setCellDisabled(nRow, 0, nRow, grdPrdcrPop.getCols() - 1, false);
			nRow++;
			grdPrdcrPop.addRow(true);
			grdPrdcrPop.setCellDisabled(nRow, 0, nRow, grdPrdcrPop.getCols() - 1, true);
		},
		del: async function(nRow) {
			const apcCd = SBUxMethod.get("prdcr-inp-apcCd");
			const rowSts = grdPrdcrPop.getRowStatus(nRow);

			if(excelYn == "Y"){
				grdPrdcrPop.deleteRow(nRow);
			}else{
				if (rowSts == 0 || rowSts == 2){
					if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
						return;
					}
					const rowData = grdPrdcrPop.getRowData(nRow);
					const prdcrVO = {
						apcCd: apcCd,
						prdcrCd: rowData.prdcrCd
					}
					const postJsonPromise = gfn_postJSON("/am/cmns/deletePrdcr.do", {
						apcCd: apcCd,
						prdcrCd: rowData.prdcrCd
					}, this.prgrmId);

					const data = await postJsonPromise;
			        try {
			        	if (_.isEqual("S", data.resultStatus)) {
			        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
			        		this.search(true);
			        		excelYn = "N";
			        	} else {
			        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			        	}
			        } catch(e) {
			    		if (!(e instanceof Error)) {
			    			e = new Error(e);
			    		}
			    		console.error("failed", e.message);
			        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			        }
	        	} else {
	        		grdPrdcrPop.deleteRow(nRow);
	        	}
			}

		},
		save: async function() {
			const apcCd = SBUxMethod.get("prdcr-inp-apcCd");
			let allData = grdPrdcrPop.getGridDataAll();

			const prdcrList = [];

			for ( let i=1; i<=allData.length; i++ ){
				const rowData = grdPrdcrPop.getRowData(i);
				const rowSts = grdPrdcrPop.getRowStatus(i);

				if (rowData.delYn !== "N") {
					continue;
				}

				if (gfn_isEmpty(rowData.prdcrNm)){
					gfn_comAlert("W0002", "생산자명");		//	W0002	{0}을/를 입력하세요.
		            return;
				}
				if(!gfn_isEmpty(rowData.vhclno)){
		    		if(!(/^\d{2,3}[가-힣]\d{4}/.exec(rowData.vhclno))){
			    		gfn_comAlert("W0011", "차량번호");			//	W0001	{0}이/가 아닙니다.
		    			return;
		    		}
		    	}

				if(excelYn == "Y"){
					if (rowSts === 0 || rowSts === 2){
						rowData.apcCd = apcCd;
						rowData.rowSts = "I";
						prdcrList.push(rowData);
					}  else {
						continue;
					}
				}else{
					if (rowSts === 3){
						rowData.apcCd = apcCd;
						rowData.rowSts = "I";
						prdcrList.push(rowData);
					} else if (rowSts === 2){
						rowData.rowSts = "U";
						prdcrList.push(rowData);
					} else {
						continue;
					}
				}
			}

			if (prdcrList.length == 0){
				gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
	            return;
			}

			if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}

	    	const postJsonPromise = gfn_postJSON("/am/cmns/multiPrdcrList.do", prdcrList, this.prgrmId);

			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		excelYn = "N";
	        		this.search(true);
	        	} else {
	        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        	}
	        } catch(e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }

		},
		search: async function(/** {boolean} */ isEditable) {
			grdPrdcrPop.rebuild();

	    	// grid clear
	    	jsonPrdcrPop.length = 0;
	    	grdPrdcrPop.refresh();
	    	this.setGrid(isEditable);
		},
		setGrid: async function(isEditable) {

	    	let apcCd = SBUxMethod.get("prdcr-inp-apcCd");
			let prdcrNm = SBUxMethod.get("prdcr-inp-prdcrNm");

	        const postJsonPromise = gfn_postJSON("/am/cmns/selectPrdcrList.do", {
	        	apcCd: apcCd,
	        	prdcrNm: prdcrNm
			});

	        const data = await postJsonPromise;

			try {
	    		jsonPrdcrPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const prdcr = {
						rowSeq			: item.rowSeq,
						prdcrCd			: item.prdcrCd,
					    prdcrNm 		: item.prdcrNm,
					    rprsItemCd 		: item.rprsItemCd,
					    rprsItemNm 		: item.rprsItemNm,
					    rprsVrtyCd 		: item.rprsVrtyCd,
					    rprsVrtyNm 		: item.rprsVrtyNm,
					    gdsSeCd 		: item.gdsSeCd,
					    wrhsSeCd 		: item.wrhsSeCd,
					    trsprtSeCd 		: item.trsprtSeCd,
					    clclnCrtrCd 	: item.clclnCrtrCd,
					    vhclno 			: item.vhclno,
					    telno			: item.telno,
					    prdcrLinkCd		: item.prdcrLinkCd,
					    prdcrIdentno	: item.prdcrIdentno,
					    rmrk 			: item.rmrk,
					    delYn 			: item.delYn,
					    apcCd 			: item.apcCd,
					    extrnlLnkgCd	: item.extrnlLnkgCd
					}
					jsonPrdcrPop.push(prdcr);
				});
        		grdPrdcrPop.rebuild();

	        	if (isEditable) {
	        		grdPrdcrPop.setCellDisabled(0, 0, grdPrdcrPop.getRows() - 1, grdPrdcrPop.getCols() - 1, false);
	        		let nRow = grdPrdcrPop.getRows();
					grdPrdcrPop.addRow(true);
					grdPrdcrPop.setCellDisabled(nRow, 0, nRow, grdPrdcrPop.getCols() - 1, true);
	        	} else {
	        		grdPrdcrPop.setCellDisabled(0, 0, grdPrdcrPop.getRows() - 1, grdPrdcrPop.getCols() - 1, true);
	        	}

	        	document.querySelector('#prdcr-pop-cnt').innerText = jsonPrdcrPop.length;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    },
	    dwnld : async function() {

			await popPrdcr.setSltJson();
			await popPrdcr.setExpJson();

			const expColumns = popPrdcr.getExpColumns();

			const expObjList = [
			    {
			        sbGrid: grdExpPrdcr,
			        parentid: "sbexp-area-grdExpPrdcr",
			        id: "grdExpPrdcr",
			        jsonref: "jsonExpPrdcr",
					columns: expColumns,
			        sheetName: "생산자",
			        title: "",
			        unit: ""
			    },{
			        sbGrid: grdExpGdsSeCd,
			        parentid: "sbexp-area-grdExpGdsSeCd",
			        id: "grdExpGdsSeCd",
			        jsonref: "jsonExpGdsSeCd",
					columns: [
				    	{caption: ["상품구분코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["상품구분코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'},
					],
			        sheetName: "상품구분",
			        title: "",
			        unit: ""
			    },{
			        sbGrid: grdExpWrhsSeCd,
			        parentid: "sbexp-area-grdExpWrhsSeCd",
			        id: "grdExpWrhsSeCd",
			        jsonref: "jsonExpWrhsSeCd",
					columns: [
				    	{caption: ["입고구분코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["입고구분코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'},
					],
			        sheetName: "입고구분",
			        title: "",
			        unit: ""
			    }, {
			        sbGrid: grdExpTrsprtSeCd,
			        parentid: "sbexp-area-grdExpTrsprtSeCd",
			        id: "grdExpTrsprtSeCd",
			        jsonref: "jsonExpTrsprtSeCd",
					columns: [
				    	{caption: ["운송구분코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["운송구분코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'},
					],
			        sheetName: "운송구분",
			        title: "",
			        unit: ""
			    }, {
			        sbGrid: grdExpClclnCrtrCd,
			        parentid: "sbexp-area-grdExpClclnCrtrCd",
			        id: "grdExpClclnCrtrCd",
			        jsonref: "jsonExpClclnCrtrCd",
					columns: [
				    	{caption: ["정산구분코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["정산구분코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'},
					],
			        sheetName: "정산구분",
			        title: "",
			        unit: ""
			    }, {
			        sbGrid: grdExpItem,
			        parentid: "sbexp-area-grdExpItem",
			        id: "grdExpItem",
			        jsonref: "jsonExpItem",
					columns: [
				    	{caption: ["품목코드"],     ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
				        {caption: ["품목명칭"],     ref: 'itemNm',  type:'output',  width:'100px',    style:'text-align:center'}
					],
			        sheetName: "품목",
			        title: "",
			        unit: ""
			    }, {
			        sbGrid: grdExpVrty,
			        parentid: "sbexp-area-grdExpVrty",
			        id: "grdExpVrty",
			        jsonref: "jsonExpVrty",
					columns: [
						{caption: ["품목코드"],		ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
						{caption: ["품목명"],		ref: 'itemNm',  type:'output',  width:'100px',    style:'text-align:center'},
						{caption: ["품종코드"],    ref: 'vrtyCd',  type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["품종명칭"],    ref: 'vrtyNm',  type:'output',  width:'100px',    style:'text-align:center'}
					],
			        sheetName: "품종",
			        title: "",
			        unit: ""
			    },
			];

			popPrdcr.createExpGrid(expObjList);

		    popPrdcr.exportExcelMulti("생산자등록(샘플).xlsx", expObjList);
	    },uld : async function(){

	    	document.querySelector("#btnFileUploadPrdcr").value = "";
			$("#btnFileUploadPrdcr").click();

	    },getExpColumns : function (){
	    	const _columns = []
			_columns.push(
					{caption: ["처리"], 			ref: 'delYn', 			type: 'input', 	width: '1px', 	style: 'text-align:center'},
					{caption: ['번호'], 			ref: 'prdcrIdentno', 	type: 'input', 	width: '60px', style: 'text-align:center', sortable: false},
			        {caption: ['생산자명'], 		ref: 'prdcrNm', 		type: 'input', 	width: '100px', style: 'text-align:center', sortable: false,
			        	validate : gfn_chkByte.bind({byteLimit: 100})},
			        {caption: ['대표품목'], 		ref: 'rprsItemCd', 		type: 'combo', 	width: '100px', style: 'text-align:center', sortable: false,
						typeinfo: {ref:'jsonApcItemPrdcrPop', 		label:'label', value:'value', itemcount: 10}},
			        {caption: ['대표품종'], 		ref: 'rprsVrtyCd', 		type: 'combo', 	width: '100px', style: 'text-align:center', sortable: false,
						typeinfo: {ref:'jsonApcVrtyPrdcrPop', 		label:'label', value:'value', itemcount: 10}},
			        {caption: ['상품구분'], 		ref: 'gdsSeCd', 		type: 'combo', 	width: '100px', 	style: 'text-align:center', sortable: false,
						typeinfo: {ref:'jsonComGdsSeCdPrdcrPop', 	label:'label', value:'value', itemcount: 10}},
			        {caption: ['입고구분'], 		ref: 'wrhsSeCd', 		type: 'combo', 	width: '100px', 	style: 'text-align:center', sortable: false,
						typeinfo: {ref:'jsonComWrhsSeCdPrdcrPop', 	label:'label', value:'value', itemcount: 10}},
			        {caption: ['운송구분'], 		ref: 'trsprtSeCd', 		type: 'combo', 	width: '100px', 	style: 'text-align:center', sortable: false,
						typeinfo: {ref:'jsonComTrsprtSeCdPrdcrPop', label:'label', value:'value', itemcount: 10}},
			        {caption: ['정산기준'], 		ref: 'clclnCrtrCd', 	type: 'combo', 	width: '100px', 	style: 'text-align:center', sortable: false,
						typeinfo: {ref:'jsonComClclnCrtrCdPrdcrPop', label:'label', value:'value', itemcount: 10}},
			        {caption: ['차량번호'], 		ref: 'vhclno', 			type: 'input', 	width: '120px', style: 'text-align:center', sortable: false,
						validate : gfn_chkByte.bind({byteLimit: 40})},
			        {caption: ['전화번호'], 		ref: 'telno', 			type: 'input', 	width: '120px', style: 'text-align:center', sortable: false,
						validate : gfn_chkByte.bind({byteLimit: 11}), typeinfo : {mask : {alias : '#-', repeat: '*'}}},
			        {caption: ['생산자연계코드'], 	ref: 'prdcrLinkCd', 	type: 'input', 	width: '120px', style: 'text-align:center', sortable: false,
						validate : gfn_chkByte.bind({byteLimit: 20})},
			        {caption: ['비고'], 			ref: 'rmrk', 			type: 'input', 	width: '100px', style: 'text-align:center', sortable: false,
			        	validate : gfn_chkByte.bind({byteLimit: 1000})},
			)

		    return _columns;
	    }, setSltJson : async function (){
	    	// 첫 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
			// set exp/imp combo json
			jsonExpSltGdsSeCd 		= gfn_cloneJson(jsonComGdsSeCdPrdcrPop);		// 상품구분
			jsonExpSltWrhsSeCd 		= gfn_cloneJson(jsonComWrhsSeCdPrdcrPop);		// 입고구분
			jsonExpSltTrsprtSeCd 	= gfn_cloneJson(jsonComTrsprtSeCdPrdcrPop);		// 운송구분
			jsonExpSltClclnCrtrCd 	= gfn_cloneJson(jsonComClclnCrtrCdPrdcrPop);	// 정산구분
			jsonExpSltItem 			= gfn_cloneJson(jsonApcItemPrdcrPop);			// 품목
			jsonExpSltVrty 			= gfn_cloneJson(jsonApcVrtyPrdcrPop);			// 품종
	    }, setExpJson : async function () {
	    	// 첫 시트가 아닌 다른 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
			// export grid data
			jsonExpPrdcr.length = 0;

			jsonExpGdsSeCd 			= gfn_cloneJson(jsonComGdsSeCdPrdcrPop);		// 엑셀 상품구분Json
			jsonExpWrhsSeCd 		= gfn_cloneJson(jsonComWrhsSeCdPrdcrPop);		// 엑셀 입고구분Json
			jsonExpTrsprtSeCd 		= gfn_cloneJson(jsonComTrsprtSeCdPrdcrPop);		// 엑셀 운송구분Json
			jsonExpClclnCrtrCd 		= gfn_cloneJson(jsonComClclnCrtrCdPrdcrPop);	// 엑셀 정산구분Json
			jsonExpItem 			= gfn_cloneJson(jsonApcItemPrdcrPop);			// 엑셀 품목Json
			jsonExpVrty 			= gfn_cloneJson(jsonApcVrtyPrdcrPop);			// 엑셀 품종Json

	    }, createExpGrid : async function(_expObjList) {
	    	_expObjList.forEach((exp, idx) => {
				var SBGridProperties = {};
				SBGridProperties.parentid = exp.parentid;
				SBGridProperties.id = exp.id;
				SBGridProperties.jsonref = exp.jsonref;
				SBGridProperties.emptyrecords = '데이터가 없습니다.';;
				SBGridProperties.selectmode = 'byrow';
				SBGridProperties.extendlastcol = 'none';
				SBGridProperties.columns = exp.columns;
				exp.sbGrid = _SBGrid.create(SBGridProperties);
				exp.sbGrid.addRow(true);
			});
	    }, exportExcelMulti : async function(_fileName, _objList) {
	    	// 엑셀 정보를 담는 변수
			var objExcelInfo = {
				strFileName : _fileName,
				strAction : "/am/excel/saveMultiExcel",
				bIsStyle: true,
				bIsMerge: true,
				bUseFormat: false,
				bIncludeData: true,
				bUseCompress: false
			};

			var dataList = [];
			var sheetNameList = [];
			var titleList = [];
			var unitList = [];
			var arrAdditionalData = [];

			//넘어온 오브젝트를 이용한 forEach문으로 타이틀리스트에 title을 넣고 unitList에 unit을 넣는 포이치문
			_objList.forEach((item, index) => {
				sheetNameList.push(item.sheetName);
				titleList.push(item.title);
				unitList.push(item.unit);

				if (index > 0) {
					var data = item.sbGrid.exportExcel(objExcelInfo, "return");
					dataList.push(data);
				}
			});

			arrAdditionalData.push(
	           {"name": "arrSheetData", "value": JSON.stringify(dataList)},
	           {"name": "arrSheetName", "value": JSON.stringify(sheetNameList)},
	           {"name": "arrTitle", "value": JSON.stringify(titleList)},
	           {"name": "arrUnit", "value": JSON.stringify(unitList)}
			);

			objExcelInfo.arrAdditionalData = arrAdditionalData;
			_objList[0].sbGrid.exportExcel(objExcelInfo);
	    }, importExcelDataPrdcr : async function (e) {
			jsonPrdcrPop.legnth = 0;
			grdPrdcrPop.rebuild();
			grdPrdcrPop.importExcelData(e);
	    }, setDataAfterImport : async function (){

	    	let allData = grdPrdcrPop.getGridDataAll();
			for(var i=1; i<=allData.length; i++){

				let rowData = grdPrdcrPop.getRowData(i, false) // deep copy;

				let rprsItemCd 		= $.trim(rowData.rprsItemCd);
				let rprsVrtyCd 		= $.trim(rowData.rprsVrtyCd);
				let gdsSeCd	 		= $.trim(rowData.gdsSeCd);
				let wrhsSeCd	 	= $.trim(rowData.wrhsSeCd);
				let trsprtSeCd	 	= $.trim(rowData.trsprtSeCd);
				let clclnCrtrCd	 	= $.trim(rowData.clclnCrtrCd);

				// 상품구분 명 or 코드 일치 검사
				for(var j=0; j<jsonComGdsSeCdPrdcrPop.length; j++){
					if(jsonComGdsSeCdPrdcrPop[j].text == gdsSeCd || jsonComGdsSeCdPrdcrPop[j].value == gdsSeCd){
						rowData.gdsSeCd = jsonComGdsSeCdPrdcrPop[j].value;
						break;
					}
				}

				// 입고구분 명 or 코드 일치 검사
				for(var j=0; j<jsonComWrhsSeCdPrdcrPop.length; j++){
					if(jsonComWrhsSeCdPrdcrPop[j].text == wrhsSeCd || jsonComWrhsSeCdPrdcrPop[j].value == wrhsSeCd){
						rowData.wrhsSeCd = jsonComWrhsSeCdPrdcrPop[j].value;
						break;
					}
				}

				// 운송구분 명 or 코드 일치 검사
				for(var j=0; j<jsonComTrsprtSeCdPrdcrPop.length; j++){
					if(jsonComTrsprtSeCdPrdcrPop[j].text == trsprtSeCd || jsonComTrsprtSeCdPrdcrPop[j].value == trsprtSeCd){
						rowData.trsprtSeCd = jsonComTrsprtSeCdPrdcrPop[j].value;
						break;
					}
				}

				// 정산구분 명 or 코드 일치 검사
				for(var j=0; j<jsonComClclnCrtrCdPrdcrPop.length; j++){
					if(jsonComClclnCrtrCdPrdcrPop[j].text == clclnCrtrCd || jsonComClclnCrtrCdPrdcrPop[j].value == clclnCrtrCd){
						rowData.clclnCrtrCd = jsonComClclnCrtrCdPrdcrPop[j].value;
						break;
					}
				}

				// 품목 명 or 코드 일치 검사
				for(var j=0; j<jsonApcItemPrdcrPop.length; j++){
					if(jsonApcItemPrdcrPop[j].itemCd == rprsItemCd || jsonApcItemPrdcrPop[j].itemNm == rprsItemCd){
						rowData.rprsItemCd = jsonApcItemPrdcrPop[j].itemCd;
						break;
					}
				}
				// 품종 명 or 코드 일치 검사
				for(var j=0; j<jsonApcVrtyPrdcrPop.length; j++){
					if(jsonApcVrtyPrdcrPop[j].itemCd == rowData.rprsItemCd && (jsonApcVrtyPrdcrPop[j].vrtyNm == rprsVrtyCd || jsonApcVrtyPrdcrPop[j].vrtyCd == rprsVrtyCd ) ){
						rowData.rprsVrtyCd = jsonApcVrtyPrdcrPop[j].vrtyCd;
						break;
					}
				}
				rowData.delYn = "N";
			}
			excelYn = "Y";

			grdPrdcrPop.rebuild();
	    }


	}

	// 엑셀다운로드
	// exp combo
	var jsonExpSltItem 			= [];	// 품목
	var jsonExpSltVrty 			= [];	// 품종
	var jsonExpSltSpcfct 		= [];	// 규격
	var jsonExpSltGdsSeCd 		= [];	// 상품구분
	var jsonExpSltWrhsSeCd 		= [];	// 입고구분
	var jsonExpSltTrsprtSeCd 	= [];	// 운송구분
	var jsonExpSltClclnCrtrCd 	= [];	// 정산구분

	var grdExpPrdcr;					// 엑셀 생산자그리드
	var grdExpItem;						// 엑셀 품목그리드
	var grdExpVrty;						// 엑셀 품종그리드
	var grdExpGdsSeCd;					// 엑셀 상품구분그리드
	var grdExpWrhsSeCd;					// 엑셀 입고구분그리드
	var grdExpTrsprtSeCd;				// 엑셀 운송구분그리드
	var grdExpClclnCrtrCd;				// 엑셀 정산구분그리드

	var jsonExpPrdcr 			= [];	// 엑셀 생산자Json
	var jsonExpItem 			= [];	// 엑셀 품목Json
	var jsonExpVrty 			= [];	// 엑셀 품종Json
	var jsonExpGdsSeCd 			= [];	// 엑셀 상품구분Json
	var jsonExpWrhsSeCd 		= [];	// 엑셀 입고구분Json
	var jsonExpTrsprtSeCd 		= [];	// 엑셀 운송구분Json
	var jsonExpClclnCrtrCd 		= [];	// 엑셀 정산구분Json

</script>
</html>