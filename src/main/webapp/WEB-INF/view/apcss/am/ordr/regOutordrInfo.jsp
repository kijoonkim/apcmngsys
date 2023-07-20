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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 발주정보등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" text="초기화" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" class="btn btn-sm btn-outline-danger" text="등록" onclick="fn_insert"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_delete"></sbux-button>
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
						    	<sbux-input id="srch-inp-apcName" name="srch-inp-apcName" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">발주형태</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-ordrForm" name="srch-slt-ordrForm" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"></td>
							<th scope="row">발주일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-fromOrdrDate" name="srch-dtp-fromOrdrDate" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"></td>
							<th scope="row">납기일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-toOrdrDate" name="srch-dtp-toOrdrDate" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input"></td>
						</tr>
						<tr>
							<th scope="row">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnpt" name="srch-inp-cnpt" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="normal" class="btn btn-xs btn-outline-dark" text="찾기"></sbux-button>
							</td>
							<th scope="row">상품명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-gdsName" name="srch-inp-gdsName" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchGdsName" name="btnSrchGdsName" uitype="normal" class="btn btn-xs btn-outline-dark" text="찾기"></sbux-button>
							</td>
							<th scope="row">배송처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spmtAddr" name="srch-inp-spmtAddr" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input"></td>
						</tr>
						<tr>
							<th scope="row">품목/품종</th>
						   	<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-item" name="srch-slt-item" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-vrty" name="srch-slt-vrty" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row">규격</th>
						   	<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-spcfct" name="srch-slt-spcfct" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
						</tr>
						<tr>
						    <th scope="row">발주금액/세액</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-ordrAmt" name="srch-inp-ordrAmt" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-txAmt" name="srch-inp-txAmt" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
						    <th scope="row">발주수량/입수</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-ordrQty" name="srch-inp-ordrQty" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-ordrAcqs" name="srch-inp-ordrAcqs" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row">낱개수량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-untQty" name="srch-inp-untQty" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="2" class="td_input"></td>
						</tr>
						<tr>
						    <th scope="row">박스단가</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-boxPrc" name="srch-inp-boxPrc" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"></td>
							<th scope="row">낱개단가</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-untprc" name="srch-inp-untprc" uitype="text" class="form-control input-sm" disabled></sbux-input>
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
					<div id="sb-area-grdRegOutordrInfo" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] 검색결과 -->
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createRegOutordrInfoGrid();
		
		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-fromOrdrDate", year+month+day);
	})
	
// 	var jsonRegOutordrInfoList = ['test','test']; // 그리드의 참조 데이터 주소 선언
	var jsonRegOutordrInfoList = [];
	
	var comboUesYnJsData1 = ['선택']
	
	function fn_createRegOutordrInfoGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRegOutordrInfo';
	    SBGridProperties.id = 'grdRegOutordrInfo';
	    SBGridProperties.jsonref = 'jsonRegOutordrInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
        	{caption: ['선택'], ref: 'slt', width: '100px', type: 'checkbox'},
            {caption: ['발주유형'], ref: 'gdsName', width: '100px', type: 'output'},
            {caption: ['발주일자'], ref: 'item', width: '100px', type: 'output'},
            {caption: ['납기일자'], ref: 'spcfct', width: '100px', type : 'output'},
            {caption: ['거래처'], ref: 'gdsGrd', width: '100px', type: 'output'},
            {caption: ['상품명'], ref: 'brand', width: '100px', type: 'output'},
            {caption: ['상품코드'], ref: 'plor', width: '100px', type: 'output'},
            {caption: ['배송처'], ref: 'pckgKind', width: '100px', type: 'output'},
            {caption: ['품목'], ref: 'cryn', width: '100px', type: 'output'},
            {caption: ['품종'], ref: 'wght', width: '100px', type: 'output'},
            {caption: ['규격'], ref: 'gdsName', width: '100px', type: 'output'},
            {caption: ['발주금액'], ref: 'item', width: '100px', type: 'output'},
            {caption: ['세액'], ref: 'gdsCd', width: '100px', type: 'output'},
            {caption: ['발주수량'], ref: 'gdsName', width: '100px', type: 'output'},
            {caption: ['입수'], ref: 'item', width: '100px', type: 'output'},
            {caption: ['낱개수량'], ref: 'spcfct', width: '100px', type: 'output'},
            {caption: ['박스단가'], ref: 'gdsGrd', width: '100px', type: 'output'},
            {caption: ['낱개단가'], ref: 'brand', width: '100px', type: 'output'},
            {caption: ['등록일자'], ref: 'plor', width: '100px', type: 'output'},
            {caption: ['등록자'], ref: 'pckgKind', width: '100px', type: 'output'}
        ];
        grdOutordrInfo = _SBGrid.create(SBGridProperties);
    }
</script>
</html>