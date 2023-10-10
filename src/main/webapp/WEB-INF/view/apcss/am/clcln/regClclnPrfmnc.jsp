<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 정산자료등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" text="초기화" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_insert"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_delete"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[APC] START -->			
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>정산기준</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-clclnCrtr" name="srch-slt-clclnCrtr" uitype="single" unselected-text="선택" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>정산일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-fromClclnYmd" name="srch-dtp-fromClclnYmd" uitype="popup" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-toClclnYmd" name="srch-dtp-toClclnYmd" uitype="popup" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">확정여부</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-cfmtnYn" name="srch-slt-cfmtnYn" uitype="single" unselected-text="전체" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" unselected-text="전체" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" unselected-text="전체" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-prdcrNm" name="srch-inp-prdcrNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button 
									id="btnSrchPrdcrCd" 
									name="btnSrchPrdcrCD" 
									uitype="modal" 
									class="btn btn-xs btn-outline-dark" 
									text="찾기" target-id="modal-prdcr" 
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>정산 내역</span></li>
					</ul>
				 	<div class="ad_tbl_toplist_datepk">
				 		<table class="table table-bordered tbl_fixed">
				 			<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: auto">
							<col style="width: 180px">
							<col style="width: 82px">
						</colgroup>
						<tbody>
							<tr>
								<td style="border-left:hidden"></td>
								<td class="td_input" style="border-right:hidden; border-left:hidden" ><sbux-datepicker id="srch-dtp-startPrdctnYmd" name="srch-dtp-startPrdctnYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker></td>
								<td class="td_input" style="border-right:hidden;"><sbux-button id="btnCreateClclnData" name="btnCreateClclnData" uitype="normal" class="btn btn-xs btn-outline-dark btn_search" text="정산자료생성"></sbux-button></td>
							</tr>
						</tbody>
				 		</table>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdRegSlsPrfmnc" style="width:100%;height:540px;"></div>
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
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createRegSlsPrfmncGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-fromClclnYmd", year+month+day);
		SBUxMethod.set("srch-dtp-toClclnYmd", year+month+day);
	})

// 	var jsonRegSlsPrfmncList = ['test','test','test','test','test']; // 그리드의 참조 데이터 주소 선언
	var jsonRegSlsPrfmncList = [];

	function fn_createRegSlsPrfmncGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRegSlsPrfmnc';
	    SBGridProperties.id = 'grdRegSlsPrfmnc';
	    SBGridProperties.jsonref = 'jsonRegSlsPrfmncList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
		};
        SBGridProperties.columns = [
        	{caption: ['선택'], ref: 'slt', width: '100px', type: 'checkbox'},
            {caption: ['정산일자'], ref: 'clclnYmd', width: '100px', type: 'output'},
            {caption: ['생산자'], ref: 'prdcrCd', width: '100px', type: 'output'},
            {caption: ['입고구분'], ref: 'wrhsSeCd', width: '100px', type : 'output'},
            {caption: ['상품구분'], ref: 'gdsSeCd', width: '100px', type: 'output'},
            {caption: ['품목'], ref: 'itemCd', width: '100px', type: 'output'},
            {caption: ['품종'], ref: 'vrtyCd', width: '100px', type: 'output'},
            {caption: ['규격'], ref: 'spcfctCd', width: '100px', type: 'output'},
            {caption: ['브랜드'], ref: 'brndCd', width: '100px', type: 'output'},
            {caption: ['등급'], ref: 'grdCd', width: '100px', type: 'output'},
            {caption: ['수량'], ref: 'qntt', width: '100px', type: 'output'},
            {caption: ['중량'], ref: 'wght', width: '100px', type: 'output'},
            {caption: ['계산금액'], ref: 'rkngAmt', width: '100px', type: 'output'},
            {caption: ['확정금액'], ref: 'cfmtnAmt', width: '100px', type: 'output'},
            {caption: ['확정여부'], ref: 'cfmtnYn', width: '100px', type: 'output'}
        ];
        grdRegSlsPrfmnc = _SBGrid.create(SBGridProperties);
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
	
	const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}
	
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			//SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}
	
</script>
</html>