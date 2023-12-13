<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 원물입고 팔레트/박스 입고등록</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header">
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSearchPltBx" name="btnSearchPltBx" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popPltBx.search"></sbux-button>
						<sbux-button id="btnConfirmPltBx" name="btnConfirmPltBx" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" onclick="popPltBx.confirm"></sbux-button>
						<sbux-button id="btnEndPltBx" name="btnEndPltBx" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popPltBx.close"></sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<sbux-input id="pltBx-inp-apcCd" name="pltBx-inp-apcCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="pltBx-inp-apcNm" name="pltBx-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">계량번호</th>
							<th class="td_input">
								<sbux-input id="pltBx-inp-vhclNm" name="pltBx-inp-vhclNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="col-sm-6">
					<div class="ad_section_top">
						<div id="sb-area-grdPltPltBxPop" style="width:100%;height:300px;"></div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="ad_section_top">
						<div id="sb-area-grdBxPltBxPop" style="width:100%;height:300px;"></div>
					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonApcPltPltBxPop		= [];
	var jsonApcBxPltBxPop		= [];

	var grdPltPltBxPop 	= null;
	var grdBxPltBxPop 	= null;
	var jsonPltPltBxPop = [];
	var jsonBxPltBxPop 	= [];

	var jsonPltBxPop = {};

	const popPltBx = {
			prgrmId: 'pltBxPopup',
			modalId: 'modal-pltBx',
 			prvApcCd: "",
			callbackFnc: function() {},
			init: async function(_apcCd, _apcNm, _callbackFnc, _pltBxData) {

				SBUxMethod.set("pltBx-inp-apcCd", _apcCd);
				SBUxMethod.set("pltBx-inp-apcNm", _apcNm);

				if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
					this.callbackFnc = _callbackFnc;
				}

				await this.initSBSelectPltBx();

				if (grdPltPltBxPop == null) {
					this.createPltGrid();
				} else {
					grdPltPltBxPop.rebuild();
				}

				if (grdBxPltBxPop == null) {
					this.createBxGrid();
				} else {
					grdBxPltBxPop.rebuild();
				}

				jsonPltBxPop = {
						pltData: [],
						bxData: []
					}

				if (!gfn_isEmpty(_pltBxData)) {
					if (!gfn_isEmpty(_pltBxData.pltData)) {
						jsonPltBxPop.pltData = gfn_cloneJson(_pltBxData.pltData);
					}
					if (!gfn_isEmpty(_pltBxData.bxData)) {
						jsonPltBxPop.bxData = gfn_cloneJson(_pltBxData.bxData);
					}
				}

				this.search();
			},
			close: function(_pltBxData) {
				gfn_closeModal(this.modalId, this.callbackFnc, _pltBxData);
			},
			createPltGrid: function() {
				jsonPltPltBxPop = [];
			    var SBGridProperties = {};
			    SBGridProperties.parentid = 'sb-area-grdPltPltBxPop';
			    SBGridProperties.id = 'grdPltPltBxPop';
			    SBGridProperties.jsonref = 'jsonPltPltBxPop';
			    SBGridProperties.emptyrecords = '데이터가 없습니다.';
			    SBGridProperties.selectmode = 'byrow';
			    SBGridProperties.extendlastcol = 'scroll';
			    SBGridProperties.scrollbubbling = false;
			    SBGridProperties.columns = [
			        {caption: ["팔레트","종류"],	ref: 'pltBxCd',		type:'combo',  width:'150px',   style:'text-align:center;background-color:#FFF8DC;',
						typeinfo : {ref:'jsonApcPltPltBxPop', label:'pltBxNm', value:'pltBxCd', displayui : false, oneclickedit: true}
			        },
			        {caption: ["팔레트","수량"], 	ref: 'qntt',  		type:'input',  width:'50px',    style:'text-align:right;background-color:#FFF8DC;',
			        	typeinfo: {mask: {alias: '#', repeat: '*', unmaskvalue: true}, oneclickedit: true},
			    		format : {type:'number', rule:'#,###'},
			    		maxlength: 3
			        },
			        {caption: ["팔레트","단중"], 	ref: 'unitWght',   	type:'output',  width:'60px',   style:'text-align:right', format : {type:'number', rule:'#,###'}},
			        {caption: ["팔레트","중량"], 	ref: 'wght',   		type:'output',  width:'70px',   style:'text-align:right', format : {type:'number', rule:'#,###'}},
			        {caption: ["팔레트","단위"], 	ref: 'unitNm',   	type:'output',  width:'50px',   style:'text-align:center'},
			        {caption: ["팔레트","kg"], 	ref: 'kg',   		type:'output',  width:'70px',   style:'text-align:right', format : {type:'number', rule:'#,###'}, hidden:true},
			        {caption: ["팔레트","처리"], 	ref: 'delYn',   	type:'button',  width:'50px',   style:'text-align:center',
			        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
			            	if (gfn_isEmpty(strValue)){
			            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popPltBx.addPlt(" + nRow + ", " + nCol + ")'>추가</button>";
			            	} else {
						        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popPltBx.delPlt(" + nRow + ")'>삭제</button>";
			            	}
				    }},
				    {caption: ["팔레트정보","APC코드"], 			ref: 'apcCd',  		hidden : true},
				    {caption: ["팔레트정보","팔레트/박스 구분코드"], 	ref: 'pltBxSeCd',  	hidden : true},
				    {caption: ["팔레트정보","코드"], 				ref: 'pltBxCd',  	hidden : true},
				    {caption: ["팔레트정보","단위코드"], 			ref: 'unitCd',  	hidden : true}
			    ];
			    SBGridProperties.total = {
					type: 'grand',
				  	position: 'bottom',
				  	columns: {
				      	sum : [1,5]
				  	},
				  	subtotalrow: {},
				  	grandtotalrow: {
				    	titlecol: 0,
				      	titlevalue: '합계',
				      	style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
				      	stylestartcol: 0
				  	},
				  	datasorting: true,
				  	usedecimal: false,
				};
			    grdPltPltBxPop = _SBGrid.create(SBGridProperties);
			    grdPltPltBxPop.bind('valuechanged', popPltBx.onPltValueChanged);
			},
			createBxGrid: function() {
				jsonBxPltBxPop = [];
			    var SBGridProperties = {};
			    SBGridProperties.parentid = 'sb-area-grdBxPltBxPop';
			    SBGridProperties.id = 'grdBxPltBxPop';
			    SBGridProperties.jsonref = 'jsonBxPltBxPop';
			    SBGridProperties.emptyrecords = '데이터가 없습니다.';
			    SBGridProperties.selectmode = 'byrow';
			    SBGridProperties.extendlastcol = 'scroll';
			    SBGridProperties.scrollbubbling = false;
			    SBGridProperties.columns = [
			    	{caption: ["박스","종류"], 		ref: 'pltBxCd',   	type:'combo',	width:'150px',	style:'text-align:center;background-color:#FFF8DC;',
						typeinfo : {ref:'jsonApcBxPltBxPop', label:'pltBxNm', value:'pltBxCd', displayui : false, oneclickedit: true}
			    	},
			        {caption: ["박스","수량"], 	ref: 'qntt',  		type:'input',  	width:'50px',   style:'text-align:right;background-color:#FFF8DC;',
			    		typeinfo: {mask: {alias: '#', repeat: '*', unmaskvalue: true}, oneclickedit: true},
			    		format : {type:'number', rule:'#,###'},
			    		maxlength: 3
		    		},
			        {caption: ["박스","단중"], 	ref: 'unitWght',   	type:'output',  width:'60px',   style:'text-align:right', format : {type:'number', rule:'#,###'}},
			        {caption: ["박스","중량"], 	ref: 'wght',   		type:'output',  width:'70px',   style:'text-align:right', format : {type:'number', rule:'#,###'}},
			        {caption: ["박스","단위"], 	ref: 'unitNm',   	type:'output',  width:'50px',   style:'text-align:center'},
			        {caption: ["박스","kg"], 	ref: 'kg',   		type:'output',  width:'70px',   style:'text-align:right', format : {type:'number', rule:'#,###'}, hidden:true},
			        {caption: ["박스","처리"], 		ref: 'delYn',   	type:'button',  width:'50px',   style:'text-align:center',
			        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
			            	if (gfn_isEmpty(strValue)){
			            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popPltBx.addBx(" + nRow + ", " + nCol + ")'>추가</button>";
			            	} else {
						        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='popPltBx.delBx(" + nRow + ")'>삭제</button>";
			            	}
				    }},
				    {caption: ["박스정보","APC코드"], 			ref: 'apcCd',  		hidden : true},
				    {caption: ["박스정보","팔레트/박스 구분코드"], 	ref: 'pltBxSeCd',  	hidden : true},
				    {caption: ["박스정보","코드"], 				ref: 'pltBxCd',  	hidden : true},
				    {caption: ["박스정보","단위코드"], 			ref: 'unitCd',  	hidden : true}
			    ];
			    SBGridProperties.total = {
						type: 'grand',
					  	position: 'bottom',
					  	columns: {
					      	sum : [1,5]
					  	},
					  	subtotalrow: {},
					  	grandtotalrow: {
					    	titlecol: 0,
					      	titlevalue: '합계',
					      	style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
					      	stylestartcol: 0
					  	},
					  	datasorting: true,
					  	usedecimal: false,
					};
			    grdBxPltBxPop = _SBGrid.create(SBGridProperties);
			    grdBxPltBxPop.bind('valuechanged', popPltBx.onBxValueChanged);
			},

			addPlt: function(nRow, nCol) {
				const apcCd = SBUxMethod.get("pltBx-inp-apcCd");
				grdPltPltBxPop.setCellData(nRow, nCol, "N", true);
				grdPltPltBxPop.setCellDisabled(nRow, 0, nRow, grdPltPltBxPop.getCols() - 1, false);
				grdPltPltBxPop.addRow(true);
				grdPltPltBxPop.setCellDisabled(nRow+1, 0, nRow+1, grdBxPltBxPop.getCols() - 1, true);
			},
			addBx: function(nRow, nCol) {
				const apcCd = SBUxMethod.get("pltBx-inp-apcCd");
				grdBxPltBxPop.setCellData(nRow, nCol, "N", true);
				grdBxPltBxPop.setCellDisabled(nRow, 0, nRow, grdBxPltBxPop.getCols() - 1, false);
				grdBxPltBxPop.addRow(true);
				grdBxPltBxPop.setCellDisabled(nRow+1, 0, nRow+1, grdBxPltBxPop.getCols() - 1, true);
			},
			delPlt: async function(nRow) {
				const rowSts = grdPltPltBxPop.getRowStatus(nRow);
				if (rowSts == 0 || rowSts == 2){
					if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
						return;
					}
        			//var pltBxVO = grdPlt.getRowData(nRow);
        			grdPltPltBxPop.deleteRow(nRow);
	        	} else {
	        		grdPltPltBxPop.deleteRow(nRow);
	        	}
			},
			delBx: async function(nRow) {
				const rowSts = grdBxPltBxPop.getRowStatus(nRow);
				if (rowSts == 0 || rowSts == 2){
					if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
						return;
					}
        			//var pltBxVO = grdPlt.getRowData(nRow);
        			grdBxPltBxPop.deleteRow(nRow);
	        	} else {
	        		grdBxPltBxPop.deleteRow(nRow);
	        	}
			},
			confirm: async function() {

				let pltQntt = 0;
				let pltWght = 0;
				let bxQntt = 0;
				let bxWght = 0;

				const __pltData = [];
				const __bxData = [];
				if (grdPltPltBxPop != null) {
					// 팔레트
					const pltAllData = grdPltPltBxPop.getGridDataAll();

					pltAllData.forEach((item, index) => {
						if (parseInt(item.qntt) || 0 > 0) {
							const plt = {
									pltBxSeCd: 'P',
									pltBxCd: item.pltBxCd,
									pltBxNm: item.pltBxNm,
									qntt: item.qntt,
									unitWght: item.unitWght,
									wght: item.wght,
									kg: item.kg,
									unitCd: item.unitCd,
									unitNm: item.unitNm,
									delYn: item.delYn
							}
							pltQntt += parseInt(item.qntt) || 0;
							pltWght += parseInt(item.kg) || 0;
							__pltData.push(plt);
						}
					});
				}

				if (grdBxPltBxPop != null) {
					// 박스
					const bxAllData = grdBxPltBxPop.getGridDataAll();
					bxAllData.forEach((item, index) => {

						if (parseInt(item.qntt) || 0 > 0) {
							const bx = {
									pltBxSeCd: 'B',
									pltBxCd: item.pltBxCd,
									pltBxNm: item.pltBxNm,
									qntt: item.qntt,
									unitWght: item.unitWght,
									wght: item.wght,
									kg: item.kg,
									unitCd: item.unitCd,
									unitNm: item.unitNm,
									delYn: item.delYn
							}
							bxQntt += parseInt(item.qntt) || 0;
							bxWght += parseInt(item.kg) || 0;

							__bxData.push(bx);
						}
					});
				}

				const pltBxData = {
						pltData: __pltData,
						bxData: __bxData,
						pltQntt: pltQntt,
						pltWght: pltWght,
						bxQntt: bxQntt,
						bxWght: bxWght,
						totalQntt: pltQntt + bxQntt,
						totalWght: pltWght + bxWght
					}

				popPltBx.close(pltBxData);
			},
			search: async function() {

				jsonPltPltBxPop = jsonPltBxPop.pltData;
				jsonBxPltBxPop = jsonPltBxPop.bxData;

				grdPltPltBxPop.refresh();
				grdBxPltBxPop.refresh();

				let nRow = jsonPltPltBxPop.length + 2;
				grdPltPltBxPop.addRow(true);
				grdPltPltBxPop.setCellDisabled(nRow, 0, nRow, grdPltPltBxPop.getCols() - 1, true);

				nRow = jsonBxPltBxPop.length + 2;
			    grdBxPltBxPop.addRow(true);
			    grdBxPltBxPop.setCellDisabled(nRow, 0, nRow, grdBxPltBxPop.getCols() - 1, true);
			},
		    initSBSelectPltBx: async function() {

			 	jsonApcPltPltBxPop.length = 0;
			 	jsonApcBxPltBxPop.length = 0;

			 	const apcCd = SBUxMethod.get("pltBx-inp-apcCd");
				var postJsonPromise = gfn_postJSON(
											"/am/cmns/pltBxInfos"
											, {apcCd: apcCd, useYn: "Y", delYn: "N"}
											, this.prgrmId
											, true
										);
				var data = await postJsonPromise;
				data.resultList.forEach((item) => {
					const pltBx = {
							pltBxSeCd: item.pltBxSeCd,
							pltBxCd: item.pltBxCd,
							pltBxNm: item.pltBxNm,
							unitWght: item.unitWght,
							unitCd: item.unitCd,
							unitNm: item.unitNm,
							bssInvntrQntt: item.bssInvntrQntt
					}

					if (item.pltBxSeCd == "P") {
						jsonApcPltPltBxPop.push(pltBx);
					} else if (item.pltBxSeCd == "B") {
						jsonApcBxPltBxPop.push(pltBx);
					}
				});
		    },
		    onPltValueChanged: function() {
		    	const nRow = grdPltPltBxPop.getRow();
		    	const nCol = grdPltPltBxPop.getCol();

		    	const rowData = grdPltPltBxPop.getRowData(nRow, false);	// deep copy

		    	switch (nCol) {
		    		case 0:	// 팔레트 선택
		    			const pltInfo = _.find(jsonApcPltPltBxPop, {pltBxCd: rowData.pltBxCd});
		    			// 단중, 단위 set
		    			rowData.unitWght = pltInfo.unitWght;
		    			rowData.unitCd = pltInfo.unitCd;
		    			rowData.unitNm = pltInfo.unitNm;
		    		case 1: // 수량
		    			rowData.wght = rowData.qntt * rowData.unitWght;
		    			let cnvtFactor = 1;
						switch (rowData.unitCd) {
							case "1":	// gram
								cnvtFactor = 1 / 1000;
								break;
							case "3":	// ton
								cnvtFactor = 1000;
								break;
							default:
								break;
						}
		    			rowData.kg = (parseInt(rowData.wght) || 0) * cnvtFactor;
		    			break;

		    		default:
		    			return;
		    	}

		    	grdPltPltBxPop.refresh();
		    },
		    onBxValueChanged: function() {
		    	const nRow = grdBxPltBxPop.getRow();
		    	const nCol = grdBxPltBxPop.getCol();

		    	const rowData = grdBxPltBxPop.getRowData(nRow, false);	// deep copy

		    	switch (nCol) {
		    		case 0:	// 팔레트 선택
		    			const bxInfo = _.find(jsonApcBxPltBxPop, {pltBxCd: rowData.pltBxCd});

		    			// 단중, 단위 set
		    			rowData.unitWght = bxInfo.unitWght;
		    			rowData.unitCd = bxInfo.unitCd;
		    			rowData.unitNm = bxInfo.unitNm;
		    		case 1: // 수량
		    			rowData.wght = rowData.qntt * rowData.unitWght;
		    			let cnvtFactor = 1;
						switch (rowData.unitCd) {
							case "1":	// gram
								cnvtFactor = 1 / 1000;
								break;
							case "3":	// ton
								cnvtFactor = 1000;
								break;
							default:
								break;
						}
		    			rowData.kg = (parseInt(rowData.wght) || 0) * cnvtFactor;
		    			break;

		    		default:
		    			return;
		    	}
		    	grdBxPltBxPop.refresh();
		    }
		}
</script>
</html>