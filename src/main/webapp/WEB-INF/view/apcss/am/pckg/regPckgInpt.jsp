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
								<sbux-datepicker id="srch-dtp-sortYmdFrom" name="srch-dtp-sortYmdFrom" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-sortYmdTo" name="srch-dtp-sortYmdTo" uitype="popup" class="form-control input-sm"></sbux-datepicker>
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
					<div id="sb-area-grdSortInvntr" style="width:100%;height:300px;"></div>
				</div>
				<div style="height:5px"></div>
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
									class="form-control input-sm"
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
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>포장실적 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdPckgPrfmnc" style="width:100%;height:200px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
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

		let ymd = gfn_dateToYmd(new Date());

		SBUxMethod.set("srch-dtp-sortYmdFrom", ymd.substring(0, 6) + "01");
		SBUxMethod.set("srch-dtp-sortYmdTo", ymd);
		SBUxMethod.set("dtl-dtp-pckgYmd", ymd);

		await fn_initSBSelect();
		fn_createGridSortInvntr();
		fn_createGridPckgPrfmnc();

		fn_clearForm();
	}

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let result = await Promise.all([
		 	gfn_setComCdSBSelect('dtl-slt-fcltCd',		jsonComPckgFclt, 'PCKG_FCLT_CD', gv_selectedApcCd),		// 설비
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonApcItem, gv_selectedApcCd),		// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonApcVrty, gv_selectedApcCd),		// 품종
		 	//gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonApcSpcfct, gv_selectedApcCd),		// 규격

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
	}

	const fn_getStdGrdJgmtCd = function(vl) {

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
	    SBGridProperties.selectmode = 'byrow';
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
	    SBGridProperties.selectmode = 'byrow';
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
		jsonStdGrdKnd.forEach((item, index) => {
			const _jsonId = stdGrdJsonList[index];
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

		if (jsonStdGrdKnd.length > 1) {
			jsonStdGrdJgmt.forEach((item, index) => {
				const jgmtGrd = {
					caption: ["판정등급"],
					ref: "jgmtGrdCd",
					type:'combo',
					width:'80px',
					style: 'text-align:center;',
					userattr: {colNm: "jgmtGrd"},
					typeinfo: {ref: "jsonStdGrdJgmt", label:'grdNm', value:'grdCd', displayui : false, unselect: {label : '선택', value: 'notSelect'}}
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

			jsonStdGrdKnd.forEach((knd, idx) => {
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

			if (jsonStdGrdKnd.length > 1 && jsonStdGrdJgmt.length > 0) {
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
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),			// 품종
			//gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonApcSpcfct, gv_selectedApcCd, itemCd),	// 규격
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
</script>
</html>