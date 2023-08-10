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
			<div class="box-header">
				<div class="ad_tbl_top">
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSearchVrty" name="btnSearchVrty" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectVrtyList()">조회</sbux-button>
						<sbux-button id="btnChoiceVrty" name="btnChoiceVrty" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="fn_chcVrty">선택</sbux-button>
						<sbux-button id="btnEndVrty" name="btnEndVrty" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-vrtyCrtr')">종료</sbux-button>
					</div>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 16%">
						<col style="width: 32%">
						<col style="width: 16%">
						<col style="width: 32%">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="vrty-inp-apcNm" name="vrty-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">품종명</th>
							<th class="td_input">
								<sbux-input id="vrty-inp-vrtyNm" name="vrty-inp-vrtyNm" uitype="text" class="form-control input-sm" ></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdVrty" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
// 		fn_createVrtyGrid();		
		this.callbackFnc = _callbackFnc;
	})
	var jsonVrtyPopUp = [];
// 	function fn_createVrtyGrid() {
// 	    var SBGridProperties = {};
// 	    SBGridProperties.parentid = 'sb-area-grdVrty';
// 	    SBGridProperties.id = 'grdVrty';
// 	    SBGridProperties.jsonref = 'jsonVrtyPopUp';
// 	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
// 	    SBGridProperties.selectmode = 'byrow';
// 	    SBGridProperties.extendlastcol = 'scroll';
// 	    SBGridProperties.columns = [
// 	    	{caption : ["선택"],
//                 ref: 'checked', type: 'checkbox', width: '50px', style: 'text-align:center', sortable: false,
//                 typeinfo : {ignoreupdate : true}
//             },
// 	        {caption: ['품목코드'], 	ref: 'itemCd', width: '100px', type: 'output'},
// 	        {caption: ['품목명'], 	ref: 'itemNm', width: '150px', type: 'output'},
// 	        {caption: ['품종코드'], 	ref: 'vrtyCd', width: '100px', type: 'output'},
// 	        {caption: ['품종명'], 	ref: 'vrtyNm', width: '150px', type: 'output'},
// 	        {caption: ['APC코드'], 	ref: 'apcCd',  hidden : true}

// 	    ];
// 	    window.grdVrty = _SBGrid.create(SBGridProperties);
// 	    fn_selectVrtyList();
// 	}

// 	function fn_modalVrty(){
// 		fn_createVrtyGrid();
// 	}
	
// 	//조회 버튼
// 	async function fn_selectVrtyList(){
// 		fn_callSelectVrtyList();
// 	}

// 	var jsonVrtyPopUp = [];
// 	async function fn_callSelectVrtyList(){
// 		let apcCd 	= gv_apcCd;
// 		let apcNm  = SBUxMethod.get("vrty-inp-apcNm");
// 		let vrtyNm = SBUxMethod.get("vrty-inp-vrtyNm");
		
// 		let postJsonPromise = gfn_postJSON("/am/apc/selectVrtyList.do", {apcNm : apcNm, vrtyNm : vrtyNm} );
// 	    let data = await postJsonPromise;                
// 	    newJsonVrtyPopUp = [];
// 	    jsonVrtyPopUp = [];
	    
// 	    try{
// 	    	data.resultList.forEach((item, index) => {
// 				let vrty = {
// 				    itemCd		: item.itemCd
// 				  , itemNm		: item.itemNm
// 				  , vrtyCd		: item.vrtyCd
// 				  , vrtyNm		: item.vrtyNm
// 				  , apcCd		: item.apcCd
// 				}
// 				jsonVrtyPopUp.push(Object.assign({}, vrty));
// 				newJsonVrtyPopUp.push(Object.assign({}, vrty));
// 			});
// 			grdVrty.rebuild();
// 	    }catch (e) {
// 			if (!(e instanceof Error)) {
// 				e = new Error(e);
// 			}
// 	 		console.error("failed", e.message);
// 	    }
// 	}

const popPrdcr = {
		prgrmId: 'prdcrPopup',
		modalId: 'modal-prdcr',
		gridId: 'grdVrty',
		jsonId: 'jsonVrtyPopUp',
		areaId: "sb-area-grdVrty",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackFnc) {
			console.log("init prdcrPop");
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
			
			if (grdVrty === null || this.prvApcCd != _apcCd) {
				let rst = await Promise.all([
					gfn_setApcItemSBSelect('grdPrdcr', jsonItemCdPop, _apcCd),				// 품목
					gfn_setApcVrtySBSelect('grdPrdcr', jsonItemNmPop, _apcCd),				// 품종
					gfn_setComCdSBSelect('grdPrdcr', jsonVrtyCdPop, 'GDS_SE_CD'),			// 상품구분
					gfn_setComCdSBSelect('grdPrdcr', jsonVrtyNmPop, 'WRHS_SE_CD'),		// 입고구분
					gfn_setComCdSBSelect('grdPrdcr', jsonApcCdPop, 'TRSPRT_SE_CD')	// 운송구분
				]);
				this.createGrid();
				this.search();
			} else {
				this.search();
			}
			
			this.prvApcCd = _apcCd;
		},
		close: function(_prdcr) {
			gfn_closeModal(this.modalId, this.callbackFnc, _prdcr);
		},
		createGrid: function() {
			var SBGridProperties = {};
		    SBGridProperties.parentid = this.areaId;	//'sb-area-grdComAuthUserPop';	//this.sbGridArea;	//'sb-area-grdComAuthUserPop';
		    SBGridProperties.id = this.gridId;			//'grdComAuthUserPop';					//'grdComAuthUserPop';
		    SBGridProperties.jsonref = this.jsonId;		//'jsonComAuthUserPop';		//'jsonComAuthUserPop';
		    SBGridProperties.emptyrecords = '데이터가 없습니다.';
		    SBGridProperties.selectmode = 'byrow';
		    SBGridProperties.explorerbar = 'sortmove';
		    SBGridProperties.extendlastcol = 'scroll';
		    SBGridProperties.oneclickedit = true;
		    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
		    SBGridProperties.columns = [
		    	{caption : ["선택"],
	                ref: 'checked', type: 'checkbox', width: '50px', style: 'text-align:center', sortable: false,
	                typeinfo : {ignoreupdate : true}
	            },
		        {caption: ['품목코드'], 	ref: 'itemCd', width: '100px', type: 'output'},
		        {caption: ['품목명'], 	ref: 'itemNm', width: '150px', type: 'output'},
		        {caption: ['품종코드'], 	ref: 'vrtyCd', width: '100px', type: 'output'},
		        {caption: ['품종명'], 	ref: 'vrtyNm', width: '150px', type: 'output'},
		        {caption: ['APC코드'], 	ref: 'apcCd',  hidden : true}
		    ];
		    grdVrty = _SBGrid.create(SBGridProperties);
		    grdVrty.bind('dblclick', popPrdcr.choice);
		},
		choice: function() {
			let nRow = grdVrty.getRow();
			let rowData = grdVrty.getRowData(nRow);
			popPrdcr.close(rowData);
		},
		search: async function() {
			// set pagination
			grdPrdcrPop.rebuild();
	    	let pageSize = grdPrdcrPop.getPageSize();
	    	let pageNo = 1;
	        
	    	// grid clear
	    	jsonPrdcrPop.length = 0;
	    	grdPrdcrPop.refresh();
	    	//grdPrdcrPop.clearStatus();
	    	this.setGrid(pageSize, pageNo);
		}


</script>
</html>