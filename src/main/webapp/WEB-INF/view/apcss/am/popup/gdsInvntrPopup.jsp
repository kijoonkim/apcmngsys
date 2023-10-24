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
						<span style="font-weight:bold;">상품재고를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;"></span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchGdsInvntr" name="btnSearchGdsInvntr" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popGdsInvntr.search"></sbux-button>
					<sbux-button id="btnChoiceGdsInvntr" name="btnChoiceGdsInvntr" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popGdsInvntr.choice"></sbux-button>
					<sbux-button id="btnEndGdsInvntr" name="btnEndGdsInvntr" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-gdsInvntr')"></sbux-button>
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
								<sbux-input id="gdsInvntr-inp-apcCd" name="gdsInvntr-inp-apcCd" uitype="hidden"></sbux-input>
								<sbux-input id="gdsInvntr-inp-apcNm" name="gdsInvntr-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">투입일자</th>
							<th class="td_input">
								<sbux-datepicker id="gdsInvntr-dtp-crtrYmd" name="gdsInvntr-dtp-crtrYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</th>
							<th scope="row">규격</th>
							<th>
								<sbux-select id="gdsInvntr-slt-spcfctCd" name="gdsInvntr-slt-spcfctCd" uitype="single" class="form-control input-sm" style="background-color:#FFFFFF;" jsondata-ref="jsonApcSpcfct" unselected-text="전체"></sbux-select>
							</th>
						</tr>
						<tr>
							<th scope="row">품목</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="gdsInvntr-slt-itemCd"
									name="gdsInvntr-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcItem"
									onchange="popGdsInvntr.srchItemCd(this)"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th scope="row">품종</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="gdsInvntr-slt-vrtyCd"
									name="gdsInvntr-slt-vrtyCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcVrty"
									onchange="popGdsInvntr.srchVrtyCd(this)"
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
					<div id="sb-area-grdGdsInvntrPop" style="width:100%;height:300px;"></div>
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

	var grdGdsInvntrPop = null;
	
	const popGdsInvntr = {
		modalId: 'modal-gdsInvntr',
		gridId: 'grdGdsInvntrPop',
		jsonId: 'jsonGdsInvntrPop',
		areaId: "sb-area-grdGdsInvntrPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackSelectFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackChoiceFnc) {
			SBUxMethod.set("gdsInvntr-inp-apcCd", _apcCd);
			SBUxMethod.set("gdsInvntr-inp-apcNm", _apcNm);

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}
			
			if (grdGdsInvntrPop === null || this.prvApcCd != _apcCd) {

				SBUxMethod.set("gdsInvntr-dtp-crtrYmd", gfn_dateToYmd(new Date()));
				
				let rst = await Promise.all([
				 	gfn_setApcItemSBSelect('gdsInvntr-slt-itemCd', jsonApcItem, _apcCd),							// 품목
					gfn_setApcVrtySBSelect('gdsInvntr-slt-vrtyCd', jsonApcVrty, _apcCd)							// 품종
				]);
				this.createGrid();
				this.search();
			} else {
				this.search();
			}

			this.prvApcCd = _apcCd;
		},
		close: function(_gdsInvntr) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _gdsInvntr);
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
		    	{caption: ["포장번호","포장번호"],		ref: 'pckgno',      	type:'output',  width:'130px',   style:'text-align:center'},
		        {caption: ["순번","순번"],				ref: 'pckgSn',      	type:'output',  width:'55px',    style:'text-align:center'},
		        {caption: ["포장일자","포장일자"],		ref: 'pckgYmd',      	type:'output',  width:'105px',   style:'text-align:center',
	            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
		        {caption: ["설비","설비"],				ref: 'fcltNm',      	type:'output',  width:'105px',   style:'text-align:center'},
		        {caption: ["생산자","생산자"],			ref: 'prdcrNm',      	type:'output',  width:'90px',    style:'text-align:center'},
		        {caption: ["품목","품목"],				ref: 'itemNm',      	type:'output',  width:'90px',    style:'text-align:center'},
		        {caption: ["품종","품종"],				ref: 'vrtyNm',      	type:'output',  width:'90px',    style:'text-align:center'},
		        {caption: ["규격","규격"],				ref: 'spcfctNm',      	type:'output',  width:'90px',    style:'text-align:center'},
		        {caption: ["등급","등급"],				ref: 'gdsGrdNm',      	type:'output',  width:'90px',    style:'text-align:center'},
		        {caption: ["창고","창고"],				ref: 'warehouseSeNm',   type:'output',  width:'105px',   style:'text-align:center'},
		        {caption: ["포장","수량"],				ref: 'pckgQntt',      	type:'output',  width:'60px',    style:'text-align:center',
		        	format : {type:'number', rule:'#,###'}},
		        {caption: ["포장","중량"],				ref: 'pckgWght',      	type:'output',  width:'70px',    style:'text-align:center',
		        	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
		        {caption: ["출하","수량"],				ref: 'spmtQntt',      	type:'output',  width:'60px',    style:'text-align:center',
			        format : {type:'number', rule:'#,###'}},
		        {caption: ["출하","중량"],				ref: 'spmtWght',      	type:'output',  width:'70px',    style:'text-align:center',
			        typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
		        {caption: ["현 재고","수량"],			ref: 'invntrQntt',      type:'output',  width:'60px',    style:'text-align:center',
			        format : {type:'number', rule:'#,###'}},
		        {caption: ["현 재고","중량"],			ref: 'invntrWght',      type:'output',  width:'70px',    style:'text-align:center',
			        typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
		        {caption: ["비고","비고"],				ref: 'rmrk',      		type:'output',  width:'250px',   style:'text-align:center'}
		    ];
		    grdGdsInvntrPop = _SBGrid.create(SBGridProperties);
		    grdGdsInvntrPop.bind('afterpagechanged', this.paging);
		    grdGdsInvntrPop.bind('dblclick', popGdsInvntr.choice);
		},
		choice: function() {
			let nRow = grdGdsInvntrPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdGdsInvntrPop.getRowData(nRow);
				popGdsInvntr.close(rowData);
			}
		},
		search: async function() {
			let apcCd = SBUxMethod.get("gdsInvntr-inp-apcCd");

			grdGdsInvntrPop.rebuild();
	    	let pageSize = grdGdsInvntrPop.getPageSize();
	    	let pageNo = 1;

	    	// grid clear
	    	jsonGdsInvntrPop.length = 0;
	    	grdGdsInvntrPop.refresh();
	    	this.setGrid(pageSize, pageNo);
		},
		setGrid: async function(pageSize, pageNo) {
			jsonGdsInvntrPop = [];

			let apcCd = SBUxMethod.get("gdsInvntr-inp-apcCd");
			let crtrYmd = SBUxMethod.get("gdsInvntr-dtp-crtrYmd");
			let itemCd = SBUxMethod.get("gdsInvntr-slt-itemCd");
			let vrtyCd = SBUxMethod.get("gdsInvntr-slt-vrtyCd");
			let spcfctCd = SBUxMethod.get("gdsInvntr-slt-spcfctCd");
			let gdsInvntr = {
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
			let postJsonPromise = gfn_postJSON("/am/invntr/selectGdsInvntrList.do", gdsInvntr);
		    let data = await postJsonPromise;

		    try{
		    	let totalRecordCount = 0;
		    	jsonGdsInvntrPop.length = 0;
		    	data.resultList.forEach((item, index) => {
					let gdsInvntr = {
							pckgno				: item.pckgno,
		       				pckgSn				: item.pckgSn,
		       				pckgYmd				: item.pckgYmd,
		       				fcltNm				: item.fcltNm,
		        			rprsPrdcrNm			: item.rprsPrdcrNm,
		       				itemNm				: item.itemNm,
		       				vrtyNm				: item.vrtyNm,
		       				spcfctNm			: item.spcfctNm,
		       				gdsGrdNm			: item.gdsGrdNm,
		       				warehouseSeNm		: item.warehouseSeNm,
		       				fcltCd				: item.fcltCd,
		        			rprsPrdcrCd			: item.rprsPrdcrCd,
		       				itemCd				: item.itemCd,
		       				vrtyCd				: item.vrtyCd,
		       				spcfctCd			: item.spcfctCd,
		       				gdsGrdCd			: item.gdsGrdCd,
		       				warehouseSeCd		: item.warehouseSeCd,
		       				pckgQntt			: item.pckgQntt,
		       				pckgWght			: item.pckgWght,
		       				spmtQntt			: item.spmtQntt,
		       				spmtWght			: item.spmtWght,
		       				invntrQntt			: item.invntrQntt,
		       				invntrWght			: item.invntrWght,
		       				rmrk				: item.rmrk,
		       				prdcrNm				: item.prdcrNm,
		       				gdsSeNm				: item.gdsSeNm,
		       				spmtPckgUnitNm		: item.spmtPckgUnitNm,
		       				gdsSeCd				: item.gdsSeCd,
		       				spmtPckgUnitCd		: item.spmtPckgUnitCd,
		       				brndNm				: item.brndNm
					}
					jsonGdsInvntrPop.push(gdsInvntr);

					if (index === 0) {
						totalRecordCount = item.totalRecordCount;
					}
				});

		    	if (jsonGdsInvntrPop.length > 0) {
	        		if(grdGdsInvntrPop.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	        			grdGdsInvntrPop.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	        			grdGdsInvntrPop.rebuild();
					}else{
						grdGdsInvntrPop.refresh();
					}
	        	} else {
	        		grdGdsInvntrPop.setPageTotalCount(totalRecordCount);
	        		grdGdsInvntrPop.rebuild();
	        	}

	        	//document.querySelector('#gdsInvntr-pop-cnt').innerText = totalRecordCount;

	        	grdGdsInvntrPop.rebuild();
		    }catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
		 		console.error("failed", e.message);
		    }
	    },
		srchItemCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("gdsInvntr-inp-apcCd");
			let itemCd = obj.value;

			let result = await Promise.all([
				gfn_setApcVrtySBSelect('gdsInvntr-slt-vrtyCd', jsonApcVrty, apcCd, itemCd),					// 품종
				gfn_setApcSpcfctsSBSelect('gdsInvntr-slt-spcfctCd', jsonApcSpcfct, apcCd, itemCd)			// 규격
			]);
		},
		srchVrtyCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("gdsInvntr-inp-apcCd");
			let vrtyCd = obj.value;
			const itemCd = _.find(jsonApcVrty, {value: vrtyCd}).mastervalue;

			const prvItemCd = SBUxMethod.get("gdsInvntr-slt-itemCd");
			if (itemCd != prvItemCd) {
				SBUxMethod.set("gdsInvntr-slt-itemCd", itemCd);
				await this.srchItemCd({value: itemCd});
				SBUxMethod.set("gdsInvntr-slt-vrtyCd", vrtyCd);
			}
			gfn_setApcSpcfctsSBSelect('gdsInvntr-slt-spcfctCd', jsonApcSpcfct, apcCd, itemCd)
		},
	    paging: function() {
	    	let recordCountPerPage = grdGdsInvntrPop.getPageSize();   		// 몇개의 데이터를 가져올지 설정
	    	let currentPageNo = grdGdsInvntrPop.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정

	    	popGdsInvntr.setGrid(recordCountPerPage, currentPageNo);
	    }
	}
</script>
</html>