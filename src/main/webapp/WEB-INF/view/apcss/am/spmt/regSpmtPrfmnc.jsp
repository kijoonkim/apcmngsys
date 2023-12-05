<%
 /**
  * @Class Name : regSpmtPrfmnc.jsp
  * @Description : 출하실적등록 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	김호			최초 생성
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
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>	<!-- 출하실적등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSearchGdsInvnrt" name="btnSearchGdsInvnrt" uitype="normal" text="재고조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>생산일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-pckgYmdFrom" name="srch-dtp-pckgYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast" onchange="fn_dtpChange(srch-dtp-pckgYmdFrom)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-pckgYmdTo" name="srch-dtp-pckgYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast" onchange="fn_dtpChange(srch-dtp-pckgYmdTo)"></sbux-datepicker>
							</td>
							<td class="td_input"></td>

							<th scope="row" class="th_bg">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonComWarehouseSeCd"></sbux-select>
							</td>
							<td colspan="2" class="td_input"></td>

							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm-ast"
									unselected-text="전체"
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
							<td class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>상품</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-gdsSeCd"
										name="srch-rdo-gdsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComGdsSeCd">
									</sbux-radio>
								</p>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfctCd"
									name="srch-slt-spcfctCd"
									uitype="single"
									unselected-text="전체"
									class="form-control input-sm"
									jsondata-ref="jsonComSpcfct"
								></sbux-select>
							</td>
							<td colspan="2" style="border-right: hidden;"></td>
							<th scope="row" class="th_bg"><sbux-label id="srch-lbl-spmtCmndno" name="srch-lbl-spmtCmndno" uitype="normal" text="지시번호" class="bold"></sbux-label></th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-spmtCmndno" name="dtl-inp-spmtCmndno" uitype="text" class="form-control input-sm" readOnly></sbux-input>
								<sbux-input id="dtl-inp-outordrno" name="dtl-inp-outordrno" uitype="hidden" class="form-control input-sm" readOnly></sbux-input>
							</td>
							<td colspan="2" class="td_input">
								<sbux-button id="dtl-btn-spmtCmndno" name="dtl-btn-spmtCmndno" uitype="modal" target-id="modal-spmtCmnd" onclick="fn_choiceSpmtCmnd" text="찾기"  class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->

				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>상품재고 내역</span></li>
					</ul>
				</div>
					<div class="ad_tbl_toplist">
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdGdsInvntr" style="height:132px;"></div>
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
							<th scope="row" class="th_bg"><sbux-label id="dtl-lbl-cmndQnttWght" name="dtl-lbl-cmndQnttWght" uitype="normal" text="지시수량/중량" class="bold"></sbux-label></th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-cmndQntt" name="dtl-inp-cmndQntt" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-cmndWght" name="dtl-inp-cmndWght" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-label id="dtl-lbl-cmndWghtKg" name="dtl-lbl-cmndWghtKg" uitype="normal" text="Kg">
							</td>
							<th scope="row" class="th_bg">등급</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-slt-gdsGrd"
									name="dtl-slt-gdsGrd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="지시선택"
									jsondata-ref="jsonDtlGdsGrd"
									disabled
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input"></td>
							<th scope="row" class="th_bg">상품명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-slt-spmtPckgUnit"
									name="dtl-slt-spmtPckgUnit"
									uitype="single"
									class="form-control input-sm"
									unselected-text="지시선택"
									jsondata-ref="jsonDtlSpmtPckgUnit"
									disabled
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<td class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>출하일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="dtl-dtp-spmtYmd" name="dtl-dtp-spmtYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast" onchange="fn_dtpChange(dtl-dtp-spmtYmd)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
							<td class="td_input" style="border-right: hidden;">
							<th scope="row" class="th_bg">출하수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-spmtQntt" name="dtl-inp-spmtQntt" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-spmtWght" name="dtl-inp-spmtWght" uitype="text" class="form-control input-sm" placeholder="" disabled></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								Kg
							</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-cnptCd" name="dtl-inp-cnptCd" uitype="hidden"></sbux-input>
								<sbux-input id="dtl-inp-cnptNm" name="dtl-inp-cnptNm" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed" readonly></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="dtl-btn-cnpt" name="dtl-btn-cnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_choiceCnpt" text="찾기"  class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>

						</tr>
						<tr>
							<th scope="row" class="th_bg">운송회사</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-trsprtCoCd" name="dtl-slt-trsprtCoCd" uitype="single" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonComTrsprtCoCd"></sbux-select>
							</td>
							<td class="td_input"></td>
							<th scope="row" class="th_bg">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-vhclno" name="dtl-inp-vhclno" uitype="text" class="form-control input-sm" maxlength="8" ></sbux-input>
							</td>
							<td colspan="2" class="td_input">
								<sbux-button id="btnSrchVhclNo" name="btnSrchVhclNo" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_choiceVhcl"></sbux-button>
							</td>
							<th scope="row" class="th_bg">배송처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-dldtn" name="dtl-inp-dldtn" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">운임비용</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-trsprtCst" name="dtl-inp-trsprtCst" uitype="text" class="form-control input-sm"
								autocomplete="off"
								mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
								maxlength="10"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input"></td>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="3" class="td_input">
								<sbux-input id="dtl-inp-rmrk" name="dtl-inp-rmrk" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<th scope="row" class="th_bg">팔레트불출</th>
							<td class="td_input" colspan="2">
								<sbux-select
									id="dtl-slt-pltBxCd"
									name="dtl-slt-pltBxCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonDtlPltBxCd"
								></sbux-select>
							</td>
							<td class="td_input">
								<sbux-input
									id="dtl-inp-bssInvntrQntt"
									name="dtl-inp-bssInvntrQntt"
									uitype="text"
									class="form-control input-sm"
									autocomplete="off"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
									maxlength="3"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">출하자신고번호</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									id="dtl-inp-spmtPrsnDclrno"
									name="dtl-inp-spmtPrsnDclrno"
									uitype="text"
									class="form-control input-sm"
									mask = "999999-999999"
								></sbux-input>
							</td>
							<td colspan="9"></td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>출하 내역</span>
							<span style="font-size:12px">(기준일자 :
								<sbux-label
									id="crtr-ymd"
									name="crtr-ymd"
									uitype="normal"
									text=""
									class="bold"
									mask = "{'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
								></sbux-label>)
							</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnDocSpmt" name="btnDocSpmt" uitype="normal" text="송품장" class="btn btn-sm btn-primary" onclick="fn_docSpmt"></sbux-button>
						<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
						<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="서식받기" class="btn btn-sm btn-outline-danger" onclick="fn_dwnld" ></sbux-button>
						<sbux-button id="btnUld" name="btnUld" uitype="normal" text="올리기" class="btn btn-sm btn-outline-dark" onclick="fn_uld"></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtPrfmnc" style="height:162px;"></div>
				</div>
			</div>
		</div>
		<!--[pp] //검색결과 -->
		<div class="exp-div-excel" style="display: none;width: 1000px;">
			<div id="sbexp-area-grdExpSpmtPrfmnc" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpGdsSeCd" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpItem" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpVrty" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpSpcfct" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpGdsGrd" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpSpmtPckgUnit" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpPrdcr" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpCnpt" style="height:1px; width: 100%;"></div>
			<div id="sbexp-area-grdExpTrsprtCoCd" style="height:1px; width: 100%;"></div>
			<sbux-select id="excel-slt-spmtPckgUnit"
						name="excel-slt-spmtPckgUnit"
						uitype="single"
						unselected-text="전체"
						class="form-control input-sm"
						jsondata-ref="jsonExeclComSpmtPckgUnit"
			></sbux-select>
			<sbux-select id="excel-slt-prdcr"
						name="excel-slt-prdcr"
						uitype="single"
						unselected-text="전체"
						class="form-control input-sm"
						jsondata-ref="jsonExeclComPrdcr"
			></sbux-select>
			<sbux-select id="excel-slt-cnpt"
						name="excel-slt-cnpt"
						uitype="single"
						unselected-text="전체"
						class="form-control input-sm"
						jsondata-ref="jsonExeclComCnpt"
			></sbux-select>
			<sbux-select id="excel-slt-spcfct"
						name="excel-slt-spcfct"
						uitype="single"
						unselected-text="전체"
						class="form-control input-sm"
						jsondata-ref="jsonExeclComSpcfct"
			></sbux-select>
			<sbux-select id="excel-slt-vrty"
						name="excel-slt-vrty"
						uitype="single"
						unselected-text="전체"
						class="form-control input-sm"
						jsondata-ref="jsonExeclComVrty"
			></sbux-select>
			<input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="importExcelData(event)" />
		</div>
	</section>
	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="../../am/popup/cnptPopup.jsp"></jsp:include>
    </div>
    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>
	<!-- 출하지시번호 선택 Modal -->
    <div>
        <sbux-modal id="modal-spmtCmnd" name="modal-spmtCmnd" uitype="middle" header-title="출하지시번호 선택" body-html-id="body-modal-spmtCmnd" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-spmtCmnd">
    	<jsp:include page="../../am/popup/spmtCmndPopup.jsp"></jsp:include>
    </div>

    <!--  출하실적엑셀 팝업 -->
    <div>
		<sbux-modal id="modal-excel-spmtPrfmnc" name="modal-excel-spmtPrfmnc"
			uitype="middle"
			header-title="출하실적등록"
			body-html-id="body-modal-excelSpmtPrfmnc"
			footer-is-close-button="false"
			header-is-close-button="false"
			style="width:1000px"
		></sbux-modal>
	</div>
    <div id="body-modal-excelSpmtPrfmnc">
    	<jsp:include page="../../am/popup/spmtPrfmncExcelPopup.jsp"></jsp:include>
    </div>
    <sbux-button id="btnSpmtPrfmncPopup" name="btnSpmtPrfmncPopup" uitype="modal" text="엑셀등록" style="width:100%; display:none" class="btn btn-sm btn-outline-dark" target-id="modal-excel-spmtPrfmnc"></sbux-button>
</body>
<script type="text/javascript">

	var jsonComItem				= [];	// 품목 			itemCd			검색
	var jsonComVrty				= [];	// 품종 			vrtyCd			검색
	var jsonComSpcfct			= [];	// 규격 			spcfctCd		검색
	var jsonComGdsSeCd			= [];	// 상품구분 		gdsSeCd			검색
	var jsonComTrsprtCoCd		= [];	// 운송사 			trsprtCo		검색
	var jsonComWarehouseSeCd	= [];	// 운송사 			trsprtCo		검색
	var jsonGrdGdsGrd			= [];	// 상품등급			gdsGrd			그리드
	var jsonGrdSpmtPckgUnit		= [];	// 출하포장단위 	spmtPckgUnit	그리드
	var jsonDtlGdsGrd			= [];	// 상품등급			gdsGrd			그리드
	var jsonDtlSpmtPckgUnit		= [];	// 출하포장단위 	spmtPckgUnit	상세
	var jsonDtlSpmtPckgUnit		= [];	// 출하포장단위 	spmtPckgUnit	상세
	var jsonDtlPltBxCd			= [];	// 팔레트 			pltBxCd			상세

	var jsonExeclComSpmtPckgUnit	= [];	// 출하포장단위 엑셀
	var jsonExeclComPrdcr			= [];	// 생산자 엑셀
	var jsonExeclComCnpt			= [];	// 거래처 엑셀
	var jsonExeclComSpcfct			= [];	// 규격 엑셀
	var jsonExeclComVrty			= [];	// 규격 엑셀
	var cmndYn = false;

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-rdo-gdsSeCd', 				jsonComGdsSeCd, 			'GDS_SE_CD', 		gv_selectedApcCd), 		// 상품구분 등록
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', 			jsonComWarehouseSeCd, 		'WAREHOUSE_SE_CD', 	gv_selectedApcCd), 		// 상품구분 등록
			gfn_setComCdSBSelect('grdGdsInvntr', 					jsonGrdGdsGrd, 				'GDS_GRD'),				// 상품등급(재고그리드)
			gfn_setComCdSBSelect('dtl-slt-gdsGrd', 					jsonDtlGdsGrd, 				'GDS_GRD'),				// 상품등급(상세)
		 	gfn_setTrsprtsSBSelect('dtl-slt-trsprtCoCd', 			jsonComTrsprtCoCd, 			gv_selectedApcCd),		// 운송사
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 				jsonComItem, 				gv_selectedApcCd),		// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 				jsonComVrty, 				gv_selectedApcCd),		// 품종
		 	gfn_setPltBxSBSelect('dtl-slt-pltBxCd', 				jsonDtlPltBxCd, 			gv_selectedApcCd, "P"), // 팔레트
		 	gfn_setPrdcrSBSelect('excel-slt-prdcr', 				jsonExeclComPrdcr, 			gv_selectedApcCd),		// 생산자
		 	gfn_setCpntSBSelect('excel-slt-cnpt', 					jsonExeclComCnpt, 			gv_selectedApcCd),		// 거래처
		])

		SBUxMethod.refresh("excel-slt-prdcr");
		SBUxMethod.refresh("excel-slt-cnpt");

		SBUxMethod.set('srch-rdo-gdsSeCd', '1');

	}

	const fn_selectItem = async function(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let rst = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 				jsonComVrty, 				gv_selectedApcCd, itemCd),		// 품종
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',			jsonComSpcfct, 				gv_selectedApcCd, itemCd),		// 규격
			gfn_setSpmtPckgUnitSBSelect('excel-slt-spmtPckgUnit', 	jsonExeclComSpmtPckgUnit, 	gv_selectedApcCd, itemCd),		// 포장구분
			gfn_setApcSpcfctsSBSelect('excel-slt-spcfct', 			jsonExeclComSpcfct, 		gv_selectedApcCd, itemCd),		// 규격
			gfn_setApcVrtySBSelect('excel-slt-vrty', 				jsonExeclComVrty, 			gv_selectedApcCd, itemCd),		// 품종
		])

		SBUxMethod.refresh("excel-slt-spmtPckgUnit");
		SBUxMethod.refresh("srch-slt-spmtPckgUnitCd");

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
		let rst = await Promise.all([
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 			jsonComSpcfct, 				gv_selectedApcCd, itemCd),			// 규격
			gfn_setSpmtPckgUnitSBSelect('grdGdsInvntr', 			jsonGrdSpmtPckgUnit, 		gv_selectedApcCd, itemCd, vrtyCd),	// 포장구분
			gfn_setSpmtPckgUnitSBSelect('excel-slt-spmtPckgUnit', 	jsonExeclComSpmtPckgUnit, 	gv_selectedApcCd, itemCd),		// 포장구분
			gfn_setApcSpcfctsSBSelect('excel-slt-spcfct', 			jsonExeclComSpcfct, 		gv_selectedApcCd, itemCd),		// 규격
			gfn_setApcVrtySBSelect('excel-slt-vrty', 				jsonExeclComVrty, 			gv_selectedApcCd, itemCd),		// 품종
		])
		grdGdsInvntr.refresh({"combo":true})
		SBUxMethod.refresh("srch-slt-spmtPckgUnitCd");
		SBUxMethod.refresh("excel-slt-spmtPckgUnit");
	}

	window.addEventListener('DOMContentLoaded', async function(e) {
		await fn_initSBSelect();
		fn_createSmptPrfmncGrid();

		SBUxMethod.set("srch-dtp-pckgYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-pckgYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("dtl-dtp-spmtYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);

	})

	const fn_dtpChange = function(){
		let pckgYmdFrom = SBUxMethod.get("srch-dtp-pckgYmdFrom");
		let pckgYmdTo = SBUxMethod.get("srch-dtp-pckgYmdTo");
		let spmtYmdTo = SBUxMethod.get("dtl-dtp-spmtYmd");
		if(gfn_diffDate(pckgYmdFrom, pckgYmdTo) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
			SBUxMethod.set("srch-dtp-pckgYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-pckgYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
		if(gfn_diffDate(pckgYmdFrom, spmtYmdTo) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
			SBUxMethod.set("dtl-dtp-spmtYmd", gfn_dateToYmd(new Date()));
			return;
		}
	}

	var jsonGdsInvntr = []; // 상품재고내역 Json
	var jsonSpmtPrfmnc = []; // 출하내역 Json
	const fn_createSmptPrfmncGrid = async function() {
        var SBGridPropertiesGdsInvntr = {};
        SBGridPropertiesGdsInvntr.parentid = 'sb-area-grdGdsInvntr';
        SBGridPropertiesGdsInvntr.id = 'grdGdsInvntr';
        SBGridPropertiesGdsInvntr.jsonref = 'jsonGdsInvntr';
        SBGridPropertiesGdsInvntr.emptyrecords = '데이터가 없습니다.';
        SBGridPropertiesGdsInvntr.selectmode = 'free';
        SBGridPropertiesGdsInvntr.extendlastcol = 'scroll';
        SBGridPropertiesGdsInvntr.oneclickedit = true;
        SBGridPropertiesGdsInvntr.allowcopy = true;
        SBGridPropertiesGdsInvntr.explorerbar = 'move';				// 개인화 컬럼 이동 가능
        SBGridPropertiesGdsInvntr.contextmenu = true;				// 우클린 메뉴 호출 여부
        SBGridPropertiesGdsInvntr.contextmenulist = objMenuListGdsInvntr;	// 우클릭 메뉴 리스트
        SBGridPropertiesGdsInvntr.columns = [
        	{caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ['품목'], 		ref: 'itemNm', 		width: '80px', type: 'output', style: 'text-align:center'},
        	{caption: ['품종'], 		ref: 'vrtyNm', 		width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['상품구분'],		ref: 'gdsSeNm', 	width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 	width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['생산일자'], 	ref: 'pckgYmd', 	width: '150px', type: 'output', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['포장번호'], 	ref: 'pckgno', 		width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['재고수량'], 	ref: 'invntrQntt', 	width: '80px', type: 'output', style: 'text-align:right'},
            {caption: ['재고중량'], 	ref: 'invntrWght', 	width: '100px', type: 'output', style: 'text-align:right',
            			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
   			{caption: ["상품명"], 	ref: 'spmtPckgUnitCd',   	type:'combo',  width:'200px',    style:'text-align:center; background:#FFF8DC;',
    					typeinfo : {ref:'jsonGrdSpmtPckgUnit', 	displayui : false,	itemcount: 10, label:'label', value:'value', unselect: {label : '선택', value: ''}}},
            {caption: ["등급"], 			ref: 'gdsGrd',   	type:'combo',  width:'100px',    style:'text-align:center; background:#FFF8DC;',
    					typeinfo : {ref:'jsonGrdGdsGrd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['출하수량'], 	ref: 'spmtQntt', 	width: '80px', type: 'input', style: 'text-align:right; background:#FFF8DC;',
            			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### '}},
            {caption: ['출하중량'], 	ref: 'spmtWght', 	width: '100px', type: 'input', style: 'text-align:right',
            			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
			{caption: ['비고'], 		ref: 'rmrk', 		width: '300px', type: 'output', style: 'text-align:center'},
            {caption: ["출하일자"],		ref: 'spmtYmd',   	type:'output',  hidden: true},
            {caption: ["거래처코드"],	ref: 'cnptCd',   	type:'output',  hidden: true},
            {caption: ["운송사코드"],	ref: 'trsprtCoCd',  type:'output',  hidden: true},
            {caption: ["운송사명"],		ref: 'trsprtCoNm',  type:'output',  hidden: true},
            {caption: ["차량번호"],		ref: 'vhclno',   	type:'output',  hidden: true},
            {caption: ["배송지"],		ref: 'dldtn',   	type:'output',  hidden: true},
            {caption: ["운임"],			ref: 'trsprtCst',   type:'output',  hidden: true},
            {caption: ["비고"],			ref: 'rmrk',   		type:'output',  hidden: true},
            {caption: ["지시번호"],		ref: 'spmtCmndno',  type:'output',  hidden: true},
            {caption: ["브랜드명"],		ref: 'brndNm',  	type:'output',  hidden: true},
            {caption: ["발주번호"],		ref: 'outordrno',  	type:'output',  hidden: true},
            {caption: ["상품코드"],		ref: 'gdsCd',  		type:'output',  hidden: true},
            {caption: ["팔레트"],		ref: 'pltBxCd',  	type:'output',  hidden: true},
            {caption: ["수량"],			ref: 'bssInvntrQntt', 	type:'output',  hidden: true},
        ];

        grdGdsInvntr = _SBGrid.create(SBGridPropertiesGdsInvntr);
        grdGdsInvntr.bind('valuechanged', 'fn_grdCmndQnttValueChanged');
        grdGdsInvntr.bind('select','fn_setValue');
        grdGdsInvntr.bind('deselect','fn_delValue');

        var SBGridPropertiesSpmtPrfmnc = {};
        SBGridPropertiesSpmtPrfmnc.parentid = 'sb-area-spmtPrfmnc';
        SBGridPropertiesSpmtPrfmnc.id = 'grdSpmtPrfmnc';
	    SBGridPropertiesSpmtPrfmnc.jsonref = 'jsonSpmtPrfmnc';
	    SBGridPropertiesSpmtPrfmnc.emptyrecords = '데이터가 없습니다.';
	    SBGridPropertiesSpmtPrfmnc.selectmode = 'free';
	    SBGridPropertiesSpmtPrfmnc.extendlastcol = 'scroll';
	    SBGridPropertiesSpmtPrfmnc.allowcopy = true;
	    SBGridPropertiesSpmtPrfmnc.explorerbar = 'move';				// 개인화 컬럼 이동 가능
	    SBGridPropertiesSpmtPrfmnc.contextmenu = true;					// 우클린 메뉴 호출 여부
	    SBGridPropertiesSpmtPrfmnc.contextmenulist = objMenuListPrfmnc;		// 우클릭 메뉴 리스트
	    SBGridPropertiesSpmtPrfmnc.columns = [
        	{caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ['출하일자'], 	ref: 'spmtYmd', 	width: '100px', type: 'output', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['거래처'],		ref: 'cnptNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['품목'], 		ref: 'itemNm', 		width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['품종'], 		ref: 'vrtyNm', 		width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 	width: '80px', type: 'output', style: 'text-align:center'},
            {caption: ['상품'], 		ref: 'gdsCd', 		width: '100px', type: 'output', style: 'text-align:center', hidden:true},
            {caption: ['등급'], 		ref: 'gdsGrdNm', 	width: '60px', type: 'output', style: 'text-align:center'},
            {caption: ['수량'], 		ref: 'spmtQntt', 	width: '60px', type: 'output', style: 'text-align:right'},
            {caption: ['중량'], 		ref: 'spmtWght',	width: '80px', type: 'output', style: 'text-align:right',
    			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['운송회사'], 	ref: 'trsprtCoNm', 	width: '180px', type: 'output', style: 'text-align:center'},
            {caption: ['차량번호'], 	ref: 'vhclno', 		width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['배송처'], 		ref: 'dldtn', 		width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['운임비용'], 	ref: 'trsprtCst', 	width: '80px', type: 'output', style: 'text-align:center',
    			typeinfo : {mask : {alias : 'numeric'},maxlength: 10}, format : {type:'number', rule:'#,### 원'}},
            {caption: ['상품명'], 		ref: 'spmtPckgUnitNm', 	width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['지시번호'], 	ref: 'spmtCmndno', 	width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['비고'], 		ref: 'rmrk', 		width: '150px', type: 'output', style: 'text-align:center'}
        ];

        grdSpmtPrfmnc = _SBGrid.create(SBGridPropertiesSpmtPrfmnc);
    }

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
     const objMenuListPrfmnc = {
		"excelDwnld": {
			"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
			"accesskey": "e",					//단축키
			"callback": fn_excelDwnldPrfmnc,	//콜백함수명
		}
	};

    const objMenuListGdsInvntr = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldGdsInvntr,	//콜백함수명
        },
        "personalSave" : {
        	"name": "개인화 저장",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "s",					//단축키
            "callback": fn_personalSave,		//콜백함수명
        },
        "personalLoad" : {
        	"name": "개인화 호출",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "l",					//단축키
            "callback": fn_personalLoad,		//콜백함수명
        },
        "colHidden" : {
        	"name": "열 숨기기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "h",					//단축키
            "callback": fn_colHidden,			//콜백함수명
        },
        "colShow" : {
        	"name": "열 보이기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "w",					//단축키
            "callback": fn_colShow,				//콜백함수명
        }
    };

  	// 엑셀 다운로드
     function fn_excelDwnldGdsInvntr() {
    	 grdGdsInvntr.exportLocalExcel("상품재고 내역", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
     }

    // 엑셀 다운로드
    function fn_excelDwnldPrfmnc() {
    	grdSpmtPrfmnc.exportLocalExcel("출하 내역", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdSpmtPrfmnc.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdSpmtPrfmnc.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden(){
    	grdSpmtPrfmnc.setColHidden(grdSpmtPrfmnc.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow(){
    	for(let i = grdSpmtPrfmnc.getFixedCols(); i < grdSpmtPrfmnc.getCols()-1; i++) {
   			grdSpmtPrfmnc.setColHidden(i, false);
    	}
   	}

	const fn_search = async function(){
		let flag = true;
		flag = await fn_setGrdGdsInvntr();
		if(flag){
			await fn_setGrdSmptPrfmnc();
		}
	}

	const fn_setGrdGdsInvntr = async function(){
		let pckgYmdFrom = SBUxMethod.get("srch-dtp-pckgYmdFrom");
		let pckgYmdTo = SBUxMethod.get("srch-dtp-pckgYmdTo");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spmtPckgUnitCd = SBUxMethod.get("srch-slt-spmtPckgUnitCd");
		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");

		if (gfn_isEmpty(pckgYmdFrom)) {
  			gfn_comAlert("W0001", "생산시작일자");		//	W0002	{0}을/를 선택하세요.
            return false;
  		}
  		if (gfn_isEmpty(pckgYmdTo)) {
  			gfn_comAlert("W0001", "생산종료일자");		//	W0002	{0}을/를 선택하세요.
            return false;
  		}

  		if (gfn_isEmpty(vrtyCd)) {
  			gfn_comAlert("W0001", "품종");				//	W0002	{0}을/를 선택하세요.
            return false;
  		}
  		if (gfn_isEmpty(gdsSeCd)) {
  			gfn_comAlert("W0001", "상품");				//	W0002	{0}을/를 선택하세요.
            return false;
  		}
		const postJsonPromise = gfn_postJSON("/am/invntr/selectGdsInvntrList.do", {
			apcCd			: gv_selectedApcCd,
			pckgYmdFrom		: pckgYmdFrom,
			pckgYmdTo		: pckgYmdTo,
			warehouseSeCd	: warehouseSeCd,
			itemCd			: itemCd,
			vrtyCd			: vrtyCd,
			spmtPckgUnitCd  : spmtPckgUnitCd,
			gdsSeCd 		: gdsSeCd,
			spcfctCd		: spcfctCd
  		});
        const data = await postJsonPromise;
        try {
          	/** @type {number} **/
      		jsonGdsInvntr.length = 0;
          	data.resultList.forEach((item, index) => {
          		if(item.invntrWght != 0){
	          		const gdsInvntr = {
	          				apcCd		: item.apcCd,
	          				pckgno		: item.pckgno,
	          				pckgSn		: item.pckgSn,
	          				pckgYmd		: item.pckgYmd,
	          				itemCd		: item.itemCd,
	          				itemNm		: item.itemNm,
	          				vrtyCd		: item.vrtyCd,
	          				vrtyNm		: item.vrtyNm,
	          				spcfctCd	: item.spcfctCd,
	          				spcfctNm	: item.spcfctNm,
	          				gdsSeCd		: item.gdsSeCd,
	          				gdsSeNm		: item.gdsSeNm,
	          				invntrQntt	: item.invntrQntt,
	          				invntrWght	: item.invntrWght,
	          				spmtQntt	: 0,
	          				spmtWght	: 0,
	          				pckgQntt	: item.pckgQntt,
	          				pckgWght	: item.pckgWght,
	          				pckgSeCd	: item.pckgSeCd,
	          				pckgSeNm	: item.pckgSeNm,
	          				prdcrCd		: item.rprsPrdcrCd,
	          				prdcrNm		: item.rprsPrdcrNm,
	          				fcltCd		: item.fcltCd,
	          				fcltNm		: item.fcltNm,
	          				cmndQntt	: item.cmndQntt,
	          				cmndWght	: item.cmndWght,
	          				gdsGrd		: item.gdsGrd,
	          				gdsGrdNm	: item.gdsGrdNm,
	          				gdsCd 		: item.gdsCd,
	          				plorCd 		: item.plorCd,
	          				spmtPckgUnitCd: item.spmtPckgUnitCd,
	          				spmtPckgUnitNm: item.spmtPckgUnitNm,
	          				rmrk		: item.rmrk,
	          				brndNm		: item.brndNm
	  				}
					jsonGdsInvntr.push(gdsInvntr);
          		}
  			});
          	grdGdsInvntr.refresh();
		}catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}

			console.error("failed", e.message);
		}
		return true;
	}

	const fn_grdCmndQnttValueChanged = async function(){

    	let nRow = grdGdsInvntr.getRow();
		let nCol = grdGdsInvntr.getCol();
		let spmtQnttCol = grdGdsInvntr.getColRef("spmtQntt")
		let spmtWghtCol = grdGdsInvntr.getColRef("spmtWght")


		switch (nCol) {
		case spmtQnttCol:	// checkbox
			fn_checkInptQntt();
			break;
		default:
			return;
		}
    }

    const fn_setValue = async function(){


    	let nRow = grdGdsInvntr.getRow();
    	let nCol = grdGdsInvntr.getCol();
    	let spmtQnttCol = grdGdsInvntr.getColRef("spmtQntt")
		let spmtWghtCol = grdGdsInvntr.getColRef("spmtWght")
		let spmtPckgUnitCdCol = grdGdsInvntr.getColRef("spmtPckgUnitCd")
		let gdsGrdCol = grdGdsInvntr.getColRef("gdsGrd")
		let checkedYnCol = grdGdsInvntr.getColRef("checkedYn")

    	if(nCol == 0){

	    	let invntrQntt = grdGdsInvntr.getRowData(nRow).invntrQntt;
			let invntrWght = grdGdsInvntr.getRowData(nRow).invntrWght;
			let spmtQntt = grdGdsInvntr.getRowData(nRow).spmtQntt;
			let spmtWght = grdGdsInvntr.getRowData(nRow).spmtWght;
			let cmndQntt = grdGdsInvntr.getRowData(nRow).cmndQntt;
			let cmndWght = grdGdsInvntr.getRowData(nRow).cmndWght;
			let spmtPckgUnitCd = grdGdsInvntr.getRowData(nRow).spmtPckgUnitCd;

			if(cmndYn){

				let totSpmtQntt = 0;
				let totSpmtWght = 0;
				let gridData = grdGdsInvntr.getGridDataAll();

				for(var i=1; i<=gridData.length; i++ ){

					let rowData = grdGdsInvntr.getRowData(i);
					if(!gfn_isEmpty(rowData.spmtQntt)){
						totSpmtQntt += parseInt(rowData.spmtQntt);
						totSpmtWght += parseInt(rowData.spmtWght);
					}
				}

				let spmtPckgUnit = SBUxMethod.get("dtl-slt-spmtPckgUnit");
				let gdsGrdCd = SBUxMethod.get("dtl-slt-gdsGrd");
				let spmtCmndno = SBUxMethod.get("dtl-inp-spmtCmndno");
				let spmtCmndQntt = SBUxMethod.get("dtl-inp-cmndQntt");
				let spmtCmndWght = SBUxMethod.get("dtl-inp-cmndWght");

				if(totSpmtQntt == spmtCmndQntt){

					gfn_comAlert("W0008", "지시수량", "선택수량");	// W0008 {0} 보다 {1}이/가 큽니다.
					grdGdsInvntr.setCellData(nRow, checkedYnCol, "N");
					return;
				}else if(totSpmtQntt < spmtCmndQntt){

					if(spmtCmndQntt - totSpmtQntt <  invntrQntt){
						grdGdsInvntr.setCellData(nRow, spmtQnttCol, spmtCmndQntt - totSpmtQntt);

						if(!gfn_isEmpty(spmtPckgUnit)){
							for(var j=0; j<jsonGrdSpmtPckgUnit.length; j++){
								let row  = jsonGrdSpmtPckgUnit[j];
					   			if(spmtPckgUnit == row.spmtPckgUnitCd){
									let wght = Math.round(parseFloat(row.spcfctWght) * (spmtCmndWght - totSpmtWght));
									grdGdsInvntr.setCellData(nRow, spmtWghtCol, wght);
					   			}
					   		}
						}else{
							grdGdsInvntr.setCellData(nRow, spmtWghtCol, spmtCmndWght - totSpmtWght);
						}

						grdGdsInvntr.setCellData(nRow, spmtPckgUnitCdCol, spmtPckgUnit, true);
						grdGdsInvntr.setCellData(nRow, gdsGrdCol, gdsGrdCd, true);
					}else{
						grdGdsInvntr.setCellData(nRow, spmtQnttCol, invntrQntt);

						if(!gfn_isEmpty(spmtPckgUnit)){
							for(var j=0; j<jsonGrdSpmtPckgUnit.length; j++){
								let row  = jsonGrdSpmtPckgUnit[j];
					   			if(spmtPckgUnit == row.spmtPckgUnitCd){
									let wght = Math.round(parseFloat(row.spcfctWght) * invntrQntt);
									grdGdsInvntr.setCellData(nRow, spmtWghtCol, wght);
					   			}
					   		}
						}else{
							grdGdsInvntr.setCellData(nRow, spmtWghtCol, invntrWght);
						}

						grdGdsInvntr.setCellData(nRow, spmtPckgUnitCdCol, spmtPckgUnit, true);
						grdGdsInvntr.setCellData(nRow, gdsGrdCol, gdsGrdCd, true);
					}
				}
			}else{

				grdGdsInvntr.setCellData(nRow, spmtQnttCol, invntrQntt);

				grdGdsInvntr.setCellData(nRow, spmtWghtCol, invntrWght);
			}
		}
    	totspmt();
    }

    const totspmt = function(){
    	let totSpmtQntt = 0;
		let totSpmtWght = 0;
		let gridData = grdGdsInvntr.getGridDataAll();

		for(var i=1; i<=gridData.length; i++ ){

			let rowData = grdGdsInvntr.getRowData(i);
			if(!gfn_isEmpty(rowData.spmtQntt)){
				totSpmtQntt += parseInt(rowData.spmtQntt);
				totSpmtWght += parseInt(rowData.spmtWght);
			}
		}
		SBUxMethod.set("dtl-inp-spmtQntt", totSpmtQntt)
		SBUxMethod.set("dtl-inp-spmtWght", totSpmtWght)
    }

    const fn_delValue = async function(){
    	var nRow = grdGdsInvntr.getRow();
    	let spmtQnttCol = grdGdsInvntr.getColRef("spmtQntt")
		let spmtWghtCol = grdGdsInvntr.getColRef("spmtWght")

    	grdGdsInvntr.setCellData(nRow, spmtQnttCol, 0);
    	grdGdsInvntr.setCellData(nRow, spmtWghtCol, 0);
    	totspmt();
    }

    const fn_checkInptWght = async function(){

    	let nRow = grdGdsInvntr.getRow();
		let nCol = grdGdsInvntr.getCol();

		let invntrQntt = grdGdsInvntr.getRowData(nRow).invntrQntt;
		let invntrWght = grdGdsInvntr.getRowData(nRow).invntrWght;
		let spmtWght = grdGdsInvntr.getRowData(nRow).spmtWght;
		let spmtQnttCol = grdGdsInvntr.getColRef("spmtQntt")
		let spmtWghtCol = grdGdsInvntr.getColRef("spmtWght")
		let spmtPckgUnitCdCol = grdGdsInvntr.getColRef("spmtPckgUnitCd")
		let gdsGrdCol = grdGdsInvntr.getColRef("gdsGrd")
		let checkedYnCol = grdGdsInvntr.getColRef("checkedYn")

		if(invntrWght - spmtWght < 0){
			gfn_comAlert("W0008", "재고중량", "출하중량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdGdsInvntr.setCellData(nRow, nCol , 0);
            return;
		}
		if(invntrWght == spmtWght && invntrQntt > 0){
			grdGdsInvntr.setCellData(nRow, spmtQnttCol, invntrQntt);
		}

		if(invntrWght % spmtWght == 0){
			grdGdsInvntr.setCellData(nRow, spmtQnttCol, (spmtWght / invntrWght * invntrQntt));
		}

		if(spmtWght > 0){
			grdGdsInvntr.setCellData(nRow, 0, "Y")
			let spmtPckgUnitCd = SBUxMethod.get("dtl-slt-spmtPckgUnit");
			let gdsGrdCd = SBUxMethod.get("dtl-slt-gdsGrd");
			let spmtCmndno = SBUxMethod.get("dtl-inp-spmtCmndno");
			if(!gfn_isEmpty(spmtCmndno)){
				grdGdsInvntr.setCellData(nRow, spmtPckgUnitCdCol, spmtPckgUnitCd, true);
				grdGdsInvntr.setCellData(nRow, gdsGrdCol, gdsGrdCd, true);
			}
		}else{
			grdGdsInvntr.setCellData(nRow, checkedYnCol, "N")
		}
		totspmt();
    }

    const fn_checkInptQntt = async function(){

    	let nRow = grdGdsInvntr.getRow();
    	let nCol = grdGdsInvntr.getCol();

		let invntrQntt = grdGdsInvntr.getRowData(nRow).invntrQntt;
		let invntrWght = grdGdsInvntr.getRowData(nRow).invntrWght;
		let spmtPckgUnitCd = grdGdsInvntr.getRowData(nRow).spmtPckgUnitCd;
		let spmtQntt = grdGdsInvntr.getRowData(nRow).spmtQntt;
		let spmtQnttCol = grdGdsInvntr.getColRef("spmtQntt")
		let spmtWghtCol = grdGdsInvntr.getColRef("spmtWght")
		let spmtPckgUnitCdCol = grdGdsInvntr.getColRef("spmtPckgUnitCd")
		let gdsGrdCol = grdGdsInvntr.getColRef("gdsGrd")
		let checkedYnCol = grdGdsInvntr.getColRef("checkedYn")

		grdGdsInvntr.setCellData(nRow, checkedYnCol, "N");

		if(cmndYn){

			var grdRows = grdGdsInvntr.getCheckedRows(0);

			let spmtPckgUnit = SBUxMethod.get("dtl-slt-spmtPckgUnit");
			let gdsGrdCd = SBUxMethod.get("dtl-slt-gdsGrd");
			let spmtCmndno = SBUxMethod.get("dtl-inp-spmtCmndno");
			let spmtCmndQntt = SBUxMethod.get("dtl-inp-cmndQntt");
			let spmtCmndWght = SBUxMethod.get("dtl-inp-cmndWght");

			let totSpmtQntt = 0;
			let totSpmtWght = 0;
			let gridData = grdGdsInvntr.getGridDataAll();

			if(grdRows.length > 0){
				for(var i=0; i<grdRows.length; i++ ){

					let nRow = grdRows[i];
					let rowData = grdGdsInvntr.getRowData(nRow);

					totSpmtQntt += parseInt(rowData.spmtQntt);
					totSpmtWght += parseInt(rowData.spmtWght);
				}

				if(totSpmtQntt == spmtCmndQntt){

					gfn_comAlert("W0013", "출하수량", "등록");			// W0013 더 이상 {0} 을/를 {1} 할 수 없습니다.
					grdGdsInvntr.setCellData(nRow, checkedYnCol, "N");
					return;

				}else if(totSpmtQntt < spmtCmndQntt){

					if(spmtCmndQntt - totSpmtQntt < spmtQntt){
						gfn_comAlert("W0008", "지시수량", "출하수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
						grdGdsInvntr.setCellData(nRow, nCol , 0);
						grdGdsInvntr.setCellData(nRow, checkedYnCol, "N");
						return;
					}

					if(spmtCmndQntt - totSpmtQntt <  invntrQntt){

						if(invntrQntt >= spmtQntt){
							if(!gfn_isEmpty(spmtPckgUnitCd)){
								for(var j=0; j<jsonGrdSpmtPckgUnit.length; j++){
									let row  = jsonGrdSpmtPckgUnit[j];
						   			if(spmtPckgUnitCd == row.spmtPckgUnitCd){
										let wght = Math.round(parseFloat(row.spcfctWght) * spmtQntt);
										grdGdsInvntr.setCellData(nRow, spmtWghtCol, wght);
						   			}
						   		}
							}else{
								grdGdsInvntr.setCellData(nRow, spmtWghtCol, Math.round(invntrWght / invntrQntt) * spmtQntt);
							}
							grdGdsInvntr.setCellData(nRow, spmtQnttCol, spmtQntt);
							grdGdsInvntr.setCellData(nRow, spmtPckgUnitCdCol, spmtPckgUnit, true);
							grdGdsInvntr.setCellData(nRow, gdsGrdCol, gdsGrdCd, true);
							grdGdsInvntr.setCellData(nRow, checkedYnCol, "Y");
						}else{
							grdGdsInvntr.setCellData(nRow, spmtQnttCol, spmtCmndQntt - totSpmtQntt);
							grdGdsInvntr.setCellData(nRow, spmtWghtCol, spmtCmndWght - totSpmtWght);
							grdGdsInvntr.setCellData(nRow, spmtPckgUnitCdCol, spmtPckgUnit, true);
							grdGdsInvntr.setCellData(nRow, gdsGrdCol, gdsGrdCd, true);
							grdGdsInvntr.setCellData(nRow, checkedYnCol, "Y");
						}

					}
					if(spmtCmndQntt - totSpmtQntt > invntrQntt){
						grdGdsInvntr.setCellData(nRow, spmtQnttCol, invntrQntt);
						grdGdsInvntr.setCellData(nRow, spmtWghtCol, invntrWght);
						grdGdsInvntr.setCellData(nRow, spmtPckgUnitCdCol, spmtPckgUnit, true);
						grdGdsInvntr.setCellData(nRow, gdsGrdCol, gdsGrdCd, true);
						grdGdsInvntr.setCellData(nRow, checkedYnCol, "Y");
					}
					if(spmtCmndQntt - totSpmtQntt == invntrQntt){
						grdGdsInvntr.setCellData(nRow, spmtQnttCol, invntrQntt);
						grdGdsInvntr.setCellData(nRow, spmtWghtCol, invntrWght);
						grdGdsInvntr.setCellData(nRow, spmtPckgUnitCdCol, spmtPckgUnit, true);
						grdGdsInvntr.setCellData(nRow, gdsGrdCol, gdsGrdCd, true);
						grdGdsInvntr.setCellData(nRow, checkedYnCol, "Y");
					}

				}else{

					gfn_comAlert("W0008", "지시수량", "출하수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
					grdGdsInvntr.setCellData(nRow, nCol , 0);
					grdGdsInvntr.setCellData(nRow, spmtWghtCol , 0);
					grdGdsInvntr.setCellData(nRow, checkedYnCol, "N");
					return;
				}
			}else{
				if(invntrQntt > spmtCmndQntt && spmtCmndQntt > spmtQntt ){

					if(!gfn_isEmpty(spmtPckgUnitCd)){
						for(var j=0; j<jsonGrdSpmtPckgUnit.length; j++){
							let row  = jsonGrdSpmtPckgUnit[j];
				   			if(spmtPckgUnitCd == row.spmtPckgUnitCd){
								let wght = Math.round(parseFloat(row.spcfctWght) * spmtQntt);
								grdGdsInvntr.setCellData(nRow, spmtWghtCol, wght);
				   			}
				   		}
					}else{
						grdGdsInvntr.setCellData(nRow, spmtWghtCol, Math.round(invntrWght / invntrQntt) * spmtQntt);
					}
					grdGdsInvntr.setCellData(nRow, spmtQnttCol, spmtQntt);

					grdGdsInvntr.setCellData(nRow, checkedYnCol, "Y");
				}else if(invntrQntt < spmtQntt){
					gfn_comAlert("W0008", "재고수량", "출하수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
					grdGdsInvntr.setCellData(nRow, nCol , 0);
					grdGdsInvntr.setCellData(nRow, checkedYnCol, "N");
					return;
				}else if(spmtCmndQntt < spmtQntt){
					gfn_comAlert("W0008", "지시수량", "출하수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
					grdGdsInvntr.setCellData(nRow, nCol , 0);
					grdGdsInvntr.setCellData(nRow, checkedYnCol, "N");
					return;
				}else{
					if(!gfn_isEmpty(spmtPckgUnitCd)){
						for(var j=0; j<jsonGrdSpmtPckgUnit.length; j++){
							let row  = jsonGrdSpmtPckgUnit[j];
				   			if(spmtPckgUnitCd == row.spmtPckgUnitCd){
								let wght = Math.round(parseFloat(row.spcfctWght) * spmtQntt);
								grdGdsInvntr.setCellData(nRow, spmtWghtCol, wght);
				   			}
				   		}
					}else{
						grdGdsInvntr.setCellData(nRow, spmtWghtCol, Math.round(invntrWght / invntrQntt) * spmtQntt);
					}
					grdGdsInvntr.setCellData(nRow, spmtQnttCol, spmtQntt);
					grdGdsInvntr.setCellData(nRow, checkedYnCol, "Y");
				}

			}

		}else{

			if(invntrQntt - spmtQntt < 0){
				gfn_comAlert("W0008", "재고수량", "출하수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
				grdGdsInvntr.setCellData(nRow, nCol , 0);
	            return;
			}

			if(invntrQntt > 0 && spmtQntt > 0){

				if(!gfn_isEmpty(spmtPckgUnitCd)){
					for(var j=0; j<jsonGrdSpmtPckgUnit.length; j++){
						let row  = jsonGrdSpmtPckgUnit[j];
			   			if(spmtPckgUnitCd == row.spmtPckgUnitCd){
							let wght = Math.round(parseFloat(row.spcfctWght) * spmtQntt);
							grdGdsInvntr.setCellData(nRow, spmtWghtCol, wght);
			   			}
			   		}
				}else{
					grdGdsInvntr.setCellData(nRow, spmtWghtCol, Math.round(invntrWght / invntrQntt) * spmtQntt);
				}
				grdGdsInvntr.setCellData(nRow, spmtQnttCol, spmtQntt);
				grdGdsInvntr.setCellData(nRow, checkedYnCol, "Y");
			}
			if(spmtQntt == 0 && invntrQntt > 0){
				grdGdsInvntr.setCellData(nRow, spmtWghtCol, 0);
				grdGdsInvntr.setCellData(nRow, checkedYnCol, "N");
			}
		}
		totspmt();
    }

	const fn_save = async function() {

    	var grdRows = grdGdsInvntr.getCheckedRows(0);
    	var insertList = [];
    	var totSpmtQntt = 0;

    	let spmtYmd			= SBUxMethod.get("dtl-dtp-spmtYmd");
    	let cnptCd			= SBUxMethod.get("dtl-inp-cnptCd");
    	let trsprtCoCd		= SBUxMethod.get("dtl-slt-trsprtCoCd");
    	let trsprtCoNm		= SBUxMethod.getText("dtl-slt-trsprtCoCd");
    	let vhclno			= SBUxMethod.get("dtl-inp-vhclno");
    	let dldtn			= SBUxMethod.get("dtl-inp-dldtn");
    	let trsprtCst		= SBUxMethod.get("dtl-inp-trsprtCst");
    	let rmrk			= SBUxMethod.get("dtl-inp-rmrk");
    	let spmtCmndno		= SBUxMethod.get("dtl-inp-spmtCmndno");
    	let outordrno		= SBUxMethod.get("dtl-inp-outordrno");
    	let pltBxCd			= SBUxMethod.get("dtl-slt-pltBxCd");
    	let bssInvntrQntt 	= SBUxMethod.get("dtl-inp-bssInvntrQntt");
    	let spmtPrsnDclrno 	= SBUxMethod.get("dtl-inp-spmtPrsnDclrno");
    	let pltSpmtYn 		= "N";

    	let totBssInvntrQntt = 0;

    	if(gfn_isEmpty(spmtYmd)){
    		gfn_comAlert("W0001", "출하일자");			//	W0001	{0}을/를 선택하세요.
            return;
    	}
    	if(gfn_isEmpty(cnptCd)){
    		gfn_comAlert("W0001", "거래처");			//	W0001	{0}을/를 선택하세요.
            return;
    	}

    	if(!gfn_isEmpty(vhclno)){
    		if(!(/^\d{2,3}[가-힣]\d{4}/.exec(vhclno))){
	    		gfn_comAlert("W0011", "차량번호");			//	W0001	{0}이/가 아닙니다.
    			return;
    		}
    	}

    	if(!gfn_isEmpty(pltBxCd) && gfn_isEmpty(bssInvntrQntt)){
    		gfn_comAlert("W0002", "팔레트 수량");			//	W0002	{0}을/를 입력하세요.
            return;
    	}else{
    		for(var i=0; i<jsonDtlPltBxCd.length; i++){
        		if(jsonDtlPltBxCd[i].pltBxCd == pltBxCd){
        			if(bssInvntrQntt > jsonDtlPltBxCd[i].bssInvntrQntt){
    		    		gfn_comAlert("W0008", "팔레트잔여수량", "입력한팔레트수량");			//	W0008	{0} 보다 {1}이/가 큽니다.
        				return;
        			}
        		}
        	}
    	}
    	if(!gfn_isEmpty(pltBxCd) && !gfn_isEmpty(bssInvntrQntt)){
    		pltSpmtYn = "Y";
    	}

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData = grdGdsInvntr.getRowData(nRow)
    		let spmtQntt = rowData.spmtQntt
    		let smptWght = rowData.smptWght;
    		let spmtPckgUnitCd = rowData.spmtPckgUnitCd;
    		let gdsGrd = rowData.gdsGrd;
    		let brndNm = rowData.brndNm;
    		let gdsCd = rowData.gdsCd;
    		totSpmtQntt = totSpmtQntt + Number(spmtQntt);

    		if(smptWght == 0){
    			gfn_comAlert("W0001", "출하중량");		//	W0001	{0}이/가 없습니다.
    			return;
    		}
    		if(gfn_isEmpty(spmtPckgUnitCd)){
    			gfn_comAlert("W0002", "상품명");		//	W0002	{0}을/를 선택하세요.
    			return;
    		}

    		if(gfn_isEmpty(gdsGrd)){
    			gfn_comAlert("W0002", "등급");			//	W0002	{0}을/를 선택하세요.
    			return;
    		}

    		if(cmndYn){
    			let cmndGdsGrd = SBUxMethod.get("dtl-slt-gdsGrd");
    			let cmndSpmtPckgUnitCd = SBUxMethod.get("dtl-slt-spmtPckgUnit");

    			if(gdsGrd != cmndGdsGrd){
    				gfn_comAlert("W0006", "지시등급", "실적등급");			// W0006 {0}와/과 {1}이/가 서로 다릅니다.
    				return;
    			}

    			if(spmtPckgUnitCd != cmndSpmtPckgUnitCd){
    				gfn_comAlert("W0006", "지시상품명", "실적상품명");	// W0006 {0}와/과 {1}이/가 서로 다릅니다.
    				return;
    			}
    		}

    		rowData.spmtYmd			= spmtYmd;
    		rowData.cnptCd 			= cnptCd;
    		rowData.trsprtCoCd 		= trsprtCoCd;
    		rowData.trsprtCoNm		= trsprtCoNm;
    		rowData.vhclno 			= vhclno;
    		rowData.dldtn 			= dldtn;
    		rowData.trsprtCst 		= trsprtCst;
    		if(gfn_isEmpty(rmrk)){
    			rowData.rmrk = '';
    		}else{
    			rowData.rmrk = rmrk;
    		}
    		rowData.spmtCmndno 		= spmtCmndno;
    		rowData.brndNm 			= brndNm;
    		rowData.outordrno 		= outordrno;
    		rowData.gdsCd 			= gdsCd;
    		rowData.pltBxCd 		= pltBxCd;
    		rowData.bssInvntrQntt 	= bssInvntrQntt;
    		rowData.pltSpmtYn 		= pltSpmtYn;
    		rowData.spmtPrsnDclrno 	= spmtPrsnDclrno;

    		insertList.push(rowData);
    	}

		if(cmndYn){
			let cmndQntt = SBUxMethod.get("dtl-inp-cmndQntt");
			let gdsGrd = SBUxMethod.get("dtl-slt-gdsGrd");
			let spmtPckgUnit = SBUxMethod.get("dtl-slt-spmtPckgUnit");

			if(totSpmtQntt != cmndQntt ){
	    		gfn_comAlert("W0006", "지시수량", "실적수량");			// W0006 {0}와/과 {1}이/가 서로 다릅니다.
	    		return
	    	}
		}

    	let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){
			const postJsonPromise = gfn_postJSON("/am/spmt/insertSpmtPrfmncList.do", insertList);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
       				SBUxMethod.set("dtl-inp-spmtCmndno", "");
       				SBUxMethod.set("dtl-inp-cmndQntt", "");
       				SBUxMethod.set("dtl-inp-cmndWght", "");
       				SBUxMethod.set("dtl-slt-trsprtCoCd", "");
       				SBUxMethod.set("dtl-inp-cnptCd", "");
       				SBUxMethod.set("dtl-inp-cnptNm", "");
       				SBUxMethod.set("dtl-inp-dldtn", "");
       				SBUxMethod.set("dtl-slt-gdsGrd", "");
       				SBUxMethod.set("dtl-slt-outordrno", "");
       				SBUxMethod.set("dtl-slt-spmtPckgUnit", "");
       				SBUxMethod.set("dtl-inp-spmtQntt", "");
       				SBUxMethod.set("dtl-inp-spmtWght", "");
       				SBUxMethod.set("dtl-inp-vhclno", "");
       				SBUxMethod.set("dtl-inp-trsprtCst", "");
       				SBUxMethod.set("dtl-slt-pltBxCd", "");
       				SBUxMethod.set("dtl-inp-bssInvntrQntt", "");
       				SBUxMethod.set("dtl-inp-rmrk", "");
       				SBUxMethod.set("dtl-inp-spmtPrsnDclrno", "");
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
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

	const fn_setGrdSmptPrfmnc = async function(){
		let spmtYmd = SBUxMethod.get("dtl-dtp-spmtYmd");

		const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncDtlList.do", {
			apcCd		: gv_selectedApcCd,
			spmtYmd		: spmtYmd
  		});
        const data = await postJsonPromise;
        try {
          	/** @type {number} **/
      		jsonSpmtPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
          		const gdsSpmtPrfmnc = {
          				apcCd			: item.apcCd,
          				spmtno			: item.spmtno,
          				spmtYmd			: item.spmtYmd,
          				itemCd			: item.itemCd,
          				itemNm			: item.itemNm,
          				vrtyCd			: item.vrtyCd,
          				vrtyNm			: item.vrtyNm,
          				spcfctCd		: item.spcfctCd,
          				spcfctNm		: item.spcfctNm,
          				gdsGrd			: item.gdsGrd,
          				gdsGrdNm		: item.gdsGrdNm,
          				cnptCd			: item.cnptCd,
          				cnptNm			: item.cnptNm,
          				trsprtCoCd		: item.trsprtCoCd,
          				trsprtCoNm		: item.trsprtCoNm,
          				delYn			: item.delYn,
          				vhclno			: item.vhclno,
          				dldtn			: item.dldtn,
          				trsprtCst		: item.trsprtCst,
          				spmtSeCd		: item.spmtSeCd,
          				spmtPrsnDclrnlo	: item.spmtPrsnDclrnlo,
          				plorCd			: item.plorCd,
          				pckgno			: item.pckgno,
          				pckgSn			: item.pckgSn,
          				brndNm			: item.brndNm,
          				gdsCd			: item.gdsCd,
          				prdcrCd			: item.prdcrCd,
          				spmtCmndno		: item.spmtCmndno,
          				spmtPckgUnitCd	: item.spmtPckgUnitCd,
          				spmtPckgUnitNm	: item.spmtPckgUnitNm,
          				spmtQntt		: item.spmtQntt,
          				spmtWght		: item.spmtWght,
          				rmrk			: item.rmrk
  				}
          		jsonSpmtPrfmnc.push(gdsSpmtPrfmnc);
  			});
          	grdSpmtPrfmnc.refresh();
          	SBUxMethod.set("crtr-ymd", spmtYmd);
		}catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		}
	}

	const fn_reset = function () {
		SBUxMethod.set("srch-dtp-pckgYmdFrom", gfn_dateFirstYmd(new Date())); // 생산일지 from
		SBUxMethod.set("srch-dtp-pckgYmdTo", gfn_dateToYmd(new Date())); // 생산일지 to
		SBUxMethod.set("srch-slt-warehouseSeCd", ""); // 창고구분
		SBUxMethod.set("srch-slt-itemCd", ""); // 품목
		SBUxMethod.set("srch-slt-vrtyCd", ""); // 품종
		SBUxMethod.set("srch-rdo-gdsSeCd", "1"); // 상품
		SBUxMethod.set("srch-slt-spcfctCd", ""); // 규격
		SBUxMethod.set("dtl-inp-spmtCmndno", ""); // 지시번호
		SBUxMethod.set("dtl-inp-outordrno", ""); // 지시번호
		SBUxMethod.set("dtl-inp-cmndQntt", ""); // 지시수량
		SBUxMethod.set("dtl-inp-cmndWght", ""); // 지시중량
		SBUxMethod.set("dtl-slt-gdsGrd", ""); // 등급
		SBUxMethod.set("dtl-slt-spmtPckgUnit", ""); // 포장등급
		SBUxMethod.set("dtl-dtp-spmtYmd",  gfn_dateToYmd(new Date())); // 출하일자
		SBUxMethod.set("dtl-inp-spmtQntt",  ""); // 출하수량
		SBUxMethod.set("dtl-inp-spmtWght",  ""); // 출하중량
		SBUxMethod.set("dtl-inp-cnptCd",  ""); // 거래처 코드
		SBUxMethod.set("dtl-inp-cnptNm",  ""); // 거래처 명
		SBUxMethod.set("dtl-slt-trsprtCoCd",  ""); // 운송회사
		SBUxMethod.set("dtl-inp-vhclno",  ""); // 차량번호
		SBUxMethod.set("dtl-inp-dldtn",  ""); // 배송처
		SBUxMethod.set("dtl-inp-trsprtCst",  ""); // 운임비용
		SBUxMethod.set("dtl-inp-rmrk",  ""); // 비고

		jsonGdsInvntr.length = 0;
		jsonSpmtPrfmnc.length = 0;
		grdGdsInvntr.refresh();
		grdSpmtPrfmnc.refresh();

		cmndYn = false;
	}

	/**
	 * 거래처 팝업 필수 함수
	 * 시작
	 */
	const fn_choiceCnpt = function() {
		let cnptNm = SBUxMethod.get("dtl-inp-cnptNm");
		popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, cnptNm, fn_setCnpt);
	}
	const fn_setCnpt = function(cnpt) {
		if (!gfn_isEmpty(cnpt)) {
			SBUxMethod.set("dtl-inp-cnptCd", cnpt.cnptCd);
			SBUxMethod.set("dtl-inp-cnptNm", cnpt.cnptNm);
		}
	}
	/*
	 * 거래처 팝업 필수 함수
	 * 종료
	 */

 	/**
	 * 차량 팝업 필수 함수
	 * 시작
	 */
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl, SBUxMethod.get("dtl-inp-vhclno"));
	}

	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("dtl-inp-vhclno", vhcl.vhclno);   // callBack input
		}
	}
	/*
	 * 차량 팝업 필수 함수
	 * 종료
	 */

	/**
	 * 출하지시 팝업 필수 함수
	 * 시작
	 */
	const fn_choiceSpmtCmnd = function() {
        popSpmtCmnd.init(gv_selectedApcCd, gv_selectedApcNm, "", fn_setSpmtCmnd);
	}
	const fn_setSpmtCmnd = async function(cmnd) {
		if (!gfn_isEmpty(cmnd)) {
			SBUxMethod.set("dtl-inp-spmtCmndno", cmnd.spmtCmndno);
			SBUxMethod.set("dtl-inp-cmndQntt", cmnd.cmndQntt);
			SBUxMethod.set("dtl-inp-cmndWght", cmnd.cmndWght);
			SBUxMethod.set("dtl-slt-trsprtCoCd", cmnd.trsprtCoCd);
			SBUxMethod.set("dtl-inp-cnptCd", cmnd.cnptCd);
			SBUxMethod.set("dtl-inp-cnptNm", cmnd.cnptNm);
			SBUxMethod.set("dtl-inp-dldtn", cmnd.dldtn);
			if(gfn_isEmpty(cmnd.rmrk)){
				SBUxMethod.set("dtl-inp-rmrk", "");
			}else{
				SBUxMethod.set("dtl-inp-rmrk", cmnd.rmrk);
			}
			SBUxMethod.set("dtl-inp-outordrno", cmnd.outordrno);
			SBUxMethod.set("dtl-slt-gdsGrd", cmnd.gdsGrd);
			SBUxMethod.set("srch-slt-itemCd", cmnd.itemCd);
			SBUxMethod.set("srch-slt-vrtyCd", cmnd.vrtyCd);

			let rst = await Promise.all([
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',			jsonComSpcfct, 			gv_apcCd, cmnd.itemCd), 				// 규격
				gfn_setSpmtPckgUnitSBSelect('dtl-slt-spmtPckgUnit', 	jsonDtlSpmtPckgUnit, 	gv_apcCd, cmnd.itemCd, cmnd.vrtyCd),	// 포장구분
				gfn_setSpmtPckgUnitSBSelect('grdGdsInvntr', 			jsonGrdSpmtPckgUnit, 	gv_apcCd, cmnd.itemCd, cmnd.vrtyCd)		// 포장구분(그리드)
			])
			grdGdsInvntr.refresh({"combo":true})
			SBUxMethod.refresh("srch-slt-spmtPckgUnitCd");

			SBUxMethod.set("srch-slt-spcfctCd", cmnd.spcfctCd);
			SBUxMethod.set("dtl-slt-spmtPckgUnit", cmnd.spmtPckgUnitCd);

			fn_search();

			cmndYn = true;
		}
	}
	/*
	 * 출하지시 팝업 필수 함수
	 * 종료
	 */

	/**
     * @name fn_docSpmt
     * @description 송품장 발행 버튼
     */
 	const fn_docSpmt = function() {

 		const spmtnoList = [];
		const allData = grdSpmtPrfmnc.getGridDataAll();
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				spmtnoList.push(item.spmtno);
    		}
		});

 		if (spmtnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const spmtno = spmtnoList.join("','");
 		gfn_popClipReport("송품장", "am/trsprtCmdtyDoc.crf", {apcCd: gv_selectedApcCd, spmtno: spmtno});
 	}

 // 엑셀다운로드
	// exp combo
	var jsonExpSltItem 			= [];	// 품목
	var jsonExpSltVrty 			= [];	// 품종
	var jsonExpSltSpcfct 		= [];	// 규격
	var jsonExpSltGdsGrd 		= [];	// 상품등급
	var jsonExpSltPrdcr 		= [];	// 생산자
	var jsonExpSltGdsSeCd 		= [];	// 상품구분
	var jsonExpSltSpmtPckgUnit 	= [];	// 포장구분
	var jsonExpSltCnpt 			= [];	// 거래처
	var jsonExpSltTrsprtCoCd 	= [];	// 운송사

	var grdExpSpmtPrfmnc;			// 엑셀 출하실적그리드
	var grdExpItem;					// 엑셀 품목그리드
	var grdExpVrty;					// 엑셀 품종그리드
	var grdExpGdsGrd				// 엑셀 등급그리드
	var grdExpSpcfct;				// 엑셀 규격그리드
	var grdExpPrdcr;				// 엑셀 생산자그리드
	var grdExpGdsSeCd;				// 엑셀 상품구분그리드
	var grdExpSpmtPckgUnit;			// 엑셀 포장구분그리드
	var grdExpCnpt;					// 엑셀 거래처그리드
	var grdExpTrsprtCoCd;			// 엑셀 운송사그리드


	var jsonExpSpmtPrfmnc 	= [];	// 엑셀 출하실적Json
	var jsonExpItem 		= [];	// 엑셀 품목Json
	var jsonExpVrty 		= [];	// 엑셀 품종Json
	var jsonExpGdsGrd 		= [];	// 엑셀 등급Json
	var jsonExpSpcfct 		= [];	// 엑셀 규격Json
	var jsonExpPrdcr 		= [];	// 엑셀 생산자Json
	var jsonExpGdsSeCd 		= [];	// 엑셀 상품구분Json
	var jsonExpSpmtPckgUnit = [];	// 엑셀 포장구분Json
	var jsonExpCnpt 		= [];	// 엑셀 거래처Json
	var jsonExpTrsprtCoCd 	= [];	// 엑셀 운송사Json


	const fn_getExpColumns = function() {
		const _columns = []
		_columns.push(
			{caption: ["출하일자"],		ref: 'spmtYmd',      	type:'input',  width:'100px',    style:'text-align:center',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			{caption: ["상품구분"], 	ref: 'gdsSeCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltGdsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["품목"], 		ref: 'itemCd',   	type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["품종"], 		ref: 'vrtyCd',   	type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltVrty', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["규격"], 		ref: 'spcfctCd',   	type:'combo',  width:'100px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSpcfct', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["등급"], 		ref: 'gdsGrd',   	type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpGdsGrd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["상품명"], 	ref: 'spmtPckgUnitCd', type:'combo',  width:'140px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSpmtPckgUnit', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["생산자"], 		ref: 'prdcrCd',   	type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltPrdcr', 	displayui : false,	itemcount: 10, label:'prdcrNm', value:'prdcrCd'}},
	        {caption: ["거래처"],		ref: 'cnptCd',	type:'combo',  width:'100px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpCnpt', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["운송회사"],		ref: 'trsprtCoCd',	type:'combo',  width:'100px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpTrsprtCoCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["차량번호"],		ref: 'vhclno',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["배송처"],		ref: 'dldtn',      	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["운송비용"],		ref: 'trsprtCst',   type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["수량"],			ref: 'spmtQntt',    type:'output',  width:'60px',    style:'text-align:right'},
	        {caption: ["중량 Kg"],		ref: 'spmtWght',    type:'output',  width:'80px',    style:'text-align:right'},
	        {caption: ["비고"],			ref: 'rmrk',      	type:'output',  width:'300px',    style:'text-align:left'}
		);

	    return _columns;
	}

	const fn_setSltJson = async function() {
		// 첫 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// set exp/imp combo json
		jsonExpSltGdsSeCd 		= gfn_cloneJson(jsonComGdsSeCd);			// 상품구분
		jsonExpSltItem 			= gfn_cloneJson(jsonComItem);				// 품목
		jsonExpSltVrty 			= gfn_cloneJson(jsonExeclComVrty);			// 품종
		jsonExpSltSpcfct 		= gfn_cloneJson(jsonExeclComSpcfct);		// 규격
		jsonExpSltGdsGrd 		= gfn_cloneJson(jsonGrdGdsGrd);				// 상품등급
		jsonExpSltSpmtPckgUnit 	= gfn_cloneJson(jsonExeclComSpmtPckgUnit);	// 포장구분
		jsonExpSltPrdcr 		= gfn_cloneJson(jsonExeclComPrdcr);			// 생산자
		jsonExpCnpt 			= gfn_cloneJson(jsonExeclComCnpt);			// 거래처
		jsonExpSltTrsprtCoCd 	= gfn_cloneJson(jsonComTrsprtCoCd);			// 운송사

	}

	const fn_setExpJson = async function() {
		// 첫 시트가 아닌 다른 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// export grid data
		jsonExpSpmtPrfmnc.length = 0;

		jsonExpGdsSeCd 		= gfn_cloneJson(jsonComGdsSeCd);			// 엑셀 상품구분Json
		jsonExpItem 		= gfn_cloneJson(jsonComItem);				// 엑셀 품목Json
		jsonExpVrty 		= gfn_cloneJson(jsonExeclComVrty);			// 엑셀 품종Json
		jsonExpGdsGrd 		= gfn_cloneJson(jsonGrdGdsGrd);				// 엑셀 등급Json
		jsonExpSpcfct 		= gfn_cloneJson(jsonExeclComSpcfct);		// 엑셀 규격Json
		jsonExpSpmtPckgUnit = gfn_cloneJson(jsonExeclComSpmtPckgUnit);	// 엑셀 포장구분Json
		jsonExpPrdcr 		= gfn_cloneJson(jsonExeclComPrdcr);			// 엑셀 생산자Json
		jsonExpCnpt 		= gfn_cloneJson(jsonExeclComCnpt);			// 엑셀 거래처Json
		jsonExpTrsprtCoCd 	= gfn_cloneJson(jsonComTrsprtCoCd);			// 엑셀 운송사Json
	}

	const fn_createExpGrid = async function(_expObjList) {
		_expObjList.forEach((exp, idx) => {
			var SBGridProperties = {};
			SBGridProperties.parentid = exp.parentid;
			SBGridProperties.id = exp.id;
			SBGridProperties.jsonref = exp.jsonref;
			SBGridProperties.emptyrecords = '데이터가 없습니다.';;
			SBGridProperties.selectmode = 'byrow';
			SBGridProperties.extendlastcol = 'none';
			SBGridProperties.columns = exp.columns;
			exp.sbGrid = _SBGrid.create(SBGridProperties);
			exp.sbGrid.addRow(true);
		});
	}

	const fn_dwnld = async function(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");

		if (gfn_isEmpty(itemCd)) {
  			gfn_comAlert("W0001", "품목");				//	W0002	{0}을/를 선택하세요.
            return;
  		}

		await fn_setSltJson();
		await fn_setExpJson();

		const expColumns = fn_getExpColumns();

		const expObjList = [
		    {
		        sbGrid: grdExpSpmtPrfmnc,
		        parentid: "sbexp-area-grdExpSpmtPrfmnc",
		        id: "grdExpSpmtPrfmnc",
		        jsonref: "jsonExpSpmtPrfmnc",
				columns: expColumns,
		        sheetName: "출하실적내역",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpGdsSeCd,
		        parentid: "sbexp-area-grdExpGdsSeCd",
		        id: "grdExpGdsSeCd",
		        jsonref: "jsonExpGdsSeCd",
				columns: [
			    	{caption: ["상품구분코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["상품구분코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'},
				],
		        sheetName: "상품구분",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpItem,
		        parentid: "sbexp-area-grdExpItem",
		        id: "grdExpItem",
		        jsonref: "jsonExpItem",
				columns: [
			    	{caption: ["품목코드"],     ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
			        {caption: ["품목명칭"],     ref: 'itemNm',  type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "품목",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpVrty,
		        parentid: "sbexp-area-grdExpVrty",
		        id: "grdExpVrty",
		        jsonref: "jsonExpVrty",
				columns: [
					{caption: ["품목코드"],		ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품목명"],		ref: 'itemNm',  type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품종코드"],    ref: 'vrtyCd',  type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["품종명칭"],    ref: 'vrtyNm',  type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "품종",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpSpcfct,
		        parentid: "sbexp-area-grdExpSpcfct",
		        id: "grdExpSpcfct",
		        jsonref: "jsonExpSpcfct",
				columns: [
					{caption: ["품목코드"],		ref: 'itemCd',  	type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품목명"],		ref: 'itemNm',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["규격코드"],   	ref: 'spcfctCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["규격코드명"],  	ref: 'spcfctNm',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "규격",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpGdsGrd,
		        parentid: "sbexp-area-grdExpGdsGrd",
		        id: "grdExpGdsGrd",
		        jsonref: "jsonExpGdsGrd",
				columns: [
			    	{caption: ["등급코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'},
				],
		        sheetName: "등급",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpSpmtPckgUnit,
		        parentid: "sbexp-area-grdExpSpmtPckgUnit",
		        id: "grdExpSpmtPckgUnit",
		        jsonref: "jsonExpSpmtPckgUnit",
				columns: [
					{caption: ["품목코드"],				ref: 'itemCd',  			type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품목명"],				ref: 'itemNm',  			type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["상품명코드"],   		ref: 'spmtPckgUnitCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["상품명"],    	ref: 'spmtPckgUnitNm',  	type:'output',  width:'160px',    style:'text-align:center'}
				],
		        sheetName: "상품명",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpPrdcr,
		        parentid: "sbexp-area-grdExpPrdcr",
		        id: "grdExpPrdcr",
		        jsonref: "jsonExpPrdcr",
				columns: [
			    	{caption: ["생산자코드"],   		ref: 'prdcrCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["생산자명"],    			ref: 'prdcrNm',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "생산자",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpCnpt,
		        parentid: "sbexp-area-grdExpCnpt",
		        id: "grdExpCnpt",
		        jsonref: "jsonExpCnpt",
				columns: [
			    	{caption: ['거래처코드'],		ref: 'cnptCd', 	type: 'output', width: '80px', style: 'text-align:center'},
			        {caption: ['거래처명'], 		ref: 'cnptNm', 	type: 'output', width: '80px', style: 'text-align:center'}
				],
		        sheetName: "거래처",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpTrsprtCoCd,
		        parentid: "sbexp-area-grdExpTrsprtCoCd",
		        id: "grdExpTrsprtCoCd",
		        jsonref: "jsonExpTrsprtCoCd",
				columns: [
			    	{caption: ['운송회사코드'],		ref: 'trsprtCoCd', 	type: 'output', width: '80px', style: 'text-align:center'},
			        {caption: ['운송회사코드명'], 	ref: 'trsprtCoNm', 	type: 'output', width: '80px', style: 'text-align:center'}
				],
		        sheetName: "운송회사",
		        title: "",
		        unit: ""
		    }
		];

		fn_createExpGrid(expObjList);

	    gfn_exportExcelMulti("출하실적(샘플).xlsx", expObjList);
	}

	const gfn_exportExcelMulti = function(_fileName, _objList) {

// 		엑셀 정보를 담는 변수
		var objExcelInfo = {
			strFileName : _fileName,
			strAction : "/am/excel/saveMultiExcel",
			bIsStyle: true,
			bIsMerge: true,
			bUseFormat: false,
			bIncludeData: true,
			bUseCompress: false
		};

		var dataList = [];
		var sheetNameList = [];
		var titleList = [];
		var unitList = [];
		var arrAdditionalData = [];

		//넘어온 오브젝트를 이용한 forEach문으로 타이틀리스트에 title을 넣고 unitList에 unit을 넣는 포이치문
		_objList.forEach((item, index) => {
			sheetNameList.push(item.sheetName);
			titleList.push(item.title);
			unitList.push(item.unit);

			if (index > 0) {
				var data = item.sbGrid.exportExcel(objExcelInfo, "return");
				dataList.push(data);
			}
		});

		arrAdditionalData.push(
           {"name": "arrSheetData", "value": JSON.stringify(dataList)},
           {"name": "arrSheetName", "value": JSON.stringify(sheetNameList)},
           {"name": "arrTitle", "value": JSON.stringify(titleList)},
           {"name": "arrUnit", "value": JSON.stringify(unitList)}
		);

		objExcelInfo.arrAdditionalData = arrAdditionalData;
		_objList[0].sbGrid.exportExcel(objExcelInfo);
	}


// 	excel모달을 열기위한 함수
	const importExcelData = function (e){

		SBUxMethod.openModal('modal-excel-spmtPrfmnc');

		fn_createGridSpmtPrfmncPopup();
		jsonExcelSpmtPrfmncPopup = 0;
    	grdExcelSpmtPrfmncPopup.rebuild();
    	grdExcelSpmtPrfmncPopup.importExcelData(e);
     }

    const fn_uld = async function() {
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");

		if (gfn_isEmpty(itemCd)) {
  			gfn_comAlert("W0001", "품목");				//	W0002	{0}을/를 선택하세요.
            return;
  		}

    	document.querySelector("#btnFileUpload").value = "";
		$("#btnFileUpload").click();

    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>