<%
 /**
  * @Class Name : clclnPrfmncReg.jsp
  * @Description : 정산실적등록 화면
  * @author SI개발부
  * @since 2023.10.09
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.10.09   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 정산자료등록</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 정산자료등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnReset"
						name="btnReset"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="초기화"
						onclick="fn_reset"
					></sbux-button>
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="저장"
						onclick="fn_save"
					></sbux-button>
					<sbux-button
						id="btnDelete"
						name="btnDelete"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="삭제"
						onclick="fn_delete"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="조회"
						onclick="fn_search"
					></sbux-button>
				</div>
			</div>

			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>정산기준</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-clclnCrtrCd"
											name="srch-slt-clclnCrtrCd"
											uitype="single"
											unselected-text="전체"
											class="form-control input-sm input-sm-ast"
											jsondata-ref="jsonComClclnCrtrCd"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>정산일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-clclnYmdFrom"
									name="srch-dtp-clclnYmdFrom"
									uitype="popup"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChangeClclnYmd"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-clclnYmdTo"
									name="srch-dtp-clclnYmdTo"
									uitype="popup"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChangeClclnYmd"
								></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">확정여부</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-cfmtnYn"
											name="srch-slt-cfmtnYn"
											uitype="single"
											unselected-text="전체"
											class="form-control input-sm"
											jsondata-ref="jsonCfmtnYn"
										></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-itemCd"
											name="srch-slt-itemCd"
											uitype="single"
											unselected-text="전체"
											class="form-control input-sm"
											jsondata-ref="jsonApcItem"
											onchange="fn_onChangeSrchItemCd(this)"
										></sbux-select>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-vrtyCd"
											name="srch-slt-vrtyCd"
											uitype="single"
											unselected-text="전체"
											class="form-control input-sm"
											jsondata-ref="jsonApcVrty"
											onchange="fn_onChangeSrchVrtyCd(this)"
										></sbux-select>
									</div>
								</div>
							</td>
							<td></td>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									uitype="text"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchPrdcrCd"
									name="btnSrchPrdcrCD"
									uitype="modal"
									class="btn btn-xs btn-outline-dark"
									text="찾기" target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>정산 내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-clcln">0</span>건)</span>
						</li>
					</ul>
				 	<div class="ad_tbl_toplist_datepk">
				 		<table class="table table-bordered tbl_fixed">
				 			<caption>검색 조건 설정</caption>
						<colgroup>
							<col style="width: auto">
							<col style="width: 180px">
							<col style="width: 82px">
						</colgroup>
						<tbody>
							<tr>
								<td style="border-left:hidden"></td>
								<td class="td_input" style="border-right:hidden; border-left:hidden" >
									<sbux-datepicker
										id="srch-dtp-clclnYmd"
										name="srch-dtp-clclnYmd"
										uitype="popup"
										class="form-control input-sm sbux-pik-group-apc"
									></sbux-datepicker></td>
								<td class="td_input" style="border-right:hidden;">
									<sbux-button
										id="btnInsertClclnData"
										name="btnInsertClclnData"
										uitype="normal"
										class="btn btn-xs btn-outline-dark"
										text="정산자료생성"
										onclick="fn_insertClclnData"
									></sbux-button>
								</td>
							</tr>
						</tbody>
				 		</table>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdClclnPrfmnc" style="width:100%;height:544px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>

	<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal
	        id="modal-prdcr"
	        name="modal-prdcr"
	        uitype="middle"
	        header-title="생산자 선택"
	        body-html-id="body-modal-prdcr"
	        footer-is-close-button="false"
	        style="width:1100px"
        ></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">


	/* SB Select */
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComClclnCrtrCd	= [];	// 정산기준 	clclnCrtr	검색
	var jsonCfmtnYn			= [
			{text: "Y", value: "Y", label: "Y"},
			{text: "N", value: "N", label: "N"}
		];	// 확정여부 	cfmtnYn		검색

	/* 생산자 자동완성 */
    var jsonPrdcr = [];
    var jsonPrdcrAutocomplete = [];

    /* SBGrid */
	var grdClclnPrfmnc;
    /* SBGrid Data (JSON) */
	var jsonClclnPrfmnc = [];


	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, 		gv_selectedApcCd),						// 품목
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, 		gv_selectedApcCd),						// 품종
			gfn_setComCdSBSelect('srch-slt-clclnCrtrCd', 	jsonComClclnCrtrCd, 	'CLCLN_CRTR_CD')	// 정산기준
		]);
	}

	/**
	 * @name fn_getPrdcrs
     * @description 생산자 자동완성 JSON 설정
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {

		fn_createGrid();

		let result = await Promise.all([
				fn_initSBSelect(),
				fn_getPrdcrs()
			]);

		fn_clearForm();
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});


	function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdClclnPrfmnc';
	    SBGridProperties.id = 'grdClclnPrfmnc';
	    SBGridProperties.jsonref = 'jsonClclnPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.frozencols = 2;
        SBGridProperties.columns = [
			{caption : ["<input type='checkbox' onchange='fn_checkAll(grdClclnPrfmnc, this);'>"],
				ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center',
				userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
        	{caption: ["정산일자"], ref: 'clclnYmd', type:'output',  width:'120px', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
            },
            {caption: ['생산자'], 	ref: 'prdcrNm', 	type: 'output', width: '80px',	style: 'text-align:center'},
            {caption: ['정산기준'], 	ref: 'clclnCrtrNm', type: 'output', width: '100px', style: 'text-align:center'},
            {caption: ['입고구분'], 	ref: 'wrhsSeNm', 	type: 'output', width: '80px', 	style: 'text-align:center'},
            {caption: ['상품구분'], 	ref: 'gdsSeNm', 	type: 'output', width: '80px', 	style: 'text-align:center'},
            {caption: ['품목'], 		ref: 'itemNm', 		type: 'output', width: '80px', 	style: 'text-align:center'},
            {caption: ['품종'], 		ref: 'vrtyNm', 		type: 'output', width: '100px', style: 'text-align:center'},
            {caption: ['규격'], 		ref: 'spcfctNm',	type: 'output', width: '100px', style: 'text-align:center'},
            {caption: ['등급'], 		ref: 'grdNm', 		type: 'output', width: '80px', 	style: 'text-align:center'},
            {caption: ["수량"], 		ref: 'qntt', 		type: 'output', width:'80px',   style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ["중량 (kg)"], ref: 'wght', 		type: 'output', width:'100px',  style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ["계산금액 (원)"], 	ref: 'rkngAmt', 	type: 'output', width:'100px',  style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {
				caption: ["확정금액 (원)"],
				ref: 'cfmtnAmt',
				datatype: 'number',
				type:'input',
				width:'100px',
				style: 'text-align:right;background-color:#FFF8DC',
				userattr: {colNm: "cfmtnAmt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 14,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
			},
            {caption: ["확정여부"], ref: 'cfmtnYn', type:'combo',  width:'60px', style: 'text-align:center;',
            	userattr: {colNm: "cfmtnYn"},
            	typeinfo: {ref:'jsonCfmtnYn', label: 'label', value: 'value', oneclickedit: true, displayui : false}
            },
            {caption: [""], ref: '_', type:'output', width:'1px'},
            {caption: ["정산순번"], ref: 'clclnSn', type:'output', hidden: true},
            {caption: ["생산자코드"], ref: 'prdcrCd', type:'output', hidden: true},
            {caption: ["정산기준코드"], ref: 'clclnCrtrCd', type:'output', hidden: true},
            {caption: ["입고구분코드"], ref: 'wrhsSeCd', type:'output', hidden: true},
            {caption: ["상품구분코드"], ref: 'gdsSeCd', type:'output', hidden: true},
            {caption: ["품목코드"], ref: 'itemCd', type:'output', hidden: true},
            {caption: ["품종코드"], ref: 'vrtyCd', type:'output', hidden: true},
            {caption: ["규격코드"], ref: 'spcfctCd', type:'output', hidden: true},
            {caption: ["등급코드"], ref: 'grdCd', type:'output', hidden: true},
        ];

        grdClclnPrfmnc = _SBGrid.create(SBGridProperties);
        grdClclnPrfmnc.bind('valuechanged', fn_grdClclnPrfmncValueChanged);
    }

 	/**
     * @name fn_grdClclnPrfmncValueChanged
     * @description 정산실적 변경 event 처리
     * @function
     */
	const fn_grdClclnPrfmncValueChanged = function() {
		var nRow = grdClclnPrfmnc.getRow();
		var nCol = grdClclnPrfmnc.getCol();

		const usrAttr = grdClclnPrfmnc.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

			const rowData = grdClclnPrfmnc.getRowData(nRow, false);	// deep copy

			switch (usrAttr.colNm) {
				case "cfmtnAmt":
				case "cfmtnYn":
					rowData.checkedYn = "Y";
					grdClclnPrfmnc.refresh();
					break;

				case "checkedYn":
					if (rowData.checkedYn === "Y"
							&& rowData.cfmtnYn === "N"
							&& rowData.cfmtnAmt === 0) {
						rowData.cfmtnAmt = rowData.rkngAmt;
						grdClclnPrfmnc.refresh();
					}

				default:
					return;
			}
		}
	}

	/**
	 * @name fn_checkAll
	 * @description 전체 선택 체크박스
	 */
    function fn_checkAll(grid, obj) {
        var gridList = grid.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        //체크박스 열 index
        var getColRef = grid.getColRef("checkedYn");
    	var getRow = grid.getRow();
    	var getCol = grid.getCol();
        for (var i=0; i<gridList.length; i++) {
        	grid.setCol(getColRef);
        	grid.clickCell(i+1, getColRef);
            grid.setCellData(i+1, getColRef, checkedYn, true, false);
        }
    	grid.clickCell(getRow, getCol);
    }

	/**
	 * common button action
	 */

	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {

		let result = await Promise.all([
			fn_initSBSelect(),
			fn_getPrdcrs()
		]);

		fn_clearForm();
	}

	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
     const fn_reset = function() {
		fn_clearForm();
	}

 	/**
     * @name fn_delete
     * @description 삭제 버튼
     */
 	const fn_delete = async function() {

 		const allData = grdClclnPrfmnc.getGridDataAll();

		const clclnPrfmncList = [];

		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {

				clclnPrfmncList.push({
					apcCd: item.apcCd,
					clclnYmd: item.clclnYmd,
					clclnSn: item.clclnSn
    			});
    		}
		});

		if (clclnPrfmncList.length == 0) {
			gfn_comAlert("W0005", "삭제대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "삭제")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

    	const postJsonPromise = gfn_postJSON("/am/clcln/deleteClclnPrfmncList.do", clclnPrfmncList);
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

    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {

		const allData = grdClclnPrfmnc.getGridDataAll();

		const clclnPrfmncList = [];

		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {

				clclnPrfmncList.push({
					apcCd: item.apcCd,
					clclnYmd: item.clclnYmd,
					clclnSn: item.clclnSn,
					cfmtnAmt: item.cfmtnAmt,
					cfmtnYn: item.cfmtnYn
    			});
    		}
		});

		if (clclnPrfmncList.length == 0) {
			gfn_comAlert("W0005", "변경대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
    	const postJsonPromise = gfn_postJSON("/am/clcln/updateClclnPrfmncList.do", clclnPrfmncList);
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

	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
    	fn_setGrdClclnPrfmnc();
	}

    /**
     * @name fn_setGrdClclnPrfmnc
     * @description 정산내역 조회
     */
	const fn_setGrdClclnPrfmnc = async function() {

   		let clclnCrtrCd = SBUxMethod.get("srch-slt-clclnCrtrCd");	// 정산기준코드
   		let clclnYmdFrom = SBUxMethod.get("srch-dtp-clclnYmdFrom");	// 정산일자 from
   		let clclnYmdTo = SBUxMethod.get("srch-dtp-clclnYmdTo");	// 정산일자 to
   		let cfmtnYn = SBUxMethod.get("srch-slt-cfmtnYn");		// 확정여부

  		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");	// 생산자
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");	// 품목
  		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");	// 품종

		const postJsonPromise = gfn_postJSON("/am/clcln/selectClclnPrfmncList.do", {
			apcCd: gv_selectedApcCd,
			clclnCrtrCd: clclnCrtrCd,
			clclnYmdFrom: clclnYmdFrom,
			clclnYmdTo: clclnYmdTo,
			cfmtnYn: cfmtnYn,

			prdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd
  		});

        const data = await postJsonPromise;

  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonClclnPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
          		const clclnPrfmnc = {
  						apcCd: item.apcCd,
  						clclnYmd: item.clclnYmd,
  						clclnSn: item.clclnSn,
  						clclnCrtrCd: item.clclnCrtrCd,
  						prdcrCd: item.prdcrCd,
  						prdcrNm: item.prdcrNm,
  						itemCd: item.itemCd,
  						vrtyCd: item.vrtyCd,
  						spcfctCd: item.spcfctCd,
  						wrhsSeCd: item.wrhsSeCd,
  						gdsSeCd: item.gdsSeCd,
  						qntt: item.qntt,
  						wght: item.wght,
  						rkngAmt: item.rkngAmt,
  						cfmtnAmt: item.cfmtnAmt,
  						cfmtnYn: item.cfmtnYn,
  						itemNm: item.itemNm,
  						vrtyNm: item.vrtyNm,
  						spcfctNm: item.spcfctNm,
  						clclnCrtrNm: item.clclnCrtrNm,
  						wrhsSeNm: item.wrhsSeNm,
  						gdsSeNm: item.gdsSeNm,
  						grdNm: item.grdNm
  				}

          		jsonClclnPrfmnc.push(clclnPrfmnc);
  			});

          	totalRecordCount = jsonClclnPrfmnc.length;
          	grdClclnPrfmnc.rebuild();

          	document.querySelector('#cnt-clcln').innerText = totalRecordCount;

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
	}

	/**
     * @name fn_insertClclnData
     * @description 정산실적 생성
     * @function
	 */
	const fn_insertClclnData = async function() {

		let clclnYmd = SBUxMethod.get("srch-dtp-clclnYmd");
		let clclnCrtrCd = SBUxMethod.get("srch-slt-clclnCrtrCd")


		if(gfn_isEmpty(clclnYmd)){
			gfn_comAlert("W0002", "정산일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}

		const postJsonPromise = gfn_postJSON("/am/clcln/insertClclnPrfmncCrt.do", {
			apcCd			: gv_selectedApcCd,
			clclnYmd		: clclnYmd,
			prfmncYmdFrom	: clclnYmd,
			prfmncYmdTo		: clclnYmd,
			clclnCrtrCd		: clclnCrtrCd
  		});
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


 	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {

 		// 일자
		let ymd = gfn_dateToYmd(new Date());
		SBUxMethod.set("srch-dtp-clclnYmdFrom", ymd);
		SBUxMethod.set("srch-dtp-clclnYmdTo", ymd);
		SBUxMethod.set("srch-dtp-clclnYmd", ymd);

		// 정산기준
		SBUxMethod.set("srch-slt-clclnCrtrCd", null);
		// 품목
		SBUxMethod.set("srch-slt-itemCd", null);
		// 품종
		SBUxMethod.set("srch-slt-vrtyCd", null);

		// 생산자
		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");

		// 확정여부
		SBUxMethod.set("srch-slt-cfmtnYn", null);

		fn_onChangeSrchItemCd({value: null});
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;
		await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd);
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

		const vrtyInfo = _.find(jsonApcVrty, {value: vrtyCd});
		const itemCd = vrtyInfo.mastervalue;

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
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
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}
 	/**
 	 * @name fn_setPrdcrForm
 	 * @description 생산자 폼 Set
 	 */
	const fn_setPrdcrForm = async function(prdcr) {

		if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
			await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
			SBUxMethod.set("srch-slt-vrtyCd", prdcr.rprsVrtyCd);
			fn_onChangeSrchVrtyCd({value:prdcr.rprsVrtyCd});
		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
					fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
				}
			}
		}
	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup
	 */
	const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}
	/**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback
	 */
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcr);
		}
	}

	/**
 	 * @name fn_dtpChangeClclnYmd
 	 * @description 일자 역전 방지
 	 */
	const fn_dtpChangeClclnYmd = function(){
 		let clclnYmdFrom = SBUxMethod.get("srch-dtp-clclnYmdFrom");
 		let clclnYmdTo = SBUxMethod.get("srch-dtp-clclnYmdTo");
 		if(gfn_diffDate(clclnYmdFrom, clclnYmdTo) < 0){
 			gfn_comAlert("W0014", "종료일자", "시작일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
 			SBUxMethod.set("srch-dtp-clclnYmdFrom", gfn_dateToYmd(new Date()));
 			SBUxMethod.set("srch-dtp-clclnYmdTo", gfn_dateToYmd(new Date()));
 			return;
 		}
 	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>