<%
 /**
  * @Class Name : regPckgInpt.jsp
  * @Description : 포장실적등록 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	신정철			최초 생성
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
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 포장실적등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
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
						<col style="width: 9%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>선별일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-sortYmdFrom" name="srch-dtp-sortYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm" onchange="fn_dtpChange(srch-dtp-sortYmdFrom)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-sortYmdTo" name="srch-dtp-sortYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm" onchange="fn_dtpChange(srch-dtp-sortYmdTo)"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm-ast"
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
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									jsondata-ref="jsonApcVrty"
									onchange="fn_onChangeSrchVrtyCd(this)"
								/>
							</td>
							<td></td>
							<th scope="row"  class="th_bg"><span class="data_required" ></span>규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-spcfctCd"
									name="srch-slt-spcfctCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									jsondata-ref="jsonApcSpcfct"
									jsondata-text="spcfctNm"
									jsondata-value="spcfctCd"
									onchange="fn_onChangeSrchSpcfctCd(this)"
								/>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>선별재고 내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-SortInvntr">0</span>건)</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdSortInvntr" style="width:100%;height:235px;"></div>
				</div>
				
				<br/>

				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 9%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 1%">
						<col style="width: 6%">
						<col style="width: 2%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>포장일자</th>
				          	<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="dtl-dtp-pckgYmd"
									name="dtl-dtp-pckgYmd"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm"
									onchange="fn_dtpChangePckg(dtl-dtp-pckgYmd)"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>포장기</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-slt-fcltCd"
									name="dtl-slt-fcltCd"
									uitype="single" class="form-control input-sm inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComPckgFclt"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">투입/포장</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-inptWght"
									name="dtl-inp-inptWght"
									class="form-control input-sm"
									maxlength="6"
									autocomplete="off"
									readonly
									mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">&nbsp;/</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-pckgWght"
									name="dtl-inp-pckgWght"
									class="form-control input-sm input-sm-ast"
									maxlength="6"
									autocomplete="off"
									readonly
									mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
								/>
							</td>
							<td class="td_input">Kg</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li><span>포장실적 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="서식받기" class="btn btn-sm btn-outline-danger" onclick="fn_dwnld" ></sbux-button>
						<sbux-button id="btnUpload" name="btnUpload" uitype="normal" text="올리기" class="btn btn-sm btn-outline-danger" onclick="fn_upload"></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdPckgPrfmnc" style="width:100%;height:200px;"></div>
				</div>
				<!--[pp] //검색결과 -->

				<div class="exp-div-excel" style="display: none;width: 1000px;">
					<div id="sbexp-area-grdExpPckgPrfmnc" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpItem" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpVrty" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpPrdcr" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpWarehouse" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpSpcfct" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpPckgFclt" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpGdsGrd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpSpmtPckgUnit" style="height:1px; width: 100%;"></div>
					<sbux-select id="excel-slt-prdcr"
								name="excel-slt-prdcr"
								uitype="single"
								unselected-text="전체"
								class="form-control input-sm"
								jsondata-ref="jsonExeclComPrdcr"
					></sbux-select>
					<sbux-select id="excel-slt-spmtPckgUnit"
								name="excel-slt-spmtPckgUnit"
								uitype="single"
								unselected-text="전체"
								class="form-control input-sm"
								jsondata-ref="jsonExeclComSpmtPckgUnit"
					></sbux-select>
					<sbux-select id="excel-slt-spcfct"
								name="excel-slt-spcfct"
								uitype="single"
								unselected-text="전체"
								class="form-control input-sm"
								jsondata-ref="jsonExeclSpcfct"
					></sbux-select>
					<sbux-select id="excel-slt-warehouse"
								name="excel-slt-warehouse"
								uitype="single"
								unselected-text="전체"
								class="form-control input-sm"
								jsondata-ref="jsonExeclComWarehouse"
					></sbux-select>
					<sbux-select id="excel-slt-gdsGrd"
								name="excel-slt-gdsGrd"
								uitype="single"
								unselected-text="전체"
								class="form-control input-sm"
								jsondata-ref="jsonExeclComGdsGrd"
					></sbux-select>
					<sbux-select id="excel-slt-vrty"
								name="excel-slt-vrty"
								uitype="single"
								unselected-text="전체"
								class="form-control input-sm"
								jsondata-ref="jsonExeclComVrty"
					></sbux-select>
					<input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="importExcelData(event)">
				</div>
			</div>
		</div>
	</section>

    <!-- IMPORT 엑셀 등록 Modal -->
    <div>
        <sbux-modal
        	id="modal-imp"
        	name="modal-imp"
        	uitype="middle"
        	header-title="선별실적등록(Excel)"
        	body-html-id="body-modal-imp"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:1000px"
		></sbux-modal>
    </div>
    <div id="body-modal-imp">
    	<jsp:include page="../../am/popup/importExcelPopup.jsp"></jsp:include>
    </div>
    
	<!--  출하실적엑셀 팝업 -->
    <div>
		<sbux-modal id="modal-excel-pckgPrfmnc" name="modal-excel-pckgPrfmnc"
			uitype="middle"
			header-title="선별실적등록"
			body-html-id="body-modal-excelPckgPrfmnc"
			footer-is-close-button="false"
			header-is-close-button="false"
			style="width:1000px"
		></sbux-modal>
	</div>
    <div id="body-modal-excelPckgPrfmnc">
    	<jsp:include page="../../am/popup/pckgPrfmncExcelPopup.jsp"></jsp:include>
    </div>
    <sbux-button id="btnPckgPrfmncPopup" name="btnPckgPrfmncPopup" uitype="modal" text="엑셀등록" style="width:100%; display:none" class="btn btn-sm btn-outline-dark" target-id="modal-excel-pckgPrfmnc"></sbux-button>
</body>
<script type="text/javascript">

	const lv_paging = {
		'type' : 'page',
	  	'count' : 5,
	  	'size' : 20,
	  	'sorttype' : 'page',
	  	'showgoalpageui' : true
    };

	/* SB Select */
	var jsonApcItem			= [];	// 품목 		itemCd
	var jsonApcVrty			= [];	// 품종 		vrtyCd
	var jsonApcSpcfct		= [];	// 규격 		spcfctCd
	var jsonApcGrd			= [];	// 등급 		grdCd
	var jsonComPckgFclt		= [];	// 포장설비 	PCKG_FCLT_CD
	var jsonComWarehouse	= [];	// 창고		WAREHOUSE_SE_CD
	var jsonComGdsGrd		= [];	// 상품등급	GDS_GRD
	var jsonSpmtPckgUnit	= [];	// 출하포장단위

	var jsonExeclComSpmtPckgUnit 	= []; 	// 엑셀 출하포장단위
	var jsonExeclComWarehouse 		= []; 	// 엑셀 창고
	var jsonExeclComPrdcr			= [];	// 엑셀 생산자
	var jsonExeclSpcfct				= [];	// 엑셀 규격
	var jsonExeclComGdsGrd			= [];	// 엑셀 등급
	var jsonExeclComVrty			= [];	// 엑셀 품종

	/* SBGrid */
	var grdSortInvntr;
	var grdPckgPrfmnc;

    /* SBGrid Data (JSON) */
	var jsonSortInvntr = [];
    var jsonPckgPrfmnc = [];


	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {
		
		let firstYmd = gfn_dateFirstYmd(new Date());
		let nowYmd = gfn_dateToYmd(new Date());
		
		SBUxMethod.set("srch-dtp-sortYmdFrom", firstYmd);
		SBUxMethod.set("srch-dtp-sortYmdTo", nowYmd);
		SBUxMethod.set("dtl-dtp-pckgYmd", nowYmd);

		await fn_initSBSelect();
		fn_createGridSortInvntr();
		fn_createGridPckgPrfmnc();

		fn_clearForm();
	}

	/**
	 * @name fn_initSBSelect
	 * @description init SBSelect
	 */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let result = await Promise.all([
		 	gfn_setComCdSBSelect('dtl-slt-fcltCd',					jsonComPckgFclt, 			'PCKG_FCLT_CD', 	gv_selectedApcCd),	// 설비
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 				jsonApcItem, 				gv_selectedApcCd),						// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 				jsonApcVrty, 				gv_selectedApcCd),						// 품종
		 	gfn_setComCdSBSelect('excel-slt-warehouse',				jsonExeclComWarehouse, 		'WAREHOUSE_SE_CD', 	gv_selectedApcCd),	// 창고(엑셀)
		 	gfn_setComCdSBSelect('excel-slt-gdsGrd',				jsonExeclComGdsGrd, 		'GDS_GRD'),								// 등급(엑셀)
		 	gfn_setPrdcrSBSelect('excel-slt-prdcr', 				jsonExeclComPrdcr, 			gv_selectedApcCd),						// 생산자(엑셀)
		 	gfn_setApcVrtySBSelect('excel-slt-vrty', 				jsonExeclComVrty, 			gv_selectedApcCd),						// 품종(엑셀)
		 	gfn_setApcSpcfctsSBSelect('excel-slt-spcfct', 			jsonExeclSpcfct, 			gv_selectedApcCd),						// 규격(엑셀)
		 	gfn_setSpmtPckgUnitSBSelect('excel-slt-spmtPckgUnit', 	jsonExeclComSpmtPckgUnit, 	gv_selectedApcCd),						// 포장구분(엑셀)

		 	//fn_getApcGrd(),
		 	fn_getApcSpcfct(),
		 	fn_getComData()
	 	]);
	}

	const fn_getComData = async function() {
		let result = await Promise.all([
			gfn_getComCdDtls('WAREHOUSE_SE_CD', gv_selectedApcCd),
			gfn_getComCdDtls('GDS_GRD'),
		]);
		jsonComWarehouse = result[0];
		jsonComGdsGrd = result[1];
	}

	const fn_dtpChange = function(){
		let sortYmdFrom = SBUxMethod.get("srch-dtp-sortYmdFrom");
		let sortYmdTo = SBUxMethod.get("srch-dtp-sortYmdTo");
		if(gfn_diffDate(sortYmdFrom, sortYmdTo) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
			SBUxMethod.set("srch-dtp-sortYmdFrom", gfn_dateToYmd(new Date()));
			SBUxMethod.set("srch-dtp-sortYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}

	const fn_dtpChangePckg = function(){
		let sortYmdFrom = SBUxMethod.get("srch-dtp-sortYmdFrom");
		let pckgYmd = SBUxMethod.get("dtl-dtp-pckgYmd");
		if(gfn_diffDate(sortYmdFrom, pckgYmd) < 0){
			gfn_comAlert("E0000", "포장일자는 선별재고일자보다 이전 일 수 없습니다.");		//	W0001	{0}
			SBUxMethod.set("dtl-dtp-pckgYmd", sortYmdFrom);
			return;
		}
	}


	/**
	 * @name fn_getApcSpcfct
     * @description APC규격 JSON 설정
     * @function
	 * @param {string} itemCd
	 */
	const fn_getApcSpcfct = async function(itemCd) {

		jsonApcSpcfct.length = 0;

		if (gfn_isEmpty(itemCd)) {
			return;
		}

		jsonApcSpcfct = await gfn_getApcSpcfcts(gv_selectedApcCd, itemCd);
		SBUxMethod.refresh("srch-slt-spcfctCd");
		grdPckgPrfmnc.refresh({"combo":true});
	}

	/**
	 * @name fn_getApcGrd
     * @description 등급 JSON 설정
     * @function
	 * @param {string} itemCd
	 */
	const fn_getApcGrd = async function(itemCd) {

		 jsonApcGrd.length = 0;

		if (gfn_isEmpty(itemCd)) {
			return;
		}

		jsonApcGrd = await gfn_getApcGrds(gv_selectedApcCd, itemCd);
	}

	/** [START] 표준등급 script */
    /* 등급 json */
    
/*
    var jsonStdGrdKnd = [];
    var jsonStdGrdJgmt = [];
    var jsonStdGrdDtl = [];
    var jsonStdGrd_1 = [];
    var jsonStdGrd_2 = [];
    var jsonStdGrd_3 = [];
    var jsonStdGrd_4 = [];
    var jsonStdGrd_5 = [];

    const stdGrdIdList = ['1', '2', '3', '4', '5'];
    const stdGrdJsonList = [
    		'jsonStdGrd_1',
    		'jsonStdGrd_2',
    		'jsonStdGrd_3',
    		'jsonStdGrd_4',
    		'jsonStdGrd_5'
    	];
	const fn_getStdGrdJson = function(id) {
		switch (id) {
			case '1': return jsonStdGrd_1;
			case '2': return jsonStdGrd_2;
			case '3': return jsonStdGrd_3;
			case '4': return jsonStdGrd_4;
			case '5': return jsonStdGrd_5;
			default: return null;
		}
	}
*/
	/**
	 * @name fn_getStdGrd
	 * @description 표준등급 json set
	 */
	const fn_getStdGrd = async function(_itemCd) {
		gStdGrdObj.init(gv_selectedApcCd, _GRD_SE_CD_GDS, _itemCd);
		console.log(gjsonStdGrdObjKnd);
		/*
		jsonStdGrdKnd.length = 0;
		jsonStdGrdDtl.length = 0;
		jsonStdGrdJgmt.length = 0;

	    jsonStdGrd_1.length = 0;
	    jsonStdGrd_2.length = 0;
	    jsonStdGrd_3.length = 0;
	    jsonStdGrd_4.length = 0;
	    jsonStdGrd_5.length = 0;

		if (gfn_isEmpty(itemCd)) {
			return;
		}

		let rslt = await Promise.all([
		    gfn_getStdGrds(gv_selectedApcCd, _GRD_SE_CD_GDS, itemCd),
		    gfn_getStdGrdJgmts(gv_selectedApcCd, _GRD_SE_CD_GDS, itemCd),
		    gfn_getStdGrdDtls(gv_selectedApcCd, _GRD_SE_CD_GDS, itemCd)
		]);

		jsonStdGrdKnd = rslt[0];
		jsonStdGrdJgmt = rslt[1];
		jsonStdGrdDtl = rslt[2];

		jsonStdGrdKnd.forEach((item, index) => {
			const id = stdGrdIdList[index];
			let jsonObj = fn_getStdGrdJson(id);
			const dtls = gfn_getJsonFilter(jsonStdGrdDtl, "grdKnd", item.grdKnd);
			dtls.forEach((item) => {
				jsonObj.push(item);
			});
		});
		*/
	}

	/** [END] 표준등급 script */


	/**
	 * @name fn_getSpmtPckgUnit
     * @description APC출하포장단위 JSON 설정
     * @function
	 * @param {string} itemCd
	 * @param {string} vrtyCd
	 */
	const fn_getSpmtPckgUnit = async function(itemCd, vrtyCd, spcfctCd) {

		 jsonSpmtPckgUnit.length = 0;

		if (gfn_isEmpty(itemCd)) {
			return;
		}
		if (gfn_isEmpty(vrtyCd)) {
			return;
		}
		if (gfn_isEmpty(spcfctCd)) {
			//return;
		}

		jsonSpmtPckgUnit = await gfn_getSpmtPckgUnits(gv_selectedApcCd, itemCd, vrtyCd, spcfctCd);
		grdPckgPrfmnc.refresh({"combo":true});
	}

	/**
	 * @name fn_createGridSortInvntr
     * @description 선별재고 SBGrid 생성
     * @function
	 */
	function fn_createGridSortInvntr() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSortInvntr';
	    SBGridProperties.id = 'grdSortInvntr';
	    SBGridProperties.jsonref = 'jsonSortInvntr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
			{caption : ["선택","선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center', userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ['선별번호','선별번호'], 		ref: 'sortno', 			width: '110px', type: 'output', style: 'text-align:center'},
            {caption: ['등급','등급'], 				ref: 'grdNm', 			width: '60px', 	type: 'output', style: 'text-align:center'},
            {caption: ['품목','품목'], 				ref: 'itemNm', 			width: '80px', 	type: 'output', style: 'text-align:center'},
            {caption: ['품종','품종'], 				ref: 'vrtyNm', 			width: '80px', 	type: 'output', style: 'text-align:center'},
            {caption: ['대표생산자','대표생산자'], 	ref: 'rprsPrdcrNm', 	width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ["창고","창고"],				ref: 'warehouseSeNm', 	width: '120px',	type:'output',  style: 'text-align:center'},
            {caption: ['선별재고','수량'], 			ref: 'invntrQntt', 		width: '60px', 	type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['선별재고','중량'], 			ref: 'invntrWght', 		width: '60px', 	type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,### Kg'}},
            {caption: ["선별재고","재고규격"],		ref: 'spcfctNm', 		width: '120px',	type:'output',  style: 'text-align:center'},
            {caption: ['포장지시','지시번호'], 		ref: 'pckgCmndno', 		width: '110px', type: 'output', style: 'text-align:center'},
            {caption: ['포장지시','지시설비'], 		ref: 'pckgFcltNm', 		width: '80px', 	type: 'output', style: 'text-align:center'},
            {caption: ['포장지시','수량'], 			ref: 'cmndQntt', 		width: '60px', 	type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ['포장지시','중량'], 			ref: 'cmndWght', 		width: '60px', 	type: 'output', style: 'text-align:right', format : {type:'number', rule:'#,### Kg'}},
            {caption: ["포장투입","수량"], 			ref: 'inptQntt',  		width: '80px', 	type:'input',  	style: 'text-align:right;background-color:#FFF8DC;',
            	userattr: {colNm: "inptQntt"},
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
            		maxlength: 6,
            		oneclickedit: true
				},
				format : {type:'number', rule:'#,###'}
            },
            {caption: ["포장투입","중량"], 			ref: 'inptWght',  		type:'input',  width:'80px', style: 'text-align:right;background-color:#FFF8DC;',
            	userattr: {colNm: "inptWght"},
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
            		maxlength: 6,
            		oneclickedit: true
				},
				format : {type:'number', rule:'#,### Kg'}
         	},
 	        {caption: ["대표생산자코드"],		ref: 'rprsPrdcrCd',   	type:'output',  hidden: true},
	        {caption: ["품목코드"],				ref: 'itemCd',   		type:'output',  hidden: true},
	        {caption: ["품종코드"],				ref: 'vrtyCd',   		type:'output',  hidden: true},
	        {caption: ["등급코드"],				ref: 'grdCd',   		type:'output',  hidden: true},
	        {caption: ["규격코드"],				ref: 'spcfctCd',   		type:'output',  hidden: true},
	        {caption: ["상품구분코드"],			ref: 'gdsSeCd',   		type:'output',  hidden: true},
	        {caption: ["입고구분코드"],			ref: 'wrhsSeCd',   		type:'output',  hidden: true},
	        {caption: ["창고구분코드"],			ref: 'warehouseSeCd', 	type:'output',	hidden: true},
	        {caption: ["설비"],					ref: 'fcltCd', 			type:'output',	hidden: true},
	        {caption: ["선별순번"],				ref: 'sortSn', 			type:'output',	hidden: true},
            {caption: ["지시비고","지시비고"],   ref: 'rmrk',        	type:'output',  width:'200px'}

        ];
        grdSortInvntr = _SBGrid.create(SBGridProperties);
        grdSortInvntr.bind('valuechanged', fn_grdSortInvntrValueChanged);
    }

    /**
     * @name fn_setGrdSortInvntr
     * @description 선별재고내역 조회
     */
	const fn_setGrdSortInvntr = async function() {
		let sortYmdFrom = SBUxMethod.get("srch-dtp-sortYmdFrom");	// 선별일자from
        let sortYmdTo = SBUxMethod.get("srch-dtp-sortYmdTo");       // 선별일자to
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");				// 품목
  		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");				// 품종
  		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");			// 규격

  		if (gfn_isEmpty(itemCd)) {
  			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
            return;
  		}

  		if (gfn_isEmpty(vrtyCd)) {
  			gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
            return;
  		}

  		if (gfn_isEmpty(spcfctCd)) {
  			gfn_comAlert("W0001", "규격");		//	W0002	{0}을/를 선택하세요.
            return;
  		}

		const postJsonPromise = gfn_postJSON("/am/invntr/selectSortInvntrList.do", {
			apcCd: gv_selectedApcCd,
			sortYmdFrom: sortYmdFrom,
			sortYmdTo: sortYmdTo,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			spcfctCd: spcfctCd

          	// pagination
  	  		//pagingYn : 'Y',
  			//currentPageNo : pageNo,
   		  	//recordCountPerPage : pageSize
  		});

        const data = await postJsonPromise;

  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonSortInvntr.length = 0;
      		console.log(data)
          	data.resultList.forEach((item, index) => {
          		const sortInvntr = {
          				apcCd			: item.apcCd,
          				sortno			: item.sortno,
          				sortSn			: item.sortSn,
          				sortYmd			: item.sortYmd,
          				fcltCd			: item.fcltCd,
          				rprsPrdcrCd		: item.rprsPrdcrCd,
          				itemCd			: item.itemCd,
          				vrtyCd			: item.vrtyCd,
          				spcfctCd		: item.spcfctCd,
          				grdCd			: item.grdCd,
          				gdsSeCd			: item.gdsSeCd,
          				wrhsSeCd		: item.wrhsSeCd,
          				warehouseSeCd	: item.warehouseSeCd,
          				prdctnYr		: item.prdctnYr,
          				sortQntt		: item.sortQntt,
          				sortWght		: item.sortWght,
          				pckgQntt		: item.pckgQntt,
          				pckgWght		: item.pckgWght,
          				invntrQntt		: item.invntrQntt,
          				invntrWght		: item.invntrWght,
          				apcNm			: item.apcNm,
          				fcltNm			: item.fcltNm,
          				rprsPrdcrNm		: item.rprsPrdcrNm,
          				itemNm			: item.itemNm,
          				vrtyNm			: item.vrtyNm,
          				spcfctNm		: item.spcfctNm,
          				grdNm			: item.grdNm,
          				gdsSeNm			: item.gdsSeNm,
          				wrhsSeNm		: item.wrhsSeNm,
          				warehouseSeNm	: item.warehouseSeNm,
          				pckgCmndno		: item.pckgCmndno,
          				cmndQntt		: item.cmndQntt,
          				cmndWght		: item.cmndWght,
          				inptQntt		: item.inptQntt,
          				inptWght		: item.inptWght,
          				rmrk			: item.rmrk,
          				pckgFcltCd		: item.pckgFcltCd,
          				pckgFcltNm		: item.pckgFcltNm,
  				}
          		jsonSortInvntr.push(sortInvntr);

				/*
  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
				 */
  			});

          	grdSortInvntr.refresh({"combo":true});
          	totalRecordCount = jsonSortInvntr.length;
          	document.querySelector('#cnt-SortInvntr').innerText = totalRecordCount;
          	
		} catch (e) {
			if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
		}
	}


	/**
	 * @name fn_createGridPckgPrfmnc
     * @description 포장등록 SBGrid 생성
     * @function
	 */
	function fn_createGridPckgPrfmnc() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgPrfmnc';
	    SBGridProperties.id = 'grdPckgPrfmnc';
	    SBGridProperties.jsonref = 'jsonPckgPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.extendlastcol = 'scroll';

        SBGridProperties.columns = [
        	{caption: ["처리"], 		ref: 'itemCd', 		type:'button', width:'60px', style: 'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if (gfn_isEmpty(strValue)){
	            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
					}
		    }},
            {caption: ["포장일자"],	ref: 'pckgYmd',		type:'output',  width:'120px', style: 'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["포장기"], 	ref: 'fcltCd',		type:'combo',  	width:'100px', style: 'text-align:center',
            	typeinfo: {ref:'jsonComPckgFclt', label:'label', value:'value', displayui : false}
            },
            {caption: ["선별규격"],		ref: 'spcfctCd',	type:'combo',  	width:'100px', style: 'text-align:center',
            	userattr: {colNm: "spcfctCd"},
            	typeinfo: {ref:'jsonApcSpcfct', label:'spcfctNm', value:'spcfctCd', displayui : false, unselect: {label : '선택', value: 'notSelect'}}
            },
        ];

		const columnsStdGrd = [];
		gjsonStdGrdObjKnd.forEach((item, index) => {
			//const _jsonId = stdGrdJsonList[index];
			const _jsonId = gStdGrdObj.jsonPrefix + gStdGrdObj.idList[index];
			const grd = {
				caption: [item.grdKndNm],
				ref: item.grdKnd,
				type:'combo',
				width:'80px',
				style: 'text-align:center;background-color:#FFF8DC;',
				userattr: {colNm: "stdGrd"},
				typeinfo: {ref: _jsonId, label:'grdNm', value:'grdCd', displayui : false, oneclickedit: true, unselect: {label : '선택', value: 'notSelect'}}
			}
			columnsStdGrd.push(grd);
		});

		if (gjsonStdGrdObjKnd.length > 1 && gjsonStdGrdObjJgmt.length > 0) {
			jsonStdGrdJgmt.forEach((item, index) => {
				const jgmtGrd = {
					caption: ["판정등급"],
					ref: "jgmtGrdCd",
					type:'combo',
					width:'80px',
					style: 'text-align:center;',
					userattr: {colNm: "jgmtGrd"},
					typeinfo: {ref: gStdGrdObj.jgmtJsonId, label:'grdNm', value:'grdCd', displayui : false, unselect: {label : '선택', value: 'notSelect'}}
				}
				SBGridProperties.columns.push(jgmtGrd);
				return false;
			});
		}

		if (columnsStdGrd.length > 0) {
			columnsStdGrd.forEach((item, index) => {
				SBGridProperties.columns.push(item);
			});
		} else {
			SBGridProperties.columns.push({
				caption: ["상품등급"],	ref: 'gdsGrd',	type:'combo',  	width:'100px', style: 'text-align:center;background-color:#FFF8DC;',
            	typeinfo: {ref:'jsonComGdsGrd', label:'cdVlNm', value:'cdVl', oneclickedit: true, unselect: {label : '선택', value: 'notSelect'}}
            });
		}

        const columns2 = [
            {caption: ["포장규격"],		ref: 'spmtPckgUnitCd',	type:'combo',  	width:'200px', style: 'text-align:center;background-color:#FFF8DC;',
            	userattr: {colNm: "spmtPckgUnitCd"},
            	typeinfo: {ref:'jsonSpmtPckgUnit', label:'spmtPckgUnitNm', value:'spmtPckgUnitCd', displayui : false, unselect: {label : '선택', value: 'notSelect'}}
            },
            {caption: ["포장수량"], 			ref: 'pckgQntt',  		type:'input',  width:'80px', style: 'text-align:right;background-color:#FFF8DC;',
            	userattr: {colNm: "pckgQntt"},
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
            		maxlength: 6,
            		oneclickedit: true
				},
				format : {type:'number', rule:'#,###'}
            },
            {caption: ["포장중량"], 			ref: 'pckgWght',  		type:'input',  width:'80px', style: 'text-align:right;background-color:#FFF8DC;',
            	userattr: {colNm: "pckgWght"},
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
            		maxlength: 6,
            		oneclickedit: true
				},
				format : {type:'number', rule:'#,### Kg'}
         	},
            {caption: ["창고"],	ref: 'warehouseSeCd',    type:'combo',  width:'100px', style: 'text-align:center;background-color:#FFF8DC;',
           	 	typeinfo: {ref:'jsonComWarehouse', label:'cdVlNm', value:'cdVl', oneclickedit: true, unselect: {label : '선택', value: 'notSelect'}}
            },
            {caption: ["비고"], ref: 'rmrk', width: '400px', type: 'input',
            	typeinfo: {oneclickedit: true},
            },
	        {caption: ["규격단중"], ref: 'spcfctWght', 	type:'output',	hidden: true},
		];
		columns2.forEach((item, index) => {
			SBGridProperties.columns.push(item);
		});

        grdPckgPrfmnc = _SBGrid.create(SBGridProperties);
        grdPckgPrfmnc.bind('valuechanged', fn_grdPckgPrfmncValueChanged);

        console.log("add row");
		let nRow = grdPckgPrfmnc.getRows();
		grdPckgPrfmnc.addRow(true);
		grdPckgPrfmnc.setCellDisabled(nRow, 0, nRow, grdPckgPrfmnc.getCols() - 1, true);
		grdPckgPrfmnc.refresh({"combo":true});
    }


	/**
	 * common button action
	 */

	/**
	 * @name fn_search
     * @description 조회 버튼
     * @function
	 */
	const fn_search = async function() {

        // set pagination
    	grdSortInvntr.rebuild();
    	// grid clear
    	jsonSortInvntr.length = 0;
    	fn_setGrdSortInvntr();

    	jsonPckgPrfmnc.length = 0;
    	fn_createGridPckgPrfmnc();

    	//fn_clearForm();
	}

	/**
	 * @name fn_save
     * @description 저장 버튼
     * @function
	 */
	const fn_save = async function() {

		// 선별재고 내역

		// 입고번호, 재고량, 투입량
		const sortInvntrList = [];
		const allInvntrData = grdSortInvntr.getGridDataAll();
		console.log(allInvntrData);
		let invntrInptQntt = 0;
		let invntrInptWght = 0;

		allInvntrData.forEach((item, index) => {
			if (item.checkedYn === "Y") {

    			let inptQntt = parseInt(item.inptQntt) || 0;
    			let inptWght = parseInt(item.inptWght) || 0;

    			sortInvntrList.push({
    				sortno: item.sortno,
    				sortSn: item.sortSn,
    				pckgCmndno: item.pckgCmndno,
    				inptQntt: inptQntt,
    				inptWght: inptWght
    			});

    			invntrInptQntt += inptQntt;
    			invntrInptWght += inptWght;
    		}
		});

		if (sortInvntrList.length == 0) {
			gfn_comAlert("W0005", "선별재고대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// 실적내역
		const pckgPrfmncList = [];
		const allPckgData = grdPckgPrfmnc.getGridDataAll();

		let totPckgInptQntt = 0;
		let totPckgInptWght = 0;

		let errPckg = false;

		for ( let i=0; i<allPckgData.length-1; i++ ) {
			const pckgYmd = allPckgData[i].pckgYmd;
			const fcltCd = allPckgData[i].fcltCd;
			const itemCd = allPckgData[i].itemCd;
			const vrtyCd = allPckgData[i].vrtyCd;
			const spcfctCd = allPckgData[i].spcfctCd;
			const spmtPckgUnitCd = allPckgData[i].spmtPckgUnitCd;
			const warehouseSeCd = allPckgData[i].warehouseSeCd;
			//const pckgCmndno = allPckgData[i].pckgCmndno;
			const rmrk = allPckgData[i].rmrk;

			const pckgQntt = parseInt(allPckgData[i].pckgQntt) || 0;
			const pckgWght = parseInt(allPckgData[i].pckgWght) || 0;

			if (gfn_isEmpty(pckgYmd)) {
				gfn_comAlert("W0005", "포장일자");		//	W0005	{0}이/가 없습니다.
				return;
			}
			if (gfn_isEmpty(fcltCd)) {
				gfn_comAlert("W0005", "포장기");		//	W0005	{0}이/가 없습니다.
				return;
			}
			if (gfn_isEmpty(itemCd)) {
				gfn_comAlert("W0005", "품목");		//	W0005	{0}이/가 없습니다.
				return;
			}
			if (gfn_isEmpty(vrtyCd)) {
				gfn_comAlert("W0005", "품종");		//	W0005	{0}이/가 없습니다.
				return;
			}
			if (gfn_isEmpty(spcfctCd) || spcfctCd === "notSelect") {
				gfn_comAlert("W0005", "규격");		//	W0005	{0}이/가 없습니다.
				return;
			}

			if (gfn_isEmpty(warehouseSeCd) || warehouseSeCd === "notSelect") {
				gfn_comAlert("W0005", "창고");		//	W0005	{0}이/가 없습니다.
				return;
			}
			if (gfn_isEmpty(spmtPckgUnitCd) || spmtPckgUnitCd === "notSelect") {
				gfn_comAlert("W0005", "포장규격");		//	W0005	{0}이/가 없습니다.
				return;
			}

			if (pckgQntt <= 0) {
				gfn_comAlert("W0005", "포장수량");		//	W0005	{0}이/가 없습니다.
				return;
			}
			if (pckgWght <= 0) {
				gfn_comAlert("W0005", "포장중량");		//	W0005	{0}이/가 없습니다.
				return;
			}

			const item = allPckgData[i];
			const stdGrdList = [];

			let jgmtGrdCd;
			let gdsGrd;

			gjsonStdGrdObjKnd.forEach((knd, idx) => {
				let stdGrd = {
					grdSeCd: _GRD_SE_CD_GDS,
					itemCd: item.itemCd,
					grdKnd: knd.grdKnd,
					grdCd: item[knd.grdKnd]
				}

				if (idx === 0) {
					jgmtGrdCd = item[knd.grdKnd];
				}

				stdGrdList.push(stdGrd);
			});

			if (gjsonStdGrdObjKnd.length > 1 && gjsonStdGrdObjJgmt.length > 0) {
				jgmtGrdCd = item['jgmtGrdCd'];
			}

			if (gfn_isEmpty(jgmtGrdCd)) {
				gdsGrd = allPckgData[i]["gdsGrd"];
			} else {
				gdsGrd = jgmtGrdCd;
			}

			if (gfn_isEmpty(gdsGrd) || gdsGrd === "notSelect") {
				gfn_comAlert("W0005", "상품등급");		//	W0005	{0}이/가 없습니다.
				return;
			}

			totPckgInptQntt += pckgQntt;
			totPckgInptWght += pckgWght;

			pckgPrfmnc = {
					pckgYmd: pckgYmd,
	    			fcltCd: fcltCd,
	    			itemCd: itemCd,
	    			vrtyCd: vrtyCd,
	    			spcfctCd: spcfctCd,
	    			gdsGrd: gdsGrd,
	    			spmtPckgUnitCd: spmtPckgUnitCd,
	    			warehouseSeCd: warehouseSeCd,
	    			//pckgCmndno: pckgCmndno,
	    			rmrk: rmrk,
	    			pckgQntt: pckgQntt,
	    			pckgWght: pckgWght,
    				stdGrdList: stdGrdList
				}

			pckgPrfmncList.push(pckgPrfmnc);
		}

		if (pckgPrfmncList.length == 0) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (invntrInptQntt != totPckgInptQntt) {
			//gfn_comAlert("W0006", "재고수량", "선별수량");		//	W0006	{0}와/과 {1}이/가 서로 다릅니다.
			//return;
		}

		if (invntrInptWght < totPckgInptWght) {
			gfn_comAlert("W0008", "재고량", "포장량");		// W0008	{0} 보다 {1}이/가 큽니다.
			return;
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "포장실적저장")) {	//	Q0001	{0} 하시겠습니까?
	    	return;
	    }

		const pckgYmd = SBUxMethod.get("dtl-dtp-pckgYmd");
		const pckgMng = {
    		apcCd: gv_selectedApcCd,
    		pckgYmd: pckgYmd,
    		sortInvntrList: sortInvntrList,
    		pckgPrfmncList: pckgPrfmncList
    	}

    	const postJsonPromise = gfn_postJSON("/am/pckg/insertPckgPrfmnc.do", pckgMng);
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
        }

	}

	/** ui event */
	
	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_init(),
			fn_getStdGrd()
		]);
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {

		let itemCd = obj.value;
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 				jsonApcVrty, gv_selectedApcCd, itemCd),				// 품종
			fn_getApcSpcfct(itemCd),
			//fn_getApcGrd(itemCd),
			fn_getSpmtPckgUnit(itemCd),
			fn_getStdGrd(itemCd)
		]);

		jsonPckgPrfmnc.length = 0;
		fn_createGridPckgPrfmnc();
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
			SBUxMethod.set("srch-slt-spcfctCd", "");
		}
	}

	/**
	 * @name fn_onChangeSrchSpcfctCd
	 * @description 규격 선택 변경 event
	 */
	const fn_onChangeSrchSpcfctCd = async function(obj) {
		console.log(obj);
		const spcfctCd = obj.value;
		const itemCd = SBUxMethod.get("srch-slt-itemCd");
		const vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		await fn_getSpmtPckgUnit(itemCd, vrtyCd, spcfctCd);

		jsonPckgPrfmnc.length = 0;
		fn_createGridPckgPrfmnc();
	}


	/**
	 * @name fn_addRow
	 * @description 행추가
	 * @param {number} nRow
	 */
	const fn_addRow = async function(nRow, nCol) {

		const pckgYmd = SBUxMethod.get("dtl-dtp-pckgYmd");
		const fcltCd = SBUxMethod.get("dtl-slt-fcltCd");
		const itemCd = SBUxMethod.get("srch-slt-itemCd");
		const vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		const spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");

		if (gfn_isEmpty(pckgYmd)) {
			gfn_comAlert("W0001", "포장일자");		//	//	W0002	{0}을/를 입력하세요.
	        return;
		}
		if (gfn_isEmpty(fcltCd)) {
			gfn_comAlert("W0001", "포장기");		//	W0002	{0}을/를 선택하세요.
	        return;
		}
		if (gfn_isEmpty(itemCd)) {
			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
	        return;
		}
		if (gfn_isEmpty(vrtyCd)) {
			gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
	        return;
		}
		if (gfn_isEmpty(spcfctCd)) {
			gfn_comAlert("W0001", "규격");		//	W0002	{0}을/를 선택하세요.
	        return;
		}

		const editableRow = grdPckgPrfmnc.getRowData(nRow, false);	// call by reference(deep copy)

		editableRow.pckgYmd = pckgYmd;
		editableRow.fcltCd = fcltCd;
		editableRow.itemCd = itemCd;
		editableRow.vrtyCd = vrtyCd;
		editableRow.spcfctCd = spcfctCd;
		editableRow.spmtPckgUnitCd = "notSelect";


		// 규격중량(단중) set
		const spcfctInfo = _.find(jsonApcSpcfct, {spcfctCd: spcfctCd});
		editableRow.spcfctWght = spcfctInfo.wght;

		const spmtPckgUnitInfo = _.find(jsonSpmtPckgUnit, {itemCd: itemCd, vrtyCd: vrtyCd, spcfctCd: spcfctCd});

		if (!gfn_isEmpty(spmtPckgUnitInfo)) {
			editableRow.spmtPckgUnitCd = spmtPckgUnitInfo.spmtPckgUnitCd;
		}

		grdPckgPrfmnc.rebuild();
		grdPckgPrfmnc.setCellDisabled(nRow, 4, nRow, grdPckgPrfmnc.getCols() - 1, false);
		nRow++;
		grdPckgPrfmnc.addRow(true);
		grdPckgPrfmnc.setCellDisabled(nRow, 0, nRow, grdPckgPrfmnc.getCols() - 1, true);
	}

	/**
	 * @name fn_delRow
	 * @description 행삭제
	 * @param {number} nRow
	 */
	const fn_delRow = async function(nRow, nCol) {
		 // alert 추가?
		 grdPckgPrfmnc.deleteRow(nRow);
	}

 	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {

 	}

 	/**
     * @name fn_grdSortInvntrValueChanged
     * @description 선별재고 변경 event 처리
     * @function
     */
	const fn_grdSortInvntrValueChanged = function(event) {
		var nRow = grdSortInvntr.getRow();
		var nCol = grdSortInvntr.getCol();

		const usrAttr = grdSortInvntr.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

			const rowData = grdSortInvntr.getRowData(nRow, false);	// deep copy
			switch (usrAttr.colNm) {
				case "checkedYn":	// checkbox
					if (rowData.checkedYn == "Y") {

						let inptQntt = parseInt(rowData.inptQntt) || 0;
						let inptWght = parseInt(rowData.inptWght) || 0;

						if (inptQntt === 0 && inptWght === 0) {

							let cmndQntt = parseInt(rowData.cmndQntt) || 0;
							let cmndWght = parseInt(rowData.cmndWght) || 0;
							let invntrQntt = parseInt(rowData.invntrQntt) || 0;
							let invntrWght = parseInt(rowData.invntrWght) || 0;

							if (cmndWght > 0) {
								if (invntrWght > cmndWght) {
									rowData.inptQntt = cmndQntt;
									rowData.inptWght = cmndWght;
								} else {
									rowData.inptQntt = invntrQntt;
									rowData.inptWght = invntrWght;
								}
							} else {
								rowData.inptQntt = invntrQntt;
								rowData.inptWght = invntrWght;
							}
						}
					} else {
						rowData.inptQntt = 0;
						rowData.inptWght = 0;
					}

				case "inptQntt":
					let invntrQntt = parseInt(rowData.invntrQntt) || 0;
					let invntrWght = parseInt(rowData.invntrWght) || 0;
					let tmpInptQntt = parseInt(rowData.inptQntt) || 0;

					if (tmpInptQntt <= 0) {
						rowData.inptQntt = 0;
						rowData.inptWght = 0;
					} else if (invntrQntt === 0) {
						if (tmpInptQntt > invntrQntt) {
							rowData.inptWght = invntrWght;
						}
					} else {
						if (tmpInptQntt > invntrQntt) {
							gfn_comAlert("W0008", "재고수량", "투입수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
							rowData.inptQntt = 0;
							rowData.inptWght = 0;
							rowData.checkedYn = "N";
						} else {
							rowData.checkedYn = "Y";
							rowData.inptWght = Math.round(invntrWght * tmpInptQntt / invntrQntt);
						}
					}
					grdSortInvntr.refresh();

				case "inptWght":

					let tmpInptWght = parseInt(rowData.inptWght) || 0;
					if ( tmpInptWght > 0 && rowData.checkedYn !== "Y") {
						rowData.checkedYn = "Y";
					}

					const allData = grdSortInvntr.getGridDataAll();
					let inptQntt = 0;
					let inptWght = 0;

					allData.forEach((item, index) => {
						if (item.checkedYn === "Y") {
			    			let qntt = parseInt(item.inptQntt) || 0;
			    			let wght = parseInt(item.inptWght) || 0;

			    			inptQntt += qntt;
			    			inptWght += wght;
			    		}
					});

					SBUxMethod.set("dtl-inp-inptWght", inptWght);
					let pckgWght = parseInt(SBUxMethod.get("dtl-inp-pckgWght")) || 0;
					//SBUxMethod.set("dtl-inp-lossWght", inptWght - sortWght);

					break;

				default:
					return;
			}
		}
 	}

 	/**
     * @name fn_grdPckgPrfmncValueChanged
     * @description 포장등록 변경 event 처리
     * @function
     */
	const fn_grdPckgPrfmncValueChanged = function(event) {

		var nRow = grdPckgPrfmnc.getRow();
		var nCol = grdPckgPrfmnc.getCol();

		const usrAttr = grdPckgPrfmnc.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

			const rowData = grdPckgPrfmnc.getRowData(nRow, false);	// deep copy

			switch (usrAttr.colNm) {

				case "spcfctCd":	// 규격

					const spcfctInfo = _.find(jsonApcSpcfct, {spcfctCd: rowData.spcfctCd});
					// 규격중량(단중) set
	    			rowData.spcfctWght = spcfctInfo.wght;
					console.log(spcfctInfo);
					console.log(rowData.spcfctWght);

				case "pckgQntt":
				//case "pckgWght":
					console.log(rowData.spcfctWght);
					const spcfctWght = parseInt(rowData.spcfctWght) || 0;
					const pckgQntt = parseInt(rowData.pckgQntt) || 0;
					pckgWght = pckgQntt * spcfctWght;
					console.log("spcfctWght", spcfctWght);
					rowData.pckgQntt = pckgQntt;
					rowData.pckgWght = pckgWght;

					grdPckgPrfmnc.refresh();

					//let totInptWght = parseInt(SBUxMethod.get("dtl-inp-inptWght")) || 0;
					let totPckgWght = 0;
					const allPckgData = grdPckgPrfmnc.getGridDataAll();
					allPckgData.forEach((item, index) => {
						if (!gfn_isEmpty(item.pckgYmd)) {
							totPckgWght += parseInt(item.pckgWght) || 0;
						}
					});

					SBUxMethod.set("dtl-inp-pckgWght", totPckgWght);
					//SBUxMethod.set("dtl-inp-lossWght", inptWght - sortWght);

					break;

				default:
					return;
			}
		}
 	}

	// 엑셀다운로드
	// exp combo
	var jsonExpSltItem 				= [];	// 품목
	var jsonExpSltVrty 				= [];	// 품종
	var jsonExpSltSpcfct 			= [];	// 규격
	var jsonExpSltGdsGrd 			= [];	// 상품등급
	var jsonExpSltPrdcr 			= [];	// 생산자
	var jsonExpSltWarehouse 		= [];	// 창고
	var jsonExpSltSpmtPckgUnit 		= [];	// 포장구분
	var jsonExpSltPckgFclt 			= [];	// 포장기

	var grdExpPckgPrfmnc;			// 엑셀 포장실적그리드
	var grdExpItem;					// 엑셀 품목그리드
	var grdExpVrty;					// 엑셀 품종그리드
	var grdExpGdsGrd				// 엑셀 등급그리드
	var grdExpSpcfct;				// 엑셀 규격그리드
	var grdExpPrdcr;				// 엑셀 생산자그리드
	var grdExpWarehouse;			// 엑셀 창고그리드
	var grdExpSpmtPckgUnit;			// 엑셀 포장구분그리드
	var grdExpPckgFclt;				// 엑셀 포장기그리드

	var jsonExpPckgPrfmnc 			= [];	// 엑셀 원물재고Json
	var jsonExpItem 				= [];	// 엑셀 품목Json
	var jsonExpVrty 				= [];	// 엑셀 품종Json
	var jsonExpGdsGrd 				= [];	// 엑셀 등급Json
	var jsonExpSpcfct 				= [];	// 엑셀 규격Json
	var jsonExpPrdcr 				= [];	// 엑셀 생산자Json
	var jsonExpWarehouse	 		= [];	// 엑셀 재고창고Json
	var jsonExpSpmtPckgUnit 		= [];	// 엑셀 포장구분Json
	var jsonExpPckgFclt 			= [];	// 엑셀 포장기Json

	const fn_getExpColumns = function() {
		const _columns = [];
		_columns.push(
			{caption: ["포장일자"], 	ref: 'pckgYmd',   		type:'input',  width:'100px',    style:'text-align:center'},
			{caption: ["품목"], 		ref: 'itemCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltItem', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["품종"], 		ref: 'vrtyCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltVrty', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["생산자"], 		ref: 'prdcrCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltPrdcr', 		displayui : false,	itemcount: 10, label:'prdcrNm', value:'prdcrCd'}},
			{caption: ["선별창고"],		ref: 'warehouseSeCdFrom',	type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltWarehouse', 	displayui : false,	itemcount: 10, label:'cdVlNm', value:'cdVl'}},
			{caption: ["규격"], 		ref: 'spcfctCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltSpcfct', 	displayui : false,	itemcount: 10, label:'spcfctNm', value:'spcfctCd'}},
			{caption: ["포장구분"], 	ref: 'spmtPckgUnitCd',   		type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltSpmtPckgUnit', 	displayui : false,	itemcount: 10, label:'spmtPckgUnitNm', value:'spmtPckgUnitCd'}},
			{caption: ["포장기"],		ref: 'pckgFcltCd',	type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltPckgFclt', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["보관창고"],	ref: 'warehouseSeCdTo',	type:'combo',  width:'80px',    style:'text-align:center; background:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltWarehouse', 	displayui : false,	itemcount: 10, label:'cdVlNm', value:'cdVl'}},
		);
		
		const columnsStdGrd = [];
	    gjsonStdGrdObjKnd.forEach((item, index) => {
			const grd = {
				caption: ["등급:" + item.grdKndNm],
				ref: gStdGrdObj.colPrfx + item.grdKnd,
				type:'combo',
				width:'80px',
				style: 'text-align:center;background-color:#FFF8DC;',
				userattr: {colNm: "stdGrd"},
				typeinfo: {ref: item.jsonId, label:'grdNm', value:'grdCd', displayui : false, oneclickedit: true}
			}
			columnsStdGrd.push(grd);
		});

	    if (gjsonStdGrdObjKnd.length > 1 && gjsonStdGrdObjJgmt.length > 0) {
			const jgmtGrd = {
				caption: ["판정등급"],
				ref: "jgmtGrdCd",
				type:'combo',
				width:'80px',
				style: 'text-align:center;',
				userattr: {colNm: "jgmtGrd"},
				typeinfo: {ref: gStdGrdObj.jgmtJsonId, label:'grdNm', value:'grdCd', displayui : false}
			}
			_columns.push(jgmtGrd);
		}

	    columnsStdGrd.forEach((item) => {
	    	_columns.push(item);
		});
	    
		_columns.push(
			{caption: ["수량"],		ref: 'pckgQntt',	type:'input',  width:'60px',    style:'text-align:right; background:#FFF8DC;'},
	        {caption: ["중량 Kg"],	ref: 'pckgWght',    type:'input',  width:'60px',    style:'text-align:right; background:#FFF8DC;'},
	        {caption: ["비고"],		ref: 'rmrk',      	type:'input',  width:'300px',    style:'text-align:center'},
		);

		return _columns;
	}

	const fn_setSltJson = async function() {
		// 첫 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// set exp/imp combo json
		jsonExpSltItem 				= gfn_cloneJson(jsonApcItem);			// 엑셀 품목Json
		jsonExpSltVrty 				= gfn_cloneJson(jsonApcVrty);			// 엑셀 품종Json
		jsonExpSltGdsGrd 			= gfn_cloneJson(jsonComGdsGrd);			// 엑셀 등급Json
		jsonExpSltSpcfct 			= gfn_cloneJson(jsonApcSpcfct);			// 엑셀 규격Json
		jsonExpSltPrdcr 			= gfn_cloneJson(jsonExeclComPrdcr);		// 엑셀 생산자Json
		jsonExpSltWarehouse 		= gfn_cloneJson(jsonComWarehouse);		// 엑셀 창고
		jsonExpSltSpmtPckgUnit 		= gfn_cloneJson(jsonSpmtPckgUnit);		// 엑셀 포장구분Json
		jsonExpSltPckgFclt 			= gfn_cloneJson(jsonComPckgFclt);			// 엑셀 포장기Json
	}

	const fn_setExpJson = async function() {
		// 첫 시트가 아닌 다른 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// export grid data
		jsonExpPckgPrfmnc.length = 0;
		jsonExpItem 			= gfn_cloneJson(jsonApcItem);				// 엑셀 품목Json
		jsonExpVrty 			= gfn_cloneJson(jsonExeclComVrty);			// 엑셀 품종Json
		//jsonExpGdsGrd 			= gfn_cloneJson(jsonExeclComGdsGrd);		// 엑셀 등급Json
		jsonExpSpcfct 			= gfn_cloneJson(jsonExeclSpcfct);			// 엑셀 규격Json
		jsonExpPrdcr 			= gfn_cloneJson(jsonExeclComPrdcr);			// 엑셀 생산자Json
		jsonExpWarehouse 		= gfn_cloneJson(jsonExeclComWarehouse);		// 엑셀 창고Json
		jsonExpSpmtPckgUnit 	= gfn_cloneJson(jsonExeclComSpmtPckgUnit);	// 엑셀 포장구분Json
		jsonExpPckgFclt 		= gfn_cloneJson(jsonComPckgFclt);			// 엑셀 포장기Json
		
		fn_setExpGrdJson();
	}

	const fn_setExpGrdJson = function() {
		
		jsonExpGdsGrd.length = 0;
	    gjsonStdGrdObjKnd.forEach((item, index) => {
	    	const jsonTemp = gStdGrdObj.getGrdJson(gStdGrdObj.idList[index]);
	    	jsonTemp.forEach((stdGrd) => {
	    		jsonExpGdsGrd.push({
					grdKnd: item.grdKnd,
		    		grdKndNm: item.grdKndNm,
		    		grdCd: stdGrd.grdCd,
		    		grdNm: stdGrd.grdNm,
	    		});
	    	});
		});

	    if (gjsonStdGrdObjKnd.length > 1 && gjsonStdGrdObjJgmt.length > 0) {
	    	
	    	gjsonStdGrdObjJgmt.forEach((stdGrd) => {
	    		jsonExpGdsGrd.push({
					grdKnd: "jgmt",
		    		grdKndNm: "판정등급",
		    		grdCd: stdGrd.grdCd,
		    		grdNm: stdGrd.grdNm,
	    		});
	    	});
		}
	    
	    console.log("jsonExpGdsGrd");
	    console.log(jsonExpGdsGrd);
	}
	
	const fn_createExpGrid = async function(_expObjList) {
		_expObjList.forEach((exp, idx) => {
			var SBGridProperties = {};
			SBGridProperties.parentid = exp.parentid;
			SBGridProperties.id = exp.id;
			SBGridProperties.jsonref = exp.jsonref;
			SBGridProperties.emptyrecords = '데이터가 없습니다.';;
			SBGridProperties.selectmode = 'byrow';
			SBGridProperties.extendlastcol = 'none';
			SBGridProperties.columns = exp.columns;
			exp.sbGrid = _SBGrid.create(SBGridProperties);
			exp.sbGrid.addRow(true);
		});
	}

	const fn_dwnld = async function(){

		await fn_setSltJson();
		await fn_setExpJson();

		const expColumns = fn_getExpColumns();
		const expObjList = [

			{
		        sbGrid: grdExpPckgPrfmnc,
		        parentid: "sbexp-area-grdExpPckgPrfmnc",
		        id: "grdExpPckgPrfmnc",
		        jsonref: "jsonExpPckgPrfmnc",
				columns: expColumns,
		        sheetName: "포장실적등록정보",
		        title: "",
		        unit: ""
			},{
		        sbGrid: grdExpItem,
		        parentid: "sbexp-area-grdExpItem",
		        id: "grdExpItem",
		        jsonref: "jsonExpItem",
				columns: [
			    	{caption: ["품목코드"],     ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
			        {caption: ["품목명칭"],     ref: 'itemNm',  type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "품목",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpVrty,
		        parentid: "sbexp-area-grdExpVrty",
		        id: "grdExpVrty",
		        jsonref: "jsonExpVrty",
				columns: [
					{caption: ["품목코드"],		ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품목명"],		ref: 'itemNm',  type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품종코드"],    	ref: 'vrtyCd',  type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["품종명칭"],    	ref: 'vrtyNm',  type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "품종",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpPrdcr,
		        parentid: "sbexp-area-grdExpPrdcr",
		        id: "grdExpPrdcr",
		        jsonref: "jsonExpPrdcr",
				columns: [
			    	{caption: ["생산자코드"],   ref: 'prdcrCd',  	type: 'output', width:'100px',    style:'text-align:center'},
			    	{caption: ["생산자명"],    	ref: 'prdcrNm',  	type: 'output', width:'100px',    style:'text-align:center'},
			    	{caption: ['대표품목'],		ref: 'rprsItemCd', 	type: 'output', width: '80px', style: 'text-align:center'},
			        {caption: ['대표품종'], 	ref: 'rprsVrtyCd', 	type: 'output', width: '80px', style: 'text-align:center'}
				],
		        sheetName: "생산자",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpWarehouse,
		        parentid: "sbexp-area-grdExpWarehouse",
		        id: "grdExpWarehouse",
		        jsonref: "jsonExpWarehouse",
				columns: [
			    	{caption: ["창고코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["창고코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "창고",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpGdsGrd,
		        parentid: "sbexp-area-grdExpGdsGrd",
		        id: "grdExpGdsGrd",
		        jsonref: "jsonExpGdsGrd",
				columns: [
					{caption: ["등급종류"],	ref: 'grdKndNm',  type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["등급코드"],	ref: 'grdCd',  type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["등급명"],		ref: 'grdNm',  type:'output',  width:'100px',    style:'text-align:center'},
				],
		        sheetName: "등급",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpSpcfct,
		        parentid: "sbexp-area-grdExpSpcfct",
		        id: "grdExpSpcfct",
		        jsonref: "jsonExpSpcfct",
				columns: [
					{caption: ["품목코드"],	ref: 'itemCd',  	type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품목명"],		ref: 'itemNm',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["규격코드"],   ref: 'spcfctCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["규격명"],    	ref: 'spcfctNm',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "규격",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpGdsGrd,
		        parentid: "sbexp-area-grdExpSpmtPckgUnit",
		        id: "grdExpSpmtPckgUnit",
		        jsonref: "jsonExpSpmtPckgUnit",
				columns: [
					{caption: ["품목코드"],	ref: 'itemCd',  		type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품목명"],		ref: 'itemNm',  		type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["포장코드"],   ref: 'spmtPckgUnitCd',  type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["포장단위명"],	ref: 'spmtPckgUnitNm',  type:'output',  width:'160px',    style:'text-align:center'}
				],
		        sheetName: "포장구분",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpPckgFclt,
		        parentid: "sbexp-area-grdExpPckgFclt",
		        id: "grdExpPckgFclt",
		        jsonref: "jsonExpPckgFclt",
				columns: [
			    	{caption: ["포장기코드"],	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["포장기명"],   ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "포장기",
		        title: "",
		        unit: ""
		    }

		];

		await fn_createExpGrid(expObjList); // fn_createExpGrid함수에 expObjList를 담아서 보내주는 코드

		//exportExcel();
	    gfn_exportExcelMulti("포장실적(샘플).xlsx", expObjList); // gfn_exportExcelMulti함수에 파일 이름, 오브젝트 리스트를 보내주는 코드
	}

	const gfn_exportExcelMulti = function(_fileName, _objList) {

		// 엑셀 정보를 담는 변수
		var objExcelInfo = {
			strFileName : _fileName,
			strAction : "/am/excel/saveMultiExcel",
			bIsStyle: true,
			bIsMerge: true,
			bUseFormat: false,
			bIncludeData: true,
			bUseCompress: false
		};

		var dataList = [];
		var sheetNameList = [];
		var titleList = [];
		var unitList = [];
		var arrAdditionalData = [];

		// 넘어온 오브젝트를 이용한 forEach문으로 타이틀리스트에 title을 넣고 unitList에 unit을 넣는 포이치문
		_objList.forEach((item, index) => {
			sheetNameList.push(item.sheetName);
			titleList.push(item.title);
			unitList.push(item.unit);

			if (index > 0) {
				var data = item.sbGrid.exportExcel(objExcelInfo, "return");
				dataList.push(data);
			}
		});

		arrAdditionalData.push(
           {"name": "arrSheetData", "value": JSON.stringify(dataList)},
           {"name": "arrSheetName", "value": JSON.stringify(sheetNameList)},
           {"name": "arrTitle", "value": JSON.stringify(titleList)},
           {"name": "arrUnit", "value": JSON.stringify(unitList)}
		);

		objExcelInfo.arrAdditionalData = arrAdditionalData;
		_objList[0].sbGrid.exportExcel(objExcelInfo);
	}

	// 	excel모달을 열기위한 함수
	const importExcelData = function (e){

		SBUxMethod.openModal('modal-excel-pckgPrfmnc');
    	fn_createGridPckgPrfmncPopup();
    	jsonExcelPckgPrfmncPopup = 0;
    	grdExcelPckgPrfmncPopup.rebuild();

    	grdExcelPckgPrfmncPopup.importExcelData(e);
	}

	/**
	 * @name fn_upload
	 * @description 올리기 버튼 클릭
	 */
    const fn_upload = async function() {

		const itemCd = SBUxMethod.get("srch-slt-itemCd");			// 품목
		const vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");			// 품종
		const spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");		// 규격

		if (gfn_isEmpty(itemCd)) {
			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
            return;
		}
		if (gfn_isEmpty(vrtyCd)) {
			gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
            return;
		}
		if (gfn_isEmpty(spcfctCd)) {
			gfn_comAlert("W0001", "규격");		//	W0002	{0}을/를 선택하세요.
            return;
		}
		
		popImp.init();
		
		const impColumns = fn_getExpColumns();
		await fn_setSltJson();

		var SBGridProperties = {};
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'none';
		SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = impColumns;
		popImp.importExcel(
    			"포장실적 Import",
    			SBGridProperties,
    			fn_importPckgPrfmnc,
    			fn_setDataAfterImport,
    			fn_grdImpValueChanged
			);
    }
	
	/**
	 * @name fn_importPckgPrfmnc
	 * @description 업로드 포장실적 저장
	 */
	const fn_importPckgPrfmnc = async function(_grdImp) {

		const itemCd = SBUxMethod.get("srch-slt-itemCd");			// 품목
		const vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");			// 품종
		const spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");		// 규격
		
		const pckgPrfmncList = [];
		
		let impData = _grdImp.getGridDataAll();
		
		if (impData.length == 0) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.			
		}
 		
 		for ( let iRow = 1; iRow <= impData.length; iRow++ ) {
 			
 			const rowData = _grdImp.getRowData(iRow);
 			
 			// validation check
 	    	if (gfn_isEmpty(rowData.pckgYmd)) {
 	    		gfn_comAlert("W0001", "포장일자");		//	W0002	{0}을/를 선택하세요.
 	            return;
 	    	}
 	    	
 			if (gfn_isEmpty(rowData.itemCd)) {
 	    		gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
 	            return;
 	    	}
 	    	
 			if (itemCd != rowData.itemCd) {
 	    		gfn_comAlert("W0006", "선택품목", "등록품목");		//	W0006	 {0}와/과 {1}이/가 서로 다릅니다.
 	            return;
 			}
 			if (vrtyCd != rowData.vrtyCd) {
 	    		gfn_comAlert("W0006", "선택품종", "등록품종");		//	W0006	 {0}와/과 {1}이/가 서로 다릅니다.
 	            return;
 			}
 			if (spcfctCd != rowData.spcfctCd) {
 	    		gfn_comAlert("W0006", "선택규격", "등록규격");		//	W0006	 {0}와/과 {1}이/가 서로 다릅니다.
 	            return;
 			}
 	    	 	    	
 	    	if (gfn_isEmpty(rowData.prdcrCd)) {
 	    		gfn_comAlert("W0001", "대표생산자");		//	//	W0002	{0}을/를 입력하세요.
 	            return;
 	    	}

 	    	if (gfn_isEmpty(rowData.warehouseSeCdFrom)) {
 	    		gfn_comAlert("W0001", "선별창고");		//	W0002	{0}을/를 선택하세요.
 	            return;
 	    	}
 	    	
 	    	if (gfn_isEmpty(rowData.warehouseSeCdTo)) {
 	    		gfn_comAlert("W0001", "보관창고");		//	W0002	{0}을/를 선택하세요.
 	            return;
 	    	}
 	    	
 	    	if (gfn_isEmpty(rowData.pckgFcltCd)) {
 	    		gfn_comAlert("W0001", "포장기");		//	W0002	{0}을/를 선택하세요.
 	            return;
 	    	}
 	    	
 			if (gfn_isEmpty(rowData.spmtPckgUnitCd)) {
 				gfn_comAlert("W0001", "포장규격");		//	W0005	{0}이/가 없습니다.
 				return;
 			}
 			
 	    	if (gfn_isEmpty(rowData.pckgQntt)) {
 	    		gfn_comAlert("W0001", "수량");		//	//	W0002	{0}을/를 입력하세요.
 	            return;
 	    	}
 	    	
 	    	if (gfn_isEmpty(rowData.pckgWght)) {
 	    		gfn_comAlert("W0001", "중량");		//	//	W0002	{0}을/를 입력하세요.
 	            return;
 	    	}

 	    	let grdCd = null;
 	    	// 판정등급
			if (gjsonStdGrdObjKnd.length > 1 && gjsonStdGrdObjJgmt.length > 0) {
				if (gfn_isEmpty(rowData.jgmtGrdCd)) {
	 	    		gfn_comAlert("W0001", "판정등급");		//	W0002	{0}을/를 선택하세요.
	 	            return;
	 	    	}
				
				grdCd = rowData.jgmtGrdCd;
			}
			
 	    	const stdGrdList = [];
 	    	
			// 상세등급
			gjsonStdGrdObjKnd.forEach((item, index) => {				
				let colNm = gStdGrdObj.colPrfx + item.grdKnd;
				if (gfn_isEmpty(rowData[colNm])) {
	 	    		gfn_comAlert("W0001", "등급");		//	W0002	{0}을/를 선택하세요.
	 	            return;
	 	    	}
				
				stdGrdList.push({
					apcCd: gv_selectedApcCd,
					grdSeCd: _GRD_SE_CD_WRHS,
					itemCd: rowData.itemCd,
					grdKnd: item.grdKnd,
					grdKndNm: item.grdKndNm,
					grdCd: rowData[colNm]
				});
				
				if (gfn_isEmpty(grdCd)) {
					grdCd = rowData[colNm];
				}
			});
 	    	
	    	if (gfn_isEmpty(grdCd)) {
	    		gfn_comAlert("W0001", "등급");		//	W0002	{0}을/를 선택하세요.
	            return;
	    	}
	    		
 	    	const pckgPrfmnc = {
				apcCd: gv_selectedApcCd,
				pckgYmd: rowData.pckgYmd,
   				fcltCd: rowData.pckgFcltCd,
   				itemCd: rowData.itemCd,
   				vrtyCd: rowData.vrtyCd,
   				spcfctCd: rowData.spcfctCd,
   				prdcrCd: rowData.prdcrCd,
   				spmtPckgUnitCd: rowData.spmtPckgUnitCd,
   				warehouseSeCd: rowData.warehouseSeCdTo,
   				warehouseSeCdFrom: rowData.warehouseSeCdFrom,
   				grdCd: grdCd,
   				gdsGrd: grdCd,
   				rmrk: rowData.rmrk,
   				pckgQntt: rowData.pckgQntt,
   				pckgWght: rowData.pckgWght,
   				stdGrdList: stdGrdList
 	    	}
 			
 	    	pckgPrfmncList.push(pckgPrfmnc);
 		}

		if (pckgPrfmncList.length == 0) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.			
		}
 		
    	if (!gfn_comConfirm("Q0001", "포장실적등록")) {
    		return;
    	}

    	const pckgYmd = SBUxMethod.get("dtl-dtp-pckgYmd");
		const pckgMng = {
	    		apcCd: gv_selectedApcCd,
	    		pckgYmd: pckgYmd,
	    		pckgPrfmncList: pckgPrfmncList
	    	}
    	
    	let postUrl = "/am/pckg/insertPckgRslt.do";

    	const postJsonPromise = gfn_postJSON(postUrl, pckgMng);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		popImp.close();
        		//fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
	}

	/**
	 * @name fn_setDataAfterImport
	 * @description
	 */
	const fn_setDataAfterImport = function(_grdImp) {
    	 
		let impData = _grdImp.getGridDataAll();
		
		for ( let iRow = 1; iRow <= impData.length; iRow++ ) {
			const rowData = _grdImp.getRowData(iRow, false);	// deep copy
			
			// 품목
			if (!gfn_isEmpty(rowData.itemCd)) {
				
				let chkInfo = _.find(jsonExpSltItem, {value: rowData.itemCd});
				if (gfn_isEmpty(chkInfo)) {
					chkInfo = _.find(jsonExpSltItem, {label: rowData.itemCd});
					if (!gfn_isEmpty(chkInfo)) {
						rowData.itemCd = chkInfo.value; 
					}
				}
			}
			
			// 품종
			if (!gfn_isEmpty(rowData.vrtyCd)) {				
				let chkInfo = _.find(jsonExpSltVrty, {value: rowData.vrtyCd});
				if (gfn_isEmpty(chkInfo)) {
					chkInfo = _.find(jsonExpSltVrty, {label: rowData.vrtyCd});
					if (!gfn_isEmpty(chkInfo)) {
						rowData.vrtyCd = chkInfo.value; 
					}
				}
			}

			// 규격
			if (!gfn_isEmpty(rowData.spcfctCd)) {				
				let chkInfo = _.find(jsonExpSltSpcfct, {spcfctCd: rowData.spcfctCd});
				if (gfn_isEmpty(chkInfo)) {
					chkInfo = _.find(jsonExpSltSpcfct, {spcfctNm: rowData.spcfctCd});
					if (!gfn_isEmpty(chkInfo)) {
						rowData.spcfctCd = chkInfo.spcfctCd; 
					}
				}
			}
			
			// 생산자
			if (!gfn_isEmpty(rowData.prdcrCd)) {				
				let chkInfo = _.find(jsonExpSltPrdcr, {prdcrCd: rowData.prdcrCd});
				if (gfn_isEmpty(chkInfo)) {
					chkInfo = _.find(jsonExpSltPrdcr, {prdcrNm: rowData.prdcrCd});
					if (!gfn_isEmpty(chkInfo)) {
						rowData.prdcrCd = chkInfo.prdcrCd; 
					}
				}
			}
			
			// 선별창고
			if (!gfn_isEmpty(rowData.warehouseSeCdFrom)) {				
				let chkInfo = _.find(jsonExpSltWarehouse, {cdVl: rowData.warehouseSeCdFrom});
				if (gfn_isEmpty(chkInfo)) {
					chkInfo = _.find(jsonExpSltWarehouse, {cdVlNm: rowData.warehouseSeCdFrom});
					if (!gfn_isEmpty(chkInfo)) {
						rowData.warehouseSeCdFrom = chkInfo.cdVl; 
					}
				}
			}
			
			// 보관창고
			if (!gfn_isEmpty(rowData.warehouseSeCdTo)) {				
				let chkInfo = _.find(jsonExpSltWarehouse, {cdVl: rowData.warehouseSeCdTo});
				if (gfn_isEmpty(chkInfo)) {
					chkInfo = _.find(jsonExpSltWarehouse, {cdVlNm: rowData.warehouseSeCdTo});
					if (!gfn_isEmpty(chkInfo)) {
						rowData.warehouseSeCdTo = chkInfo.cdVl; 
					}
				}
			}

			// 포장기
			if (!gfn_isEmpty(rowData.pckgFcltCd)) {				
				let chkInfo = _.find(jsonExpSltPckgFclt, {value: rowData.pckgFcltCd});
				if (gfn_isEmpty(chkInfo)) {
					chkInfo = _.find(jsonExpSltPckgFclt, {label: rowData.pckgFcltCd});
					if (!gfn_isEmpty(chkInfo)) {
						rowData.pckgFcltCd = chkInfo.value; 
					}
				}
			}
			
			// 포장구분
			if (!gfn_isEmpty(rowData.spmtPckgUnitCd)) {				
				let chkInfo = _.find(jsonExpSltSpmtPckgUnit, {spmtPckgUnitCd: rowData.spmtPckgUnitCd});
				if (gfn_isEmpty(chkInfo)) {
					chkInfo = _.find(jsonExpSltSpmtPckgUnit, {spmtPckgUnitNm: rowData.spmtPckgUnitCd});
					if (!gfn_isEmpty(chkInfo)) {
						rowData.spmtPckgUnitCd = chkInfo.spmtPckgUnitCd; 
					}
				}
			}
			
			const grdList = [];
			// 상세등급
			gjsonStdGrdObjKnd.forEach((item, index) => {				
				let colNm = gStdGrdObj.colPrfx + item.grdKnd;
				const id = gStdGrdObj.idList[index];
				let jsonObj = gStdGrdObj.getGrdJson(id);
				
				if (!gfn_isEmpty(rowData[colNm])) {			
					let grdInfo = _.find(jsonObj, {grdCd: rowData[colNm]});
					if (gfn_isEmpty(grdInfo)) {
						grdInfo = _.find(jsonObj, {grdNm: rowData[colNm]});
						if (!gfn_isEmpty(grdInfo)) {
							rowData[colNm] = grdInfo.grdCd; 
						}
					}
				}
				
				grdList.push(rowData[colNm]);
			});
			
			// 판정등급
			if (gjsonStdGrdObjKnd.length > 1 && gjsonStdGrdObjJgmt.length > 0) {
				
				if (grdList.length > 0) {
					let jgmtGrdCd = stdGrdSelect.getJgmtGrdCd(grdList);
					rowData.jgmtGrdCd = jgmtGrdCd;
				} else {
					if (!gfn_isEmpty(rowData.jgmtGrdCd)) {				
						let jgmtGrdInfo = _.find(gjsonStdGrdObjJgmt, {grdCd: rowData.jgmtGrdCd});
						if (gfn_isEmpty(jgmtGrdInfo)) {
							jgmtGrdInfo = _.find(gjsonStdGrdObjJgmt, {grdNm: rowData.jgmtGrdCd});
							if (!gfn_isEmpty(jgmtGrdInfo)) {
								rowData.jgmtGrdCd = jgmtGrdInfo.grdCd; 
							}
						}
					}
				}
			}
		}
		
		_grdImp.refresh();
     }
	
  	/**
     * @name fn_grdImpValueChanged
     * @description import 변경 event 처리
     * @function
     */
	const fn_grdImpValueChanged = function(_grdImp) {
		var nRow = _grdImp.getRow();
		var nCol = _grdImp.getCol();

		const usrAttr = _grdImp.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

			const rowData = _grdImp.getRowData(nRow, false);	// deep copy
			switch (usrAttr.colNm) {
				case "stdGrd":
					if (gjsonStdGrdObjKnd.length > 1 && gjsonStdGrdObjJgmt.length > 0) {
						
						const grdList = [];
	 					// 상세등급
	 					gjsonStdGrdObjKnd.forEach((item, index) => {				
	 						let colNm = gStdGrdObj.colPrfx + item.grdKnd;
	 						grdList.push(rowData[colNm]);
	 					});
						
						let jgmtGrdCd = stdGrdSelect.getJgmtGrdCd(grdList);
						rowData.jgmtGrdCd = jgmtGrdCd;
						
						_grdImp.refresh();
					}
					break;

				default:
					return;
			}
		}
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>