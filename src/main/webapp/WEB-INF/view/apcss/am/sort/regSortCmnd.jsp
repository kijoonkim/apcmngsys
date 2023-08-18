<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmdFrom" name="srch-dtp-wrhsYmdFrom" class="form-control pull-right input-sm input-sm-ast">
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmdTo" name="srch-dtp-wrhsYmdTo" class="form-control pull-right input-sm input-sm-ast">
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm input-sm-ast" unselected-text="전체" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택" jsondata-ref="jsonComVrty"></sbux-select>
							</td>
							<td>&nbsp;</td>
						    <th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 기능입니다."
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>투입대상 내역</span></li>
					</ul>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="sb-area-grdRawMtrInvntr" style="height:260px;"></div>
					</div>
				</div>
				<br/>
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 9%">
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 9%">
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 9%">
					</colgroup>
					<tr>
						<th scope="row" class="th_bg"><span class="data_required"></span>지시일자</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-datepicker uitype="popup" id="srch-dtp-cmndYmd" name="srch-dtp-cmndYmd" class="form-control pull-right input-sm input-sm-ast" class="form-control pull-right input-sm"/>
						</td>
						<td>&nbsp;</td>
						<th scope="row" class="th_bg"><span class="data_required"></span>투입설비</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-select uitype="single" id="srch-slt-inptFclt" name="srch-slt-inptFclt" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택" jsondata-ref="jsonComFclt"></sbux-select>
						</td>
						<td colspan="4">&nbsp;</td>
					</tr>
				</table>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li><span>선별지시 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
						<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
					</div>
				</div>
                <div class="sbt-wrap-body">
                    <div class="sbt-grid">
                        <div id="sb-area-grdSortCmnd" style="height:238px;"></div>
                    </div>
               	</div>
			</div>
		</div>
	</section>

    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var jsonComItem			= [];	// 품목 		itemCd		검색
	var jsonComVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouseSeCd	검색
	var jsonComFclt			= [];	// 설비 		fcltCd		검색

    var jsonDataPrdcr = [];
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('srch-slt-inptFclt', 		jsonComFclt, 		'FCLT_CD', gv_selectedApcCd),			// 설비
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, gv_selectedApcCd),		// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_selectedApcCd)		// 품종
		]);
	}

	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_selectedApcCd, itemCd);		// 품종
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createRawMtrInvntr();
		fn_createSortCmnd();
		SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-cmndYmd", gfn_dateToYmd(new Date()));
		fn_initSBSelect();
		fn_getPrdcrs();
	});

	var jsonRawMtrInvntr = []; // 그리드의 참조 데이터 주소 선언

	const fn_createRawMtrInvntr = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdRawMtrInvntr';
		SBGridProperties.id = 'grdRawMtrInvntr';
		SBGridProperties.jsonref = 'jsonRawMtrInvntr';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
			{caption : ["선택","선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
        	{caption: ["입고일자","입고일자"],		ref: 'wrhsYmd',			type:'output',  width:'120px', style: 'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["팔레트번호","팔레트번호"], 	ref: 'pltno',     		type:'output',  width:'120px', style: 'text-align:center'},
            {caption: ["생산자","생산자"],    	ref: 'prdcrNm',     	type:'output',  width:'80px', style: 'text-align:center'},
            {caption: ["품종","품종"],	    	ref: 'vrtyNm',   		type:'output',  width:'100px', style: 'text-align:center'},
            {caption: ["창고","창고"],	    	ref: 'warehouseSeNm', 	type:'output',  width:'120px', style: 'text-align:center'},

            {caption: ["입고","수량"],  		ref: 'wrhsQntt',   		type:'output',  width:'80px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["입고","중량"],  		ref: 'wrhsWght',   		type:'output',  width:'80px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["재고","수량"],  		ref: 'invntrCmndQntt', 		type:'output',  width:'80px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["재고","중량"],  		ref: 'invntrCmndWght', 		type:'output',  width:'80px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["지시","수량"], 			ref: 'cmndQntt',  		type:'input',  width:'80px', style: 'text-align:right; background:#FFF8DC;', typeinfo: {mask : {alias : '#', repeat: '*', unmaskvalue : true}}, format : {type:'number', rule:'#,###'}},
            {caption: ["지시","중량"], 			ref: 'cmndWght',  		type:'input',  width:'80px', style: 'text-align:right; background:#FFF8DC;', typeinfo: {mask : {alias : '#', repeat: '*', unmaskvalue : true}}, format : {type:'number', rule:'#,###'}},
            {caption: ["선별지시 비고","선별지시 비고"],	    	ref: 'rmrk', 			type:'input',  width:'120px', style: 'text-align:center'},

 	        {caption: ["생산자코드"],	ref: 'prdcrCd',   	type:'output',  hidden: true},
	        {caption: ["품목코드"],		ref: 'itemCd',   	type:'output',  hidden: true},
	        {caption: ["품종코드"],		ref: 'vrtyCd',   	type:'output',  hidden: true},
	        {caption: ["상품구분코드"],	ref: 'gdsSeCd',   	type:'output',  hidden: true},
	        {caption: ["입고구분코드"],	ref: 'wrhsSeCd',   	type:'output',  hidden: true},
	        {caption: ["운송구분코드"],	ref: 'trsprtSeCd', 	type:'output',  hidden: true},
	        {caption: ["창고구분코드"],	ref: 'warehouseSeCd', 	type:'output',	hidden: true},
	        {caption: ["등급코드"],		ref: 'grdCd',   	type:'output',  hidden: true},
	        {caption: ["박스종류코드"],	ref: 'bxKnd',   	type:'output',  hidden: true},
	        {caption: ["입고번호"],		ref: 'wrhsno', 		type:'output',  hidden: true},
	        {caption: ["입고구분명"],	ref: 'wrhsSeNm', 	type:'output',  hidden: true},
	        {caption: ["운송구분명"],	ref: 'trsprtSeNm', 	type:'output',  hidden: true},
	        {caption: ["박스종류명"],	ref: 'bxKndNm', 	type:'output',  hidden: true},
	        {caption: ["설비코드"],		ref: 'fcltCd', 		type:'output',  hidden: true},
	        {caption: ["지시일자"],		ref: 'sortCmndYmd', type:'output',  hidden: true},
	        {caption: ["APC코드"],		ref: 'apcCd',	 	type:'output',  hidden: true}

    	];
		grdRawMtrInvntr = _SBGrid.create(SBGridProperties);
		grdRawMtrInvntr.bind('valuechanged', fn_grdCmndQnttValueChanged);
		grdRawMtrInvntr.bind('select','fn_setValue');
		grdRawMtrInvntr.bind('deselect','fn_delValue');
	}

	var jsonSortCmnd = []; // 그리드의 참조 데이터 주소 선언

	function fn_createSortCmnd() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSortCmnd';
	    SBGridProperties.id = 'grdSortCmnd';
	    SBGridProperties.jsonref = 'jsonSortCmnd';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["선택","선택"],				ref: 'checkedYn',      type:'checkbox',  width:'50px',    style:'text-align:center'},
	        {caption: ["지시번호","지시번호"], 		ref: 'sortCmndno',     	type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["지시일자","지시일자"],  	ref: 'sortCmndYmd',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["투입설비","투입설비"],  	ref: 'fcltNm',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],  		ref: 'prdcrNm',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["품종","품종"],  			ref: 'vrtyNm',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["창고","창고"],  			ref: 'warehouseSeNm',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["팔레트번호","팔레트번호"],  ref: 'pltno',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["지시","수량"],  			ref: 'cmndQntt',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["지시","중량"],  			ref: 'cmndWght',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["비고","비고"],  			ref: 'rmrk',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["APC코드"],  		ref: 'apcCd',    hidden:true},
	        {caption: ["순번"],  			ref: 'sortCmndSn',    hidden:true},
	    ];

	    grdSortCmnd = _SBGrid.create(SBGridProperties);
	}

	const fn_search = async function(){
		let flag = true;
		flag = await fn_setGrdRawMtrInvntr();
		if(flag){
			await fn_setGrdSortCmnd();
		}
	}

	/**
     * @name fn_setGrdRawMtrInvntr
     * @description 입고내역 조회
     * @param {number} pageSize
     * @param {number} pageNo
    */

	const fn_setGrdRawMtrInvntr = async function() {

		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");		// 입고일자from
		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");			// 입고일자to
   		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");				// 생산자
   		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");	// 창고

  		let itemCd = SBUxMethod.get("srch-slt-itemCd");					// 품목
  		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");					// 품종

  		if (gfn_isEmpty(wrhsYmdFrom)) {
  			await gfn_comAlert("W0001", "입고시작일자");		//	W0002	{0}을/를 선택하세요.
            return false;
  		}
  		if (gfn_isEmpty(wrhsYmdTo)) {
  			await gfn_comAlert("W0001", "입고종료일자");		//	W0002	{0}을/를 선택하세요.
            return false;
  		}

  		if (gfn_isEmpty(vrtyCd)) {
  			await gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
            return false;
  		}


		const postJsonPromise = gfn_postJSON("/am/invntr/selectRawMtrInvntrList.do", {
			apcCd: gv_selectedApcCd,
			wrhsYmdFrom: wrhsYmdFrom,
			wrhsYmdTo: wrhsYmdTo,
			prdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			warehouseSeCd:warehouseSeCd
  		});
        const data = await postJsonPromise;

  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonRawMtrInvntr.length = 0;
          	data.resultList.forEach((item, index) => {
				if(item.invntrCmndWght > 0){
	          		const rawMtrInvntr = {
	  						rowSeq: item.rowSeq,
	  						apcCd: item.apcCd,
	  						wrhsno: item.wrhsno,
	  						pltno: item.pltno,
	  						wrhsYmd: item.wrhsYmd,
	  						prdcrCd: item.prdcrCd,
	  						itemCd: item.itemCd,
	  						vrtyCd: item.vrtyCd,
	  						gdsSeCd: item.gdsSeCd,
	  						wrhsSeCd: item.wrhsSeCd,
	  						trsprtSeCd: item.trsprtSeCd,
	  						warehouseSeCd: item.warehouseSeCd,
	  						bxKnd: item.bxKnd,
	  						grdCd: item.grdCd,
	  						wrhsQntt: item.wrhsQntt,
	  						wrhsWght: item.wrhsWght,
	  						inptQntt: item.inptQntt,
	  						inptWght: item.inptWght,
	  						invntrQntt: item.invntrQntt,
	  						invntrWght: item.invntrWght,
	  						apcNm: item.apcNm,
	  						prdcrNm: item.prdcrNm,
	  						itemNm: item.itemNm,
	  						vrtyNm: item.vrtyNm,
	  						grdNm: item.grdNm,
	  						warehouseSeNm: item.warehouseSeNm,
	  						gdsSeNm: item.gdsSeNm,
	  						wrhsSeNm: item.wrhsSeNm,
	  						trsprtSeNm: item.trsprtSeNm,
	  						bxKndNm: item.bxKndNm,
	  						grdNm: item.grdNm,
	  						sortCmndno: item.sortCmndno,
	  						invntrCmndQntt : item.invntrCmndQntt,
	  						invntrCmndWght : item.invntrCmndWght
	  				}
					jsonRawMtrInvntr.push(rawMtrInvntr);
				}
  			});
			grdRawMtrInvntr.refresh();


		}catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}

			console.error("failed", e.message);
		}
		return true;
	}

    const fn_onChangeApc = async function() {

		fn_clearPrdcr();
		fn_initSBSelect();
		fn_getPrdcrs();
	}

    const fn_grdCmndQnttValueChanged = async function(){

    	var nRow = grdRawMtrInvntr.getRow();
		var nCol = grdRawMtrInvntr.getCol();


		switch (nCol) {
		case 10:	// checkbox
			fn_checkInptQntt();
			break;
		case 11:
			//check qntt
			fn_checkInptWght();
			break;
		default:
			return;
		}
    }

    const fn_setValue = async function(){
    	var nRow = grdRawMtrInvntr.getRow();
    	let invntrQntt = grdRawMtrInvntr.getRowData(nRow).invntrCmndQntt;
		let invntrWght = grdRawMtrInvntr.getRowData(nRow).invntrCmndWght;
		let cmndQntt = grdRawMtrInvntr.getRowData(nRow).cmndQntt;
		let cmndWght = grdRawMtrInvntr.getRowData(nRow).cmndWght;


		if((cmndQntt == 0 && cmndWght == 0) || (gfn_isEmpty(cmndQntt) && gfn_isEmpty(cmndWght))){
	    	grdRawMtrInvntr.setCellData(nRow, 10, invntrQntt);
			grdRawMtrInvntr.setCellData(nRow, 11, invntrWght);
		}
    }

    const fn_delValue = async function(){
    	var nRow = grdRawMtrInvntr.getRow();
    	grdRawMtrInvntr.setCellData(nRow, 10, 0);
		grdRawMtrInvntr.setCellData(nRow, 11, 0);
    }

    const fn_checkInptWght = async function(){

    	var nRow = grdRawMtrInvntr.getRow();
		var nCol = grdRawMtrInvntr.getCol();

		let invntrQntt = grdRawMtrInvntr.getRowData(nRow).invntrCmndQntt;
		let invntrWght = grdRawMtrInvntr.getRowData(nRow).invntrCmndWght;
		let cmndWght = grdRawMtrInvntr.getRowData(nRow).cmndWght;

		if(invntrWght - cmndWght < 0){
			gfn_comAlert("W0008", "재고중량", "지시중량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdRawMtrInvntr.setCellData(nRow, nCol , 0);
            return;
		}
		if(invntrWght == cmndWght && invntrQntt > 0){
			grdRawMtrInvntr.setCellData(nRow, 10, invntrQntt);
		}

		if(invntrWght % cmndWght == 0){
			grdRawMtrInvntr.setCellData(nRow, 10, (cmndWght / invntrWght * invntrQntt));
		}

		if(cmndWght > 0){
			grdRawMtrInvntr.setCellData(nRow, 0, "Y")
		}else{
			grdRawMtrInvntr.setCellData(nRow, 0, "N")
		}
    }

    const fn_checkInptQntt = async function(){

    	var nRow = grdRawMtrInvntr.getRow();
		var nCol = grdRawMtrInvntr.getCol();

		let invntrQntt = grdRawMtrInvntr.getRowData(nRow).invntrCmndQntt;
		let invntrWght = grdRawMtrInvntr.getRowData(nRow).invntrCmndWght;
		let cmndQntt = grdRawMtrInvntr.getRowData(nRow).cmndQntt;

		if(invntrQntt - cmndQntt < 0){
			gfn_comAlert("W0008", "재고수량", "지시수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdRawMtrInvntr.setCellData(nRow, nCol , 0);
            return;
		}
		if(invntrQntt > 0 && cmndQntt > 0){
			grdRawMtrInvntr.setCellData(nRow, 11, Math.round(invntrWght / invntrQntt) * cmndQntt);
			grdRawMtrInvntr.setCellData(nRow, 0, "Y");
		}
		if(cmndQntt == 0 && invntrQntt > 0){
			grdRawMtrInvntr.setCellData(nRow, 11, 0);
			grdRawMtrInvntr.setCellData(nRow, 0, "N");
		}

    }

    const fn_save = async function() {

    	var grdRows = grdRawMtrInvntr.getCheckedRows(0);
    	var insertList = [];

    	var fcltCd	= SBUxMethod.get("srch-slt-inptFclt");
    	if(gfn_isEmpty(fcltCd)){
    		gfn_comAlert("W0001", "설비");			//	W0002	{0}을/를 선택하세요.
            return;
    	}

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	var fcltCd	= SBUxMethod.get("srch-slt-inptFclt");
    	var sortCmndYmd = SBUxMethod.get("srch-dtp-cmndYmd");

    	for(i=0; i< grdRows.length; i++){
    		var nRow = grdRows[i];
    		var cmndWght = grdRawMtrInvntr.getRowData(nRow).cmndWght;
    		if(cmndWght == 0){
    			gfn_comAlert("W0001", "지시중량");		//	W0002	{0}이/가 없습니다.
    			return;
    		}
    		grdRawMtrInvntr.setCellData(nRow, 26, fcltCd);
    		grdRawMtrInvntr.setCellData(nRow, 27, sortCmndYmd);
    		grdRawMtrInvntr.setCellData(nRow, 28, gv_selectedApcCd);
    		insertList.push(grdRawMtrInvntr.getRowData(nRow));
    	}

    	var regMsg = "등록 하시겠습니까?";
		if(confirm(regMsg)){
			const postJsonPromise = gfn_postJSON("/am/sort/insertSortCmndList.do", insertList);
	    	const data = await postJsonPromise;

	    	try{
	       		if(data.insertedCnt > 0){
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	       		}else{
	       			gfn_comAlert("E0001");					// E0001 오류가 발생하였습니다.
	       		}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}



    }

    const fn_setGrdSortCmnd = async function(){
    	let fcltCd	= SBUxMethod.get("srch-slt-inptFclt");
    	let sortCmndYmd = SBUxMethod.get("srch-dtp-cmndYmd");
    	let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");			// 생산자
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");				// 품목
  		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");				// 품종
  		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");	// 창고

    	const postJsonPromise = gfn_postJSON("/am/sort/selectSortCmndList.do", {
			apcCd: gv_selectedApcCd,
			fcltCd: fcltCd,
			sortCmndYmd: sortCmndYmd,
			prdcrCd : prdcrCd,
			itemCd : itemCd,
			vrtyCd : vrtyCd,
			warehouseSeCd:warehouseSeCd
  		});
        const data = await postJsonPromise;
  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonSortCmnd.length = 0;
          	data.resultList.forEach((item, index) => {

          		const sortCmnd = {
  						rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						sortCmndno: item.sortCmndno,
  						sortCmndSn: item.sortCmndSn,
  						sortCmndYmd : item.sortCmndYmd,
  						fcltCd : item.fcltCd,
  						fcltNm : item.fcltNm,
  						pltno: item.pltno,
  						prdcrCd: item.prdcrCd,
  						itemCd: item.itemCd,
  						vrtyCd: item.vrtyCd,
  						warehouseSeCd: item.warehouseSeCd,
  						apcNm: item.apcNm,
  						prdcrNm: item.prdcrNm,
  						itemNm: item.itemNm,
  						vrtyNm: item.vrtyNm,
  						grdNm: item.grdNm,
  						warehouseSeNm: item.warehouseSeNm,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeNm: item.trsprtSeNm,
  						bxKndNm: item.bxKndNm,
  						grdNm: item.grdNm,
  						cmndQntt: item.cmndQntt,
  						cmndWght: item.cmndWght,
  						rmrk : item.rmrk
  				}
          		jsonSortCmnd.push(sortCmnd);
  			});
          	grdSortCmnd.refresh();


		}catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}

			console.error("failed", e.message);
		}
    }


    const fn_delete = async function(){
    	var grdRows = grdSortCmnd.getCheckedRows(0);
    	var deleteList = [];

    	for(i=0; i< grdRows.length; i++){
    		var nRow = grdRows[i];
    		deleteList.push(grdSortCmnd.getRowData(nRow));
    	}

    	var delMsg = "삭제 하시겠습니까?";
		if(confirm(delMsg)){
			const postJsonPromise = gfn_postJSON("/am/sort/deleteSortCmndList.do", deleteList);
	    	const data = await postJsonPromise;

	    	try{
	       		if(data.deletedCnt > 0){
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	       		}else{
	       			gfn_comAlert("E0001");					// E0001 오류가 발생하였습니다.
	       		}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}


    }


	/*
	*
	* @name fn_onKeyUpPrdcrNm
	* @description 생산자명 입력 시 event : autocomplete
	*/
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
	}
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

</script>

</html>