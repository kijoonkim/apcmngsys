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
				<h3 class="box-title" style="line-height: 30px;">▶재배약정결과관리</h3>
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btn-srch-inp-outordrInq" name="btn-srch-inp-outordrInq" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger"></sbux-button>
				<sbux-button id="btnReset" name="btnReset" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger"></sbux-button>
				<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-primary"></sbux-button>
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
							<th scope="row">APC명</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcCd" name="srch-inp-apcCd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td colspan="8"></td>
						</tr>
						<tr>
							<th scope="row">약정일자</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-outordrYmd1" name="srch-inp-outordrYmd1" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-outordrYmd2" name="srch-inp-outordrYmd2" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input"  style="border-right: hidden;"></td>

							<th scope="row">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfct" name="srch-slt-spcfct" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-item" name="srch-slt-item" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-Vrty" name="srch-slt-Vrty" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td class="td_input"></td>
						</tr>

					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>재배약정결과 내역</span></li>
						</ul>
					</div>

					<div id="sb-area-grdSpmtCmndTrgtDsctn" style="height:300px;"></div>
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>재배약정결과 상세내역</span></li>
						</ul>
					</div>
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
								<sbux-input id="srch-inp-cnpt" name="srch-inp-cnpt" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td>
								<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"/>
							</td>
					  		<th scope="row">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-prdcr-cd" name="srch-prdcr-cd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-frmer-sn" name="srch-frmer-sn" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td style="border-right: hidden;">
								<sbux-button id="srch-btn-cnpt1" name="srch-btn-cnpt1" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"/>
							</td>
							<th scope="row">품종/품목</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-item-cd" name="srch-item-cd" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td></td>
						</tr>
						<tr>
						    <th scope="row">약정일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-inp-enggtYmd" name="srch-inp-enggtYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input"  style="border-right: hidden;"></td>
							<th scope="row">규격</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-spcfct-cd" name="srch-spcfct-cd" uitype="single" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row">약정수량</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-enggtVlm" name="srch-inp-enggtVlm" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
							<td colspan="1" scope="row"> &nbsp;</th>
						</tr>
						<tr>
							<th class="td_input" scope="row">예상수확량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-expctHrvstQntt" name="srch-inp-expctHrvstQntt" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							<td class="td_input" style="border-right: hidden;">Kg</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th>비고</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-RMRK" name="srch-inp-RMRK" uitype="text" class="form-control input-sm" placeholder="" title=""></sbux-input>
							</td>
							<td colspan="1"></td>
						</tr>

					</tbody>
				</table>


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

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createregSpmtCmndGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-inp-outordrYmd1", year+month+day);
		SBUxMethod.set("srch-inp-outordrYmd2", year+month+day);
		SBUxMethod.set("srch-inp-cmndYmd", year+month+day);

	})


	function fn_createregSpmtCmndGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtCmndTrgtDsctn';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['선택'], 			ref: 'wghno', 			width: '4%', type: 'output'},
            {caption: ['품목'], 			ref: 'itemCd', 			width: '15%', type: 'output'},
            {caption: ['규격'], 			ref: 'spcfctCd', 		width: '15%', type: 'output'},
            {caption: ['약정일자'], 		ref: 'enggtYmd', 		width: '15%', type: 'output'},
            {caption: ['약정결과량수량'], 	ref: 'gdsSeNm', 		width: '15%', type: 'output'},
            {caption: ['약정결과량중량'], 	ref: 'wrhsSeNm', 		width: '15%', type: 'output'},
            {caption: ['비고'],		 	ref: 'RMRK',	 		width: '21%', type: 'output'},
        ];

        grdWghPrfmnc = _SBGrid.create(SBGridProperties);

    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>