<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>title : 선별지시번호 선택</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">선별지시번호를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;"></span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearchSortCmndno" name="btnSearchSortCmndno" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="popSortCmndno.search"></sbux-button>
					<sbux-button id="btnChoiceSortCmndno" name="btnChoiceSortCmndno" uitype="normal" text="선택" class="btn btn-sm btn-outline-danger" onclick="popSortCmndno.choice"></sbux-button>
					<sbux-button id="btnEndSortCmndno" name="btnEndSortCmndno" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger" onclick="gfn_closeModal('modal-sortCmndno')"></sbux-button>
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
						<col style="width: 4%">
						<col style="width: 4%">
						<col style="width: 4%">
						<col style="width: 24%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<th>
								<sbux-input id="sortCmndno-inp-apcCd" name="sortCmndno-inp-apcCd" uitype="hidden"></sbux-input>
								<sbux-input id="sortCmndno-inp-apcNm" name="sortCmndno-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">지시일자</th>
							<th colspan="2" class="td_input">
								<sbux-datepicker
									id="sortCmndno-dtp-sortCmndYmdFrom"
									name="sortCmndno-dtp-sortCmndYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc"
									onchange="popSortCmndno.chkYmdFrom"
								></sbux-datepicker>
							</th>
							<th>~</th>
							<th colspan="2" class="td_input">
								<sbux-datepicker
									id="sortCmndno-dtp-sortCmndYmdTo"
									name="sortCmndno-dtp-sortCmndYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc"
									onchange="popSortCmndno.chkYmdTo"
								></sbux-datepicker>
							</th>
						</tr>
						<tr>
							<th scope="row">품목</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="sortCmndno-slt-itemCd"
									name="sortCmndno-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonSortCmndnoPopApcItem"
									onchange="popSortCmndno.srchItemCd(this)"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th scope="row">품종</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="sortCmndno-slt-vrtyCd"
									name="sortCmndno-slt-vrtyCd"
									class="form-control input-sm"
									jsondata-ref="jsonSortCmndnoPopApcVrty"
									onchange="popSortCmndno.srchVrtyCd(this)"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th colspan="3" scope="row">규격</th>
							<th>
								<sbux-select
									id="sortCmndno-slt-spcfctCd"
									name="sortCmndno-slt-spcfctCd"
									uitype="single"
									class="form-control input-sm"
									style="background-color:#FFFFFF;"
									jsondata-ref="jsonSortCmndnoPopApcSpcfct"
									unselected-text="전체"
								></sbux-select>
							</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div id="sb-area-grdSortCmndnoPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	/* grid 내 select json */
	var jsonSortCmndnoPopApcItem	= [];	// 품목 		itemCd			검색
	var jsonSortCmndnoPopApcVrty	= [];	// 품종 		vrtyCd			검색
	var jsonSortCmndnoPopApcSpcfct	= [];	// 규격 		spcfct			검색

	var grdSortCmndnoPop = null;

	const popSortCmndno = {
		modalId: 'modal-sortCmndno',
		gridId: 'grdSortCmndnoPop',
		jsonId: 'jsonSortCmndnoPop',
		areaId: "sb-area-grdSortCmndnoPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackSelectFnc: function() {},
		init: async function(_apcCd, _apcNm, _callbackChoiceFnc) {
			SBUxMethod.set("sortCmndno-inp-apcCd", _apcCd);
			SBUxMethod.set("sortCmndno-inp-apcNm", _apcNm);

			SBUxMethod.set("sortCmndno-dtp-sortCmndYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("sortCmndno-dtp-sortCmndYmdTo", gfn_dateToYmd(new Date()));

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}

			if (grdSortCmndnoPop === null || this.prvApcCd != _apcCd) {


				let rst = await Promise.all([
				 	gfn_setApcItemSBSelect('sortCmndno-slt-itemCd', jsonSortCmndnoPopApcItem, _apcCd),							// 품목
					gfn_setApcVrtySBSelect('sortCmndno-slt-vrtyCd', jsonSortCmndnoPopApcVrty, _apcCd)							// 품종
				]);
				this.createGrid();
				this.search();
			} else {
				this.search();
			}

			this.prvApcCd = _apcCd;
		},
		close: function(_sortCmndno) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _sortCmndno);
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
		        {caption: ["지시번호","지시번호"],		ref: 'sortCmndnoIndct', type:'output',  width:'130px',	style:'text-align:center'},
		        {caption: ["지시일자","지시일자"], 		ref: 'sortCmndYmd',     type:'output',  width:'100px',	style:'text-align:center',
		        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
		        {caption: ["생산자","생산자"],  		ref: 'prdcrNm',    		type:'output',  width:'100px',	style:'text-align:center'},
		        {caption: ["품종","품종"],  			ref: 'vrtyNm',    		type:'output',  width:'100px',	style:'text-align:center'},
		        {caption: ["창고","창고"],  			ref: 'warehouseSeNm',	type:'output',  width:'100px',	style:'text-align:center'},
		        {caption: ["설비","설비"],  			ref: 'fcltNm',    		type:'output',  width:'100px',	style:'text-align:center'},
		        {caption: ["팔레트번호","팔레트번호"],	ref: 'pltno',    		type:'output',  width:'150px',	style:'text-align:center'},
		        {caption: ["선별지시","수량"],  		ref: 'cmndQntt',    	type:'output',  width:'60px',	style:'text-align:right',
		        	format : {type:'number', rule:'#,###'}},
		        {caption: ["선별지시","중량"],  		ref: 'cmndWght',    	type:'output',  width:'70px',	style:'text-align:right',
		        	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
		        {caption: ["투입실적","수량"],  		ref: 'inptQntt',    	type:'output',  width:'60px',	style:'text-align:right',
		        	format : {type:'number', rule:'#,###'}},
		        {caption: ["투입실적","중량"],  		ref: 'inptWght',    	type:'output',  width:'70px',	style:'text-align:right',
		        	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
		        {caption: ["비고","비고"],  			ref: 'rmrk',    		type:'output',  width:'250px',	style:'text-align:center'},
            	{caption: ["재고수량"],		ref: 'invntrQntt', 			type:'output',  hidden: true},
            	{caption: ["재고중량"],		ref: 'invntrWght', 			type:'output',  hidden: true},
            	{caption: ["입고일자"],		ref: 'wrhsYmd', 			type:'output',  hidden: true},
            	{caption: ["박스종류"],		ref: 'bxKnd', 			type:'output',  hidden: true},
            	{caption: ["박스종류명"],	ref: 'bxKndNm', 			type:'output',  hidden: true},
            	{caption: ["등급코드"],	ref: 'grdCd', 			type:'output',  hidden: true},
            	{caption: ["등급명"],	ref: 'grdNm', 			type:'output',  hidden: true},
            	{caption: ["입고번호"],	ref: 'wrhsno', 			type:'output',  hidden: true},
		    ];
		    grdSortCmndnoPop = _SBGrid.create(SBGridProperties);
		    grdSortCmndnoPop.bind('dblclick', popSortCmndno.choice);
		},
		choice: function() {
			let nRow = grdSortCmndnoPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdSortCmndnoPop.getRowData(nRow);
				popSortCmndno.close(rowData);
			}
		},
		search: async function() {
			grdSortCmndnoPop.rebuild();

	    	// grid clear
	    	jsonSortCmndnoPop.length = 0;
	    	grdSortCmndnoPop.refresh();
	    	this.setGrid();
		},
		setGrid: async function() {
			jsonSortCmndnoPop = [];

			let apcCd = SBUxMethod.get("sortCmndno-inp-apcCd");
			let sortCmndYmdFrom = SBUxMethod.get("sortCmndno-dtp-sortCmndYmdFrom");
			let sortCmndYmdTo = SBUxMethod.get("sortCmndno-dtp-sortCmndYmdTo");
			let itemCd = SBUxMethod.get("sortCmndno-slt-itemCd");
			let vrtyCd = SBUxMethod.get("sortCmndno-slt-vrtyCd");
			let spcfctCd = SBUxMethod.get("sortCmndno-slt-spcfctCd");
			let sortCmndno = {
					apcCd 				: apcCd,
					sortCmndYmdFrom		: sortCmndYmdFrom,
					sortCmndYmdTo		: sortCmndYmdTo,

					itemCd 				: itemCd,
					vrtyCd 				: vrtyCd,
					spcfctCd 			: spcfctCd
			}
			let postJsonPromise = gfn_postJSON("/am/sort/selectSortCmndList.do", sortCmndno);
		    let data = await postJsonPromise;

		    try{
		    	jsonSortCmndnoPop.length = 0;
		    	data.resultList.forEach((item, index) => {
					let sortCmndno = {
  						sortCmndno		: item.sortCmndno,
  						sortCmndSn		: item.sortCmndSn,
  						sortCmndnoIndct	: item.sortCmndnoIndct,
  						sortCmndYmd 	: item.sortCmndYmd,
  						fcltCd 			: item.fcltCd,
  						fcltNm 			: item.fcltNm,
  						pltno			: item.pltno,
  						wrhsno			: item.wrhsno,
  						prdcrCd			: item.prdcrCd,
  						itemCd			: item.itemCd,
  						vrtyCd			: item.vrtyCd,
  						warehouseSeCd	: item.warehouseSeCd,
  						prdcrNm			: item.prdcrNm,
  						itemNm			: item.itemNm,
  						vrtyNm			: item.vrtyNm,
  						warehouseSeNm	: item.warehouseSeNm,
  						cmndQntt		: item.cmndQntt,
  						cmndWght		: item.cmndWght,
  						inptQntt		: item.inptQntt,
  						inptWght		: item.inptWght,
  						invntrQntt		: item.invntrQntt,
  						invntrWght		: item.invntrWght,
  						wrhsYmd			: item.wrhsYmd,
  						bxKnd			: item.bxKnd,
  						bxKndNm			: item.bxKndNm,
  						grdCd			: item.grdCd,
  						grdNm			: item.grdNm,
  						rmrk 			: item.rmrk
					}
					jsonSortCmndnoPop.push(sortCmndno);
				});
	        	grdSortCmndnoPop.rebuild();
		    }catch (e) {
				if (!(e instanceof Error)) {
					e = new Error(e);
				}
		 		console.error("failed", e.message);
		    }
	    },
		srchItemCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("sortCmndno-inp-apcCd");
			let itemCd = obj.value;

			let result = await Promise.all([
				gfn_setApcVrtySBSelect('sortCmndno-slt-vrtyCd', jsonSortCmndnoPopApcVrty, apcCd, itemCd),					// 품종
				gfn_setApcSpcfctsSBSelect('sortCmndno-slt-spcfctCd', jsonSortCmndnoPopApcSpcfct, apcCd, itemCd)			// 규격
			]);
		},
		srchVrtyCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("sortCmndno-inp-apcCd");
			let vrtyCd = obj.value;

			if (gfn_isEmpty(vrtyCd)) {
				return;
			}
			const itemCd = _.find(jsonApcVrty, {value: vrtyCd}).mastervalue;

			const prvItemCd = SBUxMethod.get("sortCmndno-slt-itemCd");
			if (itemCd != prvItemCd) {
				SBUxMethod.set("sortCmndno-slt-itemCd", itemCd);
				await this.srchItemCd({value: itemCd});
				SBUxMethod.set("sortCmndno-slt-vrtyCd", vrtyCd);
			}
		},
		chkYmdFrom: function() {
			let ymdFrom = SBUxMethod.get("sortCmndno-dtp-sortCmndYmdFrom");
	 		let ymdTo = SBUxMethod.get("sortCmndno-dtp-sortCmndYmdTo");
	 		if(gfn_diffDate(ymdFrom, ymdTo) < 0){
	 			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
	 			SBUxMethod.set("sortCmndno-dtp-sortCmndYmdFrom", gfn_dateToYmd(new Date()));
	 			SBUxMethod.set("sortCmndno-dtp-sortCmndYmdTo", gfn_dateToYmd(new Date()));
	 			return;
	 		}
		},
		chkYmdTo: function() {
			let ymdFrom = SBUxMethod.get("sortCmndno-dtp-sortCmndYmdFrom");
	 		let ymdTo = SBUxMethod.get("sortCmndno-dtp-sortCmndYmdTo");
	 		if(gfn_diffDate(ymdFrom, ymdTo) < 0){
	 			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
	 			SBUxMethod.set("sortCmndno-dtp-sortCmndYmdFrom", gfn_dateToYmd(new Date()));
	 			SBUxMethod.set("sortCmndno-dtp-sortCmndYmdTo", gfn_dateToYmd(new Date()));
	 			return;
	 		}
		}
	}
</script>
</html>