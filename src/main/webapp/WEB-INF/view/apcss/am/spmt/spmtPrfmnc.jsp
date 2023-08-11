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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 출하실적조회</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger"></sbux-button>
				</div>
			</div>
		<div class="box-body">
			<!--[pp] 검색 -->
			<div>
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
						<th scope="row" class="th_bg" style="border-bottom:1px solid white " >APC명</th>
						<td colspan= "3" class="td_input" style="border-right:hidden;">
							<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="8"></td>
					</tr>
					<tr>
						<th scope="row" class="th_bg" >창고</th>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-select uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComWarehouse"></sbux-select>
						</td>
						<td colspan="2" ></td>
						<th scope="row" class="th_bg">출하일자</th>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-datepicker id="srch-dtp-startPrdctnYmd" name="srch-dtp-startPrdctnYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
						</td>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-datepicker id="srch-dtp-endPrdctnYmd" name="srch-dtp-endPrdctnYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
						</td>
						<td style="border-right: hidden;">&nbsp;</td>
						<th scope="row" class="th_bg" style="border-right: hidden;">품목/품종</th>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-select uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
						</td>
						<td class="td_input" style="border-right: hidden;">
<!-- 						<sbux-select uitype="single" id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComVrty"></sbux-select> -->
							<sbux-input uitype="text" id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" class="form-control input-sm" ></sbux-input>
						</td>
						<td>
							<sbux-button id="srch-btn-vrtySrch" name="srch-btn-vrtySrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							<!-- <sbux-button id="srch-btn-itemVrty" name="srch-btn-itemVrty" uitype="modal" target-id="modal-vrtyCrtr" onclick="fn_modalVrty" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button> -->
						</td>
					</tr>
					<tr>
						<th scope="row" class="th_bg" style="border-right: hidden;">거래처</th>
						<td colspan="2" class="td_input"  style="border-right: hidden;">
							<sbux-input id="srch-inp-cnpt" name="srch-inp-cnpt" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
						</td>
						<td class="td_input" style="border-right: hidden;">
							<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt"  text="찾기"  class="btn btn-xs btn-outline-dark" ></sbux-button>
						</td>
						<th scope="row" class="th_bg">배송지</th>
						<td colspan="2" class="td_input" style="border-right: hidden;" >
							<sbux-select id="srch-slt-cnpt" name="srch-slt-cnpt" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
						</td>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-button id="srch-btn-dldtn" name="srch-btn-dldtn" uitype="normal" text="찾기"  class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>
						<th scope="row" class="th_bg">운송사</th>
						<td colspan="2" class="td_input" style="border-right: hidden;">
							<sbux-select id="srch-slt-trsprtCo" name="srch-slt-trsprtCo" uitype="single" class="form-control input-sm" unselected-text="선택"  jsondata-ref="jsonComTrsprtCo"></sbux-select>
						</td>
						<td></td>
					</tr>
					<tr>
						<th scope="row" class="th_bg">차량번호</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-input id="srch-inp-vhclno" name="srch-inp-vhclno" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
						</td>
						<td class="td_input" style="border-right: hidden;">
							<sbux-button id="btnSrchVhclNo" name="btnSrchVhclNo" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_modalVhcl"></sbux-button>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>출하 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:500px;"></div>
				</div>

			</div>
			<!--[pp] //검색결과 -->
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
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:650px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var jsonComItem			= [];	// 품목 		itemCd		검색
	var jsonComVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouseSeCd	검색
	var jsonComPckgSeCd		= [];	// 포장구분 	pckgSeCd		검색
	var jsonComTrsprtCo		= [];	// 운송사 		trsprtCo	검색
	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	await gfn_setComCdSBSelect('srch-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_apcCd);	// 창고
	 	await gfn_setComCdSBSelect('srch-slt-pckgSeCd', 		jsonComPckgSeCd, 		'PCKG_SE_CD', gv_apcCd);	// 설비
	 	await gfn_setTrsprtsSBSelect('srch-slt-trsprtCo', 		jsonComTrsprtCo, 	gv_apcCd);		// 운송사
	 	await gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_apcCd);		// 품목
	 	await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_apcCd);		// 품종

	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createspmtDsctnGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-startPrdctnYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endPrdctnYmd", year+month+day);
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);

		fn_initSBSelect();
	})

	function fn_createspmtDsctnGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['출하일지','출하일지'], 			ref: 'wghno',		width: '15%', type: 'output'},
            {caption: ['상품명','상품명'], 			ref: 'prdcrNm', 	width: '15%', type: 'output'},
            {caption: ['품종','품종'],		ref: 'itemNm', 		width: '15%', type: 'output'},
            {caption: ['규격','규격'], 			ref: 'vrtyNm', 		width: '15%', type: 'output'},
            {caption: ['브랜드','브랜드'], 		ref: 'gdsSeNm', 	width: '15%', type: 'output'},
            {caption: ['거래처','거래처'], 		ref: 'wrhsSeNm', 	width: '15%', type: 'output'},
            {caption: ['배송지','배송지'], 			ref: 'trsprtSeNm', 	width: '15%', type: 'output'},
            {caption: ['운송사','운송사'], 			ref: 'wholWght', 	width: '15%', type: 'output'},
            {caption: ['차량번호','차량번호'], 			ref: 'emptVhclWght',width: '15%', type: 'output'},
            {caption: ['운반비','운반비'], 			ref: 'rdcdRt', 		width: '15%', type: 'output'},
            {caption: ['출하','수량'], 			ref: 'rdcdWght', 	width: '15%', type: 'output'},
            {caption: ['출하','중량'], 			ref: 'actlWght', 	width: '15%', type: 'output'}
        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
	
	const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
    	//_apcCd, _apcNm, _itemNm, _callbackFnc
	}
    

     const fn_setVrty = function(vrty) {

		if (!gfn_isEmpty(vrty)) {
			console.log("vrty", vrty);
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyNm);
		}
	}
     const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
// 			console.log("vrtys", vrtys);
// 			console.log("vrtys[2]", vrtys[2]);
			var _vrtys = [];
			for(var i=0;i<vrtys.length;i++){
				_vrtys.push(vrtys[i].vrtyNm);
// 				SBUxMethod.setValue('srch-inp-vrtyCd', vrtys[i].vrtyNm);
// 				SBUxMethod.set('srch-inp-vrtyCd', vrtys[i].vrtyNm);
// 				console.log("vrtys", _vrtys);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtys.join(','));
		}
	}
	
	
	const fn_modalCnpt = function() {
    	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnpt"), fn_setCnpt);
    	//_apcCd, _apcNm, _cnptNm, _callbackFnc
	}
	
	const fn_setCnpt = function(cnpt) {

		if (!gfn_isEmpty(cnpt)) {
			console.log("cnpt", cnpt);
			SBUxMethod.set('srch-inp-cnpt', cnpt.cnptNm);
		}
	}
</script>
</html>