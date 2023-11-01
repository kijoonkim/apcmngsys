<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 포장지시등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회"class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
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
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>선별일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-inptYmdFrom" name="srch-dtp-inptYmdFrom" class="form-control pull-right input-sm" onchange="fn_dtpChange(srch-dtp-inptYmdFrom)">
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-inptYmdTo" name="srch-dtp-inptYmdTo" class="form-control pull-right input-sm" onchange="fn_dtpChange(srch-dtp-inptYmdTo)">
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" class="form-control input-sm input-sm-ast inpt_data_reqed" jsondata-ref="jsonComVrty" onchange="fn_selectVrty"></sbux-select>
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
   								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
							<td colspan="2">&nbsp;</td>
						</tr>
					</tbody>
				</table>

				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>선별재고 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
					</div>
				</div>
	            <div class="sbt-wrap-body">
                    <div class="sbt-grid">
                        <div id="sb-area-grdSortInvntr" style="height:236px;"></div>
                    </div>
               	</div>
				<br/>
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
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-cmndYmd" name="srch-dtp-cmndYmd" class="form-control pull-right input-sm"></sbux-datepicker>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>생산설비</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-fclt" name="srch-slt-fclt" class="form-control input-sm input-sm-ast inpt_data_reqed" jsondata-ref="jsonComFclt"></sbux-select>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>거래처</th>
						    <td colspan="3" class="td_input" style="border-right:hidden ;">
						    	<sbux-input uitype="hidden" id="srch-inp-cnptCd" name="srch-inp-cnptCd" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-input>
						    	<sbux-input uitype="text" id="srch-inp-cnptNm" name="srch-inp-cnptNm" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-input>
							<td class="td_input">
								<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt"/>
						    </td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">납기일자</th>
							<td class="td_input" style="border-right:hidden ;">
								<sbux-datepicker uitype="popup" id="srch-dtp-dudtYmd" name="srch-dtp-dudtYmd" class="form-control pull-right input-sm"/>
							</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li><span>포장지시 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="sb-area-grdPckgCmnd" style="height:208px;"></div>
					</div>
				</div>
				<!--[pp] //검색결과 -->
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

    <!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

	var jsonComItem				= [];	// 품목 		itemCd		검색
	var jsonComVrty				= [];	// 품종 		vrtyCd		검색
	var jsonComSpcfct			= [];	// 규격 		spcfcCd		검색
	var jsonComFclt				= [];	// 설비 		fcltCd		검색

	var jsonPrdcr				= [];	//생산자 목록
    var jsonPrdcrAutocomplete 	= [];	//생산자 자동완성

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			// 검색 SB select
		 	gfn_setComCdSBSelect('srch-slt-fclt', 			jsonComFclt, 	'PCKG_FCLT_CD', gv_selectedApcCd),	 	// 설비
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 	gv_selectedApcCd),						// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 	gv_selectedApcCd)						// 품종
		]);
	}

	async function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let rst = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 	gv_selectedApcCd, itemCd),				// 품종
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonComSpcfct, 	gv_selectedApcCd, itemCd)				// 규격
		]);
	}

	async function fn_selectVrty(){
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let itemCd = jsonComVrty.find(e => e.vrtyCd == vrtyCd).itemCd;
		SBUxMethod.set("srch-slt-itemCd", itemCd);
		await fn_selectItem();
		SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);

	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-cmndYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		fn_initSBSelect();
		fn_createGrid();
		fn_createGrid2();
		fn_getPrdcrs();

		grdSortInvntr.refresh({"combo":true});
	});


	var grdSortInvntr; // 그리드를 담기위한 객체 선언
	var jsonSortInvntr = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSortInvntr';
	    SBGridProperties.id = 'grdSortInvntr';
	    SBGridProperties.jsonref = 'jsonSortInvntr';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	        {caption: ["선택","선택"],			ref: 'checkbox',     	type:'checkbox',  width:'40px',    style:'text-align:center',
            	typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
	        {caption: ["선별번호","선별번호"],	ref: 'sortno',   		type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["선별일자","선별일자"], 	ref: 'inptYmd',  		type:'output',  width:'100px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["생산자","생산자"],  	ref: 'prdcrNm',    		type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품종","품종"],  		ref: 'vrtyNm',    		type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["창고","창고"],  		ref: 'warehouseSeNm',   type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["설비","설비"],  		ref: 'fcltNm',    		type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["선별","수량"],  		ref: 'invntrQntt',    	type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,###'}},
	        {caption: ["선별","중량"],  		ref: 'invntrWght',    	type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["재고규격","재고규격"],  ref: 'spcfctNm',    	type:'output',  width:'100px',    style:'text-align:right; background:#FFF8DC;'},
            {caption: ["포장지시", "지시규격"], ref: 'spcfct',   		type:'combo',  width:'100px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonComSpcfct', 	displayui : false,	itemcount: 10, label:'label', value:'value', unselect: {label : '선택', value: ''}}},
	        {caption: ["포장지시","수량"],  	ref: 'pckgQntt',    	type:'input',  width:'100px',    style:'text-align:right; background:#FFF8DC;'},
	        {caption: ["포장지시","중량"],  	ref: 'pckgWght',    	type:'output',  width:'100px',    style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["지시비고","지시비고"],  ref: 'rmrk',    		type:'input',  width:'180px',    style:'text-align:center'},
	    ];

	    grdSortInvntr = _SBGrid.create(SBGridProperties);
	    grdSortInvntr.bind('valuechanged', 'fn_grdCmndQnttValueChanged');
	    grdSortInvntr.bind('select','fn_setValue');
	    grdSortInvntr.bind('deselect','fn_delValue');
	}

	const fn_grdCmndQnttValueChanged = async function(){

    	let nRow = grdSortInvntr.getRow();
		let nCol = grdSortInvntr.getCol();

		switch (nCol) {
		case 11:	// checkbox
			fn_checkInptQntt();
			break;
		default:
			return;
		}
    }

    const fn_setValue = async function(){


    	let nRow = grdSortInvntr.getRow();
    	let nCol = grdSortInvntr.getCol();
    	if(nCol == 0){

	    	let invntrQntt = grdSortInvntr.getRowData(nRow).invntrQntt;
			let invntrWght = grdSortInvntr.getRowData(nRow).invntrWght;
			let pckgQntt = grdSortInvntr.getRowData(nRow).pckgQntt;
			let pckgWght = grdSortInvntr.getRowData(nRow).pckgWght;


			if((pckgQntt == 0 && pckgWght == 0) || (gfn_isEmpty(pckgQntt) && gfn_isEmpty(pckgWght))){
				grdSortInvntr.setCellData(nRow, 11, invntrQntt);
				grdSortInvntr.setCellData(nRow, 12, invntrWght);
			}
    	}
    }

    const fn_delValue = async function(){
    	var nRow = grdSortInvntr.getRow();
    	grdSortInvntr.setCellData(nRow, 11, 0);
    	grdSortInvntr.setCellData(nRow, 12, 0);
    }

    const fn_checkInptQntt = async function(){

    	let nRow = grdSortInvntr.getRow();
		let nCol = grdSortInvntr.getCol();

		let invntrQntt = grdSortInvntr.getRowData(nRow).invntrQntt;
		let invntrWght = grdSortInvntr.getRowData(nRow).invntrWght;
		let pckgQntt = grdSortInvntr.getRowData(nRow).pckgQntt;

		if(invntrQntt - pckgQntt < 0){
			gfn_comAlert("W0008", "재고수량", "출하수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdSortInvntr.setCellData(nRow, nCol , 0);
            return;
		}

		if(invntrQntt > 0 && pckgQntt > 0){
			grdSortInvntr.setCellData(nRow, 12, Math.round(invntrWght / invntrQntt) * pckgQntt);
			grdSortInvntr.setCellData(nRow, 0, "Y");
		}
		if(pckgQntt == 0 && invntrQntt > 0){
			grdSortInvntr.setCellData(nRow, 12, 0);
			grdSortInvntr.setCellData(nRow, 0, "N");
		}

    }

	var grdPckgCmnd; // 그리드를 담기위한 객체 선언
	var jsonPckgCmnd = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid2() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgCmnd';
	    SBGridProperties.id = 'grdPckgCmnd';
	    SBGridProperties.jsonref = 'jsonPckgCmnd';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["지시번호"],		ref: 'pckgCmndno',  type:'output',  	width:'130px',  style:'text-align:center'},
	        {caption: ["생산설비"],		ref: 'fcltNm',      type:'output',  	width:'120px',  style:'text-align:center'},
	        {caption: ["납기일자"],		ref: 'dudtYmd',     type:'output',  	width:'100px',  style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["거래처"],		ref: 'cnptNm',      type:'output',  	width:'140px',  style:'text-align:center'},
	        {caption: ["품종"],			ref: 'vrtyNm',      type:'output',  	width:'100px',  style:'text-align:center'},
	        {caption: ["규격"],			ref: 'spcfctNm',    type:'output',  	width:'100px',  style:'text-align:center'},
	        {caption: ["상품명"],		ref: 'gdsNm',      	type:'output',  	width:'150px',  style:'text-align:center' , hidden:true},
	        {caption: ["지시수량"],		ref: 'cmndQntt',    type:'output',  	width:'60px',   style:'text-align:right', format : {type:'number', rule:'#,###'}},
	        {caption: ["지시중량"],		ref: 'cmndWght',    type:'output',  	width:'80px',   style:'text-align:right', format : {type:'number', rule:'#,###Kg'}},
	        {caption: ["비고"],			ref: 'rmrk',      	type:'output',  	width:'200px',  style:'text-align:left'},
	        {caption: ["순번"],  		ref: 'pckgCmndSn',    hidden:true},
	    ];

	    grdPckgCmnd = _SBGrid.create(SBGridProperties);
	}


	const fn_search = async function(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");				// 품목
  		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");				// 품종
  		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
    	let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");

		if(gfn_isEmpty(inptYmdFrom) || gfn_isEmpty(inptYmdTo)){
			gfn_comAlert("W0001", "지시일자");		//	W0002	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(vrtyCd)){
			gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
			return;
		}

		let rst = await Promise.all([
	    	 fn_setGrdPckgCmnd(),
	    	 fn_setgrdSortInvntr()
		])

	}
	const fn_setgrdSortInvntr = async function(){
    	let inptYmdFrom 	= SBUxMethod.get("srch-dtp-inptYmdFrom");
    	let inptYmdTo 		= SBUxMethod.get("srch-dtp-inptYmdTo");
    	let prdcrCd 		= SBUxMethod.get("srch-inp-prdcrCd");				// 생산자
  		let itemCd 			= SBUxMethod.get("srch-slt-itemCd");				// 품목
  		let vrtyCd 			= SBUxMethod.get("srch-slt-vrtyCd");				// 품종

    	const postJsonPromise = gfn_postJSON("/am/pckg/selectPckgCmndTrgetList.do", {
			apcCd			: gv_selectedApcCd,
			inptYmdFrom		: inptYmdFrom,
			inptYmdTo		: inptYmdTo,
			prdcrCd 		: prdcrCd,
			itemCd 			: itemCd,
			vrtyCd 			: vrtyCd
  		});
        const data = await postJsonPromise;
  		try {

  			jsonSortInvntr.length = 0;
          	data.resultList.forEach((item, index) => {
          		const sortInvntr = {
  						rowSeq			: item.rowSeq,
  						apcCd			: item.apcCd,
  						sortCmndno		: item.sortCmndno,
  						sortCmndSn		: item.sortCmndSn,
  						sortCmndYmd 	: item.sortCmndYmd,
  						fcltCd 			: item.fcltCd,
  						fcltNm 			: item.fcltNm,
  						prdcrCd			: item.prdcrCd,
  						itemCd			: item.itemCd,
  						vrtyCd			: item.vrtyCd,
  						spcfctCd		: item.spcfctCd,
  						warehouseSeCd	: item.warehouseSeCd,
  						apcNm			: item.apcNm,
  						prdcrNm			: item.prdcrNm,
  						itemNm			: item.itemNm,
  						vrtyNm			: item.vrtyNm,
  						spcfctNm		: item.spcfctNm,
  						grdNm			: item.grdNm,
  						warehouseSeNm	: item.warehouseSeNm,
  						gdsSeNm			: item.gdsSeNm,
  						wrhsSeNm		: item.wrhsSeNm,
  						trsprtSeNm		: item.trsprtSeNm,
  						bxKndNm			: item.bxKndNm,
  						grdNm			: item.grdNm,
  						cmndQntt		: item.cmndQntt,
  						cmndWght		: item.cmndWght,
  						invntrQntt		: item.invntrQntt,
  						invntrWght		: item.invntrWght,
  						rmrk 			: item.rmrk,
  						inptYmd 		: item.inptYmd,
  						sortno 			: item.sortno,
  						sortSn 			: item.sortSn
  				}
          		jsonSortInvntr.push(sortInvntr);

  			});
       		grdSortInvntr.rebuild();
       		grdSortInvntr.refresh({"combo":true});
       } catch (e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
		}
	}


	const fn_setGrdPckgCmnd = async function(pageSize, pageNo){

		let pckgCmndYmd  = SBUxMethod.get("srch-dtp-cmndYmd"); //포장지시일자

    	const postJsonPromise = gfn_postJSON("/am/pckg/selectRegPckgCmndList.do", {
			apcCd: gv_selectedApcCd,
			pckgCmndYmd: pckgCmndYmd,
  		});

        const data = await postJsonPromise;
		try{

			jsonPckgCmnd.length = 0;
          	data.resultList.forEach((item, index) => {
          		const pckgCmnd = {
      				apcCd			: item.apcCd,
      				pckgCmndno		: item.pckgCmndno,
      				pckgCmndSn		: item.pckgCmndSn,
      				pckgCmndYmd		: item.pckgCmndYmd,
      				fcltCd			: item.fcltCd,
      				fcltNm			: item.fcltNm,
      				cnptCd			: item.cnptCd,
      				cnptNm 			: item.cnptNm,
      				dudtYmd			: item.dudtYmd,
      				itemCd			: item.itemCd,
      				vrtyCd			: item.vrtyCd,
      				vrtyNm			: item.vrtyNm,
      				spcfctCd		: item.spcfctCd,
      				spcfctNm		: item.spcfctNm,
      				outordrQntt		: item.outordrQntt,
      				outordrWght		: item.outordrWght,
      				bxGdsQntt		: item.bxGdsQntt,
      				cmndQntt		: item.cmndQntt,
      				cmndWght		: item.cmndWght,
      				outordrno		: item.outordrno,
      				gdsCd			: item.gdsCd,
      				gdsNm			: item.gdsNm,
      				rmrk			: item.rmrk,
      				delYn			: item.delYn
				}
          		jsonPckgCmnd.push(pckgCmnd);

  			});
      		grdPckgCmnd.rebuild();
	   } catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
    }

	const fn_reset = async function(){
		SBUxMethod.set('srch-dtp-inptYmdFrom', gfn_dateToYmd(new Date()));
		SBUxMethod.set('srch-dtp-inptYmdTo', gfn_dateToYmd(new Date()));
		SBUxMethod.set('srch-slt-itemCd', "");
		SBUxMethod.set('srch-slt-vrtyCd', "");
		SBUxMethod.set('srch-inp-prdcrNm', "");
		fn_clearPrdcr();
		SBUxMethod.set('srch-dtp-cmndYmd', gfn_dateToYmd(new Date()));
		SBUxMethod.set('srch-slt-fclt', "");
		SBUxMethod.set('srch-inp-cnptCd', "");
		SBUxMethod.set('srch-inp-cnptNm', "");
		SBUxMethod.set('srch-dtp-dudtYmd', "");
	}
	
	const fn_save = async function(){
		let pckgCmndYmd 	= SBUxMethod.get("srch-dtp-cmndYmd"); //포장지시일자
		let fcltCd  		= SBUxMethod.get("srch-slt-fclt"); //설비코드
		let cnptCd  		= SBUxMethod.get("srch-inp-cnptCd"); //거래처코드
		let cnptNm  		= SBUxMethod.get("srch-inp-cnptNm"); //거래처명

		let dudtYmd  		= SBUxMethod.get("srch-dtp-dudtYmd"); //납기일자
		let gdsNm  			= SBUxMethod.get("srch-inp-gdsNm"); //상품명
		let outordrQntt  	= SBUxMethod.get("srch-inp-outordrQntt"); //발주수량
		let bxGdsQntt  		= SBUxMethod.get("srch-inp-bxGdsQntt"); //입수
		let outordrno  		= SBUxMethod.get("srch-inp-gdsNo"); //발주번호

	   if (gfn_isEmpty(pckgCmndYmd)){
		  	gfn_comAlert("W0001", "지시일자");			//	W0001	{0}을/를 선택하세요.
		return;
	   }
	   if (gfn_isEmpty(fcltCd)){
		  	gfn_comAlert("W0001", "생산설비");			//	W0001	{0}을/를 선택하세요.
		return;
	   }
	   if (gfn_isEmpty(cnptCd)){
		  	gfn_comAlert("W0001", "거래처");			//	W0001	{0}을/를 선택하세요.
		return;
	   }

		var grdRows = grdSortInvntr.getCheckedRows(0);
		var insertList = [];
    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		const rowData = grdSortInvntr.getRowData(nRow);
 		   if (gfn_isEmpty(rowData.spcfct)){
 			 	gfn_comAlert("W0001", "규격");			//	W0001	{0}을/를 선택하세요.
				return;
 		   }
 		   if (gfn_isEmpty(rowData.pckgQntt)){
 				gfn_comAlert("W0002", "포장지시수량");			//	W0002	{0}을/를 입력하세요.
				return;
 		   }

			rowData.pckgCmndYmd = pckgCmndYmd;
	 		rowData.spcfctCd = rowData.spcfct;
	 		rowData.fcltCd = fcltCd;
	 		rowData.cnptCd = cnptCd;
	 		rowData.cnptNm = cnptNm;
	 		rowData.dudtYmd = dudtYmd;
	 		rowData.gdsNm = gdsNm;
	 		rowData.outordrQntt = outordrQntt;
			rowData.bxGdsQntt = bxGdsQntt;
			rowData.cmndQntt = rowData.pckgQntt;
			rowData.cmndWght = rowData.pckgWght;
			rowData.outordrno = outordrno;

			insertList.push(rowData);
    	}

		if(insertList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
			return;
		}
		let regMsg = "저장 하시겠습니까?";
		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

    	const postJsonPromise = gfn_postJSON("/am/pckg/insertPckgCmndList.do", insertList);	// 프로그램id 추가

		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
	}

	/*
	* @name fn_getPrdcrs
	* @description 생산자 자동완성 목록 가져오기
	*/
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	/**
	* @name fn_onKeyUpPrdcrNm
	* @description 생산자명 입력 시 event : autocomplete
	*/
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm) > 100){
			SBUxMethod.set("srch-inp-prdcrNm", "");
			return;
		}
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
		// 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
		if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
			document.getElementById('btn-srch-prdcr').click();
		}
		else{
			SBUxMethod.set("srch-inp-prdcrCd", value);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 찾기 버튼 클릭
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 모달 선택 콜백 callback
	 */
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
 	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
	}


 	const fn_modalCnpt = function() {
     	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnpt"), fn_setCnpt);
 	}

 	const fn_setCnpt = function(cnpt) {
 		if (!gfn_isEmpty(cnpt)) {
 			console.log("cnpt", cnpt);
 			SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
 			SBUxMethod.set('srch-inp-cnptCd', cnpt.cnptCd);
 		}
 	}

 	const fn_dtpChange = function(){
 		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
 		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
 		if(gfn_diffDate(inptYmdFrom, inptYmdTo) < 0){
 			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
 			SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateToYmd(new Date()));
 			SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
 			return;
 		}
 	}
 	
 	 const fn_onChangeApc = async function() {
 		let result = await Promise.all([
 			fn_clearPrdcr(),
 			fn_initSBSelect(),
 			fn_getPrdcrs(),
 			jsonSortInvntr = [],
 			grdPckgCmnd = [],
 			grdSortInvntr.rebuild(),
 			grdPckgCmnd.rebuild()
 		]);
 	}
</script>
</html>