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
					<sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_reset" text="초기화" ></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_search" text="조회" ></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_save" text="저장" ></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" onclick="fn_delete" text="삭제" ></sbux-button>
				</div>
			</div>

			<div></div>
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
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 2%">
						<col style="width: 3%">
						<col style="width: 5%">
						<col style="width: 2%">
						<col style="width: 10%">
						<col style="width: 23%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>생산자</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 기능입니다."
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
   								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
							<td colspan="3">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-prdcrDefault" name="chk-prdcrDefault" uitype="normal" class="form-control input-sm" text="생산자 기본값 자동등록"/>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
							<td colspan="2"class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" jsondata-ref="jsonApcItem" unselected-text="전체" class="form-control input-sm input-sm-ast inpt_data_reqed" onchange="fn_onChangeSrchItemCd(this)" ></sbux-select>
							</td>
							<td colspan="4"class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" jsondata-ref="jsonApcVrty" unselected-text="선택" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-select>
							</td>
							<td colspan="2"class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-itemVrtyfxng" name="chk-itemVrtyfxng" uitype="normal" class="form-control input-sm" text="고정"/>
								</p>
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
							<td colspan="6"class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd" class="form-control pull-right input-sm"/>
							</td>
							<td colspan="5" style="border-left: hidden;">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wrhsQntt" name="srch-inp-wrhsQntt" class="form-control input-sm input-sm-ast inpt_data_reqed" onchange="fn_onChangeWghtAvg()"/>
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wghtAvg" name="srch-inp-wghtAvg" class="form-control input-sm" placeholder="평균" onchange="fn_onChangeWghtAvg()"/>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsfxng" name="chk-wrhsfxng" uitype="normal" class="form-control input-sm" text="고정"/>
								</p>
							</td>
							<td style="border-right: hidden;">Kg</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wrhsWght" name="srch-inp-wrhsWght" class="form-control input-sm input-sm-ast inpt_data_reqed"/>
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>입고구분</th>
							<td colspan="8" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-wrhsSeCd_1" name="srch-rdo-wrhsSeCd" uitype="normal" class="radio_label" value="1"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-wrhsSeCd_1" text="일반"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-wrhsSeCd_2" name="srch-rdo-wrhsSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-wrhsSeCd_2" text="매취"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-wrhsSeCd_3" name="srch-rdo-wrhsSeCd" uitype="normal" class="radio_label" value="3" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-wrhsSeCd_3" text="수탁"></sbux-label>
								</p>
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>상품구분</th>
							<td colspan="8" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-radio
										id="srch-rdo-gdsSeCd"
										name="srch-rdo-gdsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonGdsSeCd">
									</sbux-radio>
								</p>
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" style="border-right: hidden;"><span class="data_required"></span>운송구분</th>
							<td colspan="8" class="td_input" >
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-trsprtSeCd_1" name="srch-rdo-trsprtSeCd" uitype="normal" class="radio_label" value="1" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-trsprtSeCd_1" text="자가"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-trsprtSeCd_2" name="srch-rdo-trsprtSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-trsprtSeCd_2" text="용역"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-trsprtSeCd_3" name="srch-rdo-trsprtSeCd" uitype="normal" class="radio_label" value="3"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-trsprtSeCd_3" text="기타"></sbux-label>
								</p>
							</td>
							<td colspan="3" style="border-left:hidden;">&nbsp;</td>
						</tr>
	 					<tr>
						 	<th scope="row" class="th_bg">입고등급</th>
					 		<td class="td_input" style="border-right: hidden;">
					 			<sbux-select unselected-text="선택" uitype="single" id="srch-slt-grdCd" name="srch-slt-grdCd" class="form-control input-sm" jsondata-ref="jsonApcGrd"/>
					 		</td>
					 		<td colspan="10">&nbsp;</td>
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
							<td colspan="7">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm" jsondata-ref="jsonComWarehouse"/>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-whrsWarehouseFxng" name="chk-whrsWarehouseFxng" uitype="normal" class="form-control input-sm" text="고정"/>
								</p>
							</td>
							<td colspan="7">&nbsp;</td>
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
						<div id="inptCmndDsctnGridArea" style="height:233px;"></div>
					</div>
				</div>
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
	var jsonComWarehouse	= [];	// 창고 		warehouse	검색
    var jsonGdsSeCd			= [];	// 상품구분

    var jsonPrdcr				= [];
    var jsonPrdcrAutocomplete 	= [];
    
    /**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
			gfn_setComCdSBSelect('srch-rdo-gdsSeCd', jsonGdsSeCd, 'GDS_SE_CD', gv_selectedApcCd),			// 상품구분
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
		]);
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
		fn_search();
	});

	var grdRawMtrWrhs; // 그리드를 담기위한 객체 선언
	var jsonRawMtrWrhs = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'grdRawMtrWrhs';
	    SBGridProperties.jsonref = 'jsonRawMtrWrhs';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };


	    SBGridProperties.columns = [
	        {caption: ["입고일자"],		ref: 'wrhsYmd',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["순번"],		ref: 'rowSeq',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["생산자"],		ref: 'prdcrNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'vrtyNm',      type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'gdsSeNm',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["박스수량"],		ref: 'bxQntt',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["중량"],		ref: 'wrhsWght',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["등급"],		ref: 'grdNm',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["박스종류"],		ref: 'bxKndNm',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["입고창고"],		ref: 'warehouseSeNm',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'rmrk',      type:'output',  width:'120px',    style:'text-align:center'},
	    ];

	    grdRawMtrWrhs = _SBGrid.create(SBGridProperties);

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
	/*
	* @name fn_getPrdcrs
	* @description 생산자 자동완성 목록 가져오기
	*/
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}
	
	/**
	* @name fn_onKeyUpPrdcrNm
	* @description 생산자명 입력 시 event : autocomplete
	*/
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm) > 100){
			SBUxMethod.set("srch-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
	}
	
	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		// 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
		if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
			document.getElementById('btn-srch-prdcr').click();
		}
		else{
			SBUxMethod.set("srch-inp-prdcrCd", value);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}
	
	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 찾기 버튼 클릭
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 모달 선택 콜백 callback
	 */
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			// 생산자 set
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
			
			// 품목/품종 set
			SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
			SBUxMethod.set("srch-slt-vrtyCd", prdcr.rprsVrtyCd);

			
			// 입고/상품/운송 구분 set
			SBUxMethod.set("srch-rdo-wrhsSeCd", prdcr.wrhsSeCd);
			SBUxMethod.set("srch-rdo-gdsSeCd", prdcr.gdsSeCd);
			SBUxMethod.set("srch-rdo-trsprtSeCd", prdcr.trsprtSeCd);
			
			let itemCd = SBUxMethod.get("srch-slt-itemCd");	
			gfn_setApcGrdsSBSelect('srch-slt-grdCd', jsonApcGrd, gv_selectedApcCd, itemCd)		// 등급	
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
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;	//SBUxMethod.get("srch-slt-itemCd");		
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),	// 품종
			gfn_setApcGrdsSBSelect('srch-slt-grdCd', jsonApcGrd, gv_selectedApcCd, itemCd)		// 등급	
		]);
	}
	

	function fn_onChangeWrhsQntt(){
		if (latestChangedElement == null || gfn_isEmpty(SBUxMethod.get("srch-inp-wrhsQntt")) || SBUxMethod.get("srch-inp-wrhsQntt") == 0)
			return;
		
		SBUxMethod.set("srch-inp-wrhsWght", gfn_isEmpty(SBUxMethod.get("srch-inp-wrhsQntt")) ? 0 : Number(SBUxMethod.get("srch-inp-wrhsQntt")) * Number(SBUxMethod.get("srch-inp-wghtAvg")));
	}
	
	function fn_onChangeWghtAvg(){
		if (gfn_isEmpty(SBUxMethod.get("srch-inp-wrhsQntt")) || SBUxMethod.get("srch-inp-wrhsQntt") == 0)
			return;
		
		SBUxMethod.set("srch-inp-wrhsWght", gfn_isEmpty(SBUxMethod.get("srch-inp-wrhsQntt")) ? 0 : Number(SBUxMethod.get("srch-inp-wrhsQntt")) * Number(SBUxMethod.get("srch-inp-wghtAvg")));
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
 		let bxQntt = SBUxMethod.get("srch-inp-wrhsQntt");			// 수량
 		let wrhsWght = SBUxMethod.get("srch-inp-wrhsWght");		// 중량
 		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");	// 창고
 		let grdCd = SBUxMethod.get("srch-slt-grdCd");			// 등급

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

//     	if (gfn_isEmpty(warehouseSeCd)) {
//     		gfn_comAlert("W0001", "창고");		//	W0002	{0}을/를 선택하세요.
//             return;
//     	}
//     	if (gfn_isEmpty(grdCd)) {
//     		gfn_comAlert("W0001", "등급");		//	W0002	{0}을/를 선택하세요.
//             return;
//     	}

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
   			wrhsWght: wrhsWght,
   			warehouseSeCd: warehouseSeCd,
   			grdCd: grdCd
    	}


    	let postUrl = "/am/wrhs/insertRawMtrWrhs.do";

    	const postJsonPromise = gfn_postJSON(postUrl, rawMtrWrhs);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
//         		fn_inputClear();
        		fn_search();
        	} else {
        		//alert(data.resultMessage);
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        }

	}
	
    /**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
        // set pagination
    	grdRawMtrWrhs.rebuild();
    	let pageSize = grdRawMtrWrhs.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonRawMtrWrhs.length = 0;
    	grdRawMtrWrhs.clearStatus();
    	fn_setGrdRawMtrWrhs(pageSize, pageNo);

		SBUxMethod.set("lbl-wrhsno", "");
		SBUxMethod.set("srch-inp-wrhsno", "");
	}

    /**
     * @name fn_setGrdRawMtrWrhs
     * @description 입고내역 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdRawMtrWrhs = async function(pageSize, pageNo) {

   		let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");		// 입고일자
//   		let wrhsSeCd = SBUxMethod.get("srch-rdo-wrhsSeCd");		// 입고구분
//   		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");		// 상품구분
//   		let trsprtSeCd = SBUxMethod.get("srch-rdo-trsprtSeCd");	// 운송구분

  		// optional
  		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");	// 생산자

  		let itemCd = SBUxMethod.get("srch-slt-itemCd");	// 품목
  		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");	// 품종

		const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsList.do", {
			apcCd: gv_selectedApcCd,
			wrhsYmd: wrhsYmd,
// 			wrhsSeCd: wrhsSeCd,
// 			gdsSeCd: gdsSeCd,
// 			trsprtSeCd: trsprtSeCd,
			prdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,

          	// pagination
  	  		pagingYn : 'N',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        const data = await postJsonPromise;

  		try {

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
  						rmrk: item.rmrk
  				}
  				jsonRawMtrWrhs.push(rawMtrWrhs);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	if (jsonRawMtrWrhs.length > 0) {
          		if(grdRawMtrWrhs.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdRawMtrWrhs.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdRawMtrWrhs.rebuild();
  				}else{
  					grdRawMtrWrhs.refresh();
  				}
          	} else {
          		grdRawMtrWrhs.setPageTotalCount(totalRecordCount);
          		grdRawMtrWrhs.rebuild();
          	}

          	document.querySelector('#listCount').innerText = totalRecordCount;

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
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


</script>
</html>