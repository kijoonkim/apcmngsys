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
						<span style="font-weight:bold;">포장번호를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;"></span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchPckgno" name="btnSearchPckgno" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popPckgno.search"></sbux-button>
					<sbux-button id="btnChoicePckgno" name="btnChoicePckgno" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popPckgno.choice"></sbux-button>
					<sbux-button id="btnEndPckgno" name="btnEndPckgno" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-pckgno')"></sbux-button>
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
						<col style="width: 12%">
						<col style="width: 24%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="pckgno-inp-apcCd" name="pckgno-inp-apcCd" uitype="hidden"></sbux-input>
								<sbux-input id="pckgno-inp-apcNm" name="pckgno-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">포장일자</th>
							<th class="td_input">
								<sbux-datepicker id="pckgno-dtp-pckgYmd" name="pckgno-dtp-pckgYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</th>
							<th scope="row">규격</th>
							<th>
								<sbux-select id="pckgno-slt-spcfctCd" name="pckgno-slt-spcfctCd" uitype="single" class="form-control input-sm" style="background-color:#FFFFFF;" jsondata-ref="jsonApcSpcfct" unselected-text="전체"></sbux-select>
							</th>
						</tr>
						<tr>
							<th scope="row">품목</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="pckgno-slt-itemCd"
									name="pckgno-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcItem"
									onchange="popPckgno.srchItemCd(this)"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th scope="row">품종</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="pckgno-slt-vrtyCd"
									name="pckgno-slt-vrtyCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcVrty"
									onchange="popPckgno.srchVrtyCd(this)"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th></th>
							<th></th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdPckgnoPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	/* grid 내 select json */
	var jsonApcItem			= [];	// 품목 		itemCd			검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd			검색
	var jsonApcSpcfct		= [];	// 규격 		spcfct			검색

	var grdPckgnoPop = null;
	
	const popPckgno = {
		modalId: 'modal-pckgno',
		gridId: 'grdPckgnoPop',
		jsonId: 'jsonPckgnoPop',
		areaId: "sb-area-grdPckgnoPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackSelectFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackChoiceFnc) {
			SBUxMethod.set("pckgno-inp-apcCd", _apcCd);
			SBUxMethod.set("pckgno-inp-apcNm", _apcNm);

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}
			
			if (grdPckgnoPop === null || this.prvApcCd != _apcCd) {

				SBUxMethod.set("pckgno-dtp-pckgYmd", gfn_dateToYmd(new Date()));
				
				let rst = await Promise.all([
				 	gfn_setApcItemSBSelect('pckgno-slt-itemCd', jsonApcItem, _apcCd),							// 품목
					gfn_setApcVrtySBSelect('pckgno-slt-vrtyCd', jsonApcVrty, _apcCd)							// 품종
				]);
				this.createGrid();
				this.search();
			} else {
				this.search();
			}

			this.prvApcCd = _apcCd;
		},
		close: function(_pckgno) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _pckgno);
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
		    SBGridProperties.allowcopy = true;
		    SBGridProperties.scrollbubbling = false;
		    SBGridProperties.dblclickeventarea = {fixed: false, empty: false};
		    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
		    SBGridProperties.columns = [
	            {caption: ["포장일자"], 		ref: 'pckgYmd', 		width: '100px', type: 'output', style:'text-align:center',
	            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        	{caption: ["포장번호"],		ref: 'pckgnoIndct',     width: '120px',	type: 'output',	style: 'text-align:center'},
	            {caption: ['품목'], 			ref: 'itemNm', 			width: '80px',	type: 'output', style:'text-align:center'},
	            {caption: ['품종'], 			ref: 'vrtyNm', 			width: '80px', 	type: 'output', style:'text-align:center'},
	            {caption: ['규격'], 			ref: 'spcfctNm', 		width: '80px', 	type: 'output', style:'text-align:center'},
	            {caption: ['상품등급'], 		ref: 'gdsGrdNm', 		width: '80px',	type: 'output', style:'text-align:center'},
	            {caption: ['재고수량'], 		ref: 'invntrQntt', 		width: '60px', 	type: 'output', style:'text-align:right',
	            	format : {type:'number', rule:'#,###'}},
	            {caption: ['재고중량'], 		ref: 'invntrWght', 		width: '70px', 	type: 'output', style:'text-align:right',
	            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### kg'}},
	            {caption: ['창고'], 			ref: 'warehouseSeNm', 	width: '100px', type: 'output', style:'text-align:center'},
	            {caption: ['비고'], 			ref: 'rmrk', 			width: '250px', type: 'output', style:'text-align:center'},
		        {caption: ["포장번호"],		ref: 'pckgno', 			hidden: true},
		        {caption: ["포장순번"],		ref: 'pckgSn', 			hidden: true}
		    ];
		    grdPckgnoPop = _SBGrid.create(SBGridProperties);
		    grdPckgnoPop.bind('afterpagechanged', this.paging);
		    grdPckgnoPop.bind('dblclick', popPckgno.choice);
		},
		choice: function() {
			let nRow = grdPckgnoPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdPckgnoPop.getRowData(nRow);
				popPckgno.close(rowData);
			}
		},
		search: async function() {
			let apcCd = SBUxMethod.get("pckgno-inp-apcCd");

			grdPckgnoPop.rebuild();
	    	let pageSize = grdPckgnoPop.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonPckgnoPop.length = 0;
	    	grdPckgnoPop.refresh();
	    	this.setGrid(pageSize, pageNo);
		},
		setGrid: async function(pageSize, pageNo) {
			jsonPckgnoPop = [];

			let apcCd = SBUxMethod.get("pckgno-inp-apcCd");
			let pckgYmd = SBUxMethod.get("pckgno-dtp-pckgYmd");
			let itemCd = SBUxMethod.get("pckgno-slt-itemCd");
			let vrtyCd = SBUxMethod.get("pckgno-slt-vrtyCd");
			let spcfctCd = SBUxMethod.get("pckgno-slt-spcfctCd");
			let pckgno = {
					apcCd 				: apcCd,
					pckgYmd 			: pckgYmd,
					itemCd 				: itemCd,
					vrtyCd 				: vrtyCd,
					spcfctCd 			: spcfctCd,
					// pagination
			  		pagingYn 			: 'Y',
					currentPageNo 		: pageNo,
		 		  	recordCountPerPage	: pageSize
			}
			let postJsonPromise = gfn_postJSON("/am/pckg/selectPckgPrfmnc.do", pckgno);
		    let data = await postJsonPromise;

		    try{
		    	let totalRecordCount = 0;
		    	jsonPckgnoPop.length = 0;
		    	data.resultList.forEach((item, index) => {
					let pckgno = {
	          			pckgno: 			item.pckgno,
	          			pckgSn: 			item.pckgSn,
	          			pckgnoIndct:		item.pckgnoIndct,
	          			pckgCmndno:			item.pckgCmndno,
	          			pckgYmd: 			item.pckgYmd,
	          			fcltCd: 			item.fcltCd,
	          			fcltNm: 			item.fcltNm,
	          			rprsPrdcrCd: 		item.rprsPrdcrCd,
	          			rprsPrdcrNm: 		item.rprsPrdcrNm,
	          			itemCd: 			item.itemCd,
	          			itemNm: 			item.itemNm,
	          			vrtyCd: 			item.vrtyCd,
	          			vrtyNm: 			item.vrtyNm,
	          			spcfctCd: 			item.spcfctCd,
	          			spcfctNm: 			item.spcfctNm,
	          			gdsGrd: 			item.gdsGrd,
	          			gdsGrdNm: 			item.gdsGrdNm,
	          			gdsSeCd: 			item.gdsSeCd,
	          			gdsSeNm: 			item.gdsSeNm,
	          			prdctnYr: 			item.prdctnYr,
	          			spmtPckgUnitCd: 	item.spmtPckgUnitCd,
	          			spmtPckgUnitNm: 	item.spmtPckgUnitNm,
	          			warehouseSeCd: 		item.warehouseSeCd,
	          			warehouseSeNm: 		item.warehouseSeNm,
	          			pckgQntt: 			item.pckgQntt,
	          			pckgWght: 			item.pckgWght,
	          			spmtQntt: 			item.spmtQntt,
	          			spmtWght: 			item.spmtWght,
	          			invntrQntt: 		item.invntrQntt,
	          			invntrWght: 		item.invntrWght,
	          			plorCd: 			item.plorCd
					}
					jsonPckgnoPop.push(pckgno);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

		    	if (jsonPckgnoPop.length > 0) {
	        		if(grdPckgnoPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdPckgnoPop.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdPckgnoPop.rebuild();
					}else{
						grdPckgnoPop.refresh();
					}
	        	} else {
	        		grdPckgnoPop.setPageTotalCount(totalRecordCount);
	        		grdPckgnoPop.rebuild();
	        	}

	        	//document.querySelector('#pckgno-pop-cnt').innerText = totalRecordCount;

	        	grdPckgnoPop.rebuild();
		    }catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
		 		console.error("failed", e.message);
		    }
	    },
		srchItemCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("pckgno-inp-apcCd");
			let itemCd = obj.value;

			let result = await Promise.all([
				gfn_setApcVrtySBSelect('pckgno-slt-vrtyCd', jsonApcVrty, apcCd, itemCd),					// 품종
				gfn_setApcSpcfctsSBSelect('pckgno-slt-spcfctCd', jsonApcSpcfct, apcCd, itemCd)			// 규격
			]);
		},
		srchVrtyCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("pckgno-inp-apcCd");
			let vrtyCd = obj.value;
			const itemCd = _.find(jsonApcVrty, {value: vrtyCd}).mastervalue;

			const prvItemCd = SBUxMethod.get("pckgno-slt-itemCd");
			if (itemCd != prvItemCd) {
				SBUxMethod.set("pckgno-slt-itemCd", itemCd);
				await this.srchItemCd({value: itemCd});
				SBUxMethod.set("pckgno-slt-vrtyCd", vrtyCd);
			}
			gfn_setApcSpcfctsSBSelect('pckgno-slt-spcfctCd', jsonApcSpcfct, apcCd, itemCd)
		},
	    paging: function() {
	    	let recordCountPerPage = grdPckgnoPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdPckgnoPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popPckgno.setGrid(recordCountPerPage, currentPageNo);
	    }
	}
</script>
</html>