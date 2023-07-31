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
					<h3 class="box-title" style="line-height: 30px;">▶ 출하실적등록 (태블릿)</h3>
				</div>
				<div style="margin-left: auto;">
					<p class="ad_input_row">
						<sbux-checkbox id="chk-docSpmt" name="chk-docSpmt" uitype="normal" text="송품장 자동발행" class="check"></sbux-checkbox>
					</p>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnEnd" name="btnEnd" uitype="normal" text="종료" class="btn btn-sm btn-outline-danger"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="" disabled=""></sbux-input>
							</td>
							<td colspan="6"></td>
						</tr>
						<tr>
							<th scope="row">출하지시번호</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spmtCmndNo" name="srch-inp-spmtCmndNo" uitype="text" class="form-control input-sm"></sbux-input>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-inp-spmtCmndNo" name="srch-btn-inp-spmtCmndNo" uitype="normal" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
								<p class="ad_input_row">
									<sbux-checkbox id="chk-fxng" name="chk-fxng" uitype="normal" text="고정" class="check"></sbux-checkbox>
								</p>
							</td>
							<td colspan="2" style="border-right: hidden;"></td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row">포장번호/순번</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-frmlNo" name="srch-inp-frmlNo" uitype="text" class="form-control input-sm"></sbux-input>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btn-" name="btn_norm" uitype="normal" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<td colspan="2" style="border-right: hidden;"></td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row">출하수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-smptQntt" name="srch-inp-smptQntt" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-smptWght" name="srch-inp-smptWght" uitype="text" class="form-control input-sm" placeholder="" disabled=""></sbux-input>
							</td>
							<td style="border-right: hidden;">Kg</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row">품종/규격</th>
							<td style="border-right: hidden;" class="td_input">
								<sbux-input id="srch-inp-item" name="srch-inp-item" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input id="srch-inp-item" name="srch-inp-item" uitype="text" class="form-control input-sm" placeholder="" disabled=""></sbux-input>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" style="border-right: hidden;"></td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row">상품명</th>
								<td style="border-right: hidden;" colspan="2" class="td_input">
									<sbux-input id="srch-inp-item" name="srch-inp-item" uitype="text" class="form-control input-sm" placeholder="" disabled=""></sbux-input>
								</td>
								<td style="border-right: hidden;">&nbsp;</td>
								<td style="border-right: hidden;" colspan="2"></td>
								<td colspan="3"></td>
						</tr>
						<tr>
							<th style="border-right: hidden;" scope="row">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-item" name="srch-inp-item" uitype="text" class="form-control input-sm" placeholder=""disabled=""></sbux-input>
							</td>
							<td style="border-right: hidden;" colspan="2"></td>
							<td style="border-right: hidden;" colspan="2"></td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row">포장구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-item" name="srch-inp-item" uitype="text" class="form-control input-sm" placeholder=""disabled=""></sbux-input>
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" style="border-right: hidden;"></td>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-item" name="srch-inp-item" uitype="text" class="form-control input-sm" placeholder=""disabled=""></sbux-input>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" style="border-right: hidden;"></td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row">운송회사</th>
							<td colspan="2" style="border-right: hidden;" class="td_input">
								<sbux-input id="srch-inp-item" name="srch-inp-item" uitype="text" class="form-control input-sm" placeholder=""disabled=""></sbux-input>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" style="border-right: hidden;"></td>
							<td colspan="3""></td>
						</tr>
						<tr>
							<th scope="row" style="border-right: hidden;">차량번호</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-item" name="srch-inp-item" uitype="text" class="form-control input-sm" placeholder=""disabled=""></sbux-input>
							<td style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox id="chk-fxng2" name="chk-fxng2" uitype="normal" text="고정" class="check"></sbux-checkbox>
								</p>
							</td>
							<td colspan="5"></td>
                              </tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>출하대상내역</span></li>
						</ul>
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-spmtTrgtDsctn" style="height:300px;"></div>
					</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createSpmtTrgtDsctnGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("dtp-wrhsYmd", year+month+day);
	})

	function fn_createSpmtTrgtDsctnGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtTrgtDsctn';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['지시번호'], 		ref: 'wghno',		width: '15%', type: 'output'},
            {caption: ['포장번호'], 		ref: 'prdcrNm', 	width: '15%', type: 'output'},
            {caption: ['수량'],			ref: 'itemNm', 		width: '15%', type: 'output'},
            {caption: ['중량'], 			ref: 'vrtyNm', 		width: '15%', type: 'output'},
            {caption: ['품종'], 			ref: 'gdsSeNm', 	width: '15%', type: 'output'},
            {caption: ['규격'], 			ref: 'wrhsSeNm', 	width: '15%', type: 'output'},
            {caption: ['상품명'], 		ref: 'trsprtSeNm', 	width: '15%', type: 'output'},
            {caption: ['상품등급'], 		ref: 'wholWght', 	width: '15%', type: 'output'},
            {caption: ['포장구분'], 		ref: 'emptVhclWght',width: '15%', type: 'output'},
            {caption: ['거래처'], 		ref: 'rdcdRt', 		width: '15%', type: 'output'},
            {caption: ['운송회사'], 		ref: 'rdcdWght', 	width: '15%', type: 'output'},
            {caption: ['차량번호'], 		ref: 'actlWght', 	width: '15%', type: 'output'},
            {caption: ['처리'], 			ref: 'actlWght', 	width: '15%', type: 'output'}
        ];

        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>