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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 발주정보조회</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnRegPrdctnCmnd" name="btnRegPrdctnCmnd" uitype="normal" class="btn btn-sm btn-outline-success" text="생산지시 등록"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-dark" text="조회" onclick="fn_search"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" class="btn btn-sm btn-outline-dark" text="등록" onclick="fn_insert"></sbux-button>
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
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC명</th>
					    	<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
	                	</tr>
						<tr>
					        <th scope="row">접수여부</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-rcptYn" name="srch-slt-rcptYn" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row">발주일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-fromOutordrYmd" name="srch-dtp-fromOutordrYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-toOutordrYmd" name="srch-dtp-toOutordrYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row">발주유형</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-outordrType" name="srch-slt-outordrType" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">품목/품종</th>
						    <td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
						    <td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
						    <th scope="row">거래처명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchCnptNm" name="btnSrchCnptNm" uitype="modal" class="btn btn-xs btn-outline-dark" text="찾기" target-id="modal-cnpt" onclick="fn_modalCnpt"></sbux-button>
							</td>
							<th scope="row">납기일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-dudtYmd" name="srch-dtp-dudtYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">상품명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-gdsNm" name="srch-inp-gdsNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchGdsNm" name="btnSrchGdsNm" uitype="normal" class="btn btn-xs btn-outline-dark" text="찾기"></sbux-button>
							</td>
							<th scope="row">지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-cmndYmd" name="srch-dtp-cmndYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td colspan="2"></td>
							<th scope="row">생산설비</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-prdctnFclt" name="srch-slt-prdctnFclt" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>발주 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnRcptAll" name="btnRcptAll" uitype="normal" class="btn btn-xs btn-outline-dark" text="일괄접수"></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdOutordrInfo" style="width:100%;height:300px;"></div>
				</div>
				<td>&nbsp;</td>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdOutordrGdsInfo" style="width:100%;height:300px;"></div>
				</div>
				<td>&nbsp;</td>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdOutordrCntrInfo" style="width:100%;height:300px;"></div>
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
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createOutordrInfoGrid();
		
		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-fromOutordrYmd", year+month+day);
		SBUxMethod.set("srch-dtp-toOutordrYmd", year+month+day);
		SBUxMethod.set("srch-dtp-cmndYmd", year+month+day);
	})
	
// 	var jsonOutordrInfoList = ['test','test']; // 그리드의 참조 데이터 주소 선언
	var jsonOutordrInfoList = [];
	
	var comboUesYnJsData1 = ['']
	
	function fn_createOutordrInfoGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdOutordrInfo';
	    SBGridProperties.id = 'grdOutordrInfo';
	    SBGridProperties.jsonref = 'jsonOutordrInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
        	{caption: [''], ref: 'slt', width: '100px', type: 'checkbox'},
            {caption: ['접수일자'], ref: 'rcptYmd', width: '100px', type: 'output'},
            {caption: ['발주유형'], ref: 'outordrType', width: '100px', type: 'output'},
            {caption: ['접수여부'], ref: 'rcptYn', width: '100px', type : 'inputcombo', 
            	typeinfo : {ref:'comboUesYnJsData1', label:'label', value:'value', oneclickedit: true, displayui : true}},
            {caption: ['발주번호'], ref: 'outordrno', width: '100px', type: 'output'},
            {caption: ['거래처명'], ref: 'cnptNm', width: '100px', type: 'output'},
            {caption: ['납기일자'], ref: 'dudtYmd', width: '100px', type: 'output'},
            {caption: ['발주일자'], ref: 'outordrYmd', width: '100px', type: 'output'},
            {caption: ['주문자'], ref: 'ordrCd', width: '100px', type: 'output'},
            {caption: ['공급자명'], ref: 'splyPrsn', width: '100px', type: 'output'},
            {caption: ['상품명'], ref: 'gdsNm', width: '100px', type: 'output'},
            {caption: ['상품코드'], ref: 'gdsCd', width: '100px', type: 'output'},
            {caption: ['배송지'], ref: 'dldtnCd', width: '100px', type: 'output'},
            {caption: ['품목'], ref: 'itemCd', width: '100px', type: 'output'},
            {caption: ['품종'], ref: 'vrtyCd', width: '100px', type: 'output'},
            {caption: ['규격'], ref: 'spcfctCd', width: '100px', type: 'output'},
            {caption: ['입수'], ref: 'bxGdsQntt', width: '100px', type: 'output'},
            {caption: ['발주수량'], ref: 'outordrQntt', width: '100px', type: 'output'},
            {caption: ['낱개수량'], ref: 'pieceQntt', width: '100px', type: 'output'},
            {caption: ['단위'], ref: 'unitCd', width: '100px', type: 'output'},
            {caption: ['박스단가'], ref: 'bxUntprc', width: '100px', type: 'output'},
            {caption: ['발주단가'], ref: 'outordrUntrc', width: '100px', type: 'output'},
            {caption: ['발주단위'], ref: 'outordrUnit', width: '100px', type: 'output'},
            {caption: ['LOT'], ref: 'lot', width: '100px', type: 'output'},
            {caption: ['세액'], ref: 'txAmt', width: '100px', type: 'output'},
            {caption: ['발주금액'], ref: 'outordrAmt', width: '100px', type: 'output'},
            {caption: ['입고형태'], ref: 'wrhsType', width: '100px', type: 'output'},
            {caption: ['문서번호'], ref: 'docno', width: '100px', type: 'output'},
            {caption: ['도크정보'], ref: 'dockInfo', width: '100px', type: 'output'},
            {caption: ['센터구분'], ref: 'cntrSe', width: '100px', type: 'output'},
            {caption: ['바이어명'], ref: 'buyerNm', width: '100px', type: 'output'},
            {caption: ['센터입하일'], ref: 'cntrRcvdWrhsYmd', width: '100px', type: 'output'},
            {caption: ['센터명'], ref: 'cntrNm', width: '100px', type: 'output'},
            {caption: ['납품구분'], ref: 'dlvgdsSeCd', width: '100px', type: 'output'},
            {caption: ['기타'], ref: 'etc', width: '100px', type: 'output'},
            {caption: ['접수APC (농협)'], ref: 'rcptCfmtnApcCd', width: '100px', type: 'output'},
            {caption: ['생산지시번호'], ref: 'prdctnCmndno', width: '100px', type: 'output'}
        ];
        grdOutordrInfo = _SBGrid.create(SBGridProperties);
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>