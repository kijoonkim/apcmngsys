<%
 /**
  * @Class Name : regOutordrInfo.jsp
  * @Description : 발주정보등록 화면
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
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>발주정보 등록</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 발주정보등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" text="초기화" onclick="fn_reset"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_del"></sbux-button>
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
							<th scope="row" class="th_bg"><span class="data_required"></span>발주형태</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-outordrType"
									name="srch-slt-outordrType"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComOutordrType"
								></sbux-select>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>발주일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-outordrYmd"
									name="srch-dtp-outordrYmd"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-outordrYmd)"
									></sbux-datepicker>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>납기일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									 id="srch-dtp-wrhsYmd"
									 name="srch-dtp-wrhsYmd"
									 uitype="popup"
									 class="form-control input-sm input-sm-ast inpt_data_reqed"
									 onchange="fn_dtpChange(srch-dtp-wrhsYmd)"
									 ></sbux-datepicker>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>거래처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-apcCnptNm" name="srch-inp-apcCnptNm" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-input>
								<sbux-input id="srch-inp-apcCnptCd" name="srch-inp-apcCnptCd" uitype="hidden" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-cnpt" name="srch-btn-cnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_choiceCnpt" text="찾기"  class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<th scope="row" class="th_bg">상품명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-gdsNm" name="srch-inp-gdsNm" uitype="text" class="form-control input-sm"></sbux-input>
								<sbux-input id="srch-inp-gdsCd" name="srch-inp-gdsCd" uitype="hidden" class="form-control input-sm"></sbux-input>
								<sbux-input id="srch-inp-spmtPckgUnitCd" name="srch-inp-spmtPckgUnitCd" uitype="hidden" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchGdsNm" name="btnSrchGdsNm" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-gds" onclick="fn_modalGds" text="찾기"></sbux-button>
							</td>
							<th scope="row" class="th_bg"><span class="data_required"></span>배송처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-dldtn" name="srch-inp-dldtn" uitype="text" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-input>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
						   	<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm-ast"
									unselected-text="전체"
									jsondata-ref="jsonComItem"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComVrty"
									onchange="fn_onChangeSrchVrtyCd(this)"
								></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>규격</th>
						   	<td class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-spcfctCd"
									name="srch-slt-spcfctCd"
									uitype="single"
									unselected-text="선택"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									jsondata-ref="jsonComSpcfct"
								></sbux-select>
							</td>
						</tr>
						<tr>
						    <th scope="row" class="th_bg">발주금액/세액/%</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-outordrAmt"
									name="srch-inp-outordrAmt"
									uitype="text"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
									maxlength="10"
									onkeyup="fn_calculate"
								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-txAmt"
									name="srch-inp-txAmt"
									uitype="text"
									class="form-control input-sm"
									maxlength="10"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
									disabled
								></sbux-input>
							</td>
							<td>
								<sbux-input
									id="srch-inp-tx"
									name="srch-inp-tx"
									uitype="text"
									class="form-control input-sm"
									maxlength="6"
									mask = "{ 'alias': 'currency', 'digits': 2, 'suffix': '%' , 'prefix': '', 'autoUnmask': true }"
									onkeyup="fn_calculate"
								></sbux-input>
							</td>
						    <th scope="row" class="th_bg"><span class="data_required"></span>발주수량/입수</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-outordrQntt"
									name="srch-inp-outordrQntt"
									uitype="text"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
									maxlength="10"
									onkeyup="fn_calculate"
								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-bxGdsQntt"
									name="srch-inp-bxGdsQntt"
									uitype="text"
									class="form-control input-sm"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
									maxlength="6"
									onkeyup="fn_calculate"
								></sbux-input>
							</td>
							<td></td>
							<th scope="row" class="th_bg">낱개수량</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-pieceQntt" name="srch-inp-pieceQntt" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
						    <th scope="row" class="th_bg">박스단가</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-bxUntprc" name="srch-inp-bxUntprc" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg">낱개단가</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-outordrUntprc" name="srch-inp-outordrUntprc" uitype="text" class="form-control input-sm" disabled></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>발주 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdOutordrInfo" style="width:100%;height:425px;"></div>
				</div>
				<!--[pp] 검색결과 -->
			</div>
		</div>
	</section>
	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="../../am/popup/cnptPopup.jsp"></jsp:include>
    </div>
    <!-- 상품 선택 Modal -->
    <div>
        <sbux-modal id="modal-gds" name="modal-gds" uitype="middle" header-title="상품 선택" body-html-id="body-modal-gds" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-gds">
    	<jsp:include page="../../am/popup/gdsPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonOrdr = [];
	var grdOrdr;
	var jsonComOutordrType = [];
	var jsonComItem = [];
	var jsonComVrty = [];
	var jsonComSpcfct = [];


	window.addEventListener('DOMContentLoaded', function(e) {
		fn_initSBSelect();
		fn_createRegOutordrInfoGrid();

		SBUxMethod.set("srch-dtp-outordrYmd", gfn_dateToYmd(new Date()));
	})

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-outordrType', 	jsonComOutordrType,		'OUTORDR_TYPE'),		// 상품등급
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 			gv_selectedApcCd),		// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 			gv_selectedApcCd)		// 품종
		])

	}
	const fn_dtpChange = function(){
		let outOrdrYmdFrom = SBUxMethod.get("srch-dtp-outordrYmd");
		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmd");
		if(gfn_diffDate(outOrdrYmdFrom, wrhsYmdTo) < 0){
			gfn_comAlert("E0000", "납기일자는 발주일자보다 이후 일자입니다.");//W0001{0}
			SBUxMethod.set("srch-dtp-outordrYmd", gfn_dateToYmd(new Date()));
			SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
			return;
		}
	}
	
	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd, itemCd)				// 품종
		]);
		if (gfn_isEmpty(itemCd)) {
			await gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, "");
		} else {
			await gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, itemCd);	// 규격
		}
	}
	
	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		
		if (gfn_isEmpty(vrtyCd)) {
			return;
		}
		
		itemCd = _.find(jsonComVrty, {value: vrtyCd}).mastervalue;
		
		SBUxMethod.set("srch-slt-itemCd", itemCd);
		await fn_onChangeSrchItemCd({value: itemCd});
		SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
	}

	const fn_createRegOutordrInfoGrid = async function () {

        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdOutordrInfo';
	    SBGridProperties.id = 'grdOrdr';
	    SBGridProperties.jsonref = 'jsonOrdr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.frozencols = 4;
        SBGridProperties.columns = [
        	{caption: ["체크박스"], 		ref: 'checkedYn', 		width: '40px', 	type: 'checkbox',	 style:'text-align: center',
				typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}, checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ['발주유형'], 		ref: 'outordrTypeNm', 	width: '100px', type: 'output', 	style: 'text-align:center'},
            {caption: ['발주일자'], 		ref: 'outordrYmd', 		width: '100px', type: 'output', 	style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['납기일자'], 		ref: 'wrhsYmd', 		width: '100px', type: 'output', 	style: 'text-align:center',
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['거래처'], 		ref: 'apcCnptNm', 		width: '100px', type: 'output', 	style: 'text-align:center'},
            {caption: ['상품명'], 		ref: 'spmtPckgUnitNm', 	width: '120px', type: 'output', 	style: 'text-align:center'},
            {caption: ['배송처'], 		ref: 'dldtn', 			width: '100px', type: 'output', 	style: 'text-align:center'},
            {caption: ['품목'], 			ref: 'itemNm', 			width: '80px', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['품종'], 			ref: 'vrtyNm', 			width: '80px', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['규격'], 			ref: 'spcfctNm', 		width: '80px', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['발주금액 (원)'], 	ref: 'outordrAmt', 		width: '80px', 	type: 'output', 	style: 'text-align:right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['세액 (원)'], 		ref: 'txAmt', 			width: '80px', 	type: 'output', 	style: 'text-align:right',
                typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['발주수량'], 		ref: 'outordrQntt', 	width: '60px', 	type: 'output', 	style: 'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['입수'], 			ref: 'bxGdsQntt', 		width: '60px', 	type: 'output', 	style: 'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['낱개수량'], 		ref: 'pieceQntt', 		width: '60px', 	type: 'output', 	style: 'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['박스단가 (원)'], 	ref: 'bxUntprc', 		width: '80px', 	type: 'output', 	style: 'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['낱개단가 (원)'], 	ref: 'outordrUntprc', 	width: '80px', 	type: 'output', 	style: 'text-align:right',
				typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['등록일자'], 		ref: 'regYmd', 			width: '80px', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['등록자'], 		ref: 'regUserNm', 		width: '80px', 	type: 'output', 	style: 'text-align:center'},
            {caption: ['APC구분코드'], 	ref: 'apcSeCd', 		hidden:true},
            {caption: ['발주번호'], 		ref: 'outordrno', 		hidden:true},
            {caption: ['발주유형'], 		ref: 'outordrType', 	hidden:true},
            {caption: ['거래처코드'], 		ref: 'apcCnptCd', 		hidden:true},
            {caption: ['품목코드'], 		ref: 'itemCd', 			hidden:true},
            {caption: ['품종코드'], 		ref: 'vrtyCd', 			hidden:true},
            {caption: ['규격코드'], 		ref: 'spcfctCd', 		hidden:true}

        ];
        grdOrdr = _SBGrid.create(SBGridProperties);
    }

	const fn_search = async function(){
		const outordrYmd = SBUxMethod.get("srch-dtp-outordrYmd");
		const outordrType = SBUxMethod.get("srch-slt-outordrType");
		
		if (gfn_isEmpty(outordrYmd)) {
    		gfn_comAlert("W0001", "발주일자");		//	W0002	{0}을/를 입력하세요.
            return;
    	}
		
		var getColRef = grdOrdr.getColRef("checkedYn");
		grdOrdr.setFixedcellcheckboxChecked(0, getColRef, false);
		
		const postJsonPromise = gfn_postJSON("/am/ordr/selectOrdrHandwritingList.do", {
			  apcCd			: gv_selectedApcCd
			, outordrYmd 	: outordrYmd
  		});
        const data = await postJsonPromise;
        try {
  			if (_.isEqual("S", data.resultStatus)) {
  	          	/** @type {number} **/
  	      		jsonOrdr.length = 0;
  	          	data.resultList.forEach((item, index) => {
  	          		const ordr = {
  	          				apcCd			: item.apcCd,
  	          				apcSeCd			: item.apcSeCd,
  	          				outordrno		: item.outordrno,
  	          				outordrType		: item.outordrType,
  	          				outordrTypeNm	: item.outordrTypeNm,
  	          				outordrYmd		: item.outordrYmd,
  	          				wrhsYmd			: item.wrhsYmd,
  	          				apcCnptCd		: item.apcCnptCd,
  	          				apcCnptNm		: item.apcCnptNm,
  	          				itemCd			: item.itemCd,
  	          				itemNm			: item.itemNm,
  	          				vrtyCd			: item.vrtyCd,
  	          				vrtyNm			: item.vrtyNm,
  	          				spcfctCd		: item.spcfctCd,
  	          				spcfctNm		: item.spcfctNm,
  	          				outordrAmt		: item.outordrAmt,
  	          				txAmt			: item.txAmt,
  	          				outordrQntt		: item.outordrQntt,
  	          				bxGdsQntt		: item.bxGdsQntt,
  	          				bxGdsQntt		: item.bxGdsQntt,
  	          				pieceQntt		: item.pieceQntt,
  	          				bxUntprc		: item.bxUntprc,
  	          				outordrUntprc	: item.outordrUntprc,
  	          				regYmd			: item.regYmd,
  	          				regUserNm		: item.regUserNm,
  	          				dldtn			: item.dldtn,
  	          				gdsCd			: item.gdsCd,
  	          				gdsNm			: item.gdsNm,
  	          				spmtPckgUnitNm	: item.spmtPckgUnitNm,
  	          				spmtPckgUnitCd	: item.spmtPckgUnitCd
  	  				}
  	          		jsonOrdr.push(ordr);
  	  			});
  	          	grdOrdr.rebuild();

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


	// 발주금액, 발주수량, 입수 입력시 낱개수량, 박스단가, 낱개단가 자동계산
	const fn_calculate = function(){

		let outordrAmt 	= parseInt(SBUxMethod.get("srch-inp-outordrAmt"));
		let outordrQntt = parseInt(SBUxMethod.get("srch-inp-outordrQntt"));
		let bxGdsQntt 	= parseInt(SBUxMethod.get("srch-inp-bxGdsQntt"));
		let tx 			= parseFloat(SBUxMethod.get("srch-inp-tx"));
		let txAmt = 0;
		let pieceQntt = 0;
		let bxUntprc = 0;
		let outordrUntprc = 0;

		if(!gfn_isEmpty(tx)){
			txAmt = Math.round(parseInt(outordrAmt) * (tx/100));
		}

		if(outordrAmt > 0 && outordrQntt > 0 && bxGdsQntt > 0){

			pieceQntt = outordrQntt * bxGdsQntt;
			bxUntprc = Math.round((outordrAmt-txAmt) / (outordrQntt * bxGdsQntt));
			outordrUntprc = Math.round((outordrAmt-txAmt) / (outordrQntt * bxGdsQntt));
		}

		SBUxMethod.set("srch-inp-txAmt", txAmt);
		SBUxMethod.set("srch-inp-pieceQntt", pieceQntt);
		SBUxMethod.set("srch-inp-bxUntprc", bxUntprc);
		SBUxMethod.set("srch-inp-outordrUntprc", outordrUntprc);

	}

	// 초기화
	const fn_reset = function(){
		fn_initSBSelect();
		SBUxMethod.set("srch-slt-outordrType","");								// 발주형태
		SBUxMethod.set("srch-dtp-outordrYmd", gfn_dateToYmd(new Date()));		// 발주일자 from
		SBUxMethod.set("srch-dtp-wrhsYmd","");									// 발주일자 to
		SBUxMethod.set("srch-dtp-wrhsYmd","");									// 납기일자
		SBUxMethod.set("srch-inp-apcCnptNm","");								// 거래처 명
		SBUxMethod.set("srch-inp-apcCnptCd","");								// 거래처 코드
		SBUxMethod.set("srch-inp-gdsNm","");									// 상품명
		SBUxMethod.set("srch-inp-gdsCd","");									// 상품코드
		SBUxMethod.set("srch-inp-spmtPckgUnitCd","");							//
		SBUxMethod.set("srch-inp-dldtn","");									// 배송처
		SBUxMethod.set("srch-slt-itemCd","");									// 품목
		SBUxMethod.set("srch-slt-vrtyCd",""); 									// 품종
		SBUxMethod.set("srch-slt-spcfctCd","");									// 규격
		SBUxMethod.set("srch-inp-outordrAmt","");								// 발주금액
		SBUxMethod.set("srch-inp-txAmt","");									// 발주세액
		SBUxMethod.set("srch-inp-outordrQntt","");								// 발주수량
		SBUxMethod.set("srch-inp-bxGdsQntt","");								// 발주입수
		SBUxMethod.set("srch-inp-pieceQntt","");								// 낱개수량
		SBUxMethod.set("srch-inp-bxUntprc","");									// 박스단가
		SBUxMethod.set("srch-inp-outordrUntprc","");							// 낱개단가
 		fn_onChangeSrchItemCd({value: null});
	}

	// 저장
	const fn_save = async function(){

		let apcCd 		= gv_selectedApcCd;
		let apcSeCd 	= gv_selectedApcSeCd;
		let outordrType = SBUxMethod.get("srch-slt-outordrType");
		let outordrYmd 	= SBUxMethod.get("srch-dtp-outordrYmd");
		let wrhsYmd 	= SBUxMethod.get("srch-dtp-wrhsYmd");
		let apcCnptCd 	= SBUxMethod.get("srch-inp-apcCnptCd");
		let apcCnptNm 	= SBUxMethod.get("srch-inp-apcCnptNm");
		let dldtn 		= SBUxMethod.get("srch-inp-dldtn");
		let itemCd 		= SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd 		= SBUxMethod.get("srch-slt-vrtyCd");
		let spcfctCd 	= SBUxMethod.get("srch-slt-spcfctCd");
		let outordrAmt 	= SBUxMethod.get("srch-inp-outordrAmt");
		let txAmt 		= SBUxMethod.get("srch-inp-txAmt");
		let outordrQntt = SBUxMethod.get("srch-inp-outordrQntt");
		let bxGdsQntt 	= SBUxMethod.get("srch-inp-bxGdsQntt");
		let pieceQntt 	= SBUxMethod.get("srch-inp-pieceQntt");
		let bxUntprc 	= SBUxMethod.get("srch-inp-bxUntprc");
		let outordrUntprc 	= SBUxMethod.get("srch-inp-outordrUntprc");
		let gdsCd 		= SBUxMethod.get("srch-inp-gdsCd");
		let gdsNm 		= SBUxMethod.get("srch-inp-gdsNm");
		let spmtPckgUnitCd 	= SBUxMethod.get("srch-inp-spmtPckgUnitCd");
		let rcptnSeCd 	= "99";
		let unitWght 	= "";
		let outordrWght = "";

		if(gfn_isEmpty(outordrType)){
			gfn_comAlert("W0001", "발주형태");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(outordrYmd)){
			gfn_comAlert("W0001", "발주일자");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(wrhsYmd)){
			gfn_comAlert("W0001", "납기일자");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(apcCnptCd)){
			gfn_comAlert("W0001", "거래처");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(dldtn)){
			gfn_comAlert("W0002", "배송처");		//	W0002	{0}을/를 입력하세요.
			return;
		}
		if(gfn_isEmpty(itemCd)){
			gfn_comAlert("W0001", "품목");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(vrtyCd)){
			gfn_comAlert("W0001", "품종");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(spcfctCd)){
			gfn_comAlert("W0001", "규격");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if(gfn_isEmpty(outordrQntt)){
			gfn_comAlert("W0002", "발주수량");		//	W0002	{0}을/를 입력하세요.
			return;
		}
		// FOR문 돌려서 JSON에서 (단중) 찾아서 빼서 밑에 ORDR에 넣어주기 XML 확인
		for(var i=0; i<jsonComSpcfct.length; i++){
			unitWght = jsonComSpcfct[i].wght;

			outordrWght = (parseInt(unitWght) * parseInt(outordrQntt));
		}
		let ordr = {
				apcCd 			: apcCd,
				apcSeCd			: apcSeCd,
				outordrType 	: outordrType,
				outordrYmd 		: outordrYmd,
				wrhsYmd 		: wrhsYmd,
				apcCnptCd		: apcCnptCd,
				apcCnptNm		: apcCnptNm,
				dldtn			: dldtn,
				itemCd			: itemCd,
				vrtyCd			: vrtyCd,
				spcfctCd		: spcfctCd,
				outordrAmt		: outordrAmt,
				outordrQntt 	: outordrQntt,
				bxGdsQntt		: bxGdsQntt,
				txAmt			: txAmt,
				pieceQntt		: pieceQntt,
				bxUntprc		: bxUntprc,
				outordrUntprc 	: outordrUntprc,
				rcptnSeCd 		: rcptnSeCd,
				gdsCd			: gdsCd,
				gdsNm			: gdsNm,
				spmtPckgUnitCd	: spmtPckgUnitCd,
				rcptCfmtnApcCd 	: apcCd,
				rcptCfmtnYmd	: outordrYmd,
				unitWght		: unitWght,
				outordrWght		: outordrWght
		}

		if (gfn_comConfirm("Q0001", "저장")) {			//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/ordr/insertOrdr.do", ordr);
	    	const data = await postJsonPromise;

	        try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		fn_reset();
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

	const fn_del = async function(){
		let grdRows = grdOrdr.getCheckedRows(0);
    	let deleteList = [];


    	for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		deleteList.push(grdOrdr.getRowData(nRow));
    	}

    	if(grdRows.length == 0){
    		gfn_comAlert("W0003", "삭제");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

    	if (gfn_comConfirm("Q0001", "삭제")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/ordr/deleteOrdrList.do", deleteList);
	    	const data = await postJsonPromise;

	    	try {
	        	if (_.isEqual("S", data.resultStatus)) {
	        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
	        		fn_search();
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
	        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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

	/* 상풍선택팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_modalGds
	 * @description 상풍선택팝업 호출
	 */
	const fn_modalGds = async function() {
		let gdsNm = SBUxMethod.get("srch-inp-gdsNm");
    	popGds.init(gv_selectedApcCd, gv_selectedApcNm, gdsNm, fn_setGdsNm);
	}

	/**
	 * @name fn_setGdsNm
	 * @description 상풍 선택 callback
	 */
	const fn_setGdsNm = async function(gds) {
		if (!gfn_isEmpty(gds)) {
			SBUxMethod.set('srch-inp-gdsNm', gds.spmtPckgUnitNm);
			SBUxMethod.set('srch-inp-gdsCd', gds.gdsCd);
			SBUxMethod.set('srch-inp-spmtPckgUnitCd', gds.spmtPckgUnitCd);
			await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd)		// 품종
			SBUxMethod.set("srch-slt-itemCd", gds.itemCd);
			SBUxMethod.set("srch-slt-vrtyCd", gds.vrtyCd);
			await fn_onChangeSrchVrtyCd({value: gds.vrtyCd});
			SBUxMethod.set("srch-slt-spcfctCd", gds.spcfctCd);
		}
	}
	/* End */


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
			SBUxMethod.set("srch-inp-apcCnptCd", cnpt.cnptCd);
			SBUxMethod.set("srch-inp-apcCnptNm", cnpt.cnptNm);
		}
	}
	/*
	 * 거래처 팝업 필수 함수
	 * 종료
	 */

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>