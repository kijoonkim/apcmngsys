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
						<span style="font-weight:bold;">원물 생산자 정보를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;">편집 버튼을 통해 생산자정보를 등록/수정할 수 있습니다.</span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchPrdcr" name="btnSearchPrdcr" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popPrdcr.search"></sbux-button>
					<sbux-button id="btnEditPrdcr" name="btnEditPrdcr" uitype="normal" text="편집" class="btn btn-sm btn-outline-danger" onclick="popPrdcr.edit"></sbux-button>
					<sbux-button id="btnCancelPrdcr" name="btnCancelPrdcr" uitype="normal" text="취소" class="btn btn-sm btn-outline-danger" onclick="popPrdcr.cancel"></sbux-button>
					<sbux-button id="btnSavePrdcr" name="btnSavePrdcr" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="popPrdcr.save" disabled></sbux-button>
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
									class="form-control input-sm" maxlength="19"
    								onkeyenter="keyUpInp(prdcr-inp-prdcrNm, 'prdcr-inp-prdcrNm', 'true')">
    							</sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span style="color: black;">생산자 목록</span>
								<span style="font-size:12px">(조회건수 <span id="prdcr-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					 	<div class="ad_tbl_toplist">
						</div>
					</div>
					<div id="sb-area-grdPrdcrPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
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
	var jsonComClclnCrtrPrdcrPop	= [];	// 정산기준 clclnCrtr	Grid

	var grdPrdcrPop = null;
	var jsonPrdcrPop = [];

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
		callbackFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackFnc) {

			// set param
			SBUxMethod.set("prdcr-inp-apcCd", _apcCd);
			SBUxMethod.set("prdcr-inp-apcNm", _apcNm);

			SBUxMethod.show('btnEditPrdcr');
			SBUxMethod.hide('btnCancelPrdcr');
			SBUxMethod.attr('btnSavePrdcr', 'disabled', true);
			SBUxMethod.attr('btnSearchPrdcr', 'disabled', false);

			if (!gfn_isEmpty(_callbackFnc) && typeof _callbackFnc === 'function') {
				this.callbackFnc = _callbackFnc;
			}

			if (grdPrdcrPop === null || this.prvApcCd != _apcCd) {
				let rst = await Promise.all([
					gfn_setApcItemSBSelect('grdPrdcr', jsonApcItemPrdcrPop, _apcCd),				// 품목
					gfn_setApcVrtySBSelect('grdPrdcr', jsonApcVrtyPrdcrPop, _apcCd),				// 품종
					gfn_setComCdSBSelect('grdPrdcr', jsonComGdsSeCdPrdcrPop, 'GDS_SE_CD'),			// 상품구분
					gfn_setComCdSBSelect('grdPrdcr', jsonComWrhsSeCdPrdcrPop, 'WRHS_SE_CD'),		// 입고구분
					gfn_setComCdSBSelect('grdPrdcr', jsonComTrsprtSeCdPrdcrPop, 'TRSPRT_SE_CD'),	// 운송구분
					gfn_setComCdSBSelect('grdPrdcr', jsonComClclnCrtrPrdcrPop, 'CLCLN_CRTR')		// 정산기준
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
			gfn_closeModal(this.modalId, this.callbackFnc, _prdcr);
		},
		createGrid: function(/** {boolean} */ isEditable) {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdComAuthUserPop';					//'grdComAuthUserPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonComAuthUserPop';		//'jsonComAuthUserPop';
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'byrow';
		    SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.allowcopy = true;
			SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.scrollbubbling = false;
		    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
		    SBGridProperties.columns = [
		        {caption: ['생산자명'], 		ref: 'prdcrNm', 		type: 'input', 	width: '100px', style: 'text-align:center',
					typeinfo: {maxlength: 19}},
		        {caption: ['대표품목'], 		ref: 'rprsItemCd', 		type: 'combo', 	width: '100px', style: 'text-align:center',
					typeinfo: {ref:'jsonApcItemPrdcrPop', 		label:'label', value:'value', itemcount: 10}
		        },
		        {caption: ['대표품종'], 		ref: 'rprsVrtyCd', 		type: 'combo', 	width: '100px', style: 'text-align:center',
					typeinfo: {ref:'jsonApcVrtyPrdcrPop', 		label:'label', value:'value', itemcount: 10}
				},
		        {caption: ['상품구분'], 		ref: 'gdsSeCd', 		type: 'combo', 	width: '80px', 	style: 'text-align:center',
					typeinfo: {ref:'jsonComGdsSeCdPrdcrPop', 	label:'label', value:'value', itemcount: 10}
				},
		        {caption: ['입고구분'], 		ref: 'wrhsSeCd', 		type: 'combo', 	width: '80px', 	style: 'text-align:center',
					typeinfo: {ref:'jsonComWrhsSeCdPrdcrPop', 	label:'label', value:'value', itemcount: 10}
				},
		        {caption: ['운송구분'], 		ref: 'trsprtSeCd', 		type: 'combo', 	width: '80px', 	style: 'text-align:center',
					typeinfo: {ref:'jsonComTrsprtSeCdPrdcrPop', label:'label', value:'value', itemcount: 10}
				},
		        {caption: ['정산기준'], 		ref: 'clclnCrtr', 		type: 'combo', 	width:'80px', 	style: 'text-align:center',
					typeinfo: {ref:'jsonComClclnCrtrPrdcrPop', 	label:'label', value:'value', itemcount: 10}
				},
		        {caption: ['차량번호'], 		ref: 'vhclno', 			type: 'input', 	width: '100px', style: 'text-align:center',
					typeinfo: {maxlength: 8}},
		        {caption: ['전화번호'], 		ref: 'telno', 			type: 'input', 	width: '150px', style: 'text-align:center',
						typeinfo: {maxlength: 11}},
		        {caption: ['생산자연계코드'], 	ref: 'prdcrLinkCd', 	type: 'input', 	width: '150px', style: 'text-align:center',
					typeinfo: {maxlength: 20}},
// 		        {caption: ['참여조직'], 		ref: '', 				type: 'input', 	width: '150px', style: 'text-align:center'},
		        {caption: ['생산자인식번호'], 	ref: 'prdcrIdentno', 	type: 'input', 	width: '150px', style: 'text-align:center'},
		        {caption: ['비고'], 			ref: 'rmrk', 			type: 'input', 	width: '150px', style: 'text-align:center',
					typeinfo: {maxlength: 1000}},
		        {caption: ["처리"], 			ref: 'delYn', 			type: 'button', width: '80px', 	style: 'text-align:center',
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
		        {caption: ['APC코드'], ref: 'apcCd', hidden : true},
		        {caption: ['생산자코드'], ref: 'prdcrCd', hidden : true},
		        {caption: ['ROW STATUS'], ref: 'rowSts', hidden : true},
		    ];

		    grdPrdcrPop = _SBGrid.create(SBGridProperties);
		    //grdPrdcrPop.bind('beforepagechanged', 'popComAuthUser.paging');
		    grdPrdcrPop.bind('dblclick', popPrdcr.choice);	//'popPrdcrChoice');
		    //this.search();
		},
		choice: function() {
			let nRow = grdPrdcrPop.getRow();
			let rowData = grdPrdcrPop.getRowData(nRow);
			popPrdcr.close(rowData);
		},
		edit: async function() {

			SBUxMethod.hide('btnEditPrdcr');
			SBUxMethod.show('btnCancelPrdcr');
			SBUxMethod.attr('btnSavePrdcr', 'disabled', false);
			SBUxMethod.attr('btnSearchPrdcr', 'disabled', true);

			this.createGrid(true);
			grdPrdcrPop.rebuild();
			grdPrdcrPop.setCellDisabled(0, 0, grdPrdcrPop.getRows() - 1, grdPrdcrPop.getCols() - 1, false);

			let nRow = grdPrdcrPop.getRows();
			grdPrdcrPop.addRow(true);
			grdPrdcrPop.setCellDisabled(nRow, 0, nRow, grdPrdcrPop.getCols() - 1, true);
			grdPrdcrPop.unbind('dblclick');
		},
		cancel: function() {

			SBUxMethod.show('btnEditPrdcr');
			SBUxMethod.hide('btnCancelPrdcr');
			SBUxMethod.attr('btnSavePrdcr', 'disabled', true);
			SBUxMethod.attr('btnSearchPrdcr', 'disabled', false);

			this.createGrid();
			this.search();
		},
		/**
		 * @param {number} nRow
		 * @param {number} nCol
		 */
		add: function(nRow, nCol) {
			grdPrdcrPop.setCellData(nRow, nCol, "N", true);
			grdPrdcrPop.setCellDisabled(nRow, 0, nRow, grdPrdcrPop.getCols() - 1, false);
			nRow++;
			grdPrdcrPop.addRow(true);
			grdPrdcrPop.setCellDisabled(nRow, 0, nRow, grdPrdcrPop.getCols() - 1, false);
		},
		del: async function(nRow) {
			const apcCd = SBUxMethod.get("prdcr-inp-apcCd");
			const rowSts = grdPrdcrPop.getRowStatus(nRow);
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
				}, this.prgrmId);	// 프로그램id 추가

				const data = await postJsonPromise;
		        try {
		        	if (_.isEqual("S", data.resultStatus)) {
		        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
		        		this.search(true);
		        	} else {
		        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		        	}
		        } catch(e) {
		        }
        	} else {
        		grdPrdcrPop.deleteRow(nRow);
        	}
		},
		save: async function() {
			const apcCd = SBUxMethod.get("prdcr-inp-apcCd");
			let allData = grdPrdcrPop.getGridDataAll();
			let insertList = [];
			let updateList = [];
			let insertCnt = 0;
			let updateCnt = 0;

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

			if (prdcrList.length == 0){
				gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
	            return;
			}

			if (!gfn_comConfirm("Q0001", "등록")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}

	    	const postJsonPromise = gfn_postJSON("/am/cmns/multiPrdcrList.do", prdcrList, this.prgrmId);	// 프로그램id 추가

			const data = await postJsonPromise;
	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		this.search(true);
	        	} else {
	        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        	}
	        } catch(e) {
	        }

		},
		search: async function(/** {boolean} */ isEditable) {
			// set pagination
			grdPrdcrPop.rebuild();
	    	let pageSize = grdPrdcrPop.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonPrdcrPop.length = 0;
	    	grdPrdcrPop.refresh();
	    	//grdPrdcrPop.clearStatus();
	    	this.setGrid(pageSize, pageNo, isEditable);
		},
		setGrid: async function(pageSize, pageNo, isEditable) {

	    	let apcCd = SBUxMethod.get("prdcr-inp-apcCd");
			let prdcrNm = SBUxMethod.get("prdcr-inp-prdcrNm");

	        const postJsonPromise = gfn_postJSON("/am/cmns/selectPrdcrList.do", {
	        	apcCd: apcCd,
	        	prdcrNm: prdcrNm,
	        	// pagination
		  		pagingYn : 'Y',
				currentPageNo : pageNo,
	 		  	recordCountPerPage : pageSize
			});

	        const data = await postJsonPromise;

			try {
	        	/** @type {number} **/
	    		let totalRecordCount = 0;

	    		jsonPrdcrPop.length = 0;
	        	data.resultList.forEach((item, index) => {
					const prdcr = {
						rowSeq			: item.rowSeq,
						prdcrCd			: item.prdcrCd,
					    prdcrNm 		: item.prdcrNm,
					    rprsItemCd 		: item.rprsItemCd,
					    rprsVrtyCd 		: item.rprsVrtyCd,
					    gdsSeCd 		: item.gdsSeCd,
					    wrhsSeCd 		: item.wrhsSeCd,
					    trsprtSeCd 		: item.trsprtSeCd,
					    clclnCrtr 		: item.clclnCrtr,
					    vhclno 			: item.vhclno,
					    telno			: item.telno,
					    prdcrLinkCd		: item.prdcrLinkCd,
					    prdcrIdentno	: item.prdcrIdentno,
					    rmrk 			: item.rmrk,
					    delYn 			: item.delYn,
					    apcCd 			: item.apcCd
					}
					jsonPrdcrPop.push(prdcr);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

	        	if (jsonPrdcrPop.length > 0) {
	        		if(grdPrdcrPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdPrdcrPop.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdPrdcrPop.rebuild();
					}else{
						grdPrdcrPop.refresh();
					}
	        	} else {
	        		grdPrdcrPop.setPageTotalCount(totalRecordCount);
	        		grdPrdcrPop.rebuild();
	        	}

	        	if (isEditable) {
	        		grdPrdcrPop.setCellDisabled(0, 0, grdPrdcrPop.getRows() - 1, grdPrdcrPop.getCols() - 1, false);
	        		let nRow = grdPrdcrPop.getRows();
					grdPrdcrPop.addRow(true);
					grdPrdcrPop.setCellDisabled(nRow, 0, nRow, grdPrdcrPop.getCols() - 1, true);
	        	} else {
	        		grdPrdcrPop.setCellDisabled(0, 0, grdPrdcrPop.getRows() - 1, grdPrdcrPop.getCols() - 1, true);
	        	}

	        	document.querySelector('#prdcr-pop-cnt').innerText = totalRecordCount;

	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        }
	    },
	    paging: function() {
	    	let recordCountPerPage = grdComAuthUserPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdComAuthUserPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popComAuthUser.setGrid(recordCountPerPage, currentPageNo);
	    }
	}

</script>
</html>