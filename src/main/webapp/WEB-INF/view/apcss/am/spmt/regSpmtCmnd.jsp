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
		<div class="box-header" style="display:flex; justify-content: flex-start;" >
			<div>
				<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 출하지시등록 -->
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>발주일자</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-outordrYmdFrom" name="srch-dtp-outordrYmdFrom" uitype="popup" class="form-control input-sm sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-outordrYmdFrom)"></sbux-datepicker>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-outordrYmdTo"" name="srch-dtp-outordrYmdTo" uitype="popup" class="form-control input-sm sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-outordrYmdTo)"></sbux-datepicker>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>

							<th scope="row" class="th_bg">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-warehouseSeCd" name="dtl-slt-warehouseSeCd" uitype="single" jsondata-ref="jsonComWarehouse" unselected-text="전체" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonComItem"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComVrty"
									onchange="fn_onChangeSrchVrtyCd(this)"
								></sbux-select>
							</td>
							<td class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">거래처</th>
						    <td colspan="2"class="td_input" style="border-right:hidden ;">
								<sbux-input uitype="text" id="srch-inp-cnptNm" name="srch-inp-cnptNm" class="form-control input-sm"></sbux-input>
								<sbux-input uitype="hidden" id="srch-inp-cnptCd" name="srch-inp-cnptCd" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btn-srch-inp-cnpt" name="btn-srch-inp-cnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-spcfctCd"
									name="srch-slt-spcfctCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									jsondata-ref="jsonComSpcfct"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
							</td>
							<td colspan="5"></td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>출하지시대상 내역</span></li>
					</ul>
				</div>
				<div id="sb-area-grdSpmtCmndTrgtDsctn" style="height:200px;"></div>
				<br>
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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-apcCnptNm" name="dtl-inp-apcCnptNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
								<sbux-input id="dtl-inp-apcCnptCd" name="dtl-inp-apcCnptCd" uitype="hidden" class="form-control input-sm"  disabled></sbux-input>
							</td>
							<td></td>
							<th scope="row" class="th_bg">배송처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-dldtn" name="dtl-inp-dldtn" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</td>
							<td></td>
						    <th scope="row" class="th_bg"><span class="data_required"></span>지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="dtl-inp-cmndYmd" name="dtl-inp-cmndYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input"  style="border-right: hidden;"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>운송회사</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-trsprtCo" name="dtl-slt-trsprtCo" uitype="single" jsondata-ref="jsonTrsprtCo" class="form-control input-sm input-sm-ast inpt_data_reqed"  unselected-text="선택"></sbux-select>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-rmrk" name="dtl-inp-rmrk" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
							<td colspan="4" class="td_input">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li><span>출하지시 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					</div>
				</div>
				<div id="sb-area-grdSpmtCmndDsctn" style="height:200px;"></div>
			</div>
		</div>
	</section>
	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var jsonComWarehouse	= [];	// 창고 		warehouse	검색
	var jsonComItem			= [];	// 품목 		itemCd		검색
	var jsonComVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComSpcfct		= [];	// 규격 		spcfct		검색
	var jsonComFclt			= [];	// 설비 		fcltCd		검색
	var jsonSpmtPckgUnit	= [];	// 출하포장단위 	pckgSeCd	그리드
	var jsonComGdsGrd		= [];	// 상품등급			gdsGrd		그리드
	var jsonTrsprtCo		= [];	// 운송회사 	trsprtCo	검색

	var jsonSpmtCmndTrg		= [];
	var jsonSpmtCmnd		= [];

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([

			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('srch-slt-itemCd', 		jsonComFclt, 		'FCLT_CD', gv_selectedApcCd),			// 설비
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),						// 품목
 			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_selectedApcCd),						// 품종
			gfn_setSpmtPckgUnitSBSelect('grdSpmtCmndTrg', 	jsonSpmtPckgUnit, 	gv_selectedApcCd),						// 포장구분
			gfn_setComCdSBSelect('grdSpmtCmndTrg', 			jsonComGdsGrd, 		'GDS_GRD'),								// 상품등급
			gfn_setTrsprtsSBSelect('dtl-slt-trsprtCo', 		jsonTrsprtCo, 		gv_selectedApcCd),						// 운송회사
		]);
	}
	
	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd, itemCd),						// 품종
			gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnitCd', jsonSpmtPckgUnit, gv_selectedApcCd, itemCd)		// 포장구분
		]);
		if (gfn_isEmpty(itemCd)) {
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, "");
		} else {
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, itemCd);				// 규격
		}
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		let itemCd = "";
		if (!gfn_isEmpty(vrtyCd)) {
			itemCd = _.find(jsonComVrty, {value: vrtyCd}).mastervalue;
		} else {
			itemCd = SBUxMethod.get("srch-slt-itemCd");
		}
		
		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
		let rst = await Promise.all([
			gfn_setSpmtPckgUnitSBSelect('grdSpmtCmndTrg', jsonSpmtPckgUnit, gv_selectedApcCd, itemCd, vrtyCd)	// 포장구분	(그리드)
		]);
		grdSpmtCmndTrg.refresh({"combo":true});
		SBUxMethod.refresh("srch-slt-spmtPckgUnitCd");
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createRegSpmtCmndGrid();

		SBUxMethod.set("srch-dtp-outordrYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-outordrYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("dtl-inp-cmndYmd", gfn_dateToYmd(new Date()));

		fn_initSBSelect();

	})

	function fn_createRegSpmtCmndGrid() {
        var SBGridPropertiesOrdr = {};
        SBGridPropertiesOrdr.parentid = 'sb-area-grdSpmtCmndTrgtDsctn';
        SBGridPropertiesOrdr.id = 'grdSpmtCmndTrg';
        SBGridPropertiesOrdr.jsonref = 'jsonSpmtCmndTrg';
        SBGridPropertiesOrdr.emptyrecords = '데이터가 없습니다.';
        SBGridPropertiesOrdr.selectmode = 'byrow';
        SBGridPropertiesOrdr.extendlastcol = 'scroll';
        SBGridPropertiesOrdr.oneclickedit = true;
        SBGridPropertiesOrdr.columns = [
        	{caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ['거래처'], 		ref: 'apcCnptNm', 		width: '200px', type: 'output', style: 'text-align:center'},
            {caption: ['배송처'], 		ref: 'dldtn', 			width: '200px', type: 'output', style: 'text-align:center'},
            {caption: ['납기일자'], 	ref: 'wrhsYmd', 		width: '120px', type: 'output', style: 'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['품종'], 		ref: 'vrtyNm', 			width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['발주수량'], 	ref: 'outordrQntt', 	width: '100px', type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['출하수량'], 	ref: 'spmtQntt',		width: '100px', type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['출하지시수량'], ref: 'cmndQntt',		width: '100px', type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['재고수량'], 	ref: 'invntrQntt', 		width: '100px', type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["포장단위"], 	ref: 'spmtPckgUnitCd',  width: '200px', type:'combo',      style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonSpmtPckgUnit', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
		    {caption: ["등급"], 		ref: 'gdsGrd',   		width:'100px',  type:'combo',    style:'text-align:center; background:#FFF8DC;',
						typeinfo : {ref:'jsonComGdsGrd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['지시수량'], 	ref: 'inptCmndQntt', 	width: '80px', type: 'input', style: 'text-align:right; background:#FFF8DC;'},
            {caption: ['지시중량'], 	ref: 'inptCmndWght', 	width: '100px', type: 'output', style: 'text-align:right' ,
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ["단중"], ref: 'wght', type:'output', hidden : true}
        ];

        grdSpmtCmndTrg = _SBGrid.create(SBGridPropertiesOrdr);
        grdSpmtCmndTrg.bind('valuechanged', 'fn_grdCmndQnttValueChanged');
        grdSpmtCmndTrg.bind('select', 'fn_setValue');
        grdSpmtCmndTrg.bind('deselect', 'fn_delValue');


        var SBGridPropertiesSpmtCmnd = {};
        SBGridPropertiesSpmtCmnd.parentid = 'sb-area-grdSpmtCmndDsctn';
        SBGridPropertiesSpmtCmnd.id = 'grdSpmtCmnd';
        SBGridPropertiesSpmtCmnd.jsonref = 'jsonSpmtCmnd';
        SBGridPropertiesSpmtCmnd.emptyrecords = '데이터가 없습니다.';
        SBGridPropertiesSpmtCmnd.selectmode = 'byrow';
        SBGridPropertiesSpmtCmnd.extendlastcol = 'scroll';
        SBGridPropertiesSpmtCmnd.columns = [
            {caption: ['지시일자'], 	ref: 'cmndYmd', 		width: '100px', type: 'output', style: 'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['납기일자'], 	ref: 'wrhsYmd', 		width: '100px', type: 'output', style: 'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['거래처'], 		ref: 'cnptNm', 			width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['운송회사'], 	ref: 'trsprtCoNm', 		width: '140px', type: 'output', style: 'text-align:center'},
            {caption: ['배송처'], 		ref: 'dldtn', 			width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['품종'], 		ref: 'vrtyNm', 			width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 		width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['수량'], 		ref: 'cmndQntt',		width: '80px', type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['중량'], 		ref: 'cmndWght', 		width: '100px', type: 'output', style: 'text-align:right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['상품등급'], 	ref: 'gdsGrdNm', 		width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['포장구분'], 	ref: 'spmtPckgUnitNm', 	width: '140px', type: 'output', style: 'text-align:center'},
            {caption: ['비고'], 		ref: 'rmrk', 			width: '120px', type: 'output', style: 'text-align:center'}
        ];

        grdSpmtCmnd = _SBGrid.create(SBGridPropertiesSpmtCmnd);
    }


	const fn_grdCmndQnttValueChanged = async function(){

    	let nRow = grdSpmtCmndTrg.getRow();
		let nCol = grdSpmtCmndTrg.getCol();
		let inptCmndQnttCol = grdSpmtCmndTrg.getColRef("inptCmndQntt");
		switch (nCol) {
		case inptCmndQnttCol:	// checkbox
			fn_checkInptQntt();
			break;
		default:
			return;
		}
    }

    const fn_setValue = function(){

    	let nRow = grdSpmtCmndTrg.getRow();
    	let nCol = grdSpmtCmndTrg.getCol();
    	if(nCol == 0){

    		// 발주수량 - 출하수량 - 출하지시수량 = 가능한 지시수량
	    	let invntrQntt 		= grdSpmtCmndTrg.getRowData(nRow).invntrQntt;
			let spmtQntt 		= grdSpmtCmndTrg.getRowData(nRow).spmtQntt;
			let outordrQntt 	= grdSpmtCmndTrg.getRowData(nRow).outordrQntt;
			let cmndQntt 		= grdSpmtCmndTrg.getRowData(nRow).cmndQntt;
			let psbltyCmndQntt = outordrQntt - cmndQntt;

			let wght 			= grdSpmtCmndTrg.getRowData(nRow).wght;
			let apcCnptNm 		= grdSpmtCmndTrg.getRowData(nRow).apcCnptNm;
			let apcCnptCd 		= grdSpmtCmndTrg.getRowData(nRow).apcCnptCd;
			let dldtn 			= grdSpmtCmndTrg.getRowData(nRow).dldtn;
			let inptCmndQnttCol = grdSpmtCmndTrg.getColRef("inptCmndQntt");
			let inptCmndWghtCol = grdSpmtCmndTrg.getColRef("inptCmndWght");
			let checkedYnCol 	= grdSpmtCmndTrg.getColRef("checkedYn");

			let dtlApcCnptCd = SBUxMethod.get("dtl-inp-apcCnptCd");
			let dtlDldtn = SBUxMethod.get("dtl-inp-dldtn");
			if(gfn_isEmpty(dtlApcCnptCd)){
				SBUxMethod.set("dtl-inp-apcCnptCd", apcCnptCd);
				SBUxMethod.set("dtl-inp-apcCnptNm", apcCnptNm);
				SBUxMethod.set("dtl-inp-dldtn", dldtn);
			}else{
				if(dtlDldtn != dldtn){
					gfn_comAlert("W0006", "선택한 행", "배송처");	// W0006 {0}와/과 {1}이/가 서로 다릅니다.
					grdSpmtCmndTrg.setCellData(nRow, 0, "N");
					return;
				}
			}
			if(psbltyCmndQntt > 0 && invntrQntt > 0){

				if(psbltyCmndQntt > invntrQntt) {
					grdSpmtCmndTrg.setCellData(nRow, inptCmndQnttCol, invntrQntt);
					grdSpmtCmndTrg.setCellData(nRow, inptCmndWghtCol, invntrQntt*wght);
				}else {
					grdSpmtCmndTrg.setCellData(nRow, inptCmndQnttCol, psbltyCmndQntt);
					grdSpmtCmndTrg.setCellData(nRow, inptCmndWghtCol, psbltyCmndQntt*wght);
				}
			}
    	}


    }

    const fn_delValue = async function(){
    	var nRow = grdSpmtCmndTrg.getRow();
    	let inptCmndQnttCol = grdSpmtCmndTrg.getColRef("inptCmndQntt");
		let inptCmndWghtCol = grdSpmtCmndTrg.getColRef("inptCmndWght");
    	grdSpmtCmndTrg.setCellData(nRow, inptCmndQnttCol, 0);
    	grdSpmtCmndTrg.setCellData(nRow, inptCmndWghtCol, 0);
    }

    const fn_checkInptQntt = async function(){

    	let nRow = grdSpmtCmndTrg.getRow();
		let nCol = grdSpmtCmndTrg.getCol();

		let invntrQntt 		= grdSpmtCmndTrg.getRowData(nRow).invntrQntt;
		let spmtQntt 		= grdSpmtCmndTrg.getRowData(nRow).spmtQntt;
		let outordrQntt 	= grdSpmtCmndTrg.getRowData(nRow).outordrQntt;
		let cmndQntt 		= grdSpmtCmndTrg.getRowData(nRow).cmndQntt;
		let inptCmndQntt 	= grdSpmtCmndTrg.getRowData(nRow).inptCmndQntt;
		let psbltyCmndQntt 	= outordrQntt - cmndQntt;
		let wght 			= grdSpmtCmndTrg.getRowData(nRow).wght;
		let apcCnptNm 		= grdSpmtCmndTrg.getRowData(nRow).apcCnptNm;
		let apcCnptCd 		= grdSpmtCmndTrg.getRowData(nRow).apcCnptCd;
		let dldtn 			= grdSpmtCmndTrg.getRowData(nRow).dldtn;
		let inptCmndQnttCol = grdSpmtCmndTrg.getColRef("inptCmndQntt");
		let inptCmndWghtCol = grdSpmtCmndTrg.getColRef("inptCmndWght");
		let checkedYnCol 	= grdSpmtCmndTrg.getColRef("checkedYn");

		let dtlApcCnptCd = SBUxMethod.get("dtl-inp-apcCnptCd");
		let dtlDldtn = SBUxMethod.get("dtl-inp-dldtn");
		if(gfn_isEmpty(dtlApcCnptCd)){
			SBUxMethod.set("dtl-inp-apcCnptCd", apcCnptCd);
			SBUxMethod.set("dtl-inp-apcCnptNm", apcCnptNm);
			SBUxMethod.set("dtl-inp-dldtn", dldtn);
		}else{
			if(dtlDldtn != dldtn){
				gfn_comAlert("W0006", "선택한 행", "배송처");	// W0006 {0}와/과 {1}이/가 서로 다릅니다.
				grdSpmtCmndTrg.setCellData(nRow, checkedYnCol, "N");
				return;
			}
		}

		// 지시가능한수량 > 입력한지시수량
		if(inptCmndQntt > psbltyCmndQntt){
			gfn_comAlert("W0008", "지시가능수량", "지시수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdSpmtCmndTrg.setCellData(nRow, nCol , 0);
			grdSpmtCmndTrg.setCellData(nRow, inptCmndWghtCol , 0);
			grdSpmtCmndTrg.setCellData(nRow, checkedYnCol, "N");
            return;
		}

		if(invntrQntt >= inptCmndQntt){
			grdSpmtCmndTrg.setCellData(nRow, inptCmndWghtCol, inptCmndQntt*wght);
			grdSpmtCmndTrg.setCellData(nRow, checkedYnCol, "Y");
		}else{
			gfn_comAlert("W0008", "재고수량", "지시수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdSpmtCmndTrg.setCellData(nRow, inptCmndWghtCol, 0);
			grdSpmtCmndTrg.setCellData(nRow, inptCmndWghtCol , 0);
			grdSpmtCmndTrg.setCellData(nRow, checkedYnCol, "N");
			return;
		}

		if(invntrQntt == 0 && invntrQntt > 0){
			grdSpmtCmndTrg.setCellData(nRow, inptCmndWghtCol, 0);
			grdSpmtCmndTrg.setCellData(nRow, checkedYnCol, "N");
		}


    }

	const fn_search = async function(){

		let flag = true;
		flag = await fn_setGrdSpmtCmndTrg();
		if(flag){
			await fn_setGrdSpmtCmnd();
		}
	}

	const fn_setGrdSpmtCmndTrg = async function(){

		let outordrYmdFrom  = SBUxMethod.get("srch-dtp-outordrYmdFrom"); //발주 시작일자
		let outordrYmdTo  = SBUxMethod.get("srch-dtp-outordrYmdTo"); //발주 종료일자
		let warehouseSeCd  = SBUxMethod.get("dtl-slt-warehouseSeCd"); //창고구분

		let itemCd  = SBUxMethod.get("srch-slt-itemCd"); //품목코드
		let vrtyCd  = SBUxMethod.get("srch-slt-vrtyCd"); //품종코드
		let apcCnptCd  = SBUxMethod.get("srch-inp-apcCnptCd"); //거래처
		let apcCnptNm  = SBUxMethod.get("srch-inp-apcCnptNm"); //거래처명
		let spcfctCd  = SBUxMethod.get("srch-slt-spcfctCd"); //규격코드


    	if(gfn_isEmpty(outordrYmdFrom) || gfn_isEmpty(outordrYmdTo)){
    		gfn_comAlert("W0001", "발주일자");			//	W0002	{0}을/를 선택하세요.
            return false;
    	}
    	if(gfn_isEmpty(vrtyCd)){
    		gfn_comAlert("W0001", "품종");			//	W0002	{0}을/를 선택하세요.
    		return false;
    	}
    	if(gfn_isEmpty(spcfctCd)){
    		gfn_comAlert("W0001", "규격");			//	W0002	{0}을/를 선택하세요.
    		return false;
    	}

    	const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtCmndTrgList.do", {
			apcCd: gv_selectedApcCd,
			outordrYmdFrom: outordrYmdFrom,
			outordrYmdTo: outordrYmdTo,
			warehouseSeCd: warehouseSeCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			spcfctCd: spcfctCd,
			apcCnptCd: apcCnptCd,
			apcCnptNm: apcCnptNm
  		});
        const data = await postJsonPromise;
		try{
     		jsonSpmtCmndTrg.length = 0;
          	data.resultList.forEach((item, index) => {
          		const ordr = {
          				apcCd			: item.apcCd,
          				apcSeCd			: item.apcSeCd,
          				outordrno		: item.outordrno,
          				rcptnSeCd		: item.rcptnSeCd,
          				outordrYmd		: item.outordrYmd,
          				outordrPrsn		: item.outordrPrsn,
          				outordrPrsnCd	: item.outordrPrsnCd,
          				dldtn			: item.dldtn,
          				gdsCd			: item.gdsCd,
          				gdsNm			: item.gdsNm,
          				itemCd			: item.itemCd,
          				vrtyCd			: item.vrtyCd,
          				spcfctCd		: item.spcfctCd,
          				outordrQntt		: item.outordrQntt,
          				wrhsYmd			: item.wrhsYmd,
          				apcCnptNm		: item.apcCnptNm,
          				apcCnptCd		: item.apcCnptCd,
          				delYn			: item.delYn,
          				vrtyNm			: item.vrtyNm,
          				spcfctNm		: item.spcfctNm,
          				spmtQntt		: item.spmtQntt,
          				spmtWght		: item.spmtWght,
          				invntrQntt		: item.invntrQntt,
          				invntrWght		: item.invntrWght,
          				cmndQntt		: item.cmndQntt,
          				wght			: item.wght,
          				gdsGrd			: item.gdsGrd,
          				spmtPckgUnitCd	: item.spmtPckgUnitCd
				}
      			jsonSpmtCmndTrg.push(ordr);
  			});
      		grdSpmtCmndTrg.rebuild();
	   	} catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
	   	return true;
    }

	const fn_setGrdSpmtCmnd = async function(pageSize, pageNo){
		let cmndYmd = SBUxMethod.get("dtl-inp-cmndYmd"); // 지시일자
		let itemCd  = SBUxMethod.get("srch-slt-itemCd"); // 품목코드
		let vrtyCd  = SBUxMethod.get("srch-slt-vrtyCd"); // 품종코드

    	const postJsonPromise = gfn_postJSON("/am/spmt/selectRegSpmtCmndList.do", {
			apcCd: gv_selectedApcCd,
			cmndYmd: cmndYmd,
			itemCd: itemCd,
			vrtyCd: vrtyCd
  		});

        const data = await postJsonPromise;
		try{
     		jsonSpmtCmnd.length = 0;
          	data.resultList.forEach((item, index) => {
          		const spmtCmnd = {
          				apcCd		: item.apcCd,
          				spmtCmndno	: item.spmtCmndno,
          				spmtCmndSn	: item.spmtCmndSn,
          				cmndYmd		: item.cmndYmd,
          				cnptCd		: item.cnptCd,
          				dldtn		: item.dldtn,
          				trsprtCoCd	: item.trsprtCoCd,
          				gdsGrd		: item.gdsGrd,
          				cmndQntt	: item.cmndQntt,
          				cmndWght	: item.cmndWght,
          				spmtPckgUnitCd: item.spmtPckgUnitCd,
          				spmtPckgUnitNm: item.spmtPckgUnitNm,
          				outordrno	: item.outordrno,
          				itemCd		: item.itemCd,
          				vrtyCd		: item.vrtyCd,
          				spcfctCd	: item.spcfctCd,
          				gdsCd		: item.gdsCd,
          				gdsNm		: item.gdsNm,
          				rmrk		: item.rmrk,
          				delYn		: item.delYn,
          				pckgSe		: item.pckgSe,
          				vrtyNm		: item.vrtyNm,
          				spcfctNm	: item.spcfctNm,
          				gdsGrdNm	: item.gdsGrdNm,
          				cnptNm		: item.cnptNm,
          				trsprtCoNm	: item.trsprtCoNm,
          				wrhsYmd		: item.wrhsYmd
				}
      			jsonSpmtCmnd.push(spmtCmnd);
  			});
      		grdSpmtCmnd.rebuild();
	   } catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
    }

	const fn_save = async function() {

		var grdRows = grdSpmtCmndTrg.getCheckedRows(0);
		let cmndYmd = SBUxMethod.get("dtl-inp-cmndYmd");
		let trsprtCo = SBUxMethod.get("dtl-slt-trsprtCo");
		let rmrk = SBUxMethod.get("dtl-inp-rmrk");

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

		if(gfn_isEmpty(cmndYmd)){
			gfn_comAlert("W0001", "지시일자");		//	W0002	{0}을/를 선택하세요.
			return;
		}

		if(gfn_isEmpty(trsprtCo)){
			gfn_comAlert("W0001", "운송회사");		//	W0002	{0}을/를 선택하세요.
			return;
		}


		var insertList = [];
    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
			if(gfn_isEmpty(jsonSpmtCmndTrg[nRow-1].spmtPckgUnitCd)){
				gfn_comAlert("W0001", "포장단위");		//	W0002	{0}을/를 선택하세요.
				return;
			}
			if(gfn_isEmpty(jsonSpmtCmndTrg[nRow-1].gdsGrd)){
				gfn_comAlert("W0001", "등급");		//	W0002	{0}을/를 선택하세요.
				return;
			}
			if(gfn_isEmpty(jsonSpmtCmndTrg[nRow-1].inptCmndQntt)){
				gfn_comAlert("W0002", "지시수량");		//	W0002	{0}을/를 선택하세요.
				return;
			}
			jsonSpmtCmndTrg[nRow-1].cmndYmd = cmndYmd
			jsonSpmtCmndTrg[nRow-1].trsprtCoCd = trsprtCo
			jsonSpmtCmndTrg[nRow-1].trsprtCoNm = jsonTrsprtCo.find(e => e.value == trsprtCo).label;
			jsonSpmtCmndTrg[nRow-1].rmrk = rmrk;
			jsonSpmtCmndTrg[nRow-1].cnptCd = jsonSpmtCmndTrg[nRow-1].apcCnptCd;
			jsonSpmtCmndTrg[nRow-1].cmndQntt = jsonSpmtCmndTrg[nRow-1].inptCmndQntt;
			jsonSpmtCmndTrg[nRow-1].cmndWght = jsonSpmtCmndTrg[nRow-1].inptCmndWght;
			jsonSpmtCmndTrg[nRow-1].delYn = "N";

			insertList.push(jsonSpmtCmndTrg[nRow-1]);
    	}


    	let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){
			const postJsonPromise = gfn_postJSON("/am/spmt/insertSpmtCmnd.do", insertList);
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

	const fn_reset = function(){
		SBUxMethod.set("srch-dtp-outordrYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-outordrYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("dtl-slt-warehouseSeCd", "");
		SBUxMethod.set("srch-slt-itemCd", "");
		SBUxMethod.set("srch-slt-vrtyCd", "");
		SBUxMethod.set("srch-inp-cnptNm", "");
		SBUxMethod.set("srch-inp-cnptCd", "");
		SBUxMethod.set("srch-slt-spcfctCd", "");
		SBUxMethod.set("dtl-inp-apcCnptNm", "");
		SBUxMethod.set("dtl-inp-apcCnptCd", "");
		SBUxMethod.set("dtl-inp-dldtn", "");
		SBUxMethod.set("dtl-inp-cmndYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set("dtl-slt-trsprtCo", "");
		SBUxMethod.set("dtl-inp-rmrk", "");
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, '');
	}

 	const fn_modalCnpt = function() {
     	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnpt"), fn_setCnpt);
 	}

 	const fn_setCnpt = function(cnpt) {
 		if (!gfn_isEmpty(cnpt)) {
 			SBUxMethod.set('srch-inp-apcCnptNm', cnpt.cnptNm);
 			SBUxMethod.set('srch-inp-apcCnptCd', cnpt.cnptCd);
 		}
 	}

	const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

     const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-slt-vrtyNm', vrty.vrtyNm);
			SBUxMethod.set('srch-slt-vrtyCd', vrty.vrtyCd);
		}
	}
     const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyCd = [];
			var _vrtyNm = [];
			for(var i=0;i<vrtys.length;i++){
				_vrtyCd.push(vrtys[i].vrtyCd);
				_vrtyNm.push(vrtys[i].vrtyNm);
			}
			SBUxMethod.set('srch-slt-vrtyCd', _vrtyCd.join(','));
			SBUxMethod.set('srch-slt-vrtyNm', _vrtyNm.join(','));
		}
	}
     
     const fn_dtpChange = function(){
  		let outordrYmdFrom = SBUxMethod.get("srch-dtp-outordrYmdFrom");
  		let outordrYmdTo = SBUxMethod.get("srch-dtp-outordrYmdTo");
  		if(gfn_diffDate(outordrYmdFrom, outordrYmdTo) < 0){
  			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
  			SBUxMethod.set("srch-dtp-outordrYmdFrom", gfn_dateToYmd(new Date()));
  			SBUxMethod.set("srch-dtp-outordrYmdTo", gfn_dateToYmd(new Date()));
  			return;
  		}
 		if(gfn_diffDate(gfn_dateToYmd(new Date()), inptYmdFrom) < 0){
 			gfn_comAlert("E0000", "시작일자는 금일보다 이후 일자입니다.");		//	W0001	{0}
 			SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateToYmd(new Date()));
 			return;
 		}
  	}
     
     const fn_onChangeApc = async function() {
 		let result = await Promise.all([
 			fn_initSBSelect(),
 			jsonSpmtCmndTrg = [],
 			jsonSpmtCmnd = [],
 			grdSpmtCmndTrg.rebuild(),
 			grdSpmtCmnd.rebuild()
 		]);
 	}
</script>
</html>