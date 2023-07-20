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
					<h3 class="box-title" style="line-height: 30px;"> ▶ 원물계량등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocRawMtrWgh" name="btnDocRawMtrWgh" uitype="normal" text="계량확인서" class="btn btn-sm btn-primary"></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnInsert" name="btnInsert" uitype="normal" text="등록" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger"></sbux-button>
				</div>
			</div>
			<div></div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: 4%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 2%">
						<col style="width: 3%">
						<col style="width: 5%">
						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 12%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">APC 명</th>
							<td colspan="6" class="td_input"  style="border-right: hidden;">
								<sbux-input id="inp-apcNm" name="inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row">생산자</th>
							<td colspan="6" class="td_input"  style="border-right: hidden;">
								<sbux-input id="inp-prdcrNm" name="inp-prdcrNm" uitype="text" class="form-control input-sm">
							<td colspan="2" class="td_input"  style="border-right: hidden;">
								<sbux-button id="btnSrchPrdcr" name="btnSrchPrdcr" class="btn btn-xs btn-outline-dark" text="조회" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"></sbux-button>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row">품목 / 품종</th>
							<td colspan="2"class="td_input" style="border-right: hidden;">
								<sbux-select id="select-itemCd" name="select-itemCd" uitype="single" jsondata-ref="jsonComItemCd" unselected-text="단일선택" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="4"class="td_input" style="border-right: hidden;">
								<sbux-select id="select-vrtyCd" name="select-vrtyCd" uitype="single" jsondata-ref="jsonComVrtyCd" unselected-text="단일선택" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="3"class="td_input"  style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox id="chk-fxng" name="chk-fxng" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default" >고정</label>
								</p>
							</td>
							<td colspan="4" style="border-right: hidden;"></td>
						</tr>
						<tr>
							<th scope="row">계량일자</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="dtp-wrhsYmd" name="dtp-wrhsYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row">차량번호/성명</th>
							<td class="td_input">
								<sbux-input uitype="text" id="inp-vhclno" name="inp-vhclno" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVhclNo" name="btnSrchVhclNo" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_modalVhcl"></sbux-button>
							</td>
							<td colspan="4"class="td_input" >
								<sbux-input uitype="text" id="inp-drvrNm" name="inp-drvrNm" class="form-control input-sm" disabled></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row">전체/공차증량</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-wholWght" name="inp-wholWght" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="3"class="td_input"  style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-emptVhclWght" name="inp-emptVhclWght" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2"class="td_input" style="border-right: hidden;"><label class="bold">감량 %</label></td>
							<td class="td_input">
								<sbux-input uitype="text" id="inp-rdctRt" name="inp-rdctRt" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox id="rdctRt-chk-fxng" name="rdctRt-chk-fxng" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default" >고정</label>
								</p>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;" class="td_input"><label class="bold">감량 Kg</label></td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-rdcdWght" name="inp-rdcdWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input"><label class="bold">실중량 Kg</label></td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-actlWght" name="inp-actlWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">입고창고</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-select id="select-warehouseSeCd" name="select-warehouseSeCd" uitype="single" jsondata-ref="jsonComWarehouseSeCd" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="14"class="td_input" >
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-fxng" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default" >고정</label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row"  style="border-right: hidden;">팔레트/박스</th>
						 	<td style="border-right: hidden;">
						 		<sbux-button id="btnSrchPltBx" name="btnSrchPltBx" class="btn btn-xs btn-outline-dark" text="입력" uitype="modal" target-id="modal-pltBx" onclick="fn_modalPltBx"></sbux-button>
						 	</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-pltWght" name="inp-pltWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"><label class="bold">Kg</label></td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-bxWght" name="inp-bxWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="8" class="td_input" ><label class="bold">Kg</label></td>
						</tr>
						<tr>
							<th scope="row" >입고등급</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="select-grdCd" name="select-grdCd" uitype="single" jsondata-ref="jsonComGrdCd" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="14"></td>
						</tr>
						<tr>
							<th scope="row">정산중량</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-clclnWght" name="inp-clclnWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="14" class="td_input" ><label class="bold">Kg</label></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>개량등록 내역</span></li>
						</ul>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdWghPrfmnc" style="width:100%;height:200px;"></div>
				</div>

				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/vhclPopup.jsp"></jsp:include>
    </div>

    <!-- 팔레트/박스 선택 Modal -->
    <div>
        <sbux-modal id="modal-pltBx" name="modal-pltBx" uitype="middle" header-title="원물입고 팔레트/박스 입고등록" body-html-id="body-modal-pltBx" footer-is-close-button="false" style="width:1200px"></sbux-modal>
    </div>
    <div id="body-modal-pltBx">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/pltBxPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createWghPrfmncGrid();
	})

	/* const fn_initSBSelect = async function() {

			gfn_setComCdSBSelect('rdo-wrhsSeCd', jsonRadioWrhsSeCd, 'WRHS_SE_CD');	// 시스템유형

	} */
	var jsonWghPrfmnc = [];

	function fn_createWghPrfmncGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWghPrfmnc';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ['계량일자'], ref: 'wghno', width: '100px', type: 'output'},
	        {caption: ['순번'], ref: 'wghSn', width: '100px', type: 'output'},
	        {caption: ['생산자'], ref: 'prdcrNm', width: '100px', type: 'output'},
	        {caption: ['품목'], ref: 'itemNm', width: '100px', type: 'output'},
	        {caption: ['품종'], ref: 'vrtyNm', width: '100px', type: 'output'},
	        {caption: ['차량번호'], ref: 'vhclno', width: '100px', type: 'output'},
	        {caption: ['기사명'], ref: 'drvrNm', width: '100px', type: 'output'},
	        {caption: ['전체중량'], ref: 'wholWght', width: '100px', type: 'output'},
	        {caption: ['공차중량'], ref: 'emptVhclWght', width: '100px', type: 'output'},
	        {caption: ['감량Kg'], ref: 'rdcdWght', width: '100px', type: 'output'},
	        {caption: ['실중량'], ref: 'actlWght', width: '100px', type: 'output'},
	        {caption: ['정산중량'], ref: 'clclnWght', width: '100px', type: 'output'},
	        {caption: ['창고'], ref: 'warehouseSeNm', width: '100px', type: 'output'},
	        {caption: ['비고'], ref: 'rmrk', width: '100px', type: 'output'}
	    ];
	    grdWghPrfmnc = _SBGrid.create(SBGridProperties);
	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>