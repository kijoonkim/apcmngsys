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
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-dark" text="조회" onclick="fn_search"></sbux-button>
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
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
					        <th scope="row" class="th_bg"><span class="data_required"></span>접수여부</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-rcptYn" name="srch-slt-rcptYn" uitype="single" unselected-text="선택" jsondata-ref="jsoRcptYn" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>발주일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-outordrYmdFrom" name="srch-dtp-outordrYmdFrom" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-outordrYmdTo" name="srch-dtp-outordrYmdTo" uitype="popup" class="form-control input-sm input-sm-ast sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">발주유형</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-outordrType" name="srch-slt-outordrType" uitype="single" unselected-text="선택" jsondata-ref="jsonComOutordrType" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="2"></td>
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
						    <th scope="row" class="th_bg">거래처명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" class="form-control input-sm"></sbux-input>
								<sbux-input id="srch-inp-cnptCd" name="srch-inp-cnptCd" uitype="hidden" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<th scope="row" class="th_bg">납기일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-dudtYmd" name="srch-dtp-dudtYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">상품명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-gdsNm" name="srch-inp-gdsNm" uitype="text" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchGdsNm" name="btnSrchGdsNm" uitype="normal" class="btn btn-xs btn-outline-dark" text="찾기"></sbux-button>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">지시일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-cmndYmd" name="srch-dtp-cmndYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">생산설비</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-fcltCd" name="srch-slt-fcltCd" uitype="single" jsondata-ref="jsonComFcltCd" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="5" style="border-right: hidden;"></td>
							<td class="td_input">
								<sbux-button id="btnRegPrdctnCmnd" name="btnRegPrdctnCmnd" uitype="normal" class="btn btn-sm btn-primary" text="생산지시 등록"></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li><span>발주 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnRcptAll" name="btnRcptAll" uitype="normal" class="btn btn-sm btn-outline-dark" text="일괄접수"></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdOutordrInfo" style="width:100%;height:450px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
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
	var jsonOutordrInfo 	= [];
	
	var jsonApcItem			= [];	// 품목
	var jsonApcVrty			= [];	// 품종
	var jsonComFcltCd		= [];	// 설비
	var jsoRcptYn			= [];	// 접수여부
	var jsonComOutordrType	= [];	// 발주유형
	
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonApcItem, 		gv_selectedApcCd),							// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonApcVrty, 		gv_selectedApcCd),							// 품종
			gfn_setComCdSBSelect('srch-slt-fcltCd', 	jsonComFcltCd, 		'FCLT_CD', 			gv_selectedApcCd),		// 창고
			gfn_setComCdSBSelect('srch-slt-fcltCd', 	jsonComOutordrType, 'OUTORDR_TYPE', 	gv_selectedApcCd),		// 발주유형
			setRcptYnSBSelect('srch-slt-rcptYn', 		jsoRcptYn)														// 접수여부
		]);
	}
	
	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-outordrYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-outordrYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-cmndYmd", gfn_dateToYmd(new Date()));

		fn_createOutordrInfoGrid();
        //fn_search();
		fn_initSBSelect();
	})

	var comboUesYnJsData1 = ['']

	function fn_createOutordrInfoGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdOutordrInfo';
	    SBGridProperties.id = 'grdOutordrInfo';
	    SBGridProperties.jsonref = 'jsonOutordrInfo';
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
        	{caption: ['선택'], 			ref: 'checked', 		width: '50px', 		type: 'checkbox',		style:'text-align: center'},
            {caption: ['접수일자'], 		ref: 'rcptYmd', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['발주유형'], 		ref: 'outordrType', 	width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['접수여부'], 		ref: 'rcptYn', 			width: '100px', 	type: 'combo',			style:'text-align: center',
            	typeinfo : {ref:'comboUesYnJsData1', label:'label', value:'value'}},
            {caption: ['발주번호'], 		ref: 'outordrno', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['거래처명'], 		ref: 'cnptNm', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['납기일자'], 		ref: 'dudtYmd', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['발주일자'], 		ref: 'outordrYmd', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['주문자'], 		ref: 'ordrCd', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['공급자명'], 		ref: 'splyPrsn', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['상품명'], 		ref: 'gdsNm', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['상품코드'], 		ref: 'gdsCd', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['배송지'], 		ref: 'dldtnCd', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['품목'], 			ref: 'itemCd', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['품종'], 			ref: 'vrtyCd', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['규격'], 			ref: 'spcfctCd', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['입수'], 			ref: 'bxGdsQntt', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['발주수량'], 		ref: 'outordrQntt', 	width: '100px', 	type: 'output',			style:'text-align: right'},
            {caption: ['낱개수량'], 		ref: 'pieceQntt', 		width: '100px', 	type: 'output',			style:'text-align: right'},
            {caption: ['단위'], 			ref: 'unitCd', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['박스단가'], 		ref: 'bxUntprc', 		width: '100px', 	type: 'output',			style:'text-align: right'},
            {caption: ['발주단가'], 		ref: 'outordrUntrc', 	width: '100px', 	type: 'output',			style:'text-align: right'},
            {caption: ['발주단위'], 		ref: 'outordrUnit', 	width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['LOT'], 			ref: 'lot', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['세액'], 			ref: 'txAmt', 			width: '100px', 	type: 'output',			style:'text-align: right'},
            {caption: ['발주금액'], 		ref: 'outordrAmt', 		width: '100px', 	type: 'output',			style:'text-align: right'},
            {caption: ['입고형태'], 		ref: 'wrhsType', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['문서번호'], 		ref: 'docno', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['도크정보'], 		ref: 'dockInfo', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['센터구분'], 		ref: 'cntrSe', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['바이어명'], 		ref: 'buyerNm', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['센터입하일'], 		ref: 'cntrRcvdWrhsYmd', width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['센터명'], 		ref: 'cntrNm', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['납품구분'], 		ref: 'dlvgdsSeCd', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['기타'], 			ref: 'etc', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['접수APC (농협)'], ref: 'rcptCfmtnApcCd', 	width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['생산지시번호'], 	ref: 'prdctnCmndno', 	width: '100px', 	type: 'output',			style:'text-align: center'}
        ];
        grdOutordrInfo = _SBGrid.create(SBGridProperties);
        grdOutordrInfo.addRow();
        grdOutordrInfo.bind( "afterpagechanged" , "fn_pagingSmptCmnd" );
    }
	
	// 출하지시 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdOutordrInfo.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdOutordrInfo.movePaging(currentPageNo);
    }
	
	let newJsonOutordrInfo = [];
	
	// 출하지시 목록 조회 호출
	async function fn_callSelectOutordrInfoList(recordCountPerPage, currentPageNo){
		jsonOutordrInfo = [];
		let apcCd = gv_selectedApcCd;
		let cmndYmdFrom = SBUxMethod.get("srch-dtp-cmndYmdFrom");
		let cmndYmdTo = SBUxMethod.get("srch-dtp-cmndYmdTo");
		let cnptNm = SBUxMethod.get("srch-inp-cnptNm");
		let trsprtCoCd = SBUxMethod.get("srch-slt-trsprtCo");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let pckgSeCd = SBUxMethod.get("srch-slt-pckgSeCd");
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
        newJsonOutordrInfo = [];
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
				jsonOutordrInfo.push(Object.assign({}, spmtCmnd));
				newJsonOutordrInfo.push(Object.assign({}, spmtCmnd));
			});
        	if(jsonOutordrInfo.length > 0){
				if(grdOutordrInfo.getPageTotalCount() != data.resultList[0].totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdOutordrInfo.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdOutordrInfo.rebuild();
				}else{
					grdOutordrInfo.refresh();
				}
			}else{
				grdOutordrInfo.setPageTotalCount(0);
				grdOutordrInfo.rebuild();
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
    	let recordCountPerPage = grdOutordrInfo.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdOutordrInfo.getSelectPageIndex(); 
    	fn_callSelectOutordrInfoList(recordCountPerPage, currentPageNo);
    }
	
	// 접수여부 콤보박스 (검색 조건)
	async function setRcptYnSBSelect(_targetIds, _jsondataRef) {
		let sourceJson = [{cmnsNm: "접수", cmnsCd: "Y"}, {cmnsNm: "미접수", cmnsCd: "N"}];
		gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
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
			SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
			SBUxMethod.set('srch-inp-cnptCd', cnpt.cnptCd);
		}
	}
</script>
</html>