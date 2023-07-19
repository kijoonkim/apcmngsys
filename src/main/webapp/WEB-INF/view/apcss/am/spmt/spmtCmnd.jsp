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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 출하지시조회</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btn-search" name="btn-search" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger"></sbux-button>
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
						<col style="width: 3%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-acpCd" name="srch-inp-acpCd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-wrhsStartYmd" name="dtp-wrhsStartYmd" uitype="popup" ></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-wrhsEndYmd" name="dtp-wrhsEndYmd" uitype="popup" ></sbux-datepicker>
							</td>
							<td class="td_input"></td>
							<th scope="row">거래처</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnpt" name="srch-inp-cnpt" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btn_norm" name="btn_norm" uitype="normal" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td class="td_input"></td>
							
							<th scope="row" style="border-right: hidden;">운송회사</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="select_single" name="select_single" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select>
							</td>
							<td class="td_input" colspan="2"></td>
						</tr>
						<tr>
							<th scope="row">품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="select_single" name="select_single" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="select_single" name="select_single" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select>
							</td>
							<td class="td_input" colspan="2"></td>
							<th scope="row">포장구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="select_single" name="select_single" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>출하지시 내역</span></li>
						</ul>
					</div>
						<div class="table-responsive tbl_scroll_sm">
							<div id="sb-area-grdSpmtCmndDsctn" style="width:100%;height:300px;"></div>
						</div>
					</div>
				</div>
				<!--[pp] //검색결과 -->
	</section>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createSpmtCmndDsctnGrid();
	})

	/* const fn_initSBSelect = async function() {

 		gfn_setComCdSBSelect('rdo-wrhsSeCd', jsonRadioWrhsSeCd, 'WRHS_SE_CD');	// 시스템유형

	} */

	function fn_createSpmtCmndDsctnGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtCmndDsctn';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['지십일자'], 	ref: 'wghno', 			width: '10%', type: 'output'},
            {caption: ['거래처'], 	ref: 'prdcrNm', 		width: '10%', type: 'output'},
            {caption: ['상품명'], 	ref: 'itemNm', 			width: '10%', type: 'output'},
            {caption: ['운송회사'], 	ref: 'vrtyNm', 			width: '10%', type: 'output'},
            {caption: ['배송처'], 	ref: 'gdsSeNm', 		width: '10%', type: 'output'},
            {caption: ['수량'], 		ref: 'wrhsSeNm', 		width: '10%', type: 'output'},
            {caption: ['중량'], 		ref: 'trsprtSeNm', 		width: '10%', type: 'output'},
            {caption: ['상품등급'], 	ref: 'wholWght', 		width: '10%', type: 'output'},
            {caption: ['포장구분'], 	ref: 'emptVhclWght', 	width: '10%', type: 'output'},
            {caption: ['품종'], 		ref: 'rdcdRt', 			width: '10%', type: 'output'},
            {caption: ['규격'], 		ref: 'rdcdWght', 		width: '10%', type: 'output'},
            {caption: ['비고'], 		ref: 'actlWght', 		width: '10%', type: 'output'}
        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>