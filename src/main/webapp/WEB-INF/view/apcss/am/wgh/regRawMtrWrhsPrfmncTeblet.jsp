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
					<sbux-button id="btnSave" name="btnSave" uitype="button" class="btn btn-sm btn-outline-danger" onclick="fn_RawMtrWrhsPrmncSave()">저장</sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="button" class="btn btn-sm btn-outline-danger">삭제</sbux-button>
				</div>
			</div>

			<div></div>
			<div class="box-body">
				<!--[APC] START -->			
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="dtl-inp-prdcrCd" name="dtl-inp-prdcrCd" uitype="hidden"></sbux-input>
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
							<td colspan="6" class="td_input" style="border-right: hidden;">
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
							<td colspan="4">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-prdcrDefault" name="chk-prdcrDefault" uitype="normal" class="form-control input-sm" text="생산자 기본값 자동등록"/>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td colspan="2"class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-itemCd" name="dtl-slt-itemCd" uitype="single" jsondata-ref="jsonApcItem" unselected-text="전체" class="form-control input-sm" onchange="fn_onChangeSrchItemCd(this)" ></sbux-select>
							</td>
							<td colspan="4"class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-vrtyCd" name="dtl-slt-vrtyCd" uitype="single" jsondata-ref="jsonApcVrty" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
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
							<td colspan="6" style="border-left: hidden;">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고수량/중량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wrhsQntt" name="srch-inp-wrhsQntt" class="form-control input-sm" onchange="fn_onChangeWrhsQntt()"/>
							</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-wrhsWght" name="srch-inp-wrhsWght" class="form-control input-sm" onchange="fn_onChangeWrhsWght()"/>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox uitype="normal"id="chk-wrhsfxng" name="chk-wrhsfxng" uitype="normal" class="form-control input-sm" text="고정"/>
								</p>
							</td>
							<td style="border-right: hidden;">Kg</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-qnttAvg" name="srch-inp-qnttAvg" class="form-control input-sm" onchange="fn_onChangeQnttAvg()"/>
							</td>
							<td colspan="4">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고구분</th>
							<td colspan="8" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-wrhsSeCd_1" name="dtl-rdo-wrhsSeCd" uitype="normal" class="radio_label" value="1"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-wrhsSeCd_1" text="일반"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-wrhsSeCd_2" name="dtl-rdo-wrhsSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-wrhsSeCd_2" text="매취"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-wrhsSeCd_3" name="dtl-rdo-wrhsSeCd" uitype="normal" class="radio_label" value="3" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-wrhsSeCd_3" text="수탁"></sbux-label>
								</p>
							</td>
							<td colspan="4">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">상품구분</th>
							<td colspan="8" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-radio
										id="dtl-rdo-gdsSeCd"
										name="dtl-rdo-gdsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonGdsSeCd">
									</sbux-radio>
								</p>
							</td>
							<td colspan="4">&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" style="border-right: hidden;">운송구분</th>
							<td colspan="8" class="td_input" >
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-trsprtSeCd_1" name="dtl-rdo-trsprtSeCd" uitype="normal" class="radio_label" value="1" checked></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-trsprtSeCd_1" text="자가"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-trsprtSeCd_2" name="dtl-rdo-trsprtSeCd" uitype="normal" class="radio_label" value="2"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-trsprtSeCd_2" text="용역"></sbux-label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="dtl-rdo-trsprtSeCd_3" name="dtl-rdo-trsprtSeCd" uitype="normal" class="radio_label" value="3"></sbux-radio>
									<sbux-label class="radio_label" for-id="dtl-rdo-trsprtSeCd_3" text="기타"></sbux-label>
								</p>
							</td>
							<td colspan="4" style="border-left:hidden;">&nbsp;</td>
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
								<sbux-select unselected-text="선택" uitype="single" id="dtl-slt-warehouseSeCd" name="dtl-slt-warehouseSeCd" class="form-control input-sm"/>
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
	
    var jsonDataPrdcr = [];
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];
    var jsonGdsSeCd			= [];	// 상품구분
    
    /**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
			gfn_setComCdSBSelect('dtl-rdo-gdsSeCd', jsonGdsSeCd, 'GDS_SE_CD', gv_selectedApcCd),			// 상품구분
		 	gfn_setApcItemSBSelect('dtl-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
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
	    SBGridProperties.scrollbubbling = false;
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
			SBUxMethod.set("dtl-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
			
			// 품목/품종 set
			SBUxMethod.set("dtl-slt-itemCd", prdcr.rprsItemCd);
			SBUxMethod.set("dtl-slt-vrtyCd", prdcr.rprsVrtyCd);

			
			// 입고/상품/운송 구분 set
			SBUxMethod.set("dtl-rdo-wrhsSeCd", prdcr.wrhsSeCd);
			SBUxMethod.set("dtl-rdo-gdsSeCd", prdcr.gdsSeCd);
			SBUxMethod.set("dtl-rdo-trsprtSeCd", prdcr.trsprtSeCd);
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
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),	// 품종
			//gfn_setApcGrdsSBSelect('srch-slt-grdCd', jsonApcGrd, gv_selectedApcCd, itemCd)		// 등급	
		]);
	}
	
	
	


	var latestChangedElement = null;
	function fn_onChangeWrhsQntt(){
		// 입고중량/ 평균중량 둘 다 값이 존재할 경우 가장 최근에 변경된 값을 기준으로 계산함. ex) 마지막으로 사용자가 평균중량을 입력했을 경우 총 중량을 자동 설정
		if (latestChangedElement == null || gfn_isEmpty(SBUxMethod.get("srch-inp-wrhsQntt")) || SBUxMethod.get("srch-inp-wrhsQntt") == 0)
			return;
		
		if (latestChangedElement == "srch-inp-wrhsWght")
			SBUxMethod.set("srch-inp-qnttAvg", Math.round(gfn_isEmpty(SBUxMethod.get("srch-inp-wrhsWght")) ? 0 : SBUxMethod.get("srch-inp-wrhsWght") / SBUxMethod.get("srch-inp-wrhsQntt")));
		
		else if (latestChangedElement == "srch-inp-qnttAvg")
			SBUxMethod.set("srch-inp-wrhsWght", gfn_isEmpty(SBUxMethod.get("srch-inp-qnttAvg")) ? 0 : SBUxMethod.get("srch-inp-qnttAvg") * SBUxMethod.get("srch-inp-wrhsQntt"));
	}
	
	function fn_onChangeWrhsWght(){
		if (gfn_isEmpty(SBUxMethod.get("srch-inp-wrhsQntt")) || SBUxMethod.get("srch-inp-wrhsQntt") == 0)
			return;
		
		SBUxMethod.set("srch-inp-qnttAvg", Math.round(gfn_isEmpty(SBUxMethod.get("srch-inp-wrhsWght")) ? 0 : SBUxMethod.get("srch-inp-wrhsWght") / SBUxMethod.get("srch-inp-wrhsQntt")));
		latestChangedElement = "srch-inp-wrhsWght";
	}
	
	function fn_onChangeQnttAvg(){
		if (gfn_isEmpty(SBUxMethod.get("srch-inp-wrhsQntt")) || SBUxMethod.get("srch-inp-wrhsQntt") == 0)
			return;
		
		SBUxMethod.set("srch-inp-wrhsWght", gfn_isEmpty(SBUxMethod.get("srch-inp-qnttAvg")) ? 0 : SBUxMethod.get("srch-inp-qnttAvg") * SBUxMethod.get("srch-inp-wrhsQntt"));
		latestChangedElement = "srch-inp-qnttAvg";
	}
	
	function fn_RawMtrWrhsPrmncSave(){
	   try{
		   if (gfn_isEmpty(SBUxMethod.get("dtl-inp-prdcrNm")))
				   throw "생산자는 필수입력 항목입니다.";
		   if (gfn_isEmpty(SBUxMethod.get("dtl-slt-vrtyCd")))
				   throw "품종은 필수입력 항목입니다.";
		   if (gfn_isEmpty(SBUxMethod.get("srch-dtp-wrhsYmd")))
				   throw "입고일자는 필수입력 항목입니다.";
		   if (gfn_isEmpty(SBUxMethod.get("srch-inp-qnttAvg")))
				   throw "단중은 필수입력 항목입니다.";
		   if (gfn_isEmpty(SBUxMethod.get("dtl-rdo-wrhsSeCd")))
				   throw "입고구분은 필수입력 항목입니다.";
		   if (gfn_isEmpty(SBUxMethod.get("dtl-rdo-gdsSeCd")))
				   throw "상품구분은 필수입력 항목입니다.";
		   if (gfn_isEmpty(SBUxMethod.get("dtl-rdo-trsprtSeCd")))
				   throw "운송구분은 필수입력 항목입니다.";
	   } catch(e){
		   alert(e);
		   return;
	   }
	}


</script>
</html>