<%
 /**
  * @Class Name : spmtCmnd.jsp
  * @Description : 출하지시조회 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	김호			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title" style="line-height: 30px;"> ▶ ${comMenuVO.menuNm}</h3><!-- 출하지시조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnCmndDocSpmt" name="btnCmndDocSpmt" uitype="normal" class="btn btn-sm btn-primary" text="출하지시서" onclick="fn_cmndDocSpmt"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
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
								<sbux-datepicker id="srch-dtp-cmndYmdFrom" name="srch-dtp-cmndYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-cmndYmdFrom)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-cmndYmdTo" name="srch-dtp-cmndYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-cmndYmdTo)"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" class="form-control input-sm" maxlength="33"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<th scope="row" class="th_bg" style="border-right: hidden;">운송회사</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-trsprtCoCd" name="srch-slt-trsprtCoCd" uitype="single" jsondata-ref="jsonTrsprtCoCd" class="form-control input-sm" unselected-text="전체"></sbux-select>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											unselected-text="전체"
											uitype="single"
											id="srch-slt-itemCd"
											name="srch-slt-itemCd"
											class="form-control input-sm"
											jsondata-ref="jsonApcItem"
											onchange="fn_onChangeSrchItemCd(this)"
										/>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											unselected-text="전체"
											uitype="single"
											id="srch-slt-vrtyCd"
											name="srch-slt-vrtyCd"
											class="form-control input-sm"
											jsondata-ref="jsonApcVrty"
											onchange="fn_onChangeSrchVrtyCd(this)"
										/>
									</div>
								</div>
							</td>
							<td></td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" uitype="single" jsondata-ref="jsonApcSpcfct" class="form-control input-sm" unselected-text="전체"></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" colspan="2"></td>
							<th scope="row" class="th_bg">포장단위</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-spmtPckgUnitCd" name="srch-slt-spmtPckgUnitCd" uitype="single" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonSpmtPckgUnitCd"></sbux-select>
									</div>
								</div>
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
					<div id="sb-area-grdSpmtCmnd" style="width:100%;height:540px;"></div>
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
	var jsonTrsprtCoCd		= [];	// 운송회사 	trsprtCoCd		검색
	var jsonApcItem			= [];	// 품목 		itemCd			검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd			검색
	var jsonApcSpcfct		= [];	// 규격 		spcfct			검색
	var jsonSpmtPckgUnitCd	= [];	// 포장단위 	spmtPckgUnitCd	검색

	var jsonSmptCmnd		= [];

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setTrsprtsSBSelect('srch-slt-trsprtCoCd', 	jsonTrsprtCoCd, gv_selectedApcCd),				// 운송회사
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),					// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, gv_selectedApcCd),					// 품종
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd),				// 규격
			gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnitCd', jsonSpmtPckgUnitCd, gv_selectedApcCd)	// 포장단위
		]);
        fn_search();
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-cmndYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-cmndYmdTo", gfn_dateToYmd(new Date()));

		fn_createSpmtCmndGrid();
		fn_initSBSelect();
	});
	
	const fn_dtpChange = function(){
		let cmndYmdFrom = SBUxMethod.get("srch-dtp-cmndYmdFrom");
		let cmndYmdTo = SBUxMethod.get("srch-dtp-cmndYmdTo");
		if(gfn_diffDate(cmndYmdFrom, cmndYmdTo) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
			SBUxMethod.set("srch-dtp-cmndYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-cmndYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}

	function fn_createSpmtCmndGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSpmtCmnd';
	    SBGridProperties.id = 'grdSpmtCmnd';
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
        	{caption : ["선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ['지시일자'], 	ref: 'cmndYmd', 		width: '120px',	type: 'output',	style:'text-align: center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['거래처'], 	ref: 'cnptNm', 			width: '200px',	type: 'output',	style:'text-align: center'},
            {caption: ['운송회사'], 	ref: 'trsprtCoNm', 		width: '140px',	type: 'output',	style:'text-align: center'},
            {caption: ['배송처'], 	ref: 'dldtn', 			width: '200px',	type: 'output',	style:'text-align: center'},
            {caption: ['수량'], 		ref: 'cmndQntt', 		width: '120px',	type: 'output',	style:'text-align: right',
            	format : {type:'number', rule:'#,###'}},
            {caption: ['중량'], 		ref: 'cmndWght', 		width: '120px',	type: 'output',	style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['상품등급'], 	ref: 'gdsGrdNm', 		width: '120px',	type: 'output',	style:'text-align: center'},
            {caption: ['포장단위'], 	ref: 'spmtPckgUnitNm', 	width: '160px',	type: 'output',	style:'text-align: center'},
            {caption: ['품종'], 		ref: 'vrtyNm', 			width: '120px',	type: 'output',	style:'text-align: center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 		width: '120px',	type: 'output',	style:'text-align: center'},
            {caption: ['비고'], 		ref: 'rmrk', 			width: '200px',	type: 'output'},
            {caption: ["출하지시번호"],	ref: 'spmtCmndno', 		type:'output',  hidden: true},
            {caption: ["출하지시순번"],	ref: 'spmtCmndSn', 		type:'output',  hidden: true},
        ];
        grdSpmtCmnd = _SBGrid.create(SBGridProperties);
        grdSpmtCmnd.bind( "afterpagechanged" , "fn_pagingSmptCmnd" );
    }

	// 출하지시 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdSpmtCmnd.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdSpmtCmnd.movePaging(currentPageNo);
    }

	// 출하지시 목록 조회 호출
	async function fn_callSelectSpmtCmndList(recordCountPerPage, currentPageNo){
		jsonSmptCmnd = [];
		let apcCd = gv_selectedApcCd;
		let cmndYmdFrom = SBUxMethod.get("srch-dtp-cmndYmdFrom");
		let cmndYmdTo = SBUxMethod.get("srch-dtp-cmndYmdTo");
		let cnptNm = SBUxMethod.get("srch-inp-cnptNm");
		let trsprtCoCd = SBUxMethod.get("srch-slt-trsprtCoCd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let spmtPckgUnitCd = SBUxMethod.get("srch-slt-spmtPckgUnitCd");
		if (gfn_isEmpty(cmndYmdFrom)){
			gfn_comAlert("W0002", "지시일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(cmndYmdTo)){
			gfn_comAlert("W0002", "지시일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}

		let spmtCmndVO = {apcCd 				: apcCd
						, cmndYmdFrom 			: cmndYmdFrom
						, cmndYmdTo 			: cmndYmdTo
						, cnptNm 				: cnptNm
						, trsprtCoCd 			: trsprtCoCd
						, itemCd 				: itemCd
						, vrtyCd 				: vrtyCd
						, spcfctCd 				: spcfctCd
						, spmtPckgUnitCd 		: spmtPckgUnitCd
						, pagingYn 				: 'Y'
						, currentPageNo 		: currentPageNo
						, recordCountPerPage 	: recordCountPerPage};
		console.log(spmtCmndVO)
    	let postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtCmndList.do", spmtCmndVO);
        let data = await postJsonPromise;
        console.log(data);
        try{
        	jsonSmptCmnd.length = 0;
        	data.resultList.forEach((item, index) => {
				let spmtCmnd = {
				    cmndYmd 		: item.cmndYmd
				  , cnptNm 			: item.cnptNm
				  , gdsNm 			: item.gdsNm
				  , trsprtCoNm 		: item.trsprtCoNm
				  , dldtn 			: item.dldtn
				  , cmndQntt		: item.cmndQntt
				  , cmndWght 		: item.cmndWght
				  , gdsGrdNm 		: item.gdsGrdNm
				  , spmtPckgUnitNm 	: item.spmtPckgUnitNm
				  , vrtyNm 			: item.vrtyNm
				  , spcfctNm 		: item.spcfctNm
				  , rmrk			: item.rmrk
				  , spmtQntt		: item.spmtQntt
				  , spmtWght		: item.spmtWght
				  , apcCd			: item.apcCd
				  , spmtCmndno		: item.spmtCmndno
				  , spmtCmndSn		: item.spmtCmndSn
				  , apcSeCd			: gv_selectedApcSeCd
				  , outordrno		: item.outordrno
				}
				jsonSmptCmnd.push(spmtCmnd);
			});
        	if(jsonSmptCmnd.length > 0){
				if(grdSpmtCmnd.getPageTotalCount() != data.resultList[0].totalRecordCount){   	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdSpmtCmnd.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdSpmtCmnd.rebuild();
				}else{
					grdSpmtCmnd.refresh();
				}
			}else{
				grdSpmtCmnd.setPageTotalCount(0);
				grdSpmtCmnd.rebuild();
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
    	let recordCountPerPage = grdSpmtCmnd.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdSpmtCmnd.getSelectPageIndex();
    	fn_callSelectSpmtCmndList(recordCountPerPage, currentPageNo);
    }

    const fn_delete = async function(){
		let grdRows = grdSpmtCmnd.getCheckedRows(0);
    	let deleteList = [];

    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData = grdSpmtCmnd.getRowData(nRow);
    		let spmtQntt = rowData.spmtQntt;

    		if(spmtQntt > 0){
	    		gfn_comAlert("W0009", "출하실적");			// W0009	{0}이/가 있습니다.
    			return;
    		}

    		deleteList.push(rowData);
    	}
    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "삭제");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	let regMsg = "삭제 하시겠습니까?";
		if(confirm(regMsg)){
			const postJsonPromise = gfn_postJSON("/am/spmt/deleteSpmtCmndList.do", deleteList);
	    	const data = await postJsonPromise;

	    	try{
	       		if(data.deletedCnt > 0){
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	       		}else{
	       			gfn_comAlert("E0001");					// E0001 오류가 발생하였습니다.
	       		}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}
	}

	/**
	 * @name fn_cmndDocSpmt
	 * @description 출하지시서 발행
	 */
    const fn_cmndDocSpmt = async function() {
    	
    	const cmndNoList = [];
		const allData = grdSpmtCmnd.getGridDataAll();
		allData.forEach((item) => {
			if (item.checkedYn === "Y") {
				cmndNoList.push(item.spmtCmndno);
    		}
		});

 		if (cmndNoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const spmtCmndno = cmndNoList.join("','");
 		gfn_popClipReport("출하지시서", "am/spmtCmndDoc.crf", {apcCd: gv_selectedApcCd, spmtCmndno: spmtCmndno});
    }

 	// APC 선택 변경
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_initSBSelect(),
			jsonSmptCmnd = [],
 			grdSpmtCmnd.rebuild()
		]);
	}
	
	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),						// 품종
			gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnitCd', jsonSpmtPckgUnitCd, gv_selectedApcCd, itemCd)	// 포장구분
		]);
		if (gfn_isEmpty(itemCd)) {
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, "");
		} else {
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, itemCd);				// 규격
		}
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		let itemCd = "";
		if (!gfn_isEmpty(vrtyCd)) {
			itemCd = _.find(jsonApcVrty, {value: vrtyCd}).mastervalue;
		} else {
			itemCd = SBUxMethod.get("srch-slt-itemCd");
		}
		
		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
		let rst = await Promise.all([
			gfn_setSpmtPckgUnitSBSelect('srch-slt-spmtPckgUnitCd', 	jsonSpmtPckgUnitCd, gv_selectedApcCd, itemCd, vrtyCd)	// 포장단위
		]);
	}

	// 거래처 선택 팝업 호출
	const fn_modalCnpt = function() {
    	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnptNm"), fn_setCnpt);
	}

	const fn_setCnpt = function(cnpt) {
		if (!gfn_isEmpty(cnpt)) {
			SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
		}
	}
</script>
</html>