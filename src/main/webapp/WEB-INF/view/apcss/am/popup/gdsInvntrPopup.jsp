<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 상품재고 선택</title>
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
				<sbux-input id="gdsInvntr-inp-itemCd" name="gdsInvntr-inp-itemCd" uitype="hidden"></sbux-input>
				<sbux-input id="gdsInvntr-inp-vrtyCd" name="gdsInvntr-inp-vrtyCd" uitype="hidden"></sbux-input>
				<sbux-input id="gdsInvntr-inp-spcfctCd" name="gdsInvntr-inp-spcfctCd" uitype="hidden"></sbux-input>
				<sbux-input id="gdsInvntr-inp-gdsGrd" name="gdsInvntr-inp-gdsGrd" uitype="hidden"></sbux-input>
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

	var grdGdsInvntrPop = null;
	
	var spmtGdsList = [];
	
	const popGdsInvntr = {
		modalId: 'modal-gdsInvntr',
		gridId: 'grdGdsInvntrPop',
		jsonId: 'jsonGdsInvntrPop',
		areaId: "sb-area-grdGdsInvntrPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackSelectFnc: function() {},
		init: async function(_apcCd, _apcNm, _gdsInvntr, _callbackChoiceFnc) {
			SBUxMethod.set("gdsInvntr-inp-apcCd", _apcCd);
			SBUxMethod.set("gdsInvntr-inp-apcNm", _apcNm);
			if(!gfn_isEmpty(_gdsInvntr)){
				SBUxMethod.set("gdsInvntr-inp-itemCd", _gdsInvntr.itemCd);
				SBUxMethod.set("gdsInvntr-inp-vrtyCd", _gdsInvntr.vrtyCd);
				SBUxMethod.set("gdsInvntr-inp-spcfctCd", _gdsInvntr.spcfctCd);
				SBUxMethod.set("gdsInvntr-inp-gdsGrd", _gdsInvntr.gdsGrd);
				spmtGdsList = _gdsInvntr.spmtGdsList;
			}

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}
			
			if (grdGdsInvntrPop === null || this.prvApcCd != _apcCd) {

				SBUxMethod.set("gdsInvntr-dtp-crtrYmd", gfn_dateToYmd(new Date()));
				
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
		        {caption: ["포장순번"],		ref: 'pckgSn', 			hidden: true},
		        {caption: ["총재고수량"],		ref: 'totalInvntrQntt', hidden: true},
		        {caption: ["총재고중량"],		ref: 'totalInvntrWght', hidden: true}
		    ];
		    grdGdsInvntrPop = _SBGrid.create(SBGridProperties);
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

	    	// grid clear
	    	jsonGdsInvntrPop.length = 0;
	    	grdGdsInvntrPop.refresh();
	    	this.setGrid();
		},
		setGrid: async function() {
			jsonGdsInvntrPop = [];

			let apcCd = SBUxMethod.get("gdsInvntr-inp-apcCd");
			let crtrYmd = SBUxMethod.get("gdsInvntr-dtp-crtrYmd");
			let itemCd = SBUxMethod.get("gdsInvntr-inp-itemCd");
			let vrtyCd = SBUxMethod.get("gdsInvntr-inp-vrtyCd");
			let spcfctCd = SBUxMethod.get("gdsInvntr-inp-spcfctCd");
			let gdsGrd = SBUxMethod.get("gdsInvntr-inp-gdsGrd");
			let gdsInvntr = {
					apcCd 				: apcCd,
					crtrYmd 			: crtrYmd,
					itemCd 				: itemCd,
					vrtyCd 				: vrtyCd,
					spcfctCd 			: spcfctCd,
					gdsGrd 				: gdsGrd
			}
			let postJsonPromise = gfn_postJSON("/am/invntr/selectGdsInvntrList.do", gdsInvntr);
		    let data = await postJsonPromise;

		    try{
		    	jsonGdsInvntrPop.length = 0;
		    	data.resultList.forEach((item, index) => {
		    		
		    		spmtGdsQntt = 0;
		    		spmtGdsWght = 0;
		    		
		    		if (!gfn_isEmpty(spmtGdsList)) {
		    			for (let i=0; i<spmtGdsList.length; i++) {
		    				if (spmtGdsList[i].pckgnoIndct == item.pckgnoIndct) {
		    		    		spmtGdsQntt = spmtGdsList[i].spmtQntt;
		    		    		spmtGdsWght = spmtGdsList[i].spmtWght;
		    				}
		    			}
		    		}
		    		
		    		if (item.invntrQntt > spmtGdsQntt) {
						let gdsInvntr = {
								pckgnoIndct			: item.pckgnoIndct,
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
			       				invntrQntt			: item.invntrQntt - spmtGdsQntt,
			       				invntrWght			: item.invntrWght - spmtGdsWght,
			       				rmrk				: item.rmrk,
			       				prdcrNm				: item.prdcrNm,
			       				gdsSeNm				: item.gdsSeNm,
			       				spmtPckgUnitNm		: item.spmtPckgUnitNm,
			       				gdsSeCd				: item.gdsSeCd,
			       				spmtPckgUnitCd		: item.spmtPckgUnitCd,
			       				brndNm				: item.brndNm
						}
						jsonGdsInvntrPop.push(gdsInvntr);
		    		}
				});
        		grdGdsInvntrPop.rebuild();
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