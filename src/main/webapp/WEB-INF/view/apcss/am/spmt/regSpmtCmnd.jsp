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
				<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btn-srch-inp-outordrInq" name="btn-srch-inp-outordrInq" uitype="normal" text="발주조회" class="btn btn-sm btn-outline-danger"></sbux-button>
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger"></sbux-button>
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
								<sbux-datepicker id="srch-inp-outordrYmdFrom" name="srch-inp-outordrYmdFrom" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-outordrYmdTo"" name="srch-inp-outordrYmdTo" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>

							<th scope="row" class="th_bg">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-warehouseSeCd" name="dtl-slt-warehouseSeCd" uitype="single" jsondata-ref="jsonComWarehouse" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" class="form-control input-sm input-sm-ast inpt_data_reqed" unselected-text="선택" jsondata-ref="jsonComVrty" onchange="fn_selectVrty"></sbux-select>
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
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" class="form-control input-sm" jsondata-ref="jsonComSpcfct"></sbux-select>
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
								<sbux-input id="srch-inp-cnpt" name="srch-inp-cnpt" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td></td>
							<th scope="row" class="th_bg">배송처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-dldtn" name="srch-inp-dldtn" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td></td>
						    <th scope="row" class="th_bg"><span class="data_required"></span>지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-cmndYmd" name="srch-inp-cmndYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input"  style="border-right: hidden;"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>운송회사</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-trsprtCo" name="srch-slt-trsprtCo" uitype="single" jsondata-ref="jsonTrsprtCo" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-rmrk" name="srch-inp-rmrk" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
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
						<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_del"></sbux-button>
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

			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd),		// 창고
			gfn_setComCdSBSelect('srch-slt-itemCd', 		jsonComFclt, 		'FCLT_CD', gv_selectedApcCd),			// 설비
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd),									// 품목
 			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd),									// 품종
			gfn_setSpmtPckgUnitSBSelect('grdSpmtCmndTrg', 	jsonSpmtPckgUnit, 	gv_selectedApcCd),						// 포장구분
			gfn_setComCdSBSelect('grdSpmtCmndTrg', 			jsonComGdsGrd, 		'GDS_GRD'),								// 상품등급
			gfn_setTrsprtsSBSelect('srch-slt-trsprtCo', jsonTrsprtCo, gv_selectedApcCd),								// 운송회사
		]);
	}

	const fn_selectItem = async function(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_apcCd, itemCd);			// 품종
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonComSpcfct, gv_apcCd, itemCd);		// 규격

	}

	const fn_selectVrty = async function(){
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let itemCd = "";
		for(i=0;i<jsonComVrty.length;i++){
			if(jsonComVrty[i].value == vrtyCd){
				itemCd = jsonComVrty[i].mastervalue;
			}
		}

		await gfn_setSpmtPckgUnitSBSelect('grdGdsInvntr', 	jsonSpmtPckgUnit, 	gv_selectedApcCd, itemCd, vrtyCd),		// 포장구분
		grdGdsInvntr.refresh({"combo":true})
	}
	
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createregSpmtCmndGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-inp-outordrYmdFrom", year+month+day);
		SBUxMethod.set("srch-inp-outordrYmdTo", year+month+day);
		SBUxMethod.set("srch-inp-cmndYmd", year+month+day);

		fn_initSBSelect();

	})

	function fn_createregSpmtCmndGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtCmndTrgtDsctn';
	    SBGridProperties.id = 'grdSpmtCmndTrg';
	    SBGridProperties.jsonref = 'jsonSpmtCmndTrg';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['선택'], 		ref: 'checkbox', 			width: '80px', type: 'checkbox', style: 'text-align:center'},
            {caption: ['거래처'], 	ref: 'apcCnptNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['상품명'], 	ref: 'gdsNm', 			width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['배송처'], 	ref: 'dldtn', 			width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['납기일자'], 	ref: 'msgkey', 		width: '120px', type: 'output', style: 'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['품종'], 		ref: 'vrtyNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['발주수량'], 	ref: 'ordrQntt', 		width: '120px', type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['출하수량'], 	ref: 'spmtQntt',	width: '120px', type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['재고수량'], 	ref: 'invntrQntt', 			width: '120px', type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["포장단위"], 			ref: 'spmtPckgUnitCd',   	type:'combo',  width:'120px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonSpmtPckgUnit', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
		    {caption: ["등급"], 			ref: 'gdsGrd',   	type:'combo',  width:'100px',    style:'text-align:center; background:#FFF8DC;',
						typeinfo : {ref:'jsonComGdsGrd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['지시수량'], 	ref: 'inptCmndQntt', 		width: '120px', type: 'input', style: 'text-align:right'},
            {caption: ['지시중량'], 	ref: 'inptCmndWght', 		width: '120px', type: 'output', style: 'text-align:right' ,
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}}
        ];

        var SBGridProperties1 = {};
	    SBGridProperties1.parentid = 'sb-area-grdSpmtCmndDsctn';
	    SBGridProperties1.id = 'grdSpmtCmnd';
	    SBGridProperties1.jsonref = 'jsonSpmtCmnd';
        SBGridProperties1.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties1.selectmode = 'byrow';
	    SBGridProperties1.extendlastcol = 'scroll';
        SBGridProperties1.columns = [
        	{caption: ['선택'], 		ref: 'checkbox', 			width: '80px', type: 'checkbox', style: 'text-align:center'},
            {caption: ['지시일자'], 	ref: 'cmndYmd', 		width: '120px', type: 'output', style: 'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['거래처'], 	ref: 'cnptNm', 			width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['상품명'], 	ref: 'gdsNm', 			width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['운송회사'], 	ref: 'trsprtCoNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['배송처'], 	ref: 'wrhsSeNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['품종'], 		ref: 'trsprtSeNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['수량'], 		ref: 'cmndQntt',	width: '120px', type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['중량'], 		ref: 'cmndWght', 			width: '120px', type: 'output', style: 'text-align:right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['상품등급'], 	ref: 'gdsGrdNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['포장구분'], 	ref: 'spmtPckgUnitNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['비고'], 		ref: 'rmrk', 		width: '120px', type: 'output', style: 'text-align:center'}
        ];
        grdSpmtCmndTrg = _SBGrid.create(SBGridProperties);
        grdSpmtCmndTrg.bind('valuechanged', 'fn_grdSpmtCmndTrg');
        grdSpmtCmnd = _SBGrid.create(SBGridProperties1);
    }
	const fn_grdSpmtCmndTrg = async function(){

    	let nRow = grdSpmtCmndTrg.getRow();
		let nCol = grdSpmtCmndTrg.getCol();
		switch (nCol) {
		case 12:	// checkbox
			if(grdSpmtCmndTrg.getRowData(nRow).inptCmndQntt > jsonSpmtCmndTrg[nRow-1].invntrQntt - jsonSpmtCmndTrg[nRow-1].spmtQntt - jsonSpmtCmndTrg[nRow-1].cmndQntt){
				alert("지시수량은 " + (jsonSpmtCmndTrg[nRow-1].invntrQntt - jsonSpmtCmndTrg[nRow-1].spmtQntt - jsonSpmtCmndTrg[nRow-1].cmndQntt).toString() + "개 까지 입력할 수 있습니다.");
				grdSpmtCmndTrg.setCellData(nRow, nCol , 0);
				grdSpmtCmndTrg.setCellData(nRow, nCol+1 , 0);
			}
			else{
				// 지시중량 = 재고중량/재고수량*지시수량
				grdSpmtCmndTrg.setCellData(nRow, nCol+1 , jsonSpmtCmndTrg[nRow-1].invntrWght/jsonSpmtCmndTrg[nRow-1].invntrQntt * grdSpmtCmndTrg.getRowData(nRow).inptCmndQntt);
			}
			break;
		default:
			return;
		}
    }

	const fn_search = async function(){
		// 출하지시대상 내역 초기화
		grdSpmtCmndTrg.rebuild();
    	let pageSize = grdSpmtCmndTrg.getPageSize();
    	let pageNo = 1;
    	// grid clear
    	jsonSpmtCmndTrg.length = 0;
    	grdSpmtCmndTrg.clearStatus();
    	
    	// 출하지시 내역 초기화
		grdSpmtCmnd.rebuild();
    	pageSize = grdSpmtCmnd.getPageSize();
    	pageNo = 1;

    	// grid clear
    	jsonSpmtCmnd.length = 0;
    	grdSpmtCmnd.clearStatus();
    	
    	try{
	    	await fn_setGrdSpmtCmndTrg(pageSize, pageNo);
	    	await fn_setGrdSpmtCmnd(pageSize, pageNo);
    	} catch(e){
    	}
	}
	
	const fn_setGrdSpmtCmndTrg = async function(pageSize, pageNo){

		let outordrYmdFrom  = SBUxMethod.get("srch-inp-outordrYmdFrom"); //발주 시작일자
		let outordrYmdTo  = SBUxMethod.get("srch-inp-outordrYmdTo"); //발주 종료일자
		let warehouseSeCd  = SBUxMethod.get("dtl-slt-warehouseSeCd"); //창고구분
		
		let itemCd  = SBUxMethod.get("srch-slt-itemCd"); //품목코드
		let vrtyCd  = SBUxMethod.get("srch-slt-vrtyCd"); //품종코드
		let cnptCd  = SBUxMethod.get("srch-inp-cnptCd"); //거래처
		let spcfctCd  = SBUxMethod.get("srch-slt-spcfctCd"); //규격코드

		
    	if(gfn_isEmpty(outordrYmdFrom) || gfn_isEmpty(outordrYmdTo)){
    		gfn_comAlert("W0001", "발주일자");			//	W0002	{0}을/를 선택하세요.
            throw "";
    	}
    	if(gfn_isEmpty(vrtyCd)){
    		gfn_comAlert("W0001", "품종");			//	W0002	{0}을/를 선택하세요.
    		throw "";
    	}
    	
    	const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtCmndTrgList.do", {
			apcCd: gv_selectedApcCd,
			outordrYmdFrom: outordrYmdFrom,
			outordrYmdTo: outordrYmdTo,
			warehouseSeCd: warehouseSeCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			spcfctCd: spcfctCd,
			cnptCd: cnptCd,
			
          	// pagination
  	  		pagingYn : 'N',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});
		
        const data = await postJsonPromise;
		try{
         	/** @type {number} **/
     		let totalRecordCount = 0;

     		jsonSpmtCmndTrg.length = 0;
          	data.resultList.forEach((item, index) => {
          		const pckgCmnd = {
          				apcCd: item.apcCd,
          				apcSeCd: item.apcSeCd,
          				outordrno: item.outordrno,
          				rcptnSeCd: item.rcptnSeCd,
          				rcptnno: item.rcptnno,
          				rcptCfmtnApcCd: item.rcptCfmtnApcCd,
          				rcptCfmtnYmd: item.rcptCfmtnYmd,
          				pckgCmndno: item.pckgCmndno,
          				docno: item.docno,
          				cnptOrdrno: item.cnptOrdrno,
          				outordrType: item.outordrType,
          				wrhsType: item.wrhsType,
          				outordrYmd: item.outordrYmd,
          				outordrPrsn: item.outordrPrsn,
          				outordrPrsnCd: item.outordrPrsnCd,
          				dockInfo: item.dockInfo,
          				splyPrsn: item.splyPrsn,
          				gdsCd: item.gdsCd,
          				itemCd: item.itemCd,
          				vrtyCd: item.vrtyCd,
          				spcfctCd: item.spcfctCd,
          				tpnd: item.tpnd,
          				tpnb: item.tpnb,
          				diamondline: item.diamondline,
          				dldtn: item.dldtn,
          				bxGdsQntt: item.bxGdsQntt,
          				outordrQntt: item.outordrQntt,
          				pieceQntt: item.pieceQntt,
          				unit: item.unit,
          				bxUntprc: item.bxUntprc,
          				outordrUntprc: item.outordrUntprc,
          				outordrUnit: item.outordrUnit,
          				lot: item.lot,
          				txAmt: item.txAmt,
          				outordrAmt: item.outordrAmt,
          				dldtnCd: item.dldtnCd,
          				wrhsYmd: item.wrhsYmd,
          				dlvgdsNm: item.dlvgdsNm,
          				dlvgdsCd: item.dlvgdsCd,
          				apcCnptNm: item.apcCnptNm,
          				apcCnptCd: item.apcCnptCd,
          				cntrSe: item.cntrSe,
          				cntrRcvdWrhsYmd: item.cntrRcvdWrhsYmd,
          				cntrCd: item.cntrCd,
          				cntrNm: item.cntrNm,
          				dlvgdsSeCd: item.dlvgdsSeCd,
          				etc: item.etc,
          				delYn: item.delYn,
          				vrtyNm: item.vrtyNm,
          				spcfctNm: item.spcfctNm,
          				spmtQntt: item.spmtQntt,
          				spmtWght: item.spmtWght,
          				invntrQntt: item.invntrQntt,
          				invntrWght: item.invntrWght,
          				cmndQntt: item.cmndQntt
				}
      			jsonSpmtCmndTrg.push(pckgCmnd);
	
				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
	
	      	if (jsonSpmtCmndTrg.length > 0) {
	      		if(grdSpmtCmndTrg.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	      			grdSpmtCmndTrg.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	      			grdSpmtCmndTrg.rebuild();
					}else{
						grdSpmtCmndTrg.refresh();
					}
	      	} else {
	      		grdSpmtCmndTrg.setPageTotalCount(totalRecordCount);
	      		grdSpmtCmndTrg.rebuild();
	      	}
	   } catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
    }
	
	const fn_setGrdSpmtCmnd = async function(pageSize, pageNo){
		let cmndYmd = SBUxMethod.get("srch-inp-cmndYmd"); // 지시일자
		let itemCd  = SBUxMethod.get("srch-slt-itemCd"); // 품목코드
		let vrtyCd  = SBUxMethod.get("srch-slt-vrtyCd"); // 품종코드

		
    	if(gfn_isEmpty(cmndYmd)){
    		gfn_comAlert("W0001", "지시일자");			//	W0002	{0}을/를 선택하세요.
    		throw "";
    	}
    	
    	const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtCmndList.do", {
			apcCd: gv_selectedApcCd,
			cmndYmd: cmndYmd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			
          	// pagination
  	  		pagingYn : 'N',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});
		
        const data = await postJsonPromise;
		try{
         	/** @type {number} **/
     		let totalRecordCount = 0;

     		jsonSpmtCmnd.length = 0;
          	data.resultList.forEach((item, index) => {
          		const pckgCmnd = {
          				apcCd: item.apcCd,
          				spmtCmndno: item.spmtCmndno,
          				spmtCmndSn: item.spmtCmndSn,
          				cmndYmd: item.cmndYmd,
          				cnptCd: item.cnptCd,
          				dldtn: item.dldtn,
          				trsprtCoCd: item.trsprtCoCd,
          				gdsGrd: item.gdsGrd,
          				cmndQntt: item.cmndQntt,
          				cmndWght: item.cmndWght,
          				spmtPckgUnitCd: item.spmtPckgUnitCd,
          				spmtPckgUnitNm: item.spmtPckgUnitNm,
          				outordrno: item.outordrno,
          				itemCd: item.itemCd,
          				vrtyCd: item.vrtyCd,
          				spcfctCd: item.spcfctCd,
          				gdsCd: item.gdsCd,
          				rmrk: item.rmrk,
          				delYn: item.delYn,
          				pckgSe: item.pckgSe,
          				vrtyNm: item.vrtyNm,
          				spcfctNm: item.spcfctNm,
          				gdsGrdNm: item.gdsGrdNm,
          				cnptNm: item.cnptNm,
          				trsprtCoNm: item.trsprtCoNm,
				}
      			jsonSpmtCmnd.push(pckgCmnd);
	
				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
	
	      	if (jsonSpmtCmnd.length > 0) {
	      		if(grdSpmtCmnd.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
	      			grdSpmtCmnd.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
	      			grdSpmtCmnd.rebuild();
					}else{
						grdSpmtCmnd.refresh();
					}
	      	} else {
	      		grdSpmtCmnd.setPageTotalCount(totalRecordCount);
	      		grdSpmtCmnd.rebuild();
	      	}
	   } catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
		}
    }
	
	const fn_save = async function() {
		
		var grdRows = grdSpmtCmndTrg.getCheckedRows(0);
		let cmndYmd = SBUxMethod.get("srch-inp-cmndYmd");
		let trsprtCo = SBUxMethod.get("srch-slt-trsprtCo");
		let rmrk = SBUxMethod.get("srch-inp-rmrk");
		
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
			console.log("jsonSpmtCmndTrg", jsonSpmtCmndTrg[nRow-1]);
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
	
	const fn_del = async function(){
		let grdRows = grdSpmtCmnd.getCheckedRows(0);
    	let deleteList = [];


    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		deleteList.push(jsonSpmtCmnd[nRow-1]);
    	}
		console.log(deleteList);
    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "삭제");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	let regMsg = "삭제 하시겠습니까?";
		if(confirm(regMsg)){
			const postJsonPromise = gfn_postJSON("/am/spmt/deleteSpmtCmndList.do", deleteList);
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
	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
	
 	const fn_modalCnpt = function() {
     	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnpt"), fn_setCnpt);
 	}
 	
 	const fn_setCnpt = function(cnpt) {
 		if (!gfn_isEmpty(cnpt)) {
 			SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
 			SBUxMethod.set('srch-inp-cnptCd', cnpt.cnptCd);
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
</script>
</html>