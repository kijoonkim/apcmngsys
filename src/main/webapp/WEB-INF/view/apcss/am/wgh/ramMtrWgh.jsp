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
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_row tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" style="border-bottom:1px solid white " >APC명</th>
							<td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-input id="srch-inp-apcNm" name="srch-inp-apcNm" uitype="text" class="form-control input-sm"  disabled></sbux-input>
							</td>
							<td colspan="8"></td>
						</tr>
						<tr>
							<th scope="row">계량일자</th>
							<td class="td_input" style="border-right:hidden;" >
								<sbux-datepicker id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td colspan="2"></td>
							<th scope="row">생산자</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input uitype="text" id="srch-inp-prdcrNm" name="srch-inp-prdcrNm" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchPrdcr" name="btnSrchPrdcr" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"></sbux-button>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" jsondata-ref="jsonItem" unselected-text="전체" class="form-control input-sm" onchange="fn_selectItem" ></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;" >
								<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" jsondata-ref="jsonVrty" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row">입고구분</th>
							<td colspan="3" class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="rdo-wrhsSeCd_1" name="rdo-wrhsSeCd" uitype="normal" class="radio_label" value="1"></sbux-radio>
									<sbux-label class="radio_label" for-id="rdo-wrhsSeCd_1" text="일반매입"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-wrhsSeCd_2" name="rdo-wrhsSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="rdo-wrhsSeCd_2" text="공선"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-wrhsSeCd_3" name="rdo-wrhsSeCd" uitype="normal" class="radio_label" value="3" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="rdo-wrhsSeCd_3" text="매취"></sbux-label>
								</p>
							</td>
							<th scope="row">상품구분</th>
							<td colspan="3" class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="rdo-gdsSeCd_1" name="rdo-gdsSeCd" uitype="normal" class="radio_label" value="1" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="rdo-gdsSeCd_1" text="일반"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-gdsSeCd_2" name="rdo-gdsSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="rdo-gdsSeCd_2" text="GAP"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-gdsSeCd_3" name="rdo-gdsSeCd" uitype="normal" class="radio_label" value="3"></sbux-radio>
									<sbux-label class="radio_label" for-id="rdo-gdsSeCd_3" text="무농약"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-gdsSeCd_4" name="rdo-gdsSeCd" uitype="normal" class="radio_label" value="4"></sbux-radio>
									<sbux-label class="radio_label" for-id="rdo-gdsSeCd_4" text="유기농"></sbux-label>
								</p>
							</td>
							<th scope="row">운송구분</th>
							<td colspan="3" class="td_input">
								<p class="ad_input_row">
									<sbux-radio id="rdo-trsprtSeCd_1" name="rdo-trsprtSeCd" uitype="normal" class="radio_label" value="1" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="rdo-trsprtSeCd_1" text="자가"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-trsprtSeCd_2" name="rdo-trsprtSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="rdo-trsprtSeCd_2" text="용역"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-trsprtSeCd_3" name="rdo-trsprtSeCd" uitype="normal" class="radio_label" value="3"></sbux-radio>
									<sbux-label class="radio_label" for-id="rdo-trsprtSeCd_3" text="기타"></sbux-label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">전체중량 Kg</th>
							<td class="td_input" style="border-right:hidden;" >
								<sbux-input uitype="text" id="inp-wholWght" name="inp-wholWght" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2"></td>
							<th scope="row">공차중량 Kg</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-emptVhclWght" name="inp-emptVhclWght" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2"></td>
							<th scope="row">감량 %</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input uitype="text" id="inp-rdctRt" name="inp-rdctRt" class="form-control input-sm"></sbux-input>
							</td>
							<td style="border-right: hidden;">
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">감량 Kg</th>
							<td class="td_input" style="border-right:hidden;">
								<sbux-input uitype="text" id="inp-rdcdWght" name="inp-rdcdWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="2"></td>
							<th scope="row">실중량 Kg</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-actlWght" name="inp-actlWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="2"></td>
							<th scope="row">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-vhclno" name="inp-vhclno" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-button id="btnSrchVhclNo" name="btnSrchVhclNo" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_modalVhcl"></sbux-button>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">팔레트 Kg</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-pltWght" name="inp-pltWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchPltBx" name="btnSrchPltBx" class="btn btn-xs btn-outline-dark" text="입력" uitype="modal" target-id="modal-pltBx" onclick="fn_modalPltBx"></sbux-button>
							</td>
							<td></td>
							<th scope="row">박스 Kg</th>
							<td class="td_input" >
								<sbux-input uitype="text" id="inp-bxWght" name="inp-bxWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="2"></td>
							<th scope="row">입고중량 Kg</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-clclnWght" name="inp-clclnWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row">보관창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" uitype="single" jsondata-ref="jsonComWarehouse" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row">등급</th>
							<td class="td_input" >
								<sbux-select id="srch-slt-grdCd" name="srch-slt-grdCd" uitype="single" jsondata-ref="jsonGrd" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row">비고</th>
							<td colspan="3" class="td_input">
								<sbux-input uitype="text" id="inp-rmrk" name="inp-rmrk" class="form-control input-sm"></sbux-input>

							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>원물계량 내역</span></li>
					</ul>
				 	<div class="ad_tbl_toplist">
						<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="내려받기" class="btn btn-xs btn-outline-danger" onclick="fn_dwnld" >내려받기</sbux-button>
						<sbux-button id="btnUld" name="btnUld" uitype="normal" text="올리기" class="btn btn-xs btn-outline-danger" onclick="fn_uld">올리기</sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdWghPrfmnc" style="width:100%;height:340px;"></div>
				</div>
			</div>
				<!--[pp] //검색결과 -->
		</div>
	</section>
    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>

    <!-- 팔레트/박스 선택 Modal -->
    <div>
        <sbux-modal id="modal-pltBx" name="modal-pltBx" uitype="middle" header-title="원물입고 팔레트/박스 입고등록" body-html-id="body-modal-pltBx" footer-is-close-button="false" style="width:1200px"></sbux-modal>
    </div>
    <div id="body-modal-pltBx">
    	<jsp:include page="../../am/popup/pltBxPopup.jsp"></jsp:include>
    </div>

</body>
<script type="text/javascript">

	var jsonItem			= [];	// 품목 		itemCd		검색
	var jsonVrty			= [];	// 품종 		vrtyCd		검색
	var jsonGrd				= [];	// 등급 		vrtyCd		검색
	var jsonComWarehouse	= [];	// 팔레트/박스 	warehouse	검색
	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	gfn_setComCdSBSelect('srch-slt-warehouseSeCd', jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_apcCd);			// 창고
	 	gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonItem, gv_apcCd);	// 품목
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonVrty, gv_apcCd);	// 품종
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonVrty, 	gv_apcCd, itemCd);		// 품종
		gfn_setApcGrdsSBSelect('srch-slt-grdCd', 	jsonGrd, 	gv_apcCd, itemCd);		// 등급
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createWghPrfmncGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-wrhsYmd", year+month+day);
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);

		fn_initSBSelect();
	})

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
            {caption: ['계량번호'], ref: 'wghno', width: '100px', type: 'output'},
            {caption: ['생산자'], ref: 'prdcrNm', width: '100px', type: 'output'},
            {caption: ['품목'], ref: 'itemNm', width: '100px', type: 'output'},
            {caption: ['품종'], ref: 'vrtyNm', width: '100px', type: 'output'},
            {caption: ['상품구분'], ref: 'gdsSeNm', width: '100px', type: 'output'},
            {caption: ['입고구분'], ref: 'wrhsSeNm', width: '100px', type: 'output'},
            {caption: ['운송구분'], ref: 'trsprtSeNm', width: '100px', type: 'output'},
            {caption: ['전체중량'], ref: 'wholWght', width: '100px', type: 'output'},
            {caption: ['공차중량'], ref: 'emptVhclWght', width: '100px', type: 'output'},
            {caption: ['감량%'], ref: 'rdcdRt', width: '100px', type: 'output'},
            {caption: ['감량Kg'], ref: 'rdcdWght', width: '100px', type: 'output'},
            {caption: ['실중량'], ref: 'actlWght', width: '100px', type: 'output'},
            {caption: ['팔레트중량'], ref: 'pltWght', width: '100px', type: 'output'},
            {caption: ['박스중량'], ref: 'bxWght', width: '100px', type: 'output'},
            {caption: ['정산중량'], ref: 'clclnWght', width: '100px', type: 'output'},
            {caption: ['등급'], ref: 'grdNm', width: '100px', type: 'output'},
            {caption: ['차량번호'], ref: 'vhclno', width: '100px', type: 'output'},
            {caption: ['보관창고'], ref: 'warehouseSeNm', width: '100px', type: 'output'},
            {caption: ['비고'], ref: 'rmrk', width: '100px', type: 'output'}
        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
    }

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
</script>
</html>