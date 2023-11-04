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
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3><!-- 발주정보조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-dark" text="조회" onclick="fn_search"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[pp] 검색 -->
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
					        <th scope="row" class="th_bg">접수여부</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-rcptYn" name="srch-slt-rcptYn" uitype="single" unselected-text="전체" jsondata-ref="jsonRcptYn" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>발주일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-outordrYmdFrom" name="srch-dtp-outordrYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-outordrYmdFrom)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-outordrYmdTo" name="srch-dtp-outordrYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-outordrYmdTo)"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">발주유형</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-outordrType" name="srch-slt-outordrType" uitype="single" unselected-text="전체" jsondata-ref="jsonComOutordrType" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
						    <td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											unselected-text="전체"
											uitype="single"
											id="srch-slt-itemCd"
											name="srch-slt-itemCd"
											class="form-control input-sm"
											jsondata-ref="jsonApcItem"
											onchange="fn_onChangeSrchItemCd(this)"
										/>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											unselected-text="전체"
											uitype="single"
											id="srch-slt-vrtyCd"
											name="srch-slt-vrtyCd"
											class="form-control input-sm"
											jsondata-ref="jsonApcVrty"
											onchange="fn_onChangeSrchVrtyCd(this)"
										/>
									</div>
								</div>
							</td>
							<td></td>
						    <th scope="row" class="th_bg">거래처명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<th scope="row" class="th_bg">납기일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-dudtYmd" name="srch-dtp-dudtYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm" onchange="fn_dtpChange(srch-dtp-dudtYmd)"></sbux-datepicker>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">상품명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spmtPckgUnitNm" name="srch-inp-spmtPckgUnitNm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchGdsNm" name="btnSrchGdsNm" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-gds" onclick="fn_modalGds" text="찾기"></sbux-button>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span><sbux-label id="srch-lbl-cmndYmd" name="srch-lbl-cmndYmd" uitype="normal" text="지시일자" class="bold"></sbux-label></th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-cmndYmd" name="srch-dtp-cmndYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm-ast inpt_data_reqed input-sm" onchange="fn_dtpChange(srch-dtp-cmndYmd)"></sbux-datepicker>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg" style="border-right: hidden;"><span class="data_required"></span></span><sbux-label id="srch-lbl-trsprtCoCd" name="srch-lbl-trsprtCoCd" uitype="normal" text="운송회사" class="bold"></sbux-label></th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-trsprtCoCd" name="srch-slt-trsprtCoCd" uitype="single" jsondata-ref="jsonTrsprtCoCd" class="form-control input-sm-ast inpt_data_reqed input-sm" unselected-text="전체"></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg" style="border-right: hidden;"></span><sbux-label id="srch-lbl-rmrk" name="srch-lbl-rmrk" uitype="normal" text="비고" class="bold"></sbux-label></th>
							<td colspan="3" class="td_input">
								<sbux-input id="srch-inp-rmrk" name="srch-inp-rmrk" uitype="text" maxlength="333" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->

				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li><span>발주 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnRcptOrdrAll" name="btnReceiptBndl" uitype="normal" onclick="btn_receiptBndl" class="btn btn-sm btn-outline-dark" text="일괄 접수"></sbux-button>
						<sbux-button id="btnRegPrdctnCmnd" name="btnRegPrdctnCmnd" uitype="normal" onclick="fn_regSpmtCmnd" class="btn btn-sm btn-outline-dark" text="출하지시 등록"></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdOutordrInfo" style="width:100%;height:460px;"></div>
				</div>
				<!--[pp] //검색결과 -->

			</div>
		</div>
	</section>
	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
    <!-- 상품 선택 Modal -->
    <div>
        <sbux-modal id="modal-gds" name="modal-gds" uitype="middle" header-title="상품 선택" body-html-id="body-modal-gds" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-gds">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/gdsPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonOutordrInfo 	= [];

	var jsonApcItem			= [];															// 품목
	var jsonApcVrty			= [];															// 품종
	var jsonRcptYn			= [];															// 접수여부
	var jsonComOutordrType	= [];															// 발주유형
	var jsonTrsprtCoCd		= [];															// 운송회사

	var comboGridRcpYn 		= [{label: "접수", value: "Y"}, {label: "미접수", value: "N"}];	// 접수여부 (그리드)

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 	 jsonApcItem, 			gv_selectedApcCd),							// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	 jsonApcVrty, 			gv_selectedApcCd),							// 품종
			gfn_setComCdSBSelect('srch-slt-outordrType', jsonComOutordrType,	'OUTORDR_TYPE'),							// 발주유형
			gfn_setTrsprtsSBSelect('srch-slt-trsprtCoCd', jsonTrsprtCoCd, gv_selectedApcCd),								// 운송회사
			setRcptYnSBSelect('srch-slt-rcptYn', 		 jsonRcptYn),														// 접수여부
			SBUxMethod.refresh('grdOutordrInfo')																			// 접수여부 (그리드)
		]);
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-outordrYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-outordrYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-cmndYmd", gfn_dateToYmd(new Date()));

		fn_createOutordrInfoGrid();
		fn_initSBSelect();
		fn_search();
	});

	const fn_dtpChange = function(){
		let cmndYmd = SBUxMethod.get("srch-dtp-cmndYmd");
		let dudtYmd = SBUxMethod.get("srch-dtp-dudtYmd");
		let outordrYmdFrom = SBUxMethod.get("srch-dtp-outordrYmdFrom");
		let outordrYmdTo = SBUxMethod.get("srch-dtp-outordrYmdTo");
		if(gfn_diffDate(outordrYmdFrom, outordrYmdTo) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
			SBUxMethod.set("srch-dtp-outordrYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-outordrYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
		if(gfn_diffDate(outordrYmdTo, cmndYmd) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
			SBUxMethod.set("srch-dtp-cmndYmd",outordrYmdTo);
			return;
		}
		if(gfn_diffDate(outordrYmdTo, dudtYmd) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
			SBUxMethod.set("srch-dtp-dudtYmd",outordrYmdTo);
			return;
		}

	}

	function fn_createOutordrInfoGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdOutordrInfo';
	    SBGridProperties.id = 'grdOutordrInfo';
	    SBGridProperties.jsonref = 'jsonOutordrInfo';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';
		SBGridProperties.frozencols = 1
    	SBGridProperties.paging = {
    			'type' : 'page',
    		  	'count' : 5,
    		  	'size' : 20,
    		  	'sorttype' : 'page',
    		  	'showgoalpageui' : true
    	    };
        SBGridProperties.columns = [
        	{caption: ['선택'], 			ref: 'checked', 		width: '50px', 		type: 'checkbox',		style:'text-align: center',	sortable: false,
        		typeinfo : {ignoreupdate: true}},
            {caption: ['접수일자'], 		ref: 'rcptCfmtnYmd', 	width: '100px', 	type: 'output',			style:'text-align: center', sortable: false,
    		    format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
            {caption: ['발주유형'], 		ref: 'outordrTypeNm', 	width: '70px', 		type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['접수여부'], 		ref: 'rcptYn', 			width: '70px', 		type: 'combo',			style:'text-align: center', sortable: false,
            	typeinfo : {ref:'comboGridRcpYn', label:'label', value:'value'}},
            {caption: ['발주번호'], 		ref: 'outordrno', 		width: '140px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['거래처명'], 		ref: 'apcCnptNm', 		width: '200px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['납기일자'], 		ref: 'wrhsYmd', 		width: '100px', 	type: 'output',			style:'text-align: center', sortable: false,
    		    format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
            {caption: ['발주일자'], 		ref: 'outordrYmd', 		width: '100px', 	type: 'output',			style:'text-align: center', sortable: false,
        		format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
            {caption: ['주문자'], 		ref: 'outordrPrsn', 	width: '100px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['공급자명'], 		ref: 'splyPrsn', 		width: '100px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['상품명'], 		ref: 'spmtPckgUnitNm', 	width: '150px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['상품코드'], 		ref: 'spmtPckgUnitCd', 	width: '100px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['배송지'], 		ref: 'dldtn', 			width: '100px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['품목'], 			ref: 'itemNm', 			width: '100px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['품종'], 			ref: 'vrtyNm', 			width: '100px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['규격'], 			ref: 'spcfctNm', 		width: '70px', 		type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['입수'], 			ref: 'bxGdsQntt', 		width: '100px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['발주수량'], 		ref: 'outordrQntt', 	width: '70px', 		type: 'output',			style:'text-align: right',  sortable: false,
				format : {type:'number', rule:'#,###'}},
            {caption: ['낱개수량'], 		ref: 'pieceQntt', 		width: '70px', 		type: 'output',			style:'text-align: right',  sortable: false,
				format : {type:'number', rule:'#,###'}},
            {caption: ['단위'], 			ref: 'unitCd', 			width: '70px', 		type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['박스단가'], 		ref: 'bxUntprc', 		width: '100px', 	type: 'output',			style:'text-align: right',  sortable: false,
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###원'}},
            {caption: ['발주단가'], 		ref: 'outordrUntprc', 	width: '100px', 	type: 'output',			style:'text-align: right',  sortable: false,
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###원'}},
            {caption: ['발주단위'], 		ref: 'outordrUnitCd', 	width: '70px', 		type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['LOT'], 			ref: 'lot', 			width: '100px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['세액'], 			ref: 'txAmt', 			width: '100px', 	type: 'output',			style:'text-align: right',  sortable: false,
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###원'}},
            {caption: ['발주금액'], 		ref: 'outordrAmt', 		width: '100px', 	type: 'output',			style:'text-align: right',  sortable: false,
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###원'}},
  	        {caption: ['재고수량'], 		ref: 'invntrQntt', 		width: '100px', 	type: 'output', 		style:'text-align:right',   sortable: false,
  				format : {type:'number', rule:'#,###'}},
            {caption: ['출하수량'], 		ref: 'spmtQntt',		width: '100px', 	type: 'output', 		style:'text-align:right',   sortable: false,
  				format : {type:'number', rule:'#,###'}},
            {caption: ['출하지시수량'], 	ref: 'cmndQntt',		width: '100px', 	type: 'output', 		style:'text-align:right',   sortable: false,
  				format : {type:'number', rule:'#,###'}},
            {caption: ['지시수량'], 		ref: 'inptCmndQntt', 	width: '80px', 		type: 'input', 			style:'text-align:right; background:#FFF8DC;',	sortable: false,
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}, validate : gfn_chkByte.bind({byteLimit: 10})},
            {caption: ['지시중량'], 		ref: 'inptCmndWght', 	width: '100px', 	type: 'output', 		style:'text-align:right',   sortable: false,
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['입고형태'], 		ref: 'wrhsType', 		width: '100px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['문서번호'], 		ref: 'docno', 			width: '100px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['도크정보'], 		ref: 'dockInfo', 		width: '100px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['센터구분'], 		ref: 'cntrSe', 			width: '70px', 		type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['바이어명'], 		ref: 'buyerNm', 		width: '100px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['센터입하일'], 		ref: 'cntrRcvdWrhsYmd', width: '100px', 	type: 'output',			style:'text-align: center', sortable: false,
    		    format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
            {caption: ['센터명'], 		ref: 'cntrNm', 			width: '100px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['납품구분'], 		ref: 'dlvgdsSeCd', 		width: '70px', 		type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['기타'], 			ref: 'etc', 			width: '300px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['접수APC (농협)'], ref: 'rcptCfmtnApcNm', 	width: '200px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['출하지시번호'], 	ref: 'spmtCmndno', 		width: '140px', 	type: 'output',			style:'text-align: center', sortable: false},
            {caption: ['출하일자'], 		ref: 'spmtYmd', 		width: '100px', 	type: 'output',			style:'text-align: center', sortable: false,
    		    format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
            {caption: ['지시일자'], 		ref: 'cmndYmd', 		hidden: true},
            {caption: ['운송회사코드'], 	ref: 'trsprtCoCd', 		hidden: true},
            {caption: ['비고'],	 		ref: 'rmrk', 			hidden: true},
            {caption: ['상품등급'],	 	ref: 'gdsGrd', 			hidden: true},
            {caption: ['단위중량'],	 	ref: 'wght', 			hidden: true},
            {caption: ['APC코드'], 		ref: 'apcCd', 			hidden: true},
            {caption: ['APC구분코드'], 	ref: 'apcSeCd', 		hidden: true},
            {caption: ['거래처코드'], 		ref: 'apcCnptCd', 		hidden: true},
            {caption: ['품목코드'], 		ref: 'itemCd', 			hidden: true},
            {caption: ['품종코드'], 		ref: 'vrtyCd', 			hidden: true},
            {caption: ['규격코드'], 		ref: 'spcfctCd', 		hidden: true},
            {caption: ['삭제유무'], 		ref: 'delYn', 			hidden: true}
        ];
        grdOutordrInfo = _SBGrid.create(SBGridProperties);
        grdOutordrInfo.bind( "afterpagechanged" , "fn_pagingOutordrInfoList" );
        grdOutordrInfo.bind('valuechanged', 'fn_grdCmndQnttValueChanged');
        grdOutordrInfo.bind('select', 'fn_setValue');
        grdOutordrInfo.bind('deselect', 'fn_delValue');
    }

	// 출하지시 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdOutordrInfo.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdOutordrInfo.movePaging(currentPageNo);
    }

	let newJsonOutordrInfo = [];

	// 출하지시 목록 조회 호출
	async function fn_callSelectOutordrInfoList(recordCountPerPage, currentPageNo){
		jsonOutordrInfo = [];
		let apcCd = gv_selectedApcCd;
		let rcptYn = SBUxMethod.get("srch-slt-rcptYn");
		let outordrYmdFrom = SBUxMethod.get("srch-dtp-outordrYmdFrom");
		let outordrYmdTo = SBUxMethod.get("srch-dtp-outordrYmdTo");
		let outordrType = SBUxMethod.get("srch-slt-outordrType");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let cnptNm = SBUxMethod.get("srch-inp-cnptNm");
		let dudtYmd = SBUxMethod.get("srch-dtp-dudtYmd");
		let spmtPckgUnitNm = SBUxMethod.get("srch-inp-spmtPckgUnitNm");
// 		let apcSeCd = ;
		if (gfn_isEmpty(outordrYmdFrom)){
			gfn_comAlert("W0002", "발주일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(outordrYmdTo)){
			gfn_comAlert("W0002", "발주일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		let OrdrVO = {apcCd 				: apcCd
//				    , apcSeCd 				: apcSeCd
			        , rcptYn 				: rcptYn
					, outordrYmdFrom 		: outordrYmdFrom
					, outordrYmdTo 			: outordrYmdTo
					, outordrType 			: outordrType
					, itemCd 				: itemCd
					, vrtyCd 				: vrtyCd
					, apcCnptNm 			: cnptNm
					, wrhsYmd 				: dudtYmd
					, spmtPckgUnitNm 		: spmtPckgUnitNm
					, pagingYn 				: 'Y'
					, currentPageNo 		: currentPageNo
					, recordCountPerPage 	: recordCountPerPage};
    	let postJsonPromise = gfn_postJSON("/am/ordr/selectOrdrList.do", OrdrVO);
        let data = await postJsonPromise;
        newJsonOutordrInfo = [];
        try{
        	data.resultList.forEach((item, index) => {
				let ordr = {
					  checked 				: "false"
					, rcptCfmtnYmd 			: item.rcptCfmtnYmd
					, outordrTypeNm 		: item.outordrTypeNm
					, rcptYn 				: null
					, outordrno 			: item.outordrno
					, apcCnptNm	 			: item.apcCnptNm
					, wrhsYmd 				: item.wrhsYmd
					, outordrYmd 			: item.outordrYmd
					, outordrPrsn 			: item.outordrPrsn
					, splyPrsn 				: item.splyPrsn
					, spmtPckgUnitNm 		: item.spmtPckgUnitNm
					, spmtPckgUnitCd		: item.spmtPckgUnitCd
					, dldtn 				: item.dldtn
					, itemNm 				: item.itemNm
					, vrtyNm 				: item.vrtyNm
					, spcfctNm 				: item.spcfctNm
					, bxGdsQntt 			: item.bxGdsQntt
					, outordrQntt			: item.outordrQntt
					, pieceQntt				: item.pieceQntt
					, unitCd				: item.unitCd
					, bxUntprc				: item.bxUntprc
					, outordrUntprc			: item.outordrUntprc
					, outordrUnitCd			: item.outordrUnitCd
					, lot					: item.lot
					, txAmt					: item.txAmt
					, outordrAmt			: item.outordrAmt
					, wrhsType				: item.wrhsType
					, docno					: item.docno
					, dockInfo				: item.dockInfo
					, cntrSe				: item.cntrSe
					, buyerNm				: item.buyerNm
					, cntrRcvdWrhsYmd		: item.cntrRcvdWrhsYmd
					, cntrNm				: item.cntrNm
					, dlvgdsSeCd			: item.dlvgdsSeCd
					, etc					: item.etc
					, rcptCfmtnApcNm		: item.rcptCfmtnApcNm
					, spmtCmndno			: item.spmtCmndno
					, spmtYmd				: item.spmtYmd
					, invntrQntt			: item.invntrQntt
					, invntrWght			: item.invntrWght
					, spmtQntt				: item.spmtQntt
					, spmtWght				: item.spmtWght
					, cmndQntt				: item.cmndQntt
					, cmndWght				: item.cmndWght
					, gdsGrd 				: item.gdsGrd
					, wght	 				: item.wght
					, apcCd 				: item.apcCd
					, apcSeCd 				: item.apcSeCd
					, apcCnptCd 			: item.apcCnptCd
					, itemCd 				: item.itemCd
					, vrtyCd 				: item.vrtyCd
					, spcfctCd 				: item.spcfctCd
					, delYn					: item.delYn
				}
				if(!gfn_isEmpty(ordr.rcptCfmtnYmd)){
					ordr.rcptYn = 'Y';
				} else {
					ordr.rcptYn = 'N';
				}
				jsonOutordrInfo.push(Object.assign({}, ordr));
				newJsonOutordrInfo.push(Object.assign({}, ordr));
			});
        	if(jsonOutordrInfo.length > 0){
				if(grdOutordrInfo.getPageTotalCount() != data.resultList[0].totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdOutordrInfo.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdOutordrInfo.rebuild();
				}else{
					grdOutordrInfo.refresh();
				}
			}else{
				grdOutordrInfo.setPageTotalCount(0);
				grdOutordrInfo.rebuild();
			}
        	// 체크박스 유무
        	for ( let i=1; i<=grdOutordrInfo.getGridDataAll().length; i++ ){
    			const rowData = grdOutordrInfo.getRowData(i);
    			if (!gfn_isEmpty(rowData.spmtCmndno)){
    				grdOutordrInfo.setCellDisabled(i, 0, i, 0, true);
    			}
    		}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}

	// 페이징
    async function fn_pagingOutordrInfoList(){
    	let recordCountPerPage = grdOutordrInfo.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdOutordrInfo.getSelectPageIndex();
    	fn_callSelectOutordrInfoList(recordCountPerPage, currentPageNo);
    }

	// 일괄 접수
    async function btn_receiptBndl(){
    	let allData = grdOutordrInfo.getGridDataAll();
		const rcptOrdrAllList = [];

		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdOutordrInfo.getRowData(i);
			const rowSts = grdOutordrInfo.getRowStatus(i);
			if (rowData.checked == "true"){
				if (rowSts === 2){
					rowData.rowSts = "U";
					if (rowData.rcptYn == 'N'){
						rowData.rcptCfmtnYmd = null;
					} else {
						rowData.rcptCfmtnApcCd = gv_selectedApcCd;
						rowData.rcptCfmtnYmd = gfn_dateToYmd(new Date());
					}
					rcptOrdrAllList.push(rowData);
				} else {
					continue;
				}
			}
		}

		if (rcptOrdrAllList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}
		if (!gfn_comConfirm("Q0001", "접수")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

    	const postJsonPromise = gfn_postJSON("/am/ordr/multiOrdrList.do", rcptOrdrAllList, this.prgrmId);	// 프로그램id 추가
		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_callSelectOutordrInfoList();
        		fn_search();
        	} else {
        		//gfn_comAlert(data.resultCode, data.resultMessage);
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
    }

    const fn_grdCmndQnttValueChanged = async function(){

    	let nRow = grdOutordrInfo.getRow();
		let nCol = grdOutordrInfo.getCol();
		let inptCmndQnttCol = grdOutordrInfo.getColRef("inptCmndQntt");
		switch (nCol) {
		case inptCmndQnttCol:	// checkbox
			fn_checkInptQntt();
			break;
		default:
			return;
		}
    }

    const fn_checkInptQntt = async function(){

    	let nRow = grdOutordrInfo.getRow();
		let nCol = grdOutordrInfo.getCol();

		let invntrQntt 		= grdOutordrInfo.getRowData(nRow).invntrQntt;
		let spmtQntt 		= grdOutordrInfo.getRowData(nRow).spmtQntt;
		let outordrQntt 	= grdOutordrInfo.getRowData(nRow).outordrQntt;
		let cmndQntt 		= grdOutordrInfo.getRowData(nRow).cmndQntt;
		let inptCmndQntt 	= grdOutordrInfo.getRowData(nRow).inptCmndQntt;
		let psbltyCmndQntt 	= outordrQntt - cmndQntt;
		let wght 			= grdOutordrInfo.getRowData(nRow).wght;
		let inptCmndQnttCol = grdOutordrInfo.getColRef("inptCmndQntt");
		let inptCmndWghtCol = grdOutordrInfo.getColRef("inptCmndWght");
		let checkedCol 		= grdOutordrInfo.getColRef("checked");

		// 지시가능한수량 > 입력한지시수량
		if(inptCmndQntt > psbltyCmndQntt){
			gfn_comAlert("W0008", "지시가능수량", "지시수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdOutordrInfo.setCellData(nRow, inptCmndQnttCol , "");
			grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, "");
			grdOutordrInfo.setCellData(nRow, checkedCol, "false");
            return;
		}
		if(invntrQntt >= inptCmndQntt){
			grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, inptCmndQntt*wght);
			grdOutordrInfo.setCellData(nRow, checkedCol, "true");
		}else{
			gfn_comAlert("W0008", "재고수량", "지시수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdOutordrInfo.setCellData(nRow, inptCmndQnttCol, "");
			grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, "");
			grdOutordrInfo.setCellData(nRow, checkedCol, "false");
			return;
		}
		if(inptCmndQntt == 0){
			grdOutordrInfo.setCellData(nRow, inptCmndQnttCol, "");
			grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, "");
			grdOutordrInfo.setCellData(nRow, checkedCol, "false");
		}
    }

    const fn_setValue = function(){

    	let nRow = grdOutordrInfo.getRow();
    	let nCol = grdOutordrInfo.getCol();
    	if(nCol == 0){
    		// 발주수량 - 출하수량 - 출하지시수량 = 가능한 지시수량
	    	let invntrQntt 		= grdOutordrInfo.getRowData(nRow).invntrQntt;
			let spmtQntt 		= grdOutordrInfo.getRowData(nRow).spmtQntt;
			let outordrQntt 	= grdOutordrInfo.getRowData(nRow).outordrQntt;
			let cmndQntt 		= grdOutordrInfo.getRowData(nRow).cmndQntt;
			let psbltyCmndQntt 	= outordrQntt - cmndQntt;
			let wght 			= grdOutordrInfo.getRowData(nRow).wght;
			let inptCmndQnttCol = grdOutordrInfo.getColRef("inptCmndQntt");
			let inptCmndWghtCol = grdOutordrInfo.getColRef("inptCmndWght");
			let checkedCol 		= grdOutordrInfo.getColRef("checked");

			if(psbltyCmndQntt > 0 && invntrQntt > 0){
				if(psbltyCmndQntt > invntrQntt) {
					grdOutordrInfo.setCellData(nRow, inptCmndQnttCol, invntrQntt);
					grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, invntrQntt*wght);
				}else {
					grdOutordrInfo.setCellData(nRow, inptCmndQnttCol, psbltyCmndQntt);
					grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, psbltyCmndQntt*wght);
				}
			}
    	}
    }

    const fn_delValue = async function(){
    	var nRow = grdOutordrInfo.getRow();
    	let inptCmndQnttCol = grdOutordrInfo.getColRef("inptCmndQntt");
		let inptCmndWghtCol = grdOutordrInfo.getColRef("inptCmndWght");
    	grdOutordrInfo.setCellData(nRow, inptCmndQnttCol, "");
    	grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, "");
    }

	// 출하지시 등록
    async function fn_regSpmtCmnd(){
    	let allData = grdOutordrInfo.getGridDataAll();
		let cmndYmd = SBUxMethod.get("srch-dtp-cmndYmd");
		let trsprtCoCd = SBUxMethod.get("srch-slt-trsprtCoCd");
		let rmrk = SBUxMethod.get("srch-inp-rmrk");
		const regSpmtCmndList = [];

		if (gfn_isEmpty(cmndYmd)){
			gfn_comAlert("W0002", "지시일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(trsprtCoCd)){
			gfn_comAlert("W0002", "운송회사");		//	W0002	{0}을/를 입력하세요.
            return;
		}

		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdOutordrInfo.getRowData(i);
			const rowSts = grdOutordrInfo.getRowStatus(i);
			if (rowData.checked == "true"){
				if (gfn_isEmpty(rowData.inptCmndQntt)){
					break;
					gfn_comAlert("W0002", "지시수량");		//	W0002	{0}을/를 선택하세요.
					return;
				}
				rowData.cmndYmd = cmndYmd;
				rowData.trsprtCoCd = trsprtCoCd;
				rowData.rmrk = rmrk;
				rowData.cmndQntt = rowData.inptCmndQntt;
				rowData.cmndWght = rowData.inptCmndWght;
				if (gfn_isEmpty(rowData.rcptCfmtnYmd)){
					rowData.rcptCfmtnApcCd = gv_selectedApcCd;
					rowData.rcptCfmtnYmd = gfn_dateToYmd(new Date());
					rowData.rowSts = "U";
				} else {
					rowData.rowSts = "I";
				}
				regSpmtCmndList.push(rowData);
			} else {
				continue;
			}
		}

		if (regSpmtCmndList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}
		if (!gfn_comConfirm("Q0001", "출하지시 등록")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

    	const postJsonPromise = gfn_postJSON("/am/ordr/regSpmtCmndList.do", regSpmtCmndList, this.prgrmId);	// 프로그램id 추가
		const data = await postJsonPromise;
        try {
        	if (data.insertedCnt > 0) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_callSelectOutordrInfoList();
        		fn_search();
        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }
    }

	// 접수여부 콤보박스 (검색 조건)
	async function setRcptYnSBSelect(_targetIds, _jsondataRef) {
		let sourceJson = [{cmnsNm: "접수", cmnsCd: "Y"}, {cmnsNm: "미접수", cmnsCd: "N"}];
		gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
	}

	// APC 선택 변경
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_initSBSelect()
		]);
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd)			// 품종
		]);
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		const itemCd = _.find(jsonApcVrty, {value: vrtyCd}).mastervalue;

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
	}

	// 거래처 선택 팝업 호출
	const fn_modalCnpt = function() {
    	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnptNm"), fn_setCnpt);
	}

	const fn_setCnpt = function(cnpt) {
		if (!gfn_isEmpty(cnpt)) {
			SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
		}
	}

	// 상품 선택 팝업 호출
	const fn_modalGds = function() {
    	popGds.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-spmtPckgUnitNm"), fn_setGdsNm);
	}

	const fn_setGdsNm = function(gds) {
		if (!gfn_isEmpty(gds)) {
			SBUxMethod.set('srch-inp-spmtPckgUnitNm', gds.spmtPckgUnitNm);
			SBUxMethod.set("srch-slt-itemCd", gds.itemCd);
			SBUxMethod.set("srch-slt-vrtyCd", gds.vrtyCd);
		}
	}
</script>
</html>