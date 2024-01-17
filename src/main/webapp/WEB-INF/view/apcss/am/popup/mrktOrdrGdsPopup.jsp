<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>대형마트 발주상품코드 관리</title>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div style="margin-left: auto;">
					<sbux-button 
						id="ordrGdsPop-btn-search" 
						name="ordrGdsPop-btn-search" 
						uitype="normal" 
						text="조회" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popOrdrGds.search"
					></sbux-button>
					<sbux-button 
						id="ordrGdsPop-btn-save" 
						name="ordrGdsPop-btn-save" 
						uitype="normal" 
						text="저장" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popOrdrGds.save"
					></sbux-button>
					<sbux-button
						id="ordrGdsPop-btn-edit" 
						name="ordrGdsPop-btn-edit" 
						uitype="normal" 
						text="편집" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popOrdrGds.edit"
					></sbux-button>
					<sbux-button
						id="ordrGdsPop-btn-cancel" 
						name="ordrGdsPop-btn-cancel" 
						uitype="normal" 
						text="취소" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popOrdrGds.cancel"
					></sbux-button>
					<sbux-button
						id="ordrGdsPop-btn-choice" 
						name="ordrGdsPop-btn-choice" 
						uitype="normal" 
						text="선택" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popOrdrGds.choice"
					></sbux-button>
					<sbux-button 
						id="ordrGdsPop-btn-close" 
						name="ordrGdsPop-btn-close" 
						uitype="normal" 
						text="종료" 
						class="btn btn-sm btn-outline-danger" 
						onclick="popOrdrGds.close"
					></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 90px">
						<col style="width: 170px">
						<col style="width: 90px">
						<col style="width: 170px">
						<col style="width: 90px">
						<col style="width: 170px">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th class="td_input">
								<sbux-input 
									id="ordrGdsPop-inp-apcCd" 
									name="ordrGdsPop-inp-apcCd" 
									uitype="hidden"
								></sbux-input>
								<sbux-input 
									id="ordrGdsPop-inp-apcNm" 
									name="ordrGdsPop-inp-apcNm" 
									uitype="text" 
									class="form-control input-sm"
									readonly
								></sbux-input>
							</th>
							<th scope="row">상품명</th>
							<th class="td_input">
								<sbux-input 
									id="ordrGdsPop-inp-gdsNm" 
									name="ordrGdsPop-inp-gdsNm" 
									uitype="text" 
									class="form-control input-sm" 
								></sbux-input>
							</th>
							<th scope="row"></th>
							<th class="td_input" style="border-right-style: hidden;">
							</th>
						</tr>
						<tr>
							<th scope="row">대형마트구분</th>
							<th class="td_input">
								<sbux-select
									id="ordrGdsPop-slt-lgszMrktCd"
									name="ordrGdsPop-slt-lgszMrktCd"
									style="background-color:#ffffff;"
									uitype="single"
									jsondata-ref="jsonOrdrGdsPopLgszMrkt"
									unselected-text="선택"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
								></sbux-select>
							</th>
							<th scope="row">발주상품코드</th>
							<th class="td_input" style="border-right-style: hidden;">
								<sbux-input 
									id="ordrGdsPop-inp-orgnGdsCd" 
									name="ordrGdsPop-inp-orgnGdsCd" 
									uitype="text" 
									class="form-control input-sm" 
								></sbux-input>
							</th>
							<th scope="row">발주상품명</th>
							<th class="td_input" class="td_input">
								<sbux-input 
									id="ordrGdsPop-inp-orgnGdsNm" 
									name="ordrGdsPop-inp-orgnGdsNm" 
									uitype="text" 
									class="form-control input-sm" 
								></sbux-input>
							</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">대형마트 발주상품 목록</span>
								<span style="font-size:12px">(조회건수 <span id="cnt-ordrGdsPop">0</span>건)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-ordrGdsPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	
	var grdOrdrGdsPop = null;
	var jsonOrdrGdsPop = [];

	// 대형마트구분
	var jsonOrdrGdsPopLgszMrkt = [];
	// 품목
	var jsonOrdrGdsPopItem = [];
	// 품종
	var jsonOrdrGdsPopVrty = [];
	// 규격
	var jsonOrdrGdsPopSpcfct = [];
	// 출하포장단위 상품코드, 상품명
	var jsonOrdrGdsPopSpmtPckgUnit = [];

	/**
	 * @description 대형마트 발주상품정보 팝업
	 */
	const popOrdrGds = {
		prgrmId: 'ordrGdsPop',
		modalId: 'modal-ordrGdsPop',
		gridId: 'grdOrdrGdsPop',
		jsonId: 'jsonOrdrGdsPop',
		areaId: 'sb-area-ordrGdsPop',
		prvApcCd: "",
		objGrid: null,
		saveCnt: 0,
		gridJson: [],
		objMenuList: {
			"excelDwnldPop": {
				"name": "엑셀 다운로드",						//컨텍스트메뉴에 표시될 이름
				"accesskey": "e",						//단축키
				"callback": "popOrdrGds.exportExcel",	//콜백함수명
			}
		},
		exportExcel: function () {
			grdOrdrGdsPop.exportLocalExcel(
					"발주상품정보", {
						bSaveLabelData: true, 
						bNullToBlank: true, 
						bSaveSubtotalValue: true, 
						bCaptionConvertBr: true, 
						arrSaveConvertText: true
					});
	    },
		param: {
			apcCd: null,
			apcNm: null,
			lgszMrktCd: null,
			orgnGdsCd: null,
			orgnGdsNm: null
		},
		callbackFnc: function() {},
		setEditable: function(/** boolean */ _isEditable) {
			if (_isEditable) {
				SBUxMethod.hide('ordrGdsPop-btn-edit');
				SBUxMethod.show('ordrGdsPop-btn-cancel');
				SBUxMethod.attr('ordrGdsPop-btn-save', 'disabled', false);
				SBUxMethod.attr('ordrGdsPop-btn-search', 'disabled', true);
				SBUxMethod.attr('ordrGdsPop-btn-choice', 'disabled', true);
			} else {
				SBUxMethod.show('ordrGdsPop-btn-edit');
				SBUxMethod.hide('ordrGdsPop-btn-cancel');
				SBUxMethod.attr('ordrGdsPop-btn-save', 'disabled', true);
				SBUxMethod.attr('ordrGdsPop-btn-search', 'disabled', false);
				SBUxMethod.attr('ordrGdsPop-btn-choice', 'disabled', false);
			}
		},
		init: async function(_param, _callbackFnc) {
			SBUxMethod.openModal(this.modalId);
			this.param = gfn_cloneJson(_param);
			
			// set param
			SBUxMethod.set("ordrGdsPop-inp-apcCd", this.param.apcCd);
			SBUxMethod.set("ordrGdsPop-inp-apcNm", this.param.apcNm);
			
			this.setEditable(false);
			
			if (grdOrdrGdsPop == null) {
				let rst = await Promise.all([
					gfn_setComCdSBSelect(
							'ordrGdsPop-slt-lgszMrktCd', 
							jsonOrdrGdsPopLgszMrkt, 
							'LGSZ_MRKT_CD'),
					gfn_getSpmtPckgUnits(this.param.apcCd)							
				]);
				
				jsonOrdrGdsPopSpmtPckgUnit = rst[1];
			}

			SBUxMethod.set("ordrGdsPop-slt-lgszMrktCd", this.param.lgszMrktCd);
			SBUxMethod.set("ordrGdsPop-inp-orgnGdsCd", this.param.orgnGdsCd);
			SBUxMethod.set("ordrGdsPop-inp-orgnGdsNm", this.param.orgnGdsNm);
			
			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			this.createGrid();
			this.search();
		},
		close: function(_ordrGds) {
			//gfn_closeModal(this.modalId, this.callbackFnc, _ordrGds);
			gfn_closeModal(this.modalId, this.callbackFnc, {
				saveCnt: this.saveCnt
			});
		},
		createGrid: function(/** {boolean} */ _isEditable) {
			
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
		    SBGridProperties.contextmenulist = this.objMenuList;	// 우클릭 메뉴 리스트
			
		    SBGridProperties.columns = [
		    	{
		    		caption: ["처리"], 			
		    		ref: 'delYn', 			
		    		type: 'button', 
		    		width: '50px', 	
		    		style: 'text-align:center', 
		    		sortable: false,
		        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
						if (!_isEditable) {
							return "";
						}

		            	if (gfn_isEmpty(strValue)){
		            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popOrdrGds.add(" + nRow + ", " + nCol + ")'>추가</button>";
		            	} else {
					        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popOrdrGds.del(" + nRow + ")'>삭제</button>";
		            	}
			    	}
		    	},
		    	{
	            	caption: ['대형마켓구분'], 		
	            	ref: 'lgszMrktCd',
	            	width: '200px', 	
	            	type: 'combo', 	
	            	style: 'text-align:center;',
	            	userattr: {colNm: "lgszMrktCd"},
	            	typeinfo: {
	            		ref:'jsonOrdrGdsPopLgszMrkt',
	            		label:'label',
	            		value:'value',
	            		displayui : false,
	            		//oneclickedit: true,
	            		//unselect: {label : '', value: ''}
	            	}
	            },
	            {
	            	caption: ['발주상품코드'], 		
	            	ref: 'orgnGdsCd', 			
	            	width: '100px', 	
	            	type: 'input', 	
	            	style: 'text-align:left;'
	            },
	            {
	            	caption: ['발주상품명'], 		
	            	ref: 'orgnGdsNm', 			
	            	width: '100px', 	
	            	type: 'input', 	
	            	style: 'text-align:left;'
	            },
	            {
	            	caption: ['APC상품명'], 		
	            	ref: 'spmtPckgUnitCd',
	            	width: '200px', 	
	            	type: 'combo', 	
	            	style: 'text-align:center;',
	            	userattr: {colNm: "spmtPckgUnitCd"},
	            	typeinfo: {
	            		ref:'jsonOrdrGdsPopSpmtPckgUnit',
	            		label:'spmtPckgUnitNm',
	            		value:'spmtPckgUnitCd',
	            		displayui : false,
	            		oneclickedit: true,
	            		unselect: {label : '', value: ''}
	            	}
	            },
	            {
	            	caption: ['품목'], 		
	            	ref: 'itemNm', 			
	            	width: '100px', 	
	            	type: 'output', 	
	            	style: 'text-align:center;'
	            },
	            {
	            	caption: ['품종'], 		
	            	ref: 'vrtyNm', 			
	            	width: '100px', 	
	            	type: 'output', 	
	            	style: 'text-align:center;'
	            },
	            {
	            	caption: ['규격'], 		
	            	ref: 'spcfctNm', 			
	            	width: '100px', 	
	            	type: 'output', 	
	            	style: 'text-align:center;'
	            },
	            {
	            	caption: ['상품등급'], 		
	            	ref: 'gdsGrdNm', 			
	            	width: '80px', 	
	            	type: 'output', 	
	            	style: 'text-align:center;'
	            },
	            {
					caption: ["적용일자"],
					ref: 'aplcnYmd',
					type: 'datepicker',
					width: '100px',
					style: 'text-align:center',
					format : {
						type:'date',
						rule:'yyyy-mm-dd',
						origin:'yyyymmdd'
					},
					typeinfo : {gotoCurrentClick: true, clearbutton: true}

				},
	            {caption: ["APC코드"],		ref: 'apcCd',		type:'output',  hidden: true},
	            //{caption: ["대형마켓구분"],		ref: 'lgszMrktCd',   type:'output',  hidden: true},
	            {caption: ["상품코드"],			ref: 'gdsCd',   	type:'output',  hidden: true},
	            //{caption: ["출하포장단위코드"],	ref: 'spmtPckgUnitCd',	type:'output',  hidden: true},
	            {caption: ["품목코드"],			ref: 'itemCd',   	type:'output',  hidden: true},
	            {caption: ["품종코드"],			ref: 'vrtyCd',		type:'output',  hidden: true},
	            {caption: ["규격코드"],			ref: 'spcfctCd',   	type:'output',  hidden: true},
		    ];
		    grdOrdrGdsPop = _SBGrid.create(SBGridProperties);
		    grdOrdrGdsPop.bind('dblclick', popOrdrGds.choice);
		},
		save: async function() {
			
			const apcCd = this.param.apcCd;
			const grid = grdOrdrGdsPop;
			
			let allData = grid.getGridDataAll();

			const ordrGdsList = [];
			for ( let i=1; i<=allData.length; i++ ){
				const rowData = grid.getRowData(i);
				const rowSts = grid.getRowStatus(i);
				
				if (!_.isEqual(rowData.delYn, "N")) {
					continue;
				}
				if (rowSts !== 2 && rowSts !== 3) {
					continue;
				}
				
				if (gfn_isEmpty(rowData.lgszMrktCd)){
					gfn_comAlert("W0001", "대형마켓구분");	//	W0001	{0}을/를 선택하세요.
		            return;
				}
				if (gfn_isEmpty(rowData.orgnGdsCd)){
					gfn_comAlert("W0002", "발주상품코드");	//	W0002	{0}을/를 입력하세요.
		            return;
				}
				if (gfn_isEmpty(rowData.orgnGdsNm)){
					gfn_comAlert("W0002", "발주상품명");		//	W0002	{0}을/를 입력하세요.
		            return;
				}
				if (gfn_isEmpty(rowData.spmtPckgUnitCd)){
					gfn_comAlert("W0001", "APC상품명");	//	W0001	{0}을/를 선택하세요.
		            return;
				}
				
				ordrGdsList.push({
					apcCd: apcCd,
					lgszMrktCd: rowData.lgszMrktCd,
					aplcnYmd: rowData.aplcnYmd,
					orgnGdsCd: rowData.orgnGdsCd,
					orgnGdsNm: rowData.orgnGdsNm,
					spmtPckgUnitCd: rowData.spmtPckgUnitCd,
					rowSts: rowSts === 3 ? "I" : "U",
				});
			}

			if (ordrGdsList.length == 0){
				gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
	            return;
			}

			if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}

	    	const postJsonPromise = gfn_postJSON("/am/cmns/multiOrdrGdsList.do", ordrGdsList, this.prgrmId);

			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		this.saveCnt++;
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		this.setEditable(false);
	        		this.createGrid(false);
	        		this.search();
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
	        	}
	        } catch(e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
		},
		choice: function() {
			const grid = grdOrdrGdsPop;
			let nRow = grid.getRow();
			if (nRow < 0) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grid.getRowData(nRow);
				popOrdrGds.close(rowData);
			}
		},
		edit: async function() {
			
			this.setEditable(true);

			this.createGrid(true);
			
			const grid = grdOrdrGdsPop;			
			grid.rebuild();
			grid.setCellDisabled(0, 0, grid.getRows() - 1, grid.getCols() - 1, false);

			let nRow = grid.getRows();
			grid.addRow(true);
			grid.setCellDisabled(nRow, 0, nRow, grid.getCols() - 1, true);
			grid.bind('valuechanged', this.onChange);
			
			grid.unbind('dblclick');
		},
		cancel: function() {
			this.setEditable(false);
			this.createGrid();
			this.search();
		},
		add: function(nRow, nCol) {
			const grid = grdOrdrGdsPop;
			grid.setCellData(nRow, nCol, "N", true);
			grid.setCellDisabled(nRow, 0, nRow, grid.getCols() - 1, false);
			
			let lgszMrktCd = SBUxMethod.get("ordrGdsPop-slt-lgszMrktCd");
	    	let orgnGdsCd = gfn_nvl(SBUxMethod.get("ordrGdsPop-inp-orgnGdsCd"));
	    	let orgnGdsNm = gfn_nvl(SBUxMethod.get("ordrGdsPop-inp-orgnGdsNm"));
	    	
	    	const rowData = grid.getRowData(nRow, false);	// deep copy
	    	rowData.lgszMrktCd = lgszMrktCd;
	    	rowData.orgnGdsCd = orgnGdsCd;
	    	rowData.orgnGdsNm = orgnGdsNm;
	    	
			nRow++;
			grid.addRow(true);
			grid.setCellDisabled(nRow, 0, nRow, grid.getCols() - 1, true);
		},
		del: async function(nRow) {
			
			const apcCd = popOrdrGds.param.apcCd;
			const rowSts = grdOrdrGdsPop.getRowStatus(nRow);

			if (rowSts == 0 || rowSts == 2){
				if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
					return;
				}
				const rowData = grdOrdrGdsPop.getRowData(nRow);
				const postJsonPromise = gfn_postJSON("/am/cmns/deleteOrdrGds.do", {
					apcCd: rowData.apcCd,
					lgszMrktCd: rowData.lgszMrktCd,
					aplcnYmd: rowData.aplcnYmd,
					orgnGdsCd: rowData.orgnGdsCd
				}, this.prgrmId);

				const data = await postJsonPromise;
		        try {
		        	if (_.isEqual("S", data.resultStatus)) {
		        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
		        		this.search(true);
		        	} else {
		        		gfn_comAlert(data.resultCode, data.resultMessage);
		        	}
		        } catch(e) {
		    		if (!(e instanceof Error)) {
		    			e = new Error(e);
		    		}
		    		console.error("failed", e.message);
		        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		        }
        	} else {
        		grdOrdrGdsPop.deleteRow(nRow);
        	}
		},
		search: async function() {
			grdOrdrGdsPop.rebuild();

	    	// grid clear
	    	jsonOrdrGdsPop.length = 0;
	    	await this.setGrid();
	    	document.querySelector('#cnt-ordrGdsPop').innerText = jsonOrdrGdsPop.length;
		},
		setGrid: async function() {
	    	let apcCd = SBUxMethod.get("ordrGdsPop-inp-apcCd");
	    	let gdsNm = gfn_nvl(SBUxMethod.get("ordrGdsPop-inp-gdsNm"));
	    	let lgszMrktCd = SBUxMethod.get("ordrGdsPop-slt-lgszMrktCd");
	    	let orgnGdsCd = gfn_nvl(SBUxMethod.get("ordrGdsPop-inp-orgnGdsCd"));
	    	let orgnGdsNm = gfn_nvl(SBUxMethod.get("ordrGdsPop-inp-orgnGdsNm"));

			try {
		        const postJsonPromise = gfn_postJSON("/am/cmns/selectOrdrGdsList.do", {
		        	apcCd: apcCd,
		        	gdsNm: gdsNm,
		        	lgszMrktCd: lgszMrktCd,
		        	orgnGdsCd: orgnGdsCd,
		        	orgnGdsNm: orgnGdsNm
				});

		        const data = await postJsonPromise;
		        
		        if (!_.isEqual("S", data.resultStatus)) {
		        	gfn_comAlert(data.resultCode, data.resultMessage);
		        	return;
		        }
		        
				jsonOrdrGdsPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const ordrGds = {
						apcCd: item.apcCd,
						lgszMrktCd: item.lgszMrktCd,
						orgnGdsCd: item.orgnGdsCd,
						orgnGdsNm: item.orgnGdsNm,
						aplcnYmd: item.aplcnYmd,
						spmtPckgUnitCd: item.spmtPckgUnitCd,
						spmtPckgUnitNm: item.spmtPckgUnitNm,
						itemCd: item.itemCd,
						itemNm: item.itemNm,
						vrtyCd: item.vrtyCd,
						vrtyNm: item.vrtyNm,
						spcfctCd: item.spcfctCd,
						spcfctNm: item.spcfctNm,
						gdsCd: item.gdsCd,
						gdsGrdNm: item.gdsGrdNm,
						delYn: item.delYn
					}
					
					jsonOrdrGdsPop.push(ordrGds);
				});
	        	
	        	grdOrdrGdsPop.rebuild();
	        	grdOrdrGdsPop.setCellDisabled(0, 0, grdOrdrGdsPop.getRows() - 1, grdOrdrGdsPop.getCols() - 1, true);

	        	//document.querySelector('#cnt-ordrGdsPop').innerText = jsonOrdrGdsPop.length;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
	    },
	    onChange: function(event) {
	    	
	    	const grid = grdOrdrGdsPop;
	    	
			const nRow = grid.getRow();
			const nCol = grid.getCol();

			const usrAttr = grid.getColUserAttr(nCol);
			
			if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

				const rowData = grid.getRowData(nRow, false);	// deep copy
				
				switch (usrAttr.colNm) {
					case "spmtPckgUnitCd":
						// 품목 기준으로 확인
						if (!gfn_isEmpty(rowData.spmtPckgUnitCd)) {
							let chkInfo = _.find(
									jsonOrdrGdsPopSpmtPckgUnit,
									{
										spmtPckgUnitCd: rowData.spmtPckgUnitCd
									}
								);
							if (!gfn_isEmpty(chkInfo)) {
								rowData.itemCd = chkInfo.itemCd;
								rowData.itemNm = chkInfo.itemNm;
								rowData.vrtyCd = chkInfo.vrtyCd;
								rowData.vrtyNm = chkInfo.vrtyNm;
								rowData.spcfctCd = chkInfo.spcfctCd;
								rowData.spcfctNm = chkInfo.spcfctNm;
							}
						} else {
							rowData.itemCd = "";
							rowData.itemNm = "";
							rowData.vrtyCd = "";
							rowData.vrtyNm = "";
							rowData.spcfctCd = "";
							rowData.spcfctNm = "";
						}
						
						grid.refresh({"combo":true,"focus":false});
						
						break;
					default:
						break;
				}
				
			}
	    }
	}
</script>
</html>