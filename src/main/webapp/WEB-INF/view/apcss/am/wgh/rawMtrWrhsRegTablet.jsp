<%
 /**
  * @Class Name : regRawMtrWrhsPrfmncTeblet.jsp
  * @Description : 원물입고 실적등록 태블릿 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	정희운			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 원물입고등록(태블릿)</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물입고등록 태블릿 -->
				</div>
				<div style="margin-left: auto;">
					<p class="ad_input_row">
						<sbux-checkbox
							uitype="normal"
							id="srch-chk-autoPrint"
							name="srch-chk-autoPrint"
							uitype="normal"
							class="form-control input-sm check"
							text="원물인식표 자동출력"
						/>
					</p>
					<sbux-button
						id="btnCmndDocPckg"
						name="btnCmndDocPckg"
						uitype="normal"
						class="btn btn-sm btn-primary"
						onclick="fn_docRawMtrWrhs"
						text="원물인식표"
					></sbux-button>
					<sbux-button
						id="btnReset"
						name="btnReset"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_reset"
						text="초기화"
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
						class="btn btn-sm btn-outline-danger"
						onclick="fn_delete"
						text="삭제"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
						text="조회"
					></sbux-button>
					<sbux-button
						id="btnClose"
						name="btnClose"
						uitype="normal"
						text="종료"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_close"
					></sbux-button>
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
						<col style="width: 1%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 3%">
						<col style="width: 9%">
						<col style="width: 10%">
						<col style="width: 20%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>생산자</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
   								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrIdentno"
									name="srch-inp-prdcrIdentno"
									class="form-control input-sm"
									maxlength="2"
									autocomplete="off"
									onchange="fn_onChangeSrchPrdcrIdentno(this)"
								/>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td colspan="3" style="border-left: hidden;">

							</td>

						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-itemCd"
											name="srch-slt-itemCd"
											uitype="single"
											jsondata-ref="jsonApcItem"
											unselected-text="전체"
											class="form-control input-sm input-sm-ast inpt_data_reqed"
											onchange="fn_onChangeSrchItemCd(this)"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-vrtyCd"
											name="srch-slt-vrtyCd"
											uitype="single"
											jsondata-ref="jsonApcVrty"
											jsondata-value="itemVrtyCd"
											unselected-text="선택"
											class="form-control input-sm input-sm-ast inpt_data_reqed"
											onchange="fn_onChangeSrchVrtyCd(this)"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="3"class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox
										uitype="normal"
										id="srch-chk-fxngItem"
										name="srch-chk-fxngItem"
										uitype="normal"
										class="form-control input-sm check"
										text="고정"
									/>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wrhsYmd"
									name="srch-dtp-wrhsYmd"
									date-format="yyyy-mm-dd"
									class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
									style="width:100%;"
								/>
							</td>
							<td colspan="5" style="border-left: hidden;">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고수량/중량</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-bxQntt"
									name="srch-inp-bxQntt"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									maxlength="6"
									autocomplete="off"
									mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_onChangeBxQntt(this)"
								/>
							</td>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-wghtAvg"
									name="srch-inp-wghtAvg"
									class="form-control input-sm"
									placeholder="평균"
									maxlength="6"
									autocomplete="off"
									mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_onChangeWghtAvg(this)"
								/>
							</td>

							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-wrhsWght"
									name="srch-inp-wrhsWght"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									maxlength="7"
									autocomplete="off"
									mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
									onchange="fn_onChangeWrhsWght(this)"
								/>
							</td>
							<td style="border-right: hidden;">
								<label class="bold">Kg</label>
							</td>
							<td class="td_input" style="border-right: hidden;">

							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고구분</th>
							<td colspan="11" class="td_input">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-wrhsSeCd"
										name="srch-rdo-wrhsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComWrhsSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
									/>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>상품구분</th>
							<td colspan="11" class="td_input">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-gdsSeCd"
										name="srch-rdo-gdsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComGdsSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
									/>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" style="border-right: hidden;"><span class="data_required"></span>운송구분</th>
							<td colspan="11" class="td_input">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-trsprtSeCd"
										name="srch-rdo-trsprtSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonComTrsprtSeCd"
										jsondata-text="cdVlNm"
										jsondata-value="cdVl"
									/>
								</p>
							</td>
						</tr>
	 					<tr>
						 	<th scope="row" class="th_bg"><span class="data_required" ></span>입고등급</th>
					 		<td colspan="11" class="td_input">
					 			<jsp:include page="../../am/popup/apcStdGrdSelect.jsp"></jsp:include>
					 		</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">박스종류</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											unselected-text="선택"
											uitype="single"
											id="srch-slt-bxKnd"
											name="srch-slt-bxKnd"
											class="form-control input-sm"
											jsondata-ref="jsonApcBx"
										/>
									</div>
								</div>
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox
										uitype="normal"
										id="srch-chk-fxngBxKnd"
										name="srch-chk-fxngBxKnd"
										uitype="normal"
										class="form-control input-sm check"
										text="고정"
									/>
								</p>
							</td>
							<td colspan="6">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고창고</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select

											uitype="single"
											id="srch-slt-warehouseSeCd"
											name="srch-slt-warehouseSeCd"
											class="form-control input-sm input-sm-ast inpt_data_reqed"
											jsondata-ref="jsonComWarehouse"
										/>
									</div>
								</div>
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox
										uitype="normal"
										id="srch-chk-fxngWarehouseSeCd"
										name="srch-chk-fxngWarehouseSeCd"
										uitype="normal"
										class="form-control input-sm check"
										text="고정"
									/>
								</p>
							</td>
							<td colspan="6">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>생산연도</th>
							<td colspan="6"class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-prdctnYr"
									name="srch-dtp-prdctnYr"
									date-format="yyyy"
									datepicker-mode="year"
									style="width:100%;"
									class="form-control pull-right sbux-pik-group-apc input-sm-ast inpt_data_reqed input-sm"
								/>
							</td>
							<td colspan="5" style="border-left: hidden;">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>입고등록 내역</span>
							<span style="font-size:12px">(기준일자 :
								<sbux-label
									id="crtr-ymd"
									name="crtr-ymd"
									uitype="normal"
									text=""
									class="bold"
									mask = "{'alias': 'yyyy-mm-dd', 'autoUnmask': true}"
								></sbux-label> , 조회건수 <span id="cnt-wrhs">0</span>건)
							</span>
						</li>
					</ul>
				</div>

				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdRawMtrWrhs" style="height:165px;"></div>
				</div>
			</div>
		</div>
	</section>

	<!-- 생산자 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
    <!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>
</body>
<script type="text/javascript">

	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonApcGrd			= [];	// 등급 		vrtyCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouse	검색
	var jsonApcBx			= [];	// 팔레트/박스 	검색

	var jsonComWrhsSeCd		= [];	// 입고구분		WRHS_SE_CD
	var jsonComGdsSeCd		= [];	// 상품구분		GDS_SE_CD
	var jsonComTrsprtSeCd	= [];	// 운송구분		TRSPRT_SE_CD

	/* 생산자 자동완성 */
    var jsonPrdcr				= [];
    var jsonPrdcrAutocomplete 	= [];

    /* SBGrid */
	var grdRawMtrWrhs;
    /* SBGrid Data (JSON) */
	var jsonRawMtrWrhs = [];


    /**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
		 	gfn_setPltBxSBSelect('srch-slt-bxKnd', 			jsonApcBx, gv_selectedApcCd, 'B'),	// 박스
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
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

		SBUxMethod.refresh('srch-rdo-wrhsSeCd');
		SBUxMethod.refresh('srch-rdo-gdsSeCd');
		SBUxMethod.refresh('srch-rdo-trsprtSeCd');
    }

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {

		SBUxMethod.set("srch-chk-fxngItem", {"srch-chk-fxngItem": false});
		//SBUxMethod.set("srch-chk-fxngWghtAvg", {"srch-chk-fxngWghtAvg": false});
		SBUxMethod.set("srch-chk-fxngBxKnd", {"srch-chk-fxngBxKnd": false});
		SBUxMethod.set("srch-chk-autoPrint", {"srch-chk-autoPrint": false});
		SBUxMethod.set("srch-chk-fxngWarehouseSeCd", {"srch-chk-fxngWarehouseSeCd": false});

		fn_createGrid();

		SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-prdctnYr", gfn_dateToYear(new Date()));

		let result = await Promise.all([
				fn_initSBSelect(),
				fn_initSBRadio(),
				fn_getPrdcrs()
			]);

		fn_clearForm();
		fn_search();
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
		stdGrdSelect.init();
	});

	/**
     * @name fn_docRawMtrWrhs
     * @description 원물확인서 발행 버튼
     */
	const fn_docRawMtrWrhs = function() {

		const rawMtrWrhsList = [];
		const allData = grdRawMtrWrhs.getGridDataAll();
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
					rawMtrWrhsList.push(
						item.wrhsno
					);
				}

		});
		if (rawMtrWrhsList.length === 0) {
			gfn_comAlert("W0005", "선택대상");		//	W0005	{0}이/가 없습니다.
			return;
		}
		const wrhsno = rawMtrWrhsList.join("','");

		gfn_popClipReport("원물인식표", "am/rawMtrIdntyDoc.crf", {apcCd: gv_selectedApcCd, wrhsno: wrhsno});
	}

	/**
	 * @name fn_createGrid
	 * @description 원물입고실적 그리드 생성
	 */
	function fn_createGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRawMtrWrhs';
	    SBGridProperties.id = 'grdRawMtrWrhs';
	    SBGridProperties.jsonref = 'jsonRawMtrWrhs';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;

	    SBGridProperties.columns = [
        	{caption: ["체크박스"], 	ref: 'checkedYn', 		type: 'checkbox', 	width: '40px',	 style:'text-align: center',
				typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}, checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ["입고번호"],	ref: 'wrhsno',      	type:'output',  	width:'120px',   style:'text-align:center'},
	        {caption: ["생산자"],		ref: 'prdcrNm',     	type:'output',  	width:'100px',   style:'text-align:center'},
	        {caption: ["품목"],		ref: 'itemNm',      	type:'output',  	width:'80px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'vrtyNm',      	type:'output',  	width:'80px',    style:'text-align:center'},
	        {caption: ["상품구분"],	ref: 'gdsSeNm',     	type:'output',  	width:'80px',    style:'text-align:center'},
	        {caption: ["입고구분"],	ref: 'wrhsSeNm',    	type:'output',  	width:'80px',    style:'text-align:center'},
	        {caption: ["운송구분"],	ref: 'trsprtSeNm',  	type:'output',  	width:'80px',    style:'text-align:center'},
	        {caption: ["등급"],		ref: 'grdNm',      		type:'output',  	width:'80px',    style:'text-align:center'},
	        {caption: ["박스수량"],	ref: 'bxQntt',      	type:'output',  	width:'60px',    style:'text-align:right'},
	        {caption: ["중량 (Kg)"],	ref: 'wrhsWght',    	type:'output',  	width:'60px',    style:'text-align:right'},
	        {caption: ["박스종류"],	ref: 'bxKndNm',     	type:'output',  	width:'100px',   style:'text-align:center'},
	        {caption: ["보관창고"],	ref: 'warehouseSeNm',	type:'output',  	width:'100px',   style:'text-align:center'},
	        {caption: ["생산연도"],	ref: 'prdctnYr',    	type:'output',  	width:'80px',    style:'text-align:center'},
	        {caption: ["상세등급"],	ref: 'stdGrd',    		type:'output',  	width:'200px',   style:'text-align:left'},

	        {caption: ["APC코드"],	ref: 'apcCd',     		type:'output',  	hidden: true},
	        {caption: ["생산자코드"],	ref: 'prdcrCd',   		type:'output',  	hidden: true},
	        {caption: ["품목코드"],	ref: 'itemCd',   		type:'output',  	hidden: true},
	        {caption: ["품종코드"],	ref: 'vrtyCd',   		type:'output',  	hidden: true},
	        {caption: ["상품구분코드"],	ref: 'gdsSeCd',   		type:'output',  	hidden: true},
	        {caption: ["입고구분코드"],	ref: 'wrhsSeCd',   		type:'output',  	hidden: true},
	        {caption: ["운송구분코드"],	ref: 'trsprtSeCd', 		type:'output',  	hidden: true},
	        {caption: ["등급코드"],	ref: 'grdCd',   		type:'output',  	hidden: true},
	        {caption: ["박스종류코드"],	ref: 'bxKnd',   		type:'output',  	hidden: true},
	        {caption: ["보관창고코드"],	ref: 'warehouseSeCd', 	type:'output',  	hidden: true},
	        {caption: ["상세등급코드"],	ref: 'stdGrdCd', 		type:'output',  	hidden: true}
	    ];

	    grdRawMtrWrhs = _SBGrid.create(SBGridProperties);

	}

	/**
	 * common button action
	 */

	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
     const fn_reset = function() {

		fn_clearForm();
	}

	/**
     * @name fn_delete
     * @description 삭제 버튼
     */
	const fn_delete = async function() {

		const rawMtrWrhsList = [];

		const allData = grdRawMtrWrhs.getGridDataAll();
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {

				 {
					rawMtrWrhsList.push({
						apcCd: item.apcCd,
						wrhsno: item.wrhsno
					});
				}
    		}
		});

		if (rawMtrWrhsList.length === 0) {
			gfn_comAlert("W0005", "선택대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

    	let postUrl = "/am/wrhs/deleteRawMtrWrhsList.do";

    	const postJsonPromise = gfn_postJSON(postUrl, rawMtrWrhsList);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_inputClear();
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
 	}


	/**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {

    	// 항목 set
    	let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");		// 입고일자
 		let wrhsSeCd = SBUxMethod.get("srch-rdo-wrhsSeCd");		// 입고구분
 		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");		// 상품구분
 		let trsprtSeCd = SBUxMethod.get("srch-rdo-trsprtSeCd");	// 운송구분
 		let itemCd = SBUxMethod.get("srch-slt-itemCd");			// 품목
 		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");			// 품종
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");		// 생산자
		let bxQntt = SBUxMethod.get("srch-inp-bxQntt");			// 수량
 		let wrhsWght = SBUxMethod.get("srch-inp-wrhsWght");		// 중량
 		let bxKnd = SBUxMethod.get("srch-slt-bxKnd");			// 박스종류
 		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");	// 창고
 		let prdctnYr = SBUxMethod.get("srch-dtp-prdctnYr");		// 생산연도

    	// validation check
    	if (gfn_isEmpty(wrhsYmd)) {
    		gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(wrhsSeCd)) {
    		gfn_comAlert("W0001", "입고구분");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(gdsSeCd)) {
    		gfn_comAlert("W0001", "상품구분");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(trsprtSeCd)) {
    		gfn_comAlert("W0001", "운송구분");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(itemCd)) {
    		gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(vrtyCd)) {
    		gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	if (gfn_isEmpty(prdcrCd)) {
    		gfn_comAlert("W0001", "생산자");		//	//	W0002	{0}을/를 입력하세요.
            return;
    	}

    	if (gfn_isEmpty(wrhsWght)) {
    		gfn_comAlert("W0001", "중량");		//	//	W0002	{0}을/를 입력하세요.
            return;
    	}

     	if (gfn_isEmpty(warehouseSeCd)) {
     		gfn_comAlert("W0001", "창고");		//	W0002	{0}을/를 선택하세요.
			return;
     	}

    	if (gfn_isEmpty(prdctnYr)) {
    		gfn_comAlert("W0001", "생산연도");		//	W0002	{0}을/를 선택하세요.
            return;
    	}

    	// 등급
    	const stdGrd = stdGrdSelect.getStdGrd();

    	if (gfn_isEmpty(stdGrd)) {
    		gfn_comAlert("W0001", "등급");		//	W0002	{0}을/를 선택하세요.
            return;
    	}

    	let grdCd = stdGrd.grdJgmt.grdCd;
    	if (gfn_isEmpty(grdCd)) {
    		gfn_comAlert("W0001", "등급");		//	W0002	{0}을/를 선택하세요.
            return;
    	}
    	

    	if (!gfn_comConfirm("Q0001", "저장")) {
    		return;
    	}

    	const rawMtrWrhs = {
        		apcCd: gv_selectedApcCd,
       			wrhsYmd: wrhsYmd,
       			wrhsSeCd: wrhsSeCd,
       			gdsSeCd: gdsSeCd,
       			trsprtSeCd: trsprtSeCd,
       			itemCd: itemCd,
       			vrtyCd: vrtyCd,
       			prdcrCd: prdcrCd,
       			bxQntt: bxQntt,
       			bxKnd: bxKnd,
       			wrhsWght: wrhsWght,
       			warehouseSeCd: warehouseSeCd,
       			grdCd: grdCd,
       			prdctnYr: prdctnYr,
       			stdGrdList: stdGrd.stdGrdList
        	}
    	
    	if(!gfn_isEmpty(vrtyCd)){
    		rawMtrWrhs.vrtyCd = rawMtrWrhs.vrtyCd.substring(4,8);
    	}

    	let postUrl = "/am/wrhs/insertRawMtrWrhs.do";

    	const postJsonPromise = gfn_postJSON(postUrl, rawMtrWrhs);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_clearForm();
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

		if(SBUxMethod.get("srch-chk-autoPrint")["srch-chk-autoPrint"]){
			fn_autoPrint(data.resultMap);

		}
	}

	const fn_autoPrint = function(resultMap){
		gfn_popClipReport("원물인식표", "am/rawMtrIdntyDoc.crf", {apcCd: gv_selectedApcCd, wrhsno: resultMap.wrhsno});
	}

    /**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {

		if (gfn_isEmpty(SBUxMethod.get("srch-dtp-wrhsYmd"))) {
    		gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 입력하세요.
            return;
    	}

		var getColRef = grdRawMtrWrhs.getColRef("checkedYn");
		grdRawMtrWrhs.setFixedcellcheckboxChecked(0, getColRef, false);

    	// grid clear
    	jsonRawMtrWrhs.length = 0;
    	fn_setGrdRawMtrWrhs();
	}

	/** ui event */

	const fn_onChangeApc = async function() {
		fn_init();
	}

/**
	 * @name fn_getPrdcrs
     * @description 생산자 자동완성 JSON 설정
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
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
	 * @name fn_onInputPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onInputPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm.target.value) > 100){
			SBUxMethod.set("srch-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
		fn_setPrdcrForm(prdcr);
	}

 	/**
 	 * @name fn_clearPrdcr
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.set("srch-inp-prdcrIdentno", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup 호출
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback 처리
	 */
	const fn_setPrdcr = async function(prdcr) {

		await fn_getPrdcrs();

		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcr);
		}
	}

	const fn_setPrdcrForm = async function(prdcr) {

		if (!gfn_isEmpty(prdcr.itemVrtyCd)) {	// 대표품종
			await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
			SBUxMethod.set("srch-slt-vrtyCd", prdcr.itemVrtyCd);
			fn_onChangeSrchVrtyCd({value:prdcr.itemVrtyCd});
		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
					fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
				}
			}
		}

		if (!gfn_isEmpty(prdcr.wrhsSeCd)) {	// 입고구분
			SBUxMethod.set("srch-rdo-wrhsSeCd", prdcr.wrhsSeCd);
		}
		if (!gfn_isEmpty(prdcr.gdsSeCd)) {	// 상품구분
			SBUxMethod.set("srch-rdo-gdsSeCd", prdcr.gdsSeCd);
		}
		if (!gfn_isEmpty(prdcr.trsprtSeCd)) {	// 운송구분
			SBUxMethod.set("srch-rdo-trsprtSeCd", prdcr.trsprtSeCd);
		}
		if (!gfn_isEmpty(prdcr.vhclno)) {	// 차량번호
			SBUxMethod.set("srch-inp-vhclno", prdcr.vhclno);
		}

		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}

	}

	const fn_onChangeSrchPrdcrIdentno = function(obj) {

		if (gfn_isEmpty(SBUxMethod.get("srch-inp-prdcrIdentno"))) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue

		let prdcrIdentno = parseInt(SBUxMethod.get("srch-inp-prdcrIdentno")) || 0;

		if (prdcrIdentno < 1) {
			return;
		}

		const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
		if (gfn_isEmpty(prdcrInfo)) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
		SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		fn_setPrdcrForm(prdcrInfo);

	}


	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {

		let itemCd = obj.value;
		const itemInfo = _.find(jsonApcItem, {value: itemCd});
		
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),			// 품종
            stdGrdSelect.setStdGrd(gv_selectedApcCd, _GRD_SE_CD_WRHS, itemCd)
		]);
		if(gfn_isEmpty(itemCd)){
            SBUxMethod.set("srch-inp-wghtAvg", "");
		}
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		const itemCd = vrtyCd.substring(0,4);

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if(!gfn_isEmpty(vrtyCd)){
			if (itemCd != prvItemCd) {
				SBUxMethod.set("srch-slt-itemCd", itemCd);
				await fn_onChangeSrchItemCd({value: itemCd});
				SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
			} else{
				SBUxMethod.set("srch-slt-itemCd", itemCd);
				await fn_onChangeSrchItemCd({value: itemCd});
				SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
			}
		}else{
            SBUxMethod.set("srch-inp-wghtAvg", "");
            fn_onChangeWghtAvg();
		}
        let vrtyInfo = _.find(jsonApcVrty, {value: vrtyCd.substring(4,8)})
        const wghtRkngSeCd = vrtyInfo.wghtRkngSeCd;
        const unitWght = parseInt(vrtyInfo.unitWght) || 0;
        SBUxMethod.set("srch-inp-wghtAvg", unitWght);
	}

	const fn_onChangeBxQntt = function(obj) {
		let bxQntt = parseInt(SBUxMethod.get("srch-inp-bxQntt")) || 0;
		let wghtAvg = parseInt(SBUxMethod.get("srch-inp-wghtAvg")) || 0;

		if (wghtAvg > 0) {
			let wrhsWght = Math.round(bxQntt * wghtAvg);
			SBUxMethod.set("srch-inp-wrhsWght", wrhsWght);
		}
	}

	const fn_onChangeWghtAvg = function(obj) {

		let bxQntt = parseInt(SBUxMethod.get("srch-inp-bxQntt")) || 0;
		let wghtAvg = parseInt(SBUxMethod.get("srch-inp-wghtAvg")) || 0;

		if (wghtAvg > 0) {
			let wrhsWght = Math.round(bxQntt * wghtAvg);
			SBUxMethod.set("srch-inp-wrhsWght", wrhsWght);
		}
	}

	const fn_onChangeWrhsWght = function(obj) {
		let bxQntt = parseInt(SBUxMethod.get("srch-inp-bxQntt")) || 0;
		let wrhsWght = parseInt(SBUxMethod.get("srch-inp-wrhsWght")) || 0;
	}

    /**
     * @name fn_setGrdRawMtrWrhs
     * @description 입고내역 조회
     */
	const fn_setGrdRawMtrWrhs = async function() {
   		let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");	// 입고일자
   		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");	// 품종
   		
   		if(!gfn_isEmpty(vrtyCd)){
   			vrtyCd = vrtyCd.substring(4,8);
   		}

		const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsList.do", {
			apcCd: gv_selectedApcCd,
			wrhsYmd: wrhsYmd,
			vrtyCd: vrtyCd
  		});

        const data = await postJsonPromise;

  		try {
  			if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonRawMtrWrhs.length = 0;
          	data.resultList.forEach((item, index) => {
          		const rawMtrWrhs = {
  						rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						apcNm: item.apcNm,
  						wrhsno: item.wrhsno,
  						wghno: item.wghno,
  						pltno: item.pltno,
  						wrhsYmd: item.wrhsYmd,
  						prdcrCd: item.prdcrCd,
  						prdcrNm: item.prdcrNm,
  						itemCd: item.itemCd,
  						itemNm: item.itemNm,
  						vrtyCd: item.vrtyCd,
  						vrtyNm: item.vrtyNm,
  						gdsSeCd: item.gdsSeCd,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeCd: item.wrhsSeCd,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeCd: item.trsprtSeCd,
  						trsprtSeNm: item.trsprtSeNm,
  						grdCd: item.grdCd,
  						grdNm: item.grdNm,
  						vhclno: item.vhclno,
  						bxQntt: item.bxQntt,
  						wrhsWght: item.wrhsWght,
  						bxKnd: item.bxKnd,
  						bxKndNm: item.bxKndNm,
  						warehouseSeCd: item.warehouseSeCd,
  						warehouseSeNm: item.warehouseSeNm,
  						prdctnYr: item.prdctnYr,
  						rmrk: item.rmrk,
  						stdGrd: item.stdGrd,
  						stdGrdCd: item.stdGrdCd,
  				}
  				jsonRawMtrWrhs.push(rawMtrWrhs);
  			});
          	totalRecordCount = jsonRawMtrWrhs.length;

			grdRawMtrWrhs.rebuild();
          	document.querySelector('#cnt-wrhs').innerText = totalRecordCount;
          	SBUxMethod.set("crtr-ymd", wrhsYmd);

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

    const fn_inputClear = function() {
  		// 수량
  		SBUxMethod.set("srch-inp-wrhsQntt", "");
  		// 중량
  		SBUxMethod.set("srch-inp-wrhsWght", "");
  		// 평균
  		SBUxMethod.set("srch-inp-wghtAvg", "");
    }

 	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {

		if (!SBUxMethod.get("srch-chk-fxngItem")["srch-chk-fxngItem"]) {

			// 입고일자
			SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
			// 생산연도
			SBUxMethod.set("srch-dtp-prdctnYr", gfn_dateToYear(new Date()));

			// 입고구분
			SBUxMethod.set("srch-rdo-wrhsSeCd", "3");
			// 상품구분
			SBUxMethod.set("srch-rdo-gdsSeCd", "1");
			// 운송구분
			SBUxMethod.set("srch-rdo-trsprtSeCd", "1");

			// 생산자 clear
			SBUxMethod.set("srch-inp-prdcrCd", "");
			SBUxMethod.set("srch-inp-prdcrNm", "");
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue

			// 품목
			SBUxMethod.set("srch-slt-itemCd", "");
			// 품종
			SBUxMethod.set("srch-slt-vrtyCd", "");
		}

		if (!SBUxMethod.get("srch-chk-fxngItem")["srch-chk-fxngItem"]) {
	 		// 평균
			SBUxMethod.set("srch-inp-wghtAvg", "");

		}

		if (!SBUxMethod.get("srch-chk-fxngBxKnd")["srch-chk-fxngBxKnd"]) {
			// 박스종류
	 		SBUxMethod.set("srch-slt-bxKnd", "");
		}

		if (!SBUxMethod.get("srch-chk-fxngWarehouseSeCd")["srch-chk-fxngWarehouseSeCd"]) {
			// 창고
	 		SBUxMethod.set("srch-slt-warehouseSeCd", "");
		}

		// 수량
 		SBUxMethod.set("srch-inp-bxQntt", "");
 		// 중량
 		SBUxMethod.set("srch-inp-wrhsWght", "");

		//fn_onChangeSrchItemCd({value: null});
	}

	const fn_close = function(){
		parent.gfn_tabClose("TAB_AM_001_008");
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>