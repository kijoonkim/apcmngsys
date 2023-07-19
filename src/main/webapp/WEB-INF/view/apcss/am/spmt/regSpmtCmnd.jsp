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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 출하지시등록</h3>
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger"></sbux-button>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger"></sbux-button>
				<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger"></sbux-button>
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
							<th scope="row">APC명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<input type="text" class="form-control input-sm" placeholder="" disabled>
							</td>
							<td colspan="9"></td>
						</tr>
						<tr>
							<th scope="row">발주일자</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-outordrYmd1" name="srch-inp-jobYmd1" uitype="popup"></sbux-datepicker>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-outordrYmd2" name="srch-inp-jobYmd2" uitype="popup"></sbux-datepicker>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>

							<th scope="row">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-warehouseSe" name="srch-slt-warehouseSe" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-item" name="srch-slt-item" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-Vrty" name="srch-slt-Vrty" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select>
							</td>
							<td class="td_input"></td>
						</tr>
						<tr>
							<th scope="row">거래처</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnpt" name="srch-inp-cnpt" uitype="text" class="form-control input-sm"></sbux-input>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btn-srch-inp-cnpt" name="btn-srch-inp-cnpt" uitype="normal" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfct" name="srch-slt-spcfct" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btn-srch-inp-outordrInq" name="btn-srch-inp-outordrInq" uitype="normal" text="발주조회" class="btn btn-sm btn-outline-danger"></sbux-button>
							</td>
							<td colspan="5"></td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>　출하지시대상 내역</span></li>
						</ul>
					</div>
					<div id="sb-area-grdSpmtCmndTrgtDsctn" style="height:300px;"></div>
					
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
							<th scope="row">거래처</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnpt" name="srch-inp-cnpt" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td colspan="2"></td>
					  		<th scope="row">품목/품종/규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-item" name="srch-slt-item" uitype="single" class="form-control input-sm" disabled>
									<option-item></option-item>
								</sbux-select>       
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-vrty" name="srch-slt-vrty" uitype="single" class="form-control input-sm" disabled>
									<option-item></option-item>
								</sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row">배송처</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-dldtn" name="srch-inp-dldtn" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td style="border-right: hidden;"></td>
							<td></td>
						</tr>
						<tr>
						    <th scope="row">지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-cmndYmd" name="srch-inp-cmndYmd" uitype="popup"></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input"  style="border-right: hidden;"></td>
							<th scope="row">운송회사</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-trsprtCo" name="srch-slt-trsprtCo" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select> 
							</td>
							<td colspan="2" class="td_input"  style="border-right: hidden;"></td>
							<th scope="row">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-gdsGrd" name="srch-slt-gdsGrd" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">지시수량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cmndQntt" name="srch-inp-cmndQntt" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" style="border-right: hidden;">지시중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cmndWght" name="srch-inp-cmndWght" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							<td style="border-right: hidden;">Kg</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" style="border-right: hidden;">포장구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-frmlSe" name="srch-slt-frmlSe" uitype="single" class="form-control input-sm">
									<option-item>선택</option-item>
								</sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">비고</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-rmrk" name="srch-inp-rmrk" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
							<td colspan="8">&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="ad_tbl_top">
				<ul class="ad_tbl_count">
					<li><span>　출하지시 내역</span></li>
				</ul>
			</div>
			<div id="sb-area-grdSpmtCmndDsctn" style="height:300px;"></div>
		</div>
	</section>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createregSpmtCmndGrid();
		fn_createSpmtCmndDsctnGrid();
	})

	/* const fn_initSBSelect = async function() {

 		gfn_setComCdSBSelect('rdo-wrhsSeCd', jsonRadioWrhsSeCd, 'WRHS_SE_CD');	// 시스템유형

	} */


	function fn_createregSpmtCmndGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtCmndTrgtDsctn';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
        	{caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
                ref: 'checked', type: 'checkbox',   style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                width: '3px'
            },
            {caption: ['선택'], 		ref: 'wghno', 			width: '10%', type: 'output'},
            {caption: ['거래처'], 	ref: 'prdcrNm', 		width: '10%', type: 'output'},
            {caption: ['상품명'], 	ref: 'itemNm', 			width: '10%', type: 'output'},
            {caption: ['배송처'], 	ref: 'vrtyNm', 			width: '10%', type: 'output'},
            {caption: ['납기일자'], 	ref: 'gdsSeNm', 		width: '10%', type: 'output'},
            {caption: ['품목'], 		ref: 'wrhsSeNm', 		width: '10%', type: 'output'},
            {caption: ['규격'], 		ref: 'trsprtSeNm', 		width: '10%', type: 'output'},
            {caption: ['발주수량'], 	ref: 'wholWght', 		width: '10%', type: 'output'},
            {caption: ['출하수량'], 	ref: 'emptVhclWght',	width: '10%', type: 'output'},
            {caption: ['재고수량'], 	ref: 'rdcdRt', 			width: '10%', type: 'output'},
            {caption: ['지시수량'], 	ref: 'rdcdWght', 		width: '10%', type: 'output'},
            {caption: ['지시중량'], 	ref: 'actlWght', 		width: '10%', type: 'output'}
        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
    }

	function fn_createSpmtCmndDsctnGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtCmndDsctn';
	    SBGridProperties.id = 'grdWghPrfmnc2';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc2';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
        	{caption : ["<input type='checkbox' onchange='fn_checkAll(this);'>"],
                ref: 'checked', type: 'checkbox',   style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'},
                width: '3px'
            },
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
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
    }
</script>
</html>