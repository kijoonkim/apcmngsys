<%
 /**
  * @Class Name : rawMtrWrhsPrfmnc.jsp
  * @Description : 원물입고실적조회 화면
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 입고실적조회</title>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 입고실적조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button 
						id="btnReset" 
						name="btnReset" 
						uitype="normal" 
						text="초기화" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_reset"
					></sbux-button>
					<sbux-button
						id="btnDelete"
						name="btnDelete"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_delete"
						text="삭제"
					></sbux-button>
					<sbux-button 
						id="btnSearch" 
						name="btnSearch" 
						uitype="normal" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_search" 
						text="조회" 
					></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
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
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">입고일자</th>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker 
									uitype="popup" 
									id="srch-dtp-wrhsYmdFrom" 
									name="srch-dtp-wrhsYmdFrom" 
									date-format="yyyy-mm-dd" 
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast" 
									onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)"
								></sbux-datepicker>
							</td>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker 
									uitype="popup" 
									id="srch-dtp-wrhsYmdTo" 
									name="srch-dtp-wrhsYmdTo" 
									date-format="yyyy-mm-dd" 
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast" 
									onchange="fn_dtpChange(srch-dtp-wrhsYmdTo)"
								></sbux-datepicker>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input 
									uitype="text" 
									id="srch-inp-vrtyCd" 
									name="srch-inp-vrtyCd" 
									class="form-control input-sm" 
									maxlength="33" 
									show-clear-button="true" 
									readonly
								></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
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
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox
										id="dtl-chk-wrhsSeCd"
										name="dtl-chk-wrhsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonWrhsSeCd">
									</sbux-checkbox>
								</p>
							</td>
							<th scope="row" class="th_bg">상품구분</th>
							<td colspan="4" class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox
										id="dtl-chk-gdsSeCd"
										name="dtl-chk-gdsSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonGdsSeCd">
									</sbux-checkbox>
								</p>
							</td>
					    	<th scope="row" class="th_bg">운송구분</th>
							<td colspan="3" class="td_input">
								<p class="ad_input_row">
									<sbux-checkbox
										id="dtl-chk-trsprtSeCd"
										name="dtl-chk-trsprtSeCd"
										uitype="normal"
										class="radio_label"
										text-right-padding="10px"
										jsondata-ref="jsonTrsprtSeCd">
									</sbux-checkbox>
								</p>
							</td>
						</tr>
						<tr>
						    <th scope="row" class="th_bg">창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm" jsondata-ref="jsonComWarehouseSeCd"></sbux-select>
							</td>
							<td colspan="2" style="border-right: hidden;">&nbsp;</td>
							<th scope="row" class="th_bg">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vhclno" name="srch-inp-vhclno" class="form-control input-sm" onkeyup="fn_onKeyVhclno(srch-inp-vhclno)"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
									id="srch-btn-vhcl"
									name="srch-btn-vhcl"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-vhcl"
									onclick="fn_choiceVhcl"
								/>
							</td>
							<td colspan="6" style="border-left: hidden;">&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>원물입고 내역</span></li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdRawMtrWrhs" style="height:508px;"></div>
				</div>
			</div>
		</div>
	</section>
    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
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

	var jsonComItem				= [];	// 품목 		itemCd			검색
	var jsonComVrty				= [];
	var jsonComWarehouseSeCd	= [];	// 창고 		warehouseSeCd	검색

    var jsonPrdcr				= [];
    var jsonPrdcrAutocomplete 	= [];

    var jsonWrhsSeCd			= [];	// 입고구분 checkbox 검색
   	var jsonGdsSeCd				= [];	// 상품구분 checkbox 검색
    var jsonTrsprtSeCd			= [];	// 운송구분 checkbox 검색


	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd', jsonComWarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', jsonComItem, gv_selectedApcCd),										// 품목
		 	gfn_setComCdSBSelect('dtl-chk-wrhsSeCd', jsonWrhsSeCd, 'WRHS_SE_CD'),											// 입고구분
		 	gfn_setComCdSBSelect('dtl-chk-gdsSeCd', jsonGdsSeCd, 'GDS_SE_CD', gv_selectedApcCd),							// 상품구분
		 	gfn_setComCdSBSelect('dtl-chk-trsprtSeCd', jsonTrsprtSeCd, 'TRSPRT_SE_CD'),										// 운송구분
	 	]);
		jsonWrhsSeCd = gfn_getJsonFilter(jsonWrhsSeCd, 'value', ["1", "2", "3"]);
		jsonWrhsSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-wrhsSeCd');
		jsonGdsSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-gdsSeCd');
		jsonTrsprtSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-trsprtSeCd');
	}

    const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

	var vrtyCds = [];

    const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			vrtyCds = [];
			vrtyCds.push(vrty.vrtyCd);
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyNm);
		}
	}

    const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			vrtyCds = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtys.push(vrtys[i].vrtyNm);
				vrtyCds.push(vrtys[i].vrtyCd);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtys.join(','));
		}
	}

    function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		if (gfn_isEmpty(itemCd)) {
			vrtyCds = [];
		}
		SBUxMethod.set("srch-inp-vrtyCd", "");
	}

	/**
	 * @name fn_choiceVhcl
	 * @description 차량번호 선택 popup
	 */
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl, SBUxMethod.get("srch-inp-vhclno"));
	}

	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("srch-inp-vhclno", vhcl.vhclno);
		}
	}

	const fn_init = function() {
		fn_createGrid();
		SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));

		fn_initSBSelect();
		fn_getPrdcrs();
	}
	
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});

	const fn_dtpChange = function(){
		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
		if(gfn_diffDate(wrhsYmdFrom, wrhsYmdTo) < 0){
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}

	var grdRawMtrWrhs;	// 원물입고실적 그리드
	var jsonRawMtrWrhs = [];

	function fn_createGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdRawMtrWrhs';
	    SBGridProperties.id = 'grdRawMtrWrhs';
	    SBGridProperties.jsonref = 'jsonRawMtrWrhs';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';			// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'none';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
			{
				caption : ["<input type='checkbox' onchange='fn_checkAll(grdRawMtrWrhs, this);'>"],
				ref: 'checkedYn', type: 'checkbox',  width:'50px',
				style: 'text-align:center',
				userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
	        {caption: ["입고일자"],		ref: 'wrhsYmd',      type:'output',  width:'120px',    style:'text-align:center', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["생산자"],		ref: 'prdcrNm',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["참여조직명"],	ref: 'prdcrNm',      type:'output',  width:'120px',    style:'text-align:center'},
	        {caption: ["품목"],		ref: 'itemNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["품종"],		ref: 'vrtyNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["입고구분"],		ref: 'wrhsSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["운송구분"],		ref: 'trsprtSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["상품구분"],		ref: 'gdsSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["차량번호"],		ref: 'vhclno',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["운송료"],		ref: 'trsprtCst',      type:'output',  width:'120px', hidden:true,   style:'text-align:right', format : {type:'number', rule:'#,### 원 '}},
	        {caption: ["등급"],		ref: 'grdNm',      type:'output',  width:'80px',    style:'text-align:center'},
	        {
	        	caption: ["입고중량 (Kg)"],	
	        	ref: 'wrhsWght',      
	        	type:'output',  
	        	width:'100px',    
	        	style:'text-align:right', 
	        	typeinfo : {mask : {alias : 'numeric'}}, 
	        	format : {
	        		type:'number', 
	        		rule:'#,###  '
	        	}
	        },
	        {
	        	caption: ["현재고중량 (Kg)"],	
	        	ref: 'invntrWght',
	        	type:'output',  
	        	width:'100px',    
	        	style:'text-align:right', 
	        	typeinfo : {mask : {alias : 'numeric'}}, 
	        	format : {type:'number', rule:'#,##0  '}
	        },
	        {caption: ["보관창고"],		ref: 'warehouseSeNm',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["계량번호"],		ref: 'wghno',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["팔레트번호"],	ref: 'pltno',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["처리구분"],		ref: 'prcsTypeNm',      type:'output',  width:'140px',    style:'text-align:center'},
	        {caption: ["비고"],		ref: 'rmrk',      type:'output',  width:'200px',    style:'text-align:center'},
	        {caption: ["입고번호"],		ref: 'wrhsno',		type:'output',  hidden: true},
	    ];
	    grdRawMtrWrhs = _SBGrid.create(SBGridProperties);
	    grdRawMtrWrhs.bind("afterpagechanged" , fn_pagingGrdRawMtrWrhs);
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
    	grdRawMtrWrhs.exportLocalExcel(
    						"입고실적", {
    							bSaveLabelData: true, 
    							bNullToBlank: true, 
    							bSaveSubtotalValue: true, 
    							bCaptionConvertBr: true, 
    							arrSaveConvertText: true
    						});
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdRawMtrWrhs.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdRawMtrWrhs.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden(){
    	grdRawMtrWrhs.setColHidden(grdRawMtrWrhs.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow(){
    	for(let i = grdRawMtrWrhs.getFixedCols(); i < grdRawMtrWrhs.getCols()-1; i++) {
    		grdRawMtrWrhs.setColHidden(i, false);
    	}
   	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}

	const fn_onChangeApc = async function() {
		fn_clearPrdcr();
		fn_initSBSelect();
		fn_getPrdcrs();
	}

	/**
     * @name fn_delete
     * @description 삭제 버튼
     */
	const fn_delete = async function() {

		const allData = grdRawMtrWrhs.getGridDataAll();

		const rawMtrInvntrList = [];
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				rawMtrInvntrList.push({
						wrhsno: item.wrhsno
	    			});
    		}
		});
		
		if (rawMtrInvntrList.length == 0) {
			gfn_comAlert("W0005", "삭제대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "입고실적삭제")) {	//	Q0001	{0} 하시겠습니까?
	    	return;
	    }
		
		const rawMtrWrhsMng = {
    		apcCd: gv_selectedApcCd,
    		rawMtrInvntrList: rawMtrInvntrList
    	}

        try {
        	let postUrl = "/am/wrhs/deleteRawMtrPrcsList.do";
        	
    		const postJsonPromise = gfn_postJSON(postUrl, rawMtrWrhsMng);
			const data = await postJsonPromise;

        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
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
	
	
	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
		if (	gfn_isEmpty(SBUxMethod.get("srch-dtp-wrhsYmdFrom")) 
				|| gfn_isEmpty(SBUxMethod.get("srch-dtp-wrhsYmdTo"))){
			gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 선택하세요.
		    return;
		}

		// set pagination
    	grdRawMtrWrhs.rebuild();
    	let pageSize = grdRawMtrWrhs.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonRawMtrWrhs.length = 0;
    	grdRawMtrWrhs.clearStatus();
    	await fn_setGrdRawMtrWrhsPrfmnc(pageSize, pageNo);
	}


	const fn_setGrdRawMtrWrhsPrfmnc = async function(pageSize, pageNo) {
		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");		// 입고시작일자
   		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");		// 입고종료일자
  		let wrhsSeCd = fn_getChkbox(jsonWrhsSeCd, SBUxMethod.get("dtl-chk-wrhsSeCd"));
  		let gdsSeCd = fn_getChkbox(jsonGdsSeCd, SBUxMethod.get("dtl-chk-gdsSeCd"));
  		let trsprtSeCd = fn_getChkbox(jsonTrsprtSeCd, SBUxMethod.get("dtl-chk-trsprtSeCd"));

  		// optional
  		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");	// 생산자
  		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");	// 창고
  		let vhclno = SBUxMethod.get("srch-inp-vhclno");	// 차량번호
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = vrtyCds.length > 0 ? vrtyCds.join(',') : "";

 	    try{
 	    	let postUrl = "/am/wrhs/selectRawMtrWrhsPrfmncList.do";
 			const postJsonPromise = gfn_postJSON(postUrl, {
	 				apcCd: gv_selectedApcCd,
	 				wrhsYmdFrom: wrhsYmdFrom,
	 				wrhsYmdTo: wrhsYmdTo,
	 				wrhsSeCd: wrhsSeCd,
	 				gdsSeCd: gdsSeCd,
	 				trsprtSeCd: trsprtSeCd,
	 				warehouseSeCd: warehouseSeCd,
	 				prdcrCd: prdcrCd,
	 				vrtyCd: vrtyCd,
	 				itemCd: itemCd,
	 				vhclno: vhclno,
	 	          	// pagination
	 	  	  		pagingYn : 'Y',
	 	  			currentPageNo : pageNo,
	 	   		  	recordCountPerPage : pageSize
	 	  		});

 	        const data = await postJsonPromise;
 	    	
 	    	if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }
 	    	
			/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonRawMtrWrhs.length = 0;
          	data.resultList.forEach((item, index) => {
          		const rawMtrWrhs = {
  						rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						apcNm: item.apcNm,
  						wrhsno: item.wrhsno,
  						wghno: item.wghno,
  						pltno: item.pltno,
  						wrhsYmd: item.wrhsYmd,
  						prdcrCd: item.prdcrCd,
  						prdcrNm: item.prdcrNm,
  						itemCd: item.itemCd,
  						itemNm: item.itemNm,
  						vrtyCd: item.vrtyCd,
  						vrtyNm: item.vrtyNm,
  						gdsSeCd: item.gdsSeCd,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeCd: item.wrhsSeCd,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeCd: item.trsprtSeCd,
  						trsprtSeNm: item.trsprtSeNm,
  						grdCd: item.grdCd,
  						grdNm: item.grdNm,
  						vhclno: item.vhclno,
  						bxQntt: item.bxQntt,
  						wrhsWght: item.wrhsWght,
  						bxKnd: item.bxKnd,
  						bxKndNm: item.bxKndNm,
  						warehouseSeCd: item.warehouseSeCd,
  						warehouseSeNm: item.warehouseSeNm,
  						rmrk: item.rmrk,
  						trsprtCst: item.trsprtCst,
  						prcsType: item.prcsType,
  						prcsTypeNm: item.prcsTypeNm,
  						invntrQntt: item.invntrQntt,
  						invntrWght: item.invntrWght,
  				}
          		jsonRawMtrWrhs.push(rawMtrWrhs);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	if (jsonRawMtrWrhs.length > 0) {
          		if(grdRawMtrWrhs.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdRawMtrWrhs.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdRawMtrWrhs.rebuild();
  				}else{
  					grdRawMtrWrhs.refresh();
  				}
          	} else {
          		grdRawMtrWrhs.setPageTotalCount(totalRecordCount);
          		grdRawMtrWrhs.rebuild();
         	}
          	
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
     	}
	}

	// 페이징
    async function fn_pagingGrdRawMtrWrhs(){
    	let recordCountPerPage = grdRawMtrWrhs.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdRawMtrWrhs.getSelectPageIndex();
    	fn_setGrdRawMtrWrhsPrfmnc(recordCountPerPage, currentPageNo);
    }

	function fn_getChkbox(json, result) {
		val = [];
		if(json.length == 1){
			val.push(json[0].value);
		}else{
			for(var key in result){
				if(result[key] == true)
					val.push(json[Number(key.substring(key.lastIndexOf('_')+1))].value);
			}
		}

		return val.join(',');
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
			await gfn_setApcVrtySBSelect('srch-inp-vrtyCd', jsonComVrty, gv_selectedApcCd);
			SBUxMethod.set("srch-inp-vrtyCd", prdcr.rprsVrtyNm);
			SBUxMethod.setValue('srch-slt-itemCd', prdcr.rprsItemCd);
		} else {
			if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
				const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
				if (prvItemCd != prdcr.rprsItemCd) {
					SBUxMethod.setValue('srch-slt-itemCd', prdcr.rprsItemCd);
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

	/**
	 * @name getByteLengthOfString
	 * @description 글자 byte 크기 계산
	 */
 	const getByteLengthOfString = function (s, b, i, c) {
		  for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
		  return b;
	}

	const fn_onKeyVhclno = function(vhclno){
		if(getByteLengthOfString(vhclno) > 40){
			SBUxMethod.set("srch-inp-vhclno", "");
			return;
		}
    }

	/**
	 * @name fn_reset
	 * @description 상단 검색조건 초기화
	 */
	const fn_reset = function(){
		SBUxMethod.set("srch-dtp-wrhsYmdFrom", gfn_dateFirstYmd(new Date()));
		SBUxMethod.set("srch-dtp-wrhsYmdTo", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-slt-itemCd", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
		vrtyCds = [];
		fn_clearPrdcr();
		SBUxMethod.set('srch-inp-prdcrNm', "");
		jsonWrhsSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-wrhsSeCd');
		jsonGdsSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-gdsSeCd');
		jsonTrsprtSeCd.forEach(e => e.checked = "checked");
		SBUxMethod.refresh('dtl-chk-trsprtSeCd');
		SBUxMethod.set("srch-slt-warehouseSeCd", "");
		SBUxMethod.set("srch-inp-vhclno", "");
	}

	/**
	 * @name fn_checkAll
	 * @description 그리드 체크박스 전체 선택
	 */
    const fn_checkAll = function (grid, obj) {
		
        const checkedYn = obj.checked ? "Y" : "N";
        //체크박스 열 index
        const getColRef = grid.getColRef("checkedYn");
        for (var i=0; i<grid.getGridDataAll().length; i++ ){
        	grid.setCellData(i+1, getColRef, checkedYn, true, false);
        }
        grid.refresh();
    }
	
	$(function(){
		$(".glyphicon").on("click", function(){
			SBUxMethod.set("srch-inp-vrtyCd", "");
			vrtyCds.length = 0;
		})
	})
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>