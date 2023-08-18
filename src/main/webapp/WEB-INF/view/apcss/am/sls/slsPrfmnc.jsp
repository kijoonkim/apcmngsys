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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 매출실적조회</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSlipDlng" name="btnSlipDlng" uitype="normal" class="btn btn-sm btn-primary" text="거래명세표" onclick="fn_slipDlng"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
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
							<th scope="row" class="th_bg">매출일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-slsYmdFrom" name="srch-dtp-slsYmdFrom" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-slsYmdTo" name="srch-dtp-slsYmdTo" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" jsondata-ref="jsonApcItem" unselected-text="선택" class="form-control input-sm" onchange="fn_selectItem" ></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" jsondata-ref="jsonApcVrty" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" class="form-control input-sm"></sbux-input>
								<sbux-input id="srch-inp-cnptCd" name="srch-inp-cnptCd" uitype="hidden" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
					</tbody>
				</table>

				<div class="table-responsive tbl_scroll_sm">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>매출 내역</span></li>
						</ul>
					</div>
					<div class="ad_tbl_toplist">
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-clclnPrfmnc" style="height:450px;"></div>
					</div>
				</div>
			</div>
				<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonApcItem, 	gv_selectedApcCd);	// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonApcVrty, 	gv_selectedApcCd);	// 품종
		]);
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-slsYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-slsnYmdTo", gfn_dateToYmd(new Date()));
		
		fn_createClclnPrfmncGrid();

		fn_initSBSelect();
	})

	function fn_createClclnPrfmncGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-clclnPrfmnc';
	    SBGridProperties.id = 'grdClclnPrfmnc';
	    SBGridProperties.jsonref = 'jsonClclnPrfmnc';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.columns = [
            {caption: ['매출일자','매출일자'], 			ref: 'slsYmd',		width: '15%', type: 'output'},
            {caption: ['거래처','거래처'], 			ref: 'cnptNm', 	width: '15%', type: 'output'},
            {caption: ['상품명','상품명'],		ref: 'gdsNm', 		width: '15%', type: 'output'},
            {caption: ['상품코드','상품코드'], 			ref: 'gdsCd', 		width: '15%', type: 'output'},
            {caption: ['품종','품종'], 			ref: 'vrtyNm', 	width: '15%', type: 'output'},
            {caption: ['규격','규격'], 			ref: 'spcfctNm', 	width: '15%', type: 'output'},
            {caption: ['브랜드','브랜드'], 			ref: 'brndCd',width: '15%', type: 'output'},
            {caption: ['출하일자','출하일자'], 			ref: 'spmtYmd', 		width: '15%', type: 'output'},
            {caption: ['단가','단가'], 			ref: 'slsUntprc', 	width: '15%', type: 'output'},
            {caption: ['출하','수량'], 			ref: 'qntt', 	width: '15%', type: 'output'},
            {caption: ['출하','중량'], 			ref: 'wght', 	width: '15%', type: 'output'},
            {caption: ['매출금액','매출금액'], 			ref: 'actlWght', 	width: '15%', type: 'output'},
            {caption: ['발행유무','발행유무'], 			ref: 'actlWght', 	width: '15%', type: 'output'},
            {caption: ['수금유무','수금유무'], 			ref: 'actlWght', 	width: '15%', type: 'output'}
        ];
        grdClclnPrfmnc = _SBGrid.create(SBGridProperties);
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
	
	// 거래명세표
    async function fn_slipDlng(){
    	
    }
	
	// APC 선택 변경
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_initSBSelect()
		]);
	}

	// 품종 콤보박스 변경
	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd);			// 품종
		gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonSpcfct, gv_selectedApcCd, itemCd);		// 규격
	}
	
	// 거래처 선택 팝업 호출
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
</script>
</html>