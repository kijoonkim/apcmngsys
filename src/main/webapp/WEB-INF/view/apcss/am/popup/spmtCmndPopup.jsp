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
						<span style="font-weight:bold;">출하지시를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;"></span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchSpmtCmnd" name="btnSearchSpmtCmnd" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popSpmtCmnd.search"></sbux-button>
					<sbux-button id="btnEndSpmtCmnd" name="btnEndSpmtCmnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-spmtCmnd')"></sbux-button>
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
								<sbux-input id="spmtCmnd-inp-apcCd" name="spmtCmnd-inp-apcCd" uitype="hidden"></sbux-input>
								<sbux-input id="spmtCmnd-inp-apcNm" name="spmtCmnd-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">거래처명</th>
							<th class="td_input">
								<sbux-input id="cnpt-inp-cnptNm" name="cnpt-inp-cnptNm" uitype="text" class="form-control input-sm" onkeyenter="fn_searchCnpt()" maxlength="30"></sbux-input>
							</th>
							<th>&nbsp;</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdSpmtCmnd" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	var jsonCnptPopUp = [];
	const popSpmtCmnd = {
		modalId: 'modal-spmtCmnd',
		gridId: 'grdSpmtCmndPop',
		jsonId: 'jsonSpmtCmndPop',
		areaId: "sb-area-grdSpmtCmnd",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackSelectFnc: function() {},
		init: async function(_apcCd, _apcNm, _spmtCmnd, _callbackChoiceFnc) {
			this.prvApcCd = _apcCd;
			SBUxMethod.set("spmtCmnd-inp-apcNm", _apcNm);

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}
			this.createGrid();
			this.search();

		},
		close: function(_spmtCmnd) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _spmtCmnd);
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
		    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
		    SBGridProperties.columns = [
		    	{caption: ['지시일자'], 	ref: 'cmndYmd', 		width: '80px',	type: 'output',	style:'text-align: center',
	            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	            {caption: ['거래처'], 		ref: 'cnptNm', 			width: '110px',	type: 'output',	style:'text-align: center'},
	            {caption: ['운송회사'], 	ref: 'trsprtCoNm', 		width: '100px',	type: 'output',	style:'text-align: center'},
	            {caption: ['배송처'], 		ref: 'dldtn', 			width: '120px',	type: 'output',	style:'text-align: center'},
	            {caption: ['수량'], 		ref: 'cmndQntt', 		width: '40px',	type: 'output',	style:'text-align: right',
	            	format : {type:'number', rule:'#,###'}},
	            {caption: ['중량'], 		ref: 'cmndWght', 		width: '60px',	type: 'output',	style:'text-align: right',
	            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
	            {caption: ['등급'], 		ref: 'gdsGrdNm', 		width: '50px',	type: 'output',	style:'text-align: center'},
	            {caption: ['포장단위'], 	ref: 'spmtPckgUnitNm', 	width: '140px',	type: 'output',	style:'text-align: center'},
	            {caption: ['품종'], 		ref: 'vrtyNm', 			width: '60px',	type: 'output',	style:'text-align: center'},
	            {caption: ['규격'], 		ref: 'spcfctNm', 		width: '60px',	type: 'output',	style:'text-align: center'},
	            {caption: ['비고'], 		ref: 'rmrk', 			width: '150px',	type: 'output'}
		    ];
		    grdSpmtCmndPop = _SBGrid.create(SBGridProperties);
		    grdSpmtCmndPop.bind('dblclick', popSpmtCmnd.choice);
		},
		choice: function() {
			let nRow = grdSpmtCmndPop.getRow();
			let rowData = grdSpmtCmndPop.getRowData(nRow);
			popSpmtCmnd.close(rowData);
		},

		search: async function() {
			//console.log('search');
			let apcCd = this.prvApcCd;

			grdSpmtCmndPop.rebuild();
	    	let pageSize = grdSpmtCmndPop.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonSpmtCmndPop.length = 0;
	    	grdSpmtCmndPop.refresh();
	    	this.setGrid(pageSize, pageNo);
		},
		setGrid: async function(pageSize, pageNo) {
			jsonSpmtCmndPop = [];

			let apcCd = this.prvApcCd;
			let spmtCmnd = {
					apcCd : apcCd,
					// pagination
			  		pagingYn : 'Y',
					currentPageNo : pageNo,
		 		  	recordCountPerPage : pageSize
			}
			console.log(spmtCmnd);
			let postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtCmndList.do", spmtCmnd);
		    let data = await postJsonPromise;

		    try{
		    	let totalRecordCount = 0;
		    	jsonSpmtCmndPop.length = 0;
		    	data.resultList.forEach((item, index) => {
					let spmtCmnd = {
							spmtCmndno		: item.spmtCmndno
						  ,	cmndYmd 		: item.cmndYmd
						  , cnptCd 			: item.cnptCd
						  , cnptNm 			: item.cnptNm
						  , gdsCd 			: item.gdsCd
						  , gdsNm 			: item.gdsNm
						  , trsprtCoCd 		: item.trsprtCoCd
						  , trsprtCoNm 		: item.trsprtCoNm
						  , dldtn 			: item.dldtn
						  , cmndQntt		: item.cmndQntt
						  , cmndWght 		: item.cmndWght
						  , gdsGrd 			: item.gdsGrd
						  , gdsGrdNm 		: item.gdsGrdNm
						  , spmtPckgUnitCd 	: item.spmtPckgUnitCd
						  , spmtPckgUnitNm 	: item.spmtPckgUnitNm
						  , vrtyNm 			: item.vrtyNm
						  , vrtyCd 			: item.vrtyCd
						  , spcfctCd 		: item.spcfctCd
						  , spcfctNm 		: item.spcfctNm
						  , rmrk			: item.rmrk
						  , itemCd			: item.itemCd
						  , outordrno		: item.outordrno
					}
					jsonSpmtCmndPop.push(spmtCmnd);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

		    	if (jsonSpmtCmndPop.length > 0) {
	        		if(grdSpmtCmndPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdSpmtCmndPop.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdSpmtCmndPop.rebuild();
					}else{
						grdSpmtCmndPop.refresh();
					}
	        	} else {
	        		grdSpmtCmndPop.setPageTotalCount(totalRecordCount);
	        		grdSpmtCmndPop.rebuild();
	        	}

	        	//document.querySelector('#spmtCmnd-pop-cnt').innerText = totalRecordCount;

	        	grdSpmtCmndPop.rebuild();
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