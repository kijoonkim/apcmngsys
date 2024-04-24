<%
 /**
  * @Class Name : sortPrfmncByWrhs.jsp
  * @Description : 선별실적조회(입고단위) 화면
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
	<title>title : 선별실적조회(입고단위)</title>
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별실적조회(입고단위) -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnDocSortByWrhs"
						name="btnDocSortByWrhs"
						uitype="normal"
						text="선별확인서(입고별)"
						class="btn btn-sm btn-success"
						onclick="fn_docSortByWrhs"
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
							<th scope="row" class="th_bg"><span class="data_required" ></span>입고일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-wrhsYmdFrom"
									name="srch-dtp-wrhsYmdFrom"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-ap input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)"
								></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-wrhsYmdTo"
									name="srch-dtp-wrhsYmdTo"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"
									onchange="fn_dtpChange(srch-dtp-wrhsYmdTo)"
								></sbux-datepicker>
							</td>
							<td style="border-right: hidden;"></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									uitype="single"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonApcItem"
									onchange="fn_onChangeSrchItemCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;"> 
								<sbux-select
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm input-sm-ast"
									unselected-text="전체"
									jsondata-ref="jsonApcVrty"
									jsondata-value="itemVrtyCd"
									onchange="fn_onChangeSrchVrtyCd(this)"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;"></td>
<!-- 							<td class="td_input" style="border-right: hidden;"></td> -->
							<th scope="row" class="th_bg">규격</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-spcfctCd"
									name="srch-slt-spcfctCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonApcSpcfct"
								></sbux-select>
							</td>
							<td class="td_input"></td>
						</tr>
						<tr>
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
							<th scope="row" class="th_bg">저장창고</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-warehouseSeCd"
									name="srch-slt-warehouseSeCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonComWarehouse"
								></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg">표시등급</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-grdSeCd"
									name="srch-slt-grdSeCd"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonGrdSeCd"
									onchange="fn_onChangeSrchGrdSeCd(this)"
								></sbux-select>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
 				<div class="row">
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
</body>
<script type="text/javascript">

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}

	var jsonApcItem			= [];	// 품목 	itemCd			검색
	var jsonApcVrty			= [];	// 품종 	vrtyCd			검색
	var jsonApcSpcfct		= [];	// 규격 	spcfctCd		검색
	var jsonApcGrdDtl		= [];	// 등급 	grdCd			그리드헤더
	var jsonComWarehouse	= [];	// 창고 	warehouseSeCd	검색
	var jsonComFcltCd		= [];	// 선별기 	fcltCd			검색

	var jsonGrdSeCd	= [
		{text: "선별", value: _GRD_SE_CD_SORT},
		{text: "상품", value: _GRD_SE_CD_GDS},
	];
	
	/* 생산자 자동완성 */
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

	/**
	 * @name fn_getStdGrd
	 * @description 표준등급 json set
	 */
	const fn_getStdGrd = async function(_itemCd, _grdSeCd) {
		await gStdGrdObj.init(gv_selectedApcCd, _grdSeCd, _itemCd);
	}
    
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', 	gv_selectedApcCd),	// 선별기
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, 		gv_selectedApcCd),						// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, 		gv_selectedApcCd),						// 품종
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

		SBUxMethod.set("srch-dtp-wrhsYmdFrom", firstYmd);
		SBUxMethod.set("srch-dtp-wrhsYmdTo", lastYmd);

		let result = await Promise.all([
				fn_initSBSelect(),
				fn_getPrdcrs()
			]);

		fn_createGrid();
    }

    const fn_dtpChange = function(){
    	let inptYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
    	let inptYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
    	if(gfn_diffDate(inptYmdFrom, inptYmdTo) < 0){
    		//gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");//W0001{0}
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
    		SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
    		SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
    		return;
    	}
    }


    // grid
    // 선별실적
    var grdSortPrfmnc;
    var jsonSortPrfmnc = [];

    
    const columns1 = [
    	{
    		caption: ["전체",""], 			ref: 'checkedYn', 			type:'checkbox', 	width:'50px',	style:'text-align:center',
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
        {
    		caption: ["입고일자","입고일자"],		
    		ref: 'wrhsYmd',     		
    		type:'output',  	
    		width:'90px',	
    		style:'text-align:center',
        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
        },
        {
        	caption: ["팔레트번호","팔레트번호"], 		
        	ref: 'pltno',     			
        	type:'output',  	
        	width:'120px',  
        	style:'text-align:center'
        },            
        {
        	caption: ["생산자","생산자"], 	
        	ref: 'prdcrNm',  		
        	type:'output',  	
        	width:'80px',   
        	style:'text-align:center'
        },
        {
        	caption: ["품목","품목"],	    		
        	ref: 'itemNm', 				
        	type:'output',  	
        	width:'80px',   
        	style:'text-align:center'
        },
        {
        	caption: ["품종","품종"],	    		
        	ref: 'vrtyNm', 				
        	type:'output',  	
        	width:'80px',   
        	style:'text-align:center'
        },
        {
        	caption: ["입고","수량"],  			
        	ref: 'inptQntt',   			
        	type:'output',  	
        	width:'60px',   
        	style:'text-align:right',
        	format : {type:'number', rule:'#,###'}
        },
        {
        	caption: ["입고","중량 (Kg)"],  		
        	ref: 'inptWght',   			
        	type:'output',  	
        	width:'80px',   
        	style:'text-align:right',
        	format : {type:'number', rule:'#,###'}
        },
        {
        	caption: ["규격","규격"],  			
        	ref: 'spcfctNm',   			
        	type:'output',  	
        	width:'80px',   
        	style:'text-align:center'
        },
    ];
    
    const columnsGrd = [
    	{
    		caption: ["등급1","등급명"],  			
    		ref: 'grdNm1', 				
    		type:'output',  	
    		width:'80px',   
    		style:'text-align:center'
    	},
        {
    		caption: ["등급1","수량"],  			
    		ref: 'sortQntt1', 			
    		type:'output',  	
    		width:'80px',   
    		style:'text-align:right',
        	format : {type:'number', rule:'#,###'}
        },
    ];
    
    const columns2 = [
    	{
    		caption: ["선별 합계","수량"],  			
    		ref: 'sortQntt', 			
    		type:'output',  	
    		width:'60px',   
    		style:'text-align:right',
        	format : {type:'number', rule:'#,###'}
        },
        {
        	caption: ["선별 합계","중량 (Kg)"],  		
        	ref: 'sortWght', 			
        	type:'output',  	
        	width:'80px',   
        	style:'text-align:right',
        	format : {type:'number', rule:'#,###'}
        },
        {
        	caption: ["저장창고","저장창고"], 		
        	ref: 'warehouseSeNm', 		
        	type:'output',  	
        	width:'80px',	
        	style:'text-align:center'
        },
        {
        	caption: ["선별번호","선별번호"], 		
        	ref: 'sortno',     			
        	type:'output',  	
        	width:'120px',  
        	style:'text-align:center'
        },
        {
        	caption: ["비고","비고"], 			
        	ref: 'rmrk',  				
        	type:'output',  	
        	width:'200px',  
        	style:'text-align:center'
        },
        {caption: ["입고번호"],				ref: 'wrhsno', 				type:'output',  	hidden: true},
        {caption: ["선별번호"],				ref: 'sortno', 				type:'output',  	hidden: true},
        {caption: ["선별순번"],				ref: 'sortSn', 				type:'output',  	hidden: true},
        {caption: ["APC코드"],				ref: 'apcCd', 				type:'output',  	hidden: true},
        {caption: ["품목코드"],				ref: 'itemCd', 				type:'output',  	hidden: true},
        {caption: ["품종코드"],				ref: 'vrtyCd', 				type:'output',  	hidden: true},
        {caption: ["규격코드"],				ref: 'spcfctCd',			type:'output',  	hidden: true},
        {caption: ["저장창고코드"],				ref: 'warehouseSeCd', 		type:'output',  	hidden: true}
    ];
    
    
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
		//SBGridProperties.frozencols = 2;
		/*
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 1000,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
		*/

        SBGridProperties.columns = [];
		
		columns1.forEach((col) => {
			SBGridProperties.columns.push(col);
		});
		
	    if (gjsonStdGrdObj_1.length > 0) {
	    	gjsonStdGrdObj_1.forEach((item, index) => {
		    	const captionId = item.grdNm;
		    	const refSortQnttId = "sortQntt" + (index + 1);
		    	const refSortWghtId = "sortWght" + (index + 1);

		    	SBGridProperties.columns.push(
	    			{
	    				caption: [captionId,"수량"],  				
	    				ref: refSortQnttId, 			
	    				type:'output',  	
	    				width:'80px',   
	    				style:'text-align:right',
	                	format : {type:'number', rule:'#,###'}
	                },
	                {
	                	caption: [captionId,"중량 (KG)"],  		
	                	ref: refSortWghtId, 			
	                	type:'output',  	
	                	width:'80px',  
	                	style:'text-align:right',
	                	format : {type:'number', rule:'#,###'}
	                },
		    	);
		    });
	    } else {
	    	columnsGrd.forEach((col) => {
				SBGridProperties.columns.push(col);
			});
	    }
	    
		columns2.forEach((col) => {
			SBGridProperties.columns.push(col);
		});
		
        grdSortPrfmnc = _SBGrid.create(SBGridProperties);
        //grdSortPrfmnc.bind('click', fn_viewSortInpt);
        //grdSortPrfmnc.bind('beforepagechanged', fn_pagingSortPrfmnc);
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
		if (gfn_isEmpty(SBUxMethod.get("srch-dtp-wrhsYmdFrom")) || gfn_isEmpty(SBUxMethod.get("srch-dtp-wrhsYmdTo"))) {
    		gfn_comAlert("W0001", "선별일자");		//	W0002	{0}을/를 입력하세요.
            return;
    	}

		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		if (gfn_isEmpty(itemCd)){
			gfn_comAlert("W0001", "품목");			//	W0001	{0}을/를 선택하세요.
            return;
		}
		/*
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		if (gfn_isEmpty(vrtyCd)){
			gfn_comAlert("W0001", "품종");			//	W0001	{0}을/를 선택하세요.
            return;
		}
		*/

		// set pagination
    	grdSortPrfmnc.rebuild();
    	//let pageSize = grdSortPrfmnc.getPageSize();
    	let pageSize = 1;
    	let pageNo = 1;

    	// grid clear
    	jsonSortPrfmnc.length = 0;
    	grdSortPrfmnc.clearStatus();

    	//grdSortPrfmnc.movePaging(pageNo);
    	fn_setGrdSortPrfmnc(pageSize, pageNo);
	}

    /**
     * @name fn_pagingSortPrfmnc
     * @description 선별실적 페이징
	 */
	const fn_pagingSortPrfmnc = async function() {
		let pageSize = grdSortPrfmnc.getPageSize();   		// 몇개의 데이터를 가져올지 설정
		let pageNo = grdSortPrfmnc.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		var getColRef = grdSortPrfmnc.getColRef("checkedYn");
		grdSortPrfmnc.setFixedcellcheckboxChecked(1, getColRef, false);
		fn_setGrdSortPrfmnc(pageSize, pageNo);
	}

    /**
     * @name fn_setGrdSortPrfmnc
     * @description 선별실적 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
	const fn_setGrdSortPrfmnc = async function(pageSize, pageNo) {

		let wrhsYmdFrom = SBUxMethod.get("srch-dtp-wrhsYmdFrom");
		let wrhsYmdTo = SBUxMethod.get("srch-dtp-wrhsYmdTo");
    	let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");				// 생산자
  		let itemCd = SBUxMethod.get("srch-slt-itemCd");					// 품목
  		let itemVrtyCd = SBUxMethod.get("srch-slt-vrtyCd");				// 품종
  		let vrtyCd = "";
  		if(!gfn_isEmpty(itemVrtyCd)){
  			vrtyCd = itemVrtyCd.substr(4,7);
  		}
  		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");	// 창고
  		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");				// 규격
  		let grdSeCd = SBUxMethod.get("srch-slt-grdSeCd");				// 등급구분
  		let postUrl = _.isEqual(grdSeCd, _GRD_SE_CD_SORT)
  					? 	"/am/sort/selectSortPrfmncListByWrhs.do"
  						: "/am/sort/selectSortPrfmncListByWrhsForGdsGrd.do";
  		
		const postJsonPromise = gfn_postJSON(postUrl, {
			apcCd: gv_selectedApcCd,
			wrhsYmdFrom: wrhsYmdFrom,
			wrhsYmdTo: wrhsYmdTo,
			prdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
			spcfctCd: spcfctCd,
			warehouseSeCd: warehouseSeCd,

          	// pagination
  	  		pagingYn : 'N',
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
  	          			apcCd: item.apcCd,
	  	          		wrhsno: item.wrhsno,
	  	          		pltno: item.pltno,
	  	          		wrhsYmd: item.wrhsYmd,
	  	          		prdcrCd: item.prdcrCd,
	  	          		itemCd: item.itemCd,
	  	          		vrtyCd: item.vrtyCd,
	  	          		wrhsQntt: item.wrhsQntt,
	  	          		wrhsWght: item.wrhsWght,
	  	          		inptSn: item.inptSn,
	  	          		sortno: item.sortno,
	  	          		inptYmd: item.inptYmd,
	  	          		inptQntt: item.inptQntt,
	  	          		inptWght: item.inptWght,
	  	          		sortQntt: item.sortQntt,
	  	          		sortWght: item.sortWght,
	  	          		sortQntt1: item.sortQntt1,
	  	          		sortQntt2: item.sortQntt2,
	  	          		sortQntt3: item.sortQntt3,
	  	          		sortQntt4: item.sortQntt4,
	  	          		sortQntt5: item.sortQntt5,
	  	          		sortQntt6: item.sortQntt6,
	  	          		sortQntt7: item.sortQntt7,
	  	          		sortQntt8: item.sortQntt8,
	  	          		sortQntt9: item.sortQntt9,
	  	          		sortQntt10: item.sortQntt10,
	  	          		sortQntt11: item.sortQntt11,
	  	          		sortQntt12: item.sortQntt12,
	  	          		sortQntt13: item.sortQntt13,
	  	          		sortQntt14: item.sortQntt14,
	  	          		sortQntt15: item.sortQntt15,
	  	          		sortQntt16: item.sortQntt16,
	  	          		sortQntt17: item.sortQntt17,
	  	          		sortQntt18: item.sortQntt18,
	  	          		sortQntt19: item.sortQntt19,
	  	          		sortQntt20: item.sortQntt20,
	  	          		sortQntt21: item.sortQntt21,
	  	          		sortQntt22: item.sortQntt22,
	  	          		sortQntt23: item.sortQntt23,
	  	          		sortQntt24: item.sortQntt24,
	  	          		sortQntt25: item.sortQntt25,
	  	          		sortQntt26: item.sortQntt26,
	  	          		sortQntt27: item.sortQntt27,
	  	          		sortQntt28: item.sortQntt28,
	  	          		sortQntt29: item.sortQntt29,
	  	          		sortQntt30: item.sortQntt30,
	  	          		sortWght1: item.sortWght1,
	  	          		sortWght2: item.sortWght2,
	  	          		sortWght3: item.sortWght3,
	  	          		sortWght4: item.sortWght4,
	  	          		sortWght5: item.sortWght5,
	  	          		sortWght6: item.sortWght6,
	  	          		sortWght7: item.sortWght7,
	  	          		sortWght8: item.sortWght8,
	  	          		sortWght9: item.sortWght9,
	  	          		sortWght10: item.sortWght10,
	  	          		sortWght11: item.sortWght11,
	  	          		sortWght12: item.sortWght12,
	  	          		sortWght13: item.sortWght13,
	  	          		sortWght14: item.sortWght14,
	  	          		sortWght15: item.sortWght15,
	  	          		sortWght16: item.sortWght16,
	  	          		sortWght17: item.sortWght17,
	  	          		sortWght18: item.sortWght18,
	  	          		sortWght19: item.sortWght19,
	  	          		sortWght20: item.sortWght20,
	  	          		sortWght21: item.sortWght21,
	  	          		sortWght22: item.sortWght22,
	  	          		sortWght23: item.sortWght23,
	  	          		sortWght24: item.sortWght24,
	  	          		sortWght25: item.sortWght25,
	  	          		sortWght26: item.sortWght26,
	  	          		sortWght27: item.sortWght27,
	  	          		sortWght28: item.sortWght28,
	  	          		sortWght29: item.sortWght29,
	  	          		sortWght30: item.sortWght30,
	  	          		prdcrNm: item.prdcrNm,
	  	          		itemNm: item.itemNm,
	  	          		vrtyNm: item.vrtyNm,
	  	          		spcfctNm: item.spcfctNm,
	  	          		warehouseSeNm: item.warehouseSeNm,
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
			SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
			SBUxMethod.set("srch-slt-vrtyCd", prdcr.itemVrtyCd);
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

	const fn_onChangeSrchItemCd = async function (obj){

		jsonSortPrfmnc.length = 0;
		grdSortPrfmnc.rebuild();
		
		let itemCd = obj.value;
		if (gfn_isEmpty(itemCd)) {
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonApcSpcfct, 	"");
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, 	gv_selectedApcCd);			// 품종
		} else {
			let result = await Promise.all([
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonApcSpcfct, 	gv_selectedApcCd, itemCd),			// 규격
				gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, 	gv_selectedApcCd, itemCd)			// 품종
			]);
		}
		
		const grdSeCd = SBUxMethod.get("srch-slt-grdSeCd");
		await fn_getStdGrd(itemCd, grdSeCd);
		
		fn_createGrid();
	}
	
	const fn_onChangeSrchGrdSeCd = async function (obj){

		jsonSortPrfmnc.length = 0;
		grdSortPrfmnc.rebuild();
		
		const grdSeCd = obj.value;
		const itemCd = SBUxMethod.get("srch-slt-itemCd");
		await fn_getStdGrd(itemCd, grdSeCd);
		
		fn_createGrid();
	}
	

	const fn_onChangeSrchVrtyCd = async function(obj){
		let vrtyCd = obj.value;
		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");

		if(!gfn_isEmpty(vrtyCd)){

			const vrtyInfo = _.find(jsonApcVrty, {itemVrtyCd: vrtyCd});

			const itemCd = vrtyInfo.mastervalue;

			if (itemCd != prvItemCd) {
				SBUxMethod.set("srch-slt-itemCd", itemCd);
				await fn_onChangeSrchItemCd({value: itemCd});
				SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
			}
		}else{
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonApcSpcfct, gv_selectedApcCd, SBUxMethod.get("srch-slt-itemCd"));
		}
	}

	/**
	 * @name fn_docSortByWrhs
	 * @description 선별확인서(입고별) 발행
	 */
	const fn_docSortByWrhs = async function() {
		const sortnoList = [];
		const wrhsnoList = [];
		const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'ST_DOC1');
		const allData = grdSortPrfmnc.getGridDataAll();
		
		allData.forEach((item) => {
			if (item.checkedYn === "Y") {
				sortnoList.push(item.sortno);
				wrhsnoList.push(item.wrhsno);
    		}
		});
		

 		if (sortnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}
 		
 		const wrhsno = wrhsnoList.join("','");
 		const sortno = sortnoList.join("','");
 		const itemCd = SBUxMethod.get("srch-slt-itemCd");
 		const grdSeCd = SBUxMethod.get("srch-slt-grdSeCd");				// 등급구분
 		
 		gfn_popClipReport(
 				"선별확인서(입고별)", 
 				rptUrl, 
 				{
 					apcCd: gv_selectedApcCd, 
 					wrhsno: wrhsno, 
 					sortno: sortno,
 					itemCd: itemCd,
 					grdSeCd: grdSeCd
 				}
 			);
 		//gfn_popClipReport("선별확인서", "am/sortIdntyDoc.crf", {apcCd: gv_selectedApcCd, sortnoSn: sortnoSn, sortno: sortno});
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

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>