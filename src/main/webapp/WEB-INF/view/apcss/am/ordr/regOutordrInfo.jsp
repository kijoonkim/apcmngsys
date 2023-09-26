<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>발주정보 등록</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>	<!-- 출하실적등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" text="초기화" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_insert"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_delete"></sbux-button>
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
							<th scope="row" class="th_bg">발주형태</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-outordrType"
									name="srch-slt-outordrType"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComOutordrType"
								></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">발주일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-outordrYmd" name="srch-dtp-outordrYmd" uitype="popup" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">납기일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-dudtYmd" name="srch-dtp-dudtYmd" uitype="popup" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptCd" name="srch-inp-cnptCd" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchCnptCd" name="btnSrchCnptCd" uitype="modal" class="btn btn-xs btn-outline-dark" text="찾기" target-id="modal-cnpt" onclick="fn_modalCnpt"></sbux-button>
							</td>
							<th scope="row" class="th_bg">상품명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-gdsNm" name="srch-inp-gdsNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchGdsNm" name="btnSrchGdsNm" uitype="normal" class="btn btn-xs btn-outline-dark" text="찾기"></sbux-button>
							</td>
							<th scope="row" class="th_bg">배송처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-dldtnCd" name="srch-inp-dldtnCd" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
						   	<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm-ast"
									unselected-text="전체"
									jsondata-ref="jsonComItem"
									onchange="fn_selectItem"
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
									onchange="fn_selectVrty"
								></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>규격</th>
						   	<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfct"
									name="srch-slt-spcfct"
									uitype="single"
									unselected-text="선택"
									class="form-control input-sm"
									jsondata-ref="jsonComSpcfct"
								></sbux-select>
							</td>
						</tr>
						<tr>
						    <th scope="row" class="th_bg">발주금액/세액</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-outordrAmt" name="srch-inp-outordrAmt" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-txAmt" name="srch-inp-txAmt" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td></td>
						    <th scope="row" class="th_bg">발주수량/입수</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-outordrQntt" name="srch-inp-outordrQntt" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-bxGdsQntt" name="srch-inp-bxGdsQntt" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td></td>
							<th scope="row" class="th_bg">낱개수량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-pieceQntt" name="srch-inp-pieceQntt" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
						    <th scope="row" class="th_bg">박스단가</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-bxUntprc" name="srch-inp-bxUntprc" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">낱개단가</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-pieceUntprc" name="srch-inp-pieceUntprc" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>발주 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdOutordrInfo" style="width:100%;height:446px;"></div>
				</div>
				<!--[pp] 검색결과 -->
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
</body>
<script type="text/javascript">
	var jsonOutordrInfo = [];
	var grdOutordrInfo;
	var jsonComOutordrType = [];
	var jsonComItem = [];
	var jsonComVrty = [];
	var jsonComSpcfct = [];


	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSBSelect();
		fn_createRegOutordrInfoGrid();

		SBUxMethod.set("srch-dtp-outordrYmd", gfn_dateToYmd(new Date()));
	})

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-outordrType', 	jsonComOutordrType, 	'OUTORDR_TYPE'),		// 상품등급
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_apcCd),		// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_apcCd)		// 품종
		])

	}

	const fn_selectVrty = async function(){
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let itemCd = "";
		for(i=0;i<jsonComVrty.length;i++){
			if(jsonComVrty[i].value == vrtyCd){
				itemCd = jsonComVrty[i].mastervalue;
			}
		}
		await gfn_setApcSpcfctsSBSelect('srch-slt-spcfct', 	jsonComSpcfct, 	gv_apcCd, itemCd)		// 규격
	}

	const fn_createRegOutordrInfoGrid = async function () {

        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdOutordrInfo';
	    SBGridProperties.id = 'grdOutordrInfo';
	    SBGridProperties.jsonref = 'jsonOutordrInfo';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
        	{caption: ['선택'], 		ref: 'checkedYn', 		width: '40px',  type: 'checkbox'},
            {caption: ['발주유형'], 	ref: 'outordrType', 	width: '100px', type: 'output'},
            {caption: ['발주일자'], 	ref: 'outordrYmd', 		width: '100px', type: 'output'},
            {caption: ['납기일자'], 	ref: 'dudtYmd', 		width: '100px', type: 'output'},
            {caption: ['거래처'], 	ref: 'cnptCd', 			width: '100px', type: 'output'},
            {caption: ['상품명'], 	ref: 'gdsNm', 			width: '100px', type: 'output'},
            {caption: ['상품코드'], 	ref: 'gdsCd', 			width: '100px', type: 'output'},
            {caption: ['배송처'], 	ref: 'dldtnCd', 		width: '100px', type: 'output'},
            {caption: ['품목'], 		ref: 'itemCd', 			width: '100px', type: 'output'},
            {caption: ['품종'], 		ref: 'vrtyCd', 			width: '100px', type: 'output'},
            {caption: ['규격'], 		ref: 'spcfctCd', 		width: '100px', type: 'output'},
            {caption: ['발주금액'], 	ref: 'outordrAmt', 		width: '100px', type: 'output'},
            {caption: ['세액'], 		ref: 'txAmt', 			width: '100px', type: 'output'},
            {caption: ['발주수량'], 	ref: 'outordrQntt', 	width: '100px', type: 'output'},
            {caption: ['입수'], 		ref: 'bxGdsQntt', 		width: '100px', type: 'output'},
            {caption: ['낱개수량'], 	ref: 'pieceQntt', 		width: '100px', type: 'output'},
            {caption: ['박스단가'], 	ref: 'bxUntprc', 		width: '100px', type: 'output'},
            {caption: ['낱개단가'], 	ref: 'pieceUntprc', 	width: '100px', type: 'output'},
            {caption: ['등록일자'], 	ref: 'regYmd', 			width: '100px', type: 'output'},
            {caption: ['등록자'], 	ref: 'rgtr', 			width: '100px', type: 'output'}
        ];
        grdOutordrInfo = _SBGrid.create(SBGridProperties);
    }

</script>
</html>