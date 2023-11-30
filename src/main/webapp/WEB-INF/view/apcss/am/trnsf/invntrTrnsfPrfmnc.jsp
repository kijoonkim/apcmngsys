<%
/**
 * @Class Name : invntrTrnsf.jsp
 * @Description : 재고이송확정 화면
 * @author SI개발부
 * @since 2023.11.20
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.11.20   	김호			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3><!-- 재고이송확정 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="이송조회" onclick="fn_search"></sbux-button>
				</div>
			</div>

			<div class="box-body">
			<!--[APC] START -->
				<%@ include file="../../../frame/inc/apcSelect.jsp" %>
			<!--[APC] END -->
				<!--[pp] 검색 -->
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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">이송일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-trnsfYmdFrom" name="srch-dtp-trnsfYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm" onchange="fn_dtpChange(srch-dtp-trnsfYmdFrom)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-trnsfYmdTo" name="srch-dtp-trnsfYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm" onchange="fn_dtpChange(srch-dtp-trnsfYmdTo)"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">이송APC</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-trnsfApcCd"
									name="srch-slt-trnsfApcCd"
									class="form-control input-sm"
									jsondata-ref="jsonTrnsfApcCd"
								></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>재고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-invntrSeCd"
									name="srch-slt-invntrSeCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									jsondata-ref="jsonComInvntrSeCd"
									onchange="fn_invntrSeCdChg"
								/>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">상품구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-gdsSe"
									name="srch-slt-gdsSe"
									class="form-control input-sm"
									jsondata-ref="jsonComGdsSeCd"
								/>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">입고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-wrhsSeCd"
									name="srch-slt-wrhsSeCd"
									class="form-control input-sm"
									jsondata-ref="jsonComWrhsSeCd"
								/>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonComItem"
									onchange="fn_selectItem"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComVrty"
									onchange="fn_selectVrty"
								></sbux-select>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>이송 요청 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdInvntrTrnsf" style="width:100%;height:188px;"></div>
				</div>
				<br>
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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio
										id="dtl-rdo-wrhsSeCd"
										name="dtl-rdo-wrhsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonDtlWrhsSeCd"
									></sbux-radio>
								</p>
							</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>상품구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio
										id="dtl-rdo-gdsSeCd"
										name="dtl-rdo-gdsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonDtlGdsSeCd">
									</sbux-radio>
								</p>
							</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>운송구분</th>
							<td colspan="3">
								<p class="ad_input_row">
									<sbux-radio
										id="dtl-rdo-trsprtSeCd"
										name="dtl-rdo-trsprtSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonDtlTrsprtSeCd"
									></sbux-radio>
								</p>
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg"><span class="data_required"></span>생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
								<sbux-input
									uitype="text"
									id="dtl-inp-prdcrNm"
									name="dtl-inp-prdcrNm"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocompleteDtl"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNmDtl(event)"
        							autocomplete-select-callback="fn_onSelectPrdcrNmDtl"
   								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnDtlprdcr"
									name="btnDtlprdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcrDtl"
								></sbux-button>
							</td>
							<td></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="dtl-slt-itemCd"
									name="dtl-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonDtlItem"
									onchange="fn_selectDtlItem"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="dtl-slt-vrtyCd"
									name="dtl-slt-vrtyCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonDtlVrty"
									onchange="fn_selectDtlVrty"
								></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-slt-warehouseSeCd"
									name="dtl-slt-warehouseSeCd"
									uitype="single"
									unselected-text="선택"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									jsondata-ref="jsonDtlWarehouse"
								></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-spcfctCd"
									name="dtl-slt-spcfctCd"
									uitype="single"
									unselected-text="선택"
									class="form-control input-sm"
									jsondata-ref="jsonDtlSpcfct"
								></sbux-select>
							</td>
							<td></td>
							<td></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>포장단위</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-slt-spmtPckgUnit"
									name="dtl-slt-spmtPckgUnit"
									uitype="single"
									unselected-text="선택"
									class="form-control input-sm"
									jsondata-ref="jsonDtlSpmtPckgUnit"
								></sbux-select>
							</td>
							<td></td>
							<td></td>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="3" class="td_input">
								<sbux-input id="dtl-inp-rmrk" name="dtl-inp-rmrk" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>등급</th>
							<td class="td_input" colspan="11">
								<jsp:include page="../../am/popup/apcStdGrdSelect.jsp"></jsp:include>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>이송확정 내역</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
						<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_del"></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdInvntrTrnsCfmtn" style="height:146px;"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal
        	id="modal-prdcr"
        	name="modal-prdcr"
        	uitype="middle"
        	header-title="생산자 선택"
        	body-html-id="body-modal-prdcr"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComItem			= [];	// 품목 		itemCd			검색
	var jsonComVrty			= [] 	// 품종			vrtyCd			검색
	var jsonComGdsSeCd		= [];	// 상품구분 	gdsSeCd			검색
	var jsonComWrhsSeCd		= [];	// 입고구분 	wrhsSeCd		검색
	var jsonComInvntrSeCd	= [];	// 재고구분		invntrSeCd		검색
	var jsonTrnsfApcCd		= [];	// 이송APC  	trnsfApcCd		검색
	var jsonDtlGdsSeCd		= [];	// 상품구분 	gdsSeCd			등록
	var jsonDtlWrhsSeCd		= [];	// 입고구분 	wrhsSeCd		등록
	var jsonDtlTrsprtSeCd	= [];	// 운송구분 	trsprtSeCd		등록
	var jsonDtlItem			= [];	// 품목 		itemCd			등록
	var jsonDtlVrty			= [] 	// 품종			vrtyCd			등록
	var jsonDtlSpcfct		= [] 	// 규격			scpfctCd		등록
	var jsonDtlSpmtPckgUnit	= [] 	// 포장구분		spmtPckgUnitCd	등록
	var jsonDtlWarehouse	= [];	// 창고 		warehouseSeCd	등록

	var jsonDataPrdcr 		= [];
    var jsonPrdcrDtl		= [];
    var jsonPrdcrAutocompleteDtl = [];

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSBSelect();
		fn_createInvntrTrnsfGrid();

		SBUxMethod.set("srch-dtp-trnsfYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-trnsfYmdTo", gfn_dateToYmd(new Date()));
		fn_getPrdcrs();
		stdGrdSelect.init();

		SBUxMethod.set("srch-slt-invntrSeCd", "1");

		fn_createInvntrTrnsCfmtnfGrid();
	});

	const fn_dtpChange = function(){
		let trnsfYmdFrom = SBUxMethod.get("srch-dtp-trnsfYmdFrom");
		let trnsfYmdTo = SBUxMethod.get("srch-dtp-trnsfYmdTo");
		if(gfn_diffDate(trnsfYmdFrom, trnsfYmdTo) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
			SBUxMethod.set("srch-dtp-trnsfYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-trnsfYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}


	const fn_initSBSelect = async function() {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let rst = await Promise.all([
			gfn_setApcInfoSBSelect('srch-slt-trnsfApcCd', 	jsonTrnsfApcCd, 	gv_selectedApcCd),						// 이송APC
			gfn_setComCdSBSelect('srch-slt-wrhsSeCd', 		jsonComWrhsSeCd, 	'WRHS_SE_CD'),							// 입고구분
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),						// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_selectedApcCd),						// 품종
		 	gfn_setComCdSBSelect('srch-slt-gdsSe', 			jsonComGdsSeCd, 	'GDS_SE_CD', 		gv_selectedApcCd),	// 상품구분
		 	gfn_setComCdSBSelect('srch-slt-invntrSeCd', 	jsonComInvntrSeCd, 	'INVNTR_SE_CD'),						// 재고구분
		 	gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', 	jsonDtlWarehouse, 	'WAREHOUSE_SE_CD', 	gv_selectedApcCd),	// 창고
		 	gfn_setComCdSBSelect('dtl-rdo-wrhsSeCd', 		jsonDtlWrhsSeCd, 	'WRHS_SE_CD'), 							// 입고구분 등록
			gfn_setComCdSBSelect('dtl-rdo-gdsSeCd', 		jsonDtlGdsSeCd, 	'GDS_SE_CD', 		gv_selectedApcCd), 	// 상품구분 등록
			gfn_setComCdSBSelect('dtl-rdo-trsprtSeCd', 		jsonDtlTrsprtSeCd, 	'TRSPRT_SE_CD'), 						// 운송구분 등록
		 	gfn_setApcItemSBSelect('dtl-slt-itemCd', 		jsonDtlItem, 		gv_selectedApcCd),						// 품목 등록
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', 		jsonDtlVrty, 		gv_selectedApcCd),						// 품종 등록
		])

		SBUxMethod.refresh('dtl-rdo-wrhsSeCd');
		SBUxMethod.refresh('dtl-rdo-trsprtSeCd');
		SBUxMethod.set('dtl-rdo-wrhsSeCd', '3');
		SBUxMethod.set('dtl-rdo-gdsSeCd', '1');
		SBUxMethod.set('dtl-rdo-trsprtSeCd', '1');

		SBUxMethod.attr('dtl-slt-spcfctCd', 'disabled', 'true')
		SBUxMethod.attr('dtl-slt-spmtPckgUnit', 'disabled', 'true')

	}

	const fn_selectItem = async function(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let rst = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 			jsonComVrty, 			gv_selectedApcCd, itemCd),			// 품종
		])

		SBUxMethod.set("dtl-slt-itemCd", itemCd);
		fn_selectDtlItem();

	}

	const fn_selectVrty = async function(){
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let itemCd = "";
		for(i=0;i<jsonComVrty.length;i++){
			if(jsonComVrty[i].value == vrtyCd){
				itemCd = jsonComVrty[i].mastervalue;
			}
		}
		SBUxMethod.set("srch-slt-itemCd", itemCd);
	}

	const fn_selectDtlItem = async function(){

		let vrtyCd = SBUxMethod.get("dtl-slt-vrtyCd");

		var grdSeCd = "";
		let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");
		if(invntrSeCd == 1){
			grdSeCd = _GRD_SE_CD_WRHS
		}else if(invntrSeCd == 2){
			grdSeCd = _GRD_SE_CD_SORT
		}else if(invntrSeCd == 3){
			grdSeCd = _GRD_SE_CD_GDS
		}

		let itemCd = SBUxMethod.get("dtl-slt-itemCd");
		let rst = await Promise.all([
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', 				jsonDtlVrty, 			gv_selectedApcCd, itemCd),	// 품종
			gfn_setApcSpcfctsSBSelect('dtl-slt-spcfctCd',			jsonDtlSpcfct, 			gv_selectedApcCd, itemCd), 	// 규격
			gfn_setSpmtPckgUnitSBSelect('dtl-slt-spmtPckgUnit', 	jsonDtlSpmtPckgUnit, 	gv_selectedApcCd, itemCd),	// 포장구분
			stdGrdSelect.setStdGrd(gv_selectedApcCd, grdSeCd, itemCd),
		])

		if(gfn_isEmpty(itemCd)){
			jsonDtlSpcfct.length = 0;
			jsonDtlSpmtPckgUnit.length = 0;
			SBUxMethod.refresh("dtl-slt-spmtPckgUnit");
			SBUxMethod.refresh("dtl-slt-vrtyCd");
			SBUxMethod.set("srch-inp-wghtAvg", "");
		}
		if(!gfn_isEmpty(itemCd) && !gfn_isEmpty(vrtyCd)){
			SBUxMethod.set("dtl-slt-vrtyCd", vrtyCd);
		}

		fn_invntrSeCdDisabled();

	}
	const fn_selectDtlVrty = async function(){

		let vrtyCd = SBUxMethod.get("dtl-slt-vrtyCd");
		let itemCd = "";
		for(i=0;i<jsonComVrty.length;i++){
			if(jsonComVrty[i].value == vrtyCd){
				itemCd = jsonComVrty[i].mastervalue;
			}
		}

		var grdSeCd = "";
		let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");
		if(invntrSeCd == 1){
			grdSeCd = _GRD_SE_CD_WRHS
		}else if(invntrSeCd == 2){
			grdSeCd = _GRD_SE_CD_SORT
		}else if(invntrSeCd == 3){
			grdSeCd = _GRD_SE_CD_GDS
		}
		SBUxMethod.set("dtl-slt-itemCd", itemCd);
		let rst = await Promise.all([
			gfn_setApcSpcfctsSBSelect('dtl-slt-spcfctCd',			jsonDtlSpcfct, 			gv_selectedApcCd, itemCd), 	// 규격
			gfn_setSpmtPckgUnitSBSelect('dtl-slt-spmtPckgUnit', 	jsonDtlSpmtPckgUnit, 	gv_selectedApcCd, itemCd),	// 포장구분
			stdGrdSelect.setStdGrd(gv_selectedApcCd, grdSeCd, itemCd),
		])
		SBUxMethod.refresh("dtl-slt-spmtPckgUnitCd");

		fn_invntrSeCdDisabled();

	}

	const fn_invntrSeCdDisabled = function (){
		let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");
		if(invntrSeCd == 1){
			SBUxMethod.attr('dtl-slt-spcfctCd', 'disabled', 'true');
			SBUxMethod.attr('dtl-slt-spmtPckgUnit', 'disabled', 'true');
		}else if (invntrSeCd == 2){
			SBUxMethod.attr('dtl-slt-spcfctCd', 'disabled', 'false');
			SBUxMethod.attr('dtl-slt-spmtPckgUnit', 'disabled', 'true');
		}else if(invntrSeCd == 3){
			SBUxMethod.attr('dtl-slt-spcfctCd', 'disabled', 'true');
			SBUxMethod.attr('dtl-slt-spmtPckgUnit', 'disabled', 'false');
		}

		jsonInvntrTrnsfCfmtn.length = 0;
		grdInvntrTrnsfCfmtn.rebuild();

	}

	const fn_invntrSeCdChg = function(){
		fn_invntrSeCdDisabled();
		let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");
		let grdSeCd = "";
		if(invntrSeCd == 1){
			grdSeCd = _GRD_SE_CD_WRHS

		}else if (invntrSeCd == 2){
			grdSeCd = _GRD_SE_CD_SORT
		}else if(invntrSeCd == 3){
			grdSeCd = _GRD_SE_CD_GDS
		}

		fn_reSet();

		stdGrdSelect.setStdGrd(gv_selectedApcCd, grdSeCd, "")

		fn_createInvntrTrnsCfmtnfGrid();
	}

	const fn_reSet = function(){
		SBUxMethod.set("dtl-inp-prdcrCd", "");
		SBUxMethod.set("dtl-inp-prdcrNm", "");
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:''");
		SBUxMethod.set("dtl-slt-itemCd", "");
		SBUxMethod.set("dtl-slt-vrtyCd", "");
		SBUxMethod.set("dtl-inp-rmrk", "");
		SBUxMethod.set("dtl-slt-spmtPckgUnit", "");
		SBUxMethod.set("dtl-rdo-gdsSeCd", "1");
		SBUxMethod.set("dtl-rdo-wrhsSeCd", "3");
		SBUxMethod.set("dtl-rdo-trsprtSeCd", "1");
		SBUxMethod.set("srch-inp-wghtAvg", "");

	}


	const fn_createInvntrTrnsfGrid = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdInvntrTrnsf';
	    SBGridProperties.id = 'grdInvntrTrnsf';
	    SBGridProperties.jsonref = 'jsonInvntrTrnsf';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
        	{caption : ["선택", "선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ['이송APC','이송APC'], 			ref: 'apcNm', 		width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['이송일자','이송일자'], 			ref: 'trnsfYmd', 	width: '110px', type: 'output', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['재고구분','재고구분'], 			ref: 'invntrSeNm', 	width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['입고번호','입고번호'], 			ref: 'prcsno', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['입고일자','입고일자'], 			ref: 'wrhsYmd', 	width: '110px', type: 'output', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['등급','등급'], 					ref: 'grdNm', 		width: '90px', type: 'output', style: 'text-align:center'},
            {caption: ['생산자','생산자'], 				ref: 'prdcrNm',	 	width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['품목','품목'], 					ref: 'itemNm', 		width: '90px', type: 'output', style: 'text-align:center'},
            {caption: ['품종','품종'], 					ref: 'vrtyNm', 		width: '90px', type: 'output', style: 'text-align:center'},
            {caption: ['규격','규격'], 					ref: 'spcfctNm', 	width: '90px', type: 'output', style: 'text-align:center'},
            {caption: ['상품구분','상품구분'], 			ref: 'gdsSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['입고구분','입고구분'], 			ref: 'wrhsSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['운송구분','운송구분'], 			ref: 'trsprtSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['창고','창고'], 					ref: 'warehouseSeNm', width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['이송','수량'], 					ref: 'trnsfQntt', 	width: '60px', type: 'output', style: 'text-align:right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['이송','중량'], 					ref: 'trnsfWght', 	width: '80px', type: 'output', style: 'text-align:right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['확정여부','확정여부'], 			ref: 'cfmtnNm', 	width: '100px', type: 'output', style: 'text-align:center'}
        ];
        grdInvntrTrnsf = _SBGrid.create(SBGridProperties);

    }

	const fn_createInvntrTrnsCfmtnfGrid = function() {

		var SBGridPropertiesCfmtn = {};
        SBGridPropertiesCfmtn.parentid = 'sb-area-grdInvntrTrnsCfmtn';
        SBGridPropertiesCfmtn.id = 'grdInvntrTrnsfCfmtn';
        SBGridPropertiesCfmtn.jsonref = 'jsonInvntrTrnsfCfmtn';
        SBGridPropertiesCfmtn.emptyrecords = '데이터가 없습니다.';
        SBGridPropertiesCfmtn.selectmode = 'byrow';
        SBGridPropertiesCfmtn.extendlastcol = 'scroll';
        const cfmtnCloumns = [];
        let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");
        cfmtnCloumns.push(
        		{caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                    typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
                {caption: ['이송APC'], 		ref: 'trnsfApcNm', 	width: '150px', type: 'output', style: 'text-align:center'},
                {caption: ['확정일자'], 	ref: 'cfmtnYmd', 	width: '110px', type: 'output', style: 'text-align:center',
                	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
                {caption: ['입고번호'], 	ref: 'cfmtnno', 	width: '120px', type: 'output', style: 'text-align:center'},
        )

        if(invntrSeCd == "2" || invntrSeCd == "3"){
        	cfmtnCloumns.push(
        			{caption: ['입고순번'], 	ref: 'cfmtnSn', 		width: '60px', type: 'output', style: 'text-align:center'},
            )
        }
        if(invntrSeCd == "1" || invntrSeCd == "2"){
	        cfmtnCloumns.push(
	        		{caption: ['입고구분'], 	ref: 'wrhsSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},

	        )
        }
        if(invntrSeCd == "1"){
	        cfmtnCloumns.push(
	        		{caption: ['운송구분'], 	ref: 'trsprtSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},

	        )
        }
        cfmtnCloumns.push(
        		{caption: ['상품구분'], 	ref: 'gdsSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},
               	{caption: ['생산자'], 		ref: 'prdcrNm',	 	width: '100px', type: 'output', style: 'text-align:center'},
                {caption: ['품목'], 		ref: 'itemNm', 		width: '90px', type: 'output', style: 'text-align:center'},
                {caption: ['품종'], 		ref: 'vrtyNm', 		width: '90px', type: 'output', style: 'text-align:center'},
        )

        if(invntrSeCd == "2" || invntrSeCd == "3"){
        	cfmtnCloumns.push(
        			{caption: ['규격'], 	ref: 'spcfctNm', 	width: '90px', type: 'output', style: 'text-align:center'},
        	)
        }
        if(invntrSeCd == "3"){
        	cfmtnCloumns.push(
        			{caption: ['포장단위'], ref: 'spmtPckgUnitNm', 	width: '120px', type: 'output', style: 'text-align:center'},
        	)
        }
        cfmtnCloumns.push(
        		{caption: ['등급'], 		ref: 'grdNm', 		width: '90px', type: 'output', style: 'text-align:center'},
        		{caption: ['창고'], 		ref: 'warehouseSeNm', width: '100px', type: 'output', style: 'text-align:center'},
        		{caption: ['이송수량'], 	ref: 'invntrQntt', 	width: '60px', type: 'output', style: 'text-align:right',
                	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
                {caption: ['이송중량'], 	ref: 'invntrWght', 	width: '80px', type: 'output', style: 'text-align:right',
                	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
                {caption: ['비고'], 		ref: 'rmrk', 	width: '100px', type: 'output', style: 'text-align:center'}
        	)
        SBGridPropertiesCfmtn.columns = cfmtnCloumns;
        grdInvntrTrnsfCfmtn = _SBGrid.create(SBGridPropertiesCfmtn);
	}


	const fn_save = async function(){
		let itemCd			= SBUxMethod.get("dtl-slt-itemCd");
		let vrtyCd			= SBUxMethod.get("dtl-slt-vrtyCd");
		let prdcrCd			= SBUxMethod.get("dtl-inp-prdcrCd");
		let gdsSeCd			= SBUxMethod.get("dtl-rdo-gdsSeCd");
		let wrhsSeCd		= SBUxMethod.get("dtl-rdo-wrhsSeCd");
		let trsprtSeCd		= SBUxMethod.get("dtl-rdo-trsprtSeCd");
		let invntrSeCd		= SBUxMethod.get("srch-slt-invntrSeCd");
		let spmtPckgUnitCd	= SBUxMethod.get("dtl-slt-spmtPckgUnit");
		let warehouseSeCd	= SBUxMethod.get("dtl-slt-warehouseSeCd");
		let spcfctCd		= SBUxMethod.get("dtl-slt-spcfctCd");
		let rmrk			= SBUxMethod.get("dtl-inp-rmrk");

		if(!gfn_isEmpty(spmtPckgUnitCd)){
			for(let i=0; i<jsonDtlSpmtPckgUnit.length;i++){
				if(jsonDtlSpmtPckgUnit[i].spmtPckgUnitCd == spmtPckgUnitCd){
					spcfctCd = jsonDtlSpmtPckgUnit[i].spcfctCd;
				}
			}
		}

		let stdGrd = stdGrdSelect.getStdGrd();
		let jgmt = stdGrd.grdJgmt.grdCd;

		let grdRows = grdInvntrTrnsf.getCheckedRows(0);

		if(grdRows.length == 0){
    		gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

		if (gfn_isEmpty(invntrSeCd)) {
    		gfn_comAlert("W0001", "재고구분");		//	W0002	{0}을/를 선택하세요.
            return;
    	}

		if (gfn_isEmpty(itemCd)) {
    		gfn_comAlert("W0001", "품목");			//	W0002	{0}을/를 선택하세요.
            return;
    	}

		if (gfn_isEmpty(vrtyCd)) {
    		gfn_comAlert("W0001", "품종");			//	W0002	{0}을/를 선택하세요.
            return;
    	}

		if (gfn_isEmpty(prdcrCd)) {
    		gfn_comAlert("W0001", "생산자");		//	W0002	{0}을/를 선택하세요.
            return;
    	}

		if (gfn_isEmpty(jgmt)) {
    		gfn_comAlert("W0001", "등급");			//	W0002	{0}을/를 선택하세요.
            return;
    	}

		if(invntrSeCd == 2){
			if (gfn_isEmpty(spcfctCd)) {
	    		gfn_comAlert("W0001", "규격");		//	W0002	{0}을/를 선택하세요.
	            return;
	    	}
		}
		if(invntrSeCd == 3){
			if (gfn_isEmpty(spmtPckgUnitCd)) {
	    		gfn_comAlert("W0001", "포장단위");	//	W0002	{0}을/를 선택하세요.
	            return;
	    	}
		}
		if (gfn_isEmpty(warehouseSeCd)) {
    		gfn_comAlert("W0001", "창고");	//	W0002	{0}을/를 선택하세요.
            return;
    	}


		let insertList = [];
		for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData = grdInvntrTrnsf.getRowData(nRow);

    		if(itemCd != rowData.itemCd){
    			gfn_comAlert("W0006", "이송품목", "선택품목");	//	W0006	{0}와/과 {1}이/가 서로 다릅니다.
    			return;
    		}

    		rowData.vrtyCd 			= vrtyCd;
    		rowData.prdcrCd 		= prdcrCd;
    		rowData.rprsPrdcrCd  	= prdcrCd;
    		rowData.gdsSeCd 		= gdsSeCd;
    		rowData.wrhsSeCd 		= wrhsSeCd;
    		rowData.trsprtSeCd 		= trsprtSeCd;
    		rowData.invntrSeCd 		= invntrSeCd;
    		rowData.spcfctCd 		= spcfctCd;
    		rowData.spmtPckgUnitCd 	= spmtPckgUnitCd;
    		rowData.warehouseSeCd 	= warehouseSeCd;
    		rowData.jgmt 			= jgmt;
    		rowData.gdsGrd			= jgmt;
    		rowData.rowSts 			= "I";
    		rowData.trnsfYn 		= "Y";
    		rowData.wrhsYmd			= gfn_dateToYmd(new Date());
    		rowData.inptYmd			= gfn_dateToYmd(new Date());
    		rowData.pckgYmd			= gfn_dateToYmd(new Date());
    		rowData.invntrQntt		= rowData.trnsfQntt;
    		rowData.invntrWght		= rowData.trnsfWght;
    		rowData.rmrk			= rmrk;
    		insertList.push(rowData);
    	}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){
			let url = "";
			if(invntrSeCd == "1"){
				url = "/am/invntr/mulitSaveRawMtrInvntrList.do";
			}else if(invntrSeCd == "2"){
				url = "/am/invntr/multiSaveSortInvntrList.do";
			}else if(invntrSeCd == "3"){
				url = "/am/invntr/multiSaveGdsInvntrList.do";
			}

			const postJsonPromise = gfn_postJSON(url, insertList);
	    	const data = await postJsonPromise;
	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	    			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	    			fn_search();
	    		} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
	        	}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}

	}

	const fn_search = async function() {
		let itemCd			= SBUxMethod.get("srch-slt-itemCd");
		let invntrSeCd		= SBUxMethod.get("srch-slt-invntrSeCd");

		if (gfn_isEmpty(invntrSeCd)) {
    		gfn_comAlert("W0001", "재고구분");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
		if (gfn_isEmpty(itemCd)) {
    		gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
		let rst = await Promise.all([
			fn_searchTrnsfList(),
			fn_searchTrnsfCfmtnList(),
		])

    }

	const fn_searchTrnsfList = async function(){
		let trnsfYmdFrom	= SBUxMethod.get("srch-dtp-trnsfYmdFrom");
		let trnsfYmdTo 		= SBUxMethod.get("srch-dtp-trnsfYmdTo");
		let trnsfApcCd 		= SBUxMethod.get("srch-slt-trnsfApcCd");

		let itemCd			= SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd			= SBUxMethod.get("srch-slt-vrtyCd");
		let gdsSeCd			= SBUxMethod.get("srch-slt-gdsSe");
		let wrhsSeCd		= SBUxMethod.get("srch-slt-wrhsSeCd");
		let invntrSeCd		= SBUxMethod.get("srch-slt-invntrSeCd");

		let trnsfVO = {
			  trnsfApcCd	: gv_selectedApcCd
			, trnsfYmdFrom	: trnsfYmdFrom
			, trnsfYmdTo	: trnsfYmdTo
			, itemCd		: itemCd
			, vrtyCd		: vrtyCd
			, gdsSeCd		: gdsSeCd
			, wrhsSeCd		: wrhsSeCd
			, invntrSeCd	: invntrSeCd
			, apcCd			: trnsfApcCd
			, cfmtnYn		: "N"
		}

		const postJsonPromise = gfn_postJSON("/am/trnsf/selectTrnsfInvntrList.do", trnsfVO);

        let data = await postJsonPromise;

  		try {
          	/** @type {number} **/

      		jsonInvntrTrnsf.length = 0;
          	data.resultList.forEach((item, index) => {
          		let prcsno ="";
          		let prcsSn ="";
          		if(item.invntrSeCd == "1"){
          			prcsno = item.wrhsno;
          		}
          		if(item.invntrSeCd == "2"){
          			prcsno = item.sortno;
          			prcsSn = item.sortSn;
          		}
          		if(item.invntrSeCd == "3"){
          			prcsno = item.pckgno;
          			prcsSn = item.pckgSn;
          		}
          		const invntrTrnsf = {
          			  apcCd				: item.trnsfApcCd
          			, apcNm				: item.apcNm
          			, prcsno			: prcsno
          			, prcsSn			: prcsSn
          			, sortno			: item.sortno
          			, sortSn			: item.sortSn
          			, pckgno			: item.pckgno
          			, pckgSn			: item.pckgSn
          			, trnsfYmd			: item.trnsfYmd
          			, trnsfSn			: item.trnsfSn
          			, wrhsYmd			: item.wrhsYmd
          			, grdCd				: item.grdCd
          			, grdNm				: item.grdNm
          			, itemNm			: item.itemNm
          			, itemCd			: item.itemCd
          			, vrtyNm			: item.vrtyNm
          			, vrtyCd			: item.vrtyCd
          			, spcfctCd			: item.spcfctCd
          			, spcfctNm			: item.spcfctNm
          			, prdcrCd			: item.prdcrCd
          			, prdcrNm			: item.prdcrNm
          			, gdsSeNm			: item.gdsSeNm
          			, gdsSeCd			: item.gdsSeCd
          			, wrhsSeNm			: item.wrhsSeNm
          			, wrhsSeCd			: item.wrhsSeCd
          			, trsprtSeNm		: item.trsprtSeNm
          			, invntrSeCd		: item.invntrSeCd
          			, invntrSeNm		: item.invntrSeNm
          			, trsprtSeCd		: item.trsprtSeCd
          			, trsprtSeNm		: item.trsprtSeNm
          			, warehouseSeNm		: item.warehouseSeNm
          			, warehouseSeCd		: item.warehouseSeCd
          			, trnsfQntt			: item.trnsfQntt
          			, trnsfWght			: item.trnsfWght
          			, trnsfApcNm		: item.trnsfApcNm
          			, trnsfApcCd		: item.apcCd
          			, cfmtnNm			: item.cfmtnNm
          			, cfmtnCd			: item.cfmtnCd
  				}
  				jsonInvntrTrnsf.push(invntrTrnsf);
  			});
        	grdInvntrTrnsf.rebuild();

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
	}

	const fn_searchTrnsfCfmtnList = async function(){
		let trnsfYmdFrom	= SBUxMethod.get("srch-dtp-trnsfYmdFrom");
		let trnsfYmdTo 		= SBUxMethod.get("srch-dtp-trnsfYmdTo");
		let itemCd			= SBUxMethod.get("srch-slt-itemCd");
		let invntrSeCd		= SBUxMethod.get("srch-slt-invntrSeCd");
		let trnsfVO = {};
		if(invntrSeCd == "1"){
			url = "/am/trnsf/selectTrnsfCfmtnRawMtrInvntrList.do";

			trnsfVO = {
					wrhsYmdFrom : trnsfYmdFrom
				  , wrhsYmdTo	: trnsfYmdTo
				  , itemCd		: itemCd
				  , apcCd		: gv_selectedApcCd
			}

		}else if(invntrSeCd == "2"){
			url = "/am/trnsf/selectTrnsfCfmtnSortInvntrList.do";
			trnsfVO = {
					inptYmdFrom : trnsfYmdFrom
				  , inptYmdTo	: trnsfYmdTo
				  , itemCd		: itemCd
				  , apcCd		: gv_selectedApcCd
			}
		}else if(invntrSeCd == "3"){
			url = "/am/trnsf/selectTrnsfCfmtnGdsInvntrList.do";
			trnsfVO = {
					pckgYmdFrom : trnsfYmdFrom
				  , pckgYmdTo	: trnsfYmdTo
				  , itemCd		: itemCd
				  , apcCd		: gv_selectedApcCd
			}
		}

		const postJsonPromise = gfn_postJSON(url, trnsfVO);

        let data = await postJsonPromise;

  		try {
          	/** @type {number} **/

      		jsonInvntrTrnsfCfmtn.length = 0;
          	data.resultList.forEach((item, index) => {
          		let cfmtnno = "";
          		let cfmtnSn = "";
          		let cfmtnYmd = "";
          		if(invntrSeCd == "1"){
          			cfmtnno = item.wrhsno;
          			cfmtnYmd = item.wrhsYmd;
          		}
          		if(invntrSeCd == "2"){
          			cfmtnno = item.sortno;
          			cfmtnSn = item.sortSn;
          			cfmtnYmd = item.inptYmd;
          		}
          		if(invntrSeCd == "3"){
          			cfmtnno = item.pckgno;
          			cfmtnSn = item.pckgSn;
          			cfmtnYmd = item.pckgYmd;
          		}
          		const invntrTrnsf = {
          			  apcCd				: item.apcCd
          			, apcNm				: item.apcNm
          			, cfmtnno			: cfmtnno
          			, cfmtnSn			: cfmtnSn
          			, cfmtnYmd			: cfmtnYmd
          			, wrhsno			: item.wrhsno
          			, sortno			: item.sortno
          			, sortSn			: item.sortSn
          			, pckgno			: item.pckgno
          			, pckgSn			: item.pckgSn
          			, wrhsYmd			: item.wrhsYmd
          			, grdCd				: item.grdCd
          			, grdNm				: item.grdNm
          			, itemNm			: item.itemNm
          			, itemCd			: item.itemCd
          			, vrtyNm			: item.vrtyNm
          			, vrtyCd			: item.vrtyCd
          			, spcfctCd			: item.spcfctCd
          			, spcfctNm			: item.spcfctNm
          			, prdcrCd			: item.prdcrCd
          			, prdcrNm			: item.prdcrNm
          			, gdsSeNm			: item.gdsSeNm
          			, gdsSeCd			: item.gdsSeCd
          			, wrhsSeNm			: item.wrhsSeNm
          			, wrhsSeCd			: item.wrhsSeCd
          			, trsprtSeNm		: item.trsprtSeNm
          			, invntrSeCd		: item.invntrSeCd
          			, invntrSeNm		: item.invntrSeNm
          			, trsprtSeCd		: item.trsprtSeCd
          			, trsprtSeNm		: item.trsprtSeNm
          			, warehouseSeNm		: item.warehouseSeNm
          			, warehouseSeCd		: item.warehouseSeCd
          			, invntrQntt		: item.invntrQntt
          			, invntrWght		: item.invntrWght
          			, spmtQntt			: item.spmtQntt
          			, spmtWght			: item.spmtWght
          			, trnsfQntt			: item.trnsfQntt
          			, trnsfWght			: item.trnsfWght
          			, rtnGdsQntt		: item.rtnGdsQntt
          			, rtnGdsWght		: item.rtnGdsWght
          			, inptQntt			: item.inptQntt
          			, inptWght			: item.inptWght
          			, inptPrgrsQntt		: item.inptPrgrsQntt
          			, inptPrgrsWght		: item.inptPrgrsWght
          			, trnsfApcNm		: item.trnsfApcNm
          			, trnsfApcCd		: item.trnsfApcCd
          			, cfmtnNm			: item.cfmtnNm
          			, cfmtnCd			: item.cfmtnCd
          			, trnsfApcNm		: item.trnsfApcNm
          			, spmtPckgUnitNm	: item.spmtPckgUnitNm
          			, spmtPckgUnitCd	: item.spmtPckgUnitCd
          			, rmrk				: item.rmrk
          			, trnsfYmd			: item.trnsfYmd
          			, trnsfSn			: item.trnsfSn
  				}
          		jsonInvntrTrnsfCfmtn.push(invntrTrnsf);
  			});
          	grdInvntrTrnsfCfmtn.rebuild();

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
	}

	const fn_del = async function(){

		let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");

		let grdRows = grdInvntrTrnsfCfmtn.getCheckedRows(0);
    	let deleteList = [];

    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData  = grdInvntrTrnsfCfmtn.getRowData(nRow);

    		if(invntrSeCd == "1" || invntrSeCd == "2"){
    			if(rowData.inptPrgrsQntt > 0){
    				gfn_comAlert("W0010", "투입예정", "재고")	// W0010 이미 {0}된 {1} 입니다.
    				return;
    			}
    		}
    		if(invntrSeCd == "1"){
    			if(rowData.inptQntt > 0){
    				gfn_comAlert("W0010", "투입", "재고")	// W0010 이미 {0}된 {1} 입니다.
    				return;
    			}
    		}
    		if(invntrSeCd == "2"){
    			if(rowData.pckgQntt > 0){
    				gfn_comAlert("W0010", "포장", "재고")	// W0010 이미 {0}된 {1} 입니다.
    				return;
    			}
    		}
    		if(invntrSeCd == "3"){
    			if(rowData.spmtQntt > 0){
    				gfn_comAlert("W0010", "출하", "재고")	// W0010 이미 {0}된 {1} 입니다.
    				return;
    			}
    		}
   			if(rowData.trnsfQntt > 0){
   				gfn_comAlert("W0010", "이송", "재고")	// W0010 이미 {0}된 {1} 입니다.
   				return;
   			}

    		deleteList.push(rowData);

    	}

    	console.log("deleteList",deleteList);

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "삭제");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	let regMsg = "삭제 하시겠습니까?";
		if(confirm(regMsg)){

			let url = "";
			if (invntrSeCd == "1"){
				url = "/am/trnsf/deleteTrnsfCfmtnRawMtrInvntrList.do";
			} else if(invntrSeCd == "2"){
				url = "/am/trnsf/deleteTrnsfCfmtnSortInvntrList.do";
			} else if(invntrSeCd == "3"){
				url = "/am/trnsf/deleteTrnsfCfmtnGdsInvntrList.do";
			}

			const postJsonPromise = gfn_postJSON(url, deleteList);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_search();
	        		fn_reSet();
	        	} else {
	        		alert(data.resultMessage);
	        	}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}
	}


	/* 생산자 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_getPrdcrs
	 * @description 생산자 리스트 호출
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcrDtl 	= await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcrDtl 	= gfn_setFrst(jsonPrdcrDtl);
	}

	/*
	* 상세 정보 생산자 팝업 관련 function
	* Start
	*/
	/**
	 * @name fn_choicePrdcrDtl
	 * @description 생산자 팝업 호출
	 */
	const fn_choicePrdcrDtl = async function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcrDtl, SBUxMethod.get("dtl-inp-prdcrNm"));
	}

	/**
	 * @name fn_setPrdcrDtl
	 * @description 생산자 선택 callback
	 */
	const fn_setPrdcrDtl = function(jsonPrdcrDtl) {
		if (!gfn_isEmpty(jsonPrdcrDtl)) {
			SBUxMethod.set("dtl-inp-prdcrCd", jsonPrdcrDtl.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrNm", jsonPrdcrDtl.prdcrNm);
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
			SBUxMethod.set("dtl-slt-itemCd", jsonPrdcrDtl.rprsItemCd);
			SBUxMethod.set("dtl-slt-vrtyCd", jsonPrdcrDtl.rprsVrtyCd);
			SBUxMethod.set("dtl-rdo-gdsSeCd", jsonPrdcrDtl.gdsSeCd);
			SBUxMethod.set("dtl-rdo-wrhsSeCd", jsonPrdcrDtl.wrhsSeCd);
			SBUxMethod.set("dtl-rdo-trsprtSeCd", jsonPrdcrDtl.trsprtSeCd);

			fn_selectDtlItem();
		}
	}

	/**
	 * @name fn_onInputPrdcrNmDtl
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onInputPrdcrNmDtl = function(prdcrNm){
		fn_clearPrdcrDtl();
		if(getByteLengthOfString(prdcrNm.target.value) > 100){
			SBUxMethod.set("dtl-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocompleteDtl = gfn_filterFrst(prdcrNm.target.value, jsonPrdcrDtl);
    	SBUxMethod.changeAutocompleteData('dtl-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcrDtl
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcrDtl = function() {
		SBUxMethod.set("dtl-inp-prdcrCd", "");
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNmDtl
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNmDtl(value, label, item) {
		// 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
		if(jsonPrdcrDtl.filter(e => e.prdcrNm === label).length > 1){
			document.getElementById('btnDtlprdcr').click();
		}
		else{
			SBUxMethod.set("dtl-inp-prdcrCd", value);
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}
	/*
	* 상세 정보 생산자 팝업 관련 function
	* End
	*/

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>