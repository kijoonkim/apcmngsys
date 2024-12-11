<%
 /**
  * @Class Name : wghInfoMng.jsp
  * @Description : 계량정보관리 화면
  * @author SI개발부
  * @since 2024.10.15
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.10.15   	김호 			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 계량정보관리</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 계량정보관리 -->
                    <sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
                    </sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnReset"
						name="btnReset"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_reset"
						text="초기화"
					></sbux-button>
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						class="btn btn-sm btn-primary"
						onclick="fn_save"
						text="저장"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
						text="조회"
					></sbux-button>
					<sbux-button
							id="btnDocRawMtrWgh"
							name="btnDocRawMtrWgh"
							uitype="normal"
							class="btn btn-sm btn-outline-danger"
							onclick="fn_docRawMtrWgh"
							text="정산서발행"
					></sbux-button>
				</div>
			</div>

			<div class="box-body srch-keyup-area">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->

				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" ><span class="data_required" ></span>계량일자</th>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wghYmdFrom"
									name="srch-dtp-wghYmdFrom"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wghYmdFrom)"
								></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wghYmdTo"
									name="srch-dtp-wghYmdTo"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wghYmdTo)"
								></sbux-datepicker>
							</td>
							<td style="border-right: hidden"></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>품목</th>
							<td colspan="2" class="td_input" style="border-right: hidden;border-top: hidden">
								<sbux-select
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									uitype="single"
									jsondata-ref="jsonApcItem"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td colspan="" class="td_input" style="border-right: hidden;border-top: hidden" >
							</td>
							<th scope="row" class="th_bg">구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;border-top: hidden">
								<div style="margin-left: 10px;display: flex; gap: 20px;">
									<sbux-radio
										id="srch-rdo-wrhsSpmtType"
										name="srch-rdo-wrhsSpmtType"
										uitype="normal"
										jsondata-ref="jsonComWrhsSpmtType"
										text-right-padding="10px"
										onchange="fn_onChangeWrhsSpmtType(srch-rdo-wrhsSpmtType)"
									>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input td_prdcr_area" style="border-right: hidden;">
								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
									autocomplete-height="270px"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td class="td_input td_prdcr_area" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrIdentno"
									name="srch-inp-prdcrIdentno"
									class="form-control input-sm"
									maxlength="2"
									autocomplete="off"
									onchange="fn_onChangeSrchPrdcrIdentno(this)"
								/>
							</td>
							<td class="td_input td_prdcr_area" style="border-right: hidden;">
								<sbux-button
									id="btnSrchPrdcr"
									name="btnSrchPrdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>계량정보 상세</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdWghPrfmnc" style="width:100%;height:544px;"></div>
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
		<jsp:include page="../../am/popup/cnptPopup.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {
		await fn_reset();
	}
	async function cfn_add() {

	}
	async function cfn_del() {
		await fn_delete();
	}
	async function cfn_save() {
		await fn_save();
	}
	async function cfn_search() {
		await fn_search();
	}


	let prvRowNum = -1;

	var jsonApcItem			= [];	// 품목 		itemCd			검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd			검색
	var jsonComWarehouse	= [];	// 창고 		warehouse		검색
	var jsonComWrhsSpmtType	= [];	// 입고출고구분 wrhsSpmtType	검색
	var jsonComGdsSeCd		= [];	// 상품구분 	gdsSeCd			검색

	var jsonPrdcr			= [];
	var jsonPrdcrAutocomplete = [];

    /* SBGrid */
    var grdWghPrfmnc;	// 계량실적조회

    /* SBGrid Data (JSON) */
    var jsonWghPrfmnc = [];


    /**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),									// 품목
		 	gfn_setComCdSBSelect('srch-rdo-wrhsSpmtType',	jsonComWrhsSpmtType, 	'WRHS_SPMT_TYPE'),						// 입고출고구분
		 	gfn_setComCdSBSelect('grdWghPrfmnc',			jsonComWarehouse, 		'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
		]);

		jsonComWrhsSpmtType = jsonComWrhsSpmtType.filter(item => item.value !== 'TF');
		SBUxMethod.refresh("srch-rdo-wrhsSpmtType");
		SBUxMethod.set("srch-rdo-wrhsSpmtType", "RT");
	}

	window.addEventListener('DOMContentLoaded', function(e) {

		SBUxMethod.set('srch-dtp-wghYmdTo',gfn_dateToYmd(new Date()));
		SBUxMethod.set('srch-dtp-wghYmdFrom',gfn_dateToYmd(new Date()));
		fn_init();
	});

	const fn_init = async function() {
		fn_reset();
		fn_getPrdcrs();
		fn_createWghPrfmncGrid();
		fn_initSBSelect();
	}


	const fn_createWghPrfmncGrid = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWghPrfmnc';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
        SBGridProperties.columns = [
            {caption: ['계량번호'], 	ref: 'wghno', hidden: true},
        	{caption: ["선택"], 	ref: 'checkedYn', 		type: 'checkbox', 	width: '40px',	  style:'text-align: center',
				typeinfo: {ignoreupdate : true, checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ['계량일자'], 	ref: 'wghYmd', 		width: '120px', type: 'output', style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['거래처'], 		ref: 'cnptNm', 		width: '120px', type: 'output', style:'text-align:center'},
            {caption: ['차량번호'], 	ref: 'vhclno', 		width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['총 중량'], 		ref: 'wholWght', 	width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,### '}},
            {caption: ['공차중량'],		ref: 'emptVhclWght', width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,### '}},
            {caption: ['실중량'], 		ref: 'actlWght', 	width: '80px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,### '}},
            {caption: ['감량율'], 		ref: 'rdcdRt', 		width: '80px', type: 'output', style:'text-align:right;', format : {type:'number', rule:'###.## '}},
        	{caption: ['인수량'], 		ref: 'bxQntt', 		width: '100px', type: 'output', style:'text-align:right', format : {type:'number', rule:'#,### '}},
            {caption: ['생산자'], 		ref: 'prdcrNm', 	width: '100px', type: 'output', style:'text-align:center'},
            {caption: ['저장위치'], 	ref: 'warehouseSeCd', width: '140px', type:'combo',  	style:'text-align:center; background:#FFF8DC;',
    			typeinfo : {ref:'jsonComWarehouse', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['비고'], 		ref: 'rmrk', 		width: '300px', type: 'output'},
            {caption: ['순번'], 		ref: 'wghSn', 		width: '40px', type: 'output', style:'text-align:center',  hidden: true},
        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
    }


	/** common button action */

	/**
     * @name fn_docRawMtrWgh
     * @description 계량확인서 발행 버튼
     */
	const fn_docRawMtrWgh = function() {

		const wghnoList = [];
		const allData = grdWghPrfmnc.getGridDataAll();
		allData.forEach((item) => {
			if (item.checkedYn === "Y") {
				wghnoList.push(item.wghno);
    		}
		});

 		if (wghnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

		const wghno = wghnoList.join("','");
		gfn_popClipReport("계량확인서", "am/rawMtrWghDoc.crf", {apcCd: gv_selectedApcCd, wghno: wghno});
	}


	const fn_onChangeWrhsSpmtType = function (type) {

		if (type == "DT") {
			let acptnWghtCol = grdWghPrfmnc.getColRef("acptnWght");
			let warehouseSeCdCol = grdWghPrfmnc.getColRef("warehouseSeCd");
			grdWghPrfmnc.setCellData(0, acptnWghtCol, "출고량", true);
			grdWghPrfmnc.setColDisabled(warehouseSeCdCol, true);
		}

		if (type == "RT") {
			let acptnWghtCol = grdWghPrfmnc.getColRef("acptnWght");
			let warehouseSeCdCol = grdWghPrfmnc.getColRef("warehouseSeCd");
			grdWghPrfmnc.setCellData(0, acptnWghtCol, "입고량", true);
			grdWghPrfmnc.setColDisabled(warehouseSeCdCol, false);
		}

	}

	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = async function() {
    	fn_clearForm();
	}


	/**
     * @name fn_save
     * @description 저장 버튼
     */
	const fn_save = async function() {

		let checkedYnCol = grdWghPrfmnc.getColRef("checkedYn");
		let checkedRows = grdWghPrfmnc.getCheckedRows(checkedYnCol, true);

		if(checkedRows.length == 0){
    		gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

		let saveList = [];

		for (var i=0; i<checkedRows.length; i++) {

			let rowData = grdWghPrfmnc.getRowData(checkedRows[i]);
			rowData.rowSts = "U";
			saveList.push(rowData);
		}

		if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/invntr/mulitSaveRawMtrInvntrList.do", saveList);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
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
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {

		if (gfn_isEmpty(SBUxMethod.get("srch-dtp-wghYmdFrom"))) {
    		gfn_comAlert("W0001", "계량시작일자");		//	W0002	{0}을/를 입력하세요.
            return;
    	}
		if (gfn_isEmpty(SBUxMethod.get("srch-dtp-wghYmdTo"))) {
    		gfn_comAlert("W0001", "계량종료일자");		//	W0002	{0}을/를 입력하세요.
            return;
    	}

    	// grid clear
    	jsonWghPrfmnc.length = 0;
    	fn_setGrdWghPrfmnc();
	}

	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {

	}


    /**
     * @name fn_setGrdWghPrfmnc
     * @description 계량정보관리 목록 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdWghPrfmnc = async function() {

  		let wghYmdFrom 		= SBUxMethod.get("srch-dtp-wghYmdFrom");	// 계량시작일자
  		let wghYmdTo 		= SBUxMethod.get("srch-dtp-wghYmdTo");		// 계량종료일자
  		let itemCd 			= SBUxMethod.get("srch-slt-itemCd");		// 품목
  		let wrhsSpmtType 	= SBUxMethod.get("srch-rdo-wrhsSpmtType");	// 입고출고구분
  		let prdcrCd 		= SBUxMethod.get("srch-inp-prdcrCd");		// 생산자

  		let url = "";

  		if (wrhsSpmtType == "RT") {
  			url = "/am/wgh/selectWghInfoWrhsMngList.do";
  		}
  		if (wrhsSpmtType == "DT") {
  			url = "/am/wgh/selectWghInfoSpmtMngList.do";
  		}

		const postJsonPromise = gfn_postJSON(url, {
			apcCd			: gv_selectedApcCd
		  , wghYmdFrom		: wghYmdFrom
		  , wghYmdTo		: wghYmdTo
		  , itemCd 			: itemCd
		  , wrhsSpmtType 	: wrhsSpmtType
		  , prdcrCd 		: prdcrCd
  		});

  		try {

	        const data = await postJsonPromise;

	        if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonWghPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
  				const wghPrfmnc = {
  						apcCd: item.apcCd,
  						wghno: item.wghno,
  						wghSn: item.wghSn,
  						wghnoIndct: item.wghnoIndct,
  						wrhsno: item.wrhsno,
  						wghYmd: item.wghYmd,
  						vhclno: item.vhclno,
  						prdcrCd: item.prdcrCd,
  						itemCd: item.itemCd,
  						itemNm: item.itemNm,
  						vrtyCd: item.vrtyCd,
  						vrtyNm: item.vrtyNm,
  						wholWght: item.wholWght,
  						emptVhclWght: item.emptVhclWght,
  						rdcdRt: item.rdcdRt,
  						actlWght: item.actlWght,
  						rdcdWght: item.rdcdWght,
  						wrhsWght: item.wrhsWght,
  						rmrk: item.rmrk,
  						apcNm: item.apcNm,
  						prdcrNm: item.prdcrNm,
  						prdcrIdentno: item.prdcrIdentno,
  						grdCd: item.grdCd,
  						grdNm: item.grdNm,
  						pltWght: item.pltWght,
  						bxQntt: item.bxQntt,
  						bxWght: item.bxWght,
  						invntrWght: item.invntrWght,
  						invntrQntt: item.invntrQntt,
  						warehouseSeCd: item.warehouseSeCd,
  						warehouseSeNm: item.warehouseSeNm,
  						gdsSeCd: item.gdsSeCd,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeCd: item.wrhsSeCd,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeCd: item.trsprtSeCd,
  						trsprtSeNm: item.trsprtSeNm,
  						stdGrd: item.stdGrd,
  						stdGrdCd: item.stdGrdCd,
  						strgLoctnCd : item.strgLoctnCd,
  						strgLoctnRow : item.strgLoctnRow,
  						strgLoctnCol : item.strgLoctnCol,
  						strgLoctnLvl : item.strgLoctnLvl,
  						acptnWght : item.acptnWght,
  						cnptNm : item.cnptNm,
  				}
  				jsonWghPrfmnc.push(wghPrfmnc);
  			});

          	grdWghPrfmnc.rebuild();


          	fn_onChangeWrhsSpmtType(wrhsSpmtType)

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	/**
	 * 거래처 팝업 필수 함수
	 * 시작
	 */
	const fn_choiceCnpt = function() {
		let cnptNm = SBUxMethod.get("dtl-inp-cnptNm");
		popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, cnptNm, fn_setCnpt);
	}
	const fn_setCnpt = function(cnpt) {
		if (!gfn_isEmpty(cnpt)) {
			SBUxMethod.set("dtl-inp-cnptCd", cnpt.cnptCd);
			SBUxMethod.set("dtl-inp-cnptNm", cnpt.cnptNm);
		}
	}

	/* 생산자 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_getPrdcrs
	 * @description 생산자 리스트 호출
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr 		= await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr 		= gfn_setFrst(jsonPrdcr);
	}

	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
 	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
	}
	/**
	 * @name fn_onInputPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onInputPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		if(getByteLengthOfString(prdcrNm.target.value) > 100){
			SBUxMethod.set("srch-inp-prdcrNm", "");
			return;
		}
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
		fn_setPrdcrForm(prdcr);
	}

 	/**
 	 * @name fn_clearPrdcr
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.set("srch-inp-prdcrIdentno", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup 호출
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback 처리
	 */
	const fn_setPrdcr = async function(prdcr) {

		await fn_getPrdcrs();

		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcr);
		}
	}

	const fn_setPrdcrForm = async function(prdcr) {

		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}

	}

	const fn_onChangeSrchPrdcrIdentno = function(obj) {

		if (gfn_isEmpty(SBUxMethod.get("srch-inp-prdcrIdentno"))) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue

		let prdcrIdentno = parseInt(SBUxMethod.get("srch-inp-prdcrIdentno")) || 0;

		if (prdcrIdentno < 1) {
			return;
		}

		const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
		if (gfn_isEmpty(prdcrInfo)) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
		SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		fn_setPrdcrForm(prdcrInfo);

	}



	/** ui event */

	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {
		fn_init();
	}

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>