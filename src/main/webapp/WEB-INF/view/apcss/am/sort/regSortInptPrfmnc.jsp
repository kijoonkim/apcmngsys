<%
 /**
  * @Class Name : regSortInptPrfmnc.jsp
  * @Description : 선별실적등록 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	정희운			최초 생성
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
				<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 선별실적등록 -->
			</div>
			<div style="margin-left: auto;">
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-dark" onclick="fn_search" text="조회"></sbux-button>
				<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-dark" onclick="fn_save" text="저장"></sbux-button>
			</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<sbux-input id="srch-inp-sortRdcdRt" name="srch-inp-sortRdcdRt" uitype="hidden"></sbux-input>
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
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
						<th scope="row" class="th_bg"><span class="data_required" ></span>입고일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-wrhsYmdFrom" name="srch-dtp-wrhsYmdFrom" uitype="popup" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-wrhsYmdTo" name="srch-dtp-wrhsYmdTo" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>
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
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm input-sm-ast"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
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
							<td class="td_input">
								<sbux-button
									id="srch-btn-slt-prdcrNm"
									name="srch-btn-slt-prdcrNm"
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
							<span>원물재고내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-rawMtrInvtr">0</span>건)</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdRawMtrInvntr" style="height:250px;"></div>
				</div>
				<div style="height:5px"></div>
				<table class="table table-bordered tbl_fixed">
					<caption>등록 조건 설정</caption>
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
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>선별일자</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="dtl-dtp-inptYmd" name="dtl-dtp-inptYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>설비</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-slt-fcltCd"
									name="dtl-slt-fcltCd"
									uitype="single" class="form-control input-sm inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonComFclt"
								></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg">투입/감량/선별/미투입</th>
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
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-actlWght"
									name="dtl-inp-actlWght"
									class="form-control input-sm input-sm-ast"
									maxlength="6"
									autocomplete="off"
									mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-sortWght"
									name="dtl-inp-sortWght"
									class="form-control input-sm input-sm-ast"
									maxlength="6"
									autocomplete="off"
									readonly
									mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
								/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-lossWght"
									name="dtl-inp-lossWght"
									class="form-control input-sm input-sm-ast"
									maxlength="6"
									autocomplete="off"
									readonly
									mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
								/>
							</td>
							<td style="border-right: hidden;">
								<label class="bold">Kg</label>
							</td>
						</tr>
					</tbody>
	            </table>


				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>선별등록 내역</span>
							<span style="font-size:12px">(감량률 <span id="rt-sortRdcd">0</span>%)</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="내려받기" class="btn btn-xs btn-outline-danger" onclick="fn_dwnld" >내려받기</sbux-button>
						<sbux-button id="btnUp" name="btnUp" uitype="normal" text="올리기" class="btn btn-xs btn-outline-danger"></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdSortPrfmnc" style="height:200px;"></div>
				</div>
				<div class="exp-div-excel" style="display: none;width: 1000px;">
					<div id="sbexp-area-grdExpRawMtrWrhs" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpItem" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpVrty" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpPrdcr" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpWrhsSeCd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpGdsSeCd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpTrsprtSeCd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpWarehouseSeCd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpBxKnd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpStdGrd" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpStdGrdDtl" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpFclt" style="height:1px; width: 100%;"></div>
					<div id="sbexp-area-grdExpSpcfct" style="height:1px; width: 100%;"></div>
					<input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="importExcelData(event)">
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
	        header-is-close-button="false"
	        footer-is-close-button="false"
	        style="width:1100px"
        ></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
	<sbux-button id="btnRawMtrWrhsfmncPopup" name="btnRawMtrWrhsfmncPopup" uitype="modal" text="엑셀등록" style="width:100%; display:none" class="btn btn-sm btn-outline-dark" target-id="modal-excel" onclick="fn_modal('btnSpmtSlsUntprcReg')"></sbux-button>
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
	var jsonComFclt			= [];	// 설비 		SORT_FCLT_CD
	var jsonComWarehouse	= [];	// 창고		WAREHOUSE_SE_CD

	/* 생산자 자동완성 */
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];


    /* SBGrid */
	var grdRawMtrInvntr;
    var grdSortPrfmnc;

    /* SBGrid Data (JSON) */
	var jsonRawMtrInvntr = [];
    var jsonSortPrfmnc = [];

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let result = await Promise.all([
		 	gfn_setComCdSBSelect('dtl-slt-fcltCd',		jsonComFclt, 'SORT_FCLT_CD', gv_selectedApcCd),		// 설비
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonApcItem, gv_selectedApcCd),		// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonApcVrty, gv_selectedApcCd),		// 품종
		 	fn_getWarehouse(),
		 	fn_getApcSpcfct()
	 	]);
	}

    const fn_getWarehouse = async function() {
    	jsonComWarehouse = await gfn_getComCdDtls('WAREHOUSE_SE_CD', gv_selectedApcCd);
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
	}

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {

		let nowDate = new Date();

		let firstYmd = gfn_dateFirstYmd(nowDate);
		let lastYmd = gfn_dateLastYmd(nowDate);
		let nowYmd = gfn_dateToYmd(nowDate);

		SBUxMethod.set("srch-dtp-wrhsYmdFrom", firstYmd);
		SBUxMethod.set("srch-dtp-wrhsYmdTo", lastYmd);
		SBUxMethod.set("dtl-dtp-inptYmd", nowYmd);

		let result = await Promise.all([
				fn_initSBSelect(),
				fn_getPrdcrs()
			]);

		fn_createGridRawMtrInvntr();
		fn_createGridSortPrfmnc();

		fn_clearForm();
	}


	/** [START] 표준등급 script */
    /* 등급 json */
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

	/**
	 * @name fn_getStdGrd
	 * @description 표준등급 json set
	 */
	const fn_getStdGrd = async function(itemCd) {

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
		    gfn_getStdGrds(gv_selectedApcCd, _GRD_SE_CD_SORT, itemCd),
		    gfn_getStdGrdJgmts(gv_selectedApcCd, _GRD_SE_CD_SORT, itemCd),
		    gfn_getStdGrdDtls(gv_selectedApcCd, _GRD_SE_CD_SORT, itemCd)
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
	}

	const fn_getStdGrdJgmtCd = function(vl) {

	}

	/** [END] 표준등급 script */

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	})

	const fn_createGridRawMtrInvntr = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdRawMtrInvntr';
		SBGridProperties.id = 'grdRawMtrInvntr';
		SBGridProperties.jsonref = 'jsonRawMtrInvntr';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'byrow';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.columns = [
			{caption : ["선택","선택"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center', userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
        	{caption: ["입고일자","입고일자"],		ref: 'wrhsYmd',			type:'output',  width:'120px', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
            },
            {caption: ["팔레트번호","팔레트번호"], 	ref: 'pltno',     		type:'output',  width:'120px', style: 'text-align:center'},
            {caption: ["지시번호","지시번호"], 	ref: 'sortCmndno',  	type:'output',  width:'120px', style: 'text-align:center'},
            {caption: ["생산자","생산자"],    	ref: 'prdcrNm',     	type:'output',  width:'80px', style: 'text-align:center'},
            {caption: ["품목","품목"],	    	ref: 'itemNm',   		type:'output',  width:'80px', style: 'text-align:center'},
            {caption: ["품종","품종"],	    	ref: 'vrtyNm',   		type:'output',  width:'100px', style: 'text-align:center'},
            {caption: ["등급","등급"],	    	ref: 'grdNm',   		type:'output',  width:'80px', style: 'text-align:center'},
            {caption: ["상품구분","상품구분"],		ref: 'gdsSeNm', 		type:'output',  width:'80px', style: 'text-align:center'},
            {caption: ["지시설비","지시설비"],	    ref: 'fcltNm', 			type:'output',  width:'120px', style: 'text-align:center'},
            {caption: ["창고","창고"],	    	ref: 'warehouseSeNm', 	type:'output',  width:'120px', style: 'text-align:center'},
            {caption: ["원물재고","수량"],  		ref: 'invntrQntt',   	type:'output',  width:'80px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["원물재고","중량"],  		ref: 'invntrWght',   	type:'output',  width:'80px', style: 'text-align:right', format : {type:'number', rule:'#,### Kg'}},
            {caption: ["투입지시","수량"],  		ref: 'cmndQntt', 		type:'output',  width:'80px', style: 'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["투입지시","중량"],  		ref: 'cmndWght', 		type:'output',  width:'80px', style: 'text-align:right', format : {type:'number', rule:'#,### Kg'}},
            {caption: ["투입","수량"], 			ref: 'inptQntt',  		type:'input',  width:'80px', style: 'text-align:right;background-color:#FFF8DC;',
            	userattr: {colNm: "inptQntt"},
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
            		maxlength: 6,
            		oneclickedit: true
				},
				format : {type:'number', rule:'#,###'}
            },
            {caption: ["투입","중량"], 			ref: 'inptWght',  		type:'input',  width:'80px', style: 'text-align:right;background-color:#FFF8DC;',
            	userattr: {colNm: "inptWght"},
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
            		maxlength: 6,
            		oneclickedit: true
				},
				format : {type:'number', rule:'#,### Kg'}
         	},

 	        {caption: ["생산자코드"],	ref: 'prdcrCd',   	type:'output',  hidden: true},
	        {caption: ["품목코드"],		ref: 'itemCd',   	type:'output',  hidden: true},
	        {caption: ["품종코드"],		ref: 'vrtyCd',   	type:'output',  hidden: true},
	        {caption: ["상품구분코드"],	ref: 'gdsSeCd',   	type:'output',  hidden: true},
	        {caption: ["입고구분코드"],	ref: 'wrhsSeCd',   	type:'output',  hidden: true},
	        {caption: ["운송구분코드"],	ref: 'trsprtSeCd', 	type:'output',  hidden: true},
	        {caption: ["창고구분코드"],	ref: 'warehouseSeCd', 	type:'output',	hidden: true},
	        {caption: ["설비"],		ref: 'fcltCd', 	type:'output',	hidden: true},
	        {caption: ["등급코드"],		ref: 'grdCd',   	type:'output',  hidden: true},
	        {caption: ["박스종류코드"],	ref: 'bxKnd',   	type:'output',  hidden: true},
	        {caption: ["입고번호"],		ref: 'wrhsno', 		type:'output',  hidden: true},
	        {caption: ["입고구분명"],	ref: 'wrhsSeNm', 	type:'output',  hidden: true},
	        {caption: ["운송구분명"],	ref: 'trsprtSeNm', 	type:'output',  hidden: true},
	        {caption: ["박스종류명"],	ref: 'bxKndNm', 	type:'output',  hidden: true},
	        {caption: [" "],	ref: '_',		type:'output',  width:'1px'},
    	];
		grdRawMtrInvntr = _SBGrid.create(SBGridProperties);
		grdRawMtrInvntr.bind('valuechanged', fn_grdRawMtrInvntrValueChanged);
	}

	const fn_createGridSortPrfmnc = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdSortPrfmnc';
		SBGridProperties.id = 'grdSortPrfmnc';
		SBGridProperties.jsonref = 'jsonSortPrfmnc';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
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
            {caption: ["선별일자"],	ref: 'inptYmd',		type:'output',  width:'120px', style: 'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["설비"], 		ref: 'fcltCd',		type:'combo',  	width:'100px', style: 'text-align:center',
            	typeinfo: {ref:'jsonComFclt', label:'label', value:'value', displayui : false}
            },
            {caption: ["품목"], 		ref: 'itemCd',		type:'combo',  width:'100px', style: 'text-align:center',
            	typeinfo: {ref:'jsonApcItem', label:'label', value:'value', displayui : false}
            },
            {caption: ["품종"], 		ref: 'vrtyCd',		type:'combo',  width:'100px', style: 'text-align:center',
            	typeinfo: {ref:'jsonApcVrty', label:'label', value:'value', displayui : false}
            },
            {caption: ["규격"], 	 	ref: 'spcfctCd',    type:'combo',  width:'100px', style: 'text-align:center;background-color:#FFF8DC;',
            	userattr: {colNm: "spcfctCd"},
            	typeinfo: {ref:'jsonApcSpcfct', label:'spcfctNm', value:'spcfctCd', oneclickedit: true}
            },
    	];

		const columnsStdGrd = [];
		jsonStdGrdKnd.forEach((item, index) => {
			const _jsonId = stdGrdJsonList[index];
			const grd = {
				caption: [item.grdKndNm],
				ref: item.grdKnd,
				type:'combo',
				width:'80px',
				style: 'text-align:center;background-color:#FFF8DC;',
				userattr: {colNm: "stdGrd"},
				typeinfo: {ref: _jsonId, label:'grdNm', value:'grdCd', displayui : false, oneclickedit: true}
			}
			columnsStdGrd.push(grd);
		});

		if (jsonStdGrdKnd.length > 1 && jsonStdGrdJgmt.length > 0) {
			const jgmtGrd = {
					caption: ["판정등급"],
					ref: "jgmtGrdCd",
					type:'combo',
					width:'80px',
					style: 'text-align:center;',
					userattr: {colNm: "jgmtGrd"},
					typeinfo: {ref: "jsonStdGrdJgmt", label:'grdNm', value:'grdCd', displayui : false}
			}
			SBGridProperties.columns.push(jgmtGrd);
		}

		columnsStdGrd.forEach((item, index) => {
			SBGridProperties.columns.push(item);
		});

		const columns2 = [
			{
				caption: ["수량"],
				ref: 'sortQntt',
				datatype: 'number',
				type:'input',
				width:'80px',
				style: 'text-align:right;background-color:#FFF8DC',
				userattr: {colNm: "sortQntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 6,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
			},
			{
				caption: ["중량"],
				ref: 'sortWght',
				datatype: 'number',
				type:'input',
				width:'80px',
				style: 'text-align:right;background-color:#FFF8DC',
				userattr: {colNm: "sortWght"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 6,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
			},
            {caption: ["저장창고"],		ref: 'warehouseSeCd',    type:'combo',  width:'100px', style: 'text-align:center;background-color:#FFF8DC;',
           	 	typeinfo: {ref:'jsonComWarehouse', label:'cdVlNm', value:'cdVl', oneclickedit: true}
            },
			{caption : ["포장"], ref: 'checkedYn', type: 'checkbox',  width:'40px', style: 'text-align:center', userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["비고"], 		ref: 'rmrk',  		type:'input',  width:'200px'},
	        {caption: ["품목코드"],		ref: 'itemCd',   	type:'output',  hidden: true},
	        {caption: ["규격중량"],		ref: 'spcfctWght',  type:'output',  hidden: true},
	        //{caption: [" "],		ref: '_',			type:'output',  width:'1px'},
		];

		columns2.forEach((item, index) => {
			SBGridProperties.columns.push(item);
		});

		grdSortPrfmnc = _SBGrid.create(SBGridProperties);
		grdSortPrfmnc.bind('valuechanged', fn_grdSortPrfmncValueChanged);

		let nRow = grdSortPrfmnc.getRows();
		grdSortPrfmnc.addRow(true);
		grdSortPrfmnc.setCellDisabled(nRow, 0, nRow, grdSortPrfmnc.getCols() - 1, true);
	}

    /**
     * @name fn_setGrdRawMtrInvntr
     * @description 원물재고내역 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdRawMtrInvntr = async function() {

        let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");    // 입고일자from
        let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");        // 입고일자to
    	let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");			// 생산자
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");				// 품목
  		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");				// 품종

  		let inptYmd = SBUxMethod.get("dtl-dtp-inptYmd");

  		if (gfn_isEmpty(itemCd)) {
  			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
            return;
  		}

  		if (gfn_isEmpty(vrtyCd)) {
  			gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
            return;
  		}

		const postJsonPromise = gfn_postJSON("/am/invntr/selectRawMtrInvntrList.do", {
			apcCd: gv_selectedApcCd,
			wrhsYmdFrom: wrhsYmdFrom,
			wrhsYmdTo: wrhsYmdTo,
			prdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,

			inptYmd: inptYmd,
          	// pagination
  	  		//pagingYn : 'Y',
  			//currentPageNo : pageNo,
   		  	//recordCountPerPage : pageSize
  		});
        const data = await postJsonPromise;

  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonRawMtrInvntr.length = 0;
          	data.resultList.forEach((item, index) => {
          		const rawMtrInvntr = {
  						rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						wrhsno: item.wrhsno,
  						pltno: item.pltno,
  						wrhsYmd: item.wrhsYmd,
  						prdcrCd: item.prdcrCd,
  						itemCd: item.itemCd,
  						vrtyCd: item.vrtyCd,
  						gdsSeCd: item.gdsSeCd,
  						wrhsSeCd: item.wrhsSeCd,
  						trsprtSeCd: item.trsprtSeCd,
  						warehouseSeCd: item.warehouseSeCd,
  						fcltCd: item.fcltCd,
  						fcltNm: item.fcltNm,
  						bxKnd: item.bxKnd,
  						grdCd: item.grdCd,
  						wrhsQntt: item.wrhsQntt,
  						wrhsWght: item.wrhsWght,
  						inptQntt: 0, //item.inptQntt,
  						inptWght: 0, //item.inptWght,
  						invntrQntt: item.invntrQntt,
  						invntrWght: item.invntrWght,
  						apcNm: item.apcNm,
  						prdcrNm: item.prdcrNm,
  						itemNm: item.itemNm,
  						vrtyNm: item.vrtyNm,
  						grdNm: item.grdNm,
  						warehouseSeNm: item.warehouseSeNm,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeNm: item.trsprtSeNm,
  						bxKndNm: item.bxKndNm,
  						grdNm: item.grdNm,
  						sortCmndno: item.sortCmndno,
  						cmndQntt: item.cmndQntt,
  						cmndWght: item.cmndWght
  				}
          		jsonRawMtrInvntr.push(rawMtrInvntr);
				/*
  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
				 */
  			});

          	grdRawMtrInvntr.refresh();

          	totalRecordCount = jsonRawMtrInvntr.length;
          	document.querySelector('#cnt-rawMtrInvtr').innerText = totalRecordCount;

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
	}

	/**
	 * common button action
	 */

	const fn_search = async function() {

        // set pagination
    	grdRawMtrInvntr.rebuild();
    	// grid clear
    	jsonRawMtrInvntr.length = 0;
    	fn_setGrdRawMtrInvntr();

		jsonSortPrfmnc.length = 0;
    	fn_createGridSortPrfmnc();

    	fn_clearForm();
	}

	const fn_save = async function() {

		const sortYmd = SBUxMethod.get("dtl-dtp-inptYmd");
		// check qntt, wght

		// 원물재고 내역

		// 입고번호, 재고량, 투입량
		const rawMtrInvntrList = [];
		const allInvntrData = grdRawMtrInvntr.getGridDataAll();

		let invntrInptQntt = 0;
		let invntrInptWght = 0;

		allInvntrData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				let qntt = parseInt(item.inptQntt) || 0;
    			let wght = parseInt(item.inptWght) || 0;

    			rawMtrInvntrList.push({
    				wrhsno: item.wrhsno,
    				sortCmndno: item.sortCmndno,
    				inptQntt: qntt,
    				inptWght: wght
    			});

    			invntrInptQntt += qntt;
    			invntrInptWght += wght;
    		}
		});

		if (rawMtrInvntrList.length == 0) {
			gfn_comAlert("W0005", "원물재고대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// 실적내역
		const sortPrfmncList = [];
		const allSortData = grdSortPrfmnc.getGridDataAll();

		let sortInptQntt = 0;
		let sortInptWght = 0;

		let errSpcfctCd = false;

		for ( let i=0; i<allSortData.length-1; i++ ) {
			const inptYmd= allSortData[i].inptYmd;
			const fcltCd = allSortData[i].fcltCd;
			const itemCd = allSortData[i].itemCd;
			const vrtyCd = allSortData[i].vrtyCd;
			const spcfctCd = allSortData[i].spcfctCd;
			const warehouseSeCd = allSortData[i].warehouseSeCd;
			const spcfctWght = parseInt(allSortData[i].spcfctWght) || 0;
			const sortQntt = parseInt(allSortData[i].sortQntt) || 0;
			const sortWght = parseInt(allSortData[i].sortWght) || 0;

			if (gfn_isEmpty(inptYmd)) {
				gfn_comAlert("W0005", "선별일자");		//	W0005	{0}이/가 없습니다.
				return;
			}
			if (gfn_isEmpty(fcltCd)) {
				gfn_comAlert("W0005", "설비");		//	W0005	{0}이/가 없습니다.
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
			if (gfn_isEmpty(warehouseSeCd)) {
				gfn_comAlert("W0005", "창고");		//	W0005	{0}이/가 없습니다.
				return;
			}
			if (sortQntt <= 0) {
				gfn_comAlert("W0005", "선별수량");		//	W0005	{0}이/가 없습니다.
				return;
			}
			if (sortWght <= 0) {
				gfn_comAlert("W0005", "선별중량");		//	W0005	{0}이/가 없습니다.
				return;
			}
			if (spcfctWght <= 0) {
				gfn_comAlert("W0005", "규격단중");		//	W0005	{0}이/가 없습니다.
				return;
			}
		}

		allSortData.forEach((item, index) => {
			if (!gfn_isEmpty(item.inptYmd)) {

				const inptYmd= item.inptYmd;
				const fcltCd = item.fcltCd;
				const itemCd = item.itemCd;
				const vrtyCd = item.vrtyCd;
				const spcfctCd = item.spcfctCd;
				const warehouseSeCd = item.warehouseSeCd;
				const spcfctWght = parseInt(item.spcfctWght) || 0;

				const sortQntt = parseInt(item.sortQntt) || 0;
				const sortWght = parseInt(item.sortWght) || 0;

				const stdGrdList = [];

				let jgmtGrdCd;

				jsonStdGrdKnd.forEach((knd, idx) => {
					let stdGrd = {
						grdSeCd: _GRD_SE_CD_SORT,
						itemCd: item.itemCd,
						grdKnd: knd.grdKnd,
						grdCd: item[knd.grdKnd]
					}

					if (idx === 0) {
						jgmtGrdCd = item[knd.grdKnd];
					}

					stdGrdList.push(stdGrd);
				});

				if (jsonStdGrdKnd.length > 1 && jsonStdGrdJgmt.length > 0) {
					jgmtGrdCd = item['jgmtGrdCd'];
				}

				if (gfn_isEmpty(jgmtGrdCd)) {
					gfn_comAlert("W0005", "선별등급");		//	W0005	{0}이/가 없습니다.
					return;
				}


				const autoPckgInptYn = item.checkedYn;	// 포장등록 유무

				sortPrfmnc = {
					inptYmd: inptYmd,
    				fcltCd: fcltCd,
    				itemCd: itemCd,
    				vrtyCd: vrtyCd,
    				spcfctCd: spcfctCd,
    				warehouseSeCd: warehouseSeCd,
    				grdCd: jgmtGrdCd,
    				sortQntt: sortQntt,
    				sortWght: sortWght,
    				autoPckgInptYn: autoPckgInptYn,
    				stdGrdList: stdGrdList
				}

				sortPrfmncList.push(sortPrfmnc);
    			sortInptWght += sortWght;
    		}
		});

		if (sortPrfmncList.length == 0) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (invntrInptQntt != sortInptQntt) {
			//gfn_comAlert("W0006", "재고수량", "선별수량");		//	W0006	{0}와/과 {1}이/가 서로 다릅니다.
			//return;
		}

		if (invntrInptWght < sortInptWght) {
			gfn_comAlert("W0008", "재고량", "투입량");		// W0008	{0} 보다 {1}이/가 큽니다.
			return;
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "선별실적 저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

		const sortMng = {
    		apcCd: gv_selectedApcCd,
    		sortYmd: sortYmd,
    		//needsPckgRegYn: needsPckgRegYn,
    		rawMtrInvntrList: rawMtrInvntrList,
    		sortPrfmncList: sortPrfmncList
    	}

    	const postJsonPromise = gfn_postJSON("/am/sort/insertSortPrfmnc.do", sortMng);
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

	const fn_delete = async function() {

	}

	/**
	 * @name fn_addRow
	 * @description 행추가
	 * @param {number} nRow
	 */
	const fn_addRow = async function(nRow, nCol) {

		const inptYmd = SBUxMethod.get("dtl-dtp-inptYmd");
		const fcltCd = SBUxMethod.get("dtl-slt-fcltCd");
		const itemCd = SBUxMethod.get("srch-slt-itemCd");
		const vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");

		if (gfn_isEmpty(inptYmd)) {
			gfn_comAlert("W0001", "선별일자");		//	//	W0002	{0}을/를 입력하세요.
	        return;
		}
		if (gfn_isEmpty(fcltCd)) {
			gfn_comAlert("W0001", "설비");		//	W0002	{0}을/를 선택하세요.
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

		const editableRow = grdSortPrfmnc.getRowData(nRow, false);	// call by reference(deep copy)

		editableRow.inptYmd = inptYmd;
		editableRow.fcltCd = fcltCd;
		editableRow.itemCd = itemCd;
		editableRow.vrtyCd = vrtyCd;
		//grdSortPrfmnc.setCellData(nRow, nCol, "xxx", true);

		grdSortPrfmnc.rebuild();
		grdSortPrfmnc.setCellDisabled(nRow, 5, nRow, grdSortPrfmnc.getCols() - 1, false);
		nRow++;
		grdSortPrfmnc.addRow(true);
		grdSortPrfmnc.setCellDisabled(nRow, 0, nRow, grdSortPrfmnc.getCols() - 1, false);

		//document.querySelector('#cnt-rawMtrInvtr').innerText = nRow;
	}
	/**
	 * @name fn_delRow
	 * @description 행삭제
	 * @param {number} nRow
	 */
	const fn_delRow = async function(nRow, nCol) {
		 grdSortPrfmnc.deleteRow(nRow);
		 //document.querySelector('#cnt-sortPrfmnc').innerText = grdRawMtrInvntr.getGridDataAll().length - 1;
	}

 	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {
		SBUxMethod.set("dtl-inp-inptWght", 0);
		SBUxMethod.set("dtl-inp-actlWght", 0);
		SBUxMethod.set("dtl-inp-sortWght", 0);
		SBUxMethod.set("dtl-inp-lossWght", 0);
 	}

 	/**
     * @name fn_grdRawMtrInvntrValueChanged
     * @description 원물재고 변경 event 처리
     * @function
     */
	const fn_grdRawMtrInvntrValueChanged = function() {
		var nRow = grdRawMtrInvntr.getRow();
		var nCol = grdRawMtrInvntr.getCol();

		const usrAttr = grdRawMtrInvntr.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

			const rowData = grdRawMtrInvntr.getRowData(nRow, false);	// deep copy
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
						} else {
							rowData.checkedYn = "Y";
							rowData.inptWght = Math.round(invntrWght * tmpInptQntt / invntrQntt);
						}
					}
					grdRawMtrInvntr.refresh();

				case "inptWght":

					let tmpInptWght = parseInt(rowData.inptWght) || 0;
					if ( tmpInptWght > 0 && rowData.checkedYn !== "Y") {
						rowData.checkedYn = "Y";
					}

					const allData = grdRawMtrInvntr.getGridDataAll();
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

					let sortRdcdRt = parseFloat(SBUxMethod.get("srch-inp-sortRdcdRt")) || 0;
					let actlWght = gfn_apcEstmtWght(inptWght * (1 - sortRdcdRt / 100), gv_selectedApcCd);
					let sortWght = parseInt(SBUxMethod.get("dtl-inp-sortWght")) || 0;
					SBUxMethod.set("dtl-inp-lossWght", actlWght - sortWght);
					SBUxMethod.set("dtl-inp-actlWght", actlWght);

					break;

				default:
					return;
			}
		}
	}

 	/**
     * @name fn_grdSortPrfmncValueChanged
     * @description 선별등록 변경 event 처리
     * @function
     */
	const fn_grdSortPrfmncValueChanged = function() {
		var nRow = grdSortPrfmnc.getRow();
		var nCol = grdSortPrfmnc.getCol();

		const usrAttr = grdSortPrfmnc.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

			const rowData = grdSortPrfmnc.getRowData(nRow, false);	// deep copy

			switch (usrAttr.colNm) {
				case "spcfctCd":	// 규격

					const spcfctInfo = _.find(jsonApcSpcfct, {spcfctCd: rowData.spcfctCd});
					// 규격중량(단중) set
	    			rowData.spcfctWght = spcfctInfo.wght;

				case "sortQntt":
					let spcfctWght = parseInt(rowData.spcfctWght) || 0;

					const wght = rowData.sortQntt * spcfctWght;
					rowData.sortWght = wght;

					grdSortPrfmnc.refresh();

					let inptWght = parseInt(SBUxMethod.get("dtl-inp-inptWght")) || 0;
					let sortWght = 0;
					const allSortData = grdSortPrfmnc.getGridDataAll();
					allSortData.forEach((item, index) => {
						if (!gfn_isEmpty(item.inptYmd)) {
							sortWght += parseInt(item.sortWght) || 0;
						}
					});

					SBUxMethod.set("dtl-inp-sortWght", sortWght);
					let actlWght = parseInt(SBUxMethod.get("dtl-inp-actlWght")) || 0;
					SBUxMethod.set("dtl-inp-lossWght", actlWght - sortWght);
					break;

				default:
					return;
			}
		}
	}

 	/**
 	 * @name fn_clearPrdcr
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

	/** ui event */
	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {
		fn_clearPrdcr();
		let result = await Promise.all([
			fn_initSBSelect(),
			fn_getPrdcrs(),
			fn_getStdGrd()
		]);
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {

		let itemCd = obj.value;
		const itemInfo = _.find(jsonApcItem, {value: itemCd});

		let sortRdcdRt = 0;
		if (!gfn_isEmpty(itemInfo)) {
			sortRdcdRt = parseFloat(itemInfo.sortRdcdRt) || 0;

			SBUxMethod.set("srch-inp-sortRdcdRt", sortRdcdRt);
			document.querySelector('#rt-sortRdcd').innerText = sortRdcdRt;
		}

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),			// 품종
			fn_getApcSpcfct(itemCd),
			//fn_getApcGrd(itemCd)
			fn_getStdGrd(itemCd)
		]);

		jsonSortPrfmnc.length = 0;
		fn_createGridSortPrfmnc();
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
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
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	 function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
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

		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}
	}
	
	// 엑셀다운로드
	// exp combo
	var jsonExpSltItem = [];
	var jsonExpSltVrty = [];
	var jsonExpSltPrdcr = [];
	var jsonExpSltWrhsSeCd = [];
	var jsonExpSltGdsSeCd = [];
	var jsonExpSltTrsprtSeCd = [];
	var jsonExpSltWarehouseSeCd = [];
	var jsonExpSltBxKnd = [];
	var jsonExpSltFclt = [];
	var jsonExpSltSpcfct = [];

	var grdExpRawMtrWrhs;
	var grdExpItem;
	var grdExpVrty;
	var grdExpPrdcr;
	var grdExpWrhsSeCd;
	var grdExpGdsSeCd;
	var grdExpTrsprtSeCd;
	var grdExpWarehouseSeCd;
	var grdExpBxKnd;
	var grdExpStdGrd;
	var grdExpStdGrdDtl;
	var grdExpFclt;
	var grdExpSpcfct;

	// exp grid json
	var jsonExpRawMtrWrhs = [];
	var jsonExpItem = [];
	var jsonExpVrty = [];
	var jsonExpPrdcr = [];
	var jsonExpWrhsSeCd = [];
	var jsonExpGdsSeCd = [];
	var jsonExpTrsprtSeCd = [];
	var jsonExpWarehouseSeCd = [];
	var jsonExpBxKnd = [];
	var jsonExpStdGrd = [];
	var jsonExpStdGrdDtl = [];
	var jsonExpFclt = [];
	var jsonExpSpcfct = [];
	
	const fn_getExpColumns = function() {
		const _columns = []
		_columns.push(
			{caption: ["입고일자"],		ref: 'wrhsYmd',      type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["품목"], 		ref: 'itemCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["품종"], 		ref: 'vrtyCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltVrty', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["생산자"], 		ref: 'prdcrCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltPrdcr', 	displayui : false,	itemcount: 10, label:'prdcrNm', value:'prdcrCd'}},
			{caption: ["설비"], 		ref: 'fcltCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltFclt', 	displayui : false,	itemcount: 10, label:'fcltNm', value:'fcltCd'}},
			{caption: ["규격"], 		ref: 'spcfctCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltSpcfct', 	displayui : false,	itemcount: 10, label:'spcfctNm', value:'spcfctCd'}},
	        {caption: ["입고구분"], 	ref: 'wrhsSeCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltWrhsSeCd', 	displayui : false,	itemcount: 10, label:'cdVlNm', value:'cdVl'}},
	        {caption: ["상품구분"], 	ref: 'gdsSeCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltGdsSeCd', 	displayui : false,	itemcount: 10, label:'cdVlNm', value:'cdVl'}},
	        {caption: ["운송구분"], 	ref: 'trsprtSeCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltTrsprtSeCd', 	displayui : false,	itemcount: 10, label:'cdVlNm', value:'cdVl'}},
				{caption: ["보관창고"],		ref: 'warehouseSeCd',	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonExpSltWarehouseSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["박스"],		ref: 'pltBxCd ',	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltBxKnd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["생산연도"],		ref: 'prdctnYr',    	type:'output',  width:'80px',    style:'text-align:left'},
	        {caption: ["차량번호"],		ref: 'vhclno',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["박스수량"],		ref: 'bxQntt',      type:'output',  width:'60px',    style:'text-align:right'},
	        {caption: ["중량 Kg"],	ref: 'wrhsWght',    type:'output',  width:'60px',    style:'text-align:right'}
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
			{caption: ["비고"],		ref: 'rmrk',      	type:'output',  width:'200px',    style:'text-align:left'}
	    );

	    return _columns;
	}
	
	const fn_setSltJson = async function() {
		// set exp/imp combo json
		// 품목
		jsonExpSltItem = gfn_cloneJson(jsonApcItem);
		// 품종
		jsonExpSltVrty = gfn_cloneJson(jsonApcVrty);
		// 생산자
		jsonExpSltPrdcr = gfn_cloneJson(jsonPrdcr);
		//설비
		jsonExpSltFclt = gfn_cloneJson(jsonComFclt);
		//규격
		jsonExpSltSpcfct = gfn_cloneJson(jsonApcSpcfct);
		// 입고구분
// 		jsonExpSltWrhsSeCd = gfn_cloneJson(jsonComWrhsSeCd);
		// 상품구분
// 		jsonExpSltGdsSeCd = gfn_cloneJson(jsonComGdsSeCd);
		// 운송구분
// 		jsonExpSltTrsprtSeCd = gfn_cloneJson(jsonComTrsprtSeCd);
		// 보관창고
		jsonExpSltWarehouseSeCd = gfn_cloneJson(jsonComWarehouse);
		// 박스
// 		jsonExpSltBxKnd = gfn_cloneJson(jsonApcBx);
	}
	const fn_setExpJson = async function() {
		// export grid data
		jsonExpRawMtrWrhs.length = 0;
		jsonExpItem = gfn_cloneJson(jsonApcItem);
		jsonExpVrty = gfn_cloneJson(jsonApcVrty);
		jsonExpPrdcr = gfn_cloneJson(jsonPrdcr);
		jsonExpFclt = gfn_cloneJson(jsonComFclt);
		jsonExpSpcfct = gfn_cloneJson(jsonApcSpcfct);
// 		jsonExpWrhsSeCd = gfn_cloneJson(jsonComWrhsSeCd);
// 		jsonExpGdsSeCd = gfn_cloneJson(jsonComGdsSeCd);
// 		jsonExpTrsprtSeCd = gfn_cloneJson(jsonComTrsprtSeCd);
		jsonExpWarehouseSeCd = gfn_cloneJson(jsonComWarehouse);
// 		jsonExpBxKnd = gfn_cloneJson(jsonApcBx);
		jsonExpStdGrd = gfn_cloneJson(gjsonStdGrdObjKnd);
		jsonExpStdGrdDtl = gfn_cloneJson(gjsonStdGrdObjDtl);
	}
	const fn_createExpGrid = async function(_expObjList) {
		_expObjList.forEach( (exp, idx) => {
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
			/*
			if (idx === 0) {
				exp.sbGrid.addRow(true, {
				   	wrhsYmd 		: gfn_dateToYmd(new Date())
			      , itemCd			: "0101"
			      , vrtyCd			: "2000"
			      , prdcrCd			: "0001"
			      , wrhsSeCd		: "1"
			      , gdsSeCd			: "1"
			      , trsprtSeCd		: "1"
			      , warehouseSeCd 	: "01"
			      , pltBxCd 		: "0001"
			      , prdctnYr		: "2023"
			      , stdGrd			: "01"
			      , stdGrdDtl		: "01"
			      , bxQntt    		: "5"
			      , wrhsWght		: "500"
			      , rmrk			: "비고"
				});
			}
			*/
		});
	}

	const fn_dwnld = async function(){

		const itemCd = SBUxMethod.get("srch-slt-itemCd");			// 품목
		const wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");			// 입고일자
		const wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");			// 입고일자
		const vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");			// 품종
		const fcltCd = SBUxMethod.get("dtl-slt-fcltCd");			// 설비

		if (gfn_isEmpty(itemCd)) {
			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
            return;
		}
		if (gfn_isEmpty(wrhsYmdFrom)) {
			gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 선택하세요.
            return;
		}
		if (gfn_isEmpty(wrhsYmdTo)) {
			gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 선택하세요.
            return;
		}
		if (gfn_isEmpty(vrtyCd)) {
			gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
            return;
		}
		if (gfn_isEmpty(fcltCd)) {
			gfn_comAlert("W0001", "설비");		//	W0002	{0}을/를 선택하세요.
            return;
		}

		await fn_setSltJson();
		await fn_setExpJson();

		const expColumns = fn_getExpColumns();

		const expObjList = [
		    {
		        sbGrid: grdExpRawMtrWrhs,
		        parentid: "sbexp-area-grdExpRawMtrWrhs",
		        id: "grdExpRawMtrWrhs",
		        jsonref: "jsonExpRawMtrWrhs",
				columns: expColumns,
		        sheetName: "선별실적내역",
		        title: "",
		        unit: ""
		    }, {
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
					{caption: ["품종코드"],    ref: 'vrtyCd',  type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["품종명칭"],    ref: 'vrtyNm',  type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "품종",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpPrdcr,
		        parentid: "sbexp-area-grdExpPrdcr",
		        id: "grdExpPrdcr",
		        jsonref: "jsonExpPrdcr",
				columns: [
			    	{caption: ["생산자코드"],   ref: 'prdcrCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["생산자명"],    	ref: 'prdcrNm',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ['대표품목'],		ref: 'rprsItemCd', 	type: 'output', width: '80px', style: 'text-align:center'},
			        {caption: ['대표품종'], 	ref: 'rprsVrtyCd', 	type: 'output', width: '80px', style: 'text-align:center'}
				],
		        sheetName: "생산자",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpFclt,
		        parentid: "sbexp-area-grdExpFclt",
		        id: "grdExpFclt",
		        jsonref: "jsonExpFclt",
				columns: [
			    	{caption: ["설비코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["설비코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "설비",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpSpcfct,
		        parentid: "sbexp-area-grdExpSpcfct",
		        id: "grdExpSpcfct",
		        jsonref: "jsonExpSpcfct",
				columns: [
			    	{caption: ["규격코드"],   	ref: 'spcfctCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["규격코드명"],  	ref: 'spcfctNm',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "규격",
		        title: "",
		        unit: ""
		    },  {
		        sbGrid: grdExpWarehouseSeCd,
		        parentid: "sbexp-area-grdExpWarehouseSeCd",
		        id: "grdExpWarehouseSeCd",
		        jsonref: "jsonExpWarehouseSeCd",
				columns: [
			    	{caption: ["창고코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["창고코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "창고",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpBxKnd,
		        parentid: "sbexp-area-grdExpBxKnd",
		        id: "grdExpBxKnd",
		        jsonref: "jsonExpBxKnd",
				columns: [
			    	{caption: ["박스코드"],   	ref: 'pltBxCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["박스코드명"],  	ref: 'pltBxNm',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "박스",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpStdGrd,
		        parentid: "sbexp-area-grdExpStdGrd",
		        id: "grdExpStdGrd",
		        jsonref: "jsonExpStdGrd",
				columns: [
			    	{caption: ["품목코드"],   	ref: 'itemCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["품목명"],   	ref: 'itemNm',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급코드"],   	ref: 'grdKnd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급코드명"],  	ref: 'grdKndNm',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "등급",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpStdGrdDtl,
		        parentid: "sbexp-area-grdExpStdGrdDtl",
		        id: "grdExpStdGrdDtl",
		        jsonref: "jsonExpStdGrdDtl",
				columns: [
					{caption: ["품목코드"],		ref: 'itemCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["품목명"],   	ref: 'itemNm',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급코드"],   	ref: 'grdKnd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급명"],   	ref: 'grdKndNm',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급상세코드"], 	ref: 'grdCd',  		type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급상세명"],  	ref: 'grdNm',  		type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "등급상세",
		        title: "",
		        unit: ""
		    },
		];

		await fn_createExpGrid(expObjList);

		//exportExcel();
	    gfn_exportExcelMulti("선별실적(샘플).xlsx", expObjList);
	}

	const gfn_exportExcelMulti = function(_fileName, _objList) {

		var objExcelInfo = {
			strFileName : _fileName,
			//strAction : "/saveExcel.do",
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


	const importExcelData = function (e){
    	 SBUxMethod.openModal('modal-excel');
    	 fn_createGridPopup();
    	 jsonExcelRawMtrWrhsPopup = 0;
    	 grdExcelRawMtrWrhsPopup.rebuild();

    	 grdExcelRawMtrWrhsPopup.importExcelData(e);
     }
</script>
</body>
</html>