<%
 /**
  * @Class Name : rawMtrWghTablet.jsp
  * @Description : 원물계량등록 태블릿 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	신정철			최초 생성
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
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 원물계량등록 태블릿 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button 
						id="btnReset" 
						name="btnReset" 
						uitype="normal" 
						text="초기화" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_reset"
					></sbux-button>
					<sbux-button 
						id="btnSearch" 
						name="btnSearch" 
						uitype="normal" 
						text="조회" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_search"
					></sbux-button>
					<sbux-button 
						id="btnSave" 
						name="btnSave" 
						uitype="normal" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_save" 
						text="저장" 
					></sbux-button>
					<sbux-button 
						id="btnDelete" 
						name="btnDelete" 
						uitype="normal" 
						text="삭제" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_delete"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->			
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 1%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 1%">
						<col style="width: 4%">
						<col style="width: 3%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 8%">
						<col style="width: 5%">
						<col style="width: 8%">
						<col style="width: 5%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>생산자</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-prdcrNm"
									name="dtl-inp-prdcrNm"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-prdcrIdentno"
									name="dtl-inp-prdcrIdentno"
									class="form-control input-sm"
									maxlength="2"
									autocomplete="off"
									onkeyup="fn_noKeyup"
									onchange="fn_onChangePrdcrIdentno(this)"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button 
									id="btn-srch-prdcr" 
									name="btn-srch-prdcr" 
									class="btn btn-xs btn-outline-dark" 
									text="찾기" uitype="modal" 
									target-id="modal-prdcr" 
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td colspan="9"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td colspan="2"class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select 
											id="dtl-slt-itemCd" 
											name="dtl-slt-itemCd" 
											uitype="single" 
											jsondata-ref="jsonApcItem" 
											unselected-text="전체" 
											class="form-control input-sm input-sm-ast inpt_data_reqed" 
											onchange="fn_onChangeSrchItemCd(this)"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="4"class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select 
											id="dtl-slt-vrtyCd"
											name="dtl-slt-vrtyCd" 
											uitype="single" 
											jsondata-ref="jsonApcVrty" 
											unselected-text="선택" 
											class="form-control input-sm input-sm-ast inpt_data_reqed" 
											onchange="fn_onChangeSrchVrtyCd(this)"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="3" class="td_input"  style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox
										id="dtl-chk-fxngItem" 
										name="dtl-chk-fxngItem" 
										uitype="normal"
										text="고정" class="check"
									></sbux-checkbox>
								</p>
							</td>
							<td colspan="9"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고구분</th>
							<td colspan="18" class="td_input">
								<sbux-radio 
									id="dtl-rdo-wrhsSeCd" 
									name="dtl-rdo-wrhsSeCd" 
									uitype="normal" 
									jsondata-ref="jsonComWrhsSeCd"
									jsondata-text="cdVlNm"
									jsondata-value="cdVl"									 
									class="radio_label" 
									text-right-padding="10px"
								></sbux-radio>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>상품구분</th>
							<td colspan="18" class="td_input">
								<sbux-radio 
									id="dtl-rdo-gdsSeCd" 
									name="dtl-rdo-gdsSeCd" 
									uitype="normal" 
									jsondata-ref="jsonComGdsSeCd"
									jsondata-text="cdVlNm"
									jsondata-value="cdVl"
									class="radio_label"
									text-right-padding="10px"
								></sbux-radio>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>운송구분</th>
							<td colspan="18" class="td_input">
								<sbux-radio 
									id="dtl-rdo-trsprtSeCd" 
									name="dtl-rdo-trsprtSeCd" 
									uitype="normal" 
									jsondata-ref="jsonComTrsprtSeCd"
									jsondata-text="cdVlNm"
									jsondata-value="cdVl"									 
									class="radio_label" 
									text-right-padding="10px"
								></sbux-radio>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>계량일자</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="dtl-dtp-wghYmd" 
									name="dtl-dtp-wghYmd" 
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control sbux-pik-group-apc input-sm"
									style="width:100%;"
								></sbux-datepicker>
							</td>
							<td colspan="12"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" style="border-right: hidden;"><span class="data_required"></span>차량번호/기사명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-vhclno"
									name="dtl-inp-vhclno"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									autocomplete-ref="jsonVhclAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpVhclno(dtl-inp-vhclno)"
    								autocomplete-select-callback="fn_onSelectVhclno"
   								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button 
									id="btnSrchVhclno" 
									name="btnSrchVhclno" 
									class="btn btn-xs btn-outline-dark" 
									text="찾기" uitype="modal" 
									target-id="modal-vhcl" 
									onclick="fn_choiceVhcl"
								></sbux-button>
							</td>
							<td colspan="4"class="td_input"  style="border-right: hidden;">
								<sbux-input 
									uitype="text" 
									id="dtl-inp-drvrNm" 
									name="dtl-inp-drvrNm" 
									class="form-control input-sm" 
									readonly
								></sbux-input>
							</td>
							<td colspan="10"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>전체/공차중량</th>
							<td colspan="2" class="td_input"  style="border-right: hidden;">
								<sbux-input 
									uitype="text" 
									id="dtl-inp-wholWght" 
									name="dtl-inp-wholWght" 
									class="form-control input-sm input-sm-ast inpt_data_reqed" 
									maxlength="6"
									autocomplete="off"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_onChangeWholWght"
								></sbux-input>
							</td>
							<td colspan="4"class="td_input"  style="border-right: hidden;">
								<sbux-input 
									uitype="text" 
									id="dtl-inp-emptVhclWght" 
									name="dtl-inp-emptVhclWght" 
									class="form-control input-sm" 
									maxlength="6"
									autocomplete="off"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_onChangeEmptVhclWght"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="text-align: right; border-right: hidden;">
								<label class="bold">감량 %</label>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input 
									uitype="text" 
									id="dtl-inp-rdcdRt" 
									name="dtl-inp-rdcdRt" 
									class="form-control input-sm" 
									maxlength="5"
									autocomplete="off"
									mask = "{'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': false, 'autoUnmask': true}"
									onchange="fn_onChangeRdcdRt"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox 
										id="dtl-chk-fxngRdcdRt" 
										name="dtl-chk-fxngRdcdRt" 
										uitype="normal"
										text="고정" class="check"
									></sbux-checkbox>
								</p>
							</td>
							<td colspan="2" class="td_input" style="text-align: right; border-right: hidden;">
								<label class="bold">감량 Kg</label>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text" 
									id="dtl-inp-rdcdWght" 
									name="dtl-inp-rdcdWght" 
									class="form-control input-sm" 
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									readonly
								></sbux-input>
							</td>
							<td class="td_input" style="text-align: right; border-right: hidden;">
								<label class="bold">실중량 Kg</label>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input 
									uitype="text" 
									id="dtl-inp-actlWght" 
									name="dtl-inp-actlWght" 
									class="form-control input-sm" 
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									readonly
								></sbux-input>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" ><span class="data_required"></span>입고창고</th>
							<td colspan="2" class="td_input"  style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select 
											id="dtl-slt-warehouseSeCd" 
											name="dtl-slt-warehouseSeCd" 
											uitype="single" 
											jsondata-ref="jsonComWarehouse" 
											unselected-text="선택" 
											class="form-control input-sm input-sm-ast inpt_data_reqed"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="16" class="td_input">
								<p class="ad_input_row">
									<sbux-checkbox 
										id="dtl-chk-fxngWarehouseSeCd" 
										name="dtl-chk-fxngWarehouseSeCd" 
										uitype="normal"
										text="고정" class="check"
									></sbux-checkbox>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" style="border-right: hidden;">팔레트/박스</th>
						 	<td colspan="2" class="td_input" style="border-right: hidden;">
						 		<sbux-button
									id="dtl-btn-wrhsPltBx"
									name="dtl-btn-wrhsPltBx"
									class="btn btn-xs btn-outline-dark"
									text="입력"
									uitype="normal"
									onclick="fn_choiceWrhsPltBx"
								></sbux-button>
						 	</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-pltWght"
									name="dtl-inp-pltWght"
									class="form-control input-sm"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									readonly
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"><label class="bold">Kg</label></td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-bxWght"
									name="dtl-inp-bxWght"
									class="form-control input-sm"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									readonly
								></sbux-input>
							</td>
							<td colspan="7" class="td_input"><label class="bold">Kg</label></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고중량</th>
							<td colspan="2" class="td_input"  style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-wrhsWght"
									name="dtl-inp-wrhsWght"
									class="form-control input-sm"
									mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
									readonly
								></sbux-input>
							</td>
							<td colspan="16" class="td_input" ><label class="bold">Kg</label></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">생산연도</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="dtl-dtp-prdctnYr"
									name="dtl-dtp-prdctnYr"
									date-format="yyyy"
									datepicker-mode="year"
									class="form-control pull-right sbux-pik-group-apc input-sm-ast inpt_data_reqed input-sm"
									style="width:100%;"
								/>
							</td>
							<td colspan="12"></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>계량등록 내역</span>
							<span style="font-size:12px">(기준일자 : 
								<sbux-label
									id="crtr-ymd"
									name="crtr-ymd"
									uitype="normal"
									text=""
									class="bold"
									mask = "{'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
								></sbux-label> , 조회건수 <span id="cnt-wgh">0</span>건)
							</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdWghPrfmnc" style="width:100%;height:130px;"></div>
				</div>

				<!--[pp] //검색결과 -->
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

    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal 
        	id="modal-vhcl" 
        	name="modal-vhcl" 
        	uitype="middle" 
        	header-title="차량 선택" 
        	body-html-id="body-modal-vhcl" 
        	footer-is-close-button="false"
        	header-is-close-button="false" 
        	style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>

    <!-- 입고팔레트 선택 Modal -->
    <div>
        <sbux-modal
	        id="modal-wrhsPltBx"
	        name="modal-wrhsPltBx"
	        uitype="middle"
	        header-title="원물계량 팔레트/박스 입고등록"
	        body-html-id="body-modal-wrhsPltBx"
	        header-is-close-button="false"
	        footer-is-close-button="false"
	        style="width:800px"
        ></sbux-modal>
    </div>
    <div id="body-modal-wrhsPltBx">
    	<jsp:include page="../../am/popup/wrhsPltBxPopup.jsp"></jsp:include>
    </div>

</body>

<script type="text/javascript">
	var jsonApcItem				= [];	// 품목 		itemCd		검색
	var jsonApcVrty				= [];	// 품종 		vrtyCd		검색
	var jsonApcGrd				= [];	// 등급 		vrtyCd		검색
	var jsonComWarehouse		= [];	// 창고 		warehouse	검색
	var jsonComWrhsSeCd			= [];	// 입고구분
	var jsonComGdsSeCd			= [];	// 상품구분
	var jsonComTrsprtSeCd		= [];
	
	var jsonPrdcr				= [];
    var jsonPrdcrAutocomplete 	= [];
	
	var jsonVhcl				= [];
	var jsonVhclAutocomplete 	= [];

	
    /* SBGrid */
    var grdWghPrfmnc;	// 계량실적조회
	var jsonWghPrfmnc = [];
    
    /* 팔레트/박스 Data */
	let jsonWrhsPltBx = {
			wrhsPltBxData: [],
			pltQntt: 0,
			pltWght: 0,
			bxQntt: 0,
			bxWght: 0,
			totalQntt: 0,
			totalWght: 0
	}
    
 	/*
	 * @name fn_getPrdcrs
	 * @description 생산자 자동완성 목록 가져오기
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}
    
	/**
	 * @name fn_getVhcls
	 * @description 차량정보 조회
	 */
	const fn_getVhcls = async function() {
		jsonVhcl = await gfn_getVhcls(gv_selectedApcCd);
		jsonVhcl = gfn_setFrst(jsonVhcl);
	}
    
    
    /**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
		 	gfn_setApcItemSBSelect('dtl-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
		]);
	}
        
    /**
     * @name fn_initSBRadio
     * @description SBRadio JSON 불러오기
     */
    const fn_initSBRadio = async function() {

    	let result = await Promise.all([
	    		gfn_getComCdDtls('WRHS_SE_CD'),		// 입고구분
	    		gfn_getComCdDtls('GDS_SE_CD', gv_selectedApcCd),		// 상품구분
	    		gfn_getComCdDtls('TRSPRT_SE_CD')	// 운송구분
    		]);

    	jsonComWrhsSeCd = gfn_getJsonFilter(result[0], 'cdVl', ["1", "2", "3"]);
		jsonComGdsSeCd = result[1];
		jsonComTrsprtSeCd = result[2];

		SBUxMethod.refresh('dtl-rdo-wrhsSeCd');
		SBUxMethod.refresh('dtl-rdo-gdsSeCd');
		SBUxMethod.refresh('dtl-rdo-trsprtSeCd');
    }
    
    
    
	window.addEventListener('DOMContentLoaded', function(e) {	
		fn_init();
	});
	
	const fn_init = async function() {
		
		SBUxMethod.set("dtl-chk-fxngItem", {"dtl-chk-fxngItem": false});
		SBUxMethod.set("dtl-chk-fxngRdcdRt", {"dtl-chk-fxngRdcdRt": false});
		SBUxMethod.set("dtl-chk-fxngWarehouseSeCd", {"dtl-chk-fxngWarehouseSeCd": false});
		
		fn_createWghPrfmncGrid();
		
		//SBUxMethod.set('dtl-inp-rdctRt', defaultRdctRtChkFxng);
		let rst = await Promise.all([
				fn_initSBSelect(),
				fn_initSBRadio(),
				fn_getPrdcrs(),
				fn_getVhcls()
			]);

		fn_clearForm();
		fn_search();
	}
	
	/** common button action */
	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = async function() {
    	SBUxMethod.set("dtl-chk-fxngItem", "false");
    	SBUxMethod.set("dtl-chk-fxngWarehouseSeCd", "false");
    	SBUxMethod.set("dtl-chk-fxngRdcdRt", "false");
    	SBUxMethod.refresh("dtl-chk-fxngItem");
    	SBUxMethod.refresh("dtl-chk-fxngWarehouseSeCd");
    	SBUxMethod.refresh("dtl-chk-fxngRdcdRt");
    	fn_clearForm();
	}
	
	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {

		if (!SBUxMethod.get("dtl-chk-fxngItem")["dtl-chk-fxngItem"]) {
			
			// 계량일자
			SBUxMethod.set("dtl-dtp-wghYmd", gfn_dateToYmd(new Date()));
			
			// 생산연도
			SBUxMethod.set("dtl-dtp-prdctnYr", gfn_dateToYear(new Date()));
			
			// 생산자
			fn_clearPrdcr();
			SBUxMethod.set("dtl-inp-prdcrNm", "");
			SBUxMethod.set("dtl-inp-prdcrIdentno", "");			
			
			// 품목
			SBUxMethod.set("dtl-slt-itemCd", null);
			// 품종
			SBUxMethod.set("dtl-slt-vrtyCd", null);

	 		fn_onChangeSrchItemCd({value: null});
	 		
			// 입고구분
			SBUxMethod.set("dtl-rdo-wrhsSeCd", "3");
			
			// 상품구분
			SBUxMethod.set("dtl-rdo-gdsSeCd", "1");
			
			// 운송구분
			SBUxMethod.set("dtl-rdo-trsprtSeCd", "1");
		}

		if (!SBUxMethod.get("dtl-chk-fxngWarehouseSeCd")["dtl-chk-fxngWarehouseSeCd"]) {
			// 창고구분
			SBUxMethod.set("dtl-slt-warehouseSeCd", null);
		}
		
		if (!SBUxMethod.get("dtl-chk-fxngRdcdRt")["dtl-chk-fxngRdcdRt"]) {
			// 감량 (%)
			SBUxMethod.set("dtl-inp-rdcdRt", "");
		}

		// 전체중량
		SBUxMethod.set("dtl-inp-wholWght", "");
		// 공차중량
		SBUxMethod.set("dtl-inp-emptVhclWght", "");
				
		// 감량kg
		SBUxMethod.set("dtl-inp-rdcdWght", "");
		// 실중량
		SBUxMethod.set("dtl-inp-actlWght", "");
		// 차량번호
		SBUxMethod.set("dtl-inp-vhclno", "");
		// 기사명
		SBUxMethod.set("dtl-inp-drvrNm", "");
		
		fn_clearPltBx();
	}
	
	/**
     * @name fn_search
     * @description 조회 버튼
     */
	const fn_search = async function() {

	   	// grid clear
	   	jsonWghPrfmnc.length = 0;
	   	fn_setGrdWghPrfmnc();
	}
	 
   /**
    * @name fn_setGrdWghPrfmnc
    * @description 계량실적 조회
    */
   const fn_setGrdWghPrfmnc = async function() {

 		let wghYmd = SBUxMethod.get("dtl-dtp-wghYmd");		// 계량일자

		const postJsonPromise = gfn_postJSON("/am/wgh/selectWghPrfmncList.do", {
			apcCd: gv_selectedApcCd,
			wghYmd: wghYmd,

         	// pagination
 	  		pagingYn : 'N',
 			currentPageNo : 0,
  		  	recordCountPerPage : 0
 		});

       const data = await postJsonPromise;

 		try {

         	/** @type {number} **/
     		let totalRecordCount = 0;

     		jsonWghPrfmnc.length = 0;
         	data.resultList.forEach((item, index) => {
 				const wghPrfmnc = {
 						rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						wghno: item.wghno,
  						wghSn: item.wghSn,
  						wghnoIndct: item.wghnoIndct,
  						wrhsno: item.wrhsno,
  						wghYmd: item.wghYmd,
  						vhclno: item.vhclno,
  						prdcrCd: item.prdcrCd,
  						itemCd: item.itemCd,
  						itemNm: item.itemNm,
  						vrtyCd: item.vrtyCd,
  						vrtyNm: item.vrtyNm,
  						wholWght: item.wholWght,
  						emptVhclWght: item.emptVhclWght,
  						rdcdRt: item.rdcdRt,
  						actlWght: item.actlWght,
  						rdcdWght: item.rdcdWght,
  						wrhsWght: item.wrhsWght,
  						rmrk: item.rmrk,
  						apcNm: item.apcNm,
  						prdcrNm: item.prdcrNm,
  						grdCd: item.grdCd,
  						grdNm: item.grdNm,
  						pltWght: item.pltWght,
  						bxQntt: item.bxQntt,
  						bxWght: item.bxWght,
  						invntrWght: item.invntrWght,
  						warehouseSeCd: item.warehouseSeCd,
  						warehouseSeNm: item.warehouseSeNm,
  						gdsSeCd: item.gdsSeCd,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeCd: item.wrhsSeCd,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeCd: item.trsprtSeCd,
  						trsprtSeNm: item.trsprtSeNm,
  						stdGrd: item.stdGrd,
  						stdGrdCd: item.stdGrdCd,
 				}
 				jsonWghPrfmnc.push(wghPrfmnc);
 			});
			
         	totalRecordCount = jsonWghPrfmnc.length;
         	
         	grdWghPrfmnc.refresh();
         	document.querySelector('#cnt-wgh').innerText = totalRecordCount;
          	SBUxMethod.set("crtr-ymd", wghYmd);

         } catch (e) {
     		if (!(e instanceof Error)) {
     			e = new Error(e);
     		}
     		console.error("failed", e.message);
         }
	}
	
   /**
    * @name fn_save
    * @description 저장 버튼
    */
	const fn_save = async function() {

		let wghYmd = SBUxMethod.get("dtl-dtp-wghYmd");					// 계량일자
		let prdcrCd = SBUxMethod.get("dtl-inp-prdcrCd");				// 생산자
		let itemCd = SBUxMethod.get("dtl-slt-itemCd");					// 품목
		let vrtyCd = SBUxMethod.get("dtl-slt-vrtyCd");					// 품종
		let wrhsSeCd = SBUxMethod.get("dtl-rdo-wrhsSeCd");				// 입고구분
		let gdsSeCd = SBUxMethod.get("dtl-rdo-gdsSeCd");				// 상품구분
		let trsprtSeCd = SBUxMethod.get("dtl-rdo-trsprtSeCd");			// 운송구분
		let warehouseSeCd = SBUxMethod.get("dtl-slt-warehouseSeCd");	// 창고
		let vhclno = SBUxMethod.get("dtl-inp-vhclno");					// 차량번호
		let rmrk = SBUxMethod.get("dtl-inp-rmrk");						// 비고
		let prdctnYr = SBUxMethod.get("dtl-dtp-prdctnYr");				// 생산연도

		let wholWght = parseInt(SBUxMethod.get("dtl-inp-wholWght")) || 0;			// 전체중량
		let emptVhclWght = parseInt(SBUxMethod.get("dtl-inp-emptVhclWght")) || 0;	// 공차중량

		let rdcdRt = parseInt(SBUxMethod.get("dtl-inp-rdcdRt")) || 0;				// 감량률(%)
		let rdcdWght = parseInt(SBUxMethod.get("dtl-inp-rdcdWght")) || 0;			// 감량kg
		let actlWght = parseInt(SBUxMethod.get("dtl-inp-actlWght")) || 0;			// 실중량
		let wrhsWght = parseInt(SBUxMethod.get("dtl-inp-wrhsWght")) || 0;			// 입고중량

	   	// validation check
	   	if (gfn_isEmpty(wghYmd)) {
	   		gfn_comAlert("W0001", "입고일자");		//	W0001	{0}을/를 선택하세요.
	           return;
	   	}
	   	if (gfn_isEmpty(prdcrCd)) {
	   		gfn_comAlert("W0002", "생산자");		//	W0002	{0}을/를 입력하세요.
	           return;
	   	}
	   	if (gfn_isEmpty(itemCd)) {
	   		gfn_comAlert("W0001", "품목");		//	W0001	{0}을/를 선택하세요.
	           return;
	   	}
	   	if (gfn_isEmpty(vrtyCd)) {
	   		gfn_comAlert("W0001", "품종");		//	W0001	{0}을/를 선택하세요.
	           return;
	   	}
	   	if (gfn_isEmpty(wrhsSeCd)) {
	   		gfn_comAlert("W0001", "입고구분");		//	W0001	{0}을/를 선택하세요.
	           return;
	   	}
	   	if (gfn_isEmpty(gdsSeCd)) {
	   		gfn_comAlert("W0001", "상품구분");		//	W0001	{0}을/를 선택하세요.
	           return;
	   	}
	   	
	   	trsprtSeCd
	   	if (gfn_isEmpty(warehouseSeCd)) {
	   		gfn_comAlert("W0001", "창고");		//	W0001	{0}을/를 선택하세요.
	           return;
	   	}
	   	if (gfn_isEmpty(vhclno)) {
	   		gfn_comAlert("W0002", "차량번호");		//	W0002	{0}을/를 입력하세요.
	           return;
	   	} else {
    		if(!(/^\d{2,3}[가-힣]\d{4}/.exec(vhclno))){
	    		gfn_comAlert("W0011", "차량번호");			//	W0001	{0}이/가 아닙니다.
    			return;
    		}
    	}
	
	   	if (wholWght <= 0) {
	   		gfn_comAlert("W0002", "전체중량");		//	W0002	{0}을/를 입력하세요.
	           return;
	   	}
	   	if (wrhsWght <= 0) {
	   		gfn_comAlert("W0005", "입고중량");		//	W0005	{0}이/가 없습니다.
	           return;
	   	}
	
    	if (jsonWrhsPltBx.wrhsPltBxData.length == 0) {
    		gfn_comAlert("W0005", "팔레트/박스 정보");		//	W0005	{0}이/가 없습니다.
            return;
    	}
	   	
	   	
		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
	   		return;
	   	}
	
	   	const wghPrfmncDtlList = [];

	   	jsonWrhsPltBx.wrhsPltBxData.forEach((pltBx) => {
			wghPrfmncDtlList.push({
				apcCd: gv_selectedApcCd,
				grdCd: pltBx.jgmtGrdCd,
				pltno: pltBx.pltno,
				sn: pltBx.jgmtGrdCd,
				pltKnd: pltBx.pltKnd,
				pltQntt: pltBx.pltQntt,
				pltWght: pltBx.pltWght,
				bxKnd: pltBx.bxKnd,
				bxQntt: pltBx.bxQntt,
				bxWght: pltBx.bxWght,
				stdGrdList: pltBx.stdGrdList
			});
		});
	   	
	   	const rawMtrWgh = {
	   		apcCd: gv_selectedApcCd,
	   		wghYmd: wghYmd,					// 계량일자
	   		prdcrCd: prdcrCd,				// 생산자
	   		itemCd: itemCd,					// 품목
	   		vrtyCd: vrtyCd,					// 품종
	   		wrhsSeCd: wrhsSeCd,				// 입고구분
	   		gdsSeCd: gdsSeCd,				// 상품구분
	   		trsprtSeCd: trsprtSeCd,			// 운송구분
	   		warehouseSeCd: warehouseSeCd,	// 창고
	   		vhclno: vhclno,					// 차량번호
	   		rmrk: rmrk,						// 비고
	   		wholWght: wholWght,				// 전체중량
	   		emptVhclWght: emptVhclWght,		// 공차중량
	   		rdcdRt: rdcdRt,					// 감량률(%)
	   		rdcdWght: rdcdWght,				// 감량kg
	   		actlWght: actlWght,				// 실중량
	   		wrhsWght: wrhsWght,				// 입고중량
	   		prdctnYr: prdctnYr,				// 생산연도
	   		wghPrfmncDtlList: wghPrfmncDtlList
	   	}

   		let postUrl = "/am/wgh/insertWghPrfmnc.do";

		const postJsonPromise = gfn_postJSON(postUrl, rawMtrWgh);
		const data = await postJsonPromise;

		try {
			if (_.isEqual("S", data.resultStatus)) {
	       		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	       		
	       		fn_reset();
	       		fn_search();
	       		
	       	} else {
	       		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
	       	}
       	} catch(e) {
    	   gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
       	}
	}
   	
	/**
     * @name fn_delete
     * @description 삭제 버튼
	 */
	const fn_delete = async function() {

		const wghPrfmncList = [];

		const allData = grdWghPrfmnc.getGridDataAll();
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				
				if (!wghPrfmncList.some(function(wgh) {
					return wgh.wghno === item.wghno;
				})) {
					wghPrfmncList.push({
						apcCd: item.apcCd,
						wghno: item.wghno
					});
				}
    		}
		});

		if (wghPrfmncList.length === 0) {
			gfn_comAlert("W0005", "선택대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

		const postJsonPromise = gfn_postJSON("/am/wgh/deleteWghPrfmncList.do", wghPrfmncList);
		const data = await postJsonPromise;

        try {
			if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}
   
	/**
	 * @name fn_createWghPrfmncGrid
	 * @description 원물계량 실적 그리드 생성
	 */
	const fn_createWghPrfmncGrid = function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWghPrfmnc';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.mergecells = 'byrestriccol';
        SBGridProperties.columns = [
        	{caption: ['계량번호'], ref: 'wghno', hidden: true},
        	{caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'50px', style: 'text-align:center', userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ['계량번호'], ref: 'wghno', width: '120px', type: 'output', style:'text-align:center'},
        	{caption: ['생산자'], ref: 'prdcrNm', width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['품목'], ref: 'itemNm', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['품종'], ref: 'vrtyNm', width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['상품구분'], ref: 'gdsSeNm', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['입고구분'], ref: 'wrhsSeNm', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['운송구분'], ref: 'trsprtSeNm', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['차량번호'], ref: 'vhclno', width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['보관창고'], ref: 'warehouseSeNm', width: '60px', type: 'output', style:'text-align:center'},
            {caption: ['전체중량'], ref: 'wholWght', width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['공차중량'], ref: 'emptVhclWght', width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['감량%'], ref: 'rdcdRt', width: '60px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,###.##'}},
            {caption: ['감량Kg'], ref: 'rdcdWght', width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['실중량'], ref: 'actlWght', width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['입고중량'], ref: 'wrhsWght', width: '80px', type: 'output', style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ['팔레트중량'], ref: 'pltWght', width: '80px', type: 'output', style:'text-align:right',
            	format : {type:'number', rule:'#,###'},
            	merge : false
            },
            {caption: ['박스중량'], ref: 'bxWght', width: '80px', type: 'output', style:'text-align:right',
            	format : {type:'number', rule:'#,###'},
            	merge : false
            },
            {caption: ['재고중량'], ref: 'invntrWght', width: '80px', type: 'output', style:'text-align:right',
            	format : {type:'number', rule:'#,###'},
            	merge : false
            },
            {caption: ['등급'], ref: 'grdNm', width: '60px', type: 'output', style:'text-align:center',
            	merge : false
            },
            {caption: ["No."], ref: 'rowSeq', type:'output',  width:'50px', style:'text-align:right',  hidden: true},
            {caption: ['순번'], ref: 'wghSn', width: '40px', type: 'output', style:'text-align:center',  hidden: true},
            {caption: ['비고'], 	ref: 'rmrk', width: '300px', type: 'output'},
            {caption: ["APC코드"],	ref: 'apcCd',        	type:'output',  hidden: true},
            {caption: ["생산자코드"],	ref: 'prdcrCd',        	type:'output',  hidden: true},
            {caption: ["표준등급"],		ref: 'stdGrd',        	type:'output',  hidden: true},
            {caption: ["표준등급코드"],	ref: 'stdGrdCd',        	type:'output',  hidden: true},
        ];
	    grdWghPrfmnc = _SBGrid.create(SBGridProperties);
	}

	
	/** ui event */
	
	const fn_onChangeApc = async function() {
		fn_init();
	}
    
	
	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;
		// 품종은 필터처리
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd)	// 품종
		]);

		if (!gfn_isEmpty(itemCd)) {
			const itemInfo = _.find(jsonApcItem, {value: itemCd});
			const rawMtrRdcdRt = parseFloat(itemInfo.rawMtrRdcdRt) || 0;
			SBUxMethod.set("dtl-inp-rdcdRt", rawMtrRdcdRt);
		} else {
			SBUxMethod.set("dtl-inp-rdcdRt", "");
		}
		
		fn_clearPltBx();	// 팔레트 박스 초기화
	}
	
	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	 const fn_onChangeSrchVrtyCd = async function(obj) {
			let vrtyCd = obj.value;
			let itemCd = "";
			const vrtyInfo = _.find(jsonApcVrty, {value: vrtyCd});
			
			if (!gfn_isEmpty(vrtyCd)) {
				itemCd = vrtyInfo.mastervalue;
			} else {
				itemCd = SBUxMethod.get("dtl-slt-itemCd");
			}

			const prvItemCd = SBUxMethod.get("dtl-slt-itemCd");
			if (itemCd != prvItemCd) {
				SBUxMethod.set("dtl-slt-itemCd", itemCd);
				await fn_onChangeSrchItemCd({value: itemCd});
				SBUxMethod.set("dtl-slt-vrtyCd", vrtyCd);
			}
		}
	

	
	function fn_onChangeRdctRt(id){
		var RdctRt = SBUxMethod.get("dtl-inp-rdctRt").replace(regex, "");
		SBUxMethod.set("dtl-inp-rdctRt", RdctRt);
		if (RdctRt < 0 || RdctRt > 100){
			alert("0~100 사이의 값을 입력해야합니다.");
			SBUxMethod.set("dtl-inp-rdctRt", 0);
		}
		calKg();
		fn_setClclnWght();
	}
	
	function fn_changeRdctRtChkFxng(id){
		if(SBUxMethod.get("rdctRt-chk-fxng")["rdctRt-chk-fxng"] == false){
			SBUxMethod.attr('dtl-inp-rdctRt', 'readonly', 'false')
		}
		else{
			SBUxMethod.attr('dtl-inp-rdctRt', 'readonly', 'true')
			defaultRdctRtChkFxng = SBUxMethod.get("dtl-inp-rdctRt");
		}
	}
	
	function calKg(){
		var wholWght = Number(SBUxMethod.get("dtl-inp-wholWght"));
		var emptVhclWght = Number(SBUxMethod.get("dtl-inp-emptVhclWght"));		
		var rdctRt = Number(SBUxMethod.get("dtl-inp-rdctRt"));
		
		var rdcdWght = gfn_isEmpty(rdctRt) ? 0 : (wholWght-emptVhclWght)*(rdctRt/100);
		var actlWght = wholWght-emptVhclWght-rdcdWght;

		SBUxMethod.set("dtl-inp-rdcdWght", rdcdWght);
		SBUxMethod.set("dtl-inp-actlWght", actlWght);
	}
	
	/**
	 * @name fn_onKeyUpVhclno
	 * @description 차량번호 입력 시 event : autocomplete
	 */
	const fn_onKeyUpVhclno = function(vhclno){
// 		fn_clearVhclno();
		jsonVhclAutocomplete = gfn_filterFrst(vhclno, jsonVhcl);
    	SBUxMethod.changeAutocompleteData('srch-inp-vhclno', true);
    }

	/**
	 * @name fn_clearVhclno
	 * @description 차량번호 폼 clear
	 */
	const fn_clearVhclno = async function() {
		SBUxMethod.set("srch-inp-vhclno", null);
		SBUxMethod.attr("srch-inp-vhclno", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectVhclno
	 * @description 차량번호 autocomplete 선택 callback
	 */
	function fn_onSelectVhclno(value, label, item) {
		SBUxMethod.set("srch-inp-vhclno", value);
		SBUxMethod.attr("srch-inp-vhclno", "style", "background-color:aquamarine");	//skyblue
		fn_setDrvrNm(value);
	}
	
	function fn_setDrvrNm(vhclno){
		for(var i=0; i<jsonVhcl.length; i++){
			if(jsonVhcl[i].vhclno === vhclno){
				SBUxMethod.set("inp-drvrNm", jsonVhcl[i].drvrNm);
				break;
			}
		}
	}

	

	
	/** 차량정보 */
	/**
	 * @name fn_getvhcls
	 * @description  APC별 차량 목록 가져오기
	 * @function
	 * @param {string} _apcCd		APC코드
	 * @returns {any[]}
	 */
	const gfn_getVhcls = async function(_apcCd) {
		const postJsonPromise = gfn_postJSON(URL_WRHS_VHCL, {apcCd: _apcCd, delYn: "N"});
		const data = await postJsonPromise;
		const sourceJson = [];
		data.resultList.forEach((item) => {
				sourceJson.push({
					vhclno: item.vhclno,
					drvrNm: item.drvrNm,
					name: item.vhclno,
 					value: item.vhclno
				});
			});
		return sourceJson;
	}

	 

   

    
 	function fn_setClclnWght() {
 		let actlWght = gfn_isEmpty(SBUxMethod.get("dtl-inp-actlWght")) ? 0 : SBUxMethod.get("dtl-inp-actlWght");
 		let pltWght = gfn_isEmpty(SBUxMethod.get("inp-pltWght")) ? 0 : SBUxMethod.get("inp-pltWght");
 		let bxWght = gfn_isEmpty(SBUxMethod.get("inp-bxWght")) ? 0 : SBUxMethod.get("inp-bxWght");

		//입고중량 Kg set
		SBUxMethod.set("dtl-inp-wrhsWght", actlWght - pltWght - bxWght);
	}


	
	/**
	* @name fn_onInputPrdcrNm
	* @description 생산자명 입력 시 event : autocomplete
	*/
	const fn_onInputPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm.target.value) > 100){
			SBUxMethod.set("dtl-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('dtl-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("dtl-inp-prdcrCd", "");
		SBUxMethod.set("dtl-inp-prdcrIdentno", "");
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:''");
	}
	
	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		// 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
		if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
			document.getElementById('btn-srch-prdcr').click();
		} else{
			SBUxMethod.set("dtl-inp-prdcrCd", value);
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
			let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
			fn_setPrdcrForm(prdcr);
		}
	}
	
	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 찾기 버튼 클릭
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("dtl-inp-prdcrNm"));
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 모달 선택 콜백 callback
	 */
	const fn_setPrdcr = async function(prdcr) {
		
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("dtl-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
			
			fn_setPrdcrForm(prdcr);
		}
		
	}
	
	const fn_setPrdcrForm = async function(prdcr) {

		if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
			await gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
			SBUxMethod.set("dtl-slt-vrtyCd", prdcr.rprsVrtyCd);
			fn_onChangeSrchVrtyCd({value:prdcr.rprsVrtyCd});
		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("dtl-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.set("dtl-slt-itemCd", prdcr.rprsItemCd);
					fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
				}
			}
		}

		if (!gfn_isEmpty(prdcr.wrhsSeCd)) {	// 입고구분
			SBUxMethod.set("dtl-rdo-wrhsSeCd", prdcr.wrhsSeCd);
		}
		if (!gfn_isEmpty(prdcr.gdsSeCd)) {	// 상품구분
			SBUxMethod.set("dtl-rdo-gdsSeCd", prdcr.gdsSeCd);
		}
		if (!gfn_isEmpty(prdcr.vhclno)) {	// 차량번호
			SBUxMethod.set("dtl-inp-vhclno", prdcr.vhclno);
		}
		
		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("dtl-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("dtl-inp-prdcrIdentno", "");
		}
	}

	
	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
 	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
	}
	
	

	
	
	/**
	 * @name fn_choiceVhcl
	 * @description 차량번호 선택 popup
	 */
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl, SBUxMethod.get("dtl-inp-vhclno"));
	}
	 
	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("dtl-inp-vhclno", vhcl.vhclno);
			SBUxMethod.set("dtl-inp-drvrNm", vhcl.drvrNm);
		}
	}
	
	/**
     * @name fn_clearPltBx
     * @description 팔레트/박스 초기화
     * @function
     */
	const fn_clearPltBx = function() {
		jsonWrhsPltBx.wrhsPltBxData.length = 0;
		SBUxMethod.set("dtl-inp-pltWght", 0);
		SBUxMethod.set("dtl-inp-bxWght", 0);
		fn_setWght();
	}

	/**
	 * @name fn_choiceWrhsPltBx
	 * @description 입고팔레트 지정 popup 호출
	 */
	const fn_choiceWrhsPltBx = function() {

		const itemCd = SBUxMethod.get("dtl-slt-itemCd");
		const wghno = SBUxMethod.get("dtl-inp-wghno");

		if (gfn_isEmpty(itemCd)) {
			gfn_comAlert("W0001", "품목");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		SBUxMethod.openModal('modal-wrhsPltBx');
		popWrhsPltBx.init(
				{
					apcCd: gv_selectedApcCd,
					apcNm: gv_selectedApcNm,
					itemCd: itemCd,
					wghno: wghno
				}
				, fn_setWrhsPltBx
				, jsonWrhsPltBx);
	}
	
	/**
	 * @name fn_setWrhsPltBx
	 * @description 팔레트/박스 선택 Callback
	 */
	const fn_setWrhsPltBx = function(_wrhsPltBx) {

		if (!gfn_isEmpty(_wrhsPltBx)) {
			jsonWrhsPltBx = gfn_cloneJson(_wrhsPltBx);
			// 팔레트/박스 Kg set
			SBUxMethod.set("dtl-inp-pltWght", jsonWrhsPltBx.pltWght);
			SBUxMethod.set("dtl-inp-bxWght", jsonWrhsPltBx.bxWght);
			//정산중량 Kg set
			fn_setWght();
		}
	}
	
	
	/**
	 * @name fn_onChangeWholWght
	 * @description 전체중량 값 변경 event
	 */
	const fn_onChangeWholWght = function() {
		// 전체중량 >> 감량, 실중량, 입고중량
		fn_setWght();
	}
	/**
	 * @name fn_onChangeWholWght
	 * @description 전체중량 값 변경 event
	 */
	const fn_onChangeEmptVhclWght = function() {
		// 공차중량 >> 감량, 실중량, 입고중량
		fn_setWght();
	}
	/**
	 * @name fn_onChangeWholWght
	 * @description 전체중량 값 변경 event
	 */
	const fn_onChangeRdcdRt = function() {
		// 감량(%) >> 감량, 실중량, 입고중량
		if (parseFloat(SBUxMethod.get("dtl-inp-rdcdRt")) > 100) {
			alert("감량률이 100% 보다 큽니다.");
			SBUxMethod.set("dtl-inp-rdcdRt", "");
			return;
		}
		fn_setWght();
	}
	
	
	/**
	 * @name fn_setWght
	 * @description 입고중량 계산
	 */
	const fn_setWght = function() {

		const wholWght = parseInt(SBUxMethod.get("dtl-inp-wholWght")) || 0;
		const emptVhclWght = parseInt(SBUxMethod.get("dtl-inp-emptVhclWght")) || 0;
		const rdcdRt = parseFloat(SBUxMethod.get("dtl-inp-rdcdRt")) || 0;
		const pltWght = parseInt(SBUxMethod.get("dtl-inp-pltWght")) || 0;
		const bxWght = parseInt(SBUxMethod.get("dtl-inp-bxWght")) || 0;

		// 실중량
		const actlWght = wholWght - emptVhclWght;
		// 감량(kg)
		const rdcdWght = Math.round(actlWght * rdcdRt / 100);
		// 정산중량(입고중량)
		const wrhsWght = actlWght - rdcdWght - pltWght - bxWght;

		SBUxMethod.set("dtl-inp-actlWght", actlWght);	// 실중량
		SBUxMethod.set("dtl-inp-rdcdWght", rdcdWght);	// 감량(kg)
		SBUxMethod.set("dtl-inp-wrhsWght", wrhsWght);	// 정산중량(입고중량)
	}

	function fn_noKeyup(event) {

	}

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>