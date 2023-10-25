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
						<span style="font-weight:bold;">선별재고를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;"></span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchSortInvntr" name="btnSearchSortInvntr" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popSortInvntr.search"></sbux-button>
					<sbux-button id="btnChoiceSortInvntr" name="btnChoiceSortInvntr" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popSortInvntr.choice"></sbux-button>
					<sbux-button id="btnEndSortInvntr" name="btnEndSortInvntr" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-sortInvntr')"></sbux-button>
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
								<sbux-input id="sortInvntr-inp-apcCd" name="sortInvntr-inp-apcCd" uitype="hidden"></sbux-input>
								<sbux-input id="sortInvntr-inp-apcNm" name="sortInvntr-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">투입일자</th>
							<th class="td_input">
								<sbux-datepicker id="sortInvntr-dtp-crtrYmd" name="sortInvntr-dtp-crtrYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</th>
							<th scope="row">규격</th>
							<th>
								<sbux-select id="sortInvntr-slt-spcfctCd" name="sortInvntr-slt-spcfctCd" uitype="single" class="form-control input-sm" style="background-color:#FFFFFF;" jsondata-ref="jsonApcSpcfct" unselected-text="전체"></sbux-select>
							</th>
						</tr>
						<tr>
							<th scope="row">품목</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="sortInvntr-slt-itemCd"
									name="sortInvntr-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcItem"
									onchange="popSortInvntr.srchItemCd(this)"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th scope="row">품종</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="sortInvntr-slt-vrtyCd"
									name="sortInvntr-slt-vrtyCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcVrty"
									onchange="popSortInvntr.srchVrtyCd(this)"
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
					<div id="sb-area-grdSortInvntrPop" style="width:100%;height:300px;"></div>
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

	var grdSortInvntrPop = null;
	
	const popSortInvntr = {
		modalId: 'modal-sortInvntr',
		gridId: 'grdSortInvntrPop',
		jsonId: 'jsonSortInvntrPop',
		areaId: "sb-area-grdSortInvntrPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackSelectFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackChoiceFnc) {
			SBUxMethod.set("sortInvntr-inp-apcCd", _apcCd);
			SBUxMethod.set("sortInvntr-inp-apcNm", _apcNm);

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}
			
			if (grdSortInvntrPop === null || this.prvApcCd != _apcCd) {

				SBUxMethod.set("sortInvntr-dtp-crtrYmd", gfn_dateToYmd(new Date()));
				
				let rst = await Promise.all([
				 	gfn_setApcItemSBSelect('sortInvntr-slt-itemCd', jsonApcItem, _apcCd),							// 품목
					gfn_setApcVrtySBSelect('sortInvntr-slt-vrtyCd', jsonApcVrty, _apcCd)							// 품종
				]);
				this.createGrid();
				this.search();
			} else {
				this.search();
			}

			this.prvApcCd = _apcCd;
		},
		close: function(_sortInvntr) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _sortInvntr);
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
		    	{caption: ["선별번호","선별번호"],		ref: 'sortnoIndct',     type:'output',  width:'130px',	style:'text-align:center'},
		        {caption: ["등급","등급"],				ref: 'grdNm',      		type:'output',  width:'90px',	style:'text-align:center'},
		        {caption: ["투입일자","투입일자"],		ref: 'inptYmd',      	type:'output',  width:'105px',	style:'text-align:center',
	            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
		        {caption: ["설비","설비"],				ref: 'fcltNm',      	type:'output',  width:'105px',	style:'text-align:center'},
		        {caption: ["생산자","생산자"],			ref: 'prdcrNm',      	type:'output',  width:'90px',	style:'text-align:center'},
		        {caption: ["품목","품목"],				ref: 'itemNm',     		type:'output',  width:'90px',	style:'text-align:center'},
		        {caption: ["품종","품종"],				ref: 'vrtyNm',      	type:'output',  width:'90px',	style:'text-align:center'},
		        {caption: ["규격","규격"],				ref: 'spcfctNm',      	type:'output',  width:'90px',	style:'text-align:center'},
		        {caption: ["창고","창고"],				ref: 'warehouseSeNm',   type:'output',  width:'90px',	style:'text-align:center'},
		        {caption: ["선별","수량"],				ref: 'sortQntt',      	type:'output',  width:'85px',	style:'text-align:center',
		        	format : {type:'number', rule:'#,###'}},
		        {caption: ["선별","중량"],				ref: 'sortWght',      	type:'output',  width:'85px',	style:'text-align:center',
		        	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
		        {caption: ["포장","수량"],				ref: 'pckgQntt',      	type:'output',  width:'85px',	style:'text-align:center',
			        format : {type:'number', rule:'#,###'}},
		        {caption: ["포장","중량"],				ref: 'pckgWght',     	type:'output',  width:'85px',	style:'text-align:center',
		        	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
		        {caption: ["현 재고","수량"],			ref: 'invntrQntt',      type:'output',  width:'85px',	style:'text-align:center',
			        format : {type:'number', rule:'#,###'}},
		        {caption: ["현 재고","중량"],			ref: 'invntrWght',      type:'output',  width:'85px',	style:'text-align:center',
			        typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
		        {caption: ["비고","비고"],				ref: 'rmrk',      		type:'output',  width:'105px',	style:'text-align:center'}
		    ];
		    grdSortInvntrPop = _SBGrid.create(SBGridProperties);
		    grdSortInvntrPop.bind('afterpagechanged', this.paging);
		    grdSortInvntrPop.bind('dblclick', popSortInvntr.choice);
		},
		choice: function() {
			let nRow = grdSortInvntrPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdSortInvntrPop.getRowData(nRow);
				popSortInvntr.close(rowData);
			}
		},
		search: async function() {
			let apcCd = SBUxMethod.get("sortInvntr-inp-apcCd");

			grdSortInvntrPop.rebuild();
	    	let pageSize = grdSortInvntrPop.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonSortInvntrPop.length = 0;
	    	grdSortInvntrPop.refresh();
	    	this.setGrid(pageSize, pageNo);
		},
		setGrid: async function(pageSize, pageNo) {
			jsonSortInvntrPop = [];

			let apcCd = SBUxMethod.get("sortInvntr-inp-apcCd");
			let crtrYmd = SBUxMethod.get("sortInvntr-dtp-crtrYmd");
			let itemCd = SBUxMethod.get("sortInvntr-slt-itemCd");
			let vrtyCd = SBUxMethod.get("sortInvntr-slt-vrtyCd");
			let spcfctCd = SBUxMethod.get("sortInvntr-slt-spcfctCd");
			let sortInvntr = {
					apcCd 				: apcCd,
					crtrYmd 			: crtrYmd,
					itemCd 				: itemCd,
					vrtyCd 				: vrtyCd,
					spcfctCd 			: spcfctCd,
					// pagination
			  		pagingYn 			: 'Y',
					currentPageNo 		: pageNo,
		 		  	recordCountPerPage	: pageSize
			}
			let postJsonPromise = gfn_postJSON("/am/invntr/selectSortInvntrDsctnList.do", sortInvntr);
		    let data = await postJsonPromise;

		    try{
		    	let totalRecordCount = 0;
		    	jsonSortInvntrPop.length = 0;
		    	data.resultList.forEach((item, index) => {
					let sortInvntr = {
						sortno			: item.sortno,
						sortSn			: item.sortSn,
						sortnoIndct		: item.sortnoIndct,
	       				grdNm			: item.grdNm,
	       				grdCd			: item.grdCd,
	       				inptYmd			: item.inptYmd,
	       				fcltNm			: item.fcltNm,
	       				fcltCd			: item.fcltCd,
	       				prdcrNm			: item.prdcrNm,
	       				prdcrCd			: item.prdcrCd,
	       				itemNm			: item.itemNm,
	       				itemCd			: item.itemCd,
	       				vrtyNm			: item.vrtyNm,
	       				vrtyCd			: item.vrtyCd,
	       				spcfctNm		: item.spcfctNm,
	       				spcfctCd		: item.spcfctCd,
	       				warehouseSeNm	: item.warehouseSeNm,
	       				warehouseSeCd	: item.warehouseSeCd,
	       				sortQntt		: item.sortQntt,
	       				sortWght		: item.sortWght,
	       				pckgQntt		: item.pckgQntt,
	       				pckgWght		: item.pckgWght,
	       				invntrQntt		: item.invntrQntt,
	       				invntrWght		: item.invntrWght,
	       				rmrk			: item.rmrk
					}
					jsonSortInvntrPop.push(sortInvntr);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

		    	if (jsonSortInvntrPop.length > 0) {
	        		if(grdSortInvntrPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdSortInvntrPop.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdSortInvntrPop.rebuild();
					}else{
						grdSortInvntrPop.refresh();
					}
	        	} else {
	        		grdSortInvntrPop.setPageTotalCount(totalRecordCount);
	        		grdSortInvntrPop.rebuild();
	        	}

	        	//document.querySelector('#sortInvntr-pop-cnt').innerText = totalRecordCount;

	        	grdSortInvntrPop.rebuild();
		    }catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
		 		console.error("failed", e.message);
		    }
	    },
		srchItemCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("sortInvntr-inp-apcCd");
			let itemCd = obj.value;

			let result = await Promise.all([
				gfn_setApcVrtySBSelect('sortInvntr-slt-vrtyCd', jsonApcVrty, apcCd, itemCd),					// 품종
				gfn_setApcSpcfctsSBSelect('sortInvntr-slt-spcfctCd', jsonApcSpcfct, apcCd, itemCd)			// 규격
			]);
		},
		srchVrtyCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("sortInvntr-inp-apcCd");
			let vrtyCd = obj.value;
			const itemCd = _.find(jsonApcVrty, {value: vrtyCd}).mastervalue;

			const prvItemCd = SBUxMethod.get("sortInvntr-slt-itemCd");
			if (itemCd != prvItemCd) {
				SBUxMethod.set("sortInvntr-slt-itemCd", itemCd);
				await this.srchItemCd({value: itemCd});
				SBUxMethod.set("sortInvntr-slt-vrtyCd", vrtyCd);
			}
			gfn_setApcSpcfctsSBSelect('sortInvntr-slt-spcfctCd', jsonApcSpcfct, apcCd, itemCd)
		},
	    paging: function() {
	    	let recordCountPerPage = grdSortInvntrPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdSortInvntrPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popSortInvntr.setGrid(recordCountPerPage, currentPageNo);
	    }
	}
</script>
</html>