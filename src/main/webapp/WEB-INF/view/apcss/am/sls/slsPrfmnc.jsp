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
					<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSlipDlng" name="btnSlipDlng" uitype="normal" class="btn btn-sm btn-primary" text="거래명세표" onclick="fn_slipDlng"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
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
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>매출일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-slsYmdFrom" name="srch-dtp-slsYmdFrom" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-slsYmdTo" name="srch-dtp-slsYmdTo" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td></td>
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
							<th scope="row" class="th_bg">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="table-responsive tbl_scroll_sm">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>매출 내역</span></li>
						</ul>
					</div>
					<div class="ad_tbl_toplist">
					</div>
					<div class="table-responsive tbl_scroll_sm">
						<div id="sb-area-slsPrfmnc" style="height:600px;"></div>
					</div>
				</div>
			</div>
				<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonApcItem, 	gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonApcVrty, 	gv_selectedApcCd)	// 품종
		]);
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-slsYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-slsYmdTo", gfn_dateToYmd(new Date()));
		
		fn_createSlsPrfmncGrid();
		fn_initSBSelect();
	})

	function fn_createSlsPrfmncGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-slsPrfmnc';
	    SBGridProperties.id = 'grdSlsPrfmnc';
	    SBGridProperties.jsonref = 'jsonSlsPrfmnc';
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
            {caption: ['매출일자','매출일자'], 	ref: 'slsYmd',		width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['거래처','거래처'], 		ref: 'cnptNm', 		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['상품명','상품명'],		ref: 'gdsNm', 		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['상품코드','상품코드'],	ref: 'gdsCd', 		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['품종','품종'], 		ref: 'vrtyNm', 		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['규격','규격'], 		ref: 'spcfctNm',	width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['브랜드','브랜드'], 		ref: 'brndCd',		width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['출하일자','출하일자'], 	ref: 'spmtYmd', 	width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['단가','단가'], 		ref: 'slsUntprc', 	width: '15%', 	type: 'output',	style:'text-align: center'},
            {caption: ['출하','수량'], 		ref: 'qntt', 		width: '15%', 	type: 'output',	style:'text-align: right'},
            {caption: ['출하','중량'], 		ref: 'wght', 		width: '15%', 	type: 'output',	style:'text-align: right'},
            {caption: ['매출금액','매출금액'], 	ref: 'cfmtnAmt', 	width: '15%', 	type: 'output',	style:'text-align: right'}
        ];
        grdSlsPrfmnc = _SBGrid.create(SBGridProperties);
        grdSlsPrfmnc.bind( "afterpagechanged" , "fn_pagingSlsPrfmnc" );
    }
	
	// 출하지시 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdSlsPrfmnc.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdSlsPrfmnc.movePaging(currentPageNo);
    }
	
	let newJsonSlsPrfmnc = [];
	
	// 출하지시 목록 조회 호출
	async function fn_callSelectSlsPrfmncList(recordCountPerPage, currentPageNo){
		jsonSlsPrfmnc = [];
		let apcCd = gv_selectedApcCd;
		let slsYmdFrom = SBUxMethod.get("srch-dtp-slsYmdFrom");
		let slsYmdTo = SBUxMethod.get("srch-dtp-slsYmdTo");
		let cnptNm = SBUxMethod.get("srch-inp-cnptNm");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		if (gfn_isEmpty(slsYmdFrom)){
			gfn_comAlert("W0002", "매출일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(slsYmdTo)){
			gfn_comAlert("W0002", "매출일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		let SlsPrfmncVO = {apcCd 				: apcCd
						 , slsYmdFrom 			: slsYmdFrom
						 , slsYmdTo 			: slsYmdTo
						 , cnptNm 				: cnptNm
						 , itemCd 				: itemCd
						 , vrtyCd 				: vrtyCd
						 , pagingYn 			: 'Y'
						 , currentPageNo 		: currentPageNo
						 , recordCountPerPage 	: recordCountPerPage};
    	let postJsonPromise = gfn_postJSON("/am/sls/selectSlsPrfmncList.do", SlsPrfmncVO);
        let data = await postJsonPromise;
        newJsonSlsPrfmnc = [];
        try{
        	data.resultList.forEach((item, index) => {
				let slsPrfmnc = {
					slsYmd 		: item.slsYmd
				  , cnptNm 		: item.cnptNm
				  , gdsNm 		: item.gdsNm
				  , gdsCd 		: item.gdsCd
				  , vrtyNm 		: item.vrtyNm
				  , spcfctNm 	: item.spcfctNm
				  , brndCd		: item.brndCd
				  , spmtYmd 	: item.spmtYmd
				  , slsUntprc 	: item.slsUntprc
				  , qntt		: item.qntt
				  , wght 		: item.wght
				  , cfmtnAmt 	: item.cfmtnAmt
				  , totQntt		: item.totQntt
				  , totWght 	: item.totWght
				  , totCfmtnAmt : item.totCfmtnAmt
				}
				jsonSlsPrfmnc.push(Object.assign({}, slsPrfmnc));
				newJsonSlsPrfmnc.push(Object.assign({}, slsPrfmnc));
			});
        	if(jsonSlsPrfmnc.length > 0){
				if(grdSlsPrfmnc.getPageTotalCount() != data.resultList[0].totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdSlsPrfmnc.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdSlsPrfmnc.rebuild();
				}else{
					grdSlsPrfmnc.refresh();
				}
			}else{
				grdSlsPrfmnc.setPageTotalCount(0);
				grdSlsPrfmnc.rebuild();
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	
	// 페이징
    async function fn_pagingSlsPrfmnc(){
    	let recordCountPerPage = grdSlsPrfmnc.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdSlsPrfmnc.getSelectPageIndex(); 
    	fn_callSelectSlsPrfmncList(recordCountPerPage, currentPageNo);
    }
	
	// 거래명세표
    async function fn_slipDlng(){
    	
    }
	
	// APC 선택 변경
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_initSBSelect()
		]);
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
	
	// 거래처 선택 팝업 호출
	const fn_modalCnpt = function() {
    	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnpt"), fn_setCnpt);
	}
	
	const fn_setCnpt = function(cnpt) {
		if (!gfn_isEmpty(cnpt)) {
			console.log("cnpt", cnpt);
			SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
		}
	}
</script>
</html>