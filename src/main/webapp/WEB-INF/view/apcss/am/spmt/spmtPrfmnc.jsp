<%
 /**
  * @Class Name : spmtPrfmnc.jsp
  * @Description : 출하실적조회 화면
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
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ ${menuNm}</h3><!-- 출하실적조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocSpmt" name="btnDocSpmt" uitype="normal" text="송품장" class="btn btn-sm btn-primary" onclick="fn_docSpmt"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_del"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnRetrun" name="btnRetrun" uitype="normal" text="반품" class="btn btn-sm btn-outline-danger" onclick="fn_rtn"></sbux-button>
					<sbux-button id="btnRtnCncl" name="btnRtnCncl" uitype="normal" text="반품취소" class="btn btn-sm btn-outline-danger" onclick="fn_rtnCncl"></sbux-button>
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
							<th scope="row" class="th_bg"><span class="data_required"></span>출하일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-spmtYmdFrom" name="srch-dtp-spmtYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-spmtYmdFrom)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-spmtYmdTo" name="srch-dtp-spmtYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-spmtYmdTo)"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg" style="border-right: hidden;">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonComItem" onchange="fn_selectItem" ></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-vrtyNm"
									name="srch-inp-vrtyNm"
									class="form-control input-sm"
									maxlength="33"
									uitype="text"
									readonly
									show-clear-button="true"
								></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"></sbux-button>
							</td>
							<th scope="row" class="th_bg" style="border-right: hidden;">거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">배송지</th>
							<td colspan="2" class="td_input" style="border-right: hidden;" >
								<sbux-input id="srch-inp-dldtn" name="srch-inp-dldtn" uitype="text" maxlength="30" class="form-control input-sm"></sbux-input>
							</td>
							<td></td>
							<th scope="row" class="th_bg">운송사</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-trsprtCoCd" name="srch-slt-trsprtCoCd" uitype="single" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonComTrsprtCoCd"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vhclno" name="srch-inp-vhclno" uitype="text" maxlength="8" class="form-control pull-right input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input">
								<sbux-button id="btnSrchVhclno" name="btnSrchVhclno" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_choiceVhcl"></sbux-button>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">반품여부</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-rtnGdsYn"
											name="srch-slt-rtnGdsYn"
											uitype="single"
											class="form-control input-sm"
											unselected-text="전체"
											jsondata-ref="jsonComRtnGdsYn"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="10"></td>
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
					<div id="sb-area-spmtPrfmnc" style="height:508px;"></div>
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
    <!-- 반품 Modal -->
    <div>
        <sbux-modal id="modal-rtn" name="modal-rtn" uitype="middle" header-title="반품 등록" body-html-id="body-modal-rtn" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-rtn">
    	<jsp:include page="../../am/popup/rtnPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonSpmtPrfmnc		= [];
	var vrtyCds 			= [];

	var jsonComItem			= [];	// 품목
	var jsonComVrty			= [];	// 품종
	var jsonComWarehouse	= [];	// 창고
	var jsonComTrsprtCoCd	= [];	// 운송사
	var jsonComRtnGdsYn 	= [
		{'value' : 'N', 'text' : '출하'},
		{'value' : 'Y', 'text' : '반품'}
	]

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
		 	gfn_setTrsprtsSBSelect('srch-slt-trsprtCoCd', 	jsonComTrsprtCoCd, 	gv_selectedApcCd),						// 운송사
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd)						// 품목
		]);
        fn_search();
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		SBUxMethod.set("srch-dtp-spmtYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-spmtYmdTo", gfn_dateToYmd(new Date()));

		fn_createSpmtPrfmncGrid();
		fn_initSBSelect();
	});

	const fn_dtpChange = function(){
		let spmtYmdFrom = SBUxMethod.get("srch-dtp-spmtYmdFrom");
		let spmtYmdTo = SBUxMethod.get("srch-dtp-spmtYmdTo");
		if(gfn_diffDate(spmtYmdFrom, spmtYmdTo) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다."); //W0001{0}
			SBUxMethod.set("srch-dtp-spmtYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-spmtYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}

	function fn_createSpmtPrfmncGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-spmtPrfmnc';
	    SBGridProperties.id = 'grdSpmtPrfmnc';
	    SBGridProperties.jsonref = 'jsonSpmtPrfmnc';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.frozencols = 4;
    	SBGridProperties.paging = {
    			'type' : 'page',
    		  	'count' : 5,
    		  	'size' : 20,
    		  	'sorttype' : 'page',
    		  	'showgoalpageui' : true
    	    };
        SBGridProperties.columns = [
        	{
        		caption: ["전체","<input type='checkbox' onchange='fn_checkAll(grdSpmtPrfmnc, this);'>"],
        		ref: 'checkedYn', type: 'checkbox',  width:'50px',
        		style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ['반품여부','반품여부'], 	ref: 'rtnGdsNm',	width: '50px',	type: 'output',	style:'text-align: center'},
        	{caption: ['출하번호','출하번호'], 	ref: 'spmtno', 		width: '120px',	type: 'output',	style:'text-align: center'},
            {caption: ['출하일자','출하일자'], 	ref: 'spmtYmd',		width: '80px',	type: 'output',	style:'text-align: center',
    		    format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
            {caption: ['브랜드','브랜드'], 		ref: 'brndNm', 		width: '100px',	type: 'output',	style:'text-align: center'},
            {caption: ['거래처','거래처'], 		ref: 'cnptNm', 		width: '130px',	type: 'output',	style:'text-align: center'},
            {caption: ['배송지','배송지'], 		ref: 'dldtn', 		width: '150px',	type: 'output',	style:'text-align: center'},
            {caption: ['운송사','운송사'], 		ref: 'trsprtCoNm', 	width: '120px',	type: 'output',	style:'text-align: center'},
            {caption: ['차량번호','차량번호'], 	ref: 'vhclno',		width: '100px',	type: 'output',	style:'text-align: center'},
            {caption: ['운반비','운반비'], 		ref: 'trsprtCst', 	width: '100px',	type: 'output',	style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### 원'}},
            {caption: ['품목','품목'],			ref: 'itemNm', 		width: '70px',	type: 'output',	style:'text-align: center'},
            {caption: ['품종','품종'],			ref: 'vrtyNm', 		width: '70px',	type: 'output',	style:'text-align: center'},
            {caption: ['규격','규격'], 			ref: 'spcfctNm', 	width: '100px',	type: 'output',	style:'text-align: center'},
            {caption: ['출하','수량'], 			ref: 'spmtQntt', 	width: '60px',	type: 'output',	style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['출하','중량'], 			ref: 'spmtWght', 	width: '80px',	type: 'output',	style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['반품','수량'], 			ref: 'rtnGdsQntt', 	width: '60px',	type: 'input',	style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['반품','중량'], 			ref: 'rtnGdsWght', 	width: '80px',	type: 'output',	style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['비고','비고'], 			ref: 'rmrk',		width: '250px',	type: 'output',	style:'text-align: center'}
        ];
        grdSpmtPrfmnc = _SBGrid.create(SBGridProperties);
        grdSpmtPrfmnc.bind( "afterpagechanged" , "fn_pagingSmptPrfmnc" );
        grdSpmtPrfmnc.bind('valuechanged', 'fn_grdRtnQnttValueChanged');
        grdSpmtPrfmnc.bind('select','fn_setValue');
        grdSpmtPrfmnc.bind('deselect','fn_delValue');
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
    	grdSpmtPrfmnc.exportLocalExcel("출하실적", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(grid, obj) {
        var gridList = grid.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        //체크박스 열 index
        var getColRef = grid.getColRef("checkedYn");
    	var getRow = grid.getRow();
    	var getCol = grid.getCol();
        for (var i=0; i<gridList.length; i++) {
        	grid.setCol(getColRef);
        	grid.clickCell(i+2, getColRef);
            grid.setCellData(i+2, getColRef, checkedYn, true, false);
        }
    	grid.clickCell(getRow, getCol);
    }
    
	const fn_setValue = function(){
		let checkedYnCol = grdSpmtPrfmnc.getColRef("checkedYn");
		let nCol = grdSpmtPrfmnc.getCol();
		let nRow = grdSpmtPrfmnc.getRow();

		if(nCol == checkedYnCol){

			let grdRows = grdSpmtPrfmnc.getCheckedRows(checkedYnCol);
			let rtnGdsQnttCol = grdSpmtPrfmnc.getColRef("rtnGdsQntt");
			let rtnGdsWghtCol = grdSpmtPrfmnc.getColRef("rtnGdsWght");
			let rtnGdsYn = grdSpmtPrfmnc.getRowData(nRow).rtnGdsYn
			let rtnPsbleyQntt = grdSpmtPrfmnc.getRowData(nRow).rtnPsbleyQntt
			let rtnPsbleyWght = grdSpmtPrfmnc.getRowData(nRow).rtnPsbleyWght

			if(rtnPsbleyQntt == 0){
				grdSpmtPrfmnc.setCellData(nRow, rtnGdsQnttCol, 0);
				grdSpmtPrfmnc.setCellData(nRow, rtnGdsWghtCol, 0);
			}

			grdSpmtPrfmnc.setCellData(nRow, rtnGdsQnttCol, rtnPsbleyQntt);
			grdSpmtPrfmnc.setCellData(nRow, rtnGdsWghtCol, rtnPsbleyWght);
		}


	}

	const fn_delValue = function () {
		let checkedYnCol = grdSpmtPrfmnc.getColRef("checkedYn");
		let nCol = grdSpmtPrfmnc.getCol();
		let nRow = grdSpmtPrfmnc.getRow();

		if(nCol == checkedYnCol){

			let rtnGdsQnttCol = grdSpmtPrfmnc.getColRef("rtnGdsQntt");
			let rtnGdsWghtCol = grdSpmtPrfmnc.getColRef("rtnGdsWght");
			let rtnGdsYn = grdSpmtPrfmnc.getRowData(nRow).rtnGdsYn;

			if(rtnGdsYn != "Y"){
				grdSpmtPrfmnc.setCellData(nRow, rtnGdsQnttCol, 0);
				grdSpmtPrfmnc.setCellData(nRow, rtnGdsWghtCol, 0);
			}

		}
	}

	const fn_grdRtnQnttValueChanged = function(){

    	let nRow = grdSpmtPrfmnc.getRow();
		let nCol = grdSpmtPrfmnc.getCol();
		let rtnGdsQnttCol = grdSpmtPrfmnc.getColRef("rtnGdsQntt");
		let rtnGdsWghtCol = grdSpmtPrfmnc.getColRef("rtnGdsWght");


		switch (nCol) {
		case rtnGdsQnttCol:	// checkbox
			fn_checkRtnQntt();
			break;
		default:
			return;
		}
    }

	const fn_checkRtnQntt = function(){
		let nRow = grdSpmtPrfmnc.getRow();
    	let nCol = grdSpmtPrfmnc.getCol();

    	let rtnGdsYn = grdSpmtPrfmnc.getRowData(nRow).rtnGdsYn
    	let checkedYnCol = grdSpmtPrfmnc.getColRef("checkedYn")
    	let rtnGdsQnttCol = grdSpmtPrfmnc.getColRef("rtnGdsQntt");
		let rtnGdsWghtCol = grdSpmtPrfmnc.getColRef("rtnGdsWght");

		if(rtnGdsYn == "Y"){
			gfn_comAlert("W0010", "반품등록", "실적") // W0010 이미 {0}된 {1} 입니다.
			grdSpmtPrfmnc.setCellData(nRow, rtnGdsQnttCol, 0);
			grdSpmtPrfmnc.setCellData(nRow, rtnGdsWghtCol, 0);
			grdSpmtPrfmnc.setCellData(nRow, checkedYnCol, "N");
			return;
		}

		let rtnPsbleyQntt = grdSpmtPrfmnc.getRowData(nRow).rtnPsbleyQntt
		let rtnPsbleyWght = grdSpmtPrfmnc.getRowData(nRow).rtnPsbleyWght

		if(rtnPsbleyQntt == 0){
			gfn_comAlert("W0005", "반품가능수량") // W0005 {0}이/가 없습니다.
			grdSpmtPrfmnc.setCellData(nRow, rtnGdsQnttCol, 0);
			grdSpmtPrfmnc.setCellData(nRow, rtnGdsWghtCol, 0);
			grdSpmtPrfmnc.setCellData(nRow, checkedYnCol, "N");
			return;
		}

		let grdRows = grdSpmtPrfmnc.getCheckedRows(checkedYnCol);
    	if(grdRows.length > 0){
			let checkCnptCd = grdSpmtPrfmnc.getRowData(grdRows[0]).cnptCd
			let cnptCd = grdSpmtPrfmnc.getRowData(nRow).cnptCd;
			if(checkCnptCd != cnptCd){
				gfn_comAlert("W0006", "이미 선택한 거래처", "선택한 거래처");	// W0006 {0}와/과 {1}이/가 서로 다릅니다.
				grdSpmtPrfmnc.setCellData(nRow, rtnGdsQnttCol, 0);
				grdSpmtPrfmnc.setCellData(nRow, rtnGdsWghtCol, 0);
				grdSpmtPrfmnc.setCellData(nRow, checkedYnCol, "N");
				return;
			}
    	}

		let invntrQntt = grdSpmtPrfmnc.getRowData(nRow).invntrQntt;
		let invntrWght = grdSpmtPrfmnc.getRowData(nRow).invntrWght;
		let spmtQntt = grdSpmtPrfmnc.getRowData(nRow).spmtQntt;
		let spmtWght = grdSpmtPrfmnc.getRowData(nRow).spmtWght;
		let rtnGdsQntt = grdSpmtPrfmnc.getRowData(nRow).rtnGdsQntt;

		grdSpmtPrfmnc.setCellData(nRow, checkedYnCol, "N");

		if(rtnGdsQntt > rtnPsbleyQntt){
			gfn_comAlert("W0008", "반품가능수량", "반품수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdSpmtPrfmnc.setCellData(nRow, rtnGdsQnttCol, 0);
			grdSpmtPrfmnc.setCellData(nRow, rtnGdsWghtCol, 0);
			grdSpmtPrfmnc.setCellData(nRow, checkedYnCol, "N");
			return;
		}

		if(rtnGdsQntt > spmtQntt){
			gfn_comAlert("W0008", "출하수량", "반품수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdSpmtPrfmnc.setCellData(nRow, rtnGdsQnttCol, 0);
			grdSpmtPrfmnc.setCellData(nRow, rtnGdsWghtCol, 0);
			grdSpmtPrfmnc.setCellData(nRow, checkedYnCol, "N");
			return;
		}

		if(rtnGdsQntt <= spmtQntt){
			grdSpmtPrfmnc.setCellData(nRow, rtnGdsWghtCol , Math.round(spmtWght / spmtQntt) * rtnGdsQntt);
			grdSpmtPrfmnc.setCellData(nRow, checkedYnCol, "Y");
		}

		if(rtnGdsQntt == 0){
			grdSpmtPrfmnc.setCellData(nRow, rtnGdsWghtCol, 0);
			grdSpmtPrfmnc.setCellData(nRow, checkedYnCol, "N");
		}

	}

	// 출하실적 목록 조회 (조회 버튼)
    const fn_search = async function() {
    	let recordCountPerPage = grdSpmtPrfmnc.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdSpmtPrfmnc.movePaging(currentPageNo);
    }

	let newJsonSpmtPrfmnc = [];

	// 출하실적 목록 조회 호출
	const fn_callSelectSpmtPrfmncList = async function (recordCountPerPage, currentPageNo){
		let apcCd = gv_selectedApcCd;
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
		let spmtYmdFrom = SBUxMethod.get("srch-dtp-spmtYmdFrom");
		let spmtYmdTo = SBUxMethod.get("srch-dtp-spmtYmdTo");
		let cnptNm = SBUxMethod.get("srch-inp-cnptNm");
		let trsprtCoCd = SBUxMethod.get("srch-slt-trsprtCoCd");
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = vrtyCds.length > 0 ? vrtyCds.join(',') : "";
		let dldtn = SBUxMethod.get("srch-inp-dldtn");
		let vhclno = SBUxMethod.get("srch-inp-vhclno");
		let rtnGdsYn = SBUxMethod.get("srch-slt-rtnGdsYn");

		if (gfn_isEmpty(spmtYmdFrom)){
			gfn_comAlert("W0002", "출하일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(spmtYmdTo)){
			gfn_comAlert("W0002", "출하일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}

		let SpmtPrfmncVO = {apcCd 				: apcCd
						  , spmtYmdFrom 		: spmtYmdFrom
						  , spmtYmdTo 			: spmtYmdTo
						  , cnptNm 				: cnptNm
						  , trsprtCoCd 			: trsprtCoCd
						  , itemCd 				: itemCd
						  , vrtyCd 				: vrtyCd
						  , warehouseSeCd 		: warehouseSeCd
						  , dldtn 				: dldtn
						  , vhclno 				: vhclno
						  , rtnGdsYn			: rtnGdsYn
						  , pagingYn 			: 'Y'
						  , currentPageNo 		: currentPageNo
						  , recordCountPerPage 	: recordCountPerPage};
    	let postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncList.do", SpmtPrfmncVO);
        let data = await postJsonPromise;
        try{
        	jsonSpmtPrfmnc.length = 0;
        	data.resultList.forEach((item, index) => {
				let spmtPrfmnc = {
					spmtYmd 		: item.spmtYmd
				  , gdsNm 			: item.gdsNm
				  , gdsCd 			: item.gdsCd
				  , itemCd			: item.itemCd
				  , itemNm 			: item.itemNm
				  , vrtyCd 			: item.vrtyCd
				  , vrtyNm 			: item.vrtyNm
				  , spcfctCd 		: item.spcfctCd
				  , spcfctNm 		: item.spcfctNm
				  , brndNm 			: item.brndNm
				  , cnptNm 			: item.cnptNm
				  , cnptCd 			: item.cnptCd
				  , dldtn 			: item.dldtn
				  , trsprtCoNm 		: item.trsprtCoNm
				  , trsprtCoCd 		: item.trsprtCoCd
				  , vhclno 			: item.vhclno
				  , trsprtCst 		: item.trsprtCst
				  , spmtQntt		: item.spmtQntt
				  , spmtWght 		: item.spmtWght
				  , totTrsprtCst 	: item.totTrsprtCst
				  , totSpmtQntt		: item.totSpmtQntt
				  , totSpmtWght 	: item.totSpmtWght
				  , rmrk			: item.rmrk
				  , spmtno			: item.spmtno
				  , cfmtnYn			: item.cfmtnYn
				  , ddlnYn			: item.ddlnYn
				  , pckgno			: item.pckgno
				  , pckgSn			: item.pckgSn
				  , apcCd			: item.apcCd
				  , rtnGdsYn		: item.rtnGdsYn
				  , rtnGdsNm		: item.rtnGdsNm
				  , rtnPsbleyQntt	: item.rtnPsbleyQntt
				  , rtnPsbleyWght	: item.rtnPsbleyWght
				  , rtnGdsQntt		: item.rtnGdsQntt
				  , rtnGdsWght		: item.rtnGdsWght
				  , sn				: item.sn
				  , pltBxCd			: item.pltBxCd
				  , bssInvntrQntt	: item.bssInvntrQntt
				  , pltSpmtYn		: item.pltSpmtYn

				}
				jsonSpmtPrfmnc.push(spmtPrfmnc);
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
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	// 페이징
    const fn_pagingSmptPrfmnc = async function (){
    	let recordCountPerPage = grdSpmtPrfmnc.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdSpmtPrfmnc.getSelectPageIndex();
    	let ref = "<input type='checkbox' onchange='fn_checkAll(grdSpmtPrfmnc, this);'>";
    	grdSpmtPrfmnc.setCellData(1, grdSpmtPrfmnc.getColRef("checkedYn"), ref, true, false);
    	fn_callSelectSpmtPrfmncList(recordCountPerPage, currentPageNo);
    }

	// APC 선택 변경
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_initSBSelect()
		]);
	}

	const fn_selectItem = function(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		if (gfn_isEmpty(itemCd)) {
			vrtyCds = [];
		}
		SBUxMethod.set("srch-inp-vrtyNm", "");
	}

	// 품종 선택 팝업 호출
	const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

	const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			vrtyCds = [];
			vrtyCds.push(vrty.vrtyCd);
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
		}
	}

	const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			vrtyCds = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				vrtyCds.push(vrtys[i].vrtyCd);
				_vrtys.push(vrtys[i].vrtyNm);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyNm', _vrtys.join(','));
		}
	}

	const fn_del = async function(){
		let checkedYnCol = grdSpmtPrfmnc.getColRef("checkedYn")
		let grdRows = grdSpmtPrfmnc.getCheckedRows(checkedYnCol);
    	let deleteList = [];

    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData  = grdSpmtPrfmnc.getRowData(nRow);
    		let cfmtnYn	= rowData.cfmtnYn;
			let ddlnYn = rowData.ddlnYn;
			let rtnGdsYn = rowData.rtnGdsYn;
			let spmtQntt = rowData.spmtQntt;
			let rtnPsbleyQntt = rowData.rtnPsbleyQntt;

			if(spmtQntt != rtnPsbleyQntt){
    			gfn_comAlert("W0010", "반품등록", "출하실적")				// W0010 이미 {0}된 {1} 입니다.
				return;
			}

    		if(rtnGdsYn == "Y"){
    			gfn_comAlert("W0011", "삭제 대상")				// W0011 {0}이/가 아닙니다.
				return;
    		}
			if(ddlnYn =="Y"){
				gfn_comAlert("W0012", "출하실적")				// W0012 마감등록 된 {0} 입니다.
				return;
			}
			if(cfmtnYn == "Y"){
				gfn_comAlert("W0010", "매출확정", "출하실적")	// W0010 이미 {0}된 {1} 입니다.
				return;
			}

			if(i == 0){
				deleteList.push(rowData);
			}

			if(i > 0 && grdSpmtPrfmnc.getRowData(grdRows[i]).spmtno != grdSpmtPrfmnc.getRowData(grdRows[i-1]).spmtno){
	    		deleteList.push(rowData);
			}
    	}

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "삭제");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	let regMsg = "삭제 하시겠습니까?";
		if(confirm(regMsg)){
			const postJsonPromise = gfn_postJSON("/am/spmt/deleteSpmtPrfmncList.do", deleteList);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
		    		fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	        	} else {
    	    		gfn_comAlert(data.resultCode, data.resultMessage);
    	    	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
		}
	}

	const fn_rtn = async function (){

		let checkedYnCol = grdSpmtPrfmnc.getColRef("checkedYn")
		let grdRows = grdSpmtPrfmnc.getCheckedRows(checkedYnCol);
    	let rtnList = [];


    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData  = grdSpmtPrfmnc.getRowData(nRow);
    		let rtnGdsQntt = rowData.rtnGdsQntt;
    		let rtnGdsWght = rowData.rtnGdsWght;
    		let rtnPsbleyQntt = rowData.rtnPsbleyQntt;

    		let ddlnYn = rowData.ddlnYn;
    		let rtnGdsYn = rowData.rtnGdsYn;

    		if(grdRows.length > 0){
    			let checkCnptCd = grdSpmtPrfmnc.getRowData(grdRows[0]).cnptCd
    			let cnptCd = grdSpmtPrfmnc.getRowData(nRow).cnptCd;
    			if(checkCnptCd != cnptCd){
    				gfn_comAlert("W0009", "거래처가 다른 실적");	// W0009 {0}이/가 있습니다.
    				return;
    			}
        	}

    		if(rtnPsbleyQntt == 0){
    			gfn_comAlert("W0005", "반품가능수량") // W0005 {0}이/가 없습니다.
    			return;
    		}

    		if(rtnGdsYn == "Y"){
    			gfn_comAlert("W0011", "반품 대상")				// W0011 {0}이/가 아닙니다.
				return;
    		}

			if(ddlnYn =="Y"){
				gfn_comAlert("W0012", "출하실적")				// W0012 마감등록 된 {0} 입니다.
				return;
			}
    		if(rtnGdsQntt == 0 || gfn_isEmpty(rtnGdsQntt)){
    			gfn_comAlert("W0001", "반품수량");		//	W0001	{0}이/가 없습니다.
    			return;
    		}
    		if(rtnGdsWght == 0|| gfn_isEmpty(rtnGdsWght)){
    			gfn_comAlert("W0001", "반품중량");		//	W0001	{0}이/가 없습니다.
    			return;
    		}

    		rtnList.push(grdSpmtPrfmnc.getRowData(nRow));
    	}

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "반품");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	popRtn.init(rtnList);

    	SBUxMethod.openModal('modal-rtn');

	}

	const fn_rtnCncl = async function(){
		let checkedYnCol = grdSpmtPrfmnc.getColRef("checkedYn")
		let grdRows = grdSpmtPrfmnc.getCheckedRows(checkedYnCol);
    	let rtnCnclList = [];

    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData  = grdSpmtPrfmnc.getRowData(nRow);
			let ddlnYn = rowData.ddlnYn;

			let rtnGdsYn = rowData.rtnGdsYn;

			if(rtnGdsYn == "N"){
				gfn_comAlert("W0011", "반품취소대상")				// W0011 {0}이/가 아닙니다.
				return;
			}

			if(ddlnYn =="Y"){
				gfn_comAlert("W0012", "반품실적")				// W0012 마감등록 된 {0} 입니다.
				return;
			}

			rtnCnclList.push(grdSpmtPrfmnc.getRowData(nRow));

    	}

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "반품취소");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	let regMsg = "반품취소 하시겠습니까?";
		if(confirm(regMsg)){
			const postJsonPromise = gfn_postJSON("/am/spmt/deleteRtnSpmtPrfmnCnclList.do", rtnCnclList);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
	        		fn_search();
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
	        	}
	        } catch (e) {
	    		if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			}
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

	// 차량 선택 팝업 호출
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl, SBUxMethod.get("srch-inp-vhclno"));
	}

	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("srch-inp-vhclno", vhcl.vhclno);   // callBack input
		}
	}

	/**
     * @name fn_docSpmt
     * @description 송품장 발행 버튼
     */
 	const fn_docSpmt = function() {

 		const spmtnoList = [];
		const allData = grdSpmtPrfmnc.getGridDataAll();
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				spmtnoList.push(item.spmtno);
    		}
		});

 		if (spmtnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const spmtno = spmtnoList.join("','");
 		console.log(spmtno);
 		gfn_popClipReport("송품장", "am/trsprtCmdtyDoc.crf", {apcCd: gv_selectedApcCd, spmtno: spmtno});
 	}


	$(function(){
		$(".glyphicon").on("click", function(){
			SBUxMethod.set("srch-inp-vrtyNm", "");
			vrtyCds.length = 0;
		})
	})
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>