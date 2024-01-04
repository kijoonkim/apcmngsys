<%
/**
 * @Class Name : regSlsPrfmnc.jsp
 * @Description : 매출확정등록 화면
 * @author SI개발부
 * @since 2023.10.23
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.10.23   	김호			최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 매출확정등록</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 매출확정등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_del"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
				</div>
			</div>
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
						<th scope="row" class="th_bg"><span class="data_required" ></span>매출일자</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-datepicker id="srch-dtp-slsYmdFrom" name="srch-dtp-slsYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(srch-dtp-slsYmdFrom)"></sbux-datepicker>
						</td>
						<td class="td_input" style="border-right: hidden;">
							<sbux-datepicker id="srch-dtp-slsYmdTo" name="srch-dtp-slsYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(srch-dtp-slsYmdTo)"></sbux-datepicker>
						</td>
						<td class="td_input" style="border-right: hidden;"></td>
						<th scope="row" class="th_bg">확정여부</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-select id="srch-slt-cfmtnYn" name="srch-slt-cfmtnYn" uitype="single" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonComUseYn"></sbux-select>
						</td>
						<td colspan="2"></td>
						<th scope="row" class="th_bg">품목/품종</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-select id="srch-slt-itemCd" name="srch-slt-itemCd" uitype="single" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonComItem" onchange="fn_onChangeSrchItemCd(this)"></sbux-select>
						</td>
						<td class="td_input" style="border-right: hidden;">
							<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" class="form-control input-sm" unselected-text="전체" jsondata-ref="jsonComVrty" onchange="fn_onChangeSrchVrtyCd(this)"></sbux-select>
						</td>
						<td class="td_input">
						</td>
					</tr>
					<tr>
						<th scope="row" class="th_bg">거래처</th>
 						<td colspan="2" class="td_input" style="border-right: hidden;">
							<sbux-input id="srch-inp-cnptCd" name="srch-inp-cnptCd" uitype="hidden"></sbux-input>
							<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" class="form-control input-sm" onkeyup="fn_cnptKeyUp(srch-inp-cnptNm)"></sbux-input>
						</td>
						<td class="td_input" style="border-right: hidden;">
							<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_choiceCnpt" text="찾기"  class="btn btn-xs btn-outline-dark"></sbux-button>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="ad_tbl_top2">
				<ul class="ad_tbl_count">
					<li><span>매출 내역</span></li>
				</ul>
			 	<div class="ad_tbl_toplist_datepk">
			 		<table class="table table-bordered tbl_fixed">
			 			<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: auto">
						<col style="width: 95px">
						<col style="width: 180px">
						<col style="width: 180px">
						<col style="width: 62px">
						<col style="width: 62px">
					</colgroup>
					<tbody>
						<tr>
							<td style="border-left:hidden"></td>
							<td style="border-left:hidden">
								<h5 style="float:left; color:black;">매출생성일자</h5>
							</td>
							<td class="td_input" style="border-right:hidden; border-left:hidden" >
								<sbux-datepicker id="dtl-dtp-slsYmdFrom" name="dtl-dtp-slsYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc" onchange="fn_dtlDtpChange(dtl-dtp-slsYmdFrom)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right:hidden; border-left:hidden" >
								<sbux-datepicker id="dtl-dtp-slsYmdTo" name="dtl-dtp-slsYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc" onchange="fn_dtlDtpChange(dtl-dtp-slsYmdTo)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right:hidden;">
								<sbux-button
									id="btnInsertSls"
									name="btnInsertSls"
									uitype="normal"
									text="매출생성"
									onclick="fn_insertSls"
									class="btn btn-xs btn-outline-dark"
								></sbux-button>
							</td>
							<td class="td_input" style="border-right:hidden;">
								<sbux-button
									id="btnRegDdln"
									name="btnRegDdln"
									text="마감등록"
									uitype="modal"
									target-id="modal-ddln"
									onclick="fn_regDDln"
									class="btn btn-xs btn-outline-dark"
								></sbux-button>
							</td>
						</tr>
					</tbody>
			 		</table>
				</div>
			</div>
			<div class="table-responsive tbl_scroll_sm">
				<div id="sb-area-slsPrfmnc" style="height:541px;"></div>
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
    	<jsp:include page="../../am/popup/cnptPopup.jsp"></jsp:include>
    </div>
    <!-- 마감 등록 Modal -->
    <div>
        <sbux-modal id="modal-ddln" name="modal-ddln" uitype="middle" header-title="마감 등록" body-html-id="body-modal-ddln" footer-is-close-button="false" header-is-close-button="false" style="width:700px"></sbux-modal>
    </div>
    <div id="body-modal-ddln">
    	<jsp:include page="../../am/popup/regDdlnPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	const fn_reset = async function(){
		SBUxMethod.set("srch-dtp-slsYmdFrom",  gfn_dateFirstYmd(new Date())); // 매출일자 from
		SBUxMethod.set("srch-dtp-slsYmdTo",  gfn_dateToYmd(new Date())); // 매출일자 to
		SBUxMethod.set("srch-slt-cfmtnYn", ""); // 확정여부
		SBUxMethod.set("srch-slt-itemCd", ""); // 품목
		SBUxMethod.set("srch-slt-vrtyCd", ""); // 품종
		SBUxMethod.set("srch-inp-cnptCd", ""); // 거래처 코드
		SBUxMethod.set("srch-inp-cnptNm", ""); // 거래처 명
		SBUxMethod.set("dtl-dtp-slsYmdFrom", ""); // 매출생성일자 from
		SBUxMethod.set("dtl-dtp-slsYmdTo", ""); // 매출생성일자 to
		fn_search();
	}

	var jsonComItem			= [];	// 품목 		itemCd		검색
	var jsonComVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComUseYn		= [];	// 창고 		useYn		검색
	var jsonComCfmtnYn		= [];
	var jsonGrdCfmtnYn		= [];
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-cfmtnYn', 	jsonComUseYn, 	'CFMTN_YN'),	// 사용유무
			gfn_setComCdSBSelect('grdSlsPrfmnc', 		jsonGrdCfmtnYn, 'CFMTN_YN'),	// 사용유무
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonComItem, 	gv_apcCd),	// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonComVrty, 	gv_apcCd)	// 품종
		])

		grdSlsPrfmnc.refresh({"combo":true});

	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createSlsPrfmncGrid();

		SBUxMethod.set("srch-dtp-slsYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-slsYmdTo", gfn_dateToYmd(new Date()));
		fn_initSBSelect();
	})

	var grdSlsPrfmnc;
	var jsonSlsPrfmnc = [];

	function fn_createSlsPrfmncGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-slsPrfmnc';
	    SBGridProperties.id = 'grdSlsPrfmnc';
	    SBGridProperties.jsonref = 'jsonSlsPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
		SBGridProperties.frozencols = 2;
	    SBGridProperties.total = {
			type: 'grand',
			position: 'bottom',
			columns: {
				standard: [0],
				sum: [14,15]
			},
			grandtotalrow : {
				titlecol: 7,
				titlevalue: '합계',
				style : 'background-color: #ceebff; font-weight: bold; color: #0060b3;',
				stylestartcol: 1
			},
			totalformat: {
				14: '#,### 원',
				15: '#,### 원'
			}
		};
        SBGridProperties.columns = [
        	{
        		caption : ["전체","<input type='checkbox' id='allCheckBox' onchange='fn_checkAll(grdSlsPrfmnc, this);'>"],
        		ref: 'checkedYn', type: 'checkbox',  width:'50px',
        		style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ['매출일자','매출일자'], 			ref: 'slsYmd', 		width: '120px', type: 'output', style: 'text-align:center' ,
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['거래처','거래처'],				ref: 'cnptNm', 		width: '160px', type: 'output', style: 'text-align:center'},
            {caption: ['상품명','상품명'], 				ref: 'gdsNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['상품코드','상품코드'], 			ref: 'gdsCd', 		width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['품목','품목'], 				ref: 'itemNm', 		width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['품종','품종'], 				ref: 'vrtyNm', 		width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['규격','규격'], 				ref: 'spcfctNm', 	width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['등급','등급'], 				ref: 'grdNm', 		width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['브랜드','브랜드'], 				ref: 'brndNm', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['출하','수량'], 				ref: 'qntt',		width: '60px', 	type: 'output',	style: 'text-align:right',
    			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['출하','중량 (Kg)'], 		ref: 'wght', 		width: '80px', 	type: 'output',	style: 'text-align:right',
    			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['출하일자','출하일자'], 			ref: 'spmtYmd', 	width: '120px', type: 'output', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['단가 (원)','단가 (원)'], 		ref: 'slsUntprc', 	width: '80px', 	type: 'output',	style: 'text-align:right',
        		typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['금액 (원)','금액 (원)'], 		ref: 'rkngAmt', 	width: '80px', 	type: 'input',	style: 'text-align:right; background:#FFF8DC;',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['확정금액 (원)','확정금액 (원)'],	ref: 'cfmtnAmt', 	width: '80px', 	type: 'input',	style: 'text-align:right; background:#FFF8DC;',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['확정여부','확정여부'], 	ref: 'cfmtnYn',   	width:'100px',  type: 'combo',	style: 'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonGrdCfmtnYn', 	displayui : false,	itemcount: 10, label:'label', value:'value'}}
        ];
        grdSlsPrfmnc = _SBGrid.create(SBGridProperties);
        grdSlsPrfmnc.bind('select' , 'fn_setValue');
        grdSlsPrfmnc.bind('deselect' , 'fn_delValue');
    }

    //그리드 체크박스 전체 선택
    function fn_checkAll(grid, obj) {
        var gridList = grid.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        //체크박스 열 index
        var getColRef = grid.getColRef("checkedYn");
    	var getRow = grid.getRow();
    	var getCol = grid.getCol();
        for (var i=0; i<gridList.length-1; i++) {
        	grid.setCol(getColRef);
        	grid.clickCell(i+2, getColRef);
            grid.setCellData(i+2, getColRef, checkedYn, true, false);
        }
    	grid.clickCell(getRow, getCol);
    }

	const fn_search = async function(){

		let slsYmdFrom = SBUxMethod.get("srch-dtp-slsYmdFrom");
		let slsYmdTo = SBUxMethod.get("srch-dtp-slsYmdTo");
		let cnptNm = SBUxMethod.get("srch-inp-cnptNm");
		let cnptCd = SBUxMethod.get("srch-inp-cnptCd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let cfmtnYn = SBUxMethod.get("srch-slt-cfmtnYn");
		if (gfn_isEmpty(slsYmdFrom) || gfn_isEmpty(slsYmdTo)){
			gfn_comAlert("W0002", "매출일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		let slsPrfmncVO = {
				   apcCd 		: gv_selectedApcCd
				 , slsYmdFrom 	: slsYmdFrom
				 , slsYmdTo 	: slsYmdTo
				 , cnptNm 		: cnptNm
				 , cnptCd 		: cnptCd
				 , itemCd 		: itemCd
				 , vrtyCd 		: vrtyCd
				 , cfmtnYn		: cfmtnYn
		}
		let postJsonPromise = gfn_postJSON("/am/sls/selectRegSlsPrfmncList.do", slsPrfmncVO);
        let data = await postJsonPromise;
        try{
  			if (_.isEqual("S", data.resultStatus)) {
  	        	jsonSlsPrfmnc.length = 0;
  	        	data.resultList.forEach((item, index) => {
  					let slsPrfmnc = {
  					    apcCd		: item.apcCd
  				      , slsYmd 		: item.slsYmd
  					  , slsSn		: item.slsSn
  					  , cnptNm 		: item.cnptNm
  					  , itemCd		: item.itemCd
  					  , itemNm		: item.itemNm
  					  , grdCd		: item.grdCd
  					  , grdNm		: item.grdNm
  					  , gdsNm 		: item.gdsNm
  					  , gdsCd 		: item.gdsCd
  					  , vrtyNm 		: item.vrtyNm
  					  , spcfctNm 	: item.spcfctNm
  					  , brndNm		: item.brndNm
  					  , spmtYmd 	: item.spmtYmd
  					  , slsUntprc 	: item.slsUntprc
  					  , qntt		: item.qntt
  					  , wght 		: item.wght
  					  , rkngAmt		: item.rkngAmt
  					  , cfmtnAmt 	: item.cfmtnAmt
  					  , cfmtnYn		: item.cfmtnYn
  					  , cfmtnPsbltyYn	: item.cfmtnPsbltyYn
  					}
  					jsonSlsPrfmnc.push(slsPrfmnc);
  				});
  				grdSlsPrfmnc.rebuild();

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

	const fn_setValue = function(){

    	let nRow = grdSlsPrfmnc.getRow();
    	let nCol = grdSlsPrfmnc.getCol();

    	let checkboxChecked = grdSlsPrfmnc.getCheckedRows(0, true);
    	const allCheckbox = grdSlsPrfmnc.getGridDataAll();
    	if(checkboxChecked.length == allCheckbox.length-1){
    		allCheckBox.checked = true;
    	}

    	if(nCol == 0){
    		let cfmtnPsbltyYn = grdSlsPrfmnc.getRowData(nRow).cfmtnPsbltyYn;
    		if(cfmtnPsbltyYn == "N"){
    			gfn_comAlert("E0000", "출하실적이 없습니다. 매출생성을 다시 진행하세요.");		//	E0000	{0}
    			grdSlsPrfmnc.setCellData(nRow, grdSlsPrfmnc.getColRef("checkedYn"), "N");
    			return;
    		}

	    	let rkngAmt = grdSlsPrfmnc.getRowData(nRow).rkngAmt;
	    	grdSlsPrfmnc.setCellData(nRow, grdSlsPrfmnc.getColRef("cfmtnAmt"), rkngAmt);
	    	grdSlsPrfmnc.setCellData(nRow, grdSlsPrfmnc.getColRef("cfmtnYn"), "Y");
    	}
    }

    const fn_delValue = async function(){
    	var nRow = grdSlsPrfmnc.getRow();
    	const allCheckBox = document.querySelector('#allCheckBox');
    	allCheckBox.checked = false;
    	grdSlsPrfmnc.setCellData(nRow, grdSlsPrfmnc.getColRef("cfmtnAmt"), 0);
    	grdSlsPrfmnc.setCellData(nRow, grdSlsPrfmnc.getColRef("cfmtnYn"), "N");
    }

    const fn_save = async function(){

    	var grdRows = grdSlsPrfmnc.getCheckedRows(0);

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

		var saveList = [];
    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData = grdSlsPrfmnc.getRowData(nRow);
    		let rkngAmt = rowData.rkngAmt;

			if(gfn_isEmpty(rkngAmt)){
				gfn_comAlert("W0001", "확정금액");		//	W0001	{0}을/를 입력하세요.
				return;
			}

			saveList.push(rowData);
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

	const fn_insertSls = async function (){
		let slsYmdFrom = SBUxMethod.get("dtl-dtp-slsYmdFrom");
		let slsYmdTo = SBUxMethod.get("dtl-dtp-slsYmdTo");

		if(gfn_isEmpty(slsYmdFrom)){
			gfn_comAlert("W0002", "매출생성시작일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if(gfn_isEmpty(slsYmdTo)){
			gfn_comAlert("W0002", "매출생성종료일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}

		const postJsonPromise = gfn_postJSON("/am/sls/insertSlsPrfmncCrt.do", {
			apcCd			: gv_selectedApcCd,
			slsYmdFrom		: slsYmdFrom,
			slsYmdTo		: slsYmdTo
  		});
		const data = await postJsonPromise;
		try{
			if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001"); 			// I0001 	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	const fn_del = async function(){
    	var grdRows = grdSlsPrfmnc.getCheckedRows(0);

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "삭제");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

		var delList = [];
    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData = grdSlsPrfmnc.getRowData(nRow);

			delList.push(rowData);
    	}

    	if (gfn_comConfirm("Q0001", "삭제")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/sls/deleteSlsPrfmncCrtList.do", delList);
	    	const data = await postJsonPromise;

	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		fn_search();
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
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



	/**
	 * @name fn_regDDln
	 * @description 마감등록 호출
	 */
	const fn_regDDln = function() {
		fn_modalDdln(gv_apcCd, gv_apcNm);
	}


	/**
	 * 거래처 팝업 필수 함수
	 * 시작
	 */
	const fn_choiceCnpt = function() {
		let cnptNm = SBUxMethod.get("srch-inp-cnptNm");
		popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, cnptNm, fn_setCnpt);
	}
	const fn_setCnpt = function(cnpt) {
		if (!gfn_isEmpty(cnpt)) {
			SBUxMethod.set("srch-inp-cnptCd", cnpt.cnptCd);
			SBUxMethod.set("srch-inp-cnptNm", cnpt.cnptNm);
		}
	}
	/*
	 * 거래처 팝업 필수 함수
	 * 종료
	 */

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd, itemCd)				// 품종
		]);
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		let itemCd = "";
		if (!gfn_isEmpty(vrtyCd)) {
			itemCd = _.find(jsonComVrty, {value: vrtyCd}).mastervalue;
		} else {
			itemCd = SBUxMethod.get("srch-slt-itemCd");
		}

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
	}

	 const fn_dtpChange = function(){
 		let slsYmdFrom = SBUxMethod.get("srch-dtp-slsYmdFrom");
 		let slsYmdTo = SBUxMethod.get("srch-dtp-slsYmdTo");
 		if(gfn_diffDate(slsYmdFrom, slsYmdTo) < 0){
 			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
 			SBUxMethod.set("srch-dtp-slsYmdFrom", gfn_dateFirstYmd(new Date()));
 			SBUxMethod.set("srch-dtp-slsYmdTo", gfn_dateToYmd(new Date()));
 			return;
 		}
 	}

	 const fn_dtlDtpChange = function(){
 		let slsYmdFrom = SBUxMethod.get("dtl-dtp-slsYmdFrom");
 		let slsYmdTo = SBUxMethod.get("dtl-dtp-slsYmdTo");
 		if(gfn_diffDate(slsYmdFrom, slsYmdTo) < 0){
 			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
 			SBUxMethod.set("dtl-dtp-slsYmdFrom", null);
 			SBUxMethod.set("dtl-dtp-slsYmdTo", null);
 			return;
 		}
 	}


	 const fn_cnptKeyUp = function(){
		 let cnptNm = SBUxMethod.get("srch-inp-cnptNm");

		 if(cnptNm.length == 0){
			 SBUxMethod.set("srch-inp-cnptCd", "");
		 }
	 }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>