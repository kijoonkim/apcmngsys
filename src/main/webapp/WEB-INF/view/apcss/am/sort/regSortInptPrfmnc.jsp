<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
			</div>
			<div style="margin-left: auto;">
				<p class="ad_input_row">
					<sbux-checkbox id="needsPckgRegYn" name="chk-pckgAuto" true-value="Y" false-value="N" uitype="normal" text="포장실적 자동등록" ></sbux-checkbox>
				</p>
				<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-dark" onclick="fn_search" text="조회"></sbux-button>
				<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-dark" onclick="fn_save" text="저장"></sbux-button>
			</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
						<th scope="row" class="th_bg">입고일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-wrhsYmdFrom" name="srch-dtp-wrhsYmdFrom" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-wrhsYmdTo" name="srch-dtp-wrhsYmdTo" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
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
									unselected-text="전체"
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
									placeholder="초성검색 기능입니다."
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
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
							<td class="td_input" ></td>
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
						<col style="width: 4%">
						<col style="width: 4%">
						<col style="width: 4%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">선별일자</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="dtl-dtp-inptYmd" name="dtl-dtp-inptYmd" uitype="popup" class="form-control input-sm sbux-pik-group-apc"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">설비</th>
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
							<th scope="row" class="th_bg">투입/선별/loss</th>
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
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnDown" name="btnDown" uitype="normal" text="내려받기" class="btn btn-xs btn-outline-danger"></sbux-button>
						<sbux-button id="btnUp" name="btnUp" uitype="normal" text="올리기" class="btn btn-xs btn-outline-danger"></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdSortPrfmnc" style="height:200px;"></div>
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
	var jsonComFclt			= [];	// 설비 		FCLT_CD
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
		 	gfn_setComCdSBSelect('dtl-slt-fcltCd',		jsonComFclt, 'FCLT_CD', gv_selectedApcCd),		// 설비
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonApcItem, gv_selectedApcCd),		// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 	jsonApcVrty, gv_selectedApcCd),		// 품종
		 	fn_getWarehouse(),
		 	fn_getApcSpcfct(),
		 	fn_getApcGrd()
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
     * @description 생산자 자동완성 JSON 설정
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
	 * @name fn_getApcSpcfct
     * @description 생산자 자동완성 JSON 설정
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

	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {

		let ymd = gfn_dateToYmd(new Date());
		SBUxMethod.set("srch-dtp-wrhsYmdFrom", ymd);
		SBUxMethod.set("srch-dtp-wrhsYmdTo", ymd);
		SBUxMethod.set("dtl-dtp-inptYmd", ymd);

		let result = await Promise.all([
				fn_initSBSelect(),
				fn_getPrdcrs()
			]);

		fn_createGridRawMtrInvntr();
		fn_createGridSortPrfmnc();

		fn_clearForm();
	}

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
            {caption: ["설비","설비"],	    	ref: 'fcltNm', 			type:'output',  width:'120px', style: 'text-align:center'},
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
	        {caption: [" "," "],	ref: '_',		type:'output',  width:'1px'},
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

		const columnsGrd = [];
		let idx = 0;

		jsonApcGrd.forEach((item, index) => {
			idx++;
			if (idx > 5) {
				return false;
			}
			const grd = {
				caption: [item.grdNm],
				ref: 'grd' + idx,
				type:'input',
				width:'80px',
				style: 'text-align:right;background-color:#FFF8DC',
				userattr: {colNm: "grdQntt"},
				typeinfo: {
					mask : {alias : '#', repeat: '*', unmaskvalue : true},
					maxlength: 6,
					oneclickedit: true
					},
				format : {type:'number', rule:'#,###'}
			}

			columnsGrd.push(grd);
		});

		while (idx < 5) {
			idx++;
			const grd = {
				caption: [""],
				ref: 'grd' + idx,
				type:'output',
				width:'0px'
			}
			columnsGrd.push(grd);
		}

		columnsGrd.forEach((item, index) => {
			SBGridProperties.columns.push(item);
		});

		const columns2 = [
			{caption: ["합계"], 	 	ref: 'qntt',   type:'output',  width:'80px', style: 'text-align:right'},
            {caption: ["kg"], 		ref: 'wght', type:'output',  width:'100px', style: 'text-align:right', format : {type:'number', rule:'#,### Kg'}},
            {caption: ["저장창고"],		ref: 'warehouseSeCd',    type:'combo',  width:'100px', style: 'text-align:center;background-color:#FFF8DC;',
           	 	typeinfo: {ref:'jsonComWarehouse', label:'cdVlNm', value:'cdVl', oneclickedit: true}
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

		let needsPckgRegYn = SBUxMethod.get("chk-pckgAuto").needsPckgRegYn;

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
			const qntt = parseInt(allSortData[i].qntt) || 0;
			const wght = parseInt(allSortData[i].wght) || 0;

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
			if (qntt <= 0) {
				gfn_comAlert("W0005", "선별수량");		//	W0005	{0}이/가 없습니다.
				return;
			}
			if (wght <= 0) {
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

				const qntt = parseInt(item.qntt) || 0;
				const wght = parseInt(item.wght) || 0;


    			let idx = 0;
    			jsonApcGrd.forEach((grd, grdIdx) => {

    				idx++;
    				if (idx > 5) {
    					return false;
    				}
    				let grdCd = grd.grdCd;
    				let grdQntt = 0;

    				switch (idx) {
    					case 1:
    						grdQntt = parseInt(item.grd1) || 0;
    						break;
    					case 1:
    						grdQntt = parseInt(item.grd2) || 0;
    						break;
    					case 1:
    						grdQntt = parseInt(item.grd3) || 0;
    						break;
    					case 1:
    						grdQntt = parseInt(item.grd4) || 0;
    						break;
    					case 1:
    						grdQntt = parseInt(item.grd5) || 0;
    						break;
    					default:
    						break;
    				}

    				if (grdQntt > 0) {
    					sortPrfmnc = {
   							inptYmd: inptYmd,
   		    				fcltCd: fcltCd,
   		    				itemCd: itemCd,
   		    				vrtyCd: vrtyCd,
   		    				spcfctCd: spcfctCd,
   		    				warehouseSeCd: warehouseSeCd,
   		    				grdCd: grdCd,
   		    				qntt: grdQntt,
   		    				wght: grdQntt * spcfctWght
    					}

    					sortPrfmncList.push(sortPrfmnc);
    				}
    			});

    			sortInptWght += wght;
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
		if (needsPckgRegYn === "Y") {
			if (!gfn_comConfirm("Q0001", "선별 및 포장실적 저장")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}
		} else {
			if (!gfn_comConfirm("Q0001", "선별실적저장")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}
		}

		const sortMng = {
    		apcCd: gv_selectedApcCd,
    		needsPckgRegYn: needsPckgRegYn,
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
	 * @name fn_lblSort
	 * @description 라벨발행
	 * @param {number} nRow
	 */
	const fn_lblSort = async function(nRow) {
		grdSortPrfmnc.addRow(true);
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
		grdSortPrfmnc.setCellDisabled(nRow, 4, nRow, grdSortPrfmnc.getCols() - 1, false);
		nRow++;
		grdSortPrfmnc.addRow(true);
		grdSortPrfmnc.setCellDisabled(nRow, 0, nRow, grdSortPrfmnc.getCols() - 1, false);

		document.querySelector('#cnt-rawMtrInvtr').innerText = nRow;
	}
	/**
	 * @name fn_delRow
	 * @description 행삭제
	 * @param {number} nRow
	 */
	const fn_delRow = async function(nRow, nCol) {
		 grdSortPrfmnc.deleteRow(nRow);
		 document.querySelector('#cnt-sortPrfmnc').innerText = grdRawMtrInvntr.getGridDataAll().length - 1;
	}

 	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {
		SBUxMethod.set("dtl-inp-inptWght", 0);
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
					let sortWght = parseInt(SBUxMethod.get("dtl-inp-sortWght")) || 0;
					SBUxMethod.set("dtl-inp-lossWght", inptWght - sortWght);

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
				case "grdQntt":
					let spcfctWght = parseInt(rowData.spcfctWght) || 0;
					let grd1 = parseInt(rowData.grd1) || 0;
					let grd2 = parseInt(rowData.grd2) || 0;
					let grd3 = parseInt(rowData.grd3) || 0;
					let grd4 = parseInt(rowData.grd4) || 0;
					let grd5 = parseInt(rowData.grd5) || 0;

					const qntt = grd1 + grd2 + grd3 + grd4 + grd5;
					const wght = qntt * spcfctWght;

					rowData.qntt = qntt;
					rowData.wght = wght;

					console.log("rowData.spcfctWght", rowData.spcfctWght);
					console.log("rowData.qntt", rowData.qntt);
					console.log("rowData.wght", rowData.wght);

					grdSortPrfmnc.refresh();

					let inptWght = parseInt(SBUxMethod.get("dtl-inp-inptWght")) || 0;
					let sortWght = 0;
					const allSortData = grdSortPrfmnc.getGridDataAll();
					allSortData.forEach((item, index) => {
						if (!gfn_isEmpty(item.inptYmd)) {
							sortWght += parseInt(item.wght) || 0;
						}
					});

					SBUxMethod.set("dtl-inp-sortWght", sortWght);
					SBUxMethod.set("dtl-inp-lossWght", inptWght - sortWght);

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
			fn_getPrdcrs()
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
			fn_getApcSpcfct(itemCd),
			fn_getApcGrd(itemCd)
		]);

		jsonSortPrfmnc.length = 0;
		fn_createGridSortPrfmnc();
		//grdSortPrfmnc.refresh();
		//
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

</script>
</body>
</html>