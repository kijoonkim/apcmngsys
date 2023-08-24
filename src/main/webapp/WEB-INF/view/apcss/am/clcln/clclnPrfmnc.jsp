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
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[APC] START -->			
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>정산기준</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-clclnCrtr" name="srch-slt-clclnCrtr" uitype="single" jsondata-ref="jsonComClclnCrtr" unselected-text="선택" class="form-control input-sm-ast inpt_data_reqed input-sm"></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>정산일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-clclnYmdFrom" name="srch-dtp-clclnYmdFrom" uitype="popup" class="form-control input-sm-ast input-sm"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-clclnYmdTo" name="srch-dtp-clclnYmdTo" uitype="popup" class="form-control input-sm-ast input-sm"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">확정여부</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-cfmtnYn" name="srch-slt-cfmtnYn" uitype="single" jsondata-ref="jsonCfmtnYn" unselected-text="선택" class="form-control input-sm""></sbux-select>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcItem"
									onchange="fn_onChangeSrchItemCd(this)"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm"
									jsondata-ref="jsonApcVrty"
									onchange="fn_onChangeSrchVrtyCd(this)"
								/>
							</td>
							<td></td>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
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
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>정산 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-clclnPrfmnc" style="width:100%;height:550px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComClclnCrtr	= [];	// 정산기준 	clclnCrtr	검색
	var jsonCfmtnYn			= [];	// 확정여부 	cfmtnYn		검색
	
	var jsonClclnPrfmnc		= [];

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonApcItem, 	gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonApcVrty, 	gv_selectedApcCd),	// 품종
			setCfmtnYnSBSelect('srch-slt-cfmtnYn', jsonCfmtnYn),
			gfn_setComCdSBSelect('srch-slt-clclnCrtr', jsonComClclnCrtr, 'CLCLN_CRTR', gv_selectedApcCd)	// 정산기준
		]);
	}
	
	/**
	 * @name fn_getPrdcrs
     * @description 생산자 자동완성 JSON 설정
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-clclnYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-clclnYmdTo", gfn_dateToYmd(new Date()));
		
		fn_createClclnPrfmncGrid();
		fn_initSBSelect();
	})
	
	function fn_createClclnPrfmncGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-clclnPrfmnc';
	    SBGridProperties.id = 'grdClclnPrfmnc';
	    SBGridProperties.jsonref = 'jsonClclnPrfmnc';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';
    	SBGridProperties.paging = {
    			'type' : 'page',
    		  	'count' : 5,
    		  	'size' : 20,
    		  	'sorttype' : 'page',
    		  	'showgoalpageui' : true
    	    };
        SBGridProperties.columns = [
        	{caption: ['정산일자'], 	ref: 'clclnYmd', 	width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['생산자'], 	ref: 'prdcrNm', 	width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['입고구분'], 	ref: 'wrhsSe', 		width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['상품구분'], 	ref: 'gdsSe', 		width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['품목'], 		ref: 'itemNm', 		width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['품종'], 		ref: 'vrtyNm', 		width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 	width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['브랜드'], 	ref: 'brndCd', 		width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['등급'], 		ref: 'grdCd', 		width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['수량'], 		ref: 'qntt', 		width: '100px', 	type: 'output',		style:'text-align: right'},
            {caption: ['중량'], 		ref: 'wght', 		width: '100px', 	type: 'output',		style:'text-align: right'},
            {caption: ['계산금액'], 	ref: 'rkngAmt', 	width: '100px', 	type: 'output',		style:'text-align: right'},
            {caption: ['확정금액'], 	ref: 'cfmtnAmt', 	width: '100px', 	type: 'output',		style:'text-align: right'}
        ];
        grdClclnPrfmnc = _SBGrid.create(SBGridProperties);
        grdClclnPrfmnc.bind( "afterpagechanged" , "fn_pagingClclnPrfmnc" );
    }
	
	// 확정여부 콤보박스 (검색 조건)
	async function setCfmtnYnSBSelect(_targetIds, _jsondataRef) {
		let sourceJson = [{cmnsNm: "Y", cmnsCd: "Y"}, {cmnsNm: "N", cmnsCd: "N"}];
		gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
	}
	
	// 출하지시 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdClclnPrfmnc.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdClclnPrfmnc.movePaging(currentPageNo);
    }
	
	let newJsonClclnPrfmnc = [];
	
	// 출하지시 목록 조회 호출
	async function fn_callSelectClclnPrfmncList(recordCountPerPage, currentPageNo){
		jsonClclnPrfmnc = [];
		let apcCd = gv_selectedApcCd;
		let clclnCrtr = SBUxMethod.get("srch-slt-clclnCrtr");
		let clclnYmdFrom = SBUxMethod.get("srch-dtp-clclnYmdFrom");
		let clclnYmdTo = SBUxMethod.get("srch-dtp-clclnYmdTo");
		let cfmtnYn = SBUxMethod.get("srch-slt-cfmtnYn");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		if (gfn_isEmpty(clclnCrtr)){
			gfn_comAlert("W0002", "정산기준");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(clclnYmdFrom)){
			gfn_comAlert("W0002", "정산일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(clclnYmdTo)){
			gfn_comAlert("W0002", "정산일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		let ClclnPrfmncVO = {apcCd 					: apcCd
						   , clclnYmdFrom 			: clclnYmdFrom
						   , clclnYmdTo 			: clclnYmdTo
						   , clclnCrtr 				: clclnCrtr
						   , cfmtnYn 				: cfmtnYn
						   , itemCd 				: itemCd
						   , vrtyCd 				: vrtyCd
						   , prdcrCd 				: prdcrCd
						   , pagingYn 				: 'Y'
						   , currentPageNo 			: currentPageNo
						   , recordCountPerPage 	: recordCountPerPage};
    	let postJsonPromise = gfn_postJSON("/am/clcln/selectClclnPrfmncList.do", ClclnPrfmncVO);
        let data = await postJsonPromise;
        newJsonClclnPrfmnc = [];
        try{
        	data.resultList.forEach((item, index) => {
				let clclnPrfmnc = {
					clclnYmd 	: item.clclnYmd
				  , prdcrNm 	: item.prdcrNm
				  , wrhsSe 		: item.wrhsSe
				  , gdsSe 		: item.gdsSe
				  , itemNm 		: item.itemNm
				  , vrtyNm		: item.vrtyNm
				  , spcfctNm 	: item.spcfctNm
				  , brndCd 		: item.brndCd
				  , grdCd 		: item.grdCd
				  , qntt		: item.qntt
				  , wght		: item.wght
				  , rkngAmt		: item.rkngAmt
				  , cfmtnAmt	: item.cfmtnAmt
				  , totQntt		: item.totQntt
				  , totWght		: item.totWght
				  , totRkngAmt	: item.totRkngAmt
				  , totCfmtnAmt	: item.totCfmtnAmt
				}
				jsonClclnPrfmnc.push(Object.assign({}, clclnPrfmnc));
				newJsonClclnPrfmnc.push(Object.assign({}, clclnPrfmnc));
			});
        	if(jsonClclnPrfmnc.length > 0){
				if(grdClclnPrfmnc.getPageTotalCount() != data.resultList[0].totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdClclnPrfmnc.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdClclnPrfmnc.rebuild();
				}else{
					grdClclnPrfmnc.refresh();
				}
			}else{
				grdClclnPrfmnc.setPageTotalCount(0);
				grdClclnPrfmnc.rebuild();
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	
	// 페이징
    async function fn_pagingClclnPrfmnc(){
    	let recordCountPerPage = grdClclnPrfmnc.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdClclnPrfmnc.getSelectPageIndex(); 
    	fn_callSelectClclnPrfmncList(recordCountPerPage, currentPageNo);
    }
	
	// APC 선택 변경
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
		let itemCd = obj.value;

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),			// 품종
		]);
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		const itemCd = _.find(jsonApcVrty, {value: vrtyCd}).mastervalue;

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
	}
	
	/*
	*
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
		SBUxMethod.set("srch-inp-prdcrCd", "");
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