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
				<h3 class="box-title" style="line-height: 30px;"> ▶ 저온저장고 운영기간</h3>
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
			<div>
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
						<td>
							<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" style="font-size: x-small;" class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>
						<th scope="row">대상연도</th>
						<td class="td_input"  style="border-right: hidden;">
							<sbux-input id="srch-inp-warehouse" name="srch-inp-warehouse" uitype="text" placeholder="" class="form-control pull-right input-sm"></sbux-input>
						</td>
						<td colspan="5"></td>
					</tr>
				</tbody>
			</table>
			</div>
			<!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<br>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtDsctn" style="height:300px;"></div>
				</div>
<br>
			<div><label>저온저장고운영기간 상세내역</label></div>
			<div>
			<table class="table table-bordered tbl_row tbl_fixed">
				<caption>검색 조건 설정</caption>
				<colgroup>
					<col style="width: 9%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
					<col style="width: 8%">
				</colgroup>
				<tbody>
					<tr>
						<th></th>
						<th>없음</th>
						<th>1</th>
						<th>2</th>
						<th>3</th>
						<th>4</th>
						<th>5</th>
						<th>6</th>
						<th>7</th>
						<th>8</th>
						<th>9</th>
						<th>10</th>
						<th>11</th>
						<th>12</th>
					</tr>
					<tr>
						<th>저온저장고<br>
							비수기간<br>
						</th>
						<td>
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon1" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td>
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon2" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td>
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon3" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td>
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon4" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td>
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon5" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td>
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon6" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td>
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon7" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td>
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon8" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td>
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon9" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td>
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon10" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td>
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon11" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td>
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon12" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
						<td>
							<p class="ad_input_row">
								<sbux-checkbox id="warehouseSeCd-chk-mon13" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
								<label class="check_label" for="check_default" ></label>
							</p>
						</td>
					</tr>
				</tbody>
			</table>
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
        <sbux-modal id="modal-vrtyCrtr" name="modal-vrtyCrtr" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:650px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createspmtDsctnGrid();

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

	function fn_createspmtDsctnGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtDsctn';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['보유여부'], 					ref: 'wghno',			width: '17%', type: 'output'},
            {caption: ['1월'],						ref: 'itemNm', 			width: '13%', type: 'output'},
            {caption: ['2월'],						ref: 'itemNm1', 		width: '13%', type: 'output'},
            {caption: ['3월'],						ref: 'itemNm2', 		width: '13%', type: 'output'},
            {caption: ['4월'],						ref: 'itemNm3', 		width: '13%', type: 'output'},
            {caption: ['5월'],						ref: 'itemNm4', 		width: '13%', type: 'output'},
            {caption: ['6월'],						ref: 'itemNm5', 		width: '13%', type: 'output'},
            {caption: ['7월'],						ref: 'itemNm6', 		width: '13%', type: 'output'},
            {caption: ['8월'],						ref: 'itemNm7', 		width: '13%', type: 'output'},
            {caption: ['9월'],						ref: 'itemNm8', 		width: '13%', type: 'output'},
            {caption: ['10월'],						ref: 'itemNm9', 		width: '13%', type: 'output'},
            {caption: ['11월'],						ref: 'itemNm10', 		width: '13%', type: 'output'},
            {caption: ['12월'],						ref: 'itemNm11', 		width: '13%', type: 'output'}
        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>