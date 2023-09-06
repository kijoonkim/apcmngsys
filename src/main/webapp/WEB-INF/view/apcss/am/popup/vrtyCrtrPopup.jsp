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
						<sbux-button id="btnSearchVrty" name="btnSearchVrty" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popVrty.search">조회</sbux-button>
						<sbux-button id="btnChoiceVrty" name="btnChoiceVrty" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popVrty.select">선택</sbux-button>
						<sbux-button id="btnEndVrty" name="btnEndVrty" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="popVrty.close">종료</sbux-button>
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
								<sbux-input id="vrty-inp-vrtyNm" name="vrty-inp-vrtyNm" uitype="text" class="form-control input-sm" maxlength="30"></sbux-input>
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


	var jsonVrtyPopUp = [];
	var callbackChoiceFnc = function(){};
	
	const popVrty = {
// 		prgrmId: 'prdcrPopup',
		modalId: 'modal-vrty',
		gridId: 'grdVrty',
		jsonId: 'jsonVrtyPopUp',
		areaId: "sb-area-grdVrty",
		prvApcCd: "",
		callbackSelectFnc: function() {},
		itemNm: "",
		apcCd: "",
		init: async function(_apcCd, _apcNm, _itemNm, _callbackChoiceFnc, _callbackSelectFnc) {
			//console.log("init prdcrPop");
			// set param
			SBUxMethod.set("vrty-inp-apcNm", _apcNm);
			this.apcCd = _apcCd;
			this.itemNm = _itemNm;
			
				console.log("Test1",callbackChoiceFnc);
			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				callbackChoiceFnc = _callbackChoiceFnc;	
				console.log("Test1",callbackChoiceFnc);
			}
			if (!gfn_isEmpty(_callbackSelectFnc) && typeof _callbackSelectFnc === 'function') {
				this.callbackSelectFnc = _callbackSelectFnc;
			}

			this.createGrid();
			this.search();
			this.prvApcCd = _apcCd;
			//console.log("init prdcrPop123456789");
		},
		close: function(_callbackFnc, _data) {
			console.log(_callbackFnc);
			console.log(_data);
			gfn_closeModal(this.modalId, _callbackFnc, _data);
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
		    SBGridProperties.scrollbubbling = false;
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
		        {caption: ['품목코드'], 	ref: 'itemCd', width: '100px', type: 'output', style:'text-align:center'},
		        {caption: ['품목명'], 	ref: 'itemNm', width: '150px', type: 'output', style:'text-align:center'},
		        {caption: ['품종코드'], 	ref: 'vrtyCd', width: '100px', type: 'output', style:'text-align:center'},
		        {caption: ['품종명'], 	ref: 'vrtyNm', width: '150px', type: 'output', style:'text-align:center'},
		        {caption: ['APC코드'], 	ref: 'apcCd',  hidden : true}
		    ];
		    grdVrty = _SBGrid.create(SBGridProperties);
		    grdVrty.bind('dblclick', popVrty.choice);
		},
		choice: function() {
			console.log(callbackChoiceFnc);
			let nRow = grdVrty.getRow();
			let rowData = grdVrty.getRowData(nRow);
			popVrty.close(callbackChoiceFnc, rowData);
		},
		select: function() {
			var data = [];
			for(var i=0; i<jsonVrtyPopUp.length; i++){
				if(jsonVrtyPopUp[i].checked == 'true')
					data.push(jsonVrtyPopUp[i]);
			}
			popVrty.close(this.callbackSelectFnc, data);
		},
		
		search: async function() {
			let apcCd = this.apcCd;
			let itemNm = this.itemNm;
			this.setGrid(itemNm, apcCd);
		},
		setGrid: async function(itemNm, apcCd) {
			jsonVrtyPopUp = [];
	    	let apcNm = SBUxMethod.get("vrty-inp-apcNm");
			let vrtyNm = SBUxMethod.get("vrty-inp-vrtyNm");
			console.log('vrtyNm',vrtyNm);
			let postJsonPromise = gfn_postJSON("/am/apc/selectVrtyList.do", { apcCd: apcCd, vrtyNm: vrtyNm, itemNm: itemNm });
		    let data = await postJsonPromise;                
		    
		    try{
		    	data.resultList.forEach((item, index) => {
					let vrty = {
						  itemCd : item.itemCd
						, itemNm : item.itemNm
						, vrtyCd : item.vrtyCd
						, vrtyNm : item.vrtyNm
					}
					jsonVrtyPopUp.push(vrty);
				});
		    	grdVrty.rebuild();
		    }catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
		 		console.error("failed", e.message);
		    }
	    }
	}

</script>
</html>