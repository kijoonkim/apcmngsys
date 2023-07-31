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
					<sbux-button id="btnSlipDlng" name="btnSlipDlng" uitype="normal" text="거래명세표" class="btn btn-sm btn-primary"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
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
							<th scope="row" style="border-bottom:1px solid white " >APC명</th>
							<td colspan= "3" class="td_input" style="border-right:hidden;">
								<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td colspan="8"></td>
						</tr>
						<tr>
							<th scope="row">매출일자</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-startPrdctnYmd" name="srch-dtp-startPrdctnYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-endPrdctnYmd" name="srch-dtp-endPrdctnYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-item" name="srch-slt-item" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td	class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-vrty" name="srch-slt-vrty" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-itemVrty" name="srch-btn-itemVrty" uitype="modal" target-id="modal-vrtyCrtr" onclick="fn_modalVrty" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<th scope="row">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-snpt" name="srch-slt-snpt" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td class="td_input">
								<sbux-button id="srch-btn-snpt" name="srch-btn-snpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
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
						<div id="sb-area-slsDsctn" style="height:450px;"></div>
					</div>
				</div>
			</div>
				<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrtyCrtr" name="modal-vrtyCrtr" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:650px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>

    <!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="../../am/popup/cnptPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createslsDsctnGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-startPrdctnYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endPrdctnYmd", year+month+day);
	})

	/* const fn_initSBSelect = async function() {

 		gfn_setComCdSBSelect('rdo-wrhsSeCd', jsonRadioWrhsSeCd, 'WRHS_SE_CD');	// 시스템유형

	} */

	function fn_createslsDsctnGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-slsDsctn';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['선택','선택'], 			ref: 'wghno',		width: '15%', type: 'output'},
            {caption: ['정산일자','정산일자'], 			ref: 'prdcrNm', 	width: '15%', type: 'output'},
            {caption: ['생산자','생산자'],		ref: 'itemNm', 		width: '15%', type: 'output'},
            {caption: ['입고구분','입고구분'], 			ref: 'vrtyNm', 		width: '15%', type: 'output'},
            {caption: ['상품구분','상품구분'], 		ref: 'gdsSeNm', 	width: '15%', type: 'output'},
            {caption: ['품목','품목'], 		ref: 'wrhsSeNm', 	width: '15%', type: 'output'},
            {caption: ['품종','품종'], 			ref: 'trsprtSeNm', 	width: '15%', type: 'output'},
            {caption: ['규격','규격'], 			ref: 'wholWght', 	width: '15%', type: 'output'},
            {caption: ['브랜드','브랜드'], 			ref: 'emptVhclWght',width: '15%', type: 'output'},
            {caption: ['등급','등급'], 			ref: 'rdcdRt', 		width: '15%', type: 'output'},
            {caption: ['계산금액','계산금액'], 			ref: 'actlWght', 	width: '15%', type: 'output'},
            {caption: ['확장금액','확장금액'], 			ref: 'actlWght', 	width: '15%', type: 'output'},
            {caption: ['확정여부','확정여부'], 			ref: 'actlWght', 	width: '15%', type: 'output'}
        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>