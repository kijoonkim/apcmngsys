<%
 /**
  * @Class Name : rawMtrInvntrPopup.jsp
  * @Description : 원물재고 선택 Popup 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	김호			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 원물재고 선택</title>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;">원물재고를 선택합니다.</span>
					</p>
					<p>
						<span style="color:black; font-weight:bold;"></span>
					</p>
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="rawMtrInvntr-btn-search"
						name="rawMtrInvntr-btn-search"
						uitype="normal"
						text="조회"
						class="btn btn-sm btn-outline-danger"
						onclick="popRawMtrInvntr.search"
					></sbux-button>
					<sbux-button
						id="rawMtrInvntr-btn-choice"
						name="rawMtrInvntr-btn-choice"
						uitype="normal"
						text="선택"
						class="btn btn-sm btn-outline-danger"
						onclick="popRawMtrInvntr.choice"
					></sbux-button>
					<sbux-button
						id="rawMtrInvntr-btn-close"
						name="rawMtrInvntr-btn-close"
						uitype="normal"
						text="종료"
						class="btn btn-sm btn-outline-danger"
						onclick="popRawMtrInvntr.close"
					></sbux-button>
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
								<sbux-input id="rawMtrInvntr-inp-apcCd" name="rawMtrInvntr-inp-apcCd" uitype="hidden"></sbux-input>
								<sbux-input id="rawMtrInvntr-inp-apcNm" name="rawMtrInvntr-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</th>
							<th scope="row">입고일자</th>
							<th colspan="2" class="td_input">
								<sbux-datepicker
									id="rawMtrInvntr-dtp-wrhsYmdFrom"
									name="rawMtrInvntr-dtp-wrhsYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc"
									onchange="popRawMtrInvntr.dtpChange"
								></sbux-datepicker>
							</th>
							<th>~</th>
							<th colspan="2" class="td_input">
								<sbux-datepicker
									id="rawMtrInvntr-dtp-wrhsYmdTo"
									name="rawMtrInvntr-dtp-wrhsYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc"
									onchange="popRawMtrInvntr.dtpChange"
								></sbux-datepicker>
							</th>
						</tr>
						<tr>
							<th scope="row">품목</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="rawMtrInvntr-slt-itemCd"
									name="rawMtrInvntr-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcItemRawMtrInvntrPop"
									onchange="popRawMtrInvntr.onChangedItemCd(this)"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th scope="row">품종</th>
							<th>
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="rawMtrInvntr-slt-vrtyCd"
									name="rawMtrInvntr-slt-vrtyCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcVrtyRawMtrInvntrPop"
									onchange="popRawMtrInvntr.onChangedVrtyCd(this)"
									style="background-color:#FFFFFF;"
								/>
							</th>
							<th colspan="3" scope="row">규격</th>
							<th>
								<sbux-select
									id="rawMtrInvntr-slt-spcfctCd"
									name="rawMtrInvntr-slt-spcfctCd"
									uitype="single"
									class="form-control input-sm"
									style="background-color:#FFFFFF;"
									jsondata-ref="jsonApcSpcfctRawMtrInvntrPop"
									unselected-text="전체"
								></sbux-select>
							</th>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_section_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li>
								<span>원물재고 내역</span>
								<span style="font-size:12px">(조회건수 <span id="rawMtrInvntr-pop-cnt">0</span>건)</span>
							</li>
						</ul>
					</div>
					<div id="sb-area-grdRawMtrInvntrPop" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	/* grid 내 select json */
	var jsonApcItemRawMtrInvntrPop		= [];	// 품목 		itemCd			검색
	var jsonApcVrtyRawMtrInvntrPop		= [];	// 품종 		vrtyCd			검색
	var jsonApcSpcfctRawMtrInvntrPop	= [];	// 규격 		spcfct			검색

	var grdRawMtrInvntrPop = null;

	const popRawMtrInvntr = {
		modalId: 'modal-rawMtrInvntr',
		gridId: 'grdRawMtrInvntrPop',
		jsonId: 'jsonRawMtrInvntrPop',
		areaId: "sb-area-grdRawMtrInvntrPop",
		prvApcCd: "",
		objGrid: null,
		gridJson: [],
		callbackSelectFnc: function() {},
		init: async function(_param, _callbackChoiceFnc) {

			SBUxMethod.set("rawMtrInvntr-inp-apcCd", _param.apcCd);
			SBUxMethod.set("rawMtrInvntr-inp-apcNm", _param.apcNm);

			let frstYmd = gfn_dateFirstYmd(new Date());
			let nowYmd = gfn_dateToYmd(new Date());
			SBUxMethod.set("rawMtrInvntr-dtp-wrhsYmdFrom", frstYmd);
			SBUxMethod.set("rawMtrInvntr-dtp-wrhsYmdTo", nowYmd);

			if (!gfn_isEmpty(_callbackChoiceFnc) && typeof _callbackChoiceFnc === 'function') {
				this.callbackSelectFnc = _callbackChoiceFnc;
			}

			if (grdRawMtrInvntrPop === null || this.prvApcCd != _param.apcCd) {

				let rst = await Promise.all([
				 	gfn_setApcItemSBSelect('rawMtrInvntr-slt-itemCd', jsonApcItemRawMtrInvntrPop, _param.apcCd),							// 품목
					gfn_setApcVrtySBSelect('rawMtrInvntr-slt-vrtyCd', jsonApcVrtyRawMtrInvntrPop, _param.apcCd)							// 품종
				]);

				this.createGrid();
				this.search();
			} else {
				this.search();
			}

			this.prvApcCd = _param.apcCd;
		},
		close: function(_rawMtrInvntr) {
			gfn_closeModal(this.modalId, this.callbackSelectFnc, _rawMtrInvntr);
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
		        {caption: ["팔레트번호","팔레트번호"],	ref: 'pltno',      		type:'output',  width:'130px',   style:'text-align:center'},
		        {caption: ["입고일자","입고일자"],		ref: 'wrhsYmd',      	type:'output',  width:'90px',    style:'text-align:center',
	            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
		        {caption: ["생산자","생산자"],			ref: 'prdcrNm',      	type:'output',  width:'90px',    style:'text-align:center'},
		        {caption: ["품목","품목"],				ref: 'itemNm',      	type:'output',  width:'90px',    style:'text-align:center'},
		        {caption: ["품종","품종"],				ref: 'vrtyNm',      	type:'output',  width:'90px',    style:'text-align:center'},
		        {caption: ["상품","상품"],				ref: 'gdsSeNm',      	type:'output',  width:'90px',    style:'text-align:center'},
		        {caption: ["입고","입고"],				ref: 'wrhsSeNm',      	type:'output',  width:'90px',    style:'text-align:center'},
		        {caption: ["운송","운송"],				ref: 'trsprtSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
		        {caption: ["창고","창고"],				ref: 'warehouseSeNm',   type:'output',  width:'90px',    style:'text-align:center'},
		        {caption: ["입고","수량"],				ref: 'wrhsQntt',      	type:'output',  width:'60px',    style:'text-align:center',
		        	format : {type:'number', rule:'#,###'}},
		        {caption: ["입고","중량 (Kg)"],		ref: 'wrhsWght',      	type:'output',  width:'70px',    style:'text-align:center',
		        	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		        {caption: ["투입","수량"],				ref: 'inptQntt',      	type:'output',  width:'60px',    style:'text-align:center',
			        format : {type:'number', rule:'#,###'}},
		        {caption: ["투입","중량 (Kg)"],		ref: 'inptWght',      	type:'output',  width:'70px',    style:'text-align:center',
		        	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		        {caption: ["현 재고","수량"],			ref: 'invntrQntt',      type:'output',  width:'60px',    style:'text-align:center',
			        format : {type:'number', rule:'#,###'}},
		        {caption: ["현 재고","중량 (Kg)"],		ref: 'invntrWght',      type:'output',  width:'70px',    style:'text-align:center',
		        	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
		        {caption: ["비고","비고"],			ref: 'rmrk',      		type:'output',  width:'250px',   style:'text-align:center'},
			    {caption: ["입고번호"], ref: 'wrhsno',		type:'output', 	hidden: true},
			    {caption: ["지시번호"], ref: 'sortCmndno',	type:'output', 	hidden: true},
			    {caption: ["박스종류코드"], ref: 'bxKnd',	type:'output', 	hidden: true},
			    {caption: ["박스종류명"], ref: 'bxKndNm',	type:'output', 	hidden: true},
			    {caption: ["생산자코드"], ref: 'prdcrCd',	type:'output', 	hidden: true},
			    {caption: ["등급"], ref: 'grdCd',	type:'output', 	hidden: true},
			    {caption: ["등급명"], ref: 'grdNm',	type:'output', 	hidden: true},
		    ];
		    grdRawMtrInvntrPop = _SBGrid.create(SBGridProperties);
		    grdRawMtrInvntrPop.bind('dblclick', this.choice);
		},
		choice: function() {
			let nRow = grdRawMtrInvntrPop.getRow();
			if (nRow == -1) {
				gfn_comAlert("W0003", "선택");		//	W0003	{0}할 대상이 없습니다.
				return;
			} else {
				let rowData = grdRawMtrInvntrPop.getRowData(nRow);
				popRawMtrInvntr.close(rowData);
			}
		},
		search: async function() {
			grdRawMtrInvntrPop.rebuild();

	    	// grid clear
	    	jsonRawMtrInvntrPop.length = 0;
	    	grdRawMtrInvntrPop.refresh();
	    	this.setGrid();
		},
		setGrid: async function() {
			jsonRawMtrInvntrPop = [];

			let apcCd = SBUxMethod.get("rawMtrInvntr-inp-apcCd");
			let wrhsYmdFrom = SBUxMethod.get("rawMtrInvntr-dtp-wrhsYmdFrom");
			let wrhsYmdTo = SBUxMethod.get("rawMtrInvntr-dtp-wrhsYmdTo");
			let itemCd = SBUxMethod.get("rawMtrInvntr-slt-itemCd");
			let vrtyCd = SBUxMethod.get("rawMtrInvntr-slt-vrtyCd");
			let spcfctCd = SBUxMethod.get("rawMtrInvntr-slt-spcfctCd");

			let rawMtrInvntr = {
					apcCd: apcCd,
					wrhsYmdFrom: wrhsYmdFrom,
					wrhsYmdTo: wrhsYmdTo,
					itemCd: itemCd,
					vrtyCd: vrtyCd,
					spcfctCd: spcfctCd
			}

			let postJsonPromise = gfn_postJSON("/am/invntr/selectRawMtrInvntrList.do", rawMtrInvntr);
		    let data = await postJsonPromise;
		    try{
		    	jsonRawMtrInvntrPop.length = 0;
		    	data.resultList.forEach((item, index) => {
					let rawMtrInvntr = {
						wrhsno			: item.wrhsno,
	       				pltno			: item.pltno,
	       				wrhsYmd			: item.wrhsYmd,
	       				prdcrNm			: item.prdcrNm,
	       				itemNm			: item.itemNm,
	       				vrtyNm			: item.vrtyNm,
	       				gdsSeNm			: item.gdsSeNm,
	       				wrhsSeNm		: item.wrhsSeNm,
	       				trsprtSeNm		: item.trsprtSeNm,
	       				warehouseSeNm	: item.warehouseSeNm,
	       				prdcrCd			: item.prdcrCd,
	       				itemCd			: item.itemCd,
	       				vrtyCd			: item.vrtyCd,
	       				gdsSeCd			: item.gdsSeCd,
	       				wrhsSeCd		: item.wrhsSeCd,
	       				trsprtSeCd		: item.trsprtSeCd,
	       				warehouseSeCd	: item.warehouseSeCd,
	       				bxKndNm			: item.bxKndNm,
	       				bxKnd			: item.bxKnd,
	       				grdNm			: item.grdNm,
	       				grdCd			: item.grdCd,
	       				wrhsQntt		: item.wrhsQntt,
	       				wrhsWght		: item.wrhsWght,
	       				cmndQntt		: item.cmndQntt,
	       				cmndWght		: item.cmndWght,
	       				invntrCmndQntt	: item.invntrCmndQntt,
	       				invntrCmndWght	: item.invntrCmndWght,
	       				inptQntt		: item.inptQntt,
	       				inptWght		: item.inptWght,
	       				invntrQntt		: item.invntrQntt,
	       				invntrWght		: item.invntrWght,
	       				sortcmndNo		: item.sortcmndNo,
	       				fcltNm			: item.fcltNm,
	       				fcltCd			: item.fcltCd,
	       				rmrk			: item.rmrk
					}
					jsonRawMtrInvntrPop.push(rawMtrInvntr);
				});
	        	document.querySelector('#rawMtrInvntr-pop-cnt').innerText = jsonRawMtrInvntrPop.length;
	        	grdRawMtrInvntrPop.rebuild();

		    } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		    }
	    },
		onChangedItemCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("rawMtrInvntr-inp-apcCd");
			let itemCd = obj.value;

			let result = await Promise.all([
				gfn_setApcVrtySBSelect('rawMtrInvntr-slt-vrtyCd', jsonApcVrtyRawMtrInvntrPop, apcCd, itemCd),					// 품종
				gfn_setApcSpcfctsSBSelect('rawMtrInvntr-slt-spcfctCd', jsonApcSpcfctRawMtrInvntrPop, apcCd, itemCd)			// 규격
			]);
		},
		onChangedVrtyCd: async function(obj) {
	    	let apcCd = SBUxMethod.get("rawMtrInvntr-inp-apcCd");
			let vrtyCd = obj.value;

			if (gfn_isEmpty(vrtyCd)) {
				return;
			}

			const itemCd = _.find(jsonApcVrtyRawMtrInvntrPop, {value: vrtyCd}).mastervalue;

			const prvItemCd = SBUxMethod.get("rawMtrInvntr-slt-itemCd");
			if (itemCd != prvItemCd) {
				SBUxMethod.set("rawMtrInvntr-slt-itemCd", itemCd);
				await this.srchItemCd({value: itemCd});
				SBUxMethod.set("rawMtrInvntr-slt-vrtyCd", vrtyCd);
			}
		},
		dtpChange : function(){
			let wrhsYmdFrom = SBUxMethod.get("rawMtrInvntr-dtp-wrhsYmdFrom");
			let wrhsYmdTo = SBUxMethod.get("rawMtrInvntr-dtp-wrhsYmdTo");
			if(gfn_diffDate(wrhsYmdFrom, wrhsYmdTo) < 0){
				gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다."); //W0001{0}
				SBUxMethod.set("rawMtrInvntr-dtp-wrhsYmdFrom", gfn_dateFirstYmd(new Date()));
				SBUxMethod.set("rawMtrInvntr-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
				return;
			}
		}
	}
</script>
</html>