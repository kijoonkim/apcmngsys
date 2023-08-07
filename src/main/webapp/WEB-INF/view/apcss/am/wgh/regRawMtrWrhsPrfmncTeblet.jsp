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
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCmndDocPckg" name="btnCmndDocPckg" uitype="button" class="btn btn-sm btn-primary">원물인식표</sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="button" class="btn btn-sm btn-outline-danger">초기화</sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger">조회</sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="button" class="btn btn-sm btn-outline-danger">저장</sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="button" class="btn btn-sm btn-outline-danger">삭제</sbux-button>
				</div>
			</div>

			<div></div>
			<div class="box-body">
				<!--[APC] START -->			
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 11%">
						<col style="width: 6%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 3%">
						<col style="width: 5%">
						<col style="width: 2%">
						<col style="width: 10%">
						<col style="width: 20%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">생산자</th>
							<td colspan="6" class="td_input"  style="border-right: hidden;">
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
							<td colspan="4">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-prdcrDefault" name="chk-prdcrDefault" uitype="normal" class="form-control input-sm" text="생산자 기본값 자동등록"/>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목 / 품종</th>
							<td colspan="2"class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" onchange="fn_onChangeSrchItemCd(this)" />
							</td>
							<td colspan="4"class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" class="form-control input-sm"/>
							<td colspan="2"class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-itemVrtyfxng" name="chk-itemVrtyfxng" uitype="normal" class="form-control input-sm" text="고정"/>
								</p>
							</td>
							<td colspan="4">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고일자</th>
							<td colspan="6"class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd" class="form-control pull-right input-sm"/>
							</td>
							<td colspan="4">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wrhsQntt" name="srch-inp-wrhsQntt" class="form-control input-sm"/>
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wrhsWght" name="srch-inp-wrhsWght" class="form-control input-sm"/>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsfxng" name="chk-wrhsfxng" uitype="normal" class="form-control input-sm" text="고정"/>
								</p>
							</td>
							<td style="border-right: hidden;">Kg</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-qnttAvg" name="srch-inp-qnttAvg" class="form-control input-sm"/>
							</td>
							<td colspan="4">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고구분</th>
							<td colspan="8" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-wrhsSe1" name="srch-rdo-wrhsSe" uitype="normal" class="radio_label" text="일반매입"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-wrhsSe2" name="srch-rdo-wrhsSe" uitype="normal" class="radio_label" text="공선"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-wrhsSe3" name="srch-rdo-wrhsSe" uitype="normal" class="radio_label" text="매취" checked/>
								</p>
							</td>
							<td colspan="4">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">상품구분</th>
							<td colspan="8" class="td_input"  style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gdsSe1" name="srch-rdo-gdsSe" uitype="normal" class="radio_label" text="일반" checked/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gdsSe2" name="srch-rdo-gdsSe" uitype="normal" class="radio_label" text="GAP"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gdsSe3" name="srch-rdo-gdsSe" uitype="normal" class="radio_label" text="무농약"/>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="srch-rdo-gdsSe4" name="srch-rdo-gdsSe" uitype="normal" class="radio_label" text="유기농"/>
								</p>
							</td>
							<td colspan="4">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" style="border-right: hidden;">운송구분</th>
							<td colspan="8" style="border-right: hidden;" class="td_input">
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
							<td colspan="4">&nbsp;</td>
						</tr>
	 					<tr>
						 	<th scope="row" class="th_bg">입고등급</th>
					 		<td class="td_input" style="border-right: hidden;">
					 			<sbux-select unselected-text="선택" uitype="single" id="srch-slt-wrhsRate" name="srch-slt-wrhsRate" class="form-control input-sm"/>
					 		</td>
					 		<td colspan="11">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">박스종류</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-boxKnd" name="srch-slt-boxKnd" class="form-control input-sm"/>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-boxKndFxng" name="chk-boxKndFxng" uitype="normal" class="form-control input-sm" text="고정"/>
								</p>
							</td>
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-wrhsWarehouse" name="srch-slt-wrhsWarehouse" class="form-control input-sm"/>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-whrsWarehouseFxng" name="chk-whrsWarehouseFxng" uitype="normal" class="form-control input-sm" text="고정"/>
								</p>
							</td>
							<td colspan="8">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>입고등록 내역</span></li>
					</ul>
				</div>

				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="inptCmndDsctnGridArea" style="height:300px;"></div>
					</div>
				</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>

	<!-- 생산자 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">


	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonApcGrd			= [];	// 등급 		vrtyCd		검색

    var jsonDataPrdcr = [];
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];
	
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
		]);
	}

    
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}
	
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-wrhsYmd", year+month+day);
		
		fn_initSBSelect();
		fn_getPrdcrs();
	});

	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'inptCmndDsctnList';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };


	    SBGridProperties.columns = [
	        {caption: ["입고일자"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["순번"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["생산자"],		ref: 'msgKey',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'msgKey',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["박스수량"],		ref: 'msgKey',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["중량"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["등급"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["박스종류"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["입고창고"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'msgKey',      type:'output',  width:'120px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);

	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
	
	/** ui event */
	
	const fn_onChangeApc = async function() {
		fn_clearPrdcr();
		fn_initSBSelect();
		fn_getPrdcrs();
	}
	
	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;	//SBUxMethod.get("srch-slt-itemCd");		
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),	// 품종
			//gfn_setApcGrdsSBSelect('srch-slt-grdCd', jsonApcGrd, gv_selectedApcCd, itemCd)		// 등급	
		]);
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
	
	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
	}
	
	/**
	 *
	 */
	const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}
	
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}
</script>
</html>