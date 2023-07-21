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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 포장실적조회</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocSort" name="btnDocSort" uitype="normal" class="btn btn-sm btn-success" text="선별확인서" onclick="fn_docSort"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
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
								<sbux-input id="srch-inp-apcName" name="srch-inp-apcName" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">포장일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-fromPckgDate" name="srch-dtp-fromPckgDate" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-toPckgDate" name="srch-dtp-toPckgDate" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
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
							<th scope="row">포장기</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-pckg" name="srch-slt-pckg" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" style="border-right: hidden;">저장창고</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-strg" name="srch-slt-strg" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan= "2" class="td_input" style="border-right: hidden;">&nbsp;</td>
							<th scope="row">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-spcfct" name="srch-slt-spcfct" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"></td>
							<th scope="row" style="border-right: hidden;">대표생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-rprsPrdctr" name="srch-inp-rprsPrdctr" uitype="text" class="form-control input-sm" title="대표생산자"></sbux-input>
						    </td>
						    <td class="td_input">
					    		<sbux-button id="btnSrchRprsPrdcr" name="btnSrchRprsPrdcr" uitype="modal" class="btn btn-xs btn-outline-dark" text="찾기" target-id="modal-prdcr" onclick="fn_modalPrdcr"></sbux-button>
							</td>
						</tr>
						<tr>
							<th scope="row">상품등급</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-gdsGrd" name="srch-slt-gdsGrd" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>포장내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdPckgInpt" style="width:100%;height:300px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	 <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createPckgInptGrid();
		
		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-fromPckgDate", year+month+day);
		SBUxMethod.set("srch-dtp-toPckgDate", year+month+day);
	})
	
	function fn_createPckgInptGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgInpt';
	    SBGridProperties.id = 'grdPckgInpt';
	    SBGridProperties.jsonref = 'jsonPckgInpt';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['포장내역','포장내역'], ref: 'pckgDsctn', width: '100px', type: 'output'},
            {caption: ['포장일자','포장일자'], ref: 'pckgDate', width: '100px', type: 'output'},
            {caption: ['지시번호','지시번호'], ref: 'ordrNm', width: '100px', type: 'output'},
            {caption: ['품종','품종'], ref: 'vrty', width: '100px', type: 'output'},
            {caption: ['규격','규격'], ref: 'spcfct', width: '100px', type: 'output'},
            {caption: ['상품등급','상품등급'], ref: 'gdsGrd', width: '100px', type: 'output'},
            {caption: ['중량','중량'], ref: 'wght', width: '100px', type: 'output'},
            {caption: ['포장기','포장기'], ref: 'pckg', width: '100px', type: 'output'},
            {caption: ['대표생산자','대표생산자'], ref: 'rprsPrdctr', width: '100px', type: 'output'},
            {caption: ['창고','창고'], ref: 'strg', width: '100px', type: 'output'},
            {caption: ['포장','수량'], ref: 'pckgQty', width: '100px', type: 'output'},
            {caption: ['포장','중량'], ref: 'pckgWght', width: '100px', type: 'output'},
            {caption: ['출하','수량'], ref: 'shpgotQty', width: '100px', type: 'output'},
            {caption: ['출하','중량'], ref: 'shpgotWght', width: '100px', type: 'output'}
        ];
        grdPckgInpt = _SBGrid.create(SBGridProperties);
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>