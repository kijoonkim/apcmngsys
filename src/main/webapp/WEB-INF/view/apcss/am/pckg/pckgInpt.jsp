<%
 /**
  * @Class Name : pckgInpt.jsp
  * @Description : 포장실적조회 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	하민우			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 포장실적조회</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 포장실적조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnDocPckg"
						name="btnDocPckg"
						uitype="normal"
						class="btn btn-sm btn-success"
						text="포장확인서"
						onclick="fn_docPckg"
					></sbux-button>
					<sbux-button
						id="btnLblGds"
						name="btnLblGds"
						uitype="normal"
						class="btn btn-sm btn-success"
						text="상품라벨"
						onclick="fn_lblGds"
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
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden"></sbux-input>
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
							<th scope="row" class="th_bg"><span class="data_required" ></span>포장일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-pckgYmdFrom"
									name="srch-dtp-pckgYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-pckgYmdFrom)"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-pckgYmdTo"
									 name="srch-dtp-pckgYmdTo"
									 uitype="popup"
									 date-format="yyyy-mm-dd"
									 class="form-control input-sm input-sm-ast inpt_data_reqed"
									 onchange="fn_dtpChange(srch-dtp-pckgYmdTo)"
								 ></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm"
									unselected-text="전체"
									jsondata-ref="jsonApcItem"
									onchange="fn_selectItem"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-vrtyNm"
									name="srch-inp-vrtyNm"
									class="form-control input-sm"
									maxlength="33"
									show-clear-button="true"
									readonly
								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchVrty"
									name="btnSrchVrty"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-vrty"
									onclick="fn_modalVrty"
								/>
							</td>
							<th scope="row" class="th_bg">포장기</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-fcltCd"
											name="srch-slt-fcltCd"
											uitype="single"
											unselected-text="전체"
											class="form-control input-sm"
											jsondata-ref="jsonComFcltCd"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" style="border-right: hidden;">저장창고</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-warehouseSeCd"
											name="srch-slt-warehouseSeCd"
											uitype="single"
											class="form-control input-sm"
											unselected-text="전체"
											jsondata-ref="jsonComWarehouse"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan= "2"></td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											id="srch-slt-spcfctCd"
											name="srch-slt-spcfctCd"
											uitype="single"
											class="form-control input-sm"
											unselected-text="전체"
											jsondata-ref="jsonApcSpcfct"
										></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg" style="border-right: hidden;">대표생산자</th>
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
									mask = "{ 'alias': 'numeric' }"
								/>
							</td>
						    <td class="td_input">
					    		<sbux-button
						    		id="srch-btn-prdcrCd"
						    		name="srch-btn-prdcrCd"
						    		uitype="modal"
						    		class="btn btn-xs btn-outline-dark"
						    		text="찾기"
						    		target-id="modal-prdcr"
						    		onclick="fn_choicePrdcr"
					    		></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>포장내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-pckgPrfmnc">0</span>건)</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdPckgPrfmnc" style="width:100%;height:544px;"></div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	 <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" header-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var jsonApcItem			= [];	// 품목 	itemCd			검색
	var jsonComSpcfct		= [];	// 규격 	spcfctCd		검색
	var jsonComWarehouse	= [];	// 창고 	warehouseSeCd	검색
	var jsonComFcltCd		= [];	// 선별기 	fcltCd			검색

	/* 생산자 자동완성 */
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

	/** 포장실적 grid */
	var grdPckgPrfmnc;
	var jsonPckgPrfmnc = [];

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-fcltCd', 		jsonComFcltCd, 		'PCKG_FCLT_CD', 	gv_selectedApcCd),	// 선별기
		 	gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', 	gv_selectedApcCd),	// 선별기
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, 		gv_selectedApcCd)						// 품목
		]);

	}

	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	const fn_selectItem = async function(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
		if(gfn_isEmpty(itemCd)){
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, "");
		}else{
			let rst = await Promise.all([
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, itemCd)	// 규격
			])
		}
	}
	const fn_modalVrty = function() {
		popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}
	const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, vrty.itemCd);
		}
	}
	const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			var _vrtyCds = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtys.push(vrtys[i].vrtyNm);
				_vrtyCds.push(vrtys[i].vrtyCd);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, '');
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCds.join(','));
			SBUxMethod.set('srch-inp-vrtyNm', _vrtys.join(','));
		}
	}

    const fn_init = async function() {

    	let nowDate = new Date();
		let firstYmd = gfn_dateToYmd(nowDate);
		let toDayYmd = gfn_dateToYmd(new Date());

		SBUxMethod.set("srch-dtp-pckgYmdFrom", firstYmd);
		SBUxMethod.set("srch-dtp-pckgYmdTo", toDayYmd);

		let rst = await Promise.all([
			fn_getPrdcrs(),
			fn_initSBSelect()
		]);

		fn_createGrid();

		fn_search();
    }

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	})

	const fn_dtpChange = function(){
		let pckgYmdFrom = SBUxMethod.get("srch-dtp-pckgYmdFrom");
		let pckgYmdTo = SBUxMethod.get("srch-dtp-pckgYmdTo");
		if(gfn_diffDate(pckgYmdFrom, pckgYmdTo) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
			SBUxMethod.set("srch-dtp-pckgYmdFrom", gfn_dateToYmd(new Date()));
			SBUxMethod.set("srch-dtp-pckgYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}

	function fn_createGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdPckgPrfmnc';
	    SBGridProperties.id = 'grdPckgPrfmnc';
	    SBGridProperties.jsonref = 'jsonPckgPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.frozencols = 2;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 100,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
		};
        SBGridProperties.columns = [
        	{
        		caption: ["전체",""], 			ref: 'checkedYn', 		width: '50px', 	type: 'checkbox',	style:'text-align:center',
					typeinfo: {
						ignoreupdate : true,
						fixedcellcheckbox : {
							usemode : true,
							rowindex : 1,
							deletecaption : false
						},
						checkedvalue : 'Y',
						uncheckedvalue : 'N'
					}
        	},
        	{caption: ["포장일자","포장일자"], 		ref: 'pckgYmd', 		width: '120px', type: 'output', 	style:'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
        	},
        	{caption: ["포장번호","포장번호"], 		ref: 'pckgnoIndct',     width: '120px',	type: 'output',		style: 'text-align:center'},
            {caption: ['지시번호','지시번호'], 		ref: 'pckgCmndno', 		width: '120px', type: 'output', 	style:'text-align:center'},
            {caption: ['품목','품목'], 				ref: 'itemNm', 			width: '80px',	type: 'output', 	style:'text-align:center'},
            {caption: ['품종','품종'], 				ref: 'vrtyNm', 			width: '80px', 	type: 'output', 	style:'text-align:center'},
            {caption: ['규격','규격'], 				ref: 'spcfctNm', 		width: '80px', 	type: 'output', 	style:'text-align:center'},
            {caption: ['상품등급','상품등급'], 		ref: 'gdsGrdNm', 		width: '80px',	type: 'output', 	style:'text-align:center'},
            {caption: ['상품명','상품명'], 			ref: 'spmtPckgUnitNm', 		width: '140px',	type: 'output', 	style:'text-align:center'},
            {caption: ['재고','수량'], 				ref: 'invntrQntt', 		width: '50px', 	type: 'output', 	style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ['재고','중량 (Kg)'], 		ref: 'invntrWght', 		width: '80px', 	type: 'output', 	style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ['포장기','포장기'], 			ref: 'fcltNm', 			width: '100px', type: 'output', 	style:'text-align:center'},
            {caption: ['대표생산자','대표생산자'],	ref: 'rprsPrdcrNm', 	width: '100px', type: 'output', 	style:'text-align:center'},
            {caption: ['창고','창고'], 				ref: 'warehouseSeNm', 	width: '100px', type: 'output', 	style:'text-align:center'},
            {caption: ['포장','수량'], 				ref: 'pckgQntt', 		width: '50px', 	type: 'output', 	style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ['포장','중량 (Kg)'], 		ref: 'pckgWght', 		width: '80px', 	type: 'output', 	style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ['출하','수량'], 				ref: 'spmtQntt', 		width: '50px', 	type: 'output', 	style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ['출하','중량 (Kg)'], 		ref: 'spmtWght', 		width: '80px', 	type: 'output', 	style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ['비고','비고'], 			ref: 'rmrk', 			width: '250px', type: 'output', 	style:'text-align:center'},
 	        {caption: ["APC코드"],				ref: 'apcCd',   		type:'output',  hidden: true},
 	        {caption: ["대표생산자코드"],			ref: 'rprsPrdcrCd',   	type:'output',  hidden: true},
 	        {caption: ["품목코드"],				ref: 'itemCd',   		type:'output',  hidden: true},
	        {caption: ["품종코드"],				ref: 'vrtyCd',   		type:'output',  hidden: true},
	        {caption: ["규격코드"],				ref: 'spcfctCd',   		type:'output',  hidden: true},
	        {caption: ["창고구분코드"],				ref: 'warehouseSeCd', 	type:'output',	hidden: true},
	        {caption: ["설비"],					ref: 'fcltCd', 			type:'output',	hidden: true},
	        {caption: ["상품등급코드"],				ref: 'gdsGrd',   		type:'output',  hidden: true},
	        {caption: ["상품구분코드"],				ref: 'gdsSeCd',   		type:'output',  hidden: true},
	        {caption: ["상품구분명"],				ref: 'gdsSeNm',   		type:'output',  hidden: true},
	        {caption: ["생산연도"],				ref: 'prdctnYr',   		type:'output',  hidden: true},
	        {caption: ["상품코드"],				ref: 'spmtPckgUnitCd',  type:'output',  hidden: true},
	        {caption: ["생산연도"],				ref: 'prdctnYr',   		type:'output',  hidden: true},
	        {caption: ["산지코드"],				ref: 'plorCd',   		type:'output',  hidden: true},
	        {caption: ["포장번호"],				ref: 'pckgno', 			type:'output',  hidden: true},
	        {caption: ["포장순번"],				ref: 'pckgSn', 			type:'output',  hidden: true}
        ];
        grdPckgPrfmnc = _SBGrid.create(SBGridProperties);
        grdPckgPrfmnc.bind( "beforepagechanged" , "fn_pagingGrd" );
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
        },
        "personalSave" : {
        	"name": "개인화 저장",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "s",					//단축키
            "callback": fn_personalSave,		//콜백함수명
        },
        "personalLoad" : {
        	"name": "개인화 호출",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "l",					//단축키
            "callback": fn_personalLoad,		//콜백함수명
        },
        "colHidden" : {
        	"name": "열 숨기기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "h",					//단축키
            "callback": fn_colHidden,			//콜백함수명
        },
        "colShow" : {
        	"name": "열 보이기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "w",					//단축키
            "callback": fn_colShow,				//콜백함수명
        }
    };

    // 엑셀 다운로드
    function fn_excelDwnld() {
    	grdPckgPrfmnc.exportLocalExcel("포장실적", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdPckgPrfmnc.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdPckgPrfmnc.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden(){
    	grdPckgPrfmnc.setColHidden(grdPckgPrfmnc.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow(){
    	for(let i = grdPckgPrfmnc.getFixedCols(); i < grdPckgPrfmnc.getCols()-1; i++) {
   			grdPckgPrfmnc.setColHidden(i, false);
    	}
   	}

	const fn_pagingGrd = async function(){
    	let pageSize = grdPckgPrfmnc.getPageSize();   			// 몇개의 데이터를 가져올지 설정
    	let pageNo = grdPckgPrfmnc.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		var getColRef = grdPckgPrfmnc.getColRef("checkedYn");
		grdPckgPrfmnc.setFixedcellcheckboxChecked(1, getColRef, false);
    	fn_setGrdPckgPrfmnc(pageSize, pageNo);
    }

	//조회
    const fn_search = async function() {
		if (gfn_isEmpty(SBUxMethod.get("srch-dtp-pckgYmdFrom")) || gfn_isEmpty(SBUxMethod.get("srch-dtp-pckgYmdTo"))) {
    		gfn_comAlert("W0001", "포장일자");		//	W0002	{0}을/를 입력하세요.
            return;
    	}

    	grdPckgPrfmnc.rebuild();
    	let pageSize = grdPckgPrfmnc.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonPckgPrfmnc.length = 0;
    	grdPckgPrfmnc.clearStatus();

		grdPckgPrfmnc.movePaging(pageNo);
    }

    /**
     * @name fn_setGrdPckgPrfmnc
     * @description 포장실적 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdPckgPrfmnc = async function(pageSize, pageNo) {
    	let pckgYmdFrom = SBUxMethod.get("srch-dtp-pckgYmdFrom");
    	let pckgYmdTo = SBUxMethod.get("srch-dtp-pckgYmdTo");
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");
    	let vrtyCd = SBUxMethod.get('srch-inp-vrtyCd');
    	let fcltCd = SBUxMethod.get("srch-slt-fcltCd");
    	let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
    	let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
    	let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
    	let prdcrNm = SBUxMethod.get("srch-inp-prdcrNm");
    	let gdsGrd = SBUxMethod.get("srch-slt-gdsGrd");

		const postJsonPromise = gfn_postJSON("/am/pckg/selectPckgPrfmnc.do", {
			apcCd: gv_selectedApcCd,
			pckgYmdFrom: pckgYmdFrom,
			pckgYmdTo: pckgYmdTo,
			itemCd: itemCd,
			vrtyCd : vrtyCd,
			spcfctCd: spcfctCd,
			fcltCd: fcltCd,
			warehouseSeCd: warehouseSeCd,
			rprsPrdcrCd: prdcrCd,
			rprsPrdcrNm: prdcrNm,
			gdsGrd: gdsGrd,
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        let data = await postJsonPromise;

  		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	          	/** @type {number} **/
  	      		let totalRecordCount = 0;

  	            jsonPckgPrfmnc.length = 0;
  	          	data.resultList.forEach((item, index) => {
  	          		const pckgPrfmnc = {
  	          			apcCd: item.apcCd,
  	          			apcNm: item.apcNm,
  	          			pckgno: item.pckgno,
  	          			pckgSn: item.pckgSn,
  	          			pckgnoIndct: item.pckgnoIndct,
  	          			pckgCmndno: item.pckgCmndno,
  	          			pckgYmd: item.pckgYmd,
  	          			fcltCd: item.fcltCd,
  	          			fcltNm: item.fcltNm,
  	          			rprsPrdcrCd: item.rprsPrdcrCd,
  	          			rprsPrdcrNm: item.rprsPrdcrNm,
  	          			itemCd: item.itemCd,
  	          			itemNm: item.itemNm,
  	          			vrtyCd: item.vrtyCd,
  	          			vrtyNm: item.vrtyNm,
  	          			spcfctCd: item.spcfctCd,
  	          			spcfctNm: item.spcfctNm,
  	          			gdsGrd: item.gdsGrd,
  	          			gdsGrdNm: item.gdsGrdNm,
  	          			gdsSeCd: item.gdsSeCd,
  	          			gdsSeNm: item.gdsSeNm,
  	          			prdctnYr: item.prdctnYr,
  	          			spmtPckgUnitCd: item.spmtPckgUnitCd,
  	          			spmtPckgUnitNm: item.spmtPckgUnitNm,
  	          			warehouseSeCd: item.warehouseSeCd,
  	          			warehouseSeNm: item.warehouseSeNm,
  	          			pckgQntt: item.pckgQntt,
  	          			pckgWght: item.pckgWght,
  	          			spmtQntt: item.spmtQntt,
  	          			spmtWght: item.spmtWght,
  	          			invntrQntt: item.invntrQntt,
  	          			invntrWght: item.invntrWght,
  	          			plorCd: item.plorCd,
  	          			prdctnYr: item.prdctnYr,
  	  				}
  	          		jsonPckgPrfmnc.push(pckgPrfmnc);

  	  				if (index === 0) {
  	  					totalRecordCount = item.totalRecordCount;
  	  				}
  	  			});

  	          	if (jsonPckgPrfmnc.length > 0) {
  	          		if(grdPckgPrfmnc.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
  	          			grdPckgPrfmnc.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
  	          			grdPckgPrfmnc.rebuild();
  	  				}else{
  	  					grdPckgPrfmnc.refresh();
  	  				}
  	          	} else {
  	          		grdPckgPrfmnc.setPageTotalCount(totalRecordCount);
  	          		grdPckgPrfmnc.rebuild();
  	          	}

  	          	document.querySelector('#cnt-pckgPrfmnc').innerText = totalRecordCount;

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

	const fn_delete = async function() {


		const allData = grdPckgPrfmnc.getGridDataAll();

		const pckgPrfmncList = [];
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {

				if (!pckgPrfmncList.some(function(pckg) {
					return pckg.pckgno === item.pckgno;
				})) {
					pckgPrfmncList.push({
						pckgno: item.pckgno
	    			});
				}
    		}
		});

		if (pckgPrfmncList.length == 0) {
			gfn_comAlert("W0005", "삭제대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "포장실적삭제")) {	//	Q0001	{0} 하시겠습니까?
	    	return;
	    }

		const pckgMng = {
	    		apcCd: gv_selectedApcCd,
	    		pckgPrfmncList: pckgPrfmncList
	    	}

    	const postJsonPromise = gfn_postJSON("/am/pckg/deletePckgPrfmnc.do", pckgMng);
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


 	/** ui event */
 	/**
 	 * @name fn_onChangeApc
 	 * @description APC 선택 변경 event
 	 */
 	const fn_onChangeApc = async function() {
 		fn_clearPrdcr();
 		let result = await Promise.all([
 			fn_init()
 		]);
 	}

    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
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
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = function() {
		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.set("srch-inp-prdcrIdentno", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
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

		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcrInfo.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}
	}

	/**
	 * @name fn_docPckg
	 * @description 포장확인서 발행
	 */
	const fn_docPckg = function() {
		const pckgnoList = [];
		const allData = grdPckgPrfmnc.getGridDataAll();
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				pckgnoList.push(item.pckgno);
    		}
		});

 		if (pckgnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const pckgno = pckgnoList.join("','");

 		gfn_popClipReport("포장확인서", "am/pckgIdntyDoc.crf", {apcCd: gv_selectedApcCd, pckgno: pckgno});
 	}

	/**
	 * @name fn_lblGds
	 * @description 상품라벨 발행
	 */
	const fn_lblGds = function() {
		const pckgnoList = [];
		const allData = grdPckgPrfmnc.getGridDataAll();
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				pckgnoList.push(item.pckgno);
    		}
		});

 		if (pckgnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const pckgno = pckgnoList.join("','");

 		gfn_popClipReport("상품라벨", "am/gdsLabel.crf", {apcCd: gv_selectedApcCd, pckgno: pckgno});
 	}

 	$(function(){
 		$(".glyphicon").on("click", function(){
 			SBUxMethod.set("srch-inp-vrtyNm", "");
			SBUxMethod.set("srch-inp-vrtyCd", "");
 		})
 	})
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>