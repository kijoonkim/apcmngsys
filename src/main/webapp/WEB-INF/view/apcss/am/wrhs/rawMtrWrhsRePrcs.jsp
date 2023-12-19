<%
 /**
  * @Class Name : rawMtrWrhsRePrcs.jsp
  * @Description : 원물입고 재처리 화면
  * @author SI개발부
  * @since 2023.11.20
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.11.20   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 원물입고재처리</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물입고재처리 -->
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
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-dark" onclick="fn_search" text="조회"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<sbux-input id="srch-inp-unitWght" name="srch-inp-unitWght" uitype="hidden"></sbux-input>
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
								<sbux-datepicker id="srch-dtp-wrhsYmdFrom" name="srch-dtp-wrhsYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-wrhsYmdTo" name="srch-dtp-wrhsYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(srch-dtp-wrhsYmdTo)"></sbux-datepicker>
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
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
   								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
					<div id="sb-area-grdRawMtrInvntr" style="height:235px;"></div>
				</div>

				<br/>

				<table class="table table-bordered tbl_fixed">
					<caption>등록 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 3%">
						<col style="width: 4%">
						<col style="width: 2%">
						<col style="width: 6%">

						<col style="width: 7%">
						<col style="width: 3%">
						<col style="width: 4%">
						<col style="width: 2%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>재처리일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="dtl-dtp-inptYmd"
									name="dtl-dtp-inptYmd"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"
								></sbux-datepicker>
							</td>
							<td colspan='2'></td>

							<th scope="row" class="th_bg">투입 총량</th>
							<!--
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-inptQntt"
									name="dtl-inp-inptQntt"
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
									id="dtl-inp-inptWght"
									name="dtl-inp-inptWght"
									class="form-control input-sm"
									maxlength="6"
									autocomplete="off"
									readonly
									mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
								/>
							</td>
							<td style="border-right: hidden;">Kg</td>
							-->
							<td colspan="4" class="td_input" >
								<sbux-label
									id="lbl-grdInptWght"
									name="lbl-grdInptWght"
									uitype="normal"
									text=""
									style="font-size:12px;font-weight:bold;"
								></sbux-label>
							</td>

							<th scope="row" class="th_bg">투입 잔량</th>
							<!--
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="dtl-inp-wrhsQntt"
									name="dtl-inp-wrhsQntt"
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
									id="dtl-inp-wrhsWght"
									name="dtl-inp-wrhsWght"
									class="form-control input-sm input-sm-ast"
									maxlength="6"
									autocomplete="off"
									readonly
									mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
								/>
							</td>
							<td style="border-right: hidden;">Kg</td>
							 -->
							<td colspan="4" class="td_input" >
								<sbux-label
									id="lbl-grdPrcsWght"
									name="lbl-grdPrcsWght"
									uitype="normal"
									text=""
									style="font-size:12px;font-weight:bold;"
								></sbux-label>
							</td>

						</tr>
					</tbody>
	            </table>

				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>원물입고 재처리 내역</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-dark" onclick="fn_save" text="저장"></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdRawMtrRePrcs" style="height:200px;"></div>
				</div>

				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>

    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>
</body>
<script type="text/javascript">

	/* SB Select */
	var jsonApcItem			= [];	// 품목 		itemCd
	var jsonApcVrty			= [];	// 품종 		vrtyCd
	var jsonComWarehouse	= [];	// 창고		WAREHOUSE_SE_CD
	var jsonApcBx			= [];	// 팔레트/박스 	검색

	/* 생산자 자동완성 */
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

    /* SBGrid */
	var grdRawMtrInvntr;	// 원물재고
	var grdRawMtrRePrcs;	// 원물재처리

    /* SBGrid Data (JSON) */
	var jsonRawMtrInvntr = [];
	var jsonRawMtrRePrcs = [];


	const fn_initSBSelect = async function() {
		// 검색 SB select
		let result = await Promise.all([
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 	jsonApcItem,	gv_selectedApcCd),			// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd',	jsonApcVrty, 	gv_selectedApcCd),			// 품종
	 	]);
	}

	/**
	 * @name fn_getComJson
     * @description 공통 JSON 설정
	 */
	const fn_getComJson = async function() {
		let result = await Promise.all([
			gfn_getComCdDtls('WAREHOUSE_SE_CD', gv_selectedApcCd),
			gfn_getPltBxs(gv_selectedApcCd, 'B')
	 	]);
		// 창고
		jsonComWarehouse = result[0];
		// 박스종류
		jsonApcBx = result[1];
	}


	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {

		let nowDate = new Date();

		let firstYmd = gfn_dateFirstYmd(nowDate);
		let lastYmd = gfn_dateToYmd(nowDate);
		let nowYmd = gfn_dateToYmd(nowDate);

		SBUxMethod.set("srch-dtp-wrhsYmdFrom", firstYmd);
		SBUxMethod.set("srch-dtp-wrhsYmdTo", lastYmd);
		SBUxMethod.set("dtl-dtp-inptYmd", nowYmd);

		let result = await Promise.all([
				fn_initSBSelect(),
				fn_getPrdcrs(),
				fn_getComJson(),
			 	fn_getStdGrd()
			]);

		fn_createGridRawMtrInvntr();
		fn_createGridRawMtrRePrcs();

		fn_clearForm();
	}

	/**
	 * @name fn_getStdGrd
	 * @description 표준등급 json set
	 */
	const fn_getStdGrd = async function(_itemCd) {
		await gStdGrdObj.init(gv_selectedApcCd, _GRD_SE_CD_WRHS, _itemCd);
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	})

	/**
	 * @name fn_createGridRawMtrInvntr
	 * @description 원물재고 grid 생성
	 */
	const fn_createGridRawMtrInvntr = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdRawMtrInvntr';
		SBGridProperties.id = 'grdRawMtrInvntr';
		SBGridProperties.jsonref = 'jsonRawMtrInvntr';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.frozencols = 2;
		SBGridProperties.columns = [
			{
				caption : ["전체","<input type='checkbox' onchange='fn_checkAllRawMtrInvntr(grdRawMtrInvntr, this);'>"],
				ref: 'checkedYn', type: 'checkbox',  width:'50px',
				style: 'text-align:center',
				userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
        	{caption: ["입고일자","입고일자"],		ref: 'wrhsYmd',			type:'output',  width:'120px', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
            },
            {caption: ["팔레트번호","팔레트번호"], 	ref: 'pltno',     		type:'output',  width:'120px', style: 'text-align:center'},
            {caption: ["생산자","생산자"],    	ref: 'prdcrNm',     	type:'output',  width:'80px', style: 'text-align:center'},
            {caption: ["품목","품목"],	    	ref: 'itemNm',   		type:'output',  width:'80px', style: 'text-align:center'},
            {caption: ["품종","품종"],	    	ref: 'vrtyNm',   		type:'output',  width:'100px', style: 'text-align:center'},
            {caption: ["등급","등급"],	    	ref: 'grdNm',   		type:'output',  width:'80px', style: 'text-align:center'},
            {caption: ["상품구분","상품구분"],		ref: 'gdsSeNm', 		type:'output',  width:'80px', style: 'text-align:center'},
            {caption: ["창고","창고"],	    	ref: 'warehouseSeNm', 	type:'output',  width:'120px', style: 'text-align:center'},
            {caption: ["원물재고","수량"],  		ref: 'invntrQntt',   	type:'output',  width:'80px', style: 'text-align:right', format : {type:'number', rule:'#,###'}, typeinfo : {mask : {alias : 'numeric'}}},
            {caption: ["원물재고","중량 (Kg)"],  		ref: 'invntrWght',   	type:'output',  width:'80px', style: 'text-align:right', format : {type:'number', rule:'#,### '}, typeinfo : {mask : {alias : 'numeric'}}},
            {caption: ["투입","수량"], 			ref: 'inptQntt',  		type:'input',  width:'80px', style: 'text-align:right;background-color:#FFF8DC;',
            	userattr: {colNm: "inptQntt"},
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
            		maxlength: 6,
            		oneclickedit: true
				},
				format : {type:'number', rule:'#,###'}
            },
            {caption: ["투입","중량 (Kg)"], 			ref: 'inptWght',  		type:'input',  width:'80px', style: 'text-align:right;background-color:#FFF8DC;',
            	userattr: {colNm: "inptWght"},
            	typeinfo: {
            		mask : {alias : '#', repeat: '*', unmaskvalue : true},
            		maxlength: 6,
            		oneclickedit: true
				},
				format : {type:'number', rule:'#,### '}
         	},
		];

		const columnsStdGrd = [];
		gjsonStdGrdObjKnd.forEach((item, index) => {
			if (_.isEqual(item.stdGrdType, "RT")) {
	    		const grd = {
    				caption: ["등급상세정보", item.grdKndNm + " (Kg)"],
    				ref: "rt__" + item.grdKnd,
    				type:'output',
    				width:'80px',
    				style: 'text-align:right;',
    				userattr: {colNm: "stdGrdWght"},
    				format : {type:'number', rule:'#,###'}
    			}
	    		columnsStdGrd.push(grd);
	    	} else {
				const grd = {
					caption: ["등급상세정보", item.grdKndNm],
					ref: "nm__" + item.grdKnd,
    				type:'output',
    				width:'80px',
    				style: 'text-align:center;',
    				userattr: {colNm: "stdGrdNm"},
				}
				columnsStdGrd.push(grd);
	    	}

		});

		columnsStdGrd.forEach((item, index) => {
			SBGridProperties.columns.push(item);
		});

		const columns2 = [
         	//{caption: ["등급상세정보","등급상세정보"],	ref: 'stdGrd',	type:'output',  width:'200px', style: 'text-align:left;'},
         	{caption: ["",""],		ref: '_',			type:'output',  width:'1px', style: 'text-align:left;'},
 	        {caption: ["생산자코드"],	ref: 'prdcrCd',   	type:'output',  hidden: true},
	        {caption: ["품목코드"],		ref: 'itemCd',   	type:'output',  hidden: true},
	        {caption: ["품종코드"],		ref: 'vrtyCd',   	type:'output',  hidden: true},
	        {caption: ["상품구분코드"],	ref: 'gdsSeCd',   	type:'output',  hidden: true},
	        {caption: ["입고구분코드"],	ref: 'wrhsSeCd',   	type:'output',  hidden: true},
	        {caption: ["운송구분코드"],	ref: 'trsprtSeCd', 	type:'output',  hidden: true},
	        {caption: ["창고구분코드"],	ref: 'warehouseSeCd', 	type:'output',	hidden: true},
	        {caption: ["등급코드"],		ref: 'grdCd',   	type:'output',  hidden: true},
	        {caption: ["박스종류코드"],	ref: 'bxKnd',   	type:'output',  hidden: true},
	        {caption: ["입고번호"],		ref: 'wrhsno', 		type:'output',  hidden: true},
	        {caption: ["입고구분명"],	ref: 'wrhsSeNm', 	type:'output',  hidden: true},
	        {caption: ["운송구분명"],	ref: 'trsprtSeNm', 	type:'output',  hidden: true},
	        {caption: ["박스종류명"],	ref: 'bxKndNm', 	type:'output',  hidden: true},
    	];

		columns2.forEach((item, index) => {
			SBGridProperties.columns.push(item);
		});

		grdRawMtrInvntr = _SBGrid.create(SBGridProperties);
		grdRawMtrInvntr.bind('valuechanged' , 'fn_grdRawMtrInvntrValueChanged');
		grdRawMtrInvntr.bind('select' , 'fn_setValue');
		grdRawMtrInvntr.bind('deselect' , 'fn_delValue');
	}

	/**
	 * @name fn_createGridRawMtrRePrcs
	 * @description 원물재처리 grid 생성
	 */
	const fn_createGridRawMtrRePrcs = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdRawMtrRePrcs';
		SBGridProperties.id = 'grdRawMtrRePrcs';
		SBGridProperties.jsonref = 'jsonRawMtrRePrcs';
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
            {caption: ["품목"], 		ref: 'itemCd',		type:'combo',  width:'100px', style: 'text-align:center',
            	typeinfo: {ref:'jsonApcItem', label:'label', value:'value', displayui : false}
            },
            {caption: ["품종"], 		ref: 'vrtyCd',		type:'combo',  width:'100px', style: 'text-align:center',
            	typeinfo: {ref:'jsonApcVrty', label:'label', value:'value', displayui : false}
            },
            /*
            {caption: ["박스종류"],	ref: 'bxKnd',    type:'combo',  width:'140px', style: 'text-align:center',
            	userattr: {colNm: "bxKnd"},
            	typeinfo: {ref:'jsonApcBx', label:'pltBxNm', value:'pltBxCd', oneclickedit: true, unselect: {label : '', value: ''}},
            },
            */
    	];

		const columnsStdGrd = [];
		let cntRt = 0;

		gjsonStdGrdObjKnd.forEach((item, index) => {

			if (_.isEqual(item.stdGrdType, "RT")) {
	    		cntRt++;
	    		grd = {
    				caption: [item.grdKndNm + " (Kg)"],
    				ref: gStdGrdObj.colPrfx + item.grdKnd,
    				type:'input',
    				width:'80px',
    				style: 'text-align:right;background-color:#FFF8DC;',
    				userattr: {colNm: "stdGrdWght"},
    				typeinfo: {
    					mask : {alias : '#', repeat: '*', unmaskvalue : true},
    					maxlength: 6,
    					oneclickedit: true
    				},
    				format : {type:'number', rule:'#,###'}
    			}
	    	} else {
	    		grd = {
    				caption: ["등급:" + item.grdKndNm],
    				ref: gStdGrdObj.colPrfx + item.grdKnd,
    				type:'combo',
    				width:'80px',
    				style: 'text-align:center;background-color:#FFF8DC;',
    				userattr: {colNm: "stdGrd"},
    				typeinfo: {ref: item.jsonId, label:'grdNm', value:'grdCd', displayui : false, oneclickedit: true}
    			}
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
			SBGridProperties.columns.push(jgmtGrd);
		}

		columnsStdGrd.forEach((item, index) => {
			SBGridProperties.columns.push(item);
		});

		const columns2 = [
			/*
			{
				caption: ["총 수량"],
				ref: 'wrhsQntt',
				datatype: 'number',
				type:'input',
				width:'80px',
				style: 'text-align:right',
				userattr: {colNm: "wrhsQntt"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 6,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
			},
			*/
			{
				caption: ["총 중량 (Kg)"],
				ref: 'wrhsWght',
				type:'output',
				width:'80px',
				style: 'text-align:right',
				userattr: {colNm: "wrhsWght"},
				format : {type:'number', rule:'#,### '},
				typeinfo : {mask : {alias : 'numeric'}}
			},
			/*
			{
				caption: ["총 중량 (Kg)"],
				ref: 'wrhsWght',
				datatype: 'number',
				type:'input',
				width:'80px',
				style: 'text-align:right;background-color:#FFF8DC',
				userattr: {colNm: "wrhsWght"},
				typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 6,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
			},
			 */
            {caption: ["저장창고"],		ref: 'warehouseSeCd',    type:'combo',  width:'100px', style: 'text-align:center;background-color:#FFF8DC;',
           	 	typeinfo: {ref:'jsonComWarehouse', label:'cdVlNm', value:'cdVl', oneclickedit: true}
            },
            {
            	caption: ["컨테이너번호"],
            	ref: 'pltno',
            	type:'input',
            	width:'150px',
            	style: 'text-align:center;background-color:#FFF8DC;',
            	typeinfo: {
	                maxlength: 20,
	                oneclickedit: true,
	                mask : {alias : '*', repeat : '*'}
                }
            },
            {caption: ["비고"], 		ref: 'rmrk',  		type:'input',  width:'200px'},
	        {caption: ["품목코드"],		ref: 'itemCd',   	type:'output',  hidden: true},
	        //{caption: [" "],		ref: '_',			type:'output',  width:'1px'},
		];

		columns2.forEach((item, index) => {
			SBGridProperties.columns.push(item);
		});

		grdRawMtrRePrcs = _SBGrid.create(SBGridProperties);
		grdRawMtrRePrcs.bind('valuechanged', fn_grdRawMtrRePrcsValueChanged);

		let nRow = grdRawMtrRePrcs.getRows();
		grdRawMtrRePrcs.addRow(true);
		grdRawMtrRePrcs.setCellDisabled(nRow, 0, nRow, grdRawMtrRePrcs.getCols() - 1, true);
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

		const postJsonPromise = gfn_postJSON("/am/invntr/selectRawMtrInvntrListForPrcs.do", {
			apcCd: gv_selectedApcCd,
			wrhsYmdFrom: wrhsYmdFrom,
			wrhsYmdTo: wrhsYmdTo,
			prdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,

			inptYmd: inptYmd,
          	// pagination
  	  		pagingYn : 'N',
  		});
        const data = await postJsonPromise;

  		try {

  			if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }
  			
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
  						cmndQntt: item.cmndQntt,
  						cmndWght: item.cmndWght,
  						inptPrgrsQntt: item.inptPrgrsQntt,
  						inptPrgrsWght: item.inptPrgrsWght,
  						stdGrd: item.stdGrd,
  						stdGrdCd: item.stdGrdCd,
  				}

          		if (!gfn_isEmpty(item.stdGrdCd)) {
          			item.stdGrdCd.split(',').forEach((item) => {
        				const grd = item.split(':');
        				const grdKnd = grd[0];
        				const grdWght = parseFloat(grd[4]) || 0;
        				const grdNm = grd[5];
        				rawMtrInvntr["rt__" + grdKnd] = grdWght;
        				rawMtrInvntr["nm__" + grdKnd] = grdNm;
        			});
        		}

          		jsonRawMtrInvntr.push(rawMtrInvntr);
  			});

          	grdRawMtrInvntr.rebuild();

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

    /**
     * @name fn_search
     * @description 조회 버튼
     */
	const fn_search = async function() {
  		
		if (gfn_isEmpty(SBUxMethod.get("srch-dtp-wrhsYmdFrom")) || gfn_isEmpty(SBUxMethod.get("srch-dtp-wrhsYmdTo"))) {
    		gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 입력하세요.
            return;
    	}

  		if (gfn_isEmpty(SBUxMethod.get("srch-slt-itemCd"))) {
  			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
            return;
  		}

  		if (gfn_isEmpty(SBUxMethod.get("srch-slt-vrtyCd"))) {
  			gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
            return;
  		}

    	// grid clear
    	jsonRawMtrInvntr.length = 0;
    	fn_setGrdRawMtrInvntr();

    	jsonRawMtrRePrcs.length = 0;
		fn_createGridRawMtrRePrcs();

    	fn_clearForm();
	}

    /**
     * @name fn_save
     * @description 저장 버튼
     */
	const fn_save = async function() {

		const wrhsYmd = SBUxMethod.get("dtl-dtp-inptYmd");

		if (gfn_isEmpty(wrhsYmd)) {
			gfn_comAlert("W0005", "재처리일자");		//	W0005	{0}이/가 없습니다.
			return;
		}

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
		const rawMtrRePrcsList = [];
		const allRePrcsData = grdRawMtrRePrcs.getGridDataAll();

		let totalWrhsQntt = 0;
		let totalWrhsWght = 0;

		for ( let iRow = 1; iRow <= allRePrcsData.length; iRow++ ) {

			const rowData = grdRawMtrRePrcs.getRowData(iRow);
			if (gfn_isEmpty(rowData.itemCd)) {
				continue;
			}

			const itemCd = rowData.itemCd;
			const vrtyCd = rowData.vrtyCd;
			const warehouseSeCd = rowData.warehouseSeCd;
			const pltno = rowData.pltno;
			const wrhsQntt = parseInt(rowData.wrhsQntt) || 0;
			const wrhsWght = parseInt(rowData.wrhsWght) || 0;

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

			if (gfn_isEmpty(pltno)) {
				gfn_comAlert("W0005", "컨테이너번호");		//	W0005	{0}이/가 없습니다.
				return;
			}

			if (wrhsWght <= 0) {
				gfn_comAlert("W0005", "중량");		//	W0005	{0}이/가 없습니다.
				return;
			}

			let grdCd = null;

			if (gjsonStdGrdObjKnd.length > 1 && gjsonStdGrdObjJgmt.length > 0) {
				grdCd = rowData['jgmtGrdCd'];
				if (gfn_isEmpty(grdCd)) {
					gfn_comAlert("W0005", "판정등급");		//	W0005	{0}이/가 없습니다.
					return;
				}
			}

 	    	let cntWt = 0;
 	    	let grdWghtSum = 0;
			const stdGrdList = [];

			let cntGrdError = 0;
			gjsonStdGrdObjKnd.forEach((knd, idx) => {

				let colNm =  gStdGrdObj.colPrfx + knd.grdKnd;

				const stdGrdType = knd.stdGrdType == "RT" ? "WT" : knd.stdGrdType;

				const stdGrd = {
					apcCd: gv_selectedApcCd,
					grdSeCd: _GRD_SE_CD_WRHS,
					itemCd: rowData.itemCd,
					grdKnd: knd.grdKnd,
					grdKndNm: knd.grdKndNm,
					stdGrdType: stdGrdType
				}


				if (_.isEqual(stdGrdType, "WT")) {
					cntWt++;
					stdGrd.grdWght = parseFloat(rowData[colNm]) || 0;
					if (gfn_isEmpty(grdCd)) {
						grdCd = "*";
					}
					grdWghtSum += stdGrd.grdWght;

				} else {

					if (gfn_isEmpty(rowData[colNm])) {
						cntGrdError++;
		 	            return false;
		 	    	}

					stdGrd.grdCd = rowData[colNm];
					if (gfn_isEmpty(grdCd) || _.isEqual(grdCd, "*")) {
						grdCd = rowData[colNm];
					}
				}

				stdGrdList.push(stdGrd);
			});

			if (cntGrdError > 0) {
				gfn_comAlert("W0005", "등급");
				return;
			}

			if (cntWt > 0 && grdWghtSum <= 0) {
				gfn_comAlert("W0005", "등급중량");	//	W0005	{0}이/가 없습니다.
			}

	    	if (gfn_isEmpty(grdCd)) {
	    		gfn_comAlert("W0005", "등급");	//	W0005	{0}이/가 없습니다.
	            return;
	    	}

			rawMtrRePrcs = {
				itemCd: itemCd,
   				vrtyCd: vrtyCd,
   				pltno: rowData.pltno,
   				warehouseSeCd: warehouseSeCd,
   				bxKnd: rowData.bxKnd,
   				bxQntt: wrhsQntt,
   				wrhsQntt: wrhsQntt,
   				wrhsWght: wrhsWght,
   				rmrk: rowData.rmrk,
   				grdCd: grdCd,
   				prdctnYr: rowData.prdctnYr,
   				stdGrdList: stdGrdList
			}

			rawMtrRePrcsList.push(rawMtrRePrcs);

			totalWrhsQntt += wrhsQntt;
			totalWrhsWght += wrhsWght;
   		}

		if (rawMtrRePrcsList.length == 0) {
			gfn_comAlert("W0005", "등록대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		if (invntrInptWght < totalWrhsWght) {
			gfn_comAlert("W0008", "투입량", "처리량");		// W0008	{0} 보다 {1}이/가 큽니다.
			return;
		}



		// comConfirm
		if (invntrInptWght > totalWrhsWght) {
			if (!gfn_comConfirm("Q0002", "투입잔량", "재처리 등록")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
	    		return;
	    	}
		} else {
			if (!gfn_comConfirm("Q0001", "재처리 등록")) {	//	Q0001	{0} 하시겠습니까?
	    		return;
	    	}
		}


		const wrhsMng = {
    		apcCd: gv_selectedApcCd,
    		wrhsYmd: wrhsYmd,
    		rawMtrInvntrList: rawMtrInvntrList,
    		rawMtrRePrcsList: rawMtrRePrcsList
    	}

    	const postJsonPromise = gfn_postJSON("/am/wrhs/insertRawMtrRePrcs.do", wrhsMng);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

	}

    /**
     * @name fn_dtpChange
     * @description 입고일자 from to validation
     * @function
     */
	const fn_dtpChange = function(){
 		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
 		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
 		if(gfn_diffDate(wrhsYmdFrom, wrhsYmdTo) < 0){
 			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
 			SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateToYmd(new Date()));
 			SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
 			return;
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

		const itemCd = SBUxMethod.get("srch-slt-itemCd");
		const vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");

		if (gfn_isEmpty(itemCd)) {
			gfn_comAlert("W0001", "품목");		//	W0002	{0}을/를 선택하세요.
	        return;
		}
		if (gfn_isEmpty(vrtyCd)) {
			gfn_comAlert("W0001", "품종");		//	W0002	{0}을/를 선택하세요.
	        return;
		}

		const editableRow = grdRawMtrRePrcs.getRowData(nRow, false);	// call by reference(deep copy)
		editableRow.itemCd = itemCd;
		editableRow.vrtyCd = vrtyCd;

		grdRawMtrRePrcs.rebuild();
		grdRawMtrRePrcs.setCellDisabled(nRow, 4, nRow, grdRawMtrRePrcs.getCols() - 1, false);
		nRow++;
		grdRawMtrRePrcs.addRow(true);
		grdRawMtrRePrcs.setCellDisabled(nRow, 0, nRow, grdRawMtrRePrcs.getCols() - 1, false);

	}

	/**
	 * @name fn_delRow
	 * @description 행삭제
	 * @param {number} nRow
	 */
	const fn_delRow = async function(nRow, nCol) {
		 grdRawMtrRePrcs.deleteRow(nRow);
	}

 	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {
 		/*
		SBUxMethod.set("dtl-inp-inptQntt", 0);
		SBUxMethod.set("dtl-inp-inptWght", 0);
		SBUxMethod.set("dtl-inp-wrhsQntt", 0);
		SBUxMethod.set("dtl-inp-wrhsWght", 0);
		*/
		SBUxMethod.set("lbl-grdInptWght", "");
		//SBUxMethod.set("lbl-grdPrcsWght", prcsWghtInfo);
		SBUxMethod.set("lbl-grdPrcsWght", "");
 	}

	/**
     * @name fn_setValue
     * @description 체크박스 선택 event
     * @function
     */
	const fn_setValue = function(){
    	let nRow = grdRawMtrInvntr.getRow();
    	let nCol = grdRawMtrInvntr.getCol();

		const usrAttr = grdRawMtrInvntr.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {
			if (nCol == grdRawMtrInvntr.getColRef("checkedYn")) {
				const rowData = grdRawMtrInvntr.getRowData(nRow, false);
				let inptQntt = parseInt(rowData.inptQntt) || 0;
				let inptWght = parseInt(rowData.inptWght) || 0;

				if (inptQntt === 0 && inptWght === 0) {
					let invntrQntt = parseInt(rowData.invntrQntt) || 0;
					let invntrWght = parseInt(rowData.invntrWght) || 0;

					rowData.inptQntt = invntrQntt;
					rowData.inptWght = invntrWght;
				}
			}
			grdRawMtrInvntr.refresh();
		}
    }

	/**
     * @name fn_delValue
     * @description 체크박스 해제 event
     * @function
     */
	const fn_delValue = function(){
    	let nRow = grdRawMtrInvntr.getRow();
    	let nCol = grdRawMtrInvntr.getCol();

		const usrAttr = grdRawMtrInvntr.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {
			if (nCol == grdRawMtrInvntr.getColRef("checkedYn")) {
				const rowData = grdRawMtrInvntr.getRowData(nRow, false);
				rowData.inptQntt = 0;
				rowData.inptWght = 0;
			}
			grdRawMtrInvntr.refresh();
		}
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

					let tmpInptWght = parseFloat(rowData.inptWght) || 0;
					if ( tmpInptWght > 0 && rowData.checkedYn !== "Y") {
						rowData.checkedYn = "Y";
					}

					fn_setPrcsInfo();

					break;

				default:
					return;
			}
		}
	}

 	/**
     * @name fn_grdRawMtrRePrcsValueChanged
     * @description 재처리 변경 event 처리
     * @function
     */
	const fn_grdRawMtrRePrcsValueChanged = function() {
		var nRow = grdRawMtrRePrcs.getRow();
		var nCol = grdRawMtrRePrcs.getCol();

		const usrAttr = grdRawMtrRePrcs.getColUserAttr(nCol);
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

			const rowData = grdRawMtrRePrcs.getRowData(nRow, false);	// deep copy

			switch (usrAttr.colNm) {

				case "wrhsQntt":
				case "wrhsWght":
					fn_setPrcsInfo();
					break;
				case "stdGrd":
					if (gjsonStdGrdObjKnd.length > 1 && gjsonStdGrdObjJgmt.length > 0) {
						const stdGrdInfo = [];
			    		gjsonStdGrdObjKnd.forEach((item) => {
			    			let colNm = gStdGrdObj.colPrfx + item.grdKnd;
			    			stdGrdInfo.push(rowData[colNm]);
						});
			    		rowData.jgmtGrdCd = gStdGrdObj.getJgmtGrdCd(stdGrdInfo);
			    		grdRawMtrRePrcs.refresh({"combo":true})
					}
					break;
				case "stdGrdNv":
					let grdNvSum = 0;
 					gjsonStdGrdObjKnd.forEach((item, index) => {
						if (_.isEqual(item.stdGrdType, "RT")) {
							let colNm = gStdGrdObj.colPrfx + item.grdKnd;
							grdNvSum += parseFloat(rowData[colNm]) || 0;
						}
				  	});
 					rowData.grdNvSum = grdNvSum;
 					grdRawMtrRePrcs.refresh();
 					break;

				case "stdGrdWght":
					let grdWghtSum = 0;
 					gjsonStdGrdObjKnd.forEach((item, index) => {
						if (_.isEqual(item.stdGrdType, "RT")) {
							let colNm = gStdGrdObj.colPrfx + item.grdKnd;
							grdWghtSum += parseFloat(rowData[colNm]) || 0;
						}
				  	});
 					rowData.wrhsWght = grdWghtSum;
 					grdRawMtrRePrcs.refresh();
 					fn_setPrcsInfo();
 					break;

				default:
					return;
			}
		}
	}

 	/**
     * @name fn_setPrcsInfo
     * @description 투입, 재처리 정보표시
     * @function
     */
 	const fn_setPrcsInfo = function() {

		let totalInptQntt = 0;
		let totalInptWght = 0;
		let totalWrhsQntt = 0;
		let toatlWrhsWght = 0;

		const stdGrdList = [];

		/*
		{
			grdKnd: 1등급
			stdGrdType: ""
			inptWght: 100
			prcsWght: 20
		}
		 */

		gjsonStdGrdObjKnd.forEach((item, index) => {
			if (_.isEqual(item.stdGrdType, "RT")) {
				const stdGrd = {
					grdKnd: item.grdKnd,
					grdKndNm: item.grdKndNm,
					stdGrdType: item.stdGrdType,
					inptWght: 0,
					prcsWght: 0,
					rmnWght: 0,
				}
				stdGrdList.push(stdGrd);
			}
		});


		const allInvntrData = grdRawMtrInvntr.getGridDataAll();
		allInvntrData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
    			totalInptQntt += parseInt(item.inptQntt) || 0;
    			totalInptWght += parseInt(item.inptWght) || 0;

    			stdGrdList.forEach((std) => {
    				let key = "rt__" + std.grdKnd;
    				std.inptWght += parseFloat(item[key]) || 0;
    				std.rmnWght += parseFloat(item[key]) || 0;
    			});
    		}
		});

		const allRePrcsData = grdRawMtrRePrcs.getGridDataAll();
		allRePrcsData.forEach((item, index) => {
			if (!gfn_isEmpty(item.itemCd)) {
				totalWrhsQntt += parseInt(item.wrhsQntt) || 0;
				toatlWrhsWght += parseInt(item.wrhsWght) || 0;

    			stdGrdList.forEach((std) => {
    				let key = gStdGrdObj.colPrfx + std.grdKnd;
    				std.prcsWght += parseFloat(item[key]) || 0;
    				std.rmnWght -= parseFloat(item[key]) || 0;
    			});
			}
		});

		/*
		SBUxMethod.set("dtl-inp-inptQntt", totalInptQntt);
		SBUxMethod.set("dtl-inp-inptWght", totalInptWght);
		SBUxMethod.set("dtl-inp-wrhsQntt", totalWrhsQntt);
		SBUxMethod.set("dtl-inp-wrhsWght", toatlWrhsWght);
		*/

		// 등급별 중량 표시
		let inptWghtInfo = " ";
		let prcsWghtInfo = " ";
		let rmnWghtInfo = " ";
		stdGrdList.forEach((std, idx) => {
			if (idx > 0) {
				inptWghtInfo += " / ";
				prcsWghtInfo += " / ";
				rmnWghtInfo += " / ";
			}
			inptWghtInfo += std.grdKndNm + "  " + std.inptWght + " Kg";
			prcsWghtInfo += std.grdKndNm + "  " + std.prcsWght + " Kg";
			rmnWghtInfo += std.grdKndNm + "  " + std.rmnWght + " Kg";
		});

		SBUxMethod.set("lbl-grdInptWght", inptWghtInfo);
		//SBUxMethod.set("lbl-grdPrcsWght", prcsWghtInfo);
		SBUxMethod.set("lbl-grdPrcsWght", rmnWghtInfo);
 	}

	/*
	* @name fn_getPrdcrs
	* @description 생산자 자동완성 목록 가져오기
	*/
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
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

		if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
			await gfn_setApcVrtySBSelect('srch-inp-vrtyCd', jsonApcVrty, gv_selectedApcCd);
			SBUxMethod.set("srch-inp-vrtyCd", prdcr.rprsVrtyNm);
		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
					fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
				}
			}
		}
		if (!gfn_isEmpty(prdcr.vhclno)) {	// 차량번호
			SBUxMethod.set("srch-inp-vhclno", prdcr.vhclno);
		}

		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
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
		fn_clearPrdcr();
		fn_init();
	}

	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {

		let itemCd = obj.value;

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),			// 품종
			fn_getStdGrd(itemCd)
		]);

		jsonRawMtrInvntr.length = 0;
		fn_createGridRawMtrInvntr();
		document.querySelector('#cnt-rawMtrInvtr').innerText = 0;

		jsonRawMtrRePrcs.length = 0;
		fn_createGridRawMtrRePrcs();
	}

	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		const vrtyInfo = _.find(jsonApcVrty, {value: vrtyCd});

		if (gfn_isEmpty(vrtyInfo)) {
			SBUxMethod.set("srch-inp-unitWght", "");
			return;
		} else {
			const unitWght = parseInt(vrtyInfo.unitWght) || 0;
			SBUxMethod.set("srch-inp-unitWght", unitWght);
		}

		const itemCd = vrtyInfo.mastervalue;

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if (itemCd != prvItemCd) {
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
	}

    //그리드 체크박스 전체 선택
    function fn_checkAllRawMtrInvntr(grid, obj) {
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
    
	const fn_reset = function(){
 		// 검색조건 초기화
 		SBUxMethod.set("srch-dtp-wrhsYmdFrom",gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-wrhsYmdTo",gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-slt-itemCd","");
		SBUxMethod.set("srch-slt-vrtyCd","");
 		SBUxMethod.set("srch-inp-prdcrIdentno","");
 		SBUxMethod.set("srch-inp-prdcrNm","");
		SBUxMethod.set("srch-inp-prdcrCd","");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:none");
		
		SBUxMethod.set("dtl-dtp-inptYmd",gfn_dateToYmd(new Date()));
		SBUxMethod.set("lbl-grdInptWght","");
		SBUxMethod.set("lbl-grdPrcsWght","");
		
	}
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>