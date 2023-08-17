<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드  영역 시작-->
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="button" class="btn btn-sm btn-outline-danger">초기화</sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger">조회</sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
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
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th class="ta_r th_bg">조회일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-strtCrtrYmd" name="srch-dtp-strtCrtrYmd" date-format="yyyy-mm-dd" class="form-control pull-right input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endCrtrYmd" name="srch-dtp-endCrtrYmd" date-format="yyyy-mm-dd" class="form-control pull-right input-sm"/>
							</td>
							<td>&nbsp;</td>
							<th class="ta_r th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 기능입니다."
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchPrdcr"
									name="btnSrchPrdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td colspan="6">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<b>&nbsp;</b>
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
							<th class="ta_r th_bg">계획일시</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-strtPlanYmd" name="srch-dtp-strtPlanYmd" class="form-control pull-right input-sm" date-format="yyyy-mm-dd HH:MM" show-time-bar="true"></sbux-datepicker>
							</td>
							<td >&nbsp;</td>
							<th class="ta_r th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
								<sbux-input
									uitype="text"
									id="dtl-inp-prdcrNm"
									name="dtl-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 기능입니다."
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNmDtl(dtl-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNmDtl"
   								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnDtlrdcr"
									name="btnDtlrdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcrDtl"
								></sbux-button>
							</td>
							<td>&nbsp;</td>
							<th class="ta_r th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-itemCd" name="dtl-slt-itemCd" uitype="single" jsondata-ref="jsonApcItem" unselected-text="전체" class="form-control input-sm" onchange="fn_onChangeSrchItemCd(this)" ></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;" >
								<sbux-select id="dtl-slt-vrtyCd" name="dtl-slt-vrtyCd" uitype="single" jsondata-ref="jsonApcVrty" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-wrhs1" name="srch-rdo-wrhs" uitype="normal" class="radio_label" text="일반매입"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-wrhs2" name="srch-rdo-wrhs" uitype="normal" class="radio_label" text="공선"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-wrhs3" name="srch-rdo-wrhs" uitype="normal" class="radio_label" text="매취" checked/>
								</p>
							</td>
							<th scope="row" class="th_bg">상품구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds1" name="srch-rdo-gds" uitype="normal" class="radio_label" text="일반" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds2" name="srch-rdo-gds" uitype="normal" class="radio_label" text="GAP"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds3" name="srch-rdo-gds" uitype="normal" class="radio_label" text="무농약"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gds4" name="srch-rdo-gds" uitype="normal" class="radio_label" text="유기농"/>
								</p>
							</td>
							<th scope="row" class="th_bg">운송구분</th>
							<td colspan="3">
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-trsprt1" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="자가" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-trsprt2" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="용역"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-trsprt3" name="srch-rdo-trsprt" uitype="normal" class="radio_label" text="기타"/>
								</p>
							</td>
						</tr>
						<tr>
							<th class="ta_r th_bg">수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="srch-inp-qntt" name="srch-inp-qntt" class="form-control input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
									<sbux-input uitype="text" id="srch-inp-wght" name="srch-inp-wght" class="form-control input-sm" />
							</td>
							<td class="td_input" style="border-right: hidden;">
									<sbux-label uitype="normal" id="lbl-kg" name="lbl-chc" text="Kg"/>
							</td>
							<th class="ta_r th_bg">비고</th>
							<td colspan="3" class="td_input">
								<sbux-input uitype="text" id="srch-inp-rmrk" name="srch-inp-rmrk" class="form-control input-sm" placeholder="" />
							</td>
							<td colspan="4">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>원물입고 계획</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnInsert" name="btnInsert" uitype="button" class="btn btn-sm btn-outline-danger">등록</sbux-button>
						<sbux-button id="btnDelete" name="btnDelete" uitype="button" class="btn btn-sm btn-outline-danger">삭제</sbux-button>
						<sbux-button id="btnDwnld" name="btnDwnld" uitype="button" class="btn btn-sm btn-outline-danger">내려받기</sbux-button>
						<sbux-button id="btnUld" name="btnUld" uitype="button" class="btn btn-sm btn-outline-danger">올려받기</sbux-button>
					</div>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="inptCmndDsctnGridArea2" style="height:340px;"></div>
					</div>
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
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	var autoCompleteDataJson = [];
	var jsonComWarehouse = [];
	var jsonApcItem = [];
	var jsonApcVrty = [];

    var jsonDataPrdcr = [];
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid2();

		SBUxMethod.set("srch-dtp-strtCrtrYmd", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-endCrtrYmd", gfn_dateToYmd(new Date()));

		fn_initSBSelect();
		fn_getPrdcrs();
	});

	/**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', 	jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd), // 창고
		 	gfn_setApcItemSBSelect('dtl-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', 		jsonApcVrty, gv_selectedApcCd),	// 품종
		]);
	}

	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;	//SBUxMethod.get("srch-slt-itemCd");
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),	// 품종
		]);
	}

	var rawMtrWrhsPlan = [];; // 그리드를 담기위한 객체 선언

	function fn_createGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea2';
	    SBGridProperties.id = 'inptCmndDsctnList2';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList2';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    /* APC_CD
	    PLANNO
	            */
	    SBGridProperties.columns = [
	        {caption: ["계획일자"],		ref: 'planYmd',			type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["계획시간"],		ref: 'planHr',      	type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["품목"],			ref: 'itemNm',      	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품종"],			ref: 'vrtyNm',      	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["생산자"],		ref: 'PRDCR_NM',      	type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'gdsSeNm',      	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["입고구분"],		ref: 'wrhsSeNm',      	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["운송구분"],		ref: 'trsprtSeNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["창고구분"],		ref: 'warehouseSeCd',	type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["계획수량"],		ref: 'planQntt',      	type:'output',  width:'100px',    style:'text-align:rihht'},
	        {caption: ["계획중량"],		ref: 'planWght',      	type:'output',  width:'100px',    style:'text-align:rihht'},
	        {caption: ["비고"],			ref: 'rmrk',      		type:'output',  width:'380px',    style:'text-align:center'},
	        {caption: ["APC코드"],		ref: 'apcCd',   hidden: true},
	        {caption: ["계획번호"],		ref: 'planno',   hidden: true},
	        {caption: ["생산자코드"],	ref: 'prdcrCd',   hidden: true},
	        {caption: ["품목코드"],		ref: 'itemCd',   hidden: true},
	        {caption: ["품종코드"],		ref: 'vrtyCd',   hidden: true},
	        {caption: ["상품구분"],		ref: 'gdsSeCd',   hidden: true},
	        {caption: ["입고구분"],		ref: 'wrhsSeCd',   hidden: true},
	        {caption: ["운송구분"],		ref: 'trsprtSeCd',   hidden: true},
	        {caption: ["창고구분"],		ref: 'warehouseSeCd',   hidden: true},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}

	/*
	* 조회조건 생산자 팝업 관련 function
	* Start
	*/

	const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("srch-inp-prdcrCd", null);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
	}

	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			//SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}
	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
	}

	/*
	* 조회조건 생산자 팝업 관련 function
	* End
	*/



	/*
	* 상세 정보 생산자 팝업 관련 function
	* Start
	*/

	const fn_choicePrdcrDtl = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcrDtl);
	}


	/**
	 * @name fn_onKeyUpPrdcrNmDtl
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNmDtl = function(prdcrNm){
		 fn_clearPrdcrDtl();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('dtl-inp-prdcrNm', true);
    }

	const fn_setPrdcrDtl = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("dtl-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrNm", prdcr.prdcrNm);
			//SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcrDtl = function() {
		SBUxMethod.set("dtl-inp-prdcrCd", null);
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNmDtl(value, label, item) {
		SBUxMethod.set("dtl-inp-prdcrCd", value);
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
	}

	/*
	* 상세 정보 생산자 팝업 관련 function
	* End
	*/

</script>
</html>