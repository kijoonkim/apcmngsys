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
					<sbux-button id="btnCmndDocSpmt" name="btnCmndDocSpmt" uitype="normal" class="btn btn-sm btn-primary" text="출하지시서" onclick="fn_cmndDocSpmt"></sbux-button>
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
							<th scope="row" class="th_bg"><span class="data_required"></span>지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-cmndYmdFrom" name="srch-dtp-cmndYmdFrom" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-cmndYmdTo" name="srch-dtp-cmndYmdTo" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<th scope="row" class="th_bg" style="border-right: hidden;">운송회사</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-trsprtCo" name="srch-slt-trsprtCo" uitype="single" jsondata-ref="jsonTrsprtCo" class="form-control input-sm" unselected-text="선택"></sbux-select>
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
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" uitype="single" jsondata-ref="jsonApcSpcfct" class="form-control input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td class="td_input" colspan="2"></td>
							<th scope="row" class="th_bg">포장구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-pckgSeCd" name="srch-slt-pckgSeCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComPckgSeCd"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>출하지시 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdSpmtCmnd" style="width:100%;height:550px;"></div>
				</div>
			</div>
		</div>
				<!--[pp] //검색결과 -->
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
	var jsonTrsprtCo		= [];	// 운송회사 	trsprtCo	검색
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonApcSpcfct		= [];	// 규격 		spcfct		검색
	var jsonComPckgSeCd		= [];	// 포장구분 	pckgSeCd	검색
	
	var jsonSmptCmnd		= [];

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setTrsprtsSBSelect('srch-slt-trsprtCo', jsonTrsprtCo, gv_selectedApcCd),				// 운송회사
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),					// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),					// 품종
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd),				// 규격
			gfn_setComCdSBSelect('srch-slt-pckgSeCd', jsonComPckgSeCd, 'PCKG_SE_CD', gv_selectedApcCd)	// 포장구분
		]);
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-cmndYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-cmndYmdTo", gfn_dateToYmd(new Date()));
		
		fn_createSpmtCmndGrid();
		fn_initSBSelect();
	})

	function fn_createSpmtCmndGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtCmnd';
	    SBGridProperties.id = 'grdSmptCmnd';
	    SBGridProperties.jsonref = 'jsonSmptCmnd';
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
            {caption: ['지시일자'], 	ref: 'cmndYmd', 	width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['거래처'], 	ref: 'cnptNm', 		width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['상품명'], 	ref: 'gdsNm', 		width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['운송회사'], 	ref: 'trsprtCoNm', 	width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['배송처'], 	ref: 'dldtn', 		width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['수량'], 		ref: 'cmndQntt', 	width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['중량'], 		ref: 'cmndWght', 	width: '10%',	type: 'output',	style:'text-align: right'},
            {caption: ['상품등급'], 	ref: 'gdsGrd', 		width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['포장구분'], 	ref: 'pkcgSe', 		width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['품종'], 		ref: 'vrtyNm', 		width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 	width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['비고'], 		ref: 'rmrk', 		width: '10%',	type: 'output'}
        ];
        grdSmptCmnd = _SBGrid.create(SBGridProperties);
        grdSmptCmnd.bind( "afterpagechanged" , "fn_pagingSmptCmnd" );
    }
	
	// 출하지시 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdSmptCmnd.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdSmptCmnd.movePaging(currentPageNo);
    }
	
	let newJsonSmptCmnd = [];
	
	// 출하지시 목록 조회 호출
	async function fn_callSelectSpmtCmndList(recordCountPerPage, currentPageNo){
		jsonSmptCmnd = [];
		let apcCd = gv_selectedApcCd;
		let cmndYmdFrom = SBUxMethod.get("srch-dtp-cmndYmdFrom");
		let cmndYmdTo = SBUxMethod.get("srch-dtp-cmndYmdTo");
		let cnptNm = SBUxMethod.get("srch-inp-cnptNm");
		let trsprtCoCd = SBUxMethod.get("srch-slt-trsprtCo");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let pckgSeCd = SBUxMethod.get("srch-slt-pckgSeCd");
		if (gfn_isEmpty(cmndYmdFrom)){
			gfn_comAlert("W0002", "지시일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(cmndYmdTo)){
			gfn_comAlert("W0002", "지시일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		let SpmtCmndVO = {apcCd 				: apcCd
						, cmndYmdFrom 			: cmndYmdFrom
						, cmndYmdTo 			: cmndYmdTo
						, cnptNm 				: cnptNm
						, trsprtCoCd 			: trsprtCoCd
						, itemCd 				: itemCd
						, vrtyCd 				: vrtyCd
						, spcfctCd 				: spcfctCd
						, pckgSeCd 				: pckgSeCd
						, pagingYn 				: 'Y'
						, currentPageNo 		: currentPageNo
						, recordCountPerPage 	: recordCountPerPage};
    	let postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtCmndList.do", SpmtCmndVO);
        let data = await postJsonPromise;
        newJsonSmptCmnd = [];
        try{
        	data.resultList.forEach((item, index) => {
				let spmtCmnd = {
				    cmndYmd 	: item.cmndYmd
				  , cnptNm 		: item.cnptNm
				  , gdsNm 		: item.gdsNm
				  , trsprtCoNm 	: item.trsprtCoNm
				  , dldtn 		: item.dldtn
				  , cmndQntt	: item.cmndQntt
				  , cmndWght 	: item.cmndWght
				  , gdsGrd 		: item.gdsGrd
				  , pckgSe 		: item.pckgSe
				  , vrtyNm 		: item.vrtyNm
				  , spcfctNm 	: item.spcfctNm
				  , rmrk		: item.rmrk
				}
				jsonSmptCmnd.push(Object.assign({}, spmtCmnd));
				newJsonSmptCmnd.push(Object.assign({}, spmtCmnd));
			});
        	if(jsonSmptCmnd.length > 0){
				if(grdSmptCmnd.getPageTotalCount() != data.resultList[0].totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdSmptCmnd.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdSmptCmnd.rebuild();
				}else{
					grdSmptCmnd.refresh();
				}
			}else{
				grdSmptCmnd.setPageTotalCount(0);
				grdSmptCmnd.rebuild();
			}
        }catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        }
	}
	
	// 페이징
    async function fn_pagingSmptCmnd(){
    	let recordCountPerPage = grdSmptCmnd.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdSmptCmnd.getSelectPageIndex(); 
    	fn_callSelectSpmtCmndList(recordCountPerPage, currentPageNo);
    }
	
	// 출하지시서
    async function fn_cmndDocSpmt(){
    	
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
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, itemCd),	// 규격
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