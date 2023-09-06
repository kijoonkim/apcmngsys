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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 매출확정등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
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
						<th scope="row"  class="th_bg" style="border-bottom:1px solid white " >APC명</th>
						<td colspan= "3" class="td_input" style="border-right:hidden;">
							<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
						</td>
						<td colspan="8"></td>
					</tr>
					<tr>
						<th scope="row" class="th_bg">매출일자</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-datepicker id="srch-dtp-startPrdctnYmd" name="srch-dtp-startPrdctnYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
						</td>
						<td class="td_input" style="border-right: hidden;">
							<sbux-datepicker id="srch-dtp-endPrdctnYmd" name="srch-dtp-endPrdctnYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
						</td>
						<td class="td_input" style="border-right: hidden;"></td>
						<th scope="row" class="th_bg">확정여부</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-select id="srch-slt-useYn" name="srch-slt-useYn" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComUseYn"></sbux-select>
						</td>
						<td colspan="2"></td>
						<th scope="row" class="th_bg">품목/품종</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComItem"></sbux-select>
						</td>
						<td class="td_input" style="border-right: hidden;">
							<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComVrty"></sbux-select>
						</td>
						<td class="td_input">
						</td>
					</tr>
					<tr>
						<th scope="row" class="th_bg">거래처</th>
						<td colspan="2" class="td_input" style="border-right: hidden;">
<!-- 							<sbux-select id="srch-slt-cnpt" name="srch-slt-cnpt" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select> -->
							<sbux-input id="srch-inp-cnpt" name="srch-inp-cnpt" uitype="text" class="form-control input-sm"></sbux-input>
						</td>
						<td class="td_input" style="border-right: hidden;">
							<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="ad_tbl_top">
				<ul class="ad_tbl_count">
					<li><span>매출 내역</span></li>
				</ul>
			 	<div class="ad_tbl_toplist_datepk">
			 		<table class="table table-bordered tbl_fixed">
			 			<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: auto">
						<col style="width: 180px">
						<col style="width: 62px">
						<col style="width: 62px">
					</colgroup>
					<tbody>
						<tr>
							<td style="border-left:hidden"></td>
							<td class="td_input" style="border-right:hidden; border-left:hidden" ><sbux-datepicker id="srch-dtp-startPr123dctnYmd" name="srch-dtp-startPr123dctnYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker></td>
							<td class="td_input" style="border-right:hidden;"><sbux-button id="srch-btn-cnpt1" name="srch-btn-cnpt1" uitype="normal" text="매출생성" class="btn btn-xs btn-outline-dark"></sbux-button></td>
							<td class="td_input" style="border-right:hidden;"><sbux-button id="btnRegDdln" name="btnRegDdln" class="btn btn-xs btn-outline-dark" text="마감등록" uitype="modal" target-id="modal-ddln" onclick="fn_regDDln"></sbux-button></td>
						</tr>
					</tbody>
			 		</table>
				</div>
			</div>
			<div class="table-responsive tbl_scroll_sm">
				<div id="sb-area-slsDsctn" style="height:450px;"></div>
			</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	    <!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="../../am/popup/cnptPopup.jsp"></jsp:include>
    </div>
    <!-- 마감 등록 Modal -->
    <div>
        <sbux-modal id="modal-ddln" name="modal-ddln" uitype="middle" header-title="마감 등록" body-html-id="body-modal-ddln" footer-is-close-button="false" style="width:700px"></sbux-modal>
    </div>
    <div id="body-modal-ddln">
    	<jsp:include page="../../am/popup/regDdlnPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var jsonComItem			= [];	// 품목 		itemCd		검색
	var jsonComVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComUseYn		= [];	// 창고 		useYn		검색
	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	await gfn_setComCdSBSelect('srch-slt-useYn', 		jsonComUseYn, 	'USE_YN');	// 사용유무
	 	await gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonComItem, 	gv_apcCd);	// 품목
	 	await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonComVrty, 	gv_apcCd);	// 품종

	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createslsDsctnGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-startPrdctnYmd", year+month+day);
		SBUxMethod.set("srch-dtp-endPrdctnYmd", year+month+day);
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);

		fn_initSBSelect();
	})

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
            {caption: ['매출일자','매출일자'], 			ref: 'prdcrNm', 	width: '15%', type: 'output'},
            {caption: ['거래처','거래처'],		ref: 'itemNm', 		width: '15%', type: 'output'},
            {caption: ['상품명','상품명'], 			ref: 'vrtyNm', 		width: '15%', type: 'output'},
            {caption: ['상품코드','상품코드'], 		ref: 'gdsSeNm', 	width: '15%', type: 'output'},
            {caption: ['품종','품종'], 		ref: 'wrhsSeNm', 	width: '15%', type: 'output'},
            {caption: ['규격','규격'], 			ref: 'trsprtSeNm', 	width: '15%', type: 'output'},
            {caption: ['브랜드','브랜드'], 			ref: 'wholWght', 	width: '15%', type: 'output'},
            {caption: ['출하','수량'], 			ref: 'emptVhclWght',width: '15%', type: 'output'},
            {caption: ['출하','중량'], 			ref: 'rdcdRt', 		width: '15%', type: 'output'},
            {caption: ['출하일자','출하일자'], 			ref: 'rdcdWght', 	width: '15%', type: 'output'},
            {caption: ['단가','단가'], 			ref: 'actlWght', 	width: '15%', type: 'output'},
            {caption: ['금액','금액'], 			ref: 'actlWght', 	width: '15%', type: 'output'},
            {caption: ['확정금액','확정금액'], 			ref: 'actlWght', 	width: '15%', type: 'output'},
            {caption: ['확정여부','확정여부'], 			ref: 'actlWght', 	width: '15%', type: 'output'}
        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
    }

	/**
	 * @name fn_regDDln
	 * @description 마감등록 호출
	 */
	const fn_regDDln = function() {
		fn_modalDdln(gv_apcCd, gv_apcNm);
	}
</script>
</html>