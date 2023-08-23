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
				<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger"></sbux-button>
				<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger"></sbux-button>
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
								<sbux-datepicker id="srch-inp-outordrYmd1" name="srch-inp-outordrYmd1" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-outordrYmd2" name="srch-inp-outordrYmd2" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>

							<th scope="row" class="th_bg">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-warehouseSeCd" name="dtl-slt-warehouseSeCd" uitype="single" jsondata-ref="jsonComWarehouse" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-itemCd" name="dtl-slt-itemCd" uitype="single" jsondata-ref="jsonApcItem" unselected-text="전체" class="form-control input-sm" onchange="fn_selectItem" ></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm" ></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-vrtySrch" name="srch-btn-vrtySrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
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

					<div id="sb-area-grdSpmtCmndTrgtDsctn" style="height:300px;"></div>
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
					  		<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-item" name="srch-inp-item" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vrty" name="srch-inp-vrty" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>

							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-vrtySrch" name="srch-btn-vrtySrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
							<th scope="row" class="th_bg">배송처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-dldtn" name="srch-inp-dldtn" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td></td>
						</tr>
						<tr>
						    <th scope="row" class="th_bg"><span class="data_required"></span>지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-cmndYmd" name="srch-inp-cmndYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input"  style="border-right: hidden;"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>운송회사</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-trsprtCo" name="srch-slt-trsprtCo" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-gdsGrd" name="srch-slt-gdsGrd" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>지시수량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cmndQntt" name="srch-inp-cmndQntt" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th class="th_bg" scope="row" style="border-right: hidden;">지시중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cmndWght" name="srch-inp-cmndWght" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							<td class="td_input" style="border-right: hidden;">Kg</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg" style="border-right: hidden;">포장구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-frmlSe" name="srch-slt-frmlSe" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-rmrk" name="srch-inp-rmrk" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
							<td colspan="8" class="td_input">&nbsp;</td>
						</tr>
					</tbody>
				</table>

			<div class="ad_tbl_top">
				<ul class="ad_tbl_count">
					<li><span>출하지시 내역</span></li>
				</ul>
			</div>
			<div id="sb-area-grdSpmtCmndDsctn" style="height:300px;"></div>
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
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComSpcfct		= [];	// 규격 		spcfct		검색
	var jsonComFclt			= [];	// 설비 		fcltCd		검색

	var jsonSpmtCmndTrg		= [];
	var jsonSpmtCmnd		= [];
	
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([

			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
			gfn_setComCdSBSelect('srch-slt-inptFclt', 		jsonComFclt, 		'FCLT_CD', gv_selectedApcCd),			// 설비
		 	gfn_setApcItemSBSelect('dtl-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
// 			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
		]);
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		//gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_selectedApcCd, itemCd);			// 품종
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonComSpcfct, gv_selectedApcCd, itemCd);		// 규격
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createregSpmtCmndGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-inp-outordrYmd1", year+month+day);
		SBUxMethod.set("srch-inp-outordrYmd2", year+month+day);
		SBUxMethod.set("srch-inp-cmndYmd", year+month+day);

		fn_initSBSelect();

	})

	function fn_createregSpmtCmndGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtCmndTrgtDsctn';
// 	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.id = 'grdSpmtCmndTrg';
// 	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonSpmtCmndTrg';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 15,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
        SBGridProperties.columns = [
            {caption: ['선택'], 		ref: 'checkbox', 			width: '10%', type: 'checkbox'},
            {caption: ['거래처'], 	ref: 'apcCnptNm', 		width: '10%', type: 'output'},
            {caption: ['상품명'], 	ref: 'gdsNm', 			width: '10%', type: 'output'},
            {caption: ['배송처'], 	ref: 'dldtn', 			width: '10%', type: 'output'},
            {caption: ['납기일자'], 	ref: 'msgkey', 		width: '10%', type: 'output'},
            {caption: ['품종'], 		ref: 'vrtyNm', 		width: '10%', type: 'output'},
            {caption: ['규격'], 		ref: 'spcfctNm', 		width: '10%', type: 'output'},
            {caption: ['발주수량'], 	ref: 'ordrQntt', 		width: '10%', type: 'output'},
            {caption: ['출하수량'], 	ref: 'spmtQntt',	width: '10%', type: 'output'},
            {caption: ['재고수량'], 	ref: 'invntrQntt', 			width: '10%', type: 'output'},
            {caption: ['지시수량'], 	ref: 'cmndQntt', 		width: '10%', type: 'output'},
            {caption: ['지시중량'], 	ref: 'cmndWght', 		width: '10%', type: 'output'}
        ];

        var SBGridProperties1 = {};
	    SBGridProperties1.parentid = 'sb-area-grdSpmtCmndDsctn';
// 	    SBGridProperties1.id = 'grdWghPrfmnc1';
// 	    SBGridProperties1.jsonref = 'jsonWghPrfmnc1';
	    SBGridProperties1.id = 'grdSpmtCmnd';
	    SBGridProperties1.jsonref = 'jsonSpmtCmnd';
        SBGridProperties1.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties1.selectmode = 'byrow';
	    SBGridProperties1.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 15,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
        SBGridProperties1.columns = [
            {caption: ['선택'], 		ref: 'wghno', 			width: '10%', type: 'output'},
            {caption: ['지시일자'], 	ref: 'prdcrNm', 		width: '10%', type: 'output'},
            {caption: ['거래처'], 	ref: 'itemNm', 			width: '10%', type: 'output'},
            {caption: ['상품명'], 	ref: 'vrtyNm', 			width: '10%', type: 'output'},
            {caption: ['운송회사'], 	ref: 'gdsSeNm', 		width: '10%', type: 'output'},
            {caption: ['배송처'], 	ref: 'wrhsSeNm', 		width: '10%', type: 'output'},
            {caption: ['품종'], 		ref: 'trsprtSeNm', 		width: '10%', type: 'output'},
            {caption: ['규격'], 		ref: 'wholWght', 		width: '10%', type: 'output'},
            {caption: ['수량'], 		ref: 'emptVhclWght',	width: '10%', type: 'output'},
            {caption: ['중량'], 		ref: 'rdcdRt', 			width: '10%', type: 'output'},
            {caption: ['상품등급'], 	ref: 'rdcdWght', 		width: '10%', type: 'output'},
            {caption: ['포장구분'], 	ref: 'actlWght', 		width: '10%', type: 'output'},
            {caption: ['비고'], 		ref: 'actlWght', 		width: '10%', type: 'output'}
        ];
        grdSpmtCmndTrg = _SBGrid.create(SBGridProperties);
        grdSpmtCmnd = _SBGrid.create(SBGridProperties1);
	    grdSpmtCmndTrg.bind( "afterpagechanged" , "fn_pagingPckgCmndList" );
    }
	async function fn_pagingPckgCmndList(){
    	let recordCountPerPage = grdSpmtCmndTrg.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdSpmtCmndTrg.getSelectPageIndex(); 
    	fn_setGrdPckgCmnd(recordCountPerPage, currentPageNo);
    }

	const fn_search = async function(){
		grdSpmtCmndTrg.rebuild();
    	let pageSize = grdSpmtCmndTrg.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonSpmtCmndTrg.length = 0;
    	grdSpmtCmndTrg.clearStatus();
    	await fn_setGrdSpmtCmndTrg(pageSize, pageNo);
	}
	
	const fn_setGrdSpmtCmndTrg = async function(pageSize, pageNo){

// 		let pckgCmndFromYmd  = SBUxMethod.get("srch-dtp-strtCmndYmd"); //포장지시 시작일자
// 		let pckgCmndToYmd  = SBUxMethod.get("srch-dtp-endCmndYmd"); //포장지시 종료일자
// 		let fcltCd  = SBUxMethod.get("srch-slt-fclt"); //설비코드
// 		let dudtYmd  = SBUxMethod.get("srch-dtp-dudtYmd"); //납기일자
// 		let itemCd  = SBUxMethod.get("srch-slt-itemCd"); //품목코드
// 		let vrtyCd  = SBUxMethod.get("srch-inp-vrtyCd"); //품종코드
// 		let spcfctCd  = SBUxMethod.get("srch-slt-spcfctCd"); //규격코드
// 		let ordrNo  = SBUxMethod.get("srch-inp-gdsNo"); //발주번호
// 		let cnptCd  = SBUxMethod.get("srch-inp-cnptCd");
    	const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtCmndTrgList.do", {
			apcCd: gv_selectedApcCd,
// 			pckgCmndFromYmd: pckgCmndFromYmd,
// 			pckgCmndToYmd: pckgCmndToYmd,
// 			cnptCd: cnptCd,
// 			fcltCd: fcltCd,
// 			dudtYmd: dudtYmd,
// 			itemCd: itemCd,
// 			vrtyCd: vrtyCd,
// 			spcfctCd: spcfctCd,
// 			ordrNo: ordrNo,
			
          	// pagination
  	  		pagingYn : 'Y',
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
          				invntrQntt: item.invntrQntt
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
	      	document.querySelector('#listCount').innerText = totalRecordCount;
	   } catch (e) {
	 		if (!(e instanceof Error)) {
	 			e = new Error(e);
	 		}
	 		console.error("failed", e.message);
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
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
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
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCd.join(','));
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNm.join(','));
		}
	}
</script>
</html>