<%
 /**
  * @Class Name : slsPrfmnc.jsp
  * @Description : 매출실적조회 화면
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 매출실적조회</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 매출실적조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSendMail" name="btnSendMail" uitype="normal" class="btn btn-sm btn-primary" text="메일발송" onclick="fn_sendMail"></sbux-button>
					<sbux-button id="btnSlipDlng" name="btnSlipDlng" uitype="normal" class="btn btn-sm btn-primary" text="거래명세표" onclick="fn_slipDlng"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
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
								<sbux-datepicker id="srch-dtp-slsYmdFrom" name="srch-dtp-slsYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-slsYmdFrom)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-slsYmdTo" name="srch-dtp-slsYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-slsYmdTo)"></sbux-datepicker>
							</td>
							<td></td>
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
											onchange="fn_selectItem"
										/>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm" maxlength="33" show-clear-button="true" readonly></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
							<th scope="row" class="th_bg">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->

				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>매출 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-slsPrfmnc" style="height:579px;"></div>
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
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonApcItem			= [];	// 품목 				itemCd		검색
	var jsonComClctmYn		= [];	// 수금여부(사용유무) 	useYn		그리드

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('grdSlsPrfmnc', 		jsonComClctmYn, 	'CLCTM_YN'),	// 완료여부
			gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonApcItem, 	gv_selectedApcCd)	// 품목
		]);
        fn_search();
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-slsYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-slsYmdTo", gfn_dateToYmd(new Date()));

		fn_createSlsPrfmncGrid();
		fn_initSBSelect();
	});

	const fn_dtpChange = function(){
		let slsYmdFrom = SBUxMethod.get("srch-dtp-slsYmdFrom");
		let slsYmdTo = SBUxMethod.get("srch-dtp-slsYmdTo");
		if(gfn_diffDate(slsYmdFrom, slsYmdTo) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
			SBUxMethod.set("srch-dtp-slsYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-slsYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}


	function fn_createSlsPrfmncGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-slsPrfmnc';
	    SBGridProperties.id = 'grdSlsPrfmnc';
	    SBGridProperties.jsonref = 'jsonSlsPrfmnc';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.frozencols = 2;
    	SBGridProperties.paging = {
    			'type' : 'page',
    		  	'count' : 5,
    		  	'size' : 20,
    		  	'sorttype' : 'page',
    		  	'showgoalpageui' : true
    	    };
        SBGridProperties.columns = [
        	{
        		caption: ["전체",""], 				ref: 'checkedYn', 	width: '50px', 		type: 'checkbox',	style:'text-align:center',
					typeinfo: {
						ignoreupdate : true,
						fixedcellcheckbox : {
							usemode : true,
							rowindex : 1,
							deletecaption : false
						},
						checkedvalue : 'Y',
						uncheckedvalue : 'N'
					}
        	},
            {caption: ['매출일자','매출일자'], 			ref: 'slsYmd',		width: '100px',		type: 'output',		style:'text-align: center',
        		format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
            {caption: ['거래처','거래처'], 				ref: 'cnptNm', 		width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['상품명','상품명'],				ref: 'gdsNm', 		width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['상품코드','상품코드'],			ref: 'gdsCd', 		width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['품종','품종'], 				ref: 'vrtyNm', 		width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['규격','규격'], 				ref: 'spcfctNm',	width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['브랜드','브랜드'], 				ref: 'brndNm',		width: '100px', 	type: 'output',		style:'text-align: center'},
            {caption: ['출하일자','출하일자'], 			ref: 'spmtYmd', 	width: '100px', 	type: 'output',		style:'text-align: center',
    		    format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
            {caption: ['단가 (원)','단가 (원)'], 		ref: 'slsUntprc', 	width: '100px', 	type: 'output',		style:'text-align: right',
    		    typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['출하','수량'], 				ref: 'qntt', 		width: '100px', 	type: 'output',		style:'text-align: right',
    		    format : {type:'number', rule:'#,###'}},
            {caption: ['출하','중량 (Kg)'], 			ref: 'wght', 		width: '100px', 	type: 'output',		style:'text-align: right',
    		    typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['매출금액 (원)','매출금액 (원)'], 	ref: 'cfmtnAmt', 	width: '100px', 	type: 'output',		style:'text-align: right',
    		    typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
   		    {caption: ['수금여부','수금여부'], 			ref: 'clctmYn',   	width:'80px',  		type:'combo',    	style:'text-align:center',
   				typeinfo : {ref:'jsonComClctmYn', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['비고','비고'], 				ref: '__', 			width: '200px', 	type: 'output',		style:'text-align: right'},
            {caption: ["매출순번"],					ref: 'slsSn', 		type:'output',  	hidden: true},
            {caption: ["매출실적key"],					ref: 'slsno', 		type:'output',  	hidden: true},
        ];
        grdSlsPrfmnc = _SBGrid.create(SBGridProperties);
        grdSlsPrfmnc.bind( "afterpagechanged" , "fn_pagingSlsPrfmnc" );
    }

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld,			//콜백함수명
        }
    };

    // 엑셀 다운로드
    function fn_excelDwnld() {
    	grdSlsPrfmnc.exportLocalExcel("매출실적", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
		let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");
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
  			if (_.isEqual("S", data.resultStatus)) {
  	        	data.resultList.forEach((item, index) => {
  					let slsPrfmnc = {
  						apcCd		: item.apcCd
  					  , slsYmd 		: item.slsYmd
  					  , slsSn		: item.slsSn
  					  , slsno		: item.slsno
  					  , cnptNm 		: item.cnptNm
  					  , gdsNm 		: item.gdsNm
  					  , gdsCd 		: item.gdsCd
  					  , vrtyNm 		: item.vrtyNm
  					  , spcfctNm 	: item.spcfctNm
  					  , brndNm		: item.brndNm
  					  , spmtYmd 	: item.spmtYmd
  					  , slsUntprc 	: item.slsUntprc
  					  , qntt		: item.qntt
  					  , wght 		: item.wght
  					  , cfmtnAmt 	: item.cfmtnAmt
  					  , totQntt		: item.totQntt
  					  , totWght 	: item.totWght
  					  , totCfmtnAmt : item.totCfmtnAmt
  					  , clctmYn		: item.clctmYn
  					  , cfmtnYn		: item.cfmtnYn
  					}
  					jsonSlsPrfmnc.push(Object.assign({}, slsPrfmnc));
  					newJsonSlsPrfmnc.push(Object.assign({}, slsPrfmnc));
  				});
  	        	if(jsonSlsPrfmnc.length > 0){
  					if(grdSlsPrfmnc.getPageTotalCount() != data.resultList[0].totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
  						grdSlsPrfmnc.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
  						grdSlsPrfmnc.rebuild();
  					}else{
  						grdSlsPrfmnc.refresh();
  					}
  				}else{
  					grdSlsPrfmnc.setPageTotalCount(0);
  					grdSlsPrfmnc.rebuild();
  				}

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	// 페이징
    async function fn_pagingSlsPrfmnc(){
    	let recordCountPerPage = grdSlsPrfmnc.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdSlsPrfmnc.getSelectPageIndex();
		var getColRef = grdSlsPrfmnc.getColRef("checkedYn");
		grdSlsPrfmnc.setFixedcellcheckboxChecked(1, getColRef, false);
    	fn_callSelectSlsPrfmncList(recordCountPerPage, currentPageNo);
    }

	// 메일발송
    async function fn_sendMail(){
		let gridData = grdSlsPrfmnc.getGridDataAll();
		let mailList = [];

		for(var i=0; i<gridData.length; i++){
			if(gridData[i].checkedYn == "Y"){
	    		mailList.push(gridData[i]);
	    	}
		}
		if(mailList.length == 0){
			gfn_comAlert("W0003", "발송");		//	W0003	{0}할 대상이 없습니다.
            return;
		}
		if (!gfn_comConfirm("Q0001", "발송")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
    }

    const fn_save = async function(){
		let grdRows = grdSlsPrfmnc.getCheckedRows(0);
    	let saveList = [];

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData  = grdSlsPrfmnc.getRowData(nRow);
    		let clctmYn = rowData.clctmYn;
    		if (gfn_isEmpty(clctmYn)){
    			gfn_comAlert("W0002", "수금여부");		//	W0002	{0}을/를 입력하세요.
                return;
    		}

			saveList.push(grdSlsPrfmnc.getRowData(nRow));

    	}


    	if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/sls/saveSlsPrfmncCrtList.do", saveList);
	    	const data = await postJsonPromise;

	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		fn_search();
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
	        	}
	        } catch(e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
	        }
		}
	}


	/**
	 * @name fn_slipDlng
	 * @description 거래명세표 발행
	 */
    const fn_slipDlng = async function() {

    	const slsnoList = [];
		const allData = grdSlsPrfmnc.getGridDataAll();
		allData.forEach((item) => {
			if (item.checkedYn === "Y") {
				slsnoList.push(item.slsno);
    		}
		});

 		if (slsnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const slsno = slsnoList.join("','");
 		gfn_popClipReport("거래명세표", "am/dlngDoc.crf", {apcCd: gv_selectedApcCd, slsno: slsno});
    }

	// APC 선택 변경
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_initSBSelect()
		]);
	}

    function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
	}

 	// 품종 선택 팝업 호출
	const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

     const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
		}
	}
     const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyCd = [];
			var _vrtyNm = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtyCd.push(vrtys[i].vrtyCd);
				_vrtyNm.push(vrtys[i].vrtyNm);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCd.join(','));
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNm.join(','));
		}
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

	$(function(){
		$(".glyphicon").on("click", function(){
			SBUxMethod.set("srch-inp-vrtyNm", "");
			SBUxMethod.set("srch-inp-vrtyCd", "");
		})
	})
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>