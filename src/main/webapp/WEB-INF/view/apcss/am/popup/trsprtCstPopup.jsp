<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 원물운임비용등록</title>
	<style type="text/css">
		/* .sbgrid_inputbutton_button_st  {
			 width:  19 px;
			 height:  18 px;
			 background: url(../img/grid/button.png) no-repeat;
			 background-position: center;
			 border: none;
			 cursor: Pointer;
		} */
	</style>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header">
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSearchTrsprtCst" name="btnSearchTrsprtCst" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popTrsrptCst.search"></sbux-button>
						<sbux-button id="btnSaveTrsprtCst" name="btnSaveTrsprtCst" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popTrsrptCst.save"></sbux-button>
						<sbux-button id="btnChoiceTrsprtCst" name="btnChoiceTrsprtCst" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popTrsrptCst.choice"></sbux-button>
						<sbux-button id="btnEndTrsprtCst" name="btnEndTrsprtCst" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popTrsrptCst.close"></sbux-button>
					</div>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 90px">
						<col style="width: 180px">
						<col style="width: 100px">
						<col style="width: 200px">
						<col style="width: 100px">
						<col style="width: 200px">
						<col style="width: 45px">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th class="td_input">
								<sbux-input id="trsprtCst-inp-apcNm" name="trsprtCst-inp-apcNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
								<sbux-input id="trsprtCst-inp-apcCd" name="trsprtCst-inp-apcCd" uitype="hidden" class="form-control input-sm" readonly></sbux-input>
							</th>
							<th scope="row">운송일자</th>
							<th class="td_input">
								<sbux-datepicker id="trsprtCst-dtp-trsprtYmd" name="trsprtCst-dtp-trsprtYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm"></sbux-datepicker>
							</th>
							<th scope="row">차량번호</th>
							<th class="td_input">
								<sbux-input
									id="trsprtCst-inp-vhclno"
									name="trsprtCst-inp-vhclno"
									uitype="text" maxlength="8"
									class="form-control input-sm"
    							></sbux-input>
							</th>
							<th class="td_input">
								<sbux-button
									id="btnSrchTrsprtCstVhclNo"
									name="btnSrchTrsprtCstVhclNo"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-vhcl"
									onclick="fn_choiceTrsprtCstVhcl"
								></sbux-button>
							</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top2">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">원물운임비용 목록</span>
								<span style="font-size:12px">(조회건수 <span id="trsprtCst-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdTrsrptCst" style="width:100%;height:300px;"></div>
					<!-- 엑셀 시트별 데이터 영역 -->
					<div class="exp-div-excel" style="display: none;width: 1000px;">
						<div id="sbexp-area-grdExpTrsprtCst" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpTrsprtSeCd" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpTrsprtRgnCd" style="height:1px; width: 100%;"></div>
<!-- 						<div id="sbexp-area-grdExpBxKnd" style="height:1px; width: 100%;"></div> -->
						<div id="sbexp-area-grdExpBankCd" style="height:1px; width: 100%;"></div>
<!-- 						<input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="importExcelData(event)"> -->
					</div>
					<!-- //엑셀 시트별 데이터 영역 -->
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var jsonTrsprtCstPop = [];

	var jsonComTrsprtSeCd 		= [];	// 운송구분 	trsprtSeCd		Grid
	var jsonComTrsprtRgnCd		= [];	// 운송지역	trsprtRgnCd		Grid
	var jsonComBankCd 			= [];	// 은행코드
	var jsonRgnTrsprtCst		= [];	// 지역별 운임비용

	var grdTrsptCstPop = null;
	isExist = false

	// exp grid json
	var jsonExpTrsprtCst = [];
	var jsonExpTrsprtSeCd = [];
	var jsonExpTrsprtRgnCd = [];
	var jsonExpBankCd = [];

	var jsonExpSltTrsprtCst = [];
	var jsonExpSltTrsprtSeCd = [];
	var jsonExpSltTrsprtRgnCd = [];
	var jsonExpSltBankCd = [];

	var grdExpTrsprtCst;
	var grdExpTrsprtSeCd;
	var grdExpTrsprtRgnCd;
	var grdExpBankCd;

    /**
	 * @description 원물운임비용등록 팝업
	 */
	const popTrsrptCst = {
		prgrmId: 'trsptCstPopup',
		modalId: 'modal-trsprtCst',
		gridId: 'grdTrsprtCstPop',
		jsonId: 'jsonTrsprtCstPop',
		areaId: "sb-area-grdTrsrptCst",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		receivedData: null,
		callbackFnc: function() {},
		init: async function(_apcCd, _apcNm, _data, _callbackFnc) {
			// set param
			receivedData = _data;
			SBUxMethod.set("trsprtCst-dtp-trsprtYmd", _data.trsprtYmd);
			SBUxMethod.set("trsprtCst-inp-apcCd", _apcCd);
			SBUxMethod.set("trsprtCst-inp-apcNm", _apcNm);
			if(!gfn_isEmpty(_data.vhclno)){
				SBUxMethod.set("trsprtCst-inp-vhclno", _data.vhclno);
			}
			await this.callSelectRgnTsprtCstList();

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			if (grdTrsptCstPop === null || this.prvApcCd != _apcCd) {
				let rst = await Promise.all([
					gfn_setComCdGridSelect('grdTrsprtCstPop', 		jsonComTrsprtSeCd, 	'TRSPRT_SE_CD'),	// 운송구분
					gfn_setTrsprtRgnSBSelect('grdTrsprtCstPop', 	jsonComTrsprtRgnCd, _apcCd)	,			// 운송지역
					gfn_setComCdGridSelect('grdTrsprtCstPop', 		jsonComBankCd, 	'BANK_CD')				// 은행코드
				]);
				this.createGrid();
				this.search();
			} else {
				this.search();
			}
			this.prvApcCd = _apcCd;
		},
		close: function(_trsprtCst) {
			gfn_closeModal(this.modalId, this.callbackFnc, _trsprtCst);
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;
		    SBGridProperties.id = this.gridId;
		    SBGridProperties.jsonref = this.jsonId;
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'byrow';
			SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.allowcopy = true;
			SBGridProperties.scrollbubbling = false;
		    SBGridProperties.dblclickeventarea = {fixed: false, empty: false};
		    SBGridProperties.columns = [
		        {caption: ["처리"],	 	ref: 'delYn',  		width:'70px',	type: 'button',			style: 'text-align: center', sortable: false,
		        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
			        	if(strValue== null || strValue == ""){
			        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popTrsrptCst.add(" + nRow + ", " + nCol + ")'>추가</button>";
			        	}else{
					        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popTrsrptCst.del(" + nRow + ")'>삭제</button>";
			        	}
			    	}},
		        {caption: ['운송일자'], 	ref: 'trsprtYmd', 	width:'120px',	type: 'datepicker', 	style: 'text-align: center', sortable: false,
			    	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
		        {caption: ['운송구분'], 	ref: 'trsprtSeCd',	width: '100px',	type: 'combo',			style: 'text-align: center', sortable: false,
					typeinfo : {ref:'jsonComTrsprtSeCd', label:'label', value:'value', itemcount: 10}},
		        {caption: ['차량번호'], 	ref: 'vhclno',		width: '100px',	type: 'inputbutton',	style: 'text-align: center', sortable: false,
					typeinfo : {callback: fn_grdChoiceVhcl}, validate : gfn_chkByte.bind({byteLimit: 40})},
		        {caption: ['기사명'], 	ref: 'drvrNm',		width: '100px',	type: 'output', 		style: 'text-align: center', sortable: false},
		        {caption: ['운송지역'], 	ref: 'trsprtRgnCd', width: '100px', type: 'combo', 			style: 'text-align: center', sortable: false,
					typeinfo : {ref:'jsonComTrsprtRgnCd', label:'label', value:'value', itemcount: 10}},
		        {caption: ['중량'], 		ref: 'wrhsWght', 	width: '100px',	type: 'output', 		style: 'text-align: right',	 sortable: false,
					typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###Kg'}},
		        {caption: ['운임비용'],	ref: 'trsprtCst', 	width: '100px',	type: 'input', 			style: 'text-align: right',  sortable: false,
					typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###원'}, validate : gfn_chkByte.bind({byteLimit: 5})},
		        {caption: ['은행'],		ref: 'bankNm', 		width: '100px',	type: 'output', 		style: 'text-align: center', sortable: false},
		        {caption: ['계좌'],		ref: 'actno', 		width: '100px',	type: 'output', 		style: 'text-align: center', sortable: false},
		        {caption: ['예금주'],	 	ref: 'dpstr', 		width: '80px',	type: 'output', 		style: 'text-align: center', sortable: false},
		        {caption: ['비고'],		ref: 'rmrk', 		width: '240px',	type: 'input',										 sortable: false,
		        	validate : gfn_chkByte.bind({byteLimit: 1000})},
		        {caption: ['APC코드'], 	ref: 'apcCd', 		hidden : true},
		        {caption: ['은행'],		ref: 'bankCd', 		hidden : true},
		        {caption: ['순번'], 		ref: 'sn', 			hidden : true}

		    ];
		    grdTrsprtCstPop = _SBGrid.create(SBGridProperties);
		    grdTrsprtCstPop.bind('dblclick', popTrsrptCst.choice);
		    grdTrsprtCstPop.bind('valuechanged', this.setTrsprtCst);
		},
		choice: function() {
			let nRow = grdTrsprtCstPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else if (gfn_isEmpty(grdTrsprtCstPop.getCellData(nRow, grdTrsprtCstPop.getColRef("delYn")))) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdTrsprtCstPop.getRowData(nRow);
				popTrsrptCst.close(rowData);
			}
		},
		add: function(nRow, nCol) {
			grdTrsprtCstPop.setCellData(nRow, nCol, "N", true);
			grdTrsprtCstPop.addRow(true, receivedData);
		},
		del: async function(nRow) {
			const apcCd = SBUxMethod.get("trsprtCst-inp-apcCd");
			const rowSts = grdTrsprtCstPop.getRowStatus(nRow);
			if (rowSts == 0 || rowSts == 2){
				if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
					return;
				}
				const rowData = grdTrsprtCstPop.getRowData(nRow);
				const grdTrsprtCstVO = {
					apcCd		: apcCd,
					trsprtYmd	: rowData.trsprtYmd,
					vhclno		: rowData.vhclno,
					sn			: rowData.sn
				}
				const postJsonPromise = gfn_postJSON("/am/cmns/deleteRawMtrTrsprtCst.do", grdTrsprtCstVO, this.prgrmId);

				const data = await postJsonPromise;
		        try {
		        	if (_.isEqual("S", data.resultStatus)) {
		        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
		        		this.search();
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
        		grdTrsprtCstPop.deleteRow(nRow);
        	}
		},
		save: async function() {
			const apcCd = SBUxMethod.get("trsprtCst-inp-apcCd");
			let allData = grdTrsprtCstPop.getGridDataAll();

			const trsprtCstList = [];

			for ( let i=1; i<=allData.length; i++ ){
				const rowData = grdTrsprtCstPop.getRowData(i);
				const rowSts = grdTrsprtCstPop.getRowStatus(i);
				if (!gfn_isEmpty(rowData.delYn)){

					if (gfn_isEmpty(rowData.trsprtYmd)){
						gfn_comAlert("W0002", "운송일자");		//	W0002	{0}을/를 입력하세요.
			            return;
					}

					if (gfn_isEmpty(rowData.vhclno)){
						gfn_comAlert("W0002", "차량번호");		//	W0002	{0}을/를 입력하세요.
			            return;
					} else {
			    		if(!(/^\d{2,3}[가-힣]\d{4}/.exec(rowData.vhclno))){
				    		gfn_comAlert("W0011", "차량번호");			//	W0001	{0}이/가 아닙니다.
			    			return;
			    		}
			    	}

					if (rowSts === 3){
						await this.isExistData(rowData);
						if(isExist){
							alert("이미 존재하는 데이터입니다.");
							this.search();
							return;
						}
						rowData.apcCd = apcCd;
						rowData.rowSts = "I";
						trsprtCstList.push(rowData);
					} else if (rowSts === 2){
						await this.isExistData(rowData);
						if(isExist){
							alert("이미 존재하는 데이터입니다.");
							this.search();
							return;
						}
						rowData.rowSts = "U";
						trsprtCstList.push(rowData);
					} else {
						continue;
					}
				}
			}

			if (trsprtCstList.length == 0){
				gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
	            return;
			}

			if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}

	    	const postJsonPromise = gfn_postJSON("/am/cmns/multiTrsprtCstList.do", trsprtCstList, this.prgrmId);

			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		this.search();
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
		search: async function() {
			grdTrsprtCstPop.rebuild();

	    	// grid clear
	    	grdTrsprtCstPop.length = 0;
	    	await this.setGrid();
		},
		setGrid: async function() {
	    	let apcCd 		= SBUxMethod.get("trsprtCst-inp-apcCd");
	    	let trsprtYmd 	= SBUxMethod.get("trsprtCst-dtp-trsprtYmd");
	    	let vhclno 		= SBUxMethod.get("trsprtCst-inp-vhclno");
	        const postJsonPromise = gfn_postJSON("/am/cmns/selectRawMtrTrsprtCstList.do", {
	        	apcCd		: apcCd,
	        	trsprtYmd	: trsprtYmd,
	        	vhclno		: vhclno
			});

	        const data = await postJsonPromise;
			try {
	    		jsonTrsprtCstPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const trsprtCstVO = {
							trsprtYmd 	: item.trsprtYmd
						  , trsprtSeCd 	: item.trsprtSeCd
						  , vhclno 		: item.vhclno
						  , drvrNm 		: item.drvrNm
						  , trsprtRgnCd : item.trsprtRgnCd
						  , wrhsWght	: item.wrhsWght
						  , trsprtCst 	: item.trsprtCst
						  , bankCd 		: item.bankCd
						  , bankNm 		: item.bankNm
						  , actno 		: item.actno
						  , dpstr 		: item.dpstr
						  , rmrk 		: item.rmrk
						  , delYn		: item.delYn
						  , apcCd		: item.apcCd
						  , sn			: item.sn
					}
					jsonTrsprtCstPop.push(trsprtCstVO);
				});
        		grdTrsprtCstPop.rebuild();
	        	grdTrsprtCstPop.addRow(true, receivedData);
	        	document.querySelector('#trsprtCst-pop-cnt').innerText = jsonTrsprtCstPop.length-1;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    },
	    callSelectRgnTsprtCstList: async function() {
			const apcCd = SBUxMethod.get("trsprtCst-inp-apcCd");
	    	let postJsonPromise = gfn_postJSON("/am/cmns/selectRgnTrsprtCstList.do", {apcCd : apcCd});
            let data = await postJsonPromise;
			try {
	        	data.resultList.forEach((item, index) => {
	        		if(item.delYn == 'N'){
						const trsprtCstVO = {
							    trsprtRgnCd : item.trsprtRgnCd
							  , trsprtCst 	: item.trsprtCst
						}
						jsonRgnTrsprtCst.push(trsprtCstVO);
	        		}
				});
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    },
	    setTrsprtCst: async function(objGrid, nRow, nCol, strValue, objRowData) {
	    	var nRow = grdTrsprtCstPop.getRow();
	    	var nCol = grdTrsprtCstPop.getCol();
    		let trsprtRgnCd = grdTrsprtCstPop.getCellData(nRow, nCol);

	    	if(nCol == 5 && !gfn_isEmpty(trsprtRgnCd)){
	    		for(var i=0; i<jsonRgnTrsprtCst.length; i++){
	    			if(jsonRgnTrsprtCst[i].trsprtRgnCd == trsprtRgnCd){
	    				grdTrsprtCstPop.setCellData(nRow, nCol+2, jsonRgnTrsprtCst[i].trsprtCst);
	    				break;
	    			}
	    		}
	    	}
	    },
	    isExistData: async function(rowData){
	    	let checkExistenceList = [];
	    	matchData = {
	    			trsprtYmd 	: rowData.trsprtYmd
				  , trsprtSeCd 	: rowData.trsprtSeCd
				  , vhclno 		: rowData.vhclno
				  , trsprtRgnCd : rowData.trsprtRgnCd
				  , wrhsWght	: rowData.wrhsWght
				  , trsprtCst 	: rowData.trsprtCst
				  , bankCd 		: rowData.bankCd
				  , actno 		: rowData.actno
				  , dpstr 		: rowData.dpstr
				  , delYn		: rowData.delYn
				  , apcCd		: rowData.apcCd
			}
	    	const postJsonPromise = gfn_postJSON("/am/cmns/selectRawMtrTrsprtCstList.do", rowData);

	        const data = await postJsonPromise;
			try {
	        	data.resultList.forEach((item, index) => {
					const trsprtCstVO = {
							trsprtYmd 	: item.trsprtYmd
						  , trsprtSeCd 	: item.trsprtSeCd
						  , vhclno 		: item.vhclno
						  , trsprtRgnCd : item.trsprtRgnCd
						  , wrhsWght	: item.wrhsWght
						  , trsprtCst 	: item.trsprtCst
						  , bankCd 		: item.bankCd
						  , actno 		: item.actno
						  , dpstr 		: item.dpstr
						  , delYn		: item.delYn
						  , apcCd		: item.apcCd
					}
					if ((trsprtCstVO.trsprtYmd == matchData.trsprtYmd) &&
						(trsprtCstVO.trsprtSeCd == matchData.trsprtSeCd) &&
						(trsprtCstVO.vhclno == matchData.vhclno) &&
						(trsprtCstVO.trsprtRgnCd == matchData.trsprtRgnCd) &&
						(trsprtCstVO.wrhsWght == matchData.wrhsWght) &&
						(trsprtCstVO.trsprtCst == matchData.trsprtCst) &&
						(trsprtCstVO.bankCd == matchData.bankCd) &&
						(trsprtCstVO.actno == matchData.actno) &&
						(trsprtCstVO.dpstr == matchData.dpstr) &&
						(trsprtCstVO.delYn == matchData.delYn) &&
						(trsprtCstVO.apcCd == matchData.apcCd)){
						isExist = true;
					} else {
						isExist = false;
					}
				});
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    },
	    // 엑셀 내려받기, 올리기
		getExpColumns: function() {
			const _columns = []
			_columns.push(
					{caption: ['운송일자'], 	ref: 'trsprtYmd', 	width:'120px',	type: 'output',	style: 'text-align: center',
				    	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			        {caption: ['운송구분'], 	ref: 'trsprtSeCd',	width: '100px',	type: 'combo',	style: 'text-align: center',
						typeinfo : {ref:'jsonExpSltTrsprtSeCd', label:'label', value:'value', itemcount: 10}},
			        {caption: ['차량번호'], 	ref: 'vhclno',		width: '100px',	type: 'output',	style: 'text-align: center',
						typeinfo : {callback: fn_grdChoiceVhcl}},
			        {caption: ['기사명'], 	ref: 'drvrNm',		width: '100px',	type: 'output',	style: 'text-align: center'},
			        {caption: ['운송지역'], 	ref: 'trsprtRgnCd', width: '100px', type: 'combo',	style: 'text-align: center',
						typeinfo : {ref:'jsonExpSltTrsprtRgnCd', label:'label', value:'value', itemcount: 10}},
			        {caption: ['중량'], 		ref: 'wrhsWght', 	width: '100px',	type: 'output',	style: 'text-align: right',
						typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###Kg'}},
			        {caption: ['운임비용'],	ref: 'trsprtCst', 	width: '100px',	type: 'output',	style: 'text-align: right',
						typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###원'}},
			        {caption: ['은행'],		ref: 'bankCd', 		width: '100px',	type: 'combo',	style: 'text-align: center',
						typeinfo : {ref:'jsonExpSltBankCd', label:'label', value:'value', itemcount: 10}},
			        {caption: ['계좌'],		ref: 'actno', 		width: '100px',	type: 'output',	style: 'text-align: center'},
			        {caption: ['예금주'],	 	ref: 'dpstr', 		width: '80px',	type: 'output',	style: 'text-align: center'},
			        {caption: ['비고'],		ref: 'rmrk', 		width: '240px',	type: 'output'}
			);
		    return _columns;
		},
		setSltJson: async function() {
			// set exp/imp combo json
			// 운송구분
			jsonExpSltTrsprtSeCd = gfn_cloneJson(jsonComTrsprtSeCd);
			// 운송지역
			jsonExpSltTrsprtRgnCd = gfn_cloneJson(jsonComTrsprtRgnCd);
			// 은행
			jsonExpSltBankCd = gfn_cloneJson(jsonComBankCd);
		},
		setExpJson: async function() {
			// export grid data
			jsonExpTrsprtCst.length = 0;
			jsonExpTrsprtSeCd = gfn_cloneJson(jsonComTrsprtSeCd);
			jsonExpTrsprtRgnCd = gfn_cloneJson(jsonComTrsprtRgnCd);
			jsonExpBankCd = gfn_cloneJson(jsonComBankCd);
		},
		createExpGrid: async function(_expObjList) {
			_expObjList.forEach( (exp, idx) => {
				var SBGridProperties = {};
				SBGridProperties.parentid = exp.parentid;
				SBGridProperties.id = exp.id;
				SBGridProperties.jsonref = exp.jsonref;
				SBGridProperties.emptyrecords = '데이터가 없습니다.';;
				SBGridProperties.selectmode = 'byrow';
				SBGridProperties.extendlastcol = 'none';
				SBGridProperties.columns = exp.columns;

				exp.sbGrid = _SBGrid.create(SBGridProperties);
				if (exp.id == "grdExpTrsprtCst"){
					exp.sbGrid.addRow(true);
				}
			});
		},
		dwnld: async function(){
// 			const itemCd = SBUxMethod.get("srch-slt-itemCd");			// 품목

// 			if (gfn_isEmpty(itemCd)) {
// 				gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
// 	            return;
// 			}

			await this.setSltJson();
			await this.setExpJson();

			const expColumns = this.getExpColumns();

			const expObjList = [
			    {
			        sbGrid: grdExpTrsprtCst,
			        parentid: "sbexp-area-grdExpTrsprtCst",
			        id: "grdExpTrsprtCst",
			        jsonref: "jsonExpTrsprtCst",
					columns: expColumns,
			        sheetName: "원물운임비용목록",
			        title: "",
			        unit: ""
			    }, {
			        sbGrid: grdExpTrsprtSeCd,
			        parentid: "sbexp-area-grdExpTrsprtSeCd",
			        id: "grdExpTrsprtSeCd",
			        jsonref: "jsonExpTrsprtSeCd",
					columns: [
				    	{caption: ["운송구분코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["운송구분코드명"],  	ref: 'label',  	type:'output',  width:'100px',    style:'text-align:center'}
					],
			        sheetName: "운송구분",
			        title: "",
			        unit: ""
			    }, {
			        sbGrid: grdExpTrsprtRgnCd,
			        parentid: "sbexp-area-grdExpTrsprtRgnCd",
			        id: "grdExpTrsprtRgnCd",
			        jsonref: "jsonExpTrsprtRgnCd",
					columns: [
				    	{caption: ["운송지역코드"],   	ref: 'trsprtRgnCd',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["운송지역코드명"],  	ref: 'trsprtRgnNm',  	type:'output',  width:'100px',    style:'text-align:center'}
					],
			        sheetName: "운송지역",
			        title: "",
			        unit: ""
			    }, /*{
			        sbGrid: grdExpBxKnd,
			        parentid: "sbexp-area-grdExpBxKnd",
			        id: "grdExpBxKnd",
			        jsonref: "jsonExpBxKnd",
					columns: [
				    	{caption: ["운송지역코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["운송지역코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["운임비용"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'}
					],
			        sheetName: "운임비용",
			        title: "",
			        unit: ""
			    },*/ {
			        sbGrid: grdExpBankCd,
			        parentid: "sbexp-area-grdExpBankCd",
			        id: "grdExpBankCd",
			        jsonref: "jsonExpBankCd",
					columns: [
				    	{caption: ["은행코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["은행코드명"],   	ref: 'label',  	type:'output',  width:'100px',    style:'text-align:center'}
					],
			        sheetName: "은행",
			        title: "",
			        unit: ""
			    }
			];

			await this.createExpGrid(expObjList);

		    //gfn_exportExcelMulti("원물운임비용(샘플).xlsx", expObjList);
		    this.exportExcelMulti("원물운임비용(샘플).xlsx", expObjList);
		},
		exportExcelMulti: function(_fileName, _objList) {
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
		},
	     uld: async function() {
			const impColumns = this.getExpColumns();
			await this.setSltJson();

			var SBGridProperties = {};
			SBGridProperties.emptyrecords = '데이터가 없습니다.';
			SBGridProperties.selectmode = 'byrow';
			SBGridProperties.extendlastcol = 'scroll';
			SBGridProperties.oneclickedit = true;
			SBGridProperties.columns = impColumns;
			popImp.importExcel(
	    			"원물운임비용 Import",
	    			SBGridProperties,
	    			this.importTrsprtCst
				);
	     },
	     importTrsprtCst: async function() {
	    	 alert('import data save');
	     }
   	}

	/* 원물운임비용 등록에서 사용 차량선택 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_setVhcl
	 * @description 차량선택팝업 호출
	 */
	const fn_choiceTrsprtCstVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setTrsprtCstVhcl);
	}

	/**
	 * @name fn_setVhcl
	 * @description 차량 선택 callback
	 */
	const fn_setTrsprtCstVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("trsprtCst-inp-vhclno", vhcl.vhclno);   // callBack input
		}
	}
	/* End */

	const fn_grdChoiceVhcl = function() {
		SBUxMethod.openModal('modal-vhcl');
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setGrdVhcl);
	}

	const fn_setGrdVhcl = function(vhcl) {
		let nRow = grdTrsprtCstPop.getRow();

		if (!gfn_isEmpty(vhcl)) {
			grdTrsprtCstPop.setCellData(nRow, 3, vhcl.vhclno);
			grdTrsprtCstPop.setCellData(nRow, 4, vhcl.drvrNm);
			grdTrsprtCstPop.setCellData(nRow, 8, vhcl.bankNm);
			grdTrsprtCstPop.setCellData(nRow, 9, vhcl.actno);
			grdTrsprtCstPop.setCellData(nRow, 10, vhcl.dpstr);
			grdTrsprtCstPop.setCellData(nRow, 13, vhcl.bankCd);
		}
	}
</script>
</html>