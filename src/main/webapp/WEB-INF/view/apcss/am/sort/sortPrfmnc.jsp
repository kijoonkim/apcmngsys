<%
 /**
  * @Class Name : sortPrfmnc.jsp
  * @Description : 선별실적조회 화면
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 선별실적조회</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별실적조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnDocSort"
						name="btnDocSort"
						uitype="normal"
						text="선별확인서"
						class="btn btn-sm btn-success"
						onclick="fn_docSort"
					></sbux-button>
					<sbux-button
						id="btnLblSort"
						name="btnLblSort"
						uitype="normal"
						text="선별라벨"
						class="btn btn-sm btn-success"
						onclick="fn_lblSort"
					></sbux-button>
					<sbux-button
						id="btnDelete"
						name="btnDelete"
						uitype="normal"
						text="삭제"
						class="btn btn-sm btn-outline-dark"
						onclick="fn_delete"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						text="조회"
						class="btn btn-sm btn-outline-dark"
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
							<th scope="row" class="th_bg"><span class="data_required" ></span>선별일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-inptYmdFrom"
									name="srch-dtp-inptYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc"
									onchange="fn_dtpChange(srch-dtp-inptYmdFrom)"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-inptYmdTo"
									name="srch-dtp-inptYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc"
									onchange="fn_dtpChange(srch-dtp-inptYmdTo)"
								></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									uitype="single"
									class="form-control input-sm input-sm-ast"
									unselected-text="전체"
									jsondata-ref="jsonApcItem"
									onchange="fn_selectItem"
								></sbux-select>
							</td>
<!-- 							<td class="td_input" style="border-right: hidden;"> -->
<!-- 								<sbux-select id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" uitype="single" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonVrty"></sbux-select> -->
<!-- 							</td> -->
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
								<sbux-input
									uitype="hidden"
									id="srch-inp-vrtyCd"
									name="srch-inp-vrtyCd"
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
<!-- 							<td class="td_input" style="border-right: hidden;"></td> -->
							<th scope="row" class="th_bg">선별기</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-fcltCd"
									name="srch-slt-fcltCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonComFcltCd"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">저장창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-warehouseSeCd"
									name="srch-slt-warehouseSeCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonComWarehouse"
								></sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td></td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-spcfctCd"
									name="srch-slt-spcfctCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonApcSpcfct"
								></sbux-select>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td></td>
							<th scope="row" class="th_bg">대표생산자</th>
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
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
 				<div class="row">
					<div class="col-sm-9">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>선별 내역</span>
									<span style="font-size:12px">(조회건수 <span id="cnt-sort">0</span>건)</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdSortPrfmnc" style="height:544px;"></div>
					</div>
					<div class="col-sm-3">
						<div class="ad_tbl_top">
							<ul class="ad_tbl_count">
								<li>
									<span>투입 내역</span>
									<span style="font-size:12px">(조회건수 <span id="cnt-inpt">0</span>건)</span>
								</li>
							</ul>
						</div>
						<div id="sb-area-grdSortInptPrfmnc" style="height:544px;"></div>
					</div>
 				</div>

				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
    <!--  품목 선택 Modal -->
   	<div>
        <sbux-modal id="modal-itemCrtr" name="modal-itemCrtr" uitype="middle" header-title="품목 선택" body-html-id="body-modal-itemCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:600px"></sbux-modal>
    </div>
    <div id="body-modal-itemCrtr">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/itemCrtrPopup.jsp"></jsp:include>
    </div>
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	let lv_sortno = "";
	let lv_sortSn = -1;


	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}

    const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

	const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, vrty.itemCd);
		}
	}
	const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyNms = [];
			var _vrtyCds = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtyNms.push(vrtys[i].vrtyNm);
				_vrtyCds.push(vrtys[i].vrtyCd);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, '');
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNms.join(','));
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCds.join(','));
		}
	}

	var jsonApcItem			= [];	// 품목 	itemCd			검색
	var jsonApcSpcfct		= [];	// 규격 	spcfctCd		검색
	var jsonComWarehouse	= [];	// 창고 	warehouseSeCd	검색
	var jsonComFcltCd		= [];	// 선별기 	fcltCd			검색

	/* 생산자 자동완성 */
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-fcltCd', 		jsonComFcltCd, 	'SORT_FCLT_CD', gv_selectedApcCd),			// 선별기
		 	gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 선별기
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd)								// 품목
		]);
	}

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init();
    });

    const fn_init = async function() {

    	let nowDate = new Date();

		let firstYmd = gfn_dateFirstYmd(nowDate);
		let lastYmd = gfn_dateToYmd(nowDate);

		SBUxMethod.set("srch-dtp-inptYmdFrom", firstYmd);
		SBUxMethod.set("srch-dtp-inptYmdTo", lastYmd);

		let result = await Promise.all([
				fn_initSBSelect(),
				fn_getPrdcrs()
			]);

		fn_createGrid();
		fn_createInptGrid();
		fn_search();
    }

    const fn_dtpChange = function(){
    	let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
    	let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
    	if(gfn_diffDate(inptYmdFrom, inptYmdTo) < 0){
    		gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
    		SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
    		SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
    		return;
    	}
    }


    // grid
    // 선별실적
    var grdSortPrfmnc;
    var jsonSortPrfmnc = [];

    // 투입실적
    var grdSortInptPrfmnc;
    var jsonSortInptPrfmnc = [];


    const fn_createGrid = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdSortPrfmnc';
	    SBGridProperties.id = 'grdSortPrfmnc';
	    SBGridProperties.jsonref = 'jsonSortPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList1;	// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.frozencols = 2;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
        SBGridProperties.columns = [
        	{caption: ["체크박스","체크박스"], 		ref: 'checkedYn', 			type: 'checkbox', 	width: '40px',	style:'text-align: center',
				typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}, checkedvalue : 'Y', uncheckedvalue : 'N'}
        	},
            {caption: ["선별일자","선별일자"],		ref: 'inptYmd',     		type:'output',  	width:'90px',	style:'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
            },
            {caption: ["선별번호","선별번호"], 		ref: 'sortno',     			type:'output',  	width:'120px',  style:'text-align:center'},
            {caption: ["설비명","설비명"], 			ref: 'fcltNm',     			type:'output',  	width:'120px',  style:'text-align:center'},
            {caption: ["입고구분","입고구분"], 		ref: 'wrhsSeNm',    		type:'output',  	width:'60px',   style:'text-align:center'},
            {caption: ["상품구분","상품구분"],  		ref: 'gdsSeNm',       		type:'output',  	width:'60px',   style:'text-align:center'},
            {caption: ["품목","품목"],	    		ref: 'itemNm', 				type:'output',  	width:'80px',   style:'text-align:center'},
            {caption: ["품종","품종"],	    		ref: 'vrtyNm', 				type:'output',  	width:'80px',   style:'text-align:center'},
            {caption: ["규격","규격"],  			ref: 'spcfctNm',   			type:'output',  	width:'80px',   style:'text-align:center'},
            {caption: ["등급","등급"],  			ref: 'grdNm', 				type:'output',  	width:'80px',   style:'text-align:center'},
            {caption: ["투입","수량"],  			ref: 'inptQntt',   			type:'output',  	width:'60px',   style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ["투입","중량 (Kg)"],  		ref: 'inptWght',   			type:'output',  	width:'80px',   style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ["선별","수량"],  			ref: 'sortQntt', 			type:'output',  	width:'60px',   style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ["선별","중량 (Kg)"],  		ref: 'sortWght', 			type:'output',  	width:'80px',   style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ["대표생산자","대표생산자"], 	ref: 'rprsPrdcrNm',  		type:'output',  	width:'80px',   style:'text-align:center'},
            {caption: ["저장창고","저장창고"], 		ref: 'warehouseSeNm', 		type:'output',  	width:'80px',	style:'text-align:center'},
            {caption: ["비고","비고"], 			ref: 'rmrk',  				type:'output',  	width:'200px',  style:'text-align:center'},

            {caption: ["선별번호"],				ref: 'sortno', 				type:'output',  	hidden: true},
            {caption: ["선별순번"],				ref: 'sortSn', 				type:'output',  	hidden: true},
            {caption: ["선별순번"],				ref: 'wrhsSeCd', 			type:'output',  	hidden: true},
            {caption: ["대표생산자코드"],			ref: 'rprsPrdcrCd', 		type:'output',  	hidden: true},
            {caption: ["투입창고코드"],				ref: 'inptWarehouseSeCd',	type:'output',  	hidden: true},
            {caption: ["저장창고코드"],				ref: 'warehouseSeCd', 		type:'output',  	hidden: true}
        ];

        grdSortPrfmnc = _SBGrid.create(SBGridProperties);
        grdSortPrfmnc.bind('click', fn_viewSortInpt);
        grdSortPrfmnc.bind('beforepagechanged', fn_pagingSortPrfmnc);
    }

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList1 = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld1,			//콜백함수명
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
    function fn_excelDwnld1() {
    	grdSortPrfmnc.exportLocalExcel("선별실적", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdSortPrfmnc.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdSortPrfmnc.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden(){
    	grdSortPrfmnc.setColHidden(grdSortPrfmnc.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow(){
    	for(let i = grdSortPrfmnc.getFixedCols(); i < grdSortPrfmnc.getCols()-1; i++) {
   			grdSortPrfmnc.setColHidden(i, false);
    	}
   	}


	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {

		// set pagination
    	grdSortPrfmnc.rebuild();
    	let pageSize = grdSortPrfmnc.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonSortPrfmnc.length = 0;
    	grdSortPrfmnc.clearStatus();

    	jsonSortInptPrfmnc.length = 0;
    	grdSortInptPrfmnc.refresh();

    	grdSortPrfmnc.movePaging(pageNo);
	}

    /**
     * @name fn_pagingSortPrfmnc
     * @description 선별실적 페이징
	 */
	const fn_pagingSortPrfmnc = async function() {
		let pageSize = grdSortPrfmnc.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let pageNo = grdSortPrfmnc.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		var getColRef = grdSortPrfmnc.getColRef("checkedYn");
		grdSortPrfmnc.setFixedcellcheckboxChecked(0, getColRef, false);
		fn_setGrdSortPrfmnc(pageSize, pageNo);
	}

    /**
     * @name fn_setGrdSortPrfmnc
     * @description 선별실적 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdSortPrfmnc = async function(pageSize, pageNo) {

		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
    	let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");				// 생산자
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");					// 품목
  		let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");					// 품종
  		let fcltCd = SBUxMethod.get("srch-slt-fcltCd");					// 선별기
  		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");	// 창고
  		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");				// 규격
		const postJsonPromise = gfn_postJSON("/am/sort/selectSortPrfmncList.do", {
			apcCd: gv_selectedApcCd,
			inptYmdFrom: inptYmdFrom,
			inptYmdTo: inptYmdTo,
			rprsPrdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			spcfctCd: spcfctCd,
			fcltCd: fcltCd,
			warehouseSeCd: warehouseSeCd,

          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        const data = await postJsonPromise;

  		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	          	/** @type {number} **/
  	      		let totalRecordCount = 0;

  	      		jsonSortPrfmnc.length = 0;
  	          	data.resultList.forEach((item, index) => {
  	          		const sortPrfmnc = {
  	 						rowSeq: item.rowSeq,
  	          				inptYmd: item.inptYmd,
  	          				fcltCd: item.fcltCd,
  	          				fcltNm: item.fcltNm,
  	          				wrhsSeNm: item.wrhsSeNm,
  	          				gdsSeNm: item.gdsSeNm,
  	          				itemCd: item.itemCd,
  	          				itemNm: item.itemNm,
  	          				vrtyNm: item.vrtyNm,
  	          				vrtyCd: item.vrtyCd,
  	          				spcfctCd: item.spcfctCd,
  	          				spcfctNm: item.spcfctNm,
  	          				inptQntt: item.inptQntt,
  	          				inptWght: item.inptWght,
  	          				grdCd: item.grdCd,
  	          				grdNm: item.grdNm,
  	          				sortQntt: item.sortQntt,
  	          				sortWght: item.sortWght,
  	          				wrhsSeCd: item.wrhsSeCd,
  	          				gdsSeCd: item.gdsSeCd,
  	          				rprsPrdcrCd: item.rprsPrdcrCd,
  	          				rprsPrdcrNm: item.rprsPrdcrNm,
  	          				warehouseSeNm: item.warehouseSeNm,
  	          				inptWarehouseSeNm: item.inptWarehouseSeNm,
  	          				sortno: item.sortno,
  	          				sortSn: item.sortSn,
  	          				rmrk: item.rmrk
  	  				}
  	          		jsonSortPrfmnc.push(sortPrfmnc);

  	  				if (index === 0) {
  	  					totalRecordCount = item.totalRecordCount;
  	  				}
  	  			});

  	          	if (jsonSortPrfmnc.length > 0) {
  	          		if(grdSortPrfmnc.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
  	          			grdSortPrfmnc.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
  	          			grdSortPrfmnc.rebuild();
  	  				}else{
  	  					grdSortPrfmnc.refresh();
  	  				}

  	          		fn_viewSortInpt();
  	          	} else {
  	          		grdSortPrfmnc.setPageTotalCount(totalRecordCount);
  	          		grdSortPrfmnc.rebuild();
  	          	}

  	          	document.querySelector('#cnt-sort').innerText = totalRecordCount;

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

    /**
     * @name fn_delete
     * @description 선별실적 삭제
     */
	const fn_delete = async function() {

		const allData = grdSortPrfmnc.getGridDataAll();

		const sortPrfmncList = [];
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {

				if (!sortPrfmncList.some(function(sort) {
					return sort.sortno === item.sortno;
				})) {
					sortPrfmncList.push({
						sortno: item.sortno
	    			});
				}
    		}
		});

		if (sortPrfmncList.length == 0) {
			gfn_comAlert("W0005", "삭제대상");		//	W0005	{0}이/가 없습니다.
			return;
		}

		// comConfirm
		if (!gfn_comConfirm("Q0001", "선별실적삭제")) {	//	Q0001	{0} 하시겠습니까?
	    	return;
	    }

		const sortMng = {
	    		apcCd: gv_selectedApcCd,
	    		sortPrfmncList: sortPrfmncList
	    	}

    	const postJsonPromise = gfn_postJSON("/am/sort/deleteSortPrfmnc.do", sortMng);
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

	const fn_createInptGrid = function() {
		var SBGridProperties = {};
 	    SBGridProperties.parentid = 'sb-area-grdSortInptPrfmnc';
 	    SBGridProperties.id = 'grdSortInptPrfmnc';
 	    SBGridProperties.jsonref = 'jsonSortInptPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';			// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList2;	// 우클릭 메뉴 리스트
 	    SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
        	{caption: ["입고번호","입고번호"], 	ref: 'wrhsno',  		type:'output',  width:'100px',   style:'text-align:center'},
         	{caption: ["투입","수량"],  		ref: 'qntt',   			type:'output',  width:'60px',   style:'text-align:right',
             	format : {type:'number', rule:'#,###'}
            },
            {caption: ["투입","중량 (Kg)"],  		ref: 'wght',   			type:'output',  width:'60px',   style:'text-align:right',
            	format : {type:'number', rule:'#,###'}
            },
            {caption: ["투입창고","투입창고"],	ref: 'warehouseSeNm',	type:'output',  width:'80px',   style:'text-align:center'},
            {caption: ["생산자","생산자"],		ref: 'prdcrNm',			type:'output',  width:'80px',   style:'text-align:center'},
            {caption: ["선별번호"],			ref: 'sortno', 			type:'output',  hidden: true},
            {caption: ["선별순번"],			ref: 'sortSn', 			type:'output',  hidden: true},
 	        {caption: [" "," "],			ref: '_',				type:'output',  width:'1px'},
        ];
    	grdSortInptPrfmnc = _SBGrid.create(SBGridProperties);
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList2 = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld2,			//콜백함수명
        }
    };

    // 엑셀 다운로드
    function fn_excelDwnld2() {
    	grdSortInptPrfmnc.exportLocalExcel("출하실적", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	const fn_viewSortInpt = async function() {
		let nRow = grdSortPrfmnc.getRow();
		var nCol = grdSortPrfmnc.getCol();

        if (nRow < 2) {
            return;
        }
        const usrAttr = grdSortPrfmnc.getColUserAttr(nCol);

        let rowData = grdSortPrfmnc.getRowData(nRow);

        if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {
        	switch (usrAttr.colNm) {
				case "checkedYn":	// checkbox
					return;
				default:
					break;
        	}
        }

        if (_.isEqual(rowData.sortno, lv_sortno)) {
        	return;
        }

        lv_sortno = rowData.sortno;
       	lv_sortSn = rowData.sortSn;

        fn_setGrdSortInptPrfmnc(lv_sortno, lv_sortSn);

	}


    /**
     * @name fn_setGrdSortInptPrfmnc
     * @description 투입실적 조회
     * @param {string} sortno
     * @param {Number} sortSn
     */
	const fn_setGrdSortInptPrfmnc = async function(sortno, sortSn) {

		jsonSortInptPrfmnc.length = 0;

		const postJsonPromise = gfn_postJSON("/am/sort/selectSortInptPrfmncList.do", {
			apcCd: gv_selectedApcCd,
			sortno: sortno,
			sortSn: sortSn
          	// pagination
  		});

        const data = await postJsonPromise;

  		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	          	/** @type {number} **/
  	      		let totalRecordCount = 0;
  	          	data.resultList.forEach((item, index) => {
  	          		const sortPrfmnc = {
  	       				apcCd : item.apcCd,
  	       				wrhsno : item.wrhsno,
  	       				inptYmd : item.inptYmd,
  	       				sortno : item.sortno,
  	       				qntt : item.qntt,
  	       				wght : item.wght,
  	       				pltno : item.pltno,
  	       				wrhsYmd : item.wrhsYmd,
  	       				prdcrCd : item.prdcrCd,
  	       				itemCd : item.itemCd,
  	       				vrtyCd : item.vrtyCd,
  	       				gdsSeCd : item.gdsSeCd,
  	       				wrhsSeCd : item.wrhsSeCd,
  	       				trsprtSeCd : item.trsprtSeCd,
  	       				warehouseSeCd : item.warehouseSeCd,
  	       				warehouseSeNm : item.warehouseSeNm,
  	       				prdcrNm : item.prdcrNm
  	  				}
  	          		jsonSortInptPrfmnc.push(sortPrfmnc);

  	  			});

  	          	totalRecordCount = jsonSortInptPrfmnc.length;

  	          	grdSortInptPrfmnc.refresh();

  	          	document.querySelector('#cnt-inpt').innerText = totalRecordCount;

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
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	 function fn_onSelectPrdcrNm(value, label, item) {
		// 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
		if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
			document.getElementById('btn-srch-prdcr').click();
		}
		else{
			SBUxMethod.set("srch-inp-prdcrCd", value);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
		if (gfn_isEmpty(itemCd)) {
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonApcSpcfct, 	"");
		} else {
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonApcSpcfct, 	gv_selectedApcCd, itemCd);		// 규격
		}
	}

	/**
	 * @name fn_docSort
	 * @description 선별확인서 발행
	 */
	const fn_docSort = function() {
		const sortnoList = [];
		const allData = grdSortPrfmnc.getGridDataAll();
		allData.forEach((item) => {
			if (item.checkedYn === "Y") {
				sortnoList.push(item.sortno);
    		}
		});

 		if (sortnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const sortno = sortnoList.join("','");
 		gfn_popClipReport("선별확인서", "am/sortIdntyDoc.crf", {apcCd: gv_selectedApcCd, sortno: sortno});
 	}


	/**
	 * @name fn_lblSort
	 * @description 선별라벨 발행
	 */
	const fn_lblSort = function() {
		const sortnoList = [];
		const allData = grdSortPrfmnc.getGridDataAll();
		allData.forEach((item) => {
			if (item.checkedYn === "Y") {
				sortnoList.push(item.sortno);
    		}
		});

 		if (sortnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const sortno = sortnoList.join("','");
 		gfn_popClipReport("선별확인서", "am/sortLabel.crf", {apcCd: gv_selectedApcCd, sortno: sortno});
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