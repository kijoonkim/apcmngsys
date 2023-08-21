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
							<th scope="row" class="th_bg">창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComWarehouse"></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>출하일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-spmtYmdFrom" name="srch-dtp-spmtYmdFrom" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-spmtYmdTo" name="srch-dtp-spmtYmdTo" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg" style="border-right: hidden;">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" class="form-control input-sm" uitype="text"></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"></sbux-button>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" style="border-right: hidden;">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" class="form-control input-sm"></sbux-input>
								<sbux-input id="srch-inp-cnptCd" name="srch-inp-cnptCd" uitype="hidden" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<th scope="row" class="th_bg">배송지</th>
							<td colspan="2" class="td_input" style="border-right: hidden;" >
								<sbux-input id="srch-inp-dldtn" name="srch-inp-dldtn" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td></td>
							<th scope="row" class="th_bg">운송사</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-trsprtCo" name="srch-slt-trsprtCo" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComTrsprtCo"></sbux-select>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vhclno" name="srch-inp-vhclno" uitype="text" class="form-control pull-right input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVhclNo" name="btnSrchVhclNo" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_choiceVhcl"></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>출하 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtPrfmnc" style="height:600px;"></div>
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
        <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" header-is-close-button="false" style="width:650px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonSpmtPrfmnc		= [];
	var vrtyList = [];
	
	var jsonComItem			= [];	// 품목
	var jsonComVrty			= [];	// 품종
	var jsonComWarehouse	= [];	// 창고
	var jsonComTrsprtCo		= [];	// 운송사

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
		 	gfn_setTrsprtsSBSelect('srch-slt-trsprtCo', 	jsonComTrsprtCo, 	gv_selectedApcCd),		// 운송사
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),		// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_selectedApcCd)		// 품종
		]);
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-spmtYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-spmtYmdTo", gfn_dateToYmd(new Date()));

		fn_createSpmtPrfmncGrid();
        fn_search();
		fn_initSBSelect();
	})

	function fn_createSpmtPrfmncGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtPrfmnc';
	    SBGridProperties.id = 'grdSpmtPrfmnc';
	    SBGridProperties.jsonref = 'jsonSpmtPrfmnc';
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
            {caption: ['출하일자','출하일자'], 	ref: 'spmtYmd',		width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['상품명','상품명'], 		ref: 'gdsNm', 		width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['품종','품종'],			ref: 'vrtyNm', 		width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['규격','규격'], 		ref: 'spcfctNm', 	width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['브랜드','브랜드'], 		ref: 'brndCd', 		width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['거래처','거래처'], 		ref: 'cnptNm', 		width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['배송지','배송지'], 		ref: 'dldtn', 		width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['운송사','운송사'], 		ref: 'trsprtCoNm', 	width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['차량번호','차량번호'], 	ref: 'vhclno',		width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['운반비','운반비'], 		ref: 'trsprtCst', 	width: '15%',	type: 'output',	style:'text-align: center'},
            {caption: ['출하','수량'], 		ref: 'spmtQntt', 	width: '15%',	type: 'output',	style:'text-align: right'},
            {caption: ['출하','중량'], 		ref: 'spmtWght', 	width: '15%',	type: 'output',	style:'text-align: right'}
        ];
        grdSpmtPrfmnc = _SBGrid.create(SBGridProperties);
        grdSpmtPrfmnc.bind( "afterpagechanged" , "fn_pagingSmptPrfmnc" );
    }

	// 출하실적 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdSpmtPrfmnc.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdSpmtPrfmnc.movePaging(currentPageNo);
    }
	
	let newJsonSpmtPrfmnc = [];
	
	// 출하실적 목록 조회 호출
	async function fn_callSelectSpmtPrfmncList(recordCountPerPage, currentPageNo){
		jsonSpmtPrfmnc = [];
		let searchList = [];
		let apcCd = gv_selectedApcCd;
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
		let spmtYmdFrom = SBUxMethod.get("srch-dtp-spmtYmdFrom");
		let spmtYmdTo = SBUxMethod.get("srch-dtp-spmtYmdTo");
		let cnptCd = SBUxMethod.get("srch-inp-cnptCd");
		let trsprtCoCd = SBUxMethod.get("srch-slt-trsprtCo");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");
		let dldtn = SBUxMethod.get("srch-inp-dldtn");
		let vhclno = SBUxMethod.get("srch-inp-vhclno");
		let SpmtPrfmncVO = {apcCd 				: apcCd
						  , spmtYmdFrom 		: spmtYmdFrom
						  , spmtYmdTo 			: spmtYmdTo
						  , cnptCd 				: cnptCd
						  , trsprtCoCd 			: trsprtCoCd
						  , itemCd 				: itemCd
						  , vrtyCd 				: vrtyCd
						  , warehouseSeCd 		: warehouseSeCd
						  , dldtn 				: dldtn
						  , vhclno 				: vhclno
						  , pagingYn 			: 'Y'
						  , currentPageNo 		: currentPageNo
						  , recordCountPerPage 	: recordCountPerPage};
// 		if (vrtyList.length != 0) {
// 			for (var i=0; i<vrtyList.length; i++){
// 				var spmtPrfmnc = SpmtPrfmncVO
// 				spmtPrfmnc.setVrtyCd(vrtyList[i]);
// 				searchList.push(Object.assign({}, spmtPrfmnc));
// 			}
// 		} else {
// 			searchList.push(Object.assign({}, SpmtPrfmncVO));
// 		}
		searchList.push(Object.assign({}, SpmtPrfmncVO));
		console.log("searchList: ", searchList);
    	let postJsonPromise = gfn_postJSON("/am/spmt/searchSpmtPrfmncList.do", searchList);
        let data = await postJsonPromise;
        newJsonSpmtPrfmnc = [];
        try{
        	data.resultList.forEach((item, index) => {
				let spmtPrfmnc = {
					spmtYmd 		: item.spmtYmd
				  , gdsNm 			: item.gdsNm
				  , vrtyNm 			: item.vrtyNm
				  , spcfctNm 		: item.spcfctNm
				  , brndCd 			: item.brndCd
				  , cnptNm 			: item.cnptNm
				  , dldtn 			: item.dldtn
				  , trsprtCoNm 		: item.trsprtCoNm
				  , vhclno 			: item.vhclno
				  , trsprtCst 		: item.trsprtCst
				  , spmtQntt		: item.spmtQntt
				  , spmtWght 		: item.spmtWght
				}
				jsonSpmtPrfmnc.push(Object.assign({}, spmtPrfmnc));
				newJsonSpmtPrfmnc.push(Object.assign({}, spmtPrfmnc));
			});
        	if(jsonSpmtPrfmnc.length > 0){
				if(grdSpmtPrfmnc.getPageTotalCount() != data.resultList[0].totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdSpmtPrfmnc.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdSpmtPrfmnc.rebuild();
				}else{
					grdSpmtPrfmnc.refresh();
				}
			}else{
				grdSpmtPrfmnc.setPageTotalCount(0);
				grdSpmtPrfmnc.rebuild();
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	
	// 페이징
    async function fn_pagingSmptPrfmnc(){
    	let recordCountPerPage = grdSpmtPrfmnc.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdSpmtPrfmnc.getSelectPageIndex(); 
    	fn_callSelectSpmtPrfmncList(recordCountPerPage, currentPageNo);
    }

	// APC 선택 변경
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_initSBSelect()
		]);
	}
	
	// 품종 선택 팝업 호출
	const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

	const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			console.log("vrty", vrty);
			vrtyList = [];
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
		}
	}
	
	const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			vrtyList = [];
	 		SBUxMethod.set("srch-inp-vrtyCd", null);
			for(var i=0;i<vrtys.length;i++){
				_vrtys.push(vrtys[i].vrtyNm);
				vrtyList.push(vrtys[i].vrtyCd);
			}
			SBUxMethod.set('srch-inp-vrtyNm', _vrtys.join(','));
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
			SBUxMethod.set('srch-inp-cnptCd', cnpt.cnptCd);
		}
	}
	
	// 차량 선택 팝업 호출
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl);
	}

	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("srch-inp-vhclno", vhcl.vhclno);   // callBack input
		}
	}
</script>
</html>